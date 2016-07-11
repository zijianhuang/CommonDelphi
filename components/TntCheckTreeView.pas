{
  TntCheckTreeView provide a CheckTreeView supporting unicode. The codes in this
are based on JvComCtrls.pas of Jedi VCL and  TntComCtrls of Delphi Unicode Controls
creaed by Troy Wolbrink.

TTntCheckTreeView could be considered as a child of TJvTreeView and TTntTreeView.
The copyright notes of pas files involved are included.

Contributor:
  Zijian Huang (zijianhuang2000 AT gmail dot com).
}

{*****************************************************************************}
{                                                                             }
{    Tnt Delphi Unicode Controls                                              }
{      http://www.tntware.com/delphicontrols/unicode/                         }
{        Version: 2.1.15                                                      }
{                                                                             }
{    Copyright (c) 2002-2005, Troy Wolbrink (troy.wolbrink@tntware.com)       }
{                                                                             }
{*****************************************************************************}


{---------------------Notes of JvComCtrls ---------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvComCtrls.PAS, released Oct 10, 1999.

The Initial Developer of the Original Code is Petr Vones (petr dott v att mujmail dott cz)
Portions created by Petr Vones are Copyright (C) 1999 Petr Vones.
Portions created by Microsoft are Copyright (C) 1998, 1999 Microsoft Corp.
All Rights Reserved.

Contributor(s):
Peter Below [100113 dott 1101 att compuserve dott com] - alternate TJvPageControl.OwnerDraw routine
Peter Thörnqvist [peter3 at sourceforge dot net] added TJvIPAddress.AddressValues and TJvPageControl.ReduceMemoryUse
Alfi [alioscia_alessi att onde dott net] alternate TJvPageControl.OwnerDraw routine
Rudy Velthuis - ShowRange in TJvTrackBar
Andreas Hausladen - TJvIPAddress designtime bug, components changed to JvExVCL
Kai Gossens - TJvIPAddress: changing Color, drawing bug on XP (fat frame on edits removed)

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
  TJvTreeView:
    When dragging an item and MultiSelect is True droptarget node is not painted
    correctly.
-----------------------------------------------------------------------------}
// $Id: TntCheckTreeView.pas,v 1.1 2006/04/20 14:19:41 andy Exp $

unit TntCheckTreeView;

{$I jvcl.inc}
{$I vclonly.inc} // <- JvComCtrls

interface

uses
  Windows, Classes, ComCtrls, TntComCtrls, Menus, CommCtrl,  JvExControls, Forms,
  JvComCtrls,  Controls, Graphics, Contnrs, Messages, SysUtils
  , DesignIntf;
const
  TVIS_CHECKED = $2000;

type
  TJvTVCheckBoxStyle = (cbsNone, cbsNative, cbsJVCL);
  TJvTVCascadeOption = (poOnCheck, poOnUnCheck);
  TJvTVCascadeOptions = set of TJvTVCascadeOption;


  TTntCheckTreeView = class;

  TJvTreeViewCheckBoxOptions = class(TPersistent)
  private
    FTreeView: TTntCheckTreeView;
    FImageIndices: array[0..3] of Integer;
    FStyle: TJvTVCheckBoxStyle;
    FCascadeLevels: Integer;
    FCascadeOptions: TJvTVCascadeOptions;
    function GetImageIndex(const Index: Integer): Integer;
    procedure SetImageIndex(const Index, Value: Integer);
    procedure ChangeImage(OldIndex, NewIndex: Integer);
    procedure SetStyle(const Value: TJvTVCheckBoxStyle);
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create;
    property TreeView: TTntCheckTreeView read FTreeView;
  published
    // Style determines what type of checkboxes/radioitems are displayed in the treeview. Style can have one of the following values:
    // cbsNone   - no checkboxes or radiobuttons are displayed. Works like a normal treeview
    // cbsNative - use MS implementation of checkboxes. With this option you can only display
    //             checkboxes and not radioitems. You can't set up your own images using the StateImages/StateIndex properties
    //             of the treeview since this is overriden by the MS implementation
    // cbsJVCL  - use the custom JVCL style. With this option you can display any type of images
    //            by setting up your own StateImages ImageList and change the index properties below
    //            (see CheckBoxUncheckedIndex etc)
    property Style: TJvTVCheckBoxStyle read FStyle write SetStyle;
    // CascadeLevels controls how many levels down a check or uncheck of a checkbox is propagated
    // If CascadeLevels is -1, checks and unchecks are cascaded to all children recursively regardless of depth.
    // If CascadeLevels is 0 (the default), no propagation takes place. If CascadeLevels > 0, the check/uncheck is
    // propagated that number of levels (i.e if CascadeLevels = 2, checks will propagate 2 levels below
    // the currently selected node)
    // Note that this only works if Style = cbsJVCL!
    property CascadeLevels: Integer read FCascadeLevels write FCascadeLevels default 0;
    // CascadeOptions determines how propagation of checks/unchecks are performed. CascadeOptions is a
    // set that can contain a combination of the following values:
    // cbOnCheck - the checkbox state is propagated when the node is checked
    // cbOnUnCheck - the checkbox state is propagated when the node is unchecked
    // If both values are set, the checkbox state is always propagated (unless CascadeLevels = 0, of course)
    // Setting this property to an empty set is equivalent to setting CascadeLevels := 0, i.e no propagation
    property CascadeOptions: TJvTVCascadeOptions read FCascadeOptions write FCascadeOptions
      default [poOnCheck, poOnUnCheck];

    // Use the properties below in combination with an imagelist assigned to the
    // Treeviews StateImages property to control what images are displayed for the various checkbox and radioitems states
    // The actual images used are of no significance. Rather, it is the index of the property that controls what happens when a node is
    // checked or unchecked: if the node has its StateIndex set to CheckBoxUncheckedIndex or CheckBoxCheckedIndex, it will be treated as
    // a checkbox, if the node has its StateIndex set to RadioUncheckedIndex or RadioCheckedIndex, it will be treated as a radioitem
    // Checkboxes are toggled on and off, possibly with propagation
    // RadioItems are only toggled on when "checked" and there is no propagation but all other radioitems on the same level will
    // automatically be toggled off. Note that if you don't set a specific radioitem on a level as checked, they will all be unhecked
    // until the user checks one of them
    // NB! the first used index in a StateImages imagelist is 1, not 0! The 0'th item is ignored by the underlying treeview, so
    // you will have to assign a dummy image as the first to make the imagelist work for you

    // CheckBoxUncheckedIndex is the index for the image in StateImages used for the unchecked checkbox state
    property CheckBoxUncheckedIndex: Integer index 0 read GetImageIndex write SetImageIndex default 1;
    // CheckBoxCheckedIndex is the index for the image in StateImages used for the checked checkbox state
    property CheckBoxCheckedIndex: Integer index 1 read GetImageIndex write SetImageIndex default 2;
    // RadioUncheckedIndex is the index for the image in StateImages used for the unchecked radioitem state
    property RadioUncheckedIndex: Integer index 2 read GetImageIndex write SetImageIndex default 3;
    // RadioCheckedIndex is the index for the image in StateImages used for the checked radioitem state
    property RadioCheckedIndex: Integer index 3 read GetImageIndex write SetImageIndex default 4;
  end;

  TTntCheckTreeNode = class(TTntTreeNode)
  private
    FBold: Boolean;
    FChecked: Boolean;
    FPopupMenu: TPopupMenu;
    function GetChecked: Boolean;
    procedure SetChecked(Value: Boolean);
    function GetBold: Boolean;
    procedure SetBold(const Value: Boolean);
    procedure SetPopupMenu(const Value: TPopupMenu);
  protected
    procedure Reinitialize; virtual;
  public
    class function CreateEnh(AOwner: TTreeNodes): TTntCheckTreeNode;
    procedure Assign(Source: TPersistent); override;
    property Checked: Boolean read GetChecked write SetChecked;
    property Bold: Boolean read GetBold write SetBold;
    property PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
  end;

  TTntExTreeView = class(TTntTreeView, IJvExControl)
  private
    FHintColor: TColor;
    FMouseOver: Boolean;
    FHintWindowClass: THintWindowClass;
    {$IFDEF VCL}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    {$ENDIF VCL}
    FOnParentColorChanged: TNotifyEvent;
    function BaseWndProc(Msg: Integer; WParam: Integer = 0; LParam: Longint = 0): Integer; overload;
    function BaseWndProc(Msg: Integer; WParam: Integer; LParam: TControl): Integer; overload;
    function BaseWndProcEx(Msg: Integer; WParam: Integer; var LParam): Integer;
  protected
    procedure WndProc(var Msg: TMessage); override;
    {$IFNDEF CLR}
    procedure FocusChanged(AControl: TWinControl); dynamic;
    {$ENDIF !CLR}
    procedure VisibleChanged; reintroduce; dynamic;
    procedure EnabledChanged; reintroduce; dynamic;
    procedure TextChanged; reintroduce; virtual;
    procedure ColorChanged; reintroduce; dynamic;
    procedure FontChanged; reintroduce; dynamic;
    procedure ParentFontChanged; reintroduce; dynamic;
    procedure ParentColorChanged; reintroduce; dynamic;
    procedure ParentShowHintChanged; reintroduce; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean; reintroduce; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; reintroduce; dynamic;
    function HitTest(X, Y: Integer): Boolean; reintroduce; virtual;
    procedure MouseEnter(AControl: TControl); reintroduce; dynamic;
    procedure MouseLeave(AControl: TControl); reintroduce; dynamic;
    {$IFDEF COMPILER5}
    {$IFNDEF HASAUTOSIZE}
    procedure CMSetAutoSize(var Msg: TMessage); message CM_SETAUTOSIZE;
    procedure SetAutoSize(Value: Boolean); virtual;
    {$ENDIF !HASAUTOSIZE}
    {$ENDIF COMPILER5}
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clDefault;
    {$IFDEF VCL}
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    {$ENDIF VCL}
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  public
    constructor Create(AOwner: TComponent); override;
    property HintWindowClass: THintWindowClass read FHintWindowClass write FHintWindowClass;
  private
    FDotNetHighlighting: Boolean;
  protected
    procedure BoundsChanged; reintroduce; virtual;
    procedure CursorChanged; reintroduce; dynamic;
    procedure ShowingChanged; reintroduce; dynamic;
    procedure ShowHintChanged; reintroduce; dynamic;
    {$IFNDEF CLR}
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); reintroduce; dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); reintroduce; dynamic;
    {$ENDIF !CLR}
    procedure GetDlgCode(var Code: TDlgCodes); virtual;
    procedure FocusSet(PrevWnd: THandle); virtual;
    procedure FocusKilled(NextWnd: THandle); virtual;
    function DoEraseBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  published
    property DotNetHighlighting: Boolean read FDotNetHighlighting write FDotNetHighlighting default False;
  end;


  TTntCheckTreeView = class(TTntExTreeView)
  private
    FAutoDragScroll: Boolean;
    FClearBeforeSelect: Boolean;
    {$IFDEF COMPILER5}
    FMultiSelect: Boolean;
    {$ENDIF COMPILER5}
    FScrollDirection: Integer;
    FSelectedList: TObjectList;
    FSelectThisNode: Boolean;
    FOnCustomDrawItem: TTVCustomDrawItemEvent;
    FOnEditCancelled: TNotifyEvent;
    FOnSelectionChange: TNotifyEvent;
    FCheckBoxes: Boolean;
    FOnHScroll: TNotifyEvent;
    FOnVScroll: TNotifyEvent;
    FPageControl: TPageControl;
    FOnPage: TPageChangedEvent;
    FOnComparePage: TJvTreeViewComparePageEvent;
    FMenu: TMenu;
    FOldMenuChange: TMenuChangeEvent;
    FMenuDblClick: Boolean;
    FReinitializeTreeNode: Boolean;
    procedure InternalCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    function GetSelectedCount: Integer;
    function GetSelectedItem(Index: Integer): TTntTreeNode;
    {$IFDEF COMPILER5}
    procedure SetMultiSelect(const Value: Boolean);
    {$ENDIF COMPILER5}
    procedure SetScrollDirection(const Value: Integer);
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMTimer(var Msg: TWMTimer); message WM_TIMER;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure SetCheckBoxes(const Value: Boolean);
    function GetItemHeight: Integer;
    procedure SetItemHeight(Value: Integer);
    function GetInsertMarkColor: TColor;
    procedure SetInsertMarkColor(Value: TColor);
    function GetLineColor: TColor;
    procedure SetLineColor(Value: TColor);
    function GetMaxScrollTime: Integer;
    procedure SetMaxScrollTime(const Value: Integer);
    function GetUseUnicode: Boolean;
    procedure SetUseUnicode(const Value: Boolean);
    procedure SetMenu(const Value: TMenu);
    procedure DoMenuChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
    procedure SetPageControl(const Value: TPageControl);
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
  protected
    procedure RebuildFromMenu; virtual;
    function IsMenuItemClick(Node: TTreeNode): Boolean;
    function DoComparePage(Page: TTabSheet; Node: TTntTreeNode): Boolean; virtual;
    function CreateNode: TTreeNode; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;
    procedure WMPaint(var Msg: TMessage); message WM_PAINT;
    procedure Change(Node: TTreeNode); override;
    procedure Delete(Node: TTreeNode); override;
    procedure DoEditCancelled; dynamic;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoSelectionChange; dynamic;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    procedure Edit(const Item: TTVItem); override;
    procedure InvalidateNode(Node: TTreeNode);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure ResetPostOperationFlags;
    property ScrollDirection: Integer read FScrollDirection write SetScrollDirection;
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
    procedure DblClick; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearSelection; reintroduce;
    function IsNodeSelected(Node: TTreeNode): Boolean;
    procedure InvalidateNodeIcon(Node: TTntTreeNode);
    procedure InvalidateSelectedItems;
    procedure SelectItem(Node: TTreeNode; Unselect: Boolean = False);
    property SelectedItems[Index: Integer]: TTntTreeNode read GetSelectedItem;
    property SelectedCount: Integer read GetSelectedCount;
    function GetBold(Node: TTntTreeNode): Boolean;
    procedure SetBold(Node: TTntTreeNode; Value: Boolean);
    function GetChecked(Node: TTntTreeNode): Boolean;
    procedure SetChecked(Node: TTntTreeNode; Value: Boolean);
    procedure SetNodePopup(Node: TTntTreeNode; Value: TPopupMenu);
    function GetNodePopup(Node: TTntTreeNode): TPopupMenu;
    procedure InsertMark(Node: TTntTreeNode; MarkAfter: Boolean); // TVM_SETINSERTMARK
    procedure RemoveMark;
    property InsertMarkColor: TColor read GetInsertMarkColor write SetInsertMarkColor;
    property Checked[Node: TTntTreeNode]: Boolean read GetChecked write SetChecked;
    property MaxScrollTime: Integer read GetMaxScrollTime write SetMaxScrollTime;
    // UseUnicode should only be changed on Win95 and Win98 that has IE5 or later installed
    property UseUnicode: Boolean read GetUseUnicode write SetUseUnicode default False;
  published
    property LineColor: TColor read GetLineColor write SetLineColor default clDefault;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight default 16;
    property Menu: TMenu read FMenu write SetMenu;
    property MenuDblClick: Boolean read FMenuDblClick write FMenuDblClick default False;
    property HintColor;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex stored False;
    property Checkboxes: Boolean read FCheckBoxes write SetCheckBoxes default False;
    property PageControl: TPageControl read FPageControl write SetPageControl;
    property AutoDragScroll: Boolean read FAutoDragScroll write FAutoDragScroll default False;
    {$IFDEF COMPILER5}
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    {$ENDIF COMPILER5}
    property OnVerticalScroll: TNotifyEvent read FOnVScroll write FOnVScroll;
    property OnHorizontalScroll: TNotifyEvent read FOnHScroll write FOnHScroll;
    property OnPageChanged: TPageChangedEvent read FOnPage write FOnPage;
    property OnComparePage: TJvTreeViewComparePageEvent read FOnComparePage write FOnComparePage;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnParentColorChange;
    property OnCustomDrawItem: TTVCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem;
    property OnEditCancelled: TNotifyEvent read FOnEditCancelled write FOnEditCancelled;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
  end;

