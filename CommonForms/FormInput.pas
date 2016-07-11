unit FormInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, TntStdCtrls;

type
  THInputBox = class(TForm)
    Edit: TJvValidateEdit;
    LbHint: TTntLabel;
    BnOK: TTntButton;
    BnCancel: TTntButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function InputInteger(const Title, Prompt : WideString; var s : WideString) : boolean;
    function InputFloat(const Title, Prompt : WideString; var s : WideString) : boolean;
  end;

    function InputInteger(const Title, Prompt : WideString; var s : WideString) : boolean;
    function InputFloat(const Title, Prompt : WideString; var s : WideString) : boolean;



implementation
uses gnugettext, JclUnicode;
{$R *.DFM}
    function InputInteger(const Title, Prompt : WideString; var s : WideString) : boolean;
    begin
      Result := THInputBox.Create(Application).InputInteger(Title, Prompt, s);
    end;
    function InputFloat(const Title, Prompt : WideString; var s : WideString) : boolean;
    begin
      Result := THInputBox.Create(Application).InputFloat(Title, Prompt, s);
    end;

procedure THInputBox.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);

end;

function THInputBox.InputFloat(const Title, Prompt: WideString;
  var s: WideString): boolean;
begin
  LbHint.Caption :=  Prompt;
  Caption :=  Title;
  Edit.Text := s;
  Edit.DisplayFormat := dfFloat;
  Result := ShowModal = mrOK;
  s := Edit.Text;
end;

function THInputBox.InputInteger(const Title, Prompt: WideString;
  var s: WideString): boolean;
begin

  LbHint.Caption := Prompt;
  Caption := Title;
  Edit.Text := s;
  Edit.DisplayFormat := dfInteger;
  Result := ShowModal = mrOK;
  s := Edit.Text;

end;

procedure THInputBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
