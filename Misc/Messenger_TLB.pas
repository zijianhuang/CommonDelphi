unit Messenger_TLB;

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
// File generated on 14/01/2006 6:24:16 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Messenger\msmsgs.exe (1)
// LIBID: {218CB45F-20B6-11D2-8E17-0000F803A446}
// LCID: 0
// Helpfile: 
// HelpString: Messenger Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Member 'Property' of 'IMsgrUser2' changed to 'Property_'
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
  MessengerMajorVersion = 1;
  MessengerMinorVersion = 0;

  LIBID_Messenger: TGUID = '{218CB45F-20B6-11D2-8E17-0000F803A446}';

  IID_IMsgrObject: TGUID = '{218CB451-20B6-11D2-8E17-0000F803A446}';
  IID_IMsgrService: TGUID = '{659ECAD9-A5C0-11D2-A440-00C04F795683}';
  IID_IMsgrUser: TGUID = '{218CB453-20B6-11D2-8E17-0000F803A446}';
  IID_IMsgrUsers: TGUID = '{218CB454-20B6-11D2-8E17-0000F803A446}';
  IID_IMsgrIMSessions: TGUID = '{6FD143E6-20A5-11D2-91AD-0000F81FEFC9}';
  IID_IMsgrIMSession: TGUID = '{82E11592-20F5-11D2-91AD-0000F81FEFC9}';
  IID_IMsgrServices: TGUID = '{659ECAD8-A5C0-11D2-A440-00C04F795683}';
  IID_IMessengerApp: TGUID = '{F3A614DD-ABE0-11D2-A441-00C04F795683}';
  IID_IMessengerIMWindow: TGUID = '{35EDD1CD-1A8C-11D2-B49D-00C04FB90376}';
  IID_IMessengerIMWindows: TGUID = '{35EDD1CC-1A8C-11D2-B49D-00C04FB90376}';
  IID_IMsgrObject2: TGUID = '{218CB455-20B6-11D2-8E17-0000F803A446}';
  DIID_DMsgrObjectEvents: TGUID = '{218CB452-20B6-11D2-8E17-0000F803A446}';
  IID_IMsgrUser2: TGUID = '{218CB456-20B6-11D2-8E17-0000F803A446}';
  IID_IMessengerApp2: TGUID = '{FF55D627-CF5B-40DE-850F-62D20BC241C8}';
  IID_IMessengerApp3: TGUID = '{28E28123-7DC5-45D3-860E-8EE1C3681BD5}';
  IID_IMsgrSP: TGUID = '{E5B42158-AF2C-11D2-8D9D-0000F875C541}';
  IID_IMsgrSP2: TGUID = '{E5B42159-AF2C-11D2-8D9D-0000F875C541}';
  IID_IMsgrWebScriptManager: TGUID = '{CB643558-61CD-42B2-A9A5-496A7884AD61}';
  IID_IMsgrPassportClient: TGUID = '{97C3808A-ECA1-4CA6-8D09-122A3CC54B3B}';
  IID_IMsgrHost: TGUID = '{06F6EA9D-88B0-45A9-9F26-CE0898D9EA1C}';
  CLASS_MsgrObject: TGUID = '{F3A614DC-ABE0-11D2-A441-00C04F795683}';
  CLASS_MessengerApp: TGUID = '{FB7199AB-79BF-11D2-8D94-0000F875C541}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0021
type
  __MIDL___MIDL_itf_mdisp_0000_0021 = TOleEnum;
const
  MSS_LOGGED_ON = $00000000;
  MSS_NOT_LOGGED_ON = $00000001;
  MSS_LOGGING_ON = $00000002;
  MSS_LOGGING_OFF = $00000003;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0004
type
  __MIDL___MIDL_itf_mdisp_0000_0004 = TOleEnum;
const
  MURLTYPE_CHANGE_PASSWORD = $00000000;
  MURLTYPE_CHANGE_INFO = $00000001;
  MURLTYPE_COMPOSE_EMAIL = $00000002;
  MURLTYPE_GO_TO_EMAIL_INBOX = $00000003;
  MURLTYPE_GO_TO_EMAIL_FOLDERS = $00000004;
  MURLTYPE_MOBILE_SIGNUP = $00000005;
  MURLTYPE_CHANGE_MOBILE_INFO = $00000006;
  MURLTYPE_CHANGE_PROFILE = $00000007;
  MURLTYPE_CHAT = $00000008;
  MURLTYPE_POST_URL_REQUEST = $00000009;
  MURLTYPE_ADDRESS_BOOK = $0000000A;
  MURLTYPE_ADVANCED_SEARCH = $0000000B;
  MURLTYPE_SEARCH_BY_INTEREST = $0000000C;
  MURLTYPE_MAX_NUM_URL = $0000000D;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0009
type
  __MIDL___MIDL_itf_mdisp_0000_0009 = TOleEnum;
const
  MPFLFIELD_COUNTRY = $00000000;
  MPFLFIELD_POSTALCODE = $00000001;
  MPFLFIELD_LANG_PREFERENCE = $00000002;
  MPFLFIELD_GENDER = $00000003;
  MPFLFIELD_PREFERRED_EMAIL = $00000004;
  MPFLFIELD_NICKNAME = $00000005;
  MPFLFIELD_ACCESSIBILITY = $00000006;
  MPFLFIELD_WALLET = $00000007;
  MPFLFIELD_DIRECTORY = $00000008;
  MPFLFIELD_INETACCESS = $00000009;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0001
type
  __MIDL___MIDL_itf_mdisp_0000_0001 = TOleEnum;
const
  MSTATE_UNKNOWN = $00000000;
  MSTATE_OFFLINE = $00000001;
  MSTATE_ONLINE = $00000002;
  MSTATE_INVISIBLE = $00000006;
  MSTATE_BUSY = $0000000A;
  MSTATE_BE_RIGHT_BACK = $0000000E;
  MSTATE_IDLE = $00000012;
  MSTATE_AWAY = $00000022;
  MSTATE_ON_THE_PHONE = $00000032;
  MSTATE_OUT_TO_LUNCH = $00000042;
  MSTATE_LOCAL_FINDING_SERVER = $00000100;
  MSTATE_LOCAL_CONNECTING_TO_SERVER = $00000200;
  MSTATE_LOCAL_SYNCHRONIZING_WITH_SERVER = $00000300;
  MSTATE_LOCAL_DISCONNECTING_FROM_SERVER = $00000400;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0006
type
  __MIDL___MIDL_itf_mdisp_0000_0006 = TOleEnum;
const
  MMSGTYPE_NO_RESULT = $00000000;
  MMSGTYPE_ERRORS_ONLY = $00000001;
  MMSGTYPE_ALL_RESULTS = $00000002;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0005
type
  __MIDL___MIDL_itf_mdisp_0000_0005 = TOleEnum;
const
  MLIST_CONTACT = $00000000;
  MLIST_ALLOW = $00000001;
  MLIST_BLOCK = $00000002;
  MLIST_REVERSE = $00000003;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0003
type
  __MIDL___MIDL_itf_mdisp_0000_0003 = TOleEnum;
const
  MMSGPRIVACY_BLOCK_LIST_EXCLUDED = $00000000;
  MMSGPRIVACY_ALLOW_LIST_ONLY = $00000001;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0002
type
  __MIDL___MIDL_itf_mdisp_0000_0002 = TOleEnum;
const
  MPROMPT_YES_IF_NOT_ALLOWED_OR_BLOCKED = $00000000;
  MPROMPT_NO_ADD_TO_ALLOW = $00000001;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0013
type
  __MIDL___MIDL_itf_mdisp_0000_0013 = TOleEnum;
const
  MLOPT_PROXY_STATE = $00000000;
  MLOPT_PROXY_TYPE = $00000001;
  MLOPT_SOCKS4_SERVER = $00000002;
  MLOPT_SOCKS5_SERVER = $00000003;
  MLOPT_HTTPS_SERVER = $00000004;
  MLOPT_SOCKS4_PORT = $00000005;
  MLOPT_SOCKS5_PORT = $00000006;
  MLOPT_HTTPS_PORT = $00000007;
  MLOPT_SOCKS5_USERNAME = $00000008;
  MLOPT_SOCKS5_PASSWORD = $00000009;
  MLOPT_SERVER_NAME = $0000000A;
  MLOPT_ENABLE_IDLE_DETECT = $0000000B;
  MLOPT_IDLE_THRESHOLD = $0000000C;
  MLOPT_IDLE_DETECTABLE = $0000000D;
  MLOPT_SS_DETECTABLE = $0000000E;
  MLOPT_HTTP_SERVER = $0000000F;
  MLOPT_HTTP_PORT = $00000010;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0011
type
  __MIDL___MIDL_itf_mdisp_0000_0011 = TOleEnum;
const
  SSTATE_DISCONNECTED = $00000000;
  SSTATE_CONNECTING = $00000001;
  SSTATE_CONNECTED = $00000002;
  SSTATE_DISCONNECTING = $00000003;
  SSTATE_ERROR = $00000004;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0012
type
  __MIDL___MIDL_itf_mdisp_0000_0012 = TOleEnum;
const
  MFOLDER_INBOX = $00000000;
  MFOLDER_ALL_OTHER_FOLDERS = $00000001;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0018
type
  __MIDL___MIDL_itf_mdisp_0000_0018 = TOleEnum;
const
  MOPTDLG_GENERAL_PAGE = $00000000;
  MOPTDLG_PRIVACY_PAGE = $00000001;
  MOPTDLG_EXCHANGE_PAGE = $00000002;
  MOPTDLG_ACCOUNTS_PAGE = $00000003;
  MOPTDLG_CONNECTION_PAGE = $00000004;
  MOPTDLG_PREFERENCES_PAGE = $00000005;
  MOPTDLG_SERVICES_PAGE = $00000006;
  MOPTDLG_PHONE_PAGE = $00000007;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0007
type
  __MIDL___MIDL_itf_mdisp_0000_0007 = TOleEnum;
const
  MUPDATE_OPTIONAL = $00000001;
  MUPDATE_MANDATORY = $00000002;
  MUPDATE_BRANDED = $00000004;
  MUPDATE_BGDLCOMPLETE = $00000008;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0008
type
  __MIDL___MIDL_itf_mdisp_0000_0008 = TOleEnum;
const
  MIF_NONE = $00000000;
  MIF_REQUEST_LAUNCH = $00000001;
  MIF_REQUEST_IP = $00000004;
  MIF_PROVIDE_IP = $00000008;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0010
type
  __MIDL___MIDL_itf_mdisp_0000_0010 = TOleEnum;
