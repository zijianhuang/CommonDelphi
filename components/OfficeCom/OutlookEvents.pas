{ *****************************************************************************
  WARNING: This component file was generated using the EventSinkImp utility.
           The contents of this file will be overwritten everytime EventSinkImp
           is asked to regenerate this sink component.

  NOTE:    When using this component at the same time with the XXX_TLB.pas in
           your Delphi projects, make sure you always put the XXX_TLB unit name
           AFTER this component unit name in the USES clause of the interface
           section of your unit; otherwise you may get interface conflict
           errors from the Delphi compiler.

           EventSinkImp is written by Binh Ly (bly@techvanguards.com)
  *****************************************************************************
  //Sink Classes//
  TOutlookSyncObjectEvents
  TOutlookExplorerEvents
  TOutlookInspectorEvents
  TOutlookItemEvents
  TOutlookApplicationEvents
  TOutlookExplorersEvents
  TOutlookInspectorsEvents
  TOutlookFoldersEvents
  TOutlookItemsEvents
  TOutlookNameSpaceEvents
  TOutlookOutlookBarGroupsEvents
  TOutlookOutlookBarPaneEvents
  TOutlookOutlookBarShortcutsEvents
  TOutlookDRecipientControlEvents
  TOutlookDDocSiteControlEvents
}

{$IFDEF VER100}
{$DEFINE D3}
{$ENDIF}

{$IFDEF VER140}
{$DEFINE D6}
{$DEFINE D6_OR_ABOVE}
{$ENDIF}

//SinkUnitName//
unit OutlookEvents;

interface

uses
  Windows, ActiveX, Classes, ComObj, OleCtrls
  //SinkUses//
  , StdVCL, Office_TLB
  , Outlook_TLB
  ;

