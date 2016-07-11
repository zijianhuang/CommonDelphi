unit Base64Binary;

interface

uses
  SysUtils, Classes;

type
  TBase64ForBinary = class
  protected
  public
    class function FileToBase64(const FileName : string) : string ;
    class procedure Base64ToFile(const FileName : string; const bs : string);
    class function GetFileExt(const FileName : string) : string;
  end;

implementation
uses
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME;

{ TBase64ForBinary }

class procedure TBase64ForBinary.Base64ToFile(const FileName,
  bs: string);
var
  MStream : TMemoryStream;
  decoder : TIdDecoderMime;
begin
    MStream := TMemoryStream.Create;
    decoder := TIdDecoderMime.Create;
    try
    decoder.DecodeBegin(MStream);
    decoder.Decode(bs);
    decoder.DecodeEnd;
    MStream.SaveToFile(FileName);
    finally
    decoder.Free;
    MStream.Free;
    end;
end;

class function TBase64ForBinary.GetFileExt(const FileName: string): string;
begin
   Result := Copy(ExtractFileExt(FileName), 2, 5);
end;

class function TBase64ForBinary.FileToBase64(const FileName: string) : string;
var
  Base64Encoder : TIdEncoderMime ;
  MStream : TMemoryStream;
begin
    Base64Encoder := TIdEncoderMime.Create(nil);
    MStream := TMemoryStream.Create;
    try
    MStream.LoadFromFile(FileName);
    MStream.Position := 0;
    Result := Base64Encoder.Encode(MStream);
    finally
      if Base64Encoder <> nil then
      Base64Encoder.Free;
      if MStream <> nil then
      MStream.Free;
    end;

end;

end.
