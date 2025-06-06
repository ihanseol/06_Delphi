{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Forms;

{$MINENUMSIZE 4}
{$H+}

{$IFDEF WIN32}
{$HPPEMIT '#pragma link "d3d10.lib"'}
{$HPPEMIT '#pragma link "d3d10_1.lib"'}
{$HPPEMIT '#pragma link "dxgi.lib"'}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$HPPEMIT '#pragma comment(lib, "D3D11")'}
{$ENDIF}
(*$HPPEMIT '#if defined(WIN32) && defined(CreateWindow)'*)
(*$HPPEMIT '  #define __SAVE_CREATEWINDOW CreateWindow'*)
(*$HPPEMIT '  #undef  CreateWindow'*)
(*$HPPEMIT '#endif'*)

(*$HPPEMIT END '#if defined(__SAVE_CREATEWINDOW)'*)
(*$HPPEMIT END '  #define CreateWindow __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '  #undef  __SAVE_CREATEWINDOW'*)
(*$HPPEMIT END '#endif'*)

interface

{$SCOPEDENUMS ON}

uses
{$IFDEF MSWINDOWS}
  Winapi.Messages,
{$ENDIF}
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.Messaging, System.Generics.Collections,
  System.Analytics, FMX.Types, FMX.ActnList, FMX.Controls, FMX.Graphics;

const
  // This value indicates that the auto-update action will not be performed.
  ActionUpdateDelayNever: Integer = -1;
  DefaultFormStyleLookup = 'backgroundstyle';

type
  TCommonCustomForm = class;

  { Application }

  TExceptionEvent = procedure(Sender: TObject; E: Exception) of object;
  TIdleEvent = procedure(Sender: TObject; var Done: Boolean) of object;

  TDeviceKind = (Desktop, iPhone, iPad);
  TDeviceKinds = set of TDeviceKind;

  TFormOrientations = TScreenOrientations;
  TFormOrientation = TScreenOrientation;

  TFormFactor = class(TPersistent)
  private
    FSize: TSize;
    FOrientations: TFormOrientations;
    FDevices: TDeviceKinds;
    procedure SetSupportedOrientations(AOrientations: TFormOrientations); virtual;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    function GetWidth: Integer;
    function GetHeight: Integer;
  public
    constructor Create;
    procedure AdjustToScreenSize;
  published
    property Width: Integer read GetWidth write SetWidth stored True;
    property Height: Integer read GetHeight write SetHeight stored True;
    property Orientations: TFormOrientations read FOrientations write SetSupportedOrientations stored True
      default [TFormOrientation.Portrait, TFormOrientation.Landscape];
    property Devices: TDeviceKinds read FDevices write FDevices stored True;
  end;

  TApplicationFormFactor = class(TFormFactor)
  protected
    procedure SetSupportedOrientations(AOrientations: TFormOrientations); override;
  end;

{$IFDEF MSWINDOWS}
  /// <summary>IDesignerHook is an interface that allows component writers to
  /// interact with the form designer in the IDE.</summary>
  IDesignerHook = interface(IDesignerNotify)
  ['{65A688CA-60DD-4038-AAFF-8F56A8B6AB69}']
    function IsDesignMsg(Sender: TFmxObject; var Message: Winapi.Messages.TMessage): Boolean;
    procedure UpdateBorder;
    procedure PaintGrid;
    procedure DrawSelectionMarks(AControl: TFMXObject);
    function IsSelected(Instance: TPersistent): Boolean;
    function IsView: Boolean;
    function GetHasFixedSize: Boolean;
    procedure DesignerModified(Activate: Boolean = False);
    procedure ValidateRename(AComponent: TComponent; const CurName, NewName: string);
    function UniqueName(const BaseName: string): string;
    function GetRoot: TComponent;
    procedure FormFamilyChanged(const OldFormFamilyName, NewFormFamilyName, FormClassName: string);
    procedure SelectComponent(Instance: TPersistent);
    /// <summary>Called after the form has been completely painted, so additional painting can be performed on top on it</summary>
    procedure Decorate(Context: TObject);

    property HasFixedSize: Boolean read GetHasFixedSize;
  end;

  /// <summary>Deprecated, only kept for backwards compatibility</summary>
  IDesignerStorage = interface
  ['{ACCC9241-07E2-421B-8F4C-B70D1E4050AE}']
    function GetDesignerMobile: Boolean;
    function GetDesignerWidth: Integer;
    function GetDesignerHeight: Integer;
    function GetDesignerDeviceName: string;
    function GetDesignerOrientation: TFormOrientation;
    function GetDesignerOSVersion: string;
    function GetDesignerMasterStyle: Integer;
    procedure SetDesignerMasterStyle(Value: Integer);

    property Mobile: Boolean read GetDesignerMobile;
    property Width: Integer read GetDesignerWidth;
    property Height: Integer read GetDesignerHeight;
    property DeviceName: string read GetDesignerDeviceName;
    property Orientation: TFormOrientation read GetDesignerOrientation;
    property OSVersion: string read GetDesignerOSVersion;
    property MasterStyle: Integer read GetDesignerMasterStyle write SetDesignerMasterStyle;
  end;
{$ELSE}
  IDesignerHook = interface
  end;
  IDesignerStorage = interface
  end;
{$ENDIF}

  { TApplication }

  TApplicationState = (None, Running, Terminating, Terminated);
  /// <summary>Notification about terminating application</summary>
  TApplicationTerminatingMessage = class(System.Messaging.TMessage);

  TApplicationStateEvent = function: TApplicationState;

  TFormsCreatedMessage = class(System.Messaging.TMessage);
  /// <summary>Notification about showing form</summary>
  TFormBeforeShownMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  /// <summary>Notification about activating specified form</summary>
  TFormActivateMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  /// <summary>Notification about deactivating specified form</summary>
  TFormDeactivateMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  TFormReleasedMessage = class(System.Messaging.TMessage);

  TApplication = class(TComponent)
  private type
    TFormRegistryItem = class
    public
      InstanceClass: TComponentClass;
      Instance: TComponent;
      Reference: Pointer;
    end;
    TFormRegistryItems = TList<TFormRegistryItem>;
    TFormRegistry = TObjectDictionary<String,TFormRegistryItems>;
  private
    FOnException: TExceptionEvent;
    FTerminate: Boolean;
    FOnIdle: TIdleEvent;
    FDefaultTitleReceived: Boolean;
    FDefaultTitle: string;
    FMainForm: TCommonCustomForm;
    FCreateForms: array of TFormRegistryItem;
    FBiDiMode: TBiDiMode;
    FTimerActionHandle: TFmxHandle;
    FActionUpdateDelay: Integer;
    FActionClientsList: TList<TComponent>;
    FOnActionUpdate: TActionEvent;
    FIdleDone: Boolean;
    FIsRealCreateFormsCalled: Boolean;
    FFormFactor: TApplicationFormFactor;
    FFormRegistry: TFormRegistry;
    FMainFormFamily: string;
    FLastKeyPress: TDateTime;
    FLastUserActive: TDateTime;
    FIdleMessage: TIdleMessage;
    FOnActionExecute: TActionEvent;
    FApplicationStateQuery: TApplicationStateEvent;
    FAnalyticsManager: TAnalyticsManager;
    FHint: string;
    FShowHint: Boolean;
    FOnHint: TNotifyEvent;
    FSharedHint: THint;
    FIsControlHint: Boolean;
    FHintShortCuts: Boolean;
    FTimerService: IFMXTimerService;
    procedure Idle;
    procedure DoUpdateActions;
    procedure UpdateActionTimerProc;
    function GetFormRegistryItem(const FormFamily: string; const FormFactor: TFormFactor): TFormRegistryItem;
    function GetDefaultTitle: string;
    function GetTitle: string;
    procedure SetTitle(const Value: string);
    procedure SetMainForm(const Value: TCommonCustomForm);
    function GetAnalyticsManager: TAnalyticsManager;
    procedure SetShowHint(const AValue: Boolean);
    procedure SetHint(const AHint: string);
    procedure SetHintShortCuts(const Value: Boolean);
    function GetTimerService: IFMXTimerService;
    property TimerService: IFMXTimerService read GetTimerService;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FormDestroyed(const AForm: TCommonCustomForm);
    procedure RealCreateForms;
    procedure CreateForm(const InstanceClass: TComponentClass; var Reference);
    procedure CreateMainForm;
    procedure RegisterFormFamily(const AFormFamily: string; const AForms: array of TComponentClass);
    procedure ProcessMessages;
    property LastKeyPress: TDateTime read FLastKeyPress;
    property LastUserActive: TDateTime read FLastUserActive;
    procedure DoIdle(var Done: Boolean);
    function HandleMessage: Boolean;
    procedure Run;
    function Terminate: Boolean;
    procedure Initialize;
    /// <summary> Perform method <b>TComponent.ExecuteAction</b> for current active control or active form or
    /// <b>Application</b></summary>
    /// <returns> <c>True</c> if the method <b>ExecuteTarget</b> of <b>Action</b> was performed</returns>
    /// <remarks> This method is analogous to the CM_ACTIONEXECUTE handler's in VCL </remarks>
    function ActionExecuteTarget(Action: TBasicAction): Boolean;
    function ExecuteAction(Action: TBasicAction): Boolean; reintroduce;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    ///  <summary>Provides a mechanism for checking if application analytics has been enabled without accessing the
    ///  AnalyticsManager property (which will create an instance of an application manager if one does not already
    ///  exist). Returns True if an instance of TAnalyticsManager is assigned to the application. Returns False
    ///  otherwise.</summary>
    function TrackActivity: Boolean;
    property ActionUpdateDelay: Integer read FActionUpdateDelay write FActionUpdateDelay;
    procedure HandleException(Sender: TObject);
    procedure ShowException(E: Exception);
    /// <summary>Cancels the display of a hint for a control.</summary>
    procedure CancelHint;
    /// <summary>Hides the current hint.</summary>
    procedure HideHint;
    /// <summary>Determines whether Help Hints are enabled or disabled for the entire application.</summary>
    property ShowHint: Boolean read FShowHint write SetShowHint;
    /// <summary>Occurs when the mouse pointer moves over a control or menu item that can display a Help Hint.</summary>
    property OnHint: TNotifyEvent read FOnHint write FOnHint;
    property BiDiMode: TBiDiMode read FBiDiMode write FBiDiMode default bdLeftToRight;
    property Terminated: Boolean read FTerminate write FTerminate;
    property OnIdle: TIdleEvent read FOnIdle write FOnIdle;
    property MainForm: TCommonCustomForm read FMainForm write SetMainForm;
    property Title: string read GetTitle write SetTitle;
    property DefaultTitle: string read GetDefaultTitle;
    property OnActionExecute: TActionEvent read FOnActionExecute write FOnActionExecute;
    property OnActionUpdate: TActionEvent read FOnActionUpdate write FOnActionUpdate;
    property OnException: TExceptionEvent read FOnException write FOnException;
    property ApplicationStateQuery: TApplicationStateEvent read FApplicationStateQuery write FApplicationStateQuery;
    /// <summary>Returns true if RealCreateForms was invoked; otherwise, false.</summary>
    property IsRealCreateFormsCalled: Boolean read FIsRealCreateFormsCalled;

    procedure RegisterActionClient(const ActionClient: TComponent);
    procedure UnregisterActionClient(const ActionClient: TComponent);
    function GetActionClients: TEnumerable<TComponent>;
    function GetDeviceForm(const FormFamily: string; const FormFactor: TFormFactor): TCommonCustomForm; overload;
    function GetDeviceForm(const FormFamily: string): TCommonCustomForm; overload;
    procedure OverrideScreenSize(W, H: Integer);
    property FormFactor: TApplicationFormFactor read FFormFactor;
    /// <summary>Returns an instance of TAnalyticsManager. An instance will be created if one does not already exist.
    /// There should only be one AnalyticsManager per application.</summary>
    property AnalyticsManager: TAnalyticsManager read GetAnalyticsManager;
    /// <summary>Specifies the text string that appears in the Help Hint box.</summary>
    property Hint: string read FHint write SetHint;
    /// <summary>Enables the display of keyboard shortcuts.</summary>
    property HintShortCuts: Boolean read FHintShortCuts write SetHintShortCuts;
  end;

  /// <summary>Links an action object to a client (generic form).</summary>
  TFormActionLink = class(FMX.ActnList.TActionLink)
  private
    FForm: TCommonCustomForm;
    function ActionCustomViewComponent: Boolean;
  protected
    property Form: TCommonCustomForm read FForm;
    procedure AssignClient(AClient: TObject); override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsGroupIndexLinked: Boolean; override;
    function IsHelpLinked: Boolean;  override;
    function IsHintLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
    function IsOnExecuteLinked: Boolean; override;
    procedure SetVisible(Value: Boolean); override;
  end;

  { Forms }

  TCloseEvent = procedure(Sender: TObject; var Action: TCloseAction) of object;
  TCloseQueryEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;

  TFmxFormBorderStyle = (None, Single, Sizeable, ToolWindow, SizeToolWin);

  TFmxFormState = (Recreating, Modal, Released, InDesigner, WasNotShown, Showing, UpdateBorder, Activation, Closing,
    Engaged);

  TFmxFormStates = set of TFmxFormState;

  TFormPosition = (Designed, Default, DefaultPosOnly, DefaultSizeOnly, ScreenCenter, DesktopCenter, MainFormCenter, OwnerFormCenter);

  IFMXWindowService = interface(IInterface)
    ['{26C42398-9AFC-4D09-9541-9C71E769FC35}']
    function FindForm(const AHandle: TWindowHandle): TCommonCustomForm;
    function CreateWindow(const AForm: TCommonCustomForm): TWindowHandle;
    procedure DestroyWindow(const AForm: TCommonCustomForm);
    procedure ReleaseWindow(const AForm: TCommonCustomForm);
    procedure SetWindowState(const AForm: TCommonCustomForm; const AState: TWindowState);
    procedure ShowWindow(const AForm: TCommonCustomForm);
    procedure HideWindow(const AForm: TCommonCustomForm);
    function ShowWindowModal(const AForm: TCommonCustomForm): TModalResult;
    procedure InvalidateWindowRect(const AForm: TCommonCustomForm; R: TRectF);
    procedure InvalidateImmediately(const AForm: TCommonCustomForm);
    procedure SetWindowRect(const AForm: TCommonCustomForm; ARect: TRectF);
    function GetWindowRect(const AForm: TCommonCustomForm): TRectF;
    function GetClientSize(const AForm: TCommonCustomForm): TPointF;
    procedure SetClientSize(const AForm: TCommonCustomForm; const ASize: TPointF);
    procedure SetWindowCaption(const AForm: TCommonCustomForm; const ACaption: string);
    procedure SetCapture(const AForm: TCommonCustomForm);
    procedure ReleaseCapture(const AForm: TCommonCustomForm);
    function ClientToScreen(const AForm: TCommonCustomForm; const AFormPoint: TPointF): TPointF;
    function ScreenToClient(const AForm: TCommonCustomForm; const AScreenPoint: TPointF): TPointF;
    procedure BringToFront(const AForm: TCommonCustomForm);
    procedure SendToBack(const AForm: TCommonCustomForm);
    procedure Activate(const AForm: TCommonCustomForm);
    function GetWindowScale(const AForm: TCommonCustomForm): Single; deprecated; // Use THandle.Scale instead
    function CanShowModal: Boolean;
  end;

  /// <summary>A service for working with form size constraints.</summary>
  IFMXWindowConstraintsService = interface
  ['{030E519F-3D99-422C-9978-798EA04AF14B}']
    procedure SetConstraints(const AForm: TCommonCustomForm; const AMinWidth, AMinHeight, AMaxWidth, AMaxHeight: Single);
  end;

  IFMXFullScreenWindowService = interface(IInterface)
  ['{103EB4B7-E899-4684-8174-2EEEE24F1E58}']
    procedure SetFullScreen(const AForm: TCommonCustomForm; const AValue: Boolean);
    function GetFullScreen(const AForm: TCommonCustomForm): Boolean;
    procedure SetShowFullScreenIcon(const AForm: TCommonCustomForm; const AValue: Boolean);
  end;

  TWindowBorder = class(TFmxObject)
  private
    [Weak] FForm: TCommonCustomForm;
  protected
    function GetSupported: Boolean; virtual; abstract;
    procedure Resize; virtual; abstract;
    procedure Activate; virtual; abstract;
    procedure Deactivate; virtual; abstract;
    /// <summary>Notifies when form changed style.</summary>
    procedure StyleChanged; virtual; abstract;
    procedure ScaleChanged; virtual; abstract;
    procedure EnableChanged; virtual;
  public
    constructor Create(const AForm: TCommonCustomForm); reintroduce; virtual;
    property Form: TCommonCustomForm read FForm;
    property IsSupported: Boolean read GetSupported;
  end;

  IFMXWindowBorderService = interface(IInterface)
  ['{F3FC3133-CEF0-446F-B3C6-7820989DDFC6}']
    function CreateWindowBorder(const AForm: TCommonCustomForm): TWindowBorder;
  end;

  TFormBorder = class(TPersistent)
  private
    FWindowBorder: TWindowBorder;
    [Weak] FForm: TCommonCustomForm;
    FStyling: Boolean;
    procedure SetStyling(const Value: Boolean);
  protected
    function GetSupported: Boolean;
    procedure Recreate;
    procedure EnableChanged;
  public
    constructor Create(const AForm: TCommonCustomForm);
    destructor Destroy; override;
    procedure StyleChanged;
    procedure ScaleChanged;
    procedure Resize;
    procedure Activate;
    procedure Deactivate;
    property WindowBorder: TWindowBorder read FWindowBorder;
    property IsSupported: Boolean read GetSupported;
  published
    property Styling: Boolean read FStyling write SetStyling default True;
  end;

  TVKStateChangeMessage = class(System.Messaging.TMessage)
  private
    FKeyboardShown: Boolean;
    FBounds: TRect;
  public
    constructor Create(AKeyboardShown: Boolean; const Bounds: TRect);
    property KeyboardVisible: Boolean read FKeyboardShown;
    property KeyboardBounds: TRect read FBounds;
  end;

  TScaleChangedMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  TMainCaptionChangedMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  TMainFormChangedMessage = class(System.Messaging.TMessage<TCommonCustomForm>);
  /// <summary>Notification about destoying real form</summary>
  TBeforeDestroyFormHandle = class(System.Messaging.TMessage<TCommonCustomForm>);
  /// <summary>Notification about creating real form</summary>
  TAfterCreateFormHandle = class(System.Messaging.TMessage<TCommonCustomForm>);
  TOrientationChangedMessage = class(System.Messaging.TMessage);
  TSizeChangedMessage = class(System.Messaging.TMessage<TSize>);
  TSaveStateMessage = class(System.Messaging.TMessage);
  /// <summary>Notification about changing focus control.</summary>
  TFormChangingFocusControl = class(System.Messaging.TMessage)
  public
    /// <summary>Previous focused control.</summary>
    [Weak] PreviousFocusedControl: IControl;
    /// <summary>New control, which are going to have focus.</summary>
    [Weak] NewFocusedControl: IControl;
    /// <summary>Does focus changing finished? True - <c>NewFocusedControl</c> received focus, False - otherwise.</summary>
    IsChanged: Boolean;
    constructor Create(const APreviousFocusedControl: IControl; const ANewFocusedControl: IControl; const AIsChanged: Boolean);
  end;

  TFormSaveState = class
  strict private const
    UniqueNameSeparator = '_';
    UniqueNamePrefix = 'FM';
    UniqueNameExtension = '.TMP';
  strict private
    [Weak] FOwner: TCommonCustomForm;
    FStream: TMemoryStream;
    FName: string;
    procedure UpdateFromSaveState;
    function GetStream: TMemoryStream;
    function GenerateUniqueName: string;
  private
    procedure UpdateToSaveState;
    function GetStoragePath: string;
    procedure SetStoragePath(const AValue: string);
  protected
    function GetUniqueName: string;
  public
    constructor Create(const AOwner: TCommonCustomForm);
    destructor Destroy; override;
    property Owner: TCommonCustomForm read FOwner;
    property Stream: TMemoryStream read GetStream;
    property Name: string read FName write FName;
    property StoragePath: string read GetStoragePath write SetStoragePath;
  end;

{ TCommonCustomForm }

  TWindowStyle = (GPUSurface);

  TWindowStyles = set of TWindowStyle;

  /// <summary>Settings of system status bar</summary>
  TFormSystemStatusBar = class(TPersistent)
  public type
    TVisibilityMode = (Visible, Invisible, VisibleAndOverlap);
  public const
    DefaultBackgroundColor = TAlphaColorRec.Null;
    DefaultVisibility = TVisibilityMode.Visible;
  private
    [Weak] FForm: TCommonCustomForm;
    FBackgroundColor: TAlphaColor;
    FVisibility: TVisibilityMode;
    procedure SetBackgroundColor(const Value: TAlphaColor);
    procedure SetVisibility(const Value: TVisibilityMode);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(const AForm: TCommonCustomForm);
  published
    /// <summary>Background color of system status bar</summary>
    property BackgroundColor: TAlphaColor read FBackgroundColor write SetBackgroundColor default DefaultBackgroundColor;
    /// <summary>Different modes of showing system status bar</summary>
    property Visibility: TVisibilityMode read FVisibility write SetVisibility default DefaultVisibility;
  end;

  /// <summary>Service for working with native system status bar</summary>
  IFMXWindowSystemStatusBarService = interface(IInterface)
  ['{06258F45-98C5-4F8F-9A77-01F2BD892A5B}']
    /// <summary>Sets background color of system status bar</summary>
    procedure SetBackgroundColor(const AForm: TCommonCustomForm; const AColor: TAlphaColor);
    /// <summary>Sets how system status bar will be shown. See TVisibilityMode</summary>
    procedure SetVisibility(const AForm: TCommonCustomForm; const AMode: TFormSystemStatusBar.TVisibilityMode);
  end;

  /// <summary>
  ///   The service is designed to position the form on the screen depending on the selected position mode.
  /// </summary>
  /// <remarks>You can use the default implementation, see the class <c>TDefaultFormPositioner</c>.</remarks>
  IFMXFormPositionerService = interface
  ['{7624844E-3F50-4C51-A742-BA1379EB7D5F}']
    procedure PlaceOnScreen(const AForm: TCommonCustomForm; const APosition: TFormPosition);
  end;

  /// <summary>
  ///   The default implementation of <c>IFMXFormPositionerService</c> for all platforms. It uses Density-Independent
  ///   Pixel for calculation positions.
  /// </summary>
  TDefaultFormPositionerService = class(TInterfacedObject, IFMXFormPositionerService)
  protected
    class function FitInRect(const AValue: TRectF; const AMaxRect: TRectF): TRectF;
    function GetOwnerForm(const AForm: TCommonCustomForm): TCommonCustomForm;
    function GetMainForm(const AForm: TCommonCustomForm): TCommonCustomForm;
    function DefineTargetPosition(const AForm: TCommonCustomForm; const APosition: TFormPosition): TFormPosition;
    { Alignment }
    procedure PlaceDesigned(const AForm: TCommonCustomForm); virtual;
    procedure PlaceDefaultPosOnly(const AForm: TCommonCustomForm); virtual;
    procedure PlaceDefaultSizeOnly(const AForm: TCommonCustomForm); virtual;
    procedure PlaceScreenCenter(const AForm: TCommonCustomForm); virtual;
    procedure PlaceDesktopCenter(const AForm: TCommonCustomForm); virtual;
    procedure PlaceMainFormCenter(const AForm: TCommonCustomForm); virtual;
    procedure PlaceOwnerFormCenter(const AForm: TCommonCustomForm); virtual;
  public
    class procedure PlaceByDefault(const AForm: TCommonCustomForm; const APosition: TFormPosition);

    { IFMXFormPositionerService }
    procedure PlaceOnScreen(const AForm: TCommonCustomForm; const APosition: TFormPosition);
  end;

  TConstraintSize = Single;

  TSizeConstraints = class(TPersistent)
  private type
    TDimension = (MaxHeight, MaxWidth, MinHeight, MinWidth);
  private
    FOwner: TComponent;
    FMaxHeight: TConstraintSize;
    FMaxWidth: TConstraintSize;
    FMinHeight: TConstraintSize;
    FMinWidth: TConstraintSize;
    FOnChange: TNotifyEvent;
    procedure SetConstraints(const Index: TDimension; Value: TConstraintSize);
    function GetMaxSize: TSizeF;
    function GetMinSize: TSizeF;
    function IsValueStored(const Index: TDimension): Boolean;
  protected
    procedure Change; virtual;
    procedure AssignTo(Dest: TPersistent); override;
    function GetOwner: TPersistent; override;
  public
    constructor Create(const AOwner: TComponent); virtual;
    property MinSize: TSizeF read GetMinSize;
    property MaxSize: TSizeF read GetMaxSize;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property MaxHeight: TConstraintSize index TDimension.MaxHeight read FMaxHeight write SetConstraints stored IsValueStored nodefault;
    property MaxWidth: TConstraintSize index TDimension.MaxWidth read FMaxWidth write SetConstraints stored IsValueStored nodefault;
    property MinHeight: TConstraintSize index TDimension.MinHeight read FMinHeight write SetConstraints stored IsValueStored nodefault;
    property MinWidth: TConstraintSize index TDimension.MinWidth read FMinWidth write SetConstraints stored IsValueStored nodefault;
  end;

  TConstrainedResizeEvent = procedure(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Single) of object;

  TCommonCustomForm = class(TFmxObject, IRoot, IContainerObject, IAlignRoot, IPaintControl, IStyleBookOwner,
    IDesignerStorage, IOriginalContainerSize, ITabStopController, IGestureControl, IMultiTouch,
    ICaption, IHintRegistry, IFlipContainer)
  private type
    THandleState = (Normal, NeedRecreate, Changed);
    TBoundChange = (Location, Size);
    TBoundChanges = set of TBoundChange;
  private
    FDesigner: IDesignerHook;
    FCaption: string;
    { Size and Position }
    FBounds: TRectF; // dp
    FBoundChanges: TBoundChanges;
    FDefaultWindowRect: TRectF; // dp
    FDefaultClientSize: TSizeF; // dp
    FConstraints: TSizeConstraints; // dp
    FPosition: TFormPosition;
    FTransparency: Boolean;
    FHandle: TWindowHandle;
    FContextHandle: THandle;
    FBorderStyle: TFmxFormBorderStyle;
    FBorderIcons: TBorderIcons;
    FVisible: Boolean;
    FExplicitVisible: Boolean;
    FModalResult: TModalResult;
    FFormState: TFmxFormStates;
    FBiDiMode: TBiDiMode;
    FActive: Boolean;
    FTarget: IControl;
    FHovered, FCaptured, FFocused: IControl;
    FMousePos, FDownPos, FResizeSize, FDownSize: TPointF;
    FDragging, FResizing: Boolean;
    FCursor: TCursor;
    FWindowState: TWindowState;
    FShowFullScreenIcon : Boolean;
    FFullScreen : Boolean;
    FPadding: TBounds;
    FFormFactor : TFormFactor;
    FFormFamily : string;
    FOldActiveForm: TCommonCustomForm;
    FChangingFocusGuard: Boolean;
    FBorder: TFormBorder;
    FStateChangeMessageId: TMessageSubscriptionId;
    FOnClose: TCloseEvent;
    FOnCloseQuery: TCloseQueryEvent;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnResize: TNotifyEvent;
    FOnConstrainedResize: TConstrainedResizeEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseWheel: TMouseWheelEvent;
    FOnKeyDown: TKeyEvent;
    FOnKeyUp: TKeyEvent;
    FOnShow: TNotifyEvent;
    FOnHide: TNotifyEvent;
    FOnFocusChanged: TNotifyEvent;
    FOnVirtualKeyboardShown: TVirtualKeyboardEvent;
    FOnVirtualKeyboardHidden: TVirtualKeyboardEvent;
    FOnTap: TTapEvent;
    FOnTouch: TTouchEvent;
    [Weak] FStyleBook: TStyleBook;
    FScaleChangedId: TMessageSubscriptionId;
    FStyleChangedId: TMessageSubscriptionId;
    FStyleBookChanged: Boolean;
    FPreloadedBorderStyling: Boolean;
    FOriginalContainerSize: TPointF;
    [Weak] FMainMenu: TComponent;
    FMainMenuNative: INativeControl;
    FFormStyle: TFormStyle;
    [Weak] FParentForm: TCommonCustomForm;
    FHandleState: THandleState;
    FGestureRecognizers: array [TInteractiveGesture] of Integer;
    FResultProc: TProc<TModalResult>;
    FTabList: TTabList;
    FTouchManager: TTouchManager;
    FOnGesture: TGestureEvent;
    FOnSaveState: TNotifyEvent;
    FSaveState: TFormSaveState;
    FSaveStateMessageId: TMessageSubscriptionId;
    FEngageCount: Integer;
    FSharedHint: THint;
    FLastHinted: IControl;
    FHintReceiverList: TList<IHintReceiver>;
    FHint: string;
    FShowHint: Boolean;
    FSystemStatusBar: TFormSystemStatusBar;
    {$IFDEF MSWINDOWS}
    FDesignerDeviceName: string;
    FDesignerMasterStyle: Integer;
    function GetDesignerMobile: Boolean;
    function GetDesignerWidth: Integer;
    function GetDesignerHeight: Integer;
    function GetDesignerDeviceName: string;
    function GetDesignerOrientation: TFormOrientation;
    function GetDesignerOSVersion: string;
    function GetDesignerMasterStyle: Integer;
    procedure SetDesignerMasterStyle(Value: Integer);
    {$ENDIF}
    procedure ReadDesignerMobile(Reader: TReader);
    procedure ReadDesignerWidth(Reader: TReader);
    procedure ReadDesignerHeight(Reader: TReader);
    procedure ReadDesignerDeviceName(Reader: TReader);
    procedure ReadDesignerOrientation(Reader: TReader);
    procedure ReadDesignerOSVersion(Reader: TReader);
    procedure ReadDesignerMasterStyle(Reader: TReader);
    procedure WriteDesignerMasterStyle(Writer: TWriter);
    procedure SetDesigner(const ADesigner: IDesignerHook);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetHeight(const Value: Integer);
    function GetHeight: Integer;
    procedure SetWidth(const Value: Integer);
    function GetWidth: Integer;
    procedure SetCaption(const Value: string);
    function GetClientHeight: Integer;
    function GetClientWidth: Integer;
    procedure SetBorderStyle(const Value: TFmxFormBorderStyle);
    procedure SetBorderIcons(const Value: TBorderIcons);
    procedure SetVisible(const Value: Boolean);
    procedure SetClientHeight(const Value: Integer);
    procedure SetClientWidth(const Value: Integer);
    procedure SetBiDiMode(const Value: TBiDiMode);
    procedure SetCursor(const Value: TCursor);
    procedure SetPosition(const Value: TFormPosition);
    procedure SetWindowState(const Value: TWindowState);
    function GetLeft: Integer;
    function GetTop: Integer;
    procedure ShowCaret(const Control: IControl);
    procedure HideCaret(const Control: IControl);
    procedure AdvanceTabFocus(const MoveForward: Boolean);
    procedure SaveStateHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
    function GetFullScreen: Boolean;
    procedure SetFullScreen(const AValue: Boolean);
    function GetShowFullScreenIcon: Boolean;
    procedure SetShowFullScreenIcon(const AValue: Boolean);
    procedure PreloadProperties;
    procedure SetPadding(const Value: TBounds);
    function GetOriginalContainerSize: TPointF;
    procedure SetBorder(const Value: TFormBorder);
    function FullScreenSupported: Boolean;
    procedure SetFormStyle(const Value: TFormStyle);
    procedure ReadTopMost(Reader: TReader);
    function ParentFormOfIControl(Value: IControl): TCommonCustomForm;
    function CanTransparency: Boolean;
    function CanFormStyle(const NewValue: TFormStyle): TFormStyle;
    procedure ReadShowActivated(Reader: TReader);
    procedure DesignerUpdateBorder;
    procedure ReadStaysOpen(Reader: TReader);
    function SetMainMenu(Value: TComponent): Boolean;
    procedure SetSystemStatusBar(const Value: TFormSystemStatusBar);
    function GetVisible: Boolean;
    procedure SetModalResult(Value: TModalResult);
    procedure CreateTouchManagerIfRequired;
    function GetTouchManager: TTouchManager;
    procedure SetTouchManager(const Value: TTouchManager);
    function GetSaveState: TFormSaveState;
    function SharedHint: THint;
    procedure ReleaseLastHinted;
    procedure SetLastHinted(const AControl: IControl);
    { ICaption }
    procedure ICaption.SetText = SetCaption;
    function GetText: string;
    function ICaption.TextStored = CaptionStore;
    procedure ClearFocusedControl(const IgnoreExceptions: Boolean = False);
    procedure SetFocusedControl(const NewFocused: IControl);
    procedure FocusedControlExited;
    procedure FocusedControlEntered;
    procedure TriggerFormHint;
    procedure TriggerControlHint(const AControl: IControl);
    procedure SetShowHint(const Value: Boolean);
    { interactive gesture recognizers }
    procedure RestoreGesturesRecognizer;
    { Constraints }
    procedure SetConstraints(const Value: TSizeConstraints);
    procedure ConstraintsChanged(Sender: TObject);
  protected
    FActiveControl: IControl;
    FUpdating: Integer;
    FLastWidth, FLastHeight: single;
    FDisableAlign: Boolean;
    FWinService: IFMXWindowService;
    FCursorService: IFMXCursorService;
    FFullScreenWindowService: IFMXFullScreenWindowService;
    procedure ReleaseForm;
    function GetBackIndex: Integer; override;
    procedure InvalidateRect(R: TRectF);
    procedure Recreate; virtual;
    procedure Resize; virtual;
    /// <summary>
    ///   The method is called when form need to apply size constraints. You can overload this method to adjust
    ///   the constraint values.
    /// </summary>
    procedure ConstrainedResize(var AMinWidth, AMinHeight, AMaxWidth, AMaxHeight: Single); virtual;
    procedure AdjustSize(var ASize: TSizeF); virtual;
    procedure SetActive(const Value: Boolean); virtual;
    procedure DefineProperties(Filer: TFiler); override;
    function FindTarget(P: TPointF; const Data: TDragObject): IControl; virtual;
    procedure SetFormFamily(const Value: string);
    procedure UpdateStyleBook; virtual;
    procedure SetStyleBookWithoutUpdate(const StyleBook: TStyleBook);
    procedure ShowInDesigner;
    procedure DoFlipChildren; virtual;
    function CanFlipChild(const AChild: TFmxObject): Boolean; virtual;
    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
    { IAlignRoot }
    procedure Realign; virtual;
    procedure ChildrenAlignChanged;
    { Preload }
    procedure AddPreloadPropertyNames(const PropertyNames: TList<string>); virtual;
    procedure SetPreloadProperties(const PropertyStore: TDictionary<string, Variant>); virtual;
    { Handle }
    procedure CreateHandle; virtual;
    procedure DestroyHandle; virtual;
    procedure ResizeHandle; virtual;
    { IRoot }
    function GetObject: TFmxObject;
    function GetActiveControl: IControl;
    procedure SetActiveControl(const AControl: IControl);
    procedure SetCaptured(const Value: IControl);
    function NewFocusedControl(const Value: IControl): IControl;
    procedure SetFocused(const Value: IControl);
    procedure SetHovered(const Value: IControl);
    procedure SetTransparency(const Value: Boolean); virtual;
    function GetCaptured: IControl;
    function GetFocused: IControl;
    function GetBiDiMode: TBiDiMode;
    function GetHovered: IControl;
    procedure BeginInternalDrag(const Source: TObject; const ABitmap: TObject);
    { IStyleBookOwner }
    function GetStyleBook: TStyleBook;
    procedure SetStyleBook(const Value: TStyleBook);
    { IPaintControl }
    procedure PaintRects(const UpdateRects: array of TRectF); virtual;
    function GetContextHandle: THandle;
    procedure SetContextHandle(const AContextHandle: THandle);
    property ContextHandle: THandle read FContextHandle;
    { Border }
    function CreateBorder: TFormBorder; virtual;
    { TFmxObject }
    procedure Loaded; override;
    procedure FreeNotification(AObject: TObject); override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
    procedure DoDeleteChildren; override;
    procedure Updated; override;
    { TComponent }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ValidateRename(AComponent: TComponent; const CurName, NewName: string); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure GetDeltaStreams(Proc: TGetStreamProc); override;
    { IContainerObject }
    function GetContainerWidth: Single;
    function GetContainerHeight: Single;
    procedure UpdateActions; virtual;
    function GetActionLinkClass: TActionLinkClass; override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    function CaptionStore: boolean;
    procedure VirtualKeyboardChangeHandler(const Sender: TObject; const Msg: System.Messaging.TMessage); virtual;
    procedure IsDialogKey(const Key: Word; const KeyChar: WideChar; const Shift: TShiftState;
                          var IsDialog: Boolean); virtual;
    { Events }
    procedure DoShow; virtual;
    procedure DoHide; virtual;
    procedure DoClose(var CloseAction: TCloseAction); virtual;
    procedure DoScaleChanged; virtual;
    procedure DoStyleChanged; virtual;
    procedure DoMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure DoMouseMove(Shift: TShiftState; X, Y: Single); virtual;
    procedure DoMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); virtual;
    procedure DoFocusChanged; virtual;
    procedure DoPaddingChanged; virtual;
    procedure DoTap(const Point: TPointF); virtual;
    procedure DoKeyDown(var AKeyCode: Word; var AKeyChar: WideChar; const AShiftState: TShiftState); virtual;
    procedure DoKeyUp(var AKeyCode: Word; var AKeyChar: WideChar; const AShiftState: TShiftState); virtual;
    { Window style }
    function GetWindowStyle: TWindowStyles; virtual;
    procedure DoParentFormChanged; virtual;
    procedure DoRootChanged; override;
    property MainMenu: TComponent read FMainMenu;
    procedure DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean); virtual;
    { IGestureControl }
    procedure BroadcastGesture(EventInfo: TGestureEventInfo);
    procedure CMGesture(var EventInfo: TGestureEventInfo); virtual;
    function TouchManager: TTouchManager;
    function GetFirstControlWithGesture(AGesture: TInteractiveGesture): TComponent;
    function GetFirstControlWithGestureEngine: TComponent;
    function GetListOfInteractiveGestures: TInteractiveGestures;
    procedure Tap(const Location: TPointF); virtual;
    { IMultiTouch }
    procedure MultiTouch(const Touches: TTouches; const Action: TTouchAction);
    procedure Engage;
    procedure Disengage;
    /// <summary>Handler for event that happend when window's scale factor is changed, for example move window from retina to non-retina screen on OS X.</summary>
    procedure ScaleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage); virtual;
    /// <summary>Style changeing event handler</summary>
    procedure StyleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage); virtual;
    { IHintRegistry }
    procedure TriggerHints;
    procedure RegisterHintReceiver(const AReceiver: IHintReceiver);
    procedure UnregisterHintReceiver(const AReceiver: IHintReceiver);
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: NativeInt = 0); virtual;
    destructor Destroy; override;
    procedure InitializeNewForm; virtual;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    { children }
    function ObjectAtPoint(AScreenPoint: TPointF): IControl; virtual;
    procedure CreateChildFormList(Parent: TFmxObject; var List: TList<TCommonCustomForm>);
    {$REGION 'Mouse events'}
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; AFormX, AFormY: Single); virtual;
    procedure MouseMove(Shift: TShiftState; AFormX, AFormY: Single); virtual;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; AFormX, AFormY: Single; DoClick: Boolean = True); virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); virtual;
    procedure MouseLeave; virtual;
    procedure MouseCapture;
    procedure ReleaseCapture;
    {$ENDREGION}

    {$REGION 'Keys events'}
    /// <summary>
    ///   Starting the processing of the Key Down event. The method performs full processing and delivery of the event
    ///   to consumers.
    /// </summary>
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    /// <summary>
    ///   Starting the processing of the Key Up event. The method performs full processing and delivery of the event
    ///   to consumers.
    /// </summary>
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    /// <summary>
    ///   Performs accelerator keys processing. If the keys are processed, it returns True and this means that
    ///   no more keys will be processed by the next consumers.
    /// </summary>
    function DispatchAcceleratorKey(const AKey: Word; const AKeyChar: WideChar; const AShift: TShiftState): Boolean; virtual;
    /// <summary>
    ///   Performs dialog keys processing. If the keys are processed, it returns True and this means that
    ///   no more keys will be processed by the next consumers.
    /// </summary>
    function DispatchDialogKey(const AKey: Word; const AKeyChar: WideChar; const AShift: TShiftState): Boolean; virtual;
    {$ENDREGION}

    /// <summary>Force recreating form resources lie Canvas or Context.</summary>
    procedure RecreateResources; virtual;
    procedure HandleNeed; deprecated 'Use HandleNeeded.';
    /// <summary> Requests the form to create its handle at this moment and all associated resources with it.
    /// This replaces HandleNeed method, which has been deprecated. </summary>
    procedure HandleNeeded;
