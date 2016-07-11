unit DataExcelDb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DataExcel, Excel_TLB,  Office_Tlb,
   syncobjs, ActiveX, db , dbclient
{$IFNDEF VER130}
, Variants
{$ENDIF} ;

type
  TExcelDbUtil = class(TExcelUtilBase)
  private
    FOnFeedback: TGetStrProc;
    procedure SetOnFeedback(const Value: TGetStrProc);
  protected
    Filename : string;
    function CopyTitlesForExcel(const ws: ExcelWorkSheet;
            const gf: array of TField; const titles: array of string): integer;
    procedure CopyFieldToCell(const gg: TField; const cc: OleVariant;
           const ftoc : boolean);

    procedure SaveBookOfDataset(const eb : ExcelWorkBook);

  public
    {{
      Copy data from a dataset to a worksheet.

      @param withTitles copy the fieldnames as the first row
      @param FtoC true: copy float as currency
    }
    procedure SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :
            TDataset; const withTitles : boolean; const FtoC : boolean); overload;

    {{
      Copy data from a dataset to a worksheet.

      @param withTitles copy the fieldnames as the first row
      @param FtoC true: copy float as currency in Excel
    }
    procedure SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :
            TDataset; const withTitles : boolean; const gf : array of TField;
            const titles : array of string; const FtoC : boolean); overload;

    {{
      Copy data from a dataset to a worksheet.

      @param withTitles copy the fieldnames as the first row
      @param FtoC true: copy float as currency
      @param gf  A list of fileds to process
      @param titles A list of titles of the fields. If not assigned, the field name will be used.
      @param LookupDs A list of dataset that is lookup dataset of a lookup field
    }
    procedure SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :TDataset;
            const withTitles : boolean; const gf : array of TField;
            const titles : array of string; const LookupDS : array of TDataset;
            const LookupFlds : array of string; const FtoC : boolean); overload;


    //: Copy data from a dataset to the active worksheet of a workbook
    procedure BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset; withTitles
            : boolean; const FtoC : boolean); overload;
    procedure BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset; withTitles
            : boolean; const gf : array of TField;const titles : array of
            string; const FtoC : boolean); overload;
    procedure BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset; withTitles
            : boolean; const gf : array of TField;const titles : array of
            string; const LookupDS : array of TDataset; const LookupFlds :
            array of string; const FtoC : boolean); overload;

    procedure CopyCellsToDataset(const eb : ExcelWorkBook;
        const ColStart, ColEnd, RowStart, RowEnd : integer; ds : TClientDataset); overload;

    procedure CopyCellsToDataset(const ws : ExcelWorkSheet;
        const ColStart, ColEnd, RowStart, RowEnd : integer; ds : TClientDataset); overload;

    procedure SetCurrentBookTitle(const s : string);

    procedure ReprotProgress(const i, c : integer);

    procedure SetSavingBookAfterLoading(const fn : string);


    property OnFeedback : TGetStrProc read FOnFeedback write SetOnFeedback;
  end;


implementation

function GetRefData(ds: TDataset; const ref : integer; const fdn: string): Variant;
begin
  Result:=ds.Lookup('refno', ref, fdn)
end;

procedure TExcelDbUtil.SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :
        TDataset; const withTitles : boolean; const FtoC : boolean);
var
  i, j: Integer;
begin
  if withTitles then
  begin
    for j:=0 to ds.FieldCount-1 do
      ws.Cells.Item[1, j+1].Value:=ds.Fields.FieldByNumber(j+1).FieldName;
    i:=1;
  end
  else
    i:=0;

  ds.First;

  while not ds.Eof do
  begin
    for j:=0 to ds.FieldCount-1 do
    begin
  //    ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsString;
      case  ds.Fields.FieldByNumber(j+1).DataType of
        ftWord, ftInteger, ftSmallInt, ftAutoInc, ftLargeInt:
           ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsInteger;
        ftDate, ftTime, ftDateTime :
          if ds.Fields.FieldByNumber(j+1).AsDateTime < 1 then
            ws.Cells.Item[i+1, j+1].Value := NULL
          else
             ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsDateTime;
        ftCurrency :
           ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsCurrency;
        ftFloat :
           if FtoC then
             ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsCurrency
           else
             ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsFloat;
        ftString, ftWideString :
           ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsString;
        ftBoolean :
           ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsBoolean
        else
           ws.Cells.Item[i+1, j+1].Value:= ds.Fields.FieldByNumber(j+1).AsString;
      end;

    end;
    Inc(i);
    ReprotProgress(i, ds.RecordCount);
    ds.Next;
  end;
  
