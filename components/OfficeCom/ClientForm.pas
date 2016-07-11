unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, IdSocketHandle,
  IdTCPConnection, IdTCPClient, IdException, consttype;


type
  TClientFm = class(TForm)
    IdUDPServer1: TIdUDPServer;
    Memo1: TMemo;
    Button15: TButton;
    ToEdit: TEdit;
    CCEdit: TEdit;
    BccEdit: TEdit;
    SubjectEdit: TEdit;
    BodyEdit: TMemo;
    CS: TIdTCPClient;
    Edit1: TEdit;
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure Button15Click(Sender: TObject);
  private
    { Private declarations }
  public
    function Connect(host: string; port: integer): boolean;
    function SendCommand(const AOut: string;  const AResponse: smallint): smallint;
    procedure CloseConnection;


  end;

var
  ClientFm: TClientFm;

implementation

{$R *.DFM}

procedure TClientFm.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
begin
  Memo1.Lines.LoadFromStream(AData);
end;

procedure TClientFm.CloseConnection;
begin
  CS.Disconnect;
{  if allowReport then
  begin
    RemoteIPLb.Caption:='';
    RemoteIPLb.Refresh;
  end; }
end;

function TClientFm.Connect(host: string; port: integer): boolean;
begin
  Result := False;
  CS.Host := Host;
  CS.Port := port;
  try
    CS.Connect;
    Result := True;
  except
    on e : EIdAlreadyConnected do
    begin
      Result:=true;
    end;
    on e: Exception do
    begin
//      WriteLogFile(Host + '--'+e.ClassName+': ' + e.Message);
    end;
  end;
end;

function TClientFm.SendCommand(const AOut: string;
  const AResponse: smallint): smallint;
begin
  Result := hNo;
  try
    CS.Writeln(AOut);
    Result := CS.ReadSmallInt;
  except
    Result := hNoResponse;
  end;
end;


procedure TClientFm.Button15Click(Sender: TObject);
var
  answer : SmallInt;
begin
  if Connect(Edit1.Text, 7110) then
  begin
    if SendCommand(CMD_SendMail, hOK)=hOK then
    begin
      CS.WriteLn(ToEdit.Text);
      CS.WriteLn(CCEdit.Text);
      CS.WriteLn(BCCEdit.Text);
      CS.WriteLn(SubjectEdit.Text);
      CS.WriteLn(BodyEdit.Text+#0);
      answer:= CS.ReadSmallInt;
      CloseConnection;
      if answer<>hOK then
        Showmessage('send mail fail.');
    end;

  end;
end;

end.
