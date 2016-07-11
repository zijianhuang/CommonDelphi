{{
  Purpose: Encluate a set of basic Excel Com functions, and manage Excel objects.
        TExcelUtilBase could be used by client programs and inherited for specific
        projects.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang
}
unit DataExcel;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleServer, Excel_TLB,  Office_Tlb,
   syncobjs, ActiveX, db
{$IFNDEF VER130}
, Variants
{$ENDIF} ;


type

  {{
    Wrapper and utility class encalsulating Office COM

  }
  TExcelUtilBase = class (TComponent)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FExcelApp : TExcelApplication;

    procedure ExcelAppWorkbookDeactivate(Sender: TObject;  var Wb: OleVariant);
    procedure ExcelWindowDeactivate(Sender : TObject; var wb : OleVariant; var 
            ww : OleVariant);
    procedure SetExcelApp(const Value: TExcelApplication);
  protected
    TingSec: TCriticalSection;
    function CloseIdleExcelServer: Boolean;
    function GetExcelApp: TExcelApplication;

  public

    //@todo implement it later
    procedure CloseBook(dt : ExcelWorkbook);

    //: @deprecated
    function CloseExcelServer: Integer;

    //: @deprecated
    function ConnectExcelServer(const ecaption : string=''): Integer;

    {{
      Create Excel workbook using a template.

      @param tempfn template file path
    }
    function CreateBook(const tempfn : string=''; fvisible : boolean=true):
            ExcelWorkBook;

    function CreateBookWithName(const TheName : string; const tempfn : string=''; fvisible : boolean=true):
            ExcelWorkBook;


    //: Open Excel workbook
    function OpenBook(const fn : string=''): ExcelWorkBook;


    procedure ExcelSave(b : ExcelWorkBook);

    procedure ExcelSaveAs(b : ExcelWorkBook; const fn : string);
   {{
      Refer to a Ms Excel application. The first referencing will result in connecting to
      the Excel COM.
    }
    property ExcelApp: TExcelApplication read GetExcelApp write SetExcelApp;

  end;



implementation



{ TMainDataMod }

{
********************************** TExcelUtilBase **********************************
}

procedure TExcelUtilBase.CloseBook(dt : ExcelWorkbook);
begin
  dt.Close(EmptyParam,EmptyParam, EmptyParam, 0 ); 
  //@todo implement it later
end;


function TExcelUtilBase.CloseExcelServer: Integer;
begin
  Result:=0;
end;

function TExcelUtilBase.CloseIdleExcelServer: Boolean;
begin
  //    ShowMessage(IntToStr(ExcelApp.Workbooks.Count) );
  Result:=false;
  if ExcelApp.Workbooks.Count<=0 then
  begin
    FExcelApp.Disconnect;
    FreeAndNil(FExcelApp);
    Result:=true;
  end;
  
end;


function TExcelUtilBase.ConnectExcelServer(const ecaption : string=''): Integer;

  {  procedure CreateNewExcelServer;
    begin
      ExcelApp:=TExcelApplication.Create(self);
      if ecaption<>'' then
        ExcelApp.Caption:=ecaption;
  
      // event handlings ++++++++++++
      ExcelApp.OnWorkbookDeactivate:=ExcelAppWorkbookDeactivate;
  
    end;  }
  
begin
  {  if not Assigned(ExcelApp) then
    begin
      CreateNewExcelServer;
    end
    else
    begin
      if CloseIdleExcelServer then // fix possible of Excel Com
        CreateNewExcelServer;
    end; }
  
  Result:=0;
  
end;


function TExcelUtilBase.CreateBook(const tempfn : string=''; fvisible :
        boolean=true): ExcelWorkBook;
var
  ut1: OLEVariant;
begin
  ExcelApp.Visible[0]:= fvisible;
  if tempfn='' then
    ut1:=NULL
  else
    ut1:=tempfn;
  
  Result:=  ExcelApp.Workbooks.Add(ut1, 0);
end;

function TExcelUtilBase.CreateBookWithName(const TheName, tempfn: string;
  fvisible: boolean): ExcelWorkBook;
begin
  raise Exception.Create('no now');
end;

procedure TExcelUtilBase.DataModuleCreate(Sender: TObject);
begin
  TingSec:=TCriticalSection.Create;
end;

procedure TExcelUtilBase.DataModuleDestroy(Sender: TObject);
begin
  TingSec.Free;
  FExcelApp.Free;
end;




procedure TExcelUtilBase.ExcelAppWorkbookDeactivate(Sender: TObject;  var Wb: 
        OleVariant);
begin
  CloseIdleExcelServer;
end;

procedure TExcelUtilBase.ExcelSave(b: ExcelWorkBook);
begin
  b.Save( 0);
end;

procedure TExcelUtilBase.ExcelSaveAs(b: ExcelWorkBook; const fn: string);
begin
//  b.SaveAs(fn, EmptyParam,    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
//       EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
  b.SaveAs(fn, EmptyParam,    '', '', false, false, xlExclusive,
       xlUserResolution, false, EmptyParam, EmptyParam, 0, 0 );

// Just a bit redicular. With word object, I can use all EmptyParam, but with Excel,
// it report one of the parameter raise variant conversion error.
end;

procedure TExcelUtilBase.ExcelWindowDeactivate(Sender : TObject; var wb :
        OleVariant; var ww : OleVariant);
begin
  CloseIdleExcelServer;
end;

function TExcelUtilBase.GetExcelApp: TExcelApplication;
begin
  if not Assigned(FExcelApp) then
  begin
    FExcelApp:=TExcelApplication.Create(self);
    FExcelApp.AutoConnect:=false;


  end;

  try
    // If I don't disconnect first then connect it again, an existing Excel application
    // may be forzon half way. Word does not have this problem
//    FExcelApp.Disconnect;

    FExcelApp.Connect;
    if not FExcelApp.Visible[0] then
      FExcelApp.Visible[0]:=true;
  except
    on e : Exception do
    begin
      Application.ProcessMessages;
      sleep(2000);
  
      FExcelApp.Disconnect;
      FExcelApp.Connect;
      if not FExcelApp.Visible[0] then
        FExcelApp.Visible[0]:=true;
    end;
  end;
  
  
  Result:=FExcelApp;
  
end;

function TExcelUtilBase.OpenBook(const fn : string=''): ExcelWorkBook;
var
  temp: ExcelWorkBook;
begin
  ExcelApp.Visible[0]:= true;
  try
    temp:=ExcelApp.Workbooks.Open(fn, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
     EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0, 0, 0);
    Result:=temp;
  except
    on e : SysUtils.Exception do
    begin
      showmessage(e.ClassName+'--'+e.Message);
      temp:=nil;
      Result:=temp;
    end;
  
  end;
  
end;


procedure TExcelUtilBase.SetExcelApp(const Value: TExcelApplication);
begin
  if Value <> nil then
    raise Exception.Create('Not allow to assign another Excel object.');

  FExcelApp := nil;

// Excel object behave a bit different from Word. Word app will free itself after all
// documents are closed. Excel object will still be there after closing all workbooks.
// So I have to handle OnWorkbookBeforeClose to release the object.
end;

end.

