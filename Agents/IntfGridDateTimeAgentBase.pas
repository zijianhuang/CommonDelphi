{{
  Purpose:    (not fully tested)
    To have date lookup, and datetime edit win in dbgrid.
}
unit IntfGridDateTimeAgentBase;

interface
uses
  classes, SysUtils, Windows,{$IFNDEF VER130} Types, Variants, {$endif} Controls, Forms, DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, ComCtrls;
type
  TGridDatetimeAgentBase = class(TGridComponentAgent)

  protected
    DateEdit : TDbEdit;

    procedure SetVisible(const Value: boolean);  override;

    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;


    procedure HandleDblClick(sender : TObject);
    procedure Popup;   virtual; abstract;
    procedure HandleExitOfEdit(Sender : TObject);

    procedure HandlePopup(Sender : TObject; const t : TDateTime);
  public
    {{

    }
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid); override;
  end;

implementation
{ TGridDatetimeAgent }

constructor TGridDatetimeAgentBase.Create(AOwner: TCustomForm;
  AColumn: TColumn; AGrid: TCustomDBGrid);
begin
  inherited Create(Aowner, AColumn, Agrid);

  DateEdit := TDbEdit.Create(AOwner);
  DateEdit.Parent := AGrid;
  DateEdit.Visible := false;
  DateEdit.Color := AColumn.Color;
  DateEdit.Font := AColumn.Font;
  DateEdit.DataSource := AGrid.DataSource;
  DateEdit.DataField := AColumn.FieldName;

  DateEdit.OnClick := HandleDblClick;
  DateEdit.OnExit := HandleExitOfEdit;
end;

function TGridDatetimeAgentBase.Draw(AColumn: TColumn; const ARect: TRect;
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
     DateEdit.Left := ARect.Left;// + TheGrid.Left +1 ;
     DateEdit.Top := ARect.Top;// + TheGrid.top +1;
     DateEdit.Width := ARect.Right - ARect.Left;
     DateEdit.Height := ARect.Bottom - ARect.Top;

     Visible := True;
  end
  else
  begin
  end;

  Result := true;


end;

procedure TGridDatetimeAgentBase.HandleDblClick(sender: TObject);
begin
  Popup;
end;


procedure TGridDatetimeAgentBase.HandleExitOfEdit(Sender: TObject);
begin
  Visible := false;
end;

procedure TGridDatetimeAgentBase.HandlePopup(Sender: TObject;
  const t: TDateTime);
begin
  if t>0.00001 then
  begin
    Column.Field.DataSet.Edit;
    Column.Field.AsDateTime := t;
  end
  else
    Column.Field.Value := NULL;

end;

{procedure TGridDatetimeAgent.Popup;
begin
  if Column.Field.AsDateTime > 0.00001 then
    TFmDatetime.CreateToGet(Column.Field.AsDateTime, DateEdit, HandlePopup)
  else
    TFmDatetime.CreateToGet(Now, DateEdit, HandlePopup);

end; }

procedure TGridDatetimeAgentBase.SetVisible(const Value: boolean);
begin
  DateEdit.Visible := Value;
  if Value then
    TheOwner.ActiveControl := DateEdit;

end;

end.
