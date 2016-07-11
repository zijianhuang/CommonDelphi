{{
  Purpose:
    To handle basic tasks of a edit window for a table.

    This subclass of TSafeEditAgent is particularly for a edit window with TFrmBasicTblButtons component.
    And, wire the event handling functions of the button panel with the db oeprations.

    This agent also control some layout properties of the owner.

  Programming tips:
    If you want to handle the event handling inside the edit window, you may either use
    TSafeEditAgent, or pass nil to TblButtons parameter of the constructor.

    In many tables, there are three bookmark fields: DateCreated, DateUpdated and EmpUpdated. At the moment
    the JSystem program is responsible to update these fields. In long run, DateCreated and DateUpdated will be
    better modified by trigers of the db engine. Before refactoring the database for this purpose,
    a dirty solution will be used temporarily.

    It is assumed that the owner of TSafeEditTblWinAgent is a TForm object.

    If the TForm object want to handle OnClose and OnShow event not by the agent,
    Just manually wire event handling functions after the construction of the agent
    in the TForm object. See FormEmployee for example.

}
unit IntfSafeEditTblWinAgent;

interface
uses
  Classes, IntfSafeEditAgent, FrameTblButtons,  DB, SysUtils, Forms, Graphics;

type
  TSafeEditTblWinAgent = class (TSafeEditAgent)
  private
    FAfterInsert: TDatasetNotifyEvent;
    FAfterPost: TDatasetNotifyEvent;
    FBeforeDelete: TDatasetNotifyEvent;
    FBeforePost: TDatasetNotifyEvent;
    FAfterChange : TDatasetNotifyEvent;
    FAfterDelete: TDatasetNotifyEvent;
    FAfterOpen: TDatasetNotifyEvent;
    procedure SetLookupDataset(const Value: TDataset);
    function GetLookupDataset: TDataset;
    procedure SetAfterInsert(const Value: TDatasetNotifyEvent);
    procedure SetAfterPost(const Value: TDatasetNotifyEvent);
    procedure SetBeforeDelete(const Value: TDatasetNotifyEvent);
    procedure SetBeforePost(const Value: TDatasetNotifyEvent);
    procedure SetAfterChange(const Value: TDAtasetNotifyEvent);
    procedure SetAfterDelete(const Value: TDatasetNotifyEvent);
    procedure SetAfterOpen(const Value: TDatasetNotifyEvent);

  protected
    FLookupDataset : TDataset;
    JustInserted : boolean;

    //: Reference to the button panel of the client form
    Buttons : TFrmBasicTblButtons;

    //: Reference to the client form
    TheForm : TForm;

    //: Keep the original references of event handling functions of the client
    FormOnClose : TCloseEvent;
    FormOnShow : TNotifyEvent;

    {{
      Keep the original referneces of event handling function of the dataset. The
      event handlings functions defined internally will all these event handlings first or last.
    }
    DatasetAfterOpen,
    DatasetBeforePost ,
    DatasetAfterInsert ,
    DatasetAfterPost,
    DatasetBeforeDelete,
    DatasetAfterDelete : TDatasetNotifyEvent;

    BeforePostHandler : TdatasetNotifyEvent;

    //: These functions define the behavior of the buttons.
    procedure HandleAppend(Sender : TObject);
    procedure HandleCancel(Sender : TObject);
    procedure HandleApply(Sender : TObject);
    procedure HandleDelete(Sender : TObject);
    procedure HandleClose(Sender : Tobject);

    //: Hopefully the client won't change the event handling
    procedure HandleAfterDelete(sender : TDataset);
    procedure HandleAfterInsert(Sender : Tdataset);
    procedure HandleAfterPost(sender : TDataset);
    procedure HandleBeforePost(sender : TDataset);

    //: These functions define new behivor of the client form while keeping the original ones.
    procedure HandleFormClose(Sender: TObject; var Action: TCloseAction);
    procedure HandleFormShow(Sender: TObject);

  public
    {{ TblButtons is the button panel. The agent will assign some default behavior to the buttons.
      You may pass nil not to wire event handling functions with the buttons.

      The agent will have the Form/window object as owner, and hijack OnShow and OnClose of
      the TForm object. OnShow will run OpenRecords then execute the original event handling function
      of the TForm object. OnClose will check whether the data is saved.


      The client program may assign a BeforePostHandler to the dataset, for example,
      in order to edit timestamps
    }
    constructor CreateForSafeEdit(AOwner : TForm; ADataset : TDataset; const AField : string;
      TblButtons : TFrmBasicTblButtons; const ABeforePostHandler : TDatasetNotifyEvent = nil ); overload;

    destructor Destroy; override;

    function ApplyChanges: boolean; override;
    function Delete : boolean; override;


    procedure Execute(v : Variant);



    //: The dataset that looks up the Agent's dataset, normally this is associated to a lookup combobox.
    property LookupDataset : TDataset read GetLookupDataset write SetLookupDataset;

    {{ As the agent keeps original reference of dataset's event handling functions,
      The client may assign event handling functions to these properties in order to
      add more handlings upon the dataset.

      OnAfterDelete and OnAfterPost might trigger OnAfterChange event.

    }
    property OnAfterInsert : TDatasetNotifyEvent read FAfterInsert write SetAfterInsert;
    property OnAfterPost  : TDatasetNotifyEvent read FAfterPost write SetAfterPost;
    property OnBeforeDelete : TDatasetNotifyEvent read FBeforeDelete write SetBeforeDelete;
    property OnAfterDelete : TDatasetNotifyEvent read FAfterDelete write SetAfterDelete;
    property OnBeforePost : TDatasetNotifyEvent read FBeforePost write SetBeforePost;
    property OnAfterOpen : TDatasetNotifyEvent read FAfterOpen write SetAfterOpen;

    //: Occur with "AfterInsert" and "AfterDelete" of the dataset; and modification as well.
    property OnAfterChange : TDAtasetNotifyEvent read FAfterChange write SetAfterChange;
  end;
implementation

{ TSafeEditTblWinAgent }

function TSafeEditTblWinAgent.ApplyChanges: boolean;
begin
  Result := inherited ApplyChanges;

  if LookupDataset <> nil then
  begin
    LookupDataset.Close;
    LookupDataset.Open;
  end;
//    LookupDataset.Refresh;
end;

constructor TSafeEditTblWinAgent.CreateForSafeEdit(AOwner: TForm;
  ADataset: TDataset; const AField: string;
  TblButtons: TFrmBasicTblButtons; const ABeforePostHandler : TDatasetNotifyEvent);
begin
  //: Wire with the client
  CreateForSafeEdit(AOwner, Adataset, AField);
  Buttons := TblButtons;
  TheForm := Aowner;

  BeforePostHandler := ABeforePostHandler;

  //: Define default behavour for the buttons
  if Buttons<>nil then
  begin
    buttons.BnAppend.OnClick := HandleAppend;
    buttons.BnApply.OnClick := HandleApply;
    buttons.BnCancel.OnClick := HandleCancel;
    buttons.BnDelete.OnClick := HandleDelete;

    buttons.BnClose.OnClick := HandleClose;
  end;

  FormOnClose := AOwner.OnClose;
  FormOnShow := AOwner.OnShow;

  //: Define default behavour for the form
  AOwner.OnShow := HandleFormShow;
  AOwner.OnClose := HandleFormClose;
  AOwner.BorderStyle := bsSingle;


  //: Keep the original handlings to inherite and to recover. The destroy function will recover them.
  DatasetAfterOpen := Dataset.AfterOpen;
  DatasetBeforePost:=Dataset.BeforePost;
  DatasetAfterInsert:= Dataset.AfterInsert;
  DatasetAfterPost:=Dataset.AfterPost;
  DatasetBeforeDelete:=Dataset.BeforeDelete;
  DatasetAfterDelete:=Dataset.AfterDelete ;

  //: Change the behavior of the dataset, with internal handling. The orginal handlings will still be run
  OnAfterDelete := HandleAfterDelete;
  OnAfterInsert := HandleAfterInsert;
  OnAfterPost := HandleAfterPost;
  OnBeforePost := HandleBeforePost;

end;

function TSafeEditTblWinAgent.Delete: boolean;
begin
  Result := inherited delete;
  if LookupDataset <> nil then
  begin
    LookupDataset.Close;
    LookupDataset.Open;
  end;

end;

destructor TSafeEditTblWinAgent.Destroy;
begin
//  if Assigned(DatasetBeforePost) then
  Dataset.BeforePost := DatasetBeforePost;

  Dataset.AfterOpen := DatasetAfterOpen;

//  if Assigned(DatasetAfterInsert) then
  Dataset.AfterInsert := DatasetAfterInsert;

//  if Assigned(DatasetAfterPost) then
  Dataset.AfterPost := DatasetAfterPost;

//  if Assigned(DatasetBeforeDelete) then
  Dataset.BeforeDelete := DatasetBeforeDelete;

//  if Assigned(DatasetAfterDelete) then
  Dataset.AfterDelete := DatasetAfterDelete;

  inherited;
end;

procedure TSafeEditTblWinAgent.Execute(v: Variant);
begin
  OpenRecords(v);
  (Owner as TForm).Show;
end;

function TSafeEditTblWinAgent.GetLookupDataset: TDataset;
begin
  Result := FLookupDataset;
end;

procedure TSafeEditTblWinAgent.HandleAfterDelete(sender: TDataset);
begin
  if Assigned(DatasetAfterDelete) then
    DatasetAfterDelete(Sender);

  if Assigned(OnAfterChange) then
    OnAfterChange(Sender);
end;

procedure TSafeEditTblWinAgent.HandleAfterInsert(Sender: Tdataset);
begin
  if Assigned(DatasetAfterInsert) then
    DatasetAfterInsert(Sender);

  JustInserted := true;
end;

procedure TSafeEditTblWinAgent.HandleAfterPost(sender: TDataset);
begin
  if Assigned(DatasetAfterPost) then
    DatasetAfterPost(Sender);

  if JustInserted then
  begin
    JustInserted := false;
  end;

  if Assigned(OnAfterChange) then
    OnAfterChange(Sender);
end;

procedure TSafeEditTblWinAgent.HandleAppend(Sender: TObject);
begin
  Append;
end;

procedure TSafeEditTblWinAgent.HandleApply(Sender: TObject);
begin
  ApplyChanges
end;

procedure TSafeEditTblWinAgent.HandleBeforePost(sender: TDataset);
begin
  if Assigned(BeforePostHandler) then
    BeforePostHandler(Sender);
    
  if Assigned(DatasetBeforePost) then
    DatasetBeforePost(Sender);
end;

procedure TSafeEditTblWinAgent.HandleCancel(Sender: TObject);
begin
  CancelChanges;
end;

procedure TSafeEditTblWinAgent.HandleClose(Sender: Tobject);
begin
  TheForm.close;
end;

procedure TSafeEditTblWinAgent.HandleDelete(Sender: TObject);
begin
  Delete;
end;

procedure TSafeEditTblWinAgent.HandleFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CheckChanges;
  Action := caFree;

  if Assigned(FormOnClose) then
    FormOnClose(Sender, Action);
end;

procedure TSafeEditTblWinAgent.HandleFormShow(Sender: TObject);
begin
  if Assigned( FormOnShow) then
    FormOnShow(Sender);

  OpenRecords;

end;

procedure TSafeEditTblWinAgent.SetAfterChange(const Value: TDAtasetNotifyEvent);
begin
  FAfterChange := Value;
end;

procedure TSafeEditTblWinAgent.SetAfterDelete(const Value: TDatasetNotifyEvent);
begin
  FAfterDelete := Value;
//  DatasetAfterDelete :=  Dataset.AfterDelete;
  Dataset.AfterDelete := Value;
end;

procedure TSafeEditTblWinAgent.SetAfterInsert(const Value: TDatasetNotifyEvent);
begin
  FAfterInsert := Value;
//  DatasetAfterInsert := Dataset.AfterInsert;
  Dataset.AfterInsert := Value;

end;

procedure TSafeEditTblWinAgent.SetAfterOpen(
  const Value: TDatasetNotifyEvent);
begin
  FAfterOpen := Value;
end;

procedure TSafeEditTblWinAgent.SetAfterPost(const Value: TDatasetNotifyEvent);
begin
  FAfterPost := Value;
//  DatasetAfterPost := Dataset.AfterPost;
  Dataset.AfterPost := Value;
end;

procedure TSafeEditTblWinAgent.SetBeforeDelete(const Value: TDatasetNotifyEvent);
begin
  FBeforeDelete := Value;
//  DatasetBeforeDelete := Dataset.BeforeDelete;
  Dataset.BeforeDelete := Value;
end;

procedure TSafeEditTblWinAgent.SetBeforePost(const Value: TDatasetNotifyEvent);
begin
  FBeforePost := Value;
//  DatasetBeforePost := Dataset.BeforePost;
  Dataset.BeforePost := Value;
end;

procedure TSafeEditTblWinAgent.SetLookupDataset(const Value: TDataset);
begin
  FLookupDataset := Value;
end;

end.
