object FmMain: TFmMain
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Currency to Words'
  ClientHeight = 389
  ClientWidth = 446
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
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Currency numbers:'
  end
  object Label2: TLabel
    Left = 8
    Top = 248
    Width = 34
    Height = 13
    Caption = 'Words:'
  end
  object Label3: TLabel
    Left = 8
    Top = 76
    Width = 55
    Height = 13
    Caption = 'Test cases:'
  end
  object EdInput: TEdit
    Left = 8
    Top = 24
    Width = 321
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
  end
  object BnConvert: TButton
    Left = 336
    Top = 24
    Width = 93
    Height = 33
    Caption = '&Convert'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BnConvertClick
  end
  object EdResult: TMemo
    Left = 8
    Top = 264
    Width = 429
    Height = 117
    TabOrder = 2
  end
  object EdTestcase: TMemo
    Left = 8
    Top = 92
    Width = 425
    Height = 153
    Lines.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '30'
      '40'
      '50'
      '60'
      '70'
      '80'
      '90'
      '100'
      '21'
      '33'
      '44'
      '55'
      '66'
      '77'
      '88'
      '99'
      '123'
      '12345678'
      '12345678.135'
      '123456789.99'
      '1238399.999'
      '88888888.989'
      '543211239.1'
      '2343792.01'
      '1.00111'
      '103.11'
      '199.999'
      '3000'
      '103008'
      '1030087.308')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object BnTest: TButton
    Left = 76
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 4
    OnClick = BnTestClick
  end
end
