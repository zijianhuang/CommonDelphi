unit Uvcls;
{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}


interface

uses Windows;//Classes, SysUtils;

const
{$EXTERNALSYM VC7bitProp }
  VC7bitProp	=		'7BIT'             ;
{$EXTERNALSYM  VC8bitProp}
  VC8bitProp	  =			'8BIT'     ;
{$EXTERNALSYM  VCAAlarmProp}
  VCAAlarmProp		=	'AALARM'           ;
{$EXTERNALSYM VCAdditionalNamesProp }
  VCAdditionalNamesProp=	'ADDN'             ;
{$EXTERNALSYM VCAdrProp }
  VCAdrProp		  =		'ADR'      ;
{$EXTERNALSYM VCAgentProp }
  VCAgentProp		   =		'AGENT'    ;
{$EXTERNALSYM VCAIFFProp }
  VCAIFFProp		   =		'AIFF'     ;
{$EXTERNALSYM VCAOLProp }
  VCAOLProp		   =		'AOL'      ;
{$EXTERNALSYM VCAppleLinkProp }
  VCAppleLinkProp	   =		'APPLELINK';
{$EXTERNALSYM VCAttachProp }
  VCAttachProp		   =	'ATTACH'           ;
{$EXTERNALSYM  VCAttendeeProp}
  VCAttendeeProp	   =		'ATTENDEE' ;
{$EXTERNALSYM  VCATTMailProp}
  VCATTMailProp		   =	'ATTMAIL'          ;
{$EXTERNALSYM VCAudioContentProp }
  VCAudioContentProp	   =	'AUDIOCONTENT'     ;
{$EXTERNALSYM VCAVIProp }
  VCAVIProp		   =		'AVI'      ;
{$EXTERNALSYM  VCBase64Prop}
  VCBase64Prop		   =	'BASE64'           ;
{$EXTERNALSYM VCBBSProp }
  VCBBSProp		   =		'BBS'      ;
{$EXTERNALSYM VCBirthDateProp }
  VCBirthDateProp	   =		'BDAY'     ;
{$EXTERNALSYM  VCBMPProp}
  VCBMPProp		   =		'BMP'      ;
{$EXTERNALSYM VCBodyProp }
  VCBodyProp		   =		'BODY'     ;
{$EXTERNALSYM  VCBusinessRoleProp}
  VCBusinessRoleProp	   =	'ROLE'             ;
{$EXTERNALSYM  VCCalProp}
  VCCalProp		   =		'VCALENDAR';
{$EXTERNALSYM  VCCaptionProp}
  VCCaptionProp		   =	'CAP'              ;
{$EXTERNALSYM  VCCardProp}
  VCCardProp		   =		'VCARD'    ;
{$EXTERNALSYM  VCCarProp}
  VCCarProp		   =		'CAR'      ;
{$EXTERNALSYM VCCategoriesProp }
  VCCategoriesProp	   =	'CATEGORIES'       ;
{$EXTERNALSYM VCCellularProp }
  VCCellularProp	   =		'CELL'     ;
{$EXTERNALSYM  VCCGMProp}
  VCCGMProp		   =		'CGM'      ;
{$EXTERNALSYM  VCCharSetProp}
  VCCharSetProp		   =	'CS'               ;
{$EXTERNALSYM  VCCIDProp}
  VCCIDProp		   =		'CID'      ;
{$EXTERNALSYM  VCCISProp}
  VCCISProp		   =		'CIS'      ;
{$EXTERNALSYM  VCCityProp}
  VCCityProp		   =		'L'        ;
{$EXTERNALSYM  VCClassProp}
  VCClassProp		   =		'CLASS'    ;
{$EXTERNALSYM  VCCommentProp}
  VCCommentProp		   =	'NOTE'             ;
{$EXTERNALSYM  VCCompletedProp}
  VCCompletedProp	   =		'COMPLETED';
{$EXTERNALSYM VCContentIDProp }
  VCContentIDProp	   =		'CONTENT-ID' ;
{$EXTERNALSYM  VCCountryNameProp}
  VCCountryNameProp	   =	'C'                  ;
{$EXTERNALSYM  VCDAlarmProp}
  VCDAlarmProp		   =	'DALARM'             ;
{$EXTERNALSYM  VCDataSizeProp}
  VCDataSizeProp	   =		'DATASIZE'   ;
{$EXTERNALSYM  VCDayLightProp}
  VCDayLightProp	   =		'DAYLIGHT'   ;
{$EXTERNALSYM  VCDCreatedProp}
  VCDCreatedProp	   =		'DCREATED'   ;
{$EXTERNALSYM  VCDeliveryLabelProp}
  VCDeliveryLabelProp    = 'LABEL'                   ;
{$EXTERNALSYM  VCDescriptionProp}
  VCDescriptionProp	 =	'DESCRIPTION'        ;
{$EXTERNALSYM  VCDIBProp}
  VCDIBProp		 =		'DIB'        ;
{$EXTERNALSYM  VCDisplayStringProp}
  VCDisplayStringProp	 =	'DISPLAYSTRING'      ;
{$EXTERNALSYM  VCDomesticProp}
  VCDomesticProp	 =		'DOM'        ;
{$EXTERNALSYM VCDTendProp }
  VCDTendProp		 =		'DTEND'      ;
{$EXTERNALSYM  VCDTstartProp}
  VCDTstartProp		 =	'DTSTART'            ;
{$EXTERNALSYM VCDueProp }
  VCDueProp		 =		'DUE'        ;
{$EXTERNALSYM  VCEmailAddressProp}
  VCEmailAddressProp	 =	'EMAIL'              ;
{$EXTERNALSYM VCEncodingProp }
  VCEncodingProp	 =		'ENCODING'   ;
{$EXTERNALSYM  VCEndProp}
  VCEndProp		 =		'END'        ;
{$EXTERNALSYM  VCEventProp}
  VCEventProp		 =		'VEVENT'     ;
{$EXTERNALSYM  VCEWorldProp}
  VCEWorldProp		 =	'EWORLD'             ;
{$EXTERNALSYM  VCExNumProp}
  VCExNumProp		 =		'EXNUM'      ;
{$EXTERNALSYM VCExpDateProp }
  VCExpDateProp		 =	'EXDATE'             ;
{$EXTERNALSYM VCExpectProp }
  VCExpectProp		 =	'EXPECT'             ;
{$EXTERNALSYM  VCExtAddressProp}
  VCExtAddressProp	 =	'EXT ADD'            ;
{$EXTERNALSYM VCFamilyNameProp }
  VCFamilyNameProp	 =	'F'                  ;
{$EXTERNALSYM VCFaxProp }
  VCFaxProp		 =		'FAX'        ;
{$EXTERNALSYM  VCFullNameProp}
  VCFullNameProp	 =		'FN'         ;
{$EXTERNALSYM VCGeoProp }
  VCGeoProp		 =		'GEO'        ;
{$EXTERNALSYM  VCGeoLocationProp}
  VCGeoLocationProp	 =	'GEO'                ;
{$EXTERNALSYM VCGIFProp }
  VCGIFProp		 =		'GIF'        ;
{$EXTERNALSYM  VCGivenNameProp}
  VCGivenNameProp	 =		'G'          ;
{$EXTERNALSYM  VCGroupingProp}
  VCGroupingProp	 =		'Grouping'   ;
{$EXTERNALSYM VCHomeProp }
  VCHomeProp		 =		'HOME'       ;
{$EXTERNALSYM VCIBMMailProp }
  VCIBMMailProp		 =	'IBMMail'            ;
{$EXTERNALSYM  VCInlineProp}
  VCInlineProp		 =	'INLINE'             ;
{$EXTERNALSYM VCInternationalProp }
  VCInternationalProp	 =	'INTL'               ;
{$EXTERNALSYM VCInternetProp }
  VCInternetProp	 =		'INTERNET'   ;
{$EXTERNALSYM  VCISDNProp}
  VCISDNProp		 =		'ISDN'       ;
{$EXTERNALSYM  VCJPEGProp}
  VCJPEGProp		 =		'JPEG'       ;
{$EXTERNALSYM  VCLanguageProp}
  VCLanguageProp	 =		'LANG'       ;
{$EXTERNALSYM  VCLastModifiedProp}
  VCLastModifiedProp	 =	'LAST-MODIFIED'      ;
{$EXTERNALSYM  VCLastRevisedProp}
  VCLastRevisedProp	 =	'REV'                ;
{$EXTERNALSYM  VCLocationProp}
  VCLocationProp	 =		'LOCATION'   ;
{$EXTERNALSYM  VCLogoProp}
  VCLogoProp		 =		'LOGO'       ;
{$EXTERNALSYM  VCMailerProp}
  VCMailerProp		 =	'MAILER'             ;
{$EXTERNALSYM VCMAlarmProp }
  VCMAlarmProp		 =	'MALARM'             ;
{$EXTERNALSYM VCMCIMailProp }
  VCMCIMailProp		 =	'MCIMAIL'            ;
{$EXTERNALSYM VCMessageProp }
  VCMessageProp		 =	'MSG'                ;
{$EXTERNALSYM  VCMETProp}
  VCMETProp		 =		'MET'        ;
{$EXTERNALSYM  VCModemProp}
  VCModemProp		 =		'MODEM'      ;
{$EXTERNALSYM  VCMPEG2Prop}
  VCMPEG2Prop		 =		'MPEG2'      ;
{$EXTERNALSYM  VCMPEGProp}
  VCMPEGProp		 =		'MPEG'       ;
{$EXTERNALSYM VCMSNProp }
  VCMSNProp		 =		'MSN'        ;
{$EXTERNALSYM  VCNamePrefixesProp}
  VCNamePrefixesProp	 =	'NPRE'               ;
{$EXTERNALSYM VCNameProp }
  VCNameProp		 =		'N'          ;
{$EXTERNALSYM  VCNameSuffixesProp}
  VCNameSuffixesProp	 =	'NSUF'               ;
{$EXTERNALSYM  VCNoteProp}
  VCNoteProp		 =		'NOTE'       ;
{$EXTERNALSYM  VCOrgNameProp}
  VCOrgNameProp		 =	'ORGNAME'            ;
{$EXTERNALSYM VCOrgProp }
  VCOrgProp		 =		'ORG'        ;
{$EXTERNALSYM  VCOrgUnit2Prop}
  VCOrgUnit2Prop	 =		'OUN2'       ;
{$EXTERNALSYM  VCOrgUnit3Prop}
  VCOrgUnit3Prop	 =		'OUN3'       ;
{$EXTERNALSYM VCOrgUnit4Prop }
  VCOrgUnit4Prop	 =		'OUN4'       ;
{$EXTERNALSYM VCOrgUnitProp }
  VCOrgUnitProp		 =	'OUN'                ;
{$EXTERNALSYM  VCPagerProp}
  VCPagerProp		 =		'PAGER'      ;
{$EXTERNALSYM  VCPAlarmProp}
  VCPAlarmProp		 =	'PALARM'             ;
{$EXTERNALSYM  VCParcelProp}
  VCParcelProp		 =	'PARCEL'             ;
{$EXTERNALSYM  VCPartProp}
  VCPartProp		 =		'PART'       ;
{$EXTERNALSYM  VCPCMProp}
  VCPCMProp		 =		'PCM'        ;
{$EXTERNALSYM  VCPDFProp}
  VCPDFProp		 =		'PDF'        ;
{$EXTERNALSYM  VCPGPProp}
  VCPGPProp		 =		'PGP'        ;
{$EXTERNALSYM VCPhotoProp }
  VCPhotoProp		 =		'PHOTO'      ;
{$EXTERNALSYM VCPICTProp }
  VCPICTProp		 =		'PICT'       ;
{$EXTERNALSYM  VCPMBProp}
  VCPMBProp		 =		'PMB'        ;
{$EXTERNALSYM  VCPostalBoxProp}
  VCPostalBoxProp	 =		'BOX'        ;
{$EXTERNALSYM  VCPostalCodeProp}
  VCPostalCodeProp	 =	'PC'                 ;
{$EXTERNALSYM  VCPostalProp}
  VCPostalProp		 =	'POSTAL'             ;
{$EXTERNALSYM  VCPowerShareProp}
  VCPowerShareProp	 =	'POWERSHARE'         ;
{$EXTERNALSYM  VCPreferredProp}
  VCPreferredProp	 =		'PREF'       ;
{$EXTERNALSYM  VCPriorityProp}
  VCPriorityProp	 =		'PRIORITY'   ;
{$EXTERNALSYM  VCProcedureNameProp}
  VCProcedureNameProp	 =	'PROCEDURENAME'      ;
{$EXTERNALSYM  VCProdIdProp}
  VCProdIdProp		 =	'PRODID'             ;
{$EXTERNALSYM  VCProdigyProp}
  VCProdigyProp		 =	'PRODIGY'            ;
{$EXTERNALSYM  VCPronunciationProp}
  VCPronunciationProp	 =	'SOUND'              ;
{$EXTERNALSYM  VCPSProp}
  VCPSProp		 =		'PS'         ;
{$EXTERNALSYM  VCPublicKeyProp}
  VCPublicKeyProp	 =		'KEY'        ;
{$EXTERNALSYM  VCQPProp}
  VCQPProp		 =		'QP'         ;
{$EXTERNALSYM  VCQuickTimeProp}
  VCQuickTimeProp	 =		'QTIME'      ;
{$EXTERNALSYM  VCQuotedPrintableProp}
  VCQuotedPrintableProp	='QUOTED-PRINTABLE'          ;
{$EXTERNALSYM  VCRDateProp}
  VCRDateProp		 =		'RDATE'      ;
{$EXTERNALSYM  VCRegionProp}
  VCRegionProp		 =	'R'                  ;
{$EXTERNALSYM  VCRelatedToProp}
  VCRelatedToProp	 =		'RELATED-TO' ;
{$EXTERNALSYM  VCRepeatCountProp}
  VCRepeatCountProp	 =	'REPEATCOUNT'        ;
{$EXTERNALSYM  VCResourcesProp}
  VCResourcesProp	 =		'RESOURCES'  ;
{$EXTERNALSYM  VCRNumProp}
  VCRNumProp		 =		'RNUM'       ;
{$EXTERNALSYM  VCRoleProp}
  VCRoleProp		 =		'ROLE'       ;
{$EXTERNALSYM  VCRRuleProp}
  VCRRuleProp		 =		'RRULE'      ;
{$EXTERNALSYM  VCRSVPProp}
  VCRSVPProp		 =		'RSVP'       ;
{$EXTERNALSYM VCRunTimeProp }
  VCRunTimeProp		 =	'RUNTIME'            ;
{$EXTERNALSYM  VCSequenceProp}
  VCSequenceProp	 =		'SEQUENCE'   ;
{$EXTERNALSYM  VCSnoozeTimeProp}
  VCSnoozeTimeProp	 =	'SNOOZETIME'         ;
{$EXTERNALSYM  VCStartProp}
  VCStartProp		 =		'START'      ;
{$EXTERNALSYM  VCStatusProp}
  VCStatusProp		 =	'STATUS'             ;
{$EXTERNALSYM  VCStreetAddressProp}
  VCStreetAddressProp	 =	'STREET'             ;
{$EXTERNALSYM  VCSubTypeProp}
  VCSubTypeProp		 =	'SUBTYPE'            ;
{$EXTERNALSYM  VCSummaryProp}
  VCSummaryProp		 =	'SUMMARY'            ;
{$EXTERNALSYM VCTelephoneProp }
  VCTelephoneProp	 =		'TEL'        ;
{$EXTERNALSYM VCTIFFProp }
  VCTIFFProp		 =		'TIFF'       ;
{$EXTERNALSYM  VCTimeZoneProp}
  VCTimeZoneProp	 =		'TZ'         ;
{$EXTERNALSYM  VCTitleProp}
  VCTitleProp		 =		'TITLE'      ;
{$EXTERNALSYM VCTLXProp }
  VCTLXProp		 =		'TLX'        ;
{$EXTERNALSYM  VCTodoProp}
  VCTodoProp		 =		'VTODO'      ;
{$EXTERNALSYM VCTranspProp }
  VCTranspProp		 =	'TRANSP'             ;
{$EXTERNALSYM VCUniqueStringProp }
  VCUniqueStringProp	 =	'UID'                ;
{$EXTERNALSYM VCURLProp }
  VCURLProp		 =		'URL'        ;
{$EXTERNALSYM  VCURLValueProp}
  VCURLValueProp	 =		'URLVAL'     ;
{$EXTERNALSYM  VCValueProp}
  VCValueProp		 =		'VALUE'      ;
{$EXTERNALSYM  VCVersionProp}
  VCVersionProp		 =	'VERSION'            ;
{$EXTERNALSYM VCVideoProp }
  VCVideoProp		 =		'VIDEO'      ;
{$EXTERNALSYM  VCVoiceProp}
  VCVoiceProp		 =		'VOICE'      ;
{$EXTERNALSYM VCWAVEProp }
  VCWAVEProp		 =		'WAVE'       ;
{$EXTERNALSYM VCWMFProp }
  VCWMFProp		 =		'WMF'        ;
{$EXTERNALSYM  VCWorkProp}
  VCWorkProp		 =		'WORK'       ;
{$EXTERNALSYM VCX400Prop }
  VCX400Prop		 =		'X400'       ;
{$EXTERNALSYM  VCX509Prop}
  VCX509Prop		 =		'X509'       ;
{$EXTERNALSYM  VCXRuleProp}
  VCXRuleProp		 =		'XRULE'      ;

  VCX_YellowPage        =               'X-Arlido-Yellow' ;


