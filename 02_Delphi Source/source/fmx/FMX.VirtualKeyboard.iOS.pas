{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.VirtualKeyboard.iOS;

interface

{$SCOPEDENUMS ON}

procedure RegisterVirtualKeyboardServices;
procedure UnregisterVirtualKeyboardServices;

implementation

uses
  System.Classes, System.SysUtils, System.TypInfo, System.Generics.Collections, System.Types, System.Messaging,
  System.Math, Macapi.ObjectiveC, Macapi.ObjCRuntime, Macapi.Helpers, iOSapi.Foundation, iOSapi.UIKit, FMX.Types,
  FMX.VirtualKeyboard, FMX.Platform, FMX.Forms, FMX.Platform.iOS, FMX.Consts, FMX.Helpers.iOS, FMX.Controls.Presentation,
  FMX.Controls;

type
  TiOSVirtualKeyboardService = class;
  TStoredActiveForm = class;

  IKeyboardEvents = interface(NSObject)
  ['{72D3A7FD-DDE3-473D-9750-46C072E7B3B7}']
    { Keyboard notifications }
    procedure KeyboardWillShow(notification: Pointer); cdecl;
    procedure KeyboardWillHide(notification: Pointer); cdecl;
    procedure KeyboardDidHide(notification: Pointer); cdecl;
    procedure KeyboardDidShow(notification: Pointer); cdecl;
  end;

  TKeyboardEventHandler = class(TOCLocal)
  strict private type
    TKeyboardState = (Shown, Hidden);
  private
    FOwner: TiOSVirtualKeyboardService;
    FKeepFocus: Boolean;
    FVisible: Boolean;
    FLastKeyboardRect: TRect;
    { Keyboard Notifications }
    procedure SendNotificationAboutKeyboardEvent(const AVKRect: TRect; const AKeyboardState: TKeyboardState);
    class function GetKeyboardRect(const Notification: Pointer): TRect;
    class function InvertFrame(const AFrame: NSRect): NSRect;
  protected
    { TOCLocal }
    function GetObjectiveCClass: PTypeInfo; override;
  public
    constructor Create(const AOwner: TiOSVirtualKeyboardService);
    destructor Destroy; override;

    { IKeyboardEvents }
    procedure KeyboardWillShow(notification: Pointer); cdecl;
    procedure KeyboardWillHide(notification: Pointer); cdecl;
    procedure KeyboardDidHide(notification: Pointer); cdecl;
    procedure KeyboardDidShow(notification: Pointer); cdecl;
    procedure HideVirtualKeyboard; cdecl;

    property Visible: Boolean read FVisible;
  end;

  IFMXTextInputAccessoryToolbar = interface(UIToolbar)
  ['{016091B6-EAC4-485E-912D-3278F962E262}']
    { Custom }
    procedure onButtonTap(sender: Pointer); cdecl;
    procedure onDoneTap(sender: Pointer); cdecl;
  end;

  TiOSTextInputAccessoryToolbar = class(TOCLocal)
  private
    FButtons: TList<TVirtualKeyboardToolButton>;
    FOnDone: TNotifyEvent;
    FToolBarButtons: NSMutableArray;
    FFlexibleSepararator: UIBarButtonItem;
    FDoneButton: UIBarButtonItem;
    FIsDoneButtonVisible: Boolean;
    FVisible: Boolean;
    function GetView: UIToolbar;
    procedure SetIsDoneButtonVisible(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    function GetButton(const AIndex: Integer): TVirtualKeyboardToolButton;
    function GetButtonsCount: Integer;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure RefreshButtons;
    procedure DoDone;
  public
    constructor Create;
    destructor Destroy; override;
    class procedure ReleaseObjectsInArray(const AObjectArray: NSArray);

    function AddButton(const Title: string; const AOnClick: TNotifyEvent): TVirtualKeyboardToolButton;
    procedure DeleteButton(const Index: Integer);
    procedure ClearButtons;

    { Custom }
    procedure onButtonTap(sender: Pointer); cdecl;
    procedure onDoneTap(sender: Pointer); cdecl;
  public
    property Buttons[const AIndex: Integer]: TVirtualKeyboardToolButton read GetButton;
    property ButtonsCount: Integer read GetButtonsCount;
    property IsDoneButtonVisible: Boolean read FIsDoneButtonVisible write SetIsDoneButtonVisible;
    property Visible: Boolean read FVisible write SetVisible;
    property View: UIToolbar read GetView;
    property OnDone: TNotifyEvent read FOnDone write FOnDone;
  end;

  TiOSVirtualKeyboardService = class(TInterfacedObject, IFMXVirtualKeyboardService, IFMXVirtualKeyboardToolbarService,
                                     IFMXVirtualKeyboardTextInputAccessoryService)
  private
    FKeyboardHandler: TKeyboardEventHandler;
    FTransient: Boolean;
    FStoredActiveForm: TStoredActiveForm;
    { Toolbar }
    FToolbar: TiOSTextInputAccessoryToolbar;
    FParkingView: UITextField;
    { Handlers }
    procedure DoneButtonTap(Sender: TObject);
  private
    class function IsNativeControl(AControl: TFmxObject): Boolean;
    class function ExtractForm(const AControl: TFmxObject): TCommonCustomForm;
    class function GetFormView(const AControl: TFmxObject): UIView;
    class function GetView(const AFocusedControl: TFmxObject): UIView;
    procedure ResetFocusAndHideKeyboard;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXVirtualKeyboardService }
    function ShowVirtualKeyboard(const AControl: TFmxObject): Boolean;
    function HideVirtualKeyboard: Boolean;
    procedure SetTransientState(Value: Boolean);
    function GetVirtualKeyboardState: TVirtualKeyboardStates;
    property VirtualKeyboardState: TVirtualKeyboardStates read GetVirtualKeyboardState;
    { IFMXVirtualKeyboardToolbarService }
    procedure SetToolbarEnabled(const Value: Boolean);
    function IsToolbarEnabled: Boolean;
    procedure SetHideKeyboardButtonVisibility(const Value: Boolean);
    function IsHideKeyboardButtonVisible: Boolean;
    function AddButton(const Title: string; AOnClick: TNotifyEvent): TVirtualKeyboardToolButton;
    procedure DeleteButton(const Index: Integer);
    function ButtonsCount: Integer;
    function GetButtonByIndex(const Index: Integer): TVirtualKeyboardToolButton;
    procedure ClearButtons;
    { IFMXVirtualKeyboardTextInputAccessoryService }
    function InputAccessoryView: UIView; cdecl;
  end;

  TiOSVKToolbarButton = class(TVirtualKeyboardToolButton)
  private
    FOwner: TiOSTextInputAccessoryToolbar;
    FIsCreating: Boolean;
  protected
    procedure DoChanged; override;
  public
    constructor Create(const AOwner: TiOSTextInputAccessoryToolbar; const ATitle: string);
  end;

  TStoredActiveForm = class(TComponent)
  private
    [Weak] FForm: TCommonCustomForm;
    procedure SetForm(const Value: TCommonCustomForm);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    property Form: TCommonCustomForm read FForm write SetForm;
  end;

procedure RegisterVirtualKeyboardServices;
var
  KeyboardService: TiOSVirtualKeyboardService;
begin
  KeyboardService := TiOSVirtualKeyboardService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXVirtualKeyboardService, KeyboardService);
  TPlatformServices.Current.AddPlatformService(IFMXVirtualKeyboardToolbarService, KeyboardService);
  TPlatformServices.Current.AddPlatformService(IFMXVirtualKeyboardTextInputAccessoryService, KeyboardService);