procedure Register;

implementation

uses
  JvWin32;


procedure Register;
begin

  RegisterComponents('Samples', [TTntCheckTreeView]);


end;

procedure ToggleTreeViewCheckBoxes(Node: TTntCheckTreeNode;
  AUnChecked, AChecked, ARadioUnchecked, ARadioChecked: Integer);
var
  Tmp: TTntTreeNode;
begin
  if Assigned(Node) then
  begin
    if Node.StateIndex = AUnChecked then
      Node.StateIndex := AChecked
    else
    if Node.StateIndex = AChecked then
      Node.StateIndex := AUnChecked
    else
    if Node.StateIndex = ARadioUnchecked then
    begin
      Tmp := Node.Parent;
      if not Assigned(Tmp) then
        Tmp := TTntTreeView(Node.TreeView).Items.GetFirstNode
      else
        Tmp := Tmp.getFirstChild;
      while Assigned(Tmp) do
      begin
        if Tmp.StateIndex in [ARadioUnchecked, ARadioChecked] then
          Tmp.StateIndex := ARadioUnchecked;
        Tmp := Tmp.getNextSibling;
      end;
      Node.StateIndex := ARadioChecked;
    end;
  end;
end;

//=== { TJvTreeViewCheckBoxOptions } =========================================

constructor TJvTreeViewCheckBoxOptions.Create;
var
  I: Integer;
