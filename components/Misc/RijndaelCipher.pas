unit RijndaelCipher;

interface
uses
  Classes, AbstractCipher, LbClass;
type
  TRijndaelCipher = class(TAbstractCipher)
  protected
    cipher : TLbRijndael;
    procedure SetEcbCbc(const Value: boolean); override;
  public {methods}
    constructor Create(AOwner : TComponent); override;

    procedure DecryptFile(const InFile, OutFile : string); override;
    procedure DecryptStream(InStream , OutStream : TStream); override;
    function  DecryptString(const InString : string) : string; override;

    procedure EncryptFile(const InFile, OutFile : string); override;
    procedure EncryptStream(InStream, OutStream : TStream); override;
    function  EncryptString(const InString : string) : string; override;

    procedure GenerateKey(const Passphrase : string); override;
    procedure GenerateRandomKey; override;

  end;


implementation

{ TRijndaelCipher }

constructor TRijndaelCipher.Create(AOwner: TComponent);
begin
  inherited;
  cipher := TLbRijndael.Create(self);
  cipher.KeySize := ks128;
  EcbCbc := false;
end;

procedure TRijndaelCipher.DecryptFile(const InFile, OutFile: string);
begin
  cipher.DecryptFile(InFile, OutFile);
end;

procedure TRijndaelCipher.DecryptStream(InStream, OutStream: TStream);
begin
  cipher.DecryptStream(InStream, OutStream);
end;

function TRijndaelCipher.DecryptString(const InString: string): string;
begin
  Result := cipher.DecryptString(InString);
end;

procedure TRijndaelCipher.EncryptFile(const InFile, OutFile: string);
begin
  cipher.EncryptFile(InFile, OutFile);
end;

procedure TRijndaelCipher.EncryptStream(InStream, OutStream: TStream);
begin
cipher.EncryptStream(InStream, OutStream);
end;

function TRijndaelCipher.EncryptString(const InString: string): string;
begin
Result := cipher.EncryptString(InString)
end;

procedure TRijndaelCipher.GenerateKey(const Passphrase: string);
begin
  cipher.GenerateKey(Passphrase);

end;

procedure TRijndaelCipher.GenerateRandomKey;
begin
cipher.GenerateRandomKey;
end;

procedure TRijndaelCipher.SetEcbCbc(const Value: boolean);
begin
  if Value then
 cipher.CipherMode := cmEcb
 else
 cipher.CipherMode := cmCbc;

end;

end.

