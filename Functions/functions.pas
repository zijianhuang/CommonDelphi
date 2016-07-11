unit functions;
{
Define common functions and procedures.

Default notification: [C]--Common
}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,  dbgrids, ExtCtrls,  JclFileUtils{$IFDEF VER150}
, Variants
{$ENDIF} ;

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

//  function ReportError(ecode : ErrType) : ErrType;

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

//  function CheckFloat(const s : string) : boolean;

  function ConvertRtfToText(const AString : string ) : string;

  function GetMemoControlRtf(MemoControl : TCustomMemo) : string;

  function GetBeginEndColor(const BeginColor, EndColor : TColor; const Min, Max, Position : integer) : TColor;

  function GetInteger(const s : string) : integer;
function DeleteFiles(const FileMask: string): Boolean;
function DeleteFilesEx(const FileMasks: array of string): Boolean;


implementation

uses  DateUtils, JclLocales,  JclSysInfo, StrUtils, comctrls, JclAnsiStrings;

function DeleteFiles(const FileMask: string): Boolean;
var
  SearchRec: TSearchRec;
begin
  Result := FindFirst(ExpandFileName(FileMask), faAnyFile, SearchRec) = 0;
  try
    if Result then
      repeat
//        if (SearchRec.Name[1] <> '.') and
//      !!! BUG !!!
// (rom) added '..' to complete the fix
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then
        begin
          Result := DeleteFile(ExtractFilePath(FileMask) + SearchRec.Name);
          if not Result then
            Break;
        end;
      until FindNext(SearchRec) <> 0;
  finally
    FindClose(SearchRec);
  end;
end;

function DeleteFilesEx(const FileMasks: array of string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := Low(FileMasks) to High(FileMasks) do
    Result := Result and DeleteFiles(FileMasks[I]);
end;

function GetBeginEndColor(const BeginColor, EndColor : TColor; const Min, Max, Position : integer) : TColor;
var
  Red, Blue, Green : TColor;
begin

  Red := GetRValue(BeginColor) + (GetRValue(EndColor) - GetRValue(BeginColor)) div Max * Position;
  Blue := GetBValue(BeginColor) + (GetBValue(EndColor) - GetBValue(BeginColor)) div Max * Position;
  Green := GetGValue(BeginColor) + (GetGValue(EndColor) - GetGValue(BeginColor)) div Max * Position;

  Result := RGB(Round(Red), Round(Green), Round(Blue));

end;

function ConvertRtfToText(const AString : string ) : string;
var
  ss:tstringstream;
  tempMemo : TRichEdit;
begin
  ss:= TStringstream.Create( aString );
  tempMemo := TRichEdit.Create(nil);
  try
    tempMemo.PlainText := FALSE;
    tempMemo.Lines.LoadFromStream( ss );
    Result := tempMemo.Text;
  finally
    ss.free;
    tempMemo.Free;
  end;

end;

function GetMemoControlRtf(MemoControl : TCustomMemo) : string;
var
  ff : TStringStream;
begin
  ff := TStringStream.Create('');

  try
    MemoControl.Lines.SaveToStream(ff);
    Result := ff.DataString;
  finally

    ff.Free;
  end;

end;


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
    Result:=QuotedStr( FormatDateTime('yyyy-mm-dd', d))
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
  Result := false;
  if s='' then
  begin
    exit;
  end;

  try
    Result:=s[1]='1';  // s might be empty
  except
  end;
end;

function GetInteger(const s : string) : integer;
begin
  if s = '' then
    Result := 0
  else
    Result := StrToInt(s);
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
  if InputQuery('Confirmation', 'Please type Yes or No:', Value) then // Dialog box for inputing yes or n
  begin
      try
        if lowercase(Value)='yes' then   // type yes or Yes or YES to confirm.
          Result:=true;
      except
      end;
  end;
end;

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
  days:=Trunc(t2)-Trunc(t1);
  if days = 0 then
    days := 1;

  if (t1=0) or (t2=0) then
    Result:=false;

//  if (days=0) then
//    Result:=false;
end;


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
            Folders.Add(Folders[CurrentItem] + FindInfo.Name + PathDelim);

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
