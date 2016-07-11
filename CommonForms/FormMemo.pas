unit FormMemo;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130} Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type

  TDbMemoExit = procedure (Sender : TObject; const s : string) of Object;

  TFmMemo = class(TForm)
    BnOk: TButton;
    BnCancel: TButton;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure BnCancelClick(Sender: TObject);
  private
    FOnDbMemoExit: TDbMemoExit;
    FCloseOnExit: boolean;
    procedure SetTitle(const Value: string);
    function Getcontent: string;
    procedure SetContent(const Value: string);
  protected
    procedure HandleEnterKey(Sender : TObject);
    procedure HandleCancel(Sender : TObject);
  public
    constructor Create(AOwner : TComponent); overload; override;
    constructor Create(Aowner : TComponent; const s : string; Feedback : TDbMemoExit;
        const ReadOnly : boolean = false); overload;

    procedure ShowAt(const Controlx, Controly : integer;
       const ControlHeight : integer = 0; const Under : boolean = true;
       const position : integer = 0 );

    procedure AddLine(const s : string);

    property Title : string write SetTitle;
    property Content : string read Getcontent write SetContent;

    property OnDbMemoExit : TDbMemoExit read FOnDbMemoExit write FOnDbMemoExit;

    property CloseOnExit : boolean read FCloseOnExit write FCloseOnExit;
  end;


implementation

{$R *.dfm}

{ TFmDbMemo }


procedure TFmMemo.SetTitle(const Value: string);
begin
  Caption := Value;
end;

function TFmMemo.Getcontent: string;
begin
  Result := Memo1.Text;
end;

procedure TFmMemo.SetContent(const Value: string);
begin
  Memo1.Text := Value;
end;

procedure TFmMemo.HandleCancel(Sender: TObject);
begin
  Close;
end;

procedure TFmMemo.HandleEnterKey(Sender: TObject);
begin
  if Assigned(OnDbMemoExit) then
    OnDbMemoExit(self, Memo1.Text);

  Close;

end;

procedure TFmMemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

constructor TFmMemo.Create(Aowner: TComponent; const s: string;
  Feedback: TDbMemoExit; const Readonly : boolean);
begin
  Create(AOwner);

  Memo1.Text := s;
  memo1.ReadOnly := ReadOnly;
  OnDbMemoExit := Feedback;

  BorderStyle := bsNone;

  BnOk.OnClick := HandleEnterKey;
  BnCancel.OnClick := HandleCancel;

  CloseOnExit := true;
end;

procedure TFmMemo.ShowAt(const Controlx, Controly: integer;
                const ControlHeight: integer; const Under: boolean; const position : integer);
begin
  Left := Controlx-1;
  if Under then
    Top := ControlY + ControlHeight
  else
    Top := ControlY-1;

  if Left+Width > Screen.Width then
    Left := Screen.Width - Width;

  if Top + Height > Screen.Height then
  begin
//    if Under then
//      Top := Top - ControlHeight - Height
//    else
      Top := Top - Height;
  end;
  Memo1.SelStart := Position;

  Show;
end;

procedure TFmMemo.FormDeactivate(Sender: TObject);
begin
  if CloseOnExit then
    Close;
end;

procedure TFmMemo.AddLine(const s: string);
begin
  Memo1.Lines.Add(s);
end;

constructor TFmMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  CloseOnExit := true;

end;

procedure TFmMemo.BnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
