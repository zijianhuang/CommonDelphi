{{
  Purpose: Validate content in TEdit, TDbEdit and TField with regular expression.
}
unit IntfRegxAgent;

interface
uses
  classes, SysUtils, StdCtrls, Windows, {$ifdef ver15} Types,{$endif}Controls,DbCtrls, Forms, db,
  ExtCtrls, RegExpr;

type

  TRegxAgent = class(TComponent)
  private

    RegxEngine : TRegExpr;
    CharFilterEngine : TRegExpr;

    procedure SetRegx(const Value: string);
    function GetCharFilterRegx: string;
    function GetRegx: string;
    procedure SetCharFilterRegx(const Value: string);

  public
    constructor Create(AOwner : TComponent; AComponent : TComponent; const expr : string); overload; virtual;
    destructor Destroy; override;

    property Regx : string read GetRegx write SetRegx;
    property CharFilterRegx : string read GetCharFilterRegx write SetCharFilterRegx;
  end;

  //: Validate onExit. Exception will be raised if not fit.
  TRegxEditAgent = class(TRegxAgent)

  protected
    TheEdit : TEdit;

    OldOnExit : TNotifyEvent;

    procedure HandleExit(Sender : TObject);

  public
    constructor Create(AOwner : TComponent; AEdit : TCustomEdit; const expr : string); 
  end;

  {{ Validate on OnValidate event of the data field. If exception is raised, the data won't update the record buffer.
    In general, app developer should talk to the datafield of a dataset directly, or validate the data on
    server side.
  }
  TRegxDbEditAgent = class(TRegxAgent)

  protected
    TheEdit : TDbEdit;
    OldOnValidate : TFieldNotifyEvent;
    procedure HandleFieldValidate(Sender: TField);

  public
    constructor Create(AOwner : TComponent; AEdit : TDbEdit; const expr : string); overload;
    destructor Destroy; override;
  end;

  TRegxFieldAgent =  class(TRegxAgent)

  protected
    TheField : TField;
    OldOnValidate : TFieldNotifyEvent;
    procedure HandleFieldValidate(Sender: TField);
  public
    constructor Create(AOwner : TComponent; AField : TField; const expr : string); overload;
  end;

implementation

{ TRegxEditAgent }

constructor TRegxEditAgent.Create(AOwner: TComponent; AEdit: TCustomEdit; const expr : string);
begin
  inherited Create(Aowner, AEdit, expr);

  if not (AEdit is TEdit) then
    raise  Exception.Create('AEdit is not a TEdit descendent')
  else
  begin
    TheEdit := AEdit as TEdit;

    OldOnExit := TheEdit.OnExit;

    TheEdit.OnExit := HandleExit;

  end;

end;


procedure TRegxEditAgent.HandleExit(Sender: TObject);
begin
  if Assigned(OldOnExit) then
    OldOnExit(Sender);

  if not (RegxEngine.Exec(TheEdit.Text) and (Length(RegxEngine.Match[0])=Length(TheEdit.Text)) ) then
    raise Exception.Create('The value  is invalid: ' + TheEdit.Text);
end;

{ TRegxAgent }

constructor TRegxAgent.Create(AOwner: TComponent; AComponent: TComponent; const expr : string);
begin
  inherited Create(AOwner);
  RegxEngine := TRegExpr.Create;
  CharFilterEngine := TRegExpr.Create;
  Regx := expr;

end;

destructor TRegxAgent.Destroy;
begin
  RegxEngine.Free;
  CharFilterEngine.Free;
  inherited;
end;

function TRegxAgent.GetCharFilterRegx: string;
begin
  Result := CharFilterEngine.Expression;
end;

function TRegxAgent.GetRegx: string;
begin
  Result := RegxEngine.Expression;
end;

procedure TRegxAgent.SetCharFilterRegx(const Value: string);
begin
  CharFilterEngine.Expression := Value;
end;

procedure TRegxAgent.SetRegx(const Value: string);
begin
  RegxEngine.Expression := Value;
end;

{ TRegxDbEditAgent }

constructor TRegxDbEditAgent.Create(AOwner: TComponent; AEdit: TDbEdit;
  const expr: string);
begin
  inherited Create(AOwner, AEdit, expr);
  TheEdit := AEdit as TDbEdit;
  OldOnValidate := TheEdit.Field.OnValidate;
  TheEdit.Field.OnValidate := HandleFieldValidate;
end;

destructor TRegxDbEditAgent.Destroy;
begin
    try
      TheEdit.Field.OnValidate := OldOnValidate; // in case field is released earlier.
    except

    end;

  inherited;
end;

procedure TRegxDbEditAgent.HandleFieldValidate(Sender: TField);
begin
  if Assigned(OldOnValidate) then
    OldOnValidate(Sender);

  if not (RegxEngine.Exec(TheEdit.Text) and (Length(RegxEngine.Match[0])=Length(TheEdit.Text)) ) then
    raise Exception.Create('The value is invalid: ' + TheEdit.Text);

end;

{ TRegxFieldAgent }

constructor TRegxFieldAgent.Create(AOwner: TComponent; AField: TField;
  const expr: string);
begin
  inherited Create(AOwner, AField, expr);
  TheField := AField;
  OldOnValidate := TheField.OnValidate;
  TheField.OnValidate := HandleFieldValidate;

end;

procedure TRegxFieldAgent.HandleFieldValidate(Sender: TField);
begin
  if Assigned(OldOnValidate) then
    OldOnValidate(Sender);

  if not (RegxEngine.Exec( TheField.Text ) and (Length(RegxEngine.Match[0])=Length(TheField.Text)) ) then
    raise Exception.Create('The value is invalid: ' + TheField.Text);


end;

end.
