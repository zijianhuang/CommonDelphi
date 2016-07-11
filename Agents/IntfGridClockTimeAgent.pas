unit IntfGridClockTimeAgent;

interface
uses
  classes, SysUtils, Windows,{$IFNDEF VER130} Types, Variants, {$endif} Controls, Forms, DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, ComCtrls, IntfGridDateTimeAgent;
type
  TGridClockTimeAgent = class(TGridDateTimeAgent)

  protected
    procedure Popup;  override;
    procedure HandlePopup(Sender : TObject; const t : TTime);
  end;

implementation
uses
  FormClockTime;
{ TGridClockTimeAgent }


procedure TGridClockTimeAgent.HandlePopup(Sender: TObject; const t: TTime);
begin
  if t>0.00001 then
  begin
    Column.Field.DataSet.Edit;
    Column.Field.AsDateTime := t;
  end
  else
    Column.Field.Value := NULL;

end;

procedure TGridClockTimeAgent.Popup;
begin
  if Column.Field.AsDateTime > 1 then
    TFmClocktime.CreateToGet(Column.Field.AsDateTime, DateEdit, HandlePopup)
  else
    TFmClocktime.CreateToGet(Now, DateEdit, HandlePopup);

end;

end.
