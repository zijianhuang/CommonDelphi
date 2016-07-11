{{
  This unit is to define an agent can turn an normal editbox into a true datetime edit.
  The agent will support International, European and US date format, 24/APM format.
  The behaviors will be closed to Microsoft's date edit and time edit as much as possible.

  Features
  1. Left and right key will walk segments of datetime, skipping separators.
  2. Up and down key will increase or decrease the value of current segment.
  3. Home and End key will maximize and minimize the value of current segment.
  4. Only valid day could be keyin.
  5. Changing month value and year value might chage the day as well since not all months has 29,30 or 31 days.
  6. Smart keyin date values
  7. Switching International, European and US date formats dynamically.
  8. Switching 24/APM time formats dynamically.
  9. Leaving the edit box will result in fomormalizing the datetime string.

  There are some other details regarding to user's interaction with the edit box.

  Some features of Microsoft date editbox and time edit box will not be implemented,
  for example, format string, long date formats, seconds etc.

  Programming tips:
  
}
unit IntfDateTimeEditAgent;

interface

uses
  SysUtils, Classes, StdCtrls, Controls, DbCtrls, Contnrs, Windows;

type
  //: Interface between TTimeMark and the agent object.
  TMasterTimeIntf = interface
    function GetDateTime : TDateTime;
    procedure AdjustDaysForMonthYear;
    function GetMaxDays : integer;
    procedure RefreshAPM;
  end;

  //: Basic class for datetime sgments and separators
  TTimeMark = class(TObject)
  private
//    FHighPosition: integer;
    FLowPosition: integer;
    FLen : integer;
    function GetHighPosition: integer;
    procedure SetLen(const Value: integer);
  public
    procedure SetPosition(const LowPos : integer);

    function Value : string ; virtual; abstract;

    function Process(const c : char; const SelText : string) : string; virtual; abstract;
    property HighPosition : integer read GetHighPosition;
    property LowPosition   : integer read FLowPosition;
    property Len : integer read FLen write SetLen;

  end;

  //: Basic class for datetime segments classes
  TTimeSegment = class(TTimeMark)
  private
    function ReadIntValue: integer;
    procedure SetIntValue(const Value: integer);
  protected
    MasterTime  : TMasterTimeIntf;
//    DigitPos : 1..4;
    FIntValue : integer;
  public
    constructor Create(const mi : TmasterTimeIntf);
    function RespondToHome : string; virtual; abstract;
    function RespondToEnd : string; virtual; abstract;
    function RespondToDown : string; virtual; abstract;
    function RespondToUp : string; virtual; abstract;

    property IntValue : integer read ReadIntValue write SetIntValue;
  end;


  //:  Class for datetime separators
  TTimeSep = class(TTimeMark)
  private
    FSep: Char;
  public
    constructor Create(const c : char); overload;
    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    property Sep : Char read FSep write FSep;
  end;

  TDaySegment = class(TTimeSegment)
  protected
//    Str : string[2];
  public
    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;

  end;

  TMonthSegment = class(TTimeSegment)
  protected
//    Str : string[3];
  public
    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;
  end;

  TYearSegment = class(TTimeSegment)
  protected
//    Str : string[4];
  public
    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;
  end;

  TAPSegment = class; // need to couple the hour and APM

  THourSegment = class(TTimeSegment)
  private
    FApm: TApSegment;
    procedure SetApm(const Value: TApSegment);
  protected
//    Str : string[2];
    function HourHigh : integer;
    function HourLow : integer;
  public
    function Value : string ; override;
    function APValue : string;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;

    property APM : TApSegment read FApm write SetApm;
  end;

  TAPSegment = class(TTimeSegment)
  private
//    FAm: boolean;
    procedure SetAm(const Value: boolean);
    function GetAm: boolean;
  protected
    HourSegment : THourSegment;
    property am : boolean read GetAm write SetAm;
  public
    Destructor destroy; override;

    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;
  end;

  TMinuteSegment = class(TTimeSegment)
  protected
//    Str : string[2];
  public
    function Value : string ; override;
    function Process(const c : char; const SelText : string) : string; override;
    function RespondToHome : string; override;
    function RespondToEnd : string; override;
    function RespondToDown : string; override;
    function RespondToUp : string; override;
  end;

  TDateTimeEditAgent = class(TComponent, TMasterTimeIntf)
  private
    FTwentyFour: boolean;
    FModified: boolean;
    FNotifyEvent: TNotifyEvent;
    procedure SetTwentyFour(const Value: boolean);
    procedure SetModified(const Value: boolean);
  protected
    DateTimeEnabled : boolean;
    
    DMSep,
    MYSep,
    DTSep,
    HMSep       : TTimeSep;


    DaySegment : TDaySegment;
    MonthSegment : TMonthSegment;
    YearSegment : TYearSegment;
    HourSegment : THourSegment;
    MinuteSegment : TMinuteSegment;
//    ApSegment : TApSegment;

    Ed  : TEdit;
    OldOnKeyDown : TKeyEvent;
    OldOnKeyPress : TKeyPressEvent;
    OldOnClick : TNotifyEvent;
    OldOnExit : TNotifyEvent;
    OldOnEnter : TNotifyEvent;

    CurrentIndex : integer;

    TheList : TObjectList;

    MonthYear : boolean;

    procedure HandleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HandleKeyPress(Sender: TObject; var Key: Char);
    procedure HandleClick(Sender : TObject);
    procedure HandleDblClick(Sender : TObject);
    procedure HandleExit(Sender : TObject);
    procedure HandleEnter(Sender : TObject);
    procedure SelectSegment;

    //: Return the index of current mark
    function GetCurrentMark(const p : integer) : integer;

    procedure AdjustDaysForMonthYear;  // interface implementation;

    function GetMaxDays : integer;

    property Modified : boolean read FModified write SetModified;

    procedure RefreshApm;        // interface implementation

    procedure Reformat;
  public
    constructor Create(Aowner : TComponent; AEd : TEdit; const ForDatetime : boolean = true;
                const MY : boolean = false); overload;  virtual;
    destructor Destroy; override;

    function GetDateTimeStr : string;
    function GetDateTime : TDateTime;

    function GetDate : TDate;
    function GetTime : TTime;

    procedure SetDateTime(const t : TDateTime);

    procedure RefreshEdit;  virtual;
    //0, international, 1, English, 2, US ,
    procedure ChangeFormat(const i : integer; const ToRefresh : boolean = true);

    property TwentyFour : boolean read FTwentyFour write SetTwentyFour;
    //: How month/Year, mostly used for credit card expiry date
    property OnModified : TNotifyEvent read FNotifyEvent write FNotifyEvent;
  end;


{  TDateTimeEditAgent = class(TComponent)
  private
  protected
    Ed  : TDbEdit;
    OldOnKeyDown : TKeyEvent;
    OldOnKeyPress : TKeyPressEvent;

    procedure HandleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HandleKeyPress(Sender: TObject; var Key: Char);
  public
    constructor Create(Aowner : TComponent; AEd : TDbEdit); overload;
    destructor Destroy; override;


  end; }

implementation
uses
  JclStrings, JclDatetime ;

function StrToIntSafe(const s : string) : integer;
begin
  if trim(s) = '' then
    Result := 0
  else
    Result := StrToInt(s);
end;

{constructor TDateTimeEditAgent.Create(Aowner: TComponent; AEd: TDbEdit);
begin
  inherited Create(AOwner);
  Ed := AEd;
  Ed.ReadOnly := true;
//  OldOnKeyDown := AEd.OnKeyDown;
  OldOnKeyPress := AEd.OnKeyPress;
//  Ed.OnKeyDown := HandleKeydown;
  Ed.OnKeyPress := HandleKeypress;
end;

destructor TDateTimeEditAgent.Destroy;
begin
//  Ed.OnKeyDown := OldOnKeyDown;
  inherited;
end;

procedure TDateTimeEditAgent.HandleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure TDateTimeEditAgent.HandleKeyPress(Sender: TObject; var Key: Char);
var
  SelStart : integer;
  num : integer;
  t : string;

  function DateValid(const s : string) : boolean;
  begin
    Result := false;

    try
      StrToDateTime(s);
      Result := true;
    except

    end;

  end;
begin
  Ed.DataSource.DataSet.Edit;

  SelStart := Ed.SelStart ;

  if SelStart = 0 then    // day 1
  begin
    if not CharIsNumber(Key) then
      exit;

    if Key='3' then
    begin
      Ed.SelStart := 1;
      Ed.SelLength := 1;
      Ed.SelText := ' ';
      Ed.SelStart := 0;
      Ed.SelLength := 0;
    end;
    num := StrToInt(trim(Key + Copy(Ed.Text, 2, 1))  );
    if (num>0) and (num<32) then
    begin
      Ed.SelLength := 1;
      t := Ed.SelText;
      Ed.SelText := Key;

      if not DateValid(Ed.Text) then
      begin
        Ed.SelStart := Ed.SelStart -1;
        Ed.SelLength := 1;
        Ed.SelText := t;
      end;
    end;


  end
  else if SelStart = 1 then    // day 2
  begin
    if not CharIsNumber(Key) then
      exit;

    num := StrToInt(trim(Copy(Ed.Text, 1, 1) + Key) );
    if (num>0) and (num<32) then
    begin
      Ed.SelLength := 1;
      t := Ed.SelText;
      Ed.SelText := Key;

      if not DateValid(Ed.Text) then
      begin
        Ed.SelStart := Ed.SelStart -1;
        Ed.SelLength := 1;
        Ed.SelText := t;
      end;
    end;

  end
  else   if SelStart = 2 then  // /
  begin
    if Key in [ '/', ' '] then
    begin
      Ed.SelLength := 1;
      Ed.SelText := '/';
    end;
  end
  else   if SelStart = 3 then  // month 1
  begin
    if not CharIsNumber(Key) then
      exit;

    if Key='1' then
    begin
      Ed.SelStart := 4;
      Ed.SelLength := 1;
      Ed.SelText := ' ';
      Ed.SelStart := 3;
      Ed.SelLength := 1;
    end;
    num := StrToInt(trim(Key + Copy(Ed.Text, 5, 1))  );
    if (num>0) and (num<13) then
    begin
      Ed.SelLength := 1;
      t := Ed.SelText;
      Ed.SelText := Key;

      if not DateValid(Ed.Text) then
      begin
        Ed.SelStart := Ed.SelStart -1;
        Ed.SelLength := 1;
        Ed.SelText := t;
      end;
    end;

  end
  else   if SelStart = 4 then   // month 2
  begin
    if not CharIsNumber(Key) then
      exit;

    num := StrToInt(trim(Copy(Ed.Text, 4, 1) + Key) );
    if (num>0) and (num<13) then
    begin
      Ed.SelLength := 1;
      t := Ed.SelText;
      Ed.SelText := Key;

      if not DateValid(Ed.Text) then
      begin
        Ed.SelStart := Ed.SelStart -1;
        Ed.SelLength := 1;
        Ed.SelText := t;
      end;
    end;

  end
  else   if SelStart = 5 then  // /
  begin
    if Key in [ '/', ' '] then
    begin
      Ed.SelLength := 1;
      Ed.SelText := '/';
    end;
  end
  else  if SelStart in [6, 7, 8, 9] then  // year
  begin
    if not CharIsNumber(Key) then
      exit;

      Ed.SelLength := 1;
      Ed.SelText := Key;

  end
  else   if SelStart in [10] then // space
  begin
    if Key = ' ' then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart = 11 then  // h 1
  begin
    if not CharIsNumber(Key) then
      exit;

    if Key='1' then
    begin
      Ed.SelStart := 12;
      Ed.SelLength := 1;
      Ed.SelText := ' ';
      Ed.SelStart := 11;
      Ed.SelLength := 1;
    end;
    num := StrToInt(trim(Key + Copy(Ed.Text, 13, 1))  );
    if (num>0) and (num<13) then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart = 12 then   // h2
  begin
    if not CharIsNumber(Key) then
      exit;

    num := StrToInt(trim(Copy(Ed.Text, 12, 1) + Key) );
    if (num>0) and (num<13) then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart in [13] then // :
  begin
    if Key in [ ':', ' '] then
    begin
      Ed.SelLength := 1;
      Ed.SelText := ':';
    end;

  end
  else   if SelStart = 14 then  // m 1
  begin
    if not CharIsNumber(Key) then
      exit;

    if Key='5' then
    begin
      Ed.SelStart := 15;
      Ed.SelLength := 1;
      Ed.SelText := ' ';
      Ed.SelStart := 14;
      Ed.SelLength := 1;
    end;
    num := StrToInt(trim(Key + Copy(Ed.Text, 16, 1))  );
    if (num>0) and (num<61) then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart = 15 then   // m2
  begin
    if not CharIsNumber(Key) then
      exit;

    num := StrToInt(trim(Copy(Ed.Text, 15, 1) + Key) );
    if (num>0) and (num<61) then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart = 16 then // space
  begin
    if Key = ' ' then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end
  else   if SelStart = 17 then //
  begin
    if Key in [ 'a', 'A', 'p', 'P'] then
    begin
      Ed.SelLength := 1;
      Ed.SelText := Key;
    end;

  end



end;}

{ TTimeMark }



function TTimeMark.GetHighPosition: integer;
begin
  Result := FLowPosition + Len -1;
end;

procedure TTimeMark.SetLen(const Value: integer);
begin
  FLen := Value;
end;

procedure TTimeMark.SetPosition(const LowPos : integer);
begin
//  FHighPosition := HighPos;
  FLowPosition := LowPos;
end;

{ TTimeSep }

constructor TTimeSep.Create(const c: char);
begin
  inherited Create;
  fSep := c;
end;

function TTimeSep.Process(const c: char; const SelText : string): string;
begin

end;


function TTimeSep.Value: string;
begin
  Result := Sep;
end;

{ TDaySegment }

function TDaySegment.Process(const c: char;
  const SelText : string): string;
var
  Len : integer;
  i : integer;
  s : string;
begin
  i := FIntValue;
  Len := Length( SelText);
  if Len=1 then
  begin
    s := IntToStr(i) + c;
    if (StrToIntSafe(s)<1) or (StrToIntSafe(s)>DaysInMonth( MasterTime.GetDateTime)) then
      s := c;
  end
  else
  begin
    s := c;
  end;

  Result := s;


  if (StrToIntSafe(s)>=1) and (StrToIntSafe(s)<=DaysInMonth( MasterTime.GetDateTime)) then
//    Str := Format('%2.2d', [StrToInt(s)]);
    FIntValue :=  StrToIntSafe(s)  ;

  MasterTime.AdjustDaysForMonthYear;

end;

function TDaySegment.RespondToEnd: string;
begin
  FIntValue := MasterTime.GetMaxDays;
  Result := IntToStr(FIntValue);
end;

function TDaySegment.RespondToHome: string;
begin
  Result := '01';
  FIntValue := 1;
end;

function TDaySegment.RespondToDown: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i - 1;
  if i < 1 then
    i := DaysInMonth( MasterTime.GetDateTime);

  FIntValue := i;

  Result := Format('%2.2d', [FintValue]);
end;

function TDaySegment.RespondToUp: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i+1;
  if i > DaysInMonth( MasterTime.GetDateTime) then
    i:= 1;

  FIntValue := i;
  
  Result := Format('%2.2d', [FIntValue]);
end;

function TDaySegment.Value: string;
begin
  Result := Format('%2.2d', [FIntValue]);
//  if MasterTime.GetDateTime = 0 then
//    Result := '  ';
end;

{ TMonthSegment }

function TMonthSegment.Process(const c: char;
  const SelText : string): string;
var
  Len : integer;
  i : integer;
  s : string;
begin
  i := FIntValue;
  Len := Length( SelText);
  if Len=1 then
  begin
    s := IntToStr(i) + c;
    if (StrToIntSafe(s)<1) or (StrToIntSafe(s)>12) then
      s := c;
  end
  else
  begin
    s := c;
  end;

  Result := s;

  if (StrToIntSafe(s)>=1) and (StrToIntSafe(s)<=12) then
//    Str := Format('%2.2d', [StrToIntSafe(s)]);
    FIntValue :=  StrToIntSafe(s) ;

  MasterTime.AdjustDaysForMonthYear;
end;

function TMonthSegment.RespondToEnd: string;
begin
  FIntValue := 12;
  Result := '12';

  MasterTime.AdjustDaysForMonthYear;
end;

function TMonthSegment.RespondToHome: string;
begin
  Result := '01';
  FIntValue := 1;
  
  MasterTime.AdjustDaysForMonthYear;
end;

function TMonthSegment.RespondToDown: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i-1;
  if i< 1 then
    i:=12;

  FIntValue := i;
  Result := Format('%2.2d', [i]);

  MasterTime.AdjustDaysForMonthYear;
end;

function TMonthSegment.RespondToUp: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i+1;
  if i>12 then
    i:=1;

  FIntValue := i;
  Result := Format('%2.2d', [i]);

  MasterTime.AdjustDaysForMonthYear;
end;

function TMonthSegment.Value: string;
begin
  Result := Format('%2.2d', [FIntValue]);
//  if MasterTime.GetDateTime = 0 then
//    Result := '  ';
end;

{ TYearSegment }

function TYearSegment.Process(const c: char;
  const SelText : string): string;
var
  Len : integer;
  i : integer;
  s : string;
begin
  i := StrToIntSafe(SelText);
  Len := Length( SelText);
  if Len<4 then
  begin
    s := IntToStr(i) + c;
//    if (StrToIntSafe(s)<1752) or (StrToIntSafe(s)>9999) then
//      s := c;
  end
  else
  begin
    s := c;
  end;

  Result := s;

//  if (StrToIntSafe(s)>=1752) and (StrToIntSafe(s)<=9999) then
//    Str := Format('%4.4d', [StrToIntSafe(s)]) ;
//    FIntValue := StrToIntSafe(s)
//  else
    FIntValue := StrToIntSafe(s) ;



  MasterTime.AdjustDaysForMonthYear;

end;

function TYearSegment.RespondToEnd: string;
begin
  FIntValue := 9999 ;
  Result := '9999';

  MasterTime.AdjustDaysForMonthYear;

end;

function TYearSegment.RespondToHome: string;
begin
  Result := '1752';
  FIntValue := 1752;
  MasterTime.AdjustDaysForMonthYear;

end;

function TYearSegment.RespondToDown: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i-1;
  if i< 1752 then
    i:=1752;

  FIntValue := i;
  Result := Format('%4.4d', [i]);

  MasterTime.AdjustDaysForMonthYear;

end;

function TYearSegment.RespondToUp: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i+1;
  if i>9999 then
    i:=9999;

  FIntValue := i;
  Result := Format('%4.4d', [i]);

  MasterTime.AdjustDaysForMonthYear;

end;

function TYearSegment.Value: string;
begin
  Result := Format('%4.4d', [FIntValue]);

//  if MasterTime.GetDateTime = 0 then
//    Result := '  '    ;
end;

{ THourSegment }

function THourSegment.Process(const c: char;
  const SelText : string): string;
var
  Len : integer;
  i : integer;
  s : string;
begin
  i := FintValue;
  Len := Length( SelText);

  if FApm = nil then
  begin
    if Len=1 then
    begin
      s := IntToStr(i) + c;
      if (StrToIntSafe(s)<0) or (StrToIntSafe(s)>HourHigh) then
        s := c;
    end
    else
    begin
      s := c;
    end;

    Result := s;

  //  if (StrToIntSafe(s)>=HourLow) and (StrToIntSafe(s)<=HourHigh) then
  //    Str := Format('%2.2d', [StrToIntSafe(s)]);
      FIntValue := StrToIntSafe(s);
  end
  else
  begin
    if Len=1 then
    begin
      s := SelText + c;
      if (StrToIntSafe(s)<=0) or (StrToIntSafe(s)>12) then
        s := c;
    end
    else
    begin
      s := c;
    end;

    Result := s;

    if FApm.am then
    begin
      if StrToIntSafe(s) <> 12 then
        FIntValue := StrToIntSafe(s)
      else
        FIntValue := 0;
    end
    else
      FIntValue := (StrToIntSafe(s) + 12) mod 24;
  end;



end;

function THourSegment.RespondToEnd: string;
begin
  FIntValue := HourHigh;
  Result := Value;
end;

function THourSegment.RespondToHome: string;
begin
  FIntValue := HourLow;
  Result := Value;

end;

function THourSegment.RespondToDown: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i-1;
  if i< 0 then
    i:= 23;

  FintValue := i;

  Result := Value;

  if FApm <> nil then
  begin
    if FintValue = 23 then
    begin
      FApm.am := false;
      MasterTime.RefreshAPM;
    end
    else if FIntValue = 11 then
    begin
      FApm.am := true;
      MasterTime.RefreshAPM;
    end;

  end;

end;

function THourSegment.RespondToUp: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i+1;
  if (i>23)  then
    i:=0;

  FIntValue := i;
  Result := Value;

  if FApm <> nil then
  begin
    if FintValue = 0 then
    begin
      FApm.am := true;
      MasterTime.RefreshAPM;
    end
    else if FIntValue = 12 then
    begin
      FApm.am := false;
      MasterTime.RefreshAPM;
    end;

  end;
end;

function THourSegment.Value: string;
begin
  if FApm = nil then
    Result := Format('%2.2d', [FIntValue])
  else
  begin
    Result := Format('%2.2d', [FIntValue mod 12 ]);
    if Result = '00' then
      Result := '12';
  end;
//  if MasterTime.GetDateTime = 0 then
//    Result := '  ';
end;

procedure THourSegment.SetApm(const Value: TApSegment);
begin
  FApm := Value;

  if FApm <> nil then
  begin
    FApm.HourSegment := self;
    FApm.am := FIntValue < 12;
  end;
end;

function THourSegment.APValue: string;
begin
  
end;

function THourSegment.HourHigh: integer;
begin
  if FApm = nil then
    Result := 23
  else
    Result := 11;
end;

function THourSegment.HourLow: integer;
begin
  if FApm = nil then
    Result := 0
  else
    Result := 12;

end;

{ TMinuteSegment }

function TMinuteSegment.Process(const c: char;
  const SelText : string): string;
var
  Len : integer;
  i : integer;
  s : string;
begin
  i := FIntValue;
  Len := Length( SelText);
  if Len=1 then
  begin
    s := IntToStr(i) + c;
    if (StrToIntSafe(s)<0) or (StrToIntSafe(s)>59) then
      s := c;
  end
  else
  begin
    s := c;
  end;

  Result := s;

  if (StrToIntSafe(s)>=0) and (StrToIntSafe(s)<=59) then
//    Str := Format('%2.2d', [StrToIntSafe(s)]);
    FIntValue :=  StrToIntSafe(s) ;

//  MasterTime.AdjustDaysForMonthYear;

end;

function TMinuteSegment.RespondToEnd: string;
begin
  FIntValue := 59;
  Result := '59';

end;

function TMinuteSegment.RespondToHome: string;
begin
  Result := '00';
  FIntValue := 0;

end;

function TMinuteSegment.RespondToDown: string;
var
  i : integer;
begin
  i := FintValue;
  i := i-1;
  if i< 0 then
    i:=59;

  Result := Format('%2.2d', [i]);
  FIntValue := i;

end;

function TMinuteSegment.RespondToUp: string;
var
  i : integer;
begin
  i := FIntValue;
  i := i+1;
  if i>59 then
    i:=0;

  Result := Format('%2.2d', [i]);
  FIntValue := i;

end;

function TMinuteSegment.Value: string;
begin
  Result := Format('%2.2d', [FIntValue]);
//  if MasterTime.GetDateTime = 0 then
//    Result := '  ';
end;

{ TTimeEditAgent }

procedure TDateTimeEditAgent.AdjustDaysForMonthYear;
var
  Lp, SL : integer;
begin
  if DaySegment.Value = '  ' then
    exit;
    
  if StrToIntSafe( DaySegment.Value) > GetMaxDays then
  begin
    Lp := Ed.SelStart;
    Sl := Ed.SelLength;

    DaySegment.RespondToEnd;
    RefreshEdit;

    Ed.SelStart := Lp;
    Ed.SelLength := SL;

  end;
end;

procedure TDateTimeEditAgent.ChangeFormat(const i: integer; const ToRefresh : boolean);
begin
  case i  of
    0:
    begin
      TheList.Move( TheList.IndexOf(YearSegment), 0 );
      TheList.Move( TheList.IndexOf(MySep), 1 );
      TheList.Move( TheList.IndexOf(MonthSegment), 2 );
      TheList.Move( TheList.IndexOf(DmSep), 3 );
      TheList.Move( TheList.IndexOf(DaySegment), 4 );

      DmSep.Sep := '-';
      MySep.Sep := '-';

    end;
    1:
    begin
      TheList.Move( TheList.IndexOf(DaySegment), 0 );
      TheList.Move( TheList.IndexOf(DmSep), 1 );
      TheList.Move( TheList.IndexOf(MonthSegment), 2 );
      TheList.Move( TheList.IndexOf(MySep), 3 );
      TheList.Move( TheList.IndexOf(YearSegment), 4 );

      DmSep.Sep := '/';
      MySep.Sep := '/';

    end;
    2:
    begin
      TheList.Move( TheList.IndexOf(MonthSegment), 0 );
      TheList.Move( TheList.IndexOf(DmSep), 1 );
      TheList.Move( TheList.IndexOf(DaySegment), 2 );
      TheList.Move( TheList.IndexOf(MySep), 3 );
      TheList.Move( TheList.IndexOf(YearSegment), 4 );

      DmSep.Sep := '/';
      MySep.Sep := '/';

    end;

    3 :
    begin
      TheList.Move( TheList.IndexOf(MonthSegment), 0 );
      TheList.Move( TheList.IndexOf(MySep), 1 );
      TheList.Move( TheList.IndexOf(YearSegment), 2 );

      DmSep.Sep := '/';
      MySep.Sep := '/';

    end;


  end;


  Reformat;

  if ToRefresh then
    RefreshEdit;
end;

constructor TDateTimeEditAgent.Create(Aowner: TComponent; AEd: TEdit; const ForDateTime : boolean;
        const MY : boolean);
begin
  inherited Create(AOwner);
  
  FModified := false;
  MonthYear := MY;

  Ed := AEd;
  Ed.ReadOnly := true;
  Ed.AutoSelect := false;
  Ed.Cursor := crArrow;
  OldOnKeyDown := AEd.OnKeyDown;
  OldOnKeyPress := AEd.OnKeyPress;
  OldOnClick := AEd.OnClick;
  OldOnExit := AEd.OnExit;
  OldOnEnter := AEd.OnEnter;

  Ed.OnKeyDown := HandleKeydown;
  Ed.OnKeyPress := HandleKeypress;
  Ed.OnClick := HandleClick;
  Ed.OnDblClick := HandleDblClick;
  Ed.OnExit := HandleExit;
  Ed.OnEnter := HandleEnter;

//  if not MY then
  begin
  DaySegment := TDaySegment.Create(self);
    DMSep := TTimeSep.Create('/');
    DaySegment.Len := 2;
    DmSep.Len := 1;
  end;

  MonthSegment := TMonthSegment.Create(self);
  YearSegment := TyearSegment.Create(self);
  MYSep := TTimeSep.Create('/');

  MonthSegment.Len := 2;
  YearSegment.Len := 4;

  MySep.Len := 1;

  DatetimeEnabled := ForDateTime;

  if ForDateTime then
  begin
    HourSegment := THourSegment.Create(self);
    MinuteSegment := TMinuteSegment.Create(self);

    DTSep := TTimeSep.Create(' ');
    HMSep := TTimeSep.Create(':');
    HourSegment.Len := 2;
    MinuteSegment.Len := 2;
    DtSep.Len := 1;
    HmSep.Len := 1;
  end;


  TheList := TObjectList.Create;

  if not MonthYear then
  begin
  TheList.Add(DaySegment);
    TheList.Add(dmSep);
  end;

  TheList.Add(MonthSegment);
  TheList.Add(MySep);
  TheList.Add(YearSegment);

  if DatetimeEnabled then
  begin
  TheList.Add(DtSep);
  TheList.Add(HourSegment);
  TheList.Add(HmSep);
  TheList.Add(MinuteSegment);
  end;

  CurrentIndex := 0;
//  TheList.Add();

  SetDateTime(Now);

//  if My then
//    ChangeFormat(3);
end;

destructor TDateTimeEditAgent.Destroy;
begin
//  Ed.OnKeyDown := OldOnKeyDown;
  TheList.Free;
  inherited;
end;

function TDateTimeEditAgent.GetCurrentMark(const p: integer): integer;
var
  i : integer;
  l, h : integer;
begin
  Result := 0;
  for i := 0 to TheList.Count -1 do
  begin
    l := (TheList.Items[i] as TTimeMark).LowPosition ;
    h := (TheList.Items[i] as TTimeMark).HighPosition ;
    if (p>= l) and
        (p<= h)  then
    begin
      Result := i;
      break;
    end;
  end;

end;

function TDateTimeEditAgent.GetDate: TDate;
begin
  Result :=  EncodeDate( YearSegment.IntValue ,
                MonthSegment.IntValue,
                DaySegment.IntValue);

end;

function TDateTimeEditAgent.GetDateTime: TDateTime;
begin
//  if YearSegment.IntValue = 1899 then
//    DaySegment.IntValue := 1;
    
  if DatetimeEnabled then
  Result :=  EncodeDate( YearSegment.IntValue ,
                MonthSegment.IntValue,
                DaySegment.IntValue) +
                EncodeTime(HourSegment.IntValue, MinuteSegment.IntValue, 0, 0)
  else
  Result :=  EncodeDate( YearSegment.IntValue ,
                MonthSegment.IntValue,
                DaySegment.IntValue) ;

end;

function TDateTimeEditAgent.GetDateTimeStr: string;
var
  i : integer;
  s : string;
begin
  for i := 0 to TheList.Count - 1 do
    Result := Result + (TheList.Items[i] as TTimeMark).Value;

{  if YearSegment.IntValue = 0 then
  begin
    for i := 0 to TheList.Count - 1 do
    begin
      if (TheList.Items[i] is TTimeSegment) then
        Result := Result + '  '
      else
        Result := Result + (TheList.Items[i] as TTimeMark).Value;

    end;

  end;}

end;

function TDateTimeEditAgent.GetMaxDays: integer;
begin
  Result := DaysInMonth(EncodeDate(YearSegment.IntValue,  MonthSegment.IntValue, 1) );
end;

function TDateTimeEditAgent.GetTime: TTime;
begin
  Result :=  EncodeTime(
                HourSegment.IntValue,
                MinuteSegment.IntValue,
                 0, 0);
end;

procedure TDateTimeEditAgent.HandleClick(Sender: TObject);
begin
  if Assigned(OldOnClick) then
    OldONClick(Sender);

  SelectSegment;
end;

procedure TDateTimeEditAgent.HandleDblClick(Sender: TObject);
begin

end;

procedure TDateTimeEditAgent.HandleEnter(Sender: TObject);
begin
  if Assigned(OldOnEnter) then
    OldOnEnter(Sender);

  SelectSegment;
end;

procedure TDateTimeEditAgent.HandleExit(Sender: TObject);
begin
      Ed.SelStart := (TheList.Items[CurrentIndex ] as TTimemark).LowPosition;
      Ed.SelLength := (TheList.Items[CurrentIndex] as TTimeMark).HighPosition - (TheList.Items[CurrentIndex] as TTimeMark).LowPosition + 1;
      Ed.SelText := (TheList.Items[CurrentIndex ] as TTimemark).Value;

  if Assigned(OldOnExit) then
    OldOnExit(Sender);

end;

procedure TDateTimeEditAgent.HandleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  OkIndex : integer;
  KeyInStr : string;
begin
  if Assigned(OldOnKeyDown) then
    OldOnKeyDown(Sender, key, Shift);
    
  OkIndex := GetCurrentMark(Ed.SelStart);


  case Key of
//    VK_RETURN
//    VK_BACK
//    VK_CANCEL
    VK_LEFT :
      begin
        if (OkIndex - 1) < 0 then
        begin
          OkIndex := TheList.Count - 1;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Key := 0;
        end
        else if (TheList.Items[OkIndex -1] is TTimeSep) then
        begin
          OkIndex := OkIndex -2;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Key := 0;

        end;

      end;

    VK_RIGHT :
      begin
        if (OkIndex + 1) > TheList.Count-1 then // at the end
        begin
          OkIndex := 0;
          Ed.SelStart := 0;
          Ed.SelLength := (TheList.Items[0] as TTimeMark).HighPosition - (TheList.Items[0] as TTimeMark).LowPosition + 1;
          Key := 0;
        end
        else if (TheList.Items[OkIndex +1] is TTimeSep) then
        begin
          OkIndex := OkIndex + 2;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Key := 0;

        end;

      end;

    VK_UP :
      begin
        if (TheList.Items[OkIndex ] is TTimeSegment) then
        begin
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Ed.SelText := (TheList.Items[OkIndex ] as TTimeSegment).RespondToUp;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
        end;
        Key := 0;

        Modified := true;
      end;
    VK_DOWN:
      begin
        if (TheList.Items[OkIndex ] is TTimeSegment) then
        begin
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Ed.SelText := (TheList.Items[OkIndex ] as TTimeSegment).RespondToDown;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
        end;
        Key := 0;

        Modified := true;
      end;
    VK_HOME :
      begin
        if (TheList.Items[OkIndex ] is TTimeSegment) then
        begin
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Ed.SelText := (TheList.Items[OkIndex ] as TTimeSegment).RespondToHome;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
        end;
        Key := 0;

        Modified := true;
      end;
    VK_END :
      begin
        if (TheList.Items[OkIndex ] is TTimeSegment) then
        begin
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
          Ed.SelText := (TheList.Items[OkIndex ] as TTimeSegment).RespondToEnd;
          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
        end;
        Key := 0;

        Modified := true;
      end;
    else
    begin
      if (Key>=48) and (Key<=57) then
      begin
        if (TheList.Items[OkIndex ] is TTimeSegment) then
        begin

          KeyInStr := (TheList.Items[OkIndex ] as TTimeSegment).Process(Chr(Key), Ed.SelText);

          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
          Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;

          Ed.SelText := StrPadleft(keyInStr, Ed.SelLength, ' ');

          Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).HighPosition - Length(KeyInStr)+1;
          Ed.SelLength :=  Length(KeyInStr);
        end;
        Key := 0;
        Modified := true;
      end
      else if (Chr(Key) in ['a', 'A', 'P', 'p']) and (TheList.Items[OkIndex ] is TAPSegment) then
      begin
        KeyInStr := (TheList.Items[OkIndex ] as TTimeSegment).Process(Chr(Key), Ed.SelText);

        Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
        Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;

        Ed.SelText := (TheList.Items[OkIndex ] as TAPSegment).Value;

        Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
        Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
        Key := 0;
        Modified := true;


      end
      else
      begin
        Key := 0;
        exit;
      end;



    end;


  end;

  if OkIndex <> CurrentIndex then
  begin
      Ed.SelStart := (TheList.Items[CurrentIndex ] as TTimemark).LowPosition;
      Ed.SelLength := (TheList.Items[CurrentIndex] as TTimeMark).HighPosition - (TheList.Items[CurrentIndex] as TTimeMark).LowPosition + 1;
      Ed.SelText := (TheList.Items[CurrentIndex ] as TTimemark).Value;
      Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
      Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;
  end;
  CurrentIndex := OKIndex;
