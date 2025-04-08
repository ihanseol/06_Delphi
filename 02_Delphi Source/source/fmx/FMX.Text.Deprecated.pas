{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.Deprecated;

interface

{$SCOPEDENUMS ON}
{$WARNINGS OFF W1000}

uses
  System.Types, System.Classes, System.UITypes, System.Generics.Collections, FMX.Platform, FMX.Edit, FMX.Graphics,
  FMX.Types, FMX.Controls, FMX.TextLayout, FMX.Objects, FMX.MagnifierGlass, FMX.SpellChecker, FMX.Menus, FMX.Text,
  FMX.Presentation.Messages, FMX.Presentation.Style, FMX.Controls.Presentation, FMX.Controls.Model, FMX.Clipboard,
  FMX.Text.UndoManager, FMX.ScrollBox.Style, FMX.Memo, FMX.Memo.Types, FMX.ComboEdit, FMX.Pickers, FMX.ListBox,
  FMX.ComboTrackBar, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox, FMX.SearchBox, FMX.SpinBox, FMX.Memo.Style,
  FMX.Edit.Style;

type

{ TComboEditListBox }

  TStyledComboEdit = class;

  TComboEditListBox = class(TCustomListBox)
  private
    [Weak] FStyledComboEdit: TStyledComboEdit;
    [Weak] FModel: TComboEditModel;
    FInKeyDown: Boolean;
    procedure HandleStringsChanged(const S: string; const Op: TCustomListBox.TStringsChangeOp);
  protected
    function GetDefaultStyleLookupName: string; override;
    function GetObservers: TObservers; override;
    /// <summary>Returns model of <c>TComboEditModel</c></summary>
    property Model: TComboEditModel read FModel write FModel;
  public
    constructor Create(AOwner: TComponent); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  end;

{ TStyledComboEditBase }

  TStyledComboEditBase = class(TStyledEdit)
  private
    FNeedSetFocusAfterButtonClick: Boolean;
    FArrowButton: TControl;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    property ArrowButton: TControl read FArrowButton;
    /// <summary>Drop down list</summary>
    procedure PMDropDown(var AMessage: TDispatchMessage); message PM_DROPDOWN;
    /// <summary>Close the drop-down list.</summary>
    procedure PMCloseDropDown(var AMessage: TDispatchMessage); message PM_CLOSE_DROPDOWN;
    procedure Change; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single); virtual;
    /// <summary>Can user open Drop Down list by clicking on Arrow Button</summary>
    function CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean; virtual;
    procedure DropDown; virtual; abstract;
    /// <summary> This method closes the drop-down list, if it was opened </summary>
    procedure CloseDropDown; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TStyledComboEdit }

  TStyledComboEdit = class(TStyledComboEditBase)
  private type
    TStateInfo = record
      Saved: Boolean;
      ItemIndex: Integer;
      Text: string;
    end;
  private
    FPopup: TPopup;
    FListBox: TComboEditListBox;
    FListPicker: TCustomListPicker;
    FSavedState: TStateInfo;
    function GetComboEdit: TCustomComboEdit;
    procedure RebuildList;
    procedure RefreshSelectedItem;
    function GetModel: TComboEditModel;
    procedure DoOnValueChangedFromDropDownList(Sender: TObject; const AValueIndex: Integer);
    procedure DoPopup(Sender: TObject);
    procedure DoClosePopup(Sender: TObject);
  protected
    { Messages From Model}
    procedure MMItemIndexChanged(var AMessage: TDispatchMessage); message MM_ITEMINDEX_CHANGED;
    procedure MMItemHeightChanged(var AMessage: TDispatchMessage); message MM_ITEMHEIGHT_CHANGED;
    procedure MMItemWidthChanged(var AMessage: TDispatchMessage); message MM_ITEMWIDTH_CHANGED;
    procedure MMItemsChanged(var AMessage: TDispatchMessage); message MM_ITEMS_CHANGED;
    procedure MMListBoxResourceChanged(var AMessage: TDispatchMessageWithValue<string>); message MM_LISTBOXRESOURCE_CHANGED;
    { Messages From Controller }
    /// <summary>Notification about initialization of presentation</summary>
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    procedure DoAbsoluteChanged; override;
  protected
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    /// <summary>Creates listbox for implementation Drop Down List</summary>
    function CreateListBox: TComboEditListBox; virtual;
    /// <summary>Updates width of drop down list</summary>
    procedure DoRealign; override;
    procedure DoExit; override;
    /// <summary>Saves current value of <c>ItemIndex</c> and <c>Text</c></summary>
    procedure SaveState;
    /// <summary> Restores previous saved save of <c>ItemIndex</c> and <c>Text</c>.
    /// If control didn't save state, this method will ignore invoke. </summary>
    procedure RestoreState;
    /// <summary>Initialization of List Picker</summary>
    procedure InitPicker(AListPicker: TCustomListPicker); virtual;
    /// <summary>Recalculates popup size based on items</summary>
    procedure RecalculatePopupSize; virtual;
    /// <summary>Defines <c>TComboEdit</c> model class</summary>
    function DefineModelClass: TDataModelClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>Opens drop down list. If lsit is opened, it will close popup.</summary>
    procedure DropDown; override;
    /// <summary>Closes drop down list</summary>
    procedure CloseDropDown; override;
    procedure Clear;
    /// <summary>Access to presented control</summary>
    property ComboEdit: TCustomComboEdit read GetComboEdit;
    /// <summary>Returns model of <c>TComboEditModel</c></summary>
    property Model: TComboEditModel read GetModel;
    property ListBox: TComboEditListBox read FListBox;
    /// <summary>Returns list picker, if current platform implements pickers</summary>
    property ListPicker: TCustomListPicker read FListPicker;
  end;

