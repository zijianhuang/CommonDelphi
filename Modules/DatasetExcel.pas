unit DatasetExcel;

interface
uses   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db;

    // Export to Excel         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

    // export with table's field names
    function ExportDatasetToExcel(tbl: TDataset; withTitle: boolean): boolean; overload;

    // export with fields and titles
    function ExportDatasetToExcel(tbl: TDataset; withTitle: boolean;
      const gf: array of TField;
      const titles: array of string): boolean; overload;

    // export with fields, titles, and Lookup Fields of Lookup tables
    function ExportDatasetToExcel(tbl: TDataset; withTitle: boolean;
      const gf: array of TField;
      const titles: array of string;
      const LookupDS: array of TDataset; const LookupFlds: array of string): boolean;
      overload;


implementation
uses functions, OAData;

function ExportDatasetToExcel(tbl: TDataset; withTitle: boolean): boolean;
begin
  Result := False;
  try
    OADataMod.ExcelUtil.BookLoadFromDataset(OADataMod.ExcelUtil.CreateBook(''), tbl, withTitle, True);

    Result := True;
  except
    on e: SysUtils.Exception do
        ShowError(e.ClassName + '--' + e.Message);
  end;
end;

function ExportDatasetToExcel(tbl: TDataset;
  withTitle: boolean; const gf: array of TField; const titles: array of string): boolean;
begin
  Result := False;
  try
    OADataMod.ExcelUtil.BookLoadFromDataset(OADataMod.ExcelUtil.CreateBook(''), tbl, withTitle,
      gf, titles, True);

    Result := True;
  except
    on e: SysUtils.Exception do
        ShowError(e.ClassName + '--' + e.Message);
  end;
end;

function ExportDatasetToExcel(tbl: TDataset;
  withTitle: boolean; const gf: array of TField;
  const titles: array of string; const LookupDS: array of TDataset;
  const LookupFlds: array of string): boolean;
begin
  Result := False;
  try
    OADataMod.ExcelUtil.BookLoadFromDataset(OADataMod.ExcelUtil.CreateBook(''), tbl, withTitle,
      gf, titles, LookupDS, LookupFlds, True);

    Result := True;
  except
    on e: SysUtils.Exception do
        ShowError(e.ClassName + '--' + e.Message);
  end;
end;

end.
 