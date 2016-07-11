unit FormCombo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvCombobox;

type
  TFmCombo = class(TForm)
    TheBox: TJvComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(aOwner : TComponent; const ATitle, AHint : string; AList : TStrings=nil); overload;
    function GetResult : string;
    function TheList : TStrings;
  end;

var
  FmCombo: TFmCombo;

implementation

{$R *.dfm}

constructor TFmCombo.Create(aOwner: TComponent;
  const ATitle, AHint: string; AList: TStrings);
begin
  inherited Create(Owner);
  if AList <> nil then
    TheBox.Items.Assign(AList);

  Caption := ATitle;
  label1.Caption := AHInt;
end;

function TFmCombo.GetResult: string;
begin
  Result := '';
  if ShowModal = mrOK then
    Result := TheBox.Text;
end;

function TFmCombo.TheList: TStrings;
begin
  Result := TheBox.Items;
end;

procedure TFmCombo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
