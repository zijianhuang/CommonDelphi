unit GoogleTalkAPILib_TLB;

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
// File generated on 15/01/2006 1:33:00 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Google\Google Talk\googletalk.exe (1)
// LIBID: {7B29C130-826A-4070-BA18-EC01E703D244}
// LCID: 0
// Helpfile: 
// HelpString: Google Talk API 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
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
  GoogleTalkAPILibMajorVersion = 1;
  GoogleTalkAPILibMinorVersion = 0;

  LIBID_GoogleTalkAPILib: TGUID = '{7B29C130-826A-4070-BA18-EC01E703D244}';

  IID_ITalkAPI: TGUID = '{4A1527F6-C11F-4131-82BC-FE891D4E3B70}';
  IID_ITalkFriend: TGUID = '{38FDD2C4-9164-4EAF-8C74-24D764FF613E}';
  IID_ITalkPlugin: TGUID = '{5A9FF74C-53D0-4513-9481-0F61EDEEFFE2}';
  CLASS_TalkAPI: TGUID = '{0507EEDE-3AE7-49C7-BF37-0EB4A62D8638}';
  CLASS_TalkFriend: TGUID = '{A8F086C3-2497-4229-82FE-586F2D326F95}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITalkAPI = interface;
  ITalkAPIDisp = dispinterface;
  ITalkFriend = interface;
  ITalkFriendDisp = dispinterface;
  ITalkPlugin = interface;
  ITalkPluginDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TalkAPI = ITalkAPI;
  TalkFriend = ITalkFriend;


// *********************************************************************//
// Interface: ITalkAPI
// Flags:     (320) Dual OleAutomation
// GUID:      {4A1527F6-C11F-4131-82BC-FE891D4E3B70}
// *********************************************************************//
  ITalkAPI = interface(IUnknown)
    ['{4A1527F6-C11F-4131-82BC-FE891D4E3B70}']
    function RegisterPlugin(const plugin_guid: WideString; const plugin_name: WideString; 
                            const plugin_description: WideString; const plugin_url: WideString; 
                            const capability: WideString): WideString; safecall;
    procedure UnregisterPlugin(const plugin_guid_or_progid: WideString); safecall;
    procedure SendMessage(const token: WideString; const user_id: WideString; data: PSafeArray); safecall;
    procedure SendTextMessage(const token: WideString; const user_id: WideString; 
                              const message: WideString); safecall;
    function GetFriends(const token: WideString): PSafeArray; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITalkAPIDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {4A1527F6-C11F-4131-82BC-FE891D4E3B70}
// *********************************************************************//
  ITalkAPIDisp = dispinterface
    ['{4A1527F6-C11F-4131-82BC-FE891D4E3B70}']
    function RegisterPlugin(const plugin_guid: WideString; const plugin_name: WideString; 
                            const plugin_description: WideString; const plugin_url: WideString; 
                            const capability: WideString): WideString; dispid 1610678272;
    procedure UnregisterPlugin(const plugin_guid_or_progid: WideString); dispid 1610678273;
    procedure SendMessage(const token: WideString; const user_id: WideString; 
                          data: {??PSafeArray}OleVariant); dispid 1610678274;
    procedure SendTextMessage(const token: WideString; const user_id: WideString; 
                              const message: WideString); dispid 1610678275;
    function GetFriends(const token: WideString): {??PSafeArray}OleVariant; dispid 1610678276;
  end;

// *********************************************************************//
// Interface: ITalkFriend
// Flags:     (320) Dual OleAutomation
// GUID:      {38FDD2C4-9164-4EAF-8C74-24D764FF613E}
// *********************************************************************//
  ITalkFriend = interface(IUnknown)
    ['{38FDD2C4-9164-4EAF-8C74-24D764FF613E}']
    function GetName: WideString; safecall;
    function GetUserId: WideString; safecall;
    function GetCapabilities: PSafeArray; safecall;
    function GetStatus: LongWord; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITalkFriendDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {38FDD2C4-9164-4EAF-8C74-24D764FF613E}
