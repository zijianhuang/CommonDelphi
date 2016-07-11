unit VCardDef;

interface

uses  classes, controls, Sysutils, dialogs, uVcls, DateUtil;

const
  DATEFORMAT  ='yyyy-mm-dd';
type
  UAddressType = (vcaDomestic, vcaInternational, vcaPostal, vcaParcel, vcaHome, vcaWork, vcaQuotedPrintable);
  UAddressAttributes = set of UAddressType;

  UPhoneType = (vctPreferred, vctWork, vctHome, vctVoice, vctFax,
                  vctMessage, vctCellular, vctPager, vctBBS, vctModem,
                  vctCar, vctISDN, vctVideo, vctNone);
  UPhoneAttributes = set of UPhoneType;
  UURLAttributes=  UPhoneAttributes ;

  UNoteType=(vcnBase64, vcnQuotedPrintable, vcn8bit, vcnHome, vcnWork);
  UNoteAttributes=set of UNoteType;

  UEmailType = (vceAOL, vceAppleLink, vceATTMail, vceCIS,
                  vceeWorld, vceInternet, vceIBMMail, vceMCIMail, vcePowerShare,
                  vceProdigy, vceTLX, vceX400, vceNone);
//  UEmailAttributes=set of UEmailType;

  UKeyType=(vckX509, vckPGP);

  UVcard=class(TComponent)
  private
    fFormattedName       : PVObject;
    fFamilyName, fGivenName, fAdditionalName,
        fnamePrefixes, fNameSuffixes  : PVObject;
    fTitle              : PVObject;
    fOrgProp, fOrg_Name, fOrg_Unit, fOrg_Unit2 : PVObject;
    fBirthday           : PVObject;
    fYellowPage         : PVobject;

    fAdr                : TList;
    fLabel              : TList;
    fTelnum             : TList;
    fEmail              : TList;
    fURL                : TList;
    fNote               : TList;

    // not yet
    fMailer             : PVObject;
    fTimeZone           : PVObject;
    fGeo                : PVObject;
    fPhoto              : PVObject;
    fRole               : PVObject;
    fLogo               : PVObject;
    fAgent              : PVObject;
    fRev                : PVObject;
    fSound              : PVObject;
    fUID                : PVObject;
    fKey                : PVObject;

    fVersion            : PVObject;

    fVCard            : PVObject;
    fVObject            : PVObject;

    fNameProp           : PVObject;