{ TStyledEditBox }

  TStyledEditBox = class(TStyledEdit)
  private
    function GetModel: TEditBoxModel; overload;
    function GetEditBox: TCustomEditBox;
  protected
    { Messages From Model}
    procedure MMValueTypeChanged(var AMessage: TDispatchMessage); message MM_VALUETYPE_CHANGED;
    procedure MMDecimalDigitsChanged(var AMessage: TDispatchMessage); message MM_DECIMALDIGITS_CHANGED;
    procedure MMValueRangeChanged(var AMessage: TDispatchMessage); message MM_VALUERANGE_CHANGED;
  protected
    procedure KeyDown(var Key: Word; var KeyChar: Char; Shift: TShiftState); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    /// <summary>Defines <c>TEditBox</c> model class</summary>
    function DefineModelClass: TDataModelClass; override;
  public
    property Model: TEditBoxModel read GetModel;
    property EditBox: TCustomEditBox read GetEditBox;
  end;


{ TStyledComboTrackBar }

  TStyledComboTrackBar = class(TStyledEditBox)
  private
    FNeedSetFocusAfterButtonClick: Boolean;
    FArrowButton: TControl;
    FPopup: TPopup;
    FTrackBar: TTrackBar;
    FValueChanged: Boolean;
    FTextUpdating: Boolean;
    function GetModel: TComboTrackBarModel;
    procedure BeforeChangeProc(Sender: TObject);
    procedure AfterChangeProc(Sender: TObject);
    procedure ClosePopupProc(Sender: TObject);
  protected
    { Messages From Model}
    procedure MMValueRangeChanged(var AMessage: TDispatchMessage); message MM_VALUERANGE_CHANGED;
    { Messages From Controller }
    /// <summary>Initializes a presentation</summary>
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
    /// <summary>Drop down list</summary>
    procedure PMDropDown(var AMessage: TDispatchMessage); message PM_DROPDOWN;
    /// <summary>Close the drop-down list.</summary>
    procedure PMCloseDropDown(var AMessage: TDispatchMessage); message PM_CLOSE_DROPDOWN;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure Change; override;
    procedure SetText(const AValue: string); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single); virtual;
    { Actions }
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure DoAbsoluteChanged; override;
    procedure DoActionClientChanged; override;
    /// <summary>Defines <c>TComboTrackBar</c> model class</summary>
    function DefineModelClass: TDataModelClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    function CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean;
    procedure DropDown;
    procedure CloseDropDown;
    property Model: TComboTrackBarModel read GetModel;
    property TrackBar: TTrackBar read FTrackBar write FTrackBar;
  end;

{ TStyledNumberBox }

  TStyledNumberBox = class(TStyledEditBox)
  public const
    Backlash = 5;
    MinimumMovement = 1;
  public type
    TMouseMoved = (None, Vertical, Horizontal);
  private
    FMouseMoved: TMouseMoved;
    FPressedPos: TPointF;
    function GetModel: TNumberBoxModel;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure SetText(const AText: string); override;
    property MouseMoved: TMouseMoved read FMouseMoved;
  public
    property Model: TNumberBoxModel read GetModel;
  end;

{ TStyledSearchBox }

  TStyledSearchBox = class(TStyledEdit)
  private
    FMagGlass: TEditButton;
    FClearButton: TEditButton;
    procedure RealignButtons;
  protected
    procedure RealignButtonsContainer; override;
    procedure DoChangeTracking; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  end;

{ TStyledSpinBox }

  TStyledSpinBox = class(TStyledEditBox)
  private
    FCanFocusOnPlusMinus: Boolean;
    FMinus: TCustomButton;
    FPlus: TCustomButton;
    procedure MinusClick(Sender: TObject);
    procedure PlusClick(Sender: TObject);
    function GetModel: TSpinBoxModel;
    procedure ButtonClick(APlus: Boolean);
   protected
    { Messages From Model}
    /// <summary>Notification about changing <c>TSpinBox.RepeatClick</c></summary>
    procedure MMRepeatClickChanged(var AMessage: TDispatchMessage); message MM_SPINBOX_REPEATCLICK_CHANGED;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    /// <summary>Returns model of <c>TSpinBox</c></summary>
    property Model: TSpinBoxModel read GetModel;
  end;

implementation

uses
  System.SysUtils, System.Math, System.RTLConsts, System.Character, System.TypInfo, System.Math.Vectors, FMX.StdActns,
  FMX.Presentation.Factory, FMX.BehaviorManager, FMX.Consts, FMX.Forms, FMX.ActnList, FMX.Platform.Metrics;

{ TComboEditListBox }

constructor TComboEditListBox.Create(AOwner: TComponent);
begin
  inherited;
  if AOwner is TStyledComboEdit then
    FStyledComboEdit := TStyledComboEdit(AOwner);
  OnStringsChanged := HandleStringsChanged;
  FInKeyDown := False;
  SetAcceptsControls(False);
end;

procedure TComboEditListBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  if not FInKeyDown then
  begin
    FInKeyDown := True;
    try
      if FStyledComboEdit <> nil then
        FStyledComboEdit.KeyDown(Key, KeyChar, Shift)
      else
        inherited;
    finally
      FInKeyDown := False;
    end;
  end;
end;

procedure TComboEditListBox.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Item: TListBoxItem;
  LItemIndex: Integer;
begin
  inherited;
  Item := ItemByPoint(X, Y);
  if Item <> nil then
  begin
    if Selected = Item then
      Exit;
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit
      else
        if not TLinkObservers.EditLinkEdit(Observers) then
          Exit;
    TLinkObservers.PositionLinkPosChanging(Observers);
    LItemIndex := ItemIndex;
    if MultiSelectStyle <> TMultiSelectStyle.None then
    begin
      if MultiSelectStyle = TMultiSelectStyle.Default then
      begin
  {$IFDEF MACOS}
        if ssCommand in Shift then
  {$ELSE}
        if ssCtrl in Shift then
  {$ENDIF}
          Item.IsSelected := not Item.IsSelected
        else
          SelectRange(FirstSelectedItem, Item);
        ItemIndex := Item.Index;
      end;
    end
    else
      ItemIndex := Item.Index;
    if LItemIndex <> ItemIndex then
      TLinkObservers.ListSelectionChanged(Observers);
  end;
end;

