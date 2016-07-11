{{
  Purpose:
    To represent true/false values in DBGrid;
}
unit IntfGridCheckboxAgent;

interface
uses
  classes, SysUtils, Windows, Forms, {$IFDEF VER150}Types, {$ENDIF}Controls,DbCtrls, DbGrids, db, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, Stdctrls, Messages;
type
  TCheckboxForTab = class(TCheckbox)
  private
    FOnTab: TNotifyEvent;
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    property OnTab : TNotifyEvent read FOnTab write FOnTab;
  end;


  //: Checkbox in DbGrid
  TGridCheckboxAgent = class(TGridComponentAgent)
  protected
    ChkDb : TCheckboxForTab;  // created in constructor;
    TheMouseDown : boolean;
    procedure SetVisible(const Value: boolean);  override;

    // the field could be boolean or integer, 0 false, 1 true
    function FieldBoolean : boolean;
    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean;  override;

    procedure HandleExitOfPicker(Sender : Tobject);
    procedure HandleChange(Sender : TObject);

    procedure HandleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HandleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer) ;

    procedure HandleTab(Sender : TObject);

  public
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid); overload; override;
    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid); overload; override;


  end;

  //: Use two image components to represent true/false values in DbGrid;
  TGridPicBoolAgent = class(TGridComponentAgent)
  protected
    TruePic : TImage;  // reference to client picture
    FalsePic : TImage;

    procedure SetVisible(const Value: boolean);  override;

    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

  public
    Constructor Create(AOwner : TCustomForm;  AColumn : TColumn; AGrid : TCustomDBGrid;
        ATruePic, AFalsePic : TImage); overload;
    Constructor Create(AOwner : TCustomForm;  const FieldName : string; AGrid : TCustomDBGrid;
        ATruePic, AFalsePic : TImage); overload;
  end;

implementation
uses  JclSysInfo;

{ TGridCheckboxAgent }

constructor TGridCheckboxAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid);
begin
  inherited Create(AOwner, AColumn, AGrid);

  ChkDb := TCheckboxForTab.Create(self);
  ChkDb.Parent := AGrid.Parent;// AOwner;
  ChkDb.Visible := false;
  ChkDb.Color := AColumn.Color;
  ChkDb.Enabled := not AColumn.ReadOnly;

//  ChkDb.DataSource := AGrid.DataSource;
//  ChkDb.DataField := AColumn.FieldName;

  ChkDb.OnTab := HandleTab;
  ChkDb.OnExit := HandleExitOfPicker;
//  ChkDb.OnClick := HandleChange;     // when the grid is the parent, the grid will eat onclick of the checkbox.
  ChkDb.OnMouseDown := HandleMouseDown;
  ChkDb.OnMouseUp := HandleMouseUp;

end;

constructor TGridCheckboxAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid);

end;

function TGridCheckboxAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState) : boolean;
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if ((gdFocused in State) and (ChkDb.Enabled))then
  begin
     ChkDb.Width := ARect.Right - ARect.Left;
     ChkDb.Height := ARect.Bottom - ARect.Top;
     ChkDb.Left := ARect.Left + TheGrid.Left + 2;
     ChkDb.Top := ARect.Top+ TheGrid.top + 2;
     ChkDb.Visible := True;
     ChkDb.Checked := FieldBoolean;
  end
  else
  begin
      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[ FieldBoolean];

      TheCanvas.FillRect(ARect);
      Application.ProcessMessages;
      DrawFrameControl(TheCanvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
  end;

  Result := true;
end;

function TGridCheckboxAgent.FieldBoolean: boolean;
begin
  if Column.Field.DataType = ftBoolean then
    Result := Column.Field.AsBoolean
  else if Column.Field.DataType in [ftSmallint, ftInteger] then
    Result := Column.Field.AsInteger <> 0
  else
    raise Exception.Create('Checked field must be boolean or integer.');

end;

procedure TGridCheckboxAgent.HandleChange(Sender: TObject);
begin
  Column.Field.DataSet.Edit;
  if Column.Field.DataType = ftBoolean then
    Column.Field.AsBoolean := ChkDb.Checked
  else if Column.Field.DataType in [ftSmallInt, ftInteger] then
  begin
    if ChkDb.Checked then
      Column.Field.AsInteger := 1
    else
      Column.Field.AsInteger := 0;
  end;

end;

procedure TGridCheckboxAgent.HandleExitOfPicker(Sender: Tobject);
begin
  Visible := false;
end;

procedure TGridCheckboxAgent.HandleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TheMouseDown := true;
end;

procedure TGridCheckboxAgent.HandleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (TheMousedown) and (x < ChkDb.Width) and (x>0) and (y< ChkDb.Height) and (y>0) then
  begin
    Column.Field.DataSet.Edit;
    ChkDb.Checked := not FieldBoolean;// not ChkDb.Checked;
    if Column.Field.DataType = ftBoolean then
      Column.Field.AsBoolean := ChkDb.Checked
    else if Column.Field.DataType in [ftSmallInt, ftInteger] then
    begin
      if ChkDb.Checked then
        Column.Field.AsInteger := 1
      else
        Column.Field.AsInteger := 0;
    end;
  end;


  TheMouseDown := false;


end;

procedure TGridCheckboxAgent.HandleTab(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  -1
  else
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  + 1;

  TheGrid.SetFocus;

end;

procedure TGridCheckboxAgent.SetVisible(const Value: boolean);
begin
  ChkDb.Visible := Value;

  if Value then
    TheOwner.ActiveControl := ChkDb;
end;

{ TGridPicBoolAgent }

constructor TGridPicBoolAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; ATruePic, AFalsePic: TImage);
begin
  inherited Create(AOwner, AColumn, AGrid);

  TruePic := ATruePic;
  FalsePic := AFalsePic;

  TruePic.Visible := false;  // programmer need not worry about setting its visible to false.
  FalsePic.Visible := false;
end;

constructor TGridPicBoolAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid; ATruePic,
  AFalsePic: TImage);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, ATruePic, AFalsePic);
end;

function TGridPicBoolAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState) : boolean;
var
  DrawRect: TRect;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);

      Application.ProcessMessages;
      
        if Column.Field.AsBoolean  then
//          GridSearch.Canvas.CopyRect(Rect, ImgYes.Canvas, ImgYes.ClientRect )
          TheCanvas.draw( ARect.Left + ((ARect.Right-ARect.Left)-TruePic.Width) div 2,
                ARect.Top + ((ARect.Bottom-ARect.Top)-TruePic.Height) div 2, TruePic.Picture.Graphic)
        else
          TheCanvas.draw(  ARect.Left + ((ARect.Right-ARect.Left)-TruePic.Width) div 2,
                ARect.Top + ((ARect.Bottom-ARect.Top)-TruePic.Height) div 2, FalsePic.Picture.Graphic);

  Result := true;

end;


procedure TGridPicBoolAgent.SetVisible(const Value: boolean);
begin
  // do nothing

end;

{ TCheckboxForTab }

procedure TCheckboxForTab.WndProc(var Message: TMessage);
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
