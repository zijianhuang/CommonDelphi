unit CDO_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 6/12/2005 9:52:39 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Common Files\System\MSMAPI\1033\CDO.DLL (1)
// LIBID: {3FA7DEA7-6438-101B-ACC1-00AA00423326}
// LCID: 0
// Helpfile: 
// HelpString: Microsoft CDO 1.21 Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Member 'Class' of '_Session' changed to 'Class_'
//   Hint: Member 'Class' of 'InfoStores' changed to 'Class_'
//   Hint: Member 'Class' of 'InfoStore' changed to 'Class_'
//   Hint: Parameter 'Object' of InfoStore.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'AddressLists' changed to 'Class_'
//   Hint: Member 'Class' of 'AddressList' changed to 'Class_'
//   Hint: Parameter 'Object' of AddressList.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'AddressEntries' changed to 'Class_'
//   Hint: Member 'Class' of 'Folder' changed to 'Class_'
//   Hint: Parameter 'Object' of Folder.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'Folders' changed to 'Class_'
//   Hint: Member 'Class' of 'Messages' changed to 'Class_'
//   Hint: Parameter 'Type' of Messages.Add changed to 'Type_'
//   Hint: Member 'Class' of 'Message' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of Message.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'Fields' changed to 'Class_'
//   Hint: Parameter 'Class' of Fields.Add changed to 'Class_'
//   Hint: Member 'Class' of 'Field' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Member 'Class' of 'Recipients' changed to 'Class_'
//   Hint: Parameter 'Type' of Recipients.Add changed to 'Type_'
//   Hint: Parameter 'Type' of Recipients.AddMultiple changed to 'Type_'
//   Hint: Member 'Class' of 'Recipient' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of Recipient.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'Attachments' changed to 'Class_'
//   Hint: Parameter 'Type' of Attachments.Add changed to 'Type_'
//   Hint: Member 'Class' of 'Attachment' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of Attachment.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'AddressEntry' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of AddressEntry.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'AddressEntryFilter' changed to 'Class_'
//   Hint: Member 'Not' of 'AddressEntryFilter' changed to 'Not_'
//   Hint: Member 'Or' of 'AddressEntryFilter' changed to 'Or_'
//   Hint: Parameter 'Object' of AddressEntryFilter.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'MessageFilter' changed to 'Class_'
//   Hint: Member 'Not' of 'MessageFilter' changed to 'Not_'
//   Hint: Member 'Or' of 'MessageFilter' changed to 'Or_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of MessageFilter.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'GroupHeader' changed to 'Class_'
//   Hint: Member 'Class' of 'AppointmentItem' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of AppointmentItem.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'MeetingItem' changed to 'Class_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Object' of MeetingItem.IsSameAs changed to 'Object_'
//   Hint: Member 'Class' of 'RecurrencePattern' changed to 'Class_'
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MAPIMajorVersion = 1;
  MAPIMinorVersion = 21;

  LIBID_MAPI: TGUID = '{3FA7DEA7-6438-101B-ACC1-00AA00423326}';

  DIID__Session: TGUID = '{3FA7DEA8-6438-101B-ACC1-00AA00423326}';
  DIID_InfoStores: TGUID = '{0C448A60-68DC-101B-ACC1-00AA00423326}';
  DIID_InfoStore: TGUID = '{3FA7DEAC-6438-101B-ACC1-00AA00423326}';
  DIID_AddressLists: TGUID = '{3FA7DEB2-6438-101B-ACC1-00AA00423326}';
  DIID_AddressList: TGUID = '{3FA7DEAF-6438-101B-ACC1-00AA00423326}';
  DIID_AddressEntries: TGUID = '{3FA7DEB1-6438-101B-ACC1-00AA00423326}';
  DIID_Folder: TGUID = '{3FA7DEA9-6438-101B-ACC1-00AA00423326}';
  DIID_Folders: TGUID = '{07A782A0-68DC-101B-ACC1-00AA00423326}';
  DIID_Messages: TGUID = '{10EAB9E0-68DC-101B-ACC1-00AA00423326}';
  DIID_Message: TGUID = '{3FA7DEAA-6438-101B-ACC1-00AA00423326}';
  DIID_Fields: TGUID = '{000662A0-68DC-101B-ACC1-00AA00423326}';
  DIID_Field: TGUID = '{3FA7DEB0-6438-101B-ACC1-00AA00423326}';
  DIID_Recipients: TGUID = '{D725D1C0-7657-101B-ACC1-00AA00423326}';
  DIID_Recipient: TGUID = '{3FA7DEAD-6438-101B-ACC1-00AA00423326}';
  DIID_Attachments: TGUID = '{FA19A960-68DB-101B-ACC1-00AA00423326}';
  DIID_Attachment: TGUID = '{3FA7DEAE-6438-101B-ACC1-00AA00423326}';
  DIID_AddressEntry: TGUID = '{3FA7DEAB-6438-101B-ACC1-00AA00423326}';
  DIID_AddressEntryFilter: TGUID = '{D725D1C1-7657-101B-ACC1-00AA00423326}';
  DIID_MessageFilter: TGUID = '{D725D1C3-7657-101B-ACC1-00AA00423326}';
  DIID_GroupHeader: TGUID = '{EF9203E6-B9A5-101B-ACC1-00AA00423326}';
  DIID_AppointmentItem: TGUID = '{EF9203E7-B9A5-101B-ACC1-00AA00423326}';
  DIID_MeetingItem: TGUID = '{EF9203E8-B9A5-101B-ACC1-00AA00423326}';
  DIID_RecurrencePattern: TGUID = '{EF9203E9-B9A5-101B-ACC1-00AA00423326}';
  CLASS_Session: TGUID = '{3FA7DEB3-6438-101B-ACC1-00AA00423326}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum mapiFieldType
type
  mapiFieldType = TOleEnum;
const
  vbEmpty = $00000000;
  vbNull = $00000001;
  vbInteger = $00000002;
  vbLong = $00000003;
  vbSingle = $00000004;
  vbDouble = $00000005;
  vbCurrency = $00000006;
  vbDate = $00000007;
  vbString = $00000008;
  vbBoolean = $0000000B;
  vbDataObject = $0000000D;
  vbBlob = $00000041;
  vbArray = $00002000;

// Constants for enum mapiImportance
type
  mapiImportance = TOleEnum;
const
  mapiLow = $00000000;
  mapiNormal = $00000001;
  mapiHigh = $00000002;

// Constants for enum mapiSortOrder
type
  mapiSortOrder = TOleEnum;
const
  mapiNone = $00000000;
  mapiAscending = $00000001;
  mapiDescending = $00000002;

// Constants for enum mapiRecipientType
type
  mapiRecipientType = TOleEnum;
const
  mapiTo = $00000001;
  mapiCc = $00000002;
  mapiBcc = $00000003;

// Constants for enum mapiAttachmentType
type
  mapiAttachmentType = TOleEnum;
const
  mapiFileData = $00000001;
  mapiFileLink = $00000002;
  mapiOle = $00000003;
  mapiEmbeddedMessage = $00000004;

// Constants for enum mapiDisplayType
type
  mapiDisplayType = TOleEnum;
const
  mapiUser = $00000000;
  mapiDistList = $00000001;
  mapiForum = $00000002;
  mapiAgent = $00000003;
  mapiOrganization = $00000004;
  mapiPrivateDistList = $00000005;
  mapiRemoteUser = $00000006;

// Constants for enum mapiObjectClass
type
  mapiObjectClass = TOleEnum;
const
  mapiUnknown = $FFFFFFFF;
  mapiSession = $00000000;
  mapiInfoStore = $00000001;
  mapiFolder = $00000002;
  mapiMsg = $00000003;
  mapiRecipient = $00000004;
  mapiAttachment = $00000005;
  mapiField = $00000006;
  mapiAddressList = $00000007;
  mapiAddressEntry = $00000008;
  mapiAddressFilter = $00000009;
  mapiMessageFilter = $0000000A;
  mapiInfoStores = $0000000E;
  mapiFolders = $0000000F;
  mapiMessages = $00000010;
  mapiRecipients = $00000011;
  mapiAttachments = $00000012;
  mapiFields = $00000013;
  mapiAddressLists = $00000014;
  mapiAddressEntries = $00000015;
  mapiGroupHeader = $00000019;
  mapiHiddenMessages = $0000001A;
  mapiClassTotal = $0000001B;

// Constants for enum ActMsgImportance
type
  ActMsgImportance = TOleEnum;
const
  ActMsgLow = $00000000;
  ActMsgNormal = $00000001;
  ActMsgHigh = $00000002;

// Constants for enum ActMsgSensitivity
type
  ActMsgSensitivity = TOleEnum;
const
  ActMsgNoSensitivity = $00000000;
  ActMsgPersonal = $00000001;
  ActMsgPrivate = $00000002;
  ActMsgConfidential = $00000003;

// Constants for enum ActMsgSortOrder
type
  ActMsgSortOrder = TOleEnum;
const
  ActMsgNone = $00000000;
  ActMsgAscending = $00000001;
  ActMsgDescending = $00000002;

// Constants for enum ActMsgRecipientType
type
  ActMsgRecipientType = TOleEnum;
const
  ActMsgTo = $00000001;
  ActMsgCc = $00000002;
  ActMsgBcc = $00000003;

// Constants for enum ActMsgAttachmentType
type
  ActMsgAttachmentType = TOleEnum;
const
  ActMsgFileData = $00000001;
  ActMsgFileLink = $00000002;
  ActMsgOle = $00000003;
  ActMsgEmbeddedMessage = $00000004;

// Constants for enum ActMsgDisplayType
type
  ActMsgDisplayType = TOleEnum;
const
  ActMsgUser = $00000000;
  ActMsgDistList = $00000001;
  ActMsgForum = $00000002;
  ActMsgAgent = $00000003;
  ActMsgOrganization = $00000004;
  ActMsgPrivateDistList = $00000005;
  ActMsgRemoteUser = $00000006;

// Constants for enum ActMsgObjectClass
type
  ActMsgObjectClass = TOleEnum;
const
  ActMsgUnknown = $FFFFFFFF;
  ActMsgSession = $00000000;
  ActMsgInfoStore = $00000001;
  ActMsgFolder = $00000002;
  ActMsgMsg = $00000003;
  ActMsgRecipient = $00000004;
  ActMsgAttachment = $00000005;
  ActMsgField = $00000006;
  ActMsgAddressList = $00000007;
  ActMsgAddressEntry = $00000008;
  ActMsgAddressFilter = $00000009;
  ActMsgMessageFilter = $0000000A;
  ActMsgInfoStores = $0000000E;
  ActMsgFolders = $0000000F;
  ActMsgMessages = $00000010;
  ActMsgRecipients = $00000011;
  ActMsgAttachments = $00000012;
  ActMsgFields = $00000013;
  ActMsgAddressLists = $00000014;
  ActMsgAddressEntries = $00000015;
  ActMsgGroupHeader = $00000019;
  ActMsgAppointment = $0000001A;
  ActMsgMeetingItem = $0000001B;
  ActMsgRecurrencePattern = $0000001C;
  ActMsgExceptions = $0000001D;
  ActMsgException = $0000001E;
  ActMsgMeetingPlanner = $0000001F;
  ActMsgHiddenMessages = $00000020;
  ActMsgClassTotal = $00000021;

// Constants for enum ActMsgDefaultFolderTypes
type
  ActMsgDefaultFolderTypes = TOleEnum;
const
  ActMsgDefaultFolderCalendar = $00000000;
  ActMsgDefaultFolderInbox = $00000001;
  ActMsgDefaultFolderOutbox = $00000002;
  ActMsgDefaultFolderSentItems = $00000003;
  ActMsgDefaultFolderDeletedItems = $00000004;
  ActMsgDefaultFolderContacts = $00000005;
  ActMsgDefaultFolderJournal = $00000006;
  ActMsgDefaultFolderNotes = $00000007;
  ActMsgDefaultFolderTasks = $00000008;
  ActMsgDefaultFolderTotal = $00000009;

// Constants for enum ActMsgAddressListTypes
type
  ActMsgAddressListTypes = TOleEnum;
const
  ActMsgAddressListGAL = $00000000;
  ActMsgAddressListPAB = $00000001;
  ActMsgAddressListTotal = $00000002;

// Constants for enum ActMsgDaysOfWeek
type
  ActMsgDaysOfWeek = TOleEnum;
const
  ActMsgSunday = $00000001;
  ActMsgMonday = $00000002;
  ActMsgTuesday = $00000004;
  ActMsgWednesday = $00000008;
  ActMsgThursday = $00000010;
  ActMsgFriday = $00000020;
  ActMsgSaturday = $00000040;

// Constants for enum ActMsgRecurTypes
type
  ActMsgRecurTypes = TOleEnum;
const
  ActMsgRecurTypeDaily = $00000000;
  ActMsgRecurTypeWeekly = $00000001;
  ActMsgRecurTypeMonthly = $00000002;
  ActMsgRecurTypeMonthlyNth = $00000003;
  ActMsgRecurTypeYearly = $00000005;
  ActMsgRecurTypeYearlyNth = $00000006;

// Constants for enum ActMsgPropIds
type
  ActMsgPropIds = TOleEnum;
const
  AmPidLocation = $00007E00;
  AmPidApptStartWhole = $00007E01;
  AmPidApptEndWhole = $00007E02;
  AmPidResponseStatus = $00007E03;
  AmPidRecurring = $00007E04;
  AmPidBusyStatus = $00007E05;
  AmPidApptDuration = $00007E06;
  AmPidApptSubType = $00007E07;
  AmPidApptStateFlags = $00007E08;
  AmPidApptReplyTime = $00007E09;
  AmPidApptUpdateTime = $00007E0A;
  AmPidExceptionReplaceTime = $00007E0B;
  AmPidOwnerName = $00007E0C;
  AmPidRecurType = $00007E0D;
  AmPidReminderDelta = $00007E0E;
  AmPidReminderTime = $00007E0F;
  AmPidReminderSet = $00007E10;
  AmPidAgingDontAgeMe = $00007E11;
  AmPidDayOfMonth = $00007E12;
  AmPidDayOfWeekMask = $00007E13;
  AmPidInstance = $00007E14;
  AmPidInterval = $00007E15;
  AmPidOccurrences = $00007E16;
  AmPidMonthOfYear = $00007E17;
  AmPidFSliding = $00007E18;
  AmPidFNoEndDate = $00007E19;
  AmPidRecurDuration = $00007E1A;
  AmPidApptGlobalObjId = $00007E1B;
  AmPidTimeZone = $00007E1C;
  AmPidStoreType = $00007E1D;
  AmPidMaximum = $00007E1E;

// Constants for enum ActMsgMeetingStatusTypes
type
  ActMsgMeetingStatusTypes = TOleEnum;
const
  ActMsgNonMeeting = $00000000;
  ActMsgMeeting = $00000001;
  ActMsgMeetingReceived = $00000003;
  ActMsgMeetingCanceled = $00000005;

// Constants for enum ActMsgResponseStatus
type
  ActMsgResponseStatus = TOleEnum;
const
  ActMsgResponseNone = $00000000;
  ActMsgResponseOrganized = $00000001;
  ActMsgResponseTentative = $00000002;
  ActMsgResponseAccepted = $00000003;
  ActMsgResponseDeclined = $00000004;
  ActMsgResponseNotResponded = $00000005;

// Constants for enum ActMsgStoreType
type
  ActMsgStoreType = TOleEnum;
const
  ActMsgOutlook = $00000001;
  ActMsgSchedulePlus = $00000002;

// Constants for enum ActMsgBusyStatus
type
  ActMsgBusyStatus = TOleEnum;
const
  ActMsgFree = $00000000;
  ActMsgTentative = $00000001;
  ActMsgBusy = $00000002;
  ActMsgOutOfOffice = $00000003;

// Constants for enum ActMsgMeetingType
type
  ActMsgMeetingType = TOleEnum;
const
  ActMsgMeetingRequest = $00000001;
  ActMsgMeetingResponse = $00000002;

// Constants for enum ActMsgTimeZones
type
  ActMsgTimeZones = TOleEnum;
const
  ActMsgTmzNoDST = $00004000;
  ActMsgTmzUTC = $00004001;
  ActMsgTmzOrigin = $00000000;
  ActMsgTmzGMT = $00000001;
  ActMsgTmzLisbon = $00000002;
  ActMsgTmzParis = $00000003;
  ActMsgTmzBerlin = $00000004;
  ActMsgTmzEasternEurope = $00000005;
  ActMsgTmzPrague = $00000006;
  ActMsgTmzAthens = $00000007;
  ActMsgTmzRiodeJaneiro = $00000008;
  ActMsgTmzAtlanticCanada = $00000009;
  ActMsgTmzEastern = $0000000A;
  ActMsgTmzCentral = $0000000B;
  ActMsgTmzMountain = $0000000C;
  ActMsgTmzPacific = $0000000D;
  ActMsgTmzAlaska = $0000000E;
  ActMsgTmzHawaii = $0000000F;
  ActMsgTmzMidwayIsland = $00000010;
  ActMsgTmzWellington = $00000011;
  ActMsgTmzBrisbane = $00000012;
  ActMsgTmzAdelaide = $00000013;
  ActMsgTmzTokyo = $00000014;
  ActMsgTmzHongKong = $00000015;
  ActMsgTmzBangkok = $00000016;
  ActMsgTmzBombay = $00000017;
  ActMsgTmzAbuDhabi = $00000018;
  ActMsgTmzTehran = $00000019;
  ActMsgTmzBaghdad = $0000001A;
  ActMsgTmzIsrael = $0000001B;
  ActMsgTmzNewfoundlad = $0000001C;
  ActMsgTmzAzores = $0000001D;
  ActMsgTmzMidAtlantic = $0000001E;
  ActMsgTmzMonrovia = $0000001F;
  ActMsgTmzBuenosAires = $00000020;
  ActMsgTmzCaracas = $00000021;
  ActMsgTmzIndiana = $00000022;
  ActMsgTmzBogota = $00000023;
  ActMsgTmzSaskatchewan = $00000024;
  ActMsgTmzMexicoCity = $00000025;
  ActMsgTmzArizona = $00000026;
  ActMsgTmzEnewetak = $00000027;
  ActMsgTmzFiji = $00000028;
  ActMsgTmzMagadan = $00000029;
  ActMsgTmzHobart = $0000002A;
  ActMsgTmzGuam = $0000002B;
  ActMsgTmzDarwin = $0000002C;
  ActMsgTmzBeijing = $0000002D;
  ActMsgTmzAlmaty = $0000002E;
  ActMsgTmzIslamabad = $0000002F;
  ActMsgTmzKabul = $00000030;
  ActMsgTmzCairo = $00000031;
  ActMsgTmzHarare = $00000032;
  ActMsgTmzMoscow = $00000033;
  ActMsgTmzSydney2k = $00000034;
  ActMsgTmzMax = $00000035;

// Constants for enum ActMsgLimits
type
  ActMsgLimits = TOleEnum;
const
  ActMsgMaxCount = $7FFFFFFF;

// Constants for enum ActMsgErrorType
type
  ActMsgErrorType = TOleEnum;
const
  ActMsgE_CALL_FAILED = $80004005;
  ActMsgE_NOT_ENOUGH_MEMORY = $8007000E;
  ActMsgE_INVALID_PARAMETER = $80070057;
  ActMsgE_INTERFACE_NOT_SUPPORTED = $80004002;
  ActMsgE_NO_ACCESS = $80070005;
  ActMsgE_NO_SUPPORT = $80040102;
  ActMsgE_BAD_CHARWIDTH = $80040103;
  ActMsgE_STRING_TOO_LONG = $80040105;
  ActMsgE_UNKNOWN_FLAGS = $80040106;
  ActMsgE_INVALID_ENTRYID = $80040107;
  ActMsgE_INVALID_OBJECT = $80040108;
  ActMsgE_OBJECT_CHANGED = $80040109;
  ActMsgE_OBJECT_DELETED = $8004010A;
  ActMsgE_BUSY = $8004010B;
  ActMsgE_NOT_ENOUGH_DISK = $8004010D;
  ActMsgE_NOT_ENOUGH_RESOURCES = $8004010E;
  ActMsgE_NOT_FOUND = $8004010F;
  ActMsgE_VERSION = $80040110;
  ActMsgE_LOGON_FAILED = $80040111;
  ActMsgE_SESSION_LIMIT = $80040112;
  ActMsgE_USER_CANCEL = $80040113;
  ActMsgE_UNABLE_TO_ABORT = $80040114;
  ActMsgE_NETWORK_ERROR = $80040115;
  ActMsgE_DISK_ERROR = $80040116;
  ActMsgE_TOO_COMPLEX = $80040117;
  ActMsgE_BAD_COLUMN = $80040118;
  ActMsgE_EXTENDED_ERROR = $80040119;
  ActMsgE_COMPUTED = $8004011A;
  ActMsgE_CORRUPT_DATA = $8004011B;
  ActMsgE_UNCONFIGURED = $8004011C;
  ActMsgE_FAILONEPROVIDER = $8004011D;
  ActMsgE_UNKNOWN_CPID = $8004011E;
  ActMsgE_UNKNOWN_LCID = $8004011F;
  ActMsgE_PASSWORD_CHANGE_REQUIRED = $80040120;
  ActMsgE_PASSWORD_EXPIRED = $80040121;
  ActMsgE_INVALID_WORKSTATION_ACCOUNT = $80040122;
  ActMsgE_INVALID_ACCESS_TIME = $80040123;
  ActMsgE_ACCOUNT_DISABLED = $80040124;
  ActMsgE_END_OF_SESSION = $80040200;
  ActMsgE_UNKNOWN_ENTRYID = $80040201;
  ActMsgE_MISSING_REQUIRED_COLUMN = $80040202;
  ActMsgW_NO_SERVICE = $00040203;
  ActMsgE_BAD_VALUE = $80040301;
  ActMsgE_INVALID_TYPE = $80040302;
  ActMsgE_TYPE_NO_SUPPORT = $80040303;
  ActMsgE_UNEXPECTED_TYPE = $80040304;
  ActMsgE_TOO_BIG = $80040305;
  ActMsgE_DECLINE_COPY = $80040306;
  ActMsgE_UNEXPECTED_ID = $80040307;
  ActMsgW_ERRORS_RETURNED = $00040380;
  ActMsgE_UNABLE_TO_COMPLETE = $80040400;
  ActMsgE_TIMEOUT = $80040401;
  ActMsgE_TABLE_EMPTY = $80040402;
  ActMsgE_TABLE_TOO_BIG = $80040403;
  ActMsgE_INVALID_BOOKMARK = $80040405;
  ActMsgW_POSITION_CHANGED = $00040481;
  ActMsgW_APPROX_COUNT = $00040482;
  ActMsgE_WAIT = $80040500;
  ActMsgE_CANCEL = $80040501;
  ActMsgE_NOT_ME = $80040502;
  ActMsgW_CANCEL_MESSAGE = $00040580;
  ActMsgE_CORRUPT_STORE = $80040600;
  ActMsgE_NOT_IN_QUEUE = $80040601;
  ActMsgE_NO_SUPPRESS = $80040602;
  ActMsgE_COLLISION = $80040604;
  ActMsgE_NOT_INITIALIZED = $80040605;
  ActMsgE_NON_STANDARD = $80040606;
  ActMsgE_NO_RECIPIENTS = $80040607;
  ActMsgE_SUBMITTED = $80040608;
  ActMsgE_HAS_FOLDERS = $80040609;
  ActMsgE_HAS_MESSAGES = $8004060A;
  ActMsgE_FOLDER_CYCLE = $8004060B;
  ActMsgW_PARTIAL_COMPLETION = $00040680;
  ActMsgE_AMBIGUOUS_RECIP = $80040700;

// Constants for enum ActMsgPropTags
type
  ActMsgPropTags = TOleEnum;