end;

procedure UnregisterVirtualKeyboardServices;
begin
  if TPlatformServices.Current <> nil then
  begin
    TPlatformServices.Current.RemovePlatformService(IFMXVirtualKeyboardTextInputAccessoryService);
    TPlatformServices.Current.RemovePlatformService(IFMXVirtualKeyboardToolbarService);
    TPlatformServices.Current.RemovePlatformService(IFMXVirtualKeyboardService);
  end;
end;

{ TKeyboardEventHandler }

constructor TKeyboardEventHandler.Create(const AOwner: TiOSVirtualKeyboardService);
var
  NotificationCenter: NSNotificationCenter;
begin
  Assert(AOwner <> nil);

  inherited Create;
  FOwner := AOwner;
  NotificationCenter := TNSNotificationCenter.Wrap(TNSNotificationCenter.OCClass.defaultCenter);
  NotificationCenter.addObserver(GetObjectID, sel_getUid('KeyboardWillShow:'), NSObjectToID(UIKeyboardWillShowNotification), nil);
  NotificationCenter.addObserver(GetObjectID, sel_getUid('KeyboardWillHide:'), NSObjectToID(UIKeyboardWillHideNotification), nil);
  NotificationCenter.addObserver(GetObjectID, sel_getUid('KeyboardDidHide:'), NSObjectToID(UIKeyboardDidHideNotification), nil);
  NotificationCenter.addObserver(GetObjectID, sel_getUid('KeyboardDidShow:'), NSObjectToID(UIKeyboardDidShowNotification), nil);
