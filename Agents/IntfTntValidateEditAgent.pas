{{
  Purpose:
    Validate inputs of TTntEdit objects
}
unit IntfTntValidateEditAgent;

interface
uses
  SysUtils, Classes, StdCtrls, Controls,  Contnrs, Windows, TntStdCtrls;
type
  TTntValidateType = (tnNone, tvInteger, tvFloat, tvAlpha, tvAlphanum, tvCustom);

  TTntValidateEditAgent = class(Tcomponent)
  private
    FValidateType: TTntValidateType;
    procedure SetValidateType(const Value: TTntValidateType);

  protected
    TheEdit : TTntEdit;

    OldKeyPress : TKeyPressEvent;
    procedure HandleKeyPress(Sender: TObject; var Key: Char) ;
  public
    constructor Create(Aowner : TComponent; AEd : TTntEdit; const AValidateType : TTntValidateType=tvNone);
    destructor Destroy; override;

    //: Change validate type
    property ValidateType : TTntValidateType read FValidateType write SetValidateType;
  end;
implementation
uses
  JclUnicode;

{ TTntValidateEditAgent }

constructor TTntValidateEditAgent.Create(Aowner: TComponent;
  AEd: TTntEdit; const AValidateType : TTntValidateType);
begin
  TheEdit := AEd;
  OldKeyPress := AEd.OnKeyPress;
  TheEdit.OnKeyPress := HandleKeyPress;
  ValidateType  := AvalidateType;
end;

destructor TTntValidateEditAgent.Destroy;
begin
  TheEdit.OnKeyPress := OldKeyPress;
  inherited;
end;

procedure TTntValidateEditAgent.HandleKeyPress(Sender: TObject;
  var Key: Char);
var
  ok : boolean;
begin
  case ValidateType of
   tvAlpha : ok :=  UnicodeIsAlpha(ord(Key));
   tvAlphaNum : ok := UnicodeIsAlphaNum(ord(Key));
   tvInteger : ok := UnicodeIsNumber(ord(Key));
  end;

  if not ok then
    Key := #0;

end;

procedure TTntValidateEditAgent.SetValidateType(
  const Value: TTntValidateType);
begin
  FValidateType := Value;
end;

end.
 