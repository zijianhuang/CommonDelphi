{******************************************************************}
{                                                                  }
{ Borland Delphi VCL                                               }
{ JB Credit Card Validator v.1                                     }
{                                                                  }
{ Copyright (C) 2001 JBDC Group                                    }
{ http://jbdc.far.ru                                               }
{                                                                  }
{ You may retrieve the latest version of this file at the JBDC     }
{ home page, located at http://jbdc.far.ru                         }
{                                                                  }
{ Software distributed under the License is distributed on an      }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied.                                                         }
{                                                                  }
{******************************************************************}

unit CCValidator;

interface

uses SysUtils, Classes;

//{$R JBCCValidator.dcr}

type
  TJBCreditCardType = (ccNone, ccMastercard, ccVisa, ccAmex, ccDinersClub, ccJCB, ccDiscover, ccEnroute);

  TJBCreditCard = class(TComponent)
  private
    FAutoValidate: Boolean;
    FValid: Boolean;
    FCCType: TJBCreditCardType;
    FCCNumber: String;
    procedure SetAutoValidate(Value: Boolean); virtual;
    procedure SetCCType(Value: TJBCreditcardType); virtual;
    procedure SetCCNumber(Value: String); virtual;
    function ValidateCard: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoValidate: Boolean read FAutoValidate write SetAutoValidate default True;
    property CCType: TJBCreditCardType read FCCType write SetCCType default ccVisa;
    property CCNumber: String read FCCNumber write SetCCNumber;
    property Valid: Boolean read ValidateCard;
  end;

  function ValidateCC(CCNumber: String): Boolean;

implementation

  function ValidateCC(CCNumber: String): Boolean;
  var CheckSum, I: Integer;
      CCType: TJBCreditCardType;

    function IsNumberic(const S: String): Boolean;
    var I : Cardinal;
    begin
      For I := 1 to Length(S) do
       begin
         If not (S[I] in ['0'..'9']) then
          begin
            Result := False;
            Exit;
          end;
       end;
      Result := True;
    end;
  begin
    Result := False;

    if not IsNumberic(CCNumber) then
      exit;

    While Pos(' ', CCNumber) > 0 do Delete(CCNumber, Pos(' ', CCNumber), 1);

    For I := 1 to Length(CCNumber) do
      If (CCNumber[i] < '0') or (CCNumber[i] > '9') then
        Exit;

    If (Length(CCNumber) < 13) then
      Exit;
    If (Length(CCNumber) = 15) and
       ((StrToIntDef(Copy(CCNumber, 1, 4), 0) = 2014) or
       (StrToInt(Copy(CCNumber, 1, 4)) = 2149)) then CCType := ccenRoute else
       begin
        CheckSum:=0;
        For I := 1 to Length(CCNumber) do
         begin
          If (CCNumber[i] < '0') or
             (CCNumber[i] > '9') or
             (Length(CCNumber) < 13) then
             begin
              CheckSum:=-1;
              Break;
             end else
             begin
              If (I + Length(CCNumber)) mod 2 = 0 then
                CheckSum := CheckSum + Ord(CCNumber[i]) - Ord('0') else
                CheckSum := CheckSum + (2 * (Ord(CCNumber[i]) - Ord('0'))) div 10 + (2 * (Ord(CCNumber[i]) - Ord('0'))) mod 10;
             end;
         end;
        If CheckSum mod 10 <> 0 then Exit;

        If (Length(CCNumber)=16) and (StrToInt(Copy(CCNumber,1,2))>=51) and (StrToInt(Copy(CCNumber,1,2))<=55) then
          CCType:=ccMASTERCARD
        else If ((Length(CCNumber)=13) or (Length(CCNumber)=16)) and (CCNumber[1]='4') then
           CCType:=ccVISA
        else If (Length(CCNumber)=15) and ((StrToInt(Copy(CCNumber,1,2))=34) or (StrToInt(Copy(CCNumber,1,2))=37)) then
          CCType:=ccAMEX
         else If (Length(CCNumber)=14) and ((((StrToInt(Copy(CCNumber,1,2))=36) or (StrToInt(Copy(CCNumber,1,2))=38))) or ((StrToInt(Copy(CCNumber,1,2))>=300) and (StrToInt(Copy(CCNumber,1,3))<=305))) then
          CCType:=ccDinersClub
        else If (Length(CCNumber)=16) and (CCNumber[1]='3') then
          CCType:=ccJCB
        else If (Length(CCNumber)=15) and ((StrToInt(Copy(CCNumber,1,4))=2131) or (StrToInt(Copy(CCNumber,1,4))=1800)) then
          CCType:=ccDiscover
       end;
    Result := CCType<>ccNone;
  end;

constructor TJBCreditCard.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  SetAutoValidate(True);
  SetCCType(ccVisa);
  SetCCNumber('');
end;

destructor TJBCreditCard.Destroy;
begin
  Inherited Destroy;
end;

procedure TJBCreditCard.SetAutoValidate(Value: Boolean);
begin
  If FAutoValidate <> Value then
   begin
     FAutoValidate := Value;
     If Value then ValidateCard;
   end;
end;

procedure TJBCreditCard.SetCCType(Value: TJBCreditCardType);
begin
  If FCCType <> Value then
   begin
     FCCType := Value;
     If FAutoValidate then ValidateCard;
   end;
end;

procedure TJBCreditCard.SetCCNumber(Value: String);

  function IsNumeric(S: String): Boolean;
  var I : Cardinal;
  begin
    For I := 1 to Length(S) do
     begin
       If not (S[I] in ['0'..'9']) then
        begin
          Result := False;
          Exit;
        end;
     end;
    Result := True;
  end;

begin
  If Not IsNumeric(Value) then Exit;
  If FCCNumber <> Value then
   begin
     FCCNumber := Value;
     If FAutoValidate then ValidateCard;
   end;
end;

function TJBCreditCard.ValidateCard: Boolean;

  function ValidateCC(CCType: String; CCNumber: String): Boolean;
  var CheckSum, I: Integer;
  begin
    Result := False;
    While Pos(' ', CCNumber) > 0 do Delete(CCNumber, Pos(' ', CCNumber), 1);
    For I := 1 to Length(CCNumber) do If (CCNumber[i] < '0') or (CCNumber[i] > '9') then Exit;
    If (Length(CCNumber) < 13) then Exit;
    If (Length(CCNumber) = 15) and
       ((StrToIntDef(Copy(CCNumber, 1, 4), 0) = 2014) or
       (StrToInt(Copy(CCNumber, 1, 4)) = 2149)) then CCType := 'enRoute' else
       begin
        CheckSum:=0;
        For I := 1 to Length(CCNumber) do
         begin
          If (CCNumber[i] < '0') or
             (CCNumber[i] > '9') or
             (Length(CCNumber) < 13) then
             begin
              CheckSum:=-1;
              Break;
             end else
             begin
              If (I + Length(CCNumber)) mod 2 = 0 then
                CheckSum := CheckSum + Ord(CCNumber[i]) - Ord('0') else
                CheckSum := CheckSum + (2 * (Ord(CCNumber[i]) - Ord('0'))) div 10 + (2 * (Ord(CCNumber[i]) - Ord('0'))) mod 10;
             end;
         end;
        If CheckSum mod 10 <> 0 then Exit;

        If (Length(CCNumber)=16) and (StrToInt(Copy(CCNumber,1,2))>=51) and (StrToInt(Copy(CCNumber,1,2))<=55) then
          CCType:='MASTERCARD'
        else If ((Length(CCNumber)=13) or (Length(CCNumber)=16)) and (CCNumber[1]='4') then
           CCType:='VISA'
        else If (Length(CCNumber)=15) and ((StrToInt(Copy(CCNumber,1,2))=34) or (StrToInt(Copy(CCNumber,1,2))=37)) then
          CCType:='AMEX'
         else If (Length(CCNumber)=14) and ((((StrToInt(Copy(CCNumber,1,2))=36) or (StrToInt(Copy(CCNumber,1,2))=38))) or ((StrToInt(Copy(CCNumber,1,2))>=300) and (StrToInt(Copy(CCNumber,1,3))<=305))) then
          CCType:='Diners Club'
        else If (Length(CCNumber)=16) and (CCNumber[1]='3') then
          CCType:='JCB'
        else If (Length(CCNumber)=15) and ((StrToInt(Copy(CCNumber,1,4))=2131) or (StrToInt(Copy(CCNumber,1,4))=1800)) then
          CCType:='JCB'
       end;
    Result := CCType > '';
  end;

var R: Boolean;
begin
  R := False;
  Case FCCType of
    ccMastercard :  R := ValidateCC('MASTERCARD', FCCNumber);
    ccVisa       :  R := ValidateCC('VISA', FCCNumber);
    ccAmex       :  R := ValidateCC('AMEX', FCCNumber);
    ccDinersClub :  R := ValidateCC('Diners Club', FCCNumber);
    ccJCB        :  R := ValidateCC('JCB', FCCNumber);
    ccDiscover   :  R := ValidateCC('DISCOVER', FCCNumber);
    ccEnroute    :  R := ValidateCC('ENROUTE', FCCNumber);
  end;
  Result := R;
  FValid := R;
end;

end.