// *********************************************************************//
  ITalkFriendDisp = dispinterface
    ['{38FDD2C4-9164-4EAF-8C74-24D764FF613E}']
    function GetName: WideString; dispid 1610678272;
    function GetUserId: WideString; dispid 1610678273;
    function GetCapabilities: {??PSafeArray}OleVariant; dispid 1610678274;
    function GetStatus: LongWord; dispid 1610678275;
  end;

// *********************************************************************//
// Interface: ITalkPlugin
// Flags:     (320) Dual OleAutomation
// GUID:      {5A9FF74C-53D0-4513-9481-0F61EDEEFFE2}
// *********************************************************************//
  ITalkPlugin = interface(IUnknown)
    ['{5A9FF74C-53D0-4513-9481-0F61EDEEFFE2}']
    procedure OnReceiveMessage(const talk_friend: IUnknown; data: PSafeArray); safecall;
    procedure OnDropDataOverFriend(const talk_friend: IUnknown; const token: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITalkPluginDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {5A9FF74C-53D0-4513-9481-0F61EDEEFFE2}
// *********************************************************************//
  ITalkPluginDisp = dispinterface
    ['{5A9FF74C-53D0-4513-9481-0F61EDEEFFE2}']
    procedure OnReceiveMessage(const talk_friend: IUnknown; data: {??PSafeArray}OleVariant); dispid 1610678272;
    procedure OnDropDataOverFriend(const talk_friend: IUnknown; const token: WideString); dispid 1610678273;
  end;

// *********************************************************************//
// The Class CoTalkAPI provides a Create and CreateRemote method to          
// create instances of the default interface ITalkAPI exposed by              
// the CoClass TalkAPI. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTalkAPI = class
    class function Create: ITalkAPI;
    class function CreateRemote(const MachineName: string): ITalkAPI;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTalkAPI
// Help String      : TalkAPI Class
// Default Interface: ITalkAPI
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTalkAPIProperties= class;
{$ENDIF}
  TTalkAPI = class(TOleServer)
  private
    FIntf:        ITalkAPI;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTalkAPIProperties;
    function      GetServerProperties: TTalkAPIProperties;
{$ENDIF}
    function      GetDefaultInterface: ITalkAPI;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITalkAPI);
    procedure Disconnect; override;
    function RegisterPlugin(const plugin_guid: WideString; const plugin_name: WideString; 
                            const plugin_description: WideString; const plugin_url: WideString; 
                            const capability: WideString): WideString;
    procedure UnregisterPlugin(const plugin_guid_or_progid: WideString);
    procedure SendMessage(const token: WideString; const user_id: WideString; data: PSafeArray);
    procedure SendTextMessage(const token: WideString; const user_id: WideString; 
                              const message: WideString);
    function GetFriends(const token: WideString): PSafeArray;
    property DefaultInterface: ITalkAPI read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTalkAPIProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTalkAPI
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTalkAPIProperties = class(TPersistent)
  private
    FServer:    TTalkAPI;
    function    GetDefaultInterface: ITalkAPI;
    constructor Create(AServer: TTalkAPI);
  protected
  public
    property DefaultInterface: ITalkAPI read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTalkFriend provides a Create and CreateRemote method to          
// create instances of the default interface ITalkFriend exposed by              
// the CoClass TalkFriend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTalkFriend = class
    class function Create: ITalkFriend;
    class function CreateRemote(const MachineName: string): ITalkFriend;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTalkFriend
// Help String      : TalkFriend Class
// Default Interface: ITalkFriend
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTalkFriendProperties= class;
{$ENDIF}
  TTalkFriend = class(TOleServer)
  private
    FIntf:        ITalkFriend;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTalkFriendProperties;
    function      GetServerProperties: TTalkFriendProperties;
{$ENDIF}
    function      GetDefaultInterface: ITalkFriend;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITalkFriend);
    procedure Disconnect; override;
    function GetName: WideString;
    function GetUserId: WideString;
    function GetCapabilities: PSafeArray;
    function GetStatus: LongWord;
    property DefaultInterface: ITalkFriend read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTalkFriendProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTalkFriend
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTalkFriendProperties = class(TPersistent)
  private
    FServer:    TTalkFriend;
    function    GetDefaultInterface: ITalkFriend;
    constructor Create(AServer: TTalkFriend);
  protected
  public
    property DefaultInterface: ITalkFriend read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTalkAPI.Create: ITalkAPI;