// return type of vObjectValueType: */
 VCVT_NOVALUE =	0;
	// if the VObject has no value associated with it. */
 VCVT_STRINGZ =	1 ;
	// if the VObject has value set by setVObjectStringZValue. */
 VCVT_USTRINGZ =	2 ;
	// if the VObject has value set by setVObjectUStringZValue. */
 VCVT_UINT  =		3 ;
	// if the VObject has value set by setVObjectIntegerValue. */
 VCVT_ULONG   =		4  ;
	// if the VObject has value set by setVObjectLongValue. */
 VCVT_RAW     =		5  ;
	// if the VObject has value set by setVObjectAnyValue. */
 VCVT_VOBJECT =	6         ;
	// if the VObject has value set by setVObjectVObjectValue. */
type


{  ValueItem=record
    case integer of
      0:  (strs        : PChar);
      1:  (ustrs       :PWidechar);
      2:  (i           : Word);
      3:  ( l           : LongWord);
      4:  (any         : Pointer);
      5:  (vobj        : PVObject);
    end;
  end;  }

  PVObject=^VObject;

  {$EXTERNALSYM VObject}
  VObject=record
    next        : PVObject;
    id          : PChar;
    prop        : PVObject;
    valType     : word;
    val         : record
    case integer of
      0:  (strs        : PChar);
      1:  (ustrs       : PWideChar);
      2:  (i           : Word);
      3:  (l           : LongWord);
      4:  (any         : Pointer);
      5:  (vobj        : PVObject);
    end;
  end;

  PPVObject=^PVObject;

  {$EXTERNALSYM  VObjectIterator}
  VObjectIterator = record
    start : PVObject;
    next  : PVObject;
  end;

  PVObjectIterator =  ^VObjectIterator;
{$EXTERNALSYM   newVObject}
  function newVObject(id  : PChar) : PVObject; cdecl;
{$EXTERNALSYM   deleteVObject}
  procedure  deleteVObject(p  : PVobject);                cdecl;
{$EXTERNALSYM   dupStr}
  function dupStr(s  : PChar; size : Cardinal) : PChar;   cdecl;
{$EXTERNALSYM   deleteStr}
  procedure  deleteStr(p : PChar);                        cdecl;
{$EXTERNALSYM   unUseStr}
  procedure  unUseStr(s : PChar);                         cdecl;

