object CliDataModBase: TCliDataModBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 135
  Top = 107
  Height = 597
  Width = 873
  object MainQDataSource: TDataSource
    DataSet = MainQDataset
    Left = 108
    Top = 11
  end
  object QDataSource2: TDataSource
    DataSet = QDataset2
    Left = 352
    Top = 7
  end
  object BasicQDataSource: TDataSource
    DataSet = BasicQDataset
    Left = 192
    Top = 7
  end
  object BasicDQDAtaSource: TDataSource
    DataSet = BasicDQDataset
    Left = 276
    Top = 7
  end
  object SQLDatabase: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=video' +
      'data_my'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 544
    Top = 8
  end
  object MainQDataset: TADOQuery
    Connection = SQLDatabase
    AfterOpen = MainQDatasetAfterOpen
    AfterInsert = MainQDatasetAfterInsert
    Parameters = <>
    Left = 108
    Top = 60
  end
  object BasicDQDataset: TADOQuery
    Connection = SQLDatabase
    AfterOpen = MainQDatasetAfterOpen
    Parameters = <>
    Left = 268
    Top = 60
  end
  object QDataset2: TADOQuery
    Connection = SQLDatabase
    AfterOpen = MainQDatasetAfterOpen
    Parameters = <>
    Left = 352
    Top = 60
  end
  object BasicQDataset: TADOQuery
    Connection = SQLDatabase
    AfterOpen = MainQDatasetAfterOpen
    Parameters = <>
    Left = 192
    Top = 60
  end
  object UserTbl: TADOTable
    Connection = SQLDatabase
    TableName = 'staff'
    Left = 420
    Top = 56
  end
  object StationTbl: TADOTable
    Connection = SQLDatabase
    TableName = 'station'
    Left = 432
    Top = 4
  end
  object QCommand: TADOCommand
    Connection = SQLDatabase
    Parameters = <>
    Left = 596
    Top = 12
  end
end
