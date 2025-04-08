{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.Web.WebView2;

{$WEAKPACKAGEUNIT ON}

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
  Winapi.Microsoft.CommonTypes,
  Winapi.Foundation,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  CoreWebView2ProcessFailedReason = Winapi.Microsoft.CommonTypes.CoreWebView2ProcessFailedReason;
  PCoreWebView2ProcessFailedReason = Winapi.Microsoft.CommonTypes.PCoreWebView2ProcessFailedReason;
  ICoreWebView2FrameInfo = Winapi.Microsoft.CommonTypes.ICoreWebView2FrameInfo;
  PICoreWebView2FrameInfo = Winapi.Microsoft.CommonTypes.PICoreWebView2FrameInfo;
  ICoreWebView2NavigationCompletedEventArgs2 = Winapi.Microsoft.CommonTypes.ICoreWebView2NavigationCompletedEventArgs2;
  PICoreWebView2NavigationCompletedEventArgs2 = Winapi.Microsoft.CommonTypes.PICoreWebView2NavigationCompletedEventArgs2;
  ICoreWebView2NavigationStartingEventArgs2 = Winapi.Microsoft.CommonTypes.ICoreWebView2NavigationStartingEventArgs2;
  PICoreWebView2NavigationStartingEventArgs2 = Winapi.Microsoft.CommonTypes.PICoreWebView2NavigationStartingEventArgs2;
  ICoreWebView2PrivatePartial = Winapi.Microsoft.CommonTypes.ICoreWebView2PrivatePartial;
  PICoreWebView2PrivatePartial = Winapi.Microsoft.CommonTypes.PICoreWebView2PrivatePartial;
  ICoreWebView2ProcessFailedEventArgs2 = Winapi.Microsoft.CommonTypes.ICoreWebView2ProcessFailedEventArgs2;
  PICoreWebView2ProcessFailedEventArgs2 = Winapi.Microsoft.CommonTypes.PICoreWebView2ProcessFailedEventArgs2;
  ICoreWebView2WebMessageReceivedEventArgs = Winapi.Microsoft.CommonTypes.ICoreWebView2WebMessageReceivedEventArgs;
  PICoreWebView2WebMessageReceivedEventArgs = Winapi.Microsoft.CommonTypes.PICoreWebView2WebMessageReceivedEventArgs;
  IVectorView_1__ICoreWebView2FrameInfo = Winapi.Microsoft.CommonTypes.IVectorView_1__ICoreWebView2FrameInfo;
  PIVectorView_1__ICoreWebView2FrameInfo = Winapi.Microsoft.CommonTypes.PIVectorView_1__ICoreWebView2FrameInfo;
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base;
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2 = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2;
  PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2 = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2;
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base;
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2 = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2;
  PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2 = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2;
  TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base;
  TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2 = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2;
  PTypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2 = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2;
  TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base;
  TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs;
  PTypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs;

  // Forward declarations for interfaces

  // Windows.Foundation.Collections.IIterator`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterator_1__ICoreWebView2FrameInfo = interface;
  PIIterator_1__ICoreWebView2FrameInfo = ^IIterator_1__ICoreWebView2FrameInfo;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterable_1__ICoreWebView2FrameInfo = interface;
  PIIterable_1__ICoreWebView2FrameInfo = ^IIterable_1__ICoreWebView2FrameInfo;

  // Microsoft.Web.WebView2.Core.ICoreWebView2DispatchAdapter
  ICoreWebView2DispatchAdapter = interface;
  PICoreWebView2DispatchAdapter = ^ICoreWebView2DispatchAdapter;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIKeyValuePair_2__HSTRING__IInspectable = ^IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterator_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterable_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface;
  PIMapView_2__HSTRING__IInspectable = ^IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface;
  PIMap_2__HSTRING__IInspectable = ^IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Microsoft.Web.WebView2.Core.ICoreWebView2ControllerFactory
  ICoreWebView2ControllerFactory = interface;
  PICoreWebView2ControllerFactory = ^ICoreWebView2ControllerFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Object>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable = interface;
  PTypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable = ^TypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.Web.WebView2.Core.CoreWebView2PrintStatus>
  AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus = interface;
  PAsyncOperationCompletedHandler_1__CoreWebView2PrintStatus = ^AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.Web.WebView2.Core.CoreWebView2PrintStatus>
  IAsyncOperation_1__CoreWebView2PrintStatus = interface;
  PIAsyncOperation_1__CoreWebView2PrintStatus = ^IAsyncOperation_1__CoreWebView2PrintStatus;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2 = interface;
  PTypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2 = ^TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2 = interface;
  PTypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2 = ^TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2 = interface;
  PTypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2 = ^TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs = interface;
  PTypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs = ^TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Microsoft.Web.WebView2.Core Enums

  // Microsoft.Web.WebView2.Core.CoreWebView2WebResourceContext
  CoreWebView2WebResourceContext = (
    All = 0,
    Document = 1,
    Stylesheet = 2,
    Image = 3,
    Media = 4,
    Font = 5,
    Script = 6,
    XmlHttpRequest = 7,
    Fetch = 8,
    TextTrack = 9,
    EventSource = 10,
    Websocket = 11,
    Manifest = 12,
    SignedExchange = 13,
    Ping = 14,
    CspViolationReport = 15,
    Other = 16
  );
  PCoreWebView2WebResourceContext = ^CoreWebView2WebResourceContext;

  // Microsoft.Web.WebView2.Core.CoreWebView2WebErrorStatus
  CoreWebView2WebErrorStatus = (
    Unknown = 0,
    CertificateCommonNameIsIncorrect = 1,
    CertificateExpired = 2,
    ClientCertificateContainsErrors = 3,
    CertificateRevoked = 4,
    CertificateIsInvalid = 5,
    ServerUnreachable = 6,
    Timeout = 7,
    ErrorHttpInvalidServerResponse = 8,
    ConnectionAborted = 9,
    ConnectionReset = 10,
    Disconnected = 11,
    CannotConnect = 12,
    HostNameNotResolved = 13,
    OperationCanceled = 14,
    RedirectFailed = 15,
    UnexpectedError = 16,
    ValidAuthenticationCredentialsRequired = 17,
    ValidProxyAuthenticationRequired = 18
  );
  PCoreWebView2WebErrorStatus = ^CoreWebView2WebErrorStatus;

  // Microsoft.Web.WebView2.Core.CoreWebView2TrackingPreventionLevel
  CoreWebView2TrackingPreventionLevel = (
    None = 0,
    Basic = 1,
    Balanced = 2,
    Strict = 3
  );
  PCoreWebView2TrackingPreventionLevel = ^CoreWebView2TrackingPreventionLevel;

  // Microsoft.Web.WebView2.Core.CoreWebView2SharedBufferAccess
  CoreWebView2SharedBufferAccess = (
    ReadOnly = 0,
    ReadWrite = 1
  );
  PCoreWebView2SharedBufferAccess = ^CoreWebView2SharedBufferAccess;

  // Microsoft.Web.WebView2.Core.CoreWebView2ServerCertificateErrorAction
  CoreWebView2ServerCertificateErrorAction = (
    AlwaysAllow = 0,
    Cancel = 1,
    Default = 2
  );
  PCoreWebView2ServerCertificateErrorAction = ^CoreWebView2ServerCertificateErrorAction;

  // Microsoft.Web.WebView2.Core.CoreWebView2ScriptDialogKind
  CoreWebView2ScriptDialogKind = (
    Alert = 0,
    Confirm = 1,
    Prompt = 2,
    Beforeunload = 3
  );
  PCoreWebView2ScriptDialogKind = ^CoreWebView2ScriptDialogKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2ProcessKind
  CoreWebView2ProcessKind = (
    Browser = 0,
    Renderer = 1,
    Utility = 2,
    SandboxHelper = 3,
    Gpu = 4,
    PpapiPlugin = 5,
    PpapiBroker = 6
  );
  PCoreWebView2ProcessKind = ^CoreWebView2ProcessKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2ProcessFailedKind
  CoreWebView2ProcessFailedKind = (
    BrowserProcessExited = 0,
    RenderProcessExited = 1,
    RenderProcessUnresponsive = 2,
    FrameRenderProcessExited = 3,
    UtilityProcessExited = 4,
    SandboxHelperProcessExited = 5,
    GpuProcessExited = 6,
    PpapiPluginProcessExited = 7,
    PpapiBrokerProcessExited = 8,
    UnknownProcessExited = 9
  );
  PCoreWebView2ProcessFailedKind = ^CoreWebView2ProcessFailedKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintStatus
  CoreWebView2PrintStatus = (
    Succeeded = 0,
    PrinterUnavailable = 1,
    OtherError = 2
  );
  PCoreWebView2PrintStatus = ^CoreWebView2PrintStatus;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintOrientation
  CoreWebView2PrintOrientation = (
    Portrait = 0,
    Landscape = 1
  );
  PCoreWebView2PrintOrientation = ^CoreWebView2PrintOrientation;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintMediaSize
  CoreWebView2PrintMediaSize = (
    Default = 0,
    Custom = 1
  );
  PCoreWebView2PrintMediaSize = ^CoreWebView2PrintMediaSize;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintDuplex
  CoreWebView2PrintDuplex = (
    Default = 0,
    OneSided = 1,
    TwoSidedLongEdge = 2,
    TwoSidedShortEdge = 3
  );
  PCoreWebView2PrintDuplex = ^CoreWebView2PrintDuplex;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintDialogKind
  CoreWebView2PrintDialogKind = (
    Browser = 0,
    System = 1
  );
  PCoreWebView2PrintDialogKind = ^CoreWebView2PrintDialogKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintColorMode
  CoreWebView2PrintColorMode = (
    Default = 0,
    Color = 1,
    Grayscale = 2
  );
  PCoreWebView2PrintColorMode = ^CoreWebView2PrintColorMode;

  // Microsoft.Web.WebView2.Core.CoreWebView2PrintCollation
  CoreWebView2PrintCollation = (
    Default = 0,
    Collated = 1,
    Uncollated = 2
  );
  PCoreWebView2PrintCollation = ^CoreWebView2PrintCollation;

  // Microsoft.Web.WebView2.Core.CoreWebView2PreferredColorScheme
  CoreWebView2PreferredColorScheme = (
    Auto = 0,
    Light = 1,
    Dark = 2
  );
  PCoreWebView2PreferredColorScheme = ^CoreWebView2PreferredColorScheme;

  // Microsoft.Web.WebView2.Core.CoreWebView2PointerEventKind
  CoreWebView2PointerEventKind = (
    Activate = 587,
    Down = 582,
    Enter = 585,
    Leave = 586,
    Up = 583,
    Update = 581
  );
  PCoreWebView2PointerEventKind = ^CoreWebView2PointerEventKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2PermissionState
  CoreWebView2PermissionState = (
    Default = 0,
    Allow = 1,
    Deny = 2
  );
  PCoreWebView2PermissionState = ^CoreWebView2PermissionState;

  // Microsoft.Web.WebView2.Core.CoreWebView2PermissionKind
  CoreWebView2PermissionKind = (
    UnknownPermission = 0,
    Microphone = 1,
    Camera = 2,
    Geolocation = 3,
    Notifications = 4,
    OtherSensors = 5,
    ClipboardRead = 6,
    MultipleAutomaticDownloads = 7,
    FileReadWrite = 8,
    Autoplay = 9,
    LocalFonts = 10,
    MidiSystemExclusiveMessages = 11
  );
  PCoreWebView2PermissionKind = ^CoreWebView2PermissionKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2PdfToolbarItems
  CoreWebView2PdfToolbarItems = (
    None = 0,
    Save = 1,
    Print = 2,
    SaveAs = 4,
    ZoomIn = 8,
    ZoomOut = 16,
    Rotate = 32,
    FitPage = 64,
    PageLayout = 128,
    Bookmarks = 256,
    PageSelector = 512,
    Search = 1024,
    FullScreen = 2048,
    MoreSettings = 4096
  );
  PCoreWebView2PdfToolbarItems = ^CoreWebView2PdfToolbarItems;

  // Microsoft.Web.WebView2.Core.CoreWebView2MoveFocusReason
  CoreWebView2MoveFocusReason = (
    Programmatic = 0,
    Next = 1,
    Previous = 2
  );
  PCoreWebView2MoveFocusReason = ^CoreWebView2MoveFocusReason;

  // Microsoft.Web.WebView2.Core.CoreWebView2MouseEventVirtualKeys
  CoreWebView2MouseEventVirtualKeys = (
    None = 0,
    LeftButton = 1,
    RightButton = 2,
    Shift = 4,
    Control = 8,
    MiddleButton = 16,
    XButton1 = 32,
    XButton2 = 64
  );
  PCoreWebView2MouseEventVirtualKeys = ^CoreWebView2MouseEventVirtualKeys;

  // Microsoft.Web.WebView2.Core.CoreWebView2MouseEventKind
  CoreWebView2MouseEventKind = (
    HorizontalWheel = 526,
    LeftButtonDoubleClick = 515,
    LeftButtonDown = 513,
    LeftButtonUp = 514,
    Leave = 675,
    MiddleButtonDoubleClick = 521,
    MiddleButtonDown = 519,
    MiddleButtonUp = 520,
    Move = 512,
    RightButtonDoubleClick = 518,
    RightButtonDown = 516,
    RightButtonUp = 517,
    Wheel = 522,
    XButtonDoubleClick = 525,
    XButtonDown = 523,
    XButtonUp = 524
  );
  PCoreWebView2MouseEventKind = ^CoreWebView2MouseEventKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2KeyEventKind
  CoreWebView2KeyEventKind = (
    KeyDown = 0,
    KeyUp = 1,
    SystemKeyDown = 2,
    SystemKeyUp = 3
  );
  PCoreWebView2KeyEventKind = ^CoreWebView2KeyEventKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2HostResourceAccessKind
  CoreWebView2HostResourceAccessKind = (
    Deny = 0,
    Allow = 1,
    DenyCors = 2
  );
  PCoreWebView2HostResourceAccessKind = ^CoreWebView2HostResourceAccessKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2FaviconImageFormat
  CoreWebView2FaviconImageFormat = (
    Png = 0,
    Jpeg = 1
  );
  PCoreWebView2FaviconImageFormat = ^CoreWebView2FaviconImageFormat;

  // Microsoft.Web.WebView2.Core.CoreWebView2DownloadState
  CoreWebView2DownloadState = (
    InProgress = 0,
    Interrupted = 1,
    Completed = 2
  );
  PCoreWebView2DownloadState = ^CoreWebView2DownloadState;

  // Microsoft.Web.WebView2.Core.CoreWebView2DownloadInterruptReason
  CoreWebView2DownloadInterruptReason = (
    None = 0,
    FileFailed = 1,
    FileAccessDenied = 2,
    FileNoSpace = 3,
    FileNameTooLong = 4,
    FileTooLarge = 5,
    FileMalicious = 6,
    FileTransientError = 7,
    FileBlockedByPolicy = 8,
    FileSecurityCheckFailed = 9,
    FileTooShort = 10,
    FileHashMismatch = 11,
    NetworkFailed = 12,
    NetworkTimeout = 13,
    NetworkDisconnected = 14,
    NetworkServerDown = 15,
    NetworkInvalidRequest = 16,
    ServerFailed = 17,
    ServerNoRange = 18,
    ServerBadContent = 19,
    ServerUnauthorized = 20,
    ServerCertificateProblem = 21,
    ServerForbidden = 22,
    ServerUnexpectedResponse = 23,
    ServerContentLengthMismatch = 24,
    ServerCrossOriginRedirect = 25,
    UserCanceled = 26,
    UserShutdown = 27,
    UserPaused = 28,
    DownloadProcessCrashed = 29
  );
  PCoreWebView2DownloadInterruptReason = ^CoreWebView2DownloadInterruptReason;

  // Microsoft.Web.WebView2.Core.CoreWebView2DefaultDownloadDialogCornerAlignment
  CoreWebView2DefaultDownloadDialogCornerAlignment = (
    TopLeft = 0,
    TopRight = 1,
    BottomLeft = 2,
    BottomRight = 3
  );
  PCoreWebView2DefaultDownloadDialogCornerAlignment = ^CoreWebView2DefaultDownloadDialogCornerAlignment;

  // Microsoft.Web.WebView2.Core.CoreWebView2CookieSameSiteKind
  CoreWebView2CookieSameSiteKind = (
    None = 0,
    Lax = 1,
    Strict = 2
  );
  PCoreWebView2CookieSameSiteKind = ^CoreWebView2CookieSameSiteKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2ContextMenuTargetKind
  CoreWebView2ContextMenuTargetKind = (
    Page = 0,
    Image = 1,
    SelectedText = 2,
    Audio = 3,
    Video = 4
  );
  PCoreWebView2ContextMenuTargetKind = ^CoreWebView2ContextMenuTargetKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2ContextMenuItemKind
  CoreWebView2ContextMenuItemKind = (
    Command = 0,
    CheckBox = 1,
    Radio = 2,
    Separator = 3,
    Submenu = 4
  );
  PCoreWebView2ContextMenuItemKind = ^CoreWebView2ContextMenuItemKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2ClientCertificateKind
  CoreWebView2ClientCertificateKind = (
    SmartCard = 0,
    Pin = 1,
    Other = 2
  );
  PCoreWebView2ClientCertificateKind = ^CoreWebView2ClientCertificateKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2CapturePreviewImageFormat
  CoreWebView2CapturePreviewImageFormat = (
    Png = 0,
    Jpeg = 1
  );
  PCoreWebView2CapturePreviewImageFormat = ^CoreWebView2CapturePreviewImageFormat;

  // Microsoft.Web.WebView2.Core.CoreWebView2BrowsingDataKinds
  CoreWebView2BrowsingDataKinds = (
    FileSystems = 1,
    IndexedDb = 2,
    LocalStorage = 4,
    WebSql = 8,
    CacheStorage = 16,
    AllDomStorage = 32,
    Cookies = 64,
    AllSite = 128,
    DiskCache = 256,
    DownloadHistory = 512,
    GeneralAutofill = 1024,
    PasswordAutosave = 2048,
    BrowsingHistory = 4096,
    Settings = 8192,
    AllProfile = 16384
  );
  PCoreWebView2BrowsingDataKinds = ^CoreWebView2BrowsingDataKinds;

  // Microsoft.Web.WebView2.Core.CoreWebView2BrowserProcessExitKind
  CoreWebView2BrowserProcessExitKind = (
    Normal = 0,
    Failed = 1
  );
  PCoreWebView2BrowserProcessExitKind = ^CoreWebView2BrowserProcessExitKind;

  // Microsoft.Web.WebView2.Core.CoreWebView2BoundsMode
  CoreWebView2BoundsMode = (
    UseRawPixels = 0,
    UseRasterizationScale = 1
  );
  PCoreWebView2BoundsMode = ^CoreWebView2BoundsMode;

  // Microsoft.Web.WebView2.Core Records

  // Microsoft.Web.WebView2.Core.CoreWebView2PhysicalKeyStatus
  CoreWebView2PhysicalKeyStatus = record
    RepeatCount: Cardinal;
    ScanCode: Cardinal;
    IsExtendedKey: Integer;
    IsMenuKeyDown: Integer;
    WasKeyDown: Integer;
    IsKeyReleased: Integer;
  end;
  PCoreWebView2PhysicalKeyStatus = ^CoreWebView2PhysicalKeyStatus;

  // Microsoft.Web.WebView2.Core Interfaces

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterator_1__ICoreWebView2FrameInfo_Base = interface(IInspectable)
  ['{624FF619-2F1E-5907-9628-9BF8A27AEC56}']
    function get_Current: ICoreWebView2FrameInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PICoreWebView2FrameInfo): Cardinal; safecall;
    property Current: ICoreWebView2FrameInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterator_1__ICoreWebView2FrameInfo = interface(IIterator_1__ICoreWebView2FrameInfo_Base)
  ['{B7737BD3-DFBC-5E80-A44A-68D7FB9E6FBC}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterable_1__ICoreWebView2FrameInfo_Base = interface(IInspectable)
  ['{64178451-45E4-5DEF-9B31-39946E2FFE42}']
    function First: IIterator_1__ICoreWebView2FrameInfo; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IIterable_1__ICoreWebView2FrameInfo = interface(IIterable_1__ICoreWebView2FrameInfo_Base)
  ['{82B94280-D99A-572E-A2BC-6B3A8A941C91}']
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2DispatchAdapter
  ICoreWebView2DispatchAdapter = interface(IInspectable)
  ['{7888A42D-18F3-5966-80CB-8CC25351BD0A}']
    function WrapNamedObject(name: HSTRING; adapter: ICoreWebView2DispatchAdapter): IInspectable; safecall;
    function WrapObject(unwrapped: IInspectable; adapter: ICoreWebView2DispatchAdapter): IInspectable; safecall;
    function UnwrapObject(wrapped: IInspectable): IInspectable; safecall;
    procedure Clean; safecall;
  end;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{09335560-6C6B-5A26-9348-97B781132B20}']
    function get_Key: HSTRING; safecall;
    function get_Value: IInspectable; safecall;
    property Key: HSTRING read get_Key;
    property Value: IInspectable read get_Value;
  end;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
    function get_Current: IKeyValuePair_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IInspectable; safecall;
  end;

  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface(IInspectable)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IInspectable; out second: IMapView_2__HSTRING__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{1B0D3570-0877-5EC2-8A2C-3B9539506ACA}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IInspectable; safecall;
    function Insert(key: HSTRING; value: IInspectable): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface(IInspectable)
  ['{60141EFB-F2F9-5377-96FD-F8C60D9558B5}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Key: HSTRING; safecall;
    property CollectionChange_: CollectionChange read get_CollectionChange;
    property Key: HSTRING read get_Key;
  end;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__IInspectable; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{236AAC9D-FB12-5C4D-A41C-9E445FB4D7EC}']
    function add_MapChanged(vhnd: MapChangedEventHandler_2__HSTRING__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MapChanged(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{38F3077E-5DB3-5086-8CFB-A84390F080BA}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{CC373E50-25F3-5972-87A2-B0E2E9A8256B}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base = interface(IInspectable)
  ['{B65E248D-E184-5797-AE90-A88CD6EC980B}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
  end;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface(IInspectable)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Current: HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface(IInspectable)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
    function First: IIterator_1__HSTRING; safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F13C006-A03A-5F69-B090-75A43E33423E}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface(IInspectable)
  ['{98B9ACC1-4B56-532E-AC73-03D5291CCA90}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__HSTRING; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: HSTRING); safecall;
    procedure InsertAt(index: Cardinal; value: HSTRING); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: HSTRING); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2ControllerFactory
  ICoreWebView2ControllerFactory = interface(IInspectable)
  ['{270B2C5B-C3A9-53D8-A5CA-262EA9EA62E8}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface(IUnknown)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface(IInspectable)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HSTRING; safecall;
    function GetResults: HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HSTRING read get_Completed write put_Completed;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Object>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable_Delegate_Base = interface(IUnknown)
  ['{141750E7-397F-57AD-BA25-FC15A2B22C3D}']
    procedure Invoke(sender: ICoreWebView2PrivatePartial; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Object>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable = interface(TypedEventHandler_2__ICoreWebView2PrivatePartial__IInspectable_Delegate_Base)
  ['{D39CB785-782A-526A-88A9-8750B3705ED3}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.Web.WebView2.Core.CoreWebView2PrintStatus>
  AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus = interface(IUnknown)
  ['{D38D6C62-3272-54CE-BE54-E78AB2BEFE2F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__CoreWebView2PrintStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.Web.WebView2.Core.CoreWebView2PrintStatus>
  IAsyncOperation_1__CoreWebView2PrintStatus = interface(IInspectable)
  ['{D896D604-6E00-5486-A8A9-EE599544DD16}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus; safecall;
    function GetResults: CoreWebView2PrintStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__CoreWebView2PrintStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base = interface(IUnknown)
  ['{F3F0BAA0-8862-5E4C-A51C-27C43AB4BC57}']
    procedure Invoke(sender: ICoreWebView2PrivatePartial; args: ICoreWebView2NavigationStartingEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2 = interface(TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base)
  ['{F5461817-E681-5F11-94B3-B16C52D3D7CA}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base = interface(IUnknown)
  ['{58DA20F8-B824-507D-991D-01F877607CCF}']
    procedure Invoke(sender: ICoreWebView2PrivatePartial; args: ICoreWebView2NavigationCompletedEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2 = interface(TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base)
  ['{547BC46A-0566-5AD9-971C-502E851D19D6}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base = interface(IUnknown)
  ['{B6A7D449-BACE-5E6E-B95E-D3B9698FB2A0}']
    procedure Invoke(sender: ICoreWebView2PrivatePartial; args: ICoreWebView2ProcessFailedEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2 = interface(TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base)
  ['{15BA1D3A-696A-55EE-8BC3-D4F7EBDF9795}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{3CC74D54-D5EC-5E36-B054-C91F9B229E56}']
    procedure Invoke(sender: ICoreWebView2PrivatePartial; args: ICoreWebView2WebMessageReceivedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs = interface(TypedEventHandler_2__ICoreWebView2PrivatePartial__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base)
  ['{0A52327A-F66D-588A-87A6-8359E291EC17}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface(IUnknown)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface(IInspectable)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInspectable; safecall;
    function GetResults: IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInspectable read get_Completed write put_Completed;
  end;

implementation

end.