{$EXTERNALSYM   setVObjectName}
  procedure setVObjectName(o : PVObject;  id  : PChar);             cdecl;
{$EXTERNALSYM   setVObjectStringZValue}
  procedure  setVObjectStringZValue(o : PVObject; s : PChar);       cdecl;
{$EXTERNALSYM   setVObjectStringZValue_}
  procedure  setVObjectStringZValue_(o : PVObject; s  : PChar);     cdecl;
{$EXTERNALSYM   setVObjectUStringZValue}
  procedure  setVObjectUStringZValue(o :PVObject; s : PWideChar);   cdecl;
{$EXTERNALSYM   setVObjectUStringZValue_}
  procedure  setVObjectUStringZValue_(o :PVObject; s : PWideChar);  cdecl;
{$EXTERNALSYM   setVObjectIntegerValue}
  procedure  setVObjectIntegerValue(o :PVObject; i : Cardinal);     cdecl;
{$EXTERNALSYM   setVObjectLongValue}
  procedure  setVObjectLongValue(o :PVObject;   l : Cardinal);      cdecl;
{$EXTERNALSYM   setVObjectAnyValue}
  procedure  setVObjectAnyValue(o :PVObject;  t : Pointer);         cdecl;
{$EXTERNALSYM   setValueWithSize}
  function  setValueWithSize(prop : PVObject; val : Pointer;  size : Cardinal) : PVObject; cdecl;
{$EXTERNALSYM   setValueWithSize_}
  function setValueWithSize_(prop : PVObject; val : Pointer;  size : Cardinal) : PVObject; cdecl;