end;

procedure TExcelDbUtil.SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :
        TDataset; const withTitles : boolean; const gf : array of TField; const
        titles : array of string; const FtoC : boolean);
var
  i, j: Integer;
begin
  if withTitles then
    i:=CopyTitlesForExcel(ws, gf, Titles)
  else
    i:=0;

  ds.First;
  
  while not ds.Eof do
  begin
    for j:=Low(gf) to High(gf) do
    begin
      if gf[j] = nil then
        continue;

      CopyFieldToCell(gf[j], ws.Cells.Item[i+1, j+1], ftoc);

    end;
    Inc(i);
    ReprotProgress(i, ds.RecordCount);
    ds.Next;
  end;
end;

procedure TExcelDbUtil.SheetLoadFromDataset(const ws : ExcelWorkSheet; const ds :
        TDataset; const withTitles : boolean; const gf : array of TField; const
        titles : array of string; const LookupDS : array of TDataset; const 
        LookupFlds : array of string; const FtoC : boolean);
var
  i, j: Integer;
  

begin
  if withTitles then
    i:=CopyTitlesForExcel(ws, gf, Titles)
  else
    i:=0;

  ds.First;

  while not ds.Eof do
  begin
    for j:=Low(gf) to High(gf) do
    begin
      if LookupDS[j]<>nil then
      begin
        ws.Cells.Item[i+1, j+1].Value:=VarToStr(GetRefData(LookupDS[j], gf[j].AsInteger, LookupFlds[j]));
      end
      else
        CopyFieldToCell(gf[j], ws.Cells.Item[i+1, j+1], ftoc);

    end;
    Inc(i);
    ReprotProgress(i, ds.RecordCount);
    ds.Next;
  end;
  
end;

procedure TExcelDbUtil.BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset;
        withTitles : boolean; const gf : array of TField;const titles : array 
        of string; const LookupDS : array of TDataset; const LookupFlds : array 
        of string; const FtoC : boolean);
var
  es: ExcelWorkSheet;
begin
  es:=(eb.ActiveSheet as ExcelWorkSheet);
  SheetLoadFromDataset(es, ds, withTitles, gf, titles, LookupDS, LookupFlds, ftoc);

  eb.Application.ActiveWindow.WindowState:=xlNormal;

   SaveBookOfDataset(eb);
end;

procedure TExcelDbUtil.BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset;
        withTitles : boolean; const gf : array of TField;const titles : array
        of string; const FtoC : boolean);
var
  es: ExcelWorkSheet;
begin
  es:=(eb.ActiveSheet as ExcelWorkSheet);
  SheetLoadFromDataset(es, ds, withTitles, gf, titles, FtoC);

  eb.Application.ActiveWindow.WindowState:=xlNormal;
  SaveBookOfDataset(eb);
end;

procedure TExcelDbUtil.BookLoadFromDataset(eb : ExcelWorkBook; ds : TDataset;
        withTitles : boolean; const FtoC : boolean);
var
  es: ExcelWorkSheet;
begin
  es:=(eb.ActiveSheet as ExcelWorkSheet);
  SheetLoadFromDataset(es, ds, withTitles, FtoC);

  eb.Application.ActiveWindow.WindowState:=xlNormal;
  SaveBookOfDataset(eb);
end;

function TExcelDbUtil.CopyTitlesForExcel(const ws: ExcelWorkSheet;
  const gf: array of TField; const titles: array of string): integer;
var
   j : integer;
