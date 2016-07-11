unit functions;
{
Define common functions and procedures.

Default notification: [C]--Common
}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,  dbgrids, ExtCtrls,  JclFileUtils
{$IFDEF VERSION7}
, Variants
{$ENDIF} ;


resourcestring
PAM_CONFIRM='Confirmation';
// 确认
PAM_YESNO='Please type Yes or No:';
// 请输入 Yes 或 No:

type
  TVerifyString = function(const s : string) : boolean;

  ErrType=(eOK, eErr, eDaysInvalid, eAmtInvalid, eApplyUpdates, eLinkOrder,
                eNullDate, eCompleted, eInvoiced, eGstNotDefined);  // [P]

// Simple calculation           MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  // Return initial letters of words
  function StrToAbbr(const t : string) : string;

// Simple verification          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  // return the interval of days between; return true if days>0 and t1, t2 are valid
  function CheckDays(const t1, t2 : TDateTime; var days : LongInt) : boolean;

// Abbr                         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  // write text at current cursor of the memo control
  procedure WriteMemo(m : TCustomMemo; const t : string);

// Screen effect                MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  procedure SetClockCursor;
  procedure SetDefaultCursor;

// GUI                          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  function AllowDelete : boolean;

//  function InputInteger(const ACaption, APrompt: string; var Value: string; PromptErr : boolean=false): boolean;
//  function InputFloat(const ACaption, APrompt: string; var Value: string; PromptErr : boolean=false): boolean;

//  function VerifyCustom(const ACaption, APrompt: string; var Value: string; verify : TVerifyString; PromptErr : boolean=false): boolean;

  function ReportError(ecode : ErrType) : ErrType;

  function ShowInformation(const s : string) : Word;
  function ShowWarning(const s : string) : Word;
  function ShowError(const s : string) : Word;
  function ShowConfirm(const s : string) : Word;

  function MessageDialog(const Msg: string; DlgType: TMsgDlgType): Word;

// DB functions                 MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

//  procedure FormatAllDBControlsWithCurrency(tc : TWinControl);  // for mySQL only. compilier directive later.

  function VarToInt(const n : Variant) : integer;

  function VariantToInteger(const v : variant) : integer;

  function GetBool(const i : integer) : boolean; overload;
  function GetBool(const s : string) : boolean;  overload;

  function BoolToStr(const b : boolean) : string;

  function QuotedDate(const d : TDate; const FileBased : boolean) : string;

  function roundmoney(const value, coin : double) : double;


  function DateInter(const d : TDateTime) : string; // 2003-04-12
  function DateInterShort(const d : TDateTime) : string; // 03-04-22
  function DateInterAbbr(const d : TDateTime) : string; // 030422

  function DateTimeInter(const d : TDateTime) : string; // 2003-04-12 18:04:25
  function DateTimeInterShort(const d : TDateTime) : string; // 03-04-22 18:04:35
  function DateTimeInterAbbr(const d : TDateTime) : string; // 030422T180435

  // refined version of AdvBuildFileList of Jcl
  function AhBuildFileList(const Path: string; const Attr: Integer; const Files: TStrings;
    const AttributeMatch: TJclAttributeMatch = amSubsetOf; const Options: TFileListOptions = [];
    const SubfoldersMask: string = ''; const FileMatchFunc: TFileMatchFunc = nil): Boolean;

  function CheckFloat(const s : string) : boolean;

implementation

uses  DateUtil, JclLocales, JclSysInfo, StrUtils, JclStrings;

function DateInter(const d : TDateTime) : string; // 2003-04-12
begin
  Result:=FormatDateTime('yyyy-mm-dd', d);
end;

function DateInterShort(const d : TDateTime) : string; // 03-04-22
begin
  Result:=FormatDateTime('yy-mm-dd', d);
end;

function DateInterAbbr(const d : TDateTime) : string; // 030422
begin
  Result:=FormatDateTime('yymmdd', d);
end;


function DateTimeInter(const d : TDateTime) : string; // 2003-04-12 18:04:25
begin
  Result:=FormatDateTime('yyyy-mm-dd hh:nn:ss', d);
end;

function DateTimeInterShort(const d : TDateTime) : string; // 03-04-22 18:04:35
begin
  Result:=FormatDateTime('yy-mm-dd hh:nn:ss', d);
end;

function DateTimeInterAbbr(const d : TDateTime) : string; // 030422T180435
begin
  Result:=FormatDateTime('yymmdd"T"hh:nn:ss', d);
end;


function QuotedDate(const d : TDate; const FileBased : boolean) : string;
begin
  if FileBased then
    Result:=AnsiQuotedStr( FormatDateTime('yyyy-mm-dd', d), '#')
  else
    Result:=AnsiQuotedStr( FormatDateTime('yyyy-mm-dd', d), '"')
end;


function roundmoney(const value, coin : double) : double;
var
 base1, mod1, bigcon : integer;
 a : integer;
