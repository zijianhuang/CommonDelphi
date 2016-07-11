unit IntfSortHelperCsvDataset;
interface
uses
  IntfHelpers, db;
type
   TSortHelperCsvDataset = class(TSortHelper)
   public
    class procedure SortSingle(dataset : TDataset;const f : string) ;  override;

   end;

implementation
uses
  JvCsvData, SysUtils, JclStrings;


{ TSortHelperZeos }

class procedure TSortHelperCsvDataset.SortSingle(dataset : TDataset; const f: string);
var
  SingleAsc : boolean;
begin
  SingleAsc :=  StrRight(f, 4) <> ' DESC';

  if dataset is TJvCustomCsvDataSet then
    (dataset as TJvCustomCsvDataSet).Sort(f, SingleAsc)
  else
    raise Exception.Create('Baby, this dataset class is not supported.');
end;


end.