//    VCardStrings        : TStringList;
  protected
    procedure CreateNewVCard;
    procedure ProcessName(p  : PVObject);
    procedure ProcessFormattedName(p  : PVObject);
    procedure ProcessBirthday(p  : PVObject);
    function getEmailType(p  : PVObject) : UEmailType; overload;
    procedure AddEmailType(p : PVObject; ww : UEmailType);
    procedure ProcessEmail(p : PVObject);
    function getAddressAttributes(p : PVObject) : UAddressAttributes; overload;
    function getEmailTypeStr(u  : UemailType) : PChar;
    procedure AddPhoneAttributes(p : PVObject; wt  :  UPhoneAttributes );
    procedure ProcessPhone(p : PVObject);
    function getPhoneAttributes(p : PVObject) : UPhoneAttributes;  overload;

    procedure ProcessAddress(p  : PVObject);
    procedure ProcessOrg(p  : PVObject);

    procedure TestVCard;
    procedure ClearReferences;
    procedure IterateVCard(vc : PVObject; i : integer);

    function GetAddressComp(a  : PVObject; c  : PChar) : PVObject;
    procedure ProcessTitle(p : PVObject);
    procedure ProcessURL(p : PVObject);
    procedure ProcessNote(p : PVObject);

    procedure AddAddressAttributes(p : PVObject; aa : UAddressAttributes);
    procedure AddNoteAttributes(p : PVObject; aa : UNoteAttributes);
    // common use
    function AssignPropertyValue(o  : PVObject; prop  : PChar; vs  : PChar; dup : boolean=false) : PVObject;
    function AssignProperty(o : PVObject; prop : PChar; dup : boolean=false) : PVObject;
    function getPropertyValue(p : PVObject) : string;
  public
    constructor Create(Owner : TComponent);
    destructor Destroy; override;

    // accessing full name and names
    function getFormattedName : string;
    function assignFormattedName(s : string): PVObject;

    function getFamilyName : string;
    function getGivenName : string;
    function getAdditionalName : string;
    function getNamePrefix : string;
    function getNameSuffix : string;

    function AssignFamilyName(s : string) : PVObject;
    function AssignGivenName(s : string): PVObject;
    function AssignAdditionalName(s : string): PVObject;
    function AssignNamePrefix(s : string): PVObject;
    function AssignNameSuffix(s : string): PVObject;
    function AssignName(s1, s2, s3, s4, s5 : string) : PVObject;

    function getYellowPage : string;
    function assignYellowPage(s : string = 'Yellow') : PVObject;
    procedure processYellowPage(p : PVObject);

    // accessing Org
    function getOrg : string;
    function getOrgName : string;
    function getOrgUnit : string;
    function getOrgUnit2 : string;
    function AssignOrg(oname, u, u2 : string) : PVObject;

    // accessing birthday
    function getBirthdateStr : string;
    function getBirthdate       : TDate;
    function AssignBirthday(s : string): PVObject; overload;
    function AssignBirthday(d : TDate): PVObject;  overload;

    // accessing Email
    function getEmail(i : integer)   : string;
    function getEmailType(i  : integer) : UEmailType; overload;
    function getEmailAttributes(i  : integer) : UPhoneAttributes;
    function getEmailCount : integer;
    function AssignEmailPropertyValue(s : PChar; et  : UEmailType; wt : UPhoneAttributes) : PVObject;

    // accessing Phone
    function getPhone(i : integer)   : string;
    function getPhoneAttributes(i : integer) : UPhoneAttributes;  overload;
    function getPhoneCount : integer;
    function AssignPhonePropertyValue(telnum: PChar; wt: UPhoneAttributes) : PVObject;

    // accessing Address
    function getAddressAttributes(i : integer) : UAddressAttributes;  overload;
    function GetAddressF1(i : integer) : string;
    function GetAddressF2(i : integer) : string;
    function GetAddressF3(i : integer) : string;
    function GetAddressF4(i : integer) : string;
    function GetAddressF5(i : integer) : string;
    function GetAddressF6(i : integer) : string;
    function GetAddressF7(i : integer) : string;
    function getAddressCount : integer;
    function AssignAddress(a1, a2, a3, a4, a5, a6, a7  : string; aa : UAddressAttributes) : PVObject;

    // accessing Title
    function GetTitle : string;
    function AssignTitle(s : string) : PVObject;

    // accessing URL
    function GetURL(i  : integer) : string;
    function GetURLAttributes(i : integer) : UURLAttributes;
    function AssignURL(ur  : string; wt : UURLAttributes) : PVObject;
    function GetUrlCount : integer;

    // accessing Note
    function GetNote(i : integer) : string;
    function GetNoteCount : integer;
    function GetNoteAttributes(i : integer) : UNoteAttributes;  overload;
    function GetNoteAttributes(p : PVObject) : UNoteAttributes;  overload;
    function AssignNote(ur : string; wt : UNoteAttributes) : PVObject;

    // file access
    function LoadVCardFromFile(fn : string) : boolean;
    function SaveVCardToFile(fn : string) : boolean;
    procedure CleanVCard;

  end;


implementation

{ UVcard }

function UVcard.AssignAdditionalName(s: string): PVObject;
begin
  Result:=AssignPropertyValue(fNameProp, VCAdditionalNamesProp, PChar(s));
end;

function UVcard.AssignBirthday(s: string): PVObject;
begin
  Result:=AssignPropertyValue(fVCard, VCBirthDateProp, PChar(FormatDateTime(DATEFORMAT, StrToDateTime(s) )));
end;

function UVcard.AssignBirthday(d: TDate): PVObject;
begin
  Result:=AssignPropertyValue(fVCard, VCBirthDateProp,PChar(FormatDateTime(DATEFORMAT, d )));
end;

function UVcard.AssignFamilyName(s: string): PVObject;
begin
  fFamilyName:=AssignPropertyValue(fNameProp, VCFamilyNameProp, PChar(s));
  Result:=fFamilyName ;
end;

function UVcard.assignFormattedName(s: string): PVObject;
begin
  fFormattedName:=AssignPropertyValue(fVCard, VCFullNameProp, PChar(s));
  Result:= fFormattedName ;
end;

function UVcard.AssignGivenName(s: string): PVObject;
begin
  fGivenName:=AssignPropertyValue(fNameProp, VCGivenNameProp, PChar(s));
  Result:= fGivenName ;
