unit IntfInsideModalAgent;

interface

uses
  SysUtils, Classes, Forms, Controls,  ExtCtrls;

type
  TInsideModalAgent = class(TComponent)
  protected
    OldOnClose : TCloseEvent;
    ParentForm,
    ChildForm : TForm;
    pl : Tpanel;
    img : TImage;
    procedure HandleClose(Sender : TObject; var Action: TCloseAction);
  public
    constructor Create(AOwner , c : TForm); overload;
    procedure Show;
  end;

implementation

{ TInsideModalAgent }

constructor TInsideModalAgent.Create(AOwner, c: TForm);
begin
  inherited Create(AOwner);
  ParentForm :=  AOwner;
  ChildForm := c;
  OldOnClose := ChildForm.OnClose;
  ChildForm.OnClose := HandleClose;
end;

procedure TInsideModalAgent.HandleClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(OldOnClose) then
    OldOnClose(Sender, Action);

  FreeAndNil(ChildForm);

  Free;
end;

procedure TInsideModalAgent.Show;
begin
  img := TImage.Create(self);
  img.Width := ParentForm.ClientWidth;
  img.Height := ParentForm.ClientHeight;

  img.Picture.Assign(ParentForm.GetFormImage);

  pl := TPanel.Create(self);
  pl.Parent := ParentForm;
  pl.BevelInner := bvNone;
  pl.BevelOuter := bvNone;
  pl.Align := alClient;
  pl.BringToFront;

  img.Parent := pl;
  img.Align := alClient;
  img.BringToFront;

  ChildForm.Parent := pl;
  ChildForm.Show;
  ChildForm.BringToFront;

      repeat
        Application.HandleMessage;
      until ChildForm=nil;


end;

end.
 