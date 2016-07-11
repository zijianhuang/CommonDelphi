unit functionsinte;

interface
uses
  SysUtils;

  function GetPYIndexChar(const hzchar:string):char;

  function GetCharIndex(const hachar : string; const t : integer) : string;

  function IsLeadByteTw(c:Char):Boolean;

  //计算中文字的笔划(修改自 MS Access 7.0 NorthWind 范例);
  //传回值:0 表示非中文字, 否则为中文笔划数.
  function NumStrokes(cstr: string):Integer;

  //计算字符串的总笔划
  function TotalStrokes(cstr: string):Integer;





implementation

function GetCharIndex(const hachar : string; const t : integer) : string;
begin
  case t of
    0  : begin
        if strByteType(PChar(hachar), 0) = mbLeadByte then
          Result:=UpperCase(copy(hachar, 1, 2))
        else
          Result:=UpperCase(copy(hachar, 1, 1));
        end;
    1  : begin
        if strByteType(PChar(hachar), 0) = mbLeadByte then
          Result:=GetPyIndexChar(copy(hachar, 1, 2))
        else
          Result:=UpperCase(copy(hachar, 1, 1));
        end;
    2   : begin
        if strByteType(PChar(hachar), 0) = mbLeadByte then
          Result:=IntToStr(NumStrokes(copy(hachar, 1, 2)))
        else
          Result:=UpperCase(copy(hachar, 1, 1));
         end;


  end;
end;

//判断某一个字符是否为中文的前导字符
function IsLeadByteTw(c:Char):Boolean;
begin
//根据附属应用程序中的"字符映射表"计算而得 ($81 .. $FE)
Result:=(c in [Char($81)..Char($FE)]);
{
//呼叫 Windows API 来计算 (但效率较差)
Result:=IsDBCSLeadByte(Byte(c));
}
end;

function NumStrokes(cstr: string):Integer;
var i:Integer;
begin
Result:=0;
if Length(cstr)<2 then exit;
if not IsLeadByteTw(cstr[1]) then exit;
i := (Ord(cstr[1]) shl 8)+Ord(cstr[2]);
//一划
If (i = $A440) Or (i = $A441) Then Result := 1
//2划
Else If ((i >= $A442) And (i <= $A453)) Or ((i >= $C940) And (i <= $C944)) Then Result := 2
//3划
Else If ((i >= $A454) And (i <= $A47E)) Or ((i >= $C945) And (i <= $C94C)) Then Result := 3
//4划
Else If ((i >= $A4A1) And (i <= $A4FD)) Or ((i >= $C94D) And (i <= $C962)) Then Result := 4
//5划
Else If ((i >= $A4FE) And (i <= $A5DF)) Or ((i >= $C963) And (i <= $C9AA)) Then Result := 5
//6划
Else If ((i >= $A5E0) And (i <= $A6E9)) Or ((i >= $C9AB) And (i <= $CA59)) Then Result := 6
//7划
Else If ((i >= $A6EA) And (i <= $A8C2)) Or ((i >= $CA5A) And (i <= $CBB0)) Then Result := 7
//8划
Else If (i = $A260) Or ((i >= $A8C3) And (i <= $AB44)) Or ((i >= $CBB1) And (i <= $CDDC)) Then Result := 8
//9划
Else If (i = $A259) Or (i = $F9DA) Or ((i >= $AB45) And (i <= $ADBB)) Or ((i >= $CDDD) And (i <= $D0C7)) Then Result := 9
//10划
Else If (i = $A25A) Or ((i >= $ADBC) And (i <= $B0AD)) Or ((i >= $D0C8) And (i <= $D44A)) Then Result := 10
//11划
Else If (i = $A25B) Or (i = $A25C) Or ((i >= $B0AE) And (i <= $B3C2)) Or ((i >= $D44B) And (i <= $D850)) Then Result := 11
//12划
Else If (i = $F9DB) Or ((i >= $B3C3) And (i <= $B6C2)) Or ((i >= $D851) And (i <= $DCB0)) Then Result := 12
//13划
Else If (i = $A25D) Or (i = $A25F) Or (i = $C6A1) Or (i = $F9D6) Or (i = $F9D8) Or ((i >= $B6C3) And (i <= $B9AB)) Or ((i >= $DCB1) And (i <= $E0EF)) Then Result := 13
//14划
Else If (i = $F9DC) Or ((i >= $B9AC) And (i <= $BBF4)) Or ((i >= $E0F0) And (i <= $E4E5)) Then Result := 14
//15划
Else If (i = $A261) Or ((i >= $BBF5) And (i <= $BEA6)) Or ((i >= $E4E6) And (i <= $E8F3)) Then Result := 15
//16划
Else If (i = $A25E) Or (i = $F9D7) Or (i = $F9D9) Or ((i >= $BEA7) And (i <= $C074)) Or ((i >= $E8F4) And (i <= $ECB8)) Then Result := 16
//17划
Else If ((i >= $C075) And (i <= $C24E)) Or ((i >= $ECB9) And (i <= $EFB6)) Then Result := 17
//18划
Else If ((i >= $C24F) And (i <= $C35E)) Or ((i >= $EFB7) And (i <= $F1EA)) Then Result := 18
//19划
Else If ((i >= $C35F) And (i <= $C454)) Or ((i >= $F1EB) And (i <= $F3FC)) Then Result := 19
//20划
Else If ((i >= $C455) And (i <= $C4D6)) Or ((i >= $F3FD) And (i <= $F5BF)) Then Result := 20
//21划
Else If ((i >= $C4D7) And (i <= $C56A)) Or ((i >= $F5C0) And (i <= $F6D5)) Then Result := 21
//22划
Else If ((i >= $C56B) And (i <= $C5C7)) Or ((i >= $F6D6) And (i <= $F7CF)) Then Result := 22
//23划
Else If ((i >= $C5C8) And (i <= $C5F0)) Or ((i >= $F7D0) And (i <= $F8A4)) Then Result := 23
//24划
Else If ((i >= $C5F1) And (i <= $C654)) Or ((i >= $F8A5) And (i <= $F8ED)) Then Result := 24
//25划
Else If ((i >= $C655) And (i <= $C664)) Or ((i >= $F8EE) And (i <= $F96A)) Then Result := 25
//26划
Else If ((i >= $C665) And (i <= $C66B)) Or ((i >= $F96B) And (i <= $F9A1)) Then Result := 26
//27划
Else If ((i >= $C66C) And (i <= $C675)) Or ((i >= $F9A2) And (i <= $F9B9)) Then Result := 27
//28划
Else If ((i >= $C676) And (i <= $C678)) Or ((i >= $F9BA) And (i <= $F9C5)) Then Result := 28
//29划
Else If ((i >= $C679) And (i <= $C67C)) Or ((i >= $F9C7) And (i <= $F9CB)) Then Result := 29
//30划
Else If (i = $C67D) Or ((i >= $F9CC) And (i <= $F9CF)) Then Result := 30
//30划
Else If (i = $C67D) Or ((i >= $F9CC) And (i <= $F9CF)) Then Result := 30
//31划
Else If (i = $F9D0) Then Result := 31
//32划
Else If (i = $C67E) Or (i = $F9D1) Then Result := 32
//33划
Else If (i = $F9C6) Or (i = $F9D2) Then Result := 33
//35划
Else If (i = $F9D3) Then Result := 35
//36划
Else If (i = $F9D4) Then Result := 36
//48划
Else If (i = $F9D5) Then Result := 48;
end;

