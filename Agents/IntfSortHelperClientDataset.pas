unit IntfSortHelperClientDataset;
interface
uses
  IntfHelpers, db;
type
   TSortHelperClientDataset = class(TSortHelper)
   public
    class procedure SortSingle(dataset : TDataset;const f : string) ;  override;

   end;

implementation
uses
  dbclient, SysUtils;


{ TSortHelperZeos }

class procedure TSortHelperClientDataset.SortSingle(dataset : TDataset; const f: string);
begin
  if dataset is TClientDataset then
    (dataset as TClientDataset).IndexFieldNames := f
  else
    raise Exception.Create('Baby, this dataset class is not supported.');
end;


end.

