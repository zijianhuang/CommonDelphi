{{
  Purpose:    (not fully tested)
    To have date lookup, and datetime edit win in dbgrid.
}
unit IntfGridDateTimeAgent;

interface
uses
  classes, SysUtils, Windows,{$IFNDEF VER130} Types, Variants, {$endif} Controls, Forms, DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, ComCtrls, IntfGridDateTimeAgentBase;
type
  TGridDatetimeAgent = class(TGridDateTimeAgentBase)

  protected
    procedure Popup;  override;
  end;

implementation
uses FormDatetime;
{ TGridDatetimeAgent }

procedure TGridDatetimeAgent.Popup;
begin
  if Column.Field.AsDateTime > 0.00001 then
    TFmDatetime.CreateToGet(Column.Field.AsDateTime, DateEdit, HandlePopup)
  else
    TFmDatetime.CreateToGet(Now, DateEdit, HandlePopup);

end;

end.