begin
 bigcon:=trunc(coin*100);
 base1:=(round(value*100) div bigcon) * bigcon;
 mod1:=round(value*100) mod bigcon;
 if mod1 >= bigcon/2 then
   a:=bigcon
 else
   a:=0;

 Result:=(base1 +a)/100;
end;

function BoolToStr(const b : boolean) : string;
begin
  if b then
    result:='1'
  else
    Result:='0';
end;

function GetBool(const i : integer) : boolean; overload;
begin
  Result:=i>0;
end;

function GetBool(const s : string) : boolean;  overload;
begin
  Result:=s[1]='1';
end;

function VariantToInteger(const v : variant) : integer;
begin
  if v=NULL then
    Result:=0
  else
    Result:=v;
end;

function AllowDelete : boolean;
var
  Value : string;
begin
  Result:=false;
  if InputQuery(PAM_CONFIRM, PAM_YESNO, Value) then
  begin
      try
        if lowercase(Value)='yes' then
          Result:=true;
      except
      end;
  end;
end;

{procedure FormatAllDBControlsWithCurrency(tc : TWinControl);
var
  i : integer;
begin
  for i:=0 to tc.ComponentCount-1 do
    if (tc.Components[i] is  TDBEdit) then
      if ((tc.Components[i] as  TDBEdit).Field is TFloatField) then
        ((tc.Components[i] as  TDBEdit).Field as TFloatField).DisplayFormat:=CurrencyDisplayFormat;
end;}

function StrToAbbr(const t : string) : string;
var
  I: Integer;
  w : boolean;
begin
{  s:=trim(t);
  L := 1;
  I := Pos(' ', S);
  while (I > 0) do
  begin
    Left :=Copy(S, 1, I-1);
    Result:=Result+Left[1];
    Delete(S, 1, I + L - 1);
    s:=trim(s);
    I := Pos(' ', S);
  end;
  if S <> '' then
    Result:=Result+S[1];}
  w:=false;
  for i:=1 to length(t) do
  begin
    if IsCharAlphaNumeric(t[i]) then
    begin
      if not w then
      begin
        Result:=Result+t[i];
        w:=true;
      end;
    end
    else
      w:=false;
  end;


  Result:=UpperCase(Result);
end;

procedure WriteMemo(m : TCustomMemo; const t : string);
begin
  m.SelText:=t;
end;

function CheckDays(const t1, t2 : TDateTime; var days : LongInt) : boolean;
begin
  Result:=true;
  days:=DaysBetween(t1, t2);

  if (t1=0) or (t2=0) then
    Result:=false;

  if (days=0) then
    Result:=false;
end;

{function VerifyCustom(const ACaption, APrompt: string; var Value: string; verify : TVerifyString; PromptErr : boolean=false): boolean;
var
  kkfm : THInputBox;
  temp : string;
begin
  Result:=false;

  kkfm:=THInputBox.Create(nil);
  kkfm.Caption:=ACaption;
  kkfm.LbHint.Caption:=APrompt;
  kkfm.EdInput.Text:=Value;

  Result:=kkfm.ShowModal=mrOK;
  temp:=kkfm.EdInput.Text;

  if Result then
  begin
      try
        Result:=false;
        Verify(temp);
        Value:=temp;
        Result:=true;
      except
        on e : Exception do
        begin
          if PromptErr then
            ShowError(e.ClassName+'--'+e.Message);
        end;
      end;
  end;

  kkfm.Free;
end; }

function CheckInteger(const s : string) : boolean;
begin
  StrToInt(s);
end;

{function InputInteger(const ACaption, APrompt: string; var Value: string; PromptErr : boolean): boolean;
begin
  Result:=VerifyCustom(ACaption, APrompt, Value, CheckInteger);
end;}

function CheckFloat(const s : string) : boolean;
begin
  StrToFloat(s);
end;

//function InputFloat(const ACaption, APrompt: string; var Value: string; PromptErr : boolean): boolean;
//begin
//  Result:=VerifyCustom(ACaption, APrompt, Value, CheckFloat);
{  Result:=false;
  if InputQuery(ACaption, APrompt, Value) then
  begin
      try
        StrToFloat(Value);
        Result:=true;
      except
      end;
  end;}
//end;

function ShowInformation(const s : string) : Word;
begin
   Result:=MessageDialog(s, mtInformation);
end;

function ShowWarning(const s : string) : Word;
begin
  Result:=MessageDialog(s, mtWarning);
end;

function ShowError(const s : string) : Word;
begin
  Result:=MessageDialog(s, mtError);
end;

function ShowConfirm(const s : string) : Word;
begin
  Result:=MessageDialog(s, mtConfirmation);
end;

