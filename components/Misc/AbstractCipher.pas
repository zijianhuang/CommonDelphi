 {{
   The LockBox of TurboPower provides a set of cipher classes. However, the design
   of the base class make it difficult to create builder pattern. So I have to create
   this abstract class and a set of wrappers as builders.
}
unit AbstractCipher;

interface
uses
  Classes;

type
  TAbstractCipher = class(TComponent)
  protected
    procedure SetEcbCbc(const Value: boolean); virtual;abstract;
  public
    procedure DecryptFile(const InFile, OutFile : string); virtual;abstract;
    procedure DecryptStream(InStream , OutStream : TStream); virtual;abstract;
    function  DecryptString(const InString : string) : string; virtual;abstract;

    procedure EncryptFile(const InFile, OutFile : string); virtual;abstract;
    procedure EncryptStream(InStream, OutStream : TStream); virtual;abstract;
    function  EncryptString(const InString : string) : string; virtual;abstract;

    procedure GenerateKey(const Passphrase : string); virtual;abstract;
    procedure GenerateRandomKey; virtual;abstract;

    procedure SetPassPhrase(const Passphrase : string);

    property EcbCbc  : boolean write SetEcbCbc;
  end;



implementation

{ TAbstractCipher }


{ TAbstractCipher }

procedure TAbstractCipher.SetPassPhrase(const Passphrase: string);
begin
  GenerateKey(Passphrase);
end;

end.
 