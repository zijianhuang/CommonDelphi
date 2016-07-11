object FmPassword: TFmPassword
  Left = 230
  Top = 283
  BorderStyle = bsDialog
  Caption = 'FmPassword'
  ClientHeight = 85
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object MaskEdit1: TMaskEdit
    Left = 16
    Top = 28
    Width = 197
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Text = 'MaskEdit1'
  end
  object Button1: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 120
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
