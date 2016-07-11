unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IntfDateTimeEditAgent, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    okagent : TDateTimeEditAgent;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  okagent := TDateTimeEditAgent.Create(self, Edit1);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  okagent.SetDateTime(Now);
  okagent.TwentyFour := false;
  okagent.ChangeFormat(1, false);
  okagent.RefreshEdit;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  okAgent.ChangeFormat( RadioGroup1.ItemIndex );
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  okagent.TwentyFour := CheckBox1.Checked;
  okagent.RefreshEdit;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  okagent.SetDateTime( Datetimepicker2.time  );
  okagent.TwentyFour := false;
  okagent.ChangeFormat(1, false);
  okagent.RefreshEdit;
end;

end.
