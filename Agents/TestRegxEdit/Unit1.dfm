object Form1: TForm1
  Left = 192
  Top = 107
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 68
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 80
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 44
    Top = 120
    Width = 169
    Height = 21
    DataField = 'ClientDataSet1Field1'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 76
    Top = 204
    Width = 457
    Height = 193
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 80
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 4
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ClientDataSet1Field1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ThisField'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ClientDataSet1Field3'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 64
    Data = {
      8A0000009619E0BD0100000018000000030000000000030000008A0014436C69
      656E7444617461536574314669656C6431010049000000010005574944544802
      000200140009546869734669656C640100490000000100055749445448020002
      00140014436C69656E7444617461536574314669656C64330100490000000100
      0557494454480200020014000000}
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 272
    Top = 112
  end
end