begin
  inherited Create;
  for I := Low(FImageIndices) to High(FImageIndices) do
    FImageIndices[I] := I+1;
  FCascadeLevels := 0;
  FCascadeOptions := [poOnCheck, poOnUnCheck]
end;

procedure TJvTreeViewCheckBoxOptions.Assign(Source: TPersistent);
begin
  if (Source <> Self) and (Source is TJvTreeViewCheckBoxOptions) then
  begin
    Style := TJvTreeViewCheckBoxOptions(Source).Style;
    CascadeLevels := TJvTreeViewCheckBoxOptions(Source).CascadeLevels;
    CascadeOptions := TJvTreeViewCheckBoxOptions(Source).CascadeOptions;
    CheckBoxUncheckedIndex := TJvTreeViewCheckBoxOptions(Source).CheckBoxUncheckedIndex;
    CheckBoxCheckedIndex := TJvTreeViewCheckBoxOptions(Source).CheckBoxCheckedIndex;
    RadioUncheckedIndex := TJvTreeViewCheckBoxOptions(Source).RadioUncheckedIndex;
    RadioCheckedIndex := TJvTreeViewCheckBoxOptions(Source).RadioCheckedIndex;
  end
  else
    inherited Assign(Source);
end;

procedure TJvTreeViewCheckBoxOptions.ChangeImage(OldIndex, NewIndex: Integer);
var
  N: TTntTreeNode;
begin
  if Assigned(FTreeView) then
  begin
    FTreeView.Items.BeginUpdate;
    try
      N := FTreeView.Items.GetFirstNode;
      while Assigned(N) do
      begin
        if N.StateIndex = OldIndex then
          N.StateIndex := NewIndex;
        N := N.GetNext;
      end;
    finally
      FTreeView.Items.EndUpdate;
    end;
  end;
end;

function TJvTreeViewCheckBoxOptions.GetImageIndex(const Index: Integer): Integer;
begin
  if (Index >= 0) and (Index <= High(FImageIndices)) then
    Result := FImageIndices[Index]
  else
    Result := 0;
end;

procedure TJvTreeViewCheckBoxOptions.SetImageIndex(const Index, Value: Integer);
begin
  if (Index >= 0) and (Index <= High(FImageIndices)) and (FImageIndices[Index] <> Value) then
  begin
    ChangeImage(FImageIndices[Index], Value);
    FImageIndices[Index] := Value;
  end;
end;