type
  { backward compatibility types }
  {$IFDEF D3}
  OLE_COLOR = TOleColor;
  {$ENDIF}

  TOutlookEventsBaseSinkInvokePacket = class
  protected
    FDispId: integer;
    FFlags: word;
    FParams: PDispParams;
    procedure FreeDispParams;
    procedure InitializeDispParams (const dp: TDispParams);
  public
    constructor Create (iDispId: integer; iFlags: word; const dp: TDispParams);
    destructor Destroy; override;
  end;

  TOutlookEventsBaseSinkInvokeThread = class (TThread)
  protected
    FInvokePacket: TOutlookEventsBaseSinkInvokePacket;
    FOwner: TObject;
    FReadyEvent: THandle;
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; virtual; abstract;
    procedure FreeInvokePacket;
    procedure FreeReadyEvent;
    procedure InitializeInvokePacket (ip: TOutlookEventsBaseSinkInvokePacket);
    procedure Invoke;
  public
    constructor Create (Owner: TObject);
    destructor Destroy; override;
    procedure Execute; override;
    procedure InvokeAsync (iDispId: integer; iFlags: word; const dp: TDispParams);
  end;

  TOutlookEventsBaseSink = class (TComponent, IUnknown, IDispatch)
  protected
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; {$IFNDEF D3} override; {$ENDIF} stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    { IDispatch }
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; virtual; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; virtual; stdcall;
    function GetTypeInfoCount(out Count: Integer): HResult; virtual; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; virtual; stdcall;
  protected
    FCookie: integer;
    FCP: IConnectionPoint;
    FSinkIID: TGUID;
    FSource: IUnknown;
    FInvokeThread: TOutlookEventsBaseSinkInvokeThread;
    procedure CreateInvokeThread; virtual; abstract;
    procedure FreeInvokeThread;
    function GetInvokeThread: TOutlookEventsBaseSinkInvokeThread;
    property InvokeThread: TOutlookEventsBaseSinkInvokeThread read GetInvokeThread;
  public
    destructor Destroy; override;
    procedure Connect (const ASource: IUnknown);
    procedure Disconnect;
    property SinkIID: TGUID read FSinkIID write FSinkIID;
    property Source: IUnknown read FSource;
  end;

  //SinkImportsForwards//

  //SinkImports//

  //SinkIntfStart//

  //SinkEventsForwards//
  TSyncObjectEventsSyncStartEvent = procedure (Sender: TObject) of object;
  TSyncObjectEventsProgressEvent = procedure (Sender: TObject; State: OlSyncState; const Description: WideString; Value: Integer; Max: Integer) of object;
  TSyncObjectEventsOnErrorEvent = procedure (Sender: TObject; Code: Integer; const Description: WideString) of object;
  TSyncObjectEventsSyncEndEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookSyncObjectEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookSyncObjectEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoSyncStart; safecall;
    procedure DoProgress(State: OlSyncState; const Description: WideString; Value: Integer; Max: Integer); safecall;
    procedure DoOnError(Code: Integer; const Description: WideString); safecall;
    procedure DoSyncEnd; safecall;
  protected
    //SinkEventsProtected//
    FSyncStart: TSyncObjectEventsSyncStartEvent;
    FProgress: TSyncObjectEventsProgressEvent;
    FOnError: TSyncObjectEventsOnErrorEvent;
    FSyncEnd: TSyncObjectEventsSyncEndEvent;
  published
    //SinkEventsPublished//
    property SyncStart: TSyncObjectEventsSyncStartEvent read FSyncStart write FSyncStart;
    property Progress: TSyncObjectEventsProgressEvent read FProgress write FProgress;
    property OnError: TSyncObjectEventsOnErrorEvent read FOnError write FOnError;
    property SyncEnd: TSyncObjectEventsSyncEndEvent read FSyncEnd write FSyncEnd;
  end;


  //SinkEventsForwards//
  TExplorerEventsActivateEvent = procedure (Sender: TObject) of object;
  TExplorerEventsFolderSwitchEvent = procedure (Sender: TObject) of object;
  TExplorerEventsBeforeFolderSwitchEvent = procedure (Sender: TObject; const NewFolder: IDispatch; var Cancel: WordBool) of object;
  TExplorerEventsViewSwitchEvent = procedure (Sender: TObject) of object;
  TExplorerEventsBeforeViewSwitchEvent = procedure (Sender: TObject; NewView: OleVariant; var Cancel: WordBool) of object;
  TExplorerEventsDeactivateEvent = procedure (Sender: TObject) of object;
  TExplorerEventsSelectionChangeEvent = procedure (Sender: TObject) of object;
  TExplorerEventsCloseEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookExplorerEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookExplorerEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoActivate; safecall;
    procedure DoFolderSwitch; safecall;
    procedure DoBeforeFolderSwitch(const NewFolder: IDispatch; var Cancel: WordBool); safecall;
    procedure DoViewSwitch; safecall;
    procedure DoBeforeViewSwitch(NewView: OleVariant; var Cancel: WordBool); safecall;
    procedure DoDeactivate; safecall;
    procedure DoSelectionChange; safecall;
    procedure DoClose; safecall;
  protected
    //SinkEventsProtected//
    FActivate: TExplorerEventsActivateEvent;
    FFolderSwitch: TExplorerEventsFolderSwitchEvent;
    FBeforeFolderSwitch: TExplorerEventsBeforeFolderSwitchEvent;
    FViewSwitch: TExplorerEventsViewSwitchEvent;
    FBeforeViewSwitch: TExplorerEventsBeforeViewSwitchEvent;
    FDeactivate: TExplorerEventsDeactivateEvent;
    FSelectionChange: TExplorerEventsSelectionChangeEvent;
    FClose: TExplorerEventsCloseEvent;
  published
    //SinkEventsPublished//
    property Activate: TExplorerEventsActivateEvent read FActivate write FActivate;
    property FolderSwitch: TExplorerEventsFolderSwitchEvent read FFolderSwitch write FFolderSwitch;
    property BeforeFolderSwitch: TExplorerEventsBeforeFolderSwitchEvent read FBeforeFolderSwitch write FBeforeFolderSwitch;
    property ViewSwitch: TExplorerEventsViewSwitchEvent read FViewSwitch write FViewSwitch;
    property BeforeViewSwitch: TExplorerEventsBeforeViewSwitchEvent read FBeforeViewSwitch write FBeforeViewSwitch;
    property Deactivate: TExplorerEventsDeactivateEvent read FDeactivate write FDeactivate;
    property SelectionChange: TExplorerEventsSelectionChangeEvent read FSelectionChange write FSelectionChange;
    property Close: TExplorerEventsCloseEvent read FClose write FClose;
  end;


  //SinkEventsForwards//
  TInspectorEventsActivateEvent = procedure (Sender: TObject) of object;
  TInspectorEventsDeactivateEvent = procedure (Sender: TObject) of object;
  TInspectorEventsCloseEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookInspectorEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookInspectorEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoActivate; safecall;
    procedure DoDeactivate; safecall;
    procedure DoClose; safecall;
  protected
    //SinkEventsProtected//
    FActivate: TInspectorEventsActivateEvent;
    FDeactivate: TInspectorEventsDeactivateEvent;
    FClose: TInspectorEventsCloseEvent;
  published
    //SinkEventsPublished//
    property Activate: TInspectorEventsActivateEvent read FActivate write FActivate;
    property Deactivate: TInspectorEventsDeactivateEvent read FDeactivate write FDeactivate;
    property Close: TInspectorEventsCloseEvent read FClose write FClose;
  end;


  //SinkEventsForwards//
  TItemEventsOpenEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TItemEventsCustomActionEvent = procedure (Sender: TObject; const Action: IDispatch; const Response: IDispatch; var Cancel: WordBool) of object;
  TItemEventsCustomPropertyChangeEvent = procedure (Sender: TObject; const Name: WideString) of object;
  TItemEventsOnForwardEvent = procedure (Sender: TObject; const Forward: IDispatch; var Cancel: WordBool) of object;
  TItemEventsCloseEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TItemEventsPropertyChangeEvent = procedure (Sender: TObject; const Name: WideString) of object;
  TItemEventsReadEvent = procedure (Sender: TObject) of object;
  TItemEventsReplyEvent = procedure (Sender: TObject; const Response: IDispatch; var Cancel: WordBool) of object;
  TItemEventsReplyAllEvent = procedure (Sender: TObject; const Response: IDispatch; var Cancel: WordBool) of object;
  TItemEventsSendEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TItemEventsWriteEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TItemEventsBeforeCheckNamesEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TItemEventsAttachmentAddEvent = procedure (Sender: TObject; const Attachment: Attachment) of object;
  TItemEventsAttachmentReadEvent = procedure (Sender: TObject; const Attachment: Attachment) of object;
  TItemEventsBeforeAttachmentSaveEvent = procedure (Sender: TObject; const Attachment: Attachment; var Cancel: WordBool) of object;

  //SinkComponent//
  TOutlookItemEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookItemEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoOpen(var Cancel: WordBool); safecall;
    procedure DoCustomAction(const Action: IDispatch; const Response: IDispatch; var Cancel: WordBool); safecall;
    procedure DoCustomPropertyChange(const Name: WideString); safecall;
    procedure DoOnForward(const Forward: IDispatch; var Cancel: WordBool); safecall;
    procedure DoClose(var Cancel: WordBool); safecall;
    procedure DoPropertyChange(const Name: WideString); safecall;
    procedure DoRead; safecall;
    procedure DoReply(const Response: IDispatch; var Cancel: WordBool); safecall;
    procedure DoReplyAll(const Response: IDispatch; var Cancel: WordBool); safecall;
    procedure DoSend(var Cancel: WordBool); safecall;
    procedure DoWrite(var Cancel: WordBool); safecall;
    procedure DoBeforeCheckNames(var Cancel: WordBool); safecall;
    procedure DoAttachmentAdd(const Attachment: Attachment); safecall;
    procedure DoAttachmentRead(const Attachment: Attachment); safecall;
    procedure DoBeforeAttachmentSave(const Attachment: Attachment; var Cancel: WordBool); safecall;
  protected
    //SinkEventsProtected//
    FOpen: TItemEventsOpenEvent;
    FCustomAction: TItemEventsCustomActionEvent;
    FCustomPropertyChange: TItemEventsCustomPropertyChangeEvent;
    FOnForward: TItemEventsOnForwardEvent;
    FClose: TItemEventsCloseEvent;
    FPropertyChange: TItemEventsPropertyChangeEvent;
    FRead: TItemEventsReadEvent;
    FReply: TItemEventsReplyEvent;
    FReplyAll: TItemEventsReplyAllEvent;
    FSend: TItemEventsSendEvent;
    FWrite: TItemEventsWriteEvent;
    FBeforeCheckNames: TItemEventsBeforeCheckNamesEvent;
    FAttachmentAdd: TItemEventsAttachmentAddEvent;
    FAttachmentRead: TItemEventsAttachmentReadEvent;
    FBeforeAttachmentSave: TItemEventsBeforeAttachmentSaveEvent;
  published
    //SinkEventsPublished//
    property Open: TItemEventsOpenEvent read FOpen write FOpen;
    property CustomAction: TItemEventsCustomActionEvent read FCustomAction write FCustomAction;
    property CustomPropertyChange: TItemEventsCustomPropertyChangeEvent read FCustomPropertyChange write FCustomPropertyChange;
    property OnForward: TItemEventsOnForwardEvent read FOnForward write FOnForward;
    property Close: TItemEventsCloseEvent read FClose write FClose;
    property PropertyChange: TItemEventsPropertyChangeEvent read FPropertyChange write FPropertyChange;
    property Read: TItemEventsReadEvent read FRead write FRead;
    property Reply: TItemEventsReplyEvent read FReply write FReply;
    property ReplyAll: TItemEventsReplyAllEvent read FReplyAll write FReplyAll;
    property Send: TItemEventsSendEvent read FSend write FSend;
    property Write: TItemEventsWriteEvent read FWrite write FWrite;
    property BeforeCheckNames: TItemEventsBeforeCheckNamesEvent read FBeforeCheckNames write FBeforeCheckNames;
    property AttachmentAdd: TItemEventsAttachmentAddEvent read FAttachmentAdd write FAttachmentAdd;
    property AttachmentRead: TItemEventsAttachmentReadEvent read FAttachmentRead write FAttachmentRead;
    property BeforeAttachmentSave: TItemEventsBeforeAttachmentSaveEvent read FBeforeAttachmentSave write FBeforeAttachmentSave;
  end;


  //SinkEventsForwards//
  TApplicationEventsItemSendEvent = procedure (Sender: TObject; const Item: IDispatch; var Cancel: WordBool) of object;
  TApplicationEventsNewMailEvent = procedure (Sender: TObject) of object;
  TApplicationEventsReminderEvent = procedure (Sender: TObject; const Item: IDispatch) of object;
  TApplicationEventsOptionsPagesAddEvent = procedure (Sender: TObject; const Pages: PropertyPages) of object;
  TApplicationEventsStartupEvent = procedure (Sender: TObject) of object;
  TApplicationEventsQuitEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookApplicationEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookApplicationEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoItemSend(const Item: IDispatch; var Cancel: WordBool); safecall;
    procedure DoNewMail; safecall;
    procedure DoReminder(const Item: IDispatch); safecall;
    procedure DoOptionsPagesAdd(const Pages: PropertyPages); safecall;
    procedure DoStartup; safecall;
    procedure DoQuit; safecall;
  protected
    //SinkEventsProtected//
    FItemSend: TApplicationEventsItemSendEvent;
    FNewMail: TApplicationEventsNewMailEvent;
    FReminder: TApplicationEventsReminderEvent;
    FOptionsPagesAdd: TApplicationEventsOptionsPagesAddEvent;
    FStartup: TApplicationEventsStartupEvent;
    FQuit: TApplicationEventsQuitEvent;
  published
    //SinkEventsPublished//
    property ItemSend: TApplicationEventsItemSendEvent read FItemSend write FItemSend;
    property NewMail: TApplicationEventsNewMailEvent read FNewMail write FNewMail;
    property Reminder: TApplicationEventsReminderEvent read FReminder write FReminder;
    property OptionsPagesAdd: TApplicationEventsOptionsPagesAddEvent read FOptionsPagesAdd write FOptionsPagesAdd;
    property Startup: TApplicationEventsStartupEvent read FStartup write FStartup;
    property Quit: TApplicationEventsQuitEvent read FQuit write FQuit;
  end;


  //SinkEventsForwards//
  TExplorersEventsNewExplorerEvent = procedure (Sender: TObject; const Explorer: _Explorer) of object;

  //SinkComponent//
  TOutlookExplorersEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookExplorersEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoNewExplorer(const Explorer: _Explorer); safecall;
  protected
    //SinkEventsProtected//
    FNewExplorer: TExplorersEventsNewExplorerEvent;
  published
    //SinkEventsPublished//
    property NewExplorer: TExplorersEventsNewExplorerEvent read FNewExplorer write FNewExplorer;
  end;


  //SinkEventsForwards//
  TInspectorsEventsNewInspectorEvent = procedure (Sender: TObject; const Inspector: _Inspector) of object;

  //SinkComponent//
  TOutlookInspectorsEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookInspectorsEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoNewInspector(const Inspector: _Inspector); safecall;
  protected
    //SinkEventsProtected//
    FNewInspector: TInspectorsEventsNewInspectorEvent;
  published
    //SinkEventsPublished//
    property NewInspector: TInspectorsEventsNewInspectorEvent read FNewInspector write FNewInspector;
  end;


  //SinkEventsForwards//
  TFoldersEventsFolderAddEvent = procedure (Sender: TObject; const Folder: MAPIFolder) of object;
  TFoldersEventsFolderChangeEvent = procedure (Sender: TObject; const Folder: MAPIFolder) of object;
  TFoldersEventsFolderRemoveEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookFoldersEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookFoldersEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoFolderAdd(const Folder: MAPIFolder); safecall;
    procedure DoFolderChange(const Folder: MAPIFolder); safecall;
    procedure DoFolderRemove; safecall;
  protected
    //SinkEventsProtected//
    FFolderAdd: TFoldersEventsFolderAddEvent;
    FFolderChange: TFoldersEventsFolderChangeEvent;
    FFolderRemove: TFoldersEventsFolderRemoveEvent;
  published
    //SinkEventsPublished//
    property FolderAdd: TFoldersEventsFolderAddEvent read FFolderAdd write FFolderAdd;
    property FolderChange: TFoldersEventsFolderChangeEvent read FFolderChange write FFolderChange;
    property FolderRemove: TFoldersEventsFolderRemoveEvent read FFolderRemove write FFolderRemove;
  end;


  //SinkEventsForwards//
  TItemsEventsItemAddEvent = procedure (Sender: TObject; const Item: IDispatch) of object;
  TItemsEventsItemChangeEvent = procedure (Sender: TObject; const Item: IDispatch) of object;
  TItemsEventsItemRemoveEvent = procedure (Sender: TObject) of object;

  //SinkComponent//
  TOutlookItemsEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookItemsEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoItemAdd(const Item: IDispatch); safecall;
    procedure DoItemChange(const Item: IDispatch); safecall;
    procedure DoItemRemove; safecall;
  protected
    //SinkEventsProtected//
    FItemAdd: TItemsEventsItemAddEvent;
    FItemChange: TItemsEventsItemChangeEvent;
    FItemRemove: TItemsEventsItemRemoveEvent;
  published
    //SinkEventsPublished//
    property ItemAdd: TItemsEventsItemAddEvent read FItemAdd write FItemAdd;
    property ItemChange: TItemsEventsItemChangeEvent read FItemChange write FItemChange;
    property ItemRemove: TItemsEventsItemRemoveEvent read FItemRemove write FItemRemove;
  end;


  //SinkEventsForwards//
  TNameSpaceEventsOptionsPagesAddEvent = procedure (Sender: TObject; const Pages: PropertyPages; const Folder: MAPIFolder) of object;

  //SinkComponent//
  TOutlookNameSpaceEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookNameSpaceEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoOptionsPagesAdd(const Pages: PropertyPages; const Folder: MAPIFolder); safecall;
  protected
    //SinkEventsProtected//
    FOptionsPagesAdd: TNameSpaceEventsOptionsPagesAddEvent;
  published
    //SinkEventsPublished//
    property OptionsPagesAdd: TNameSpaceEventsOptionsPagesAddEvent read FOptionsPagesAdd write FOptionsPagesAdd;
  end;


  //SinkEventsForwards//
  TOutlookBarGroupsEventsGroupAddEvent = procedure (Sender: TObject; const NewGroup: OutlookBarGroup) of object;
  TOutlookBarGroupsEventsBeforeGroupAddEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TOutlookBarGroupsEventsBeforeGroupRemoveEvent = procedure (Sender: TObject; const Group: OutlookBarGroup; var Cancel: WordBool) of object;

  //SinkComponent//
  TOutlookOutlookBarGroupsEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookOutlookBarGroupsEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoGroupAdd(const NewGroup: OutlookBarGroup); safecall;
    procedure DoBeforeGroupAdd(var Cancel: WordBool); safecall;
    procedure DoBeforeGroupRemove(const Group: OutlookBarGroup; var Cancel: WordBool); safecall;
  protected
    //SinkEventsProtected//
    FGroupAdd: TOutlookBarGroupsEventsGroupAddEvent;
    FBeforeGroupAdd: TOutlookBarGroupsEventsBeforeGroupAddEvent;
    FBeforeGroupRemove: TOutlookBarGroupsEventsBeforeGroupRemoveEvent;
  published
    //SinkEventsPublished//
    property GroupAdd: TOutlookBarGroupsEventsGroupAddEvent read FGroupAdd write FGroupAdd;
    property BeforeGroupAdd: TOutlookBarGroupsEventsBeforeGroupAddEvent read FBeforeGroupAdd write FBeforeGroupAdd;
    property BeforeGroupRemove: TOutlookBarGroupsEventsBeforeGroupRemoveEvent read FBeforeGroupRemove write FBeforeGroupRemove;
  end;


  //SinkEventsForwards//
  TOutlookBarPaneEventsBeforeNavigateEvent = procedure (Sender: TObject; const Shortcut: OutlookBarShortcut; var Cancel: WordBool) of object;
  TOutlookBarPaneEventsBeforeGroupSwitchEvent = procedure (Sender: TObject; const ToGroup: OutlookBarGroup; var Cancel: WordBool) of object;

  //SinkComponent//
  TOutlookOutlookBarPaneEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookOutlookBarPaneEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoBeforeNavigate(const Shortcut: OutlookBarShortcut; var Cancel: WordBool); safecall;
    procedure DoBeforeGroupSwitch(const ToGroup: OutlookBarGroup; var Cancel: WordBool); safecall;
  protected
    //SinkEventsProtected//
    FBeforeNavigate: TOutlookBarPaneEventsBeforeNavigateEvent;
    FBeforeGroupSwitch: TOutlookBarPaneEventsBeforeGroupSwitchEvent;
  published
    //SinkEventsPublished//
    property BeforeNavigate: TOutlookBarPaneEventsBeforeNavigateEvent read FBeforeNavigate write FBeforeNavigate;
    property BeforeGroupSwitch: TOutlookBarPaneEventsBeforeGroupSwitchEvent read FBeforeGroupSwitch write FBeforeGroupSwitch;
  end;


  //SinkEventsForwards//
  TOutlookBarShortcutsEventsShortcutAddEvent = procedure (Sender: TObject; const NewShortcut: OutlookBarShortcut) of object;
  TOutlookBarShortcutsEventsBeforeShortcutAddEvent = procedure (Sender: TObject; var Cancel: WordBool) of object;
  TOutlookBarShortcutsEventsBeforeShortcutRemoveEvent = procedure (Sender: TObject; const Shortcut: OutlookBarShortcut; var Cancel: WordBool) of object;

  //SinkComponent//
  TOutlookOutlookBarShortcutsEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookOutlookBarShortcutsEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
    procedure DoShortcutAdd(const NewShortcut: OutlookBarShortcut); safecall;
    procedure DoBeforeShortcutAdd(var Cancel: WordBool); safecall;
    procedure DoBeforeShortcutRemove(const Shortcut: OutlookBarShortcut; var Cancel: WordBool); safecall;
  protected
    //SinkEventsProtected//
    FShortcutAdd: TOutlookBarShortcutsEventsShortcutAddEvent;
    FBeforeShortcutAdd: TOutlookBarShortcutsEventsBeforeShortcutAddEvent;
    FBeforeShortcutRemove: TOutlookBarShortcutsEventsBeforeShortcutRemoveEvent;
  published
    //SinkEventsPublished//
    property ShortcutAdd: TOutlookBarShortcutsEventsShortcutAddEvent read FShortcutAdd write FShortcutAdd;
    property BeforeShortcutAdd: TOutlookBarShortcutsEventsBeforeShortcutAddEvent read FBeforeShortcutAdd write FBeforeShortcutAdd;
    property BeforeShortcutRemove: TOutlookBarShortcutsEventsBeforeShortcutRemoveEvent read FBeforeShortcutRemove write FBeforeShortcutRemove;
  end;


  //SinkEventsForwards//

  //SinkComponent//
  TOutlookDRecipientControlEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookDRecipientControlEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
  protected
    //SinkEventsProtected//
  published
    //SinkEventsPublished//
  end;


  //SinkEventsForwards//

  //SinkComponent//
  TOutlookDDocSiteControlEventsInvokeThread = class (TOutlookEventsBaseSinkInvokeThread)
  protected
    function DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
      pDispIds: PDispIdList): HResult; override;
  end;

  TOutlookDDocSiteControlEvents = class (TOutlookEventsBaseSink
    //ISinkInterface//
  )
  protected
    procedure CreateInvokeThread; override;

    //ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create (AOwner: TComponent); override;
  protected
    //SinkInterface//
  protected
    //SinkEventsProtected//
  published
    //SinkEventsPublished//
  end;

  //SinkIntfEnd//

