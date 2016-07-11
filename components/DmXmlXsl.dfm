object XmlXslDm: TXmlXslDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 110
  Height = 150
  Width = 215
  object Xml: TXMLDocument
    Left = 128
    Top = 24
    DOMVendorDesc = 'MSXML'
  end
  object OutputBuffer: TXMLDocument
    Left = 48
    Top = 72
    DOMVendorDesc = 'MSXML'
  end
  object Xsl: TXMLDocument
    Left = 32
    Top = 16
    DOMVendorDesc = 'MSXML'
  end
end