begin
    if high(gf)=high(titles) then
    begin
      for j:=Low(titles) to High(titles) do
      begin
        if titles[j] = '' then
          continue;

        ws.Cells.Item[1, j+1].Value:=titles[j];
      end;
    end
    else
    begin
      for j:=Low(gf) to High(gf) do
      begin
        if gf[j]=nil then
          continue;

        ws.Cells.Item[1, j+1].Value:=gf[j].FieldName;
      end;
    end;

    Result:=1;

end;

procedure TExcelDbUtil.CopyFieldToCell(const gg: TField; const cc: OleVariant;
         const ftoc : boolean);
begin
      case  gg.DataType of
        ftWord, ftInteger, ftSmallInt, ftAutoInc, ftLargeInt:
           cc.Value:= gg.AsInteger;
        ftDate, ftTime, ftDateTime :
          if gg.AsDateTime < 1 then
            cc.Value := NULL
          else
           cc.Value:= gg.AsDateTime;
        ftCurrency :
           cc.Value:= gg.AsCurrency;
        ftFloat :
           if FtoC then
             cc.Value:= gg.AsCurrency
           else
             cc.Value:= gg.AsFloat;
        ftString, ftWideString :
           cc.Value:= gg.AsString;
        ftBoolean :
           cc.Value:= gg.AsBoolean
        else
           cc.Value:= gg.AsString;
      end;

end;


procedure TExcelDbUtil.CopyCellsToDataset(const ws: ExcelWorkSheet;
  const ColStart, ColEnd, RowStart, RowEnd: integer; ds : TClientDataset);
var
  i, k : integer;
  NewField : TFieldDef;
  EmptyRow : boolean;
begin
  ds.FieldDefs.Clear;
  for i := ColStart to ColEnd do
  begin
    NewField := ds.FieldDefs.AddFieldDef;
    NewField.DataType := ftString;
    NewField.Size := 20;
    NewField.Name := varToStr(ws.Cells.item[RowStart, i].Value);
  end;

  ds.CreateDataSet;

  for i := RowStart + 1 to RowEnd do
  begin
    EmptyRow := true;
    for k := ColStart to ColEnd do
      if  varToStr(ws.Cells.item[i, k].Value) <> '' then
      begin
        EmptyRow := false;
        break;
      end;

    if EmptyRow then
      continue;

    ds.Append;
    for k := ColStart to ColEnd do
      ds.Fields[k - ColStart].Value := ws.Cells.item[i, k].Value;

    ds.Post;
  end;
end;

procedure TExcelDbUtil.CopyCellsToDataset(const eb: ExcelWorkBook;
  const ColStart, ColEnd, RowStart, RowEnd: integer; ds: TClientDataset);
var
  es: ExcelWorkSheet;
begin
  es:=(eb.ActiveSheet as ExcelWorkSheet);
  CopyCellsToDataset(es, ColStart, ColEnd, RowStart, RowEnd, ds);


end;

procedure TExcelDbUtil.SetCurrentBookTitle(const s: string);
begin
  ExcelApp.ActiveWindow.Caption := s;
end;

procedure TExcelDbUtil.SetOnFeedback(const Value: TGetStrProc);
begin
  FOnFeedback := Value;
end;


procedure TExcelDbUtil.ReprotProgress(const i, c: integer);
begin
    if Assigned(OnFeedback) then
      OnFeedback(IntToStr(i)+' / '+ IntToStr(c));

    if i mod 20 = 0 then
      Application.ProcessMessages;
end;

procedure TExcelDbUtil.SaveBookOfDataset(const eb: ExcelWorkBook);
begin                         
  if FileName <> '' then
    eb.SaveAs(Filename, EmptyParam,EmptyParam, EmptyParam, EmptyParam, EmptyParam, xlShared , EmptyParam, EmptyParam, EmptyParam,EmptyParam, 0, 0    );
  FileName := '';
end;

procedure TExcelDbUtil.SetSavingBookAfterLoading(const fn: string);
begin
  FileName := fn;
end;

end.
