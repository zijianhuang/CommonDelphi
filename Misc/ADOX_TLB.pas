unit ADOX_TLB;

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
// File generated on 28/01/2006 4:58:14 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Common Files\System\ado\msadox.dll (1)
// LIBID: {00000600-0000-0010-8000-00AA006D2EA4}
// LCID: 0
// Helpfile: C:\Program Files\Common Files\System\ado\ado270.chm
// HelpString: Microsoft ADO Ext. 2.8 for DDL and Security
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: TypeInfo 'Property' changed to 'Property_'
//   Hint: TypeInfo 'Procedure' changed to 'Procedure_'
//   Hint: Parameter 'Object' of _DynaCollection.Append changed to 'Object_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Columns.Append changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Keys.Append changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Error creating palette bitmap of (TAdoxTable) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxColumn) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxIndex) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxKey) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxGroup) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxUser) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
//   Error creating palette bitmap of (TAdoxCatalog) : Server C:\Program Files\Common Files\System\ado\msadox.dll contains no icons
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
  ADOXMajorVersion = 2;
  ADOXMinorVersion = 8;

  LIBID_ADOX: TGUID = '{00000600-0000-0010-8000-00AA006D2EA4}';

  IID__Collection: TGUID = '{00000512-0000-0010-8000-00AA006D2EA4}';
  IID__DynaCollection: TGUID = '{00000513-0000-0010-8000-00AA006D2EA4}';
  IID__Catalog: TGUID = '{00000603-0000-0010-8000-00AA006D2EA4}';
  IID_Tables: TGUID = '{00000611-0000-0010-8000-00AA006D2EA4}';
  IID__Table: TGUID = '{00000610-0000-0010-8000-00AA006D2EA4}';
  CLASS_Table: TGUID = '{00000609-0000-0010-8000-00AA006D2EA4}';
  IID_Columns: TGUID = '{0000061D-0000-0010-8000-00AA006D2EA4}';
  IID__Column: TGUID = '{0000061C-0000-0010-8000-00AA006D2EA4}';
  CLASS_Column: TGUID = '{0000061B-0000-0010-8000-00AA006D2EA4}';
  IID_Properties: TGUID = '{00000504-0000-0010-8000-00AA006D2EA4}';
  IID_Property_: TGUID = '{00000503-0000-0010-8000-00AA006D2EA4}';
  IID_Indexes: TGUID = '{00000620-0000-0010-8000-00AA006D2EA4}';
  IID__Index: TGUID = '{0000061F-0000-0010-8000-00AA006D2EA4}';
  CLASS_Index: TGUID = '{0000061E-0000-0010-8000-00AA006D2EA4}';
  IID_Keys: TGUID = '{00000623-0000-0010-8000-00AA006D2EA4}';
  IID__Key: TGUID = '{00000622-0000-0010-8000-00AA006D2EA4}';
  CLASS_Key: TGUID = '{00000621-0000-0010-8000-00AA006D2EA4}';
  IID_Procedures: TGUID = '{00000626-0000-0010-8000-00AA006D2EA4}';
  IID_Procedure_: TGUID = '{00000625-0000-0010-8000-00AA006D2EA4}';
  IID_Views: TGUID = '{00000614-0000-0010-8000-00AA006D2EA4}';
  IID_View: TGUID = '{00000613-0000-0010-8000-00AA006D2EA4}';
  IID_Groups: TGUID = '{00000617-0000-0010-8000-00AA006D2EA4}';
  IID__Group25: TGUID = '{00000616-0000-0010-8000-00AA006D2EA4}';
  IID__Group: TGUID = '{00000628-0000-0010-8000-00AA006D2EA4}';
  CLASS_Group: TGUID = '{00000615-0000-0010-8000-00AA006D2EA4}';
  IID_Users: TGUID = '{0000061A-0000-0010-8000-00AA006D2EA4}';
  IID__User25: TGUID = '{00000619-0000-0010-8000-00AA006D2EA4}';
  IID__User: TGUID = '{00000627-0000-0010-8000-00AA006D2EA4}';
  CLASS_User: TGUID = '{00000618-0000-0010-8000-00AA006D2EA4}';
  CLASS_Catalog: TGUID = '{00000602-0000-0010-8000-00AA006D2EA4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ColumnAttributesEnum
type
  ColumnAttributesEnum = TOleEnum;
const
  adColFixed = $00000001;
  adColNullable = $00000002;

// Constants for enum SortOrderEnum
type
  SortOrderEnum = TOleEnum;
const
  adSortAscending = $00000001;
  adSortDescending = $00000002;

// Constants for enum DataTypeEnum
type
  DataTypeEnum = TOleEnum;
const
  adEmpty = $00000000;
  adTinyInt = $00000010;
  adSmallInt = $00000002;
  adInteger = $00000003;
  adBigInt = $00000014;
  adUnsignedTinyInt = $00000011;
  adUnsignedSmallInt = $00000012;
  adUnsignedInt = $00000013;
  adUnsignedBigInt = $00000015;
  adSingle = $00000004;
  adDouble = $00000005;
  adCurrency = $00000006;
  adDecimal = $0000000E;
  adNumeric = $00000083;
  adBoolean = $0000000B;
  adError = $0000000A;
  adUserDefined = $00000084;
  adVariant = $0000000C;
  adIDispatch = $00000009;
  adIUnknown = $0000000D;
  adGUID = $00000048;
  adDate = $00000007;
  adDBDate = $00000085;
  adDBTime = $00000086;
  adDBTimeStamp = $00000087;
  adBSTR = $00000008;
  adChar = $00000081;
  adVarChar = $000000C8;
  adLongVarChar = $000000C9;
  adWChar = $00000082;
  adVarWChar = $000000CA;
  adLongVarWChar = $000000CB;
  adBinary = $00000080;
  adVarBinary = $000000CC;
  adLongVarBinary = $000000CD;
  adChapter = $00000088;
  adFileTime = $00000040;
  adPropVariant = $0000008A;
  adVarNumeric = $0000008B;

// Constants for enum AllowNullsEnum
type
  AllowNullsEnum = TOleEnum;
const
  adIndexNullsAllow = $00000000;
  adIndexNullsDisallow = $00000001;
  adIndexNullsIgnore = $00000002;
  adIndexNullsIgnoreAny = $00000004;

// Constants for enum RuleEnum
type
  RuleEnum = TOleEnum;
const
  adRINone = $00000000;
  adRICascade = $00000001;
  adRISetNull = $00000002;
  adRISetDefault = $00000003;

// Constants for enum KeyTypeEnum
type
  KeyTypeEnum = TOleEnum;
const
  adKeyPrimary = $00000001;
  adKeyForeign = $00000002;
  adKeyUnique = $00000003;

// Constants for enum ObjectTypeEnum
type
  ObjectTypeEnum = TOleEnum;
const
  adPermObjProviderSpecific = $FFFFFFFF;
  adPermObjTable = $00000001;
  adPermObjColumn = $00000002;
  adPermObjDatabase = $00000003;
  adPermObjProcedure = $00000004;
  adPermObjView = $00000005;

// Constants for enum RightsEnum
type
  RightsEnum = TOleEnum;
const
  adRightNone = $00000000;
  adRightDrop = $00000100;
  adRightExclusive = $00000200;
  adRightReadDesign = $00000400;
  adRightWriteDesign = $00000800;
  adRightWithGrant = $00001000;
  adRightReference = $00002000;
  adRightCreate = $00004000;
  adRightInsert = $00008000;
  adRightDelete = $00010000;
  adRightReadPermissions = $00020000;
  adRightWritePermissions = $00040000;
  adRightWriteOwner = $00080000;
  adRightMaximumAllowed = $02000000;
  adRightFull = $10000000;
  adRightExecute = $20000000;
  adRightUpdate = $40000000;
  adRightRead = $80000000;

