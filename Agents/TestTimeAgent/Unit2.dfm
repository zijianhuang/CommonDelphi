object Form2: TForm2
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 104
    Top = 64
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 80
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 92
    Top = 160
    Width = 186
    Height = 21
    Date = 38148.480040868050000000
    Time = 38148.480040868050000000
    TabOrder = 3
  end
  object DateTimePicker2: TDateTimePicker
    Left = 80
    Top = 232
    Width = 186
    Height = 21
    Date = 38148.480813518520000000
    Time = 38148.480813518520000000
    Kind = dtkTime
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 364
    Top = 48
    Width = 185
    Height = 105
    Caption = 'RadioGroup1'
    ItemIndex = 1
    Items.Strings = (
      'International'
      'English'
      'US')
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object CheckBox1: TCheckBox
    Left = 200
    Top = 92
    Width = 97
    Height = 17
    Caption = '24 hour'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit2'
  end
  object Button2: TButton
    Left = 260
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 7
    OnClick = Button2Click
  end
end
