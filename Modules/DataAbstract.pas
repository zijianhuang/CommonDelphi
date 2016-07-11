unit DataAbstract;
{
  Purpose:
  * Basic class for connecting to a SQL server, using ZEOS lib (v6.0 and above).
  * Basic functions of dealing with the server

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, stdctrls, FileCtrl,
  ZSqlProcessor,
  ZSqlUpdate, ZAbstractDataset, ZDataset, ZAbstractRODataset, ZConnection,
  ZAbstractConnection;

type
  TDataModAbstract = class(TDataModule)
    SrcSqlTable: TDataSource;
    TheSqlConnection: TZConnection;
    SqlTable: TZReadOnlyQuery;
    TheUpdateSql: TZUpdateSQL;
    TheSQLProcessor: TZSQLProcessor;
    QryRead: TZReadOnlyQuery;
    QryMain: TZReadOnlyQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    Fdatabasename: string;
    FOnLog: TGetStrProc;
    procedure Setdatabasename(const Value: string);
    procedure Sethost(const Value: string);
    procedure Setlogin(const Value: string);
    procedure Setpassword(const Value: string);
    function GetHost: string;
    function GetLogin: string;
    function GetPassword: string;
    function GetPort: integer;
    procedure SetPort(const Value: integer);
    function GetProtocol: string;
    procedure SetProtocol(const Value: string);
  protected
  public

    property SqlServerType : string read GetProtocol write SetProtocol;
    property host  : string read GetHost write Sethost;
    property Port  : integer read GetPort write SetPort;
    property login      : string read GetLogin write Setlogin;
    property password   : string read GetPassword write Setpassword;
    property databasename       :string read FDatabasename write Setdatabasename;

    //: Connect to server using settings of host, port, and login etc.
    function ConnectServer : boolean; virtual;
    procedure DisconnectServer;  virtual;

    //: Run a select script with readonly result, Results are stored in QryRead
    function ReadQuery(const s : string) : integer;    overload;

    function ReadQuery(ds : TZReadOnlyQuery; const s : string) : integer; overload;
    function ReadQuery(ds : TZQuery; const s : string) : integer; overload;
    function RefreshQuery(ds : TZReadOnlyQuery) : integer;


    //: Execute a set of scripts with component TheSqlProcessor
    procedure RunSql(const s : string);

    //: Execute a Sql file with component The SqlProcessor
    function RunSqlFile(const filename : string) : boolean;  // size limit of the file is 64 KB

// New Interfaces ********************** consistent with DmGeneral
    //: Run a query with QryMain and DsMain.
    function RunQuery(const q: string) : integer;

    //: Run a query 
    procedure RunCommand(const q: string);


    function ConnectToServer: boolean;  virtual;

    //: derived class may use this to handle exception, and override ConnectToServer
    procedure ConnectToServerWithException;

    procedure BeginTrans;
    procedure CommitTrans;
    procedure RollBackTrans;

    function CreateDataset : TZReadonlyQuery;
    function CreateQuery(const s : string) : TZReadonlyQuery;

    procedure WriteLogFile(const s : string);

    property OnLog : TGetStrProc read FOnLog write FOnLog;

  end;


implementation
uses JclSysInfo, JclFileUtils;

{$R *.DFM}


procedure TDataModAbstract.RunSql(const s: string);
begin
  TheSqlProcessor.Script.Text := s+ TheSqlProcessor.Delimiter;;
  TheSqlProcessor.Execute;  
end;

function TDataModAbstract.ConnectServer: boolean;
begin
  try
    TheSqlConnection.Connect;
    Result:=true;
  except
    on e : Exception do
    begin
      WriteLogFile(e.ClassName+'--'+e.Message);
      Result:=false;
    end;
  end;

end;

procedure TDataModAbstract.DisconnectServer;
begin
  TheSqlConnection.Disconnect;
end;


procedure TDataModAbstract.Setdatabasename(const Value: string);
begin
  FDatabasename:=Value;
  TheSqlConnection.Database:=value;
end;

procedure TDataModAbstract.Sethost(const Value: string);
begin
  TheSqlConnection.HostName:=Value;
end;

procedure TDataModAbstract.Setlogin(const Value: string);
begin
  TheSqlConnection.User:=Value;
end;

procedure TDataModAbstract.Setpassword(const Value: string);
begin
  TheSqlConnection.Password:=Value;
end;


function TDataModAbstract.GetHost: string;
begin
  Result:=TheSqlConnection.HostName;
end;

function TDataModAbstract.GetLogin: string;
begin
  Result:=TheSqlConnection.User;
end;

function TDataModAbstract.GetPassword: string;
begin
  Result:=TheSqlConnection.Password;
end;


function TDataModAbstract.GetPort: integer;
begin
  Result:=TheSqlConnection.Port ;
end;

procedure TDataModAbstract.SetPort(const Value: integer);
begin
 TheSqlConnection.Port:=Value;
end;

function TDataModAbstract.RunSqlFile(const filename: string): boolean;
begin
  Result:=false;

  if not FileExists(filename) then
  begin
    raise Exception.Create(filename+' does not exist.');
    exit;
  end;

  if GetSizeOfFile(filename)>65536 then
  begin
    MessageDlg('The SQL script file should not larger than 64 KB', mtError, [mbOK], 0);
    exit;
  end;

  TheSqlProcessor.LoadFromFile(filename);
//  try
 //   BeginTrans;    // it should be up to the client code to decide whether to use transaction
    TheSqlProcessor.Execute;
 //   CommitTrans;   // creating table does not like it
    Result:=true;
//  finally
//    RollBackTrans;
//  end;
end;


function TDataModAbstract.ReadQuery(const s: string) : integer;
begin
  QryRead.Close;
  QryRead.Sql.Text:=s;
  QryRead.Open;
  Result := QryRead.RecordCount;

end;

function TDataModAbstract.GetProtocol: string;
begin
  Result := TheSqlConnection.Protocol;
end;

procedure TDataModAbstract.SetProtocol(const Value: string);
begin
   TheSqlConnection.Protocol := Value;
end;

procedure TDataModAbstract.DataModuleCreate(Sender: TObject);
begin
  if TheSqlConnection.Connected  then
    raise Exception.Create('The connection object is connected at startup. Please disconnect before deployment.');
end;

procedure TDataModAbstract.RunCommand(const q: string);
begin
  TheSqlProcessor.Script.Text := q + TheSqlProcessor.Delimiter;
  TheSqlProcessor.Execute;

end;

function TDataModAbstract.RunQuery(const q: string): integer;
begin
  QryMain.Close;
  QryMain.Sql.Text:=q;
  QryMain.Open;
  Result := QryMain.RecordCount;
end;

function TDataModAbstract.ConnectToServer: boolean;
begin
  Result := ConnectServer;
end;

procedure TDataModAbstract.WriteLogFile(const s: string);
begin
  if Assigned(OnLog) then
    OnLog(s);

end;

procedure TDataModAbstract.BeginTrans;
begin
  TheSqlConnection.StartTransaction;
end;

procedure TDataModAbstract.CommitTrans;
begin
 TheSqlConnection.Commit;
end;

procedure TDataModAbstract.RollBackTrans;
begin
 TheSqlConnection.Rollback;
end;

procedure TDataModAbstract.ConnectToServerWithException;
begin
    TheSqlConnection.connected:=true;

end;

function TDataModAbstract.CreateDataset: TZReadonlyQuery;
begin
  Result := TZReadonlyQuery.Create(nil);
  Result.Connection := TheSqlConnection;
end;

function TDataModAbstract.CreateQuery(const s: string): TZReadonlyQuery;
begin
  Result := CreateDataset;
  Result.SQL.Text := s;
  Result.Open;
end;

function TDataModAbstract.ReadQuery(ds: TZReadOnlyQuery;
  const s: string): integer;
begin
  ds.Close;
  ds.Sql.Text:=s;
  ds.Open;
  Result := ds.RecordCount;

end;

function TDataModAbstract.RefreshQuery(ds: TZReadOnlyQuery): integer;
begin
  ds.Close;
  ds.Open;
  Result := ds.RecordCount;
end;

function TDataModAbstract.ReadQuery(ds: TZQuery; const s: string): integer;
begin
  ds.Close;
  ds.Sql.Text:=s;
  ds.Open;
  Result := ds.RecordCount;

end;

end.