procedure Register;

implementation

uses
  Messages, SysUtils {$IFDEF D6_OR_ABOVE}, Variants {$ENDIF};

var
  WM_INVOKE: UINT = WM_USER + $1234;

{ globals }

procedure BuildPositionalDispIds (pDispIds: PDispIdList; const dps: TDispParams);
var
  i: integer;
begin
  Assert (pDispIds <> nil);
  
  { by default, directly arrange in reverse order }
  for i := 0 to dps.cArgs - 1 do
    pDispIds^ [i] := dps.cArgs - 1 - i;

  { check for named args }
  if (dps.cNamedArgs <= 0) then Exit;

  { parse named args }
  for i := 0 to dps.cNamedArgs - 1 do
    pDispIds^ [dps.rgdispidNamedArgs^ [i]] := i;
end;


{ TOutlookEventsBaseSinkInvokePacket }

procedure TOutlookEventsBaseSinkInvokePacket.FreeDispParams;
var
  i: integer;
begin
  if (FParams = nil) then Exit;
  for i := 0 to FParams^.cArgs - 1 do
    Variant (FParams^.rgvarg^ [i]) := Unassigned;
  if (FParams^.cArgs > 0) then
    FreeMem (FParams^.rgvarg, sizeof (TVariantArg) * FParams^.cArgs);
  if (FParams^.cNamedArgs > 0) then
    FreeMem (FParams^.rgdispidNamedArgs, sizeof (TDispId) * FParams^.cNamedArgs);
  Dispose (FParams);
  FParams := nil;