const
  ActMsgPR_ACKNOWLEDGEMENT_MODE = $00010003;
  ActMsgPR_ALTERNATE_RECIPIENT_ALLOWED = $0002000B;
  ActMsgPR_AUTHORIZING_USERS = $00030102;
  ActMsgPR_AUTO_FORWARD_COMMENT = $0004001E;
  ActMsgPR_AUTO_FORWARD_COMMENT_W = $0004001F;
  ActMsgPR_AUTO_FORWARD_COMMENT_A = $0004001E;
  ActMsgPR_AUTO_FORWARDED = $0005000B;
  ActMsgPR_CONTENT_CONFIDENTIALITY_ALGORITHM_ID = $00060102;
  ActMsgPR_CONTENT_CORRELATOR = $00070102;
  ActMsgPR_CONTENT_IDENTIFIER = $0008001E;
  ActMsgPR_CONTENT_IDENTIFIER_W = $0008001F;
  ActMsgPR_CONTENT_IDENTIFIER_A = $0008001E;
  ActMsgPR_CONTENT_LENGTH = $00090003;
  ActMsgPR_CONTENT_RETURN_REQUESTED = $000A000B;
  ActMsgPR_CONVERSATION_KEY = $000B0102;
  ActMsgPR_CONVERSION_EITS = $000C0102;
  ActMsgPR_CONVERSION_WITH_LOSS_PROHIBITED = $000D000B;
  ActMsgPR_CONVERTED_EITS = $000E0102;
  ActMsgPR_DEFERRED_DELIVERY_TIME = $000F0040;
  ActMsgPR_DELIVER_TIME = $00100040;
  ActMsgPR_DISCARD_REASON = $00110003;
  ActMsgPR_DISCLOSURE_OF_RECIPIENTS = $0012000B;
  ActMsgPR_DL_EXPANSION_HISTORY = $00130102;
  ActMsgPR_DL_EXPANSION_PROHIBITED = $0014000B;
  ActMsgPR_EXPIRY_TIME = $00150040;
  ActMsgPR_IMPLICIT_CONVERSION_PROHIBITED = $0016000B;
  ActMsgPR_IMPORTANCE = $00170003;
  ActMsgPR_IPM_ID = $00180102;
  ActMsgPR_LATEST_DELIVERY_TIME = $00190040;
  ActMsgPR_MESSAGE_CLASS = $001A001E;
  ActMsgPR_MESSAGE_CLASS_W = $001A001F;
  ActMsgPR_MESSAGE_CLASS_A = $001A001E;
  ActMsgPR_MESSAGE_DELIVERY_ID = $001B0102;
  ActMsgPR_MESSAGE_SECURITY_LABEL = $001E0102;
  ActMsgPR_OBSOLETED_IPMS = $001F0102;
  ActMsgPR_ORIGINALLY_INTENDED_RECIPIENT_NAME = $00200102;
  ActMsgPR_INTERNET_APPROVED = $1030001E;
  ActMsgPR_INTERNET_APPROVED_A = $1030001E;
  ActMsgPR_INTERNET_APPROVED_W = $1030001F;
  ActMsgPR_INTERNET_CONTROL = $1031001E;
  ActMsgPR_INTERNET_CONTROL_A = $1031001E;
  ActMsgPR_INTERNET_CONTROL_W = $1031001F;
  ActMsgPR_INTERNET_DISTRIBUTION = $1032001E;
  ActMsgPR_INTERNET_DISTRIBUTION_A = $1032001E;
  ActMsgPR_INTERNET_DISTRIBUTION_W = $1032001F;
  ActMsgPR_INTERNET_FOLLOWUP_TO = $1033001E;
  ActMsgPR_INTERNET_FOLLOWUP_TO_A = $1033001E;
  ActMsgPR_INTERNET_FOLLOWUP_TO_W = $1033001F;
  ActMsgPR_INTERNET_LINES = $10340003;
  ActMsgPR_INTERNET_MESSAGE_ID = $1035001E;
  ActMsgPR_INTERNET_MESSAGE_ID_A = $1035001E;
  ActMsgPR_INTERNET_MESSAGE_ID_W = $1035001F;
  ActMsgPR_INTERNET_NEWSGROUPS = $1036001E;
  ActMsgPR_INTERNET_NEWSGROUPS_A = $1036001E;
  ActMsgPR_INTERNET_NEWSGROUPS_W = $1036001F;
  ActMsgPR_INTERNET_ORGANIZATION = $1037001E;
  ActMsgPR_INTERNET_ORGANIZATION_A = $1037001E;
  ActMsgPR_INTERNET_ORGANIZATION_W = $1037001F;
  ActMsgPR_INTERNET_NNTP_PATH = $1038001E;
  ActMsgPR_INTERNET_NNTP_PATH_A = $1038001E;
  ActMsgPR_INTERNET_NNTP_PATH_W = $1038001F;
  ActMsgPR_INTERNET_REFERENCES = $1039001E;
  ActMsgPR_INTERNET_REFERENCES_A = $1039001E;
  ActMsgPR_INTERNET_REFERENCES_W = $1039001F;
  ActMsgPR_SUPERSEDES = $103A001E;
  ActMsgPR_SUPERSEDES_A = $103A001E;
  ActMsgPR_SUPERSEDES_W = $103A001F;
  ActMsgPR_POST_FOLDER_ENTRIES = $103B0102;
  ActMsgPR_POST_FOLDER_NAMES = $103C001E;
  ActMsgPR_POST_FOLDER_NAMES_A = $103C001E;
  ActMsgPR_POST_FOLDER_NAMES_W = $103C001F;
  ActMsgPR_POST_REPLY_FOLDER_ENTRIES = $103D0102;
  ActMsgPR_POST_REPLY_FOLDER_NAMES = $103E001E;
  ActMsgPR_POST_REPLY_FOLDER_NAMES_A = $103E001E;
  ActMsgPR_POST_REPLY_FOLDER_NAMES_W = $103E001F;
  ActMsgPR_POST_REPLY_DENIED = $103F0102;
  ActMsgPR_ORIGINAL_EITS = $00210102;
  ActMsgPR_ORIGINATOR_CERTIFICATE = $00220102;
  ActMsgPR_ORIGINATOR_DELIVERY_REPORT_REQUESTED = $0023000B;
  ActMsgPR_ORIGINATOR_RETURN_ADDRESS = $00240102;
  ActMsgPR_PARENT_KEY = $00250102;
  ActMsgPR_PRIORITY = $00260003;
  ActMsgPR_ORIGIN_CHECK = $00270102;
  ActMsgPR_PROOF_OF_SUBMISSION_REQUESTED = $0028000B;
  ActMsgPR_READ_RECEIPT_REQUESTED = $0029000B;
  ActMsgPR_RECEIPT_TIME = $002A0040;
  ActMsgPR_RECIPIENT_REASSIGNMENT_PROHIBITED = $002B000B;
  ActMsgPR_REDIRECTION_HISTORY = $002C0102;
  ActMsgPR_RELATED_IPMS = $002D0102;
  ActMsgPR_ORIGINAL_SENSITIVITY = $002E0003;
  ActMsgPR_LANGUAGES = $002F001E;
  ActMsgPR_LANGUAGES_W = $002F001F;
  ActMsgPR_LANGUAGES_A = $002F001E;
  ActMsgPR_REPLY_TIME = $00300040;
  ActMsgPR_REPORT_TAG = $00310102;
  ActMsgPR_REPORT_TIME = $00320040;
  ActMsgPR_RETURNED_IPM = $0033000B;
  ActMsgPR_SECURITY = $00340003;
  ActMsgPR_INCOMPLETE_COPY = $0035000B;
  ActMsgPR_SENSITIVITY = $00360003;
  ActMsgPR_SUBJECT = $0037001E;
  ActMsgPR_SUBJECT_W = $0037001F;
  ActMsgPR_SUBJECT_A = $0037001E;
  ActMsgPR_SUBJECT_IPM = $00380102;
  ActMsgPR_CLIENT_SUBMIT_TIME = $00390040;
  ActMsgPR_REPORT_NAME = $003A001E;
  ActMsgPR_REPORT_NAME_W = $003A001F;
  ActMsgPR_REPORT_NAME_A = $003A001E;
  ActMsgPR_SENT_REPRESENTING_SEARCH_KEY = $003B0102;
  ActMsgPR_X400_CONTENT_TYPE = $003C0102;
  ActMsgPR_SUBJECT_PREFIX = $003D001E;
  ActMsgPR_SUBJECT_PREFIX_W = $003D001F;
  ActMsgPR_SUBJECT_PREFIX_A = $003D001E;
  ActMsgPR_NON_RECEIPT_REASON = $003E0003;
  ActMsgPR_RECEIVED_BY_ENTRYID = $003F0102;
  ActMsgPR_RECEIVED_BY_NAME = $0040001E;
  ActMsgPR_RECEIVED_BY_NAME_W = $0040001F;
  ActMsgPR_RECEIVED_BY_NAME_A = $0040001E;
  ActMsgPR_SENT_REPRESENTING_ENTRYID = $00410102;
  ActMsgPR_SENT_REPRESENTING_NAME = $0042001E;
  ActMsgPR_SENT_REPRESENTING_NAME_W = $0042001F;
  ActMsgPR_SENT_REPRESENTING_NAME_A = $0042001E;
  ActMsgPR_RCVD_REPRESENTING_ENTRYID = $00430102;
  ActMsgPR_RCVD_REPRESENTING_NAME = $0044001E;
  ActMsgPR_RCVD_REPRESENTING_NAME_W = $0044001F;
  ActMsgPR_RCVD_REPRESENTING_NAME_A = $0044001E;
  ActMsgPR_REPORT_ENTRYID = $00450102;
  ActMsgPR_READ_RECEIPT_ENTRYID = $00460102;
  ActMsgPR_MESSAGE_SUBMISSION_ID = $00470102;
  ActMsgPR_PROVIDER_SUBMIT_TIME = $00480040;
  ActMsgPR_ORIGINAL_SUBJECT = $0049001E;
  ActMsgPR_ORIGINAL_SUBJECT_W = $0049001F;
  ActMsgPR_ORIGINAL_SUBJECT_A = $0049001E;
  ActMsgPR_DISC_VAL = $004A000B;
  ActMsgPR_ORIG_MESSAGE_CLASS = $004B001E;
  ActMsgPR_ORIG_MESSAGE_CLASS_W = $004B001F;
  ActMsgPR_ORIG_MESSAGE_CLASS_A = $004B001E;
  ActMsgPR_ORIGINAL_AUTHOR_ENTRYID = $004C0102;
  ActMsgPR_ORIGINAL_AUTHOR_NAME = $004D001E;
  ActMsgPR_ORIGINAL_AUTHOR_NAME_W = $004D001F;
  ActMsgPR_ORIGINAL_AUTHOR_NAME_A = $004D001E;
  ActMsgPR_ORIGINAL_SUBMIT_TIME = $004E0040;
  ActMsgPR_REPLY_RECIPIENT_ENTRIES = $004F0102;
  ActMsgPR_REPLY_RECIPIENT_NAMES = $0050001E;
  ActMsgPR_REPLY_RECIPIENT_NAMES_W = $0050001F;
  ActMsgPR_REPLY_RECIPIENT_NAMES_A = $0050001E;
  ActMsgPR_RECEIVED_BY_SEARCH_KEY = $00510102;
  ActMsgPR_RCVD_REPRESENTING_SEARCH_KEY = $00520102;
  ActMsgPR_READ_RECEIPT_SEARCH_KEY = $00530102;
  ActMsgPR_REPORT_SEARCH_KEY = $00540102;
  ActMsgPR_ORIGINAL_DELIVERY_TIME = $00550040;
  ActMsgPR_ORIGINAL_AUTHOR_SEARCH_KEY = $00560102;
  ActMsgPR_MESSAGE_TO_ME = $0057000B;
  ActMsgPR_MESSAGE_CC_ME = $0058000B;
  ActMsgPR_MESSAGE_RECIP_ME = $0059000B;
  ActMsgPR_ORIGINAL_SENDER_NAME = $005A001E;
  ActMsgPR_ORIGINAL_SENDER_NAME_W = $005A001F;
  ActMsgPR_ORIGINAL_SENDER_NAME_A = $005A001E;
  ActMsgPR_ORIGINAL_SENDER_ENTRYID = $005B0102;
  ActMsgPR_ORIGINAL_SENDER_SEARCH_KEY = $005C0102;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_NAME = $005D001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_NAME_W = $005D001F;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_NAME_A = $005D001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_ENTRYID = $005E0102;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_SEARCH_KEY = $005F0102;
  ActMsgPR_START_DATE = $00600040;
  ActMsgPR_END_DATE = $00610040;
  ActMsgPR_OWNER_APPT_ID = $00620003;
  ActMsgPR_RESPONSE_REQUESTED = $0063000B;
  ActMsgPR_SENT_REPRESENTING_ADDRTYPE = $0064001E;
  ActMsgPR_SENT_REPRESENTING_ADDRTYPE_W = $0064001F;
  ActMsgPR_SENT_REPRESENTING_ADDRTYPE_A = $0064001E;
  ActMsgPR_SENT_REPRESENTING_EMAIL_ADDRESS = $0065001E;
  ActMsgPR_SENT_REPRESENTING_EMAIL_ADDRESS_W = $0065001F;
  ActMsgPR_SENT_REPRESENTING_EMAIL_ADDRESS_A = $0065001E;
  ActMsgPR_ORIGINAL_SENDER_ADDRTYPE = $0066001E;
  ActMsgPR_ORIGINAL_SENDER_ADDRTYPE_W = $0066001F;
  ActMsgPR_ORIGINAL_SENDER_ADDRTYPE_A = $0066001E;
  ActMsgPR_ORIGINAL_SENDER_EMAIL_ADDRESS = $0067001E;
  ActMsgPR_ORIGINAL_SENDER_EMAIL_ADDRESS_W = $0067001F;
  ActMsgPR_ORIGINAL_SENDER_EMAIL_ADDRESS_A = $0067001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE = $0068001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_W = $0068001F;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_A = $0068001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS = $0069001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_W = $0069001E;
  ActMsgPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_A = $0069001E;
  ActMsgPR_CONVERSATION_TOPIC = $0070001E;
  ActMsgPR_CONVERSATION_TOPIC_W = $0070001F;
  ActMsgPR_CONVERSATION_TOPIC_A = $0070001E;
  ActMsgPR_CONVERSATION_INDEX = $00710102;
  ActMsgPR_ORIGINAL_DISPLAY_BCC = $0072001E;
  ActMsgPR_ORIGINAL_DISPLAY_BCC_W = $0072001F;
  ActMsgPR_ORIGINAL_DISPLAY_BCC_A = $0072001E;
  ActMsgPR_ORIGINAL_DISPLAY_CC = $0073001E;
  ActMsgPR_ORIGINAL_DISPLAY_CC_W = $0073001F;
  ActMsgPR_ORIGINAL_DISPLAY_CC_A = $0073001E;
  ActMsgPR_ORIGINAL_DISPLAY_TO = $0074001E;
  ActMsgPR_ORIGINAL_DISPLAY_TO_W = $0074001F;
  ActMsgPR_ORIGINAL_DISPLAY_TO_A = $0074001E;
  ActMsgPR_RECEIVED_BY_ADDRTYPE = $0075001E;
  ActMsgPR_RECEIVED_BY_ADDRTYPE_W = $0075001F;
  ActMsgPR_RECEIVED_BY_ADDRTYPE_A = $0075001E;
  ActMsgPR_RECEIVED_BY_EMAIL_ADDRESS = $0076001E;
  ActMsgPR_RECEIVED_BY_EMAIL_ADDRESS_W = $0076001F;
  ActMsgPR_RECEIVED_BY_EMAIL_ADDRESS_A = $0076001E;
  ActMsgPR_RCVD_REPRESENTING_ADDRTYPE = $0077001E;
  ActMsgPR_RCVD_REPRESENTING_ADDRTYPE_W = $0077001F;
  ActMsgPR_RCVD_REPRESENTING_ADDRTYPE_A = $0077001E;
  ActMsgPR_RCVD_REPRESENTING_EMAIL_ADDRESS = $0078001E;
  ActMsgPR_RCVD_REPRESENTING_EMAIL_ADDRESS_W = $0078001F;
  ActMsgPR_RCVD_REPRESENTING_EMAIL_ADDRESS_A = $0078001E;
  ActMsgPR_ORIGINAL_AUTHOR_ADDRTYPE = $0079001E;
  ActMsgPR_ORIGINAL_AUTHOR_ADDRTYPE_W = $0079001F;
  ActMsgPR_ORIGINAL_AUTHOR_ADDRTYPE_A = $0079001E;
  ActMsgPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS = $007A001E;
  ActMsgPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS_W = $007A001F;
  ActMsgPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS_A = $007A001E;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE = $007B001E;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE_W = $007B001F;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE_A = $007B001E;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS = $007C001E;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS_W = $007C001F;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS_A = $007C001E;
  ActMsgPR_TRANSPORT_MESSAGE_HEADERS = $007D001E;
  ActMsgPR_TRANSPORT_MESSAGE_HEADERS_W = $007D001F;
  ActMsgPR_TRANSPORT_MESSAGE_HEADERS_A = $007D001E;
  ActMsgPR_DELEGATION = $007E0102;
  ActMsgPR_TNEF_CORRELATION_KEY = $007F0102;
  ActMsgPR_BODY = $1000001E;
  ActMsgPR_BODY_W = $1000001F;
  ActMsgPR_BODY_A = $1000001E;
  ActMsgPR_REPORT_TEXT = $1001001E;
  ActMsgPR_REPORT_TEXT_W = $1001001F;
  ActMsgPR_REPORT_TEXT_A = $1001001E;
  ActMsgPR_ORIGINATOR_AND_DL_EXPANSION_HISTORY = $10020102;
  ActMsgPR_REPORTING_DL_NAME = $10030102;
  ActMsgPR_REPORTING_MTA_CERTIFICATE = $10040102;
  ActMsgPR_RTF_SYNC_BODY_CRC = $10060003;
  ActMsgPR_RTF_SYNC_BODY_COUNT = $10070003;
  ActMsgPR_RTF_SYNC_BODY_TAG = $1008001E;
  ActMsgPR_RTF_SYNC_BODY_TAG_W = $1008001F;
  ActMsgPR_RTF_SYNC_BODY_TAG_A = $1008001E;
  ActMsgPR_RTF_COMPRESSED = $10090102;
  ActMsgPR_RTF_SYNC_PREFIX_COUNT = $10100003;
  ActMsgPR_RTF_SYNC_TRAILING_COUNT = $10110003;
  ActMsgPR_ORIGINALLY_INTENDED_RECIP_ENTRYID = $10120102;
  ActMsgPR_CONTENT_INTEGRITY_CHECK = $0C000102;
  ActMsgPR_EXPLICIT_CONVERSION = $0C010003;
  ActMsgPR_IPM_RETURN_REQUESTED = $0C02000B;
  ActMsgPR_MESSAGE_TOKEN = $0C030102;
  ActMsgPR_NDR_REASON_CODE = $0C040003;
  ActMsgPR_NDR_DIAG_CODE = $0C050003;
  ActMsgPR_NON_RECEIPT_NOTIFICATION_REQUESTED = $0C06000B;
  ActMsgPR_DELIVERY_POINT = $0C070003;
  ActMsgPR_ORIGINATOR_NON_DELIVERY_REPORT_REQUESTED = $0C08000B;
  ActMsgPR_ORIGINATOR_REQUESTED_ALTERNATE_RECIPIENT = $0C090102;
  ActMsgPR_PHYSICAL_DELIVERY_BUREAU_FAX_DELIVERY = $0C0A000B;
  ActMsgPR_PHYSICAL_DELIVERY_MODE = $0C0B0003;
  ActMsgPR_PHYSICAL_DELIVERY_REPORT_REQUEST = $0C0C0003;
  ActMsgPR_PHYSICAL_FORWARDING_ADDRESS = $0C0D0102;
  ActMsgPR_PHYSICAL_FORWARDING_ADDRESS_REQUESTED = $0C0E000B;
  ActMsgPR_PHYSICAL_FORWARDING_PROHIBITED = $0C0F000B;
  ActMsgPR_PHYSICAL_RENDITION_ATTRIBUTES = $0C100102;
  ActMsgPR_PROOF_OF_DELIVERY = $0C110102;
  ActMsgPR_PROOF_OF_DELIVERY_REQUESTED = $0C12000B;
  ActMsgPR_RECIPIENT_CERTIFICATE = $0C130102;
  ActMsgPR_RECIPIENT_NUMBER_FOR_ADVICE = $0C14001E;
  ActMsgPR_RECIPIENT_NUMBER_FOR_ADVICE_W = $0C14001F;
  ActMsgPR_RECIPIENT_NUMBER_FOR_ADVICE_A = $0C14001E;
  ActMsgPR_RECIPIENT_TYPE = $0C150003;
  ActMsgPR_REGISTERED_MAIL_TYPE = $0C160003;
  ActMsgPR_REPLY_REQUESTED = $0C17000B;
  ActMsgPR_REQUESTED_DELIVERY_METHOD = $0C180003;
  ActMsgPR_SENDER_ENTRYID = $0C190102;
  ActMsgPR_SENDER_NAME = $0C1A001E;
  ActMsgPR_SENDER_NAME_W = $0C1A001F;
  ActMsgPR_SENDER_NAME_A = $0C1A001E;
  ActMsgPR_SUPPLEMENTARY_INFO = $0C1B001E;
  ActMsgPR_SUPPLEMENTARY_INFO_W = $0C1B001F;
  ActMsgPR_SUPPLEMENTARY_INFO_A = $0C1B001E;
  ActMsgPR_TYPE_OF_MTS_USER = $0C1C0003;
  ActMsgPR_SENDER_SEARCH_KEY = $0C1D0102;
  ActMsgPR_SENDER_ADDRTYPE = $0C1E001E;
  ActMsgPR_SENDER_ADDRTYPE_W = $0C1E001F;
  ActMsgPR_SENDER_ADDRTYPE_A = $0C1E001E;
  ActMsgPR_SENDER_EMAIL_ADDRESS = $0C1F001E;
  ActMsgPR_SENDER_EMAIL_ADDRESS_W = $0C1F001F;
  ActMsgPR_SENDER_EMAIL_ADDRESS_A = $0C1F001E;
  ActMsgPR_CURRENT_VERSION = $0E000014;
  ActMsgPR_DELETE_AFTER_SUBMIT = $0E01000B;
  ActMsgPR_DISPLAY_BCC = $0E02001E;
  ActMsgPR_DISPLAY_BCC_W = $0E02001F;
  ActMsgPR_DISPLAY_BCC_A = $0E02001E;
  ActMsgPR_DISPLAY_CC = $0E03001E;
  ActMsgPR_DISPLAY_CC_W = $0E03001F;
  ActMsgPR_DISPLAY_CC_A = $0E03001E;
  ActMsgPR_DISPLAY_TO = $0E04001E;
  ActMsgPR_DISPLAY_TO_W = $0E04001F;
  ActMsgPR_DISPLAY_TO_A = $0E04001E;
  ActMsgPR_PARENT_DISPLAY = $0E05001E;
  ActMsgPR_PARENT_DISPLAY_W = $0E05001F;
  ActMsgPR_PARENT_DISPLAY_A = $0E05001E;
  ActMsgPR_MESSAGE_DELIVERY_TIME = $0E060040;
  ActMsgPR_MESSAGE_FLAGS = $0E070003;
  ActMsgPR_MESSAGE_SIZE = $0E080003;
  ActMsgPR_PARENT_ENTRYID = $0E090102;
  ActMsgPR_SENTMAIL_ENTRYID = $0E0A0102;
  ActMsgPR_CORRELATE = $0E0C000B;
  ActMsgPR_CORRELATE_MTSID = $0E0D0102;
  ActMsgPR_DISCRETE_VALUES = $0E0E000B;
  ActMsgPR_RESPONSIBILITY = $0E0F000B;
  ActMsgPR_SPOOLER_STATUS = $0E100003;
  ActMsgPR_TRANSPORT_STATUS = $0E110003;
  ActMsgPR_MESSAGE_RECIPIENTS = $0E12000D;
  ActMsgPR_MESSAGE_ATTACHMENTS = $0E13000D;
  ActMsgPR_SUBMIT_FLAGS = $0E140003;
  ActMsgPR_RECIPIENT_STATUS = $0E150003;
  ActMsgPR_TRANSPORT_KEY = $0E160003;
  ActMsgPR_MSG_STATUS = $0E170003;
  ActMsgPR_MESSAGE_DOWNLOAD_TIME = $0E180003;
  ActMsgPR_CREATION_VERSION = $0E190014;
  ActMsgPR_MODIFY_VERSION = $0E1A0014;
  ActMsgPR_HASATTACH = $0E1B000B;
  ActMsgPR_BODY_CRC = $0E1C0003;
  ActMsgPR_NORMALIZED_SUBJECT = $0E1D001E;
  ActMsgPR_NORMALIZED_SUBJECT_W = $0E1D001F;
  ActMsgPR_NORMALIZED_SUBJECT_A = $0E1D001E;
  ActMsgPR_RTF_IN_SYNC = $0E1F000B;
  ActMsgPR_ATTACH_SIZE = $0E200003;
  ActMsgPR_ATTACH_NUM = $0E210003;
  ActMsgPR_PREPROCESS = $0E22000B;
  ActMsgPR_INTERNET_ARTICLE_NUMBER = $0E230003;
  ActMsgPR_NEWSGROUP_NAME = $0E24001E;
  ActMsgPR_NEWSGROUP_NAME_A = $0E24001E;
  ActMsgPR_NEWSGROUP_NAME_W = $0E24001F;
  ActMsgPR_ORIGINATING_MTA_CERTIFICATE = $0E250102;
  ActMsgPR_PROOF_OF_SUBMISSION = $0E260102;
  ActMsgPR_ENTRYID = $0FFF0102;
  ActMsgPR_OBJECT_TYPE = $0FFE0003;
  ActMsgPR_ICON = $0FFD0102;
  ActMsgPR_MINI_ICON = $0FFC0102;
  ActMsgPR_STORE_ENTRYID = $0FFB0102;
  ActMsgPR_STORE_RECORD_KEY = $0FFA0102;
  ActMsgPR_RECORD_KEY = $0FF90102;
  ActMsgPR_MAPPING_SIGNATURE = $0FF80102;
  ActMsgPR_ACCESS_LEVEL = $0FF70003;
  ActMsgPR_INSTANCE_KEY = $0FF60102;
  ActMsgPR_ROW_TYPE = $0FF50003;
  ActMsgPR_ACCESS = $0FF40003;
  ActMsgPR_ROWID = $30000003;
  ActMsgPR_DISPLAY_NAME = $3001001E;
  ActMsgPR_DISPLAY_NAME_W = $3001001F;
  ActMsgPR_DISPLAY_NAME_A = $3001001E;
  ActMsgPR_ADDRTYPE = $3002001E;
  ActMsgPR_ADDRTYPE_W = $3002001F;
  ActMsgPR_ADDRTYPE_A = $3002001E;
  ActMsgPR_EMAIL_ADDRESS = $3003001E;
  ActMsgPR_EMAIL_ADDRESS_W = $3003001F;
  ActMsgPR_EMAIL_ADDRESS_A = $3003001E;
  ActMsgPR_COMMENT = $3004001E;
  ActMsgPR_COMMENT_W = $3004001F;
  ActMsgPR_COMMENT_A = $3004001E;
  ActMsgPR_DEPTH = $30050003;
  ActMsgPR_PROVIDER_DISPLAY = $3006001E;
  ActMsgPR_PROVIDER_DISPLAY_W = $3006001F;
  ActMsgPR_PROVIDER_DISPLAY_A = $3006001E;
  ActMsgPR_CREATION_TIME = $30070040;
  ActMsgPR_LAST_MODIFICATION_TIME = $30080040;
  ActMsgPR_RESOURCE_FLAGS = $30090003;
  ActMsgPR_PROVIDER_DLL_NAME = $300A001E;
  ActMsgPR_PROVIDER_DLL_NAME_W = $300A001F;
  ActMsgPR_PROVIDER_DLL_NAME_A = $300A001E;
  ActMsgPR_SEARCH_KEY = $300B0102;
  ActMsgPR_PROVIDER_UID = $300C0102;
  ActMsgPR_PROVIDER_ORDINAL = $300D0003;
  ActMsgPR_FORM_VERSION = $3301001E;
  ActMsgPR_FORM_VERSION_W = $3301001F;
  ActMsgPR_FORM_VERSION_A = $3301001E;
  ActMsgPR_FORM_CLSID = $33020048;
  ActMsgPR_FORM_CONTACT_NAME = $3303001E;
  ActMsgPR_FORM_CONTACT_NAME_W = $3303001F;
  ActMsgPR_FORM_CONTACT_NAME_A = $3303001E;
  ActMsgPR_FORM_CATEGORY = $3304001E;
  ActMsgPR_FORM_CATEGORY_W = $3304001F;
  ActMsgPR_FORM_CATEGORY_A = $3304001E;
  ActMsgPR_FORM_CATEGORY_SUB = $3305001E;
  ActMsgPR_FORM_CATEGORY_SUB_W = $3305001F;
  ActMsgPR_FORM_CATEGORY_SUB_A = $3305001E;
  ActMsgPR_FORM_HOST_MAP = $33061003;
  ActMsgPR_FORM_HIDDEN = $3307000B;
  ActMsgPR_FORM_DESIGNER_NAME = $3308001E;
  ActMsgPR_FORM_DESIGNER_NAME_W = $3308001F;
  ActMsgPR_FORM_DESIGNER_NAME_A = $3308001E;
  ActMsgPR_FORM_DESIGNER_GUID = $33090048;
  ActMsgPR_FORM_MESSAGE_BEHAVIOR = $330A0003;
  ActMsgPR_DEFAULT_STORE = $3400000B;
  ActMsgPR_STORE_SUPPORT_MASK = $340D0003;
  ActMsgPR_STORE_STATE = $340E0003;
  ActMsgPR_IPM_SUBTREE_SEARCH_KEY = $34100102;
  ActMsgPR_IPM_OUTBOX_SEARCH_KEY = $34110102;
  ActMsgPR_IPM_WASTEBASKET_SEARCH_KEY = $34120102;
  ActMsgPR_IPM_SENTMAIL_SEARCH_KEY = $34130102;
  ActMsgPR_MDB_PROVIDER = $34140102;
  ActMsgPR_RECEIVE_FOLDER_SETTINGS = $3415000D;
  ActMsgPR_VALID_FOLDER_MASK = $35DF0003;
  ActMsgPR_IPM_SUBTREE_ENTRYID = $35E00102;
  ActMsgPR_IPM_OUTBOX_ENTRYID = $35E20102;
  ActMsgPR_IPM_WASTEBASKET_ENTRYID = $35E30102;
  ActMsgPR_IPM_SENTMAIL_ENTRYID = $35E40102;
  ActMsgPR_VIEWS_ENTRYID = $35E50102;
  ActMsgPR_COMMON_VIEWS_ENTRYID = $35E60102;
  ActMsgPR_FINDER_ENTRYID = $35E70102;
  ActMsgPR_CONTAINER_FLAGS = $36000003;
  ActMsgPR_FOLDER_TYPE = $36010003;
  ActMsgPR_CONTENT_COUNT = $36020003;
  ActMsgPR_CONTENT_UNREAD = $36030003;
  ActMsgPR_CREATE_TEMPLATES = $3604000D;
  ActMsgPR_DETAILS_TABLE = $3605000D;
  ActMsgPR_SEARCH = $3607000D;
  ActMsgPR_SELECTABLE = $3609000B;
  ActMsgPR_SUBFOLDERS = $360A000B;
  ActMsgPR_STATUS = $360B0003;
  ActMsgPR_ANR = $360C001E;
  ActMsgPR_ANR_W = $360C001F;
  ActMsgPR_ANR_A = $360C001E;
  ActMsgPR_CONTENTS_SORT_ORDER = $360D1003;
  ActMsgPR_CONTAINER_HIERARCHY = $360E000D;
  ActMsgPR_CONTAINER_CONTENTS = $360F000D;
  ActMsgPR_FOLDER_ASSOCIATED_CONTENTS = $3610000D;
  ActMsgPR_DEF_CREATE_DL = $36110102;
  ActMsgPR_DEF_CREATE_MAILUSER = $36120102;
  ActMsgPR_CONTAINER_CLASS = $3613001E;
  ActMsgPR_CONTAINER_CLASS_W = $3613001F;
  ActMsgPR_CONTAINER_CLASS_A = $3613001E;
  ActMsgPR_CONTAINER_MODIFY_VERSION = $36140014;
  ActMsgPR_AB_PROVIDER_ID = $36150102;
  ActMsgPR_DEFAULT_VIEW_ENTRYID = $36160102;
  ActMsgPR_ASSOC_CONTENT_COUNT = $36170003;
  ActMsgPR_ATTACHMENT_X400_PARAMETERS = $37000102;
  ActMsgPR_ATTACH_DATA_OBJ = $3701000D;
  ActMsgPR_ATTACH_DATA_BIN = $37010102;
  ActMsgPR_ATTACH_ENCODING = $37020102;
  ActMsgPR_ATTACH_EXTENSION = $3703001E;
  ActMsgPR_ATTACH_EXTENSION_W = $3703001F;
  ActMsgPR_ATTACH_EXTENSION_A = $3703001E;
  ActMsgPR_ATTACH_FILENAME = $3704001E;
  ActMsgPR_ATTACH_FILENAME_W = $3704001F;
  ActMsgPR_ATTACH_FILENAME_A = $3704001E;
  ActMsgPR_ATTACH_METHOD = $37050003;
  ActMsgPR_ATTACH_LONG_FILENAME = $3707001E;
  ActMsgPR_ATTACH_LONG_FILENAME_W = $3707001F;
  ActMsgPR_ATTACH_LONG_FILENAME_A = $3707001E;
  ActMsgPR_ATTACH_PATHNAME = $3708001E;
  ActMsgPR_ATTACH_PATHNAME_W = $3708001F;
  ActMsgPR_ATTACH_PATHNAME_A = $3708001E;
  ActMsgPR_ATTACH_RENDERING = $37090102;
  ActMsgPR_ATTACH_TAG = $370A0102;
  ActMsgPR_RENDERING_POSITION = $370B0003;
  ActMsgPR_ATTACH_TRANSPORT_NAME = $370C001E;
  ActMsgPR_ATTACH_TRANSPORT_NAME_W = $370C001F;
  ActMsgPR_ATTACH_TRANSPORT_NAME_A = $370C001E;
  ActMsgPR_ATTACH_LONG_PATHNAME = $370D001E;
  ActMsgPR_ATTACH_LONG_PATHNAME_W = $370D001F;
  ActMsgPR_ATTACH_LONG_PATHNAME_A = $370D001E;
  ActMsgPR_ATTACH_MIME_TAG = $370E001E;
  ActMsgPR_ATTACH_MIME_TAG_W = $370E001F;
  ActMsgPR_ATTACH_MIME_TAG_A = $370E001E;
  ActMsgPR_ATTACH_ADDITIONAL_INFO = $370F0102;
  ActMsgPR_DISPLAY_TYPE = $39000003;
  ActMsgPR_TEMPLATEID = $39020102;
  ActMsgPR_PRIMARY_CAPABILITY = $39040102;
  ActMsgPR_7BIT_DISPLAY_NAME = $39FF001E;
  ActMsgPR_ACCOUNT = $3A00001E;
  ActMsgPR_ACCOUNT_W = $3A00001F;
  ActMsgPR_ACCOUNT_A = $3A00001E;
  ActMsgPR_ALTERNATE_RECIPIENT = $3A010102;
  ActMsgPR_CALLBACK_TELEPHONE_NUMBER = $3A02001E;
  ActMsgPR_CALLBACK_TELEPHONE_NUMBER_W = $3A02001F;
  ActMsgPR_CALLBACK_TELEPHONE_NUMBER_A = $3A02001E;
  ActMsgPR_CONVERSION_PROHIBITED = $3A03000B;
  ActMsgPR_DISCLOSE_RECIPIENTS = $3A04000B;
  ActMsgPR_GENERATION = $3A05001E;
  ActMsgPR_GENERATION_W = $3A05001F;
  ActMsgPR_GENERATION_A = $3A05001E;
  ActMsgPR_GIVEN_NAME = $3A06001E;
  ActMsgPR_GIVEN_NAME_W = $3A06001F;
  ActMsgPR_GIVEN_NAME_A = $3A06001E;
  ActMsgPR_GOVERNMENT_ID_NUMBER = $3A07001E;
  ActMsgPR_GOVERNMENT_ID_NUMBER_W = $3A07001F;
  ActMsgPR_GOVERNMENT_ID_NUMBER_A = $3A07001E;
  ActMsgPR_BUSINESS_TELEPHONE_NUMBER = $3A08001E;
  ActMsgPR_BUSINESS_TELEPHONE_NUMBER_W = $3A08001F;
  ActMsgPR_BUSINESS_TELEPHONE_NUMBER_A = $3A08001E;
  ActMsgPR_OFFICE_TELEPHONE_NUMBER = $3A08001E;
  ActMsgPR_OFFICE_TELEPHONE_NUMBER_W = $3A08001F;
  ActMsgPR_OFFICE_TELEPHONE_NUMBER_A = $3A08001E;
  ActMsgPR_HOME_TELEPHONE_NUMBER = $3A09001E;
  ActMsgPR_HOME_TELEPHONE_NUMBER_W = $3A09001F;
  ActMsgPR_HOME_TELEPHONE_NUMBER_A = $3A09001E;
  ActMsgPR_INITIALS = $3A0A001E;
  ActMsgPR_INITIALS_W = $3A0A001F;
  ActMsgPR_INITIALS_A = $3A0A001E;
  ActMsgPR_KEYWORD = $3A0B001E;
  ActMsgPR_KEYWORD_W = $3A0B001F;
  ActMsgPR_KEYWORD_A = $3A0B001E;
  ActMsgPR_LANGUAGE = $3A0C001E;
  ActMsgPR_LANGUAGE_W = $3A0C001F;
  ActMsgPR_LANGUAGE_A = $3A0C001E;
  ActMsgPR_LOCATION = $3A0D001E;
  ActMsgPR_LOCATION_W = $3A0D001F;
  ActMsgPR_LOCATION_A = $3A0D001E;
  ActMsgPR_MAIL_PERMISSION = $3A0E000B;
  ActMsgPR_MHS_COMMON_NAME = $3A0F001E;
  ActMsgPR_MHS_COMMON_NAME_W = $3A0F001F;
  ActMsgPR_MHS_COMMON_NAME_A = $3A0F001E;
  ActMsgPR_ORGANIZATIONAL_ID_NUMBER = $3A10001E;
  ActMsgPR_ORGANIZATIONAL_ID_NUMBER_W = $3A10001F;
  ActMsgPR_ORGANIZATIONAL_ID_NUMBER_A = $3A10001E;
  ActMsgPR_SURNAME = $3A11001E;
  ActMsgPR_SURNAME_W = $3A11001F;
  ActMsgPR_SURNAME_A = $3A11001E;
  ActMsgPR_ORIGINAL_ENTRYID = $3A120102;
  ActMsgPR_ORIGINAL_DISPLAY_NAME = $3A13001E;
  ActMsgPR_ORIGINAL_DISPLAY_NAME_W = $3A13001F;
  ActMsgPR_ORIGINAL_DISPLAY_NAME_A = $3A13001E;
  ActMsgPR_ORIGINAL_SEARCH_KEY = $3A140102;
  ActMsgPR_POSTAL_ADDRESS = $3A15001E;
  ActMsgPR_POSTAL_ADDRESS_W = $3A15001F;
  ActMsgPR_POSTAL_ADDRESS_A = $3A15001E;
  ActMsgPR_COMPANY_NAME = $3A16001E;
  ActMsgPR_COMPANY_NAME_W = $3A16001F;
  ActMsgPR_COMPANY_NAME_A = $3A16001E;
  ActMsgPR_TITLE = $3A17001E;
  ActMsgPR_TITLE_W = $3A17001F;
  ActMsgPR_TITLE_A = $3A17001E;
  ActMsgPR_DEPARTMENT_NAME = $3A18001E;
  ActMsgPR_DEPARTMENT_NAME_W = $3A18001F;
  ActMsgPR_DEPARTMENT_NAME_A = $3A18001E;
  ActMsgPR_OFFICE_LOCATION = $3A19001E;
  ActMsgPR_OFFICE_LOCATION_W = $3A19001F;
  ActMsgPR_OFFICE_LOCATION_A = $3A19001E;
  ActMsgPR_PRIMARY_TELEPHONE_NUMBER = $3A1A001E;
  ActMsgPR_PRIMARY_TELEPHONE_NUMBER_W = $3A1A001F;
  ActMsgPR_PRIMARY_TELEPHONE_NUMBER_A = $3A1A001E;
  ActMsgPR_BUSINESS2_TELEPHONE_NUMBER = $3A1B001E;
  ActMsgPR_BUSINESS2_TELEPHONE_NUMBER_W = $3A1B001F;
  ActMsgPR_BUSINESS2_TELEPHONE_NUMBER_A = $3A1B001E;
  ActMsgPR_OFFICE2_TELEPHONE_NUMBER = $3A1B001E;
  ActMsgPR_OFFICE2_TELEPHONE_NUMBER_W = $3A1B001F;
  ActMsgPR_OFFICE2_TELEPHONE_NUMBER_A = $3A1B001E;
  ActMsgPR_MOBILE_TELEPHONE_NUMBER = $3A1C001E;
  ActMsgPR_MOBILE_TELEPHONE_NUMBER_W = $3A1C001F;
  ActMsgPR_MOBILE_TELEPHONE_NUMBER_A = $3A1C001E;
  ActMsgPR_CELLULAR_TELEPHONE_NUMBER = $3A1C001E;
  ActMsgPR_CELLULAR_TELEPHONE_NUMBER_W = $3A1C001F;
  ActMsgPR_CELLULAR_TELEPHONE_NUMBER_A = $3A1C001E;
  ActMsgPR_RADIO_TELEPHONE_NUMBER = $3A1D001E;
  ActMsgPR_RADIO_TELEPHONE_NUMBER_W = $3A1D001F;
  ActMsgPR_RADIO_TELEPHONE_NUMBER_A = $3A1D001E;
  ActMsgPR_CAR_TELEPHONE_NUMBER = $3A1E001E;
  ActMsgPR_CAR_TELEPHONE_NUMBER_W = $3A1E001F;
  ActMsgPR_CAR_TELEPHONE_NUMBER_A = $3A1E001E;
  ActMsgPR_OTHER_TELEPHONE_NUMBER = $3A1F001E;
  ActMsgPR_OTHER_TELEPHONE_NUMBER_W = $3A1F001F;
  ActMsgPR_OTHER_TELEPHONE_NUMBER_A = $3A1F001E;
  ActMsgPR_TRANSMITABLE_DISPLAY_NAME = $3A20001E;
  ActMsgPR_TRANSMITABLE_DISPLAY_NAME_W = $3A20001F;
  ActMsgPR_TRANSMITABLE_DISPLAY_NAME_A = $3A20001E;
  ActMsgPR_PAGER_TELEPHONE_NUMBER = $3A21001E;
  ActMsgPR_PAGER_TELEPHONE_NUMBER_W = $3A21001F;
  ActMsgPR_PAGER_TELEPHONE_NUMBER_A = $3A21001E;
  ActMsgPR_BEEPER_TELEPHONE_NUMBER = $3A21001E;
  ActMsgPR_BEEPER_TELEPHONE_NUMBER_W = $3A21001F;
  ActMsgPR_BEEPER_TELEPHONE_NUMBER_A = $3A21001E;
  ActMsgPR_USER_CERTIFICATE = $3A220102;
  ActMsgPR_PRIMARY_FAX_NUMBER = $3A23001E;
  ActMsgPR_PRIMARY_FAX_NUMBER_W = $3A23001F;
  ActMsgPR_PRIMARY_FAX_NUMBER_A = $3A23001E;
  ActMsgPR_BUSINESS_FAX_NUMBER = $3A24001E;
  ActMsgPR_BUSINESS_FAX_NUMBER_W = $3A24001F;
  ActMsgPR_BUSINESS_FAX_NUMBER_A = $3A24001E;
  ActMsgPR_HOME_FAX_NUMBER = $3A25001E;
  ActMsgPR_HOME_FAX_NUMBER_W = $3A25001F;
  ActMsgPR_HOME_FAX_NUMBER_A = $3A25001E;
  ActMsgPR_COUNTRY = $3A26001E;
  ActMsgPR_COUNTRY_W = $3A26001F;
  ActMsgPR_COUNTRY_A = $3A26001E;
  ActMsgPR_BUSINESS_ADDRESS_COUNTRY = $3A26001E;
  ActMsgPR_BUSINESS_ADDRESS_COUNTRY_W = $3A26001F;
  ActMsgPR_BUSINESS_ADDRESS_COUNTRY_A = $3A26001E;
  ActMsgPR_LOCALITY = $3A27001E;
  ActMsgPR_LOCALITY_W = $3A27001F;
  ActMsgPR_LOCALITY_A = $3A27001E;
  ActMsgPR_BUSINESS_ADDRESS_CITY = $3A27001E;
  ActMsgPR_BUSINESS_ADDRESS_CITY_W = $3A27001F;
  ActMsgPR_BUSINESS_ADDRESS_CITY_A = $3A27001E;
  ActMsgPR_STATE_OR_PROVINCE = $3A28001E;
  ActMsgPR_STATE_OR_PROVINCE_W = $3A28001F;
  ActMsgPR_STATE_OR_PROVINCE_A = $3A28001E;
  ActMsgPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE = $3A28001E;
  ActMsgPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_W = $3A28001F;
  ActMsgPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_A = $3A28001E;
  ActMsgPR_STREET_ADDRESS = $3A29001E;
  ActMsgPR_STREET_ADDRESS_W = $3A29001F;
  ActMsgPR_STREET_ADDRESS_A = $3A29001E;
  ActMsgPR_BUSINESS_ADDRESS_STREET = $3A29001E;
  ActMsgPR_BUSINESS_ADDRESS_STREET_W = $3A29001F;
  ActMsgPR_BUSINESS_ADDRESS_STREET_A = $3A29001E;
  ActMsgPR_POSTAL_CODE = $3A2A001E;
  ActMsgPR_POSTAL_CODE_W = $3A2A001F;
  ActMsgPR_POSTAL_CODE_A = $3A2A001E;
  ActMsgPR_BUSINESS_ADDRESS_POSTAL_CODE = $3A2A001E;
  ActMsgPR_BUSINESS_ADDRESS_POSTAL_CODE_W = $3A2A001F;
  ActMsgPR_BUSINESS_ADDRESS_POSTAL_CODE_A = $3A2A001E;
  ActMsgPR_POST_OFFICE_BOX = $3A2B001E;
  ActMsgPR_POST_OFFICE_BOX_W = $3A2B001F;
  ActMsgPR_POST_OFFICE_BOX_A = $3A2B001E;
  ActMsgPR_BUSINESS_ADDRESS_POST_OFFICE_BOX = $3A2B001E;
  ActMsgPR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W = $3A2B001F;
  ActMsgPR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A = $3A2B001E;
  ActMsgPR_TELEX_NUMBER = $3A2C001E;
  ActMsgPR_TELEX_NUMBER_W = $3A2C001F;
  ActMsgPR_TELEX_NUMBER_A = $3A2C001E;
  ActMsgPR_ISDN_NUMBER = $3A2D001E;
  ActMsgPR_ISDN_NUMBER_W = $3A2D001F;
  ActMsgPR_ISDN_NUMBER_A = $3A2D001E;
  ActMsgPR_ASSISTANT_TELEPHONE_NUMBER = $3A2E001E;
  ActMsgPR_ASSISTANT_TELEPHONE_NUMBER_W = $3A2E001F;
  ActMsgPR_ASSISTANT_TELEPHONE_NUMBER_A = $3A2E001E;
  ActMsgPR_HOME2_TELEPHONE_NUMBER = $3A2F001E;
  ActMsgPR_HOME2_TELEPHONE_NUMBER_W = $3A2F001F;
  ActMsgPR_HOME2_TELEPHONE_NUMBER_A = $3A2F001E;
  ActMsgPR_ASSISTANT = $3A30001E;
  ActMsgPR_ASSISTANT_W = $3A30001F;
  ActMsgPR_ASSISTANT_A = $3A30001E;
  ActMsgPR_SEND_RICH_INFO = $3A40000B;
  ActMsgPR_WEDDING_ANNIVERSARY = $3A410040;
  ActMsgPR_BIRTHDAY = $3A420040;
  ActMsgPR_HOBBIES = $3A43001E;
  ActMsgPR_HOBBIES_W = $3A43001F;
  ActMsgPR_HOBBIES_A = $3A43001E;
  ActMsgPR_MIDDLE_NAME = $3A44001E;
  ActMsgPR_MIDDLE_NAME_W = $3A44001F;
  ActMsgPR_MIDDLE_NAME_A = $3A44001E;
  ActMsgPR_DISPLAY_NAME_PREFIX = $3A45001E;
  ActMsgPR_DISPLAY_NAME_PREFIX_W = $3A45001F;
  ActMsgPR_DISPLAY_NAME_PREFIX_A = $3A45001E;
  ActMsgPR_PROFESSION = $3A46001E;
  ActMsgPR_PROFESSION_W = $3A46001F;
  ActMsgPR_PROFESSION_A = $3A46001E;
  ActMsgPR_PREFERRED_BY_NAME = $3A47001E;
  ActMsgPR_PREFERRED_BY_NAME_W = $3A47001F;
  ActMsgPR_PREFERRED_BY_NAME_A = $3A47001E;
  ActMsgPR_SPOUSE_NAME = $3A48001E;
  ActMsgPR_SPOUSE_NAME_W = $3A48001F;
  ActMsgPR_SPOUSE_NAME_A = $3A48001E;
  ActMsgPR_COMPUTER_NETWORK_NAME = $3A49001E;
  ActMsgPR_COMPUTER_NETWORK_NAME_W = $3A49001F;
  ActMsgPR_COMPUTER_NETWORK_NAME_A = $3A49001E;
  ActMsgPR_CUSTOMER_ID = $3A4A001E;
  ActMsgPR_CUSTOMER_ID_W = $3A4A001F;
  ActMsgPR_CUSTOMER_ID_A = $3A4A001E;
  ActMsgPR_TTYTDD_PHONE_NUMBER = $3A4B001E;
  ActMsgPR_TTYTDD_PHONE_NUMBER_W = $3A4B001F;
  ActMsgPR_TTYTDD_PHONE_NUMBER_A = $3A4B001E;
  ActMsgPR_FTP_SITE = $3A4C001E;
  ActMsgPR_FTP_SITE_W = $3A4C001F;
  ActMsgPR_FTP_SITE_A = $3A4C001E;
  ActMsgPR_GENDER = $3A4D0002;
  ActMsgPR_MANAGER_NAME = $3A4E001E;
  ActMsgPR_MANAGER_NAME_W = $3A4E001F;
  ActMsgPR_MANAGER_NAME_A = $3A4E001E;
  ActMsgPR_NICKNAME = $3A4F001E;
  ActMsgPR_NICKNAME_W = $3A4F001F;
  ActMsgPR_NICKNAME_A = $3A4F001E;
  ActMsgPR_PERSONAL_HOME_PAGE = $3A50001E;
  ActMsgPR_PERSONAL_HOME_PAGE_W = $3A50001F;
  ActMsgPR_PERSONAL_HOME_PAGE_A = $3A50001E;
  ActMsgPR_BUSINESS_HOME_PAGE = $3A51001E;
  ActMsgPR_BUSINESS_HOME_PAGE_W = $3A51001F;
  ActMsgPR_BUSINESS_HOME_PAGE_A = $3A51001E;
  ActMsgPR_CONTACT_VERSION = $3A520048;
  ActMsgPR_CONTACT_ENTRYIDS = $3A531102;
  ActMsgPR_CONTACT_ADDRTYPES = $3A54101E;
  ActMsgPR_CONTACT_ADDRTYPES_W = $3A54101F;
  ActMsgPR_CONTACT_ADDRTYPES_A = $3A54101E;
  ActMsgPR_CONTACT_DEFAULT_ADDRESS_INDEX = $3A550003;
  ActMsgPR_CONTACT_EMAIL_ADDRESSES = $3A56101E;
  ActMsgPR_CONTACT_EMAIL_ADDRESSES_W = $3A56101F;
  ActMsgPR_CONTACT_EMAIL_ADDRESSES_A = $3A56101E;
  ActMsgPR_COMPANY_MAIN_PHONE_NUMBER = $3A57001E;
  ActMsgPR_COMPANY_MAIN_PHONE_NUMBER_W = $3A57001F;
  ActMsgPR_COMPANY_MAIN_PHONE_NUMBER_A = $3A57001E;
  ActMsgPR_CHILDRENS_NAMES = $3A58101E;
  ActMsgPR_CHILDRENS_NAMES_W = $3A58101F;
  ActMsgPR_CHILDRENS_NAMES_A = $3A58101E;
  ActMsgPR_HOME_ADDRESS_CITY = $3A59001E;
  ActMsgPR_HOME_ADDRESS_CITY_W = $3A59001F;
  ActMsgPR_HOME_ADDRESS_CITY_A = $3A59001E;
  ActMsgPR_HOME_ADDRESS_COUNTRY = $3A5A001E;
  ActMsgPR_HOME_ADDRESS_COUNTRY_W = $3A5A001F;
  ActMsgPR_HOME_ADDRESS_COUNTRY_A = $3A5A001E;
  ActMsgPR_HOME_ADDRESS_POSTAL_CODE = $3A5B001E;
  ActMsgPR_HOME_ADDRESS_POSTAL_CODE_W = $3A5B001F;
  ActMsgPR_HOME_ADDRESS_POSTAL_CODE_A = $3A5B001E;
  ActMsgPR_HOME_ADDRESS_STATE_OR_PROVINCE = $3A5C001E;
  ActMsgPR_HOME_ADDRESS_STATE_OR_PROVINCE_W = $3A5C001F;
  ActMsgPR_HOME_ADDRESS_STATE_OR_PROVINCE_A = $3A5C001E;
  ActMsgPR_HOME_ADDRESS_STREET = $3A5D001E;
  ActMsgPR_HOME_ADDRESS_STREET_W = $3A5D001F;
  ActMsgPR_HOME_ADDRESS_STREET_A = $3A5D001E;
  ActMsgPR_HOME_ADDRESS_POST_OFFICE_BOX = $3A5E001E;
  ActMsgPR_HOME_ADDRESS_POST_OFFICE_BOX_W = $3A5E001F;
  ActMsgPR_HOME_ADDRESS_POST_OFFICE_BOX_A = $3A5E001E;
  ActMsgPR_OTHER_ADDRESS_CITY = $3A5F001E;
  ActMsgPR_OTHER_ADDRESS_CITY_W = $3A5F001F;
  ActMsgPR_OTHER_ADDRESS_CITY_A = $3A5F001E;
  ActMsgPR_OTHER_ADDRESS_COUNTRY = $3A60001E;
  ActMsgPR_OTHER_ADDRESS_COUNTRY_W = $3A60001F;
  ActMsgPR_OTHER_ADDRESS_COUNTRY_A = $3A60001E;
  ActMsgPR_OTHER_ADDRESS_POSTAL_CODE = $3A61001E;
  ActMsgPR_OTHER_ADDRESS_POSTAL_CODE_W = $3A61001F;
  ActMsgPR_OTHER_ADDRESS_POSTAL_CODE_A = $3A61001E;
  ActMsgPR_OTHER_ADDRESS_STATE_OR_PROVINCE = $3A62001E;
  ActMsgPR_OTHER_ADDRESS_STATE_OR_PROVINCE_W = $3A62001F;
  ActMsgPR_OTHER_ADDRESS_STATE_OR_PROVINCE_A = $3A62001E;
  ActMsgPR_OTHER_ADDRESS_STREET = $3A63001E;
  ActMsgPR_OTHER_ADDRESS_STREET_W = $3A63001F;
  ActMsgPR_OTHER_ADDRESS_STREET_A = $3A63001E;
  ActMsgPR_OTHER_ADDRESS_POST_OFFICE_BOX = $3A64001E;
  ActMsgPR_OTHER_ADDRESS_POST_OFFICE_BOX_W = $3A64001F;
  ActMsgPR_OTHER_ADDRESS_POST_OFFICE_BOX_A = $3A64001E;
  ActMsgPR_USER_X509_CERTIFICATE = $3A701102;
  ActMsgPR_STORE_PROVIDERS = $3D000102;
  ActMsgPR_AB_PROVIDERS = $3D010102;
  ActMsgPR_TRANSPORT_PROVIDERS = $3D020102;
  ActMsgPR_DEFAULT_PROFILE = $3D04000B;
  ActMsgPR_AB_SEARCH_PATH = $3D051102;
  ActMsgPR_AB_DEFAULT_DIR = $3D060102;
  ActMsgPR_AB_DEFAULT_PAB = $3D070102;
  ActMsgPR_FILTERING_HOOKS = $3D080102;
  ActMsgPR_SERVICE_NAME = $3D09001E;
  ActMsgPR_SERVICE_NAME_W = $3D09001F;
  ActMsgPR_SERVICE_NAME_A = $3D09001E;
  ActMsgPR_SERVICE_DLL_NAME = $3D0A001E;
  ActMsgPR_SERVICE_DLL_NAME_W = $3D0A001F;
  ActMsgPR_SERVICE_DLL_NAME_A = $3D0A001E;
  ActMsgPR_SERVICE_ENTRY_NAME = $3D0B001E;
  ActMsgPR_SERVICE_UID = $3D0C0102;
  ActMsgPR_SERVICE_EXTRA_UIDS = $3D0D0102;
  ActMsgPR_SERVICES = $3D0E0102;
  ActMsgPR_SERVICE_SUPPORT_FILES = $3D0F101E;
  ActMsgPR_SERVICE_SUPPORT_FILES_W = $3D0F101F;
  ActMsgPR_SERVICE_SUPPORT_FILES_A = $3D0F101E;
  ActMsgPR_SERVICE_DELETE_FILES = $3D10101E;
  ActMsgPR_SERVICE_DELETE_FILES_W = $3D10101F;
  ActMsgPR_SERVICE_DELETE_FILES_A = $3D10101E;
  ActMsgPR_AB_SEARCH_PATH_UPDATE = $3D110102;
  ActMsgPR_PROFILE_NAME = $3D12001E;
  ActMsgPR_PROFILE_NAME_A = $3D12001E;
  ActMsgPR_PROFILE_NAME_W = $3D12001F;
  ActMsgPR_IDENTITY_DISPLAY = $3E00001E;
  ActMsgPR_IDENTITY_DISPLAY_W = $3E00001F;
  ActMsgPR_IDENTITY_DISPLAY_A = $3E00001E;
  ActMsgPR_IDENTITY_ENTRYID = $3E010102;
  ActMsgPR_RESOURCE_METHODS = $3E020003;
  ActMsgPR_RESOURCE_TYPE = $3E030003;
  ActMsgPR_STATUS_CODE = $3E040003;
  ActMsgPR_IDENTITY_SEARCH_KEY = $3E050102;
  ActMsgPR_OWN_STORE_ENTRYID = $3E060102;
  ActMsgPR_RESOURCE_PATH = $3E07001E;
  ActMsgPR_RESOURCE_PATH_W = $3E07001F;
  ActMsgPR_RESOURCE_PATH_A = $3E07001E;
  ActMsgPR_STATUS_STRING = $3E08001E;
  ActMsgPR_STATUS_STRING_W = $3E08001F;
  ActMsgPR_STATUS_STRING_A = $3E08001E;
  ActMsgPR_X400_DEFERRED_DELIVERY_CANCEL = $3E09000B;
  ActMsgPR_HEADER_FOLDER_ENTRYID = $3E0A0102;
  ActMsgPR_REMOTE_PROGRESS = $3E0B0003;
  ActMsgPR_REMOTE_PROGRESS_TEXT = $3E0C001E;
  ActMsgPR_REMOTE_PROGRESS_TEXT_W = $3E0C001F;
  ActMsgPR_REMOTE_PROGRESS_TEXT_A = $3E0C001E;
  ActMsgPR_REMOTE_VALIDATE_OK = $3E0D000B;
  ActMsgPR_CONTROL_FLAGS = $3F000003;
  ActMsgPR_CONTROL_STRUCTURE = $3F010102;
  ActMsgPR_CONTROL_TYPE = $3F020003;
  ActMsgPR_DELTAX = $3F030003;
  ActMsgPR_DELTAY = $3F040003;
  ActMsgPR_XPOS = $3F050003;
  ActMsgPR_YPOS = $3F060003;
  ActMsgPR_CONTROL_ID = $3F070102;
  ActMsgPR_INITIAL_DETAILS_PANE = $3F080003;
  ActMsgPR_NNTP_XREF = $1040001E;
  ActMsgPR_NNTP_XREF_W = $1040001F;
  ActMsgPR_NNTP_XREF_A = $1040001E;
  ActMsgPR_INTERNET_PRECEDENCE = $1041001E;
  ActMsgPR_INTERNET_PRECEDENCE_W = $1041001F;
  ActMsgPR_INTERNET_PRECEDENCE_A = $1041001E;
  ActMsgPR_REFERRED_BY_NAME = $3A47001E;
  ActMsgPR_REFERRED_BY_NAME_W = $3A47001F;
  ActMsgPR_REFERRED_BY_NAME_A = $3A47001E;
  ActMsgPR_SEND_INTERNET_ENCODING = $3A710003;