end;

function UVcard.AssignNamePrefix(s: string): PVObject;
begin
  fNamePrefixes:=AssignPropertyValue(fNameProp, VCNamePrefixesProp, PChar(s));
  Result:= fNamePrefixes  ;
end;

function UVcard.AssignNameSuffix(s: string): PVObject;
begin
  fNameSuffixes:= AssignPropertyValue(fNameProp, VCNameSuffixesProp, PChar(s));
  Result:= fNameSuffixes ;
end;

function UVcard.AssignPropertyValue(o: PVObject; prop, vs: PChar; dup : boolean) : PVObject;
var   p : PVObject;
  l : integer;
begin
  if dup then
    p:=addPropValue(o, prop, vs)
  else
  begin
    p:=isAPropertyOf(o,  prop);
    if (p<>nil) then
      setVObjectUStringZValue(p, fakeUnicode(vs, l))
    else
      p:=addPropValue(o, prop, vs)
  end;

  Result:=p;
end;

constructor UVcard.Create(Owner : TComponent);
begin
  inherited;
//  VCardStrings:=TStringList.Create;
  CreateNewVCard;
end;

procedure UVcard.CreateNewVCard;
begin
  fVCard:=newVObject(VCCardProp);
  addPropValue(fVCard, VCVersionProp, '2.1');
  fNameProp:=addProp(fVCard, VCnameProp);
  fEmail:=TList.Create;
  fTelnum:=TList.Create;
  fAdr:=TList.Create;
  fURL:=TList.Create;
  fNote:=TList.Create;

end;

destructor UVcard.Destroy;
begin
  fEmail.Free;
  fTelnum.Free;
  fAdr.Free;
  fURL.Free;
  fNote.Free;
  cleanVObject(fVCard);

//  VCardStrings.Free;
  inherited;
end;

function UVcard.getAdditionalName: string;
begin
  Result:=getPropertyValue(fAdditionalName);
end;

function UVcard.getBirthdate: TDate;
begin
  if (getPropertyValue(fBirthday)='') then
    Result:=0
  else
    Result:=StrToDateFmt(DATEFORMAT, getPropertyValue(fBirthday));     //StrToDate(getPropertyValue(fBirthday));
end;

function UVcard.getBirthdateStr: string;
begin
  Result:=getPropertyValue(fBirthday);
end;

function UVcard.getFamilyName: string;
begin
  Result:=getPropertyValue(fFamilyName);
end;

function UVcard.getFormattedName: string;
begin
  Result:=getPropertyValue(fFormattedName);
end;

function UVcard.getGivenName: string;
begin
  Result:=getPropertyValue(fGivenName);
end;

function UVcard.getNamePrefix: string;
begin
  Result:=getPropertyValue(fNamePrefixes);
end;

function UVcard.getNameSuffix: string;
begin
    Result:=getPropertyValue(fNameSuffixes);
end;

function UVcard.LoadVCardFromFile(fn: string): boolean;
begin
  try
//    VCardStrings.LoadFromFile(fn);
    fVObject:=Parse_Mime_fromFileName(PChar(fn)) ;  // the calling modlue should do fault tolerance.
    // after testing ...
    testVCard;
  except
    on e : Exception do
      showmessage(e.Message);
  end;

  if fVCard=nil then      // for testing only
    showmessage('fvcard is nil');

  Result:=true;
end;


procedure UVcard.IterateVCard(vc : PVObject; i : integer);
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
begin
  CleanVCard;
  fVCard:=vc;
  initPropIterator(@t, fVCard);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);

    if (CompareStr(n, VCNameProp)=0) then
      ProcessName(eachProp)
    else if (CompareStr(n, VCFullNameProp)=0) then
      ProcessFormattedName(eachProp)
    else if (CompareStr(n, VCBirthdateProp)=0) then
      ProcessBirthday(eachprop)
    else if (CompareStr(n, VCEmailAddressProp)=0) then
      ProcessEmail(eachProp)
    else if (CompareStr(n, VCTelephoneProp)=0) then
      ProcessPhone(eachprop)
    else if (CompareStr(n, VCAdrProp)=0) then
      ProcessAddress(eachProp)
    else if (CompareStr(n, VCOrgProp)=0) then
      ProcessOrg(eachprop)
    else if (CompareStr(n, VCTitleProp)=0) then
      ProcessTitle(eachProp)
    else if (CompareStr(n, VCURLProp)=0) then
      ProcessURL(eachprop)
    else if (CompareStr(n, VCNoteProp)=0) then
      ProcessNote(eachProp)
    else if (CompareStr(n, VCX_YellowPage)=0) then
      ProcessYellowPage(eachProp)

  end;