end;

procedure TOutlookEventsBaseSinkInvokePacket.InitializeDispParams (const dp: TDispParams);
var
  i: integer;
begin
  FreeDispParams;
  New (FParams);
  FillChar (FParams^, sizeof (TDispParams), 0);
  FParams^.cArgs := dp.cArgs;
  FParams^.cNamedArgs := dp.cNamedArgs;
  if (dp.cArgs > 0) then
  begin
    GetMem (FParams^.rgvarg, sizeof (TVariantArg) * dp.cArgs);
    for i := 0 to dp.cArgs - 1 do
      Variant (FParams^.rgvarg^ [i]) := Variant (dp.rgvarg^ [i]);
  end;  { if }
  if (dp.cNamedArgs > 0) then
  begin
    GetMem (FParams^.rgdispidNamedArgs, sizeof (TDispId) * dp.cNamedArgs);
    for i := 0 to dp.cNamedArgs - 1 do
      FParams^.rgdispidNamedArgs^ [i] := dp.rgdispidNamedArgs^ [i];
  end;  { if }
end;

constructor TOutlookEventsBaseSinkInvokePacket.Create (iDispId: integer; iFlags: word; const dp: TDispParams);
begin
  inherited Create;
  FDispId := iDispId;
  FFlags := iFlags;
  InitializeDispParams (dp);
