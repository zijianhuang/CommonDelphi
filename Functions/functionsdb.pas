unit functionsdb;

interface
uses
  Controls, Db,  stdctrls,  dbgrids, ExtCtrls, dbctrls, adodb,

  DBClient, ZDataset {$IFNDEF VER130}, Variants {$endif};

  // Locate with loCaseInsensitive
  function LocateDatasetByKey(ds : TDataset; const fld : string; fvalue : Variant) : boolean;

  // Sort the dataset by field names. (To do the job with other dataset, add more is/as statements)
//  procedure SortDatasetByNames(ds : TDataset; const ixnames : string);

  // [P] Get a field value by 'refno'
  function GetRefData(ds: TDataset; const ref : integer; const fdn: string): Variant;

  // [P] Get 'refno' by field value; return NULL if not found
  function GetDataRef(ds: TDataset; const fld : string; const fldvalue: Variant): Variant;

  function CopyDataset(source, dest : TDataset) : boolean; // both should have the same fields, and in edit state


implementation

function CopyDataset(source, dest : TDataset) : boolean;
var
  i : integer;
begin
  for i:=0 to source.FieldCount-1 do
    if dest.Fields[i].datatype<>ftAutoInc then
    begin
      if dest.Fields[i].datatype=ftBlob then
      begin
{         GetMem(myBuffer, Source.Fields.Fields[i].DataSize);
         try
            if Source.Fields.Fields[i].GetData(myBuffer) then
               Dest.Fields.Fields[i].SetData(myBuffer);
         finally
            FreeMem(MyBuffer,Source.Fields.Fields[i].DataSize);

         end;
         dest.Fields[i].value:=source.Fields[i].AsString;
         ShowMessage(IntToStr(length(dest.Fields[i].AsString)));} // leave it alone, not worthy to copy blob. Leave the puzzle to the future;
      end
      else
        dest.FieldValues[dest.Fields[i].FieldName]:=Source.FieldValues[Source.Fields[i].FieldName];
    end;
end;

function GetDataRef(ds: TDataset; const fld : string; const fldvalue: Variant): Variant;
var
  t : TBookmark;
begin
  t:=ds.GetBookmark;
  if ds.Locate(fld, fldvalue, [loCaseInsensitive]) then
    Result:=ds.FieldValues['refno']
  else
    Result:=NULL;

  ds.GotoBookmark(t);

  ds.FreeBookmark(t);
end;

{procedure SortDatasetByNames(ds : TDataset; const ixnames : string);
begin
  if (ds is TCustomAdoDataset) then
    (ds as TCustomAdoDataset).Sort:=ixnames
  else if ds is TClientDataset then
    (ds as TClientDataset ).IndexFieldNames:=ixnames
  else if ds is TZQuery then
    (ds as TZQuery).SortedFields := ixnames;
end; }

function GetRefData(ds: TDataset; const ref : integer; const fdn: string): Variant;
begin
  Result:=ds.Lookup('refno', ref, fdn)
end;


function LocateDatasetByKey(ds: TDataset; const fld: string;
  fvalue: Variant): boolean;
begin
  Result:=ds.Locate( fld, VarArrayOf([fvalue]), [loCaseInsensitive]);
end;

end.
