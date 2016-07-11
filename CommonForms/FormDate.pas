unit FormDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFmDate = class(TForm)
    MonthCalendar1: TMonthCalendar;
    BnOk: TButton;
    BnCancel: TButton;
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function GetDate(const t : TDateTime) : TDateTime; virtual;
  end;

var
  FmDate: TFmDate;

implementation

{$R *.dfm}

{ TFmDate }

function TFmDate.GetDate(const t : TDateTime ): TDateTime;
begin
  MonthCalendar1.Date := t;
  if ShowModal = mrOK then
    Result := MonthCalendar1.Date + Frac(t)
  else
    Result := 0;
end;

procedure TFmDate.MonthCalendar1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;

end;

procedure TFmDate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