// Constants for enum CdoFieldType
type
  CdoFieldType = TOleEnum;
const
  CdoEmpty = $00000000;
  CdoNull = $00000001;
  CdoInteger = $00000002;
  CdoLong = $00000003;
  CdoSingle = $00000004;
  CdoDouble = $00000005;
  CdoCurrency = $00000006;
  CdoDate = $00000007;
  CdoString = $00000008;
  CdoBoolean = $0000000B;
  CdoDataObject = $0000000D;
  CdoBlob = $00000041;
  CdoArray = $00002000;

// Constants for enum CdoImportance
type
  CdoImportance = TOleEnum;
const
  CdoLow = $00000000;
  CdoNormal = $00000001;
  CdoHigh = $00000002;

// Constants for enum CdoSensitivity
type
  CdoSensitivity = TOleEnum;
const
  CdoNoSensitivity = $00000000;
  CdoPersonal = $00000001;
  CdoPrivate = $00000002;
  CdoConfidential = $00000003;

// Constants for enum CdoSortOrder
type
  CdoSortOrder = TOleEnum;
const
  CdoNone = $00000000;
  CdoAscending = $00000001;
  CdoDescending = $00000002;

// Constants for enum CdoRecipientType
type
  CdoRecipientType = TOleEnum;
const
  CdoTo = $00000001;
  CdoCc = $00000002;
  CdoBcc = $00000003;

