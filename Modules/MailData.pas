{{
  Purpose:
    Provide utility functions of handling emails. The emailer could be the default,
    and Outlook.
}
unit MailData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAPI, OleServer,  Outlook2007_TLB,
  syncobjs, ActiveX, TntClasses,
  Variants
 ;
 // for some reasons, D7 could not properly import Type Lib of Outlook,
 // so I have to use Outlook2000 to get static bindings.

type
  EmailerType=(ehRemote,       // Discontinued
                ehDefault,     // Windows' default emailer
                ehOutlook,     // Ms Outlook. Outlook Com interfaces and wrapper functions will be used
                ehNetscape,      // Not yet directly support. EhDefault will do the job.
                ehOutlookExpress,
                ehShell
              );

  TThreadOutItemEvent = procedure(ASender: TComponent) of object;
//  TWriteLogEvent=procedure(const msg: string; const fl: integer = 1) of object;

  TMailDataMod = class(TComponent)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOnThreadOutItem: TThreadOutItemEvent;
    FWhichEmailer: EmailerType;
    FEmailAtOnce: boolean;
    FOnWriteLog: TGetStrProc;
    FOutlookApp : TOutlookApplication;
    
    procedure SetWhichEmailer(const Value: EmailerType);
    procedure SetEmailAtOnce(const Value: boolean);

//    function GetNameOfEmail(const s : string) : string;
//    function GetAddressOfEmail(const s : string) : string;
  protected

    TingSec : TCriticalSection;

    function GetOutlookApp: TOutlookApplication;  virtual;
  public

//    CurrentMailItem     : MailItem;
// email properties         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    property WhichEmailer        : EmailerType read FWhichEmailer write SetWhichEmailer;
    property EmailAtOnce        : boolean read FEmailAtOnce write SetEmailAtOnce default false;


// outlook                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    function CloseOutlookServer : integer;

    // create a new mail item
    function CreateNewMail(const fto, fcc, fbcc :Widestring) : MailItem;  overload;
    function CreateNewMail(fto, fcc, fbcc :TTntStringList) : MailItem; overload;

    // add content to the mail item
    procedure MailAddContent(mt : MailItem; const fsub, fbody : WideString; atts : TTntStringList);
    procedure MailAttachFile(mt : MailItem; const fn : string);

// outlook express          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
   // Send outlookexpress email
    function SendToMAPI(aTo,aCC,aBCC,aAtts: TTntStringList;
                    const body,subject,SenderName,SenderEmail: Widestring;
                    ShowError: boolean = true):Integer;  overload;

    function SendToMAPI(aTo,aCC,aBCC,aAtts: TStrings;
                    const body,subject,SenderName,SenderEmail: string;
                    ShowError: boolean = true):Integer;  overload;

// Email General            MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    // receive addresses and contents from peer then send the email
    function SendMail(fto, fcc, fbcc :TTntStringList; const fsub, fbody : WideString;const atts : TTntStringList=nil) : boolean;

    procedure WriteLogFile(const st : string);


    property OutlookApp          : TOutlookApplication read GetOutlookApp;

    procedure HandleOutlookQuit(Sender : TObject);

     procedure ClickSillyOutlookYes;

  published
    property OnThreadOutItem : TThreadOutItemEvent read FOnThreadOutItem write FOnThreadOutItem;
    property OnWriteLog : TGetStrProc read FOnWriteLog write fOnWriteLog;

  end;

var
  MailDataMod : TMailDataMod;


implementation
uses StrUtils, JvJCLUtils,  ShellApi;


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

function TMailDataMod.CloseOutlookServer: integer;
begin
  FreeAndNil(FOutlookApp);
  Result:=0;
end;


function TMailDataMod.CreateNewMail(const fto, fcc, fbcc: WideString): MailItem;
var
  myItem  : MailItem;
//  myRecipients : Recipients;
//  myRecipient   : Recipient;
begin
  myItem:=(OutlookApp.CreateItem(olMailItem) as MailItem);
  myItem.Display(false); // Outlook 2007 requires MailItem visible for using Recipients.
//  myRecipient:=myItem.Recipients.Add(fto);
  if trim(fto)<>'' then
//    myRecipient.Type_:=olTo;
    myItem.Recipients.Add(fto).Type_:=olTo;

  if trim(fcc)<>'' then
    myItem.Recipients.Add(fcc).Type_:=olCC;

  if trim(fbcc)<>'' then
    myItem.Recipients.Add(fbcc).Type_:=olBCC;

  myItem.Recipients.ResolveAll;

  Result:=myItem;

//  myItem.Display(false);
end;

procedure TMailDataMod.MailAddContent(mt: MailItem; const fsub, fbody : WideString; atts : TTntStringList);
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



// codes from  newsgroup
function TMailDataMod.SendToMAPI(aTo,aCC,aBCC,aAtts: TStrings;
                    const body,subject,SenderName,SenderEmail: string;
                    ShowError: boolean = true):Integer;
var
  SM: TFNMapiSendMail;
  MAPIModule: HModule;

  Msg: MapiMessage;
  lpSender: MapiRecipDesc;
  Recips: array of MapiRecipDesc;
  Att: array of MapiFileDesc;
  p1,p2,p3,LenTo,LenCC,LenBCC,LenAtts: integer;
  sErro: string;
  ppp : PChar;
begin
  try
    FillChar(Msg, SizeOf(Msg), 0);
    { get the length of all array passed to this function }
    LenTo:=0; LenCC:=0; LenBCC:=0; LenAtts:=0;
    if aTo<>nil then
      LenTo := aTo.Count;
    if aCC<>nil then
      LenCC := aCC.Count;
    if aBCC<>nil then
      LenBCC := aBCC.Count;
    if aAtts<>nil then
      LenAtts := aAtts.Count;
    { ... }
    Setlength(Recips,LenTo+LenCC+LenBCC);
    Setlength(Att,LenAtts);
    { to }
    for p1 := 0 to LenTo - 1 do
    begin
      FillChar(Recips[p1], SizeOf(Recips[p1]), 0);
      Recips[p1].ulReserved := 0;
      Recips[p1].ulRecipClass := MAPI_TO;
      Recips[p1].lpszAddress := '';//pchar(GetAddressOfEmail(aTo[p1]));
      ppp:= StrAlloc(Length( aTo[p1])+1);
      StrPCopy(ppp, aTo[p1] );
//      Recips[p1].lpszName := ppp;//GetNameOfEmail(aTo[p1]));
      Recips[p1].lpszAddress := ppp;
    end;
//    for p1 := 0 to LenTo - 1 do
//      ShowMessage(Recips[p1].lpszName);
    p1:=LenTo ;
    { cc }
    for p2 := 0 to LenCC - 1 do
    begin
      FillChar(Recips[p1+p2], SizeOf(Recips[p1+p2]), 0);
      Recips[p1+p2].ulReserved := 0;
      Recips[p1+p2].ulRecipClass := MAPI_CC;
      Recips[p1+p2].lpszAddress := '';//pchar(GetAddressOfEmail(aCC[p2]));
      ppp:= StrAlloc(Length( aCC[p2])+1);
      StrPCopy(ppp, aCC[p2] );
      Recips[p1+p2].lpszAddress := ppp;//GetNameOfEmail(aCC[p2]));
    end;
    p2:=LenCC ;
    { bcc }
    for p3 := 0 to LenBCC - 1 do
    begin
      FillChar(Recips[p1+p2+p3], SizeOf(Recips[p1+p2+p3]), 0);
      Recips[p1+p2+p3].ulReserved := 0;
      Recips[p1+p2+p3].ulRecipClass := MAPI_BCC;
      Recips[p1+p2+p3].lpszAddress := '';//pchar(GetAddressOfEmail(aBCC[p3]));
      ppp:= StrAlloc(Length( aBCC[p3])+1);
      StrPCopy(ppp, aBCC[p3] );
      Recips[p1+p2+p3].lpszAddress := ppp;//GetNameOfEmail(aBCC[p3]));
    end;
    { atts }
    for p1 := 0 to LenAtts - 1 do begin
      FillChar(Att[p1], SizeOf(Att[p1]), 0);
      Att[p1].ulReserved := 0;
      Att[p1].flFlags := 0;
      Att[p1].nPosition := Cardinal($FFFFFFFF); // ULONG(-1);
      ppp:= StrAlloc(Length( aAtts[p1])+1);
      StrPCopy(ppp, aAtts[p1] );
      Att[p1].lpszPathName := ppp;
//      Att[p1].lpszFileName := '';    for thunderbird
      Att[p1].lpFileType := 0;
    end;
    { fill the message }
    with Msg do begin
      ulReserved := 0;
      if subject <> '' then
        lpszSubject := pChar(subject);
      if body <> '' then
        lpszNoteText := pchar(body);
      if SenderEmail <> '' then begin
        lpSender.ulRecipClass := MAPI_ORIG;
        if SenderName = '' then
          lpSender.lpszName := pchar(SenderEmail)
        else
          lpSender.lpszName := pchar(SenderName);
        lpSender.lpszAddress := pchar(SenderEmail);
        lpSender.ulEIDSize := 0;
        lpSender.lpEntryID := nil;
        lpOriginator := @lpSender;
      end
      else
        Msg.lpOriginator := 0;
      Msg.lpszMessageType := 0;
      Msg.lpszDateReceived := 0;
      Msg.lpszConversationID := 0;
      Msg.flFlags := 0;
      Msg.nRecipCount := LenTo + LenCC + LenBCC;
      Msg.lpRecips := @Recips[0];
      Msg.nFileCount := LenAtts;
      Msg.lpFiles := @Att[0];
    end;
    MAPIModule := LoadLibrary(PChar(MAPIDLL));
    if MAPIModule = 0 then
      Result := -1
    else
      try
        @SM := GetProcAddress(MAPIModule, 'MAPISendMail');
        if @SM <> nil then
        begin
          if EmailAtOnce then
            Result := SM(0, Application.Handle, Msg, MAPI_NEW_SESSION, 0)
          else
            Result := SM(0, Application.Handle, Msg, MAPI_DIALOG or MAPI_LOGON_UI, 0);
        end
        else
          Result := 1;
      finally
        FreeLibrary(MAPIModule);
      end;
    if result <> SUCCESS_SUCCESS then begin
      // Here I know that exist better way to get error strings direct from api calls
      // If someone know how do this, please email me
      case result of
        MAPI_E_AMBIGUOUS_RECIPIENT:         sErro :=
'"MAPI_E_AMBIGUOUS_RECIPIENT"';
        MAPI_E_ATTACHMENT_NOT_FOUND:        sErro :=
'"MAPI_E_ATTACHMENT_NOT_FOUND"';
        MAPI_E_ATTACHMENT_OPEN_FAILURE:     sErro :=
'"MAPI_E_ATTACHMENT_OPEN_FAILURE"';
        MAPI_E_BAD_RECIPTYPE:               sErro :=
'"MAPI_E_BAD_RECIPTYPE"';
        MAPI_E_FAILURE:                     sErro := '"MAPI_E_FAILURE"';
        MAPI_E_INSUFFICIENT_MEMORY:         sErro :=
'"MAPI_E_INSUFFICIENT_MEMORY"';
        MAPI_E_LOGIN_FAILURE:               sErro :=
'"MAPI_E_LOGIN_FAILURE"';
        MAPI_E_TEXT_TOO_LARGE:              sErro :=
'"MAPI_E_TEXT_TOO_LARGE"';
        MAPI_E_TOO_MANY_FILES:              sErro :=
'"MAPI_E_TOO_MANY_FILES"';
        MAPI_E_TOO_MANY_RECIPIENTS:         sErro :=
'"MAPI_E_TOO_MANY_RECIPIENTS"';
        MAPI_E_UNKNOWN_RECIPIENT:           sErro :=
'"MAPI_E_UNKNOWN_RECIPIENT"';
        MAPI_E_USER_ABORT:                  sErro := '"MAPI_E_USER_ABORT"';
      end;
      if ShowError then
        MessageDlg('Error sending mail (' + sErro + ').', mtError,[mbOK],
0);
    end;
  finally
    for p1 := 0 to LenTo+LenCC+LenBCC - 1 do
      StrDispose(Recips[p1].lpszAddress);
    Recips:=nil;
    for p1 := 0 to LenAtts - 1 do
      StrDispose(Att[p1].lpszPathName);
    Att:=nil;
  end;
end;

function TMailDataMod.SendMail(fto, fcc, fbcc: TTntStringList; const fsub,
  fbody: WideString; const atts : TTntStringList): boolean;
var
 s : WideString;

begin
  Result:=false;

  case WhichEmailer of
    ehDefault ,
    //  OpenObject('mailto:'+fto.Text);
    ehOutlookExpress :
      begin
        try
          if SendToMAPI(
            fto,  // To
            fcc,  // CC
            fbcc,                                             // BCC
            atts,            // Atts
            fBody ,
            fsub,
            '',                                // Sender Name
            '',                    // Sender Email
            true                                            // Show Error or you want to catch the error?
                    )=0 then
              Result:=true;
        except
          on e : SysUtils.Exception do
            WriteLogFile(e.ClassName+'--'+e.Message);
        end;

      end;
    ehOutlook:
      begin
        try
          MailAddContent( CreateNewMail(fto, fcc, fbcc)
                              , fSub, fBody, atts);
          Result:=true;
        except
          on e : SysUtils.Exception do
            WriteLogFile(e.ClassName+'--'+e.Message);
        end;

      end;
    ehShell:
      begin
        s :=  fto.CommaText ;
        if (fcc <>nil )  then
          s := s + '?cc='+fcc.CommaText;
        if (fbcc<>nil)  then
          s := s + '&bcc='+fbcc.CommaText;

        s := StringReplace(s, '"', '', [rfReplaceAll]);
        s := 'mailto:'+s;
  //      ms :=  WideStringToStringEx( s, StationSettings.CodePage) ;
     //   ShellExecute(0, 'open',  PChar(s),'', '',  SW_SHOWNORMAL) ;
        Openobject(s);

      end;
    ehRemote:
      begin


      end;

  end;  // end case

end;


procedure TMailDataMod.DataModuleCreate(Sender: TObject);
begin
  TingSec:=TCriticalSection.Create;
  WhichEmailer:=ehDefault;
end;

procedure TMailDataMod.DataModuleDestroy(Sender: TObject);
begin
  TingSec.Free;
end;


procedure TMailDataMod.SetWhichEmailer(const Value: EmailerType);
begin
  FWhichEmailer := Value;
end;

function TMailDataMod.CreateNewMail(fto, fcc,  fbcc: TTntStringList): MailItem;
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
      t:=  trim(fto.Strings[i]);
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olTo;
    end;

  if fcc<>nil then
    for i:=0 to fcc.Count-1 do
    begin
      t:=fcc.Strings[i];
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olCC;
    end;

  if fbcc<>nil then
    for i:=0 to fbcc.Count-1 do
    begin
      t:=fbcc.Strings[i];
      if t<>'' then
        myItem.Recipients.Add(t).Type_:=olBCC;
    end;

  myItem.Recipients.ResolveAll;
  Result:=myItem;

end;

procedure TMailDataMod.SetEmailAtOnce(const Value: boolean);
begin
  FEmailAtOnce := Value;
end;

procedure TMailDataMod.WriteLogFile(const st: string);
begin
  if assigned(OnWriteLog) then
    OnWriteLog(st);
end;


{function TMailDataMod.GetAddressOfEmail(const s: string): string;
begin
  Result:=ExtractWord(2, s, ['<', '>']);
end;

function TMailDataMod.GetNameOfEmail(const s: string): string;
begin
  Result:=ExtractWord(1, s,  ['<', '>']);
end; }

function TMailDataMod.GetOutlookApp: TOutlookApplication;
begin
  if not Assigned(FOutlookApp) then
  begin
    FOutlookApp:=TOutlookApplication.Create(self);
    FOutlookApp.OnQuit := HandleOutlookQuit;
  end;

{  try
    FOutlookApp.Connect;   // can not work well with outlook
  except
    on e : SysUtils.Exception do
    begin
  //      showmessage(e.ClassName+'--'+e.Message);
      Application.ProcessMessages;
      sleep(2000);

      // If the user close Word application, "FWordApp.Connection" might raise exception,
      // so I have to do the following to launch the application again.
      FOutlookApp.Disconnect;
      FOutlookApp.Connect;
//      if not FWordApp.Visible then
//        FWordApp.Visible:=true;
    end;
  end;   }

  Result:= FOutlookApp;

end;

procedure TMailDataMod.HandleOutlookQuit(Sender: TObject);
begin
  FreeAndNil(FOutlookApp);
end;

procedure TMailDataMod.MailAttachFile(mt: MailItem; const fn: string);
begin
  if fn<>'' then
      mt.Attachments.Add(fn, EmptyParam, EmptyParam, Emptyparam);

  if EmailAtOnce then
    mt.Send
  else
    mt.Display(false);

end;

procedure TMailDataMod.ClickSillyOutlookYes;
var
  wnd: HWND;
  uClickYes: UINT;

begin
// Register a message to send
  uClickYes:=RegisterWindowMessage('CLICKYES_SUSPEND_RESUME');

// Find ClickYes Window by classname
  wnd:=FindWindow('EXCLICKYES_WND',nil);

// Send the message to Resume ClickYes
  SendMessage(wnd, uClickYes, 1, 0);

// ...
// Do some Actions
// ...

// Send the message to Suspend ClickYes
//  SendMessage(wnd, uClickYes, 0, 0);
end;

function TMailDataMod.SendToMAPI(aTo, aCC, aBCC, aAtts: TTntStringList;
  const body, subject, SenderName, SenderEmail: widestring;
  ShowError: boolean): Integer;
var
  SM: TFNMapiSendMail;
  MAPIModule: HModule;

  Msg: MapiMessage;
  lpSender: MapiRecipDesc;
  Recips: array of MapiRecipDesc;
  Att: array of MapiFileDesc;
  p1,p2,p3,LenTo,LenCC,LenBCC,LenAtts: integer;
  sErro: string;
  ppp : PChar;
begin
  try
    FillChar(Msg, SizeOf(Msg), 0);
    { get the length of all array passed to this function }
    LenTo:=0; LenCC:=0; LenBCC:=0; LenAtts:=0;
    if aTo<>nil then
      LenTo := aTo.Count;
    if aCC<>nil then
      LenCC := aCC.Count;
    if aBCC<>nil then
      LenBCC := aBCC.Count;
    if aAtts<>nil then
      LenAtts := aAtts.Count;
    { ... }
    Setlength(Recips,LenTo+LenCC+LenBCC);
    Setlength(Att,LenAtts);
    { to }
    for p1 := 0 to LenTo - 1 do
    begin
      FillChar(Recips[p1], SizeOf(Recips[p1]), 0);
      Recips[p1].ulReserved := 0;
      Recips[p1].ulRecipClass := MAPI_TO;
      Recips[p1].lpszAddress := '';//pchar(GetAddressOfEmail(aTo[p1]));
      ppp:= StrAlloc(Length( aTo[p1])+1);
      StrPCopy(ppp, aTo[p1] );
//      Recips[p1].lpszName := ppp;//GetNameOfEmail(aTo[p1]));
      Recips[p1].lpszAddress := ppp;
    end;
//    for p1 := 0 to LenTo - 1 do
//      ShowMessage(Recips[p1].lpszName);
    p1:=LenTo ;
    { cc }
    for p2 := 0 to LenCC - 1 do
    begin
      FillChar(Recips[p1+p2], SizeOf(Recips[p1+p2]), 0);
      Recips[p1+p2].ulReserved := 0;
      Recips[p1+p2].ulRecipClass := MAPI_CC;
      Recips[p1+p2].lpszAddress := '';//pchar(GetAddressOfEmail(aCC[p2]));
      ppp:= StrAlloc(Length( aCC[p2])+1);
      StrPCopy(ppp, aCC[p2] );
      Recips[p1+p2].lpszAddress := ppp;//GetNameOfEmail(aCC[p2]));
    end;
    p2:=LenCC ;
    { bcc }
    for p3 := 0 to LenBCC - 1 do
    begin
      FillChar(Recips[p1+p2+p3], SizeOf(Recips[p1+p2+p3]), 0);
      Recips[p1+p2+p3].ulReserved := 0;
      Recips[p1+p2+p3].ulRecipClass := MAPI_BCC;
      Recips[p1+p2+p3].lpszAddress := '';//pchar(GetAddressOfEmail(aBCC[p3]));
      ppp:= StrAlloc(Length( aBCC[p3])+1);
      StrPCopy(ppp, aBCC[p3] );
      Recips[p1+p2+p3].lpszAddress := ppp;//GetNameOfEmail(aBCC[p3]));
    end;
    { atts }
    for p1 := 0 to LenAtts - 1 do begin
      FillChar(Att[p1], SizeOf(Att[p1]), 0);
      Att[p1].ulReserved := 0;
      Att[p1].flFlags := 0;
      Att[p1].nPosition := Cardinal($FFFFFFFF); // ULONG(-1);
      ppp:= StrAlloc(Length( aAtts[p1])+1);
      StrPCopy(ppp, aAtts[p1] );
      Att[p1].lpszPathName := ppp;
//      Att[p1].lpszFileName := '';    for thunderbird
      Att[p1].lpFileType := 0;
    end;
    { fill the message }
    with Msg do begin
      ulReserved := 0;
      if subject <> '' then
        lpszSubject := pChar(subject);
      if body <> '' then
        lpszNoteText := pchar(body);
      if SenderEmail <> '' then begin
        lpSender.ulRecipClass := MAPI_ORIG;
        if SenderName = '' then
          lpSender.lpszName := pchar(SenderEmail)
        else
          lpSender.lpszName := pchar(SenderName);
        lpSender.lpszAddress := pchar(SenderEmail);
        lpSender.ulEIDSize := 0;
        lpSender.lpEntryID := nil;
        lpOriginator := @lpSender;
      end
      else
        Msg.lpOriginator := 0;
      Msg.lpszMessageType := 0;
      Msg.lpszDateReceived := 0;
      Msg.lpszConversationID := 0;
      Msg.flFlags := 0;
      Msg.nRecipCount := LenTo + LenCC + LenBCC;
      Msg.lpRecips := @Recips[0];
      Msg.nFileCount := LenAtts;
      Msg.lpFiles := @Att[0];
    end;
    MAPIModule := LoadLibrary(PChar(MAPIDLL));
    if MAPIModule = 0 then
      Result := -1
    else
      try
        @SM := GetProcAddress(MAPIModule, 'MAPISendMail');
        if @SM <> nil then
        begin
          if EmailAtOnce then
            Result := SM(0, Application.Handle, Msg, MAPI_NEW_SESSION, 0)
          else
            Result := SM(0, Application.Handle, Msg, MAPI_DIALOG or MAPI_LOGON_UI, 0);
        end
        else
          Result := 1;
      finally
        FreeLibrary(MAPIModule);
      end;
    if result <> SUCCESS_SUCCESS then begin
      // Here I know that exist better way to get error strings direct from api calls
      // If someone know how do this, please email me
      case result of
        MAPI_E_AMBIGUOUS_RECIPIENT:         sErro :=
'"MAPI_E_AMBIGUOUS_RECIPIENT"';
        MAPI_E_ATTACHMENT_NOT_FOUND:        sErro :=
'"MAPI_E_ATTACHMENT_NOT_FOUND"';
        MAPI_E_ATTACHMENT_OPEN_FAILURE:     sErro :=
'"MAPI_E_ATTACHMENT_OPEN_FAILURE"';
        MAPI_E_BAD_RECIPTYPE:               sErro :=
'"MAPI_E_BAD_RECIPTYPE"';
        MAPI_E_FAILURE:                     sErro := '"MAPI_E_FAILURE"';
        MAPI_E_INSUFFICIENT_MEMORY:         sErro :=
'"MAPI_E_INSUFFICIENT_MEMORY"';
        MAPI_E_LOGIN_FAILURE:               sErro :=
'"MAPI_E_LOGIN_FAILURE"';
        MAPI_E_TEXT_TOO_LARGE:              sErro :=
'"MAPI_E_TEXT_TOO_LARGE"';
        MAPI_E_TOO_MANY_FILES:              sErro :=
'"MAPI_E_TOO_MANY_FILES"';
        MAPI_E_TOO_MANY_RECIPIENTS:         sErro :=
'"MAPI_E_TOO_MANY_RECIPIENTS"';
        MAPI_E_UNKNOWN_RECIPIENT:           sErro :=
'"MAPI_E_UNKNOWN_RECIPIENT"';
        MAPI_E_USER_ABORT:                  sErro := '"MAPI_E_USER_ABORT"';
      end;
      if ShowError then
        MessageDlg('Error sending mail (' + sErro + ').', mtError,[mbOK],
0);
    end;
  finally
    for p1 := 0 to LenTo+LenCC+LenBCC - 1 do
      StrDispose(Recips[p1].lpszAddress);
    Recips:=nil;
    for p1 := 0 to LenAtts - 1 do
      StrDispose(Att[p1].lpszPathName);
    Att:=nil;
  end;
end;

end.
