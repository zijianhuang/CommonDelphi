unit ReportAg;

interface

uses
  SysUtils, Classes;

type
  TReportAg = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TReportAg]);
end;

end.
 