end;

destructor TKeyboardEventHandler.Destroy;
begin
  FOwner := nil;
  TNSNotificationCenter.Wrap(TNSNotificationCenter.OCClass.defaultCenter).removeObserver(GetObjectID);
  inherited;
end;

class function TKeyboardEventHandler.GetKeyboardRect(const Notification: Pointer): TRect;
var
  ScreenService: IFMXScreenService;
  Orientation: TScreenOrientation;
  KeyboardFrame: NSRect;
begin
  KeyboardFrame := iOSapi.UIKit.TNSValue.Wrap(TNSNotification.Wrap(Notification).userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey)).CGRectValue;

  if not TOSVersion.Check(8) then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
      Orientation := ScreenService.GetScreenOrientation
    else
      Orientation := TScreenOrientation.Portrait;

    case Orientation of
      TScreenOrientation.InvertedPortrait:
        KeyboardFrame.origin.y := Screen.Size.Height - KeyboardFrame.origin.y - KeyboardFrame.size.height;
      TScreenOrientation.InvertedLandscape:
      begin
        KeyboardFrame := InvertFrame(KeyboardFrame);
        KeyboardFrame.origin.y := Screen.Size.Height - KeyboardFrame.origin.y - KeyboardFrame.size.height;
      end;
      TScreenOrientation.Landscape:
        KeyboardFrame := InvertFrame(KeyboardFrame);
    end;
  end;

  Result := KeyboardFrame.ToRectF.Round;
end;

function TKeyboardEventHandler.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IKeyboardEvents);
end;

procedure TKeyboardEventHandler.HideVirtualKeyboard;
begin
  FOwner.ResetFocusAndHideKeyboard;
end;

class function TKeyboardEventHandler.InvertFrame(const AFrame: NSRect): NSRect;
begin
  Result.origin.x := AFrame.origin.y;
  Result.origin.y := AFrame.origin.x;
  Result.size.width := AFrame.size.height;
  Result.size.height := AFrame.size.width;
end;

procedure TKeyboardEventHandler.KeyboardDidHide(notification: Pointer);
begin
  FVisible := False;
end;

procedure TKeyboardEventHandler.KeyboardDidShow(notification: Pointer);
begin
  FVisible := True;
end;

procedure TKeyboardEventHandler.KeyboardWillHide(notification: Pointer);
var
  VKRect: TRect;
begin
  if TVirtualKeyboardState.Visible in FOwner.VirtualKeyboardState then
  begin
    VKRect := GetKeyboardRect(notification);
    if not FKeepFocus then
      HideVirtualKeyboard;
    SendNotificationAboutKeyboardEvent(VKRect, TKeyboardState.Hidden);
  end;
end;

procedure TKeyboardEventHandler.KeyboardWillShow(notification: Pointer);
var
  VKRect: TRect;
begin
  VKRect := GetKeyboardRect(notification);
  SendNotificationAboutKeyboardEvent(VKRect, TKeyboardState.Shown);
end;

procedure TKeyboardEventHandler.SendNotificationAboutKeyboardEvent(const AVKRect: TRect; const AKeyboardState: TKeyboardState);
var
  Message: TVKStateChangeMessage;
begin
  if FLastKeyboardRect <> AVKRect then
  begin
    FLastKeyboardRect := AVKRect;
    Message := TVKStateChangeMessage.Create(AKeyboardState = TKeyboardState.Shown, AVKRect);
    try
      TMessageManager.DefaultManager.SendMessage(Self, Message, True);
    except on E: Exception do
      Application.ShowException(E);
    end;
  end;
end;

{ TStoredActiveForm }

procedure TStoredActiveForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FForm) then
    FForm := nil;
end;

procedure TStoredActiveForm.SetForm(const Value: TCommonCustomForm);
begin
  if FForm <> Value then
  begin
    if FForm <> nil then
    begin
      TComponent(FForm).RemoveFreeNotification(self);
      FForm := nil;
    end;
    FForm := Value;
    if FForm <> nil then
      TComponent(FForm).FreeNotification(Self);
  end;
