object GeneralDm: TGeneralDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 377
  Top = 154
  Height = 206
  Width = 314
  object SQLDatabase: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 12
  end
  object QCommand: TADOCommand
    Connection = SQLDatabase
    Parameters = <>
    Left = 28
    Top = 68
  end
  object QryMain: TADOQuery
    Connection = SQLDatabase
    AfterOpen = QryMainAfterOpen
    AfterInsert = QryMainAfterInsert
    Parameters = <>
    Left = 108
    Top = 60
  end
  object QryOK: TADOQuery
    Connection = SQLDatabase
    AfterOpen = QryMainAfterOpen
    Parameters = <>
    Left = 248
    Top = 60
  end
  object QryBasic: TADOQuery
    Connection = SQLDatabase
    AfterOpen = QryMainAfterOpen
    Parameters = <>
    Left = 184
    Top = 68
  end
  object DsBasic: TDataSource
    DataSet = QryBasic
    Left = 188
    Top = 19
  end
  object DsMain: TDataSource
    DataSet = QryMain
    Left = 108
    Top = 11
  end
  object QryRead: TADOQuery
    Connection = SQLDatabase
    LockType = ltReadOnly
    AfterOpen = QryMainAfterOpen
    AfterInsert = QryMainAfterInsert
    Parameters = <>
    Left = 140
    Top = 116
  end
end
