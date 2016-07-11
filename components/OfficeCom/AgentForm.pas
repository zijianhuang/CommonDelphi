unit AgentForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IdBaseComponent, IdIntercept, IdLogBase, IdLogDebug;

type
  TAgentFm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    IdLogDebug1: TIdLogDebug;
    Memo1: TMemo;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdLogDebug1LogItem(ASender: TComponent; var AText: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgentFm: TAgentFm;

implementation

uses MailData, consttype;

{$R *.DFM}

procedure TAgentFm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 :   OADataMod.WhichEmailer:=ehOutLookExpress;
    1 :   OADAtaMod.WhichEmailer:=ehOutlook;
  else
    OADataMod.WhichEmailer:=ehOutLookExpress;
  end;
end;

procedure TAgentFm.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0;
  OADataMod.EmailAtOnce:=true;

  OADataMod.TCPServer.Active:=true;

  OADataMod.OnWriteLog:=IdLogDebug1.DoLog;
end;

procedure TAgentFm.IdLogDebug1LogItem(ASender: TComponent;
  var AText: String);
begin
  Memo1.Lines.Add(AText);
end;

procedure TAgentFm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OADataMod.TCPServer.Active:=false;
end;

end.
