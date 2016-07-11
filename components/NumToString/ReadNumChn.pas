unit ReadNumChn;

interface
uses sysutils;

  function SayCurrencyChinese(const f: extended): string;

implementation

const


// To Support languages like Big5, Japanese and Korean etc., use a code converter to thanslat the result,
// or just write another unit if speed is important

  HighOfDigits=19;
  WordsOfDigits         : array[0..HighOfDigits] of string=('Áã', 'Ò¼', '·¡', 'Èþ', 'ËÁ', 'Îé',
                        'Â½', 'Æâ', '°Æ', '¾Á',  'Ê°' ,
                        'Ê°Ò¼', 'Ê°·¡', 'Ê°Èþ', 'Ê°ËÁ', 'Ê°Îé',
                        'Ê°Â½', 'Ê°Æâ', 'Ê°°Æ', 'Ê°¾Á');

  HighOfDivision=4;

  DivisionDigits         : array[0..HighOfDivision] of integer=(100000000,10000, 1000, 100, 10);
  WordsOfDivisionDigits  : array[0..HighOfDivision] of string=('ÒÚ', 'Íò', 'Çª', '°Û', 'Ê°');

  UnitName='Ôª';
  JiaoName='½Ç';
  CentName='·Ö';
  PointName='Õû';

function IntToWords( i: integer): string;
var
  temp : integer;
  k, j : word;
  ToAddZero : boolean;
begin
  if (i <> 0) then
  begin
    ToAddZero:=false;

    Result := '';

    for k:=0 to HighOfDivision do
    begin

      // Handling Chinese locale MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
     if (i <20) then
      begin
        Result:=Result+WordsOfDigits[i];
        exit;
      end;
      // =============================================

      if (i >= DivisionDigits[k]) then
      begin
        Result := Result + IntToWords(i div DivisionDigits[k]) + WordsOfDivisionDigits[k];
        i := i mod DivisionDigits[k];
      end;

      if i=0 then
        exit;

     // Handling Chinese locale MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      if (Result<>'') and (not ToAddZero) then
      begin

        if  (k<HighOfDivision) and (i<DivisionDigits[k+1]) then
        begin
          ToAddZero:=true; // so not to add more zero again for multi-zero

          Result:=Result+WordsOfDigits[0];
          i:=i mod DivisionDigits[k+1];
        end;

      end;
      // =============================================

    end;  // for


    Result := Result + WordsOfDigits[i]
  end
  else
    Result := WordsOfDigits[0];

end;

function SayCurrencyChinese(const f: extended): string;
var
  p1, p2, d1, d2: integer;
  AndStr, p1s, d1s, d2s: string;
begin
  p1 := trunc(f);
  p2 := round((f - trunc(f)) * 100);

  if p2=100 then
  begin
    p1:=p1+1;
    p2:=0;
  end;

  p1s := IntToWords(p1) + UnitName;

  if p2>0 then
  begin

    d1:=p2 div 10;
    d2:=p2 mod 10;

    d1s := IntToWords(d1) + JiaoName;

    d2s := IntToWords(d2) + CentName;
  end
  else
    p1s:=p1s+PointName;


  Result := p1s + d1s + d2s;
end;


end.
