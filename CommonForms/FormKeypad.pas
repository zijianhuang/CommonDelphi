unit FormKeypad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvSpeedButton, ActnList;

type
  TFmKeyPad = class(TForm)
    b7: TJvSpeedButton;
    b8: TJvSpeedButton;
    b9: TJvSpeedButton;
    b4: TJvSpeedButton;
    b5: TJvSpeedButton;
    b6: TJvSpeedButton;
    b1: TJvSpeedButton;
    b2: TJvSpeedButton;
    b3: TJvSpeedButton;
    b0: TJvSpeedButton;
    bdel: TJvSpeedButton;
    bok: TJvSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    A_Del: TAction;
    A_OK: TAction;
    Action0: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure A_OKExecute(Sender: TObject);
    procedure Action0Execute(Sender: TObject);
  private
    FClientKeyPress: TKeyPressEvent;
    procedure SetClientKeyPress(const Value: TKeyPressEvent);
  protected
    procedure GetKey(const k : char);
  public
    property ClientKeyPress : TKeyPressEvent read FClientKeyPress write SetClientKeyPress;
  end;

var
  FmKeyPad: TFmKeyPad;

implementation

{$R *.dfm}

procedure TFmKeyPad.SetClientKeyPress(const Value: TKeyPressEvent);
begin
  FClientKeyPress := Value;
end;

procedure TFmKeyPad.Action1Execute(Sender: TObject);
begin
  GetKey('1');
end;

procedure TFmKeyPad.Action2Execute(Sender: TObject);
begin
  GetKey('2');
end;

procedure TFmKeyPad.Action3Execute(Sender: TObject);
begin
  GetKey('3');
end;

procedure TFmKeyPad.Action4Execute(Sender: TObject);
begin
  GetKey('4');
end;

procedure TFmKeyPad.Action5Execute(Sender: TObject);
begin
   GetKey('5');
end;

procedure TFmKeyPad.Action6Execute(Sender: TObject);
begin
  GetKey('6');
end;

procedure TFmKeyPad.Action7Execute(Sender: TObject);
begin
  GetKey('7');
end;

procedure TFmKeyPad.Action8Execute(Sender: TObject);
begin
  GetKey('8');
end;

procedure TFmKeyPad.Action9Execute(Sender: TObject);
begin
  GetKey('9');
end;

procedure TFmKeyPad.A_DelExecute(Sender: TObject);
begin
  GetKey(''#7'');
end;

procedure TFmKeyPad.A_OKExecute(Sender: TObject);
begin
    GetKey(''#13'');
end;

procedure TFmKeyPad.Action0Execute(Sender: TObject);
begin
  GetKey('0');
end;

procedure TFmKeyPad.GetKey(const k: char);
var
  s : char;
begin
  s := k;
  if Assigned(ClientKeyPress) THEN
    ClientKeyPress(self, s);
end;

end.