end;

procedure UVcard.ProcessBirthday(p: PVObject);
var
  sd  : string;
begin
  sd:=vObjectUStringZValue(p);
  if (length(sd)<=8) and (length(sd)>=6) then
  begin
    Insert('-', sd, length(sd)-1);
    Insert('-', sd, length(sd)-4);
    AssignBirthday(sd);
  end;
  fBirthday:=p;
end;

procedure UVcard.ProcessFormattedName(p: PVObject);
begin
   fFormattedName:=p;
end;

procedure UVcard.ProcessName(p: PVObject);
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
begin
  fNameProp:=p;   // fNameProp arleady cleaned while fVCard cleaned
  initPropIterator(@t, p);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VCFamilyNameProp)=0) then
      fFamilyName:=eachProp
    else if (CompareStr(n, VCGivenNameProp)=0) then
      fGivenName:=eachProp
    else if (CompareStr(n, VCAdditionalNamesProp)=0) then
      fAdditionalName:=eachProp
    else if (CompareStr(n, VCNamePrefixesProp)=0) then
      fNamePrefixes:=eachProp
    else if (CompareStr(n, VCNameSuffixesProp)=0) then
      fNameSuffixes:=eachProp
  end;
end;

function UVcard.SaveVCardToFile(fn: string): boolean;
begin
   writeVObjectToFile(PChar(fn),  fVCard);
   Result:=true;
end;

procedure UVcard.TestVCard;
var
  t, v  : PVObject;
  i     : integer;
begin
  i:=0;
  v:=fVObject;
  while (v<>nil) do    // only one card, maybe card list in the future
  begin
    if (StrComp(vObjectName(v), VCCardProp)=0) then
    begin
      IterateVCard(v, i);
      i:=i+1;
    end
    else if (StrComp(vObjectName(v), VCCalProp)=0) then
    begin
      // do nothing at the moment
      i:=i+1;
    end
    else
    begin
      // do nothing at the moment
    end;

    t:=v;
    v:=nextVObjectInList(v);
//    cleanVObject(t);
  end;
end;

procedure UVcard.ProcessEmail(p: PVObject);
begin
  fEmail.Add(p);
end;

function UVcard.AssignEmailPropertyValue(s : PChar; et: UEmailType; wt : UPhoneAttributes) : PVObject;
var
  p   : PVObject;
begin
  p:=AssignPropertyValue(fVCard, VCEmailAddressProp, s, true);
  fEmail.add(p);

  addPhoneAttributes(p, wt);
  addEmailType(p, et);

  Result:=p;
end;

function UVcard.getEmail(i  : integer): string;
begin
    Result:=getPropertyValue(fEmail.Items[i]);
end;

function UVcard.getEmailCount: integer;
begin
  Result:=fEmail.Count;
end;

function UVcard.getEmailType(i: integer): UEmailType;
begin
  Result:=getEmailtype(fEmail[i]);
end;

function UVcard.getAddressAttributes(p: PVObject): UAddressAttributes;
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
  ss : UAddressAttributes;
begin
  ss:=[];
  initPropIterator(@t, p);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VCDomesticProp)=0) then
      Include(ss,vcaDomestic)
    else if (CompareStr(n, VCInternationalProp)=0) then
      Include(ss,vcaInternational)
    else if (CompareStr(n, VCPostalProp)=0) then
      Include(ss,vcaPostal)
    else if (CompareStr(n, VCParcelProp)=0) then
      Include(ss,vcaParcel)
    else if (CompareStr(n, VCHomeProp)=0) then
      Include(ss,vcaHome)
    else if (CompareStr(n, VCWorkProp)=0) then
      Include(ss,vcaWork)
  end;
  Result:=ss;
end;

function UVcard.getEmailAttributes(i: integer): UPhoneAttributes;
begin
  Result:=getPhoneAttributes(fEmail.Items[i]);
end;

