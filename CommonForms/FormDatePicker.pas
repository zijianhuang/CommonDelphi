{{
  Purpose:
    Provide a popup window for user to select date and time. Very fancy.
}
unit FormDatePicker;

interface

uses
  Windows, Messages, SysUtils, {$ifdef ver150}Variants,{$endif} Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ComCtrls, ExtCtrls, CommCtrl;

type
  TDateTimePickerExit = procedure (Sender : TObject; const t : TDateTime) of Object;

  //This class will fine tune TMonthCalendar by responding more Windows messages
  TExMonthCalendar = class(TMonthCalendar)
  private
    FOnDateSelected: TNotifyEvent;
    procedure SetOnDateSelected(const Value: TNotifyEvent);
  protected
    //: Respond to some Windows messages
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  public
    //: Handle event when user select a date
    property OnDateSelected : TNotifyEvent read FOnDateSelected write SetOnDateSelected;
  end;

  //This form will simulate the behaviours of the popup date picker of Windows DateTime Picker
  TFmDatePicker = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FonPickerExit: TDateTimePickerExit;
    FTellClientIAmClose: TNotifyEvent;
    procedure SetTellClientIAmClose(const Value: TNotifyEvent);
  protected
    okmonth : boolean;
    Calendar : TExMonthCalendar;
    TheControl : TWinControl;
    AppDeactivate : TNotifyEvent;
    FormChange  : TNotifyEvent;

    procedure HandleEnterKey(Sender : Tobject);
    procedure handleAppDeactivate(Sender : TObject);
    procedure handleScreenChangeForm(Sender : TObject);

    constructor CreateToGet(AOwner : TComponent; const t : TDatetime;
      const c: TWinControl; Feedback : TDateTimePickerExit); overload ;

    property OnPickerExit : TDateTimePickerExit read FonPickerExit write FOnPickerExit;

    procedure ShowToGet(const t : TDateTime); overload;

    procedure ShowToGet(const t : TDateTime; const c : TWinControl); overload;

    procedure HandleDateSelected(Sender : TObject);

  public

    constructor CreateToGet(const t : TDatetime;
      const c: TWinControl; Feedback : TDateTimePickerExit); overload;
    {{ Show the non-modal window with datetime set to "t", return Datetime back
      if pressing OK button, or zero if cancel.
    }

    //: Notify client to do something when the form is close.
   property TellClientIAmClose : TNotifyEvent read FTellClientIAmClose write SetTellClientIAmClose;
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


procedure TFmDatePicker.HandleEnterKey(Sender: Tobject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  Int(Calendar.Date) ) ;

  Close;
end;

procedure TFmDatePicker.ShowToGet(const t : TDateTime);
begin

  Calendar.Date := t;

  FormStyle := fsStayOnTop;
  BorderStyle := bsNone;

  Application.ProcessMessages;

    okmonth := false;
  ShowWindow(Handle, SW_SHOWNA);
  ShowWindow(Calendar.Handle, SW_SHOW);
//  Visible := true;
  ClientHeight := Calendar.Height;
  ClientWidth := Calendar.Width;
end;


procedure TFmDatePicker.FormDeactivate(Sender: TObject);
begin
    Close;
end;

procedure TFmDatePicker.ShowToGet(const t: TDateTime; const c: TWinControl);
var
  p : TPoint;
begin
  p := c.ClientToScreen( Point(0, 0)  ) ;
  Left := p.x ;
  Top := p.y + c.Height;

  if Left+Width > Screen.DesktopWidth then
    Left := Screen.DesktopWidth - Width;

  if Top + Height > Screen.DesktopHeight then
    Top := Top - c.Height - Height;


  ShowToGet(t);
end;

constructor TFmDatePicker.CreateToGet(AOwner: TComponent; const t: TDatetime;  const c: TWinControl;
  Feedback: TDateTimePickerExit);
var
  tt : TDate;
begin
  tt := t;
  if tt = 0 then
    tt := Date;
  Application.ProcessMessages;  // if there is another picker shown, make sure it is closed
  if FindClassFormInApp( TFmDatePicker) <> nil then
    exit;

  Create(Aowner);
  OnPickerExit := Feedback;

  AppDeactivate := Application.OnDeactivate;

  FormChange := Screen.OnActiveFormChange;

  Application.OnDeactivate := HandleAppDeactivate;

  Screen.OnActiveFormChange := HandleScreenChangeForm;
  
  TheControl := c;

  ShowToGet(tt, c);
end;


procedure TFmDatePicker.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(TellClientIamClose) then
    TellClientIamClose(self);

  Action := caFree;
end;


procedure TFmDatePicker.handleAppDeactivate(Sender: TObject);
begin
  if Assigned(AppDeactivate) then
    AppDeactivate(self);

  close;
end;

constructor TFmDatePicker.CreateToGet(const t: TDatetime; const c: TWinControl;
  Feedback: TDateTimePickerExit);
begin
  CreateToGet(Application, t, c, Feedback);
end;

procedure TFmDatePicker.SetTellClientIAmClose(const Value: TNotifyEvent);
begin
  FTellClientIAmClose := Value;
end;

procedure TFmDatePicker.handleScreenChangeForm(Sender: TObject);
begin
  if Assigned(FormChange) then
    FormChange(self);

  if not self.Active then
    Close;
end;

procedure TFmDatePicker.FormCreate(Sender: TObject);
begin
  Calendar := TExMonthCalendar.Create(self);
  Calendar.Parent := self;
  Calendar.AutoSize := true;

  Calendar.OnDateSelected := HandleDateSelected;
//  Color := Calendar.CalColors.BackColor;
end;

{ TExMonthCalendar }

function IsBlankSysTime(const ST: TSystemTime): Boolean;
type
  TFast = array [0..3] of DWORD;
begin
  Result := (TFast(ST)[0] or TFast(ST)[1] or TFast(ST)[2] or TFast(ST)[3]) = 0;
end;

procedure TExMonthCalendar.CNNotify(var Message: TWMNotify);
var
  ST: PSystemTime;
  I, MonthNo: Integer;
  CurState: PMonthDayState;
begin
  with Message, NMHdr^ do
  begin
    case code of
      MCN_GETDAYSTATE:
        with PNmDayState(NMHdr)^ do
        begin
          FillChar(prgDayState^, cDayState * SizeOf(TMonthDayState), 0);
          if Assigned(OnGetMonthInfo) then
          begin
            CurState := prgDayState;
            for I := 0 to cDayState - 1 do
            begin
              MonthNo := stStart.wMonth + I;
              if MonthNo > 12 then MonthNo := MonthNo - 12;
              OnGetMonthInfo(Self, MonthNo, CurState^);
              Inc(CurState);
            end;
          end;
        end;
      MCN_SELCHANGE:
        begin
          ST := @PNMSelChange(NMHdr).stSelStart;
          if not IsBlankSysTime(ST^) then
            DateTime := SystemTimeToDateTime(ST^);
          if MultiSelect then
          begin
            ST := @PNMSelChange(NMHdr).stSelEnd;
            if not IsBlankSysTime(ST^) then
              EndDate := SystemTimeToDateTime(ST^);
          end;

        end;
      MCN_SELECT:

        begin
          if  Assigned(OnDateSelected) then
          begin
            OnDateSelected(self);
          end  ;

        end;
    end;
  end;
  inherited;
end;

procedure TExMonthCalendar.SetOnDateSelected(const Value: TNotifyEvent);
begin
  FOnDateSelected := Value;
end;

procedure TFmDatePicker.HandleDateSelected(Sender: TObject);
begin
  if Assigned(OnPickerExit) then
    OnPickerExit(self,  Int(Calendar.Date) ) ;

    Close;
end;

procedure TFmDatePicker.FormDestroy(Sender: TObject);
begin
  Application.OnDeactivate:= AppDeactivate ;

  Screen.OnActiveFormChange := FormChange;

end;

end.
