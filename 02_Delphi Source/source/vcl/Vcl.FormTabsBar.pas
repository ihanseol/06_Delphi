{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.FormTabsBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Types, System.SysUtils, System.Classes, System.Math,
  Vcl.Themes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, System.UITypes, Vcl.ComCtrls, Vcl.Menus;

type
  TCustomFormTabsBar = class;
  TFormTabsBarTabState = (ftdsNormal, ftdsHot, ftdsSelected);
  TFormTabsBarAcceptEvent = procedure (AForm: TForm; var AAccept: Boolean) of object;
  TFormTabsBarAcceptMode = (ftbamAuto, ftbamManual);

  TFormTabsBarTab = class(TCollectionItem)
  private
    FForm: TForm;
    procedure SetState(AValue: TFormTabsBarTabState);
  protected
    FIcon: TIcon;
    FBoundsRect: TRect;
    FState: TFormTabsBarTabState;
    FCloseButtonMouseIn,
    FCloseButtonMouseDown: Boolean;
    FTextTruncated: Boolean;
    FMarkedAsInvisible: Boolean;
    procedure Update;
    function GetIcon: TIcon;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property BoundsRect: TRect read FBoundsRect write FBoundsRect;
    property CloseButtonMouseIn: Boolean read FCloseButtonMouseIn;
    property CloseButtonMouseDown: Boolean read FCloseButtonMouseDown;
    property Icon: TIcon read GetIcon;
    property Form: TForm read FForm;
    property State: TFormTabsBarTabState read FState write SetState;
  end;

  TFormTabsBarTabs = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TFormTabsBarTab;
    procedure SetItem(Index: Integer; Value: TFormTabsBarTab);
    function GetTabsBar: TCustomFormTabsBar;
  public
    function IndexOf(AForm: TForm): Integer;
    function GetTab(AForm: TForm): TFormTabsBarTab;
    function AddForm(AForm: TForm): TFormTabsBarTab;
    procedure DeleteForm(AForm: TForm);
    property Items[Index: Integer]: TFormTabsBarTab read GetItem write SetItem; default;
    property TabsBar: TCustomFormTabsBar read GetTabsBar;
  end;

  TFormTabsBarTabOptions = class(TPersistent)
  private
    FFormTabsBar: TCustomFormTabsBar;
    FMarkInvisibleForm: Boolean;
    FShowFormSystemMenu: Boolean;
    FShowCloseButton: Boolean;
    FShowHintForTruncatedCaption: Boolean;
    FShowFormIcon: Boolean;
    FDraggable: Boolean;
    procedure SetMarkInvisibleForm(AValue: Boolean);
    procedure SetShowCloseButton(AValue: Boolean);
    procedure SetShowFormIcon(AValue: Boolean);
  public
    constructor Create(AFormTabsBar: TCustomFormTabsBar); virtual;
    procedure Assign(Source: TPersistent); override;
  published
    /// <summary>Enables dragging for tabs to change order in control.</summary>
    property Draggable: Boolean read
      FDraggable write FDraggable default True;
     /// <summary>Enables marking tabs to show that form is invisible.</summary>
    property MarkInvisibleForm: Boolean
      read FMarkInvisibleForm write SetMarkInvisibleForm default True;
    /// <summary>Enables showing system form icon</summary>
    property ShowFormIcon: Boolean
      read FShowFormIcon write SetShowFormIcon default False;
    /// <summary>Enables showing system window menu of the form with right click or froms icon</summary>
    property ShowFormSystemMenu: Boolean
      read FShowFormSystemMenu write FShowFormSystemMenu default False;
    /// <summary>Enables showing close button in tab to close form quickly.</summary>
    property ShowCloseButton: Boolean
      read FShowCloseButton write SetShowCloseButton default False;
    /// <summary>Enables showing hint if tab has truncated text, because form caption is too long.</summary>
    property ShowHintForTruncatedCaption: Boolean
      read FShowHintForTruncatedCaption write FShowHintForTruncatedCaption default False;
  end;

  TCustomFormTabsBar = class(TCustomControl, IFormVisualManager)
  private
    FOnAcceptForm: TFormTabsBarAcceptEvent;
    FTabWidth: Integer;
    FTabMinWidth: Integer;
    FTabMaxWidth: Integer;
    FTabs: TFormTabsBarTabs;
    FTabOptions: TFormTabsBarTabOptions;
    FAcceptFormMode: TFormTabsBarAcceptMode;
    FTabHotIndex: Integer;
    FHideMinimizedForm: Boolean;
    FHideInactiveFormOnParent: Boolean;
    FMouseCaptureTab: TFormTabsBarTab;
    FFirstDrawIndex, FLastDrawIndex, FLastContainsIndex: Integer;
    FUpDown: TUpDown;
    FMouseWheelScroll: Boolean;
    FMouseDragTabIndex: Integer;
    FMouseDragTabX: Integer;
    FMouseDownX: Integer;
    FDragScrolling: Boolean;
    FShowTabsMenuButton: Boolean;
    FTabsMenuButtonMouseIn, FTabsMenuButtonDown: Boolean;
    FTabsMenu: TPopupMenu;
    FTabHintWindow: THintWindow;
    FTabHintActivatingIndex, FTabHintActiveIndex: Integer;
    FFocusedTabIndex: Integer;
    procedure SetShowTabsMenuButton(AValue: Boolean);
    procedure SetTabWidth(AValue: Integer);
    procedure SetTabMinWidth(AValue: Integer);
    procedure SetTabMaxWidth(AValue: Integer);
    procedure FormActivate(AForm: TForm);
    procedure FormMinimize(AForm: TForm);
    procedure FormRestore(ATab: TFormTabsBarTab);
    procedure FormShow(ATab: TFormTabsBarTab);
    procedure FormHide(AForm: TForm);
    procedure FormCaptionChanged(AForm: TForm);
    procedure CheckMouseLeave;
    procedure StartMouseTimer;
    procedure StopMouseTimer;
    procedure StartDragScrollTimer;
    procedure StopDragScrollTimer;
    procedure DragScroll;
    procedure AdjustUpDown;
    procedure ShowUpDown;
    procedure HideUpDown;
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure ScrollToTab(AIndex: Integer);
    function GetActiveTabIndex: Integer;
    procedure OnTabsMenuItemClick(Sender: TObject);
    procedure CreateTabsMenuItems(AMenuItem: TMenuItem);
    procedure TrackTabsMenu;
    procedure ActivateTabHint;
    procedure ShowTabHint(AIndex: Integer);
    procedure HideTabHint;
  protected
    procedure ActivateFormOnParent(AParent: TWinControl; ACheckVisible: Boolean);
    procedure ShowFormSystemMenu(AForm: TForm; X, Y: Integer);
    procedure CalcTabRects;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    function TabFromPoint(P: TPoint): TFormTabsBarTab;
    function TabIndexFromPoint(P: TPoint): Integer;
    procedure ReleaseFormIcons;
    function IsTabIndexAvailable(const AIndex: Integer): Boolean;
    function AcceptForm(AForm: TForm): Boolean; virtual;
    function GetTabsRect: TRect; virtual;
    function GetTabsMenuButtonRect: TRect; virtual;
    function GetTabWidth(ATab: TFormTabsBarTab): Integer; virtual;
    function GetCloseButtonRect(ARect: TRect): TRect; virtual;
    function GetFormIconRect(ATab: TFormTabsBarTab; ARect: TRect): TRect; virtual;
    procedure DrawTab(ACanvas: TCanvas; AIndex: Integer); virtual;
    procedure DrawCloseButton(ACanvas: TCanvas; ATab: TFormTabsBarTab; ARect: TRect); virtual;
    procedure DrawTabsMenuButton(ACanvas: TCanvas; ARect: TRect; AMouseIn, ADown: Boolean); virtual;
    procedure DrawTabs(ACanvas: TCanvas); virtual;
    procedure DrawBackground(ACanvas: TCanvas); virtual;
    procedure AddForm(AForm: TForm); virtual;
    procedure DeleteForm(AForm: TForm); virtual;
    procedure FormWndProc(AForm: TForm; Message: TMessage); virtual;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure WMLButtonDown(var Message: TWMMouse); message WM_LBUTTONDOWN;
    procedure WMRButtonUp(var Message: TWMMouse); message WM_RBUTTONUP;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    procedure WMSize(var Message: TWMSIZE); message WM_SIZE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMSetFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure UpdateTab(AIndex: Integer);
    property Tabs: TFormTabsBarTabs read FTabs;
    /// <summary>Defines how form will be accepted for control: automatically or manually.</summary>
    property AcceptFormMode: TFormTabsBarAcceptMode
      read FAcceptFormMode write FAcceptFormMode default ftbamAuto;
    property Align default alTop;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    /// <summary>Enables automatically hidding of minimized forms.</summary>
    property HideMinimizedForm: Boolean
      read FHideMinimizedForm write FHideMinimizedForm default True;
    property HideInactiveFormOnParent: Boolean
    /// <summary>Enables automatically hidding of all inactuve from on parent control and keep visible only active form.</summary>
      read FHideInactiveFormOnParent write FHideInactiveFormOnParent default False;
    /// <summary>Enables using mouse wheel to scroll tabs.</summary>
    property MouseWheelScroll: Boolean
      read  FMouseWheelScroll write FMouseWheelScroll default True;
     /// <summary>Defines different options for tabs.</summary>
    property TabOptions: TFormTabsBarTabOptions
      read FTabOptions write FTabOptions;
    ///<summary>Defines fixed width for tab if value more than 0.</summary>
    property TabWidth: Integer
      read FTabWidth write SetTabWidth default 0;
    ///<summary>Defines minimum width for tab if value more than 0.</summary>
    property TabMinWidth: Integer
      read FTabMinWidth write SetTabMinWidth default 0;
    /// <summary>Defines maximum width for tab if value more than 0.</summary>
    property TabMaxWidth: Integer
      read FTabMaxWidth write SetTabMaxWidth default 0;
    /// <summary>Shows special button to call popup menu with captions to quickly activate form.</summary>
    property ShowTabsMenuButton: Boolean
      read FShowTabsMenuButton write SetShowTabsMenuButton default False;
    /// <summary>Special event to define which form can be accepted to the control.</summary>
    property OnAcceptForm: TFormTabsBarAcceptEvent
      read FOnAcceptForm write FOnAcceptForm;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  end;

  TFormTabsBar = class(TCustomFormTabsBar)
  published
    property AcceptFormMode default ftbamAuto;
    property Align default alTop;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HideMinimizedForm default True;
    property HideInactiveFormOnParent default False;
    property MouseWheelScroll;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOptions;
    property TabWidth default 0;
    property TabMinWidth default 0;
    property TabMaxWidth default 0;
    property TabStop;
    property Touch;
    property Visible;
    property ShowTabsMenuButton default False;
    property StyleElements;
    property StyleName;
    property OnAcceptForm;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

uses
  Vcl.Consts, Vcl.GraphUtil;

const
  cBackgroundColor = clBtnFace;
  cForegroundColor = clBtnText;
  cFrameColor = clBtnShadow;
  cTabFillColor = clBtnFace;
  cTabsLeftOffset = 2;
  cMinTabWidth = 80;
  cSeparatorMargins = 4;
  cTabContentMargin = 6;
  cHideHintTimerID = 96;
  cShowHintTimerID = 97;
  cCheckMouseLeaveTimerID = 98;
  cDragScrollTimerID = 99;
  cInvisibleFormTabFillAlpha = 100;
  cCloseButtonSize = 18;
  cCloseButtonIconSize = 7;
  cMinMenuItemCount = 10;
  cMenuButtonIconSize = 9;
  cSeparatorAlphaValue = 100;
  cSpaceIconText = 5;

constructor TFormTabsBarTab.Create(Collection: TCollection);
begin
  inherited;
  FState := ftdsNormal;
end;

destructor TFormTabsBarTab.Destroy;
begin
  FreeAndNil(FIcon);
  inherited;
end;

function TFormTabsBarTab.GetIcon: TIcon;
var
  LIconX, LIconY: Integer;
  LTmpHandle: THandle;
  Loaded: Boolean;
  LTabsBar: TCustomFormTabsBar;
begin
  if FIcon = nil then
  begin
    FIcon := TIcon.Create;
    Loaded := False;
    if Form.Icon.Handle <> 0 then
      LTmpHandle := Form.Icon.Handle
    else
    if Application.Icon.Handle <> 0 then
      LTmpHandle := Application.Icon.Handle
    else
    begin
      LTmpHandle := LoadIcon(0, IDI_APPLICATION);
      Loaded := True;
    end;
    
    LTabsBar := TFormTabsBarTabs(Collection).TabsBar;
    LIconX := LTabsBar.GetSystemMetrics(SM_CXSMICON);
    if LIconX = 0 then
      LIconX := LTabsBar.GetSystemMetrics(SM_CXSIZE);
    LIconY := LTabsBar.GetSystemMetrics(SM_CYSMICON);
    if LIconY = 0 then
      LIconY := LTabsBar.GetSystemMetrics(SM_CYSIZE);

    FIcon.Handle := CopyImage(LTmpHandle, IMAGE_ICON, LIconX, LIconY, LR_COPYFROMRESOURCE);

    if Loaded then
      DestroyIcon(LTmpHandle);
  end;
  Result := FIcon;
end;

procedure TFormTabsBarTab.SetState(AValue: TFormTabsBarTabState);
begin
  FState := AValue;
  Update;
end;

procedure TFormTabsBarTab.Update;
begin
  TFormTabsBarTabs(Collection).TabsBar.Invalidate;
end;

function TFormTabsBarTabs.GetTab(AForm: TForm): TFormTabsBarTab;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].Form = AForm then
      Exit(Items[I]);
  Result := nil;
