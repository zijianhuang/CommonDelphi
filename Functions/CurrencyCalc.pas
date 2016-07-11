unit CurrencyCalc;

interface

function RoundCurrency(const Value: Currency): Currency;

implementation

function RoundCurrency(const Value: Currency): Currency;
var
  HalfCent: Boolean;
  temp : Currency;
  function Sign(const V : Currency) : integer;
  begin
    if VAlue >=0 then
      Result := 1
    else
      Result := -1;
  end;
begin

  if Value < 0 then
  begin
    temp := - Trunc(Value * 100) / 100 ;
    HalfCent := Value * 100 - Trunc(Value * 100)  <= -0.5;
  end
  else
  begin
    temp := Trunc(Value * 100) / 100;
    HalfCent := Value * 100 - Trunc(Value * 100)  >= 0.5;
  end;

  if (HalfCent = True) then
    Result :=  temp + 0.01
  else
   Result := temp;

  Result := Result * Sign(Value);
end;

end.
 