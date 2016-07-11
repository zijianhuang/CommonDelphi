{{
  Purpose:
    To have lookupcombox in dbgrid.
}
unit IntfGridLookupAgent;

interface
uses
  classes, SysUtils, Windows,{$IFNDEF VER130} Types, Variants, {$endif} Controls, Forms, DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, Messages, JvDbLookup;
type
  TDbLkForTab = class(TDbLookupCombobox)
  private
    FOnTab: TNotifyEvent;
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    property OnTab : TNotifyEvent read FOnTab write FOnTab;
  end;

  TGridLookupAgent = class(TGridComponentAgent)
  protected
    ReadOnly : boolean;
// todo: a public property will export this. It not assigned, the agent will create one, and warn the programmer to assign list sources.
    LkDb : TDbLkForTab;  // Reference to client LookupCombo

    procedure SetVisible(const Value: boolean);  override;

    procedure HandleLookupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure HandleLookupTab(Sender : TObject);
    
    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    // Presumbaly the client won't assign OnExist of LkDb in most cases. Since Lk is invisible at startup.
    procedure HandleExitOfLkDb(Sender : Tobject);
  public
    {{ The client just needs to define LookupSource, key and display field.
       If ALookup is readonly, only lookup content will be shown.
       If ALookup is not readonly, the combobox will be shown, and the data field will be
       automatically wired to the column.
    }
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
        ALookup : TDbLookupCombobox); overload;

    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid;
        ALookup : TDbLookupCombobox); overload;

    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
        ALookup : TJvDBLookupCombo); overload;

    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid;
        ALookup : TJvDBLookupCombo); overload;
  end;

  {{
    The lookup list will vary with different record. The client program must provide an even handler
    to refresh the list upon the appearance of the dropdown list control.  The text of the dropdown list
    will be used to fill in the data field.
  }
  TGridLookupDetailAgent = class(TGridLookupAgent)
  private
    FOnNeedRefreshList: TNotifyEvent;
  protected
    MasterField : string;

    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    procedure HandleLookupClick(Sender : TObject);

    property OnNeedRefreshList : TNotifyEvent read FOnNeedRefreshList write FOnNeedRefreshList;
  public
    {{ The client just needs to define LookupSource, key and display field.
       If ALookup is readonly, only lookup content will be shown.
       If ALookup is not readonly, the combobox will be shown, and the data field will be
       automatically wired to the column.
    }
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
        ALookup : TDbLookupCombobox; RefreshListHandler : TNotifyEvent); overload;


    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid;
        ALookup : TDbLookupCombobox; RefreshListHandler : TNotifyEvent); overload;
  end;

implementation
uses
{$ifdef ver15}  Variants,  {$endif}   JclSysInfo;
{ TGridLookupAgent }

constructor TGridLookupAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; ALookup : TDbLookupCombobox);
begin
  inherited Create(AOwner, AColumn, AGrid);

  ALookup.Visible := false; // so programmers may leave the client lookupbox as it is at design time
  LkDb := TDbLkForTab.Create(self);
  LkDb.Parent := AGrid;  // To make the behavior of inserting record better
  LkDb.Visible := false;
  LkDb.ListSource := ALookup.ListSource;
  LkDb.ListField := ALookup.ListField;
  LkDb.KeyField := ALookup.KeyField;
  LkDb.OnExit := HandleExitOfLkDb;
  LkDb.OnKeyDown := HandleLookupKeydown;
  LkDb.OnTab := HandleLookupTab;
  LkDb.OnClick := ALookup.OnClick;
  LkDb.OnCloseUp := ALookup.OnCloseUp;

  ReadOnly := Column.ReadOnly;
  ALookup.Enabled := not ReadOnly;

  LkDb.Hint := 'Press Ctrl key to show drop-down list';

  if not ReadOnly then
  begin
    LkDb.DataSource := AGrid.DataSource;
    LkDb.DataField := AColumn.FieldName;
  end;
end;

constructor TGridLookupAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid;
  ALookup: TDbLookupCombobox);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, ALookup);
end;

constructor TGridLookupAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; ALookup: TJvDBLookupCombo);
begin
  inherited Create(AOwner, AColumn, AGrid);

  ALookup.Visible := false; // so programmers may leave the client lookupbox as it is at design time
  LkDb := TDbLkForTab.Create(self);
  LkDb.Parent := AGrid;  // To make the behavior of inserting record better
  LkDb.Visible := false;
  LkDb.ListSource := ALookup.LookupSource;
  LkDb.ListField := ALookup.LookupDisplay;
  LkDb.KeyField := ALookup.LookupField;
  LkDb.OnExit := HandleExitOfLkDb;
  LkDb.OnKeyDown := HandleLookupKeydown;
  LkDb.OnTab := HandleLookupTab;
  LkDb.OnClick := ALookup.OnClick;
  LkDb.OnCloseUp := ALookup.OnCloseUp;

  ReadOnly := Column.ReadOnly;
  ALookup.Enabled := not ReadOnly;

  LkDb.Hint := 'Press Ctrl key to show drop-down list';

  if not ReadOnly then
  begin
    LkDb.DataSource := AGrid.DataSource;
    LkDb.DataField := AColumn.FieldName;
  end;