procedure TJvTreeViewCheckBoxOptions.SetStyle(const Value: TJvTVCheckBoxStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    FTreeView.Checkboxes := FStyle = cbsNative;
  end;
end;

//=== { TTntCheckTreeView } ========================================================

const
  AutoScrollMargin = 20;
  AutoScrollTimerID = 100;

constructor TTntCheckTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCheckBoxes := False;
  // ControlStyle := ControlStyle + [csAcceptsControls];
  FSelectedList := TObjectList.Create(False);
  // Since IsCustomDrawn method is not virtual we have to assign ancestor's
  // OnCustomDrawItem event to enable custom drawing
  if not (csDesigning in ComponentState) then
    inherited OnCustomDrawItem := InternalCustomDrawItem;
end;

destructor TTntCheckTreeView.Destroy;
begin
  FreeAndNil(FSelectedList);
  inherited Destroy;
end;

procedure TTntCheckTreeView.Change(Node: TTreeNode);
begin
  if FClearBeforeSelect then
  begin
    FClearBeforeSelect := False;
    ClearSelection;
  end;
  if FSelectThisNode then
  begin
    FSelectThisNode := False;
    SelectItem(Node);
  end;
  inherited Change(Node);
  if not MenuDblClick and IsMenuItemClick(Node) then
    TMenuItem(Node.Data).OnClick(TMenuItem(Node.Data));
end;

procedure TTntCheckTreeView.ClearSelection;
var
  NeedInvalidate: array of TTntTreeNode;
  I: Integer;
begin
  FClearBeforeSelect := False;
  if FSelectedList.Count = 0 then
    Exit;
  DoSelectionChange;
  SetLength(NeedInvalidate, FSelectedList.Count);
  for I := 0 to FSelectedList.Count - 1 do
    NeedInvalidate[I] := SelectedItems[I];
  FSelectedList.Clear;
  for I := 0 to Length(NeedInvalidate) - 1 do
    InvalidateNode(NeedInvalidate[I]);
end;

function TTntCheckTreeView.CreateNode: TTreeNode;
begin
  Result := TTntCheckTreeNode.CreateEnh(Items);
end;

procedure TTntCheckTreeView.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if FCheckBoxes then
    Params.Style := Params.Style or TVS_CHECKBOXES;
end;

procedure TTntCheckTreeView.CreateWnd;
begin
  FReinitializeTreeNode := True;
  inherited CreateWnd;
end;

procedure TTntCheckTreeView.DestroyWnd;
var
  I: Integer;
begin
  // update the FChecked field with the current data
  for I := 0 to Items.Count - 1 do
    TTntCheckTreeNode(Items[I]).FChecked := TTntCheckTreeNode(Items[I]).Checked;
  inherited DestroyWnd;
end;

procedure TTntCheckTreeView.Delete(Node: TTreeNode);
begin
  if MultiSelect then
    FSelectedList.Remove(Node);
  inherited Delete(Node);
end;

procedure TTntCheckTreeView.DoEditCancelled;
begin
  if Assigned(FOnEditCancelled) then
    FOnEditCancelled(Self);
end;

procedure TTntCheckTreeView.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  ScrollDirection := 0;
  inherited DoEndDrag(Target, X, Y);
end;

procedure TTntCheckTreeView.DoEnter;
begin
  InvalidateSelectedItems;
  inherited DoEnter;
end;

procedure TTntCheckTreeView.DoExit;
begin
  InvalidateSelectedItems;
  inherited DoExit;
end;

procedure TTntCheckTreeView.DoSelectionChange;
begin
  if Assigned(FOnSelectionChange) then
    FOnSelectionChange(Self);
end;

procedure TTntCheckTreeView.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited DragOver(Source, X, Y, State, Accept);
  if not FAutoDragScroll then
    Exit;
  if Y < AutoScrollMargin then
    ScrollDirection := -1
  else
  if Y > ClientHeight - AutoScrollMargin then
    ScrollDirection := 1
  else
    ScrollDirection := 0;
end;

procedure TTntCheckTreeView.Edit(const Item: TTVItem);
begin
  inherited Edit(Item);
  if Item.pszText = nil then
    DoEditCancelled;
end;

function TTntCheckTreeView.GetBold(Node: TTntTreeNode): Boolean;
begin
  Result := TTntCheckTreeNode(Node).Bold;
end;

function TTntCheckTreeView.GetChecked(Node: TTntTreeNode): Boolean;
begin
  Result := TTntCheckTreeNode(Node).Checked;
end;

function TTntCheckTreeView.GetNodePopup(Node: TTntTreeNode): TPopupMenu;
begin
  Result := TTntCheckTreeNode(Node).PopupMenu;
end;

function TTntCheckTreeView.GetSelectedCount: Integer;
begin
  if MultiSelect then
    Result := FSelectedList.Count
  else
    Result := -1;
end;

function TTntCheckTreeView.GetSelectedItem(Index: Integer): TTntTreeNode;
begin
  Result := TTntTreeNode(FSelectedList[Index]);
end;

function TTntCheckTreeView.GetItemIndex: Integer;
begin
  Result := -1;
  if Assigned(Selected) and (Items.Count>0) then
  begin
    Result := 0;
    while (Result<Items.Count) and (Items[Result] <> Selected) do
      Inc(Result);
  end;
end;

procedure TTntCheckTreeView.InternalCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if MultiSelect then
  begin
    with Canvas.Font do
    begin // fix HotTrack bug in custom drawing
      OnChange(nil);
      if cdsHot in State then
      begin
        Style := Style + [fsUnderLine];
        if cdsSelected in State then
          Color := clHighlightText
        else
          Color := clHighlight;
      end;
    end;
    if IsNodeSelected(Node) then
    begin
      if Focused then
      begin
        Canvas.Font.Color := clHighlightText;
        Canvas.Brush.Color := clHighlight;
      end
      else
      if not HideSelection then
      begin
        Canvas.Font.Color := Font.Color;
        Canvas.Brush.Color := clInactiveBorder;
      end;
    end
    else
    begin
      Canvas.Font.Color := Font.Color;
      Canvas.Brush.Color := Color;
    end;
  end;
  if Assigned(FOnCustomDrawItem) then
    FOnCustomDrawItem(Self, Node, State, DefaultDraw);
end;

procedure TTntCheckTreeView.InvalidateNode(Node: TTreeNode);
var
  R: TRect;
begin
  if Assigned(Node) and Node.IsVisible then
  begin
    R := Node.DisplayRect(True);
    InvalidateRect(Handle, @R, False);
  end;
end;

procedure TTntCheckTreeView.InvalidateNodeIcon(Node: TTntTreeNode);
var
  R: TRect;
begin
  if Assigned(Node) and Assigned(Images) and Node.IsVisible then
  begin
    R := Node.DisplayRect(True);
    R.Right := R.Left;
    R.Left := R.Left - Images.Width * 3;
    InvalidateRect(Handle, @R, True);
  end;
end;

procedure TTntCheckTreeView.InvalidateSelectedItems;
var
  I: Integer;
begin
  if HandleAllocated then
    for I := 0 to SelectedCount - 1 do
      InvalidateNode(SelectedItems[I]);
end;

function TTntCheckTreeView.IsNodeSelected(Node: TTreeNode): Boolean;
begin
  Result := FSelectedList.IndexOf(Node) <> -1;
end;

procedure TTntCheckTreeView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if MultiSelect then
  begin
    ResetPostOperationFlags;
    if not (ssAlt in Shift) and not IsEditing then
    begin
      if Key = VK_SPACE then
        SelectItem(Selected, IsNodeSelected(Selected))
      else
      begin
        FSelectThisNode := True;
        if Shift * [ssShift, ssCtrl] = [] then
          FClearBeforeSelect := True;
      end;
    end;
  end
  else
    FSelectThisNode := True;
  inherited KeyDown(Key, Shift);
  if ((Key = VK_SPACE) or (Key = VK_RETURN)) and MenuDblClick and IsMenuItemClick(Selected) then
    TMenuItem(Selected.Data).OnClick(TMenuItem(Selected.Data));
end;

procedure TTntCheckTreeView.KeyPress(var Key: Char);
begin
  if MultiSelect and (Key = ' ') and not IsEditing then
    Key := #0
  else
    inherited KeyPress(Key);
end;

procedure TTntCheckTreeView.ResetPostOperationFlags;
begin
  FClearBeforeSelect := False;
  FSelectThisNode := not MultiSelect;
end;

procedure TTntCheckTreeView.SetItemIndex(const Value: Integer);
begin
  if ItemIndex = -1 then
    Selected := nil
  else
    Selected := Items[Value];
end;

procedure TTntCheckTreeView.SelectItem(Node: TTreeNode; Unselect: Boolean);
begin
  if Unselect then
    FSelectedList.Remove(Node)
  else
  if not IsNodeSelected(Node) then
    FSelectedList.Add(Node);
  if HandleAllocated then
    InvalidateNode(Node);
  DoSelectionChange;
end;

procedure TTntCheckTreeView.SetBold(Node: TTntTreeNode; Value: Boolean);
begin
  TTntCheckTreeNode(Node).Bold := Value;
end;

procedure TTntCheckTreeView.SetCheckBoxes(const Value: Boolean);
{$IFDEF VisualCLX}
const
  cNewType: array [Boolean] of TListViewItemType = (itDefault, itCheckBox);
{$ENDIF VisualCLX}
begin
  if FCheckBoxes <> Value then
  begin
    FCheckBoxes := Value;
    RecreateWnd;
    {$IFDEF VisualCLX}
    Items.ChangeItemTypes(cNewType[FCheckBoxes]);
    Selected := nil;
    {$ENDIF VisualCLX}
  end;
end;

procedure TTntCheckTreeView.SetChecked(Node: TTntTreeNode; Value: Boolean);
begin
  TTntCheckTreeNode(Node).Checked := Value;
end;


procedure TTntCheckTreeView.SetNodePopup(Node: TTntTreeNode; Value: TPopupMenu);
begin
  TTntCheckTreeNode(Node).PopupMenu := Value;
end;

procedure TTntCheckTreeView.SetScrollDirection(const Value: Integer);
begin
  if FScrollDirection <> Value then
  begin
    if Value = 0 then
      KillTimer(Handle, AutoScrollTimerID)
    else
    if (Value <> 0) and (FScrollDirection = 0) then
      SetTimer(Handle, AutoScrollTimerID, 200, nil);
    FScrollDirection := Value;
  end;
end;

procedure TTntCheckTreeView.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  if Assigned(FOnHScroll) then
    FOnHScroll(Self);
end;

procedure TTntCheckTreeView.WMLButtonDown(var Msg: TWMLButtonDown);
var
  Node: TTntTreeNode;
begin
  ResetPostOperationFlags;
  with Msg do
    if MultiSelect and (htOnItem in GetHitTestInfoAt(XPos, YPos)) then
    begin
      Node := GetNodeAt(XPos, YPos);
      if Assigned(Node) and (ssCtrl in KeysToShiftState(Keys)) then
        SelectItem(Node, IsNodeSelected(Node))
      else
      begin
        ClearSelection;
        SelectItem(Node);
      end;
    end;
  inherited;
end;

procedure TTntCheckTreeView.WMPaint(var Msg: TMessage);
var
  I: Integer;
begin
  inherited;
  { The tree node's checked property is reset at the first WM_PAINT.
    So we must set it here again, but only the first time. }
  if FReinitializeTreeNode then
  begin
    FReinitializeTreeNode := False;
    for I := 0 to Items.Count - 1 do
      TTntCheckTreeNode(Items[I]).Reinitialize;
  end;
end;

procedure TTntCheckTreeView.CNNotify(var Msg: TWMNotify);
var
  Node: TTntTreeNode;
  Point: TPoint;
  I, J: Integer;
begin
  inherited;
  if Windows.GetCursorPos(Point) then // prevent AV after "computer locked" dialog
  begin
    Point := ScreenToClient(Point);
    with Msg, Point do
      case NMHdr^.code of
        NM_CLICK, NM_RCLICK:
          begin
            Node := GetNodeAt(X, Y);
            if Assigned(Node) then
              Selected := Node
            else
            begin
              if FCheckBoxes then
              begin
                Node := GetNodeAt(X + 16, Y);
                if Assigned(Node) then
                  Selected := Node
              end;
            end;
            if (Selected <> nil) and (NMHdr^.code = NM_RCLICK) then
              TTntCheckTreeNode(Selected).PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
          end;
        TVN_SELCHANGEDA, TVN_SELCHANGEDW:
          begin
            if Assigned(FPageControl) then
              if Selected <> nil then
              begin
                //Search for the correct page
                J := -1;
                for I := 0 to FPageControl.PageCount - 1 do
                  if DoComparePage(FPageControl.Pages[I], Selected) then
                    J := I;
                if J <> -1 then
                begin
                  FPageControl.ActivePage := FPageControl.Pages[J];
                  if Assigned(FOnPage) then
                    FOnPage(Self, Selected, FPageControl.Pages[J]);
                end;
              end;
          end;
      end;
  end;
end;

function TTntCheckTreeView.DoComparePage(Page: TTabSheet; Node: TTntTreeNode): Boolean;
begin
  if Assigned(FOnComparePage) then
    FOnComparePage(Self, Page, Node, Result)
  else
    Result := AnsiSameText(Page.Caption, Node.Text);
end;

procedure TTntCheckTreeView.WMTimer(var Msg: TWMTimer);
var
  DragImages: TDragImageList;
begin
  if Msg.TimerID = AutoScrollTimerID then
  begin
    DragImages := GetDragImages;
    if Assigned(DragImages) then
      DragImages.HideDragImage;
    case FScrollDirection of
      -1:
        SendMessage(Handle, WM_VSCROLL, SB_LINEUP, 0);
      1:
        SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 0);
    end;
    if Assigned(DragImages) then
      DragImages.ShowDragImage;
    Msg.Result := 1;
  end
  else
    inherited;