begin
  Result := CreateComObject(CLASS_TalkAPI) as ITalkAPI;
end;

class function CoTalkAPI.CreateRemote(const MachineName: string): ITalkAPI;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TalkAPI) as ITalkAPI;
end;

procedure TTalkAPI.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0507EEDE-3AE7-49C7-BF37-0EB4A62D8638}';
    IntfIID:   '{4A1527F6-C11F-4131-82BC-FE891D4E3B70}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTalkAPI.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITalkAPI;
  end;
end;

procedure TTalkAPI.ConnectTo(svrIntf: ITalkAPI);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTalkAPI.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTalkAPI.GetDefaultInterface: ITalkAPI;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTalkAPI.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTalkAPIProperties.Create(Self);
{$ENDIF}
end;

destructor TTalkAPI.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTalkAPI.GetServerProperties: TTalkAPIProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTalkAPI.RegisterPlugin(const plugin_guid: WideString; const plugin_name: WideString; 
                                 const plugin_description: WideString; 
                                 const plugin_url: WideString; const capability: WideString): WideString;
begin
  Result := DefaultInterface.RegisterPlugin(plugin_guid, plugin_name, plugin_description, 
                                            plugin_url, capability);
end;

procedure TTalkAPI.UnregisterPlugin(const plugin_guid_or_progid: WideString);
begin
  DefaultInterface.UnregisterPlugin(plugin_guid_or_progid);
end;

procedure TTalkAPI.SendMessage(const token: WideString; const user_id: WideString; data: PSafeArray);
begin
  DefaultInterface.SendMessage(token, user_id, data);
end;

procedure TTalkAPI.SendTextMessage(const token: WideString; const user_id: WideString; 
                                   const message: WideString);
begin
  DefaultInterface.SendTextMessage(token, user_id, message);
end;

function TTalkAPI.GetFriends(const token: WideString): PSafeArray;
begin
  Result := DefaultInterface.GetFriends(token);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTalkAPIProperties.Create(AServer: TTalkAPI);
begin
  inherited Create;
  FServer := AServer;
end;

function TTalkAPIProperties.GetDefaultInterface: ITalkAPI;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTalkFriend.Create: ITalkFriend;
begin
  Result := CreateComObject(CLASS_TalkFriend) as ITalkFriend;
end;

class function CoTalkFriend.CreateRemote(const MachineName: string): ITalkFriend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TalkFriend) as ITalkFriend;
end;

procedure TTalkFriend.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A8F086C3-2497-4229-82FE-586F2D326F95}';
    IntfIID:   '{38FDD2C4-9164-4EAF-8C74-24D764FF613E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTalkFriend.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITalkFriend;
  end;
end;

procedure TTalkFriend.ConnectTo(svrIntf: ITalkFriend);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTalkFriend.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTalkFriend.GetDefaultInterface: ITalkFriend;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTalkFriend.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTalkFriendProperties.Create(Self);
{$ENDIF}
end;

destructor TTalkFriend.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTalkFriend.GetServerProperties: TTalkFriendProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTalkFriend.GetName: WideString;
begin
  Result := DefaultInterface.GetName;
end;

function TTalkFriend.GetUserId: WideString;
begin
  Result := DefaultInterface.GetUserId;
end;

function TTalkFriend.GetCapabilities: PSafeArray;
begin
  Result := DefaultInterface.GetCapabilities;
end;

function TTalkFriend.GetStatus: LongWord;
begin
  Result := DefaultInterface.GetStatus;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTalkFriendProperties.Create(AServer: TTalkFriend);
begin
  inherited Create;
  FServer := AServer;
end;

function TTalkFriendProperties.GetDefaultInterface: ITalkFriend;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTalkAPI, TTalkFriend]);
end;

end.
