object FmDate: TFmDate
  Left = 214
  Top = 168
  BorderStyle = bsDialog
  ClientHeight = 347
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 0
    Width = 393
    Height = 309
    Date = 38037.401042511580000000
    TabOrder = 0
    OnDblClick = MonthCalendar1DblClick
  end
  object BnOk: TButton
    Left = 76
    Top = 316
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object BnCancel: TButton
    Left = 200
    Top = 316
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