const
  MSGR_E_CONNECT = $81000301;
  MSGR_E_INVALID_SERVER_NAME = $81000302;
  MSGR_E_INVALID_PASSWORD = $81000303;
  MSGR_E_ALREADY_LOGGED_ON = $81000304;
  MSGR_E_SERVER_VERSION = $81000305;
  MSGR_E_LOGON_TIMEOUT = $81000306;
  MSGR_E_LIST_FULL = $81000307;
  MSGR_E_AI_REJECT = $81000308;
  MSGR_E_AI_REJECT_NOT_INST = $81000309;
  MSGR_E_USER_NOT_FOUND = $8100030A;
  MSGR_E_ALREADY_IN_LIST = $8100030B;
  MSGR_E_DISCONNECTED = $8100030C;
  MSGR_E_UNEXPECTED = $8100030D;
  MSGR_E_SERVER_TOO_BUSY = $8100030E;
  MSGR_E_INVALID_AUTH_PACKAGES = $8100030F;
  MSGR_E_NEWER_CLIENT_AVAILABLE = $81000310;
  MSGR_E_AI_TIMEOUT = $81000311;
  MSGR_E_CANCEL = $81000312;
  MSGR_E_TOO_MANY_MATCHES = $81000313;
  MSGR_E_SERVER_UNAVAILABLE = $81000314;
  MSGR_E_LOGON_UI_ACTIVE = $81000315;
  MSGR_E_OPTION_UI_ACTIVE = $81000316;
  MSGR_E_CONTACT_UI_ACTIVE = $81000317;
  MSGR_E_PRIMARY_SERVICE_NOT_LOGGED_ON = $81000318;
  MSGR_E_LOGGED_ON = $81000319;
  MSGR_E_CONNECT_PROXY = $8100031A;
  MSGR_E_PROXY_AUTH = $8100031B;
  MSGR_E_PROXY_AUTH_TYPE = $8100031C;
  MSGR_E_INVALID_PROXY_NAME = $8100031D;
  MSGR_E_NOT_LOGGED_ON = $8100031E;
  MSGR_E_NOT_PRIMARY_SERVICE = $81000320;
  MSGR_E_TOO_MANY_SESSIONS = $81000321;
  MSGR_E_TOO_MANY_MESSAGES = $81000322;
  MSGR_E_REMOTE_LOGIN = $81000323;
  MSGR_E_INVALID_FRIENDLY_NAME = $81000324;
  MSGR_E_SESSION_FULL = $81000325;
  MSGR_E_NOT_ALLOWING_NEW_USERS = $81000326;
  MSGR_E_INVALID_DOMAIN = $81000327;
  MSGR_E_TCP_ERROR = $81000328;
  MSGR_E_SESSION_TIMEOUT = $81000329;
  MSGR_E_MULTIPOINT_SESSION_BEGIN_TIMEOUT = $8100032A;
  MSGR_E_MULTIPOINT_SESSION_END_TIMEOUT = $8100032B;
  MSGR_E_REVERSE_LIST_FULL = $8100032C;
  MSGR_E_SERVER_ERROR = $8100032D;
  MSGR_E_SYSTEM_CONFIG = $8100032E;
  MSGR_E_NO_DIRECTORY = $8100032F;
  MSGR_E_RETRY_SET = $81000330;
  MSGR_E_CHILD_WITHOUT_CONSENT = $81000331;
  MSGR_E_USER_CANCELLED = $81000332;
  MSGR_E_CANCEL_BEFORE_CONNECT = $81000333;
  MSGR_E_VOICE_IM_TIMEOUT = $81000334;
  MSGR_E_NOT_ACCEPTING_PAGES = $81000335;
  MSGR_E_EMAIL_PASSPORT_NOT_VALIDATED = $81000336;
  MSGR_E_AUDIO_UI_ACTIVE = $81000337;
  MSGR_E_NO_HARDWARE = $81000338;
  MSGR_E_PAGING_UNAVAILABLE = $81000339;
  MSGR_E_PHONE_INVALID_NUMBER = $8100033A;
  MSGR_E_PHONE_NO_FUNDS = $8100033B;
  MSGR_E_VOICE_NO_ANSWER = $8100033C;
  MSGR_E_VOICE_WAVEIN_DEVICE = $8100033D;
  MSGR_E_FT_TIMEOUT = $8100033E;
  MSGR_E_MESSAGE_TOO_LONG = $8100033F;
  MSGR_E_VOICE_FIREWALL = $81000340;
  MSGR_E_VOICE_NETCONN = $81000341;
  MSGR_E_PHONE_CIRCUITS_BUSY = $81000342;
  MSGR_E_SERVER_PROTOCOL = $81000343;
  MSGR_E_UNAVAILABLE_VIA_HTTP = $81000344;
  MSGR_E_PHONE_INVALID_PIN = $81000345;
  MSGR_E_PHONE_PINPROCEED_TIMEOUT = $81000346;
  MSGR_E_SERVER_SHUTDOWN = $81000347;
  MSGR_E_CLIENT_DISALLOWED = $81000348;
  MSGR_E_PHONE_CALL_NOT_COMPLETE = $81000349;
  MSGR_E_GROUPS_NOT_ENABLED = $8100034A;
  MSGR_E_GROUP_ALREADY_EXISTS = $8100034B;
  MSGR_E_TOO_MANY_GROUPS = $8100034C;
  MSGR_E_GROUP_DOES_NOT_EXIST = $8100034D;
  MSGR_E_USER_NOT_GROUP_MEMBER = $8100034E;
  MSGR_E_GROUP_NAME_TOO_LONG = $8100034F;
  MSGR_E_GROUP_NOT_EMPTY = $81000350;
  MSGR_E_BAD_GROUP_NAME = $81000351;
  MSGR_E_PHONESERVICE_UNAVAILABLE = $81000352;
  MSGR_E_CANNOT_RENAME = $81000353;
  MSGR_E_CANNOT_DELETE = $81000354;
  MSGR_E_INVALID_SERVICE = $81000355;
  MSGR_E_POLICY_RESTRICTED = $81000356;
  MSGR_E_BUSY = $81000357;
  MSGR_E_DNS_SRV_FAIL = $81000358;
  MSGR_E_DNS_A_RES_FAIL = $81000359;
  MSGR_E_NO_SERVER_ADDRESS_SPECIFIED = $81000360;
  MSGR_E_TLS_FAIL = $81000361;
  MSGR_E_INCOMPATIBLE_ENCRYPTION = $81000362;
  MSGR_E_SSL_TUNNEL_FAILED = $81000363;
  MSGR_E_SIP_TIMEOUT = $81000364;
  MSGR_E_INCOMPATIBLE_IM = $81000365;
  MSGR_E_MIM_ADD_TO_CONTACTS_FAIL = $81000366;
  MSGR_E_INVALID_ADDRESS_FORMAT = $81000367;
  MSGR_E_INVALID_CERTIFICATE = $81000368;
  MSGR_E_AUTH_TIME_SKEW = $81000369;
  MSGR_E_CHANGED_CREDENTIALS = $81000370;
  MSGR_E_SIP_LOGIN_FORBIDDEN = $81000371;
  MSGR_E_SIP_HIGH_SECURITY_SET_TLS = $81000372;
  MSGR_E_CALLEE_INSUFFICIENT_SECURITY_LEVEL = $81000373;
  MSGR_E_CALLER_PEER2PEER_CALLS_NOT_ALLOWED = $81000374;
  MSGR_E_SIP_UDP_UNSUPPORTED = $81000375;
  MSGR_E_SIP_SEARCH_FORBIDDEN = $81000376;
  MSGR_E_SESSION_RESTRICTED = $81000380;
  MSGR_E_MANAGED_USER_INVALID_CVR = $81000381;
  MSGR_E_RESTRICTED_USER = $81000382;
  MSGR_E_PROXY_AUTH_REQUIRED = $81000383;
  MSGR_E_PROXY_REALM_MISMATCH = $81000384;
  MSGR_E_PROXY_PASSWORD_INCORRECT = $81000385;
  MSGR_E_RESTRICTED_USER_LOGON_RESTRICED = $81000386;
  MSGR_E_IE_OFFLINE = $81000387;
  MSGR_E_IE_CANT_CONNECT = $81000388;
  MSGR_E_ACCOUNT_ERROR_REDIRECT = $81000389;
  MSGR_S_ALREADY_IN_THE_MODE = $01000301;
  MSGR_S_TRANSFER_SEND_BEGUN = $01000302;
  MSGR_S_TRANSFER_SEND_FINISHED = $01000303;
  MSGR_S_TRANSFER_RECEIVE_BEGUN = $01000304;
  MSGR_S_TRANSFER_RECEIVE_FINISHED = $01000305;
  MSGR_S_GROUP_ALREADY_EXISTS = $01000306;
  MSGR_E_FAIL = $80004005;
  MSGR_S_OK = $00000000;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0014
type
  __MIDL___MIDL_itf_mdisp_0000_0014 = TOleEnum;
const
  MUSERPROP_INVALID_PROPERTY = $FFFFFFFF;
  MUSERPROP_HOME_PHONE_NUMBER = $00000000;
  MUSERPROP_WORK_PHONE_NUMBER = $00000001;
  MUSERPROP_MOBILE_PHONE_NUMBER = $00000002;
  MUSERPROP_PAGES_ALLOWED = $00000003;
  MUSERPROP_NUMBER_OF_PUBLIC_PROPERTIES = $00000004;
  MUSERPROP_PAGES_ENABLED = $00000004;
  MUSERPROP_MOBILE_ONLINE = $00000005;
  MUSERPROP_MSN8_USER = $00000006;
  MUSERPROP_RENDERS_GIF = $00000007;
  MUSERPROP_RENDERS_ISF = $00000008;
  MUSERPROP_SUPPORTS_CHUNKING = $00000009;
  MUSERPROP_NUMBER_OF_PROPERTIES = $0000000A;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0015
type
  __MIDL___MIDL_itf_mdisp_0000_0015 = TOleEnum;
const
  MLOPT_MAX_SERVICE_STRING = $000000FF;
  MLOPT_MAX_PROXY_STRING = $000000FF;
  MLOPT_MAX_PORT_NUMBER = $0000FFFF;
  MLOPT_MAX_IDLE_THRESHOLD = $000003E7;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0016
type
  __MIDL___MIDL_itf_mdisp_0000_0016 = TOleEnum;
const
  MPROXYTYPE_NO_PROXY = $00000000;
  MPROXYTYPE_SOCKS4 = $00000001;
  MPROXYTYPE_SOCKS5 = $00000002;
  MPROXYTYPE_HTTPS = $00000003;
  MPROXYTYPE_HTTP = $00000004;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0017
type
  __MIDL___MIDL_itf_mdisp_0000_0017 = TOleEnum;
const
  MCONNECTIONTYPE_DISCONNECTED = $00000000;
  MCONNECTIONTYPE_DIRECT = $00000001;
  MCONNECTIONTYPE_BROWSER_PROXY = $00000002;
  MCONNECTIONTYPE_HTTP_PROXY = $00000003;
  MCONNECTIONTYPE_SOCKS_PROXY = $00000004;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0019
type
  __MIDL___MIDL_itf_mdisp_0000_0019 = TOleEnum;
const
  MSF_PRIMARY = $00000001;
  MSF_APP_INVITE = $00000002;
  MSF_MULTI_IM = $00000004;
  MSF_BLOCKING = $00000008;
  MSF_UNAME_IN_EMAIL_FMT = $00000010;
  MSF_LOCAL_LISTS = $00000020;
  MSF_FIND_USER = $00000040;
  MSF_INVITE_MAIL = $00000080;
  MSF_INTERNET = $00000100;
  MSF_NO_ALLOW_LIST = $00000200;
  MSF_PAGING = $00000400;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0020
type
  __MIDL___MIDL_itf_mdisp_0000_0020 = TOleEnum;
const
  MFT_SAVE_PASSWORD = $00000000;
  MFT_DONT_SAVE_PASSWORD = $00000001;
  MFT_OVERWRITE_EXISTING = $00000002;

// Constants for enum __MIDL___MIDL_itf_mdisp_0000_0022
type
  __MIDL___MIDL_itf_mdisp_0000_0022 = TOleEnum;
const
  MFTF_SENDING = $00000004;
  MFTF_RECEIVING = $00000008;
  MFTF_CONNECTING = $00000010;
  MFTF_CONNECTED = $00000020;
  MFTF_DISCONNECTED = $00000040;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMsgrObject = interface;
  IMsgrObjectDisp = dispinterface;
  IMsgrService = interface;
  IMsgrServiceDisp = dispinterface;
  IMsgrUser = interface;
  IMsgrUserDisp = dispinterface;
  IMsgrUsers = interface;
  IMsgrUsersDisp = dispinterface;
  IMsgrIMSessions = interface;
  IMsgrIMSessionsDisp = dispinterface;
  IMsgrIMSession = interface;
  IMsgrIMSessionDisp = dispinterface;
  IMsgrServices = interface;
  IMsgrServicesDisp = dispinterface;
  IMessengerApp = interface;
  IMessengerAppDisp = dispinterface;
  IMessengerIMWindow = interface;
  IMessengerIMWindowDisp = dispinterface;
  IMessengerIMWindows = interface;
  IMessengerIMWindowsDisp = dispinterface;
  IMsgrObject2 = interface;
  IMsgrObject2Disp = dispinterface;
  DMsgrObjectEvents = dispinterface;
  IMsgrUser2 = interface;
  IMsgrUser2Disp = dispinterface;
  IMessengerApp2 = interface;
  IMessengerApp2Disp = dispinterface;
  IMessengerApp3 = interface;
  IMessengerApp3Disp = dispinterface;
  IMsgrSP = interface;
  IMsgrSP2 = interface;
  IMsgrWebScriptManager = interface;
  IMsgrWebScriptManagerDisp = dispinterface;
  IMsgrPassportClient = interface;
  IMsgrPassportClientDisp = dispinterface;
  IMsgrHost = interface;
  IMsgrHostDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MsgrObject = IMsgrObject2;
  MessengerApp = IMessengerApp3;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  MSVCSTATUS = __MIDL___MIDL_itf_mdisp_0000_0021; 
  MURLTYPE = __MIDL___MIDL_itf_mdisp_0000_0004; 
  MPFLFIELD = __MIDL___MIDL_itf_mdisp_0000_0009; 
  MSTATE = __MIDL___MIDL_itf_mdisp_0000_0001; 
  MMSGTYPE = __MIDL___MIDL_itf_mdisp_0000_0006; 
  MLIST = __MIDL___MIDL_itf_mdisp_0000_0005; 
  MMSGPRIVACY = __MIDL___MIDL_itf_mdisp_0000_0003; 
  MPROMPT = __MIDL___MIDL_itf_mdisp_0000_0002; 
  MLOCALOPTION = __MIDL___MIDL_itf_mdisp_0000_0013; 
  SSTATE = __MIDL___MIDL_itf_mdisp_0000_0011; 
  MFOLDER = __MIDL___MIDL_itf_mdisp_0000_0012; 
  MOPTDLGPAGE = __MIDL___MIDL_itf_mdisp_0000_0018; 
  MUPDATE_FLAGS = __MIDL___MIDL_itf_mdisp_0000_0007; 
  MINVITE_FLAGS = __MIDL___MIDL_itf_mdisp_0000_0008; 
  MSGRConstants = __MIDL___MIDL_itf_mdisp_0000_0010; 
  MUSERPROPERTY = __MIDL___MIDL_itf_mdisp_0000_0014; 
  MLOCALOPTION_LIMITS = __MIDL___MIDL_itf_mdisp_0000_0015; 
  MPROXYTYPE = __MIDL___MIDL_itf_mdisp_0000_0016; 
  MCONNECTIONTYPE = __MIDL___MIDL_itf_mdisp_0000_0017; 
  MSERVICE_FLAGS = __MIDL___MIDL_itf_mdisp_0000_0019; 
  MFIRSTTIME_FLAGS = __MIDL___MIDL_itf_mdisp_0000_0020; 
  MFILETRANSFER_FLAGS = __MIDL___MIDL_itf_mdisp_0000_0022; 

// *********************************************************************//
// Interface: IMsgrObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB451-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrObject = interface(IDispatch)
    ['{218CB451-20B6-11D2-8E17-0000F803A446}']
    function CreateUser(const bstrLogonName: WideString; const pService: IMsgrService): IMsgrUser; safecall;
    procedure Logon(const bstrUser: WideString; const bstrPassword: WideString; 
                    const pService: IMsgrService); safecall;
    procedure Logoff; safecall;
    function Get_List(MLIST: MLIST): IMsgrUsers; safecall;
    function Get_LocalLogonName: WideString; safecall;
    function Get_LocalFriendlyName: WideString; safecall;
    procedure Set_LocalState(pmState: MSTATE); safecall;
    function Get_LocalState: MSTATE; safecall;
    procedure Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY); safecall;
    function Get_MessagePrivacy: MMSGPRIVACY; safecall;
    procedure Set_Prompt(pmpSetting: MPROMPT); safecall;
    function Get_Prompt: MPROMPT; safecall;
    function SendAppInvite(const pUser: IMsgrUser; lCookie: Integer; const bstrAppGUID: WideString; 
                           const bstrAppName: WideString; const bstrAppURL: WideString; 
                           lInviteType: Integer; mmtType: MMSGTYPE): Integer; safecall;
    function SendAppInviteAccept(const pUser: IMsgrUser; lCookie: Integer; lInviteType: Integer; 
                                 mmtType: MMSGTYPE): Integer; safecall;
    function SendAppInviteCancel(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                 mmtType: MMSGTYPE): Integer; safecall;
    procedure Set_LocalOption(option: MLOCALOPTION; pvSetting: OleVariant); safecall;
    function Get_LocalOption(option: MLOCALOPTION): OleVariant; safecall;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer; safecall;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer; safecall;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer; safecall;
    function Get_IMSessions: IMsgrIMSessions; safecall;
    function CreateIMSession(vUser: OleVariant): IMsgrIMSession; safecall;
    procedure SessionRequestAccept(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); safecall;
    procedure SessionRequestCancel(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); safecall;
    function Get_Services: IMsgrServices; safecall;
    function Get_UnreadEmail(MFOLDER: MFOLDER): Integer; safecall;
    property List[MLIST: MLIST]: IMsgrUsers read Get_List;
    property LocalLogonName: WideString read Get_LocalLogonName;
    property LocalFriendlyName: WideString read Get_LocalFriendlyName;
    property LocalState: MSTATE read Get_LocalState write Set_LocalState;
    property MessagePrivacy: MMSGPRIVACY read Get_MessagePrivacy write Set_MessagePrivacy;
    property Prompt: MPROMPT read Get_Prompt write Set_Prompt;
    property LocalOption[option: MLOCALOPTION]: OleVariant read Get_LocalOption write Set_LocalOption;
    property IMSessions: IMsgrIMSessions read Get_IMSessions;
    property Services: IMsgrServices read Get_Services;
    property UnreadEmail[MFOLDER: MFOLDER]: Integer read Get_UnreadEmail;
  end;

