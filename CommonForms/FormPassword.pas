unit FormPassword;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150 } Variants, {$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TFmPassword = class(TForm)
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function InputPassword(const ACaption, APrompt : string; var s : string) : boolean;

implementation

{$R *.dfm}

function InputPassword(const ACaption, APrompt : string; var s : string) : boolean;
var
  kkfm : TfmPassword;
begin
  kkfm := TFmPassword.Create(nil);

  kkfm.Caption := ACaption;
  kkfm.Label1.Caption := Aprompt;
  kkfm.MaskEdit1.Text := s;

  Result := kkfm.ShowModal = mrOK;
  if Result then
    s := kkfm.MaskEdit1.Text;

  kkfm.Free;

end;

end.
