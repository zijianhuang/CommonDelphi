object FmClockTime: TFmClockTime
  Left = 330
  Top = 193
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'Date time picker'
  ClientHeight = 240
  ClientWidth = 196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  ShowHint = True
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 195
    Height = 240
    Align = alLeft
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'Panel2'
    ParentColor = True
    TabOrder = 0
    object BnOk: TButton
      Left = 0
      Top = 210
      Width = 59
      Height = 25
      Caption = '&OK'
      Default = True
      TabOrder = 0
    end
    object BnCancel: TButton
      Left = 64
      Top = 210
      Width = 59
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
    end
    object BnClear: TButton
      Left = 128
      Top = 210
      Width = 59
      Height = 25
      Caption = 'Cl&ear'
      TabOrder = 2
    end
    object TheClock: TJvAnalogClock
      Left = 0
      Top = 0
      Width = 195
      Height = 206
      Cursor = crAppStart
      Hint = 
        'Left click to set hour and quaters of the hour.'#13#10'Right click to ' +
        'set minute of the same hour,'#13#10'click center to set AM/PM'
      ClockEnabled = False
      TimeSet = 38050.697287361100000000
      SpiderClock = True
      Seconds = False
      HourStyle = hsNumber
      MinuteStyle = hsCircle
      ColorHr = clMaroon
      ColorHrIn = clMaroon
      ColorMin = clBlue
      ColorHandHr = clMaroon
      ColorHandMin = clBlue
      CenterSize = 10
      CenterCol = clMaroon
      Align = alTop
      ParentColor = True
      TabOrder = 3
      OnMouseDown = TheClockMouseDown
      BevelInner = bvNone
      BevelOuter = bvNone
      object BnAp: TSpeedButton
        Left = 85
        Top = 92
        Width = 23
        Height = 22
        Hint = 'Click to change A/PM'
        Caption = 'P'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BnApClick
      end
    end
  end
end