// Constants for enum CdoAttachmentType
type
  CdoAttachmentType = TOleEnum;
const
  CdoFileData = $00000001;
  CdoFileLink = $00000002;
  CdoOle = $00000003;
  CdoEmbeddedMessage = $00000004;

// Constants for enum CdoDisplayType
type
  CdoDisplayType = TOleEnum;
const
  CdoUser = $00000000;
  CdoDistList = $00000001;
  CdoForum = $00000002;
  CdoAgent = $00000003;
  CdoOrganization = $00000004;
  CdoPrivateDistList = $00000005;
  CdoRemoteUser = $00000006;

// Constants for enum CdoObjectClass
type
  CdoObjectClass = TOleEnum;
const
  CdoUnknown = $FFFFFFFF;
  CdoSession = $00000000;
  CdoInfoStore = $00000001;
  CdoFolder = $00000002;
  CdoMsg = $00000003;
  CdoRecipient = $00000004;
  CdoAttachment = $00000005;
  CdoField = $00000006;
  CdoAddressList = $00000007;
  CdoAddressEntry = $00000008;
  CdoAddressFilter = $00000009;
  CdoMessageFilter = $0000000A;
  CdoInfoStores = $0000000E;
  CdoFolders = $0000000F;
  CdoMessages = $00000010;
  CdoRecipients = $00000011;
  CdoAttachments = $00000012;
  CdoFields = $00000013;
  CdoAddressLists = $00000014;
  CdoAddressEntries = $00000015;
  CdoGroupHeader = $00000019;
  CdoAppointment = $0000001A;
  CdoMeetingItem = $0000001B;
  CdoRecurrencePattern = $0000001C;
  CdoExceptions = $0000001D;
  CdoException = $0000001E;
  CdoMeetingPlanner = $0000001F;
  CdoHiddenMessages = $00000020;
  CdoMsgClassTotal = $00000021;

// Constants for enum CdoDefaultFolderTypes
type
  CdoDefaultFolderTypes = TOleEnum;
const
  CdoDefaultFolderCalendar = $00000000;
  CdoDefaultFolderInbox = $00000001;
  CdoDefaultFolderOutbox = $00000002;
  CdoDefaultFolderSentItems = $00000003;
  CdoDefaultFolderDeletedItems = $00000004;
  CdoDefaultFolderContacts = $00000005;
  CdoDefaultFolderJournal = $00000006;
  CdoDefaultFolderNotes = $00000007;
  CdoDefaultFolderTasks = $00000008;
  CdoDefaultFolderTotal = $00000009;

// Constants for enum CdoAddressListTypes
type
  CdoAddressListTypes = TOleEnum;
const
  CdoAddressListGAL = $00000000;
  CdoAddressListPAB = $00000001;
  CdoAddressListTotal = $00000002;

// Constants for enum CdoDaysOfWeek
type
  CdoDaysOfWeek = TOleEnum;
const
  CdoSunday = $00000001;
  CdoMonday = $00000002;
  CdoTuesday = $00000004;
  CdoWednesday = $00000008;
  CdoThursday = $00000010;
  CdoFriday = $00000020;
  CdoSaturday = $00000040;

// Constants for enum CdoRecurTypes
type
  CdoRecurTypes = TOleEnum;
const
  CdoRecurTypeDaily = $00000000;
  CdoRecurTypeWeekly = $00000001;
  CdoRecurTypeMonthly = $00000002;
  CdoRecurTypeMonthlyNth = $00000003;
  CdoRecurTypeYearly = $00000005;
  CdoRecurTypeYearlyNth = $00000006;

// Constants for enum CdoPropIds
type
  CdoPropIds = TOleEnum;
const
  CdoPidLocation = $00007E00;
  CdoPidApptStartWhole = $00007E01;
  CdoPidApptEndWhole = $00007E02;
  CdoPidResponseStatus = $00007E03;
  CdoPidRecurring = $00007E04;
  CdoPidBusyStatus = $00007E05;
  CdoPidApptDuration = $00007E06;
  CdoPidApptSubType = $00007E07;
  CdoPidApptStateFlags = $00007E08;
  CdoPidApptReplyTime = $00007E09;
  CdoPidApptUpdateTime = $00007E0A;
  CdoPidExceptionReplaceTime = $00007E0B;
  CdoPidOwnerName = $00007E0C;
  CdoPidRecurType = $00007E0D;
  CdoPidReminderDelta = $00007E0E;
  CdoPidReminderTime = $00007E0F;
  CdoPidReminderSet = $00007E10;
  CdoPidAgingDontAgeMe = $00007E11;
  CdoPidDayOfMonth = $00007E12;
  CdoPidDayOfWeekMask = $00007E13;
  CdoPidInstance = $00007E14;
  CdoPidInterval = $00007E15;
  CdoPidOccurrences = $00007E16;
  CdoPidMonthOfYear = $00007E17;
  CdoPidFSliding = $00007E18;
  CdoPidFNoEndDate = $00007E19;
  CdoPidRecurDuration = $00007E1A;
  CdoPidApptGlobalObjId = $00007E1B;
  CdoPidTimeZone = $00007E1C;
  CdoPidStoreType = $00007E1D;
  CdoPidMaximum = $00007E1E;

// Constants for enum CdoMeetingStatusTypes
type
  CdoMeetingStatusTypes = TOleEnum;
const
  CdoNonMeeting = $00000000;
  CdoMeeting = $00000001;
  CdoMeetingReceived = $00000003;
  CdoMeetingCanceled = $00000005;

// Constants for enum CdoResponseStatus
type
  CdoResponseStatus = TOleEnum;
const
  CdoResponseNone = $00000000;
  CdoResponseOrganized = $00000001;
  CdoResponseTentative = $00000002;
  CdoResponseAccepted = $00000003;
  CdoResponseDeclined = $00000004;
  CdoResponseNotResponded = $00000005;

// Constants for enum CdoStoreType
type
  CdoStoreType = TOleEnum;
const
  CdoOutlook = $00000001;
  CdoSchedulePlus = $00000002;

// Constants for enum CdoBusyStatus
type
  CdoBusyStatus = TOleEnum;
const
  CdoFree = $00000000;
  CdoTentative = $00000001;
  CdoBusy = $00000002;
  CdoOutOfOffice = $00000003;

// Constants for enum CdoMeetingType
type
  CdoMeetingType = TOleEnum;
const
  CdoMeetingRequest = $00000001;
  CdoMeetingResponse = $00000002;

// Constants for enum CdoTimeZones
type
  CdoTimeZones = TOleEnum;
const
  CdoTmzNoDST = $00004000;
  CdoTmzUTC = $00004001;
  CdoTmzOrigin = $00000000;
  CdoTmzGMT = $00000001;
  CdoTmzLisbon = $00000002;
  CdoTmzParis = $00000003;
  CdoTmzBerlin = $00000004;
  CdoTmzEasternEurope = $00000005;
  CdoTmzPrague = $00000006;
  CdoTmzAthens = $00000007;
  CdoTmzRiodeJaneiro = $00000008;
  CdoTmzAtlanticCanada = $00000009;
  CdoTmzEastern = $0000000A;
  CdoTmzCentral = $0000000B;
  CdoTmzMountain = $0000000C;
  CdoTmzPacific = $0000000D;
  CdoTmzAlaska = $0000000E;
  CdoTmzHawaii = $0000000F;
  CdoTmzMidwayIsland = $00000010;
  CdoTmzWellington = $00000011;
  CdoTmzBrisbane = $00000012;
  CdoTmzAdelaide = $00000013;
  CdoTmzTokyo = $00000014;
  CdoTmzHongKong = $00000015;
  CdoTmzBangkok = $00000016;
  CdoTmzBombay = $00000017;
  CdoTmzAbuDhabi = $00000018;
  CdoTmzTehran = $00000019;
  CdoTmzBaghdad = $0000001A;
  CdoTmzIsrael = $0000001B;
  CdoTmzNewfoundlad = $0000001C;
  CdoTmzAzores = $0000001D;
  CdoTmzMidAtlantic = $0000001E;
  CdoTmzMonrovia = $0000001F;
  CdoTmzBuenosAires = $00000020;
  CdoTmzCaracas = $00000021;
  CdoTmzIndiana = $00000022;
  CdoTmzBogota = $00000023;
  CdoTmzSaskatchewan = $00000024;
  CdoTmzMexicoCity = $00000025;
  CdoTmzArizona = $00000026;
  CdoTmzEnewetak = $00000027;
  CdoTmzFiji = $00000028;
  CdoTmzMagadan = $00000029;
  CdoTmzHobart = $0000002A;
  CdoTmzGuam = $0000002B;
  CdoTmzDarwin = $0000002C;
  CdoTmzBeijing = $0000002D;
  CdoTmzAlmaty = $0000002E;
  CdoTmzIslamabad = $0000002F;
  CdoTmzKabul = $00000030;
  CdoTmzCairo = $00000031;
  CdoTmzHarare = $00000032;
  CdoTmzMoscow = $00000033;
  CdoTmzSydney2k = $00000034;
  CdoTmzMax = $00000035;

// Constants for enum CdoLimits
type
  CdoLimits = TOleEnum;
const
  CdoMaxCount = $7FFFFFFF;

// Constants for enum CdoErrorType
type
  CdoErrorType = TOleEnum;
const
  CdoE_CALL_FAILED = $80004005;
  CdoE_NOT_ENOUGH_MEMORY = $8007000E;
  CdoE_INVALID_PARAMETER = $80070057;
  CdoE_INTERFACE_NOT_SUPPORTED = $80004002;
  CdoE_NO_ACCESS = $80070005;
  CdoE_NO_SUPPORT = $80040102;
  CdoE_BAD_CHARWIDTH = $80040103;
  CdoE_STRING_TOO_LONG = $80040105;
  CdoE_UNKNOWN_FLAGS = $80040106;
  CdoE_INVALID_ENTRYID = $80040107;
  CdoE_INVALID_OBJECT = $80040108;
  CdoE_OBJECT_CHANGED = $80040109;
  CdoE_OBJECT_DELETED = $8004010A;
  CdoE_BUSY = $8004010B;
  CdoE_NOT_ENOUGH_DISK = $8004010D;
  CdoE_NOT_ENOUGH_RESOURCES = $8004010E;
  CdoE_NOT_FOUND = $8004010F;
  CdoE_VERSION = $80040110;
  CdoE_LOGON_FAILED = $80040111;
  CdoE_SESSION_LIMIT = $80040112;
  CdoE_USER_CANCEL = $80040113;
  CdoE_UNABLE_TO_ABORT = $80040114;
  CdoE_NETWORK_ERROR = $80040115;
  CdoE_DISK_ERROR = $80040116;
  CdoE_TOO_COMPLEX = $80040117;
  CdoE_BAD_COLUMN = $80040118;
  CdoE_EXTENDED_ERROR = $80040119;
  CdoE_COMPUTED = $8004011A;
  CdoE_CORRUPT_DATA = $8004011B;
  CdoE_UNCONFIGURED = $8004011C;
  CdoE_FAILONEPROVIDER = $8004011D;
  CdoE_UNKNOWN_CPID = $8004011E;
  CdoE_UNKNOWN_LCID = $8004011F;
  CdoE_PASSWORD_CHANGE_REQUIRED = $80040120;
  CdoE_PASSWORD_EXPIRED = $80040121;
  CdoE_INVALID_WORKSTATION_ACCOUNT = $80040122;
  CdoE_INVALID_ACCESS_TIME = $80040123;
  CdoE_ACCOUNT_DISABLED = $80040124;
  CdoE_END_OF_SESSION = $80040200;
  CdoE_UNKNOWN_ENTRYID = $80040201;
  CdoE_MISSING_REQUIRED_COLUMN = $80040202;
  CdoW_NO_SERVICE = $00040203;
  CdoE_BAD_VALUE = $80040301;
  CdoE_INVALID_TYPE = $80040302;
  CdoE_TYPE_NO_SUPPORT = $80040303;
  CdoE_UNEXPECTED_TYPE = $80040304;
  CdoE_TOO_BIG = $80040305;
  CdoE_DECLINE_COPY = $80040306;
  CdoE_UNEXPECTED_ID = $80040307;
  CdoW_ERRORS_RETURNED = $00040380;
  CdoE_UNABLE_TO_COMPLETE = $80040400;
  CdoE_TIMEOUT = $80040401;
  CdoE_TABLE_EMPTY = $80040402;
  CdoE_TABLE_TOO_BIG = $80040403;
  CdoE_INVALID_BOOKMARK = $80040405;
  CdoW_POSITION_CHANGED = $00040481;
  CdoW_APPROX_COUNT = $00040482;
  CdoE_WAIT = $80040500;
  CdoE_CANCEL = $80040501;
  CdoE_NOT_ME = $80040502;
  CdoW_CANCEL_MESSAGE = $00040580;
  CdoE_CORRUPT_STORE = $80040600;
  CdoE_NOT_IN_QUEUE = $80040601;
  CdoE_NO_SUPPRESS = $80040602;
  CdoE_COLLISION = $80040604;
  CdoE_NOT_INITIALIZED = $80040605;
  CdoE_NON_STANDARD = $80040606;
  CdoE_NO_RECIPIENTS = $80040607;
  CdoE_SUBMITTED = $80040608;
  CdoE_HAS_FOLDERS = $80040609;
  CdoE_HAS_MESSAGES = $8004060A;
  CdoE_FOLDER_CYCLE = $8004060B;
  CdoW_PARTIAL_COMPLETION = $00040680;
  CdoE_AMBIGUOUS_RECIP = $80040700;

