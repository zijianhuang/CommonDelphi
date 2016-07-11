unit KeyboardLayoutAgent;

interface

uses
  SysUtils, Classes,JclLocales, Windows;

type

  TKeyboardLayoutAgent = class(TComponent)
  private
    FLines: TStringList;
    FList: TStringList;
    procedure RefreshLayoutBnClick(Sender: TObject);
    procedure SetLines(const Value: TStringList);
    procedure SetList(const Value: TStringList);
    function GetCurrentLayout: string;
  protected
    procedure SetLayoutIndex(const Value: integer);
    function GetOriginalKeyboardName: string;
    procedure SetOriginalKeyboardName(const Value: string);
    { Private declarations }
  protected
    FOriginalKeyboardName : string;
    FLayoutIndex: integer;
    //  a list of input locale identifiers
    KeyboardList : TJclKeyboardLayoutList;

    FCurrentLayout : string;

    // index in KeyboardList; if changed, the combobox also get itemindex changed
    property LayoutIndex : integer read FLayoutIndex write SetLayoutIndex;

    // Refresh Locale info into the combo and the infomemo
    procedure ReportLocale;
    procedure RefreshKeyboardsList;      // refresh and show active layout
  public

//    function SaveProgress(const username : string) : boolean;

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

    function ActivateLayout(const idx : integer) : boolean; overload;
    function ActivateLayout(const Identifier : string) : boolean; overload;

    procedure RefreshKeyboardInfo;

    function GetLayoutIndex : integer;              overload;
    function GetLayoutIndex(const Identifier : string) : integer;  overload;
    function GetIdentifierOfIndex(const idx : integer) : string;
    // VariationName of the keyboard layout
    property OriginalKeyboardName : string read GetOriginalKeyboardName write SetOriginalKeyboardName;

    property Lines : TStringList read FLines write SetLines;
    property List : TStringList read FList write SetList;

    property CurrentLayoutIdentifier : string read GetCurrentLayout;
  end;


implementation
uses inifiles,    JclFileUtils,JclSysInfo,JclWin32, functions, gnugettext, TntDialogs;

function KeybLayoutFlagsToDWORD(const ActivateFlags: TJclKeybLayoutFlags;
  const LoadMode: Boolean): DWORD;
begin
  Result := 0;
  if klReorder in ActivateFlags then
    Inc(Result, KLF_REORDER);
  if (klUnloadPrevious in ActivateFlags) and IsWinNT then
    Inc(Result, KLF_UNLOADPREVIOUS);
  if (klSetForProcess in ActivateFlags) and IsWin2K then
    Inc(Result, KLF_SETFORPROCESS);
  if LoadMode then
  begin
    if klActivate in ActivateFlags then
      Inc(Result, KLF_ACTIVATE);
    if klNotEllShell in ActivateFlags then
      Inc(Result, KLF_NOTELLSHELL);
    if (klReplaceLang in ActivateFlags) and not IsWinNT3 then
      Inc(Result, KLF_REPLACELANG);
    if klSubstituteOK in ActivateFlags then
      Inc(Result, KLF_SUBSTITUTE_OK);
  end;
end;

procedure TKeyboardLayoutAgent.SetLayoutIndex(const Value: integer);
begin
  FLayoutIndex := Value;
end;

procedure TKeyboardLayoutAgent.RefreshLayoutBnClick(Sender: TObject);
begin
  RefreshKeyboardInfo;
end;

procedure TKeyboardLayoutAgent.ReportLocale;
var
  i : integer;
begin
  Lines.Clear;

  Lines.Add(_('Loaded input locale identifiers:'));
  for i:=0 to KeyboardList.Count-1 do  // keyboard languages, in my computer, 2
    Lines.Add('  '+KeyboardList.Items[i].DisplayName +' = '+
               KeyboardList.Items[i].VariationName+'-'+
               KeyboardList.Items[i].LocaleInfo.LanguageIndentifier
                );

  Lines.Add(_('Current locale identifiers:'));
  Lines.Add(_('  Display name: ')+KeyboardList.ActiveLayout.DisplayName);
//  InfoMemo.Lines.Add(IntToStr(KeyboardList.ActiveLayout.Layout )+' - '+
//     IntToStr(KeyboardList.ActiveLayout.DeviceHandle)+' - '+
//     IntToStr(KeyboardList.ActiveLayout.LocaleID )
  Lines.Add(_('  Variantion name: ')+KeyboardList.ActiveLayout.VariationName);
  Lines.Add(_('  Language: ')+KeyboardList.ActiveLayout.LocaleInfo.LocalizedLangName);//+' - '+KeyboardList.ActiveLayout.LocaleInfo.EnglishLangName);
  Lines.Add(_('  Country: ')+KeyboardList.ActiveLayout.LocaleInfo.LocalizedCountryName);//+' - '+KeyboardList.ActiveLayout.LocaleInfo.EnglishCountryName);