end;

procedure TDateTimeEditAgent.HandleKeyPress(Sender: TObject; var Key: Char);
var
  s : string;
begin
  s := 'okok';
end;

procedure TDateTimeEditAgent.Reformat;
var
  i, p : integer;
begin
{  DaySegment.SetPosition(0, 1 );
  DMSep.SetPosition(2,2);
  MonthSegment.SetPosition(3,4);
  MySep.SetPosition(5,5);
  YearSegment.SetPosition(6,9);
  DtSep.SetPosition(10, 10);
  HourSegment.SetPosition(11, 12);
  HmSep.SetPosition(13, 13);
  MinuteSegment.SetPosition(14, 15);}

  p := 0;
  for i := 0 to TheList.Count -1 do
  begin
    (TheList.Items[i] as TTimeMark).SetPosition(p );
    p := p +  (TheList.Items[i] as TTimeMark).Len ;
  end;

end;

procedure TDateTimeEditAgent.RefreshApm;
var
  Lp, SL : integer;
begin
    Lp := Ed.SelStart;
    Sl := Ed.SelLength;

    RefreshEdit;

    Ed.SelStart := Lp;
    Ed.SelLength := SL;

end;

procedure TDateTimeEditAgent.RefreshEdit;
var
  i : integer;
  SelStart, SelLen : integer;
