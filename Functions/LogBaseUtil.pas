unit LogBaseUtil;
{
  Purpose:
    Define global util functions of TLogBase object.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:

// Example ==========================================
  Application.Initialize;

  ActivateLogFile('log.log');

  Application.CreateForm(TFmMain, FmMain);
  // Wire on-screen log handling
  EventLog.OnLogItem := FmMain.LogFileLogItem;

  ...

  Application.Run;
// ================== Example

}

interface
uses LogBase, Forms, SysUtils, Classes;

  procedure ActivateLogFile(const FileName : string; const LogLevel : Word=0);

  procedure DeactivateLogFile;

  procedure WriteLogFile(const msg: string; const LogLevel : Word=0);

  procedure SetLogLevel(const i : integer);

//  function GetLogHandler : TGetStrProc;

  procedure SetEventOnly(EventHandler : TGetStrProc; const t : boolean);

var
  EventLog : TLogBase;

implementation


  procedure SetEventOnly(EventHandler : TGetStrProc; const t : boolean);
  begin
    EventLog.EventOnly := t;
    EventLog.OnLogItem := EventHandler;
  end;

  procedure DeactivateLogFile;
  begin
    EventLog.Active := false;
  end;

  procedure ActivateLogFile(const FileName : string; const LogLevel : Word);
  begin
    EventLog.Filename := FileName;
    EventLog.CurrentLogLevel := LogLevel;
    EventLog.Active := true;
  end;

  procedure WriteLogFile(const msg: string; const LogLevel : Word );
  begin
    EventLog.WriteLogFile(msg, LogLevel);
  end;

  procedure SetLogLevel(const i : integer);
  begin
    EventLog.CurrentLogLevel := i;
  end;
initialization
  EventLog := TLogBase.Create('');
finalization
  EventLog.Free;

end.