{$EXTERNALSYM   vObjectName}
  function vObjectName(o : PVObject) : PChar;                 cdecl;
{$EXTERNALSYM   vObjectStringZValue}
  function  vObjectStringZValue(o : PVObject): PChar;         cdecl;
{$EXTERNALSYM   vObjectUStringZValue}
  function  vObjectUStringZValue(o : PVObject) : PWideChar;   cdecl;
{$EXTERNALSYM  vObjectIntegerValue }
  function  vObjectIntegerValue(o : PVObject) : Cardinal;     cdecl;
{$EXTERNALSYM  vObjectLongValue }
  function  vObjectLongValue(o : PVObject) : Cardinal;        cdecl;
{$EXTERNALSYM   vObjectAnyValue}
  function  vObjectAnyValue(o : PVObject) : Pointer;           cdecl;
{$EXTERNALSYM   vObjectVObjectValue}
  function  vObjectVObjectValue(o : PVObject) : PVObject;     cdecl;
{$EXTERNALSYM  setVObjectVObjectValue }
  procedure setVObjectVObjectValue(o : PVObject; p : PVObject); cdecl;

{$EXTERNALSYM   addVObjectProp}
  function  addVObjectProp(o, p  : PVObject) : PVObject;    cdecl;
{$EXTERNALSYM  addProp }
  function  addProp(o : PVObject; id : PChar): PVObject;    cdecl;
{$EXTERNALSYM  addProp_ }
  function  addProp_(o : PVObject; id : PChar): PVObject;   cdecl;
{$EXTERNALSYM  addPropValue }
  function  addPropValue(o : PVObject; p, v : PChar): PVObject; cdecl;
{$EXTERNALSYM    addPropSizedValue_}
  function  addPropSizedValue_(o : PVObject; p, v : PChar; size : Cardinal): PVObject; cdecl;
{$EXTERNALSYM   addPropSizedValue}
  function  addPropSizedValue(o : PVObject; p, v : PChar; size : Cardinal): PVObject;  cdecl;
{$EXTERNALSYM   addGroup}
  function  addGroup(o : PVObject; const g : PChar): PVObject;  cdecl;
{$EXTERNALSYM  addList }
  procedure  addList(o : PPVobject; p : PVObject);      cdecl;

