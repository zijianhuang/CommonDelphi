unit IntfProgressAgent;

interface
          Not used
//uses
//  SysUtils, Classes, ComCtrls, Controls, StdCtrls;

type
  IProgressAgent = interface
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetStep(const Value: Integer);
    procedure StepBy(Delta: Integer);
    procedure SetText(const s : string);
  end;
{  TProgressAgent = class(TComponent, IProgressAgent)
  private
    function GetMax: Integer;
    function GetMin: Integer;
    function GetPosition: Integer;
    function GetStep: Integer;
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetStep(const Value: Integer);
  protected
    Bar : TProgressBar;
    Msg : TLabel;
  public
    // MsgCtrl is generally TLabel
    constructor Create(Owner : TComponent; ABar : TProgressBar; MsgCtrl : TLabel);

    procedure SetText(const s : string);

    property Min: Integer read GetMin write SetMin;
    property Max: Integer read GetMax write SetMax;
    property Position: Integer read GetPosition write SetPosition;
    property Step: Integer read GetStep write SetStep;


  end;  }


implementation

{ TProgressAgent }

{constructor TProgressAgent.Create(Owner: TComponent; ABar: TProgressBar; MsgCtrl : Tlabel);
begin
  inherited Create(Owner);
  Bar := ABar;
  Msg := MsgCtrl;
end;

function TProgressAgent.GetMax: Integer;
begin
  Result := Bar.Max;
end;

function TProgressAgent.GetMin: Integer;
begin
  Result := Bar.Min;
end;

function TProgressAgent.GetPosition: Integer;
begin
  Result := Bar.Position;
end;

function TProgressAgent.GetStep: Integer;
begin
  Result := Bar.Step;
end;

procedure TProgressAgent.SetMax(const Value: Integer);
begin
  Bar.Max := Value;
end;

procedure TProgressAgent.SetMin(const Value: Integer);
begin
  Bar.Min := Value;
end;

procedure TProgressAgent.SetPosition(const Value: Integer);
begin
  Bar.Position := Value;
end;

procedure TProgressAgent.SetStep(const Value: Integer);
begin
  Bar.Step := Value;
end;

procedure TProgressAgent.SetText(const s: string);
begin
  Msg.Caption := s;
end; }

end.