procedure TComboEditListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  LItem : TListBoxItem;
  LItemIndex: Integer;
begin
  inherited;
  if (Parent is TPopup) and TPopup(Parent).IsOpen and (Model <> nil) then
  begin
    LItemIndex := ItemIndex;
    if LocalRect.Contains(PointF(X, Y)) then
    begin
      LItem := ItemByPoint(X, Y) ;
      if LItem <> nil then
      begin
        if LItem.Index <> Model.ItemIndex then
          TLinkObservers.PositionLinkPosChanging(Observers);
        if Observers.IsObserving(TObserverMapping.EditLinkID) then
        begin
          if TLinkObservers.EditLinkIsEditing(Observers) then
            Model.ItemIndex := LItem.Index;
        end
        else
          Model.ItemIndex := LItem.Index;
      end;
      if FStyledComboEdit <> nil then
        FStyledComboEdit.SaveState;
      Model.Change;
    end;
    TPopup(Parent).IsOpen := False;
    if LItemIndex <> ItemIndex then
      TLinkObservers.ListSelectionChanged(Observers);
  end;
end;

function TComboEditListBox.GetDefaultStyleLookupName: string;
begin
  Result := 'listboxstyle'; // do not localize
end;

function TComboEditListBox.GetObservers: TObservers;
begin
  if Model <> nil then
    Result := Model.Owner.Observers
  else
    Result := inherited;
end;

procedure TComboEditListBox.HandleStringsChanged(const S: string; const Op: TCustomListBox.TStringsChangeOp);
begin
  if (Model <> nil) and (Op = TCustomListBox.TStringsChangeOp.Added) then
    Model.Items.Add(S);
end;

{ TStyledComboEditBase }

procedure TStyledComboEditBase.ApplyStyle;
var
  DeviceSrv: IFMXDeviceService;
begin
  inherited;
  if FindStyleResource<TControl>('arrow', FArrowButton) then
  begin
    FArrowButton.HitTest := True;
    FArrowButton.Cursor := crArrow;
    FArrowButton.OnMouseDown := Self.DoComboMouseDown;
    if SupportsPlatformService(IFMXDeviceService, IInterface(DeviceSrv)) and (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
      FArrowButton.TouchTargetExpansion.Rect := TRectF.Create(0, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, 0)
  end;
end;

function TStyledComboEditBase.CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean;
begin
  Result := AButton = TMouseButton.mbLeft;
end;

procedure TStyledComboEditBase.Change;
begin
  RepaintEdit;
  inherited;
end;

constructor TStyledComboEditBase.Create(AOwner: TComponent);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  inherited;
  if SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
    FNeedSetFocusAfterButtonClick := PropertiesService.GetValue('NeedSetFocusAfterButtonClick', True) // do not localize
                                                      .AsBoolean
  else
    FNeedSetFocusAfterButtonClick := True;
end;

procedure TStyledComboEditBase.DoComboMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  OldPressed: Boolean;
begin
  if CanDropDown(Button, Shift) then
  begin
    if FNeedSetFocusAfterButtonClick then
      SetFocus;
    OldPressed := Pressed;
    try
      Pressed := True;
      DropDown;
    finally
      Pressed := OldPressed;
    end;
  end;
end;

procedure TStyledComboEditBase.FreeStyle;
begin
  if FArrowButton <> nil then
    FArrowButton.OnMouseDown := nil;
  FArrowButton := nil;
  inherited;
end;

procedure TStyledComboEditBase.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  // if control does not support text input, then we must show drop down list,
  // when user clicked on control.
  if not Model.InputSupport then
    DoComboMouseDown(Self, Button, Shift, X, Y);
end;

procedure TStyledComboEditBase.PMCloseDropDown(var AMessage: TDispatchMessage);
begin
  CloseDropDown;
end;

procedure TStyledComboEditBase.PMDropDown(var AMessage: TDispatchMessage);
begin
  DropDown;
end;

{ TStyledComboEdit }

procedure TStyledComboEdit.Clear;
begin
  FListBox.Clear;
end;

procedure TStyledComboEdit.CloseDropDown;
begin
  if Model.DroppedDown then
  begin
    Model.DroppedDown := False;
    case Model.DropDownKind of
      TDropDownKind.Custom:
        FPopup.IsOpen := False;
      TDropDownKind.Native:
        if FListPicker.IsShown then
          FListPicker.Hide;
    end;
  end;
end;

constructor TStyledComboEdit.Create(AOwner: TComponent);
var
  PickerService: IFMXPickerService;
begin
  inherited;
  if TPlatformServices.Current.SupportsPlatformService(IFMXPickerService, PickerService) then
  begin
    FListPicker := PickerService.CreateListPicker;
    FListPicker.Parent := Self;
    FListPicker.OnValueChanged := DoOnValueChangedFromDropDownList;
    FListPicker.OnHide := DoClosePopup;
    FListPicker.OnShow := DoPopup;
  end;
  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle';
  FPopup.PlacementTarget := Self;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.OnClosePopup := DoClosePopup;
  FPopup.OnPopup := DoPopup;
  FPopup.DragWithParent := True;
  FListBox := CreateListBox;
  if FListBox = nil then
    raise EArgumentNilException.CreateFmt(SResultCanNotBeNil, ['CreateListBox']);
  FListBox.Parent := FPopup;
  FListBox.Stored := False;
  FListBox.Align := TAlignLayout.Client;
  FListBox.ShowCheckboxes := False;
  FListBox.ItemIndex := -1;
  FListBox.Model := Model;
  FSavedState.Saved := False;
end;

function TStyledComboEdit.CreateListBox: TComboEditListBox;
begin
  Result := TComboEditListBox.Create(Self);
end;

function TStyledComboEdit.DefineModelClass: TDataModelClass;
begin
  Result := TComboEditModel;
end;

destructor TStyledComboEdit.Destroy;
begin
  FreeAndNil(FListPicker);
  FreeAndNil(FPopup);
  inherited;
end;

procedure TStyledComboEdit.DoClosePopup(Sender: TObject);
begin
  if not (csDestroying in ComponentState) then
  begin
    Model.DisableNotify;
    try
      Model.DroppedDown := False;
      Model.SelStart := Model.Text.Length;
      Model.SelLength := 0;
    finally
      Model.EnableNotify;
    end;
    Model.Caret.Show;
    if Assigned(Model.OnClosePopup) then
      Model.OnClosePopup(PresentedControl);
  end;
end;

procedure TStyledComboEdit.DoExit;
begin
  inherited;
  CloseDropDown;
end;

procedure TStyledComboEdit.DoOnValueChangedFromDropDownList(Sender: TObject; const AValueIndex: Integer);
var
  LSaveIndex: Integer;
begin
  if not Model.ReadOnly then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) and not TLinkObservers.EditLinkEdit(Observers) then
      // Editing not permitted, ignore change
      Exit;
    LSaveIndex := Model.ItemIndex;
    Model.ItemIndex := AValueIndex;
    if Model.ItemIndex <> LSaveIndex then
    begin
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        TLinkObservers.EditLinkModified(Observers);
        TLinkObservers.EditLinkTrackUpdate(Observers);
      end;
      if Observers.IsObserving(TObserverMapping.ControlValueID) then
      begin
        TLinkObservers.ControlValueModified(Observers);
        TLinkObservers.ControlValueTrackUpdate(Observers);
      end;
    end;
    SaveState;
    Model.Change;
  end;
