object FmDatetime: TFmDatetime
  Left = 330
  Top = 193
  AutoSize = True
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'Date time picker'
  ClientHeight = 211
  ClientWidth = 392
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
  object Panel1: TPanel
    Left = 197
    Top = 0
    Width = 195
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    ParentColor = True
    TabOrder = 0
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
      TimeSet = 38050.6972873611
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
      TabOrder = 0
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 197
    Height = 211
    Align = alLeft
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'Panel2'
    ParentColor = True
    TabOrder = 1
    object MonthCalendar1: TMonthCalendar
      Left = 0
      Top = 0
      Width = 190
      Height = 153
      AutoSize = True
      Date = 38097.8777708912
      TabOrder = 0
    end
    object BnOk: TButton
      Left = 10
      Top = 168
      Width = 59
      Height = 25
      Caption = '&OK'
      Default = True
      TabOrder = 1
    end
    object BnCancel: TButton
      Left = 74
      Top = 168
      Width = 59
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 2
    end
    object BnClear: TButton
      Left = 138
      Top = 168
      Width = 59
      Height = 25
      Caption = 'Cl&ear'
      TabOrder = 3
    end
  end
end