//    function GetImeWindowRect: TRectF; virtual;
    procedure Activate;
    procedure Deactivate;
    procedure DragEnter(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation); virtual;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragLeave; virtual;
    procedure EnterMenuLoop;
    { manully start }
    procedure StartWindowDrag; virtual;
    procedure StartWindowResize; virtual;
    {interactive gesture recognizers}
    procedure AddRecognizer(const Recognizer: TInteractiveGesture);
    procedure RemoveRecognizer(const Recognizer: TInteractiveGesture);
    function GetRecognizers: TInteractiveGestures;
    { settings }
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); overload; virtual;
    procedure SetBounds(const ARect: TRect); overload;
    /// <summary>Sets new form frame in DP.</summary>
    procedure SetBoundsF(const ALeft, ATop, AWidth, AHeight: Single); overload; virtual;
    /// <summary>Sets new form frame in DP.</summary>
    procedure SetBoundsF(const ARect: TRectF); overload;
    function GetBounds: TRect; virtual;
    function GetBoundsF: TRectF; virtual;
    function ClientToScreen(const AFormPoint: TPointF): TPointF;
    function ScreenToClient(const AScreenPoint: TPointF): TPointF;
    function CanShow: Boolean; virtual;
    function CloseQuery: Boolean; virtual;
    function ClientRect: TRectF;
    procedure RecreateOsMenu;
    {$WARN SYMBOL_DEPRECATED OFF}
    procedure Release; override; deprecated;
    {$WARN SYMBOL_DEPRECATED DEFAULT}
    /// <summary>Closes the form and returns the actual TCloseAction performed.</summary>
    function Close: TCloseAction;
    procedure Show;
    procedure Hide;
    procedure BringToFront; override;
    procedure SendToBack; override;
    function ShowModal: TModalResult; overload;
    procedure ShowModal(const ResultProc: TProc<TModalResult>); overload;
    /// <summary>Closes a modal form and returns the actual TCloseAction performed.</summary>
    function CloseModal: TCloseAction;
    function IsPopupForm: Boolean; overload; virtual;
    class function IsPopupForm(const AForm: TCommonCustomForm): Boolean; overload;
    procedure Invalidate;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    { ITabStopController }
    function GetTabList: ITabList;
    { IFlipContainer }
    procedure FlipChildren(const AAllLevels: Boolean);
    /// <summary>Returns true if the handle is allocated; otherwise, false. </summary>
    function IsHandleAllocated: Boolean;
    property Handle: TWindowHandle read FHandle;
    property ParentForm: TCommonCustomForm read FParentForm;
    property FormStyle: TFormStyle read FFormStyle write SetFormStyle default TFormStyle.Normal;
    property ModalResult: TModalResult read FModalResult write SetModalResult;
    property FormState: TFmxFormStates read FFormState;
    property Designer: IDesignerHook read FDesigner write SetDesigner;
    property Captured: IControl read FCaptured;
    property Focused: IControl read FFocused write SetFocused;
    property Hovered: IControl read FHovered;
    property Active: Boolean read FActive write SetActive;
    property BiDiMode: TBiDiMode read GetBiDiMode write SetBiDiMode default bdLeftToRight;
    property Caption: string read FCaption write SetCaption stored CaptionStore;
    property Cursor: TCursor read FCursor write SetCursor default crDefault;
    property Border: TFormBorder read FBorder write SetBorder;
    property BorderStyle: TFmxFormBorderStyle read FBorderStyle write SetBorderStyle
      default TFmxFormBorderStyle.Sizeable;
    property BorderIcons: TBorderIcons read FBorderIcons write SetBorderIcons
      default [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
    /// <summary>Bounds of form - position and size (dp).</summary>
    property Bounds: TRect read GetBounds write SetBounds;
    /// <summary>Bounds of form - position and size (dp).</summary>
    property BoundsF: TRectF read GetBoundsF write SetBoundsF;
    property ClientHeight: Integer read GetClientHeight write SetClientHeight;
    property ClientWidth: Integer read GetClientWidth write SetClientWidth;
    property OriginalContainerSize: TPointF read GetOriginalContainerSize;
    property Padding: TBounds read FPadding write SetPadding;
    property Position: TFormPosition read FPosition write SetPosition default TFormPosition.DefaultPosOnly;
    property StyleBook: TStyleBook read FStyleBook write SetStyleBook;
    /// <summary>Settings of system status bar on mobile platforms</summary>
    property SystemStatusBar: TFormSystemStatusBar read FSystemStatusBar write SetSystemStatusBar;
    property Transparency: Boolean read FTransparency write SetTransparency default False;
    property Width: Integer read GetWidth write SetWidth stored False;
    property Height: Integer read GetHeight write SetHeight stored False;
    property Constraints: TSizeConstraints read FConstraints write SetConstraints;
    property Visible: Boolean read GetVisible write SetVisible default False;
    property WindowState: TWindowState read FWindowState write SetWindowState default TWindowState.wsNormal;
    property WindowStyle: TWindowStyles read GetWindowStyle;
    property FullScreen : Boolean read GetFullScreen write SetFullScreen default False;
    property ShowFullScreenIcon : Boolean read GetShowFullScreenIcon write SetShowFullScreenIcon default True;
    property FormFactor: TFormFactor read FFormFactor write FFormFactor;
    property FormFamily : string read FFormFamily write SetFormFamily;
    property SaveState: TFormSaveState read GetSaveState;
    /// <summary>Determines whether Help Hints are enabled or disabled for the entire application.</summary>
    property ShowHint: Boolean read FShowHint write SetShowHint default True;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnClose: TCloseEvent read FOnClose write FOnClose;
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnConstrainedResize: TConstrainedResizeEvent read FOnConstrainedResize write FOnConstrainedResize;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnHide: TNotifyEvent read FOnHide write FOnHide;
    property OnFocusChanged: TNotifyEvent read FOnFocusChanged write FOnFocusChanged;
    property OnVirtualKeyboardShown: TVirtualKeyboardEvent read FOnVirtualKeyboardShown write FOnVirtualKeyboardShown;
    property OnVirtualKeyboardHidden: TVirtualKeyboardEvent read FOnVirtualKeyboardHidden write FOnVirtualKeyboardHidden;
    property OnSaveState: TNotifyEvent read FOnSaveState write FOnSaveState;
    property Touch: TTouchManager read GetTouchManager write SetTouchManager;
    property OnGesture: TGestureEvent read FOnGesture write FOnGesture;
    property OnTap: TTapEvent read FOnTap write FOnTap;
    property OnTouch: TTouchEvent read FOnTouch write FOnTouch;
  published
    // do not move this
    property Left: Integer read GetLeft write SetLeft;
    property Top: Integer read GetTop write SetTop;
  end;

  { TCustomForm }

  TCustomForm = class(TCommonCustomForm, IScene)
  private
    FCanvas: TCanvas;
    FTempCanvas: TCanvas;
    FFill: TBrush;
    FDrawing: Boolean;
    FUpdateRects: array of TRectF;
    FStyleLookup: string;
    FNeedStyleLookup: Boolean;
    FResourceLink: TFmxObject;
    FOnPaint: TOnPaintEvent;
    FControls: TControlList;
    FQuality: TCanvasQuality;
    FDisableUpdating: Integer;
    procedure SetFill(const Value: TBrush);
    procedure FillChanged(Sender: TObject);
    { IScene }
    function GetCanvas: TCanvas;
    function GetUpdateRectsCount: Integer;
    function GetUpdateRect(const Index: Integer): TRectF;
    function GetSceneScale: Single;
    function LocalToScreen(const P: TPointF): TPointF;
    function ScreenToLocal(const P: TPointF): TPointF;
    procedure SetStyleLookup(const Value: string);
    procedure AddUpdateRect(const R: TRectF);
    procedure DisableUpdating;
    procedure EnableUpdating;
    procedure ChangeScrollingState(const AControl: TControl; const Active: Boolean);
    function IsStyleLookupStored: Boolean;
    function GetActiveHDControl: TControl;
    procedure SetActiveHDControl(const Value: TControl);
    procedure SetQuality(const Value: TCanvasQuality);
    procedure AddUpdateRects(const UpdateRects: array of TRectF);
    procedure PrepareForPaint;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
    procedure DoDeleteChildren; override;
    procedure ChangeChildren; override;
    procedure UpdateStyleBook; override;
    { TForm }
    function CanFlipChild(const AChild: TFmxObject): Boolean; override;
    procedure ApplyStyleLookup; virtual;
    { Preload }
    procedure AddPreloadPropertyNames(const PropertyNames: TList<string>); override;
    procedure SetPreloadProperties(const PropertyStore: TDictionary<string, Variant>); override;
    { }
    procedure DoPaint(const Canvas: TCanvas; const ARect: TRectF); virtual;
    { resources }
    function GetStyleObject: TFmxObject;
    procedure PaintBackground; virtual;
    { Handle }
    procedure CreateHandle; override;
    procedure DestroyHandle; override;
    procedure ResizeHandle; override;
    procedure PaintRects(const UpdateRects: array of TRectF); override;
    procedure RecreateCanvas;
    { inherited }
    procedure RecalcControlsUpdateRect;
    procedure Realign; override;
    procedure DoScaleChanged; override;
    procedure DoStyleChanged; override;
    { Window style }
    function GetWindowStyle: TWindowStyles; override;
    procedure StyleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage); override;
    property ResourceLink: TFmxObject read FResourceLink;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: NativeInt = 0); override;
    destructor Destroy; override;
    procedure InitializeNewForm; override;
    procedure EndUpdate; override;
    procedure PaintTo(const Canvas: TCanvas);
    procedure RecreateResources; override;
    property Action;
    property Canvas: TCanvas read GetCanvas;
    property Fill: TBrush read FFill write SetFill;
    property Quality: TCanvasQuality read FQuality write SetQuality;
    property ActiveControl: TControl read GetActiveHDControl write SetActiveHDControl;
    property StyleLookup: string read FStyleLookup write SetStyleLookup stored IsStyleLookupStored;
    property OnPaint: TOnPaintEvent read FOnPaint write FOnPaint;
  end;

  TCustomPopupForm = class (TCustomForm)
  private type
    TAniState =  (asNone, asShow, asClose);
  private
    FAutoFree: Boolean;
    FPlacement: TPlacement;
    FRealPlacement: TPlacement;
    [Weak] FPlacementTarget: TControl;
    FOffset: TPointF;
    FSize: TSizeF;
    FPlacementRectangle: TBounds;
    FScreenPlacementRect: TRectF;
    FPlacementChanged: Boolean;
    FTimer: TTimer;
    FAniState: TAniState;
    FAniDuration: Single;
    FMaxAniPosition: Single;
    FAniPosition: Single;
    FShowTime: TDateTime;
    FCloseTime: TDateTime;
    FOnAniTimer: TNotifyEvent;
    FFirstShow: Boolean;
    FDragWithParent: Boolean;
    FHideWhenPlacementTargetInvisible: Boolean;
    FBeforeClose: TNotifyEvent;
    FBeforeShow: TNotifyEvent;
    FScreenContentRect: TRectF;
    FContentPadding: TBounds;
    FContentControl: TControl;
    FOnRealPlacementChanged: TNotifyEvent;
    FPreferedDisplayIndex: Integer;
    procedure SetOffset(const Value: TPointF);
    procedure SetSize(const Value: TSizeF);
    procedure SetPlacementRectangle(const Value: TBounds);
    procedure SetPlacement(const Value: TPlacement);
    procedure TimerProc(Sender: TObject);
    procedure SetPlacementTarget(const Value: TControl);
    procedure SetDragWithParent(const Value: Boolean);
    procedure SetContentPadding(const Value: TBounds);
    procedure SetContentControl(const Value: TControl);
    procedure SetPreferedDisplayIndex(const Value: Integer);
  protected
    procedure DoBeforeShow; virtual;
    procedure DoBeforeClose; virtual;
    procedure DoClose(var CloseAction: TCloseAction); override;
    procedure DoPaddingChanged; override;
    procedure DoApplyPlacement; virtual;
    procedure Loaded; override;
    procedure Updated; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DoAniTimer; virtual;
    procedure Realign; override;
    procedure DoRealPlacementChanged; virtual;
    function IsVisibleOnScreen(const AControl: TControl): Boolean;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: NativeInt = 0); override;
    constructor Create(AOwner: TComponent; AStyleBook: TStyleBook = nil; APlacementTarget: TControl = nil;
      AutoFree: Boolean = True); reintroduce;
    destructor Destroy; override;
    procedure ApplyPlacement;
    function CanShow: Boolean; override;
    function CloseQuery: Boolean; override;
    property AniDuration: Single read FAniDuration write FAniDuration;
    property AniPosition: Single read FAniPosition;
    property AutoFree: Boolean read FAutoFree;
    property ContentControl: TControl read FContentControl write SetContentControl;
    property ContentPadding: TBounds read FContentPadding write SetContentPadding;
    /// <summary>True - if popup form have to be relocated, when parent changes his position on screen.</summary>
    property DragWithParent: Boolean read FDragWithParent write SetDragWithParent;
    /// <summary>True - if popup form have to be closed, if <c>PlacementTarget</c> is not visible on the screen.</summary>
    /// <remarks>It works only, when <c>PlacementTarget</c> is specified.</remarks>
    property HideWhenPlacementTargetInvisible: Boolean read FHideWhenPlacementTargetInvisible write FHideWhenPlacementTargetInvisible;
    property Offset: TPointF read FOffset write SetOffset;
    property Placement: TPlacement read FPlacement write SetPlacement;
    property PlacementRectangle: TBounds read FPlacementRectangle write SetPlacementRectangle;
    property PlacementTarget: TControl read FPlacementTarget write SetPlacementTarget;
    property PreferedDisplayIndex: Integer read FPreferedDisplayIndex write SetPreferedDisplayIndex;
    property RealPlacement: TPlacement read FRealPlacement;
    property ScreenContentRect: TRectF read FScreenContentRect;
    property ScreenPlacementRect: TRectF read FScreenPlacementRect;
    property Size: TSizeF read FSize write SetSize;
    property OnAniTimer: TNotifyEvent read FOnAniTimer write FOnAniTimer;
    property BeforeShow: TNotifyEvent read FBeforeShow write FBeforeShow;
    property BeforeClose: TNotifyEvent read FBeforeClose write FBeforeClose;
    property OnRealPlacementChanged: TNotifyEvent read FOnRealPlacementChanged write FOnRealPlacementChanged;
  end;

  TForm = class(TCustomForm)
  published
    property Action;
    property ActiveControl;
    property BiDiMode;
    property Border;
    property BorderIcons default [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
    property BorderStyle default TFmxFormBorderStyle.Sizeable;
    property Caption;
    property ClientHeight;
    property ClientWidth;
    property Cursor default crDefault;
    property Fill;
    property Height;
    property Left;
    property Padding;
    property Position default TFormPosition.DefaultPosOnly;
    property Quality default TCanvasQuality.SystemDefault;
    property SystemStatusBar;
    property StyleBook;
    property StyleLookup;
    property Transparency default False;
    property Top;
    property FormStyle default TFormStyle.Normal;
    property Visible;
    property WindowState default TWindowState.wsNormal;
    property Width;
    property Constraints;
    property FormFactor;
    property FormFamily;
    property FullScreen default False;
    property ShowFullScreenIcon default False;
    property ShowHint;
    {events}
    property OnActivate;
    property OnCreate;
    property OnClose;
    property OnCloseQuery;
    property OnDeactivate;
    property OnDestroy;
    property OnKeyDown;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnResize;
    property OnConstrainedResize;
    property OnPaint;
    property OnShow;
    property OnHide;
    property OnFocusChanged;
    property OnVirtualKeyboardShown;
    property OnVirtualKeyboardHidden;
    property Touch;
    property OnGesture;
    property OnSaveState;
    property OnTap;
    property OnTouch;
  end;

  { TFrame }

  TFrame = class(TControl, IControl)
  private
    FInLoaded: Boolean;
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure DoResized; override;
    function CheckHitTest(const AHitTest: Boolean): Boolean; override;
    { IControl }
    function GetVisible: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function ShouldTestMouseHits: Boolean; override;
  published
    property Action;
    property Align;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property Height;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Visible default True;
    property Width;
    property TabStop;
    property TabOrder;
    property ParentShowHint;
    property ShowHint;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
    property OnCanFocus;
    property OnClick;
    property OnDblClick;

    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;

    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
  end;

  { TScreen }

  TScreen = class(TComponent)
  private
    FManagingDataModules: Boolean;
    FForms: TList<Pointer>;
    FDataModules: TList<Pointer>;
    FPopupForms: TList<Pointer>;
    FSaveForm: TCommonCustomForm;
    FMouseSvc: IFMXMouseService;
    FMultiDisplaySvc: IInterface;
    FPopupList: TList<TCommonCustomForm>;
    FClosingPopupList: Boolean;
    procedure AddDataModule(DataModule: TDataModule);
    procedure AddForm(const AForm: TCommonCustomForm);
    function GetForm(Index: Integer): TCommonCustomForm;
    function GetFormCount: Integer;
    procedure RemoveDataModule(DataModule: TDataModule);
    procedure RemoveForm(const AForm: TCommonCustomForm);
    function GetDataModule(Index: Integer): TDataModule;
    function GetDataModuleCount: Integer;
    function GetPopupForms(Index: Integer): TCommonCustomForm;
    function GetPopupFormCount: Integer;
    function GetActiveForm: TCommonCustomForm;
    procedure SetActiveForm(const Value: TCommonCustomForm);
    function GetFocusControl: IControl;
    function GetFocusObject: TFmxObject;
    function GetDesktopRect: TRectF;
    function GetWorkAreaRect: TRectF;
    function GetDisplayCount: Integer;
    function GetDisplay(const Index: Integer): TDisplay;
    function GetDesktopHeight: Single;
    function GetDesktopLeft: Single;
    function GetDesktopTop: Single;
    function GetDesktopWidth: Single;
    function GetWorkAreaHeight: Single;
    function GetWorkAreaLeft: Single;
    function GetWorkAreaTop: Single;
    function GetWorkAreaWidth: Single;
    function GetHeight: Single;
    function GetWidth: Single;
  protected
    property FocusObject: TFmxObject read GetFocusObject;
    procedure CloseFormList(const List: TList<TCommonCustomForm>);
    function CreatePopupList(const SaveForm: TCommonCustomForm): TList<TCommonCustomForm>;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IndexFormOfObject(const AObject: TFmxObject; const VisibleOnly: Boolean = True): Integer;
    function NextActiveForm(const OldActiveForm: TCommonCustomForm): TCommonCustomForm;
    function MousePos: TPointF;
    /// <summary>The size of primary display.</summary>
    function Size: TSizeF;
    property Height: Single read GetHeight;
    property Width: Single read GetWidth;
    function MultiDisplaySupported: Boolean;
    procedure UpdateDisplayInformation;
    /// <summary> Tries to return a rectangular having the specified Size and positioned in the center of the desktop.
    /// See also IFMXMultiDisplayService.GetDesktopCenterRect </summary>
    function GetDesktopCenterRect(const Size: TSizeF): TRectF;
    property DisplayCount: Integer read GetDisplayCount;
    property Displays[const Index: Integer]: TDisplay read GetDisplay;
    function DisplayFromPoint(const Point: TPoint): TDisplay; overload;
    function DisplayFromPoint(const Point: TPointF): TDisplay; overload;
    function DisplayFromRect(const Rect: TRect): TDisplay; overload;
    function DisplayFromRect(const Rect: TRectF): TDisplay; overload;
    function DisplayFromForm(const Form: TCommonCustomForm): TDisplay; overload;
    function DisplayFromForm(const Form: TCommonCustomForm; const Point: TPoint): TDisplay; overload;
    function DisplayFromForm(const Form: TCommonCustomForm; const Point: TPointF): TDisplay; overload;
    property DesktopRect: TRectF read GetDesktopRect;
    property DesktopTop: Single read GetDesktopTop;
    property DesktopLeft: Single read GetDesktopLeft;
    property DesktopHeight: Single read GetDesktopHeight;
    property DesktopWidth: Single read GetDesktopWidth;
    property WorkAreaRect: TRectF read GetWorkAreaRect;
    property WorkAreaHeight: Single read GetWorkAreaHeight;
    property WorkAreaLeft: Single read GetWorkAreaLeft;
    property WorkAreaTop: Single read GetWorkAreaTop;
    property WorkAreaWidth: Single read GetWorkAreaWidth;

    property FormCount: Integer read GetFormCount;
    property Forms[Index: Integer]: TCommonCustomForm read GetForm;
    property DataModuleCount: Integer read GetDataModuleCount;
    property DataModules[Index: Integer]: TDataModule read GetDataModule;

    property PopupFormCount: Integer read GetPopupFormCount;
    property PopupForms[Index: Integer]: TCommonCustomForm read GetPopupForms;

    function Contains(const AComponent: TComponent): Boolean;
    function IsParent(AForm, AParent: TCommonCustomForm): Boolean;
    function PrepareClosePopups(const SaveForm: TCommonCustomForm): Boolean;
    function ClosePopupForms: Boolean;

    property ActiveForm: TCommonCustomForm read GetActiveForm write SetActiveForm;
    property FocusControl: IControl read GetFocusControl;
    function GetObjectByTarget(const Target: TObject): TFmxObject;
  end;

  { IDesignerForm: Form implementing this interface is part of the designer }
  IDesignerForm = interface
    ['{5D785E12-F0A8-416B-AC6A-20747833CE5D}']
  end;

var
  Screen: TScreen;
  Application: TApplication;

function ApplicationState: TApplicationState;

{$IFDEF MSWINDOWS}
procedure FinalizeForms;
{$ENDIF}

implementation

uses
  System.Math, System.TypInfo, System.Variants, System.Generics.Defaults, System.RTLConsts, System.Actions,
  System.Math.Vectors, System.Devices, FMX.Consts, FMX.BehaviorManager, FMX.Dialogs, FMX.Platform, FMX.Menus,
  FMX.DialogService, FMX.TextLayout.GPU, FMX.Filter, FMX.Text, FMX.Gestures, FMX.Utils, FMX.Types3D, FMX.Styles,
  FMX.TextLayout, FMX.Layouts, FMX.Header, FMX.StdActns, FMX.AcceleratorKey;

type
  TOpenFmxObject = class(TFmxObject);
  TOpenControl = class(TControl);

function PropertyValuesFromStream(const ComponentName: string; const Properties: array of string; const Input: TStream): TArray<Variant>; forward;
function ReadResource(const FormClass: TClass; const PropertyNames: array of string; const PropertyStore : TDictionary<string, Variant>) : Boolean; forward;

procedure DoneApplication;
begin
  if Screen <> nil then
    Screen.ActiveForm := nil;
  Application.DestroyComponents;

  // All controls of FireMonkey use delayed finalization of resources like a style and use ForceQueue for that.
  // But when user closes application, application stops processing CheckSynchronize method and all post
  // releasing FireMonkey styles will not be reachable and as result we get memory leaks.
  // Invoking last cycle of CheckSynchronize lets us release all resources correctly.
  if TThread.CurrentThread.ThreadID = MainThreadID then
    CheckSynchronize;
end;

function ApplicationState: TApplicationState;
var
  ApplicationService: IFMXApplicationService;
begin
  Result := TApplicationState.None;
  if Application <> nil then
  begin
    if Assigned(Application.ApplicationStateQuery) then
      Result := Application.ApplicationStateQuery
    else if Application.Terminated then
      Result := TApplicationState.Terminated
    else
    begin
      if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, ApplicationService) then
        if ApplicationService.Terminating then
          Result := TApplicationState.Terminating
        else if ApplicationService.Running then
          Result := TApplicationState.Running;
    end;
  end;
end;

{ TApplication }

constructor TApplication.Create(AOwner: TComponent);
begin
  inherited;
  FIdleMessage := TIdleMessage.Create;
  FActionUpdateDelay := 100;
  FLastUserActive := Now;
  FFormRegistry := TFormRegistry.Create([doOwnsValues]);
  FFormFactor := TApplicationFormFactor.Create;
  FMainFormFamily := string.Empty;
  FHintShortCuts := True;
  FShowHint := True;
  if not Assigned(System.Classes.ApplicationHandleException) then
    System.Classes.ApplicationHandleException := HandleException;
  if not Assigned(System.Classes.ApplicationShowException) then
    System.Classes.ApplicationShowException := ShowException;
end;

procedure TApplication.CreateForm(const InstanceClass: TComponentClass; var Reference);
var
  Instance: TComponent;
  RegistryItems : TFormRegistryItems;
  RegItem : TFormRegistryItem;
begin
  if FIsRealCreateFormsCalled then
  begin
    Instance := TComponent(InstanceClass.NewInstance);
    TComponent(Reference) := Instance;
    try
      Instance.Create(Self);
      for RegItem in FCreateForms do
        if RegItem.InstanceClass = InstanceClass then
        begin
          RegItem.Instance := Instance;
          RegItem.Reference := @Reference;
        end;
    except
      TComponent(Reference) := nil;
      raise;
    end;
  end
  else
  begin
    SetLength(FCreateForms, Length(FCreateForms) + 1);
    FCreateForms[High(FCreateForms)] := TFormRegistryItem.Create;
    FCreateForms[High(FCreateForms)].InstanceClass := InstanceClass;
    FCreateForms[High(FCreateForms)].Reference := @Reference;

    // Add the form to form registry in case RegisterFormFamily will not be called
    if FFormRegistry.ContainsKey(string.Empty) then
    begin
      RegistryItems := FFormRegistry[string.Empty];
    end
    else begin
      RegistryItems := TFormRegistryItems.Create;
      FFormRegistry.Add(string.Empty, RegistryItems);
    end;

    RegistryItems.Add(FCreateForms[High(FCreateForms)]);
  end;
end;

procedure TApplication.RealCreateForms;
var
  I: Integer;
  FormFamilyNotInUse: Boolean;
begin
  FFormFactor.AdjustToScreenSize;
  if not FIsRealCreateFormsCalled then
  begin
    FormFamilyNotInUse := FFormRegistry.Keys.Count = 1;
    FIsRealCreateFormsCalled := True;
    for I := 0 to High(FCreateForms) do
    begin
      if FormFamilyNotInUse or (FCreateForms[I].InstanceClass.InheritsFrom(TDataModule)) then
      begin
        CreateForm(FCreateForms[I].InstanceClass, FCreateForms[I].Reference^);
        FCreateForms[I].Instance := TComponent(FCreateForms[I].Reference^);
      end;
    end;
  end;
  if FMainForm = nil then
  begin
    CreateMainForm;
    TMessageManager.DefaultManager.SendMessage(Self, TMainFormChangedMessage.Create(FMainForm));
  end;
  TMessageManager.DefaultManager.SendMessage(Self, TFormsCreatedMessage.Create);
end;

procedure TApplication.RegisterFormFamily(const AFormFamily: string; const AForms: array of TComponentClass);
var
  FamilyList : TFormRegistryItems;
  RegItem : TFormRegistryItem;
  FormsList : TList<TComponentClass>;
begin
  FamilyList := TFormRegistryItems.Create;
  FormsList := TList<TComponentClass>.Create;
  FormsList.AddRange(AForms);

  for RegItem in FCreateForms do
    if FormsList.Contains(RegItem.InstanceClass) then
    begin
      FamilyList.Add(RegItem);
    end;

  FFormRegistry.Add(AFormFamily, FamilyList);

  if FMainFormFamily.IsEmpty then
    FMainFormFamily := AFormFamily;

  FormsList.Free;
end;

procedure TApplication.CreateMainForm;
var
  I: Integer;
begin
  if FMainForm = nil then
  begin
    if FFormRegistry.Keys.Count = 1 then
    begin
      for I := 0 to High(FCreateForms) do
        if not FCreateForms[I].InstanceClass.InheritsFrom(TDataModule) then
        begin
          FMainForm := TCommonCustomForm(FCreateForms[I].Reference^);
          break;
        end
    end
    else
      FMainForm := GetDeviceForm(FMainFormFamily);
    TMessageManager.DefaultManager.SendMessage(FMainForm, TMainCaptionChangedMessage.Create(FMainForm));
  end;

  if FMainForm <> nil then
    FMainForm.Visible := True;
end;

destructor TApplication.Destroy;
type
  TExceptionEvent = procedure(E: Exception) of object;
var
  P: TNotifyEvent;
  E: TExceptionEvent;
  I: Integer;
begin
  FTimerService := nil;
  System.Classes.WakeMainThread := nil;
  P := HandleException;
  if @P = @System.Classes.ApplicationHandleException then
    System.Classes.ApplicationHandleException := nil;
  E := ShowException;
  if @E = @System.Classes.ApplicationShowException then
    System.Classes.ApplicationShowException := nil;
  FreeAndNil(FMainForm);
  for I := 0 to Length(FCreateForms)-1 do
    FreeAndNil(FCreateForms[I]);
  SetLength(FCreateForms, 0);
  FreeAndNil(FFormRegistry);
  FreeAndNil(FFormFactor);
  FreeAndNil(FActionClientsList);
  FreeAndNil(FIdleMessage);
  FreeAndNil(FAnalyticsManager);
  inherited;
end;

procedure TApplication.FormDestroyed(const AForm: TCommonCustomForm);
var
  RegItem : TFormRegistryItem;
begin
  for RegItem in FCreateForms do
    if RegItem.Instance = AForm then
      RegItem.Instance := nil;

  if FMainForm = AForm then
  begin
    FMainForm := nil;
    TMessageManager.DefaultManager.SendMessage(FMainForm, TMainCaptionChangedMessage.Create(FMainForm));
    TMessageManager.DefaultManager.SendMessage(Self, TMainFormChangedMessage.Create(FMainForm));
  end;
