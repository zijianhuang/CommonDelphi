object Form1: TForm1
  Left = 193
  Top = 165
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 476
    Top = 24
    Width = 153
    Height = 25
    Caption = 'Create new email'
    TabOrder = 0
  end
  object EdFirstName: TEdit
    Left = 124
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'EdFirstName'
  end
  object EdLastName: TEdit
    Left = 124
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Lastname'
  end
  object EdEmail: TEdit
    Left = 124
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Email'
  end
  object EdEmailAddressType: TEdit
    Left = 124
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'AddressType'
  end
  object EdBirthDay: TDateTimePicker
    Left = 124
    Top = 116
    Width = 121
    Height = 21
    Date = 38301.604199456020000000
    Time = 38301.604199456020000000
    TabOrder = 5
  end
  object Button2: TButton
    Left = 124
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Add contact'
    TabOrder = 6
    OnClick = Button2Click
  end
end