end;

procedure TStyledComboEdit.DoPopup(Sender: TObject);
begin
  if Assigned(Model.OnPopup) then
    Model.OnPopup(PresentedControl);
end;

procedure TStyledComboEdit.DoRealign;
begin
  inherited;
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  try
    FPopup.Width := Width;
  finally
    FDisableAlign := False;
  end;
end;

procedure TStyledComboEdit.DropDown;
begin
  if Model.DroppedDown then
    CloseDropDown
  else
  begin
    SaveState;
    Model.DroppedDown := True;

    if Model.Count > 0 then
      case Model.DropDownKind of
        TDropDownKind.Custom:
          begin
            RecalculatePopupSize;
            FPopup.IsOpen := True;
            if FPopup.IsOpen then
              FListBox.SetFocus;
          end;
        TDropDownKind.Native:
          begin
            Model.SelLength := 0;
            Model.Caret.Hide;
            InitPicker(FListPicker);
            FListPicker.Show;
          end;
      end;
  end;
end;

function TStyledComboEdit.GetComboEdit: TCustomComboEdit;
begin
  Result := PresentedControl as TCustomComboEdit;
end;

function TStyledComboEdit.GetModel: TComboEditModel;
begin
  Result := inherited GetModel<TComboEditModel>;
end;

procedure TStyledComboEdit.InitPicker(AListPicker: TCustomListPicker);
begin
  if Pressed or DoubleClick then
    FListPicker.PreferedDisplayIndex := Screen.DisplayFromPoint(Screen.MousePos).Index
  else
    FListPicker.PreferedDisplayIndex := -1;
  FListPicker.Values := Model.Items;
  FListPicker.ItemIndex := Model.ItemIndex;
  FListPicker.ItemWidth := Model.ItemWidth;
  FListPicker.CountVisibleItems := Model.DropDownCount;
end;

procedure TStyledComboEdit.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  LItemIndex: Integer;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) and ((KeyChar > ' ') or (Key in [vkUp, vkDown])) then
    if TLinkObservers.EditLinkIsReadOnly(Observers) then
      Exit
    else
      TLinkObservers.EditLinkEdit(Observers);

  inherited;

  if not Model.DroppedDown then
    LItemIndex := Model.ItemIndex
  else if Model.DropDownKind = TDropDownKind.Native then
    LItemIndex := FListPicker.ItemIndex
  else
    LItemIndex := FListBox.ItemIndex;

  if (Model.Count > 0) and not Model.ReadOnly and Enabled then
  begin
    case Key of
      vkUp:
        LItemIndex := EnsureRange(LItemIndex - 1, 0, Model.Count - 1);
      vkDown:
        if (Shift = [ssAlt]) and not Model.DroppedDown then
          DropDown
        else
          LItemIndex := EnsureRange(LItemIndex + 1, 0, Model.Count - 1);
      vkReturn:
      begin
        Model.ItemIndex := LItemIndex;
        Model.Change;
        SaveState;
        CloseDropDown;
      end;
      vkEscape:
      begin
        RestoreState;
        CloseDropDown;
        RefreshSelectedItem;
        Exit;
      end
    else
      Exit;
    end;
    TLinkObservers.ListSelectionChanged(Observers);

    if not Model.DroppedDown then
    begin
      Model.ItemIndex := LItemIndex;
      Model.Change;
      SaveState;
      RefreshSelectedItem;
    end
    else if Model.DropDownKind = TDropDownKind.Native then
      FListPicker.ItemIndex := LItemIndex
    else
      FListBox.ItemIndex := LItemIndex;
    Key := 0;
    KeyChar := #0;
  end
  // Mark Return key as processed to avoid handling of Default button
  else if (Key = vkReturn) and ((Shift = [ssAlt]) or (Shift = [])) then
  begin
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TStyledComboEdit.PMInit(var AMessage: TDispatchMessage);
begin
  inherited;
  FListBox.ItemHeight := Model.ItemHeight;
end;

procedure TStyledComboEdit.DoAbsoluteChanged;
begin
  inherited;
  if FPopup.IsOpen and (not AbsoluteEnabled or not ParentedVisible or AbsoluteClipRect.IsEmpty) then
    CloseDropDown;
end;

procedure TStyledComboEdit.MMItemHeightChanged(var AMessage: TDispatchMessage);
begin
  FListBox.ItemHeight := Model.ItemHeight;
  if FListPicker <> nil then
    FListPicker.ItemHeight := Model.ItemHeight;
end;

procedure TStyledComboEdit.MMItemIndexChanged(var AMessage: TDispatchMessage);
begin
  RefreshSelectedItem;
end;

