unit CommonFunc;

interface
uses Dialogs;

  function ShowError(const s : string; const Buttons: TMsgDlgButtons=[mbOK]) : Word;
  function ShowWarning(const s : string; const Buttons: TMsgDlgButtons=[mbOK]) : Word;
  function ShowInfo(const s : string; const Buttons: TMsgDlgButtons=[mbOK]) : Word;

implementation

  function ShowError(const s : string; const Buttons: TMsgDlgButtons) : Word;
  begin
    Result:=MessageDlg(s, mtError, Buttons, 0);
  end;

  function ShowWarning(const s : string; const Buttons: TMsgDlgButtons) : Word;
  begin
    Result:=MessageDlg(s, mtWarning, Buttons, 0);
  end;

  function ShowInfo(const s : string; const Buttons: TMsgDlgButtons) : Word;
  begin
    Result:=MessageDlg(s, mtInformation, Buttons, 0);
  end;


end.
 