end;

procedure TTntCheckTreeView.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  if Assigned(FOnVScroll) then
    FOnVScroll(Self);
end;

function TTntCheckTreeView.GetItemHeight: Integer;
begin
  if HandleAllocated then
    Result := SendMessage(Handle, TVM_GETITEMHEIGHT, 0, 0)
  else
    Result := 16;
end;

procedure TTntCheckTreeView.SetItemHeight(Value: Integer);
begin
  if Value <= 0 then
    Value := 16;
  if HandleAllocated then
    SendMessage(Handle, TVM_SETITEMHEIGHT, Value, 0);
end;

function TTntCheckTreeView.GetInsertMarkColor: TColor;
begin
  if HandleAllocated then
    Result := SendMessage(Handle, TVM_GETINSERTMARKCOLOR, 0, 0)
  else
    Result := clDefault;
end;

procedure TTntCheckTreeView.SetInsertMarkColor(Value: TColor);
begin
  if HandleAllocated then
  begin
    if Value = clDefault then
      Value := Font.Color;
    SendMessage(Handle, TVM_SETINSERTMARKCOLOR, 0, ColorToRGB(Value));
  end;
end;

procedure TTntCheckTreeView.InsertMark(Node: TTntTreeNode; MarkAfter: Boolean);
begin
  if HandleAllocated then
    if Node = nil then
      RemoveMark
    else
      SendMessage(Handle, TVM_SETINSERTMARK, Integer(MarkAfter), Integer(Node.ItemId));
