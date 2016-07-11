object IPDataMod: TIPDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object TCPServer: TIdTCPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 7110
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnExecute = TCPServerExecute
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 168
    Top = 28
  end
  object TCPClient: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '127.0.0.1'
    Port = 7110
    Left = 168
    Top = 100
  end
  object UDPServer: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 7080
    Left = 72
    Top = 104
  end
  object UDPClient: TIdUDPClient
    BroadcastEnabled = True
    Port = 7080
    ReceiveTimeout = 500
    Left = 56
    Top = 32
  end
end