end;

function TApplication.GetDeviceForm(const FormFamily: string) : TCommonCustomForm;
begin
  Result := GetDeviceForm(FormFamily, FFormFactor);
end;

function TApplication.GetDeviceForm(const FormFamily: string; const FormFactor : TFormFactor): TCommonCustomForm;
var
  RegItem: TFormRegistryItem;
begin
  Result := nil;
  RegItem := GetFormRegistryItem(FormFamily, FormFactor);
  if RegItem <> nil then
  begin
    if RegItem.Instance = nil then
    begin
      try
        RegItem.Instance := TComponent(RegItem.InstanceClass.NewInstance);
        RegItem.Instance.Create(Self);
        TComponent(RegItem.Reference^) := RegItem.Instance;
        Result := TCommonCustomForm(RegItem.Instance);
      except
        RegItem.Instance := nil;
        raise;
      end;
    end
    else
      Result := TCommonCustomForm(RegItem.Instance);
  end;
end;

function TApplication.GetFormRegistryItem(const FormFamily: string; const FormFactor : TFormFactor): TFormRegistryItem;
  const
    PropertyNames : array [0..5] of string =
                      ('FormFactor.Width',
                       'FormFactor.Height',
                       'FormFactor.Devices',
                       'FormFactor.Aspect',
                       'FormFactor.Orientations',
                       'FormFamily');

  function DiffWeight(X1, X2 : Single) : Single;
  begin
    Result := Abs(X1 - X2);
    if Result <= 0.1 then
      Result := 1.0;
    Result := 1.0/Result;
  end;

  function CalcWeight(const F: TFormFactor) : Single;
  var
    W1, W2 : Single;
  begin
    W1 :=
      DiffWeight(F.Width, FormFactor.Width) *
      DiffWeight(F.Height, FormFactor.Height);
    W2 :=
      DiffWeight(F.Height, FormFactor.Width) *
      DiffWeight(F.Width, FormFactor.Height);

    Result := Max(W1, W2);
  end;

  // For comparison with the current device family
  function IsCompatible(const F: TFormFactor) : Boolean;
  begin
    Result := FormFactor.Devices * F.Devices <> [];
  end;

  function GetFormFactor(const FormClass: TClass; var FamilyName: string; const FormFactor: TFormFactor) : Boolean;
  var
    PropertyStore : TDictionary<String,Variant>;
    TI : PTypeInfo;
    Val : Variant;
  begin
    PropertyStore := TDictionary<String,Variant>.Create;
    ReadResource(FormClass, PropertyNames, PropertyStore);

    PropertyStore.TryGetValue('FormFactor.Width', Val);
    if (Val <> Unassigned) and (Val <> Null) then
      FormFactor.Width := Val;

    PropertyStore.TryGetValue('FormFactor.Height', Val);
    if (Val <> Unassigned) and (Val <> Null) then
      FormFactor.Height := Val;

    TI := TypeInfo(TDeviceKinds);
    PropertyStore.TryGetValue('FormFactor.Devices', Val);
    if (Val <> Unassigned) and (Val <> Null) then
      FormFactor.Devices := TDeviceKinds(Byte(StringToSet(TI, Val)));

    TI := TypeInfo(TFormOrientations);
    PropertyStore.TryGetValue('FormFactor.Orientations', Val);
    if (Val <> Unassigned) and (Val <> Null) then
      FormFactor.Orientations := TFormOrientations(Byte(StringToSet(TI, Val)));

    PropertyStore.TryGetValue('FormFamily', Val);
    if (Val <> Unassigned) and (Val <> Null) then
      FamilyName := Val;

    PropertyStore.Free;

    Result := True;
  end;


var
  Weight, MaxWeight: Single;
  LoadedFamilyName: string;
  LoadedFormFactor: TFormFactor;
  RegItem, BestForm: TFormRegistryItem;
begin
  Result := nil;
  BestForm := nil;
  MaxWeight := -1;

  if FFormRegistry.ContainsKey(FormFamily) then
  begin
    LoadedFormFactor := TFormFactor.Create;

    for RegItem in FFormRegistry[FormFamily] do
    begin
      GetFormFactor(RegItem.InstanceClass,
        LoadedFamilyName,
        LoadedFormFactor);

      if not (RegItem.Instance is TDataModule) and IsCompatible(LoadedFormFactor) then
      begin
        Weight := CalcWeight(LoadedFormFactor);
        if Weight > MaxWeight then
        begin
          MaxWeight := Weight;
          BestForm := RegItem;
        end;
      end;
    end;
    Result := BestForm;
    LoadedFormFactor.Free;
  end;
end;

function IsClass(const Obj: TObject; const Cls: TClass): Boolean;
var
  Parent: TClass;
begin
  if (Obj <> nil) and (Cls <> nil) then
  begin
    Parent := Obj.ClassType;
    while (Parent <> nil) and (Parent.ClassName <> Cls.ClassName) do
      Parent := Parent.ClassParent;
    Result := Parent <> nil;
  end
  else
    Result := False;
end;

procedure TApplication.OverrideScreenSize(W, H: Integer);
begin
  FFormFactor.SetWidth(W);
  FFormFactor.SetHeight(H);
end;

procedure TApplication.HandleException(Sender: TObject);
var
  O: TObject;
  procedure DoShowException;
  begin
  if IsClass(O, Exception) then
  begin
      if (not IsClass(O, EAbort)) then
      if Assigned(FOnException) then
        FOnException(Sender, Exception(O))
      else
        ShowException(Exception(O));
    end
    else
    System.SysUtils.ShowException(O, ExceptAddr);
  end;
begin
  O := ExceptObject;
  if O = nil then
  begin
    try
      raise EArgumentNilException.Create(SNullException);
    except
      on E: Exception do
      begin
        O := ExceptObject;
        DoShowException;
      end;
    end;
  end
  else
  begin
    if TrackActivity then
      AnalyticsManager.RecordActivity(TAppActivity.Exception, O);
    DoShowException;
  end;
end;

procedure TApplication.ShowException(E: Exception);
var
  Msg: string;
  SubE: Exception;
  S: string;
begin
  Msg := E.ToString;
  while True do
  begin
    SubE := E.GetBaseException;
    if SubE <> E then
    begin
      E := SubE;
      S := E.ToString;
      if S <> '' then
        Msg := S;
    end
    else
      Break;
  end;
  if (Msg <> '') and (Msg.Chars[Msg.Length - 1] > '.') then
    Msg := Msg + '.';

  //Force show messages in the main thread.
  TThread.Synchronize(nil,
  procedure
  begin
    TDialogService.MessageDialog(Msg, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
  end);
end;

function TApplication.HandleMessage: Boolean;
var
  AppService: IFMXApplicationService;
begin
  Result := False;
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    Result := AppService.HandleMessage;
  if not Result then
    Idle;
end;

procedure TApplication.DoIdle(var Done: Boolean);

  procedure ProcessUpdateActions;
  begin
    if FActionUpdateDelay = 0 then
      DoUpdateActions
    else if FActionUpdateDelay > 0 then
    begin
      if FTimerActionHandle = 0 then
        FTimerActionHandle := TimerService.CreateTimer(FActionUpdateDelay, UpdateActionTimerProc);
    end;
  end;

begin
  Done := True;
  try
    if Assigned(FOnIdle) then
      FOnIdle(Self, Done);
    FIdleDone := Done;
    if FIdleDone then
      ProcessUpdateActions;
    TMessageManager.DefaultManager.SendMessage(Self, FIdleMessage, False);
  except
    HandleException(Self);
  end;
end;

procedure TApplication.CancelHint;
begin
  HideHint;
end;

procedure TApplication.HideHint;
var
  LLastValue: Boolean;
begin
  if FSharedHint <> nil then
    try
      LLastValue := FSharedHint.Enabled;
      FSharedHint.Enabled := False;
      if FIsControlHint then
        FSharedHint.Enabled := LLastValue;
      if MainForm <> nil then
        Mainform.ReleaseLastHinted;
    finally
      FSharedHint := nil;
    end;
end;

procedure TApplication.Idle;
var
  Done: Boolean;
  AppService: IFMXApplicationService;
begin
  DoIdle(Done);
  if (TThread.CurrentThread.ThreadID = MainThreadID) and CheckSynchronize then
    Done := False;

  if Done and TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    AppService.WaitMessage;
end;

procedure TApplication.RegisterActionClient(const ActionClient: TComponent);
begin
  if FActionClientsList = nil then
    FActionClientsList := TList<TComponent>.Create;
  if not FActionClientsList.Contains(ActionClient) then
    FActionClientsList.Add(ActionClient);
end;

procedure TApplication.UnregisterActionClient(const ActionClient: TComponent);
begin
  if FActionClientsList <> nil then
    FActionClientsList.Remove(ActionClient);
end;

function TApplication.GetActionClients: TEnumerable<TComponent>;
begin
  if FActionClientsList = nil then
    FActionClientsList := TList<TComponent>.Create;
  Result := FActionClientsList;
end;

function TApplication.GetAnalyticsManager: TAnalyticsManager;
begin
  if FAnalyticsManager = nil then
    FAnalyticsManager := TAnalyticsManager.Create;
  Result := FAnalyticsManager;
end;

procedure TApplication.SetShowHint(const AValue: Boolean);
begin
  if FShowHint <> AValue then
  begin
    FShowHint := AValue;
    if not AValue then
      CancelHint;
  end;
end;

function TApplication.ActionExecuteTarget(Action: TBasicAction): Boolean;
  function ActiveControlByForm(const Form: TCommonCustomForm): TComponent;
  begin
    if Form.Focused <> nil then
      Result := Form.Focused.GetObject
    else if (Form is TCustomForm) and (TCustomForm(Form).ActiveControl <> nil) then
      Result := TCustomForm(Form).ActiveControl
    else
      Result := Form;
  end;

  function FindActiveControl: TComponent;
  var
    I: Integer;
  begin
    Result := Application;
    if Screen <> nil then
    begin
      if Screen.ActiveForm <> nil then
        Result := ActiveControlByForm(Screen.ActiveForm)
      else if (Application.MainForm <> nil) and Application.MainForm.Visible then
        Result := ActiveControlByForm(Application.MainForm)
      else for I := Screen.FormCount - 1 downto 0 do
        if Screen.Forms[I].Visible then
        begin
          Result := ActiveControlByForm(Screen.Forms[I]);
          Break;
        end;
    end;
  end;
var
  ActiveComponent: TComponent;
begin
  Result := False;
  if Action <> nil then
  begin
    ActiveComponent := FindActiveControl;
    if ActiveComponent <> nil then
      Result := ActiveComponent.ExecuteAction(Action);
  end;
end;

function TApplication.ExecuteAction(Action: TBasicAction): Boolean;
var
  Supported: Boolean;
begin
  Result := False;
  if (Action <> nil) and Assigned(FOnActionExecute) then
  begin
    if Action is TCustomAction then
      Supported := TCustomAction(Action).Supported
    else
      Supported := True;
    if Supported then
      FOnActionExecute(Action, Result);
  end;
end;

function TApplication.UpdateAction(Action: TBasicAction): Boolean;
var
  Supported: Boolean;
begin
  Result := False;
  if Action <> nil then
  begin
    if Action is TCustomAction then
      Supported := TCustomAction(Action).Supported
    else
      Supported := True;
    if Supported then
    begin
      if not Assigned(Action.OnExecute) and (Action is TContainedAction) and
        (TContainedAction(Action).DisableIfNoHandler) and (TContainedAction(Action).ActionList <> nil) and
        not (csDesigning in TContainedAction(Action).ActionList.ComponentState) then
        TContainedAction(Action).Enabled := False;
      if Assigned(FOnActionUpdate) then
        FOnActionUpdate(Action, Result);
    end;
  end;
end;

procedure TApplication.UpdateActionTimerProc;
begin
  if FIdleDone then
  try
    DoUpdateActions;
  finally
    FIdleDone := False;
  end;

  if FTimerActionHandle <> 0 then
  begin
    TimerService.DestroyTimer(FTimerActionHandle);
    FTimerActionHandle := 0;
  end;
end;

procedure TApplication.DoUpdateActions;
type
  TFormType = (Active, NonActive);

  procedure UpdateFormActions(const AFormType: TFormType);
  var
    Form: TCommonCustomForm;
    I: Integer;
  begin
    for I := 0 to Screen.FormCount - 1 do
    begin
      Form := Screen.Forms[I];
      if (AFormType = TFormType.Active) and Form.Active or (AFormType = TFormType.NonActive) and not Form.Active then
        Form.UpdateActions;
    end;
  end;

  procedure UpdatePopupFormActions(const AFormType: TFormType);
  var
    PopupForm: TCommonCustomForm;
    I: Integer;
  begin
    for I := 0 to Screen.PopupFormCount - 1 do
    begin
      PopupForm := Screen.PopupForms[I];
      if (AFormType = TFormType.Active) and PopupForm.Active or (AFormType = TFormType.NonActive) and not PopupForm.Active then
        PopupForm.UpdateActions;
    end;
  end;

begin
  UpdateFormActions(TFormType.Active);
  UpdateFormActions(TFormType.NonActive);

  UpdatePopupFormActions(TFormType.Active);
  UpdatePopupFormActions(TFormType.NonActive);
end;

procedure TApplication.SetHint(const AHint: string);
begin
  if FHint <> AHint then
  begin
    FHint := AHint;
    if Assigned(FOnHint) then
      FOnHint(Self)
    else
      { Fire THintAction to anyone interested }
      with THintAction.Create(Self) do
      begin
        try
          Hint := AHint;
          Execute;
        finally
          Free;
        end;
      end;
  end;
end;

procedure TApplication.SetHintShortCuts(const Value: Boolean);
begin
  FHintShortCuts := Value;
end;

function TApplication.GetTimerService: IFMXTimerService;
begin
  if (FTimerService = nil) and not TPlatformServices.Current.SupportsPlatformService(IFMXTimerService, FTimerService) then
    raise EUnsupportedPlatformService.Create('IFMXTimerService');
  Result := FTimerService;
end;

function TApplication.GetTitle: string;
var
  AppService: IFMXApplicationService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    Result := AppService.Title
  else
    Result := '';
  if Result.IsEmpty then
    Result := GetDefaultTitle;
end;

procedure TApplication.SetTitle(const Value: string);
var
  AppService: IFMXApplicationService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    AppService.Title := Value;
end;

procedure TApplication.SetMainForm(const Value: TCommonCustomForm);
begin
  if FMainForm <> Value then
  begin
    FMainForm := Value;
    TMessageManager.DefaultManager.SendMessage(Self, TMainFormChangedMessage.Create(FMainForm));
  end;
end;

function TApplication.GetDefaultTitle: string;
var
  AppService: IFMXApplicationService;
begin
  if not FDefaultTitleReceived and
    TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
  begin
    FDefaultTitle := AppService.DefaultTitle;
    FDefaultTitleReceived := not SAppDefault.IsEmpty and (FDefaultTitle <> SAppDefault);
  end;
  if FDefaultTitleReceived then
    Result := FDefaultTitle
  else
    Result := SAppDefault;
end;

type
  TOpenMainMenu = class (TMainMenu)
  end;

procedure TApplication.Run;
var
  AppService: IFMXApplicationService;
begin
  AddExitProc(DoneApplication);
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    AppService.Run;
end;

function TApplication.Terminate: Boolean;
var
  ApplicationService: IFMXApplicationService;
begin
  Result := False;
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, ApplicationService) then
  begin
    if not ApplicationService.Terminating and CallTerminateProcs then
    begin
      // Stop timer of actions
      if FTimerActionHandle <> 0 then
      begin
        TimerService.DestroyTimer(FTimerActionHandle);
        FTimerActionHandle := 0;
      end;
      // Terminate application
      ApplicationService.Terminate;
    end;
    Result := ApplicationService.Terminating;
  end;
end;

function TApplication.TrackActivity: Boolean;
begin
  Result := FAnalyticsManager <> nil;
end;

procedure TApplication.Initialize;
begin
  if Assigned(InitProc) then
    TProcedure(InitProc);
end;

procedure TApplication.ProcessMessages;
var
  AppService: IFMXApplicationService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, AppService) then
    while AppService.HandleMessage do { loop };
end;

{ TFormActionLink }

procedure TFormActionLink.AssignClient(AClient: TObject);
begin
  if AClient = nil then
    raise EActionError.CreateFMT(SParamIsNil, ['AClient']);
  if (not (AClient is FMX.Forms.TCommonCustomForm)) then
    raise EActionError.CreateFmt(StrNoClientClass, [AClient.ClassName]);
  FForm := FMX.Forms.TCommonCustomForm(AClient);
end;

function TFormActionLink.ActionCustomViewComponent: Boolean;
begin
  Result := (Action is TCustomViewAction) and (TCustomViewAction(Action).Component = FForm);
end;

function TFormActionLink.IsCheckedLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsEnabledLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsHelpLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsHintLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := False;
end;

function TFormActionLink.IsVisibleLinked: Boolean;
begin
  if ActionCustomViewComponent then
  begin
    Result := False;
    Exit;
  end;
  Result := (inherited IsVisibleLinked) and
            (FForm.Visible = TContainedAction(Action).Visible);
end;

procedure TFormActionLink.SetVisible(Value: Boolean);
begin
  if IsVisibleLinked then FForm.Visible := Value;
end;

{ TWindowBorder }

constructor TWindowBorder.Create(const AForm: TCommonCustomForm);
begin
  Assert(AForm <> nil);

  inherited Create(nil);
  FForm := AForm;
end;

procedure TWindowBorder.EnableChanged;
begin
end;

{ TFormBorder }

constructor TFormBorder.Create(const AForm: TCommonCustomForm);
var
  BorderService: IFMXWindowBorderService;
begin
  inherited Create;
  FStyling := AForm.FPreloadedBorderStyling;
  FForm := AForm;
  if (FForm.BorderStyle <> TFmxFormBorderStyle.None) and not (csDesigning in FForm.ComponentState) and
    not FForm.Transparency then
  begin
    if not (csDestroying in FForm.ComponentState) and
      TPlatformServices.Current.SupportsPlatformService(IFMXWindowBorderService, BorderService) then
      FWindowBorder := BorderService.CreateWindowBorder(FForm);
  end;
end;

destructor TFormBorder.Destroy;
begin
  FreeAndNil(FWindowBorder);
  inherited;
end;

function TFormBorder.GetSupported: Boolean;
begin
  Result := FStyling and (FForm.BorderStyle <> TFmxFormBorderStyle.None) and not FForm.Transparency and
    (FWindowBorder <> nil) and FWindowBorder.IsSupported;
end;

procedure TFormBorder.Recreate;
begin
end;

procedure TFormBorder.Resize;
begin
  if IsSupported then
    FWindowBorder.Resize;
end;

procedure TFormBorder.Activate;
begin
  if IsSupported then
    FWindowBorder.Activate;
end;

procedure TFormBorder.Deactivate;
begin
  if IsSupported then
    FWindowBorder.Deactivate;
end;

procedure TFormBorder.ScaleChanged;
begin
  if IsSupported then
    FWindowBorder.ScaleChanged;
end;

procedure TFormBorder.SetStyling(const Value: Boolean);
begin
  if FStyling <> Value then
  begin
    FStyling := Value;
    EnableChanged;
    StyleChanged;
  end;
end;

procedure TFormBorder.StyleChanged;
begin
  if IsSupported then
    FWindowBorder.StyleChanged;
end;

procedure TFormBorder.EnableChanged;
begin
  if FWindowBorder <> nil then
    FWindowBorder.EnableChanged;
end;

{ TFormSaveState }

constructor TFormSaveState.Create(const AOwner: TCommonCustomForm);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TFormSaveState.Destroy;
begin
  FreeAndNil(FStream);
  inherited;
end;

function TFormSaveState.GetStream: TMemoryStream;
begin
  if FStream = nil then
  begin
    FStream := TMemoryStream.Create;
    UpdateFromSaveState;
    FStream.Seek(0, TSeekOrigin.soBeginning);
  end;
  Result := FStream;
end;

function TFormSaveState.GenerateUniqueName: string;
var
  B: TStringBuilder;
begin
  B := TStringBuilder.Create(Length(UniqueNamePrefix) + FOwner.ClassName.Length + Length(FOwner.Name) +
    Length(UniqueNameSeparator) * 2);
  try
    B.Append(UniqueNamePrefix);
    B.Append(UniqueNameSeparator);
    B.Append(FOwner.ClassName);
    B.Append(UniqueNameSeparator);
    B.Append(FOwner.Name);
    B.Append(UniqueNameExtension);
    Result := B.ToString(True);
  finally
    B.Free;
  end;
end;

function TFormSaveState.GetUniqueName: string;
begin
  if FName.Length < 1 then
    Result := GenerateUniqueName
  else
    Result := FName;
end;

procedure TFormSaveState.UpdateFromSaveState;
var
  SaveStateService: IFMXSaveStateService;
begin
  FStream.Clear;
  if TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService, SaveStateService) then
    SaveStateService.GetBlock(GetUniqueName, FStream);
end;

procedure TFormSaveState.UpdateToSaveState;
var
  SaveStateService: IFMXSaveStateService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService, SaveStateService) then
    SaveStateService.SetBlock(GetUniqueName, FStream);
end;

function TFormSaveState.GetStoragePath: string;
var
  SaveStateService: IFMXSaveStateService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService, SaveStateService) then
    Result := SaveStateService.GetStoragePath
  else
    Result := '';
end;

procedure TFormSaveState.SetStoragePath(const AValue: string);
var
  SaveStateService: IFMXSaveStateService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService, SaveStateService) then
    SaveStateService.SetStoragePath(AValue);
end;

{ TCustomCommonForm }

constructor TCommonCustomForm.Create(AOwner: TComponent);
var
  DesignerForm: IDesignerForm;
begin
  GlobalNameSpace.BeginWrite;
  try
    inherited;
    FConstraints := TSizeConstraints.Create(Self);
    FConstraints.OnChange := ConstraintsChanged;
    FSystemStatusBar := TFormSystemStatusBar.Create(Self);
    if (csDesigning in ComponentState) or Supports(self, IDesignerForm, DesignerForm) then
      FFormState := FFormState + [TFMXFormState.InDesigner];
    FFormState := FFormState + [TFMXFormState.WasNotShown];
    if not TPlatformServices.Current.SupportsPlatformService(IFMXWindowService, FWinService) then
      raise EUnsupportedPlatformService.Create('IFMXWindowService');

    TPlatformServices.Current.SupportsPlatformService(IFMXCursorService, FCursorService);
    TPlatformServices.Current.SupportsPlatformService(IFMXFullScreenWindowService, FFullScreenWindowService);

    FOriginalContainerSize := TPointF.Create(-1, -1);
    PreloadProperties;
    InitializeNewForm;
    if (ClassType <> TCommonCustomForm) and not (csDesigning in ComponentState) then
    begin
      if not InitInheritedComponent(Self, TCommonCustomForm) then
        raise EResNotFound.CreateFMT(SResNotFound, [ClassName]);
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
  FStateChangeMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TVKStateChangeMessage, VirtualKeyboardChangeHandler);
  FSaveStateMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TSaveStateMessage, SaveStateHandler);
end;

constructor TCommonCustomForm.CreateNew(AOwner: TComponent; Dummy: NativeInt);
var
  DesignerForm: IDesignerForm;
begin
  inherited Create(AOwner);
  FConstraints := TSizeConstraints.Create(Self);
  FConstraints.OnChange := ConstraintsChanged;
  FSystemStatusBar := TFormSystemStatusBar.Create(Self);
  if (csDesigning in ComponentState) or Supports(self, IDesignerForm, DesignerForm) then
    FFormState := FFormState + [TFMXFormState.InDesigner];
  FFormState := FFormState + [TFMXFormState.WasNotShown];
  if not TPlatformServices.Current.SupportsPlatformService(IFMXWindowService, FWinService) then
    raise EUnsupportedPlatformService.Create('IFMXWindowService');
  TPlatformServices.Current.SupportsPlatformService(IFMXCursorService, FCursorService);
  TPlatformServices.Current.SupportsPlatformService(IFMXFullScreenWindowService, FFullScreenWindowService);
  FPreloadedBorderStyling := True;
  FBorderStyle := TFmxFormBorderStyle.Sizeable;
  InitializeNewForm;
  FStateChangeMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TVKStateChangeMessage, VirtualKeyboardChangeHandler);
  FSaveStateMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TSaveStateMessage, SaveStateHandler);
  if not (csDesigning in ComponentState) then
    FSharedHint := THint.CreateNewInstance(Handle);
end;

function TCommonCustomForm.CreateBorder: TFormBorder;
begin
  Result := TFormBorder.Create(Self);
end;

procedure TCommonCustomForm.AddPreloadPropertyNames(const PropertyNames: TList<string>);
begin
  PropertyNames.Add('FormStyle');
  PropertyNames.Add('BorderStyle');
  PropertyNames.Add('EnableBorderStyling');
  PropertyNames.Add('Border.Styling');
end;

procedure TCommonCustomForm.AddRecognizer(const Recognizer: TInteractiveGesture);
var
  RecognizersService: IFMXGestureRecognizersService;
begin
  FGestureRecognizers[Recognizer] := FGestureRecognizers[Recognizer] + 1;
  //if old value is 0, make sure to send message to enable the new recognizer
  if FGestureRecognizers[Recognizer] = 1 then
    if TPlatformServices.Current.SupportsPlatformService(IFMXGestureRecognizersService, RecognizersService) then
      RecognizersService.AddRecognizer(Recognizer, Self);
end;

procedure TCommonCustomForm.AdjustSize(var ASize: TSizeF);
var
  MinWidth, MinHeight, MaxWidth, MaxHeight: Single;
begin
  if Constraints.MinWidth > 0 then
    MinWidth := Constraints.MinWidth
  else
    MinWidth := 0;
  if Constraints.MinHeight > 0 then
    MinHeight := Constraints.MinHeight
  else
    MinHeight := 0;
  if Constraints.MaxWidth > 0 then
    MaxWidth := Constraints.MaxWidth
  else
    MaxWidth := 0;
  if Constraints.MaxHeight > 0 then
    MaxHeight := Constraints.MaxHeight
  else
    MaxHeight := 0;
  { Allow override of constraints }
  ConstrainedResize(MinWidth, MinHeight, MaxWidth, MaxHeight);
  if (MaxWidth > 0) and (ASize.Width > MaxWidth) then
    ASize.Width := MaxWidth
  else if (MinWidth > 0) and (ASize.Width < MinWidth) then
    ASize.Width := MinWidth;
  if (MaxHeight > 0) and (ASize.Height > MaxHeight) then
    ASize.Height := MaxHeight
  else if (MinHeight > 0) and (ASize.Height < MinHeight) then
    ASize.Height := MinHeight;
end;

procedure TCommonCustomForm.SetPreloadProperties(const PropertyStore: TDictionary<string, Variant>);
var
  Val: Variant;
begin
  // Default
  FPreloadedBorderStyling := True;
  FBorderStyle := TFmxFormBorderStyle.Sizeable;
  // Preload
  PropertyStore.TryGetValue('FormStyle', Val);
  if (Val <> Unassigned) and (Val <> Null) then
    FFormStyle := CanFormStyle(TFormStyle(GetEnumValue(TypeInfo(TFormStyle), Val)));

  PropertyStore.TryGetValue('BorderStyle', Val);
  if (Val <> Unassigned) and (Val <> Null) then
    FBorderStyle := TFmxFormBorderStyle(GetEnumValue(TypeInfo(TFmxFormBorderStyle), Val));

  PropertyStore.TryGetValue('EnableBorderStyling', Val);
  if (Val <> Unassigned) and (Val <> Null) then
    FPreloadedBorderStyling := Val;

  PropertyStore.TryGetValue('Border.Styling', Val);
  if (Val <> Unassigned) and (Val <> Null) then
    FPreloadedBorderStyling := Val;
end;

function TCommonCustomForm.GetOriginalContainerSize: TPointF;
begin
  Result := FOriginalContainerSize;
  if (Result.X < 0) or (Result.Y < 0)  then
    Result := TPointF.Create(GetContainerWidth, GetContainerHeight);
end;

function TCommonCustomForm.GetRecognizers: TInteractiveGestures;
var
  Gesture: TInteractiveGesture;
begin
  Result := [];
  for Gesture:= Low(FGestureRecognizers) to High(FGestureRecognizers) do
    if FGestureRecognizers[Gesture] > 0 then
      Result := Result + [Gesture];
end;

procedure TCommonCustomForm.PreloadProperties;
var
  PropertyStore: TDictionary<string, Variant>;
  PropertyNames: TList<string>;
begin
  // Optimization - to remove recreation of handle on loading
  PropertyStore := TDictionary<string,Variant>.Create;
  PropertyNames := TList<string>.Create;
  try
    AddPreloadPropertyNames(PropertyNames);
    ReadResource(ClassType, PropertyNames.ToArray, PropertyStore);
    SetPreloadProperties(PropertyStore);
  finally
    PropertyNames.Free;
    PropertyStore.Free;
  end;
end;

type
  TBoundsCommonCustomForm = class(TBounds)
  private
    FForm: TCommonCustomForm;
  protected
    procedure DoChange; override;
  public
    constructor Create(AForm: TCommonCustomForm); reintroduce;
  end;

constructor TBoundsCommonCustomForm.Create(AForm: TCommonCustomForm);
begin
  inherited Create(TRectF.Create(0, 0, 0, 0));
  FForm := AForm;
end;

procedure TBoundsCommonCustomForm.DoChange;
begin
  inherited;
  if FForm <> nil then
    FForm.DoPaddingChanged;
end;

procedure TCommonCustomForm.InitializeNewForm;
var
  LBorderStyle: TFmxFormBorderStyle;
begin
  FUpdating := 0;
  FShowHint := True;
  FBounds := TRectF.Create(TPointF.Zero, 640, 480);
  FPadding := TBoundsCommonCustomForm.Create(Self);
  FBorderIcons := [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
  FPosition := TFormPosition.DefaultPosOnly;
  FFormFactor := TFormFactor.Create;
  FFormFamily := string.Empty;
  FBorder := CreateBorder;
  LBorderStyle := FBorderStyle;
  try
    CreateHandle;
  finally
    if FBorderStyle <> LBorderStyle then
    begin
      FBorderStyle := LBorderStyle;
      FHandleState := THandleState.Changed;
    end;
  end;
  FDefaultWindowRect := FWinService.GetWindowRect(Self);
  FDefaultClientSize := FWinService.GetClientSize(Self);
  if FDefaultClientSize.Height < 1 then
  begin
    FDefaultClientSize := FBounds.Size - FDefaultWindowRect.Size;
    FDefaultWindowRect := TRectF.Create(0, 0, FBounds.Width, FBounds.Height);
  end;

  Screen.AddForm(Self);
  FScaleChangedId := TMessageManager.DefaultManager.SubscribeToMessage(TScaleChangedMessage, ScaleChangedHandler);
  FStyleChangedId := TMessageManager.DefaultManager.SubscribeToMessage(TStyleChangedMessage, StyleChangedHandler);
end;

function TCommonCustomForm.SetMainMenu(Value: TComponent): Boolean;
var
  LMainMenuNative: INativeControl;
  procedure Clear;
  begin
    if FMainMenuNative <> nil then
    begin
      FMainMenuNative.SetHandle(0);
      FMainMenuNative := nil;
    end;
    if FMainMenu <> nil then
    begin
      FMainMenu.RemoveFreeNotification(self);
      FMainMenu := nil;
    end;
  end;
begin
  try
    if Value <> nil then
    begin
      Result := (Value is TMainMenu) and Value.GetInterface(INativeControl, LMainMenuNative);
      if Result then
      begin
        Clear;
        if not (csDestroying in Value.ComponentState) then
        begin
          FMainMenu := Value;
          FMainMenu.FreeNotification(self);
          FMainMenuNative := LMainMenuNative;
        end;
      end;
    end
    else
    begin
      Result := True;
      Clear;
    end;
  except
    Result := False;
  end;
end;

procedure TCommonCustomForm.SetModalResult(Value: TModalResult);
begin
  FModalResult := Value;
  //If Im in async mode...
  if Assigned(FResultProc) and (FModalResult <> mrNone) and not FWinService.CanShowModal then
    Close;
end;

destructor TCommonCustomForm.Destroy;
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  TMessageManager.DefaultManager.Unsubscribe(TSaveStateMessage, FSaveStateMessageId);
  FreeAndNil(FSaveState);
  SetMainMenu(nil);
  TMessageManager.DefaultManager.Unsubscribe(TStyleChangedMessage, FStyleChangedId);
  TMessageManager.DefaultManager.Unsubscribe(TScaleChangedMessage, FScaleChangedId);
  FreeAndNil(FTabList);
  FreeAndNil(FSharedHint);
  FreeAndNil(FHintReceiverList);
  FreeAndNil(FSystemStatusBar);
  FreeAndNil(FConstraints);

  if Application <> nil then
    Application.FormDestroyed(Self);
  if FActiveControl <> nil then
  begin
    FActiveControl.RemoveFreeNotify(Self);
    FActiveControl := nil;
  end;
  if FTarget <> nil then
  begin
    FTarget.RemoveFreeNotify(Self);
    FTarget := nil;
  end;
  if FHovered <> nil then
  begin
    FHovered.RemoveFreeNotify(Self);
    FHovered := nil;
  end;
  if FFocused <> nil then
  begin
    FFocused.RemoveFreeNotify(Self);
    FFocused := nil;
  end;
  if FCaptured <> nil then
  begin
    FCaptured.RemoveFreeNotify(Self);
    FCaptured := nil;
  end;
  if FOldActiveForm <> nil then
  begin
    FOldActiveForm.RemoveFreeNotify(Self);
    FOldActiveForm := nil;
  end;
  ReleaseLastHinted;
  DestroyHandle;
  FreeAndNil(FBorder);
  FreeAndNil(FPadding);
  FreeAndNil(FFormFactor);
  FreeAndNil(FTouchManager);
  if Screen <> nil then
    Screen.RemoveForm(Self);
  FCursorService := nil;
  FWinService := nil;
  TMessageManager.DefaultManager.Unsubscribe(TVKStateChangeMessage, FStateChangeMessageId);
  if not (TFmxFormState.Released in FormState) then
    TMessageManager.DefaultManager.SendMessage(Self, TFormReleasedMessage.Create);
  inherited;
  if TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService, AccelKeyService) then
    AccelKeyService.RemoveRegistry(Self);
end;

procedure TCommonCustomForm.CreateChildFormList(Parent: TFmxObject; var List: TList<TCommonCustomForm>);
var
  I: Integer;
  Child: TFmxObject;
begin
  if List = nil then
    List := TList<TCommonCustomForm>.Create;
  if Parent = nil then
    Parent := Self;

  for I := 0 to Parent.ChildrenCount - 1 do
  begin
    Child := Parent.Children[I];
    if (Child is TCommonCustomForm) and not List.Contains(TCommonCustomForm(Child)) then
      List.Add(TCommonCustomForm(Child));
    if Child.ChildrenCount > 0 then
      CreateChildFormList(Child, List);
  end;
end;

procedure TCommonCustomForm.CreateHandle;
var
  List: TList<TCommonCustomForm>;
  I: Integer;
  WindowsTouchService: IFMXWindowsTouchService;
