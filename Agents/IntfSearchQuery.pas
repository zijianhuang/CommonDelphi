unit IntfSearchQuery;

interface
uses
  Db;
type
  {{
   Implemented by any search window. The BasicSearchString, conditions
   and clearConditions are very much depend on the GUI of the window. This interface
   is for communication between the window and the TSearchWinAgent object.
  }
  ISearchQuery = interface
    procedure ResetConditions;
    procedure DefineConditions;
    procedure ClearConditions;

    {{
     Return the query object used by the window.
     This must be a Query object with Sql.Text property. I don't want the interface
     and the window know about TAdoQuery or other db engine dependency. The dataset
     will by type casted inside the TSearchWinAgent. It is up to the agent decide which
     db engine to use. Thus, if db engine is changed, only the agent has to be modified,
     not the window and the interface.
    }
    function GetDataset : TDataset;
  end;


implementation


end.
