object Form1: TForm1
  Left = 192
  Top = 114
  Width = 698
  Height = 455
  Caption = 'Form1'
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
    Left = 128
    Top = 32
    Width = 233
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object Button1: TButton
    Left = 48
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 272
    Top = 72
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 440
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 288
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 536
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit3'
  end
end