begin
//  Ed.Text := GetDateTimeStr;
  SelStart := ed.SelStart;
  SelLen := ed.SelLength;

  Ed.Clear;
  for i := 0 to TheList.Count - 1 do
  begin
    Ed.SelStart := (TheList.Items[i] as TTimeMark).LowPosition;
    Ed.SelText := (TheList.Items[i] as TTimeMark).Value;
  end;

  if YearSegment.IntValue = 1899 then
  begin
    Ed.Clear;
    for i := 0 to TheList.Count - 1 do
    begin
      Ed.SelStart := (TheList.Items[i] as TTimeMark).LowPosition;
      if (TheList.Items[i] is TTimeSegment) then
        Ed.SelText := '    '
      else
        Ed.SelText := (TheList.Items[i] as TTimeMark).Value;
    end;
  end;

  Ed.SelStart := SelStart;
  Ed.SelLength := SelLen;
end;

procedure TDateTimeEditAgent.SelectSegment;
var
  OkIndex : integer;
begin
    OkIndex := GetCurrentMark(Ed.SelStart);

    if (OkIndex <> CurrentIndex) and
      (CurrentIndex <= TheList.Count - 1) then // If APM is turned to 24-hour mode, this condition is needed.
    begin
      Ed.SelStart := (TheList.Items[CurrentIndex ] as TTimemark).LowPosition;
      Ed.SelLength := (TheList.Items[CurrentIndex] as TTimeMark).HighPosition - (TheList.Items[CurrentIndex] as TTimeMark).LowPosition + 1;

      if YearSegment.IntValue = 1899 then
        Ed.SelText := StrFillChar(' ', Ed.SelLength)
      else
      Ed.SelText := (TheList.Items[CurrentIndex ] as TTimemark).Value;
    end;

    if (TheList.Items[OkIndex] is TTimeSep) then
      OkIndex := OkIndex - 1;

    Ed.SelStart := (TheList.Items[OkIndex ] as TTimemark).LowPosition;
    Ed.SelLength := (TheList.Items[OkIndex] as TTimeMark).HighPosition - (TheList.Items[OkIndex] as TTimeMark).LowPosition + 1;

    CurrentIndex := OKIndex;

