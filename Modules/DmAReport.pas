unit DmAReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DmGeneral, DB, ADODB;

type
  TAReportDm = class(TGeneralDm)
    QryTenderWonLost: TADOQuery;
    DsTenderWonList: TDataSource;
    QryTenderSummary: TADOQuery;
    DsTenderSummary: TDataSource;
    QryTenderSummary2: TADOQuery;
    DsTendersSummary: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AReportDm: TAReportDm;

implementation

{$R *.dfm}

end.
