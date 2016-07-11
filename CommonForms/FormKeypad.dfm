object FmKeyPad: TFmKeyPad
  Left = 220
  Top = 113
  BorderStyle = bsNone
  Caption = 'FmKeyPad'
  ClientHeight = 180
  ClientWidth = 146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object b7: TJvSpeedButton
    Left = 16
    Top = 8
    Width = 36
    Height = 36
    Action = Action7
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b8: TJvSpeedButton
    Left = 56
    Top = 8
    Width = 36
    Height = 36
    Action = Action8
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b9: TJvSpeedButton
    Left = 96
    Top = 8
    Width = 36
    Height = 36
    Action = Action9
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b4: TJvSpeedButton
    Left = 16
    Top = 48
    Width = 36
    Height = 36
    Action = Action4
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b5: TJvSpeedButton
    Left = 56
    Top = 48
    Width = 36
    Height = 36
    Action = Action5
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b6: TJvSpeedButton
    Left = 96
    Top = 48
    Width = 36
    Height = 36
    Action = Action6
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b1: TJvSpeedButton
    Left = 16
    Top = 88
    Width = 36
    Height = 36
    Action = Action1
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b2: TJvSpeedButton
    Left = 56
    Top = 88
    Width = 36
    Height = 36
    Action = Action2
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b3: TJvSpeedButton
    Left = 96
    Top = 88
    Width = 36
    Height = 36
    Action = Action3
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object b0: TJvSpeedButton
    Left = 16
    Top = 128
    Width = 36
    Height = 36
    Action = Action0
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object bdel: TJvSpeedButton
    Left = 56
    Top = 128
    Width = 36
    Height = 36
    Action = A_Del
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object bok: TJvSpeedButton
    Left = 96
    Top = 128
    Width = 36
    Height = 36
    Action = A_OK
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object ActionList1: TActionList
    Left = 16
    Top = 120
    object Action1: TAction
      Caption = '1'
      ShortCut = 49
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = '2'
      ShortCut = 50
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = '3'
      ShortCut = 51
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = '4'
      ShortCut = 52
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = '5'
      ShortCut = 53
      OnExecute = Action5Execute
    end
    object Action6: TAction
      Caption = '6'
      ShortCut = 54
      OnExecute = Action6Execute
    end
    object Action7: TAction
      Caption = '7'
      ShortCut = 55
      OnExecute = Action7Execute
    end
    object Action8: TAction
      Caption = '8'
      ShortCut = 56
      OnExecute = Action8Execute
    end
    object Action9: TAction
      Caption = '9'
      ShortCut = 57
      OnExecute = Action9Execute
    end
    object A_Del: TAction
      Caption = 'Del'
      ShortCut = 46
      OnExecute = A_DelExecute
    end
    object A_OK: TAction
      Caption = 'OK'
      ShortCut = 13
      OnExecute = A_OKExecute
    end
    object Action0: TAction
      Caption = '0'
      ShortCut = 48
      OnExecute = Action0Execute
    end
  end
end
