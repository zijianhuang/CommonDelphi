unit IntfGridRichEditAgent;

interface

uses
  JvRichEd, JvDBRichEd,classes, SysUtils, Windows, {$ifdef ver15}Types,{$endif}Controls,DbCtrls, DbGrids, Grids, Graphics,ExtCtrls,
        IntfGridComponentAgent, FormDbRichEdit, Forms, StdCtrls,  comctrls;
type
  TGridRichEditAgent = class(TGridComponentAgent)
  protected
    FReadOnly : boolean;

    MemoDb : TDBRichEdit;  // created in constructor;
    tempMemo : TRichEdit;

    procedure SetVisible(const Value: boolean);  override;
    function GetFirstLine(const s : string) : string;

    procedure HandlePopupExit(Sender : TObject; const s : string);
    procedure HandleDbMemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    
    function Draw(AColumn : TColumn; const ARect : TRect; State: TGridDrawState) : boolean; override;

    //: Popup an edit window. Return true if change is made.
    function Popup : boolean;

    //: Give MemoDb an event handling function for dbl-click
    procedure HandleDblClickOfMemoDb(Sender : TObject);
    procedure HandleExitOfMemoDb(Sender : Tobject);

    function ConvertRTFToText(const aString:string):string;
  public
    constructor Create(AOwner : TCustomForm; AColumn : TColumn; AGrid : TCustomDBGrid;
                const ReadOnly : boolean = false);   overload;
    // I don't like to depend on TCustomDbGrid.Readonly

    constructor Create(AOwner : TCustomForm; const FieldName : string; AGrid : TCustomDBGrid;
                const ReadOnly : boolean = false);  overload;
  end;

implementation
uses
  StrUtils;

function GetMemoControlRtf(MemoControl : TDbRichEdit) : string;
var
  ff : TStringStream;
begin
  ff := TStringStream.Create('');

  try
    MemoControl.PlainText := false;
    MemoControl.Lines.SaveToStream(ff);
    Result := ff.DataString;
  finally

    ff.Free;
  end;

end;

{ TGridRichEditAgent }

function TGridRichEditAgent.ConvertRTFToText(
  const aString: string): string;
var
  ss:tstringstream;
begin
  ss:= TStringstream.Create( aString );
  try
    tempMemo.PlainText := FALSE;
    tempMemo.Lines.LoadFromStream( ss );
  finally
    ss.free
  end;  
  Result := tempMemo.Text;

end;

constructor TGridRichEditAgent.Create(AOwner: TCustomForm; AColumn: TColumn;
  AGrid: TCustomDBGrid; const ReadOnly: boolean);
begin
  inherited Create(AOwner, AColumn, AGrid);

  tempMemo := TRichEdit.Create(AOwner);
  tempMemo.Parent := AOwner;
  tempMemo.Visible := false;

  MemoDb := TDbRichEdit.Create(AOwner);
  MemoDb.Parent := AGrid;
  MemoDb.Visible := false;
  MemoDb.Color := AColumn.Color;
  MemoDb.Font := AColumn.Font;

  MemoDb.Ctl3D := false;
  MemoDb.BorderStyle := bsNone;
  MemoDb.ScrollBars := ssNone;
  MemoDb.PlainText := false;

  MemoDb.Color := clYellow;
//  MemoDb.TabStop := false; did not work, becasue most wincontrols don't eat TAB
//  MemoDb.TabOrder := -1;
  MemoDb.WantTabs := true;  // to eat TAB then move to another column
  MemoDb.OnKeyDown :=  HandleDbMemoKeyDown;

  FReadOnly := ReadOnly;

//  if not ReadOnly then
//  begin
    MemoDb.DataSource := AGrid.DataSource;
    MemoDb.DataField := AColumn.FieldName;
    MemoDb.ReadOnly := true;


    MemoDb.OnClick := HandleDblClickOfMemoDb;
    MemoDb.OnExit := HandleExitOfMemoDb;
//  end;

end;

constructor TGridRichEditAgent.Create(AOwner: TCustomForm;
  const FieldName: string; AGrid: TCustomDBGrid; const ReadOnly: boolean);
begin
  Create(AOwner, GetColumn(AGrid, FieldName), AGrid, Readonly);
end;

function TGridRichEditAgent.Draw(AColumn: TColumn; const ARect: TRect;
  State: TGridDrawState): boolean;
var
  DrawRect: TRect;
//  kkfm : TFmDbRichEdit;
  p : TPoint;
 s : string;
begin
  Result := false;
  if AColumn.Field <> Column.Field then
    exit;

  if (gdFocused in State)   then
  begin
     MemoDb.Left := ARect.Left;
     MemoDb.Top := ARect.Top;
     MemoDb.Width := ARect.Right - ARect.Left-1;
     MemoDb.Height := ARect.Bottom - ARect.Top;
     Visible := True;
     
     MemoDb.WordWrap := false;
  end
  else
  begin
      DrawRect:=ARect;
      InflateRect(DrawRect,-1,-1);
      TheCanvas.FillRect(ARect);

      TheCanvas.TextRect(ARect, ARect.Left, ARect.Top, GetFirstLine( ConvertRtfToText(Column.Field.AsString)));
  end;

  Result := true;
end;

function TGridRichEditAgent.GetFirstLine(const s: string): string;
begin
  Result := LeftStr(s, POS(#13#10,s)-1 ) ;
  if Result = '' then
    Result := s;

end;

procedure TGridRichEditAgent.HandleDblClickOfMemoDb(Sender: TObject);
begin
  Popup;
end;

procedure TGridRichEditAgent.HandleDbMemoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_CONTROL then
    Popup
  else if Key = VK_TAB then
  begin
    if ssShift in Shift then
      TheGrid.SelectedIndex := TheGrid.SelectedIndex -1
    else
      TheGrid.SelectedIndex := TheGrid.SelectedIndex + 1;

    TheGrid.SetFocus;
  end;

end;

procedure TGridRichEditAgent.HandleExitOfMemoDb(Sender: Tobject);
begin
{  if MemoDb.Modified then
  begin
    Column.Field.AsString := GetMemoControlRtf( MemoDb);
  end;}

  Visible := false;

end;

procedure TGridRichEditAgent.HandlePopupExit(Sender: TObject; const s: string);
begin
    Column.Field.DataSet.Edit;
    Column.Field.AsString := s;

end;

function TGridRichEditAgent.Popup: boolean;
var
  p : TPoint;
  kkfm : TFmDbRichEdit;
begin                           
       p := TheGrid.ClientToScreen( Point(MemoDb.Left,  MemoDb.Top  ) );
       kkfm := TFmDbRichEdit.Create(self, Column.Field.AsString, HandlePopupExit, FReadOnly );
       kkfm.ShowAt(p.X, p.Y, MemoDb.Height, false , MemoDb.SelStart);

end;

procedure TGridRichEditAgent.SetVisible(const Value: boolean);
begin
  MemoDb.Visible := VAlue;
  if Value then
    TheOwner.ActiveControl := MemoDb;

end;

end.