// Constants for enum CdoPropTags
type
  CdoPropTags = TOleEnum;
const
  CdoPR_ACKNOWLEDGEMENT_MODE = $00010003;
  CdoPR_ALTERNATE_RECIPIENT_ALLOWED = $0002000B;
  CdoPR_AUTHORIZING_USERS = $00030102;
  CdoPR_AUTO_FORWARD_COMMENT = $0004001E;
  CdoPR_AUTO_FORWARD_COMMENT_W = $0004001F;
  CdoPR_AUTO_FORWARD_COMMENT_A = $0004001E;
  CdoPR_AUTO_FORWARDED = $0005000B;
  CdoPR_CONTENT_CONFIDENTIALITY_ALGORITHM_ID = $00060102;
  CdoPR_CONTENT_CORRELATOR = $00070102;
  CdoPR_CONTENT_IDENTIFIER = $0008001E;
  CdoPR_CONTENT_IDENTIFIER_W = $0008001F;
  CdoPR_CONTENT_IDENTIFIER_A = $0008001E;
  CdoPR_CONTENT_LENGTH = $00090003;
  CdoPR_CONTENT_RETURN_REQUESTED = $000A000B;
  CdoPR_CONVERSATION_KEY = $000B0102;
  CdoPR_CONVERSION_EITS = $000C0102;
  CdoPR_CONVERSION_WITH_LOSS_PROHIBITED = $000D000B;
  CdoPR_CONVERTED_EITS = $000E0102;
  CdoPR_DEFERRED_DELIVERY_TIME = $000F0040;
  CdoPR_DELIVER_TIME = $00100040;
  CdoPR_DISCARD_REASON = $00110003;
  CdoPR_DISCLOSURE_OF_RECIPIENTS = $0012000B;
  CdoPR_DL_EXPANSION_HISTORY = $00130102;
  CdoPR_DL_EXPANSION_PROHIBITED = $0014000B;
  CdoPR_EXPIRY_TIME = $00150040;
  CdoPR_IMPLICIT_CONVERSION_PROHIBITED = $0016000B;
  CdoPR_IMPORTANCE = $00170003;
  CdoPR_IPM_ID = $00180102;
  CdoPR_LATEST_DELIVERY_TIME = $00190040;
  CdoPR_MESSAGE_CLASS = $001A001E;
  CdoPR_MESSAGE_CLASS_W = $001A001F;
  CdoPR_MESSAGE_CLASS_A = $001A001E;
  CdoPR_MESSAGE_DELIVERY_ID = $001B0102;
  CdoPR_MESSAGE_SECURITY_LABEL = $001E0102;
  CdoPR_OBSOLETED_IPMS = $001F0102;
  CdoPR_ORIGINALLY_INTENDED_RECIPIENT_NAME = $00200102;
  CdoPR_INTERNET_APPROVED = $1030001E;
  CdoPR_INTERNET_APPROVED_A = $1030001E;
  CdoPR_INTERNET_APPROVED_W = $1030001F;
  CdoPR_INTERNET_CONTROL = $1031001E;
  CdoPR_INTERNET_CONTROL_A = $1031001E;
  CdoPR_INTERNET_CONTROL_W = $1031001F;
  CdoPR_INTERNET_DISTRIBUTION = $1032001E;
  CdoPR_INTERNET_DISTRIBUTION_A = $1032001E;
  CdoPR_INTERNET_DISTRIBUTION_W = $1032001F;
  CdoPR_INTERNET_FOLLOWUP_TO = $1033001E;
  CdoPR_INTERNET_FOLLOWUP_TO_A = $1033001E;
  CdoPR_INTERNET_FOLLOWUP_TO_W = $1033001F;
  CdoPR_INTERNET_LINES = $10340003;
  CdoPR_INTERNET_MESSAGE_ID = $1035001E;
  CdoPR_INTERNET_MESSAGE_ID_A = $1035001E;
  CdoPR_INTERNET_MESSAGE_ID_W = $1035001F;
  CdoPR_INTERNET_NEWSGROUPS = $1036001E;
  CdoPR_INTERNET_NEWSGROUPS_A = $1036001E;
  CdoPR_INTERNET_NEWSGROUPS_W = $1036001F;
  CdoPR_INTERNET_ORGANIZATION = $1037001E;
  CdoPR_INTERNET_ORGANIZATION_A = $1037001E;
  CdoPR_INTERNET_ORGANIZATION_W = $1037001F;
  CdoPR_INTERNET_NNTP_PATH = $1038001E;
  CdoPR_INTERNET_NNTP_PATH_A = $1038001E;
  CdoPR_INTERNET_NNTP_PATH_W = $1038001F;
  CdoPR_INTERNET_REFERENCES = $1039001E;
  CdoPR_INTERNET_REFERENCES_A = $1039001E;
  CdoPR_INTERNET_REFERENCES_W = $1039001F;
  CdoPR_SUPERSEDES = $103A001E;
  CdoPR_SUPERSEDES_A = $103A001E;
  CdoPR_SUPERSEDES_W = $103A001F;
  CdoPR_POST_FOLDER_ENTRIES = $103B0102;
  CdoPR_POST_FOLDER_NAMES = $103C001E;
  CdoPR_POST_FOLDER_NAMES_A = $103C001E;
  CdoPR_POST_FOLDER_NAMES_W = $103C001F;
  CdoPR_POST_REPLY_FOLDER_ENTRIES = $103D0102;
  CdoPR_POST_REPLY_FOLDER_NAMES = $103E001E;
  CdoPR_POST_REPLY_FOLDER_NAMES_A = $103E001E;
  CdoPR_POST_REPLY_FOLDER_NAMES_W = $103E001F;
  CdoPR_POST_REPLY_DENIED = $103F0102;
  CdoPR_ORIGINAL_EITS = $00210102;
  CdoPR_ORIGINATOR_CERTIFICATE = $00220102;
  CdoPR_ORIGINATOR_DELIVERY_REPORT_REQUESTED = $0023000B;
  CdoPR_ORIGINATOR_RETURN_ADDRESS = $00240102;
  CdoPR_PARENT_KEY = $00250102;
  CdoPR_PRIORITY = $00260003;
  CdoPR_ORIGIN_CHECK = $00270102;
  CdoPR_PROOF_OF_SUBMISSION_REQUESTED = $0028000B;
  CdoPR_READ_RECEIPT_REQUESTED = $0029000B;
  CdoPR_RECEIPT_TIME = $002A0040;
  CdoPR_RECIPIENT_REASSIGNMENT_PROHIBITED = $002B000B;
  CdoPR_REDIRECTION_HISTORY = $002C0102;
  CdoPR_RELATED_IPMS = $002D0102;
  CdoPR_ORIGINAL_SENSITIVITY = $002E0003;
  CdoPR_LANGUAGES = $002F001E;
  CdoPR_LANGUAGES_W = $002F001F;
  CdoPR_LANGUAGES_A = $002F001E;
  CdoPR_REPLY_TIME = $00300040;
  CdoPR_REPORT_TAG = $00310102;
  CdoPR_REPORT_TIME = $00320040;
  CdoPR_RETURNED_IPM = $0033000B;
  CdoPR_SECURITY = $00340003;
  CdoPR_INCOMPLETE_COPY = $0035000B;
  CdoPR_SENSITIVITY = $00360003;
  CdoPR_SUBJECT = $0037001E;
  CdoPR_SUBJECT_W = $0037001F;
  CdoPR_SUBJECT_A = $0037001E;
  CdoPR_SUBJECT_IPM = $00380102;
  CdoPR_CLIENT_SUBMIT_TIME = $00390040;
  CdoPR_REPORT_NAME = $003A001E;
  CdoPR_REPORT_NAME_W = $003A001F;
  CdoPR_REPORT_NAME_A = $003A001E;
  CdoPR_SENT_REPRESENTING_SEARCH_KEY = $003B0102;
  CdoPR_X400_CONTENT_TYPE = $003C0102;
  CdoPR_SUBJECT_PREFIX = $003D001E;
  CdoPR_SUBJECT_PREFIX_W = $003D001F;
  CdoPR_SUBJECT_PREFIX_A = $003D001E;
  CdoPR_NON_RECEIPT_REASON = $003E0003;
  CdoPR_RECEIVED_BY_ENTRYID = $003F0102;
  CdoPR_RECEIVED_BY_NAME = $0040001E;
  CdoPR_RECEIVED_BY_NAME_W = $0040001F;
  CdoPR_RECEIVED_BY_NAME_A = $0040001E;
  CdoPR_SENT_REPRESENTING_ENTRYID = $00410102;
  CdoPR_SENT_REPRESENTING_NAME = $0042001E;
  CdoPR_SENT_REPRESENTING_NAME_W = $0042001F;
  CdoPR_SENT_REPRESENTING_NAME_A = $0042001E;
  CdoPR_RCVD_REPRESENTING_ENTRYID = $00430102;
  CdoPR_RCVD_REPRESENTING_NAME = $0044001E;
  CdoPR_RCVD_REPRESENTING_NAME_W = $0044001F;
  CdoPR_RCVD_REPRESENTING_NAME_A = $0044001E;
  CdoPR_REPORT_ENTRYID = $00450102;
  CdoPR_READ_RECEIPT_ENTRYID = $00460102;
  CdoPR_MESSAGE_SUBMISSION_ID = $00470102;
  CdoPR_PROVIDER_SUBMIT_TIME = $00480040;
  CdoPR_ORIGINAL_SUBJECT = $0049001E;
  CdoPR_ORIGINAL_SUBJECT_W = $0049001F;
  CdoPR_ORIGINAL_SUBJECT_A = $0049001E;
  CdoPR_DISC_VAL = $004A000B;
  CdoPR_ORIG_MESSAGE_CLASS = $004B001E;
  CdoPR_ORIG_MESSAGE_CLASS_W = $004B001F;
  CdoPR_ORIG_MESSAGE_CLASS_A = $004B001E;
  CdoPR_ORIGINAL_AUTHOR_ENTRYID = $004C0102;
  CdoPR_ORIGINAL_AUTHOR_NAME = $004D001E;
  CdoPR_ORIGINAL_AUTHOR_NAME_W = $004D001F;
  CdoPR_ORIGINAL_AUTHOR_NAME_A = $004D001E;
  CdoPR_ORIGINAL_SUBMIT_TIME = $004E0040;
  CdoPR_REPLY_RECIPIENT_ENTRIES = $004F0102;
  CdoPR_REPLY_RECIPIENT_NAMES = $0050001E;
  CdoPR_REPLY_RECIPIENT_NAMES_W = $0050001F;
  CdoPR_REPLY_RECIPIENT_NAMES_A = $0050001E;
  CdoPR_RECEIVED_BY_SEARCH_KEY = $00510102;
  CdoPR_RCVD_REPRESENTING_SEARCH_KEY = $00520102;
  CdoPR_READ_RECEIPT_SEARCH_KEY = $00530102;
  CdoPR_REPORT_SEARCH_KEY = $00540102;
  CdoPR_ORIGINAL_DELIVERY_TIME = $00550040;
  CdoPR_ORIGINAL_AUTHOR_SEARCH_KEY = $00560102;
  CdoPR_MESSAGE_TO_ME = $0057000B;
  CdoPR_MESSAGE_CC_ME = $0058000B;
  CdoPR_MESSAGE_RECIP_ME = $0059000B;
  CdoPR_ORIGINAL_SENDER_NAME = $005A001E;
  CdoPR_ORIGINAL_SENDER_NAME_W = $005A001F;
  CdoPR_ORIGINAL_SENDER_NAME_A = $005A001E;
  CdoPR_ORIGINAL_SENDER_ENTRYID = $005B0102;
  CdoPR_ORIGINAL_SENDER_SEARCH_KEY = $005C0102;
  CdoPR_ORIGINAL_SENT_REPRESENTING_NAME = $005D001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_NAME_W = $005D001F;
  CdoPR_ORIGINAL_SENT_REPRESENTING_NAME_A = $005D001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_ENTRYID = $005E0102;
  CdoPR_ORIGINAL_SENT_REPRESENTING_SEARCH_KEY = $005F0102;
  CdoPR_START_DATE = $00600040;
  CdoPR_END_DATE = $00610040;
  CdoPR_OWNER_APPT_ID = $00620003;
  CdoPR_RESPONSE_REQUESTED = $0063000B;
  CdoPR_SENT_REPRESENTING_ADDRTYPE = $0064001E;
  CdoPR_SENT_REPRESENTING_ADDRTYPE_W = $0064001F;
  CdoPR_SENT_REPRESENTING_ADDRTYPE_A = $0064001E;
  CdoPR_SENT_REPRESENTING_EMAIL_ADDRESS = $0065001E;
  CdoPR_SENT_REPRESENTING_EMAIL_ADDRESS_W = $0065001F;
  CdoPR_SENT_REPRESENTING_EMAIL_ADDRESS_A = $0065001E;
  CdoPR_ORIGINAL_SENDER_ADDRTYPE = $0066001E;
  CdoPR_ORIGINAL_SENDER_ADDRTYPE_W = $0066001F;
  CdoPR_ORIGINAL_SENDER_ADDRTYPE_A = $0066001E;
  CdoPR_ORIGINAL_SENDER_EMAIL_ADDRESS = $0067001E;
  CdoPR_ORIGINAL_SENDER_EMAIL_ADDRESS_W = $0067001F;
  CdoPR_ORIGINAL_SENDER_EMAIL_ADDRESS_A = $0067001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE = $0068001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_W = $0068001F;
  CdoPR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_A = $0068001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS = $0069001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_W = $0069001E;
  CdoPR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_A = $0069001E;
  CdoPR_CONVERSATION_TOPIC = $0070001E;
  CdoPR_CONVERSATION_TOPIC_W = $0070001F;
  CdoPR_CONVERSATION_TOPIC_A = $0070001E;
  CdoPR_CONVERSATION_INDEX = $00710102;
  CdoPR_ORIGINAL_DISPLAY_BCC = $0072001E;
  CdoPR_ORIGINAL_DISPLAY_BCC_W = $0072001F;
  CdoPR_ORIGINAL_DISPLAY_BCC_A = $0072001E;
  CdoPR_ORIGINAL_DISPLAY_CC = $0073001E;
  CdoPR_ORIGINAL_DISPLAY_CC_W = $0073001F;
  CdoPR_ORIGINAL_DISPLAY_CC_A = $0073001E;
  CdoPR_ORIGINAL_DISPLAY_TO = $0074001E;
  CdoPR_ORIGINAL_DISPLAY_TO_W = $0074001F;
  CdoPR_ORIGINAL_DISPLAY_TO_A = $0074001E;
  CdoPR_RECEIVED_BY_ADDRTYPE = $0075001E;
  CdoPR_RECEIVED_BY_ADDRTYPE_W = $0075001F;
  CdoPR_RECEIVED_BY_ADDRTYPE_A = $0075001E;
  CdoPR_RECEIVED_BY_EMAIL_ADDRESS = $0076001E;
  CdoPR_RECEIVED_BY_EMAIL_ADDRESS_W = $0076001F;
  CdoPR_RECEIVED_BY_EMAIL_ADDRESS_A = $0076001E;
  CdoPR_RCVD_REPRESENTING_ADDRTYPE = $0077001E;
  CdoPR_RCVD_REPRESENTING_ADDRTYPE_W = $0077001F;
  CdoPR_RCVD_REPRESENTING_ADDRTYPE_A = $0077001E;
  CdoPR_RCVD_REPRESENTING_EMAIL_ADDRESS = $0078001E;
  CdoPR_RCVD_REPRESENTING_EMAIL_ADDRESS_W = $0078001F;
  CdoPR_RCVD_REPRESENTING_EMAIL_ADDRESS_A = $0078001E;
  CdoPR_ORIGINAL_AUTHOR_ADDRTYPE = $0079001E;
  CdoPR_ORIGINAL_AUTHOR_ADDRTYPE_W = $0079001F;
  CdoPR_ORIGINAL_AUTHOR_ADDRTYPE_A = $0079001E;
  CdoPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS = $007A001E;
  CdoPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS_W = $007A001F;
  CdoPR_ORIGINAL_AUTHOR_EMAIL_ADDRESS_A = $007A001E;
  CdoPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE = $007B001E;
  CdoPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE_W = $007B001F;
  CdoPR_ORIGINALLY_INTENDED_RECIP_ADDRTYPE_A = $007B001E;
  CdoPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS = $007C001E;
  CdoPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS_W = $007C001F;
  CdoPR_ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS_A = $007C001E;
  CdoPR_TRANSPORT_MESSAGE_HEADERS = $007D001E;
  CdoPR_TRANSPORT_MESSAGE_HEADERS_W = $007D001F;
  CdoPR_TRANSPORT_MESSAGE_HEADERS_A = $007D001E;
  CdoPR_DELEGATION = $007E0102;
  CdoPR_TNEF_CORRELATION_KEY = $007F0102;
  CdoPR_BODY = $1000001E;
  CdoPR_BODY_W = $1000001F;
  CdoPR_BODY_A = $1000001E;
  CdoPR_REPORT_TEXT = $1001001E;
  CdoPR_REPORT_TEXT_W = $1001001F;
  CdoPR_REPORT_TEXT_A = $1001001E;
  CdoPR_ORIGINATOR_AND_DL_EXPANSION_HISTORY = $10020102;
  CdoPR_REPORTING_DL_NAME = $10030102;
  CdoPR_REPORTING_MTA_CERTIFICATE = $10040102;
  CdoPR_RTF_SYNC_BODY_CRC = $10060003;
  CdoPR_RTF_SYNC_BODY_COUNT = $10070003;
  CdoPR_RTF_SYNC_BODY_TAG = $1008001E;
  CdoPR_RTF_SYNC_BODY_TAG_W = $1008001F;
  CdoPR_RTF_SYNC_BODY_TAG_A = $1008001E;
  CdoPR_RTF_COMPRESSED = $10090102;
  CdoPR_RTF_SYNC_PREFIX_COUNT = $10100003;
  CdoPR_RTF_SYNC_TRAILING_COUNT = $10110003;
  CdoPR_ORIGINALLY_INTENDED_RECIP_ENTRYID = $10120102;
  CdoPR_CONTENT_INTEGRITY_CHECK = $0C000102;
  CdoPR_EXPLICIT_CONVERSION = $0C010003;
  CdoPR_IPM_RETURN_REQUESTED = $0C02000B;
  CdoPR_MESSAGE_TOKEN = $0C030102;
  CdoPR_NDR_REASON_CODE = $0C040003;
  CdoPR_NDR_DIAG_CODE = $0C050003;
  CdoPR_NON_RECEIPT_NOTIFICATION_REQUESTED = $0C06000B;
  CdoPR_DELIVERY_POINT = $0C070003;
  CdoPR_ORIGINATOR_NON_DELIVERY_REPORT_REQUESTED = $0C08000B;
  CdoPR_ORIGINATOR_REQUESTED_ALTERNATE_RECIPIENT = $0C090102;
  CdoPR_PHYSICAL_DELIVERY_BUREAU_FAX_DELIVERY = $0C0A000B;
  CdoPR_PHYSICAL_DELIVERY_MODE = $0C0B0003;
  CdoPR_PHYSICAL_DELIVERY_REPORT_REQUEST = $0C0C0003;
  CdoPR_PHYSICAL_FORWARDING_ADDRESS = $0C0D0102;
  CdoPR_PHYSICAL_FORWARDING_ADDRESS_REQUESTED = $0C0E000B;
  CdoPR_PHYSICAL_FORWARDING_PROHIBITED = $0C0F000B;
  CdoPR_PHYSICAL_RENDITION_ATTRIBUTES = $0C100102;
  CdoPR_PROOF_OF_DELIVERY = $0C110102;
  CdoPR_PROOF_OF_DELIVERY_REQUESTED = $0C12000B;
  CdoPR_RECIPIENT_CERTIFICATE = $0C130102;
  CdoPR_RECIPIENT_NUMBER_FOR_ADVICE = $0C14001E;
  CdoPR_RECIPIENT_NUMBER_FOR_ADVICE_W = $0C14001F;
  CdoPR_RECIPIENT_NUMBER_FOR_ADVICE_A = $0C14001E;
  CdoPR_RECIPIENT_TYPE = $0C150003;
  CdoPR_REGISTERED_MAIL_TYPE = $0C160003;
  CdoPR_REPLY_REQUESTED = $0C17000B;
  CdoPR_REQUESTED_DELIVERY_METHOD = $0C180003;
  CdoPR_SENDER_ENTRYID = $0C190102;
  CdoPR_SENDER_NAME = $0C1A001E;
  CdoPR_SENDER_NAME_W = $0C1A001F;
  CdoPR_SENDER_NAME_A = $0C1A001E;
  CdoPR_SUPPLEMENTARY_INFO = $0C1B001E;
  CdoPR_SUPPLEMENTARY_INFO_W = $0C1B001F;
  CdoPR_SUPPLEMENTARY_INFO_A = $0C1B001E;
  CdoPR_TYPE_OF_MTS_USER = $0C1C0003;
  CdoPR_SENDER_SEARCH_KEY = $0C1D0102;
  CdoPR_SENDER_ADDRTYPE = $0C1E001E;
  CdoPR_SENDER_ADDRTYPE_W = $0C1E001F;
  CdoPR_SENDER_ADDRTYPE_A = $0C1E001E;
  CdoPR_SENDER_EMAIL_ADDRESS = $0C1F001E;
  CdoPR_SENDER_EMAIL_ADDRESS_W = $0C1F001F;
  CdoPR_SENDER_EMAIL_ADDRESS_A = $0C1F001E;
  CdoPR_CURRENT_VERSION = $0E000014;
  CdoPR_DELETE_AFTER_SUBMIT = $0E01000B;
  CdoPR_DISPLAY_BCC = $0E02001E;
  CdoPR_DISPLAY_BCC_W = $0E02001F;
  CdoPR_DISPLAY_BCC_A = $0E02001E;
  CdoPR_DISPLAY_CC = $0E03001E;
  CdoPR_DISPLAY_CC_W = $0E03001F;
  CdoPR_DISPLAY_CC_A = $0E03001E;
  CdoPR_DISPLAY_TO = $0E04001E;
  CdoPR_DISPLAY_TO_W = $0E04001F;
  CdoPR_DISPLAY_TO_A = $0E04001E;
  CdoPR_PARENT_DISPLAY = $0E05001E;
  CdoPR_PARENT_DISPLAY_W = $0E05001F;
  CdoPR_PARENT_DISPLAY_A = $0E05001E;
  CdoPR_MESSAGE_DELIVERY_TIME = $0E060040;
  CdoPR_MESSAGE_FLAGS = $0E070003;
  CdoPR_MESSAGE_SIZE = $0E080003;
  CdoPR_PARENT_ENTRYID = $0E090102;
  CdoPR_SENTMAIL_ENTRYID = $0E0A0102;
  CdoPR_CORRELATE = $0E0C000B;
  CdoPR_CORRELATE_MTSID = $0E0D0102;
  CdoPR_DISCRETE_VALUES = $0E0E000B;
  CdoPR_RESPONSIBILITY = $0E0F000B;
  CdoPR_SPOOLER_STATUS = $0E100003;
  CdoPR_TRANSPORT_STATUS = $0E110003;
  CdoPR_MESSAGE_RECIPIENTS = $0E12000D;
  CdoPR_MESSAGE_ATTACHMENTS = $0E13000D;
  CdoPR_SUBMIT_FLAGS = $0E140003;
  CdoPR_RECIPIENT_STATUS = $0E150003;
  CdoPR_TRANSPORT_KEY = $0E160003;
  CdoPR_MSG_STATUS = $0E170003;
  CdoPR_MESSAGE_DOWNLOAD_TIME = $0E180003;
  CdoPR_CREATION_VERSION = $0E190014;
  CdoPR_MODIFY_VERSION = $0E1A0014;
  CdoPR_HASATTACH = $0E1B000B;
  CdoPR_BODY_CRC = $0E1C0003;
  CdoPR_NORMALIZED_SUBJECT = $0E1D001E;
  CdoPR_NORMALIZED_SUBJECT_W = $0E1D001F;
  CdoPR_NORMALIZED_SUBJECT_A = $0E1D001E;
  CdoPR_RTF_IN_SYNC = $0E1F000B;
  CdoPR_ATTACH_SIZE = $0E200003;
  CdoPR_ATTACH_NUM = $0E210003;
  CdoPR_PREPROCESS = $0E22000B;
  CdoPR_INTERNET_ARTICLE_NUMBER = $0E230003;
  CdoPR_NEWSGROUP_NAME = $0E24001E;
  CdoPR_NEWSGROUP_NAME_A = $0E24001E;
  CdoPR_NEWSGROUP_NAME_W = $0E24001F;
  CdoPR_ORIGINATING_MTA_CERTIFICATE = $0E250102;
  CdoPR_PROOF_OF_SUBMISSION = $0E260102;
  CdoPR_ENTRYID = $0FFF0102;
  CdoPR_OBJECT_TYPE = $0FFE0003;
  CdoPR_ICON = $0FFD0102;
  CdoPR_MINI_ICON = $0FFC0102;
  CdoPR_STORE_ENTRYID = $0FFB0102;
  CdoPR_STORE_RECORD_KEY = $0FFA0102;
  CdoPR_RECORD_KEY = $0FF90102;
  CdoPR_MAPPING_SIGNATURE = $0FF80102;
  CdoPR_ACCESS_LEVEL = $0FF70003;
  CdoPR_INSTANCE_KEY = $0FF60102;
  CdoPR_ROW_TYPE = $0FF50003;
  CdoPR_ACCESS = $0FF40003;
  CdoPR_ROWID = $30000003;
  CdoPR_DISPLAY_NAME = $3001001E;
  CdoPR_DISPLAY_NAME_W = $3001001F;
  CdoPR_DISPLAY_NAME_A = $3001001E;
  CdoPR_ADDRTYPE = $3002001E;
  CdoPR_ADDRTYPE_W = $3002001F;
  CdoPR_ADDRTYPE_A = $3002001E;
  CdoPR_EMAIL_ADDRESS = $3003001E;
  CdoPR_EMAIL_ADDRESS_W = $3003001F;
  CdoPR_EMAIL_ADDRESS_A = $3003001E;
  CdoPR_COMMENT = $3004001E;
  CdoPR_COMMENT_W = $3004001F;
  CdoPR_COMMENT_A = $3004001E;
  CdoPR_DEPTH = $30050003;
  CdoPR_PROVIDER_DISPLAY = $3006001E;
  CdoPR_PROVIDER_DISPLAY_W = $3006001F;
  CdoPR_PROVIDER_DISPLAY_A = $3006001E;
  CdoPR_CREATION_TIME = $30070040;
  CdoPR_LAST_MODIFICATION_TIME = $30080040;
  CdoPR_RESOURCE_FLAGS = $30090003;
  CdoPR_PROVIDER_DLL_NAME = $300A001E;
  CdoPR_PROVIDER_DLL_NAME_W = $300A001F;
  CdoPR_PROVIDER_DLL_NAME_A = $300A001E;
  CdoPR_SEARCH_KEY = $300B0102;
  CdoPR_PROVIDER_UID = $300C0102;
  CdoPR_PROVIDER_ORDINAL = $300D0003;
  CdoPR_FORM_VERSION = $3301001E;
  CdoPR_FORM_VERSION_W = $3301001F;
  CdoPR_FORM_VERSION_A = $3301001E;
  CdoPR_FORM_CLSID = $33020048;
  CdoPR_FORM_CONTACT_NAME = $3303001E;
  CdoPR_FORM_CONTACT_NAME_W = $3303001F;
  CdoPR_FORM_CONTACT_NAME_A = $3303001E;
  CdoPR_FORM_CATEGORY = $3304001E;
  CdoPR_FORM_CATEGORY_W = $3304001F;
  CdoPR_FORM_CATEGORY_A = $3304001E;
  CdoPR_FORM_CATEGORY_SUB = $3305001E;
  CdoPR_FORM_CATEGORY_SUB_W = $3305001F;
  CdoPR_FORM_CATEGORY_SUB_A = $3305001E;
  CdoPR_FORM_HOST_MAP = $33061003;
  CdoPR_FORM_HIDDEN = $3307000B;
  CdoPR_FORM_DESIGNER_NAME = $3308001E;
  CdoPR_FORM_DESIGNER_NAME_W = $3308001F;
  CdoPR_FORM_DESIGNER_NAME_A = $3308001E;
  CdoPR_FORM_DESIGNER_GUID = $33090048;
  CdoPR_FORM_MESSAGE_BEHAVIOR = $330A0003;
  CdoPR_DEFAULT_STORE = $3400000B;
  CdoPR_STORE_SUPPORT_MASK = $340D0003;
  CdoPR_STORE_STATE = $340E0003;
  CdoPR_IPM_SUBTREE_SEARCH_KEY = $34100102;
  CdoPR_IPM_OUTBOX_SEARCH_KEY = $34110102;
  CdoPR_IPM_WASTEBASKET_SEARCH_KEY = $34120102;
  CdoPR_IPM_SENTMAIL_SEARCH_KEY = $34130102;
  CdoPR_MDB_PROVIDER = $34140102;
  CdoPR_RECEIVE_FOLDER_SETTINGS = $3415000D;
  CdoPR_VALID_FOLDER_MASK = $35DF0003;
  CdoPR_IPM_SUBTREE_ENTRYID = $35E00102;
  CdoPR_IPM_OUTBOX_ENTRYID = $35E20102;
  CdoPR_IPM_WASTEBASKET_ENTRYID = $35E30102;
  CdoPR_IPM_SENTMAIL_ENTRYID = $35E40102;
  CdoPR_VIEWS_ENTRYID = $35E50102;
  CdoPR_COMMON_VIEWS_ENTRYID = $35E60102;
  CdoPR_FINDER_ENTRYID = $35E70102;
  CdoPR_CONTAINER_FLAGS = $36000003;
  CdoPR_FOLDER_TYPE = $36010003;
  CdoPR_CONTENT_COUNT = $36020003;
  CdoPR_CONTENT_UNREAD = $36030003;
  CdoPR_CREATE_TEMPLATES = $3604000D;
  CdoPR_DETAILS_TABLE = $3605000D;
  CdoPR_SEARCH = $3607000D;
  CdoPR_SELECTABLE = $3609000B;
  CdoPR_SUBFOLDERS = $360A000B;
  CdoPR_STATUS = $360B0003;
  CdoPR_ANR = $360C001E;
  CdoPR_ANR_W = $360C001F;
  CdoPR_ANR_A = $360C001E;
  CdoPR_CONTENTS_SORT_ORDER = $360D1003;
  CdoPR_CONTAINER_HIERARCHY = $360E000D;
  CdoPR_CONTAINER_CONTENTS = $360F000D;
  CdoPR_FOLDER_ASSOCIATED_CONTENTS = $3610000D;
  CdoPR_DEF_CREATE_DL = $36110102;
  CdoPR_DEF_CREATE_MAILUSER = $36120102;
  CdoPR_CONTAINER_CLASS = $3613001E;
  CdoPR_CONTAINER_CLASS_W = $3613001F;
  CdoPR_CONTAINER_CLASS_A = $3613001E;
  CdoPR_CONTAINER_MODIFY_VERSION = $36140014;
  CdoPR_AB_PROVIDER_ID = $36150102;
  CdoPR_DEFAULT_VIEW_ENTRYID = $36160102;
  CdoPR_ASSOC_CONTENT_COUNT = $36170003;
  CdoPR_ATTACHMENT_X400_PARAMETERS = $37000102;
  CdoPR_ATTACH_DATA_OBJ = $3701000D;
  CdoPR_ATTACH_DATA_BIN = $37010102;
  CdoPR_ATTACH_ENCODING = $37020102;
  CdoPR_ATTACH_EXTENSION = $3703001E;
  CdoPR_ATTACH_EXTENSION_W = $3703001F;
  CdoPR_ATTACH_EXTENSION_A = $3703001E;
  CdoPR_ATTACH_FILENAME = $3704001E;
  CdoPR_ATTACH_FILENAME_W = $3704001F;
  CdoPR_ATTACH_FILENAME_A = $3704001E;
  CdoPR_ATTACH_METHOD = $37050003;
  CdoPR_ATTACH_LONG_FILENAME = $3707001E;
  CdoPR_ATTACH_LONG_FILENAME_W = $3707001F;
  CdoPR_ATTACH_LONG_FILENAME_A = $3707001E;
  CdoPR_ATTACH_PATHNAME = $3708001E;
  CdoPR_ATTACH_PATHNAME_W = $3708001F;
  CdoPR_ATTACH_PATHNAME_A = $3708001E;
  CdoPR_ATTACH_RENDERING = $37090102;
  CdoPR_ATTACH_TAG = $370A0102;
  CdoPR_RENDERING_POSITION = $370B0003;
  CdoPR_ATTACH_TRANSPORT_NAME = $370C001E;
  CdoPR_ATTACH_TRANSPORT_NAME_W = $370C001F;
  CdoPR_ATTACH_TRANSPORT_NAME_A = $370C001E;
  CdoPR_ATTACH_LONG_PATHNAME = $370D001E;
  CdoPR_ATTACH_LONG_PATHNAME_W = $370D001F;
  CdoPR_ATTACH_LONG_PATHNAME_A = $370D001E;
  CdoPR_ATTACH_MIME_TAG = $370E001E;
  CdoPR_ATTACH_MIME_TAG_W = $370E001F;
  CdoPR_ATTACH_MIME_TAG_A = $370E001E;
  CdoPR_ATTACH_ADDITIONAL_INFO = $370F0102;
  CdoPR_DISPLAY_TYPE = $39000003;
  CdoPR_TEMPLATEID = $39020102;
  CdoPR_PRIMARY_CAPABILITY = $39040102;
  CdoPR_7BIT_DISPLAY_NAME = $39FF001E;
  CdoPR_ACCOUNT = $3A00001E;
  CdoPR_ACCOUNT_W = $3A00001F;
  CdoPR_ACCOUNT_A = $3A00001E;
  CdoPR_ALTERNATE_RECIPIENT = $3A010102;
  CdoPR_CALLBACK_TELEPHONE_NUMBER = $3A02001E;
  CdoPR_CALLBACK_TELEPHONE_NUMBER_W = $3A02001F;
  CdoPR_CALLBACK_TELEPHONE_NUMBER_A = $3A02001E;
  CdoPR_CONVERSION_PROHIBITED = $3A03000B;
  CdoPR_DISCLOSE_RECIPIENTS = $3A04000B;
  CdoPR_GENERATION = $3A05001E;
  CdoPR_GENERATION_W = $3A05001F;
  CdoPR_GENERATION_A = $3A05001E;
  CdoPR_GIVEN_NAME = $3A06001E;
  CdoPR_GIVEN_NAME_W = $3A06001F;
  CdoPR_GIVEN_NAME_A = $3A06001E;
  CdoPR_GOVERNMENT_ID_NUMBER = $3A07001E;
  CdoPR_GOVERNMENT_ID_NUMBER_W = $3A07001F;
  CdoPR_GOVERNMENT_ID_NUMBER_A = $3A07001E;
  CdoPR_BUSINESS_TELEPHONE_NUMBER = $3A08001E;
  CdoPR_BUSINESS_TELEPHONE_NUMBER_W = $3A08001F;
  CdoPR_BUSINESS_TELEPHONE_NUMBER_A = $3A08001E;
  CdoPR_OFFICE_TELEPHONE_NUMBER = $3A08001E;
  CdoPR_OFFICE_TELEPHONE_NUMBER_W = $3A08001F;
  CdoPR_OFFICE_TELEPHONE_NUMBER_A = $3A08001E;
  CdoPR_HOME_TELEPHONE_NUMBER = $3A09001E;
  CdoPR_HOME_TELEPHONE_NUMBER_W = $3A09001F;
  CdoPR_HOME_TELEPHONE_NUMBER_A = $3A09001E;
  CdoPR_INITIALS = $3A0A001E;
  CdoPR_INITIALS_W = $3A0A001F;
  CdoPR_INITIALS_A = $3A0A001E;
  CdoPR_KEYWORD = $3A0B001E;
  CdoPR_KEYWORD_W = $3A0B001F;
  CdoPR_KEYWORD_A = $3A0B001E;
  CdoPR_LANGUAGE = $3A0C001E;
  CdoPR_LANGUAGE_W = $3A0C001F;
  CdoPR_LANGUAGE_A = $3A0C001E;
  CdoPR_LOCATION = $3A0D001E;
  CdoPR_LOCATION_W = $3A0D001F;
  CdoPR_LOCATION_A = $3A0D001E;
  CdoPR_MAIL_PERMISSION = $3A0E000B;
  CdoPR_MHS_COMMON_NAME = $3A0F001E;
  CdoPR_MHS_COMMON_NAME_W = $3A0F001F;
  CdoPR_MHS_COMMON_NAME_A = $3A0F001E;
  CdoPR_ORGANIZATIONAL_ID_NUMBER = $3A10001E;
  CdoPR_ORGANIZATIONAL_ID_NUMBER_W = $3A10001F;
  CdoPR_ORGANIZATIONAL_ID_NUMBER_A = $3A10001E;
  CdoPR_SURNAME = $3A11001E;
  CdoPR_SURNAME_W = $3A11001F;
  CdoPR_SURNAME_A = $3A11001E;
  CdoPR_ORIGINAL_ENTRYID = $3A120102;
  CdoPR_ORIGINAL_DISPLAY_NAME = $3A13001E;
  CdoPR_ORIGINAL_DISPLAY_NAME_W = $3A13001F;
  CdoPR_ORIGINAL_DISPLAY_NAME_A = $3A13001E;
  CdoPR_ORIGINAL_SEARCH_KEY = $3A140102;
  CdoPR_POSTAL_ADDRESS = $3A15001E;
  CdoPR_POSTAL_ADDRESS_W = $3A15001F;
  CdoPR_POSTAL_ADDRESS_A = $3A15001E;
  CdoPR_COMPANY_NAME = $3A16001E;
  CdoPR_COMPANY_NAME_W = $3A16001F;
  CdoPR_COMPANY_NAME_A = $3A16001E;
  CdoPR_TITLE = $3A17001E;
  CdoPR_TITLE_W = $3A17001F;
  CdoPR_TITLE_A = $3A17001E;
  CdoPR_DEPARTMENT_NAME = $3A18001E;
  CdoPR_DEPARTMENT_NAME_W = $3A18001F;
  CdoPR_DEPARTMENT_NAME_A = $3A18001E;
  CdoPR_OFFICE_LOCATION = $3A19001E;
  CdoPR_OFFICE_LOCATION_W = $3A19001F;
  CdoPR_OFFICE_LOCATION_A = $3A19001E;
  CdoPR_PRIMARY_TELEPHONE_NUMBER = $3A1A001E;
  CdoPR_PRIMARY_TELEPHONE_NUMBER_W = $3A1A001F;
  CdoPR_PRIMARY_TELEPHONE_NUMBER_A = $3A1A001E;
  CdoPR_BUSINESS2_TELEPHONE_NUMBER = $3A1B001E;
  CdoPR_BUSINESS2_TELEPHONE_NUMBER_W = $3A1B001F;
  CdoPR_BUSINESS2_TELEPHONE_NUMBER_A = $3A1B001E;
  CdoPR_OFFICE2_TELEPHONE_NUMBER = $3A1B001E;
  CdoPR_OFFICE2_TELEPHONE_NUMBER_W = $3A1B001F;
  CdoPR_OFFICE2_TELEPHONE_NUMBER_A = $3A1B001E;
  CdoPR_MOBILE_TELEPHONE_NUMBER = $3A1C001E;
  CdoPR_MOBILE_TELEPHONE_NUMBER_W = $3A1C001F;
  CdoPR_MOBILE_TELEPHONE_NUMBER_A = $3A1C001E;
  CdoPR_CELLULAR_TELEPHONE_NUMBER = $3A1C001E;
  CdoPR_CELLULAR_TELEPHONE_NUMBER_W = $3A1C001F;
  CdoPR_CELLULAR_TELEPHONE_NUMBER_A = $3A1C001E;
  CdoPR_RADIO_TELEPHONE_NUMBER = $3A1D001E;
  CdoPR_RADIO_TELEPHONE_NUMBER_W = $3A1D001F;
  CdoPR_RADIO_TELEPHONE_NUMBER_A = $3A1D001E;
  CdoPR_CAR_TELEPHONE_NUMBER = $3A1E001E;
  CdoPR_CAR_TELEPHONE_NUMBER_W = $3A1E001F;
  CdoPR_CAR_TELEPHONE_NUMBER_A = $3A1E001E;
  CdoPR_OTHER_TELEPHONE_NUMBER = $3A1F001E;
  CdoPR_OTHER_TELEPHONE_NUMBER_W = $3A1F001F;
  CdoPR_OTHER_TELEPHONE_NUMBER_A = $3A1F001E;
  CdoPR_TRANSMITABLE_DISPLAY_NAME = $3A20001E;
  CdoPR_TRANSMITABLE_DISPLAY_NAME_W = $3A20001F;
  CdoPR_TRANSMITABLE_DISPLAY_NAME_A = $3A20001E;
  CdoPR_PAGER_TELEPHONE_NUMBER = $3A21001E;
  CdoPR_PAGER_TELEPHONE_NUMBER_W = $3A21001F;
  CdoPR_PAGER_TELEPHONE_NUMBER_A = $3A21001E;
  CdoPR_BEEPER_TELEPHONE_NUMBER = $3A21001E;
  CdoPR_BEEPER_TELEPHONE_NUMBER_W = $3A21001F;
  CdoPR_BEEPER_TELEPHONE_NUMBER_A = $3A21001E;
  CdoPR_USER_CERTIFICATE = $3A220102;
  CdoPR_PRIMARY_FAX_NUMBER = $3A23001E;
  CdoPR_PRIMARY_FAX_NUMBER_W = $3A23001F;
  CdoPR_PRIMARY_FAX_NUMBER_A = $3A23001E;
  CdoPR_BUSINESS_FAX_NUMBER = $3A24001E;
  CdoPR_BUSINESS_FAX_NUMBER_W = $3A24001F;
  CdoPR_BUSINESS_FAX_NUMBER_A = $3A24001E;
  CdoPR_HOME_FAX_NUMBER = $3A25001E;
  CdoPR_HOME_FAX_NUMBER_W = $3A25001F;
  CdoPR_HOME_FAX_NUMBER_A = $3A25001E;
  CdoPR_COUNTRY = $3A26001E;
  CdoPR_COUNTRY_W = $3A26001F;
  CdoPR_COUNTRY_A = $3A26001E;
  CdoPR_BUSINESS_ADDRESS_COUNTRY = $3A26001E;
  CdoPR_BUSINESS_ADDRESS_COUNTRY_W = $3A26001F;
  CdoPR_BUSINESS_ADDRESS_COUNTRY_A = $3A26001E;
  CdoPR_LOCALITY = $3A27001E;
  CdoPR_LOCALITY_W = $3A27001F;
  CdoPR_LOCALITY_A = $3A27001E;
  CdoPR_BUSINESS_ADDRESS_CITY = $3A27001E;
  CdoPR_BUSINESS_ADDRESS_CITY_W = $3A27001F;
  CdoPR_BUSINESS_ADDRESS_CITY_A = $3A27001E;
  CdoPR_STATE_OR_PROVINCE = $3A28001E;
  CdoPR_STATE_OR_PROVINCE_W = $3A28001F;
  CdoPR_STATE_OR_PROVINCE_A = $3A28001E;
  CdoPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE = $3A28001E;
  CdoPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_W = $3A28001F;
  CdoPR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_A = $3A28001E;
  CdoPR_STREET_ADDRESS = $3A29001E;
  CdoPR_STREET_ADDRESS_W = $3A29001F;
  CdoPR_STREET_ADDRESS_A = $3A29001E;
  CdoPR_BUSINESS_ADDRESS_STREET = $3A29001E;
  CdoPR_BUSINESS_ADDRESS_STREET_W = $3A29001F;
  CdoPR_BUSINESS_ADDRESS_STREET_A = $3A29001E;
  CdoPR_POSTAL_CODE = $3A2A001E;
  CdoPR_POSTAL_CODE_W = $3A2A001F;
  CdoPR_POSTAL_CODE_A = $3A2A001E;
  CdoPR_BUSINESS_ADDRESS_POSTAL_CODE = $3A2A001E;
  CdoPR_BUSINESS_ADDRESS_POSTAL_CODE_W = $3A2A001F;
  CdoPR_BUSINESS_ADDRESS_POSTAL_CODE_A = $3A2A001E;
  CdoPR_POST_OFFICE_BOX = $3A2B001E;
  CdoPR_POST_OFFICE_BOX_W = $3A2B001F;
  CdoPR_POST_OFFICE_BOX_A = $3A2B001E;
  CdoPR_BUSINESS_ADDRESS_POST_OFFICE_BOX = $3A2B001E;
  CdoPR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W = $3A2B001F;
  CdoPR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A = $3A2B001E;
  CdoPR_TELEX_NUMBER = $3A2C001E;
  CdoPR_TELEX_NUMBER_W = $3A2C001F;
  CdoPR_TELEX_NUMBER_A = $3A2C001E;
  CdoPR_ISDN_NUMBER = $3A2D001E;
  CdoPR_ISDN_NUMBER_W = $3A2D001F;
  CdoPR_ISDN_NUMBER_A = $3A2D001E;
  CdoPR_ASSISTANT_TELEPHONE_NUMBER = $3A2E001E;
  CdoPR_ASSISTANT_TELEPHONE_NUMBER_W = $3A2E001F;
  CdoPR_ASSISTANT_TELEPHONE_NUMBER_A = $3A2E001E;
  CdoPR_HOME2_TELEPHONE_NUMBER = $3A2F001E;
  CdoPR_HOME2_TELEPHONE_NUMBER_W = $3A2F001F;
  CdoPR_HOME2_TELEPHONE_NUMBER_A = $3A2F001E;
  CdoPR_ASSISTANT = $3A30001E;
  CdoPR_ASSISTANT_W = $3A30001F;
  CdoPR_ASSISTANT_A = $3A30001E;
  CdoPR_SEND_RICH_INFO = $3A40000B;
  CdoPR_WEDDING_ANNIVERSARY = $3A410040;
  CdoPR_BIRTHDAY = $3A420040;
  CdoPR_HOBBIES = $3A43001E;
  CdoPR_HOBBIES_W = $3A43001F;
  CdoPR_HOBBIES_A = $3A43001E;
  CdoPR_MIDDLE_NAME = $3A44001E;
  CdoPR_MIDDLE_NAME_W = $3A44001F;
  CdoPR_MIDDLE_NAME_A = $3A44001E;
  CdoPR_DISPLAY_NAME_PREFIX = $3A45001E;
  CdoPR_DISPLAY_NAME_PREFIX_W = $3A45001F;
  CdoPR_DISPLAY_NAME_PREFIX_A = $3A45001E;
  CdoPR_PROFESSION = $3A46001E;
  CdoPR_PROFESSION_W = $3A46001F;
  CdoPR_PROFESSION_A = $3A46001E;
  CdoPR_PREFERRED_BY_NAME = $3A47001E;
  CdoPR_PREFERRED_BY_NAME_W = $3A47001F;
  CdoPR_PREFERRED_BY_NAME_A = $3A47001E;
  CdoPR_SPOUSE_NAME = $3A48001E;
  CdoPR_SPOUSE_NAME_W = $3A48001F;
  CdoPR_SPOUSE_NAME_A = $3A48001E;
  CdoPR_COMPUTER_NETWORK_NAME = $3A49001E;
  CdoPR_COMPUTER_NETWORK_NAME_W = $3A49001F;
  CdoPR_COMPUTER_NETWORK_NAME_A = $3A49001E;
  CdoPR_CUSTOMER_ID = $3A4A001E;
  CdoPR_CUSTOMER_ID_W = $3A4A001F;
  CdoPR_CUSTOMER_ID_A = $3A4A001E;
  CdoPR_TTYTDD_PHONE_NUMBER = $3A4B001E;
  CdoPR_TTYTDD_PHONE_NUMBER_W = $3A4B001F;
  CdoPR_TTYTDD_PHONE_NUMBER_A = $3A4B001E;
  CdoPR_FTP_SITE = $3A4C001E;
  CdoPR_FTP_SITE_W = $3A4C001F;
  CdoPR_FTP_SITE_A = $3A4C001E;
  CdoPR_GENDER = $3A4D0002;
  CdoPR_MANAGER_NAME = $3A4E001E;
  CdoPR_MANAGER_NAME_W = $3A4E001F;
  CdoPR_MANAGER_NAME_A = $3A4E001E;
  CdoPR_NICKNAME = $3A4F001E;
  CdoPR_NICKNAME_W = $3A4F001F;
  CdoPR_NICKNAME_A = $3A4F001E;
  CdoPR_PERSONAL_HOME_PAGE = $3A50001E;
  CdoPR_PERSONAL_HOME_PAGE_W = $3A50001F;
  CdoPR_PERSONAL_HOME_PAGE_A = $3A50001E;
  CdoPR_BUSINESS_HOME_PAGE = $3A51001E;
  CdoPR_BUSINESS_HOME_PAGE_W = $3A51001F;
  CdoPR_BUSINESS_HOME_PAGE_A = $3A51001E;
  CdoPR_CONTACT_VERSION = $3A520048;
  CdoPR_CONTACT_ENTRYIDS = $3A531102;
  CdoPR_CONTACT_ADDRTYPES = $3A54101E;
  CdoPR_CONTACT_ADDRTYPES_W = $3A54101F;
  CdoPR_CONTACT_ADDRTYPES_A = $3A54101E;
  CdoPR_CONTACT_DEFAULT_ADDRESS_INDEX = $3A550003;
  CdoPR_CONTACT_EMAIL_ADDRESSES = $3A56101E;
  CdoPR_CONTACT_EMAIL_ADDRESSES_W = $3A56101F;
  CdoPR_CONTACT_EMAIL_ADDRESSES_A = $3A56101E;
  CdoPR_COMPANY_MAIN_PHONE_NUMBER = $3A57001E;
  CdoPR_COMPANY_MAIN_PHONE_NUMBER_W = $3A57001F;
  CdoPR_COMPANY_MAIN_PHONE_NUMBER_A = $3A57001E;
  CdoPR_CHILDRENS_NAMES = $3A58101E;
  CdoPR_CHILDRENS_NAMES_W = $3A58101F;
  CdoPR_CHILDRENS_NAMES_A = $3A58101E;
  CdoPR_HOME_ADDRESS_CITY = $3A59001E;
  CdoPR_HOME_ADDRESS_CITY_W = $3A59001F;
  CdoPR_HOME_ADDRESS_CITY_A = $3A59001E;
  CdoPR_HOME_ADDRESS_COUNTRY = $3A5A001E;
  CdoPR_HOME_ADDRESS_COUNTRY_W = $3A5A001F;
  CdoPR_HOME_ADDRESS_COUNTRY_A = $3A5A001E;
  CdoPR_HOME_ADDRESS_POSTAL_CODE = $3A5B001E;
  CdoPR_HOME_ADDRESS_POSTAL_CODE_W = $3A5B001F;
  CdoPR_HOME_ADDRESS_POSTAL_CODE_A = $3A5B001E;
  CdoPR_HOME_ADDRESS_STATE_OR_PROVINCE = $3A5C001E;
  CdoPR_HOME_ADDRESS_STATE_OR_PROVINCE_W = $3A5C001F;
  CdoPR_HOME_ADDRESS_STATE_OR_PROVINCE_A = $3A5C001E;
  CdoPR_HOME_ADDRESS_STREET = $3A5D001E;
  CdoPR_HOME_ADDRESS_STREET_W = $3A5D001F;
  CdoPR_HOME_ADDRESS_STREET_A = $3A5D001E;
  CdoPR_HOME_ADDRESS_POST_OFFICE_BOX = $3A5E001E;
  CdoPR_HOME_ADDRESS_POST_OFFICE_BOX_W = $3A5E001F;
  CdoPR_HOME_ADDRESS_POST_OFFICE_BOX_A = $3A5E001E;
  CdoPR_OTHER_ADDRESS_CITY = $3A5F001E;
  CdoPR_OTHER_ADDRESS_CITY_W = $3A5F001F;
  CdoPR_OTHER_ADDRESS_CITY_A = $3A5F001E;
  CdoPR_OTHER_ADDRESS_COUNTRY = $3A60001E;
  CdoPR_OTHER_ADDRESS_COUNTRY_W = $3A60001F;
  CdoPR_OTHER_ADDRESS_COUNTRY_A = $3A60001E;
  CdoPR_OTHER_ADDRESS_POSTAL_CODE = $3A61001E;
  CdoPR_OTHER_ADDRESS_POSTAL_CODE_W = $3A61001F;
  CdoPR_OTHER_ADDRESS_POSTAL_CODE_A = $3A61001E;
  CdoPR_OTHER_ADDRESS_STATE_OR_PROVINCE = $3A62001E;
  CdoPR_OTHER_ADDRESS_STATE_OR_PROVINCE_W = $3A62001F;
  CdoPR_OTHER_ADDRESS_STATE_OR_PROVINCE_A = $3A62001E;
  CdoPR_OTHER_ADDRESS_STREET = $3A63001E;
  CdoPR_OTHER_ADDRESS_STREET_W = $3A63001F;
  CdoPR_OTHER_ADDRESS_STREET_A = $3A63001E;
  CdoPR_OTHER_ADDRESS_POST_OFFICE_BOX = $3A64001E;
  CdoPR_OTHER_ADDRESS_POST_OFFICE_BOX_W = $3A64001F;
  CdoPR_OTHER_ADDRESS_POST_OFFICE_BOX_A = $3A64001E;
  CdoPR_USER_X509_CERTIFICATE = $3A701102;
  CdoPR_STORE_PROVIDERS = $3D000102;
  CdoPR_AB_PROVIDERS = $3D010102;
  CdoPR_TRANSPORT_PROVIDERS = $3D020102;
  CdoPR_DEFAULT_PROFILE = $3D04000B;
  CdoPR_AB_SEARCH_PATH = $3D051102;
  CdoPR_AB_DEFAULT_DIR = $3D060102;
  CdoPR_AB_DEFAULT_PAB = $3D070102;
  CdoPR_FILTERING_HOOKS = $3D080102;
  CdoPR_SERVICE_NAME = $3D09001E;
  CdoPR_SERVICE_NAME_W = $3D09001F;
  CdoPR_SERVICE_NAME_A = $3D09001E;
  CdoPR_SERVICE_DLL_NAME = $3D0A001E;
  CdoPR_SERVICE_DLL_NAME_W = $3D0A001F;
  CdoPR_SERVICE_DLL_NAME_A = $3D0A001E;
  CdoPR_SERVICE_ENTRY_NAME = $3D0B001E;
  CdoPR_SERVICE_UID = $3D0C0102;
  CdoPR_SERVICE_EXTRA_UIDS = $3D0D0102;
  CdoPR_SERVICES = $3D0E0102;
  CdoPR_SERVICE_SUPPORT_FILES = $3D0F101E;
  CdoPR_SERVICE_SUPPORT_FILES_W = $3D0F101F;
  CdoPR_SERVICE_SUPPORT_FILES_A = $3D0F101E;
  CdoPR_SERVICE_DELETE_FILES = $3D10101E;
  CdoPR_SERVICE_DELETE_FILES_W = $3D10101F;
  CdoPR_SERVICE_DELETE_FILES_A = $3D10101E;
  CdoPR_AB_SEARCH_PATH_UPDATE = $3D110102;
  CdoPR_PROFILE_NAME = $3D12001E;
  CdoPR_PROFILE_NAME_A = $3D12001E;
  CdoPR_PROFILE_NAME_W = $3D12001F;
  CdoPR_IDENTITY_DISPLAY = $3E00001E;
  CdoPR_IDENTITY_DISPLAY_W = $3E00001F;
  CdoPR_IDENTITY_DISPLAY_A = $3E00001E;
  CdoPR_IDENTITY_ENTRYID = $3E010102;
  CdoPR_RESOURCE_METHODS = $3E020003;
  CdoPR_RESOURCE_TYPE = $3E030003;
  CdoPR_STATUS_CODE = $3E040003;
  CdoPR_IDENTITY_SEARCH_KEY = $3E050102;
  CdoPR_OWN_STORE_ENTRYID = $3E060102;
  CdoPR_RESOURCE_PATH = $3E07001E;
  CdoPR_RESOURCE_PATH_W = $3E07001F;
  CdoPR_RESOURCE_PATH_A = $3E07001E;
  CdoPR_STATUS_STRING = $3E08001E;
  CdoPR_STATUS_STRING_W = $3E08001F;
  CdoPR_STATUS_STRING_A = $3E08001E;
  CdoPR_X400_DEFERRED_DELIVERY_CANCEL = $3E09000B;
  CdoPR_HEADER_FOLDER_ENTRYID = $3E0A0102;
  CdoPR_REMOTE_PROGRESS = $3E0B0003;
  CdoPR_REMOTE_PROGRESS_TEXT = $3E0C001E;
  CdoPR_REMOTE_PROGRESS_TEXT_W = $3E0C001F;
  CdoPR_REMOTE_PROGRESS_TEXT_A = $3E0C001E;
  CdoPR_REMOTE_VALIDATE_OK = $3E0D000B;
  CdoPR_CONTROL_FLAGS = $3F000003;
  CdoPR_CONTROL_STRUCTURE = $3F010102;
  CdoPR_CONTROL_TYPE = $3F020003;
  CdoPR_DELTAX = $3F030003;
  CdoPR_DELTAY = $3F040003;
  CdoPR_XPOS = $3F050003;
  CdoPR_YPOS = $3F060003;
  CdoPR_CONTROL_ID = $3F070102;
  CdoPR_INITIAL_DETAILS_PANE = $3F080003;
  CdoPR_NNTP_XREF = $1040001E;
  CdoPR_NNTP_XREF_W = $1040001F;
  CdoPR_NNTP_XREF_A = $1040001E;
  CdoPR_INTERNET_PRECEDENCE = $1041001E;
  CdoPR_INTERNET_PRECEDENCE_W = $1041001F;
  CdoPR_INTERNET_PRECEDENCE_A = $1041001E;
  CdoPR_REFERRED_BY_NAME = $3A47001E;
  CdoPR_REFERRED_BY_NAME_W = $3A47001F;
  CdoPR_REFERRED_BY_NAME_A = $3A47001E;
  CdoPR_SEND_INTERNET_ENCODING = $3A710003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _Session = dispinterface;
  InfoStores = dispinterface;
  InfoStore = dispinterface;
  AddressLists = dispinterface;
  AddressList = dispinterface;
  AddressEntries = dispinterface;
  Folder = dispinterface;
  Folders = dispinterface;
  Messages = dispinterface;
  Message = dispinterface;
  Fields = dispinterface;
  Field = dispinterface;
  Recipients = dispinterface;
  Recipient = dispinterface;
  Attachments = dispinterface;
  Attachment = dispinterface;
  AddressEntry = dispinterface;
  AddressEntryFilter = dispinterface;
  MessageFilter = dispinterface;
  GroupHeader = dispinterface;
  AppointmentItem = dispinterface;
  MeetingItem = dispinterface;
  RecurrencePattern = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Session = _Session;