procedure TStyledComboEdit.MMItemsChanged(var AMessage: TDispatchMessage);
begin
  RebuildList;
  // if component is being loaded or destroyed, we don't assign items for picker. Because it can affect on life cycle of
  // android activity (only for Android) and to bring to deadlock of java thread (Event in CallInUIThreadAndWaitFinishing
  // and mutex in AndroidApi.AppGlue)
  if (FListPicker <> nil) and ([csLoading, csDestroying] * ComponentState = []) then
    FListPicker.Values := Model.Items;
  if InRange(Model.ItemIndex, 0, Model.Count - 1) then
    Text := Model.Items[Model.ItemIndex];
end;

procedure TStyledComboEdit.MMItemWidthChanged(var AMessage: TDispatchMessage);
begin
  if (TDropDownKind.Native = Model.DropDownKind) and (FListPicker <> nil) then
    FListPicker.ItemWidth := Model.ItemWidth
  else
    FPopup.Width := Model.ItemWidth;
end;

procedure TStyledComboEdit.MMListBoxResourceChanged(var AMessage: TDispatchMessageWithValue<string>);
begin
  FListBox.StyleLookup := AMessage.Value;
  if FListPicker <> nil then
    FListPicker.ListStyleLookup := AMessage.Value;
end;

procedure TStyledComboEdit.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  inherited;
  if Model.Count > 0 then
    if WheelDelta < 0 then
      Model.ItemIndex := EnsureRange(Model.ItemIndex + 1, 0, Model.Count - 1)
    else
      Model.ItemIndex := EnsureRange(Model.ItemIndex - 1, 0, Model.Count - 1);
  Handled := True;
end;

procedure TStyledComboEdit.RebuildList;
var
  SavedItemIndex, I: Integer;
  Item: TListBoxItem;
begin
  if csDestroying in ComponentState then
    Exit;

  FListBox.BeginUpdate;
  try
    SavedItemIndex := FListBox.ItemIndex;
    FListBox.Clear;
    for I := 0 to Model.Items.Count - 1 do
    begin
      Item := TListBoxItem.Create(nil);
      Item.Parent := FListBox;
      Item.AutoTranslate := AutoTranslate;
      Item.Height := Model.ItemHeight;
      Item.Stored := False;
      Item.Locked := True;
      Item.Text := Model.Items[I];
    end;
    FListBox.ItemIndex := EnsureRange(SavedItemIndex, -1, FListBox.Count - 1);
  finally
    FListBox.EndUpdate;
  end;
end;

procedure TStyledComboEdit.RecalculatePopupSize;

  procedure UpdateItemBounds(Index: Integer);
  var
    Item: TListBoxItem;
    NewHeight: Single;
    Content: TControl;
  begin
    Item := FListBox.ItemByIndex(Index);
    if (Item <> nil) and FindStyleResource<TControl>('Content', Content) then // do not localize
    begin
      if Item.Height <> 0 then
        NewHeight := Item.Height
      else if Model.ItemHeight = 0 then
        NewHeight := Content.Height
      else
        NewHeight := Model.ItemHeight;
      Item.SetBounds(Item.Position.X, Item.Position.Y, Item.Width, NewHeight);
      Item.ApplyStyleLookup;
    end;
  end;

  function CalculatePopupContentHeight: Single;
  var
    TotalHeight: Single;
    Num: Integer;
    I: Integer;
    Item: TListBoxItem;
  begin
    TotalHeight := 0;
    Num := 0;
    for I := 0 to FListbox.Count - 1 do
    begin
      Item := FListbox.ListItems[I];
      if Item.Position.Y >= 0 then
      begin
        TotalHeight := TotalHeight + Item.Height;
        Inc(Num);
      end;
      if Num >= Model.DropDownCount then
        Break;
    end;
    Result := TotalHeight;
  end;

var
  PopupContentHeight: Single;
  I: Integer;
begin
  // Resize list items to match the dimensions of the control
  for I := 0 to FListbox.Count - 1 do
    UpdateItemBounds(I);

  FPopup.ApplyStyleLookup;
  if Pressed or DoubleClick then
    FPopup.PreferedDisplayIndex := Screen.DisplayFromPoint(Screen.MousePos).Index
  else
    FPopup.PreferedDisplayIndex := -1;
  if SameValue(Model.ItemWidth, 0, TEpsilon.Position) then
    FPopup.Width := Width
  else
    FPopup.Width := Model.ItemWidth;

  if FListBox.ItemHeight > 0 then
    PopupContentHeight := Min(Model.Count, Model.DropDownCount) * FListBox.ItemHeight
  else
    PopupContentHeight := CalculatePopupContentHeight;
  FPopup.Height := FPopup.Padding.Top + PopupContentHeight + FListBox.BorderHeight + FPopup.Padding.Bottom;
end;

procedure TStyledComboEdit.RefreshSelectedItem;
var
  LValue: Integer;
begin
  LValue := Model.ItemIndex;
  if (Model.DropDownKind = TDropDownKind.Native) and (FListPicker <> nil) then
    FListPicker.ItemIndex := LValue;
  FListBox.ItemIndex := LValue;
  if Model.ItemIndex >= 0 then
  begin
    SetTextInternal(Model.Items[Model.ItemIndex]);
    Model.CaretPosition := Model.Text.Length;
    Model.Caret.Visible := Model.InputSupport;
    if not Model.ReadOnly then
      Edit.SelectAll;
    if ResourceControl <> nil then
      ResourceControl.UpdateEffects;
    Repaint;
  end;
end;

procedure TStyledComboEdit.RestoreState;
begin
  if FSavedState.Saved then
  begin
    Model.ItemIndex := EnsureRange(FSavedState.ItemIndex, -1, Model.Count - 1);
    if Model.ItemIndex = -1 then
      Model.Text := FSavedState.Text;
  end;
end;

procedure TStyledComboEdit.SaveState;
begin
  FSavedState.Saved := True;
  FSavedState.ItemIndex := Model.ItemIndex;
  FSavedState.Text := Model.Text;
end;

{ TStyledEditBox }

