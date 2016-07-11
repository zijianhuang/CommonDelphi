unit CliDataBase;
{
  * User settings
  * System settings
  * Basic db functions
  * Logon functions
  * Errok

Remark:
  This unit will be derived to add more project specific stuffs.
}

interface





uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IdBaseComponent, IdIntercept, IdLogBase,
  IdLogDebug, stdctrls, ExtCtrls, dbctrls,
  DBClient, IdLogFile, inifiles, ADODB, OleServer;

type
  TCliDataModBase = class(TDataModule)
    MainQDataSource: TDataSource;
    QDataSource2: TDataSource;
    BasicQDataSource: TDataSource;
    BasicDQDAtaSource: TDataSource;
    SQLDatabase: TADOConnection;
    MainQDataset: TADOQuery;
    BasicDQDataset: TADOQuery;
    QDataset2: TADOQuery;
    BasicQDataset: TADOQuery;
    UserTbl: TADOTable;
    StationTbl: TADOTable;
    QCommand: TADOCommand;


    procedure DataModuleCreate(Sender: TObject);

    procedure LogFileLogItem(ASender: TComponent; var AText: string);

    // BasicClientDataset
    procedure BasicClientDataSetPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure DataModuleDestroy(Sender: TObject);
    procedure MainQDatasetAfterOpen(DataSet: TDataSet);
    procedure MainQDatasetAfterInsert(DataSet: TDataSet);
  private
    LogLevel: integer;
    LogEdit: TMemo;
    FServerPort: integer;
    FServerName: string;
    FDefaultDateFormat: string;
    FUserLevel: integer;
    FUserName: string;
    FFontSizeDefault: integer;
    FFontNameDefault: string;
    FPrinterVoucher: string;
    FPrinterDefault: string;
    FPrinterInvoice: string;
    FDefaultDateFormatNum: integer;
    FUsernameId: integer;
    FEnableLogMessage: boolean;
    FPortNumber: integer;
    FPassword: string;
    FDBName: string;
    FHostName: string;
    FLoginName: string;
    procedure SetServerName(const Value: string);
    procedure SetServerPort(const Value: integer);
    procedure SetDefaultDateFormat(const Value: string);
    procedure SetDBName(const Value: string);
    procedure SetHostName(const Value: string);
    procedure SetLoginName(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetPortNumber(const Value: integer);
    function GetDBName: string;
    procedure SetUserLevel(const Value: integer);
    procedure SetUserName(const Value: string);
    procedure SetFontNameDefault(const Value: string);
    procedure SetFontSizeDefault(const Value: integer);
    procedure SetPrinterDefault(const Value: string);
    procedure SetPrinterInvoice(const Value: string);
    procedure SetPrinterVoucher(const Value: string);
  protected
    // for Simulator
    SimStrings: TStringList;  // for simulation functions
    ConnectionString : string;
    ToUseLocal  : boolean;

    // for Logon
    function VerifyUsrPwd(const usr, pwd, pwdEncoded: string): boolean;
    function EncodePassword(const usr, pwd: string): string;

    procedure SaveOptionsEx(cfile : TIniFile); virtual;
    procedure LoadIniEx(cfile : TIniFile); virtual;

    // OCBC                                       MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    procedure CreateDsODBCKey;
    procedure DestroyDsODBCKey;

  public
    CurrentPath: string;

    // for logon               MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    // The encrypted user (owner) name stored in INI
    EncodedOwner         : string;

    // Serial code to decrypt encoded user, the code is also embedded with info of how many stations
    Serial              : integer;

    OwnerDecoded         : boolean;
    DecodedOwner         : string;

    OwnerDecodedFuzzy1,  OwnerDecodedFuzzy2 : boolean; // fuzzy for dog

    // true to connect to UDP, false to connect to INI
    AutoServer          : boolean; 

    // valid when AutoServer=false;
    MaxConnection       : integer; 

    ConnectionTimeOut   : integer; // seconds

    ODBCDriverName      : string;
    ODBCDbFile       : string;
    
    // About box notices                       MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    MyCopyrightNotice   : string;
    MyWeb               : string;
    MyVersion           : string;
    MyVendor            : string;
    EncodedVendor       : string;

    // for switching between two databases        MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    ToUseDemoDatabase           : boolean;

    DemoDBName : string;
    DefaultDBName : string;

    DemoDbFile : string;
    DefaultDbFile : string;

    
    CompactOnClose : boolean;


    function    IsDBFileBased : boolean;

    // Default system settings MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    property EnableLogMessage: boolean read FEnableLogMessage write FEnableLogMessage
      default True;

    // Database Connection     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    property HostName: string read FHostName write SetHostName;
    property PortNumber: integer read FPortNumber write SetPortNumber;
    property DBName: string read FDBName write SetDBName;
    property LoginName: string read FLoginName write SetLoginName;
    property Password: string read FPassword write SetPassword;

    // User info managed by table staff     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    property UserName: string read FUserName write SetUserName; // the one who use
    property UserNameId: integer read FUsernameId write FUserNameId;
    property UserLevel: integer read FUserLevel write SetUserLevel;

    // Properties of networking -- wrappers for those in OADataMod    MMMMMMMMMM
    property ServerName: string read FServerName write SetServerName;
    property ServerPort: integer read FServerPort write SetServerPort;

   // Default Date format
    property DefaultDateFormat: string read FDefaultDateFormat write SetDefaultDateFormat;

    // Basic db functions MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

    procedure RunQuery(const q: string);  // with mainqdataset

    procedure RunCommand(const q: string);

    procedure SearchMain(const qst: string);
    function SearchDataset(ds: TADOQuery; const qst: string) : boolean;

    procedure AllBasicDatasetsActive;

    // query whether a key value exists in the table, return howmany. (BasicQDataset)
    function KeyExists(const tblname : string; const fldname : string; const fldvalue : string) : integer;

    // return refno of the record with a field value; return 0 if not found
    function SearchDataRef(const tblname, fieldname: string;
        const value: string): integer;

    // return field value with refno ; return NULL if not found
    function SearchRefnoData(const tblname, fieldname: string;
        const ref: integer): Variant;

    // Simulation Support      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    procedure SetupSim;
    procedure TeardownSim;
    function GetSimString(c: integer = 1): string;
    function GetSimStringsCount: integer;
    function GetSimInteger(m: integer = 3): integer;
    function GetSimReal(m: integer = 100): real;
    function GetSimDate(od: TDateTime = 36525): TDate;
    function GetSimData(ds: TDataset; const fdn: string): Variant;

    // Log Management          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    procedure SetLogLevel(fl: integer);
    procedure SetLogEdit(t: TMemo);
    procedure WriteLogFile(const msg: string; fl: integer = 1);
    procedure WriteLogMessage(const msg: string; fl: integer = 1);

    // Logon Management        MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    function ConnectToServer: boolean;
    procedure DisconnectServer;

    // Connect DB server with DB username and pwd
    function LogOnServer(const usrname, pwd, ipadr: string): integer;

    // Logon to application's db to check user table in order to verify
    function LogOnAs(const usrname, pwd: string): integer;  virtual;

    // Change application's user password
    function ChangePwd(const oldp, newp: string): integer;


    // Configuration support   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

    //write a key to default INI
    procedure IniWriteString(const fsection, fkey, t: string);

    // call LoadIniEx (virtual)
    procedure LoadIni;

    // call SaveOptionsEx (virtual)
    procedure SaveOptions;


    procedure LoadUserOptions; virtual; abstract;
    procedure SaveUserOptions;  virtual; abstract;

    function LookupUserOption(const namef : string) : string;   virtual; abstract;
    function WriteUserOption(const namef, v : string) : boolean;   virtual; abstract;

    // Get Ref frequent used data  with QDataset2 MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

    // Get field value by 'refno' from DB; using QDataset2
    function GetRefnoData(const tblname, fieldname: string; const ref: integer): Variant;

    // Authentication of multiple stations in non-auto-server mode  MMMMMMMMMMMMMMMM
    function CheckStation(const ip : string) : integer; // 0 : ok
    function DeleteStation(const ip : string) : integer ; // 0 : ok

  end;

  function GetSqlResult(Connection: OleVariant; SQL: string): Variant;

implementation

uses DateUtil,  CommonFunc, FileUtil, JclSysInfo,  JclLocales,
  StrUtils, registry, adoint, comobj;
{$R *.DFM}

function TCliDataModBAse.SearchDataset(ds: TADOQuery; const qst: string) : boolean ;
begin
  Result:=false;
  //  ds.DisableControls;     // seem to cause problems
  try
    ds.Active := False;
    ds.Sql.Text := qst;
    ds.Active := True;
    if ds.Active then  // delphi exception handling could not handle ODBC error.
      Result:=true;
  except
    on e: SysUtils.Exception do
        ShowError(e.ClassName + '--' + e.message + '--' + qst);
  end;
  //  ds.EnableControls;
end;

function TCliDataModBase.SearchDataRef(const tblname, fieldname: string;
  const value: string): integer;
begin
  SearchDataset(QDataset2, 'select refno from ' + tblname +
    ' where '+fieldname+'='+ quotedStr(value));
  if QDataset2.RecordCount > 0 then
    Result := QDataset2.FieldValues['refno']
  else
    Result := 0;
end;

function TCliDataModBase.KeyExists(const tblname : string; const fldname: string;
  const fldvalue : string): integer;
begin
  BasicQDataset.Active:=false;
  BasicQDataset.Sql.Text:='select count(*) as ccokk from '+tblname+' where '+
    fldname+' = '+QuotedStr(fldvalue);

  BasicQDataset.Active:=true;
  Result:=BasicQDataset.FieldByName('ccokk').AsInteger;
end;

procedure TCliDataModBase.BasicClientDataSetPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  WriteLogFile(' PostError:' + E.ClassName + '--' + E.Message);
  Action := daAbort;
end;

procedure TCliDataModBase.DataModuleCreate(Sender: TObject);
begin
// define basice user settings
  CurrentPath := ExtractFilePath(ParamStr(0));
  DefaultDateFormat:='yyyy-MM-dd';

end;

function TCliDataModBase.LogOnServer(const usrname, pwd,
  ipadr: string): integer;
begin
  CreateDsOdbcKey;

  // ** Lonon the DB server with settings of HostName, PortNumber, LoginName and password
  if ConnectToServer then
  begin
    WriteLogFile('DB Server connected. OK', 2); //bg

    // ** Log on as app user and get priviledges
    UserLevel := LogOnAs(usrname, pwd);
    if UserLevel < 10 then
    begin
      Result := 0;
      WriteLogFile('Log on accepted. OK', 2);
    end
    else
      Result := 1002;
  end
  else
    Result := 1001;

  WriteLogFile('LogOnAs '+IntToStr(Result), 2);  //bg
end;

function TCliDataModBase.LogOnAs(const usrname, pwd: string): integer;
begin
  UserTbl.Active := True;
  if UserTbl.Locate('Abbr', usrname, [loCaseInsensitive]) then
  begin
    if (VerifyUsrPwd(usrname, pwd, UserTbl.FieldByName('code').AsString)) then
    begin
      Result := UserTbl.FieldByName('category').AsInteger;
      UserName := usrname;
      fUserNameId := UserTbl.FieldByName('refno').AsInteger;
    end
    else
      Result := 10;
  end
  else
    Result := 20;

  UserTbl.Active := False;
end;



function TCliDataModBase.ConnectToServer: boolean;
begin
  try
    SQLDatabase.Close; // ft
    SQLDatabase.ConnectionString:=ConnectionString;

{$IFDEF ACCESSBASE}
    SQLDatabase.Connected := True;
{$ELSE}
    SQLDatabase.Open(LoginName, password) ;
{$ENDIF}

    Result := True;
  except
    on e : Exception do
    begin
      WriteLogFile(e.ClassName+'--'+e.Message+' While ConnectToServer.'+ConnectionString);
      Result := False;
    end;
  end;
end;

procedure TCliDataModBase.RunQuery(const q: string);
begin
  MainQDataset.Active:=false;
  MainQDataset.Sql.Text := q;
  MainQDataset.ExecSQL;
end;

function TCliDataModBase.GetSimInteger(m: integer): integer;
begin
  Result := Random(m);
end;

function TCliDataModBase.GetSimReal(m: integer): real;
begin
  Result := Random * m;
end;

function TCliDataModBase.GetSimString(c: integer): string;
var
  i: integer;
begin
  Result := SimStrings.Strings[Random(SimStrings.Count)];
  for i := 2 to c do
    Result := Result + ' ' + SimStrings.Strings[Random(SimStrings.Count)];
end;

procedure TCliDataModBase.SetupSim;
begin
  SimStrings := TStringList.Create;
  SimStrings.LoadFromFile(CurrentPath + 'diction.txt');
  Randomize;
end;

procedure TCliDataModBase.TeardownSim;
begin
  FreeAndNil(SimStrings);
end;

function TCliDataModBase.GetSimDate(od: TDateTime): TDate;
begin
  Result := od + Random(Trunc(Date - od));
end;

function TCliDataModBase.GetSimStringsCount: integer;
begin
  Result := SimStrings.Count;
end;

function TCliDataModBase.GetSimData(ds: TDataset; const fdn: string): Variant;
begin
  ds.RecNo := Random(ds.RecordCount) + 1;
  Result := ds.FieldValues[fdn];
end;

procedure TCliDataModBase.SearchMain(const qst: string);
begin
  SearchDataset(MainQDataset, qst);
end;


procedure TCliDataModBase.DisconnectServer;
var
  i: integer;
begin
  try
    SQLDatabase.Connected := False;
  except
    on e : Exception do
    begin
      if e.ClassType=EOleException then
      begin
        ShowInfo('There might be at least one threaded query running. Please wait a few seconds and press OK.');
        SQLDatabase.Connected := False;
      end
      else
        ShowError(e.ClassName+'--'+e.Message);
    end;
  end;
{  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TClientDataset) then
    begin
      (Components[i] as TClientDataset).Close;
    end;   }
