{{
  Purpose:
    Provide a popup window for user to select a time. The visual effect
    is similar to the effect of the popup of Windows datetime picker. The popup
    show an analog clock. The user may use the left button and the right button
    to change hour and minute.

    This popup can be hooked to any Windows control which will provide the popup.
}
unit FormClockTime;
interface

uses
  Windows, Messages, SysUtils, {$ifdef ver150}Variants,{$endif} Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ComCtrls, ExtCtrls, JvComponent,
  JvAnalogClock, Buttons, JvSpeedButton, JvExExtCtrls, JvExtComponent;

type
  TTimePickerExit = procedure (Sender : TObject; const t : TDateTime) of Object;

  TFmClockTime = class(TForm)
    Panel2: TPanel;
    BnOk: TButton;
    BnCancel: TButton;
    BnClear: TButton;
    TheClock: TJvAnalogClock;
    BnAp: TSpeedButton;
    procedure TheClockMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BnApClick(Sender: TObject);
  private
    FonPickerExit: TTimePickerExit;
  protected
    AppDeactivate : TNotifyEvent;
    procedure HandleEnterKey(Sender : Tobject);
    procedure HandleCancel(Sender : TObject);
    procedure HandleClear(Sender : TObject);
    procedure handleAppDeactivate(Sender : TObject);

    constructor CreateToGet(AOwner : TComponent; const t : TDateTime;
      const c: TControl; Feedback : TTimePickerExit); overload ;
  public

    constructor CreateToGet(const t : TDateTime;
      const c: TControl; Feedback : TTimePickerExit); overload;
    {{ Show the modal window with datetime set to "t", return Datetime back
      if pressing OK button, or zero if cancel.
    }

    procedure ShowToGet(const t : TDateTime); overload;
    procedure ShowToGet(const t : TDateTime; const c : TControl); overload;

    property OnPickerExit : TTimePickerExit read FonPickerExit write FOnPickerExit;

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

procedure TFmClockTime.HandleCancel(Sender: TObject);
begin
  Close;
end;

procedure TFmClockTime.HandleEnterKey(Sender: Tobject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  TheClock.TimeSet) ;

  Close;
end;

procedure TFmClockTime.ShowToGet(const t : TDateTime);
begin
  TheClock.TimeSet := Frac(t);

  
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

procedure TFmClockTime.TheClockMouseDown(Sender: TObject;
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

  begin
    if TheClock.TimeSet > 0.5 then
      TheClock.TimeSet := t + 0.5
    else
      TheClock.TimeSet := t;
  end;

  BnAp.Refresh;

end;

procedure TFmClockTime.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TFmClockTime.ShowToGet(const t: TDateTime; const c: TControl);
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

constructor TFmClockTime.CreateToGet(AOwner: TComponent; const t: TDateTime;  const c: TControl;
  Feedback: TTimePickerExit);
begin
  if FindClassFormInApp( TFmClockTime) <> nil then
    exit;

  Create(Aowner);
  OnPickerExit := Feedback;

  AppDeactivate := Application.OnDeactivate;

  Application.OnDeactivate := HandleAppDeactivate;

  ShowToGet(t, c);
end;

procedure TFmClockTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnDeactivate:= AppDeactivate ;

  Action := caFree;
end;

procedure TFmClockTime.HandleClear(Sender: TObject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  0) ;

  Close;

end;

procedure TFmClockTime.handleAppDeactivate(Sender: TObject);
begin
  if Assigned(AppDeactivate) then
    AppDeactivate(Sender);

  self.close;
end;

constructor TFmClockTime.CreateToGet(const t: TDateTime; const c: TControl;
  Feedback: TTimePickerExit);
begin
  CreateToGet(Application, t, c, Feedback);
end;

procedure TFmClockTime.BnApClick(Sender: TObject);
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
