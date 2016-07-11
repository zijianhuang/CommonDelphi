unit InTextBoxLabelAgent;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, TntStdCtrls, Graphics;

type
  TInTextBoxLabel = class(TComponent)
  protected
    box: TTntEdit;
    hint: widestring;
    theLabel: TTntLabel;

    OldEnter, OldLeave, OldTextChanged: TNotifyEvent;

    procedure box_TextChanged(Sender: TObject);
    procedure label_Click(Sender: TObject);
    procedure box_Leave(Sender: TObject);
    procedure box_Enter(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; abox: TTntEdit; const ahint: widestring); overload;
  end;

  {
    Generally created by client when entering an empty text box, and it will free itself when
    leaving the text box, and recover the hijacked event handlings.
  }
  TInTextBoxHint = class(TComponent)
  protected
    box: TTntEdit;
    hint: widestring;
    theLabel: TTntLabel;

    OldLeave, OldTextChanged: TNotifyEvent;

    procedure box_TextChanged(Sender: TObject);
    procedure box_Leave(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; abox: TTntEdit; const ahint: widestring); overload;
    destructor Destroy; override;
  end;

implementation


{ InTextBoxLabel }

procedure TInTextBoxLabel.box_Enter(Sender: TObject);
begin
  if Assigned(OldEnter) then
    OldEnter(Sender);

  theLabel.Hide;
end;

procedure TInTextBoxLabel.box_Leave(Sender: TObject);
begin
  if Assigned(OldLeave) then
    OldLeave(Sender);

  if (box.Text = '') then
    theLabel.Show;
end;

procedure TInTextBoxLabel.box_TextChanged(Sender: TObject);
begin
  if Assigned(OldTextChanged) then
    OldTextChanged(Sender);

  if (box.Text <> '') then
    theLabel.Hide
  else if ( not box.Focused) then
    theLabel.Show;

end;

constructor TInTextBoxLabel.Create(AOwner: TComponent; abox: TTntEdit;
  const ahint: widestring);
begin
  inherited Create(AOwner);
  box  := abox;
  hint := ahint;

  OldEnter := abox.OnEnter;
  OldLeave := abox.OnExit;
  OldTextChanged := abox.OnChange;

  box.OnChange := box_TextChanged;
  box.OnEnter  := box_Enter;
  box.OnExit   := box_Leave;

  theLabel      := TTntLabel.Create(self);
  theLabel.Left := 2;
  theLabel.Caption := hint;
  theLabel.Font.Color := clActiveBorder;
  theLabel.Parent := box;
  theLabel.Align := alClient;
  theLabel.OnClick := label_Click;

  if (box.Text = '') then
    theLabel.Show;
end;


procedure TInTextBoxLabel.label_Click(Sender: TObject);
begin
  theLabel.Hide;
  box.SetFocus;
end;

{ TInTextBoxHint }


procedure TInTextBoxHint.box_Leave(Sender: TObject);
begin
  if Assigned(OldLeave) then
    OldLeave(Sender);

  Free;
end;

procedure TInTextBoxHint.box_TextChanged(Sender: TObject);
begin
  if Assigned(OldTextChanged) then
    OldTextChanged(Sender);

  if (box.Text <> '') then
    theLabel.Hide
  else
    theLabel.Show;

end;

constructor TInTextBoxHint.Create(AOwner: TComponent; abox: TTntEdit;
  const ahint: widestring);
begin
  inherited Create(AOwner);
  box  := abox;
  hint := ahint;

  OldLeave := abox.OnExit;
  OldTextChanged := abox.OnChange;

  box.OnChange := box_TextChanged;
  box.OnExit   := box_Leave;

  theLabel      := TTntLabel.Create(self);
  theLabel.Left := 2;
  theLabel.Caption := hint;
  theLabel.Font.Color := clActiveBorder;
  theLabel.Parent := box;
  theLabel.Align := alClient;

  if (box.Text = '') then
    theLabel.Show;

end;


destructor TInTextBoxHint.Destroy;
begin
  if ( not (csDestroying in Owner.ComponentState)) then
  begin
    box.OnChange := oldTextChanged;
    box.OnExit   := oldLeave;
  end;

  inherited;
end;

end.

