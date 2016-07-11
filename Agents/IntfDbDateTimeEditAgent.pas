{{
  Purcase: Make the agent and the edit box become db aware.
}
unit IntfDbDateTimeEditAgent;

interface
uses
  Classes, StdCtrls, DbCtrls, Db, IntfDatetimeEditAgent;
type
  TDbDateTimeEditAgent = class(TDateTimeEditAgent)
  private
    FDataSource: TDataSource;
    FFieldName: string;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetFieldName(const Value: string);
  protected
    DataLink : TFieldDataLink;
    JustEnterEditState : boolean;
    //: for the datalink
    procedure HandleDataChange(Sender : TObject);
    procedure HandleEditingChange(Sender : TObject);

    procedure HandleEditModified(Sender : TObject);
  public
    constructor Create(Aowner : TComponent; AEd : TEdit; const ForDatetime : boolean = true; const MY : boolean=false); override;
    destructor Destroy; override;

    procedure RefreshEdit; override;


    property DataSource : TDataSource read FDataSource write SetDataSource;
    property FieldName : string read FFieldName write SetFieldName;
  end;
implementation

{ TDbDateTimeEditAgent }

constructor TDbDateTimeEditAgent.Create(Aowner: TComponent; AEd: TEdit; const ForDatetime : boolean; const MY : boolean );
begin
  inherited Create(Aowner, AEd, ForDatetime, MY);
  DataLink := TFieldDataLink.Create;
  DataLink.Control := AEd;
  DataLink.OnDataChange := HandleDataChange;
  DataLink.OnEditingChange := HandleEditingChange;

  self.OnModified := HandleEditModified;

  JustEnterEditState := false;

end;

destructor TDbDateTimeEditAgent.Destroy;
begin
  DataLink.Free;

  inherited;
end;

procedure TDbDateTimeEditAgent.HandleDataChange(Sender: TObject);
begin
  if DataLink.Field <> nil then
  begin
    if not JustEnterEditState then
    begin
      SetDateTime( DataLink.Field.AsDateTime);
      RefreshEdit;
    end
    else
      JustEnterEditState := false;
  end;

end;

procedure TDbDateTimeEditAgent.HandleEditingChange(Sender: TObject);
begin
  if DataLink.Field <> nil then
    JustEnterEditState := ( DataLink.Field.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TDbDateTimeEditAgent.HandleEditModified(Sender: TObject);
begin
  if DataLink.Field <> nil then
  begin
    DataLink.DataSet.Edit;
    DataLink.Field.AsDateTime := GetDateTime;
  end;
end;

procedure TDbDateTimeEditAgent.RefreshEdit;
var
  i : integer;
  SelStart, SelLen : integer;
begin

  SelStart := ed.SelStart;
  SelLen := ed.SelLength;

  Ed.Clear;
  for i := 0 to TheList.Count - 1 do
  begin
    Ed.SelStart := (TheList.Items[i] as TTimeMark).LowPosition;
    Ed.SelText := (TheList.Items[i] as TTimeMark).Value;
  end;

  if (DataLink.Field = nil) or
   (( not (DataLink.Field.DataSet.State in [dsEdit, dsInsert])) and (YearSegment.IntValue = 1899) and (not Ed.Focused) )  then
  begin
    Ed.Clear;
    for i := 0 to TheList.Count - 1 do
    begin
      Ed.SelStart := (TheList.Items[i] as TTimeMark).LowPosition;
      if (TheList.Items[i] is TTimeSegment) then
        Ed.SelText := '    '
      else
        Ed.SelText := (TheList.Items[i] as TTimeMark).Value;
    end;
  end;

  Ed.SelStart := SelStart;
  Ed.SelLength := SelLen;

end;

procedure TDbDateTimeEditAgent.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
  DataLink.DataSource := Value;
end;

procedure TDbDateTimeEditAgent.SetFieldName(const Value: string);
begin
  FFieldName := Value;
  DataLink.FieldName := Value;
end;

end.
 