end;

procedure TTntCheckTreeView.RemoveMark;
begin
  if HandleAllocated then
    SendMessage(Handle, TVM_SETINSERTMARK, 0, 0);
end;

function TTntCheckTreeView.GetLineColor: TColor;
begin
  if HandleAllocated then
    Result := SendMessage(Handle, TVM_GETLINECOLOR, 0, 0)
  else
    Result := clDefault;
end;

procedure TTntCheckTreeView.SetLineColor(Value: TColor);
begin
  if HandleAllocated then
  begin
    if Value = clDefault then
      Value := Font.Color;
    SendMessage(Handle, TVM_SETLINECOLOR, 0, ColorToRGB(Value));
  end;
end;

function TTntCheckTreeView.GetMaxScrollTime: Integer;
begin
  if HandleAllocated then
    Result := SendMessage(Handle, TVM_GETSCROLLTIME, 0, 0)
  else
    Result := -1;
end;

procedure TTntCheckTreeView.SetMaxScrollTime(const Value: Integer);
begin
  if HandleAllocated then
    SendMessage(Handle, TVM_SETSCROLLTIME, Value, 0);
end;

function TTntCheckTreeView.GetUseUnicode: Boolean;
begin
  if HandleAllocated then
    Result := Boolean(SendMessage(Handle, TVM_GETUNICODEFORMAT, 0, 0))
  else
    Result := False;
end;

procedure TTntCheckTreeView.SetUseUnicode(const Value: Boolean);
begin
  // only try to change value if not running on NT platform
  // (see MSDN: CCM_SETUNICODEFORMAT explanation for details)
  if HandleAllocated and (Win32Platform <> VER_PLATFORM_WIN32_NT) then
    SendMessage(Handle, TVM_SETUNICODEFORMAT, Integer(Value), 0);
end;

type
  TMenuAccessProtected = class(TMenu);

procedure TTntCheckTreeView.SetMenu(const Value: TMenu);
begin
  if FMenu <> Value then
  begin
    if (FMenu <> nil) and not (csDesigning in ComponentState) then
      TMenuAccessProtected(FMenu).OnChange := FOldMenuChange;
    FMenu := Value;
    if FMenu <> nil then
    begin
      FMenu.FreeNotification(Self);
      if not (csDesigning in ComponentState) then
      begin
        FOldMenuChange := TMenuAccessProtected(FMenu).OnChange;
        TMenuAccessProtected(FMenu).OnChange := DoMenuChange;
      end;
    end;
    RebuildFromMenu;
  end;
end;

