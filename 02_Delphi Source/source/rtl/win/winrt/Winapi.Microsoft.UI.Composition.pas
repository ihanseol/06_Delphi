{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI.Composition;

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
  Winapi.UI,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  CompositionBackfaceVisibility = Winapi.Microsoft.CommonTypes.CompositionBackfaceVisibility;
  PCompositionBackfaceVisibility = Winapi.Microsoft.CommonTypes.PCompositionBackfaceVisibility;
  CompositionBatchTypes = Winapi.Microsoft.CommonTypes.CompositionBatchTypes;
  PCompositionBatchTypes = Winapi.Microsoft.CommonTypes.PCompositionBatchTypes;
  CompositionBitmapInterpolationMode = Winapi.Microsoft.CommonTypes.CompositionBitmapInterpolationMode;
  PCompositionBitmapInterpolationMode = Winapi.Microsoft.CommonTypes.PCompositionBitmapInterpolationMode;
  CompositionBorderMode = Winapi.Microsoft.CommonTypes.CompositionBorderMode;
  PCompositionBorderMode = Winapi.Microsoft.CommonTypes.PCompositionBorderMode;
  CompositionColorSpace = Winapi.Microsoft.CommonTypes.CompositionColorSpace;
  PCompositionColorSpace = Winapi.Microsoft.CommonTypes.PCompositionColorSpace;
  CompositionCompositeMode = Winapi.Microsoft.CommonTypes.CompositionCompositeMode;
  PCompositionCompositeMode = Winapi.Microsoft.CommonTypes.PCompositionCompositeMode;
  CompositionEffectFactoryLoadStatus = Winapi.Microsoft.CommonTypes.CompositionEffectFactoryLoadStatus;
  PCompositionEffectFactoryLoadStatus = Winapi.Microsoft.CommonTypes.PCompositionEffectFactoryLoadStatus;
  CompositionGetValueStatus = Winapi.Microsoft.CommonTypes.CompositionGetValueStatus;
  PCompositionGetValueStatus = Winapi.Microsoft.CommonTypes.PCompositionGetValueStatus;
  CompositionStretch = Winapi.Microsoft.CommonTypes.CompositionStretch;
  PCompositionStretch = Winapi.Microsoft.CommonTypes.PCompositionStretch;
  IColorKeyFrameAnimation = Winapi.Microsoft.CommonTypes.IColorKeyFrameAnimation;
  PIColorKeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIColorKeyFrameAnimation;
  ICompositionAnimationBase = Winapi.Microsoft.CommonTypes.ICompositionAnimationBase;
  PICompositionAnimationBase = Winapi.Microsoft.CommonTypes.PICompositionAnimationBase;
  ICompositionBatchCompletedEventArgs = Winapi.Microsoft.CommonTypes.ICompositionBatchCompletedEventArgs;
  PICompositionBatchCompletedEventArgs = Winapi.Microsoft.CommonTypes.PICompositionBatchCompletedEventArgs;
  ICompositionBrush = Winapi.Microsoft.CommonTypes.ICompositionBrush;
  PICompositionBrush = Winapi.Microsoft.CommonTypes.PICompositionBrush;
  ICompositionClip = Winapi.Microsoft.CommonTypes.ICompositionClip;
  PICompositionClip = Winapi.Microsoft.CommonTypes.PICompositionClip;
  ICompositionColorBrush = Winapi.Microsoft.CommonTypes.ICompositionColorBrush;
  PICompositionColorBrush = Winapi.Microsoft.CommonTypes.PICompositionColorBrush;
  ICompositionCommitBatch = Winapi.Microsoft.CommonTypes.ICompositionCommitBatch;
  PICompositionCommitBatch = Winapi.Microsoft.CommonTypes.PICompositionCommitBatch;
  ICompositionEasingFunction = Winapi.Microsoft.CommonTypes.ICompositionEasingFunction;
  PICompositionEasingFunction = Winapi.Microsoft.CommonTypes.PICompositionEasingFunction;
  ICompositionEffectBrush = Winapi.Microsoft.CommonTypes.ICompositionEffectBrush;
  PICompositionEffectBrush = Winapi.Microsoft.CommonTypes.PICompositionEffectBrush;
  ICompositionEffectFactory = Winapi.Microsoft.CommonTypes.ICompositionEffectFactory;
  PICompositionEffectFactory = Winapi.Microsoft.CommonTypes.PICompositionEffectFactory;
  ICompositionPropertySet = Winapi.Microsoft.CommonTypes.ICompositionPropertySet;
  PICompositionPropertySet = Winapi.Microsoft.CommonTypes.PICompositionPropertySet;
  ICompositionScopedBatch = Winapi.Microsoft.CommonTypes.ICompositionScopedBatch;
  PICompositionScopedBatch = Winapi.Microsoft.CommonTypes.PICompositionScopedBatch;
  ICompositionSurface = Winapi.Microsoft.CommonTypes.ICompositionSurface;
  PICompositionSurface = Winapi.Microsoft.CommonTypes.PICompositionSurface;
  ICompositionSurfaceBrush = Winapi.Microsoft.CommonTypes.ICompositionSurfaceBrush;
  PICompositionSurfaceBrush = Winapi.Microsoft.CommonTypes.PICompositionSurfaceBrush;
  ICompositor = Winapi.Microsoft.CommonTypes.ICompositor;
  PICompositor = Winapi.Microsoft.CommonTypes.PICompositor;
  IContainerVisual = Winapi.Microsoft.CommonTypes.IContainerVisual;
  PIContainerVisual = Winapi.Microsoft.CommonTypes.PIContainerVisual;
  ICubicBezierEasingFunction = Winapi.Microsoft.CommonTypes.ICubicBezierEasingFunction;
  PICubicBezierEasingFunction = Winapi.Microsoft.CommonTypes.PICubicBezierEasingFunction;
  IExpressionAnimation = Winapi.Microsoft.CommonTypes.IExpressionAnimation;
  PIExpressionAnimation = Winapi.Microsoft.CommonTypes.PIExpressionAnimation;
  IInsetClip = Winapi.Microsoft.CommonTypes.IInsetClip;
  PIInsetClip = Winapi.Microsoft.CommonTypes.PIInsetClip;
  ILinearEasingFunction = Winapi.Microsoft.CommonTypes.ILinearEasingFunction;
  PILinearEasingFunction = Winapi.Microsoft.CommonTypes.PILinearEasingFunction;
  IQuaternionKeyFrameAnimation = Winapi.Microsoft.CommonTypes.IQuaternionKeyFrameAnimation;
  PIQuaternionKeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIQuaternionKeyFrameAnimation;
  IScalarKeyFrameAnimation = Winapi.Microsoft.CommonTypes.IScalarKeyFrameAnimation;
  PIScalarKeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIScalarKeyFrameAnimation;
  ISpriteVisual = Winapi.Microsoft.CommonTypes.ISpriteVisual;
  PISpriteVisual = Winapi.Microsoft.CommonTypes.PISpriteVisual;
  IVector2KeyFrameAnimation = Winapi.Microsoft.CommonTypes.IVector2KeyFrameAnimation;
  PIVector2KeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIVector2KeyFrameAnimation;
  IVector3KeyFrameAnimation = Winapi.Microsoft.CommonTypes.IVector3KeyFrameAnimation;
  PIVector3KeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIVector3KeyFrameAnimation;
  IVector4KeyFrameAnimation = Winapi.Microsoft.CommonTypes.IVector4KeyFrameAnimation;
  PIVector4KeyFrameAnimation = Winapi.Microsoft.CommonTypes.PIVector4KeyFrameAnimation;
  IVisual = Winapi.Microsoft.CommonTypes.IVisual;
  PIVisual = Winapi.Microsoft.CommonTypes.PIVisual;
  IVisualCollection = Winapi.Microsoft.CommonTypes.IVisualCollection;
  PIVisualCollection = Winapi.Microsoft.CommonTypes.PIVisualCollection;
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base;
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs;
  PTypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs;

  // Forward declarations for interfaces

  // Microsoft.UI.Composition.ICompositionAnimation
  ICompositionAnimation = interface;
  PICompositionAnimation = ^ICompositionAnimation;

  // Microsoft.UI.Composition.ICompositionObject
  ICompositionObject = interface;
  PICompositionObject = ^ICompositionObject;

  // Microsoft.UI.Composition.IAnimationPropertyInfo
  IAnimationPropertyInfo = interface;
  PIAnimationPropertyInfo = ^IAnimationPropertyInfo;

  // Microsoft.UI.Composition.SystemBackdrops.ISystemBackdropConfiguration
  SystemBackdrops_ISystemBackdropConfiguration = interface;
  PSystemBackdrops_ISystemBackdropConfiguration = ^SystemBackdrops_ISystemBackdropConfiguration;

  // Microsoft.UI.Composition.ICompositionSupportsSystemBackdrop
  ICompositionSupportsSystemBackdrop = interface;
  PICompositionSupportsSystemBackdrop = ^ICompositionSupportsSystemBackdrop;

  // Microsoft.UI.Composition.IVisualUnorderedCollection
  IVisualUnorderedCollection = interface;
  PIVisualUnorderedCollection = ^IVisualUnorderedCollection;

  // Microsoft.UI.Composition.ICompositionLight
  ICompositionLight = interface;
  PICompositionLight = ^ICompositionLight;

  // Microsoft.UI.Composition.IAnimationObject
  IAnimationObject = interface;
  PIAnimationObject = ^IAnimationObject;

  // Microsoft.UI.Composition.ICompositionAnimationFactory
  ICompositionAnimationFactory = interface;
  PICompositionAnimationFactory = ^ICompositionAnimationFactory;

  // Microsoft.UI.Composition.ICompositionBrushFactory
  ICompositionBrushFactory = interface;
  PICompositionBrushFactory = ^ICompositionBrushFactory;

  // Microsoft.UI.Composition.ICompositionClipFactory
  ICompositionClipFactory = interface;
  PICompositionClipFactory = ^ICompositionClipFactory;

  // Microsoft.UI.Composition.ICompositionDrawingSurfaceFactory
  ICompositionDrawingSurfaceFactory = interface;
  PICompositionDrawingSurfaceFactory = ^ICompositionDrawingSurfaceFactory;

  // Microsoft.UI.Composition.ICompositionEasingFunctionFactory
  ICompositionEasingFunctionFactory = interface;
  PICompositionEasingFunctionFactory = ^ICompositionEasingFunctionFactory;

  // Microsoft.UI.Composition.ICompositionGeometryFactory
  ICompositionGeometryFactory = interface;
  PICompositionGeometryFactory = ^ICompositionGeometryFactory;

  // Microsoft.UI.Composition.ICompositionGradientBrushFactory
  ICompositionGradientBrushFactory = interface;
  PICompositionGradientBrushFactory = ^ICompositionGradientBrushFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Composition.ICompositionSurface>
  AsyncOperationCompletedHandler_1__ICompositionSurface = interface;
  PAsyncOperationCompletedHandler_1__ICompositionSurface = ^AsyncOperationCompletedHandler_1__ICompositionSurface;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Composition.ICompositionSurface>
  IAsyncOperation_1__ICompositionSurface = interface;
  PIAsyncOperation_1__ICompositionSurface = ^IAsyncOperation_1__ICompositionSurface;

  // Microsoft.UI.Composition.ICompositionLightFactory
  ICompositionLightFactory = interface;
  PICompositionLightFactory = ^ICompositionLightFactory;

  // Microsoft.UI.Composition.ICompositionObjectFactory
  ICompositionObjectFactory = interface;
  PICompositionObjectFactory = ^ICompositionObjectFactory;

  // Microsoft.UI.Composition.ICompositionShadowFactory
  ICompositionShadowFactory = interface;
  PICompositionShadowFactory = ^ICompositionShadowFactory;

  // Microsoft.UI.Composition.ICompositionShapeFactory
  ICompositionShapeFactory = interface;
  PICompositionShapeFactory = ^ICompositionShapeFactory;

  // Microsoft.UI.Composition.ICompositionSurfaceFacade
  ICompositionSurfaceFacade = interface;
  PICompositionSurfaceFacade = ^ICompositionSurfaceFacade;

  // Microsoft.UI.Composition.ICompositionTransformFactory
  ICompositionTransformFactory = interface;
  PICompositionTransformFactory = ^ICompositionTransformFactory;

  // Microsoft.UI.Composition.ICompositionVirtualDrawingSurfaceFactory
  ICompositionVirtualDrawingSurfaceFactory = interface;
  PICompositionVirtualDrawingSurfaceFactory = ^ICompositionVirtualDrawingSurfaceFactory;

  // Microsoft.UI.Composition.IContainerVisualFactory
  IContainerVisualFactory = interface;
  PIContainerVisualFactory = ^IContainerVisualFactory;

  // Microsoft.UI.Composition.IKeyFrameAnimationFactory
  IKeyFrameAnimationFactory = interface;
  PIKeyFrameAnimationFactory = ^IKeyFrameAnimationFactory;

  // Microsoft.UI.Composition.INaturalMotionAnimationFactory
  INaturalMotionAnimationFactory = interface;
  PINaturalMotionAnimationFactory = ^INaturalMotionAnimationFactory;

  // Microsoft.UI.Composition.IScalarNaturalMotionAnimationFactory
  IScalarNaturalMotionAnimationFactory = interface;
  PIScalarNaturalMotionAnimationFactory = ^IScalarNaturalMotionAnimationFactory;

  // Microsoft.UI.Composition.IVector2NaturalMotionAnimationFactory
  IVector2NaturalMotionAnimationFactory = interface;
  PIVector2NaturalMotionAnimationFactory = ^IVector2NaturalMotionAnimationFactory;

  // Microsoft.UI.Composition.IVector3NaturalMotionAnimationFactory
  IVector3NaturalMotionAnimationFactory = interface;
  PIVector3NaturalMotionAnimationFactory = ^IVector3NaturalMotionAnimationFactory;

  // Microsoft.UI.Composition.IVisualElement
  IVisualElement = interface;
  PIVisualElement = ^IVisualElement;

  // Microsoft.UI.Composition.IVisualElement2
  IVisualElement2 = interface;
  PIVisualElement2 = ^IVisualElement2;

  // Microsoft.UI.Composition.IVisualFactory
  IVisualFactory = interface;
  PIVisualFactory = ^IVisualFactory;

  // Microsoft.UI.Composition.Interactions.IInteractionTrackerInertiaModifierFactory
  Interactions_IInteractionTrackerInertiaModifierFactory = interface;
  PInteractions_IInteractionTrackerInertiaModifierFactory = ^Interactions_IInteractionTrackerInertiaModifierFactory;

  // Microsoft.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifierFactory
  Interactions_IInteractionTrackerVector2InertiaModifierFactory = interface;
  PInteractions_IInteractionTrackerVector2InertiaModifierFactory = ^Interactions_IInteractionTrackerVector2InertiaModifierFactory;

  // Microsoft.UI.Composition.Interactions.IVisualInteractionSourceObjectFactory
  Interactions_IVisualInteractionSourceObjectFactory = interface;
  PInteractions_IVisualInteractionSourceObjectFactory = ^Interactions_IVisualInteractionSourceObjectFactory;

  // Microsoft.UI.Composition.Scenes.ISceneComponentFactory
  Scenes_ISceneComponentFactory = interface;
  PScenes_ISceneComponentFactory = ^Scenes_ISceneComponentFactory;

  // Microsoft.UI.Composition.Scenes.ISceneMaterialFactory
  Scenes_ISceneMaterialFactory = interface;
  PScenes_ISceneMaterialFactory = ^Scenes_ISceneMaterialFactory;

  // Microsoft.UI.Composition.Scenes.ISceneMaterialInputFactory
  Scenes_ISceneMaterialInputFactory = interface;
  PScenes_ISceneMaterialInputFactory = ^Scenes_ISceneMaterialInputFactory;

  // Microsoft.UI.Composition.Scenes.ISceneObjectFactory
  Scenes_ISceneObjectFactory = interface;
  PScenes_ISceneObjectFactory = ^Scenes_ISceneObjectFactory;

  // Microsoft.UI.Composition.Scenes.IScenePbrMaterialFactory
  Scenes_IScenePbrMaterialFactory = interface;
  PScenes_IScenePbrMaterialFactory = ^Scenes_IScenePbrMaterialFactory;

  // Microsoft.UI.Composition.Scenes.ISceneRendererComponentFactory
  Scenes_ISceneRendererComponentFactory = interface;
  PScenes_ISceneRendererComponentFactory = ^Scenes_ISceneRendererComponentFactory;

  // Microsoft.UI.Composition Enums

  // Microsoft.UI.Composition.AnimationControllerProgressBehavior
  AnimationControllerProgressBehavior = (
    Default = 0,
    IncludesDelayTime = 1
  );
  PAnimationControllerProgressBehavior = ^AnimationControllerProgressBehavior;

  // Microsoft.UI.Composition.AnimationDelayBehavior
  AnimationDelayBehavior = (
    SetInitialValueAfterDelay = 0,
    SetInitialValueBeforeDelay = 1
  );
  PAnimationDelayBehavior = ^AnimationDelayBehavior;

  // Microsoft.UI.Composition.AnimationDirection
  AnimationDirection = (
    Normal = 0,
    Reverse = 1,
    Alternate = 2,
    AlternateReverse = 3
  );
  PAnimationDirection = ^AnimationDirection;

  // Microsoft.UI.Composition.AnimationIterationBehavior
  AnimationIterationBehavior = (
    Count = 0,
    Forever = 1
  );
  PAnimationIterationBehavior = ^AnimationIterationBehavior;

  // Microsoft.UI.Composition.AnimationPropertyAccessMode
  AnimationPropertyAccessMode = (
    None = 0,
    ReadOnly = 1,
    WriteOnly = 2,
    ReadWrite = 3
  );
  PAnimationPropertyAccessMode = ^AnimationPropertyAccessMode;

  // Microsoft.UI.Composition.AnimationStopBehavior
  AnimationStopBehavior = (
    LeaveCurrentValue = 0,
    SetToInitialValue = 1,
    SetToFinalValue = 2
  );
  PAnimationStopBehavior = ^AnimationStopBehavior;

  // Microsoft.UI.Composition.CompositionDropShadowSourcePolicy
  CompositionDropShadowSourcePolicy = (
    Default = 0,
    InheritFromVisualContent = 1
  );
  PCompositionDropShadowSourcePolicy = ^CompositionDropShadowSourcePolicy;

  // Microsoft.UI.Composition.CompositionEasingFunctionMode
  CompositionEasingFunctionMode = (
    &In = 0,
    &Out = 1,
    InOut = 2
  );
  PCompositionEasingFunctionMode = ^CompositionEasingFunctionMode;

  // Microsoft.UI.Composition.CompositionGradientExtendMode
  CompositionGradientExtendMode = (
    Clamp = 0,
    Wrap = 1,
    Mirror = 2
  );
  PCompositionGradientExtendMode = ^CompositionGradientExtendMode;

  // Microsoft.UI.Composition.CompositionMappingMode
  CompositionMappingMode = (
    Absolute = 0,
    Relative = 1
  );
  PCompositionMappingMode = ^CompositionMappingMode;

  // Microsoft.UI.Composition.CompositionStrokeCap
  CompositionStrokeCap = (
    Flat = 0,
    Square = 1,
    Round = 2,
    Triangle = 3
  );
  PCompositionStrokeCap = ^CompositionStrokeCap;

  // Microsoft.UI.Composition.CompositionStrokeLineJoin
  CompositionStrokeLineJoin = (
    Miter = 0,
    Bevel = 1,
    Round = 2,
    MiterOrBevel = 3
  );
  PCompositionStrokeLineJoin = ^CompositionStrokeLineJoin;

  // Microsoft.UI.Composition.Diagnostics.CompositionDebugOverdrawContentKinds
  Diagnostics_CompositionDebugOverdrawContentKinds = (
    None = 0,
    OffscreenRendered = 1,
    Colors = 2,
    Effects = 4,
    Shadows = 8,
    Lights = 16,
    Surfaces = 32,
    SwapChains = 64,
    All = -1
  );
  PDiagnostics_CompositionDebugOverdrawContentKinds = ^Diagnostics_CompositionDebugOverdrawContentKinds;

  // Microsoft.UI.Composition.Effects.SceneLightingEffectReflectanceModel
  Effects_SceneLightingEffectReflectanceModel = (
    BlinnPhong = 0,
    PhysicallyBasedBlinnPhong = 1
  );
  PEffects_SceneLightingEffectReflectanceModel = ^Effects_SceneLightingEffectReflectanceModel;

  // Microsoft.UI.Composition.Interactions.InteractionBindingAxisModes
  Interactions_InteractionBindingAxisModes = (
    None = 0,
    PositionX = 1,
    PositionY = 2,
    Scale = 4
  );
  PInteractions_InteractionBindingAxisModes = ^Interactions_InteractionBindingAxisModes;

  // Microsoft.UI.Composition.Interactions.InteractionChainingMode
  Interactions_InteractionChainingMode = (
    Auto = 0,
    Always = 1,
    Never = 2
  );
  PInteractions_InteractionChainingMode = ^Interactions_InteractionChainingMode;

  // Microsoft.UI.Composition.Interactions.InteractionSourceMode
  Interactions_InteractionSourceMode = (
    Disabled = 0,
    EnabledWithInertia = 1,
    EnabledWithoutInertia = 2
  );
  PInteractions_InteractionSourceMode = ^Interactions_InteractionSourceMode;

  // Microsoft.UI.Composition.Interactions.InteractionSourceRedirectionMode
  Interactions_InteractionSourceRedirectionMode = (
    Disabled = 0,
    Enabled = 1
  );
  PInteractions_InteractionSourceRedirectionMode = ^Interactions_InteractionSourceRedirectionMode;

  // Microsoft.UI.Composition.Interactions.InteractionTrackerClampingOption
  Interactions_InteractionTrackerClampingOption = (
    Auto = 0,
    Disabled = 1
  );
  PInteractions_InteractionTrackerClampingOption = ^Interactions_InteractionTrackerClampingOption;

  // Microsoft.UI.Composition.Interactions.InteractionTrackerPositionUpdateOption
  Interactions_InteractionTrackerPositionUpdateOption = (
    Default = 0,
    AllowActiveCustomScaleAnimation = 1
  );
  PInteractions_InteractionTrackerPositionUpdateOption = ^Interactions_InteractionTrackerPositionUpdateOption;

  // Microsoft.UI.Composition.Interactions.VisualInteractionSourceRedirectionMode
  Interactions_VisualInteractionSourceRedirectionMode = (
    Off = 0,
    CapableTouchpadOnly = 1,
    PointerWheelOnly = 2,
    CapableTouchpadAndPointerWheel = 3
  );
  PInteractions_VisualInteractionSourceRedirectionMode = ^Interactions_VisualInteractionSourceRedirectionMode;

  // Microsoft.UI.Composition.Scenes.SceneAlphaMode
  Scenes_SceneAlphaMode = (
    Opaque = 0,
    AlphaTest = 1,
    Blend = 2
  );
  PScenes_SceneAlphaMode = ^Scenes_SceneAlphaMode;

  // Microsoft.UI.Composition.Scenes.SceneAttributeSemantic
  Scenes_SceneAttributeSemantic = (
    Index = 0,
    Vertex = 1,
    Normal = 2,
    TexCoord0 = 3,
    TexCoord1 = 4,
    Color = 5,
    Tangent = 6
  );
  PScenes_SceneAttributeSemantic = ^Scenes_SceneAttributeSemantic;

  // Microsoft.UI.Composition.Scenes.SceneComponentType
  Scenes_SceneComponentType = (
    MeshRendererComponent = 0
  );
  PScenes_SceneComponentType = ^Scenes_SceneComponentType;

  // Microsoft.UI.Composition.Scenes.SceneWrappingMode
  Scenes_SceneWrappingMode = (
    ClampToEdge = 0,
    MirroredRepeat = 1,
    &Repeat = 2
  );
  PScenes_SceneWrappingMode = ^Scenes_SceneWrappingMode;

  // Microsoft.UI.Composition.SystemBackdrops.MicaKind
  SystemBackdrops_MicaKind = (
    Base = 0,
    BaseAlt = 1
  );
  PSystemBackdrops_MicaKind = ^SystemBackdrops_MicaKind;

  // Microsoft.UI.Composition.SystemBackdrops.SystemBackdropState
  SystemBackdrops_SystemBackdropState = (
    Active = 0,
    Fallback = 1,
    HighContrast = 2
  );
  PSystemBackdrops_SystemBackdropState = ^SystemBackdrops_SystemBackdropState;

  // Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme
  SystemBackdrops_SystemBackdropTheme = (
    Default = 0,
    Light = 1,
    Dark = 2
  );
  PSystemBackdrops_SystemBackdropTheme = ^SystemBackdrops_SystemBackdropTheme;

  // Microsoft.UI.Composition Interfaces

  // UsedAPI Interface
  // Microsoft.UI.Composition.ICompositionAnimation
  ICompositionAnimation = interface(IInspectable)
  ['{A829CCC8-6FDE-5B90-AD37-EFD307E1B631}']
    procedure ClearAllParameters; safecall;
    procedure ClearParameter(key: HSTRING); safecall;
    procedure SetColorParameter(key: HSTRING; value: Color); safecall;
    procedure SetMatrix3x2Parameter(key: HSTRING; value: Numerics_Matrix3x2); safecall;
    procedure SetMatrix4x4Parameter(key: HSTRING; value: Numerics_Matrix4x4); safecall;
    procedure SetQuaternionParameter(key: HSTRING; value: Numerics_Quaternion); safecall;
    procedure SetReferenceParameter(key: HSTRING; compositionObject: ICompositionObject); safecall;
    procedure SetScalarParameter(key: HSTRING; value: Single); safecall;
    procedure SetVector2Parameter(key: HSTRING; value: Numerics_Vector2); safecall;
    procedure SetVector3Parameter(key: HSTRING; value: Numerics_Vector3); safecall;
    procedure SetVector4Parameter(key: HSTRING; value: Numerics_Vector4); safecall;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.ICompositionObject
  ICompositionObject = interface(IInspectable)
  ['{0E583D49-FB5E-5481-A426-D3C41E059A5A}']
    function get_Compositor: ICompositor; safecall;
    function get_Properties: ICompositionPropertySet; safecall;
    procedure StartAnimation(propertyName: HSTRING; animation: ICompositionAnimation); safecall;
    procedure StopAnimation(propertyName: HSTRING); safecall;
    property Compositor: ICompositor read get_Compositor;
    property Properties: ICompositionPropertySet read get_Properties;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.IAnimationPropertyInfo
  IAnimationPropertyInfo = interface(IInspectable)
  ['{3D721A2B-9CCD-57BD-B6C2-CE9E04AE3606}']
    function get_AccessMode: AnimationPropertyAccessMode; safecall;
    procedure put_AccessMode(value: AnimationPropertyAccessMode); safecall;
    property AccessMode: AnimationPropertyAccessMode read get_AccessMode write put_AccessMode;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.SystemBackdrops.ISystemBackdropConfiguration
  SystemBackdrops_ISystemBackdropConfiguration = interface(IInspectable)
  ['{EBCCE1B9-0E0C-5431-AB0E-00F3F0669962}']
    function get_HighContrastBackgroundColor: IReference_1__Color; safecall;
    procedure put_HighContrastBackgroundColor(value: IReference_1__Color); safecall;
    function get_IsHighContrast: Boolean; safecall;
    procedure put_IsHighContrast(value: Boolean); safecall;
    function get_IsInputActive: Boolean; safecall;
    procedure put_IsInputActive(value: Boolean); safecall;
    function get_Theme: SystemBackdrops_SystemBackdropTheme; safecall;
    procedure put_Theme(value: SystemBackdrops_SystemBackdropTheme); safecall;
    property HighContrastBackgroundColor: IReference_1__Color read get_HighContrastBackgroundColor write put_HighContrastBackgroundColor;
    property IsHighContrast: Boolean read get_IsHighContrast write put_IsHighContrast;
    property IsInputActive: Boolean read get_IsInputActive write put_IsInputActive;
    property Theme: SystemBackdrops_SystemBackdropTheme read get_Theme write put_Theme;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.ICompositionSupportsSystemBackdrop
  ICompositionSupportsSystemBackdrop = interface(IInspectable)
  ['{397DAFE4-B6C2-5BB9-951D-F5707DE8B7BC}']
    function get_SystemBackdrop: ICompositionBrush; safecall;
    procedure put_SystemBackdrop(value: ICompositionBrush); safecall;
    property SystemBackdrop: ICompositionBrush read get_SystemBackdrop write put_SystemBackdrop;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.IVisualUnorderedCollection
  IVisualUnorderedCollection = interface(IInspectable)
  ['{4A97216E-793E-54E3-96E8-F9DB790119CD}']
    function get_Count: Integer; safecall;
    procedure Add(newVisual: IVisual); safecall;
    procedure Remove(visual: IVisual); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Composition.ICompositionLight
  ICompositionLight = interface(IInspectable)
  ['{6D633E77-A6B8-5A2D-8235-E0C380C3B47B}']
    function get_Targets: IVisualUnorderedCollection; safecall;
    property Targets: IVisualUnorderedCollection read get_Targets;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Composition.IAnimationObject
  IAnimationObject = interface(IInspectable)
  ['{8F56119D-B96D-58D0-9916-D1C5E390F890}']
    procedure PopulatePropertyInfo(propertyName: HSTRING; propertyInfo: IAnimationPropertyInfo); safecall;
  end;

  // Microsoft.UI.Composition.ICompositionAnimationFactory
  ICompositionAnimationFactory = interface(IInspectable)
  ['{2ED278CA-4CCA-5F7F-8D47-F930552A7769}']
  end;

  // Microsoft.UI.Composition.ICompositionBrushFactory
  ICompositionBrushFactory = interface(IInspectable)
  ['{ABF2B354-7130-53D9-8324-365D7E02EDE7}']
  end;

  // Microsoft.UI.Composition.ICompositionClipFactory
  ICompositionClipFactory = interface(IInspectable)
  ['{611DEC65-D302-52BC-92AB-A295BD141AE4}']
  end;

  // Microsoft.UI.Composition.ICompositionDrawingSurfaceFactory
  ICompositionDrawingSurfaceFactory = interface(IInspectable)
  ['{4791E19A-C83B-58B0-AC86-DFC58494F5F9}']
  end;

  // Microsoft.UI.Composition.ICompositionEasingFunctionFactory
  ICompositionEasingFunctionFactory = interface(IInspectable)
  ['{7D7D32C3-574B-5620-9902-DB426851802F}']
  end;

  // Microsoft.UI.Composition.ICompositionGeometryFactory
  ICompositionGeometryFactory = interface(IInspectable)
  ['{B2FB802B-C691-5554-8312-9C6D358D6B9E}']
  end;

  // Microsoft.UI.Composition.ICompositionGradientBrushFactory
  ICompositionGradientBrushFactory = interface(IInspectable)
  ['{B043B155-4B40-590D-A0D9-F8C1A7E0C88F}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Microsoft.UI.Composition.ICompositionSurface>
  AsyncOperationCompletedHandler_1__ICompositionSurface = interface(IUnknown)
  ['{C89EFA6D-6F22-5E04-8059-B5628E3F0180}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ICompositionSurface; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Microsoft.UI.Composition.ICompositionSurface>
  IAsyncOperation_1__ICompositionSurface = interface(IInspectable)
  ['{92CEAA5D-B255-57D9-AB7C-0F304485C1BD}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ICompositionSurface); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ICompositionSurface; safecall;
    function GetResults: ICompositionSurface; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ICompositionSurface read get_Completed write put_Completed;
  end;

  // Microsoft.UI.Composition.ICompositionLightFactory
  ICompositionLightFactory = interface(IInspectable)
  ['{CB29CAED-9245-51A6-BA56-ADDBAEFA54CC}']
  end;

  // Microsoft.UI.Composition.ICompositionObjectFactory
  ICompositionObjectFactory = interface(IInspectable)
  ['{6133C5F9-CD3B-56B2-876F-EB849DB14911}']
  end;

  // Microsoft.UI.Composition.ICompositionShadowFactory
  ICompositionShadowFactory = interface(IInspectable)
  ['{FF27546D-9750-54AE-AB8C-126CBE9158C3}']
  end;

  // Microsoft.UI.Composition.ICompositionShapeFactory
  ICompositionShapeFactory = interface(IInspectable)
  ['{7AA2B987-9CDD-5B6E-8AC1-E989D78B4811}']
  end;

  // Microsoft.UI.Composition.ICompositionSurfaceFacade
  ICompositionSurfaceFacade = interface(IInspectable)
  ['{88AC5DF6-377F-5CF7-A02E-ED5074D30452}']
    function GetRealSurface: ICompositionSurface; safecall;
  end;

  // Microsoft.UI.Composition.ICompositionTransformFactory
  ICompositionTransformFactory = interface(IInspectable)
  ['{78CC7BF2-CDC0-59D2-9C04-8D208DE7EF5E}']
  end;

  // Microsoft.UI.Composition.ICompositionVirtualDrawingSurfaceFactory
  ICompositionVirtualDrawingSurfaceFactory = interface(IInspectable)
  ['{85895891-3F06-52E2-B5EA-D1FB595F6574}']
  end;

  // Microsoft.UI.Composition.IContainerVisualFactory
  IContainerVisualFactory = interface(IInspectable)
  ['{3FA45EEB-C6DD-5AFD-971D-EAAF6245E716}']
  end;

  // Microsoft.UI.Composition.IKeyFrameAnimationFactory
  IKeyFrameAnimationFactory = interface(IInspectable)
  ['{7CCCFC87-3BAF-5100-B5F8-2F779F954F19}']
  end;

  // Microsoft.UI.Composition.INaturalMotionAnimationFactory
  INaturalMotionAnimationFactory = interface(IInspectable)
  ['{0411A259-2622-59E2-A59E-1E23D8F83A9F}']
  end;

  // Microsoft.UI.Composition.IScalarNaturalMotionAnimationFactory
  IScalarNaturalMotionAnimationFactory = interface(IInspectable)
  ['{14F8A9AB-976C-5E6F-890B-9A74D07FA39F}']
  end;

  // Microsoft.UI.Composition.IVector2NaturalMotionAnimationFactory
  IVector2NaturalMotionAnimationFactory = interface(IInspectable)
  ['{E39AEAD8-80F9-5F64-8644-E9E5646B796F}']
  end;

  // Microsoft.UI.Composition.IVector3NaturalMotionAnimationFactory
  IVector3NaturalMotionAnimationFactory = interface(IInspectable)
  ['{428241CB-BE9C-5C2A-939C-EC78AA60BB8A}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Composition.IVisualElement
  IVisualElement = interface(IInspectable)
  ['{2180F1F5-B5D8-4BF6-920A-12006E63EFEF}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Microsoft.UI.Composition.IVisualElement2
  IVisualElement2 = interface(IInspectable)
  ['{BC950C8D-1DB0-53AA-9DEE-34271CD18CE6}']
    function GetVisualInternal: IVisual; safecall;
  end;

  // Microsoft.UI.Composition.IVisualFactory
  IVisualFactory = interface(IInspectable)
  ['{77BB4668-83FA-5BB5-B78B-5E6FDC3D4038}']
  end;

  // Microsoft.UI.Composition.Interactions.IInteractionTrackerInertiaModifierFactory
  Interactions_IInteractionTrackerInertiaModifierFactory = interface(IInspectable)
  ['{6DEE5B33-0B5A-57B1-8537-93D4FD038F9F}']
  end;

  // Microsoft.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifierFactory
  Interactions_IInteractionTrackerVector2InertiaModifierFactory = interface(IInspectable)
  ['{1B3FD240-BA66-5296-B801-62A2A3606613}']
  end;

  // Microsoft.UI.Composition.Interactions.IVisualInteractionSourceObjectFactory
  Interactions_IVisualInteractionSourceObjectFactory = interface(IInspectable)
  ['{FEB73102-238C-52AA-8E03-B68D5ECC44B3}']
  end;

  // Microsoft.UI.Composition.Scenes.ISceneComponentFactory
  Scenes_ISceneComponentFactory = interface(IInspectable)
  ['{254088B0-BABF-503D-9A66-0D86AF5F7303}']
  end;

  // Microsoft.UI.Composition.Scenes.ISceneMaterialFactory
  Scenes_ISceneMaterialFactory = interface(IInspectable)
  ['{25747893-8748-5F60-969F-318FA0B735CA}']
  end;

  // Microsoft.UI.Composition.Scenes.ISceneMaterialInputFactory
  Scenes_ISceneMaterialInputFactory = interface(IInspectable)
  ['{B4DABD1D-58C0-5710-928A-BC49B0735694}']
  end;

  // Microsoft.UI.Composition.Scenes.ISceneObjectFactory
  Scenes_ISceneObjectFactory = interface(IInspectable)
  ['{EE797F7D-77DB-5C4C-B6F5-C1930FAD85C5}']
  end;

  // Microsoft.UI.Composition.Scenes.IScenePbrMaterialFactory
  Scenes_IScenePbrMaterialFactory = interface(IInspectable)
  ['{9E34D32A-E30C-51F5-84AC-6467950605CA}']
  end;

  // Microsoft.UI.Composition.Scenes.ISceneRendererComponentFactory
  Scenes_ISceneRendererComponentFactory = interface(IInspectable)
  ['{3CCAC1D6-6A0F-582E-BB1A-10EBC1E405CA}']
  end;

implementation

end.