function TStyledEditBox.DefineModelClass: TDataModelClass;
begin
  Result := TEditBoxModel;
end;

function TStyledEditBox.GetEditBox: TCustomEditBox;
begin
  Result := PresentedControl as TCustomEditBox;
end;

function TStyledEditBox.GetModel: TEditBoxModel;
begin
  Result := inherited GetModel<TEditBoxModel>;
end;

procedure TStyledEditBox.KeyDown(var Key: Word; var KeyChar: Char; Shift: TShiftState);

  function PerformDublicate(const AChars: array of Char): Boolean;
  var
    S: string;
    I: Integer;
  begin
    Result := False;
    if KeyChar.IsInArray(AChars) and (Model.SelLength = 0) then
    begin
      I := Model.SelStart;
      Result := (I > 0) and Text.Chars[I - 1].IsInArray(AChars);
      if not Result and (I < Length(Text)) and Text.Chars[I].IsInArray(AChars) then
      begin
        S := Model.Text;
        S := S.Remove(I, 1);
        S := S.Insert(I, KeyChar);
        Model.Text := S;
        Model.CaretPosition := I + 1;
        Model.SelStart := Model.CaretPosition;
        Result := True;
      end;
    end;
  end;

var
  Handled: Boolean;
begin
  Handled := True;
  case Key of
    vkUp:
      EditBox.ValueInc;
    vkDown:
      EditBox.ValueDec;
    vkEscape:
    begin
      Model.Text := Model.ConvertValueToText;
      Model.CaretPosition := 0;
      Model.SelStart := 0;
      Model.SelLength := Length(Text);
    end;
    vkReturn:
      inherited;
  else
    Handled := PerformDublicate([',', '.', FormatSettings.DecimalSeparator]) or PerformDublicate(['+', '-']);
  end;
  if Handled then
  begin
    KeyChar := #0;
    Key := 0;
  end
  else inherited;
end;

procedure TStyledEditBox.MMDecimalDigitsChanged(var AMessage: TDispatchMessage);
begin
  SetTextInternal(Model.ConvertValueToText);
end;

procedure TStyledEditBox.MMValueRangeChanged(var AMessage: TDispatchMessage);
begin

end;

procedure TStyledEditBox.MMValueTypeChanged(var AMessage: TDispatchMessage);
begin
  SetTextInternal(Model.ConvertValueToText);
end;

procedure TStyledEditBox.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  inherited;
  if WheelDelta > 0 then
    EditBox.ValueInc
  else
    if WheelDelta < 0 then
      EditBox.ValueDec;
  Handled := True;
end;

{ TStyledComboTrackBar }

procedure TStyledComboTrackBar.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  inherited;
  if (Sender is TCustomValueRangeAction) and (FTrackBar <> nil) then
    FTrackBar.Action := TCustomValueRangeAction(Action)
  else
    FTrackBar.Action := nil;
end;

procedure TStyledComboTrackBar.AfterChangeProc(Sender: TObject);
begin
  if FValueChanged then
  begin
    Model.DisableNotify;
    try
      Model.ValueRange.Assign(TrackBar.ValueRange);
      if FTextUpdating then
        Change
      else
      begin
        FTextUpdating := True;
        try
          Text := Model.ConvertValueToText;
          Change;
        finally
          FTextUpdating := False;
        end;
        Model.SelStart := 0;
        Model.SelLength := 0;
      end;
    finally
      Model.EnableNotify;
    end;
    FValueChanged := False;
  end;
end;

procedure TStyledComboTrackBar.BeforeChangeProc(Sender: TObject);
var
  Sigma: Single;
begin
  if Sender is TCustomValueRange then
  begin
    Sigma := Power(10, -Model.DecimalDigits) / 2;
    if not SameValue(TCustomValueRange(Sender).New.Value, TCustomValueRange(Sender).Value, Sigma) then
      FValueChanged := True;
  end;
end;

function TStyledComboTrackBar.CanDropDown(const AButton: TMouseButton; const AShift: TShiftState): Boolean;
begin
  Result := (AButton = TMouseButton.mbLeft) and not Model.ReadOnly;
end;

procedure TStyledComboTrackBar.Change;
var
  TempValue: Single;
begin
  if not FTextUpdating then
  begin
    FTextUpdating := True;
    try
      if TryTextToValue(Text, TempValue, Model.Value) then
        Model.ValueRange.Value := TempValue
      else
        Text := Model.ConvertValueToText;
    finally
      FTextUpdating := False;
    end;
  end;
  RepaintEdit;
  inherited;
end;

constructor TStyledComboTrackBar.Create(AOwner: TComponent);
const
  PopupPadding: TRectF = (Left: 5; Top: 2; Right: 5; Bottom: 2);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  inherited;
  { Define default behavior for platforms }
  if SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
    FNeedSetFocusAfterButtonClick := PropertiesService.GetValue('NeedSetFocusAfterButtonClick', True) // do not localize
                                                      .AsBoolean
  else
    FNeedSetFocusAfterButtonClick := True;

  FPopup := TPopup.Create(Self);
  FPopup.StyleLookup := 'combopopupstyle'; // do not localize
  FPopup.PlacementTarget := Self;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.Padding.Rect := PopupPadding;
  FPopup.OnClosePopup := ClosePopupProc;
  FPopup.DragWithParent := True;
  FTrackBar := TTrackBar.Create(Self);
  FTrackBar.Parent := FPopup;
  FTrackBar.Stored := False;
  FTrackBar.DisableFocusEffect := True;
  FTrackBar.Align := TAlignLayout.VertCenter;
  FTrackBar.ValueRange.BeforeChange := BeforeChangeProc;
  FTrackBar.ValueRange.AfterChange := AfterChangeProc;
end;

function TStyledComboTrackBar.DefineModelClass: TDataModelClass;
begin
  Result := TComboTrackBarModel;
end;

procedure TStyledComboTrackBar.DoAbsoluteChanged;
begin
  inherited;
  if FPopup.IsOpen and (not AbsoluteEnabled or not ParentedVisible or AbsoluteClipRect.IsEmpty) then
    CloseDropDown;
