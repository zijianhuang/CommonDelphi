unit DmDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DmGeneral, DB, ADODB, Adox_Tlb;

type
  TDbDm = class(TGeneralDm)
  private
  protected
    ConnectString : string;
    kk : TAdoxColumn;
    Catalog     : _Catalog;
    CurrentTable : _Table;

    function GetTypeString(c : _Column) : string;
  public
    function ConnectToServer: boolean;  override;

    function GetTableNames : TStringList;

    procedure SetTable(const TableName : string);

    function GetFieldCount : integer;

    function GetTableCount : integer;

    function GetFieldName(const i : integer) : string;
    function GetFieldType(const i : integer) : string;
    function GetNullable(const i : integer) : string;

    function GetPrimaryKeys : string;

    function GetIdentity : string;
    function GetIdentitySeed : string;
    function GetIdentityStep : string;

    function GetIndexNames : TStringList;

    function GetUniqueIndexNames : TStringList;

    function GetForeignKeyNames : TStringList;

    function GetForeignKeyTables : TStringList;


    function GetForeignKeyColumnCount(const KeyIndex : integer) : integer;
    procedure GetForeignKeyColumns(const KeyIndex : integer; const ColumnIndex : integer;
      var LocalFieldName, ForeignFieldName : string );   overload;
    function GetForeignKeyColumns(const KeyName : string) : TStringList; overload;


  end;

var
  DbDm: TDbDm;

implementation

{$R *.dfm}

{ TDbDm }

function TDbDm.ConnectToServer: boolean;
begin
  Result := inherited ConnectToServer;

  if Result then
  begin
    Catalog := CoCatalog.Create;
    Catalog.Set_ActiveConnection(SqlDatabase.ConnectionObject);
    Result := true;
  end;
end;


function TDbDm.GetFieldCount: integer;
begin
  Result := CurrentTable.Columns.Count;
end;

function TDbDm.GetFieldName(const i: integer): string;
begin
  Result := CurrentTable.Columns.Item[i].Name
end;


function TDbDm.GetFieldType(const i: integer): string;
begin
  Result := GetTypeString(CurrentTable.Columns.Item[i])
end;


function TDbDm.GetIdentity: string;
begin

  RunQuery(Format('select   COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where  TABLE_SCHEMA = ''dbo'''+
' and      TABLE_NAME   = %s and      COLUMNPROPERTY(object_id(%s), COLUMN_NAME, ''IsIdentity'') = 1 ',
[QuotedStr( CurrentTable.Name), QuotedStr(CurrentTable.Name)] ));
  Result := QryMain.fieldbyName('COLUMN_NAME').AsString;


end;

function TDbDm.GetIdentitySeed: string;
begin
  RunQuery('select IDENT_SEED(''client'') as ISeed ');
  Result := QryMain.FieldByname('ISeed').AsString;

end;

function TDbDm.GetIdentityStep: string;
begin
  RunQuery('select IDENT_INCR(''client'') as TheStep ');
  Result := QryMain.FieldByname('TheStep').AsString;

end;

function TDbDm.GetIndexNames: TStringList;
var
  t : string;
  i, k : integer;
begin
 Result := TStringList.Create;

 for i := 0 to CurrentTable.Indexes.Count - 1 do
 begin
   if not (CurrentTable.Indexes[i].Unique or CurrentTable.Indexes[i].PrimaryKey) then
   begin
     t := CurrentTable.Indexes[i].Columns[0].Name;
     for k := 1 to CurrentTable.Indexes[i].Columns.Count - 1 do
       t := t + ',' + CurrentTable.Indexes[i].Columns[k].Name;

     Result.Add(t);
   end;
 end;

end;

function TDbDm.GetForeignKeyNames: TStringList;
var
  i : integer;
begin
  Result := TStringList.Create;

  for i := 0 to CurrentTable.Keys.Count - 1 do
  begin
    if CurrentTable.Keys[i].type_ = adKeyForeign then
      Result.Add( CurrentTable.Keys[i].Name);
  end;
end;

function TDbDm.GetNullable(const i: integer): string;
begin
  if CurrentTable.Columns[i].Attributes = (adColNullable) then
    Result := 'true'
  else
    Result := 'false';
end;

function TDbDm.GetPrimaryKeys: string;
var
  i, k : integer;