begin
  FHandleState := THandleState.Normal;
  FHandle := FWinService.CreateWindow(Self);
  if TFmxFormState.Recreating in FormState then
    FWinService.SetWindowRect(Self, FBounds);
  List := nil;
  try
    CreateChildFormList(Self, List);
    for I := 0 to List.Count - 1 do
      List[I].Recreate;
  finally
    FreeAndNil(List);
  end;
  RecreateOsMenu;
  if TFmxFormState.Recreating in FormState then
    RestoreGesturesRecognizer;
  if TPlatformServices.Current.SupportsPlatformService(IFMXWindowsTouchService, WindowsTouchService) then
    WindowsTouchService.HookTouchHandler(Self);
  if Application.MainForm = Self then
    TMessageManager.DefaultManager.SendMessage(Self, TMainFormChangedMessage.Create(Self));
  TMessageManager.DefaultManager.SendMessage(Self, TAfterCreateFormHandle.Create(Self));
end;

procedure TCommonCustomForm.DestroyHandle;
var
  List: TList<TCommonCustomForm>;
  I: Integer;
  WindowsTouchService: IFMXWindowsTouchService;
begin
  FHandleState := THandleState.Normal;
  if FHandle <> nil then
  begin
    TMessageManager.DefaultManager.SendMessage(Self, TBeforeDestroyFormHandle.Create(Self));
    if TPlatformServices.Current.SupportsPlatformService(IFMXWindowsTouchService, WindowsTouchService) then
      WindowsTouchService.UnhookTouchHandler(Self);
    if FMainMenuNative <> nil then
      FMainMenuNative.SetHandle(0);
    FreeAndNil(FSharedHint);
    List := nil;
    try
      CreateChildFormList(Self, List);
      for I := List.Count - 1 downto 0 do
        List[I].DestroyHandle;
    finally
      FreeAndNil(List);
    end;
    FWinService.DestroyWindow(Self);
    FreeAndNil(FHandle);
  end;
end;

procedure TCommonCustomForm.AfterConstruction;
begin
  inherited;
  ResizeHandle;
  FBoundChanges := [];
  if Assigned(FOnCreate) then
    FOnCreate(Self);
  Resize;
end;

procedure TCommonCustomForm.BeforeDestruction;

  procedure SaveStateNotifyCheck;
  var
    SaveStateService: IFMXSaveStateService;
  begin
    if not TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService, SaveStateService) or
      not SaveStateService.Notifications then
      SaveStateHandler(Self, nil);
  end;

var
  I: Integer;
begin
  SaveStateNotifyCheck;
  if Assigned(FOnDestroy) then
    FOnDestroy(Self);
  for I := 0 to ChildrenCount - 1 do
    if Children[I] = Owner then
    begin
      Children[I].Parent := nil;
      Break;
    end;
  inherited;
end;

procedure TCommonCustomForm.DoPaddingChanged;
begin
  Realign;
end;

procedure TCommonCustomForm.Realign;
begin
end;

procedure TCommonCustomForm.RecreateOsMenu;
var
  I: Integer;
begin
  if ([csDesigning, csLoading, csDestroying] * ComponentState = []) and ([TFmxFormState.Recreating] * FormState = []) then
    for I := 0 to ComponentCount - 1 do
      if SetMainMenu(Components[I]) then
      begin
        if FMainMenu <> nil then
          TMainMenu(FMainMenu).RecreateOSMenu;
        ResizeHandle;
        Break;
      end;
end;

procedure TCommonCustomForm.RecreateResources;
begin
end;

procedure TCommonCustomForm.RegisterHintReceiver(const AReceiver: IHintReceiver);
begin
  if THint.ContainsRegistredHintClasses then
  begin
    if FHintReceiverList = nil then
      FHintReceiverList := TList<IHintReceiver>.Create;
    FHintReceiverList.Add(AReceiver);
  end;
end;

procedure TCommonCustomForm.Recreate;
var
  OldActiveForm: TCommonCustomForm;
  LClientSize: TSizeF;
begin
  if ([csDesigning, csLoading, csDestroying, csUpdating] * ComponentState = []) and
     ([TFmxFormState.Recreating] * FormState = []) and
     (([TFmxFormState.WasNotShown] * FormState = []) or
      (FHandleState = THandleState.NeedRecreate) or
      ([TFmxFormState.Showing] * FormState <> [])) then
  begin
    if (FUpdating > 0) then
      Exit;
    Include(FFormState, TFmxFormState.Recreating);
    try
      OldActiveForm := Screen.ActiveForm;
      try
        if (FormStyle <> TFormStyle.Popup) and ([TFmxFormState.Showing, TFmxFormState.WasNotShown] * FormState = []) then
          LClientSize := FWinService.GetClientSize(Self);
        DestroyHandle;
        FBorder.Recreate;
        CreateHandle;
        if (FormStyle <> TFormStyle.Popup) and ([TFmxFormState.Showing, TFmxFormState.WasNotShown] * FormState = []) then
          FWinService.SetClientSize(Self, LClientSize);
        Realign;
        if Visible and ([TFmxFormState.Showing] * FormState = []) then
          FWinService.ShowWindow(Self);
      finally
        if OldActiveForm <> nil then
          OldActiveForm.Active := True;
      end;
    finally
      Exclude(FFormState, TFmxFormState.Recreating);
      RecreateOsMenu;
    end;
  end
  else
    if [csDesigning] * ComponentState = [] then
      FHandleState := THandleState.Changed;
end;

procedure TCommonCustomForm.PaintRects(const UpdateRects: array of TRectF);
begin
end;

function TCommonCustomForm.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // Route the QueryInterface through the Designer first
  if (Designer = nil) or (Designer.QueryInterface(IID, Obj) <> 0) then
    Result := inherited QueryInterface(IID, Obj)
  else
    Result := 0;
end;

function TCommonCustomForm.CloseQuery: Boolean;
begin
  Result := True;
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, Result);
end;

procedure TCommonCustomForm.CMGesture(var EventInfo: TGestureEventInfo);
var
  Handled: Boolean;
  LGObj: IGestureControl;
begin
  Handled := False;

  if Assigned(FOnGesture) then
    try
      FOnGesture(Self, EventInfo, Handled);
    except
      Application.HandleException(Self);
    end;

  if not Handled then
    try
      DoGesture(EventInfo, Handled);
    except
      Application.HandleException(Self);
    end;

  if not Handled then
    if (EventInfo.GestureID <> sgiNoGesture) and Supports(Parent, IGestureControl, LGObj) then
      LGObj.CMGesture(EventInfo)
end;

procedure TCommonCustomForm.ConstrainedResize(var AMinWidth, AMinHeight, AMaxWidth, AMaxHeight: Single);
begin
  if Assigned(FOnConstrainedResize) then
    FOnConstrainedResize(Self, AMinWidth, AMinHeight, AMaxWidth, AMaxHeight);
end;

procedure TCommonCustomForm.ConstraintsChanged(Sender: TObject);
var
  ConstraintsService: IFMXWindowConstraintsService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXWindowConstraintsService, ConstraintsService) then
    ConstraintsService.SetConstraints(Self, Constraints.MinWidth, Constraints.MinHeight, Constraints.MaxWidth, Constraints.MaxHeight);

  if not (csLoading in ComponentState) then
    SetBoundsF(FBounds);
end;

procedure TCommonCustomForm.ReleaseForm;
begin
  if not (TFmxFormState.Released in FFormState) then
  begin
    FWinService.ReleaseWindow(Self);
    Screen.RemoveForm(Self);
    FFormState := FFormState + [TFmxFormState.Released];
    if (TFmxFormState.Engaged in FormState) and not (csDesigning in ComponentState) then
      FWinService.HideWindow(Self);
    TThread.CurrentThread.ForceQueue(nil,
      procedure
      begin
        Free;
      end);
    TMessageManager.DefaultManager.SendMessage(Self, TFormReleasedMessage.Create);
  end;
end;

function TCommonCustomForm.Close: TCloseAction;
var
  NeedActiveChange: boolean;
  procedure CloseAllViews;
  var
    View: IMenuView;
    LParent: TFmxObject;
    procedure FindView(Obj: TFmxObject);
    var
      I: Integer;
    begin
      I := 0;
      while (I < Obj.ChildrenCount) and not Obj.Children[I].GetInterface(IMenuView, View) do
        Inc(I);
      I := 0;
      while (I < Obj.ChildrenCount) and (View = nil) do
      begin
        FindView(Obj.Children[I]);
        Inc(I);
      end;
    end;
  begin
    View := nil;
    LParent := Self;
    if LParent.Parent <> nil then
      LParent := LParent.Parent;
    FindView(LParent);
    if (View <> nil) and View.Loop then
      repeat
        View.Loop := False;
        View := View.ChildView;
      until View = nil;
  end;

  procedure ActivateLastActiveForm(const OldActiveForm: TCommonCustomForm);
  var
    I: Integer;
  begin
    if OldActiveForm <> nil then
      for I := Screen.FormCount - 1 downto 0 do
        if (Screen.Forms[I].Visible) and (Screen.Forms[I] <> OldActiveForm) then
        begin
          Screen.ActiveForm := Screen.Forms[I];
          Exit;
        end;
  end;

begin
  Result := TCloseAction.caNone;
  if not (TFmxFormState.Closing in FFormState) then
  begin
    Include(FFormState, TFmxFormState.Closing);
    try
      NeedActiveChange := not (TFmxFormState.Modal in FFormState) and Active;
      if TFmxFormState.Modal in FFormState then
        ModalResult := mrCancel
      else if CloseQuery then
      begin
        Result := TCloseAction.caHide;
        DoClose(Result);
        if Result <> TCloseAction.caNone then
        begin
          if NeedActiveChange then
            ActivateLastActiveForm(Self);
          if Application.MainForm = Self then
            Application.Terminate
          else
          begin
            CloseAllViews;
            case Result of
              TCloseAction.caHide:
                Hide;
              TCloseAction.caFree:
                ReleaseForm;
              TCloseAction.caMinimize:
                WindowState := TWindowState.wsMinimized;
            end;
          end;
        end;
      end;
    finally
      Exclude(FFormState, TFmxFormState.Closing);
    end;
  end;
end;

procedure TCommonCustomForm.ShowInDesigner;
begin
{$IFDEF MSWINDOWS}
  // Exclude the recursive call
  if (FFormState * [TFmxFormState.Showing]) <> [] then
    Exit;
  // Change the form state
  FFormState := FFormState + [TFmxFormState.Showing];
  try
    try
      if TFmxFormState.WasNotShown in FormState then
        SetBoundsF(FBounds);
      DesignerUpdateBorder;
    finally
      FFormState := FFormState - [TFmxFormState.WasNotShown];
    end;
  finally
    // Restore form state
    FFormState := FFormState - [TFmxFormState.Showing];
  end;
{$ENDIF}
end;

procedure TCommonCustomForm.ShowModal(const ResultProc: TProc<TModalResult>);
begin
  FResultProc := ResultProc;
  if FWinService.CanShowModal then
    ShowModal
  else
  begin
    ModalResult := mrNone;
    Show;
  end;
end;

function TCommonCustomForm.SharedHint: THint;
begin
  if FSharedHint = nil then
    FSharedHint := THint.CreateNewInstance(Handle);
  Result := FSharedHint;
end;

procedure TCommonCustomForm.Show;
var
  Positioner: IFMXFormPositionerService;
begin
  // Exclude the recursive call
  if (FFormState * [TFmxFormState.Showing]) <> [] then
    Exit;
  if CanShow then
  begin
    // Change the form state
    Include(FFormState, TFmxFormState.Showing);
    try
      HandleNeeded;
      try
        if TFmxFormState.WasNotShown in FormState then
          if TPlatformServices.Current.SupportsPlatformService(IFMXFormPositionerService, Positioner) then
            Positioner.PlaceOnScreen(Self, FPosition)
          else
            TDefaultFormPositionerService.PlaceByDefault(Self, FPosition);
        if FFullScreen then
        begin
          SetFullScreen(True);
          FFullScreen := False;
        end;
        TMessageManager.DefaultManager.SendMessage(nil, TFormBeforeShownMessage.Create(Self));
        FWinService.ShowWindow(Self);
        if GetActiveControl <> nil then
          GetActiveControl.SetFocus;
        FVisible := True;
        DoShow;
        Activate;
      finally
        Exclude(FFormState, TFmxFormState.WasNotShown);
      end;
    finally
      // Restore form state
      Exclude(FFormState, TFmxFormState.Showing);
    end;
  end
  else if Visible then
  begin
    BringToFront;
    Activate;
  end;
end;

procedure TCommonCustomForm.HandleNeeded;
begin
  if (FHandleState in [THandleState.Changed, THandleState.NeedRecreate]) or (FHandle = nil) then
  begin
    FHandleState := THandleState.NeedRecreate;
    Recreate;
  end;
end;

procedure TCommonCustomForm.HandleNeed;
begin
  HandleNeeded;
end;

procedure TCommonCustomForm.Hide;
begin
  // NextActiveForm uses current visible form for determination previous form for activation,
  // so we need to invoke this method before FVisible := False.
  if Active then
    Screen.NextActiveForm(Self);
  FVisible := False;
  if not (csDesigning in ComponentState) then
    FWinService.HideWindow(Self);
  DoHide;
  if GetFullScreen then
  begin
    FFullScreen := True;
    SetFullScreen(False);
  end;
end;

procedure TCommonCustomForm.BringToFront;
begin
  inherited;
  FWinService.BringToFront(self);
end;

procedure TCommonCustomForm.BroadcastGesture(EventInfo: TGestureEventInfo);
var
  LItem: TGestureCollectionItem;
  LAction: TCustomAction;
  LGObj: IGestureControl;
begin
  // Find the control that will respond to the gesture.
  LItem := nil;
  if (Touch <> nil) and (Touch.GestureManager <> nil) then
    if EventInfo.GestureID <> sgiNoGesture then
      LItem := TGestureCollectionItem(Touch.GestureManager.FindGesture(Self, EventInfo.GestureID));

  if LItem <> nil then
  begin
    // Execute the action or notify the control.
    if not (csDesigning in Self.ComponentState) and (LItem <> nil) and
      (LItem.Action <> nil) and (LItem.ActionLink <> nil) then
    begin
      if LItem.ActionLink.Action is TCustomAction then
        LAction := TCustomAction(LItem.ActionLink.Action)
      else
        LAction := nil;
      if LAction <> nil then
      begin
        if not LAction.Supported then
          Exit;
        LAction.Target := Self;
      end;
      try
        if not LItem.ActionLink.Execute(Self) then
          ExecuteAction(LItem.ActionLink.Action);
      finally
        if LAction <> nil then
          LAction.Target := nil;
      end;
    end
    else if Self <> nil then
    begin
      EventInfo.Location := ScreenToClient(EventInfo.Location);
      CMGesture(EventInfo);
    end;
  end
  else if Supports(Parent, IGestureControl, LGObj) then
    LGObj.BroadcastGesture(EventInfo);
end;

procedure TCommonCustomForm.SendToBack;
begin
  inherited;
  FWinService.SendToBack(self);
end;

function TCommonCustomForm.ShowModal: TModalResult;
begin
  Include(FFormState, TFmxFormState.Modal);
  try
    FOldActiveForm := Screen.ActiveForm;
    if FOldActiveForm <> nil then
      FOldActiveForm.AddFreeNotify(Self);
    // Setting the focus to a component on another form deactivates the currently active form. So it's important to
    // set focus immediately after receiving the current active form.
    if GetActiveControl <> nil then
      GetActiveControl.SetFocus;
    try
      TMessageManager.DefaultManager.SendMessage(nil, TFormBeforeShownMessage.Create(Self));
      Result := FWinService.ShowWindowModal(Self);
    finally
      if FOldActiveForm <> nil then
      begin
        try
          // A developer can show another form after ShowWindowModal. In this case we should keep new ActiveForm and
          // don't change it. So we activate previous form only, if there are no any forms.
          if FOldActiveForm.Visible and (Screen.ActiveForm = nil) then
            Screen.ActiveForm := FOldActiveForm;
        finally
          FOldActiveForm.RemoveFreeNotify(Self);
          FOldActiveForm := nil;
        end;
      end;
    end;
  finally
    Exclude(FFormState, TFmxFormState.Modal);
  end;
end;

function TCommonCustomForm.CloseModal: TCloseAction;
begin
  try
    Result := TCloseAction.caNone;
    if CloseQuery then
    begin
      Result := TCloseAction.caHide;
      DoClose(Result);
    end;
    case Result of
      TCloseAction.caNone:
        ModalResult := mrNone;
      TCloseAction.caFree:
        ReleaseForm;
    end;
  except
    ModalResult := mrNone;
    Application.HandleException(Self);
  end;
end;

procedure TCommonCustomForm.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  SetBoundsF(ALeft, ATop, AWidth, AHeight);
end;

procedure TCommonCustomForm.SetBoundsF(const ALeft, ATop, AWidth, AHeight: Single);

  function IsFirstShowing: Boolean;
  begin
    Result := [TFmxFormState.WasNotShown, TFmxFormState.Showing] * FormState = [TFmxFormState.WasNotShown,
               TFmxFormState.Showing];
  end;

var
  BoundsFromHandle: TRectF;
  NewSize: TSizeF;
  IsSizeChanged, IsPositionChanged, LIsFirstShowing: Boolean;
begin
  IsSizeChanged := FBounds.Size <> TSizeF.Create(AWidth, AHeight);
  IsPositionChanged := FBounds.TopLeft <> TPointF.Create(ALeft, ATop);
  if not (csLoading in ComponentState) and ([TFmxFormState.Showing] * FormState = []) then
  begin
    if IsSizeChanged then
      Include(FBoundChanges, TBoundChange.Size);
    if IsPositionChanged then
      Include(FBoundChanges, TBoundChange.Location);
  end;
  LIsFirstShowing := IsFirstShowing;
  if IsSizeChanged or IsPositionChanged or LIsFirstShowing then
  begin
    NewSize := TSizeF.Create(AWidth, AHeight);
    if TPlatformServices.Current.SupportsPlatformService(IFMXWindowConstraintsService) then
      AdjustSize(NewSize);
    FBounds := TRectF.Create(TPointF.Create(ALeft, ATop), NewSize.Width, NewSize.Height);
    if not (TFmxFormState.WasNotShown in FormState) or (csDesigning in ComponentState) or LIsFirstShowing then
    begin
      // This procedure can be called by the platform in response to a change coming
      // from another source. Check to see if the actual size reported by the
      // platform indicates we actually need to change the value;
      BoundsFromHandle := FWinService.GetWindowRect(Self);
      if FBounds <> BoundsFromHandle then
        FWinService.SetWindowRect(Self, FBounds);
      if IsSizeChanged or LIsFirstShowing or (csDesigning in ComponentState) then
      begin
        ResizeHandle;
        Resize;
        TMessageManager.DefaultManager.SendMessage(Self, TSizeChangedMessage.Create(TSize.Create(Width, Height)));
      end;
    end;
  end;
end;

procedure TCommonCustomForm.SetBoundsF(const ARect: TRectF);
begin
  SetBoundsF(ARect.Left, ARect.Top, ARect.Width, ARect.Height);
end;

procedure TCommonCustomForm.SetBounds(const ARect: TRect);
begin
  SetBoundsF(ARect);
end;

procedure TCommonCustomForm.IsDialogKey(const Key: Word; const KeyChar: WideChar; const Shift: TShiftState;
  var IsDialog: Boolean);
begin
  IsDialog := (KeyChar < ' ') or ((Shift * [ssAlt, ssCtrl, ssCommand]) <> []);
end;

function TCommonCustomForm.IsHandleAllocated: Boolean;
begin
  Result := FHandle <> nil;
end;

class function TCommonCustomForm.IsPopupForm(const AForm: TCommonCustomForm): Boolean;
begin
  Result := (AForm <> nil) and AForm.IsPopupForm;
end;

function TCommonCustomForm.IsPopupForm: Boolean;
begin
  Result := (FormStyle = TFormStyle.Popup) or (Owner is TPopup) or (Self is TCustomPopupForm);
end;

procedure TCommonCustomForm.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  LIsDialog: Boolean;
  I: Integer;
  Control: IControl;
