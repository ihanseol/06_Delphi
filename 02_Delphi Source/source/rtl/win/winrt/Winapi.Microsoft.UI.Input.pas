{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI.Input;

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
  Winapi.Microsoft.CommonTypes,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  HoldingState = Winapi.Microsoft.CommonTypes.HoldingState;
  PHoldingState = Winapi.Microsoft.CommonTypes.PHoldingState;
  IInputCursor = Winapi.Microsoft.CommonTypes.IInputCursor;
  PIInputCursor = Winapi.Microsoft.CommonTypes.PIInputCursor;
  IInputPointerSource = Winapi.Microsoft.CommonTypes.IInputPointerSource;
  PIInputPointerSource = Winapi.Microsoft.CommonTypes.PIInputPointerSource;
  InputPointerSourceDeviceKinds = Winapi.Microsoft.CommonTypes.InputPointerSourceDeviceKinds;
  PInputPointerSourceDeviceKinds = Winapi.Microsoft.CommonTypes.PInputPointerSourceDeviceKinds;
  IPointerEventArgs = Winapi.Microsoft.CommonTypes.IPointerEventArgs;
  PIPointerEventArgs = Winapi.Microsoft.CommonTypes.PIPointerEventArgs;
  IPointerPoint = Winapi.Microsoft.CommonTypes.IPointerPoint;
  PIPointerPoint = Winapi.Microsoft.CommonTypes.PIPointerPoint;
  IPointerPointProperties = Winapi.Microsoft.CommonTypes.IPointerPointProperties;
  PIPointerPointProperties = Winapi.Microsoft.CommonTypes.PIPointerPointProperties;
  IPointerPointTransform = Winapi.Microsoft.CommonTypes.IPointerPointTransform;
  PIPointerPointTransform = Winapi.Microsoft.CommonTypes.PIPointerPointTransform;
  IVector_1__IPointerPoint_Base = Winapi.Microsoft.CommonTypes.IVector_1__IPointerPoint_Base;
  IVector_1__IPointerPoint = Winapi.Microsoft.CommonTypes.IVector_1__IPointerPoint;
  PIVector_1__IPointerPoint = Winapi.Microsoft.CommonTypes.PIVector_1__IPointerPoint;
  IVectorView_1__IPointerPoint = Winapi.Microsoft.CommonTypes.IVectorView_1__IPointerPoint;
  PIVectorView_1__IPointerPoint = Winapi.Microsoft.CommonTypes.PIVectorView_1__IPointerPoint;
  ManipulationDelta = Winapi.Microsoft.CommonTypes.ManipulationDelta;
  PManipulationDelta = Winapi.Microsoft.CommonTypes.PManipulationDelta;
  ManipulationVelocities = Winapi.Microsoft.CommonTypes.ManipulationVelocities;
  PManipulationVelocities = Winapi.Microsoft.CommonTypes.PManipulationVelocities;
  PointerDeviceType = Winapi.Microsoft.CommonTypes.PointerDeviceType;
  PPointerDeviceType = Winapi.Microsoft.CommonTypes.PPointerDeviceType;
  PointerUpdateKind = Winapi.Microsoft.CommonTypes.PointerUpdateKind;
  PPointerUpdateKind = Winapi.Microsoft.CommonTypes.PPointerUpdateKind;
  TypedEventHandler_2__IInputPointerSource__IPointerEventArgs_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IInputPointerSource__IPointerEventArgs_Delegate_Base;
  TypedEventHandler_2__IInputPointerSource__IPointerEventArgs = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IInputPointerSource__IPointerEventArgs;
  PTypedEventHandler_2__IInputPointerSource__IPointerEventArgs = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IInputPointerSource__IPointerEventArgs;

  // Forward declarations for interfaces

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint = interface;
  PIIterator_1__IPointerPoint = ^IIterator_1__IPointerPoint;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint = interface;
  PIIterable_1__IPointerPoint = ^IIterable_1__IPointerPoint;

  // Microsoft.UI.Input.IInputCursorFactory
  IInputCursorFactory = interface;
  PIInputCursorFactory = ^IInputCursorFactory;

  // Microsoft.UI.Input.IInputCustomCursorFactory
  IInputCustomCursorFactory = interface;
  PIInputCustomCursorFactory = ^IInputCustomCursorFactory;

  // Microsoft.UI.Input.IInputObjectFactory
  IInputObjectFactory = interface;
  PIInputObjectFactory = ^IInputObjectFactory;

  // Microsoft.UI.Input Enums

  // Microsoft.UI.Input.CrossSlidingState
  CrossSlidingState = (
    Started = 0,
    Dragging = 1,
    Selecting = 2,
    SelectSpeedBumping = 3,
    SpeedBumping = 4,
    Rearranging = 5,
    Completed = 6
  );
  PCrossSlidingState = ^CrossSlidingState;

  // Microsoft.UI.Input.DraggingState
  DraggingState = (
    Started = 0,
    Continuing = 1,
    Completed = 2
  );
  PDraggingState = ^DraggingState;

  // Microsoft.UI.Input.GestureSettings
  GestureSettings = (
    None = 0,
    Tap = 1,
    DoubleTap = 2,
    Hold = 4,
    HoldWithMouse = 8,
    RightTap = 16,
    Drag = 32,
    ManipulationTranslateX = 64,
    ManipulationTranslateY = 128,
    ManipulationTranslateRailsX = 256,
    ManipulationTranslateRailsY = 512,
    ManipulationRotate = 1024,
    ManipulationScale = 2048,
    ManipulationTranslateInertia = 4096,
    ManipulationRotateInertia = 8192,
    ManipulationScaleInertia = 16384,
    CrossSlide = 32768,
    ManipulationMultipleFingerPanning = 65536
  );
  PGestureSettings = ^GestureSettings;

  // Microsoft.UI.Input.InputActivationState
  InputActivationState = (
    None = 0,
    Deactivated = 1,
    Activated = 2
  );
  PInputActivationState = ^InputActivationState;

  // Microsoft.UI.Input.InputSystemCursorShape
  InputSystemCursorShape = (
    Arrow = 0,
    Cross = 1,
    Hand = 3,
    Help = 4,
    IBeam = 5,
    SizeAll = 6,
    SizeNortheastSouthwest = 7,
    SizeNorthSouth = 8,
    SizeNorthwestSoutheast = 9,
    SizeWestEast = 10,
    UniversalNo = 11,
    UpArrow = 12,
    Wait = 13,
    Pin = 14,
    Person = 15,
    AppStarting = 16
  );
  PInputSystemCursorShape = ^InputSystemCursorShape;

  // Microsoft.UI.Input Records

  // Microsoft.UI.Input.CrossSlideThresholds
  CrossSlideThresholds = record
    SelectionStart: Single;
    SpeedBumpStart: Single;
    SpeedBumpEnd: Single;
    RearrangeStart: Single;
  end;
  PCrossSlideThresholds = ^CrossSlideThresholds;

  // Microsoft.UI.Input Interfaces

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint_Base = interface(IInspectable)
  ['{5B63939D-11CF-56C4-B0D0-11DF9DC487D1}']
    function get_Current: IPointerPoint; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    property Current: IPointerPoint read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint = interface(IIterator_1__IPointerPoint_Base)
  ['{F8506288-7ED6-582C-AD6E-ABC1B8F87146}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint_Base = interface(IInspectable)
  ['{645ACC33-FFCE-5AD3-BE2B-C49B9C27C35D}']
    function First: IIterator_1__IPointerPoint; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint = interface(IIterable_1__IPointerPoint_Base)
  ['{8FE344C3-6026-5FB6-9772-BD4981303386}']
  end;

  // Microsoft.UI.Input.IInputCursorFactory
  IInputCursorFactory = interface(IInspectable)
  ['{2F47647B-4BE0-53E9-BE7E-C38D5459DB6B}']
  end;

  // Microsoft.UI.Input.IInputCustomCursorFactory
  IInputCustomCursorFactory = interface(IInspectable)
  ['{6F402882-66E0-57D3-89D0-AA5E2FF917BC}']
  end;

  // Microsoft.UI.Input.IInputObjectFactory
  IInputObjectFactory = interface(IInspectable)
  ['{F7786BC2-B0B8-5961-9A57-AE199D452106}']
  end;

implementation

end.