end;

function TFormTabsBarTabs.IndexOf(AForm: TForm): Integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].Form = AForm then
      Exit(I);
  Result := -1;
end;

function TFormTabsBarTabs.GetTabsBar: TCustomFormTabsBar;
begin
  Result := TCustomFormTabsBar(Owner);
end;

function TFormTabsBarTabs.GetItem(Index: Integer): TFormTabsBarTab;
begin
   Result := TFormTabsBarTab(inherited GetItem(Index));
end;

procedure TFormTabsBarTabs.SetItem(Index: Integer; Value: TFormTabsBarTab);
begin
  inherited SetItem(Index, Value);
end;

function TFormTabsBarTabs.AddForm(AForm: TForm): TFormTabsBarTab;
var
  LIndex: Integer;
begin
  LIndex := IndexOf(AForm);
  if LIndex = -1 then
  begin
    Result := TFormTabsBarTab(inherited Add);
    Result.FForm := AForm;
    TabsBar.Invalidate;
  end
  else
    Result := Items[LIndex];
end;

procedure TFormTabsBarTabs.DeleteForm(AForm: TForm);
var
  LIndex: Integer;
begin
  LIndex := IndexOf(AForm);
  Delete(LIndex);
  TabsBar.Invalidate;
end;

constructor TFormTabsBarTabOptions.Create(AFormTabsBar: TCustomFormTabsBar);
begin
  FFormTabsBar := AFormTabsBar;
  FMarkInvisibleForm := True;
  FDraggable := True;
end;

procedure TFormTabsBarTabOptions.SetMarkInvisibleForm(AValue: Boolean);
begin
  if AValue <> FMarkInvisibleForm then
  begin
    FMarkInvisibleForm := AValue;
    FFormTabsBar.Invalidate;
  end;
end;

procedure TFormTabsBarTabOptions.SetShowFormIcon(AValue: Boolean);
begin
  if AValue <> FShowFormIcon then
  begin
    FShowFormIcon := AValue;
    FFormTabsBar.Invalidate;
  end;
end;

procedure TFormTabsBarTabOptions.SetShowCloseButton(AValue: Boolean);
begin
  if AValue <> FShowCloseButton then
  begin
    FShowCloseButton := AValue;
    FFormTabsBar.Invalidate;
  end;
end;

procedure TFormTabsBarTabOptions.Assign(Source: TPersistent);
begin
  if Source is TFormTabsBarTabOptions then
  begin
    FMarkInvisibleForm := TFormTabsBarTabOptions(Source).MarkInvisibleForm;
    FShowFormSystemMenu := TFormTabsBarTabOptions(Source).ShowFormSystemMenu;
    FShowCloseButton := TFormTabsBarTabOptions(Source).ShowCloseButton;
    FShowHintForTruncatedCaption := TFormTabsBarTabOptions(Source).ShowHintForTruncatedCaption;
    FDraggable := TFormTabsBarTabOptions(Source).Draggable;
  end
  else
    inherited Assign(Source);
end;

constructor TCustomFormTabsBar.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csClickEvents, csCaptureMouse,
    csOpaque, csDoubleClicks, csReplicatable, csPannable, csGestures, csOverrideStylePaint];
  Color := cBackgroundColor;
  FTabs := TFormTabsBarTabs.Create(Self, TFormTabsBarTab);
  FTabOptions := TFormTabsBarTabOptions.Create(Self);
  FTabWidth := 0;
  FTabMinWidth := 0;
  FTabMaxWidth := 0;
  FMouseDragTabIndex := -1;
  FTabHintActivatingIndex := -1;
  FTabHintActiveIndex := -1;
  FMouseDownX := -1;
  FAcceptFormMode := ftbamAuto;
  FHideMinimizedForm := True;
  FMouseWheelScroll := True;
  FTabHotIndex := -1;
  FFocusedTabIndex := -1;
  Width := 300;
  Height := 30;
  Align := alTop;
