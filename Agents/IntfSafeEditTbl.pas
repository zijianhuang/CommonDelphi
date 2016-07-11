unit IntfSafeEditTbl;

interface

type
  //: Implemented by any basic table edit window, in order to impose safe edit
  ISafeEditTbl = interface
    function ApplyChanges: boolean;

    {{
    Called inside Append, OpenRecords
    }
    function CheckChanges: boolean;
    procedure CancelChanges;
    function Append: boolean;
    function Delete: boolean;
    function OpenRecords: boolean;
  end;

implementation

end.
