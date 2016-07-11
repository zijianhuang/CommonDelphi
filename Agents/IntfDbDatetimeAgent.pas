{{
  Purpose:
    Not yet. Suspended.
}
unit IntfDbDatetimeAgent;

interface
uses
  classes, SysUtils, Windows, Forms, Types,Controls,DbCtrls, DbGrids, db, Grids,
  ComCtrls, ExtCtrls;
type
  TDbDatetimeAgent = class(TComponent)
  protected
    DtPicker : TMonthCalendar;  // created in constructor;
    TheOwner : TCustomForm; // reference to the form. To access ActiveControl without typecast.
    TheEdit : TDbEdit ; // reference

//    SelectedDate : TDate; // 0 when it become visible
    procedure SetVisible(const Value: boolean); 
    procedure HandleEditClick(Sender : TObject);
    
    procedure HandleDtPickerExit(Sender : TObject);
    procedure HandleDtPickerClick(sender : TObject);

    property Visible : boolean write  SetVisible;
  public
    constructor Create(AOwner : TCustomForm; AEdit : TDbEdit); overload;

  end;


implementation

{ TDbDatetimeAgent }

constructor TDbDatetimeAgent.Create(AOwner: TCustomForm; AEdit: TDbEdit);
begin
  inherited Create(AOwner);
  TheOwner := Aowner;
  TheEdit := AEdit;

  DtPicker := TMonthCalendar.Create(self);
  DtPicker.Parent := TheOwner;
  DtPicker.Visible := false;

  DtPicker.OnExit := HandleDtPickerExit;

end;

procedure TDbDatetimeAgent.HandleDtPickerClick(sender: TObject);
begin
  Visible := false;

  TheEdit.DataSource.DataSet.Edit;
  TheEdit.Field.AsDateTime :=  DtPicker.Date + Frac( TheEdit.Field.AsDateTime );
end;

procedure TDbDatetimeAgent.HandleDtPickerExit(Sender: TObject);
begin
  Visible := false;
end;

procedure TDbDatetimeAgent.HandleEditClick(Sender: TObject);
begin
  Visible := not DtPicker.Visible;
end;

procedure TDbDatetimeAgent.SetVisible(const Value: boolean);
begin
  if Value then
  begin
    DtPicker.Left := TheEdit.Left;
    DtPicker.Top := TheEdit.Top + TheEdit.Height;
//    SelectedDate := 0;
  end;

  DtPicker.Visible := Value;

end;

end.
