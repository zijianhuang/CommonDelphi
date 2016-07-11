unit gridexcel;
{
  Complement functions for InfoPower's wwDBGrid

  Default notification: [P]--Project
}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook,wwDBGrid,  db;

  // export visual content of the grid even with embedded lookup controls.
  procedure GridToExcel(g : TwwDBGrid);

  // internal use only
  function LookupBoxByName(fr : TComponent; const n : string) : TwwDBCustomLookupCombo;
  function GetFieldNameFromLookups(const i : integer; lookups: TStrings) : string;
  function GetLookupNameFromLookups(const i : integer; lookups: TStrings) : string;

implementation
uses
  DatasetExcel;

procedure GridToExcel(g: TwwDBGrid);
var
  gf : array of TField;
  titles, flds : array of string;
  datasets      : array of TDataset;
  i, k  : integer;
  f, d : TStringList;
  tl : TwwDBCustomLookupCombo;
begin
  SetLength(gf,  g.FieldCount);
  SetLength(titles, g.FieldCount);//GetColCount); somehow ColCount=FieldCount+1
  SetLength(flds,  g.FieldCount);
  SetLength(datasets,g.FieldCount);
  f:=TStringList.Create;
  d:=TStringList.Create;

  for i:=0 to  g.FieldCount-1 do
    gf[i]:=g.Fields[i];
  for i:=0 to  g.FieldCount-1 do
    titles[i]:=g.Columns[i].DisplayLabel;

// Get field names of field that has lookupcombo
 for i:=0 to g.ControlType.Count-1 do
    f.Add(GetFieldNameFromLookups(i, g.ControlType));
// Get names of lookupcombo
  for i:=0 to g.ControlType.Count-1 do
    d.Add(GetLookupNameFromLookups(i, g.ControlType));


{  for i:=0 to  g.FieldCount-1 do
  begin
    if f.IndexOf(g.Fields[i].FieldName)>=0 then
      flds[i]:=g.Fields[i].FieldName
    else
      flds[i]:='';
  end;}

  for i:=0 to  g.FieldCount-1 do
  begin

    k:= f.IndexOf(g.Fields[i].FieldName);
    if k>=0 then
    begin
      tl:=LookupBoxByName(g.Owner, d.Strings[k]);
      if tl<>nil then
      begin
        datasets[i]:=tl.LookupTable;
        flds[i]:=Copy(tl.Selected.Strings[0], 1, Pos(''#9'', tl.Selected.Strings[0])-1);
//        InputBox('oo', 'oo', flds[i]);
      end;
    end
    else
    begin
      datasets[i]:=nil;
      flds[i]:='';
    end;

  end;

  f.Free;
  d.Free;

 ExportDatasetToExcel(g.DataSource.Dataset , true,gf, titles, datasets, flds);
//  [nil, nil, CliDataMod.Event_StatusDS, CliDataMod.SupplierQDataset, nil, nil, nil, nil],
//  ['', '', 'Status', 'Name', '', '','', '']);

end;

function LookupBoxByName(fr : TComponent; const n : string) : TwwDBCustomLookupCombo;
var
  t : TComponent;
begin
  Result:=nil;
  t:=fr.FindComponent(n);
  if t<>nil then
    Result:=(t as TwwDBCustomLookupCombo);
end;

function GetFieldNameFromLookups(const i : integer; lookups: TStrings) : string;
begin
  Result:=Copy(lookups.Strings[i], 1, Pos(';', lookups.Strings[i])-1)
end;

function GetLookupNameFromLookups(const i : integer; lookups: TStrings) : string;
var
  t : string;
begin
  t:=lookups.Strings[i];
  delete(t, 1, Pos(';', t)+11);
  Result:=Copy(t, 1, Pos(';', t)-1);
end;


end.