end;

{ TiOSVirtualKeyboardService }

function TiOSVirtualKeyboardService.AddButton(const Title: string; AOnClick: TNotifyEvent): TVirtualKeyboardToolButton;
begin
  Result := FToolbar.AddButton(Title, AOnClick);
end;

function TiOSVirtualKeyboardService.ButtonsCount: Integer;
begin
  Result := FToolbar.ButtonsCount;
end;

procedure TiOSVirtualKeyboardService.ClearButtons;
begin
  FToolbar.ClearButtons;
end;

constructor TiOSVirtualKeyboardService.Create;
begin
  inherited Create;
  FStoredActiveForm := TStoredActiveForm.Create(nil);
  FKeyboardHandler := TKeyboardEventHandler.Create(Self);
  FToolbar := TiOSTextInputAccessoryToolbar.Create;
  FToolbar.OnDone := DoneButtonTap;
  FParkingView := TUITextField.Alloc;
  FParkingView := TUITextField.Wrap(FParkingView.initWithFrame(NSRect.Create(0, 0, 0, 0)));
end;

procedure TiOSVirtualKeyboardService.DeleteButton(const Index: Integer);
begin
  FToolbar.DeleteButton(Index);
end;

destructor TiOSVirtualKeyboardService.Destroy;
begin
  FParkingView.release;
  FParkingView := nil;
  FreeAndNil(FToolbar);
  FreeAndNil(FKeyboardHandler);
  FreeAndNil(FStoredActiveForm);
  inherited;
end;

procedure TiOSVirtualKeyboardService.DoneButtonTap(Sender: TObject);
begin
  ResetFocusAndHideKeyboard;
end;

class function TiOSVirtualKeyboardService.ExtractForm(const AControl: TFmxObject): TCommonCustomForm;
var
  RootObj: TFmxObject;
begin
  if AControl = nil then
    Exit(nil);

  if AControl is TCommonCustomForm then
    Exit(TCommonCustomForm(AControl));

  RootObj := AControl.Root.GetObject;
  if RootObj is TCommonCustomForm then
    Result := TCommonCustomForm(RootObj)
  else
    Result := nil;
end;

function TiOSVirtualKeyboardService.GetButtonByIndex(const Index: Integer): TVirtualKeyboardToolButton;
begin
  Result := FToolbar.Buttons[Index];
end;

class function TiOSVirtualKeyboardService.GetFormView(const AControl: TFmxObject): UIView;
var
  Form: TCommonCustomForm;
begin
  Form := ExtractForm(AControl);

  if (Form = nil) or not Form.IsHandleAllocated then
    Result := nil
  else
    Result := WindowHandleToPlatform(Form.Handle).View;
end;

class function TiOSVirtualKeyboardService.GetView(const AFocusedControl: TFmxObject): UIView;
begin
  if IsNativeControl(AFocusedControl) then
    Result := UIView(TPresentedControl(AFocusedControl).PresentationProxy.NativeObject)
  else
    Result := GetFormView(AFocusedControl);
end;

function TiOSVirtualKeyboardService.GetVirtualKeyboardState: TVirtualKeyboardStates;
begin
  Result := [];
  if VKAutoShowMode in [TVKAutoShowMode.Always, TVKAutoShowMode.DefinedBySystem] then
    Include(Result, TVirtualKeyboardState.AutoShow);
  if FTransient then
    Include(Result, TVirtualKeyboardState.Transient);
  if FKeyboardHandler.Visible then
    Include(Result, TVirtualKeyboardState.Visible);
end;

procedure TiOSVirtualKeyboardService.SetTransientState(Value: Boolean);
begin
  FTransient := Value;
end;

function TiOSVirtualKeyboardService.InputAccessoryView: UIView;
begin
  if FToolbar.Visible and not IsPad then
    Result := FToolBar.View
  else
    Result := nil;
end;

class function TiOSVirtualKeyboardService.IsNativeControl(AControl: TFmxObject): Boolean;
var
  ControlTypeSupportable: IControlTypeSupportable;
begin
  Result := Supports(AControl, IControlTypeSupportable, ControlTypeSupportable) and
            (ControlTypeSupportable.ControlType = TControlType.Platform);
end;

function TiOSVirtualKeyboardService.IsToolbarEnabled: Boolean;
begin
  Result := FToolbar.Visible;
end;

