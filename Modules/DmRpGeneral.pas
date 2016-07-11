{{
  Purpose:
    provide basic services of Rave Report.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:
    This unit will be subclassed for specific projects.
}
unit DmRpGeneral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RPCon, RPConDS, RPDefine, RPRave, RPBase,
  RPSystem, RVDataField,  RpRender, RpRenderCanvas,
  RpRenderPrinter, RpFiler;

type
  TGeneralRpDm = class(TDataModule)
    VReportProject: TRvProject;
    ReportSystem: TRvSystem;
    procedure ReportSystemBeforePrint(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCurrentPrinter: string;

    procedure SetProjectName(const Value: string);
    function GetProjectName: string;

    procedure HideVisibility;
    procedure SetCurrentPrinter(const Value: string);
  public
    //: Set Rave project parameter
    procedure SetRpParam(const pname : string; const pvalue : string);

    //: Set Rave project parameter
    procedure ClearRpParam;

    //: Set printer and printer job name. The subclass may set different behavior before printing.
    procedure SetPrinter(const printername : string; const jobname : string='A Report'); virtual;

    //: Print a report in the report libary of the Rave project
    procedure ExecuteReport(const rpname : string);

    //: Set Rave project name. Rave report engine will be open.
    property ProjectName : string read GetProjectName write SetProjectName;

    property  CurrentPrinter : string read FCurrentPrinter write SetCurrentPrinter;

  //  property ClientControlPrinters : boolean; write Set ClientControlPrinters;
  end;


implementation
{$R *.DFM}

procedure TGeneralRpDm.SetRpParam(const pname, pvalue: string);
begin
  VReportProject.SetParam(pname, pvalue);
end;

procedure TGeneralRpDm.ClearRpParam;
begin
  VReportProject.ClearParams;
end;

procedure TGeneralRpDm.SetPrinter(const printername: string; const jobname : string);
begin
  ReportSystem.SystemPrinter.Title:=jobname;
  CurrentPrinter := printername;
end;

procedure TGeneralRpDm.SetProjectName(const Value: string);
begin
  try
    VReportProject.Close;
    HideVisibility;
    VReportProject.ProjectFile:=Value;
//    VReportProject.Open;
  except
    on e : Exception do
      ShowMessage(e.ClassName + '--'+ e.Message + '   You might have problem with report template '+Value);
  end;
end;

function TGeneralRpDm.GetProjectName: string;
begin
  Result := VReportProject.ProjectFile ;
end;

procedure TGeneralRpDm.ExecuteReport(const rpname: string);
begin
//  Application.ProcessMessages;
  VReportProject.ExecuteReport(rpname);
end;

procedure TGeneralRpDm.ReportSystemBeforePrint(Sender: TObject);
begin       // the sender is actually ReportSystem.BaseReport
  if CurrentPrinter<>'' then
  begin
    if not ReportSystem.BaseReport.SelectPrinter(CurrentPrinter) then
      raise Exception.Create('Fail to set printer ' + CurrentPrinter);
  end
//  else
//    ReportSystem.BaseReport.PrinterIndex := -1;

end;

procedure TGeneralRpDm.DataModuleDestroy(Sender: TObject);
begin
  VReportProject.Close;
end;

procedure TGeneralRpDm.HideVisibility;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
    if ( Components[i] is TRvDatasetConnection ) then
      ( Components[i] as TRvDatasetConnection ).RuntimeVisibility := RpCon.rtNone;

end;

procedure TGeneralRpDm.SetCurrentPrinter(const Value: string);
begin
  FCurrentPrinter := Value;
end;

initialization
  Randomize;
  RpDefine.DataID := 't'+formatDatetime('ddhhnnsszzz',now)+IntToStr( Random(1000));  // to allow multiple instances of reports

end.
