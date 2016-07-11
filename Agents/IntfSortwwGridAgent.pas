unit IntfSortwwGridAgent;

interface
uses
  Classes, wwDbGrid, wwDbiGrd, IntfSortGridAgent, Graphics,IntfHelpers, db, DbGrids;
type
  TDbGridClickEvent = procedure(Sender : TObject;FieldName : string) of object;

  //: Provide sort services for standard Delphi DBGrid and TColumn
  TSortwwGridAgent = class(TSortAgent)
  protected

    OriginTitle : string;  // only work for TColumn

  protected
    ClientOnTitleClick : TDBGridClickEvent;
    TheGrid : TwwDbGrid;
    SortHelper : TSortHelper;
     OldDatasetOpenEvent : TDatasetNotifyEvent;

    OriginColumn : TwwColumn;
    procedure HandleDatasetOpen(Sender : TDataset);
    procedure RefreshTitles;
    function ColumnSortable(c : TColumn) : boolean;

  public
    constructor CreateForSort(AOwner : TComponent;  AGrid : TwwDbGrid; aSortHelper : TSortHelper ); overload;
    destructor Destroy; override;
    function SortSingle(c : TwwColumn) : boolean; overload;

    procedure HandleTitleClick(Sender : TObject; FieldName : string);

    procedure NoSort;


  end;

implementation


{ TSortwwGridAgent }

procedure TSortwwGridAgent.NoSort;
begin
  if OriginColumn <> nil then
    OriginColumn.DisplayLabel := OriginTitle;

  OriginColumn := nil;
end;

function TSortwwGridAgent.SortSingle(c: TwwColumn): boolean;
begin
  if OriginColumn <> nil then
    OriginColumn.DisplayLabel := OriginTitle;

  if c<>OriginColumn then
  begin
    OriginTitle := c.DisplayLabel;
    OriginColumn := c;
  end;

  Result := SortSingle(c.FieldName);

  if Result then
    OriginColumn.DisplayLabel := OriginTitle + ' +'
  else
    OriginColumn.DisplayLabel := OriginTitle + ' -';

end;

constructor TSortwwGridAgent.CreateForSort(AOwner: TComponent; AGrid: TwwDbGrid; aSortHelper : TSortHelper);
var
  gg : TwwDbGrid;
  i : integer;
begin
  inherited CreateForSort(AOwner,  AGrid.DataSource.DataSet, aSortHelper);
  TheGrid := AGrid;
  SortHelper := aSortHelper;
  gg := TheGrid;
  if TheGrid <> nil then
  begin                   
    ClientOnTitleClick := gg.OnTitleButtonClick;
    gg.OnTitleButtonClick := HandleTitleClick;
    OldDatasetOpenEvent := Dataset.AfterOpen;
    Dataset.AfterOpen := HandleDatasetOpen;
  end;

  if Dataset.Active then
    RefreshTitles;
   gg.TitleColor := clYellow;

end;

procedure TSortwwGridAgent.HandleTitleClick(Sender : TObject; FieldName : string);
begin
  if Assigned(ClientOnTitleClick) then
    ClientOnTitleClick(Sender, FieldName);

  if TheGrid.DataSource.DataSet.Active then
    SortSingle(TheGrid.ColumnByName(FieldName));
end;

destructor TSortwwGridAgent.Destroy;
begin
  Dataset.AfterOpen := OldDatasetOpenEvent;
  SortHelper.Free;
  inherited;

  inherited;
end;

procedure TSortwwGridAgent.HandleDatasetOpen(Sender: TDataset);
begin
  if Assigned(OldDatasetOpenEvent) then
    OldDatasetOpenEvent(Sender);
  if TheGrid.Visible then
  RefreshTitles;

end;

procedure TSortwwGridAgent.RefreshTitles;
var
  i : integer;
begin
  for i := 0 to TheGrid.GetColCount - 1 do
  begin
//    if ColumnSortable(TheGrid.Columns[i]) then
 //     TheGrid.Columns[i].Title.Color := clYellow;
  end;

end;

function TSortwwGridAgent.ColumnSortable(c: TColumn): boolean;
begin
  if Dataset.Active then
    result := (C.Field.FieldKind <> fkCalculated) and (not (C.Field is TMemoField))
  else
    result := false;

end;

end.
