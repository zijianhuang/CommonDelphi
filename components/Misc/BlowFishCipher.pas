unit BlowFishCipher;

interface
uses
  Classes, AbstractCipher, LbClass;
type
  TBlowfishCipher = class(TAbstractCipher)
  protected
    cipher : TLbBlowFish;
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

{ TBlowfishCipher }

constructor TBlowfishCipher.Create(AOwner: TComponent);
begin
  inherited;
  cipher := TLbBlowFish.Create(self);
  EcbCbc := false;

end;

procedure TBlowfishCipher.DecryptFile(const InFile, OutFile: string);
begin
  cipher.DecryptFile(InFile, OutFile);
end;

procedure TBlowfishCipher.DecryptStream(InStream, OutStream: TStream);
begin
  cipher.DecryptStream(InStream, OutStream);
end;

function TBlowfishCipher.DecryptString(const InString: string): string;
begin
  Result := cipher.DecryptString(InString);
end;

procedure TBlowfishCipher.EncryptFile(const InFile, OutFile: string);
begin
  cipher.EncryptFile(InFile, OutFile);
end;

procedure TBlowfishCipher.EncryptStream(InStream, OutStream: TStream);
begin
cipher.EncryptStream(InStream, OutStream);
end;

function TBlowfishCipher.EncryptString(const InString: string): string;
begin
Result := cipher.EncryptString(InString)
end;

procedure TBlowfishCipher.GenerateKey(const Passphrase: string);
begin
  cipher.GenerateKey(Passphrase);

end;

procedure TBlowfishCipher.GenerateRandomKey;
begin
cipher.GenerateRandomKey;
end;

procedure TBlowfishCipher.SetEcbCbc(const Value: boolean);
begin
  if Value then
 cipher.CipherMode := cmEcb
 else
 cipher.CipherMode := cmCbc;

end;

end.
 