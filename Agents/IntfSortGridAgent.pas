{{
  Purpose:
    To provide sort services to dataset objects or TCustomDbGrid descendents.
    The dataset has to be TCustomAdoDataset at the moment.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:
    The other dataset could be supported through editing SortSingleField(), since
    different datasets have different implementation of sorting.

  Revision: 2006-2-3
  Remove coupling with different types of dataset by introducing helper class of sorting.
  The client is responsible to give an instance of appropriate helper class to the sort agent.
}
unit IntfSortGridAgent;

interface
uses
  classes, Forms, Dialogs, SysUtils, Controls, Db,  DbGrids, Graphics, IntfHelpers,
  IntfSortAgent;
type


  TSortGridAgent = class( TSortAgent )

  protected
    ClientOnTitleClick : TDBGridClickEvent;
    TheGrid : TCustomDbGrid;
    
    OriginTitle : string;
    OriginColumn : TColumn;

    OldDatasetOpenEvent : TDatasetNotifyEvent;

    function ColumnSortable(c : TColumn) : boolean;

    procedure HandleTitleClick(Column: TColumn);
    procedure HandleDatasetOpen(Sender : TDataset);

    procedure RefreshTitles;
  public
    //: The helper will be free inside
    constructor CreateForSort(AOwner : TComponent;  AGrid : TCustomDbGrid ; aSortHelper : TSortHelper); overload;
    destructor Destroy; override;

    function SortSingle(c : TColumn) : boolean; overload;


    procedure NoSort;   override;


  end;

implementation


{ TSortGridAgent }

procedure TSortGridAgent.NoSort;
begin
  if OriginColumn <> nil then
    OriginColumn.Title.Caption := OriginTitle;

  OriginColumn := nil;
end;

function TSortGridAgent.SortSingle(c: TColumn): boolean;
begin
  if OriginColumn <> nil then
    OriginColumn.Title.Caption := OriginTitle;

  if c<>OriginColumn then
  begin
    OriginTitle := c.Title.Caption;
    OriginColumn := c;
  end;

  Result := SortSingle(c.FieldName);

  if Result then
    OriginColumn.Title.Caption := OriginTitle + ' +'
  else
    OriginColumn.Title.Caption := OriginTitle + ' -';

end;

constructor TSortGridAgent.CreateForSort(AOwner: TComponent; AGrid: TCustomDbGrid; aSortHelper : TSortHelper);
var
  gg : TDbGrid;
  i : integer;
begin
  inherited CreateForSort(AOwner, AGrid.DataSource.DataSet, aSorthelper);
  TheGrid := AGrid;
  gg := TheGrid as TDbGrid;
  if TheGrid <> nil then
  begin
    ClientOnTitleClick := gg.OnTitleClick ;
    gg.OnTitleClick := HandleTitleClick;

    OldDatasetOpenEvent := Dataset.AfterOpen;
    Dataset.AfterOpen := HandleDatasetOpen;
  end;

  if Dataset.Active then
    RefreshTitles;
end;

procedure TSortGridAgent.HandleTitleClick(Column: TColumn);
begin
  if Assigned(ClientOnTitleClick) then
    ClientOnTitleClick(Column);

  if not ColumnSortable(Column) then
    exit;

  if TheGrid.DataSource.DataSet.Active then
    SortSingle(Column);
end;

function TSortGridAgent.ColumnSortable(c: TColumn): boolean;
begin
  if Dataset.Active then
    result := (C.Field.FieldKind <> fkCalculated) and (not (C.Field is TMemoField))
  else
    result := false;
end;

procedure TSortGridAgent.HandleDatasetOpen(Sender: TDataset);
begin
  if Assigned(OldDatasetOpenEvent) then
    OldDatasetOpenEvent(Sender);
  if TheGrid.Visible then
  RefreshTitles;
end;

destructor TSortGridAgent.Destroy;
begin
  Dataset.AfterOpen := OldDatasetOpenEvent;
  SortHelper.Free;
  inherited;
end;

procedure TSortGridAgent.RefreshTitles;
var
  i : integer;
begin
  for i := 0 to (TheGrid as TDbGrid).Columns.Count -1 do
  begin
    if ColumnSortable((TheGrid as TDbGrid).Columns[i]) then
      (TheGrid as TDbGrid).Columns[i].Title.Color := clYellow;
  end;

end;

end.
