program okword;

uses
  Forms,
  ConfigForm in 'ConfigForm.pas' {ConfigFm},
  MailData in 'MailData.pas' {OADataMod: TDataModule},
  consttype in '..\consttype.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TConfigFm, ConfigFm);
  Application.CreateForm(TOADataMod, OADataMod);
  Application.Run;
end.
