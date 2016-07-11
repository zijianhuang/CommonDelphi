object ClientFm: TClientFm
  Left = 192
  Top = 131
  Width = 595
  Height = 440
  Caption = 'ClientFm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 565
    Height = 189
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button15: TButton
    Left = 220
    Top = 228
    Width = 75
    Height = 25
    Caption = 'Create mail'
    TabOrder = 1
    OnClick = Button15Click
  end
  object ToEdit: TEdit
    Left = 100
    Top = 260
    Width = 213
    Height = 21
    TabOrder = 2
  end
  object CCEdit: TEdit
    Left = 100
    Top = 284
    Width = 213
    Height = 21
    TabOrder = 3
  end
  object BccEdit: TEdit
    Left = 100
    Top = 308
    Width = 213
    Height = 21
    TabOrder = 4
  end
  object SubjectEdit: TEdit
    Left = 326
    Top = 232
    Width = 213
    Height = 21
    TabOrder = 5
  end
  object BodyEdit: TMemo
    Left = 326
    Top = 256
    Width = 249
    Height = 133
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 36
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '127.0.0.1'
  end
  object IdUDPServer1: TIdUDPServer
    Active = True
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 7112
    OnUDPRead = IdUDPServer1UDPRead
    Left = 380
    Top = 56
  end
  object CS: TIdTCPClient
    Port = 7110
    Left = 256
    Top = 100
  end
end