// *********************************************************************//
// DispIntf:  _Session
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEA8-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  _Session = dispinterface
    ['{3FA7DEA8-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property Version: OleVariant readonly dispid 44;
    property OperatingSystem: OleVariant readonly dispid 24;
    property Name: OleVariant readonly dispid 23;
    property CurrentUser: OleVariant readonly dispid 1;
    property Inbox: OleVariant readonly dispid 15;
    property Outbox: OleVariant readonly dispid 16;
    property InfoStores: OleVariant readonly dispid 57;
    property AddressLists: OleVariant readonly dispid 4;
    property OutOfOffice: OleVariant dispid 82;
    property OutOfOfficeText: OleVariant dispid 83;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant; 
                   NewSession: OleVariant; ParentWindow: OleVariant; NoMail: OleVariant; 
                   ProfileInfo: OleVariant): OleVariant; dispid 119;
    function Logoff: OleVariant; dispid 118;
    function GetInfoStore(StoreID: OleVariant): OleVariant; dispid 122;
    function GetFolder(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 116;
    function GetMessage(MessageID: OleVariant; StoreID: OleVariant): OleVariant; dispid 117;
    function GetArticle(ArticleID: OleVariant; FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 158;
    function GetAddressEntry(EntryID: OleVariant): OleVariant; dispid 114;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant; ToLabel: OleVariant; 
                         CcLabel: OleVariant; BccLabel: OleVariant; ParentWindow: OleVariant): OleVariant; dispid 101;
    function DeliverNow: OleVariant; dispid 108;
    function CompareIDs(ID1: OleVariant; ID2: OleVariant): OleVariant; dispid 137;
    function CreateConversationIndex(ParentIndex: OleVariant): OleVariant; dispid 146;
    function SetLocaleIDs(LocaleID: OleVariant; CodePageID: OleVariant): OleVariant; dispid 145;
    function GetDefaultFolder(ObjectType: OleVariant): OleVariant; dispid 153;
    function GetAddressList(ObjectType: OleVariant): OleVariant; dispid 155;
    function GetOption(OptType: OleVariant): OleVariant; dispid 156;
    function SetOption(OptType: OleVariant; OptValue: OleVariant): OleVariant; dispid 157;
  end;

// *********************************************************************//
// DispIntf:  InfoStores
// Flags:     (4096) Dispatchable
// GUID:      {0C448A60-68DC-101B-ACC1-00AA00423326}
// *********************************************************************//
  InfoStores = dispinterface
    ['{0C448A60-68DC-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Count: OleVariant readonly dispid 9;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
  end;

// *********************************************************************//
// DispIntf:  InfoStore
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAC-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  InfoStore = dispinterface
    ['{3FA7DEAC-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property Index: OleVariant readonly dispid 19;
    property Name: OleVariant readonly dispid 23;
    property ID: OleVariant readonly dispid 14;
    property ProviderName: OleVariant readonly dispid 58;
    property RootFolder: OleVariant readonly dispid 59;
    property Fields: OleVariant readonly dispid 12;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function ExcludeRTFProps: OleVariant; dispid 159;
  end;

// *********************************************************************//
// DispIntf:  AddressLists
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEB2-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  AddressLists = dispinterface
    ['{3FA7DEB2-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Count: OleVariant readonly dispid 9;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
  end;

// *********************************************************************//
// DispIntf:  AddressList
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAF-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  AddressList = dispinterface
    ['{3FA7DEAF-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property AddressEntries: OleVariant readonly dispid 3;
    property ID: OleVariant readonly dispid 14;
    property Index: OleVariant readonly dispid 19;
    property Name: OleVariant readonly dispid 23;
    property IsReadOnly: OleVariant readonly dispid 60;
    property Fields: OleVariant readonly dispid 12;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
  end;

// *********************************************************************//
// DispIntf:  AddressEntries
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEB1-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  AddressEntries = dispinterface
    ['{3FA7DEB1-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property RawTable: OleVariant dispid 80;
    property Count: OleVariant readonly dispid 9;
    property Filter: OleVariant dispid 61;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
    function Delete: OleVariant; dispid 106;
    function Add(Emailtype: OleVariant; Name: OleVariant; Address: OleVariant): OleVariant; dispid 100;
    function GetFirst: OleVariant; dispid 109;
    function GetNext: OleVariant; dispid 111;
    function GetLast: OleVariant; dispid 110;
    function GetPrevious: OleVariant; dispid 112;
    function Sort(SortOrder: OleVariant; PropID: OleVariant): OleVariant; dispid 134;
  end;

// *********************************************************************//
// DispIntf:  Folder
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEA9-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  Folder = dispinterface
    ['{3FA7DEA9-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property Name: OleVariant dispid 23;
    property ID: OleVariant readonly dispid 14;
    property FolderID: OleVariant readonly dispid 51;
    property StoreID: OleVariant readonly dispid 52;
    property Folders: OleVariant readonly dispid 13;
    property Messages: OleVariant readonly dispid 22;
    property Fields: OleVariant readonly dispid 12;
    property HiddenMessages: OleVariant readonly dispid 327;
    function Update(MakePermanent: OleVariant; RefreshObject: OleVariant): OleVariant; dispid 132;
    function CopyTo(FolderID: OleVariant; StoreID: OleVariant; Name: OleVariant; 
                    CopySubfolders: OleVariant): OleVariant; dispid 104;
    function MoveTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 120;
    function Delete(DeletedItems: OleVariant): OleVariant; dispid 106;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
  end;

// *********************************************************************//
// DispIntf:  Folders
// Flags:     (4096) Dispatchable
// GUID:      {07A782A0-68DC-101B-ACC1-00AA00423326}
// *********************************************************************//
  Folders = dispinterface
    ['{07A782A0-68DC-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property RawTable: OleVariant dispid 80;
    property Count: OleVariant readonly dispid 9;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
    function GetFirst: OleVariant; dispid 109;
    function GetNext: OleVariant; dispid 111;
    function GetLast: OleVariant; dispid 110;
    function GetPrevious: OleVariant; dispid 112;
    function Add(Name: OleVariant): OleVariant; dispid 100;
    function Delete: OleVariant; dispid 106;
    function Sort(SortOrder: OleVariant; PropID: OleVariant): OleVariant; dispid 134;
  end;

// *********************************************************************//
// DispIntf:  Messages
// Flags:     (4096) Dispatchable
// GUID:      {10EAB9E0-68DC-101B-ACC1-00AA00423326}
// *********************************************************************//
  Messages = dispinterface
    ['{10EAB9E0-68DC-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property RawTable: OleVariant dispid 80;
    property Count: OleVariant readonly dispid 9;
    property Filter: OleVariant dispid 61;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
    function Add(Subject: OleVariant; Text: OleVariant; Type_: OleVariant; Importance: OleVariant): OleVariant; dispid 100;
    function Delete: OleVariant; dispid 106;
    function Sort(SortOrder: OleVariant; PropID: OleVariant): OleVariant; dispid 134;
    function GetFirst(Filter: OleVariant): OleVariant; dispid 109;
    function GetNext: OleVariant; dispid 111;
    function GetLast(Filter: OleVariant): OleVariant; dispid 110;
    function GetPrevious: OleVariant; dispid 112;
  end;

// *********************************************************************//
// DispIntf:  Message
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAA-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  Message = dispinterface
    ['{3FA7DEAA-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property FolderID: OleVariant readonly dispid 51;
    property StoreID: OleVariant readonly dispid 52;
    property ID: OleVariant readonly dispid 14;
    property type_: OleVariant dispid 17;
    property Size: OleVariant readonly dispid 36;
    property Importance: OleVariant dispid 27;
    property Subject: OleVariant dispid 38;
    property Sender: OleVariant dispid 32;
    property TimeSent: OleVariant dispid 41;
    property TimeReceived: OleVariant dispid 40;
    property Text: OleVariant dispid 39;
    property Sent: OleVariant dispid 33;
    property Submitted: OleVariant dispid 18;
    property Unread: OleVariant dispid 42;
    property Signed: OleVariant dispid 35;
    property Encrypted: OleVariant dispid 10;
    property ReadReceipt: OleVariant dispid 30;
    property DeliveryReceipt: OleVariant dispid 50;
    property Conversation: OleVariant dispid 8;
    property ConversationIndex: OleVariant dispid 55;
    property ConversationTopic: OleVariant dispid 54;
    property Fields: OleVariant readonly dispid 12;
    property Recipients: OleVariant dispid 28;
    property Attachments: OleVariant readonly dispid 5;
    property Categories: OleVariant dispid 96;
    property TimeCreated: OleVariant readonly dispid 97;
    property TimeExpired: OleVariant dispid 98;
    property Sensitivity: OleVariant dispid 300;
    property TimeLastModified: OleVariant readonly dispid 301;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function Delete(DeletedItems: OleVariant): OleVariant; dispid 106;
    function Update(MakePermanent: OleVariant; RefreshObject: OleVariant): OleVariant; dispid 132;
    function Options(ParentWindow: OleVariant): OleVariant; dispid 125;
    function CopyTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 104;
    function MoveTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 120;
    function Send(SaveCopy: OleVariant; ShowDialog: OleVariant; ParentWindow: OleVariant): OleVariant; dispid 131;
    function Reply: OleVariant; dispid 128;
    function ReplyAll: OleVariant; dispid 129;
    function Forward: OleVariant; dispid 113;
  end;

// *********************************************************************//
// DispIntf:  Fields
// Flags:     (4096) Dispatchable
// GUID:      {000662A0-68DC-101B-ACC1-00AA00423326}
// *********************************************************************//
  Fields = dispinterface
    ['{000662A0-68DC-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Count: OleVariant readonly dispid 9;
    property Item[Index: OleVariant; PropsetID: OleVariant]: OleVariant readonly dispid 21;
    function SetNamespace(PropsetID: OleVariant): OleVariant; dispid 123;
    function Add(Name: OleVariant; Class_: OleVariant; Value: OleVariant; PropsetID: OleVariant): OleVariant; dispid 100;
    function Delete: OleVariant; dispid 106;
  end;

// *********************************************************************//
// DispIntf:  Field
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEB0-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  Field = dispinterface
    ['{3FA7DEB0-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Index: OleVariant readonly dispid 19;
    property type_: OleVariant readonly dispid 17;
    property Name: OleVariant readonly dispid 23;
    property ID: OleVariant readonly dispid 14;
    property Value: OleVariant dispid 43;
    function Delete: OleVariant; dispid 106;
    function ReadFromFile(FileName: OleVariant): OleVariant; dispid 127;
    function WriteToFile(FileName: OleVariant): OleVariant; dispid 133;
  end;

// *********************************************************************//
// DispIntf:  Recipients
// Flags:     (4096) Dispatchable
// GUID:      {D725D1C0-7657-101B-ACC1-00AA00423326}
// *********************************************************************//
  Recipients = dispinterface
    ['{D725D1C0-7657-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Count: OleVariant readonly dispid 9;
    property Resolved: OleVariant readonly dispid 29;
    property RawTable: OleVariant dispid 80;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
    function Add(Name: OleVariant; Address: OleVariant; Type_: OleVariant; EntryID: OleVariant): OleVariant; dispid 100;
    function AddMultiple(Names: OleVariant; Type_: OleVariant): OleVariant; dispid 147;
    function Delete: OleVariant; dispid 106;
    function Resolve(ShowDialog: OleVariant): OleVariant; dispid 130;
    function GetFirstUnresolved: OleVariant; dispid 143;
    function GetNextUnresolved: OleVariant; dispid 144;
    function GetFreeBusy(StartTime: OleVariant; EndTime: OleVariant; Interval: OleVariant): OleVariant; dispid 148;
  end;

// *********************************************************************//
// DispIntf:  Recipient
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAD-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  Recipient = dispinterface
    ['{3FA7DEAD-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Index: OleVariant readonly dispid 19;
    property DisplayType: OleVariant readonly dispid 56;
    property Name: OleVariant dispid 23;
    property type_: OleVariant dispid 17;
    property Address: OleVariant dispid 2;
    property ID: OleVariant dispid 14;
    property MeetingResponseStatus: OleVariant dispid 325;
    property AddressEntry: OleVariant dispid 53;
    property AmbiguousNames: OleVariant readonly dispid 81;
    function Delete: OleVariant; dispid 106;
    function Resolve(ShowDialog: OleVariant): OleVariant; dispid 130;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function GetFreeBusy(StartTime: OleVariant; EndTime: OleVariant; Interval: OleVariant): OleVariant; dispid 148;
  end;

// *********************************************************************//
// DispIntf:  Attachments
// Flags:     (4096) Dispatchable
// GUID:      {FA19A960-68DB-101B-ACC1-00AA00423326}
// *********************************************************************//
  Attachments = dispinterface
    ['{FA19A960-68DB-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Count: OleVariant readonly dispid 9;
    property Item[Index: OleVariant]: OleVariant readonly dispid 21;
    function Add(Name: OleVariant; Position: OleVariant; Type_: OleVariant; Source: OleVariant): OleVariant; dispid 100;
    function Delete: OleVariant; dispid 106;
  end;

// *********************************************************************//
// DispIntf:  Attachment
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAE-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  Attachment = dispinterface
    ['{3FA7DEAE-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property Name: OleVariant dispid 23;
    property type_: OleVariant dispid 17;
    property Index: OleVariant readonly dispid 19;
    property Position: OleVariant dispid 26;
    property Source: OleVariant dispid 37;
    property Fields: OleVariant readonly dispid 12;
    function Delete: OleVariant; dispid 106;
    function ReadFromFile(FileName: OleVariant): OleVariant; dispid 127;
    function WriteToFile(FileName: OleVariant): OleVariant; dispid 133;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
  end;

// *********************************************************************//
// DispIntf:  AddressEntry
// Flags:     (4096) Dispatchable
// GUID:      {3FA7DEAB-6438-101B-ACC1-00AA00423326}
// *********************************************************************//
  AddressEntry = dispinterface
    ['{3FA7DEAB-6438-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property DisplayType: OleVariant readonly dispid 56;
    property Name: OleVariant dispid 23;
    property Address: OleVariant dispid 2;
    property type_: OleVariant dispid 17;
    property ID: OleVariant readonly dispid 14;
    property Manager: OleVariant readonly dispid 84;
    property Members: OleVariant readonly dispid 64;
    property Fields: OleVariant readonly dispid 12;
    function Details(ParentWindow: OleVariant): OleVariant; dispid 107;
    function Update(MakePermanent: OleVariant; RefreshObject: OleVariant): OleVariant; dispid 132;
    function Delete: OleVariant; dispid 106;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function GetFreeBusy(StartTime: OleVariant; EndTime: OleVariant; Interval: OleVariant): OleVariant; dispid 148;
  end;

// *********************************************************************//
// DispIntf:  AddressEntryFilter
// Flags:     (4096) Dispatchable
// GUID:      {D725D1C1-7657-101B-ACC1-00AA00423326}
// *********************************************************************//
  AddressEntryFilter = dispinterface
    ['{D725D1C1-7657-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Fields: OleVariant readonly dispid 12;
    property Not_: OleVariant dispid 45;
    property Or_: OleVariant dispid 62;
    property Address: OleVariant dispid 2;
    property Name: OleVariant dispid 23;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
  end;

// *********************************************************************//
// DispIntf:  MessageFilter
// Flags:     (4096) Dispatchable
// GUID:      {D725D1C3-7657-101B-ACC1-00AA00423326}
// *********************************************************************//
  MessageFilter = dispinterface
    ['{D725D1C3-7657-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Fields: OleVariant readonly dispid 12;
    property Not_: OleVariant dispid 45;
    property Or_: OleVariant dispid 62;
    property Conversation: OleVariant dispid 8;
    property Importance: OleVariant dispid 27;
    property Recipients: OleVariant dispid 28;
    property Sender: OleVariant dispid 32;
    property Sent: OleVariant dispid 33;
    property Size: OleVariant dispid 36;
    property Subject: OleVariant dispid 38;
    property Text: OleVariant dispid 39;
    property TimeFirst: OleVariant dispid 46;
    property TimeLast: OleVariant dispid 47;
    property type_: OleVariant dispid 17;
    property Unread: OleVariant dispid 42;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
  end;

// *********************************************************************//
// DispIntf:  GroupHeader
// Flags:     (4096) Dispatchable
// GUID:      {EF9203E6-B9A5-101B-ACC1-00AA00423326}
// *********************************************************************//
  GroupHeader = dispinterface
    ['{EF9203E6-B9A5-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property Name: OleVariant readonly dispid 23;
    property Level: OleVariant readonly dispid 85;
    property Count: OleVariant readonly dispid 9;
    property Unread: OleVariant readonly dispid 42;
  end;

// *********************************************************************//
// DispIntf:  AppointmentItem
// Flags:     (4096) Dispatchable
// GUID:      {EF9203E7-B9A5-101B-ACC1-00AA00423326}
// *********************************************************************//
  AppointmentItem = dispinterface
    ['{EF9203E7-B9A5-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property FolderID: OleVariant readonly dispid 51;
    property StoreID: OleVariant readonly dispid 52;
    property ID: OleVariant readonly dispid 14;
    property type_: OleVariant dispid 17;
    property Size: OleVariant readonly dispid 36;
    property Importance: OleVariant dispid 27;
    property Subject: OleVariant dispid 38;
    property Sender: OleVariant dispid 32;
    property TimeSent: OleVariant dispid 41;
    property TimeReceived: OleVariant dispid 40;
    property Text: OleVariant dispid 39;
    property Sent: OleVariant dispid 33;
    property Submitted: OleVariant dispid 18;
    property Unread: OleVariant dispid 42;
    property Signed: OleVariant dispid 35;
    property Encrypted: OleVariant dispid 10;
    property ReadReceipt: OleVariant dispid 30;
    property DeliveryReceipt: OleVariant dispid 50;
    property Conversation: OleVariant dispid 8;
    property ConversationIndex: OleVariant dispid 55;
    property ConversationTopic: OleVariant dispid 54;
    property Fields: OleVariant readonly dispid 12;
    property Recipients: OleVariant dispid 28;
    property Attachments: OleVariant readonly dispid 5;
    property Categories: OleVariant dispid 96;
    property TimeCreated: OleVariant readonly dispid 97;
    property TimeExpired: OleVariant dispid 98;
    property Sensitivity: OleVariant dispid 300;
    property TimeLastModified: OleVariant readonly dispid 301;
    property AllDayEvent: OleVariant dispid 302;
    property BusyStatus: OleVariant dispid 303;
    property Duration: OleVariant readonly dispid 304;
    property EndTime: OleVariant dispid 89;
    property StartTime: OleVariant dispid 88;
    property IsRecurring: OleVariant readonly dispid 305;
    property Location: OleVariant dispid 306;
    property MeetingStatus: OleVariant dispid 307;
    property Organizer: OleVariant readonly dispid 308;
    property ReminderMinutesBeforeStart: OleVariant dispid 309;
    property ReminderSet: OleVariant dispid 312;
    property ReplyTime: OleVariant dispid 314;
    property ResponseRequested: OleVariant dispid 315;
    property MeetingResponseStatus: OleVariant dispid 325;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function Delete(DeletedItems: OleVariant): OleVariant; dispid 106;
    function Update(MakePermanent: OleVariant; RefreshObject: OleVariant): OleVariant; dispid 132;
    function Options(ParentWindow: OleVariant): OleVariant; dispid 125;
    function CopyTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 104;
    function MoveTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 120;
    function Send(SaveCopy: OleVariant; ShowDialog: OleVariant; ParentWindow: OleVariant): OleVariant; dispid 131;
    function Respond(RespondType: OleVariant): OleVariant; dispid 150;
    function Forward: OleVariant; dispid 113;
    function GetRecurrencePattern: OleVariant; dispid 94;
    function ClearRecurrencePattern: OleVariant; dispid 151;
  end;

// *********************************************************************//
// DispIntf:  MeetingItem
// Flags:     (4096) Dispatchable
// GUID:      {EF9203E8-B9A5-101B-ACC1-00AA00423326}
// *********************************************************************//
  MeetingItem = dispinterface
    ['{EF9203E8-B9A5-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property MAPIOBJECT: OleVariant dispid 49;
    property FolderID: OleVariant readonly dispid 51;
    property StoreID: OleVariant readonly dispid 52;
    property ID: OleVariant readonly dispid 14;
    property type_: OleVariant dispid 17;
    property Size: OleVariant readonly dispid 36;
    property Importance: OleVariant dispid 27;
    property Subject: OleVariant dispid 38;
    property Sender: OleVariant dispid 32;
    property TimeSent: OleVariant dispid 41;
    property TimeReceived: OleVariant dispid 40;
    property Text: OleVariant dispid 39;
    property Sent: OleVariant dispid 33;
    property Submitted: OleVariant dispid 18;
    property Unread: OleVariant dispid 42;
    property Signed: OleVariant dispid 35;
    property Encrypted: OleVariant dispid 10;
    property ReadReceipt: OleVariant dispid 30;
    property DeliveryReceipt: OleVariant dispid 50;
    property Conversation: OleVariant dispid 8;
    property ConversationIndex: OleVariant dispid 55;
    property ConversationTopic: OleVariant dispid 54;
    property Fields: OleVariant readonly dispid 12;
    property Recipients: OleVariant dispid 28;
    property Attachments: OleVariant readonly dispid 5;
    property Categories: OleVariant dispid 96;
    property TimeCreated: OleVariant readonly dispid 97;
    property TimeExpired: OleVariant dispid 98;
    property Sensitivity: OleVariant dispid 300;
    property TimeLastModified: OleVariant readonly dispid 301;
    property MeetingType: OleVariant readonly dispid 326;
    function IsSameAs(Object_: OleVariant): OleVariant; dispid 136;
    function Delete(DeletedItems: OleVariant): OleVariant; dispid 106;
    function Update(MakePermanent: OleVariant; RefreshObject: OleVariant): OleVariant; dispid 132;
    function Options(ParentWindow: OleVariant): OleVariant; dispid 125;
    function CopyTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 104;
    function MoveTo(FolderID: OleVariant; StoreID: OleVariant): OleVariant; dispid 120;
    function Send(SaveCopy: OleVariant; ShowDialog: OleVariant; ParentWindow: OleVariant): OleVariant; dispid 131;
    function Reply: OleVariant; dispid 128;
    function ReplyAll: OleVariant; dispid 129;
    function Forward: OleVariant; dispid 113;
    function Respond(RespondType: OleVariant): OleVariant; dispid 150;
    function GetAssociatedAppointment: OleVariant; dispid 152;
  end;

// *********************************************************************//
// DispIntf:  RecurrencePattern
// Flags:     (4096) Dispatchable
// GUID:      {EF9203E9-B9A5-101B-ACC1-00AA00423326}
// *********************************************************************//
  RecurrencePattern = dispinterface
    ['{EF9203E9-B9A5-101B-ACC1-00AA00423326}']
    property Application: OleVariant readonly dispid 20;
    property Parent: OleVariant dispid 25;
    property Session: OleVariant dispid 34;
    property Class_: OleVariant readonly dispid 6;
    property DayOfMonth: OleVariant dispid 316;
    property DayOfWeekMask: OleVariant dispid 317;
    property Duration: OleVariant readonly dispid 304;
    property EndTime: OleVariant dispid 89;
    property StartTime: OleVariant dispid 88;
    property Instance: OleVariant dispid 318;
    property Interval: OleVariant dispid 90;
    property MonthOfYear: OleVariant dispid 319;
    property NoEndDate: OleVariant dispid 320;
    property Occurrences: OleVariant dispid 321;
    property PatternEndDate: OleVariant dispid 322;
    property PatternStartDate: OleVariant dispid 323;
    property RecurrenceType: OleVariant dispid 324;
  end;

// *********************************************************************//
// The Class CoSession provides a Create and CreateRemote method to          
// create instances of the default interface _Session exposed by              
// the CoClass Session. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSession = class
    class function Create: _Session;
    class function CreateRemote(const MachineName: string): _Session;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCDOSession
// Help String      : 
// Default Interface: _Session
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCDOSessionProperties= class;
{$ENDIF}
  TCDOSession = class(TOleServer)
  private
    FIntf:        _Session;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCDOSessionProperties;
    function      GetServerProperties: TCDOSessionProperties;
{$ENDIF}
    function      GetDefaultInterface: _Session;
  protected
    procedure InitServerData; override;
    function Get_Application: OleVariant;
    function Get_Parent: OleVariant;
    procedure Set_Parent(Value: OleVariant);
    function Get_Session: OleVariant;
    procedure Set_Session(Value: OleVariant);
    function Get_Class_: OleVariant;
    function Get_MAPIOBJECT: OleVariant;
    procedure Set_MAPIOBJECT(Value: OleVariant);
    function Get_Version: OleVariant;
    function Get_OperatingSystem: OleVariant;
    function Get_Name: OleVariant;
    function Get_CurrentUser: OleVariant;
    function Get_Inbox: OleVariant;
    function Get_Outbox: OleVariant;
    function Get_InfoStores: OleVariant;
    function Get_AddressLists: OleVariant;
    function Get_OutOfOffice: OleVariant;
    procedure Set_OutOfOffice(Value: OleVariant);
    function Get_OutOfOfficeText: OleVariant;
    procedure Set_OutOfOfficeText(Value: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Session);
    procedure Disconnect; override;
    function Logon: OleVariant; overload;
    function Logon(ProfileName: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant; 
                   NewSession: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant; 
                   NewSession: OleVariant; ParentWindow: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant; 
                   NewSession: OleVariant; ParentWindow: OleVariant; NoMail: OleVariant): OleVariant; overload;
    function Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; ShowDialog: OleVariant; 
                   NewSession: OleVariant; ParentWindow: OleVariant; NoMail: OleVariant; 
                   ProfileInfo: OleVariant): OleVariant; overload;
    function Logoff: OleVariant;
    function GetInfoStore: OleVariant; overload;
    function GetInfoStore(StoreID: OleVariant): OleVariant; overload;
    function GetFolder(FolderID: OleVariant): OleVariant; overload;
    function GetFolder(FolderID: OleVariant; StoreID: OleVariant): OleVariant; overload;
    function GetMessage(MessageID: OleVariant): OleVariant; overload;
    function GetMessage(MessageID: OleVariant; StoreID: OleVariant): OleVariant; overload;
    function GetArticle(ArticleID: OleVariant; FolderID: OleVariant): OleVariant; overload;
    function GetArticle(ArticleID: OleVariant; FolderID: OleVariant; StoreID: OleVariant): OleVariant; overload;
    function GetAddressEntry(EntryID: OleVariant): OleVariant;
    function AddressBook: OleVariant; overload;
    function AddressBook(Recipients: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant; ToLabel: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant; ToLabel: OleVariant; 
                         CcLabel: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant; ToLabel: OleVariant; 
                         CcLabel: OleVariant; BccLabel: OleVariant): OleVariant; overload;
    function AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                         ForceResolution: OleVariant; RecipLists: OleVariant; ToLabel: OleVariant; 
                         CcLabel: OleVariant; BccLabel: OleVariant; ParentWindow: OleVariant): OleVariant; overload;
    function DeliverNow: OleVariant;
    function CompareIDs(ID1: OleVariant; ID2: OleVariant): OleVariant;
    function CreateConversationIndex: OleVariant; overload;
    function CreateConversationIndex(ParentIndex: OleVariant): OleVariant; overload;
    function SetLocaleIDs(LocaleID: OleVariant; CodePageID: OleVariant): OleVariant;
    function GetDefaultFolder(ObjectType: OleVariant): OleVariant;
    function GetAddressList(ObjectType: OleVariant): OleVariant;
    function GetOption(OptType: OleVariant): OleVariant;
    function SetOption(OptType: OleVariant; OptValue: OleVariant): OleVariant;
    property DefaultInterface: _Session read GetDefaultInterface;
    property Application: OleVariant read Get_Application;
    property Parent: OleVariant read Get_Parent write Set_Parent;
    property Session: OleVariant read Get_Session write Set_Session;
    property Class_: OleVariant read Get_Class_;
    property MAPIOBJECT: OleVariant read Get_MAPIOBJECT write Set_MAPIOBJECT;
    property Version: OleVariant read Get_Version;
    property OperatingSystem: OleVariant read Get_OperatingSystem;
    property Name: OleVariant read Get_Name;
    property CurrentUser: OleVariant read Get_CurrentUser;
    property Inbox: OleVariant read Get_Inbox;
    property Outbox: OleVariant read Get_Outbox;
    property InfoStores: OleVariant read Get_InfoStores;
    property AddressLists: OleVariant read Get_AddressLists;
    property OutOfOffice: OleVariant read Get_OutOfOffice write Set_OutOfOffice;
    property OutOfOfficeText: OleVariant read Get_OutOfOfficeText write Set_OutOfOfficeText;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCDOSessionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCDOSession
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCDOSessionProperties = class(TPersistent)
  private
    FServer:    TCDOSession;
    function    GetDefaultInterface: _Session;
    constructor Create(AServer: TCDOSession);
  protected
    function Get_Application: OleVariant;
    function Get_Parent: OleVariant;
    procedure Set_Parent(Value: OleVariant);
    function Get_Session: OleVariant;
    procedure Set_Session(Value: OleVariant);
    function Get_Class_: OleVariant;
    function Get_MAPIOBJECT: OleVariant;
    procedure Set_MAPIOBJECT(Value: OleVariant);
    function Get_Version: OleVariant;
    function Get_OperatingSystem: OleVariant;
    function Get_Name: OleVariant;
    function Get_CurrentUser: OleVariant;
    function Get_Inbox: OleVariant;
    function Get_Outbox: OleVariant;
    function Get_InfoStores: OleVariant;
    function Get_AddressLists: OleVariant;
    function Get_OutOfOffice: OleVariant;
    procedure Set_OutOfOffice(Value: OleVariant);
    function Get_OutOfOfficeText: OleVariant;
    procedure Set_OutOfOfficeText(Value: OleVariant);
  public
    property DefaultInterface: _Session read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoSession.Create: _Session;
begin
  Result := CreateComObject(CLASS_Session) as _Session;
end;

class function CoSession.CreateRemote(const MachineName: string): _Session;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Session) as _Session;
end;

procedure TCDOSession.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3FA7DEB3-6438-101B-ACC1-00AA00423326}';
    IntfIID:   '{3FA7DEA8-6438-101B-ACC1-00AA00423326}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCDOSession.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Session;
  end;
end;

procedure TCDOSession.ConnectTo(svrIntf: _Session);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCDOSession.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCDOSession.GetDefaultInterface: _Session;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCDOSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCDOSessionProperties.Create(Self);
{$ENDIF}
end;

destructor TCDOSession.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCDOSession.GetServerProperties: TCDOSessionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCDOSession.Get_Application: OleVariant;
begin
  Result := DefaultInterface.Application;
end;

function TCDOSession.Get_Parent: OleVariant;
begin
  Result := DefaultInterface.Parent;
end;

procedure TCDOSession.Set_Parent(Value: OleVariant);
begin
  DefaultInterface.Parent := Value;
end;

function TCDOSession.Get_Session: OleVariant;
begin
  Result := DefaultInterface.Session;
end;

procedure TCDOSession.Set_Session(Value: OleVariant);
begin
  DefaultInterface.Session := Value;
end;

function TCDOSession.Get_Class_: OleVariant;
begin
  Result := DefaultInterface.Class_;
end;

function TCDOSession.Get_MAPIOBJECT: OleVariant;
begin
  Result := DefaultInterface.MAPIOBJECT;
end;

procedure TCDOSession.Set_MAPIOBJECT(Value: OleVariant);
begin
  DefaultInterface.MAPIOBJECT := Value;
end;

function TCDOSession.Get_Version: OleVariant;
begin
  Result := DefaultInterface.Version;
end;

function TCDOSession.Get_OperatingSystem: OleVariant;
begin
  Result := DefaultInterface.OperatingSystem;
end;

function TCDOSession.Get_Name: OleVariant;
begin
  Result := DefaultInterface.Name;
end;

function TCDOSession.Get_CurrentUser: OleVariant;
begin
  Result := DefaultInterface.CurrentUser;
end;

function TCDOSession.Get_Inbox: OleVariant;
begin
  Result := DefaultInterface.Inbox;
end;

function TCDOSession.Get_Outbox: OleVariant;
begin
  Result := DefaultInterface.Outbox;
end;

function TCDOSession.Get_InfoStores: OleVariant;
begin
  Result := DefaultInterface.InfoStores;
end;

function TCDOSession.Get_AddressLists: OleVariant;
begin
  Result := DefaultInterface.AddressLists;
end;

function TCDOSession.Get_OutOfOffice: OleVariant;
begin
  Result := DefaultInterface.OutOfOffice;
end;

procedure TCDOSession.Set_OutOfOffice(Value: OleVariant);
begin
  DefaultInterface.OutOfOffice := Value;
end;

function TCDOSession.Get_OutOfOfficeText: OleVariant;
begin
  Result := DefaultInterface.OutOfOfficeText;
end;

procedure TCDOSession.Set_OutOfOfficeText(Value: OleVariant);
begin
  DefaultInterface.OutOfOfficeText := Value;
end;

function TCDOSession.Logon: OleVariant;
begin
  Result := DefaultInterface.Logon(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                   EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                   EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, EmptyParam, EmptyParam, 
                                   EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; 
                           ShowDialog: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, ShowDialog, EmptyParam, 
                                   EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; 
                           ShowDialog: OleVariant; NewSession: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, ShowDialog, NewSession, 
                                   EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; 
                           ShowDialog: OleVariant; NewSession: OleVariant; ParentWindow: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, ShowDialog, NewSession, 
                                   ParentWindow, EmptyParam, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; 
                           ShowDialog: OleVariant; NewSession: OleVariant; 
                           ParentWindow: OleVariant; NoMail: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, ShowDialog, NewSession, 
                                   ParentWindow, NoMail, EmptyParam);
end;

function TCDOSession.Logon(ProfileName: OleVariant; ProfilePassword: OleVariant; 
                           ShowDialog: OleVariant; NewSession: OleVariant; 
                           ParentWindow: OleVariant; NoMail: OleVariant; ProfileInfo: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Logon(ProfileName, ProfilePassword, ShowDialog, NewSession, 
                                   ParentWindow, NoMail, ProfileInfo);
end;

function TCDOSession.Logoff: OleVariant;
begin
  Result := DefaultInterface.Logoff;
end;

function TCDOSession.GetInfoStore: OleVariant;
begin
  Result := DefaultInterface.GetInfoStore(EmptyParam);
end;

function TCDOSession.GetInfoStore(StoreID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetInfoStore(StoreID);
end;

function TCDOSession.GetFolder(FolderID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetFolder(FolderID, EmptyParam);
end;

function TCDOSession.GetFolder(FolderID: OleVariant; StoreID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetFolder(FolderID, StoreID);
end;

function TCDOSession.GetMessage(MessageID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetMessage(MessageID, EmptyParam);
end;

function TCDOSession.GetMessage(MessageID: OleVariant; StoreID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetMessage(MessageID, StoreID);
end;

function TCDOSession.GetArticle(ArticleID: OleVariant; FolderID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetArticle(ArticleID, FolderID, EmptyParam);
end;

function TCDOSession.GetArticle(ArticleID: OleVariant; FolderID: OleVariant; StoreID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetArticle(ArticleID, FolderID, StoreID);
end;

function TCDOSession.GetAddressEntry(EntryID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetAddressEntry(EntryID);
end;

function TCDOSession.AddressBook: OleVariant;
begin
  Result := DefaultInterface.AddressBook(EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                         EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, EmptyParam, EmptyParam, EmptyParam, 
                                         EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, EmptyParam, EmptyParam, EmptyParam, 
                                         EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, EmptyParam, EmptyParam, 
                                         EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant; RecipLists: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         RecipLists, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant; RecipLists: OleVariant; 
                                 ToLabel: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         RecipLists, ToLabel, EmptyParam, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant; RecipLists: OleVariant; 
                                 ToLabel: OleVariant; CcLabel: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         RecipLists, ToLabel, CcLabel, EmptyParam, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant; RecipLists: OleVariant; 
                                 ToLabel: OleVariant; CcLabel: OleVariant; BccLabel: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         RecipLists, ToLabel, CcLabel, BccLabel, EmptyParam);
end;

function TCDOSession.AddressBook(Recipients: OleVariant; Title: OleVariant; OneAddress: OleVariant; 
                                 ForceResolution: OleVariant; RecipLists: OleVariant; 
                                 ToLabel: OleVariant; CcLabel: OleVariant; BccLabel: OleVariant; 
                                 ParentWindow: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AddressBook(Recipients, Title, OneAddress, ForceResolution, 
                                         RecipLists, ToLabel, CcLabel, BccLabel, ParentWindow);
end;

function TCDOSession.DeliverNow: OleVariant;
begin
  Result := DefaultInterface.DeliverNow;
end;

function TCDOSession.CompareIDs(ID1: OleVariant; ID2: OleVariant): OleVariant;
begin
  Result := DefaultInterface.CompareIDs(ID1, ID2);
end;

function TCDOSession.CreateConversationIndex: OleVariant;
begin
  Result := DefaultInterface.CreateConversationIndex(EmptyParam);
end;

function TCDOSession.CreateConversationIndex(ParentIndex: OleVariant): OleVariant;
begin
  Result := DefaultInterface.CreateConversationIndex(ParentIndex);
end;

function TCDOSession.SetLocaleIDs(LocaleID: OleVariant; CodePageID: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SetLocaleIDs(LocaleID, CodePageID);
end;

function TCDOSession.GetDefaultFolder(ObjectType: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetDefaultFolder(ObjectType);
end;

function TCDOSession.GetAddressList(ObjectType: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetAddressList(ObjectType);
end;

function TCDOSession.GetOption(OptType: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetOption(OptType);
end;

function TCDOSession.SetOption(OptType: OleVariant; OptValue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SetOption(OptType, OptValue);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCDOSessionProperties.Create(AServer: TCDOSession);
begin
  inherited Create;
  FServer := AServer;
end;

function TCDOSessionProperties.GetDefaultInterface: _Session;
begin
  Result := FServer.DefaultInterface;
end;

function TCDOSessionProperties.Get_Application: OleVariant;
begin
  Result := DefaultInterface.Application;
end;

function TCDOSessionProperties.Get_Parent: OleVariant;
begin
  Result := DefaultInterface.Parent;
end;

procedure TCDOSessionProperties.Set_Parent(Value: OleVariant);
begin
  DefaultInterface.Parent := Value;
end;

function TCDOSessionProperties.Get_Session: OleVariant;
begin
  Result := DefaultInterface.Session;
end;

procedure TCDOSessionProperties.Set_Session(Value: OleVariant);
begin
  DefaultInterface.Session := Value;
end;

function TCDOSessionProperties.Get_Class_: OleVariant;
begin
  Result := DefaultInterface.Class_;
end;

function TCDOSessionProperties.Get_MAPIOBJECT: OleVariant;
begin
  Result := DefaultInterface.MAPIOBJECT;
end;

procedure TCDOSessionProperties.Set_MAPIOBJECT(Value: OleVariant);
begin
  DefaultInterface.MAPIOBJECT := Value;
end;

function TCDOSessionProperties.Get_Version: OleVariant;
begin
  Result := DefaultInterface.Version;
end;

function TCDOSessionProperties.Get_OperatingSystem: OleVariant;
begin
  Result := DefaultInterface.OperatingSystem;
end;

function TCDOSessionProperties.Get_Name: OleVariant;
begin
  Result := DefaultInterface.Name;
end;

function TCDOSessionProperties.Get_CurrentUser: OleVariant;
begin
  Result := DefaultInterface.CurrentUser;
end;

function TCDOSessionProperties.Get_Inbox: OleVariant;
begin
  Result := DefaultInterface.Inbox;
end;

function TCDOSessionProperties.Get_Outbox: OleVariant;
begin
  Result := DefaultInterface.Outbox;
end;

function TCDOSessionProperties.Get_InfoStores: OleVariant;
begin
  Result := DefaultInterface.InfoStores;
end;

function TCDOSessionProperties.Get_AddressLists: OleVariant;
begin
  Result := DefaultInterface.AddressLists;
end;

function TCDOSessionProperties.Get_OutOfOffice: OleVariant;
begin
  Result := DefaultInterface.OutOfOffice;
end;

procedure TCDOSessionProperties.Set_OutOfOffice(Value: OleVariant);
begin
  DefaultInterface.OutOfOffice := Value;
end;

function TCDOSessionProperties.Get_OutOfOfficeText: OleVariant;
begin
  Result := DefaultInterface.OutOfOfficeText;
end;

procedure TCDOSessionProperties.Set_OutOfOfficeText(Value: OleVariant);
begin
  DefaultInterface.OutOfOfficeText := Value;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TCDOSession]);
end;

end.
