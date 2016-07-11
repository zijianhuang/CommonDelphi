unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DataOutlook, ComCtrls, Outlook_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    EdFirstName: TEdit;
    EdLastName: TEdit;
    EdEmail: TEdit;
    EdEmailAddressType: TEdit;
    EdBirthDay: TDateTimePicker;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  v : ContactItem;
begin
  v := OutlookDm.CreateContactItem;
  v.FirstName := EdFirstname.Text;
  v.LastName := EdLastname.Text;
  v.Email1Address := EdEmail.Text;
  v.Birthday := EdBirthDay.Date;
  v.Save;

end;

end.
