{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI.Xaml.Media;

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
  Winapi.Microsoft.UI.Composition,
  Winapi.UI,
  Winapi.Foundation,
  Winapi.Storage.Streams,
  Winapi.GraphicsRT,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  Animation_ConnectedAnimationComponent = Winapi.Microsoft.CommonTypes.Animation_ConnectedAnimationComponent;
  PAnimation_ConnectedAnimationComponent = Winapi.Microsoft.CommonTypes.PAnimation_ConnectedAnimationComponent;
  Animation_IConnectedAnimation = Winapi.Microsoft.CommonTypes.Animation_IConnectedAnimation;
  PAnimation_IConnectedAnimation = Winapi.Microsoft.CommonTypes.PAnimation_IConnectedAnimation;
  Animation_IConnectedAnimationConfiguration = Winapi.Microsoft.CommonTypes.Animation_IConnectedAnimationConfiguration;
  PAnimation_IConnectedAnimationConfiguration = Winapi.Microsoft.CommonTypes.PAnimation_IConnectedAnimationConfiguration;
  Animation_INavigationTransitionInfo = Winapi.Microsoft.CommonTypes.Animation_INavigationTransitionInfo;
  PAnimation_INavigationTransitionInfo = Winapi.Microsoft.CommonTypes.PAnimation_INavigationTransitionInfo;
  Animation_ITransition = Winapi.Microsoft.CommonTypes.Animation_ITransition;
  PAnimation_ITransition = Winapi.Microsoft.CommonTypes.PAnimation_ITransition;
  ElementCompositeMode = Winapi.Microsoft.CommonTypes.ElementCompositeMode;
  PElementCompositeMode = Winapi.Microsoft.CommonTypes.PElementCompositeMode;
  FastPlayFallbackBehaviour = Winapi.Microsoft.CommonTypes.FastPlayFallbackBehaviour;
  PFastPlayFallbackBehaviour = Winapi.Microsoft.CommonTypes.PFastPlayFallbackBehaviour;
  IBrush = Winapi.Microsoft.CommonTypes.IBrush;
  PIBrush = Winapi.Microsoft.CommonTypes.PIBrush;
  ICacheMode = Winapi.Microsoft.CommonTypes.ICacheMode;
  PICacheMode = Winapi.Microsoft.CommonTypes.PICacheMode;
  IGeneralTransform = Winapi.Microsoft.CommonTypes.IGeneralTransform;
  PIGeneralTransform = Winapi.Microsoft.CommonTypes.PIGeneralTransform;
  Imaging_BitmapCreateOptions = Winapi.Microsoft.CommonTypes.Imaging_BitmapCreateOptions;
  PImaging_BitmapCreateOptions = Winapi.Microsoft.CommonTypes.PImaging_BitmapCreateOptions;
  Imaging_DecodePixelType = Winapi.Microsoft.CommonTypes.Imaging_DecodePixelType;
  PImaging_DecodePixelType = Winapi.Microsoft.CommonTypes.PImaging_DecodePixelType;
  Imaging_DownloadProgressEventHandler = Winapi.Microsoft.CommonTypes.Imaging_DownloadProgressEventHandler;
  PImaging_DownloadProgressEventHandler = Winapi.Microsoft.CommonTypes.PImaging_DownloadProgressEventHandler;
  Imaging_IBitmapImage = Winapi.Microsoft.CommonTypes.Imaging_IBitmapImage;
  PImaging_IBitmapImage = Winapi.Microsoft.CommonTypes.PImaging_IBitmapImage;
  Imaging_IDownloadProgressEventArgs = Winapi.Microsoft.CommonTypes.Imaging_IDownloadProgressEventArgs;
  PImaging_IDownloadProgressEventArgs = Winapi.Microsoft.CommonTypes.PImaging_IDownloadProgressEventArgs;
  IMediaTransportControlsThumbnailRequestedEventArgs = Winapi.Microsoft.CommonTypes.IMediaTransportControlsThumbnailRequestedEventArgs;
  PIMediaTransportControlsThumbnailRequestedEventArgs = Winapi.Microsoft.CommonTypes.PIMediaTransportControlsThumbnailRequestedEventArgs;
  IProjection = Winapi.Microsoft.CommonTypes.IProjection;
  PIProjection = Winapi.Microsoft.CommonTypes.PIProjection;
  IRectangleGeometry = Winapi.Microsoft.CommonTypes.IRectangleGeometry;
  PIRectangleGeometry = Winapi.Microsoft.CommonTypes.PIRectangleGeometry;
  IShadow = Winapi.Microsoft.CommonTypes.IShadow;
  PIShadow = Winapi.Microsoft.CommonTypes.PIShadow;
  ITransform = Winapi.Microsoft.CommonTypes.ITransform;
  PITransform = Winapi.Microsoft.CommonTypes.PITransform;
  IVector_1__Animation_ITransition_Base = Winapi.Microsoft.CommonTypes.IVector_1__Animation_ITransition_Base;
  IVector_1__Animation_ITransition = Winapi.Microsoft.CommonTypes.IVector_1__Animation_ITransition;
  PIVector_1__Animation_ITransition = Winapi.Microsoft.CommonTypes.PIVector_1__Animation_ITransition;
  IVector_1__IXamlLight_Base = Winapi.Microsoft.CommonTypes.IVector_1__IXamlLight_Base;
  IVector_1__IXamlLight = Winapi.Microsoft.CommonTypes.IVector_1__IXamlLight;
  PIVector_1__IXamlLight = Winapi.Microsoft.CommonTypes.PIVector_1__IXamlLight;
  IVectorView_1__Animation_ITransition = Winapi.Microsoft.CommonTypes.IVectorView_1__Animation_ITransition;
  PIVectorView_1__Animation_ITransition = Winapi.Microsoft.CommonTypes.PIVectorView_1__Animation_ITransition;
  IVectorView_1__IXamlLight = Winapi.Microsoft.CommonTypes.IVectorView_1__IXamlLight;
  PIVectorView_1__IXamlLight = Winapi.Microsoft.CommonTypes.PIVectorView_1__IXamlLight;
  IXamlLight = Winapi.Microsoft.CommonTypes.IXamlLight;
  PIXamlLight = Winapi.Microsoft.CommonTypes.PIXamlLight;
  Media3D_ITransform3D = Winapi.Microsoft.CommonTypes.Media3D_ITransform3D;
  PMedia3D_ITransform3D = Winapi.Microsoft.CommonTypes.PMedia3D_ITransform3D;
  TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs_Delegate_Base;
  TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs;
  PTypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IMediaTransportControls__IMediaTransportControlsThumbnailRequestedEventArgs;

  // Forward declarations for interfaces

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterator_1__Animation_ITransition = interface;
  PIIterator_1__Animation_ITransition = ^IIterator_1__Animation_ITransition;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterable_1__Animation_ITransition = interface;
  PIIterable_1__Animation_ITransition = ^IIterable_1__Animation_ITransition;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterator_1__IXamlLight = interface;
  PIIterator_1__IXamlLight = ^IIterator_1__IXamlLight;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterable_1__IXamlLight = interface;
  PIIterable_1__IXamlLight = ^IIterable_1__IXamlLight;

  // Microsoft.UI.Xaml.Media.IFontFamily
  IFontFamily = interface;
  PIFontFamily = ^IFontFamily;

  // Microsoft.UI.Xaml.Media.IImageSource
  IImageSource = interface;
  PIImageSource = ^IImageSource;

  // Microsoft.UI.Xaml.Media.ISolidColorBrush
  ISolidColorBrush = interface;
  PISolidColorBrush = ^ISolidColorBrush;

  // Microsoft.UI.Xaml.Media.IImageBrush
  IImageBrush = interface;
  PIImageBrush = ^IImageBrush;

  // Microsoft.UI.Xaml.Media.IGeometry
  IGeometry = interface;
  PIGeometry = ^IGeometry;

  // Microsoft.UI.Xaml.Media.Animation.ITimeline
  Animation_ITimeline = interface;
  PAnimation_ITimeline = ^Animation_ITimeline;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterator_1__Animation_ITimeline = interface;
  PIIterator_1__Animation_ITimeline = ^IIterator_1__Animation_ITimeline;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterable_1__Animation_ITimeline = interface;
  PIIterable_1__Animation_ITimeline = ^IIterable_1__Animation_ITimeline;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IVectorView_1__Animation_ITimeline = interface;
  PIVectorView_1__Animation_ITimeline = ^IVectorView_1__Animation_ITimeline;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IVector_1__Animation_ITimeline = interface;
  PIVector_1__Animation_ITimeline = ^IVector_1__Animation_ITimeline;

  // Microsoft.UI.Xaml.Media.Animation.IStoryboard
  Animation_IStoryboard = interface;
  PAnimation_IStoryboard = ^Animation_IStoryboard;

  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBase
  Animation_IEasingFunctionBase = interface;
  PAnimation_IEasingFunctionBase = ^Animation_IEasingFunctionBase;

  // Microsoft.UI.Xaml.Media.ISystemBackdrop
  ISystemBackdrop = interface;
  PISystemBackdrop = ^ISystemBackdrop;

  // Microsoft.UI.Xaml.Media.Animation.IAddDeleteThemeTransition
  Animation_IAddDeleteThemeTransition = interface;
  PAnimation_IAddDeleteThemeTransition = ^Animation_IAddDeleteThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IBackEase
  Animation_IBackEase = interface;
  PAnimation_IBackEase = ^Animation_IBackEase;

  // Microsoft.UI.Xaml.Media.Animation.IBackEaseStatics
  Animation_IBackEaseStatics = interface;
  PAnimation_IBackEaseStatics = ^Animation_IBackEaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfiguration
  Animation_IBasicConnectedAnimationConfiguration = interface;
  PAnimation_IBasicConnectedAnimationConfiguration = ^Animation_IBasicConnectedAnimationConfiguration;

  // Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfigurationFactory
  Animation_IBasicConnectedAnimationConfigurationFactory = interface;
  PAnimation_IBasicConnectedAnimationConfigurationFactory = ^Animation_IBasicConnectedAnimationConfigurationFactory;

  // Microsoft.UI.Xaml.Media.Animation.IBeginStoryboard
  Animation_IBeginStoryboard = interface;
  PAnimation_IBeginStoryboard = ^Animation_IBeginStoryboard;

  // Microsoft.UI.Xaml.Media.Animation.IBeginStoryboardStatics
  Animation_IBeginStoryboardStatics = interface;
  PAnimation_IBeginStoryboardStatics = ^Animation_IBeginStoryboardStatics;

  // Microsoft.UI.Xaml.Media.Animation.IBounceEase
  Animation_IBounceEase = interface;
  PAnimation_IBounceEase = ^Animation_IBounceEase;

  // Microsoft.UI.Xaml.Media.Animation.IBounceEaseStatics
  Animation_IBounceEaseStatics = interface;
  PAnimation_IBounceEaseStatics = ^Animation_IBounceEaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.ICircleEase
  Animation_ICircleEase = interface;
  PAnimation_ICircleEase = ^Animation_ICircleEase;

  // Microsoft.UI.Xaml.Media.Animation.IColorAnimation
  Animation_IColorAnimation = interface;
  PAnimation_IColorAnimation = ^Animation_IColorAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationStatics
  Animation_IColorAnimationStatics = interface;
  PAnimation_IColorAnimationStatics = ^Animation_IColorAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame
  Animation_IColorKeyFrame = interface;
  PAnimation_IColorKeyFrame = ^Animation_IColorKeyFrame;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterator_1__Animation_IColorKeyFrame = interface;
  PIIterator_1__Animation_IColorKeyFrame = ^IIterator_1__Animation_IColorKeyFrame;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterable_1__Animation_IColorKeyFrame = interface;
  PIIterable_1__Animation_IColorKeyFrame = ^IIterable_1__Animation_IColorKeyFrame;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IVectorView_1__Animation_IColorKeyFrame = interface;
  PIVectorView_1__Animation_IColorKeyFrame = ^IVectorView_1__Animation_IColorKeyFrame;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IVector_1__Animation_IColorKeyFrame = interface;
  PIVector_1__Animation_IColorKeyFrame = ^IVector_1__Animation_IColorKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames
  Animation_IColorAnimationUsingKeyFrames = interface;
  PAnimation_IColorAnimationUsingKeyFrames = ^Animation_IColorAnimationUsingKeyFrames;

  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFramesStatics
  Animation_IColorAnimationUsingKeyFramesStatics = interface;
  PAnimation_IColorAnimationUsingKeyFramesStatics = ^Animation_IColorAnimationUsingKeyFramesStatics;

  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameFactory
  Animation_IColorKeyFrameFactory = interface;
  PAnimation_IColorKeyFrameFactory = ^Animation_IColorKeyFrameFactory;

  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameStatics
  Animation_IColorKeyFrameStatics = interface;
  PAnimation_IColorKeyFrameStatics = ^Animation_IColorKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo
  Animation_ICommonNavigationTransitionInfo = interface;
  PAnimation_ICommonNavigationTransitionInfo = ^Animation_ICommonNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfoStatics
  Animation_ICommonNavigationTransitionInfoStatics = interface;
  PAnimation_ICommonNavigationTransitionInfoStatics = ^Animation_ICommonNavigationTransitionInfoStatics;

  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfigurationFactory
  Animation_IConnectedAnimationConfigurationFactory = interface;
  PAnimation_IConnectedAnimationConfigurationFactory = ^Animation_IConnectedAnimationConfigurationFactory;

  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationService
  Animation_IConnectedAnimationService = interface;
  PAnimation_IConnectedAnimationService = ^Animation_IConnectedAnimationService;

  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationServiceStatics
  Animation_IConnectedAnimationServiceStatics = interface;
  PAnimation_IConnectedAnimationServiceStatics = ^Animation_IConnectedAnimationServiceStatics;

  // Microsoft.UI.Xaml.Media.Animation.IContentThemeTransition
  Animation_IContentThemeTransition = interface;
  PAnimation_IContentThemeTransition = ^Animation_IContentThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IContentThemeTransitionStatics
  Animation_IContentThemeTransitionStatics = interface;
  PAnimation_IContentThemeTransitionStatics = ^Animation_IContentThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo
  Animation_IContinuumNavigationTransitionInfo = interface;
  PAnimation_IContinuumNavigationTransitionInfo = ^Animation_IContinuumNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfoStatics
  Animation_IContinuumNavigationTransitionInfoStatics = interface;
  PAnimation_IContinuumNavigationTransitionInfoStatics = ^Animation_IContinuumNavigationTransitionInfoStatics;

  // Microsoft.UI.Xaml.Media.Animation.ICubicEase
  Animation_ICubicEase = interface;
  PAnimation_ICubicEase = ^Animation_ICubicEase;

  // Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfiguration
  Animation_IDirectConnectedAnimationConfiguration = interface;
  PAnimation_IDirectConnectedAnimationConfiguration = ^Animation_IDirectConnectedAnimationConfiguration;

  // Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfigurationFactory
  Animation_IDirectConnectedAnimationConfigurationFactory = interface;
  PAnimation_IDirectConnectedAnimationConfigurationFactory = ^Animation_IDirectConnectedAnimationConfigurationFactory;

  // Microsoft.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame
  Animation_IDiscreteColorKeyFrame = interface;
  PAnimation_IDiscreteColorKeyFrame = ^Animation_IDiscreteColorKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame
  Animation_IDiscreteDoubleKeyFrame = interface;
  PAnimation_IDiscreteDoubleKeyFrame = ^Animation_IDiscreteDoubleKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame
  Animation_IDiscreteObjectKeyFrame = interface;
  PAnimation_IDiscreteObjectKeyFrame = ^Animation_IDiscreteObjectKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IDiscretePointKeyFrame
  Animation_IDiscretePointKeyFrame = interface;
  PAnimation_IDiscretePointKeyFrame = ^Animation_IDiscretePointKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimation
  Animation_IDoubleAnimation = interface;
  PAnimation_IDoubleAnimation = ^Animation_IDoubleAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationStatics
  Animation_IDoubleAnimationStatics = interface;
  PAnimation_IDoubleAnimationStatics = ^Animation_IDoubleAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame
  Animation_IDoubleKeyFrame = interface;
  PAnimation_IDoubleKeyFrame = ^Animation_IDoubleKeyFrame;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterator_1__Animation_IDoubleKeyFrame = interface;
  PIIterator_1__Animation_IDoubleKeyFrame = ^IIterator_1__Animation_IDoubleKeyFrame;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterable_1__Animation_IDoubleKeyFrame = interface;
  PIIterable_1__Animation_IDoubleKeyFrame = ^IIterable_1__Animation_IDoubleKeyFrame;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IVectorView_1__Animation_IDoubleKeyFrame = interface;
  PIVectorView_1__Animation_IDoubleKeyFrame = ^IVectorView_1__Animation_IDoubleKeyFrame;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IVector_1__Animation_IDoubleKeyFrame = interface;
  PIVector_1__Animation_IDoubleKeyFrame = ^IVector_1__Animation_IDoubleKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames
  Animation_IDoubleAnimationUsingKeyFrames = interface;
  PAnimation_IDoubleAnimationUsingKeyFrames = ^Animation_IDoubleAnimationUsingKeyFrames;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFramesStatics
  Animation_IDoubleAnimationUsingKeyFramesStatics = interface;
  PAnimation_IDoubleAnimationUsingKeyFramesStatics = ^Animation_IDoubleAnimationUsingKeyFramesStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameFactory
  Animation_IDoubleKeyFrameFactory = interface;
  PAnimation_IDoubleKeyFrameFactory = ^Animation_IDoubleKeyFrameFactory;

  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameStatics
  Animation_IDoubleKeyFrameStatics = interface;
  PAnimation_IDoubleKeyFrameStatics = ^Animation_IDoubleKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimation
  Animation_IDragItemThemeAnimation = interface;
  PAnimation_IDragItemThemeAnimation = ^Animation_IDragItemThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimationStatics
  Animation_IDragItemThemeAnimationStatics = interface;
  PAnimation_IDragItemThemeAnimationStatics = ^Animation_IDragItemThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimation
  Animation_IDragOverThemeAnimation = interface;
  PAnimation_IDragOverThemeAnimation = ^Animation_IDragOverThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimationStatics
  Animation_IDragOverThemeAnimationStatics = interface;
  PAnimation_IDragOverThemeAnimationStatics = ^Animation_IDragOverThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo
  Animation_IDrillInNavigationTransitionInfo = interface;
  PAnimation_IDrillInNavigationTransitionInfo = ^Animation_IDrillInNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimation
  Animation_IDrillInThemeAnimation = interface;
  PAnimation_IDrillInThemeAnimation = ^Animation_IDrillInThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimationStatics
  Animation_IDrillInThemeAnimationStatics = interface;
  PAnimation_IDrillInThemeAnimationStatics = ^Animation_IDrillInThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimation
  Animation_IDrillOutThemeAnimation = interface;
  PAnimation_IDrillOutThemeAnimation = ^Animation_IDrillOutThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimationStatics
  Animation_IDrillOutThemeAnimationStatics = interface;
  PAnimation_IDrillOutThemeAnimationStatics = ^Animation_IDrillOutThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation
  Animation_IDropTargetItemThemeAnimation = interface;
  PAnimation_IDropTargetItemThemeAnimation = ^Animation_IDropTargetItemThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimationStatics
  Animation_IDropTargetItemThemeAnimationStatics = interface;
  PAnimation_IDropTargetItemThemeAnimationStatics = ^Animation_IDropTargetItemThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrame
  Animation_IEasingColorKeyFrame = interface;
  PAnimation_IEasingColorKeyFrame = ^Animation_IEasingColorKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrameStatics
  Animation_IEasingColorKeyFrameStatics = interface;
  PAnimation_IEasingColorKeyFrameStatics = ^Animation_IEasingColorKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame
  Animation_IEasingDoubleKeyFrame = interface;
  PAnimation_IEasingDoubleKeyFrame = ^Animation_IEasingDoubleKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrameStatics
  Animation_IEasingDoubleKeyFrameStatics = interface;
  PAnimation_IEasingDoubleKeyFrameStatics = ^Animation_IEasingDoubleKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory
  Animation_IEasingFunctionBaseFactory = interface;
  PAnimation_IEasingFunctionBaseFactory = ^Animation_IEasingFunctionBaseFactory;

  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseStatics
  Animation_IEasingFunctionBaseStatics = interface;
  PAnimation_IEasingFunctionBaseStatics = ^Animation_IEasingFunctionBaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrame
  Animation_IEasingPointKeyFrame = interface;
  PAnimation_IEasingPointKeyFrame = ^Animation_IEasingPointKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrameStatics
  Animation_IEasingPointKeyFrameStatics = interface;
  PAnimation_IEasingPointKeyFrameStatics = ^Animation_IEasingPointKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransition
  Animation_IEdgeUIThemeTransition = interface;
  PAnimation_IEdgeUIThemeTransition = ^Animation_IEdgeUIThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransitionStatics
  Animation_IEdgeUIThemeTransitionStatics = interface;
  PAnimation_IEdgeUIThemeTransitionStatics = ^Animation_IEdgeUIThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.IElasticEase
  Animation_IElasticEase = interface;
  PAnimation_IElasticEase = ^Animation_IElasticEase;

  // Microsoft.UI.Xaml.Media.Animation.IElasticEaseStatics
  Animation_IElasticEaseStatics = interface;
  PAnimation_IElasticEaseStatics = ^Animation_IElasticEaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo
  Animation_IEntranceNavigationTransitionInfo = interface;
  PAnimation_IEntranceNavigationTransitionInfo = ^Animation_IEntranceNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfoStatics
  Animation_IEntranceNavigationTransitionInfoStatics = interface;
  PAnimation_IEntranceNavigationTransitionInfoStatics = ^Animation_IEntranceNavigationTransitionInfoStatics;

  // Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransition
  Animation_IEntranceThemeTransition = interface;
  PAnimation_IEntranceThemeTransition = ^Animation_IEntranceThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransitionStatics
  Animation_IEntranceThemeTransitionStatics = interface;
  PAnimation_IEntranceThemeTransitionStatics = ^Animation_IEntranceThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.IExponentialEase
  Animation_IExponentialEase = interface;
  PAnimation_IExponentialEase = ^Animation_IExponentialEase;

  // Microsoft.UI.Xaml.Media.Animation.IExponentialEaseStatics
  Animation_IExponentialEaseStatics = interface;
  PAnimation_IExponentialEaseStatics = ^Animation_IExponentialEaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimation
  Animation_IFadeInThemeAnimation = interface;
  PAnimation_IFadeInThemeAnimation = ^Animation_IFadeInThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimationStatics
  Animation_IFadeInThemeAnimationStatics = interface;
  PAnimation_IFadeInThemeAnimationStatics = ^Animation_IFadeInThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimation
  Animation_IFadeOutThemeAnimation = interface;
  PAnimation_IFadeOutThemeAnimation = ^Animation_IFadeOutThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimationStatics
  Animation_IFadeOutThemeAnimationStatics = interface;
  PAnimation_IFadeOutThemeAnimationStatics = ^Animation_IFadeOutThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfiguration
  Animation_IGravityConnectedAnimationConfiguration = interface;
  PAnimation_IGravityConnectedAnimationConfiguration = ^Animation_IGravityConnectedAnimationConfiguration;

  // Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfigurationFactory
  Animation_IGravityConnectedAnimationConfigurationFactory = interface;
  PAnimation_IGravityConnectedAnimationConfigurationFactory = ^Animation_IGravityConnectedAnimationConfigurationFactory;

  // Microsoft.UI.Xaml.Media.Animation.IKeySpline
  Animation_IKeySpline = interface;
  PAnimation_IKeySpline = ^Animation_IKeySpline;

  // Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelper
  Animation_IKeyTimeHelper = interface;
  PAnimation_IKeyTimeHelper = ^Animation_IKeyTimeHelper;

  // Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelperStatics
  Animation_IKeyTimeHelperStatics = interface;
  PAnimation_IKeyTimeHelperStatics = ^Animation_IKeyTimeHelperStatics;

  // Microsoft.UI.Xaml.Media.Animation.ILinearColorKeyFrame
  Animation_ILinearColorKeyFrame = interface;
  PAnimation_ILinearColorKeyFrame = ^Animation_ILinearColorKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame
  Animation_ILinearDoubleKeyFrame = interface;
  PAnimation_ILinearDoubleKeyFrame = ^Animation_ILinearDoubleKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.ILinearPointKeyFrame
  Animation_ILinearPointKeyFrame = interface;
  PAnimation_ILinearPointKeyFrame = ^Animation_ILinearPointKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransition
  Animation_INavigationThemeTransition = interface;
  PAnimation_INavigationThemeTransition = ^Animation_INavigationThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransitionStatics
  Animation_INavigationThemeTransitionStatics = interface;
  PAnimation_INavigationThemeTransitionStatics = ^Animation_INavigationThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoFactory
  Animation_INavigationTransitionInfoFactory = interface;
  PAnimation_INavigationTransitionInfoFactory = ^Animation_INavigationTransitionInfoFactory;

  // Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoOverrides
  Animation_INavigationTransitionInfoOverrides = interface;
  PAnimation_INavigationTransitionInfoOverrides = ^Animation_INavigationTransitionInfoOverrides;

  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame
  Animation_IObjectKeyFrame = interface;
  PAnimation_IObjectKeyFrame = ^Animation_IObjectKeyFrame;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterator_1__Animation_IObjectKeyFrame = interface;
  PIIterator_1__Animation_IObjectKeyFrame = ^IIterator_1__Animation_IObjectKeyFrame;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterable_1__Animation_IObjectKeyFrame = interface;
  PIIterable_1__Animation_IObjectKeyFrame = ^IIterable_1__Animation_IObjectKeyFrame;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IVectorView_1__Animation_IObjectKeyFrame = interface;
  PIVectorView_1__Animation_IObjectKeyFrame = ^IVectorView_1__Animation_IObjectKeyFrame;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IVector_1__Animation_IObjectKeyFrame = interface;
  PIVector_1__Animation_IObjectKeyFrame = ^IVector_1__Animation_IObjectKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames
  Animation_IObjectAnimationUsingKeyFrames = interface;
  PAnimation_IObjectAnimationUsingKeyFrames = ^Animation_IObjectAnimationUsingKeyFrames;

  // Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFramesStatics
  Animation_IObjectAnimationUsingKeyFramesStatics = interface;
  PAnimation_IObjectAnimationUsingKeyFramesStatics = ^Animation_IObjectAnimationUsingKeyFramesStatics;

  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameFactory
  Animation_IObjectKeyFrameFactory = interface;
  PAnimation_IObjectKeyFrameFactory = ^Animation_IObjectKeyFrameFactory;

  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameStatics
  Animation_IObjectKeyFrameStatics = interface;
  PAnimation_IObjectKeyFrameStatics = ^Animation_IObjectKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransition
  Animation_IPaneThemeTransition = interface;
  PAnimation_IPaneThemeTransition = ^Animation_IPaneThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransitionStatics
  Animation_IPaneThemeTransitionStatics = interface;
  PAnimation_IPaneThemeTransitionStatics = ^Animation_IPaneThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPointAnimation
  Animation_IPointAnimation = interface;
  PAnimation_IPointAnimation = ^Animation_IPointAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationStatics
  Animation_IPointAnimationStatics = interface;
  PAnimation_IPointAnimationStatics = ^Animation_IPointAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame
  Animation_IPointKeyFrame = interface;
  PAnimation_IPointKeyFrame = ^Animation_IPointKeyFrame;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterator_1__Animation_IPointKeyFrame = interface;
  PIIterator_1__Animation_IPointKeyFrame = ^IIterator_1__Animation_IPointKeyFrame;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterable_1__Animation_IPointKeyFrame = interface;
  PIIterable_1__Animation_IPointKeyFrame = ^IIterable_1__Animation_IPointKeyFrame;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IVectorView_1__Animation_IPointKeyFrame = interface;
  PIVectorView_1__Animation_IPointKeyFrame = ^IVectorView_1__Animation_IPointKeyFrame;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IVector_1__Animation_IPointKeyFrame = interface;
  PIVector_1__Animation_IPointKeyFrame = ^IVector_1__Animation_IPointKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames
  Animation_IPointAnimationUsingKeyFrames = interface;
  PAnimation_IPointAnimationUsingKeyFrames = ^Animation_IPointAnimationUsingKeyFrames;

  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFramesStatics
  Animation_IPointAnimationUsingKeyFramesStatics = interface;
  PAnimation_IPointAnimationUsingKeyFramesStatics = ^Animation_IPointAnimationUsingKeyFramesStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameFactory
  Animation_IPointKeyFrameFactory = interface;
  PAnimation_IPointKeyFrameFactory = ^Animation_IPointKeyFrameFactory;

  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameStatics
  Animation_IPointKeyFrameStatics = interface;
  PAnimation_IPointKeyFrameStatics = ^Animation_IPointKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimation
  Animation_IPointerDownThemeAnimation = interface;
  PAnimation_IPointerDownThemeAnimation = ^Animation_IPointerDownThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimationStatics
  Animation_IPointerDownThemeAnimationStatics = interface;
  PAnimation_IPointerDownThemeAnimationStatics = ^Animation_IPointerDownThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimation
  Animation_IPointerUpThemeAnimation = interface;
  PAnimation_IPointerUpThemeAnimation = ^Animation_IPointerUpThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimationStatics
  Animation_IPointerUpThemeAnimationStatics = interface;
  PAnimation_IPointerUpThemeAnimationStatics = ^Animation_IPointerUpThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimation
  Animation_IPopInThemeAnimation = interface;
  PAnimation_IPopInThemeAnimation = ^Animation_IPopInThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimationStatics
  Animation_IPopInThemeAnimationStatics = interface;
  PAnimation_IPopInThemeAnimationStatics = ^Animation_IPopInThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimation
  Animation_IPopOutThemeAnimation = interface;
  PAnimation_IPopOutThemeAnimation = ^Animation_IPopOutThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimationStatics
  Animation_IPopOutThemeAnimationStatics = interface;
  PAnimation_IPopOutThemeAnimationStatics = ^Animation_IPopOutThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransition
  Animation_IPopupThemeTransition = interface;
  PAnimation_IPopupThemeTransition = ^Animation_IPopupThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransitionStatics
  Animation_IPopupThemeTransitionStatics = interface;
  PAnimation_IPopupThemeTransitionStatics = ^Animation_IPopupThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.IPowerEase
  Animation_IPowerEase = interface;
  PAnimation_IPowerEase = ^Animation_IPowerEase;

  // Microsoft.UI.Xaml.Media.Animation.IPowerEaseStatics
  Animation_IPowerEaseStatics = interface;
  PAnimation_IPowerEaseStatics = ^Animation_IPowerEaseStatics;

  // Microsoft.UI.Xaml.Media.Animation.IQuadraticEase
  Animation_IQuadraticEase = interface;
  PAnimation_IQuadraticEase = ^Animation_IQuadraticEase;

  // Microsoft.UI.Xaml.Media.Animation.IQuarticEase
  Animation_IQuarticEase = interface;
  PAnimation_IQuarticEase = ^Animation_IQuarticEase;

  // Microsoft.UI.Xaml.Media.Animation.IQuinticEase
  Animation_IQuinticEase = interface;
  PAnimation_IQuinticEase = ^Animation_IQuinticEase;

  // Microsoft.UI.Xaml.Media.Animation.IReorderThemeTransition
  Animation_IReorderThemeTransition = interface;
  PAnimation_IReorderThemeTransition = ^Animation_IReorderThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelper
  Animation_IRepeatBehaviorHelper = interface;
  PAnimation_IRepeatBehaviorHelper = ^Animation_IRepeatBehaviorHelper;

  // Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelperStatics
  Animation_IRepeatBehaviorHelperStatics = interface;
  PAnimation_IRepeatBehaviorHelperStatics = ^Animation_IRepeatBehaviorHelperStatics;

  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimation
  Animation_IRepositionThemeAnimation = interface;
  PAnimation_IRepositionThemeAnimation = ^Animation_IRepositionThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimationStatics
  Animation_IRepositionThemeAnimationStatics = interface;
  PAnimation_IRepositionThemeAnimationStatics = ^Animation_IRepositionThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransition
  Animation_IRepositionThemeTransition = interface;
  PAnimation_IRepositionThemeTransition = ^Animation_IRepositionThemeTransition;

  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransitionStatics
  Animation_IRepositionThemeTransitionStatics = interface;
  PAnimation_IRepositionThemeTransitionStatics = ^Animation_IRepositionThemeTransitionStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISineEase
  Animation_ISineEase = interface;
  PAnimation_ISineEase = ^Animation_ISineEase;

  // Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo
  Animation_ISlideNavigationTransitionInfo = interface;
  PAnimation_ISlideNavigationTransitionInfo = ^Animation_ISlideNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfoStatics
  Animation_ISlideNavigationTransitionInfoStatics = interface;
  PAnimation_ISlideNavigationTransitionInfoStatics = ^Animation_ISlideNavigationTransitionInfoStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrame
  Animation_ISplineColorKeyFrame = interface;
  PAnimation_ISplineColorKeyFrame = ^Animation_ISplineColorKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrameStatics
  Animation_ISplineColorKeyFrameStatics = interface;
  PAnimation_ISplineColorKeyFrameStatics = ^Animation_ISplineColorKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame
  Animation_ISplineDoubleKeyFrame = interface;
  PAnimation_ISplineDoubleKeyFrame = ^Animation_ISplineDoubleKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrameStatics
  Animation_ISplineDoubleKeyFrameStatics = interface;
  PAnimation_ISplineDoubleKeyFrameStatics = ^Animation_ISplineDoubleKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrame
  Animation_ISplinePointKeyFrame = interface;
  PAnimation_ISplinePointKeyFrame = ^Animation_ISplinePointKeyFrame;

  // Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrameStatics
  Animation_ISplinePointKeyFrameStatics = interface;
  PAnimation_ISplinePointKeyFrameStatics = ^Animation_ISplinePointKeyFrameStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation
  Animation_ISplitCloseThemeAnimation = interface;
  PAnimation_ISplitCloseThemeAnimation = ^Animation_ISplitCloseThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimationStatics
  Animation_ISplitCloseThemeAnimationStatics = interface;
  PAnimation_ISplitCloseThemeAnimationStatics = ^Animation_ISplitCloseThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation
  Animation_ISplitOpenThemeAnimation = interface;
  PAnimation_ISplitOpenThemeAnimation = ^Animation_ISplitOpenThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimationStatics
  Animation_ISplitOpenThemeAnimationStatics = interface;
  PAnimation_ISplitOpenThemeAnimationStatics = ^Animation_ISplitOpenThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.IStoryboardStatics
  Animation_IStoryboardStatics = interface;
  PAnimation_IStoryboardStatics = ^Animation_IStoryboardStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo
  Animation_ISuppressNavigationTransitionInfo = interface;
  PAnimation_ISuppressNavigationTransitionInfo = ^Animation_ISuppressNavigationTransitionInfo;

  // Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation
  Animation_ISwipeBackThemeAnimation = interface;
  PAnimation_ISwipeBackThemeAnimation = ^Animation_ISwipeBackThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimationStatics
  Animation_ISwipeBackThemeAnimationStatics = interface;
  PAnimation_ISwipeBackThemeAnimationStatics = ^Animation_ISwipeBackThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation
  Animation_ISwipeHintThemeAnimation = interface;
  PAnimation_ISwipeHintThemeAnimation = ^Animation_ISwipeHintThemeAnimation;

  // Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimationStatics
  Animation_ISwipeHintThemeAnimationStatics = interface;
  PAnimation_ISwipeHintThemeAnimationStatics = ^Animation_ISwipeHintThemeAnimationStatics;

  // Microsoft.UI.Xaml.Media.Animation.ITimelineFactory
  Animation_ITimelineFactory = interface;
  PAnimation_ITimelineFactory = ^Animation_ITimelineFactory;

  // Microsoft.UI.Xaml.Media.Animation.ITimelineStatics
  Animation_ITimelineStatics = interface;
  PAnimation_ITimelineStatics = ^Animation_ITimelineStatics;

  // Microsoft.UI.Xaml.Media.Animation.ITransitionFactory
  Animation_ITransitionFactory = interface;
  PAnimation_ITransitionFactory = ^Animation_ITransitionFactory;

  // Microsoft.UI.Xaml.Media.IAcrylicBrush
  IAcrylicBrush = interface;
  PIAcrylicBrush = ^IAcrylicBrush;

  // Microsoft.UI.Xaml.Media.IAcrylicBrush2
  IAcrylicBrush2 = interface;
  PIAcrylicBrush2 = ^IAcrylicBrush2;

  // Microsoft.UI.Xaml.Media.IAcrylicBrushFactory
  IAcrylicBrushFactory = interface;
  PIAcrylicBrushFactory = ^IAcrylicBrushFactory;

  // Microsoft.UI.Xaml.Media.IAcrylicBrushStatics
  IAcrylicBrushStatics = interface;
  PIAcrylicBrushStatics = ^IAcrylicBrushStatics;

  // Microsoft.UI.Xaml.Media.IAcrylicBrushStatics2
  IAcrylicBrushStatics2 = interface;
  PIAcrylicBrushStatics2 = ^IAcrylicBrushStatics2;

  // Microsoft.UI.Xaml.Media.IArcSegment
  IArcSegment = interface;
  PIArcSegment = ^IArcSegment;

  // Microsoft.UI.Xaml.Media.IArcSegmentStatics
  IArcSegmentStatics = interface;
  PIArcSegmentStatics = ^IArcSegmentStatics;

  // Microsoft.UI.Xaml.Media.IBezierSegment
  IBezierSegment = interface;
  PIBezierSegment = ^IBezierSegment;

  // Microsoft.UI.Xaml.Media.IBezierSegmentStatics
  IBezierSegmentStatics = interface;
  PIBezierSegmentStatics = ^IBezierSegmentStatics;

  // Microsoft.UI.Xaml.Media.IBitmapCache
  IBitmapCache = interface;
  PIBitmapCache = ^IBitmapCache;

  // Microsoft.UI.Xaml.Media.IBrushFactory
  IBrushFactory = interface;
  PIBrushFactory = ^IBrushFactory;

  // Microsoft.UI.Xaml.Media.IBrushOverrides
  IBrushOverrides = interface;
  PIBrushOverrides = ^IBrushOverrides;

  // Microsoft.UI.Xaml.Media.IBrushStatics
  IBrushStatics = interface;
  PIBrushStatics = ^IBrushStatics;

  // Microsoft.UI.Xaml.Media.ICacheModeFactory
  ICacheModeFactory = interface;
  PICacheModeFactory = ^ICacheModeFactory;

  // Microsoft.UI.Xaml.Media.ICompositeTransform
  ICompositeTransform = interface;
  PICompositeTransform = ^ICompositeTransform;

  // Microsoft.UI.Xaml.Media.ICompositeTransformStatics
  ICompositeTransformStatics = interface;
  PICompositeTransformStatics = ^ICompositeTransformStatics;

  // Microsoft.UI.Xaml.Media.ICompositionTarget
  ICompositionTarget = interface;
  PICompositionTarget = ^ICompositionTarget;

  // Microsoft.UI.Xaml.Media.IRenderedEventArgs
  IRenderedEventArgs = interface;
  PIRenderedEventArgs = ^IRenderedEventArgs;

  // Windows.Foundation.EventHandler`1<Microsoft.UI.Xaml.Media.IRenderedEventArgs>
  EventHandler_1__IRenderedEventArgs = interface;
  PEventHandler_1__IRenderedEventArgs = ^EventHandler_1__IRenderedEventArgs;

  // Microsoft.UI.Xaml.Media.ICompositionTargetStatics
  ICompositionTargetStatics = interface;
  PICompositionTargetStatics = ^ICompositionTargetStatics;

  // Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdrop
  IDesktopAcrylicBackdrop = interface;
  PIDesktopAcrylicBackdrop = ^IDesktopAcrylicBackdrop;

  // Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdropFactory
  IDesktopAcrylicBackdropFactory = interface;
  PIDesktopAcrylicBackdropFactory = ^IDesktopAcrylicBackdropFactory;

  // Microsoft.UI.Xaml.Media.IEllipseGeometry
  IEllipseGeometry = interface;
  PIEllipseGeometry = ^IEllipseGeometry;

  // Microsoft.UI.Xaml.Media.IEllipseGeometryStatics
  IEllipseGeometryStatics = interface;
  PIEllipseGeometryStatics = ^IEllipseGeometryStatics;

  // Microsoft.UI.Xaml.Media.IFontFamilyFactory
  IFontFamilyFactory = interface;
  PIFontFamilyFactory = ^IFontFamilyFactory;

  // Microsoft.UI.Xaml.Media.IFontFamilyStatics
  IFontFamilyStatics = interface;
  PIFontFamilyStatics = ^IFontFamilyStatics;

  // Microsoft.UI.Xaml.Media.IGeneralTransformFactory
  IGeneralTransformFactory = interface;
  PIGeneralTransformFactory = ^IGeneralTransformFactory;

  // Microsoft.UI.Xaml.Media.IGeneralTransformOverrides
  IGeneralTransformOverrides = interface;
  PIGeneralTransformOverrides = ^IGeneralTransformOverrides;

  // Microsoft.UI.Xaml.Media.IGeometryFactory
  IGeometryFactory = interface;
  PIGeometryFactory = ^IGeometryFactory;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterator_1__IGeometry = interface;
  PIIterator_1__IGeometry = ^IIterator_1__IGeometry;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterable_1__IGeometry = interface;
  PIIterable_1__IGeometry = ^IIterable_1__IGeometry;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IGeometry>
  IVectorView_1__IGeometry = interface;
  PIVectorView_1__IGeometry = ^IVectorView_1__IGeometry;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGeometry>
  IVector_1__IGeometry = interface;
  PIVector_1__IGeometry = ^IVector_1__IGeometry;

  // Microsoft.UI.Xaml.Media.IGeometryGroup
  IGeometryGroup = interface;
  PIGeometryGroup = ^IGeometryGroup;

  // Microsoft.UI.Xaml.Media.IGeometryGroupStatics
  IGeometryGroupStatics = interface;
  PIGeometryGroupStatics = ^IGeometryGroupStatics;

  // Microsoft.UI.Xaml.Media.IGeometryStatics
  IGeometryStatics = interface;
  PIGeometryStatics = ^IGeometryStatics;

  // Microsoft.UI.Xaml.Media.IGradientStop
  IGradientStop = interface;
  PIGradientStop = ^IGradientStop;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterator_1__IGradientStop = interface;
  PIIterator_1__IGradientStop = ^IIterator_1__IGradientStop;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterable_1__IGradientStop = interface;
  PIIterable_1__IGradientStop = ^IIterable_1__IGradientStop;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IVectorView_1__IGradientStop = interface;
  PIVectorView_1__IGradientStop = ^IVectorView_1__IGradientStop;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IVector_1__IGradientStop = interface;
  PIVector_1__IGradientStop = ^IVector_1__IGradientStop;

  // Microsoft.UI.Xaml.Media.IGradientBrush
  IGradientBrush = interface;
  PIGradientBrush = ^IGradientBrush;

  // Microsoft.UI.Xaml.Media.IGradientBrushFactory
  IGradientBrushFactory = interface;
  PIGradientBrushFactory = ^IGradientBrushFactory;

  // Microsoft.UI.Xaml.Media.IGradientBrushStatics
  IGradientBrushStatics = interface;
  PIGradientBrushStatics = ^IGradientBrushStatics;

  // Microsoft.UI.Xaml.Media.IGradientStopStatics
  IGradientStopStatics = interface;
  PIGradientStopStatics = ^IGradientStopStatics;

  // Microsoft.UI.Xaml.Media.IImageBrushStatics
  IImageBrushStatics = interface;
  PIImageBrushStatics = ^IImageBrushStatics;

  // Microsoft.UI.Xaml.Media.IImageSourceFactory
  IImageSourceFactory = interface;
  PIImageSourceFactory = ^IImageSourceFactory;

  // Microsoft.UI.Xaml.Media.ILineGeometry
  ILineGeometry = interface;
  PILineGeometry = ^ILineGeometry;

  // Microsoft.UI.Xaml.Media.ILineGeometryStatics
  ILineGeometryStatics = interface;
  PILineGeometryStatics = ^ILineGeometryStatics;

  // Microsoft.UI.Xaml.Media.ILineSegment
  ILineSegment = interface;
  PILineSegment = ^ILineSegment;

  // Microsoft.UI.Xaml.Media.ILineSegmentStatics
  ILineSegmentStatics = interface;
  PILineSegmentStatics = ^ILineSegmentStatics;

  // Microsoft.UI.Xaml.Media.ILinearGradientBrush
  ILinearGradientBrush = interface;
  PILinearGradientBrush = ^ILinearGradientBrush;

  // Microsoft.UI.Xaml.Media.ILinearGradientBrushFactory
  ILinearGradientBrushFactory = interface;
  PILinearGradientBrushFactory = ^ILinearGradientBrushFactory;

  // Microsoft.UI.Xaml.Media.ILinearGradientBrushStatics
  ILinearGradientBrushStatics = interface;
  PILinearGradientBrushStatics = ^ILinearGradientBrushStatics;

  // Microsoft.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs
  ILoadedImageSourceLoadCompletedEventArgs = interface;
  PILoadedImageSourceLoadCompletedEventArgs = ^ILoadedImageSourceLoadCompletedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.ILoadedImageSurface,Microsoft.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs>
  TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs = interface;
  PTypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs = ^TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs;

  // Microsoft.UI.Xaml.Media.ILoadedImageSurface
  ILoadedImageSurface = interface;
  PILoadedImageSurface = ^ILoadedImageSurface;

  // Microsoft.UI.Xaml.Media.ILoadedImageSurfaceStatics
  ILoadedImageSurfaceStatics = interface;
  PILoadedImageSurfaceStatics = ^ILoadedImageSurfaceStatics;

  // Microsoft.UI.Xaml.Media.IMatrix3DProjection
  IMatrix3DProjection = interface;
  PIMatrix3DProjection = ^IMatrix3DProjection;

  // Microsoft.UI.Xaml.Media.IMatrix3DProjectionStatics
  IMatrix3DProjectionStatics = interface;
  PIMatrix3DProjectionStatics = ^IMatrix3DProjectionStatics;

  // Microsoft.UI.Xaml.Media.IMatrixHelper
  IMatrixHelper = interface;
  PIMatrixHelper = ^IMatrixHelper;

  // Microsoft.UI.Xaml.Media.IMatrixHelperStatics
  IMatrixHelperStatics = interface;
  PIMatrixHelperStatics = ^IMatrixHelperStatics;

  // Microsoft.UI.Xaml.Media.IMatrixTransform
  IMatrixTransform = interface;
  PIMatrixTransform = ^IMatrixTransform;

  // Microsoft.UI.Xaml.Media.IMatrixTransformStatics
  IMatrixTransformStatics = interface;
  PIMatrixTransformStatics = ^IMatrixTransformStatics;

  // Microsoft.UI.Xaml.Media.IMicaBackdrop
  IMicaBackdrop = interface;
  PIMicaBackdrop = ^IMicaBackdrop;

  // Microsoft.UI.Xaml.Media.IMicaBackdropFactory
  IMicaBackdropFactory = interface;
  PIMicaBackdropFactory = ^IMicaBackdropFactory;

  // Microsoft.UI.Xaml.Media.IMicaBackdropStatics
  IMicaBackdropStatics = interface;
  PIMicaBackdropStatics = ^IMicaBackdropStatics;

  // Microsoft.UI.Xaml.Media.IPathSegment
  IPathSegment = interface;
  PIPathSegment = ^IPathSegment;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterator_1__IPathSegment = interface;
  PIIterator_1__IPathSegment = ^IIterator_1__IPathSegment;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterable_1__IPathSegment = interface;
  PIIterable_1__IPathSegment = ^IIterable_1__IPathSegment;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IVectorView_1__IPathSegment = interface;
  PIVectorView_1__IPathSegment = ^IVectorView_1__IPathSegment;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IVector_1__IPathSegment = interface;
  PIVector_1__IPathSegment = ^IVector_1__IPathSegment;

  // Microsoft.UI.Xaml.Media.IPathFigure
  IPathFigure = interface;
  PIPathFigure = ^IPathFigure;

  // Microsoft.UI.Xaml.Media.IPathFigureStatics
  IPathFigureStatics = interface;
  PIPathFigureStatics = ^IPathFigureStatics;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterator_1__IPathFigure = interface;
  PIIterator_1__IPathFigure = ^IIterator_1__IPathFigure;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterable_1__IPathFigure = interface;
  PIIterable_1__IPathFigure = ^IIterable_1__IPathFigure;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IVectorView_1__IPathFigure = interface;
  PIVectorView_1__IPathFigure = ^IVectorView_1__IPathFigure;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IVector_1__IPathFigure = interface;
  PIVector_1__IPathFigure = ^IVector_1__IPathFigure;

  // Microsoft.UI.Xaml.Media.IPathGeometry
  IPathGeometry = interface;
  PIPathGeometry = ^IPathGeometry;

  // Microsoft.UI.Xaml.Media.IPathGeometryStatics
  IPathGeometryStatics = interface;
  PIPathGeometryStatics = ^IPathGeometryStatics;

  // Microsoft.UI.Xaml.Media.IPathSegmentFactory
  IPathSegmentFactory = interface;
  PIPathSegmentFactory = ^IPathSegmentFactory;

  // Microsoft.UI.Xaml.Media.IPlaneProjection
  IPlaneProjection = interface;
  PIPlaneProjection = ^IPlaneProjection;

  // Microsoft.UI.Xaml.Media.IPlaneProjectionStatics
  IPlaneProjectionStatics = interface;
  PIPlaneProjectionStatics = ^IPlaneProjectionStatics;

  // Microsoft.UI.Xaml.Media.IPolyBezierSegment
  IPolyBezierSegment = interface;
  PIPolyBezierSegment = ^IPolyBezierSegment;

  // Microsoft.UI.Xaml.Media.IPolyBezierSegmentStatics
  IPolyBezierSegmentStatics = interface;
  PIPolyBezierSegmentStatics = ^IPolyBezierSegmentStatics;

  // Microsoft.UI.Xaml.Media.IPolyLineSegment
  IPolyLineSegment = interface;
  PIPolyLineSegment = ^IPolyLineSegment;

  // Microsoft.UI.Xaml.Media.IPolyLineSegmentStatics
  IPolyLineSegmentStatics = interface;
  PIPolyLineSegmentStatics = ^IPolyLineSegmentStatics;

  // Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegment
  IPolyQuadraticBezierSegment = interface;
  PIPolyQuadraticBezierSegment = ^IPolyQuadraticBezierSegment;

  // Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegmentStatics
  IPolyQuadraticBezierSegmentStatics = interface;
  PIPolyQuadraticBezierSegmentStatics = ^IPolyQuadraticBezierSegmentStatics;

  // Microsoft.UI.Xaml.Media.IProjectionFactory
  IProjectionFactory = interface;
  PIProjectionFactory = ^IProjectionFactory;

  // Microsoft.UI.Xaml.Media.IQuadraticBezierSegment
  IQuadraticBezierSegment = interface;
  PIQuadraticBezierSegment = ^IQuadraticBezierSegment;

  // Microsoft.UI.Xaml.Media.IQuadraticBezierSegmentStatics
  IQuadraticBezierSegmentStatics = interface;
  PIQuadraticBezierSegmentStatics = ^IQuadraticBezierSegmentStatics;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Microsoft.UI.Xaml.Media.IGradientStop>
  VectorChangedEventHandler_1__IGradientStop = interface;
  PVectorChangedEventHandler_1__IGradientStop = ^VectorChangedEventHandler_1__IGradientStop;

  // Windows.Foundation.Collections.IObservableVector`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IObservableVector_1__IGradientStop = interface;
  PIObservableVector_1__IGradientStop = ^IObservableVector_1__IGradientStop;

  // Microsoft.UI.Xaml.Media.IRadialGradientBrush
  IRadialGradientBrush = interface;
  PIRadialGradientBrush = ^IRadialGradientBrush;

  // Microsoft.UI.Xaml.Media.IRadialGradientBrushFactory
  IRadialGradientBrushFactory = interface;
  PIRadialGradientBrushFactory = ^IRadialGradientBrushFactory;

  // Microsoft.UI.Xaml.Media.IRadialGradientBrushStatics
  IRadialGradientBrushStatics = interface;
  PIRadialGradientBrushStatics = ^IRadialGradientBrushStatics;

  // Microsoft.UI.Xaml.Media.IRectangleGeometryStatics
  IRectangleGeometryStatics = interface;
  PIRectangleGeometryStatics = ^IRectangleGeometryStatics;

  // Microsoft.UI.Xaml.Media.IRenderingEventArgs
  IRenderingEventArgs = interface;
  PIRenderingEventArgs = ^IRenderingEventArgs;

  // Microsoft.UI.Xaml.Media.IRotateTransform
  IRotateTransform = interface;
  PIRotateTransform = ^IRotateTransform;

  // Microsoft.UI.Xaml.Media.IRotateTransformStatics
  IRotateTransformStatics = interface;
  PIRotateTransformStatics = ^IRotateTransformStatics;

  // Microsoft.UI.Xaml.Media.IScaleTransform
  IScaleTransform = interface;
  PIScaleTransform = ^IScaleTransform;

  // Microsoft.UI.Xaml.Media.IScaleTransformStatics
  IScaleTransformStatics = interface;
  PIScaleTransformStatics = ^IScaleTransformStatics;

  // Microsoft.UI.Xaml.Media.IShadowFactory
  IShadowFactory = interface;
  PIShadowFactory = ^IShadowFactory;

  // Microsoft.UI.Xaml.Media.ISkewTransform
  ISkewTransform = interface;
  PISkewTransform = ^ISkewTransform;

  // Microsoft.UI.Xaml.Media.ISkewTransformStatics
  ISkewTransformStatics = interface;
  PISkewTransformStatics = ^ISkewTransformStatics;

  // Microsoft.UI.Xaml.Media.ISolidColorBrushFactory
  ISolidColorBrushFactory = interface;
  PISolidColorBrushFactory = ^ISolidColorBrushFactory;

  // Microsoft.UI.Xaml.Media.ISolidColorBrushStatics
  ISolidColorBrushStatics = interface;
  PISolidColorBrushStatics = ^ISolidColorBrushStatics;

  // Microsoft.UI.Xaml.Media.ISystemBackdropFactory
  ISystemBackdropFactory = interface;
  PISystemBackdropFactory = ^ISystemBackdropFactory;

  // Microsoft.UI.Xaml.Media.ISystemBackdropOverrides
  ISystemBackdropOverrides = interface;
  PISystemBackdropOverrides = ^ISystemBackdropOverrides;

  // Microsoft.UI.Xaml.Media.IThemeShadow
  IThemeShadow = interface;
  PIThemeShadow = ^IThemeShadow;

  // Microsoft.UI.Xaml.Media.IThemeShadowFactory
  IThemeShadowFactory = interface;
  PIThemeShadowFactory = ^IThemeShadowFactory;

  // Microsoft.UI.Xaml.Media.ITileBrush
  ITileBrush = interface;
  PITileBrush = ^ITileBrush;

  // Microsoft.UI.Xaml.Media.ITileBrushFactory
  ITileBrushFactory = interface;
  PITileBrushFactory = ^ITileBrushFactory;

  // Microsoft.UI.Xaml.Media.ITileBrushStatics
  ITileBrushStatics = interface;
  PITileBrushStatics = ^ITileBrushStatics;

  // Microsoft.UI.Xaml.Media.ITransformFactory
  ITransformFactory = interface;
  PITransformFactory = ^ITransformFactory;

  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterator_1__ITransform = interface;
  PIIterator_1__ITransform = ^IIterator_1__ITransform;

  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterable_1__ITransform = interface;
  PIIterable_1__ITransform = ^IIterable_1__ITransform;

  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.ITransform>
  IVectorView_1__ITransform = interface;
  PIVectorView_1__ITransform = ^IVectorView_1__ITransform;

  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.ITransform>
  IVector_1__ITransform = interface;
  PIVector_1__ITransform = ^IVector_1__ITransform;

  // Microsoft.UI.Xaml.Media.ITransformGroup
  ITransformGroup = interface;
  PITransformGroup = ^ITransformGroup;

  // Microsoft.UI.Xaml.Media.ITransformGroupStatics
  ITransformGroupStatics = interface;
  PITransformGroupStatics = ^ITransformGroupStatics;

  // Microsoft.UI.Xaml.Media.ITranslateTransform
  ITranslateTransform = interface;
  PITranslateTransform = ^ITranslateTransform;

  // Microsoft.UI.Xaml.Media.ITranslateTransformStatics
  ITranslateTransformStatics = interface;
  PITranslateTransformStatics = ^ITranslateTransformStatics;

  // Microsoft.UI.Xaml.Media.IVisualTreeHelper
  IVisualTreeHelper = interface;
  PIVisualTreeHelper = ^IVisualTreeHelper;

  // Microsoft.UI.Xaml.Media.IVisualTreeHelperStatics
  IVisualTreeHelperStatics = interface;
  PIVisualTreeHelperStatics = ^IVisualTreeHelperStatics;

  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBase
  IXamlCompositionBrushBase = interface;
  PIXamlCompositionBrushBase = ^IXamlCompositionBrushBase;

  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseFactory
  IXamlCompositionBrushBaseFactory = interface;
  PIXamlCompositionBrushBaseFactory = ^IXamlCompositionBrushBaseFactory;

  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseOverrides
  IXamlCompositionBrushBaseOverrides = interface;
  PIXamlCompositionBrushBaseOverrides = ^IXamlCompositionBrushBaseOverrides;

  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseProtected
  IXamlCompositionBrushBaseProtected = interface;
  PIXamlCompositionBrushBaseProtected = ^IXamlCompositionBrushBaseProtected;

  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseStatics
  IXamlCompositionBrushBaseStatics = interface;
  PIXamlCompositionBrushBaseStatics = ^IXamlCompositionBrushBaseStatics;

  // Microsoft.UI.Xaml.Media.IXamlLightFactory
  IXamlLightFactory = interface;
  PIXamlLightFactory = ^IXamlLightFactory;

  // Microsoft.UI.Xaml.Media.IXamlLightOverrides
  IXamlLightOverrides = interface;
  PIXamlLightOverrides = ^IXamlLightOverrides;

  // Microsoft.UI.Xaml.Media.IXamlLightProtected
  IXamlLightProtected = interface;
  PIXamlLightProtected = ^IXamlLightProtected;

  // Microsoft.UI.Xaml.Media.IXamlLightStatics
  IXamlLightStatics = interface;
  PIXamlLightStatics = ^IXamlLightStatics;

  // Microsoft.UI.Xaml.Media.Imaging.IBitmapImageFactory
  Imaging_IBitmapImageFactory = interface;
  PImaging_IBitmapImageFactory = ^Imaging_IBitmapImageFactory;

  // Microsoft.UI.Xaml.Media.Imaging.IBitmapImageStatics
  Imaging_IBitmapImageStatics = interface;
  PImaging_IBitmapImageStatics = ^Imaging_IBitmapImageStatics;

  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSource
  Imaging_IBitmapSource = interface;
  PImaging_IBitmapSource = ^Imaging_IBitmapSource;

  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceFactory
  Imaging_IBitmapSourceFactory = interface;
  PImaging_IBitmapSourceFactory = ^Imaging_IBitmapSourceFactory;

  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceStatics
  Imaging_IBitmapSourceStatics = interface;
  PImaging_IBitmapSourceStatics = ^Imaging_IBitmapSourceStatics;

  // Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmap
  Imaging_IRenderTargetBitmap = interface;
  PImaging_IRenderTargetBitmap = ^Imaging_IRenderTargetBitmap;

  // Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmapStatics
  Imaging_IRenderTargetBitmapStatics = interface;
  PImaging_IRenderTargetBitmapStatics = ^Imaging_IRenderTargetBitmapStatics;

  // Microsoft.UI.Xaml.Media.Imaging.ISoftwareBitmapSource
  Imaging_ISoftwareBitmapSource = interface;
  PImaging_ISoftwareBitmapSource = ^Imaging_ISoftwareBitmapSource;

  // Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSource
  Imaging_ISurfaceImageSource = interface;
  PImaging_ISurfaceImageSource = ^Imaging_ISurfaceImageSource;

  // Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSourceFactory
  Imaging_ISurfaceImageSourceFactory = interface;
  PImaging_ISurfaceImageSourceFactory = ^Imaging_ISurfaceImageSourceFactory;

  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs
  Imaging_ISvgImageSourceOpenedEventArgs = interface;
  PImaging_ISvgImageSourceOpenedEventArgs = ^Imaging_ISvgImageSourceOpenedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs = interface;
  PTypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs = ^TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs;

  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs
  Imaging_ISvgImageSourceFailedEventArgs = interface;
  PImaging_ISvgImageSourceFailedEventArgs = ^Imaging_ISvgImageSourceFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs = interface;
  PTypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs = ^TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus = interface;
  PAsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus = ^AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  IAsyncOperation_1__Imaging_SvgImageSourceLoadStatus = interface;
  PIAsyncOperation_1__Imaging_SvgImageSourceLoadStatus = ^IAsyncOperation_1__Imaging_SvgImageSourceLoadStatus;

  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource
  Imaging_ISvgImageSource = interface;
  PImaging_ISvgImageSource = ^Imaging_ISvgImageSource;

  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFactory
  Imaging_ISvgImageSourceFactory = interface;
  PImaging_ISvgImageSourceFactory = ^Imaging_ISvgImageSourceFactory;

  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceStatics
  Imaging_ISvgImageSourceStatics = interface;
  PImaging_ISvgImageSourceStatics = ^Imaging_ISvgImageSourceStatics;

  // Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource
  Imaging_IVirtualSurfaceImageSource = interface;
  PImaging_IVirtualSurfaceImageSource = ^Imaging_IVirtualSurfaceImageSource;

  // Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory
  Imaging_IVirtualSurfaceImageSourceFactory = interface;
  PImaging_IVirtualSurfaceImageSourceFactory = ^Imaging_IVirtualSurfaceImageSourceFactory;

  // Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmap
  Imaging_IWriteableBitmap = interface;
  PImaging_IWriteableBitmap = ^Imaging_IWriteableBitmap;

  // Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmapFactory
  Imaging_IWriteableBitmapFactory = interface;
  PImaging_IWriteableBitmapFactory = ^Imaging_IWriteableBitmapFactory;

  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask
  Imaging_IXamlRenderingBackgroundTask = interface;
  PImaging_IXamlRenderingBackgroundTask = ^Imaging_IXamlRenderingBackgroundTask;

  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskFactory
  Imaging_IXamlRenderingBackgroundTaskFactory = interface;
  PImaging_IXamlRenderingBackgroundTaskFactory = ^Imaging_IXamlRenderingBackgroundTaskFactory;

  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskOverrides
  Imaging_IXamlRenderingBackgroundTaskOverrides = interface;
  PImaging_IXamlRenderingBackgroundTaskOverrides = ^Imaging_IXamlRenderingBackgroundTaskOverrides;

  // Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3D
  Media3D_ICompositeTransform3D = interface;
  PMedia3D_ICompositeTransform3D = ^Media3D_ICompositeTransform3D;

  // Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3DStatics
  Media3D_ICompositeTransform3DStatics = interface;
  PMedia3D_ICompositeTransform3DStatics = ^Media3D_ICompositeTransform3DStatics;

  // Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelper
  Media3D_IMatrix3DHelper = interface;
  PMedia3D_IMatrix3DHelper = ^Media3D_IMatrix3DHelper;

  // Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelperStatics
  Media3D_IMatrix3DHelperStatics = interface;
  PMedia3D_IMatrix3DHelperStatics = ^Media3D_IMatrix3DHelperStatics;

  // Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3D
  Media3D_IPerspectiveTransform3D = interface;
  PMedia3D_IPerspectiveTransform3D = ^Media3D_IPerspectiveTransform3D;

  // Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3DStatics
  Media3D_IPerspectiveTransform3DStatics = interface;
  PMedia3D_IPerspectiveTransform3DStatics = ^Media3D_IPerspectiveTransform3DStatics;

  // Microsoft.UI.Xaml.Media.Media3D.ITransform3DFactory
  Media3D_ITransform3DFactory = interface;
  PMedia3D_ITransform3DFactory = ^Media3D_ITransform3DFactory;

  // Microsoft.UI.Xaml.Media Enums

  // Microsoft.UI.Xaml.Media.AlignmentX
  AlignmentX = (
    Left = 0,
    Center = 1,
    Right = 2
  );
  PAlignmentX = ^AlignmentX;

  // Microsoft.UI.Xaml.Media.AlignmentY
  AlignmentY = (
    Top = 0,
    Center = 1,
    Bottom = 2
  );
  PAlignmentY = ^AlignmentY;

  // Microsoft.UI.Xaml.Media.Animation.ClockState
  Animation_ClockState = (
    Active = 0,
    Filling = 1,
    Stopped = 2
  );
  PAnimation_ClockState = ^Animation_ClockState;

  // Microsoft.UI.Xaml.Media.Animation.EasingMode
  Animation_EasingMode = (
    EaseOut = 0,
    EaseIn = 1,
    EaseInOut = 2
  );
  PAnimation_EasingMode = ^Animation_EasingMode;

  // Microsoft.UI.Xaml.Media.Animation.FillBehavior
  Animation_FillBehavior = (
    HoldEnd = 0,
    Stop = 1
  );
  PAnimation_FillBehavior = ^Animation_FillBehavior;

  // Microsoft.UI.Xaml.Media.Animation.RepeatBehaviorType
  Animation_RepeatBehaviorType = (
    Count = 0,
    Duration = 1,
    Forever = 2
  );
  PAnimation_RepeatBehaviorType = ^Animation_RepeatBehaviorType;

  // Microsoft.UI.Xaml.Media.Animation.SlideNavigationTransitionEffect
  Animation_SlideNavigationTransitionEffect = (
    FromBottom = 0,
    FromLeft = 1,
    FromRight = 2
  );
  PAnimation_SlideNavigationTransitionEffect = ^Animation_SlideNavigationTransitionEffect;

  // Microsoft.UI.Xaml.Media.BrushMappingMode
  BrushMappingMode = (
    Absolute = 0,
    RelativeToBoundingBox = 1
  );
  PBrushMappingMode = ^BrushMappingMode;

  // Microsoft.UI.Xaml.Media.ColorInterpolationMode
  ColorInterpolationMode = (
    ScRgbLinearInterpolation = 0,
    SRgbLinearInterpolation = 1
  );
  PColorInterpolationMode = ^ColorInterpolationMode;

  // Microsoft.UI.Xaml.Media.FillRule
  FillRule = (
    EvenOdd = 0,
    Nonzero = 1
  );
  PFillRule = ^FillRule;

  // Microsoft.UI.Xaml.Media.GradientSpreadMethod
  GradientSpreadMethod = (
    Pad = 0,
    Reflect = 1,
    &Repeat = 2
  );
  PGradientSpreadMethod = ^GradientSpreadMethod;

  // Microsoft.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus
  Imaging_SvgImageSourceLoadStatus = (
    Success = 0,
    NetworkError = 1,
    InvalidFormat = 2,
    Other = 3
  );
  PImaging_SvgImageSourceLoadStatus = ^Imaging_SvgImageSourceLoadStatus;

  // Microsoft.UI.Xaml.Media.LoadedImageSourceLoadStatus
  LoadedImageSourceLoadStatus = (
    Success = 0,
    NetworkError = 1,
    InvalidFormat = 2,
    Other = 3
  );
  PLoadedImageSourceLoadStatus = ^LoadedImageSourceLoadStatus;

  // Microsoft.UI.Xaml.Media.PenLineCap
  PenLineCap = (
    Flat = 0,
    Square = 1,
    Round = 2,
    Triangle = 3
  );
  PPenLineCap = ^PenLineCap;

  // Microsoft.UI.Xaml.Media.PenLineJoin
  PenLineJoin = (
    Miter = 0,
    Bevel = 1,
    Round = 2
  );
  PPenLineJoin = ^PenLineJoin;

  // Microsoft.UI.Xaml.Media.Stretch
  Stretch = (
    None = 0,
    Fill = 1,
    Uniform = 2,
    UniformToFill = 3
  );
  PStretch = ^Stretch;

  // Microsoft.UI.Xaml.Media.StyleSimulations
  StyleSimulations = (
    None = 0,
    BoldSimulation = 1,
    ItalicSimulation = 2,
    BoldItalicSimulation = 3
  );
  PStyleSimulations = ^StyleSimulations;

  // Microsoft.UI.Xaml.Media.SweepDirection
  SweepDirection = (
    Counterclockwise = 0,
    Clockwise = 1
  );
  PSweepDirection = ^SweepDirection;

  // Microsoft.UI.Xaml.Media Records

  // Microsoft.UI.Xaml.Media.Animation.KeyTime
  Animation_KeyTime = record
    TimeSpan: TimeSpan;
  end;
  PAnimation_KeyTime = ^Animation_KeyTime;

  // Microsoft.UI.Xaml.Media.Animation.RepeatBehavior
  Animation_RepeatBehavior = record
    Count: Double;
    Duration: TimeSpan;
    &Type: Animation_RepeatBehaviorType;
  end;
  PAnimation_RepeatBehavior = ^Animation_RepeatBehavior;

  // Microsoft.UI.Xaml.Media.Matrix
  Matrix = record
    M11: Double;
    M12: Double;
    M21: Double;
    M22: Double;
    OffsetX: Double;
    OffsetY: Double;
  end;
  PMatrix = ^Matrix;

  // Microsoft.UI.Xaml.Media.Media3D.Matrix3D
  Media3D_Matrix3D = record
    M11: Double;
    M12: Double;
    M13: Double;
    M14: Double;
    M21: Double;
    M22: Double;
    M23: Double;
    M24: Double;
    M31: Double;
    M32: Double;
    M33: Double;
    M34: Double;
    OffsetX: Double;
    OffsetY: Double;
    OffsetZ: Double;
    M44: Double;
  end;
  PMedia3D_Matrix3D = ^Media3D_Matrix3D;

  // Microsoft.UI.Xaml.Media Interfaces

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterator_1__Animation_ITransition_Base = interface(IInspectable)
  ['{5CFD74C7-6E4A-5C7D-9370-2F81C62274F5}']
    function get_Current: Animation_ITransition; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_ITransition): Cardinal; safecall;
    property Current: Animation_ITransition read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterator_1__Animation_ITransition = interface(IIterator_1__Animation_ITransition_Base)
  ['{02281CF3-AB34-5273-BC33-001B7D80B6E0}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterable_1__Animation_ITransition_Base = interface(IInspectable)
  ['{3CCACCB1-02DC-5456-922A-A264C80105B8}']
    function First: IIterator_1__Animation_ITransition; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITransition>
  IIterable_1__Animation_ITransition = interface(IIterable_1__Animation_ITransition_Base)
  ['{66F455A4-FC4D-571B-8B24-F8E1869F8237}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterator_1__IXamlLight_Base = interface(IInspectable)
  ['{E75863B3-0B25-5C28-86C8-9EC49F76D468}']
    function get_Current: IXamlLight; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIXamlLight): Cardinal; safecall;
    property Current: IXamlLight read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterator_1__IXamlLight = interface(IIterator_1__IXamlLight_Base)
  ['{B11E1AA6-30B9-5A16-98A4-198FD7A41839}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterable_1__IXamlLight_Base = interface(IInspectable)
  ['{C166D8CA-B148-5241-BED5-13003063BD3E}']
    function First: IIterator_1__IXamlLight; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IXamlLight>
  IIterable_1__IXamlLight = interface(IIterable_1__IXamlLight_Base)
  ['{7E8CCC2A-D9AE-57CE-9225-44ACD3E4C641}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IFontFamily
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_FontFamily)]
  IFontFamily = interface(IInspectable)
  ['{18FA5BC1-7294-527C-BB02-B213E0B3A2A3}']
    function get_Source: HSTRING; safecall;
    property Source: HSTRING read get_Source;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IImageSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ImageSource)]
  IImageSource = interface(IInspectable)
  ['{6C2038F6-D6D5-55E9-9B9E-082F12DBFF60}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISolidColorBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SolidColorBrush)]
  ISolidColorBrush = interface(IInspectable)
  ['{B3865C31-37C8-55C1-8A72-D41C67642E2A}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    property Color_: Color read get_Color write put_Color;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IImageBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ImageBrush)]
  IImageBrush = interface(IInspectable)
  ['{EDCD91A3-A868-5BA6-9489-5B12B4C29D85}']
    function get_ImageSource: IImageSource; safecall;
    procedure put_ImageSource(value: IImageSource); safecall;
    function add_ImageFailed(handler: ExceptionRoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ImageFailed(token: EventRegistrationToken); safecall;
    function add_ImageOpened(handler: RoutedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ImageOpened(token: EventRegistrationToken); safecall;
    property ImageSource: IImageSource read get_ImageSource write put_ImageSource;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeometry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Geometry)]
  IGeometry = interface(IInspectable)
  ['{DC102DCC-3BE2-5414-8599-94B6E76EF39B}']
    function get_Transform: ITransform; safecall;
    procedure put_Transform(value: ITransform); safecall;
    function get_Bounds: TRectF; safecall;
    property Bounds: TRectF read get_Bounds;
    property Transform: ITransform read get_Transform write put_Transform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ITimeline
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Timeline)]
  Animation_ITimeline = interface(IInspectable)
  ['{D0F9B330-CC2A-5B05-9786-2DA4C6584581}']
    function get_AutoReverse: Boolean; safecall;
    procedure put_AutoReverse(value: Boolean); safecall;
    function get_BeginTime: IReference_1__TimeSpan; safecall;
    procedure put_BeginTime(value: IReference_1__TimeSpan); safecall;
    function get_Duration: Duration; safecall;
    procedure put_Duration(value: Duration); safecall;
    function get_SpeedRatio: Double; safecall;
    procedure put_SpeedRatio(value: Double); safecall;
    function get_FillBehavior: Animation_FillBehavior; safecall;
    procedure put_FillBehavior(value: Animation_FillBehavior); safecall;
    function get_RepeatBehavior: Animation_RepeatBehavior; safecall;
    procedure put_RepeatBehavior(value: Animation_RepeatBehavior); safecall;
    function add_Completed(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    property AutoReverse: Boolean read get_AutoReverse write put_AutoReverse;
    property BeginTime: IReference_1__TimeSpan read get_BeginTime write put_BeginTime;
    property Duration_: Duration read get_Duration write put_Duration;
    property FillBehavior: Animation_FillBehavior read get_FillBehavior write put_FillBehavior;
    property RepeatBehavior: Animation_RepeatBehavior read get_RepeatBehavior write put_RepeatBehavior;
    property SpeedRatio: Double read get_SpeedRatio write put_SpeedRatio;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterator_1__Animation_ITimeline_Base = interface(IInspectable)
  ['{85301B8E-275F-57F3-9344-CF0441C737AA}']
    function get_Current: Animation_ITimeline; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_ITimeline): Cardinal; safecall;
    property Current: Animation_ITimeline read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterator_1__Animation_ITimeline = interface(IIterator_1__Animation_ITimeline_Base)
  ['{84F9EB13-2949-5109-8B5C-D46CC99B0237}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterable_1__Animation_ITimeline_Base = interface(IInspectable)
  ['{89F87B00-A552-5E0A-9980-CD6A5370E20C}']
    function First: IIterator_1__Animation_ITimeline; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IIterable_1__Animation_ITimeline = interface(IIterable_1__Animation_ITimeline_Base)
  ['{12037BE3-350D-57CE-A50C-A79B2D80CF00}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IVectorView_1__Animation_ITimeline = interface(IInspectable)
  ['{598B17CF-D4D9-56D5-AFD7-8CE946F6585F}']
    function GetAt(index: Cardinal): Animation_ITimeline; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_ITimeline; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_ITimeline): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IVector_1__Animation_ITimeline_Base = interface(IInspectable)
  ['{4107A612-6757-5552-A48B-2E3093230C49}']
    function GetAt(index: Cardinal): Animation_ITimeline; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_ITimeline; safecall;
    function IndexOf(value: Animation_ITimeline; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_ITimeline); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_ITimeline); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_ITimeline); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_ITimeline): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_ITimeline); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.ITimeline>
  IVector_1__Animation_ITimeline = interface(IVector_1__Animation_ITimeline_Base)
  ['{C02798DF-17BF-57AC-9291-FB420A86D033}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IStoryboard
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Storyboard)]
  Animation_IStoryboard = interface(IInspectable)
  ['{04D41BB3-8721-519E-8E53-FB8B34920305}']
    function get_Children: IVector_1__Animation_ITimeline; safecall;
    procedure Seek(offset: TimeSpan); safecall;
    procedure Stop; safecall;
    procedure &Begin; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    function GetCurrentState: Animation_ClockState; safecall;
    function GetCurrentTime: TimeSpan; safecall;
    procedure SeekAlignedToLastTick(offset: TimeSpan); safecall;
    procedure SkipToFill; safecall;
    property Children: IVector_1__Animation_ITimeline read get_Children;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingFunctionBase)]
  Animation_IEasingFunctionBase = interface(IInspectable)
  ['{4FAB519A-A93D-5D28-AF18-84532BD32EFE}']
    function get_EasingMode: Animation_EasingMode; safecall;
    procedure put_EasingMode(value: Animation_EasingMode); safecall;
    function Ease(normalizedTime: Double): Double; safecall;
    property EasingMode: Animation_EasingMode read get_EasingMode write put_EasingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISystemBackdrop
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SystemBackdrop)]
  ISystemBackdrop = interface(IInspectable)
  ['{5AEED5C4-37AC-5852-B73F-1B76EBC3205F}']
    function GetDefaultSystemBackdropConfiguration(target: ICompositionSupportsSystemBackdrop; xamlRoot: IXamlRoot): SystemBackdrops_ISystemBackdropConfiguration; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IAddDeleteThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_AddDeleteThemeTransition)]
  Animation_IAddDeleteThemeTransition = interface(IInspectable)
  ['{3728595E-0EA2-524B-9348-86CFB860A0FF}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBackEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BackEase)]
  Animation_IBackEase = interface(IInspectable)
  ['{1775BD43-1939-57CB-8C31-CD7590EC9543}']
    function get_Amplitude: Double; safecall;
    procedure put_Amplitude(value: Double); safecall;
    property Amplitude: Double read get_Amplitude write put_Amplitude;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBackEaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BackEase)]
  Animation_IBackEaseStatics = interface(IInspectable)
  ['{1EAD2EF9-7901-542D-AE08-7B5937B32EF0}']
    function get_AmplitudeProperty: IDependencyProperty; safecall;
    property AmplitudeProperty: IDependencyProperty read get_AmplitudeProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfiguration
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BasicConnectedAnimationConfiguration)]
  Animation_IBasicConnectedAnimationConfiguration = interface(IInspectable)
  ['{7FF18AFE-91E8-52FA-A1C1-7B2C1A140118}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfigurationFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BasicConnectedAnimationConfiguration)]
  Animation_IBasicConnectedAnimationConfigurationFactory = interface(IInspectable)
  ['{2D156A02-0FB5-5AD1-AF9B-BC9C2720FECB}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IBasicConnectedAnimationConfiguration; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBeginStoryboard
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BeginStoryboard)]
  Animation_IBeginStoryboard = interface(IInspectable)
  ['{BB364720-EE5A-5B32-91E2-62589729FD3A}']
    function get_Storyboard: Animation_IStoryboard; safecall;
    procedure put_Storyboard(value: Animation_IStoryboard); safecall;
    property Storyboard: Animation_IStoryboard read get_Storyboard write put_Storyboard;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBeginStoryboardStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BeginStoryboard)]
  Animation_IBeginStoryboardStatics = interface(IInspectable)
  ['{4D5FDBEB-6B0E-5A8F-A8F0-01F438DF8FB2}']
    function get_StoryboardProperty: IDependencyProperty; safecall;
    property StoryboardProperty: IDependencyProperty read get_StoryboardProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBounceEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BounceEase)]
  Animation_IBounceEase = interface(IInspectable)
  ['{C138BFFF-87C8-5C60-B280-682A499C58C3}']
    function get_Bounces: Integer; safecall;
    procedure put_Bounces(value: Integer); safecall;
    function get_Bounciness: Double; safecall;
    procedure put_Bounciness(value: Double); safecall;
    property Bounces: Integer read get_Bounces write put_Bounces;
    property Bounciness: Double read get_Bounciness write put_Bounciness;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IBounceEaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_BounceEase)]
  Animation_IBounceEaseStatics = interface(IInspectable)
  ['{D7716B38-C705-5093-96D6-735C13105A30}']
    function get_BouncesProperty: IDependencyProperty; safecall;
    function get_BouncinessProperty: IDependencyProperty; safecall;
    property BouncesProperty: IDependencyProperty read get_BouncesProperty;
    property BouncinessProperty: IDependencyProperty read get_BouncinessProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ICircleEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_CircleEase)]
  Animation_ICircleEase = interface(IInspectable)
  ['{88209080-2929-5924-9B52-F95196568713}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorAnimation)]
  Animation_IColorAnimation = interface(IInspectable)
  ['{6DF862D2-65F2-53A8-8B1B-1B6C1763C175}']
    function get_From: IReference_1__Color; safecall;
    procedure put_From(value: IReference_1__Color); safecall;
    function get_To: IReference_1__Color; safecall;
    procedure put_To(value: IReference_1__Color); safecall;
    function get_By: IReference_1__Color; safecall;
    procedure put_By(value: IReference_1__Color); safecall;
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property By: IReference_1__Color read get_By write put_By;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property From: IReference_1__Color read get_From write put_From;
    property &To: IReference_1__Color read get_To write put_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorAnimation)]
  Animation_IColorAnimationStatics = interface(IInspectable)
  ['{99AEBE0F-928E-52CB-842F-F43FE660FF06}']
    function get_FromProperty: IDependencyProperty; safecall;
    function get_ToProperty: IDependencyProperty; safecall;
    function get_ByProperty: IDependencyProperty; safecall;
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property ByProperty: IDependencyProperty read get_ByProperty;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    property FromProperty: IDependencyProperty read get_FromProperty;
    property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorKeyFrame)]
  Animation_IColorKeyFrame = interface(IInspectable)
  ['{02848C7E-C772-5F66-842B-FD494D0DA669}']
    function get_Value: Color; safecall;
    procedure put_Value(value: Color); safecall;
    function get_KeyTime: Animation_KeyTime; safecall;
    procedure put_KeyTime(value: Animation_KeyTime); safecall;
    property KeyTime: Animation_KeyTime read get_KeyTime write put_KeyTime;
    property Value: Color read get_Value write put_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterator_1__Animation_IColorKeyFrame_Base = interface(IInspectable)
  ['{2B8A6B92-F1E3-5BC4-96D2-E4892D5CD93A}']
    function get_Current: Animation_IColorKeyFrame; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_IColorKeyFrame): Cardinal; safecall;
    property Current: Animation_IColorKeyFrame read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterator_1__Animation_IColorKeyFrame = interface(IIterator_1__Animation_IColorKeyFrame_Base)
  ['{92019B8A-2D30-51C4-990D-C93EE20547F1}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterable_1__Animation_IColorKeyFrame_Base = interface(IInspectable)
  ['{FE553349-5AC6-5F21-8DFF-2B2403825107}']
    function First: IIterator_1__Animation_IColorKeyFrame; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IIterable_1__Animation_IColorKeyFrame = interface(IIterable_1__Animation_IColorKeyFrame_Base)
  ['{5108B291-4E9A-50E4-AA3F-8544BAB555C0}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IVectorView_1__Animation_IColorKeyFrame = interface(IInspectable)
  ['{7443CA3E-9E89-5408-8730-8AE7C848B562}']
    function GetAt(index: Cardinal): Animation_IColorKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_IColorKeyFrame; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IColorKeyFrame): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IVector_1__Animation_IColorKeyFrame_Base = interface(IInspectable)
  ['{8E452000-D3AF-506F-9B09-3161753DFC94}']
    function GetAt(index: Cardinal): Animation_IColorKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_IColorKeyFrame; safecall;
    function IndexOf(value: Animation_IColorKeyFrame; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_IColorKeyFrame); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_IColorKeyFrame); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_IColorKeyFrame); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IColorKeyFrame): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_IColorKeyFrame); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame>
  IVector_1__Animation_IColorKeyFrame = interface(IVector_1__Animation_IColorKeyFrame_Base)
  ['{4C26A196-4D74-5C3C-9213-AB3BD4696771}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorAnimationUsingKeyFrames)]
  Animation_IColorAnimationUsingKeyFrames = interface(IInspectable)
  ['{96F28C97-67EB-5393-8E37-A81D8FDA18B3}']
    function get_KeyFrames: IVector_1__Animation_IColorKeyFrame; safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property KeyFrames: IVector_1__Animation_IColorKeyFrame read get_KeyFrames;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFramesStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorAnimationUsingKeyFrames)]
  Animation_IColorAnimationUsingKeyFramesStatics = interface(IInspectable)
  ['{5B0F4840-0EF7-5AD7-A8F2-D49424ED906F}']
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorKeyFrame)]
  Animation_IColorKeyFrameFactory = interface(IInspectable)
  ['{A82CC182-9D80-508C-B962-D74225587200}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IColorKeyFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ColorKeyFrame)]
  Animation_IColorKeyFrameStatics = interface(IInspectable)
  ['{B62FDD68-15C7-5C6C-A4FA-0CEE10E04556}']
    function get_ValueProperty: IDependencyProperty; safecall;
    function get_KeyTimeProperty: IDependencyProperty; safecall;
    property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    property ValueProperty: IDependencyProperty read get_ValueProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_CommonNavigationTransitionInfo)]
  Animation_ICommonNavigationTransitionInfo = interface(IInspectable)
  ['{B21CC95F-9E3D-540A-B35A-17B99DC41B1E}']
    function get_IsStaggeringEnabled: Boolean; safecall;
    procedure put_IsStaggeringEnabled(value: Boolean); safecall;
    property IsStaggeringEnabled: Boolean read get_IsStaggeringEnabled write put_IsStaggeringEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfoStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_CommonNavigationTransitionInfo)]
  Animation_ICommonNavigationTransitionInfoStatics = interface(IInspectable)
  ['{20020BE1-C1BA-59F5-997A-C04F5E3833B0}']
    function get_IsStaggeringEnabledProperty: IDependencyProperty; safecall;
    function get_IsStaggerElementProperty: IDependencyProperty; safecall;
    function GetIsStaggerElement(element: IUIElement): Boolean; safecall;
    procedure SetIsStaggerElement(element: IUIElement; value: Boolean); safecall;
    property IsStaggerElementProperty: IDependencyProperty read get_IsStaggerElementProperty;
    property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfigurationFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ConnectedAnimationConfiguration)]
  Animation_IConnectedAnimationConfigurationFactory = interface(IInspectable)
  ['{71008845-4A12-5A1A-969C-4152B5174922}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationService
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ConnectedAnimationService)]
  Animation_IConnectedAnimationService = interface(IInspectable)
  ['{85F72163-C3C8-586A-91FE-3E0315A3A4FC}']
    function get_DefaultDuration: TimeSpan; safecall;
    procedure put_DefaultDuration(value: TimeSpan); safecall;
    function get_DefaultEasingFunction: ICompositionEasingFunction; safecall;
    procedure put_DefaultEasingFunction(value: ICompositionEasingFunction); safecall;
    function PrepareToAnimate(key: HSTRING; source: IUIElement): Animation_IConnectedAnimation; safecall;
    function GetAnimation(key: HSTRING): Animation_IConnectedAnimation; safecall;
    property DefaultDuration: TimeSpan read get_DefaultDuration write put_DefaultDuration;
    property DefaultEasingFunction: ICompositionEasingFunction read get_DefaultEasingFunction write put_DefaultEasingFunction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationServiceStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ConnectedAnimationService)]
  Animation_IConnectedAnimationServiceStatics = interface(IInspectable)
  ['{F30AD68D-3426-5564-92C6-288B819E652A}']
    function GetForCurrentView: Animation_IConnectedAnimationService; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IContentThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ContentThemeTransition)]
  Animation_IContentThemeTransition = interface(IInspectable)
  ['{DFF47071-CC51-556C-A3FE-8BBB4CBA6195}']
    function get_HorizontalOffset: Double; safecall;
    procedure put_HorizontalOffset(value: Double); safecall;
    function get_VerticalOffset: Double; safecall;
    procedure put_VerticalOffset(value: Double); safecall;
    property HorizontalOffset: Double read get_HorizontalOffset write put_HorizontalOffset;
    property VerticalOffset: Double read get_VerticalOffset write put_VerticalOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IContentThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ContentThemeTransition)]
  Animation_IContentThemeTransitionStatics = interface(IInspectable)
  ['{95CDA8B1-6667-56E3-BE40-866EEF53663C}']
    function get_HorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_VerticalOffsetProperty: IDependencyProperty; safecall;
    property HorizontalOffsetProperty: IDependencyProperty read get_HorizontalOffsetProperty;
    property VerticalOffsetProperty: IDependencyProperty read get_VerticalOffsetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ContinuumNavigationTransitionInfo)]
  Animation_IContinuumNavigationTransitionInfo = interface(IInspectable)
  ['{C55DA70F-FF2A-5FC3-81C5-9670F4D78752}']
    function get_ExitElement: IUIElement; safecall;
    procedure put_ExitElement(value: IUIElement); safecall;
    property ExitElement: IUIElement read get_ExitElement write put_ExitElement;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfoStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ContinuumNavigationTransitionInfo)]
  Animation_IContinuumNavigationTransitionInfoStatics = interface(IInspectable)
  ['{CA9006FD-F513-5F34-AD7F-49F9D7A99432}']
    function get_ExitElementProperty: IDependencyProperty; safecall;
    function get_IsEntranceElementProperty: IDependencyProperty; safecall;
    function GetIsEntranceElement(element: IUIElement): Boolean; safecall;
    procedure SetIsEntranceElement(element: IUIElement; value: Boolean); safecall;
    function get_IsExitElementProperty: IDependencyProperty; safecall;
    function GetIsExitElement(element: IUIElement): Boolean; safecall;
    procedure SetIsExitElement(element: IUIElement; value: Boolean); safecall;
    function get_ExitElementContainerProperty: IDependencyProperty; safecall;
    function GetExitElementContainer(element: IListViewBase): Boolean; safecall;
    procedure SetExitElementContainer(element: IListViewBase; value: Boolean); safecall;
    property ExitElementContainerProperty: IDependencyProperty read get_ExitElementContainerProperty;
    property ExitElementProperty: IDependencyProperty read get_ExitElementProperty;
    property IsEntranceElementProperty: IDependencyProperty read get_IsEntranceElementProperty;
    property IsExitElementProperty: IDependencyProperty read get_IsExitElementProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ICubicEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_CubicEase)]
  Animation_ICubicEase = interface(IInspectable)
  ['{01A218B4-EB7E-54F9-BFB6-C6EE128013D2}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfiguration
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DirectConnectedAnimationConfiguration)]
  Animation_IDirectConnectedAnimationConfiguration = interface(IInspectable)
  ['{44F192EB-CC11-545E-8FA2-1F0EC9C4438A}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfigurationFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DirectConnectedAnimationConfiguration)]
  Animation_IDirectConnectedAnimationConfigurationFactory = interface(IInspectable)
  ['{604ABA9B-4EB8-5310-91DC-30962E25AB00}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDirectConnectedAnimationConfiguration; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DiscreteColorKeyFrame)]
  Animation_IDiscreteColorKeyFrame = interface(IInspectable)
  ['{9B3D88A7-31D3-5912-8646-641A8A565CA1}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DiscreteDoubleKeyFrame)]
  Animation_IDiscreteDoubleKeyFrame = interface(IInspectable)
  ['{EC16A555-C083-5A18-805B-A14B90BC80E2}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DiscreteObjectKeyFrame)]
  Animation_IDiscreteObjectKeyFrame = interface(IInspectable)
  ['{542FA813-6892-559D-9F69-1F2AC666AF13}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDiscretePointKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DiscretePointKeyFrame)]
  Animation_IDiscretePointKeyFrame = interface(IInspectable)
  ['{2255A291-007E-57CE-AA53-97D1E4A0D7E2}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleAnimation)]
  Animation_IDoubleAnimation = interface(IInspectable)
  ['{651EC97E-E483-5985-AA0B-49CFB07432DD}']
    function get_From: IReference_1__Double; safecall;
    procedure put_From(value: IReference_1__Double); safecall;
    function get_To: IReference_1__Double; safecall;
    procedure put_To(value: IReference_1__Double); safecall;
    function get_By: IReference_1__Double; safecall;
    procedure put_By(value: IReference_1__Double); safecall;
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property By: IReference_1__Double read get_By write put_By;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property From: IReference_1__Double read get_From write put_From;
    property &To: IReference_1__Double read get_To write put_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleAnimation)]
  Animation_IDoubleAnimationStatics = interface(IInspectable)
  ['{4E098387-ADC6-5549-AD21-633E4FA244C2}']
    function get_FromProperty: IDependencyProperty; safecall;
    function get_ToProperty: IDependencyProperty; safecall;
    function get_ByProperty: IDependencyProperty; safecall;
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property ByProperty: IDependencyProperty read get_ByProperty;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    property FromProperty: IDependencyProperty read get_FromProperty;
    property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleKeyFrame)]
  Animation_IDoubleKeyFrame = interface(IInspectable)
  ['{94C82AE6-CA62-5F52-934C-3E427E75D69A}']
    function get_Value: Double; safecall;
    procedure put_Value(value: Double); safecall;
    function get_KeyTime: Animation_KeyTime; safecall;
    procedure put_KeyTime(value: Animation_KeyTime); safecall;
    property KeyTime: Animation_KeyTime read get_KeyTime write put_KeyTime;
    property Value: Double read get_Value write put_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterator_1__Animation_IDoubleKeyFrame_Base = interface(IInspectable)
  ['{7B911C76-50E4-509F-98FA-D38B19F6E159}']
    function get_Current: Animation_IDoubleKeyFrame; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_IDoubleKeyFrame): Cardinal; safecall;
    property Current: Animation_IDoubleKeyFrame read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterator_1__Animation_IDoubleKeyFrame = interface(IIterator_1__Animation_IDoubleKeyFrame_Base)
  ['{2AF09879-2E3A-50B1-B694-F96C68FA323A}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterable_1__Animation_IDoubleKeyFrame_Base = interface(IInspectable)
  ['{BD454020-1887-58B8-B1B9-2753C42B6F48}']
    function First: IIterator_1__Animation_IDoubleKeyFrame; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IIterable_1__Animation_IDoubleKeyFrame = interface(IIterable_1__Animation_IDoubleKeyFrame_Base)
  ['{F3209033-DF98-534C-AEB4-87F1DFDE2AF8}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IVectorView_1__Animation_IDoubleKeyFrame = interface(IInspectable)
  ['{B0F78A83-A8D5-535E-9871-35D28F5BDF95}']
    function GetAt(index: Cardinal): Animation_IDoubleKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_IDoubleKeyFrame; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IDoubleKeyFrame): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IVector_1__Animation_IDoubleKeyFrame_Base = interface(IInspectable)
  ['{0FF0EAEE-9514-5010-9AC4-8F6AA6D294BC}']
    function GetAt(index: Cardinal): Animation_IDoubleKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_IDoubleKeyFrame; safecall;
    function IndexOf(value: Animation_IDoubleKeyFrame; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_IDoubleKeyFrame); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_IDoubleKeyFrame); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_IDoubleKeyFrame); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IDoubleKeyFrame): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_IDoubleKeyFrame); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame>
  IVector_1__Animation_IDoubleKeyFrame = interface(IVector_1__Animation_IDoubleKeyFrame_Base)
  ['{9D7B5AD0-E432-5FCC-B89B-57B70A6A6EBC}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleAnimationUsingKeyFrames)]
  Animation_IDoubleAnimationUsingKeyFrames = interface(IInspectable)
  ['{815437D5-63CF-54A5-AEA5-24B84708D12D}']
    function get_KeyFrames: IVector_1__Animation_IDoubleKeyFrame; safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property KeyFrames: IVector_1__Animation_IDoubleKeyFrame read get_KeyFrames;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFramesStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleAnimationUsingKeyFrames)]
  Animation_IDoubleAnimationUsingKeyFramesStatics = interface(IInspectable)
  ['{4C1C9BF1-3A03-5689-B18F-6C44251E13D9}']
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleKeyFrame)]
  Animation_IDoubleKeyFrameFactory = interface(IInspectable)
  ['{2D492CB3-F488-5D30-B00C-B6F2547D0EFE}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDoubleKeyFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DoubleKeyFrame)]
  Animation_IDoubleKeyFrameStatics = interface(IInspectable)
  ['{0E56914C-B430-538F-BB66-0B8E83AB3DB6}']
    function get_ValueProperty: IDependencyProperty; safecall;
    function get_KeyTimeProperty: IDependencyProperty; safecall;
    property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    property ValueProperty: IDependencyProperty read get_ValueProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DragItemThemeAnimation)]
  Animation_IDragItemThemeAnimation = interface(IInspectable)
  ['{648E690E-A2C0-58CA-B15D-DB6FCCC663F2}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DragItemThemeAnimation)]
  Animation_IDragItemThemeAnimationStatics = interface(IInspectable)
  ['{CDBDB41A-CE84-50A1-8B96-96599CD9619D}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DragOverThemeAnimation)]
  Animation_IDragOverThemeAnimation = interface(IInspectable)
  ['{633CD3C0-71AF-52FD-993E-504E3E6F56D4}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    function get_ToOffset: Double; safecall;
    procedure put_ToOffset(value: Double); safecall;
    function get_Direction: Primitives_AnimationDirection; safecall;
    procedure put_Direction(value: Primitives_AnimationDirection); safecall;
    property Direction: Primitives_AnimationDirection read get_Direction write put_Direction;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
    property ToOffset: Double read get_ToOffset write put_ToOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DragOverThemeAnimation)]
  Animation_IDragOverThemeAnimationStatics = interface(IInspectable)
  ['{8301AFD2-68B2-5C6C-AADF-9A98D620E8D2}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function get_ToOffsetProperty: IDependencyProperty; safecall;
    function get_DirectionProperty: IDependencyProperty; safecall;
    property DirectionProperty: IDependencyProperty read get_DirectionProperty;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    property ToOffsetProperty: IDependencyProperty read get_ToOffsetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DrillInNavigationTransitionInfo)]
  Animation_IDrillInNavigationTransitionInfo = interface(IInspectable)
  ['{5D5863D6-4BBF-5B30-94FA-034531CFA2AA}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DrillInThemeAnimation)]
  Animation_IDrillInThemeAnimation = interface(IInspectable)
  ['{097577E0-3027-5F24-AF8C-976D9FAED830}']
    function get_EntranceTargetName: HSTRING; safecall;
    procedure put_EntranceTargetName(value: HSTRING); safecall;
    function get_EntranceTarget: IDependencyObject; safecall;
    procedure put_EntranceTarget(value: IDependencyObject); safecall;
    function get_ExitTargetName: HSTRING; safecall;
    procedure put_ExitTargetName(value: HSTRING); safecall;
    function get_ExitTarget: IDependencyObject; safecall;
    procedure put_ExitTarget(value: IDependencyObject); safecall;
    property EntranceTarget: IDependencyObject read get_EntranceTarget write put_EntranceTarget;
    property EntranceTargetName: HSTRING read get_EntranceTargetName write put_EntranceTargetName;
    property ExitTarget: IDependencyObject read get_ExitTarget write put_ExitTarget;
    property ExitTargetName: HSTRING read get_ExitTargetName write put_ExitTargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DrillInThemeAnimation)]
  Animation_IDrillInThemeAnimationStatics = interface(IInspectable)
  ['{BA24258E-3A8E-5804-915A-7670893DBEA4}']
    function get_EntranceTargetNameProperty: IDependencyProperty; safecall;
    function get_EntranceTargetProperty: IDependencyProperty; safecall;
    function get_ExitTargetNameProperty: IDependencyProperty; safecall;
    function get_ExitTargetProperty: IDependencyProperty; safecall;
    property EntranceTargetNameProperty: IDependencyProperty read get_EntranceTargetNameProperty;
    property EntranceTargetProperty: IDependencyProperty read get_EntranceTargetProperty;
    property ExitTargetNameProperty: IDependencyProperty read get_ExitTargetNameProperty;
    property ExitTargetProperty: IDependencyProperty read get_ExitTargetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DrillOutThemeAnimation)]
  Animation_IDrillOutThemeAnimation = interface(IInspectable)
  ['{9A93B9CC-925F-525A-9EAC-55D39DB3D314}']
    function get_EntranceTargetName: HSTRING; safecall;
    procedure put_EntranceTargetName(value: HSTRING); safecall;
    function get_EntranceTarget: IDependencyObject; safecall;
    procedure put_EntranceTarget(value: IDependencyObject); safecall;
    function get_ExitTargetName: HSTRING; safecall;
    procedure put_ExitTargetName(value: HSTRING); safecall;
    function get_ExitTarget: IDependencyObject; safecall;
    procedure put_ExitTarget(value: IDependencyObject); safecall;
    property EntranceTarget: IDependencyObject read get_EntranceTarget write put_EntranceTarget;
    property EntranceTargetName: HSTRING read get_EntranceTargetName write put_EntranceTargetName;
    property ExitTarget: IDependencyObject read get_ExitTarget write put_ExitTarget;
    property ExitTargetName: HSTRING read get_ExitTargetName write put_ExitTargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DrillOutThemeAnimation)]
  Animation_IDrillOutThemeAnimationStatics = interface(IInspectable)
  ['{6EB9693B-C0D0-5BAE-9CD2-10D80B8D3867}']
    function get_EntranceTargetNameProperty: IDependencyProperty; safecall;
    function get_EntranceTargetProperty: IDependencyProperty; safecall;
    function get_ExitTargetNameProperty: IDependencyProperty; safecall;
    function get_ExitTargetProperty: IDependencyProperty; safecall;
    property EntranceTargetNameProperty: IDependencyProperty read get_EntranceTargetNameProperty;
    property EntranceTargetProperty: IDependencyProperty read get_EntranceTargetProperty;
    property ExitTargetNameProperty: IDependencyProperty read get_ExitTargetNameProperty;
    property ExitTargetProperty: IDependencyProperty read get_ExitTargetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DropTargetItemThemeAnimation)]
  Animation_IDropTargetItemThemeAnimation = interface(IInspectable)
  ['{B97F19C0-F1E2-5705-A252-2DB05D2E5A54}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_DropTargetItemThemeAnimation)]
  Animation_IDropTargetItemThemeAnimationStatics = interface(IInspectable)
  ['{A0CE9E16-AE12-55FC-A9E5-29DC94A713BD}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingColorKeyFrame)]
  Animation_IEasingColorKeyFrame = interface(IInspectable)
  ['{A137A710-DA3C-5426-A1A2-3A5A672A4264}']
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingColorKeyFrame)]
  Animation_IEasingColorKeyFrameStatics = interface(IInspectable)
  ['{C57818C0-3361-587D-B381-620B69251BCF}']
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingDoubleKeyFrame)]
  Animation_IEasingDoubleKeyFrame = interface(IInspectable)
  ['{935D9B7E-DA61-5BB2-A574-7D2E53B60561}']
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingDoubleKeyFrame)]
  Animation_IEasingDoubleKeyFrameStatics = interface(IInspectable)
  ['{8CC08735-4221-5127-AB2F-1E7E3DF95FB9}']
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingFunctionBase)]
  Animation_IEasingFunctionBaseFactory = interface(IInspectable)
  ['{B1B92F4C-5EC7-5CDA-B1D4-FD159595CA47}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingFunctionBase)]
  Animation_IEasingFunctionBaseStatics = interface(IInspectable)
  ['{09032445-967C-52B8-B712-15F066B32821}']
    function get_EasingModeProperty: IDependencyProperty; safecall;
    property EasingModeProperty: IDependencyProperty read get_EasingModeProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingPointKeyFrame)]
  Animation_IEasingPointKeyFrame = interface(IInspectable)
  ['{9406EE8E-3641-54FE-A424-83420EA45CD3}']
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EasingPointKeyFrame)]
  Animation_IEasingPointKeyFrameStatics = interface(IInspectable)
  ['{AC727659-92A3-52EA-8949-B609E48C233D}']
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EdgeUIThemeTransition)]
  Animation_IEdgeUIThemeTransition = interface(IInspectable)
  ['{57089964-E358-5FE2-84E7-15E82BBA9C06}']
    function get_Edge: Primitives_EdgeTransitionLocation; safecall;
    procedure put_Edge(value: Primitives_EdgeTransitionLocation); safecall;
    property Edge: Primitives_EdgeTransitionLocation read get_Edge write put_Edge;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EdgeUIThemeTransition)]
  Animation_IEdgeUIThemeTransitionStatics = interface(IInspectable)
  ['{316AF8D4-D2A0-5D27-9AF6-747797965D46}']
    function get_EdgeProperty: IDependencyProperty; safecall;
    property EdgeProperty: IDependencyProperty read get_EdgeProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IElasticEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ElasticEase)]
  Animation_IElasticEase = interface(IInspectable)
  ['{2B18D50B-4D34-509B-915C-61B1AA6F83D8}']
    function get_Oscillations: Integer; safecall;
    procedure put_Oscillations(value: Integer); safecall;
    function get_Springiness: Double; safecall;
    procedure put_Springiness(value: Double); safecall;
    property Oscillations: Integer read get_Oscillations write put_Oscillations;
    property Springiness: Double read get_Springiness write put_Springiness;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IElasticEaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ElasticEase)]
  Animation_IElasticEaseStatics = interface(IInspectable)
  ['{95FD9290-D279-5857-9F50-3F299A2D02F4}']
    function get_OscillationsProperty: IDependencyProperty; safecall;
    function get_SpringinessProperty: IDependencyProperty; safecall;
    property OscillationsProperty: IDependencyProperty read get_OscillationsProperty;
    property SpringinessProperty: IDependencyProperty read get_SpringinessProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EntranceNavigationTransitionInfo)]
  Animation_IEntranceNavigationTransitionInfo = interface(IInspectable)
  ['{DEC74921-0ED7-54E1-8C1D-30B8CCCC4B8D}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfoStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EntranceNavigationTransitionInfo)]
  Animation_IEntranceNavigationTransitionInfoStatics = interface(IInspectable)
  ['{F1096DE1-1F79-5D38-A4D6-16F3BDAAB7F0}']
    function get_IsTargetElementProperty: IDependencyProperty; safecall;
    function GetIsTargetElement(element: IUIElement): Boolean; safecall;
    procedure SetIsTargetElement(element: IUIElement; value: Boolean); safecall;
    property IsTargetElementProperty: IDependencyProperty read get_IsTargetElementProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EntranceThemeTransition)]
  Animation_IEntranceThemeTransition = interface(IInspectable)
  ['{8EB681FA-1629-5E29-AC1E-70F3639329F8}']
    function get_FromHorizontalOffset: Double; safecall;
    procedure put_FromHorizontalOffset(value: Double); safecall;
    function get_FromVerticalOffset: Double; safecall;
    procedure put_FromVerticalOffset(value: Double); safecall;
    function get_IsStaggeringEnabled: Boolean; safecall;
    procedure put_IsStaggeringEnabled(value: Boolean); safecall;
    property FromHorizontalOffset: Double read get_FromHorizontalOffset write put_FromHorizontalOffset;
    property FromVerticalOffset: Double read get_FromVerticalOffset write put_FromVerticalOffset;
    property IsStaggeringEnabled: Boolean read get_IsStaggeringEnabled write put_IsStaggeringEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_EntranceThemeTransition)]
  Animation_IEntranceThemeTransitionStatics = interface(IInspectable)
  ['{C99E5435-FACC-50AF-B96C-63B14FE7156E}']
    function get_FromHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_FromVerticalOffsetProperty: IDependencyProperty; safecall;
    function get_IsStaggeringEnabledProperty: IDependencyProperty; safecall;
    property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IExponentialEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ExponentialEase)]
  Animation_IExponentialEase = interface(IInspectable)
  ['{4D289262-E832-5FBC-A98B-87A6ECB3B6CC}']
    function get_Exponent: Double; safecall;
    procedure put_Exponent(value: Double); safecall;
    property Exponent: Double read get_Exponent write put_Exponent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IExponentialEaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ExponentialEase)]
  Animation_IExponentialEaseStatics = interface(IInspectable)
  ['{8394AB8F-DDF1-55D0-ACF1-07FEDD929BB5}']
    function get_ExponentProperty: IDependencyProperty; safecall;
    property ExponentProperty: IDependencyProperty read get_ExponentProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_FadeInThemeAnimation)]
  Animation_IFadeInThemeAnimation = interface(IInspectable)
  ['{0DCA074A-31CC-5E70-8B6B-8DBD7FFF01F6}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_FadeInThemeAnimation)]
  Animation_IFadeInThemeAnimationStatics = interface(IInspectable)
  ['{5D74A6A6-92C6-5E49-865F-676087247179}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_FadeOutThemeAnimation)]
  Animation_IFadeOutThemeAnimation = interface(IInspectable)
  ['{114024D6-5D67-5C9C-83C5-54A8BD7B671A}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_FadeOutThemeAnimation)]
  Animation_IFadeOutThemeAnimationStatics = interface(IInspectable)
  ['{0277BEA1-A0A5-5E26-9B56-6A4208862738}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfiguration
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_GravityConnectedAnimationConfiguration)]
  Animation_IGravityConnectedAnimationConfiguration = interface(IInspectable)
  ['{04C8B276-CFF3-5A55-9229-33DC66C99E20}']
    function get_IsShadowEnabled: Boolean; safecall;
    procedure put_IsShadowEnabled(value: Boolean); safecall;
    property IsShadowEnabled: Boolean read get_IsShadowEnabled write put_IsShadowEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfigurationFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_GravityConnectedAnimationConfiguration)]
  Animation_IGravityConnectedAnimationConfigurationFactory = interface(IInspectable)
  ['{BC7A71B5-7CDA-5BB7-967E-D6A031285A9C}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IGravityConnectedAnimationConfiguration; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IKeySpline
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_KeySpline)]
  Animation_IKeySpline = interface(IInspectable)
  ['{130D8B2B-0B52-5253-881B-36AB48592E6B}']
    function get_ControlPoint1: TPointF; safecall;
    procedure put_ControlPoint1(value: TPointF); safecall;
    function get_ControlPoint2: TPointF; safecall;
    procedure put_ControlPoint2(value: TPointF); safecall;
    property ControlPoint1: TPointF read get_ControlPoint1 write put_ControlPoint1;
    property ControlPoint2: TPointF read get_ControlPoint2 write put_ControlPoint2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_KeyTimeHelper)]
  Animation_IKeyTimeHelper = interface(IInspectable)
  ['{E354DA44-1F24-59C6-BC5B-D6B1BA267E9C}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_KeyTimeHelper)]
  Animation_IKeyTimeHelperStatics = interface(IInspectable)
  ['{AE5D22C9-0FDB-5823-8846-8A4D0B9EEBFA}']
    function FromTimeSpan(timeSpan: TimeSpan): Animation_KeyTime; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ILinearColorKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_LinearColorKeyFrame)]
  Animation_ILinearColorKeyFrame = interface(IInspectable)
  ['{0BCE4CD6-3A80-5F2F-932E-619A8546D0BD}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_LinearDoubleKeyFrame)]
  Animation_ILinearDoubleKeyFrame = interface(IInspectable)
  ['{38A635B9-F613-55E0-AAEC-9D4E097EFF91}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ILinearPointKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_LinearPointKeyFrame)]
  Animation_ILinearPointKeyFrame = interface(IInspectable)
  ['{4EC22493-BACB-5105-AC16-8EA5418AB76E}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_NavigationThemeTransition)]
  Animation_INavigationThemeTransition = interface(IInspectable)
  ['{D7CFBD3B-0D27-5EA1-BEB7-F6B847520DC6}']
    function get_DefaultNavigationTransitionInfo: Animation_INavigationTransitionInfo; safecall;
    procedure put_DefaultNavigationTransitionInfo(value: Animation_INavigationTransitionInfo); safecall;
    property DefaultNavigationTransitionInfo: Animation_INavigationTransitionInfo read get_DefaultNavigationTransitionInfo write put_DefaultNavigationTransitionInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_NavigationThemeTransition)]
  Animation_INavigationThemeTransitionStatics = interface(IInspectable)
  ['{78323EFF-D543-551D-B2C7-94E93A16065B}']
    function get_DefaultNavigationTransitionInfoProperty: IDependencyProperty; safecall;
    property DefaultNavigationTransitionInfoProperty: IDependencyProperty read get_DefaultNavigationTransitionInfoProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_NavigationTransitionInfo)]
  Animation_INavigationTransitionInfoFactory = interface(IInspectable)
  ['{C514B6FF-F6ED-572E-8392-3EA17BC7D4C4}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_INavigationTransitionInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoOverrides
  Animation_INavigationTransitionInfoOverrides = interface(IInspectable)
  ['{3D6AF190-5A56-513D-AFF9-631925D0FA43}']
    function GetNavigationStateCore: HSTRING; safecall;
    procedure SetNavigationStateCore(navigationState: HSTRING); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ObjectKeyFrame)]
  Animation_IObjectKeyFrame = interface(IInspectable)
  ['{C5A9F65B-FC69-5A88-A797-34F46D761381}']
    function get_Value: IInspectable; safecall;
    procedure put_Value(value: IInspectable); safecall;
    function get_KeyTime: Animation_KeyTime; safecall;
    procedure put_KeyTime(value: Animation_KeyTime); safecall;
    property KeyTime: Animation_KeyTime read get_KeyTime write put_KeyTime;
    property Value: IInspectable read get_Value write put_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterator_1__Animation_IObjectKeyFrame_Base = interface(IInspectable)
  ['{BCB7F7FD-21A4-5B86-8505-91A5AAC95F31}']
    function get_Current: Animation_IObjectKeyFrame; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_IObjectKeyFrame): Cardinal; safecall;
    property Current: Animation_IObjectKeyFrame read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterator_1__Animation_IObjectKeyFrame = interface(IIterator_1__Animation_IObjectKeyFrame_Base)
  ['{7D578732-8835-5FBF-96BA-6D4A43FFF00D}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterable_1__Animation_IObjectKeyFrame_Base = interface(IInspectable)
  ['{FFAE3466-FB63-527D-8655-A8CCDD5539A6}']
    function First: IIterator_1__Animation_IObjectKeyFrame; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IIterable_1__Animation_IObjectKeyFrame = interface(IIterable_1__Animation_IObjectKeyFrame_Base)
  ['{F8791C01-7F1C-51EF-91F7-0BC05D89F7D0}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IVectorView_1__Animation_IObjectKeyFrame = interface(IInspectable)
  ['{FEF83FFC-50F8-5FD1-841B-AD0A59B069B6}']
    function GetAt(index: Cardinal): Animation_IObjectKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_IObjectKeyFrame; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IObjectKeyFrame): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IVector_1__Animation_IObjectKeyFrame_Base = interface(IInspectable)
  ['{95F26067-8CDF-5639-B4AB-04CA575457CE}']
    function GetAt(index: Cardinal): Animation_IObjectKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_IObjectKeyFrame; safecall;
    function IndexOf(value: Animation_IObjectKeyFrame; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_IObjectKeyFrame); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_IObjectKeyFrame); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_IObjectKeyFrame); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IObjectKeyFrame): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_IObjectKeyFrame); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame>
  IVector_1__Animation_IObjectKeyFrame = interface(IVector_1__Animation_IObjectKeyFrame_Base)
  ['{70E5DC9C-8100-51E7-8B27-E570330E73CD}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ObjectAnimationUsingKeyFrames)]
  Animation_IObjectAnimationUsingKeyFrames = interface(IInspectable)
  ['{AA08DC4C-0B03-5C0A-B084-D95D272B2F0D}']
    function get_KeyFrames: IVector_1__Animation_IObjectKeyFrame; safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property KeyFrames: IVector_1__Animation_IObjectKeyFrame read get_KeyFrames;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFramesStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ObjectAnimationUsingKeyFrames)]
  Animation_IObjectAnimationUsingKeyFramesStatics = interface(IInspectable)
  ['{411A09B0-9AB4-54B9-99B9-54F955A6754E}']
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ObjectKeyFrame)]
  Animation_IObjectKeyFrameFactory = interface(IInspectable)
  ['{DC59DA6E-82B9-55F7-A358-BA2A07665AA9}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IObjectKeyFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ObjectKeyFrame)]
  Animation_IObjectKeyFrameStatics = interface(IInspectable)
  ['{39E59CEB-2859-5A5F-ACD8-BC491D49C4B6}']
    function get_ValueProperty: IDependencyProperty; safecall;
    function get_KeyTimeProperty: IDependencyProperty; safecall;
    property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    property ValueProperty: IDependencyProperty read get_ValueProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PaneThemeTransition)]
  Animation_IPaneThemeTransition = interface(IInspectable)
  ['{321BCD80-157C-5E10-B0FE-6440BD92529A}']
    function get_Edge: Primitives_EdgeTransitionLocation; safecall;
    procedure put_Edge(value: Primitives_EdgeTransitionLocation); safecall;
    property Edge: Primitives_EdgeTransitionLocation read get_Edge write put_Edge;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PaneThemeTransition)]
  Animation_IPaneThemeTransitionStatics = interface(IInspectable)
  ['{47E01752-5264-5FB1-8946-AB49FE6AF8FD}']
    function get_EdgeProperty: IDependencyProperty; safecall;
    property EdgeProperty: IDependencyProperty read get_EdgeProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointAnimation)]
  Animation_IPointAnimation = interface(IInspectable)
  ['{A0737CC4-2EAB-5C13-A5D7-78361DF1000E}']
    function get_From: IReference_1__Point; safecall;
    procedure put_From(value: IReference_1__Point); safecall;
    function get_To: IReference_1__Point; safecall;
    procedure put_To(value: IReference_1__Point); safecall;
    function get_By: IReference_1__Point; safecall;
    procedure put_By(value: IReference_1__Point); safecall;
    function get_EasingFunction: Animation_IEasingFunctionBase; safecall;
    procedure put_EasingFunction(value: Animation_IEasingFunctionBase); safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property By: IReference_1__Point read get_By write put_By;
    property EasingFunction: Animation_IEasingFunctionBase read get_EasingFunction write put_EasingFunction;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property From: IReference_1__Point read get_From write put_From;
    property &To: IReference_1__Point read get_To write put_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointAnimation)]
  Animation_IPointAnimationStatics = interface(IInspectable)
  ['{71CFB43B-BADA-554B-8FCA-B558D623BBC0}']
    function get_FromProperty: IDependencyProperty; safecall;
    function get_ToProperty: IDependencyProperty; safecall;
    function get_ByProperty: IDependencyProperty; safecall;
    function get_EasingFunctionProperty: IDependencyProperty; safecall;
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property ByProperty: IDependencyProperty read get_ByProperty;
    property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    property FromProperty: IDependencyProperty read get_FromProperty;
    property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointKeyFrame)]
  Animation_IPointKeyFrame = interface(IInspectable)
  ['{59D5C07D-A3A7-5450-9DFB-4B7E77D58F93}']
    function get_Value: TPointF; safecall;
    procedure put_Value(value: TPointF); safecall;
    function get_KeyTime: Animation_KeyTime; safecall;
    procedure put_KeyTime(value: Animation_KeyTime); safecall;
    property KeyTime: Animation_KeyTime read get_KeyTime write put_KeyTime;
    property Value: TPointF read get_Value write put_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterator_1__Animation_IPointKeyFrame_Base = interface(IInspectable)
  ['{8DB0CFBF-9976-53A8-A99A-F4234080855D}']
    function get_Current: Animation_IPointKeyFrame; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimation_IPointKeyFrame): Cardinal; safecall;
    property Current: Animation_IPointKeyFrame read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterator_1__Animation_IPointKeyFrame = interface(IIterator_1__Animation_IPointKeyFrame_Base)
  ['{405F998D-EB04-5232-96DC-13FE6FEE72E3}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterable_1__Animation_IPointKeyFrame_Base = interface(IInspectable)
  ['{04688E75-0154-5259-8BD1-8DBB68DE65E5}']
    function First: IIterator_1__Animation_IPointKeyFrame; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IIterable_1__Animation_IPointKeyFrame = interface(IIterable_1__Animation_IPointKeyFrame_Base)
  ['{2920D59B-14EA-5527-8ECD-0F4423CB7465}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IVectorView_1__Animation_IPointKeyFrame = interface(IInspectable)
  ['{6353C0A9-407C-578C-9A30-4845BE450384}']
    function GetAt(index: Cardinal): Animation_IPointKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Animation_IPointKeyFrame; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IPointKeyFrame): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IVector_1__Animation_IPointKeyFrame_Base = interface(IInspectable)
  ['{A577FE62-F0E0-5514-8F88-5CE74FD385F6}']
    function GetAt(index: Cardinal): Animation_IPointKeyFrame; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Animation_IPointKeyFrame; safecall;
    function IndexOf(value: Animation_IPointKeyFrame; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Animation_IPointKeyFrame); safecall;
    procedure InsertAt(index: Cardinal; value: Animation_IPointKeyFrame); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Animation_IPointKeyFrame); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimation_IPointKeyFrame): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAnimation_IPointKeyFrame); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame>
  IVector_1__Animation_IPointKeyFrame = interface(IVector_1__Animation_IPointKeyFrame_Base)
  ['{1549E833-607D-5B99-80EF-43B9BB62673D}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointAnimationUsingKeyFrames)]
  Animation_IPointAnimationUsingKeyFrames = interface(IInspectable)
  ['{BDD63992-DF13-5514-8611-4952F722F6D0}']
    function get_KeyFrames: IVector_1__Animation_IPointKeyFrame; safecall;
    function get_EnableDependentAnimation: Boolean; safecall;
    procedure put_EnableDependentAnimation(value: Boolean); safecall;
    property EnableDependentAnimation: Boolean read get_EnableDependentAnimation write put_EnableDependentAnimation;
    property KeyFrames: IVector_1__Animation_IPointKeyFrame read get_KeyFrames;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFramesStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointAnimationUsingKeyFrames)]
  Animation_IPointAnimationUsingKeyFramesStatics = interface(IInspectable)
  ['{04152B3B-F0DA-5B28-877D-9AC96D334A77}']
    function get_EnableDependentAnimationProperty: IDependencyProperty; safecall;
    property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointKeyFrame)]
  Animation_IPointKeyFrameFactory = interface(IInspectable)
  ['{C52EE293-F10E-5252-BC08-A28659740F0E}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IPointKeyFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointKeyFrame)]
  Animation_IPointKeyFrameStatics = interface(IInspectable)
  ['{96CD72FD-D834-5B23-9A17-1548961DC348}']
    function get_ValueProperty: IDependencyProperty; safecall;
    function get_KeyTimeProperty: IDependencyProperty; safecall;
    property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    property ValueProperty: IDependencyProperty read get_ValueProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointerDownThemeAnimation)]
  Animation_IPointerDownThemeAnimation = interface(IInspectable)
  ['{ABDD1ACC-40DF-595D-BE68-0362FE681B91}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointerDownThemeAnimation)]
  Animation_IPointerDownThemeAnimationStatics = interface(IInspectable)
  ['{12268B39-FB7D-53DA-8CCC-5967DC06BCE9}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointerUpThemeAnimation)]
  Animation_IPointerUpThemeAnimation = interface(IInspectable)
  ['{94896D1C-C938-5D68-84DA-552BDE815810}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PointerUpThemeAnimation)]
  Animation_IPointerUpThemeAnimationStatics = interface(IInspectable)
  ['{51A3117E-C6FA-5DC5-8DB8-73F060003AE4}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopInThemeAnimation)]
  Animation_IPopInThemeAnimation = interface(IInspectable)
  ['{20136388-B4E4-5CBB-9CB2-DF2EA7E6C44B}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    function get_FromHorizontalOffset: Double; safecall;
    procedure put_FromHorizontalOffset(value: Double); safecall;
    function get_FromVerticalOffset: Double; safecall;
    procedure put_FromVerticalOffset(value: Double); safecall;
    property FromHorizontalOffset: Double read get_FromHorizontalOffset write put_FromHorizontalOffset;
    property FromVerticalOffset: Double read get_FromVerticalOffset write put_FromVerticalOffset;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopInThemeAnimation)]
  Animation_IPopInThemeAnimationStatics = interface(IInspectable)
  ['{8C9378A9-D276-5A1D-8188-F48F07840A16}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function get_FromHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_FromVerticalOffsetProperty: IDependencyProperty; safecall;
    property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopOutThemeAnimation)]
  Animation_IPopOutThemeAnimation = interface(IInspectable)
  ['{1BB20DD3-5648-541A-A0C9-37A955DB10A6}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopOutThemeAnimation)]
  Animation_IPopOutThemeAnimationStatics = interface(IInspectable)
  ['{3F569F96-367E-595C-9732-2FB919388D84}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopupThemeTransition)]
  Animation_IPopupThemeTransition = interface(IInspectable)
  ['{E1FA6B8A-ADD3-5299-A000-121D6DBACC80}']
    function get_FromHorizontalOffset: Double; safecall;
    procedure put_FromHorizontalOffset(value: Double); safecall;
    function get_FromVerticalOffset: Double; safecall;
    procedure put_FromVerticalOffset(value: Double); safecall;
    property FromHorizontalOffset: Double read get_FromHorizontalOffset write put_FromHorizontalOffset;
    property FromVerticalOffset: Double read get_FromVerticalOffset write put_FromVerticalOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PopupThemeTransition)]
  Animation_IPopupThemeTransitionStatics = interface(IInspectable)
  ['{538B2114-415C-5F99-B74D-A85966DACC54}']
    function get_FromHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_FromVerticalOffsetProperty: IDependencyProperty; safecall;
    property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPowerEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PowerEase)]
  Animation_IPowerEase = interface(IInspectable)
  ['{372DFAD0-5177-5DF9-8E1E-920962468714}']
    function get_Power: Double; safecall;
    procedure put_Power(value: Double); safecall;
    property Power: Double read get_Power write put_Power;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IPowerEaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_PowerEase)]
  Animation_IPowerEaseStatics = interface(IInspectable)
  ['{8EB72EDB-3E7E-5D40-928B-4505D57C21CE}']
    function get_PowerProperty: IDependencyProperty; safecall;
    property PowerProperty: IDependencyProperty read get_PowerProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IQuadraticEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_QuadraticEase)]
  Animation_IQuadraticEase = interface(IInspectable)
  ['{DB85FDA1-03B7-57CD-A1EF-8855CBF62191}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IQuarticEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_QuarticEase)]
  Animation_IQuarticEase = interface(IInspectable)
  ['{48215273-05F1-58AA-BADE-0B71D7BD0484}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IQuinticEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_QuinticEase)]
  Animation_IQuinticEase = interface(IInspectable)
  ['{DC2F05D5-A3AC-5DCE-9B85-753A0C800FC2}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IReorderThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_ReorderThemeTransition)]
  Animation_IReorderThemeTransition = interface(IInspectable)
  ['{0D5A0874-1DF5-5379-B626-74721759438A}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepeatBehaviorHelper)]
  Animation_IRepeatBehaviorHelper = interface(IInspectable)
  ['{4643F139-FFEF-5C6A-8DE6-142B41CD51A5}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepeatBehaviorHelper)]
  Animation_IRepeatBehaviorHelperStatics = interface(IInspectable)
  ['{C66D4425-6461-5189-B17D-CCA0CCA34CA0}']
    function get_Forever: Animation_RepeatBehavior; safecall;
    function FromCount(count: Double): Animation_RepeatBehavior; safecall;
    function FromDuration(duration: TimeSpan): Animation_RepeatBehavior; safecall;
    function GetHasCount(target: Animation_RepeatBehavior): Boolean; safecall;
    function GetHasDuration(target: Animation_RepeatBehavior): Boolean; safecall;
    function Equals(target: Animation_RepeatBehavior; value: Animation_RepeatBehavior): Boolean; safecall;
    property Forever: Animation_RepeatBehavior read get_Forever;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepositionThemeAnimation)]
  Animation_IRepositionThemeAnimation = interface(IInspectable)
  ['{36F7E025-23C1-53DE-8DF9-7DC1E9C788FD}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    function get_FromHorizontalOffset: Double; safecall;
    procedure put_FromHorizontalOffset(value: Double); safecall;
    function get_FromVerticalOffset: Double; safecall;
    procedure put_FromVerticalOffset(value: Double); safecall;
    property FromHorizontalOffset: Double read get_FromHorizontalOffset write put_FromHorizontalOffset;
    property FromVerticalOffset: Double read get_FromVerticalOffset write put_FromVerticalOffset;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepositionThemeAnimation)]
  Animation_IRepositionThemeAnimationStatics = interface(IInspectable)
  ['{C04118DE-AFF5-5FA9-AEE7-94A621C82618}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function get_FromHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_FromVerticalOffsetProperty: IDependencyProperty; safecall;
    property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransition
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepositionThemeTransition)]
  Animation_IRepositionThemeTransition = interface(IInspectable)
  ['{7728E3F0-24B1-5484-824A-C0B41C2745D5}']
    function get_IsStaggeringEnabled: Boolean; safecall;
    procedure put_IsStaggeringEnabled(value: Boolean); safecall;
    property IsStaggeringEnabled: Boolean read get_IsStaggeringEnabled write put_IsStaggeringEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransitionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_RepositionThemeTransition)]
  Animation_IRepositionThemeTransitionStatics = interface(IInspectable)
  ['{C70A0F9A-485E-53BB-AD3C-8B41B6788BF9}']
    function get_IsStaggeringEnabledProperty: IDependencyProperty; safecall;
    property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISineEase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SineEase)]
  Animation_ISineEase = interface(IInspectable)
  ['{6115539B-663D-5131-B7C2-74BB5FDC6A1D}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SlideNavigationTransitionInfo)]
  Animation_ISlideNavigationTransitionInfo = interface(IInspectable)
  ['{53EADE0E-6B01-511F-A563-6F5724A6C1C1}']
    function get_Effect: Animation_SlideNavigationTransitionEffect; safecall;
    procedure put_Effect(value: Animation_SlideNavigationTransitionEffect); safecall;
    property Effect: Animation_SlideNavigationTransitionEffect read get_Effect write put_Effect;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfoStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SlideNavigationTransitionInfo)]
  Animation_ISlideNavigationTransitionInfoStatics = interface(IInspectable)
  ['{90BA0C6C-CD45-5A6C-BBB2-88037D43CD79}']
    function get_EffectProperty: IDependencyProperty; safecall;
    property EffectProperty: IDependencyProperty read get_EffectProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplineColorKeyFrame)]
  Animation_ISplineColorKeyFrame = interface(IInspectable)
  ['{60C5905F-4343-504D-A2C6-64B8D924B438}']
    function get_KeySpline: Animation_IKeySpline; safecall;
    procedure put_KeySpline(value: Animation_IKeySpline); safecall;
    property KeySpline: Animation_IKeySpline read get_KeySpline write put_KeySpline;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplineColorKeyFrame)]
  Animation_ISplineColorKeyFrameStatics = interface(IInspectable)
  ['{D89C7062-753D-5652-B215-C195AE2C7A18}']
    function get_KeySplineProperty: IDependencyProperty; safecall;
    property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplineDoubleKeyFrame)]
  Animation_ISplineDoubleKeyFrame = interface(IInspectable)
  ['{AEA80957-BB56-59B6-BB7A-6295F94BC961}']
    function get_KeySpline: Animation_IKeySpline; safecall;
    procedure put_KeySpline(value: Animation_IKeySpline); safecall;
    property KeySpline: Animation_IKeySpline read get_KeySpline write put_KeySpline;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplineDoubleKeyFrame)]
  Animation_ISplineDoubleKeyFrameStatics = interface(IInspectable)
  ['{CA88552E-7237-51F8-A8CA-79952C77883A}']
    function get_KeySplineProperty: IDependencyProperty; safecall;
    property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrame
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplinePointKeyFrame)]
  Animation_ISplinePointKeyFrame = interface(IInspectable)
  ['{2B7EB049-708C-5220-A178-A25DBC14FFBE}']
    function get_KeySpline: Animation_IKeySpline; safecall;
    procedure put_KeySpline(value: Animation_IKeySpline); safecall;
    property KeySpline: Animation_IKeySpline read get_KeySpline write put_KeySpline;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrameStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplinePointKeyFrame)]
  Animation_ISplinePointKeyFrameStatics = interface(IInspectable)
  ['{1E100E36-BED1-5060-8DCF-0D5B32575ED1}']
    function get_KeySplineProperty: IDependencyProperty; safecall;
    property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplitCloseThemeAnimation)]
  Animation_ISplitCloseThemeAnimation = interface(IInspectable)
  ['{B0DD1490-F646-5C18-B3EF-02F9B17F57DF}']
    function get_OpenedTargetName: HSTRING; safecall;
    procedure put_OpenedTargetName(value: HSTRING); safecall;
    function get_OpenedTarget: IDependencyObject; safecall;
    procedure put_OpenedTarget(value: IDependencyObject); safecall;
    function get_ClosedTargetName: HSTRING; safecall;
    procedure put_ClosedTargetName(value: HSTRING); safecall;
    function get_ClosedTarget: IDependencyObject; safecall;
    procedure put_ClosedTarget(value: IDependencyObject); safecall;
    function get_ContentTargetName: HSTRING; safecall;
    procedure put_ContentTargetName(value: HSTRING); safecall;
    function get_ContentTarget: IDependencyObject; safecall;
    procedure put_ContentTarget(value: IDependencyObject); safecall;
    function get_OpenedLength: Double; safecall;
    procedure put_OpenedLength(value: Double); safecall;
    function get_ClosedLength: Double; safecall;
    procedure put_ClosedLength(value: Double); safecall;
    function get_OffsetFromCenter: Double; safecall;
    procedure put_OffsetFromCenter(value: Double); safecall;
    function get_ContentTranslationDirection: Primitives_AnimationDirection; safecall;
    procedure put_ContentTranslationDirection(value: Primitives_AnimationDirection); safecall;
    function get_ContentTranslationOffset: Double; safecall;
    procedure put_ContentTranslationOffset(value: Double); safecall;
    property ClosedLength: Double read get_ClosedLength write put_ClosedLength;
    property ClosedTarget: IDependencyObject read get_ClosedTarget write put_ClosedTarget;
    property ClosedTargetName: HSTRING read get_ClosedTargetName write put_ClosedTargetName;
    property ContentTarget: IDependencyObject read get_ContentTarget write put_ContentTarget;
    property ContentTargetName: HSTRING read get_ContentTargetName write put_ContentTargetName;
    property ContentTranslationDirection: Primitives_AnimationDirection read get_ContentTranslationDirection write put_ContentTranslationDirection;
    property ContentTranslationOffset: Double read get_ContentTranslationOffset write put_ContentTranslationOffset;
    property OffsetFromCenter: Double read get_OffsetFromCenter write put_OffsetFromCenter;
    property OpenedLength: Double read get_OpenedLength write put_OpenedLength;
    property OpenedTarget: IDependencyObject read get_OpenedTarget write put_OpenedTarget;
    property OpenedTargetName: HSTRING read get_OpenedTargetName write put_OpenedTargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplitCloseThemeAnimation)]
  Animation_ISplitCloseThemeAnimationStatics = interface(IInspectable)
  ['{32345CDD-2A3C-5571-B2EB-2FCABC2E92C6}']
    function get_OpenedTargetNameProperty: IDependencyProperty; safecall;
    function get_OpenedTargetProperty: IDependencyProperty; safecall;
    function get_ClosedTargetNameProperty: IDependencyProperty; safecall;
    function get_ClosedTargetProperty: IDependencyProperty; safecall;
    function get_ContentTargetNameProperty: IDependencyProperty; safecall;
    function get_ContentTargetProperty: IDependencyProperty; safecall;
    function get_OpenedLengthProperty: IDependencyProperty; safecall;
    function get_ClosedLengthProperty: IDependencyProperty; safecall;
    function get_OffsetFromCenterProperty: IDependencyProperty; safecall;
    function get_ContentTranslationDirectionProperty: IDependencyProperty; safecall;
    function get_ContentTranslationOffsetProperty: IDependencyProperty; safecall;
    property ClosedLengthProperty: IDependencyProperty read get_ClosedLengthProperty;
    property ClosedTargetNameProperty: IDependencyProperty read get_ClosedTargetNameProperty;
    property ClosedTargetProperty: IDependencyProperty read get_ClosedTargetProperty;
    property ContentTargetNameProperty: IDependencyProperty read get_ContentTargetNameProperty;
    property ContentTargetProperty: IDependencyProperty read get_ContentTargetProperty;
    property ContentTranslationDirectionProperty: IDependencyProperty read get_ContentTranslationDirectionProperty;
    property ContentTranslationOffsetProperty: IDependencyProperty read get_ContentTranslationOffsetProperty;
    property OffsetFromCenterProperty: IDependencyProperty read get_OffsetFromCenterProperty;
    property OpenedLengthProperty: IDependencyProperty read get_OpenedLengthProperty;
    property OpenedTargetNameProperty: IDependencyProperty read get_OpenedTargetNameProperty;
    property OpenedTargetProperty: IDependencyProperty read get_OpenedTargetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplitOpenThemeAnimation)]
  Animation_ISplitOpenThemeAnimation = interface(IInspectable)
  ['{79FDFACA-4245-53F0-B5C7-DA1CE2B0B851}']
    function get_OpenedTargetName: HSTRING; safecall;
    procedure put_OpenedTargetName(value: HSTRING); safecall;
    function get_OpenedTarget: IDependencyObject; safecall;
    procedure put_OpenedTarget(value: IDependencyObject); safecall;
    function get_ClosedTargetName: HSTRING; safecall;
    procedure put_ClosedTargetName(value: HSTRING); safecall;
    function get_ClosedTarget: IDependencyObject; safecall;
    procedure put_ClosedTarget(value: IDependencyObject); safecall;
    function get_ContentTargetName: HSTRING; safecall;
    procedure put_ContentTargetName(value: HSTRING); safecall;
    function get_ContentTarget: IDependencyObject; safecall;
    procedure put_ContentTarget(value: IDependencyObject); safecall;
    function get_OpenedLength: Double; safecall;
    procedure put_OpenedLength(value: Double); safecall;
    function get_ClosedLength: Double; safecall;
    procedure put_ClosedLength(value: Double); safecall;
    function get_OffsetFromCenter: Double; safecall;
    procedure put_OffsetFromCenter(value: Double); safecall;
    function get_ContentTranslationDirection: Primitives_AnimationDirection; safecall;
    procedure put_ContentTranslationDirection(value: Primitives_AnimationDirection); safecall;
    function get_ContentTranslationOffset: Double; safecall;
    procedure put_ContentTranslationOffset(value: Double); safecall;
    property ClosedLength: Double read get_ClosedLength write put_ClosedLength;
    property ClosedTarget: IDependencyObject read get_ClosedTarget write put_ClosedTarget;
    property ClosedTargetName: HSTRING read get_ClosedTargetName write put_ClosedTargetName;
    property ContentTarget: IDependencyObject read get_ContentTarget write put_ContentTarget;
    property ContentTargetName: HSTRING read get_ContentTargetName write put_ContentTargetName;
    property ContentTranslationDirection: Primitives_AnimationDirection read get_ContentTranslationDirection write put_ContentTranslationDirection;
    property ContentTranslationOffset: Double read get_ContentTranslationOffset write put_ContentTranslationOffset;
    property OffsetFromCenter: Double read get_OffsetFromCenter write put_OffsetFromCenter;
    property OpenedLength: Double read get_OpenedLength write put_OpenedLength;
    property OpenedTarget: IDependencyObject read get_OpenedTarget write put_OpenedTarget;
    property OpenedTargetName: HSTRING read get_OpenedTargetName write put_OpenedTargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SplitOpenThemeAnimation)]
  Animation_ISplitOpenThemeAnimationStatics = interface(IInspectable)
  ['{E5A73B84-A4AE-5C38-84DA-F7ED30FC9B6E}']
    function get_OpenedTargetNameProperty: IDependencyProperty; safecall;
    function get_OpenedTargetProperty: IDependencyProperty; safecall;
    function get_ClosedTargetNameProperty: IDependencyProperty; safecall;
    function get_ClosedTargetProperty: IDependencyProperty; safecall;
    function get_ContentTargetNameProperty: IDependencyProperty; safecall;
    function get_ContentTargetProperty: IDependencyProperty; safecall;
    function get_OpenedLengthProperty: IDependencyProperty; safecall;
    function get_ClosedLengthProperty: IDependencyProperty; safecall;
    function get_OffsetFromCenterProperty: IDependencyProperty; safecall;
    function get_ContentTranslationDirectionProperty: IDependencyProperty; safecall;
    function get_ContentTranslationOffsetProperty: IDependencyProperty; safecall;
    property ClosedLengthProperty: IDependencyProperty read get_ClosedLengthProperty;
    property ClosedTargetNameProperty: IDependencyProperty read get_ClosedTargetNameProperty;
    property ClosedTargetProperty: IDependencyProperty read get_ClosedTargetProperty;
    property ContentTargetNameProperty: IDependencyProperty read get_ContentTargetNameProperty;
    property ContentTargetProperty: IDependencyProperty read get_ContentTargetProperty;
    property ContentTranslationDirectionProperty: IDependencyProperty read get_ContentTranslationDirectionProperty;
    property ContentTranslationOffsetProperty: IDependencyProperty read get_ContentTranslationOffsetProperty;
    property OffsetFromCenterProperty: IDependencyProperty read get_OffsetFromCenterProperty;
    property OpenedLengthProperty: IDependencyProperty read get_OpenedLengthProperty;
    property OpenedTargetNameProperty: IDependencyProperty read get_OpenedTargetNameProperty;
    property OpenedTargetProperty: IDependencyProperty read get_OpenedTargetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.IStoryboardStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Storyboard)]
  Animation_IStoryboardStatics = interface(IInspectable)
  ['{DD18519B-D4E4-597D-A0B7-655EBDD35EFA}']
    function get_TargetPropertyProperty: IDependencyProperty; safecall;
    function GetTargetProperty(element: Animation_ITimeline): HSTRING; safecall;
    procedure SetTargetProperty(element: Animation_ITimeline; path: HSTRING); safecall;
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function GetTargetName(element: Animation_ITimeline): HSTRING; safecall;
    procedure SetTargetName(element: Animation_ITimeline; name: HSTRING); safecall;
    procedure SetTarget(timeline: Animation_ITimeline; target: IDependencyObject); safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    property TargetPropertyProperty: IDependencyProperty read get_TargetPropertyProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SuppressNavigationTransitionInfo)]
  Animation_ISuppressNavigationTransitionInfo = interface(IInspectable)
  ['{3ECD2BD1-9805-5F51-BB9E-051FEA8DC355}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SwipeBackThemeAnimation)]
  Animation_ISwipeBackThemeAnimation = interface(IInspectable)
  ['{F095D058-BC9E-58EE-8877-E084723B4333}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    function get_FromHorizontalOffset: Double; safecall;
    procedure put_FromHorizontalOffset(value: Double); safecall;
    function get_FromVerticalOffset: Double; safecall;
    procedure put_FromVerticalOffset(value: Double); safecall;
    property FromHorizontalOffset: Double read get_FromHorizontalOffset write put_FromHorizontalOffset;
    property FromVerticalOffset: Double read get_FromVerticalOffset write put_FromVerticalOffset;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SwipeBackThemeAnimation)]
  Animation_ISwipeBackThemeAnimationStatics = interface(IInspectable)
  ['{18A7A588-B9A2-573B-8E2B-38048C4635A7}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function get_FromHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_FromVerticalOffsetProperty: IDependencyProperty; safecall;
    property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SwipeHintThemeAnimation)]
  Animation_ISwipeHintThemeAnimation = interface(IInspectable)
  ['{09DE03D7-4B8A-55E1-AFAD-5F60598733EA}']
    function get_TargetName: HSTRING; safecall;
    procedure put_TargetName(value: HSTRING); safecall;
    function get_ToHorizontalOffset: Double; safecall;
    procedure put_ToHorizontalOffset(value: Double); safecall;
    function get_ToVerticalOffset: Double; safecall;
    procedure put_ToVerticalOffset(value: Double); safecall;
    property TargetName: HSTRING read get_TargetName write put_TargetName;
    property ToHorizontalOffset: Double read get_ToHorizontalOffset write put_ToHorizontalOffset;
    property ToVerticalOffset: Double read get_ToVerticalOffset write put_ToVerticalOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimationStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_SwipeHintThemeAnimation)]
  Animation_ISwipeHintThemeAnimationStatics = interface(IInspectable)
  ['{F3308304-4F09-54D7-A4D5-CA558BBFE26F}']
    function get_TargetNameProperty: IDependencyProperty; safecall;
    function get_ToHorizontalOffsetProperty: IDependencyProperty; safecall;
    function get_ToVerticalOffsetProperty: IDependencyProperty; safecall;
    property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    property ToHorizontalOffsetProperty: IDependencyProperty read get_ToHorizontalOffsetProperty;
    property ToVerticalOffsetProperty: IDependencyProperty read get_ToVerticalOffsetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ITimelineFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Timeline)]
  Animation_ITimelineFactory = interface(IInspectable)
  ['{6A635732-A827-5398-9FC8-DFBC3B97E3C1}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_ITimeline; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ITimelineStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Timeline)]
  Animation_ITimelineStatics = interface(IInspectable)
  ['{778B8471-C831-503A-8748-FE6BBC7153B7}']
    function get_AllowDependentAnimations: Boolean; safecall;
    procedure put_AllowDependentAnimations(value: Boolean); safecall;
    function get_AutoReverseProperty: IDependencyProperty; safecall;
    function get_BeginTimeProperty: IDependencyProperty; safecall;
    function get_DurationProperty: IDependencyProperty; safecall;
    function get_SpeedRatioProperty: IDependencyProperty; safecall;
    function get_FillBehaviorProperty: IDependencyProperty; safecall;
    function get_RepeatBehaviorProperty: IDependencyProperty; safecall;
    property AllowDependentAnimations: Boolean read get_AllowDependentAnimations write put_AllowDependentAnimations;
    property AutoReverseProperty: IDependencyProperty read get_AutoReverseProperty;
    property BeginTimeProperty: IDependencyProperty read get_BeginTimeProperty;
    property DurationProperty: IDependencyProperty read get_DurationProperty;
    property FillBehaviorProperty: IDependencyProperty read get_FillBehaviorProperty;
    property RepeatBehaviorProperty: IDependencyProperty read get_RepeatBehaviorProperty;
    property SpeedRatioProperty: IDependencyProperty read get_SpeedRatioProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Animation.ITransitionFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Animation_Transition)]
  Animation_ITransitionFactory = interface(IInspectable)
  ['{B7023E3B-BCD3-50EC-AACF-8CFCECE25F17}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IAcrylicBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_AcrylicBrush)]
  IAcrylicBrush = interface(IInspectable)
  ['{3A8C760A-941F-58BC-A6D4-AA7A0DD1D036}']
    function get_TintColor: Color; safecall;
    procedure put_TintColor(value: Color); safecall;
    function get_TintOpacity: Double; safecall;
    procedure put_TintOpacity(value: Double); safecall;
    function get_TintTransitionDuration: TimeSpan; safecall;
    procedure put_TintTransitionDuration(value: TimeSpan); safecall;
    function get_AlwaysUseFallback: Boolean; safecall;
    procedure put_AlwaysUseFallback(value: Boolean); safecall;
    property AlwaysUseFallback: Boolean read get_AlwaysUseFallback write put_AlwaysUseFallback;
    property TintColor: Color read get_TintColor write put_TintColor;
    property TintOpacity: Double read get_TintOpacity write put_TintOpacity;
    property TintTransitionDuration: TimeSpan read get_TintTransitionDuration write put_TintTransitionDuration;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IAcrylicBrush2
  IAcrylicBrush2 = interface(IInspectable)
  ['{23FAD570-43ED-5A73-9DE7-A303553D5414}']
    function get_TintLuminosityOpacity: IReference_1__Double; safecall;
    procedure put_TintLuminosityOpacity(value: IReference_1__Double); safecall;
    property TintLuminosityOpacity: IReference_1__Double read get_TintLuminosityOpacity write put_TintLuminosityOpacity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IAcrylicBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_AcrylicBrush)]
  IAcrylicBrushFactory = interface(IInspectable)
  ['{80173353-611D-5A02-8864-1AAA279DFF1C}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IAcrylicBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IAcrylicBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_AcrylicBrush)]
  IAcrylicBrushStatics = interface(IInspectable)
  ['{9D9D366B-00A3-5F3E-98B8-1DF7FEC1828C}']
    function get_TintColorProperty: IDependencyProperty; safecall;
    function get_TintOpacityProperty: IDependencyProperty; safecall;
    function get_TintTransitionDurationProperty: IDependencyProperty; safecall;
    function get_AlwaysUseFallbackProperty: IDependencyProperty; safecall;
    property AlwaysUseFallbackProperty: IDependencyProperty read get_AlwaysUseFallbackProperty;
    property TintColorProperty: IDependencyProperty read get_TintColorProperty;
    property TintOpacityProperty: IDependencyProperty read get_TintOpacityProperty;
    property TintTransitionDurationProperty: IDependencyProperty read get_TintTransitionDurationProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IAcrylicBrushStatics2
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_AcrylicBrush)]
  IAcrylicBrushStatics2 = interface(IInspectable)
  ['{6E3EB0BD-20A1-52EA-AEDE-478061012279}']
    function get_TintLuminosityOpacityProperty: IDependencyProperty; safecall;
    property TintLuminosityOpacityProperty: IDependencyProperty read get_TintLuminosityOpacityProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IArcSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ArcSegment)]
  IArcSegment = interface(IInspectable)
  ['{6B7CE02B-87BE-5ACB-9D3B-C9964C6962D0}']
    function get_Point: TPointF; safecall;
    procedure put_Point(value: TPointF); safecall;
    function get_Size: TSizeF; safecall;
    procedure put_Size(value: TSizeF); safecall;
    function get_RotationAngle: Double; safecall;
    procedure put_RotationAngle(value: Double); safecall;
    function get_IsLargeArc: Boolean; safecall;
    procedure put_IsLargeArc(value: Boolean); safecall;
    function get_SweepDirection: SweepDirection; safecall;
    procedure put_SweepDirection(value: SweepDirection); safecall;
    property IsLargeArc: Boolean read get_IsLargeArc write put_IsLargeArc;
    property Point: TPointF read get_Point write put_Point;
    property RotationAngle: Double read get_RotationAngle write put_RotationAngle;
    property Size: TSizeF read get_Size write put_Size;
    property SweepDirection_: SweepDirection read get_SweepDirection write put_SweepDirection;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IArcSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ArcSegment)]
  IArcSegmentStatics = interface(IInspectable)
  ['{5BA7CCB3-5BC7-5038-99C5-93DC730230CF}']
    function get_PointProperty: IDependencyProperty; safecall;
    function get_SizeProperty: IDependencyProperty; safecall;
    function get_RotationAngleProperty: IDependencyProperty; safecall;
    function get_IsLargeArcProperty: IDependencyProperty; safecall;
    function get_SweepDirectionProperty: IDependencyProperty; safecall;
    property IsLargeArcProperty: IDependencyProperty read get_IsLargeArcProperty;
    property PointProperty: IDependencyProperty read get_PointProperty;
    property RotationAngleProperty: IDependencyProperty read get_RotationAngleProperty;
    property SizeProperty: IDependencyProperty read get_SizeProperty;
    property SweepDirectionProperty: IDependencyProperty read get_SweepDirectionProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBezierSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_BezierSegment)]
  IBezierSegment = interface(IInspectable)
  ['{0F36BADE-892E-51FE-B94A-3875E86FEAAE}']
    function get_Point1: TPointF; safecall;
    procedure put_Point1(value: TPointF); safecall;
    function get_Point2: TPointF; safecall;
    procedure put_Point2(value: TPointF); safecall;
    function get_Point3: TPointF; safecall;
    procedure put_Point3(value: TPointF); safecall;
    property Point1: TPointF read get_Point1 write put_Point1;
    property Point2: TPointF read get_Point2 write put_Point2;
    property Point3: TPointF read get_Point3 write put_Point3;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBezierSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_BezierSegment)]
  IBezierSegmentStatics = interface(IInspectable)
  ['{98E74D5C-C97A-50B0-AE0E-D436DC9DF16D}']
    function get_Point1Property: IDependencyProperty; safecall;
    function get_Point2Property: IDependencyProperty; safecall;
    function get_Point3Property: IDependencyProperty; safecall;
    property Point1Property: IDependencyProperty read get_Point1Property;
    property Point2Property: IDependencyProperty read get_Point2Property;
    property Point3Property: IDependencyProperty read get_Point3Property;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBitmapCache
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_BitmapCache)]
  IBitmapCache = interface(IInspectable)
  ['{4B3A8983-27A2-592A-BDA4-270431EAE038}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Brush)]
  IBrushFactory = interface(IInspectable)
  ['{B5258717-6C49-5BA5-87FD-35DF382647A5}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBrushOverrides
  IBrushOverrides = interface(IInspectable)
  ['{B6B08394-BACF-53DB-9AC7-BE1C693E3513}']
    procedure PopulatePropertyInfoOverride(propertyName: HSTRING; animationPropertyInfo: IAnimationPropertyInfo); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Brush)]
  IBrushStatics = interface(IInspectable)
  ['{5B854F50-F818-5F01-91B0-28132D3F5957}']
    function get_OpacityProperty: IDependencyProperty; safecall;
    function get_TransformProperty: IDependencyProperty; safecall;
    function get_RelativeTransformProperty: IDependencyProperty; safecall;
    property OpacityProperty: IDependencyProperty read get_OpacityProperty;
    property RelativeTransformProperty: IDependencyProperty read get_RelativeTransformProperty;
    property TransformProperty: IDependencyProperty read get_TransformProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ICacheModeFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CacheMode)]
  ICacheModeFactory = interface(IInspectable)
  ['{E257811E-DCC5-51D8-829A-3E9400198A41}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ICacheMode; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ICompositeTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CompositeTransform)]
  ICompositeTransform = interface(IInspectable)
  ['{55C5F8F3-20E4-5B80-A046-CE4D0F62F2FE}']
    function get_CenterX: Double; safecall;
    procedure put_CenterX(value: Double); safecall;
    function get_CenterY: Double; safecall;
    procedure put_CenterY(value: Double); safecall;
    function get_ScaleX: Double; safecall;
    procedure put_ScaleX(value: Double); safecall;
    function get_ScaleY: Double; safecall;
    procedure put_ScaleY(value: Double); safecall;
    function get_SkewX: Double; safecall;
    procedure put_SkewX(value: Double); safecall;
    function get_SkewY: Double; safecall;
    procedure put_SkewY(value: Double); safecall;
    function get_Rotation: Double; safecall;
    procedure put_Rotation(value: Double); safecall;
    function get_TranslateX: Double; safecall;
    procedure put_TranslateX(value: Double); safecall;
    function get_TranslateY: Double; safecall;
    procedure put_TranslateY(value: Double); safecall;
    property CenterX: Double read get_CenterX write put_CenterX;
    property CenterY: Double read get_CenterY write put_CenterY;
    property Rotation: Double read get_Rotation write put_Rotation;
    property ScaleX: Double read get_ScaleX write put_ScaleX;
    property ScaleY: Double read get_ScaleY write put_ScaleY;
    property SkewX: Double read get_SkewX write put_SkewX;
    property SkewY: Double read get_SkewY write put_SkewY;
    property TranslateX: Double read get_TranslateX write put_TranslateX;
    property TranslateY: Double read get_TranslateY write put_TranslateY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ICompositeTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CompositeTransform)]
  ICompositeTransformStatics = interface(IInspectable)
  ['{7701385B-8EAB-5071-BFA5-B453E1E52B43}']
    function get_CenterXProperty: IDependencyProperty; safecall;
    function get_CenterYProperty: IDependencyProperty; safecall;
    function get_ScaleXProperty: IDependencyProperty; safecall;
    function get_ScaleYProperty: IDependencyProperty; safecall;
    function get_SkewXProperty: IDependencyProperty; safecall;
    function get_SkewYProperty: IDependencyProperty; safecall;
    function get_RotationProperty: IDependencyProperty; safecall;
    function get_TranslateXProperty: IDependencyProperty; safecall;
    function get_TranslateYProperty: IDependencyProperty; safecall;
    property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    property RotationProperty: IDependencyProperty read get_RotationProperty;
    property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
    property SkewXProperty: IDependencyProperty read get_SkewXProperty;
    property SkewYProperty: IDependencyProperty read get_SkewYProperty;
    property TranslateXProperty: IDependencyProperty read get_TranslateXProperty;
    property TranslateYProperty: IDependencyProperty read get_TranslateYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ICompositionTarget
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CompositionTarget)]
  ICompositionTarget = interface(IInspectable)
  ['{7D938324-E3AD-597C-93F6-520725410E68}']
  end;

  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRenderedEventArgs
  IRenderedEventArgs = interface(IInspectable)
  ['{B268B885-118D-5B66-8099-3B6BB8644726}']
    function get_FrameDuration: TimeSpan; safecall;
    property FrameDuration: TimeSpan read get_FrameDuration;
  end;

  // Generic Delegate for:
  // Windows.Foundation.EventHandler`1<Microsoft.UI.Xaml.Media.IRenderedEventArgs>
  EventHandler_1__IRenderedEventArgs_Delegate_Base = interface(IUnknown)
  ['{19A913F7-9793-5D2E-B989-7EE26C263A2E}']
    procedure Invoke(sender: IInspectable; args: IRenderedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.EventHandler`1<Microsoft.UI.Xaml.Media.IRenderedEventArgs>
  EventHandler_1__IRenderedEventArgs = interface(EventHandler_1__IRenderedEventArgs_Delegate_Base)
  ['{2FE212D6-5AD3-5538-98AA-FE6A09B62EF1}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ICompositionTargetStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_CompositionTarget)]
  ICompositionTargetStatics = interface(IInspectable)
  ['{12A4BE6F-6DB1-5165-B622-D57AB782745B}']
    function add_Rendering(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Rendering(token: EventRegistrationToken); safecall;
    function add_Rendered(handler: EventHandler_1__IRenderedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Rendered(token: EventRegistrationToken); safecall;
    function add_SurfaceContentsLost(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SurfaceContentsLost(token: EventRegistrationToken); safecall;
    function GetCompositorForCurrentThread: ICompositor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdrop
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_DesktopAcrylicBackdrop)]
  IDesktopAcrylicBackdrop = interface(IInspectable)
  ['{BFD9915B-82A6-5DF6-AFF0-A4824DDC1143}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdropFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_DesktopAcrylicBackdrop)]
  IDesktopAcrylicBackdropFactory = interface(IInspectable)
  ['{00922E6D-AE51-564A-BCE2-1973D5E463DD}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IDesktopAcrylicBackdrop; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IEllipseGeometry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_EllipseGeometry)]
  IEllipseGeometry = interface(IInspectable)
  ['{ABABD262-D8E4-5B49-BCE9-0108A5209D45}']
    function get_Center: TPointF; safecall;
    procedure put_Center(value: TPointF); safecall;
    function get_RadiusX: Double; safecall;
    procedure put_RadiusX(value: Double); safecall;
    function get_RadiusY: Double; safecall;
    procedure put_RadiusY(value: Double); safecall;
    property Center: TPointF read get_Center write put_Center;
    property RadiusX: Double read get_RadiusX write put_RadiusX;
    property RadiusY: Double read get_RadiusY write put_RadiusY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IEllipseGeometryStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_EllipseGeometry)]
  IEllipseGeometryStatics = interface(IInspectable)
  ['{E8A33C80-D72F-5248-A71F-4B70A0757F89}']
    function get_CenterProperty: IDependencyProperty; safecall;
    function get_RadiusXProperty: IDependencyProperty; safecall;
    function get_RadiusYProperty: IDependencyProperty; safecall;
    property CenterProperty: IDependencyProperty read get_CenterProperty;
    property RadiusXProperty: IDependencyProperty read get_RadiusXProperty;
    property RadiusYProperty: IDependencyProperty read get_RadiusYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IFontFamilyFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_FontFamily)]
  IFontFamilyFactory = interface(IInspectable)
  ['{61B88A77-D0F9-5E9E-8C28-EDA01FEDE22E}']
    function CreateInstanceWithName(familyName: HSTRING; baseInterface: IInspectable; out innerInterface: IInspectable): IFontFamily; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IFontFamilyStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_FontFamily)]
  IFontFamilyStatics = interface(IInspectable)
  ['{B3EADCEB-C471-58FE-93D0-D71B04A7FD54}']
    function get_XamlAutoFontFamily: IFontFamily; safecall;
    property XamlAutoFontFamily: IFontFamily read get_XamlAutoFontFamily;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeneralTransformFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GeneralTransform)]
  IGeneralTransformFactory = interface(IInspectable)
  ['{2F1025A3-5391-5D1B-8382-3CAAA1D26A96}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGeneralTransform; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeneralTransformOverrides
  IGeneralTransformOverrides = interface(IInspectable)
  ['{CE8970F1-83F8-543F-9CF5-439C461601F1}']
    function get_InverseCore: IGeneralTransform; safecall;
    function TryTransformCore(inPoint: TPointF; out outPoint: TPointF): Boolean; safecall;
    function TransformBoundsCore(rect: TRectF): TRectF; safecall;
    property InverseCore: IGeneralTransform read get_InverseCore;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeometryFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Geometry)]
  IGeometryFactory = interface(IInspectable)
  ['{4EDCD536-7949-548A-A9B1-6FF03B951CF3}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterator_1__IGeometry_Base = interface(IInspectable)
  ['{59D847F1-4B1B-5B2D-A2CB-23622E957DC0}']
    function get_Current: IGeometry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIGeometry): Cardinal; safecall;
    property Current: IGeometry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterator_1__IGeometry = interface(IIterator_1__IGeometry_Base)
  ['{9E98B9A3-7BA1-5FFE-9297-AF5C9716332E}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterable_1__IGeometry_Base = interface(IInspectable)
  ['{9B9B662C-FF40-5FB3-A558-84C2FFAB9037}']
    function First: IIterator_1__IGeometry; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGeometry>
  IIterable_1__IGeometry = interface(IIterable_1__IGeometry_Base)
  ['{D1A7FFB6-94B8-5B46-B2FF-18C06D4D55B5}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IGeometry>
  IVectorView_1__IGeometry = interface(IInspectable)
  ['{3085FB52-251A-5B59-9BD7-BA2F53448CB0}']
    function GetAt(index: Cardinal): IGeometry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IGeometry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIGeometry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGeometry>
  IVector_1__IGeometry_Base = interface(IInspectable)
  ['{62E3CCC0-41E4-5903-933B-FF9118B10FFD}']
    function GetAt(index: Cardinal): IGeometry; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IGeometry; safecall;
    function IndexOf(value: IGeometry; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IGeometry); safecall;
    procedure InsertAt(index: Cardinal; value: IGeometry); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IGeometry); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIGeometry): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIGeometry); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGeometry>
  IVector_1__IGeometry = interface(IVector_1__IGeometry_Base)
  ['{C498FDBF-1895-58FE-8D08-C6BD626ACE7A}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeometryGroup
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GeometryGroup)]
  IGeometryGroup = interface(IInspectable)
  ['{B4DDE569-EA96-5883-914C-EBB7D818DD3A}']
    function get_FillRule: FillRule; safecall;
    procedure put_FillRule(value: FillRule); safecall;
    function get_Children: IVector_1__IGeometry; safecall;
    procedure put_Children(value: IVector_1__IGeometry); safecall;
    property Children: IVector_1__IGeometry read get_Children write put_Children;
    property FillRule_: FillRule read get_FillRule write put_FillRule;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeometryGroupStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GeometryGroup)]
  IGeometryGroupStatics = interface(IInspectable)
  ['{56A23DA5-D015-568A-9F8B-11B125CFD9B4}']
    function get_FillRuleProperty: IDependencyProperty; safecall;
    function get_ChildrenProperty: IDependencyProperty; safecall;
    property ChildrenProperty: IDependencyProperty read get_ChildrenProperty;
    property FillRuleProperty: IDependencyProperty read get_FillRuleProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGeometryStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Geometry)]
  IGeometryStatics = interface(IInspectable)
  ['{349F78D0-4978-5742-B7D2-B34EA2C95600}']
    function get_Empty: IGeometry; safecall;
    function get_StandardFlatteningTolerance: Double; safecall;
    function get_TransformProperty: IDependencyProperty; safecall;
    property Empty: IGeometry read get_Empty;
    property StandardFlatteningTolerance: Double read get_StandardFlatteningTolerance;
    property TransformProperty: IDependencyProperty read get_TransformProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGradientStop
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GradientStop)]
  IGradientStop = interface(IInspectable)
  ['{48BCB039-E8E1-5743-94C3-F766011D3B5D}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_Offset: Double; safecall;
    procedure put_Offset(value: Double); safecall;
    property Color_: Color read get_Color write put_Color;
    property Offset: Double read get_Offset write put_Offset;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterator_1__IGradientStop_Base = interface(IInspectable)
  ['{42D46F68-DF94-58F9-8CDF-3D403E7DD1D3}']
    function get_Current: IGradientStop; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIGradientStop): Cardinal; safecall;
    property Current: IGradientStop read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterator_1__IGradientStop = interface(IIterator_1__IGradientStop_Base)
  ['{050ABA99-B406-55A6-BFB3-448CFBF9B8E0}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterable_1__IGradientStop_Base = interface(IInspectable)
  ['{6B443031-7F9F-5C5A-97A9-3FF557BEC586}']
    function First: IIterator_1__IGradientStop; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IIterable_1__IGradientStop = interface(IIterable_1__IGradientStop_Base)
  ['{21BC6B10-E851-50A8-AB94-AE8FD53ABDD9}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IVectorView_1__IGradientStop = interface(IInspectable)
  ['{E070ABAF-06AC-508D-8EBD-DA460AF41341}']
    function GetAt(index: Cardinal): IGradientStop; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IGradientStop; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIGradientStop): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IVector_1__IGradientStop_Base = interface(IInspectable)
  ['{A367363D-DEAF-5D2C-909C-41B0F259BA7C}']
    function GetAt(index: Cardinal): IGradientStop; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IGradientStop; safecall;
    function IndexOf(value: IGradientStop; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IGradientStop); safecall;
    procedure InsertAt(index: Cardinal; value: IGradientStop); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IGradientStop); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIGradientStop): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIGradientStop); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IVector_1__IGradientStop = interface(IVector_1__IGradientStop_Base)
  ['{269A5CE7-DEB2-5E4F-89F9-454E3CCA6330}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGradientBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GradientBrush)]
  IGradientBrush = interface(IInspectable)
  ['{77C347FA-C4C4-5174-A945-65CAB3AA1C75}']
    function get_SpreadMethod: GradientSpreadMethod; safecall;
    procedure put_SpreadMethod(value: GradientSpreadMethod); safecall;
    function get_MappingMode: BrushMappingMode; safecall;
    procedure put_MappingMode(value: BrushMappingMode); safecall;
    function get_ColorInterpolationMode: ColorInterpolationMode; safecall;
    procedure put_ColorInterpolationMode(value: ColorInterpolationMode); safecall;
    function get_GradientStops: IVector_1__IGradientStop; safecall;
    procedure put_GradientStops(value: IVector_1__IGradientStop); safecall;
    property ColorInterpolationMode_: ColorInterpolationMode read get_ColorInterpolationMode write put_ColorInterpolationMode;
    property GradientStops: IVector_1__IGradientStop read get_GradientStops write put_GradientStops;
    property MappingMode: BrushMappingMode read get_MappingMode write put_MappingMode;
    property SpreadMethod: GradientSpreadMethod read get_SpreadMethod write put_SpreadMethod;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGradientBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GradientBrush)]
  IGradientBrushFactory = interface(IInspectable)
  ['{64FF6177-1EDA-565B-B7AA-AC50152E3136}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGradientBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGradientBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GradientBrush)]
  IGradientBrushStatics = interface(IInspectable)
  ['{4D3697D7-C6DB-501C-8FA2-DA30B8C8CA3B}']
    function get_SpreadMethodProperty: IDependencyProperty; safecall;
    function get_MappingModeProperty: IDependencyProperty; safecall;
    function get_ColorInterpolationModeProperty: IDependencyProperty; safecall;
    function get_GradientStopsProperty: IDependencyProperty; safecall;
    property ColorInterpolationModeProperty: IDependencyProperty read get_ColorInterpolationModeProperty;
    property GradientStopsProperty: IDependencyProperty read get_GradientStopsProperty;
    property MappingModeProperty: IDependencyProperty read get_MappingModeProperty;
    property SpreadMethodProperty: IDependencyProperty read get_SpreadMethodProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IGradientStopStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_GradientStop)]
  IGradientStopStatics = interface(IInspectable)
  ['{0B566C1B-37DE-5BFD-B419-0F7C4C0A0523}']
    function get_ColorProperty: IDependencyProperty; safecall;
    function get_OffsetProperty: IDependencyProperty; safecall;
    property ColorProperty: IDependencyProperty read get_ColorProperty;
    property OffsetProperty: IDependencyProperty read get_OffsetProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IImageBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ImageBrush)]
  IImageBrushStatics = interface(IInspectable)
  ['{CE8082DC-A505-5B4F-8861-79630F52C189}']
    function get_ImageSourceProperty: IDependencyProperty; safecall;
    property ImageSourceProperty: IDependencyProperty read get_ImageSourceProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IImageSourceFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ImageSource)]
  IImageSourceFactory = interface(IInspectable)
  ['{0B1E64A3-E353-5901-B84B-AE9842AEA5CD}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILineGeometry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LineGeometry)]
  ILineGeometry = interface(IInspectable)
  ['{467EF3C5-BC43-50ED-BB23-16BE2C63356E}']
    function get_StartPoint: TPointF; safecall;
    procedure put_StartPoint(value: TPointF); safecall;
    function get_EndPoint: TPointF; safecall;
    procedure put_EndPoint(value: TPointF); safecall;
    property EndPoint: TPointF read get_EndPoint write put_EndPoint;
    property StartPoint: TPointF read get_StartPoint write put_StartPoint;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILineGeometryStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LineGeometry)]
  ILineGeometryStatics = interface(IInspectable)
  ['{CE0ECBF3-9389-5304-B7C8-5E610902F258}']
    function get_StartPointProperty: IDependencyProperty; safecall;
    function get_EndPointProperty: IDependencyProperty; safecall;
    property EndPointProperty: IDependencyProperty read get_EndPointProperty;
    property StartPointProperty: IDependencyProperty read get_StartPointProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILineSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LineSegment)]
  ILineSegment = interface(IInspectable)
  ['{0C618E54-D883-588C-8875-BD8DFD6A6A3E}']
    function get_Point: TPointF; safecall;
    procedure put_Point(value: TPointF); safecall;
    property Point: TPointF read get_Point write put_Point;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILineSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LineSegment)]
  ILineSegmentStatics = interface(IInspectable)
  ['{C3EC48A9-B9C0-561F-9925-D1D1B2A6BAE6}']
    function get_PointProperty: IDependencyProperty; safecall;
    property PointProperty: IDependencyProperty read get_PointProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILinearGradientBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LinearGradientBrush)]
  ILinearGradientBrush = interface(IInspectable)
  ['{C0AB9638-1BD9-5FA4-9649-48CFA12F0D1E}']
    function get_StartPoint: TPointF; safecall;
    procedure put_StartPoint(value: TPointF); safecall;
    function get_EndPoint: TPointF; safecall;
    procedure put_EndPoint(value: TPointF); safecall;
    property EndPoint: TPointF read get_EndPoint write put_EndPoint;
    property StartPoint: TPointF read get_StartPoint write put_StartPoint;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILinearGradientBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LinearGradientBrush)]
  ILinearGradientBrushFactory = interface(IInspectable)
  ['{C0BA7DE3-CCFD-534C-882F-3AB39AE723F3}']
    function CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection: IVector_1__IGradientStop; angle: Double): ILinearGradientBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILinearGradientBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LinearGradientBrush)]
  ILinearGradientBrushStatics = interface(IInspectable)
  ['{DF029E84-F6BE-5B7E-BA22-3B4E7A6BCEEE}']
    function get_StartPointProperty: IDependencyProperty; safecall;
    function get_EndPointProperty: IDependencyProperty; safecall;
    property EndPointProperty: IDependencyProperty read get_EndPointProperty;
    property StartPointProperty: IDependencyProperty read get_StartPointProperty;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs
  ILoadedImageSourceLoadCompletedEventArgs = interface(IInspectable)
  ['{4121BB7C-48E8-542D-B950-3EA7E709C0D6}']
    function get_Status: LoadedImageSourceLoadStatus; safecall;
    property Status: LoadedImageSourceLoadStatus read get_Status;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.ILoadedImageSurface,Microsoft.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs>
  TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E7919D99-F152-5645-A8FE-A3A6739E0F03}']
    procedure Invoke(sender: ILoadedImageSurface; args: ILoadedImageSourceLoadCompletedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.ILoadedImageSurface,Microsoft.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs>
  TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs = interface(TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs_Delegate_Base)
  ['{80AA1360-CC0C-5478-BA8B-D9D6907A0B1B}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILoadedImageSurface
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LoadedImageSurface)]
  ILoadedImageSurface = interface(IInspectable)
  ['{B5275540-1706-5851-95CC-498EE81FB183}']
    function get_DecodedPhysicalSize: TSizeF; safecall;
    function get_DecodedSize: TSizeF; safecall;
    function get_NaturalSize: TSizeF; safecall;
    function add_LoadCompleted(handler: TypedEventHandler_2__ILoadedImageSurface__ILoadedImageSourceLoadCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_LoadCompleted(token: EventRegistrationToken); safecall;
    property DecodedPhysicalSize: TSizeF read get_DecodedPhysicalSize;
    property DecodedSize: TSizeF read get_DecodedSize;
    property NaturalSize: TSizeF read get_NaturalSize;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ILoadedImageSurfaceStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_LoadedImageSurface)]
  ILoadedImageSurfaceStatics = interface(IInspectable)
  ['{25D390C4-4E32-52C2-868F-F2EDE74EE442}']
    function StartLoadFromUri(uri: IUriRuntimeClass; desiredMaxSize: TSizeF): ILoadedImageSurface; overload; safecall;
    function StartLoadFromUri(uri: IUriRuntimeClass): ILoadedImageSurface; overload; safecall;
    function StartLoadFromStream(stream: IRandomAccessStream; desiredMaxSize: TSizeF): ILoadedImageSurface; overload; safecall;
    function StartLoadFromStream(stream: IRandomAccessStream): ILoadedImageSurface; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrix3DProjection
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Matrix3DProjection)]
  IMatrix3DProjection = interface(IInspectable)
  ['{FC3338EF-F390-5BB1-932E-3B7C08788187}']
    function get_ProjectionMatrix: Media3D_Matrix3D; safecall;
    procedure put_ProjectionMatrix(value: Media3D_Matrix3D); safecall;
    property ProjectionMatrix: Media3D_Matrix3D read get_ProjectionMatrix write put_ProjectionMatrix;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrix3DProjectionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Matrix3DProjection)]
  IMatrix3DProjectionStatics = interface(IInspectable)
  ['{A5A7E267-7A5D-58EF-A8CD-B88EBDF82207}']
    function get_ProjectionMatrixProperty: IDependencyProperty; safecall;
    property ProjectionMatrixProperty: IDependencyProperty read get_ProjectionMatrixProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrixHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MatrixHelper)]
  IMatrixHelper = interface(IInspectable)
  ['{9571FD76-CC5C-534D-AC85-CB4AC870C912}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrixHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MatrixHelper)]
  IMatrixHelperStatics = interface(IInspectable)
  ['{5762CF6B-4FB0-532F-8368-DE960042701F}']
    function get_Identity: Matrix; safecall;
    function FromElements(m11: Double; m12: Double; m21: Double; m22: Double; offsetX: Double; offsetY: Double): Matrix; safecall;
    function GetIsIdentity(target: Matrix): Boolean; safecall;
    function Transform(target: Matrix; point: TPointF): TPointF; safecall;
    property Identity: Matrix read get_Identity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrixTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MatrixTransform)]
  IMatrixTransform = interface(IInspectable)
  ['{F03138E1-ADDD-59FA-B993-3EA69B888ACE}']
    function get_Matrix: Matrix; safecall;
    procedure put_Matrix(value: Matrix); safecall;
    property Matrix_: Matrix read get_Matrix write put_Matrix;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMatrixTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MatrixTransform)]
  IMatrixTransformStatics = interface(IInspectable)
  ['{D7DB9DE3-5071-5115-98FB-CCAD2FD46E44}']
    function get_MatrixProperty: IDependencyProperty; safecall;
    property MatrixProperty: IDependencyProperty read get_MatrixProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMicaBackdrop
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MicaBackdrop)]
  IMicaBackdrop = interface(IInspectable)
  ['{C156A404-3DAC-593A-B1F3-7A33C289DC83}']
    function get_Kind: SystemBackdrops_MicaKind; safecall;
    procedure put_Kind(value: SystemBackdrops_MicaKind); safecall;
    property Kind: SystemBackdrops_MicaKind read get_Kind write put_Kind;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMicaBackdropFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MicaBackdrop)]
  IMicaBackdropFactory = interface(IInspectable)
  ['{774379CE-74BD-59D4-849D-D99C4184D838}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IMicaBackdrop; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IMicaBackdropStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_MicaBackdrop)]
  IMicaBackdropStatics = interface(IInspectable)
  ['{A63ABDCE-C796-5509-9F4D-072BC1E599F1}']
    function get_KindProperty: IDependencyProperty; safecall;
    property KindProperty: IDependencyProperty read get_KindProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathSegment)]
  IPathSegment = interface(IInspectable)
  ['{B922EBBE-08F0-57E9-8785-7E57097F3BD4}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterator_1__IPathSegment_Base = interface(IInspectable)
  ['{434E1321-9560-5646-8BF7-E1B06796723F}']
    function get_Current: IPathSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPathSegment): Cardinal; safecall;
    property Current: IPathSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterator_1__IPathSegment = interface(IIterator_1__IPathSegment_Base)
  ['{F6F64E9E-106B-5A4D-8A22-F8629E47E45E}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterable_1__IPathSegment_Base = interface(IInspectable)
  ['{FCC860CD-04A1-5B10-8727-DEB2FA51A96B}']
    function First: IIterator_1__IPathSegment; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IIterable_1__IPathSegment = interface(IIterable_1__IPathSegment_Base)
  ['{FFE4AB98-EA67-53C0-8F44-F4096257D1D2}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IVectorView_1__IPathSegment = interface(IInspectable)
  ['{8DB36361-DC10-5500-80AB-BB40FEA84DC2}']
    function GetAt(index: Cardinal): IPathSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPathSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPathSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IVector_1__IPathSegment_Base = interface(IInspectable)
  ['{DBBFF207-32F0-56FA-B2D8-D4C8E8343ED0}']
    function GetAt(index: Cardinal): IPathSegment; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPathSegment; safecall;
    function IndexOf(value: IPathSegment; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPathSegment); safecall;
    procedure InsertAt(index: Cardinal; value: IPathSegment); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPathSegment); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPathSegment): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPathSegment); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathSegment>
  IVector_1__IPathSegment = interface(IVector_1__IPathSegment_Base)
  ['{5538EDC9-E024-5453-8DA6-611AD9E36AB6}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathFigure
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathFigure)]
  IPathFigure = interface(IInspectable)
  ['{0EE00712-BF65-5F27-9C06-14ABDF6656D7}']
    function get_Segments: IVector_1__IPathSegment; safecall;
    procedure put_Segments(value: IVector_1__IPathSegment); safecall;
    function get_StartPoint: TPointF; safecall;
    procedure put_StartPoint(value: TPointF); safecall;
    function get_IsClosed: Boolean; safecall;
    procedure put_IsClosed(value: Boolean); safecall;
    function get_IsFilled: Boolean; safecall;
    procedure put_IsFilled(value: Boolean); safecall;
    property IsClosed: Boolean read get_IsClosed write put_IsClosed;
    property IsFilled: Boolean read get_IsFilled write put_IsFilled;
    property Segments: IVector_1__IPathSegment read get_Segments write put_Segments;
    property StartPoint: TPointF read get_StartPoint write put_StartPoint;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathFigureStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathFigure)]
  IPathFigureStatics = interface(IInspectable)
  ['{93BC33C4-879A-5EDB-B8D7-7ECB861A7314}']
    function get_SegmentsProperty: IDependencyProperty; safecall;
    function get_StartPointProperty: IDependencyProperty; safecall;
    function get_IsClosedProperty: IDependencyProperty; safecall;
    function get_IsFilledProperty: IDependencyProperty; safecall;
    property IsClosedProperty: IDependencyProperty read get_IsClosedProperty;
    property IsFilledProperty: IDependencyProperty read get_IsFilledProperty;
    property SegmentsProperty: IDependencyProperty read get_SegmentsProperty;
    property StartPointProperty: IDependencyProperty read get_StartPointProperty;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterator_1__IPathFigure_Base = interface(IInspectable)
  ['{0C15C679-2952-5FCD-BFB3-C9064C650072}']
    function get_Current: IPathFigure; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPathFigure): Cardinal; safecall;
    property Current: IPathFigure read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterator_1__IPathFigure = interface(IIterator_1__IPathFigure_Base)
  ['{D69C3F4B-21C4-5EA7-A77C-C707AF0901D3}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterable_1__IPathFigure_Base = interface(IInspectable)
  ['{387967CE-013F-57F5-9A6F-4CA596B0D80A}']
    function First: IIterator_1__IPathFigure; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IIterable_1__IPathFigure = interface(IIterable_1__IPathFigure_Base)
  ['{FB120BAD-47D9-5E66-98FD-2FD844C29825}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IVectorView_1__IPathFigure = interface(IInspectable)
  ['{9B886A75-D948-5F04-9477-61B3EB39488B}']
    function GetAt(index: Cardinal): IPathFigure; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPathFigure; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPathFigure): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IVector_1__IPathFigure_Base = interface(IInspectable)
  ['{FF221C4A-9A65-544F-86CD-0C07BCC48F8A}']
    function GetAt(index: Cardinal): IPathFigure; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPathFigure; safecall;
    function IndexOf(value: IPathFigure; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPathFigure); safecall;
    procedure InsertAt(index: Cardinal; value: IPathFigure); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPathFigure); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPathFigure): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPathFigure); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.IPathFigure>
  IVector_1__IPathFigure = interface(IVector_1__IPathFigure_Base)
  ['{DB7BEEEC-D69A-51E0-90C1-3D54805C1394}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathGeometry
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathGeometry)]
  IPathGeometry = interface(IInspectable)
  ['{11B9D95D-D3D9-5337-A05C-73A27A2B5124}']
    function get_FillRule: FillRule; safecall;
    procedure put_FillRule(value: FillRule); safecall;
    function get_Figures: IVector_1__IPathFigure; safecall;
    procedure put_Figures(value: IVector_1__IPathFigure); safecall;
    property Figures: IVector_1__IPathFigure read get_Figures write put_Figures;
    property FillRule_: FillRule read get_FillRule write put_FillRule;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathGeometryStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathGeometry)]
  IPathGeometryStatics = interface(IInspectable)
  ['{D7F408FE-6C3A-5CCE-91CC-C5A95D4B345A}']
    function get_FillRuleProperty: IDependencyProperty; safecall;
    function get_FiguresProperty: IDependencyProperty; safecall;
    property FiguresProperty: IDependencyProperty read get_FiguresProperty;
    property FillRuleProperty: IDependencyProperty read get_FillRuleProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPathSegmentFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PathSegment)]
  IPathSegmentFactory = interface(IInspectable)
  ['{0559A4FF-AC4B-5BB7-B541-D373960E083B}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPlaneProjection
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PlaneProjection)]
  IPlaneProjection = interface(IInspectable)
  ['{D3E22836-0322-5D75-941C-A5FFB05192B2}']
    function get_LocalOffsetX: Double; safecall;
    procedure put_LocalOffsetX(value: Double); safecall;
    function get_LocalOffsetY: Double; safecall;
    procedure put_LocalOffsetY(value: Double); safecall;
    function get_LocalOffsetZ: Double; safecall;
    procedure put_LocalOffsetZ(value: Double); safecall;
    function get_RotationX: Double; safecall;
    procedure put_RotationX(value: Double); safecall;
    function get_RotationY: Double; safecall;
    procedure put_RotationY(value: Double); safecall;
    function get_RotationZ: Double; safecall;
    procedure put_RotationZ(value: Double); safecall;
    function get_CenterOfRotationX: Double; safecall;
    procedure put_CenterOfRotationX(value: Double); safecall;
    function get_CenterOfRotationY: Double; safecall;
    procedure put_CenterOfRotationY(value: Double); safecall;
    function get_CenterOfRotationZ: Double; safecall;
    procedure put_CenterOfRotationZ(value: Double); safecall;
    function get_GlobalOffsetX: Double; safecall;
    procedure put_GlobalOffsetX(value: Double); safecall;
    function get_GlobalOffsetY: Double; safecall;
    procedure put_GlobalOffsetY(value: Double); safecall;
    function get_GlobalOffsetZ: Double; safecall;
    procedure put_GlobalOffsetZ(value: Double); safecall;
    function get_ProjectionMatrix: Media3D_Matrix3D; safecall;
    property CenterOfRotationX: Double read get_CenterOfRotationX write put_CenterOfRotationX;
    property CenterOfRotationY: Double read get_CenterOfRotationY write put_CenterOfRotationY;
    property CenterOfRotationZ: Double read get_CenterOfRotationZ write put_CenterOfRotationZ;
    property GlobalOffsetX: Double read get_GlobalOffsetX write put_GlobalOffsetX;
    property GlobalOffsetY: Double read get_GlobalOffsetY write put_GlobalOffsetY;
    property GlobalOffsetZ: Double read get_GlobalOffsetZ write put_GlobalOffsetZ;
    property LocalOffsetX: Double read get_LocalOffsetX write put_LocalOffsetX;
    property LocalOffsetY: Double read get_LocalOffsetY write put_LocalOffsetY;
    property LocalOffsetZ: Double read get_LocalOffsetZ write put_LocalOffsetZ;
    property ProjectionMatrix: Media3D_Matrix3D read get_ProjectionMatrix;
    property RotationX: Double read get_RotationX write put_RotationX;
    property RotationY: Double read get_RotationY write put_RotationY;
    property RotationZ: Double read get_RotationZ write put_RotationZ;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPlaneProjectionStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PlaneProjection)]
  IPlaneProjectionStatics = interface(IInspectable)
  ['{96D86C18-90DD-564A-828A-8735E4219B1D}']
    function get_LocalOffsetXProperty: IDependencyProperty; safecall;
    function get_LocalOffsetYProperty: IDependencyProperty; safecall;
    function get_LocalOffsetZProperty: IDependencyProperty; safecall;
    function get_RotationXProperty: IDependencyProperty; safecall;
    function get_RotationYProperty: IDependencyProperty; safecall;
    function get_RotationZProperty: IDependencyProperty; safecall;
    function get_CenterOfRotationXProperty: IDependencyProperty; safecall;
    function get_CenterOfRotationYProperty: IDependencyProperty; safecall;
    function get_CenterOfRotationZProperty: IDependencyProperty; safecall;
    function get_GlobalOffsetXProperty: IDependencyProperty; safecall;
    function get_GlobalOffsetYProperty: IDependencyProperty; safecall;
    function get_GlobalOffsetZProperty: IDependencyProperty; safecall;
    function get_ProjectionMatrixProperty: IDependencyProperty; safecall;
    property CenterOfRotationXProperty: IDependencyProperty read get_CenterOfRotationXProperty;
    property CenterOfRotationYProperty: IDependencyProperty read get_CenterOfRotationYProperty;
    property CenterOfRotationZProperty: IDependencyProperty read get_CenterOfRotationZProperty;
    property GlobalOffsetXProperty: IDependencyProperty read get_GlobalOffsetXProperty;
    property GlobalOffsetYProperty: IDependencyProperty read get_GlobalOffsetYProperty;
    property GlobalOffsetZProperty: IDependencyProperty read get_GlobalOffsetZProperty;
    property LocalOffsetXProperty: IDependencyProperty read get_LocalOffsetXProperty;
    property LocalOffsetYProperty: IDependencyProperty read get_LocalOffsetYProperty;
    property LocalOffsetZProperty: IDependencyProperty read get_LocalOffsetZProperty;
    property ProjectionMatrixProperty: IDependencyProperty read get_ProjectionMatrixProperty;
    property RotationXProperty: IDependencyProperty read get_RotationXProperty;
    property RotationYProperty: IDependencyProperty read get_RotationYProperty;
    property RotationZProperty: IDependencyProperty read get_RotationZProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyBezierSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyBezierSegment)]
  IPolyBezierSegment = interface(IInspectable)
  ['{D7F760A0-B93A-562A-8118-6330ED22C307}']
    function get_Points: IVector_1__Point; safecall;
    procedure put_Points(value: IVector_1__Point); safecall;
    property Points: IVector_1__Point read get_Points write put_Points;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyBezierSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyBezierSegment)]
  IPolyBezierSegmentStatics = interface(IInspectable)
  ['{738EF089-A80F-53E0-816F-F787A4461907}']
    function get_PointsProperty: IDependencyProperty; safecall;
    property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyLineSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyLineSegment)]
  IPolyLineSegment = interface(IInspectable)
  ['{426EF287-0287-536F-AD9E-6A05ECBB323A}']
    function get_Points: IVector_1__Point; safecall;
    procedure put_Points(value: IVector_1__Point); safecall;
    property Points: IVector_1__Point read get_Points write put_Points;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyLineSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyLineSegment)]
  IPolyLineSegmentStatics = interface(IInspectable)
  ['{CF54E568-101A-5349-9189-6F9A1E7F5280}']
    function get_PointsProperty: IDependencyProperty; safecall;
    property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyQuadraticBezierSegment)]
  IPolyQuadraticBezierSegment = interface(IInspectable)
  ['{56372F4C-C531-5C3E-B0E0-1645F5A8D872}']
    function get_Points: IVector_1__Point; safecall;
    procedure put_Points(value: IVector_1__Point); safecall;
    property Points: IVector_1__Point read get_Points write put_Points;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_PolyQuadraticBezierSegment)]
  IPolyQuadraticBezierSegmentStatics = interface(IInspectable)
  ['{7EB6374D-CD30-5507-B2AB-C4E3A7DC60BF}']
    function get_PointsProperty: IDependencyProperty; safecall;
    property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IProjectionFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Projection)]
  IProjectionFactory = interface(IInspectable)
  ['{870EA34F-DB61-5B75-89AD-E0480C802937}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IProjection; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IQuadraticBezierSegment
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_QuadraticBezierSegment)]
  IQuadraticBezierSegment = interface(IInspectable)
  ['{6048ABE4-7A12-5195-BD61-71DFD0361C38}']
    function get_Point1: TPointF; safecall;
    procedure put_Point1(value: TPointF); safecall;
    function get_Point2: TPointF; safecall;
    procedure put_Point2(value: TPointF); safecall;
    property Point1: TPointF read get_Point1 write put_Point1;
    property Point2: TPointF read get_Point2 write put_Point2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IQuadraticBezierSegmentStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_QuadraticBezierSegment)]
  IQuadraticBezierSegmentStatics = interface(IInspectable)
  ['{4D56EA65-0A1A-528A-A5B6-41DA03AC71F4}']
    function get_Point1Property: IDependencyProperty; safecall;
    function get_Point2Property: IDependencyProperty; safecall;
    property Point1Property: IDependencyProperty read get_Point1Property;
    property Point2Property: IDependencyProperty read get_Point2Property;
  end;

  // Generic Delegate for:
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Microsoft.UI.Xaml.Media.IGradientStop>
  VectorChangedEventHandler_1__IGradientStop_Delegate_Base = interface(IUnknown)
  ['{6DBF1655-6D00-5C55-993C-B1A384FA75CE}']
    procedure Invoke(sender: IObservableVector_1__IGradientStop; event: IVectorChangedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Microsoft.UI.Xaml.Media.IGradientStop>
  VectorChangedEventHandler_1__IGradientStop = interface(VectorChangedEventHandler_1__IGradientStop_Delegate_Base)
  ['{4CE56628-E11A-5322-8635-321BD49CC61F}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IObservableVector`1<Microsoft.UI.Xaml.Media.IGradientStop>
  IObservableVector_1__IGradientStop = interface(IInspectable)
  ['{78EC4010-363B-5598-9DF6-64B0C53638E2}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__IGradientStop): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRadialGradientBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RadialGradientBrush)]
  IRadialGradientBrush = interface(IInspectable)
  ['{5D493CE1-B844-546A-B772-B3BCBA7E98EE}']
    function get_Center: TPointF; safecall;
    procedure put_Center(value: TPointF); safecall;
    function get_RadiusX: Double; safecall;
    procedure put_RadiusX(value: Double); safecall;
    function get_RadiusY: Double; safecall;
    procedure put_RadiusY(value: Double); safecall;
    function get_GradientOrigin: TPointF; safecall;
    procedure put_GradientOrigin(value: TPointF); safecall;
    function get_MappingMode: BrushMappingMode; safecall;
    procedure put_MappingMode(value: BrushMappingMode); safecall;
    function get_InterpolationSpace: CompositionColorSpace; safecall;
    procedure put_InterpolationSpace(value: CompositionColorSpace); safecall;
    function get_SpreadMethod: GradientSpreadMethod; safecall;
    procedure put_SpreadMethod(value: GradientSpreadMethod); safecall;
    function get_GradientStops: IObservableVector_1__IGradientStop; safecall;
    property Center: TPointF read get_Center write put_Center;
    property GradientOrigin: TPointF read get_GradientOrigin write put_GradientOrigin;
    property GradientStops: IObservableVector_1__IGradientStop read get_GradientStops;
    property InterpolationSpace: CompositionColorSpace read get_InterpolationSpace write put_InterpolationSpace;
    property MappingMode: BrushMappingMode read get_MappingMode write put_MappingMode;
    property RadiusX: Double read get_RadiusX write put_RadiusX;
    property RadiusY: Double read get_RadiusY write put_RadiusY;
    property SpreadMethod: GradientSpreadMethod read get_SpreadMethod write put_SpreadMethod;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRadialGradientBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RadialGradientBrush)]
  IRadialGradientBrushFactory = interface(IInspectable)
  ['{D90BA26E-9E67-54BD-A2D9-61C8F9F1D433}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IRadialGradientBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRadialGradientBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RadialGradientBrush)]
  IRadialGradientBrushStatics = interface(IInspectable)
  ['{F275A0B8-66F9-5B7D-A415-7EDA65FE6DD3}']
    function get_CenterProperty: IDependencyProperty; safecall;
    function get_RadiusXProperty: IDependencyProperty; safecall;
    function get_RadiusYProperty: IDependencyProperty; safecall;
    function get_GradientOriginProperty: IDependencyProperty; safecall;
    function get_InterpolationSpaceProperty: IDependencyProperty; safecall;
    function get_MappingModeProperty: IDependencyProperty; safecall;
    function get_SpreadMethodProperty: IDependencyProperty; safecall;
    property CenterProperty: IDependencyProperty read get_CenterProperty;
    property GradientOriginProperty: IDependencyProperty read get_GradientOriginProperty;
    property InterpolationSpaceProperty: IDependencyProperty read get_InterpolationSpaceProperty;
    property MappingModeProperty: IDependencyProperty read get_MappingModeProperty;
    property RadiusXProperty: IDependencyProperty read get_RadiusXProperty;
    property RadiusYProperty: IDependencyProperty read get_RadiusYProperty;
    property SpreadMethodProperty: IDependencyProperty read get_SpreadMethodProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRectangleGeometryStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RectangleGeometry)]
  IRectangleGeometryStatics = interface(IInspectable)
  ['{1AE7AC26-8A8B-55A5-B035-586E2B642919}']
    function get_RectProperty: IDependencyProperty; safecall;
    property RectProperty: IDependencyProperty read get_RectProperty;
  end;

  // Microsoft.UI.Xaml.Media.IRenderingEventArgs
  IRenderingEventArgs = interface(IInspectable)
  ['{A67C8F8D-1885-5FC9-975C-901224F79B1E}']
    function get_RenderingTime: TimeSpan; safecall;
    property RenderingTime: TimeSpan read get_RenderingTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRotateTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RotateTransform)]
  IRotateTransform = interface(IInspectable)
  ['{D4686E7C-A374-5CAC-8927-0EF07C5B254D}']
    function get_CenterX: Double; safecall;
    procedure put_CenterX(value: Double); safecall;
    function get_CenterY: Double; safecall;
    procedure put_CenterY(value: Double); safecall;
    function get_Angle: Double; safecall;
    procedure put_Angle(value: Double); safecall;
    property Angle: Double read get_Angle write put_Angle;
    property CenterX: Double read get_CenterX write put_CenterX;
    property CenterY: Double read get_CenterY write put_CenterY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IRotateTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_RotateTransform)]
  IRotateTransformStatics = interface(IInspectable)
  ['{8EC4C662-04F8-51D7-BCB2-17F10C2FAA38}']
    function get_CenterXProperty: IDependencyProperty; safecall;
    function get_CenterYProperty: IDependencyProperty; safecall;
    function get_AngleProperty: IDependencyProperty; safecall;
    property AngleProperty: IDependencyProperty read get_AngleProperty;
    property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    property CenterYProperty: IDependencyProperty read get_CenterYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IScaleTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ScaleTransform)]
  IScaleTransform = interface(IInspectable)
  ['{94B064A4-34F0-5EF9-8B67-444F5699F52A}']
    function get_CenterX: Double; safecall;
    procedure put_CenterX(value: Double); safecall;
    function get_CenterY: Double; safecall;
    procedure put_CenterY(value: Double); safecall;
    function get_ScaleX: Double; safecall;
    procedure put_ScaleX(value: Double); safecall;
    function get_ScaleY: Double; safecall;
    procedure put_ScaleY(value: Double); safecall;
    property CenterX: Double read get_CenterX write put_CenterX;
    property CenterY: Double read get_CenterY write put_CenterY;
    property ScaleX: Double read get_ScaleX write put_ScaleX;
    property ScaleY: Double read get_ScaleY write put_ScaleY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IScaleTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ScaleTransform)]
  IScaleTransformStatics = interface(IInspectable)
  ['{76485BD5-A5BF-5790-A837-8193C84DF353}']
    function get_CenterXProperty: IDependencyProperty; safecall;
    function get_CenterYProperty: IDependencyProperty; safecall;
    function get_ScaleXProperty: IDependencyProperty; safecall;
    function get_ScaleYProperty: IDependencyProperty; safecall;
    property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IShadowFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Shadow)]
  IShadowFactory = interface(IInspectable)
  ['{C9115FBB-FCC3-52BF-B8EE-C348102A46E0}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISkewTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SkewTransform)]
  ISkewTransform = interface(IInspectable)
  ['{230ABAA6-A9B6-5210-873F-36BEA29D7C06}']
    function get_CenterX: Double; safecall;
    procedure put_CenterX(value: Double); safecall;
    function get_CenterY: Double; safecall;
    procedure put_CenterY(value: Double); safecall;
    function get_AngleX: Double; safecall;
    procedure put_AngleX(value: Double); safecall;
    function get_AngleY: Double; safecall;
    procedure put_AngleY(value: Double); safecall;
    property AngleX: Double read get_AngleX write put_AngleX;
    property AngleY: Double read get_AngleY write put_AngleY;
    property CenterX: Double read get_CenterX write put_CenterX;
    property CenterY: Double read get_CenterY write put_CenterY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISkewTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SkewTransform)]
  ISkewTransformStatics = interface(IInspectable)
  ['{93265150-53D0-52E3-88A3-3D93E2ED861A}']
    function get_CenterXProperty: IDependencyProperty; safecall;
    function get_CenterYProperty: IDependencyProperty; safecall;
    function get_AngleXProperty: IDependencyProperty; safecall;
    function get_AngleYProperty: IDependencyProperty; safecall;
    property AngleXProperty: IDependencyProperty read get_AngleXProperty;
    property AngleYProperty: IDependencyProperty read get_AngleYProperty;
    property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    property CenterYProperty: IDependencyProperty read get_CenterYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISolidColorBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SolidColorBrush)]
  ISolidColorBrushFactory = interface(IInspectable)
  ['{7B559384-4DAA-54F4-91EF-33A23FD816CA}']
    function CreateInstanceWithColor(color: Color): ISolidColorBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISolidColorBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SolidColorBrush)]
  ISolidColorBrushStatics = interface(IInspectable)
  ['{6BC16DA0-C4E6-59B8-995B-B31E48424C07}']
    function get_ColorProperty: IDependencyProperty; safecall;
    property ColorProperty: IDependencyProperty read get_ColorProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISystemBackdropFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_SystemBackdrop)]
  ISystemBackdropFactory = interface(IInspectable)
  ['{1E07656B-FAD2-5B29-913F-B6748BC45942}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ISystemBackdrop; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ISystemBackdropOverrides
  ISystemBackdropOverrides = interface(IInspectable)
  ['{EB1F5399-CAD7-5611-B637-09D76A07E708}']
    procedure OnTargetConnected(connectedTarget: ICompositionSupportsSystemBackdrop; xamlRoot: IXamlRoot); safecall;
    procedure OnTargetDisconnected(disconnectedTarget: ICompositionSupportsSystemBackdrop); safecall;
    procedure OnDefaultSystemBackdropConfigurationChanged(target: ICompositionSupportsSystemBackdrop; xamlRoot: IXamlRoot); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IThemeShadow
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ThemeShadow)]
  IThemeShadow = interface(IInspectable)
  ['{C264208A-D1F4-58AE-8A88-FC59148BEE69}']
    function get_Receivers: IVector_1__IUIElement; safecall;
    property Receivers: IVector_1__IUIElement read get_Receivers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IThemeShadowFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_ThemeShadow)]
  IThemeShadowFactory = interface(IInspectable)
  ['{704A9C96-76A0-569E-8CEB-34E92A23FE11}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IThemeShadow; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITileBrush
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TileBrush)]
  ITileBrush = interface(IInspectable)
  ['{EE46060D-CABC-505D-883C-75D2E0E45875}']
    function get_AlignmentX: AlignmentX; safecall;
    procedure put_AlignmentX(value: AlignmentX); safecall;
    function get_AlignmentY: AlignmentY; safecall;
    procedure put_AlignmentY(value: AlignmentY); safecall;
    function get_Stretch: Stretch; safecall;
    procedure put_Stretch(value: Stretch); safecall;
    property AlignmentX_: AlignmentX read get_AlignmentX write put_AlignmentX;
    property AlignmentY_: AlignmentY read get_AlignmentY write put_AlignmentY;
    property Stretch_: Stretch read get_Stretch write put_Stretch;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITileBrushFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TileBrush)]
  ITileBrushFactory = interface(IInspectable)
  ['{8542E5E6-5177-506F-8A3B-AA7DA651F099}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ITileBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITileBrushStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TileBrush)]
  ITileBrushStatics = interface(IInspectable)
  ['{F402197B-9047-5F8A-90BC-6F5D8C748A5F}']
    function get_AlignmentXProperty: IDependencyProperty; safecall;
    function get_AlignmentYProperty: IDependencyProperty; safecall;
    function get_StretchProperty: IDependencyProperty; safecall;
    property AlignmentXProperty: IDependencyProperty read get_AlignmentXProperty;
    property AlignmentYProperty: IDependencyProperty read get_AlignmentYProperty;
    property StretchProperty: IDependencyProperty read get_StretchProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITransformFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Transform)]
  ITransformFactory = interface(IInspectable)
  ['{7DA293F9-B82E-5D15-B623-C08210CBB640}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterator_1__ITransform_Base = interface(IInspectable)
  ['{5AB75535-9FBA-54CC-9DB3-3FB6C0E4ABF5}']
    function get_Current: ITransform; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PITransform): Cardinal; safecall;
    property Current: ITransform read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterator_1__ITransform = interface(IIterator_1__ITransform_Base)
  ['{C21C0932-E812-536F-9BBB-2543C5B6E7AE}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterable_1__ITransform_Base = interface(IInspectable)
  ['{1A701F75-905E-59EE-82C8-5913B6C38302}']
    function First: IIterator_1__ITransform; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Microsoft.UI.Xaml.Media.ITransform>
  IIterable_1__ITransform = interface(IIterable_1__ITransform_Base)
  ['{44D08939-6212-5BBB-A698-17F05944BA5C}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Microsoft.UI.Xaml.Media.ITransform>
  IVectorView_1__ITransform = interface(IInspectable)
  ['{89328AB3-989B-5DD8-A575-8FEB94B64858}']
    function GetAt(index: Cardinal): ITransform; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ITransform; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PITransform): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.ITransform>
  IVector_1__ITransform_Base = interface(IInspectable)
  ['{1E1AEBF2-BC80-501F-9404-E0756A423355}']
    function GetAt(index: Cardinal): ITransform; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ITransform; safecall;
    function IndexOf(value: ITransform; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ITransform); safecall;
    procedure InsertAt(index: Cardinal; value: ITransform); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ITransform); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PITransform): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PITransform); safecall;
    property Size: Cardinal read get_Size;
  end;
  // UsedAPI Interface
  // Windows.Foundation.Collections.IVector`1<Microsoft.UI.Xaml.Media.ITransform>
  IVector_1__ITransform = interface(IVector_1__ITransform_Base)
  ['{3CDE3F98-A11B-5E45-9D28-E97D59CC41DA}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITransformGroup
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TransformGroup)]
  ITransformGroup = interface(IInspectable)
  ['{17C55F3B-899C-588F-8BD4-40FA3A5FCB04}']
    function get_Children: IVector_1__ITransform; safecall;
    procedure put_Children(value: IVector_1__ITransform); safecall;
    function get_Value: Matrix; safecall;
    property Children: IVector_1__ITransform read get_Children write put_Children;
    property Value: Matrix read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITransformGroupStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TransformGroup)]
  ITransformGroupStatics = interface(IInspectable)
  ['{8F1508F6-7DCF-53D5-BBC0-D8FCD96D7399}']
    function get_ChildrenProperty: IDependencyProperty; safecall;
    property ChildrenProperty: IDependencyProperty read get_ChildrenProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITranslateTransform
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TranslateTransform)]
  ITranslateTransform = interface(IInspectable)
  ['{CFA21CA9-B79F-5450-B459-A96C48CB2C8F}']
    function get_X: Double; safecall;
    procedure put_X(value: Double); safecall;
    function get_Y: Double; safecall;
    procedure put_Y(value: Double); safecall;
    property X: Double read get_X write put_X;
    property Y: Double read get_Y write put_Y;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.ITranslateTransformStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_TranslateTransform)]
  ITranslateTransformStatics = interface(IInspectable)
  ['{1342EB11-5A6E-5263-AB3E-9B672A86FC0C}']
    function get_XProperty: IDependencyProperty; safecall;
    function get_YProperty: IDependencyProperty; safecall;
    property XProperty: IDependencyProperty read get_XProperty;
    property YProperty: IDependencyProperty read get_YProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IVisualTreeHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_VisualTreeHelper)]
  IVisualTreeHelper = interface(IInspectable)
  ['{5F69AC1E-6504-5E3F-A11C-87684C1DB814}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IVisualTreeHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_VisualTreeHelper)]
  IVisualTreeHelperStatics = interface(IInspectable)
  ['{5AECE43C-7651-5BB5-855C-2198496E455E}']
    function FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement): IIterable_1__IUIElement; overload; safecall;
    function FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement): IIterable_1__IUIElement; overload; safecall;
    function FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement; overload; safecall;
    function FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement; overload; safecall;
    function GetChild(reference: IDependencyObject; childIndex: Integer): IDependencyObject; safecall;
    function GetChildrenCount(reference: IDependencyObject): Integer; safecall;
    function GetParent(reference: IDependencyObject): IDependencyObject; safecall;
    procedure DisconnectChildrenRecursive(element: IUIElement); safecall;
    function GetOpenPopups(window: IWindow): IVectorView_1__Primitives_IPopup; safecall;
    function GetOpenPopupsForXamlRoot(xamlRoot: IXamlRoot): IVectorView_1__Primitives_IPopup; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBase
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlCompositionBrushBase)]
  IXamlCompositionBrushBase = interface(IInspectable)
  ['{FEAEAD28-5CD0-5E58-BCEA-8670F832ACA9}']
    function get_FallbackColor: Color; safecall;
    procedure put_FallbackColor(value: Color); safecall;
    property FallbackColor: Color read get_FallbackColor write put_FallbackColor;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlCompositionBrushBase)]
  IXamlCompositionBrushBaseFactory = interface(IInspectable)
  ['{B1626D56-0F6F-5416-ADA4-5C8105D3F082}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlCompositionBrushBase; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseOverrides
  IXamlCompositionBrushBaseOverrides = interface(IInspectable)
  ['{8881B559-54A0-56C4-A79A-135152FB1DFA}']
    procedure OnConnected; safecall;
    procedure OnDisconnected; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseProtected
  IXamlCompositionBrushBaseProtected = interface(IInspectable)
  ['{6617E1A5-E27A-5B95-B03E-6758B58F92A0}']
    function get_CompositionBrush: ICompositionBrush; safecall;
    procedure put_CompositionBrush(value: ICompositionBrush); safecall;
    property CompositionBrush: ICompositionBrush read get_CompositionBrush write put_CompositionBrush;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlCompositionBrushBase)]
  IXamlCompositionBrushBaseStatics = interface(IInspectable)
  ['{3EED6E16-C386-5A1C-B70D-EF1C0015E691}']
    function get_FallbackColorProperty: IDependencyProperty; safecall;
    property FallbackColorProperty: IDependencyProperty read get_FallbackColorProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlLightFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlLight)]
  IXamlLightFactory = interface(IInspectable)
  ['{76DA6306-96FC-553E-BB39-9A4801D06F48}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlLight; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlLightOverrides
  IXamlLightOverrides = interface(IInspectable)
  ['{696D4F30-92EE-540D-AD70-33D4489514D0}']
    function GetId: HSTRING; safecall;
    procedure OnConnected(newElement: IUIElement); safecall;
    procedure OnDisconnected(oldElement: IUIElement); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlLightProtected
  IXamlLightProtected = interface(IInspectable)
  ['{C307BF12-FDAF-54CA-A631-AD0E86263C6E}']
    function get_CompositionLight: ICompositionLight; safecall;
    procedure put_CompositionLight(value: ICompositionLight); safecall;
    property CompositionLight: ICompositionLight read get_CompositionLight write put_CompositionLight;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.IXamlLightStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_XamlLight)]
  IXamlLightStatics = interface(IInspectable)
  ['{A2D8EA26-26FF-5374-B1DD-F232D5604F6A}']
    procedure AddTargetElement(lightId: HSTRING; element: IUIElement); safecall;
    procedure RemoveTargetElement(lightId: HSTRING; element: IUIElement); safecall;
    procedure AddTargetBrush(lightId: HSTRING; brush: IBrush); safecall;
    procedure RemoveTargetBrush(lightId: HSTRING; brush: IBrush); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapImageFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapImage)]
  Imaging_IBitmapImageFactory = interface(IInspectable)
  ['{F037E0E9-F229-522E-95C9-DA2211A14B05}']
    function CreateInstanceWithUriSource(uriSource: IUriRuntimeClass): Imaging_IBitmapImage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapImageStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapImage)]
  Imaging_IBitmapImageStatics = interface(IInspectable)
  ['{4BCF71A9-1897-51DC-8E3F-2C5C796D1CD9}']
    function get_CreateOptionsProperty: IDependencyProperty; safecall;
    function get_UriSourceProperty: IDependencyProperty; safecall;
    function get_DecodePixelWidthProperty: IDependencyProperty; safecall;
    function get_DecodePixelHeightProperty: IDependencyProperty; safecall;
    function get_DecodePixelTypeProperty: IDependencyProperty; safecall;
    function get_IsAnimatedBitmapProperty: IDependencyProperty; safecall;
    function get_IsPlayingProperty: IDependencyProperty; safecall;
    function get_AutoPlayProperty: IDependencyProperty; safecall;
    property AutoPlayProperty: IDependencyProperty read get_AutoPlayProperty;
    property CreateOptionsProperty: IDependencyProperty read get_CreateOptionsProperty;
    property DecodePixelHeightProperty: IDependencyProperty read get_DecodePixelHeightProperty;
    property DecodePixelTypeProperty: IDependencyProperty read get_DecodePixelTypeProperty;
    property DecodePixelWidthProperty: IDependencyProperty read get_DecodePixelWidthProperty;
    property IsAnimatedBitmapProperty: IDependencyProperty read get_IsAnimatedBitmapProperty;
    property IsPlayingProperty: IDependencyProperty read get_IsPlayingProperty;
    property UriSourceProperty: IDependencyProperty read get_UriSourceProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapSource)]
  Imaging_IBitmapSource = interface(IInspectable)
  ['{8424269D-9B82-534F-8FEA-AF5B5EF96BF2}']
    function get_PixelWidth: Integer; safecall;
    function get_PixelHeight: Integer; safecall;
    procedure SetSource(streamSource: IRandomAccessStream); safecall;
    function SetSourceAsync(streamSource: IRandomAccessStream): IAsyncAction; safecall;
    property PixelHeight: Integer read get_PixelHeight;
    property PixelWidth: Integer read get_PixelWidth;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapSource)]
  Imaging_IBitmapSourceFactory = interface(IInspectable)
  ['{0392F025-1868-5876-AD67-12E94A8DA5BF}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IBitmapSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_BitmapSource)]
  Imaging_IBitmapSourceStatics = interface(IInspectable)
  ['{EFA3745E-4400-5F0B-BDC7-3F2911A3D719}']
    function get_PixelWidthProperty: IDependencyProperty; safecall;
    function get_PixelHeightProperty: IDependencyProperty; safecall;
    property PixelHeightProperty: IDependencyProperty read get_PixelHeightProperty;
    property PixelWidthProperty: IDependencyProperty read get_PixelWidthProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmap
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_RenderTargetBitmap)]
  Imaging_IRenderTargetBitmap = interface(IInspectable)
  ['{CF10407D-FA8B-57A3-9574-710529AE0B04}']
    function get_PixelWidth: Integer; safecall;
    function get_PixelHeight: Integer; safecall;
    function RenderAsync(element: IUIElement): IAsyncAction; overload; safecall;
    function RenderAsync(element: IUIElement; scaledWidth: Integer; scaledHeight: Integer): IAsyncAction; overload; safecall;
    function GetPixelsAsync: IAsyncOperation_1__IBuffer; safecall;
    property PixelHeight: Integer read get_PixelHeight;
    property PixelWidth: Integer read get_PixelWidth;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmapStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_RenderTargetBitmap)]
  Imaging_IRenderTargetBitmapStatics = interface(IInspectable)
  ['{83E822E4-9F84-5986-93B0-E4F7019C367D}']
    function get_PixelWidthProperty: IDependencyProperty; safecall;
    function get_PixelHeightProperty: IDependencyProperty; safecall;
    property PixelHeightProperty: IDependencyProperty read get_PixelHeightProperty;
    property PixelWidthProperty: IDependencyProperty read get_PixelWidthProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISoftwareBitmapSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SoftwareBitmapSource)]
  Imaging_ISoftwareBitmapSource = interface(IInspectable)
  ['{A6ACA802-1F24-5A1E-BF08-781A85ED5511}']
    function SetBitmapAsync(softwareBitmap: Imaging_ISoftwareBitmap): IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SurfaceImageSource)]
  Imaging_ISurfaceImageSource = interface(IInspectable)
  ['{AC078D9C-D0E0-5FF9-B73E-98E82E4C8D36}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSourceFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SurfaceImageSource)]
  Imaging_ISurfaceImageSourceFactory = interface(IInspectable)
  ['{09A26ED2-11B3-5EF1-AC56-20D064CCCA34}']
    function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource; safecall;
    function CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource; safecall;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs
  Imaging_ISvgImageSourceOpenedEventArgs = interface(IInspectable)
  ['{1C9860D5-38D0-5B21-8D48-072F1E254E39}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E81E0783-EB64-5E84-B57A-AC6164814F85}']
    procedure Invoke(sender: Imaging_ISvgImageSource; args: Imaging_ISvgImageSourceOpenedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs = interface(TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs_Delegate_Base)
  ['{D79867C6-1741-5923-A7B7-A441100CFA16}']
  end;

  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs
  Imaging_ISvgImageSourceFailedEventArgs = interface(IInspectable)
  ['{76E66278-7804-5439-A50D-14C5BA896714}']
    function get_Status: Imaging_SvgImageSourceLoadStatus; safecall;
    property Status: Imaging_SvgImageSourceLoadStatus read get_Status;
  end;

  // Generic Delegate for:
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C5F3237B-4599-5EF5-932F-4B8E723DD67E}']
    procedure Invoke(sender: Imaging_ISvgImageSource; args: Imaging_ISvgImageSourceFailedEventArgs); safecall;
  end;
  // UsedAPI Interface
  // Windows.Foundation.TypedEventHandler`2<Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource,Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs>
  TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs = interface(TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs_Delegate_Base)
  ['{D4DEF419-18C1-56FA-9049-02BDEAA918E5}']
  end;

  // UsedAPI Interface
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus = interface(IUnknown)
  ['{CF51E7F6-29AE-510B-9607-0F86103C61B8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Imaging_SvgImageSourceLoadStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  // Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  IAsyncOperation_1__Imaging_SvgImageSourceLoadStatus = interface(IInspectable)
  ['{04FE49A9-ED47-56CA-93EA-EAA7032271C5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus; safecall;
    function GetResults: Imaging_SvgImageSourceLoadStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Imaging_SvgImageSourceLoadStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SvgImageSource)]
  Imaging_ISvgImageSource = interface(IInspectable)
  ['{D5B61D3C-B68D-53A2-B07B-BA6ADFDD5887}']
    function get_UriSource: IUriRuntimeClass; safecall;
    procedure put_UriSource(value: IUriRuntimeClass); safecall;
    function get_RasterizePixelWidth: Double; safecall;
    procedure put_RasterizePixelWidth(value: Double); safecall;
    function get_RasterizePixelHeight: Double; safecall;
    procedure put_RasterizePixelHeight(value: Double); safecall;
    function add_Opened(handler: TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceOpenedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Opened(token: EventRegistrationToken); safecall;
    function add_OpenFailed(handler: TypedEventHandler_2__Imaging_ISvgImageSource__Imaging_ISvgImageSourceFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OpenFailed(token: EventRegistrationToken); safecall;
    function SetSourceAsync(streamSource: IRandomAccessStream): IAsyncOperation_1__Imaging_SvgImageSourceLoadStatus; safecall;
    property RasterizePixelHeight: Double read get_RasterizePixelHeight write put_RasterizePixelHeight;
    property RasterizePixelWidth: Double read get_RasterizePixelWidth write put_RasterizePixelWidth;
    property UriSource: IUriRuntimeClass read get_UriSource write put_UriSource;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SvgImageSource)]
  Imaging_ISvgImageSourceFactory = interface(IInspectable)
  ['{2F85673F-AC64-570D-9BDA-94FA082EEAD9}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource; safecall;
    function CreateInstanceWithUriSource(uriSource: IUriRuntimeClass; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_SvgImageSource)]
  Imaging_ISvgImageSourceStatics = interface(IInspectable)
  ['{E3AD1068-F4C6-5513-A777-2980F0BA41BD}']
    function get_UriSourceProperty: IDependencyProperty; safecall;
    function get_RasterizePixelWidthProperty: IDependencyProperty; safecall;
    function get_RasterizePixelHeightProperty: IDependencyProperty; safecall;
    property RasterizePixelHeightProperty: IDependencyProperty read get_RasterizePixelHeightProperty;
    property RasterizePixelWidthProperty: IDependencyProperty read get_RasterizePixelWidthProperty;
    property UriSourceProperty: IDependencyProperty read get_UriSourceProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_VirtualSurfaceImageSource)]
  Imaging_IVirtualSurfaceImageSource = interface(IInspectable)
  ['{E4FF96A6-FEDE-589C-A007-4178B53B6739}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_VirtualSurfaceImageSource)]
  Imaging_IVirtualSurfaceImageSourceFactory = interface(IInspectable)
  ['{08490F2C-04A8-5031-B9C7-707060D7CD48}']
    function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IVirtualSurfaceImageSource; safecall;
    function CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean): Imaging_IVirtualSurfaceImageSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmap
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_WriteableBitmap)]
  Imaging_IWriteableBitmap = interface(IInspectable)
  ['{78C824A9-0E43-5F1E-93BC-D046CCA82B7E}']
    function get_PixelBuffer: IBuffer; safecall;
    procedure Invalidate; safecall;
    property PixelBuffer: IBuffer read get_PixelBuffer;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmapFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_WriteableBitmap)]
  Imaging_IWriteableBitmapFactory = interface(IInspectable)
  ['{26E861D9-B080-512B-96C4-80050E7E08D1}']
    function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IWriteableBitmap; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_XamlRenderingBackgroundTask)]
  Imaging_IXamlRenderingBackgroundTask = interface(IInspectable)
  ['{7807000C-A050-5121-AC74-3322D5358E39}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Imaging_XamlRenderingBackgroundTask)]
  Imaging_IXamlRenderingBackgroundTaskFactory = interface(IInspectable)
  ['{205247A3-9FFE-599A-A21A-7181442A9D75}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IXamlRenderingBackgroundTask; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskOverrides
  Imaging_IXamlRenderingBackgroundTaskOverrides = interface(IInspectable)
  ['{18733237-324B-57C0-89B2-5875472ACC80}']
    procedure OnRun(taskInstance: IBackgroundTaskInstance); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3D
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_CompositeTransform3D)]
  Media3D_ICompositeTransform3D = interface(IInspectable)
  ['{CBAF163F-C254-5DCF-8AE4-40E21CE1B4CA}']
    function get_CenterX: Double; safecall;
    procedure put_CenterX(value: Double); safecall;
    function get_CenterY: Double; safecall;
    procedure put_CenterY(value: Double); safecall;
    function get_CenterZ: Double; safecall;
    procedure put_CenterZ(value: Double); safecall;
    function get_RotationX: Double; safecall;
    procedure put_RotationX(value: Double); safecall;
    function get_RotationY: Double; safecall;
    procedure put_RotationY(value: Double); safecall;
    function get_RotationZ: Double; safecall;
    procedure put_RotationZ(value: Double); safecall;
    function get_ScaleX: Double; safecall;
    procedure put_ScaleX(value: Double); safecall;
    function get_ScaleY: Double; safecall;
    procedure put_ScaleY(value: Double); safecall;
    function get_ScaleZ: Double; safecall;
    procedure put_ScaleZ(value: Double); safecall;
    function get_TranslateX: Double; safecall;
    procedure put_TranslateX(value: Double); safecall;
    function get_TranslateY: Double; safecall;
    procedure put_TranslateY(value: Double); safecall;
    function get_TranslateZ: Double; safecall;
    procedure put_TranslateZ(value: Double); safecall;
    property CenterX: Double read get_CenterX write put_CenterX;
    property CenterY: Double read get_CenterY write put_CenterY;
    property CenterZ: Double read get_CenterZ write put_CenterZ;
    property RotationX: Double read get_RotationX write put_RotationX;
    property RotationY: Double read get_RotationY write put_RotationY;
    property RotationZ: Double read get_RotationZ write put_RotationZ;
    property ScaleX: Double read get_ScaleX write put_ScaleX;
    property ScaleY: Double read get_ScaleY write put_ScaleY;
    property ScaleZ: Double read get_ScaleZ write put_ScaleZ;
    property TranslateX: Double read get_TranslateX write put_TranslateX;
    property TranslateY: Double read get_TranslateY write put_TranslateY;
    property TranslateZ: Double read get_TranslateZ write put_TranslateZ;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3DStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_CompositeTransform3D)]
  Media3D_ICompositeTransform3DStatics = interface(IInspectable)
  ['{B64D4181-6988-5D46-858A-224DB7089DC4}']
    function get_CenterXProperty: IDependencyProperty; safecall;
    function get_CenterYProperty: IDependencyProperty; safecall;
    function get_CenterZProperty: IDependencyProperty; safecall;
    function get_RotationXProperty: IDependencyProperty; safecall;
    function get_RotationYProperty: IDependencyProperty; safecall;
    function get_RotationZProperty: IDependencyProperty; safecall;
    function get_ScaleXProperty: IDependencyProperty; safecall;
    function get_ScaleYProperty: IDependencyProperty; safecall;
    function get_ScaleZProperty: IDependencyProperty; safecall;
    function get_TranslateXProperty: IDependencyProperty; safecall;
    function get_TranslateYProperty: IDependencyProperty; safecall;
    function get_TranslateZProperty: IDependencyProperty; safecall;
    property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    property CenterZProperty: IDependencyProperty read get_CenterZProperty;
    property RotationXProperty: IDependencyProperty read get_RotationXProperty;
    property RotationYProperty: IDependencyProperty read get_RotationYProperty;
    property RotationZProperty: IDependencyProperty read get_RotationZProperty;
    property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
    property ScaleZProperty: IDependencyProperty read get_ScaleZProperty;
    property TranslateXProperty: IDependencyProperty read get_TranslateXProperty;
    property TranslateYProperty: IDependencyProperty read get_TranslateYProperty;
    property TranslateZProperty: IDependencyProperty read get_TranslateZProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelper
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_Matrix3DHelper)]
  Media3D_IMatrix3DHelper = interface(IInspectable)
  ['{D2909BE1-9C28-5B38-B63C-88E838644533}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelperStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_Matrix3DHelper)]
  Media3D_IMatrix3DHelperStatics = interface(IInspectable)
  ['{930E447B-265C-5DED-9E64-57B8933C55C3}']
    function get_Identity: Media3D_Matrix3D; safecall;
    function Multiply(matrix1: Media3D_Matrix3D; matrix2: Media3D_Matrix3D): Media3D_Matrix3D; safecall;
    function FromElements(m11: Double; m12: Double; m13: Double; m14: Double; m21: Double; m22: Double; m23: Double; m24: Double; m31: Double; m32: Double; m33: Double; m34: Double; offsetX: Double; offsetY: Double; offsetZ: Double; m44: Double): Media3D_Matrix3D; safecall;
    function GetHasInverse(target: Media3D_Matrix3D): Boolean; safecall;
    function GetIsIdentity(target: Media3D_Matrix3D): Boolean; safecall;
    function Invert(target: Media3D_Matrix3D): Media3D_Matrix3D; safecall;
    property Identity: Media3D_Matrix3D read get_Identity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3D
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_PerspectiveTransform3D)]
  Media3D_IPerspectiveTransform3D = interface(IInspectable)
  ['{4006CC46-684E-54EA-A421-DAE5B0556B85}']
    function get_Depth: Double; safecall;
    procedure put_Depth(value: Double); safecall;
    function get_OffsetX: Double; safecall;
    procedure put_OffsetX(value: Double); safecall;
    function get_OffsetY: Double; safecall;
    procedure put_OffsetY(value: Double); safecall;
    property Depth: Double read get_Depth write put_Depth;
    property OffsetX: Double read get_OffsetX write put_OffsetX;
    property OffsetY: Double read get_OffsetY write put_OffsetY;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3DStatics
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_PerspectiveTransform3D)]
  Media3D_IPerspectiveTransform3DStatics = interface(IInspectable)
  ['{3B16AA8D-0EE2-5D46-A723-DC8E5C1C0B19}']
    function get_DepthProperty: IDependencyProperty; safecall;
    function get_OffsetXProperty: IDependencyProperty; safecall;
    function get_OffsetYProperty: IDependencyProperty; safecall;
    property DepthProperty: IDependencyProperty read get_DepthProperty;
    property OffsetXProperty: IDependencyProperty read get_OffsetXProperty;
    property OffsetYProperty: IDependencyProperty read get_OffsetYProperty;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Xaml.Media.Media3D.ITransform3DFactory
  [WinRTClassNameAttribute(SMicrosoft_UI_Xaml_Media_Media3D_Transform3D)]
  Media3D_ITransform3DFactory = interface(IInspectable)
  ['{9BCCE0A1-10AC-5319-BDF1-548D2E5AE504}']
    function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Media3D_ITransform3D; safecall;
  end;

  // Microsoft.UI.Xaml.Media.Brush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IBrush
  // Implements: Microsoft.UI.Xaml.Media.IBrushOverrides
  // Implements: Microsoft.UI.Composition.IAnimationObject
  // Statics: "Microsoft.UI.Xaml.Media.IBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IBrushFactory"
  // Instantiable: "IBrush"
  TBrush = class(TWinRTGenericImportFSI<IBrushFactory, IBrushStatics, IBrush>)
  public
    // -> IBrushStatics
    class function get_OpacityProperty: IDependencyProperty; static; inline;
    class function get_TransformProperty: IDependencyProperty; static; inline;
    class function get_RelativeTransformProperty: IDependencyProperty; static; inline;
    class property OpacityProperty: IDependencyProperty read get_OpacityProperty;
    class property RelativeTransformProperty: IDependencyProperty read get_RelativeTransformProperty;
    class property TransformProperty: IDependencyProperty read get_TransformProperty;

    // -> IBrushFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.XamlCompositionBrushBase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IXamlCompositionBrushBase
  // Implements: Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseProtected
  // Implements: Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseOverrides
  // Statics: "Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseFactory"
  // Instantiable: "IXamlCompositionBrushBase"
  TXamlCompositionBrushBase = class(TWinRTGenericImportFSI<IXamlCompositionBrushBaseFactory, IXamlCompositionBrushBaseStatics, IXamlCompositionBrushBase>)
  public
    // -> IXamlCompositionBrushBaseStatics
    class function get_FallbackColorProperty: IDependencyProperty; static; inline;
    class property FallbackColorProperty: IDependencyProperty read get_FallbackColorProperty;

    // -> IXamlCompositionBrushBaseFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlCompositionBrushBase; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.AcrylicBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IAcrylicBrush
  // Implements: Microsoft.UI.Xaml.Media.IAcrylicBrush2
  // Statics: "Microsoft.UI.Xaml.Media.IAcrylicBrushStatics"
  // Statics: "Microsoft.UI.Xaml.Media.IAcrylicBrushStatics2"
  // Factory: "Microsoft.UI.Xaml.Media.IAcrylicBrushFactory"
  // Instantiable: "IAcrylicBrush"
  TAcrylicBrush = class(TWinRTGenericImportFS2I<IAcrylicBrushFactory, IAcrylicBrushStatics, IAcrylicBrushStatics2, IAcrylicBrush>)
  public
    // -> IAcrylicBrushStatics
    class function get_TintColorProperty: IDependencyProperty; static; inline;
    class function get_TintOpacityProperty: IDependencyProperty; static; inline;
    class function get_TintTransitionDurationProperty: IDependencyProperty; static; inline;
    class function get_AlwaysUseFallbackProperty: IDependencyProperty; static; inline;
    class property AlwaysUseFallbackProperty: IDependencyProperty read get_AlwaysUseFallbackProperty;
    class property TintColorProperty: IDependencyProperty read get_TintColorProperty;
    class property TintOpacityProperty: IDependencyProperty read get_TintOpacityProperty;
    class property TintTransitionDurationProperty: IDependencyProperty read get_TintTransitionDurationProperty;

    // -> IAcrylicBrushStatics2
    class function get_TintLuminosityOpacityProperty: IDependencyProperty; static; inline;
    class property TintLuminosityOpacityProperty: IDependencyProperty read get_TintLuminosityOpacityProperty;

    // -> IAcrylicBrushFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IAcrylicBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.Transition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ITransition
  // Factory: "Microsoft.UI.Xaml.Media.Animation.ITransitionFactory"
  // Instantiable: "Animation_ITransition"
  TAnimation_Transition = class(TWinRTGenericImportFI<Animation_ITransitionFactory, Animation_ITransition>)
  public
    // -> Animation_ITransitionFactory
  end;

  // Microsoft.UI.Xaml.Media.Animation.AddDeleteThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IAddDeleteThemeTransition
  // Instantiable: "Animation_IAddDeleteThemeTransition"
  TAnimation_AddDeleteThemeTransition = class(TWinRTGenericImportI<Animation_IAddDeleteThemeTransition>) end;

  // Microsoft.UI.Xaml.Media.Animation.EasingFunctionBase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory"
  // Instantiable: "Animation_IEasingFunctionBase"
  TAnimation_EasingFunctionBase = class(TWinRTGenericImportFSI<Animation_IEasingFunctionBaseFactory, Animation_IEasingFunctionBaseStatics, Animation_IEasingFunctionBase>)
  public
    // -> Animation_IEasingFunctionBaseStatics
    class function get_EasingModeProperty: IDependencyProperty; static; inline;
    class property EasingModeProperty: IDependencyProperty read get_EasingModeProperty;

    // -> Animation_IEasingFunctionBaseFactory
  end;

  // Microsoft.UI.Xaml.Media.Animation.BackEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IBackEase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IBackEaseStatics"
  // Instantiable: "Animation_IBackEase"
  TAnimation_BackEase = class(TWinRTGenericImportSI<Animation_IBackEaseStatics, Animation_IBackEase>)
  public
    // -> Animation_IBackEaseStatics
    class function get_AmplitudeProperty: IDependencyProperty; static; inline;
    class property AmplitudeProperty: IDependencyProperty read get_AmplitudeProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ConnectedAnimationConfiguration
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfiguration
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfigurationFactory"
  // Instantiable: "Animation_IConnectedAnimationConfiguration"
  TAnimation_ConnectedAnimationConfiguration = class(TWinRTGenericImportFI<Animation_IConnectedAnimationConfigurationFactory, Animation_IConnectedAnimationConfiguration>)
  public
    // -> Animation_IConnectedAnimationConfigurationFactory
  end;

  // Microsoft.UI.Xaml.Media.Animation.BasicConnectedAnimationConfiguration
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfiguration
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfigurationFactory"
  // Instantiable: "Animation_IBasicConnectedAnimationConfiguration"
  TAnimation_BasicConnectedAnimationConfiguration = class(TWinRTGenericImportFI<Animation_IBasicConnectedAnimationConfigurationFactory, Animation_IBasicConnectedAnimationConfiguration>)
  public
    // -> Animation_IBasicConnectedAnimationConfigurationFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IBasicConnectedAnimationConfiguration; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.BeginStoryboard
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IBeginStoryboard
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IBeginStoryboardStatics"
  // Instantiable: "Animation_IBeginStoryboard"
  TAnimation_BeginStoryboard = class(TWinRTGenericImportSI<Animation_IBeginStoryboardStatics, Animation_IBeginStoryboard>)
  public
    // -> Animation_IBeginStoryboardStatics
    class function get_StoryboardProperty: IDependencyProperty; static; inline;
    class property StoryboardProperty: IDependencyProperty read get_StoryboardProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.BounceEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IBounceEase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IBounceEaseStatics"
  // Instantiable: "Animation_IBounceEase"
  TAnimation_BounceEase = class(TWinRTGenericImportSI<Animation_IBounceEaseStatics, Animation_IBounceEase>)
  public
    // -> Animation_IBounceEaseStatics
    class function get_BouncesProperty: IDependencyProperty; static; inline;
    class function get_BouncinessProperty: IDependencyProperty; static; inline;
    class property BouncesProperty: IDependencyProperty read get_BouncesProperty;
    class property BouncinessProperty: IDependencyProperty read get_BouncinessProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.CircleEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ICircleEase
  // Instantiable: "Animation_ICircleEase"
  TAnimation_CircleEase = class(TWinRTGenericImportI<Animation_ICircleEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.Timeline
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ITimeline
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ITimelineStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.ITimelineFactory"
  // Instantiable: "Animation_ITimeline"
  TAnimation_Timeline = class(TWinRTGenericImportFSI<Animation_ITimelineFactory, Animation_ITimelineStatics, Animation_ITimeline>)
  public
    // -> Animation_ITimelineStatics
    class function get_AllowDependentAnimations: Boolean; static; inline;
    class procedure put_AllowDependentAnimations(value: Boolean); static; inline;
    class function get_AutoReverseProperty: IDependencyProperty; static; inline;
    class function get_BeginTimeProperty: IDependencyProperty; static; inline;
    class function get_DurationProperty: IDependencyProperty; static; inline;
    class function get_SpeedRatioProperty: IDependencyProperty; static; inline;
    class function get_FillBehaviorProperty: IDependencyProperty; static; inline;
    class function get_RepeatBehaviorProperty: IDependencyProperty; static; inline;
    class property AllowDependentAnimations: Boolean read get_AllowDependentAnimations write put_AllowDependentAnimations;
    class property AutoReverseProperty: IDependencyProperty read get_AutoReverseProperty;
    class property BeginTimeProperty: IDependencyProperty read get_BeginTimeProperty;
    class property DurationProperty: IDependencyProperty read get_DurationProperty;
    class property FillBehaviorProperty: IDependencyProperty read get_FillBehaviorProperty;
    class property RepeatBehaviorProperty: IDependencyProperty read get_RepeatBehaviorProperty;
    class property SpeedRatioProperty: IDependencyProperty read get_SpeedRatioProperty;

    // -> Animation_ITimelineFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_ITimeline; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ColorAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IColorAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IColorAnimationStatics"
  // Instantiable: "Animation_IColorAnimation"
  TAnimation_ColorAnimation = class(TWinRTGenericImportSI<Animation_IColorAnimationStatics, Animation_IColorAnimation>)
  public
    // -> Animation_IColorAnimationStatics
    class function get_FromProperty: IDependencyProperty; static; inline;
    class function get_ToProperty: IDependencyProperty; static; inline;
    class function get_ByProperty: IDependencyProperty; static; inline;
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property ByProperty: IDependencyProperty read get_ByProperty;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    class property FromProperty: IDependencyProperty read get_FromProperty;
    class property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ColorAnimationUsingKeyFrames
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFramesStatics"
  // Instantiable: "Animation_IColorAnimationUsingKeyFrames"
  TAnimation_ColorAnimationUsingKeyFrames = class(TWinRTGenericImportSI<Animation_IColorAnimationUsingKeyFramesStatics, Animation_IColorAnimationUsingKeyFrames>)
  public
    // -> Animation_IColorAnimationUsingKeyFramesStatics
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ColorKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IColorKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameFactory"
  // Instantiable: "Animation_IColorKeyFrame"
  TAnimation_ColorKeyFrame = class(TWinRTGenericImportFSI<Animation_IColorKeyFrameFactory, Animation_IColorKeyFrameStatics, Animation_IColorKeyFrame>)
  public
    // -> Animation_IColorKeyFrameStatics
    class function get_ValueProperty: IDependencyProperty; static; inline;
    class function get_KeyTimeProperty: IDependencyProperty; static; inline;
    class property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    class property ValueProperty: IDependencyProperty read get_ValueProperty;

    // -> Animation_IColorKeyFrameFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IColorKeyFrame; static; inline;
  end;


  // Microsoft.UI.Xaml.Media.Animation.NavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfo
  // Implements: Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoOverrides
  // Factory: "Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoFactory"
  // Instantiable: "Animation_INavigationTransitionInfo"
  TAnimation_NavigationTransitionInfo = class(TWinRTGenericImportFI<Animation_INavigationTransitionInfoFactory, Animation_INavigationTransitionInfo>)
  public
    // -> Animation_INavigationTransitionInfoFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_INavigationTransitionInfo; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfoStatics"
  // Instantiable: "Animation_ICommonNavigationTransitionInfo"
  TAnimation_CommonNavigationTransitionInfo = class(TWinRTGenericImportSI<Animation_ICommonNavigationTransitionInfoStatics, Animation_ICommonNavigationTransitionInfo>)
  public
    // -> Animation_ICommonNavigationTransitionInfoStatics
    class function get_IsStaggeringEnabledProperty: IDependencyProperty; static; inline;
    class function get_IsStaggerElementProperty: IDependencyProperty; static; inline;
    class function GetIsStaggerElement(element: IUIElement): Boolean; static; inline;
    class procedure SetIsStaggerElement(element: IUIElement; value: Boolean); static; inline;
    class property IsStaggerElementProperty: IDependencyProperty read get_IsStaggerElementProperty;
    class property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ConnectedAnimationService
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationService
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationServiceStatics"
  TAnimation_ConnectedAnimationService = class(TWinRTGenericImportS<Animation_IConnectedAnimationServiceStatics>)
  public
    // -> Animation_IConnectedAnimationServiceStatics
    class function GetForCurrentView: Animation_IConnectedAnimationService; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ContentThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IContentThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IContentThemeTransitionStatics"
  // Instantiable: "Animation_IContentThemeTransition"
  TAnimation_ContentThemeTransition = class(TWinRTGenericImportSI<Animation_IContentThemeTransitionStatics, Animation_IContentThemeTransition>)
  public
    // -> Animation_IContentThemeTransitionStatics
    class function get_HorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_VerticalOffsetProperty: IDependencyProperty; static; inline;
    class property HorizontalOffsetProperty: IDependencyProperty read get_HorizontalOffsetProperty;
    class property VerticalOffsetProperty: IDependencyProperty read get_VerticalOffsetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfoStatics"
  // Instantiable: "Animation_IContinuumNavigationTransitionInfo"
  TAnimation_ContinuumNavigationTransitionInfo = class(TWinRTGenericImportSI<Animation_IContinuumNavigationTransitionInfoStatics, Animation_IContinuumNavigationTransitionInfo>)
  public
    // -> Animation_IContinuumNavigationTransitionInfoStatics
    class function get_ExitElementProperty: IDependencyProperty; static; inline;
    class function get_IsEntranceElementProperty: IDependencyProperty; static; inline;
    class function GetIsEntranceElement(element: IUIElement): Boolean; static; inline;
    class procedure SetIsEntranceElement(element: IUIElement; value: Boolean); static; inline;
    class function get_IsExitElementProperty: IDependencyProperty; static; inline;
    class function GetIsExitElement(element: IUIElement): Boolean; static; inline;
    class procedure SetIsExitElement(element: IUIElement; value: Boolean); static; inline;
    class function get_ExitElementContainerProperty: IDependencyProperty; static; inline;
    class function GetExitElementContainer(element: IListViewBase): Boolean; static; inline;
    class procedure SetExitElementContainer(element: IListViewBase; value: Boolean); static; inline;
    class property ExitElementContainerProperty: IDependencyProperty read get_ExitElementContainerProperty;
    class property ExitElementProperty: IDependencyProperty read get_ExitElementProperty;
    class property IsEntranceElementProperty: IDependencyProperty read get_IsEntranceElementProperty;
    class property IsExitElementProperty: IDependencyProperty read get_IsExitElementProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.CubicEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ICubicEase
  // Instantiable: "Animation_ICubicEase"
  TAnimation_CubicEase = class(TWinRTGenericImportI<Animation_ICubicEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.DirectConnectedAnimationConfiguration
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfiguration
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfigurationFactory"
  // Instantiable: "Animation_IDirectConnectedAnimationConfiguration"
  TAnimation_DirectConnectedAnimationConfiguration = class(TWinRTGenericImportFI<Animation_IDirectConnectedAnimationConfigurationFactory, Animation_IDirectConnectedAnimationConfiguration>)
  public
    // -> Animation_IDirectConnectedAnimationConfigurationFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDirectConnectedAnimationConfiguration; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DiscreteColorKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame
  // Instantiable: "Animation_IDiscreteColorKeyFrame"
  TAnimation_DiscreteColorKeyFrame = class(TWinRTGenericImportI<Animation_IDiscreteColorKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.DoubleKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameFactory"
  // Instantiable: "Animation_IDoubleKeyFrame"
  TAnimation_DoubleKeyFrame = class(TWinRTGenericImportFSI<Animation_IDoubleKeyFrameFactory, Animation_IDoubleKeyFrameStatics, Animation_IDoubleKeyFrame>)
  public
    // -> Animation_IDoubleKeyFrameStatics
    class function get_ValueProperty: IDependencyProperty; static; inline;
    class function get_KeyTimeProperty: IDependencyProperty; static; inline;
    class property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    class property ValueProperty: IDependencyProperty read get_ValueProperty;

    // -> Animation_IDoubleKeyFrameFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDoubleKeyFrame; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DiscreteDoubleKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame
  // Instantiable: "Animation_IDiscreteDoubleKeyFrame"
  TAnimation_DiscreteDoubleKeyFrame = class(TWinRTGenericImportI<Animation_IDiscreteDoubleKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.ObjectKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameFactory"
  // Instantiable: "Animation_IObjectKeyFrame"
  TAnimation_ObjectKeyFrame = class(TWinRTGenericImportFSI<Animation_IObjectKeyFrameFactory, Animation_IObjectKeyFrameStatics, Animation_IObjectKeyFrame>)
  public
    // -> Animation_IObjectKeyFrameStatics
    class function get_ValueProperty: IDependencyProperty; static; inline;
    class function get_KeyTimeProperty: IDependencyProperty; static; inline;
    class property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    class property ValueProperty: IDependencyProperty read get_ValueProperty;

    // -> Animation_IObjectKeyFrameFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IObjectKeyFrame; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DiscreteObjectKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame
  // Instantiable: "Animation_IDiscreteObjectKeyFrame"
  TAnimation_DiscreteObjectKeyFrame = class(TWinRTGenericImportI<Animation_IDiscreteObjectKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.PointKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPointKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameFactory"
  // Instantiable: "Animation_IPointKeyFrame"
  TAnimation_PointKeyFrame = class(TWinRTGenericImportFSI<Animation_IPointKeyFrameFactory, Animation_IPointKeyFrameStatics, Animation_IPointKeyFrame>)
  public
    // -> Animation_IPointKeyFrameStatics
    class function get_ValueProperty: IDependencyProperty; static; inline;
    class function get_KeyTimeProperty: IDependencyProperty; static; inline;
    class property KeyTimeProperty: IDependencyProperty read get_KeyTimeProperty;
    class property ValueProperty: IDependencyProperty read get_ValueProperty;

    // -> Animation_IPointKeyFrameFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IPointKeyFrame; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DiscretePointKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDiscretePointKeyFrame
  // Instantiable: "Animation_IDiscretePointKeyFrame"
  TAnimation_DiscretePointKeyFrame = class(TWinRTGenericImportI<Animation_IDiscretePointKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.DoubleAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDoubleAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationStatics"
  // Instantiable: "Animation_IDoubleAnimation"
  TAnimation_DoubleAnimation = class(TWinRTGenericImportSI<Animation_IDoubleAnimationStatics, Animation_IDoubleAnimation>)
  public
    // -> Animation_IDoubleAnimationStatics
    class function get_FromProperty: IDependencyProperty; static; inline;
    class function get_ToProperty: IDependencyProperty; static; inline;
    class function get_ByProperty: IDependencyProperty; static; inline;
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property ByProperty: IDependencyProperty read get_ByProperty;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    class property FromProperty: IDependencyProperty read get_FromProperty;
    class property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DoubleAnimationUsingKeyFrames
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFramesStatics"
  // Instantiable: "Animation_IDoubleAnimationUsingKeyFrames"
  TAnimation_DoubleAnimationUsingKeyFrames = class(TWinRTGenericImportSI<Animation_IDoubleAnimationUsingKeyFramesStatics, Animation_IDoubleAnimationUsingKeyFrames>)
  public
    // -> Animation_IDoubleAnimationUsingKeyFramesStatics
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;


  // Microsoft.UI.Xaml.Media.Animation.DragItemThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDragItemThemeAnimationStatics"
  // Instantiable: "Animation_IDragItemThemeAnimation"
  TAnimation_DragItemThemeAnimation = class(TWinRTGenericImportSI<Animation_IDragItemThemeAnimationStatics, Animation_IDragItemThemeAnimation>)
  public
    // -> Animation_IDragItemThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DragOverThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDragOverThemeAnimationStatics"
  // Instantiable: "Animation_IDragOverThemeAnimation"
  TAnimation_DragOverThemeAnimation = class(TWinRTGenericImportSI<Animation_IDragOverThemeAnimationStatics, Animation_IDragOverThemeAnimation>)
  public
    // -> Animation_IDragOverThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function get_ToOffsetProperty: IDependencyProperty; static; inline;
    class function get_DirectionProperty: IDependencyProperty; static; inline;
    class property DirectionProperty: IDependencyProperty read get_DirectionProperty;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    class property ToOffsetProperty: IDependencyProperty read get_ToOffsetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DrillInNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo
  // Instantiable: "Animation_IDrillInNavigationTransitionInfo"
  TAnimation_DrillInNavigationTransitionInfo = class(TWinRTGenericImportI<Animation_IDrillInNavigationTransitionInfo>) end;

  // Microsoft.UI.Xaml.Media.Animation.DrillInThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDrillInThemeAnimationStatics"
  // Instantiable: "Animation_IDrillInThemeAnimation"
  TAnimation_DrillInThemeAnimation = class(TWinRTGenericImportSI<Animation_IDrillInThemeAnimationStatics, Animation_IDrillInThemeAnimation>)
  public
    // -> Animation_IDrillInThemeAnimationStatics
    class function get_EntranceTargetNameProperty: IDependencyProperty; static; inline;
    class function get_EntranceTargetProperty: IDependencyProperty; static; inline;
    class function get_ExitTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ExitTargetProperty: IDependencyProperty; static; inline;
    class property EntranceTargetNameProperty: IDependencyProperty read get_EntranceTargetNameProperty;
    class property EntranceTargetProperty: IDependencyProperty read get_EntranceTargetProperty;
    class property ExitTargetNameProperty: IDependencyProperty read get_ExitTargetNameProperty;
    class property ExitTargetProperty: IDependencyProperty read get_ExitTargetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DrillOutThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDrillOutThemeAnimationStatics"
  // Instantiable: "Animation_IDrillOutThemeAnimation"
  TAnimation_DrillOutThemeAnimation = class(TWinRTGenericImportSI<Animation_IDrillOutThemeAnimationStatics, Animation_IDrillOutThemeAnimation>)
  public
    // -> Animation_IDrillOutThemeAnimationStatics
    class function get_EntranceTargetNameProperty: IDependencyProperty; static; inline;
    class function get_EntranceTargetProperty: IDependencyProperty; static; inline;
    class function get_ExitTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ExitTargetProperty: IDependencyProperty; static; inline;
    class property EntranceTargetNameProperty: IDependencyProperty read get_EntranceTargetNameProperty;
    class property EntranceTargetProperty: IDependencyProperty read get_EntranceTargetProperty;
    class property ExitTargetNameProperty: IDependencyProperty read get_ExitTargetNameProperty;
    class property ExitTargetProperty: IDependencyProperty read get_ExitTargetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.DropTargetItemThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimationStatics"
  // Instantiable: "Animation_IDropTargetItemThemeAnimation"
  TAnimation_DropTargetItemThemeAnimation = class(TWinRTGenericImportSI<Animation_IDropTargetItemThemeAnimationStatics, Animation_IDropTargetItemThemeAnimation>)
  public
    // -> Animation_IDropTargetItemThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EasingColorKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEasingColorKeyFrameStatics"
  // Instantiable: "Animation_IEasingColorKeyFrame"
  TAnimation_EasingColorKeyFrame = class(TWinRTGenericImportSI<Animation_IEasingColorKeyFrameStatics, Animation_IEasingColorKeyFrame>)
  public
    // -> Animation_IEasingColorKeyFrameStatics
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EasingDoubleKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEasingDoubleKeyFrameStatics"
  // Instantiable: "Animation_IEasingDoubleKeyFrame"
  TAnimation_EasingDoubleKeyFrame = class(TWinRTGenericImportSI<Animation_IEasingDoubleKeyFrameStatics, Animation_IEasingDoubleKeyFrame>)
  public
    // -> Animation_IEasingDoubleKeyFrameStatics
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EasingPointKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEasingPointKeyFrameStatics"
  // Instantiable: "Animation_IEasingPointKeyFrame"
  TAnimation_EasingPointKeyFrame = class(TWinRTGenericImportSI<Animation_IEasingPointKeyFrameStatics, Animation_IEasingPointKeyFrame>)
  public
    // -> Animation_IEasingPointKeyFrameStatics
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EdgeUIThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEdgeUIThemeTransitionStatics"
  // Instantiable: "Animation_IEdgeUIThemeTransition"
  TAnimation_EdgeUIThemeTransition = class(TWinRTGenericImportSI<Animation_IEdgeUIThemeTransitionStatics, Animation_IEdgeUIThemeTransition>)
  public
    // -> Animation_IEdgeUIThemeTransitionStatics
    class function get_EdgeProperty: IDependencyProperty; static; inline;
    class property EdgeProperty: IDependencyProperty read get_EdgeProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ElasticEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IElasticEase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IElasticEaseStatics"
  // Instantiable: "Animation_IElasticEase"
  TAnimation_ElasticEase = class(TWinRTGenericImportSI<Animation_IElasticEaseStatics, Animation_IElasticEase>)
  public
    // -> Animation_IElasticEaseStatics
    class function get_OscillationsProperty: IDependencyProperty; static; inline;
    class function get_SpringinessProperty: IDependencyProperty; static; inline;
    class property OscillationsProperty: IDependencyProperty read get_OscillationsProperty;
    class property SpringinessProperty: IDependencyProperty read get_SpringinessProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfoStatics"
  // Instantiable: "Animation_IEntranceNavigationTransitionInfo"
  TAnimation_EntranceNavigationTransitionInfo = class(TWinRTGenericImportSI<Animation_IEntranceNavigationTransitionInfoStatics, Animation_IEntranceNavigationTransitionInfo>)
  public
    // -> Animation_IEntranceNavigationTransitionInfoStatics
    class function get_IsTargetElementProperty: IDependencyProperty; static; inline;
    class function GetIsTargetElement(element: IUIElement): Boolean; static; inline;
    class procedure SetIsTargetElement(element: IUIElement; value: Boolean); static; inline;
    class property IsTargetElementProperty: IDependencyProperty read get_IsTargetElementProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.EntranceThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IEntranceThemeTransitionStatics"
  // Instantiable: "Animation_IEntranceThemeTransition"
  TAnimation_EntranceThemeTransition = class(TWinRTGenericImportSI<Animation_IEntranceThemeTransitionStatics, Animation_IEntranceThemeTransition>)
  public
    // -> Animation_IEntranceThemeTransitionStatics
    class function get_FromHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_FromVerticalOffsetProperty: IDependencyProperty; static; inline;
    class function get_IsStaggeringEnabledProperty: IDependencyProperty; static; inline;
    class property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    class property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    class property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ExponentialEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IExponentialEase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IExponentialEaseStatics"
  // Instantiable: "Animation_IExponentialEase"
  TAnimation_ExponentialEase = class(TWinRTGenericImportSI<Animation_IExponentialEaseStatics, Animation_IExponentialEase>)
  public
    // -> Animation_IExponentialEaseStatics
    class function get_ExponentProperty: IDependencyProperty; static; inline;
    class property ExponentProperty: IDependencyProperty read get_ExponentProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.FadeInThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IFadeInThemeAnimationStatics"
  // Instantiable: "Animation_IFadeInThemeAnimation"
  TAnimation_FadeInThemeAnimation = class(TWinRTGenericImportSI<Animation_IFadeInThemeAnimationStatics, Animation_IFadeInThemeAnimation>)
  public
    // -> Animation_IFadeInThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.FadeOutThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IFadeOutThemeAnimationStatics"
  // Instantiable: "Animation_IFadeOutThemeAnimation"
  TAnimation_FadeOutThemeAnimation = class(TWinRTGenericImportSI<Animation_IFadeOutThemeAnimationStatics, Animation_IFadeOutThemeAnimation>)
  public
    // -> Animation_IFadeOutThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.GravityConnectedAnimationConfiguration
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfiguration
  // Factory: "Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfigurationFactory"
  // Instantiable: "Animation_IGravityConnectedAnimationConfiguration"
  TAnimation_GravityConnectedAnimationConfiguration = class(TWinRTGenericImportFI<Animation_IGravityConnectedAnimationConfigurationFactory, Animation_IGravityConnectedAnimationConfiguration>)
  public
    // -> Animation_IGravityConnectedAnimationConfigurationFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IGravityConnectedAnimationConfiguration; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.KeySpline
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IKeySpline
  // Instantiable: "Animation_IKeySpline"
  TAnimation_KeySpline = class(TWinRTGenericImportI<Animation_IKeySpline>) end;

  // Microsoft.UI.Xaml.Media.Animation.KeyTimeHelper
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelper
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IKeyTimeHelperStatics"
  TAnimation_KeyTimeHelper = class(TWinRTGenericImportS<Animation_IKeyTimeHelperStatics>)
  public
    // -> Animation_IKeyTimeHelperStatics
    class function FromTimeSpan(timeSpan: TimeSpan): Animation_KeyTime; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Animation.LinearColorKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ILinearColorKeyFrame
  // Instantiable: "Animation_ILinearColorKeyFrame"
  TAnimation_LinearColorKeyFrame = class(TWinRTGenericImportI<Animation_ILinearColorKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.LinearDoubleKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame
  // Instantiable: "Animation_ILinearDoubleKeyFrame"
  TAnimation_LinearDoubleKeyFrame = class(TWinRTGenericImportI<Animation_ILinearDoubleKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.LinearPointKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ILinearPointKeyFrame
  // Instantiable: "Animation_ILinearPointKeyFrame"
  TAnimation_LinearPointKeyFrame = class(TWinRTGenericImportI<Animation_ILinearPointKeyFrame>) end;

  // Microsoft.UI.Xaml.Media.Animation.NavigationThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.INavigationThemeTransitionStatics"
  // Instantiable: "Animation_INavigationThemeTransition"
  TAnimation_NavigationThemeTransition = class(TWinRTGenericImportSI<Animation_INavigationThemeTransitionStatics, Animation_INavigationThemeTransition>)
  public
    // -> Animation_INavigationThemeTransitionStatics
    class function get_DefaultNavigationTransitionInfoProperty: IDependencyProperty; static; inline;
    class property DefaultNavigationTransitionInfoProperty: IDependencyProperty read get_DefaultNavigationTransitionInfoProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.ObjectAnimationUsingKeyFrames
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFramesStatics"
  // Instantiable: "Animation_IObjectAnimationUsingKeyFrames"
  TAnimation_ObjectAnimationUsingKeyFrames = class(TWinRTGenericImportSI<Animation_IObjectAnimationUsingKeyFramesStatics, Animation_IObjectAnimationUsingKeyFrames>)
  public
    // -> Animation_IObjectAnimationUsingKeyFramesStatics
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;


  // Microsoft.UI.Xaml.Media.Animation.PaneThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPaneThemeTransitionStatics"
  // Instantiable: "Animation_IPaneThemeTransition"
  TAnimation_PaneThemeTransition = class(TWinRTGenericImportSI<Animation_IPaneThemeTransitionStatics, Animation_IPaneThemeTransition>)
  public
    // -> Animation_IPaneThemeTransitionStatics
    class function get_EdgeProperty: IDependencyProperty; static; inline;
    class property EdgeProperty: IDependencyProperty read get_EdgeProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PointAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPointAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPointAnimationStatics"
  // Instantiable: "Animation_IPointAnimation"
  TAnimation_PointAnimation = class(TWinRTGenericImportSI<Animation_IPointAnimationStatics, Animation_IPointAnimation>)
  public
    // -> Animation_IPointAnimationStatics
    class function get_FromProperty: IDependencyProperty; static; inline;
    class function get_ToProperty: IDependencyProperty; static; inline;
    class function get_ByProperty: IDependencyProperty; static; inline;
    class function get_EasingFunctionProperty: IDependencyProperty; static; inline;
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property ByProperty: IDependencyProperty read get_ByProperty;
    class property EasingFunctionProperty: IDependencyProperty read get_EasingFunctionProperty;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
    class property FromProperty: IDependencyProperty read get_FromProperty;
    class property ToProperty: IDependencyProperty read get_ToProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PointAnimationUsingKeyFrames
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFramesStatics"
  // Instantiable: "Animation_IPointAnimationUsingKeyFrames"
  TAnimation_PointAnimationUsingKeyFrames = class(TWinRTGenericImportSI<Animation_IPointAnimationUsingKeyFramesStatics, Animation_IPointAnimationUsingKeyFrames>)
  public
    // -> Animation_IPointAnimationUsingKeyFramesStatics
    class function get_EnableDependentAnimationProperty: IDependencyProperty; static; inline;
    class property EnableDependentAnimationProperty: IDependencyProperty read get_EnableDependentAnimationProperty;
  end;


  // Microsoft.UI.Xaml.Media.Animation.PointerDownThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPointerDownThemeAnimationStatics"
  // Instantiable: "Animation_IPointerDownThemeAnimation"
  TAnimation_PointerDownThemeAnimation = class(TWinRTGenericImportSI<Animation_IPointerDownThemeAnimationStatics, Animation_IPointerDownThemeAnimation>)
  public
    // -> Animation_IPointerDownThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PointerUpThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPointerUpThemeAnimationStatics"
  // Instantiable: "Animation_IPointerUpThemeAnimation"
  TAnimation_PointerUpThemeAnimation = class(TWinRTGenericImportSI<Animation_IPointerUpThemeAnimationStatics, Animation_IPointerUpThemeAnimation>)
  public
    // -> Animation_IPointerUpThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PopInThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPopInThemeAnimationStatics"
  // Instantiable: "Animation_IPopInThemeAnimation"
  TAnimation_PopInThemeAnimation = class(TWinRTGenericImportSI<Animation_IPopInThemeAnimationStatics, Animation_IPopInThemeAnimation>)
  public
    // -> Animation_IPopInThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function get_FromHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_FromVerticalOffsetProperty: IDependencyProperty; static; inline;
    class property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    class property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PopOutThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPopOutThemeAnimationStatics"
  // Instantiable: "Animation_IPopOutThemeAnimation"
  TAnimation_PopOutThemeAnimation = class(TWinRTGenericImportSI<Animation_IPopOutThemeAnimationStatics, Animation_IPopOutThemeAnimation>)
  public
    // -> Animation_IPopOutThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PopupThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPopupThemeTransitionStatics"
  // Instantiable: "Animation_IPopupThemeTransition"
  TAnimation_PopupThemeTransition = class(TWinRTGenericImportSI<Animation_IPopupThemeTransitionStatics, Animation_IPopupThemeTransition>)
  public
    // -> Animation_IPopupThemeTransitionStatics
    class function get_FromHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_FromVerticalOffsetProperty: IDependencyProperty; static; inline;
    class property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    class property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.PowerEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IPowerEase
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IPowerEaseStatics"
  // Instantiable: "Animation_IPowerEase"
  TAnimation_PowerEase = class(TWinRTGenericImportSI<Animation_IPowerEaseStatics, Animation_IPowerEase>)
  public
    // -> Animation_IPowerEaseStatics
    class function get_PowerProperty: IDependencyProperty; static; inline;
    class property PowerProperty: IDependencyProperty read get_PowerProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.QuadraticEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IQuadraticEase
  // Instantiable: "Animation_IQuadraticEase"
  TAnimation_QuadraticEase = class(TWinRTGenericImportI<Animation_IQuadraticEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.QuarticEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IQuarticEase
  // Instantiable: "Animation_IQuarticEase"
  TAnimation_QuarticEase = class(TWinRTGenericImportI<Animation_IQuarticEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.QuinticEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IQuinticEase
  // Instantiable: "Animation_IQuinticEase"
  TAnimation_QuinticEase = class(TWinRTGenericImportI<Animation_IQuinticEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.ReorderThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IReorderThemeTransition
  // Instantiable: "Animation_IReorderThemeTransition"
  TAnimation_ReorderThemeTransition = class(TWinRTGenericImportI<Animation_IReorderThemeTransition>) end;

  // Microsoft.UI.Xaml.Media.Animation.RepeatBehaviorHelper
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelper
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IRepeatBehaviorHelperStatics"
  TAnimation_RepeatBehaviorHelper = class(TWinRTGenericImportS<Animation_IRepeatBehaviorHelperStatics>)
  public
    // -> Animation_IRepeatBehaviorHelperStatics
    class function get_Forever: Animation_RepeatBehavior; static; inline;
    class function FromCount(count: Double): Animation_RepeatBehavior; static; inline;
    class function FromDuration(duration: TimeSpan): Animation_RepeatBehavior; static; inline;
    class function GetHasCount(target: Animation_RepeatBehavior): Boolean; static; inline;
    class function GetHasDuration(target: Animation_RepeatBehavior): Boolean; static; inline;
    class function Equals(target: Animation_RepeatBehavior; value: Animation_RepeatBehavior): Boolean; reintroduce; static; inline;
    class property Forever: Animation_RepeatBehavior read get_Forever;
  end;

  // Microsoft.UI.Xaml.Media.Animation.RepositionThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IRepositionThemeAnimationStatics"
  // Instantiable: "Animation_IRepositionThemeAnimation"
  TAnimation_RepositionThemeAnimation = class(TWinRTGenericImportSI<Animation_IRepositionThemeAnimationStatics, Animation_IRepositionThemeAnimation>)
  public
    // -> Animation_IRepositionThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function get_FromHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_FromVerticalOffsetProperty: IDependencyProperty; static; inline;
    class property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    class property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.RepositionThemeTransition
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransition
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IRepositionThemeTransitionStatics"
  // Instantiable: "Animation_IRepositionThemeTransition"
  TAnimation_RepositionThemeTransition = class(TWinRTGenericImportSI<Animation_IRepositionThemeTransitionStatics, Animation_IRepositionThemeTransition>)
  public
    // -> Animation_IRepositionThemeTransitionStatics
    class function get_IsStaggeringEnabledProperty: IDependencyProperty; static; inline;
    class property IsStaggeringEnabledProperty: IDependencyProperty read get_IsStaggeringEnabledProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SineEase
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISineEase
  // Instantiable: "Animation_ISineEase"
  TAnimation_SineEase = class(TWinRTGenericImportI<Animation_ISineEase>) end;

  // Microsoft.UI.Xaml.Media.Animation.SlideNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfoStatics"
  // Instantiable: "Animation_ISlideNavigationTransitionInfo"
  TAnimation_SlideNavigationTransitionInfo = class(TWinRTGenericImportSI<Animation_ISlideNavigationTransitionInfoStatics, Animation_ISlideNavigationTransitionInfo>)
  public
    // -> Animation_ISlideNavigationTransitionInfoStatics
    class function get_EffectProperty: IDependencyProperty; static; inline;
    class property EffectProperty: IDependencyProperty read get_EffectProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SplineColorKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISplineColorKeyFrameStatics"
  // Instantiable: "Animation_ISplineColorKeyFrame"
  TAnimation_SplineColorKeyFrame = class(TWinRTGenericImportSI<Animation_ISplineColorKeyFrameStatics, Animation_ISplineColorKeyFrame>)
  public
    // -> Animation_ISplineColorKeyFrameStatics
    class function get_KeySplineProperty: IDependencyProperty; static; inline;
    class property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SplineDoubleKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISplineDoubleKeyFrameStatics"
  // Instantiable: "Animation_ISplineDoubleKeyFrame"
  TAnimation_SplineDoubleKeyFrame = class(TWinRTGenericImportSI<Animation_ISplineDoubleKeyFrameStatics, Animation_ISplineDoubleKeyFrame>)
  public
    // -> Animation_ISplineDoubleKeyFrameStatics
    class function get_KeySplineProperty: IDependencyProperty; static; inline;
    class property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SplinePointKeyFrame
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrame
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISplinePointKeyFrameStatics"
  // Instantiable: "Animation_ISplinePointKeyFrame"
  TAnimation_SplinePointKeyFrame = class(TWinRTGenericImportSI<Animation_ISplinePointKeyFrameStatics, Animation_ISplinePointKeyFrame>)
  public
    // -> Animation_ISplinePointKeyFrameStatics
    class function get_KeySplineProperty: IDependencyProperty; static; inline;
    class property KeySplineProperty: IDependencyProperty read get_KeySplineProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SplitCloseThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISplitCloseThemeAnimationStatics"
  // Instantiable: "Animation_ISplitCloseThemeAnimation"
  TAnimation_SplitCloseThemeAnimation = class(TWinRTGenericImportSI<Animation_ISplitCloseThemeAnimationStatics, Animation_ISplitCloseThemeAnimation>)
  public
    // -> Animation_ISplitCloseThemeAnimationStatics
    class function get_OpenedTargetNameProperty: IDependencyProperty; static; inline;
    class function get_OpenedTargetProperty: IDependencyProperty; static; inline;
    class function get_ClosedTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ClosedTargetProperty: IDependencyProperty; static; inline;
    class function get_ContentTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ContentTargetProperty: IDependencyProperty; static; inline;
    class function get_OpenedLengthProperty: IDependencyProperty; static; inline;
    class function get_ClosedLengthProperty: IDependencyProperty; static; inline;
    class function get_OffsetFromCenterProperty: IDependencyProperty; static; inline;
    class function get_ContentTranslationDirectionProperty: IDependencyProperty; static; inline;
    class function get_ContentTranslationOffsetProperty: IDependencyProperty; static; inline;
    class property ClosedLengthProperty: IDependencyProperty read get_ClosedLengthProperty;
    class property ClosedTargetNameProperty: IDependencyProperty read get_ClosedTargetNameProperty;
    class property ClosedTargetProperty: IDependencyProperty read get_ClosedTargetProperty;
    class property ContentTargetNameProperty: IDependencyProperty read get_ContentTargetNameProperty;
    class property ContentTargetProperty: IDependencyProperty read get_ContentTargetProperty;
    class property ContentTranslationDirectionProperty: IDependencyProperty read get_ContentTranslationDirectionProperty;
    class property ContentTranslationOffsetProperty: IDependencyProperty read get_ContentTranslationOffsetProperty;
    class property OffsetFromCenterProperty: IDependencyProperty read get_OffsetFromCenterProperty;
    class property OpenedLengthProperty: IDependencyProperty read get_OpenedLengthProperty;
    class property OpenedTargetNameProperty: IDependencyProperty read get_OpenedTargetNameProperty;
    class property OpenedTargetProperty: IDependencyProperty read get_OpenedTargetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SplitOpenThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISplitOpenThemeAnimationStatics"
  // Instantiable: "Animation_ISplitOpenThemeAnimation"
  TAnimation_SplitOpenThemeAnimation = class(TWinRTGenericImportSI<Animation_ISplitOpenThemeAnimationStatics, Animation_ISplitOpenThemeAnimation>)
  public
    // -> Animation_ISplitOpenThemeAnimationStatics
    class function get_OpenedTargetNameProperty: IDependencyProperty; static; inline;
    class function get_OpenedTargetProperty: IDependencyProperty; static; inline;
    class function get_ClosedTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ClosedTargetProperty: IDependencyProperty; static; inline;
    class function get_ContentTargetNameProperty: IDependencyProperty; static; inline;
    class function get_ContentTargetProperty: IDependencyProperty; static; inline;
    class function get_OpenedLengthProperty: IDependencyProperty; static; inline;
    class function get_ClosedLengthProperty: IDependencyProperty; static; inline;
    class function get_OffsetFromCenterProperty: IDependencyProperty; static; inline;
    class function get_ContentTranslationDirectionProperty: IDependencyProperty; static; inline;
    class function get_ContentTranslationOffsetProperty: IDependencyProperty; static; inline;
    class property ClosedLengthProperty: IDependencyProperty read get_ClosedLengthProperty;
    class property ClosedTargetNameProperty: IDependencyProperty read get_ClosedTargetNameProperty;
    class property ClosedTargetProperty: IDependencyProperty read get_ClosedTargetProperty;
    class property ContentTargetNameProperty: IDependencyProperty read get_ContentTargetNameProperty;
    class property ContentTargetProperty: IDependencyProperty read get_ContentTargetProperty;
    class property ContentTranslationDirectionProperty: IDependencyProperty read get_ContentTranslationDirectionProperty;
    class property ContentTranslationOffsetProperty: IDependencyProperty read get_ContentTranslationOffsetProperty;
    class property OffsetFromCenterProperty: IDependencyProperty read get_OffsetFromCenterProperty;
    class property OpenedLengthProperty: IDependencyProperty read get_OpenedLengthProperty;
    class property OpenedTargetNameProperty: IDependencyProperty read get_OpenedTargetNameProperty;
    class property OpenedTargetProperty: IDependencyProperty read get_OpenedTargetProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.Storyboard
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.IStoryboard
  // Statics: "Microsoft.UI.Xaml.Media.Animation.IStoryboardStatics"
  // Instantiable: "Animation_IStoryboard"
  TAnimation_Storyboard = class(TWinRTGenericImportSI<Animation_IStoryboardStatics, Animation_IStoryboard>)
  public
    // -> Animation_IStoryboardStatics
    class function get_TargetPropertyProperty: IDependencyProperty; static; inline;
    class function GetTargetProperty(element: Animation_ITimeline): HSTRING; static; inline;
    class procedure SetTargetProperty(element: Animation_ITimeline; path: HSTRING); static; inline;
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function GetTargetName(element: Animation_ITimeline): HSTRING; static; inline;
    class procedure SetTargetName(element: Animation_ITimeline; name: HSTRING); static; inline;
    class procedure SetTarget(timeline: Animation_ITimeline; target: IDependencyObject); static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    class property TargetPropertyProperty: IDependencyProperty read get_TargetPropertyProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SuppressNavigationTransitionInfo
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo
  // Instantiable: "Animation_ISuppressNavigationTransitionInfo"
  TAnimation_SuppressNavigationTransitionInfo = class(TWinRTGenericImportI<Animation_ISuppressNavigationTransitionInfo>) end;

  // Microsoft.UI.Xaml.Media.Animation.SwipeBackThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISwipeBackThemeAnimationStatics"
  // Instantiable: "Animation_ISwipeBackThemeAnimation"
  TAnimation_SwipeBackThemeAnimation = class(TWinRTGenericImportSI<Animation_ISwipeBackThemeAnimationStatics, Animation_ISwipeBackThemeAnimation>)
  public
    // -> Animation_ISwipeBackThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function get_FromHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_FromVerticalOffsetProperty: IDependencyProperty; static; inline;
    class property FromHorizontalOffsetProperty: IDependencyProperty read get_FromHorizontalOffsetProperty;
    class property FromVerticalOffsetProperty: IDependencyProperty read get_FromVerticalOffsetProperty;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
  end;

  // Microsoft.UI.Xaml.Media.Animation.SwipeHintThemeAnimation
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation
  // Statics: "Microsoft.UI.Xaml.Media.Animation.ISwipeHintThemeAnimationStatics"
  // Instantiable: "Animation_ISwipeHintThemeAnimation"
  TAnimation_SwipeHintThemeAnimation = class(TWinRTGenericImportSI<Animation_ISwipeHintThemeAnimationStatics, Animation_ISwipeHintThemeAnimation>)
  public
    // -> Animation_ISwipeHintThemeAnimationStatics
    class function get_TargetNameProperty: IDependencyProperty; static; inline;
    class function get_ToHorizontalOffsetProperty: IDependencyProperty; static; inline;
    class function get_ToVerticalOffsetProperty: IDependencyProperty; static; inline;
    class property TargetNameProperty: IDependencyProperty read get_TargetNameProperty;
    class property ToHorizontalOffsetProperty: IDependencyProperty read get_ToHorizontalOffsetProperty;
    class property ToVerticalOffsetProperty: IDependencyProperty read get_ToVerticalOffsetProperty;
  end;



  // Microsoft.UI.Xaml.Media.PathSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPathSegment
  // Factory: "Microsoft.UI.Xaml.Media.IPathSegmentFactory"
  // Instantiable: "IPathSegment"
  TPathSegment = class(TWinRTGenericImportFI<IPathSegmentFactory, IPathSegment>)
  public
    // -> IPathSegmentFactory
  end;

  // Microsoft.UI.Xaml.Media.ArcSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IArcSegment
  // Statics: "Microsoft.UI.Xaml.Media.IArcSegmentStatics"
  // Instantiable: "IArcSegment"
  TArcSegment = class(TWinRTGenericImportSI<IArcSegmentStatics, IArcSegment>)
  public
    // -> IArcSegmentStatics
    class function get_PointProperty: IDependencyProperty; static; inline;
    class function get_SizeProperty: IDependencyProperty; static; inline;
    class function get_RotationAngleProperty: IDependencyProperty; static; inline;
    class function get_IsLargeArcProperty: IDependencyProperty; static; inline;
    class function get_SweepDirectionProperty: IDependencyProperty; static; inline;
    class property IsLargeArcProperty: IDependencyProperty read get_IsLargeArcProperty;
    class property PointProperty: IDependencyProperty read get_PointProperty;
    class property RotationAngleProperty: IDependencyProperty read get_RotationAngleProperty;
    class property SizeProperty: IDependencyProperty read get_SizeProperty;
    class property SweepDirectionProperty: IDependencyProperty read get_SweepDirectionProperty;
  end;

  // Microsoft.UI.Xaml.Media.BezierSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IBezierSegment
  // Statics: "Microsoft.UI.Xaml.Media.IBezierSegmentStatics"
  // Instantiable: "IBezierSegment"
  TBezierSegment = class(TWinRTGenericImportSI<IBezierSegmentStatics, IBezierSegment>)
  public
    // -> IBezierSegmentStatics
    class function get_Point1Property: IDependencyProperty; static; inline;
    class function get_Point2Property: IDependencyProperty; static; inline;
    class function get_Point3Property: IDependencyProperty; static; inline;
    class property Point1Property: IDependencyProperty read get_Point1Property;
    class property Point2Property: IDependencyProperty read get_Point2Property;
    class property Point3Property: IDependencyProperty read get_Point3Property;
  end;

  // Microsoft.UI.Xaml.Media.CacheMode
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ICacheMode
  // Factory: "Microsoft.UI.Xaml.Media.ICacheModeFactory"
  // Instantiable: "ICacheMode"
  TCacheMode = class(TWinRTGenericImportFI<ICacheModeFactory, ICacheMode>)
  public
    // -> ICacheModeFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ICacheMode; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.BitmapCache
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IBitmapCache
  // Instantiable: "IBitmapCache"
  TBitmapCache = class(TWinRTGenericImportI<IBitmapCache>) end;


  // Microsoft.UI.Xaml.Media.GeneralTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IGeneralTransform
  // Implements: Microsoft.UI.Xaml.Media.IGeneralTransformOverrides
  // Factory: "Microsoft.UI.Xaml.Media.IGeneralTransformFactory"
  // Instantiable: "IGeneralTransform"
  TGeneralTransform = class(TWinRTGenericImportFI<IGeneralTransformFactory, IGeneralTransform>)
  public
    // -> IGeneralTransformFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGeneralTransform; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Transform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ITransform
  // Factory: "Microsoft.UI.Xaml.Media.ITransformFactory"
  // Instantiable: "ITransform"
  TTransform = class(TWinRTGenericImportFI<ITransformFactory, ITransform>)
  public
    // -> ITransformFactory
  end;

  // Microsoft.UI.Xaml.Media.CompositeTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ICompositeTransform
  // Statics: "Microsoft.UI.Xaml.Media.ICompositeTransformStatics"
  // Instantiable: "ICompositeTransform"
  TCompositeTransform = class(TWinRTGenericImportSI<ICompositeTransformStatics, ICompositeTransform>)
  public
    // -> ICompositeTransformStatics
    class function get_CenterXProperty: IDependencyProperty; static; inline;
    class function get_CenterYProperty: IDependencyProperty; static; inline;
    class function get_ScaleXProperty: IDependencyProperty; static; inline;
    class function get_ScaleYProperty: IDependencyProperty; static; inline;
    class function get_SkewXProperty: IDependencyProperty; static; inline;
    class function get_SkewYProperty: IDependencyProperty; static; inline;
    class function get_RotationProperty: IDependencyProperty; static; inline;
    class function get_TranslateXProperty: IDependencyProperty; static; inline;
    class function get_TranslateYProperty: IDependencyProperty; static; inline;
    class property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    class property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    class property RotationProperty: IDependencyProperty read get_RotationProperty;
    class property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    class property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
    class property SkewXProperty: IDependencyProperty read get_SkewXProperty;
    class property SkewYProperty: IDependencyProperty read get_SkewYProperty;
    class property TranslateXProperty: IDependencyProperty read get_TranslateXProperty;
    class property TranslateYProperty: IDependencyProperty read get_TranslateYProperty;
  end;

  // Microsoft.UI.Xaml.Media.CompositionTarget
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ICompositionTarget
  // Statics: "Microsoft.UI.Xaml.Media.ICompositionTargetStatics"
  TCompositionTarget = class(TWinRTGenericImportS<ICompositionTargetStatics>)
  public
    // -> ICompositionTargetStatics
    class function add_Rendering(handler: EventHandler_1__IInspectable): EventRegistrationToken; static; inline;
    class procedure remove_Rendering(token: EventRegistrationToken); static; inline;
    class function add_Rendered(handler: EventHandler_1__IRenderedEventArgs): EventRegistrationToken; static; inline;
    class procedure remove_Rendered(token: EventRegistrationToken); static; inline;
    class function add_SurfaceContentsLost(handler: EventHandler_1__IInspectable): EventRegistrationToken; static; inline;
    class procedure remove_SurfaceContentsLost(token: EventRegistrationToken); static; inline;
    class function GetCompositorForCurrentThread: ICompositor; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.SystemBackdrop
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ISystemBackdrop
  // Implements: Microsoft.UI.Xaml.Media.ISystemBackdropOverrides
  // Factory: "Microsoft.UI.Xaml.Media.ISystemBackdropFactory"
  // Instantiable: "ISystemBackdrop"
  TSystemBackdrop = class(TWinRTGenericImportFI<ISystemBackdropFactory, ISystemBackdrop>)
  public
    // -> ISystemBackdropFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ISystemBackdrop; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.DesktopAcrylicBackdrop
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdrop
  // Factory: "Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdropFactory"
  // Instantiable: "IDesktopAcrylicBackdrop"
  TDesktopAcrylicBackdrop = class(TWinRTGenericImportFI<IDesktopAcrylicBackdropFactory, IDesktopAcrylicBackdrop>)
  public
    // -> IDesktopAcrylicBackdropFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IDesktopAcrylicBackdrop; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.DoubleCollection
  // Explicitly imported
  // Implements: Windows.Foundation.Collections.IVector`1<Double>
  // Implements: Windows.Foundation.Collections.IIterable`1<Double>
  // Instantiable: "IVector_1__Double"
  TDoubleCollection = class(TWinRTGenericImportI<IVector_1__Double>) end;

  // Microsoft.UI.Xaml.Media.Geometry
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IGeometry
  // Statics: "Microsoft.UI.Xaml.Media.IGeometryStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IGeometryFactory"
  // Instantiable: "IGeometry"
  TGeometry = class(TWinRTGenericImportFSI<IGeometryFactory, IGeometryStatics, IGeometry>)
  public
    // -> IGeometryStatics
    class function get_Empty: IGeometry; static; inline;
    class function get_StandardFlatteningTolerance: Double; static; inline;
    class function get_TransformProperty: IDependencyProperty; static; inline;
    class property Empty: IGeometry read get_Empty;
    class property StandardFlatteningTolerance: Double read get_StandardFlatteningTolerance;
    class property TransformProperty: IDependencyProperty read get_TransformProperty;

    // -> IGeometryFactory
  end;

  // Microsoft.UI.Xaml.Media.EllipseGeometry
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IEllipseGeometry
  // Statics: "Microsoft.UI.Xaml.Media.IEllipseGeometryStatics"
  // Instantiable: "IEllipseGeometry"
  TEllipseGeometry = class(TWinRTGenericImportSI<IEllipseGeometryStatics, IEllipseGeometry>)
  public
    // -> IEllipseGeometryStatics
    class function get_CenterProperty: IDependencyProperty; static; inline;
    class function get_RadiusXProperty: IDependencyProperty; static; inline;
    class function get_RadiusYProperty: IDependencyProperty; static; inline;
    class property CenterProperty: IDependencyProperty read get_CenterProperty;
    class property RadiusXProperty: IDependencyProperty read get_RadiusXProperty;
    class property RadiusYProperty: IDependencyProperty read get_RadiusYProperty;
  end;

  // Microsoft.UI.Xaml.Media.FontFamily
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IFontFamily
  // Statics: "Microsoft.UI.Xaml.Media.IFontFamilyStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IFontFamilyFactory"
  // Instantiable: "IFontFamily"
  TFontFamily = class(TWinRTGenericImportFSI<IFontFamilyFactory, IFontFamilyStatics, IFontFamily>)
  public
    // -> IFontFamilyStatics
    class function get_XamlAutoFontFamily: IFontFamily; static; inline;
    class property XamlAutoFontFamily: IFontFamily read get_XamlAutoFontFamily;

    // -> IFontFamilyFactory
    class function CreateInstanceWithName(familyName: HSTRING; baseInterface: IInspectable; out innerInterface: IInspectable): IFontFamily; static; inline;
  end;


  // Microsoft.UI.Xaml.Media.GeometryGroup
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IGeometryGroup
  // Statics: "Microsoft.UI.Xaml.Media.IGeometryGroupStatics"
  // Instantiable: "IGeometryGroup"
  TGeometryGroup = class(TWinRTGenericImportSI<IGeometryGroupStatics, IGeometryGroup>)
  public
    // -> IGeometryGroupStatics
    class function get_FillRuleProperty: IDependencyProperty; static; inline;
    class function get_ChildrenProperty: IDependencyProperty; static; inline;
    class property ChildrenProperty: IDependencyProperty read get_ChildrenProperty;
    class property FillRuleProperty: IDependencyProperty read get_FillRuleProperty;
  end;

  // Microsoft.UI.Xaml.Media.GradientBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IGradientBrush
  // Statics: "Microsoft.UI.Xaml.Media.IGradientBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IGradientBrushFactory"
  // Instantiable: "IGradientBrush"
  TGradientBrush = class(TWinRTGenericImportFSI<IGradientBrushFactory, IGradientBrushStatics, IGradientBrush>)
  public
    // -> IGradientBrushStatics
    class function get_SpreadMethodProperty: IDependencyProperty; static; inline;
    class function get_MappingModeProperty: IDependencyProperty; static; inline;
    class function get_ColorInterpolationModeProperty: IDependencyProperty; static; inline;
    class function get_GradientStopsProperty: IDependencyProperty; static; inline;
    class property ColorInterpolationModeProperty: IDependencyProperty read get_ColorInterpolationModeProperty;
    class property GradientStopsProperty: IDependencyProperty read get_GradientStopsProperty;
    class property MappingModeProperty: IDependencyProperty read get_MappingModeProperty;
    class property SpreadMethodProperty: IDependencyProperty read get_SpreadMethodProperty;

    // -> IGradientBrushFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGradientBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.GradientStop
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IGradientStop
  // Statics: "Microsoft.UI.Xaml.Media.IGradientStopStatics"
  // Instantiable: "IGradientStop"
  TGradientStop = class(TWinRTGenericImportSI<IGradientStopStatics, IGradientStop>)
  public
    // -> IGradientStopStatics
    class function get_ColorProperty: IDependencyProperty; static; inline;
    class function get_OffsetProperty: IDependencyProperty; static; inline;
    class property ColorProperty: IDependencyProperty read get_ColorProperty;
    class property OffsetProperty: IDependencyProperty read get_OffsetProperty;
  end;


  // Microsoft.UI.Xaml.Media.TileBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ITileBrush
  // Statics: "Microsoft.UI.Xaml.Media.ITileBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.ITileBrushFactory"
  // Instantiable: "ITileBrush"
  TTileBrush = class(TWinRTGenericImportFSI<ITileBrushFactory, ITileBrushStatics, ITileBrush>)
  public
    // -> ITileBrushStatics
    class function get_AlignmentXProperty: IDependencyProperty; static; inline;
    class function get_AlignmentYProperty: IDependencyProperty; static; inline;
    class function get_StretchProperty: IDependencyProperty; static; inline;
    class property AlignmentXProperty: IDependencyProperty read get_AlignmentXProperty;
    class property AlignmentYProperty: IDependencyProperty read get_AlignmentYProperty;
    class property StretchProperty: IDependencyProperty read get_StretchProperty;

    // -> ITileBrushFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ITileBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.ImageBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IImageBrush
  // Statics: "Microsoft.UI.Xaml.Media.IImageBrushStatics"
  // Instantiable: "IImageBrush"
  TImageBrush = class(TWinRTGenericImportSI<IImageBrushStatics, IImageBrush>)
  public
    // -> IImageBrushStatics
    class function get_ImageSourceProperty: IDependencyProperty; static; inline;
    class property ImageSourceProperty: IDependencyProperty read get_ImageSourceProperty;
  end;

  // Microsoft.UI.Xaml.Media.ImageSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IImageSource
  // Factory: "Microsoft.UI.Xaml.Media.IImageSourceFactory"
  // Instantiable: "IImageSource"
  TImageSource = class(TWinRTGenericImportFI<IImageSourceFactory, IImageSource>)
  public
    // -> IImageSourceFactory
  end;

  // Microsoft.UI.Xaml.Media.Imaging.BitmapSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IBitmapSource
  // Statics: "Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceFactory"
  // Instantiable: "Imaging_IBitmapSource"
  TImaging_BitmapSource = class(TWinRTGenericImportFSI<Imaging_IBitmapSourceFactory, Imaging_IBitmapSourceStatics, Imaging_IBitmapSource>)
  public
    // -> Imaging_IBitmapSourceStatics
    class function get_PixelWidthProperty: IDependencyProperty; static; inline;
    class function get_PixelHeightProperty: IDependencyProperty; static; inline;
    class property PixelHeightProperty: IDependencyProperty read get_PixelHeightProperty;
    class property PixelWidthProperty: IDependencyProperty read get_PixelWidthProperty;

    // -> Imaging_IBitmapSourceFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IBitmapSource; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.BitmapImage
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IBitmapImage
  // Statics: "Microsoft.UI.Xaml.Media.Imaging.IBitmapImageStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.IBitmapImageFactory"
  // Instantiable: "Imaging_IBitmapImage"
  TImaging_BitmapImage = class(TWinRTGenericImportFSI<Imaging_IBitmapImageFactory, Imaging_IBitmapImageStatics, Imaging_IBitmapImage>)
  public
    // -> Imaging_IBitmapImageStatics
    class function get_CreateOptionsProperty: IDependencyProperty; static; inline;
    class function get_UriSourceProperty: IDependencyProperty; static; inline;
    class function get_DecodePixelWidthProperty: IDependencyProperty; static; inline;
    class function get_DecodePixelHeightProperty: IDependencyProperty; static; inline;
    class function get_DecodePixelTypeProperty: IDependencyProperty; static; inline;
    class function get_IsAnimatedBitmapProperty: IDependencyProperty; static; inline;
    class function get_IsPlayingProperty: IDependencyProperty; static; inline;
    class function get_AutoPlayProperty: IDependencyProperty; static; inline;
    class property AutoPlayProperty: IDependencyProperty read get_AutoPlayProperty;
    class property CreateOptionsProperty: IDependencyProperty read get_CreateOptionsProperty;
    class property DecodePixelHeightProperty: IDependencyProperty read get_DecodePixelHeightProperty;
    class property DecodePixelTypeProperty: IDependencyProperty read get_DecodePixelTypeProperty;
    class property DecodePixelWidthProperty: IDependencyProperty read get_DecodePixelWidthProperty;
    class property IsAnimatedBitmapProperty: IDependencyProperty read get_IsAnimatedBitmapProperty;
    class property IsPlayingProperty: IDependencyProperty read get_IsPlayingProperty;
    class property UriSourceProperty: IDependencyProperty read get_UriSourceProperty;

    // -> Imaging_IBitmapImageFactory
    class function CreateInstanceWithUriSource(uriSource: IUriRuntimeClass): Imaging_IBitmapImage; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.RenderTargetBitmap
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmap
  // Statics: "Microsoft.UI.Xaml.Media.Imaging.IRenderTargetBitmapStatics"
  // Instantiable: "Imaging_IRenderTargetBitmap"
  TImaging_RenderTargetBitmap = class(TWinRTGenericImportSI<Imaging_IRenderTargetBitmapStatics, Imaging_IRenderTargetBitmap>)
  public
    // -> Imaging_IRenderTargetBitmapStatics
    class function get_PixelWidthProperty: IDependencyProperty; static; inline;
    class function get_PixelHeightProperty: IDependencyProperty; static; inline;
    class property PixelHeightProperty: IDependencyProperty read get_PixelHeightProperty;
    class property PixelWidthProperty: IDependencyProperty read get_PixelWidthProperty;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.SoftwareBitmapSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.ISoftwareBitmapSource
  // Implements: Windows.Foundation.IClosable
  // Instantiable: "Imaging_ISoftwareBitmapSource"
  TImaging_SoftwareBitmapSource = class(TWinRTGenericImportI<Imaging_ISoftwareBitmapSource>) end;

  // Microsoft.UI.Xaml.Media.Imaging.SurfaceImageSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSource
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSourceFactory"
  // Instantiable: "Imaging_ISurfaceImageSource"
  TImaging_SurfaceImageSource = class(TWinRTGenericImportFI<Imaging_ISurfaceImageSourceFactory, Imaging_ISurfaceImageSource>)
  public
    // -> Imaging_ISurfaceImageSourceFactory
    class function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource; static; inline;
    class function CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.SvgImageSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.ISvgImageSource
  // Statics: "Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceStatics"
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFactory"
  // Instantiable: "Imaging_ISvgImageSource"
  TImaging_SvgImageSource = class(TWinRTGenericImportFSI<Imaging_ISvgImageSourceFactory, Imaging_ISvgImageSourceStatics, Imaging_ISvgImageSource>)
  public
    // -> Imaging_ISvgImageSourceStatics
    class function get_UriSourceProperty: IDependencyProperty; static; inline;
    class function get_RasterizePixelWidthProperty: IDependencyProperty; static; inline;
    class function get_RasterizePixelHeightProperty: IDependencyProperty; static; inline;
    class property RasterizePixelHeightProperty: IDependencyProperty read get_RasterizePixelHeightProperty;
    class property RasterizePixelWidthProperty: IDependencyProperty read get_RasterizePixelWidthProperty;
    class property UriSourceProperty: IDependencyProperty read get_UriSourceProperty;

    // -> Imaging_ISvgImageSourceFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource; static; inline;
    class function CreateInstanceWithUriSource(uriSource: IUriRuntimeClass; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.VirtualSurfaceImageSource
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory"
  TImaging_VirtualSurfaceImageSource = class(TWinRTGenericImportF<Imaging_IVirtualSurfaceImageSourceFactory>)
  public
    // -> Imaging_IVirtualSurfaceImageSourceFactory
    class function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IVirtualSurfaceImageSource; static; inline;
    class function CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean): Imaging_IVirtualSurfaceImageSource; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.WriteableBitmap
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmap
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmapFactory"
  TImaging_WriteableBitmap = class(TWinRTGenericImportF<Imaging_IWriteableBitmapFactory>)
  public
    // -> Imaging_IWriteableBitmapFactory
    class function CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IWriteableBitmap; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Imaging.XamlRenderingBackgroundTask
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask
  // Implements: Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskOverrides
  // Factory: "Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskFactory"
  // Instantiable: "Imaging_IXamlRenderingBackgroundTask"
  TImaging_XamlRenderingBackgroundTask = class(TWinRTGenericImportFI<Imaging_IXamlRenderingBackgroundTaskFactory, Imaging_IXamlRenderingBackgroundTask>)
  public
    // -> Imaging_IXamlRenderingBackgroundTaskFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IXamlRenderingBackgroundTask; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.LineGeometry
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ILineGeometry
  // Statics: "Microsoft.UI.Xaml.Media.ILineGeometryStatics"
  // Instantiable: "ILineGeometry"
  TLineGeometry = class(TWinRTGenericImportSI<ILineGeometryStatics, ILineGeometry>)
  public
    // -> ILineGeometryStatics
    class function get_StartPointProperty: IDependencyProperty; static; inline;
    class function get_EndPointProperty: IDependencyProperty; static; inline;
    class property EndPointProperty: IDependencyProperty read get_EndPointProperty;
    class property StartPointProperty: IDependencyProperty read get_StartPointProperty;
  end;

  // Microsoft.UI.Xaml.Media.LineSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ILineSegment
  // Statics: "Microsoft.UI.Xaml.Media.ILineSegmentStatics"
  // Instantiable: "ILineSegment"
  TLineSegment = class(TWinRTGenericImportSI<ILineSegmentStatics, ILineSegment>)
  public
    // -> ILineSegmentStatics
    class function get_PointProperty: IDependencyProperty; static; inline;
    class property PointProperty: IDependencyProperty read get_PointProperty;
  end;

  // Microsoft.UI.Xaml.Media.LinearGradientBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ILinearGradientBrush
  // Statics: "Microsoft.UI.Xaml.Media.ILinearGradientBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.ILinearGradientBrushFactory"
  // Instantiable: "ILinearGradientBrush"
  TLinearGradientBrush = class(TWinRTGenericImportFSI<ILinearGradientBrushFactory, ILinearGradientBrushStatics, ILinearGradientBrush>)
  public
    // -> ILinearGradientBrushStatics
    class function get_StartPointProperty: IDependencyProperty; static; inline;
    class function get_EndPointProperty: IDependencyProperty; static; inline;
    class property EndPointProperty: IDependencyProperty read get_EndPointProperty;
    class property StartPointProperty: IDependencyProperty read get_StartPointProperty;

    // -> ILinearGradientBrushFactory
    class function CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection: IVector_1__IGradientStop; angle: Double): ILinearGradientBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.LoadedImageSurface
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ILoadedImageSurface
  // Implements: Windows.Foundation.IClosable
  // Implements: Microsoft.UI.Composition.ICompositionSurface
  // Statics: "Microsoft.UI.Xaml.Media.ILoadedImageSurfaceStatics"
  TLoadedImageSurface = class(TWinRTGenericImportS<ILoadedImageSurfaceStatics>)
  public
    // -> ILoadedImageSurfaceStatics
    class function StartLoadFromUri(uri: IUriRuntimeClass; desiredMaxSize: TSizeF): ILoadedImageSurface; overload; static; inline;
    class function StartLoadFromUri(uri: IUriRuntimeClass): ILoadedImageSurface; overload; static; inline;
    class function StartLoadFromStream(stream: IRandomAccessStream; desiredMaxSize: TSizeF): ILoadedImageSurface; overload; static; inline;
    class function StartLoadFromStream(stream: IRandomAccessStream): ILoadedImageSurface; overload; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Projection
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IProjection
  // Factory: "Microsoft.UI.Xaml.Media.IProjectionFactory"
  // Instantiable: "IProjection"
  TProjection = class(TWinRTGenericImportFI<IProjectionFactory, IProjection>)
  public
    // -> IProjectionFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IProjection; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Matrix3DProjection
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IMatrix3DProjection
  // Statics: "Microsoft.UI.Xaml.Media.IMatrix3DProjectionStatics"
  // Instantiable: "IMatrix3DProjection"
  TMatrix3DProjection = class(TWinRTGenericImportSI<IMatrix3DProjectionStatics, IMatrix3DProjection>)
  public
    // -> IMatrix3DProjectionStatics
    class function get_ProjectionMatrixProperty: IDependencyProperty; static; inline;
    class property ProjectionMatrixProperty: IDependencyProperty read get_ProjectionMatrixProperty;
  end;

  // Microsoft.UI.Xaml.Media.MatrixHelper
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IMatrixHelper
  // Statics: "Microsoft.UI.Xaml.Media.IMatrixHelperStatics"
  TMatrixHelper = class(TWinRTGenericImportS<IMatrixHelperStatics>)
  public
    // -> IMatrixHelperStatics
    class function get_Identity: Matrix; static; inline;
    class function FromElements(m11: Double; m12: Double; m21: Double; m22: Double; offsetX: Double; offsetY: Double): Matrix; static; inline;
    class function GetIsIdentity(target: Matrix): Boolean; static; inline;
    class function Transform(target: Matrix; point: TPointF): TPointF; static; inline;
    class property Identity: Matrix read get_Identity;
  end;

  // Microsoft.UI.Xaml.Media.MatrixTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IMatrixTransform
  // Statics: "Microsoft.UI.Xaml.Media.IMatrixTransformStatics"
  // Instantiable: "IMatrixTransform"
  TMatrixTransform = class(TWinRTGenericImportSI<IMatrixTransformStatics, IMatrixTransform>)
  public
    // -> IMatrixTransformStatics
    class function get_MatrixProperty: IDependencyProperty; static; inline;
    class property MatrixProperty: IDependencyProperty read get_MatrixProperty;
  end;

  // Microsoft.UI.Xaml.Media.Media3D.Transform3D
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Media3D.ITransform3D
  // Factory: "Microsoft.UI.Xaml.Media.Media3D.ITransform3DFactory"
  // Instantiable: "Media3D_ITransform3D"
  TMedia3D_Transform3D = class(TWinRTGenericImportFI<Media3D_ITransform3DFactory, Media3D_ITransform3D>)
  public
    // -> Media3D_ITransform3DFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Media3D_ITransform3D; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.Media3D.CompositeTransform3D
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3D
  // Statics: "Microsoft.UI.Xaml.Media.Media3D.ICompositeTransform3DStatics"
  // Instantiable: "Media3D_ICompositeTransform3D"
  TMedia3D_CompositeTransform3D = class(TWinRTGenericImportSI<Media3D_ICompositeTransform3DStatics, Media3D_ICompositeTransform3D>)
  public
    // -> Media3D_ICompositeTransform3DStatics
    class function get_CenterXProperty: IDependencyProperty; static; inline;
    class function get_CenterYProperty: IDependencyProperty; static; inline;
    class function get_CenterZProperty: IDependencyProperty; static; inline;
    class function get_RotationXProperty: IDependencyProperty; static; inline;
    class function get_RotationYProperty: IDependencyProperty; static; inline;
    class function get_RotationZProperty: IDependencyProperty; static; inline;
    class function get_ScaleXProperty: IDependencyProperty; static; inline;
    class function get_ScaleYProperty: IDependencyProperty; static; inline;
    class function get_ScaleZProperty: IDependencyProperty; static; inline;
    class function get_TranslateXProperty: IDependencyProperty; static; inline;
    class function get_TranslateYProperty: IDependencyProperty; static; inline;
    class function get_TranslateZProperty: IDependencyProperty; static; inline;
    class property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    class property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    class property CenterZProperty: IDependencyProperty read get_CenterZProperty;
    class property RotationXProperty: IDependencyProperty read get_RotationXProperty;
    class property RotationYProperty: IDependencyProperty read get_RotationYProperty;
    class property RotationZProperty: IDependencyProperty read get_RotationZProperty;
    class property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    class property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
    class property ScaleZProperty: IDependencyProperty read get_ScaleZProperty;
    class property TranslateXProperty: IDependencyProperty read get_TranslateXProperty;
    class property TranslateYProperty: IDependencyProperty read get_TranslateYProperty;
    class property TranslateZProperty: IDependencyProperty read get_TranslateZProperty;
  end;

  // Microsoft.UI.Xaml.Media.Media3D.Matrix3DHelper
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelper
  // Statics: "Microsoft.UI.Xaml.Media.Media3D.IMatrix3DHelperStatics"
  TMedia3D_Matrix3DHelper = class(TWinRTGenericImportS<Media3D_IMatrix3DHelperStatics>)
  public
    // -> Media3D_IMatrix3DHelperStatics
    class function get_Identity: Media3D_Matrix3D; static; inline;
    class function Multiply(matrix1: Media3D_Matrix3D; matrix2: Media3D_Matrix3D): Media3D_Matrix3D; static; inline;
    class function FromElements(m11: Double; m12: Double; m13: Double; m14: Double; m21: Double; m22: Double; m23: Double; m24: Double; m31: Double; m32: Double; m33: Double; m34: Double; offsetX: Double; offsetY: Double; offsetZ: Double; m44: Double): Media3D_Matrix3D; static; inline;
    class function GetHasInverse(target: Media3D_Matrix3D): Boolean; static; inline;
    class function GetIsIdentity(target: Media3D_Matrix3D): Boolean; static; inline;
    class function Invert(target: Media3D_Matrix3D): Media3D_Matrix3D; static; inline;
    class property Identity: Media3D_Matrix3D read get_Identity;
  end;

  // Microsoft.UI.Xaml.Media.Media3D.PerspectiveTransform3D
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3D
  // Statics: "Microsoft.UI.Xaml.Media.Media3D.IPerspectiveTransform3DStatics"
  // Instantiable: "Media3D_IPerspectiveTransform3D"
  TMedia3D_PerspectiveTransform3D = class(TWinRTGenericImportSI<Media3D_IPerspectiveTransform3DStatics, Media3D_IPerspectiveTransform3D>)
  public
    // -> Media3D_IPerspectiveTransform3DStatics
    class function get_DepthProperty: IDependencyProperty; static; inline;
    class function get_OffsetXProperty: IDependencyProperty; static; inline;
    class function get_OffsetYProperty: IDependencyProperty; static; inline;
    class property DepthProperty: IDependencyProperty read get_DepthProperty;
    class property OffsetXProperty: IDependencyProperty read get_OffsetXProperty;
    class property OffsetYProperty: IDependencyProperty read get_OffsetYProperty;
  end;

  // Microsoft.UI.Xaml.Media.MicaBackdrop
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IMicaBackdrop
  // Statics: "Microsoft.UI.Xaml.Media.IMicaBackdropStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IMicaBackdropFactory"
  // Instantiable: "IMicaBackdrop"
  TMicaBackdrop = class(TWinRTGenericImportFSI<IMicaBackdropFactory, IMicaBackdropStatics, IMicaBackdrop>)
  public
    // -> IMicaBackdropStatics
    class function get_KindProperty: IDependencyProperty; static; inline;
    class property KindProperty: IDependencyProperty read get_KindProperty;

    // -> IMicaBackdropFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IMicaBackdrop; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.PathFigure
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPathFigure
  // Statics: "Microsoft.UI.Xaml.Media.IPathFigureStatics"
  // Instantiable: "IPathFigure"
  TPathFigure = class(TWinRTGenericImportSI<IPathFigureStatics, IPathFigure>)
  public
    // -> IPathFigureStatics
    class function get_SegmentsProperty: IDependencyProperty; static; inline;
    class function get_StartPointProperty: IDependencyProperty; static; inline;
    class function get_IsClosedProperty: IDependencyProperty; static; inline;
    class function get_IsFilledProperty: IDependencyProperty; static; inline;
    class property IsClosedProperty: IDependencyProperty read get_IsClosedProperty;
    class property IsFilledProperty: IDependencyProperty read get_IsFilledProperty;
    class property SegmentsProperty: IDependencyProperty read get_SegmentsProperty;
    class property StartPointProperty: IDependencyProperty read get_StartPointProperty;
  end;


  // Microsoft.UI.Xaml.Media.PathGeometry
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPathGeometry
  // Statics: "Microsoft.UI.Xaml.Media.IPathGeometryStatics"
  // Instantiable: "IPathGeometry"
  TPathGeometry = class(TWinRTGenericImportSI<IPathGeometryStatics, IPathGeometry>)
  public
    // -> IPathGeometryStatics
    class function get_FillRuleProperty: IDependencyProperty; static; inline;
    class function get_FiguresProperty: IDependencyProperty; static; inline;
    class property FiguresProperty: IDependencyProperty read get_FiguresProperty;
    class property FillRuleProperty: IDependencyProperty read get_FillRuleProperty;
  end;


  // Microsoft.UI.Xaml.Media.PlaneProjection
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPlaneProjection
  // Statics: "Microsoft.UI.Xaml.Media.IPlaneProjectionStatics"
  // Instantiable: "IPlaneProjection"
  TPlaneProjection = class(TWinRTGenericImportSI<IPlaneProjectionStatics, IPlaneProjection>)
  public
    // -> IPlaneProjectionStatics
    class function get_LocalOffsetXProperty: IDependencyProperty; static; inline;
    class function get_LocalOffsetYProperty: IDependencyProperty; static; inline;
    class function get_LocalOffsetZProperty: IDependencyProperty; static; inline;
    class function get_RotationXProperty: IDependencyProperty; static; inline;
    class function get_RotationYProperty: IDependencyProperty; static; inline;
    class function get_RotationZProperty: IDependencyProperty; static; inline;
    class function get_CenterOfRotationXProperty: IDependencyProperty; static; inline;
    class function get_CenterOfRotationYProperty: IDependencyProperty; static; inline;
    class function get_CenterOfRotationZProperty: IDependencyProperty; static; inline;
    class function get_GlobalOffsetXProperty: IDependencyProperty; static; inline;
    class function get_GlobalOffsetYProperty: IDependencyProperty; static; inline;
    class function get_GlobalOffsetZProperty: IDependencyProperty; static; inline;
    class function get_ProjectionMatrixProperty: IDependencyProperty; static; inline;
    class property CenterOfRotationXProperty: IDependencyProperty read get_CenterOfRotationXProperty;
    class property CenterOfRotationYProperty: IDependencyProperty read get_CenterOfRotationYProperty;
    class property CenterOfRotationZProperty: IDependencyProperty read get_CenterOfRotationZProperty;
    class property GlobalOffsetXProperty: IDependencyProperty read get_GlobalOffsetXProperty;
    class property GlobalOffsetYProperty: IDependencyProperty read get_GlobalOffsetYProperty;
    class property GlobalOffsetZProperty: IDependencyProperty read get_GlobalOffsetZProperty;
    class property LocalOffsetXProperty: IDependencyProperty read get_LocalOffsetXProperty;
    class property LocalOffsetYProperty: IDependencyProperty read get_LocalOffsetYProperty;
    class property LocalOffsetZProperty: IDependencyProperty read get_LocalOffsetZProperty;
    class property ProjectionMatrixProperty: IDependencyProperty read get_ProjectionMatrixProperty;
    class property RotationXProperty: IDependencyProperty read get_RotationXProperty;
    class property RotationYProperty: IDependencyProperty read get_RotationYProperty;
    class property RotationZProperty: IDependencyProperty read get_RotationZProperty;
  end;

  // Microsoft.UI.Xaml.Media.PointCollection
  // Explicitly imported
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Foundation.Point>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  // Instantiable: "IVector_1__Point"
  TPointCollection = class(TWinRTGenericImportI<IVector_1__Point>) end;

  // Microsoft.UI.Xaml.Media.PolyBezierSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPolyBezierSegment
  // Statics: "Microsoft.UI.Xaml.Media.IPolyBezierSegmentStatics"
  // Instantiable: "IPolyBezierSegment"
  TPolyBezierSegment = class(TWinRTGenericImportSI<IPolyBezierSegmentStatics, IPolyBezierSegment>)
  public
    // -> IPolyBezierSegmentStatics
    class function get_PointsProperty: IDependencyProperty; static; inline;
    class property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // Microsoft.UI.Xaml.Media.PolyLineSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPolyLineSegment
  // Statics: "Microsoft.UI.Xaml.Media.IPolyLineSegmentStatics"
  // Instantiable: "IPolyLineSegment"
  TPolyLineSegment = class(TWinRTGenericImportSI<IPolyLineSegmentStatics, IPolyLineSegment>)
  public
    // -> IPolyLineSegmentStatics
    class function get_PointsProperty: IDependencyProperty; static; inline;
    class property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // Microsoft.UI.Xaml.Media.PolyQuadraticBezierSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegment
  // Statics: "Microsoft.UI.Xaml.Media.IPolyQuadraticBezierSegmentStatics"
  // Instantiable: "IPolyQuadraticBezierSegment"
  TPolyQuadraticBezierSegment = class(TWinRTGenericImportSI<IPolyQuadraticBezierSegmentStatics, IPolyQuadraticBezierSegment>)
  public
    // -> IPolyQuadraticBezierSegmentStatics
    class function get_PointsProperty: IDependencyProperty; static; inline;
    class property PointsProperty: IDependencyProperty read get_PointsProperty;
  end;

  // Microsoft.UI.Xaml.Media.QuadraticBezierSegment
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IQuadraticBezierSegment
  // Statics: "Microsoft.UI.Xaml.Media.IQuadraticBezierSegmentStatics"
  // Instantiable: "IQuadraticBezierSegment"
  TQuadraticBezierSegment = class(TWinRTGenericImportSI<IQuadraticBezierSegmentStatics, IQuadraticBezierSegment>)
  public
    // -> IQuadraticBezierSegmentStatics
    class function get_Point1Property: IDependencyProperty; static; inline;
    class function get_Point2Property: IDependencyProperty; static; inline;
    class property Point1Property: IDependencyProperty read get_Point1Property;
    class property Point2Property: IDependencyProperty read get_Point2Property;
  end;

  // Microsoft.UI.Xaml.Media.RadialGradientBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IRadialGradientBrush
  // Statics: "Microsoft.UI.Xaml.Media.IRadialGradientBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IRadialGradientBrushFactory"
  // Instantiable: "IRadialGradientBrush"
  TRadialGradientBrush = class(TWinRTGenericImportFSI<IRadialGradientBrushFactory, IRadialGradientBrushStatics, IRadialGradientBrush>)
  public
    // -> IRadialGradientBrushStatics
    class function get_CenterProperty: IDependencyProperty; static; inline;
    class function get_RadiusXProperty: IDependencyProperty; static; inline;
    class function get_RadiusYProperty: IDependencyProperty; static; inline;
    class function get_GradientOriginProperty: IDependencyProperty; static; inline;
    class function get_InterpolationSpaceProperty: IDependencyProperty; static; inline;
    class function get_MappingModeProperty: IDependencyProperty; static; inline;
    class function get_SpreadMethodProperty: IDependencyProperty; static; inline;
    class property CenterProperty: IDependencyProperty read get_CenterProperty;
    class property GradientOriginProperty: IDependencyProperty read get_GradientOriginProperty;
    class property InterpolationSpaceProperty: IDependencyProperty read get_InterpolationSpaceProperty;
    class property MappingModeProperty: IDependencyProperty read get_MappingModeProperty;
    class property RadiusXProperty: IDependencyProperty read get_RadiusXProperty;
    class property RadiusYProperty: IDependencyProperty read get_RadiusYProperty;
    class property SpreadMethodProperty: IDependencyProperty read get_SpreadMethodProperty;

    // -> IRadialGradientBrushFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IRadialGradientBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.RectangleGeometry
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IRectangleGeometry
  // Statics: "Microsoft.UI.Xaml.Media.IRectangleGeometryStatics"
  // Instantiable: "IRectangleGeometry"
  TRectangleGeometry = class(TWinRTGenericImportSI<IRectangleGeometryStatics, IRectangleGeometry>)
  public
    // -> IRectangleGeometryStatics
    class function get_RectProperty: IDependencyProperty; static; inline;
    class property RectProperty: IDependencyProperty read get_RectProperty;
  end;

  // Microsoft.UI.Xaml.Media.RotateTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IRotateTransform
  // Statics: "Microsoft.UI.Xaml.Media.IRotateTransformStatics"
  // Instantiable: "IRotateTransform"
  TRotateTransform = class(TWinRTGenericImportSI<IRotateTransformStatics, IRotateTransform>)
  public
    // -> IRotateTransformStatics
    class function get_CenterXProperty: IDependencyProperty; static; inline;
    class function get_CenterYProperty: IDependencyProperty; static; inline;
    class function get_AngleProperty: IDependencyProperty; static; inline;
    class property AngleProperty: IDependencyProperty read get_AngleProperty;
    class property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    class property CenterYProperty: IDependencyProperty read get_CenterYProperty;
  end;

  // Microsoft.UI.Xaml.Media.ScaleTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IScaleTransform
  // Statics: "Microsoft.UI.Xaml.Media.IScaleTransformStatics"
  // Instantiable: "IScaleTransform"
  TScaleTransform = class(TWinRTGenericImportSI<IScaleTransformStatics, IScaleTransform>)
  public
    // -> IScaleTransformStatics
    class function get_CenterXProperty: IDependencyProperty; static; inline;
    class function get_CenterYProperty: IDependencyProperty; static; inline;
    class function get_ScaleXProperty: IDependencyProperty; static; inline;
    class function get_ScaleYProperty: IDependencyProperty; static; inline;
    class property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    class property CenterYProperty: IDependencyProperty read get_CenterYProperty;
    class property ScaleXProperty: IDependencyProperty read get_ScaleXProperty;
    class property ScaleYProperty: IDependencyProperty read get_ScaleYProperty;
  end;

  // Microsoft.UI.Xaml.Media.Shadow
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IShadow
  // Factory: "Microsoft.UI.Xaml.Media.IShadowFactory"
  // Instantiable: "IShadow"
  TShadow = class(TWinRTGenericImportFI<IShadowFactory, IShadow>)
  public
    // -> IShadowFactory
  end;

  // Microsoft.UI.Xaml.Media.SkewTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ISkewTransform
  // Statics: "Microsoft.UI.Xaml.Media.ISkewTransformStatics"
  // Instantiable: "ISkewTransform"
  TSkewTransform = class(TWinRTGenericImportSI<ISkewTransformStatics, ISkewTransform>)
  public
    // -> ISkewTransformStatics
    class function get_CenterXProperty: IDependencyProperty; static; inline;
    class function get_CenterYProperty: IDependencyProperty; static; inline;
    class function get_AngleXProperty: IDependencyProperty; static; inline;
    class function get_AngleYProperty: IDependencyProperty; static; inline;
    class property AngleXProperty: IDependencyProperty read get_AngleXProperty;
    class property AngleYProperty: IDependencyProperty read get_AngleYProperty;
    class property CenterXProperty: IDependencyProperty read get_CenterXProperty;
    class property CenterYProperty: IDependencyProperty read get_CenterYProperty;
  end;

  // Microsoft.UI.Xaml.Media.SolidColorBrush
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ISolidColorBrush
  // Statics: "Microsoft.UI.Xaml.Media.ISolidColorBrushStatics"
  // Factory: "Microsoft.UI.Xaml.Media.ISolidColorBrushFactory"
  // Instantiable: "ISolidColorBrush"
  TSolidColorBrush = class(TWinRTGenericImportFSI<ISolidColorBrushFactory, ISolidColorBrushStatics, ISolidColorBrush>)
  public
    // -> ISolidColorBrushStatics
    class function get_ColorProperty: IDependencyProperty; static; inline;
    class property ColorProperty: IDependencyProperty read get_ColorProperty;

    // -> ISolidColorBrushFactory
    class function CreateInstanceWithColor(color: Color): ISolidColorBrush; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.ThemeShadow
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IThemeShadow
  // Factory: "Microsoft.UI.Xaml.Media.IThemeShadowFactory"
  // Instantiable: "IThemeShadow"
  TThemeShadow = class(TWinRTGenericImportFI<IThemeShadowFactory, IThemeShadow>)
  public
    // -> IThemeShadowFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IThemeShadow; static; inline;
  end;


  // Microsoft.UI.Xaml.Media.TransformGroup
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ITransformGroup
  // Statics: "Microsoft.UI.Xaml.Media.ITransformGroupStatics"
  // Instantiable: "ITransformGroup"
  TTransformGroup = class(TWinRTGenericImportSI<ITransformGroupStatics, ITransformGroup>)
  public
    // -> ITransformGroupStatics
    class function get_ChildrenProperty: IDependencyProperty; static; inline;
    class property ChildrenProperty: IDependencyProperty read get_ChildrenProperty;
  end;

  // Microsoft.UI.Xaml.Media.TranslateTransform
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.ITranslateTransform
  // Statics: "Microsoft.UI.Xaml.Media.ITranslateTransformStatics"
  // Instantiable: "ITranslateTransform"
  TTranslateTransform = class(TWinRTGenericImportSI<ITranslateTransformStatics, ITranslateTransform>)
  public
    // -> ITranslateTransformStatics
    class function get_XProperty: IDependencyProperty; static; inline;
    class function get_YProperty: IDependencyProperty; static; inline;
    class property XProperty: IDependencyProperty read get_XProperty;
    class property YProperty: IDependencyProperty read get_YProperty;
  end;

  // Microsoft.UI.Xaml.Media.VisualTreeHelper
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IVisualTreeHelper
  // Statics: "Microsoft.UI.Xaml.Media.IVisualTreeHelperStatics"
  TVisualTreeHelper = class(TWinRTGenericImportS<IVisualTreeHelperStatics>)
  public
    // -> IVisualTreeHelperStatics
    class function FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement): IIterable_1__IUIElement; overload; static; inline;
    class function FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement): IIterable_1__IUIElement; overload; static; inline;
    class function FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement; overload; static; inline;
    class function FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement; overload; static; inline;
    class function GetChild(reference: IDependencyObject; childIndex: Integer): IDependencyObject; static; inline;
    class function GetChildrenCount(reference: IDependencyObject): Integer; static; inline;
    class function GetParent(reference: IDependencyObject): IDependencyObject; static; inline;
    class procedure DisconnectChildrenRecursive(element: IUIElement); static; inline;
    class function GetOpenPopups(window: IWindow): IVectorView_1__Primitives_IPopup; static; inline;
    class function GetOpenPopupsForXamlRoot(xamlRoot: IXamlRoot): IVectorView_1__Primitives_IPopup; static; inline;
  end;

  // Microsoft.UI.Xaml.Media.XamlLight
  // Explicitly imported
  // Implements: Microsoft.UI.Xaml.Media.IXamlLight
  // Implements: Microsoft.UI.Xaml.Media.IXamlLightProtected
  // Implements: Microsoft.UI.Xaml.Media.IXamlLightOverrides
  // Statics: "Microsoft.UI.Xaml.Media.IXamlLightStatics"
  // Factory: "Microsoft.UI.Xaml.Media.IXamlLightFactory"
  // Instantiable: "IXamlLight"
  TXamlLight = class(TWinRTGenericImportFSI<IXamlLightFactory, IXamlLightStatics, IXamlLight>)
  public
    // -> IXamlLightStatics
    class procedure AddTargetElement(lightId: HSTRING; element: IUIElement); static; inline;
    class procedure RemoveTargetElement(lightId: HSTRING; element: IUIElement); static; inline;
    class procedure AddTargetBrush(lightId: HSTRING; brush: IBrush); static; inline;
    class procedure RemoveTargetBrush(lightId: HSTRING; brush: IBrush); static; inline;

    // -> IXamlLightFactory
    class function CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlLight; static; inline;
  end;

implementation

{ TBrush }

class function TBrush.get_OpacityProperty: IDependencyProperty;
begin
  Result := Statics.get_OpacityProperty;
end;

class function TBrush.get_TransformProperty: IDependencyProperty;
begin
  Result := Statics.get_TransformProperty;
end;

class function TBrush.get_RelativeTransformProperty: IDependencyProperty;
begin
  Result := Statics.get_RelativeTransformProperty;
end;

// Factories for : "Brush"
// Factory: "Microsoft.UI.Xaml.Media.IBrushFactory"
// -> IBrushFactory

class function TBrush.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IBrush;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TXamlCompositionBrushBase }

class function TXamlCompositionBrushBase.get_FallbackColorProperty: IDependencyProperty;
begin
  Result := Statics.get_FallbackColorProperty;
end;

// Factories for : "XamlCompositionBrushBase"
// Factory: "Microsoft.UI.Xaml.Media.IXamlCompositionBrushBaseFactory"
// -> IXamlCompositionBrushBaseFactory

class function TXamlCompositionBrushBase.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlCompositionBrushBase;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAcrylicBrush }

class function TAcrylicBrush.get_TintColorProperty: IDependencyProperty;
begin
  Result := Statics.get_TintColorProperty;
end;

class function TAcrylicBrush.get_TintOpacityProperty: IDependencyProperty;
begin
  Result := Statics.get_TintOpacityProperty;
end;

class function TAcrylicBrush.get_TintTransitionDurationProperty: IDependencyProperty;
begin
  Result := Statics.get_TintTransitionDurationProperty;
end;

class function TAcrylicBrush.get_AlwaysUseFallbackProperty: IDependencyProperty;
begin
  Result := Statics.get_AlwaysUseFallbackProperty;
end;


class function TAcrylicBrush.get_TintLuminosityOpacityProperty: IDependencyProperty;
begin
  Result := Statics2.get_TintLuminosityOpacityProperty;
end;

// Factories for : "AcrylicBrush"
// Factory: "Microsoft.UI.Xaml.Media.IAcrylicBrushFactory"
// -> IAcrylicBrushFactory

class function TAcrylicBrush.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IAcrylicBrush;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_Transition }
// Factories for : "Animation_Transition"
// Factory: "Microsoft.UI.Xaml.Media.Animation.ITransitionFactory"
// -> Animation_ITransitionFactory


{ TAnimation_AddDeleteThemeTransition }

{ TAnimation_EasingFunctionBase }

class function TAnimation_EasingFunctionBase.get_EasingModeProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingModeProperty;
end;

// Factories for : "Animation_EasingFunctionBase"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory"
// -> Animation_IEasingFunctionBaseFactory


{ TAnimation_BackEase }

class function TAnimation_BackEase.get_AmplitudeProperty: IDependencyProperty;
begin
  Result := Statics.get_AmplitudeProperty;
end;


{ TAnimation_ConnectedAnimationConfiguration }
// Factories for : "Animation_ConnectedAnimationConfiguration"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IConnectedAnimationConfigurationFactory"
// -> Animation_IConnectedAnimationConfigurationFactory


{ TAnimation_BasicConnectedAnimationConfiguration }
// Factories for : "Animation_BasicConnectedAnimationConfiguration"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IBasicConnectedAnimationConfigurationFactory"
// -> Animation_IBasicConnectedAnimationConfigurationFactory

class function TAnimation_BasicConnectedAnimationConfiguration.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IBasicConnectedAnimationConfiguration;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_BeginStoryboard }

class function TAnimation_BeginStoryboard.get_StoryboardProperty: IDependencyProperty;
begin
  Result := Statics.get_StoryboardProperty;
end;


{ TAnimation_BounceEase }

class function TAnimation_BounceEase.get_BouncesProperty: IDependencyProperty;
begin
  Result := Statics.get_BouncesProperty;
end;

class function TAnimation_BounceEase.get_BouncinessProperty: IDependencyProperty;
begin
  Result := Statics.get_BouncinessProperty;
end;


{ TAnimation_CircleEase }

{ TAnimation_Timeline }

class function TAnimation_Timeline.get_AllowDependentAnimations: Boolean;
begin
  Result := Statics.get_AllowDependentAnimations;
end;

class procedure TAnimation_Timeline.put_AllowDependentAnimations(value: Boolean);
begin
  Statics.put_AllowDependentAnimations(value);
end;

class function TAnimation_Timeline.get_AutoReverseProperty: IDependencyProperty;
begin
  Result := Statics.get_AutoReverseProperty;
end;

class function TAnimation_Timeline.get_BeginTimeProperty: IDependencyProperty;
begin
  Result := Statics.get_BeginTimeProperty;
end;

class function TAnimation_Timeline.get_DurationProperty: IDependencyProperty;
begin
  Result := Statics.get_DurationProperty;
end;

class function TAnimation_Timeline.get_SpeedRatioProperty: IDependencyProperty;
begin
  Result := Statics.get_SpeedRatioProperty;
end;

class function TAnimation_Timeline.get_FillBehaviorProperty: IDependencyProperty;
begin
  Result := Statics.get_FillBehaviorProperty;
end;

class function TAnimation_Timeline.get_RepeatBehaviorProperty: IDependencyProperty;
begin
  Result := Statics.get_RepeatBehaviorProperty;
end;

// Factories for : "Animation_Timeline"
// Factory: "Microsoft.UI.Xaml.Media.Animation.ITimelineFactory"
// -> Animation_ITimelineFactory

class function TAnimation_Timeline.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_ITimeline;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_ColorAnimation }

class function TAnimation_ColorAnimation.get_FromProperty: IDependencyProperty;
begin
  Result := Statics.get_FromProperty;
end;

class function TAnimation_ColorAnimation.get_ToProperty: IDependencyProperty;
begin
  Result := Statics.get_ToProperty;
end;

class function TAnimation_ColorAnimation.get_ByProperty: IDependencyProperty;
begin
  Result := Statics.get_ByProperty;
end;

class function TAnimation_ColorAnimation.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;

class function TAnimation_ColorAnimation.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_ColorAnimationUsingKeyFrames }

class function TAnimation_ColorAnimationUsingKeyFrames.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_ColorKeyFrame }

class function TAnimation_ColorKeyFrame.get_ValueProperty: IDependencyProperty;
begin
  Result := Statics.get_ValueProperty;
end;

class function TAnimation_ColorKeyFrame.get_KeyTimeProperty: IDependencyProperty;
begin
  Result := Statics.get_KeyTimeProperty;
end;

// Factories for : "Animation_ColorKeyFrame"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IColorKeyFrameFactory"
// -> Animation_IColorKeyFrameFactory

class function TAnimation_ColorKeyFrame.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IColorKeyFrame;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_NavigationTransitionInfo }
// Factories for : "Animation_NavigationTransitionInfo"
// Factory: "Microsoft.UI.Xaml.Media.Animation.INavigationTransitionInfoFactory"
// -> Animation_INavigationTransitionInfoFactory

class function TAnimation_NavigationTransitionInfo.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_INavigationTransitionInfo;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_CommonNavigationTransitionInfo }

class function TAnimation_CommonNavigationTransitionInfo.get_IsStaggeringEnabledProperty: IDependencyProperty;
begin
  Result := Statics.get_IsStaggeringEnabledProperty;
end;

class function TAnimation_CommonNavigationTransitionInfo.get_IsStaggerElementProperty: IDependencyProperty;
begin
  Result := Statics.get_IsStaggerElementProperty;
end;

class function TAnimation_CommonNavigationTransitionInfo.GetIsStaggerElement(element: IUIElement): Boolean;
begin
  Result := Statics.GetIsStaggerElement(element);
end;

class procedure TAnimation_CommonNavigationTransitionInfo.SetIsStaggerElement(element: IUIElement; value: Boolean);
begin
  Statics.SetIsStaggerElement(element, value);
end;


{ TAnimation_ConnectedAnimationService }

class function TAnimation_ConnectedAnimationService.GetForCurrentView: Animation_IConnectedAnimationService;
begin
  Result := Statics.GetForCurrentView;
end;


{ TAnimation_ContentThemeTransition }

class function TAnimation_ContentThemeTransition.get_HorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_HorizontalOffsetProperty;
end;

class function TAnimation_ContentThemeTransition.get_VerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_VerticalOffsetProperty;
end;


{ TAnimation_ContinuumNavigationTransitionInfo }

class function TAnimation_ContinuumNavigationTransitionInfo.get_ExitElementProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitElementProperty;
end;

class function TAnimation_ContinuumNavigationTransitionInfo.get_IsEntranceElementProperty: IDependencyProperty;
begin
  Result := Statics.get_IsEntranceElementProperty;
end;

class function TAnimation_ContinuumNavigationTransitionInfo.GetIsEntranceElement(element: IUIElement): Boolean;
begin
  Result := Statics.GetIsEntranceElement(element);
end;

class procedure TAnimation_ContinuumNavigationTransitionInfo.SetIsEntranceElement(element: IUIElement; value: Boolean);
begin
  Statics.SetIsEntranceElement(element, value);
end;

class function TAnimation_ContinuumNavigationTransitionInfo.get_IsExitElementProperty: IDependencyProperty;
begin
  Result := Statics.get_IsExitElementProperty;
end;

class function TAnimation_ContinuumNavigationTransitionInfo.GetIsExitElement(element: IUIElement): Boolean;
begin
  Result := Statics.GetIsExitElement(element);
end;

class procedure TAnimation_ContinuumNavigationTransitionInfo.SetIsExitElement(element: IUIElement; value: Boolean);
begin
  Statics.SetIsExitElement(element, value);
end;

class function TAnimation_ContinuumNavigationTransitionInfo.get_ExitElementContainerProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitElementContainerProperty;
end;

class function TAnimation_ContinuumNavigationTransitionInfo.GetExitElementContainer(element: IListViewBase): Boolean;
begin
  Result := Statics.GetExitElementContainer(element);
end;

class procedure TAnimation_ContinuumNavigationTransitionInfo.SetExitElementContainer(element: IListViewBase; value: Boolean);
begin
  Statics.SetExitElementContainer(element, value);
end;


{ TAnimation_CubicEase }

{ TAnimation_DirectConnectedAnimationConfiguration }
// Factories for : "Animation_DirectConnectedAnimationConfiguration"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IDirectConnectedAnimationConfigurationFactory"
// -> Animation_IDirectConnectedAnimationConfigurationFactory

class function TAnimation_DirectConnectedAnimationConfiguration.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDirectConnectedAnimationConfiguration;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_DiscreteColorKeyFrame }

{ TAnimation_DoubleKeyFrame }

class function TAnimation_DoubleKeyFrame.get_ValueProperty: IDependencyProperty;
begin
  Result := Statics.get_ValueProperty;
end;

class function TAnimation_DoubleKeyFrame.get_KeyTimeProperty: IDependencyProperty;
begin
  Result := Statics.get_KeyTimeProperty;
end;

// Factories for : "Animation_DoubleKeyFrame"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IDoubleKeyFrameFactory"
// -> Animation_IDoubleKeyFrameFactory

class function TAnimation_DoubleKeyFrame.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IDoubleKeyFrame;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_DiscreteDoubleKeyFrame }

{ TAnimation_ObjectKeyFrame }

class function TAnimation_ObjectKeyFrame.get_ValueProperty: IDependencyProperty;
begin
  Result := Statics.get_ValueProperty;
end;

class function TAnimation_ObjectKeyFrame.get_KeyTimeProperty: IDependencyProperty;
begin
  Result := Statics.get_KeyTimeProperty;
end;

// Factories for : "Animation_ObjectKeyFrame"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IObjectKeyFrameFactory"
// -> Animation_IObjectKeyFrameFactory

class function TAnimation_ObjectKeyFrame.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IObjectKeyFrame;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_DiscreteObjectKeyFrame }

{ TAnimation_PointKeyFrame }

class function TAnimation_PointKeyFrame.get_ValueProperty: IDependencyProperty;
begin
  Result := Statics.get_ValueProperty;
end;

class function TAnimation_PointKeyFrame.get_KeyTimeProperty: IDependencyProperty;
begin
  Result := Statics.get_KeyTimeProperty;
end;

// Factories for : "Animation_PointKeyFrame"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IPointKeyFrameFactory"
// -> Animation_IPointKeyFrameFactory

class function TAnimation_PointKeyFrame.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IPointKeyFrame;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_DiscretePointKeyFrame }

{ TAnimation_DoubleAnimation }

class function TAnimation_DoubleAnimation.get_FromProperty: IDependencyProperty;
begin
  Result := Statics.get_FromProperty;
end;

class function TAnimation_DoubleAnimation.get_ToProperty: IDependencyProperty;
begin
  Result := Statics.get_ToProperty;
end;

class function TAnimation_DoubleAnimation.get_ByProperty: IDependencyProperty;
begin
  Result := Statics.get_ByProperty;
end;

class function TAnimation_DoubleAnimation.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;

class function TAnimation_DoubleAnimation.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_DoubleAnimationUsingKeyFrames }

class function TAnimation_DoubleAnimationUsingKeyFrames.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_DragItemThemeAnimation }

class function TAnimation_DragItemThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_DragOverThemeAnimation }

class function TAnimation_DragOverThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_DragOverThemeAnimation.get_ToOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_ToOffsetProperty;
end;

class function TAnimation_DragOverThemeAnimation.get_DirectionProperty: IDependencyProperty;
begin
  Result := Statics.get_DirectionProperty;
end;


{ TAnimation_DrillInNavigationTransitionInfo }

{ TAnimation_DrillInThemeAnimation }

class function TAnimation_DrillInThemeAnimation.get_EntranceTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_EntranceTargetNameProperty;
end;

class function TAnimation_DrillInThemeAnimation.get_EntranceTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_EntranceTargetProperty;
end;

class function TAnimation_DrillInThemeAnimation.get_ExitTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitTargetNameProperty;
end;

class function TAnimation_DrillInThemeAnimation.get_ExitTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitTargetProperty;
end;


{ TAnimation_DrillOutThemeAnimation }

class function TAnimation_DrillOutThemeAnimation.get_EntranceTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_EntranceTargetNameProperty;
end;

class function TAnimation_DrillOutThemeAnimation.get_EntranceTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_EntranceTargetProperty;
end;

class function TAnimation_DrillOutThemeAnimation.get_ExitTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitTargetNameProperty;
end;

class function TAnimation_DrillOutThemeAnimation.get_ExitTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ExitTargetProperty;
end;


{ TAnimation_DropTargetItemThemeAnimation }

class function TAnimation_DropTargetItemThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_EasingColorKeyFrame }

class function TAnimation_EasingColorKeyFrame.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;


{ TAnimation_EasingDoubleKeyFrame }

class function TAnimation_EasingDoubleKeyFrame.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;


{ TAnimation_EasingPointKeyFrame }

class function TAnimation_EasingPointKeyFrame.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;


{ TAnimation_EdgeUIThemeTransition }

class function TAnimation_EdgeUIThemeTransition.get_EdgeProperty: IDependencyProperty;
begin
  Result := Statics.get_EdgeProperty;
end;


{ TAnimation_ElasticEase }

class function TAnimation_ElasticEase.get_OscillationsProperty: IDependencyProperty;
begin
  Result := Statics.get_OscillationsProperty;
end;

class function TAnimation_ElasticEase.get_SpringinessProperty: IDependencyProperty;
begin
  Result := Statics.get_SpringinessProperty;
end;


{ TAnimation_EntranceNavigationTransitionInfo }

class function TAnimation_EntranceNavigationTransitionInfo.get_IsTargetElementProperty: IDependencyProperty;
begin
  Result := Statics.get_IsTargetElementProperty;
end;

class function TAnimation_EntranceNavigationTransitionInfo.GetIsTargetElement(element: IUIElement): Boolean;
begin
  Result := Statics.GetIsTargetElement(element);
end;

class procedure TAnimation_EntranceNavigationTransitionInfo.SetIsTargetElement(element: IUIElement; value: Boolean);
begin
  Statics.SetIsTargetElement(element, value);
end;


{ TAnimation_EntranceThemeTransition }

class function TAnimation_EntranceThemeTransition.get_FromHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromHorizontalOffsetProperty;
end;

class function TAnimation_EntranceThemeTransition.get_FromVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromVerticalOffsetProperty;
end;

class function TAnimation_EntranceThemeTransition.get_IsStaggeringEnabledProperty: IDependencyProperty;
begin
  Result := Statics.get_IsStaggeringEnabledProperty;
end;


{ TAnimation_ExponentialEase }

class function TAnimation_ExponentialEase.get_ExponentProperty: IDependencyProperty;
begin
  Result := Statics.get_ExponentProperty;
end;


{ TAnimation_FadeInThemeAnimation }

class function TAnimation_FadeInThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_FadeOutThemeAnimation }

class function TAnimation_FadeOutThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_GravityConnectedAnimationConfiguration }
// Factories for : "Animation_GravityConnectedAnimationConfiguration"
// Factory: "Microsoft.UI.Xaml.Media.Animation.IGravityConnectedAnimationConfigurationFactory"
// -> Animation_IGravityConnectedAnimationConfigurationFactory

class function TAnimation_GravityConnectedAnimationConfiguration.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Animation_IGravityConnectedAnimationConfiguration;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TAnimation_KeySpline }

{ TAnimation_KeyTimeHelper }

class function TAnimation_KeyTimeHelper.FromTimeSpan(timeSpan: TimeSpan): Animation_KeyTime;
begin
  Result := Statics.FromTimeSpan(timeSpan);
end;


{ TAnimation_LinearColorKeyFrame }

{ TAnimation_LinearDoubleKeyFrame }

{ TAnimation_LinearPointKeyFrame }

{ TAnimation_NavigationThemeTransition }

class function TAnimation_NavigationThemeTransition.get_DefaultNavigationTransitionInfoProperty: IDependencyProperty;
begin
  Result := Statics.get_DefaultNavigationTransitionInfoProperty;
end;


{ TAnimation_ObjectAnimationUsingKeyFrames }

class function TAnimation_ObjectAnimationUsingKeyFrames.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_PaneThemeTransition }

class function TAnimation_PaneThemeTransition.get_EdgeProperty: IDependencyProperty;
begin
  Result := Statics.get_EdgeProperty;
end;


{ TAnimation_PointAnimation }

class function TAnimation_PointAnimation.get_FromProperty: IDependencyProperty;
begin
  Result := Statics.get_FromProperty;
end;

class function TAnimation_PointAnimation.get_ToProperty: IDependencyProperty;
begin
  Result := Statics.get_ToProperty;
end;

class function TAnimation_PointAnimation.get_ByProperty: IDependencyProperty;
begin
  Result := Statics.get_ByProperty;
end;

class function TAnimation_PointAnimation.get_EasingFunctionProperty: IDependencyProperty;
begin
  Result := Statics.get_EasingFunctionProperty;
end;

class function TAnimation_PointAnimation.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_PointAnimationUsingKeyFrames }

class function TAnimation_PointAnimationUsingKeyFrames.get_EnableDependentAnimationProperty: IDependencyProperty;
begin
  Result := Statics.get_EnableDependentAnimationProperty;
end;


{ TAnimation_PointerDownThemeAnimation }

class function TAnimation_PointerDownThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_PointerUpThemeAnimation }

class function TAnimation_PointerUpThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_PopInThemeAnimation }

class function TAnimation_PopInThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_PopInThemeAnimation.get_FromHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromHorizontalOffsetProperty;
end;

class function TAnimation_PopInThemeAnimation.get_FromVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromVerticalOffsetProperty;
end;


{ TAnimation_PopOutThemeAnimation }

class function TAnimation_PopOutThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;


{ TAnimation_PopupThemeTransition }

class function TAnimation_PopupThemeTransition.get_FromHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromHorizontalOffsetProperty;
end;

class function TAnimation_PopupThemeTransition.get_FromVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromVerticalOffsetProperty;
end;


{ TAnimation_PowerEase }

class function TAnimation_PowerEase.get_PowerProperty: IDependencyProperty;
begin
  Result := Statics.get_PowerProperty;
end;


{ TAnimation_QuadraticEase }

{ TAnimation_QuarticEase }

{ TAnimation_QuinticEase }

{ TAnimation_ReorderThemeTransition }

{ TAnimation_RepeatBehaviorHelper }

class function TAnimation_RepeatBehaviorHelper.get_Forever: Animation_RepeatBehavior;
begin
  Result := Statics.get_Forever;
end;

class function TAnimation_RepeatBehaviorHelper.FromCount(count: Double): Animation_RepeatBehavior;
begin
  Result := Statics.FromCount(count);
end;

class function TAnimation_RepeatBehaviorHelper.FromDuration(duration: TimeSpan): Animation_RepeatBehavior;
begin
  Result := Statics.FromDuration(duration);
end;

class function TAnimation_RepeatBehaviorHelper.GetHasCount(target: Animation_RepeatBehavior): Boolean;
begin
  Result := Statics.GetHasCount(target);
end;

class function TAnimation_RepeatBehaviorHelper.GetHasDuration(target: Animation_RepeatBehavior): Boolean;
begin
  Result := Statics.GetHasDuration(target);
end;

class function TAnimation_RepeatBehaviorHelper.Equals(target: Animation_RepeatBehavior; value: Animation_RepeatBehavior): Boolean;
begin
  Result := Statics.Equals(target, value);
end;


{ TAnimation_RepositionThemeAnimation }

class function TAnimation_RepositionThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_RepositionThemeAnimation.get_FromHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromHorizontalOffsetProperty;
end;

class function TAnimation_RepositionThemeAnimation.get_FromVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromVerticalOffsetProperty;
end;


{ TAnimation_RepositionThemeTransition }

class function TAnimation_RepositionThemeTransition.get_IsStaggeringEnabledProperty: IDependencyProperty;
begin
  Result := Statics.get_IsStaggeringEnabledProperty;
end;


{ TAnimation_SineEase }

{ TAnimation_SlideNavigationTransitionInfo }

class function TAnimation_SlideNavigationTransitionInfo.get_EffectProperty: IDependencyProperty;
begin
  Result := Statics.get_EffectProperty;
end;


{ TAnimation_SplineColorKeyFrame }

class function TAnimation_SplineColorKeyFrame.get_KeySplineProperty: IDependencyProperty;
begin
  Result := Statics.get_KeySplineProperty;
end;


{ TAnimation_SplineDoubleKeyFrame }

class function TAnimation_SplineDoubleKeyFrame.get_KeySplineProperty: IDependencyProperty;
begin
  Result := Statics.get_KeySplineProperty;
end;


{ TAnimation_SplinePointKeyFrame }

class function TAnimation_SplinePointKeyFrame.get_KeySplineProperty: IDependencyProperty;
begin
  Result := Statics.get_KeySplineProperty;
end;


{ TAnimation_SplitCloseThemeAnimation }

class function TAnimation_SplitCloseThemeAnimation.get_OpenedTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedTargetNameProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_OpenedTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedTargetProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ClosedTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedTargetNameProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ClosedTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedTargetProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ContentTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTargetNameProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ContentTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTargetProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_OpenedLengthProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedLengthProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ClosedLengthProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedLengthProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_OffsetFromCenterProperty: IDependencyProperty;
begin
  Result := Statics.get_OffsetFromCenterProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ContentTranslationDirectionProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTranslationDirectionProperty;
end;

class function TAnimation_SplitCloseThemeAnimation.get_ContentTranslationOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTranslationOffsetProperty;
end;


{ TAnimation_SplitOpenThemeAnimation }

class function TAnimation_SplitOpenThemeAnimation.get_OpenedTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedTargetNameProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_OpenedTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedTargetProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ClosedTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedTargetNameProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ClosedTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedTargetProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ContentTargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTargetNameProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ContentTargetProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTargetProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_OpenedLengthProperty: IDependencyProperty;
begin
  Result := Statics.get_OpenedLengthProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ClosedLengthProperty: IDependencyProperty;
begin
  Result := Statics.get_ClosedLengthProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_OffsetFromCenterProperty: IDependencyProperty;
begin
  Result := Statics.get_OffsetFromCenterProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ContentTranslationDirectionProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTranslationDirectionProperty;
end;

class function TAnimation_SplitOpenThemeAnimation.get_ContentTranslationOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_ContentTranslationOffsetProperty;
end;


{ TAnimation_Storyboard }

class function TAnimation_Storyboard.get_TargetPropertyProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetPropertyProperty;
end;

class function TAnimation_Storyboard.GetTargetProperty(element: Animation_ITimeline): HSTRING;
begin
  Result := Statics.GetTargetProperty(element);
end;

class procedure TAnimation_Storyboard.SetTargetProperty(element: Animation_ITimeline; path: HSTRING);
begin
  Statics.SetTargetProperty(element, path);
end;

class function TAnimation_Storyboard.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_Storyboard.GetTargetName(element: Animation_ITimeline): HSTRING;
begin
  Result := Statics.GetTargetName(element);
end;

class procedure TAnimation_Storyboard.SetTargetName(element: Animation_ITimeline; name: HSTRING);
begin
  Statics.SetTargetName(element, name);
end;

class procedure TAnimation_Storyboard.SetTarget(timeline: Animation_ITimeline; target: IDependencyObject);
begin
  Statics.SetTarget(timeline, target);
end;


{ TAnimation_SuppressNavigationTransitionInfo }

{ TAnimation_SwipeBackThemeAnimation }

class function TAnimation_SwipeBackThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_SwipeBackThemeAnimation.get_FromHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromHorizontalOffsetProperty;
end;

class function TAnimation_SwipeBackThemeAnimation.get_FromVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_FromVerticalOffsetProperty;
end;


{ TAnimation_SwipeHintThemeAnimation }

class function TAnimation_SwipeHintThemeAnimation.get_TargetNameProperty: IDependencyProperty;
begin
  Result := Statics.get_TargetNameProperty;
end;

class function TAnimation_SwipeHintThemeAnimation.get_ToHorizontalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_ToHorizontalOffsetProperty;
end;

class function TAnimation_SwipeHintThemeAnimation.get_ToVerticalOffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_ToVerticalOffsetProperty;
end;


{ TPathSegment }
// Factories for : "PathSegment"
// Factory: "Microsoft.UI.Xaml.Media.IPathSegmentFactory"
// -> IPathSegmentFactory


{ TArcSegment }

class function TArcSegment.get_PointProperty: IDependencyProperty;
begin
  Result := Statics.get_PointProperty;
end;

class function TArcSegment.get_SizeProperty: IDependencyProperty;
begin
  Result := Statics.get_SizeProperty;
end;

class function TArcSegment.get_RotationAngleProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationAngleProperty;
end;

class function TArcSegment.get_IsLargeArcProperty: IDependencyProperty;
begin
  Result := Statics.get_IsLargeArcProperty;
end;

class function TArcSegment.get_SweepDirectionProperty: IDependencyProperty;
begin
  Result := Statics.get_SweepDirectionProperty;
end;


{ TBezierSegment }

class function TBezierSegment.get_Point1Property: IDependencyProperty;
begin
  Result := Statics.get_Point1Property;
end;

class function TBezierSegment.get_Point2Property: IDependencyProperty;
begin
  Result := Statics.get_Point2Property;
end;

class function TBezierSegment.get_Point3Property: IDependencyProperty;
begin
  Result := Statics.get_Point3Property;
end;


{ TCacheMode }
// Factories for : "CacheMode"
// Factory: "Microsoft.UI.Xaml.Media.ICacheModeFactory"
// -> ICacheModeFactory

class function TCacheMode.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ICacheMode;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TBitmapCache }

{ TGeneralTransform }
// Factories for : "GeneralTransform"
// Factory: "Microsoft.UI.Xaml.Media.IGeneralTransformFactory"
// -> IGeneralTransformFactory

class function TGeneralTransform.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGeneralTransform;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TTransform }
// Factories for : "Transform"
// Factory: "Microsoft.UI.Xaml.Media.ITransformFactory"
// -> ITransformFactory


{ TCompositeTransform }

class function TCompositeTransform.get_CenterXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterXProperty;
end;

class function TCompositeTransform.get_CenterYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterYProperty;
end;

class function TCompositeTransform.get_ScaleXProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleXProperty;
end;

class function TCompositeTransform.get_ScaleYProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleYProperty;
end;

class function TCompositeTransform.get_SkewXProperty: IDependencyProperty;
begin
  Result := Statics.get_SkewXProperty;
end;

class function TCompositeTransform.get_SkewYProperty: IDependencyProperty;
begin
  Result := Statics.get_SkewYProperty;
end;

class function TCompositeTransform.get_RotationProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationProperty;
end;

class function TCompositeTransform.get_TranslateXProperty: IDependencyProperty;
begin
  Result := Statics.get_TranslateXProperty;
end;

class function TCompositeTransform.get_TranslateYProperty: IDependencyProperty;
begin
  Result := Statics.get_TranslateYProperty;
end;


{ TCompositionTarget }

class function TCompositionTarget.add_Rendering(handler: EventHandler_1__IInspectable): EventRegistrationToken;
begin
  Result := Statics.add_Rendering(handler);
end;

class procedure TCompositionTarget.remove_Rendering(token: EventRegistrationToken);
begin
  Statics.remove_Rendering(token);
end;

class function TCompositionTarget.add_Rendered(handler: EventHandler_1__IRenderedEventArgs): EventRegistrationToken;
begin
  Result := Statics.add_Rendered(handler);
end;

class procedure TCompositionTarget.remove_Rendered(token: EventRegistrationToken);
begin
  Statics.remove_Rendered(token);
end;

class function TCompositionTarget.add_SurfaceContentsLost(handler: EventHandler_1__IInspectable): EventRegistrationToken;
begin
  Result := Statics.add_SurfaceContentsLost(handler);
end;

class procedure TCompositionTarget.remove_SurfaceContentsLost(token: EventRegistrationToken);
begin
  Statics.remove_SurfaceContentsLost(token);
end;

class function TCompositionTarget.GetCompositorForCurrentThread: ICompositor;
begin
  Result := Statics.GetCompositorForCurrentThread;
end;


{ TSystemBackdrop }
// Factories for : "SystemBackdrop"
// Factory: "Microsoft.UI.Xaml.Media.ISystemBackdropFactory"
// -> ISystemBackdropFactory

class function TSystemBackdrop.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ISystemBackdrop;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TDesktopAcrylicBackdrop }
// Factories for : "DesktopAcrylicBackdrop"
// Factory: "Microsoft.UI.Xaml.Media.IDesktopAcrylicBackdropFactory"
// -> IDesktopAcrylicBackdropFactory

class function TDesktopAcrylicBackdrop.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IDesktopAcrylicBackdrop;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TDoubleCollection }

{ TGeometry }

class function TGeometry.get_Empty: IGeometry;
begin
  Result := Statics.get_Empty;
end;

class function TGeometry.get_StandardFlatteningTolerance: Double;
begin
  Result := Statics.get_StandardFlatteningTolerance;
end;

class function TGeometry.get_TransformProperty: IDependencyProperty;
begin
  Result := Statics.get_TransformProperty;
end;

// Factories for : "Geometry"
// Factory: "Microsoft.UI.Xaml.Media.IGeometryFactory"
// -> IGeometryFactory


{ TEllipseGeometry }

class function TEllipseGeometry.get_CenterProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterProperty;
end;

class function TEllipseGeometry.get_RadiusXProperty: IDependencyProperty;
begin
  Result := Statics.get_RadiusXProperty;
end;

class function TEllipseGeometry.get_RadiusYProperty: IDependencyProperty;
begin
  Result := Statics.get_RadiusYProperty;
end;


{ TFontFamily }

class function TFontFamily.get_XamlAutoFontFamily: IFontFamily;
begin
  Result := Statics.get_XamlAutoFontFamily;
end;

// Factories for : "FontFamily"
// Factory: "Microsoft.UI.Xaml.Media.IFontFamilyFactory"
// -> IFontFamilyFactory

class function TFontFamily.CreateInstanceWithName(familyName: HSTRING; baseInterface: IInspectable; out innerInterface: IInspectable): IFontFamily;
begin
  Result := Factory.CreateInstanceWithName(familyName, baseInterface, innerInterface);
end;


{ TGeometryGroup }

class function TGeometryGroup.get_FillRuleProperty: IDependencyProperty;
begin
  Result := Statics.get_FillRuleProperty;
end;

class function TGeometryGroup.get_ChildrenProperty: IDependencyProperty;
begin
  Result := Statics.get_ChildrenProperty;
end;


{ TGradientBrush }

class function TGradientBrush.get_SpreadMethodProperty: IDependencyProperty;
begin
  Result := Statics.get_SpreadMethodProperty;
end;

class function TGradientBrush.get_MappingModeProperty: IDependencyProperty;
begin
  Result := Statics.get_MappingModeProperty;
end;

class function TGradientBrush.get_ColorInterpolationModeProperty: IDependencyProperty;
begin
  Result := Statics.get_ColorInterpolationModeProperty;
end;

class function TGradientBrush.get_GradientStopsProperty: IDependencyProperty;
begin
  Result := Statics.get_GradientStopsProperty;
end;

// Factories for : "GradientBrush"
// Factory: "Microsoft.UI.Xaml.Media.IGradientBrushFactory"
// -> IGradientBrushFactory

class function TGradientBrush.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IGradientBrush;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TGradientStop }

class function TGradientStop.get_ColorProperty: IDependencyProperty;
begin
  Result := Statics.get_ColorProperty;
end;

class function TGradientStop.get_OffsetProperty: IDependencyProperty;
begin
  Result := Statics.get_OffsetProperty;
end;


{ TTileBrush }

class function TTileBrush.get_AlignmentXProperty: IDependencyProperty;
begin
  Result := Statics.get_AlignmentXProperty;
end;

class function TTileBrush.get_AlignmentYProperty: IDependencyProperty;
begin
  Result := Statics.get_AlignmentYProperty;
end;

class function TTileBrush.get_StretchProperty: IDependencyProperty;
begin
  Result := Statics.get_StretchProperty;
end;

// Factories for : "TileBrush"
// Factory: "Microsoft.UI.Xaml.Media.ITileBrushFactory"
// -> ITileBrushFactory

class function TTileBrush.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): ITileBrush;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TImageBrush }

class function TImageBrush.get_ImageSourceProperty: IDependencyProperty;
begin
  Result := Statics.get_ImageSourceProperty;
end;


{ TImageSource }
// Factories for : "ImageSource"
// Factory: "Microsoft.UI.Xaml.Media.IImageSourceFactory"
// -> IImageSourceFactory


{ TImaging_BitmapSource }

class function TImaging_BitmapSource.get_PixelWidthProperty: IDependencyProperty;
begin
  Result := Statics.get_PixelWidthProperty;
end;

class function TImaging_BitmapSource.get_PixelHeightProperty: IDependencyProperty;
begin
  Result := Statics.get_PixelHeightProperty;
end;

// Factories for : "Imaging_BitmapSource"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.IBitmapSourceFactory"
// -> Imaging_IBitmapSourceFactory

class function TImaging_BitmapSource.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IBitmapSource;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TImaging_BitmapImage }

class function TImaging_BitmapImage.get_CreateOptionsProperty: IDependencyProperty;
begin
  Result := Statics.get_CreateOptionsProperty;
end;

class function TImaging_BitmapImage.get_UriSourceProperty: IDependencyProperty;
begin
  Result := Statics.get_UriSourceProperty;
end;

class function TImaging_BitmapImage.get_DecodePixelWidthProperty: IDependencyProperty;
begin
  Result := Statics.get_DecodePixelWidthProperty;
end;

class function TImaging_BitmapImage.get_DecodePixelHeightProperty: IDependencyProperty;
begin
  Result := Statics.get_DecodePixelHeightProperty;
end;

class function TImaging_BitmapImage.get_DecodePixelTypeProperty: IDependencyProperty;
begin
  Result := Statics.get_DecodePixelTypeProperty;
end;

class function TImaging_BitmapImage.get_IsAnimatedBitmapProperty: IDependencyProperty;
begin
  Result := Statics.get_IsAnimatedBitmapProperty;
end;

class function TImaging_BitmapImage.get_IsPlayingProperty: IDependencyProperty;
begin
  Result := Statics.get_IsPlayingProperty;
end;

class function TImaging_BitmapImage.get_AutoPlayProperty: IDependencyProperty;
begin
  Result := Statics.get_AutoPlayProperty;
end;

// Factories for : "Imaging_BitmapImage"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.IBitmapImageFactory"
// -> Imaging_IBitmapImageFactory

class function TImaging_BitmapImage.CreateInstanceWithUriSource(uriSource: IUriRuntimeClass): Imaging_IBitmapImage;
begin
  Result := Factory.CreateInstanceWithUriSource(uriSource);
end;


{ TImaging_RenderTargetBitmap }

class function TImaging_RenderTargetBitmap.get_PixelWidthProperty: IDependencyProperty;
begin
  Result := Statics.get_PixelWidthProperty;
end;

class function TImaging_RenderTargetBitmap.get_PixelHeightProperty: IDependencyProperty;
begin
  Result := Statics.get_PixelHeightProperty;
end;


{ TImaging_SoftwareBitmapSource }

{ TImaging_SurfaceImageSource }
// Factories for : "Imaging_SurfaceImageSource"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.ISurfaceImageSourceFactory"
// -> Imaging_ISurfaceImageSourceFactory

class function TImaging_SurfaceImageSource.CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource;
begin
  Result := Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight, baseInterface, innerInterface);
end;

class function TImaging_SurfaceImageSource.CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISurfaceImageSource;
begin
  Result := Factory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque, baseInterface, innerInterface);
end;


{ TImaging_SvgImageSource }

class function TImaging_SvgImageSource.get_UriSourceProperty: IDependencyProperty;
begin
  Result := Statics.get_UriSourceProperty;
end;

class function TImaging_SvgImageSource.get_RasterizePixelWidthProperty: IDependencyProperty;
begin
  Result := Statics.get_RasterizePixelWidthProperty;
end;

class function TImaging_SvgImageSource.get_RasterizePixelHeightProperty: IDependencyProperty;
begin
  Result := Statics.get_RasterizePixelHeightProperty;
end;

// Factories for : "Imaging_SvgImageSource"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.ISvgImageSourceFactory"
// -> Imaging_ISvgImageSourceFactory

class function TImaging_SvgImageSource.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;

class function TImaging_SvgImageSource.CreateInstanceWithUriSource(uriSource: IUriRuntimeClass; baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_ISvgImageSource;
begin
  Result := Factory.CreateInstanceWithUriSource(uriSource, baseInterface, innerInterface);
end;


{ TImaging_VirtualSurfaceImageSource }
// Factories for : "Imaging_VirtualSurfaceImageSource"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory"
// -> Imaging_IVirtualSurfaceImageSourceFactory

class function TImaging_VirtualSurfaceImageSource.CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IVirtualSurfaceImageSource;
begin
  Result := Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight);
end;

class function TImaging_VirtualSurfaceImageSource.CreateInstanceWithDimensionsAndOpacity(pixelWidth: Integer; pixelHeight: Integer; isOpaque: Boolean): Imaging_IVirtualSurfaceImageSource;
begin
  Result := Factory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque);
end;


{ TImaging_WriteableBitmap }
// Factories for : "Imaging_WriteableBitmap"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.IWriteableBitmapFactory"
// -> Imaging_IWriteableBitmapFactory

class function TImaging_WriteableBitmap.CreateInstanceWithDimensions(pixelWidth: Integer; pixelHeight: Integer): Imaging_IWriteableBitmap;
begin
  Result := Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight);
end;


{ TImaging_XamlRenderingBackgroundTask }
// Factories for : "Imaging_XamlRenderingBackgroundTask"
// Factory: "Microsoft.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskFactory"
// -> Imaging_IXamlRenderingBackgroundTaskFactory

class function TImaging_XamlRenderingBackgroundTask.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Imaging_IXamlRenderingBackgroundTask;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TLineGeometry }

class function TLineGeometry.get_StartPointProperty: IDependencyProperty;
begin
  Result := Statics.get_StartPointProperty;
end;

class function TLineGeometry.get_EndPointProperty: IDependencyProperty;
begin
  Result := Statics.get_EndPointProperty;
end;


{ TLineSegment }

class function TLineSegment.get_PointProperty: IDependencyProperty;
begin
  Result := Statics.get_PointProperty;
end;


{ TLinearGradientBrush }

class function TLinearGradientBrush.get_StartPointProperty: IDependencyProperty;
begin
  Result := Statics.get_StartPointProperty;
end;

class function TLinearGradientBrush.get_EndPointProperty: IDependencyProperty;
begin
  Result := Statics.get_EndPointProperty;
end;

// Factories for : "LinearGradientBrush"
// Factory: "Microsoft.UI.Xaml.Media.ILinearGradientBrushFactory"
// -> ILinearGradientBrushFactory

class function TLinearGradientBrush.CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection: IVector_1__IGradientStop; angle: Double): ILinearGradientBrush;
begin
  Result := Factory.CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection, angle);
end;


{ TLoadedImageSurface }

class function TLoadedImageSurface.StartLoadFromUri(uri: IUriRuntimeClass; desiredMaxSize: TSizeF): ILoadedImageSurface;
begin
  Result := Statics.StartLoadFromUri(uri, desiredMaxSize);
end;

class function TLoadedImageSurface.StartLoadFromUri(uri: IUriRuntimeClass): ILoadedImageSurface;
begin
  Result := Statics.StartLoadFromUri(uri);
end;

class function TLoadedImageSurface.StartLoadFromStream(stream: IRandomAccessStream; desiredMaxSize: TSizeF): ILoadedImageSurface;
begin
  Result := Statics.StartLoadFromStream(stream, desiredMaxSize);
end;

class function TLoadedImageSurface.StartLoadFromStream(stream: IRandomAccessStream): ILoadedImageSurface;
begin
  Result := Statics.StartLoadFromStream(stream);
end;


{ TProjection }
// Factories for : "Projection"
// Factory: "Microsoft.UI.Xaml.Media.IProjectionFactory"
// -> IProjectionFactory

class function TProjection.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IProjection;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TMatrix3DProjection }

class function TMatrix3DProjection.get_ProjectionMatrixProperty: IDependencyProperty;
begin
  Result := Statics.get_ProjectionMatrixProperty;
end;


{ TMatrixHelper }

class function TMatrixHelper.get_Identity: Matrix;
begin
  Result := Statics.get_Identity;
end;

class function TMatrixHelper.FromElements(m11: Double; m12: Double; m21: Double; m22: Double; offsetX: Double; offsetY: Double): Matrix;
begin
  Result := Statics.FromElements(m11, m12, m21, m22, offsetX, offsetY);
end;

class function TMatrixHelper.GetIsIdentity(target: Matrix): Boolean;
begin
  Result := Statics.GetIsIdentity(target);
end;

class function TMatrixHelper.Transform(target: Matrix; point: TPointF): TPointF;
begin
  Result := Statics.Transform(target, point);
end;


{ TMatrixTransform }

class function TMatrixTransform.get_MatrixProperty: IDependencyProperty;
begin
  Result := Statics.get_MatrixProperty;
end;


{ TMedia3D_Transform3D }
// Factories for : "Media3D_Transform3D"
// Factory: "Microsoft.UI.Xaml.Media.Media3D.ITransform3DFactory"
// -> Media3D_ITransform3DFactory

class function TMedia3D_Transform3D.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): Media3D_ITransform3D;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TMedia3D_CompositeTransform3D }

class function TMedia3D_CompositeTransform3D.get_CenterXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterXProperty;
end;

class function TMedia3D_CompositeTransform3D.get_CenterYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterYProperty;
end;

class function TMedia3D_CompositeTransform3D.get_CenterZProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterZProperty;
end;

class function TMedia3D_CompositeTransform3D.get_RotationXProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationXProperty;
end;

class function TMedia3D_CompositeTransform3D.get_RotationYProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationYProperty;
end;

class function TMedia3D_CompositeTransform3D.get_RotationZProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationZProperty;
end;

class function TMedia3D_CompositeTransform3D.get_ScaleXProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleXProperty;
end;

class function TMedia3D_CompositeTransform3D.get_ScaleYProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleYProperty;
end;

class function TMedia3D_CompositeTransform3D.get_ScaleZProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleZProperty;
end;

class function TMedia3D_CompositeTransform3D.get_TranslateXProperty: IDependencyProperty;
begin
  Result := Statics.get_TranslateXProperty;
end;

class function TMedia3D_CompositeTransform3D.get_TranslateYProperty: IDependencyProperty;
begin
  Result := Statics.get_TranslateYProperty;
end;

class function TMedia3D_CompositeTransform3D.get_TranslateZProperty: IDependencyProperty;
begin
  Result := Statics.get_TranslateZProperty;
end;


{ TMedia3D_Matrix3DHelper }

class function TMedia3D_Matrix3DHelper.get_Identity: Media3D_Matrix3D;
begin
  Result := Statics.get_Identity;
end;

class function TMedia3D_Matrix3DHelper.Multiply(matrix1: Media3D_Matrix3D; matrix2: Media3D_Matrix3D): Media3D_Matrix3D;
begin
  Result := Statics.Multiply(matrix1, matrix2);
end;

class function TMedia3D_Matrix3DHelper.FromElements(m11: Double; m12: Double; m13: Double; m14: Double; m21: Double; m22: Double; m23: Double; m24: Double; m31: Double; m32: Double; m33: Double; m34: Double; offsetX: Double; offsetY: Double; offsetZ: Double; m44: Double): Media3D_Matrix3D;
begin
  Result := Statics.FromElements(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, offsetX, offsetY, offsetZ, m44);
end;

class function TMedia3D_Matrix3DHelper.GetHasInverse(target: Media3D_Matrix3D): Boolean;
begin
  Result := Statics.GetHasInverse(target);
end;

class function TMedia3D_Matrix3DHelper.GetIsIdentity(target: Media3D_Matrix3D): Boolean;
begin
  Result := Statics.GetIsIdentity(target);
end;

class function TMedia3D_Matrix3DHelper.Invert(target: Media3D_Matrix3D): Media3D_Matrix3D;
begin
  Result := Statics.Invert(target);
end;


{ TMedia3D_PerspectiveTransform3D }

class function TMedia3D_PerspectiveTransform3D.get_DepthProperty: IDependencyProperty;
begin
  Result := Statics.get_DepthProperty;
end;

class function TMedia3D_PerspectiveTransform3D.get_OffsetXProperty: IDependencyProperty;
begin
  Result := Statics.get_OffsetXProperty;
end;

class function TMedia3D_PerspectiveTransform3D.get_OffsetYProperty: IDependencyProperty;
begin
  Result := Statics.get_OffsetYProperty;
end;


{ TMicaBackdrop }

class function TMicaBackdrop.get_KindProperty: IDependencyProperty;
begin
  Result := Statics.get_KindProperty;
end;

// Factories for : "MicaBackdrop"
// Factory: "Microsoft.UI.Xaml.Media.IMicaBackdropFactory"
// -> IMicaBackdropFactory

class function TMicaBackdrop.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IMicaBackdrop;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TPathFigure }

class function TPathFigure.get_SegmentsProperty: IDependencyProperty;
begin
  Result := Statics.get_SegmentsProperty;
end;

class function TPathFigure.get_StartPointProperty: IDependencyProperty;
begin
  Result := Statics.get_StartPointProperty;
end;

class function TPathFigure.get_IsClosedProperty: IDependencyProperty;
begin
  Result := Statics.get_IsClosedProperty;
end;

class function TPathFigure.get_IsFilledProperty: IDependencyProperty;
begin
  Result := Statics.get_IsFilledProperty;
end;


{ TPathGeometry }

class function TPathGeometry.get_FillRuleProperty: IDependencyProperty;
begin
  Result := Statics.get_FillRuleProperty;
end;

class function TPathGeometry.get_FiguresProperty: IDependencyProperty;
begin
  Result := Statics.get_FiguresProperty;
end;


{ TPlaneProjection }

class function TPlaneProjection.get_LocalOffsetXProperty: IDependencyProperty;
begin
  Result := Statics.get_LocalOffsetXProperty;
end;

class function TPlaneProjection.get_LocalOffsetYProperty: IDependencyProperty;
begin
  Result := Statics.get_LocalOffsetYProperty;
end;

class function TPlaneProjection.get_LocalOffsetZProperty: IDependencyProperty;
begin
  Result := Statics.get_LocalOffsetZProperty;
end;

class function TPlaneProjection.get_RotationXProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationXProperty;
end;

class function TPlaneProjection.get_RotationYProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationYProperty;
end;

class function TPlaneProjection.get_RotationZProperty: IDependencyProperty;
begin
  Result := Statics.get_RotationZProperty;
end;

class function TPlaneProjection.get_CenterOfRotationXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterOfRotationXProperty;
end;

class function TPlaneProjection.get_CenterOfRotationYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterOfRotationYProperty;
end;

class function TPlaneProjection.get_CenterOfRotationZProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterOfRotationZProperty;
end;

class function TPlaneProjection.get_GlobalOffsetXProperty: IDependencyProperty;
begin
  Result := Statics.get_GlobalOffsetXProperty;
end;

class function TPlaneProjection.get_GlobalOffsetYProperty: IDependencyProperty;
begin
  Result := Statics.get_GlobalOffsetYProperty;
end;

class function TPlaneProjection.get_GlobalOffsetZProperty: IDependencyProperty;
begin
  Result := Statics.get_GlobalOffsetZProperty;
end;

class function TPlaneProjection.get_ProjectionMatrixProperty: IDependencyProperty;
begin
  Result := Statics.get_ProjectionMatrixProperty;
end;


{ TPointCollection }

{ TPolyBezierSegment }

class function TPolyBezierSegment.get_PointsProperty: IDependencyProperty;
begin
  Result := Statics.get_PointsProperty;
end;


{ TPolyLineSegment }

class function TPolyLineSegment.get_PointsProperty: IDependencyProperty;
begin
  Result := Statics.get_PointsProperty;
end;


{ TPolyQuadraticBezierSegment }

class function TPolyQuadraticBezierSegment.get_PointsProperty: IDependencyProperty;
begin
  Result := Statics.get_PointsProperty;
end;


{ TQuadraticBezierSegment }

class function TQuadraticBezierSegment.get_Point1Property: IDependencyProperty;
begin
  Result := Statics.get_Point1Property;
end;

class function TQuadraticBezierSegment.get_Point2Property: IDependencyProperty;
begin
  Result := Statics.get_Point2Property;
end;


{ TRadialGradientBrush }

class function TRadialGradientBrush.get_CenterProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterProperty;
end;

class function TRadialGradientBrush.get_RadiusXProperty: IDependencyProperty;
begin
  Result := Statics.get_RadiusXProperty;
end;

class function TRadialGradientBrush.get_RadiusYProperty: IDependencyProperty;
begin
  Result := Statics.get_RadiusYProperty;
end;

class function TRadialGradientBrush.get_GradientOriginProperty: IDependencyProperty;
begin
  Result := Statics.get_GradientOriginProperty;
end;

class function TRadialGradientBrush.get_InterpolationSpaceProperty: IDependencyProperty;
begin
  Result := Statics.get_InterpolationSpaceProperty;
end;

class function TRadialGradientBrush.get_MappingModeProperty: IDependencyProperty;
begin
  Result := Statics.get_MappingModeProperty;
end;

class function TRadialGradientBrush.get_SpreadMethodProperty: IDependencyProperty;
begin
  Result := Statics.get_SpreadMethodProperty;
end;

// Factories for : "RadialGradientBrush"
// Factory: "Microsoft.UI.Xaml.Media.IRadialGradientBrushFactory"
// -> IRadialGradientBrushFactory

class function TRadialGradientBrush.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IRadialGradientBrush;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TRectangleGeometry }

class function TRectangleGeometry.get_RectProperty: IDependencyProperty;
begin
  Result := Statics.get_RectProperty;
end;


{ TRotateTransform }

class function TRotateTransform.get_CenterXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterXProperty;
end;

class function TRotateTransform.get_CenterYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterYProperty;
end;

class function TRotateTransform.get_AngleProperty: IDependencyProperty;
begin
  Result := Statics.get_AngleProperty;
end;


{ TScaleTransform }

class function TScaleTransform.get_CenterXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterXProperty;
end;

class function TScaleTransform.get_CenterYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterYProperty;
end;

class function TScaleTransform.get_ScaleXProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleXProperty;
end;

class function TScaleTransform.get_ScaleYProperty: IDependencyProperty;
begin
  Result := Statics.get_ScaleYProperty;
end;


{ TShadow }
// Factories for : "Shadow"
// Factory: "Microsoft.UI.Xaml.Media.IShadowFactory"
// -> IShadowFactory


{ TSkewTransform }

class function TSkewTransform.get_CenterXProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterXProperty;
end;

class function TSkewTransform.get_CenterYProperty: IDependencyProperty;
begin
  Result := Statics.get_CenterYProperty;
end;

class function TSkewTransform.get_AngleXProperty: IDependencyProperty;
begin
  Result := Statics.get_AngleXProperty;
end;

class function TSkewTransform.get_AngleYProperty: IDependencyProperty;
begin
  Result := Statics.get_AngleYProperty;
end;


{ TSolidColorBrush }

class function TSolidColorBrush.get_ColorProperty: IDependencyProperty;
begin
  Result := Statics.get_ColorProperty;
end;

// Factories for : "SolidColorBrush"
// Factory: "Microsoft.UI.Xaml.Media.ISolidColorBrushFactory"
// -> ISolidColorBrushFactory

class function TSolidColorBrush.CreateInstanceWithColor(color: Color): ISolidColorBrush;
begin
  Result := Factory.CreateInstanceWithColor(color);
end;


{ TThemeShadow }
// Factories for : "ThemeShadow"
// Factory: "Microsoft.UI.Xaml.Media.IThemeShadowFactory"
// -> IThemeShadowFactory

class function TThemeShadow.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IThemeShadow;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


{ TTransformGroup }

class function TTransformGroup.get_ChildrenProperty: IDependencyProperty;
begin
  Result := Statics.get_ChildrenProperty;
end;


{ TTranslateTransform }

class function TTranslateTransform.get_XProperty: IDependencyProperty;
begin
  Result := Statics.get_XProperty;
end;

class function TTranslateTransform.get_YProperty: IDependencyProperty;
begin
  Result := Statics.get_YProperty;
end;


{ TVisualTreeHelper }

class function TVisualTreeHelper.FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement): IIterable_1__IUIElement;
begin
  Result := Statics.FindElementsInHostCoordinates(intersectingPoint, subtree);
end;

class function TVisualTreeHelper.FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement): IIterable_1__IUIElement;
begin
  Result := Statics.FindElementsInHostCoordinates(intersectingRect, subtree);
end;

class function TVisualTreeHelper.FindElementsInHostCoordinates(intersectingPoint: TPointF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement;
begin
  Result := Statics.FindElementsInHostCoordinates(intersectingPoint, subtree, includeAllElements);
end;

class function TVisualTreeHelper.FindElementsInHostCoordinates(intersectingRect: TRectF; subtree: IUIElement; includeAllElements: Boolean): IIterable_1__IUIElement;
begin
  Result := Statics.FindElementsInHostCoordinates(intersectingRect, subtree, includeAllElements);
end;

class function TVisualTreeHelper.GetChild(reference: IDependencyObject; childIndex: Integer): IDependencyObject;
begin
  Result := Statics.GetChild(reference, childIndex);
end;

class function TVisualTreeHelper.GetChildrenCount(reference: IDependencyObject): Integer;
begin
  Result := Statics.GetChildrenCount(reference);
end;

class function TVisualTreeHelper.GetParent(reference: IDependencyObject): IDependencyObject;
begin
  Result := Statics.GetParent(reference);
end;

class procedure TVisualTreeHelper.DisconnectChildrenRecursive(element: IUIElement);
begin
  Statics.DisconnectChildrenRecursive(element);
end;

class function TVisualTreeHelper.GetOpenPopups(window: IWindow): IVectorView_1__Primitives_IPopup;
begin
  Result := Statics.GetOpenPopups(window);
end;

class function TVisualTreeHelper.GetOpenPopupsForXamlRoot(xamlRoot: IXamlRoot): IVectorView_1__Primitives_IPopup;
begin
  Result := Statics.GetOpenPopupsForXamlRoot(xamlRoot);
end;


{ TXamlLight }

class procedure TXamlLight.AddTargetElement(lightId: HSTRING; element: IUIElement);
begin
  Statics.AddTargetElement(lightId, element);
end;

class procedure TXamlLight.RemoveTargetElement(lightId: HSTRING; element: IUIElement);
begin
  Statics.RemoveTargetElement(lightId, element);
end;

class procedure TXamlLight.AddTargetBrush(lightId: HSTRING; brush: IBrush);
begin
  Statics.AddTargetBrush(lightId, brush);
end;

class procedure TXamlLight.RemoveTargetBrush(lightId: HSTRING; brush: IBrush);
begin
  Statics.RemoveTargetBrush(lightId, brush);
end;

// Factories for : "XamlLight"
// Factory: "Microsoft.UI.Xaml.Media.IXamlLightFactory"
// -> IXamlLightFactory

class function TXamlLight.CreateInstance(baseInterface: IInspectable; out innerInterface: IInspectable): IXamlLight;
begin
  Result := Factory.CreateInstance(baseInterface, innerInterface);
end;


end.
