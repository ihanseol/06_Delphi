{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.ViewManagement;

{$WEAKPACKAGEUNIT OFF}

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses
  Winapi.Windows,
  Winapi.WinRT,
  System.Types,
  System.Win.WinRT,
  Winapi.CommonTypes,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  Core_CoreInputViewOcclusionKind = Winapi.CommonTypes.Core_CoreInputViewOcclusionKind;
  PCore_CoreInputViewOcclusionKind = Winapi.CommonTypes.PCore_CoreInputViewOcclusionKind;
  Core_ICoreInputView = Winapi.CommonTypes.Core_ICoreInputView;
  PCore_ICoreInputView = Winapi.CommonTypes.PCore_ICoreInputView;
  Core_ICoreInputViewOcclusion = Winapi.CommonTypes.Core_ICoreInputViewOcclusion;
  PCore_ICoreInputViewOcclusion = Winapi.CommonTypes.PCore_ICoreInputViewOcclusion;
  Core_ICoreInputViewOcclusionsChangedEventArgs = Winapi.CommonTypes.Core_ICoreInputViewOcclusionsChangedEventArgs;
  PCore_ICoreInputViewOcclusionsChangedEventArgs = Winapi.CommonTypes.PCore_ICoreInputViewOcclusionsChangedEventArgs;
  IVectorView_1__Core_ICoreInputViewOcclusion = Winapi.CommonTypes.IVectorView_1__Core_ICoreInputViewOcclusion;
  PIVectorView_1__Core_ICoreInputViewOcclusion = Winapi.CommonTypes.PIVectorView_1__Core_ICoreInputViewOcclusion;
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs_Delegate_Base = Winapi.CommonTypes.TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs_Delegate_Base;
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs = Winapi.CommonTypes.TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs;
  PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs = Winapi.CommonTypes.PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewOcclusionsChangedEventArgs;

  // Forward declarations for interfaces

  // Windows.Foundation.IReference`1<Windows.UI.ViewManagement.UIElementType>
  IReference_1__UIElementType = interface;
  PIReference_1__UIElementType = ^IReference_1__UIElementType;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterator_1__Core_ICoreInputViewOcclusion = interface;
  PIIterator_1__Core_ICoreInputViewOcclusion = ^IIterator_1__Core_ICoreInputViewOcclusion;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterable_1__Core_ICoreInputViewOcclusion = interface;
  PIIterable_1__Core_ICoreInputViewOcclusion = ^IIterable_1__Core_ICoreInputViewOcclusion;

  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewAnimationStartingEventArgs
  Core_ICoreFrameworkInputViewAnimationStartingEventArgs = interface;
  PCore_ICoreFrameworkInputViewAnimationStartingEventArgs = ^Core_ICoreFrameworkInputViewAnimationStartingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs = ^TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewOcclusionsChangedEventArgs
  Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs = interface;
  PCore_ICoreFrameworkInputViewOcclusionsChangedEventArgs = ^Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewOcclusionsChangedEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs = ^TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputView
  Core_ICoreFrameworkInputView = interface;
  PCore_ICoreFrameworkInputView = ^Core_ICoreFrameworkInputView;

  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewStatics
  Core_ICoreFrameworkInputViewStatics = interface;
  PCore_ICoreFrameworkInputViewStatics = ^Core_ICoreFrameworkInputViewStatics;

  // Windows.UI.ViewManagement.Core.ICoreInputViewTransferringXYFocusEventArgs
  Core_ICoreInputViewTransferringXYFocusEventArgs = interface;
  PCore_ICoreInputViewTransferringXYFocusEventArgs = ^Core_ICoreInputViewTransferringXYFocusEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewTransferringXYFocusEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs = ^TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreInputView2
  Core_ICoreInputView2 = interface;
  PCore_ICoreInputView2 = ^Core_ICoreInputView2;

  // Windows.UI.ViewManagement.Core.ICoreInputView3
  Core_ICoreInputView3 = interface;
  PCore_ICoreInputView3 = ^Core_ICoreInputView3;

  // Windows.UI.ViewManagement.Core.ICoreInputViewShowingEventArgs
  Core_ICoreInputViewShowingEventArgs = interface;
  PCore_ICoreInputViewShowingEventArgs = ^Core_ICoreInputViewShowingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewShowingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs = ^TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreInputViewHidingEventArgs
  Core_ICoreInputViewHidingEventArgs = interface;
  PCore_ICoreInputViewHidingEventArgs = ^Core_ICoreInputViewHidingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewHidingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs = ^TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreInputView4
  Core_ICoreInputView4 = interface;
  PCore_ICoreInputView4 = ^Core_ICoreInputView4;

  // Windows.UI.ViewManagement.Core.ICoreInputViewAnimationStartingEventArgs
  Core_ICoreInputViewAnimationStartingEventArgs = interface;
  PCore_ICoreInputViewAnimationStartingEventArgs = ^Core_ICoreInputViewAnimationStartingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs = ^TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs;

  // Windows.UI.ViewManagement.Core.ICoreInputView5
  Core_ICoreInputView5 = interface;
  PCore_ICoreInputView5 = ^Core_ICoreInputView5;

  // Windows.UI.ViewManagement.Core.ICoreInputViewStatics
  Core_ICoreInputViewStatics = interface;
  PCore_ICoreInputViewStatics = ^Core_ICoreInputViewStatics;

  // Windows.UI.ViewManagement.Core.ICoreInputViewStatics2
  Core_ICoreInputViewStatics2 = interface;
  PCore_ICoreInputViewStatics2 = ^Core_ICoreInputViewStatics2;

  // Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
  IInputPaneVisibilityEventArgs = interface;
  PIInputPaneVisibilityEventArgs = ^IInputPaneVisibilityEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = interface;
  PTypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = ^TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs;

  // Windows.UI.ViewManagement.IInputPane
  IInputPane = interface;
  PIInputPane = ^IInputPane;

  // Windows.UI.ViewManagement.IInputPane2
  IInputPane2 = interface;
  PIInputPane2 = ^IInputPane2;

  // Windows.UI.ViewManagement.IInputPaneControl
  IInputPaneControl = interface;
  PIInputPaneControl = ^IInputPaneControl;

  // Windows.UI.ViewManagement.IInputPaneStatics
  IInputPaneStatics = interface;
  PIInputPaneStatics = ^IInputPaneStatics;

  // Windows.UI.ViewManagement.IInputPaneStatics2
  IInputPaneStatics2 = interface;
  PIInputPaneStatics2 = ^IInputPaneStatics2;

  // Windows.UI.ViewManagement.IUIViewSettings
  IUIViewSettings = interface;
  PIUIViewSettings = ^IUIViewSettings;

  // Windows.UI.ViewManagement.IUIViewSettingsStatics
  IUIViewSettingsStatics = interface;
  PIUIViewSettingsStatics = ^IUIViewSettingsStatics;

  // Windows.UI.ViewManagement Enums

  // Windows.UI.ViewManagement.ApplicationViewBoundsMode
  ApplicationViewBoundsMode = (
    UseVisible = 0,
    UseCoreWindow = 1
  );
  PApplicationViewBoundsMode = ^ApplicationViewBoundsMode;

  // Windows.UI.ViewManagement.ApplicationViewMode
  ApplicationViewMode = (
    Default = 0,
    CompactOverlay = 1
  );
  PApplicationViewMode = ^ApplicationViewMode;

  // Windows.UI.ViewManagement.ApplicationViewOrientation
  ApplicationViewOrientation = (
    Landscape = 0,
    Portrait = 1
  );
  PApplicationViewOrientation = ^ApplicationViewOrientation;

  // Windows.UI.ViewManagement.ApplicationViewState
  ApplicationViewState = (
    FullScreenLandscape = 0,
    Filled = 1,
    Snapped = 2,
    FullScreenPortrait = 3
  );
  PApplicationViewState = ^ApplicationViewState;

  // Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
  ApplicationViewSwitchingOptions = (
    Default = 0,
    SkipAnimation = 1,
    ConsolidateViews = 2
  );
  PApplicationViewSwitchingOptions = ^ApplicationViewSwitchingOptions;

  // Windows.UI.ViewManagement.ApplicationViewWindowingMode
  ApplicationViewWindowingMode = (
    Auto = 0,
    PreferredLaunchViewSize = 1,
    FullScreen = 2,
    CompactOverlay = 3,
    Maximized = 4
  );
  PApplicationViewWindowingMode = ^ApplicationViewWindowingMode;

  // Windows.UI.ViewManagement.Core.CoreInputViewKind
  Core_CoreInputViewKind = (
    Default = 0,
    Keyboard = 1,
    Handwriting = 2,
    Emoji = 3,
    Symbols = 4,
    Clipboard = 5,
    Dictation = 6
  );
  PCore_CoreInputViewKind = ^Core_CoreInputViewKind;

  // Windows.UI.ViewManagement.Core.CoreInputViewXYFocusTransferDirection
  Core_CoreInputViewXYFocusTransferDirection = (
    Up = 0,
    Right = 1,
    Down = 2,
    Left = 3
  );
  PCore_CoreInputViewXYFocusTransferDirection = ^Core_CoreInputViewXYFocusTransferDirection;

  // Windows.UI.ViewManagement.FullScreenSystemOverlayMode
  FullScreenSystemOverlayMode = (
    Standard = 0,
    Minimal = 1
  );
  PFullScreenSystemOverlayMode = ^FullScreenSystemOverlayMode;

  // Windows.UI.ViewManagement.HandPreference
  HandPreference = (
    LeftHanded = 0,
    RightHanded = 1
  );
  PHandPreference = ^HandPreference;

  // Windows.UI.ViewManagement.ScreenCaptureDisabledBehavior
  ScreenCaptureDisabledBehavior = (
    DrawAsBlack = 0,
    ExcludeFromCapture = 1
  );
  PScreenCaptureDisabledBehavior = ^ScreenCaptureDisabledBehavior;

  // Windows.UI.ViewManagement.UIColorType
  UIColorType = (
    Background = 0,
    Foreground = 1,
    AccentDark3 = 2,
    AccentDark2 = 3,
    AccentDark1 = 4,
    Accent = 5,
    AccentLight1 = 6,
    AccentLight2 = 7,
    AccentLight3 = 8,
    Complement = 9
  );
  PUIColorType = ^UIColorType;

  // Windows.UI.ViewManagement.UIElementType
  UIElementType = (
    ActiveCaption = 0,
    Background = 1,
    ButtonFace = 2,
    ButtonText = 3,
    CaptionText = 4,
    GrayText = 5,
    Highlight = 6,
    HighlightText = 7,
    Hotlight = 8,
    InactiveCaption = 9,
    InactiveCaptionText = 10,
    Window = 11,
    WindowText = 12,
    AccentColor = 1000,
    TextHigh = 1001,
    TextMedium = 1002,
    TextLow = 1003,
    TextContrastWithHigh = 1004,
    NonTextHigh = 1005,
    NonTextMediumHigh = 1006,
    NonTextMedium = 1007,
    NonTextMediumLow = 1008,
    NonTextLow = 1009,
    PageBackground = 1010,
    PopupBackground = 1011,
    OverlayOutsidePopup = 1012
  );
  PUIElementType = ^UIElementType;

  // Windows.UI.ViewManagement.UserInteractionMode
  UserInteractionMode = (
    Mouse = 0,
    Touch = 1
  );
  PUserInteractionMode = ^UserInteractionMode;

  // Windows.UI.ViewManagement.ViewSizePreference
  ViewSizePreference = (
    Default = 0,
    UseLess = 1,
    UseHalf = 2,
    UseMore = 3,
    UseMinimum = 4,
    UseNone = 5,
    Custom = 6
  );
  PViewSizePreference = ^ViewSizePreference;

  // Windows.UI.ViewManagement Records

  // Windows.UI.ViewManagement.ViewManagementViewScalingContract
  ViewManagementViewScalingContract = record
  end;
  PViewManagementViewScalingContract = ^ViewManagementViewScalingContract;

  // Windows.UI.ViewManagement Interfaces

  // Windows.Foundation.IReference`1<Windows.UI.ViewManagement.UIElementType>
  IReference_1__UIElementType = interface(IInspectable)
  ['{E17E08C9-7DEB-51D1-8487-334EB3FE4691}']
    function get_Value: UIElementType; safecall;
    property Value: UIElementType read get_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterator_1__Core_ICoreInputViewOcclusion_Base = interface(IInspectable)
  ['{5BB57354-4F40-5EF3-A5D1-6A6049F905A1}']
    function get_Current: Core_ICoreInputViewOcclusion; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ICoreInputViewOcclusion): Cardinal; safecall;
    property Current: Core_ICoreInputViewOcclusion read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterator_1__Core_ICoreInputViewOcclusion = interface(IIterator_1__Core_ICoreInputViewOcclusion_Base)
  ['{A0AF56EE-2EA4-52A5-BB7B-250F69A0B207}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterable_1__Core_ICoreInputViewOcclusion_Base = interface(IInspectable)
  ['{0A11958B-63DA-5566-913A-180550DAD26A}']
    function First: IIterator_1__Core_ICoreInputViewOcclusion; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion>
  IIterable_1__Core_ICoreInputViewOcclusion = interface(IIterable_1__Core_ICoreInputViewOcclusion_Base)
  ['{CB153197-A2F2-5082-92FE-90326E3ECC48}']
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewAnimationStartingEventArgs
  Core_ICoreFrameworkInputViewAnimationStartingEventArgs = interface(IInspectable)
  ['{C0EC901C-BBA4-501B-AE8B-65C9E756A719}']
    function get_Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion; safecall;
    function get_FrameworkAnimationRecommended: Boolean; safecall;
    function get_AnimationDuration: TimeSpan; safecall;
    property AnimationDuration: TimeSpan read get_AnimationDuration;
    property FrameworkAnimationRecommended: Boolean read get_FrameworkAnimationRecommended;
    property Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion read get_Occlusions;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{CFD46669-0E5A-5C60-A8A2-DC2D899789DA}']
    procedure Invoke(sender: Core_ICoreFrameworkInputView; args: Core_ICoreFrameworkInputViewAnimationStartingEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs = interface(TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs_Delegate_Base)
  ['{9869D1D5-68E5-59DF-BF41-E8CA0B31F53E}']
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewOcclusionsChangedEventArgs
  Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs = interface(IInspectable)
  ['{F36F4949-C82C-53D1-A75D-2B2BAF0D9B0D}']
    function get_Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion; safecall;
    function get_Handled: Boolean; safecall;
    property Handled: Boolean read get_Handled;
    property Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion read get_Occlusions;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewOcclusionsChangedEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D081E63B-B7C7-5859-8A08-BB19BF0C90B2}']
    procedure Invoke(sender: Core_ICoreFrameworkInputView; args: Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreFrameworkInputView,Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewOcclusionsChangedEventArgs>
  TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs = interface(TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs_Delegate_Base)
  ['{D3E53257-3FB4-57D3-84E2-B25230609A10}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputView
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_Core_CoreFrameworkInputView)]
  Core_ICoreFrameworkInputView = interface(IInspectable)
  ['{D77C94AE-46B8-5D4A-9489-8DDEC3D639A6}']
    function add_PrimaryViewAnimationStarting(handler: TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewAnimationStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_PrimaryViewAnimationStarting(token: EventRegistrationToken); safecall;
    function add_OcclusionsChanged(handler: TypedEventHandler_2__Core_ICoreFrameworkInputView__Core_ICoreFrameworkInputViewOcclusionsChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OcclusionsChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewStatics
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_Core_CoreFrameworkInputView)]
  Core_ICoreFrameworkInputViewStatics = interface(IInspectable)
  ['{6EEBD9B6-EAC2-5F8B-975F-772EE3E42EEB}']
    function GetForUIContext(context: IUIContext): Core_ICoreFrameworkInputView; safecall;
    function GetForCurrentView: Core_ICoreFrameworkInputView; safecall;
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewTransferringXYFocusEventArgs
  Core_ICoreInputViewTransferringXYFocusEventArgs = interface(IInspectable)
  ['{04DE169F-BA02-4850-8B55-D82D03BA6D7F}']
    function get_Origin: TRectF; safecall;
    function get_Direction: Core_CoreInputViewXYFocusTransferDirection; safecall;
    procedure put_TransferHandled(value: Boolean); safecall;
    function get_TransferHandled: Boolean; safecall;
    procedure put_KeepPrimaryViewVisible(value: Boolean); safecall;
    function get_KeepPrimaryViewVisible: Boolean; safecall;
    property Direction: Core_CoreInputViewXYFocusTransferDirection read get_Direction;
    property KeepPrimaryViewVisible: Boolean read get_KeepPrimaryViewVisible write put_KeepPrimaryViewVisible;
    property Origin: TRectF read get_Origin;
    property TransferHandled: Boolean read get_TransferHandled write put_TransferHandled;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewTransferringXYFocusEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs_Delegate_Base = interface(IUnknown)
  ['{881E8198-7FF6-5CD9-8A64-6DD4292267AD}']
    procedure Invoke(sender: Core_ICoreInputView; args: Core_ICoreInputViewTransferringXYFocusEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewTransferringXYFocusEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs = interface(TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs_Delegate_Base)
  ['{6F4684FE-101C-5EDC-A0AC-5140D6AF6032}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputView2
  Core_ICoreInputView2 = interface(IInspectable)
  ['{0ED726C1-E09A-4AE8-AEDF-DFA4857D1A01}']
    function add_XYFocusTransferringFromPrimaryView(handler: TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewTransferringXYFocusEventArgs): EventRegistrationToken; safecall;
    procedure remove_XYFocusTransferringFromPrimaryView(token: EventRegistrationToken); safecall;
    function add_XYFocusTransferredToPrimaryView(handler: TypedEventHandler_2__Core_ICoreInputView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_XYFocusTransferredToPrimaryView(token: EventRegistrationToken); safecall;
    function TryTransferXYFocusToPrimaryView(origin: TRectF; direction: Core_CoreInputViewXYFocusTransferDirection): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputView3
  Core_ICoreInputView3 = interface(IInspectable)
  ['{BC941653-3AB9-4849-8F58-46E7F0353CFC}']
    function TryShow: Boolean; overload; safecall;
    function TryShow(&type: Core_CoreInputViewKind): Boolean; overload; safecall;
    function TryHide: Boolean; safecall;
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewShowingEventArgs
  Core_ICoreInputViewShowingEventArgs = interface(IInspectable)
  ['{CA52261B-FB9E-5DAF-A98C-262B8B76AF50}']
    function TryCancel: Boolean; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewShowingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs_Delegate_Base = interface(IUnknown)
  ['{A300E2F9-737B-5330-8EA2-68E7A3AAEDB2}']
    procedure Invoke(sender: Core_ICoreInputView; args: Core_ICoreInputViewShowingEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewShowingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs = interface(TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs_Delegate_Base)
  ['{D0B6BEC7-354D-5F0A-8FB0-E34B121DBAD3}']
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewHidingEventArgs
  Core_ICoreInputViewHidingEventArgs = interface(IInspectable)
  ['{EADA47BD-BAC5-5336-848D-41083584DAAD}']
    function TryCancel: Boolean; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewHidingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs_Delegate_Base = interface(IUnknown)
  ['{3188AFC6-4B93-58A0-B5B0-CBED65BE0C7E}']
    procedure Invoke(sender: Core_ICoreInputView; args: Core_ICoreInputViewHidingEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewHidingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs = interface(TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs_Delegate_Base)
  ['{1662C7C9-92A2-5288-A1ED-7B5FC4B7439F}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputView4
  Core_ICoreInputView4 = interface(IInspectable)
  ['{002863D6-D9EF-57EB-8CEF-77F6CE1B7EE7}']
    function add_PrimaryViewShowing(handler: TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewShowingEventArgs): EventRegistrationToken; safecall;
    procedure remove_PrimaryViewShowing(token: EventRegistrationToken); safecall;
    function add_PrimaryViewHiding(handler: TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewHidingEventArgs): EventRegistrationToken; safecall;
    procedure remove_PrimaryViewHiding(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewAnimationStartingEventArgs
  Core_ICoreInputViewAnimationStartingEventArgs = interface(IInspectable)
  ['{A9144AF2-B55C-5EA1-B8AB-5340F3E94897}']
    function get_Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_AnimationDuration: TimeSpan; safecall;
    property AnimationDuration: TimeSpan read get_AnimationDuration;
    property Handled: Boolean read get_Handled write put_Handled;
    property Occlusions: IVectorView_1__Core_ICoreInputViewOcclusion read get_Occlusions;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{070CC1CF-2C3A-5E23-A0AA-0DABE6D4D27E}']
    procedure Invoke(sender: Core_ICoreInputView; args: Core_ICoreInputViewAnimationStartingEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.Core.ICoreInputView,Windows.UI.ViewManagement.Core.ICoreInputViewAnimationStartingEventArgs>
  TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs = interface(TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs_Delegate_Base)
  ['{AB778A0E-62E4-547E-BA75-2F7C8159F7A4}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputView5
  Core_ICoreInputView5 = interface(IInspectable)
  ['{136316E0-C6D5-5C57-811E-1AD8A99BA6AB}']
    function IsKindSupported(&type: Core_CoreInputViewKind): Boolean; safecall;
    function add_SupportedKindsChanged(handler: TypedEventHandler_2__Core_ICoreInputView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SupportedKindsChanged(token: EventRegistrationToken); safecall;
    function add_PrimaryViewAnimationStarting(handler: TypedEventHandler_2__Core_ICoreInputView__Core_ICoreInputViewAnimationStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_PrimaryViewAnimationStarting(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewStatics
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_Core_CoreInputView)]
  Core_ICoreInputViewStatics = interface(IInspectable)
  ['{7D9B97CD-EDBE-49CF-A54F-337DE052907F}']
    function GetForCurrentView: Core_ICoreInputView; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.Core.ICoreInputViewStatics2
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_Core_CoreInputView)]
  Core_ICoreInputViewStatics2 = interface(IInspectable)
  ['{7EBC0862-D049-4E52-87B0-1E90E98C49ED}']
    function GetForUIContext(context: IUIContext): Core_ICoreInputView; safecall;
  end;

  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
  IInputPaneVisibilityEventArgs = interface(IInspectable)
  ['{D243E016-D907-4FCC-BB8D-F77BAA5028F1}']
    function get_OccludedRect: TRectF; safecall;
    procedure put_EnsuredFocusedElementInView(value: Boolean); safecall;
    function get_EnsuredFocusedElementInView: Boolean; safecall;
    property EnsuredFocusedElementInView: Boolean read get_EnsuredFocusedElementInView write put_EnsuredFocusedElementInView;
    property OccludedRect: TRectF read get_OccludedRect;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs_Delegate_Base = interface(IUnknown)
  ['{B813D684-D953-5A8A-9B30-78B79FB9147B}']
    procedure Invoke(sender: IInputPane; args: IInputPaneVisibilityEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = interface(TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs_Delegate_Base)
  ['{DBA5B41B-EA45-5B69-B0D4-80493AE17F1C}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPane
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_InputPane)]
  IInputPane = interface(IInspectable)
  ['{640ADA70-06F3-4C87-A678-9829C9127C28}']
    function add_Showing(handler: TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs): EventRegistrationToken; safecall;
    procedure remove_Showing(token: EventRegistrationToken); safecall;
    function add_Hiding(handler: TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs): EventRegistrationToken; safecall;
    procedure remove_Hiding(token: EventRegistrationToken); safecall;
    function get_OccludedRect: TRectF; safecall;
    property OccludedRect: TRectF read get_OccludedRect;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPane2
  IInputPane2 = interface(IInspectable)
  ['{8A6B3F26-7090-4793-944C-C3F2CDE26276}']
    function TryShow: Boolean; safecall;
    function TryHide: Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPaneControl
  IInputPaneControl = interface(IInspectable)
  ['{088BB24F-962F-489D-AA6E-C6BE1A0A6E52}']
    function get_Visible: Boolean; safecall;
    procedure put_Visible(value: Boolean); safecall;
    property Visible: Boolean read get_Visible write put_Visible;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPaneStatics
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_InputPane)]
  IInputPaneStatics = interface(IInspectable)
  ['{95F4AF3A-EF47-424A-9741-FD2815EBA2BD}']
    function GetForCurrentView: IInputPane; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IInputPaneStatics2
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_InputPane)]
  IInputPaneStatics2 = interface(IInspectable)
  ['{1B63529B-D9EC-4531-8445-71BAB9FB828E}']
    function GetForUIContext(context: IUIContext): IInputPane; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IUIViewSettings
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_UIViewSettings)]
  IUIViewSettings = interface(IInspectable)
  ['{C63657F6-8850-470D-88F8-455E16EA2C26}']
    function get_UserInteractionMode: UserInteractionMode; safecall;
    property UserInteractionMode_: UserInteractionMode read get_UserInteractionMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.UI.ViewManagement.IUIViewSettingsStatics
  [WinRTClassNameAttribute(SWindows_UI_ViewManagement_UIViewSettings)]
  IUIViewSettingsStatics = interface(IInspectable)
  ['{595C97A5-F8F6-41CF-B0FB-AACDB81FD5F6}']
    function GetForCurrentView: IUIViewSettings; safecall;
  end;

  // Windows.UI.ViewManagement.Core.CoreFrameworkInputView
  // DualAPI
  // Implements: Windows.UI.ViewManagement.Core.ICoreFrameworkInputView
  // Statics: "Windows.UI.ViewManagement.Core.ICoreFrameworkInputViewStatics"
  TCore_CoreFrameworkInputView = class(TWinRTGenericImportS<Core_ICoreFrameworkInputViewStatics>)
  public
    // -> Core_ICoreFrameworkInputViewStatics
    class function GetForUIContext(context: IUIContext): Core_ICoreFrameworkInputView; static; inline;
    class function GetForCurrentView: Core_ICoreFrameworkInputView; static; inline;
  end;

  // Windows.UI.ViewManagement.Core.CoreInputView
  // DualAPI
  // Implements: Windows.UI.ViewManagement.Core.ICoreInputView
  // Implements: Windows.UI.ViewManagement.Core.ICoreInputView2
  // Implements: Windows.UI.ViewManagement.Core.ICoreInputView3
  // Implements: Windows.UI.ViewManagement.Core.ICoreInputView4
  // Implements: Windows.UI.ViewManagement.Core.ICoreInputView5
  // Statics: "Windows.UI.ViewManagement.Core.ICoreInputViewStatics"
  // Statics: "Windows.UI.ViewManagement.Core.ICoreInputViewStatics2"
  TCore_CoreInputView = class(TWinRTGenericImportS2<Core_ICoreInputViewStatics, Core_ICoreInputViewStatics2>)
  public
    // -> Core_ICoreInputViewStatics
    class function GetForCurrentView: Core_ICoreInputView; static; inline;

    // -> Core_ICoreInputViewStatics2
    class function GetForUIContext(context: IUIContext): Core_ICoreInputView; static; inline;
  end;

  // Windows.UI.ViewManagement.InputPane
  // DualAPI
  // Implements: Windows.UI.ViewManagement.IInputPane
  // Implements: Windows.UI.ViewManagement.IInputPane2
  // Implements: Windows.UI.ViewManagement.IInputPaneControl
  // Statics: "Windows.UI.ViewManagement.IInputPaneStatics"
  // Statics: "Windows.UI.ViewManagement.IInputPaneStatics2"
  // Interop Intf: "IInputPaneInterop"
  IInputPaneInterop = interface(IInspectable)
    ['{75CF2C57-9195-4931-8332-F0B409E916AF}']
    function GetForWindow(appWindow: THandle; const riid: TGUID): IInputPane; safecall;
  end;
  TInputPane = class(TWinRTGenericImportS2O<IInputPaneStatics, IInputPaneStatics2, IInputPaneInterop>)
  public
    // -> IInputPaneStatics
    class function GetForCurrentView: IInputPane; static; inline;

    // -> IInputPaneStatics2
    class function GetForUIContext(context: IUIContext): IInputPane; static; inline;
  end;

  // Windows.UI.ViewManagement.UIViewSettings
  // DualAPI
  // Implements: Windows.UI.ViewManagement.IUIViewSettings
  // Statics: "Windows.UI.ViewManagement.IUIViewSettingsStatics"
  // Interop Intf: "IUIViewSettingsInterop"
  IUIViewSettingsInterop = interface(IInspectable)
    ['{3694DBF9-8F68-44BE-8FF5-195C98EDE8A6}']
    function GetForWindow(appWindow: THandle; const riid: TGUID): IUIViewSettings; safecall;
  end;
  TUIViewSettings = class(TWinRTGenericImportSO<IUIViewSettingsStatics, IUIViewSettingsInterop>)
  public
    // -> IUIViewSettingsStatics
    class function GetForCurrentView: IUIViewSettings; static; inline;
  end;

implementation

{ TCore_CoreFrameworkInputView }

class function TCore_CoreFrameworkInputView.GetForUIContext(context: IUIContext): Core_ICoreFrameworkInputView;
begin
  Result := Statics.GetForUIContext(context);
end;

class function TCore_CoreFrameworkInputView.GetForCurrentView: Core_ICoreFrameworkInputView;
begin
  Result := Statics.GetForCurrentView;
end;


{ TCore_CoreInputView }

class function TCore_CoreInputView.GetForCurrentView: Core_ICoreInputView;
begin
  Result := Statics.GetForCurrentView;
end;


class function TCore_CoreInputView.GetForUIContext(context: IUIContext): Core_ICoreInputView;
begin
  Result := Statics2.GetForUIContext(context);
end;


{ TInputPane }

class function TInputPane.GetForCurrentView: IInputPane;
begin
  Result := Statics.GetForCurrentView;
end;


class function TInputPane.GetForUIContext(context: IUIContext): IInputPane;
begin
  Result := Statics2.GetForUIContext(context);
end;


{ TUIViewSettings }

class function TUIViewSettings.GetForCurrentView: IUIViewSettings;
begin
  Result := Statics.GetForCurrentView;
end;


end.
