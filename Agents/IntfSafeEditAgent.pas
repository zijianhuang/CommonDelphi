{{
  Purpose:
    To handle basic tasks of a edit windows for a single table.
    The edit window may contain a query like "select * from atable where KeyField = :KeyField"

    In general, the query will hold only one record, unless the user append row. The KeyValue
    could be given by a lookup combobox in the window.

}
unit IntfSafeEditAgent;

interface
uses
  classes, AdoDb, db, Dialogs, Controls, IntfSafeEditTbl, SysUtils {$ifdef zeosok},ZDataset{$endif};
type
  TSafeEditAgent = class(TComponent, ISafeEditTbl)

  protected
    Dataset : TDataset;
    KeyValue : Variant;
    KeyField : string;

    procedure AssignParameter(const f : string; const v : Variant);

  public
    {{
      AOwner is normally the edit window that is responsible to free the agent.
      ADataset is the simple query of a query object that allow editing;
      A Field is the key parameter of the query locating a row. If AField='' then
      the query will return all rows.
    }
    constructor CreateForSafeEdit(AOwner : TComponent; ADataset : TDataset; const AField : string); overload;


    function ApplyChanges: boolean; virtual;
    function CheckChanges: boolean; virtual;
    procedure CancelChanges;   virtual;
    function Append: boolean; virtual;
    function Delete: boolean;   virtual;
    function OpenRecords: boolean;   overload;   virtual;
    function OpenRecords(const v : Variant) : boolean; overload;  virtual;

  end;
implementation
 uses Variants; 

{ TSafeEditAgent }

function TSafeEditAgent.Append: boolean;
begin
  CheckChanges;
  Dataset.Append;
end;

function TSafeEditAgent.ApplyChanges: boolean;
begin
  Result := false;
  try
    if Dataset.State in [dsEdit, dsInsert] then
    begin
      Dataset.Post;
      Result := True;
    end;
  except
    on e : Exception do
      MessageDlg( e.ClassName + '--' + e.Message, mtError, [mbOk], 0);
  end;
end;


procedure TSafeEditAgent.AssignParameter(const f: string;
  const v: Variant);
begin
  if (Dataset is TAdoQuery ) then
    (Dataset as TAdoQuery).Parameters.ParamByName(f).Value := v
{$ifdef zeosok}
  else if (Dataset is TZReadOnlyQuery) then
    (DAtaset as TZReadOnlyQuery).Params.ParamValues[f] := v
  else  if (Dataset is TZQuery) then
    (DAtaset as TZquery).Params.ParamValues[f] := v
{$endif}
  else
    raise Exception.Create('The dataset is not supported, or you need to change the compiler directive.');

end;

procedure TSafeEditAgent.CancelChanges;
begin
  Dataset.Cancel;
end;

function TSafeEditAgent.CheckChanges: boolean;
begin
  Result := False;
  if Dataset.Modified then
  begin
    if MessageDlg('Do you want to save the changes?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      Applychanges;
      Result := True;
    end
    else
      CancelChanges;
  end;
end;

constructor TSafeEditAgent.CreateForSafeEdit(AOwner: TComponent;
  ADataset: TDataset; const AField: string);
begin
  Create(AOwner);

  Dataset := ADataset;

  KeyField := AField;
  KeyValue := NULL;
end;

function TSafeEditAgent.Delete: boolean;
begin
  if MessageDlg('Do you want to delete?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Dataset.Delete;
end;

function TSafeEditAgent.OpenRecords: boolean;
begin
  CheckChanges;

  Dataset.Close;
  if KeyField<>'' then
    AssignParameter( KeyField, KeyValue);
//    Dataset.Parameters.ParamByName(KeyField).Value := KeyValue;
  Dataset.Open;
end;


function TSafeEditAgent.OpenRecords(const v: Variant): boolean;
begin
  KeyValue := v;
  OpenRecords;
end;

end.
