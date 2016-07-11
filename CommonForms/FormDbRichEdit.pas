unit FormDbRichEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, JvRichEd, JvDBRichEd, ComCtrls, JvRichEdit, StdActns, ImgList,
  ActnList, ToolWin;

type
  TDbMemoExit = procedure (Sender : TObject; const s : string) of Object;

  TFmDbRichEdit = class(TForm)
    BnOk: TButton;
    BnCancel: TButton;
    Memo1: TJvRichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    A_Font: TAction;
    Action6: TAction;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    ImageList1: TImageList;
    EditCopy1: TEditCopy;
    FontDialog1: TFontDialog;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure A_FontExecute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditCut1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
  private
    FOnDbMemoExit: TDbMemoExit;
    procedure SetTitle(const Value: string);
    function Getcontent: string;
    procedure SetContent(const Value: string);
  protected
    procedure HandleEnterKey(Sender : TObject);
    procedure HandleCancel(Sender : TObject);

    function GetMemoRtfText : string;
  public
    constructor Create(Aowner : TComponent; const s : string; Feedback : TDbMemoExit;
        const ReadOnly : boolean = false); overload;

    procedure ShowAt(const Controlx, Controly : integer;
       const ControlHeight : integer = 0; const Under : boolean = true;
       const position : integer = 0 );

    property Title : string write SetTitle;
    property Content : string read Getcontent write SetContent;

    property OnDbMemoExit : TDbMemoExit read FOnDbMemoExit write FOnDbMemoExit;
  end;


implementation

{$R *.dfm}

{ TFmDbRichEdit }


procedure TFmDbRichEdit.SetTitle(const Value: string);
begin
  Caption := Value;
end;

function TFmDbRichEdit.Getcontent: string;
begin
  Result := Memo1.Text;
end;

procedure TFmDbRichEdit.SetContent(const Value: string);
begin
  Memo1.Text := Value;
end;

procedure TFmDbRichEdit.HandleCancel(Sender: TObject);
begin
  Close;
end;

procedure TFmDbRichEdit.HandleEnterKey(Sender: TObject);
begin
  if Assigned(OnDbMemoExit) then
    OnDbMemoExit(self, GetMemoRtfText);

  Close;

end;

procedure TFmDbRichEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

constructor TFmDbRichEdit.Create(Aowner: TComponent; const s: string;
  Feedback: TDbMemoExit; const Readonly : boolean);
var
  ff : TStringStream;
begin
  inherited Create(AOwner);
  memo1.ReadOnly := ReadOnly;
  memo1.PlainText := false;

  ff := TStringStream.Create(s);
  Memo1.Lines.LoadFromStream(ff);

  OnDbMemoExit := Feedback;

  BorderStyle := bsNone;

  BnOk.OnClick := HandleEnterKey;
  BnCancel.OnClick := HandleCancel;
end;

procedure TFmDbRichEdit.ShowAt(const Controlx, Controly: integer;
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

procedure TFmDbRichEdit.FormDeactivate(Sender: TObject);
begin
  Close;
end;



function TFmDbRichEdit.GetMemoRtfText: string;
var
  ff : TStringStream;
begin
  ff := TStringStream.Create('');

  try
    Memo1.Lines.SaveToStream(ff);
    Result := ff.DataString;
  finally

    ff.Free;
  end;

end;

procedure TFmDbRichEdit.A_FontExecute(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Memo1.SelAttributes.Name := FontDialog1.Font.Name;
    Memo1.SelAttributes.Size := FontDialog1.Font.Size;
    Memo1.SelAttributes.Color := FontDialog1.Font.Color;
    Memo1.SelAttributes.Style := FontDialog1.Font.Style;
    Memo1.SelAttributes.Height := FontDialog1.Font.Height;
    Memo1.SelAttributes.Charset := FontDialog1.Font.Charset;
  end;
end;

procedure TFmDbRichEdit.EditCopy1Execute(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TFmDbRichEdit.EditPaste1Execute(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TFmDbRichEdit.EditCut1Execute(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TFmDbRichEdit.EditSelectAll1Execute(Sender: TObject);
begin
  Memo1.SelectAll;
end;

end.
