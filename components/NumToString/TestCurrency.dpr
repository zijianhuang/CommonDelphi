program TestCurrency;

uses
  Forms,
  FormMain in 'FormMain.pas' {FmMain},
  ReadNumEng in 'ReadNumEng.pas',
  ReadNumChn in 'ReadNumChn.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
