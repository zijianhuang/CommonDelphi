object DataModAbstract: TDataModAbstract
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 252
  Top = 199
  Height = 292
  Width = 347
  object SrcSqlTable: TDataSource
    DataSet = SqlTable
    Left = 40
    Top = 124
  end
  object TheSqlConnection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    ReadOnly = True
    HostName = 'localhost'
    Port = 3306
    Database = 'mysql'
    User = 'root'
    Password = 'root'
    Protocol = 'mysql'
    Left = 36
    Top = 12
  end
  object SqlTable: TZReadOnlyQuery
    Connection = TheSqlConnection
    Params = <>
    Left = 32
    Top = 68
  end
  object TheUpdateSql: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 116
    Top = 12
  end
  object TheSQLProcessor: TZSQLProcessor
    ParamCheck = False
    Params = <>
    Connection = TheSqlConnection
    Delimiter = ';'
    Left = 192
    Top = 8
  end
  object QryRead: TZReadOnlyQuery
    Connection = TheSqlConnection
    Params = <>
    Left = 216
    Top = 76
  end
  object QryMain: TZReadOnlyQuery
    Connection = TheSqlConnection
    Params = <>
    Left = 112
    Top = 72
  end
end