//  WriteLogFile('Disconnected with the server. OK', 2);  //bg
end;

procedure TCliDataModBase.SetServerName(const Value: string);
begin
  FServerName := Value;
end;

procedure TCliDataModBase.SetServerPort(const Value: integer);
begin
  FServerPort := Value;
end;



procedure TCliDataModBase.SetDefaultDateFormat(const Value: string);
var
  loc: TJclLocaleInfo;
begin
  FDefaultDateFormat := Value;
  loc := TJclLocaleInfo.Create;
  loc.LongDateFormat := Value;   // set Window's format for InfoPower
  loc.Free;
  LongDateFormat := Value;        // set for Delphi
end;


procedure TCliDataModBase.AllBasicDatasetsActive;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TADOTable) then
    begin
//      WriteLogFile((Components[i] as TAdoTable).TableName+ ' ...'); //bg
      (Components[i] as TAdoTable).Active := True;
    end
  else if (Components[i] is TClientDataset) then
  begin
  //  (Components[i] as TClientDataset).CreateDataset;
  end;

  WriteLogFile('All tables active. OK', 2);   //bg

end;

procedure TCliDataModBase.SetDBName(const Value: string);
begin
  FDBName := Value;
end;

procedure TCliDataModBase.SetHostName(const Value: string);
begin
  FHostName := Value;