// *********************************************************************//
// DispIntf:  IMsgrObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB451-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrObjectDisp = dispinterface
    ['{218CB451-20B6-11D2-8E17-0000F803A446}']
    function CreateUser(const bstrLogonName: WideString; const pService: IMsgrService): IMsgrUser; dispid 100;
    procedure Logon(const bstrUser: WideString; const bstrPassword: WideString; 
                    const pService: IMsgrService); dispid 104;
    procedure Logoff; dispid 105;
    property List[MLIST: MLIST]: IMsgrUsers readonly dispid 1610743811;
    property LocalLogonName: WideString readonly dispid 1610743812;
    property LocalFriendlyName: WideString readonly dispid 1610743813;
    property LocalState: MSTATE dispid 1610743814;
    property MessagePrivacy: MMSGPRIVACY dispid 1610743816;
    property Prompt: MPROMPT dispid 1610743818;
    function SendAppInvite(const pUser: IMsgrUser; lCookie: Integer; const bstrAppGUID: WideString; 
                           const bstrAppName: WideString; const bstrAppURL: WideString; 
                           lInviteType: Integer; mmtType: MMSGTYPE): Integer; dispid 108;
    function SendAppInviteAccept(const pUser: IMsgrUser; lCookie: Integer; lInviteType: Integer; 
                                 mmtType: MMSGTYPE): Integer; dispid 109;
    function SendAppInviteCancel(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                 mmtType: MMSGTYPE): Integer; dispid 110;
    property LocalOption[option: MLOCALOPTION]: OleVariant dispid 1610743823;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer; dispid 111;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer; dispid 112;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer; dispid 113;
    property IMSessions: IMsgrIMSessions readonly dispid 1610743828;
    function CreateIMSession(vUser: OleVariant): IMsgrIMSession; dispid 114;
    procedure SessionRequestAccept(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); dispid 115;
    procedure SessionRequestCancel(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); dispid 116;
    property Services: IMsgrServices readonly dispid 1610743832;
    property UnreadEmail[MFOLDER: MFOLDER]: Integer readonly dispid 1610743833;
  end;

// *********************************************************************//
// Interface: IMsgrService
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {659ECAD9-A5C0-11D2-A440-00C04F795683}
// *********************************************************************//
  IMsgrService = interface(IDispatch)
    ['{659ECAD9-A5C0-11D2-A440-00C04F795683}']
    function Get_ServiceName: WideString; safecall;
    function Get_LogonName: WideString; safecall;
    procedure Set_FriendlyName(const pbstrName: WideString); safecall;
    function Get_FriendlyName: WideString; safecall;
    function Get_Capabilities: Integer; safecall;
    function Get_Status: MSVCSTATUS; safecall;
    procedure Logoff; safecall;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer; safecall;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer; safecall;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer; safecall;
    procedure Set_ProfileField(MPFLFIELD: MPFLFIELD; pvFieldValue: OleVariant); safecall;
    function Get_ProfileField(MPFLFIELD: MPFLFIELD): OleVariant; safecall;
    property ServiceName: WideString read Get_ServiceName;
    property LogonName: WideString read Get_LogonName;
    property FriendlyName: WideString read Get_FriendlyName write Set_FriendlyName;
    property Capabilities: Integer read Get_Capabilities;
    property Status: MSVCSTATUS read Get_Status;
    property ProfileField[MPFLFIELD: MPFLFIELD]: OleVariant read Get_ProfileField write Set_ProfileField;
  end;

// *********************************************************************//
// DispIntf:  IMsgrServiceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {659ECAD9-A5C0-11D2-A440-00C04F795683}
// *********************************************************************//
  IMsgrServiceDisp = dispinterface
    ['{659ECAD9-A5C0-11D2-A440-00C04F795683}']
    property ServiceName: WideString readonly dispid 1610743808;
    property LogonName: WideString readonly dispid 1610743809;
    property FriendlyName: WideString dispid 1610743810;
    property Capabilities: Integer readonly dispid 1610743812;
    property Status: MSVCSTATUS readonly dispid 1610743813;
    procedure Logoff; dispid 1610743814;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer; dispid 1610743815;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer; dispid 1610743816;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer; dispid 1610743817;
    property ProfileField[MPFLFIELD: MPFLFIELD]: OleVariant dispid 1610743818;
  end;

// *********************************************************************//
// Interface: IMsgrUser
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB453-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUser = interface(IDispatch)
    ['{218CB453-20B6-11D2-8E17-0000F803A446}']
    procedure Set_FriendlyName(const pbstrFriendlyName: WideString); safecall;
    function Get_FriendlyName: WideString; safecall;
    function Get_EmailAddress: WideString; safecall;
    function Get_State: MSTATE; safecall;
    function Get_LogonName: WideString; safecall;
    function SendText(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                      mmtType: MMSGTYPE): Integer; safecall;
    function Get_Service: IMsgrService; safecall;
    property FriendlyName: WideString read Get_FriendlyName write Set_FriendlyName;
    property EmailAddress: WideString read Get_EmailAddress;
    property State: MSTATE read Get_State;
    property LogonName: WideString read Get_LogonName;
    property Service: IMsgrService read Get_Service;
  end;

// *********************************************************************//
// DispIntf:  IMsgrUserDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB453-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUserDisp = dispinterface
    ['{218CB453-20B6-11D2-8E17-0000F803A446}']
    property FriendlyName: WideString dispid 1610743808;
    property EmailAddress: WideString readonly dispid 1610743810;
    property State: MSTATE readonly dispid 1610743811;
    property LogonName: WideString readonly dispid 1610743812;
    function SendText(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                      mmtType: MMSGTYPE): Integer; dispid 101;
    property Service: IMsgrService readonly dispid 1610743814;
  end;

// *********************************************************************//
// Interface: IMsgrUsers
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB454-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUsers = interface(IDispatch)
    ['{218CB454-20B6-11D2-8E17-0000F803A446}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IMsgrUser; safecall;
    procedure Add(const pUser: IMsgrUser); safecall;
    procedure Remove(const pUser: IMsgrUser); safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IMsgrUsersDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB454-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUsersDisp = dispinterface
    ['{218CB454-20B6-11D2-8E17-0000F803A446}']
    property Count: Integer readonly dispid 1610743808;
    function Item(Index: Integer): IMsgrUser; dispid 0;
    procedure Add(const pUser: IMsgrUser); dispid 100;
    procedure Remove(const pUser: IMsgrUser); dispid 101;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMsgrIMSessions
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6FD143E6-20A5-11D2-91AD-0000F81FEFC9}
// *********************************************************************//
  IMsgrIMSessions = interface(IDispatch)
    ['{6FD143E6-20A5-11D2-91AD-0000F81FEFC9}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IMsgrIMSession; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IMsgrIMSessionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6FD143E6-20A5-11D2-91AD-0000F81FEFC9}
// *********************************************************************//
  IMsgrIMSessionsDisp = dispinterface
    ['{6FD143E6-20A5-11D2-91AD-0000F81FEFC9}']
    property Count: Integer readonly dispid 1610743808;
    function Item(Index: Integer): IMsgrIMSession; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMsgrIMSession
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {82E11592-20F5-11D2-91AD-0000F81FEFC9}
// *********************************************************************//
  IMsgrIMSession = interface(IDispatch)
    ['{82E11592-20F5-11D2-91AD-0000F81FEFC9}']
    function Get_Members: IMsgrUsers; safecall;
    function Get_State: SSTATE; safecall;
    function Get_Service: IMsgrService; safecall;
    function Get_Invitees: IMsgrUsers; safecall;
    procedure LeaveSession; safecall;
    procedure InviteUser(vUser: OleVariant); safecall;
    function SendText(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                      mmtType: MMSGTYPE): Integer; safecall;
    property Members: IMsgrUsers read Get_Members;
    property State: SSTATE read Get_State;
    property Service: IMsgrService read Get_Service;
    property Invitees: IMsgrUsers read Get_Invitees;
  end;

// *********************************************************************//
// DispIntf:  IMsgrIMSessionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {82E11592-20F5-11D2-91AD-0000F81FEFC9}
// *********************************************************************//
  IMsgrIMSessionDisp = dispinterface
    ['{82E11592-20F5-11D2-91AD-0000F81FEFC9}']
    property Members: IMsgrUsers readonly dispid 1610743808;
    property State: SSTATE readonly dispid 1610743809;
    property Service: IMsgrService readonly dispid 1610743810;
    property Invitees: IMsgrUsers readonly dispid 1610743811;
    procedure LeaveSession; dispid 100;
    procedure InviteUser(vUser: OleVariant); dispid 101;
    function SendText(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                      mmtType: MMSGTYPE): Integer; dispid 102;
  end;

// *********************************************************************//
// Interface: IMsgrServices
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {659ECAD8-A5C0-11D2-A440-00C04F795683}
// *********************************************************************//
  IMsgrServices = interface(IDispatch)
    ['{659ECAD8-A5C0-11D2-A440-00C04F795683}']
    procedure Set_PrimaryService(const ppService: IMsgrService); safecall;
    function Get_PrimaryService: IMsgrService; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IMsgrService; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property PrimaryService: IMsgrService read Get_PrimaryService write Set_PrimaryService;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IMsgrServicesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {659ECAD8-A5C0-11D2-A440-00C04F795683}
// *********************************************************************//
  IMsgrServicesDisp = dispinterface
    ['{659ECAD8-A5C0-11D2-A440-00C04F795683}']
    property PrimaryService: IMsgrService dispid 1610743808;
    property Count: Integer readonly dispid 1610743810;
    function Item(Index: Integer): IMsgrService; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMessengerApp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F3A614DD-ABE0-11D2-A441-00C04F795683}