//计算字符串的总笔划
function TotalStrokes(cstr: string):Integer;
var
i,n,L:Integer;
c:string;
begin
{Result:=0;
L:=length(cstr);
if L=0 then exit;
n:=0;
i:=1;
while (i
begin
c:=cstr[i];
if IsLeadByteTw(c[1]) and ((i+1)<=L) then
begin
c:=c+cstr[i+1];
n:=n+NumStrokes(c);
inc(i);
inc(i);
end
else inc(i);
end;
Result:=n; }
end;

function GetPYIndexChar(const hzchar:string):char;
begin
  case WORD(hzchar[1]) shl 8 + WORD(hzchar[2]) of
    $B0A1..$B0C4 : result := 'A';
    $B0C5..$B2C0 : result := 'B';
    $B2C1..$B4ED : result := 'C';
    $B4EE..$B6E9 : result := 'D';
    $B6EA..$B7A1 : result := 'E';
    $B7A2..$B8C0 : result := 'F';
    $B8C1..$B9FD : result := 'G';
    $B9FE..$BBF6 : result := 'H';
    $BBF7..$BFA5 : result := 'J';
    $BFA6..$C0AB : result := 'K';
    $C0AC..$C2E7 : result := 'L';
    $C2E8..$C4C2 : result := 'M';
    $C4C3..$C5B5 : result := 'N';
    $C5B6..$C5BD : result := 'O';
    $C5BE..$C6D9 : result := 'P';
    $C6DA..$C8BA : result := 'Q';
    $C8BB..$C8F5 : result := 'R';
    $C8F6..$CBF9 : result := 'S';
    $CBFA..$CDD9 : result := 'T';
    $CDDA..$CEF3 : result := 'W';
    $CEF4..$D188 : result := 'X';
    $D1B9..$D4D0 : result := 'Y';
    $D4D1..$D7F9 : result := 'Z';
  else
    result := '_';
  end;
end;


end.
 