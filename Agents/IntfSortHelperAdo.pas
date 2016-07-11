unit IntfSortHelperAdo;
interface
uses
  IntfHelpers, db;
type
   TSortHelperAdo = class(TSortHelper)
   public
    class procedure SortSingle(dataset : TDataset;const f : string) ;  override;

   end;

implementation
uses
  AdoDb, SysUtils;


{ TSortHelperZeos }

class procedure TSortHelperAdo.SortSingle(dataset : TDataset; const f: string);
begin
  if dataset is TCustomAdoDataset then
    (dataset as TCustomAdoDataset).Sort := f
  else
    raise Exception.Create('Baby, this dataset class is not supported.');
end;


end.