procedure TiOSVirtualKeyboardService.ResetFocusAndHideKeyboard;
begin
  try
    Screen.ActiveForm.Focused := nil;
    HideVirtualKeyboard;
  except
    Application.HandleException(Screen.ActiveForm);
  end;
end;

procedure TiOSVirtualKeyboardService.SetHideKeyboardButtonVisibility(const Value: Boolean);
begin
  FToolbar.IsDoneButtonVisible := Value;
end;

function TiOSVirtualKeyboardService.IsHideKeyboardButtonVisible: Boolean;
begin
  Result := FToolbar.IsDoneButtonVisible;
end;

procedure TiOSVirtualKeyboardService.SetToolbarEnabled(const Value: Boolean);
begin
  FToolbar.Visible := Value;
end;

function TiOSVirtualKeyboardService.ShowVirtualKeyboard(const AControl: TFmxObject): Boolean;
var
  View: UIView;
begin
  if (AControl = nil) or (AControl.Root = nil) then
    Exit(False);

  FStoredActiveForm.Form := ExtractForm(AControl);

  View := GetView(AControl);
  if View = nil then
    Result := False
  else
  begin
    // When we switches focus between two text-input controls, we use "transient" switching mode.
    // In this mode we don't hide virtual keyboard and just change focus between native UIView.
    // However, it may not change keyboard type. We see it on some iOS versions and this behavior differs from different
    // iOS versions. UIView has special "reloadInputViews" method for reloading input. However, seems Apple doesn't
    // consider it as really use-case, when we don't really change focus. Therefore, at the moment, using an
    // intermediate hidden input field to force a change of focus helps to solve this problem and achieve the same
    // result on all versions of iOS.
    if FParkingView.superview = nil then
    begin
      SharedApplication.keyWindow.rootViewController.view.addSubview(FParkingView);
      FParkingView.setInputAccessoryView(InputAccessoryView);
    end;
    FParkingView.becomeFirstResponder;
    Result := View.becomeFirstResponder;
    View.reloadInputViews;
  end;
end;

function TiOSVirtualKeyboardService.HideVirtualKeyboard: Boolean;
begin
  if FTransient then
    Exit(False);

  FParkingView.removeFromSuperview;
  if SharedApplication.keyWindow = nil then
    Result := False
  else
  begin
    FKeyboardHandler.FKeepFocus := True;
    try
      Result := SharedApplication.keyWindow.endEditing(True);
    finally
      FKeyboardHandler.FKeepFocus := False;
    end;
  end;
end;

{ TiOSVKToolbarButton }

constructor TiOSVKToolbarButton.Create(const AOwner: TiOSTextInputAccessoryToolbar; const ATitle: string);
begin
  Assert(AOwner <> nil);

  FIsCreating := True;
  inherited Create;
  FOwner := AOwner;
  Title := ATitle;
  FIsCreating := False;
end;

procedure TiOSVKToolbarButton.DoChanged;
begin
  inherited;
  if not FIsCreating then
    FOwner.RefreshButtons;
end;

{ TiOSTextInputAccessoryToolbar }

function TiOSTextInputAccessoryToolbar.AddButton(const Title: string; const AOnClick: TNotifyEvent): TVirtualKeyboardToolButton;
begin
  Result := TiOSVKToolbarButton.Create(Self, Title);
  Result.OnExecute := AOnClick;
  FButtons.Add(Result);
  RefreshButtons;
end;

function TiOSTextInputAccessoryToolbar.GetButtonsCount: Integer;
begin
  Result := FButtons.Count;
end;

procedure TiOSTextInputAccessoryToolbar.ClearButtons;
begin
  if FButtons.Count > 0 then
  begin
    FButtons.Clear;
    RefreshButtons;
  end;
end;

constructor TiOSTextInputAccessoryToolbar.Create;
var
  ToolbarId: Pointer;
begin
  inherited;
  ToolbarId := TUIToolbar.Wrap(GetObjectID).initWithFrame(NSRect.Create(0, 0, 44, 50));
  if ToolbarId <> GetObjectID then
    UpdateObjectID(ToolbarId);

  if TOSVersion.Check(7) then
    View.setBarStyle(UIBarStyleDefault)
  else
    View.setBarStyle(UIBarStyleBlackOpaque);
  View.setAlpha(0.8);
  FToolBarButtons := TNSMutableArray.Create;
  FButtons := TList<TVirtualKeyboardToolButton>.Create;
  FVisible := True;
  FIsDoneButtonVisible := True;
  RefreshButtons;
