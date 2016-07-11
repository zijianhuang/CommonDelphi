unit IntfSortHelperZeos;
interface
uses
  IntfHelpers, db;
type
   TSortHelperZeos = class(TSortHelper)
   public
    class procedure SortSingle(dataset : TDataset;const f : string) ;  override;

   end;

implementation
uses
  ZAbstractRODataset, SysUtils;


{ TSortHelperZeos }

class procedure TSortHelperZeos.SortSingle(dataset : TDataset; const f: string);
begin
  if dataset is TZAbstractRODataset then
    (dataset as TZAbstractRODataset).SortedFields := f
  else
    raise Exception.Create('Baby, this dataset class is not supported.');
end;


end.
 