{$EXTERNALSYM   isAPropertyOf}
  function  isAPropertyOf(o : PVobject;id : PChar) : PVobject;   cdecl;

{$EXTERNALSYM  nextVObjectInList }
  function  nextVObjectInList(o : PVobject): PVObject;     cdecl;
{$EXTERNALSYM   initPropIterator}
  procedure  initPropIterator(i: PVObjectIterator ; o : PVObject); cdecl;
{$EXTERNALSYM   moreIteration}
  function  moreIteration(i: PVObjectIterator): integer;   cdecl;
{$EXTERNALSYM  nextVObject }
  function  nextVObject(i: PVObjectIterator): PVObject;   cdecl;

{$EXTERNALSYM   writeMemVObject}
  function  writeMemVObject(s : PChar; var len : integer; o : PVobject) : PChar;  cdecl;
{$EXTERNALSYM   writeMemVObjects}
  function  writeMemVObjects(s : PChar; var len : integer; o : PVobject) : PChar; cdecl;

{$EXTERNALSYM  lookupStr }
  function  lookupStr(s : PChar) : PChar;  cdecl;
{$EXTERNALSYM   cleanStrTbl}
  procedure cleanStrTbl;     cdecl;

{$EXTERNALSYM  cleanVObject }
  procedure  cleanVObject(o : PVobject); cdecl;
{$EXTERNALSYM  cleanVObjects }
  procedure  cleanVObjects(o : PVobject); cdecl;