end;

procedure TStyledComboTrackBar.DoActionClientChanged;
begin
  inherited;
  if not Edit.ActionClient and (FTrackBar <> nil) then
    FTrackBar.Action := nil;
end;

procedure TStyledComboTrackBar.ClosePopupProc(Sender: TObject);
begin
  Model.Caret.Visible := Model.InputSupport;
  Edit.SelectAll;
end;

procedure TStyledComboTrackBar.ApplyStyle;
var
  DeviceSrv: IFMXDeviceService;
begin
  inherited;
  if FindStyleResource<TControl>('arrow', FArrowButton) then
  begin
    FArrowButton.HitTest := True;
    FArrowButton.Cursor := crArrow;
    FArrowButton.OnMouseDown := DoComboMouseDown;
    if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
      FArrowButton.TouchTargetExpansion.Rect := TRectF.Create(0, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, 0)
  end;
end;

procedure TStyledComboTrackBar.FreeStyle;
begin
  if FArrowButton <> nil then
    FArrowButton.OnMouseDown := nil;
  FArrowButton := nil;
  inherited;
end;

procedure TStyledComboTrackBar.DoEnter;
begin
  if FPopup.IsOpen then
    CloseDropDown;
  inherited;
end;

procedure TStyledComboTrackBar.DoExit;
begin
  Change; // Text already has the current value

  inherited;

  Model.DisableNotify;
  try
    Model.SelStart := 0;
    Model.SelLength := 0;
  finally
    Model.EnableNotify;
  end;

  CloseDropDown;
end;

procedure TStyledComboTrackBar.DropDown;
const
  MinDropDownWidth = 100;
  PopupHeight = 30;
begin
  if not FPopup.IsOpen then
  begin
    Model.Caret.Visible := False;
    if Pressed or DoubleClick then
      FPopup.PreferedDisplayIndex := Screen.DisplayFromPoint(Screen.MousePos).Index
    else
      FPopup.PreferedDisplayIndex := -1;
    FPopup.Placement := Model.Placement;
    if Width < MinDropDownWidth then
      FPopup.Width := MinDropDownWidth
    else
     FPopup.Width := Width;
    FPopup.Height := PopupHeight;
    FTrackBar.ApplyStyleLookup;
    FTrackBar.Enabled := not Model.ReadOnly;
    FPopup.IsOpen := True;
    Model.DroppedDown := True;
  end
  else
    CloseDropDown;
end;

procedure TStyledComboTrackBar.CloseDropDown;
begin
  if FPopup.IsOpen then
  begin
    FPopup.IsOpen := False;
    Model.DroppedDown := False;
  end;
end;

function TStyledComboTrackBar.GetModel: TComboTrackBarModel;
begin
  Result := TComboTrackBarModel(inherited GetModel);
end;

procedure TStyledComboTrackBar.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  Delta: Single;
begin
  if Key = vkReturn then
  begin
    Change;
    Text := Model.ConvertValueToText;
    Edit.SelectAll;
    Key := 0;
    Exit;
  end;
  inherited;
  Delta := Model.ValueRange.Frequency;
  if Delta <= 0 then
    Delta := 1;
  FTrackBar.ValueRange.Increment := Delta;
  case Key of
    vkUp: FTrackBar.ValueRange.Inc;
    vkDown: FTrackBar.ValueRange.Dec;
  else
    Exit;
  end;
  Key := 0;
end;

procedure TStyledComboTrackBar.PMInit(var AMessage: TDispatchMessage);
begin
  FTrackBar.ValueRange.Assign(Model.ValueRange);
  SetTextInternal(Model.ConvertValueToText);
end;

procedure TStyledComboTrackBar.PMDropDown(var AMessage: TDispatchMessage);
begin
  DropDown;
end;

procedure TStyledComboTrackBar.PMCloseDropDown(var AMessage: TDispatchMessage);
begin
  CloseDropDown;
end;

procedure TStyledComboTrackBar.MMValueRangeChanged(var AMessage: TDispatchMessage);
begin
  FTrackBar.ValueRange.Assign(Model.ValueRange);
  Model.Change; // This model has as delegate the edit control, so if the track triggers, a model notification is needed
end;

procedure TStyledComboTrackBar.SetText(const AValue: string);
var
  TempValue: Single;
begin
  if AValue <> Text then
  begin
    if not FTextUpdating then
    begin
      FTextUpdating := True;
      try
        if TryTextToValue(AValue, TempValue, Model.Value) then
          Model.ValueRange.Value := TempValue;
        if csDesigning in ComponentState then
          inherited SetText(Model.ConvertValueToText)
        else
          inherited;
        Repaint;
      finally
        FTextUpdating := False;
      end;
    end
    else
      inherited;
  end;
end;

procedure TStyledComboTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  // if control does not support text input, then we must show drop down list,
  // when user clicked on control.
  if not Model.InputSupport then
    DoComboMouseDown(Self, Button, Shift, X, Y);
end;

procedure TStyledComboTrackBar.DoComboMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; x, Y: Single);
var
  OldPressed: Boolean;
begin
  if CanDropDown(Button, Shift) then
  begin
    if FNeedSetFocusAfterButtonClick then
      SetFocus;
    OldPressed := Pressed;
    try
      Pressed := True;
      DropDown;
    finally
      Pressed := OldPressed;
    end;
  end;
end;

{ TStyledNumberBox }

function TStyledNumberBox.GetModel: TNumberBoxModel;
begin
  Result := TNumberBoxModel(inherited GetModel);
end;

procedure TStyledNumberBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FMouseMoved := TMouseMoved.None;
    FPressedPos := TPointF.Create(X, Y);
  end;
end;

procedure TStyledNumberBox.MouseMove(Shift: TShiftState; X, Y: Single);
var
  LMinimumMovement: Integer;
  Delta: TPointF;
  Moved: Boolean;
