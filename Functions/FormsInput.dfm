object HInputBox: THInputBox
  Left = 416
  Top = 255
  BorderStyle = bsDialog
  Caption = 'HInputBox'
  ClientHeight = 95
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LbHint: TLabel
    Left = 16
    Top = 8
    Width = 285
    Height = 13
    AutoSize = False
    Caption = 'LbHint'
  end
  object BnOK: TButton
    Left = 68
    Top = 60
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object BnCancel: TButton
    Left = 172
    Top = 60
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Edit: TJvValidateEdit
    Left = 16
    Top = 28
    Width = 273
    Height = 21
    CheckChars = '0123456789.'
    CriticalPoints.CheckPoints = cpNone
    CriticalPoints.ColorAbove = clBlue
    CriticalPoints.ColorBelow = clRed
    DisplayFormat = dfFloat
    EditText = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
    Value = 0.000000000000000000
  end
end
