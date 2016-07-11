unit ReadNumClass;

interface
uses sysutils;

type
  TReadFloat=class(TObject)

  protected
    HighOfDivision      : integer;    // store the high bound of DivisionDigits and WordsOfDivisionDigits
    HighOfDigits        : integer;      // store the high bound of WordsOfDigits;

    WordsOfDigits : array of string;
    DivisionDigits       : array of integer;
    WordsOfDivisionDigits : array of string;

    function DigitToWord(const i: integer): string;


    function IntToWords( i : integer) : string; virtual;  abstract;
    procedure SetWordsOfDigits;   virtual;  abstract;
    procedure SetDivisionDigits;  virtual;   abstract;
    procedure SetWordsOfDivisionDigits;  virtual;  abstract;
  public
    constructor Create; virtual;
    destructor Destroy; virtual;  // The souce code and help file of TObject may be wrong about virtual
                                // so I have to declare it as virtual here.

    function SayCurrency(const f: extended) : string; virtual;  abstract;
  end;

  TReadFloatEng=class(TReadFloat)
  protected
    HighOfTens  : integer;
    WordsOfTens : array of string;

    function IntToWords( i : integer) : string; override;

    procedure SetWordsOfDigits;   override;
    procedure SetDivisionDigits;   override;
    procedure SetWordsOfDivisionDigits;  override;

    procedure SetWordsOfTens; virtual;

    function TensToWord(const i: integer): string;
  public
    constructor Create;  override;
    destructor Destroy;  override;

    function SayCurrency(const f: extended) : string;  override;
  end;


  // from JCL lib
  function StrRemoveChars(const S: AnsiString; const Chars: TSysCharSet): AnsiString;

implementation

const

  ChineseWordsOfDigits         : array[0..9] of string=('Áã', 'Ò¼', '·¡', 'Èþ', 'ËÁ', 'Îé',
                        'Â½', 'Æâ', '°Æ', '¾Á');

  ChineseDivisionDigits         : array[0..4] of integer=(100000000,10000, 1000, 100, 10);
  ChineseWordsOfDivisionDigits  : array[0..4] of string=('ÒÚ', 'Íò', 'Çª', '°Û', 'Ê°');

  EnglishWordsOfDigits         : array[0..19] of string=(' zero', ' one', ' two', ' three', ' four', ' five',
                        ' six', ' seven', ' eight', ' nine', ' ten', ' eleven', ' twelve', ' thirteen',
                        ' fourteen', ' fifteen', ' sixteen', ' seventeen', ' eightteen', ' nineteen');
  EnglishWordsOfTens           : array[2..9] of string=(' twenty', ' thirty', ' fourty', ' fifty', ' sixty',
                        ' seventy', ' eighty', ' ninety');

  EnglishDivisionDigits         : array[0..3] of integer=(1000000000,1000000, 1000, 100);
  EnglishWordsOfDivisionDigits  : array[0..3] of string=(' billion', ' million', ' thousand', ' hundred');

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

{ TReadFloat }

constructor TReadFloat.Create;
begin
  inherited;

  SetDivisionDigits;
  SetWordsOfDigits;
  SetWordsOfDivisionDigits;

  HighOfDivision:=High(DivisionDigits);

  HighOfDigits:=High(WordsOfDigits);
end;

destructor TReadFloat.Destroy;
begin
  DivisionDigits:=nil;
  WordsOfDigits:=nil;
  WordsOfDivisionDigits:=nil;

  inherited;
end;

function TReadFloat.DigitToWord(const i: integer): string;
begin
  Result:= WordsOfDigits[i];
end;



{ TReadFloatEng }


constructor TReadFloatEng.Create;
begin
  inherited;

  SetWordsOfTens;
  HighOfTens:=High(WordsOfTens);
end;

destructor TReadFloatEng.Destroy;
begin
  WordsOfTens:=nil;
  inherited;
end;

function TReadFloatEng.IntToWords( i: integer): string;
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

    Result := Result + DigitToWord(i);
    TrimLeft(Result);
  end
  else
    Result := DigitToWord(0);

end;

function TReadFloatEng.SayCurrency(const f: extended): string;
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

procedure TReadFloatEng.SetDivisionDigits;
var
  i, h : integer;
begin
  h:=High(EnglishDivisionDigits);
  SetLength(DivisionDigits, h+1);
  for i:=0 to h do
    DivisionDigits[i]:=EnglishDivisionDigits[i];
end;


procedure TReadFloatEng.SetWordsOfDigits;
var
  i, h : integer;
begin
  h:=High(EnglishWordsOfDigits);
  SetLength(WordsOfDigits, h+1);
  for i:=0 to h do
    WordsOfDigits[i]:=EnglishWordsOfDigits[i];
end;

procedure TReadFloatEng.SetWordsOfDivisionDigits;
var
  i, h : integer;
begin
  h:=High(EnglishWordsOfDivisionDigits);
  SetLength(WordsOfDivisionDigits, h+1);
  for i:=0 to h do
    WordsOfDivisionDigits[i]:=EnglishWordsOfDivisionDigits[i];
end;

procedure TReadFloatEng.SetWordsOfTens;
var
  i, h : integer;
begin
  h:=High(EnglishWordsOfTens );
  SetLength(WordsOfTens, h+1);
  for i:=0 to h do
    WordsOfTens[i]:=EnglishWordsOfTens[i];

end;

function TReadFloatEng.TensToWord(const i: integer): string;
begin
  Result:=WordsOfTens[i];
end;

end.
