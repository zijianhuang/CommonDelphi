{{
  Purpose:
    provide basic connection and query services via ADO.

  Programming tips:
    This unit will be subclassed for specific projects.
}
unit DmGeneral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, stdctrls, ExtCtrls, dbctrls,
  DBClient, ADODB, OleServer;

type


  TGeneralDm = class(TDataModule)
    DsMain: TDataSource;
    DsBasic: TDataSource;
    SQLDatabase: TADOConnection;
    QryMain: TADOQuery;
    QryOK: TADOQuery;
    QryBasic: TADOQuery;
    QCommand: TADOCommand;
    QryRead: TADOQuery;

    // BasicClientDataset
    procedure BasicClientDataSetPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure DataModuleDestroy(Sender: TObject);

    {{
      This function is needed to assigned to dataset objects which need to show
      money value properly. This is mandatory in D5. @todo this may not
      be needed in D7.
    }
    procedure QryMainAfterOpen(DataSet: TDataSet);

    {{
      This function is needed to assigned to dataset objects which need to show
      default db value after inserting. This is mandatory in D5. @todo this may not
      be needed in D7.
    }
    procedure QryMainAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    FConnectionString: string;
    FOnLog: TGetStrProc;
    function GetDatabaseName: string;
  protected

    procedure SetConnectionString(const Value: string);  virtual;
  public
    //: Run a query with QryMain and DsMain.
    function RunQuery(const q: string) : integer;

    function ReadQuery(const q: string) : integer;

    //: The client need to free the returned TAdoQuery object
    function CreateQuery(const q : string) : TAdoQuery;

    //: Run a query with AdoCommand object.
    procedure RunCommand(const q: string);

    //: Run a query with respective TAdoQuery object
    function SearchDataset(ds: TADOQuery; const qst: string): boolean;

    //: query whether a key value exists in the table, return howmany.
    function KeyExists(const tblname: string; const fldname: string;
      const fldvalue: string): integer;

    //: Connect db server
    function ConnectToServer: boolean;  virtual;

    procedure DisconnectServer;  virtual;

    //: Return a list of active datasets associated with the AdoConnection. The client must release the list.
    function GetActiveDatasets: TStringList;

    //: Return a dataset query string or table name
    function GetDatasetString(const dname: string): string;

    procedure WriteLogFile(const s : string);

    procedure BeginTrans;
    procedure CommitTrans;
    procedure RollBackTrans;

    // create a readonjly dataset
    function CreateDataset : TAdoQuery;


    //: Read from the INI file, to store connection string temporarily. The string will be copied to the TAdoConnection object.
    property ConnectionString: string read FConnectionString write SetConnectionString;

    property DatabaseName : string read GetDatabaseName;

    property OnLog : TGetStrProc read FOnLog write FOnLog;
  end;

function GetSqlResult(Connection: OleVariant; SQL: string): Variant;

implementation

uses  JclSysInfo, JclLocales, Adox_Tlb  ,
  StrUtils, registry, adoint, comobj{$IFDEF VER150}, Variants{$ENDIF};
{$R *.DFM}

function TGeneralDm.SearchDataset(ds: TADOQuery; const qst: string): boolean;
begin
  Result := False;
  //  ds.DisableControls;     // seem to cause problems
  try
    ds.Active := False;
    ds.Sql.Text := qst;
    ds.Active := True;
//    if ds.Active then  // delphi exception handling could not handle ODBC error.
      Result := ds.IsEmpty;
  except
    on e: SysUtils.Exception do
      WriteLogFile(e.ClassName + '--' + e.message + '--' + qst);
  end;
  //  ds.EnableControls;
end;

function TGeneralDm.KeyExists(const tblname: string; const fldname: string;
  const fldvalue: string): integer;
begin
  QryBasic.Active := False;
  QryBasic.Sql.Text := 'select count(*) as ccokk from ' + tblname + ' where ' +
    fldname + ' = ' + QuotedStr(fldvalue);

  QryBasic.Active := True;
  Result := QryBasic.FieldByName('ccokk').AsInteger;
end;

procedure TGeneralDm.BasicClientDataSetPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  WriteLogFile(' PostError:' + E.ClassName + '--' + E.Message);
  Action := daAbort;
end;


function TGeneralDm.ConnectToServer: boolean;
begin
  try
    SQLDatabase.Close;
    SQLDatabase.ConnectionString := ConnectionString; // Re-assign connectionString.
    // Since "ConnectionString" property of SqlDatabase will be changed after connection.

    SQLDatabase.Open;

    Result := True;
  except
    on e: Exception do
    begin
      WriteLogFile(e.ClassName + '--' + e.Message +
        ' While ConnectToServer. ConnectionString: ' + ConnectionString);
      Result := False;
    end;
  end;
end;

function TGeneralDm.RunQuery(const q: string) : integer;
begin
  QryMain.Close;
  QryMain.Sql.Text := q;
  QryMain.Open;
  QryMain.Last;
  Result := QryMain.RecordCount;
end;



procedure TGeneralDm.DisconnectServer;
begin
  try
    SQLDatabase.Connected := False;
  except
    on e: Exception do
    begin
      if e.ClassType = EOleException then
      begin
        WriteLogFile('There might be at least one threaded query running. Please wait a few seconds and press OK.');
        SQLDatabase.Connected := False;
      end
      else
        WriteLogFile(e.ClassName + '--' + e.Message);
    end;
  end;
end;


procedure TGeneralDm.DataModuleDestroy(Sender: TObject);   //bg
var
  i: integer;
begin
  DisconnectServer;

//  Application.ProcessMessages;
end;



procedure TGeneralDm.QryMainAfterOpen(DataSet: TDataSet);
begin
{  for i := 0 to Dataset.FieldCount - 1 do
    if (Dataset.Fields.Fields[i] is TFloatField) then
      (Dataset.Fields.Fields[i] as TFloatField).DisplayFormat := '#.00';}

  if (Dataset is TCustomAdoDataset) then
  begin
    (Dataset as TCustomAdoDataset).Recordset.Properties['Update Resync'].Value :=
      adResyncAutoIncrement + adResyncUpdates + adResyncInserts;
    (Dataset as TCustomAdoDataset).Properties['Update Criteria'].Value := adCriteriaKey;
  end;
end;



procedure TGeneralDm.RunCommand(const q: string);
begin
  QCommand.CommandText := q;
  QCommand.Execute;
end;

procedure TGeneralDm.QryMainAfterInsert(DataSet: TDataSet);
var
  Defaults: array of Variant;
  Props: AdoInt.Properties;
  TableName: widestring;

  cat: _Catalog;
  Col: _Column;

  Connect: OleVariant;

  i: integer;
begin
  cat := CoCatalog.Create;
  cat.Set_ActiveConnection((dataset as TCustomAdoDataset).Recordset.Get_ActiveConnection);
  // get defaults
  Props := (dataset as TCustomAdoDataset).Recordset.Fields.Get_Item
    (Dataset.Fields[0].FieldName).Properties;
  //    Props:=(dataset as TCustomAdoDataset).Recordset.Properties;
  TableName := VarToStr(Props.Item['BASETABLENAME'].Value);

  QryOK.Active := False;
  QryOK.Sql.Text := 'show fields from ' + Tablename;
  QryOK.Active := True;
  QryOK.First;

  for i := 0 to Dataset.FieldCount - 1 do
  begin
    Dataset.Fields[i].Value := QryOK.FieldValues['Default'];
    QryOK.Next;
  end;
end;

function GetSqlResult(Connection: OleVariant; SQL: string): Variant;
var
  AdoRS: _Recordset;
begin
  Result := EmptyParam;
  AdoRS := CoRecordset.Create;
  AdoRS.CursorLocation := adUseClient;
  AdoRS.Open(SQL, Connection, adOpenStatic, adLockReadOnly, adCmdText);
  if AdoRS.RecordCount = 1 then
    Result := AdoRS.Fields[0].Value;
end;

function TGeneralDm.GetActiveDatasets: TStringList;
var
  i: integer;
  t: TStringList;
  TotalSize, QSize: integer;
begin
  TotalSize := 0;
  QSize := 0;

  t := TStringList.Create;

  for i := 0 to (SqlDatabase.DataSetCount - 1) do
    if SqlDatabase.DataSets[i].Active then
    begin
      QSize := SqlDatabase.DataSets[i].RecordSize * SqlDatabase.DataSets[i].RecordCount;
      TotalSize := TotalSize + QSize;
      t.Add(SqlDatabase.DataSets[i].Name + '--' + IntToStr(SqlDatabase.DataSets[i].RecordCount)+
        '~'+ IntToStr(QSize));
    end;

  t.Add(' Total size: ' + IntToStr(TotalSize));

  Result := t;

  // The help content about Datasets is incorrect.
end;

function TGeneralDm.GetDatasetString(const dname: string): string;
var
  i: integer;
begin
  Result := 'Dataset not found.';
  for i := 0 to (SqlDatabase.DataSetCount - 1) do
    if CompareText(SqlDatabase.DataSets[i].Name, dname) = 0 then
    begin
      if SqlDatabase.DataSets[i] is TAdoTable then
        Result := (SqlDatabase.DataSets[i] as TAdoTable).TableName
      else if SqlDatabase.DataSets[i] is TAdoQuery then
        Result := (SqlDatabase.DataSets[i] as TAdoQuery).SQL.Text;

      break;
    end;
end;

procedure TGeneralDm.DataModuleCreate(Sender: TObject);
begin
//  FConnectionString :=
//    'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=NewJigsawPro;Data Source=ELVIS';
    if SqlDatabase.Connected then
      raise Exception.Create('The data connection is active at startup. Please make it inactive before deployment.');
end;

procedure TGeneralDm.WriteLogFile(const s: string);
begin
  if Assigned(OnLog) then
    OnLog(s);
end;

procedure TGeneralDm.SetConnectionString(const Value: string);
begin
  FConnectionString := Value;
end;

function TGeneralDm.GetDatabaseName: string;
begin            
  Result := SqlDatabase.DefaultDatabase;
end;

procedure TGeneralDm.BeginTrans;
begin
  SqlDatabase.BeginTrans;
end;

procedure TGeneralDm.CommitTrans;
begin
  SqlDatabase.CommitTrans;
end;

procedure TGeneralDm.RollBackTrans;
begin
  SqlDatabase.RollbackTrans;
end;

function TGeneralDm.CreateDataset: TAdoQuery;
begin
  Result := TAdoQuery.Create(self);
  Result.Connection :=  SqlDatabase;
  Result.LockType := ltReadOnly;
end;

function TGeneralDm.CreateQuery(const q: string): TAdoQuery;
begin
  Result := CreateDataset;
  Result.SQL.Text := q;
  Result.Open;

end;

function TGeneralDm.ReadQuery(const q: string): integer;
begin
  QryRead.Close;
  QryRead.Sql.Text:=q;
  QryRead.Open;
  Result := QryRead.RecordCount;

end;

end.
