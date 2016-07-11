{{
  Zijian built this tnt counterpart of TJvValidateEdit.
}
unit TntValidateEdit;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, TntStdCtrls, messages;

type
  TTntValidateType = (tvNone,tvNumber, tvFloat, tvAlpha, tvDigit, tvAlphanum, tvCustom);
  TTntCustomValidate= procedure (Sender: TObject; Key: Char;
    const AText: String; const Pos: Integer; var IsValid: Boolean) of object;
  TTntValidateEdit = class(TTntEdit)
  private
    FValidateType: TTntValidateType;
    FOnCustomValidate: TTntCustomValidate;
    procedure SetValidateType(const Value: TTntValidateType);
    procedure SetOnCustomValidate(const Value: TTntCustomValidate);
  protected

    procedure HandleKeyPress(Sender: TObject; var Key: Char) ;
    Procedure WMPaste( Var msg: TMessage ); message WM_PASTE;
    function Check(const c : Char ) : boolean;
  public
    constructor Create(Aowner : TComponent); override;

    property ValidateType : TTntValidateType read FValidateType write SetValidateType;
    property OnCustomValidate : TTntCustomValidate read FOnCustomValidate write SetOnCustomValidate;
  end;

procedure Register;

implementation
uses
  JclUnicode, Clipbrd, JclStringConversions;

procedure Register;
begin
  RegisterComponents('Samples', [TTntValidateEdit]);
end;

{ TTntValidateEdit }

function TTntValidateEdit.Check(const c: Char): boolean;
begin
  Result := true;
  case ValidateType of
   tvAlpha : Result :=  UnicodeIsAlpha(ord(c));
   tvAlphaNum : Result := UnicodeIsAlphaNum(ord(c));
   tvNumber : Result := UnicodeIsNumber(ord(c));
   tvFloat :  begin
         Result := UnicodeIsDigit(ord(c)) or (c= '.') or (c='-');

         end;
   tvDigit : Result := UnicodeIsDigit(ord(c));
  end;

end;

constructor TTntValidateEdit.Create(Aowner: TComponent);
begin
  inherited;
  self.OnKeyPress := HandleKeypress;
  ValidateType := tvNone;
end;

procedure TTntValidateEdit.HandleKeyPress(Sender: TObject; var Key: Char);
var
  ok : boolean;
begin
  if Assigned(OnCustomValidate) then
  begin
    OnCustomValidate(self, Key, WideStringToUtf8(Text), SelStart, ok);
    if not OK then
      Key := #0;
  end
  else
  if (not Check(Key)) and (not UnicodeIsControl(ord(Key)) ) then
    Key := #0;
end;

procedure TTntValidateEdit.SetOnCustomValidate(
  const Value: TTntCustomValidate);
begin
  FOnCustomValidate := Value;
end;

procedure TTntValidateEdit.SetValidateType(const Value: TTntValidateType);
begin
  FValidateType := Value;
end;

procedure TTntValidateEdit.WMPaste(var msg: TMessage);
 var
  s: String;
  i: Integer;
begin
  S:= Clipboard.AsText;
  For i:= 1 to Length(S) Do
    If not ( Check(S[i]) ) Then
      Exit;
  inherited;
end;

end.