//  InfoMemo.Lines.Add('  LangId: '+ KeyboardList.ActiveLayout.LocaleInfo.LanguageIndentifier);
end;

procedure TKeyboardLayoutAgent.RefreshKeyboardsList;
var
  i  : integer;
begin
  List.Clear;
  for i:=0 to KeyboardList.AvailableLayoutCount-1 do
    List.Add(KeyboardList.AvailableLayouts[i].Name+' - '+
                        KeyboardList.AvailableLayouts[i].IdentifierName);

end;

function TKeyboardLayoutAgent.GetLayoutIndex : integer;
var
  i, k : integer;
begin
  for i:=0 to KeyboardList.AvailableLayoutCount-1 do  // locate current keyboard layout
    if  KeyboardList.AvailableLayouts[i].Name =KeyboardList.ActiveLayout.VariationName then
    begin
      k:=i;
      break;
    end;

  Result:=k;
end;

function TKeyboardLayoutAgent.GetOriginalKeyboardName: string;
begin
  Result:=FOriginalKeyboardName;
end;

procedure TKeyboardLayoutAgent.SetOriginalKeyboardName(const Value: string);
begin
  FOriginalKeyboardName:=Value;
end;

procedure TKeyboardLayoutAgent.RefreshKeyboardInfo;
begin
  KeyboardList.Refresh;
  RefreshKeyboardsList;
  ReportLocale;
end;

function TKeyboardLayoutAgent.ActivateLayout(const idx: integer): boolean;
var
  LayoutName, LayoutFullName : string;
  LocaleId : Word;
begin
  Result := false;
{  if not KeyboardList.AvailableLayouts[FLayoutIndex].Load([klActivate]) then
  begin
    WideShowMessage(_('Loading keyboard layout fail. Please install the layout driver first.'));
    Exit;
  end; }

  LayoutFullName := KeyboardList.AvailableLayouts[idx].Name;
  LayoutName := KeyboardList.AvailableLayouts[idx].IdentifierName;
//  LocaleId := KeyboardList.AvailableLayouts[idx].LayoutID;
//  LocaleId :=  KeyboardList.AvailableLayouts[idx].Identifier;  // get lower word
//  KeyboardList.AvailableLayouts[idx].Load( [klActivate] );  // ok too
//  if KeyboardList.LoadLayout(LayoutName, [klActivate]) then
//    kb := KeyboardList.ItemFromHkl[ KeyboardList.AvailableLayouts[idx].Identifier ];
//    kb := KeyboardList.LayoutFromLocaleID[LocaleId];
    Result := KeyboardList.LoadLayout(LayoutName, [klActivate]) ;
      if Result   then
        FCurrentlayout := LayoutName;
end;


constructor TKeyboardLayoutAgent.Create(Owner: TComponent);
begin
  inherited;
  FLines := TStringList.Create;
  FList := TStringList.Create;
  KeyboardList := TJclKeyboardLayoutList.Create;
  OriginalKeyboardName:=KeyboardList.ActiveLayout.VariationName;

  TranslateComponent(self);
end;

destructor TKeyboardLayoutAgent.Destroy;
begin
  FLines.Free;
  FList.Free;
  KeyboardList.Free;

  inherited;
end;

procedure TKeyboardLayoutAgent.SetLines(const Value: TStringList);
begin
  FLines := Value;
end;

procedure TKeyboardLayoutAgent.SetList(const Value: TStringList);
begin
  FList := Value;
end;

function TKeyboardLayoutAgent.GetCurrentLayout: string;
begin
  Result :=  FCurrentLayout;// IntToHex( KeyboardList.ActiveLayout.Layout, 8);
end;

function TKeyboardLayoutAgent.ActivateLayout(
  const Identifier: string): boolean;
begin
      Result := KeyboardList.LoadLayout(Identifier, [klActivate]) ;
      if Result   then
        FCurrentlayout := Identifier;
end;

function TKeyboardLayoutAgent.GetLayoutIndex(
  const Identifier: string): integer;
var
  i, k : integer;
begin
  for i:=0 to KeyboardList.AvailableLayoutCount-1 do  // locate current keyboard layout
    if  KeyboardList.AvailableLayouts[i].IdentifierName = Identifier then
    begin
      k:=i;
      break;
    end;

  Result:=k;

end;

function TKeyboardLayoutAgent.GetIdentifierOfIndex(
  const idx: integer): string;
begin
  Result :=  KeyboardList.AvailableLayouts[idx].IdentifierName;
end;

end.