end;

destructor TOutlookEventsBaseSinkInvokePacket.Destroy;
begin
  FreeDispParams;
  inherited;
end;


{ TOutlookEventsBaseSinkInvokeThread }

procedure TOutlookEventsBaseSinkInvokeThread.FreeInvokePacket;
begin
  if (FInvokePacket = nil) then Exit;
  FInvokePacket.Free;
  FInvokePacket := nil;
end;

procedure TOutlookEventsBaseSinkInvokeThread.FreeReadyEvent;
begin
  if (FReadyEvent = 0) then Exit;
  CloseHandle (FReadyEvent);
  FReadyEvent := 0;
end;

procedure TOutlookEventsBaseSinkInvokeThread.InitializeInvokePacket (ip: TOutlookEventsBaseSinkInvokePacket);
begin
  FreeInvokePacket;
  FInvokePacket := ip;
end;

procedure TOutlookEventsBaseSinkInvokeThread.Invoke;
var
  bHasParams: boolean;
  pDispIds: PDispIdList;
  iDispIdsSize: integer;
begin
  if (FInvokePacket = nil) then Exit;

  with FInvokePacket do
  begin
    { validity checks }
    if (FFlags AND DISPATCH_METHOD = 0) then
      raise Exception.Create (
        Format ('%s only supports sinking of method calls!', [ClassName]
      ));

    { build pDispIds array. this maybe a bit of overhead but it allows us to
      sink named-argument calls such as Excel's AppEvents, etc!
    }
    pDispIds := nil;
    iDispIdsSize := 0;
    bHasParams := (FParams^.cArgs > 0);
    if (bHasParams) then
    begin
      iDispIdsSize := FParams^.cArgs * SizeOf (TDispId);
      GetMem (pDispIds, iDispIdsSize);
    end;  { if }

    try
      { rearrange dispids properly }
      if (bHasParams) then BuildPositionalDispIds (pDispIds, FParams^);
      DoInvoke (FDispId, FFlags, FParams^, pDispIds);
    finally
      { free pDispIds array }
      if (bHasParams) then FreeMem (pDispIds, iDispIdsSize);
    end;  { finally }
  end;  { with }

  FreeInvokePacket;
end;

constructor TOutlookEventsBaseSinkInvokeThread.Create (Owner: TObject);
begin
  inherited Create (True);
  FReadyEvent := CreateEvent (nil, TRUE, FALSE, '');
  FOwner := Owner;
end;

destructor TOutlookEventsBaseSinkInvokeThread.Destroy;
begin
  FreeInvokePacket;
  FreeReadyEvent;
  inherited;
end;

procedure TOutlookEventsBaseSinkInvokeThread.Execute;
var
  rMsg: TMsg;
begin
  PeekMessage (rMsg, 0, 0, 0, PM_NOREMOVE);  // force thread message queue!
  SetEvent (FReadyEvent);
  
  while (GetMessage (rMsg, 0, 0, 0)) do
  begin
    if (rMsg.Message = WM_INVOKE) then
    begin
      { lParam -> TOutlookEventsBaseSinkInvokePacket instance }
      InitializeInvokePacket (TOutlookEventsBaseSinkInvokePacket (rMsg.lParam));
      Synchronize (Invoke);
    end;  { if }
  end;  { while }

  Terminate;
end;

procedure TOutlookEventsBaseSinkInvokeThread.InvokeAsync (iDispId: integer; iFlags: word; const dp: TDispParams);
var
  ip: TOutlookEventsBaseSinkInvokePacket;
begin
  ip := TOutlookEventsBaseSinkInvokePacket.Create (iDispId, iFlags, dp);
  PostThreadMessage (ThreadId, WM_INVOKE, 0, lParam (ip));
end;


{ TOutlookEventsBaseSink }

function TOutlookEventsBaseSink.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TOutlookEventsBaseSink.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
  pointer (TypeInfo) := nil;
end;

function TOutlookEventsBaseSink.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
  Count := 0;
end;

function TOutlookEventsBaseSink.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  InvokeThread.InvokeAsync (DispId, Flags, TDispParams (Params));
  Result := S_OK;
end;

function TOutlookEventsBaseSink.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if (GetInterface (IID, Obj)) then
  begin
    Result := S_OK;
    Exit;
  end
  else
    if (IsEqualIID (IID, FSinkIID)) then
      if (GetInterface (IDispatch, Obj)) then
      begin
        Result := S_OK;
        Exit;
      end;
  Result := E_NOINTERFACE;
  pointer (Obj) := nil;
end;

function TOutlookEventsBaseSink._AddRef: Integer;
begin
  Result := 2;
end;

function TOutlookEventsBaseSink._Release: Integer;
begin
  Result := 1;
end;

procedure TOutlookEventsBaseSink.FreeInvokeThread;
begin
  if (FInvokeThread = nil) then Exit;
  if not (FInvokeThread.Terminated) then
  begin
    PostThreadMessage (FInvokeThread.ThreadId, WM_QUIT, 0, 0);
    FInvokeThread.WaitFor;
  end;  { if }
  FInvokeThread.Free;
  FInvokeThread := nil;
end;

function TOutlookEventsBaseSink.GetInvokeThread: TOutlookEventsBaseSinkInvokeThread;
begin
  if (FInvokeThread = nil) then
  begin
    CreateInvokeThread;
    FInvokeThread.Resume;
    WaitForSingleObject (FInvokeThread.FReadyEvent, INFINITE);
    FInvokeThread.FreeReadyEvent;
  end;  { if }
  Result := FInvokeThread;
end;

destructor TOutlookEventsBaseSink.Destroy;
begin
  FreeInvokeThread;
  Disconnect;
  inherited;
end;

procedure TOutlookEventsBaseSink.Connect (const ASource: IUnknown);
var
  pcpc: IConnectionPointContainer;
begin
  Assert (ASource <> nil);
  Disconnect;
  try
    OleCheck (ASource.QueryInterface (IConnectionPointContainer, pcpc));
    OleCheck (pcpc.FindConnectionPoint (FSinkIID, FCP));
    OleCheck (FCP.Advise (Self, FCookie));
    FSource := ASource;
  except
    raise Exception.Create (Format ('Unable to connect %s.'#13'%s',
      [Name, Exception (ExceptObject).Message]
    ));
  end;  { finally }
