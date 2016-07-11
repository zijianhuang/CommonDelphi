unit ActionPlugin;

interface

uses
  SysUtils, Classes;

type
  TActionPlugin = class(TComponent)
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
  RegisterComponents('Samples', [TActionPlugin]);
end;

end.
 