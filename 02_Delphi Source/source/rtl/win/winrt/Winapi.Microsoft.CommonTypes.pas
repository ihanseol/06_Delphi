{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.CommonTypes;

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
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type

  // Forward declarations for interfaces

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = ^TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // External: Microsoft.UI.Dispatching.IDispatcherQueueTimer
  IDispatcherQueueTimer = interface;
  PIDispatcherQueueTimer = ^IDispatcherQueueTimer;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = ^TypedEventHandler_2__IDispatcherQueue__IInspectable;

  // External: Microsoft.UI.Dispatching.IDispatcherQueue
  IDispatcherQueue = interface;
  PIDispatcherQueue = ^IDispatcherQueue;

  // External: Microsoft.UI.Dispatching.DispatcherQueueHandler
  DispatcherQueueHandler = interface;
  PDispatcherQueueHandler = ^DispatcherQueueHandler;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Microsoft.UI.Dispatching.IDispatcherQueueShutdownStartingEventArgs>
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = interface;
  PTypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = ^TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs;

  // External: Microsoft.UI.Dispatching.IDispatcherQueueShutdownStartingEventArgs
  IDispatcherQueueShutdownStartingEventArgs = interface;
  PIDispatcherQueueShutdownStartingEventArgs = ^IDispatcherQueueShutdownStartingEventArgs;

  // External: Microsoft.UI.Xaml.IFrameworkElement
  IFrameworkElement = interface;
  PIFrameworkElement = ^IFrameworkElement;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.ITriggerBase>
  IVector_1__ITriggerBase = interface;
  PIVector_1__ITriggerBase = ^IVector_1__ITriggerBase;

  // External: Microsoft.UI.Xaml.ITriggerBase
  ITriggerBase = interface;
  PITriggerBase = ^ITriggerBase;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.ITriggerBase>
  IVectorView_1__ITriggerBase = interface;
  PIVectorView_1__ITriggerBase = ^IVectorView_1__ITriggerBase;

  // External: Microsoft.UI.Xaml.IResourceDictionary
  IResourceDictionary = interface;
  PIResourceDictionary = ^IResourceDictionary;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IResourceDictionary>
  IVector_1__IResourceDictionary = interface;
  PIVector_1__IResourceDictionary = ^IVector_1__IResourceDictionary;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.IResourceDictionary>
  IVectorView_1__IResourceDictionary = interface;
  PIVectorView_1__IResourceDictionary = ^IVectorView_1__IResourceDictionary;

  // External: Microsoft.UI.Xaml.Media.IBrush
  IBrush = interface;
  PIBrush = ^IBrush;

  // External: Microsoft.UI.Xaml.Media.ITransform
  ITransform = interface;
  PITransform = ^ITransform;

  // External: Microsoft.UI.Xaml.IStyle
  IStyle = interface;
  PIStyle = ^IStyle;

  // External: Microsoft.UI.Xaml.ISetterBaseCollection
  ISetterBaseCollection = interface;
  PISetterBaseCollection = ^ISetterBaseCollection;

  // External: Microsoft.UI.Xaml.IDependencyObject
  IDependencyObject = interface;
  PIDependencyObject = ^IDependencyObject;

  // External: Microsoft.UI.Xaml.IDependencyProperty
  IDependencyProperty = interface;
  PIDependencyProperty = ^IDependencyProperty;

  // External: Microsoft.UI.Xaml.IPropertyMetadata
  IPropertyMetadata = interface;
  PIPropertyMetadata = ^IPropertyMetadata;

  // External: Microsoft.UI.Xaml.CreateDefaultValueCallback
  CreateDefaultValueCallback = interface;
  PCreateDefaultValueCallback = ^CreateDefaultValueCallback;

  // External: Microsoft.UI.Xaml.DependencyPropertyChangedCallback
  DependencyPropertyChangedCallback = interface;
  PDependencyPropertyChangedCallback = ^DependencyPropertyChangedCallback;

  // External: Microsoft.UI.Xaml.RoutedEventHandler
  RoutedEventHandler = interface;
  PRoutedEventHandler = ^RoutedEventHandler;

  // External: Microsoft.UI.Xaml.IRoutedEventArgs
  IRoutedEventArgs = interface;
  PIRoutedEventArgs = ^IRoutedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IDataContextChangedEventArgs>
  TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs = interface;
  PTypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs = ^TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs;

  // External: Microsoft.UI.Xaml.IDataContextChangedEventArgs
  IDataContextChangedEventArgs = interface;
  PIDataContextChangedEventArgs = ^IDataContextChangedEventArgs;

  // External: Microsoft.UI.Xaml.SizeChangedEventHandler
  SizeChangedEventHandler = interface;
  PSizeChangedEventHandler = ^SizeChangedEventHandler;

  // External: Microsoft.UI.Xaml.ISizeChangedEventArgs
  ISizeChangedEventArgs = interface;
  PISizeChangedEventArgs = ^ISizeChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Object>
  TypedEventHandler_2__IFrameworkElement__IInspectable = interface;
  PTypedEventHandler_2__IFrameworkElement__IInspectable = ^TypedEventHandler_2__IFrameworkElement__IInspectable;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IEffectiveViewportChangedEventArgs>
  TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs = interface;
  PTypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs = ^TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs;

  // External: Microsoft.UI.Xaml.IEffectiveViewportChangedEventArgs
  IEffectiveViewportChangedEventArgs = interface;
  PIEffectiveViewportChangedEventArgs = ^IEffectiveViewportChangedEventArgs;

  // External: Microsoft.UI.Xaml.Data.IBindingBase
  Data_IBindingBase = interface;
  PData_IBindingBase = ^Data_IBindingBase;

  // External: Microsoft.UI.Xaml.Data.IBindingExpression
  Data_IBindingExpression = interface;
  PData_IBindingExpression = ^Data_IBindingExpression;

  // External: Microsoft.UI.Xaml.Data.IBinding
  Data_IBinding = interface;
  PData_IBinding = ^Data_IBinding;

  // External: Microsoft.UI.Xaml.IPropertyPath
  IPropertyPath = interface;
  PIPropertyPath = ^IPropertyPath;

  // External: Microsoft.UI.Xaml.Data.IRelativeSource
  Data_IRelativeSource = interface;
  PData_IRelativeSource = ^Data_IRelativeSource;

  // External: Microsoft.UI.Xaml.Data.IValueConverter
  Data_IValueConverter = interface;
  PData_IValueConverter = ^Data_IValueConverter;

  // External: Microsoft.UI.Xaml.IXamlRoot
  IXamlRoot = interface;
  PIXamlRoot = ^IXamlRoot;

  // External: Microsoft.UI.Xaml.IUIElement
  IUIElement = interface;
  PIUIElement = ^IUIElement;

  // External: Microsoft.UI.Xaml.Media.IRectangleGeometry
  IRectangleGeometry = interface;
  PIRectangleGeometry = ^IRectangleGeometry;

  // External: Microsoft.UI.Xaml.Media.IProjection
  IProjection = interface;
  PIProjection = ^IProjection;

  // External: Microsoft.UI.Xaml.Media.Media3D.ITransform3D
  Media3D_ITransform3D = interface;
  PMedia3D_ITransform3D = ^Media3D_ITransform3D;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IVector_1__Animation_ITransition = interface;
  PIVector_1__Animation_ITransition = ^IVector_1__Animation_ITransition;

  // External: Microsoft.UI.Xaml.Media.Animation.ITransition
  Animation_ITransition = interface;
  PAnimation_ITransition = ^Animation_ITransition;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IVectorView_1__Animation_ITransition = interface;
  PIVectorView_1__Animation_ITransition = ^IVectorView_1__Animation_ITransition;

  // External: Microsoft.UI.Xaml.Media.ICacheMode
  ICacheMode = interface;
  PICacheMode = ^ICacheMode;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IPointer>
  IVectorView_1__Input_IPointer = interface;
  PIVectorView_1__Input_IPointer = ^IVectorView_1__Input_IPointer;

  // External: Microsoft.UI.Xaml.Input.IPointer
  Input_IPointer = interface;
  PInput_IPointer = ^Input_IPointer;

  // External: Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBase
  Primitives_IFlyoutBase = interface;
  PPrimitives_IFlyoutBase = ^Primitives_IFlyoutBase;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBase,Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs>
  TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs = interface;
  PTypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs = ^TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs
  Primitives_IFlyoutBaseClosingEventArgs = interface;
  PPrimitives_IFlyoutBaseClosingEventArgs = ^Primitives_IFlyoutBaseClosingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.Primitives.IFlyoutShowOptions
  Primitives_IFlyoutShowOptions = interface;
  PPrimitives_IFlyoutShowOptions = ^Primitives_IFlyoutShowOptions;

  // External: Microsoft.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
  Input_IProcessKeyboardAcceleratorEventArgs = interface;
  PInput_IProcessKeyboardAcceleratorEventArgs = ^Input_IProcessKeyboardAcceleratorEventArgs;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IVector_1__IXamlLight = interface;
  PIVector_1__IXamlLight = ^IVector_1__IXamlLight;

  // External: Microsoft.UI.Xaml.Media.IXamlLight
  IXamlLight = interface;
  PIXamlLight = ^IXamlLight;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IVectorView_1__IXamlLight = interface;
  PIVectorView_1__IXamlLight = ^IVectorView_1__IXamlLight;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IKeyboardAccelerator>
  IVector_1__Input_IKeyboardAccelerator = interface;
  PIVector_1__Input_IKeyboardAccelerator = ^IVector_1__Input_IKeyboardAccelerator;

  // External: Microsoft.UI.Xaml.Input.IKeyboardAccelerator
  Input_IKeyboardAccelerator = interface;
  PInput_IKeyboardAccelerator = ^Input_IKeyboardAccelerator;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Input.IKeyboardAccelerator,Microsoft.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs>
  TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs = interface;
  PTypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs = ^TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs
  Input_IKeyboardAcceleratorInvokedEventArgs = interface;
  PInput_IKeyboardAcceleratorInvokedEventArgs = ^Input_IKeyboardAcceleratorInvokedEventArgs;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IKeyboardAccelerator>
  IVectorView_1__Input_IKeyboardAccelerator = interface;
  PIVectorView_1__Input_IKeyboardAccelerator = ^IVectorView_1__Input_IKeyboardAccelerator;

  // External: Microsoft.UI.Xaml.IScalarTransition
  IScalarTransition = interface;
  PIScalarTransition = ^IScalarTransition;

  // External: Microsoft.UI.Xaml.IVector3Transition
  IVector3Transition = interface;
  PIVector3Transition = ^IVector3Transition;

  // External: Microsoft.UI.Xaml.Media.IShadow
  IShadow = interface;
  PIShadow = ^IShadow;

  // External: Microsoft.UI.Xaml.Input.KeyEventHandler
  Input_KeyEventHandler = interface;
  PInput_KeyEventHandler = ^Input_KeyEventHandler;

  // External: Microsoft.UI.Xaml.Input.IKeyRoutedEventArgs
  Input_IKeyRoutedEventArgs = interface;
  PInput_IKeyRoutedEventArgs = ^Input_IKeyRoutedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDragStartingEventArgs>
  TypedEventHandler_2__IUIElement__IDragStartingEventArgs = interface;
  PTypedEventHandler_2__IUIElement__IDragStartingEventArgs = ^TypedEventHandler_2__IUIElement__IDragStartingEventArgs;

  // External: Microsoft.UI.Xaml.IDragStartingEventArgs
  IDragStartingEventArgs = interface;
  PIDragStartingEventArgs = ^IDragStartingEventArgs;

  // External: Microsoft.UI.Xaml.IDragUI
  IDragUI = interface;
  PIDragUI = ^IDragUI;

  // External: Microsoft.UI.Xaml.Media.Imaging.IBitmapImage
  Imaging_IBitmapImage = interface;
  PImaging_IBitmapImage = ^Imaging_IBitmapImage;

  // External: Microsoft.UI.Xaml.Media.Imaging.DownloadProgressEventHandler
  Imaging_DownloadProgressEventHandler = interface;
  PImaging_DownloadProgressEventHandler = ^Imaging_DownloadProgressEventHandler;

  // External: Microsoft.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs
  Imaging_IDownloadProgressEventArgs = interface;
  PImaging_IDownloadProgressEventArgs = ^Imaging_IDownloadProgressEventArgs;

  // External: Microsoft.UI.Xaml.ExceptionRoutedEventHandler
  ExceptionRoutedEventHandler = interface;
  PExceptionRoutedEventHandler = ^ExceptionRoutedEventHandler;

  // External: Microsoft.UI.Xaml.IExceptionRoutedEventArgs
  IExceptionRoutedEventArgs = interface;
  PIExceptionRoutedEventArgs = ^IExceptionRoutedEventArgs;

  // External: Microsoft.UI.Xaml.IDragOperationDeferral
  IDragOperationDeferral = interface;
  PIDragOperationDeferral = ^IDragOperationDeferral;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDropCompletedEventArgs>
  TypedEventHandler_2__IUIElement__IDropCompletedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__IDropCompletedEventArgs = ^TypedEventHandler_2__IUIElement__IDropCompletedEventArgs;

  // External: Microsoft.UI.Xaml.IDropCompletedEventArgs
  IDropCompletedEventArgs = interface;
  PIDropCompletedEventArgs = ^IDropCompletedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs>
  TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs = ^TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs
  Input_ICharacterReceivedRoutedEventArgs = interface;
  PInput_ICharacterReceivedRoutedEventArgs = ^Input_ICharacterReceivedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.DragEventHandler
  DragEventHandler = interface;
  PDragEventHandler = ^DragEventHandler;

  // External: Microsoft.UI.Xaml.IDragEventArgs
  IDragEventArgs = interface;
  PIDragEventArgs = ^IDragEventArgs;

  // External: Microsoft.UI.Xaml.IDragUIOverride
  IDragUIOverride = interface;
  PIDragUIOverride = ^IDragUIOverride;

  // External: Microsoft.UI.Xaml.Input.PointerEventHandler
  Input_PointerEventHandler = interface;
  PInput_PointerEventHandler = ^Input_PointerEventHandler;

  // External: Microsoft.UI.Xaml.Input.IPointerRoutedEventArgs
  Input_IPointerRoutedEventArgs = interface;
  PInput_IPointerRoutedEventArgs = ^Input_IPointerRoutedEventArgs;

  // External: Microsoft.UI.Input.IPointerPoint
  IPointerPoint = interface;
  PIPointerPoint = ^IPointerPoint;

  // External: Microsoft.UI.Input.IPointerPointProperties
  IPointerPointProperties = interface;
  PIPointerPointProperties = ^IPointerPointProperties;

  // External: Microsoft.UI.Input.IPointerPointTransform
  IPointerPointTransform = interface;
  PIPointerPointTransform = ^IPointerPointTransform;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Input.IPointerPoint>
  IVector_1__IPointerPoint = interface;
  PIVector_1__IPointerPoint = ^IVector_1__IPointerPoint;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Input.IPointerPoint>
  IVectorView_1__IPointerPoint = interface;
  PIVectorView_1__IPointerPoint = ^IVectorView_1__IPointerPoint;

  // External: Microsoft.UI.Xaml.Input.TappedEventHandler
  Input_TappedEventHandler = interface;
  PInput_TappedEventHandler = ^Input_TappedEventHandler;

  // External: Microsoft.UI.Xaml.Input.ITappedRoutedEventArgs
  Input_ITappedRoutedEventArgs = interface;
  PInput_ITappedRoutedEventArgs = ^Input_ITappedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.DoubleTappedEventHandler
  Input_DoubleTappedEventHandler = interface;
  PInput_DoubleTappedEventHandler = ^Input_DoubleTappedEventHandler;

  // External: Microsoft.UI.Xaml.Input.IDoubleTappedRoutedEventArgs
  Input_IDoubleTappedRoutedEventArgs = interface;
  PInput_IDoubleTappedRoutedEventArgs = ^Input_IDoubleTappedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.HoldingEventHandler
  Input_HoldingEventHandler = interface;
  PInput_HoldingEventHandler = ^Input_HoldingEventHandler;

  // External: Microsoft.UI.Xaml.Input.IHoldingRoutedEventArgs
  Input_IHoldingRoutedEventArgs = interface;
  PInput_IHoldingRoutedEventArgs = ^Input_IHoldingRoutedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IContextRequestedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs = ^TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IContextRequestedEventArgs
  Input_IContextRequestedEventArgs = interface;
  PInput_IContextRequestedEventArgs = ^Input_IContextRequestedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IRoutedEventArgs>
  TypedEventHandler_2__IUIElement__IRoutedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__IRoutedEventArgs = ^TypedEventHandler_2__IUIElement__IRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.RightTappedEventHandler
  Input_RightTappedEventHandler = interface;
  PInput_RightTappedEventHandler = ^Input_RightTappedEventHandler;

  // External: Microsoft.UI.Xaml.Input.IRightTappedRoutedEventArgs
  Input_IRightTappedRoutedEventArgs = interface;
  PInput_IRightTappedRoutedEventArgs = ^Input_IRightTappedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.ManipulationStartingEventHandler
  Input_ManipulationStartingEventHandler = interface;
  PInput_ManipulationStartingEventHandler = ^Input_ManipulationStartingEventHandler;

  // External: Microsoft.UI.Xaml.Input.IManipulationStartingRoutedEventArgs
  Input_IManipulationStartingRoutedEventArgs = interface;
  PInput_IManipulationStartingRoutedEventArgs = ^Input_IManipulationStartingRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IManipulationPivot
  Input_IManipulationPivot = interface;
  PInput_IManipulationPivot = ^Input_IManipulationPivot;

  // External: Microsoft.UI.Xaml.Input.ManipulationInertiaStartingEventHandler
  Input_ManipulationInertiaStartingEventHandler = interface;
  PInput_ManipulationInertiaStartingEventHandler = ^Input_ManipulationInertiaStartingEventHandler;

  // External: Microsoft.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs
  Input_IManipulationInertiaStartingRoutedEventArgs = interface;
  PInput_IManipulationInertiaStartingRoutedEventArgs = ^Input_IManipulationInertiaStartingRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IInertiaExpansionBehavior
  Input_IInertiaExpansionBehavior = interface;
  PInput_IInertiaExpansionBehavior = ^Input_IInertiaExpansionBehavior;

  // External: Microsoft.UI.Xaml.Input.IInertiaRotationBehavior
  Input_IInertiaRotationBehavior = interface;
  PInput_IInertiaRotationBehavior = ^Input_IInertiaRotationBehavior;

  // External: Microsoft.UI.Xaml.Input.IInertiaTranslationBehavior
  Input_IInertiaTranslationBehavior = interface;
  PInput_IInertiaTranslationBehavior = ^Input_IInertiaTranslationBehavior;

  // External: Microsoft.UI.Xaml.Input.ManipulationStartedEventHandler
  Input_ManipulationStartedEventHandler = interface;
  PInput_ManipulationStartedEventHandler = ^Input_ManipulationStartedEventHandler;

  // External: Microsoft.UI.Xaml.Input.IManipulationStartedRoutedEventArgs
  Input_IManipulationStartedRoutedEventArgs = interface;
  PInput_IManipulationStartedRoutedEventArgs = ^Input_IManipulationStartedRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.ManipulationDeltaEventHandler
  Input_ManipulationDeltaEventHandler = interface;
  PInput_ManipulationDeltaEventHandler = ^Input_ManipulationDeltaEventHandler;

  // External: Microsoft.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs
  Input_IManipulationDeltaRoutedEventArgs = interface;
  PInput_IManipulationDeltaRoutedEventArgs = ^Input_IManipulationDeltaRoutedEventArgs;

  // External: Microsoft.UI.Xaml.Input.ManipulationCompletedEventHandler
  Input_ManipulationCompletedEventHandler = interface;
  PInput_ManipulationCompletedEventHandler = ^Input_ManipulationCompletedEventHandler;

  // External: Microsoft.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs
  Input_IManipulationCompletedRoutedEventArgs = interface;
  PInput_IManipulationCompletedRoutedEventArgs = ^Input_IManipulationCompletedRoutedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs = ^TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs
  Input_IAccessKeyDisplayRequestedEventArgs = interface;
  PInput_IAccessKeyDisplayRequestedEventArgs = ^Input_IAccessKeyDisplayRequestedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs = ^TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs
  Input_IAccessKeyDisplayDismissedEventArgs = interface;
  PInput_IAccessKeyDisplayDismissedEventArgs = ^Input_IAccessKeyDisplayDismissedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyInvokedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs = ^TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs;

  // External: Microsoft.UI.Xaml.Input.IAccessKeyInvokedEventArgs
  Input_IAccessKeyInvokedEventArgs = interface;
  PInput_IAccessKeyInvokedEventArgs = ^Input_IAccessKeyInvokedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs>
  TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs = ^TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IGettingFocusEventArgs>
  TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs = ^TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs;

  // External: Microsoft.UI.Xaml.Input.IGettingFocusEventArgs
  Input_IGettingFocusEventArgs = interface;
  PInput_IGettingFocusEventArgs = ^Input_IGettingFocusEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ILosingFocusEventArgs>
  TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs = ^TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs;

  // External: Microsoft.UI.Xaml.Input.ILosingFocusEventArgs
  Input_ILosingFocusEventArgs = interface;
  PInput_ILosingFocusEventArgs = ^Input_ILosingFocusEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.INoFocusCandidateFoundEventArgs>
  TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs = interface;
  PTypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs = ^TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs;

  // External: Microsoft.UI.Xaml.Input.INoFocusCandidateFoundEventArgs
  Input_INoFocusCandidateFoundEventArgs = interface;
  PInput_INoFocusCandidateFoundEventArgs = ^Input_INoFocusCandidateFoundEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IBringIntoViewRequestedEventArgs>
  TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs = interface;
  PTypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs = ^TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs;

  // External: Microsoft.UI.Xaml.IBringIntoViewRequestedEventArgs
  IBringIntoViewRequestedEventArgs = interface;
  PIBringIntoViewRequestedEventArgs = ^IBringIntoViewRequestedEventArgs;

  // External: Microsoft.UI.Xaml.IRoutedEvent
  IRoutedEvent = interface;
  PIRoutedEvent = ^IRoutedEvent;

  // External: Microsoft.UI.Xaml.Media.IGeneralTransform
  IGeneralTransform = interface;
  PIGeneralTransform = ^IGeneralTransform;

  // External: Microsoft.UI.Xaml.IBringIntoViewOptions
  IBringIntoViewOptions = interface;
  PIBringIntoViewOptions = ^IBringIntoViewOptions;

  // External: Microsoft.UI.Composition.ICompositionAnimationBase
  ICompositionAnimationBase = interface;
  PICompositionAnimationBase = ^ICompositionAnimationBase;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IXamlRoot,Microsoft.UI.Xaml.IXamlRootChangedEventArgs>
  TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs = interface;
  PTypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs = ^TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs;

  // External: Microsoft.UI.Xaml.IXamlRootChangedEventArgs
  IXamlRootChangedEventArgs = interface;
  PIXamlRootChangedEventArgs = ^IXamlRootChangedEventArgs;

  // External: Microsoft.UI.Xaml.Input.ICommand
  Input_ICommand = interface;
  PInput_ICommand = ^Input_ICommand;

  // External: Microsoft.UI.Xaml.IDataTemplate
  IDataTemplate = interface;
  PIDataTemplate = ^IDataTemplate;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Object>
  TypedEventHandler_2__IInfoBar__IInspectable = interface;
  PTypedEventHandler_2__IInfoBar__IInspectable = ^TypedEventHandler_2__IInfoBar__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.IInfoBar
  IInfoBar = interface;
  PIInfoBar = ^IInfoBar;

  // External: Microsoft.UI.Xaml.Controls.IIconSource
  IIconSource = interface;
  PIIconSource = ^IIconSource;

  // External: Microsoft.UI.Xaml.Controls.IIconElement
  IIconElement = interface;
  PIIconElement = ^IIconElement;

  // External: Microsoft.UI.Xaml.Controls.Primitives.IButtonBase
  Primitives_IButtonBase = interface;
  PPrimitives_IButtonBase = ^Primitives_IButtonBase;

  // External: Microsoft.UI.Xaml.Controls.IInfoBarTemplateSettings
  IInfoBarTemplateSettings = interface;
  PIInfoBarTemplateSettings = ^IInfoBarTemplateSettings;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosingEventArgs>
  TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs = interface;
  PTypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs = ^TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IInfoBarClosingEventArgs
  IInfoBarClosingEventArgs = interface;
  PIInfoBarClosingEventArgs = ^IInfoBarClosingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosedEventArgs>
  TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs = interface;
  PTypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs = ^TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IInfoBarClosedEventArgs
  IInfoBarClosedEventArgs = interface;
  PIInfoBarClosedEventArgs = ^IInfoBarClosedEventArgs;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Data.IItemIndexRange>
  IVectorView_1__Data_IItemIndexRange = interface;
  PIVectorView_1__Data_IItemIndexRange = ^IVectorView_1__Data_IItemIndexRange;

  // External: Microsoft.UI.Xaml.Data.IItemIndexRange
  Data_IItemIndexRange = interface;
  PData_IItemIndexRange = ^Data_IItemIndexRange;

  // External: Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Xaml.Data.LoadMoreItemsResult>
  IAsyncOperation_1__Data_LoadMoreItemsResult = interface;
  PIAsyncOperation_1__Data_LoadMoreItemsResult = ^IAsyncOperation_1__Data_LoadMoreItemsResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Xaml.Data.LoadMoreItemsResult>
  AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = interface;
  PAsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = ^AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult;

  // External: Microsoft.UI.Xaml.Input.IInputScope
  Input_IInputScope = interface;
  PInput_IInputScope = ^Input_IInputScope;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IInputScopeName>
  IVector_1__Input_IInputScopeName = interface;
  PIVector_1__Input_IInputScopeName = ^IVector_1__Input_IInputScopeName;

  // External: Microsoft.UI.Xaml.Input.IInputScopeName
  Input_IInputScopeName = interface;
  PInput_IInputScopeName = ^Input_IInputScopeName;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IInputScopeName>
  IVectorView_1__Input_IInputScopeName = interface;
  PIVectorView_1__Input_IInputScopeName = ^IVectorView_1__Input_IInputScopeName;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IRatingControl,Object>
  TypedEventHandler_2__IRatingControl__IInspectable = interface;
  PTypedEventHandler_2__IRatingControl__IInspectable = ^TypedEventHandler_2__IRatingControl__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.IRatingControl
  IRatingControl = interface;
  PIRatingControl = ^IRatingControl;

  // External: Microsoft.UI.Xaml.Controls.IRatingItemInfo
  IRatingItemInfo = interface;
  PIRatingItemInfo = ^IRatingItemInfo;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ILayout,Object>
  TypedEventHandler_2__ILayout__IInspectable = interface;
  PTypedEventHandler_2__ILayout__IInspectable = ^TypedEventHandler_2__ILayout__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ILayout
  ILayout = interface;
  PILayout = ^ILayout;

  // External: Microsoft.UI.Xaml.Controls.ILayoutContext
  ILayoutContext = interface;
  PILayoutContext = ^ILayoutContext;

  // External: Microsoft.UI.Xaml.Documents.ITextPointer
  Documents_ITextPointer = interface;
  PDocuments_ITextPointer = ^Documents_ITextPointer;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IBlock>
  IVector_1__Documents_IBlock = interface;
  PIVector_1__Documents_IBlock = ^IVector_1__Documents_IBlock;

  // External: Microsoft.UI.Xaml.Documents.IBlock
  Documents_IBlock = interface;
  PDocuments_IBlock = ^Documents_IBlock;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.IBlock>
  IVectorView_1__Documents_IBlock = interface;
  PIVectorView_1__Documents_IBlock = ^IVectorView_1__Documents_IBlock;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.ITextHighlighter>
  IVector_1__Documents_ITextHighlighter = interface;
  PIVector_1__Documents_ITextHighlighter = ^IVector_1__Documents_ITextHighlighter;

  // External: Microsoft.UI.Xaml.Documents.ITextHighlighter
  Documents_ITextHighlighter = interface;
  PDocuments_ITextHighlighter = ^Documents_ITextHighlighter;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.TextRange>
  IVector_1__Documents_TextRange = interface;
  PIVector_1__Documents_TextRange = ^IVector_1__Documents_TextRange;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.TextRange>
  IVectorView_1__Documents_TextRange = interface;
  PIVectorView_1__Documents_TextRange = ^IVectorView_1__Documents_TextRange;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.ITextHighlighter>
  IVectorView_1__Documents_ITextHighlighter = interface;
  PIVectorView_1__Documents_ITextHighlighter = ^IVectorView_1__Documents_ITextHighlighter;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IUIElement>
  IVector_1__IUIElement = interface;
  PIVector_1__IUIElement = ^IVector_1__IUIElement;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.IUIElement>
  IVectorView_1__IUIElement = interface;
  PIVectorView_1__IUIElement = ^IVectorView_1__IUIElement;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Object>
  TypedEventHandler_2__ITabView__IInspectable = interface;
  PTypedEventHandler_2__ITabView__IInspectable = ^TypedEventHandler_2__ITabView__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ITabView
  ITabView = interface;
  PITabView = ^ITabView;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs = interface;
  PTypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs = ^TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs
  ITabViewTabCloseRequestedEventArgs = interface;
  PITabViewTabCloseRequestedEventArgs = ^ITabViewTabCloseRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITabViewItem
  ITabViewItem = interface;
  PITabViewItem = ^ITabViewItem;

  // External: Microsoft.UI.Xaml.Controls.ITabViewItemTemplateSettings
  ITabViewItemTemplateSettings = interface;
  PITabViewItemTemplateSettings = ^ITabViewItemTemplateSettings;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabViewItem,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs = interface;
  PTypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs = ^TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDroppedOutsideEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs = interface;
  PTypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs = ^TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITabViewTabDroppedOutsideEventArgs
  ITabViewTabDroppedOutsideEventArgs = interface;
  PITabViewTabDroppedOutsideEventArgs = ^ITabViewTabDroppedOutsideEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Windows.Foundation.Collections.IVectorChangedEventArgs>
  TypedEventHandler_2__ITabView__IVectorChangedEventArgs = interface;
  PTypedEventHandler_2__ITabView__IVectorChangedEventArgs = ^TypedEventHandler_2__ITabView__IVectorChangedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IDataTemplateSelector
  IDataTemplateSelector = interface;
  PIDataTemplateSelector = ^IDataTemplateSelector;

  // External: Microsoft.UI.Xaml.Controls.SelectionChangedEventHandler
  SelectionChangedEventHandler = interface;
  PSelectionChangedEventHandler = ^SelectionChangedEventHandler;

  // External: Microsoft.UI.Xaml.Controls.ISelectionChangedEventArgs
  ISelectionChangedEventArgs = interface;
  PISelectionChangedEventArgs = ^ISelectionChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragStartingEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs = interface;
  PTypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs = ^TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITabViewTabDragStartingEventArgs
  ITabViewTabDragStartingEventArgs = interface;
  PITabViewTabDragStartingEventArgs = ^ITabViewTabDragStartingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragCompletedEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs = interface;
  PTypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs = ^TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITabViewTabDragCompletedEventArgs
  ITabViewTabDragCompletedEventArgs = interface;
  PITabViewTabDragCompletedEventArgs = ^ITabViewTabDragCompletedEventArgs;

  // External: Microsoft.UI.Xaml.IBrushTransition
  IBrushTransition = interface;
  PIBrushTransition = ^IBrushTransition;

  // External: Microsoft.UI.Xaml.DependencyPropertyChangedEventHandler
  DependencyPropertyChangedEventHandler = interface;
  PDependencyPropertyChangedEventHandler = ^DependencyPropertyChangedEventHandler;

  // External: Microsoft.UI.Xaml.IDependencyPropertyChangedEventArgs
  IDependencyPropertyChangedEventArgs = interface;
  PIDependencyPropertyChangedEventArgs = ^IDependencyPropertyChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IDynamicAnimatedVisualSource,Object>
  TypedEventHandler_2__IDynamicAnimatedVisualSource__IInspectable = interface;
  PTypedEventHandler_2__IDynamicAnimatedVisualSource__IInspectable = ^TypedEventHandler_2__IDynamicAnimatedVisualSource__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.IDynamicAnimatedVisualSource
  IDynamicAnimatedVisualSource = interface;
  PIDynamicAnimatedVisualSource = ^IDynamicAnimatedVisualSource;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Navigation.IPageStackEntry>
  IVector_1__Navigation_IPageStackEntry = interface;
  PIVector_1__Navigation_IPageStackEntry = ^IVector_1__Navigation_IPageStackEntry;

  // External: Microsoft.UI.Xaml.Navigation.IPageStackEntry
  Navigation_IPageStackEntry = interface;
  PNavigation_IPageStackEntry = ^Navigation_IPageStackEntry;

  // External: Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfo
  Animation_INavigationTransitionInfo = interface;
  PAnimation_INavigationTransitionInfo = ^Animation_INavigationTransitionInfo;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Navigation.IPageStackEntry>
  IVectorView_1__Navigation_IPageStackEntry = interface;
  PIVectorView_1__Navigation_IPageStackEntry = ^IVectorView_1__Navigation_IPageStackEntry;

  // External: Microsoft.UI.Xaml.Navigation.NavigatedEventHandler
  Navigation_NavigatedEventHandler = interface;
  PNavigation_NavigatedEventHandler = ^Navigation_NavigatedEventHandler;

  // External: Microsoft.UI.Xaml.Navigation.INavigationEventArgs
  Navigation_INavigationEventArgs = interface;
  PNavigation_INavigationEventArgs = ^Navigation_INavigationEventArgs;

  // External: Microsoft.UI.Xaml.Navigation.NavigatingCancelEventHandler
  Navigation_NavigatingCancelEventHandler = interface;
  PNavigation_NavigatingCancelEventHandler = ^Navigation_NavigatingCancelEventHandler;

  // External: Microsoft.UI.Xaml.Navigation.INavigatingCancelEventArgs
  Navigation_INavigatingCancelEventArgs = interface;
  PNavigation_INavigatingCancelEventArgs = ^Navigation_INavigatingCancelEventArgs;

  // External: Microsoft.UI.Xaml.Navigation.NavigationFailedEventHandler
  Navigation_NavigationFailedEventHandler = interface;
  PNavigation_NavigationFailedEventHandler = ^Navigation_NavigationFailedEventHandler;

  // External: Microsoft.UI.Xaml.Navigation.INavigationFailedEventArgs
  Navigation_INavigationFailedEventArgs = interface;
  PNavigation_INavigationFailedEventArgs = ^Navigation_INavigationFailedEventArgs;

  // External: Microsoft.UI.Xaml.Navigation.NavigationStoppedEventHandler
  Navigation_NavigationStoppedEventHandler = interface;
  PNavigation_NavigationStoppedEventHandler = ^Navigation_NavigationStoppedEventHandler;

  // External: Microsoft.UI.Xaml.Navigation.IFrameNavigationOptions
  Navigation_IFrameNavigationOptions = interface;
  PNavigation_IFrameNavigationOptions = ^Navigation_IFrameNavigationOptions;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Object>
  TypedEventHandler_2__INavigationView__IInspectable = interface;
  PTypedEventHandler_2__INavigationView__IInspectable = ^TypedEventHandler_2__INavigationView__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.INavigationView
  INavigationView = interface;
  PINavigationView = ^INavigationView;

  // External: Microsoft.UI.Xaml.Controls.IAutoSuggestBox
  IAutoSuggestBox = interface;
  PIAutoSuggestBox = ^IAutoSuggestBox;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxSuggestionChosenEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs = interface;
  PTypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs = ^TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IAutoSuggestBoxSuggestionChosenEventArgs
  IAutoSuggestBoxSuggestionChosenEventArgs = interface;
  PIAutoSuggestBoxSuggestionChosenEventArgs = ^IAutoSuggestBoxSuggestionChosenEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxTextChangedEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs = interface;
  PTypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs = ^TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IAutoSuggestBoxTextChangedEventArgs
  IAutoSuggestBoxTextChangedEventArgs = interface;
  PIAutoSuggestBoxTextChangedEventArgs = ^IAutoSuggestBoxTextChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxQuerySubmittedEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs = interface;
  PTypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs = ^TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IAutoSuggestBoxQuerySubmittedEventArgs
  IAutoSuggestBoxQuerySubmittedEventArgs = interface;
  PIAutoSuggestBoxQuerySubmittedEventArgs = ^IAutoSuggestBoxQuerySubmittedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IStyleSelector
  IStyleSelector = interface;
  PIStyleSelector = ^IStyleSelector;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewSelectionChangedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs = interface;
  PTypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs = ^TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.INavigationViewSelectionChangedEventArgs
  INavigationViewSelectionChangedEventArgs = interface;
  PINavigationViewSelectionChangedEventArgs = ^INavigationViewSelectionChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewItemInvokedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs = interface;
  PTypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs = ^TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.INavigationViewItemInvokedEventArgs
  INavigationViewItemInvokedEventArgs = interface;
  PINavigationViewItemInvokedEventArgs = ^INavigationViewItemInvokedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewDisplayModeChangedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs = interface;
  PTypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs = ^TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.INavigationViewDisplayModeChangedEventArgs
  INavigationViewDisplayModeChangedEventArgs = interface;
  PINavigationViewDisplayModeChangedEventArgs = ^INavigationViewDisplayModeChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Object>
  TypedEventHandler_2__ISplitView__IInspectable = interface;
  PTypedEventHandler_2__ISplitView__IInspectable = ^TypedEventHandler_2__ISplitView__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ISplitView
  ISplitView = interface;
  PISplitView = ^ISplitView;

  // External: Microsoft.UI.Xaml.Controls.Primitives.ISplitViewTemplateSettings
  Primitives_ISplitViewTemplateSettings = interface;
  PPrimitives_ISplitViewTemplateSettings = ^Primitives_ISplitViewTemplateSettings;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Microsoft.UI.Xaml.Controls.ISplitViewPaneClosingEventArgs>
  TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs = interface;
  PTypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs = ^TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ISplitViewPaneClosingEventArgs
  ISplitViewPaneClosingEventArgs = interface;
  PISplitViewPaneClosingEventArgs = ^ISplitViewPaneClosingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISwapChainPanel,Object>
  TypedEventHandler_2__ISwapChainPanel__IInspectable = interface;
  PTypedEventHandler_2__ISwapChainPanel__IInspectable = ^TypedEventHandler_2__ISwapChainPanel__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ISwapChainPanel
  ISwapChainPanel = interface;
  PISwapChainPanel = ^ISwapChainPanel;

  // External: Microsoft.UI.Input.IInputPointerSource
  IInputPointerSource = interface;
  PIInputPointerSource = ^IInputPointerSource;

  // External: Microsoft.UI.Input.IInputCursor
  IInputCursor = interface;
  PIInputCursor = ^IInputCursor;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Input.IInputPointerSource,Microsoft.UI.Input.IPointerEventArgs>
  TypedEventHandler_2__IInputPointerSource__IPointerEventArgs = interface;
  PTypedEventHandler_2__IInputPointerSource__IPointerEventArgs = ^TypedEventHandler_2__IInputPointerSource__IPointerEventArgs;

  // External: Microsoft.UI.Input.IPointerEventArgs
  IPointerEventArgs = interface;
  PIPointerEventArgs = ^IPointerEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITwoPaneView,Object>
  TypedEventHandler_2__ITwoPaneView__IInspectable = interface;
  PTypedEventHandler_2__ITwoPaneView__IInspectable = ^TypedEventHandler_2__ITwoPaneView__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ITwoPaneView
  ITwoPaneView = interface;
  PITwoPaneView = ^ITwoPaneView;

  // External: Microsoft.UI.Xaml.Interop.INotifyCollectionChangedEventArgs
  Interop_INotifyCollectionChangedEventArgs = interface;
  PInterop_INotifyCollectionChangedEventArgs = ^Interop_INotifyCollectionChangedEventArgs;

  // External: Microsoft.UI.Xaml.Interop.IBindableVector
  Interop_IBindableVector = interface;
  PInterop_IBindableVector = ^Interop_IBindableVector;

  // External: Microsoft.UI.Xaml.Interop.IBindableVectorView
  Interop_IBindableVectorView = interface;
  PInterop_IBindableVectorView = ^Interop_IBindableVectorView;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Object>
  TypedEventHandler_2__ITeachingTip__IInspectable = interface;
  PTypedEventHandler_2__ITeachingTip__IInspectable = ^TypedEventHandler_2__ITeachingTip__IInspectable;

  // External: Microsoft.UI.Xaml.Controls.ITeachingTip
  ITeachingTip = interface;
  PITeachingTip = ^ITeachingTip;

  // External: Microsoft.UI.Xaml.Controls.ITeachingTipTemplateSettings
  ITeachingTipTemplateSettings = interface;
  PITeachingTipTemplateSettings = ^ITeachingTipTemplateSettings;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosingEventArgs>
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs = interface;
  PTypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs = ^TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITeachingTipClosingEventArgs
  ITeachingTipClosingEventArgs = interface;
  PITeachingTipClosingEventArgs = ^ITeachingTipClosingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosedEventArgs>
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs = interface;
  PTypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs = ^TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ITeachingTipClosedEventArgs
  ITeachingTipClosedEventArgs = interface;
  PITeachingTipClosedEventArgs = ^ITeachingTipClosedEventArgs;

  // External: Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IInline>
  IVector_1__Documents_IInline = interface;
  PIVector_1__Documents_IInline = ^IVector_1__Documents_IInline;

  // External: Microsoft.UI.Xaml.Documents.IInline
  Documents_IInline = interface;
  PDocuments_IInline = ^Documents_IInline;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.IInline>
  IVectorView_1__Documents_IInline = interface;
  PIVectorView_1__Documents_IInline = ^IVectorView_1__Documents_IInline;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Animation.IConnectedAnimation,Object>
  TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable = interface;
  PTypedEventHandler_2__Animation_IConnectedAnimation__IInspectable = ^TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable;

  // External: Microsoft.UI.Xaml.Media.Animation.IConnectedAnimation
  Animation_IConnectedAnimation = interface;
  PAnimation_IConnectedAnimation = ^Animation_IConnectedAnimation;

  // External: Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfiguration
  Animation_IConnectedAnimationConfiguration = interface;
  PAnimation_IConnectedAnimationConfiguration = ^Animation_IConnectedAnimationConfiguration;

  // External: Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.IUIElement>
  IIterable_1__IUIElement = interface;
  PIIterable_1__IUIElement = ^IIterable_1__IUIElement;

  // External: Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.IUIElement>
  IIterator_1__IUIElement = interface;
  PIIterator_1__IUIElement = ^IIterator_1__IUIElement;

  // External: Microsoft.UI.Xaml.Controls.IListViewBase
  IListViewBase = interface;
  PIListViewBase = ^IListViewBase;

  // External: Microsoft.UI.Xaml.Controls.ItemClickEventHandler
  ItemClickEventHandler = interface;
  PItemClickEventHandler = ^ItemClickEventHandler;

  // External: Microsoft.UI.Xaml.Controls.IItemClickEventArgs
  IItemClickEventArgs = interface;
  PIItemClickEventArgs = ^IItemClickEventArgs;

  // External: Microsoft.UI.Xaml.Controls.DragItemsStartingEventHandler
  DragItemsStartingEventHandler = interface;
  PDragItemsStartingEventHandler = ^DragItemsStartingEventHandler;

  // External: Microsoft.UI.Xaml.Controls.IDragItemsStartingEventArgs
  IDragItemsStartingEventArgs = interface;
  PIDragItemsStartingEventArgs = ^IDragItemsStartingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IDragItemsCompletedEventArgs>
  TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs = interface;
  PTypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs = ^TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IDragItemsCompletedEventArgs
  IDragItemsCompletedEventArgs = interface;
  PIDragItemsCompletedEventArgs = ^IDragItemsCompletedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IContainerContentChangingEventArgs>
  TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs = interface;
  PTypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs = ^TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IContainerContentChangingEventArgs
  IContainerContentChangingEventArgs = interface;
  PIContainerContentChangingEventArgs = ^IContainerContentChangingEventArgs;

  // External: Microsoft.UI.Xaml.Controls.Primitives.ISelectorItem
  Primitives_ISelectorItem = interface;
  PPrimitives_ISelectorItem = ^Primitives_ISelectorItem;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingItemContainerEventArgs>
  TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs = interface;
  PTypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs = ^TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IChoosingItemContainerEventArgs
  IChoosingItemContainerEventArgs = interface;
  PIChoosingItemContainerEventArgs = ^IChoosingItemContainerEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingGroupHeaderContainerEventArgs>
  TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs = interface;
  PTypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs = ^TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IChoosingGroupHeaderContainerEventArgs
  IChoosingGroupHeaderContainerEventArgs = interface;
  PIChoosingGroupHeaderContainerEventArgs = ^IChoosingGroupHeaderContainerEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IListViewBaseHeaderItem
  IListViewBaseHeaderItem = interface;
  PIListViewBaseHeaderItem = ^IListViewBaseHeaderItem;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Controls.Primitives.IPopup>
  IVectorView_1__Primitives_IPopup = interface;
  PIVectorView_1__Primitives_IPopup = ^IVectorView_1__Primitives_IPopup;

  // External: Microsoft.UI.Xaml.Controls.Primitives.IPopup
  Primitives_IPopup = interface;
  PPrimitives_IPopup = ^Primitives_IPopup;

  // External: Microsoft.UI.Xaml.IWindow
  IWindow = interface;
  PIWindow = ^IWindow;

  // External: Microsoft.UI.Composition.ICompositor
  ICompositor = interface;
  PICompositor = ^ICompositor;

  // External: Microsoft.UI.Composition.IColorKeyFrameAnimation
  IColorKeyFrameAnimation = interface;
  PIColorKeyFrameAnimation = ^IColorKeyFrameAnimation;

  // External: Microsoft.UI.Composition.ICompositionEasingFunction
  ICompositionEasingFunction = interface;
  PICompositionEasingFunction = ^ICompositionEasingFunction;

  // External: Microsoft.UI.Composition.ICompositionColorBrush
  ICompositionColorBrush = interface;
  PICompositionColorBrush = ^ICompositionColorBrush;

  // External: Microsoft.UI.Composition.IContainerVisual
  IContainerVisual = interface;
  PIContainerVisual = ^IContainerVisual;

  // External: Microsoft.UI.Composition.IVisualCollection
  IVisualCollection = interface;
  PIVisualCollection = ^IVisualCollection;

  // External: Microsoft.UI.Composition.IVisual
  IVisual = interface;
  PIVisual = ^IVisual;

  // External: Microsoft.UI.Composition.ICompositionClip
  ICompositionClip = interface;
  PICompositionClip = ^ICompositionClip;

  // External: Microsoft.UI.Composition.ICubicBezierEasingFunction
  ICubicBezierEasingFunction = interface;
  PICubicBezierEasingFunction = ^ICubicBezierEasingFunction;

  // External: Microsoft.UI.Composition.ICompositionEffectFactory
  ICompositionEffectFactory = interface;
  PICompositionEffectFactory = ^ICompositionEffectFactory;

  // External: Microsoft.UI.Composition.ICompositionEffectBrush
  ICompositionEffectBrush = interface;
  PICompositionEffectBrush = ^ICompositionEffectBrush;

  // External: Microsoft.UI.Composition.ICompositionBrush
  ICompositionBrush = interface;
  PICompositionBrush = ^ICompositionBrush;

  // External: Microsoft.UI.Composition.IExpressionAnimation
  IExpressionAnimation = interface;
  PIExpressionAnimation = ^IExpressionAnimation;

  // External: Microsoft.UI.Composition.IInsetClip
  IInsetClip = interface;
  PIInsetClip = ^IInsetClip;

  // External: Microsoft.UI.Composition.ILinearEasingFunction
  ILinearEasingFunction = interface;
  PILinearEasingFunction = ^ILinearEasingFunction;

  // External: Microsoft.UI.Composition.ICompositionPropertySet
  ICompositionPropertySet = interface;
  PICompositionPropertySet = ^ICompositionPropertySet;

  // External: Microsoft.UI.Composition.IQuaternionKeyFrameAnimation
  IQuaternionKeyFrameAnimation = interface;
  PIQuaternionKeyFrameAnimation = ^IQuaternionKeyFrameAnimation;

  // External: Microsoft.UI.Composition.IScalarKeyFrameAnimation
  IScalarKeyFrameAnimation = interface;
  PIScalarKeyFrameAnimation = ^IScalarKeyFrameAnimation;

  // External: Microsoft.UI.Composition.ICompositionScopedBatch
  ICompositionScopedBatch = interface;
  PICompositionScopedBatch = ^ICompositionScopedBatch;

  // External: Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Composition.ICompositionBatchCompletedEventArgs>
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = ^TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs;

  // External: Microsoft.UI.Composition.ICompositionBatchCompletedEventArgs
  ICompositionBatchCompletedEventArgs = interface;
  PICompositionBatchCompletedEventArgs = ^ICompositionBatchCompletedEventArgs;

  // External: Microsoft.UI.Composition.ISpriteVisual
  ISpriteVisual = interface;
  PISpriteVisual = ^ISpriteVisual;

  // External: Microsoft.UI.Composition.ICompositionSurfaceBrush
  ICompositionSurfaceBrush = interface;
  PICompositionSurfaceBrush = ^ICompositionSurfaceBrush;

  // External: Microsoft.UI.Composition.ICompositionSurface
  ICompositionSurface = interface;
  PICompositionSurface = ^ICompositionSurface;

  // External: Microsoft.UI.Composition.IVector2KeyFrameAnimation
  IVector2KeyFrameAnimation = interface;
  PIVector2KeyFrameAnimation = ^IVector2KeyFrameAnimation;

  // External: Microsoft.UI.Composition.IVector3KeyFrameAnimation
  IVector3KeyFrameAnimation = interface;
  PIVector3KeyFrameAnimation = ^IVector3KeyFrameAnimation;

  // External: Microsoft.UI.Composition.IVector4KeyFrameAnimation
  IVector4KeyFrameAnimation = interface;
  PIVector4KeyFrameAnimation = ^IVector4KeyFrameAnimation;

  // External: Microsoft.UI.Composition.ICompositionCommitBatch
  ICompositionCommitBatch = interface;
  PICompositionCommitBatch = ^ICompositionCommitBatch;

  // External: Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowActivatedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IWindowActivatedEventArgs = ^TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs;

  // External: Microsoft.UI.Xaml.IWindowActivatedEventArgs
  IWindowActivatedEventArgs = interface;
  PIWindowActivatedEventArgs = ^IWindowActivatedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowEventArgs>
  TypedEventHandler_2__IInspectable__IWindowEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IWindowEventArgs = ^TypedEventHandler_2__IInspectable__IWindowEventArgs;

  // External: Microsoft.UI.Xaml.IWindowEventArgs
  IWindowEventArgs = interface;
  PIWindowEventArgs = ^IWindowEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowSizeChangedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs = ^TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs;

  // External: Microsoft.UI.Xaml.IWindowSizeChangedEventArgs
  IWindowSizeChangedEventArgs = interface;
  PIWindowSizeChangedEventArgs = ^IWindowSizeChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowVisibilityChangedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs = ^TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs;

  // External: Microsoft.UI.Xaml.IWindowVisibilityChangedEventArgs
  IWindowVisibilityChangedEventArgs = interface;
  PIWindowVisibilityChangedEventArgs = ^IWindowVisibilityChangedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IMediaTransportControls
  IMediaTransportControls = interface;
  PIMediaTransportControls = ^IMediaTransportControls;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IMediaTransportControls,Microsoft.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs>
  TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs = interface;
  PTypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs = ^TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs
  IMediaTransportControlsThumbnailRequestedEventArgs = interface;
  PIMediaTransportControlsThumbnailRequestedEventArgs = ^IMediaTransportControlsThumbnailRequestedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.IWebView2
  IWebView2 = interface;
  PIWebView2 = ^IWebView2;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial
  ICoreWebView2PrivatePartial = interface;
  PICoreWebView2PrivatePartial = ^ICoreWebView2PrivatePartial;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2 = interface;
  PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2 = ^TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2
  ICoreWebView2NavigationCompletedEventArgs2 = interface;
  PICoreWebView2NavigationCompletedEventArgs2 = ^ICoreWebView2NavigationCompletedEventArgs2;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs = interface;
  PTypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs = ^TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs
  ICoreWebView2WebMessageReceivedEventArgs = interface;
  PICoreWebView2WebMessageReceivedEventArgs = ^ICoreWebView2WebMessageReceivedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2 = interface;
  PTypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2 = ^TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2
  ICoreWebView2NavigationStartingEventArgs2 = interface;
  PICoreWebView2NavigationStartingEventArgs2 = ^ICoreWebView2NavigationStartingEventArgs2;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2 = interface;
  PTypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2 = ^TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2
  ICoreWebView2ProcessFailedEventArgs2 = interface;
  PICoreWebView2ProcessFailedEventArgs2 = ^ICoreWebView2ProcessFailedEventArgs2;

  // External: Windows.Foundation.Collections.IVectorView`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  IVectorView_1__ICoreWebView2FrameInfo = interface;
  PIVectorView_1__ICoreWebView2FrameInfo = ^IVectorView_1__ICoreWebView2FrameInfo;

  // External: Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo
  ICoreWebView2FrameInfo = interface;
  PICoreWebView2FrameInfo = ^ICoreWebView2FrameInfo;

  // External: Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.UI.Xaml.Controls.ICoreWebView2InitializedEventArgs>
  TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs = interface;
  PTypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs = ^TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs;

  // External: Microsoft.UI.Xaml.Controls.ICoreWebView2InitializedEventArgs
  ICoreWebView2InitializedEventArgs = interface;
  PICoreWebView2InitializedEventArgs = ^ICoreWebView2InitializedEventArgs;

  // Microsoft.Web.WebView2.Core.CoreWebView2ProcessFailedReason
  CoreWebView2ProcessFailedReason = (
    Unexpected = 0,
    Unresponsive = 1,
    Terminated = 2,
    Crashed = 3,
    LaunchFailed = 4,
    OutOfMemory = 5,
    ProfileDeleted = 6
  );
  PCoreWebView2ProcessFailedReason = ^CoreWebView2ProcessFailedReason;

  // Microsoft.UI.Xaml.Media.FastPlayFallbackBehaviour
  FastPlayFallbackBehaviour = (
    Skip = 0,
    Hide = 1,
    Disable = 2
  );
  PFastPlayFallbackBehaviour = ^FastPlayFallbackBehaviour;

  // Microsoft.UI.Xaml.WindowActivationState
  WindowActivationState = (
    CodeActivated = 0,
    Deactivated = 1,
    PointerActivated = 2
  );
  PWindowActivationState = ^WindowActivationState;

  // Microsoft.UI.Composition.CompositionStretch
  CompositionStretch = (
    None = 0,
    Fill = 1,
    Uniform = 2,
    UniformToFill = 3
  );
  PCompositionStretch = ^CompositionStretch;

  // Microsoft.UI.Composition.CompositionBitmapInterpolationMode
  CompositionBitmapInterpolationMode = (
    NearestNeighbor = 0,
    Linear = 1,
    MagLinearMinLinearMipLinear = 2,
    MagLinearMinLinearMipNearest = 3,
    MagLinearMinNearestMipLinear = 4,
    MagLinearMinNearestMipNearest = 5,
    MagNearestMinLinearMipLinear = 6,
    MagNearestMinLinearMipNearest = 7,
    MagNearestMinNearestMipLinear = 8,
    MagNearestMinNearestMipNearest = 9
  );
  PCompositionBitmapInterpolationMode = ^CompositionBitmapInterpolationMode;

  // Microsoft.UI.Composition.CompositionBatchTypes
  CompositionBatchTypes = (
    None = 0,
    Animation = 1,
    Effect = 2,
    InfiniteAnimation = 4,
    AllAnimations = 5
  );
  PCompositionBatchTypes = ^CompositionBatchTypes;

  // Microsoft.UI.Composition.CompositionGetValueStatus
  CompositionGetValueStatus = (
    Succeeded = 0,
    TypeMismatch = 1,
    NotFound = 2
  );
  PCompositionGetValueStatus = ^CompositionGetValueStatus;

  // Microsoft.UI.Composition.CompositionEffectFactoryLoadStatus
  CompositionEffectFactoryLoadStatus = (
    Success = 0,
    EffectTooComplex = 1,
    Pending = 2,
    Other = -1
  );
  PCompositionEffectFactoryLoadStatus = ^CompositionEffectFactoryLoadStatus;

  // Microsoft.UI.Composition.CompositionCompositeMode
  CompositionCompositeMode = (
    Inherit = 0,
    SourceOver = 1,
    DestinationInvert = 2,
    MinBlend = 3
  );
  PCompositionCompositeMode = ^CompositionCompositeMode;

  // Microsoft.UI.Composition.CompositionBorderMode
  CompositionBorderMode = (
    Inherit = 0,
    Soft = 1,
    Hard = 2
  );
  PCompositionBorderMode = ^CompositionBorderMode;

  // Microsoft.UI.Composition.CompositionBackfaceVisibility
  CompositionBackfaceVisibility = (
    Inherit = 0,
    Visible = 1,
    Hidden = 2
  );
  PCompositionBackfaceVisibility = ^CompositionBackfaceVisibility;

  // Microsoft.UI.Composition.CompositionColorSpace
  CompositionColorSpace = (
    Auto = 0,
    Hsl = 1,
    Rgb = 2,
    HslLinear = 3,
    RgbLinear = 4
  );
  PCompositionColorSpace = ^CompositionColorSpace;

  // Microsoft.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
  Primitives_EdgeTransitionLocation = (
    Left = 0,
    Top = 1,
    Right = 2,
    Bottom = 3
  );
  PPrimitives_EdgeTransitionLocation = ^Primitives_EdgeTransitionLocation;

  // Microsoft.UI.Xaml.Controls.Primitives.AnimationDirection
  Primitives_AnimationDirection = (
    Left = 0,
    Top = 1,
    Right = 2,
    Bottom = 3
  );
  PPrimitives_AnimationDirection = ^Primitives_AnimationDirection;

  // Microsoft.UI.Xaml.Controls.ScrollIntoViewAlignment
  ScrollIntoViewAlignment = (
    Default = 0,
    Leading = 1
  );
  PScrollIntoViewAlignment = ^ScrollIntoViewAlignment;

  // Microsoft.UI.Xaml.Controls.ListViewReorderMode
  ListViewReorderMode = (
    Disabled = 0,
    Enabled = 1
  );
  PListViewReorderMode = ^ListViewReorderMode;

  // Microsoft.UI.Xaml.Controls.IncrementalLoadingTrigger
  IncrementalLoadingTrigger = (
    None = 0,
    Edge = 1
  );
  PIncrementalLoadingTrigger = ^IncrementalLoadingTrigger;

  // Microsoft.UI.Xaml.Controls.ListViewSelectionMode
  ListViewSelectionMode = (
    None = 0,
    Single = 1,
    Multiple = 2,
    Extended = 3
  );
  PListViewSelectionMode = ^ListViewSelectionMode;

  // Microsoft.UI.Xaml.DurationType
  DurationType = (
    Automatic = 0,
    TimeSpan = 1,
    Forever = 2
  );
  PDurationType = ^DurationType;

  // Microsoft.UI.Xaml.Media.Animation.ConnectedAnimationComponent
  Animation_ConnectedAnimationComponent = (
    OffsetX = 0,
    OffsetY = 1,
    CrossFade = 2,
    Scale = 3
  );
  PAnimation_ConnectedAnimationComponent = ^Animation_ConnectedAnimationComponent;

  // Microsoft.UI.Xaml.Controls.TeachingTipCloseReason
  TeachingTipCloseReason = (
    CloseButton = 0,
    LightDismiss = 1,
    Programmatic = 2
  );
  PTeachingTipCloseReason = ^TeachingTipCloseReason;

  // Microsoft.UI.Xaml.Controls.TeachingTipHeroContentPlacementMode
  TeachingTipHeroContentPlacementMode = (
    Auto = 0,
    Top = 1,
    Bottom = 2
  );
  PTeachingTipHeroContentPlacementMode = ^TeachingTipHeroContentPlacementMode;

  // Microsoft.UI.Xaml.Controls.TeachingTipPlacementMode
  TeachingTipPlacementMode = (
    Auto = 0,
    Top = 1,
    Bottom = 2,
    Left = 3,
    Right = 4,
    TopRight = 5,
    TopLeft = 6,
    BottomRight = 7,
    BottomLeft = 8,
    LeftTop = 9,
    LeftBottom = 10,
    RightTop = 11,
    RightBottom = 12,
    Center = 13
  );
  PTeachingTipPlacementMode = ^TeachingTipPlacementMode;

  // Microsoft.UI.Xaml.Controls.TeachingTipTailVisibility
  TeachingTipTailVisibility = (
    Auto = 0,
    Visible = 1,
    Collapsed = 2
  );
  PTeachingTipTailVisibility = ^TeachingTipTailVisibility;

  // Microsoft.UI.Xaml.Automation.Peers.AutomationControlType
  Automation_Peers_AutomationControlType = (
    Button = 0,
    Calendar = 1,
    CheckBox = 2,
    ComboBox = 3,
    Edit = 4,
    Hyperlink = 5,
    Image = 6,
    ListItem = 7,
    List = 8,
    Menu = 9,
    MenuBar = 10,
    MenuItem = 11,
    ProgressBar = 12,
    RadioButton = 13,
    ScrollBar = 14,
    Slider = 15,
    Spinner = 16,
    StatusBar = 17,
    Tab = 18,
    TabItem = 19,
    Text = 20,
    ToolBar = 21,
    ToolTip = 22,
    Tree = 23,
    TreeItem = 24,
    Custom = 25,
    Group = 26,
    Thumb = 27,
    DataGrid = 28,
    DataItem = 29,
    Document = 30,
    SplitButton = 31,
    Window = 32,
    Pane = 33,
    Header = 34,
    HeaderItem = 35,
    Table = 36,
    TitleBar = 37,
    Separator = 38,
    SemanticZoom = 39,
    AppBar = 40,
    FlipView = 41
  );
  PAutomation_Peers_AutomationControlType = ^Automation_Peers_AutomationControlType;

  // Microsoft.UI.Xaml.Interop.NotifyCollectionChangedAction
  Interop_NotifyCollectionChangedAction = (
    Add = 0,
    Remove = 1,
    Replace = 2,
    Move = 3,
    Reset = 4
  );
  PInterop_NotifyCollectionChangedAction = ^Interop_NotifyCollectionChangedAction;

  // Microsoft.UI.Xaml.Controls.TwoPaneViewTallModeConfiguration
  TwoPaneViewTallModeConfiguration = (
    SinglePane = 0,
    TopBottom = 1,
    BottomTop = 2
  );
  PTwoPaneViewTallModeConfiguration = ^TwoPaneViewTallModeConfiguration;

  // Microsoft.UI.Xaml.Controls.TwoPaneViewWideModeConfiguration
  TwoPaneViewWideModeConfiguration = (
    SinglePane = 0,
    LeftRight = 1,
    RightLeft = 2
  );
  PTwoPaneViewWideModeConfiguration = ^TwoPaneViewWideModeConfiguration;

  // Microsoft.UI.Xaml.Controls.TwoPaneViewMode
  TwoPaneViewMode = (
    SinglePane = 0,
    Wide = 1,
    Tall = 2
  );
  PTwoPaneViewMode = ^TwoPaneViewMode;

  // Microsoft.UI.Xaml.Controls.TwoPaneViewPriority
  TwoPaneViewPriority = (
    Pane1 = 0,
    Pane2 = 1
  );
  PTwoPaneViewPriority = ^TwoPaneViewPriority;

  // Microsoft.UI.Input.InputPointerSourceDeviceKinds
  InputPointerSourceDeviceKinds = (
    None = 0,
    Touch = 1,
    Pen = 2,
    Mouse = 4
  );
  PInputPointerSourceDeviceKinds = ^InputPointerSourceDeviceKinds;

  // Microsoft.UI.Xaml.Controls.SplitViewDisplayMode
  SplitViewDisplayMode = (
    Overlay = 0,
    &Inline = 1,
    CompactOverlay = 2,
    CompactInline = 3
  );
  PSplitViewDisplayMode = ^SplitViewDisplayMode;

  // Microsoft.UI.Xaml.Controls.SplitViewPanePlacement
  SplitViewPanePlacement = (
    Left = 0,
    Right = 1
  );
  PSplitViewPanePlacement = ^SplitViewPanePlacement;

  // Microsoft.UI.Xaml.Navigation.NavigationCacheMode
  Navigation_NavigationCacheMode = (
    Disabled = 0,
    Required = 1,
    Enabled = 2
  );
  PNavigation_NavigationCacheMode = ^Navigation_NavigationCacheMode;

  // Microsoft.UI.Xaml.Controls.AutoSuggestionBoxTextChangeReason
  AutoSuggestionBoxTextChangeReason = (
    UserInput = 0,
    ProgrammaticChange = 1,
    SuggestionChosen = 2
  );
  PAutoSuggestionBoxTextChangeReason = ^AutoSuggestionBoxTextChangeReason;

  // Microsoft.UI.Xaml.Controls.NavigationViewDisplayMode
  NavigationViewDisplayMode = (
    Minimal = 0,
    Compact = 1,
    Expanded = 2
  );
  PNavigationViewDisplayMode = ^NavigationViewDisplayMode;

  // Microsoft.UI.Xaml.Navigation.NavigationMode
  Navigation_NavigationMode = (
    New = 0,
    Back = 1,
    Forward = 2,
    Refresh = 3
  );
  PNavigation_NavigationMode = ^Navigation_NavigationMode;

  // Microsoft.UI.Xaml.GridUnitType
  GridUnitType = (
    Auto = 0,
    Pixel = 1,
    Star = 2
  );
  PGridUnitType = ^GridUnitType;

  // Microsoft.UI.Xaml.Controls.TabViewCloseButtonOverlayMode
  TabViewCloseButtonOverlayMode = (
    Auto = 0,
    OnPointerOver = 1,
    Always = 2
  );
  PTabViewCloseButtonOverlayMode = ^TabViewCloseButtonOverlayMode;

  // Microsoft.UI.Xaml.Controls.TabViewWidthMode
  TabViewWidthMode = (
    Equal = 0,
    SizeToContent = 1,
    Compact = 2
  );
  PTabViewWidthMode = ^TabViewWidthMode;

  // Microsoft.UI.Xaml.OpticalMarginAlignment
  OpticalMarginAlignment = (
    None = 0,
    TrimSideBearings = 1
  );
  POpticalMarginAlignment = ^OpticalMarginAlignment;

  // Microsoft.UI.Xaml.TextLineBounds
  TextLineBounds = (
    Full = 0,
    TrimToCapHeight = 1,
    TrimToBaseline = 2,
    Tight = 3
  );
  PTextLineBounds = ^TextLineBounds;

  // Microsoft.UI.Xaml.LineStackingStrategy
  LineStackingStrategy = (
    MaxHeight = 0,
    BlockLineHeight = 1,
    BaselineToBaseline = 2
  );
  PLineStackingStrategy = ^LineStackingStrategy;

  // Microsoft.UI.Xaml.TextTrimming
  TextTrimming = (
    None = 0,
    CharacterEllipsis = 1,
    WordEllipsis = 2,
    Clip = 3
  );
  PTextTrimming = ^TextTrimming;

  // Microsoft.UI.Xaml.Documents.LogicalDirection
  Documents_LogicalDirection = (
    Backward = 0,
    Forward = 1
  );
  PDocuments_LogicalDirection = ^Documents_LogicalDirection;

  // Microsoft.UI.Xaml.TextWrapping
  TextWrapping = (
    NoWrap = 1,
    Wrap = 2,
    WrapWholeWords = 3
  );
  PTextWrapping = ^TextWrapping;

  // Microsoft.UI.Xaml.TextAlignment
  TextAlignment = (
    Center = 0,
    Left = 1,
    Start = 1,
    Right = 2,
    &End = 2,
    Justify = 3,
    DetectFromContent = 4
  );
  PTextAlignment = ^TextAlignment;

  // Microsoft.UI.Xaml.Input.InputScopeNameValue
  Input_InputScopeNameValue = (
    Default = 0,
    Url = 1,
    EmailSmtpAddress = 5,
    PersonalFullName = 7,
    CurrencyAmountAndSymbol = 20,
    CurrencyAmount = 21,
    DateMonthNumber = 23,
    DateDayNumber = 24,
    DateYear = 25,
    Digits = 28,
    Number = 29,
    Password = 31,
    TelephoneNumber = 32,
    TelephoneCountryCode = 33,
    TelephoneAreaCode = 34,
    TelephoneLocalNumber = 35,
    TimeHour = 37,
    TimeMinutesOrSeconds = 38,
    NumberFullWidth = 39,
    AlphanumericHalfWidth = 40,
    AlphanumericFullWidth = 41,
    Hiragana = 44,
    KatakanaHalfWidth = 45,
    KatakanaFullWidth = 46,
    Hanja = 47,
    HangulHalfWidth = 48,
    HangulFullWidth = 49,
    Search = 50,
    Formula = 51,
    SearchIncremental = 52,
    ChineseHalfWidth = 53,
    ChineseFullWidth = 54,
    NativeScript = 55,
    Text = 57,
    Chat = 58,
    NameOrPhoneNumber = 59,
    EmailNameOrAddress = 60,
    Maps = 62,
    NumericPassword = 63,
    NumericPin = 64,
    AlphanumericPin = 65,
    FormulaNumber = 67,
    ChatWithoutEmoji = 68
  );
  PInput_InputScopeNameValue = ^Input_InputScopeNameValue;

  // Microsoft.UI.Xaml.TextReadingOrder
  TextReadingOrder = (
    Default = 0,
    UseFlowDirection = 0,
    DetectFromContent = 1
  );
  PTextReadingOrder = ^TextReadingOrder;

  // Microsoft.UI.Xaml.Controls.InfoBarCloseReason
  InfoBarCloseReason = (
    CloseButton = 0,
    Programmatic = 1
  );
  PInfoBarCloseReason = ^InfoBarCloseReason;

  // Microsoft.UI.Xaml.Controls.ClickMode
  ClickMode = (
    Release = 0,
    Press = 1,
    Hover = 2
  );
  PClickMode = ^ClickMode;

  // Microsoft.UI.Xaml.Controls.InfoBarSeverity
  InfoBarSeverity = (
    Informational = 0,
    Success = 1,
    Warning = 2,
    Error = 3
  );
  PInfoBarSeverity = ^InfoBarSeverity;

  // Microsoft.UI.Xaml.Input.FocusInputDeviceKind
  Input_FocusInputDeviceKind = (
    None = 0,
    Mouse = 1,
    Touch = 2,
    Pen = 3,
    Keyboard = 4,
    GameController = 5
  );
  PInput_FocusInputDeviceKind = ^Input_FocusInputDeviceKind;

  // Microsoft.UI.Xaml.Input.FocusNavigationDirection
  Input_FocusNavigationDirection = (
    Next = 0,
    Previous = 1,
    Up = 2,
    Down = 3,
    Left = 4,
    Right = 5,
    None = 6
  );
  PInput_FocusNavigationDirection = ^Input_FocusNavigationDirection;

  // Microsoft.UI.Input.HoldingState
  HoldingState = (
    Started = 0,
    Completed = 1,
    Canceled = 2
  );
  PHoldingState = ^HoldingState;

  // Microsoft.UI.Input.PointerUpdateKind
  PointerUpdateKind = (
    Other = 0,
    LeftButtonPressed = 1,
    LeftButtonReleased = 2,
    RightButtonPressed = 3,
    RightButtonReleased = 4,
    MiddleButtonPressed = 5,
    MiddleButtonReleased = 6,
    XButton1Pressed = 7,
    XButton1Released = 8,
    XButton2Pressed = 9,
    XButton2Released = 10
  );
  PPointerUpdateKind = ^PointerUpdateKind;

  // Microsoft.UI.Xaml.Media.Imaging.DecodePixelType
  Imaging_DecodePixelType = (
    Physical = 0,
    Logical = 1
  );
  PImaging_DecodePixelType = ^Imaging_DecodePixelType;

  // Microsoft.UI.Xaml.Media.Imaging.BitmapCreateOptions
  Imaging_BitmapCreateOptions = (
    None = 0,
    IgnoreImageCache = 8
  );
  PImaging_BitmapCreateOptions = ^Imaging_BitmapCreateOptions;

  // Microsoft.UI.Xaml.FocusState
  FocusState = (
    Unfocused = 0,
    Pointer = 1,
    Keyboard = 2,
    Programmatic = 3
  );
  PFocusState = ^FocusState;

  // Microsoft.UI.Xaml.Vector3TransitionComponents
  Vector3TransitionComponents = (
    X = 1,
    Y = 2,
    Z = 4
  );
  PVector3TransitionComponents = ^Vector3TransitionComponents;

  // Microsoft.UI.Xaml.Input.KeyboardNavigationMode
  Input_KeyboardNavigationMode = (
    Local = 0,
    Cycle = 1,
    Once = 2
  );
  PInput_KeyboardNavigationMode = ^Input_KeyboardNavigationMode;

  // Microsoft.UI.Xaml.ElementHighContrastAdjustment
  ElementHighContrastAdjustment = (
    None = 0,
    Application = -2147483648,
    Auto = -1
  );
  PElementHighContrastAdjustment = ^ElementHighContrastAdjustment;

  // Microsoft.UI.Xaml.Input.KeyboardAcceleratorPlacementMode
  Input_KeyboardAcceleratorPlacementMode = (
    Auto = 0,
    Hidden = 1
  );
  PInput_KeyboardAcceleratorPlacementMode = ^Input_KeyboardAcceleratorPlacementMode;

  // Microsoft.UI.Xaml.Input.XYFocusNavigationStrategy
  Input_XYFocusNavigationStrategy = (
    Auto = 0,
    Projection = 1,
    NavigationDirectionDistance = 2,
    RectilinearDistance = 3
  );
  PInput_XYFocusNavigationStrategy = ^Input_XYFocusNavigationStrategy;

  // Microsoft.UI.Xaml.Input.XYFocusKeyboardNavigationMode
  Input_XYFocusKeyboardNavigationMode = (
    Auto = 0,
    Enabled = 1,
    Disabled = 2
  );
  PInput_XYFocusKeyboardNavigationMode = ^Input_XYFocusKeyboardNavigationMode;

  // Microsoft.UI.Xaml.Input.KeyTipPlacementMode
  Input_KeyTipPlacementMode = (
    Auto = 0,
    Bottom = 1,
    Top = 2,
    Left = 3,
    Right = 4,
    Center = 5,
    Hidden = 6
  );
  PInput_KeyTipPlacementMode = ^Input_KeyTipPlacementMode;

  // Microsoft.UI.Xaml.Media.ElementCompositeMode
  ElementCompositeMode = (
    Inherit = 0,
    SourceOver = 1,
    MinBlend = 2
  );
  PElementCompositeMode = ^ElementCompositeMode;

  // Microsoft.UI.Xaml.Controls.Primitives.FlyoutShowMode
  Primitives_FlyoutShowMode = (
    Auto = 0,
    Standard = 1,
    Transient = 2,
    TransientWithDismissOnPointerMoveAway = 3
  );
  PPrimitives_FlyoutShowMode = ^Primitives_FlyoutShowMode;

  // Microsoft.UI.Xaml.Controls.LightDismissOverlayMode
  LightDismissOverlayMode = (
    Auto = 0,
    &On = 1,
    Off = 2
  );
  PLightDismissOverlayMode = ^LightDismissOverlayMode;

  // Microsoft.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
  Primitives_FlyoutPlacementMode = (
    Top = 0,
    Bottom = 1,
    Left = 2,
    Right = 3,
    Full = 4,
    TopEdgeAlignedLeft = 5,
    TopEdgeAlignedRight = 6,
    BottomEdgeAlignedLeft = 7,
    BottomEdgeAlignedRight = 8,
    LeftEdgeAlignedTop = 9,
    LeftEdgeAlignedBottom = 10,
    RightEdgeAlignedTop = 11,
    RightEdgeAlignedBottom = 12,
    Auto = 13
  );
  PPrimitives_FlyoutPlacementMode = ^Primitives_FlyoutPlacementMode;

  // Microsoft.UI.Input.PointerDeviceType
  PointerDeviceType = (
    Touch = 0,
    Pen = 1,
    Mouse = 2,
    Touchpad = 3
  );
  PPointerDeviceType = ^PointerDeviceType;

  // Microsoft.UI.Xaml.Input.ManipulationModes
  Input_ManipulationModes = (
    None = 0,
    TranslateX = 1,
    TranslateY = 2,
    TranslateRailsX = 4,
    TranslateRailsY = 8,
    Rotate = 16,
    Scale = 32,
    TranslateInertia = 64,
    RotateInertia = 128,
    ScaleInertia = 256,
    All = 65535,
    System = 65536
  );
  PInput_ManipulationModes = ^Input_ManipulationModes;

  // Microsoft.UI.Xaml.Visibility
  Visibility = (
    Visible = 0,
    Collapsed = 1
  );
  PVisibility = ^Visibility;

  // Microsoft.UI.Xaml.ElementSoundMode
  ElementSoundMode = (
    Default = 0,
    FocusOnly = 1,
    Off = 2
  );
  PElementSoundMode = ^ElementSoundMode;

  // Microsoft.UI.Xaml.Data.UpdateSourceTrigger
  Data_UpdateSourceTrigger = (
    Default = 0,
    PropertyChanged = 1,
    Explicit = 2,
    LostFocus = 3
  );
  PData_UpdateSourceTrigger = ^Data_UpdateSourceTrigger;

  // Microsoft.UI.Xaml.Data.RelativeSourceMode
  Data_RelativeSourceMode = (
    None = 0,
    TemplatedParent = 1,
    Self = 2
  );
  PData_RelativeSourceMode = ^Data_RelativeSourceMode;

  // Microsoft.UI.Xaml.Data.BindingMode
  Data_BindingMode = (
    OneWay = 1,
    OneTime = 2,
    TwoWay = 3
  );
  PData_BindingMode = ^Data_BindingMode;

  // Microsoft.UI.Xaml.ElementTheme
  ElementTheme = (
    Default = 0,
    Light = 1,
    Dark = 2
  );
  PElementTheme = ^ElementTheme;

  // Microsoft.UI.Xaml.FlowDirection
  FlowDirection = (
    LeftToRight = 0,
    RightToLeft = 1
  );
  PFlowDirection = ^FlowDirection;

  // Microsoft.UI.Xaml.VerticalAlignment
  VerticalAlignment = (
    Top = 0,
    Center = 1,
    Bottom = 2,
    Stretch = 3
  );
  PVerticalAlignment = ^VerticalAlignment;

  // Microsoft.UI.Xaml.HorizontalAlignment
  HorizontalAlignment = (
    Left = 0,
    Center = 1,
    Right = 2,
    Stretch = 3
  );
  PHorizontalAlignment = ^HorizontalAlignment;

  // Microsoft.UI.Dispatching.DispatcherQueuePriority
  DispatcherQueuePriority = (
    Low = -10,
    Normal = 0,
    High = 10
  );
  PDispatcherQueuePriority = ^DispatcherQueuePriority;

  //  Records

  // Microsoft.UI.Xaml.Duration
  Duration = record
    TimeSpan: TimeSpan;
    &Type: DurationType;
  end;
  PDuration = ^Duration;

  // Microsoft.UI.Xaml.GridLength
  GridLength = record
    Value: Double;
    GridUnitType: GridUnitType;
  end;
  PGridLength = ^GridLength;

  // Microsoft.UI.Xaml.Documents.TextRange
  Documents_TextRange = record
    StartIndex: Integer;
    Length: Integer;
  end;
  PDocuments_TextRange = ^Documents_TextRange;

  // Microsoft.UI.Xaml.Data.LoadMoreItemsResult
  Data_LoadMoreItemsResult = record
    Count: Cardinal;
  end;
  PData_LoadMoreItemsResult = ^Data_LoadMoreItemsResult;

  // Microsoft.UI.Xaml.CornerRadius
  CornerRadius = record
    TopLeft: Double;
    TopRight: Double;
    BottomRight: Double;
    BottomLeft: Double;
  end;
  PCornerRadius = ^CornerRadius;

  // Microsoft.UI.Input.ManipulationVelocities
  ManipulationVelocities = record
    Linear: TPointF;
    Angular: Single;
    Expansion: Single;
  end;
  PManipulationVelocities = ^ManipulationVelocities;

  // Microsoft.UI.Input.ManipulationDelta
  ManipulationDelta = record
    Translation: TPointF;
    Scale: Single;
    Rotation: Single;
    Expansion: Single;
  end;
  PManipulationDelta = ^ManipulationDelta;

  // Microsoft.UI.Xaml.Thickness
  Thickness = record
    Left: Double;
    Top: Double;
    Right: Double;
    Bottom: Double;
  end;
  PThickness = ^Thickness;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{2182A2AC-7545-566A-984F-B10F07BAB089}']
    procedure Invoke(sender: IDispatcherQueueTimer; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueueTimer,Object>
  // External
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface(TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base)
  ['{89F8745E-47AC-55BC-A839-176C9F33B0B3}']
  end;

  // Microsoft.UI.Dispatching.IDispatcherQueueTimer
  // External
  IDispatcherQueueTimer = interface(IInspectable)
  ['{AD4D63FD-88FE-541F-AC11-BF2DC1ED2CE5}']
    function get_Interval: TimeSpan; safecall;
    procedure put_Interval(value: TimeSpan); safecall;
    function get_IsRunning: Boolean; safecall;
    function get_IsRepeating: Boolean; safecall;
    procedure put_IsRepeating(value: Boolean); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function add_Tick(handler: TypedEventHandler_2__IDispatcherQueueTimer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Tick(token: EventRegistrationToken); safecall;
    property Interval: TimeSpan read get_Interval write put_Interval;
    property IsRepeating: Boolean read get_IsRepeating write put_IsRepeating;
    property IsRunning: Boolean read get_IsRunning;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3BDAF5DD-3DA4-5B44-ADB3-6990540AFAC6}']
    procedure Invoke(sender: IDispatcherQueue; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Object>
  // External
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface(TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base)
  ['{D3D47E00-3A62-574C-95C5-A429784D78B8}']
  end;

  // Microsoft.UI.Dispatching.IDispatcherQueue
  // External
  IDispatcherQueue = interface(IInspectable)
  ['{F6EBF8FA-BE1C-5BF6-A467-73DA28738AE8}']
    function CreateTimer: IDispatcherQueueTimer; safecall;
    function TryEnqueue(callback: DispatcherQueueHandler): Boolean; overload; safecall;
    function TryEnqueue(priority: DispatcherQueuePriority; callback: DispatcherQueueHandler): Boolean; overload; safecall;
    function add_ShutdownStarting(handler: TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_ShutdownStarting(token: EventRegistrationToken); safecall;
    function add_ShutdownCompleted(handler: TypedEventHandler_2__IDispatcherQueue__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ShutdownCompleted(token: EventRegistrationToken); safecall;
  end;

  // Microsoft.UI.Dispatching.DispatcherQueueHandler
  // External
  DispatcherQueueHandler = interface(IUnknown)
  ['{2E0872A9-4E29-5F14-B688-FB96D5F9D5F8}']
    procedure Invoke; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Microsoft.UI.Dispatching.IDispatcherQueueShutdownStartingEventArgs>
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{ECD63A61-4DBF-57BC-880C-A255DFE352C3}']
    procedure Invoke(sender: IDispatcherQueue; args: IDispatcherQueueShutdownStartingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Dispatching.IDispatcherQueue,Microsoft.UI.Dispatching.IDispatcherQueueShutdownStartingEventArgs>
  // External
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = interface(TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base)
  ['{8C8F08DD-965A-519A-91AF-B73B1FABA047}']
  end;

  // Microsoft.UI.Dispatching.IDispatcherQueueShutdownStartingEventArgs
  // External
  IDispatcherQueueShutdownStartingEventArgs = interface(IInspectable)
  ['{32519BE5-072B-5660-A70E-8835C9B8157D}']
    function GetDeferral: IDeferral; safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IFrameworkElement
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_FrameworkElement)]
  IFrameworkElement = interface(IInspectable)
  ['{FE08F13D-DC6A-5495-AD44-C2D8D21863B0}']
    function get_Triggers: IVector_1__ITriggerBase; safecall;
    function get_Resources: IResourceDictionary; safecall;
    procedure put_Resources(value: IResourceDictionary); safecall;
    function get_Tag: IInspectable; safecall;
    procedure put_Tag(value: IInspectable); safecall;
    function get_Language: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_ActualWidth: Double; safecall;
    function get_ActualHeight: Double; safecall;
    function get_Width: Double; safecall;
    procedure put_Width(value: Double); safecall;
    function get_Height: Double; safecall;
    procedure put_Height(value: Double); safecall;
    function get_MinWidth: Double; safecall;
    procedure put_MinWidth(value: Double); safecall;
    function get_MaxWidth: Double; safecall;
    procedure put_MaxWidth(value: Double); safecall;
    function get_MinHeight: Double; safecall;
    procedure put_MinHeight(value: Double); safecall;
    function get_MaxHeight: Double; safecall;
    procedure put_MaxHeight(value: Double); safecall;
    function get_HorizontalAlignment: HorizontalAlignment; safecall;
    procedure put_HorizontalAlignment(value: HorizontalAlignment); safecall;
    function get_VerticalAlignment: VerticalAlignment; safecall;
    procedure put_VerticalAlignment(value: VerticalAlignment); safecall;
    function get_Margin: Thickness; safecall;
    procedure put_Margin(value: Thickness); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_BaseUri: IUriRuntimeClass; safecall;
    function get_DataContext: IInspectable; safecall;
    procedure put_DataContext(value: IInspectable); safecall;
    function get_AllowFocusOnInteraction: Boolean; safecall;
    procedure put_AllowFocusOnInteraction(value: Boolean); safecall;
    function get_FocusVisualMargin: Thickness; safecall;
    procedure put_FocusVisualMargin(value: Thickness); safecall;
    function get_FocusVisualSecondaryThickness: Thickness; safecall;
    procedure put_FocusVisualSecondaryThickness(value: Thickness); safecall;
    function get_FocusVisualPrimaryThickness: Thickness; safecall;
    procedure put_FocusVisualPrimaryThickness(value: Thickness); safecall;
    function get_FocusVisualSecondaryBrush: IBrush; safecall;
    procedure put_FocusVisualSecondaryBrush(value: IBrush); safecall;
    function get_FocusVisualPrimaryBrush: IBrush; safecall;
    procedure put_FocusVisualPrimaryBrush(value: IBrush); safecall;
    function get_AllowFocusWhenDisabled: Boolean; safecall;
    procedure put_AllowFocusWhenDisabled(value: Boolean); safecall;
    function get_Style: IStyle; safecall;
    procedure put_Style(value: IStyle); safecall;
    function get_Parent: IDependencyObject; safecall;
    function get_FlowDirection: FlowDirection; safecall;
    procedure put_FlowDirection(value: FlowDirection); safecall;
    function get_RequestedTheme: ElementTheme; safecall;
    procedure put_RequestedTheme(value: ElementTheme); safecall;
    function get_IsLoaded: Boolean; safecall;
    function get_ActualTheme: ElementTheme; safecall;
    function add_Loaded(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_Loaded(token: EventRegistrationToken); safecall;
    function add_Unloaded(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_Unloaded(token: EventRegistrationToken); safecall;
    function add_DataContextChanged(handler: TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DataContextChanged(token: EventRegistrationToken); safecall;
    function add_SizeChanged(handler: SizeChangedEventHandler): EventRegistrationToken; safecall;
    procedure remove_SizeChanged(token: EventRegistrationToken); safecall;
    function add_LayoutUpdated(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_LayoutUpdated(token: EventRegistrationToken); safecall;
    function add_Loading(handler: TypedEventHandler_2__IFrameworkElement__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Loading(token: EventRegistrationToken); safecall;
    function add_ActualThemeChanged(handler: TypedEventHandler_2__IFrameworkElement__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ActualThemeChanged(token: EventRegistrationToken); safecall;
    function add_EffectiveViewportChanged(handler: TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_EffectiveViewportChanged(token: EventRegistrationToken); safecall;
    function FindName(name: HSTRING): IInspectable; safecall;
    procedure SetBinding(dp: IDependencyProperty; binding: Data_IBindingBase); safecall;
    function GetBindingExpression(dp: IDependencyProperty): Data_IBindingExpression; safecall;
    property ActualHeight: Double read get_ActualHeight;
    property ActualTheme: ElementTheme read get_ActualTheme;
    property ActualWidth: Double read get_ActualWidth;
    property AllowFocusOnInteraction: Boolean read get_AllowFocusOnInteraction write put_AllowFocusOnInteraction;
    property AllowFocusWhenDisabled: Boolean read get_AllowFocusWhenDisabled write put_AllowFocusWhenDisabled;
    property BaseUri: IUriRuntimeClass read get_BaseUri;
    property DataContext: IInspectable read get_DataContext write put_DataContext;
    property FlowDirection_: FlowDirection read get_FlowDirection write put_FlowDirection;
    property FocusVisualMargin: Thickness read get_FocusVisualMargin write put_FocusVisualMargin;
    property FocusVisualPrimaryBrush: IBrush read get_FocusVisualPrimaryBrush write put_FocusVisualPrimaryBrush;
    property FocusVisualPrimaryThickness: Thickness read get_FocusVisualPrimaryThickness write put_FocusVisualPrimaryThickness;
    property FocusVisualSecondaryBrush: IBrush read get_FocusVisualSecondaryBrush write put_FocusVisualSecondaryBrush;
    property FocusVisualSecondaryThickness: Thickness read get_FocusVisualSecondaryThickness write put_FocusVisualSecondaryThickness;
    property Height: Double read get_Height write put_Height;
    property HorizontalAlignment_: HorizontalAlignment read get_HorizontalAlignment write put_HorizontalAlignment;
    property IsLoaded: Boolean read get_IsLoaded;
    property Language: HSTRING read get_Language write put_Language;
    property Margin: Thickness read get_Margin write put_Margin;
    property MaxHeight: Double read get_MaxHeight write put_MaxHeight;
    property MaxWidth: Double read get_MaxWidth write put_MaxWidth;
    property MinHeight: Double read get_MinHeight write put_MinHeight;
    property MinWidth: Double read get_MinWidth write put_MinWidth;
    property Name: HSTRING read get_Name write put_Name;
    property Parent: IDependencyObject read get_Parent;
    property RequestedTheme: ElementTheme read get_RequestedTheme write put_RequestedTheme;
    property Resources: IResourceDictionary read get_Resources write put_Resources;
    property Style: IStyle read get_Style write put_Style;
    property Tag: IInspectable read get_Tag write put_Tag;
    property Triggers: IVector_1__ITriggerBase read get_Triggers;
    property VerticalAlignment_: VerticalAlignment read get_VerticalAlignment write put_VerticalAlignment;
    property Width: Double read get_Width write put_Width;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.ITriggerBase>
  IVector_1__ITriggerBase_Base = interface(IInspectable)
  ['{EF52E000-0B0F-52B5-BDFE-4F5935DCF1BC}']
    function GetAt(index: Cardinal): ITriggerBase; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ITriggerBase; safecall;
    function IndexOf(value: ITriggerBase; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ITriggerBase); safecall;
    procedure InsertAt(index: Cardinal; value: ITriggerBase); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ITriggerBase); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PITriggerBase): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PITriggerBase); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.ITriggerBase>
  // External
  IVector_1__ITriggerBase = interface(IVector_1__ITriggerBase_Base)
  ['{EC4EED1C-49B8-5081-88C1-2657BDD1C676}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.ITriggerBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_TriggerBase)]
  ITriggerBase = interface(IInspectable)
  ['{D37DA89D-0D71-58CF-A901-99A7D3E5E434}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.ITriggerBase>
  // External
  IVectorView_1__ITriggerBase = interface(IInspectable)
  ['{22F0B9B7-2F4D-5E4D-83E8-1F87533F9139}']
    function GetAt(index: Cardinal): ITriggerBase; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ITriggerBase; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PITriggerBase): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IResourceDictionary
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_ResourceDictionary)]
  IResourceDictionary = interface(IInspectable)
  ['{1B690975-A710-5783-A6E1-15836F6186C2}']
    function get_Source: IUriRuntimeClass; safecall;
    procedure put_Source(value: IUriRuntimeClass); safecall;
    function get_MergedDictionaries: IVector_1__IResourceDictionary; safecall;
    function get_ThemeDictionaries: IMap_2__IInspectable__IInspectable; safecall;
    property MergedDictionaries: IVector_1__IResourceDictionary read get_MergedDictionaries;
    property Source: IUriRuntimeClass read get_Source write put_Source;
    property ThemeDictionaries: IMap_2__IInspectable__IInspectable read get_ThemeDictionaries;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IResourceDictionary>
  IVector_1__IResourceDictionary_Base = interface(IInspectable)
  ['{C6FBFE1A-F015-5B23-8E7E-14497E9707A1}']
    function GetAt(index: Cardinal): IResourceDictionary; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IResourceDictionary; safecall;
    function IndexOf(value: IResourceDictionary; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IResourceDictionary); safecall;
    procedure InsertAt(index: Cardinal; value: IResourceDictionary); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IResourceDictionary); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIResourceDictionary): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIResourceDictionary); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IResourceDictionary>
  // External
  IVector_1__IResourceDictionary = interface(IVector_1__IResourceDictionary_Base)
  ['{F1072FE8-71B1-515B-9DC9-D94E96A80F5D}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.IResourceDictionary>
  // External
  IVectorView_1__IResourceDictionary = interface(IInspectable)
  ['{868C460C-77FB-509F-BEEC-D2B6AEEC5D0B}']
    function GetAt(index: Cardinal): IResourceDictionary; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IResourceDictionary; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIResourceDictionary): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Brush)]
  IBrush = interface(IInspectable)
  ['{2DE3CB83-1329-5679-88F8-C822BC5442CB}']
    function get_Opacity: Double; safecall;
    procedure put_Opacity(value: Double); safecall;
    function get_Transform: ITransform; safecall;
    procedure put_Transform(value: ITransform); safecall;
    function get_RelativeTransform: ITransform; safecall;
    procedure put_RelativeTransform(value: ITransform); safecall;
    property Opacity: Double read get_Opacity write put_Opacity;
    property RelativeTransform: ITransform read get_RelativeTransform write put_RelativeTransform;
    property Transform: ITransform read get_Transform write put_Transform;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.ITransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Transform)]
  ITransform = interface(IInspectable)
  ['{92A8DEE5-1413-56B9-8CCA-3C46918FDE1B}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IStyle
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Style)]
  IStyle = interface(IInspectable)
  ['{65E1D164-572F-5B0E-A80F-9C02441FAC49}']
    function get_IsSealed: Boolean; safecall;
    function get_Setters: ISetterBaseCollection; safecall;
    function get_TargetType: Interop_TypeName; safecall;
    procedure put_TargetType(value: Interop_TypeName); safecall;
    function get_BasedOn: IStyle; safecall;
    procedure put_BasedOn(value: IStyle); safecall;
    procedure Seal; safecall;
    property BasedOn: IStyle read get_BasedOn write put_BasedOn;
    property IsSealed: Boolean read get_IsSealed;
    property Setters: ISetterBaseCollection read get_Setters;
    property TargetType: Interop_TypeName read get_TargetType write put_TargetType;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.ISetterBaseCollection
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_SetterBaseCollection)]
  ISetterBaseCollection = interface(IInspectable)
  ['{63BF7C0F-B290-5C0C-9185-3338CD350D7F}']
    function get_IsSealed: Boolean; safecall;
    property IsSealed: Boolean read get_IsSealed;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IDependencyObject
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_DependencyObject)]
  IDependencyObject = interface(IInspectable)
  ['{E7BEAEE7-160E-50F7-8789-D63463F979FA}']
    function GetValue(dp: IDependencyProperty): IInspectable; safecall;
    procedure SetValue(dp: IDependencyProperty; value: IInspectable); safecall;
    procedure ClearValue(dp: IDependencyProperty); safecall;
    function ReadLocalValue(dp: IDependencyProperty): IInspectable; safecall;
    function GetAnimationBaseValue(dp: IDependencyProperty): IInspectable; safecall;
    function RegisterPropertyChangedCallback(dp: IDependencyProperty; callback: DependencyPropertyChangedCallback): Int64; safecall;
    procedure UnregisterPropertyChangedCallback(dp: IDependencyProperty; token: Int64); safecall;
    function get_Dispatcher: ICoreDispatcher; safecall;
    function get_DispatcherQueue: IDispatcherQueue; safecall;
    property Dispatcher: ICoreDispatcher read get_Dispatcher;
    property DispatcherQueue: IDispatcherQueue read get_DispatcherQueue;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IDependencyProperty
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_DependencyProperty)]
  IDependencyProperty = interface(IInspectable)
  ['{960EAB49-9672-58A0-995B-3A42E5EA6278}']
    function GetMetadata(forType: Interop_TypeName): IPropertyMetadata; safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IPropertyMetadata
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_PropertyMetadata)]
  IPropertyMetadata = interface(IInspectable)
  ['{B3644425-9464-5434-B0AE-AFF8D3159FE1}']
    function get_DefaultValue: IInspectable; safecall;
    function get_CreateDefaultValueCallback: CreateDefaultValueCallback; safecall;
    property CreateDefaultValueCallback_: CreateDefaultValueCallback read get_CreateDefaultValueCallback;
    property DefaultValue: IInspectable read get_DefaultValue;
  end;

  // Microsoft.UI.Xaml.CreateDefaultValueCallback
  // External
  CreateDefaultValueCallback = interface(IUnknown)
  ['{7F808C05-2AC4-5AD9-AC8A-26890333D81E}']
    function Invoke: IInspectable; safecall;
  end;

  // Microsoft.UI.Xaml.DependencyPropertyChangedCallback
  // External
  DependencyPropertyChangedCallback = interface(IUnknown)
  ['{F055BB21-219B-5B0C-805D-BCAEDAE15458}']
    procedure Invoke(sender: IDependencyObject; dp: IDependencyProperty); safecall;
  end;

  // Microsoft.UI.Xaml.RoutedEventHandler
  // External
  RoutedEventHandler = interface(IUnknown)
  ['{DAE23D85-69CA-5BDF-805B-6161A3A215CC}']
    procedure Invoke(sender: IInspectable; e: IRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_RoutedEventArgs)]
  IRoutedEventArgs = interface(IInspectable)
  ['{0908C407-1C7D-5DE3-9C50-D971C62EC8EC}']
    function get_OriginalSource: IInspectable; safecall;
    property OriginalSource: IInspectable read get_OriginalSource;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IDataContextChangedEventArgs>
  TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4E4EC708-DEF4-5D93-8690-DFC5F9233C53}']
    procedure Invoke(sender: IFrameworkElement; args: IDataContextChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IDataContextChangedEventArgs>
  // External
  TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs = interface(TypedEventHandler_2__IFrameworkElement__IDataContextChangedEventArgs_Delegate_Base)
  ['{BCBE5E05-6E20-533A-BC10-65FAED366B52}']
  end;

  // Microsoft.UI.Xaml.IDataContextChangedEventArgs
  // External
  IDataContextChangedEventArgs = interface(IInspectable)
  ['{A1BE80F4-CF83-5022-B113-9233F1D4FAFA}']
    function get_NewValue: IInspectable; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property NewValue: IInspectable read get_NewValue;
  end;

  // Microsoft.UI.Xaml.SizeChangedEventHandler
  // External
  SizeChangedEventHandler = interface(IUnknown)
  ['{8D7B1A58-14C6-51C9-892C-9FCCE368E77D}']
    procedure Invoke(sender: IInspectable; e: ISizeChangedEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.ISizeChangedEventArgs
  // External
  ISizeChangedEventArgs = interface(IInspectable)
  ['{FE76324E-6DFB-58B1-9DCD-886CA8F9A2EA}']
    function get_PreviousSize: TSizeF; safecall;
    function get_NewSize: TSizeF; safecall;
    property NewSize: TSizeF read get_NewSize;
    property PreviousSize: TSizeF read get_PreviousSize;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Object>
  TypedEventHandler_2__IFrameworkElement__IInspectable_Delegate_Base = interface(IUnknown)
  ['{53876073-BE4F-5DAC-9AE0-015DB6E40C74}']
    procedure Invoke(sender: IFrameworkElement; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Object>
  // External
  TypedEventHandler_2__IFrameworkElement__IInspectable = interface(TypedEventHandler_2__IFrameworkElement__IInspectable_Delegate_Base)
  ['{68E6D907-2E03-5C94-8AFA-5DDC7E6FF4D7}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IEffectiveViewportChangedEventArgs>
  TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{276F9F20-9E38-5AED-B5A8-68B25EC409C2}']
    procedure Invoke(sender: IFrameworkElement; args: IEffectiveViewportChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IFrameworkElement,Microsoft.UI.Xaml.IEffectiveViewportChangedEventArgs>
  // External
  TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs = interface(TypedEventHandler_2__IFrameworkElement__IEffectiveViewportChangedEventArgs_Delegate_Base)
  ['{8DFE517F-70B7-554D-BFF2-119E9EB37BA8}']
  end;

  // Microsoft.UI.Xaml.IEffectiveViewportChangedEventArgs
  // External
  IEffectiveViewportChangedEventArgs = interface(IInspectable)
  ['{636E8159-2D82-538A-8483-CD576E41D0DF}']
    function get_EffectiveViewport: TRectF; safecall;
    function get_MaxViewport: TRectF; safecall;
    function get_BringIntoViewDistanceX: Double; safecall;
    function get_BringIntoViewDistanceY: Double; safecall;
    property BringIntoViewDistanceX: Double read get_BringIntoViewDistanceX;
    property BringIntoViewDistanceY: Double read get_BringIntoViewDistanceY;
    property EffectiveViewport: TRectF read get_EffectiveViewport;
    property MaxViewport: TRectF read get_MaxViewport;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IBindingBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Data_BindingBase)]
  Data_IBindingBase = interface(IInspectable)
  ['{91DDD141-5944-50EF-B85E-218E463F7A73}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IBindingExpression
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Data_BindingExpression)]
  Data_IBindingExpression = interface(IInspectable)
  ['{4C023916-37BC-5B07-BC9D-15C547BD9B26}']
    function get_DataItem: IInspectable; safecall;
    function get_ParentBinding: Data_IBinding; safecall;
    procedure UpdateSource; safecall;
    property DataItem: IInspectable read get_DataItem;
    property ParentBinding: Data_IBinding read get_ParentBinding;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IBinding
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Data_Binding)]
  Data_IBinding = interface(IInspectable)
  ['{501EA0E8-EDD4-59DE-8845-76AF2EABBE00}']
    function get_Path: IPropertyPath; safecall;
    procedure put_Path(value: IPropertyPath); safecall;
    function get_Mode: Data_BindingMode; safecall;
    procedure put_Mode(value: Data_BindingMode); safecall;
    function get_Source: IInspectable; safecall;
    procedure put_Source(value: IInspectable); safecall;
    function get_RelativeSource: Data_IRelativeSource; safecall;
    procedure put_RelativeSource(value: Data_IRelativeSource); safecall;
    function get_ElementName: HSTRING; safecall;
    procedure put_ElementName(value: HSTRING); safecall;
    function get_Converter: Data_IValueConverter; safecall;
    procedure put_Converter(value: Data_IValueConverter); safecall;
    function get_ConverterParameter: IInspectable; safecall;
    procedure put_ConverterParameter(value: IInspectable); safecall;
    function get_ConverterLanguage: HSTRING; safecall;
    procedure put_ConverterLanguage(value: HSTRING); safecall;
    function get_FallbackValue: IInspectable; safecall;
    procedure put_FallbackValue(value: IInspectable); safecall;
    function get_TargetNullValue: IInspectable; safecall;
    procedure put_TargetNullValue(value: IInspectable); safecall;
    function get_UpdateSourceTrigger: Data_UpdateSourceTrigger; safecall;
    procedure put_UpdateSourceTrigger(value: Data_UpdateSourceTrigger); safecall;
    property Converter: Data_IValueConverter read get_Converter write put_Converter;
    property ConverterLanguage: HSTRING read get_ConverterLanguage write put_ConverterLanguage;
    property ConverterParameter: IInspectable read get_ConverterParameter write put_ConverterParameter;
    property ElementName: HSTRING read get_ElementName write put_ElementName;
    property FallbackValue: IInspectable read get_FallbackValue write put_FallbackValue;
    property Mode: Data_BindingMode read get_Mode write put_Mode;
    property Path: IPropertyPath read get_Path write put_Path;
    property RelativeSource: Data_IRelativeSource read get_RelativeSource write put_RelativeSource;
    property Source: IInspectable read get_Source write put_Source;
    property TargetNullValue: IInspectable read get_TargetNullValue write put_TargetNullValue;
    property UpdateSourceTrigger: Data_UpdateSourceTrigger read get_UpdateSourceTrigger write put_UpdateSourceTrigger;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IPropertyPath
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_PropertyPath)]
  IPropertyPath = interface(IInspectable)
  ['{8B0712F6-9E57-53B0-80B1-966A79F60B96}']
    function get_Path: HSTRING; safecall;
    property Path: HSTRING read get_Path;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IRelativeSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Data_RelativeSource)]
  Data_IRelativeSource = interface(IInspectable)
  ['{7FFC8126-5DD8-58BB-B686-C71EDDEA07B2}']
    function get_Mode: Data_RelativeSourceMode; safecall;
    procedure put_Mode(value: Data_RelativeSourceMode); safecall;
    property Mode: Data_RelativeSourceMode read get_Mode write put_Mode;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IValueConverter
  // External
  Data_IValueConverter = interface(IInspectable)
  ['{AFDD2BFF-10F5-5173-B7C0-3590BD96CB35}']
    function Convert(value: IInspectable; targetType: Interop_TypeName; parameter: IInspectable; language: HSTRING): IInspectable; safecall;
    function ConvertBack(value: IInspectable; targetType: Interop_TypeName; parameter: IInspectable; language: HSTRING): IInspectable; safecall;
  end;

  // Microsoft.UI.Xaml.IXamlRoot
  // External
  IXamlRoot = interface(IInspectable)
  ['{60CB215A-AD15-520A-8B01-4416824F0441}']
    function get_Content: IUIElement; safecall;
    function get_Size: TSizeF; safecall;
    function get_RasterizationScale: Double; safecall;
    function get_IsHostVisible: Boolean; safecall;
    function add_Changed(handler: TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Changed(token: EventRegistrationToken); safecall;
    property Content: IUIElement read get_Content;
    property IsHostVisible: Boolean read get_IsHostVisible;
    property RasterizationScale: Double read get_RasterizationScale;
    property Size: TSizeF read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IUIElement
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_UIElement)]
  IUIElement = interface(IInspectable)
  ['{C3C01020-320C-5CF6-9D24-D396BBFA4D8B}']
    function get_DesiredSize: TSizeF; safecall;
    function get_AllowDrop: Boolean; safecall;
    procedure put_AllowDrop(value: Boolean); safecall;
    function get_Opacity: Double; safecall;
    procedure put_Opacity(value: Double); safecall;
    function get_Clip: IRectangleGeometry; safecall;
    procedure put_Clip(value: IRectangleGeometry); safecall;
    function get_RenderTransform: ITransform; safecall;
    procedure put_RenderTransform(value: ITransform); safecall;
    function get_Projection: IProjection; safecall;
    procedure put_Projection(value: IProjection); safecall;
    function get_Transform3D: Media3D_ITransform3D; safecall;
    procedure put_Transform3D(value: Media3D_ITransform3D); safecall;
    function get_RenderTransformOrigin: TPointF; safecall;
    procedure put_RenderTransformOrigin(value: TPointF); safecall;
    function get_IsHitTestVisible: Boolean; safecall;
    procedure put_IsHitTestVisible(value: Boolean); safecall;
    function get_Visibility: Visibility; safecall;
    procedure put_Visibility(value: Visibility); safecall;
    function get_RenderSize: TSizeF; safecall;
    function get_UseLayoutRounding: Boolean; safecall;
    procedure put_UseLayoutRounding(value: Boolean); safecall;
    function get_Transitions: IVector_1__Animation_ITransition; safecall;
    procedure put_Transitions(value: IVector_1__Animation_ITransition); safecall;
    function get_CacheMode: ICacheMode; safecall;
    procedure put_CacheMode(value: ICacheMode); safecall;
    function get_IsTapEnabled: Boolean; safecall;
    procedure put_IsTapEnabled(value: Boolean); safecall;
    function get_IsDoubleTapEnabled: Boolean; safecall;
    procedure put_IsDoubleTapEnabled(value: Boolean); safecall;
    function get_CanDrag: Boolean; safecall;
    procedure put_CanDrag(value: Boolean); safecall;
    function get_IsRightTapEnabled: Boolean; safecall;
    procedure put_IsRightTapEnabled(value: Boolean); safecall;
    function get_IsHoldingEnabled: Boolean; safecall;
    procedure put_IsHoldingEnabled(value: Boolean); safecall;
    function get_ManipulationMode: Input_ManipulationModes; safecall;
    procedure put_ManipulationMode(value: Input_ManipulationModes); safecall;
    function get_PointerCaptures: IVectorView_1__Input_IPointer; safecall;
    function get_ContextFlyout: Primitives_IFlyoutBase; safecall;
    procedure put_ContextFlyout(value: Primitives_IFlyoutBase); safecall;
    function get_CompositeMode: ElementCompositeMode; safecall;
    procedure put_CompositeMode(value: ElementCompositeMode); safecall;
    function get_Lights: IVector_1__IXamlLight; safecall;
    function get_CanBeScrollAnchor: Boolean; safecall;
    procedure put_CanBeScrollAnchor(value: Boolean); safecall;
    function get_ExitDisplayModeOnAccessKeyInvoked: Boolean; safecall;
    procedure put_ExitDisplayModeOnAccessKeyInvoked(value: Boolean); safecall;
    function get_IsAccessKeyScope: Boolean; safecall;
    procedure put_IsAccessKeyScope(value: Boolean); safecall;
    function get_AccessKeyScopeOwner: IDependencyObject; safecall;
    procedure put_AccessKeyScopeOwner(value: IDependencyObject); safecall;
    function get_AccessKey: HSTRING; safecall;
    procedure put_AccessKey(value: HSTRING); safecall;
    function get_KeyTipPlacementMode: Input_KeyTipPlacementMode; safecall;
    procedure put_KeyTipPlacementMode(value: Input_KeyTipPlacementMode); safecall;
    function get_KeyTipHorizontalOffset: Double; safecall;
    procedure put_KeyTipHorizontalOffset(value: Double); safecall;
    function get_KeyTipVerticalOffset: Double; safecall;
    procedure put_KeyTipVerticalOffset(value: Double); safecall;
    function get_KeyTipTarget: IDependencyObject; safecall;
    procedure put_KeyTipTarget(value: IDependencyObject); safecall;
    function get_XYFocusKeyboardNavigation: Input_XYFocusKeyboardNavigationMode; safecall;
    procedure put_XYFocusKeyboardNavigation(value: Input_XYFocusKeyboardNavigationMode); safecall;
    function get_XYFocusUpNavigationStrategy: Input_XYFocusNavigationStrategy; safecall;
    procedure put_XYFocusUpNavigationStrategy(value: Input_XYFocusNavigationStrategy); safecall;
    function get_XYFocusDownNavigationStrategy: Input_XYFocusNavigationStrategy; safecall;
    procedure put_XYFocusDownNavigationStrategy(value: Input_XYFocusNavigationStrategy); safecall;
    function get_XYFocusLeftNavigationStrategy: Input_XYFocusNavigationStrategy; safecall;
    procedure put_XYFocusLeftNavigationStrategy(value: Input_XYFocusNavigationStrategy); safecall;
    function get_XYFocusRightNavigationStrategy: Input_XYFocusNavigationStrategy; safecall;
    procedure put_XYFocusRightNavigationStrategy(value: Input_XYFocusNavigationStrategy); safecall;
    function get_KeyboardAccelerators: IVector_1__Input_IKeyboardAccelerator; safecall;
    function get_KeyboardAcceleratorPlacementTarget: IDependencyObject; safecall;
    procedure put_KeyboardAcceleratorPlacementTarget(value: IDependencyObject); safecall;
    function get_KeyboardAcceleratorPlacementMode: Input_KeyboardAcceleratorPlacementMode; safecall;
    procedure put_KeyboardAcceleratorPlacementMode(value: Input_KeyboardAcceleratorPlacementMode); safecall;
    function get_HighContrastAdjustment: ElementHighContrastAdjustment; safecall;
    procedure put_HighContrastAdjustment(value: ElementHighContrastAdjustment); safecall;
    function get_TabFocusNavigation: Input_KeyboardNavigationMode; safecall;
    procedure put_TabFocusNavigation(value: Input_KeyboardNavigationMode); safecall;
    function get_OpacityTransition: IScalarTransition; safecall;
    procedure put_OpacityTransition(value: IScalarTransition); safecall;
    function get_Translation: Numerics_Vector3; safecall;
    procedure put_Translation(value: Numerics_Vector3); safecall;
    function get_TranslationTransition: IVector3Transition; safecall;
    procedure put_TranslationTransition(value: IVector3Transition); safecall;
    function get_Rotation: Single; safecall;
    procedure put_Rotation(value: Single); safecall;
    function get_RotationTransition: IScalarTransition; safecall;
    procedure put_RotationTransition(value: IScalarTransition); safecall;
    function get_Scale: Numerics_Vector3; safecall;
    procedure put_Scale(value: Numerics_Vector3); safecall;
    function get_ScaleTransition: IVector3Transition; safecall;
    procedure put_ScaleTransition(value: IVector3Transition); safecall;
    function get_TransformMatrix: Numerics_Matrix4x4; safecall;
    procedure put_TransformMatrix(value: Numerics_Matrix4x4); safecall;
    function get_CenterPoint: Numerics_Vector3; safecall;
    procedure put_CenterPoint(value: Numerics_Vector3); safecall;
    function get_RotationAxis: Numerics_Vector3; safecall;
    procedure put_RotationAxis(value: Numerics_Vector3); safecall;
    function get_ActualOffset: Numerics_Vector3; safecall;
    function get_ActualSize: Numerics_Vector2; safecall;
    function get_XamlRoot: IXamlRoot; safecall;
    procedure put_XamlRoot(value: IXamlRoot); safecall;
    function get_Shadow: IShadow; safecall;
    procedure put_Shadow(value: IShadow); safecall;
    function get_RasterizationScale: Double; safecall;
    procedure put_RasterizationScale(value: Double); safecall;
    function get_FocusState: FocusState; safecall;
    function get_UseSystemFocusVisuals: Boolean; safecall;
    procedure put_UseSystemFocusVisuals(value: Boolean); safecall;
    function get_XYFocusLeft: IDependencyObject; safecall;
    procedure put_XYFocusLeft(value: IDependencyObject); safecall;
    function get_XYFocusRight: IDependencyObject; safecall;
    procedure put_XYFocusRight(value: IDependencyObject); safecall;
    function get_XYFocusUp: IDependencyObject; safecall;
    procedure put_XYFocusUp(value: IDependencyObject); safecall;
    function get_XYFocusDown: IDependencyObject; safecall;
    procedure put_XYFocusDown(value: IDependencyObject); safecall;
    function get_IsTabStop: Boolean; safecall;
    procedure put_IsTabStop(value: Boolean); safecall;
    function get_TabIndex: Integer; safecall;
    procedure put_TabIndex(value: Integer); safecall;
    function add_KeyUp(handler: Input_KeyEventHandler): EventRegistrationToken; safecall;
    procedure remove_KeyUp(token: EventRegistrationToken); safecall;
    function add_KeyDown(handler: Input_KeyEventHandler): EventRegistrationToken; safecall;
    procedure remove_KeyDown(token: EventRegistrationToken); safecall;
    function add_GotFocus(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_GotFocus(token: EventRegistrationToken); safecall;
    function add_LostFocus(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_LostFocus(token: EventRegistrationToken); safecall;
    function add_DragStarting(handler: TypedEventHandler_2__IUIElement__IDragStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_DragStarting(token: EventRegistrationToken); safecall;
    function add_DropCompleted(handler: TypedEventHandler_2__IUIElement__IDropCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DropCompleted(token: EventRegistrationToken); safecall;
    function add_CharacterReceived(handler: TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CharacterReceived(token: EventRegistrationToken); safecall;
    function add_DragEnter(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_DragEnter(token: EventRegistrationToken); safecall;
    function add_DragLeave(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_DragLeave(token: EventRegistrationToken); safecall;
    function add_DragOver(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_DragOver(token: EventRegistrationToken); safecall;
    function add_Drop(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_Drop(token: EventRegistrationToken); safecall;
    function add_PointerPressed(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerPressed(token: EventRegistrationToken); safecall;
    function add_PointerMoved(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerMoved(token: EventRegistrationToken); safecall;
    function add_PointerReleased(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerReleased(token: EventRegistrationToken); safecall;
    function add_PointerEntered(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerEntered(token: EventRegistrationToken); safecall;
    function add_PointerExited(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerExited(token: EventRegistrationToken); safecall;
    function add_PointerCaptureLost(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerCaptureLost(token: EventRegistrationToken); safecall;
    function add_PointerCanceled(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerCanceled(token: EventRegistrationToken); safecall;
    function add_PointerWheelChanged(handler: Input_PointerEventHandler): EventRegistrationToken; safecall;
    procedure remove_PointerWheelChanged(token: EventRegistrationToken); safecall;
    function add_Tapped(handler: Input_TappedEventHandler): EventRegistrationToken; safecall;
    procedure remove_Tapped(token: EventRegistrationToken); safecall;
    function add_DoubleTapped(handler: Input_DoubleTappedEventHandler): EventRegistrationToken; safecall;
    procedure remove_DoubleTapped(token: EventRegistrationToken); safecall;
    function add_Holding(handler: Input_HoldingEventHandler): EventRegistrationToken; safecall;
    procedure remove_Holding(token: EventRegistrationToken); safecall;
    function add_ContextRequested(handler: TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ContextRequested(token: EventRegistrationToken); safecall;
    function add_ContextCanceled(handler: TypedEventHandler_2__IUIElement__IRoutedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ContextCanceled(token: EventRegistrationToken); safecall;
    function add_RightTapped(handler: Input_RightTappedEventHandler): EventRegistrationToken; safecall;
    procedure remove_RightTapped(token: EventRegistrationToken); safecall;
    function add_ManipulationStarting(handler: Input_ManipulationStartingEventHandler): EventRegistrationToken; safecall;
    procedure remove_ManipulationStarting(token: EventRegistrationToken); safecall;
    function add_ManipulationInertiaStarting(handler: Input_ManipulationInertiaStartingEventHandler): EventRegistrationToken; safecall;
    procedure remove_ManipulationInertiaStarting(token: EventRegistrationToken); safecall;
    function add_ManipulationStarted(handler: Input_ManipulationStartedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ManipulationStarted(token: EventRegistrationToken); safecall;
    function add_ManipulationDelta(handler: Input_ManipulationDeltaEventHandler): EventRegistrationToken; safecall;
    procedure remove_ManipulationDelta(token: EventRegistrationToken); safecall;
    function add_ManipulationCompleted(handler: Input_ManipulationCompletedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ManipulationCompleted(token: EventRegistrationToken); safecall;
    function add_AccessKeyDisplayRequested(handler: TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccessKeyDisplayRequested(token: EventRegistrationToken); safecall;
    function add_AccessKeyDisplayDismissed(handler: TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccessKeyDisplayDismissed(token: EventRegistrationToken); safecall;
    function add_AccessKeyInvoked(handler: TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccessKeyInvoked(token: EventRegistrationToken); safecall;
    function add_ProcessKeyboardAccelerators(handler: TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs): EventRegistrationToken; safecall;
    procedure remove_ProcessKeyboardAccelerators(token: EventRegistrationToken); safecall;
    function add_GettingFocus(handler: TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs): EventRegistrationToken; safecall;
    procedure remove_GettingFocus(token: EventRegistrationToken); safecall;
    function add_LosingFocus(handler: TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs): EventRegistrationToken; safecall;
    procedure remove_LosingFocus(token: EventRegistrationToken); safecall;
    function add_NoFocusCandidateFound(handler: TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs): EventRegistrationToken; safecall;
    procedure remove_NoFocusCandidateFound(token: EventRegistrationToken); safecall;
    function add_PreviewKeyDown(handler: Input_KeyEventHandler): EventRegistrationToken; safecall;
    procedure remove_PreviewKeyDown(token: EventRegistrationToken); safecall;
    function add_PreviewKeyUp(handler: Input_KeyEventHandler): EventRegistrationToken; safecall;
    procedure remove_PreviewKeyUp(token: EventRegistrationToken); safecall;
    function add_BringIntoViewRequested(handler: TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_BringIntoViewRequested(token: EventRegistrationToken); safecall;
    procedure Measure(availableSize: TSizeF); safecall;
    procedure Arrange(finalRect: TRectF); safecall;
    function CapturePointer(value: Input_IPointer): Boolean; safecall;
    procedure ReleasePointerCapture(value: Input_IPointer); safecall;
    procedure ReleasePointerCaptures; safecall;
    procedure AddHandler(routedEvent: IRoutedEvent; handler: IInspectable; handledEventsToo: Boolean); safecall;
    procedure RemoveHandler(routedEvent: IRoutedEvent; handler: IInspectable); safecall;
    function TransformToVisual(visual: IUIElement): IGeneralTransform; safecall;
    procedure InvalidateMeasure; safecall;
    procedure InvalidateArrange; safecall;
    procedure UpdateLayout; safecall;
    function CancelDirectManipulations: Boolean; safecall;
    function StartDragAsync(pointerPoint: IPointerPoint): IAsyncOperation_1__DataPackageOperation; safecall;
    procedure StartBringIntoView; overload; safecall;
    procedure StartBringIntoView(options: IBringIntoViewOptions); overload; safecall;
    procedure TryInvokeKeyboardAccelerator(args: Input_IProcessKeyboardAcceleratorEventArgs); safecall;
    function Focus(value: FocusState): Boolean; safecall;
    procedure StartAnimation(animation: ICompositionAnimationBase); safecall;
    procedure StopAnimation(animation: ICompositionAnimationBase); safecall;
    property AccessKey: HSTRING read get_AccessKey write put_AccessKey;
    property AccessKeyScopeOwner: IDependencyObject read get_AccessKeyScopeOwner write put_AccessKeyScopeOwner;
    property ActualOffset: Numerics_Vector3 read get_ActualOffset;
    property ActualSize: Numerics_Vector2 read get_ActualSize;
    property AllowDrop: Boolean read get_AllowDrop write put_AllowDrop;
    property CacheMode: ICacheMode read get_CacheMode write put_CacheMode;
    property CanBeScrollAnchor: Boolean read get_CanBeScrollAnchor write put_CanBeScrollAnchor;
    property CanDrag: Boolean read get_CanDrag write put_CanDrag;
    property CenterPoint: Numerics_Vector3 read get_CenterPoint write put_CenterPoint;
    property Clip: IRectangleGeometry read get_Clip write put_Clip;
    property CompositeMode: ElementCompositeMode read get_CompositeMode write put_CompositeMode;
    property ContextFlyout: Primitives_IFlyoutBase read get_ContextFlyout write put_ContextFlyout;
    property DesiredSize: TSizeF read get_DesiredSize;
    property ExitDisplayModeOnAccessKeyInvoked: Boolean read get_ExitDisplayModeOnAccessKeyInvoked write put_ExitDisplayModeOnAccessKeyInvoked;
    property FocusState_: FocusState read get_FocusState;
    property HighContrastAdjustment: ElementHighContrastAdjustment read get_HighContrastAdjustment write put_HighContrastAdjustment;
    property IsAccessKeyScope: Boolean read get_IsAccessKeyScope write put_IsAccessKeyScope;
    property IsDoubleTapEnabled: Boolean read get_IsDoubleTapEnabled write put_IsDoubleTapEnabled;
    property IsHitTestVisible: Boolean read get_IsHitTestVisible write put_IsHitTestVisible;
    property IsHoldingEnabled: Boolean read get_IsHoldingEnabled write put_IsHoldingEnabled;
    property IsRightTapEnabled: Boolean read get_IsRightTapEnabled write put_IsRightTapEnabled;
    property IsTabStop: Boolean read get_IsTabStop write put_IsTabStop;
    property IsTapEnabled: Boolean read get_IsTapEnabled write put_IsTapEnabled;
    property KeyTipHorizontalOffset: Double read get_KeyTipHorizontalOffset write put_KeyTipHorizontalOffset;
    property KeyTipPlacementMode: Input_KeyTipPlacementMode read get_KeyTipPlacementMode write put_KeyTipPlacementMode;
    property KeyTipTarget: IDependencyObject read get_KeyTipTarget write put_KeyTipTarget;
    property KeyTipVerticalOffset: Double read get_KeyTipVerticalOffset write put_KeyTipVerticalOffset;
    property KeyboardAcceleratorPlacementMode: Input_KeyboardAcceleratorPlacementMode read get_KeyboardAcceleratorPlacementMode write put_KeyboardAcceleratorPlacementMode;
    property KeyboardAcceleratorPlacementTarget: IDependencyObject read get_KeyboardAcceleratorPlacementTarget write put_KeyboardAcceleratorPlacementTarget;
    property KeyboardAccelerators: IVector_1__Input_IKeyboardAccelerator read get_KeyboardAccelerators;
    property Lights: IVector_1__IXamlLight read get_Lights;
    property ManipulationMode: Input_ManipulationModes read get_ManipulationMode write put_ManipulationMode;
    property Opacity: Double read get_Opacity write put_Opacity;
    property OpacityTransition: IScalarTransition read get_OpacityTransition write put_OpacityTransition;
    property PointerCaptures: IVectorView_1__Input_IPointer read get_PointerCaptures;
    property Projection: IProjection read get_Projection write put_Projection;
    property RasterizationScale: Double read get_RasterizationScale write put_RasterizationScale;
    property RenderSize: TSizeF read get_RenderSize;
    property RenderTransform: ITransform read get_RenderTransform write put_RenderTransform;
    property RenderTransformOrigin: TPointF read get_RenderTransformOrigin write put_RenderTransformOrigin;
    property Rotation: Single read get_Rotation write put_Rotation;
    property RotationAxis: Numerics_Vector3 read get_RotationAxis write put_RotationAxis;
    property RotationTransition: IScalarTransition read get_RotationTransition write put_RotationTransition;
    property Scale: Numerics_Vector3 read get_Scale write put_Scale;
    property ScaleTransition: IVector3Transition read get_ScaleTransition write put_ScaleTransition;
    property Shadow: IShadow read get_Shadow write put_Shadow;
    property TabFocusNavigation: Input_KeyboardNavigationMode read get_TabFocusNavigation write put_TabFocusNavigation;
    property TabIndex: Integer read get_TabIndex write put_TabIndex;
    property Transform3D: Media3D_ITransform3D read get_Transform3D write put_Transform3D;
    property TransformMatrix: Numerics_Matrix4x4 read get_TransformMatrix write put_TransformMatrix;
    property Transitions: IVector_1__Animation_ITransition read get_Transitions write put_Transitions;
    property Translation: Numerics_Vector3 read get_Translation write put_Translation;
    property TranslationTransition: IVector3Transition read get_TranslationTransition write put_TranslationTransition;
    property UseLayoutRounding: Boolean read get_UseLayoutRounding write put_UseLayoutRounding;
    property UseSystemFocusVisuals: Boolean read get_UseSystemFocusVisuals write put_UseSystemFocusVisuals;
    property Visibility_: Visibility read get_Visibility write put_Visibility;
    property XYFocusDown: IDependencyObject read get_XYFocusDown write put_XYFocusDown;
    property XYFocusDownNavigationStrategy: Input_XYFocusNavigationStrategy read get_XYFocusDownNavigationStrategy write put_XYFocusDownNavigationStrategy;
    property XYFocusKeyboardNavigation: Input_XYFocusKeyboardNavigationMode read get_XYFocusKeyboardNavigation write put_XYFocusKeyboardNavigation;
    property XYFocusLeft: IDependencyObject read get_XYFocusLeft write put_XYFocusLeft;
    property XYFocusLeftNavigationStrategy: Input_XYFocusNavigationStrategy read get_XYFocusLeftNavigationStrategy write put_XYFocusLeftNavigationStrategy;
    property XYFocusRight: IDependencyObject read get_XYFocusRight write put_XYFocusRight;
    property XYFocusRightNavigationStrategy: Input_XYFocusNavigationStrategy read get_XYFocusRightNavigationStrategy write put_XYFocusRightNavigationStrategy;
    property XYFocusUp: IDependencyObject read get_XYFocusUp write put_XYFocusUp;
    property XYFocusUpNavigationStrategy: Input_XYFocusNavigationStrategy read get_XYFocusUpNavigationStrategy write put_XYFocusUpNavigationStrategy;
    property XamlRoot: IXamlRoot read get_XamlRoot write put_XamlRoot;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IRectangleGeometry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RectangleGeometry)]
  IRectangleGeometry = interface(IInspectable)
  ['{B6143890-A5F5-54E0-AB42-D88BAB451F04}']
    function get_Rect: TRectF; safecall;
    procedure put_Rect(value: TRectF); safecall;
    property Rect: TRectF read get_Rect write put_Rect;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IProjection
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Projection)]
  IProjection = interface(IInspectable)
  ['{C95364B3-6058-5EE5-9E28-D38B7679FCD4}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.ITransform3D
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_Transform3D)]
  Media3D_ITransform3D = interface(IInspectable)
  ['{AFEA4941-2E49-533C-9F8F-2C126EF9893A}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IVector_1__Animation_ITransition_Base = interface(IInspectable)
  ['{030A9884-05DB-57AF-AE3B-4C77FFABFE57}']
    function GetAt(index: Cardinal): Animation_ITransition; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_ITransition; safecall;
    function IndexOf(value: Animation_ITransition; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_ITransition); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_ITransition); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_ITransition); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_ITransition): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_ITransition); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  // External
  IVector_1__Animation_ITransition = interface(IVector_1__Animation_ITransition_Base)
  ['{8A85BC0C-2C49-5AEE-BA20-06189A41E4E7}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ITransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Transition)]
  Animation_ITransition = interface(IInspectable)
  ['{E5B71956-8E44-5A38-B41E-274D706102BF}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  // External
  IVectorView_1__Animation_ITransition = interface(IInspectable)
  ['{78BA33F5-49D9-540F-BDA4-094C100C433D}']
    function GetAt(index: Cardinal): Animation_ITransition; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_ITransition; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_ITransition): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.ICacheMode
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CacheMode)]
  ICacheMode = interface(IInspectable)
  ['{2FF1A1CB-0F48-53FD-B1DE-E2223DFB2FF6}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IPointer>
  // External
  IVectorView_1__Input_IPointer = interface(IInspectable)
  ['{A649389F-C5CC-5803-8F93-0BEBF4105290}']
    function GetAt(index: Cardinal): Input_IPointer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Input_IPointer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IPointer): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.UI.Xaml.Input.IPointer
  // External
  Input_IPointer = interface(IInspectable)
  ['{1F9AFBF5-11A3-5E68-AA1B-72FEBFA0AB23}']
    function get_PointerId: Cardinal; safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_IsInContact: Boolean; safecall;
    function get_IsInRange: Boolean; safecall;
    property IsInContact: Boolean read get_IsInContact;
    property IsInRange: Boolean read get_IsInRange;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property PointerId: Cardinal read get_PointerId;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Primitives_FlyoutBase)]
  Primitives_IFlyoutBase = interface(IInspectable)
  ['{BB6603BF-744D-5C31-A87D-744394634D77}']
    function get_Placement: Primitives_FlyoutPlacementMode; safecall;
    procedure put_Placement(value: Primitives_FlyoutPlacementMode); safecall;
    function get_Target: IFrameworkElement; safecall;
    function get_AllowFocusOnInteraction: Boolean; safecall;
    procedure put_AllowFocusOnInteraction(value: Boolean); safecall;
    function get_LightDismissOverlayMode: LightDismissOverlayMode; safecall;
    procedure put_LightDismissOverlayMode(value: LightDismissOverlayMode); safecall;
    function get_AllowFocusWhenDisabled: Boolean; safecall;
    procedure put_AllowFocusWhenDisabled(value: Boolean); safecall;
    function get_ShowMode: Primitives_FlyoutShowMode; safecall;
    procedure put_ShowMode(value: Primitives_FlyoutShowMode); safecall;
    function get_InputDevicePrefersPrimaryCommands: Boolean; safecall;
    function get_AreOpenCloseAnimationsEnabled: Boolean; safecall;
    procedure put_AreOpenCloseAnimationsEnabled(value: Boolean); safecall;
    function get_ShouldConstrainToRootBounds: Boolean; safecall;
    procedure put_ShouldConstrainToRootBounds(value: Boolean); safecall;
    function get_IsConstrainedToRootBounds: Boolean; safecall;
    function get_ElementSoundMode: ElementSoundMode; safecall;
    procedure put_ElementSoundMode(value: ElementSoundMode); safecall;
    function get_OverlayInputPassThroughElement: IDependencyObject; safecall;
    procedure put_OverlayInputPassThroughElement(value: IDependencyObject); safecall;
    function get_IsOpen: Boolean; safecall;
    function get_XamlRoot: IXamlRoot; safecall;
    procedure put_XamlRoot(value: IXamlRoot); safecall;
    function add_Opened(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Opened(token: EventRegistrationToken); safecall;
    function add_Closed(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    function add_Opening(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Opening(token: EventRegistrationToken); safecall;
    function add_Closing(handler: TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closing(token: EventRegistrationToken); safecall;
    procedure ShowAt(placementTarget: IFrameworkElement); overload; safecall;
    procedure ShowAt(placementTarget: IDependencyObject; showOptions: Primitives_IFlyoutShowOptions); overload; safecall;
    procedure Hide; safecall;
    procedure TryInvokeKeyboardAccelerator(args: Input_IProcessKeyboardAcceleratorEventArgs); safecall;
    property AllowFocusOnInteraction: Boolean read get_AllowFocusOnInteraction write put_AllowFocusOnInteraction;
    property AllowFocusWhenDisabled: Boolean read get_AllowFocusWhenDisabled write put_AllowFocusWhenDisabled;
    property AreOpenCloseAnimationsEnabled: Boolean read get_AreOpenCloseAnimationsEnabled write put_AreOpenCloseAnimationsEnabled;
    property ElementSoundMode_: ElementSoundMode read get_ElementSoundMode write put_ElementSoundMode;
    property InputDevicePrefersPrimaryCommands: Boolean read get_InputDevicePrefersPrimaryCommands;
    property IsConstrainedToRootBounds: Boolean read get_IsConstrainedToRootBounds;
    property IsOpen: Boolean read get_IsOpen;
    property LightDismissOverlayMode_: LightDismissOverlayMode read get_LightDismissOverlayMode write put_LightDismissOverlayMode;
    property OverlayInputPassThroughElement: IDependencyObject read get_OverlayInputPassThroughElement write put_OverlayInputPassThroughElement;
    property Placement: Primitives_FlyoutPlacementMode read get_Placement write put_Placement;
    property ShouldConstrainToRootBounds: Boolean read get_ShouldConstrainToRootBounds write put_ShouldConstrainToRootBounds;
    property ShowMode: Primitives_FlyoutShowMode read get_ShowMode write put_ShowMode;
    property Target: IFrameworkElement read get_Target;
    property XamlRoot: IXamlRoot read get_XamlRoot write put_XamlRoot;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBase,Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs>
  TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{4451CA06-3E60-5C62-8749-2660907FB86C}']
    procedure Invoke(sender: Primitives_IFlyoutBase; args: Primitives_IFlyoutBaseClosingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBase,Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs>
  // External
  TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs = interface(TypedEventHandler_2__Primitives_IFlyoutBase__Primitives_IFlyoutBaseClosingEventArgs_Delegate_Base)
  ['{CBB70556-E94E-5CEF-B2BD-03675EE57B12}']
  end;

  // Microsoft.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs
  // External
  Primitives_IFlyoutBaseClosingEventArgs = interface(IInspectable)
  ['{7CB280B4-1CCA-5A5A-8EA4-191A2BBC8B32}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.Primitives.IFlyoutShowOptions
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Primitives_FlyoutShowOptions)]
  Primitives_IFlyoutShowOptions = interface(IInspectable)
  ['{30774A93-2803-50D3-B406-904AEC3E175D}']
    function get_Position: IReference_1__Point; safecall;
    procedure put_Position(value: IReference_1__Point); safecall;
    function get_ExclusionRect: IReference_1__Rect; safecall;
    procedure put_ExclusionRect(value: IReference_1__Rect); safecall;
    function get_ShowMode: Primitives_FlyoutShowMode; safecall;
    procedure put_ShowMode(value: Primitives_FlyoutShowMode); safecall;
    function get_Placement: Primitives_FlyoutPlacementMode; safecall;
    procedure put_Placement(value: Primitives_FlyoutPlacementMode); safecall;
    property ExclusionRect: IReference_1__Rect read get_ExclusionRect write put_ExclusionRect;
    property Placement: Primitives_FlyoutPlacementMode read get_Placement write put_Placement;
    property Position: IReference_1__Point read get_Position write put_Position;
    property ShowMode: Primitives_FlyoutShowMode read get_ShowMode write put_ShowMode;
  end;

  // Microsoft.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
  // External
  Input_IProcessKeyboardAcceleratorEventArgs = interface(IInspectable)
  ['{9BE0D058-3D26-5811-B50A-3BB80CA766C9}']
    function get_Key: VirtualKey; safecall;
    function get_Modifiers: VirtualKeyModifiers; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property Key: VirtualKey read get_Key;
    property Modifiers: VirtualKeyModifiers read get_Modifiers;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IVector_1__IXamlLight_Base = interface(IInspectable)
  ['{FB6065BB-83E0-57C0-AE7F-418FD763B0CE}']
    function GetAt(index: Cardinal): IXamlLight; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IXamlLight; safecall;
    function IndexOf(value: IXamlLight; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IXamlLight); safecall;
    procedure InsertAt(index: Cardinal; value: IXamlLight); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IXamlLight); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIXamlLight): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIXamlLight); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IXamlLight>
  // External
  IVector_1__IXamlLight = interface(IVector_1__IXamlLight_Base)
  ['{0AE340A2-8674-5625-90EE-A39E2DF9AE3B}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlLight
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlLight)]
  IXamlLight = interface(IInspectable)
  ['{DCD20139-8CD5-5DA5-A25C-2B7B813D8D58}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IXamlLight>
  // External
  IVectorView_1__IXamlLight = interface(IInspectable)
  ['{0EC88C15-CBB3-5D57-8F77-6B90464528B4}']
    function GetAt(index: Cardinal): IXamlLight; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IXamlLight; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIXamlLight): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IKeyboardAccelerator>
  IVector_1__Input_IKeyboardAccelerator_Base = interface(IInspectable)
  ['{0DB091C3-8538-5D25-937F-DB6E003E1F71}']
    function GetAt(index: Cardinal): Input_IKeyboardAccelerator; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Input_IKeyboardAccelerator; safecall;
    function IndexOf(value: Input_IKeyboardAccelerator; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Input_IKeyboardAccelerator); safecall;
    procedure InsertAt(index: Cardinal; value: Input_IKeyboardAccelerator); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Input_IKeyboardAccelerator); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IKeyboardAccelerator): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PInput_IKeyboardAccelerator); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IKeyboardAccelerator>
  // External
  IVector_1__Input_IKeyboardAccelerator = interface(IVector_1__Input_IKeyboardAccelerator_Base)
  ['{1F71005D-5662-5ED4-ABE8-5C8947A2EE4E}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IKeyboardAccelerator
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_KeyboardAccelerator)]
  Input_IKeyboardAccelerator = interface(IInspectable)
  ['{6F8BF1E2-4E91-5CF9-A6BE-4770CAF3D770}']
    function get_Key: VirtualKey; safecall;
    procedure put_Key(value: VirtualKey); safecall;
    function get_Modifiers: VirtualKeyModifiers; safecall;
    procedure put_Modifiers(value: VirtualKeyModifiers); safecall;
    function get_IsEnabled: Boolean; safecall;
    procedure put_IsEnabled(value: Boolean); safecall;
    function get_ScopeOwner: IDependencyObject; safecall;
    procedure put_ScopeOwner(value: IDependencyObject); safecall;
    function add_Invoked(handler: TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Invoked(token: EventRegistrationToken); safecall;
    property IsEnabled: Boolean read get_IsEnabled write put_IsEnabled;
    property Key: VirtualKey read get_Key write put_Key;
    property Modifiers: VirtualKeyModifiers read get_Modifiers write put_Modifiers;
    property ScopeOwner: IDependencyObject read get_ScopeOwner write put_ScopeOwner;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Input.IKeyboardAccelerator,Microsoft.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs>
  TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs_Delegate_Base = interface(IUnknown)
  ['{03E5CE6A-5F2D-59D0-B573-0989FE6AEAD9}']
    procedure Invoke(sender: Input_IKeyboardAccelerator; args: Input_IKeyboardAcceleratorInvokedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Input.IKeyboardAccelerator,Microsoft.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs>
  // External
  TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs = interface(TypedEventHandler_2__Input_IKeyboardAccelerator__Input_IKeyboardAcceleratorInvokedEventArgs_Delegate_Base)
  ['{A5688E76-DDC9-538B-8BA4-EB59DC8B6E07}']
  end;

  // Microsoft.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs
  // External
  Input_IKeyboardAcceleratorInvokedEventArgs = interface(IInspectable)
  ['{62C9FDB0-B574-527D-97EB-5C7F674441E0}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_Element: IDependencyObject; safecall;
    function get_KeyboardAccelerator: Input_IKeyboardAccelerator; safecall;
    property Element: IDependencyObject read get_Element;
    property Handled: Boolean read get_Handled write put_Handled;
    property KeyboardAccelerator: Input_IKeyboardAccelerator read get_KeyboardAccelerator;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IKeyboardAccelerator>
  // External
  IVectorView_1__Input_IKeyboardAccelerator = interface(IInspectable)
  ['{605BF4E5-AFA9-5678-ABB2-B4BEEBFB8C24}']
    function GetAt(index: Cardinal): Input_IKeyboardAccelerator; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Input_IKeyboardAccelerator; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IKeyboardAccelerator): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IScalarTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_ScalarTransition)]
  IScalarTransition = interface(IInspectable)
  ['{C2DA2AC8-814C-5889-B2F4-4EBE4B001EE3}']
    function get_Duration: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    property Duration: TimeSpan read get_Duration write put_Duration;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IVector3Transition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Vector3Transition)]
  IVector3Transition = interface(IInspectable)
  ['{0C408BB9-F9A2-55D7-8AED-143D36D603F2}']
    function get_Duration: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    function get_Components: Vector3TransitionComponents; safecall;
    procedure put_Components(value: Vector3TransitionComponents); safecall;
    property Components: Vector3TransitionComponents read get_Components write put_Components;
    property Duration: TimeSpan read get_Duration write put_Duration;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IShadow
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Shadow)]
  IShadow = interface(IInspectable)
  ['{CC12FD6A-50AA-5EB3-9A0E-B938B454C439}']
  end;

  // Microsoft.UI.Xaml.Input.KeyEventHandler
  // External
  Input_KeyEventHandler = interface(IUnknown)
  ['{DB68E7CC-9A2B-527D-9989-25284DACCC03}']
    procedure Invoke(sender: IInspectable; e: Input_IKeyRoutedEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Input.IKeyRoutedEventArgs
  // External
  Input_IKeyRoutedEventArgs = interface(IInspectable)
  ['{EE357007-A2D6-5C75-9431-05FD66EC7915}']
    function get_Key: VirtualKey; safecall;
    function get_KeyStatus: CorePhysicalKeyStatus; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_OriginalKey: VirtualKey; safecall;
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property Handled: Boolean read get_Handled write put_Handled;
    property Key: VirtualKey read get_Key;
    property KeyStatus: CorePhysicalKeyStatus read get_KeyStatus;
    property OriginalKey: VirtualKey read get_OriginalKey;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDragStartingEventArgs>
  TypedEventHandler_2__IUIElement__IDragStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{D0B66E28-3F45-5B7A-A768-188963BB76A4}']
    procedure Invoke(sender: IUIElement; args: IDragStartingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDragStartingEventArgs>
  // External
  TypedEventHandler_2__IUIElement__IDragStartingEventArgs = interface(TypedEventHandler_2__IUIElement__IDragStartingEventArgs_Delegate_Base)
  ['{ED8D0950-0C28-582D-8089-257B6C258158}']
  end;

  // Microsoft.UI.Xaml.IDragStartingEventArgs
  // External
  IDragStartingEventArgs = interface(IInspectable)
  ['{AD17BACE-9613-5666-A31B-79A73FBA77CF}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_Data: IDataPackage; safecall;
    function get_DragUI: IDragUI; safecall;
    function get_AllowedOperations: DataPackageOperation; safecall;
    procedure put_AllowedOperations(value: DataPackageOperation); safecall;
    function GetDeferral: IDragOperationDeferral; safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property AllowedOperations: DataPackageOperation read get_AllowedOperations write put_AllowedOperations;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property Data: IDataPackage read get_Data;
    property DragUI: IDragUI read get_DragUI;
  end;

  // Microsoft.UI.Xaml.IDragUI
  // External
  IDragUI = interface(IInspectable)
  ['{35F170E0-93BF-58DA-877A-8EC77D8D9F00}']
    procedure SetContentFromBitmapImage(bitmapImage: Imaging_IBitmapImage); overload; safecall;
    procedure SetContentFromBitmapImage(bitmapImage: Imaging_IBitmapImage; anchorPoint: TPointF); overload; safecall;
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap); overload; safecall;
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap; anchorPoint: TPointF); overload; safecall;
    procedure SetContentFromDataPackage; safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapImage
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapImage)]
  Imaging_IBitmapImage = interface(IInspectable)
  ['{5CC29916-A411-5BC2-A3C5-A00D99A59DA8}']
    function get_CreateOptions: Imaging_BitmapCreateOptions; safecall;
    procedure put_CreateOptions(value: Imaging_BitmapCreateOptions); safecall;
    function get_UriSource: IUriRuntimeClass; safecall;
    procedure put_UriSource(value: IUriRuntimeClass); safecall;
    function get_DecodePixelWidth: Integer; safecall;
    procedure put_DecodePixelWidth(value: Integer); safecall;
    function get_DecodePixelHeight: Integer; safecall;
    procedure put_DecodePixelHeight(value: Integer); safecall;
    function get_DecodePixelType: Imaging_DecodePixelType; safecall;
    procedure put_DecodePixelType(value: Imaging_DecodePixelType); safecall;
    function get_IsAnimatedBitmap: Boolean; safecall;
    function get_IsPlaying: Boolean; safecall;
    function get_AutoPlay: Boolean; safecall;
    procedure put_AutoPlay(value: Boolean); safecall;
    function add_DownloadProgress(handler: Imaging_DownloadProgressEventHandler): EventRegistrationToken; safecall;
    procedure remove_DownloadProgress(token: EventRegistrationToken); safecall;
    function add_ImageOpened(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ImageOpened(token: EventRegistrationToken); safecall;
    function add_ImageFailed(handler: ExceptionRoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ImageFailed(token: EventRegistrationToken); safecall;
    procedure Play; safecall;
    procedure Stop; safecall;
    property AutoPlay: Boolean read get_AutoPlay write put_AutoPlay;
    property CreateOptions: Imaging_BitmapCreateOptions read get_CreateOptions write put_CreateOptions;
    property DecodePixelHeight: Integer read get_DecodePixelHeight write put_DecodePixelHeight;
    property DecodePixelType: Imaging_DecodePixelType read get_DecodePixelType write put_DecodePixelType;
    property DecodePixelWidth: Integer read get_DecodePixelWidth write put_DecodePixelWidth;
    property IsAnimatedBitmap: Boolean read get_IsAnimatedBitmap;
    property IsPlaying: Boolean read get_IsPlaying;
    property UriSource: IUriRuntimeClass read get_UriSource write put_UriSource;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.DownloadProgressEventHandler
  // External
  Imaging_DownloadProgressEventHandler = interface(IUnknown)
  ['{9A8E4AF5-B124-5205-8AE9-3496E063C569}']
    procedure Invoke(sender: IInspectable; e: Imaging_IDownloadProgressEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs
  // External
  Imaging_IDownloadProgressEventArgs = interface(IInspectable)
  ['{9A0EA80B-1A17-50D5-83F3-377738212619}']
    function get_Progress: Integer; safecall;
    procedure put_Progress(value: Integer); safecall;
    property Progress: Integer read get_Progress write put_Progress;
  end;

  // Microsoft.UI.Xaml.ExceptionRoutedEventHandler
  // External
  ExceptionRoutedEventHandler = interface(IUnknown)
  ['{45FBB85D-54F9-5A2A-8A38-00A3B7761F96}']
    procedure Invoke(sender: IInspectable; e: IExceptionRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IExceptionRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_ExceptionRoutedEventArgs)]
  IExceptionRoutedEventArgs = interface(IInspectable)
  ['{E8BCB6D2-D3F5-5393-A84F-DFCD44A2DF34}']
    function get_ErrorMessage: HSTRING; safecall;
    property ErrorMessage: HSTRING read get_ErrorMessage;
  end;

  // Microsoft.UI.Xaml.IDragOperationDeferral
  // External
  IDragOperationDeferral = interface(IInspectable)
  ['{462C1880-FC6A-5035-8ABF-564BACB78158}']
    procedure Complete; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDropCompletedEventArgs>
  TypedEventHandler_2__IUIElement__IDropCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AC00806A-8954-51F5-9272-302F69B548E4}']
    procedure Invoke(sender: IUIElement; args: IDropCompletedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IDropCompletedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__IDropCompletedEventArgs = interface(TypedEventHandler_2__IUIElement__IDropCompletedEventArgs_Delegate_Base)
  ['{5FBDF9BD-B26A-54D1-876C-EB8596778246}']
  end;

  // Microsoft.UI.Xaml.IDropCompletedEventArgs
  // External
  IDropCompletedEventArgs = interface(IInspectable)
  ['{E700082D-C640-5D44-B23A-F213DFBEB245}']
    function get_DropResult: DataPackageOperation; safecall;
    property DropResult: DataPackageOperation read get_DropResult;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs>
  TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4F45A267-2B57-5EB1-B382-E542D5A19F7A}']
    procedure Invoke(sender: IUIElement; args: Input_ICharacterReceivedRoutedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs = interface(TypedEventHandler_2__IUIElement__Input_ICharacterReceivedRoutedEventArgs_Delegate_Base)
  ['{D6E874C2-AD2B-5888-A090-52641A5D7718}']
  end;

  // Microsoft.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs
  // External
  Input_ICharacterReceivedRoutedEventArgs = interface(IInspectable)
  ['{E26CA5BB-34C3-5C1E-9A16-00B80B07A899}']
    function get_Character: Char; safecall;
    function get_KeyStatus: CorePhysicalKeyStatus; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Character: Char read get_Character;
    property Handled: Boolean read get_Handled write put_Handled;
    property KeyStatus: CorePhysicalKeyStatus read get_KeyStatus;
  end;

  // Microsoft.UI.Xaml.DragEventHandler
  // External
  DragEventHandler = interface(IUnknown)
  ['{277AFC83-CB67-56C8-B601-1B9C0F1C3D32}']
    procedure Invoke(sender: IInspectable; e: IDragEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.IDragEventArgs
  // External
  IDragEventArgs = interface(IInspectable)
  ['{47AC5757-E4BC-52BA-8AB9-1BF81AAD7900}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_Data: IDataPackage; safecall;
    procedure put_Data(value: IDataPackage); safecall;
    function get_DataView: IDataPackageView; safecall;
    function get_DragUIOverride: IDragUIOverride; safecall;
    function get_Modifiers: DragDrop_DragDropModifiers; safecall;
    function get_AcceptedOperation: DataPackageOperation; safecall;
    procedure put_AcceptedOperation(value: DataPackageOperation); safecall;
    function get_AllowedOperations: DataPackageOperation; safecall;
    function GetDeferral: IDragOperationDeferral; safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property AcceptedOperation: DataPackageOperation read get_AcceptedOperation write put_AcceptedOperation;
    property AllowedOperations: DataPackageOperation read get_AllowedOperations;
    property Data: IDataPackage read get_Data write put_Data;
    property DataView: IDataPackageView read get_DataView;
    property DragUIOverride: IDragUIOverride read get_DragUIOverride;
    property Handled: Boolean read get_Handled write put_Handled;
    property Modifiers: DragDrop_DragDropModifiers read get_Modifiers;
  end;

  // Microsoft.UI.Xaml.IDragUIOverride
  // External
  IDragUIOverride = interface(IInspectable)
  ['{3260B18B-70DF-5DF2-B98A-56BEB0601F79}']
    function get_Caption: HSTRING; safecall;
    procedure put_Caption(value: HSTRING); safecall;
    function get_IsContentVisible: Boolean; safecall;
    procedure put_IsContentVisible(value: Boolean); safecall;
    function get_IsCaptionVisible: Boolean; safecall;
    procedure put_IsCaptionVisible(value: Boolean); safecall;
    function get_IsGlyphVisible: Boolean; safecall;
    procedure put_IsGlyphVisible(value: Boolean); safecall;
    procedure Clear; safecall;
    procedure SetContentFromBitmapImage(bitmapImage: Imaging_IBitmapImage); overload; safecall;
    procedure SetContentFromBitmapImage(bitmapImage: Imaging_IBitmapImage; anchorPoint: TPointF); overload; safecall;
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap); overload; safecall;
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap; anchorPoint: TPointF); overload; safecall;
    property Caption: HSTRING read get_Caption write put_Caption;
    property IsCaptionVisible: Boolean read get_IsCaptionVisible write put_IsCaptionVisible;
    property IsContentVisible: Boolean read get_IsContentVisible write put_IsContentVisible;
    property IsGlyphVisible: Boolean read get_IsGlyphVisible write put_IsGlyphVisible;
  end;

  // Microsoft.UI.Xaml.Input.PointerEventHandler
  // External
  Input_PointerEventHandler = interface(IUnknown)
  ['{A48A71E1-8BB4-5597-9E31-903A3F6A04FB}']
    procedure Invoke(sender: IInspectable; e: Input_IPointerRoutedEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Input.IPointerRoutedEventArgs
  // External
  Input_IPointerRoutedEventArgs = interface(IInspectable)
  ['{66E78A9A-1BEC-5F92-B1A1-EA6334EE511C}']
    function get_Pointer: Input_IPointer; safecall;
    function get_KeyModifiers: VirtualKeyModifiers; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_IsGenerated: Boolean; safecall;
    function GetCurrentPoint(relativeTo: IUIElement): IPointerPoint; safecall;
    function GetIntermediatePoints(relativeTo: IUIElement): IVector_1__IPointerPoint; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property IsGenerated: Boolean read get_IsGenerated;
    property KeyModifiers: VirtualKeyModifiers read get_KeyModifiers;
    property Pointer: Input_IPointer read get_Pointer;
  end;

  // Microsoft.UI.Input.IPointerPoint
  // External
  IPointerPoint = interface(IInspectable)
  ['{0D430EE6-252C-59A4-B2A2-D44264DC6A40}']
    function get_FrameId: Cardinal; safecall;
    function get_IsInContact: Boolean; safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_PointerId: Cardinal; safecall;
    function get_Position: TPointF; safecall;
    function get_Properties: IPointerPointProperties; safecall;
    function get_Timestamp: UInt64; safecall;
    function GetTransformedPoint(transform: IPointerPointTransform): IPointerPoint; safecall;
    property FrameId: Cardinal read get_FrameId;
    property IsInContact: Boolean read get_IsInContact;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property PointerId: Cardinal read get_PointerId;
    property Position: TPointF read get_Position;
    property Properties: IPointerPointProperties read get_Properties;
    property Timestamp: UInt64 read get_Timestamp;
  end;

  // Microsoft.UI.Input.IPointerPointProperties
  // External
  IPointerPointProperties = interface(IInspectable)
  ['{D760ED77-4B10-57A5-B3CC-D9BF3413E996}']
    function get_ContactRect: TRectF; safecall;
    function get_IsBarrelButtonPressed: Boolean; safecall;
    function get_IsCanceled: Boolean; safecall;
    function get_IsEraser: Boolean; safecall;
    function get_IsHorizontalMouseWheel: Boolean; safecall;
    function get_IsInRange: Boolean; safecall;
    function get_IsInverted: Boolean; safecall;
    function get_IsLeftButtonPressed: Boolean; safecall;
    function get_IsMiddleButtonPressed: Boolean; safecall;
    function get_IsPrimary: Boolean; safecall;
    function get_IsRightButtonPressed: Boolean; safecall;
    function get_IsXButton1Pressed: Boolean; safecall;
    function get_IsXButton2Pressed: Boolean; safecall;
    function get_MouseWheelDelta: Integer; safecall;
    function get_Orientation: Single; safecall;
    function get_PointerUpdateKind: PointerUpdateKind; safecall;
    function get_Pressure: Single; safecall;
    function get_TouchConfidence: Boolean; safecall;
    function get_Twist: Single; safecall;
    function get_XTilt: Single; safecall;
    function get_YTilt: Single; safecall;
    property ContactRect: TRectF read get_ContactRect;
    property IsBarrelButtonPressed: Boolean read get_IsBarrelButtonPressed;
    property IsCanceled: Boolean read get_IsCanceled;
    property IsEraser: Boolean read get_IsEraser;
    property IsHorizontalMouseWheel: Boolean read get_IsHorizontalMouseWheel;
    property IsInRange: Boolean read get_IsInRange;
    property IsInverted: Boolean read get_IsInverted;
    property IsLeftButtonPressed: Boolean read get_IsLeftButtonPressed;
    property IsMiddleButtonPressed: Boolean read get_IsMiddleButtonPressed;
    property IsPrimary: Boolean read get_IsPrimary;
    property IsRightButtonPressed: Boolean read get_IsRightButtonPressed;
    property IsXButton1Pressed: Boolean read get_IsXButton1Pressed;
    property IsXButton2Pressed: Boolean read get_IsXButton2Pressed;
    property MouseWheelDelta: Integer read get_MouseWheelDelta;
    property Orientation: Single read get_Orientation;
    property PointerUpdateKind_: PointerUpdateKind read get_PointerUpdateKind;
    property Pressure: Single read get_Pressure;
    property TouchConfidence: Boolean read get_TouchConfidence;
    property Twist: Single read get_Twist;
    property XTilt: Single read get_XTilt;
    property YTilt: Single read get_YTilt;
  end;

  // Microsoft.UI.Input.IPointerPointTransform
  // External
  IPointerPointTransform = interface(IInspectable)
  ['{DB4791BC-994D-54C7-92EF-66EA1DE9B43C}']
    function get_Inverse: IPointerPointTransform; safecall;
    function TryTransform(inPoint: TPointF; out outPoint: TPointF): Boolean; safecall;
    function TryTransformBounds(inRect: TRectF; out outRect: TRectF): Boolean; safecall;
    property Inverse: IPointerPointTransform read get_Inverse;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Input.IPointerPoint>
  IVector_1__IPointerPoint_Base = interface(IInspectable)
  ['{8220CF33-5D76-5607-BB7D-B7CD07D27F33}']
    function GetAt(index: Cardinal): IPointerPoint; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPointerPoint; safecall;
    function IndexOf(value: IPointerPoint; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPointerPoint); safecall;
    procedure InsertAt(index: Cardinal; value: IPointerPoint); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPointerPoint); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPointerPoint); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Input.IPointerPoint>
  // External
  IVector_1__IPointerPoint = interface(IVector_1__IPointerPoint_Base)
  ['{FA37528E-D183-506D-9EF1-9B424365F170}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Input.IPointerPoint>
  // External
  IVectorView_1__IPointerPoint = interface(IInspectable)
  ['{96627E73-71DB-57AA-AB04-E317BB73FFB8}']
    function GetAt(index: Cardinal): IPointerPoint; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPointerPoint; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.UI.Xaml.Input.TappedEventHandler
  // External
  Input_TappedEventHandler = interface(IUnknown)
  ['{B60074F3-125B-534E-8F9C-9769BD3F0F64}']
    procedure Invoke(sender: IInspectable; e: Input_ITappedRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.ITappedRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_TappedRoutedEventArgs)]
  Input_ITappedRoutedEventArgs = interface(IInspectable)
  ['{73F74B8C-3709-547E-8E0C-51C03C89126A}']
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
  end;

  // Microsoft.UI.Xaml.Input.DoubleTappedEventHandler
  // External
  Input_DoubleTappedEventHandler = interface(IUnknown)
  ['{F7A501B9-E277-5611-87B0-0E0607622183}']
    procedure Invoke(sender: IInspectable; e: Input_IDoubleTappedRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IDoubleTappedRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_DoubleTappedRoutedEventArgs)]
  Input_IDoubleTappedRoutedEventArgs = interface(IInspectable)
  ['{32B9549D-11D8-53A5-A953-02409537A11F}']
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
  end;

  // Microsoft.UI.Xaml.Input.HoldingEventHandler
  // External
  Input_HoldingEventHandler = interface(IUnknown)
  ['{FE23C5BD-4984-56B6-B92B-FC9D1216B24E}']
    procedure Invoke(sender: IInspectable; e: Input_IHoldingRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IHoldingRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_HoldingRoutedEventArgs)]
  Input_IHoldingRoutedEventArgs = interface(IInspectable)
  ['{8272A4B2-2221-551E-B0BB-16E29138AB20}']
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_HoldingState: HoldingState; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property HoldingState_: HoldingState read get_HoldingState;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IContextRequestedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{0C81075C-3BD9-5C90-BD8A-2A89BC154F35}']
    procedure Invoke(sender: IUIElement; args: Input_IContextRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IContextRequestedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IContextRequestedEventArgs_Delegate_Base)
  ['{E65C1EBE-5892-5C64-AF2B-739B37B65D60}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IContextRequestedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ContextRequestedEventArgs)]
  Input_IContextRequestedEventArgs = interface(IInspectable)
  ['{BCEDCB98-77B5-53C0-802E-FD52F3806E51}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function TryGetPosition(relativeTo: IUIElement; out point: TPointF): Boolean; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IRoutedEventArgs>
  TypedEventHandler_2__IUIElement__IRoutedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9EB51482-569E-56C5-90E9-8178E2F6E531}']
    procedure Invoke(sender: IUIElement; args: IRoutedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IRoutedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__IRoutedEventArgs = interface(TypedEventHandler_2__IUIElement__IRoutedEventArgs_Delegate_Base)
  ['{7ABF34D6-F776-51DA-9C0F-85FE183E2016}']
  end;

  // Microsoft.UI.Xaml.Input.RightTappedEventHandler
  // External
  Input_RightTappedEventHandler = interface(IUnknown)
  ['{5070E32F-3DC7-56CF-8FDD-DE1B40D0B472}']
    procedure Invoke(sender: IInspectable; e: Input_IRightTappedRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IRightTappedRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_RightTappedRoutedEventArgs)]
  Input_IRightTappedRoutedEventArgs = interface(IInspectable)
  ['{3972FAFB-2915-5C62-BB6B-54AD84FF400D}']
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function GetPosition(relativeTo: IUIElement): TPointF; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
  end;

  // Microsoft.UI.Xaml.Input.ManipulationStartingEventHandler
  // External
  Input_ManipulationStartingEventHandler = interface(IUnknown)
  ['{44F528F1-F0E4-505C-A0BB-0C4839B29DF5}']
    procedure Invoke(sender: IInspectable; e: Input_IManipulationStartingRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationStartingRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationStartingRoutedEventArgs)]
  Input_IManipulationStartingRoutedEventArgs = interface(IInspectable)
  ['{93A99F86-F5A0-5326-91B0-851C897AF79F}']
    function get_Mode: Input_ManipulationModes; safecall;
    procedure put_Mode(value: Input_ManipulationModes); safecall;
    function get_Container: IUIElement; safecall;
    procedure put_Container(value: IUIElement); safecall;
    function get_Pivot: Input_IManipulationPivot; safecall;
    procedure put_Pivot(value: Input_IManipulationPivot); safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Container: IUIElement read get_Container write put_Container;
    property Handled: Boolean read get_Handled write put_Handled;
    property Mode: Input_ManipulationModes read get_Mode write put_Mode;
    property Pivot: Input_IManipulationPivot read get_Pivot write put_Pivot;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationPivot
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationPivot)]
  Input_IManipulationPivot = interface(IInspectable)
  ['{286BABA4-313D-507C-ADC5-F739732CEA27}']
    function get_Center: TPointF; safecall;
    procedure put_Center(value: TPointF); safecall;
    function get_Radius: Double; safecall;
    procedure put_Radius(value: Double); safecall;
    property Center: TPointF read get_Center write put_Center;
    property Radius: Double read get_Radius write put_Radius;
  end;

  // Microsoft.UI.Xaml.Input.ManipulationInertiaStartingEventHandler
  // External
  Input_ManipulationInertiaStartingEventHandler = interface(IUnknown)
  ['{5DE296BD-6F1C-5F60-9180-10705282576C}']
    procedure Invoke(sender: IInspectable; e: Input_IManipulationInertiaStartingRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationInertiaStartingRoutedEventArgs)]
  Input_IManipulationInertiaStartingRoutedEventArgs = interface(IInspectable)
  ['{17D510BE-5514-5952-9AFD-959B60AB9394}']
    function get_Container: IUIElement; safecall;
    function get_ExpansionBehavior: Input_IInertiaExpansionBehavior; safecall;
    procedure put_ExpansionBehavior(value: Input_IInertiaExpansionBehavior); safecall;
    function get_RotationBehavior: Input_IInertiaRotationBehavior; safecall;
    procedure put_RotationBehavior(value: Input_IInertiaRotationBehavior); safecall;
    function get_TranslationBehavior: Input_IInertiaTranslationBehavior; safecall;
    procedure put_TranslationBehavior(value: Input_IInertiaTranslationBehavior); safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_Delta: ManipulationDelta; safecall;
    function get_Cumulative: ManipulationDelta; safecall;
    function get_Velocities: ManipulationVelocities; safecall;
    property Container: IUIElement read get_Container;
    property Cumulative: ManipulationDelta read get_Cumulative;
    property Delta: ManipulationDelta read get_Delta;
    property ExpansionBehavior: Input_IInertiaExpansionBehavior read get_ExpansionBehavior write put_ExpansionBehavior;
    property Handled: Boolean read get_Handled write put_Handled;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property RotationBehavior: Input_IInertiaRotationBehavior read get_RotationBehavior write put_RotationBehavior;
    property TranslationBehavior: Input_IInertiaTranslationBehavior read get_TranslationBehavior write put_TranslationBehavior;
    property Velocities: ManipulationVelocities read get_Velocities;
  end;

  // Microsoft.UI.Xaml.Input.IInertiaExpansionBehavior
  // External
  Input_IInertiaExpansionBehavior = interface(IInspectable)
  ['{D60029B7-F0CD-5AEA-ABE5-7410D09118C6}']
    function get_DesiredDeceleration: Double; safecall;
    procedure put_DesiredDeceleration(value: Double); safecall;
    function get_DesiredExpansion: Double; safecall;
    procedure put_DesiredExpansion(value: Double); safecall;
    property DesiredDeceleration: Double read get_DesiredDeceleration write put_DesiredDeceleration;
    property DesiredExpansion: Double read get_DesiredExpansion write put_DesiredExpansion;
  end;

  // Microsoft.UI.Xaml.Input.IInertiaRotationBehavior
  // External
  Input_IInertiaRotationBehavior = interface(IInspectable)
  ['{27B4BD03-9149-5691-BCE5-FA33B32C4A81}']
    function get_DesiredDeceleration: Double; safecall;
    procedure put_DesiredDeceleration(value: Double); safecall;
    function get_DesiredRotation: Double; safecall;
    procedure put_DesiredRotation(value: Double); safecall;
    property DesiredDeceleration: Double read get_DesiredDeceleration write put_DesiredDeceleration;
    property DesiredRotation: Double read get_DesiredRotation write put_DesiredRotation;
  end;

  // Microsoft.UI.Xaml.Input.IInertiaTranslationBehavior
  // External
  Input_IInertiaTranslationBehavior = interface(IInspectable)
  ['{D4F91CF5-3317-5914-B25A-EA6EE55B96D0}']
    function get_DesiredDeceleration: Double; safecall;
    procedure put_DesiredDeceleration(value: Double); safecall;
    function get_DesiredDisplacement: Double; safecall;
    procedure put_DesiredDisplacement(value: Double); safecall;
    property DesiredDeceleration: Double read get_DesiredDeceleration write put_DesiredDeceleration;
    property DesiredDisplacement: Double read get_DesiredDisplacement write put_DesiredDisplacement;
  end;

  // Microsoft.UI.Xaml.Input.ManipulationStartedEventHandler
  // External
  Input_ManipulationStartedEventHandler = interface(IUnknown)
  ['{41060669-304C-53AC-9D43-BC311235AAE4}']
    procedure Invoke(sender: IInspectable; e: Input_IManipulationStartedRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationStartedRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationStartedRoutedEventArgs)]
  Input_IManipulationStartedRoutedEventArgs = interface(IInspectable)
  ['{61857950-5821-5652-9FDF-C6277C5886F5}']
    function get_Container: IUIElement; safecall;
    function get_Position: TPointF; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    function get_Cumulative: ManipulationDelta; safecall;
    procedure Complete; safecall;
    property Container: IUIElement read get_Container;
    property Cumulative: ManipulationDelta read get_Cumulative;
    property Handled: Boolean read get_Handled write put_Handled;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property Position: TPointF read get_Position;
  end;

  // Microsoft.UI.Xaml.Input.ManipulationDeltaEventHandler
  // External
  Input_ManipulationDeltaEventHandler = interface(IUnknown)
  ['{83F2D4CE-105F-5392-A38A-B7467B7C2EA5}']
    procedure Invoke(sender: IInspectable; e: Input_IManipulationDeltaRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationDeltaRoutedEventArgs)]
  Input_IManipulationDeltaRoutedEventArgs = interface(IInspectable)
  ['{51369745-960F-54AC-93FA-763D22910DEA}']
    function get_Container: IUIElement; safecall;
    function get_Position: TPointF; safecall;
    function get_IsInertial: Boolean; safecall;
    function get_Delta: ManipulationDelta; safecall;
    function get_Cumulative: ManipulationDelta; safecall;
    function get_Velocities: ManipulationVelocities; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    procedure Complete; safecall;
    property Container: IUIElement read get_Container;
    property Cumulative: ManipulationDelta read get_Cumulative;
    property Delta: ManipulationDelta read get_Delta;
    property Handled: Boolean read get_Handled write put_Handled;
    property IsInertial: Boolean read get_IsInertial;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property Position: TPointF read get_Position;
    property Velocities: ManipulationVelocities read get_Velocities;
  end;

  // Microsoft.UI.Xaml.Input.ManipulationCompletedEventHandler
  // External
  Input_ManipulationCompletedEventHandler = interface(IUnknown)
  ['{D51DF8DB-71CD-5BFD-8426-767218EE55EC}']
    procedure Invoke(sender: IInspectable; e: Input_IManipulationCompletedRoutedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_ManipulationCompletedRoutedEventArgs)]
  Input_IManipulationCompletedRoutedEventArgs = interface(IInspectable)
  ['{E3BE9E4E-C5FB-5859-A81D-CE12FC3A2F4D}']
    function get_Container: IUIElement; safecall;
    function get_Position: TPointF; safecall;
    function get_IsInertial: Boolean; safecall;
    function get_Cumulative: ManipulationDelta; safecall;
    function get_Velocities: ManipulationVelocities; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_PointerDeviceType: PointerDeviceType; safecall;
    property Container: IUIElement read get_Container;
    property Cumulative: ManipulationDelta read get_Cumulative;
    property Handled: Boolean read get_Handled write put_Handled;
    property IsInertial: Boolean read get_IsInertial;
    property PointerDeviceType_: PointerDeviceType read get_PointerDeviceType;
    property Position: TPointF read get_Position;
    property Velocities: ManipulationVelocities read get_Velocities;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1AF43211-0169-57E1-AA0E-4043EC09DEDD}']
    procedure Invoke(sender: IUIElement; args: Input_IAccessKeyDisplayRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayRequestedEventArgs_Delegate_Base)
  ['{FEE17481-1556-516A-8B14-064AA929297C}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_AccessKeyDisplayRequestedEventArgs)]
  Input_IAccessKeyDisplayRequestedEventArgs = interface(IInspectable)
  ['{C4ED84D8-2B27-59B1-9CF0-7F9164DE58CB}']
    function get_PressedKeys: HSTRING; safecall;
    property PressedKeys: HSTRING read get_PressedKeys;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9706B7EA-14D5-5EFA-843B-0D437E792E65}']
    procedure Invoke(sender: IUIElement; args: Input_IAccessKeyDisplayDismissedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IAccessKeyDisplayDismissedEventArgs_Delegate_Base)
  ['{9E2563FF-86F5-5687-91C0-ABACEA288CDC}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_AccessKeyDisplayDismissedEventArgs)]
  Input_IAccessKeyDisplayDismissedEventArgs = interface(IInspectable)
  ['{125A83D8-7F86-5EA9-9063-B9407E644587}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyInvokedEventArgs>
  TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8BF3906B-8DFE-5709-AC7E-340F67104BCA}']
    procedure Invoke(sender: IUIElement; args: Input_IAccessKeyInvokedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IAccessKeyInvokedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IAccessKeyInvokedEventArgs_Delegate_Base)
  ['{75003723-E476-536C-8A3E-9F67AF1A7D40}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IAccessKeyInvokedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_AccessKeyInvokedEventArgs)]
  Input_IAccessKeyInvokedEventArgs = interface(IInspectable)
  ['{D00C11A4-F9FB-5707-9692-98B80BB8546D}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Handled: Boolean read get_Handled write put_Handled;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs>
  TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs_Delegate_Base = interface(IUnknown)
  ['{244BDA89-86C4-5026-AC7F-973C0971EE7A}']
    procedure Invoke(sender: IUIElement; args: Input_IProcessKeyboardAcceleratorEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IProcessKeyboardAcceleratorEventArgs_Delegate_Base)
  ['{9811094F-468D-59A4-9CB6-2487122992CF}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IGettingFocusEventArgs>
  TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs_Delegate_Base = interface(IUnknown)
  ['{0871EEAB-8A3D-5E0B-875C-7949F209AA19}']
    procedure Invoke(sender: IUIElement; args: Input_IGettingFocusEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.IGettingFocusEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs = interface(TypedEventHandler_2__IUIElement__Input_IGettingFocusEventArgs_Delegate_Base)
  ['{3F5783FE-A5BB-59B2-BB0E-4F7B45E2A1B7}']
  end;

  // Microsoft.UI.Xaml.Input.IGettingFocusEventArgs
  // External
  Input_IGettingFocusEventArgs = interface(IInspectable)
  ['{37FD3AF0-BD3C-5BF5-A9CD-71A1E87AF950}']
    function get_OldFocusedElement: IDependencyObject; safecall;
    function get_NewFocusedElement: IDependencyObject; safecall;
    procedure put_NewFocusedElement(value: IDependencyObject); safecall;
    function get_FocusState: FocusState; safecall;
    function get_Direction: Input_FocusNavigationDirection; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_InputDevice: Input_FocusInputDeviceKind; safecall;
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_CorrelationId: TGuid; safecall;
    function TryCancel: Boolean; safecall;
    function TrySetNewFocusedElement(element: IDependencyObject): Boolean; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property CorrelationId: TGuid read get_CorrelationId;
    property Direction: Input_FocusNavigationDirection read get_Direction;
    property FocusState_: FocusState read get_FocusState;
    property Handled: Boolean read get_Handled write put_Handled;
    property InputDevice: Input_FocusInputDeviceKind read get_InputDevice;
    property NewFocusedElement: IDependencyObject read get_NewFocusedElement write put_NewFocusedElement;
    property OldFocusedElement: IDependencyObject read get_OldFocusedElement;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ILosingFocusEventArgs>
  TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs_Delegate_Base = interface(IUnknown)
  ['{3A87AEDA-6EA2-511E-86E8-CA79E0E3E4E7}']
    procedure Invoke(sender: IUIElement; args: Input_ILosingFocusEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.ILosingFocusEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs = interface(TypedEventHandler_2__IUIElement__Input_ILosingFocusEventArgs_Delegate_Base)
  ['{3E1FEAD0-5D5B-5D0B-A279-9E2EBD157335}']
  end;

  // Microsoft.UI.Xaml.Input.ILosingFocusEventArgs
  // External
  Input_ILosingFocusEventArgs = interface(IInspectable)
  ['{FA0E5FFA-2B1B-52F8-BB66-E35F51E73CF3}']
    function get_OldFocusedElement: IDependencyObject; safecall;
    function get_NewFocusedElement: IDependencyObject; safecall;
    procedure put_NewFocusedElement(value: IDependencyObject); safecall;
    function get_FocusState: FocusState; safecall;
    function get_Direction: Input_FocusNavigationDirection; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_InputDevice: Input_FocusInputDeviceKind; safecall;
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_CorrelationId: TGuid; safecall;
    function TryCancel: Boolean; safecall;
    function TrySetNewFocusedElement(element: IDependencyObject): Boolean; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property CorrelationId: TGuid read get_CorrelationId;
    property Direction: Input_FocusNavigationDirection read get_Direction;
    property FocusState_: FocusState read get_FocusState;
    property Handled: Boolean read get_Handled write put_Handled;
    property InputDevice: Input_FocusInputDeviceKind read get_InputDevice;
    property NewFocusedElement: IDependencyObject read get_NewFocusedElement write put_NewFocusedElement;
    property OldFocusedElement: IDependencyObject read get_OldFocusedElement;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.INoFocusCandidateFoundEventArgs>
  TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs_Delegate_Base = interface(IUnknown)
  ['{1C4706D5-217E-5C28-9172-2C0EE137B986}']
    procedure Invoke(sender: IUIElement; args: Input_INoFocusCandidateFoundEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.Input.INoFocusCandidateFoundEventArgs>
  // External
  TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs = interface(TypedEventHandler_2__IUIElement__Input_INoFocusCandidateFoundEventArgs_Delegate_Base)
  ['{0F9DAB0E-9F9A-5959-B453-E66BD828C702}']
  end;

  // Microsoft.UI.Xaml.Input.INoFocusCandidateFoundEventArgs
  // External
  Input_INoFocusCandidateFoundEventArgs = interface(IInspectable)
  ['{A2D7153A-CD2A-59CB-A574-AC82E30B9201}']
    function get_Direction: Input_FocusNavigationDirection; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_InputDevice: Input_FocusInputDeviceKind; safecall;
    property Direction: Input_FocusNavigationDirection read get_Direction;
    property Handled: Boolean read get_Handled write put_Handled;
    property InputDevice: Input_FocusInputDeviceKind read get_InputDevice;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IBringIntoViewRequestedEventArgs>
  TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{239588E3-453A-5E9A-BC37-A08803F53F22}']
    procedure Invoke(sender: IUIElement; args: IBringIntoViewRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IUIElement,Microsoft.UI.Xaml.IBringIntoViewRequestedEventArgs>
  // External
  TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs = interface(TypedEventHandler_2__IUIElement__IBringIntoViewRequestedEventArgs_Delegate_Base)
  ['{A8EDBF9F-84EA-58D5-B578-5CF297797D0A}']
  end;

  // Microsoft.UI.Xaml.IBringIntoViewRequestedEventArgs
  // External
  IBringIntoViewRequestedEventArgs = interface(IInspectable)
  ['{807DE8F9-B1DC-5A63-8101-5EE966841A27}']
    function get_TargetElement: IUIElement; safecall;
    procedure put_TargetElement(value: IUIElement); safecall;
    function get_AnimationDesired: Boolean; safecall;
    procedure put_AnimationDesired(value: Boolean); safecall;
    function get_TargetRect: TRectF; safecall;
    procedure put_TargetRect(value: TRectF); safecall;
    function get_HorizontalAlignmentRatio: Double; safecall;
    function get_VerticalAlignmentRatio: Double; safecall;
    function get_HorizontalOffset: Double; safecall;
    procedure put_HorizontalOffset(value: Double); safecall;
    function get_VerticalOffset: Double; safecall;
    procedure put_VerticalOffset(value: Double); safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property AnimationDesired: Boolean read get_AnimationDesired write put_AnimationDesired;
    property Handled: Boolean read get_Handled write put_Handled;
    property HorizontalAlignmentRatio: Double read get_HorizontalAlignmentRatio;
    property HorizontalOffset: Double read get_HorizontalOffset write put_HorizontalOffset;
    property TargetElement: IUIElement read get_TargetElement write put_TargetElement;
    property TargetRect: TRectF read get_TargetRect write put_TargetRect;
    property VerticalAlignmentRatio: Double read get_VerticalAlignmentRatio;
    property VerticalOffset: Double read get_VerticalOffset write put_VerticalOffset;
  end;

  // Microsoft.UI.Xaml.IRoutedEvent
  // External
  IRoutedEvent = interface(IInspectable)
  ['{B2B432BC-EFCA-575E-9D2A-703F8B9C380F}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.IGeneralTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GeneralTransform)]
  IGeneralTransform = interface(IInspectable)
  ['{04EEDEEB-31E5-54C0-AE3F-8BD06645D339}']
    function get_Inverse: IGeneralTransform; safecall;
    function TransformPoint(point: TPointF): TPointF; safecall;
    function TryTransform(inPoint: TPointF; out outPoint: TPointF): Boolean; safecall;
    function TransformBounds(rect: TRectF): TRectF; safecall;
    property Inverse: IGeneralTransform read get_Inverse;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IBringIntoViewOptions
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_BringIntoViewOptions)]
  IBringIntoViewOptions = interface(IInspectable)
  ['{EEB4A447-EB9E-5003-A479-B9E3A886B708}']
    function get_AnimationDesired: Boolean; safecall;
    procedure put_AnimationDesired(value: Boolean); safecall;
    function get_TargetRect: IReference_1__Rect; safecall;
    procedure put_TargetRect(value: IReference_1__Rect); safecall;
    function get_HorizontalAlignmentRatio: Double; safecall;
    procedure put_HorizontalAlignmentRatio(value: Double); safecall;
    function get_VerticalAlignmentRatio: Double; safecall;
    procedure put_VerticalAlignmentRatio(value: Double); safecall;
    function get_HorizontalOffset: Double; safecall;
    procedure put_HorizontalOffset(value: Double); safecall;
    function get_VerticalOffset: Double; safecall;
    procedure put_VerticalOffset(value: Double); safecall;
    property AnimationDesired: Boolean read get_AnimationDesired write put_AnimationDesired;
    property HorizontalAlignmentRatio: Double read get_HorizontalAlignmentRatio write put_HorizontalAlignmentRatio;
    property HorizontalOffset: Double read get_HorizontalOffset write put_HorizontalOffset;
    property TargetRect: IReference_1__Rect read get_TargetRect write put_TargetRect;
    property VerticalAlignmentRatio: Double read get_VerticalAlignmentRatio write put_VerticalAlignmentRatio;
    property VerticalOffset: Double read get_VerticalOffset write put_VerticalOffset;
  end;

  // Microsoft.UI.Composition.ICompositionAnimationBase
  // External
  ICompositionAnimationBase = interface(IInspectable)
  ['{A77C0E5A-F059-4E85-BCEF-C068694CEC78}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IXamlRoot,Microsoft.UI.Xaml.IXamlRootChangedEventArgs>
  TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CE4605E8-4D3E-58A2-8AA0-2FACA17873E8}']
    procedure Invoke(sender: IXamlRoot; args: IXamlRootChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.IXamlRoot,Microsoft.UI.Xaml.IXamlRootChangedEventArgs>
  // External
  TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs = interface(TypedEventHandler_2__IXamlRoot__IXamlRootChangedEventArgs_Delegate_Base)
  ['{F8E4FF95-353C-5B46-8427-7866F42FF414}']
  end;

  // Microsoft.UI.Xaml.IXamlRootChangedEventArgs
  // External
  IXamlRootChangedEventArgs = interface(IInspectable)
  ['{61D2C719-F8A1-515A-902C-CFA498BA7A7F}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.ICommand
  // External
  Input_ICommand = interface(IInspectable)
  ['{E5AF3542-CA67-4081-995B-709DD13792DF}']
    function add_CanExecuteChanged(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CanExecuteChanged(token: EventRegistrationToken); safecall;
    function CanExecute(parameter: IInspectable): Boolean; safecall;
    procedure Execute(parameter: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IDataTemplate
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_DataTemplate)]
  IDataTemplate = interface(IInspectable)
  ['{08FA70FA-EE75-5E92-A101-F52D0E1E9FAB}']
    function LoadContent: IDependencyObject; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Object>
  TypedEventHandler_2__IInfoBar__IInspectable_Delegate_Base = interface(IUnknown)
  ['{457AEE71-8C97-5643-85BC-5F73F7864B77}']
    procedure Invoke(sender: IInfoBar; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Object>
  // External
  TypedEventHandler_2__IInfoBar__IInspectable = interface(TypedEventHandler_2__IInfoBar__IInspectable_Delegate_Base)
  ['{2F34EFB7-7D18-5323-89A8-6952067B897B}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IInfoBar
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_InfoBar)]
  IInfoBar = interface(IInspectable)
  ['{C1C3A438-DD79-5D22-9E42-5A3CDF8113A9}']
    function get_IsOpen: Boolean; safecall;
    procedure put_IsOpen(value: Boolean); safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Message: HSTRING; safecall;
    procedure put_Message(value: HSTRING); safecall;
    function get_Severity: InfoBarSeverity; safecall;
    procedure put_Severity(value: InfoBarSeverity); safecall;
    function get_IconSource: IIconSource; safecall;
    procedure put_IconSource(value: IIconSource); safecall;
    function get_IsIconVisible: Boolean; safecall;
    procedure put_IsIconVisible(value: Boolean); safecall;
    function get_IsClosable: Boolean; safecall;
    procedure put_IsClosable(value: Boolean); safecall;
    function get_CloseButtonStyle: IStyle; safecall;
    procedure put_CloseButtonStyle(value: IStyle); safecall;
    function get_CloseButtonCommand: Input_ICommand; safecall;
    procedure put_CloseButtonCommand(value: Input_ICommand); safecall;
    function get_CloseButtonCommandParameter: IInspectable; safecall;
    procedure put_CloseButtonCommandParameter(value: IInspectable); safecall;
    function get_ActionButton: Primitives_IButtonBase; safecall;
    procedure put_ActionButton(value: Primitives_IButtonBase); safecall;
    function get_Content: IInspectable; safecall;
    procedure put_Content(value: IInspectable); safecall;
    function get_ContentTemplate: IDataTemplate; safecall;
    procedure put_ContentTemplate(value: IDataTemplate); safecall;
    function get_TemplateSettings: IInfoBarTemplateSettings; safecall;
    function add_CloseButtonClick(handler: TypedEventHandler_2__IInfoBar__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CloseButtonClick(token: EventRegistrationToken); safecall;
    function add_Closing(handler: TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closing(token: EventRegistrationToken); safecall;
    function add_Closed(handler: TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    property ActionButton: Primitives_IButtonBase read get_ActionButton write put_ActionButton;
    property CloseButtonCommand: Input_ICommand read get_CloseButtonCommand write put_CloseButtonCommand;
    property CloseButtonCommandParameter: IInspectable read get_CloseButtonCommandParameter write put_CloseButtonCommandParameter;
    property CloseButtonStyle: IStyle read get_CloseButtonStyle write put_CloseButtonStyle;
    property Content: IInspectable read get_Content write put_Content;
    property ContentTemplate: IDataTemplate read get_ContentTemplate write put_ContentTemplate;
    property IconSource: IIconSource read get_IconSource write put_IconSource;
    property IsClosable: Boolean read get_IsClosable write put_IsClosable;
    property IsIconVisible: Boolean read get_IsIconVisible write put_IsIconVisible;
    property IsOpen: Boolean read get_IsOpen write put_IsOpen;
    property &Message: HSTRING read get_Message write put_Message;
    property Severity: InfoBarSeverity read get_Severity write put_Severity;
    property TemplateSettings: IInfoBarTemplateSettings read get_TemplateSettings;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IIconSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_IconSource)]
  IIconSource = interface(IInspectable)
  ['{39E6B320-A2AF-5EE3-B7E9-4BA4AA80541A}']
    function get_Foreground: IBrush; safecall;
    procedure put_Foreground(value: IBrush); safecall;
    function CreateIconElement: IIconElement; safecall;
    property Foreground: IBrush read get_Foreground write put_Foreground;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IIconElement
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_IconElement)]
  IIconElement = interface(IInspectable)
  ['{18F69350-279E-50EA-8D23-138E717ED939}']
    function get_Foreground: IBrush; safecall;
    procedure put_Foreground(value: IBrush); safecall;
    property Foreground: IBrush read get_Foreground write put_Foreground;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.Primitives.IButtonBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Primitives_ButtonBase)]
  Primitives_IButtonBase = interface(IInspectable)
  ['{65714269-2473-5327-A652-0EA6BCE7F403}']
    function get_ClickMode: ClickMode; safecall;
    procedure put_ClickMode(value: ClickMode); safecall;
    function get_IsPointerOver: Boolean; safecall;
    function get_IsPressed: Boolean; safecall;
    function get_Command: Input_ICommand; safecall;
    procedure put_Command(value: Input_ICommand); safecall;
    function get_CommandParameter: IInspectable; safecall;
    procedure put_CommandParameter(value: IInspectable); safecall;
    function add_Click(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_Click(token: EventRegistrationToken); safecall;
    property ClickMode_: ClickMode read get_ClickMode write put_ClickMode;
    property Command: Input_ICommand read get_Command write put_Command;
    property CommandParameter: IInspectable read get_CommandParameter write put_CommandParameter;
    property IsPointerOver: Boolean read get_IsPointerOver;
    property IsPressed: Boolean read get_IsPressed;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IInfoBarTemplateSettings
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_InfoBarTemplateSettings)]
  IInfoBarTemplateSettings = interface(IInspectable)
  ['{926F7292-9882-5056-8097-6DA2A7EA27CD}']
    function get_IconElement: IIconElement; safecall;
    procedure put_IconElement(value: IIconElement); safecall;
    property IconElement: IIconElement read get_IconElement write put_IconElement;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosingEventArgs>
  TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{F589CB61-8C7A-5807-862D-F221BE833D69}']
    procedure Invoke(sender: IInfoBar; args: IInfoBarClosingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosingEventArgs>
  // External
  TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs = interface(TypedEventHandler_2__IInfoBar__IInfoBarClosingEventArgs_Delegate_Base)
  ['{BBC1CA5D-3488-5A09-82F5-0CBA9527593A}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IInfoBarClosingEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_InfoBarClosingEventArgs)]
  IInfoBarClosingEventArgs = interface(IInspectable)
  ['{062D01D6-61AF-5435-8C4B-C51106583B5B}']
    function get_Reason: InfoBarCloseReason; safecall;
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property Reason: InfoBarCloseReason read get_Reason;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosedEventArgs>
  TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1C7AFB45-6785-5ED7-9ADF-469B585E22DA}']
    procedure Invoke(sender: IInfoBar; args: IInfoBarClosedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IInfoBar,Microsoft.UI.Xaml.Controls.IInfoBarClosedEventArgs>
  // External
  TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs = interface(TypedEventHandler_2__IInfoBar__IInfoBarClosedEventArgs_Delegate_Base)
  ['{0F70109D-20DC-5609-ACED-32BE0260024F}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IInfoBarClosedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_InfoBarClosedEventArgs)]
  IInfoBarClosedEventArgs = interface(IInspectable)
  ['{593AF0B3-BDED-53DA-8F56-80ED3C64322C}']
    function get_Reason: InfoBarCloseReason; safecall;
    property Reason: InfoBarCloseReason read get_Reason;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Data.IItemIndexRange>
  // External
  IVectorView_1__Data_IItemIndexRange = interface(IInspectable)
  ['{849C77F7-423A-5C4B-B5A0-A29F3C715129}']
    function GetAt(index: Cardinal): Data_IItemIndexRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Data_IItemIndexRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PData_IItemIndexRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Data.IItemIndexRange
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Data_ItemIndexRange)]
  Data_IItemIndexRange = interface(IInspectable)
  ['{EBA09846-2554-5B86-AC17-614F05105FA2}']
    function get_FirstIndex: Integer; safecall;
    function get_Length: Cardinal; safecall;
    function get_LastIndex: Integer; safecall;
    property FirstIndex: Integer read get_FirstIndex;
    property LastIndex: Integer read get_LastIndex;
    property Length: Cardinal read get_Length;
  end;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Xaml.Data.LoadMoreItemsResult>
  // External
  IAsyncOperation_1__Data_LoadMoreItemsResult = interface(IInspectable)
  ['{87C6D0A7-9748-5F9C-B359-1E12759CF3CE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult; safecall;
    function GetResults: Data_LoadMoreItemsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Xaml.Data.LoadMoreItemsResult>
  // External
  AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = interface(IUnknown)
  ['{8806A4D7-81D6-50F6-9128-52A9534FEBE1}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Data_LoadMoreItemsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IInputScope
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_InputScope)]
  Input_IInputScope = interface(IInspectable)
  ['{76EA58B1-E910-5176-9147-695CC95E7DA2}']
    function get_Names: IVector_1__Input_IInputScopeName; safecall;
    property Names: IVector_1__Input_IInputScopeName read get_Names;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IInputScopeName>
  IVector_1__Input_IInputScopeName_Base = interface(IInspectable)
  ['{FE4C93E9-D6FA-5B96-9C74-DE968C79C36E}']
    function GetAt(index: Cardinal): Input_IInputScopeName; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Input_IInputScopeName; safecall;
    function IndexOf(value: Input_IInputScopeName; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Input_IInputScopeName); safecall;
    procedure InsertAt(index: Cardinal; value: Input_IInputScopeName); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Input_IInputScopeName); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IInputScopeName): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PInput_IInputScopeName); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Input.IInputScopeName>
  // External
  IVector_1__Input_IInputScopeName = interface(IVector_1__Input_IInputScopeName_Base)
  ['{54E98926-88B0-5074-9351-4B9BAF64A5C5}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Input.IInputScopeName
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Input_InputScopeName)]
  Input_IInputScopeName = interface(IInspectable)
  ['{EE99A66D-28D0-53CB-82EE-1B6EE58BCC35}']
    function get_NameValue: Input_InputScopeNameValue; safecall;
    procedure put_NameValue(value: Input_InputScopeNameValue); safecall;
    property NameValue: Input_InputScopeNameValue read get_NameValue write put_NameValue;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Input.IInputScopeName>
  // External
  IVectorView_1__Input_IInputScopeName = interface(IInspectable)
  ['{FE2173E7-938F-50BA-B1A9-B5A826C31C77}']
    function GetAt(index: Cardinal): Input_IInputScopeName; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Input_IInputScopeName; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IInputScopeName): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IRatingControl,Object>
  TypedEventHandler_2__IRatingControl__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6C2283D0-AE0F-5742-B99A-6FCA61EF564D}']
    procedure Invoke(sender: IRatingControl; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IRatingControl,Object>
  // External
  TypedEventHandler_2__IRatingControl__IInspectable = interface(TypedEventHandler_2__IRatingControl__IInspectable_Delegate_Base)
  ['{72B0C7EE-5BA4-51FA-9A27-0FDEC0DFBF7E}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IRatingControl
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_RatingControl)]
  IRatingControl = interface(IInspectable)
  ['{5488193B-EA4B-52C6-8544-C063219BCD90}']
    function get_Caption: HSTRING; safecall;
    procedure put_Caption(value: HSTRING); safecall;
    function get_InitialSetValue: Integer; safecall;
    procedure put_InitialSetValue(value: Integer); safecall;
    function get_IsClearEnabled: Boolean; safecall;
    procedure put_IsClearEnabled(value: Boolean); safecall;
    function get_IsReadOnly: Boolean; safecall;
    procedure put_IsReadOnly(value: Boolean); safecall;
    function get_MaxRating: Integer; safecall;
    procedure put_MaxRating(value: Integer); safecall;
    function get_PlaceholderValue: Double; safecall;
    procedure put_PlaceholderValue(value: Double); safecall;
    function get_ItemInfo: IRatingItemInfo; safecall;
    procedure put_ItemInfo(value: IRatingItemInfo); safecall;
    function get_Value: Double; safecall;
    procedure put_Value(value: Double); safecall;
    function add_ValueChanged(handler: TypedEventHandler_2__IRatingControl__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ValueChanged(token: EventRegistrationToken); safecall;
    property Caption: HSTRING read get_Caption write put_Caption;
    property InitialSetValue: Integer read get_InitialSetValue write put_InitialSetValue;
    property IsClearEnabled: Boolean read get_IsClearEnabled write put_IsClearEnabled;
    property IsReadOnly: Boolean read get_IsReadOnly write put_IsReadOnly;
    property ItemInfo: IRatingItemInfo read get_ItemInfo write put_ItemInfo;
    property MaxRating: Integer read get_MaxRating write put_MaxRating;
    property PlaceholderValue: Double read get_PlaceholderValue write put_PlaceholderValue;
    property Value: Double read get_Value write put_Value;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IRatingItemInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_RatingItemInfo)]
  IRatingItemInfo = interface(IInspectable)
  ['{801E924E-3613-55DD-8321-9EBABBED0B8A}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ILayout,Object>
  TypedEventHandler_2__ILayout__IInspectable_Delegate_Base = interface(IUnknown)
  ['{38EFEEF8-0B6D-5875-AB47-410BF781C683}']
    procedure Invoke(sender: ILayout; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ILayout,Object>
  // External
  TypedEventHandler_2__ILayout__IInspectable = interface(TypedEventHandler_2__ILayout__IInspectable_Delegate_Base)
  ['{2227643E-AEDD-5824-9166-A74C0E1EEC37}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ILayout
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Layout)]
  ILayout = interface(IInspectable)
  ['{24E50C1C-9C51-5144-9DDC-3F500191C262}']
    procedure InitializeForContext(context: ILayoutContext); safecall;
    procedure UninitializeForContext(context: ILayoutContext); safecall;
    function Measure(context: ILayoutContext; availableSize: TSizeF): TSizeF; safecall;
    function Arrange(context: ILayoutContext; finalSize: TSizeF): TSizeF; safecall;
    function add_MeasureInvalidated(handler: TypedEventHandler_2__ILayout__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MeasureInvalidated(token: EventRegistrationToken); safecall;
    function add_ArrangeInvalidated(handler: TypedEventHandler_2__ILayout__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ArrangeInvalidated(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ILayoutContext
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_LayoutContext)]
  ILayoutContext = interface(IInspectable)
  ['{B45A2E55-2ECC-5462-BB26-D47C455BB48E}']
    function get_LayoutState: IInspectable; safecall;
    procedure put_LayoutState(value: IInspectable); safecall;
    property LayoutState: IInspectable read get_LayoutState write put_LayoutState;
  end;

  // Microsoft.UI.Xaml.Documents.ITextPointer
  // External
  Documents_ITextPointer = interface(IInspectable)
  ['{842EB385-EE41-5930-979B-438FA7525A51}']
    function get_Parent: IDependencyObject; safecall;
    function get_VisualParent: IFrameworkElement; safecall;
    function get_LogicalDirection: Documents_LogicalDirection; safecall;
    function get_Offset: Integer; safecall;
    function GetCharacterRect(direction: Documents_LogicalDirection): TRectF; safecall;
    function GetPositionAtOffset(offset: Integer; direction: Documents_LogicalDirection): Documents_ITextPointer; safecall;
    property LogicalDirection: Documents_LogicalDirection read get_LogicalDirection;
    property Offset: Integer read get_Offset;
    property Parent: IDependencyObject read get_Parent;
    property VisualParent: IFrameworkElement read get_VisualParent;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IBlock>
  IVector_1__Documents_IBlock_Base = interface(IInspectable)
  ['{D728DC59-5A96-5849-9009-7DA7CBB392EB}']
    function GetAt(index: Cardinal): Documents_IBlock; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Documents_IBlock; safecall;
    function IndexOf(value: Documents_IBlock; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Documents_IBlock); safecall;
    procedure InsertAt(index: Cardinal; value: Documents_IBlock); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Documents_IBlock); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_IBlock): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDocuments_IBlock); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IBlock>
  // External
  IVector_1__Documents_IBlock = interface(IVector_1__Documents_IBlock_Base)
  ['{C998A912-C7C2-599F-9E80-E68F6E22E49B}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Documents.IBlock
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Documents_Block)]
  Documents_IBlock = interface(IInspectable)
  ['{8149D507-672F-5FD5-A10A-351389BA9659}']
    function get_TextAlignment: TextAlignment; safecall;
    procedure put_TextAlignment(value: TextAlignment); safecall;
    function get_HorizontalTextAlignment: TextAlignment; safecall;
    procedure put_HorizontalTextAlignment(value: TextAlignment); safecall;
    function get_LineHeight: Double; safecall;
    procedure put_LineHeight(value: Double); safecall;
    function get_LineStackingStrategy: LineStackingStrategy; safecall;
    procedure put_LineStackingStrategy(value: LineStackingStrategy); safecall;
    function get_Margin: Thickness; safecall;
    procedure put_Margin(value: Thickness); safecall;
    property HorizontalTextAlignment: TextAlignment read get_HorizontalTextAlignment write put_HorizontalTextAlignment;
    property LineHeight: Double read get_LineHeight write put_LineHeight;
    property LineStackingStrategy_: LineStackingStrategy read get_LineStackingStrategy write put_LineStackingStrategy;
    property Margin: Thickness read get_Margin write put_Margin;
    property TextAlignment_: TextAlignment read get_TextAlignment write put_TextAlignment;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.IBlock>
  // External
  IVectorView_1__Documents_IBlock = interface(IInspectable)
  ['{C277FE03-19B0-51E6-B55F-D18BD180EEEF}']
    function GetAt(index: Cardinal): Documents_IBlock; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Documents_IBlock; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_IBlock): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.ITextHighlighter>
  IVector_1__Documents_ITextHighlighter_Base = interface(IInspectable)
  ['{6D576F67-1548-51C9-83A8-2B5401B0281B}']
    function GetAt(index: Cardinal): Documents_ITextHighlighter; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Documents_ITextHighlighter; safecall;
    function IndexOf(value: Documents_ITextHighlighter; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Documents_ITextHighlighter); safecall;
    procedure InsertAt(index: Cardinal; value: Documents_ITextHighlighter); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Documents_ITextHighlighter); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_ITextHighlighter): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDocuments_ITextHighlighter); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.ITextHighlighter>
  // External
  IVector_1__Documents_ITextHighlighter = interface(IVector_1__Documents_ITextHighlighter_Base)
  ['{570D0930-C126-57E1-B2B3-D3AF00070D67}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Documents.ITextHighlighter
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Documents_TextHighlighter)]
  Documents_ITextHighlighter = interface(IInspectable)
  ['{B756E861-1D2B-5F6F-81FD-C51A5BC068FF}']
    function get_Ranges: IVector_1__Documents_TextRange; safecall;
    function get_Foreground: IBrush; safecall;
    procedure put_Foreground(value: IBrush); safecall;
    function get_Background: IBrush; safecall;
    procedure put_Background(value: IBrush); safecall;
    property Background: IBrush read get_Background write put_Background;
    property Foreground: IBrush read get_Foreground write put_Foreground;
    property Ranges: IVector_1__Documents_TextRange read get_Ranges;
  end;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.TextRange>
  // External
  IVector_1__Documents_TextRange = interface(IInspectable)
  ['{5338571C-77B4-560E-8DFD-A59DAD270EBB}']
    function GetAt(index: Cardinal): Documents_TextRange; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Documents_TextRange; safecall;
    function IndexOf(value: Documents_TextRange; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Documents_TextRange); safecall;
    procedure InsertAt(index: Cardinal; value: Documents_TextRange); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Documents_TextRange); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_TextRange): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDocuments_TextRange); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.TextRange>
  // External
  IVectorView_1__Documents_TextRange = interface(IInspectable)
  ['{9D4EA607-632B-50F1-9539-DDE98C1EED29}']
    function GetAt(index: Cardinal): Documents_TextRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Documents_TextRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_TextRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.ITextHighlighter>
  // External
  IVectorView_1__Documents_ITextHighlighter = interface(IInspectable)
  ['{A8C1B13A-CF7F-5A69-9F25-E5BCBE718D05}']
    function GetAt(index: Cardinal): Documents_ITextHighlighter; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Documents_ITextHighlighter; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_ITextHighlighter): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IUIElement>
  IVector_1__IUIElement_Base = interface(IInspectable)
  ['{EA4A1AF0-4286-5F11-8142-6B0169F4E9DE}']
    function GetAt(index: Cardinal): IUIElement; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IUIElement; safecall;
    function IndexOf(value: IUIElement; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IUIElement); safecall;
    procedure InsertAt(index: Cardinal; value: IUIElement); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IUIElement); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIUIElement): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIUIElement); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.IUIElement>
  // External
  IVector_1__IUIElement = interface(IVector_1__IUIElement_Base)
  ['{BBA53878-AD6C-5752-A9E7-73EACDD9D636}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.IUIElement>
  // External
  IVectorView_1__IUIElement = interface(IInspectable)
  ['{B3F7CC40-59D0-51BF-A380-21535C6258F2}']
    function GetAt(index: Cardinal): IUIElement; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IUIElement; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIUIElement): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Object>
  TypedEventHandler_2__ITabView__IInspectable_Delegate_Base = interface(IUnknown)
  ['{13DF6907-BBB4-5F16-BEAC-2938C15E1D85}']
    procedure Invoke(sender: ITabView; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Object>
  // External
  TypedEventHandler_2__ITabView__IInspectable = interface(TypedEventHandler_2__ITabView__IInspectable_Delegate_Base)
  ['{9FC3AEFA-E858-5C28-B087-FD3AFC6A3477}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITabView
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TabView)]
  ITabView = interface(IInspectable)
  ['{07B509E1-1D38-551B-95F4-4732B049F6A6}']
    function get_TabWidthMode: TabViewWidthMode; safecall;
    procedure put_TabWidthMode(value: TabViewWidthMode); safecall;
    function get_CloseButtonOverlayMode: TabViewCloseButtonOverlayMode; safecall;
    procedure put_CloseButtonOverlayMode(value: TabViewCloseButtonOverlayMode); safecall;
    function get_TabStripHeader: IInspectable; safecall;
    procedure put_TabStripHeader(value: IInspectable); safecall;
    function get_TabStripHeaderTemplate: IDataTemplate; safecall;
    procedure put_TabStripHeaderTemplate(value: IDataTemplate); safecall;
    function get_TabStripFooter: IInspectable; safecall;
    procedure put_TabStripFooter(value: IInspectable); safecall;
    function get_TabStripFooterTemplate: IDataTemplate; safecall;
    procedure put_TabStripFooterTemplate(value: IDataTemplate); safecall;
    function get_IsAddTabButtonVisible: Boolean; safecall;
    procedure put_IsAddTabButtonVisible(value: Boolean); safecall;
    function get_AddTabButtonCommand: Input_ICommand; safecall;
    procedure put_AddTabButtonCommand(value: Input_ICommand); safecall;
    function get_AddTabButtonCommandParameter: IInspectable; safecall;
    procedure put_AddTabButtonCommandParameter(value: IInspectable); safecall;
    function add_TabCloseRequested(handler: TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TabCloseRequested(token: EventRegistrationToken); safecall;
    function add_TabDroppedOutside(handler: TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs): EventRegistrationToken; safecall;
    procedure remove_TabDroppedOutside(token: EventRegistrationToken); safecall;
    function add_AddTabButtonClick(handler: TypedEventHandler_2__ITabView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AddTabButtonClick(token: EventRegistrationToken); safecall;
    function add_TabItemsChanged(handler: TypedEventHandler_2__ITabView__IVectorChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TabItemsChanged(token: EventRegistrationToken); safecall;
    function get_TabItemsSource: IInspectable; safecall;
    procedure put_TabItemsSource(value: IInspectable); safecall;
    function get_TabItems: IVector_1__IInspectable; safecall;
    function get_TabItemTemplate: IDataTemplate; safecall;
    procedure put_TabItemTemplate(value: IDataTemplate); safecall;
    function get_TabItemTemplateSelector: IDataTemplateSelector; safecall;
    procedure put_TabItemTemplateSelector(value: IDataTemplateSelector); safecall;
    function get_CanDragTabs: Boolean; safecall;
    procedure put_CanDragTabs(value: Boolean); safecall;
    function get_CanReorderTabs: Boolean; safecall;
    procedure put_CanReorderTabs(value: Boolean); safecall;
    function get_AllowDropTabs: Boolean; safecall;
    procedure put_AllowDropTabs(value: Boolean); safecall;
    function get_SelectedIndex: Integer; safecall;
    procedure put_SelectedIndex(value: Integer); safecall;
    function get_SelectedItem: IInspectable; safecall;
    procedure put_SelectedItem(value: IInspectable); safecall;
    function ContainerFromItem(item: IInspectable): IDependencyObject; safecall;
    function ContainerFromIndex(index: Integer): IDependencyObject; safecall;
    function add_SelectionChanged(handler: SelectionChangedEventHandler): EventRegistrationToken; safecall;
    procedure remove_SelectionChanged(token: EventRegistrationToken); safecall;
    function add_TabDragStarting(handler: TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_TabDragStarting(token: EventRegistrationToken); safecall;
    function add_TabDragCompleted(handler: TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TabDragCompleted(token: EventRegistrationToken); safecall;
    function add_TabStripDragOver(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_TabStripDragOver(token: EventRegistrationToken); safecall;
    function add_TabStripDrop(handler: DragEventHandler): EventRegistrationToken; safecall;
    procedure remove_TabStripDrop(token: EventRegistrationToken); safecall;
    property AddTabButtonCommand: Input_ICommand read get_AddTabButtonCommand write put_AddTabButtonCommand;
    property AddTabButtonCommandParameter: IInspectable read get_AddTabButtonCommandParameter write put_AddTabButtonCommandParameter;
    property AllowDropTabs: Boolean read get_AllowDropTabs write put_AllowDropTabs;
    property CanDragTabs: Boolean read get_CanDragTabs write put_CanDragTabs;
    property CanReorderTabs: Boolean read get_CanReorderTabs write put_CanReorderTabs;
    property CloseButtonOverlayMode: TabViewCloseButtonOverlayMode read get_CloseButtonOverlayMode write put_CloseButtonOverlayMode;
    property IsAddTabButtonVisible: Boolean read get_IsAddTabButtonVisible write put_IsAddTabButtonVisible;
    property SelectedIndex: Integer read get_SelectedIndex write put_SelectedIndex;
    property SelectedItem: IInspectable read get_SelectedItem write put_SelectedItem;
    property TabItemTemplate: IDataTemplate read get_TabItemTemplate write put_TabItemTemplate;
    property TabItemTemplateSelector: IDataTemplateSelector read get_TabItemTemplateSelector write put_TabItemTemplateSelector;
    property TabItems: IVector_1__IInspectable read get_TabItems;
    property TabItemsSource: IInspectable read get_TabItemsSource write put_TabItemsSource;
    property TabStripFooter: IInspectable read get_TabStripFooter write put_TabStripFooter;
    property TabStripFooterTemplate: IDataTemplate read get_TabStripFooterTemplate write put_TabStripFooterTemplate;
    property TabStripHeader: IInspectable read get_TabStripHeader write put_TabStripHeader;
    property TabStripHeaderTemplate: IDataTemplate read get_TabStripHeaderTemplate write put_TabStripHeaderTemplate;
    property TabWidthMode: TabViewWidthMode read get_TabWidthMode write put_TabWidthMode;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7093974B-0900-52AE-AFD8-70E5623F4595}']
    procedure Invoke(sender: ITabView; args: ITabViewTabCloseRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  // External
  TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs = interface(TypedEventHandler_2__ITabView__ITabViewTabCloseRequestedEventArgs_Delegate_Base)
  ['{65EC7149-F3E8-5303-A5BB-ED20B2002E87}']
  end;

  // Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs
  // External
  ITabViewTabCloseRequestedEventArgs = interface(IInspectable)
  ['{D56AB9B2-E264-5C7E-A1CB-E41A16A6C6C6}']
    function get_Item: IInspectable; safecall;
    function get_Tab: ITabViewItem; safecall;
    property Item: IInspectable read get_Item;
    property Tab: ITabViewItem read get_Tab;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITabViewItem
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TabViewItem)]
  ITabViewItem = interface(IInspectable)
  ['{64980AFA-97AF-5190-90B3-4BA277B1113D}']
    function get_Header: IInspectable; safecall;
    procedure put_Header(value: IInspectable); safecall;
    function get_HeaderTemplate: IDataTemplate; safecall;
    procedure put_HeaderTemplate(value: IDataTemplate); safecall;
    function get_IconSource: IIconSource; safecall;
    procedure put_IconSource(value: IIconSource); safecall;
    function get_IsClosable: Boolean; safecall;
    procedure put_IsClosable(value: Boolean); safecall;
    function get_TabViewTemplateSettings: ITabViewItemTemplateSettings; safecall;
    function add_CloseRequested(handler: TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CloseRequested(token: EventRegistrationToken); safecall;
    property Header: IInspectable read get_Header write put_Header;
    property HeaderTemplate: IDataTemplate read get_HeaderTemplate write put_HeaderTemplate;
    property IconSource: IIconSource read get_IconSource write put_IconSource;
    property IsClosable: Boolean read get_IsClosable write put_IsClosable;
    property TabViewTemplateSettings: ITabViewItemTemplateSettings read get_TabViewTemplateSettings;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITabViewItemTemplateSettings
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TabViewItemTemplateSettings)]
  ITabViewItemTemplateSettings = interface(IInspectable)
  ['{CC5C99EC-C9D1-55F5-BC81-7612FF4E2B77}']
    function get_IconElement: IIconElement; safecall;
    procedure put_IconElement(value: IIconElement); safecall;
    property IconElement: IIconElement read get_IconElement write put_IconElement;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabViewItem,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{15BF87B1-2BCB-5C31-A7FA-5A957BC9BF83}']
    procedure Invoke(sender: ITabViewItem; args: ITabViewTabCloseRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabViewItem,Microsoft.UI.Xaml.Controls.ITabViewTabCloseRequestedEventArgs>
  // External
  TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs = interface(TypedEventHandler_2__ITabViewItem__ITabViewTabCloseRequestedEventArgs_Delegate_Base)
  ['{77504768-B8F2-514A-B4C0-E4519E3CE9C4}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDroppedOutsideEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs_Delegate_Base = interface(IUnknown)
  ['{3D6CCE02-EB79-58F0-A970-57E7AE4FB3A1}']
    procedure Invoke(sender: ITabView; args: ITabViewTabDroppedOutsideEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDroppedOutsideEventArgs>
  // External
  TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs = interface(TypedEventHandler_2__ITabView__ITabViewTabDroppedOutsideEventArgs_Delegate_Base)
  ['{37607AC4-988F-5592-A86A-253B0EBA6DE5}']
  end;

  // Microsoft.UI.Xaml.Controls.ITabViewTabDroppedOutsideEventArgs
  // External
  ITabViewTabDroppedOutsideEventArgs = interface(IInspectable)
  ['{1F1F4D5D-0FB1-51AB-B66F-F7A322BF2D13}']
    function get_Item: IInspectable; safecall;
    function get_Tab: ITabViewItem; safecall;
    property Item: IInspectable read get_Item;
    property Tab: ITabViewItem read get_Tab;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Windows.Foundation.Collections.IVectorChangedEventArgs>
  TypedEventHandler_2__ITabView__IVectorChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A4DD856E-A825-51FE-A733-23C16BD69F2D}']
    procedure Invoke(sender: ITabView; args: IVectorChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Windows.Foundation.Collections.IVectorChangedEventArgs>
  // External
  TypedEventHandler_2__ITabView__IVectorChangedEventArgs = interface(TypedEventHandler_2__ITabView__IVectorChangedEventArgs_Delegate_Base)
  ['{6E729AF2-F606-5EE9-8DED-B937425D130F}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IDataTemplateSelector
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_DataTemplateSelector)]
  IDataTemplateSelector = interface(IInspectable)
  ['{86CA4FA4-7DE0-5049-82F5-39EC78569028}']
    function SelectTemplate(item: IInspectable; container: IDependencyObject): IDataTemplate; overload; safecall;
    function SelectTemplate(item: IInspectable): IDataTemplate; overload; safecall;
  end;

  // Microsoft.UI.Xaml.Controls.SelectionChangedEventHandler
  // External
  SelectionChangedEventHandler = interface(IUnknown)
  ['{A232390D-0E34-595E-8931-FA928A9909F4}']
    procedure Invoke(sender: IInspectable; e: ISelectionChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ISelectionChangedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_SelectionChangedEventArgs)]
  ISelectionChangedEventArgs = interface(IInspectable)
  ['{B6C18076-4B76-5416-AD29-E2DC20C46246}']
    function get_AddedItems: IVector_1__IInspectable; safecall;
    function get_RemovedItems: IVector_1__IInspectable; safecall;
    property AddedItems: IVector_1__IInspectable read get_AddedItems;
    property RemovedItems: IVector_1__IInspectable read get_RemovedItems;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragStartingEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{2A88A19E-C6C4-5EE8-BE88-DF94B6B529C4}']
    procedure Invoke(sender: ITabView; args: ITabViewTabDragStartingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragStartingEventArgs>
  // External
  TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs = interface(TypedEventHandler_2__ITabView__ITabViewTabDragStartingEventArgs_Delegate_Base)
  ['{510C120D-38ED-5267-93B7-566E06C4AC29}']
  end;

  // Microsoft.UI.Xaml.Controls.ITabViewTabDragStartingEventArgs
  // External
  ITabViewTabDragStartingEventArgs = interface(IInspectable)
  ['{97682812-1A7B-53FD-8B4E-C2F70D2AD250}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_Data: IDataPackage; safecall;
    function get_Item: IInspectable; safecall;
    function get_Tab: ITabViewItem; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property Data: IDataPackage read get_Data;
    property Item: IInspectable read get_Item;
    property Tab: ITabViewItem read get_Tab;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragCompletedEventArgs>
  TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1C1E8EFA-6D9B-5E91-8D17-D6DC96ECF7A3}']
    procedure Invoke(sender: ITabView; args: ITabViewTabDragCompletedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITabView,Microsoft.UI.Xaml.Controls.ITabViewTabDragCompletedEventArgs>
  // External
  TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs = interface(TypedEventHandler_2__ITabView__ITabViewTabDragCompletedEventArgs_Delegate_Base)
  ['{065F5EC0-01AF-5138-83D4-5571DC1366A4}']
  end;

  // Microsoft.UI.Xaml.Controls.ITabViewTabDragCompletedEventArgs
  // External
  ITabViewTabDragCompletedEventArgs = interface(IInspectable)
  ['{791FC623-C8F6-5102-81BD-1869CDE82284}']
    function get_DropResult: DataPackageOperation; safecall;
    function get_Item: IInspectable; safecall;
    function get_Tab: ITabViewItem; safecall;
    property DropResult: DataPackageOperation read get_DropResult;
    property Item: IInspectable read get_Item;
    property Tab: ITabViewItem read get_Tab;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IBrushTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_BrushTransition)]
  IBrushTransition = interface(IInspectable)
  ['{A996A7BA-4567-5963-A112-76E3C0000204}']
    function get_Duration: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    property Duration: TimeSpan read get_Duration write put_Duration;
  end;

  // Microsoft.UI.Xaml.DependencyPropertyChangedEventHandler
  // External
  DependencyPropertyChangedEventHandler = interface(IUnknown)
  ['{4BE8DC75-373D-5F4E-A0B4-54B9EEAFB4A9}']
    procedure Invoke(sender: IInspectable; e: IDependencyPropertyChangedEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.IDependencyPropertyChangedEventArgs
  // External
  IDependencyPropertyChangedEventArgs = interface(IInspectable)
  ['{84EAD020-7849-5E98-8030-488A80D164EC}']
    function get_Property: IDependencyProperty; safecall;
    function get_OldValue: IInspectable; safecall;
    function get_NewValue: IInspectable; safecall;
    property NewValue: IInspectable read get_NewValue;
    property OldValue: IInspectable read get_OldValue;
    property &Property: IDependencyProperty read get_Property;
  end;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IDynamicAnimatedVisualSource,Object>
  // External
  TypedEventHandler_2__IDynamicAnimatedVisualSource__IInspectable = interface(IUnknown)
  ['{6980444B-361B-5CCA-8F43-7017EDED498B}']
    procedure Invoke(sender: IDynamicAnimatedVisualSource; args: IInspectable); safecall;
  end;

  // Microsoft.UI.Xaml.Controls.IDynamicAnimatedVisualSource
  // External
  IDynamicAnimatedVisualSource = interface(IInspectable)
  ['{AB00E5CF-1BE6-559C-AD5B-0253BB17C0F7}']
    function add_AnimatedVisualInvalidated(handler: TypedEventHandler_2__IDynamicAnimatedVisualSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AnimatedVisualInvalidated(token: EventRegistrationToken); safecall;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Navigation.IPageStackEntry>
  IVector_1__Navigation_IPageStackEntry_Base = interface(IInspectable)
  ['{866BB888-10B1-5413-ADB4-3D3B197ADA8B}']
    function GetAt(index: Cardinal): Navigation_IPageStackEntry; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Navigation_IPageStackEntry; safecall;
    function IndexOf(value: Navigation_IPageStackEntry; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Navigation_IPageStackEntry); safecall;
    procedure InsertAt(index: Cardinal; value: Navigation_IPageStackEntry); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Navigation_IPageStackEntry); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PNavigation_IPageStackEntry): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PNavigation_IPageStackEntry); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Navigation.IPageStackEntry>
  // External
  IVector_1__Navigation_IPageStackEntry = interface(IVector_1__Navigation_IPageStackEntry_Base)
  ['{F480AFB4-FBE3-5670-B585-CD949EF2219C}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Navigation.IPageStackEntry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Navigation_PageStackEntry)]
  Navigation_IPageStackEntry = interface(IInspectable)
  ['{D591F56E-4262-5C91-9D79-29165CD82100}']
    function get_SourcePageType: Interop_TypeName; safecall;
    function get_Parameter: IInspectable; safecall;
    function get_NavigationTransitionInfo: Animation_INavigationTransitionInfo; safecall;
    property NavigationTransitionInfo: Animation_INavigationTransitionInfo read get_NavigationTransitionInfo;
    property Parameter: IInspectable read get_Parameter;
    property SourcePageType: Interop_TypeName read get_SourcePageType;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_NavigationTransitionInfo)]
  Animation_INavigationTransitionInfo = interface(IInspectable)
  ['{25BB17FB-6E15-514E-B278-197537A4D990}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Navigation.IPageStackEntry>
  // External
  IVectorView_1__Navigation_IPageStackEntry = interface(IInspectable)
  ['{E70C7F61-EA61-517C-ADC1-5AE44F6F916D}']
    function GetAt(index: Cardinal): Navigation_IPageStackEntry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Navigation_IPageStackEntry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PNavigation_IPageStackEntry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.UI.Xaml.Navigation.NavigatedEventHandler
  // External
  Navigation_NavigatedEventHandler = interface(IUnknown)
  ['{8631B517-6D8E-58EE-82FE-D4034D1BD7C1}']
    procedure Invoke(sender: IInspectable; e: Navigation_INavigationEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Navigation.INavigationEventArgs
  // External
  Navigation_INavigationEventArgs = interface(IInspectable)
  ['{876B70B4-2923-5785-9CEA-2E44AA0761BD}']
    function get_Content: IInspectable; safecall;
    function get_Parameter: IInspectable; safecall;
    function get_NavigationTransitionInfo: Animation_INavigationTransitionInfo; safecall;
    function get_SourcePageType: Interop_TypeName; safecall;
    function get_NavigationMode: Navigation_NavigationMode; safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    procedure put_Uri(value: IUriRuntimeClass); safecall;
    property Content: IInspectable read get_Content;
    property NavigationMode: Navigation_NavigationMode read get_NavigationMode;
    property NavigationTransitionInfo: Animation_INavigationTransitionInfo read get_NavigationTransitionInfo;
    property Parameter: IInspectable read get_Parameter;
    property SourcePageType: Interop_TypeName read get_SourcePageType;
    property Uri: IUriRuntimeClass read get_Uri write put_Uri;
  end;

  // Microsoft.UI.Xaml.Navigation.NavigatingCancelEventHandler
  // External
  Navigation_NavigatingCancelEventHandler = interface(IUnknown)
  ['{FCAE1401-EC94-565F-9F48-7C4B6272B3B1}']
    procedure Invoke(sender: IInspectable; e: Navigation_INavigatingCancelEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Navigation.INavigatingCancelEventArgs
  // External
  Navigation_INavigatingCancelEventArgs = interface(IInspectable)
  ['{172FDE12-E06F-5DF6-930E-5FACF7B3FBE7}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_NavigationMode: Navigation_NavigationMode; safecall;
    function get_SourcePageType: Interop_TypeName; safecall;
    function get_Parameter: IInspectable; safecall;
    function get_NavigationTransitionInfo: Animation_INavigationTransitionInfo; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property NavigationMode: Navigation_NavigationMode read get_NavigationMode;
    property NavigationTransitionInfo: Animation_INavigationTransitionInfo read get_NavigationTransitionInfo;
    property Parameter: IInspectable read get_Parameter;
    property SourcePageType: Interop_TypeName read get_SourcePageType;
  end;

  // Microsoft.UI.Xaml.Navigation.NavigationFailedEventHandler
  // External
  Navigation_NavigationFailedEventHandler = interface(IUnknown)
  ['{97CA2B56-D6EB-5FD2-A675-A339640EEDBA}']
    procedure Invoke(sender: IInspectable; e: Navigation_INavigationFailedEventArgs); safecall;
  end;

  // Microsoft.UI.Xaml.Navigation.INavigationFailedEventArgs
  // External
  Navigation_INavigationFailedEventArgs = interface(IInspectable)
  ['{F808F9A0-130C-5974-87F8-4433271A35A9}']
    function get_Exception: HRESULT; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_SourcePageType: Interop_TypeName; safecall;
    property Exception: HRESULT read get_Exception;
    property Handled: Boolean read get_Handled write put_Handled;
    property SourcePageType: Interop_TypeName read get_SourcePageType;
  end;

  // Microsoft.UI.Xaml.Navigation.NavigationStoppedEventHandler
  // External
  Navigation_NavigationStoppedEventHandler = interface(IUnknown)
  ['{B9E796A6-7FFE-5A63-AEF4-CBC331663B66}']
    procedure Invoke(sender: IInspectable; e: Navigation_INavigationEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Navigation.IFrameNavigationOptions
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Navigation_FrameNavigationOptions)]
  Navigation_IFrameNavigationOptions = interface(IInspectable)
  ['{390DE593-14CF-5312-AF99-6CD8D59EC5D5}']
    function get_IsNavigationStackEnabled: Boolean; safecall;
    procedure put_IsNavigationStackEnabled(value: Boolean); safecall;
    function get_TransitionInfoOverride: Animation_INavigationTransitionInfo; safecall;
    procedure put_TransitionInfoOverride(value: Animation_INavigationTransitionInfo); safecall;
    property IsNavigationStackEnabled: Boolean read get_IsNavigationStackEnabled write put_IsNavigationStackEnabled;
    property TransitionInfoOverride: Animation_INavigationTransitionInfo read get_TransitionInfoOverride write put_TransitionInfoOverride;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Object>
  TypedEventHandler_2__INavigationView__IInspectable_Delegate_Base = interface(IUnknown)
  ['{86E94CE6-31DA-595B-80C2-03FB66CCB5D3}']
    procedure Invoke(sender: INavigationView; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Object>
  // External
  TypedEventHandler_2__INavigationView__IInspectable = interface(TypedEventHandler_2__INavigationView__IInspectable_Delegate_Base)
  ['{3FAFCF7D-2EAB-5D2F-B791-2D921A0B5130}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.INavigationView
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_NavigationView)]
  INavigationView = interface(IInspectable)
  ['{E77A4B36-3DD1-53D9-9F97-65DCCAA74A5C}']
    function get_IsPaneOpen: Boolean; safecall;
    procedure put_IsPaneOpen(value: Boolean); safecall;
    function get_CompactModeThresholdWidth: Double; safecall;
    procedure put_CompactModeThresholdWidth(value: Double); safecall;
    function get_ExpandedModeThresholdWidth: Double; safecall;
    procedure put_ExpandedModeThresholdWidth(value: Double); safecall;
    function get_FooterMenuItems: IVector_1__IInspectable; safecall;
    function get_FooterMenuItemsSource: IInspectable; safecall;
    procedure put_FooterMenuItemsSource(value: IInspectable); safecall;
    function get_PaneFooter: IUIElement; safecall;
    procedure put_PaneFooter(value: IUIElement); safecall;
    function get_Header: IInspectable; safecall;
    procedure put_Header(value: IInspectable); safecall;
    function get_HeaderTemplate: IDataTemplate; safecall;
    procedure put_HeaderTemplate(value: IDataTemplate); safecall;
    function get_DisplayMode: NavigationViewDisplayMode; safecall;
    function get_IsSettingsVisible: Boolean; safecall;
    procedure put_IsSettingsVisible(value: Boolean); safecall;
    function get_IsPaneToggleButtonVisible: Boolean; safecall;
    procedure put_IsPaneToggleButtonVisible(value: Boolean); safecall;
    function get_AlwaysShowHeader: Boolean; safecall;
    procedure put_AlwaysShowHeader(value: Boolean); safecall;
    function get_CompactPaneLength: Double; safecall;
    procedure put_CompactPaneLength(value: Double); safecall;
    function get_OpenPaneLength: Double; safecall;
    procedure put_OpenPaneLength(value: Double); safecall;
    function get_PaneToggleButtonStyle: IStyle; safecall;
    procedure put_PaneToggleButtonStyle(value: IStyle); safecall;
    function get_SelectedItem: IInspectable; safecall;
    procedure put_SelectedItem(value: IInspectable); safecall;
    function get_MenuItems: IVector_1__IInspectable; safecall;
    function get_MenuItemsSource: IInspectable; safecall;
    procedure put_MenuItemsSource(value: IInspectable); safecall;
    function get_SettingsItem: IInspectable; safecall;
    function get_AutoSuggestBox: IAutoSuggestBox; safecall;
    procedure put_AutoSuggestBox(value: IAutoSuggestBox); safecall;
    function get_MenuItemTemplate: IDataTemplate; safecall;
    procedure put_MenuItemTemplate(value: IDataTemplate); safecall;
    function get_MenuItemTemplateSelector: IDataTemplateSelector; safecall;
    procedure put_MenuItemTemplateSelector(value: IDataTemplateSelector); safecall;
    function get_MenuItemContainerStyle: IStyle; safecall;
    procedure put_MenuItemContainerStyle(value: IStyle); safecall;
    function get_MenuItemContainerStyleSelector: IStyleSelector; safecall;
    procedure put_MenuItemContainerStyleSelector(value: IStyleSelector); safecall;
    function MenuItemFromContainer(container: IDependencyObject): IInspectable; safecall;
    function ContainerFromMenuItem(item: IInspectable): IDependencyObject; safecall;
    function add_SelectionChanged(handler: TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SelectionChanged(token: EventRegistrationToken); safecall;
    function add_ItemInvoked(handler: TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ItemInvoked(token: EventRegistrationToken); safecall;
    function add_DisplayModeChanged(handler: TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DisplayModeChanged(token: EventRegistrationToken); safecall;
    function get_IsTitleBarAutoPaddingEnabled: Boolean; safecall;
    procedure put_IsTitleBarAutoPaddingEnabled(value: Boolean); safecall;
    property AlwaysShowHeader: Boolean read get_AlwaysShowHeader write put_AlwaysShowHeader;
    property AutoSuggestBox: IAutoSuggestBox read get_AutoSuggestBox write put_AutoSuggestBox;
    property CompactModeThresholdWidth: Double read get_CompactModeThresholdWidth write put_CompactModeThresholdWidth;
    property CompactPaneLength: Double read get_CompactPaneLength write put_CompactPaneLength;
    property DisplayMode: NavigationViewDisplayMode read get_DisplayMode;
    property ExpandedModeThresholdWidth: Double read get_ExpandedModeThresholdWidth write put_ExpandedModeThresholdWidth;
    property FooterMenuItems: IVector_1__IInspectable read get_FooterMenuItems;
    property FooterMenuItemsSource: IInspectable read get_FooterMenuItemsSource write put_FooterMenuItemsSource;
    property Header: IInspectable read get_Header write put_Header;
    property HeaderTemplate: IDataTemplate read get_HeaderTemplate write put_HeaderTemplate;
    property IsPaneOpen: Boolean read get_IsPaneOpen write put_IsPaneOpen;
    property IsPaneToggleButtonVisible: Boolean read get_IsPaneToggleButtonVisible write put_IsPaneToggleButtonVisible;
    property IsSettingsVisible: Boolean read get_IsSettingsVisible write put_IsSettingsVisible;
    property IsTitleBarAutoPaddingEnabled: Boolean read get_IsTitleBarAutoPaddingEnabled write put_IsTitleBarAutoPaddingEnabled;
    property MenuItemContainerStyle: IStyle read get_MenuItemContainerStyle write put_MenuItemContainerStyle;
    property MenuItemContainerStyleSelector: IStyleSelector read get_MenuItemContainerStyleSelector write put_MenuItemContainerStyleSelector;
    property MenuItemTemplate: IDataTemplate read get_MenuItemTemplate write put_MenuItemTemplate;
    property MenuItemTemplateSelector: IDataTemplateSelector read get_MenuItemTemplateSelector write put_MenuItemTemplateSelector;
    property MenuItems: IVector_1__IInspectable read get_MenuItems;
    property MenuItemsSource: IInspectable read get_MenuItemsSource write put_MenuItemsSource;
    property OpenPaneLength: Double read get_OpenPaneLength write put_OpenPaneLength;
    property PaneFooter: IUIElement read get_PaneFooter write put_PaneFooter;
    property PaneToggleButtonStyle: IStyle read get_PaneToggleButtonStyle write put_PaneToggleButtonStyle;
    property SelectedItem: IInspectable read get_SelectedItem write put_SelectedItem;
    property SettingsItem: IInspectable read get_SettingsItem;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IAutoSuggestBox
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_AutoSuggestBox)]
  IAutoSuggestBox = interface(IInspectable)
  ['{3EEA809E-B2DB-521D-97DB-E0648FB5D798}']
    function get_MaxSuggestionListHeight: Double; safecall;
    procedure put_MaxSuggestionListHeight(value: Double); safecall;
    function get_IsSuggestionListOpen: Boolean; safecall;
    procedure put_IsSuggestionListOpen(value: Boolean); safecall;
    function get_TextMemberPath: HSTRING; safecall;
    procedure put_TextMemberPath(value: HSTRING); safecall;
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function get_UpdateTextOnSelect: Boolean; safecall;
    procedure put_UpdateTextOnSelect(value: Boolean); safecall;
    function get_PlaceholderText: HSTRING; safecall;
    procedure put_PlaceholderText(value: HSTRING); safecall;
    function get_Header: IInspectable; safecall;
    procedure put_Header(value: IInspectable); safecall;
    function get_AutoMaximizeSuggestionArea: Boolean; safecall;
    procedure put_AutoMaximizeSuggestionArea(value: Boolean); safecall;
    function get_TextBoxStyle: IStyle; safecall;
    procedure put_TextBoxStyle(value: IStyle); safecall;
    function get_QueryIcon: IIconElement; safecall;
    procedure put_QueryIcon(value: IIconElement); safecall;
    function get_LightDismissOverlayMode: LightDismissOverlayMode; safecall;
    procedure put_LightDismissOverlayMode(value: LightDismissOverlayMode); safecall;
    function get_Description: IInspectable; safecall;
    procedure put_Description(value: IInspectable); safecall;
    function add_SuggestionChosen(handler: TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs): EventRegistrationToken; safecall;
    procedure remove_SuggestionChosen(token: EventRegistrationToken); safecall;
    function add_TextChanged(handler: TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TextChanged(token: EventRegistrationToken); safecall;
    function add_QuerySubmitted(handler: TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs): EventRegistrationToken; safecall;
    procedure remove_QuerySubmitted(token: EventRegistrationToken); safecall;
    property AutoMaximizeSuggestionArea: Boolean read get_AutoMaximizeSuggestionArea write put_AutoMaximizeSuggestionArea;
    property Description: IInspectable read get_Description write put_Description;
    property Header: IInspectable read get_Header write put_Header;
    property IsSuggestionListOpen: Boolean read get_IsSuggestionListOpen write put_IsSuggestionListOpen;
    property LightDismissOverlayMode_: LightDismissOverlayMode read get_LightDismissOverlayMode write put_LightDismissOverlayMode;
    property MaxSuggestionListHeight: Double read get_MaxSuggestionListHeight write put_MaxSuggestionListHeight;
    property PlaceholderText: HSTRING read get_PlaceholderText write put_PlaceholderText;
    property QueryIcon: IIconElement read get_QueryIcon write put_QueryIcon;
    property Text: HSTRING read get_Text write put_Text;
    property TextBoxStyle: IStyle read get_TextBoxStyle write put_TextBoxStyle;
    property TextMemberPath: HSTRING read get_TextMemberPath write put_TextMemberPath;
    property UpdateTextOnSelect: Boolean read get_UpdateTextOnSelect write put_UpdateTextOnSelect;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxSuggestionChosenEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs_Delegate_Base = interface(IUnknown)
  ['{5935F64E-3ECF-542C-8267-C8E3010AD61B}']
    procedure Invoke(sender: IAutoSuggestBox; args: IAutoSuggestBoxSuggestionChosenEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxSuggestionChosenEventArgs>
  // External
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs = interface(TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxSuggestionChosenEventArgs_Delegate_Base)
  ['{394A10CA-0EC0-5829-8DDA-7D31CF2C61BA}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IAutoSuggestBoxSuggestionChosenEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_AutoSuggestBoxSuggestionChosenEventArgs)]
  IAutoSuggestBoxSuggestionChosenEventArgs = interface(IInspectable)
  ['{7547C7E9-7429-5045-AD98-338A96B270B1}']
    function get_SelectedItem: IInspectable; safecall;
    property SelectedItem: IInspectable read get_SelectedItem;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxTextChangedEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{26A9CA98-6077-5255-912B-476324E3B31C}']
    procedure Invoke(sender: IAutoSuggestBox; args: IAutoSuggestBoxTextChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxTextChangedEventArgs>
  // External
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs = interface(TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxTextChangedEventArgs_Delegate_Base)
  ['{326A72BB-FB2A-5590-BAAD-3F6C874C3933}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IAutoSuggestBoxTextChangedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_AutoSuggestBoxTextChangedEventArgs)]
  IAutoSuggestBoxTextChangedEventArgs = interface(IInspectable)
  ['{D7191D84-E886-547F-A3E2-12F0E05B20FA}']
    function get_Reason: AutoSuggestionBoxTextChangeReason; safecall;
    procedure put_Reason(value: AutoSuggestionBoxTextChangeReason); safecall;
    function CheckCurrent: Boolean; safecall;
    property Reason: AutoSuggestionBoxTextChangeReason read get_Reason write put_Reason;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxQuerySubmittedEventArgs>
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs_Delegate_Base = interface(IUnknown)
  ['{81A5BBFB-8F64-5C79-848B-D59D198153A8}']
    procedure Invoke(sender: IAutoSuggestBox; args: IAutoSuggestBoxQuerySubmittedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IAutoSuggestBox,Microsoft.UI.Xaml.Controls.IAutoSuggestBoxQuerySubmittedEventArgs>
  // External
  TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs = interface(TypedEventHandler_2__IAutoSuggestBox__IAutoSuggestBoxQuerySubmittedEventArgs_Delegate_Base)
  ['{AA7795DB-C516-52B3-8C7D-26106CA14EB4}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IAutoSuggestBoxQuerySubmittedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_AutoSuggestBoxQuerySubmittedEventArgs)]
  IAutoSuggestBoxQuerySubmittedEventArgs = interface(IInspectable)
  ['{26DA5DE4-57A6-57BF-ACC9-AAC599C0B22B}']
    function get_QueryText: HSTRING; safecall;
    function get_ChosenSuggestion: IInspectable; safecall;
    property ChosenSuggestion: IInspectable read get_ChosenSuggestion;
    property QueryText: HSTRING read get_QueryText;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IStyleSelector
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_StyleSelector)]
  IStyleSelector = interface(IInspectable)
  ['{7F9CF759-785B-5EF9-9EA7-1555673A475A}']
    function SelectStyle(item: IInspectable; container: IDependencyObject): IStyle; safecall;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewSelectionChangedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D97A5008-E3CC-5EF4-AC51-96C638D961EF}']
    procedure Invoke(sender: INavigationView; args: INavigationViewSelectionChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewSelectionChangedEventArgs>
  // External
  TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs = interface(TypedEventHandler_2__INavigationView__INavigationViewSelectionChangedEventArgs_Delegate_Base)
  ['{50E022CE-DE5D-5D19-A732-E2E66EAD5D0A}']
  end;

  // Microsoft.UI.Xaml.Controls.INavigationViewSelectionChangedEventArgs
  // External
  INavigationViewSelectionChangedEventArgs = interface(IInspectable)
  ['{14A064A5-C79D-5F63-AC6E-1C313FE63566}']
    function get_SelectedItem: IInspectable; safecall;
    function get_IsSettingsSelected: Boolean; safecall;
    property IsSettingsSelected: Boolean read get_IsSettingsSelected;
    property SelectedItem: IInspectable read get_SelectedItem;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewItemInvokedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8E7678C6-4683-59D9-ACD2-B46E7C63F16A}']
    procedure Invoke(sender: INavigationView; args: INavigationViewItemInvokedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewItemInvokedEventArgs>
  // External
  TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs = interface(TypedEventHandler_2__INavigationView__INavigationViewItemInvokedEventArgs_Delegate_Base)
  ['{E2D3EC39-2A08-509A-A348-DBEF32ED0E59}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.INavigationViewItemInvokedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_NavigationViewItemInvokedEventArgs)]
  INavigationViewItemInvokedEventArgs = interface(IInspectable)
  ['{074CEBAA-5D05-547B-8CD6-D19AC2D9BB3B}']
    function get_InvokedItem: IInspectable; safecall;
    function get_IsSettingsInvoked: Boolean; safecall;
    property InvokedItem: IInspectable read get_InvokedItem;
    property IsSettingsInvoked: Boolean read get_IsSettingsInvoked;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewDisplayModeChangedEventArgs>
  TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7F6A2693-DEFA-51FE-AC1C-A54DBABBD69A}']
    procedure Invoke(sender: INavigationView; args: INavigationViewDisplayModeChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.INavigationView,Microsoft.UI.Xaml.Controls.INavigationViewDisplayModeChangedEventArgs>
  // External
  TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs = interface(TypedEventHandler_2__INavigationView__INavigationViewDisplayModeChangedEventArgs_Delegate_Base)
  ['{378C1DE1-A6B9-586B-9AF2-AB5B93CA9BDE}']
  end;

  // Microsoft.UI.Xaml.Controls.INavigationViewDisplayModeChangedEventArgs
  // External
  INavigationViewDisplayModeChangedEventArgs = interface(IInspectable)
  ['{58DCF1EA-9E56-522C-B3F8-34BD55ECACA4}']
    function get_DisplayMode: NavigationViewDisplayMode; safecall;
    property DisplayMode: NavigationViewDisplayMode read get_DisplayMode;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Object>
  TypedEventHandler_2__ISplitView__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F811C258-F10A-5D33-8B12-B1D84157196E}']
    procedure Invoke(sender: ISplitView; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Object>
  // External
  TypedEventHandler_2__ISplitView__IInspectable = interface(TypedEventHandler_2__ISplitView__IInspectable_Delegate_Base)
  ['{E20CC34D-F436-5308-9933-ED1B011B9C34}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ISplitView
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_SplitView)]
  ISplitView = interface(IInspectable)
  ['{10AE18F7-1666-5897-BBCE-1E687E7784A8}']
    function get_Content: IUIElement; safecall;
    procedure put_Content(value: IUIElement); safecall;
    function get_Pane: IUIElement; safecall;
    procedure put_Pane(value: IUIElement); safecall;
    function get_IsPaneOpen: Boolean; safecall;
    procedure put_IsPaneOpen(value: Boolean); safecall;
    function get_OpenPaneLength: Double; safecall;
    procedure put_OpenPaneLength(value: Double); safecall;
    function get_CompactPaneLength: Double; safecall;
    procedure put_CompactPaneLength(value: Double); safecall;
    function get_PanePlacement: SplitViewPanePlacement; safecall;
    procedure put_PanePlacement(value: SplitViewPanePlacement); safecall;
    function get_DisplayMode: SplitViewDisplayMode; safecall;
    procedure put_DisplayMode(value: SplitViewDisplayMode); safecall;
    function get_TemplateSettings: Primitives_ISplitViewTemplateSettings; safecall;
    function get_PaneBackground: IBrush; safecall;
    procedure put_PaneBackground(value: IBrush); safecall;
    function get_LightDismissOverlayMode: LightDismissOverlayMode; safecall;
    procedure put_LightDismissOverlayMode(value: LightDismissOverlayMode); safecall;
    function add_PaneClosing(handler: TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_PaneClosing(token: EventRegistrationToken); safecall;
    function add_PaneClosed(handler: TypedEventHandler_2__ISplitView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PaneClosed(token: EventRegistrationToken); safecall;
    function add_PaneOpening(handler: TypedEventHandler_2__ISplitView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PaneOpening(token: EventRegistrationToken); safecall;
    function add_PaneOpened(handler: TypedEventHandler_2__ISplitView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PaneOpened(token: EventRegistrationToken); safecall;
    property CompactPaneLength: Double read get_CompactPaneLength write put_CompactPaneLength;
    property Content: IUIElement read get_Content write put_Content;
    property DisplayMode: SplitViewDisplayMode read get_DisplayMode write put_DisplayMode;
    property IsPaneOpen: Boolean read get_IsPaneOpen write put_IsPaneOpen;
    property LightDismissOverlayMode_: LightDismissOverlayMode read get_LightDismissOverlayMode write put_LightDismissOverlayMode;
    property OpenPaneLength: Double read get_OpenPaneLength write put_OpenPaneLength;
    property Pane: IUIElement read get_Pane write put_Pane;
    property PaneBackground: IBrush read get_PaneBackground write put_PaneBackground;
    property PanePlacement: SplitViewPanePlacement read get_PanePlacement write put_PanePlacement;
    property TemplateSettings: Primitives_ISplitViewTemplateSettings read get_TemplateSettings;
  end;

  // Microsoft.UI.Xaml.Controls.Primitives.ISplitViewTemplateSettings
  // External
  Primitives_ISplitViewTemplateSettings = interface(IInspectable)
  ['{44D6F6F7-0058-5EAC-8837-F7F16D961F7C}']
    function get_OpenPaneLength: Double; safecall;
    function get_NegativeOpenPaneLength: Double; safecall;
    function get_OpenPaneLengthMinusCompactLength: Double; safecall;
    function get_NegativeOpenPaneLengthMinusCompactLength: Double; safecall;
    function get_OpenPaneGridLength: GridLength; safecall;
    function get_CompactPaneGridLength: GridLength; safecall;
    property CompactPaneGridLength: GridLength read get_CompactPaneGridLength;
    property NegativeOpenPaneLength: Double read get_NegativeOpenPaneLength;
    property NegativeOpenPaneLengthMinusCompactLength: Double read get_NegativeOpenPaneLengthMinusCompactLength;
    property OpenPaneGridLength: GridLength read get_OpenPaneGridLength;
    property OpenPaneLength: Double read get_OpenPaneLength;
    property OpenPaneLengthMinusCompactLength: Double read get_OpenPaneLengthMinusCompactLength;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Microsoft.UI.Xaml.Controls.ISplitViewPaneClosingEventArgs>
  TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{0B36ECED-A30B-5D10-BF9A-46FD9F94EF4E}']
    procedure Invoke(sender: ISplitView; args: ISplitViewPaneClosingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISplitView,Microsoft.UI.Xaml.Controls.ISplitViewPaneClosingEventArgs>
  // External
  TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs = interface(TypedEventHandler_2__ISplitView__ISplitViewPaneClosingEventArgs_Delegate_Base)
  ['{7A5AD6D5-FF76-54BB-937F-1F3D8693FA2E}']
  end;

  // Microsoft.UI.Xaml.Controls.ISplitViewPaneClosingEventArgs
  // External
  ISplitViewPaneClosingEventArgs = interface(IInspectable)
  ['{9138965B-8499-5F9C-93E0-34BEDA441E6D}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISwapChainPanel,Object>
  TypedEventHandler_2__ISwapChainPanel__IInspectable_Delegate_Base = interface(IUnknown)
  ['{20DDC438-23C6-50EC-9CA4-261AB79EDBA7}']
    procedure Invoke(sender: ISwapChainPanel; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ISwapChainPanel,Object>
  // External
  TypedEventHandler_2__ISwapChainPanel__IInspectable = interface(TypedEventHandler_2__ISwapChainPanel__IInspectable_Delegate_Base)
  ['{98EF2F75-8DFC-59C1-AE4F-B7514303712D}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ISwapChainPanel
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_SwapChainPanel)]
  ISwapChainPanel = interface(IInspectable)
  ['{08844F85-AA1B-540D-BEF2-B2BB7B257F8C}']
    function get_CompositionScaleX: Single; safecall;
    function get_CompositionScaleY: Single; safecall;
    function add_CompositionScaleChanged(handler: TypedEventHandler_2__ISwapChainPanel__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CompositionScaleChanged(token: EventRegistrationToken); safecall;
    function CreateCoreIndependentInputSource(deviceKinds: InputPointerSourceDeviceKinds): IInputPointerSource; safecall;
    property CompositionScaleX: Single read get_CompositionScaleX;
    property CompositionScaleY: Single read get_CompositionScaleY;
  end;

  // Microsoft.UI.Input.IInputPointerSource
  // External
  IInputPointerSource = interface(IInspectable)
  ['{6A6C2764-C3F4-5BE5-8447-C9A98766C240}']
    function get_Cursor: IInputCursor; safecall;
    procedure put_Cursor(value: IInputCursor); safecall;
    function get_DeviceKinds: InputPointerSourceDeviceKinds; safecall;
    function add_PointerCaptureLost(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerCaptureLost(token: EventRegistrationToken); safecall;
    function add_PointerEntered(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerEntered(token: EventRegistrationToken); safecall;
    function add_PointerExited(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerExited(token: EventRegistrationToken); safecall;
    function add_PointerMoved(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerMoved(token: EventRegistrationToken); safecall;
    function add_PointerPressed(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerPressed(token: EventRegistrationToken); safecall;
    function add_PointerReleased(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerReleased(token: EventRegistrationToken); safecall;
    function add_PointerRoutedAway(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerRoutedAway(token: EventRegistrationToken); safecall;
    function add_PointerRoutedReleased(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerRoutedReleased(token: EventRegistrationToken); safecall;
    function add_PointerRoutedTo(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerRoutedTo(token: EventRegistrationToken); safecall;
    function add_PointerWheelChanged(handler: TypedEventHandler_2__IInputPointerSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerWheelChanged(token: EventRegistrationToken); safecall;
    property Cursor: IInputCursor read get_Cursor write put_Cursor;
    property DeviceKinds: InputPointerSourceDeviceKinds read get_DeviceKinds;
  end;

  // Microsoft.UI.Input.IInputCursor
  // External
  IInputCursor = interface(IInspectable)
  ['{359B15F9-19C2-5714-8432-75176826406B}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Input.IInputPointerSource,Microsoft.UI.Input.IPointerEventArgs>
  TypedEventHandler_2__IInputPointerSource__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{040480BE-4741-587D-9888-8694414A2650}']
    procedure Invoke(sender: IInputPointerSource; args: IPointerEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Input.IInputPointerSource,Microsoft.UI.Input.IPointerEventArgs>
  // External
  TypedEventHandler_2__IInputPointerSource__IPointerEventArgs = interface(TypedEventHandler_2__IInputPointerSource__IPointerEventArgs_Delegate_Base)
  ['{CA6CDC20-121D-5EA1-904E-84F7C177B6E0}']
  end;

  // Microsoft.UI.Input.IPointerEventArgs
  // External
  IPointerEventArgs = interface(IInspectable)
  ['{865B188C-2ED5-5DF8-829F-AC0701D5C51A}']
    function get_CurrentPoint: IPointerPoint; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_KeyModifiers: VirtualKeyModifiers; safecall;
    function GetIntermediatePoints: IVector_1__IPointerPoint; safecall;
    function GetIntermediateTransformedPoints(transform: IPointerPointTransform): IVector_1__IPointerPoint; safecall;
    property CurrentPoint: IPointerPoint read get_CurrentPoint;
    property Handled: Boolean read get_Handled write put_Handled;
    property KeyModifiers: VirtualKeyModifiers read get_KeyModifiers;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITwoPaneView,Object>
  TypedEventHandler_2__ITwoPaneView__IInspectable_Delegate_Base = interface(IUnknown)
  ['{4CADEF4C-9C4A-586E-B9F1-A09396E937AF}']
    procedure Invoke(sender: ITwoPaneView; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITwoPaneView,Object>
  // External
  TypedEventHandler_2__ITwoPaneView__IInspectable = interface(TypedEventHandler_2__ITwoPaneView__IInspectable_Delegate_Base)
  ['{5FDF1A13-5772-5DBF-95BA-7B15AD414615}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITwoPaneView
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TwoPaneView)]
  ITwoPaneView = interface(IInspectable)
  ['{8D2E56D9-C333-5F15-81D1-B8B27E076522}']
    function get_Pane1: IUIElement; safecall;
    procedure put_Pane1(value: IUIElement); safecall;
    function get_Pane2: IUIElement; safecall;
    procedure put_Pane2(value: IUIElement); safecall;
    function get_Pane1Length: GridLength; safecall;
    procedure put_Pane1Length(value: GridLength); safecall;
    function get_Pane2Length: GridLength; safecall;
    procedure put_Pane2Length(value: GridLength); safecall;
    function get_PanePriority: TwoPaneViewPriority; safecall;
    procedure put_PanePriority(value: TwoPaneViewPriority); safecall;
    function get_Mode: TwoPaneViewMode; safecall;
    function get_WideModeConfiguration: TwoPaneViewWideModeConfiguration; safecall;
    procedure put_WideModeConfiguration(value: TwoPaneViewWideModeConfiguration); safecall;
    function get_TallModeConfiguration: TwoPaneViewTallModeConfiguration; safecall;
    procedure put_TallModeConfiguration(value: TwoPaneViewTallModeConfiguration); safecall;
    function get_MinWideModeWidth: Double; safecall;
    procedure put_MinWideModeWidth(value: Double); safecall;
    function get_MinTallModeHeight: Double; safecall;
    procedure put_MinTallModeHeight(value: Double); safecall;
    function add_ModeChanged(handler: TypedEventHandler_2__ITwoPaneView__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ModeChanged(token: EventRegistrationToken); safecall;
    property MinTallModeHeight: Double read get_MinTallModeHeight write put_MinTallModeHeight;
    property MinWideModeWidth: Double read get_MinWideModeWidth write put_MinWideModeWidth;
    property Mode: TwoPaneViewMode read get_Mode;
    property Pane1: IUIElement read get_Pane1 write put_Pane1;
    property Pane1Length: GridLength read get_Pane1Length write put_Pane1Length;
    property Pane2: IUIElement read get_Pane2 write put_Pane2;
    property Pane2Length: GridLength read get_Pane2Length write put_Pane2Length;
    property PanePriority: TwoPaneViewPriority read get_PanePriority write put_PanePriority;
    property TallModeConfiguration: TwoPaneViewTallModeConfiguration read get_TallModeConfiguration write put_TallModeConfiguration;
    property WideModeConfiguration: TwoPaneViewWideModeConfiguration read get_WideModeConfiguration write put_WideModeConfiguration;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Interop.INotifyCollectionChangedEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Interop_NotifyCollectionChangedEventArgs)]
  Interop_INotifyCollectionChangedEventArgs = interface(IInspectable)
  ['{DA049FF2-D2E0-5FE8-8C7B-F87F26060B6F}']
    function get_Action: Interop_NotifyCollectionChangedAction; safecall;
    function get_NewItems: Interop_IBindableVector; safecall;
    function get_OldItems: Interop_IBindableVector; safecall;
    function get_NewStartingIndex: Integer; safecall;
    function get_OldStartingIndex: Integer; safecall;
    property Action: Interop_NotifyCollectionChangedAction read get_Action;
    property NewItems: Interop_IBindableVector read get_NewItems;
    property NewStartingIndex: Integer read get_NewStartingIndex;
    property OldItems: Interop_IBindableVector read get_OldItems;
    property OldStartingIndex: Integer read get_OldStartingIndex;
  end;

  // Microsoft.UI.Xaml.Interop.IBindableVector
  // External
  Interop_IBindableVector = interface(IInspectable)
  ['{393DE7DE-6FD0-4C0D-BB71-47244A113E93}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: Interop_IBindableVectorView; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IInspectable); safecall;
    procedure InsertAt(index: Cardinal; value: IInspectable); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IInspectable); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.UI.Xaml.Interop.IBindableVectorView
  // External
  Interop_IBindableVectorView = interface(IInspectable)
  ['{346DD6E7-976E-4BC3-815D-ECE243BC0F33}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Object>
  TypedEventHandler_2__ITeachingTip__IInspectable_Delegate_Base = interface(IUnknown)
  ['{0060BD6F-5E3F-538C-A348-C5F6910C9732}']
    procedure Invoke(sender: ITeachingTip; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Object>
  // External
  TypedEventHandler_2__ITeachingTip__IInspectable = interface(TypedEventHandler_2__ITeachingTip__IInspectable_Delegate_Base)
  ['{1E2D767B-20B9-5218-809A-79FA6BC9C1AD}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITeachingTip
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TeachingTip)]
  ITeachingTip = interface(IInspectable)
  ['{DAEBD5F7-3B47-5B12-B804-F4E1442B2113}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    function get_IsOpen: Boolean; safecall;
    procedure put_IsOpen(value: Boolean); safecall;
    function get_Target: IFrameworkElement; safecall;
    procedure put_Target(value: IFrameworkElement); safecall;
    function get_TailVisibility: TeachingTipTailVisibility; safecall;
    procedure put_TailVisibility(value: TeachingTipTailVisibility); safecall;
    function get_ActionButtonContent: IInspectable; safecall;
    procedure put_ActionButtonContent(value: IInspectable); safecall;
    function get_ActionButtonStyle: IStyle; safecall;
    procedure put_ActionButtonStyle(value: IStyle); safecall;
    function get_ActionButtonCommand: Input_ICommand; safecall;
    procedure put_ActionButtonCommand(value: Input_ICommand); safecall;
    function get_ActionButtonCommandParameter: IInspectable; safecall;
    procedure put_ActionButtonCommandParameter(value: IInspectable); safecall;
    function get_CloseButtonContent: IInspectable; safecall;
    procedure put_CloseButtonContent(value: IInspectable); safecall;
    function get_CloseButtonStyle: IStyle; safecall;
    procedure put_CloseButtonStyle(value: IStyle); safecall;
    function get_CloseButtonCommand: Input_ICommand; safecall;
    procedure put_CloseButtonCommand(value: Input_ICommand); safecall;
    function get_CloseButtonCommandParameter: IInspectable; safecall;
    procedure put_CloseButtonCommandParameter(value: IInspectable); safecall;
    function get_PlacementMargin: Thickness; safecall;
    procedure put_PlacementMargin(value: Thickness); safecall;
    function get_ShouldConstrainToRootBounds: Boolean; safecall;
    procedure put_ShouldConstrainToRootBounds(value: Boolean); safecall;
    function get_IsLightDismissEnabled: Boolean; safecall;
    procedure put_IsLightDismissEnabled(value: Boolean); safecall;
    function get_PreferredPlacement: TeachingTipPlacementMode; safecall;
    procedure put_PreferredPlacement(value: TeachingTipPlacementMode); safecall;
    function get_HeroContentPlacement: TeachingTipHeroContentPlacementMode; safecall;
    procedure put_HeroContentPlacement(value: TeachingTipHeroContentPlacementMode); safecall;
    function get_HeroContent: IUIElement; safecall;
    procedure put_HeroContent(value: IUIElement); safecall;
    function get_IconSource: IIconSource; safecall;
    procedure put_IconSource(value: IIconSource); safecall;
    function get_TemplateSettings: ITeachingTipTemplateSettings; safecall;
    function add_ActionButtonClick(handler: TypedEventHandler_2__ITeachingTip__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ActionButtonClick(token: EventRegistrationToken); safecall;
    function add_CloseButtonClick(handler: TypedEventHandler_2__ITeachingTip__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CloseButtonClick(token: EventRegistrationToken); safecall;
    function add_Closing(handler: TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closing(token: EventRegistrationToken); safecall;
    function add_Closed(handler: TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    property ActionButtonCommand: Input_ICommand read get_ActionButtonCommand write put_ActionButtonCommand;
    property ActionButtonCommandParameter: IInspectable read get_ActionButtonCommandParameter write put_ActionButtonCommandParameter;
    property ActionButtonContent: IInspectable read get_ActionButtonContent write put_ActionButtonContent;
    property ActionButtonStyle: IStyle read get_ActionButtonStyle write put_ActionButtonStyle;
    property CloseButtonCommand: Input_ICommand read get_CloseButtonCommand write put_CloseButtonCommand;
    property CloseButtonCommandParameter: IInspectable read get_CloseButtonCommandParameter write put_CloseButtonCommandParameter;
    property CloseButtonContent: IInspectable read get_CloseButtonContent write put_CloseButtonContent;
    property CloseButtonStyle: IStyle read get_CloseButtonStyle write put_CloseButtonStyle;
    property HeroContent: IUIElement read get_HeroContent write put_HeroContent;
    property HeroContentPlacement: TeachingTipHeroContentPlacementMode read get_HeroContentPlacement write put_HeroContentPlacement;
    property IconSource: IIconSource read get_IconSource write put_IconSource;
    property IsLightDismissEnabled: Boolean read get_IsLightDismissEnabled write put_IsLightDismissEnabled;
    property IsOpen: Boolean read get_IsOpen write put_IsOpen;
    property PlacementMargin: Thickness read get_PlacementMargin write put_PlacementMargin;
    property PreferredPlacement: TeachingTipPlacementMode read get_PreferredPlacement write put_PreferredPlacement;
    property ShouldConstrainToRootBounds: Boolean read get_ShouldConstrainToRootBounds write put_ShouldConstrainToRootBounds;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property TailVisibility: TeachingTipTailVisibility read get_TailVisibility write put_TailVisibility;
    property Target: IFrameworkElement read get_Target write put_Target;
    property TemplateSettings: ITeachingTipTemplateSettings read get_TemplateSettings;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.ITeachingTipTemplateSettings
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_TeachingTipTemplateSettings)]
  ITeachingTipTemplateSettings = interface(IInspectable)
  ['{B081E1E9-C1A5-590A-8049-69EA003B6CF7}']
    function get_TopRightHighlightMargin: Thickness; safecall;
    procedure put_TopRightHighlightMargin(value: Thickness); safecall;
    function get_TopLeftHighlightMargin: Thickness; safecall;
    procedure put_TopLeftHighlightMargin(value: Thickness); safecall;
    function get_IconElement: IIconElement; safecall;
    procedure put_IconElement(value: IIconElement); safecall;
    property IconElement: IIconElement read get_IconElement write put_IconElement;
    property TopLeftHighlightMargin: Thickness read get_TopLeftHighlightMargin write put_TopLeftHighlightMargin;
    property TopRightHighlightMargin: Thickness read get_TopRightHighlightMargin write put_TopRightHighlightMargin;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosingEventArgs>
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{3151FF5A-0AC1-5D10-92C4-31458B088B9F}']
    procedure Invoke(sender: ITeachingTip; args: ITeachingTipClosingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosingEventArgs>
  // External
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs = interface(TypedEventHandler_2__ITeachingTip__ITeachingTipClosingEventArgs_Delegate_Base)
  ['{2C48290C-5E5E-54AB-BA53-C27F6E7CD702}']
  end;

  // Microsoft.UI.Xaml.Controls.ITeachingTipClosingEventArgs
  // External
  ITeachingTipClosingEventArgs = interface(IInspectable)
  ['{16F53512-3C55-5636-A856-229D9768D64E}']
    function get_Reason: TeachingTipCloseReason; safecall;
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function GetDeferral: IDeferral; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property Reason: TeachingTipCloseReason read get_Reason;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosedEventArgs>
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs_Delegate_Base = interface(IUnknown)
  ['{6C950EAB-56AA-5312-8BDC-E87C4DC1C3BB}']
    procedure Invoke(sender: ITeachingTip; args: ITeachingTipClosedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.ITeachingTip,Microsoft.UI.Xaml.Controls.ITeachingTipClosedEventArgs>
  // External
  TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs = interface(TypedEventHandler_2__ITeachingTip__ITeachingTipClosedEventArgs_Delegate_Base)
  ['{960418C9-2FB8-5575-8A37-F4F5006517D8}']
  end;

  // Microsoft.UI.Xaml.Controls.ITeachingTipClosedEventArgs
  // External
  ITeachingTipClosedEventArgs = interface(IInspectable)
  ['{2536F506-4038-59DB-9E35-A9252FB5ADB2}']
    function get_Reason: TeachingTipCloseReason; safecall;
    property Reason: TeachingTipCloseReason read get_Reason;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IInline>
  IVector_1__Documents_IInline_Base = interface(IInspectable)
  ['{0015A441-4C98-5D3F-8823-03E722615C48}']
    function GetAt(index: Cardinal): Documents_IInline; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Documents_IInline; safecall;
    function IndexOf(value: Documents_IInline; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Documents_IInline); safecall;
    procedure InsertAt(index: Cardinal; value: Documents_IInline); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Documents_IInline); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_IInline): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDocuments_IInline); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Documents.IInline>
  // External
  IVector_1__Documents_IInline = interface(IVector_1__Documents_IInline_Base)
  ['{5B467E69-B101-5B71-9971-F2B645368F1B}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Documents.IInline
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Documents_Inline)]
  Documents_IInline = interface(IInspectable)
  ['{813D427A-8980-5A79-A8FA-F27919CFB24F}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Documents.IInline>
  // External
  IVectorView_1__Documents_IInline = interface(IInspectable)
  ['{A3A5F367-CAEB-5365-B0A7-6074BD7FEB12}']
    function GetAt(index: Cardinal): Documents_IInline; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Documents_IInline; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_IInline): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Animation.IConnectedAnimation,Object>
  TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable_Delegate_Base = interface(IUnknown)
  ['{D35B3375-A0EF-59CA-88CF-DC9B4E42953E}']
    procedure Invoke(sender: Animation_IConnectedAnimation; args: IInspectable); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Animation.IConnectedAnimation,Object>
  // External
  TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable = interface(TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable_Delegate_Base)
  ['{72A9D865-3331-5E38-94A8-90540D6D4930}']
  end;

  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimation
  // External
  Animation_IConnectedAnimation = interface(IInspectable)
  ['{A9C1C6AD-7670-589C-A608-9B5C01CEC71F}']
    function get_IsScaleAnimationEnabled: Boolean; safecall;
    procedure put_IsScaleAnimationEnabled(value: Boolean); safecall;
    function get_Configuration: Animation_IConnectedAnimationConfiguration; safecall;
    procedure put_Configuration(value: Animation_IConnectedAnimationConfiguration); safecall;
    function add_Completed(handler: TypedEventHandler_2__Animation_IConnectedAnimation__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    function TryStart(destination: IUIElement): Boolean; overload; safecall;
    function TryStart(destination: IUIElement; coordinatedElements: IIterable_1__IUIElement): Boolean; overload; safecall;
    procedure Cancel; safecall;
    procedure SetAnimationComponent(component: Animation_ConnectedAnimationComponent; animation: ICompositionAnimationBase); safecall;
    property Configuration: Animation_IConnectedAnimationConfiguration read get_Configuration write put_Configuration;
    property IsScaleAnimationEnabled: Boolean read get_IsScaleAnimationEnabled write put_IsScaleAnimationEnabled;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfiguration
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ConnectedAnimationConfiguration)]
  Animation_IConnectedAnimationConfiguration = interface(IInspectable)
  ['{E848379D-7E25-5976-BFB3-086BAC4E8849}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.IUIElement>
  IIterable_1__IUIElement_Base = interface(IInspectable)
  ['{459BB954-42A3-5C74-8F87-42458F19AEAA}']
    function First: IIterator_1__IUIElement; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.IUIElement>
  // External
  IIterable_1__IUIElement = interface(IIterable_1__IUIElement_Base)
  ['{38E3FDE7-9087-5955-9380-2B7880566B15}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.IUIElement>
  IIterator_1__IUIElement_Base = interface(IInspectable)
  ['{C5F188B0-C653-5209-909A-EB97CA691617}']
    function get_Current: IUIElement; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIUIElement): Cardinal; safecall;
    property Current: IUIElement read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.IUIElement>
  // External
  IIterator_1__IUIElement = interface(IIterator_1__IUIElement_Base)
  ['{779A9185-4047-5869-BFD0-1E997BE564A8}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IListViewBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ListViewBase)]
  IListViewBase = interface(IInspectable)
  ['{775C57AC-ABCE-5BEB-8E34-3B8158AEDD80}']
    function get_SelectedItems: IVector_1__IInspectable; safecall;
    function get_SelectionMode: ListViewSelectionMode; safecall;
    procedure put_SelectionMode(value: ListViewSelectionMode); safecall;
    function get_IsSwipeEnabled: Boolean; safecall;
    procedure put_IsSwipeEnabled(value: Boolean); safecall;
    function get_CanDragItems: Boolean; safecall;
    procedure put_CanDragItems(value: Boolean); safecall;
    function get_CanReorderItems: Boolean; safecall;
    procedure put_CanReorderItems(value: Boolean); safecall;
    function get_IsItemClickEnabled: Boolean; safecall;
    procedure put_IsItemClickEnabled(value: Boolean); safecall;
    function get_DataFetchSize: Double; safecall;
    procedure put_DataFetchSize(value: Double); safecall;
    function get_IncrementalLoadingThreshold: Double; safecall;
    procedure put_IncrementalLoadingThreshold(value: Double); safecall;
    function get_IncrementalLoadingTrigger: IncrementalLoadingTrigger; safecall;
    procedure put_IncrementalLoadingTrigger(value: IncrementalLoadingTrigger); safecall;
    function get_ShowsScrollingPlaceholders: Boolean; safecall;
    procedure put_ShowsScrollingPlaceholders(value: Boolean); safecall;
    function get_ReorderMode: ListViewReorderMode; safecall;
    procedure put_ReorderMode(value: ListViewReorderMode); safecall;
    function get_SelectedRanges: IVectorView_1__Data_IItemIndexRange; safecall;
    function get_IsMultiSelectCheckBoxEnabled: Boolean; safecall;
    procedure put_IsMultiSelectCheckBoxEnabled(value: Boolean); safecall;
    function get_SingleSelectionFollowsFocus: Boolean; safecall;
    procedure put_SingleSelectionFollowsFocus(value: Boolean); safecall;
    function add_ItemClick(handler: ItemClickEventHandler): EventRegistrationToken; safecall;
    procedure remove_ItemClick(token: EventRegistrationToken); safecall;
    function add_DragItemsStarting(handler: DragItemsStartingEventHandler): EventRegistrationToken; safecall;
    procedure remove_DragItemsStarting(token: EventRegistrationToken); safecall;
    function add_DragItemsCompleted(handler: TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DragItemsCompleted(token: EventRegistrationToken); safecall;
    function add_ContainerContentChanging(handler: TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs): EventRegistrationToken; safecall;
    procedure remove_ContainerContentChanging(token: EventRegistrationToken); safecall;
    function add_ChoosingItemContainer(handler: TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs): EventRegistrationToken; safecall;
    procedure remove_ChoosingItemContainer(token: EventRegistrationToken); safecall;
    function add_ChoosingGroupHeaderContainer(handler: TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs): EventRegistrationToken; safecall;
    procedure remove_ChoosingGroupHeaderContainer(token: EventRegistrationToken); safecall;
    procedure ScrollIntoView(item: IInspectable); overload; safecall;
    procedure SelectAll; safecall;
    function LoadMoreItemsAsync: IAsyncOperation_1__Data_LoadMoreItemsResult; safecall;
    procedure ScrollIntoView(item: IInspectable; alignment: ScrollIntoViewAlignment); overload; safecall;
    procedure SetDesiredContainerUpdateDuration(duration: TimeSpan); safecall;
    procedure SelectRange(itemIndexRange: Data_IItemIndexRange); safecall;
    procedure DeselectRange(itemIndexRange: Data_IItemIndexRange); safecall;
    function IsDragSource: Boolean; safecall;
    function TryStartConnectedAnimationAsync(animation: Animation_IConnectedAnimation; item: IInspectable; elementName: HSTRING): IAsyncOperation_1__Boolean; safecall;
    function PrepareConnectedAnimation(key: HSTRING; item: IInspectable; elementName: HSTRING): Animation_IConnectedAnimation; safecall;
    function get_Header: IInspectable; safecall;
    procedure put_Header(value: IInspectable); safecall;
    function get_HeaderTemplate: IDataTemplate; safecall;
    procedure put_HeaderTemplate(value: IDataTemplate); safecall;
    function get_HeaderTransitions: IVector_1__Animation_ITransition; safecall;
    procedure put_HeaderTransitions(value: IVector_1__Animation_ITransition); safecall;
    function get_Footer: IInspectable; safecall;
    procedure put_Footer(value: IInspectable); safecall;
    function get_FooterTemplate: IDataTemplate; safecall;
    procedure put_FooterTemplate(value: IDataTemplate); safecall;
    function get_FooterTransitions: IVector_1__Animation_ITransition; safecall;
    procedure put_FooterTransitions(value: IVector_1__Animation_ITransition); safecall;
    property CanDragItems: Boolean read get_CanDragItems write put_CanDragItems;
    property CanReorderItems: Boolean read get_CanReorderItems write put_CanReorderItems;
    property DataFetchSize: Double read get_DataFetchSize write put_DataFetchSize;
    property Footer: IInspectable read get_Footer write put_Footer;
    property FooterTemplate: IDataTemplate read get_FooterTemplate write put_FooterTemplate;
    property FooterTransitions: IVector_1__Animation_ITransition read get_FooterTransitions write put_FooterTransitions;
    property Header: IInspectable read get_Header write put_Header;
    property HeaderTemplate: IDataTemplate read get_HeaderTemplate write put_HeaderTemplate;
    property HeaderTransitions: IVector_1__Animation_ITransition read get_HeaderTransitions write put_HeaderTransitions;
    property IncrementalLoadingThreshold: Double read get_IncrementalLoadingThreshold write put_IncrementalLoadingThreshold;
    property IncrementalLoadingTrigger_: IncrementalLoadingTrigger read get_IncrementalLoadingTrigger write put_IncrementalLoadingTrigger;
    property IsItemClickEnabled: Boolean read get_IsItemClickEnabled write put_IsItemClickEnabled;
    property IsMultiSelectCheckBoxEnabled: Boolean read get_IsMultiSelectCheckBoxEnabled write put_IsMultiSelectCheckBoxEnabled;
    property IsSwipeEnabled: Boolean read get_IsSwipeEnabled write put_IsSwipeEnabled;
    property ReorderMode: ListViewReorderMode read get_ReorderMode write put_ReorderMode;
    property SelectedItems: IVector_1__IInspectable read get_SelectedItems;
    property SelectedRanges: IVectorView_1__Data_IItemIndexRange read get_SelectedRanges;
    property SelectionMode: ListViewSelectionMode read get_SelectionMode write put_SelectionMode;
    property ShowsScrollingPlaceholders: Boolean read get_ShowsScrollingPlaceholders write put_ShowsScrollingPlaceholders;
    property SingleSelectionFollowsFocus: Boolean read get_SingleSelectionFollowsFocus write put_SingleSelectionFollowsFocus;
  end;

  // Microsoft.UI.Xaml.Controls.ItemClickEventHandler
  // External
  ItemClickEventHandler = interface(IUnknown)
  ['{A3903624-3393-566C-A6B9-A6B4B3E301C3}']
    procedure Invoke(sender: IInspectable; e: IItemClickEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IItemClickEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ItemClickEventArgs)]
  IItemClickEventArgs = interface(IInspectable)
  ['{1CF87A70-6348-57EC-9EAC-FA0565ADC60F}']
    function get_ClickedItem: IInspectable; safecall;
    property ClickedItem: IInspectable read get_ClickedItem;
  end;

  // Microsoft.UI.Xaml.Controls.DragItemsStartingEventHandler
  // External
  DragItemsStartingEventHandler = interface(IUnknown)
  ['{55532800-7617-5D67-80BF-B98C0A41B9D6}']
    procedure Invoke(sender: IInspectable; e: IDragItemsStartingEventArgs); safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IDragItemsStartingEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_DragItemsStartingEventArgs)]
  IDragItemsStartingEventArgs = interface(IInspectable)
  ['{A6938886-20DF-558E-AC74-BB5B7F2F7E90}']
    function get_Cancel: Boolean; safecall;
    procedure put_Cancel(value: Boolean); safecall;
    function get_Items: IVector_1__IInspectable; safecall;
    function get_Data: IDataPackage; safecall;
    property Cancel: Boolean read get_Cancel write put_Cancel;
    property Data: IDataPackage read get_Data;
    property Items: IVector_1__IInspectable read get_Items;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IDragItemsCompletedEventArgs>
  TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{444371A2-4E78-5D30-BB5C-B358C28ABD72}']
    procedure Invoke(sender: IListViewBase; args: IDragItemsCompletedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IDragItemsCompletedEventArgs>
  // External
  TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs = interface(TypedEventHandler_2__IListViewBase__IDragItemsCompletedEventArgs_Delegate_Base)
  ['{35CB58CD-06AD-5642-AD55-FFE3C74A5253}']
  end;

  // Microsoft.UI.Xaml.Controls.IDragItemsCompletedEventArgs
  // External
  IDragItemsCompletedEventArgs = interface(IInspectable)
  ['{C0138552-F467-5C3E-8AF4-593607762844}']
    function get_Items: IVectorView_1__IInspectable; safecall;
    function get_DropResult: DataPackageOperation; safecall;
    property DropResult: DataPackageOperation read get_DropResult;
    property Items: IVectorView_1__IInspectable read get_Items;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IContainerContentChangingEventArgs>
  TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs_Delegate_Base = interface(IUnknown)
  ['{A6F1A151-7A50-5F54-988D-97CAD557DE3B}']
    procedure Invoke(sender: IListViewBase; args: IContainerContentChangingEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IContainerContentChangingEventArgs>
  // External
  TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs = interface(TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs_Delegate_Base)
  ['{5C3DB733-0D5E-5557-9B6B-363033AC5325}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IContainerContentChangingEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ContainerContentChangingEventArgs)]
  IContainerContentChangingEventArgs = interface(IInspectable)
  ['{F4C8C937-B070-53CE-A76C-074EE5750A71}']
    function get_ItemContainer: Primitives_ISelectorItem; safecall;
    function get_InRecycleQueue: Boolean; safecall;
    function get_ItemIndex: Integer; safecall;
    function get_Item: IInspectable; safecall;
    function get_Phase: Cardinal; safecall;
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    procedure RegisterUpdateCallback(callback: TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs); overload; safecall;
    procedure RegisterUpdateCallback(callbackPhase: Cardinal; callback: TypedEventHandler_2__IListViewBase__IContainerContentChangingEventArgs); overload; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property InRecycleQueue: Boolean read get_InRecycleQueue;
    property Item: IInspectable read get_Item;
    property ItemContainer: Primitives_ISelectorItem read get_ItemContainer;
    property ItemIndex: Integer read get_ItemIndex;
    property Phase: Cardinal read get_Phase;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.Primitives.ISelectorItem
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Primitives_SelectorItem)]
  Primitives_ISelectorItem = interface(IInspectable)
  ['{5772C4DE-60EA-5492-8C5E-B3323D5A3CA6}']
    function get_IsSelected: Boolean; safecall;
    procedure put_IsSelected(value: Boolean); safecall;
    property IsSelected: Boolean read get_IsSelected write put_IsSelected;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingItemContainerEventArgs>
  TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs_Delegate_Base = interface(IUnknown)
  ['{02D018BF-AB83-51D0-94D9-61166D8CC929}']
    procedure Invoke(sender: IListViewBase; args: IChoosingItemContainerEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingItemContainerEventArgs>
  // External
  TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs = interface(TypedEventHandler_2__IListViewBase__IChoosingItemContainerEventArgs_Delegate_Base)
  ['{6F64B2B0-731E-51C1-A879-FDF2398C2C6E}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IChoosingItemContainerEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ChoosingItemContainerEventArgs)]
  IChoosingItemContainerEventArgs = interface(IInspectable)
  ['{B479B9D2-A63F-5638-9486-8CCC1F40251E}']
    function get_ItemIndex: Integer; safecall;
    function get_Item: IInspectable; safecall;
    function get_ItemContainer: Primitives_ISelectorItem; safecall;
    procedure put_ItemContainer(value: Primitives_ISelectorItem); safecall;
    function get_IsContainerPrepared: Boolean; safecall;
    procedure put_IsContainerPrepared(value: Boolean); safecall;
    property IsContainerPrepared: Boolean read get_IsContainerPrepared write put_IsContainerPrepared;
    property Item: IInspectable read get_Item;
    property ItemContainer: Primitives_ISelectorItem read get_ItemContainer write put_ItemContainer;
    property ItemIndex: Integer read get_ItemIndex;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingGroupHeaderContainerEventArgs>
  TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs_Delegate_Base = interface(IUnknown)
  ['{AE81621C-C974-53DD-9E7E-602C6BA07426}']
    procedure Invoke(sender: IListViewBase; args: IChoosingGroupHeaderContainerEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IListViewBase,Microsoft.UI.Xaml.Controls.IChoosingGroupHeaderContainerEventArgs>
  // External
  TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs = interface(TypedEventHandler_2__IListViewBase__IChoosingGroupHeaderContainerEventArgs_Delegate_Base)
  ['{B507DDE3-5AB1-50B0-B750-178C0B839CA3}']
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IChoosingGroupHeaderContainerEventArgs
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ChoosingGroupHeaderContainerEventArgs)]
  IChoosingGroupHeaderContainerEventArgs = interface(IInspectable)
  ['{2DB1B0B0-AEE9-55FA-8C30-C98F00643D00}']
    function get_GroupHeaderContainer: IListViewBaseHeaderItem; safecall;
    procedure put_GroupHeaderContainer(value: IListViewBaseHeaderItem); safecall;
    function get_GroupIndex: Integer; safecall;
    function get_Group: IInspectable; safecall;
    property Group: IInspectable read get_Group;
    property GroupHeaderContainer: IListViewBaseHeaderItem read get_GroupHeaderContainer write put_GroupHeaderContainer;
    property GroupIndex: Integer read get_GroupIndex;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IListViewBaseHeaderItem
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_ListViewBaseHeaderItem)]
  IListViewBaseHeaderItem = interface(IInspectable)
  ['{9220C4FF-1974-53FD-AD74-C29E7B360A06}']
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Controls.Primitives.IPopup>
  // External
  IVectorView_1__Primitives_IPopup = interface(IInspectable)
  ['{8DD15C68-340B-573D-9342-1D6D231A51CE}']
    function GetAt(index: Cardinal): Primitives_IPopup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Primitives_IPopup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrimitives_IPopup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.Primitives.IPopup
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_Primitives_Popup)]
  Primitives_IPopup = interface(IInspectable)
  ['{4E3AB19D-2F95-579C-9535-906C58629437}']
    function get_Child: IUIElement; safecall;
    procedure put_Child(value: IUIElement); safecall;
    function get_IsOpen: Boolean; safecall;
    procedure put_IsOpen(value: Boolean); safecall;
    function get_HorizontalOffset: Double; safecall;
    procedure put_HorizontalOffset(value: Double); safecall;
    function get_VerticalOffset: Double; safecall;
    procedure put_VerticalOffset(value: Double); safecall;
    function get_ChildTransitions: IVector_1__Animation_ITransition; safecall;
    procedure put_ChildTransitions(value: IVector_1__Animation_ITransition); safecall;
    function get_IsLightDismissEnabled: Boolean; safecall;
    procedure put_IsLightDismissEnabled(value: Boolean); safecall;
    function get_LightDismissOverlayMode: LightDismissOverlayMode; safecall;
    procedure put_LightDismissOverlayMode(value: LightDismissOverlayMode); safecall;
    function get_ShouldConstrainToRootBounds: Boolean; safecall;
    procedure put_ShouldConstrainToRootBounds(value: Boolean); safecall;
    function get_IsConstrainedToRootBounds: Boolean; safecall;
    function add_Opened(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Opened(token: EventRegistrationToken); safecall;
    function add_Closed(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    property Child: IUIElement read get_Child write put_Child;
    property ChildTransitions: IVector_1__Animation_ITransition read get_ChildTransitions write put_ChildTransitions;
    property HorizontalOffset: Double read get_HorizontalOffset write put_HorizontalOffset;
    property IsConstrainedToRootBounds: Boolean read get_IsConstrainedToRootBounds;
    property IsLightDismissEnabled: Boolean read get_IsLightDismissEnabled write put_IsLightDismissEnabled;
    property IsOpen: Boolean read get_IsOpen write put_IsOpen;
    property LightDismissOverlayMode_: LightDismissOverlayMode read get_LightDismissOverlayMode write put_LightDismissOverlayMode;
    property ShouldConstrainToRootBounds: Boolean read get_ShouldConstrainToRootBounds write put_ShouldConstrainToRootBounds;
    property VerticalOffset: Double read get_VerticalOffset write put_VerticalOffset;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.IWindow
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Window)]
  IWindow = interface(IInspectable)
  ['{61F0EC79-5D52-56B5-86FB-40FA4AF288B0}']
    function get_Bounds: TRectF; safecall;
    function get_Visible: Boolean; safecall;
    function get_Content: IUIElement; safecall;
    procedure put_Content(value: IUIElement); safecall;
    function get_CoreWindow: ICoreWindow; safecall;
    function get_Compositor: ICompositor; safecall;
    function get_Dispatcher: ICoreDispatcher; safecall;
    function get_DispatcherQueue: IDispatcherQueue; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_ExtendsContentIntoTitleBar: Boolean; safecall;
    procedure put_ExtendsContentIntoTitleBar(value: Boolean); safecall;
    function add_Activated(handler: TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Activated(token: EventRegistrationToken); safecall;
    function add_Closed(handler: TypedEventHandler_2__IInspectable__IWindowEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    function add_SizeChanged(handler: TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SizeChanged(token: EventRegistrationToken); safecall;
    function add_VisibilityChanged(handler: TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_VisibilityChanged(token: EventRegistrationToken); safecall;
    procedure Activate; safecall;
    procedure Close; safecall;
    procedure SetTitleBar(titleBar: IUIElement); safecall;
    property Bounds: TRectF read get_Bounds;
    property Compositor: ICompositor read get_Compositor;
    property Content: IUIElement read get_Content write put_Content;
    property CoreWindow: ICoreWindow read get_CoreWindow;
    property Dispatcher: ICoreDispatcher read get_Dispatcher;
    property DispatcherQueue: IDispatcherQueue read get_DispatcherQueue;
    property ExtendsContentIntoTitleBar: Boolean read get_ExtendsContentIntoTitleBar write put_ExtendsContentIntoTitleBar;
    property Title: HSTRING read get_Title write put_Title;
    property Visible: Boolean read get_Visible;
  end;

  // Microsoft.UI.Composition.ICompositor
  // External
  ICompositor = interface(IInspectable)
  ['{95213C13-C4CB-57DE-B267-D21AB901AE38}']
    function CreateColorKeyFrameAnimation: IColorKeyFrameAnimation; safecall;
    function CreateColorBrush: ICompositionColorBrush; overload; safecall;
    function CreateColorBrush(color: Color): ICompositionColorBrush; overload; safecall;
    function CreateContainerVisual: IContainerVisual; safecall;
    function CreateCubicBezierEasingFunction(controlPoint1: Numerics_Vector2; controlPoint2: Numerics_Vector2): ICubicBezierEasingFunction; safecall;
    function CreateEffectFactory(graphicsEffect: Effects_IGraphicsEffect): ICompositionEffectFactory; overload; safecall;
    function CreateEffectFactory(graphicsEffect: Effects_IGraphicsEffect; animatableProperties: IIterable_1__HSTRING): ICompositionEffectFactory; overload; safecall;
    function CreateExpressionAnimation: IExpressionAnimation; overload; safecall;
    function CreateExpressionAnimation(expression: HSTRING): IExpressionAnimation; overload; safecall;
    function CreateInsetClip: IInsetClip; overload; safecall;
    function CreateInsetClip(leftInset: Single; topInset: Single; rightInset: Single; bottomInset: Single): IInsetClip; overload; safecall;
    function CreateLinearEasingFunction: ILinearEasingFunction; safecall;
    function CreatePropertySet: ICompositionPropertySet; safecall;
    function CreateQuaternionKeyFrameAnimation: IQuaternionKeyFrameAnimation; safecall;
    function CreateScalarKeyFrameAnimation: IScalarKeyFrameAnimation; safecall;
    function CreateScopedBatch(batchType: CompositionBatchTypes): ICompositionScopedBatch; safecall;
    function CreateSpriteVisual: ISpriteVisual; safecall;
    function CreateSurfaceBrush: ICompositionSurfaceBrush; overload; safecall;
    function CreateSurfaceBrush(surface: ICompositionSurface): ICompositionSurfaceBrush; overload; safecall;
    function CreateVector2KeyFrameAnimation: IVector2KeyFrameAnimation; safecall;
    function CreateVector3KeyFrameAnimation: IVector3KeyFrameAnimation; safecall;
    function CreateVector4KeyFrameAnimation: IVector4KeyFrameAnimation; safecall;
    function GetCommitBatch(batchType: CompositionBatchTypes): ICompositionCommitBatch; safecall;
  end;

  // Microsoft.UI.Composition.IColorKeyFrameAnimation
  // External
  IColorKeyFrameAnimation = interface(IInspectable)
  ['{F0237928-353C-5867-BE93-71547E989F44}']
    function get_InterpolationColorSpace: CompositionColorSpace; safecall;
    procedure put_InterpolationColorSpace(value: CompositionColorSpace); safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Color); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Color; easingFunction: ICompositionEasingFunction); overload; safecall;
    property InterpolationColorSpace: CompositionColorSpace read get_InterpolationColorSpace write put_InterpolationColorSpace;
  end;

  // Microsoft.UI.Composition.ICompositionEasingFunction
  // External
  ICompositionEasingFunction = interface(IInspectable)
  ['{8E1ECD0D-57D8-5BC9-9BCD-E43D0DD733C4}']
  end;

  // Microsoft.UI.Composition.ICompositionColorBrush
  // External
  ICompositionColorBrush = interface(IInspectable)
  ['{3F8FFB69-3E71-55A7-8E79-F27A214C56AE}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    property Color_: Color read get_Color write put_Color;
  end;

  // Microsoft.UI.Composition.IContainerVisual
  // External
  IContainerVisual = interface(IInspectable)
  ['{C70DBCE1-2C2F-5D8E-91A4-AAE1121E6186}']
    function get_Children: IVisualCollection; safecall;
    property Children: IVisualCollection read get_Children;
  end;

  // Microsoft.UI.Composition.IVisualCollection
  // External
  IVisualCollection = interface(IInspectable)
  ['{D002896D-67D8-5F69-AB70-581FA3BF370F}']
    function get_Count: Integer; safecall;
    procedure InsertAbove(newChild: IVisual; sibling: IVisual); safecall;
    procedure InsertAtBottom(newChild: IVisual); safecall;
    procedure InsertAtTop(newChild: IVisual); safecall;
    procedure InsertBelow(newChild: IVisual; sibling: IVisual); safecall;
    procedure Remove(child: IVisual); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // Microsoft.UI.Composition.IVisual
  // External
  IVisual = interface(IInspectable)
  ['{C0EEAB6C-C897-5AC6-A1C9-63ABD5055B9B}']
    function get_AnchorPoint: Numerics_Vector2; safecall;
    procedure put_AnchorPoint(value: Numerics_Vector2); safecall;
    function get_BackfaceVisibility: CompositionBackfaceVisibility; safecall;
    procedure put_BackfaceVisibility(value: CompositionBackfaceVisibility); safecall;
    function get_BorderMode: CompositionBorderMode; safecall;
    procedure put_BorderMode(value: CompositionBorderMode); safecall;
    function get_CenterPoint: Numerics_Vector3; safecall;
    procedure put_CenterPoint(value: Numerics_Vector3); safecall;
    function get_Clip: ICompositionClip; safecall;
    procedure put_Clip(value: ICompositionClip); safecall;
    function get_CompositeMode: CompositionCompositeMode; safecall;
    procedure put_CompositeMode(value: CompositionCompositeMode); safecall;
    function get_IsVisible: Boolean; safecall;
    procedure put_IsVisible(value: Boolean); safecall;
    function get_Offset: Numerics_Vector3; safecall;
    procedure put_Offset(value: Numerics_Vector3); safecall;
    function get_Opacity: Single; safecall;
    procedure put_Opacity(value: Single); safecall;
    function get_Orientation: Numerics_Quaternion; safecall;
    procedure put_Orientation(value: Numerics_Quaternion); safecall;
    function get_Parent: IContainerVisual; safecall;
    function get_RotationAngle: Single; safecall;
    procedure put_RotationAngle(value: Single); safecall;
    function get_RotationAngleInDegrees: Single; safecall;
    procedure put_RotationAngleInDegrees(value: Single); safecall;
    function get_RotationAxis: Numerics_Vector3; safecall;
    procedure put_RotationAxis(value: Numerics_Vector3); safecall;
    function get_Scale: Numerics_Vector3; safecall;
    procedure put_Scale(value: Numerics_Vector3); safecall;
    function get_Size: Numerics_Vector2; safecall;
    procedure put_Size(value: Numerics_Vector2); safecall;
    function get_TransformMatrix: Numerics_Matrix4x4; safecall;
    procedure put_TransformMatrix(value: Numerics_Matrix4x4); safecall;
    property AnchorPoint: Numerics_Vector2 read get_AnchorPoint write put_AnchorPoint;
    property BackfaceVisibility: CompositionBackfaceVisibility read get_BackfaceVisibility write put_BackfaceVisibility;
    property BorderMode: CompositionBorderMode read get_BorderMode write put_BorderMode;
    property CenterPoint: Numerics_Vector3 read get_CenterPoint write put_CenterPoint;
    property Clip: ICompositionClip read get_Clip write put_Clip;
    property CompositeMode: CompositionCompositeMode read get_CompositeMode write put_CompositeMode;
    property IsVisible: Boolean read get_IsVisible write put_IsVisible;
    property Offset: Numerics_Vector3 read get_Offset write put_Offset;
    property Opacity: Single read get_Opacity write put_Opacity;
    property Orientation: Numerics_Quaternion read get_Orientation write put_Orientation;
    property Parent: IContainerVisual read get_Parent;
    property RotationAngle: Single read get_RotationAngle write put_RotationAngle;
    property RotationAngleInDegrees: Single read get_RotationAngleInDegrees write put_RotationAngleInDegrees;
    property RotationAxis: Numerics_Vector3 read get_RotationAxis write put_RotationAxis;
    property Scale: Numerics_Vector3 read get_Scale write put_Scale;
    property Size: Numerics_Vector2 read get_Size write put_Size;
    property TransformMatrix: Numerics_Matrix4x4 read get_TransformMatrix write put_TransformMatrix;
  end;

  // Microsoft.UI.Composition.ICompositionClip
  // External
  ICompositionClip = interface(IInspectable)
  ['{B66B55CB-B5A5-5BEE-8972-AE78233CB34C}']
  end;

  // Microsoft.UI.Composition.ICubicBezierEasingFunction
  // External
  ICubicBezierEasingFunction = interface(IInspectable)
  ['{35E7FCDE-F9CE-590A-8B88-64A82A6B4B48}']
    function get_ControlPoint1: Numerics_Vector2; safecall;
    function get_ControlPoint2: Numerics_Vector2; safecall;
    property ControlPoint1: Numerics_Vector2 read get_ControlPoint1;
    property ControlPoint2: Numerics_Vector2 read get_ControlPoint2;
  end;

  // Microsoft.UI.Composition.ICompositionEffectFactory
  // External
  ICompositionEffectFactory = interface(IInspectable)
  ['{C50F407A-0231-5ED2-B7A7-CA66D3E14B3B}']
    function CreateBrush: ICompositionEffectBrush; safecall;
    function get_ExtendedError: HRESULT; safecall;
    function get_LoadStatus: CompositionEffectFactoryLoadStatus; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property LoadStatus: CompositionEffectFactoryLoadStatus read get_LoadStatus;
  end;

  // Microsoft.UI.Composition.ICompositionEffectBrush
  // External
  ICompositionEffectBrush = interface(IInspectable)
  ['{62E0BBAB-1F45-5A44-9DDF-F0C38A02ED85}']
    function GetSourceParameter(name: HSTRING): ICompositionBrush; safecall;
    procedure SetSourceParameter(name: HSTRING; source: ICompositionBrush); safecall;
  end;

  // Microsoft.UI.Composition.ICompositionBrush
  // External
  ICompositionBrush = interface(IInspectable)
  ['{483924E7-99A5-5377-968B-DEC6D40BBCCD}']
  end;

  // Microsoft.UI.Composition.IExpressionAnimation
  // External
  IExpressionAnimation = interface(IInspectable)
  ['{7FFF5826-1992-56C0-9060-5ADE561A4F2D}']
    function get_Expression: HSTRING; safecall;
    procedure put_Expression(value: HSTRING); safecall;
    property Expression: HSTRING read get_Expression write put_Expression;
  end;

  // Microsoft.UI.Composition.IInsetClip
  // External
  IInsetClip = interface(IInspectable)
  ['{F9D99475-7B59-5B28-A1D2-B832DA6988C9}']
    function get_BottomInset: Single; safecall;
    procedure put_BottomInset(value: Single); safecall;
    function get_LeftInset: Single; safecall;
    procedure put_LeftInset(value: Single); safecall;
    function get_RightInset: Single; safecall;
    procedure put_RightInset(value: Single); safecall;
    function get_TopInset: Single; safecall;
    procedure put_TopInset(value: Single); safecall;
    property BottomInset: Single read get_BottomInset write put_BottomInset;
    property LeftInset: Single read get_LeftInset write put_LeftInset;
    property RightInset: Single read get_RightInset write put_RightInset;
    property TopInset: Single read get_TopInset write put_TopInset;
  end;

  // Microsoft.UI.Composition.ILinearEasingFunction
  // External
  ILinearEasingFunction = interface(IInspectable)
  ['{79BFEEF6-70C7-50A6-BB3A-0E9636148695}']
  end;

  // Microsoft.UI.Composition.ICompositionPropertySet
  // External
  ICompositionPropertySet = interface(IInspectable)
  ['{97F7A17B-97BE-5545-9F1C-0B9D44577F57}']
    procedure InsertColor(propertyName: HSTRING; value: Color); safecall;
    procedure InsertMatrix3x2(propertyName: HSTRING; value: Numerics_Matrix3x2); safecall;
    procedure InsertMatrix4x4(propertyName: HSTRING; value: Numerics_Matrix4x4); safecall;
    procedure InsertQuaternion(propertyName: HSTRING; value: Numerics_Quaternion); safecall;
    procedure InsertScalar(propertyName: HSTRING; value: Single); safecall;
    procedure InsertVector2(propertyName: HSTRING; value: Numerics_Vector2); safecall;
    procedure InsertVector3(propertyName: HSTRING; value: Numerics_Vector3); safecall;
    procedure InsertVector4(propertyName: HSTRING; value: Numerics_Vector4); safecall;
    function TryGetColor(propertyName: HSTRING; out value: Color): CompositionGetValueStatus; safecall;
    function TryGetMatrix3x2(propertyName: HSTRING; out value: Numerics_Matrix3x2): CompositionGetValueStatus; safecall;
    function TryGetMatrix4x4(propertyName: HSTRING; out value: Numerics_Matrix4x4): CompositionGetValueStatus; safecall;
    function TryGetQuaternion(propertyName: HSTRING; out value: Numerics_Quaternion): CompositionGetValueStatus; safecall;
    function TryGetScalar(propertyName: HSTRING; out value: Single): CompositionGetValueStatus; safecall;
    function TryGetVector2(propertyName: HSTRING; out value: Numerics_Vector2): CompositionGetValueStatus; safecall;
    function TryGetVector3(propertyName: HSTRING; out value: Numerics_Vector3): CompositionGetValueStatus; safecall;
    function TryGetVector4(propertyName: HSTRING; out value: Numerics_Vector4): CompositionGetValueStatus; safecall;
  end;

  // Microsoft.UI.Composition.IQuaternionKeyFrameAnimation
  // External
  IQuaternionKeyFrameAnimation = interface(IInspectable)
  ['{E72D1026-DA3B-5D56-858B-3A9AA3C57D70}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Quaternion); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Quaternion; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // Microsoft.UI.Composition.IScalarKeyFrameAnimation
  // External
  IScalarKeyFrameAnimation = interface(IInspectable)
  ['{5A5F8ABE-D129-5B25-8AFF-8180FD9BFB22}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Single); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Single; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // Microsoft.UI.Composition.ICompositionScopedBatch
  // External
  ICompositionScopedBatch = interface(IInspectable)
  ['{D31CA572-99CE-5969-B042-6C2D330A3859}']
    function get_IsActive: Boolean; safecall;
    function get_IsEnded: Boolean; safecall;
    procedure &End; safecall;
    procedure Resume; safecall;
    procedure Suspend; safecall;
    function add_Completed(handler: TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    property IsActive: Boolean read get_IsActive;
    property IsEnded: Boolean read get_IsEnded;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Composition.ICompositionBatchCompletedEventArgs>
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{DE522E05-2E72-52EE-BD1F-AC25A0708003}']
    procedure Invoke(sender: IInspectable; args: ICompositionBatchCompletedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Composition.ICompositionBatchCompletedEventArgs>
  // External
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = interface(TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base)
  ['{ED10A583-FDAF-5D83-AC86-F008EA27577B}']
  end;

  // Microsoft.UI.Composition.ICompositionBatchCompletedEventArgs
  // External
  ICompositionBatchCompletedEventArgs = interface(IInspectable)
  ['{AC400334-4358-5FB0-BFC3-117FE581998F}']
  end;

  // Microsoft.UI.Composition.ISpriteVisual
  // External
  ISpriteVisual = interface(IInspectable)
  ['{7E964632-45E4-5761-806D-5B4022C14F26}']
    function get_Brush: ICompositionBrush; safecall;
    procedure put_Brush(value: ICompositionBrush); safecall;
    property Brush: ICompositionBrush read get_Brush write put_Brush;
  end;

  // Microsoft.UI.Composition.ICompositionSurfaceBrush
  // External
  ICompositionSurfaceBrush = interface(IInspectable)
  ['{616BB5A5-0A33-512D-B4B1-3D3734F04ACA}']
    function get_BitmapInterpolationMode: CompositionBitmapInterpolationMode; safecall;
    procedure put_BitmapInterpolationMode(value: CompositionBitmapInterpolationMode); safecall;
    function get_HorizontalAlignmentRatio: Single; safecall;
    procedure put_HorizontalAlignmentRatio(value: Single); safecall;
    function get_Stretch: CompositionStretch; safecall;
    procedure put_Stretch(value: CompositionStretch); safecall;
    function get_Surface: ICompositionSurface; safecall;
    procedure put_Surface(value: ICompositionSurface); safecall;
    function get_VerticalAlignmentRatio: Single; safecall;
    procedure put_VerticalAlignmentRatio(value: Single); safecall;
    property BitmapInterpolationMode: CompositionBitmapInterpolationMode read get_BitmapInterpolationMode write put_BitmapInterpolationMode;
    property HorizontalAlignmentRatio: Single read get_HorizontalAlignmentRatio write put_HorizontalAlignmentRatio;
    property Stretch: CompositionStretch read get_Stretch write put_Stretch;
    property Surface: ICompositionSurface read get_Surface write put_Surface;
    property VerticalAlignmentRatio: Single read get_VerticalAlignmentRatio write put_VerticalAlignmentRatio;
  end;

  // DualAPI Interface
  // Microsoft.UI.Composition.ICompositionSurface
  // External
  ICompositionSurface = interface(IInspectable)
  ['{9EC612C3-A5D2-4F97-9DF3-6B49CE736215}']
  end;

  // Microsoft.UI.Composition.IVector2KeyFrameAnimation
  // External
  IVector2KeyFrameAnimation = interface(IInspectable)
  ['{E9C5E3FD-43B7-526E-9DA0-4C3EA96DB27D}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector2); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector2; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // Microsoft.UI.Composition.IVector3KeyFrameAnimation
  // External
  IVector3KeyFrameAnimation = interface(IInspectable)
  ['{D7DA980E-2DDE-5DD1-A40C-D6868DD2449E}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector3); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector3; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // Microsoft.UI.Composition.IVector4KeyFrameAnimation
  // External
  IVector4KeyFrameAnimation = interface(IInspectable)
  ['{16CEA3B9-C5E3-5F6F-B5C7-DA29A31CCFC7}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector4); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector4; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // Microsoft.UI.Composition.ICompositionCommitBatch
  // External
  ICompositionCommitBatch = interface(IInspectable)
  ['{C4550FA8-A7F2-5259-BF74-33B2F5240A28}']
    function get_IsActive: Boolean; safecall;
    function get_IsEnded: Boolean; safecall;
    function add_Completed(handler: TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    property IsActive: Boolean read get_IsActive;
    property IsEnded: Boolean read get_IsEnded;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowActivatedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E5299329-636A-5C20-A38A-12DF43F6D038}']
    procedure Invoke(sender: IInspectable; args: IWindowActivatedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowActivatedEventArgs>
  // External
  TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs = interface(TypedEventHandler_2__IInspectable__IWindowActivatedEventArgs_Delegate_Base)
  ['{509379AA-09E6-5D40-9998-DE00B974D972}']
  end;

  // Microsoft.UI.Xaml.IWindowActivatedEventArgs
  // External
  IWindowActivatedEventArgs = interface(IInspectable)
  ['{C723A5EA-82C4-5DD6-861B-70EF573B88D6}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_WindowActivationState: WindowActivationState; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property WindowActivationState_: WindowActivationState read get_WindowActivationState;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowEventArgs>
  TypedEventHandler_2__IInspectable__IWindowEventArgs_Delegate_Base = interface(IUnknown)
  ['{2A954D28-7F8B-5479-8CE9-900424A0409F}']
    procedure Invoke(sender: IInspectable; args: IWindowEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowEventArgs>
  // External
  TypedEventHandler_2__IInspectable__IWindowEventArgs = interface(TypedEventHandler_2__IInspectable__IWindowEventArgs_Delegate_Base)
  ['{2FE07351-BF67-53BC-9AE2-1756F2715FDD}']
  end;

  // Microsoft.UI.Xaml.IWindowEventArgs
  // External
  IWindowEventArgs = interface(IInspectable)
  ['{1140827C-FE0A-5268-BC2B-F4492C2CCB49}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Handled: Boolean read get_Handled write put_Handled;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowSizeChangedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{5AC3FE68-1312-5598-B097-5C789FE72FBA}']
    procedure Invoke(sender: IInspectable; args: IWindowSizeChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowSizeChangedEventArgs>
  // External
  TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs = interface(TypedEventHandler_2__IInspectable__IWindowSizeChangedEventArgs_Delegate_Base)
  ['{147A4840-EA54-53F6-A941-92B99F7D9B8A}']
  end;

  // Microsoft.UI.Xaml.IWindowSizeChangedEventArgs
  // External
  IWindowSizeChangedEventArgs = interface(IInspectable)
  ['{542F6F2C-4B64-5C72-A7A5-3A7E0664B8FF}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_Size: TSizeF; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property Size: TSizeF read get_Size;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowVisibilityChangedEventArgs>
  TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C5011004-F9A8-521D-9B1D-D7CD184889F8}']
    procedure Invoke(sender: IInspectable; args: IWindowVisibilityChangedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Object,Microsoft.UI.Xaml.IWindowVisibilityChangedEventArgs>
  // External
  TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs = interface(TypedEventHandler_2__IInspectable__IWindowVisibilityChangedEventArgs_Delegate_Base)
  ['{EA5B976D-40B6-54CE-9734-FB4786EC2A7C}']
  end;

  // Microsoft.UI.Xaml.IWindowVisibilityChangedEventArgs
  // External
  IWindowVisibilityChangedEventArgs = interface(IInspectable)
  ['{7BB24A6D-070C-5CB6-8E9C-547905BE8265}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    function get_Visible: Boolean; safecall;
    property Handled: Boolean read get_Handled write put_Handled;
    property Visible: Boolean read get_Visible;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IMediaTransportControls
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_MediaTransportControls)]
  IMediaTransportControls = interface(IInspectable)
  ['{C99C110B-9DEE-5A6B-BB9E-61BFCAAAFA3E}']
    function get_IsZoomButtonVisible: Boolean; safecall;
    procedure put_IsZoomButtonVisible(value: Boolean); safecall;
    function get_IsZoomEnabled: Boolean; safecall;
    procedure put_IsZoomEnabled(value: Boolean); safecall;
    function get_IsFastForwardButtonVisible: Boolean; safecall;
    procedure put_IsFastForwardButtonVisible(value: Boolean); safecall;
    function get_IsFastForwardEnabled: Boolean; safecall;
    procedure put_IsFastForwardEnabled(value: Boolean); safecall;
    function get_IsFastRewindButtonVisible: Boolean; safecall;
    procedure put_IsFastRewindButtonVisible(value: Boolean); safecall;
    function get_IsFastRewindEnabled: Boolean; safecall;
    procedure put_IsFastRewindEnabled(value: Boolean); safecall;
    function get_IsStopButtonVisible: Boolean; safecall;
    procedure put_IsStopButtonVisible(value: Boolean); safecall;
    function get_IsStopEnabled: Boolean; safecall;
    procedure put_IsStopEnabled(value: Boolean); safecall;
    function get_IsVolumeButtonVisible: Boolean; safecall;
    procedure put_IsVolumeButtonVisible(value: Boolean); safecall;
    function get_IsVolumeEnabled: Boolean; safecall;
    procedure put_IsVolumeEnabled(value: Boolean); safecall;
    function get_IsPlaybackRateButtonVisible: Boolean; safecall;
    procedure put_IsPlaybackRateButtonVisible(value: Boolean); safecall;
    function get_IsPlaybackRateEnabled: Boolean; safecall;
    procedure put_IsPlaybackRateEnabled(value: Boolean); safecall;
    function get_IsSeekBarVisible: Boolean; safecall;
    procedure put_IsSeekBarVisible(value: Boolean); safecall;
    function get_IsSeekEnabled: Boolean; safecall;
    procedure put_IsSeekEnabled(value: Boolean); safecall;
    function get_IsCompact: Boolean; safecall;
    procedure put_IsCompact(value: Boolean); safecall;
    function get_IsSkipForwardButtonVisible: Boolean; safecall;
    procedure put_IsSkipForwardButtonVisible(value: Boolean); safecall;
    function get_IsSkipForwardEnabled: Boolean; safecall;
    procedure put_IsSkipForwardEnabled(value: Boolean); safecall;
    function get_IsSkipBackwardButtonVisible: Boolean; safecall;
    procedure put_IsSkipBackwardButtonVisible(value: Boolean); safecall;
    function get_IsSkipBackwardEnabled: Boolean; safecall;
    procedure put_IsSkipBackwardEnabled(value: Boolean); safecall;
    function get_IsNextTrackButtonVisible: Boolean; safecall;
    procedure put_IsNextTrackButtonVisible(value: Boolean); safecall;
    function get_IsPreviousTrackButtonVisible: Boolean; safecall;
    procedure put_IsPreviousTrackButtonVisible(value: Boolean); safecall;
    function get_FastPlayFallbackBehaviour: FastPlayFallbackBehaviour; safecall;
    procedure put_FastPlayFallbackBehaviour(value: FastPlayFallbackBehaviour); safecall;
    function get_ShowAndHideAutomatically: Boolean; safecall;
    procedure put_ShowAndHideAutomatically(value: Boolean); safecall;
    function get_IsRepeatEnabled: Boolean; safecall;
    procedure put_IsRepeatEnabled(value: Boolean); safecall;
    function get_IsRepeatButtonVisible: Boolean; safecall;
    procedure put_IsRepeatButtonVisible(value: Boolean); safecall;
    function add_ThumbnailRequested(handler: TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ThumbnailRequested(token: EventRegistrationToken); safecall;
    procedure Show; safecall;
    procedure Hide; safecall;
    property FastPlayFallbackBehaviour_: FastPlayFallbackBehaviour read get_FastPlayFallbackBehaviour write put_FastPlayFallbackBehaviour;
    property IsCompact: Boolean read get_IsCompact write put_IsCompact;
    property IsFastForwardButtonVisible: Boolean read get_IsFastForwardButtonVisible write put_IsFastForwardButtonVisible;
    property IsFastForwardEnabled: Boolean read get_IsFastForwardEnabled write put_IsFastForwardEnabled;
    property IsFastRewindButtonVisible: Boolean read get_IsFastRewindButtonVisible write put_IsFastRewindButtonVisible;
    property IsFastRewindEnabled: Boolean read get_IsFastRewindEnabled write put_IsFastRewindEnabled;
    property IsNextTrackButtonVisible: Boolean read get_IsNextTrackButtonVisible write put_IsNextTrackButtonVisible;
    property IsPlaybackRateButtonVisible: Boolean read get_IsPlaybackRateButtonVisible write put_IsPlaybackRateButtonVisible;
    property IsPlaybackRateEnabled: Boolean read get_IsPlaybackRateEnabled write put_IsPlaybackRateEnabled;
    property IsPreviousTrackButtonVisible: Boolean read get_IsPreviousTrackButtonVisible write put_IsPreviousTrackButtonVisible;
    property IsRepeatButtonVisible: Boolean read get_IsRepeatButtonVisible write put_IsRepeatButtonVisible;
    property IsRepeatEnabled: Boolean read get_IsRepeatEnabled write put_IsRepeatEnabled;
    property IsSeekBarVisible: Boolean read get_IsSeekBarVisible write put_IsSeekBarVisible;
    property IsSeekEnabled: Boolean read get_IsSeekEnabled write put_IsSeekEnabled;
    property IsSkipBackwardButtonVisible: Boolean read get_IsSkipBackwardButtonVisible write put_IsSkipBackwardButtonVisible;
    property IsSkipBackwardEnabled: Boolean read get_IsSkipBackwardEnabled write put_IsSkipBackwardEnabled;
    property IsSkipForwardButtonVisible: Boolean read get_IsSkipForwardButtonVisible write put_IsSkipForwardButtonVisible;
    property IsSkipForwardEnabled: Boolean read get_IsSkipForwardEnabled write put_IsSkipForwardEnabled;
    property IsStopButtonVisible: Boolean read get_IsStopButtonVisible write put_IsStopButtonVisible;
    property IsStopEnabled: Boolean read get_IsStopEnabled write put_IsStopEnabled;
    property IsVolumeButtonVisible: Boolean read get_IsVolumeButtonVisible write put_IsVolumeButtonVisible;
    property IsVolumeEnabled: Boolean read get_IsVolumeEnabled write put_IsVolumeEnabled;
    property IsZoomButtonVisible: Boolean read get_IsZoomButtonVisible write put_IsZoomButtonVisible;
    property IsZoomEnabled: Boolean read get_IsZoomEnabled write put_IsZoomEnabled;
    property ShowAndHideAutomatically: Boolean read get_ShowAndHideAutomatically write put_ShowAndHideAutomatically;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IMediaTransportControls,Microsoft.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs>
  TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{096DBDE2-DA7C-5432-921A-F0E4667BF7CA}']
    procedure Invoke(sender: IMediaTransportControls; args: IMediaTransportControlsThumbnailRequestedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IMediaTransportControls,Microsoft.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs>
  // External
  TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs = interface(TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs_Delegate_Base)
  ['{00B4781B-065F-585D-BB70-CF40C6C57FE5}']
  end;

  // Microsoft.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs
  // External
  IMediaTransportControlsThumbnailRequestedEventArgs = interface(IInspectable)
  ['{FE0FFB86-74B0-5031-ACCC-B34D0382A637}']
    procedure SetThumbnailImage(source: IInputStream); safecall;
    function GetDeferral: IDeferral; safecall;
  end;

  // DualAPI Interface
  // Microsoft.UI.Xaml.Controls.IWebView2
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Controls_WebView2)]
  IWebView2 = interface(IInspectable)
  ['{2B2C76C2-997C-5069-A8F0-9B84CD7E624B}']
    function get_CoreWebView2: ICoreWebView2PrivatePartial; safecall;
    function EnsureCoreWebView2Async: IAsyncAction; safecall;
    function ExecuteScriptAsync(javascriptCode: HSTRING): IAsyncOperation_1__HSTRING; safecall;
    function get_Source: IUriRuntimeClass; safecall;
    procedure put_Source(value: IUriRuntimeClass); safecall;
    function get_CanGoForward: Boolean; safecall;
    procedure put_CanGoForward(value: Boolean); safecall;
    function get_CanGoBack: Boolean; safecall;
    procedure put_CanGoBack(value: Boolean); safecall;
    function get_DefaultBackgroundColor: Color; safecall;
    procedure put_DefaultBackgroundColor(value: Color); safecall;
    procedure Reload; safecall;
    procedure GoForward; safecall;
    procedure GoBack; safecall;
    procedure NavigateToString(htmlContent: HSTRING); safecall;
    procedure Close; safecall;
    function add_NavigationCompleted(handler: TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2): EventRegistrationToken; safecall;
    procedure remove_NavigationCompleted(token: EventRegistrationToken); safecall;
    function add_WebMessageReceived(handler: TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_WebMessageReceived(token: EventRegistrationToken); safecall;
    function add_NavigationStarting(handler: TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2): EventRegistrationToken; safecall;
    procedure remove_NavigationStarting(token: EventRegistrationToken); safecall;
    function add_CoreProcessFailed(handler: TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2): EventRegistrationToken; safecall;
    procedure remove_CoreProcessFailed(token: EventRegistrationToken); safecall;
    function add_CoreWebView2Initialized(handler: TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CoreWebView2Initialized(token: EventRegistrationToken); safecall;
    property CanGoBack: Boolean read get_CanGoBack write put_CanGoBack;
    property CanGoForward: Boolean read get_CanGoForward write put_CanGoForward;
    property CoreWebView2: ICoreWebView2PrivatePartial read get_CoreWebView2;
    property DefaultBackgroundColor: Color read get_DefaultBackgroundColor write put_DefaultBackgroundColor;
    property Source: IUriRuntimeClass read get_Source write put_Source;
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2PrivatePartial
  // External
  ICoreWebView2PrivatePartial = interface(IInspectable)
  ['{2850F27C-0C9D-5CDC-B356-18F5B97D9FCF}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base = interface(IUnknown)
  ['{CD1B3A50-18D9-5487-8F2F-437B3AF7DD9B}']
    procedure Invoke(sender: IWebView2; args: ICoreWebView2NavigationCompletedEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2>
  // External
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2 = interface(TypedEventHandler_2__IWebView2__ICoreWebView2NavigationCompletedEventArgs2_Delegate_Base)
  ['{056A5B74-1BBE-56C6-83C2-7B9051ED5083}']
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2NavigationCompletedEventArgs2
  // External
  ICoreWebView2NavigationCompletedEventArgs2 = interface(IInspectable)
  ['{6E4D3C33-A6E2-5896-90C5-68B4B5E55B40}']
    function get_HttpStatusCode: Integer; safecall;
    property HttpStatusCode: Integer read get_HttpStatusCode;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A45BF5CE-5896-55AB-88E2-C622BE25E09C}']
    procedure Invoke(sender: IWebView2; args: ICoreWebView2WebMessageReceivedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs>
  // External
  TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs = interface(TypedEventHandler_2__IWebView2__ICoreWebView2WebMessageReceivedEventArgs_Delegate_Base)
  ['{BDB3B455-12DE-536B-8A04-576C11F35ABC}']
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2WebMessageReceivedEventArgs
  // External
  ICoreWebView2WebMessageReceivedEventArgs = interface(IInspectable)
  ['{EB066159-B725-5D5B-ADC8-F5D7B9290304}']
    function get_Source: HSTRING; safecall;
    function get_WebMessageAsJson: HSTRING; safecall;
    function TryGetWebMessageAsString: HSTRING; safecall;
    property Source: HSTRING read get_Source;
    property WebMessageAsJson: HSTRING read get_WebMessageAsJson;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base = interface(IUnknown)
  ['{06945286-A74E-59FD-A385-C40972E2D833}']
    procedure Invoke(sender: IWebView2; args: ICoreWebView2NavigationStartingEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2>
  // External
  TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2 = interface(TypedEventHandler_2__IWebView2__ICoreWebView2NavigationStartingEventArgs2_Delegate_Base)
  ['{2C272491-97DA-5A7D-A3AF-5B4A5DFD0BFF}']
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2NavigationStartingEventArgs2
  // External
  ICoreWebView2NavigationStartingEventArgs2 = interface(IInspectable)
  ['{D7A3824E-7654-5C4B-B069-E6501634D84C}']
    function get_AdditionalAllowedFrameAncestors: HSTRING; safecall;
    procedure put_AdditionalAllowedFrameAncestors(value: HSTRING); safecall;
    property AdditionalAllowedFrameAncestors: HSTRING read get_AdditionalAllowedFrameAncestors write put_AdditionalAllowedFrameAncestors;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base = interface(IUnknown)
  ['{0C5B9AF5-0B9F-5B6D-A6C9-E8FDBFE1DCF8}']
    procedure Invoke(sender: IWebView2; args: ICoreWebView2ProcessFailedEventArgs2); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2>
  // External
  TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2 = interface(TypedEventHandler_2__IWebView2__ICoreWebView2ProcessFailedEventArgs2_Delegate_Base)
  ['{A60307F5-B440-51D3-B41C-E9C59A6A9F2B}']
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2ProcessFailedEventArgs2
  // External
  ICoreWebView2ProcessFailedEventArgs2 = interface(IInspectable)
  ['{C5D9C952-B456-5DC7-9F76-FDE967484AF5}']
    function get_Reason: CoreWebView2ProcessFailedReason; safecall;
    function get_ExitCode: Integer; safecall;
    function get_ProcessDescription: HSTRING; safecall;
    function get_FrameInfosForFailedProcess: IVectorView_1__ICoreWebView2FrameInfo; safecall;
    property ExitCode: Integer read get_ExitCode;
    property FrameInfosForFailedProcess: IVectorView_1__ICoreWebView2FrameInfo read get_FrameInfosForFailedProcess;
    property ProcessDescription: HSTRING read get_ProcessDescription;
    property Reason: CoreWebView2ProcessFailedReason read get_Reason;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo>
  // External
  IVectorView_1__ICoreWebView2FrameInfo = interface(IInspectable)
  ['{80511155-85BF-5581-A98A-1AA026247BF2}']
    function GetAt(index: Cardinal): ICoreWebView2FrameInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ICoreWebView2FrameInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PICoreWebView2FrameInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Microsoft.Web.WebView2.Core.ICoreWebView2FrameInfo
  // External
  ICoreWebView2FrameInfo = interface(IInspectable)
  ['{F9B82E06-73F3-513B-BC2C-445DDEDBA976}']
    function get_Name: HSTRING; safecall;
    function get_Source: HSTRING; safecall;
    property Name: HSTRING read get_Name;
    property Source: HSTRING read get_Source;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.UI.Xaml.Controls.ICoreWebView2InitializedEventArgs>
  TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs_Delegate_Base = interface(IUnknown)
  ['{55D13736-C998-5C80-8A67-1C53D063A375}']
    procedure Invoke(sender: IWebView2; args: ICoreWebView2InitializedEventArgs); safecall;
  end;
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Controls.IWebView2,Microsoft.UI.Xaml.Controls.ICoreWebView2InitializedEventArgs>
  // External
  TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs = interface(TypedEventHandler_2__IWebView2__ICoreWebView2InitializedEventArgs_Delegate_Base)
  ['{E2B8EDCE-CD2B-5DB3-A0AE-F6736BDE751B}']
  end;

  // Microsoft.UI.Xaml.Controls.ICoreWebView2InitializedEventArgs
  // External
  ICoreWebView2InitializedEventArgs = interface(IInspectable)
  ['{EE59D277-8B2E-57AB-8631-91D27B12EBD9}']
    function get_Exception: HRESULT; safecall;
    property Exception: HRESULT read get_Exception;
  end;

implementation

end.
