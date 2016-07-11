{{
  Purpose:
    from UTF8 Datasource, present WideString of Unicode
}
unit IntfGridUtf8ToUnicodeAgent;

interface
uses
  classes, SysUtils, Windows, {$ifdef ver15}Types,{$endif}Controls,DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent,  Forms, TntGraphics, TntStdCtrls, Messages, JclSysInfo;
type
  TTntEditForTab = class(TTntEdit)
  private
    FOnTab: TNotifyEvent;
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    property OnTab : TNotifyEvent read FOnTab write FOnTab;
  end;


  TGridUtf8ToUnicodeAgent = class(TGridComponentAgent)
  protected
    ReadOnly : boolean;

    TheEdit : TTntEditForTab;  // created in constructor;

    procedure SetVisible(const Value: boolean);  override;
    function GetFirstLine(const s : string) : string;

    procedure HandleEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    procedure HandleDblClickOfEdit(Sender : TObject);
    procedure HandleExitOfEdit(Sender : Tobject);
    procedure HandleTab(Sender : TObject);

  public
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
                const aReadOnly : boolean = false);   overload;
    // I don't like to depend on TCustomDbGrid.Readonly

    constructor Create(AOwner : TCustomForm; const Fieldname : string; AGrid : TCustomDBGrid;
                const aReadOnly : boolean = false);   overload;
  end;

implementation
uses
  StrUtils, JclStringConversions;

constructor TGridUtf8ToUnicodeAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; const aReadOnly : boolean);
begin
  inherited Create(AOwner, AColumn, AGrid);

  TheEdit := TTntEditForTab.Create(AOwner);
  TheEdit.Parent := AGrid;
  TheEdit.Visible := false;
  TheEdit.Color := AColumn.Color;
  TheEdit.Font := AColumn.Font;

  TheEdit.Ctl3D := true;
  TheEdit.BorderStyle := bsNone;
  TheEdit.ReadOnly := true;

  TheEdit.Color := clInactiveCaption;
//  AColumn.Color := clInactiveCaption;
//  TheEdit.TabStop := false; did not work, becasue most wincontrols don't eat TAB
//  TheEdit.TabOrder := -1;
  TheEdit.OnKeyDown :=  HandleEditKeyDown;
  TheEdit.OnTab := HandleTab;

  ReadOnly := aReadOnly;


    TheEdit.OnClick := HandleDblClickOfEdit;
    TheEdit.OnExit := HandleExitOfEdit;
//  end;

end;

constructor TGridUtf8ToUnicodeAgent.Create(AOwner: TCustomForm;
  const Fieldname: string; AGrid: TCustomDBGrid; const aReadOnly: boolean);
begin
  Create(Aowner, GetColumn(AGrid, FieldName), AGrid, aReadOnly);
end;

function TGridUtf8ToUnicodeAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState) : boolean;
var
  DrawRect: TRect;
//  p : TPoint;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State) and (not ReadOnly)   then
  begin
     TheEdit.Left := ARect.Left+2;
     TheEdit.Top := ARect.Top+2;
     TheEdit.Width := ARect.Right - ARect.Left-4;
     TheEdit.Height := ARect.Bottom - ARect.Top-4;
     TheEdit.Text := Utf8ToWideString( Column.Field.AsString);
     Visible := True;

  end
  else
  begin
      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);
      WideCanvasTextRect(TheCanvas, ARect, ARect.Left+2, ARect.Top+2, Utf8ToWideString(Column.Field.AsString));
  end;

  Result := true;
end;

function TGridUtf8ToUnicodeAgent.GetFirstLine(const s: string): string;
begin
  Result := LeftStr(s, POS(#13#10,s)-1 ) ;
  if Result = '' then
    Result := s;
end;


procedure TGridUtf8ToUnicodeAgent.HandleDblClickOfEdit(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  -1
  else
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  + 1;

  TheGrid.SetFocus;

end;

procedure TGridUtf8ToUnicodeAgent.HandleEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_TAB then
  begin
    if ssShift in Shift then
      TheGrid.SelectedIndex := TheGrid.SelectedIndex -1
    else
      TheGrid.SelectedIndex := TheGrid.SelectedIndex + 1;
    TheGrid.SetFocus;
  end;

end;

procedure TGridUtf8ToUnicodeAgent.HandleExitOfEdit(Sender: Tobject);
begin
  if TheEdit.Modified then
  begin
//    Column.Field.DataSet.Edit;
    Column.Field.AsString := TheEdit.Text;
  end;

  Visible := false;
end;

procedure TGridUtf8ToUnicodeAgent.HandleTab(Sender: TObject);
begin

end;

procedure TGridUtf8ToUnicodeAgent.SetVisible(const Value: boolean);
begin
  TheEdit.Visible := VAlue;
  if Value then
    TheOwner.ActiveControl := TheEdit;
end;

{ TTntEditForTab }

procedure TTntEditForTab.WndProc(var Message: TMessage);
var
  c : TCMDialogKey;
begin
  c := TCMDialogKey(Message);
     // message with charcode=vk_tabl will come 4 times, I have to eat the first one
    If (c.CharCode = VK_TAB) and (c.Msg = 48384) Then
    Begin
      if Assigned(OnTab) then
      begin
        OnTab(self);
        Message.Result := 1;
        Exit;
      end;
    End;

  inherited;

end;

end.