end;

destructor TCustomFormTabsBar.Destroy;
begin
  FreeAndNil(FTabs);
  FreeAndNil(FTabOptions);
  FreeAndNil(FTabsMenu);
  FreeAndNil(FTabHintWindow);
  inherited;
end;

function TCustomFormTabsBar.AcceptForm(AForm: TForm): Boolean;
begin
  Result := False;
  if FAcceptFormMode = ftbamAuto then
  begin
    if (AForm.VisualManager is TCustomFormTabsBar) and (TCustomFormTabsBar(AForm.VisualManager) = Self) then
      Result := True
    else
    if (Application.MainForm <> nil) and (Application.MainForm.VisualManager is TCustomFormTabsBar) and
       (TCustomFormTabsBar(Application.MainForm.VisualManager) = Self) then
    begin
      if Application.MainForm.FormStyle = fsMDIForm then
        Result := AForm.FormStyle = fsMDIChild
      else
        Result := AForm.FormStyle <> fsMDIChild;
    end;
  end;

  if Assigned(FOnAcceptForm) then
    FOnAcceptForm(AForm, Result);
end;

procedure TCustomFormTabsBar.SetTabMinWidth(AValue: Integer);
begin
  if AValue >= 0 then
  begin
    FTabMinWidth := AValue;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.SetTabMaxWidth(AValue: Integer);
begin
  if AValue >= 0 then
  begin
    FTabMaxWidth := AValue;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.SetShowTabsMenuButton(AValue: Boolean);
begin
  if AValue <> FShowTabsMenuButton then
  begin
    FShowTabsMenuButton := AValue;
    Invalidate;
    if not AValue then
      FreeAndNil(FTabsMenu);
  end;
end;

procedure TCustomFormTabsBar.SetTabWidth(AValue: Integer);
begin
  if AValue >= 0 then
  begin
    FTabWidth := AValue;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.AddForm(AForm: TForm);
begin
  FTabs.AddForm(AForm);
  if not (csDesigning in ComponentState) and
     not (csLoading in ComponentState) and
     not (csDestroying in ComponentState) then
  begin
    if IsWindowVisible(AForm.Handle) then
      FormActivate(AForm);
  end;
end;

procedure TCustomFormTabsBar.ActivateFormOnParent(AParent: TWinControl; ACheckVisible: Boolean);
var
  I: Integer;
  LTab: TFormTabsBarTab;
begin
  if (AParent <> nil) and not (csDestroying in AParent.ComponentState) then
    for I := AParent.ControlCount - 1 downto 0 do
      if (AParent.Controls[I] is TForm) then
      begin
        LTab := FTabs.GetTab(TForm(AParent.Controls[I]));
        if LTab <> nil then
        begin
          if ACheckVisible and not IsWindowVisible(LTab.Form.Handle) then
            Continue
          else
          begin
            FormShow(LTab);
            Break;
          end;
        end;
      end;
end;

procedure TCustomFormTabsBar.DeleteForm(AForm: TForm);
var
  LParent: TWinControl;
begin
  if (AForm.FormStyle <> fsMDIChild) then
    LParent := AForm.Parent
  else
    LParent := nil;
  FTabs.DeleteForm(AForm);
  if LParent <> nil then
    ActivateFormOnParent(LParent, not HideInactiveFormOnParent);
end;

procedure TCustomFormTabsBar.UpdateTab(AIndex: Integer);
begin
  if (AIndex >= FFirstDrawIndex) and (AIndex <= FLastDrawIndex) then
    Invalidate;
end;

procedure TCustomFormTabsBar.FormMinimize(AForm: TForm);
var
  LTab: TFormTabsBarTab;
