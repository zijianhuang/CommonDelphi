program TestRegxEdit;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IntfRegxAgent in '..\IntfRegxAgent.pas',
  RegExpr in '..\..\..\..\DelphiComponents\regexpr\Source\RegExpr.pas',
  HyperLinksDecorator in '..\..\..\..\DelphiComponents\regexpr\Source\HyperLinksDecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
