unit FrameRichEditTool;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, StdActns, ActnList, ComCtrls, ToolWin;

type
  TFrmRichEditTool = class(TFrame)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    A_Font: TAction;
    Action6: TAction;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditCopy1: TEditCopy;
    ImageList1: TImageList;
    FontDialog1: TFontDialog;
    procedure EditCut1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure A_FontExecute(Sender: TObject);
  private
    FRichEdit: TCustomRichEdit;
    procedure SetRichEdit(const Value: TCustomRichEdit);
  public
  published
    property RichEdit : TCustomRichEdit read FRichEdit write SetRichEdit;
  end;

implementation

{$R *.DFM}

procedure TFrmRichEditTool.SetRichEdit(const Value: TCustomRichEdit);
begin
  FRichEdit := Value;
end;

procedure TFrmRichEditTool.EditCut1Execute(Sender: TObject);
begin
  RichEdit.CutToClipboard;
end;

procedure TFrmRichEditTool.EditPaste1Execute(Sender: TObject);
begin
  RichEdit.PasteFromClipboard;

end;

procedure TFrmRichEditTool.EditSelectAll1Execute(Sender: TObject);
begin
  RichEdit.SelectAll;

end;

procedure TFrmRichEditTool.EditCopy1Execute(Sender: TObject);
begin
  RichEdit.CopyToClipboard;

end;

procedure TFrmRichEditTool.A_FontExecute(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    RichEdit.SelAttributes.Name := FontDialog1.Font.Name;
    RichEdit.SelAttributes.Size := FontDialog1.Font.Size;
    RichEdit.SelAttributes.Color := FontDialog1.Font.Color;
    RichEdit.SelAttributes.Style := FontDialog1.Font.Style;
    RichEdit.SelAttributes.Height := FontDialog1.Font.Height;
    RichEdit.SelAttributes.Charset := FontDialog1.Font.Charset;
  end;

end;

end.