end;

procedure TDateTimeEditAgent.SetDateTime(const t: TDateTime);
begin
  YearSegment.IntValue := YearOfDate(t);
  MonthSegment.IntValue := MonthOfDate(t);
  DaySegment.IntValue := DayOfDate(t);

  if DatetimeEnabled then
  begin
  HourSegment.IntValue := HourOfTime(t);
  MinuteSegment.IntValue := MinuteOfTime(t);
  TwentyFour := TwentyFour;
  end;
end;

procedure TDateTimeEditAgent.SetModified(const Value: boolean);
begin
  FModified := Value;

  if FModified and Assigned(OnModified) then
    OnModified( self);
end;


procedure TDateTimeEditAgent.SetTwentyFour(const Value: boolean);
var
  i : integer;
  t : TApSegment;
  ds : TTimeSep;
begin
  if not DateTimeEnabled then
    exit;
    
  FTwentyFour := Value;
  if Value then
  begin
    i := TheList.FindInstanceOf( TApSegment);
    if i > - 1 then
    begin
      TheList.Remove( TheList.Items[i] );
      TheList.Remove(TheList.Items[i-1]); // presumbly this is the sep
      HourSegment.APM := nil;
    end;
  end
  else
  begin
    i := TheList.FindInstanceOf( TApSegment);
    if i = -1 then
    begin
      ds := TTimeSep.Create(' ');
      ds.Len := 1;

      t :=  TApSegment.Create(self);
      t.Len := 2;
      HourSegment.APM := t;

      TheList.Add(ds);
      TheList.Add(t );
    end;

  end;

  Reformat;
  