// Constants for enum ActionEnum
type
  ActionEnum = TOleEnum;
const
  adAccessGrant = $00000001;
  adAccessSet = $00000002;
  adAccessDeny = $00000003;
  adAccessRevoke = $00000004;

// Constants for enum InheritTypeEnum
type
  InheritTypeEnum = TOleEnum;
const
  adInheritNone = $00000000;
  adInheritObjects = $00000001;
  adInheritContainers = $00000002;
  adInheritBoth = $00000003;
  adInheritNoPropogate = $00000004;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _Collection = interface;
  _CollectionDisp = dispinterface;
  _DynaCollection = interface;
  _DynaCollectionDisp = dispinterface;
  _Catalog = interface;
  _CatalogDisp = dispinterface;
  Tables = interface;
  TablesDisp = dispinterface;
  _Table = interface;
  _TableDisp = dispinterface;
  Columns = interface;
  ColumnsDisp = dispinterface;
  _Column = interface;
  _ColumnDisp = dispinterface;
  Properties = interface;
  PropertiesDisp = dispinterface;
  Property_ = interface;
  Property_Disp = dispinterface;
  Indexes = interface;
  IndexesDisp = dispinterface;
  _Index = interface;
  _IndexDisp = dispinterface;
  Keys = interface;
  KeysDisp = dispinterface;
  _Key = interface;
  _KeyDisp = dispinterface;
  Procedures = interface;
  ProceduresDisp = dispinterface;
  Procedure_ = interface;
  Procedure_Disp = dispinterface;
  Views = interface;
  ViewsDisp = dispinterface;
  View = interface;
  ViewDisp = dispinterface;
  Groups = interface;
  GroupsDisp = dispinterface;
  _Group25 = interface;
  _Group25Disp = dispinterface;
  _Group = interface;
  _GroupDisp = dispinterface;
  Users = interface;
  UsersDisp = dispinterface;
  _User25 = interface;
  _User25Disp = dispinterface;
  _User = interface;
  _UserDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Table = _Table;
  Column = _Column;
  Index = _Index;
  Key = _Key;
  Group = _Group;
  User = _User;
  Catalog = _Catalog;


// *********************************************************************//
// Interface: _Collection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000512-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Collection = interface(IDispatch)
    ['{00000512-0000-0010-8000-00AA006D2EA4}']
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Refresh; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  _CollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000512-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _CollectionDisp = dispinterface
    ['{00000512-0000-0010-8000-00AA006D2EA4}']
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _DynaCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000513-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollection = interface(_Collection)
    ['{00000513-0000-0010-8000-00AA006D2EA4}']
    procedure Append(const Object_: IDispatch); safecall;
    procedure Delete(Item: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  _DynaCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000513-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollectionDisp = dispinterface
    ['{00000513-0000-0010-8000-00AA006D2EA4}']
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(Item: OleVariant); dispid 1610809345;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Catalog
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000603-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Catalog = interface(IDispatch)
    ['{00000603-0000-0010-8000-00AA006D2EA4}']
    function Get_Tables: Tables; safecall;
    function Get_ActiveConnection: OleVariant; safecall;
    procedure Set_ActiveConnection(pVal: OleVariant); safecall;
    procedure _Set_ActiveConnection(const pVal: IDispatch); safecall;
    function Get_Procedures: Procedures; safecall;
    function Get_Views: Views; safecall;
    function Get_Groups: Groups; safecall;
    function Get_Users: Users; safecall;
    function Create(const ConnectString: WideString): OleVariant; safecall;
    function GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                            ObjectTypeId: OleVariant): WideString; safecall;
    procedure SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                             const UserName: WideString; ObjectTypeId: OleVariant); safecall;
    property Tables: Tables read Get_Tables;
    property Procedures: Procedures read Get_Procedures;
    property Views: Views read Get_Views;
    property Groups: Groups read Get_Groups;
    property Users: Users read Get_Users;
  end;

// *********************************************************************//
// DispIntf:  _CatalogDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000603-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _CatalogDisp = dispinterface
    ['{00000603-0000-0010-8000-00AA006D2EA4}']
    property Tables: Tables readonly dispid 0;
    function ActiveConnection: OleVariant; dispid 1;
    property Procedures: Procedures readonly dispid 2;
    property Views: Views readonly dispid 3;
    property Groups: Groups readonly dispid 4;
    property Users: Users readonly dispid 5;
    function Create(const ConnectString: WideString): OleVariant; dispid 6;
    function GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                            ObjectTypeId: OleVariant): WideString; dispid 7;
    procedure SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                             const UserName: WideString; ObjectTypeId: OleVariant); dispid 8;
  end;