end;

procedure TiOSTextInputAccessoryToolbar.DeleteButton(const Index: Integer);
begin
  if InRange(Index, 0, FButtons.Count - 1) then
  begin
    FButtons.Delete(Index);
    RefreshButtons;
  end;
end;

destructor TiOSTextInputAccessoryToolbar.Destroy;
begin
  FFlexibleSepararator := nil;
  FDoneButton := nil;
  FreeAndNil(FButtons);
  ReleaseObjectsInArray(FToolBarButtons);
  FToolBarButtons.release;
  inherited;
end;

procedure TiOSTextInputAccessoryToolbar.DoDone;
begin
  if Assigned(FOnDone) then
    FOnDone(Self);
end;

function TiOSTextInputAccessoryToolbar.GetButton(const AIndex: Integer): TVirtualKeyboardToolButton;
begin
  if InRange(AIndex, 0, FButtons.Count - 1) then
    Result := FButtons[AIndex]
  else
    Result := nil;
end;

function TiOSTextInputAccessoryToolbar.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IFMXTextInputAccessoryToolbar);
end;

function TiOSTextInputAccessoryToolbar.GetView: UIToolbar;
begin
  Result := UIToolBar(Super);
end;

procedure TiOSTextInputAccessoryToolbar.onButtonTap(sender: Pointer);
var
  Index: Integer;
begin
  Index := TUIBarButtonItem.Wrap(sender).tag - 1;
  if Index >= 0 then
    FButtons[Index].DoExecute;
end;

procedure TiOSTextInputAccessoryToolbar.onDoneTap(sender: Pointer);
begin
  DoDone;
end;

procedure TiOSTextInputAccessoryToolbar.RefreshButtons;

  function CreateBatButtonItem(const ATitle: string; const AStyle: UIBarButtonItemStyle; const AAction: PAnsiChar): UIBarButtonItem;
  begin
    Result := TUIBarButtonItem.Alloc;
    Result := TUIBarButtonItem.Wrap(Result.initWithTitle(StrToNSStr(Translate(ATitle)), AStyle, GetObjectID, sel_getUid(AAction)));
  end;

var
  I: Integer;
  B: UIBarButtonItem;
begin
  ReleaseObjectsInArray(FToolBarButtons);

  if View.items <> nil then
  begin
    View.setItems(nil);
    FFlexibleSepararator := nil;
    FDoneButton := nil;
  end;

  FToolBarButtons.removeAllObjects;

  // Adding Custom buttons
  for I := 0 to FButtons.Count - 1 do
  begin
    B := CreateBatButtonItem(FButtons[I].Title, UIBarButtonItemStyleBordered, 'onButtonTap:');
    B.setTag(I + 1);
    FToolBarButtons.addObject(NSObjectToID(B));
  end;

  if FIsDoneButtonVisible then
  begin
    //Separator
    if FFlexibleSepararator = nil then
    begin
      FFlexibleSepararator := TUIBarButtonItem.Alloc;
      FFlexibleSepararator.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, nil, nil);
    end;
    FToolBarButtons.addObject(NSObjectToID(FFlexibleSepararator));

    //Hide button
    if FDoneButton = nil then
      FDoneButton := CreateBatButtonItem(SEditorDone, UIBarButtonItemStyleDone, 'onDoneTap:');
    FToolBarButtons.addObject(NSObjectToID(FDoneButton));
  end;

  View.setItems(FToolBarButtons);
  View.sizeToFit;
end;

class procedure TiOSTextInputAccessoryToolbar.ReleaseObjectsInArray(const AObjectArray: NSArray);
var
  ObjectsCount: Integer;
  I: Integer;
  Obj: NSObject;
begin
  ObjectsCount := AObjectArray.count;
  for I := 0 to ObjectsCount - 1 do
  begin
    Obj := TNSObject.Wrap(AObjectArray.objectAtIndex(I));
    Obj.release;
  end;
end;

procedure TiOSTextInputAccessoryToolbar.SetIsDoneButtonVisible(const Value: Boolean);
begin
  if FIsDoneButtonVisible <> Value then
  begin
    FIsDoneButtonVisible := Value;
    RefreshButtons;
  end;
end;

procedure TiOSTextInputAccessoryToolbar.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    View.setHidden(not FVisible);
  end;
end;

initialization
  RegisterVirtualKeyboardServices;
finalization
  UnregisterVirtualKeyboardServices;
end.