end;

procedure TCliDataModBase.SetLoginName(const Value: string);
begin
  FLoginName := Value;
end;

procedure TCliDataModBase.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TCliDataModBase.SetPortNumber(const Value: integer);
begin
  FPortNumber := Value;
end;

function TCliDataModBase.GetDBName: string;
begin
  Result := SQLDatabase.DefaultDatabase;
end;

procedure TCliDataModBase.SetUserLevel(const Value: integer);
begin
  FUserLevel := Value;
end;

procedure TCliDataModBase.SetUserName(const Value: string);
begin
  FUserName := Value;
end;


procedure TCliDataModBase.SetFontNameDefault(const Value: string);
begin
  FFontNameDefault := Value;
end;

procedure TCliDataModBase.SetFontSizeDefault(const Value: integer);
begin
  FFontSizeDefault := Value;
end;

procedure TCliDataModBase.SetPrinterDefault(const Value: string);
begin
  FPrinterDefault := Value;
end;

procedure TCliDataModBase.SetPrinterInvoice(const Value: string);
begin
  FPrinterInvoice := Value;
end;

procedure TCliDataModBase.SetPrinterVoucher(const Value: string);
begin
  FPrinterVoucher := Value;
end;

procedure TCliDataModBase.DataModuleDestroy(Sender: TObject);   //bg
var
  i: integer;
