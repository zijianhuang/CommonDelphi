object AgentFm: TAgentFm
  Left = 348
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Email Agent'
  ClientHeight = 220
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 24
    Width = 73
    Height = 13
    Caption = 'Default emailer:'
  end
  object Label2: TLabel
    Left = 268
    Top = 200
    Width = 62
    Height = 13
    Caption = 'Version 0.1 b'
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 20
    Width = 205
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      'Outlook Express'
      'Outlook')
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 325
    Height = 129
    TabOrder = 1
  end
  object IdLogDebug1: TIdLogDebug
    Active = True
    OnLogItem = IdLogDebug1LogItem
    Target = ltEvent
    Left = 268
    Top = 8
  end
end