function ReportError(ecode : ErrType) : ErrType;
begin
  case ecode of
    eOK         : Exit;
    eErr        : ShowError('Errors occur.');
    eDaysInvalid: ShowError('The days between may be invalid.');
    eAmtInvalid : ShowError('The amount may be invalid.');
    eApplyUpdates : ShowError('Something wrong while ApplyUpdate.');
    eCompleted  : ShowError('Not allow to modify a completed record or set a record completed here.');
    eInvoiced   : ShowError('Not allow to modify an invoiced order.');
    eGstNotDefined : ShowError('Gst is not defined.');
    eNullDate: ShowError('The date is null.');
  else
    ShowError('Misc error.');
  end;
end;

procedure SetClockCursor;
begin
  Screen.Cursor:=crHourGlass;
end;

procedure SetDefaultCursor;
begin
  Screen.Cursor:=crDefault;
end;


function VarToInt(const n : Variant) : integer;
begin
  if n=NULL then
    Result:=0
  else
    Result:=n;
end;

function MessageDialog(const Msg: string; DlgType: TMsgDlgType): Word;
var
  flag : Word;
begin
  case DlgType of
    mtConfirmation      :  flag:=MB_ICONQUESTION+MB_YESNO ;
    mtWarning           :  flag:=MB_ICONWARNING+MB_OK;
    mtError             :  flag:=MB_ICONERROR+MB_OK;
    mtInformation       :  flag:=MB_ICONINFORMATION+MB_OK;
  end;


  Result:=MessageBox(Application.Handle, PChar(msg), PChar(Application.Title), flag);

  case Result of
    IDYES       : Result:=mrYes;
    IDNO        : Result:=mrNo;
    IDOK        : Result:=mrOK;

  end;

end;

function AhBuildFileList(const Path: string; const Attr: Integer; const Files: TStrings;
  const AttributeMatch: TJclAttributeMatch; const Options: TFileListOptions;
  const SubfoldersMask: string; const FileMatchFunc: TFileMatchFunc): Boolean;

var
  FileMask: string;
  RootDir: string;
  Folders: TStringList;
  CurrentItem: Integer;
  Counter: Integer;
  LocAttr: Integer;

  procedure BuildFolderList;
  var
    FindInfo: TSearchRec;
    Rslt: Integer;
  begin
    Counter := Folders.Count - 1;
    CurrentItem := 0;

    while CurrentItem <= Counter do
    begin
      // searching for subfolders
      Rslt := FindFirst(Folders[CurrentItem] + '*.*', faDirectory, FindInfo);
      try
        while Rslt = 0 do
        begin
          if (FindInfo.Name <> '.') and (FindInfo.Name <> '..') and
            (FindInfo.Attr and faDirectory = faDirectory) then
            Folders.Add(Folders[CurrentItem] + FindInfo.Name + PathSeparator);

          Rslt := FindNext(FindInfo);
        end;
      finally
        FindClose(FindInfo);
      end;
      Counter := Folders.Count - 1;
      Inc(CurrentItem);
    end;
  end;

  procedure FillFileList(CurrentCounter: Integer);
  var
    FindInfo: TSearchRec;
    Rslt: Integer;
    CurrentFolder: String;
    Matches: Boolean;

  begin
    CurrentFolder := Folders[CurrentCounter];
    Rslt := FindFirst(CurrentFolder + FileMask, LocAttr, FindInfo);

    try
      while Rslt = 0 do
      begin
         Matches := False;

         case AttributeMatch of
           amAny: Matches := true;//(LocAttr and FindInfo.Attr) <> 0;
           amExact: Matches := LocAttr = FindInfo.Attr;
           amSuperSetOf: Matches := (LocAttr and FindInfo.Attr) = FindInfo.Attr;
           amSubSetOf: Matches := (LocAttr and FindInfo.Attr) = LocAttr;
           amCustom: if @FileMatchFunc <> nil then
                       Matches := FileMatchFunc(LocAttr,  FindInfo);
         end;

         if Matches then
          if flFullNames in Options then
            Files.Add(CurrentFolder + FindInfo.Name)
          else
            Files.Add(FindInfo.Name);

        Rslt := FindNext(FindInfo);
      end;
    finally
      FindClose(FindInfo);
    end;
  end;

begin
  Assert(Files <> nil);
  FileMask := ExtractFileName(Path);
  RootDir := ExtractFilePath(Path);

  Folders := TStringList.Create;
  try
    Folders.Add(RootDir);

    if Attr = faAnyFile then
      LocAttr := faReadOnly + faHidden + faSysFile + faArchive
    else
      LocAttr := Attr;

    // here's the recursive search for nested folders

    if flRecursive in Options then
      BuildFolderList;

    for Counter := 0 to Folders.Count - 1 do
    begin
      if (((flMaskedSubfolders in Options) and (StrMatches(SubfoldersMask,
        Folders[Counter], 1))) or (not (flMaskedSubfolders in Options))) then
          FillFileList(Counter);
    end;
  finally
    Folders.Free;
  end;
  Result := True;
end;



end.
