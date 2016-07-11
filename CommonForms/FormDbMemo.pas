unit FormDbMemo;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130} Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  TDbMemoExit = procedure (Sender : TObject; const s : string) of Object;

  TMemoFm = class(TForm)
    BnOk: TButton;
    BnCancel: TButton;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
  private
    FOnDbMemoExit: TDbMemoExit;
    procedure SetTitle(const Value: string);
    function Getcontent: string;
    procedure SetContent(const Value: string);
  protected
    procedure HandleEnterKey(Sender : TObject);
    procedure HandleCancel(Sender : TObject);
  public
    constructor Create(Aowner : TComponent; const s : string; Feedback : TDbMemoExit;
        const ReadOnly : boolean = false); overload;

    procedure ShowAt(const Controlx, Controly : integer;
       const ControlHeight : integer = 0; const Under : boolean = true;
       const position : integer = 0 );

    procedure AddLine(const s : string);

    property Title : string write SetTitle;
    property Content : string read Getcontent write SetContent;

    property OnDbMemoExit : TDbMemoExit read FOnDbMemoExit write FOnDbMemoExit;
  end;


implementation

{$R *.dfm}

{ TFmDbMemo }


procedure TMemoFm.SetTitle(const Value: string);
begin
  Caption := Value;
end;

function TMemoFm.Getcontent: string;
begin
  Result := Memo1.Text;
end;

procedure TMemoFm.SetContent(const Value: string);
begin
  Memo1.Text := Value;
end;

procedure TMemoFm.HandleCancel(Sender: TObject);
begin
  Close;
end;

procedure TMemoFm.HandleEnterKey(Sender: TObject);
begin
  if Assigned(OnDbMemoExit) then
    OnDbMemoExit(self, Memo1.Text);

  Close;

end;

procedure TMemoFm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

constructor TMemoFm.Create(Aowner: TComponent; const s: string;
  Feedback: TDbMemoExit; const Readonly : boolean);
begin
  inherited Create(AOwner);
  Memo1.Text := s;
  memo1.ReadOnly := ReadOnly;
  OnDbMemoExit := Feedback;

  BorderStyle := bsNone;

  BnOk.OnClick := HandleEnterKey;
  BnCancel.OnClick := HandleCancel;
end;

procedure TMemoFm.ShowAt(const Controlx, Controly: integer;
                const ControlHeight: integer; const Under: boolean; const position : integer);
begin
  Left := Controlx;
  if Under then
    Top := ControlY + ControlHeight
  else
    Top := ControlY;

  if Left+Width > Screen.Width then
    Left := Screen.Width - Width;

  if Top + Height > Screen.Height then
  begin
    if Under then
      Top := Top - ControlHeight - Height
    else
      Top := Top - Height;
  end;

  Memo1.SelStart := Position;

  Show;
end;

procedure TMemoFm.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TMemoFm.AddLine(const s: string);
begin
  Memo1.Lines.Add(s);
end;

end.
