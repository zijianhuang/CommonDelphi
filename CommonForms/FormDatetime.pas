{{
  Purpose:
    Provide a popup window for user to select date and time. Very fancy.
}
unit FormDatetime;

interface

uses
  Windows, Messages, SysUtils, {$ifdef ver150}Variants,{$endif} Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ComCtrls, ExtCtrls, JvComponent,
  JvAnalogClock, Buttons, JvSpeedButton;

type
  TDateTimePickerExit = procedure (Sender : TObject; const t : TDateTime) of Object;

  TFmDatetime = class(TForm)
    Panel1: TPanel;
    TheClock: TJvAnalogClock;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    BnOk: TButton;
    BnCancel: TButton;
    BnClear: TButton;
    BnAp: TSpeedButton;
    procedure TheClockMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BnApClick(Sender: TObject);
  private
    FonPickerExit: TDateTimePickerExit;
    procedure SetShowClock(const Value: boolean);
  protected
    AppDeactivate : TNotifyEvent;
    procedure HandleEnterKey(Sender : Tobject);
    procedure HandleCancel(Sender : TObject);
    procedure HandleClear(Sender : TObject);
    procedure handleAppDeactivate(Sender : TObject);

    constructor CreateToGet(AOwner : TComponent; const t : TDatetime;
      const c: TControl; Feedback : TDateTimePickerExit; const ToShowClock : boolean = true); overload ;

    property OnPickerExit : TDateTimePickerExit read FonPickerExit write FOnPickerExit;

    procedure ShowToGet(const t : TDateTime); overload;

    procedure ShowToGet(const t : TDateTime; const c : TControl); overload;

  public

    constructor CreateToGet(const t : TDatetime;
      const c: TControl; Feedback : TDateTimePickerExit; const ToShowClock : boolean = true); overload;
    {{ Show the modal window with datetime set to "t", return Datetime back
      if pressing OK button, or zero if cancel.
    }
//    function GetDate(const t : TDateTime) : TDateTime; override;


    property ShowClock : boolean write SetShowClock;

  end;

implementation
uses
  Math;
type
  TimeArea = (aZero, aThree, aSix, aNine, aZeroThree, aThreeSix, aSixNine, aNineZero);

{$R *.dfm}
function FindClassFormInApp(c : TFormClass) : TForm;
var
  i : integer;
begin
  Result := nil;

  for i :=0 to Application.ComponentCount -1 do
    if (Application.Components[i].ClassType = c ) then
    begin
      Result := TForm(Application.Components[i]);
      break;
    end;

end;

{ TFmDatetime }

procedure TFmDatetime.HandleCancel(Sender: TObject);
begin
  Close;
end;

procedure TFmDatetime.HandleEnterKey(Sender: Tobject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  Int(MonthCalendar1.Date) + TheClock.TimeSet) ;

  Close;
end;

procedure TFmDatetime.ShowToGet(const t : TDateTime);
begin
  MonthCalendar1.Date := t;
  TheClock.TimeSet := Frac(t);
//  TimePicker.Time :=  TheClock.TimeSet;

    if  TheClock.TimeSet > 0.5 then
      BnAp.Caption := 'P'
    else
      BnAp.Caption := 'A';

  BnOk.OnClick := HandleEnterKey;
  BnCancel.OnClick := handleCancel;
  BnClear.OnClick := HandleClear;
  
  FormStyle := fsStayOnTop;
  BorderStyle := bsNone;
  Show;
end;

procedure TFmDatetime.TheClockMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CX, CY : integer;
  LX, LY : integer;
  g : Extended;
  ta : TimeArea;
  t, m : TDateTime;
  apm : TDateTime;
begin
  CX := TheClock.Width div 2;
  CY := TheClock.Height div 2;

  Lx := X-CX;
  Ly := CY - Y;


  if (Lx=0) and (Ly>0) then
    ta := aZero
  else if (Lx>0) and (Ly>0) then
    ta := aZeroThree
  else if (Lx>0) and (Ly=0) then
    ta := aThree
  else if (Lx>0) and (Ly<0) then
    ta := aThreeSix
  else if (Lx=0) and (Ly<0) then
    ta := aSix
  else if (Lx<0) and (Ly<0) then
    ta := aSixNine
  else if (Lx<0) and (Ly=0) then
    ta := aNine
  else if (Lx<0) and (Ly>0) then
    ta := aNineZero;

{  if Button = mbLeft then  // Left click am, right click pm
    apm := 0
  else if Button = mbRight then
    apm := 0.5;

  case ta of
    aZero :
      t := 0;
    aZeroThree :
      t := ArcTan(Lx/Ly) /4/pi + apm;
    aThree :
      t := 0.125 + apm;
    aThreeSix :
      t := 0.25 - abs(ArcTan(Lx/Ly)/4/pi) + apm;
    aSix :
      t := 0.25 + apm;
    aSixNine :
      t := 0.25 + abs(ArcTan(Lx/Ly)/4/pi) + apm;
    aNine :
      t :=  0.375 + apm;
    aNineZero :
      t := 0.5 - abs(ArcTan(Lx/Ly)/4/pi) + apm;
  end;

//  t := round(t / (0.25/360) ) * (0.25/360); minute
  t := round(t / (0.25/72) ) * (0.25/72);  // 5-minute

   }

// ========================================================


  if Button = mbLeft then
  begin
    case ta of
      aZero :
        t := 0;
      aZeroThree :
        t := ArcTan(Lx/Ly) /4/pi ;
      aThree :
        t := 0.125 ;
      aThreeSix :
        t := 0.25 - abs(ArcTan(Lx/Ly)/4/pi);
      aSix :
        t := 0.25 ;
      aSixNine :
        t := 0.25 + abs(ArcTan(Lx/Ly)/4/pi) ;
      aNine :
        t :=  0.375 ;
      aNineZero :
        t := 0.5 - abs(ArcTan(Lx/Ly)/4/pi) ;
    end;

    t := round(t / (0.25/24) ) * (0.25/24)  // 15-minute
  end
  else if Button = mbRight then   // get minutes
  begin
    case ta of
      aZero :
        t := 0;
      aZeroThree :
        t := ArcTan(Lx/Ly) /4/pi /12;
      aThree :
        t := 0.125/12;
      aThreeSix :
        t := (0.25 - abs(ArcTan(Lx/Ly)/4/pi) ) /12 ;
      aSix :
        t := 0.25/12 ;
      aSixNine :
        t := (0.25 + abs(ArcTan(Lx/Ly)/4/pi) ) /12;
      aNine :
        t :=  0.375/12 ;
      aNineZero :
        t := (0.5 - abs(ArcTan(Lx/Ly)/4/pi) ) /12;
    end;

    t := round( t / (0.125/12/15) ) * (0.125/12/15);

    t := trunc( TheClock.TimeSet / (0.25/6) ) * (0.25/6) + t;

    if t > 0.5 then
      t := t - 0.5;
  end;

// ==============================================
{  if  Sqr(Lx)+Sqr(Ly) <= Sqr(TheClock.CenterSize) then
  begin
    TheClock.TimeSet := frac(TheClock.TimeSet);

    if  TheClock.TimeSet > 0.5 then
    begin
      TheClock.TimeSet := TheClock.TimeSet - 0.5;
      BnAp.Caption := 'A';
    end
    else
    begin
      TheClock.TimeSet := TheClock.TimeSet + 0.5;
      BnAp.Caption := 'P';
    end;
  end
  else  }
  begin
    if TheClock.TimeSet > 0.5 then
      TheClock.TimeSet := t + 0.5
    else
      TheClock.TimeSet := t;
  end;

//  TimePicker.Time := TheClock.TimeSet;
  BnAp.Refresh;

end;

procedure TFmDatetime.FormDeactivate(Sender: TObject);
begin
  Close;

end;

procedure TFmDatetime.ShowToGet(const t: TDateTime; const c: TControl);
var
  p : TPoint;
begin
  p := c.ClientToScreen( Point(0, 0)  ) ;
  Left := p.x ;
  Top := p.y + c.Height;

  if Left+Width > Screen.Width then
    Left := Screen.Width - Width;

  if Top + Height > Screen.Height then
    Top := Top - c.Height - Height;


  ShowToGet(t);
end;

constructor TFmDatetime.CreateToGet(AOwner: TComponent; const t: TDatetime;  const c: TControl;
  Feedback: TDateTimePickerExit; const ToShowClock : boolean);
begin
  if FindClassFormInApp( TFmDateTime) <> nil then
    exit;

  Create(Aowner);
  OnPickerExit := Feedback;
  ShowClock := ToShowClock;

  AppDeactivate := Application.OnDeactivate;

  Application.OnDeactivate := HandleAppDeactivate;

  ShowToGet(t, c);
end;

procedure TFmDatetime.SetShowClock(const Value: boolean);
begin
  Panel1.Visible := Value;
end;

procedure TFmDatetime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnDeactivate:= AppDeactivate ;

  Action := caFree;
end;

procedure TFmDatetime.HandleClear(Sender: TObject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  0) ;

  Close;

end;

procedure TFmDatetime.handleAppDeactivate(Sender: TObject);
begin
  if Assigned(AppDeactivate) then
    AppDeactivate(Sender);

  self.close;
end;

constructor TFmDatetime.CreateToGet(const t: TDatetime; const c: TControl;
  Feedback: TDateTimePickerExit; const ToShowClock: boolean);
begin
  CreateToGet(Application, t, c, Feedback, ToShowClock);
end;

procedure TFmDatetime.BnApClick(Sender: TObject);
begin
    if  TheClock.TimeSet > 0.5 then
    begin
      TheClock.TimeSet := TheClock.TimeSet - 0.5;
      BnAp.Caption := 'A';
    end
    else
    begin
      TheClock.TimeSet := TheClock.TimeSet + 0.5;
      BnAp.Caption := 'P';
    end;

end;

end.