// *********************************************************************//
  IMessengerApp = interface(IDispatch)
    ['{F3A614DD-ABE0-11D2-A441-00C04F795683}']
    function Get_Application: IDispatch; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Quit; safecall;
    function Get_Name: WideString; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Path: WideString; safecall;
    procedure LaunchLogonUI; safecall;
    procedure LaunchOptionsUI(MOPTDLGPAGE: MOPTDLGPAGE); safecall;
    procedure LaunchAddContactUI(const bstrEMail: WideString); safecall;
    procedure LaunchFindContactUI(const bstrFirstName: WideString; const bstrLastName: WideString; 
                                  vbstrCity: OleVariant; vbstrState: OleVariant; 
                                  vbstrCountry: OleVariant); safecall;
    function LaunchIMUI(vUser: OleVariant): IMessengerIMWindow; safecall;
    function Get_IMWindows: IMessengerIMWindows; safecall;
    function Get_ToolBar: WordBool; safecall;
    procedure Set_ToolBar(pBoolToolBar: WordBool); safecall;
    function Get_StatusBar: WordBool; safecall;
    procedure Set_StatusBar(pBoolStatusBar: WordBool); safecall;
    function Get_StatusText: WideString; safecall;
    procedure Set_StatusText(const pbstrStatusText: WideString); safecall;
    function Get_HWND: Integer; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(plLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(plTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(plWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(plHeight: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pBoolVisible: WordBool); safecall;
    procedure AutoLogon; safecall;
    procedure Set_FirstTimeCredentials(const bstrUser: WideString; const bstrPassword: WideString; 
                                       const pService: IMsgrService; Param4: Integer); safecall;
    procedure Set_CachedPassword(const bstrUser: WideString; const bstrPassword: WideString; 
                                 const pService: IMsgrService; Param4: WordBool); safecall;
    procedure RequestURLPost(muType: MURLTYPE; vbstrAdditionalInfo: OleVariant); safecall;
    procedure Set_TaskbarIcon(pBoolVisible: WordBool); safecall;
    function Get_TaskbarIcon: WordBool; safecall;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property IMWindows: IMessengerIMWindows read Get_IMWindows;
    property ToolBar: WordBool read Get_ToolBar write Set_ToolBar;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property HWND: Integer read Get_HWND;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property FirstTimeCredentials[const bstrUser: WideString; const bstrPassword: WideString; 
                                  const pService: IMsgrService]: Integer write Set_FirstTimeCredentials;
    property CachedPassword[const bstrUser: WideString; const bstrPassword: WideString; 
                            const pService: IMsgrService]: WordBool write Set_CachedPassword;
    property TaskbarIcon: WordBool read Get_TaskbarIcon write Set_TaskbarIcon;
  end;

// *********************************************************************//
// DispIntf:  IMessengerAppDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F3A614DD-ABE0-11D2-A441-00C04F795683}
// *********************************************************************//
  IMessengerAppDisp = dispinterface
    ['{F3A614DD-ABE0-11D2-A441-00C04F795683}']
    property Application: IDispatch readonly dispid 1610743808;
    property Parent: IDispatch readonly dispid 1610743809;
    procedure Quit; dispid 100;
    property Name: WideString readonly dispid 1610743811;
    property FullName: WideString readonly dispid 1610743812;
    property Path: WideString readonly dispid 1610743813;
    procedure LaunchLogonUI; dispid 200;
    procedure LaunchOptionsUI(MOPTDLGPAGE: MOPTDLGPAGE); dispid 201;
    procedure LaunchAddContactUI(const bstrEMail: WideString); dispid 202;
    procedure LaunchFindContactUI(const bstrFirstName: WideString; const bstrLastName: WideString; 
                                  vbstrCity: OleVariant; vbstrState: OleVariant; 
                                  vbstrCountry: OleVariant); dispid 203;
    function LaunchIMUI(vUser: OleVariant): IMessengerIMWindow; dispid 210;
    property IMWindows: IMessengerIMWindows readonly dispid 1610743819;
    property ToolBar: WordBool dispid 1610743820;
    property StatusBar: WordBool dispid 1610743822;
    property StatusText: WideString dispid 1610743824;
    property HWND: Integer readonly dispid 1610743826;
    property Left: Integer dispid 1610743827;
    property Top: Integer dispid 1610743829;
    property Width: Integer dispid 1610743831;
    property Height: Integer dispid 1610743833;
    property Visible: WordBool dispid 1610743835;
    procedure AutoLogon; dispid 222;
    property FirstTimeCredentials[const bstrUser: WideString; const bstrPassword: WideString; 
                                  const pService: IMsgrService]: Integer writeonly dispid 1610743838;
    property CachedPassword[const bstrUser: WideString; const bstrPassword: WideString; 
                            const pService: IMsgrService]: WordBool writeonly dispid 1610743839;
    procedure RequestURLPost(muType: MURLTYPE; vbstrAdditionalInfo: OleVariant); dispid 223;
    property TaskbarIcon: WordBool dispid 224;
  end;

// *********************************************************************//
// Interface: IMessengerIMWindow
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35EDD1CD-1A8C-11D2-B49D-00C04FB90376}
// *********************************************************************//
  IMessengerIMWindow = interface(IDispatch)
    ['{35EDD1CD-1A8C-11D2-B49D-00C04FB90376}']
    function Get_Application: IDispatch; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_IMSession: IMsgrIMSession; safecall;
    function Get_History: WideString; safecall;
    procedure SendText(const bstrSendText: WideString); safecall;
    procedure Close; safecall;
    function Get_ToolBar: WordBool; safecall;
    procedure Set_ToolBar(pBoolToolBar: WordBool); safecall;
    function Get_StatusBar: WordBool; safecall;
    procedure Set_StatusBar(pBoolStatusBar: WordBool); safecall;
    function Get_StatusText: WideString; safecall;
    procedure Set_StatusText(const pbstrStatusText: WideString); safecall;
    function Get_HWND: Integer; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(plLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(plTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(plWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(plHeight: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pBoolVisible: WordBool); safecall;
    function Get_Members: IMsgrUsers; safecall;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property IMSession: IMsgrIMSession read Get_IMSession;
    property History: WideString read Get_History;
    property ToolBar: WordBool read Get_ToolBar write Set_ToolBar;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property HWND: Integer read Get_HWND;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Members: IMsgrUsers read Get_Members;
  end;

// *********************************************************************//
// DispIntf:  IMessengerIMWindowDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35EDD1CD-1A8C-11D2-B49D-00C04FB90376}
// *********************************************************************//
  IMessengerIMWindowDisp = dispinterface
    ['{35EDD1CD-1A8C-11D2-B49D-00C04FB90376}']
    property Application: IDispatch readonly dispid 1610743808;
    property Parent: IDispatch readonly dispid 1610743809;
    property IMSession: IMsgrIMSession readonly dispid 1610743810;
    property History: WideString readonly dispid 1610743811;
    procedure SendText(const bstrSendText: WideString); dispid 300;
    procedure Close; dispid 301;
    property ToolBar: WordBool dispid 1610743814;
    property StatusBar: WordBool dispid 1610743816;
    property StatusText: WideString dispid 1610743818;
    property HWND: Integer readonly dispid 1610743820;
    property Left: Integer dispid 1610743821;
    property Top: Integer dispid 1610743823;
    property Width: Integer dispid 1610743825;
    property Height: Integer dispid 1610743827;
    property Visible: WordBool dispid 1610743829;
    property Members: IMsgrUsers readonly dispid 1610743831;
  end;

// *********************************************************************//
// Interface: IMessengerIMWindows
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35EDD1CC-1A8C-11D2-B49D-00C04FB90376}
// *********************************************************************//
  IMessengerIMWindows = interface(IDispatch)
    ['{35EDD1CC-1A8C-11D2-B49D-00C04FB90376}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IMessengerIMWindow; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IMessengerIMWindowsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35EDD1CC-1A8C-11D2-B49D-00C04FB90376}
// *********************************************************************//
  IMessengerIMWindowsDisp = dispinterface
    ['{35EDD1CC-1A8C-11D2-B49D-00C04FB90376}']
    property Count: Integer readonly dispid 1610743808;
    function Item(Index: Integer): IMessengerIMWindow; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMsgrObject2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB455-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrObject2 = interface(IMsgrObject)
    ['{218CB455-20B6-11D2-8E17-0000F803A446}']
    function SendFileTransferInvite(const pUser: IMsgrUser; lCookie: Integer; 
                                    const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer; safecall;
    function SendFileTransferInviteAccept(const pUser: IMsgrUser; lCookie: Integer; 
                                          const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer; safecall;
    function SendFileTransferInviteCancel(const pUser: IMsgrUser; lCookie: Integer; 
                                          hrReason: Integer; mmtType: MMSGTYPE): Integer; safecall;
    function CancelFileTransfer(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                mmtType: MMSGTYPE): Integer; safecall;
    procedure FileTransferStatus(lCookie: Integer; const pUser: IMsgrUser; out plStatus: Integer; 
                                 out pbstrFilePath: WideString; out plTotalBytes: Integer; 
                                 out plBytesTransferred: Integer); safecall;
    procedure Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant); safecall;
    function Get_LocalProperty(ePropType: MUSERPROPERTY): OleVariant; safecall;
    function SendPage(const pUser: IMsgrUser; const bstrMessage: WideString; 
                      ePhoneType: MUSERPROPERTY): Integer; safecall;
    function SendCustomInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                  lFindIndex: Integer; lLCID: Integer; 
                                  const bstrCustomText: WideString): Integer; safecall;
    property LocalProperty[ePropType: MUSERPROPERTY]: OleVariant read Get_LocalProperty write Set_LocalProperty;
  end;

// *********************************************************************//
// DispIntf:  IMsgrObject2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB455-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrObject2Disp = dispinterface
    ['{218CB455-20B6-11D2-8E17-0000F803A446}']
    function SendFileTransferInvite(const pUser: IMsgrUser; lCookie: Integer; 
                                    const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer; dispid 117;
    function SendFileTransferInviteAccept(const pUser: IMsgrUser; lCookie: Integer; 
                                          const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer; dispid 118;
    function SendFileTransferInviteCancel(const pUser: IMsgrUser; lCookie: Integer; 
                                          hrReason: Integer; mmtType: MMSGTYPE): Integer; dispid 119;
    function CancelFileTransfer(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                mmtType: MMSGTYPE): Integer; dispid 120;
    procedure FileTransferStatus(lCookie: Integer; const pUser: IMsgrUser; out plStatus: Integer; 
                                 out pbstrFilePath: WideString; out plTotalBytes: Integer; 
                                 out plBytesTransferred: Integer); dispid 121;
    property LocalProperty[ePropType: MUSERPROPERTY]: OleVariant dispid 1610809349;
    function SendPage(const pUser: IMsgrUser; const bstrMessage: WideString; 
                      ePhoneType: MUSERPROPERTY): Integer; dispid 125;
    function SendCustomInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                  lFindIndex: Integer; lLCID: Integer; 
                                  const bstrCustomText: WideString): Integer; dispid 126;
    function CreateUser(const bstrLogonName: WideString; const pService: IMsgrService): IMsgrUser; dispid 100;
    procedure Logon(const bstrUser: WideString; const bstrPassword: WideString; 
                    const pService: IMsgrService); dispid 104;
    procedure Logoff; dispid 105;
    property List[MLIST: MLIST]: IMsgrUsers readonly dispid 1610743811;
    property LocalLogonName: WideString readonly dispid 1610743812;
    property LocalFriendlyName: WideString readonly dispid 1610743813;
    property LocalState: MSTATE dispid 1610743814;
    property MessagePrivacy: MMSGPRIVACY dispid 1610743816;
    property Prompt: MPROMPT dispid 1610743818;
    function SendAppInvite(const pUser: IMsgrUser; lCookie: Integer; const bstrAppGUID: WideString; 
                           const bstrAppName: WideString; const bstrAppURL: WideString; 
                           lInviteType: Integer; mmtType: MMSGTYPE): Integer; dispid 108;
    function SendAppInviteAccept(const pUser: IMsgrUser; lCookie: Integer; lInviteType: Integer; 
                                 mmtType: MMSGTYPE): Integer; dispid 109;
    function SendAppInviteCancel(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                 mmtType: MMSGTYPE): Integer; dispid 110;
    property LocalOption[option: MLOCALOPTION]: OleVariant dispid 1610743823;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer; dispid 111;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer; dispid 112;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer; dispid 113;
    property IMSessions: IMsgrIMSessions readonly dispid 1610743828;
    function CreateIMSession(vUser: OleVariant): IMsgrIMSession; dispid 114;
    procedure SessionRequestAccept(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); dispid 115;
    procedure SessionRequestCancel(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer); dispid 116;
    property Services: IMsgrServices readonly dispid 1610743832;
    property UnreadEmail[MFOLDER: MFOLDER]: Integer readonly dispid 1610743833;
  end;

// *********************************************************************//
// DispIntf:  DMsgrObjectEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {218CB452-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  DMsgrObjectEvents = dispinterface
    ['{218CB452-20B6-11D2-8E17-0000F803A446}']
    procedure OnLogonResult(hr: Integer; const pService: IMsgrService); dispid 100;
    procedure OnLogoff; dispid 101;
    procedure OnServiceLogoff(hr: Integer; const pService: IMsgrService); dispid 124;
    procedure OnListAddResult(hr: Integer; MLIST: MLIST; const pUser: IMsgrUser); dispid 102;
    procedure OnListRemoveResult(hr: Integer; MLIST: MLIST; const pUser: IMsgrUser); dispid 103;
    procedure OnMessagePrivacyChangeResult(hr: Integer; mmpSetting: MMSGPRIVACY; 
                                           const pService: IMsgrService); dispid 104;
    procedure OnPromptChangeResult(hr: Integer; mpSetting: MPROMPT; const pService: IMsgrService); dispid 105;
    procedure OnUserFriendlyNameChangeResult(hr: Integer; const pUser: IMsgrUser; 
                                             const bstrPrevFriendlyName: WideString); dispid 106;
    procedure OnUserStateChanged(const pUser: IMsgrUser; mPrevState: MSTATE; 
                                 var pfEnableDefault: WordBool); dispid 107;
    procedure OnTextReceived(const pIMSession: IMsgrIMSession; const pSourceUser: IMsgrUser; 
                             const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                             var pfEnableDefault: WordBool); dispid 108;
    procedure OnSPMessageReceived(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                                  const pService: IMsgrService); dispid 137;
    procedure OnLocalFriendlyNameChangeResult(hr: Integer; const pService: IMsgrService; 
                                              const bstrPrevFriendlyName: WideString); dispid 109;
    procedure OnLocalStateChangeResult(hr: Integer; mLocalState: MSTATE; 
                                       const pService: IMsgrService); dispid 110;
    procedure OnAppInviteReceived(const pUser: IMsgrUser; lCookie: Integer; 
                                  const bstrAppGUID: WideString; const bstrAppName: WideString; 
                                  const bstrAppURL: WideString; lInviteType: Integer; 
                                  var pfEnableDefault: WordBool); dispid 111;
    procedure OnAppInviteAccepted(const pUser: IMsgrUser; lCookie: Integer; 
                                  const bstrIPAddress: WideString; lInviteType: Integer; 
                                  var pfEnableDefault: WordBool); dispid 112;
    procedure OnAppInviteCancelled(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                   var pfEnableDefault: WordBool); dispid 113;
    procedure OnSendResult(hr: Integer; lCookie: Integer); dispid 114;
    procedure OnNewerClientAvailable(const bstrDownloadUrl: WideString; 
                                     const bstrFallbackUrl: WideString; lUpdateFlags: Integer); dispid 115;
    procedure OnFindResult(hr: Integer; lCookie: Integer; lFindIndex: Integer; 
                           lTotalResults: Integer; const bstrEmailAddress: WideString; 
                           const bstrFirstName: WideString; const bstrLastName: WideString; 
                           const bstrCity: WideString; const bstrState: WideString; 
                           const bstrCountry: WideString); dispid 116;
    procedure OnInviteMailResult(hr: Integer; lCookie: Integer); dispid 117;
    procedure OnRequestURLResult(hr: Integer; lCookie: Integer; muType: MURLTYPE; 
                                 const bstrURL: WideString); dispid 118;
    procedure OnSessionStateChange(const pIMSession: IMsgrIMSession; sPrevState: SSTATE); dispid 119;
    procedure OnUserJoin(const pIMsgrUser: IMsgrUser; const pIMSession: IMsgrIMSession); dispid 120;
    procedure OnUserLeave(const pIMsgrUser: IMsgrUser; const pIMSession: IMsgrIMSession); dispid 121;
    procedure OnUserDropped(hr: Integer; const pIMsgrUser: IMsgrUser; 
                            const pIMSession: IMsgrIMSession); dispid 128;
    procedure OnNewSessionRequest(const pRequestUser: IMsgrUser; const pIMSession: IMsgrIMSession; 
                                  var pfEnableDefault: WordBool); dispid 122;
    procedure OnInviteUser(const pIMsgrUser: IMsgrUser; const pIMSession: IMsgrIMSession; 
                           hr: Integer); dispid 123;
    procedure OnPrimaryServiceChanged(const pService: IMsgrService); dispid 125;
    procedure OnAppShutdown; dispid 126;
    procedure OnUnreadEmailChanged(MFOLDER: MFOLDER; cUnreadEmail: Integer; 
                                   var pfEnableDefault: WordBool); dispid 127;
    procedure OnRequestURLPostResult(hr: Integer; lCookie: Integer; muType: MURLTYPE; 
                                     const bstrURLPost: WideString); dispid 129;
    procedure OnTrustChanged; dispid 131;
    procedure OnFileTransferInviteReceived(const pUser: IMsgrUser; lCookie: Integer; 
                                           const bstrFileName: WideString; lFileSize: Integer; 
                                           var pfEnableDefault: WordBool); dispid 132;
    procedure OnFileTransferInviteAccepted(const pUser: IMsgrUser; lCookie: Integer; 
                                           var pfEnableDefault: WordBool); dispid 133;
    procedure OnFileTransferInviteCancelled(const pUser: IMsgrUser; lCookie: Integer; 
                                            hrReason: Integer; var pfEnableDefault: WordBool); dispid 134;
    procedure OnFileTransferCancelled(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                      var pfEnableDefault: WordBool); dispid 135;
    procedure OnFileTransferStatusChange(const pUser: IMsgrUser; lCookie: Integer; 
                                         lStatus: Integer; hr: Integer; 
                                         var pfEnableDefault: WordBool); dispid 136;
    procedure OnLocalPropertyChangeResult(hr: Integer; ePropType: MUSERPROPERTY; 
                                          vPropVal: OleVariant; const pService: IMsgrService); dispid 141;
    procedure OnBuddyPropertyChangeResult(hr: Integer; const pUser: IMsgrUser; 
                                          ePropType: MUSERPROPERTY; vPropVal: OleVariant; 
                                          const pService: IMsgrService); dispid 142;
    procedure OnNotificationReceived(const bstrNotification: WideString; 
                                     const pService: IMsgrService); dispid 143;
  end;

// *********************************************************************//
// Interface: IMsgrUser2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB456-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUser2 = interface(IMsgrUser)
    ['{218CB456-20B6-11D2-8E17-0000F803A446}']
    procedure Set_Property_(ePropType: MUSERPROPERTY; pvPropVal: OleVariant); safecall;
    function Get_Property_(ePropType: MUSERPROPERTY): OleVariant; safecall;
    property Property_[ePropType: MUSERPROPERTY]: OleVariant read Get_Property_ write Set_Property_;
  end;

// *********************************************************************//
// DispIntf:  IMsgrUser2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {218CB456-20B6-11D2-8E17-0000F803A446}
// *********************************************************************//
  IMsgrUser2Disp = dispinterface
    ['{218CB456-20B6-11D2-8E17-0000F803A446}']
    property Property_[ePropType: MUSERPROPERTY]: OleVariant dispid 1610809344;
    property FriendlyName: WideString dispid 1610743808;
    property EmailAddress: WideString readonly dispid 1610743810;
    property State: MSTATE readonly dispid 1610743811;
    property LogonName: WideString readonly dispid 1610743812;
    function SendText(const bstrMsgHeader: WideString; const bstrMsgText: WideString; 
                      mmtType: MMSGTYPE): Integer; dispid 101;
    property Service: IMsgrService readonly dispid 1610743814;
  end;

// *********************************************************************//
// Interface: IMessengerApp2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF55D627-CF5B-40DE-850F-62D20BC241C8}
// *********************************************************************//
  IMessengerApp2 = interface(IMessengerApp)
    ['{FF55D627-CF5B-40DE-850F-62D20BC241C8}']
    procedure LaunchPhoneUI(vUser: OleVariant; ePhoneNumber: MUSERPROPERTY); safecall;
    procedure LaunchAudioTuningWizard(hwndParent: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMessengerApp2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF55D627-CF5B-40DE-850F-62D20BC241C8}
// *********************************************************************//
  IMessengerApp2Disp = dispinterface
    ['{FF55D627-CF5B-40DE-850F-62D20BC241C8}']
    procedure LaunchPhoneUI(vUser: OleVariant; ePhoneNumber: MUSERPROPERTY); dispid 225;
    procedure LaunchAudioTuningWizard(hwndParent: Integer); dispid 226;
    property Application: IDispatch readonly dispid 1610743808;
    property Parent: IDispatch readonly dispid 1610743809;
    procedure Quit; dispid 100;
    property Name: WideString readonly dispid 1610743811;
    property FullName: WideString readonly dispid 1610743812;
    property Path: WideString readonly dispid 1610743813;
    procedure LaunchLogonUI; dispid 200;
    procedure LaunchOptionsUI(MOPTDLGPAGE: MOPTDLGPAGE); dispid 201;
    procedure LaunchAddContactUI(const bstrEMail: WideString); dispid 202;
    procedure LaunchFindContactUI(const bstrFirstName: WideString; const bstrLastName: WideString; 
                                  vbstrCity: OleVariant; vbstrState: OleVariant; 
                                  vbstrCountry: OleVariant); dispid 203;
    function LaunchIMUI(vUser: OleVariant): IMessengerIMWindow; dispid 210;
    property IMWindows: IMessengerIMWindows readonly dispid 1610743819;
    property ToolBar: WordBool dispid 1610743820;
    property StatusBar: WordBool dispid 1610743822;
    property StatusText: WideString dispid 1610743824;
    property HWND: Integer readonly dispid 1610743826;
    property Left: Integer dispid 1610743827;
    property Top: Integer dispid 1610743829;
    property Width: Integer dispid 1610743831;
    property Height: Integer dispid 1610743833;
    property Visible: WordBool dispid 1610743835;
    procedure AutoLogon; dispid 222;
    property FirstTimeCredentials[const bstrUser: WideString; const bstrPassword: WideString; 
                                  const pService: IMsgrService]: Integer writeonly dispid 1610743838;
    property CachedPassword[const bstrUser: WideString; const bstrPassword: WideString; 
                            const pService: IMsgrService]: WordBool writeonly dispid 1610743839;
    procedure RequestURLPost(muType: MURLTYPE; vbstrAdditionalInfo: OleVariant); dispid 223;
    property TaskbarIcon: WordBool dispid 224;
  end;

// *********************************************************************//
// Interface: IMessengerApp3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {28E28123-7DC5-45D3-860E-8EE1C3681BD5}
// *********************************************************************//
  IMessengerApp3 = interface(IMessengerApp2)
    ['{28E28123-7DC5-45D3-860E-8EE1C3681BD5}']
    function LaunchPagerUI(vUser: OleVariant): IMessengerIMWindow; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMessengerApp3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {28E28123-7DC5-45D3-860E-8EE1C3681BD5}
// *********************************************************************//
  IMessengerApp3Disp = dispinterface
    ['{28E28123-7DC5-45D3-860E-8EE1C3681BD5}']
    function LaunchPagerUI(vUser: OleVariant): IMessengerIMWindow; dispid 227;
    procedure LaunchPhoneUI(vUser: OleVariant; ePhoneNumber: MUSERPROPERTY); dispid 225;
    procedure LaunchAudioTuningWizard(hwndParent: Integer); dispid 226;
    property Application: IDispatch readonly dispid 1610743808;
    property Parent: IDispatch readonly dispid 1610743809;
    procedure Quit; dispid 100;
    property Name: WideString readonly dispid 1610743811;
    property FullName: WideString readonly dispid 1610743812;
    property Path: WideString readonly dispid 1610743813;
    procedure LaunchLogonUI; dispid 200;
    procedure LaunchOptionsUI(MOPTDLGPAGE: MOPTDLGPAGE); dispid 201;
    procedure LaunchAddContactUI(const bstrEMail: WideString); dispid 202;
    procedure LaunchFindContactUI(const bstrFirstName: WideString; const bstrLastName: WideString; 
                                  vbstrCity: OleVariant; vbstrState: OleVariant; 
                                  vbstrCountry: OleVariant); dispid 203;
    function LaunchIMUI(vUser: OleVariant): IMessengerIMWindow; dispid 210;
    property IMWindows: IMessengerIMWindows readonly dispid 1610743819;
    property ToolBar: WordBool dispid 1610743820;
    property StatusBar: WordBool dispid 1610743822;
    property StatusText: WideString dispid 1610743824;
    property HWND: Integer readonly dispid 1610743826;
    property Left: Integer dispid 1610743827;
    property Top: Integer dispid 1610743829;
    property Width: Integer dispid 1610743831;
    property Height: Integer dispid 1610743833;
    property Visible: WordBool dispid 1610743835;
    procedure AutoLogon; dispid 222;
    property FirstTimeCredentials[const bstrUser: WideString; const bstrPassword: WideString; 
                                  const pService: IMsgrService]: Integer writeonly dispid 1610743838;
    property CachedPassword[const bstrUser: WideString; const bstrPassword: WideString; 
                            const pService: IMsgrService]: WordBool writeonly dispid 1610743839;
    procedure RequestURLPost(muType: MURLTYPE; vbstrAdditionalInfo: OleVariant); dispid 223;
    property TaskbarIcon: WordBool dispid 224;
  end;

// *********************************************************************//
// Interface: IMsgrSP
// Flags:     (4096) Dispatchable
// GUID:      {E5B42158-AF2C-11D2-8D9D-0000F875C541}
// *********************************************************************//
  IMsgrSP = interface(IMsgrService)
    ['{E5B42158-AF2C-11D2-8D9D-0000F875C541}']
    function Logon(const bstrUser: WideString; const bstrPassword: WideString): HResult; stdcall;
    function CreateUser(const bstrLogonName: WideString; out ppUser: IMsgrUser): HResult; stdcall;
    function Get_List(MLIST: MLIST; out ppUsers: IMsgrUsers): HResult; stdcall;
    function Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY): HResult; stdcall;
    function Get_MessagePrivacy(out pmmpSetting: MMSGPRIVACY): HResult; stdcall;
    function Set_Prompt(pmpSetting: MPROMPT): HResult; stdcall;
    function Get_Prompt(out pmpSetting: MPROMPT): HResult; stdcall;
    function Set_LocalState(pmState: MSTATE): HResult; stdcall;
    function Get_LocalState(out pmState: MSTATE): HResult; stdcall;
    function AddBuddy(const pBuddy: IMsgrUser; MLIST: MLIST): HResult; stdcall;
    function RemoveBuddy(const pBuddy: IMsgrUser; MLIST: MLIST): HResult; stdcall;
    function CreateIMSession(const pUser: IMsgrUser; out ppIMSession: IMsgrIMSession): HResult; stdcall;
    function Get_IMSessions(out ppIMSessions: IMsgrIMSessions): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMsgrSP2
// Flags:     (4096) Dispatchable
// GUID:      {E5B42159-AF2C-11D2-8D9D-0000F875C541}
// *********************************************************************//
  IMsgrSP2 = interface(IMsgrSP)
    ['{E5B42159-AF2C-11D2-8D9D-0000F875C541}']
    function Get_LocalIPAddress(out plAddr: Integer): HResult; stdcall;
    function Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant): HResult; stdcall;
    function Get_LocalProperty(ePropType: MUSERPROPERTY; out pvPropVal: OleVariant): HResult; stdcall;
    function SendPage(const pUser: IMsgrUser; const bstrMessage: WideString; 
                      ePhoneType: MUSERPROPERTY; out plCookie: Integer): HResult; stdcall;
    function SendCustomInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                  lFindIndex: Integer; lLCID: Integer; 
                                  const bstrCustomText: WideString; out plCookie: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMsgrWebScriptManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB643558-61CD-42B2-A9A5-496A7884AD61}
// *********************************************************************//
  IMsgrWebScriptManager = interface(IDispatch)
    ['{CB643558-61CD-42B2-A9A5-496A7884AD61}']
    function Get_PassportClient: IDispatch; safecall;
    function Get_MsgrHost: IDispatch; safecall;
    property PassportClient: IDispatch read Get_PassportClient;
    property MsgrHost: IDispatch read Get_MsgrHost;
  end;

// *********************************************************************//
// DispIntf:  IMsgrWebScriptManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB643558-61CD-42B2-A9A5-496A7884AD61}
// *********************************************************************//
  IMsgrWebScriptManagerDisp = dispinterface
    ['{CB643558-61CD-42B2-A9A5-496A7884AD61}']
    property PassportClient: IDispatch readonly dispid 1610743808;
    property MsgrHost: IDispatch readonly dispid 1610743809;
  end;

// *********************************************************************//
// Interface: IMsgrPassportClient
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97C3808A-ECA1-4CA6-8D09-122A3CC54B3B}
// *********************************************************************//
  IMsgrPassportClient = interface(IDispatch)
    ['{97C3808A-ECA1-4CA6-8D09-122A3CC54B3B}']
    procedure SwitchUser(lState: Integer; const bstrSwitchURL: WideString; 
                         const bstrStayURL: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMsgrPassportClientDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97C3808A-ECA1-4CA6-8D09-122A3CC54B3B}
// *********************************************************************//
  IMsgrPassportClientDisp = dispinterface
    ['{97C3808A-ECA1-4CA6-8D09-122A3CC54B3B}']
    procedure SwitchUser(lState: Integer; const bstrSwitchURL: WideString; 
                         const bstrStayURL: WideString); dispid 1610743808;
  end;

// *********************************************************************//
// Interface: IMsgrHost
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {06F6EA9D-88B0-45A9-9F26-CE0898D9EA1C}
// *********************************************************************//
  IMsgrHost = interface(IDispatch)
    ['{06F6EA9D-88B0-45A9-9F26-CE0898D9EA1C}']
    procedure OpenWithAuth(const bstrURL: WideString; lSiteID: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMsgrHostDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {06F6EA9D-88B0-45A9-9F26-CE0898D9EA1C}
// *********************************************************************//
  IMsgrHostDisp = dispinterface
    ['{06F6EA9D-88B0-45A9-9F26-CE0898D9EA1C}']
    procedure OpenWithAuth(const bstrURL: WideString; lSiteID: Integer); dispid 100;
  end;

// *********************************************************************//
// The Class CoMsgrObject provides a Create and CreateRemote method to          
// create instances of the default interface IMsgrObject2 exposed by              
// the CoClass MsgrObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMsgrObject = class
    class function Create: IMsgrObject2;
    class function CreateRemote(const MachineName: string): IMsgrObject2;
  end;

  TMsgrObjectOnLogonResult = procedure(ASender: TObject; hr: Integer; const pService: IMsgrService) of object;
  TMsgrObjectOnServiceLogoff = procedure(ASender: TObject; hr: Integer; const pService: IMsgrService) of object;
  TMsgrObjectOnListAddResult = procedure(ASender: TObject; hr: Integer; MLIST: MLIST; 
                                                           const pUser: IMsgrUser) of object;
  TMsgrObjectOnListRemoveResult = procedure(ASender: TObject; hr: Integer; MLIST: MLIST; 
                                                              const pUser: IMsgrUser) of object;
  TMsgrObjectOnMessagePrivacyChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                        mmpSetting: MMSGPRIVACY; 
                                                                        const pService: IMsgrService) of object;
  TMsgrObjectOnPromptChangeResult = procedure(ASender: TObject; hr: Integer; mpSetting: MPROMPT; 
                                                                const pService: IMsgrService) of object;
  TMsgrObjectOnUserFriendlyNameChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                          const pUser: IMsgrUser; 
                                                                          const bstrPrevFriendlyName: WideString) of object;
  TMsgrObjectOnUserStateChanged = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                              mPrevState: MSTATE; 
                                                              var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnTextReceived = procedure(ASender: TObject; const pIMSession: IMsgrIMSession; 
                                                          const pSourceUser: IMsgrUser; 
                                                          const bstrMsgHeader: WideString; 
                                                          const bstrMsgText: WideString; 
                                                          var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnSPMessageReceived = procedure(ASender: TObject; const bstrMsgHeader: WideString; 
                                                               const bstrMsgText: WideString; 
                                                               const pService: IMsgrService) of object;
  TMsgrObjectOnLocalFriendlyNameChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                           const pService: IMsgrService; 
                                                                           const bstrPrevFriendlyName: WideString) of object;
  TMsgrObjectOnLocalStateChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                    mLocalState: MSTATE; 
                                                                    const pService: IMsgrService) of object;
  TMsgrObjectOnAppInviteReceived = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                               lCookie: Integer; 
                                                               const bstrAppGUID: WideString; 
                                                               const bstrAppName: WideString; 
                                                               const bstrAppURL: WideString; 
                                                               lInviteType: Integer; 
                                                               var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnAppInviteAccepted = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                               lCookie: Integer; 
                                                               const bstrIPAddress: WideString; 
                                                               lInviteType: Integer; 
                                                               var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnAppInviteCancelled = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                lCookie: Integer; 
                                                                hrReason: Integer; 
                                                                var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnSendResult = procedure(ASender: TObject; hr: Integer; lCookie: Integer) of object;
  TMsgrObjectOnNewerClientAvailable = procedure(ASender: TObject; const bstrDownloadUrl: WideString; 
                                                                  const bstrFallbackUrl: WideString; 
                                                                  lUpdateFlags: Integer) of object;
  TMsgrObjectOnFindResult = procedure(ASender: TObject; hr: Integer; lCookie: Integer; 
                                                        lFindIndex: Integer; 
                                                        lTotalResults: Integer; 
                                                        const bstrEmailAddress: WideString; 
                                                        const bstrFirstName: WideString; 
                                                        const bstrLastName: WideString; 
                                                        const bstrCity: WideString; 
                                                        const bstrState: WideString; 
                                                        const bstrCountry: WideString) of object;
  TMsgrObjectOnInviteMailResult = procedure(ASender: TObject; hr: Integer; lCookie: Integer) of object;
  TMsgrObjectOnRequestURLResult = procedure(ASender: TObject; hr: Integer; lCookie: Integer; 
                                                              muType: MURLTYPE; 
                                                              const bstrURL: WideString) of object;
  TMsgrObjectOnSessionStateChange = procedure(ASender: TObject; const pIMSession: IMsgrIMSession; 
                                                                sPrevState: SSTATE) of object;
  TMsgrObjectOnUserJoin = procedure(ASender: TObject; const pIMsgrUser: IMsgrUser; 
                                                      const pIMSession: IMsgrIMSession) of object;
  TMsgrObjectOnUserLeave = procedure(ASender: TObject; const pIMsgrUser: IMsgrUser; 
                                                       const pIMSession: IMsgrIMSession) of object;
  TMsgrObjectOnUserDropped = procedure(ASender: TObject; hr: Integer; const pIMsgrUser: IMsgrUser; 
                                                         const pIMSession: IMsgrIMSession) of object;
  TMsgrObjectOnNewSessionRequest = procedure(ASender: TObject; const pRequestUser: IMsgrUser; 
                                                               const pIMSession: IMsgrIMSession; 
                                                               var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnInviteUser = procedure(ASender: TObject; const pIMsgrUser: IMsgrUser; 
                                                        const pIMSession: IMsgrIMSession; 
                                                        hr: Integer) of object;
  TMsgrObjectOnPrimaryServiceChanged = procedure(ASender: TObject; const pService: IMsgrService) of object;
  TMsgrObjectOnUnreadEmailChanged = procedure(ASender: TObject; MFOLDER: MFOLDER; 
                                                                cUnreadEmail: Integer; 
                                                                var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnRequestURLPostResult = procedure(ASender: TObject; hr: Integer; lCookie: Integer; 
                                                                  muType: MURLTYPE; 
                                                                  const bstrURLPost: WideString) of object;
  TMsgrObjectOnFileTransferInviteReceived = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                        lCookie: Integer; 
                                                                        const bstrFileName: WideString; 
                                                                        lFileSize: Integer; 
                                                                        var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnFileTransferInviteAccepted = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                        lCookie: Integer; 
                                                                        var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnFileTransferInviteCancelled = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                         lCookie: Integer; 
                                                                         hrReason: Integer; 
                                                                         var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnFileTransferCancelled = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                   lCookie: Integer; 
                                                                   hrReason: Integer; 
                                                                   var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnFileTransferStatusChange = procedure(ASender: TObject; const pUser: IMsgrUser; 
                                                                      lCookie: Integer; 
                                                                      lStatus: Integer; 
                                                                      hr: Integer; 
                                                                      var pfEnableDefault: WordBool) of object;
  TMsgrObjectOnLocalPropertyChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                       ePropType: MUSERPROPERTY; 
                                                                       vPropVal: OleVariant; 
                                                                       const pService: IMsgrService) of object;
  TMsgrObjectOnBuddyPropertyChangeResult = procedure(ASender: TObject; hr: Integer; 
                                                                       const pUser: IMsgrUser; 
                                                                       ePropType: MUSERPROPERTY; 
                                                                       vPropVal: OleVariant; 
                                                                       const pService: IMsgrService) of object;
  TMsgrObjectOnNotificationReceived = procedure(ASender: TObject; const bstrNotification: WideString; 
                                                                  const pService: IMsgrService) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMsgrObject
// Help String      : 
// Default Interface: IMsgrObject2
// Def. Intf. DISP? : No
// Event   Interface: DMsgrObjectEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMsgrObjectProperties= class;
{$ENDIF}
  TMsgrObject = class(TOleServer)
  private
    FOnLogonResult: TMsgrObjectOnLogonResult;
    FOnLogoff: TNotifyEvent;
    FOnServiceLogoff: TMsgrObjectOnServiceLogoff;
    FOnListAddResult: TMsgrObjectOnListAddResult;
    FOnListRemoveResult: TMsgrObjectOnListRemoveResult;
    FOnMessagePrivacyChangeResult: TMsgrObjectOnMessagePrivacyChangeResult;
    FOnPromptChangeResult: TMsgrObjectOnPromptChangeResult;
    FOnUserFriendlyNameChangeResult: TMsgrObjectOnUserFriendlyNameChangeResult;
    FOnUserStateChanged: TMsgrObjectOnUserStateChanged;
    FOnTextReceived: TMsgrObjectOnTextReceived;
    FOnSPMessageReceived: TMsgrObjectOnSPMessageReceived;
    FOnLocalFriendlyNameChangeResult: TMsgrObjectOnLocalFriendlyNameChangeResult;
    FOnLocalStateChangeResult: TMsgrObjectOnLocalStateChangeResult;
    FOnAppInviteReceived: TMsgrObjectOnAppInviteReceived;
    FOnAppInviteAccepted: TMsgrObjectOnAppInviteAccepted;
    FOnAppInviteCancelled: TMsgrObjectOnAppInviteCancelled;
    FOnSendResult: TMsgrObjectOnSendResult;
    FOnNewerClientAvailable: TMsgrObjectOnNewerClientAvailable;
    FOnFindResult: TMsgrObjectOnFindResult;
    FOnInviteMailResult: TMsgrObjectOnInviteMailResult;
    FOnRequestURLResult: TMsgrObjectOnRequestURLResult;
    FOnSessionStateChange: TMsgrObjectOnSessionStateChange;
    FOnUserJoin: TMsgrObjectOnUserJoin;
    FOnUserLeave: TMsgrObjectOnUserLeave;
    FOnUserDropped: TMsgrObjectOnUserDropped;
    FOnNewSessionRequest: TMsgrObjectOnNewSessionRequest;
    FOnInviteUser: TMsgrObjectOnInviteUser;
    FOnPrimaryServiceChanged: TMsgrObjectOnPrimaryServiceChanged;
    FOnAppShutdown: TNotifyEvent;
    FOnUnreadEmailChanged: TMsgrObjectOnUnreadEmailChanged;
    FOnRequestURLPostResult: TMsgrObjectOnRequestURLPostResult;
    FOnTrustChanged: TNotifyEvent;
    FOnFileTransferInviteReceived: TMsgrObjectOnFileTransferInviteReceived;
    FOnFileTransferInviteAccepted: TMsgrObjectOnFileTransferInviteAccepted;
    FOnFileTransferInviteCancelled: TMsgrObjectOnFileTransferInviteCancelled;
    FOnFileTransferCancelled: TMsgrObjectOnFileTransferCancelled;
    FOnFileTransferStatusChange: TMsgrObjectOnFileTransferStatusChange;
    FOnLocalPropertyChangeResult: TMsgrObjectOnLocalPropertyChangeResult;
    FOnBuddyPropertyChangeResult: TMsgrObjectOnBuddyPropertyChangeResult;
    FOnNotificationReceived: TMsgrObjectOnNotificationReceived;
    FIntf:        IMsgrObject2;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMsgrObjectProperties;
    function      GetServerProperties: TMsgrObjectProperties;
{$ENDIF}
    function      GetDefaultInterface: IMsgrObject2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_List(MLIST: MLIST): IMsgrUsers;
    function Get_LocalLogonName: WideString;
    function Get_LocalFriendlyName: WideString;
    procedure Set_LocalState(pmState: MSTATE);
    function Get_LocalState: MSTATE;
    procedure Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY);
    function Get_MessagePrivacy: MMSGPRIVACY;
    procedure Set_Prompt(pmpSetting: MPROMPT);
    function Get_Prompt: MPROMPT;
    procedure Set_LocalOption(option: MLOCALOPTION; pvSetting: OleVariant);
    function Get_LocalOption(option: MLOCALOPTION): OleVariant;
    function Get_IMSessions: IMsgrIMSessions;
    function Get_Services: IMsgrServices;
    function Get_UnreadEmail(MFOLDER: MFOLDER): Integer;
    procedure Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant);
    function Get_LocalProperty(ePropType: MUSERPROPERTY): OleVariant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMsgrObject2);
    procedure Disconnect; override;
    function CreateUser(const bstrLogonName: WideString; const pService: IMsgrService): IMsgrUser;
    procedure Logon(const bstrUser: WideString; const bstrPassword: WideString; 
                    const pService: IMsgrService);
    procedure Logoff;
    function SendAppInvite(const pUser: IMsgrUser; lCookie: Integer; const bstrAppGUID: WideString; 
                           const bstrAppName: WideString; const bstrAppURL: WideString; 
                           lInviteType: Integer; mmtType: MMSGTYPE): Integer;
    function SendAppInviteAccept(const pUser: IMsgrUser; lCookie: Integer; lInviteType: Integer; 
                                 mmtType: MMSGTYPE): Integer;
    function SendAppInviteCancel(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                 mmtType: MMSGTYPE): Integer;
    function FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                      const bstrCity: WideString; const bstrState: WideString; 
                      const bstrCountry: WideString): Integer;
    function SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                            lFindIndex: Integer; lLCID: Integer): Integer;
    function RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer;
    function CreateIMSession(vUser: OleVariant): IMsgrIMSession;
    procedure SessionRequestAccept(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer);
    procedure SessionRequestCancel(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer);
    function SendFileTransferInvite(const pUser: IMsgrUser; lCookie: Integer; 
                                    const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer;
    function SendFileTransferInviteAccept(const pUser: IMsgrUser; lCookie: Integer; 
                                          const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer;
    function SendFileTransferInviteCancel(const pUser: IMsgrUser; lCookie: Integer; 
                                          hrReason: Integer; mmtType: MMSGTYPE): Integer;
    function CancelFileTransfer(const pUser: IMsgrUser; lCookie: Integer; hrReason: Integer; 
                                mmtType: MMSGTYPE): Integer;
    procedure FileTransferStatus(lCookie: Integer; const pUser: IMsgrUser; out plStatus: Integer; 
                                 out pbstrFilePath: WideString; out plTotalBytes: Integer; 
                                 out plBytesTransferred: Integer);
    function SendPage(const pUser: IMsgrUser; const bstrMessage: WideString; 
                      ePhoneType: MUSERPROPERTY): Integer;
    function SendCustomInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                  lFindIndex: Integer; lLCID: Integer; 
                                  const bstrCustomText: WideString): Integer;
    property DefaultInterface: IMsgrObject2 read GetDefaultInterface;
    property List[MLIST: MLIST]: IMsgrUsers read Get_List;
    property LocalLogonName: WideString read Get_LocalLogonName;
    property LocalFriendlyName: WideString read Get_LocalFriendlyName;
    property LocalOption[option: MLOCALOPTION]: OleVariant read Get_LocalOption write Set_LocalOption;
    property IMSessions: IMsgrIMSessions read Get_IMSessions;
    property Services: IMsgrServices read Get_Services;
    property UnreadEmail[MFOLDER: MFOLDER]: Integer read Get_UnreadEmail;
    property LocalProperty[ePropType: MUSERPROPERTY]: OleVariant read Get_LocalProperty write Set_LocalProperty;
    property LocalState: MSTATE read Get_LocalState write Set_LocalState;
    property MessagePrivacy: MMSGPRIVACY read Get_MessagePrivacy write Set_MessagePrivacy;
    property Prompt: MPROMPT read Get_Prompt write Set_Prompt;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMsgrObjectProperties read GetServerProperties;
{$ENDIF}
    property OnLogonResult: TMsgrObjectOnLogonResult read FOnLogonResult write FOnLogonResult;
    property OnLogoff: TNotifyEvent read FOnLogoff write FOnLogoff;
    property OnServiceLogoff: TMsgrObjectOnServiceLogoff read FOnServiceLogoff write FOnServiceLogoff;
    property OnListAddResult: TMsgrObjectOnListAddResult read FOnListAddResult write FOnListAddResult;
    property OnListRemoveResult: TMsgrObjectOnListRemoveResult read FOnListRemoveResult write FOnListRemoveResult;
    property OnMessagePrivacyChangeResult: TMsgrObjectOnMessagePrivacyChangeResult read FOnMessagePrivacyChangeResult write FOnMessagePrivacyChangeResult;
    property OnPromptChangeResult: TMsgrObjectOnPromptChangeResult read FOnPromptChangeResult write FOnPromptChangeResult;
    property OnUserFriendlyNameChangeResult: TMsgrObjectOnUserFriendlyNameChangeResult read FOnUserFriendlyNameChangeResult write FOnUserFriendlyNameChangeResult;
    property OnUserStateChanged: TMsgrObjectOnUserStateChanged read FOnUserStateChanged write FOnUserStateChanged;
    property OnTextReceived: TMsgrObjectOnTextReceived read FOnTextReceived write FOnTextReceived;
    property OnSPMessageReceived: TMsgrObjectOnSPMessageReceived read FOnSPMessageReceived write FOnSPMessageReceived;
    property OnLocalFriendlyNameChangeResult: TMsgrObjectOnLocalFriendlyNameChangeResult read FOnLocalFriendlyNameChangeResult write FOnLocalFriendlyNameChangeResult;
    property OnLocalStateChangeResult: TMsgrObjectOnLocalStateChangeResult read FOnLocalStateChangeResult write FOnLocalStateChangeResult;
    property OnAppInviteReceived: TMsgrObjectOnAppInviteReceived read FOnAppInviteReceived write FOnAppInviteReceived;
    property OnAppInviteAccepted: TMsgrObjectOnAppInviteAccepted read FOnAppInviteAccepted write FOnAppInviteAccepted;
    property OnAppInviteCancelled: TMsgrObjectOnAppInviteCancelled read FOnAppInviteCancelled write FOnAppInviteCancelled;
    property OnSendResult: TMsgrObjectOnSendResult read FOnSendResult write FOnSendResult;
    property OnNewerClientAvailable: TMsgrObjectOnNewerClientAvailable read FOnNewerClientAvailable write FOnNewerClientAvailable;
    property OnFindResult: TMsgrObjectOnFindResult read FOnFindResult write FOnFindResult;
    property OnInviteMailResult: TMsgrObjectOnInviteMailResult read FOnInviteMailResult write FOnInviteMailResult;
    property OnRequestURLResult: TMsgrObjectOnRequestURLResult read FOnRequestURLResult write FOnRequestURLResult;
    property OnSessionStateChange: TMsgrObjectOnSessionStateChange read FOnSessionStateChange write FOnSessionStateChange;
    property OnUserJoin: TMsgrObjectOnUserJoin read FOnUserJoin write FOnUserJoin;
    property OnUserLeave: TMsgrObjectOnUserLeave read FOnUserLeave write FOnUserLeave;
    property OnUserDropped: TMsgrObjectOnUserDropped read FOnUserDropped write FOnUserDropped;
    property OnNewSessionRequest: TMsgrObjectOnNewSessionRequest read FOnNewSessionRequest write FOnNewSessionRequest;
    property OnInviteUser: TMsgrObjectOnInviteUser read FOnInviteUser write FOnInviteUser;
    property OnPrimaryServiceChanged: TMsgrObjectOnPrimaryServiceChanged read FOnPrimaryServiceChanged write FOnPrimaryServiceChanged;
    property OnAppShutdown: TNotifyEvent read FOnAppShutdown write FOnAppShutdown;
    property OnUnreadEmailChanged: TMsgrObjectOnUnreadEmailChanged read FOnUnreadEmailChanged write FOnUnreadEmailChanged;
    property OnRequestURLPostResult: TMsgrObjectOnRequestURLPostResult read FOnRequestURLPostResult write FOnRequestURLPostResult;
    property OnTrustChanged: TNotifyEvent read FOnTrustChanged write FOnTrustChanged;
    property OnFileTransferInviteReceived: TMsgrObjectOnFileTransferInviteReceived read FOnFileTransferInviteReceived write FOnFileTransferInviteReceived;
    property OnFileTransferInviteAccepted: TMsgrObjectOnFileTransferInviteAccepted read FOnFileTransferInviteAccepted write FOnFileTransferInviteAccepted;
    property OnFileTransferInviteCancelled: TMsgrObjectOnFileTransferInviteCancelled read FOnFileTransferInviteCancelled write FOnFileTransferInviteCancelled;
    property OnFileTransferCancelled: TMsgrObjectOnFileTransferCancelled read FOnFileTransferCancelled write FOnFileTransferCancelled;
    property OnFileTransferStatusChange: TMsgrObjectOnFileTransferStatusChange read FOnFileTransferStatusChange write FOnFileTransferStatusChange;
    property OnLocalPropertyChangeResult: TMsgrObjectOnLocalPropertyChangeResult read FOnLocalPropertyChangeResult write FOnLocalPropertyChangeResult;
    property OnBuddyPropertyChangeResult: TMsgrObjectOnBuddyPropertyChangeResult read FOnBuddyPropertyChangeResult write FOnBuddyPropertyChangeResult;
    property OnNotificationReceived: TMsgrObjectOnNotificationReceived read FOnNotificationReceived write FOnNotificationReceived;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMsgrObject
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMsgrObjectProperties = class(TPersistent)
  private
    FServer:    TMsgrObject;
    function    GetDefaultInterface: IMsgrObject2;
    constructor Create(AServer: TMsgrObject);
  protected
    function Get_List(MLIST: MLIST): IMsgrUsers;
    function Get_LocalLogonName: WideString;
    function Get_LocalFriendlyName: WideString;
    procedure Set_LocalState(pmState: MSTATE);
    function Get_LocalState: MSTATE;
    procedure Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY);
    function Get_MessagePrivacy: MMSGPRIVACY;
    procedure Set_Prompt(pmpSetting: MPROMPT);
    function Get_Prompt: MPROMPT;
    procedure Set_LocalOption(option: MLOCALOPTION; pvSetting: OleVariant);
    function Get_LocalOption(option: MLOCALOPTION): OleVariant;
    function Get_IMSessions: IMsgrIMSessions;
    function Get_Services: IMsgrServices;
    function Get_UnreadEmail(MFOLDER: MFOLDER): Integer;
    procedure Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant);
    function Get_LocalProperty(ePropType: MUSERPROPERTY): OleVariant;
  public
    property DefaultInterface: IMsgrObject2 read GetDefaultInterface;
  published
    property LocalState: MSTATE read Get_LocalState write Set_LocalState;
    property MessagePrivacy: MMSGPRIVACY read Get_MessagePrivacy write Set_MessagePrivacy;
    property Prompt: MPROMPT read Get_Prompt write Set_Prompt;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMessengerApp provides a Create and CreateRemote method to          
