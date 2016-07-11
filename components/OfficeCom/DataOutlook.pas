{{
  Purpose:
    Provide utility functions of handling emails. The emailer could be the default,
    and Outlook.
}
unit DataOutlook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAPI, OleServer,  Outlook2007_TLB,
  syncobjs, ActiveX
{$IFNDEF VER130} ,Variants {$ENDIF}
 ;
 // for some reasons, D7 could not properly import Type Lib of Outlook,
 // so I have to use Outlook2000 to get static bindings.

type
  TThreadOutItemEvent = procedure(ASender: TComponent) of object;
  TWriteLogEvent=procedure(const msg: string; fl: integer = 1) of object;

  TOutlookUtilBase = class(TComponent)
  private
    FOnThreadOutItem: TThreadOutItemEvent;
    FEmailAtOnce: boolean;
    FOnWriteLog: TWriteLogEvent;
    FOutlookApp : TOutlookApplication;
    
    procedure SetEmailAtOnce(const Value: boolean);
  protected

    function GetOutlookApp: TOutlookApplication;  virtual;
  public

//    CurrentMailItem     : MailItem;
// email properties         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    property EmailAtOnce        : boolean read FEmailAtOnce write SetEmailAtOnce default false;


// outlook                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    function CloseOutlookServer : integer;

    // create a new mail item. It is up to the client codes to send or to display.
    function CreateNewMail(const fto, fcc, fbcc :Widestring) : MailItem;  overload;
    function CreateNewMail(fto, fcc, fbcc :TStrings) : MailItem; overload;

    function CreateContactItem : ContactItem;

    // add content to the mail item
    procedure MailAddContent(mt : MailItem; const fsub, fbody : WideString; atts : TStringList);


// Email General            MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    // receive addresses and contents from peer then send the email
    function SendMail(fto, fcc, fbcc :TStrings; const fsub, fbody : WideString;const atts : TStringList=nil) : boolean;

    procedure WriteLogFile(const st : string);


    property OutlookApp          : TOutlookApplication read GetOutlookApp;

    procedure HandleOutlookQuit(Sender : TObject);

  published
    property OnThreadOutItem : TThreadOutItemEvent read FOnThreadOutItem write FOnThreadOutItem;
    property OnWriteLog : TWriteLogEvent read FOnWriteLog write fOnWriteLog;

  end;




var
  OutlookDm: TOutlookUtilBase;

implementation
uses StrUtils;


{ TMainDataMod }

// from Rx
function WordPosition(const N: Integer; const S: string;
  const WordDelims: TSysCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do begin
    { skip over delimiters }
    while (I <= Length(S)) and (S[I] in WordDelims) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not (S[I] in WordDelims) do Inc(I)
    else Result := I;
  end;
end;

// from rx
function ExtractWord(N: Integer; const S: string;
  const WordDelims: TSysCharSet): string;
var
  I: Integer;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function TOutlookUtilBase.CloseOutlookServer: integer;
begin
  FreeAndNil(FOutlookApp);
  Result:=0;
end;


function TOutlookUtilBase.CreateNewMail(const fto, fcc, fbcc: WideString): MailItem;
var
  myItem  : MailItem;
//  myRecipients : Recipients;
//  myRecipient   : Recipient;
begin
  myItem:=(OutlookApp.CreateItem(olMailItem) as MailItem);
  myItem.Display(false); // Outlook 2007 requires MailItem visible for using Recipients.
  if trim(fto)<>'' then
    myItem.Recipients.Add(fto).Type_:=olTo;

  if trim(fcc)<>'' then
    myItem.Recipients.Add(fcc).Type_:=olCC;

  if trim(fbcc)<>'' then
    myItem.Recipients.Add(fbcc).Type_:=olBCC;

  Result:=myItem;
//  myItem.Display(false);
end;

procedure TOutlookUtilBase.MailAddContent(mt: MailItem; const fsub, fbody : WideString; atts : TStringList);
var
  i : integer;
begin
  if (fsub <> '') and (mt.Subject = '') then
    mt.Subject:=fsub;

  if fbody <> '' then
    mt.Body:= fBody + mt.Body;

  if atts<>nil then
    for i:=0 to atts.Count-1 do
      mt.Attachments.Add(atts.Strings[i], EmptyParam, EmptyParam, Emptyparam);

  if EmailAtOnce then
    mt.Send
  else
    mt.Display(false);
end;

function TOutlookUtilBase.SendMail(fto, fcc, fbcc: TStrings; const fsub,
  fbody: WideString; const atts : TStringList): boolean;
begin
  Result:=false;

        try
          MailAddContent( CreateNewMail(fto, fcc, fbcc)
                              , fSub, fBody, atts);
          Result:=true;
        except
          on e : SysUtils.Exception do
            WriteLogFile(e.ClassName+'--'+e.Message);
        end;

end;


function TOutlookUtilBase.CreateNewMail(fto, fcc,  fbcc: TStrings): MailItem;
var
  myItem  : MailItem;
  i : integer;
  t : WideString;
begin
  myItem:=(OutlookApp.CreateItem(olMailItem) as MailItem);
  myItem.Display(false); // Outlook 2007 requires MailItem visible for using Recipients.

  if fto<>nil then
    for i:=0 to fto.Count-1 do
    begin
      t:=trim(fto.Strings[i]);
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olTo;
    end;

  if fcc<>nil then
    for i:=0 to fcc.Count-1 do
    begin
      t:=trim(fcc.Strings[i]);
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olCC;
    end;

  if fbcc<>nil then
    for i:=0 to fbcc.Count-1 do
    begin
      t:=trim(fbcc.Strings[i]);
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olBCC;
    end;

  Result:=myItem;

end;

procedure TOutlookUtilBase.SetEmailAtOnce(const Value: boolean);
begin
  FEmailAtOnce := Value;
end;

procedure TOutlookUtilBase.WriteLogFile(const st: string);
begin
  if assigned(OnWriteLog) then
    OnWriteLog(st);
end;

function TOutlookUtilBase.GetOutlookApp: TOutlookApplication;
begin
  if not Assigned(FOutlookApp) then
  begin
    FOutlookApp:=TOutlookApplication.Create(self);
    FOutlookApp.OnQuit := HandleOutlookQuit;
  end;

  Result:= FOutlookApp;

end;

procedure TOutlookUtilBase.HandleOutlookQuit(Sender: TObject);
begin
  FreeAndNil(FOutlookApp);
end;

function TOutlookUtilBase.CreateContactItem: ContactItem;
begin
  Result := OutlookApp.CreateItem(olContactItem) as ContactItem;
end;

end.