procedure UVcard.ClearReferences;
begin
    fFormattedName       :=nil;
    fFamilyName:=nil; fGivenName:=nil; fAdditionalName:=nil;
        fnamePrefixes:=nil; fNameSuffixes  :=nil;
    fPhoto              :=nil;
    fBirthday           :=nil;
    fYellowPage         :=nil;
//    fAdr_PostOfficeAddress.clear; fAdr_ExtendedAddress.clear; fAdr_Street.clear;
//        fAdr_Locality.clear; fAdr_Region.clear; fAdr_PostalCode.clear; fAdr_Country.clear;
//    fLabel              : TList;
    fTelnum.Clear;
    fEmail.Clear;
    fAdr.Clear;
    fURL.Clear;
    fNote.Clear;
//    fMailer             :=nil;  // no
//    fTimeZone           :=nil;  // no
//    fGeo                :=nil;  // no
//    fTitle              :=nil;
//    fRole               :=nil;
//    fLogo               :=nil;
//    fAgent              : UVcard;
//    fOrg_Name:=nil; fOrg_Unit:=nil; fOrg_additionalPosition :=nil;
//    fCompany_Notenil:=nil; fPersonal_Note       :=nil;   // by grouping   or X
//    fRev                :=nil;
//    fSound              :=nil;
//    fCompany_URL:=nil; fPersonal_URL :=nil;   // by grouping   or X
//    fUID                :=nil;
//    fVersion            :=nil;
//    fKey                :=nil;

    fNameProp           :=nil;

end;

function UVcard.getPropertyValue(p: PVObject): string;
var ps : PChar;
begin
  if p<>nil then
    ps:=fakeCString(vObjectUStringZValue(p))
  else
    ps:='';
  Result:=ps;
  DeleteStr(ps);
end;

function UVcard.AssignPhonePropertyValue(telnum: PChar; wt: UPhoneAttributes) : PVObject;
var
  p   : PVObject;
begin
  p:=AssignPropertyValue(fVCard, VCTelephoneProp, telnum, true);
  ftelnum.add(p);

  addPhoneAttributes(p, wt);

  Result:=p;

end;

function UVcard.getPhone(i: integer): string;
begin
    Result:=getPropertyValue(fTelnum.Items[i]);
end;

function UVcard.getPhoneAttributes(p : PVObject): UPhoneAttributes;
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
  ss : UPhoneAttributes;
begin
  ss:=[];
  initPropIterator(@t, p);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VCPreferredProp)=0) then
      Include(ss,vctPreferred)
    else if (CompareStr(n, VCWorkProp)=0) then
      Include(ss,vctWork)
    else if (CompareStr(n, VCHomeProp)=0) then
      Include(ss,vctHome)
    else if (CompareStr(n, VCVoiceProp)=0) then
      Include(ss,vctVoice)
    else if (CompareStr(n, VCFaxProp)=0) then
      Include(ss,vctFax)
    else if (CompareStr(n, VCMessageProp)=0) then
      Include(ss,vctMessage)
    else if (CompareStr(n, VCCellularProp)=0) then
      Include(ss,vctCellular)
    else if (CompareStr(n, VCPagerProp)=0) then
      Include(ss,vctPager)
    else if (CompareStr(n, VCBBSProp)=0) then
      Include(ss,vctBBS)
    else if (CompareStr(n, VCModemProp)=0) then
      Include(ss,vctModem)
    else if (CompareStr(n, VCCarProp)=0) then
      Include(ss,vctCar)
    else if (CompareStr(n, VCISDNProp)=0) then
      Include(ss,vctISDN)
    else if (CompareStr(n, VCVideoProp)=0) then
      Include(ss,vctVideo)
  end;
  Result:=ss;

end;

function UVcard.getPhoneCount: integer;
begin
  Result:=fTelnum.Count;
end;

procedure UVcard.ProcessPhone(p: PVObject);
begin
  fTelnum.Add(p);
end;

function UVcard.AssignProperty(o: PVObject; prop: PChar; dup : boolean) : PVObject;
var
  p  : PVObject;
begin
  if dup then
    p:=AddProp(o, prop)
  else
  begin
    p:= isAPropertyOf(o,  prop);
    if (p=nil) then
      p:=AddProp(o, prop);
  end;

  Result:=p;
end;