// create instances of the default interface IMessengerApp3 exposed by              
// the CoClass MessengerApp. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMessengerApp = class
    class function Create: IMessengerApp3;
    class function CreateRemote(const MachineName: string): IMessengerApp3;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoMsgrObject.Create: IMsgrObject2;
begin
  Result := CreateComObject(CLASS_MsgrObject) as IMsgrObject2;
end;

class function CoMsgrObject.CreateRemote(const MachineName: string): IMsgrObject2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MsgrObject) as IMsgrObject2;
end;

procedure TMsgrObject.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F3A614DC-ABE0-11D2-A441-00C04F795683}';
    IntfIID:   '{218CB455-20B6-11D2-8E17-0000F803A446}';
    EventIID:  '{218CB452-20B6-11D2-8E17-0000F803A446}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMsgrObject.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IMsgrObject2;
  end;
end;

procedure TMsgrObject.ConnectTo(svrIntf: IMsgrObject2);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TMsgrObject.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TMsgrObject.GetDefaultInterface: IMsgrObject2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMsgrObject.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMsgrObjectProperties.Create(Self);
{$ENDIF}
end;

destructor TMsgrObject.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMsgrObject.GetServerProperties: TMsgrObjectProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMsgrObject.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    100: if Assigned(FOnLogonResult) then
         FOnLogonResult(Self,
                        Params[0] {Integer},
                        IUnknown(TVarData(Params[1]).VPointer) as IMsgrService {const IMsgrService});
    101: if Assigned(FOnLogoff) then
         FOnLogoff(Self);
    124: if Assigned(FOnServiceLogoff) then
         FOnServiceLogoff(Self,
                          Params[0] {Integer},
                          IUnknown(TVarData(Params[1]).VPointer) as IMsgrService {const IMsgrService});
    102: if Assigned(FOnListAddResult) then
         FOnListAddResult(Self,
                          Params[0] {Integer},
                          Params[1] {MLIST},
                          IUnknown(TVarData(Params[2]).VPointer) as IMsgrUser {const IMsgrUser});
    103: if Assigned(FOnListRemoveResult) then
         FOnListRemoveResult(Self,
                             Params[0] {Integer},
                             Params[1] {MLIST},
                             IUnknown(TVarData(Params[2]).VPointer) as IMsgrUser {const IMsgrUser});
    104: if Assigned(FOnMessagePrivacyChangeResult) then
         FOnMessagePrivacyChangeResult(Self,
                                       Params[0] {Integer},
                                       Params[1] {MMSGPRIVACY},
                                       IUnknown(TVarData(Params[2]).VPointer) as IMsgrService {const IMsgrService});
    105: if Assigned(FOnPromptChangeResult) then
         FOnPromptChangeResult(Self,
                               Params[0] {Integer},
                               Params[1] {MPROMPT},
                               IUnknown(TVarData(Params[2]).VPointer) as IMsgrService {const IMsgrService});
    106: if Assigned(FOnUserFriendlyNameChangeResult) then
         FOnUserFriendlyNameChangeResult(Self,
                                         Params[0] {Integer},
                                         IUnknown(TVarData(Params[1]).VPointer) as IMsgrUser {const IMsgrUser},
                                         Params[2] {const WideString});
    107: if Assigned(FOnUserStateChanged) then
         FOnUserStateChanged(Self,
                             IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                             Params[1] {MSTATE},
                             WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    108: if Assigned(FOnTextReceived) then
         FOnTextReceived(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as IMsgrIMSession {const IMsgrIMSession},
                         IUnknown(TVarData(Params[1]).VPointer) as IMsgrUser {const IMsgrUser},
                         Params[2] {const WideString},
                         Params[3] {const WideString},
                         WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    137: if Assigned(FOnSPMessageReceived) then
         FOnSPMessageReceived(Self,
                              Params[0] {const WideString},
                              Params[1] {const WideString},
                              IUnknown(TVarData(Params[2]).VPointer) as IMsgrService {const IMsgrService});
    109: if Assigned(FOnLocalFriendlyNameChangeResult) then
         FOnLocalFriendlyNameChangeResult(Self,
                                          Params[0] {Integer},
                                          IUnknown(TVarData(Params[1]).VPointer) as IMsgrService {const IMsgrService},
                                          Params[2] {const WideString});
    110: if Assigned(FOnLocalStateChangeResult) then
         FOnLocalStateChangeResult(Self,
                                   Params[0] {Integer},
                                   Params[1] {MSTATE},
                                   IUnknown(TVarData(Params[2]).VPointer) as IMsgrService {const IMsgrService});
    111: if Assigned(FOnAppInviteReceived) then
         FOnAppInviteReceived(Self,
                              IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                              Params[1] {Integer},
                              Params[2] {const WideString},
                              Params[3] {const WideString},
                              Params[4] {const WideString},
                              Params[5] {Integer},
                              WordBool((TVarData(Params[6]).VPointer)^) {var WordBool});
    112: if Assigned(FOnAppInviteAccepted) then
         FOnAppInviteAccepted(Self,
                              IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                              Params[1] {Integer},
                              Params[2] {const WideString},
                              Params[3] {Integer},
                              WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    113: if Assigned(FOnAppInviteCancelled) then
         FOnAppInviteCancelled(Self,
                               IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                               Params[1] {Integer},
                               Params[2] {Integer},
                               WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    114: if Assigned(FOnSendResult) then
         FOnSendResult(Self,
                       Params[0] {Integer},
                       Params[1] {Integer});
    115: if Assigned(FOnNewerClientAvailable) then
         FOnNewerClientAvailable(Self,
                                 Params[0] {const WideString},
                                 Params[1] {const WideString},
                                 Params[2] {Integer});
    116: if Assigned(FOnFindResult) then
         FOnFindResult(Self,
                       Params[0] {Integer},
                       Params[1] {Integer},
                       Params[2] {Integer},
                       Params[3] {Integer},
                       Params[4] {const WideString},
                       Params[5] {const WideString},
                       Params[6] {const WideString},
                       Params[7] {const WideString},
                       Params[8] {const WideString},
                       Params[9] {const WideString});
    117: if Assigned(FOnInviteMailResult) then
         FOnInviteMailResult(Self,
                             Params[0] {Integer},
                             Params[1] {Integer});
    118: if Assigned(FOnRequestURLResult) then
         FOnRequestURLResult(Self,
                             Params[0] {Integer},
                             Params[1] {Integer},
                             Params[2] {MURLTYPE},
                             Params[3] {const WideString});
    119: if Assigned(FOnSessionStateChange) then
         FOnSessionStateChange(Self,
                               IUnknown(TVarData(Params[0]).VPointer) as IMsgrIMSession {const IMsgrIMSession},
                               Params[1] {SSTATE});
    120: if Assigned(FOnUserJoin) then
         FOnUserJoin(Self,
                     IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                     IUnknown(TVarData(Params[1]).VPointer) as IMsgrIMSession {const IMsgrIMSession});
    121: if Assigned(FOnUserLeave) then
         FOnUserLeave(Self,
                      IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                      IUnknown(TVarData(Params[1]).VPointer) as IMsgrIMSession {const IMsgrIMSession});
    128: if Assigned(FOnUserDropped) then
         FOnUserDropped(Self,
                        Params[0] {Integer},
                        IUnknown(TVarData(Params[1]).VPointer) as IMsgrUser {const IMsgrUser},
                        IUnknown(TVarData(Params[2]).VPointer) as IMsgrIMSession {const IMsgrIMSession});
    122: if Assigned(FOnNewSessionRequest) then
         FOnNewSessionRequest(Self,
                              IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                              IUnknown(TVarData(Params[1]).VPointer) as IMsgrIMSession {const IMsgrIMSession},
                              WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    123: if Assigned(FOnInviteUser) then
         FOnInviteUser(Self,
                       IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                       IUnknown(TVarData(Params[1]).VPointer) as IMsgrIMSession {const IMsgrIMSession},
                       Params[2] {Integer});
    125: if Assigned(FOnPrimaryServiceChanged) then
         FOnPrimaryServiceChanged(Self, IUnknown(TVarData(Params[0]).VPointer) as IMsgrService {const IMsgrService});
    126: if Assigned(FOnAppShutdown) then
         FOnAppShutdown(Self);
    127: if Assigned(FOnUnreadEmailChanged) then
         FOnUnreadEmailChanged(Self,
                               Params[0] {MFOLDER},
                               Params[1] {Integer},
                               WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    129: if Assigned(FOnRequestURLPostResult) then
         FOnRequestURLPostResult(Self,
                                 Params[0] {Integer},
                                 Params[1] {Integer},
                                 Params[2] {MURLTYPE},
                                 Params[3] {const WideString});
    131: if Assigned(FOnTrustChanged) then
         FOnTrustChanged(Self);
    132: if Assigned(FOnFileTransferInviteReceived) then
         FOnFileTransferInviteReceived(Self,
                                       IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                                       Params[1] {Integer},
                                       Params[2] {const WideString},
                                       Params[3] {Integer},
                                       WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    133: if Assigned(FOnFileTransferInviteAccepted) then
         FOnFileTransferInviteAccepted(Self,
                                       IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                                       Params[1] {Integer},
                                       WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    134: if Assigned(FOnFileTransferInviteCancelled) then
         FOnFileTransferInviteCancelled(Self,
                                        IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                                        Params[1] {Integer},
                                        Params[2] {Integer},
                                        WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    135: if Assigned(FOnFileTransferCancelled) then
         FOnFileTransferCancelled(Self,
                                  IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                                  Params[1] {Integer},
                                  Params[2] {Integer},
                                  WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    136: if Assigned(FOnFileTransferStatusChange) then
         FOnFileTransferStatusChange(Self,
                                     IUnknown(TVarData(Params[0]).VPointer) as IMsgrUser {const IMsgrUser},
                                     Params[1] {Integer},
                                     Params[2] {Integer},
                                     Params[3] {Integer},
                                     WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    141: if Assigned(FOnLocalPropertyChangeResult) then
         FOnLocalPropertyChangeResult(Self,
                                      Params[0] {Integer},
                                      Params[1] {MUSERPROPERTY},
                                      Params[2] {OleVariant},
                                      IUnknown(TVarData(Params[3]).VPointer) as IMsgrService {const IMsgrService});
    142: if Assigned(FOnBuddyPropertyChangeResult) then
         FOnBuddyPropertyChangeResult(Self,
                                      Params[0] {Integer},
                                      IUnknown(TVarData(Params[1]).VPointer) as IMsgrUser {const IMsgrUser},
                                      Params[2] {MUSERPROPERTY},
                                      Params[3] {OleVariant},
                                      IUnknown(TVarData(Params[4]).VPointer) as IMsgrService {const IMsgrService});
    143: if Assigned(FOnNotificationReceived) then
         FOnNotificationReceived(Self,
                                 Params[0] {const WideString},
                                 IUnknown(TVarData(Params[1]).VPointer) as IMsgrService {const IMsgrService});
  end; {case DispID}
end;

function TMsgrObject.Get_List(MLIST: MLIST): IMsgrUsers;
begin
    Result := DefaultInterface.List[MLIST];
end;

function TMsgrObject.Get_LocalLogonName: WideString;
begin
    Result := DefaultInterface.LocalLogonName;
end;

function TMsgrObject.Get_LocalFriendlyName: WideString;
begin
    Result := DefaultInterface.LocalFriendlyName;
end;

procedure TMsgrObject.Set_LocalState(pmState: MSTATE);
begin
  DefaultInterface.Set_LocalState(pmState);
end;

function TMsgrObject.Get_LocalState: MSTATE;
begin
    Result := DefaultInterface.LocalState;
end;

procedure TMsgrObject.Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY);
begin
  DefaultInterface.Set_MessagePrivacy(pmmpSetting);
end;

function TMsgrObject.Get_MessagePrivacy: MMSGPRIVACY;
begin
    Result := DefaultInterface.MessagePrivacy;
end;

procedure TMsgrObject.Set_Prompt(pmpSetting: MPROMPT);
begin
  DefaultInterface.Set_Prompt(pmpSetting);
end;

function TMsgrObject.Get_Prompt: MPROMPT;
begin
    Result := DefaultInterface.Prompt;
end;

procedure TMsgrObject.Set_LocalOption(option: MLOCALOPTION; pvSetting: OleVariant);
begin
  DefaultInterface.LocalOption[option] := pvSetting;
end;

function TMsgrObject.Get_LocalOption(option: MLOCALOPTION): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LocalOption[option];
end;

function TMsgrObject.Get_IMSessions: IMsgrIMSessions;
begin
    Result := DefaultInterface.IMSessions;
end;

function TMsgrObject.Get_Services: IMsgrServices;
begin
    Result := DefaultInterface.Services;
end;

function TMsgrObject.Get_UnreadEmail(MFOLDER: MFOLDER): Integer;
begin
    Result := DefaultInterface.UnreadEmail[MFOLDER];
end;

procedure TMsgrObject.Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant);
begin
  DefaultInterface.LocalProperty[ePropType] := pvPropVal;
end;

function TMsgrObject.Get_LocalProperty(ePropType: MUSERPROPERTY): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LocalProperty[ePropType];
end;

function TMsgrObject.CreateUser(const bstrLogonName: WideString; const pService: IMsgrService): IMsgrUser;
begin
  Result := DefaultInterface.CreateUser(bstrLogonName, pService);
end;

procedure TMsgrObject.Logon(const bstrUser: WideString; const bstrPassword: WideString; 
                            const pService: IMsgrService);
begin
  DefaultInterface.Logon(bstrUser, bstrPassword, pService);
end;

procedure TMsgrObject.Logoff;
begin
  DefaultInterface.Logoff;
end;

function TMsgrObject.SendAppInvite(const pUser: IMsgrUser; lCookie: Integer; 
                                   const bstrAppGUID: WideString; const bstrAppName: WideString; 
                                   const bstrAppURL: WideString; lInviteType: Integer; 
                                   mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendAppInvite(pUser, lCookie, bstrAppGUID, bstrAppName, bstrAppURL, 
                                           lInviteType, mmtType);
end;

function TMsgrObject.SendAppInviteAccept(const pUser: IMsgrUser; lCookie: Integer; 
                                         lInviteType: Integer; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendAppInviteAccept(pUser, lCookie, lInviteType, mmtType);
end;

function TMsgrObject.SendAppInviteCancel(const pUser: IMsgrUser; lCookie: Integer; 
                                         hrReason: Integer; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendAppInviteCancel(pUser, lCookie, hrReason, mmtType);
end;

function TMsgrObject.FindUser(const bstrFirstName: WideString; const bstrLastName: WideString; 
                              const bstrCity: WideString; const bstrState: WideString; 
                              const bstrCountry: WideString): Integer;
begin
  Result := DefaultInterface.FindUser(bstrFirstName, bstrLastName, bstrCity, bstrState, bstrCountry);
end;

function TMsgrObject.SendInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                    lFindIndex: Integer; lLCID: Integer): Integer;
begin
  Result := DefaultInterface.SendInviteMail(bstrEmailAddress, lFindCookie, lFindIndex, lLCID);
end;

function TMsgrObject.RequestURLPost(muType: MURLTYPE; const bstrAdditionalInfo: WideString): Integer;
begin
  Result := DefaultInterface.RequestURLPost(muType, bstrAdditionalInfo);
end;

function TMsgrObject.CreateIMSession(vUser: OleVariant): IMsgrIMSession;
begin
  Result := DefaultInterface.CreateIMSession(vUser);
end;

procedure TMsgrObject.SessionRequestAccept(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer);
begin
  DefaultInterface.SessionRequestAccept(pIMsgrIMSession, hrReason);
end;

procedure TMsgrObject.SessionRequestCancel(const pIMsgrIMSession: IMsgrIMSession; hrReason: Integer);
begin
  DefaultInterface.SessionRequestCancel(pIMsgrIMSession, hrReason);
end;

function TMsgrObject.SendFileTransferInvite(const pUser: IMsgrUser; lCookie: Integer; 
                                            const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendFileTransferInvite(pUser, lCookie, bstrFilePath, mmtType);
end;

function TMsgrObject.SendFileTransferInviteAccept(const pUser: IMsgrUser; lCookie: Integer; 
                                                  const bstrFilePath: WideString; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendFileTransferInviteAccept(pUser, lCookie, bstrFilePath, mmtType);
end;

function TMsgrObject.SendFileTransferInviteCancel(const pUser: IMsgrUser; lCookie: Integer; 
                                                  hrReason: Integer; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.SendFileTransferInviteCancel(pUser, lCookie, hrReason, mmtType);
end;

function TMsgrObject.CancelFileTransfer(const pUser: IMsgrUser; lCookie: Integer; 
                                        hrReason: Integer; mmtType: MMSGTYPE): Integer;
begin
  Result := DefaultInterface.CancelFileTransfer(pUser, lCookie, hrReason, mmtType);
end;

procedure TMsgrObject.FileTransferStatus(lCookie: Integer; const pUser: IMsgrUser; 
                                         out plStatus: Integer; out pbstrFilePath: WideString; 
                                         out plTotalBytes: Integer; out plBytesTransferred: Integer);
begin
  DefaultInterface.FileTransferStatus(lCookie, pUser, plStatus, pbstrFilePath, plTotalBytes, 
                                      plBytesTransferred);
end;

function TMsgrObject.SendPage(const pUser: IMsgrUser; const bstrMessage: WideString; 
                              ePhoneType: MUSERPROPERTY): Integer;
begin
  Result := DefaultInterface.SendPage(pUser, bstrMessage, ePhoneType);
end;

function TMsgrObject.SendCustomInviteMail(const bstrEmailAddress: WideString; lFindCookie: Integer; 
                                          lFindIndex: Integer; lLCID: Integer; 
                                          const bstrCustomText: WideString): Integer;
begin
  Result := DefaultInterface.SendCustomInviteMail(bstrEmailAddress, lFindCookie, lFindIndex, lLCID, 
                                                  bstrCustomText);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMsgrObjectProperties.Create(AServer: TMsgrObject);
begin
  inherited Create;
  FServer := AServer;
end;

function TMsgrObjectProperties.GetDefaultInterface: IMsgrObject2;
begin
  Result := FServer.DefaultInterface;
end;

function TMsgrObjectProperties.Get_List(MLIST: MLIST): IMsgrUsers;
begin
    Result := DefaultInterface.List[MLIST];
end;

function TMsgrObjectProperties.Get_LocalLogonName: WideString;
begin
    Result := DefaultInterface.LocalLogonName;
end;

function TMsgrObjectProperties.Get_LocalFriendlyName: WideString;
begin
    Result := DefaultInterface.LocalFriendlyName;
end;

procedure TMsgrObjectProperties.Set_LocalState(pmState: MSTATE);
begin
  DefaultInterface.Set_LocalState(pmState);
end;

function TMsgrObjectProperties.Get_LocalState: MSTATE;
begin
    Result := DefaultInterface.LocalState;
end;

procedure TMsgrObjectProperties.Set_MessagePrivacy(pmmpSetting: MMSGPRIVACY);
begin
  DefaultInterface.Set_MessagePrivacy(pmmpSetting);
end;

function TMsgrObjectProperties.Get_MessagePrivacy: MMSGPRIVACY;
begin
    Result := DefaultInterface.MessagePrivacy;
end;

procedure TMsgrObjectProperties.Set_Prompt(pmpSetting: MPROMPT);
begin
  DefaultInterface.Set_Prompt(pmpSetting);
end;

function TMsgrObjectProperties.Get_Prompt: MPROMPT;
begin
    Result := DefaultInterface.Prompt;
end;

procedure TMsgrObjectProperties.Set_LocalOption(option: MLOCALOPTION; pvSetting: OleVariant);
begin
  DefaultInterface.LocalOption[option] := pvSetting;
end;

function TMsgrObjectProperties.Get_LocalOption(option: MLOCALOPTION): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LocalOption[option];
end;

function TMsgrObjectProperties.Get_IMSessions: IMsgrIMSessions;
begin
    Result := DefaultInterface.IMSessions;
end;

function TMsgrObjectProperties.Get_Services: IMsgrServices;
begin
    Result := DefaultInterface.Services;
end;

function TMsgrObjectProperties.Get_UnreadEmail(MFOLDER: MFOLDER): Integer;
begin
    Result := DefaultInterface.UnreadEmail[MFOLDER];
end;

procedure TMsgrObjectProperties.Set_LocalProperty(ePropType: MUSERPROPERTY; pvPropVal: OleVariant);
begin
  DefaultInterface.LocalProperty[ePropType] := pvPropVal;
end;

function TMsgrObjectProperties.Get_LocalProperty(ePropType: MUSERPROPERTY): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LocalProperty[ePropType];
end;

{$ENDIF}

class function CoMessengerApp.Create: IMessengerApp3;
begin
  Result := CreateComObject(CLASS_MessengerApp) as IMessengerApp3;
end;

class function CoMessengerApp.CreateRemote(const MachineName: string): IMessengerApp3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MessengerApp) as IMessengerApp3;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TMsgrObject]);
end;

end.