{$EXTERNALSYM   lookupProp}
  function  lookupProp(s : PChar): PChar;  cdecl;
{$EXTERNALSYM  lookupProp_ }
  function  lookupProp_(s : PChar): PChar; cdecl;

{$EXTERNALSYM  fakeUnicode }
  function  fakeUnicode(ps : PChar; var bytes : integer) : PWideChar;cdecl;
{$EXTERNALSYM  uStrLen }
  function  uStrLen(u : PWideChar) : integer;    cdecl;
{$EXTERNALSYM   fakeCString}
  function  fakeCString(u : PWideChar) : PChar;     cdecl;

{$EXTERNALSYM   printVObjectToFile}
  procedure  printVObjectToFile(fname : PChar; o : PVObject);    cdecl;
{$EXTERNALSYM  printVObjectsToFile }
  procedure  printVObjectsToFile(fname : PChar; o : PVObject);  cdecl;
{$EXTERNALSYM   writeVObjectToFile}
  procedure  writeVObjectToFile(fname : PChar; o : PVObject);  cdecl;
{$EXTERNALSYM  writeVObjectsToFile }
  procedure  writeVObjectsToFile(fname : PChar; o : PVObject); cdecl;

{$EXTERNALSYM   vObjectValueType}
  function  vObjectValueType(o : PVobject) : integer;   cdecl;

