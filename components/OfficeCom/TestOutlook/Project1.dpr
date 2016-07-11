program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  DataOutlook in '..\DataOutlook.pas' {OutlookUtilBase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TOutlookUtilBase, OutlookDm);
  Application.Run;
end.
