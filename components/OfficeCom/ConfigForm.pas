unit ConfigForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Word_TLB, Db, DBTables, Grids, DBGrids, MailData;

type
  TConfigFm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DocNameEd: TEdit;
    Button3: TButton;
    TempComboBox: TComboBox;
    Button4: TButton;
    Button5: TButton;
    TempNameEd: TEdit;
    Button6: TButton;
    DocCountLb: TLabel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button11: TButton;
    Button12: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    ToEdit: TEdit;
    CCEdit: TEdit;
    BccEdit: TEdit;
    SubjectEdit: TEdit;
    BodyEdit: TMemo;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Button16: TButton;
    Button17: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigFm: TConfigFm;

implementation


{$R *.DFM}

procedure TConfigFm.Button1Click(Sender: TObject);
var
  temp :  WordDocument;
  ut1, ut2, ut3, ut4: OleVariant;
begin
//  OADataMod.ConnectWordServer;
  temp:=OADataMod.CreateWord(TempNameEd.Text);

end;

procedure TConfigFm.Button5Click(Sender: TObject);
begin
  OADataMod.ConnectWordServer;
end;

procedure TConfigFm.Button2Click(Sender: TObject);
begin
  OADataMod.ConnectWordServer;
  OADataMod.OpenWord(DocNameEd.Text);
end;

procedure TConfigFm.Button4Click(Sender: TObject);
var
  i : integer;
  b : OleVariant;
begin
  TempComboBox.Items.Clear;
  for i:=0 to OADataMod.WordApp.Templates.Count-1 do
  begin
    b:=i+1;        // MS counting
    TempCombobox.Items.Add((OADataMod.WordApp.Templates.Item(b) as Template).Name);
  end;


end;

procedure TConfigFm.Button7Click(Sender: TObject);
begin
  OADataMod.ConnectExcelServer;
end;

procedure TConfigFm.Button8Click(Sender: TObject);
begin
//  OADataMod.ConnectExcelServer;
  OADataMod.CreateBook(Edit1.Text);

end;

procedure TConfigFm.Button12Click(Sender: TObject);
begin
//  OADataMod.SaveDatasetIntoExcel(Table1, Edit1.Text);
//  OADataMod.BookLoadFromDataset(OADataMod.CreateBook(Edit1.Text), OADataMod.Table1, Checkbox1.Checked);
end;

procedure TConfigFm.Button13Click(Sender: TObject);
begin
  OADataMod.ConnectOutlookServer;
end;

procedure TConfigFm.Button14Click(Sender: TObject);
begin
  OADataMod.CloseOutlookServer;
end;

procedure TConfigFm.Button15Click(Sender: TObject);
begin
  OADataMod.MailAddContent( OADataMod.CreateNewMail(ToEdit.Text, CCEdit.Text, BccEdit.Text)
                        , SubjectEdit.Text, Bodyedit.Text);
end;

procedure TConfigFm.ComboBox2Change(Sender: TObject);
var
  temp : TStringList;
begin
  if ComboBox2.Text<>'' then
  begin
    OADataMod.ChangeDatabase(ComboBox2.Text);
    temp:=OADataMod.GetTableNames;
    Combobox3.Items.Assign(temp);
    temp.Free;
  end;
end;

procedure TConfigFm.ComboBox3Change(Sender: TObject);
begin
  if ComboBox3.Text<>'' then
    OADataMod.ChangeTable(ComboBox3.Text);
end;

procedure TConfigFm.FormShow(Sender: TObject);
var
  temp : TStringList;
begin
//  temp:=OADataMod.GetDBNames;
//  Combobox2.Items.Assign(temp);
//  temp.Free;

  OADataMod.UDPClient.Active:=true;
  OADataMod.TCPServer.Active:=true;

end;

procedure TConfigFm.Button16Click(Sender: TObject);
var
  temp, aa: TStringList;
begin
{  SendToMAPI(
    ['to_one@email.com.br','to_two@email.com.br'],  // To
    ['cc_one@email.com.br','cc_two@email.com.br'],  // CC
    [],                                             // BCC
    ['c:\autoexec.bat','c:\config.sys'],            // Atts
    'Corpo da mensagem',                            // Body
    'Assunto',                                      // Subject
    'Bruno Lovatti',                                // Sender Name
    'blovatti@vix.terra.com.br',                    // Sender Email
    true                                            // Show Error or you want to catch the error?
            ); }
  temp:=TStringList.Create;
  aa:=TStringList.Create;
  aa.Add('c:\autoexec.bat');
  aa.Add('c:\config.sys');
  temp.CommaText:=ToEdit.Text;
  OADataMod.SendToMAPI(
    temp,  // To
    temp,  // CC
    temp,                                             // BCC
    aa,            // Atts
    BodyEdit.Lines.Text ,                            // Body
    subjectedit.Text,                                      // Subject
    'Bruno Lovatti',                                // Sender Name
    'blovatti@vix.terra.com.br',                    // Sender Email
    true                                            // Show Error or you want to catch the error?
            );

    temp.Free;   aa.Free;
end;

procedure TConfigFm.Button17Click(Sender: TObject);
begin
  OADataMod.UDPClient.Broadcast(BodyEdit.Text, 7112);
end;

end.
