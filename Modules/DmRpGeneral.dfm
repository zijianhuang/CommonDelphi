object GeneralRpDm: TGeneralRpDm
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 213
  Top = 171
  Height = 258
  Width = 319
  object VReportProject: TRvProject
    Engine = ReportSystem
    Left = 44
    Top = 20
  end
  object ReportSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnBeforePrint = ReportSystemBeforePrint
    Left = 128
    Top = 20
  end
end
