{{
  Purpose: Encluate a set of basic Word Com functions, and manage Word objects.
        TWordUtilBase could be used by client programs and inherited for specific
        projects.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:
    The first reference call to WordApp will launch Word if Word is not there, and connect it.
}
unit DataWord;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleServer, Word_TLB, Office_Tlb,
   syncobjs, ActiveX, db {$IFNDEF VER130},variants{$ENDIF};


type

  {{
    Wrapper and utility class encalsulating Office COM

  }
  TWordUtilBase = class (TComponent)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FWordApp: TWordApplication;
    function GetWordApp: TWordApplication;
    procedure WordAppDocumentChange(Sender: TObject);
    procedure WordApplicationDocumentBeforeClose(Sender: TObject; var Doc, 
            Cancel: OleVariant);
    procedure WordApplicationQuit(Sender: TObject);
  protected
    TingSec: TCriticalSection;

  public
    function AnyDocumentVisible: Boolean;


    //: Close the document.
    procedure CloseDoc(dt : WordDocument);

    procedure ForceCloseDoc(dt : WordDocument);

    //: @deprecated
    function CloseWordServer: Integer;

   
    {{
      Create word document using a template.

      @param tempfn template file path
    }
    function CreateWord(const tempfn : string=''; fvisible : boolean=true):
            WordDocument;

    {{
      Write text to a bookmark of the Word document

      @param bn bookmark name
      @todo t could be defined as OleVariant, after tests
    }
    procedure DocBookmarkText(dt : WordDocument; const bn, t : string);

    //: Save the document
    procedure DocSave(dt : WordDocument);

    //: Save the document as
    procedure DocSaveAs(dt : WordDocument; const fn : string);

    //: Open Word document
    function OpenWord(const fn : string=''; v : boolean=true): WordDocument;

    procedure HandleQuit(Sender: TObject);
    {{
      Refer to a Ms Excel application. The first referencing will result in connecting to
      the Excel COM.
    }
    property WordApp: TWordApplication read GetWordApp;
  end;
  

implementation


{ TMainDataMod }

{
********************************** TWordUtilBase **********************************
}
function TWordUtilBase.AnyDocumentVisible: Boolean;
var
  i: Integer;
  v: OLEVariant;
begin
  Result:=false;
  for i:=1 to WordApp.Documents.Count do
  begin
    v:=i;
    if WordApp.Documents.Item(v).Windows.Count>0 then
    begin
      Result:=true;
      break;
    end;
  end;
  
end;


procedure TWordUtilBase.CloseDoc(dt : WordDocument);
var
  ut1, ut2, ut3: OLEVariant;
begin
  //@todo fault tolerance if the document does not exist anymore
  ut1:=wdPromptToSaveChanges; ut2:=wdOriginalDocumentFormat; ut3:=false;
  dt.Close(ut1, ut2, ut3);
end;

function TWordUtilBase.CloseWordServer: Integer;
begin
  Result:=0;
  //  WordApp.de
end;


function TWordUtilBase.CreateWord(const tempfn : string=''; fvisible :
        boolean=true): WordDocument;
var
  ut1, ut2, ut3, ut4: OLEVariant;
  c: Boolean;
begin
  try
    ut1:=tempfn; ut2:=false; ut3:=wdNewBlankDocument; ut4:=fvisible;
    Result:=WordApp.Documents.Add(ut1, ut2, ut3, ut4);
    Result.Activate;
  except
    Result:=nil;
  end;
end;

procedure TWordUtilBase.DataModuleCreate(Sender: TObject);
begin
  TingSec:=TCriticalSection.Create;
end;

procedure TWordUtilBase.DataModuleDestroy(Sender: TObject);
begin
  TingSec.Free;
  FWordApp.Free;
end;

procedure TWordUtilBase.DocBookmarkText(dt : WordDocument; const bn, t : string);
var
  ut1: OLEVariant;
begin
  ut1:=bn;
  if  dt.Bookmarks.Exists( bn) then
  dt.Bookmarks.Item(ut1).Range.Text:=t;
  
end;

procedure TWordUtilBase.DocSave(dt : WordDocument);
begin
  dt.Save;
end;

procedure TWordUtilBase.DocSaveAs(dt : WordDocument; const fn : string);
var
  vt1, vb: OLEVariant;
begin
  vt1:=fn;
  vb:=false;
//  dt.SaveAs(vt1, EmptyParam, EmptyParam, EmptyParam, vb, EmptyParam, EmptyParam,
//         EmptyParam, EmptyParam, EmptyParam, EmptyParam );   for Word9
// Microsoft changed the interface again. The MS architect never think of changing the architech
// but expanding the very long long parameter snake.
  dt.SaveAs(vt1, EmptyParam, EmptyParam, EmptyParam, vb, EmptyParam, EmptyParam,
         EmptyParam, EmptyParam, EmptyParam, EmptyParam);//,EmptyParam, EmptyParam, EmptyParam, EmptyParam,EmptyParam );
end;




procedure TWordUtilBase.ForceCloseDoc(dt: WordDocument);
var
  ut1,  ut3: OLEVariant;
begin
  ut1:=wdDoNotSaveChanges; ut3:=false;
  dt.Close(ut1, Emptyparam, ut3);

end;

function TWordUtilBase.GetWordApp: TWordApplication;
begin
  if not Assigned(FWordApp) then
  begin
    FWordApp:=TWordApplication.Create(self);
    FWordApp.ConnectKind:=ckRunningOrNew;
    FWordApp.OnQuit := HandleQuit;
  end;

  //# Connect Word application. If not exists, launch it.
  try
    FWordApp.Connect;
    if not FWordApp.Visible then
      FWordApp.Visible:=true;
  except
    on e : Exception do
    begin
  //      showmessage(e.ClassName+'--'+e.Message);
      Application.ProcessMessages;
      sleep(2000);

      // If the user close Word application, "FWordApp.Connection" might raise exception,
      // so I have to do the following to launch the application again.
      FWordApp.Disconnect;
      FWordApp.Connect;
      if not FWordApp.Visible then
        FWordApp.Visible:=true;
    end;
  end;

  
  Result:=FWordApp;
end;


procedure TWordUtilBase.HandleQuit(Sender: TObject);
begin
  FreeAndNil( FWordApp);
end;

function TWordUtilBase.OpenWord(const fn : string=''; v : boolean=true):
        WordDocument;
var
  ut1, ut2, ut3, ut4, ut5, ut6, ut7, ut8, ut9, ut10, ut11, ut12: OLEVariant;
  temp: WordDocument;
begin

  ut1:=fn; ut2:=false; ut3:=false; ;ut4:=false; ut5:=''; ut6:='';
  ut7:=false; ut8:=''; ut9:=''; ut10:=wdOpenFormatAuto;   ut11:=0; ut12:=v;
  
  WordApp.Visible:=true;  // I don't know why ut12 does not work
  try
    temp:=WordApp.Documents.Open(ut1, EmptyParam, EmptyParam, ut4, EmptyParam, EmptyParam,
     EmptyParam, EmptyParam, EmptyParam, ut10, ut11, ut12);// EmptyParam, EmptyParam, EmptyParam);
    Result:=temp;
  except
    on e : SysUtils.Exception do
    begin
      showmessage(e.ClassName+'--'+e.Message);
      Result:=nil;
    end;
  
  end;
end;

procedure TWordUtilBase.WordAppDocumentChange(Sender: TObject);
begin
  if WordApp.Documents.Count<=0 then
  begin
  //    WordApp.Disconnect;
  //    WordApp.Free;
  //    WordApp:=nil;
  end;

end;

procedure TWordUtilBase.WordApplicationDocumentBeforeClose(Sender: TObject; var 
        Doc, Cancel: OleVariant);
begin
  {  if WordApp.Documents.Count<=1 then
    begin
      WordApp.Free;
      WordApp:=nil;
    end;}
  
end;

procedure TWordUtilBase.WordApplicationQuit(Sender: TObject);
begin
  {  if WordApp.Documents.Count<=0 then
    begin
      WordApp.Free;
      WordApp:=nil;
    end;}
  
end;


end.

