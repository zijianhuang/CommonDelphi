unit FormsInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  THInputBox = class(TForm)
    BnOK: TButton;
    BnCancel: TButton;
    LbHint: TLabel;
    Edit: TJvValidateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function InputInteger(const Title, Prompt : string; var s : string) : boolean;
    function InputFloat(const Title, Prompt : string; var s : string) : boolean;
  end;

    function InputInteger(const Title, Prompt : string; var s : string) : boolean;
    function InputFloat(const Title, Prompt : string; var s : string) : boolean;

implementation
uses gnugettext;
{$R *.DFM}

    function InputFloat(const Title, Prompt : string; var s : string) : boolean;
    begin
      Result := THInputBox.Create(Application).INputFloat(Title, Prompt, s);
    end;
    function InputInteger(const Title, Prompt : string; var s : string) : boolean;
    begin
      Result := THInputBox.Create(Application).INputInteger(Title, Prompt, s);
    end;
procedure THInputBox.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);

end;

function THInputBox.InputFloat(const Title, Prompt: string;
  var s: string): boolean;
begin
  LbHint.Caption := Prompt;
  Caption := Title;
  Edit.DisplayFormat := dfCurrency;
  Edit.EditText := s;
  Result := ShowModal = mrOK;
  s :=  Edit.EditText;
end;

function THInputBox.InputInteger(const Title, Prompt: string;
  var s: string): boolean;
begin
  LbHint.Caption := Prompt;
  Caption := Title;
  Edit.DisplayFormat := dfInteger;
  Edit.Text := s;
  Result := ShowModal = mrOK;
  s := Edit.EditText;

end;

procedure THInputBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