//  RefreshEdit;

end;

{ TTimeSegment }

constructor TTimeSegment.Create(const mi: TmasterTimeIntf);
begin
  inherited Create;
  MasterTime := mi;

end;

function TTimeSegment.ReadIntValue: integer;
begin
  Result := FIntValue;
end;

procedure TTimeSegment.SetIntValue(const Value: integer);
begin
  FIntValue := Value;
end;

{ TAPSegment }

destructor TAPSegment.destroy;
begin
  HourSegment.APM := nil;
  inherited;
end;

function TAPSegment.GetAm: boolean;
begin
  Result := (HourSegment.IntValue >=0) and (HourSegment.IntValue <12);
end;

function TAPSegment.Process(const c: char; const SelText: string): string;
begin
  if (c='a') or (c='A') then
    am := true
  else if (c='p') or (c='P') then
    am := false;
end;

function TAPSegment.RespondToDown: string;
begin
  am := not am;
  Result := Value;

end;

function TAPSegment.RespondToEnd: string;
begin
  am := not am;
  Result := Value;

end;

function TAPSegment.RespondToHome: string;
begin
  am := not am;
  Result := Value;
end;

function TAPSegment.RespondToUp: string;
begin
  am := not am;
  Result := Value;
end;

procedure TAPSegment.SetAm(const Value: boolean);
begin
  if Am <> Value then
  begin
    if (HourSegment.IntValue > 12) and (Value) then
      HourSegment.IntValue := HourSegment.IntValue -12
    else if (HourSegment.IntValue < 12) and (not Value) then
      HourSegment.IntValue := HourSegment.IntValue + 12;
  end;
end;

function TAPSegment.Value: string;
begin
  if am then
    Result := 'AM'
  else
    Result := 'PM';
end;

end.