begin
  if DispatchAcceleratorKey(Key, KeyChar, Shift) then
  begin
    Key := 0;
    KeyChar := #0;
    Exit;
  end;

  Engage;
  try
    { dialog key }
    LIsDialog := False;
    IsDialogKey(Key, KeyChar, Shift, LIsDialog);
    if LIsDialog and DispatchDialogKey(Key, KeyChar, Shift) then
    begin
      Key := 0;
      KeyChar := #0;
      Exit;
    end;

    { change focus }
    if Key = vkTab then
    begin
      AdvanceTabFocus(not (ssShift in Shift));
      Key := 0;
      Exit;
    end;

    { focused handler }
    if (Key <> 0) or (KeyChar <> #0) then
    begin
      if FFocused <> nil then
        FFocused.KeyDown(Key, KeyChar, Shift);
      if (Key <> 0) or (KeyChar <> #0) then
        DoKeyDown(Key, KeyChar, Shift);
    end;

    { perform DialogKeyLater in other }
    if LIsDialog then
    begin
      if Key <> 0 then
        for I := ChildrenCount - 1 downto 0 do
        begin
          if (FFocused <> nil) and (Children[I] = FFocused.GetObject) then
            Continue;
          if Supports(Children[I], IControl, Control) and Control.AbsoluteEnabled then
            Control.AfterDialogKey(Key, Shift);
          if Key = 0 then
            Exit;
        end;

      if Supports(FFocused, IControl, Control) and Control.AbsoluteEnabled then
        Control.AfterDialogKey(Key, Shift);
    end;
  finally
    Disengage;
    Application.FLastKeyPress := Application.FLastUserActive;
  end;
end;

procedure TCommonCustomForm.AdvanceTabFocus(const MoveForward: Boolean);

  function FindNextFocusControl(const ATraversable: ITabStopController; const ACurrentFocused: IControl): IControl;
  var
    Traversable: ITabStopController;
    TabStop: IControl;
    AsChild: IControl;
    AsContent: IContent;
    Climb: Boolean;
  begin
    Result := nil;
    Traversable := ATraversable;
    TabStop := ACurrentFocused;
    Climb := False;
    while (Traversable <> nil) and (Result = nil) do
    begin
      Result := Traversable.TabList.FindNextTabStop(TabStop, MoveForward, Climb);
      if (Result = nil) and Supports(Traversable, IControl, AsChild) then
      begin
        Climb := True;
        Traversable := AsChild.GetTabStopController;
        TabStop := AsChild;
        if Supports(TabStop, IContent, AsContent) then
          Supports(AsContent.Parent, IControl, TabStop);
      end
      else
        Traversable := nil;
    end;
  end;

var
  NextFocusControl: IControl;
  TabStop: IControl;
begin
  if FFocused = nil then
    NextFocusControl := FindNextFocusControl(Self, nil)
  else if Supports(FFocused, IControl, TabStop) then
  begin
    NextFocusControl := FindNextFocusControl(TabStop.GetTabStopController, TabStop);
    // Possibly we reached end of form and should search next focus control from beginning
    if NextFocusControl = nil then
      NextFocusControl := FindNextFocusControl(Self, nil);
  end;

  if NextFocusControl <> nil then
    NextFocusControl.SetFocus;
end;

procedure TCommonCustomForm.KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  Engage;
  try
    if FFocused <> nil then
      FFocused.KeyUp(Key, KeyChar, Shift);
    DoKeyUp(Key, KeyChar, Shift);
  finally
    Disengage;
    Application.FLastKeyPress := Application.FLastUserActive;
  end;
end;

procedure TCommonCustomForm.Loaded;
begin
  inherited;
  Visible := FExplicitVisible;
  FLastWidth := GetOriginalContainerSize.X;
  FLastHeight := GetOriginalContainerSize.Y;
  if (FHandleState in [THandleState.NeedRecreate, THandleState.Changed]) or (csDesigning in ComponentState) then
    Recreate;
  if FStyleBookChanged then
    UpdateStyleBook;
  RecreateOsMenu;
  DesignerUpdateBorder;
end;

function TCommonCustomForm.ObjectAtPoint(AScreenPoint: TPointF): IControl;
var
  I: Integer;
begin
  for I := ChildrenCount - 1 downto 0 do
    if Supports(Children[I], IControl, Result) and Result.GetVisible then
    begin
      Result := Result.ObjectAtPoint(AScreenPoint);
      if Result <> nil then
        Exit;
      end;
  Result := nil;
end;

procedure TCommonCustomForm.MouseDown(Button: TMouseButton; Shift: TShiftState; AFormX, AFormY: Single);
var
  LocalPoint: TPointF;
  Obj: IControl;
  SG: ISizeGrip;
  NewCursor: TCursor;
begin
  Engage;
  try
    { translate coord }
    FMousePos := TPointF.Create(AFormX, AFormY);
    FDownPos := FMousePos;
    NewCursor := Cursor;  // use the form cursor only if no control has been clicked
    Obj := ObjectAtPoint(ClientToScreen(FMousePos));
    if Obj <> nil then
    begin
      LocalPoint := Obj.ScreenToLocal(ClientToScreen(FMousePos));
      if Supports(Obj, ISizeGrip, SG) then
      begin
        Obj.MouseDown(Button, Shift, LocalPoint.X, LocalPoint.Y);
        StartWindowResize;
      end
      else
      begin
        if (Obj.DragMode = TDragMode.dmAutomatic) and (Button = TMouseButton.mbLeft) then
          Obj.BeginAutoDrag
        else
          Obj.MouseDown(Button, Shift, LocalPoint.X, LocalPoint.Y);
        if ClientRect.Contains(FMousePos) then
          NewCursor := Obj.Cursor;
      end
    end
    else
      DoMouseDown(Button, Shift, AFormX, AFormY);

    if FCursorService <> nil then
      FCursorService.SetCursor(NewCursor);
  finally
    Disengage;
  end;
end;

procedure TCommonCustomForm.MouseLeave;
begin
  MouseMove([], FormUseDefaultPosition, FormUseDefaultPosition);
  SetHovered(nil);
end;

procedure TCommonCustomForm.MouseMove(Shift: TShiftState; AFormX, AFormY: Single);
var
  P: TPointF;
  Obj: IControl;
  SG: ISizeGrip;
  NewCursor: TCursor;
  ScreenMousePos: TPointF;
begin
  Engage;
  try
    NewCursor := Cursor;
    { drag }
    if FDragging then
    begin
      SetBoundsF(FBounds.Left + (AFormX - FDownPos.X), FBounds.Top + (AFormY - FDownPos.Y), FBounds.Width, FBounds.Height);
      Exit;
    end;
    { Form's Resizing }
    if FResizing then
    begin
      FResizeSize.X := Round(FResizeSize.X + (AFormX - FMousePos.X));
      FResizeSize.Y := Round(FResizeSize.Y + (AFormY - FMousePos.Y));
      SetBoundsF(FBounds.Left, FBounds.Top, Round(FResizeSize.X), Round(FResizeSize.Y));
      if FCursorService <> nil then
        FCursorService.SetCursor(crSizeNWSE);
      FMousePos := PointF(AFormX, AFormY);
      Exit;
    end;
    { translate coord }
    FMousePos := PointF(AFormX, AFormY);
    ScreenMousePos := ClientToScreen(FMousePos);
    if FCaptured <> nil then
    begin
      if FCursorService <> nil then
      begin
        if Supports(FCaptured, ISizeGrip, SG) then
          FCursorService.SetCursor(crSizeNWSE)
        else
          FCursorService.SetCursor(FCaptured.InheritedCursor);
      end;
      P := FCaptured.ScreenToLocal(ScreenMousePos);
      FCaptured.MouseMove(Shift, P.X, P.Y);
      Exit;
    end;

    Obj := ObjectAtPoint(ScreenMousePos);
    if Obj <> nil then
    begin
      SetHovered(Obj);
      P := Obj.ScreenToLocal(ScreenMousePos);
      Obj.MouseMove(Shift, P.X, P.Y);
      TriggerControlHint(Obj);
      if Supports(Obj, ISizeGrip, SG) then
        NewCursor := crSizeNWSE
      else if ClientRect.Contains(FMousePos) then
        NewCursor := Obj.InheritedCursor;
    end
    else
    begin
      DoMouseMove(Shift, AFormX, AFormY);
      SetHovered(nil);
      TriggerFormHint;
    end;
    // set cursor
    if FCursorService <> nil then
      FCursorService.SetCursor(NewCursor);
    FDownPos := FMousePos;
  finally
    Disengage;
  end;
end;

procedure TCommonCustomForm.MouseUp(Button: TMouseButton; Shift: TShiftState; AFormX, AFormY: Single; DoClick: Boolean = True);
var
  P: TPointF;
  Obj: IControl;
  NewCursor: TCursor;
begin
  Engage;
  try
    { Drag }
    if FDragging then
    begin
      FDragging := False;
      ReleaseCapture;
    end;
    { Form's Resizing }
    if FResizing then
    begin
      FResizing := False;
      ReleaseCapture;
    end;
    if FCaptured <> nil then
    begin
      P := FCaptured.ScreenToLocal(ClientToScreen(FMousePos));
      try
        if DoClick then
          FCaptured.MouseClick(Button, Shift, P.X, P.Y);
      finally
        if FCaptured <> nil then
        begin
          FCaptured.MouseUp(Button, Shift, P.X, P.Y);
          SetCaptured(nil);
        end;
      end;
      Exit;
    end;

    NewCursor := Cursor;
    Obj := ObjectAtPoint(ClientToScreen(FMousePos));
    if Obj <> nil then
    begin
      P := Obj.ScreenToLocal(ClientToScreen(FMousePos));
      try
        if DoClick then
          Obj.MouseClick(Button, Shift, P.X, P.Y);
      finally
        Obj.MouseUp(Button, Shift, P.X, P.Y);
      end;
      // we are over a control; use its cursor
      if ClientRect.Contains(FMousePos) then
        NewCursor := Obj.InheritedCursor;
    end
    else
      DoMouseUp(Button, Shift, AFormX, AFormY);

    // update the cursor
    if FCursorService <> nil then
      FCursorService.SetCursor(NewCursor);
  finally
    Disengage;
  end;
end;

procedure TCommonCustomForm.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
  Obj: IControl;
  MousePos: TPointF;
  MouseService: IFMXMouseService;
begin
  Engage;
  try
    if TPlatformServices.Current.SupportsPlatformService(IFMXMouseService, MouseService) then
    begin
      MousePos := MouseService.GetMousePos;
      { event }
      if FCaptured <> nil then
      begin
        FCaptured.MouseWheel(Shift, WheelDelta, Handled);
        Exit;
      end;
      DoMouseWheel(Shift, WheelDelta, Handled);
      if not Handled then
      begin
        Obj := ObjectAtPoint(MousePos);
        while Obj <> nil do
        begin
          Obj.MouseWheel(Shift, WheelDelta, Handled);
          if Handled then
            Break;
          Supports(Obj.Parent, IControl, Obj);
        end;
      end;
    end;
  finally
    Disengage;
  end;
end;

procedure TCommonCustomForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
{$IFDEF WIN32}
  if FDesigner <> nil then
    FDesigner.Notification(AComponent, Operation);
{$ENDIF}
  if Operation = opRemove then
  begin
    if AComponent = FStyleBook then
      StyleBook := nil;
    if AComponent = FMainMenu then
      SetMainMenu(nil);
  end;
end;

procedure TCommonCustomForm.MultiTouch(const Touches: TTouches; const Action: TTouchAction);
begin
  if Assigned(OnTouch) then
    OnTouch(Self, Touches, Action);
end;

procedure TCommonCustomForm.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if OwnedComponent is TFmxObject then
      begin
        if TFmxObject(OwnedComponent).Parent = nil then
          Proc(OwnedComponent);
      end
      else
        if not OwnedComponent.HasParent then
          Proc(OwnedComponent);
    end;
end;

procedure TCommonCustomForm.GetDeltaStreams(Proc: TGetStreamProc);
var
  DeviceBehavior: IDeviceBehavior;
  DeviceClass: TDeviceInfo.TDeviceClass;
  DisplayMetrics: TDeviceDisplayMetrics;
  LogicalScreenSize, PhysicalScreenSize: TSize;
  Devices: TArray<TDeviceInfo>;
  DeltaCandidates: TArray<string>;
  I: Integer;
begin
  if not (csDesigning in ComponentState) and TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
    DeviceBehavior, Self) then
  begin
    DeviceClass := DeviceBehavior.GetDeviceClass(Self);
    DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Self);

    // SelectDevices needs landscape-orientation coordinates to make an exact match
    if DisplayMetrics.LogicalScreenSize.Height > DisplayMetrics.LogicalScreenSize.Width then
    begin
      LogicalScreenSize := TSize.Create(DisplayMetrics.LogicalScreenSize.Height, DisplayMetrics.LogicalScreenSize.Width);
      PhysicalScreenSize := TSize.Create(DisplayMetrics.RawScreenSize.Height, DisplayMetrics.RawScreenSize.Width);
    end
    else
    begin
      LogicalScreenSize := DisplayMetrics.LogicalScreenSize;
      PhysicalScreenSize := DisplayMetrics.RawScreenSize;
    end;

    Devices := TDeviceInfo.SelectDevices(DeviceClass, PhysicalScreenSize, LogicalScreenSize, TOSVersion.Platform,
      DisplayMetrics.PixelsPerInch);
    DeltaCandidates := [];

    for I := Low(Devices) to High(Devices) do
      DeltaCandidates := DeltaCandidates + [Devices[I].ID];

    ReadComponentDeltaRes(Self, DeltaCandidates, Proc);
  end;
end;

{ Drag and Drop }

function TCommonCustomForm.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  I: Integer;
  NewObj: IControl;
begin
  Result := nil;
  for I := ChildrenCount - 1 downto 0 do
    if Supports(Children[i], IControl, NewObj) and NewObj.Visible then
    begin
      NewObj := NewObj.FindTarget(P, Data);

      if NewObj <> nil then
        Exit(NewObj);
    end;
end;

procedure TCommonCustomForm.FlipChildren(const AAllLevels: Boolean);
const
  HorizontalAlignments: set of TAlignLayout = [TAlignLayout.Left, TAlignLayout.Right, TAlignLayout.MostLeft,
                                               TAlignLayout.MostRight, TAlignLayout.FitLeft, TAlignLayout.FitRight];

  procedure ReverseAlign(const AControls: TList<TControl>);
  var
    ChildControl: TControl;
  begin
    while AControls.Count > 0 do
    begin
      ChildControl := AControls.Items[AControls.Count - 1];
      if ChildControl.Align = TAlignLayout.Left then
        ChildControl.Align := TAlignLayout.Right
      else if ChildControl.Align = TAlignLayout.Right then
        ChildControl.Align := TAlignLayout.Left
      else if ChildControl.Align = TAlignLayout.MostLeft then
        ChildControl.Align := TAlignLayout.MostRight
      else if ChildControl.Align = TAlignLayout.MostRight then
        ChildControl.Align := TAlignLayout.MostLeft
      else if ChildControl.Align = TAlignLayout.FitLeft then
        ChildControl.Align := TAlignLayout.FitRight
      else if ChildControl.Align = TAlignLayout.FitRight then
        ChildControl.Align := TAlignLayout.FitLeft;

      AControls.Delete(AControls.Count - 1);
    end;
  end;

var
  I: Integer;
  AlignList: TList<TControl>;
  ChildControl: TControl;
  FlipContainer: IFlipContainer;
  Child: TFmxObject;
begin
  if ChildrenCount = 0 then
    Exit;
  AlignList := TList<TControl>.Create;
  try
    BeginUpdate;
    try
      try
        { Collect all the Horizontal reversable alignments }
        for I := 0 to ChildrenCount - 1 do
        begin
          Child := Children[I];
          if not (Child is TControl) or not CanFlipChild(Child) then
            Continue;

          ChildControl := TControl(Child);
          if ChildControl.Align in HorizontalAlignments then
            AlignList.Add(ChildControl);
        end;

        DoFlipChildren;
      finally
        ReverseAlign(AlignList);
      end;
    finally
      EndUpdate;
    end;
  finally
    AlignList.Free;
  end;

  if AAllLevels then
    for I := 0 to ChildrenCount - 1 do
      if Supports(Children[I], IFlipContainer, FlipContainer) then
        FlipContainer.FlipChildren(True);
end;

procedure TCommonCustomForm.FreeNotification(AObject: TObject);
begin
  inherited ;
  if (FHovered <> nil) and (FHovered.GetObject = AObject) then
    FHovered := nil;
  if (FTarget <> nil) and (FTarget.GetObject = AObject) then
    FTarget := nil;
  if (FCaptured <> nil) and (FCaptured.GetObject = AObject) then
    FCaptured := nil;
  if (FFocused <> nil) and (FFocused.GetObject = AObject) then
    if csDestroying in ComponentState then
      FFocused := nil
    else
      ClearFocusedControl(True);
  if (FLastHinted <> nil) and (FLastHinted.GetObject = AObject) then
    FLastHinted := nil;
  if (FOldActiveForm <> nil) and (FOldActiveForm = AObject) then
    FOldActiveForm := nil;
  if (FActiveControl <> nil) and (FActiveControl.GetObject = AObject) then
    FActiveControl := nil;
end;

procedure TCommonCustomForm.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  if FTarget <> nil then
    FTarget.DragDrop(Data, FTarget.ScreenToLocal(Point));
end;

procedure TCommonCustomForm.DragEnter(const Data: TDragObject; const Point: TPointF);
var
  NewTarget: IControl;
begin
  NewTarget := FindTarget(Point, Data);
  if (NewTarget <> FTarget) then
  begin
    if FTarget <> nil then
    begin
      FTarget.DragLeave;
      FTarget.RemoveFreeNotify(Self);
    end;
    FTarget := NewTarget;
    if FTarget <> nil then
    begin
      FTarget.AddFreeNotify(Self);
      FTarget.DragEnter(Data, FTarget.ScreenToLocal(Point));
    end;
  end;
end;

procedure TCommonCustomForm.DragLeave;
begin
  if FTarget <> nil then
  begin
    FTarget.DragLeave;
    FTarget.RemoveFreeNotify(Self);
  end;
  FTarget := nil;
end;

procedure TCommonCustomForm.DragOver(const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
var
  NewTarget: IControl;
begin
  NewTarget := FindTarget(Point, Data);
  if (NewTarget <> FTarget) then
  begin
    if FTarget <> nil then
    begin
      FTarget.DragLeave;
      FTarget.RemoveFreeNotify(Self);
    end;
    FTarget := NewTarget;
    if FTarget <> nil then
    begin
      FTarget.AddFreeNotify(Self);
      FTarget.DragEnter(Data, FTarget.ScreenToLocal(Point));
    end;
  end;
  if FTarget <> nil then
    FTarget.DragOver(Data, FTarget.ScreenToLocal(Point), Operation);
end;

procedure TCommonCustomForm.BeginUpdate;
var
  I: Integer;
  Control: IControl;
begin
  FUpdating := FUpdating + 1;
  Updating;
  for I := 0 to ChildrenCount - 1 do
    if Supports(Children[I], IControl, Control) then
      Control.BeginUpdate;
end;

procedure TCommonCustomForm.EndUpdate;
var
  I: Integer;
  Control: IControl;
begin
  if FUpdating > 0 then
  begin
    FUpdating := FUpdating - 1;
    for I := 0 to ChildrenCount - 1 do
      if Supports(Children[I], IControl, Control) then
        Control.EndUpdate;
    if FUpdating = 0 then
    begin
      Updated;
      if (FHandleState in [THandleState.NeedRecreate, THandleState.Changed]) then
        Recreate;
    end;
  end;
end;

procedure TCommonCustomForm.Engage;
begin
  Inc(FEngageCount);
  if FEngageCount = 1 then
    Include(FFormState, TFmxFormState.Engaged);
end;

procedure TCommonCustomForm.Disengage;
begin
  if FEngageCount > 0 then
  begin
    Dec(FEngageCount);
    if FEngageCount = 0 then
      Exclude(FFormState, TFmxFormState.Engaged);
    Application.FLastUserActive := Now;
  end;
end;

function TCommonCustomForm.DispatchAcceleratorKey(const AKey: Word; const AKeyChar: WideChar; const AShift: TShiftState): Boolean;
var
  Service: IFMXAcceleratorKeyRegistryService;
begin
  Result := (AShift = [ssAlt]) and TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService, Service) and
            Service.EmitAcceleratorKey(Self, AKeyChar);
end;

function TCommonCustomForm.DispatchDialogKey(const AKey: Word; const AKeyChar: WideChar; const AShift: TShiftState): Boolean;

  function TraverseChildren(const AContainer: TFmxObject): Boolean;
  var
    I: Integer;
    Control: IControl;
  begin
    if Supports(AContainer, IControl, Control) and not Control.Enabled then
      Exit(False);
    for I := 0 to AContainer.ComponentCount - 1 do
      if (AContainer.Components[I] is TCustomActionList) and
         TCustomActionList(AContainer.Components[I]).DialogKey(AKey, AShift) then
        Exit(True);
    for I := 0 to AContainer.ChildrenCount - 1 do
      if TraverseChildren(AContainer.Children[I]) then
        Exit(True);
    Result := False;
  end;

  function OtherForms(const AIsMain: Boolean): Boolean;
  var
    I, J: Integer;
    F: TCommonCustomForm;
    LKey: Word;
  begin
    LKey := AKey;
    for I := 0 to Screen.FormCount - 1 do
      if (Screen.Forms[I] <> Self) and
         (Screen.Forms[I].Visible) and
         (AIsMain xor (Screen.Forms[I] <> Application.MainForm)) then
      begin
        F := Screen.Forms[I];
        for J := F.ChildrenCount - 1 downto 0 do
        begin
          if F.Children[J] is TMainMenu then
            TMainMenu(F.Children[J]).DialogKey(LKey, AShift);
          if LKey = 0 then
            Exit(True);
        end;
        if TraverseChildren(F) then
          Exit(True);
      end;
    Result := False;
  end;

  function IsModalState: Boolean;
  var
    I: Integer;
  begin
    for I := Screen.FormCount - 1 downto 0 do
      if TFmxFormState.Modal in Screen.Forms[I].FormState then
        Exit(True);
    Result := False;
  end;

var
  FocusPopup: TCustomPopupMenu;
  FocusObj: TFmxObject;
  Control: IControl;
  I: Integer;
  LKey: Word;
begin
  FocusPopup := nil;
  LKey := AKey;

  // 1. perform AKey in Focus Control
  if FFocused = nil then
    FocusObj := nil
  else
  begin
    FFocused.DialogKey(LKey, AShift);
    if LKey = 0 then
      Exit(True);
    FocusObj := FFocused.GetObject;
  end;

  // 2. perform AKey in PopupMenu of Focus Control
  if Supports(FocusObj, IControl, Control) then
  begin
    FocusPopup := Control.PopupMenu;
    if FocusPopup is TPopupMenu then
    begin
      TPopupMenu(FocusPopup).DialogKey(LKey, AShift);
      if LKey = 0 then
        Exit(True);
    end
    else
      FocusPopup := nil;
  end;

  // 3. perform AKey in other Menus
  for I := ChildrenCount - 1 downto 0 do
    if Children[i] <> FocusPopup then
    begin
      if Children[I] is TMainMenu then
        TMainMenu(Children[I]).DialogKey(LKey, AShift)
      else if Children[I] is TPopupMenu then
        TPopupMenu(Children[I]).DialogKey(LKey, AShift);
      if LKey = 0 then
        Exit(True);
    end;

  // 4. perform AKey in other, no focus controls
  for I := ChildrenCount - 1 downto 0 do
    if Children[I] <> FocusObj then
    begin
      if Supports(Children[I], IControl, Control) and Control.AbsoluteEnabled then
        Control.DialogKey(LKey, AShift);
      if LKey = 0 then
        Exit(True);
    end;

  // 5. perform AKey in all ActionLists in Childrens
  if TraverseChildren(Self) then
    Exit(True);

  // 6. perform AKey in all main menus and ActionLists in other forms
  if not IsModalState then
    if OtherForms(True) or OtherForms(False) then
      Exit(True);

  Result := False;
end;

procedure TCommonCustomForm.TriggerFormHint;
begin
  if Application.ShowHint and (FHint.Length > 0) and not (csDesigning in ComponentState) then
  begin
    if FLastHinted <> nil then
    begin
      SharedHint.SetHint(GetShortHint(FHint));
      SharedHint.Enabled := True;
      Application.FSharedHint := SharedHint;
      Application.FIsControlHint := False;
      ReleaseLastHinted;
      Application.Hint := FHint;
    end;
  end
  else
  begin
    Application.FSharedHint := nil;
    if FSharedHint <> nil then
      FSharedHint.Enabled := False;
    if FLastHinted <> nil then
    begin
      ReleaseLastHinted;
      Application.Hint := string.Empty;
    end;
    end;
end;

procedure TCommonCustomForm.EnterMenuLoop;
begin
  TMessageManager.DefaultManager.SendMessage(Self, TStartMenuLoopMessage.Create(Self), True);
end;

procedure TCommonCustomForm.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    FWinService.SetWindowCaption(Self, FCaption);
    DesignerUpdateBorder;
    if (Application <> nil) and (Application.MainForm = Self) then
      TMessageManager.DefaultManager.SendMessage(Self, TMainCaptionChangedMessage.Create(Self));
  end;
end;

function TCommonCustomForm.GetText: string;
begin
  Result := FCaption;
end;

procedure TCommonCustomForm.SetHeight(const Value: Integer);
begin
  SetBoundsF(FBounds.Left, FBounds.Top, FBounds.Width, Value);
end;

procedure TCommonCustomForm.SetHovered(const Value: IControl);
begin
  if (Value <> FHovered) then
  begin
    if FHovered <> nil then
    begin
      FHovered.DoMouseLeave;
      FHovered.RemoveFreeNotify(Self);
    end;
    FHovered := Value;
    if FHovered <> nil then
    begin
      FHovered.AddFreeNotify(Self);
      FHovered.DoMouseEnter;
    end;
  end;
end;

procedure TCommonCustomForm.SetLastHinted(const AControl: IControl);
begin
  ReleaseLastHinted;
  FLastHinted := AControl;
  if FLastHinted <> nil then
    FLastHinted.AddFreeNotify(Self);
end;

procedure TCommonCustomForm.SetLeft(const Value: Integer);
begin
  if (csDesigning in ComponentState) then
  begin
    DesignInfo := (DesignInfo and $FFFF0000) or (Cardinal(Value) and $FFFF);
    if not (csLoading in ComponentState) and (Position <> TFormPosition.DefaultSizeOnly) then
      Position := TFormPosition.Designed;
  end
  else
    SetBoundsF(Value, FBounds.Top, FBounds.Width, FBounds.Height);
end;

procedure TCommonCustomForm.SetPadding(const Value: TBounds);
begin
  FPadding.Assign(Value);
end;

procedure TCommonCustomForm.SetPosition(const Value: TFormPosition);
begin
  if FPosition <> Value then
  begin
    FPosition := Value;
  end;
end;

procedure TCommonCustomForm.SetTop(const Value: Integer);
begin
  if (csDesigning in ComponentState) then
  begin
    DesignInfo := (DesignInfo and $0000FFFF) or (Value shl 16);
    if not (csLoading in ComponentState) and (Position <> TFormPosition.DefaultSizeOnly) then
      Position := TFormPosition.Designed;
  end
  else
    SetBoundsF(FBounds.Left, Value, FBounds.Width, FBounds.Height);
end;

procedure TCommonCustomForm.CreateTouchManagerIfRequired;
begin
  if FTouchManager = nil then
    FTouchManager := TTouchManager.Create(Self);
end;

procedure TCommonCustomForm.SetTouchManager(const Value: TTouchManager);
begin
  CreateTouchManagerIfRequired;
  FTouchManager.Assign(Value);
end;

procedure TCommonCustomForm.SetWidth(const Value: Integer);
begin
  SetBoundsF(FBounds.Left, FBounds.Top, Value, FBounds.Height);
end;

procedure TCommonCustomForm.SetWindowState(const Value: TWindowState);
begin
  if FWindowState <> Value then
  begin
    FWindowState := Value;
    if not (csDesigning in ComponentState) then
      FWinService.SetWindowState(Self, FWindowState);
  end;
end;

procedure TCommonCustomForm.MouseCapture;
begin
  FWinService.SetCapture(Self);
end;

procedure TCommonCustomForm.Release;
begin
{$WARN SYMBOL_DEPRECATED OFF}
  inherited;
{$WARN SYMBOL_DEPRECATED DEFAULT}
end;

procedure TCommonCustomForm.ReleaseCapture;
begin
  FWinService.ReleaseCapture(Self);
end;

procedure TCommonCustomForm.ReleaseLastHinted;
begin
  if FLastHinted <> nil then
  begin
    FLastHinted.RemoveFreeNotify(Self);
    FLastHinted := nil;
  end;
end;

procedure TCommonCustomForm.RemoveRecognizer(const Recognizer: TInteractiveGesture);
var
  RecognizersService: IFMXGestureRecognizersService;
begin
  if FGestureRecognizers[Recognizer] > 0 then
  begin
    FGestureRecognizers[Recognizer] := FGestureRecognizers[Recognizer] - 1;

    // if new value is 0, make sure to send message to disable the recognizer
    if FGestureRecognizers[Recognizer] = 0 then
      if TPlatformServices.Current.SupportsPlatformService(IFMXGestureRecognizersService, RecognizersService) then
        RecognizersService.RemoveRecognizer(Recognizer, Self);
  end;
end;

procedure TCommonCustomForm.Resize;
begin
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TCommonCustomForm.ResizeHandle;
begin
  FBorder.Resize;
end;

procedure TCommonCustomForm.RestoreGesturesRecognizer;
var
  Gesture: TInteractiveGesture;
  RecognizersService: IFMXGestureRecognizersService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXGestureRecognizersService, RecognizersService) then
    Exit;

  for Gesture := Low(FGestureRecognizers) to High(FGestureRecognizers) do
    if FGestureRecognizers[Gesture] > 0 then
      RecognizersService.AddRecognizer(Gesture, Self);
end;

procedure TCommonCustomForm.Invalidate;
begin
  if not (TFMXFormState.Closing in FormState) then
    InvalidateRect(ClientRect);
end;

procedure TCommonCustomForm.InvalidateRect(R: TRectF);
begin
  if csDestroying in ComponentState then
    Exit;
  FWinService.InvalidateWindowRect(Self, R);
end;

function TCommonCustomForm.GetClientHeight: Integer;
begin
  Result := Round(FWinService.GetClientSize(Self).Y);
end;

function TCommonCustomForm.GetClientWidth: Integer;
begin
  Result := Round(FWinService.GetClientSize(Self).X);
end;

function TCommonCustomForm.GetContainerHeight: Single;
begin
  Result := ClientHeight;
end;

function TCommonCustomForm.GetContainerWidth: Single;
begin
  Result := ClientWidth;
end;

function TCommonCustomForm.GetContextHandle: THandle;
begin
  Result := FContextHandle;
end;

function TCommonCustomForm.GetTop: Integer;
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
    Result := SmallInt((DesignInfo and $FFFF0000) shr 16)
  else
    Result := Trunc(FBounds.Top);
end;

function TCommonCustomForm.GetTouchManager: TTouchManager;
begin
  CreateTouchManagerIfRequired;
  Result := FTouchManager;
end;

function TCommonCustomForm.GetWidth: Integer;
begin
  Result := Trunc(FBounds.Width);
end;

function TCommonCustomForm.GetWindowStyle: TWindowStyles;
begin
  Result := [];
end;

function TCommonCustomForm.GetLeft: Integer;
begin
  if (csDesigning in ComponentState) then
    Result := SmallInt(DesignInfo and $0000FFFF)
  else
    Result := Trunc(FBounds.Left);
end;

function TCommonCustomForm.GetListOfInteractiveGestures: TInteractiveGestures;
var
  LGObj: IGestureControl;
begin
  Result := Touch.InteractiveGestures;
  if Result = [] then
    if Supports(Parent, IGestureControl, LGObj) then
      Result := LGObj.GetListOfInteractiveGestures;
end;

procedure TCommonCustomForm.SetClientHeight(const Value: Integer);
var
  LPos: TPoint;
begin
  if [csReading, csDesignInstance] * ComponentState = [csReading] then
    FOriginalContainerSize.Y := Value;
  if TFmxFormState.WasNotShown in FormState then
    LPos := TPoint.Create(Left, Top);
  FWinService.SetClientSize(Self, PointF(ClientWidth, Value));
  if TFmxFormState.WasNotShown in FormState then
    SetBoundsF(LPos.X, LPos.Y, FBounds.Width, FBounds.Height);
end;

procedure TCommonCustomForm.SetClientWidth(const Value: Integer);
var
  LPos: TPoint;
begin
  if [csReading, csDesignInstance] * ComponentState = [csReading] then
    FOriginalContainerSize.X := Value;
  if TFmxFormState.WasNotShown in FormState then
    LPos := TPoint.Create(Left, Top);
  FWinService.SetClientSize(Self, PointF(Value, ClientHeight));
  if TFmxFormState.WasNotShown in FormState then
    SetBoundsF(LPos.X, LPos.Y, FBounds.Width, FBounds.Height);
end;

procedure TCommonCustomForm.SetConstraints(const Value: TSizeConstraints);
begin
  FConstraints.Assign(Value);
end;

procedure TCommonCustomForm.SetContextHandle(const AContextHandle: THandle);
begin
  FContextHandle := AContextHandle;
end;

procedure TCommonCustomForm.SetCursor(const Value: TCursor);

  procedure UpdateCursorIfRequired;
  var
    Obj: IControl;
    SG: ISizeGrip;
    NewCursor: TCursor;
    MousePos: TPointF;
    ScreenMousePos: TPointF;
  begin
    if FCursorService = nil then
      Exit;

    ScreenMousePos := Screen.MousePos;
    MousePos := ScreenToClient(ScreenMousePos);
    if not ClientRect.Contains(MousePos) then
      Exit;

    NewCursor := Cursor;
    Obj := ObjectAtPoint(ScreenMousePos);
    if (Obj <> nil) and not Supports(Obj, ISizeGrip, SG) then
      NewCursor := Obj.Cursor;
    FCursorService.SetCursor(NewCursor);
  end;

begin
  if FCursor <> Value then
  begin
    FCursor := Value;
    if not (csLoading in ComponentState) and not (csDesigning in ComponentState) then
      UpdateCursorIfRequired;
  end;
end;

procedure TCommonCustomForm.SetDesigner(const ADesigner: IDesignerHook);
begin
  if FDesigner <> ADesigner then
  begin
    FDesigner := ADesigner;
    DesignerUpdateBorder;
  end;
end;

procedure TCommonCustomForm.DesignerUpdateBorder;
begin
{$IFDEF WIN32}
  if (FDesigner <> nil) and
    ([csLoading, csDestroying] * ComponentState = []) and
    ([TFmxFormState.UpdateBorder, TFmxFormState.InDesigner] * FormState = [TFmxFormState.InDesigner]) and
    (([TFmxFormState.WasNotShown] * FormState = []) or ([TFmxFormState.Showing] * FormState <> [])) then
  begin
    FFormState := FFormState + [TFmxFormState.UpdateBorder];
    try
      FDesigner.UpdateBorder;
    finally
      FFormState := FFormState - [TFmxFormState.UpdateBorder];
    end;
  end;
{$ENDIF}
end;

function TCommonCustomForm.CanTransparency: Boolean;
begin
  Result := ((csDesigning in ComponentState) or
             (((Screen <> nil) and (Screen.FormCount > 0)) or
             (Application = nil) or
             ((Application.MainForm <> nil) and (Application.MainForm <> self))));
end;

procedure TCommonCustomForm.SetTransparency(const Value: Boolean);
var
  V: Boolean;
begin
  V := Value and CanTransparency;
  if FTransparency <> V then
  begin
    FTransparency := V;
    Recreate;
    Invalidate;
    DesignerUpdateBorder;
  end;
end;

procedure TCommonCustomForm.SetBorderStyle(const Value: TFmxFormBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    if not Transparency then
      Recreate;
    Border.StyleChanged;
    DesignerUpdateBorder;
  end;
end;

procedure TCommonCustomForm.SetBiDiMode(const Value: TBiDiMode);
begin
  FBiDiMode := Value;
end;

procedure TCommonCustomForm.SetBorder(const Value: TFormBorder);
begin
end;

procedure TCommonCustomForm.SetBorderIcons(const Value: TBorderIcons);
begin
  if FBorderIcons <> Value then
  begin
    FBorderIcons := Value;
    if (not Transparency) then
      Recreate;
    DesignerUpdateBorder;
  end;
end;

procedure TCommonCustomForm.SetVisible(const Value: Boolean);
begin
  FExplicitVisible := Value;
  if (FVisible <> Value) and (not (csLoading in ComponentState)) then
  begin
    if Value then
      Show
    else
      Hide;
    FExplicitVisible := FVisible;
  end;
end;

function TCommonCustomForm.GetVisible: Boolean;
begin
  if csLoading in ComponentState then
    Result := FExplicitVisible
  else
    Result := FVisible;
end;

function TCommonCustomForm.CaptionStore: boolean;
begin
  Result := (not Caption.IsEmpty and not ActionClient) or (not (ActionClient and (ActionLink <> nil) and
    ActionLink.CaptionLinked and (Action is TContainedAction)));
end;

procedure TCommonCustomForm.ChildrenAlignChanged;
begin
end;

function TCommonCustomForm.ClientRect: TRectF;
begin
  Result := TRectF.Create(TPointF.Zero, ClientWidth, ClientHeight);
end;

function TCommonCustomForm.ClientToScreen(const AFormPoint: TPointF): TPointF;
begin
  Result := FWinService.ClientToScreen(Self, AFormPoint);
end;

procedure TCommonCustomForm.DoScaleChanged;
begin
  FBorder.ScaleChanged;
end;

procedure TCommonCustomForm.ScaleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
begin
  if (not (csDestroying in ComponentState)) and
     (TScaleChangedMessage(Msg).Value = Self) then
    DoScaleChanged;
end;

procedure TCommonCustomForm.StyleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
begin
  if (Msg is TStyleChangedMessage) and (not (csDestroying in ComponentState)) and
     ([TFmxFormState.WasNotShown] * FormState = []) then
    DoStyleChanged;
end;

procedure TCommonCustomForm.SaveStateHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
begin
  if Assigned(FOnSaveState) then
    FOnSaveState(Self);
  if TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService) then
    SaveState.UpdateToSaveState;
end;

procedure TCommonCustomForm.Tap(const Location: TPointF);
var
  Obj: IControl;
begin
  Obj := ObjectAtPoint(ClientToScreen(Location));
  if Obj <> nil then
    Obj.Tap(Location)
  else
    DoTap(Location);
end;

function TCommonCustomForm.TouchManager: TTouchManager;
begin
  Result := GetTouchManager;
end;

procedure TCommonCustomForm.TriggerControlHint(const AControl: IControl);
var
  LHintString: string;
  LControl: IControl;
begin
  if not THint.ContainsRegistredHintClasses then
    Exit;
  if AControl.HasHint then
    LControl := AControl
  else
    LControl := nil;
  if LControl <> FLastHinted then
  begin
    if Application.ShowHint and (LControl <> nil) then
    begin
      SetLastHinted(AControl);
      LHintString := AControl.GetHintString;
      if (AControl.GetHintObject = nil) or not (AControl.GetHintObject is THint) then
      begin
        SharedHint.SetHint(GetShortHint(LHintString));
        SharedHint.Enabled := True;
        Application.FSharedHint := SharedHint;
        Application.FIsControlHint := False;
      end
      else
      begin
        Application.FSharedHint := THint(AControl.GetHintObject);
        Application.FSharedHint.SetHint(LHintString);
        Application.FIsControlHint := True;
      end;
      Application.Hint := LHintString;
    end
    else
    begin
      ReleaseLastHinted;
      if FSharedHint <> nil then
        FSharedHint.Enabled := False;
      Application.FSharedHint := nil;
      Application.Hint := string.Empty;
    end;
  end;
end;

procedure TCommonCustomForm.TriggerHints;
var
  I: Integer;
begin
  if (FSharedHint <> nil) and (FHintReceiverList <> nil) then
    for I := 0 to FHintReceiverList.Count - 1 do
      FHintReceiverList[I].TriggerOnHint;
end;

function TCommonCustomForm.ScreenToClient(const AScreenPoint: TPointF): TPointF;
begin
  Result := FWinService.ScreenToClient(Self, AScreenPoint);
end;

procedure TCommonCustomForm.ActionChange(Sender: TBasicAction;
  CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
  begin
    if (not CheckDefaults) or (Visible = True) then
      Visible := TCustomAction(Sender).Visible;
    if (not CheckDefaults) or (Caption = '') or (Caption = Name) then
      Caption := TCustomAction(Sender).Caption;
  end;
  inherited;
end;

procedure TCommonCustomForm.ShowCaret(const Control: IControl);
var
  LICaret: ICaret;
begin
  if (Control <> nil) and (Control.QueryInterface(ICaret, IInterface(LICaret)) = S_OK) then
    LICaret.ShowCaret;
end;

procedure TCommonCustomForm.HideCaret(const Control: IControl);
var
  LICaret: ICaret;
begin
  if (Control <> nil) and (Control.QueryInterface(ICaret, IInterface(LICaret)) = S_OK) then
    LICaret.HideCaret;
end;

procedure TCommonCustomForm.Activate;
var
  TSC: ITextInput;
  OldActiveForm: TCommonCustomForm;
  LFocused: IControl;
begin
  if (not (TFmxFormState.Activation in FFormState)) and
     (FormStyle <> TFormStyle.Popup) then
  begin
    if (Visible) and
       ((not Active) or (TFmxFormState.Showing in FFormState)) and
       (not (csDestroying in ComponentState)) and
       (ApplicationState = TApplicationState.Running) then
    begin
      FFormState := FFormState + [TFmxFormState.Activation];
      Engage;
      try
        OldActiveForm := Screen.ActiveForm;
        FActive := True;
        try
          Screen.ActiveForm := Self;
          FWinService.Activate(Self);
          if Supports(FFocused, ITextInput, TSC) and (TSC.GetTextService <> nil) then
            TSC.GetTextService.EnterControl(Handle);
          FBorder.Activate;
        except
          FActive := False;
          Screen.SetActiveForm(OldActiveForm);
          Raise;
        end;
        LFocused := FFocused;
        while LFocused <> nil do
        begin
          LFocused.DoActivate;
          Supports(LFocused.Parent, IControl, LFocused);
        end;
        ShowCaret(FFocused);
        if Application.TrackActivity then
          Application.AnalyticsManager.RecordActivity(TAppActivity.WindowActivated, Self);
        if Assigned(FOnActivate) then
          FOnActivate(Self);
        TMessageManager.DefaultManager.SendMessage(Self, TFormActivateMessage.Create(Self));
      finally
        Disengage;
        FFormState := FFormState - [TFmxFormState.Activation];
      end;
    end;
  end;
end;

function TCommonCustomForm.GetTabList: ITabList;
begin
  if FTabList = nil then
    FTabList := TTabList.Create(Self);
  Result := FTabList;
end;

procedure TCommonCustomForm.Deactivate;
var
  TSC: ITextInput;
  LFocused: IControl;
begin
  if (not Active) or (TFmxFormState.Activation in FFormState) then
    Exit;
  FFormState := FFormState + [TFmxFormState.Activation];
  try
    try
      if not (csDestroying in ComponentState) then
      begin
        if FFocused <> nil then
        begin
          HideCaret(FFocused);
          if Supports(FFocused, ITextInput, TSC) and (TSC.GetTextService <> nil) then
            TSC.GetTextService.ExitControl(Handle);
        end;
        LFocused := FFocused;
        while LFocused <> nil do
        begin
          LFocused.DoDeactivate;
          Supports(LFocused.Parent, IControl, LFocused);
        end;
        if Assigned(FOnDeactivate) then
          FOnDeactivate(Self);
        TMessageManager.DefaultManager.SendMessage(Self, TFormDeactivateMessage.Create(Self));
      end;
    finally
      FActive := False;
      FBorder.Deactivate;
    end;
  finally
    FFormState := FFormState - [TFmxFormState.Activation];
  end;
end;

procedure TCommonCustomForm.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    if Value then
      Activate
    else
      Deactivate;
  end;
end;

procedure TCommonCustomForm.SetFormFamily(const Value: string);
var
  OldFormFamilyName: string;
begin
  if FFormFamily <> Value then
  begin
     OldFormFamilyName := FFormFamily;
     FFormFamily := Value;
  {$IFDEF WIN32}
     if (csDesigning in ComponentState) and (FDesigner <> nil) then
        FDesigner.FormFamilyChanged(OldFormFamilyName, FFormFamily, ClassName);
  {$ENDIF}
  end;
end;

function TCommonCustomForm.CanFlipChild(const AChild: TFmxObject): Boolean;
begin
  Result := True;
end;

function TCommonCustomForm.CanFormStyle(const NewValue: TFormStyle): TFormStyle;
begin
  if (NewValue = TFormStyle.Popup) and
     ([csDesigning] * ComponentState = []) and
     ((Application = nil) or
      (Screen = nil) or
      (Screen.FormCount = 0) or
      (Application.MainForm = self)) then
  begin
    if FFormStyle = TFormStyle.Popup then
      Result := TFormStyle.Normal
    else
      Result := FFormStyle;
  end
  else
    Result := NewValue;
end;

function TCommonCustomForm.CanShow: Boolean;
begin
  Result := not Visible;
end;

procedure TCommonCustomForm.SetFormStyle(const Value: TFormStyle);
var
  LFound, OldPopup, NewPopup: Boolean;
  OldFocused: IControl;
  OldActive: Boolean;
  V: TFormStyle;
begin
  V := CanFormStyle(Value);
  if FFormStyle <> V then
  begin
    OldPopup := FFormStyle = TFormStyle.Popup;
    NewPopup := V = TFormStyle.Popup;
    LFound := (Screen <> nil) and Screen.Contains(Self);
    if ([csLoading, csDestroying] * ComponentState = []) and
       ([TFmxFormState.Recreating, TFmxFormState.InDesigner,
         TFmxFormState.WasNotShown] * FormState = []) then
    begin
      OldFocused := Focused;
      OldActive := Active;
      if (OldPopup <> NewPopup) and LFound then
      begin
        Focused := nil;
        Screen.RemoveForm(self);
        if (not OldPopup) and (Screen.FormCount > 0) then
          Screen.SetActiveForm(Screen.Forms[Screen.FormCount - 1]);
      end;
      FFormStyle := V;
      if Handle <> nil then
        Recreate;
      if (OldPopup <> NewPopup) and (LFound) then
      begin
        Screen.AddForm(self);
        if not NewPopup and (Screen.FormCount > 0) then
          Screen.SetActiveForm(Screen.Forms[Screen.FormCount - 1]);
      end
      else
      begin
        Active := OldActive;
        Focused := OldFocused;
      end;
      if FormStyle = TFormStyle.Popup then
        MouseCapture;
    end
    else
    begin
      if [csDesigning] * ComponentState = [] then
        FHandleState := THandleState.Changed;
      if LFound then
        Screen.RemoveForm(self);
      FFormStyle := V;
      if LFound then
        Screen.AddForm(self);
    end;
  end;
end;

function TCommonCustomForm.FullScreenSupported: Boolean;
begin
  Result := FFullScreenWindowService <> nil;
end;

procedure TCommonCustomForm.SetFullScreen(const AValue: Boolean);
begin
  if FullScreenSupported then
  begin
    if (csDesigning in ComponentState) or (csLoading in ComponentState) then
      FFullScreen := AValue
    else
      FFullScreenWindowService.SetFullScreen(Self, AValue);
  end;
end;

function TCommonCustomForm.GetFullScreen: Boolean;
begin
  Result := False;
  if FullScreenSupported then
  begin
    if (csDesigning in ComponentState) then
      Result := FFullScreen
    else
      Result := FFullScreenWindowService.GetFullScreen(Self);
  end;
end;

procedure TCommonCustomForm.SetShowFullScreenIcon(const AValue: Boolean);
begin
  if FullScreenSupported then
    if FShowFullScreenIcon <> AValue then
    begin
      FShowFullScreenIcon := AValue;
      if not (csDesigning in ComponentState) then
        FFullScreenWindowService.SetShowFullScreenIcon(Self, FShowFullScreenIcon);
    end;
end;

procedure TCommonCustomForm.SetShowHint(const Value: Boolean);
begin
  FShowHint := Value;
  ReleaseLastHinted;
end;

function TCommonCustomForm.GetShowFullScreenIcon: Boolean;
begin
  Result := FShowFullScreenIcon;
end;

procedure TCommonCustomForm.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TopMost', ReadTopMost, nil, False);
  Filer.DefineProperty('ShowActivated', ReadShowActivated, nil, False);
  Filer.DefineProperty('StaysOpen', ReadStaysOpen, nil, False);
  Filer.DefineProperty('DesignerMobile', ReadDesignerMobile, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerWidth', ReadDesignerWidth, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerHeight', ReadDesignerHeight, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerDeviceName', ReadDesignerDeviceName, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerOrientation', ReadDesignerOrientation, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerOSVersion', ReadDesignerOSVersion, nil, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('DesignerMasterStyle', ReadDesignerMasterStyle, WriteDesignerMasterStyle, {$IFDEF MSWINDOWS}True{$ELSE}False{$ENDIF});
  Filer.DefineProperty('EnableBorderStyling', IgnoreBooleanValue, nil, False);
end;

procedure TCommonCustomForm.ReadTopMost(Reader: TReader);
var
  LTopMost: Boolean;
begin
  LTopMost := Reader.ReadBoolean;
  if LTopMost then
    FormStyle := TFormStyle.StayOnTop;
end;

procedure TCommonCustomForm.ReadShowActivated(Reader: TReader);
var
  LShowActivated: Boolean;
begin
  LShowActivated := Reader.ReadBoolean;
  if not LShowActivated then
    FormStyle := TFormStyle.Popup;
end;

procedure TCommonCustomForm.ReadStaysOpen(Reader: TReader);
var
  LStaysOpen: Boolean;
begin
  LStaysOpen := Reader.ReadBoolean;
  if not LStaysOpen then
    FormStyle := TFormStyle.Popup;
end;

procedure TCommonCustomForm.ReadDesignerDeviceName(Reader: TReader);
begin
  {$IFDEF MSWINDOWS}
  FDesignerDeviceName := Reader.ReadString;
  {$ELSE}
  Reader.ReadString;
  {$ENDIF}
end;

procedure TCommonCustomForm.ReadDesignerOSVersion(Reader: TReader);
begin
  Reader.ReadString;
end;

procedure TCommonCustomForm.ReadDesignerHeight(Reader: TReader);
begin
  Reader.ReadInteger;
end;

procedure TCommonCustomForm.ReadDesignerMasterStyle(Reader: TReader);
begin
  {$IFDEF MSWINDOWS}
  FDesignerMasterStyle := Reader.ReadInteger;
  {$ELSE}
  Reader.ReadInteger;
  {$ENDIF}
end;

procedure TCommonCustomForm.ReadDesignerMobile(Reader: TReader);
begin
  Reader.ReadBoolean;
end;

procedure TCommonCustomForm.ReadDesignerOrientation(Reader: TReader);
begin
  Reader.ReadInteger;
end;

procedure TCommonCustomForm.ReadDesignerWidth(Reader: TReader);
begin
  Reader.ReadInteger;
end;

procedure TCommonCustomForm.StartWindowDrag;
begin
  if csDesigning in ComponentState then
    Exit;
  FDragging := True;
  FDownPos := FMousePos;
  MouseCapture;
end;

procedure TCommonCustomForm.StartWindowResize;
begin
  if csDesigning in ComponentState then
    Exit;
  FResizing := True;
  FDownPos := FMousePos;
  FResizeSize := PointF(Width, Height);
  FDownSize := FResizeSize;
  MouseCapture;
end;

type
  TObjInfo = record
    Level: Integer;
    Index: Integer;
    Initiated: Boolean;
    ActionClient: IActionClient;
    Obj: TObject;
  end;

  TComparerTFmxObject = class (TComparer<TObjInfo>)
  public
    function Compare(const Left, Right: TObjInfo): Integer; override;
  end;

  TTObjInfoList = class (TList<TObjInfo>)

  end;

{ TComparerTFmxObject }

function TComparerTFmxObject.Compare(const Left, Right: TObjInfo): Integer;
begin
  if Left.Obj = Right.Obj then
    Result := 0
  else
  begin
    if Left.Level < Right.Level then
      Result := -1
    else if Left.Level > Right.Level then
      Result := 1
    else
    begin
      if Left.Index < Right.Index then
        Result := -1
      else if Left.Index > Right.Index then
        Result := 1
      else
        Result := 0;
    end;
  end;
end;

procedure TCommonCustomForm.UnregisterHintReceiver(const AReceiver: IHintReceiver);
begin
  if FHintReceiverList <> nil then
  begin
    FHintReceiverList.RemoveItem(AReceiver, TDirection.FromBeginning);
    if FHintReceiverList.Count = 0 then
      FreeAndNil(FHintReceiverList);
  end;
end;

procedure TCommonCustomForm.UpdateActions;
var
  I, InitiatedCount: Integer;
  ClientList: TTObjInfoList;
  Bucket: TDictionary<TObject, TObject>;
  Comparer: IComparer<TObjInfo>;

  function IsCollected(Obj: TObject): Boolean;
  begin
    Result := Bucket.ContainsKey(Obj);
    if not Result then
      Bucket.Add(Obj, nil);
  end;

  function CollectObjectInfo(const Client: TComponent; var Info: TObjInfo): Boolean;
  var
    O: TComponent;
    Control: IControl;
  begin
    if Client.GetInterface(IActionClient, Info.ActionClient) and (Info.ActionClient.GetActionClient) and
      (Info.ActionClient.GetRoot = Self) then
    begin
      Info.Obj := Client;
      Info.Level := 0;
      Info.Index := Info.ActionClient.GetIndex;
      Result := True;
      O := Client;
      while (O <> nil) and O.HasParent do
      begin
        O := O.GetParentComponent;
        if Supports(O, IControl, Control) then
          Result := Result and Control.Visible;
        Inc(Info.Level);
      end;

      if Supports(Client, IControl) then
      begin
        Info.Level := Info.Level + ((1 - Byte(Client is TMainMenu)) shl (29));
        Info.Level := Info.Level + ((1 - Byte(Client is TMenuItem)) shl (28));
      end
      else
      begin
        if Client <> Self then
          Info.Level := Info.Level + (1 shl 30);
      end;
    end
    else
      Result := False;
  end;

  function CollectActionClients(InfoList: TTObjInfoList) : Integer;
  var
    Client: TComponent;
    Info: TObjInfo;
    ParentVisible: Boolean;
    RootSelf: IRoot;
  begin
    QueryInterface(IRoot, RootSelf);

    for Client in Application.GetActionClients do
    begin
      ParentVisible := CollectObjectInfo(Client, Info);
      if ParentVisible and (not IsCollected(Client)) then
        InfoList.Add(Info);
    end;
    Result := InfoList.Count;
  end;

begin
  if ([csDesigning, csDestroying, csLoading, csUpdating] * ComponentState <> []) or
     (FUpdating > 0) then Exit;
  { Update objects in form }

  Comparer := TComparerTFmxObject.Create;
  ClientList := TTObjInfoList.Create(Comparer);
  Bucket := TDictionary<TObject, TObject>.Create;
  try
    for InitiatedCount := 0 to 7 do
    begin
      if CollectActionClients(ClientList) = 0 then
        Break;
      ClientList.Sort;
      for I := 0 to ClientList.Count - 1 do
        ClientList[I].ActionClient.InitiateAction;
      ClientList.Clear;
    end;
  finally
    ClientList.Free;
    Bucket.Free;
  end;
end;

procedure TCommonCustomForm.Updated;
begin
  inherited;
  Realign;
end;

procedure TCommonCustomForm.ValidateRename(AComponent: TComponent; const CurName, NewName: string);
begin
  inherited;
{$IFDEF WIN32}
  if FDesigner <> nil then
    FDesigner.ValidateRename(AComponent, CurName, NewName);
{$ENDIF}
end;

procedure TCommonCustomForm.VirtualKeyboardChangeHandler(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
begin
  if TVKStateChangeMessage(Msg).KeyboardVisible then
  begin
    if Assigned(FOnVirtualKeyboardShown) then
      FOnVirtualKeyboardShown(Self, True, TVKStateChangeMessage(Msg).KeyboardBounds)
  end
  else if Assigned(FOnVirtualKeyboardHidden) then
    FOnVirtualKeyboardHidden(Self, False, TVKStateChangeMessage(Msg).KeyboardBounds);
end;

procedure TCommonCustomForm.WriteDesignerMasterStyle(Writer: TWriter);
begin
  {$IFDEF MSWINDOWS}
  Writer.WriteInteger(FDesignerMasterStyle);
  {$ENDIF}
end;

{ IRoot }

procedure TCommonCustomForm.DoAddObject(const AObject: TFmxObject);
var
  AlignObject: IAlignableObject;
  TabStop: IControl;
begin
  inherited;
  if Supports(AObject, IControl, TabStop) then
    GetTabList.Add(TabStop);
  if Supports(AObject, IAlignableObject, AlignObject) and
    ((AlignObject.Align <> TAlignLayout.None) or (AlignObject.Anchors <> [TAnchorKind.akLeft, TAnchorKind.akTop])) then
    Realign;
end;

procedure TCommonCustomForm.DoRemoveObject(const AObject: TFmxObject);
var
  TabStop: IControl;
begin
  inherited;
  if (FTabList <> nil) and Supports(AObject, IControl, TabStop) then
    GetTabList.Remove(TabStop);
end;

procedure TCommonCustomForm.DoClose(var CloseAction: TCloseAction);
begin
  if Assigned(FOnClose) then
    FOnClose(Self, CloseAction);
  if Assigned(FResultProc) and (CloseAction <> TCloseAction.caNone) then
  begin
    FResultProc(FModalResult);
    FResultProc := nil;
  end;
end;

procedure TCommonCustomForm.DoDeleteChildren;
begin
  if FTabList <> nil then
    FTabList.Clear;
  inherited;
end;

procedure TCommonCustomForm.DoFlipChildren;
var
  I: Integer;
  TheWidth: Single;
  ChildControl: TControl;
  ChildContainer: IContainerObject;
  ContainerWidth: Single;
  Child: TFmxObject;
begin
  TheWidth := GetContainerWidth;
  for I := 0 to ChildrenCount - 1 do
  begin
    Child := Children[I];
    if not (Child is TControl) or not CanFlipChild(Child) then
      Continue;

    ChildControl := TControl(Child);
    if Supports(ChildControl, IContainerObject, ChildContainer) then
      ContainerWidth := ChildContainer.GetContainerWidth
    else
      ContainerWidth := ChildControl.Width;

    ChildControl.Position.X := TheWidth - ContainerWidth - ChildControl.Position.X;
  end;
end;

procedure TCommonCustomForm.DoFocusChanged;
begin
  if Assigned(FOnFocusChanged) then
    FOnFocusChanged(Self);
end;

procedure TCommonCustomForm.DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  // Override DoGesture to implement default behaviour
  Handled := False;
end;

procedure TCommonCustomForm.DoHide;
begin
  if Assigned(FOnHide) then
    FOnHide(Self);
end;

procedure TCommonCustomForm.DoKeyDown(var AKeyCode: Word; var AKeyChar: WideChar; const AShiftState: TShiftState);
begin
  if Assigned(FOnKeyDown) then
    FOnKeyDown(Self, AKeyCode, AKeyChar, AShiftState);
end;

procedure TCommonCustomForm.DoKeyUp(var AKeyCode: Word; var AKeyChar: WideChar; const AShiftState: TShiftState);
begin
  if Assigned(FOnKeyUp) then
    FOnKeyUp(Self, AKeyCode, AKeyChar, AShiftState);
end;

procedure TCommonCustomForm.DoMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(OnMouseDown) then
    OnMouseDown(Self, Button, Shift, X, Y);
end;

procedure TCommonCustomForm.DoMouseMove(Shift: TShiftState; X, Y: Single);
begin
  if Assigned(OnMouseMove) then
    OnMouseMove(Self, Shift, X, Y);
end;

procedure TCommonCustomForm.DoMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(OnMouseUp) then
    OnMouseUp(Self, Button, Shift, X, Y);
end;

procedure TCommonCustomForm.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  if Assigned(OnMouseWheel) then
    OnMouseWheel(Self, Shift, WheelDelta, Handled);
end;

procedure TCommonCustomForm.DoParentFormChanged;
begin
  if (FWinService <> nil) and (Handle <> nil) and not (TFmxFormState.Closing in FFormState) then
    Recreate;
end;

procedure TCommonCustomForm.DoRootChanged;
var
  Parent: TFmxObject;
  DesignerForm: IDesignerForm;
begin
  inherited;
  Parent := self;
  repeat
    Parent := Parent.Parent;
  until (Parent = nil) or (Parent is TCommonCustomForm);
  if (Parent <> nil) and Parent.GetInterface(IDesignerForm, DesignerForm) then
    Parent := nil;
  if FParentForm <> Parent then
  begin
    FParentForm := TCommonCustomForm(Parent);
    DoParentFormChanged;
  end;
end;

procedure TCommonCustomForm.DoShow;
begin
  if Assigned(FOnShow) then
    FOnShow(Self);
end;

procedure TCommonCustomForm.DoStyleChanged;
begin

end;

procedure TCommonCustomForm.DoTap(const Point:TPointF);
begin
  if Assigned(FOnTap) then
    FOnTap(Self, Point);
end;

function TCommonCustomForm.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TCommonCustomForm.GetActionLinkClass: TActionLinkClass;
begin
  Result := TFormActionLink;
end;

function TCommonCustomForm.GetActiveControl: IControl;
begin
  Result := FActiveControl;
end;

function TCommonCustomForm.GetBackIndex: Integer;
begin
  Result := 1;
end;

function TCommonCustomForm.GetBiDiMode: TBiDiMode;
begin
  Result := FBiDiMode;
end;

function TCommonCustomForm.GetBounds: TRect;
begin
  Result := GetBoundsF.Round;
end;

function TCommonCustomForm.GetBoundsF: TRectF;
begin
  Result := FWinService.GetWindowRect(Self);
end;

function TCommonCustomForm.GetCaptured: IControl;
begin
  Result := FCaptured;
end;

procedure TCommonCustomForm.SetCaptured(const Value: IControl);
begin
  if FCaptured <> Value then
  begin
    if FCaptured <> nil then
    begin
      ReleaseCapture;
      FCaptured.RemoveFreeNotify(Self);
    end;
    FCaptured := Value;
    if FCaptured <> nil then
    begin
      MouseCapture;
      FCaptured.AddFreeNotify(Self);
    end;
  end;
end;

function TCommonCustomForm.GetFirstControlWithGesture(AGesture: TInteractiveGesture): TComponent;
var
  LGObj: IGestureControl;
begin
  Result := nil;
  if AGesture in Touch.InteractiveGestures then
    Result := Self
  else if Supports(Parent, IGestureControl, LGObj) then
    Result := LGObj.GetFirstControlWithGesture(AGesture);
end;

function TCommonCustomForm.GetFirstControlWithGestureEngine: TComponent;
var
  LGObj: IGestureControl;
begin
  Result := nil;
  if Touch.GestureEngine <> nil then
    Result := Self
  else if Supports(Parent, IGestureControl, LGObj)then
    Result := LGObj.GetFirstControlWithGestureEngine;
end;

function TCommonCustomForm.GetFocused: IControl;
begin
  Result := FFocused;
end;

function TCommonCustomForm.GetHeight: Integer;
begin
  Result := Trunc(FBounds.Height);
end;

function TCommonCustomForm.GetHovered: IControl;
begin
  Result := FHovered;
end;

function TCommonCustomForm.ParentFormOfIControl(Value: IControl): TCommonCustomForm;
var
  Parent: TFmxObject;
begin
  Result := nil;
  if (Value <> nil) and (Value.GetObject <> nil) then
  begin
    Parent := TFmxObject(Value.GetObject);
    while (Parent <> nil) and (not (Parent is TCommonCustomForm)) do
      Parent := Parent.Parent;
    if Parent is TCommonCustomForm then
      Result := TCommonCustomForm(Parent);
  end;
end;

function TCommonCustomForm.NewFocusedControl(const Value: IControl): IControl;
var
  NewFocused: IControl;
  LParentForm: TCommonCustomForm;
  P: TFmxObject;
  Control: IControl;
  NewCanFocus: Boolean;
begin
  Result := nil;
  if Value <> nil then
  begin
    LParentForm := ParentFormOfIControl(Value);
    if LParentForm = Self then
    begin
      NewFocused := Value;
      NewCanFocus := False;
      while not NewCanFocus and (NewFocused <> nil) and NewFocused.Visible do
      begin
        NewCanFocus := NewFocused.GetCanFocus;
        if not NewFocused.GetCanParentFocus then
          Break;
        if not NewCanFocus then
        begin
          if (NewFocused.Parent = nil) or not Supports(NewFocused.Parent, IControl, NewFocused) then
            Break;
        end;
      end;
      if NewFocused <> nil then
        NewCanFocus := NewFocused.GetCanFocus;
      if NewCanFocus then
      begin
        P := NewFocused.Parent;
        while Supports(P, IControl, Control) do
        begin
          if not Control.Visible or not Control.Enabled then
            Exit;
          P := P.Parent;
        end;
        if NewFocused.AbsoluteEnabled then
          Result := NewFocused;
      end;
    end
    else
      if LParentForm <> nil then
        Result := LParentForm.NewFocusedControl(Value);
  end;
end;

procedure TCommonCustomForm.ClearFocusedControl(const IgnoreExceptions: Boolean = False);
var
  TextInput: ITextInput;
begin
  if FFocused <> nil then
  begin
    try
      FFocused.DoExit;
    except
      if not IgnoreExceptions then
        raise;
    end;
    try
      if Supports(FFocused, ITextInput, TextInput) and (TextInput.GetTextService <> nil) then
        TextInput.GetTextService.ExitControl(Handle);
    except
      if not IgnoreExceptions then
      begin
        FFocused.DoEnter;
        raise;
      end;
    end;
    if FFocused <> nil then
    try
      FFocused.RemoveFreeNotify(Self);
      try
        FocusedControlExited;
      except
        if not IgnoreExceptions then
          raise;
      end;
    finally
      try
        HideCaret(FFocused);
      finally
        FFocused := nil;
      end;
    end;
  end;
end;

procedure TCommonCustomForm.SetFocusedControl(const NewFocused: IControl);

  procedure EnterFocused(const TextService: TTextService);
  begin
    if TextService <> nil then
      TextService.EnterControl(Handle);
    try
      FFocused.DoEnter;
    except
      if TextService <> nil then
        TextService.ExitControl(Handle);
      raise;
    end;
  end;

var
  TextInput: ITextInput;
begin
  if FActiveControl <> nil then
    FActiveControl.RemoveFreeNotify(Self);
  FActiveControl := NewFocused;
  if FActiveControl <> nil then
    FActiveControl.AddFreeNotify(Self);
  FFocused := NewFocused;
  try
    if FFocused <> nil then
    begin
      try
        if Supports(FFocused, ITextInput, TextInput) then
          EnterFocused(TextInput.GetTextService)
        else
          EnterFocused(nil);
      except
        FFocused := nil;
        FActiveControl := nil;
        raise;
      end;
      try
        ShowCaret(FFocused);
      finally
        FFocused.AddFreeNotify(Self);
        FocusedControlEntered;
      end;
    end;
  finally
    if [csLoading, csDestroying] * ComponentState = [] then
      DoFocusChanged;
  end;
end;

procedure TCommonCustomForm.FocusedControlEntered;
var
  Parent: TFmxObject;
  Control: IControl;
begin
  Parent := FFocused.Parent;
  while Parent <> nil do
    if Supports(Parent, IControl, Control) and Control.EnterChildren(FFocused) then
      Break
    else
      Parent := Parent.Parent;
end;

procedure TCommonCustomForm.FocusedControlExited;
var
  Parent: TFmxObject;
  Control: IControl;
begin
  Parent := FFocused.Parent;
  while Parent <> nil do
    if Supports(Parent, IControl, Control) and Control.ExitChildren(FFocused) then
      Break
    else
      Parent := Parent.Parent;
end;

procedure TCommonCustomForm.SetFocused(const Value: IControl);
begin
  TNonReentrantHelper.Execute(FChangingFocusGuard,
    procedure
    var
      NewFocused: IControl;
      LParentForm: TCommonCustomForm;
    begin
      if Value <> nil then
      begin
        NewFocused := NewFocusedControl(Value);
        if NewFocused = nil then
          raise EInvalidOperation.Create(StrCannotFocus);
        LParentForm := ParentFormOfIControl(NewFocused);
      end
      else
      begin
        NewFocused := nil;
        LParentForm := Self;
      end;

      if LParentForm <> nil then
      begin
        var Message: TFormChangingFocusControl := TFormChangingFocusControl.Create(FFocused, NewFocused, False);
        try
          TMessageManager.DefaultManager.SendMessage(LParentForm, Message, False);
          if LParentForm <> Self then
          begin
           LParentForm.Active := True;
           LParentForm.SetFocused(Value);
          end
          else if FFocused <> NewFocused then
          begin
            ClearFocusedControl;
            SetFocusedControl(NewFocused);
          end;
        finally
          Message.IsChanged := True;
          TMessageManager.DefaultManager.SendMessage(LParentForm, Message, True);
        end;
      end;
    end);
end;

procedure TCommonCustomForm.BeginInternalDrag(const Source: TObject; const ABitmap: TObject);
var
  D: TDragObject;
  DDService: IFMXDragDropService;
begin
  if Source <> nil then
  begin
    SetCaptured(nil);
    Fillchar(D, SizeOf(D), 0);
    D.Source := Source;
    if TPlatformServices.Current.SupportsPlatformService(IFMXDragDropService, DDService) then
      DDService.BeginDragDrop(Self, D, FMX.Graphics.TBitmap(ABitmap));
  end;
end;

procedure TCommonCustomForm.SetActiveControl(const AControl: IControl);
begin
  if AControl <> FActiveControl then
  begin
    if FActiveControl <> nil then
      FActiveControl.RemoveFreeNotify(Self);
    FActiveControl := AControl;
    if FActiveControl <> nil then
      FActiveControl.AddFreeNotify(Self);
    if (FActiveControl <> nil) and not (csLoading in ComponentState) then
      FActiveControl.SetFocus;
  end;
end;

function TCommonCustomForm.GetStyleBook: TStyleBook;
begin
  Result := FStyleBook;
end;

procedure TCommonCustomForm.UpdateStyleBook;
begin
  FStyleBookChanged := False;
  FBorder.StyleChanged;
end;

procedure TCommonCustomForm.SetSystemStatusBar(const Value: TFormSystemStatusBar);
begin
  FSystemStatusBar.Assign(Value);
end;

procedure TCommonCustomForm.SetStyleBook(const Value: TStyleBook);
begin
  if FStyleBook <> Value then
  begin
    if FStyleBook <> nil then
      FStyleBook.RemoveFreeNotification(Self);
    if not (csDesigning in ComponentState) and (Value <> nil) and Value.UnsupportedPlatform then
    begin
      //Force show messages in the main thread.
      TThread.Synchronize(nil,
      procedure
      begin
        TDialogService.ShowMessage(SInvalidStyleForPlatform);
      end);
    end
    else
    begin
      FStyleBook := Value;
      FStyleBookChanged := True;
      if not (csLoading in ComponentState) and not (csDestroying in ComponentState) then
        UpdateStyleBook;
      if FStyleBook <> nil then
        FStyleBook.FreeNotification(Self);
    end;
  end;
end;

procedure TCommonCustomForm.SetStyleBookWithoutUpdate(const StyleBook: TStyleBook);
begin
  FStyleBook := StyleBook;
end;

function TCommonCustomForm.GetSaveState: TFormSaveState;
begin
  if FSaveState = nil then
    FSaveState := TFormSaveState.Create(Self);
  Result := FSaveState;
end;

{$IFDEF MSWINDOWS}

function TCommonCustomForm.GetDesignerMasterStyle: Integer;
begin
  Result := FDesignerMasterStyle;
end;

procedure TCommonCustomForm.SetDesignerMasterStyle(Value: Integer);
begin
  FDesignerMasterStyle := Value;
end;

function TCommonCustomForm.GetDesignerMobile: Boolean;
begin
  Result := False;
end;

function TCommonCustomForm.GetDesignerDeviceName: string;
begin
  Result := FDesignerDeviceName;
end;

function TCommonCustomForm.GetDesignerHeight: Integer;
begin
  Result := 0;
end;

function TCommonCustomForm.GetDesignerOrientation: TFormOrientation;
begin
  Result := TFormOrientation(0);
end;

function TCommonCustomForm.GetDesignerOSVersion: string;
begin
  Result := '';
end;

function TCommonCustomForm.GetDesignerWidth: Integer;
begin
  Result := 0;
end;

{$ENDIF}

{ TCustomForm }

destructor TCustomForm.Destroy;
begin
  FreeAndNil(FControls);
  FreeAndNil(FFill);
  inherited;
end;

// Required to force Delphi-style initialization when used from C++.
constructor TCustomForm.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TCustomForm.CreateNew(AOwner: TComponent; Dummy: NativeInt);
begin
  inherited;
end;

procedure TCustomForm.AddPreloadPropertyNames(const PropertyNames: TList<string>);
begin
  inherited ;
  PropertyNames.Add('Quality');
end;

procedure TCustomForm.SetPreloadProperties(const PropertyStore: TDictionary<string, Variant>);
var
  Val: Variant;
begin
  inherited ;
  // Default
  FQuality := TCanvasQuality.SystemDefault;
  // Preload
  PropertyStore.TryGetValue('Quality', Val);
  if (Val <> Unassigned) and (Val <> Null) then
    FQuality := TCanvasQuality(GetEnumValue(TypeInfo(TCanvasQuality), Val));
end;

procedure TCustomForm.InitializeNewForm;
begin
  inherited;
  FStyleLookup := DefaultFormStyleLookup;
  FNeedStyleLookup := True;
  FFill := TBrush.Create(TBrushKind.None, TAlphaColors.White);
  FFill.OnChanged := FillChanged;
end;

function TCustomForm.IsStyleLookupStored: Boolean;
begin
  Result := not SameText(FStyleLookup, DefaultFormStyleLookup);
end;

procedure TCustomForm.CreateHandle;
begin
  inherited;
  RecreateCanvas;
end;

procedure TCustomForm.ResizeHandle;
var
  LSize: TPointF;
begin
  inherited;
  if (FCanvas <> nil) and (ClientWidth > 0) and (ClientHeight > 0) then
  begin
    LSize := FWinService.GetClientSize(Self);
    FCanvas.SetSize(Round(LSize.X), Round(LSize.Y));
    Realign;
  end;
end;

procedure TCustomForm.DestroyHandle;
begin
  FreeAndNil(FCanvas);
  inherited;
end;

procedure TCustomForm.RecreateCanvas;
var
  LSize: TPointF;
begin
  // It's a very important to release Canvas instance on ARC before allocation new one. Because some system related
  // low level resources cannot be shared between two canvas instance. The FMX library is designed in such a way
  // that there is always only one strong reference to the canvas in this place. However, some third-party libraries
  // keep a strong reference to the canvas (instead of a weak one) and do not allow to release the canvas in this place.
  FreeAndNil(FCanvas);

  if Handle <> nil then
  begin
    LSize := FWinService.GetClientSize(Self);
    FCanvas := TCanvasManager.CreateFromWindow(Handle, Round(LSize.X), Round(LSize.Y), FQuality);
  end;
end;

procedure TCustomForm.RecreateResources;
begin
  inherited;
  RecreateCanvas;
end;

procedure TCustomForm.DoPaint(const Canvas: TCanvas; const ARect: TRectF);
begin
  if Assigned(FOnPaint) then
    FOnPaint(Self, Canvas, ARect);
end;

procedure TCustomForm.EndUpdate;
begin
  inherited;
end;

procedure TCustomForm.AddUpdateRect(const R: TRectF);
begin
  if not ((csLoading in ComponentState) or (csDestroying in ComponentState) or FDrawing or (FDisableUpdating > 0)) and
    (Canvas <> nil) and IntersectRect(R, TRectF.Create(0, 0, FCanvas.Width, FCanvas.Height))  then
  begin
    if (Canvas <> nil) and not (TCanvasStyle.SupportClipRects in Canvas.GetCanvasStyle) then
      InvalidateRect(RectF(0, 0, FCanvas.Width, FCanvas.Height))
    else
      InvalidateRect(R);
  end;
end;

procedure TCustomForm.ChangeScrollingState(const AControl: TControl; const Active: Boolean);
begin
  if TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle then
    TGlyphsManager.Default.DisableGlyphPopulation := Active;
end;

procedure TCustomForm.PaintBackground;
const
  DesignerClearColor = (TAlphaColorRec.Deepskyblue and not TAlphaColorRec.Alpha) or $A0000000;

  procedure FillSolidColor(const ABackgroudColor: TAlphaColor);
  var
    I: Integer;
  begin
    if TCanvasStyle.SupportClipRects in TCanvasManager.DefaultCanvas.GetCanvasStyle then
      for I := Low(FUpdateRects) to High(FUpdateRects) do
        Canvas.ClearRect(FUpdateRects[I], ABackgroudColor)
    else
      Canvas.Clear(ABackgroudColor)
  end;

var
  ClearColor: TAlphaColor;
  FillColor: TAlphaColor;
begin
  if csDesigning in ComponentState then
    ClearColor := DesignerClearColor
  else
    ClearColor := TAlphaColorRec.Null;

  if FFill.Kind in [TBrushKind.None, TBrushKind.Solid] then
  begin
    if Transparency then
      FillColor := ClearColor
    else if FFill.Kind = TBrushKind.None then
      FillColor := FFill.Color and $FFFFFF
    else
      FillColor := FFill.Color;

    FillSolidColor(FillColor);
  end
  else
  begin
    if Transparency then
      FillSolidColor(ClearColor)
    else
      // We must to make full clearing anyway, because Canvas can be dirty, especially on GPU canvas.
      Canvas.Clear(TAlphaColorRec.Null);

    Canvas.FillRect(RectF(0, 0, Width, Height), 0, 0, AllCorners, 1, FFill);
  end;
end;

procedure TCustomForm.AddUpdateRects(const UpdateRects: array of TRectF);
const
  MaxSeparatedRects = 20;
var
  I: Integer;
begin
  if Length(UpdateRects) > 0 then
  begin
    if TCanvasStyle.SupportClipRects in TCanvasManager.DefaultCanvas.GetCanvasStyle then
    begin
      SetLength(FUpdateRects, Length(FUpdateRects) + Length(UpdateRects));
      {$IFDEF NEXTGEN}
      for I := 0 to Length(UpdateRects) - 1 do
        FUpdateRects[Length(FUpdateRects) - Length(UpdateRects) + I] := UpdateRects[I];
      {$ELSE}
      Move(UpdateRects[0], FUpdateRects[Length(FUpdateRects) - Length(UpdateRects)], SizeOf(UpdateRects[0]) * Length(UpdateRects));
      {$ENDIF}
      if Length(FUpdateRects) > MaxSeparatedRects then
      begin
        for I := 1 to High(FUpdateRects) do
          FUpdateRects[0] := UnionRect(FUpdateRects[0], FUpdateRects[I]);
        SetLength(FUpdateRects, 1);
      end;
    end
    else
    begin
      SetLength(FUpdateRects, 1);
      FUpdateRects[0] := TRectF.Create(0, 0, Canvas.Width, Canvas.Height);
    end;
  end;
end;

procedure TCustomForm.PrepareForPaint;
var
  I, J: Integer;
  R: TRectF;
  AllowPaint: Boolean;
  Control: TControl;
begin
  ApplyStyleLookup;

  if FControls = nil then
    Exit;

  I := 0;
  while I <= FControls.Count - 1 do
  begin
    Control := FControls[I];
    Inc(I);
    if Control.Visible then
    begin
      if Control = FResourceLink then
        Continue;
      if Control.UpdateRect.IsEmpty then
        Continue;

      AllowPaint := False;
      if Control.InPaintTo then
        AllowPaint := True;
      if not AllowPaint then
      begin
        R := UnionRect(Control.ChildrenRect, Control.UpdateRect);
        for J := 0 to High(FUpdateRects) do
          if IntersectRect(FUpdateRects[J], R) then
          begin
            AllowPaint := True;
            Break;
          end;
        end;
        if AllowPaint then
          Control.PrepareForPaint;
    end;
  end;
end;

procedure TCustomForm.PaintRects(const UpdateRects: array of TRectF);
var
  I, J: Integer;
  R: TRectF;
  CallOnPaint, AllowPaint: Boolean;
  Control: TControl;
begin
  if Canvas = nil then
    Exit;

  if not FDrawing then
  begin
    AddUpdateRects(UpdateRects);
    PrepareForPaint;

    FDrawing := True;
    try
      if Canvas.BeginScene(@FUpdateRects, ContextHandle) then
      try
        PaintBackground;

        CallOnPaint := False;

        if FControls <> nil then
          for I := 0 to FControls.Count - 1 do
            if FControls[I].Visible or FControls[I].ShouldTestMouseHits then
            begin
              Control := FControls[I];
              if Control = FResourceLink then
              begin
                if Self.Transparency then
                  Continue;
                if Self.Fill.Kind <> TBrushKind.None then
                  Continue;
                if (Self.Fill.Kind = TBrushKind.Solid) and (Self.Fill.Color <> Fill.DefaultColor) then
                  Continue;
              end;
              if Control.UpdateRect.IsEmpty then
                Continue;
              AllowPaint := False;
              if Control.InPaintTo then
                AllowPaint := True;
              if not AllowPaint then
              begin
                R := UnionRect(Control.ChildrenRect, Control.UpdateRect);
                for J := 0 to High(FUpdateRects) do
                  if IntersectRect(FUpdateRects[J], R) then
                  begin
                    AllowPaint := True;
                    Break;
                  end;
              end;
              if AllowPaint then
                TOpenControl(Control).PaintInternal;

              if Control = FResourceLink then
              begin
                Canvas.SetMatrix(TMatrix.Identity);
                DoPaint(Self.Canvas, ClientRect);

                {$IFDEF MSWINDOWS}
                if (csDesigning in ComponentState) and (Designer <> nil) then
                begin
                  Canvas.SetMatrix(TMatrix.Identity);
                  Designer.PaintGrid;
                end;
                {$ENDIF}

                CallOnPaint := True;
              end;
            end;

          if not CallOnPaint then
          begin
            Canvas.SetMatrix(TMatrix.Identity);
            DoPaint(Canvas, ClientRect);
          end;

          {$IFDEF MSWINDOWS}
          if (csDesigning in ComponentState) and (Designer <> nil) then
            Designer.Decorate(nil);
          {$ENDIF}
      finally
        Canvas.EndScene;
      end;
    finally
      SetLength(FUpdateRects, 0);
      FDrawing := False;
    end;
  end;
end;

procedure TCustomForm.PaintTo(const Canvas: TCanvas);
begin
  FTempCanvas := Canvas;
  try
    PaintRects([RectF(0, 0, FTempCanvas.Width, FTempCanvas.Height)]);
  finally
    FTempCanvas := nil;
  end;
end;

procedure TCustomForm.RecalcControlsUpdateRect;
var
  I: Integer;
begin
  if FControls <> nil then
    for I := 0 to FControls.Count - 1 do
      FControls[I].RecalcUpdateRect;
end;

procedure TCustomForm.Realign;
begin
//  if FDisableAlign or (FUpdating > 0) then
//    Exit;
  if not (csDesigning in ComponentState) then
  begin
    if FLastWidth <= 0 then
      FLastWidth := GetOriginalContainerSize.X;
    if FLastHeight <= 0 then
      FLastHeight := GetOriginalCOntainerSize.Y;
  end;
  if FCanvas <> nil then
  begin
    AlignObjects(Self, Padding, FCanvas.Width, FCanvas.Height, FLastWidth, FLastHeight, FDisableAlign);
    RecalcControlsUpdateRect;
    InvalidateRect(ClientRect);
  end;
end;

procedure TCustomForm.DoAddObject(const AObject: TFmxObject);
begin
  inherited;
  if AObject = nil then
    Exit;
  if AObject is TControl then
  begin
    TControl(AObject).SetNewScene(Self);

    TOpenControl(AObject).RecalcOpacity;
    TOpenControl(AObject).RecalcAbsolute;
    TOpenControl(AObject).RecalcUpdateRect;
    TOpenControl(AObject).RecalcHasClipParent;
    TOpenControl(AObject).RecalcEnabled;

    if FControls = nil then
    begin
      FControls := TControlList.Create;
      FControls.Capacity := 10;
    end;
    FControls.Add(TControl(AObject));

    if (TControl(AObject).Align = TAlignLayout.None) then
      TControl(AObject).Repaint;
  end;
end;

procedure TCustomForm.DoDeleteChildren;
begin
  inherited;
  FreeAndNil(FControls);
end;

procedure TCustomForm.DoRemoveObject(const AObject: TFmxObject);
begin
  inherited;
  if AObject is TControl then
  begin
    if FControls <> nil  then
      FControls.Remove(TControl(AObject));

    if not (csDestroying in ComponentState) then
    begin
      if (Canvas <> nil) and (TCanvasStyle.SupportClipRects in Canvas.GetCanvasStyle) and not (csDestroying in AObject.ComponentState) then
        AddUpdateRect(TControl(AObject).UpdateRect)
      else
        Invalidate;
    end;
    TControl(AObject).SetNewScene(nil);
  end;
end;

function TCustomForm.CanFlipChild(const AChild: TFmxObject): Boolean;
begin
  Result := inherited and (AChild <> FResourceLink);
end;

procedure TCustomForm.ChangeChildren;
var
  I, C: Integer;
  Changes: Integer;
begin
  inherited;
  Changes := 0;
  if not (csLoading in ComponentState) and (FControls <> nil) then
  begin
    C := 0;
    for I := 0 to ChildrenCount - 1 do
      if (Children[I] is TControl) then
      begin
        if C = FControls.Count then
          FControls.Add(TControl(Children[I]))
        else
          if FControls[C] <> TControl(Children[I]) then
          begin
            Inc(Changes);
            FControls[C] := TControl(Children[I]);
          end;
        Inc(C);
      end;
    while C < FControls.Count do
    begin
      Inc(Changes);
      FControls.Delete(FControls.Count - 1);
    end;
    if Changes > 0 then
      Realign;
  end;
end;

procedure TCustomForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (Operation = TOperation.opRemove) and (AComponent = FResourceLink) then
    FResourceLink := nil;
  inherited;
end;

procedure TCustomForm.SetActiveHDControl(const Value: TControl);
begin
  SetActiveControl(Value);
end;

procedure TCustomForm.DisableUpdating;
begin
  Inc(FDisableUpdating);
end;

procedure TCustomForm.EnableUpdating;
begin
  Dec(FDisableUpdating);
  if FDisableUpdating < 0 then
    raise EInvalidSceneUpdatingPairCall.Create(SInvalidSceneUpdatingPairCall);
end;

procedure TCustomForm.SetFill(const Value: TBrush);
begin
  FFill.Assign(Value);
end;

procedure TCustomForm.SetQuality(const Value: TCanvasQuality);
begin
  if FQuality <> Value then
  begin
    FQuality := Value;
    if not (csLoading in ComponentState) then
      Recreate;
  end;
end;

procedure TCustomForm.SetStyleLookup(const Value: string);
begin
  FStyleLookup := Value;
  FNeedStyleLookup := True;
  if not (csLoading in ComponentState) then
    ApplyStyleLookup;
end;

procedure TCustomForm.StyleChangedHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
begin
  if (TStyleChangedMessage(Msg).Scene <> nil) and (TStyleChangedMessage(Msg).Scene <> IScene(Self)) then
    Exit;
  inherited;
end;

procedure TCustomForm.UpdateStyleBook;

  function IsLoadingOrDestroying(const AComponent: TComponent): Boolean;
  begin
    Result := (AComponent <> nil) and ((csLoading in AComponent.ComponentState) or 
                                       (csDestroying in AComponent.ComponentState));
  end;

begin
  if not IsLoadingOrDestroying(FStyleBook) then
  begin
    TMessageManager.DefaultManager.SendMessage(Self, TBeforeStyleChangingMessage.Create, True);
    TMessageManager.DefaultManager.SendMessage(Self, TStyleChangedMessage.Create(FStyleBook, Self), True);
  end;
  inherited;
end;

procedure TCustomForm.FillChanged(Sender: TObject);
begin
  SetLength(FUpdateRects, 0);
  AddUpdateRect(RectF(0, 0, ClientWidth, ClientHeight));
end;

function TCustomForm.GetCanvas: TCanvas;
begin
  if FTempCanvas <> nil then
    Result := FTempCanvas
  else
    Result := FCanvas;
end;

function TCustomForm.GetUpdateRectsCount: Integer;
begin
  Result := Length(FUpdateRects);
end;

function TCustomForm.GetWindowStyle: TWindowStyles;
begin
  if TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle then
    Result := inherited GetWindowStyle + [TWindowStyle.GPUSurface]
  else
    Result := inherited GetWindowStyle;
end;

function TCustomForm.GetUpdateRect(const Index: Integer): TRectF;
begin
  Result := FUpdateRects[Index];
end;

function TCustomForm.GetStyleObject: TFmxObject;
begin
  Result := TStyledControl.LookupStyleObject(Self, Self, Self, StyleLookup, '', '', True);
end;

procedure CallLoaded(const Obj: TFmxObject);
var
  I: Integer;
begin
  TOpenFmxObject(Obj).Loaded;
  for I := 0 to Obj.ChildrenCount - 1 do
    CallLoaded(Obj.Children[I]);
end;

procedure TCustomForm.ApplyStyleLookup;
var
  ResourceObject: TFmxObject;
  Control: TControl;
begin
  if FNeedStyleLookup then
  begin
    FNeedStyleLookup := False;
    ResourceObject := GetStyleObject;
    if ResourceObject <> nil then
    begin
      if csLoading in ResourceObject.ComponentState then
        CallLoaded(ResourceObject);
      FreeAndNil(FResourceLink);
      if ResourceObject is TControl then
      begin
        Control := TControl(ResourceObject);
        Control.Visible := True;
        Control.SetBounds(Control.Margins.Left, Control.Margins.Top,
          Width - Control.Margins.Width, Height - Control.Margins.Height);
        Control.Align := TAlignLayout.Contents;
        Control.Lock;
      end;
      FResourceLink := ResourceObject;
      FResourceLink.FreeNotification(Self);
      AddObject(ResourceObject);
      { bring to front }
      RemoveObject(ResourceObject);
      InsertObject(0, ResourceObject);
      { }
      ResourceObject.Stored := False;
    end;
  end;
end;

function TCustomForm.GetSceneScale: Single;
begin
  if Handle <> nil then
    Result := Handle.Scale
  else
    Result := 1;
end;

procedure TCustomForm.DoStyleChanged;
begin
  if csLoading in ComponentState then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  FNeedStyleLookup := True;
  if not (csLoading in ComponentState) then
    ApplyStyleLookup;
end;

function TCustomForm.GetActiveHDControl: TControl;
begin
  if (FActiveControl <> nil) and (FActiveControl.GetObject is TControl) then
    Result := TControl(FActiveControl.GetObject)
  else
    Result := nil;
end;

procedure TCustomForm.DoScaleChanged;
begin
  inherited;
  DoStyleChanged;
end;

function TCustomForm.ScreenToLocal(const P: TPointF): TPointF;
begin
  Result := ScreenToClient(P);
end;

function TCustomForm.LocalToScreen(const P: TPointF): TPointF;
begin
  Result := ClientToScreen(P);
end;

{ TCustomPopupForm }

constructor TCustomPopupForm.Create(AOwner: TComponent; AStyleBook: TStyleBook = nil; APlacementTarget: TControl = nil;
  AutoFree: Boolean = True);
var
  NewStyleBook: TStyleBook;
begin
  FAutoFree := AutoFree;
  if AutoFree then
    CreateNew(nil)
  else
    CreateNew(AOwner);
  BeginUpdate;
  try
    if APlacementTarget <> nil then
      FPlacementTarget := APlacementTarget
    else if (Owner is TControl) and (TControl(Owner).ParentControl <> nil) then
      FPlacementTarget := TControl(Owner).ParentControl;

    if FPlacementTarget = nil then
    begin
      if (Owner is TControl) and (TControl(Owner).Parent is TCommonCustomForm) then
        Parent := TCommonCustomForm(TControl(Owner).Parent)
      else
        if (Screen <> nil) and (Screen.ActiveForm <> nil) then
          Parent := Screen.ActiveForm;
    end
    else
      Parent := FPlacementTarget;

    if FPlacementTarget <> nil then
      TComponent(FPlacementTarget).FreeNotification(Self);
    if (AStyleBook = nil) and (PlacementTarget <> nil) and (PlacementTarget.Scene <> nil) then
      NewStyleBook := PlacementTarget.Scene.GetStyleBook
    else
      NewStyleBook := AStyleBook;
    SetStyleBookWithoutUpdate(NewStyleBook);
  finally
    EndUpdate;
  end;
end;

type
  TBoundsPopupForm = class(TBounds)
  private
    FPopupForm: TCustomPopupForm;
  protected
    procedure DoChange; override;
  public
    constructor Create(APopupForm: TCustomPopupForm); reintroduce;
  end;

  { TBoundsPopupForm }

constructor TBoundsPopupForm.Create(APopupForm: TCustomPopupForm);
begin
  inherited Create(TRectF.Create(0, 0, 0, 0));
  FPopupForm := APopupForm;
end;

procedure TBoundsPopupForm.DoChange;
begin
  inherited;
  if FPopupForm <> nil then
    FPopupForm.ApplyPlacement;
end;

constructor TCustomPopupForm.CreateNew(AOwner: TComponent; Dummy: NativeInt);

  function FindUniqueFormName(const Name: string): string;
  var
    I: Integer;
  begin
    I := 0;
    Result := Name;
    while (FindGlobalComponent(Result) <> nil) or
          ((AOwner <> nil) and (AOwner.FindComponent(Result) <> nil)) do
    begin
      Inc(I);
      Result := Format('%s_%d', [Name, I]);
    end;
  end;

begin
  Name := FindUniqueFormName('CustomPopupForm');
  inherited;
  FPreferedDisplayIndex := -1;
  FDragWithParent := True;
  FHideWhenPlacementTargetInvisible := False;
  FPlacementRectangle := TBoundsPopupForm.Create(Self);
  FContentPadding := TBoundsPopupForm.Create(Self);
  FSize := TSizeF.Create(320, 200);
  FPlacement := TPlacement.Bottom;
  FRealPlacement := FPlacement;
  Visible := False;
  BeginUpdate;
  try
    FormStyle := TFormStyle.Popup;
    Position := TFormPosition.Designed;
    BorderStyle := TFmxFormBorderStyle.None;
    Fill.Kind := TBrushKind.None;
    Transparency := True;
    Padding.DefaultValue := TRectF.Create(8, 8, 8, 8);
    Padding.Rect := Padding.DefaultValue;
  finally
    EndUpdate;
  end;
end;

destructor TCustomPopupForm.Destroy;
begin
  FreeAndNil(FTimer);
  if FPlacementTarget <> nil then
  begin
    TComponent(FPlacementTarget).RemoveFreeNotification(Self);
    FPlacementTarget := nil;
  end;
  FreeAndNil(FContentPadding);
  FreeAndNil(FPlacementRectangle);
  inherited;
end;

procedure TCustomPopupForm.DoClose(var CloseAction: TCloseAction);
begin
  if FAutoFree then
    CloseAction := TCloseAction.caFree;
  inherited;
  if CloseAction <> TCloseAction.caNone then
  begin
    if FTimer <> nil then
      FTimer.Enabled := False;
    SetStyleBookWithoutUpdate(nil);
  end;
end;

procedure TCustomPopupForm.DoPaddingChanged;
begin
  inherited;
  ApplyPlacement;
end;

procedure TCustomPopupForm.DoRealPlacementChanged;
begin
  if Assigned(FOnRealPlacementChanged) then
    FOnRealPlacementChanged(Self);
end;

function TCustomPopupForm.IsVisibleOnScreen(const AControl: TControl): Boolean;
var
  ObjectTmp: TFmxObject;
  ControlTmp: TControl;
  AbsoluteIntersectionRect: TRectF;
  AbsoluteClipRect: TRectF;
begin
  if AControl = nil then
    Exit(True);

  AbsoluteIntersectionRect := AControl.AbsoluteRect;
  ObjectTmp := AControl;
  while ObjectTmp.Parent <> nil do
  begin
    if (ObjectTmp is TControl) and TControl(ObjectTmp).ClipChildren then
    begin
      ControlTmp := TControl(ObjectTmp);
      AbsoluteClipRect := ControlTmp.LocalToAbsolute(ControlTmp.ClipRect);
      AbsoluteIntersectionRect.Intersect(AbsoluteClipRect);
      if AbsoluteIntersectionRect.IsEmpty then
        Exit(False);
    end;
    ObjectTmp := ObjectTmp.Parent;
  end;

  if ObjectTmp is TCommonCustomForm then
    Result := TCommonCustomForm(ObjectTmp).ClientRect.IntersectsWith(AbsoluteIntersectionRect)
  else
    Result := not AbsoluteIntersectionRect.IsEmpty;
end;

procedure TCustomPopupForm.TimerProc(Sender: TObject);
var
  T, LAniDuration: Double;
begin
  LAniDuration := AniDuration;
  if FAniState = TAniState.asShow then
  begin
    if LAniDuration <= 0 then
      FAniPosition := FMaxAniPosition
    else
    begin
      T := (Now - FShowTime) * SecsPerDay;
      if (T >= LAniDuration) then
        FAniPosition := FMaxAniPosition
      else
        FAniPosition := FMaxAniPosition * (T / LAniDuration);
    end;
    if FAniPosition >= FMaxAniPosition then
      FAniState := TAniState.asNone;
    if AniDuration >= 0 then
      DoAniTimer;
  end;
  if FAniState = TAniState.asClose then
  begin
    T := (Now - FCloseTime) * SecsPerDay;
    LAniDuration := LAniDuration * FMaxAniPosition;
    if (LAniDuration > 0) and (T < LAniDuration) then
      FAniPosition := FMaxAniPosition * (1 - (T / LAniDuration))
    else
      FAniPosition := 0;
    if AniDuration >= 0 then
      DoAniTimer;
    if FAniPosition <= 0 then
      Close;
  end;
  if FDragWithParent and FHideWhenPlacementTargetInvisible and not IsVisibleOnScreen(PlacementTarget) then
    Close
  else if (Visible or (FAniState = TAniState.asClose)) and (FFirstShow or FDragWithParent) then
    ApplyPlacement;
  if Visible and (not (FAniState = TAniState.asClose)) and (FFirstShow) then
    FFirstShow := False;
end;

function TCustomPopupForm.CanShow: Boolean;
begin
  Result := inherited CanShow;
  if Result and FDragWithParent and FHideWhenPlacementTargetInvisible and not IsVisibleOnScreen(PlacementTarget) then
    Result := False;
  if Result then
  begin
    FFirstShow := True;
    FMaxAniPosition := 1;
    if AniDuration <= 0 then
      FAniPosition := FMaxAniPosition
    else
      FAniPosition := 0;
    FCloseTime := 0;
    FShowTime := Now;
    if not (csDestroying in ComponentState) then
      DoBeforeShow;
    if AniDuration >= 0 then
    begin
      FAniState := TAniState.asShow;
      DoAniTimer;
    end
    else
      FAniState := TAniState.asNone;
    if FTimer = nil then
      FTimer := TTimer.Create(Self);
    FTimer.Interval := 20;
    FTimer.OnTimer := TimerProc;
    FTimer.Enabled := True;
  end;
end;

function TCustomPopupForm.CloseQuery;
  procedure PerformBeforeClose;
  begin
    if not (csDestroying in ComponentState) then
      DoBeforeClose;
  end;
begin
  FCloseTime := Now;
  FMaxAniPosition := FAniPosition;
  if (AniDuration <= 0) or (FAniState = TAniState.asClose) then
  begin
    FAniPosition := 0;
    if (AniDuration <= 0) and not (FAniState <> TAniState.asClose) then
    begin
      PerformBeforeClose;
      FAniState := TAniState.asClose;
      DoAniTimer;
    end;
    if FAniState = TAniState.asClose then
      Result := True
    else
    begin
      Result := inherited CloseQuery;
      if Result then
        PerformBeforeClose;
    end;
    if not Result then
    begin
      FAniPosition := 1;
      FMaxAniPosition := FAniPosition;
      if AniDuration = 0 then
      begin
        FAniState := TAniState.asNone;
        DoAniTimer;
      end;
    end;
  end
  else
  begin
    if inherited CloseQuery then
    begin
      PerformBeforeClose;
      FAniState := TAniState.asClose;
    end;
    Result := False;
  end;
end;

procedure TCustomPopupForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
  begin
    if AComponent = FPlacementTarget then
    begin
      FPlacementTarget := nil;
      ApplyPlacement;
    end;
    if AComponent = FContentControl then
      FContentControl := nil;
  end;
end;

procedure TCustomPopupForm.Realign;
var
  R: TRectF;
  Scale: Single;
begin
  if (ContentControl <> nil) and not FDisableAlign then
  begin
    R := Padding.PaddingRect(ClientRect);
    if ContentControl.AbsoluteMatrix.m11 > 0 then
      R.Width := R.Width / ContentControl.AbsoluteMatrix.m11;
    if ContentControl.AbsoluteMatrix.m22 > 0 then
      R.Height := R.Height / ContentControl.AbsoluteMatrix.m22;
    Scale := GetSceneScale;
    R.Top := RoundTo(R.Top * Scale, 0) / Scale;
    R.Left := RoundTo(R.Left * Scale, 0) / Scale;
    R.Width := Ceil(RoundTo(R.Width * Scale, -1)) / Scale;
    R.Height := Ceil(RoundTo(R.Height * Scale, -1)) / Scale;
    ContentControl.SetBounds(R.Left, R.Top, R.Width, R.Height);
  end;
  inherited;
end;

procedure TCustomPopupForm.SetDragWithParent(const Value: Boolean);
begin
  FDragWithParent := Value;
end;

procedure TCustomPopupForm.SetContentControl(const Value: TControl);
var
  NewScale: TPointF;
  RotatedControl: IRotatedControl;
begin
  if FContentControl <> Value then
  begin
    if FContentControl <> nil then
      TComponent(FContentControl).RemoveFreeNotification(Self);
    FContentControl := Value;
    if FContentControl <> nil then
    begin
      TComponent(FContentControl).FreeNotification(Self);
      BeginUpdate;
      try
        NewScale := TPointF.Create(FContentControl.AbsoluteMatrix.m11, FContentControl.AbsoluteMatrix.m22);
        FContentControl.Parent := Self;
        FContentControl.Align := TAlignLayout.None;
        if FContentControl.GetInterface(IRotatedControl, RotatedControl) then
          RotatedControl.Scale.Point := NewScale;
        FContentControl.Visible := True;
      finally
        EndUpdate;
      end;
    end;
  end;
end;

procedure TCustomPopupForm.SetContentPadding(const Value: TBounds);
begin
  FContentPadding.Assign(Value);
end;

procedure TCustomPopupForm.SetOffset(const Value: TPointF);
begin
  if FOffset <> Value then
  begin
    FOffset := Value;
    ApplyPlacement;
  end;
end;

procedure TCustomPopupForm.SetPlacement(const Value: TPlacement);
begin
  if FPlacement <> Value then
  begin
    FPlacement := Value;
    ApplyPlacement;
  end;
end;

procedure TCustomPopupForm.SetPlacementRectangle(const Value: TBounds);
begin
  FPlacementRectangle.Assign(Value);
end;

procedure TCustomPopupForm.SetPlacementTarget(const Value: TControl);
begin
  if FPlacementTarget <> Value then
  begin
    if FPlacementTarget <> nil then
      TComponent(FPlacementTarget).RemoveFreeNotification(self);
    FPlacementTarget := Value;
    if FPlacementTarget <> nil then
      TComponent(FPlacementTarget).FreeNotification(Self);
  end;
end;

procedure TCustomPopupForm.SetPreferedDisplayIndex(const Value: Integer);
begin
  if FPreferedDisplayIndex <> Value then
  begin
    FPreferedDisplayIndex := Value;
    ApplyPlacement;
  end;
end;

procedure TCustomPopupForm.SetSize(const Value: TSizeF);
begin
  if FSize <> Value then
  begin
    FSize := Value;
    ApplyPlacement;
  end;
end;

procedure TCustomPopupForm.Loaded;
begin
  inherited;
  if FPlacementChanged then
    ApplyPlacement;
end;

procedure TCustomPopupForm.Updated;
begin
  inherited;
  if FPlacementChanged then
    ApplyPlacement;
end;

procedure TCustomPopupForm.DoAniTimer;
begin
  if Assigned(OnAniTimer) then
    OnAniTimer(self);
end;

procedure TCustomPopupForm.DoApplyPlacement;
var
  AbsolutePos: TPointF;
  Pos: TPointF;
  MouseSvc: IFMXMouseService;
  LRect: TRectF;
  LPlacement: TPlacement;
  LOffset: TPointF;
  LStep: Byte;
  LSoGood: Boolean;
  SourceSize: TSizeF;
  PlacementByTarget: Boolean;

  function UpdateRectByScreen(var R: TRectF): Boolean;
  var
    WorkareaRect: TRectF;
    WorkareaRectF: TRectF;
    W, H: Single;
    P: TPointF;
  begin
    Result := True;
    R := Padding.PaddingRect(R);
    case LPlacement of
      TPlacement.Absolute:
        WorkareaRect := Screen.DisplayFromRect(R).Workarea;
      TPlacement.Mouse, TPlacement.MouseCenter:
        WorkareaRect := Screen.DisplayFromPoint(Screen.MousePos).Workarea
    else
      if not InRange(FPreferedDisplayIndex, 0, Screen.DisplayCount - 1) then
      begin
        if (PlacementTarget <> nil) and (PlacementTarget.Root is TCommonCustomForm) and
          TCommonCustomForm(PlacementTarget.Root).Visible then
        begin
          P := TPointF.Create(PlacementTarget.Width / 2, PlacementTarget.Height / 2);
          P := PlacementTarget.LocalToAbsolute(P);
          FPreferedDisplayIndex := Screen.DisplayFromForm(TCommonCustomForm(PlacementTarget.Root), P).Index;
        end
        else
          FPreferedDisplayIndex := Screen.DisplayFromForm(Self).Index;
      end;
      WorkareaRect := Screen.Displays[FPreferedDisplayIndex].Workarea;
    end;
    WorkareaRectF := TRectF.Create(WorkareaRect.Left - ContentPadding.Left, WorkareaRect.Top - ContentPadding.Top,
      WorkareaRect.Right + ContentPadding.Right, WorkareaRect.Bottom + ContentPadding.Bottom);
    if not (csDesigning in ComponentState) then
    begin
      W := R.Width;
      H := R.Height;
      if R.Left > WorkareaRectF.Left then
      begin
        if R.Left > WorkareaRectF.Right - W then
        begin
          R.Left := WorkareaRectF.Right - W;
          if LPlacement = TPlacement.Right then
          begin
            LPlacement := TPlacement.Left;
            Result := False;
          end;
          if LPlacement = TPlacement.RightCenter then
          begin
            LPlacement := TPlacement.LeftCenter;
            Result := False;
          end;
        end;
      end
      else
      begin
        R.Left := WorkareaRectF.Left;
        if LPlacement = TPlacement.Left then
        begin
          LPlacement := TPlacement.Right;
          Result := False;
        end;
        if LPlacement = TPlacement.LeftCenter then
        begin
          LPlacement := TPlacement.RightCenter;
          Result := False;
        end;
      end;
      if R.Top > WorkareaRectF.Top then
      begin
        if R.Top > WorkareaRectF.Bottom - H then
        begin
          R.Top := WorkareaRectF.Bottom - H;
          if LPlacement = TPlacement.Bottom then
          begin
            LPlacement := TPlacement.Top;
            Result := False;
          end;
          if LPlacement = TPlacement.BottomCenter then
          begin
            LPlacement := TPlacement.TopCenter;
            Result := False;
          end;
        end;
      end
      else
      begin
        R.Top := WorkareaRectF.Top;
        if LPlacement = TPlacement.Top then
        begin
          LPlacement := TPlacement.Bottom;
          Result := False;
        end;
        if LPlacement = TPlacement.TopCenter then
        begin
          LPlacement := TPlacement.BottomCenter;
          Result := False;
        end;
      end;
      R.Width := W;
      R.Height := H;
    end;
    R := Padding.MarginRect(R);
  end;

begin
  FPlacementChanged := False;
  LOffset := Offset;
  LPlacement := Placement;
  LStep := 0;
  repeat
    LRect := FPlacementRectangle.Rect;
    if (PlacementTarget <> nil) and FPlacementRectangle.Empty then
      LRect := TRectF.Create(0, 0, PlacementTarget.Width, PlacementTarget.Height);
    if (PlacementTarget = nil) and PlacementRectangle.Empty and
       (not (LPlacement in [TPlacement.Absolute, TPlacement.Mouse, TPlacement.MouseCenter])) then
    begin
      if not TPlatformServices.Current.SupportsPlatformService(IFMXMouseService, MouseSvc) then
        LPlacement := TPlacement.Absolute
      else
        LPlacement := TPlacement.Mouse;
    end;
    FScreenPlacementRect := LRect;
    // Vertical Offset
    if LPlacement in [TPlacement.Top, TPlacement.TopCenter] then
      LRect.Offset(0, ContentPadding.Bottom - LOffset.Y)
    else
      LRect.Offset(0, LOffset.Y - ContentPadding.Top);
    // Horizontal Offset
    if LPlacement in [TPlacement.Left, TPlacement.LeftCenter] then
      LRect.Offset(ContentPadding.Right - LOffset.X, 0)
    else
      LRect.Offset(LOffset.X - ContentPadding.Left, 0);
    // Offset by rect
    PlacementByTarget := not (LPlacement in [TPlacement.Absolute, TPlacement.Mouse, TPlacement.MouseCenter]);
    SourceSize := Size;
    if (PlacementTarget <> nil) and PlacementByTarget then
    begin
      SourceSize.cx := SourceSize.cx / PlacementTarget.AbsoluteScale.X;
      SourceSize.cy := SourceSize.cy / PlacementTarget.AbsoluteScale.Y;
    end;
    case LPlacement of
      TPlacement.Bottom:
        LRect.Offset(0, LRect.Height);
      TPlacement.Top:
        LRect.Offset(0, -SourceSize.cy);
      TPlacement.Left:
        LRect.Offset(-SourceSize.cx, 0);
      TPlacement.Right:
        LRect.Offset(LRect.Width, 0);
      TPlacement.Center:
        LRect.Offset((LRect.Width - SourceSize.cx) / 2, (LRect.Height - SourceSize.cy) / 2);
      TPlacement.BottomCenter:
        LRect.Offset((LRect.Width - SourceSize.cx) / 2, LRect.Height);
      TPlacement.TopCenter:
        LRect.Offset((LRect.Width - SourceSize.cx) / 2, -SourceSize.cy);
      TPlacement.LeftCenter:
        LRect.Offset(-SourceSize.cx, (LRect.Height - SourceSize.cy) / 2);
      TPlacement.RightCenter:
        LRect.Offset(LRect.Width, (LRect.Height - SourceSize.cy) / 2);
      TPlacement.Absolute:
        begin
          if FPlacementRectangle.Empty then
            LRect := TRectF.Create(FPlacementRectangle.Rect.TopLeft, SourceSize.cx, SourceSize.cy)
          else
            LRect := FPlacementRectangle.Rect;
        end;
      TPlacement.Mouse, TPlacement.MouseCenter:
        begin
          Pos := Screen.MousePos;
          LRect := TRectF.Create(Pos, SourceSize.cx, SourceSize.cy);
          if LPlacement = TPlacement.MouseCenter then
            LRect.Offset(-SourceSize.cx / 2, -SourceSize.cy / 2);
        end;
    end;
    // use border
    LRect := Padding.MarginRect(LRect);
    if PlacementByTarget then
    begin
      AbsolutePos := LRect.TopLeft;
      AbsolutePos.Offset(Padding.Left, Padding.Top);
      if PlacementTarget <> nil then
      begin
        AbsolutePos := PlacementTarget.LocalToAbsolute(AbsolutePos);
        FScreenPlacementRect := PlacementTarget.LocalToAbsolute(FScreenPlacementRect);
        if PlacementTarget.Scene <> nil then
        begin
          AbsolutePos := PlacementTarget.Scene.LocalToScreen(AbsolutePos);
          FScreenPlacementRect.TopLeft := PlacementTarget.Scene.LocalToScreen(FScreenPlacementRect.TopLeft);
          FScreenPlacementRect.BottomRight := PlacementTarget.Scene.LocalToScreen(FScreenPlacementRect.BottomRight);
        end;
      end;
      LRect := TRectF.Create(AbsolutePos, Size.cx, Size.cy);
      LRect := Padding.MarginRect(LRect);
    end;
    LSoGood := UpdateRectByScreen(LRect);
    Inc(LStep);
  until LSoGood or (LStep > 1);
  FScreenContentRect := LRect;
  FScreenContentRect := inherited Padding.PaddingRect(FScreenContentRect);
  FScreenContentRect := FContentPadding.PaddingRect(FScreenContentRect);
  FRealPlacement := LPlacement;
  SetBoundsF(LRect);
end;

procedure TCustomPopupForm.DoBeforeClose;
begin
  if Assigned(BeforeClose) then
    BeforeClose(self);
end;

procedure TCustomPopupForm.DoBeforeShow;
begin
  if Assigned(BeforeShow) then
    BeforeShow(self);
end;

procedure TCustomPopupForm.ApplyPlacement;
var
  OldRect, NewRect: TRectF;
  OldRealPlacement: TPlacement;
begin
  if ([csLoading, csUpdating, csDestroying] * ComponentState) = [] then
  begin
    OldRect := TRectF.Create(Left, Top, Left + Width, Top + Height);
    OldRealPlacement := FRealPlacement;
    DoApplyPlacement;
    NewRect := TRectF.Create(Left, Top, Left + Width, Top + Height);
    if (NewRect <> OldRect) or (OldRealPlacement <> RealPlacement) then
      DoRealPlacementChanged;
  end
  else
    FPlacementChanged := True;
end;

{ TFrame }

procedure TFrame.AfterConstruction;
begin
  inherited;
  Resize;
  DoResized;
end;

function TFrame.CheckHitTest(const AHitTest: Boolean): Boolean;
begin
  Result := AHitTest;
  // We should turn off Locked functionality for design time, if design TFrame.
  if csDesigning in ComponentState then
  begin
    if Visible then
      Result := True;
    if not Supports(Parent, IDesignerForm) and FLocked then
      Result := False;
  end;
end;

constructor TFrame.Create(AOwner: TComponent);
var
  LRoot: IRoot;
begin
  inherited;
  if Supports(AOwner, IRoot, LRoot) then
    Self.SetRoot(LRoot);
  Size.PlatformDefault := False;
  EnableExecuteAction := False;
  if (ClassType <> TFrame) and not (csDesignInstance in ComponentState) then
  begin
    if not InitInheritedComponent(Self, TFrame) then
      raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
  end
  else
  begin
    Width := 320;
    Height := 240;
  end;
end;

procedure TFrame.DoResized;
begin
  // See comments to TFrame.Resize code.
  if not FInLoaded then
    inherited;
end;

procedure TFrame.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if not OwnedComponent.HasParent then Proc(OwnedComponent);
    end;
end;

function TFrame.GetVisible: Boolean;
begin
  Result := inherited or ((csDesigning in ComponentState) and Supports(Root, IDesignerForm));
end;

procedure TFrame.Loaded;
begin
  FInLoaded := True;
  try
    inherited;
    if (csDesigning in ComponentState) and not (DesignInfo = 0) then
    begin
      Position.X := LongRec(DesignInfo).Lo;
      Position.Y := LongRec(DesignInfo).Hi;
      DesignInfo := 0;
    end;
  finally
    FInLoaded := False;
  end;
end;

procedure TFrame.Paint;
var
  R: TRectF;
begin
  inherited;
  if (csDesigning in ComponentState) then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.Stroke.Thickness := 1;
    Canvas.Stroke.Dash := TStrokeDash.Dash;
    Canvas.Stroke.Kind := TBrushKind.Solid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
  end;
end;

procedure TFrame.Resize;
begin
  // Because the Loaded method is called from the frame constructor, we may find ourselves in a situation where events
  // are triggered in the middle of the frame construction process. In this case, some user data may not be initialized
  // yet. Therefore, we disable the call of the resize event to call it strictly after the constructor in the
  // AfterConstruction.
  if not FInLoaded then
    inherited;
end;

function TFrame.ShouldTestMouseHits: Boolean;
begin
  Result := inherited or ((csDesigning in ComponentState) and Supports(Root, IDesignerForm));
end;

{ TScreen }

constructor TScreen.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Let VCL manage datamodules if it is around
  if (not Assigned(System.Classes.AddDataModule))
    and (not Assigned(System.Classes.RemoveDataModule)) then
  begin
    System.Classes.AddDataModule := AddDataModule;
    System.Classes.RemoveDataModule := RemoveDataModule;
    FManagingDataModules := True
  end
  else
    FManagingDataModules := False;

  FForms := TList<Pointer>.Create;
  FDataModules := TList<Pointer>.Create;
  FPopupForms := TList<Pointer>.Create;
end;

destructor TScreen.Destroy;
begin
  FreeAndNil(FDataModules);
  FreeAndNil(FForms);
  FreeAndNil(FPopupForms);
  FreeAndNil(FPopupList);

  if FManagingDataModules then
  begin
    System.Classes.AddDataModule := nil;
    System.Classes.RemoveDataModule := nil;
  end;

  inherited Destroy;
end;

procedure TScreen.AddDataModule(DataModule: TDataModule);
begin
  FDataModules.Add(DataModule);
end;

procedure TScreen.RemoveDataModule(DataModule: TDataModule);
begin
  FDataModules.Remove(DataModule);
end;

type
  TFormList = class (TList<TCommonCustomForm>)
  private
    FMessage: TMessageSubscriptionId;
    procedure FormReleased(const Sender: TObject; const M: System.Messaging.TMessage);
  public
    constructor Create;
    destructor Destroy; override;
  end;

{ TFormList }

constructor TFormList.Create;
begin
  inherited Create;
  FMessage := TMessageManager.DefaultManager.SubscribeToMessage(TFormReleasedMessage, FormReleased);
end;

destructor TFormList.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TFormReleasedMessage, FMessage);
  inherited;
end;

procedure TFormList.FormReleased(const Sender : TObject; const M : System.Messaging.TMessage);
begin
  if Sender is TCommonCustomForm then
    Remove(TCommonCustomForm(Sender));
end;

procedure TScreen.CloseFormList(const List: TList<TCommonCustomForm>);
var
  Found: Boolean;
  I: Integer;
  ClosedList: TList<TCommonCustomForm>;
begin
  if (List <> nil) and (List.Count > 0) then
  begin
    Found := True;
    ClosedList := TList<TCommonCustomForm>.Create;
    try
      while Found do
      begin
        Found := False;
        for I := List.Count - 1 downto 0 do
          if List[I].Visible and not ClosedList.Contains(List[I]) then
          begin
            Found := True;
            ClosedList.Add(List[I]);
            List[I].Close;
            Break;
          end;
      end;
    finally
      FreeAndNil(ClosedList);
    end;
  end;
end;

function TScreen.CreatePopupList(const SaveForm: TCommonCustomForm): TList<TCommonCustomForm>;
var
  LSaveForm: TCommonCustomForm;
  I: Integer;
begin
  Result := TFormList.Create;
  try
    if (SaveForm <> nil) and (SaveForm.FormStyle = TFormStyle.Popup) then
      LSaveForm := SaveForm
    else
      LSaveForm := nil;
    for I := 0 to PopupFormCount - 1 do
      if (LSaveForm <> PopupForms[I]) and (PopupForms[I].Visible) and (not Result.Contains(PopupForms[I])) and
        (([csDesigning, csDestroying] * PopupForms[I].ComponentState) = []) and
        not IsParent(LSaveForm, PopupForms[I])
      then
        Result.Add(PopupForms[I]);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;

function TScreen.PrepareClosePopups(const SaveForm: TCommonCustomForm): Boolean;
var
  NewPopupList: TList<TCommonCustomForm>;
begin
  if not FClosingPopupList then
  begin
    NewPopupList := CreatePopupList(SaveForm);
    FreeAndNil(FPopupList);
    FPopupList := NewPopupList;
    Result := (FPopupList <> nil) and (FPopupList.Count > 0);
  end
  else
    Result := False;
end;

function TScreen.ClosePopupForms: Boolean;
begin
  Result := not FClosingPopupList and (FPopupList <> nil) and (FPopupList.Count > 0);
  if Result then
  begin
    FClosingPopupList := True;
    try
      CloseFormList(FPopupList);
    finally
      FClosingPopupList := False;
      FreeAndNil(FPopupList);
    end;
  end;
end;

function TScreen.Contains(const AComponent: TComponent): Boolean;
begin
  Result := FForms.Contains(AComponent) or
            FDataModules.Contains(AComponent) or
            FPopupForms.Contains(AComponent);
end;

procedure TScreen.AddForm(const AForm: TCommonCustomForm);

  function FindUniqueFormName(const Name: string): string;
  var
    I: Integer;
  begin
    I := 0;
    Result := Name;
    while (FindGlobalComponent(Result) <> nil) do
    begin
      Inc(I);
      Result := Format('%s_%d', [Name, I]);
    end;
  end;

begin
  if AForm <> nil then
  begin
    if Length(AForm.Name) = 0 then
      AForm.Name := FindUniqueFormName('form_' + IntToHex(NativeUInt(AForm), 2*SizeOf(NativeUInt)))
    else
      AForm.Name := FindUniqueFormName(AForm.Name);
    if AForm.FormStyle = TFormStyle.Popup then
      FPopupForms.Add(AForm)
    else
      FForms.Insert(0, AForm);
  end;
end;

procedure TScreen.RemoveForm(const AForm: TCommonCustomForm);
begin
  if AForm <> nil then
  begin
    if AForm = FSaveForm then
      FSaveForm := nil;
    FForms.Remove(AForm);
    FPopupForms.Remove(AForm);
  end;
end;

function TScreen.IndexFormOfObject(const AObject: TFmxObject; const VisibleOnly: Boolean = True): Integer;

   function FindForm(const AObject: TFmxObject; var AForm: TCommonCustomForm): Boolean;
   var
     TmpObject: TFmxObject;
   begin
     TmpObject := AObject;
     while (TmpObject <> nil) and not (TmpObject is TCommonCustomForm) do
       TmpObject := TmpObject.Parent;

     Result := TmpObject is TCommonCustomForm;
     if Result then
       AForm := TCommonCustomForm(TmpObject);
   end;

var
  I: Integer;
  Form: TCommonCustomForm;
begin
  Result := -1;
  if FindForm(AObject, Form) then
    for I := 0 to FormCount - 1 do
      if (Forms[I] = Form) and (not VisibleOnly or Forms[I].Visible) then
      begin
        Result := I;
        Break;
      end;
  end;

function TScreen.MousePos: TPointF;
begin
  if FMouseSvc = nil then
  begin
    if not TPlatformServices.Current.SupportsPlatformService(IFMXMouseService, FMouseSvc) then
      raise EUnsupportedPlatformService.Create('IFMXMouseService');
  end;
  Result := FMouseSvc.GetMousePos;
end;

function TScreen.NextActiveForm(const OldActiveForm: TCommonCustomForm): TCommonCustomForm;
var
  I, CurrIndex: Integer;
begin
  Result := nil;
  CurrIndex := IndexFormOfObject(OldActiveForm);
  if CurrIndex >= 0 then
  begin
    I := CurrIndex - 1;
    while (I >= 0) and not Forms[I].Visible do
      Dec(I);
    if I < 0 then
    begin
      I := FormCount - 1;
      while (I >= 0) and (I <> CurrIndex) and not Forms[I].Visible do
        Dec(I);
    end;
    if (I >= 0) and (I <> CurrIndex) then
    begin
      Result := Forms[I];
      ActiveForm := Result;
    end;
  end;
end;

function TScreen.GetActiveForm: TCommonCustomForm;
var
  I: Integer;
  Form: TCommonCustomForm;
begin
  Result := nil;
  if self <> nil then
  for I := FormCount - 1 downto 0 do
  begin
    Form := Forms[I];
    if Form.Visible and Form.Active then
    begin
      Result := Form;
      Break;
    end;
  end;
end;

function TScreen.IsParent(AForm, AParent: TCommonCustomForm): Boolean;
begin
  Result := False;
  if (AForm <> nil) and (AParent <> nil) then
  begin
    AForm := AForm.ParentForm;
    while AForm <> nil do
    begin
      if AForm = AParent then
      begin
        Result := True;
        Exit;
      end;
      AForm := AForm.ParentForm;
    end;
  end;
end;

procedure TScreen.SetActiveForm(const Value: TCommonCustomForm);
var
  NewActiveForm: TCommonCustomForm;
  I, J: Integer;
  LParentForm: TCommonCustomForm;
  ParentList: TList<TCommonCustomForm>;
begin
  if Value <> nil then
  begin
    I := IndexFormOfObject(Value);
    if I < 0 then
      raise EInvalidFmxHandle.Create(sArgumentInvalid);
    NewActiveForm := Forms[I];
    for I := 0 to FormCount - 1 do
      if (Forms[I] <> NewActiveForm) and (not IsParent(Forms[I], NewActiveForm)) then
        Forms[I].Deactivate;
    if not NewActiveForm.Active then
      NewActiveForm.Activate;
    if NewActiveForm.Active then
    begin
      ParentList := TList<TCommonCustomForm>.Create;
      try
        LParentForm := NewActiveForm;
        while LParentForm <> nil do
        begin
          ParentList.Add(LParentForm);
          LParentForm := LParentForm.ParentForm;
        end;
        for J := ParentList.Count - 1 downto 0 do
        begin
          I := IndexFormOfObject(ParentList[J]);
          if (I >= 0) and (I < FormCount - 1) then
          begin
            FForms.Delete(I);
            FForms.Add(ParentList[J]);
          end;
        end;
      finally
        ParentList.Free;
      end;
    end;
  end
  else
  begin
    for I := 0 to FormCount - 1 do
      Forms[I].Deactivate;
  end
end;

function TScreen.Size: TSizeF;
var
  ScreenService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
    Result := ScreenService.GetScreenSize
  else
    Result := TSizeF.Create(0, 0);
end;

function TScreen.GetHeight: Single;
begin
  Result := Size.cy;
end;

function TScreen.GetWidth: Single;
begin
  Result := Size.cx;
end;

function TScreen.MultiDisplaySupported: Boolean;
begin
  if FMultiDisplaySvc = nil then
    Result := TPlatformServices.Current.SupportsPlatformService(IFMXMultiDisplayService, FMultiDisplaySvc)
  else
    Result := True;

  Result := Result and (IFMXMultiDisplayService(FMultiDisplaySvc).DisplayCount > 0);
end;

procedure TScreen.UpdateDisplayInformation;
begin
  if MultiDisplaySupported then
    IFMXMultiDisplayService(FMultiDisplaySvc).UpdateDisplayInformation;
end;

function TScreen.GetWorkAreaRect: TRectF;
begin
  if MultiDisplaySupported then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).WorkAreaRect
  else
    Result := TRectF.Create(TPoint.Zero, Size.cx, Size.cy);
end;

function TScreen.GetWorkAreaHeight: Single;
begin
  Result := GetWorkAreaRect.Height;
end;

function TScreen.GetWorkAreaLeft: Single;
begin
  Result := GetWorkAreaRect.Left;
end;

function TScreen.GetWorkAreaTop: Single;
begin
  Result := GetWorkAreaRect.Top;
end;

function TScreen.GetWorkAreaWidth: Single;
begin
  Result := GetWorkAreaRect.Width;
end;

function TScreen.GetDesktopRect: TRectF;
begin
  if MultiDisplaySupported then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).DesktopRect
  else
    Result := TRectF.Create(TPoint.Zero, Size.cx, Size.cy);
end;

function TScreen.GetDesktopCenterRect(const Size: TSizeF): TRectF;
var
  DesktopCenter: TPointF;
begin
  if MultiDisplaySupported then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).GetDesktopCenterRect(Size)
  else
  begin
    DesktopCenter := GetDesktopRect.CenterPoint;
    Result := TRectF.Create(TPointF.Create(DesktopCenter.X - Size.cx / 2, DesktopCenter.Y - Size.cy / 2),
                            Size.cx, Size.cy);
  end;
