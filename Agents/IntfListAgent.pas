{{
  Purpose:
    To turn a vcl lookup object into a db lookup list. The vcl objects like TListbox and TCombobox
    have a string list object that could be wired with TListAgent.

    The vcl object will show display values with keyvalue behind, the key value could be integer or string.

  Copyright (c) 2005  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang
}
unit IntfListAgent;

interface

uses
  SysUtils, Classes, db;

type
  TNodeObject = class(TObject)
  public
    dbid : int64;
    dbidstr : string;
    constructor Create(const id : int64); overload;
    constructor Create(const id : string); overload;
  end;

  TListAgentBase = class(TObject)
  private
    { Private declarations }
  protected
    TheList : TStringList;
    procedure ClearList;

    procedure BeginUpdate;
    procedure EndUpdate;
  public
    //: Wire TheList with a client string list object
    constructor Create(ClientList : TStringList);
    destructor Destroy; override; // must be free by the client codes, because this object has connection to a client vcl object, which may be free by client codes earlier

    //: Refresh the list with display values and key values  of the dataset , the key value is integer
    procedure RefreshFromDataset(ds : TDataset; const StrField, IdxField : string); virtual; abstract;
  end;

  //: for integer key value
  TListAgentInt=class(TlistAgentBase)
  public
    //: Add item with integer key value
    procedure AddItem(const s : string; const id : integer);
    function GetId(const idx : integer) : integer;

    procedure RefreshFromDataset(ds : TDataset; const StrField, IdxField : string); override;
  end;

  //: for string key value
  TListAgentStr=class(TlistAgentBase)
  public
    //: with string key value
    procedure AddItem(const s : string; const id : string);
    function GetId(const idx : integer) : string;

    procedure RefreshFromDataset(ds : TDataset; const StrField, IdxField : string);  override;

  end;

implementation


{ TListAgent }

procedure TListAgentInt.AddItem(const s: string; const id: integer);
begin
  TheList.AddObject(s, TNodeObject.Create(id) )
end;

procedure TListAgentStr.AddItem(const s, id: string);
begin
  TheList.AddObject(s, TNodeObject.Create(id) )
end;

procedure TListAgentBase.BeginUpdate;
begin
  TheList.BeginUpdate;
end;

procedure TListAgentBase.ClearList;
var
  i : integer;
begin
  for i := 0 to TheList.Count - 1 do
    TNodeObject( TheList.Objects[i]).Free;
  TheList.Clear;
end;

constructor TListAgentBase.Create(ClientList: TStringList);
begin
  inherited Create;
  TheList := ClientList;
end;


destructor TListAgentBase.Destroy;
begin
  ClearList;
  inherited;
end;

function TListAgentInt.GetId(const idx: integer): integer;
begin
   Result := TNodeObject( TheList.Objects[idx]).dbid;
end;

function TListAgentStr.GetId(const idx: integer): string;
begin
   Result := TNodeObject( TheList.Objects[idx]).dbidstr;
end;

procedure TListAgentInt.RefreshFromDataset(ds: TDataset;
  const StrField, IdxField: string);
begin
  BeginUpdate;
  ClearList;
  ds.First;
  while not ds.Eof do
  begin
    AddItem(ds.FieldByName(StrField).AsString, ds.FieldByName(IdxField).AsInteger);
    ds.Next;
  end;
  endUpdate;
end;

procedure TListAgentStr.RefreshFromDataset(ds: TDataset;
  const StrField, IdxField: string);
begin
  BeginUpdate;
  ClearList;
  ds.First;
  while not ds.Eof do
  begin
    AddItem(ds.FieldByName(StrField).AsString, ds.FieldByName(IdxField).AsString);
    ds.Next;
  end;
  EndUpdate;
end;

{ TNodeObject }

constructor TNodeObject.Create(const id: int64);
begin
  inherited Create;
  dbId := id;
end;

constructor TNodeObject.Create(const id: string);
begin
  inherited Create;
  dbIdStr := id;

end;

procedure TListAgentBase.EndUpdate;
begin
  TheList.EndUpdate;
end;

end.
