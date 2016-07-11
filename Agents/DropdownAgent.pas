unit DropdownAgent;

interface
uses
 Windows, Messages, SysUtils, {$ifdef ver150}Variants,{$endif} Classes, Graphics, Controls, Forms,
 Dialogs,  StdCtrls, ComCtrls, ExtCtrls, CommCtrl;

type
  TDropDownAgent = class(TComponent)
  protected
   procedure FormDeactivate(Sender: TObject);
   procedure FormDestroy(Sender: TObject);
   procedure AdjustFormPosition;  virtual;
 protected
   TheForm : TForm;
   TheControl : TControl;
   AppDeactivate : TNotifyEvent;
   FormChange  : TNotifyEvent;

   OldFormDeactivate,
   OldFormDestroy : TNotifyEvent;

   procedure handleAppDeactivate(Sender : TObject);
   procedure handleScreenChangeForm(Sender : TObject);

   procedure Init(AForm : TForm; const c: TControl); virtual;
 public
   constructor Create(AOwner : TForm; const c: TControl); overload ;
   procedure ShowForm; virtual;
   procedure HideForm; virtual;
 end;

 TDropDownAgentNA = class(TDropDownAgent)
 public
   procedure ShowForm; override;
   procedure HideForm; override;
 end;

 TDropDownInnerAgent = class(TDropDownAgent)
 protected
   parentForm : TForm;
   procedure AdjustFormPosition;  override;

   procedure HandleControlEnter(Sender : TObject);
   procedure HandleControlLeave(Sender : TObject);
 public
   //as the agent is owned by the form, so the caller does not need to free the agent
   constructor Create(AOwner : TForm; const c: TControl);
   procedure ShowForm; override;
 end;

implementation

function FindClassFormInApp(c : TFormClass) : TForm;
var
 i : integer;
begin
 Result := nil;

 for i :=0 to Application.ComponentCount -1 do
   if (Application.Components[i].ClassType = c ) then
   begin
     Result := TForm(Application.Components[i]);
     break;
   end;

end;
{ TDropDownAgent }

constructor TDropDownAgent.Create(AOwner: TForm; const c: TControl);
begin
  inherited Create(AOwner);

  Init(AOwner, c);
end;


//When the form should appear beside/below the control
procedure TDropDownAgent.AdjustFormPosition;
begin
  TheForm.Left := TheControl.ClientOrigin.X;
  TheForm.Top := TheControl.ClientOrigin.Y + TheControl.Height;

 if TheForm.Left+TheForm.Width > Screen.DesktopWidth then
   TheForm.Left := Screen.DesktopWidth - TheForm.Width;

 if TheForm.Top + TheForm.Height > Screen.DesktopHeight then
   TheForm.Top := TheForm.Top - TheControl.Height - TheForm.Height;

end;

//When the form deactivates, it should close
procedure TDropDownAgent.FormDeactivate(Sender: TObject);
begin
  if Assigned(OldFormDeactivate) then
    OldFormDeactivate(TheForm);
  TheForm.Hide;

end;

//When the form is destroyed, Application and Screen's handles should be restored
procedure TDropDownAgent.FormDestroy(Sender: TObject);
begin
 Application.OnDeactivate:= AppDeactivate ;

 Screen.OnActiveFormChange := FormChange;

 if Assigned(OldFormDestroy) then
   OldFormDestroy(TheForm);
end;

//When the application deactivates, the form will be closed then free.
procedure TDropDownAgent.handleAppDeactivate(Sender: TObject);
begin
 if Assigned(AppDeactivate) then
   AppDeactivate(TheForm);

   TheForm.Hide;

end;

procedure TDropDownAgent.handleScreenChangeForm(Sender: TObject);
begin
 if Assigned(FormChange) then
   FormChange(TheForm);

 if not TheForm.Active then
     TheForm.Hide;


end;

procedure TDropDownAgent.ShowForm;
begin
  AdjustFormPosition;
  Application.ProcessMessages;
  TheForm.Show;
end;

procedure TDropDownAgent.HideForm;
begin
  TheForm.Hide;
end;

procedure TDropDownAgent.Init(AForm: TForm; const c: TControl);
begin
   TheForm := AForm;
//  TheForm.FormStyle := fsStayOnTop;
  TheForm.BorderStyle := bsNone;

  TheControl := c;

  OldFormDeactivate := TheForm.OnDeactivate;
  OldFormdestroy := TheForm.OnDestroy;

  TheForm.OnDeactivate := FormDeactivate;
  TheForm.OnDestroy := FormDestroy;

 AppDeactivate := Application.OnDeactivate;

 FormChange := Screen.OnActiveFormChange;

 Application.OnDeactivate := HandleAppDeactivate;

 Screen.OnActiveFormChange := HandleScreenChangeForm;

end;

{ TDropDownInnerAgent }

procedure TDropDownInnerAgent.AdjustFormPosition;
begin
  inherited;
  TheForm.Left := TheControl.Left;
  TheForm.Top := TheControl.Top + TheControl.Height;
end;

constructor TDropDownInnerAgent.Create(AOwner: TForm; const c: TControl);
var
  f : TWinControl;
begin
  inherited Create(AOwner, c);

  f := c.Parent;
  while (f.Parent <> nil) do
    f := f.parent;

  parentForm := f as TForm;
  TheForm.Parent := parentForm;

end;

procedure TDropDownInnerAgent.HandleControlEnter(Sender: TObject);
begin
  ShowForm;
end;

procedure TDropDownInnerAgent.HandleControlLeave(Sender: TObject);
begin

end;

procedure TDropDownInnerAgent.ShowForm;
begin
  inherited;

end;

{ TDropDownAgentNA }

procedure TDropDownAgentNA.HideForm;
begin
  ShowWindow(TheForm.Handle, SW_Hide);
end;

procedure TDropDownAgentNA.ShowForm;
var
  i : integer;
begin
  AdjustFormPosition;
  Application.ProcessMessages;

  ShowWindow(TheForm.Handle, SW_SHOWNA);

  Application.ProcessMessages;
  for i := 0 to TheForm.ControlCount - 1 do
    if (TheForm.Controls[i] is TWinControl) then
    begin
     ShowWindow((TheForm.Controls[i] as TWinControl).Handle, SW_Show);

    end;

    
end;

end.
