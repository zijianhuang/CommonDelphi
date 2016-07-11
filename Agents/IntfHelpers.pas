unit IntfHelpers;
//: Define a set of abstract builders
interface
uses
 db;

type
   //: to help the sort agent to deal with different types of dataset, with different interfaces of sorting
   TSortHelper = class
   public
    class procedure SortSingle(dataset : TDataset; const f : string) ; virtual; abstract;

   end;
implementation

end.
 