end;

function TScreen.GetDesktopHeight: Single;
begin
  Result := GetDesktopRect.Height;
end;

function TScreen.GetDesktopLeft: Single;
begin
  Result := GetDesktopRect.Left;
end;

function TScreen.GetDesktopTop: Single;
begin
  Result := GetDesktopRect.Top;
end;

function TScreen.GetDesktopWidth: Single;
begin
  Result := GetDesktopRect.Width;
end;

function TScreen.GetDisplayCount: Integer;
begin
  if MultiDisplaySupported then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).DisplayCount
  else
    Result := 1;
end;

function TScreen.GetDisplay(const Index: Integer): TDisplay;
begin
  if (Index < 0) or (Index >= GetDisplayCount) then
    ListIndexError(Index, GetDisplayCount - 1, Self);

  if MultiDisplaySupported then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).Displays[Index]
  else
    Result := TDisplay.Create(0, True, GetDesktopRect, GetWorkAreaRect);
end;

function TScreen.DisplayFromPoint(const Point: TPoint): TDisplay;

  function SQRDistance2(R: TRect): Integer;
  var
    DX, DY: Integer;
  begin
    if Point.Y < R.Top then
      Dy := R.Top - Point.Y
    else if Point.Y > R.Bottom then
      Dy := Point.Y - R.Bottom
    else
      Dy := 0;

    if Point.X < R.Left then
      Dx := R.Left - Point.X
    else if Point.X > R.Right then
      Dx := Point.X - R.Right
    else
      Dx := 0;

    Result := Dx + Dy;
  end;

