{{
  Purpose:
    To handle basic tasks of a search windows with defined GUI.

    The window must have TFrmSearchButtons object and implement ISearchQuery.

    The window need to define the SearchString property.
    
  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang
}
unit IntfSearchWinAgent;

interface
uses
  classes, Forms, Dialogs, SysUtils, Controls, IntfSearchQuery, FrameSearchButtons, AdoDb,
  IntfSortAgent;
type
  TSearchWinAgent = class(TComponent)
  private
    FSearchString: string;
    FSortAgent: TSortAgent;
    FFromTables: string;
    FAfterSearch: TNotifyEvent;
    FResultCount: integer;
    procedure SetFromTables(const Value: string);
    function GetFromTables: string;
    procedure SetAfterSearch(const Value: TNotifyEvent);
    function GetResultCount: integer;
  protected
    Buttons : TFrmSearchButtons;
    TheForm  : TForm;
    Intf : ISearchQuery;
    Dataset : TAdoQuery;
    CountDataset : TAdoQuery;

    SearchButtonEvent : TNotifyEvent;

    ClientOnClose : TCloseEvent;
  public
    {{
      AOwner is normally the edit window that is responsible to free the agent.
      ADataset is the simple query that allow editing;
      A Field is the key parameter of the query locating a row. If AField='' then
      the query will return all rows.

      @param AOwner The handle of the search window. A TForm object expected.
      @param OwnerInf The interface implemented by the window.
      @param sbuttons The buttons component of the window.
    }
    constructor CreateForSearch(AOwner : TForm; const OwnerInf : ISearchQuery; sbuttons : TFrmSearchButtons); overload;

    procedure Search;

    procedure HandleSearch(Sender : TObject);
    procedure HandleClearConditions(Sender : TObject);
    procedure HandleClose(Sender : Tobject);

    procedure HandleFormClose(Sender: TObject; var Action: TCloseAction);

    property SearchString : string read FSearchString write FSearchString;
    property SortAgent : TSortAgent read FSortAgent write FSortAgent;
    property FromTables : string read GetFromTables write SetFromTables;
    property AfterSearch : TNotifyEvent read FAfterSearch write SetAfterSearch;
    property ResultCount : integer read GetResultCount;
  end;


implementation
{ TSearchWinAgent }

constructor TSearchWinAgent.CreateForSearch(AOwner: TForm;
  const OwnerInf: ISearchQuery; sbuttons: TFrmSearchButtons);
begin
  Create(AOwner);
  TheForm := AOwner;

  Buttons := sbuttons;
  Intf := OwnerInf;

  Dataset := (Intf.GetDataset as TAdoQuery);

  if Buttons<>nil then
  begin
    SearchButtonEvent :=  buttons.BnSearch.OnClick;
    
    buttons.BnSearch.OnClick := HandleSearch;
    buttons.BnClearConditions.OnClick := HandleClearConditions;
    buttons.BnClose.OnClick := HandleClose;
  end;

  ClientOnClose := TheForm.OnClose;

  TheForm.OnClose := HandleFormClose;
  TheForm.BorderStyle := bsSingle;

end;

function TSearchWinAgent.GetFromTables: string;
begin
  Result := 'select count(*) as TheCount from '+ FFromTables;
end;

function TSearchWinAgent.GetResultCount: integer;
begin
  Result := FResultCount;
end;

procedure TSearchWinAgent.HandleClearConditions(Sender: TObject);
begin
  Intf.ClearConditions;
end;

procedure TSearchWinAgent.HandleClose(Sender: Tobject);
begin
  TheForm.close;
end;

procedure TSearchWinAgent.HandleFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(ClientOnClose) then
    ClientOnClose(Sender, Action);
    
  Action := caFree;
end;

procedure TSearchWinAgent.HandleSearch(Sender: TObject);
begin
  Search;
  if Assigned(SearchButtonEvent) then
    SearchButtonEvent(Sender);
end;

procedure TSearchWinAgent.Search;
  procedure GetResults;
  begin
    Dataset.Close;
    Dataset.Sql.Text := SearchString;
    Dataset.Open;

    if Dataset.Active then
      FResultCount := Dataset.RecordCount
    else
      FResultCount := 0;
  end;
begin
  Intf.DefineConditions;

  Screen.Cursor := crHourGlass;

  try
    if FFromTables <> '' then
    begin
      CountDataset.Close;
      CountDataset.SQL.Text := FromTables;
      CountDataset.Open;

      if CountDataset.FieldByName('TheCount').AsInteger > 1000 then
      begin
        if MessageDlg(Format('There will be %d records returned. Do you want to proceed?', [CountDataset.FieldByName('TheCount').AsInteger ])
                        , mtConfirmation, [mbYes, mbNo], 0)=mrYes then
          GetResults;
      end
      else
        GetResults;
    end
    else
      GetResults;

  except
 //   on e: Exception do
 //     WriteLogFile(e.ClassName + ' -- ' + e.Message + ' -- ' + SearchString);
  end;

  Screen.Cursor := crDefault;

  if Assigned(FSortAgent) then
    SortAgent.NoSort;

  if Assigned(AfterSearch) then
    AfterSearch(self);

end;

procedure TSearchWinAgent.SetAfterSearch(const Value: TNotifyEvent);
begin
  FAfterSearch := Value;
end;

procedure TSearchWinAgent.SetFromTables(const Value: string);
begin
  FFromTables :=  Value;
  if CountDataset= nil then
  begin
    CountDataset := TAdoQuery.Create(self);
    CountDataset.Connection := Dataset.Connection;
  end;
end;

end.
