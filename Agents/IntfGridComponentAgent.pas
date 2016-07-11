{{
  Purpose:
    Abstract class for creating agent classes that create visual effects and components in a data grid.

  Programming tips:
    The basic techniques of handling data grid effects are from articles of delphi.about.com. 
}
unit IntfGridComponentAgent;

interface
uses
  classes, SysUtils, Windows, {$ifdef ver15} Types,{$endif}Controls,DbCtrls, Forms, db,
  DbGrids, Grids, Graphics,ExtCtrls;
type

  TGridComponentAgent = class(TComponent)
  private
    FColumn : TColumn;
  protected
    TheOwner : TCustomForm; // reference to the form. To access ActiveControl without typecast.
    TheGrid : TCustomDbGrid; // reference to client Grid
    TheCanvas : TCanvas;    // Reference to canvas of the grid. TCustomDbGrid does not publish Canvas, and TDbBrid typecase won't work

    ClientOnDrawColumnCell : TDrawColumnCellEvent;  // keep the reference to the client's event handling function
    ClientOnColExit : TNotifyEvent;
    ClientOnCellClick : TDBGridClickEvent;
//    ClientOnColEnter : TNotifyEvent;

    //: To keep the old handle. This component will have the grid regain focus after these database action.
    DatasetAfterInsert : TDataSetNotifyEvent;
    DatasetAfterDelete : TDatasetNotifyEvent;
    TheDataset : TDataset;

    FormOnDeactivate : TNotifyEvent;

    function GetColumn(AGrid : TCustomDbGrid; const FName : string) : TColumn;

    procedure SetColumn(const Value: TColumn); virtual;

    procedure SetVisible(const Value: boolean);  virtual; abstract;

    procedure HandleDatasetInsert(DataSet: TDataSet);
    procedure HandleDatasetDelete(DataSet: TDataSet);

    procedure HandleFormDeactivate(Sender  : TObject);

    {{ Draw something in current grid cell. Called by a client grind in OnDrawColumnCell handling function.
       It is up to this function to decide whether to draw. The client grid will just pass
       parameters in OnDrawColumnCell.
       Return true if the draw is done.
    }
    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; virtual; abstract;

    procedure HandleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                 Column: TColumn; State: TGridDrawState);
    procedure HandleColExit(Sender : TObject);
    procedure HandleCellClick(AColumn: TColumn);
//    procedure HandleColEnter(Sender : TObject);

    {{ Called in OnColExit of the client grid in order to hide the floating component if there is any.
       This function actually set Visible false.
    }
    procedure HideWhileNotSelected(SelectedField : TField); overload;
    procedure HideWhileNotSelected; overload;

    property Visible : boolean write  SetVisible;
    property Column : TColumn read FColumn write SetColumn;
  public
    {{ Wire the agent with the client grid. ACanvas must be the grid's canvas. Unfortunatly Canvas property is not published in TCustomDBGrid.
      AOwner is normally a TForm object.
    }
    Constructor Create(AOwner : TCustomForm;  AColumn : TColumn; AGrid : TCustomDBGrid);overload; //virtual;

    Constructor Create(AOwner : TCustomForm;  const FieldName : string; AGrid : TCustomDBGrid);overload;// virtual;

    destructor Destroy; override;

  end;

implementation

{ TGridComponentAgent }

constructor TGridComponentAgent.Create(AOwner: TCustomForm;
  AColumn: TColumn; AGrid: TCustomDBGrid);
begin
  inherited Create(Aowner);

  if AColumn=nil then
    raise Exception.Create('Baby, check the column definition for the grid');

  TheOwner := Aowner;
  TheGrid := AGrid;

  Column := AColumn;  // Must be here, because it might need to know theGrid.
//  AColumn.ReadOnly := true;  // To prevent the orignal column cell from being edited.

  // hijack event handlings of the grid. The client should not assign event handling functions at run time.

{  if (AGrid is TDBGrid) then
  begin   }
  // hopefully the authors of descendents of TCustomDbGrid simply published the properties.
     ClientOnDrawColumnCell := (AGrid as TDBGrid).OnDrawColumnCell;
     (AGrid as TDBGrid).OnDrawColumnCell := HandleDrawColumnCell;

     ClientOnColExit := (AGrid as TDBGrid).OnColExit;
     (AGrid as TDBGrid).OnColExit := HandleColExit;

     ClientOnCellClick :=  (AGrid as TDBGrid).OnCellClick;
     (AGrid as TDbGrid).OnCellClick := HandleCellClick;

{    ClientOnColEnter := (AGrid as TDBGrid).OnColEnter;
     (AGrid as TDBGrid).OnColEnter := HandleColEnter;  }

     FormOnDeactivate := (TheOwner as TForm).OnDeactivate;

     TheCanvas := (AGrid as TDBGrid).Canvas;
{  end
  else if (AGrid is TJvDbGrid) then
  begin
    ClientOnDrawColumnCell := (AGrid as TJvDBGrid).OnDrawColumnCell;
    (AGrid as TJvDBGrid).OnDrawColumnCell := HandleDrawColumnCell;

     ClientOnColExit := (AGrid as TJvDBGrid).OnColExit;
     (AGrid as TJvDBGrid).OnColExit := HandleColExit;

     TheCanvas := (AGrid as TJvDBGrid).Canvas;
  end
  else //: To support other descendents of TCustomDbGrid, just do some copy-paste jobs here.
    raise Exception.Create('This type of datagrid is not supported by TGridComponentAgent.');   }

  TheDataset :=  TheGrid.DataSource.DataSet;

  DatasetAfterInsert :=  TheDataSet.AfterInsert;
  DatasetAfterDelete := TheDataSet.AfterDelete;

  TheDataSet.AfterInsert := HandleDatasetInsert;
  TheDataSet.AfterDelete := HandleDatasetDelete;

  (TheOwner as TForm).OnDeactivate := HandleFormDeactivate;
end;

procedure TGridComponentAgent.HideWhileNotSelected(SelectedField: TField);
begin
  if SelectedField = Column.Field then     // when the column just exit, tha is you.
    Visible := false;
end;

procedure TGridComponentAgent.HandleDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Assigned(ClientOnDrawColumnCell) then
    ClientOnDrawColumnCell(Sender, Rect, DataCol, Column, State);

  Draw(Column, Rect, State);
end;

procedure TGridComponentAgent.HideWhileNotSelected;
begin
  HideWhileNotSelected(TheGrid.SelectedField);
end;

procedure TGridComponentAgent.SetColumn(const Value: TColumn);
begin
  FColumn := Value;
end;

procedure TGridComponentAgent.HandleColExit(Sender: TObject);
begin
  if Assigned(ClientOnColExit) then
    ClientOnColExit(Sender);

  HideWhileNotSelected;
end;

procedure TGridComponentAgent.HandleDatasetDelete(DataSet: TDataSet);
begin
  if Assigned(DatasetAfterDelete) then
    DatasetAfterDelete(Dataset);
end;

procedure TGridComponentAgent.HandleDatasetInsert(DataSet: TDataSet);
begin
  if Assigned(DatasetAfterInsert) then
    DatasetAfterInsert(Dataset);
end;

destructor TGridComponentAgent.Destroy;
begin
//  TheGrid.DataSource.DataSet.AfterInsert := DatasetAfterInsert;
//  TheGrid.DataSource.DataSet.AfterDelete := DatasetAfterDelete;
// I have to use TheDataset. Apparently Delphi might release TheGrid before release the agent

  TheDataSet.AfterInsert := DatasetAfterInsert;
  TheDataSet.AfterDelete := DatasetAfterDelete;
  inherited;
end;

procedure TGridComponentAgent.HandleFormDeactivate(Sender: TObject);
begin
  if Assigned(FormOnDeactivate) then
    FormOnDeactivate(Sender);

  Visible := false;
end;

constructor TGridComponentAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid);
begin
  Create(Aowner, GetColumn(AGrid, FieldName), AGrid);
end;

function TGridComponentAgent.GetColumn(AGrid : TCustomDbGrid; const FName: string): TColumn;
var
  i : integer;
begin
  Result := nil;
  for i := 0 to (AGrid as TDbGrid).Columns.Count -1 do
    if CompareText((AGrid as TDbGrid).Columns[i].FieldName, Fname) = 0 then
    begin
      Result := (AGrid as TDbGrid).Columns[i];
      break;
    end;

  if Result = nil  then
    raise Exception.Create('Can not find this field in the dbgrid: ' + Fname);

end;

procedure TGridComponentAgent.HandleCellClick(AColumn: TColumn);
begin
  if Assigned(ClientOnCellClick) then
    ClientONCellClick(AColumn);

  if AColumn.Field <> Column.Field then
    TheGrid.EditorMode := true;

end;

end.