procedure UVcard.AddPhoneAttributes(p: PVObject; wt: UPhoneAttributes);
begin
     if vctPreferred in wt then
      AssignProperty(p, VCPreferredProp);
     if vctWork  in wt then
      AssignProperty(p, VCWorkProp);
     if vctHome  in wt then
      AssignProperty(p, VCHomeProp);
     if vctVoice  in wt then
      AssignProperty(p, VCVoiceProp);
     if vctFax  in wt then
      AssignProperty(p, VCFaxProp);
     if vctMessage  in wt then
      AssignProperty(p, VCMessageProp);
     if vctCellular  in wt then
      AssignProperty(p, VCCellularProp);
     if vctPager  in wt then
      AssignProperty(p, VCPagerProp);
     if vctBBS  in wt then
      AssignProperty(p, VCBBSProp);
     if vctModem  in wt then
      AssignProperty(p, VCModemProp);
     if vctCar  in wt then
      AssignProperty(p, VCCarProp);
     if vctVideo  in wt then
      AssignProperty(p, VCVideoProp);
     if vctISDN  in wt then
      AssignProperty(p, VCISDNProp);

end;

function UVcard.getPhoneAttributes(i: integer): UPhoneAttributes;
begin
  Result:=getPhoneAttributes(ftelnum.items[i]);
end;

procedure UVcard.AddEmailType(p: PVObject; ww: UEmailType);
var temp  : UEmailtype;
begin
  temp:= GetEmailType(p);
  if temp=ww then
    exit
  else
  begin
     AssignProperty(p, getEmailTypeStr(ww));
  end;
end;

function UVcard.getEmailType(p: PVObject): UEmailType;
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
begin
  initPropIterator(@t, p);
  Result:=vceNone;
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VCAOLProp)=0) then
      Result:=vceAOL
    else if (CompareStr(n, VCAppleLinkProp)=0) then
      Result:=vceAppleLink
    else if (CompareStr(n, VCATTMailProp)=0) then
      Result:=vceATTMail
    else if (CompareStr(n, VCCISProp)=0) then
      Result:=vceCIS
    else if (CompareStr(n, VCeWorldProp)=0) then
      Result:=vceeWorld
    else if (CompareStr(n, VCINTERNETProp)=0) then
      Result:=vceINTERNET
    else if (CompareStr(n, VCIBMMailProp)=0) then
      Result:=vceIBMMail
    else if (CompareStr(n, VCMCIMailProp)=0) then
      Result:=vceMCIMail
    else if (CompareStr(n, VCPOWERSHAREProp)=0) then
      Result:=vcePOWERSHARE
    else if (CompareStr(n, VCPRODIGYProp)=0) then
      Result:=vcePRODIGY
    else if (CompareStr(n, VCTLXProp)=0) then
      Result:=vceTLX
    else if (CompareStr(n, VCX400Prop)=0) then
      Result:=vceX400
  end;


end;

function UVcard.getEmailTypeStr(u: UemailType): PChar;
begin
    case u of
      vceAOL:     Result:=VCAOLProp;
      vceAppleLink: Result:= VCAppleLinkProp;
      vceATTMail:  Result:= VCATTMailProp;
      vceCIS:      Result:= VCCISProp;
      vceeWorld:   Result:= VCeWorldProp;
      vceInternet: Result:= VCINTERNETProp;
      vceIBMMail:  Result:= VCIBMMailProp;
      vceMCIMail:  Result:= VCMCIMailProp;
      vcePowerShare:  Result:= VCPOWERSHAREProp;
      vceProdigy:   Result:= VCPRODIGYProp;
      vceTLX:      Result:= VCTLXProp;
      vceX400:     Result:= VCX400Prop;
    end;

end;


procedure UVcard.CleanVCard;
begin
  clearReferences;
  CleanVObject(fVCard);
//  CreateNewVCard;
end;

procedure UVcard.ProcessAddress(p: PVObject);
begin
  fAdr.Add(p);   // fNameProp arleady cleaned while fVCard cleaned
end;

procedure UVcard.ProcessOrg(p: PVObject);
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
begin
  fOrgProp:=p;   // fNameProp arleady cleaned while fVCard cleaned
  initPropIterator(@t, p);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VCOrgNameProp)=0) then
      fOrg_Name:=eachProp
    else if (CompareStr(n, VCOrgUnitProp)=0) then
      fOrg_Unit:=eachProp
    else if (CompareStr(n, VCOrgUnit2Prop)=0) then
      fOrg_Unit2:=eachProp
  end;

