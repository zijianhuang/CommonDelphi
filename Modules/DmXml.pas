unit DmXml;

interface

uses
  SysUtils, Classes, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TXmlDm = class(TDataModule)
    XmlDoc: TXMLDocument;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XmlDm: TXmlDm;

implementation

{$R *.dfm}

end.
