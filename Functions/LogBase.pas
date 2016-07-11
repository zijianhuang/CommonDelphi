unit LogBase;
{
  Purpose:
    Define a basic class of log. This component is thread safe.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:
    In general cases, the client program should use utilities and global log object
    defined in unit LogBaseUtil.

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

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SyncObjs;

type

  TLogBase = class
  private
    OnlyOneThread: TCriticalSection; // Some locking code
    fLogFile: TextFile; // Debug Log File
    fActive: Boolean;
    FCurrentLogLevel : word;
    FLogTime: boolean;
    fOnLogItem: TGetStrProc;
    FFileName: string;
    FEventOnly: boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetFileName(const Value: string);
    procedure SetEventOnly(const Value: boolean);
    procedure SetOnLogItem(const Value: TGetStrProc);
  protected
  public
    constructor Create(LogFileName: String='');
    destructor Destroy; override;

    //: Condition log, upon CurrentLogLevel
    procedure WriteLogFile(const msg: string; const LogLevel : word);  overload;

    //: Always write log
    procedure WriteLogFile(const msg: string); overload;
    
    property CurrentLogLevel : word read FCurrentLogLevel write FCurrentLogLevel;

    property FileName : string read FFileName write SetFileName;
    property Active: Boolean read fActive write SetActive;
    property LogTime : boolean read FLogTime write FLogTime;

    //: not write to the file
    property EventOnly : boolean read FEventOnly write SetEventOnly;

    //: Handler from client code, generally for a on-screen log
    property OnLogItem: TGetStrProc read FOnLogItem write SetOnLogItem;
  end;


implementation


{ TLogBase }

constructor TLogBase.Create(LogFileName: String);
begin
  fActive := False;
  fLogTime := true;

  OnlyOneThread := TCriticalSection.Create;
  FileName := LogFileName;
end;

destructor TLogBase.Destroy;
begin
  if fActive then
    CloseFile(fLogFile);
  OnlyOneThread.Free;
  inherited;
end;

procedure TLogBase.SetActive(const Value: Boolean);
begin
  fActive := Value;
  try
    if FileName <> '' then
    begin
      if Value then
      begin
      AssignFile(fLogFile, FileName);
      if not FileExists(FileName) then
        Rewrite(fLogFile);
      Append(fLogFile);
      end
      else
        CloseFile(fLogFile);
    end;
  except
    fActive := False;
  end;

end;

procedure TLogBase.WriteLogFile(const msg: string;
  const LogLevel: word);
begin
  if CurrentLoglevel >= LogLevel then
    WriteLogFile(msg);

end;

procedure TLogBase.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TLogBase.WriteLogFile(const msg: string);
var
  s : string;
begin
  OnlyOneThread.Enter;
  try
    if Active then
    begin
      if LogTime then
        s := DatetimeToStr(Now)+' : '+msg
      else
        s := msg;

      if Assigned(OnLogItem) then
        OnLogItem( s);

      if not EventOnly then
      begin
        WriteLn(fLogFile, s);
        Flush(fLogFile);
      end;
    end;
  finally
    OnlyOneThread.Leave;
  end;

end;

procedure TLogBase.SetEventOnly(const Value: boolean);
begin
  FEventOnly := Value;
end;

procedure TLogBase.SetOnLogItem(const Value: TGetStrProc);
begin
  FOnLogItem := Value;
  if not Assigned(Value) then
    EventOnly := false;
end;

end.
 