begin
  inherited;
  if Pressed then
  begin
    Moved := False;
    Delta := TPointF.Create(X, Y);
    Delta := Delta - FPressedPos;
    if FMouseMoved = TMouseMoved.None then
    begin
      LMinimumMovement := Backlash;
      if (Abs(Delta.X) > LMinimumMovement) or (Abs(Delta.Y) > LMinimumMovement) then
      begin
        if Abs(Delta.X) > Abs(Delta.Y) then
        begin
          Model.ValueRange.Increment := Model.HorzIncrement;
          FMouseMoved := TMouseMoved.Horizontal;
        end
        else
        begin
          Model.ValueRange.Increment := Model.VertIncrement;
          FMouseMoved := TMouseMoved.Vertical;
        end;
      end;
    end
    else
      LMinimumMovement := MinimumMovement;
    if (FMouseMoved = TMouseMoved.Horizontal) and (Model.HorzIncrement > 0) then
    begin
      if X > FPressedPos.X + LMinimumMovement then
      begin
        EditBox.ValueInc;
        Moved := True;
      end
      else
      if X < FPressedPos.X - LMinimumMovement then
      begin
        EditBox.ValueDec;
        Moved := True;
      end;
    end;
    if (FMouseMoved = TMouseMoved.Vertical) and (Model.VertIncrement > 0) then
    begin
      if Y < FPressedPos.Y - LMinimumMovement then
      begin
        Model.ValueRange.Inc;
        Moved := True;
      end
      else
      if Y > FPressedPos.Y + LMinimumMovement then
      begin
        Model.ValueRange.Dec;
        Moved := True;
      end;
    end;
    if Moved then
    begin
      FPressedPos := TPointF.Create(X, Y);
      Repaint;
    end;
  end;
end;

procedure TStyledNumberBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FMouseMoved := TMouseMoved.None;
  if Pressed then
  begin
    Change;
    Repaint;
  end;
end;

procedure TStyledNumberBox.SetText(const AText: string);
var
  OldText: string;
begin
  OldText := Text;
  inherited;
  if not (csLoading in ComponentState) and not Pressed and (OldText <> Text) then
    Change;
end;

{ TStyledSearchBox }

procedure TStyledSearchBox.RealignButtons;
begin
  if (LeftLayout <> nil) and (FMagGlass <> nil) then
    LeftLayout.Width := FMagGlass.Width;
  if (ButtonsLayout <> nil) and (FClearButton <> nil) then
    if Model.Text.IsEmpty then
      ButtonsLayout.Width := 0
    else
      ButtonsLayout.Width := FClearButton.Width;
end;

procedure TStyledSearchBox.RealignButtonsContainer;
begin
  inherited;
  RealignButtons;
end;

procedure TStyledSearchBox.DoChangeTracking;
begin
  inherited;
  RealignButtons;
end;

procedure TStyledSearchBox.ApplyStyle;
begin
  inherited;
  if FindStyleResource<TEditButton>('magglass', FMagGlass) then
    FMagGlass.ApplyStyleLookup;
  if FindStyleResource<TEditButton>('clearbutton', FClearButton) then
  begin
    FClearButton.ApplyStyleLookup;
    FClearButton.Cursor := crArrow;
  end;

  RealignButtonsContainer;
end;

procedure TStyledSearchBox.FreeStyle;
begin
  inherited;
  FMagGlass := nil;
  FClearButton := nil;
end;

{ TStyledSpinBox }

procedure TStyledSpinBox.ApplyStyle;
begin
  inherited;
  { Button - }
  if FindStyleResource<TCustomButton>('minusbutton', FMinus) then
  begin
    FMinus.RepeatClick := Model.RepeatClick;
    FMinus.OnClick := MinusClick;
  end;
  { Button + }
  if FindStyleResource<TCustomButton>('plusbutton', FPlus) then
  begin
    FPlus.RepeatClick := Model.RepeatClick;
    FPlus.OnClick := PlusClick;
  end;
end;

constructor TStyledSpinBox.Create(AOwner: TComponent);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  inherited;
  { Define default behavior for platforms }
  if SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
    FCanFocusOnPlusMinus := PropertiesService.GetValue('SpinBox.CanFocusOnPlusMinus', True) // do not localize
                                             .AsBoolean
  else
    FCanFocusOnPlusMinus := True;
end;

procedure TStyledSpinBox.ButtonClick(APlus: Boolean);
var
  LEditLink: Boolean;
  LValue: Double;
begin
  if not Model.ReadOnly then
  begin
    LEditLink := EditBox.Observers.IsObserving(TObserverMapping.EditLinkID);
    if LEditLink and not TLinkObservers.EditLinkEdit(EditBox.Observers) then
      Exit; // Can't change
    if FCanFocusOnPlusMinus then
      EditBox.SetFocus;
    LValue := EditBox.Value;
    if APlus then
      EditBox.ValueInc
    else
      EditBox.ValueDec;
    if LValue <> EditBox.Value then
    begin
      if LEditLink then
      begin
        TLinkObservers.EditLinkModified(EditBox.Observers);
        TLinkObservers.EditLinkTrackUpdate(EditBox.Observers);
      end;
      if EditBox.Observers.IsObserving(TObserverMapping.ControlValueID) then
      begin
        TLinkObservers.ControlValueModified(EditBox.Observers);
        TLinkObservers.ControlValueTrackUpdate(EditBox.Observers);
      end;
    end;
  end;
end;

procedure TStyledSpinBox.MinusClick(Sender: TObject);
begin
  ButtonClick(False);
end;

procedure TStyledSpinBox.PlusClick(Sender: TObject);
begin
  ButtonClick(True);
end;

procedure TStyledSpinBox.FreeStyle;
begin
  inherited;
  FMinus := nil;
  FPlus := nil;
end;

function TStyledSpinBox.GetModel: TSpinBoxModel;
begin
  Result := TSpinBoxModel(inherited GetModel);
end;

procedure TStyledSpinBox.MMRepeatClickChanged(var AMessage: TDispatchMessage);
begin
  if FMinus <> nil then
    FMinus.RepeatClick := Model.RepeatClick;
  if FPlus <> nil then
    FPlus.RepeatClick := Model.RepeatClick;
end;

end.
