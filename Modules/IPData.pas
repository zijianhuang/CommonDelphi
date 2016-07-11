unit IPData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdTCPServer, consttype,  syncobjs,
  IdUDPServer, IdTCPConnection, IdTCPClient, IdSocketHandle;


type
  TThreadOutItemEvent = procedure(ASender: TComponent) of object;
  TWriteLogEvent=procedure(const msg: string; fl: integer = 1) of object;

  TIPDataMod = class(TDataModule)
    TCPServer: TIdTCPServer;
    TCPClient: TIdTCPClient;
    UDPServer: TIdUDPServer;
    UDPClient: TIdUDPClient;
    procedure TCPServerExecute(AThread: TIdPeerThread);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOnThreadOutItem: TThreadOutItemEvent;
    FOnWriteLog: TWriteLogEvent;
  protected

    TingSec : TCriticalSection;

  public
// TCP/IP                   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    function SendCommand(const AOut: string; const AResponse: smallint): smallint;
    function TCPConnect: boolean;
    procedure TCPDisconnect;


    procedure WriteLogFile(const st : string);

  published
    property OnThreadOutItem : TThreadOutItemEvent read FOnThreadOutItem write FOnThreadOutItem;
    property OnWriteLog : TWriteLogEvent read FOnWriteLog write fOnWriteLog;

  end;

  
implementation
uses IdException;
{$R *.DFM}

{ TMainDataMod }

procedure TIPDataMod.TCPServerExecute(AThread: TIdPeerThread);
var
  cmd: string;
  goon : boolean;
begin
{  goon:=true;
  cmd := AThread.Connection.ReadLnWait;

  if (cmd = CMD_SendMail)  then
  begin
    AThread.Connection.WriteSmallInt(hOK);
    goon:=SendMail(AThread);
    if Goon then
      AThread.Connection.WriteSmallInt(hOK)
    else
      AThread.Connection.WriteSmallInt(hNo);
  end
  else
    AThread.Connection.WriteSmallInt(hNo); }

end;



procedure TIPDataMod.DataModuleCreate(Sender: TObject);
begin
  TingSec:=TCriticalSection.Create;
end;

procedure TIPDataMod.DataModuleDestroy(Sender: TObject);
begin
  TingSec.Free;
end;



function TIPDataMod.SendCommand(const AOut: string; const AResponse: smallint): smallint;
begin
  Result := hNo;
  try
    TCPClient.Writeln(AOut);
    Result := TCPClient.ReadSmallInt;
  except
    Result := hNoResponse;
  end;
end;

function TIPDataMod.TCPConnect: boolean;
begin
  Result := False;
  try
    TCPClient.Connect;
    Result := True;
  except
    on e : EIdAlreadyConnected do
    begin
      Result:=true;
    end;
    on e: SysUtils.Exception do
    begin
//      WriteLogFile(Host + '--'+e.ClassName+': ' + e.Message);
    end;
  end;
end;

procedure TIPDataMod.TCPDisconnect;
begin
  TCPClient.Disconnect;
end;


procedure TIPDataMod.WriteLogFile(const st: string);
begin
  if assigned(OnWriteLog) then
    OnWriteLog(st);
end;




end.