begin
  for i := 0 TO cURRENTtABLE.Indexes.Count - 1 do
    if CurrentTable.Indexes[i].PrimaryKey then
    begin           
      Result := CurrentTable.Indexes[i].Columns[0].Name;
      for k := 1 to CurrentTable.Indexes[i].Columns.Count -1 do
        Result := Result + ','+CurrentTable.Indexes[i].Columns[k].Name;

      break;
    end;
end;

function TDbDm.GetTableCount: integer;
begin       
  Result := Catalog.Tables.Count;
end;

function TDbDm.GetTableNames: TStringList;
var
  i : integer;
begin
  Result := TstringList.Create;

  for i := 0 to Catalog.Tables.Count - 1 do
    Result.Add( Catalog.Tables.Item[i].Name );

end;

function TDbDm.GetTypeString(c: _Column): string;
begin
  case c.Type_ of
    adTinyInt, adUnsignedTinyInt           : Result := 'tinyint';
    adSmallInt, adUnsignedSmallInt     : Result := 'smallint';
    adInteger, adUnsignedInt      : Result := 'int';
    adBigInt,  adUnsignedBigInt      : Result := 'bigint';

    adBoolean      : Result := 'bit';

    adSingle            : Result := 'real';
    adDouble            : Result := 'float';
    adCurrency          : Result := 'money';//+IntToStr(c.NumericScale)+') ';
    adDecimal   : Result := 'Decimal('+
                        IntToStr(c.Precision)+','+IntToStr(c.NumericScale)+') ';
    adNumeric            : Result := 'Decimal('+
                        IntToStr(c.Precision)+','+IntToStr(c.NumericScale)+') ' ;

    adDate           : Result := 'datetime';

    adChar              : Result := 'char('+IntToStr(c.DefinedSize)+') ';
    adVarChar            : Result := 'varchar('+IntToStr(c.DefinedSize)+') ';

    adWChar     : Result := 'nchar('+IntToStr(c.DefinedSize)+') ';
    adVarWChar  : Result := 'nvarchar('+IntToStr(c.DefinedSize)+') ';
    adLongVarChar  : Result := 'text';
    adLongVarWChar : Result := 'ntext';

    adBinary  : Result :=  'binary';
    adVarBinary : Result := 'varbinary';
    adLongVarBinary   : Result := 'image';
    adDbTimeStamp : Result := 'datetime';
//    adPropVariant : Result := 'sql_variant';
  else
    Result := 'notsupported';
  end;

end;

function TDbDm.GetUniqueIndexNames: TStringList;
var
  t : string;
  i, k : integer;
begin
 Result := TStringList.Create;

 for i := 0 to CurrentTable.Indexes.Count - 1 do
 begin
   if CurrentTable.Indexes[i].Unique and (not CurrentTable.Indexes[i].PrimaryKey) then
   begin
     t := CurrentTable.Indexes[i].Columns[0].Name;
     for k := 1 to CurrentTable.Indexes[i].Columns.Count - 1 do
       t := t + ',' + CurrentTable.Indexes[i].Columns[k].Name;

     Result.Add(t);
   end;
 end;

end;

procedure TDbDm.SetTable(const TableName: string);
begin
  CurrentTable :=Catalog.Tables.Item[Tablename];
end;

function TDbDm.GetForeignKeyTables: TStringList;
var
  i : integer;
begin
  Result := TStringList.Create;

  for i := 0 to CurrentTable.Keys.Count - 1 do
  begin
    if CurrentTable.Keys[i].type_ = adKeyForeign then
      Result.Add( CurrentTable.Keys[i].RelatedTable);
  end;

end;


function TDbDm.GetForeignKeyColumnCount(const KeyIndex: integer): integer;
begin
  Result := CurrentTable.Keys[KeyIndex].Columns.Count;
end;

procedure TDbDm.GetForeignKeyColumns(const KeyIndex, ColumnIndex: integer;
  var LocalFieldName, ForeignFieldName: string);
begin
  LocalFieldName := CurrentTable.Keys[KeyIndex].Columns[ColumnIndex].Name;
  ForeignFieldName := CurrentTable.Keys[KeyIndex].Columns[ColumnIndex].RelatedColumn;
end;

function TDbDm.GetForeignKeyColumns(const KeyName: string): TStringList;
begin
// not yet
end;

end.