end;

function UVcard.AssignOrg(oname, u, u2: string): PVObject;
begin
  fOrgProp:=AssignProperty(fVCard, VCOrgProp);
  if oname<>'' then
    fOrg_Name:=AssignPropertyValue(fOrgProp, VCOrgNameProp, PChar(oname));
  if u<>'' then
    fOrg_Unit:=AssignPropertyValue(fOrgProp, VCOrgUnitProp, PChar(u));
  if u2<>'' then
    fOrg_Unit2:=AssignPropertyValue(fOrgProp, VCOrgUNit2Prop, PChar(u2));

  Result:=fOrgProp
end;

function UVcard.getOrg: string;
begin
  Result:=getOrgName;
  if getOrgUnit<>'' then
    Result:=Result+'; '+getOrgUnit;
  if getOrgUnit2<>'' then
    Result:=Result+'; '+getOrgUnit2;
end;

function UVcard.getOrgName: string;
begin
  Result:=getPropertyValue(fOrg_Name);
end;

function UVcard.getOrgUnit: string;
begin
  Result:=getPropertyValue(fOrg_Unit);
end;

function UVcard.getOrgUnit2: string;
begin
  Result:=getPropertyValue(fOrg_Unit2);
end;

function UVcard.AssignName(s1, s2, s3, s4, s5: string): PVObject;
begin
    if s1<>'' then
      AssignFamilyName(s1 );
    if s2<>'' then
      AssignGivenName(s2 );
    if s3<>'' then
      AssignAdditionalName(s3);
    if s4<>'' then
      AssignNamePrefix(s4 );
    if s5<>'' then
      AssignNameSuffix(s5 );

    Result:=fnameprop;
end;

function UVcard.getAddressAttributes(i: integer): UAddressAttributes;
begin
  Result:=getAddressAttributes(fAdr.Items[i]);
end;

function UVcard.getAddressCount: integer;
begin
  Result:=fAdr.Count;
end;

function UVcard.GetAddressComp(a : PVObject; c: PChar): PVObject;
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
begin
  Result:=nil;
  initPropIterator(@t, a);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, c)=0) then
    begin
      Result:=eachProp;
      break;
    end;
  end;

end;

function UVcard.GetAddressF1(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCPostalBoxProp ));
end;

function UVcard.GetAddressF2(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCExtAddressProp ));
end;

function UVcard.GetAddressF3(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i],VCStreetAddressProp  ));
end;

function UVcard.GetAddressF4(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCCityProp  ));
end;

function UVcard.GetAddressF5(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCRegionProp ));
end;

function UVcard.GetAddressF6(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCPostalCodeProp ));
end;

function UVcard.GetAddressF7(i: integer): string;
begin
  Result:=GetPropertyValue(GetAddressComp(fAdr.Items[i], VCCountryNameProp ));
end;

function UVcard.AssignAddress(a1, a2, a3, a4, a5, a6, a7: string;
  aa: UAddressAttributes): PVObject;
var
  p   : PVObject;
begin
  if (a1<>'') or (a2<>'') or (a3<>'') or (a4<>'') or (a5<>'') or (a6<>'') or (a7<>'') then
    p:=AssignProperty(fVCard, VCAdrProp, true)
  else
  begin
    Result:=nil;
    exit;
  end;

  if a1<>'' then
    AssignPropertyValue(p, VCPostalboxProp, PChar(a1));
  if a2<>'' then
    AssignPropertyValue(p, VCExtAddressProp, PChar(a2));
  if a3<>'' then
    AssignPropertyValue(p, VCStreetAddressProp, PChar(a3));
  if a4<>'' then
    AssignPropertyValue(p, VCCityProp, PChar(a4)) ;
  if a5<>'' then
    AssignPropertyValue(p, VCRegionProp, PChar(a5));
  if a6<>'' then
    AssignPropertyValue(p, VCPostalCodeProp, PChar(a6)) ;
  if a7<>'' then
    AssignPropertyValue(p, VCCountryNameProp, PChar(a7));

  addAddressAttributes(p, aa);
  fAdr.add(p);

  Result:=p;

end;

