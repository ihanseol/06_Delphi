{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI;

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
  Winapi.Microsoft.CommonTypes,
  Winapi.Foundation,
  Winapi.UI,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type

  // Forward declarations for interfaces

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = ^TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = ^TypedEventHandler_2__IDispatcherQueue__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Single>
  IIterator_1__Single = interface;
  PIIterator_1__Single = ^IIterator_1__Single;

  // Windows.Foundation.Collections.IIterable`1<Single>
  IIterable_1__Single = interface;
  PIIterable_1__Single = ^IIterable_1__Single;

  // Windows.Foundation.Collections.IVectorView`1<Single>
  IVectorView_1__Single = interface;
  PIVectorView_1__Single = ^IVectorView_1__Single;

  // Windows.Foundation.Collections.IVector`1<Single>
  IVector_1__Single = interface;
  PIVector_1__Single = ^IVector_1__Single;

  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface;
  PIReference_1__Single = ^IReference_1__Single;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

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

  // Microsoft.UI.IColorHelper
  IColorHelper = interface;
  PIColorHelper = ^IColorHelper;

  // Microsoft.UI.IColorHelperStatics
  IColorHelperStatics = interface;
  PIColorHelperStatics = ^IColorHelperStatics;

  // Microsoft.UI.IColors
  IColors = interface;
  PIColors = ^IColors;

  // Microsoft.UI.IColorsStatics
  IColorsStatics = interface;
  PIColorsStatics = ^IColorsStatics;

  // Microsoft.UI.Windowing.IAppWindowPresenter
  Windowing_IAppWindowPresenter = interface;
  PWindowing_IAppWindowPresenter = ^Windowing_IAppWindowPresenter;

  // Microsoft.UI.Windowing.IAppWindowTitleBar
  Windowing_IAppWindowTitleBar = interface;
  PWindowing_IAppWindowTitleBar = ^Windowing_IAppWindowTitleBar;

  // Microsoft.UI.Windowing.IDisplayArea
  Windowing_IDisplayArea = interface;
  PWindowing_IDisplayArea = ^Windowing_IDisplayArea;

  // Microsoft.UI.Windowing.IAppWindowChangedEventArgs
  Windowing_IAppWindowChangedEventArgs = interface;
  PWindowing_IAppWindowChangedEventArgs = ^Windowing_IAppWindowChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowChangedEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs = interface;
  PTypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs = ^TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs;

  // Microsoft.UI.Windowing.IAppWindowClosingEventArgs
  Windowing_IAppWindowClosingEventArgs = interface;
  PWindowing_IAppWindowClosingEventArgs = ^Windowing_IAppWindowClosingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowClosingEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs = interface;
  PTypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs = ^TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Object>
  TypedEventHandler_2__Windowing_IAppWindow__IInspectable = interface;
  PTypedEventHandler_2__Windowing_IAppWindow__IInspectable = ^TypedEventHandler_2__Windowing_IAppWindow__IInspectable;

  // Microsoft.UI.Windowing.IAppWindow
  Windowing_IAppWindow = interface;
  PWindowing_IAppWindow = ^Windowing_IAppWindow;

  // Microsoft.UI.Windowing.IAppWindowPresenterFactory
  Windowing_IAppWindowPresenterFactory = interface;
  PWindowing_IAppWindowPresenterFactory = ^Windowing_IAppWindowPresenterFactory;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterator_1__Windowing_IDisplayArea = interface;
  PIIterator_1__Windowing_IDisplayArea = ^IIterator_1__Windowing_IDisplayArea;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterable_1__Windowing_IDisplayArea = interface;
  PIIterable_1__Windowing_IDisplayArea = ^IIterable_1__Windowing_IDisplayArea;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Windowing.IDisplayArea>
  IVectorView_1__Windowing_IDisplayArea = interface;
  PIVectorView_1__Windowing_IDisplayArea = ^IVectorView_1__Windowing_IDisplayArea;

  // Microsoft.UI Enums

  // Microsoft.UI.Windowing.AppWindowPresenterKind
  Windowing_AppWindowPresenterKind = (
    Default = 0,
    CompactOverlay = 1,
    FullScreen = 2,
    Overlapped = 3
  );
  PWindowing_AppWindowPresenterKind = ^Windowing_AppWindowPresenterKind;

  // Microsoft.UI.Windowing.CompactOverlaySize
  Windowing_CompactOverlaySize = (
    Small = 0,
    Medium = 1,
    Large = 2
  );
  PWindowing_CompactOverlaySize = ^Windowing_CompactOverlaySize;

  // Microsoft.UI.Windowing.DisplayAreaFallback
  Windowing_DisplayAreaFallback = (
    None = 0,
    Primary = 1,
    Nearest = 2
  );
  PWindowing_DisplayAreaFallback = ^Windowing_DisplayAreaFallback;

  // Microsoft.UI.Windowing.DisplayAreaWatcherStatus
  Windowing_DisplayAreaWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PWindowing_DisplayAreaWatcherStatus = ^Windowing_DisplayAreaWatcherStatus;

  // Microsoft.UI.Windowing.IconShowOptions
  Windowing_IconShowOptions = (
    ShowIconAndSystemMenu = 0,
    HideIconAndSystemMenu = 1
  );
  PWindowing_IconShowOptions = ^Windowing_IconShowOptions;

  // Microsoft.UI.Windowing.OverlappedPresenterState
  Windowing_OverlappedPresenterState = (
    Maximized = 0,
    Minimized = 1,
    Restored = 2
  );
  PWindowing_OverlappedPresenterState = ^Windowing_OverlappedPresenterState;

  // Microsoft.UI.Windowing.TitleBarHeightOption
  Windowing_TitleBarHeightOption = (
    Standard = 0,
    Tall = 1
  );
  PWindowing_TitleBarHeightOption = ^Windowing_TitleBarHeightOption;

  // Microsoft.UI Records

  // Microsoft.UI.DisplayId
  DisplayId = record
    Value: UInt64;
  end;
  PDisplayId = ^DisplayId;

  // Microsoft.UI.IconId
  IconId = record
    Value: UInt64;
  end;
  PIconId = ^IconId;

  // Microsoft.UI.WindowId
  WindowId = record
    Value: UInt64;
  end;
  PWindowId = ^WindowId;

  // Microsoft.UI Interfaces

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

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{F6D1F700-49C2-52AE-8154-826F9908773C}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__HSTRING; safecall;
    function Insert(key: HSTRING; value: HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{2182A2AC-7545-566A-984F-B10F07BAB089}']
    procedure Invoke(sender: IDispatcherQueueTimer; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface(TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base)
  ['{89F8745E-47AC-55BC-A839-176C9F33B0B3}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3BDAF5DD-3DA4-5B44-ADB3-6990540AFAC6}']
    procedure Invoke(sender: IDispatcherQueue; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface(TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base)
  ['{D3D47E00-3A62-574C-95C5-A429784D78B8}']
  end;

  // Windows.Foundation.Collections.IIterator`1<Single>
  IIterator_1__Single = interface(IInspectable)
  ['{42614E61-B0AA-5E72-9354-2771DB20B7A8}']
    function get_Current: Single; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    property Current: Single read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IIterable`1<Single>
  IIterable_1__Single = interface(IInspectable)
  ['{B01BEE51-063A-5FDA-BD72-D76637BB8CB8}']
    function First: IIterator_1__Single; safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Single>
  IVectorView_1__Single = interface(IInspectable)
  ['{7BCA64FD-150C-5D50-B56B-9F4F474C5930}']
    function GetAt(index: Cardinal): Single; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Single; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVector`1<Single>
  IVector_1__Single = interface(IInspectable)
  ['{61CF693F-DB4C-579F-B905-5DD3D23CFD4D}']
    function GetAt(index: Cardinal): Single; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Single; safecall;
    function IndexOf(value: Single; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Single); safecall;
    procedure InsertAt(index: Cardinal; value: Single); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Single); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSingle); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface(IInspectable)
  ['{719CC2BA-3E76-5DEF-9F1A-38D85A145EA8}']
    function get_Value: Single; safecall;
    property Value: Single read get_Value;
  end;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.IColorHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_ColorHelper)]
  IColorHelper = interface(IInspectable)
  ['{3ADDDCCD-3949-585B-A566-CCB8350DD221}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.IColorHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_ColorHelper)]
  IColorHelperStatics = interface(IInspectable)
  ['{1D1D85A1-EB63-538A-84F0-019210BC406B}']
    function FromArgb(a: Byte; r: Byte; g: Byte; b: Byte): Color; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.IColors
  [WinRTClassNameAttribute(SMicrosoft_UI_Colors)]
  IColors = interface(IInspectable)
  ['{8CF15863-8411-5AFD-946C-328E04DA2F2F}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.IColorsStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Colors)]
  IColorsStatics = interface(IInspectable)
  ['{8620A5B0-015A-57AC-A3F3-895D0B1269AE}']
    function get_AliceBlue: Color; safecall;
    function get_AntiqueWhite: Color; safecall;
    function get_Aqua: Color; safecall;
    function get_Aquamarine: Color; safecall;
    function get_Azure: Color; safecall;
    function get_Beige: Color; safecall;
    function get_Bisque: Color; safecall;
    function get_Black: Color; safecall;
    function get_BlanchedAlmond: Color; safecall;
    function get_Blue: Color; safecall;
    function get_BlueViolet: Color; safecall;
    function get_Brown: Color; safecall;
    function get_BurlyWood: Color; safecall;
    function get_CadetBlue: Color; safecall;
    function get_Chartreuse: Color; safecall;
    function get_Chocolate: Color; safecall;
    function get_Coral: Color; safecall;
    function get_CornflowerBlue: Color; safecall;
    function get_Cornsilk: Color; safecall;
    function get_Crimson: Color; safecall;
    function get_Cyan: Color; safecall;
    function get_DarkBlue: Color; safecall;
    function get_DarkCyan: Color; safecall;
    function get_DarkGoldenrod: Color; safecall;
    function get_DarkGray: Color; safecall;
    function get_DarkGreen: Color; safecall;
    function get_DarkKhaki: Color; safecall;
    function get_DarkMagenta: Color; safecall;
    function get_DarkOliveGreen: Color; safecall;
    function get_DarkOrange: Color; safecall;
    function get_DarkOrchid: Color; safecall;
    function get_DarkRed: Color; safecall;
    function get_DarkSalmon: Color; safecall;
    function get_DarkSeaGreen: Color; safecall;
    function get_DarkSlateBlue: Color; safecall;
    function get_DarkSlateGray: Color; safecall;
    function get_DarkTurquoise: Color; safecall;
    function get_DarkViolet: Color; safecall;
    function get_DeepPink: Color; safecall;
    function get_DeepSkyBlue: Color; safecall;
    function get_DimGray: Color; safecall;
    function get_DodgerBlue: Color; safecall;
    function get_Firebrick: Color; safecall;
    function get_FloralWhite: Color; safecall;
    function get_ForestGreen: Color; safecall;
    function get_Fuchsia: Color; safecall;
    function get_Gainsboro: Color; safecall;
    function get_GhostWhite: Color; safecall;
    function get_Gold: Color; safecall;
    function get_Goldenrod: Color; safecall;
    function get_Gray: Color; safecall;
    function get_Green: Color; safecall;
    function get_GreenYellow: Color; safecall;
    function get_Honeydew: Color; safecall;
    function get_HotPink: Color; safecall;
    function get_IndianRed: Color; safecall;
    function get_Indigo: Color; safecall;
    function get_Ivory: Color; safecall;
    function get_Khaki: Color; safecall;
    function get_Lavender: Color; safecall;
    function get_LavenderBlush: Color; safecall;
    function get_LawnGreen: Color; safecall;
    function get_LemonChiffon: Color; safecall;
    function get_LightBlue: Color; safecall;
    function get_LightCoral: Color; safecall;
    function get_LightCyan: Color; safecall;
    function get_LightGoldenrodYellow: Color; safecall;
    function get_LightGreen: Color; safecall;
    function get_LightGray: Color; safecall;
    function get_LightPink: Color; safecall;
    function get_LightSalmon: Color; safecall;
    function get_LightSeaGreen: Color; safecall;
    function get_LightSkyBlue: Color; safecall;
    function get_LightSlateGray: Color; safecall;
    function get_LightSteelBlue: Color; safecall;
    function get_LightYellow: Color; safecall;
    function get_Lime: Color; safecall;
    function get_LimeGreen: Color; safecall;
    function get_Linen: Color; safecall;
    function get_Magenta: Color; safecall;
    function get_Maroon: Color; safecall;
    function get_MediumAquamarine: Color; safecall;
    function get_MediumBlue: Color; safecall;
    function get_MediumOrchid: Color; safecall;
    function get_MediumPurple: Color; safecall;
    function get_MediumSeaGreen: Color; safecall;
    function get_MediumSlateBlue: Color; safecall;
    function get_MediumSpringGreen: Color; safecall;
    function get_MediumTurquoise: Color; safecall;
    function get_MediumVioletRed: Color; safecall;
    function get_MidnightBlue: Color; safecall;
    function get_MintCream: Color; safecall;
    function get_MistyRose: Color; safecall;
    function get_Moccasin: Color; safecall;
    function get_NavajoWhite: Color; safecall;
    function get_Navy: Color; safecall;
    function get_OldLace: Color; safecall;
    function get_Olive: Color; safecall;
    function get_OliveDrab: Color; safecall;
    function get_Orange: Color; safecall;
    function get_OrangeRed: Color; safecall;
    function get_Orchid: Color; safecall;
    function get_PaleGoldenrod: Color; safecall;
    function get_PaleGreen: Color; safecall;
    function get_PaleTurquoise: Color; safecall;
    function get_PaleVioletRed: Color; safecall;
    function get_PapayaWhip: Color; safecall;
    function get_PeachPuff: Color; safecall;
    function get_Peru: Color; safecall;
    function get_Pink: Color; safecall;
    function get_Plum: Color; safecall;
    function get_PowderBlue: Color; safecall;
    function get_Purple: Color; safecall;
    function get_Red: Color; safecall;
    function get_RosyBrown: Color; safecall;
    function get_RoyalBlue: Color; safecall;
    function get_SaddleBrown: Color; safecall;
    function get_Salmon: Color; safecall;
    function get_SandyBrown: Color; safecall;
    function get_SeaGreen: Color; safecall;
    function get_SeaShell: Color; safecall;
    function get_Sienna: Color; safecall;
    function get_Silver: Color; safecall;
    function get_SkyBlue: Color; safecall;
    function get_SlateBlue: Color; safecall;
    function get_SlateGray: Color; safecall;
    function get_Snow: Color; safecall;
    function get_SpringGreen: Color; safecall;
    function get_SteelBlue: Color; safecall;
    function get_Tan: Color; safecall;
    function get_Teal: Color; safecall;
    function get_Thistle: Color; safecall;
    function get_Tomato: Color; safecall;
    function get_Transparent: Color; safecall;
    function get_Turquoise: Color; safecall;
    function get_Violet: Color; safecall;
    function get_Wheat: Color; safecall;
    function get_White: Color; safecall;
    function get_WhiteSmoke: Color; safecall;
    function get_Yellow: Color; safecall;
    function get_YellowGreen: Color; safecall;
    property AliceBlue: Color read get_AliceBlue;
    property AntiqueWhite: Color read get_AntiqueWhite;
    property Aqua: Color read get_Aqua;
    property Aquamarine: Color read get_Aquamarine;
    property Azure: Color read get_Azure;
    property Beige: Color read get_Beige;
    property Bisque: Color read get_Bisque;
    property Black: Color read get_Black;
    property BlanchedAlmond: Color read get_BlanchedAlmond;
    property Blue: Color read get_Blue;
    property BlueViolet: Color read get_BlueViolet;
    property Brown: Color read get_Brown;
    property BurlyWood: Color read get_BurlyWood;
    property CadetBlue: Color read get_CadetBlue;
    property Chartreuse: Color read get_Chartreuse;
    property Chocolate: Color read get_Chocolate;
    property Coral: Color read get_Coral;
    property CornflowerBlue: Color read get_CornflowerBlue;
    property Cornsilk: Color read get_Cornsilk;
    property Crimson: Color read get_Crimson;
    property Cyan: Color read get_Cyan;
    property DarkBlue: Color read get_DarkBlue;
    property DarkCyan: Color read get_DarkCyan;
    property DarkGoldenrod: Color read get_DarkGoldenrod;
    property DarkGray: Color read get_DarkGray;
    property DarkGreen: Color read get_DarkGreen;
    property DarkKhaki: Color read get_DarkKhaki;
    property DarkMagenta: Color read get_DarkMagenta;
    property DarkOliveGreen: Color read get_DarkOliveGreen;
    property DarkOrange: Color read get_DarkOrange;
    property DarkOrchid: Color read get_DarkOrchid;
    property DarkRed: Color read get_DarkRed;
    property DarkSalmon: Color read get_DarkSalmon;
    property DarkSeaGreen: Color read get_DarkSeaGreen;
    property DarkSlateBlue: Color read get_DarkSlateBlue;
    property DarkSlateGray: Color read get_DarkSlateGray;
    property DarkTurquoise: Color read get_DarkTurquoise;
    property DarkViolet: Color read get_DarkViolet;
    property DeepPink: Color read get_DeepPink;
    property DeepSkyBlue: Color read get_DeepSkyBlue;
    property DimGray: Color read get_DimGray;
    property DodgerBlue: Color read get_DodgerBlue;
    property Firebrick: Color read get_Firebrick;
    property FloralWhite: Color read get_FloralWhite;
    property ForestGreen: Color read get_ForestGreen;
    property Fuchsia: Color read get_Fuchsia;
    property Gainsboro: Color read get_Gainsboro;
    property GhostWhite: Color read get_GhostWhite;
    property Gold: Color read get_Gold;
    property Goldenrod: Color read get_Goldenrod;
    property Gray: Color read get_Gray;
    property Green: Color read get_Green;
    property GreenYellow: Color read get_GreenYellow;
    property Honeydew: Color read get_Honeydew;
    property HotPink: Color read get_HotPink;
    property IndianRed: Color read get_IndianRed;
    property Indigo: Color read get_Indigo;
    property Ivory: Color read get_Ivory;
    property Khaki: Color read get_Khaki;
    property Lavender: Color read get_Lavender;
    property LavenderBlush: Color read get_LavenderBlush;
    property LawnGreen: Color read get_LawnGreen;
    property LemonChiffon: Color read get_LemonChiffon;
    property LightBlue: Color read get_LightBlue;
    property LightCoral: Color read get_LightCoral;
    property LightCyan: Color read get_LightCyan;
    property LightGoldenrodYellow: Color read get_LightGoldenrodYellow;
    property LightGray: Color read get_LightGray;
    property LightGreen: Color read get_LightGreen;
    property LightPink: Color read get_LightPink;
    property LightSalmon: Color read get_LightSalmon;
    property LightSeaGreen: Color read get_LightSeaGreen;
    property LightSkyBlue: Color read get_LightSkyBlue;
    property LightSlateGray: Color read get_LightSlateGray;
    property LightSteelBlue: Color read get_LightSteelBlue;
    property LightYellow: Color read get_LightYellow;
    property Lime: Color read get_Lime;
    property LimeGreen: Color read get_LimeGreen;
    property Linen: Color read get_Linen;
    property Magenta: Color read get_Magenta;
    property Maroon: Color read get_Maroon;
    property MediumAquamarine: Color read get_MediumAquamarine;
    property MediumBlue: Color read get_MediumBlue;
    property MediumOrchid: Color read get_MediumOrchid;
    property MediumPurple: Color read get_MediumPurple;
    property MediumSeaGreen: Color read get_MediumSeaGreen;
    property MediumSlateBlue: Color read get_MediumSlateBlue;
    property MediumSpringGreen: Color read get_MediumSpringGreen;
    property MediumTurquoise: Color read get_MediumTurquoise;
    property MediumVioletRed: Color read get_MediumVioletRed;
    property MidnightBlue: Color read get_MidnightBlue;
    property MintCream: Color read get_MintCream;
    property MistyRose: Color read get_MistyRose;
    property Moccasin: Color read get_Moccasin;
    property NavajoWhite: Color read get_NavajoWhite;
    property Navy: Color read get_Navy;
    property OldLace: Color read get_OldLace;
    property Olive: Color read get_Olive;
    property OliveDrab: Color read get_OliveDrab;
    property Orange: Color read get_Orange;
    property OrangeRed: Color read get_OrangeRed;
    property Orchid: Color read get_Orchid;
    property PaleGoldenrod: Color read get_PaleGoldenrod;
    property PaleGreen: Color read get_PaleGreen;
    property PaleTurquoise: Color read get_PaleTurquoise;
    property PaleVioletRed: Color read get_PaleVioletRed;
    property PapayaWhip: Color read get_PapayaWhip;
    property PeachPuff: Color read get_PeachPuff;
    property Peru: Color read get_Peru;
    property Pink: Color read get_Pink;
    property Plum: Color read get_Plum;
    property PowderBlue: Color read get_PowderBlue;
    property Purple: Color read get_Purple;
    property Red: Color read get_Red;
    property RosyBrown: Color read get_RosyBrown;
    property RoyalBlue: Color read get_RoyalBlue;
    property SaddleBrown: Color read get_SaddleBrown;
    property Salmon: Color read get_Salmon;
    property SandyBrown: Color read get_SandyBrown;
    property SeaGreen: Color read get_SeaGreen;
    property SeaShell: Color read get_SeaShell;
    property Sienna: Color read get_Sienna;
    property Silver: Color read get_Silver;
    property SkyBlue: Color read get_SkyBlue;
    property SlateBlue: Color read get_SlateBlue;
    property SlateGray: Color read get_SlateGray;
    property Snow: Color read get_Snow;
    property SpringGreen: Color read get_SpringGreen;
    property SteelBlue: Color read get_SteelBlue;
    property Tan: Color read get_Tan;
    property Teal: Color read get_Teal;
    property Thistle: Color read get_Thistle;
    property Tomato: Color read get_Tomato;
    property Transparent: Color read get_Transparent;
    property Turquoise: Color read get_Turquoise;
    property Violet: Color read get_Violet;
    property Wheat: Color read get_Wheat;
    property White: Color read get_White;
    property WhiteSmoke: Color read get_WhiteSmoke;
    property Yellow: Color read get_Yellow;
    property YellowGreen: Color read get_YellowGreen;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IAppWindowPresenter
  Windowing_IAppWindowPresenter = interface(IInspectable)
  ['{BC3042C2-C6C6-5632-8989-FF0EC6D3B40D}']
    function get_Kind: Windowing_AppWindowPresenterKind; safecall;
    property Kind: Windowing_AppWindowPresenterKind read get_Kind;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IAppWindowTitleBar
  Windowing_IAppWindowTitleBar = interface(IInspectable)
  ['{5574EFA2-C91C-5700-A363-539C71A7AAF4}']
    function get_BackgroundColor: IReference_1__Color; safecall;
    procedure put_BackgroundColor(value: IReference_1__Color); safecall;
    function get_ButtonBackgroundColor: IReference_1__Color; safecall;
    procedure put_ButtonBackgroundColor(value: IReference_1__Color); safecall;
    function get_ButtonForegroundColor: IReference_1__Color; safecall;
    procedure put_ButtonForegroundColor(value: IReference_1__Color); safecall;
    function get_ButtonHoverBackgroundColor: IReference_1__Color; safecall;
    procedure put_ButtonHoverBackgroundColor(value: IReference_1__Color); safecall;
    function get_ButtonHoverForegroundColor: IReference_1__Color; safecall;
    procedure put_ButtonHoverForegroundColor(value: IReference_1__Color); safecall;
    function get_ButtonInactiveBackgroundColor: IReference_1__Color; safecall;
    procedure put_ButtonInactiveBackgroundColor(value: IReference_1__Color); safecall;
    function get_ButtonInactiveForegroundColor: IReference_1__Color; safecall;
    procedure put_ButtonInactiveForegroundColor(value: IReference_1__Color); safecall;
    function get_ButtonPressedBackgroundColor: IReference_1__Color; safecall;
    procedure put_ButtonPressedBackgroundColor(value: IReference_1__Color); safecall;
    function get_ButtonPressedForegroundColor: IReference_1__Color; safecall;
    procedure put_ButtonPressedForegroundColor(value: IReference_1__Color); safecall;
    function get_ExtendsContentIntoTitleBar: Boolean; safecall;
    procedure put_ExtendsContentIntoTitleBar(value: Boolean); safecall;
    function get_ForegroundColor: IReference_1__Color; safecall;
    procedure put_ForegroundColor(value: IReference_1__Color); safecall;
    function get_Height: Integer; safecall;
    function get_IconShowOptions: Windowing_IconShowOptions; safecall;
    procedure put_IconShowOptions(value: Windowing_IconShowOptions); safecall;
    function get_InactiveBackgroundColor: IReference_1__Color; safecall;
    procedure put_InactiveBackgroundColor(value: IReference_1__Color); safecall;
    function get_InactiveForegroundColor: IReference_1__Color; safecall;
    procedure put_InactiveForegroundColor(value: IReference_1__Color); safecall;
    function get_LeftInset: Integer; safecall;
    function get_RightInset: Integer; safecall;
    procedure ResetToDefault; safecall;
    procedure SetDragRectangles(valueSize: Cardinal; value: PRectInt32); safecall;
    property BackgroundColor: IReference_1__Color read get_BackgroundColor write put_BackgroundColor;
    property ButtonBackgroundColor: IReference_1__Color read get_ButtonBackgroundColor write put_ButtonBackgroundColor;
    property ButtonForegroundColor: IReference_1__Color read get_ButtonForegroundColor write put_ButtonForegroundColor;
    property ButtonHoverBackgroundColor: IReference_1__Color read get_ButtonHoverBackgroundColor write put_ButtonHoverBackgroundColor;
    property ButtonHoverForegroundColor: IReference_1__Color read get_ButtonHoverForegroundColor write put_ButtonHoverForegroundColor;
    property ButtonInactiveBackgroundColor: IReference_1__Color read get_ButtonInactiveBackgroundColor write put_ButtonInactiveBackgroundColor;
    property ButtonInactiveForegroundColor: IReference_1__Color read get_ButtonInactiveForegroundColor write put_ButtonInactiveForegroundColor;
    property ButtonPressedBackgroundColor: IReference_1__Color read get_ButtonPressedBackgroundColor write put_ButtonPressedBackgroundColor;
    property ButtonPressedForegroundColor: IReference_1__Color read get_ButtonPressedForegroundColor write put_ButtonPressedForegroundColor;
    property ExtendsContentIntoTitleBar: Boolean read get_ExtendsContentIntoTitleBar write put_ExtendsContentIntoTitleBar;
    property ForegroundColor: IReference_1__Color read get_ForegroundColor write put_ForegroundColor;
    property Height: Integer read get_Height;
    property IconShowOptions: Windowing_IconShowOptions read get_IconShowOptions write put_IconShowOptions;
    property InactiveBackgroundColor: IReference_1__Color read get_InactiveBackgroundColor write put_InactiveBackgroundColor;
    property InactiveForegroundColor: IReference_1__Color read get_InactiveForegroundColor write put_InactiveForegroundColor;
    property LeftInset: Integer read get_LeftInset;
    property RightInset: Integer read get_RightInset;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IDisplayArea
  Windowing_IDisplayArea = interface(IInspectable)
  ['{5C7E0537-B621-5579-BCAE-A84AA8746167}']
    function get_DisplayId: DisplayId; safecall;
    function get_IsPrimary: Boolean; safecall;
    function get_OuterBounds: RectInt32; safecall;
    function get_WorkArea: RectInt32; safecall;
    property DisplayId_: DisplayId read get_DisplayId;
    property IsPrimary: Boolean read get_IsPrimary;
    property OuterBounds: RectInt32 read get_OuterBounds;
    property WorkArea: RectInt32 read get_WorkArea;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IAppWindowChangedEventArgs
  Windowing_IAppWindowChangedEventArgs = interface(IInspectable)
  ['{2182BC5D-FDAC-5C3E-BF37-7D8D684E9D1D}']
    function get_DidPositionChange: Boolean; safecall;
    function get_DidPresenterChange: Boolean; safecall;
    function get_DidSizeChange: Boolean; safecall;
    function get_DidVisibilityChange: Boolean; safecall;
    property DidPositionChange: Boolean read get_DidPositionChange;
    property DidPresenterChange: Boolean read get_DidPresenterChange;
    property DidSizeChange: Boolean read get_DidSizeChange;
    property DidVisibilityChange: Boolean read get_DidVisibilityChange;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowChangedEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CDA07756-1584-5049-9AD1-CCA782242D34}']
    procedure Invoke(sender: Windowing_IAppWindow; args: Windowing_IAppWindowChangedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowChangedEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs = interface(TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs_Delegate_Base)
  ['{D83EC508-C430-5D0F-A7FE-6B764CC7B00D}']
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IAppWindowClosingEventArgs
  Windowing_IAppWindowClosingEventArgs = interface(IInspectable)
  ['{0E09D90B-2261-590B-9AD1-8504991D8754}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowClosingEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{FD0E72C8-8DAA-50A2-959F-4D41446F1FC7}']
    procedure Invoke(sender: Windowing_IAppWindow; args: Windowing_IAppWindowClosingEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Microsoft.UI.Windowing.IAppWindowClosingEventArgs>
  TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs = interface(TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs_Delegate_Base)
  ['{0523404E-D99D-5F74-AC34-D2BF0B818B6E}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Object>
  TypedEventHandler_2__Windowing_IAppWindow__IInspectable_Delegate_Base = interface(IUnknown)
  ['{EDDD665F-7D53-5B2D-901D-9C12010816E7}']
    procedure Invoke(sender: Windowing_IAppWindow; args: IInspectable); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Windowing.IAppWindow,Object>
  TypedEventHandler_2__Windowing_IAppWindow__IInspectable = interface(TypedEventHandler_2__Windowing_IAppWindow__IInspectable_Delegate_Base)
  ['{3978879B-D93D-5104-921E-25FDD4A0E8E6}']
  end;

  // UsedAPI Interface
  // Microsoft.UI.Windowing.IAppWindow
  Windowing_IAppWindow = interface(IInspectable)
  ['{CFA788B3-643B-5C5E-AD4E-321D48A82ACD}']
    function get_Id: WindowId; safecall;
    function get_IsShownInSwitchers: Boolean; safecall;
    procedure put_IsShownInSwitchers(value: Boolean); safecall;
    function get_IsVisible: Boolean; safecall;
    function get_OwnerWindowId: WindowId; safecall;
    function get_Position: PointInt32; safecall;
    function get_Presenter: Windowing_IAppWindowPresenter; safecall;
    function get_Size: SizeInt32; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_TitleBar: Windowing_IAppWindowTitleBar; safecall;
    procedure Destroy; safecall;
    procedure Hide; safecall;
    procedure Move(position: PointInt32); safecall;
    procedure MoveAndResize(rect: RectInt32); overload; safecall;
    procedure MoveAndResize(rect: RectInt32; displayarea: Windowing_IDisplayArea); overload; safecall;
    procedure Resize(size: SizeInt32); safecall;
    procedure SetIcon(iconPath: HSTRING); overload; safecall;
    procedure SetIcon(iconId: IconId); overload; safecall;
    procedure SetPresenter(appWindowPresenter: Windowing_IAppWindowPresenter); overload; safecall;
    procedure SetPresenter(appWindowPresenterKind: Windowing_AppWindowPresenterKind); overload; safecall;
    procedure Show; overload; safecall;
    procedure Show(activateWindow: Boolean); overload; safecall;
    function add_Changed(handler: TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Changed(token: EventRegistrationToken); safecall;
    function add_Closing(handler: TypedEventHandler_2__Windowing_IAppWindow__Windowing_IAppWindowClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closing(token: EventRegistrationToken); safecall;
    function add_Destroying(handler: TypedEventHandler_2__Windowing_IAppWindow__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Destroying(token: EventRegistrationToken); safecall;
    property Id: WindowId read get_Id;
    property IsShownInSwitchers: Boolean read get_IsShownInSwitchers write put_IsShownInSwitchers;
    property IsVisible: Boolean read get_IsVisible;
    property OwnerWindowId: WindowId read get_OwnerWindowId;
    property Position: PointInt32 read get_Position;
    property Presenter: Windowing_IAppWindowPresenter read get_Presenter;
    property Size: SizeInt32 read get_Size;
    property Title: HSTRING read get_Title write put_Title;
    property TitleBar: Windowing_IAppWindowTitleBar read get_TitleBar;
  end;

  // Microsoft.UI.Windowing.IAppWindowPresenterFactory
  Windowing_IAppWindowPresenterFactory = interface(IInspectable)
  ['{62082E3C-1368-5238-90D1-E932DC718A82}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterator_1__Windowing_IDisplayArea_Base = interface(IInspectable)
  ['{3D833884-2258-5C48-8D45-3642FE8C6755}']
    function get_Current: Windowing_IDisplayArea; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWindowing_IDisplayArea): Cardinal; safecall;
    property Current: Windowing_IDisplayArea read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterator_1__Windowing_IDisplayArea = interface(IIterator_1__Windowing_IDisplayArea_Base)
  ['{A0C75CD7-F5FC-51DC-BC5A-F345D20F9FD7}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterable_1__Windowing_IDisplayArea_Base = interface(IInspectable)
  ['{FB253085-6CFC-5FA6-948E-97383F5BE36C}']
    function First: IIterator_1__Windowing_IDisplayArea; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Windowing.IDisplayArea>
  IIterable_1__Windowing_IDisplayArea = interface(IIterable_1__Windowing_IDisplayArea_Base)
  ['{F7C9E684-E273-5D60-BFB1-24D9CFFDD822}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Windowing.IDisplayArea>
  IVectorView_1__Windowing_IDisplayArea = interface(IInspectable)
  ['{336AE55B-4B67-593B-A982-CE8AC59A8C14}']
    function GetAt(index: Cardinal): Windowing_IDisplayArea; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Windowing_IDisplayArea; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWindowing_IDisplayArea): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.UI.ColorHelper
  // Explicitly imported
  // Implements: Microsoft.UI.IColorHelper
  // Statics: "Microsoft.UI.IColorHelperStatics"
  TColorHelper = class(TWinRTGenericImportS<IColorHelperStatics>)
  public
    // -> IColorHelperStatics
    class function FromArgb(a: Byte; r: Byte; g: Byte; b: Byte): Color; static; inline;
  end;

  // Microsoft.UI.Colors
  // Explicitly imported
  // Implements: Microsoft.UI.IColors
  // Statics: "Microsoft.UI.IColorsStatics"
  TColors = class(TWinRTGenericImportS<IColorsStatics>)
  public
    // -> IColorsStatics
    class function get_AliceBlue: Color; static; inline;
    class function get_AntiqueWhite: Color; static; inline;
    class function get_Aqua: Color; static; inline;
    class function get_Aquamarine: Color; static; inline;
    class function get_Azure: Color; static; inline;
    class function get_Beige: Color; static; inline;
    class function get_Bisque: Color; static; inline;
    class function get_Black: Color; static; inline;
    class function get_BlanchedAlmond: Color; static; inline;
    class function get_Blue: Color; static; inline;
    class function get_BlueViolet: Color; static; inline;
    class function get_Brown: Color; static; inline;
    class function get_BurlyWood: Color; static; inline;
    class function get_CadetBlue: Color; static; inline;
    class function get_Chartreuse: Color; static; inline;
    class function get_Chocolate: Color; static; inline;
    class function get_Coral: Color; static; inline;
    class function get_CornflowerBlue: Color; static; inline;
    class function get_Cornsilk: Color; static; inline;
    class function get_Crimson: Color; static; inline;
    class function get_Cyan: Color; static; inline;
    class function get_DarkBlue: Color; static; inline;
    class function get_DarkCyan: Color; static; inline;
    class function get_DarkGoldenrod: Color; static; inline;
    class function get_DarkGray: Color; static; inline;
    class function get_DarkGreen: Color; static; inline;
    class function get_DarkKhaki: Color; static; inline;
    class function get_DarkMagenta: Color; static; inline;
    class function get_DarkOliveGreen: Color; static; inline;
    class function get_DarkOrange: Color; static; inline;
    class function get_DarkOrchid: Color; static; inline;
    class function get_DarkRed: Color; static; inline;
    class function get_DarkSalmon: Color; static; inline;
    class function get_DarkSeaGreen: Color; static; inline;
    class function get_DarkSlateBlue: Color; static; inline;
    class function get_DarkSlateGray: Color; static; inline;
    class function get_DarkTurquoise: Color; static; inline;
    class function get_DarkViolet: Color; static; inline;
    class function get_DeepPink: Color; static; inline;
    class function get_DeepSkyBlue: Color; static; inline;
    class function get_DimGray: Color; static; inline;
    class function get_DodgerBlue: Color; static; inline;
    class function get_Firebrick: Color; static; inline;
    class function get_FloralWhite: Color; static; inline;
    class function get_ForestGreen: Color; static; inline;
    class function get_Fuchsia: Color; static; inline;
    class function get_Gainsboro: Color; static; inline;
    class function get_GhostWhite: Color; static; inline;
    class function get_Gold: Color; static; inline;
    class function get_Goldenrod: Color; static; inline;
    class function get_Gray: Color; static; inline;
    class function get_Green: Color; static; inline;
    class function get_GreenYellow: Color; static; inline;
    class function get_Honeydew: Color; static; inline;
    class function get_HotPink: Color; static; inline;
    class function get_IndianRed: Color; static; inline;
    class function get_Indigo: Color; static; inline;
    class function get_Ivory: Color; static; inline;
    class function get_Khaki: Color; static; inline;
    class function get_Lavender: Color; static; inline;
    class function get_LavenderBlush: Color; static; inline;
    class function get_LawnGreen: Color; static; inline;
    class function get_LemonChiffon: Color; static; inline;
    class function get_LightBlue: Color; static; inline;
    class function get_LightCoral: Color; static; inline;
    class function get_LightCyan: Color; static; inline;
    class function get_LightGoldenrodYellow: Color; static; inline;
    class function get_LightGreen: Color; static; inline;
    class function get_LightGray: Color; static; inline;
    class function get_LightPink: Color; static; inline;
    class function get_LightSalmon: Color; static; inline;
    class function get_LightSeaGreen: Color; static; inline;
    class function get_LightSkyBlue: Color; static; inline;
    class function get_LightSlateGray: Color; static; inline;
    class function get_LightSteelBlue: Color; static; inline;
    class function get_LightYellow: Color; static; inline;
    class function get_Lime: Color; static; inline;
    class function get_LimeGreen: Color; static; inline;
    class function get_Linen: Color; static; inline;
    class function get_Magenta: Color; static; inline;
    class function get_Maroon: Color; static; inline;
    class function get_MediumAquamarine: Color; static; inline;
    class function get_MediumBlue: Color; static; inline;
    class function get_MediumOrchid: Color; static; inline;
    class function get_MediumPurple: Color; static; inline;
    class function get_MediumSeaGreen: Color; static; inline;
    class function get_MediumSlateBlue: Color; static; inline;
    class function get_MediumSpringGreen: Color; static; inline;
    class function get_MediumTurquoise: Color; static; inline;
    class function get_MediumVioletRed: Color; static; inline;
    class function get_MidnightBlue: Color; static; inline;
    class function get_MintCream: Color; static; inline;
    class function get_MistyRose: Color; static; inline;
    class function get_Moccasin: Color; static; inline;
    class function get_NavajoWhite: Color; static; inline;
    class function get_Navy: Color; static; inline;
    class function get_OldLace: Color; static; inline;
    class function get_Olive: Color; static; inline;
    class function get_OliveDrab: Color; static; inline;
    class function get_Orange: Color; static; inline;
    class function get_OrangeRed: Color; static; inline;
    class function get_Orchid: Color; static; inline;
    class function get_PaleGoldenrod: Color; static; inline;
    class function get_PaleGreen: Color; static; inline;
    class function get_PaleTurquoise: Color; static; inline;
    class function get_PaleVioletRed: Color; static; inline;
    class function get_PapayaWhip: Color; static; inline;
    class function get_PeachPuff: Color; static; inline;
    class function get_Peru: Color; static; inline;
    class function get_Pink: Color; static; inline;
    class function get_Plum: Color; static; inline;
    class function get_PowderBlue: Color; static; inline;
    class function get_Purple: Color; static; inline;
    class function get_Red: Color; static; inline;
    class function get_RosyBrown: Color; static; inline;
    class function get_RoyalBlue: Color; static; inline;
    class function get_SaddleBrown: Color; static; inline;
    class function get_Salmon: Color; static; inline;
    class function get_SandyBrown: Color; static; inline;
    class function get_SeaGreen: Color; static; inline;
    class function get_SeaShell: Color; static; inline;
    class function get_Sienna: Color; static; inline;
    class function get_Silver: Color; static; inline;
    class function get_SkyBlue: Color; static; inline;
    class function get_SlateBlue: Color; static; inline;
    class function get_SlateGray: Color; static; inline;
    class function get_Snow: Color; static; inline;
    class function get_SpringGreen: Color; static; inline;
    class function get_SteelBlue: Color; static; inline;
    class function get_Tan: Color; static; inline;
    class function get_Teal: Color; static; inline;
    class function get_Thistle: Color; static; inline;
    class function get_Tomato: Color; static; inline;
    class function get_Transparent: Color; static; inline;
    class function get_Turquoise: Color; static; inline;
    class function get_Violet: Color; static; inline;
    class function get_Wheat: Color; static; inline;
    class function get_White: Color; static; inline;
    class function get_WhiteSmoke: Color; static; inline;
    class function get_Yellow: Color; static; inline;
    class function get_YellowGreen: Color; static; inline;
    class property AliceBlue: Color read get_AliceBlue;
    class property AntiqueWhite: Color read get_AntiqueWhite;
    class property Aqua: Color read get_Aqua;
    class property Aquamarine: Color read get_Aquamarine;
    class property Azure: Color read get_Azure;
    class property Beige: Color read get_Beige;
    class property Bisque: Color read get_Bisque;
    class property Black: Color read get_Black;
    class property BlanchedAlmond: Color read get_BlanchedAlmond;
    class property Blue: Color read get_Blue;
    class property BlueViolet: Color read get_BlueViolet;
    class property Brown: Color read get_Brown;
    class property BurlyWood: Color read get_BurlyWood;
    class property CadetBlue: Color read get_CadetBlue;
    class property Chartreuse: Color read get_Chartreuse;
    class property Chocolate: Color read get_Chocolate;
    class property Coral: Color read get_Coral;
    class property CornflowerBlue: Color read get_CornflowerBlue;
    class property Cornsilk: Color read get_Cornsilk;
    class property Crimson: Color read get_Crimson;
    class property Cyan: Color read get_Cyan;
    class property DarkBlue: Color read get_DarkBlue;
    class property DarkCyan: Color read get_DarkCyan;
    class property DarkGoldenrod: Color read get_DarkGoldenrod;
    class property DarkGray: Color read get_DarkGray;
    class property DarkGreen: Color read get_DarkGreen;
    class property DarkKhaki: Color read get_DarkKhaki;
    class property DarkMagenta: Color read get_DarkMagenta;
    class property DarkOliveGreen: Color read get_DarkOliveGreen;
    class property DarkOrange: Color read get_DarkOrange;
    class property DarkOrchid: Color read get_DarkOrchid;
    class property DarkRed: Color read get_DarkRed;
    class property DarkSalmon: Color read get_DarkSalmon;
    class property DarkSeaGreen: Color read get_DarkSeaGreen;
    class property DarkSlateBlue: Color read get_DarkSlateBlue;
    class property DarkSlateGray: Color read get_DarkSlateGray;
    class property DarkTurquoise: Color read get_DarkTurquoise;
    class property DarkViolet: Color read get_DarkViolet;
    class property DeepPink: Color read get_DeepPink;
    class property DeepSkyBlue: Color read get_DeepSkyBlue;
    class property DimGray: Color read get_DimGray;
    class property DodgerBlue: Color read get_DodgerBlue;
    class property Firebrick: Color read get_Firebrick;
    class property FloralWhite: Color read get_FloralWhite;
    class property ForestGreen: Color read get_ForestGreen;
    class property Fuchsia: Color read get_Fuchsia;
    class property Gainsboro: Color read get_Gainsboro;
    class property GhostWhite: Color read get_GhostWhite;
    class property Gold: Color read get_Gold;
    class property Goldenrod: Color read get_Goldenrod;
    class property Gray: Color read get_Gray;
    class property Green: Color read get_Green;
    class property GreenYellow: Color read get_GreenYellow;
    class property Honeydew: Color read get_Honeydew;
    class property HotPink: Color read get_HotPink;
    class property IndianRed: Color read get_IndianRed;
    class property Indigo: Color read get_Indigo;
    class property Ivory: Color read get_Ivory;
    class property Khaki: Color read get_Khaki;
    class property Lavender: Color read get_Lavender;
    class property LavenderBlush: Color read get_LavenderBlush;
    class property LawnGreen: Color read get_LawnGreen;
    class property LemonChiffon: Color read get_LemonChiffon;
    class property LightBlue: Color read get_LightBlue;
    class property LightCoral: Color read get_LightCoral;
    class property LightCyan: Color read get_LightCyan;
    class property LightGoldenrodYellow: Color read get_LightGoldenrodYellow;
    class property LightGray: Color read get_LightGray;
    class property LightGreen: Color read get_LightGreen;
    class property LightPink: Color read get_LightPink;
    class property LightSalmon: Color read get_LightSalmon;
    class property LightSeaGreen: Color read get_LightSeaGreen;
    class property LightSkyBlue: Color read get_LightSkyBlue;
    class property LightSlateGray: Color read get_LightSlateGray;
    class property LightSteelBlue: Color read get_LightSteelBlue;
    class property LightYellow: Color read get_LightYellow;
    class property Lime: Color read get_Lime;
    class property LimeGreen: Color read get_LimeGreen;
    class property Linen: Color read get_Linen;
    class property Magenta: Color read get_Magenta;
    class property Maroon: Color read get_Maroon;
    class property MediumAquamarine: Color read get_MediumAquamarine;
    class property MediumBlue: Color read get_MediumBlue;
    class property MediumOrchid: Color read get_MediumOrchid;
    class property MediumPurple: Color read get_MediumPurple;
    class property MediumSeaGreen: Color read get_MediumSeaGreen;
    class property MediumSlateBlue: Color read get_MediumSlateBlue;
    class property MediumSpringGreen: Color read get_MediumSpringGreen;
    class property MediumTurquoise: Color read get_MediumTurquoise;
    class property MediumVioletRed: Color read get_MediumVioletRed;
    class property MidnightBlue: Color read get_MidnightBlue;
    class property MintCream: Color read get_MintCream;
    class property MistyRose: Color read get_MistyRose;
    class property Moccasin: Color read get_Moccasin;
    class property NavajoWhite: Color read get_NavajoWhite;
    class property Navy: Color read get_Navy;
    class property OldLace: Color read get_OldLace;
    class property Olive: Color read get_Olive;
    class property OliveDrab: Color read get_OliveDrab;
    class property Orange: Color read get_Orange;
    class property OrangeRed: Color read get_OrangeRed;
    class property Orchid: Color read get_Orchid;
    class property PaleGoldenrod: Color read get_PaleGoldenrod;
    class property PaleGreen: Color read get_PaleGreen;
    class property PaleTurquoise: Color read get_PaleTurquoise;
    class property PaleVioletRed: Color read get_PaleVioletRed;
    class property PapayaWhip: Color read get_PapayaWhip;
    class property PeachPuff: Color read get_PeachPuff;
    class property Peru: Color read get_Peru;
    class property Pink: Color read get_Pink;
    class property Plum: Color read get_Plum;
    class property PowderBlue: Color read get_PowderBlue;
    class property Purple: Color read get_Purple;
    class property Red: Color read get_Red;
    class property RosyBrown: Color read get_RosyBrown;
    class property RoyalBlue: Color read get_RoyalBlue;
    class property SaddleBrown: Color read get_SaddleBrown;
    class property Salmon: Color read get_Salmon;
    class property SandyBrown: Color read get_SandyBrown;
    class property SeaGreen: Color read get_SeaGreen;
    class property SeaShell: Color read get_SeaShell;
    class property Sienna: Color read get_Sienna;
    class property Silver: Color read get_Silver;
    class property SkyBlue: Color read get_SkyBlue;
    class property SlateBlue: Color read get_SlateBlue;
    class property SlateGray: Color read get_SlateGray;
    class property Snow: Color read get_Snow;
    class property SpringGreen: Color read get_SpringGreen;
    class property SteelBlue: Color read get_SteelBlue;
    class property Tan: Color read get_Tan;
    class property Teal: Color read get_Teal;
    class property Thistle: Color read get_Thistle;
    class property Tomato: Color read get_Tomato;
    class property Transparent: Color read get_Transparent;
    class property Turquoise: Color read get_Turquoise;
    class property Violet: Color read get_Violet;
    class property Wheat: Color read get_Wheat;
    class property White: Color read get_White;
    class property WhiteSmoke: Color read get_WhiteSmoke;
    class property Yellow: Color read get_Yellow;
    class property YellowGreen: Color read get_YellowGreen;
  end;

implementation

{ TColorHelper }

class function TColorHelper.FromArgb(a: Byte; r: Byte; g: Byte; b: Byte): Color;
begin
  Result := Statics.FromArgb(a, r, g, b);
end;


{ TColors }

class function TColors.get_AliceBlue: Color;
begin
  Result := Statics.get_AliceBlue;
end;

class function TColors.get_AntiqueWhite: Color;
begin
  Result := Statics.get_AntiqueWhite;
end;

class function TColors.get_Aqua: Color;
begin
  Result := Statics.get_Aqua;
end;

class function TColors.get_Aquamarine: Color;
begin
  Result := Statics.get_Aquamarine;
end;

class function TColors.get_Azure: Color;
begin
  Result := Statics.get_Azure;
end;

class function TColors.get_Beige: Color;
begin
  Result := Statics.get_Beige;
end;

class function TColors.get_Bisque: Color;
begin
  Result := Statics.get_Bisque;
end;

class function TColors.get_Black: Color;
begin
  Result := Statics.get_Black;
end;

class function TColors.get_BlanchedAlmond: Color;
begin
  Result := Statics.get_BlanchedAlmond;
end;

class function TColors.get_Blue: Color;
begin
  Result := Statics.get_Blue;
end;

class function TColors.get_BlueViolet: Color;
begin
  Result := Statics.get_BlueViolet;
end;

class function TColors.get_Brown: Color;
begin
  Result := Statics.get_Brown;
end;

class function TColors.get_BurlyWood: Color;
begin
  Result := Statics.get_BurlyWood;
end;

class function TColors.get_CadetBlue: Color;
begin
  Result := Statics.get_CadetBlue;
end;

class function TColors.get_Chartreuse: Color;
begin
  Result := Statics.get_Chartreuse;
end;

class function TColors.get_Chocolate: Color;
begin
  Result := Statics.get_Chocolate;
end;

class function TColors.get_Coral: Color;
begin
  Result := Statics.get_Coral;
end;

class function TColors.get_CornflowerBlue: Color;
begin
  Result := Statics.get_CornflowerBlue;
end;

class function TColors.get_Cornsilk: Color;
begin
  Result := Statics.get_Cornsilk;
end;

class function TColors.get_Crimson: Color;
begin
  Result := Statics.get_Crimson;
end;

class function TColors.get_Cyan: Color;
begin
  Result := Statics.get_Cyan;
end;

class function TColors.get_DarkBlue: Color;
begin
  Result := Statics.get_DarkBlue;
end;

class function TColors.get_DarkCyan: Color;
begin
  Result := Statics.get_DarkCyan;
end;

class function TColors.get_DarkGoldenrod: Color;
begin
  Result := Statics.get_DarkGoldenrod;
end;

class function TColors.get_DarkGray: Color;
begin
  Result := Statics.get_DarkGray;
end;

class function TColors.get_DarkGreen: Color;
begin
  Result := Statics.get_DarkGreen;
end;

class function TColors.get_DarkKhaki: Color;
begin
  Result := Statics.get_DarkKhaki;
end;

class function TColors.get_DarkMagenta: Color;
begin
  Result := Statics.get_DarkMagenta;
end;

class function TColors.get_DarkOliveGreen: Color;
begin
  Result := Statics.get_DarkOliveGreen;
end;

class function TColors.get_DarkOrange: Color;
begin
  Result := Statics.get_DarkOrange;
end;

class function TColors.get_DarkOrchid: Color;
begin
  Result := Statics.get_DarkOrchid;
end;

class function TColors.get_DarkRed: Color;
begin
  Result := Statics.get_DarkRed;
end;

class function TColors.get_DarkSalmon: Color;
begin
  Result := Statics.get_DarkSalmon;
end;

class function TColors.get_DarkSeaGreen: Color;
begin
  Result := Statics.get_DarkSeaGreen;
end;

class function TColors.get_DarkSlateBlue: Color;
begin
  Result := Statics.get_DarkSlateBlue;
end;

class function TColors.get_DarkSlateGray: Color;
begin
  Result := Statics.get_DarkSlateGray;
end;

class function TColors.get_DarkTurquoise: Color;
begin
  Result := Statics.get_DarkTurquoise;
end;

class function TColors.get_DarkViolet: Color;
begin
  Result := Statics.get_DarkViolet;
end;

class function TColors.get_DeepPink: Color;
begin
  Result := Statics.get_DeepPink;
end;

class function TColors.get_DeepSkyBlue: Color;
begin
  Result := Statics.get_DeepSkyBlue;
end;

class function TColors.get_DimGray: Color;
begin
  Result := Statics.get_DimGray;
end;

class function TColors.get_DodgerBlue: Color;
begin
  Result := Statics.get_DodgerBlue;
end;

class function TColors.get_Firebrick: Color;
begin
  Result := Statics.get_Firebrick;
end;

class function TColors.get_FloralWhite: Color;
begin
  Result := Statics.get_FloralWhite;
end;

class function TColors.get_ForestGreen: Color;
begin
  Result := Statics.get_ForestGreen;
end;

class function TColors.get_Fuchsia: Color;
begin
  Result := Statics.get_Fuchsia;
end;

class function TColors.get_Gainsboro: Color;
begin
  Result := Statics.get_Gainsboro;
end;

class function TColors.get_GhostWhite: Color;
begin
  Result := Statics.get_GhostWhite;
end;

class function TColors.get_Gold: Color;
begin
  Result := Statics.get_Gold;
end;

class function TColors.get_Goldenrod: Color;
begin
  Result := Statics.get_Goldenrod;
end;

class function TColors.get_Gray: Color;
begin
  Result := Statics.get_Gray;
end;

class function TColors.get_Green: Color;
begin
  Result := Statics.get_Green;
end;

class function TColors.get_GreenYellow: Color;
begin
  Result := Statics.get_GreenYellow;
end;

class function TColors.get_Honeydew: Color;
begin
  Result := Statics.get_Honeydew;
end;

class function TColors.get_HotPink: Color;
begin
  Result := Statics.get_HotPink;
end;

class function TColors.get_IndianRed: Color;
begin
  Result := Statics.get_IndianRed;
end;

class function TColors.get_Indigo: Color;
begin
  Result := Statics.get_Indigo;
end;

class function TColors.get_Ivory: Color;
begin
  Result := Statics.get_Ivory;
end;

class function TColors.get_Khaki: Color;
begin
  Result := Statics.get_Khaki;
end;

class function TColors.get_Lavender: Color;
begin
  Result := Statics.get_Lavender;
end;

class function TColors.get_LavenderBlush: Color;
begin
  Result := Statics.get_LavenderBlush;
end;

class function TColors.get_LawnGreen: Color;
begin
  Result := Statics.get_LawnGreen;
end;

class function TColors.get_LemonChiffon: Color;
begin
  Result := Statics.get_LemonChiffon;
end;

class function TColors.get_LightBlue: Color;
begin
  Result := Statics.get_LightBlue;
end;

class function TColors.get_LightCoral: Color;
begin
  Result := Statics.get_LightCoral;
end;

class function TColors.get_LightCyan: Color;
begin
  Result := Statics.get_LightCyan;
end;

class function TColors.get_LightGoldenrodYellow: Color;
begin
  Result := Statics.get_LightGoldenrodYellow;
end;

class function TColors.get_LightGreen: Color;
begin
  Result := Statics.get_LightGreen;
end;

class function TColors.get_LightGray: Color;
begin
  Result := Statics.get_LightGray;
end;

class function TColors.get_LightPink: Color;
begin
  Result := Statics.get_LightPink;
end;

class function TColors.get_LightSalmon: Color;
begin
  Result := Statics.get_LightSalmon;
end;

class function TColors.get_LightSeaGreen: Color;
begin
  Result := Statics.get_LightSeaGreen;
end;

class function TColors.get_LightSkyBlue: Color;
begin
  Result := Statics.get_LightSkyBlue;
end;

class function TColors.get_LightSlateGray: Color;
begin
  Result := Statics.get_LightSlateGray;
end;

class function TColors.get_LightSteelBlue: Color;
begin
  Result := Statics.get_LightSteelBlue;
end;

class function TColors.get_LightYellow: Color;
begin
  Result := Statics.get_LightYellow;
end;

class function TColors.get_Lime: Color;
begin
  Result := Statics.get_Lime;
end;

class function TColors.get_LimeGreen: Color;
begin
  Result := Statics.get_LimeGreen;
end;

class function TColors.get_Linen: Color;
begin
  Result := Statics.get_Linen;
end;

class function TColors.get_Magenta: Color;
begin
  Result := Statics.get_Magenta;
end;

class function TColors.get_Maroon: Color;
begin
  Result := Statics.get_Maroon;
end;

class function TColors.get_MediumAquamarine: Color;
begin
  Result := Statics.get_MediumAquamarine;
end;

class function TColors.get_MediumBlue: Color;
begin
  Result := Statics.get_MediumBlue;
end;

class function TColors.get_MediumOrchid: Color;
begin
  Result := Statics.get_MediumOrchid;
end;

class function TColors.get_MediumPurple: Color;
begin
  Result := Statics.get_MediumPurple;
end;

class function TColors.get_MediumSeaGreen: Color;
begin
  Result := Statics.get_MediumSeaGreen;
end;

class function TColors.get_MediumSlateBlue: Color;
begin
  Result := Statics.get_MediumSlateBlue;
end;

class function TColors.get_MediumSpringGreen: Color;
begin
  Result := Statics.get_MediumSpringGreen;
end;

class function TColors.get_MediumTurquoise: Color;
begin
  Result := Statics.get_MediumTurquoise;
end;

class function TColors.get_MediumVioletRed: Color;
begin
  Result := Statics.get_MediumVioletRed;
end;

class function TColors.get_MidnightBlue: Color;
begin
  Result := Statics.get_MidnightBlue;
end;

class function TColors.get_MintCream: Color;
begin
  Result := Statics.get_MintCream;
end;

class function TColors.get_MistyRose: Color;
begin
  Result := Statics.get_MistyRose;
end;

class function TColors.get_Moccasin: Color;
begin
  Result := Statics.get_Moccasin;
end;

class function TColors.get_NavajoWhite: Color;
begin
  Result := Statics.get_NavajoWhite;
end;

class function TColors.get_Navy: Color;
begin
  Result := Statics.get_Navy;
end;

class function TColors.get_OldLace: Color;
begin
  Result := Statics.get_OldLace;
end;

class function TColors.get_Olive: Color;
begin
  Result := Statics.get_Olive;
end;

class function TColors.get_OliveDrab: Color;
begin
  Result := Statics.get_OliveDrab;
end;

class function TColors.get_Orange: Color;
begin
  Result := Statics.get_Orange;
end;

class function TColors.get_OrangeRed: Color;
begin
  Result := Statics.get_OrangeRed;
end;

class function TColors.get_Orchid: Color;
begin
  Result := Statics.get_Orchid;
end;

class function TColors.get_PaleGoldenrod: Color;
begin
  Result := Statics.get_PaleGoldenrod;
end;

class function TColors.get_PaleGreen: Color;
begin
  Result := Statics.get_PaleGreen;
end;

class function TColors.get_PaleTurquoise: Color;
begin
  Result := Statics.get_PaleTurquoise;
end;

class function TColors.get_PaleVioletRed: Color;
begin
  Result := Statics.get_PaleVioletRed;
end;

class function TColors.get_PapayaWhip: Color;
begin
  Result := Statics.get_PapayaWhip;
end;

class function TColors.get_PeachPuff: Color;
begin
  Result := Statics.get_PeachPuff;
end;

class function TColors.get_Peru: Color;
begin
  Result := Statics.get_Peru;
end;

class function TColors.get_Pink: Color;
begin
  Result := Statics.get_Pink;
end;

class function TColors.get_Plum: Color;
begin
  Result := Statics.get_Plum;
end;

class function TColors.get_PowderBlue: Color;
begin
  Result := Statics.get_PowderBlue;
end;

class function TColors.get_Purple: Color;
begin
  Result := Statics.get_Purple;
end;

class function TColors.get_Red: Color;
begin
  Result := Statics.get_Red;
end;

class function TColors.get_RosyBrown: Color;
begin
  Result := Statics.get_RosyBrown;
end;

class function TColors.get_RoyalBlue: Color;
begin
  Result := Statics.get_RoyalBlue;
end;

class function TColors.get_SaddleBrown: Color;
begin
  Result := Statics.get_SaddleBrown;
end;

class function TColors.get_Salmon: Color;
begin
  Result := Statics.get_Salmon;
end;

class function TColors.get_SandyBrown: Color;
begin
  Result := Statics.get_SandyBrown;
end;

class function TColors.get_SeaGreen: Color;
begin
  Result := Statics.get_SeaGreen;
end;

class function TColors.get_SeaShell: Color;
begin
  Result := Statics.get_SeaShell;
end;

class function TColors.get_Sienna: Color;
begin
  Result := Statics.get_Sienna;
end;

class function TColors.get_Silver: Color;
begin
  Result := Statics.get_Silver;
end;

class function TColors.get_SkyBlue: Color;
begin
  Result := Statics.get_SkyBlue;
end;

class function TColors.get_SlateBlue: Color;
begin
  Result := Statics.get_SlateBlue;
end;

class function TColors.get_SlateGray: Color;
begin
  Result := Statics.get_SlateGray;
end;

class function TColors.get_Snow: Color;
begin
  Result := Statics.get_Snow;
end;

class function TColors.get_SpringGreen: Color;
begin
  Result := Statics.get_SpringGreen;
end;

class function TColors.get_SteelBlue: Color;
begin
  Result := Statics.get_SteelBlue;
end;

class function TColors.get_Tan: Color;
begin
  Result := Statics.get_Tan;
end;

class function TColors.get_Teal: Color;
begin
  Result := Statics.get_Teal;
end;

class function TColors.get_Thistle: Color;
begin
  Result := Statics.get_Thistle;
end;

class function TColors.get_Tomato: Color;
begin
  Result := Statics.get_Tomato;
end;

class function TColors.get_Transparent: Color;
begin
  Result := Statics.get_Transparent;
end;

class function TColors.get_Turquoise: Color;
begin
  Result := Statics.get_Turquoise;
end;

class function TColors.get_Violet: Color;
begin
  Result := Statics.get_Violet;
end;

class function TColors.get_Wheat: Color;
begin
  Result := Statics.get_Wheat;
end;

class function TColors.get_White: Color;
begin
  Result := Statics.get_White;
end;

class function TColors.get_WhiteSmoke: Color;
begin
  Result := Statics.get_WhiteSmoke;
end;

class function TColors.get_Yellow: Color;
begin
  Result := Statics.get_Yellow;
end;

class function TColors.get_YellowGreen: Color;
begin
  Result := Statics.get_YellowGreen;
end;


end.
