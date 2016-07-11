unit DmXmlXsl;

interface

uses
  SysUtils, Classes, xmldom, XMLIntf, msxmldom, XMLDoc, XSLProd;

type
  TXmlXslDm = class(TDataModule)
    Xml: TXMLDocument;
    OutputBuffer: TXMLDocument;
    Xsl: TXMLDocument;
    procedure DataModuleCreate(Sender: TObject);
  private
  protected

  public
    procedure LoadXSLFromFile(const f : WideString);
    procedure LoadXMLFromFile(const f : WideString);
    procedure LoadXMLFromStream(const Stream: TStream );

    //: The client code must free the returned object
    function GetHtmlStream : TMemoryStream;
  end;

implementation
uses
  JclUnicode;
{$R *.dfm}

{ TXmlXslDm }

procedure TXmlXslDm.LoadXMLFromFile(const f: WideString);
begin
  Xml.LoadFromFile(f);
end;

procedure TXmlXslDm.LoadXMLFromStream(const Stream: TStream);
begin
  Xml.LoadFromStream(Stream);
end;

procedure TXmlXslDm.LoadXSLFromFile(const f: WideString);
begin
  XSL.LoadFromFile(f);
end;

procedure TXmlXslDm.DataModuleCreate(Sender: TObject);
begin
OutputBuffer.Active := true;
end;

function TXmlXslDm.GetHtmlStream: TMemoryStream;
begin
  Result :=  TMemoryStream.Create;
  Xml.Node.TransformNode(XSL.Node, OutputBuffer);
  OutputBuffer.SaveToStream(Result);

end;

end.
