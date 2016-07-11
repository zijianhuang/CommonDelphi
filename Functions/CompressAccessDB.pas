unit CompressAccessDB;
// AccessCompact compacts and repairs Access 97 and Access 2000 databases.
//
// Author: David Simpson (drs@ihug.com.au), 19 Feb 2000
//
// Minor changes: Bob Wasaff (bwasaff@suscom.net), 29 Sep 00 2000
//                David Simpson, 30 Sep 2000
//              Zijian Huang, Jun, 2003

interface

uses
  SysUtils, Dialogs,
  ActiveX,
  JRO_TLB; // 'Microsoft Jet and Replication Objects 2.5 Library' or later
// C:\Program Files\Common Files\System\ADO\msjro.dll
type
  TCompactProgress=procedure(const msg : string; const p : integer);


  procedure CompactDB(const DBname, DBtype: string; cfn : TCompactProgress);

implementation


procedure CompactDB(const DBname, DBtype: string; cfn : TCompactProgress);
var
  MyJetEngine: JetEngine;
  strDataSource,
    strDataDest,
    strDataDestName: string;

begin
  if not FileExists(DBname) then
    begin
      ShowMessage('Error: '''+DBName+''' not found.');
      exit;
    end;

  // delete any previous temporary mdb file
  strDataDestName := ExtractFilePath(DBname) + 'temp.mdb';
  if FileExists(StrDataDestName) then
    begin
      DeleteFile(strDataDestName);
      cfn('Previous temporary file '+strDataDestName+' deleted.', 2);
    end;

  strDataSource := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DBname + ';';
  strDataDest := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + strDataDestName + ';';

  // default to Access 2000 format unless 97 format is specified
  { default changed 30 Sep 2000 DRS }
  if DBtype = '97' then
    // Use Engine Type 4 for Access 97 db
    strDataDest := strDataDest + 'Jet OLEDB:Engine Type=4'
  else
    // Use Engine Type 5 for Access 2000 db
    strDataDest := strDataDest + 'Jet OLEDB:Engine Type=5';

  MyJetEngine := CoJetEngine.Create();
  try
    MyJetEngine.CompactDatabase(strDataSource, strDataDest);
    cfn(DBname+' compacted into '+ strDataDestName + '.', 3);
    MyJetEngine := nil;
    if DeleteFile(DBname) then
      begin
        cfn(DBname+ ' deleted.', 4);
        if RenameFile(strDataDestName, DBName) then
          cfn(strDataDestName+ ' renamed '+ DBname + '.', 5)
        else
          cfn('Error: '+strDataDestName+' could not be renamed '+ DBname+ '.', 5);
      end
    else
      cfn('Error: '+ DBname+ ' could not be deleted.', 4);
  except
    on E: Exception do ShowMessage('Error: '+E.Message);
  end
end;



end.
 