var
  Index, I, Distance, MinDistance: Integer;
begin
  if DisplayCount > 1 then
  begin
    for I := 0 to DisplayCount - 1 do
      if Displays[I].Workarea.Contains(Point) then
        Exit(Displays[I]);
    Index := 0;
    MinDistance := SQRDistance2(Displays[0].Workarea.Round);
    for I := 1 to DisplayCount - 1 do
    begin
      Distance := SQRDistance2(Displays[I].Workarea.Round);
      if Distance < MinDistance then
      begin
        Index := I;
        MinDistance := Distance;
      end
    end;
    Result := Displays[Index];
  end
  else
    Result := Displays[0];
end;

function TScreen.DisplayFromPoint(const Point: TPointF): TDisplay;
begin
  Result := DisplayFromPoint(Point.Round);
end;

function TScreen.DisplayFromRect(const Rect: TRect): TDisplay;
begin
  Result := DisplayFromPoint(TPoint.Create((Rect.Left + Rect.Right) div 2, (Rect.Top + Rect.Bottom) div 2));
end;

function TScreen.DisplayFromRect(const Rect: TRectF): TDisplay;
begin
  Result := DisplayFromRect(Rect.Round);
end;

function TScreen.DisplayFromForm(const Form: TCommonCustomForm): TDisplay;
begin
  if Form = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  if DisplayCount > 1 then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).DisplayFromWindow(Form.Handle)
  else
    Result := Displays[0];