procedure TTntCheckTreeView.DoMenuChange(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  if Assigned(FOldMenuChange) then
    FOldMenuChange(Sender, Source, Rebuild);
  RebuildFromMenu;
end;

procedure TTntCheckTreeView.RebuildFromMenu;
var
  I: Integer;

  procedure MakeSubMenu(AParent: TTntTreeNode; AMenuItem: TMenuItem);
  var
    I: Integer;
    ANode: TTntTreeNode;
  begin
    if (AMenuItem.Caption <> '-') and (AMenuItem.Caption <> '') then
    begin
      ANode := Items.AddChildObject(AParent, StripHotKey(AMenuItem.Caption), TObject(AMenuItem));
      ANode.ImageIndex := AMenuItem.ImageIndex;
      ANode.SelectedIndex := AMenuItem.ImageIndex;
      for I := 0 to AMenuItem.Count - 1 do
        MakeSubMenu(ANode, AMenuItem.Items[I]);
    end;
  end;

begin
  Items.BeginUpdate;
  try
    Items.Clear;
    if Menu <> nil then
    begin
      for I := 0 to Menu.Items.Count - 1 do
        MakeSubMenu(nil, Menu.Items[I]);
    end;
  finally
    Items.EndUpdate;
  end;
end;

procedure TTntCheckTreeView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FMenu then
      Menu := nil
    else
    if AComponent = FPageControl then
      PageControl := nil;
  end;
end;

procedure TTntCheckTreeView.DblClick;
begin
  inherited DblClick;
  if MenuDblClick and IsMenuItemClick(Selected) then
    TMenuItem(Selected.Data).OnClick(TMenuItem(Selected.Data));
end;

function TTntCheckTreeView.IsMenuItemClick(Node: TTreeNode): Boolean;
begin
 Result := Assigned(Menu) and Assigned(Node) and Assigned(Node.Data) and
    (TObject(Node.Data) is TMenuItem) and Assigned(TMenuItem(Node.Data).OnClick);
end;

procedure TTntCheckTreeView.SetPageControl(const Value: TPageControl);
begin
  if FPageControl <> Value then
  begin
    FPageControl := Value;
    if FPageControl <> nil then
      FPageControl.FreeNotification(Self);
  end;
end;

//=== { TTntCheckTreeNode } ========================================================


class function TTntCheckTreeNode.CreateEnh(AOwner: TTreeNodes): TTntCheckTreeNode;
begin
  Result := Create(AOwner);
  Result.FPopupMenu := TPopupMenu.Create(AOwner.Owner);
end;

procedure TTntCheckTreeNode.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TTntCheckTreeNode then
  begin
    Checked := TTntCheckTreeNode(Source).Checked;
    Bold := TTntCheckTreeNode(Source).Bold;
    PopupMenu := TTntCheckTreeNode(Source).PopupMenu;
  end;
end;

procedure TTntCheckTreeNode.SetPopupMenu(const Value: TPopupMenu);
begin
  FPopupMenu := Value;
end;

function TTntCheckTreeNode.GetBold: Boolean;
var
  Item: TTVItem;
begin
  with Item do
  begin
    mask := TVIF_STATE;
    hItem := ItemId;
    if TreeView_GetItem(Handle, Item) then
      Result := ((Item.State and TVIS_BOLD) = TVIS_BOLD)
    else
      Result := False;
  end;
end;

function TTntCheckTreeNode.GetChecked: Boolean;
var
  Item: TTVItem;
begin
  with Item do
  begin
    mask := TVIF_STATE;
    hItem := ItemId;
    if TreeView_GetItem(Handle, Item) then
      Result := ((Item.State and TVIS_CHECKED) = TVIS_CHECKED)
    else
      Result := False;
  end;
end;

procedure TTntCheckTreeNode.SetBold(const Value: Boolean);
var
  Item: TTVItem;
begin
  if Value <> FBold then
  begin
    FBold := Value;
    FillChar(Item, SizeOf(Item), 0);
    with Item do
    begin
      mask := TVIF_STATE;
      hItem := ItemId;
      StateMask := TVIS_BOLD;
      if Value then
        Item.State := TVIS_BOLD
      else
        Item.State := 0;
      TreeView_SetItem(Handle, Item);
    end;
  end;
end;

procedure TTntCheckTreeNode.SetChecked(Value: Boolean);
var
  Item: TTVItem;
begin
  if Value <> FChecked then
  begin
    FChecked := Value;
    FillChar(Item, SizeOf(Item), 0);
    with Item do
    begin
      hItem := ItemId;
      mask := TVIF_STATE;
      StateMask := TVIS_STATEIMAGEMASK;
      if Value then
        Item.State := TVIS_CHECKED
      else
        Item.State := TVIS_CHECKED shr 1;
      TreeView_SetItem(Handle, Item);
    end;
  end;
end;

procedure TTntCheckTreeNode.Reinitialize;
begin
  if FChecked <> GetChecked then
  begin
    FChecked := not FChecked;
    SetChecked(not FChecked);
  end;
end;


{procedure TTntCheckTreeView.SetCheckBoxes(const Value: Boolean);
begin
  if FCheckBoxes <> Value then
  begin
    FCheckBoxes := Value;
    RecreateWnd;
  end;
end;}

constructor TTntExTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHintColor := clDefault;
end;

function TTntExTreeView.BaseWndProc(Msg: Integer; WParam: Integer = 0; LParam: Longint = 0): Integer;
var
  Mesg: TMessage;
begin
  Mesg := CreateWMMessage(Msg, WParam, LParam);
  inherited WndProc(Mesg);
  Result := Mesg.Result;
end;

function TTntExTreeView.BaseWndProc(Msg: Integer; WParam: Integer; LParam: TControl): Integer;
var
  Mesg: TMessage;
begin
  Mesg := CreateWMMessage(Msg, WParam, LParam);
  inherited WndProc(Mesg);
  Result := Mesg.Result;
end;

function TTntExTreeView.BaseWndProcEx(Msg: Integer; WParam: Integer; var LParam): Integer;
var
  Mesg: TStructPtrMessage;
begin
  Mesg := TStructPtrMessage.Create(Msg, WParam, LParam);
  try
    inherited WndProc(Mesg.Msg);
  finally
    Result := Mesg.Msg.Result;
    Mesg.Free;
  end;
end;

procedure TTntExTreeView.VisibleChanged;
begin
  BaseWndProc(CM_VISIBLECHANGED);
end;

procedure TTntExTreeView.EnabledChanged;
begin
  BaseWndProc(CM_ENABLEDCHANGED);
end;

procedure TTntExTreeView.TextChanged;
begin
  BaseWndProc(CM_TEXTCHANGED);
end;

procedure TTntExTreeView.FontChanged;
begin
  BaseWndProc(CM_FONTCHANGED);
end;

procedure TTntExTreeView.ColorChanged;
begin
  BaseWndProc(CM_COLORCHANGED);
end;

procedure TTntExTreeView.ParentFontChanged;
begin
  BaseWndProc(CM_PARENTFONTCHANGED);
end;

procedure TTntExTreeView.ParentColorChanged;
begin
  BaseWndProc(CM_PARENTCOLORCHANGED);
  if Assigned(OnParentColorChange) then
    OnParentColorChange(Self);
end;

procedure TTntExTreeView.ParentShowHintChanged;
begin
  BaseWndProc(CM_PARENTSHOWHINTCHANGED);
end;

function TTntExTreeView.WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean;
begin
  Result := BaseWndProc(CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TTntExTreeView.HitTest(X, Y: Integer): Boolean;
begin
  Result := BaseWndProc(CM_HITTEST, 0, SmallPointToLong(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

function TTntExTreeView.HintShow(var HintInfo: THintInfo): Boolean;
begin
  GetHintColor(HintInfo, Self, FHintColor);
  if FHintWindowClass <> nil then
    HintInfo.HintWindowClass := FHintWindowClass;
  Result := BaseWndProcEx(CM_HINTSHOW, 0, HintInfo) <> 0;
end;

procedure TTntExTreeView.MouseEnter(AControl: TControl);
begin
  FMouseOver := True;
  {$IFDEF VCL}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$ENDIF VCL}
  BaseWndProc(CM_MOUSEENTER, 0, AControl);
end;

procedure TTntExTreeView.MouseLeave(AControl: TControl);
begin
  FMouseOver := False;
  BaseWndProc(CM_MOUSELEAVE, 0, AControl);
  {$IFDEF VCL}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$ENDIF VCL}
end;

{$IFNDEF CLR}
procedure TTntExTreeView.FocusChanged(AControl: TWinControl);
begin
  BaseWndProc(CM_FOCUSCHANGED, 0, AControl);
end;
{$ENDIF !CLR}

{$IFDEF COMPILER5}
{$IFNDEF HASAUTOSIZE}

procedure TTntExTreeView.CMSetAutoSize(var Msg: TMessage);
begin
  SetAutoSize(Msg.WParam <> 0);
end;

procedure TTntExTreeView.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;

{$ENDIF !HASAUTOSIZE}
{$ENDIF COMPILER5}

procedure TTntExTreeView.BoundsChanged;
begin
end;

procedure TTntExTreeView.CursorChanged;
begin
  BaseWndProc(CM_CURSORCHANGED);
end;

procedure TTntExTreeView.ShowingChanged;
begin
  BaseWndProc(CM_SHOWINGCHANGED);
end;

procedure TTntExTreeView.ShowHintChanged;
begin
  BaseWndProc(CM_SHOWHINTCHANGED);
end;

{$IFNDEF CLR}
{ VCL sends CM_CONTROLLISTCHANGE and CM_CONTROLCHANGE in a different order than
  the CLX methods are used. So we must correct it by evaluating "Inserting". }
procedure TTntExTreeView.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  if Inserting then
    BaseWndProc(CM_CONTROLLISTCHANGE, Integer(Control), Integer(Inserting))
  else
    BaseWndProc(CM_CONTROLCHANGE, Integer(Control), Integer(Inserting));
end;

procedure TTntExTreeView.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  if not Inserting then
    BaseWndProc(CM_CONTROLLISTCHANGE, Integer(Control), Integer(Inserting))
  else
    BaseWndProc(CM_CONTROLCHANGE, Integer(Control), Integer(Inserting));
end;
{$ENDIF !CLR}

procedure TTntExTreeView.GetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TTntExTreeView.FocusSet(PrevWnd: THandle);
begin
  BaseWndProc(WM_SETFOCUS, Integer(PrevWnd), 0);
end;

procedure TTntExTreeView.FocusKilled(NextWnd: THandle);
begin
  BaseWndProc(WM_KILLFOCUS, Integer(NextWnd), 0);
end;

function TTntExTreeView.DoEraseBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  Result := BaseWndProc(WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
end;

{$IFDEF JVCLThemesEnabledD56}
function TTntExTreeView.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TTntExTreeView.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}

procedure TTntExTreeView.WndProc(var Msg: TMessage);
var
  IdSaveDC: Integer;
  DlgCodes: TDlgCodes;
  Canvas: TCanvas;
  {$IFDEF CLR}
  AHintInfo: THintInfo;
  {$ENDIF CLR}
begin
  if not DispatchIsDesignMsg(Self, Msg) then
  begin
    case Msg.Msg of
   //   CM_DENYSUBCLASSING:
   //   {$IFNDEF CLR}
   //   Msg.Result := Ord(GetInterfaceEntry(IJvDenySubClassing) <> nil);
   //   {$ELSE}
   //   Msg.Result := Integer(Supports(Self, IJvDenySubClassing));
  //    {$ENDIF !CLR}
    CM_DIALOGCHAR:
      with TCMDialogChar{$IFDEF CLR}.Create{$ENDIF}(Msg) do
        Result := Ord(WantKey(CharCode, KeyDataToShiftState(KeyData), WideChar(CharCode)));
    CM_HINTSHOW:
      {$IFNDEF CLR}
      with TCMHintShow(Msg) do
        Result := Integer(HintShow(HintInfo^));
      {$ELSE}
      with TCMHintShow.Create(Msg) do
      begin
        AHintInfo := HintInfo;
        Result := Integer(HintShow(AHintInfo));
        HintInfo := AHintInfo;
      end;
      {$ENDIF !CLR}
    CM_HITTEST:
      with TCMHitTest{$IFDEF CLR}.Create{$ENDIF}(Msg) do
        Result := Integer(HitTest(XPos, YPos));
    CM_MOUSEENTER:
      MouseEnter({$IFDEF CLR}nil{$ELSE}TControl(Msg.LParam){$ENDIF});
    CM_MOUSELEAVE:
      MouseLeave({$IFDEF CLR}nil{$ELSE}TControl(Msg.LParam){$ENDIF});
    CM_VISIBLECHANGED:
      VisibleChanged;
    CM_ENABLEDCHANGED:
      EnabledChanged;
    CM_TEXTCHANGED:
      TextChanged;
    CM_FONTCHANGED:
      FontChanged;
    CM_COLORCHANGED:
      ColorChanged;
    {$IFNDEF CLR}
    CM_FOCUSCHANGED:
      FocusChanged(TWinControl(Msg.LParam));
    {$ENDIF !CLR}
    CM_PARENTFONTCHANGED:
      ParentFontChanged;
    CM_PARENTCOLORCHANGED:
      ParentColorChanged;
    CM_PARENTSHOWHINTCHANGED:
      ParentShowHintChanged;
    CM_CURSORCHANGED:
      CursorChanged;
    CM_SHOWINGCHANGED:
      ShowingChanged;
    CM_SHOWHINTCHANGED:
      ShowHintChanged;
    {$IFNDEF CLR}
    CM_CONTROLLISTCHANGE:
      if Msg.LParam <> 0 then
        ControlsListChanging(TControl(Msg.WParam), True)
      else
        ControlsListChanged(TControl(Msg.WParam), False);
    CM_CONTROLCHANGE:
      if Msg.LParam = 0 then
        ControlsListChanging(TControl(Msg.WParam), False)
      else
        ControlsListChanged(TControl(Msg.WParam), True);
    {$ENDIF !CLR}
    WM_SETFOCUS:
      FocusSet(THandle(Msg.WParam));
    WM_KILLFOCUS:
      FocusKilled(THandle(Msg.WParam));
    WM_SIZE:
      begin
        inherited WndProc(Msg);
        BoundsChanged;
      end;
    WM_ERASEBKGND:
      begin
        IdSaveDC := SaveDC(HDC(Msg.WParam)); // protect DC against Stock-Objects from Canvas
        Canvas := TCanvas.Create;
        try
          Canvas.Handle := HDC(Msg.WParam);
          Msg.Result := Ord(DoEraseBackground(Canvas, Msg.LParam));
        finally
          Canvas.Handle := 0;
          Canvas.Free;
          RestoreDC(HDC(Msg.WParam), IdSaveDC);
        end;
      end;
    WM_PRINTCLIENT, WM_PRINT: // VCL bug fix
      begin
        IdSaveDC := SaveDC(HDC(Msg.WParam)); // protect DC against changes
        try
          inherited WndProc(Msg);
        finally
          RestoreDC(HDC(Msg.WParam), IdSaveDC);
        end;
      end;
    WM_GETDLGCODE:
      begin
        inherited WndProc(Msg);
        DlgCodes := [dcNative] + DlgcToDlgCodes(Msg.Result);
        GetDlgCode(DlgCodes);
        if not (dcNative in DlgCodes) then
          Msg.Result := DlgCodesToDlgc(DlgCodes);
      end;
    else
      inherited WndProc(Msg);
    end;
    if DotNetHighlighting then
      HandleDotNetHighlighting(Self, Msg, MouseOver, Color);
  end;
end;

end.