// *********************************************************************//
// Interface: Tables
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000611-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Tables = interface(_Collection)
    ['{00000611-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Table; safecall;
    procedure Append(Item: OleVariant); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Table read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  TablesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000611-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  TablesDisp = dispinterface
    ['{00000611-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Table readonly dispid 0; default;
    procedure Append(Item: OleVariant); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Table
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000610-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Table = interface(IDispatch)
    ['{00000610-0000-0010-8000-00AA006D2EA4}']
    function Get_Columns: Columns; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_type_: WideString; safecall;
    function Get_Indexes: Indexes; safecall;
    function Get_Keys: Keys; safecall;
    function Get_Properties: Properties; safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_DateModified: OleVariant; safecall;
    function Get_ParentCatalog: _Catalog; safecall;
    procedure Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    procedure _Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    property Columns: Columns read Get_Columns;
    property Name: WideString read Get_Name write Set_Name;
    property type_: WideString read Get_type_;
    property Indexes: Indexes read Get_Indexes;
    property Keys: Keys read Get_Keys;
    property Properties: Properties read Get_Properties;
    property DateCreated: OleVariant read Get_DateCreated;
    property DateModified: OleVariant read Get_DateModified;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;

// *********************************************************************//
// DispIntf:  _TableDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000610-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _TableDisp = dispinterface
    ['{00000610-0000-0010-8000-00AA006D2EA4}']
    property Columns: Columns readonly dispid 0;
    property Name: WideString dispid 1;
    property type_: WideString readonly dispid 2;
    property Indexes: Indexes readonly dispid 3;
    property Keys: Keys readonly dispid 4;
    property Properties: Properties readonly dispid 5;
    property DateCreated: OleVariant readonly dispid 6;
    property DateModified: OleVariant readonly dispid 7;
    property ParentCatalog: _Catalog dispid 8;
  end;

// *********************************************************************//
// Interface: Columns
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Columns = interface(_Collection)
    ['{0000061D-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Column; safecall;
    procedure Append(Item: OleVariant; Type_: DataTypeEnum; DefinedSize: Integer); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Column read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ColumnsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ColumnsDisp = dispinterface
    ['{0000061D-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Column readonly dispid 0; default;
    procedure Append(Item: OleVariant; Type_: DataTypeEnum; DefinedSize: Integer); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Column
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Column = interface(IDispatch)
    ['{0000061C-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_Attributes: ColumnAttributesEnum; safecall;
    procedure Set_Attributes(pVal: ColumnAttributesEnum); safecall;
    function Get_DefinedSize: Integer; safecall;
    procedure Set_DefinedSize(pVal: Integer); safecall;
    function Get_NumericScale: Byte; safecall;
    procedure Set_NumericScale(pVal: Byte); safecall;
    function Get_Precision: Integer; safecall;
    procedure Set_Precision(pVal: Integer); safecall;
    function Get_RelatedColumn: WideString; safecall;
    procedure Set_RelatedColumn(const pVal: WideString); safecall;
    function Get_SortOrder: SortOrderEnum; safecall;
    procedure Set_SortOrder(pVal: SortOrderEnum); safecall;
    function Get_type_: DataTypeEnum; safecall;
    procedure Set_type_(pVal: DataTypeEnum); safecall;
    function Get_Properties: Properties; safecall;
    function Get_ParentCatalog: _Catalog; safecall;
    procedure Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    procedure _Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Attributes: ColumnAttributesEnum read Get_Attributes write Set_Attributes;
    property DefinedSize: Integer read Get_DefinedSize write Set_DefinedSize;
    property NumericScale: Byte read Get_NumericScale write Set_NumericScale;
    property Precision: Integer read Get_Precision write Set_Precision;
    property RelatedColumn: WideString read Get_RelatedColumn write Set_RelatedColumn;
    property SortOrder: SortOrderEnum read Get_SortOrder write Set_SortOrder;
    property type_: DataTypeEnum read Get_type_ write Set_type_;
    property Properties: Properties read Get_Properties;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;

// *********************************************************************//
// DispIntf:  _ColumnDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061C-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _ColumnDisp = dispinterface
    ['{0000061C-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 0;
    property Attributes: ColumnAttributesEnum dispid 1;
    property DefinedSize: Integer dispid 3;
    property NumericScale: Byte dispid 4;
    property Precision: Integer dispid 5;
    property RelatedColumn: WideString dispid 6;
    property SortOrder: SortOrderEnum dispid 7;
    property type_: DataTypeEnum dispid 8;
    property Properties: Properties readonly dispid 9;
    property ParentCatalog: _Catalog dispid 10;
  end;

// *********************************************************************//
// Interface: Properties
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000504-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Properties = interface(_Collection)
    ['{00000504-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Property_; safecall;
    property Item[Item: OleVariant]: Property_ read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  PropertiesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000504-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  PropertiesDisp = dispinterface
    ['{00000504-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Property_ readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Property_
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000503-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_ = interface(IDispatch)
    ['{00000503-0000-0010-8000-00AA006D2EA4}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pVal: OleVariant); safecall;
    function Get_Name: WideString; safecall;
    function Get_type_: DataTypeEnum; safecall;
    function Get_Attributes: Integer; safecall;
    procedure Set_Attributes(plAttributes: Integer); safecall;
    property Value: OleVariant read Get_Value write Set_Value;
    property Name: WideString read Get_Name;
    property type_: DataTypeEnum read Get_type_;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
  end;

// *********************************************************************//
// DispIntf:  Property_Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000503-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_Disp = dispinterface
    ['{00000503-0000-0010-8000-00AA006D2EA4}']
    property Value: OleVariant dispid 0;
    property Name: WideString readonly dispid 1;
    property type_: DataTypeEnum readonly dispid 2;
    property Attributes: Integer dispid 3;
  end;

// *********************************************************************//
// Interface: Indexes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000620-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Indexes = interface(_Collection)
    ['{00000620-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Index; safecall;
    procedure Append(Item: OleVariant; Columns: OleVariant); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Index read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IndexesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000620-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  IndexesDisp = dispinterface
    ['{00000620-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Index readonly dispid 0; default;
    procedure Append(Item: OleVariant; Columns: OleVariant); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Index
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061F-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Index = interface(IDispatch)
    ['{0000061F-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_Clustered: WordBool; safecall;
    procedure Set_Clustered(pVal: WordBool); safecall;
    function Get_IndexNulls: AllowNullsEnum; safecall;
    procedure Set_IndexNulls(pVal: AllowNullsEnum); safecall;
    function Get_PrimaryKey: WordBool; safecall;
    procedure Set_PrimaryKey(pVal: WordBool); safecall;
    function Get_Unique: WordBool; safecall;
    procedure Set_Unique(pVal: WordBool); safecall;
    function Get_Columns: Columns; safecall;
    function Get_Properties: Properties; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property IndexNulls: AllowNullsEnum read Get_IndexNulls write Set_IndexNulls;
    property PrimaryKey: WordBool read Get_PrimaryKey write Set_PrimaryKey;
    property Unique: WordBool read Get_Unique write Set_Unique;
    property Columns: Columns read Get_Columns;
    property Properties: Properties read Get_Properties;
  end;

// *********************************************************************//
// DispIntf:  _IndexDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061F-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _IndexDisp = dispinterface
    ['{0000061F-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 0;
    property Clustered: WordBool dispid 1;
    property IndexNulls: AllowNullsEnum dispid 2;
    property PrimaryKey: WordBool dispid 3;
    property Unique: WordBool dispid 4;
    property Columns: Columns readonly dispid 5;
    property Properties: Properties readonly dispid 6;
  end;

// *********************************************************************//
// Interface: Keys
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000623-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Keys = interface(_Collection)
    ['{00000623-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Key; safecall;
    procedure Append(Item: OleVariant; Type_: KeyTypeEnum; Column: OleVariant; 
                     const RelatedTable: WideString; const RelatedColumn: WideString); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Key read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  KeysDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000623-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  KeysDisp = dispinterface
    ['{00000623-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Key readonly dispid 0; default;
    procedure Append(Item: OleVariant; Type_: KeyTypeEnum; Column: OleVariant; 
                     const RelatedTable: WideString; const RelatedColumn: WideString); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Key
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000622-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Key = interface(IDispatch)
    ['{00000622-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_DeleteRule: RuleEnum; safecall;
    procedure Set_DeleteRule(pVal: RuleEnum); safecall;
    function Get_type_: KeyTypeEnum; safecall;
    procedure Set_type_(pVal: KeyTypeEnum); safecall;
    function Get_RelatedTable: WideString; safecall;
    procedure Set_RelatedTable(const pVal: WideString); safecall;
    function Get_UpdateRule: RuleEnum; safecall;
    procedure Set_UpdateRule(pVal: RuleEnum); safecall;
    function Get_Columns: Columns; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property DeleteRule: RuleEnum read Get_DeleteRule write Set_DeleteRule;
    property type_: KeyTypeEnum read Get_type_ write Set_type_;
    property RelatedTable: WideString read Get_RelatedTable write Set_RelatedTable;
    property UpdateRule: RuleEnum read Get_UpdateRule write Set_UpdateRule;
    property Columns: Columns read Get_Columns;
  end;

// *********************************************************************//
// DispIntf:  _KeyDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000622-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _KeyDisp = dispinterface
    ['{00000622-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 0;
    property DeleteRule: RuleEnum dispid 1;
    property type_: KeyTypeEnum dispid 2;
    property RelatedTable: WideString dispid 3;
    property UpdateRule: RuleEnum dispid 4;
    property Columns: Columns readonly dispid 5;
  end;

// *********************************************************************//
// Interface: Procedures
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000626-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Procedures = interface(_Collection)
    ['{00000626-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Procedure_; safecall;
    procedure Append(const Name: WideString; const Command: IDispatch); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Procedure_ read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ProceduresDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000626-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ProceduresDisp = dispinterface
    ['{00000626-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Procedure_ readonly dispid 0; default;
    procedure Append(const Name: WideString; const Command: IDispatch); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Procedure_
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000625-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Procedure_ = interface(IDispatch)
    ['{00000625-0000-0010-8000-00AA006D2EA4}']
    function Get_Command: OleVariant; safecall;
    procedure Set_Command(pVar: OleVariant); safecall;
    procedure _Set_Command(const pVar: IDispatch); safecall;
    function Get_Name: WideString; safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_DateModified: OleVariant; safecall;
    property Name: WideString read Get_Name;
    property DateCreated: OleVariant read Get_DateCreated;
    property DateModified: OleVariant read Get_DateModified;
  end;

// *********************************************************************//
// DispIntf:  Procedure_Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000625-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Procedure_Disp = dispinterface
    ['{00000625-0000-0010-8000-00AA006D2EA4}']
    function Command: OleVariant; dispid 0;
    property Name: WideString readonly dispid 1;
    property DateCreated: OleVariant readonly dispid 2;
    property DateModified: OleVariant readonly dispid 3;
  end;

// *********************************************************************//
// Interface: Views
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000614-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Views = interface(_Collection)
    ['{00000614-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): View; safecall;
    procedure Append(const Name: WideString; const Command: IDispatch); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: View read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ViewsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000614-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ViewsDisp = dispinterface
    ['{00000614-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: View readonly dispid 0; default;
    procedure Append(const Name: WideString; const Command: IDispatch); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: View
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000613-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  View = interface(IDispatch)
    ['{00000613-0000-0010-8000-00AA006D2EA4}']
    function Get_Command: OleVariant; safecall;
    procedure Set_Command(pVal: OleVariant); safecall;
    procedure _Set_Command(const pVal: IDispatch); safecall;
    function Get_Name: WideString; safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_DateModified: OleVariant; safecall;
    property Name: WideString read Get_Name;
    property DateCreated: OleVariant read Get_DateCreated;
    property DateModified: OleVariant read Get_DateModified;
  end;

// *********************************************************************//
// DispIntf:  ViewDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000613-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ViewDisp = dispinterface
    ['{00000613-0000-0010-8000-00AA006D2EA4}']
    function Command: OleVariant; dispid 0;
    property Name: WideString readonly dispid 1;
    property DateCreated: OleVariant readonly dispid 2;
    property DateModified: OleVariant readonly dispid 3;
  end;

// *********************************************************************//
// Interface: Groups
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000617-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Groups = interface(_Collection)
    ['{00000617-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Group; safecall;
    procedure Append(Item: OleVariant); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: Group read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  GroupsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000617-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  GroupsDisp = dispinterface
    ['{00000617-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Group readonly dispid 0; default;
    procedure Append(Item: OleVariant); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Group25
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000616-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Group25 = interface(IDispatch)
    ['{00000616-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; safecall;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); safecall;
    function Get_Users: Users; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Users: Users read Get_Users;
  end;

// *********************************************************************//
// DispIntf:  _Group25Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000616-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Group25Disp = dispinterface
    ['{00000616-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 0;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; dispid 2;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); dispid 3;
    property Users: Users readonly dispid 4;
  end;

// *********************************************************************//
// Interface: _Group
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000628-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Group = interface(_Group25)
    ['{00000628-0000-0010-8000-00AA006D2EA4}']
    function Get_Properties: Properties; safecall;
    function Get_ParentCatalog: _Catalog; safecall;
    procedure Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    procedure _Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    property Properties: Properties read Get_Properties;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;

// *********************************************************************//
// DispIntf:  _GroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000628-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _GroupDisp = dispinterface
    ['{00000628-0000-0010-8000-00AA006D2EA4}']
    property Properties: Properties readonly dispid 5;
    property ParentCatalog: _Catalog dispid 6;
    property Name: WideString dispid 0;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; dispid 2;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); dispid 3;
    property Users: Users readonly dispid 4;
  end;

// *********************************************************************//
// Interface: Users
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061A-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Users = interface(_Collection)
    ['{0000061A-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): User; safecall;
    procedure Append(Item: OleVariant; const Password: WideString); safecall;
    procedure Delete(Item: OleVariant); safecall;
    property Item[Item: OleVariant]: User read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  UsersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000061A-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  UsersDisp = dispinterface
    ['{0000061A-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: User readonly dispid 0; default;
    procedure Append(Item: OleVariant; const Password: WideString); dispid 1610809345;
    procedure Delete(Item: OleVariant); dispid 1610809346;
    property Count: Integer readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _User25
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000619-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _User25 = interface(IDispatch)
    ['{00000619-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; safecall;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); safecall;
    procedure ChangePassword(const OldPassword: WideString; const NewPassword: WideString); safecall;
    function Get_Groups: Groups; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Groups: Groups read Get_Groups;
  end;

// *********************************************************************//
// DispIntf:  _User25Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000619-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _User25Disp = dispinterface
    ['{00000619-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 0;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; dispid 2;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); dispid 3;
    procedure ChangePassword(const OldPassword: WideString; const NewPassword: WideString); dispid 4;
    property Groups: Groups readonly dispid 5;
  end;

// *********************************************************************//
// Interface: _User
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000627-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _User = interface(_User25)
    ['{00000627-0000-0010-8000-00AA006D2EA4}']
    function Get_Properties: Properties; safecall;
    function Get_ParentCatalog: _Catalog; safecall;
    procedure Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    procedure _Set_ParentCatalog(const ppvObject: _Catalog); safecall;
    property Properties: Properties read Get_Properties;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;

// *********************************************************************//
// DispIntf:  _UserDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000627-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _UserDisp = dispinterface
    ['{00000627-0000-0010-8000-00AA006D2EA4}']
    property Properties: Properties readonly dispid 6;
    property ParentCatalog: _Catalog dispid 7;
    property Name: WideString dispid 0;
    function GetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; ObjectTypeId: OleVariant): RightsEnum; dispid 2;
    procedure SetPermissions(Name: OleVariant; ObjectType: ObjectTypeEnum; Action: ActionEnum; 
                             Rights: RightsEnum; Inherit: InheritTypeEnum; ObjectTypeId: OleVariant); dispid 3;
    procedure ChangePassword(const OldPassword: WideString; const NewPassword: WideString); dispid 4;
    property Groups: Groups readonly dispid 5;
  end;

// *********************************************************************//
// The Class CoTable provides a Create and CreateRemote method to          
// create instances of the default interface _Table exposed by              
// the CoClass Table. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTable = class
    class function Create: _Table;
    class function CreateRemote(const MachineName: string): _Table;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxTable
// Help String      : 
// Default Interface: _Table
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxTableProperties= class;
{$ENDIF}
  TAdoxTable = class(TOleServer)
  private
    FIntf:        _Table;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxTableProperties;
    function      GetServerProperties: TAdoxTableProperties;
{$ENDIF}
    function      GetDefaultInterface: _Table;
  protected
    procedure InitServerData; override;
    function Get_Columns: Columns;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_type_: WideString;
    function Get_Indexes: Indexes;
    function Get_Keys: Keys;
    function Get_Properties: Properties;
    function Get_DateCreated: OleVariant;
    function Get_DateModified: OleVariant;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Table);
    procedure Disconnect; override;
    property DefaultInterface: _Table read GetDefaultInterface;
    property Columns: Columns read Get_Columns;
    property type_: WideString read Get_type_;
    property Indexes: Indexes read Get_Indexes;
    property Keys: Keys read Get_Keys;
    property Properties: Properties read Get_Properties;
    property DateCreated: OleVariant read Get_DateCreated;
    property DateModified: OleVariant read Get_DateModified;
    property Name: WideString read Get_Name write Set_Name;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxTableProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxTable
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxTableProperties = class(TPersistent)
  private
    FServer:    TAdoxTable;
    function    GetDefaultInterface: _Table;
    constructor Create(AServer: TAdoxTable);
  protected
    function Get_Columns: Columns;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_type_: WideString;
    function Get_Indexes: Indexes;
    function Get_Keys: Keys;
    function Get_Properties: Properties;
    function Get_DateCreated: OleVariant;
    function Get_DateModified: OleVariant;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    property DefaultInterface: _Table read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoColumn provides a Create and CreateRemote method to          
// create instances of the default interface _Column exposed by              
// the CoClass Column. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoColumn = class
    class function Create: _Column;
    class function CreateRemote(const MachineName: string): _Column;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxColumn
// Help String      : 
// Default Interface: _Column
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxColumnProperties= class;
{$ENDIF}
  TAdoxColumn = class(TOleServer)
  private
    FIntf:        _Column;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxColumnProperties;
    function      GetServerProperties: TAdoxColumnProperties;
{$ENDIF}
    function      GetDefaultInterface: _Column;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Attributes: ColumnAttributesEnum;
    procedure Set_Attributes(pVal: ColumnAttributesEnum);
    function Get_DefinedSize: Integer;
    procedure Set_DefinedSize(pVal: Integer);
    function Get_NumericScale: Byte;
    procedure Set_NumericScale(pVal: Byte);
    function Get_Precision: Integer;
    procedure Set_Precision(pVal: Integer);
    function Get_RelatedColumn: WideString;
    procedure Set_RelatedColumn(const pVal: WideString);
    function Get_SortOrder: SortOrderEnum;
    procedure Set_SortOrder(pVal: SortOrderEnum);
    function Get_type_: DataTypeEnum;
    procedure Set_type_(pVal: DataTypeEnum);
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Column);
    procedure Disconnect; override;
    property DefaultInterface: _Column read GetDefaultInterface;
    property Properties: Properties read Get_Properties;
    property Name: WideString read Get_Name write Set_Name;
    property Attributes: ColumnAttributesEnum read Get_Attributes write Set_Attributes;
    property DefinedSize: Integer read Get_DefinedSize write Set_DefinedSize;
    property NumericScale: Byte read Get_NumericScale write Set_NumericScale;
    property Precision: Integer read Get_Precision write Set_Precision;
    property RelatedColumn: WideString read Get_RelatedColumn write Set_RelatedColumn;
    property SortOrder: SortOrderEnum read Get_SortOrder write Set_SortOrder;
    property type_: DataTypeEnum read Get_type_ write Set_type_;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxColumnProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxColumn
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxColumnProperties = class(TPersistent)
  private
    FServer:    TAdoxColumn;
    function    GetDefaultInterface: _Column;
    constructor Create(AServer: TAdoxColumn);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Attributes: ColumnAttributesEnum;
    procedure Set_Attributes(pVal: ColumnAttributesEnum);
    function Get_DefinedSize: Integer;
    procedure Set_DefinedSize(pVal: Integer);
    function Get_NumericScale: Byte;
    procedure Set_NumericScale(pVal: Byte);
    function Get_Precision: Integer;
    procedure Set_Precision(pVal: Integer);
    function Get_RelatedColumn: WideString;
    procedure Set_RelatedColumn(const pVal: WideString);
    function Get_SortOrder: SortOrderEnum;
    procedure Set_SortOrder(pVal: SortOrderEnum);
    function Get_type_: DataTypeEnum;
    procedure Set_type_(pVal: DataTypeEnum);
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    property DefaultInterface: _Column read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property Attributes: ColumnAttributesEnum read Get_Attributes write Set_Attributes;
    property DefinedSize: Integer read Get_DefinedSize write Set_DefinedSize;
    property NumericScale: Byte read Get_NumericScale write Set_NumericScale;
    property Precision: Integer read Get_Precision write Set_Precision;
    property RelatedColumn: WideString read Get_RelatedColumn write Set_RelatedColumn;
    property SortOrder: SortOrderEnum read Get_SortOrder write Set_SortOrder;
    property type_: DataTypeEnum read Get_type_ write Set_type_;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoIndex provides a Create and CreateRemote method to          
// create instances of the default interface _Index exposed by              
// the CoClass Index. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIndex = class
    class function Create: _Index;
    class function CreateRemote(const MachineName: string): _Index;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxIndex
// Help String      : 
// Default Interface: _Index
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxIndexProperties= class;
{$ENDIF}
  TAdoxIndex = class(TOleServer)
  private
    FIntf:        _Index;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxIndexProperties;
    function      GetServerProperties: TAdoxIndexProperties;
{$ENDIF}
    function      GetDefaultInterface: _Index;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Clustered: WordBool;
    procedure Set_Clustered(pVal: WordBool);
    function Get_IndexNulls: AllowNullsEnum;
    procedure Set_IndexNulls(pVal: AllowNullsEnum);
    function Get_PrimaryKey: WordBool;
    procedure Set_PrimaryKey(pVal: WordBool);
    function Get_Unique: WordBool;
    procedure Set_Unique(pVal: WordBool);
    function Get_Columns: Columns;
    function Get_Properties: Properties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Index);
    procedure Disconnect; override;
    property DefaultInterface: _Index read GetDefaultInterface;
    property Columns: Columns read Get_Columns;
    property Properties: Properties read Get_Properties;
    property Name: WideString read Get_Name write Set_Name;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property IndexNulls: AllowNullsEnum read Get_IndexNulls write Set_IndexNulls;
    property PrimaryKey: WordBool read Get_PrimaryKey write Set_PrimaryKey;
    property Unique: WordBool read Get_Unique write Set_Unique;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxIndexProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxIndex
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxIndexProperties = class(TPersistent)
  private
    FServer:    TAdoxIndex;
    function    GetDefaultInterface: _Index;
    constructor Create(AServer: TAdoxIndex);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Clustered: WordBool;
    procedure Set_Clustered(pVal: WordBool);
    function Get_IndexNulls: AllowNullsEnum;
    procedure Set_IndexNulls(pVal: AllowNullsEnum);
    function Get_PrimaryKey: WordBool;
    procedure Set_PrimaryKey(pVal: WordBool);
    function Get_Unique: WordBool;
    procedure Set_Unique(pVal: WordBool);
    function Get_Columns: Columns;
    function Get_Properties: Properties;
  public
    property DefaultInterface: _Index read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property IndexNulls: AllowNullsEnum read Get_IndexNulls write Set_IndexNulls;
    property PrimaryKey: WordBool read Get_PrimaryKey write Set_PrimaryKey;
    property Unique: WordBool read Get_Unique write Set_Unique;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoKey provides a Create and CreateRemote method to          
// create instances of the default interface _Key exposed by              
// the CoClass Key. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoKey = class
    class function Create: _Key;
    class function CreateRemote(const MachineName: string): _Key;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxKey
// Help String      : 
// Default Interface: _Key
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxKeyProperties= class;
{$ENDIF}
  TAdoxKey = class(TOleServer)
  private
    FIntf:        _Key;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxKeyProperties;
    function      GetServerProperties: TAdoxKeyProperties;
{$ENDIF}
    function      GetDefaultInterface: _Key;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_DeleteRule: RuleEnum;
    procedure Set_DeleteRule(pVal: RuleEnum);
    function Get_type_: KeyTypeEnum;
    procedure Set_type_(pVal: KeyTypeEnum);
    function Get_RelatedTable: WideString;
    procedure Set_RelatedTable(const pVal: WideString);
    function Get_UpdateRule: RuleEnum;
    procedure Set_UpdateRule(pVal: RuleEnum);
    function Get_Columns: Columns;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Key);
    procedure Disconnect; override;
    property DefaultInterface: _Key read GetDefaultInterface;
    property Columns: Columns read Get_Columns;
    property Name: WideString read Get_Name write Set_Name;
    property DeleteRule: RuleEnum read Get_DeleteRule write Set_DeleteRule;
    property type_: KeyTypeEnum read Get_type_ write Set_type_;
    property RelatedTable: WideString read Get_RelatedTable write Set_RelatedTable;
    property UpdateRule: RuleEnum read Get_UpdateRule write Set_UpdateRule;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxKeyProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxKey
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxKeyProperties = class(TPersistent)
  private
    FServer:    TAdoxKey;
    function    GetDefaultInterface: _Key;
    constructor Create(AServer: TAdoxKey);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_DeleteRule: RuleEnum;
    procedure Set_DeleteRule(pVal: RuleEnum);
    function Get_type_: KeyTypeEnum;
    procedure Set_type_(pVal: KeyTypeEnum);
    function Get_RelatedTable: WideString;
    procedure Set_RelatedTable(const pVal: WideString);
    function Get_UpdateRule: RuleEnum;
    procedure Set_UpdateRule(pVal: RuleEnum);
    function Get_Columns: Columns;
  public
    property DefaultInterface: _Key read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property DeleteRule: RuleEnum read Get_DeleteRule write Set_DeleteRule;
    property type_: KeyTypeEnum read Get_type_ write Set_type_;
    property RelatedTable: WideString read Get_RelatedTable write Set_RelatedTable;
    property UpdateRule: RuleEnum read Get_UpdateRule write Set_UpdateRule;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoGroup provides a Create and CreateRemote method to          
// create instances of the default interface _Group exposed by              
// the CoClass Group. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGroup = class
    class function Create: _Group;
    class function CreateRemote(const MachineName: string): _Group;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxGroup
// Help String      : 
// Default Interface: _Group
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxGroupProperties= class;
{$ENDIF}
  TAdoxGroup = class(TOleServer)
  private
    FIntf:        _Group;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxGroupProperties;
    function      GetServerProperties: TAdoxGroupProperties;
{$ENDIF}
    function      GetDefaultInterface: _Group;
  protected
    procedure InitServerData; override;
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Group);
    procedure Disconnect; override;
    property DefaultInterface: _Group read GetDefaultInterface;
    property Properties: Properties read Get_Properties;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxGroupProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxGroup
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxGroupProperties = class(TPersistent)
  private
    FServer:    TAdoxGroup;
    function    GetDefaultInterface: _Group;
    constructor Create(AServer: TAdoxGroup);
  protected
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    property DefaultInterface: _Group read GetDefaultInterface;
  published
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUser provides a Create and CreateRemote method to          
// create instances of the default interface _User exposed by              
// the CoClass User. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUser = class
    class function Create: _User;
    class function CreateRemote(const MachineName: string): _User;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxUser
// Help String      : 
// Default Interface: _User
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxUserProperties= class;
{$ENDIF}
  TAdoxUser = class(TOleServer)
  private
    FIntf:        _User;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxUserProperties;
    function      GetServerProperties: TAdoxUserProperties;
{$ENDIF}
    function      GetDefaultInterface: _User;
  protected
    procedure InitServerData; override;
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _User);
    procedure Disconnect; override;
    property DefaultInterface: _User read GetDefaultInterface;
    property Properties: Properties read Get_Properties;
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxUserProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxUser
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxUserProperties = class(TPersistent)
  private
    FServer:    TAdoxUser;
    function    GetDefaultInterface: _User;
    constructor Create(AServer: TAdoxUser);
  protected
    function Get_Properties: Properties;
    function Get_ParentCatalog: _Catalog;
    procedure Set_ParentCatalog(const ppvObject: _Catalog);
    procedure _Set_ParentCatalog(const ppvObject: _Catalog);
  public
    property DefaultInterface: _User read GetDefaultInterface;
  published
    property ParentCatalog: _Catalog read Get_ParentCatalog write Set_ParentCatalog;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCatalog provides a Create and CreateRemote method to          
// create instances of the default interface _Catalog exposed by              
// the CoClass Catalog. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCatalog = class
    class function Create: _Catalog;
    class function CreateRemote(const MachineName: string): _Catalog;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdoxCatalog
// Help String      : 
// Default Interface: _Catalog
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdoxCatalogProperties= class;
{$ENDIF}
  TAdoxCatalog = class(TOleServer)
  private
    FIntf:        _Catalog;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdoxCatalogProperties;
    function      GetServerProperties: TAdoxCatalogProperties;
{$ENDIF}
    function      GetDefaultInterface: _Catalog;
  protected
    procedure InitServerData; override;
    function Get_Tables: Tables;
    function Get_ActiveConnection: OleVariant;
    procedure Set_ActiveConnection(pVal: OleVariant);
    procedure _Set_ActiveConnection(const pVal: IDispatch);
    function Get_Procedures: Procedures;
    function Get_Views: Views;
    function Get_Groups: Groups;
    function Get_Users: Users;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Catalog);
    procedure Disconnect; override;
    function Create1(const ConnectString: WideString): OleVariant;
    function GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum): WideString; overload;
    function GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                            ObjectTypeId: OleVariant): WideString; overload;
    procedure SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                             const UserName: WideString); overload;
    procedure SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                             const UserName: WideString; ObjectTypeId: OleVariant); overload;
    property DefaultInterface: _Catalog read GetDefaultInterface;
    property Tables: Tables read Get_Tables;
    property Procedures: Procedures read Get_Procedures;
    property Views: Views read Get_Views;
    property Groups: Groups read Get_Groups;
    property Users: Users read Get_Users;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdoxCatalogProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdoxCatalog
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdoxCatalogProperties = class(TPersistent)
  private
    FServer:    TAdoxCatalog;
    function    GetDefaultInterface: _Catalog;
    constructor Create(AServer: TAdoxCatalog);
  protected
    function Get_Tables: Tables;
    function Get_ActiveConnection: OleVariant;
    procedure Set_ActiveConnection(pVal: OleVariant);
    procedure _Set_ActiveConnection(const pVal: IDispatch);
    function Get_Procedures: Procedures;
    function Get_Views: Views;
    function Get_Groups: Groups;
    function Get_Users: Users;
  public
    property DefaultInterface: _Catalog read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTable.Create: _Table;
begin
  Result := CreateComObject(CLASS_Table) as _Table;
end;

class function CoTable.CreateRemote(const MachineName: string): _Table;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Table) as _Table;
end;

procedure TAdoxTable.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000609-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000610-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxTable.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Table;
  end;
end;

procedure TAdoxTable.ConnectTo(svrIntf: _Table);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxTable.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxTable.GetDefaultInterface: _Table;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxTableProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxTable.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxTable.GetServerProperties: TAdoxTableProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxTable.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

function TAdoxTable.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxTable.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxTable.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TAdoxTable.Get_Indexes: Indexes;
begin
    Result := DefaultInterface.Indexes;
end;

function TAdoxTable.Get_Keys: Keys;
begin
    Result := DefaultInterface.Keys;
end;

function TAdoxTable.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxTable.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TAdoxTable.Get_DateModified: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateModified;
end;

function TAdoxTable.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxTable.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxTable._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxTableProperties.Create(AServer: TAdoxTable);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxTableProperties.GetDefaultInterface: _Table;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxTableProperties.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

function TAdoxTableProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxTableProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxTableProperties.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TAdoxTableProperties.Get_Indexes: Indexes;
begin
    Result := DefaultInterface.Indexes;
end;

function TAdoxTableProperties.Get_Keys: Keys;
begin
    Result := DefaultInterface.Keys;
end;

function TAdoxTableProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxTableProperties.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TAdoxTableProperties.Get_DateModified: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateModified;
end;

function TAdoxTableProperties.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxTableProperties.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxTableProperties._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$ENDIF}

class function CoColumn.Create: _Column;
begin
  Result := CreateComObject(CLASS_Column) as _Column;
end;

class function CoColumn.CreateRemote(const MachineName: string): _Column;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Column) as _Column;
end;

procedure TAdoxColumn.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0000061B-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{0000061C-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxColumn.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Column;
  end;
end;

procedure TAdoxColumn.ConnectTo(svrIntf: _Column);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxColumn.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxColumn.GetDefaultInterface: _Column;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxColumn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxColumnProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxColumn.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxColumn.GetServerProperties: TAdoxColumnProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxColumn.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxColumn.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxColumn.Get_Attributes: ColumnAttributesEnum;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TAdoxColumn.Set_Attributes(pVal: ColumnAttributesEnum);
begin
  DefaultInterface.Set_Attributes(pVal);
end;

function TAdoxColumn.Get_DefinedSize: Integer;
begin
    Result := DefaultInterface.DefinedSize;
end;

procedure TAdoxColumn.Set_DefinedSize(pVal: Integer);
begin
  DefaultInterface.Set_DefinedSize(pVal);
end;

function TAdoxColumn.Get_NumericScale: Byte;
begin
    Result := DefaultInterface.NumericScale;
end;

procedure TAdoxColumn.Set_NumericScale(pVal: Byte);
begin
  DefaultInterface.Set_NumericScale(pVal);
end;

function TAdoxColumn.Get_Precision: Integer;
begin
    Result := DefaultInterface.Precision;
end;

procedure TAdoxColumn.Set_Precision(pVal: Integer);
begin
  DefaultInterface.Set_Precision(pVal);
end;

function TAdoxColumn.Get_RelatedColumn: WideString;
begin
    Result := DefaultInterface.RelatedColumn;
end;

procedure TAdoxColumn.Set_RelatedColumn(const pVal: WideString);
  { Warning: The property RelatedColumn has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelatedColumn := pVal;
end;

function TAdoxColumn.Get_SortOrder: SortOrderEnum;
begin
    Result := DefaultInterface.SortOrder;
end;

procedure TAdoxColumn.Set_SortOrder(pVal: SortOrderEnum);
begin
  DefaultInterface.Set_SortOrder(pVal);
end;

function TAdoxColumn.Get_type_: DataTypeEnum;
begin
    Result := DefaultInterface.type_;
end;

procedure TAdoxColumn.Set_type_(pVal: DataTypeEnum);
begin
  DefaultInterface.Set_type_(pVal);
end;

function TAdoxColumn.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxColumn.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxColumn.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxColumn._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxColumnProperties.Create(AServer: TAdoxColumn);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxColumnProperties.GetDefaultInterface: _Column;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxColumnProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxColumnProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxColumnProperties.Get_Attributes: ColumnAttributesEnum;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TAdoxColumnProperties.Set_Attributes(pVal: ColumnAttributesEnum);
begin
  DefaultInterface.Set_Attributes(pVal);
end;

function TAdoxColumnProperties.Get_DefinedSize: Integer;
begin
    Result := DefaultInterface.DefinedSize;
end;

procedure TAdoxColumnProperties.Set_DefinedSize(pVal: Integer);
begin
  DefaultInterface.Set_DefinedSize(pVal);
end;

function TAdoxColumnProperties.Get_NumericScale: Byte;
begin
    Result := DefaultInterface.NumericScale;
end;

procedure TAdoxColumnProperties.Set_NumericScale(pVal: Byte);
begin
  DefaultInterface.Set_NumericScale(pVal);
end;

function TAdoxColumnProperties.Get_Precision: Integer;
begin
    Result := DefaultInterface.Precision;
end;

procedure TAdoxColumnProperties.Set_Precision(pVal: Integer);
begin
  DefaultInterface.Set_Precision(pVal);
end;

function TAdoxColumnProperties.Get_RelatedColumn: WideString;
begin
    Result := DefaultInterface.RelatedColumn;
end;

procedure TAdoxColumnProperties.Set_RelatedColumn(const pVal: WideString);
  { Warning: The property RelatedColumn has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelatedColumn := pVal;
end;

function TAdoxColumnProperties.Get_SortOrder: SortOrderEnum;
begin
    Result := DefaultInterface.SortOrder;
end;

procedure TAdoxColumnProperties.Set_SortOrder(pVal: SortOrderEnum);
begin
  DefaultInterface.Set_SortOrder(pVal);
end;

function TAdoxColumnProperties.Get_type_: DataTypeEnum;
begin
    Result := DefaultInterface.type_;
end;

procedure TAdoxColumnProperties.Set_type_(pVal: DataTypeEnum);
begin
  DefaultInterface.Set_type_(pVal);
end;

function TAdoxColumnProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxColumnProperties.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxColumnProperties.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxColumnProperties._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$ENDIF}

class function CoIndex.Create: _Index;
begin
  Result := CreateComObject(CLASS_Index) as _Index;
end;

class function CoIndex.CreateRemote(const MachineName: string): _Index;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Index) as _Index;
end;

procedure TAdoxIndex.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0000061E-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{0000061F-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxIndex.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Index;
  end;
end;

procedure TAdoxIndex.ConnectTo(svrIntf: _Index);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxIndex.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxIndex.GetDefaultInterface: _Index;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxIndex.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxIndexProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxIndex.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxIndex.GetServerProperties: TAdoxIndexProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxIndex.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxIndex.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxIndex.Get_Clustered: WordBool;
begin
    Result := DefaultInterface.Clustered;
end;

procedure TAdoxIndex.Set_Clustered(pVal: WordBool);
begin
  DefaultInterface.Set_Clustered(pVal);
end;

function TAdoxIndex.Get_IndexNulls: AllowNullsEnum;
begin
    Result := DefaultInterface.IndexNulls;
end;

procedure TAdoxIndex.Set_IndexNulls(pVal: AllowNullsEnum);
begin
  DefaultInterface.Set_IndexNulls(pVal);
end;

function TAdoxIndex.Get_PrimaryKey: WordBool;
begin
    Result := DefaultInterface.PrimaryKey;
end;

procedure TAdoxIndex.Set_PrimaryKey(pVal: WordBool);
begin
  DefaultInterface.Set_PrimaryKey(pVal);
end;

function TAdoxIndex.Get_Unique: WordBool;
begin
    Result := DefaultInterface.Unique;
end;

procedure TAdoxIndex.Set_Unique(pVal: WordBool);
begin
  DefaultInterface.Set_Unique(pVal);
end;

function TAdoxIndex.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

function TAdoxIndex.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxIndexProperties.Create(AServer: TAdoxIndex);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxIndexProperties.GetDefaultInterface: _Index;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxIndexProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxIndexProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxIndexProperties.Get_Clustered: WordBool;
begin
    Result := DefaultInterface.Clustered;
end;

procedure TAdoxIndexProperties.Set_Clustered(pVal: WordBool);
begin
  DefaultInterface.Set_Clustered(pVal);
end;

function TAdoxIndexProperties.Get_IndexNulls: AllowNullsEnum;
begin
    Result := DefaultInterface.IndexNulls;
end;

procedure TAdoxIndexProperties.Set_IndexNulls(pVal: AllowNullsEnum);
begin
  DefaultInterface.Set_IndexNulls(pVal);
end;

function TAdoxIndexProperties.Get_PrimaryKey: WordBool;
begin
    Result := DefaultInterface.PrimaryKey;
end;

procedure TAdoxIndexProperties.Set_PrimaryKey(pVal: WordBool);
begin
  DefaultInterface.Set_PrimaryKey(pVal);
end;

function TAdoxIndexProperties.Get_Unique: WordBool;
begin
    Result := DefaultInterface.Unique;
end;

procedure TAdoxIndexProperties.Set_Unique(pVal: WordBool);
begin
  DefaultInterface.Set_Unique(pVal);
end;

function TAdoxIndexProperties.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

function TAdoxIndexProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

{$ENDIF}

class function CoKey.Create: _Key;
begin
  Result := CreateComObject(CLASS_Key) as _Key;
end;

class function CoKey.CreateRemote(const MachineName: string): _Key;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Key) as _Key;
end;

procedure TAdoxKey.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000621-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000622-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxKey.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Key;
  end;
end;

procedure TAdoxKey.ConnectTo(svrIntf: _Key);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxKey.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxKey.GetDefaultInterface: _Key;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxKey.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxKeyProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxKey.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxKey.GetServerProperties: TAdoxKeyProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxKey.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxKey.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxKey.Get_DeleteRule: RuleEnum;
begin
    Result := DefaultInterface.DeleteRule;
end;

procedure TAdoxKey.Set_DeleteRule(pVal: RuleEnum);
begin
  DefaultInterface.Set_DeleteRule(pVal);
end;

function TAdoxKey.Get_type_: KeyTypeEnum;
begin
    Result := DefaultInterface.type_;
end;

procedure TAdoxKey.Set_type_(pVal: KeyTypeEnum);
begin
  DefaultInterface.Set_type_(pVal);
end;

function TAdoxKey.Get_RelatedTable: WideString;
begin
    Result := DefaultInterface.RelatedTable;
end;

procedure TAdoxKey.Set_RelatedTable(const pVal: WideString);
  { Warning: The property RelatedTable has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelatedTable := pVal;
end;

function TAdoxKey.Get_UpdateRule: RuleEnum;
begin
    Result := DefaultInterface.UpdateRule;
end;

procedure TAdoxKey.Set_UpdateRule(pVal: RuleEnum);
begin
  DefaultInterface.Set_UpdateRule(pVal);
end;

function TAdoxKey.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxKeyProperties.Create(AServer: TAdoxKey);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxKeyProperties.GetDefaultInterface: _Key;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxKeyProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAdoxKeyProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TAdoxKeyProperties.Get_DeleteRule: RuleEnum;
begin
    Result := DefaultInterface.DeleteRule;
end;

procedure TAdoxKeyProperties.Set_DeleteRule(pVal: RuleEnum);
begin
  DefaultInterface.Set_DeleteRule(pVal);
end;

function TAdoxKeyProperties.Get_type_: KeyTypeEnum;
begin
    Result := DefaultInterface.type_;
end;

procedure TAdoxKeyProperties.Set_type_(pVal: KeyTypeEnum);
begin
  DefaultInterface.Set_type_(pVal);
end;

function TAdoxKeyProperties.Get_RelatedTable: WideString;
begin
    Result := DefaultInterface.RelatedTable;
end;

procedure TAdoxKeyProperties.Set_RelatedTable(const pVal: WideString);
  { Warning: The property RelatedTable has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelatedTable := pVal;
end;

function TAdoxKeyProperties.Get_UpdateRule: RuleEnum;
begin
    Result := DefaultInterface.UpdateRule;
end;

procedure TAdoxKeyProperties.Set_UpdateRule(pVal: RuleEnum);
begin
  DefaultInterface.Set_UpdateRule(pVal);
end;

function TAdoxKeyProperties.Get_Columns: Columns;
begin
    Result := DefaultInterface.Columns;
end;

{$ENDIF}

class function CoGroup.Create: _Group;
begin
  Result := CreateComObject(CLASS_Group) as _Group;
end;

class function CoGroup.CreateRemote(const MachineName: string): _Group;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Group) as _Group;
end;

procedure TAdoxGroup.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000615-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000628-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxGroup.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Group;
  end;
end;

procedure TAdoxGroup.ConnectTo(svrIntf: _Group);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxGroup.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxGroup.GetDefaultInterface: _Group;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxGroupProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxGroup.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxGroup.GetServerProperties: TAdoxGroupProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxGroup.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxGroup.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxGroup.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxGroup._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxGroupProperties.Create(AServer: TAdoxGroup);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxGroupProperties.GetDefaultInterface: _Group;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxGroupProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxGroupProperties.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxGroupProperties.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxGroupProperties._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$ENDIF}

class function CoUser.Create: _User;
begin
  Result := CreateComObject(CLASS_User) as _User;
end;

class function CoUser.CreateRemote(const MachineName: string): _User;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_User) as _User;
end;

procedure TAdoxUser.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000618-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000627-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxUser.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _User;
  end;
end;

procedure TAdoxUser.ConnectTo(svrIntf: _User);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxUser.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxUser.GetDefaultInterface: _User;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxUserProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxUser.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxUser.GetServerProperties: TAdoxUserProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxUser.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxUser.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxUser.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxUser._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxUserProperties.Create(AServer: TAdoxUser);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxUserProperties.GetDefaultInterface: _User;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxUserProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAdoxUserProperties.Get_ParentCatalog: _Catalog;
begin
    Result := DefaultInterface.ParentCatalog;
end;

procedure TAdoxUserProperties.Set_ParentCatalog(const ppvObject: _Catalog);
begin
  DefaultInterface.Set_ParentCatalog(ppvObject);
end;

procedure TAdoxUserProperties._Set_ParentCatalog(const ppvObject: _Catalog);
  { Warning: The property ParentCatalog has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ParentCatalog := ppvObject;
end;

{$ENDIF}

class function CoCatalog.Create: _Catalog;
begin
  Result := CreateComObject(CLASS_Catalog) as _Catalog;
end;

class function CoCatalog.CreateRemote(const MachineName: string): _Catalog;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Catalog) as _Catalog;
end;

procedure TAdoxCatalog.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000602-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000603-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdoxCatalog.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Catalog;
  end;
end;

procedure TAdoxCatalog.ConnectTo(svrIntf: _Catalog);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdoxCatalog.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdoxCatalog.GetDefaultInterface: _Catalog;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdoxCatalog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdoxCatalogProperties.Create(Self);
{$ENDIF}
end;

destructor TAdoxCatalog.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdoxCatalog.GetServerProperties: TAdoxCatalogProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAdoxCatalog.Get_Tables: Tables;
begin
    Result := DefaultInterface.Tables;
end;

function TAdoxCatalog.Get_ActiveConnection: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ActiveConnection;
end;

procedure TAdoxCatalog.Set_ActiveConnection(pVal: OleVariant);
  { Warning: The property ActiveConnection has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ActiveConnection := pVal;
end;

procedure TAdoxCatalog._Set_ActiveConnection(const pVal: IDispatch);
  { Warning: The property ActiveConnection has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ActiveConnection := pVal;
end;

function TAdoxCatalog.Get_Procedures: Procedures;
begin
    Result := DefaultInterface.Procedures;
end;

function TAdoxCatalog.Get_Views: Views;
begin
    Result := DefaultInterface.Views;
end;

function TAdoxCatalog.Get_Groups: Groups;
begin
    Result := DefaultInterface.Groups;
end;

function TAdoxCatalog.Get_Users: Users;
begin
    Result := DefaultInterface.Users;
end;

function TAdoxCatalog.Create1(const ConnectString: WideString): OleVariant;
begin
  Result := DefaultInterface.Create(ConnectString);
end;

function TAdoxCatalog.GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum): WideString;
begin
  Result := DefaultInterface.GetObjectOwner(ObjectName, ObjectType, EmptyParam);
end;

function TAdoxCatalog.GetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                                     ObjectTypeId: OleVariant): WideString;
begin
  Result := DefaultInterface.GetObjectOwner(ObjectName, ObjectType, ObjectTypeId);
end;

procedure TAdoxCatalog.SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                                      const UserName: WideString);
begin
  DefaultInterface.SetObjectOwner(ObjectName, ObjectType, UserName, EmptyParam);
end;

procedure TAdoxCatalog.SetObjectOwner(const ObjectName: WideString; ObjectType: ObjectTypeEnum; 
                                      const UserName: WideString; ObjectTypeId: OleVariant);
begin
  DefaultInterface.SetObjectOwner(ObjectName, ObjectType, UserName, ObjectTypeId);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdoxCatalogProperties.Create(AServer: TAdoxCatalog);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdoxCatalogProperties.GetDefaultInterface: _Catalog;
begin
  Result := FServer.DefaultInterface;
end;

function TAdoxCatalogProperties.Get_Tables: Tables;
begin
    Result := DefaultInterface.Tables;
end;

function TAdoxCatalogProperties.Get_ActiveConnection: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ActiveConnection;
end;

procedure TAdoxCatalogProperties.Set_ActiveConnection(pVal: OleVariant);
  { Warning: The property ActiveConnection has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ActiveConnection := pVal;
end;

procedure TAdoxCatalogProperties._Set_ActiveConnection(const pVal: IDispatch);
  { Warning: The property ActiveConnection has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ActiveConnection := pVal;
end;

function TAdoxCatalogProperties.Get_Procedures: Procedures;
begin
    Result := DefaultInterface.Procedures;
end;

function TAdoxCatalogProperties.Get_Views: Views;
begin
    Result := DefaultInterface.Views;
end;

function TAdoxCatalogProperties.Get_Groups: Groups;
begin
    Result := DefaultInterface.Groups;
end;

function TAdoxCatalogProperties.Get_Users: Users;
begin
    Result := DefaultInterface.Users;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TAdoxTable, TAdoxColumn, TAdoxIndex, TAdoxKey, 
    TAdoxGroup, TAdoxUser, TAdoxCatalog]);
end;

end.
