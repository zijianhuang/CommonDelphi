program Project1;

uses
  Forms,
  Unit2 in 'Unit2.pas' {Form2},
  IntfDateTimeEditAgent in '..\IntfDateTimeEditAgent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