end;

procedure TOutlookEventsBaseSink.Disconnect;
begin
  if (FSource = nil) then Exit;
  try
    FreeInvokeThread;
    OleCheck (FCP.Unadvise (FCookie));
    FCP := nil;
    FSource := nil;
  except
    pointer (FCP) := nil;
    pointer (FSource) := nil;
  end;  { except }
end;


//SinkImplStart//

function TOutlookSyncObjectEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookSyncObjectEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoSyncStart ();
        Result := S_OK;
      end;
      61442 :
      begin
        DoProgress (OlSyncState (dps.rgvarg^ [pDispIds^ [0]].lval), dps.rgvarg^ [pDispIds^ [1]].bstrval, dps.rgvarg^ [pDispIds^ [2]].lval, dps.rgvarg^ [pDispIds^ [3]].lval);
        Result := S_OK;
      end;
      61443 :
      begin
        DoOnError (dps.rgvarg^ [pDispIds^ [0]].lval, dps.rgvarg^ [pDispIds^ [1]].bstrval);
        Result := S_OK;
      end;
      61444 :
      begin
        DoSyncEnd ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookSyncObjectEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookSyncObjectEventsInvokeThread.Create (Self);
end;

constructor TOutlookSyncObjectEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := SyncObjectEvents;
end;

//SinkImplementation//
procedure TOutlookSyncObjectEvents.DoSyncStart;
begin
  if not Assigned (SyncStart) then System.Exit;
  SyncStart (Self);
end;

procedure TOutlookSyncObjectEvents.DoProgress(State: OlSyncState; const Description: WideString; Value: Integer; Max: Integer);
begin
  if not Assigned (Progress) then System.Exit;
  Progress (Self, State, Description, Value, Max);
end;

procedure TOutlookSyncObjectEvents.DoOnError(Code: Integer; const Description: WideString);
begin
  if not Assigned (OnError) then System.Exit;
  OnError (Self, Code, Description);
end;

procedure TOutlookSyncObjectEvents.DoSyncEnd;
begin
  if not Assigned (SyncEnd) then System.Exit;
  SyncEnd (Self);
end;



function TOutlookExplorerEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookExplorerEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoActivate ();
        Result := S_OK;
      end;
      61442 :
      begin
        DoFolderSwitch ();
        Result := S_OK;
      end;
      61443 :
      begin
        DoBeforeFolderSwitch (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61444 :
      begin
        DoViewSwitch ();
        Result := S_OK;
      end;
      61445 :
      begin
        DoBeforeViewSwitch (OleVariant (dps.rgvarg^ [pDispIds^ [0]]), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61446 :
      begin
        DoDeactivate ();
        Result := S_OK;
      end;
      61447 :
      begin
        DoSelectionChange ();
        Result := S_OK;
      end;
      61448 :
      begin
        DoClose ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookExplorerEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookExplorerEventsInvokeThread.Create (Self);
end;

constructor TOutlookExplorerEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := ExplorerEvents;
end;

//SinkImplementation//
procedure TOutlookExplorerEvents.DoActivate;
begin
  if not Assigned (Activate) then System.Exit;
  Activate (Self);
end;

procedure TOutlookExplorerEvents.DoFolderSwitch;
begin
  if not Assigned (FolderSwitch) then System.Exit;
  FolderSwitch (Self);
end;

procedure TOutlookExplorerEvents.DoBeforeFolderSwitch(const NewFolder: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (BeforeFolderSwitch) then System.Exit;
  BeforeFolderSwitch (Self, NewFolder, Cancel);
end;

procedure TOutlookExplorerEvents.DoViewSwitch;
begin
  if not Assigned (ViewSwitch) then System.Exit;
  ViewSwitch (Self);
end;

procedure TOutlookExplorerEvents.DoBeforeViewSwitch(NewView: OleVariant; var Cancel: WordBool);
begin
  if not Assigned (BeforeViewSwitch) then System.Exit;
  BeforeViewSwitch (Self, NewView, Cancel);
end;

procedure TOutlookExplorerEvents.DoDeactivate;
begin
  if not Assigned (Deactivate) then System.Exit;
  Deactivate (Self);
end;

procedure TOutlookExplorerEvents.DoSelectionChange;
begin
  if not Assigned (SelectionChange) then System.Exit;
  SelectionChange (Self);
end;

procedure TOutlookExplorerEvents.DoClose;
begin
  if not Assigned (Close) then System.Exit;
  Close (Self);
end;



function TOutlookInspectorEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookInspectorEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoActivate ();
        Result := S_OK;
      end;
      61446 :
      begin
        DoDeactivate ();
        Result := S_OK;
      end;
      61448 :
      begin
        DoClose ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookInspectorEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookInspectorEventsInvokeThread.Create (Self);
end;

constructor TOutlookInspectorEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := InspectorEvents;
end;

//SinkImplementation//
procedure TOutlookInspectorEvents.DoActivate;
begin
  if not Assigned (Activate) then System.Exit;
  Activate (Self);
end;

procedure TOutlookInspectorEvents.DoDeactivate;
begin
  if not Assigned (Deactivate) then System.Exit;
  Deactivate (Self);
end;

procedure TOutlookInspectorEvents.DoClose;
begin
  if not Assigned (Close) then System.Exit;
  Close (Self);
end;



function TOutlookItemEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookItemEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61443 :
      begin
        DoOpen (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61446 :
      begin
        DoCustomAction (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), IDispatch (dps.rgvarg^ [pDispIds^ [1]].dispval), dps.rgvarg^ [pDispIds^ [2]].pbool^);
        Result := S_OK;
      end;
      61448 :
      begin
        DoCustomPropertyChange (dps.rgvarg^ [pDispIds^ [0]].bstrval);
        Result := S_OK;
      end;
      62568 :
      begin
        DoOnForward (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61444 :
      begin
        DoClose (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61449 :
      begin
        DoPropertyChange (dps.rgvarg^ [pDispIds^ [0]].bstrval);
        Result := S_OK;
      end;
      61441 :
      begin
        DoRead ();
        Result := S_OK;
      end;
      62566 :
      begin
        DoReply (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      62567 :
      begin
        DoReplyAll (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61445 :
      begin
        DoSend (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61442 :
      begin
        DoWrite (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61450 :
      begin
        DoBeforeCheckNames (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61451 :
      begin
        DoAttachmentAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as Attachment);
        Result := S_OK;
      end;
      61452 :
      begin
        DoAttachmentRead (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as Attachment);
        Result := S_OK;
      end;
      61453 :
      begin
        DoBeforeAttachmentSave (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as Attachment, dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookItemEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookItemEventsInvokeThread.Create (Self);
end;

constructor TOutlookItemEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := ItemEvents;
end;

//SinkImplementation//
procedure TOutlookItemEvents.DoOpen(var Cancel: WordBool);
begin
  if not Assigned (Open) then System.Exit;
  Open (Self, Cancel);
end;

procedure TOutlookItemEvents.DoCustomAction(const Action: IDispatch; const Response: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (CustomAction) then System.Exit;
  CustomAction (Self, Action, Response, Cancel);
end;

procedure TOutlookItemEvents.DoCustomPropertyChange(const Name: WideString);
begin
  if not Assigned (CustomPropertyChange) then System.Exit;
  CustomPropertyChange (Self, Name);
end;

procedure TOutlookItemEvents.DoOnForward(const Forward: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (OnForward) then System.Exit;
  OnForward (Self, Forward, Cancel);
end;

procedure TOutlookItemEvents.DoClose(var Cancel: WordBool);
begin
  if not Assigned (Close) then System.Exit;
  Close (Self, Cancel);
end;

procedure TOutlookItemEvents.DoPropertyChange(const Name: WideString);
begin
  if not Assigned (PropertyChange) then System.Exit;
  PropertyChange (Self, Name);
end;

procedure TOutlookItemEvents.DoRead;
begin
  if not Assigned (Read) then System.Exit;
  Read (Self);
end;

procedure TOutlookItemEvents.DoReply(const Response: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (Reply) then System.Exit;
  Reply (Self, Response, Cancel);
end;

procedure TOutlookItemEvents.DoReplyAll(const Response: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (ReplyAll) then System.Exit;
  ReplyAll (Self, Response, Cancel);
end;

procedure TOutlookItemEvents.DoSend(var Cancel: WordBool);
begin
  if not Assigned (Send) then System.Exit;
  Send (Self, Cancel);
end;

procedure TOutlookItemEvents.DoWrite(var Cancel: WordBool);
begin
  if not Assigned (Write) then System.Exit;
  Write (Self, Cancel);
end;

procedure TOutlookItemEvents.DoBeforeCheckNames(var Cancel: WordBool);
begin
  if not Assigned (BeforeCheckNames) then System.Exit;
  BeforeCheckNames (Self, Cancel);
end;

procedure TOutlookItemEvents.DoAttachmentAdd(const Attachment: Attachment);
begin
  if not Assigned (AttachmentAdd) then System.Exit;
  AttachmentAdd (Self, Attachment);
end;

procedure TOutlookItemEvents.DoAttachmentRead(const Attachment: Attachment);
begin
  if not Assigned (AttachmentRead) then System.Exit;
  AttachmentRead (Self, Attachment);
end;

procedure TOutlookItemEvents.DoBeforeAttachmentSave(const Attachment: Attachment; var Cancel: WordBool);
begin
  if not Assigned (BeforeAttachmentSave) then System.Exit;
  BeforeAttachmentSave (Self, Attachment, Cancel);
end;



function TOutlookApplicationEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookApplicationEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61442 :
      begin
        DoItemSend (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval), dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61443 :
      begin
        DoNewMail ();
        Result := S_OK;
      end;
      61444 :
      begin
        DoReminder (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval));
        Result := S_OK;
      end;
      61445 :
      begin
        DoOptionsPagesAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as PropertyPages);
        Result := S_OK;
      end;
      61446 :
      begin
        DoStartup ();
        Result := S_OK;
      end;
      61447 :
      begin
        DoQuit ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookApplicationEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookApplicationEventsInvokeThread.Create (Self);
end;

constructor TOutlookApplicationEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := ApplicationEvents;
end;

//SinkImplementation//
procedure TOutlookApplicationEvents.DoItemSend(const Item: IDispatch; var Cancel: WordBool);
begin
  if not Assigned (ItemSend) then System.Exit;
  ItemSend (Self, Item, Cancel);
end;

procedure TOutlookApplicationEvents.DoNewMail;
begin
  if not Assigned (NewMail) then System.Exit;
  NewMail (Self);
end;

procedure TOutlookApplicationEvents.DoReminder(const Item: IDispatch);
begin
  if not Assigned (Reminder) then System.Exit;
  Reminder (Self, Item);
end;

procedure TOutlookApplicationEvents.DoOptionsPagesAdd(const Pages: PropertyPages);
begin
  if not Assigned (OptionsPagesAdd) then System.Exit;
  OptionsPagesAdd (Self, Pages);
end;

procedure TOutlookApplicationEvents.DoStartup;
begin
  if not Assigned (Startup) then System.Exit;
  Startup (Self);
end;

procedure TOutlookApplicationEvents.DoQuit;
begin
  if not Assigned (Quit) then System.Exit;
  Quit (Self);
end;



function TOutlookExplorersEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookExplorersEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoNewExplorer (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as _Explorer);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookExplorersEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookExplorersEventsInvokeThread.Create (Self);
end;

constructor TOutlookExplorersEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := ExplorersEvents;
end;

//SinkImplementation//
procedure TOutlookExplorersEvents.DoNewExplorer(const Explorer: _Explorer);
begin
  if not Assigned (NewExplorer) then System.Exit;
  NewExplorer (Self, Explorer);
end;



function TOutlookInspectorsEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookInspectorsEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoNewInspector (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as _Inspector);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookInspectorsEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookInspectorsEventsInvokeThread.Create (Self);
end;

constructor TOutlookInspectorsEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := InspectorsEvents;
end;

//SinkImplementation//
procedure TOutlookInspectorsEvents.DoNewInspector(const Inspector: _Inspector);
begin
  if not Assigned (NewInspector) then System.Exit;
  NewInspector (Self, Inspector);
end;



function TOutlookFoldersEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookFoldersEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoFolderAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as MAPIFolder);
        Result := S_OK;
      end;
      61442 :
      begin
        DoFolderChange (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as MAPIFolder);
        Result := S_OK;
      end;
      61443 :
      begin
        DoFolderRemove ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookFoldersEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookFoldersEventsInvokeThread.Create (Self);
end;

constructor TOutlookFoldersEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := FoldersEvents;
end;

//SinkImplementation//
procedure TOutlookFoldersEvents.DoFolderAdd(const Folder: MAPIFolder);
begin
  if not Assigned (FolderAdd) then System.Exit;
  FolderAdd (Self, Folder);
end;

procedure TOutlookFoldersEvents.DoFolderChange(const Folder: MAPIFolder);
begin
  if not Assigned (FolderChange) then System.Exit;
  FolderChange (Self, Folder);
end;

procedure TOutlookFoldersEvents.DoFolderRemove;
begin
  if not Assigned (FolderRemove) then System.Exit;
  FolderRemove (Self);
end;



function TOutlookItemsEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookItemsEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoItemAdd (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval));
        Result := S_OK;
      end;
      61442 :
      begin
        DoItemChange (IDispatch (dps.rgvarg^ [pDispIds^ [0]].dispval));
        Result := S_OK;
      end;
      61443 :
      begin
        DoItemRemove ();
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookItemsEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookItemsEventsInvokeThread.Create (Self);
end;

constructor TOutlookItemsEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := ItemsEvents;
end;

//SinkImplementation//
procedure TOutlookItemsEvents.DoItemAdd(const Item: IDispatch);
begin
  if not Assigned (ItemAdd) then System.Exit;
  ItemAdd (Self, Item);
end;

procedure TOutlookItemsEvents.DoItemChange(const Item: IDispatch);
begin
  if not Assigned (ItemChange) then System.Exit;
  ItemChange (Self, Item);
end;

procedure TOutlookItemsEvents.DoItemRemove;
begin
  if not Assigned (ItemRemove) then System.Exit;
  ItemRemove (Self);
end;



function TOutlookNameSpaceEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookNameSpaceEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61445 :
      begin
        DoOptionsPagesAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as PropertyPages, IUnknown (dps.rgvarg^ [pDispIds^ [1]].unkval) as MAPIFolder);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookNameSpaceEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookNameSpaceEventsInvokeThread.Create (Self);
end;

constructor TOutlookNameSpaceEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := NameSpaceEvents;
end;

//SinkImplementation//
procedure TOutlookNameSpaceEvents.DoOptionsPagesAdd(const Pages: PropertyPages; const Folder: MAPIFolder);
begin
  if not Assigned (OptionsPagesAdd) then System.Exit;
  OptionsPagesAdd (Self, Pages, Folder);
end;



function TOutlookOutlookBarGroupsEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookOutlookBarGroupsEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoGroupAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarGroup);
        Result := S_OK;
      end;
      61442 :
      begin
        DoBeforeGroupAdd (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61443 :
      begin
        DoBeforeGroupRemove (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarGroup, dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookOutlookBarGroupsEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookOutlookBarGroupsEventsInvokeThread.Create (Self);
end;

constructor TOutlookOutlookBarGroupsEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := OutlookBarGroupsEvents;
end;

//SinkImplementation//
procedure TOutlookOutlookBarGroupsEvents.DoGroupAdd(const NewGroup: OutlookBarGroup);
begin
  if not Assigned (GroupAdd) then System.Exit;
  GroupAdd (Self, NewGroup);
end;

procedure TOutlookOutlookBarGroupsEvents.DoBeforeGroupAdd(var Cancel: WordBool);
begin
  if not Assigned (BeforeGroupAdd) then System.Exit;
  BeforeGroupAdd (Self, Cancel);
end;

procedure TOutlookOutlookBarGroupsEvents.DoBeforeGroupRemove(const Group: OutlookBarGroup; var Cancel: WordBool);
begin
  if not Assigned (BeforeGroupRemove) then System.Exit;
  BeforeGroupRemove (Self, Group, Cancel);
end;



function TOutlookOutlookBarPaneEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookOutlookBarPaneEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoBeforeNavigate (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarShortcut, dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
      61442 :
      begin
        DoBeforeGroupSwitch (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarGroup, dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookOutlookBarPaneEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookOutlookBarPaneEventsInvokeThread.Create (Self);
end;

constructor TOutlookOutlookBarPaneEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := OutlookBarPaneEvents;
end;

//SinkImplementation//
procedure TOutlookOutlookBarPaneEvents.DoBeforeNavigate(const Shortcut: OutlookBarShortcut; var Cancel: WordBool);
begin
  if not Assigned (BeforeNavigate) then System.Exit;
  BeforeNavigate (Self, Shortcut, Cancel);
end;

procedure TOutlookOutlookBarPaneEvents.DoBeforeGroupSwitch(const ToGroup: OutlookBarGroup; var Cancel: WordBool);
begin
  if not Assigned (BeforeGroupSwitch) then System.Exit;
  BeforeGroupSwitch (Self, ToGroup, Cancel);
end;



function TOutlookOutlookBarShortcutsEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookOutlookBarShortcutsEvents (FOwner) do
  begin
    //SinkInvoke//
    case DispId of
      61441 :
      begin
        DoShortcutAdd (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarShortcut);
        Result := S_OK;
      end;
      61442 :
      begin
        DoBeforeShortcutAdd (dps.rgvarg^ [pDispIds^ [0]].pbool^);
        Result := S_OK;
      end;
      61443 :
      begin
        DoBeforeShortcutRemove (IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as OutlookBarShortcut, dps.rgvarg^ [pDispIds^ [1]].pbool^);
        Result := S_OK;
      end;
    end;  { case }
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookOutlookBarShortcutsEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookOutlookBarShortcutsEventsInvokeThread.Create (Self);
end;

constructor TOutlookOutlookBarShortcutsEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := OutlookBarShortcutsEvents;
end;

//SinkImplementation//
procedure TOutlookOutlookBarShortcutsEvents.DoShortcutAdd(const NewShortcut: OutlookBarShortcut);
begin
  if not Assigned (ShortcutAdd) then System.Exit;
  ShortcutAdd (Self, NewShortcut);
end;

procedure TOutlookOutlookBarShortcutsEvents.DoBeforeShortcutAdd(var Cancel: WordBool);
begin
  if not Assigned (BeforeShortcutAdd) then System.Exit;
  BeforeShortcutAdd (Self, Cancel);
end;

procedure TOutlookOutlookBarShortcutsEvents.DoBeforeShortcutRemove(const Shortcut: OutlookBarShortcut; var Cancel: WordBool);
begin
  if not Assigned (BeforeShortcutRemove) then System.Exit;
  BeforeShortcutRemove (Self, Shortcut, Cancel);
end;



function TOutlookDRecipientControlEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookDRecipientControlEvents (FOwner) do
  begin
    //SinkInvoke//
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookDRecipientControlEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookDRecipientControlEventsInvokeThread.Create (Self);
end;

constructor TOutlookDRecipientControlEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := _DRecipientControlEvents;
end;

//SinkImplementation//


function TOutlookDDocSiteControlEventsInvokeThread.DoInvoke (DispId: integer; Flags: Word; const dps: TDispParams;
  pDispIds: PDispIdList): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := S_OK;
  with TOutlookDDocSiteControlEvents (FOwner) do
  begin
    //SinkInvoke//
    //SinkInvokeEnd//
  end;  { with }
end;

procedure TOutlookDDocSiteControlEvents.CreateInvokeThread;
begin
  FInvokeThread := TOutlookDDocSiteControlEventsInvokeThread.Create (Self);
end;

constructor TOutlookDDocSiteControlEvents.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  //SinkInit//
  FSinkIID := _DDocSiteControlEvents;
end;

//SinkImplementation//

//SinkImplEnd//

procedure Register;
begin
  //SinkRegisterStart//
  RegisterComponents ('OutlookEvents', [TOutlookSyncObjectEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookExplorerEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookInspectorEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookItemEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookApplicationEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookExplorersEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookInspectorsEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookFoldersEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookItemsEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookNameSpaceEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookOutlookBarGroupsEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookOutlookBarPaneEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookOutlookBarShortcutsEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookDRecipientControlEvents]);
  RegisterComponents ('OutlookEvents', [TOutlookDDocSiteControlEvents]);
  //SinkRegisterEnd//
end;

initialization
  WM_INVOKE := RegisterWindowMessage ('SinkComponentAsyncInvokeMessage');
end.
