{{
  Purpose:
  Wrap some Windows service management functions.

  "Pause" and "Continue" are not yet implemented.

  Copyright (c) 2003-2004  Zijian Huang,  All Rights Reserved.
  
  Created by Zijian Huang

}
unit ServiceControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, winsvc;

type
  TServiceControl = class(TComponent)
  private
    FScManager : Sc_Handle;
    function GetScManager: SC_HANDLE;
  protected
    //: Handle of service control manager
    property ScManager : SC_HANDLE read GetScManager;

  public
    function RunService(const sname : string) : boolean;
    function StopService(const sname : string) : boolean;
    function IsRunning(const sname : string) : boolean;

    function GetStatusStr(const sname : string) : string;    overload;

    function GetDisplayName(const sname : string) : string;

    //: Return status string, and status word of WinAPI.  Client should catch the exception raised inside.
    function GetStatusStr(const sname : string; var Running : Dword) : string; overload;
  end;

//procedure Register;

implementation

{procedure Register;
begin
  RegisterComponents('Standard', [TServiceControl]);
end; }
function TServiceControl.GetScManager: SC_HANDLE;
var
  err : integer;
begin
  if FScManager = 0 then
  begin
    FScManager :=  OpenSCManager( nil,   nil, SC_MANAGER_ALL_ACCESS 	);

    err := GetLastError;
    case err of
      ERROR_ACCESS_DENIED :  showmessage('The requested access was denied.');
      ERROR_DATABASE_DOES_NOT_EXIST :	showmessage('The specified database does not exist.');
      ERROR_INVALID_PARAMETER : 	showmessage('A parameter that was specified is invalid.');
//    else
//      raise Exception.Create('Can not get handle of SCManager of local machine. Err code: ' + IntToStr(err) );
    end;
  end;

  Result := FScManager;
end;

function TServiceControl.GetDisplayName(const sname: string): string;
var
  b : PAnsiChar;
  bl : Cardinal;
begin
  SetLength(Result, 50);
  GetServiceDisplayName(scManager, PChar(sname), PAnsiChar(Result), bl);
end;

function TServiceControl.GetStatusStr(const sname: string; var Running: Dword): string;
var
  hService : Sc_Handle;
  status : Service_Status;
begin
  Result := '';
  hService := OPenService(ScManager, PChar(sname), SERVICE_QUERY_STATUS );
  if hService <> 0 then
  begin
    if QueryServiceStatus( hService, Status) then
    begin
      Running :=  Status.dwCurrentState;
      case Running of

        SERVICE_STOPPED  : Result := 'Stopped';
        SERVICE_START_PENDING  : Result := 'Start Pending';
        SERVICE_STOP_PENDING  : Result := 'Stop Pending';
        SERVICE_CONTINUE_PENDING : Result := 'Continue Pending';
        SERVICE_PAUSE_PENDING  : Result := 'Pause Pending';
        SERVICE_PAUSED   : Result := 'Paused';

        SERVICE_RUNNING  : Result := 'Running';

        else
          Result := 'Unknown';
      end;
    end
    else
      raise Exception.Create('QueryServiceStatus fails.');
  end
  else
    raise Exception.Create('OpenService fails. (GetStatus)');

end;

function TServiceControl.GetStatusStr(const sname: string): string;
var
  Running : DWord;
begin
  Result := GetStatusStr(sname, Running);
end;

function TServiceControl.IsRunning(const sname: string): boolean;
var
  hService : Sc_Handle;
  status : Service_Status;
begin
  hService := OPenService(ScManager, PChar(sname), SERVICE_QUERY_STATUS );
  if hService <> 0 then
  begin
    if QueryServiceStatus( hService, Status) then
      case Status.dwCurrentState of

        SERVICE_STOPPED  ,
        SERVICE_START_PENDING  ,
        SERVICE_STOP_PENDING  ,
        SERVICE_CONTINUE_PENDING ,
        SERVICE_PAUSE_PENDING ,
        SERVICE_PAUSED   : Result := false;

        SERVICE_RUNNING  : Result := true;
      end
    else
      raise Exception.Create('QueryServiceStatus fails.');
  end
  else
    raise Exception.Create('OpenService fails. (IsRunning)');
end;

function TServiceControl.RunService(const sname: string): boolean;
var
  hService : Sc_Handle;
  kk : LPCTSTR;
begin
  hService := OPenService(ScManager, PChar(sname), SERVICE_START 	);
  if hService <> 0 then
    Result := StartService( hService, 0, kk)
  else
    Result := false;
end;

function TServiceControl.StopService(const sname: string): boolean;
var
  hService : Sc_Handle;
  status : Service_Status;
begin
  hService := OPenService(ScManager, PChar(sname), SERVICE_STOP);
  if hService <> 0 then
    Result := ControlService( hService, SERVICE_CONTROL_STOP, status)
  else
    Result := false;

end;

end.
 