end;

constructor TGridLookupAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid;
  ALookup: TJvDBLookupCombo);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, ALookup);
end;

function TGridLookupAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState): boolean;
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State) and (not ReadOnly) then
  begin
     lkDb.Left := ARect.Left-1;// + TheGrid.Left +1 ;
     lkDb.Top := ARect.Top-2;// + TheGrid.top +1;
     lkDb.Width := ARect.Right - ARect.Left+2;
     lkDb.Height := ARect.Bottom - ARect.Top;

     Visible := True;
  end
  else
  begin
      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);

      if Column.Field.Value <> NULL then
        TheCanvas.TextRect(ARect, ARect.Left+2, ARect.Top+2, VarToStr(
          LkDb.ListSource.DataSet.Lookup(LkDb.KeyField, Column.Field.Value, LkDb.ListField)  ) );

  end;

  Result := true;

end;

procedure TGridLookupAgent.HandleExitOfLkDb(Sender: Tobject);
begin
  Visible := false;
end;

procedure TGridLookupAgent.HandleLookupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Control then
    LkDb.DropDown

end;

procedure TGridLookupAgent.HandleLookupTab(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  -1
  else
    TheGrid.SelectedIndex := TheGrid.SelectedIndex  + 1;

  TheGrid.SetFocus;

end;

procedure TGridLookupAgent.SetVisible(const Value: boolean);
begin
  LkDb.Visible := Value;
  if Value then
    TheOwner.ActiveControl := LkDb;

end;

{ TDbLkForTab }

procedure TDbLkForTab.WndProc(var Message: TMessage);
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


{ TGridLookupDetailAgent }

constructor TGridLookupDetailAgent.Create(AOwner: TCustomForm;
  AColumn: TColumn; AGrid: TCustomDBGrid; ALookup: TDbLookupCombobox;
   RefreshListHandler : TNotifyEvent);
begin
  inherited Create(AOwner, AColumn, AGrid);

  ALookup.Visible := false; // so programmers may leave the client lookupbox as it is at design time
  LkDb := TDbLkForTab.Create(self);
  LkDb.Parent := AGrid;  // To make the behavior of inserting record better
  LkDb.Visible := false;
  LkDb.ListSource := ALookup.ListSource;
  LkDb.ListField := ALookup.ListField;
  LkDb.KeyField := ALookup.KeyField;
  LkDb.OnExit := HandleExitOfLkDb;
  LkDb.OnKeyDown := HandleLookupKeydown;
  LkDb.OnTab := HandleLookupTab;
  LkDb.OnClick := HandleLookupClick;// ALookup.OnClick;
  LkDb.OnCloseUp := ALookup.OnCloseUp;

  ReadOnly := ALookup.ReadOnly;

    LkDb.DataSource := nil;
    LkDb.DataField := '';

  LkDb.Hint := 'Press Ctrl key to show drop-down list';


  OnNeedRefreshList := RefreshListHandler;
end;

constructor TGridLookupDetailAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid;
  ALookup: TDbLookupCombobox; RefreshListHandler: TNotifyEvent);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, ALookup, RefreshListHandler);
end;

function TGridLookupDetailAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState): boolean;
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State) and (not ReadOnly) then
  begin
     if Assigned(OnNeedRefreshList) then
       OnNeedRefreshList(self);

     lkDb.Width := 20;// ARect.Right - ARect.Left;
     lkDb.Height := ARect.Bottom - ARect.Top;
     lkDb.Left := Arect.Right - LkDb.Width;
     lkDb.Top := ARect.Top;
     LkDb.DropDownWidth :=  ARect.Right - ARect.Left;

     Visible := True;
  end
  else
  begin
    {  DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);

      if Column.Field.Value <> NULL then
        TheCanvas.TextRect(ARect, ARect.Left, ARect.Top, VarToStr(
          LkDb.ListSource.DataSet.Lookup(LkDb.KeyField, Column.Field.Value, LkDb.ListField)  ) );
   }
  end;

  Result := true;


end;

procedure TGridLookupDetailAgent.HandleLookupClick(Sender: TObject);
begin
  TheDataset.Edit;
  Column.Field.Text := LkDb.Text;
end;

end.
