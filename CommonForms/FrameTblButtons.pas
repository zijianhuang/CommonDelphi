unit FrameTblButtons;

interface

uses
  Windows, Messages, SysUtils, {$ifdef ver150}Variants,{$endif} Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, ExtCtrls, DBCtrls, StdCtrls;

type
  TFrmBasicTblButtons = class(TFrame)
    BnAppend: TButton;
    BnCancel: TButton;
    BnDelete: TButton;
    BnApply: TButton;
    BnClose: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
