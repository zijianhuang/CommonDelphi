unit FnCommon;

interface

uses
  Classes, Controls, Forms, SysUtils, GlobalVar, DB, ADODB, ActnList;

function CreateNonModalForm(c: TFormClass; const mdi: boolean): TForm; overload;
function CreateNonModalForm(c: TFormClass): TForm; overload;

function FindClassFormInApp(c: TFormClass): TForm;

procedure SortFields(dataset: TDataset; const fieldnames: string);

function SafeData(const d: double): double; overload;
function SafeData(const d: single): single; overload;
function SafeData(const d: integer): integer; overload;
function SafeData(const d: string): string; overload;
  {{
    param pkname: Primary key or unique key
  }
function CopyAdoRecord(const pkname: string; q: TAdoQuery): boolean;

procedure RefreshDataset(const ds: TDataset);

//: Return the first line of lines
function FirstLine(const s: string): string;

procedure DisableAction(const a: TAction);
procedure DisableActionCategory(alist: TActionList; const c: string);


implementation

uses
  {$ifndef ver130}Variants,{$endif} StrUtils;

procedure DisableAction(const a: TAction);
begin
  a.Enabled := False;
  a.Visible := False;
end;

procedure DisableActionCategory(alist: TActionList; const c: string);
var
  i: integer;
begin
  for i := 0 to aList.ActionCount - 1 do
  begin
    if aList[i].Category = c then
    begin
      DisableAction(aList[i] as TAction)
    end
  end;

end;


function FirstLine(const s: string): string;
var
  p: integer;
begin
  p := pos(#13, s);
  if p > 0 then
  begin
    Result := LeftStr(s, p - 1)
  end
  else begin
    Result := s
  end;

end;

procedure RefreshDataset(const ds: TDataset);
begin
  ds.Close;
  ds.Open;
end;

function CopyAdoRecord(const pkname: string; q: TAdoQuery): boolean;
var
  temp: TAdoQuery;
  i:    integer;
  pkvalue: variant;
begin
  temp := TAdoQuery.Create(NIL);
  temp.Connection := q.Connection;
  temp.SQL.Text := q.SQL.Text;

  pkvalue := q.FieldValues[pkname];

  q.Append;
  temp.Parameters.ParamByName(pkname).Value := pkvalue;
  temp.Open;

  for i := 0 to q.FieldCount - 1 do
  begin
    if not q.Fields[i].ReadOnly then
    begin
      q.Fields[i].Value := temp.Fields[i].Value
    end;
  end;

  temp.Free;

  Result := True;

end;

function SafeData(const d: double): double; overload;
begin
  if d = NULL then
  begin
    Result := 0
  end
  else begin
    Result := d
  end;
end;

function SafeData(const d: single): single; overload;
begin
  if d = NULL then
  begin
    Result := 0
  end
  else begin
    Result := d
  end;
end;

function SafeData(const d: integer): integer; overload;
begin
  if d = NULL then
  begin
    Result := 0
  end
  else begin
    Result := d
  end;
end;

function SafeData(const d: string): string; overload;
begin
  if d = NULL then
  begin
    Result := ''
  end
  else begin
    Result := d
  end;
end;

procedure SortFields(dataset: TDataset; const fieldnames: string);
begin
  if (dataset is TCustomAdoDataset) then
  begin
    (dataset as TCustomAdoDataset).Sort := fieldnames
  end;
end;

function CreateNonModalForm(c: TFormClass; const mdi: boolean): TForm;
begin
  Result := FindClassFormInApp(c);

  if Result = NIL then
  begin
    Result := c.Create(Application);
    Result.BorderIcons := [biSystemMenu, biMinimize];
  Result.BorderStyle := bsSingle;
  Result.Position := poDefault;

    if mdi then
    begin
      Result.FormStyle := fsMdiChild
    end;

    Result.ShowHint := True;
  end
  else begin
    Result.WindowState := wsNormal
  end;
end;

function CreateNonModalForm(c: TFormClass): TForm; overload;
begin
  Result := CreateNonModalForm(c, StationSettings.MdiFormEnabled);
end;

function FindClassFormInApp(c: TFormClass): TForm;
var
  i: integer;
begin
  Result := NIL;

  for i := 0 to Screen.FormCount - 1 do
  begin
    if (Screen.Forms[i].ClassType = c) then
    begin
      Result := Screen.Forms[i];
      break;
    end
  end;

end;

end.