begin
  DisconnectServer;

  DestroyDsODBCKey;
  Application.ProcessMessages;
end;



procedure TCliDataModBase.MainQDatasetAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to Dataset.FieldCount - 1 do
    if (Dataset.Fields.Fields[i] is TFloatField) then
      (Dataset.Fields.Fields[i] as TFloatField).DisplayFormat := '#.00';

  if (Dataset is TCustomAdoDataset) then
  begin
    (Dataset as TCustomAdoDataset).Recordset.Properties['Update Resync'].Value :=
       adResyncAutoIncrement + adResyncUpdates + adResyncInserts;
    (Dataset as TCustomAdoDataset).Properties['Update Criteria'].value :=adCriteriaKey;
  end;
end;

procedure TCliDataModBase.SaveOptionsEx(cfile: TIniFile);
begin
  
  cfile.WriteBool('General', 'CompactOnClose', CompactOnClose);
end;

procedure TCliDataModBase.LoadIniEx(cfile: TIniFile);
begin
  AutoServer:= cfile.ReadBool('Network', 'AutoServer', true);

  //  ServerName
  //  ServerPort

  ODBCDriverName:=  cfile.ReadString('Network', 'ODBCDriverName', 'myodbc3.dll');
  ConnectionTimeOut:=cfile.ReadInteger('Network', 'ConnectionTimeOut', 15);
  ToUseLocal := cfile.ReadBool('Network', 'ToUseLocal', False);
  CompactOnClose:=  cfile.ReadBool('General', 'CompactOnClose', true);
  if not AutoServer then
  begin
    HostName:=cfile.ReadString('User', 'Host', 'localhost');
    PortNumber:=cfile.ReadInteger('User', 'Port', 3306);
    LoginName:=cfile.ReadString('User', 'Login', 'root');
    password:=cfile.ReadString('User', 'password', '');
    DbName:=cfile.ReadString('User', 'database', 'videodata');

    EncodedOwner:=cfile.ReadString('User', 'user', 'someone');
    serial:=cfile.ReadInteger('User', 'serial', 111);
  end;

