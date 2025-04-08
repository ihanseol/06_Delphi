{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.GraphicsRT;

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
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base;
  TypedEventHandler_2__IDispatcherQueue__IInspectable = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueue__IInspectable;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IDispatcherQueue__IInspectable;
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base;
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // Forward declarations for interfaces

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

  // Microsoft.Graphics Enums

  // Microsoft.Graphics.DirectX.DirectXAlphaMode
  DirectX_DirectXAlphaMode = (
    Unspecified = 0,
    Premultiplied = 1,
    Straight = 2,
    Ignore = 3
  );
  PDirectX_DirectXAlphaMode = ^DirectX_DirectXAlphaMode;

  // Microsoft.Graphics.DirectX.DirectXColorSpace
  DirectX_DirectXColorSpace = (
    RgbFullG22NoneP709 = 0,
    RgbFullG10NoneP709 = 1,
    RgbStudioG22NoneP709 = 2,
    RgbStudioG22NoneP2020 = 3,
    Reserved = 4,
    YccFullG22NoneP709X601 = 5,
    YccStudioG22LeftP601 = 6,
    YccFullG22LeftP601 = 7,
    YccStudioG22LeftP709 = 8,
    YccFullG22LeftP709 = 9,
    YccStudioG22LeftP2020 = 10,
    YccFullG22LeftP2020 = 11,
    RgbFullG2084NoneP2020 = 12,
    YccStudioG2084LeftP2020 = 13,
    RgbStudioG2084NoneP2020 = 14,
    YccStudioG22TopLeftP2020 = 15,
    YccStudioG2084TopLeftP2020 = 16,
    RgbFullG22NoneP2020 = 17,
    YccStudioGHlgTopLeftP2020 = 18,
    YccFullGHlgTopLeftP2020 = 19,
    RgbStudioG24NoneP709 = 20,
    RgbStudioG24NoneP2020 = 21,
    YccStudioG24LeftP709 = 22,
    YccStudioG24LeftP2020 = 23,
    YccStudioG24TopLeftP2020 = 24
  );
  PDirectX_DirectXColorSpace = ^DirectX_DirectXColorSpace;

  // Microsoft.Graphics.DirectX.DirectXPixelFormat
  DirectX_DirectXPixelFormat = (
    Unknown = 0,
    R32G32B32A32Typeless = 1,
    R32G32B32A32Float = 2,
    R32G32B32A32UInt = 3,
    R32G32B32A32Int = 4,
    R32G32B32Typeless = 5,
    R32G32B32Float = 6,
    R32G32B32UInt = 7,
    R32G32B32Int = 8,
    R16G16B16A16Typeless = 9,
    R16G16B16A16Float = 10,
    R16G16B16A16UIntNormalized = 11,
    R16G16B16A16UInt = 12,
    R16G16B16A16IntNormalized = 13,
    R16G16B16A16Int = 14,
    R32G32Typeless = 15,
    R32G32Float = 16,
    R32G32UInt = 17,
    R32G32Int = 18,
    R32G8X24Typeless = 19,
    D32FloatS8X24UInt = 20,
    R32FloatX8X24Typeless = 21,
    X32TypelessG8X24UInt = 22,
    R10G10B10A2Typeless = 23,
    R10G10B10A2UIntNormalized = 24,
    R10G10B10A2UInt = 25,
    R11G11B10Float = 26,
    R8G8B8A8Typeless = 27,
    R8G8B8A8UIntNormalized = 28,
    R8G8B8A8UIntNormalizedSrgb = 29,
    R8G8B8A8UInt = 30,
    R8G8B8A8IntNormalized = 31,
    R8G8B8A8Int = 32,
    R16G16Typeless = 33,
    R16G16Float = 34,
    R16G16UIntNormalized = 35,
    R16G16UInt = 36,
    R16G16IntNormalized = 37,
    R16G16Int = 38,
    R32Typeless = 39,
    D32Float = 40,
    R32Float = 41,
    R32UInt = 42,
    R32Int = 43,
    R24G8Typeless = 44,
    D24UIntNormalizedS8UInt = 45,
    R24UIntNormalizedX8Typeless = 46,
    X24TypelessG8UInt = 47,
    R8G8Typeless = 48,
    R8G8UIntNormalized = 49,
    R8G8UInt = 50,
    R8G8IntNormalized = 51,
    R8G8Int = 52,
    R16Typeless = 53,
    R16Float = 54,
    D16UIntNormalized = 55,
    R16UIntNormalized = 56,
    R16UInt = 57,
    R16IntNormalized = 58,
    R16Int = 59,
    R8Typeless = 60,
    R8UIntNormalized = 61,
    R8UInt = 62,
    R8IntNormalized = 63,
    R8Int = 64,
    A8UIntNormalized = 65,
    R1UIntNormalized = 66,
    R9G9B9E5SharedExponent = 67,
    R8G8B8G8UIntNormalized = 68,
    G8R8G8B8UIntNormalized = 69,
    BC1Typeless = 70,
    BC1UIntNormalized = 71,
    BC1UIntNormalizedSrgb = 72,
    BC2Typeless = 73,
    BC2UIntNormalized = 74,
    BC2UIntNormalizedSrgb = 75,
    BC3Typeless = 76,
    BC3UIntNormalized = 77,
    BC3UIntNormalizedSrgb = 78,
    BC4Typeless = 79,
    BC4UIntNormalized = 80,
    BC4IntNormalized = 81,
    BC5Typeless = 82,
    BC5UIntNormalized = 83,
    BC5IntNormalized = 84,
    B5G6R5UIntNormalized = 85,
    B5G5R5A1UIntNormalized = 86,
    B8G8R8A8UIntNormalized = 87,
    B8G8R8X8UIntNormalized = 88,
    R10G10B10XRBiasA2UIntNormalized = 89,
    B8G8R8A8Typeless = 90,
    B8G8R8A8UIntNormalizedSrgb = 91,
    B8G8R8X8Typeless = 92,
    B8G8R8X8UIntNormalizedSrgb = 93,
    BC6HTypeless = 94,
    BC6H16UnsignedFloat = 95,
    BC6H16Float = 96,
    BC7Typeless = 97,
    BC7UIntNormalized = 98,
    BC7UIntNormalizedSrgb = 99,
    Ayuv = 100,
    Y410 = 101,
    Y416 = 102,
    NV12 = 103,
    P010 = 104,
    P016 = 105,
    Opaque420 = 106,
    Yuy2 = 107,
    Y210 = 108,
    Y216 = 109,
    NV11 = 110,
    AI44 = 111,
    IA44 = 112,
    P8 = 113,
    A8P8 = 114,
    B4G4R4A4UIntNormalized = 115,
    P208 = 130,
    V208 = 131,
    V408 = 132,
    SamplerFeedbackMinMipOpaque = 189,
    SamplerFeedbackMipRegionUsedOpaque = 190
  );
  PDirectX_DirectXPixelFormat = ^DirectX_DirectXPixelFormat;

  // Microsoft.Graphics.DirectX.DirectXPrimitiveTopology
  DirectX_DirectXPrimitiveTopology = (
    Undefined = 0,
    PointList = 1,
    LineList = 2,
    LineStrip = 3,
    TriangleList = 4,
    TriangleStrip = 5
  );
  PDirectX_DirectXPrimitiveTopology = ^DirectX_DirectXPrimitiveTopology;

  // Microsoft.Graphics.Display.DisplayAdvancedColorKind
  Display_DisplayAdvancedColorKind = (
    StandardDynamicRange = 0,
    WideColorGamut = 1,
    HighDynamicRange = 2
  );
  PDisplay_DisplayAdvancedColorKind = ^Display_DisplayAdvancedColorKind;

  // Microsoft.Graphics.Display.DisplayHdrMetadataFormat
  Display_DisplayHdrMetadataFormat = (
    Hdr10 = 0,
    Hdr10Plus = 1
  );
  PDisplay_DisplayHdrMetadataFormat = ^Display_DisplayHdrMetadataFormat;

  // Microsoft.Graphics Interfaces

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

implementation

end.
