{{
  Purpose:        
    To have date lookup in dbgrid.
}
unit IntfGridDateAgent;

interface
uses
  classes, SysUtils, Windows,{$IFNDEF VER130} Types, Variants, {$endif} Controls, Forms, DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, ComCtrls, Messages;
type
  TDatetimePickerForTab = class(TDateTimePicker)
  private
    FOnTab: TNotifyEvent;
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    property OnTab : TNotifyEvent read FOnTab write FOnTab;
  end;

  //: To present a date picker in the dbgrid
  TGridDateAgent = class(TGridComponentAgent)

  protected

    DatePicker : TDateTimePickerForTab;  // Reference to client LookupCombo
    procedure SetVisible(const Value: boolean);  override;
    
    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    procedure HandleExitOfPicker(Sender : Tobject);
    procedure HandleChange(Sender : TObject);

    procedure HandleTab(Sender : TObject);

  public
    {{

    }
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
        APicker : TDateTimePicker ); overload; virtual;

    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid;
        APicker : TDateTimePicker ); overload; virtual;
  end;
implementation
uses  JclSysInfo;
{ TGridDateAgent }

constructor TGridDateAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; APicker: TDateTimePicker);
begin
  inherited Create(AOwner, AColumn, AGrid);

  APicker.Visible := false;
//  DatePicker := APicker;
  DatePicker := TDatetimePickerForTab.Create(self);
  DatePicker.Parent := AGrid;
  DatePicker.Visible := false;
  DatePicker.OnTab := HandleTab;

  DatePicker.DateFormat := APicker.DateFormat;
  DatePicker.Kind  := APicker.Kind;
  DatePicker.MaxDate := APicker.MaxDate;
  DatePicker.MinDate := APicker.MinDate;

  DatePicker.OnExit := HandleExitOfPicker;
  DatePicker.OnChange := HandleChange;



end;

constructor TGridDateAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid; APicker: TDateTimePicker);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, APicker);
end;

function TGridDateAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState): boolean;
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State) then
  begin
     DatePicker.Left := ARect.Left ;//+ TheGrid.Left +1 ;
     DatePicker.Top := ARect.Top ;//+ TheGrid.top +1;
     DatePicker.Width := ARect.Right - ARect.Left;
     DatePicker.Height := ARect.Bottom - ARect.Top ;
{     DateEdit.Left := ARect.Left;// + TheGrid.Left +1 ;
     DateEdit.Top := ARect.Top;// + TheGrid.top +1;
     DateEdit.Width := ARect.Right - ARect.Left;
     DateEdit.Height := ARect.Bottom - ARect.Top; }

     if DatePicker.Kind = dtkDate then
     begin
       if Column.Field.AsDateTime > 1 then
         DatePicker.Date := Column.Field.AsDateTime
       else
         DatePicker.Date := Date;
     end
     else
       DatePicker.Time := Column.Field.AsDateTime;


     Visible := True;
  end
  else
  begin
     { DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);

      TheCanvas.TextRect(ARect, ARect.Left, ARect.Top, VarToStr(
        LkDb.ListSource.DataSet.Lookup(LkDb.KeyField, Column.Field.Value, LkDb.ListField)  ) );
     }
  end;

  Result := true;


end;

procedure TGridDateAgent.HandleChange(Sender: TObject);
begin
  Column.Field.DataSet.Edit;
  if DatePicker.Kind = dtkDate then
    Column.Field.AsDateTime := DatePicker.Date
  else
    Column.Field.AsDateTime := DatePicker.Time;
end;


procedure TGridDateAgent.HandleExitOfPicker(Sender: Tobject);
begin
  Visible := false;
end;

procedure TGridDateAgent.HandleTab(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  -1
  else
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  + 1;

  TheGrid.SetFocus;

end;

procedure TGridDateAgent.SetVisible(const Value: boolean);
begin
  DatePicker.Visible := Value;
  if Value then
    TheOwner.ActiveControl := DatePicker;
end;

{ TDatetimePickerForTab }

procedure TDatetimePickerForTab.WndProc(var Message: TMessage);
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
 
