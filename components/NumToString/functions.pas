unit functions;

interface
uses sysutils;

const

{$IFDEF FAREAST}
  DIVISION_COUNT=4;
  WordsOfDigits         : array[0..9] of string=('Áã', 'Ò¼', '·¡', 'Èþ', 'ËÁ', 'Îé',
                        'Â½', 'Æâ', '°Æ', '¾Á');
//  WordsOfTens           : array[2..9] of string=(' twenty', ' thirty', ' fourty', ' fifty', ' sixty',
//                        ' seventy', ' eighty', ' ninety');

  DivisionDigit         : array[0..DIVISION_COUNT] of integer=(100000000,10000, 1000, 100, 10);
  WordsOfDivisionDigit  : array[0..DIVISION_COUNT] of string=('ÒÚ', 'Íò', 'Çª', '°Û', 'Ê°');
{$ELSE}
  DIVISION_COUNT=3;
  WordsOfDigits         : array[0..19] of string=(' zero', ' one', ' two', ' three', ' four', ' five',
                        ' six', ' seven', ' eight', ' nine', ' ten', ' eleven', ' twelve', ' thirteen',
                        ' fourteen', ' fifteen', ' sixteen', ' seventeen', ' eightteen', ' nineteen');
  WordsOfTens           : array[2..9] of string=(' twenty', ' thirty', ' fourty', ' fifty', ' sixty',
                        ' seventy', ' eighty', ' ninety');

  DivisionDigit         : array[0..DIVISION_COUNT] of integer=(1000000000,1000000, 1000, 100);
  WordsOfDivisionDigit  : array[0..DIVISION_COUNT] of string=(' billion', ' million', ' thousand', ' hundred');
{$ENDIF}

  function ReadChineseCurrency(const f: extended): string;

  function ReadEnglishCurrency(const f: extended): string; overload;
  function ReadEnglishCurrency(const fs: string): string; overload;

  function IntToWords(i: integer): string;
  function DigitToWord(const i: integer): string;
{$IFDEF FAREAST}
{$ELSE}
  function TensToWord(const i: integer): string;
{$ENDIF}

  // from JCL lib
  function StrRemoveChars(const S: AnsiString; const Chars: TSysCharSet): AnsiString;


implementation

function ReadChineseCurrency(const f: extended): string;
var
  p1, p2, d1, d2: integer;
  AndStr, p1s, d1s, d2s: string;
begin
  p1 := trunc(f);
  p2 := round((f - trunc(f)) * 100);

  p1s := IntToWords(p1) + 'Ôª';

  if p2>0 then
  begin

    d1:=p2 div 10;
    d2:=p2 mod 10;

    d1s := IntToWords(d1) + '½Ç';

    d2s := IntToWords(d2) + '·Ö';
  end
  else
    p1s:=p1s+'Õû';


  Result := p1s + d1s + d2s;
end;

function ReadEnglishCurrency(const f: extended): string;
var
  p1, p2: integer;
  AndStr, p1s, p2s: string;
begin
  p1 := trunc(f);
  p2 := round((f - trunc(f)) * 100);

  if p1 > 1 then
    p1s := IntToWords(p1) + ' DOLLARS'
  else
    p1s := IntToWords(p1) + ' DOLLAR';

  if p2 > 1 then
    p2s := IntToWords(p2) + ' CENTS'
  else if p2>0 then
    p2s := IntToWords(p2) + ' CENT';

  if p2 > 0 then
    AndStr := ' AND';

  Result := p1s + AndStr + p2s;
end;

function DigitToWord(const i: integer): string;
begin
  // depending on the features of the project, fault tolerance may be added inside or outside this function

  Result:= WordsOfDigits[i];
end;

function IntToWords(i: integer): string;
var
  temp : integer;
  k : integer;
begin
  if (i <> 0) then
  begin
{$IFDEF FAREAST}
    Result := '';
{$ELSE}
    Result := ' ';
{$ENDIF}

// Compressing the old codes make the program more flexible for larger number
    for k:=0 to DIVISION_COUNT do
    begin
      if (i >= DivisionDigit[k]) then
      begin
        Result := Result + IntToWords(i div DivisionDigit[k]) + WordsOfDivisionDigit[k];
        i := i mod DivisionDigit[k];
      end;

    end;

    if i=0 then
      exit;

{$IFDEF FAREAST}

{$ELSE}
    if (Result <> ' ') and
      (i <> 0) then
      Result := Result + ' and';

    if (i >= 10) then
    begin
      temp:=i div 10;
      if temp in [2..9] then
        Result:=Result+TensToWord(temp)
      else
      begin
        Result:=Result+DigitToWord(i);
        exit;
      end;

      i := i mod 10;

      if i=0 then
        exit;
    end;
{$ENDIF}

    Result := Result + DigitToWord(i);
    TrimLeft(Result);
  end 
  else
    Result := DigitToWord(0);
end;

function ReadEnglishCurrency(const fs: string): string;
  function RemoveComma(const ff: string): string;
  begin
    Result := StrRemoveChars(ff, [',']);
  end;
begin
  Result := ReadEnglishCurrency(StrToFloat(RemoveComma(fs)));
end;

function StrRemoveChars(const S: AnsiString; const Chars: TSysCharSet): AnsiString;
var
  Source, Dest: PChar;
begin
  SetLength(Result, Length(S));
  UniqueString(Result);
  Source := PChar(S);
  Dest := PChar(Result);
  while (Source <> nil) and (Source^ <> #0) do
  begin
    if not (Source^ in Chars) then
    begin
      Dest^ := Source^;
      Inc(Dest);
    end;
    Inc(Source);
  end;
  SetLength(Result, (longint(Dest) - longint(PChar(Result))) div SizeOf(AnsiChar));
end;

{$IFDEF FAREAST}
{$ELSE}
function TensToWord(const i: integer): string;
begin
  Result:=WordsOfTens[i];
end;
{$ENDIF}


end.
