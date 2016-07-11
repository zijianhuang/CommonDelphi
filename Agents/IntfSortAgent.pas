{{
  Purpose:
    To provide sort services to dataset objects or TCustomDbGrid descendents.
    The dataset has to be TCustomAdoDataset at the moment.

  Copyright (c) 2003  Zijian Huang,  All Rights Reserved.

  Created by Zijian Huang

  Programming tips:
    The other dataset could be supported through editing SortSingleField(), since
    different datasets have different implementation of sorting.

  Revision: 2006-2-3
  Remove coupling with different types of dataset by introducing helper class of sorting.
  The client is responsible to give an instance of appropriate helper class to the sort agent.
}
unit IntfSortAgent;

interface
uses
  classes, Forms, Dialogs, SysUtils, Controls, Db,  IntfHelpers;
type
  TSortAgent = class(TComponent)
  protected
    FSingleField : string;
    SingleAsc : boolean;
    SortHelper : TSortHelper;
      Dataset : TDataset;

  public
    {{
    }
    constructor CreateForSort(AOwner : TComponent;  Ds : TDataset; aSortHelper : TSortHelper); overload;

    function SortSingle(const f : string) : boolean;

    procedure NoSort; virtual;


//    property SingleField : string read FSingleField write SetSingleField;
  end;


implementation


{ TSortGridAgent }

constructor TSortAgent.CreateForSort(AOwner: TComponent; Ds: TDataset; aSortHelper : TSortHelper);
begin
  inherited Create(AOwner);
  SortHelper := aSortHelper;
  Dataset := Ds;
  SingleAsc := true;
end;

{procedure TSortGridAgent.SetSingleField(const f: string);
begin
  SortSingle(f);
end; }

procedure TSortAgent.NoSort;
begin
  // do nothing
end;

function TSortAgent.SortSingle(const f: string) : boolean;
var
  s : string;
begin
  if f = fSingleField then
  begin
    SingleAsc := not SingleAsc;
    if SingleAsc then
      s := f+' ASC'
    else
      s := f+' DESC';
  end
  else
  begin
    SingleAsc := true;
    s := f;
  end;

  fSingleField := f;
  SortHelper.SortSingle(dataset, s) ;
  Result := SingleAsc;
end;


end.
