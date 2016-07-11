object ConfigFm: TConfigFm
  Left = 192
  Top = 107
  Width = 706
  Height = 556
  Caption = 'ConfigFm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DocCountLb: TLabel
    Left = 128
    Top = 136
    Width = 60
    Height = 13
    Caption = 'DocCountLb'
  end
  object Label1: TLabel
    Left = 4
    Top = 20
    Width = 49
    Height = 13
    Caption = 'Database:'
  end
  object Label2: TLabel
    Left = 4
    Top = 56
    Width = 30
    Height = 13
    Caption = 'Table:'
  end
  object Button1: TButton
    Left = 12
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Create Word'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 12
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Open Word'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DocNameEd: TEdit
    Left = 96
    Top = 236
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button3: TButton
    Left = 12
    Top = 268
    Width = 93
    Height = 25
    Caption = 'Open Template'
    TabOrder = 3
  end
  object TempComboBox: TComboBox
    Left = 116
    Top = 268
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object Button4: TButton
    Left = 144
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 12
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Connect Word'
    TabOrder = 6
    OnClick = Button5Click
  end
  object TempNameEd: TEdit
    Left = 96
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button6: TButton
    Left = 104
    Top = 160
    Width = 107
    Height = 25
    Caption = 'Disconnect Word'
    TabOrder = 8
  end
  object Button7: TButton
    Left = 300
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Connect Excel'
    TabOrder = 9
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 300
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Create Excel'
    TabOrder = 10
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 300
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Open Excel'
    TabOrder = 11
    OnClick = Button2Click
  end
  object Button10: TButton
    Left = 300
    Top = 264
    Width = 93
    Height = 25
    Caption = 'Open Template'
    TabOrder = 12
  end
  object Edit1: TEdit
    Left = 392
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object Edit2: TEdit
    Left = 392
    Top = 228
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object ComboBox1: TComboBox
    Left = 412
    Top = 264
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 15
  end
  object Button11: TButton
    Left = 564
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 16
    OnClick = Button4Click
  end
  object Button12: TButton
    Left = 480
    Top = 304
    Width = 173
    Height = 25
    Caption = 'Save Customer.db to xls'
    TabOrder = 17
    OnClick = Button12Click
  end
  object Edit3: TEdit
    Left = 480
    Top = 332
    Width = 185
    Height = 21
    TabOrder = 18
    Text = 'Edit3'
  end
  object DBGrid1: TDBGrid
    Left = 244
    Top = 0
    Width = 413
    Height = 129
    DataSource = OADataMod.DataSource1
    TabOrder = 19
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button13: TButton
    Left = 36
    Top = 356
    Width = 75
    Height = 25
    Caption = 'Open outlook'
    TabOrder = 20
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 36
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Close outlook'
    TabOrder = 21
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 132
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Create mail'
    TabOrder = 22
    OnClick = Button15Click
  end
  object ToEdit: TEdit
    Left = 224
    Top = 356
    Width = 213
    Height = 21
    TabOrder = 23
  end
  object CCEdit: TEdit
    Left = 224
    Top = 380
    Width = 213
    Height = 21
    TabOrder = 24
  end
  object BccEdit: TEdit
    Left = 224
    Top = 404
    Width = 213
    Height = 21
    TabOrder = 25
  end
  object SubjectEdit: TEdit
    Left = 444
    Top = 360
    Width = 213
    Height = 21
    TabOrder = 26
  end
  object BodyEdit: TMemo
    Left = 444
    Top = 384
    Width = 249
    Height = 133
    TabOrder = 27
  end
  object ComboBox2: TComboBox
    Left = 60
    Top = 12
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 28
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 60
    Top = 48
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 29
    OnChange = ComboBox3Change
  end
  object CheckBox1: TCheckBox
    Left = 60
    Top = 84
    Width = 97
    Height = 17
    Caption = 'Export with titles'
    TabOrder = 30
  end
  object Button16: TButton
    Left = 88
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Button16'
    TabOrder = 31
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 340
    Top = 476
    Width = 75
    Height = 25
    Caption = 'Broadcast'
    TabOrder = 32
    OnClick = Button17Click
  end
end