procedure UVcard.AddAddressAttributes(p: PVObject; aa: UAddressAttributes);
begin
     if vcaDomestic in aa then
      AssignProperty(p, VCDomesticProp) ;
     if vcaInternational  in aa  then
      AssignProperty(p, VCInternationalProp);
     if  vcaPostal in aa  then
      AssignProperty(p, VCPostalProp);
     if  vcaParcel in aa  then
      AssignProperty(p, VCParcelProp);
     if vcaHome  in aa  then
      AssignProperty(p, VCHomeProp);
     if  vcaWork in aa  then
      AssignProperty(p, VCWorkProp);
     if vcaQuotedPrintable  in aa then
      AssignProperty(p, VCQuotedPrintableProp);
end;

function UVcard.AssignTitle(s: string): PVObject;
begin
  Result:=AssignPropertyValue(fVCard, VCTitleProp, PChar(s));
end;

function UVcard.GetTitle: string;
begin
  Result:=GetPropertyValue(fTitle);
end;

procedure UVcard.ProcessTitle(p : PVObject);
begin
  fTitle:=p;
end;

function UVcard.AssignURL(ur: string; wt: UURLAttributes): PVObject;
var
  p   : PVObject;
begin
  p:=AssignPropertyValue(fVCard, VCURLProp, PChar(ur), true);
  fURL.add(p);

  addPhoneAttributes(p, wt);

  Result:=p;
end;

function UVcard.GetURL(i: integer): string;
begin
    Result:=getPropertyValue(fURL.Items[i]);
end;


function UVcard.GetURLAttributes(i: integer): UURLAttributes;
begin
  Result:=getPhoneAttributes(fURL.Items[i]);
end;

procedure UVcard.ProcessURL(p: PVObject);
begin
  fURL.Add(p);
end;

function UVcard.AssignNote(ur: string; wt: UNoteAttributes): PVObject;
var
  p   : PVObject;
begin
  p:=AssignPropertyValue(fVCard, VCNoteProp, PChar(ur), true);
  fNote.add(p);

  addNoteAttributes(p, wt);

  Result:=p;
end;

function UVcard.GetNote(i: integer): string;
begin
    Result:=getPropertyValue(fNote.Items[i]);
end;

function UVcard.GetNoteAttributes(i: integer): UNoteAttributes;
begin
  Result:=getNoteAttributes(fNote.Items[i]);
end;

procedure UVcard.ProcessNote(p: PVObject);
begin
  fNote.Add(p);
end;

procedure UVcard.AddNoteAttributes(p: PVObject; aa: UNoteAttributes);
begin
     if vcnBase64  in aa then
      AssignProperty(p, VCBase64Prop);
     if vcn8bit  in aa then
      AssignProperty(p, VC8bitProp);
     if vcnQuotedPrintable  in aa then
      AssignProperty(p, VCQuotedPrintableProp);
     if vcnWork  in aa then
      AssignProperty(p, VCWorkProp);
     if vcnHome  in aa then
      AssignProperty(p, VCHomeProp);

end;

function UVcard.GetNoteAttributes(p: PVObject): UNoteAttributes;
var t : VObjectIterator;
  eachProp : PVObject;
  n     : PChar;
  ss : UNoteAttributes;
begin
  ss:=[];
  initPropIterator(@t, p);
  while (moreIteration(@t)<>0) do
  begin
    eachProp:=nextVObject(@t);
    n:=vObjectName(eachProp);
    if (CompareStr(n, VC8BitProp)=0) then
      Include(ss,vcn8bit)
    else if (CompareStr(n, VCBase64Prop)=0) then
      Include(ss,vcnBase64)
    else if (CompareStr(n, VCQuotedPrintableProp)=0) then
      Include(ss,vcnQuotedPrintable)
    else if (CompareStr(n, VCWorkProp)=0) then
      Include(ss,vcnWork)
    else if (CompareStr(n, VCHomeProp)=0) then
      Include(ss,vcnHome)
  end;
  Result:=ss;
end;

function UVcard.GetNoteCount: integer;
begin
  Result:=fNote.Count;
end;

function UVcard.GetUrlCount: integer;
begin
  Result:=fUrl.Count;
end;

function UVcard.assignYellowPage(s: string): PVObject;
begin
  fYellowPage:=AssignPropertyValue(fVCard, VCX_YellowPage, PChar(s));
  Result:= fYellowPage ;
end;

function UVcard.getYellowPage: string;
begin
  Result:=getPropertyValue(fYellowPage);
end;

procedure UVcard.processYellowPage(p: PVObject);
begin
  fYellowPage:=p;
end;

end.
