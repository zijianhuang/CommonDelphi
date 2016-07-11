unit FbUtils;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TFbUtil = class(TComponent)
  private
    Fusername, FPassword : string;
    FGfix, FGbk : string;
    function GetGbak: string;
    function GetGfix: string;
    procedure SetPassword(const Value: string);
    procedure SetUsername(const Value: string);
  protected

  public

    function Backup(const dbname, bkname : string) : boolean;
    function Restore(const src, dest : string) : boolean;
    function Compress(const dbname : string) : boolean;

    property Username : string read Fusername write SetUsername;
    property Password : string read FPassword write SetPassword;
    property Gfix : string read GetGfix;
    property Gbak : string read GetGbak;
  end;

  function BackupFb(const dbname, bkname, username, password : string) : boolean;


implementation
uses
  JclShell, JclRegistry;


  function BackupFb(const dbname, bkname, username, password : string) : boolean;
  var
    bb : TFbUtil;
  begin
    bb := TFbUtil.Create(nil);
    bb.Username := UserName;
    bb.Password := password;
    try
      Result := bb.Backup(dbname, bkname);
    finally
      bb.Free;
    end;
  end;

{ TFbUtil }

function TFbUtil.Backup(const dbname, bkname: string): boolean;
begin
  Result := ShellExecAndWait(Gbak, Format(' -user %s -password %s %s %s ',  [UserName, Password,dbname, bkname] ) );
end;

function TFbUtil.Compress(const dbname: string): boolean;
begin

end;

function TFbUtil.GetGbak: string;
begin
  if FGbak = '' then
    FGbk := RegReadString(HKEY_LOCAL_MACHINE,
            'SOFTWARE\Firebird Project\Firebird Server\Instances',
            'DefaultInstance');

  Result := FGbk;
end;

function TFbUtil.GetGfix: string;
begin

end;

function TFbUtil.Restore(const src, dest: string): boolean;
begin

end;

procedure TFbUtil.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TFbUtil.SetUsername(const Value: string);
begin
  Fusername := Value;
end;

end.
 