begin
  LTab := Tabs.GetTab(AForm);
  if LTab <> nil then
  begin
    ShowWindow(LTab.Form.Handle, SW_HIDE);
    if LTab.Form.FormStyle = fsMDIChild then
      SetWindowPos(LTab.Form.Handle, 0, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
    LTab.State := ftdsNormal;
    if AForm.FormStyle <> fsMDIChild then
      ActivateFormOnParent(AForm.Parent, True);
  end;
end;

procedure TCustomFormTabsBar.FormRestore(ATab: TFormTabsBarTab);
begin
  SendMessage(ATab.Form.Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
  ATab.Form.Show;
  SendMessage(ATab.Form.Handle, WM_NCACTIVATE, 1, 0);
end;

procedure TCustomFormTabsBar.FormCaptionChanged(AForm: TForm);
begin
  UpdateTab(FTabs.IndexOf(AForm));
end;

procedure TCustomFormTabsBar.FormWndProc(AForm: TForm; Message: TMessage);
begin
  case Message.Msg of
    CM_TEXTCHANGED:
    begin
      FormCaptionChanged(AForm);
    end;

    WM_MOUSEACTIVATE, WM_SETFOCUS:
    begin
      FormActivate(AForm);
    end;

    WM_WINDOWPOSCHANGED:
    begin
      if FHideMinimizedForm and IsIconic(AForm.Handle) then
        FormMinimize(AForm)
      else
      if (AForm.FormStyle = fsMDIChild) and (TWMWINDOWPOSCHANGED(Message).WindowPos^.flags and SWP_SHOWWINDOW <> 0) then
        FormActivate(AForm);
    end;

    WM_NCACTIVATE:
    begin
      if FHideMinimizedForm and IsIconic(AForm.Handle) then
        FormMinimize(AForm)
      else
      if TWMNCActivate(Message).Active then
        FormActivate(AForm);
    end;

    WM_SIZE:
    begin
      if (TWMSize(Message).SizeType = SIZE_MINIMIZED) and FHideMinimizedForm then
        FormMinimize(AForm);
    end;

    CM_SYSCOMMAND:
    begin
      if (Message.WParam = SC_MAXIMIZE) and (AForm.FormStyle = fsMDIChild) then
        FormActivate(AForm);
    end;

    WM_SHOWWINDOW:
    begin
      if TWMShowWindow(Message).Show and (AForm.Parent <> nil) and (AForm.BorderStyle = bsNone) then
      begin
        AForm.BringToFront;
        FormActivate(AForm);
      end
      else
      if not TWMShowWindow(Message).Show then
        FormHide(AForm);
    end;
  end;
end;

procedure TCustomFormTabsBar.FormHide(AForm: TForm);
var
  I: Integer;
begin
  I := FTabs.IndexOf(AForm);
  if (I <> -1) and ((FTabs[I].FState <> ftdsNormal) or
     ((FTabs[I].FState = ftdsNormal) and FTabOptions.MarkInvisibleForm and not FTabs[I].FMarkedAsInvisible)) then
  begin
    FTabs[I].FState := ftdsNormal;
    UpdateTab(I);
  end;
end;

procedure TCustomFormTabsBar.FormActivate(AForm: TForm);
var
  I, J: Integer;
begin
  I := FTabs.IndexOf(AForm);
  if I = -1 then
    Exit;
  HideTabHint;
  if FTabs[I].FState <> ftdsSelected then
  begin
    FTabs[I].FState := ftdsSelected;
    FFocusedTabIndex := I;
    for J := 0 to FTabs.Count - 1 do
    begin
      if J <> I then
      begin
        FTabs[J].FState := ftdsNormal;
        if FHideInactiveFormOnParent and (AForm.Parent <> nil) and (FTabs[J].Form.Parent = AForm.Parent) then
          FTabs[J].Form.Visible := False;
      end;
    end;
    ScrollToTab(I);
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TCustomFormTabsBar.DrawCloseButton(ACanvas: TCanvas; ATab: TFormTabsBarTab; ARect: TRect);
var
  LStyle: TCustomStyleServices;
  LIconColor: TColor;
  LDetails: TThemedElementDetails;
begin
  if ARect.IsEmpty then
    Exit;

  LStyle := StyleServices(Self);
  LIconColor := LStyle.GetSystemColor(cForegroundColor);
  if LStyle.Enabled then
  begin
    if (ATab.CloseButtonMouseIn and ATab.CloseButtonMouseDown) or ATab.CloseButtonMouseIn then
    begin
      if ATab.CloseButtonMouseIn and ATab.CloseButtonMouseDown then
        LDetails := LStyle.GetElementDetails(ttbButtonPressed)
      else
        LDetails := LStyle.GetElementDetails(ttbButtonHot);
      LStyle.DrawElement(ACanvas.Handle, LDetails,
        ARect, nil, FCurrentPPI);
      LStyle.GetElementColor(LDetails, ecTextColor, LIconColor);
    end
    else
    if (ATab.State = ftdsHot) or (ATab.State = ftdsSelected) then
    begin
      if ATab.State = ftdsSelected then
        LDetails := LStyle.GetElementDetails(ttTabItemSelected)
      else
      if LStyle.IsSystemStyle and TOSVersion.Check(10) then
        LDetails := LStyle.GetElementDetails(ttTabItemLeftEdgeHot)
      else
        LDetails := LStyle.GetElementDetails(ttTabItemHot);
      LStyle.GetElementColor(LDetails, ecTextColor, LIconColor);
    end;
  end
  else
  begin
    if ATab.CloseButtonMouseIn and ATab.CloseButtonMouseDown then
      DrawFrameControl(ACanvas.Handle, ARect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_PUSHED)
    else
    if ATab.CloseButtonMouseIn then
      DrawFrameControl(ACanvas.Handle, ARect, DFC_BUTTON, DFCS_BUTTONPUSH);
  end;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := ACanvas.Pixels[ARect.CenterPoint.X, ARect.CenterPoint.Y];
  DrawCloseIcon(ACanvas, ARect, LIconColor, cCloseButtonIconSize, FCurrentPPI);
end;

procedure TCustomFormTabsBar.ReleaseFormIcons;
var
  I: Integer;
begin
  for I := 0 to FTabs.Count - 1 do
    FreeAndNil(FTabs[I].FIcon);
end;

procedure TCustomFormTabsBar.DrawTab(ACanvas: TCanvas; AIndex: Integer);
var
  LStyle: TCustomStyleServices;
  LThemedTab: TThemedTab;
  LTab: TFormTabsBarTab;
  LDetails:  TThemedElementDetails;
  LSaveDC: Integer;
  R: TRect;
  LTextColor: TColor;
  LTextRect: TRect;
  LFlags: Longint;
  LDrawSeparator: Boolean;
  LDrawRect: TRect;
  LTabBGColor: TColor;
begin
  LTab := Tabs[AIndex];
  LDrawRect := LTab.BoundsRect;
  ACanvas.Brush.Style := bsSolid;
  LStyle := StyleServices(Self);
  LTextRect := LDrawRect;
  InflateRect(LTextRect, -ScaleValue(cTabContentMargin), -ScaleValue(cTabContentMargin));
  LDrawSeparator := True;
  if seFont in StyleElements then
    LTextColor := LStyle.GetSystemColor(clBtnText)
  else
    LTextColor := Font.Color;
  if (LTab.State in [ftdsSelected, ftdsHot]) then
  begin
    R := LDrawRect;
    if LTab.State = ftdsSelected then
      Inc(R.Bottom, 2);
    if LStyle.Enabled then
    begin
      LDrawSeparator := False;
      if LTab.State = ftdsSelected then
        LThemedTab := ttTabItemSelected
      else
      begin
        if LStyle.IsSystemStyle and TOSVersion.Check(10) then
          LThemedTab := ttTabItemLeftEdgeHot
        else
          LThemedTab := ttTabItemHot;
      end;
      LDetails := LStyle.GetElementDetails(LThemedTab);
      LSaveDC := SaveDC(ACanvas.Handle);
      try
        LStyle.DrawElement(ACanvas.Handle, LDetails, R);
      finally
        RestoreDC(ACanvas.Handle, LSaveDC);
      end;
      if seFont in StyleElements then
        if not LStyle.GetElementColor(LDetails, ecTextColor, LTextColor) then
           LTextColor := clBtnText;
    end
    else
    if LTab.State = ftdsSelected then
    begin
      LDrawSeparator := False;
      ACanvas.Brush.Style := bsSolid;
      ACanvas.Brush.Color := cTabFillColor;
      ACanvas.FillRect(R);
      ACanvas.Pen.Color := cFrameColor;
      ACanvas.MoveTo(R.Left, R.Bottom);
      ACanvas.LineTo(R.Left, R.Top);
      ACanvas.LineTo(R.Right, R.Top);
      ACanvas.LineTo(R.Right, R.Bottom);
    end;
  end;

  LTabBGColor := ACanvas.Pixels[LDrawRect.CenterPoint.X, LDrawRect.CenterPoint.Y];

  if FTabOptions.ShowCloseButton then
  begin
    R := GetCloseButtonRect(LDrawRect);
    LSaveDC := SaveDC(ACanvas.Handle);
    try
      DrawCloseButton(ACanvas, LTab, R);
    finally
      RestoreDC(ACanvas.Handle, LSaveDC);
    end;
    Dec(LTextRect.Right, R.Width + 2);
  end;

  if FTabOptions.ShowFormIcon then
  begin
    R := GetFormIconRect(LTab, LDrawRect);
    DrawIconEx(ACanvas.Handle, R.Left, R.Top, LTab.Icon.Handle, LTab.Icon.Width, LTab.Icon.Height, 0, 0, DI_NORMAL);
    LTextRect.Left := R.Right + ScaleValue(cSpaceIconText);
  end;

  ACanvas.Font.Color := LTextColor;
  ACanvas.Brush.Style := bsClear;
  LFlags := DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS or DT_NOPREFIX;
  DrawText(ACanvas.Handle, LTab.Form.Caption, Length(LTab.Form.Caption), LTextRect, DrawTextBiDiModeFlags(LFlags));

  if FTabOptions.FMarkInvisibleForm and not IsWindowVisible(LTab.Form.Handle) then
  begin
    LTab.FMarkedAsInvisible := True;
    R := LTab.BoundsRect;
    ACanvas.Brush.Style := bsSolid;
    if not LStyle.Enabled or LStyle.IsSystemStyle then
      ACanvas.Brush.Color := cBackgroundColor
    else
      ACanvas.Brush.Color := LStyle.GetSystemColor(cBackgroundColor);
    FillRectAlpha(ACanvas, R, ACanvas.Brush.Color, cInvisibleFormTabFillAlpha);
  end
  else
    LTab.FMarkedAsInvisible := False;

  if LDrawSeparator then
  begin
    R := LDrawRect;
    R.Left := R.Right;
    R.Right := R.Left + 1;
    Inc(R.Top, ScaleValue(cSeparatorMargins));
    Dec(R.Bottom, ScaleValue(cSeparatorMargins));
    FillRectAlpha(ACanvas, R, LStyle.GetSystemColor(cForegroundColor), cSeparatorAlphaValue);
  end;

  if (FFocusedTabIndex = AIndex) and Focused then
  begin
    R := LDrawRect;
    InflateRect(R, -4, -4);
    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := LTabBGColor;
    ACanvas.DrawFocusRect(R);
  end;
end;

function TCustomFormTabsBar.GetTabWidth(ATab: TFormTabsBarTab): Integer;
var
  R: TRect;
  W: Integer;
begin
  Result := ScaleValue(cMinTabWidth);
  if FTabWidth > Result then
  begin
    Result := FTabWidth;
    Exit;
  end;

  DrawText(Canvas.Handle,
    PChar(ATab.Form.Caption), Length(ATab.Form.Caption), R, DT_SINGLELINE or DT_NOPREFIX or DT_CALCRECT);
  W := R.Width + ScaleValue(cTabContentMargin) * 2;
  if FTabOptions.ShowCloseButton then
    Inc(W, ScaleValue(cCloseButtonSize + 2));

  if FTabOptions.ShowFormIcon then
    Inc(W, ATab.Icon.Width + ScaleValue(cSpaceIconText));

  ATab.FTextTruncated := False;
  if (FTabMinWidth > 0) and (W < TabMinWidth) then
    W := FTabMinWidth
  else
  if (FTabMaxWidth > 0) and (W > FTabMaxWidth) then
  begin
    W := FTabMaxWidth;
    ATab.FTextTruncated := True;
  end;

  if W > Result then  
    Result := W;
end;

function TCustomFormTabsBar.GetTabsRect: TRect;
var
  LLeftMargin, LRightMargin: Integer;
begin
  LLeftMargin := ScaleValue(cTabsLeftOffset);
  LRightMargin := GetTabsMenuButtonRect.Width;
  if LRightMargin > 0 then
    Inc(LRightMargin);
  Result := TRect.Create(LLeftMargin, 0, Width - LRightMargin, Height - 1);
end;

function TCustomFormTabsBar.GetTabsMenuButtonRect: TRect;
begin
  if FShowTabsMenuButton then
    Result := TRect.Create(Width - Min(Round(Height * 0.8), GetSystemMetrics(SM_CYVSCROLL) * 2) - 1, 0, Width, Height - 1)
  else
    Result := TRect.Empty;
end;

function TCustomFormTabsBar.GetFormIconRect(ATab: TFormTabsBarTab; ARect: TRect): TRect;
begin
  if ARect.IsEmpty or not FTabOptions.ShowFormIcon then
    Result := TRect.Empty
  else
  begin
    Result.Left := ARect.Left + ScaleValue(cTabContentMargin);
    Result.Top := ARect.CenterPoint.Y - ATab.Icon.Height div 2;
    Result.Right := Result.Left + ATab.Icon.Width;
    Result.Bottom := Result.Top + ATab.Icon.Height;
  end;
end;

function TCustomFormTabsBar.GetCloseButtonRect(ARect: TRect): TRect;
var
  LButtonSize: Integer;
  LMargin: Integer;
begin
  if ARect.IsEmpty or not FTabOptions.ShowCloseButton then
    Result := TRect.Empty
  else
  begin
    LButtonSize := ScaleValue(cCloseButtonSize);
    LMargin := ScaleValue(cTabContentMargin);
    Result.Left := ARect.Right - LButtonSize - LMargin;
    Result.Top := ARect.CenterPoint.Y - LButtonSize div 2;
    Result.Right := Result.Left + LButtonSize;
    Result.Bottom := Result.Top + LButtonSize;
  end;
end;

function TCustomFormTabsBar.GetActiveTabIndex: Integer;
var
  I: Integer;
begin
  for I := 0 to FTabs.Count - 1 do
    if FTabs[I].State = ftdsSelected then
      Exit(I);
  Result := -1;
end;

procedure TCustomFormTabsBar.ScrollToTab(AIndex: Integer);
var
  I, J, W: Integer;
  LTabsRect: TRect;
begin
  if FUpDown = nil then
     Exit;

  if AIndex = -1 then
    AIndex := GetActiveTabIndex;

  if AIndex < FFirstDrawIndex then
  begin
    FFirstDrawIndex := AIndex;
    Invalidate;
  end
  else
  if AIndex > FLastContainsIndex then
  begin
    J := AIndex;
    LTabsRect := GetTabsRect;
    W := GetTabWidth(Tabs[J]) + LTabsRect.Left;
    for I := J - 1 downto 0 do
    begin
      W := W + GetTabWidth(Tabs[I]);
      if (W < LTabsRect.Right - FUpDown.Width) and (J > 0) then
        Dec(J)
      else
        Break;
    end;
    FFirstDrawIndex := J;
    Invalidate;
  end;

  FUpDown.Position := FFirstDrawIndex;
end;

procedure TCustomFormTabsBar.CalcTabRects;
var
  I, J: Integer;
  X, W: Integer;
  LTabsRect: TRect;
  LUpDownWidth: Integer;
  LLastContainsIndexInTabsRect: Integer;
begin
  if FTabs.Count = 0 then
    Exit;

  Canvas.Font := Self.Font;
  LTabsRect := GetTabsRect;
  X := LTabsRect.Left;
  if FUpDown <> nil then
    LUpDownWidth := FUpDown.Width
  else
    LUpDownWidth := 0;

  if FFirstDrawIndex > Tabs.Count - 1 then
    FFirstDrawIndex := Tabs.Count - 1;
  if FFirstDrawIndex < 0 then
    FFirstDrawIndex := 0;

  LLastContainsIndexInTabsRect := 0;

  for I := FFirstDrawIndex to Tabs.Count - 1 do
  begin
    W := GetTabWidth(Tabs[I]);
    Tabs[I].FBoundsRect := TRect.Create(X, LTabsRect.Top, X + W, LTabsRect.Bottom);
    if FTabs[I].FBoundsRect.Right <= LTabsRect.Right - LUpDownWidth then
      FLastContainsIndex := I;
    if FTabs[I].FBoundsRect.Right <= LTabsRect.Right then
      LLastContainsIndexInTabsRect := I;
    if FTabs[I].FBoundsRect.Left <= LTabsRect.Right then
      FLastDrawIndex := I
    else
      Break;
    Inc(X, W);
  end;

  if FUpDown <> nil then
    FUpDown.Max := FFirstDrawIndex + (Tabs.Count - FLastContainsIndex - 1);

  if (FFirstDrawIndex = 0) and (LLastContainsIndexInTabsRect = Tabs.Count - 1) and (LUpDownWidth > 0) then
    HideUpDown
  else
  if (LLastContainsIndexInTabsRect < Tabs.Count - 1) and (LUpDownWidth = 0) then
    ShowUpDown
  else
  if (FFirstDrawIndex > 0) and (FLastContainsIndex = FTabs.Count - 1) and not IScaling then
  begin
    J := FFirstDrawIndex;
    W := 0;
    for I  := FFirstDrawIndex - 1 downto 0 do
    begin
      W := W + GetTabWidth(Tabs[I]);
      if (FTabs[FLastContainsIndex].BoundsRect.Right + W < LTabsRect.Right - LUpDownWidth) and (J > 0) then
        Dec(J)
      else
        Break;
    end;
    if J <> FFirstDrawIndex then
    begin
      FFirstDrawIndex := J;
      if FUpDown <> nil then
        FUpDown.Position := FFirstDrawIndex;
      CalcTabRects;
    end;
  end;
end;

procedure TCustomFormTabsBar.DrawTabs(ACanvas: TCanvas);
var
  I: Integer;
  LTabsRect: TRect;
  LTabRect: TRect;
  LSaveDC: Integer;
  LRightOffset: Integer;
begin
  if FTabs.Count = 0 then
    Exit;
  if FUpDown = nil then
    LRightOffset := 0
  else
    LRightOffset := FUpDown.Width;
  CalcTabRects;
  ACanvas.Font.Assign(Font);
  LTabsRect := GetTabsRect;
  LSaveDC := SaveDC(ACanvas.Handle);
  try
    IntersectClipRect(ACanvas.Handle,
      LTabsRect.Left, LTabsRect.Top, LTabsRect.Right - LRightOffset, LTabsRect.Bottom + 1);
    for I := FFirstDrawIndex to FLastDrawIndex do
      if I <> FMouseDragTabIndex then
        DrawTab(ACanvas, I);
    if IsTabIndexAvailable(FMouseDragTabIndex) then
    begin
      LTabRect := FTabs[FMouseDragTabIndex].BoundsRect;
      LSaveDC := SaveDC(ACanvas.Handle);
      if not ((FMouseDragTabIndex = 0) and (FMouseDragTabX < LTabRect.Left)) and
         not ((FMouseDragTabIndex = FTabs.Count - 1) and (FMouseDragTabX > LTabRect.Left)) then
      begin
        FTabs[FMouseDragTabIndex].BoundsRect :=
          TRect.Create(FMouseDragTabX, LTabRect.Top, FMouseDragTabX + LTabRect.Width, LTabRect.Bottom);
      end;
      DrawTab(ACanvas, FMouseDragTabIndex);
      FTabs[FMouseDragTabIndex].BoundsRect := LTabRect;
    end;
  finally
    RestoreDC(ACanvas.Handle, LSaveDC);
  end;
end;

procedure TCustomFormTabsBar.DrawBackground(ACanvas: TCanvas);
var
  LStyle: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  R: TRect;
begin
  LStyle := StyleServices(Self);
  if not LStyle.Enabled or LStyle.IsSystemStyle then
    ACanvas.Brush.Color := cBackgroundColor
  else
    ACanvas.Brush.Color := LStyle.GetSystemColor(cBackgroundColor);
  R := TRect.Create(0, 0, Width, Height);
  ACanvas.FillRect(R);
  if LStyle.Enabled then
  begin
    R.Top := R.Bottom - 1;
    Inc(R.Bottom, 10);
    Dec(R.Left, 2);
    Inc(R.Right, 2);
    LDetails := LStyle.GetElementDetails(ttPane);
    LStyle.DrawElement(ACanvas.Handle, LDetails, R);
  end
  else
  begin
    ACanvas.Pen.Color := cFrameColor;
    ACanvas.MoveTo(0, R.Bottom - 1);
    ACanvas.LineTo(R.Right, R.Bottom - 1);
  end;
end;

procedure TCustomFormTabsBar.Paint;
var
  LBuffer: TBitmap;
begin
  if (Width = 0) or (Height = 0) then
    Exit;

  LBuffer := TBitmap.Create(Width, Height);
  try
    DrawBackground(LBuffer.Canvas);
    if FShowTabsMenuButton then
       DrawTabsMenuButton(LBuffer.Canvas, GetTabsMenuButtonRect, FTabsMenuButtonMouseIn, FTabsMenuButtonDown);
    DrawTabs(LBuffer.Canvas);
    Canvas.Draw(0, 0, LBuffer);
  finally
    LBuffer.Free;
  end;
end;

function TCustomFormTabsBar.IsTabIndexAvailable(const AIndex: Integer): Boolean;
begin
  Result := (AIndex >= 0) and (AIndex < FTabs.Count);
end;

function TCustomFormTabsBar.TabIndexFromPoint(P: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  if (FTabs.Count > 0) and (GetTabsRect.Contains(P)) then
  begin
    if FLastDrawIndex > Tabs.Count - 1 then
      FLastDrawIndex := Tabs.Count - 1;
    for I := FFirstDrawIndex to FLastDrawIndex do
      if FTabs[I].BoundsRect.Contains(P) then
        Exit(I);
  end;
end;

function TCustomFormTabsBar.TabFromPoint(P: TPoint): TFormTabsBarTab;
var
  LIndex: Integer;
begin
  Result := nil;
  LIndex := TabIndexFromPoint(P);
  if LIndex <> -1 then
    Result := FTabs[LIndex];
end;

procedure TCustomFormTabsBar.DragScroll;
var
  LTabsRect: TRect;
begin
  if (FUpDown <> nil) and IsTabIndexAvailable(FMouseDragTabIndex) then
  begin
    LTabsRect := GetTabsRect;
    if FMouseDragTabX < LTabsRect.Left then
    begin
      FUpDown.Position := FUpDown.Position - 1;
      if FFirstDrawIndex <> FUpDown.Position then
      begin
        FFirstDrawIndex := FUpDown.Position;
        FTabs[FMouseDragTabIndex].Index := FFirstDrawIndex;
        FMouseDragTabIndex := FFirstDrawIndex;
        Invalidate;
      end;
    end
    else
    if FMouseDragTabX + FTabs[FMouseDragTabIndex].BoundsRect.Width > LTabsRect.Right - FUpDown.Width then
    begin
      FUpDown.Position := FUpDown.Position + 1;
      if FFirstDrawIndex <> FUpDown.Position then
      begin
        FFirstDrawIndex := FUpDown.Position;
        CalcTabRects;
        FTabs[FMouseDragTabIndex].Index := FLastDrawIndex;
        FMouseDragTabIndex := FLastDrawIndex;
        Invalidate;
      end;
    end
    else
      StopDragScrollTimer;
  end;
end;

procedure TCustomFormTabsBar.StartDragScrollTimer;
begin
  if not FDragScrolling then
  begin
    FDragScrolling := True;
    SetTimer(Handle, cDragScrollTimerID, 100, nil);
  end;
end;

procedure TCustomFormTabsBar.StopDragScrollTimer;
begin
  if FDragScrolling then
  begin
    KillTimer(Handle, cDragScrollTimerID);
    FDragScrolling := False;
  end;
end;

procedure TCustomFormTabsBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  LIndex: Integer;
  LNeedUpdate: Boolean;
  LOldTabHotIndex: Integer;
  LMouseInCloseButton: Boolean;
  LTabsRect: TRect;
begin
  inherited;
  LNeedUpdate := False;

  if FShowTabsMenuButton and (FMouseDragTabIndex = -1)  then
  begin
    if GetTabsMenuButtonRect.Contains(TPoint.Create(X, Y)) then
    begin
      FTabHotIndex := -1;
      if not FTabsMenuButtonMouseIn then
      begin
        FTabsMenuButtonMouseIn := True;
        Invalidate;
      end;
      Exit;
    end
    else
    if not GetTabsMenuButtonRect.Contains(TPoint.Create(X, Y)) and FTabsMenuButtonMouseIn then
    begin
      FTabsMenuButtonMouseIn := False;
      LNeedUpdate := True;
    end;
  end;

  if FTabOptions.Draggable and (FMouseDownX >= 0) and (Abs(X - FMouseDownX) > ScaleValue(5)) and (FMouseDragTabIndex = -1) then
    FMouseDragTabIndex := TabIndexFromPoint(TPoint.Create(FMouseDownX, Height div 2));

  if FTabOptions.Draggable and IsTabIndexAvailable(FMouseDragTabIndex) then
  begin
    LIndex := TabIndexFromPoint(TPoint.Create(FMouseDragTabX + FTabs[FMouseDragTabIndex].BoundsRect.Width div 2, Height div 2));
    FMouseDragTabX := FMouseDragTabX - (FMouseDownX - X);
    if IsTabIndexAvailable(LIndex) and
       (((X < FMouseDownX) and (FMouseDragTabX < FTabs[LIndex].BoundsRect.CenterPoint.X) and (LIndex < FMouseDragTabIndex)) or
       ((X > FMouseDownX) and (FMouseDragTabX + FTabs[FMouseDragTabIndex].BoundsRect.Width > FTabs[LIndex].BoundsRect.CenterPoint.X) and (LIndex > FMouseDragTabIndex))) then
    begin
      FTabs[FMouseDragTabIndex].Index := LIndex;
      FMouseDragTabIndex := LIndex;
      FTabHotIndex := LIndex;
    end;
    FMouseDownX := X;
    Invalidate;
    LTabsRect := GetTabsRect;
    if FUpDown <> nil then
    begin
      if (FMouseDragTabX < LTabsRect.Left) or
         (FMouseDragTabX + FTabs[FMouseDragTabIndex].BoundsRect.Width > LTabsRect.Right - FUpDown.Width)
      then
        StartDragScrollTimer
      else
        StopDragScrollTimer;
    end;
    Exit;
  end;

  LIndex := TabIndexFromPoint(TPoint.Create(X, Y));

  if FTabOptions.ShowHintForTruncatedCaption then
  begin
    if (FTabHintActivatingIndex <> LIndex) and (FTabHintActivatingIndex <> -1) then
    begin
      FTabHintActiveIndex := -1;
      HideTabHint;
    end;
    if (LIndex <> -1) and FTabs[LIndex].FTextTruncated and (LIndex <> FTabHotIndex) then
    begin
      FTabHintActiveIndex := LIndex;
      ShowTabHint(LIndex);
    end;
  end;

  LOldTabHotIndex := FTabHotIndex;
  if (LIndex <> -1) and (FTabs[LIndex].FState = ftdsNormal) then
  begin
    FTabs[LIndex].FState := ftdsHot;
    LNeedUpdate := True;
  end;
  if FTabHotIndex <> LIndex then
  begin
    if IsTabIndexAvailable(FTabHotIndex) and (FTabs[FTabHotIndex].FState <> ftdsSelected) then
    begin
      FTabs[FTabHotIndex].FState := ftdsNormal;
      LNeedUpdate := True;
    end;
    FTabHotIndex := LIndex;
  end;
  if FTabOptions.ShowCloseButton then
  begin
    if LIndex <> -1 then
    begin
      LMouseInCloseButton := GetCloseButtonRect(FTabs[LIndex].BoundsRect).Contains(TPoint.Create(X, Y));
      if LMouseInCloseButton and not FTabs[LIndex].FCloseButtonMouseIn then
      begin
        FTabs[LIndex].FCloseButtonMouseIn := True;
        LNeedUpdate := True;
      end
      else
      if not LMouseInCloseButton and FTabs[LIndex].FCloseButtonMouseIn then
      begin
        FTabs[LIndex].FCloseButtonMouseIn := False;
        LNeedUpdate := True;
      end;
    end;
    if (LOldTabHotIndex <> LIndex) and IsTabIndexAvailable(LOldTabHotIndex) and FTabs[LOldTabHotIndex].FCloseButtonMouseIn then
    begin
      FTabs[LOldTabHotIndex].FCloseButtonMouseIn := False;
      LNeedUpdate := True;
    end;
  end;

  if LNeedUpdate then
    Invalidate;
end;

procedure TCustomFormTabsBar.TrackTabsMenu;
var
  R: TRect;
  P: TPoint;
begin
  if FTabsMenu = nil then
  begin
    FTabsMenu := TPopupMenu.Create(Self);
    FTabsMenu.Alignment := paRight;
  end;
  R := GetTabsMenuButtonRect;
  P := ClientToScreen(TPoint.Create(R.Right, R.Bottom));
  CreateTabsMenuItems(FTabsMenu.Items);
  FTabsMenu.Popup(P.X, P.Y);
end;


procedure TCustomFormTabsBar.FormShow(ATab: TFormTabsBarTab);
var
  LChildMaximized: Boolean;
begin
  if ATab.Form.Parent = nil then
  begin
    LChildMaximized := (ATab.Form.FormStyle = fsMDIChild) and (Application.MainForm.ActiveMDIChild <> nil) and
      (Application.MainForm.ActiveMDIChild.WindowState = wsMaximized);
    if LChildMaximized then
      SendMessage(Application.MainForm.ClientHandle, WM_SETREDRAW, 0, 0);
    try
      ATab.Form.Show;
    finally
      if LChildMaximized then
      begin
        SendMessage(Application.MainForm.ClientHandle, WM_SETREDRAW, 1, 0);
        RedrawWindow(ATab.Form.Handle, nil, 0,
          RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN or RDW_UPDATENOW);
      end;
    end;
  end
  else
  begin
    if FHideInactiveFormOnParent then
      ATab.Form.Visible := True;
    SendMessage(ATab.Form.Handle, WM_SHOWWINDOW, 1, 0);
  end;
end;

procedure TCustomFormTabsBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LTab: TFormTabsBarTab;
begin
  inherited;
  if Button <> mbLeft then
    Exit;

  HideTabHint;

  if FShowTabsMenuButton then
  begin
    if GetTabsMenuButtonRect.Contains(TPoint.Create(X, Y)) and FTabsMenuButtonMouseIn then
    begin
      FTabsMenuButtonDown := True;
      Invalidate;
      TrackTabsMenu;
      FTabsMenuButtonDown := False;
      Invalidate;
      Exit;
    end;
  end;

  LTab := TabFromPoint(TPoint.Create(X, Y));
  if LTab <> nil then
  begin
    if not IsIconic(LTab.Form.Handle) and not (FTabOptions.ShowCloseButton and LTab.CloseButtonMouseIn) then
    begin
      FMouseDownX := X;
      FMouseDragTabX := LTab.BoundsRect.Left;
      FormShow(LTab);
    end
    else
    if FTabOptions.ShowCloseButton and GetCloseButtonRect(LTab.BoundsRect).Contains(TPoint.Create(X, Y)) then
    begin
      LTab.FCloseButtonMouseDown := True;
      FMouseCaptureTab := LTab;
      Invalidate;
    end;
  end;
end;

procedure TCustomFormTabsBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button <> mbLeft then
    Exit;

  FMouseDownX := -1;
  if FMouseDragTabIndex <> -1 then
  begin
    StopDragScrollTimer;
    FMouseDragTabIndex := -1;
    Invalidate;
  end;

  if FTabOptions.ShowCloseButton and (FMouseCaptureTab <> nil) then
  begin
    FMouseCaptureTab.FCloseButtonMouseDown := False;
    if FMouseCaptureTab.CloseButtonMouseIn then
    begin
      Invalidate;
      FMouseCaptureTab.Form.Close;
      FMouseCaptureTab := nil;
    end
  end;
end;

procedure TCustomFormTabsBar.StartMouseTimer;
begin
  KillTimer(Handle, cCheckMouseLeaveTimerID);
  SetTimer(Handle, cCheckMouseLeaveTimerID, 500, nil);
end;

procedure TCustomFormTabsBar.StopMouseTimer;
var
  LNeedUpdate: Boolean;
begin
  KillTimer(Handle, cCheckMouseLeaveTimerID);
  HideTabHint;
  LNeedUpdate := False;
  if IsTabIndexAvailable(FTabHotIndex) then
  begin
    if FTabs[FTabHotIndex].FState <> ftdsSelected then
      FTabs[FTabHotIndex].FState := ftdsNormal;
    FTabs[FTabHotIndex].FCloseButtonMouseIn := False;
    FTabHotIndex := -1;
    LNeedUpdate := True;
  end;
  if FShowTabsMenuButton then
  begin
    if FTabsMenuButtonMouseIn then
    begin
      FTabsMenuButtonMouseIn := False;
      LNeedUpdate := True;
    end;
  end;
  if LNeedUpdate then
    Invalidate;
end;

procedure TCustomFormTabsBar.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  StartMouseTimer;
end;

procedure TCustomFormTabsBar.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  StopMouseTimer;
end;

procedure TCustomFormTabsBar.ShowFormSystemMenu(AForm: TForm; X, Y: Integer);
begin
  AForm.Perform($313, 0, MakeLong(X, Y));
end;

procedure TCustomFormTabsBar.WMLButtonDown(var Message: TWMMouse);
var
  LTab: TFormTabsBarTab;
  P: TPoint;
begin
  HideTabHint;
  LTab := TabFromPoint(TPoint.Create(Message.XPos, Message.YPos));
  if (LTab <> nil) and FTabOptions.ShowFormIcon and FTabOptions.ShowFormSystemMenu and
     GetFormIconRect(LTab, LTab.BoundsRect).Contains(TPoint.Create(Message.XPos, Message.YPos)) then
  begin
    P := Self.ClientToScreen(TPoint.Create(LTab.BoundsRect.Left, LTab.BoundsRect.Bottom));
    ShowFormSystemMenu(LTab.Form, P.X, P.Y);
  end
  else
  if (LTab <> nil) and IsIconic(LTab.Form.Handle) and not (FTabOptions.ShowCloseButton and LTab.CloseButtonMouseIn) then
    FormRestore(LTab)
  else
    inherited;
end;

procedure TCustomFormTabsBar.WMRButtonUp(var Message: TWMMouse);
var
  LTab: TFormTabsBarTab;
begin
  if FTabOptions.ShowFormSystemMenu then
  begin
    LTab := TabFromPoint(TPoint.Create(Message.XPos, Message.YPos));
    if LTab <> nil then
      ShowFormSystemMenu(LTab.Form, Mouse.CursorPos.X, Mouse.CursorPos.Y)
    else
      inherited;
  end
  else
    inherited;
end;

procedure TCustomFormTabsBar.CheckMouseLeave;
begin
  if WindowFromPoint(TPoint.Create(Mouse.CursorPos.X, Mouse.CursorPos.Y)) <> Handle then
    StopMouseTimer;
end;

procedure TCustomFormTabsBar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or WS_CLIPCHILDREN;
end;

procedure TCustomFormTabsBar.WMSize(var Message: TWMSIZE);
begin
  inherited;
  CalcTabRects;
  AdjustUpDown;
end;

procedure TCustomFormTabsBar.AdjustUpDown;
var
  W: Integer;
  R: TRect;
begin
  if FUpDown = nil then
    Exit;
  W := Min(Round(Height * 1.5), GetSystemMetrics(SM_CYVSCROLL) * 4);
  R := GetTabsRect;
  FUpDown.SetBounds(R.Right - W, 0, W, Height - 1);
  ScrollToTab(-1);
end;

procedure TCustomFormTabsBar.ShowUpDown;
begin
  if FUpDown = nil then
  begin
    FUpDown := TUpDown.Create(Self);
    FUpDown.Orientation := udHorizontal;
    FUpDown.OnClick := Self.UpDownClick;
    FUpDown.Visible := False;
    FUpDown.Parent := Self;
    AdjustUpDown;
    FUpDown.Visible := True;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.HideUpDown;
begin
  FreeAndNil(FUpDown);
  Invalidate;
end;

procedure TCustomFormTabsBar.UpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  if FFirstDrawIndex <> FUpDown.Position then
  begin
    FFirstDrawIndex := FUpDown.Position;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.WMMouseWheel(var Message: TWMMouseWheel);
begin
  if FMouseWheelScroll and (FUpDown <> nil) then
  begin
    if Message.WheelDelta > 0 then
      FUpDown.Position := FUpDown.Position + 1
    else
      FUpDown.Position := FUpDown.Position - 1;
   if FFirstDrawIndex <> FUpDown.Position then
   begin
     HideTabHint;
     FFirstDrawIndex := FUpDown.Position;
     Invalidate;
   end;
  end
  else
    inherited;
end;

procedure TCustomFormTabsBar.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  FTabWidth := MulDiv(FTabWidth, M, D);
  FTabMinWidth := MulDiv(FTabMinWidth, M, D);
  FTabMaxWidth := MulDiv(FTabMaxWidth, M, D);
  ReleaseFormIcons;
  inherited;
end;

procedure TCustomFormTabsBar.CreateTabsMenuItems(AMenuItem: TMenuItem);
const
  cItemHeightSpaceAllDPI = 6;
  cPopupMenuBorderSizeAllDPI = 6;
var
  I, J: Integer;
  LMenuItem: TMenuItem;
  LCurrentSubMenuItem: TMenuItem;
  LMaxMenuItemCount: Integer;
  LMonitor: TMonitor;
  P: TPoint;
begin
  AMenuItem.Clear;
  J := 0;
  LCurrentSubMenuItem := AMenuItem;
  P := ClientToScreen(TPoint.Create(0, Height));
  LMonitor := Screen.MonitorFromWindow(Handle);
  I := GetSystemMetrics(SM_CYMENUCHECK) + cItemHeightSpaceAllDPI;
  LMaxMenuItemCount := Max((LMonitor.WorkareaRect.Bottom - P.Y - cPopupMenuBorderSizeAllDPI) div I - 1, cMinMenuItemCount);
  for I := 0 to FTabs.Count - 1 do
  begin
    Inc(J);
    if J > LMaxMenuItemCount - 2 then
    begin
      J := 0;
      LMenuItem := TMenuItem.Create(Self);
      LMenuItem.Caption := '...';
      LCurrentSubMenuItem.Add(LMenuItem);
      LCurrentSubMenuItem := LMenuItem;
    end;
    LMenuItem := TMenuItem.Create(Self);
    LMenuItem.RadioItem := True;
    LMenuItem.Caption := FTabs[I].Form.Caption;
    LMenuItem.Tag := I;
    LMenuItem.OnClick := OnTabsMenuItemClick;
    if FTabs[I].State = ftdsSelected then
      LMenuItem.Checked := True;
    LCurrentSubMenuItem.Add(LMenuItem);
  end;
end;

procedure TCustomFormTabsBar.OnTabsMenuItemClick(Sender: TObject);
var
  LTab: TFormTabsBarTab;
begin
  if IsTabIndexAvailable(TMenuItem(Sender).Tag) then
  begin
    LTab := FTabs[TMenuItem(Sender).Tag];
    if IsIconic(LTab.Form.Handle) then
      FormRestore(LTab)
    else
      FormShow(LTab);
  end;
end;

procedure TCustomFormTabsBar.DrawTabsMenuButton(ACanvas: TCanvas; ARect: TRect; AMouseIn, ADown: Boolean);
var
  LStyle: TCustomStyleServices;
  LIconColor: TColor;
  LDetails:  TThemedElementDetails;
  LBuffer: TBitmap;
  LDrawRect: TRect;
begin
  if ARect.IsEmpty then
    Exit;

  LBuffer := TBitmap.Create(ARect.Width, ARect.Height);
  LDrawRect := TRect.Create(0, 0, LBuffer.Width, LBuffer.Height);
  try
    LStyle := StyleServices(Self);
    LBuffer.Canvas.Brush.Color := LStyle.GetSystemColor(clBtnFace);
    LBuffer.Canvas.Brush.Style := bsSolid;
    LBuffer.Canvas.FillRect(LDrawRect);
    if LStyle.Enabled then
    begin
      if LStyle.IsSystemStyle then
      begin
        if FTabs.Count = 0 then
          LDetails := LStyle.GetElementDetails(tbPushButtonDisabled)
        else
        if ADown then
          LDetails := LStyle.GetElementDetails(tbPushButtonPressed)
        else
        if AMouseIn then
          LDetails := LStyle.GetElementDetails(tbPushButtonHot)
        else
          LDetails := LStyle.GetElementDetails(tbPushButtonNormal);
      end
      else
      begin
        if FTabs.Count = 0 then
          LDetails := LStyle.GetElementDetails(ttbButtonDisabled)
        else
        if ADown then
          LDetails := LStyle.GetElementDetails(ttbButtonPressed)
        else
        if AMouseIn then
          LDetails := LStyle.GetElementDetails(ttbButtonHot)
        else
          LDetails := LStyle.GetElementDetails(ttbButtonNormal);
      end;
      LStyle.DrawElement(LBuffer.Canvas.Handle, LDetails, LDrawRect);
      if not LStyle.GetElementColor(LDetails, ecTextColor, LIconColor) then
        LIconColor := clBtnText;
    end
    else
    begin
      LIconColor := clBtnText;
      if ADown then
        DrawFrameControl(LBuffer.Canvas.Handle, LDrawRect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_PUSHED)
      else
      if AMouseIn then
        DrawFrameControl(LBuffer.Canvas.Handle, LDrawRect, DFC_BUTTON, DFCS_BUTTONPUSH);
    end;
    DrawMenuIcon(LBuffer.Canvas, LDrawRect, LIconColor, cMenuButtonIconSize, FCurrentPPI);
    ACanvas.Draw(ARect.Left, ARect.Top, LBuffer);
  finally
    LBuffer.Free;
  end;
end;

procedure TCustomFormTabsBar.HideTabHint;
begin
  if not IsTabIndexAvailable(FTabHintActivatingIndex) then
    Exit;
  FTabHintActivatingIndex := -1;
  if FTabHintWindow <> nil then
    ShowWindow(FTabHintWindow.Handle, SW_HIDE);
  KillTimer(Handle, cShowHintTimerID);
  KillTimer(Handle, cHideHintTimerID);
end;

procedure TCustomFormTabsBar.ShowTabHint(AIndex: Integer);
begin
  if FTabHintActivatingIndex = -1 then
  begin
    FTabHintActivatingIndex := AIndex;
    SetTimer(Handle, cShowHintTimerID, Application.HintPause, nil);
  end;
end;

procedure TCustomFormTabsBar.ActivateTabHint;
var
  LMonitor: TMonitor;
  R: TRect;
  P: TPoint;
begin
  if not IsTabIndexAvailable(FTabHintActivatingIndex) then
    Exit;

  KillTimer(Handle, cShowHintTimerID);

  if FTabHintActivatingIndex <> FTabHintActiveIndex then
    Exit;

  if FTabHintWindow = nil then
    FTabHintWindow := THintWindow.Create(Self);
  LMonitor := Screen.MonitorFromWindow(Handle);
  R := FTabHintWindow.CalcHintRect(LMonitor.WorkareaRect.Width div 2, FTabs[FTabHintActivatingIndex].Form.Caption, nil);
  P := ClientToScreen(TPoint.Create(FTabs[FTabHintActivatingIndex].BoundsRect.Left, FTabs[FTabHintActivatingIndex].BoundsRect.Bottom));
  FTabHintWindow.ActivateHint(TRect.Create(P.X, P.Y, P.X + R.Width, P.Y + R.Height), FTabs[FTabHintActivatingIndex].Form.Caption);
  SetTimer(Handle, cHideHintTimerID, Application.HintHidePause, nil);
end;

procedure TCustomFormTabsBar.WMTimer(var Message: TWMTimer);
begin
  inherited;
  case Message.TimerID of
    cCheckMouseLeaveTimerID:
      CheckMouseLeave;
    cDragScrollTimerID:
      DragScroll;
    cShowHintTimerID:
      ActivateTabHint;
    cHideHintTimerID:
      HideTabHint;
  end;
end;

procedure TCustomFormTabsBar.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if FTabs.Count > 0 then
  begin
    if (FFocusedTabIndex < FFirstDrawIndex) or (FFocusedTabIndex > FLastDrawIndex)  then
      FFocusedTabIndex := FFirstDrawIndex;
    Invalidate;
  end;
end;

procedure TCustomFormTabsBar.WMKillFocus(var Message: TWMSetFocus);
begin
  inherited;
  if FTabs.Count > 0 then
    Invalidate;
end;

procedure TCustomFormTabsBar.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TCustomFormTabsBar.KeyUp(var Key: Word; Shift: TShiftState);
var
  LTab: TFormTabsBarTab;
begin
  inherited KeyUp(Key, Shift);
  case Key of
    VK_RETURN, VK_SPACE:
    begin
      if IsTabIndexAvailable(FFocusedTabIndex) then
      begin
        LTab := FTabs[FFocusedTabIndex];
        if LTab.State <> ftdsSelected then
        begin
          if IsIconic(LTab.Form.Handle) then
            FormRestore(LTab)
          else
            FormShow(LTab);
        end;
      end;
    end;
  end;
end;

procedure TCustomFormTabsBar.KeyDown(var Key: Word; Shift: TShiftState);
var
  LIndex: Integer;
begin
  inherited KeyDown(Key, Shift);

  if FTabs.Count = 0 then
    Exit;

  case Key of
    VK_UP,VK_LEFT:
    begin
      LIndex := FFocusedTabIndex;
      Dec(LIndex);
      if LIndex < FFirstDrawIndex then
      begin
        if FUpDown <> nil then
        begin
          FUpDown.Position := FUpDown.Position - 1;
          FFirstDrawIndex := FUpDown.Position;
        end;
        LIndex := FFirstDrawIndex;
      end;

      if LIndex <> FFocusedTabIndex then
      begin
        FFocusedTabIndex := LIndex;
        Invalidate;
      end;
    end;

    VK_DOWN, VK_RIGHT:
    begin
      LIndex := FFocusedTabIndex;
      Inc(LIndex);
      if LIndex > FLastContainsIndex then
      begin
        if FUpDown <> nil then
        begin
          FUpDown.Position := FUpDown.Position + 1;
          if FFirstDrawIndex <> FUpDown.Position then
          begin
            FFirstDrawIndex := FUpDown.Position;
            CalcTabRects;
          end;
        end;
        LIndex := FLastContainsIndex;
      end;
      if LIndex <> FFocusedTabIndex then
      begin
        FFocusedTabIndex := LIndex;
        Invalidate;
      end;
    end;

    VK_HOME:
    begin
      if (FUpDown <> nil) and (FUpDown.Position <> FUpDown.Min) then
      begin
        FUpDown.Position := FUpDown.Min;
        FFirstDrawIndex := FUpDown.Position;
        FFocusedTabIndex := FFirstDrawIndex;
        Invalidate;
      end
      else
      if FFocusedTabIndex <> FFirstDrawIndex then
      begin
        FFocusedTabIndex := FFirstDrawIndex;
        Invalidate;
      end;
    end;

    VK_END:
    begin
    if (FUpDown <> nil) and (FUpDown.Position <> FUpDown.Max) then
      begin
        FUpDown.Position := FUpDown.Max;
        FFirstDrawIndex := FUpDown.Position;
        CalcTabRects;
        FFocusedTabIndex := FLastDrawIndex;
        Invalidate;
      end
      else
      if FFocusedTabIndex <> FLastDrawIndex then
      begin
        FFocusedTabIndex := FLastDrawIndex;
        Invalidate;
      end;
    end;
  end;
end;

end.

