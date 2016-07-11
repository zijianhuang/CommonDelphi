unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ReadNumEng, ReadNumChn;

type
  TFmMain = class(TForm)
    EdInput: TEdit;
    BnConvert: TButton;
    EdResult: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    EdTestcase: TMemo;
    Label3: TLabel;
    BnTest: TButton;
    procedure BnConvertClick(Sender: TObject);
    procedure BnTestClick(Sender: TObject);
  protected
    procedure Test;
  public

  end;

var
  FmMain: TFmMain;

implementation
uses functions;

{$R *.DFM}

procedure TFmMain.BnConvertClick(Sender: TObject);
begin
  EdResult.Text := SayCurrencyEnglish(StrToFloat(EdInput.Text), 'Dollar', 'Cent')+''#13#10''+
       SayCurrencyChinese(StrToFloat(EdInput.Text)) ;
end;

procedure TFmMain.Test;
var
  i : integer;
begin
  for i :=0 to EdTestcase.Lines.count-1 do
  begin
    if EdTestcase.Lines[i]<>'' then
    begin
    EdResult.Lines.Add(EdTestcase.Lines[i]+' = '+FloatToStr(RoundMoney(StrToFloat(EdTestcase.Lines[i]), 0.05)  )+
        ''#13#10''+SayCurrencyEnglish(StrToFloat(EdTestcase.Lines[i]), 'Dollar', 'Cent')+
        ''#13#10''+SayCurrencyChinese(StrToFloat(EdTestcase.Lines[i])) );
    end;
  end;
end;

procedure TFmMain.BnTestClick(Sender: TObject);
begin
  Test;
end;

end.