end;

function TScreen.DisplayFromForm(const Form: TCommonCustomForm; const Point: TPoint): TDisplay;
begin
  if Form = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  if DisplayCount > 1 then
    Result := IFMXMultiDisplayService(FMultiDisplaySvc).DisplayFromPoint(Form.Handle, Point)
  else
    Result := Displays[0];
end;

function TScreen.DisplayFromForm(const Form: TCommonCustomForm; const Point: TPointF): TDisplay;
begin
  Result := DisplayFromForm(Form, Point.Round);
end;

function TScreen.GetFocusObject: TFmxObject;
var
  LForm: TCommonCustomForm;
begin
  Result := nil;
  if Self <> nil then
  begin
    LForm := GetActiveForm;
    if (LForm <> nil) and (LForm.Focused <> nil) then
      Result := LForm.Focused.GetObject;
  end;
end;

function TScreen.GetFocusControl: IControl;
var
  LForm: TCommonCustomForm;
begin
  Result := nil;
  if Self <> nil then
  begin
    LForm := GetActiveForm;
    if (LForm <> nil) and (LForm.Focused <> nil) then
      Result := LForm.Focused;
  end;
end;

function TScreen.GetObjectByTarget(const Target: TObject): TFmxObject;
var
  TargetControl: IControl;
begin
  Result := nil;
  if Target <> nil then
  begin
    // 1. Target as IControl
    if Supports(Target, IControl, TargetControl) then
      Result := TargetControl.GetObject;
    // 2. Target as Form
    if (Result = nil) and (Target is TCommonCustomForm) then
      Result := TCommonCustomForm(Target);
  end;

  if (Result = nil) and (Self <> nil) then
  begin
    // 3. FocusControl
    if FocusControl <> nil then
      Result := FocusControl.GetObject;
    // 4. ActiveForm
    if Result = nil then
      Result := ActiveForm;
  end;
  // 5. MainForm
  if (Result = nil) and (Application <> nil) then
    Result := Application.MainForm;
end;

function TScreen.GetPopupForms(Index: Integer): TCommonCustomForm;
begin
  Result := FPopupForms[Index];
end;

function TScreen.GetPopupFormCount: Integer;
begin
  Result := FPopupForms.Count;
end;

function TScreen.GetDataModule(Index: Integer): TDataModule;
begin
  Result := FDataModules[Index];
end;

function TScreen.GetDataModuleCount: Integer;
begin
  Result := FDataModules.Count;
end;

function TScreen.GetForm(Index: Integer): TCommonCustomForm;
begin
  Result := FForms[Index];
end;

function TScreen.GetFormCount: Integer;
begin
  Result := FForms.Count;
end;

function FindGlobalComponent(const Name: string): TComponent;
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    Result := Screen.Forms[I];
    if not (csInline in Result.ComponentState) and
      (CompareText(Name, Result.Name) = 0) then Exit;
  end;
  for I := 0 to Screen.PopupFormCount - 1 do
  begin
    Result := Screen.PopupForms[I];
    if not (csInline in Result.ComponentState) and
      (CompareText(Name, Result.Name) = 0) then Exit;
  end;
  for I := 0 to Screen.DataModuleCount - 1 do
  begin
    Result := Screen.DataModules[I];
    if CompareText(Name, Result.Name) = 0 then Exit;
  end;
  Result := nil;
end;

{ TFormFactor }

constructor TFormFactor.Create;
var
  ScreenSize : TPoint;
begin
  inherited Create;

  ScreenSize := TPoint.Create(320, 480);

  FSize := TSize.Create(ScreenSize.X, ScreenSize.Y);
  FOrientations := [TFormOrientation.Portrait, TFormOrientation.Landscape];
  FDevices := [Low(TDeviceKind)..High(TDeviceKind)];
end;

procedure TFormFactor.AdjustToScreenSize;
var
  ScreenService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
  begin
    Width := ScreenService.GetScreenSize.Truncate.X;
    Height := ScreenService.GetScreenSize.Truncate.Y;
  end;
end;

procedure TFormFactor.SetHeight(const Value: Integer);
begin
  FSize.cy := Value;
end;

procedure TFormFactor.SetWidth(const Value: Integer);
begin
  FSize.cx := Value;
end;

function TFormFactor.GetWidth : Integer;
begin
  Result := FSize.cx;
end;

function TFormFactor.GetHeight : Integer;
begin
  Result := FSize.cy;
end;

procedure TFormFactor.SetSupportedOrientations(AOrientations: TFormOrientations);
begin
  FOrientations := AOrientations;
end;

{$IFDEF MSWINDOWS}
var
  IsFormsFinalized: Int8 = Int8(False);
{$ENDIF}

procedure FinalizeForms;
begin
{$IFDEF MSWINDOWS}
  if AtomicExchange(IsFormsFinalized, Int8(True)) = Int8(False) then
{$ENDIF}
  begin
    FreeControls;
    TStyleManager.UnInitialize;
    TFilterManager.UnInitialize;
    TBitmapCodecManager.UnInitialize;
    TTextLayoutManager.UnInitialize;
    TCanvasManager.UnInitialize;
    TShaderManager.UnInitialize;
    TContextManager.UnInitialize;
  end;
end;

function PropertyValuesFromStream(const ComponentName: string; const Properties: array of string; const Input: TStream): TArray<Variant>;
var
  PropValues: TDictionary<string, Variant>;
  Reader: TReader;
  ObjectName, PropName: string;
  FoundComponent, FoundProperty: Boolean;
  FoundValue: TList<Variant>;

  procedure ConvertValue; forward;

  procedure ConvertHeader(RootComponent: Boolean);
  var
    ClassName: string;
    Flags: TFilerFlags;
    Position: Integer;
  begin
    Reader.ReadPrefix(Flags, Position);
    ClassName := Reader.ReadStr;
    ObjectName := Reader.ReadStr;
    if (RootComponent and (ComponentName = '')) or SameText(ComponentName, ObjectName) then
      FoundComponent := True;
    if ObjectName = '' then
      ObjectName := ClassName;
  end;

  procedure AddValue(const V: Variant);
  begin
    if FoundProperty then
      FoundValue.Add(V);
  end;

  procedure ConvertProperty; forward;

  procedure ConvertValue;
  const
    LineLength = 64;
  var
    I: Integer;
    S, V: string;
  begin
    case Reader.NextValue of
      vaList:
        begin
          Reader.ReadValue;
          while not Reader.EndOfList do
            ConvertValue;
          Reader.ReadListEnd;
        end;
      vaInt8, vaInt16, vaInt32:
        AddValue(Reader.ReadInteger);
      vaExtended:
        AddValue(Reader.ReadFloat);
      vaDouble:
        AddValue(Reader.ReadDouble);
      vaSingle:
        AddValue(Reader.ReadSingle);
      vaCurrency:
        AddValue(Reader.ReadCurrency);
      vaDate:
        AddValue(Reader.ReadDate);
      vaWString, vaUTF8String, vaString, vaLString:
        AddValue(Reader.ReadString);
      vaIdent, vaFalse, vaTrue, vaNil, vaNull:
        AddValue(Reader.ReadIdent);
      vaBinary:
        Reader.SkipValue;
      vaSet:
        begin
          Reader.ReadValue;
          I := 0;
          V := '';
          while True do
          begin
            S := Reader.ReadStr;
            if S = '' then Break;
            if I > 0 then V := V + ', ';
            V := V + S;
            Inc(I);
          end;
          AddValue(V);
        end;
      vaCollection:
        begin
          Reader.ReadValue;
          while not Reader.EndOfList do
          begin
            if Reader.NextValue in [vaInt8, vaInt16, vaInt32] then
              ConvertValue;
            Reader.CheckValue(vaList);
            while not Reader.EndOfList do
              ConvertProperty;
            Reader.ReadListEnd;
          end;
          Reader.ReadListEnd;
        end;
      vaInt64:
        AddValue(Reader.ReadInt64);
    else
      raise EReadError.CreateResFmt(@sPropertyException,
        [ObjectName, DotSep, PropName, IntToStr(Ord(Reader.NextValue))]);
    end;
  end;

  procedure ConvertProperty;
  var
    SaveFound: Boolean;
    Name: string;
  begin
    SaveFound := FoundProperty;
    try
      PropName := Reader.ReadStr;
      Name := PropName;
      FoundProperty := FoundComponent and PropValues.ContainsKey(PropName);
      FoundValue.Clear;
      ConvertValue;
      if FoundValue.Count > 1 then
      else if FoundValue.Count > 0 then
        PropValues[Name] := FoundValue[0];
    finally
      FoundProperty := SaveFound;
    end;
  end;

  procedure ConvertObject(RootComponent: Boolean);
  begin
    ConvertHeader(RootComponent);
    while not Reader.EndOfList do
      ConvertProperty;
    Reader.ReadListEnd;
    if not FoundComponent then
    begin
      while not Reader.EndOfList do
      begin
        ConvertObject(False);
        if FoundComponent then
          Exit;
      end;
      Reader.ReadListEnd;
    end;
  end;

var
  I: Integer;
  InternalInput: TStream;
  Format: TStreamOriginalFormat;
begin
  FoundComponent := False;
  FoundProperty := False;
  FoundValue := TList<Variant>.Create;
  Format := TStreamOriginalFormat.sofUnknown;
  try
    GlobalNameSpace.BeginWrite;
    InternalInput := TMemoryStream.Create;
    try
      ObjectTextToBinary(Input, InternalInput, Format);
      InternalInput.Position := 0;
      Reader := TReader.Create(InternalInput, 4096);
      try
        PropValues := TDictionary<string, Variant>.Create;
        try
          for I := Low(Properties) to High(Properties) do
            PropValues.Add(Properties[I], System.Variants.Null);
          Reader.ReadSignature;
          ConvertObject(True);
          SetLength(Result, Length(Properties));
          for I := Low(Properties) to High(Properties) do
            Result[I] := PropValues[Properties[I]];
        finally
          PropValues.Free;
        end;
      finally
        Reader.Free;
      end;
    finally
      InternalInput.Free;
    end;
  finally
    FoundValue.Free;
    GlobalNameSpace.EndWrite;
  end;
end;

function ReadResource(const FormClass: TClass; const PropertyNames: array of string; const PropertyStore : TDictionary<string, Variant>) : Boolean;
var
  LHInst : HInst;
  ResourceStream: TResourceStream;
  PeekedValues : TArray<Variant>;
  I : Integer;
begin
  Result := True;

  if FormClass = TComponent then Exit;

  ReadResource(FormClass.ClassParent, PropertyNames, PropertyStore);
  LHInst := FindClassHInstance(FormClass);
  if LHInst = 0 then LHInst := HInstance;
  if FindResource(LHInst, PChar(FormClass.ClassName), PChar(RT_RCDATA)) = 0 then Exit;

  ResourceStream := TResourceStream.Create(
                             LHInst,
                             FormClass.ClassName, RT_RCDATA);
  try
    PeekedValues := PropertyValuesFromStream('',
                                PropertyNames,
                                ResourceStream);

    for I := 0 to Length(PropertyNames) - 1 do
    begin
      if PeekedValues[I] <> Null then
      begin
        if PropertyStore.ContainsKey(PropertyNames[I]) then
          PropertyStore.Remove(PropertyNames[I]);
        PropertyStore.Add(PropertyNames[I], PeekedValues[I]);
      end;
    end;
  finally
    ResourceStream.Free;
  end;
end;

{ TVKStateChangeMessage }

constructor TVKStateChangeMessage.Create(AKeyboardShown: Boolean; const Bounds: TRect);
begin
  FKeyboardShown := AKeyboardShown;
  FBounds := Bounds;
end;

{ TApplicationFormFactor }

procedure TApplicationFormFactor.SetSupportedOrientations(AOrientations: TFormOrientations);
var
  AppService: IFMXScreenService;
begin
  inherited;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, AppService) then
    AppService.SetSupportedScreenOrientations(AOrientations);
end;

{ TFormStatusBar }

procedure TFormSystemStatusBar.AssignTo(Dest: TPersistent);
var
  DestOption: TFormSystemStatusBar;
begin
  if Dest is TFormSystemStatusBar then
  begin
    DestOption := TFormSystemStatusBar(Dest);
    DestOption.BackgroundColor := BackgroundColor;
    DestOption.Visibility := Visibility;
  end
  else
    inherited;
end;

constructor TFormSystemStatusBar.Create(const AForm: TCommonCustomForm);
begin
  FBackgroundColor := DefaultBackgroundColor;
  FVisibility := DefaultVisibility;
  FForm := AForm;
end;

procedure TFormSystemStatusBar.SetBackgroundColor(const Value: TAlphaColor);
var
  Service: IFMXWindowSystemStatusBarService;
begin
  if FBackgroundColor <> Value then
  begin
    FBackgroundColor := Value;
    if FForm.Visible and FForm.Active and TPlatformServices.Current.SupportsPlatformService(IFMXWindowSystemStatusBarService, Service) then
      Service.SetBackgroundColor(FForm, BackgroundColor);
  end;
end;

procedure TFormSystemStatusBar.SetVisibility(const Value: TVisibilityMode);
var
  Service: IFMXWindowSystemStatusBarService;
begin
  if FVisibility <> Value then
  begin
    FVisibility := Value;
    if FForm.Visible and FForm.Active and TPlatformServices.Current.SupportsPlatformService(IFMXWindowSystemStatusBarService, Service) then
      Service.SetVisibility(FForm, Visibility);
  end;
end;

{ TFormChangingFocusControl }

constructor TFormChangingFocusControl.Create(const APreviousFocusedControl, ANewFocusedControl: IControl;
  const AIsChanged: Boolean);
begin
  PreviousFocusedControl := APreviousFocusedControl;
  NewFocusedControl := ANewFocusedControl;
  IsChanged := AIsChanged;
end;

{ TSizeConstraints }

constructor TSizeConstraints.Create(const AOwner: TComponent);
begin
  inherited Create;
  FOwner := AOwner;
end;

function TSizeConstraints.GetMaxSize: TSizeF;
begin
  Result := TSizeF.Create(MaxWidth, MaxHeight);
end;

function TSizeConstraints.GetMinSize: TSizeF;
begin
  Result := TSizeF.Create(MinWidth, MinHeight);
end;

function TSizeConstraints.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TSizeConstraints.IsValueStored(const Index: TDimension): Boolean;
begin
  case Index of
    TDimension.MaxHeight:
      Result := not IsZero(MaxHeight);
    TDimension.MaxWidth:
      Result := not IsZero(MaxWidth);
    TDimension.MinHeight:
      Result := not IsZero(MinHeight);
    TDimension.MinWidth:
      Result := not IsZero(MinWidth);
  else
    Result := True;
  end;
end;

procedure TSizeConstraints.AssignTo(Dest: TPersistent);
begin
  if Dest is TSizeConstraints then
    with TSizeConstraints(Dest) do
    begin
      FMinHeight := Self.FMinHeight;
      FMaxHeight := Self.FMaxHeight;
      FMinWidth := Self.FMinWidth;
      FMaxWidth := Self.FMaxWidth;
      Change;
    end
  else
    inherited AssignTo(Dest);
end;

procedure TSizeConstraints.SetConstraints(const Index: TDimension; Value: TConstraintSize);
begin
  case Index of
    TDimension.MaxHeight:
      if Value <> FMaxHeight then
      begin
        FMaxHeight := Max(0, Value);
        if (Value > 0) and (Value < FMinHeight) then
          FMinHeight := Value;
        Change;
      end;
    TDimension.MaxWidth:
      if Value <> FMaxWidth then
      begin
        FMaxWidth := Max(0, Value);
        if (Value > 0) and (Value < FMinWidth) then
          FMinWidth := Value;
        Change;
      end;
    TDimension.MinHeight:
      if Value <> FMinHeight then
      begin
        FMinHeight := Max(0, Value);
        if (FMaxHeight > 0) and (Value > FMaxHeight) then
          FMaxHeight := Value;
        Change;
      end;
    TDimension.MinWidth:
      if Value <> FMinWidth then
      begin
        FMinWidth := Max(0, Value);
        if (FMaxWidth > 0) and (Value > FMaxWidth) then
          FMaxWidth := Value;
        Change;
      end;
  end;
end;

procedure TSizeConstraints.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

{ TDefaultFormPositionerService }

procedure TDefaultFormPositionerService.PlaceOnScreen(const AForm: TCommonCustomForm; const APosition: TFormPosition);
var
  LPosition: TFormPosition;
begin
  if AForm = nil then
    raise EArgumentNilException.Create(SNullException);

  // Not every FormPosition can be used. Since some modes depend on the form settings and their owner.
  LPosition := DefineTargetPosition(AForm, APosition);
  case LPosition of
    TFormPosition.Designed: PlaceDesigned(AForm);
    TFormPosition.DefaultPosOnly: PlaceDefaultPosOnly(AForm);
    TFormPosition.DefaultSizeOnly: PlaceDefaultSizeOnly(AForm);
    TFormPosition.ScreenCenter: PlaceScreenCenter(AForm);
    TFormPosition.DesktopCenter: PlaceDesktopCenter(AForm);
    TFormPosition.MainFormCenter: PlaceMainFormCenter(AForm);
    TFormPosition.OwnerFormCenter: PlaceOwnerFormCenter(AForm);
  else
    AForm.SetBoundsF(AForm.FDefaultWindowRect);
  end;
end;

procedure TDefaultFormPositionerService.PlaceOwnerFormCenter(const AForm: TCommonCustomForm);
var
  LForm: TCommonCustomForm;
  NewBounds: TRectF;
begin
  LForm := GetOwnerForm(AForm);
  NewBounds := LForm.FBounds;
  NewBounds := TRectF.Create(TPointF.Create(NewBounds.Left + (NewBounds.Width - AForm.Width) / 2,
                                            NewBounds.Top + (NewBounds.Height - AForm.Height) / 2),
                             AForm.FBounds.Width, AForm.FBounds.Height);
  NewBounds := FitInRect(NewBounds, Screen.DesktopRect);
  AForm.SetBoundsF(NewBounds);
end;

function TDefaultFormPositionerService.DefineTargetPosition(const AForm: TCommonCustomForm;
  const APosition: TFormPosition): TFormPosition;

  function IsCustomPosition(const AForm: TCommonCustomForm): Boolean;
  begin
    Result := TCommonCustomForm.TBoundChange.Location in AForm.FBoundChanges;
  end;

  function IsCustomSize(const AForm: TCommonCustomForm): Boolean;
  begin
    Result := TCommonCustomForm.TBoundChange.Size in AForm.FBoundChanges;
  end;

begin
  Result := APosition;

  // If Position cannot be applied, we adjust it
  case APosition of
    TFormPosition.MainFormCenter:
      if GetMainForm(AForm) = nil then
        Result := TFormPosition.ScreenCenter;
    TFormPosition.OwnerFormCenter:
      if GetOwnerForm(AForm) = nil then
        Result := TFormPosition.ScreenCenter;
  end;

  case Result of
    TFormPosition.Default:
      if IsCustomSize(AForm) then
        Result := TFormPosition.DefaultPosOnly
      else if IsCustomPosition(AForm) then
        Result := TFormPosition.DefaultSizeOnly;

    TFormPosition.DefaultPosOnly:

      if IsCustomPosition(AForm) then
        Result := TFormPosition.Designed;

    TFormPosition.DefaultSizeOnly:
      if IsCustomSize(AForm) then
        Result := TFormPosition.Designed;
  end;
end;

class function TDefaultFormPositionerService.FitInRect(const AValue, AMaxRect: TRectF): TRectF;
begin
  Result := AValue;
  if Result.Top < AMaxRect.Top then
    Result.Offset(0, AMaxRect.Top - Result.Top)
  else if Result.Bottom > AMaxRect.Bottom then
    Result.Offset(0, AMaxRect.Bottom - Result.Bottom);

  if Result.Left < AMaxRect.Left then
    Result.Offset(AMaxRect.Left - Result.Left, 0)
  else if Result.Right > AMaxRect.Right then
    Result.Offset(AMaxRect.Right - Result.Right, 0);
end;

function TDefaultFormPositionerService.GetMainForm(const AForm: TCommonCustomForm): TCommonCustomForm;
begin
  if (Application <> nil) and (Application.MainForm <> AForm) then
    Result := Application.MainForm
  else
    Result := nil;
end;

function TDefaultFormPositionerService.GetOwnerForm(const AForm: TCommonCustomForm): TCommonCustomForm;
begin
  if AForm.ParentForm <> nil then
    Result := AForm.ParentForm
  else if AForm.Owner is TCommonCustomForm then
    Result := TCommonCustomForm(AForm.Owner)
  else
    Result := nil;
end;

class procedure TDefaultFormPositionerService.PlaceByDefault(const AForm: TCommonCustomForm; const APosition: TFormPosition);
var
  Positioner: IFMXFormPositionerService;
begin
  Positioner := TDefaultFormPositionerService.Create;
  Positioner.PlaceOnScreen(AForm, APosition);
end;

procedure TDefaultFormPositionerService.PlaceDefaultPosOnly(const AForm: TCommonCustomForm);
var
  NewBounds: TRectF;
begin
  NewBounds := TRectF.Create(AForm.FDefaultWindowRect.TopLeft, AForm.FBounds.Width, AForm.FBounds.Height);
  AForm.SetBoundsF(NewBounds);
end;

procedure TDefaultFormPositionerService.PlaceDefaultSizeOnly(const AForm: TCommonCustomForm);
var
  NewBounds: TRectF;
begin
  NewBounds := TRectF.Create(AForm.FBounds.TopLeft, AForm.FDefaultWindowRect.Width, AForm.FDefaultWindowRect.Height);
  AForm.SetBoundsF(NewBounds);
end;

procedure TDefaultFormPositionerService.PlaceDesigned(const AForm: TCommonCustomForm);
begin
  AForm.SetBoundsF(AForm.FBounds);
end;

procedure TDefaultFormPositionerService.PlaceDesktopCenter(const AForm: TCommonCustomForm);
var
  NewBounds: TRectF;
begin
  NewBounds := TRectF.Create(Screen.GetDesktopCenterRect(TSizeF.Create(AForm.Width, AForm.Height)));
  AForm.SetBoundsF(NewBounds);
end;

procedure TDefaultFormPositionerService.PlaceMainFormCenter(const AForm: TCommonCustomForm);
var
  LForm: TCommonCustomForm;
  NewBounds: TRectF;
begin
  LForm := GetMainForm(AForm);
  NewBounds := LForm.FBounds;
  NewBounds := TRectF.Create(TPointF.Create(NewBounds.Left + (NewBounds.Width - AForm.Width) / 2,
                                            NewBounds.Top + (NewBounds.Height - AForm.Height) / 2),
                             AForm.FBounds.Width, AForm.FBounds.Height);
  NewBounds := FitInRect(NewBounds, Screen.DesktopRect);
  AForm.SetBoundsF(NewBounds);
end;

procedure TDefaultFormPositionerService.PlaceScreenCenter(const AForm: TCommonCustomForm);
var
  NewBounds: TRectF;
begin
  NewBounds := Screen.WorkAreaRect;
  NewBounds := TRectF.Create(TPointF.Create(NewBounds.Left + (NewBounds.Width - AForm.Width) / 2,
                                            NewBounds.Top + (NewBounds.Height - AForm.Height) / 2),
                             AForm.FBounds.Width, AForm.FBounds.Height);
  NewBounds := FitInRect(NewBounds, Screen.DesktopRect);
  AForm.SetBoundsF(NewBounds);
end;

initialization
  RegisterFmxClasses([TApplication, TFormFactor], [TApplication, TFormFactor]);
  Screen := TScreen.Create(nil);
  System.Classes.RegisterFindGlobalComponentProc(FindGlobalComponent);
finalization
  FinalizeForms;
  System.Classes.UnregisterFindGlobalComponentProc(FindGlobalComponent);
  FreeAndNil(Screen);
end.
