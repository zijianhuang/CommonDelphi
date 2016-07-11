unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, DropdownAgent, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    pp : TForm;
    agent : TDropdownAgent;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  pp := TForm2.Create(Application);
  agent := TDropDownInnerAgent.Create(pp, Edit1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  agent.ShowForm;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  agent.ShowForm;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  agent.HideForm;
end;

end.
