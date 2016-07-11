program client;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {ClientFm},
  consttype in '..\consttype.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientFm, ClientFm);
  Application.Run;
end.
