{{
  Purpose:
    To represent Memo field in dbgrid.
}
unit IntfGridMemoAgent;

interface
uses
  classes, SysUtils, Windows, {$ifdef ver15}Types,{$endif}Controls,DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, FormMemo, Forms;
type
  TGridMemoAgent = class(TGridComponentAgent)
  protected
    ReadOnly : boolean;

    MemoDb : TDbMemo;  // created in constructor;

    procedure SetVisible(const Value: boolean);  override;
    function GetFirstLine(const s : string) : string;

    procedure HandlePopupExit(Sender : TObject; const s : string);
    procedure HandleDbMemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    //: Popup an edit window. Return true if change is made.
    function Popup : boolean;

    //: Give MemoDb an event handling function for dbl-click
    procedure HandleDblClickOfMemoDb(Sender : TObject);
    procedure HandleExitOfMemoDb(Sender : Tobject);

  public
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
                const aReadOnly : boolean = false);   overload;
    // I don't like to depend on TCustomDbGrid.Readonly

    constructor Create(AOwner : TCustomForm; const Fieldname : string; AGrid : TCustomDBGrid;
                const aReadOnly : boolean = false);   overload;
  end;

implementation
uses
  StrUtils;
{ TGridMemoAgent }

constructor TGridMemoAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; const aReadOnly : boolean);
begin
  inherited Create(AOwner, AColumn, AGrid);

  MemoDb := TDbMemo.Create(AOwner);
  MemoDb.Parent := AGrid;
  MemoDb.Visible := false;
  MemoDb.Color := AColumn.Color;
  MemoDb.Font := AColumn.Font;

  MemoDb.Ctl3D := true;
  MemoDb.BorderStyle := bsNone;
  MemoDb.ReadOnly := true;

  MemoDb.Color := clInactiveCaption;
//  AColumn.Color := clInactiveCaption;
//  MemoDb.TabStop := false; did not work, becasue most wincontrols don't eat TAB
//  MemoDb.TabOrder := -1;
  MemoDb.WantTabs := true;  // to eat TAB then move to another column
  MemoDb.OnKeyDown :=  HandleDbMemoKeyDown;

  ReadOnly := aReadOnly;

//  if not ReadOnly then
//  begin
    MemoDb.DataSource := AGrid.DataSource;
    MemoDb.DataField := AColumn.FieldName;
//    MemoDb.ReadOnly := aReadOnly;


    MemoDb.OnClick := HandleDblClickOfMemoDb;
    MemoDb.OnExit := HandleExitOfMemoDb;
//  end;

end;

constructor TGridMemoAgent.Create(AOwner: TCustomForm;
  const Fieldname: string; AGrid: TCustomDBGrid; const aReadOnly: boolean);
begin
  Create(Aowner, GetColumn(AGrid, FieldName), AGrid, aReadOnly);
end;

function TGridMemoAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState) : boolean;
var
  DrawRect: TRect;
//  kkfm : TFmMemo;
  p : TPoint;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State)   then
  begin
     MemoDb.Left := ARect.Left+2;
     MemoDb.Top := ARect.Top+2;
     MemoDb.Width := ARect.Right - ARect.Left-4;
     MemoDb.Height := ARect.Bottom - ARect.Top-4;
     Visible := True;
     MemoDb.WordWrap := false;

  end
  else
  begin
      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);
      TheCanvas.TextRect(ARect, ARect.Left+2, ARect.Top+2,  GetFirstLine(Column.Field.AsString) );
  end;

  Result := true;
end;

function TGridMemoAgent.GetFirstLine(const s: string): string;
begin
  Result := LeftStr(s, POS(#13#10,s)-1 ) ;
  if Result = '' then
    Result := s;
end;

procedure TGridMemoAgent.HandleDblClickOfMemoDb(Sender: TObject);
begin
  Popup;
end;

procedure TGridMemoAgent.HandleDbMemoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_CONTROL then
    Popup
  else if Key = VK_TAB then
  begin
    if ssShift in Shift then
      TheGrid.SelectedIndex := TheGrid.SelectedIndex -1
    else
      TheGrid.SelectedIndex := TheGrid.SelectedIndex + 1;
    TheGrid.SetFocus;
  end;

end;

procedure TGridMemoAgent.HandleExitOfMemoDb(Sender: Tobject);
begin
  if MemoDb.Modified then
  begin
//    Column.Field.DataSet.Edit;
    Column.Field.AsString := MemoDb.Text;
  end;

  Visible := false;
end;

procedure TGridMemoAgent.HandlePopupExit(Sender: TObject; const s: string);
begin
    Column.Field.DataSet.Edit;
    Column.Field.AsString := s;
//Force focud back to screen otherwise the focus could go anywhere..
    TheGrid.SetFocus;
end;

function TGridMemoAgent.Popup: boolean;
var
  p : TPoint;
  kkfm : TFmMemo;
begin
       p := TheGrid.ClientToScreen( Point(MemoDb.Left,  MemoDb.Top  ) );
       kkfm := TFmMemo.Create(self, Column.Field.AsString, HandlePopupExit, ReadOnly );
       kkfm.ShowAt(p.X, p.Y, MemoDb.Height, false , MemoDb.SelStart);
end;

procedure TGridMemoAgent.SetVisible(const Value: boolean);
begin
  MemoDb.Visible := VAlue;
  if Value then
    TheOwner.ActiveControl := MemoDb;
end;

end.
