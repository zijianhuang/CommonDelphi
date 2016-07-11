unit InitialGrid;
{
  Purpose:
  provide a StringGrid that eat a StringList from the client. Each grid
  will hold a string that is expected 1-3 byte, representing a character.

  Features:
  1. The client may assign a stringlist, and the visual effect will appear at once.
  2. The grid count is the same as the string count.
  3. No fixed line and column. And the property is hidden from the object inspector.
  4. Grid lines are created enough for holding strings. When resizing the StringGrid,
  grids will be re-arranged, so no scollbars will be needed.
  5. Select a grid will trigger OnInitialClick event.
  6. DefaultRowHeigh and DefaultColWidth are determined by font defined.


  The construction of this component also outlines basic skills of creating new components.
  * Create new event. (OnInitialClick)
  * Change (override) default event behavior. (OnSelectCell, OnResize)
  * The new default event behavior of OnSelectCell will trigger OnInitialClick.
  * Assign icon for design
  * Remove some published properties from the object inspector

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, TntGrids,
  Grids{$ifdef ver130}, DsgnIntf{$else}, DesignIntf{$endif}, TntClasses;

type
  TInitialClickEvent=procedure(Sender : TObject; const c : WideString) of object;

  TCustomInitialGrid = class(TTntStringGrid)
  private
    FOnInitialClick: TInitialClickEvent;

    function GetInitialsCount : integer;
  protected
    GridColCount : integer;
    StringsBuffer : TTntStringList;
    OldWidth : integer;

    property OnInitialClick : TInitialClickEvent read FOnInitialClick write FOnInitialClick;

    procedure SetGridColCount;

    procedure InitialClick(const c : Widestring);

    procedure HandleSelectCell(Sender: TObject; ACol, ARow: Longint; var CanSelect: Boolean);

    procedure HandleResize(Sender : TObject);

  public
    //: How many grids or characters
    property InitialsCount : integer read GetInitialsCount;

    constructor Create(AOwner : TComponent) ; override;
    destructor Destroy; override;

    procedure AssignInitial(initials : TTntStringList);
    //: Reassign strings to grids
    procedure UpdateGrid;

    //: To Accept string list from outside, for example, get them in a loop. Generally run UpdateGrid following.
    property Strings : TTntStringList read StringsBuffer;
  published
    { Published declarations }
  end;

 TInitialGrid = class(TCustomInitialGrid)

 published
    property OnInitialClick;
  end;
  
procedure Register;

implementation


procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(integer),TCustomInitialGrid,'FixedCols',nil);
  RegisterPropertyEditor(TypeInfo(integer),TCustomInitialGrid,'FixedRows',nil);
  RegisterPropertyEditor(TypeInfo(TColor),TCustomInitialGrid,'FixedColor',nil);

  RegisterPropertyEditor(TypeInfo(TSelectCellEvent),TCustomInitialGrid,'OnSelectCell',nil);
  
  RegisterComponents('Samples', [TInitialGrid]);


end;

{ TCustomInitialGrid }

procedure TCustomInitialGrid.SetGridColCount;
begin
  DefaultColWidth:=abs(Font.Height)+4;
  DefaultRowHeight:=DefaultColWidth;

  GridColCount:=(ClientWidth-2) div (DefaultColWidth+1);
  if GridColCount<4 then GridColCount:=4;

end;

procedure TCustomInitialGrid.AssignInitial(initials: TTntStringList);
begin
  StringsBuffer.Assign(Initials);
  UpdateGrid;
end;

constructor TCustomInitialGrid.Create(AOwner: TComponent);
begin
  inherited;

  FixedRows:=0;
  FixedCols:=0;

  Cursor:=crHandPoint;

  Options:=Options-[goRangeSelect]+[goDrawFocusSelected, goThumbTracking];
  OnSelectCell:=HandleSelectCell;
  OnResize:=HandleResize;

  StringsBuffer:=TTntStringList.Create;
  StringsBuffer.Duplicates := dupIgnore;
  StringsBuffer.Sorted := true;
end;

procedure TCustomInitialGrid.InitialClick(const c: Widestring);
begin
    if Assigned(OnInitialClick) then
      OnInitialClick(self, c);

end;

procedure TCustomInitialGrid.HandleSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (Cells[ACol, Arow]<>'') or ((ACol=0) and (Arow=0)) then
    InitialClick(Cells[ACol, Arow])
  else
    CanSelect:=false;

end;

procedure TCustomInitialGrid.HandleResize(Sender: TObject);
begin
  if OldWidth<> Width then // OnResize might occur 3 times, and this will make it once only.
  begin
    OldWidth := Width;
  UpdateGrid;
  end;
end;

procedure TCustomInitialGrid.UpdateGrid;
var  i, j : integer;
begin
  j:=0;
  SetGridColCount;

  ColCount:=GridColCount;
  RowCount:=1;
  for i:=0 to GridColCount-1 do
    Rows[0][i]:='';

  Application.ProcessMessages;

  Rows[rowCount-1].BeginUpdate;
  for i:=0 to StringsBuffer.Count-1 do
  begin
      Rows[rowCount-1][j]:=  StringsBuffer[i];
      j:=(j+1) mod GridColCount;
      if (j=0) and (i<=StringsBuffer.count) then
      begin
        Rows[rowCount-1].EndUpdate;
        RowCount:=RowCount+1;
        Rows[rowcount-1].BeginUpdate;
      end;
  end;    // for

  for i:=j to GridColCount-1 do
    Rows[RowCount-1][i]:='';

  Rows[rowCount-1].EndUpdate;

  if (RowCount>1) and (Rows[RowCount-1][0]='') then
    RowCount:=RowCount-1;

  Col:=0;
  Row:=0;


end;

destructor TCustomInitialGrid.Destroy;
begin
  StringsBuffer.Free;
  inherited;

end;


function TCustomInitialGrid.GetInitialsCount: integer;
begin
  Result:=StringsBuffer.Count;
end;

end.