{$EXTERNALSYM   Parse_MIME}
  function Parse_MIME(input : PChar; len : Cardinal) : PVObject;  cdecl;
{$EXTERNALSYM  Parse_MIME_FromFileName }
  function Parse_MIME_FromFileName( fname : PChar) : PVObject;   cdecl;

//  function fieldedProp : PChar^ ;   cdecl;
implementation

  function newVObject;  external 'versit.dll'  name  'newVObject';
  procedure  deleteVObject;                 external 'versit.dll'  name 'deleteVObject' ;
  function dupStr;    external 'versit.dll'  name  'dupStr';
  procedure  deleteStr;                         external 'versit.dll'  name  'deleteStr';
  procedure  unUseStr;                          external 'versit.dll'  name  'unUseStr';

  procedure setVObjectName;              external 'versit.dll'  name  'setVObjectName';
  procedure  setVObjectStringZValue;        external 'versit.dll'  name  'setVObjectStringZValue';
  procedure  setVObjectStringZValue_;      external 'versit.dll'  name  'setVObjectStringZValue_';
  procedure  setVObjectUStringZValue;    external 'versit.dll'  name  'setVObjectUStringZValue';
  procedure  setVObjectUStringZValue_;   external 'versit.dll'  name  'setVObjectUStringZValue_';
  procedure  setVObjectIntegerValue;      external 'versit.dll'  name  'setVObjectIntegerValue';
  procedure  setVObjectLongValue;       external 'versit.dll'  name  'setVObjectLongValue';
  procedure  setVObjectAnyValue;          external 'versit.dll'  name  'setVObjectAnyValue';
  function  setValueWithSize;  external 'versit.dll'  name  'setValueWithSize';
  function setValueWithSize_;  external 'versit.dll'  name  'setValueWithSize_';

  function vObjectName;                  external 'versit.dll'  name  'vObjectName';
  function  vObjectStringZValue;          external 'versit.dll'  name   'vObjectStringZValue';
  function  vObjectUStringZValue;    external 'versit.dll'  name  'vObjectUStringZValue';
  function  vObjectIntegerValue;      external 'versit.dll'  name  'vObjectIntegerValue';
  function  vObjectLongValue;         external 'versit.dll'  name  'vObjectLongValue';
  function  vObjectAnyValue;            external 'versit.dll'  name  'vObjectAnyValue';
  function  vObjectVObjectValue;      external 'versit.dll'  name  'vObjectVObjectValue';
  procedure setVObjectVObjectValue;  external 'versit.dll'  name  'setVObjectVObjectValue';

  function  addVObjectProp;     external 'versit.dll'  name  'addVObjectProp';
  function  addProp;     external 'versit.dll'  name  'addProp';
  function  addProp_;    external 'versit.dll'  name  'addProp_';
  function  addPropValue;  external 'versit.dll'  name  'addPropValue';
  function  addPropSizedValue_;  external 'versit.dll'  name  'addPropSizedValue_';
  function  addPropSizedValue;   external 'versit.dll'  name  'addPropSizedValue';
  function  addGroup;   external 'versit.dll'  name  'addGroup';
  procedure  addList;       external 'versit.dll'  name  'addList';

  function  isAPropertyOf;    external 'versit.dll'  name  'isAPropertyOf';

  function  nextVObjectInList;      external 'versit.dll'  name  'nextVObjectInList';
  procedure  initPropIterator;  external 'versit.dll'  name  'initPropIterator';
  function  moreIteration;    external 'versit.dll'  name  'moreIteration';
  function  nextVObject;    external 'versit.dll'  name  'nextVObject';

  function  writeMemVObject;   external 'versit.dll'  name   'writeMemVObject';
  function  writeMemVObjects;  external 'versit.dll'  name  'writeMemVObjects';

  function  lookupStr;   external 'versit.dll'  name  'lookupStr';
  procedure cleanStrTbl;      external 'versit.dll'  name  'cleanStrTbl';

  procedure  cleanVObject;  external 'versit.dll'  name  'cleanVObject';
  procedure  cleanVObjects;  external 'versit.dll'  name  'cleanVObjects';

  function  lookupProp;   external 'versit.dll'  name  'lookupProp';
  function  lookupProp_;  external 'versit.dll'  name  'lookupProp_';

  function  fakeUnicode; external 'versit.dll'  name  'fakeUnicode';
  function  uStrLen;     external 'versit.dll'  name  'uStrLen';
  function  fakeCString;      external 'versit.dll'  name  'fakeCString';

  procedure  printVObjectToFile;     external 'versit.dll'  name 'printVObjectToFile ';
  procedure  printVObjectsToFile;   external 'versit.dll'  name   'printVObjectsToFile';
  procedure  writeVObjectToFile;   external 'versit.dll'  name  'writeVObjectToFile';
  procedure  writeVObjectsToFile;  external 'versit.dll'  name  'writeVObjectsToFile';

  function  vObjectValueType;    external 'versit.dll'  name 'vObjectValueType ';

  function Parse_MIME;   external 'versit.dll'  name  'Parse_MIME';
  function Parse_MIME_FromFileName;    external  'versit.dll'  name  'Parse_MIME_FromFileName';

end.