end;


function TCliDataModBase.DeleteStation(const ip: string): integer;
begin
  StationTbl.Active:=true;
  if StationTbl.Locate('ip', ip, []) then
    StationTbl.Delete;

end;


procedure TCliDataModBase.CreateDsODBCKey;
var
  Reg: TRegistry;
begin
{$IFDEF ACCESSBASE}
      ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + ODbcDbFile ;
      // though provider of MyDaSql could work, such provider seem not to support ADOX
      // The sackback is that ADOX does not like table name "Language".

{      ConnectionString:='Provider=MSDASQL.1;Persist Security Info=false;Data Source=videodata_fonlow' ;

      Reg:=TRegIniFile.Create;
      Reg.DeleteKey('Software\ODBC\ODBC.INI\videodata_fonlow');

      Reg.OpenKey('Software\ODBC\ODBC.INI\videodata_fonlow', true);
      Reg.WriteString('DBQ', ODBCDbFile);
      Reg.WriteInteger('DriverId', 25);
      Reg.WriteString('Driver', GetWindowsSystemFolder+'\'+ODBCDriverName);
      Reg.WriteString('FIL', 'MS Access');
      Reg.WriteInteger('SaveTransactions', 0);
      Reg.WriteString('UID',  '');

      Reg.OpenKey('Software\ODBC\ODBC.INI\videodata_fonlow\engines\Jet', true);
      Reg.WriteString('ImplicitCommitSync', '');
      Reg.WriteInteger('MaxBufferSize', 2048);
      Reg.WriteInteger('PageTimeout', 5);
      Reg.WriteInteger('Threads', 3);
      Reg.WriteString('UserCommitSync', 'Yes');

        Reg.CloseKey;
        Reg.Free;   }
{$ELSE}
      try
      ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=videodata_fonlow';
      Reg:=TRegIniFile.Create;
      Reg.DeleteKey('Software\ODBC\ODBC.INI\videodata_fonlow');

      Reg.OpenKey('Software\ODBC\ODBC.INI\videodata_fonlow', true);
      Reg.WriteString('Database', DBname);
      Reg.WriteString('Option', '3');
      Reg.WriteString('Driver', GetWindowsSystemFolder+'\'+ODBCDriverName);
      Reg.WriteString('Server', HostName);
      Reg.WriteString('Port',  IntToStr(ServerPort));
      Reg.WriteString('Description', 'Created and deleted by application');
      finally
        Reg.CloseKey;
        Reg.Free;
      end;
{$ENDIF}

end;

procedure TCliDataModBase.DestroyDsODBCKey;
var
  Reg: TRegistry;
begin
  if not IsDBFileBased then
  begin
    Reg:=TRegIniFile.Create;
    try
      Reg.DeleteKey('Software\ODBC\ODBC.INI\videodata_fonlow');
    finally
      Reg.Free;
    end;
  end;


end;

function TCliDataModBase.IsDBFileBased: boolean;
begin
  Result:= ToUseLocal ;
end;


procedure TCliDataModBase.RunCommand(const q: string);
begin
  QCommand.CommandText:=q;
  QCommand.Execute;
end;

procedure TCliDataModBase.MainQDatasetAfterInsert(DataSet: TDataSet);
var
    Defaults: array of Variant;
  Props : AdoInt.Properties;
  f: integer;
  TableName: WideString;
  ColumnName: WideString;

  cat: _Catalog;
  Col: _Column;

  Connect: OleVariant;

  i : integer;

begin

    cat := CoCatalog.Create;
    cat.Set_ActiveConnection((dataset as TCustomAdoDataset).Recordset.Get_ActiveConnection);
    // get defaults
    Props :=(dataset as TCustomAdoDataset).Recordset.Fields.Get_Item(Dataset.Fields[0].FieldName).Properties;
//    Props:=(dataset as TCustomAdoDataset).Recordset.Properties;
    TableName := VarToStr(Props.Item['BASETABLENAME'].Value);

    QDataset2.Active:=false;
    QDataset2.Sql.TExt:='show fields from '+Tablename;
    QDataset2.Active:=true;
    QDataset2.First;

    for i:=0 to Dataset.FieldCount-1 do
    begin
      Dataset.Fields[i].Value :=QDataset2.FieldValues['Default'];
      QDataset2.Next;
    end;



end;

function GetSqlResult(Connection: OleVariant; SQL: string): Variant;
var
  AdoRS: _Recordset;
begin
  result := EmptyParam;
  AdoRS := CoRecordset.Create;
  AdoRS.CursorLocation := adUseClient;
  AdoRS.Open(SQL, Connection, adOpenStatic, adLockReadOnly, adCmdText);
  if AdoRS.RecordCount = 1 then
    result := AdoRS.Fields[0].Value;
end;


end.
