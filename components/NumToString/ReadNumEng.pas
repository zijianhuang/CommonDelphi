unit ReadNumEng;

interface
uses sysutils;

  function SayCurrencyEnglish(const f: extended; const UnitName, CentName : string) : string;

  function roundmoney(const value, coin : double) : double;
implementation

const
  HighOfDigits=19;
  WordsOfDigits         : array[0..HighOfDigits] of string=(' zero', ' one', ' two', ' three', ' four', ' five',
                        ' six', ' seven', ' eight', ' nine', ' ten', ' eleven', ' twelve', ' thirteen',
                        ' fourteen', ' fifteen', ' sixteen', ' seventeen', ' eightteen', ' nineteen');

  HighOfTens=9;
  WordsOfTens           : array[2..HighOfTens] of string=(' twenty', ' thirty', ' fourty', ' fifty', ' sixty',
                        ' seventy', ' eighty', ' ninety');

  HighOfDivision=3;
  DivisionDigits         : array[0..HighOfDivision] of integer=(1000000000,1000000, 1000, 100);
  WordsOfDivisionDigits  : array[0..HighOfDivision] of string=(' billion', ' million', ' thousand', ' hundred');


function roundmoney(const value, coin : double) : double;
var
 base1, mod1, bigcon, a : Int64;
begin
   bigcon:=trunc(coin*100);
   base1:=(round(value*100) div bigcon) * bigcon;
   mod1:=round(value*100) mod bigcon;
   if mod1 >= bigcon/2 then
     a:=bigcon
   else
     a:=0;

   Result:=(base1 +a)/100;
end;

function IntToWords( i: integer): string;
var
  temp : integer;
  k : integer;
begin
  if (i <> 0) then
  begin

    Result := ' ';

    for k:=0 to HighOfDivision do
    begin
      if (i >= DivisionDigits[k]) then
      begin
        Result := Result + IntToWords(i div DivisionDigits[k]) + WordsOfDivisionDigits[k];
        i := i mod DivisionDigits[k];
      end;

    end;

    if i=0 then
      exit;

    // Handling English locale MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    if (Result <> ' ') and  (i <> 0) then
      Result := Result + ' and';

    if (i >= 10) then
    begin
      temp:=i div 10;
      if temp in [2..HighOfTens] then
        Result:=Result+WordsOfTens[temp]
      else
      begin
        Result:=Result+WordsOfDigits[i];
        exit;
      end;

      i := i mod 10;

      if i=0 then
        exit;
    end;
    // =======================================================

    Result := Result + WordsOfDigits[i];
  end
  else
    Result := WordsOfDigits[0];

end;

function SayCurrencyEnglish(const f: extended; const UnitName, CentName : string): string;
var
  p1, p2: integer;
  AndStr, p1s, p2s: string;
begin
  p1 := trunc(f);
  p2 := round((f - trunc(f)) * 100);  // depending on the feature of application, the rounding could be
  if p2=100 then             // made outside this function, for example, rounding coin
  begin
    p1:=p1+1;
    p2:=0;
  end;

  if p1 > 1 then
    p1s := IntToWords(p1) + ' '+UnitName+'s'
  else
    p1s := IntToWords(p1) + ' '+UnitName;

  if p2 > 1 then
    p2s := IntToWords(p2) + ' '+CentName+'s'
  else if p2>0 then
    p2s := IntToWords(p2) + ' '+CentName;

  if p2 > 0 then
    AndStr := ' AND';

  Result := p1s + AndStr + p2s;

end;


end.
