program MailAgent;

uses
  Forms,
  AgentForm in 'AgentForm.pas' {AgentFm},
  MailData in 'MailData.pas' {OADataMod: TDataModule},
  consttype in '..\consttype.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAgentFm, AgentFm);
  Application.CreateForm(TOADataMod, OADataMod);
  Application.Run;
end.
