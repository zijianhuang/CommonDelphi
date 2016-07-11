{{
  Purpose:
    Handling SMTP Emails
}
unit DmSmtp;

interface

uses
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdMessage,
  IdExplicitTLSClientServerBase, IdSMTPBase, IdAttachmentFile, IdText;

type
  TSmtpDm = class(TDataModule)
    IdSMTP1: TIdSMTP;
  private
    FLogHandler: TGetStrProc;
    procedure SetLogHandler(const Value: TGetStrProc);

  protected
    SmtpMessage : TIdMessage;

    procedure WriteLogFile(const s : string);

  public
    constructor Create(Owner : TComponent; const Host, User, Password, FromAddress, FromName : string; const ToLogin : boolean=true); overload;

    function SendSmtpMail(fto, fcc, fbcc :TStrings; const fsub, fbody : WideString;const atts : TStringList=nil) : boolean; overload;
    function SendSmtpMail : boolean; overload;

    procedure SetSmtpNew;
    procedure SetSmtpTo(const s : string);
    procedure SetSmtpSubject(const s: string);
    procedure SetSmtpBody(const s : string);
    procedure SetHtmlBody(const s : string);
    procedure SetSmtpAttachment(const s : string);

    property LogHandler : TGetStrProc read FLogHandler write SetLogHandler;
  end;

var
  SmtpDm: TSmtpDm;


implementation
{$R *.dfm}

{ TSmtpDm }


function TSmtpDm.SendSmtpMail(fto, fcc, fbcc: TStrings; const fsub,
  fbody: WideString; const atts: TStringList): boolean;
var
  msg : TIdMessage;
  i : integer;
begin
  Result := false;
  msg := TidMessage.Create(self);
  for i := 0 to fto.Count - 1 do
    msg.Recipients.Add.Address := fto.Strings[i];

  for i := 0 to fcc.Count - 1 do
    msg.CCList.Add.Address := fcc.Strings[i];

  for i := 0 to fbcc.Count - 1 do
    msg.BccList.Add.Address := fbcc.Strings[i];

  msg.Body.Text := fbody;
  msg.Subject := fsub;

  for i := 0 to atts.Count - 1 do
    TIdAttachmentFile.Create(msg.MessageParts, atts[i]);

  try
    if not Idsmtp1.Connected then
      IdSmtp1.Connect;
    IdSmtp1.Send(msg);
    Result := true;
  except
    on e : SysUtils.Exception do
    begin
      WriteLogFile(e.ClassName +'--'+ e.Message + ' While sending Email.');
      if  CompareText(e.ClassName, 'EIdConnClosedGracefully') = 0 then
        try
        IdSmtp1.Connect;
        except
        end;
    end;
  end;

  msg.Free;

end;

constructor TSmtpDm.Create(Owner: TComponent; const Host, User, Password, FromAddress, FromName : string; const ToLogin : boolean);
begin
  inherited Create(Owner);
    IdSMTP1.Host := Host;
    IdSMTP1.Username := User;
    IdSMTP1.Password := Password;
    if ToLogin then
      IdSmtp1.AuthType := atDefault;
//    IdSmtp1.Port := 25;
    SmtpMessage := TIdMessage.Create(self);
    SmtpMessage.From.Address := FromAddress;
    SmtpMessage.From.Name := FromName;
end;

function TSmtpDm.SendSmtpMail: boolean;
begin
  Result := false;
  try
    if not IdSmtp1.Connected then
      IdSmtp1.Connect;

    IdSmtp1.Send(SmtpMessage);
    Result := true;
  except
    on e : SysUtils.Exception do
    begin
      WriteLogFile(e.ClassName +'--'+ e.Message + ' While sending Email.');
      if  CompareText(e.ClassName, 'EIdConnClosedGracefully') = 0 then
        try
        IdSmtp1.Connect;
        WriteLogFile('Connect to SMTP again.');
        except
          WriteLogFile('Fail  to connect to SMTP again.');
        end;
    end;
  end;

end;

procedure TSmtpDm.SetSmtpAttachment(const s: string);
begin
  TIdAttachmentFile.Create(SmtpMessage.MessageParts, s);

end;

procedure TSmtpDm.SetSmtpBody(const s: string);
begin
  SmtpMessage.Body.Text := s;
end;

procedure TSmtpDm.SetSmtpSubject(const s: string);
begin
  SmtpMessage.Subject := s;
end;

procedure TSmtpDm.SetSmtpTo(const s: string);
var
  ss : TStringList;
  i : integer;
begin
  SmtpMessage.Recipients.Clear;
  if (Pos(',', s) < 1) and (Pos(';', s) < 1) then
    SmtpMessage.Recipients.Add.Address := s
  else
  begin
    ss := TStringList.Create;

    ss.CommaText := StringReplace(s, ';', ',', [rfReplaceAll]);

    for i := 0 to ss.Count - 1 do
      SmtpMessage.Recipients.Add.Address := ss.Strings[i];

    ss.Free;

  end;

end;

procedure TSmtpDm.SetLogHandler(const Value: TGetStrProc);
begin
  FLogHandler := Value;
end;

procedure TSmtpDm.WriteLogFile(const s: string);
begin
  if Assigned(LogHandler) then
    LogHandler(s);
end;

procedure TSmtpDm.SetHtmlBody(const s: string);
begin
      with TIdText.Create(SmtpMessage.MessageParts ) do
        begin
          ContentType := 'text/html';
          Body.Add(s);
        end;

end;

procedure TSmtpDm.SetSmtpNew;
begin
  SmtpMessage.MessageParts.Clear;
end;

end.
