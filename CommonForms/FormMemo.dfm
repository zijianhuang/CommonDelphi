object FmMemo: TFmMemo
  Left = 229
  Top = 262
  ActiveControl = Memo1
  BorderStyle = bsSingle
  BorderWidth = 1
  Caption = 'Memo'
  ClientHeight = 258
  ClientWidth = 480
  Color = clInactiveCaption
  TransparentColor = True
  TransparentColorValue = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  DesignSize = (
    480
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object BnOk: TButton
    Left = 318
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object BnCancel: TButton
    Left = 402
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = BnCancelClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 486
    Height = 257
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
