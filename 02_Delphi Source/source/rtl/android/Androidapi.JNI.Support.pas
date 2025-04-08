{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Support;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Android.Security,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Java.Security,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  //JCancellable = interface;//androidx.activity.Cancellable
  JComponentActivity = interface;//androidx.core.app.ComponentActivity
  Jactivity_ComponentActivity = interface;//androidx.activity.ComponentActivity
  //JComponentActivity_ReportFullyDrawnExecutor = interface;//androidx.activity.ComponentActivity$ReportFullyDrawnExecutor
  JFullyDrawnReporter = interface;//androidx.activity.FullyDrawnReporter
  JOnBackPressedCallback = interface;//androidx.activity.OnBackPressedCallback
  JOnBackPressedDispatcher = interface;//androidx.activity.OnBackPressedDispatcher
  JContextAwareHelper = interface;//androidx.activity.contextaware.ContextAwareHelper
  JOnContextAvailableListener = interface;//androidx.activity.contextaware.OnContextAvailableListener
  JActivityResultCallback = interface;//androidx.activity.result.ActivityResultCallback
  JActivityResultLauncher = interface;//androidx.activity.result.ActivityResultLauncher
  JActivityResultRegistry = interface;//androidx.activity.result.ActivityResultRegistry
  JActivityResultContract = interface;//androidx.activity.result.contract.ActivityResultContract
  JActivityResultContract_SynchronousResult = interface;//androidx.activity.result.contract.ActivityResultContract$SynchronousResult
  Jbiometric_BiometricManager = interface;//androidx.biometric.BiometricManager
  Jbiometric_BiometricManager_Authenticators = interface;//androidx.biometric.BiometricManager$Authenticators
  //JBiometricManager_Injector = interface;//androidx.biometric.BiometricManager$Injector
  Jbiometric_BiometricPrompt = interface;//androidx.biometric.BiometricPrompt
  Jbiometric_BiometricPrompt_AuthenticationCallback = interface;//androidx.biometric.BiometricPrompt$AuthenticationCallback
  Jbiometric_BiometricPrompt_AuthenticationResult = interface;//androidx.biometric.BiometricPrompt$AuthenticationResult
  Jbiometric_BiometricPrompt_CryptoObject = interface;//androidx.biometric.BiometricPrompt$CryptoObject
  JBiometricPrompt_PromptInfo = interface;//androidx.biometric.BiometricPrompt$PromptInfo
  JPromptInfo_Builder = interface;//androidx.biometric.BiometricPrompt$PromptInfo$Builder
  Jcontent_ContextCompat = interface;//androidx.core.content.ContextCompat
  Japp_ActivityCompat = interface;//androidx.core.app.ActivityCompat
  JActivityCompat_PermissionCompatDelegate = interface;//androidx.core.app.ActivityCompat$PermissionCompatDelegate
  Japp_ActivityOptionsCompat = interface;//androidx.core.app.ActivityOptionsCompat
  JComponentActivity_ExtraData = interface;//androidx.core.app.ComponentActivity$ExtraData
  Japp_JobIntentService = interface;//androidx.core.app.JobIntentService
  //JJobIntentService_CommandProcessor = interface;//androidx.core.app.JobIntentService$CommandProcessor
  //JJobIntentService_CompatJobEngine = interface;//androidx.core.app.JobIntentService$CompatJobEngine
  //JJobIntentService_GenericWorkItem = interface;//androidx.core.app.JobIntentService$GenericWorkItem
  //JJobIntentService_WorkEnqueuer = interface;//androidx.core.app.JobIntentService$WorkEnqueuer
  //JNotificationBuilderWithBuilderAccessor = interface;//androidx.core.app.NotificationBuilderWithBuilderAccessor
  Japp_NotificationCompat = interface;//androidx.core.app.NotificationCompat
  //JNotificationCompat_1 = interface;//androidx.core.app.NotificationCompat$1
  Japp_NotificationCompat_Action = interface;//androidx.core.app.NotificationCompat$Action
  JNotificationCompat_BubbleMetadata = interface;//androidx.core.app.NotificationCompat$BubbleMetadata
  Japp_NotificationCompat_Builder = interface;//androidx.core.app.NotificationCompat$Builder
  Japp_NotificationCompat_Extender = interface;//androidx.core.app.NotificationCompat$Extender
  Japp_NotificationCompat_Style = interface;//androidx.core.app.NotificationCompat$Style
  JPendingIntentCompat = interface;//androidx.core.app.PendingIntentCompat
  //Japp_Person = interface;//androidx.core.app.Person
  //JPerson_Builder = interface;//androidx.core.app.Person$Builder
  Jcore_app_RemoteInput = interface;//androidx.core.app.RemoteInput
  Jcore_app_SharedElementCallback = interface;//androidx.core.app.SharedElementCallback
  Jcore_app_SharedElementCallback_OnSharedElementsReadyListener = interface;//androidx.core.app.SharedElementCallback$OnSharedElementsReadyListener
  Jcontent_FileProvider = interface;//androidx.core.content.FileProvider
  JLocusIdCompat = interface;//androidx.core.content.LocusIdCompat
  Jcontent_PermissionChecker = interface;//androidx.core.content.PermissionChecker
  Jpm_ShortcutInfoCompat = interface;//androidx.core.content.pm.ShortcutInfoCompat
  JInsets = interface;//androidx.core.graphics.Insets
  //Jdrawable_IconCompat = interface;//androidx.core.graphics.drawable.IconCompat
  //Jfingerprint_FingerprintManagerCompat = interface;//androidx.core.hardware.fingerprint.FingerprintManagerCompat
  //Jfingerprint_FingerprintManagerCompat_AuthenticationCallback = interface;//androidx.core.hardware.fingerprint.FingerprintManagerCompat$AuthenticationCallback
  //Jfingerprint_FingerprintManagerCompat_AuthenticationResult = interface;//androidx.core.hardware.fingerprint.FingerprintManagerCompat$AuthenticationResult
  //Jfingerprint_FingerprintManagerCompat_CryptoObject = interface;//androidx.core.hardware.fingerprint.FingerprintManagerCompat$CryptoObject
  Jcore_os_CancellationSignal = interface;//androidx.core.os.CancellationSignal
  Jcore_os_CancellationSignal_OnCancelListener = interface;//androidx.core.os.CancellationSignal$OnCancelListener
  Jutil_Consumer = interface;//androidx.core.util.Consumer
  Jcore_util_Pair = interface;//androidx.core.util.Pair
  JDisplayCutoutCompat = interface;//androidx.core.view.DisplayCutoutCompat
  JDragAndDropPermissionsCompat = interface;//androidx.core.view.DragAndDropPermissionsCompat
  JMenuProvider = interface;//androidx.core.view.MenuProvider
  Jview_WindowInsetsCompat = interface;//androidx.core.view.WindowInsetsCompat
  Jprovider_DocumentFile = interface;//androidx.documentfile.provider.DocumentFile
  Jfragment_app_FragmentTransaction = interface;//androidx.fragment.app.FragmentTransaction
  //Japp_BackStackRecord = interface;//androidx.fragment.app.BackStackRecord
  Jfragment_app_Fragment = interface;//androidx.fragment.app.Fragment
  JFragment_AnimationInfo = interface;//androidx.fragment.app.Fragment$AnimationInfo
  JFragment_OnStartEnterTransitionListener = interface;//androidx.fragment.app.Fragment$OnStartEnterTransitionListener
  Jfragment_app_Fragment_SavedState = interface;//androidx.fragment.app.Fragment$SavedState
  JFragmentActivity = interface;//androidx.fragment.app.FragmentActivity
  Jfragment_app_FragmentContainer = interface;//androidx.fragment.app.FragmentContainer
  Jfragment_app_FragmentController = interface;//androidx.fragment.app.FragmentController
  JFragmentFactory = interface;//androidx.fragment.app.FragmentFactory
  Jfragment_app_FragmentHostCallback = interface;//androidx.fragment.app.FragmentHostCallback
  //JFragmentLifecycleCallbacksDispatcher = interface;//androidx.fragment.app.FragmentLifecycleCallbacksDispatcher
  Jfragment_app_FragmentManager = interface;//androidx.fragment.app.FragmentManager
  Jfragment_app_FragmentManager_BackStackEntry = interface;//androidx.fragment.app.FragmentManager$BackStackEntry
  Jfragment_app_FragmentManager_FragmentLifecycleCallbacks = interface;//androidx.fragment.app.FragmentManager$FragmentLifecycleCallbacks
  Jfragment_app_FragmentManager_OnBackStackChangedListener = interface;//androidx.fragment.app.FragmentManager$OnBackStackChangedListener
  //JFragmentManager_OpGenerator = interface;//androidx.fragment.app.FragmentManager$OpGenerator
  Jfragment_app_FragmentManagerNonConfig = interface;//androidx.fragment.app.FragmentManagerNonConfig
  //JFragmentTransaction_Op = interface;//androidx.fragment.app.FragmentTransaction$Op
  //JFragmentViewLifecycleOwner = interface;//androidx.fragment.app.FragmentViewLifecycleOwner
  Jcontent_WakefulBroadcastReceiver = interface;//androidx.legacy.content.WakefulBroadcastReceiver
  Jloader_app_LoaderManager = interface;//androidx.loader.app.LoaderManager
  Jloader_app_LoaderManager_LoaderCallbacks = interface;//androidx.loader.app.LoaderManager$LoaderCallbacks
  Jloader_content_Loader = interface;//androidx.loader.content.Loader
  Jloader_content_Loader_OnLoadCanceledListener = interface;//androidx.loader.content.Loader$OnLoadCanceledListener
  Jloader_content_Loader_OnLoadCompleteListener = interface;//androidx.loader.content.Loader$OnLoadCompleteListener

// ===== Interface declarations =====

  // androidx.activity.Cancellable
  JComponentActivityClass = interface(JActivityClass)
    ['{2072DE37-3EC0-45DD-8560-C7DF373A8254}']
    {class} function init: JComponentActivity; cdecl;
  end;

  [JavaSignature('androidx/core/app/ComponentActivity')]
  JComponentActivity = interface(JActivity)
    ['{F7D8932A-F2BE-446C-B700-CB605B082632}']
    function dispatchKeyEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function dispatchKeyShortcutEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function getExtraData(class_: Jlang_Class): JComponentActivity_ExtraData; cdecl;
    //function getLifecycle: JLifecycle; cdecl;
    procedure putExtraData(extraData: JComponentActivity_ExtraData); cdecl;
    function superDispatchKeyEvent(keyEvent: JKeyEvent): Boolean; cdecl;
  end;
  TJComponentActivity = class(TJavaGenericImport<JComponentActivityClass, JComponentActivity>) end;

  Jactivity_ComponentActivityClass = interface(JComponentActivityClass)
    ['{AFDE06AB-549D-46AD-B68F-B798622B0BAE}']
    {class} function init: Jactivity_ComponentActivity; cdecl; overload;
    {class} function init(i: Integer): Jactivity_ComponentActivity; cdecl; overload;
  end;

  [JavaSignature('androidx/activity/ComponentActivity')]
  Jactivity_ComponentActivity = interface(JComponentActivity)
    ['{AF56965A-8C96-4C13-ACCC-CF3943DD8840}']
    procedure addContentView(view: JView; layoutParams: JViewGroup_LayoutParams); cdecl;
    procedure addMenuProvider(menuProvider: JMenuProvider); cdecl; overload;
    //procedure addMenuProvider(menuProvider: JMenuProvider; lifecycleOwner: JLifecycleOwner); cdecl; overload;
    //procedure addMenuProvider(menuProvider: JMenuProvider; lifecycleOwner: JLifecycleOwner; state: JLifecycle_State); cdecl; overload;
    procedure addOnConfigurationChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure addOnContextAvailableListener(onContextAvailableListener: JOnContextAvailableListener); cdecl;
    procedure addOnMultiWindowModeChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure addOnNewIntentListener(consumer: Jutil_Consumer); cdecl;
    procedure addOnPictureInPictureModeChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure addOnTrimMemoryListener(consumer: Jutil_Consumer); cdecl;
    function getActivityResultRegistry: JActivityResultRegistry; cdecl;
    //function getDefaultViewModelCreationExtras: JCreationExtras; cdecl;
    //function getDefaultViewModelProviderFactory: JViewModelProvider_Factory; cdecl;
    function getFullyDrawnReporter: JFullyDrawnReporter; cdecl;
    function getLastCustomNonConfigurationInstance: JObject; cdecl;
    //function getLifecycle: JLifecycle; cdecl;
    function getOnBackPressedDispatcher: JOnBackPressedDispatcher; cdecl;
    //function getSavedStateRegistry: JSavedStateRegistry; cdecl;
    //function getViewModelStore: JViewModelStore; cdecl;
    procedure invalidateMenu; cdecl;
    procedure onBackPressed; cdecl;
    procedure onConfigurationChanged(configuration: JConfiguration); cdecl;
    function onCreatePanelMenu(i: Integer; menu: JMenu): Boolean; cdecl;
    function onMenuItemSelected(i: Integer; menuItem: JMenuItem): Boolean; cdecl;
    procedure onMultiWindowModeChanged(b: Boolean); cdecl; overload;
    procedure onMultiWindowModeChanged(b: Boolean; configuration: JConfiguration); cdecl; overload;
    procedure onPanelClosed(i: Integer; menu: JMenu); cdecl;
    procedure onPictureInPictureModeChanged(b: Boolean); cdecl; overload;
    procedure onPictureInPictureModeChanged(b: Boolean; configuration: JConfiguration); cdecl; overload;
    function onPreparePanel(i: Integer; view: JView; menu: JMenu): Boolean; cdecl;
    procedure onRequestPermissionsResult(i: Integer; string_: TJavaObjectArray<JString>; i1: TJavaArray<Integer>); cdecl;
    function onRetainCustomNonConfigurationInstance: JObject; cdecl;
    function onRetainNonConfigurationInstance: JObject; cdecl;
    procedure onTrimMemory(i: Integer); cdecl;
    function peekAvailableContext: JContext; cdecl;
    function registerForActivityResult(activityResultContract: JActivityResultContract; activityResultCallback: JActivityResultCallback): JActivityResultLauncher; cdecl; overload;
    function registerForActivityResult(activityResultContract: JActivityResultContract; activityResultRegistry: JActivityResultRegistry; activityResultCallback: JActivityResultCallback): JActivityResultLauncher; cdecl; overload;
    procedure removeMenuProvider(menuProvider: JMenuProvider); cdecl;
    procedure removeOnConfigurationChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure removeOnContextAvailableListener(onContextAvailableListener: JOnContextAvailableListener); cdecl;
    procedure removeOnMultiWindowModeChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure removeOnNewIntentListener(consumer: Jutil_Consumer); cdecl;
    procedure removeOnPictureInPictureModeChangedListener(consumer: Jutil_Consumer); cdecl;
    procedure removeOnTrimMemoryListener(consumer: Jutil_Consumer); cdecl;
    procedure reportFullyDrawn; cdecl;
    procedure setContentView(view: JView); cdecl; overload;
    procedure setContentView(i: Integer); cdecl; overload;
    procedure setContentView(view: JView; layoutParams: JViewGroup_LayoutParams); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; i: Integer); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; i: Integer; bundle: JBundle); cdecl; overload;
    procedure startIntentSenderForResult(intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer); cdecl; overload;
    procedure startIntentSenderForResult(intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl; overload;
  end;
  TJactivity_ComponentActivity = class(TJavaGenericImport<Jactivity_ComponentActivityClass, Jactivity_ComponentActivity>) end;

  // androidx.activity.ComponentActivity$ReportFullyDrawnExecutor
  JFullyDrawnReporterClass = interface(JObjectClass)
    ['{2474D1E2-0600-4E02-A5F9-D3B2BE0DA269}']
    {class} //function init(executor: JExecutor; function0: JFunction0): JFullyDrawnReporter; cdecl;
  end;

  [JavaSignature('androidx/activity/FullyDrawnReporter')]
  JFullyDrawnReporter = interface(JObject)
    ['{06DA8220-7A4C-4059-9D34-7C7FCE629D21}']
    //procedure addOnReportDrawnListener(function0: JFunction0); cdecl;
    procedure addReporter; cdecl;
    procedure fullyDrawnReported; cdecl;
    function isFullyDrawnReported: Boolean; cdecl;
    //procedure removeOnReportDrawnListener(function0: JFunction0); cdecl;
    procedure removeReporter; cdecl;
  end;
  TJFullyDrawnReporter = class(TJavaGenericImport<JFullyDrawnReporterClass, JFullyDrawnReporter>) end;

  JOnBackPressedCallbackClass = interface(JObjectClass)
    ['{19C246A8-AC85-469E-A5F0-225C8506857D}']
    {class} function init(b: Boolean): JOnBackPressedCallback; cdecl;
  end;

  [JavaSignature('androidx/activity/OnBackPressedCallback')]
  JOnBackPressedCallback = interface(JObject)
    ['{41620FFA-3F65-430B-A9D3-66BE1961FC02}']
    //procedure addCancellable(cancellable: JCancellable); cdecl;
    procedure handleOnBackPressed; cdecl;
    function isEnabled: Boolean; cdecl;
    procedure remove; cdecl;
    //procedure removeCancellable(cancellable: JCancellable); cdecl;
    procedure setEnabled(b: Boolean); cdecl;
  end;
  TJOnBackPressedCallback = class(TJavaGenericImport<JOnBackPressedCallbackClass, JOnBackPressedCallback>) end;

  JOnBackPressedDispatcherClass = interface(JObjectClass)
    ['{DBAE6F2E-4EC8-4B28-885B-2D8F246361D1}']
    {class} function init: JOnBackPressedDispatcher; cdecl; overload;
    {class} function init(runnable: JRunnable): JOnBackPressedDispatcher; cdecl; overload;
    {class} //function init(runnable: JRunnable; i: Integer; defaultConstructorMarker: JDefaultConstructorMarker): JOnBackPressedDispatcher; cdecl; overload;
  end;

  [JavaSignature('androidx/activity/OnBackPressedDispatcher')]
  JOnBackPressedDispatcher = interface(JObject)
    ['{CD20715C-AB96-42DF-9083-937B4C5AFBC9}']
    procedure addCallback(onBackPressedCallback: JOnBackPressedCallback); cdecl; overload;
    //procedure addCallback(lifecycleOwner: JLifecycleOwner; onBackPressedCallback: JOnBackPressedCallback); cdecl; overload;
    function hasEnabledCallbacks: Boolean; cdecl;
    procedure onBackPressed; cdecl;
    //procedure setOnBackInvokedDispatcher(onBackInvokedDispatcher: JOnBackInvokedDispatcher); cdecl;
  end;
  TJOnBackPressedDispatcher = class(TJavaGenericImport<JOnBackPressedDispatcherClass, JOnBackPressedDispatcher>) end;

  JContextAwareHelperClass = interface(JObjectClass)
    ['{468920D6-841F-4010-A7AA-233F260986B7}']
    {class} function init: JContextAwareHelper; cdecl;
  end;

  [JavaSignature('androidx/activity/contextaware/ContextAwareHelper')]
  JContextAwareHelper = interface(JObject)
    ['{CA7CD3AB-36B3-464F-8A09-C74F61FD35F5}']
    procedure addOnContextAvailableListener(onContextAvailableListener: JOnContextAvailableListener); cdecl;
    procedure clearAvailableContext; cdecl;
    procedure dispatchOnContextAvailable(context: JContext); cdecl;
    function peekAvailableContext: JContext; cdecl;
    procedure removeOnContextAvailableListener(onContextAvailableListener: JOnContextAvailableListener); cdecl;
  end;
  TJContextAwareHelper = class(TJavaGenericImport<JContextAwareHelperClass, JContextAwareHelper>) end;

  JOnContextAvailableListenerClass = interface(IJavaClass)
    ['{5A22D82B-FB61-4E03-B621-0F64DEF7D525}']
  end;

  [JavaSignature('androidx/activity/contextaware/OnContextAvailableListener')]
  JOnContextAvailableListener = interface(IJavaInstance)
    ['{2BC0A346-1AF7-4075-A580-14F6DFA55CBF}']
    procedure onContextAvailable(context: JContext); cdecl;
  end;
  TJOnContextAvailableListener = class(TJavaGenericImport<JOnContextAvailableListenerClass, JOnContextAvailableListener>) end;

  JActivityResultCallbackClass = interface(IJavaClass)
    ['{68F56A77-F1CE-45AE-8620-8BE2CBE5DF7A}']
  end;

  [JavaSignature('androidx/activity/result/ActivityResultCallback')]
  JActivityResultCallback = interface(IJavaInstance)
    ['{06DD2F5A-814C-4866-9049-1DC74941D4C1}']
    procedure onActivityResult(object_: JObject); cdecl;
  end;
  TJActivityResultCallback = class(TJavaGenericImport<JActivityResultCallbackClass, JActivityResultCallback>) end;

  JActivityResultLauncherClass = interface(JObjectClass)
    ['{657A8949-3375-4E08-86DB-28659C36F08F}']
    {class} function init: JActivityResultLauncher; cdecl;
  end;

  [JavaSignature('androidx/activity/result/ActivityResultLauncher')]
  JActivityResultLauncher = interface(JObject)
    ['{74C8F97D-B0DF-4E08-9304-29C58676B11D}']
    function getContract: JActivityResultContract; cdecl;
    procedure launch(object_: JObject); cdecl; overload;
    procedure launch(object_: JObject; activityOptionsCompat: Japp_ActivityOptionsCompat); cdecl; overload;
    procedure unregister; cdecl;
  end;
  TJActivityResultLauncher = class(TJavaGenericImport<JActivityResultLauncherClass, JActivityResultLauncher>) end;

  JActivityResultRegistryClass = interface(JObjectClass)
    ['{D6C022EF-0273-4529-BA44-8C6C92FCB000}']
    {class} function init: JActivityResultRegistry; cdecl;
  end;

  [JavaSignature('androidx/activity/result/ActivityResultRegistry')]
  JActivityResultRegistry = interface(JObject)
    ['{8211CCFD-AC32-4976-9F24-85B19786B642}']
    function dispatchResult(i: Integer; object_: JObject): Boolean; cdecl; overload;
    function dispatchResult(i: Integer; i1: Integer; intent: JIntent): Boolean; cdecl; overload;
    procedure onLaunch(i: Integer; activityResultContract: JActivityResultContract; object_: JObject; activityOptionsCompat: Japp_ActivityOptionsCompat); cdecl;
    procedure onRestoreInstanceState(bundle: JBundle); cdecl;
    procedure onSaveInstanceState(bundle: JBundle); cdecl;
    function register(string_: JString; activityResultContract: JActivityResultContract; activityResultCallback: JActivityResultCallback): JActivityResultLauncher; cdecl; overload;
    //function register(string_: JString; lifecycleOwner: JLifecycleOwner; activityResultContract: JActivityResultContract; activityResultCallback: JActivityResultCallback): JActivityResultLauncher; cdecl; overload;
  end;
  TJActivityResultRegistry = class(TJavaGenericImport<JActivityResultRegistryClass, JActivityResultRegistry>) end;

  JActivityResultContractClass = interface(JObjectClass)
    ['{5D6AA8CF-FD00-413B-8E22-A346BE05D0AD}']
    {class} function init: JActivityResultContract; cdecl;
  end;

  [JavaSignature('androidx/activity/result/contract/ActivityResultContract')]
  JActivityResultContract = interface(JObject)
    ['{7E4377EC-7A4F-43BE-8EF4-26572DB604A3}']
    function createIntent(context: JContext; object_: JObject): JIntent; cdecl;
    function getSynchronousResult(context: JContext; object_: JObject): JActivityResultContract_SynchronousResult; cdecl;
    function parseResult(i: Integer; intent: JIntent): JObject; cdecl;
  end;
  TJActivityResultContract = class(TJavaGenericImport<JActivityResultContractClass, JActivityResultContract>) end;

  JActivityResultContract_SynchronousResultClass = interface(JObjectClass)
    ['{00C6CAF5-3ED6-46E5-B728-D0D06C9AB6E9}']
    {class} function init(object_: JObject): JActivityResultContract_SynchronousResult; cdecl;
  end;

  [JavaSignature('androidx/activity/result/contract/ActivityResultContract$SynchronousResult')]
  JActivityResultContract_SynchronousResult = interface(JObject)
    ['{40ADAD3F-6B4E-4D4A-A5BC-5100651F7513}']
    function getValue: JObject; cdecl;
  end;
  TJActivityResultContract_SynchronousResult = class(TJavaGenericImport<JActivityResultContract_SynchronousResultClass, JActivityResultContract_SynchronousResult>) end;

  Jbiometric_BiometricManagerClass = interface(JObjectClass)
    ['{E9BD98D3-3931-46DC-AC15-6AD113A967C9}']
    {class} function _GetBIOMETRIC_ERROR_HW_UNAVAILABLE: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_NONE_ENROLLED: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_NO_HARDWARE: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_UNSUPPORTED: Integer; cdecl;
    {class} function _GetBIOMETRIC_STATUS_UNKNOWN: Integer; cdecl;
    {class} function _GetBIOMETRIC_SUCCESS: Integer; cdecl;
    {class} function from(context: JContext): Jbiometric_BiometricManager; cdecl;
    {class} property BIOMETRIC_ERROR_HW_UNAVAILABLE: Integer read _GetBIOMETRIC_ERROR_HW_UNAVAILABLE;
    {class} property BIOMETRIC_ERROR_NONE_ENROLLED: Integer read _GetBIOMETRIC_ERROR_NONE_ENROLLED;
    {class} property BIOMETRIC_ERROR_NO_HARDWARE: Integer read _GetBIOMETRIC_ERROR_NO_HARDWARE;
    {class} property BIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED: Integer read _GetBIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED;
    {class} property BIOMETRIC_ERROR_UNSUPPORTED: Integer read _GetBIOMETRIC_ERROR_UNSUPPORTED;
    {class} property BIOMETRIC_STATUS_UNKNOWN: Integer read _GetBIOMETRIC_STATUS_UNKNOWN;
    {class} property BIOMETRIC_SUCCESS: Integer read _GetBIOMETRIC_SUCCESS;
  end;

  [JavaSignature('androidx/biometric/BiometricManager')]
  Jbiometric_BiometricManager = interface(JObject)
    ['{233660DF-CEAE-4ACC-945D-452C45F0DB3D}']
    function canAuthenticate: Integer; cdecl; overload;
    function canAuthenticate(i: Integer): Integer; cdecl; overload;
  end;
  TJbiometric_BiometricManager = class(TJavaGenericImport<Jbiometric_BiometricManagerClass, Jbiometric_BiometricManager>) end;

  Jbiometric_BiometricManager_AuthenticatorsClass = interface(IJavaClass)
    ['{F3FDE698-2B08-477A-B31F-080890E6C948}']
    {class} function _GetBIOMETRIC_STRONG: Integer; cdecl;
    {class} function _GetBIOMETRIC_WEAK: Integer; cdecl;
    {class} function _GetDEVICE_CREDENTIAL: Integer; cdecl;
    {class} property BIOMETRIC_STRONG: Integer read _GetBIOMETRIC_STRONG;
    {class} property BIOMETRIC_WEAK: Integer read _GetBIOMETRIC_WEAK;
    {class} property DEVICE_CREDENTIAL: Integer read _GetDEVICE_CREDENTIAL;
  end;

  [JavaSignature('androidx/biometric/BiometricManager$Authenticators')]
  Jbiometric_BiometricManager_Authenticators = interface(IJavaInstance)
    ['{F4B6A064-9FA3-48CF-954D-17196E06CE4A}']
  end;
  TJbiometric_BiometricManager_Authenticators = class(TJavaGenericImport<Jbiometric_BiometricManager_AuthenticatorsClass, Jbiometric_BiometricManager_Authenticators>) end;

  // androidx.biometric.BiometricManager$Injector
  Jbiometric_BiometricPromptClass = interface(JObjectClass)
    ['{6638C0B7-2DDF-40C0-A093-2E948F0BEA9B}']
    {class} function _GetAUTHENTICATION_RESULT_TYPE_BIOMETRIC: Integer; cdecl;
    {class} function _GetAUTHENTICATION_RESULT_TYPE_DEVICE_CREDENTIAL: Integer; cdecl;
    {class} function _GetAUTHENTICATION_RESULT_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetERROR_CANCELED: Integer; cdecl;
    {class} function _GetERROR_HW_NOT_PRESENT: Integer; cdecl;
    {class} function _GetERROR_HW_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_LOCKOUT: Integer; cdecl;
    {class} function _GetERROR_LOCKOUT_PERMANENT: Integer; cdecl;
    {class} function _GetERROR_NEGATIVE_BUTTON: Integer; cdecl;
    {class} function _GetERROR_NO_BIOMETRICS: Integer; cdecl;
    {class} function _GetERROR_NO_DEVICE_CREDENTIAL: Integer; cdecl;
    {class} function _GetERROR_NO_SPACE: Integer; cdecl;
    {class} function _GetERROR_SECURITY_UPDATE_REQUIRED: Integer; cdecl;
    {class} function _GetERROR_TIMEOUT: Integer; cdecl;
    {class} function _GetERROR_UNABLE_TO_PROCESS: Integer; cdecl;
    {class} function _GetERROR_USER_CANCELED: Integer; cdecl;
    {class} function _GetERROR_VENDOR: Integer; cdecl;
    {class} function init(fragment: Jfragment_app_Fragment; authenticationCallback: Jbiometric_BiometricPrompt_AuthenticationCallback): Jbiometric_BiometricPrompt; cdecl; overload;
    {class} function init(fragmentActivity: JFragmentActivity; authenticationCallback: Jbiometric_BiometricPrompt_AuthenticationCallback): Jbiometric_BiometricPrompt; cdecl; overload;
    {class} function init(fragment: Jfragment_app_Fragment; executor: JExecutor; authenticationCallback: Jbiometric_BiometricPrompt_AuthenticationCallback): Jbiometric_BiometricPrompt; cdecl; overload;
    {class} function init(fragmentActivity: JFragmentActivity; executor: JExecutor; authenticationCallback: Jbiometric_BiometricPrompt_AuthenticationCallback): Jbiometric_BiometricPrompt; cdecl; overload;
    {class} property AUTHENTICATION_RESULT_TYPE_BIOMETRIC: Integer read _GetAUTHENTICATION_RESULT_TYPE_BIOMETRIC;
    {class} property AUTHENTICATION_RESULT_TYPE_DEVICE_CREDENTIAL: Integer read _GetAUTHENTICATION_RESULT_TYPE_DEVICE_CREDENTIAL;
    {class} property AUTHENTICATION_RESULT_TYPE_UNKNOWN: Integer read _GetAUTHENTICATION_RESULT_TYPE_UNKNOWN;
    {class} property ERROR_CANCELED: Integer read _GetERROR_CANCELED;
    {class} property ERROR_HW_NOT_PRESENT: Integer read _GetERROR_HW_NOT_PRESENT;
    {class} property ERROR_HW_UNAVAILABLE: Integer read _GetERROR_HW_UNAVAILABLE;
    {class} property ERROR_LOCKOUT: Integer read _GetERROR_LOCKOUT;
    {class} property ERROR_LOCKOUT_PERMANENT: Integer read _GetERROR_LOCKOUT_PERMANENT;
    {class} property ERROR_NEGATIVE_BUTTON: Integer read _GetERROR_NEGATIVE_BUTTON;
    {class} property ERROR_NO_BIOMETRICS: Integer read _GetERROR_NO_BIOMETRICS;
    {class} property ERROR_NO_DEVICE_CREDENTIAL: Integer read _GetERROR_NO_DEVICE_CREDENTIAL;
    {class} property ERROR_NO_SPACE: Integer read _GetERROR_NO_SPACE;
    {class} property ERROR_SECURITY_UPDATE_REQUIRED: Integer read _GetERROR_SECURITY_UPDATE_REQUIRED;
    {class} property ERROR_TIMEOUT: Integer read _GetERROR_TIMEOUT;
    {class} property ERROR_UNABLE_TO_PROCESS: Integer read _GetERROR_UNABLE_TO_PROCESS;
    {class} property ERROR_USER_CANCELED: Integer read _GetERROR_USER_CANCELED;
    {class} property ERROR_VENDOR: Integer read _GetERROR_VENDOR;
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt')]
  Jbiometric_BiometricPrompt = interface(JObject)
    ['{505AB517-E7E9-4032-9B76-CA1084AA0185}']
    procedure authenticate(promptInfo: JBiometricPrompt_PromptInfo); cdecl; overload;
    procedure authenticate(promptInfo: JBiometricPrompt_PromptInfo; cryptoObject: Jbiometric_BiometricPrompt_CryptoObject); cdecl; overload;
    procedure cancelAuthentication; cdecl;
  end;
  TJbiometric_BiometricPrompt = class(TJavaGenericImport<Jbiometric_BiometricPromptClass, Jbiometric_BiometricPrompt>) end;

  Jbiometric_BiometricPrompt_AuthenticationCallbackClass = interface(JObjectClass)
    ['{09117CA8-36F7-466A-878A-E8B6F7BD6B4E}']
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt$AuthenticationCallback')]
  Jbiometric_BiometricPrompt_AuthenticationCallback = interface(JObject)
    ['{7E93C3A4-616B-4578-9623-7868FB9B5101}']
    procedure onAuthenticationError(i: Integer; charSequence: JCharSequence); cdecl;
    procedure onAuthenticationFailed; cdecl;
    procedure onAuthenticationSucceeded(authenticationResult: Jbiometric_BiometricPrompt_AuthenticationResult); cdecl;
  end;
  TJbiometric_BiometricPrompt_AuthenticationCallback = class(TJavaGenericImport<Jbiometric_BiometricPrompt_AuthenticationCallbackClass, Jbiometric_BiometricPrompt_AuthenticationCallback>) end;

  Jbiometric_BiometricPrompt_AuthenticationResultClass = interface(JObjectClass)
    ['{88A24455-BF2F-4DB9-B1FC-BFAD6ADBB6C8}']
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt$AuthenticationResult')]
  Jbiometric_BiometricPrompt_AuthenticationResult = interface(JObject)
    ['{403FBF74-94ED-4192-B636-CDBBCF09B527}']
    function getAuthenticationType: Integer; cdecl;
    function getCryptoObject: Jbiometric_BiometricPrompt_CryptoObject; cdecl;
  end;
  TJbiometric_BiometricPrompt_AuthenticationResult = class(TJavaGenericImport<Jbiometric_BiometricPrompt_AuthenticationResultClass, Jbiometric_BiometricPrompt_AuthenticationResult>) end;

  Jbiometric_BiometricPrompt_CryptoObjectClass = interface(JObjectClass)
    ['{9411A69F-68E6-40F6-A76C-4388ACB76FE4}']
    {class} function init(signature: Jsecurity_Signature): Jbiometric_BiometricPrompt_CryptoObject; cdecl; overload;
    {class} function init(cipher: JCipher): Jbiometric_BiometricPrompt_CryptoObject; cdecl; overload;
    {class} function init(mac: JMac): Jbiometric_BiometricPrompt_CryptoObject; cdecl; overload;
    {class} function init(identityCredential: JIdentityCredential): Jbiometric_BiometricPrompt_CryptoObject; cdecl; overload;
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt$CryptoObject')]
  Jbiometric_BiometricPrompt_CryptoObject = interface(JObject)
    ['{4092A79E-C915-4C21-8293-E2E65F08498D}']
    function getCipher: JCipher; cdecl;
    function getIdentityCredential: JIdentityCredential; cdecl;
    function getMac: JMac; cdecl;
    function getSignature: Jsecurity_Signature; cdecl;
  end;
  TJbiometric_BiometricPrompt_CryptoObject = class(TJavaGenericImport<Jbiometric_BiometricPrompt_CryptoObjectClass, Jbiometric_BiometricPrompt_CryptoObject>) end;

  JBiometricPrompt_PromptInfoClass = interface(JObjectClass)
    ['{A2900B0F-556D-4FB4-8D8B-3511BC4CA4B8}']
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt$PromptInfo')]
  JBiometricPrompt_PromptInfo = interface(JObject)
    ['{DAE2125C-70DE-4C59-85DF-6F0DFF32206F}']
    function getAllowedAuthenticators: Integer; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getNegativeButtonText: JCharSequence; cdecl;
    function getSubtitle: JCharSequence; cdecl;
    function getTitle: JCharSequence; cdecl;
    function isConfirmationRequired: Boolean; cdecl;
    function isDeviceCredentialAllowed: Boolean; cdecl;
  end;
  TJBiometricPrompt_PromptInfo = class(TJavaGenericImport<JBiometricPrompt_PromptInfoClass, JBiometricPrompt_PromptInfo>) end;

  JPromptInfo_BuilderClass = interface(JObjectClass)
    ['{D4AB16E2-0C2E-4179-9AB2-78333724B556}']
    {class} function init: JPromptInfo_Builder; cdecl;
  end;

  [JavaSignature('androidx/biometric/BiometricPrompt$PromptInfo$Builder')]
  JPromptInfo_Builder = interface(JObject)
    ['{C3460454-7E79-48C1-BD13-CE2B01BA20AE}']
    function build: JBiometricPrompt_PromptInfo; cdecl;
    function setAllowedAuthenticators(i: Integer): JPromptInfo_Builder; cdecl;
    function setConfirmationRequired(b: Boolean): JPromptInfo_Builder; cdecl;
    function setDescription(charSequence: JCharSequence): JPromptInfo_Builder; cdecl;
    function setDeviceCredentialAllowed(b: Boolean): JPromptInfo_Builder; cdecl;
    function setNegativeButtonText(charSequence: JCharSequence): JPromptInfo_Builder; cdecl;
    function setSubtitle(charSequence: JCharSequence): JPromptInfo_Builder; cdecl;
    function setTitle(charSequence: JCharSequence): JPromptInfo_Builder; cdecl;
  end;
  TJPromptInfo_Builder = class(TJavaGenericImport<JPromptInfo_BuilderClass, JPromptInfo_Builder>) end;

  Jcontent_ContextCompatClass = interface(JObjectClass)
    ['{DBBBF89C-A4F3-4A4C-A725-4B2FF89151B5}']
    {class} function _GetRECEIVER_EXPORTED: Integer; cdecl;
    {class} function _GetRECEIVER_NOT_EXPORTED: Integer; cdecl;
    {class} function _GetRECEIVER_VISIBLE_TO_INSTANT_APPS: Integer; cdecl;
    {class} function checkSelfPermission(context: JContext; string_: JString): Integer; cdecl;
    {class} function createDeviceProtectedStorageContext(context: JContext): JContext; cdecl;
    {class} function getAttributionTag(context: JContext): JString; cdecl;
    {class} function getCodeCacheDir(context: JContext): JFile; cdecl;
    {class} function getColor(context: JContext; i: Integer): Integer; cdecl;
    {class} function getColorStateList(context: JContext; i: Integer): JColorStateList; cdecl;
    {class} function getDataDir(context: JContext): JFile; cdecl;
    {class} function getDrawable(context: JContext; i: Integer): JDrawable; cdecl;
    {class} function getExternalCacheDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function getExternalFilesDirs(context: JContext; string_: JString): TJavaObjectArray<JFile>; cdecl;
    {class} function getMainExecutor(context: JContext): JExecutor; cdecl;
    {class} function getNoBackupFilesDir(context: JContext): JFile; cdecl;
    {class} function getObbDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function getSystemService(context: JContext; class_: Jlang_Class): JObject; cdecl;
    {class} function getSystemServiceName(context: JContext; class_: Jlang_Class): JString; cdecl;
    {class} function isDeviceProtectedStorage(context: JContext): Boolean; cdecl;
    {class} function registerReceiver(context: JContext; broadcastReceiver: JBroadcastReceiver; intentFilter: JIntentFilter; i: Integer): JIntent; cdecl; overload;
    {class} function registerReceiver(context: JContext; broadcastReceiver: JBroadcastReceiver; intentFilter: JIntentFilter; string_: JString; handler: JHandler; i: Integer): JIntent; cdecl; overload;
    {class} function startActivities(context: JContext; intent: TJavaObjectArray<JIntent>): Boolean; cdecl; overload;
    {class} function startActivities(context: JContext; intent: TJavaObjectArray<JIntent>; bundle: JBundle): Boolean; cdecl; overload;
    {class} procedure startActivity(context: JContext; intent: JIntent; bundle: JBundle); cdecl;
    {class} procedure startForegroundService(context: JContext; intent: JIntent); cdecl;
    {class} property RECEIVER_EXPORTED: Integer read _GetRECEIVER_EXPORTED;
    {class} property RECEIVER_NOT_EXPORTED: Integer read _GetRECEIVER_NOT_EXPORTED;
    {class} property RECEIVER_VISIBLE_TO_INSTANT_APPS: Integer read _GetRECEIVER_VISIBLE_TO_INSTANT_APPS;
  end;

  [JavaSignature('androidx/core/content/ContextCompat')]
  Jcontent_ContextCompat = interface(JObject)
    ['{C3E72573-B2C1-44DC-BA10-C681EFA5A8FE}']
  end;
  TJcontent_ContextCompat = class(TJavaGenericImport<Jcontent_ContextCompatClass, Jcontent_ContextCompat>) end;

  Japp_ActivityCompatClass = interface(Jcontent_ContextCompatClass)
    ['{B012E1D8-4117-4F83-ABB1-7BE099CBCCDC}']
    {class} procedure finishAffinity(activity: JActivity); cdecl;
    {class} procedure finishAfterTransition(activity: JActivity); cdecl;
    {class} function getPermissionCompatDelegate: JActivityCompat_PermissionCompatDelegate; cdecl;
    {class} function getReferrer(activity: JActivity): Jnet_Uri; cdecl;
    {class} function invalidateOptionsMenu(activity: JActivity): Boolean; cdecl;
    {class} function isLaunchedFromBubble(activity: JActivity): Boolean; cdecl;
    {class} procedure postponeEnterTransition(activity: JActivity); cdecl;
    {class} procedure recreate(activity: JActivity); cdecl;
    {class} function requestDragAndDropPermissions(activity: JActivity; dragEvent: JDragEvent): JDragAndDropPermissionsCompat; cdecl;
    {class} procedure requestPermissions(activity: JActivity; string_: TJavaObjectArray<JString>; i: Integer); cdecl;
    {class} function requireViewById(activity: JActivity; i: Integer): JView; cdecl;
    {class} procedure setEnterSharedElementCallback(activity: JActivity; sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    {class} procedure setExitSharedElementCallback(activity: JActivity; sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    {class} procedure setLocusContext(activity: JActivity; locusIdCompat: JLocusIdCompat; bundle: JBundle); cdecl;
    {class} procedure setPermissionCompatDelegate(permissionCompatDelegate: JActivityCompat_PermissionCompatDelegate); cdecl;
    {class} function shouldShowRequestPermissionRationale(activity: JActivity; string_: JString): Boolean; cdecl;
    {class} procedure startActivityForResult(activity: JActivity; intent: JIntent; i: Integer; bundle: JBundle); cdecl;
    {class} procedure startIntentSenderForResult(activity: JActivity; intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl;
    {class} procedure startPostponedEnterTransition(activity: JActivity); cdecl;
  end;

  [JavaSignature('androidx/core/app/ActivityCompat')]
  Japp_ActivityCompat = interface(Jcontent_ContextCompat)
    ['{118A89A7-16CE-42D7-B5D9-AB5E16FD5744}']
  end;
  TJapp_ActivityCompat = class(TJavaGenericImport<Japp_ActivityCompatClass, Japp_ActivityCompat>) end;

  JActivityCompat_PermissionCompatDelegateClass = interface(IJavaClass)
    ['{2DB5EEC6-2A96-4E7F-84B1-84D92CD86778}']
  end;

  [JavaSignature('androidx/core/app/ActivityCompat$PermissionCompatDelegate')]
  JActivityCompat_PermissionCompatDelegate = interface(IJavaInstance)
    ['{9127435C-288A-48E9-A04E-D649988A967E}']
    function onActivityResult(activity: JActivity; i: Integer; i1: Integer; intent: JIntent): Boolean; cdecl;
    function requestPermissions(activity: JActivity; string_: TJavaObjectArray<JString>; i: Integer): Boolean; cdecl;
  end;
  TJActivityCompat_PermissionCompatDelegate = class(TJavaGenericImport<JActivityCompat_PermissionCompatDelegateClass, JActivityCompat_PermissionCompatDelegate>) end;

  Japp_ActivityOptionsCompatClass = interface(JObjectClass)
    ['{C926C5A5-26C0-44A5-A4C9-730F4D928973}']
    {class} function _GetEXTRA_USAGE_TIME_REPORT: JString; cdecl;
    {class} function _GetEXTRA_USAGE_TIME_REPORT_PACKAGES: JString; cdecl;
    {class} function makeBasic: Japp_ActivityOptionsCompat; cdecl;
    {class} function makeClipRevealAnimation(view: JView; i: Integer; i1: Integer; i2: Integer; i3: Integer): Japp_ActivityOptionsCompat; cdecl;
    {class} function makeCustomAnimation(context: JContext; i: Integer; i1: Integer): Japp_ActivityOptionsCompat; cdecl;
    {class} function makeScaleUpAnimation(view: JView; i: Integer; i1: Integer; i2: Integer; i3: Integer): Japp_ActivityOptionsCompat; cdecl;
    {class} function makeSceneTransitionAnimation(activity: JActivity; view: JView; string_: JString): Japp_ActivityOptionsCompat; cdecl; overload;
    {class} function makeTaskLaunchBehind: Japp_ActivityOptionsCompat; cdecl;
    {class} function makeThumbnailScaleUpAnimation(view: JView; bitmap: JBitmap; i: Integer; i1: Integer): Japp_ActivityOptionsCompat; cdecl;
    {class} property EXTRA_USAGE_TIME_REPORT: JString read _GetEXTRA_USAGE_TIME_REPORT;
    {class} property EXTRA_USAGE_TIME_REPORT_PACKAGES: JString read _GetEXTRA_USAGE_TIME_REPORT_PACKAGES;
  end;

  [JavaSignature('androidx/core/app/ActivityOptionsCompat')]
  Japp_ActivityOptionsCompat = interface(JObject)
    ['{EE62E67D-F02B-440E-8EEC-20069940FB7B}']
    function getLaunchBounds: JRect; cdecl;
    procedure requestUsageTimeReport(pendingIntent: JPendingIntent); cdecl;
    function setLaunchBounds(rect: JRect): Japp_ActivityOptionsCompat; cdecl;
    function toBundle: JBundle; cdecl;
    procedure update(activityOptionsCompat: Japp_ActivityOptionsCompat); cdecl;
  end;
  TJapp_ActivityOptionsCompat = class(TJavaGenericImport<Japp_ActivityOptionsCompatClass, Japp_ActivityOptionsCompat>) end;

  JComponentActivity_ExtraDataClass = interface(JObjectClass)
    ['{37177F74-B66A-44DD-AA87-E877DE409A38}']
    {class} function init: JComponentActivity_ExtraData; cdecl;
  end;

  [JavaSignature('androidx/core/app/ComponentActivity$ExtraData')]
  JComponentActivity_ExtraData = interface(JObject)
    ['{6E85A814-436C-4184-98D8-0E1C0472DD05}']
  end;
  TJComponentActivity_ExtraData = class(TJavaGenericImport<JComponentActivity_ExtraDataClass, JComponentActivity_ExtraData>) end;

  Japp_JobIntentServiceClass = interface(JServiceClass)
    ['{5D81830D-96FD-48F9-9B41-D62B676F5C45}']
    {class} procedure enqueueWork(context: JContext; componentName: JComponentName; i: Integer; intent: JIntent); cdecl; overload;
    {class} procedure enqueueWork(context: JContext; class_: Jlang_Class; i: Integer; intent: JIntent); cdecl; overload;
    {class} function init: Japp_JobIntentService; cdecl;
  end;

  [JavaSignature('androidx/core/app/JobIntentService')]
  Japp_JobIntentService = interface(JService)
    ['{EDF7B4DD-04A3-4275-812A-F342FF4ED235}']
    function isStopped: Boolean; cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;
    function onStartCommand(intent: JIntent; i: Integer; i1: Integer): Integer; cdecl;
    function onStopCurrentWork: Boolean; cdecl;
    procedure setInterruptIfStopped(b: Boolean); cdecl;
  end;
  TJapp_JobIntentService = class(TJavaGenericImport<Japp_JobIntentServiceClass, Japp_JobIntentService>) end;

  // androidx.core.app.JobIntentService$CommandProcessor
  // androidx.core.app.JobIntentService$CompatJobEngine
  // androidx.core.app.JobIntentService$GenericWorkItem
  // androidx.core.app.JobIntentService$WorkEnqueuer
  // androidx.core.app.NotificationBuilderWithBuilderAccessor
  Japp_NotificationCompatClass = interface(JObjectClass)
    ['{F2EE4A9F-9C51-4752-B690-27AA5438AFA2}']
    {class} function _GetBADGE_ICON_LARGE: Integer; cdecl;
    {class} function _GetBADGE_ICON_NONE: Integer; cdecl;
    {class} function _GetBADGE_ICON_SMALL: Integer; cdecl;
    {class} function _GetCATEGORY_ALARM: JString; cdecl;
    {class} function _GetCATEGORY_CALL: JString; cdecl;
    {class} function _GetCATEGORY_EMAIL: JString; cdecl;
    {class} function _GetCATEGORY_ERROR: JString; cdecl;
    {class} function _GetCATEGORY_EVENT: JString; cdecl;
    {class} function _GetCATEGORY_LOCATION_SHARING: JString; cdecl;
    {class} function _GetCATEGORY_MESSAGE: JString; cdecl;
    {class} function _GetCATEGORY_MISSED_CALL: JString; cdecl;
    {class} function _GetCATEGORY_NAVIGATION: JString; cdecl;
    {class} function _GetCATEGORY_PROGRESS: JString; cdecl;
    {class} function _GetCATEGORY_PROMO: JString; cdecl;
    {class} function _GetCATEGORY_RECOMMENDATION: JString; cdecl;
    {class} function _GetCATEGORY_REMINDER: JString; cdecl;
    {class} function _GetCATEGORY_SERVICE: JString; cdecl;
    {class} function _GetCATEGORY_SOCIAL: JString; cdecl;
    {class} function _GetCATEGORY_STATUS: JString; cdecl;
    {class} function _GetCATEGORY_STOPWATCH: JString; cdecl;
    {class} function _GetCATEGORY_SYSTEM: JString; cdecl;
    {class} function _GetCATEGORY_TRANSPORT: JString; cdecl;
    {class} function _GetCATEGORY_WORKOUT: JString; cdecl;
    {class} function _GetCOLOR_DEFAULT: Integer; cdecl;
    {class} function _GetDEFAULT_ALL: Integer; cdecl;
    {class} function _GetDEFAULT_LIGHTS: Integer; cdecl;
    {class} function _GetDEFAULT_SOUND: Integer; cdecl;
    {class} function _GetDEFAULT_VIBRATE: Integer; cdecl;
    {class} function _GetEXTRA_ANSWER_COLOR: JString; cdecl;
    {class} function _GetEXTRA_ANSWER_INTENT: JString; cdecl;
    {class} function _GetEXTRA_AUDIO_CONTENTS_URI: JString; cdecl;
    {class} function _GetEXTRA_BACKGROUND_IMAGE_URI: JString; cdecl;
    {class} function _GetEXTRA_BIG_TEXT: JString; cdecl;
    {class} function _GetEXTRA_CALL_IS_VIDEO: JString; cdecl;
    {class} function _GetEXTRA_CALL_PERSON: JString; cdecl;
    {class} function _GetEXTRA_CALL_PERSON_COMPAT: JString; cdecl;
    {class} function _GetEXTRA_CALL_TYPE: JString; cdecl;
    {class} function _GetEXTRA_CHANNEL_GROUP_ID: JString; cdecl;
    {class} function _GetEXTRA_CHANNEL_ID: JString; cdecl;
    {class} function _GetEXTRA_CHRONOMETER_COUNT_DOWN: JString; cdecl;
    {class} function _GetEXTRA_COLORIZED: JString; cdecl;
    {class} function _GetEXTRA_COMPACT_ACTIONS: JString; cdecl;
    {class} function _GetEXTRA_COMPAT_TEMPLATE: JString; cdecl;
    {class} function _GetEXTRA_CONVERSATION_TITLE: JString; cdecl;
    {class} function _GetEXTRA_DECLINE_COLOR: JString; cdecl;
    {class} function _GetEXTRA_DECLINE_INTENT: JString; cdecl;
    {class} function _GetEXTRA_HANG_UP_INTENT: JString; cdecl;
    {class} function _GetEXTRA_HIDDEN_CONVERSATION_TITLE: JString; cdecl;
    {class} function _GetEXTRA_HISTORIC_MESSAGES: JString; cdecl;
    {class} function _GetEXTRA_INFO_TEXT: JString; cdecl;
    {class} function _GetEXTRA_IS_GROUP_CONVERSATION: JString; cdecl;
    {class} function _GetEXTRA_LARGE_ICON: JString; cdecl;
    {class} function _GetEXTRA_LARGE_ICON_BIG: JString; cdecl;
    {class} function _GetEXTRA_MEDIA_SESSION: JString; cdecl;
    {class} function _GetEXTRA_MESSAGES: JString; cdecl;
    {class} function _GetEXTRA_MESSAGING_STYLE_USER: JString; cdecl;
    {class} function _GetEXTRA_NOTIFICATION_ID: JString; cdecl;
    {class} function _GetEXTRA_NOTIFICATION_TAG: JString; cdecl;
    {class} function _GetEXTRA_PEOPLE: JString; cdecl;
    {class} function _GetEXTRA_PEOPLE_LIST: JString; cdecl;
    {class} function _GetEXTRA_PICTURE: JString; cdecl;
    {class} function _GetEXTRA_PICTURE_CONTENT_DESCRIPTION: JString; cdecl;
    {class} function _GetEXTRA_PICTURE_ICON: JString; cdecl;
    {class} function _GetEXTRA_PROGRESS: JString; cdecl;
    {class} function _GetEXTRA_PROGRESS_INDETERMINATE: JString; cdecl;
    {class} function _GetEXTRA_PROGRESS_MAX: JString; cdecl;
    {class} function _GetEXTRA_REMOTE_INPUT_HISTORY: JString; cdecl;
    {class} function _GetEXTRA_SELF_DISPLAY_NAME: JString; cdecl;
    {class} function _GetEXTRA_SHOW_BIG_PICTURE_WHEN_COLLAPSED: JString; cdecl;
    {class} function _GetEXTRA_SHOW_CHRONOMETER: JString; cdecl;
    {class} function _GetEXTRA_SHOW_WHEN: JString; cdecl;
    {class} function _GetEXTRA_SMALL_ICON: JString; cdecl;
    {class} function _GetEXTRA_SUB_TEXT: JString; cdecl;
    {class} function _GetEXTRA_SUMMARY_TEXT: JString; cdecl;
    {class} function _GetEXTRA_TEMPLATE: JString; cdecl;
    {class} function _GetEXTRA_TEXT: JString; cdecl;
    {class} function _GetEXTRA_TEXT_LINES: JString; cdecl;
    {class} function _GetEXTRA_TITLE: JString; cdecl;
    {class} function _GetEXTRA_TITLE_BIG: JString; cdecl;
    {class} function _GetEXTRA_VERIFICATION_ICON: JString; cdecl;
    {class} function _GetEXTRA_VERIFICATION_ICON_COMPAT: JString; cdecl;
    {class} function _GetEXTRA_VERIFICATION_TEXT: JString; cdecl;
    {class} function _GetFLAG_AUTO_CANCEL: Integer; cdecl;
    {class} function _GetFLAG_BUBBLE: Integer; cdecl;
    {class} function _GetFLAG_FOREGROUND_SERVICE: Integer; cdecl;
    {class} function _GetFLAG_GROUP_SUMMARY: Integer; cdecl;
    {class} function _GetFLAG_HIGH_PRIORITY: Integer; cdecl;
    {class} function _GetFLAG_INSISTENT: Integer; cdecl;
    {class} function _GetFLAG_LOCAL_ONLY: Integer; cdecl;
    {class} function _GetFLAG_NO_CLEAR: Integer; cdecl;
    {class} function _GetFLAG_ONGOING_EVENT: Integer; cdecl;
    {class} function _GetFLAG_ONLY_ALERT_ONCE: Integer; cdecl;
    {class} function _GetFLAG_SHOW_LIGHTS: Integer; cdecl;
    {class} function _GetFOREGROUND_SERVICE_DEFAULT: Integer; cdecl;
    {class} function _GetFOREGROUND_SERVICE_DEFERRED: Integer; cdecl;
    {class} function _GetFOREGROUND_SERVICE_IMMEDIATE: Integer; cdecl;
    {class} function _GetGROUP_ALERT_ALL: Integer; cdecl;
    {class} function _GetGROUP_ALERT_CHILDREN: Integer; cdecl;
    {class} function _GetGROUP_ALERT_SUMMARY: Integer; cdecl;
    {class} function _GetGROUP_KEY_SILENT: JString; cdecl;
    {class} function _GetINTENT_CATEGORY_NOTIFICATION_PREFERENCES: JString; cdecl;
    {class} function _GetMAX_ACTION_BUTTONS: Integer; cdecl;
    {class} function _GetPRIORITY_DEFAULT: Integer; cdecl;
    {class} function _GetPRIORITY_HIGH: Integer; cdecl;
    {class} function _GetPRIORITY_LOW: Integer; cdecl;
    {class} function _GetPRIORITY_MAX: Integer; cdecl;
    {class} function _GetPRIORITY_MIN: Integer; cdecl;
    {class} function _GetSTREAM_DEFAULT: Integer; cdecl;
    {class} function _GetVISIBILITY_PRIVATE: Integer; cdecl;
    {class} function _GetVISIBILITY_PUBLIC: Integer; cdecl;
    {class} function _GetVISIBILITY_SECRET: Integer; cdecl;
    {class} function getAction(notification: JNotification; i: Integer): Japp_NotificationCompat_Action; cdecl;
    {class} function getActionCount(notification: JNotification): Integer; cdecl;
    {class} function getAllowSystemGeneratedContextualActions(notification: JNotification): Boolean; cdecl;
    {class} function getAutoCancel(notification: JNotification): Boolean; cdecl;
    {class} function getBadgeIconType(notification: JNotification): Integer; cdecl;
    {class} function getBubbleMetadata(notification: JNotification): JNotificationCompat_BubbleMetadata; cdecl;
    {class} function getCategory(notification: JNotification): JString; cdecl;
    {class} function getChannelId(notification: JNotification): JString; cdecl;
    {class} function getColor(notification: JNotification): Integer; cdecl;
    {class} function getContentInfo(notification: JNotification): JCharSequence; cdecl;
    {class} function getContentText(notification: JNotification): JCharSequence; cdecl;
    {class} function getContentTitle(notification: JNotification): JCharSequence; cdecl;
    {class} function getExtras(notification: JNotification): JBundle; cdecl;
    {class} function getGroup(notification: JNotification): JString; cdecl;
    {class} function getGroupAlertBehavior(notification: JNotification): Integer; cdecl;
    {class} function getInvisibleActions(notification: JNotification): JList; cdecl;
    {class} function getLocalOnly(notification: JNotification): Boolean; cdecl;
    {class} function getLocusId(notification: JNotification): JLocusIdCompat; cdecl;
    {class} function getOngoing(notification: JNotification): Boolean; cdecl;
    {class} function getOnlyAlertOnce(notification: JNotification): Boolean; cdecl;
    {class} function getPeople(notification: JNotification): JList; cdecl;
    {class} function getPublicVersion(notification: JNotification): JNotification; cdecl;
    {class} function getSettingsText(notification: JNotification): JCharSequence; cdecl;
    {class} function getShortcutId(notification: JNotification): JString; cdecl;
    {class} function getShowWhen(notification: JNotification): Boolean; cdecl;
    {class} function getSortKey(notification: JNotification): JString; cdecl;
    {class} function getSubText(notification: JNotification): JCharSequence; cdecl;
    {class} function getTimeoutAfter(notification: JNotification): Int64; cdecl;
    {class} function getUsesChronometer(notification: JNotification): Boolean; cdecl;
    {class} function getVisibility(notification: JNotification): Integer; cdecl;
    {class} function init: Japp_NotificationCompat; cdecl;
    {class} function isGroupSummary(notification: JNotification): Boolean; cdecl;
    {class} property BADGE_ICON_LARGE: Integer read _GetBADGE_ICON_LARGE;
    {class} property BADGE_ICON_NONE: Integer read _GetBADGE_ICON_NONE;
    {class} property BADGE_ICON_SMALL: Integer read _GetBADGE_ICON_SMALL;
    {class} property CATEGORY_ALARM: JString read _GetCATEGORY_ALARM;
    {class} property CATEGORY_CALL: JString read _GetCATEGORY_CALL;
    {class} property CATEGORY_EMAIL: JString read _GetCATEGORY_EMAIL;
    {class} property CATEGORY_ERROR: JString read _GetCATEGORY_ERROR;
    {class} property CATEGORY_EVENT: JString read _GetCATEGORY_EVENT;
    {class} property CATEGORY_LOCATION_SHARING: JString read _GetCATEGORY_LOCATION_SHARING;
    {class} property CATEGORY_MESSAGE: JString read _GetCATEGORY_MESSAGE;
    {class} property CATEGORY_MISSED_CALL: JString read _GetCATEGORY_MISSED_CALL;
    {class} property CATEGORY_NAVIGATION: JString read _GetCATEGORY_NAVIGATION;
    {class} property CATEGORY_PROGRESS: JString read _GetCATEGORY_PROGRESS;
    {class} property CATEGORY_PROMO: JString read _GetCATEGORY_PROMO;
    {class} property CATEGORY_RECOMMENDATION: JString read _GetCATEGORY_RECOMMENDATION;
    {class} property CATEGORY_REMINDER: JString read _GetCATEGORY_REMINDER;
    {class} property CATEGORY_SERVICE: JString read _GetCATEGORY_SERVICE;
    {class} property CATEGORY_SOCIAL: JString read _GetCATEGORY_SOCIAL;
    {class} property CATEGORY_STATUS: JString read _GetCATEGORY_STATUS;
    {class} property CATEGORY_STOPWATCH: JString read _GetCATEGORY_STOPWATCH;
    {class} property CATEGORY_SYSTEM: JString read _GetCATEGORY_SYSTEM;
    {class} property CATEGORY_TRANSPORT: JString read _GetCATEGORY_TRANSPORT;
    {class} property CATEGORY_WORKOUT: JString read _GetCATEGORY_WORKOUT;
    {class} property COLOR_DEFAULT: Integer read _GetCOLOR_DEFAULT;
    {class} property DEFAULT_ALL: Integer read _GetDEFAULT_ALL;
    {class} property DEFAULT_LIGHTS: Integer read _GetDEFAULT_LIGHTS;
    {class} property DEFAULT_SOUND: Integer read _GetDEFAULT_SOUND;
    {class} property DEFAULT_VIBRATE: Integer read _GetDEFAULT_VIBRATE;
    {class} property EXTRA_ANSWER_COLOR: JString read _GetEXTRA_ANSWER_COLOR;
    {class} property EXTRA_ANSWER_INTENT: JString read _GetEXTRA_ANSWER_INTENT;
    {class} property EXTRA_AUDIO_CONTENTS_URI: JString read _GetEXTRA_AUDIO_CONTENTS_URI;
    {class} property EXTRA_BACKGROUND_IMAGE_URI: JString read _GetEXTRA_BACKGROUND_IMAGE_URI;
    {class} property EXTRA_BIG_TEXT: JString read _GetEXTRA_BIG_TEXT;
    {class} property EXTRA_CALL_IS_VIDEO: JString read _GetEXTRA_CALL_IS_VIDEO;
    {class} property EXTRA_CALL_PERSON: JString read _GetEXTRA_CALL_PERSON;
    {class} property EXTRA_CALL_PERSON_COMPAT: JString read _GetEXTRA_CALL_PERSON_COMPAT;
    {class} property EXTRA_CALL_TYPE: JString read _GetEXTRA_CALL_TYPE;
    {class} property EXTRA_CHANNEL_GROUP_ID: JString read _GetEXTRA_CHANNEL_GROUP_ID;
    {class} property EXTRA_CHANNEL_ID: JString read _GetEXTRA_CHANNEL_ID;
    {class} property EXTRA_CHRONOMETER_COUNT_DOWN: JString read _GetEXTRA_CHRONOMETER_COUNT_DOWN;
    {class} property EXTRA_COLORIZED: JString read _GetEXTRA_COLORIZED;
    {class} property EXTRA_COMPACT_ACTIONS: JString read _GetEXTRA_COMPACT_ACTIONS;
    {class} property EXTRA_COMPAT_TEMPLATE: JString read _GetEXTRA_COMPAT_TEMPLATE;
    {class} property EXTRA_CONVERSATION_TITLE: JString read _GetEXTRA_CONVERSATION_TITLE;
    {class} property EXTRA_DECLINE_COLOR: JString read _GetEXTRA_DECLINE_COLOR;
    {class} property EXTRA_DECLINE_INTENT: JString read _GetEXTRA_DECLINE_INTENT;
    {class} property EXTRA_HANG_UP_INTENT: JString read _GetEXTRA_HANG_UP_INTENT;
    {class} property EXTRA_HIDDEN_CONVERSATION_TITLE: JString read _GetEXTRA_HIDDEN_CONVERSATION_TITLE;
    {class} property EXTRA_HISTORIC_MESSAGES: JString read _GetEXTRA_HISTORIC_MESSAGES;
    {class} property EXTRA_INFO_TEXT: JString read _GetEXTRA_INFO_TEXT;
    {class} property EXTRA_IS_GROUP_CONVERSATION: JString read _GetEXTRA_IS_GROUP_CONVERSATION;
    {class} property EXTRA_LARGE_ICON: JString read _GetEXTRA_LARGE_ICON;
    {class} property EXTRA_LARGE_ICON_BIG: JString read _GetEXTRA_LARGE_ICON_BIG;
    {class} property EXTRA_MEDIA_SESSION: JString read _GetEXTRA_MEDIA_SESSION;
    {class} property EXTRA_MESSAGES: JString read _GetEXTRA_MESSAGES;
    {class} property EXTRA_MESSAGING_STYLE_USER: JString read _GetEXTRA_MESSAGING_STYLE_USER;
    {class} property EXTRA_NOTIFICATION_ID: JString read _GetEXTRA_NOTIFICATION_ID;
    {class} property EXTRA_NOTIFICATION_TAG: JString read _GetEXTRA_NOTIFICATION_TAG;
    {class} property EXTRA_PEOPLE: JString read _GetEXTRA_PEOPLE;
    {class} property EXTRA_PEOPLE_LIST: JString read _GetEXTRA_PEOPLE_LIST;
    {class} property EXTRA_PICTURE: JString read _GetEXTRA_PICTURE;
    {class} property EXTRA_PICTURE_CONTENT_DESCRIPTION: JString read _GetEXTRA_PICTURE_CONTENT_DESCRIPTION;
    {class} property EXTRA_PICTURE_ICON: JString read _GetEXTRA_PICTURE_ICON;
    {class} property EXTRA_PROGRESS: JString read _GetEXTRA_PROGRESS;
    {class} property EXTRA_PROGRESS_INDETERMINATE: JString read _GetEXTRA_PROGRESS_INDETERMINATE;
    {class} property EXTRA_PROGRESS_MAX: JString read _GetEXTRA_PROGRESS_MAX;
    {class} property EXTRA_REMOTE_INPUT_HISTORY: JString read _GetEXTRA_REMOTE_INPUT_HISTORY;
    {class} property EXTRA_SELF_DISPLAY_NAME: JString read _GetEXTRA_SELF_DISPLAY_NAME;
    {class} property EXTRA_SHOW_BIG_PICTURE_WHEN_COLLAPSED: JString read _GetEXTRA_SHOW_BIG_PICTURE_WHEN_COLLAPSED;
    {class} property EXTRA_SHOW_CHRONOMETER: JString read _GetEXTRA_SHOW_CHRONOMETER;
    {class} property EXTRA_SHOW_WHEN: JString read _GetEXTRA_SHOW_WHEN;
    {class} property EXTRA_SMALL_ICON: JString read _GetEXTRA_SMALL_ICON;
    {class} property EXTRA_SUB_TEXT: JString read _GetEXTRA_SUB_TEXT;
    {class} property EXTRA_SUMMARY_TEXT: JString read _GetEXTRA_SUMMARY_TEXT;
    {class} property EXTRA_TEMPLATE: JString read _GetEXTRA_TEMPLATE;
    {class} property EXTRA_TEXT: JString read _GetEXTRA_TEXT;
    {class} property EXTRA_TEXT_LINES: JString read _GetEXTRA_TEXT_LINES;
    {class} property EXTRA_TITLE: JString read _GetEXTRA_TITLE;
    {class} property EXTRA_TITLE_BIG: JString read _GetEXTRA_TITLE_BIG;
    {class} property EXTRA_VERIFICATION_ICON: JString read _GetEXTRA_VERIFICATION_ICON;
    {class} property EXTRA_VERIFICATION_ICON_COMPAT: JString read _GetEXTRA_VERIFICATION_ICON_COMPAT;
    {class} property EXTRA_VERIFICATION_TEXT: JString read _GetEXTRA_VERIFICATION_TEXT;
    {class} property FLAG_AUTO_CANCEL: Integer read _GetFLAG_AUTO_CANCEL;
    {class} property FLAG_BUBBLE: Integer read _GetFLAG_BUBBLE;
    {class} property FLAG_FOREGROUND_SERVICE: Integer read _GetFLAG_FOREGROUND_SERVICE;
    {class} property FLAG_GROUP_SUMMARY: Integer read _GetFLAG_GROUP_SUMMARY;
    {class} property FLAG_HIGH_PRIORITY: Integer read _GetFLAG_HIGH_PRIORITY;
    {class} property FLAG_INSISTENT: Integer read _GetFLAG_INSISTENT;
    {class} property FLAG_LOCAL_ONLY: Integer read _GetFLAG_LOCAL_ONLY;
    {class} property FLAG_NO_CLEAR: Integer read _GetFLAG_NO_CLEAR;
    {class} property FLAG_ONGOING_EVENT: Integer read _GetFLAG_ONGOING_EVENT;
    {class} property FLAG_ONLY_ALERT_ONCE: Integer read _GetFLAG_ONLY_ALERT_ONCE;
    {class} property FLAG_SHOW_LIGHTS: Integer read _GetFLAG_SHOW_LIGHTS;
    {class} property FOREGROUND_SERVICE_DEFAULT: Integer read _GetFOREGROUND_SERVICE_DEFAULT;
    {class} property FOREGROUND_SERVICE_DEFERRED: Integer read _GetFOREGROUND_SERVICE_DEFERRED;
    {class} property FOREGROUND_SERVICE_IMMEDIATE: Integer read _GetFOREGROUND_SERVICE_IMMEDIATE;
    {class} property GROUP_ALERT_ALL: Integer read _GetGROUP_ALERT_ALL;
    {class} property GROUP_ALERT_CHILDREN: Integer read _GetGROUP_ALERT_CHILDREN;
    {class} property GROUP_ALERT_SUMMARY: Integer read _GetGROUP_ALERT_SUMMARY;
    {class} property GROUP_KEY_SILENT: JString read _GetGROUP_KEY_SILENT;
    {class} property INTENT_CATEGORY_NOTIFICATION_PREFERENCES: JString read _GetINTENT_CATEGORY_NOTIFICATION_PREFERENCES;
    {class} property MAX_ACTION_BUTTONS: Integer read _GetMAX_ACTION_BUTTONS;
    {class} property PRIORITY_DEFAULT: Integer read _GetPRIORITY_DEFAULT;
    {class} property PRIORITY_HIGH: Integer read _GetPRIORITY_HIGH;
    {class} property PRIORITY_LOW: Integer read _GetPRIORITY_LOW;
    {class} property PRIORITY_MAX: Integer read _GetPRIORITY_MAX;
    {class} property PRIORITY_MIN: Integer read _GetPRIORITY_MIN;
    {class} property STREAM_DEFAULT: Integer read _GetSTREAM_DEFAULT;
    {class} property VISIBILITY_PRIVATE: Integer read _GetVISIBILITY_PRIVATE;
    {class} property VISIBILITY_PUBLIC: Integer read _GetVISIBILITY_PUBLIC;
    {class} property VISIBILITY_SECRET: Integer read _GetVISIBILITY_SECRET;
  end;

  [JavaSignature('androidx/core/app/NotificationCompat')]
  Japp_NotificationCompat = interface(JObject)
    ['{0FCD2456-B25E-4183-9078-DE9398BD8A95}']
  end;
  TJapp_NotificationCompat = class(TJavaGenericImport<Japp_NotificationCompatClass, Japp_NotificationCompat>) end;

  // androidx.core.app.NotificationCompat$1
  Japp_NotificationCompat_ActionClass = interface(JObjectClass)
    ['{069FC3BA-E978-4659-A8D7-7EEC6D4F9652}']
    {class} function _GetSEMANTIC_ACTION_ARCHIVE: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_CALL: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_DELETE: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_MARK_AS_READ: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_MARK_AS_UNREAD: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_MUTE: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_NONE: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_REPLY: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_THUMBS_DOWN: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_THUMBS_UP: Integer; cdecl;
    {class} function _GetSEMANTIC_ACTION_UNMUTE: Integer; cdecl;
    {class} //function init(iconCompat: Jdrawable_IconCompat; charSequence: JCharSequence; pendingIntent: JPendingIntent): Japp_NotificationCompat_Action; cdecl; overload;
    {class} function init(i: Integer; charSequence: JCharSequence; pendingIntent: JPendingIntent): Japp_NotificationCompat_Action; cdecl; overload;
    {class} property SEMANTIC_ACTION_ARCHIVE: Integer read _GetSEMANTIC_ACTION_ARCHIVE;
    {class} property SEMANTIC_ACTION_CALL: Integer read _GetSEMANTIC_ACTION_CALL;
    {class} property SEMANTIC_ACTION_DELETE: Integer read _GetSEMANTIC_ACTION_DELETE;
    {class} property SEMANTIC_ACTION_MARK_AS_READ: Integer read _GetSEMANTIC_ACTION_MARK_AS_READ;
    {class} property SEMANTIC_ACTION_MARK_AS_UNREAD: Integer read _GetSEMANTIC_ACTION_MARK_AS_UNREAD;
    {class} property SEMANTIC_ACTION_MUTE: Integer read _GetSEMANTIC_ACTION_MUTE;
    {class} property SEMANTIC_ACTION_NONE: Integer read _GetSEMANTIC_ACTION_NONE;
    {class} property SEMANTIC_ACTION_REPLY: Integer read _GetSEMANTIC_ACTION_REPLY;
    {class} property SEMANTIC_ACTION_THUMBS_DOWN: Integer read _GetSEMANTIC_ACTION_THUMBS_DOWN;
    {class} property SEMANTIC_ACTION_THUMBS_UP: Integer read _GetSEMANTIC_ACTION_THUMBS_UP;
    {class} property SEMANTIC_ACTION_UNMUTE: Integer read _GetSEMANTIC_ACTION_UNMUTE;
  end;

  [JavaSignature('androidx/core/app/NotificationCompat$Action')]
  Japp_NotificationCompat_Action = interface(JObject)
    ['{57074D9D-6157-4142-A2C1-D61ED3F54404}']
    function _GetactionIntent: JPendingIntent; cdecl;
    procedure _SetactionIntent(Value: JPendingIntent); cdecl;
    function _Geticon: Integer; cdecl;
    procedure _Seticon(Value: Integer); cdecl;
    function _Gettitle: JCharSequence; cdecl;
    procedure _Settitle(Value: JCharSequence); cdecl;
    function getActionIntent: JPendingIntent; cdecl;
    function getAllowGeneratedReplies: Boolean; cdecl;
    function getDataOnlyRemoteInputs: TJavaObjectArray<Jcore_app_RemoteInput>; cdecl;
    function getExtras: JBundle; cdecl;
    function getIcon: Integer; cdecl;
    //function getIconCompat: Jdrawable_IconCompat; cdecl;
    function getRemoteInputs: TJavaObjectArray<Jcore_app_RemoteInput>; cdecl;
    function getSemanticAction: Integer; cdecl;
    function getShowsUserInterface: Boolean; cdecl;
    function getTitle: JCharSequence; cdecl;
    function isAuthenticationRequired: Boolean; cdecl;
    function isContextual: Boolean; cdecl;
    property actionIntent: JPendingIntent read _GetactionIntent write _SetactionIntent;
    property icon: Integer read _Geticon write _Seticon;
    property title: JCharSequence read _Gettitle write _Settitle;
  end;
  TJapp_NotificationCompat_Action = class(TJavaGenericImport<Japp_NotificationCompat_ActionClass, Japp_NotificationCompat_Action>) end;

  JNotificationCompat_BubbleMetadataClass = interface(JObjectClass)
    ['{33DACB07-1885-4B88-8DF1-C32E27638D14}']
    {class} function fromPlatform(bubbleMetadata: JNotification_BubbleMetadata): JNotificationCompat_BubbleMetadata; cdecl;
    {class} function toPlatform(bubbleMetadata: JNotificationCompat_BubbleMetadata): JNotification_BubbleMetadata; cdecl;
  end;

  [JavaSignature('androidx/core/app/NotificationCompat$BubbleMetadata')]
  JNotificationCompat_BubbleMetadata = interface(JObject)
    ['{D9B394E6-0C5F-4CEE-91DA-64ADF5B4C9AF}']
    function getAutoExpandBubble: Boolean; cdecl;
    function getDeleteIntent: JPendingIntent; cdecl;
    function getDesiredHeight: Integer; cdecl;
    function getDesiredHeightResId: Integer; cdecl;
    //function getIcon: Jdrawable_IconCompat; cdecl;
    function getIntent: JPendingIntent; cdecl;
    function getShortcutId: JString; cdecl;
    function isNotificationSuppressed: Boolean; cdecl;
    procedure setFlags(i: Integer); cdecl;
  end;
  TJNotificationCompat_BubbleMetadata = class(TJavaGenericImport<JNotificationCompat_BubbleMetadataClass, JNotificationCompat_BubbleMetadata>) end;

  Japp_NotificationCompat_BuilderClass = interface(JObjectClass)
    ['{BF06ED8F-16CF-4D2D-A029-4A43FD71907F}']
    {class} function init(context: JContext): Japp_NotificationCompat_Builder; cdecl; overload;
    {class} function init(context: JContext; notification: JNotification): Japp_NotificationCompat_Builder; cdecl; overload;
    {class} function init(context: JContext; string_: JString): Japp_NotificationCompat_Builder; cdecl; overload;
  end;

  [JavaSignature('androidx/core/app/NotificationCompat$Builder')]
  Japp_NotificationCompat_Builder = interface(JObject)
    ['{86BE52A4-03F6-4537-98A9-F94A2266274F}']
    function addAction(action: Japp_NotificationCompat_Action): Japp_NotificationCompat_Builder; cdecl; overload;
    function addAction(i: Integer; charSequence: JCharSequence; pendingIntent: JPendingIntent): Japp_NotificationCompat_Builder; cdecl; overload;
    function addExtras(bundle: JBundle): Japp_NotificationCompat_Builder; cdecl;
    function addInvisibleAction(action: Japp_NotificationCompat_Action): Japp_NotificationCompat_Builder; cdecl; overload;
    function addInvisibleAction(i: Integer; charSequence: JCharSequence; pendingIntent: JPendingIntent): Japp_NotificationCompat_Builder; cdecl; overload;
    //function addPerson(person: Japp_Person): Japp_NotificationCompat_Builder; cdecl; overload;
    function addPerson(string_: JString): Japp_NotificationCompat_Builder; cdecl; overload;
    function build: JNotification; cdecl;
    function clearActions: Japp_NotificationCompat_Builder; cdecl;
    function clearInvisibleActions: Japp_NotificationCompat_Builder; cdecl;
    function clearPeople: Japp_NotificationCompat_Builder; cdecl;
    function createBigContentView: JRemoteViews; cdecl;
    function createContentView: JRemoteViews; cdecl;
    function createHeadsUpContentView: JRemoteViews; cdecl;
    function extend(extender: Japp_NotificationCompat_Extender): Japp_NotificationCompat_Builder; cdecl;
    function getBigContentView: JRemoteViews; cdecl;
    function getBubbleMetadata: JNotificationCompat_BubbleMetadata; cdecl;
    function getColor: Integer; cdecl;
    function getContentView: JRemoteViews; cdecl;
    function getExtras: JBundle; cdecl;
    function getForegroundServiceBehavior: Integer; cdecl;
    function getHeadsUpContentView: JRemoteViews; cdecl;
    function getNotification: JNotification; cdecl;
    function getPriority: Integer; cdecl;
    function getWhenIfShowing: Int64; cdecl;
    function setAllowSystemGeneratedContextualActions(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setAutoCancel(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setBadgeIconType(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setBubbleMetadata(bubbleMetadata: JNotificationCompat_BubbleMetadata): Japp_NotificationCompat_Builder; cdecl;
    function setCategory(string_: JString): Japp_NotificationCompat_Builder; cdecl;
    function setChannelId(string_: JString): Japp_NotificationCompat_Builder; cdecl;
    function setChronometerCountDown(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setColor(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setColorized(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setContent(remoteViews: JRemoteViews): Japp_NotificationCompat_Builder; cdecl;
    function setContentInfo(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl;
    function setContentIntent(pendingIntent: JPendingIntent): Japp_NotificationCompat_Builder; cdecl;
    function setContentText(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl;
    function setContentTitle(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl;
    function setCustomBigContentView(remoteViews: JRemoteViews): Japp_NotificationCompat_Builder; cdecl;
    function setCustomContentView(remoteViews: JRemoteViews): Japp_NotificationCompat_Builder; cdecl;
    function setCustomHeadsUpContentView(remoteViews: JRemoteViews): Japp_NotificationCompat_Builder; cdecl;
    function setDefaults(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setDeleteIntent(pendingIntent: JPendingIntent): Japp_NotificationCompat_Builder; cdecl;
    function setExtras(bundle: JBundle): Japp_NotificationCompat_Builder; cdecl;
    function setForegroundServiceBehavior(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setFullScreenIntent(pendingIntent: JPendingIntent; b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setGroup(string_: JString): Japp_NotificationCompat_Builder; cdecl;
    function setGroupAlertBehavior(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setGroupSummary(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setLargeIcon(bitmap: JBitmap): Japp_NotificationCompat_Builder; cdecl;
    function setLights(i: Integer; i1: Integer; i2: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setLocalOnly(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setLocusId(locusIdCompat: JLocusIdCompat): Japp_NotificationCompat_Builder; cdecl;
    function setNotificationSilent: Japp_NotificationCompat_Builder; cdecl;
    function setNumber(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setOngoing(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setOnlyAlertOnce(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setPriority(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setProgress(i: Integer; i1: Integer; b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setPublicVersion(notification: JNotification): Japp_NotificationCompat_Builder; cdecl;
    function setRemoteInputHistory(charSequence: TJavaObjectArray<JCharSequence>): Japp_NotificationCompat_Builder; cdecl;
    function setSettingsText(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl;
    function setShortcutId(string_: JString): Japp_NotificationCompat_Builder; cdecl;
    function setShortcutInfo(shortcutInfoCompat: Jpm_ShortcutInfoCompat): Japp_NotificationCompat_Builder; cdecl;
    function setShowWhen(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setSilent(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setSmallIcon(i: Integer): Japp_NotificationCompat_Builder; cdecl; overload;
    //function setSmallIcon(iconCompat: Jdrawable_IconCompat): Japp_NotificationCompat_Builder; cdecl; overload;
    function setSmallIcon(i: Integer; i1: Integer): Japp_NotificationCompat_Builder; cdecl; overload;
    function setSortKey(string_: JString): Japp_NotificationCompat_Builder; cdecl;
    function setSound(uri: Jnet_Uri): Japp_NotificationCompat_Builder; cdecl; overload;
    function setSound(uri: Jnet_Uri; i: Integer): Japp_NotificationCompat_Builder; cdecl; overload;
    function setStyle(style: Japp_NotificationCompat_Style): Japp_NotificationCompat_Builder; cdecl;
    function setSubText(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl;
    function setTicker(charSequence: JCharSequence): Japp_NotificationCompat_Builder; cdecl; overload;
    function setTicker(charSequence: JCharSequence; remoteViews: JRemoteViews): Japp_NotificationCompat_Builder; cdecl; overload;
    function setTimeoutAfter(l: Int64): Japp_NotificationCompat_Builder; cdecl;
    function setUsesChronometer(b: Boolean): Japp_NotificationCompat_Builder; cdecl;
    function setVibrate(l: TJavaArray<Int64>): Japp_NotificationCompat_Builder; cdecl;
    function setVisibility(i: Integer): Japp_NotificationCompat_Builder; cdecl;
    function setWhen(l: Int64): Japp_NotificationCompat_Builder; cdecl;
  end;
  TJapp_NotificationCompat_Builder = class(TJavaGenericImport<Japp_NotificationCompat_BuilderClass, Japp_NotificationCompat_Builder>) end;

  Japp_NotificationCompat_ExtenderClass = interface(IJavaClass)
    ['{E526C472-F346-4A76-A119-1213F3C14C3E}']
  end;

  [JavaSignature('androidx/core/app/NotificationCompat$Extender')]
  Japp_NotificationCompat_Extender = interface(IJavaInstance)
    ['{49AAF7F2-478D-49AE-B03C-B03C07E46B1F}']
    function extend(builder: Japp_NotificationCompat_Builder): Japp_NotificationCompat_Builder; cdecl;
  end;
  TJapp_NotificationCompat_Extender = class(TJavaGenericImport<Japp_NotificationCompat_ExtenderClass, Japp_NotificationCompat_Extender>) end;

  Japp_NotificationCompat_StyleClass = interface(JObjectClass)
    ['{57D9C489-B5D5-466A-99BE-38DF51239448}']
    {class} function extractStyleFromNotification(notification: JNotification): Japp_NotificationCompat_Style; cdecl;
    {class} function init: Japp_NotificationCompat_Style; cdecl;
  end;

  [JavaSignature('androidx/core/app/NotificationCompat$Style')]
  Japp_NotificationCompat_Style = interface(JObject)
    ['{89931428-DFD9-4BD3-8C5A-80B6E446ECD6}']
    procedure addCompatExtras(bundle: JBundle); cdecl;
    //procedure apply(notificationBuilderWithBuilderAccessor: JNotificationBuilderWithBuilderAccessor); cdecl;
    function applyStandardTemplate(b: Boolean; i: Integer; b1: Boolean): JRemoteViews; cdecl;
    function build: JNotification; cdecl;
    procedure buildIntoRemoteViews(remoteViews: JRemoteViews; remoteViews1: JRemoteViews); cdecl;
    function createColoredBitmap(i: Integer; i1: Integer): JBitmap; cdecl; overload;
    function displayCustomViewInline: Boolean; cdecl;
    //function makeBigContentView(notificationBuilderWithBuilderAccessor: JNotificationBuilderWithBuilderAccessor): JRemoteViews; cdecl;
    //function makeContentView(notificationBuilderWithBuilderAccessor: JNotificationBuilderWithBuilderAccessor): JRemoteViews; cdecl;
    //function makeHeadsUpContentView(notificationBuilderWithBuilderAccessor: JNotificationBuilderWithBuilderAccessor): JRemoteViews; cdecl;
    procedure setBuilder(builder: Japp_NotificationCompat_Builder); cdecl;
  end;
  TJapp_NotificationCompat_Style = class(TJavaGenericImport<Japp_NotificationCompat_StyleClass, Japp_NotificationCompat_Style>) end;

  JPendingIntentCompatClass = interface(JObjectClass)
    ['{C313AFE9-92D1-456B-BAED-DE0004B8FB8F}']
    {class} function getActivities(context: JContext; i: Integer; intent: TJavaObjectArray<JIntent>; i1: Integer; b: Boolean): JPendingIntent; cdecl; overload;
    {class} function getActivities(context: JContext; i: Integer; intent: TJavaObjectArray<JIntent>; i1: Integer; bundle: JBundle; b: Boolean): JPendingIntent; cdecl; overload;
    {class} function getActivity(context: JContext; i: Integer; intent: JIntent; i1: Integer; b: Boolean): JPendingIntent; cdecl; overload;
    {class} function getActivity(context: JContext; i: Integer; intent: JIntent; i1: Integer; bundle: JBundle; b: Boolean): JPendingIntent; cdecl; overload;
    {class} function getBroadcast(context: JContext; i: Integer; intent: JIntent; i1: Integer; b: Boolean): JPendingIntent; cdecl;
    {class} function getForegroundService(context: JContext; i: Integer; intent: JIntent; i1: Integer; b: Boolean): JPendingIntent; cdecl;
    {class} function getService(context: JContext; i: Integer; intent: JIntent; i1: Integer; b: Boolean): JPendingIntent; cdecl;
  end;

  [JavaSignature('androidx/core/app/PendingIntentCompat')]
  JPendingIntentCompat = interface(JObject)
    ['{3D27E37E-4F25-48DF-8ED2-AB3DD4D9AEEC}']
  end;
  TJPendingIntentCompat = class(TJavaGenericImport<JPendingIntentCompatClass, JPendingIntentCompat>) end;

  // androidx.core.app.Person
  // androidx.core.app.Person$Builder
  Jcore_app_RemoteInputClass = interface(JObjectClass)
    ['{4AFD7682-C801-4A28-A256-4A1990F73FFE}']
    {class} function _GetEDIT_CHOICES_BEFORE_SENDING_AUTO: Integer; cdecl;
    {class} function _GetEDIT_CHOICES_BEFORE_SENDING_DISABLED: Integer; cdecl;
    {class} function _GetEDIT_CHOICES_BEFORE_SENDING_ENABLED: Integer; cdecl;
    {class} function _GetEXTRA_RESULTS_DATA: JString; cdecl;
    {class} function _GetRESULTS_CLIP_LABEL: JString; cdecl;
    {class} function _GetSOURCE_CHOICE: Integer; cdecl;
    {class} function _GetSOURCE_FREE_FORM_INPUT: Integer; cdecl;
    {class} procedure addDataResultToIntent(remoteInput: Jcore_app_RemoteInput; intent: JIntent; map: JMap); cdecl;
    {class} procedure addResultsToIntent(remoteInput: TJavaObjectArray<Jcore_app_RemoteInput>; intent: JIntent; bundle: JBundle); cdecl;
    {class} function getDataResultsFromIntent(intent: JIntent; string_: JString): JMap; cdecl;
    {class} function getResultsFromIntent(intent: JIntent): JBundle; cdecl;
    {class} function getResultsSource(intent: JIntent): Integer; cdecl;
    {class} procedure setResultsSource(intent: JIntent; i: Integer); cdecl;
    {class} property EDIT_CHOICES_BEFORE_SENDING_AUTO: Integer read _GetEDIT_CHOICES_BEFORE_SENDING_AUTO;
    {class} property EDIT_CHOICES_BEFORE_SENDING_DISABLED: Integer read _GetEDIT_CHOICES_BEFORE_SENDING_DISABLED;
    {class} property EDIT_CHOICES_BEFORE_SENDING_ENABLED: Integer read _GetEDIT_CHOICES_BEFORE_SENDING_ENABLED;
    {class} property EXTRA_RESULTS_DATA: JString read _GetEXTRA_RESULTS_DATA;
    {class} property RESULTS_CLIP_LABEL: JString read _GetRESULTS_CLIP_LABEL;
    {class} property SOURCE_CHOICE: Integer read _GetSOURCE_CHOICE;
    {class} property SOURCE_FREE_FORM_INPUT: Integer read _GetSOURCE_FREE_FORM_INPUT;
  end;

  [JavaSignature('androidx/core/app/RemoteInput')]
  Jcore_app_RemoteInput = interface(JObject)
    ['{734D869C-48D1-4828-81DF-2EDBBB88F105}']
    function getAllowFreeFormInput: Boolean; cdecl;
    function getAllowedDataTypes: JSet; cdecl;
    function getChoices: TJavaObjectArray<JCharSequence>; cdecl;
    function getEditChoicesBeforeSending: Integer; cdecl;
    function getExtras: JBundle; cdecl;
    function getLabel: JCharSequence; cdecl;
    function getResultKey: JString; cdecl;
    function isDataOnly: Boolean; cdecl;
  end;
  TJcore_app_RemoteInput = class(TJavaGenericImport<Jcore_app_RemoteInputClass, Jcore_app_RemoteInput>) end;

  Jcore_app_SharedElementCallbackClass = interface(JObjectClass)
    ['{7794CECE-A5AC-41EF-B172-E61FC0D60838}']
    {class} function init: Jcore_app_SharedElementCallback; cdecl;
  end;

  [JavaSignature('androidx/core/app/SharedElementCallback')]
  Jcore_app_SharedElementCallback = interface(JObject)
    ['{0E64CF0D-BC2D-4F1B-93AF-5ED415B06D8A}']
    function onCaptureSharedElementSnapshot(view: JView; matrix: JMatrix; rectF: JRectF): JParcelable; cdecl;
    function onCreateSnapshotView(context: JContext; parcelable: JParcelable): JView; cdecl;
    procedure onMapSharedElements(list: JList; map: JMap); cdecl;
    procedure onRejectSharedElements(list: JList); cdecl;
    procedure onSharedElementEnd(list: JList; list1: JList; list2: JList); cdecl;
    procedure onSharedElementStart(list: JList; list1: JList; list2: JList); cdecl;
    procedure onSharedElementsArrived(list: JList; list1: JList; onSharedElementsReadyListener: Jcore_app_SharedElementCallback_OnSharedElementsReadyListener); cdecl;
  end;
  TJcore_app_SharedElementCallback = class(TJavaGenericImport<Jcore_app_SharedElementCallbackClass, Jcore_app_SharedElementCallback>) end;

  Jcore_app_SharedElementCallback_OnSharedElementsReadyListenerClass = interface(IJavaClass)
    ['{35881F22-9638-4DDD-A2EB-38CFD2E0F2DA}']
  end;

  [JavaSignature('androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener')]
  Jcore_app_SharedElementCallback_OnSharedElementsReadyListener = interface(IJavaInstance)
    ['{D6FD22D1-B7F9-460B-88CE-F9A6BAAACD15}']
    procedure onSharedElementsReady; cdecl;
  end;
  TJcore_app_SharedElementCallback_OnSharedElementsReadyListener = class(TJavaGenericImport<Jcore_app_SharedElementCallback_OnSharedElementsReadyListenerClass, Jcore_app_SharedElementCallback_OnSharedElementsReadyListener>) end;

  Jcontent_FileProviderClass = interface(JContentProviderClass)
    ['{297E4AF8-A9EE-48DF-8175-CA2C40670648}']
    {class} function getUriForFile(context: JContext; string_: JString; file_: JFile): Jnet_Uri; cdecl; overload;
    {class} function getUriForFile(context: JContext; string_: JString; file_: JFile; string_1: JString): Jnet_Uri; cdecl; overload;
    {class} function init: Jcontent_FileProvider; cdecl;
  end;

  [JavaSignature('androidx/core/content/FileProvider')]
  Jcontent_FileProvider = interface(JContentProvider)
    ['{47C95C7A-4D3F-4528-9676-8B8D5C97675B}']
    procedure attachInfo(context: JContext; providerInfo: JProviderInfo); cdecl;
    function delete(uri: Jnet_Uri; string_: JString; string_1: TJavaObjectArray<JString>): Integer; cdecl;
    function getType(uri: Jnet_Uri): JString; cdecl;
    function insert(uri: Jnet_Uri; contentValues: JContentValues): Jnet_Uri; cdecl;
    function onCreate: Boolean; cdecl;
    function openFile(uri: Jnet_Uri; string_: JString): JParcelFileDescriptor; cdecl;
    function query(uri: Jnet_Uri; string_: TJavaObjectArray<JString>; string_1: JString; string_2: TJavaObjectArray<JString>; string_3: JString): JCursor; cdecl;
    function update(uri: Jnet_Uri; contentValues: JContentValues; string_: JString; string_1: TJavaObjectArray<JString>): Integer; cdecl;
  end;
  TJcontent_FileProvider = class(TJavaGenericImport<Jcontent_FileProviderClass, Jcontent_FileProvider>) end;

  JLocusIdCompatClass = interface(JObjectClass)
    ['{1DF4C941-18DE-4AE2-ACB5-A9347F426677}']
    {class} function init(string_: JString): JLocusIdCompat; cdecl;
    {class} function toLocusIdCompat(locusId: JLocusId): JLocusIdCompat; cdecl;
  end;

  [JavaSignature('androidx/core/content/LocusIdCompat')]
  JLocusIdCompat = interface(JObject)
    ['{4728A252-E681-4F0B-96AF-960EDC50654F}']
    function equals(object_: JObject): Boolean; cdecl;
    function getId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toLocusId: JLocusId; cdecl;
    function toString: JString; cdecl;
  end;
  TJLocusIdCompat = class(TJavaGenericImport<JLocusIdCompatClass, JLocusIdCompat>) end;

  Jcontent_PermissionCheckerClass = interface(JObjectClass)
    ['{4627A63C-3386-4ABA-83DD-08BAA19760C2}']
    {class} function _GetPERMISSION_DENIED: Integer; cdecl;
    {class} function _GetPERMISSION_DENIED_APP_OP: Integer; cdecl;
    {class} function _GetPERMISSION_GRANTED: Integer; cdecl;
    {class} function checkCallingOrSelfPermission(context: JContext; string_: JString): Integer; cdecl;
    {class} function checkCallingPermission(context: JContext; string_: JString; string_1: JString): Integer; cdecl;
    {class} function checkPermission(context: JContext; string_: JString; i: Integer; i1: Integer; string_1: JString): Integer; cdecl;
    {class} function checkSelfPermission(context: JContext; string_: JString): Integer; cdecl;
    {class} property PERMISSION_DENIED: Integer read _GetPERMISSION_DENIED;
    {class} property PERMISSION_DENIED_APP_OP: Integer read _GetPERMISSION_DENIED_APP_OP;
    {class} property PERMISSION_GRANTED: Integer read _GetPERMISSION_GRANTED;
  end;

  [JavaSignature('androidx/core/content/PermissionChecker')]
  Jcontent_PermissionChecker = interface(JObject)
    ['{8133EC4F-4619-40BA-BFC0-5863ADA9F099}']
  end;
  TJcontent_PermissionChecker = class(TJavaGenericImport<Jcontent_PermissionCheckerClass, Jcontent_PermissionChecker>) end;

  Jpm_ShortcutInfoCompatClass = interface(JObjectClass)
    ['{38D9871E-9287-4205-9473-D2A84A26C75D}']
    {class} function _GetSURFACE_LAUNCHER: Integer; cdecl;
    {class} property SURFACE_LAUNCHER: Integer read _GetSURFACE_LAUNCHER;
  end;

  [JavaSignature('androidx/core/content/pm/ShortcutInfoCompat')]
  Jpm_ShortcutInfoCompat = interface(JObject)
    ['{0F462C6A-3EEA-4561-AB06-25BB6EB30106}']
    function getActivity: JComponentName; cdecl;
    function getCategories: JSet; cdecl;
    function getDisabledMessage: JCharSequence; cdecl;
    function getDisabledReason: Integer; cdecl;
    function getExcludedFromSurfaces: Integer; cdecl;
    function getExtras: JPersistableBundle; cdecl;
    //function getIcon: Jdrawable_IconCompat; cdecl;
    function getId: JString; cdecl;
    function getIntent: JIntent; cdecl;
    function getIntents: TJavaObjectArray<JIntent>; cdecl;
    function getLastChangedTimestamp: Int64; cdecl;
    function getLocusId: JLocusIdCompat; cdecl; overload;
    function getLongLabel: JCharSequence; cdecl;
    function getPackage: JString; cdecl;
    function getRank: Integer; cdecl;
    function getShortLabel: JCharSequence; cdecl;
    function getTransientExtras: JBundle; cdecl;
    function getUserHandle: JUserHandle; cdecl;
    function hasKeyFieldsOnly: Boolean; cdecl;
    function isCached: Boolean; cdecl;
    function isDeclaredInManifest: Boolean; cdecl;
    function isDynamic: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isExcludedFromSurfaces(i: Integer): Boolean; cdecl;
    function isImmutable: Boolean; cdecl;
    function isPinned: Boolean; cdecl;
    function toShortcutInfo: JShortcutInfo; cdecl;
  end;
  TJpm_ShortcutInfoCompat = class(TJavaGenericImport<Jpm_ShortcutInfoCompatClass, Jpm_ShortcutInfoCompat>) end;

  JInsetsClass = interface(JObjectClass)
    ['{C1F0C010-7755-4F24-AA47-043A550977D3}']
    {class} function _GetNONE: JInsets; cdecl;
    {class} function add(insets: JInsets; insets1: JInsets): JInsets; cdecl;
    {class} function max(insets: JInsets; insets1: JInsets): JInsets; cdecl;
    {class} function min(insets: JInsets; insets1: JInsets): JInsets; cdecl;
    {class} function &of(rect: JRect): JInsets; cdecl; overload;
    {class} function &of(i: Integer; i1: Integer; i2: Integer; i3: Integer): JInsets; cdecl; overload;
    {class} function subtract(insets: JInsets; insets1: JInsets): JInsets; cdecl;
    {class} function toCompatInsets(insets: Jgraphics_Insets): JInsets; cdecl;
    {class} function wrap(insets: Jgraphics_Insets): JInsets; cdecl;
    {class} property NONE: JInsets read _GetNONE;
  end;

  [JavaSignature('androidx/core/graphics/Insets')]
  JInsets = interface(JObject)
    ['{8250F3D7-0B3A-4447-9B63-893A458D09F0}']
    function _Getbottom: Integer; cdecl;
    function _Getleft: Integer; cdecl;
    function _Getright: Integer; cdecl;
    function _Gettop: Integer; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toPlatformInsets: Jgraphics_Insets; cdecl;
    function toString: JString; cdecl;
    property bottom: Integer read _Getbottom;
    property left: Integer read _Getleft;
    property right: Integer read _Getright;
    property top: Integer read _Gettop;
  end;
  TJInsets = class(TJavaGenericImport<JInsetsClass, JInsets>) end;

  // androidx.core.graphics.drawable.IconCompat
  // androidx.core.hardware.fingerprint.FingerprintManagerCompat
  // androidx.core.hardware.fingerprint.FingerprintManagerCompat$AuthenticationCallback
  // androidx.core.hardware.fingerprint.FingerprintManagerCompat$AuthenticationResult
  // androidx.core.hardware.fingerprint.FingerprintManagerCompat$CryptoObject
  Jcore_os_CancellationSignalClass = interface(JObjectClass)
    ['{C40B3770-1E90-4BE1-8DC6-C00A0B1431E9}']
    {class} function init: Jcore_os_CancellationSignal; cdecl;
  end;

  [JavaSignature('androidx/core/os/CancellationSignal')]
  Jcore_os_CancellationSignal = interface(JObject)
    ['{DF281741-C51E-4755-8CCD-C64F12A1E9D4}']
    procedure cancel; cdecl;
    function getCancellationSignalObject: JObject; cdecl;
    function isCanceled: Boolean; cdecl;
    procedure setOnCancelListener(onCancelListener: Jcore_os_CancellationSignal_OnCancelListener); cdecl;
    procedure throwIfCanceled; cdecl;
  end;
  TJcore_os_CancellationSignal = class(TJavaGenericImport<Jcore_os_CancellationSignalClass, Jcore_os_CancellationSignal>) end;

  Jcore_os_CancellationSignal_OnCancelListenerClass = interface(IJavaClass)
    ['{F91873E3-C4A3-45D1-96A8-EC6F4D3E01FA}']
  end;

  [JavaSignature('androidx/core/os/CancellationSignal$OnCancelListener')]
  Jcore_os_CancellationSignal_OnCancelListener = interface(IJavaInstance)
    ['{23EA9BC7-ADA6-457A-9649-88BFB15C417A}']
    procedure onCancel; cdecl;
  end;
  TJcore_os_CancellationSignal_OnCancelListener = class(TJavaGenericImport<Jcore_os_CancellationSignal_OnCancelListenerClass, Jcore_os_CancellationSignal_OnCancelListener>) end;

  Jutil_ConsumerClass = interface(IJavaClass)
    ['{5FDC43C6-A004-464C-B760-B4AC37A0D96B}']
  end;

  [JavaSignature('androidx/core/util/Consumer')]
  Jutil_Consumer = interface(IJavaInstance)
    ['{695D17EB-2C48-4423-963B-0E69C0D60D2D}']
    procedure accept(object_: JObject); cdecl;
  end;
  TJutil_Consumer = class(TJavaGenericImport<Jutil_ConsumerClass, Jutil_Consumer>) end;

  Jcore_util_PairClass = interface(JObjectClass)
    ['{C9624E41-0127-4F2C-845E-10795E958C61}']
    {class} function create(object_: JObject; object_1: JObject): Jcore_util_Pair; cdecl;
    {class} function init(object_: JObject; object_1: JObject): Jcore_util_Pair; cdecl;
  end;

  [JavaSignature('androidx/core/util/Pair')]
  Jcore_util_Pair = interface(JObject)
    ['{6FF20905-1D6B-48BA-B50F-56BF948475FE}']
    function _Getfirst: JObject; cdecl;
    function _Getsecond: JObject; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    property first: JObject read _Getfirst;
    property second: JObject read _Getsecond;
  end;
  TJcore_util_Pair = class(TJavaGenericImport<Jcore_util_PairClass, Jcore_util_Pair>) end;

  JDisplayCutoutCompatClass = interface(JObjectClass)
    ['{1B3AABD7-5C71-4BF5-894F-7F9FB9293788}']
    {class} function init(rect: JRect; list: JList): JDisplayCutoutCompat; cdecl; overload;
    {class} function init(insets: JInsets; rect: JRect; rect1: JRect; rect2: JRect; rect3: JRect; insets1: JInsets): JDisplayCutoutCompat; cdecl; overload;
  end;

  [JavaSignature('androidx/core/view/DisplayCutoutCompat')]
  JDisplayCutoutCompat = interface(JObject)
    ['{6CDEB4D8-7946-4880-B597-706CFE595589}']
    function equals(object_: JObject): Boolean; cdecl;
    function getBoundingRects: JList; cdecl;
    function getSafeInsetBottom: Integer; cdecl;
    function getSafeInsetLeft: Integer; cdecl;
    function getSafeInsetRight: Integer; cdecl;
    function getSafeInsetTop: Integer; cdecl;
    function getWaterfallInsets: JInsets; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJDisplayCutoutCompat = class(TJavaGenericImport<JDisplayCutoutCompatClass, JDisplayCutoutCompat>) end;

  JDragAndDropPermissionsCompatClass = interface(JObjectClass)
    ['{82ECA0C7-2A5E-466A-BBDA-6646BDDC291C}']
    {class} function request(activity: JActivity; dragEvent: JDragEvent): JDragAndDropPermissionsCompat; cdecl;
  end;

  [JavaSignature('androidx/core/view/DragAndDropPermissionsCompat')]
  JDragAndDropPermissionsCompat = interface(JObject)
    ['{117E0241-61B9-437D-BDB5-0803B8846E41}']
    procedure release; cdecl;
  end;
  TJDragAndDropPermissionsCompat = class(TJavaGenericImport<JDragAndDropPermissionsCompatClass, JDragAndDropPermissionsCompat>) end;

  JMenuProviderClass = interface(IJavaClass)
    ['{863553EE-8E9C-42D9-A1FD-CFE95715905C}']
  end;

  [JavaSignature('androidx/core/view/MenuProvider')]
  JMenuProvider = interface(IJavaInstance)
    ['{AA6A13FF-2237-4B9E-B9E9-9BE295C07EE1}']
    procedure onCreateMenu(menu: JMenu; menuInflater: JMenuInflater); cdecl;
    procedure onMenuClosed(menu: JMenu); cdecl;
    function onMenuItemSelected(menuItem: JMenuItem): Boolean; cdecl;
    procedure onPrepareMenu(menu: JMenu); cdecl;
  end;
  TJMenuProvider = class(TJavaGenericImport<JMenuProviderClass, JMenuProvider>) end;

  Jview_WindowInsetsCompatClass = interface(JObjectClass)
    ['{F929EA9D-1C51-4C41-A194-B77A62DCC577}']
    {class} function _GetCONSUMED: Jview_WindowInsetsCompat; cdecl;
    {class} function init(windowInsetsCompat: Jview_WindowInsetsCompat): Jview_WindowInsetsCompat; cdecl;
    {class} function toWindowInsetsCompat(windowInsets: JWindowInsets): Jview_WindowInsetsCompat; cdecl; overload;
    {class} function toWindowInsetsCompat(windowInsets: JWindowInsets; view: JView): Jview_WindowInsetsCompat; cdecl; overload;
    {class} property CONSUMED: Jview_WindowInsetsCompat read _GetCONSUMED;
  end;

  [JavaSignature('androidx/core/view/WindowInsetsCompat')]
  Jview_WindowInsetsCompat = interface(JObject)
    ['{B2AC8251-3C10-445B-B92C-82490890B72C}']
    function consumeDisplayCutout: Jview_WindowInsetsCompat; cdecl;
    function consumeStableInsets: Jview_WindowInsetsCompat; cdecl;
    function consumeSystemWindowInsets: Jview_WindowInsetsCompat; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function getDisplayCutout: JDisplayCutoutCompat; cdecl;
    function getInsets(i: Integer): JInsets; cdecl;
    function getInsetsIgnoringVisibility(i: Integer): JInsets; cdecl;
    function getMandatorySystemGestureInsets: JInsets; cdecl;
    function getStableInsetBottom: Integer; cdecl;
    function getStableInsetLeft: Integer; cdecl;
    function getStableInsetRight: Integer; cdecl;
    function getStableInsetTop: Integer; cdecl;
    function getStableInsets: JInsets; cdecl;
    function getSystemGestureInsets: JInsets; cdecl;
    function getSystemWindowInsetBottom: Integer; cdecl;
    function getSystemWindowInsetLeft: Integer; cdecl;
    function getSystemWindowInsetRight: Integer; cdecl;
    function getSystemWindowInsetTop: Integer; cdecl;
    function getSystemWindowInsets: JInsets; cdecl;
    function getTappableElementInsets: JInsets; cdecl;
    function hasInsets: Boolean; cdecl;
    function hasStableInsets: Boolean; cdecl;
    function hasSystemWindowInsets: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function inset(insets: JInsets): Jview_WindowInsetsCompat; cdecl; overload;
    function inset(i: Integer; i1: Integer; i2: Integer; i3: Integer): Jview_WindowInsetsCompat; cdecl; overload;
    function isConsumed: Boolean; cdecl;
    function isRound: Boolean; cdecl;
    function isVisible(i: Integer): Boolean; cdecl;
    function replaceSystemWindowInsets(rect: JRect): Jview_WindowInsetsCompat; cdecl; overload;
    function replaceSystemWindowInsets(i: Integer; i1: Integer; i2: Integer; i3: Integer): Jview_WindowInsetsCompat; cdecl; overload;
    function toWindowInsets: JWindowInsets; cdecl;
  end;
  TJview_WindowInsetsCompat = class(TJavaGenericImport<Jview_WindowInsetsCompatClass, Jview_WindowInsetsCompat>) end;

  Jprovider_DocumentFileClass = interface(JObjectClass)
    ['{03FBE4C9-4EB7-45A5-96CD-37A2519A1481}']
    {class} function fromFile(file_: JFile): Jprovider_DocumentFile; cdecl;
    {class} function fromSingleUri(context: JContext; uri: Jnet_Uri): Jprovider_DocumentFile; cdecl;
    {class} function fromTreeUri(context: JContext; uri: Jnet_Uri): Jprovider_DocumentFile; cdecl;
    {class} function isDocumentUri(context: JContext; uri: Jnet_Uri): Boolean; cdecl;
  end;

  [JavaSignature('androidx/documentfile/provider/DocumentFile')]
  Jprovider_DocumentFile = interface(JObject)
    ['{ED0BD049-38B3-4A46-81EA-5A48E48D1906}']
    function canRead: Boolean; cdecl;
    function canWrite: Boolean; cdecl;
    function createDirectory(string_: JString): Jprovider_DocumentFile; cdecl;
    function createFile(string_: JString; string_1: JString): Jprovider_DocumentFile; cdecl;
    function delete: Boolean; cdecl;
    function exists: Boolean; cdecl;
    function findFile(string_: JString): Jprovider_DocumentFile; cdecl;
    function getName: JString; cdecl;
    function getParentFile: Jprovider_DocumentFile; cdecl;
    function getType: JString; cdecl;
    function getUri: Jnet_Uri; cdecl;
    function isDirectory: Boolean; cdecl;
    function isFile: Boolean; cdecl;
    function isVirtual: Boolean; cdecl;
    function lastModified: Int64; cdecl;
    function length: Int64; cdecl;
    function listFiles: TJavaObjectArray<Jprovider_DocumentFile>; cdecl;
    function renameTo(string_: JString): Boolean; cdecl;
  end;
  TJprovider_DocumentFile = class(TJavaGenericImport<Jprovider_DocumentFileClass, Jprovider_DocumentFile>) end;

  Jfragment_app_FragmentTransactionClass = interface(JObjectClass)
    ['{2CC5030D-1830-4794-9773-DC3B78F17E4F}']
    {class} function _GetTRANSIT_ENTER_MASK: Integer; cdecl;
    {class} function _GetTRANSIT_EXIT_MASK: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_CLOSE: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_FADE: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_OPEN: Integer; cdecl;
    {class} function _GetTRANSIT_NONE: Integer; cdecl;
    {class} function _GetTRANSIT_UNSET: Integer; cdecl;
    {class} function init: Jfragment_app_FragmentTransaction; cdecl;
    {class} property TRANSIT_ENTER_MASK: Integer read _GetTRANSIT_ENTER_MASK;
    {class} property TRANSIT_EXIT_MASK: Integer read _GetTRANSIT_EXIT_MASK;
    {class} property TRANSIT_FRAGMENT_CLOSE: Integer read _GetTRANSIT_FRAGMENT_CLOSE;
    {class} property TRANSIT_FRAGMENT_FADE: Integer read _GetTRANSIT_FRAGMENT_FADE;
    {class} property TRANSIT_FRAGMENT_OPEN: Integer read _GetTRANSIT_FRAGMENT_OPEN;
    {class} property TRANSIT_NONE: Integer read _GetTRANSIT_NONE;
    {class} property TRANSIT_UNSET: Integer read _GetTRANSIT_UNSET;
  end;

  [JavaSignature('androidx/fragment/app/FragmentTransaction')]
  Jfragment_app_FragmentTransaction = interface(JObject)
    ['{0B0F628C-2D27-46C8-AFCC-5A521F878D35}']
    function add(i: Integer; fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl; overload;
    function add(fragment: Jfragment_app_Fragment; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function add(i: Integer; class_: Jlang_Class; bundle: JBundle): Jfragment_app_FragmentTransaction; cdecl; overload;
    function add(class_: Jlang_Class; bundle: JBundle; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function add(i: Integer; fragment: Jfragment_app_Fragment; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function add(i: Integer; class_: Jlang_Class; bundle: JBundle; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function addSharedElement(view: JView; string_: JString): Jfragment_app_FragmentTransaction; cdecl;
    function addToBackStack(string_: JString): Jfragment_app_FragmentTransaction; cdecl;
    function attach(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
    function commit: Integer; cdecl;
    function commitAllowingStateLoss: Integer; cdecl;
    procedure commitNow; cdecl;
    procedure commitNowAllowingStateLoss; cdecl;
    function detach(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
    function disallowAddToBackStack: Jfragment_app_FragmentTransaction; cdecl;
    function hide(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
    function isAddToBackStackAllowed: Boolean; cdecl;
    function isEmpty: Boolean; cdecl;
    function remove(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
    function replace(i: Integer; fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl; overload;
    function replace(i: Integer; class_: Jlang_Class; bundle: JBundle): Jfragment_app_FragmentTransaction; cdecl; overload;
    function replace(i: Integer; fragment: Jfragment_app_Fragment; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function replace(i: Integer; class_: Jlang_Class; bundle: JBundle; string_: JString): Jfragment_app_FragmentTransaction; cdecl; overload;
    function runOnCommit(runnable: JRunnable): Jfragment_app_FragmentTransaction; cdecl;
    function setAllowOptimization(b: Boolean): Jfragment_app_FragmentTransaction; cdecl;
    function setBreadCrumbShortTitle(i: Integer): Jfragment_app_FragmentTransaction; cdecl; overload;
    function setBreadCrumbShortTitle(charSequence: JCharSequence): Jfragment_app_FragmentTransaction; cdecl; overload;
    function setBreadCrumbTitle(charSequence: JCharSequence): Jfragment_app_FragmentTransaction; cdecl; overload;
    function setBreadCrumbTitle(i: Integer): Jfragment_app_FragmentTransaction; cdecl; overload;
    function setCustomAnimations(i: Integer; i1: Integer): Jfragment_app_FragmentTransaction; cdecl; overload;
    function setCustomAnimations(i: Integer; i1: Integer; i2: Integer; i3: Integer): Jfragment_app_FragmentTransaction; cdecl; overload;
    //function setMaxLifecycle(fragment: Jfragment_app_Fragment; state: JLifecycle_State): Jfragment_app_FragmentTransaction; cdecl;
    function setPrimaryNavigationFragment(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
    function setReorderingAllowed(b: Boolean): Jfragment_app_FragmentTransaction; cdecl;
    function setTransition(i: Integer): Jfragment_app_FragmentTransaction; cdecl;
    function setTransitionStyle(i: Integer): Jfragment_app_FragmentTransaction; cdecl;
    function show(fragment: Jfragment_app_Fragment): Jfragment_app_FragmentTransaction; cdecl;
  end;
  TJfragment_app_FragmentTransaction = class(TJavaGenericImport<Jfragment_app_FragmentTransactionClass, Jfragment_app_FragmentTransaction>) end;

  // androidx.fragment.app.BackStackRecord
  Jfragment_app_FragmentClass = interface(JComponentCallbacksClass)
    ['{5AC076F7-C0C9-401E-A49F-E6E0D0E2B0F2}']
    {class} function init: Jfragment_app_Fragment; cdecl; overload;
    {class} function init(i: Integer): Jfragment_app_Fragment; cdecl; overload;
    {class} function instantiate(context: JContext; string_: JString): Jfragment_app_Fragment; cdecl; overload;
    {class} function instantiate(context: JContext; string_: JString; bundle: JBundle): Jfragment_app_Fragment; cdecl; overload;
  end;

  [JavaSignature('androidx/fragment/app/Fragment')]
  Jfragment_app_Fragment = interface(JComponentCallbacks)
    ['{441B39C0-1BE9-458A-B715-C24BE45B40A2}']
    procedure dump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function getActivity: JFragmentActivity; cdecl;
    function getAllowEnterTransitionOverlap: Boolean; cdecl;
    function getAllowReturnTransitionOverlap: Boolean; cdecl;
    function getArguments: JBundle; cdecl;
    function getChildFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function getContext: JContext; cdecl;
    //function getDefaultViewModelProviderFactory: JViewModelProvider_Factory; cdecl;
    function getEnterTransition: JObject; cdecl;
    function getExitTransition: JObject; cdecl;
    function getFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function getHost: JObject; cdecl;
    function getId: Integer; cdecl;
    function getLayoutInflater: JLayoutInflater; cdecl; overload;
    function getLayoutInflater(bundle: JBundle): JLayoutInflater; cdecl; overload;
    //function getLifecycle: JLifecycle; cdecl;
    function getLoaderManager: Jloader_app_LoaderManager; cdecl;
    function getParentFragment: Jfragment_app_Fragment; cdecl;
    function getParentFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function getReenterTransition: JObject; cdecl;
    function getResources: JResources; cdecl;
    function getRetainInstance: Boolean; cdecl;
    function getReturnTransition: JObject; cdecl;
    //function getSavedStateRegistry: JSavedStateRegistry; cdecl;
    function getSharedElementEnterTransition: JObject; cdecl;
    function getSharedElementReturnTransition: JObject; cdecl;
    function getString(i: Integer): JString; cdecl; overload;
    function getTag: JString; cdecl;
    function getTargetFragment: Jfragment_app_Fragment; cdecl;
    function getTargetRequestCode: Integer; cdecl;
    function getText(i: Integer): JCharSequence; cdecl;
    function getUserVisibleHint: Boolean; cdecl;
    function getView: JView; cdecl;
    //function getViewLifecycleOwner: JLifecycleOwner; cdecl;
    //function getViewLifecycleOwnerLiveData: JLiveData; cdecl;
    //function getViewModelStore: JViewModelStore; cdecl;
    function hasOptionsMenu: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isAdded: Boolean; cdecl;
    function isDetached: Boolean; cdecl;
    function isHidden: Boolean; cdecl;
    function isInLayout: Boolean; cdecl;
    function isMenuVisible: Boolean; cdecl;
    function isRemoving: Boolean; cdecl;
    function isResumed: Boolean; cdecl;
    function isStateSaved: Boolean; cdecl;
    function isVisible: Boolean; cdecl;
    procedure onActivityCreated(bundle: JBundle); cdecl;
    procedure onActivityResult(i: Integer; i1: Integer; intent: JIntent); cdecl;
    procedure onAttach(context: JContext); cdecl; overload;
    procedure onAttach(activity: JActivity); cdecl; overload;
    procedure onAttachFragment(fragment: Jfragment_app_Fragment); cdecl;
    procedure onConfigurationChanged(configuration: JConfiguration); cdecl;
    function onContextItemSelected(menuItem: JMenuItem): Boolean; cdecl;
    procedure onCreate(bundle: JBundle); cdecl;
    function onCreateAnimation(i: Integer; b: Boolean; i1: Integer): JAnimation; cdecl;
    //function onCreateAnimator(i: Integer; b: Boolean; i1: Integer): JAnimator; cdecl;
    procedure onCreateContextMenu(contextMenu: JContextMenu; view: JView; contextMenuInfo: JContextMenu_ContextMenuInfo); cdecl;
    procedure onCreateOptionsMenu(menu: JMenu; menuInflater: JMenuInflater); cdecl;
    function onCreateView(layoutInflater: JLayoutInflater; viewGroup: JViewGroup; bundle: JBundle): JView; cdecl;
    procedure onDestroy; cdecl;
    procedure onDestroyOptionsMenu; cdecl;
    procedure onDestroyView; cdecl;
    procedure onDetach; cdecl;
    function onGetLayoutInflater(bundle: JBundle): JLayoutInflater; cdecl;
    procedure onHiddenChanged(b: Boolean); cdecl;
    procedure onInflate(activity: JActivity; attributeSet: JAttributeSet; bundle: JBundle); cdecl; overload;
    procedure onInflate(context: JContext; attributeSet: JAttributeSet; bundle: JBundle); cdecl; overload;
    procedure onLowMemory; cdecl;
    procedure onMultiWindowModeChanged(b: Boolean); cdecl;
    function onOptionsItemSelected(menuItem: JMenuItem): Boolean; cdecl;
    procedure onOptionsMenuClosed(menu: JMenu); cdecl;
    procedure onPause; cdecl;
    procedure onPictureInPictureModeChanged(b: Boolean); cdecl;
    procedure onPrepareOptionsMenu(menu: JMenu); cdecl;
    procedure onPrimaryNavigationFragmentChanged(b: Boolean); cdecl;
    procedure onRequestPermissionsResult(i: Integer; string_: TJavaObjectArray<JString>; i1: TJavaArray<Integer>); cdecl;
    procedure onResume; cdecl;
    procedure onSaveInstanceState(bundle: JBundle); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onViewCreated(view: JView; bundle: JBundle); cdecl;
    procedure onViewStateRestored(bundle: JBundle); cdecl;
    procedure postponeEnterTransition; cdecl; overload;
    procedure postponeEnterTransition(l: Int64; timeUnit: JTimeUnit); cdecl; overload;
    procedure registerForContextMenu(view: JView); cdecl;
    procedure requestPermissions(string_: TJavaObjectArray<JString>; i: Integer); cdecl;
    function requireActivity: JFragmentActivity; cdecl;
    function requireArguments: JBundle; cdecl;
    function requireContext: JContext; cdecl;
    function requireFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function requireHost: JObject; cdecl;
    function requireParentFragment: Jfragment_app_Fragment; cdecl;
    function requireView: JView; cdecl;
    procedure setAllowEnterTransitionOverlap(b: Boolean); cdecl;
    procedure setAllowReturnTransitionOverlap(b: Boolean); cdecl;
    procedure setArguments(bundle: JBundle); cdecl;
    procedure setEnterSharedElementCallback(sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    procedure setEnterTransition(object_: JObject); cdecl;
    procedure setExitSharedElementCallback(sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    procedure setExitTransition(object_: JObject); cdecl;
    procedure setHasOptionsMenu(b: Boolean); cdecl;
    procedure setInitialSavedState(savedState: Jfragment_app_Fragment_SavedState); cdecl;
    procedure setMenuVisibility(b: Boolean); cdecl;
    procedure setReenterTransition(object_: JObject); cdecl;
    procedure setRetainInstance(b: Boolean); cdecl;
    procedure setReturnTransition(object_: JObject); cdecl;
    procedure setSharedElementEnterTransition(object_: JObject); cdecl;
    procedure setSharedElementReturnTransition(object_: JObject); cdecl;
    procedure setTargetFragment(fragment: Jfragment_app_Fragment; i: Integer); cdecl;
    procedure setUserVisibleHint(b: Boolean); cdecl;
    function shouldShowRequestPermissionRationale(string_: JString): Boolean; cdecl;
    procedure startActivity(intent: JIntent); cdecl; overload;
    procedure startActivity(intent: JIntent; bundle: JBundle); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; i: Integer); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; i: Integer; bundle: JBundle); cdecl; overload;
    procedure startIntentSenderForResult(intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl;
    procedure startPostponedEnterTransition; cdecl;
    function toString: JString; cdecl;
    procedure unregisterForContextMenu(view: JView); cdecl;
  end;
  TJfragment_app_Fragment = class(TJavaGenericImport<Jfragment_app_FragmentClass, Jfragment_app_Fragment>) end;

  JFragment_AnimationInfoClass = interface(JObjectClass)
    ['{E01BF5D9-ADEE-432F-A9E8-4C3C6124A3D4}']
  end;

  [JavaSignature('androidx/fragment/app/Fragment$AnimationInfo')]
  JFragment_AnimationInfo = interface(JObject)
    ['{C6B06E50-F4FA-4753-BF4C-57B796F96A65}']
  end;
  TJFragment_AnimationInfo = class(TJavaGenericImport<JFragment_AnimationInfoClass, JFragment_AnimationInfo>) end;

  JFragment_OnStartEnterTransitionListenerClass = interface(IJavaClass)
    ['{5DB445A8-9EEA-4FF9-B35C-F37B96167CE1}']
  end;

  [JavaSignature('androidx/fragment/app/Fragment$OnStartEnterTransitionListener')]
  JFragment_OnStartEnterTransitionListener = interface(IJavaInstance)
    ['{71CB3797-F322-48BD-AF37-E2B6952BA087}']
    procedure onStartEnterTransition; cdecl;
    procedure startListening; cdecl;
  end;
  TJFragment_OnStartEnterTransitionListener = class(TJavaGenericImport<JFragment_OnStartEnterTransitionListenerClass, JFragment_OnStartEnterTransitionListener>) end;

  Jfragment_app_Fragment_SavedStateClass = interface(JParcelableClass)
    ['{03639EB6-A959-4CA9-A70D-0A38750C8500}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('androidx/fragment/app/Fragment$SavedState')]
  Jfragment_app_Fragment_SavedState = interface(JParcelable)
    ['{D539572D-EDD2-497F-A6AB-8F495C1BE894}']
    function describeContents: Integer; cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJfragment_app_Fragment_SavedState = class(TJavaGenericImport<Jfragment_app_Fragment_SavedStateClass, Jfragment_app_Fragment_SavedState>) end;

  JFragmentActivityClass = interface(Jactivity_ComponentActivityClass)
    ['{5F78B2F1-E50E-4D69-A4ED-7CE745C9F2B6}']
    {class} function init: JFragmentActivity; cdecl; overload;
    {class} function init(i: Integer): JFragmentActivity; cdecl; overload;
  end;

  [JavaSignature('androidx/fragment/app/FragmentActivity')]
  JFragmentActivity = interface(Jactivity_ComponentActivity)
    ['{8AD18B9D-37EF-4B67-9F00-138744C6C064}']
    procedure dump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function getSupportFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function getSupportLoaderManager: Jloader_app_LoaderManager; cdecl;
    procedure onAttachFragment(fragment: Jfragment_app_Fragment); cdecl;
    procedure onConfigurationChanged(configuration: JConfiguration); cdecl;
    function onCreatePanelMenu(i: Integer; menu: JMenu): Boolean; cdecl;
    function onCreateView(string_: JString; context: JContext; attributeSet: JAttributeSet): JView; cdecl; overload;
    function onCreateView(view: JView; string_: JString; context: JContext; attributeSet: JAttributeSet): JView; cdecl; overload;
    procedure onLowMemory; cdecl;
    function onMenuItemSelected(i: Integer; menuItem: JMenuItem): Boolean; cdecl;
    procedure onMultiWindowModeChanged(b: Boolean); cdecl;
    procedure onPanelClosed(i: Integer; menu: JMenu); cdecl;
    procedure onPictureInPictureModeChanged(b: Boolean); cdecl;
    function onPreparePanel(i: Integer; view: JView; menu: JMenu): Boolean; cdecl;
    procedure onRequestPermissionsResult(i: Integer; string_: TJavaObjectArray<JString>; i1: TJavaArray<Integer>); cdecl;
    procedure onStateNotSaved; cdecl;
    procedure setEnterSharedElementCallback(sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    procedure setExitSharedElementCallback(sharedElementCallback: Jcore_app_SharedElementCallback); cdecl;
    procedure startActivityForResult(intent: JIntent; i: Integer); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; i: Integer; bundle: JBundle); cdecl; overload;
    procedure startActivityFromFragment(fragment: Jfragment_app_Fragment; intent: JIntent; i: Integer); cdecl; overload;
    procedure startActivityFromFragment(fragment: Jfragment_app_Fragment; intent: JIntent; i: Integer; bundle: JBundle); cdecl; overload;
    procedure startIntentSenderForResult(intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer); cdecl; overload;
    procedure startIntentSenderForResult(intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl; overload;
    procedure startIntentSenderFromFragment(fragment: Jfragment_app_Fragment; intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl;
    procedure supportFinishAfterTransition; cdecl;
    procedure supportInvalidateOptionsMenu; cdecl;
    procedure supportPostponeEnterTransition; cdecl;
    procedure supportStartPostponedEnterTransition; cdecl;
    procedure validateRequestPermissionsRequestCode(i: Integer); cdecl;
  end;
  TJFragmentActivity = class(TJavaGenericImport<JFragmentActivityClass, JFragmentActivity>) end;

  Jfragment_app_FragmentContainerClass = interface(JObjectClass)
    ['{24ABDD92-F5EB-4C18-B673-9C3DD96BE199}']
    {class} function init: Jfragment_app_FragmentContainer; cdecl;
  end;

  [JavaSignature('androidx/fragment/app/FragmentContainer')]
  Jfragment_app_FragmentContainer = interface(JObject)
    ['{9AE1F52E-8337-403D-A5B0-66ADCBC8A4E6}']
    function instantiate(context: JContext; string_: JString; bundle: JBundle): Jfragment_app_Fragment; cdecl;
    function onFindViewById(i: Integer): JView; cdecl;
    function onHasView: Boolean; cdecl;
  end;
  TJfragment_app_FragmentContainer = class(TJavaGenericImport<Jfragment_app_FragmentContainerClass, Jfragment_app_FragmentContainer>) end;

  Jfragment_app_FragmentControllerClass = interface(JObjectClass)
    ['{4DF8CC49-07F6-44FB-989B-C6425B177A33}']
    {class} function createController(fragmentHostCallback: Jfragment_app_FragmentHostCallback): Jfragment_app_FragmentController; cdecl;
  end;

  [JavaSignature('androidx/fragment/app/FragmentController')]
  Jfragment_app_FragmentController = interface(JObject)
    ['{7C690C32-90EE-467F-B4C1-A3185FFE7BD5}']
    procedure attachHost(fragment: Jfragment_app_Fragment); cdecl;
    procedure dispatchActivityCreated; cdecl;
    procedure dispatchConfigurationChanged(configuration: JConfiguration); cdecl;
    function dispatchContextItemSelected(menuItem: JMenuItem): Boolean; cdecl;
    procedure dispatchCreate; cdecl;
    function dispatchCreateOptionsMenu(menu: JMenu; menuInflater: JMenuInflater): Boolean; cdecl;
    procedure dispatchDestroy; cdecl;
    procedure dispatchDestroyView; cdecl;
    procedure dispatchLowMemory; cdecl;
    procedure dispatchMultiWindowModeChanged(b: Boolean); cdecl;
    function dispatchOptionsItemSelected(menuItem: JMenuItem): Boolean; cdecl;
    procedure dispatchOptionsMenuClosed(menu: JMenu); cdecl;
    procedure dispatchPause; cdecl;
    procedure dispatchPictureInPictureModeChanged(b: Boolean); cdecl;
    function dispatchPrepareOptionsMenu(menu: JMenu): Boolean; cdecl;
    procedure dispatchReallyStop; cdecl;
    procedure dispatchResume; cdecl;
    procedure dispatchStart; cdecl;
    procedure dispatchStop; cdecl;
    procedure doLoaderDestroy; cdecl;
    procedure doLoaderRetain; cdecl;
    procedure doLoaderStart; cdecl;
    procedure doLoaderStop(b: Boolean); cdecl;
    procedure dumpLoaders(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function execPendingActions: Boolean; cdecl;
    function findFragmentByWho(string_: JString): Jfragment_app_Fragment; cdecl;
    function getActiveFragments(list: JList): JList; cdecl;
    function getActiveFragmentsCount: Integer; cdecl;
    function getSupportFragmentManager: Jfragment_app_FragmentManager; cdecl;
    function getSupportLoaderManager: Jloader_app_LoaderManager; cdecl;
    procedure noteStateNotSaved; cdecl;
    function onCreateView(view: JView; string_: JString; context: JContext; attributeSet: JAttributeSet): JView; cdecl;
    procedure reportLoaderStart; cdecl;
    procedure restoreAllState(parcelable: JParcelable; fragmentManagerNonConfig: Jfragment_app_FragmentManagerNonConfig); cdecl; overload;
    procedure restoreAllState(parcelable: JParcelable; list: JList); cdecl; overload;
    //procedure restoreLoaderNonConfig(simpleArrayMap: Jcollection_SimpleArrayMap); cdecl;
    procedure restoreSaveState(parcelable: JParcelable); cdecl;
    //function retainLoaderNonConfig: Jcollection_SimpleArrayMap; cdecl;
    function retainNestedNonConfig: Jfragment_app_FragmentManagerNonConfig; cdecl;
    function retainNonConfig: JList; cdecl;
    function saveAllState: JParcelable; cdecl;
  end;
  TJfragment_app_FragmentController = class(TJavaGenericImport<Jfragment_app_FragmentControllerClass, Jfragment_app_FragmentController>) end;

  JFragmentFactoryClass = interface(JObjectClass)
    ['{1B58497D-974B-403C-B3B9-AD2D030DD1AE}']
    {class} function init: JFragmentFactory; cdecl;
    {class} function loadFragmentClass(classLoader: JClassLoader; string_: JString): Jlang_Class; cdecl;
  end;

  [JavaSignature('androidx/fragment/app/FragmentFactory')]
  JFragmentFactory = interface(JObject)
    ['{293F636D-6FBF-480C-9D37-DD0136AD1A27}']
    function instantiate(classLoader: JClassLoader; string_: JString): Jfragment_app_Fragment; cdecl;
  end;
  TJFragmentFactory = class(TJavaGenericImport<JFragmentFactoryClass, JFragmentFactory>) end;

  Jfragment_app_FragmentHostCallbackClass = interface(Jfragment_app_FragmentContainerClass)
    ['{41488B7F-BEA5-46C5-83F5-DC7BD1F5C9DF}']
    {class} function init(context: JContext; handler: JHandler; i: Integer): Jfragment_app_FragmentHostCallback; cdecl; overload;
  end;

  [JavaSignature('androidx/fragment/app/FragmentHostCallback')]
  Jfragment_app_FragmentHostCallback = interface(Jfragment_app_FragmentContainer)
    ['{C55B3741-F7B3-446A-944F-AB62F419016E}']
    procedure onDump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function onFindViewById(i: Integer): JView; cdecl;
    function onGetHost: JObject; cdecl;
    function onGetLayoutInflater: JLayoutInflater; cdecl;
    function onGetWindowAnimations: Integer; cdecl;
    function onHasView: Boolean; cdecl;
    function onHasWindowAnimations: Boolean; cdecl;
    procedure onRequestPermissionsFromFragment(fragment: Jfragment_app_Fragment; string_: TJavaObjectArray<JString>; i: Integer); cdecl;
    function onShouldSaveFragmentState(fragment: Jfragment_app_Fragment): Boolean; cdecl;
    function onShouldShowRequestPermissionRationale(string_: JString): Boolean; cdecl;
    procedure onStartActivityFromFragment(fragment: Jfragment_app_Fragment; intent: JIntent; i: Integer); cdecl; overload;
    procedure onStartActivityFromFragment(fragment: Jfragment_app_Fragment; intent: JIntent; i: Integer; bundle: JBundle); cdecl; overload;
    procedure onStartIntentSenderFromFragment(fragment: Jfragment_app_Fragment; intentSender: JIntentSender; i: Integer; intent: JIntent; i1: Integer; i2: Integer; i3: Integer; bundle: JBundle); cdecl;
    procedure onSupportInvalidateOptionsMenu; cdecl;
  end;
  TJfragment_app_FragmentHostCallback = class(TJavaGenericImport<Jfragment_app_FragmentHostCallbackClass, Jfragment_app_FragmentHostCallback>) end;

  // androidx.fragment.app.FragmentLifecycleCallbacksDispatcher
  Jfragment_app_FragmentManagerClass = interface(JObjectClass)
    ['{2B54DDBD-56E4-48F4-8797-DA6D22A7C129}']
    {class} function _GetPOP_BACK_STACK_INCLUSIVE: Integer; cdecl;
    {class} procedure enableDebugLogging(b: Boolean); cdecl;
    {class} function findFragment(view: JView): Jfragment_app_Fragment; cdecl;
    {class} function init: Jfragment_app_FragmentManager; cdecl;
    {class} property POP_BACK_STACK_INCLUSIVE: Integer read _GetPOP_BACK_STACK_INCLUSIVE;
  end;

  [JavaSignature('androidx/fragment/app/FragmentManager')]
  Jfragment_app_FragmentManager = interface(JObject)
    ['{772A0271-6D22-4A01-8951-644F74F8D46E}']
    procedure addOnBackStackChangedListener(onBackStackChangedListener: Jfragment_app_FragmentManager_OnBackStackChangedListener); cdecl;
    function beginTransaction: Jfragment_app_FragmentTransaction; cdecl;
    procedure dump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function executePendingTransactions: Boolean; cdecl;
    function findFragmentById(i: Integer): Jfragment_app_Fragment; cdecl;
    function findFragmentByTag(string_: JString): Jfragment_app_Fragment; cdecl;
    function getBackStackEntryAt(i: Integer): Jfragment_app_FragmentManager_BackStackEntry; cdecl;
    function getBackStackEntryCount: Integer; cdecl;
    function getFragment(bundle: JBundle; string_: JString): Jfragment_app_Fragment; cdecl;
    function getFragmentFactory: JFragmentFactory; cdecl;
    function getFragments: JList; cdecl;
    function getPrimaryNavigationFragment: Jfragment_app_Fragment; cdecl;
    function isDestroyed: Boolean; cdecl;
    function isStateSaved: Boolean; cdecl;
    function openTransaction: Jfragment_app_FragmentTransaction; cdecl;
    procedure popBackStack; cdecl; overload;
    procedure popBackStack(i: Integer; i1: Integer); cdecl; overload;
    procedure popBackStack(string_: JString; i: Integer); cdecl; overload;
    function popBackStackImmediate: Boolean; cdecl; overload;
    function popBackStackImmediate(string_: JString; i: Integer): Boolean; cdecl; overload;
    function popBackStackImmediate(i: Integer; i1: Integer): Boolean; cdecl; overload;
    procedure putFragment(bundle: JBundle; string_: JString; fragment: Jfragment_app_Fragment); cdecl;
    procedure registerFragmentLifecycleCallbacks(fragmentLifecycleCallbacks: Jfragment_app_FragmentManager_FragmentLifecycleCallbacks; b: Boolean); cdecl;
    procedure removeOnBackStackChangedListener(onBackStackChangedListener: Jfragment_app_FragmentManager_OnBackStackChangedListener); cdecl;
    function saveFragmentInstanceState(fragment: Jfragment_app_Fragment): Jfragment_app_Fragment_SavedState; cdecl;
    procedure setFragmentFactory(fragmentFactory: JFragmentFactory); cdecl;
    function toString: JString; cdecl;
    procedure unregisterFragmentLifecycleCallbacks(fragmentLifecycleCallbacks: Jfragment_app_FragmentManager_FragmentLifecycleCallbacks); cdecl;
  end;
  TJfragment_app_FragmentManager = class(TJavaGenericImport<Jfragment_app_FragmentManagerClass, Jfragment_app_FragmentManager>) end;

  Jfragment_app_FragmentManager_BackStackEntryClass = interface(IJavaClass)
    ['{557F123F-2D23-44E5-97F3-BA75D0C17A6C}']
  end;

  [JavaSignature('androidx/fragment/app/FragmentManager$BackStackEntry')]
  Jfragment_app_FragmentManager_BackStackEntry = interface(IJavaInstance)
    ['{02B3B428-C3E0-470B-B62C-0906F22DBDA5}']
    function getBreadCrumbShortTitle: JCharSequence; cdecl;
    function getBreadCrumbShortTitleRes: Integer; cdecl;
    function getBreadCrumbTitle: JCharSequence; cdecl;
    function getBreadCrumbTitleRes: Integer; cdecl;
    function getId: Integer; cdecl;
    function getName: JString; cdecl;
  end;
  TJfragment_app_FragmentManager_BackStackEntry = class(TJavaGenericImport<Jfragment_app_FragmentManager_BackStackEntryClass, Jfragment_app_FragmentManager_BackStackEntry>) end;

  Jfragment_app_FragmentManager_FragmentLifecycleCallbacksClass = interface(JObjectClass)
    ['{59163892-AB14-4624-8C5D-74C1ACCB6466}']
    {class} function init: Jfragment_app_FragmentManager_FragmentLifecycleCallbacks; cdecl;
  end;

  [JavaSignature('androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks')]
  Jfragment_app_FragmentManager_FragmentLifecycleCallbacks = interface(JObject)
    ['{8700CBAA-A215-4169-ABA7-06D43C66694F}']
    procedure onFragmentActivityCreated(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; bundle: JBundle); cdecl;
    procedure onFragmentAttached(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; context: JContext); cdecl;
    procedure onFragmentCreated(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; bundle: JBundle); cdecl;
    procedure onFragmentDestroyed(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentDetached(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentPaused(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentPreAttached(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; context: JContext); cdecl;
    procedure onFragmentPreCreated(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; bundle: JBundle); cdecl;
    procedure onFragmentResumed(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentSaveInstanceState(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; bundle: JBundle); cdecl;
    procedure onFragmentStarted(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentStopped(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
    procedure onFragmentViewCreated(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment; view: JView; bundle: JBundle); cdecl;
    procedure onFragmentViewDestroyed(fragmentManager: Jfragment_app_FragmentManager; fragment: Jfragment_app_Fragment); cdecl;
  end;
  TJfragment_app_FragmentManager_FragmentLifecycleCallbacks = class(TJavaGenericImport<Jfragment_app_FragmentManager_FragmentLifecycleCallbacksClass, Jfragment_app_FragmentManager_FragmentLifecycleCallbacks>) end;

  Jfragment_app_FragmentManager_OnBackStackChangedListenerClass = interface(IJavaClass)
    ['{56587D12-18B6-4A7C-988C-E8E052A0D001}']
  end;

  [JavaSignature('androidx/fragment/app/FragmentManager$OnBackStackChangedListener')]
  Jfragment_app_FragmentManager_OnBackStackChangedListener = interface(IJavaInstance)
    ['{C5F7B04F-5471-4A45-9DDE-4CD56B86F805}']
    procedure onBackStackChanged; cdecl;
  end;
  TJfragment_app_FragmentManager_OnBackStackChangedListener = class(TJavaGenericImport<Jfragment_app_FragmentManager_OnBackStackChangedListenerClass, Jfragment_app_FragmentManager_OnBackStackChangedListener>) end;

  // androidx.fragment.app.FragmentManager$OpGenerator
  Jfragment_app_FragmentManagerNonConfigClass = interface(JObjectClass)
    ['{786B3DDF-138E-45C0-9B16-9B32C7B05537}']
  end;

  [JavaSignature('androidx/fragment/app/FragmentManagerNonConfig')]
  Jfragment_app_FragmentManagerNonConfig = interface(JObject)
    ['{7C173470-825F-43C1-AA02-24D6B2F28FBD}']
  end;
  TJfragment_app_FragmentManagerNonConfig = class(TJavaGenericImport<Jfragment_app_FragmentManagerNonConfigClass, Jfragment_app_FragmentManagerNonConfig>) end;

  // androidx.fragment.app.FragmentTransaction$Op
  // androidx.fragment.app.FragmentViewLifecycleOwner
  Jcontent_WakefulBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{143CD2CF-F5B7-49E6-8F08-098B5CD8820A}']
    {class} function completeWakefulIntent(intent: JIntent): Boolean; cdecl;
    {class} function init: Jcontent_WakefulBroadcastReceiver; cdecl;
    {class} function startWakefulService(context: JContext; intent: JIntent): JComponentName; cdecl;
  end;

  [JavaSignature('androidx/legacy/content/WakefulBroadcastReceiver')]
  Jcontent_WakefulBroadcastReceiver = interface(JBroadcastReceiver)
    ['{D432F4F8-2653-4989-B3DD-7ED0A0FDEF68}']
  end;
  TJcontent_WakefulBroadcastReceiver = class(TJavaGenericImport<Jcontent_WakefulBroadcastReceiverClass, Jcontent_WakefulBroadcastReceiver>) end;

  Jloader_app_LoaderManagerClass = interface(JObjectClass)
    ['{9654909A-F507-4E48-9320-792B7EE35521}']
    {class} procedure enableDebugLogging(b: Boolean); cdecl;
    {class} //function getInstance(lifecycleOwner: JLifecycleOwner): Jloader_app_LoaderManager; cdecl;
    {class} function init: Jloader_app_LoaderManager; cdecl;
  end;

  [JavaSignature('androidx/loader/app/LoaderManager')]
  Jloader_app_LoaderManager = interface(JObject)
    ['{3BD25A7B-AB91-467D-9A1F-48136B6CA9A8}']
    procedure destroyLoader(i: Integer); cdecl;
    procedure dump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    function getLoader(i: Integer): Jloader_content_Loader; cdecl;
    function hasRunningLoaders: Boolean; cdecl;
    function initLoader(i: Integer; bundle: JBundle; loaderCallbacks: Jloader_app_LoaderManager_LoaderCallbacks): Jloader_content_Loader; cdecl;
    procedure markForRedelivery; cdecl;
    function restartLoader(i: Integer; bundle: JBundle; loaderCallbacks: Jloader_app_LoaderManager_LoaderCallbacks): Jloader_content_Loader; cdecl;
  end;
  TJloader_app_LoaderManager = class(TJavaGenericImport<Jloader_app_LoaderManagerClass, Jloader_app_LoaderManager>) end;

  Jloader_app_LoaderManager_LoaderCallbacksClass = interface(IJavaClass)
    ['{90EF03C4-52AD-4875-8BDF-C4E0DCAEEA3F}']
  end;

  [JavaSignature('androidx/loader/app/LoaderManager$LoaderCallbacks')]
  Jloader_app_LoaderManager_LoaderCallbacks = interface(IJavaInstance)
    ['{CDB9C28D-816F-494F-A7DA-F00F098A4081}']
    function onCreateLoader(i: Integer; bundle: JBundle): Jloader_content_Loader; cdecl;
    procedure onLoadFinished(loader: Jloader_content_Loader; object_: JObject); cdecl;
    procedure onLoaderReset(loader: Jloader_content_Loader); cdecl;
  end;
  TJloader_app_LoaderManager_LoaderCallbacks = class(TJavaGenericImport<Jloader_app_LoaderManager_LoaderCallbacksClass, Jloader_app_LoaderManager_LoaderCallbacks>) end;

  Jloader_content_LoaderClass = interface(JObjectClass)
    ['{241522F0-5B8A-4BD8-ADD3-64413EDF3182}']
    {class} function init(context: JContext): Jloader_content_Loader; cdecl;
  end;

  [JavaSignature('androidx/loader/content/Loader')]
  Jloader_content_Loader = interface(JObject)
    ['{7B296D0C-7BCA-4E7A-B370-418C614388E5}']
    procedure abandon; cdecl;
    function cancelLoad: Boolean; cdecl;
    procedure commitContentChanged; cdecl;
    function dataToString(object_: JObject): JString; cdecl;
    procedure deliverCancellation; cdecl;
    procedure deliverResult(object_: JObject); cdecl;
    procedure dump(string_: JString; fileDescriptor: JFileDescriptor; printWriter: JPrintWriter; string_1: TJavaObjectArray<JString>); cdecl;
    procedure forceLoad; cdecl;
    function getContext: JContext; cdecl;
    function getId: Integer; cdecl;
    function isAbandoned: Boolean; cdecl;
    function isReset: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure onContentChanged; cdecl;
    procedure registerListener(i: Integer; onLoadCompleteListener: Jloader_content_Loader_OnLoadCompleteListener); cdecl;
    procedure registerOnLoadCanceledListener(onLoadCanceledListener: Jloader_content_Loader_OnLoadCanceledListener); cdecl;
    procedure reset; cdecl;
    procedure rollbackContentChanged; cdecl;
    procedure startLoading; cdecl;
    procedure stopLoading; cdecl;
    function takeContentChanged: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure unregisterListener(onLoadCompleteListener: Jloader_content_Loader_OnLoadCompleteListener); cdecl;
    procedure unregisterOnLoadCanceledListener(onLoadCanceledListener: Jloader_content_Loader_OnLoadCanceledListener); cdecl;
  end;
  TJloader_content_Loader = class(TJavaGenericImport<Jloader_content_LoaderClass, Jloader_content_Loader>) end;

  Jloader_content_Loader_OnLoadCanceledListenerClass = interface(IJavaClass)
    ['{FE13430F-83C5-4866-A1DB-8DAF2D119B32}']
  end;

  [JavaSignature('androidx/loader/content/Loader$OnLoadCanceledListener')]
  Jloader_content_Loader_OnLoadCanceledListener = interface(IJavaInstance)
    ['{1378BDA3-B472-4589-8D95-59BAC99ECA1A}']
    procedure onLoadCanceled(loader: Jloader_content_Loader); cdecl;
  end;
  TJloader_content_Loader_OnLoadCanceledListener = class(TJavaGenericImport<Jloader_content_Loader_OnLoadCanceledListenerClass, Jloader_content_Loader_OnLoadCanceledListener>) end;

  Jloader_content_Loader_OnLoadCompleteListenerClass = interface(IJavaClass)
    ['{82BDAAAF-9BF4-4FCC-9B0B-C361A678C8BD}']
  end;

  [JavaSignature('androidx/loader/content/Loader$OnLoadCompleteListener')]
  Jloader_content_Loader_OnLoadCompleteListener = interface(IJavaInstance)
    ['{A10A7B23-B5B6-42AE-BB52-2E55306E5CC8}']
    procedure onLoadComplete(loader: Jloader_content_Loader; object_: JObject); cdecl;
  end;
  TJloader_content_Loader_OnLoadCompleteListener = class(TJavaGenericImport<Jloader_content_Loader_OnLoadCompleteListenerClass, Jloader_content_Loader_OnLoadCompleteListener>) end;

implementation

procedure RegisterTypes;
begin
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JCancellable', TypeInfo(Androidapi.JNI.Support.JCancellable));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JComponentActivity', TypeInfo(Androidapi.JNI.Support.JComponentActivity));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jactivity_ComponentActivity', TypeInfo(Androidapi.JNI.Support.Jactivity_ComponentActivity));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JComponentActivity_ReportFullyDrawnExecutor', TypeInfo(Androidapi.JNI.Support.JComponentActivity_ReportFullyDrawnExecutor));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFullyDrawnReporter', TypeInfo(Androidapi.JNI.Support.JFullyDrawnReporter));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JOnBackPressedCallback', TypeInfo(Androidapi.JNI.Support.JOnBackPressedCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JOnBackPressedDispatcher', TypeInfo(Androidapi.JNI.Support.JOnBackPressedDispatcher));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JContextAwareHelper', TypeInfo(Androidapi.JNI.Support.JContextAwareHelper));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JOnContextAvailableListener', TypeInfo(Androidapi.JNI.Support.JOnContextAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityResultCallback', TypeInfo(Androidapi.JNI.Support.JActivityResultCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityResultLauncher', TypeInfo(Androidapi.JNI.Support.JActivityResultLauncher));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityResultRegistry', TypeInfo(Androidapi.JNI.Support.JActivityResultRegistry));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityResultContract', TypeInfo(Androidapi.JNI.Support.JActivityResultContract));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityResultContract_SynchronousResult', TypeInfo(Androidapi.JNI.Support.JActivityResultContract_SynchronousResult));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricManager', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricManager));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricManager_Authenticators', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricManager_Authenticators));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JBiometricManager_Injector', TypeInfo(Androidapi.JNI.Support.JBiometricManager_Injector));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricPrompt', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricPrompt));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricPrompt_AuthenticationCallback', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricPrompt_AuthenticationCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricPrompt_AuthenticationResult', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricPrompt_AuthenticationResult));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jbiometric_BiometricPrompt_CryptoObject', TypeInfo(Androidapi.JNI.Support.Jbiometric_BiometricPrompt_CryptoObject));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JBiometricPrompt_PromptInfo', TypeInfo(Androidapi.JNI.Support.JBiometricPrompt_PromptInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JPromptInfo_Builder', TypeInfo(Androidapi.JNI.Support.JPromptInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_ContextCompat', TypeInfo(Androidapi.JNI.Support.Jcontent_ContextCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_ActivityCompat', TypeInfo(Androidapi.JNI.Support.Japp_ActivityCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityCompat_PermissionCompatDelegate', TypeInfo(Androidapi.JNI.Support.JActivityCompat_PermissionCompatDelegate));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_ActivityOptionsCompat', TypeInfo(Androidapi.JNI.Support.Japp_ActivityOptionsCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JComponentActivity_ExtraData', TypeInfo(Androidapi.JNI.Support.JComponentActivity_ExtraData));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_JobIntentService', TypeInfo(Androidapi.JNI.Support.Japp_JobIntentService));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JJobIntentService_CommandProcessor', TypeInfo(Androidapi.JNI.Support.JJobIntentService_CommandProcessor));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JJobIntentService_CompatJobEngine', TypeInfo(Androidapi.JNI.Support.JJobIntentService_CompatJobEngine));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JJobIntentService_GenericWorkItem', TypeInfo(Androidapi.JNI.Support.JJobIntentService_GenericWorkItem));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JJobIntentService_WorkEnqueuer', TypeInfo(Androidapi.JNI.Support.JJobIntentService_WorkEnqueuer));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationBuilderWithBuilderAccessor', TypeInfo(Androidapi.JNI.Support.JNotificationBuilderWithBuilderAccessor));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_NotificationCompat', TypeInfo(Androidapi.JNI.Support.Japp_NotificationCompat));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_1', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_1));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_NotificationCompat_Action', TypeInfo(Androidapi.JNI.Support.Japp_NotificationCompat_Action));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_BubbleMetadata', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_BubbleMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_NotificationCompat_Builder', TypeInfo(Androidapi.JNI.Support.Japp_NotificationCompat_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_NotificationCompat_Extender', TypeInfo(Androidapi.JNI.Support.Japp_NotificationCompat_Extender));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_NotificationCompat_Style', TypeInfo(Androidapi.JNI.Support.Japp_NotificationCompat_Style));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JPendingIntentCompat', TypeInfo(Androidapi.JNI.Support.JPendingIntentCompat));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_Person', TypeInfo(Androidapi.JNI.Support.Japp_Person));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JPerson_Builder', TypeInfo(Androidapi.JNI.Support.JPerson_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_app_RemoteInput', TypeInfo(Androidapi.JNI.Support.Jcore_app_RemoteInput));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_app_SharedElementCallback', TypeInfo(Androidapi.JNI.Support.Jcore_app_SharedElementCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_app_SharedElementCallback_OnSharedElementsReadyListener', TypeInfo(Androidapi.JNI.Support.Jcore_app_SharedElementCallback_OnSharedElementsReadyListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_FileProvider', TypeInfo(Androidapi.JNI.Support.Jcontent_FileProvider));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JLocusIdCompat', TypeInfo(Androidapi.JNI.Support.JLocusIdCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_PermissionChecker', TypeInfo(Androidapi.JNI.Support.Jcontent_PermissionChecker));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jpm_ShortcutInfoCompat', TypeInfo(Androidapi.JNI.Support.Jpm_ShortcutInfoCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JInsets', TypeInfo(Androidapi.JNI.Support.JInsets));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Jdrawable_IconCompat', TypeInfo(Androidapi.JNI.Support.Jdrawable_IconCompat));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat', TypeInfo(Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_AuthenticationCallback', TypeInfo(Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_AuthenticationCallback));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_AuthenticationResult', TypeInfo(Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_AuthenticationResult));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_CryptoObject', TypeInfo(Androidapi.JNI.Support.Jfingerprint_FingerprintManagerCompat_CryptoObject));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_os_CancellationSignal', TypeInfo(Androidapi.JNI.Support.Jcore_os_CancellationSignal));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_os_CancellationSignal_OnCancelListener', TypeInfo(Androidapi.JNI.Support.Jcore_os_CancellationSignal_OnCancelListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jutil_Consumer', TypeInfo(Androidapi.JNI.Support.Jutil_Consumer));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcore_util_Pair', TypeInfo(Androidapi.JNI.Support.Jcore_util_Pair));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JDisplayCutoutCompat', TypeInfo(Androidapi.JNI.Support.JDisplayCutoutCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JDragAndDropPermissionsCompat', TypeInfo(Androidapi.JNI.Support.JDragAndDropPermissionsCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JMenuProvider', TypeInfo(Androidapi.JNI.Support.JMenuProvider));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jview_WindowInsetsCompat', TypeInfo(Androidapi.JNI.Support.Jview_WindowInsetsCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jprovider_DocumentFile', TypeInfo(Androidapi.JNI.Support.Jprovider_DocumentFile));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentTransaction', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentTransaction));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_BackStackRecord', TypeInfo(Androidapi.JNI.Support.Japp_BackStackRecord));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_Fragment', TypeInfo(Androidapi.JNI.Support.Jfragment_app_Fragment));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFragment_AnimationInfo', TypeInfo(Androidapi.JNI.Support.JFragment_AnimationInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFragment_OnStartEnterTransitionListener', TypeInfo(Androidapi.JNI.Support.JFragment_OnStartEnterTransitionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_Fragment_SavedState', TypeInfo(Androidapi.JNI.Support.Jfragment_app_Fragment_SavedState));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentActivity', TypeInfo(Androidapi.JNI.Support.JFragmentActivity));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentContainer', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentContainer));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentController', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentController));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentFactory', TypeInfo(Androidapi.JNI.Support.JFragmentFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentHostCallback', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentHostCallback));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentLifecycleCallbacksDispatcher', TypeInfo(Androidapi.JNI.Support.JFragmentLifecycleCallbacksDispatcher));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentManager', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentManager));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentManager_BackStackEntry', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentManager_BackStackEntry));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentManager_FragmentLifecycleCallbacks', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentManager_FragmentLifecycleCallbacks));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentManager_OnBackStackChangedListener', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentManager_OnBackStackChangedListener));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentManager_OpGenerator', TypeInfo(Androidapi.JNI.Support.JFragmentManager_OpGenerator));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jfragment_app_FragmentManagerNonConfig', TypeInfo(Androidapi.JNI.Support.Jfragment_app_FragmentManagerNonConfig));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentTransaction_Op', TypeInfo(Androidapi.JNI.Support.JFragmentTransaction_Op));
  //TRegTypes.RegisterType('Androidapi.JNI.Support.JFragmentViewLifecycleOwner', TypeInfo(Androidapi.JNI.Support.JFragmentViewLifecycleOwner));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_WakefulBroadcastReceiver', TypeInfo(Androidapi.JNI.Support.Jcontent_WakefulBroadcastReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jloader_app_LoaderManager', TypeInfo(Androidapi.JNI.Support.Jloader_app_LoaderManager));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jloader_app_LoaderManager_LoaderCallbacks', TypeInfo(Androidapi.JNI.Support.Jloader_app_LoaderManager_LoaderCallbacks));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jloader_content_Loader', TypeInfo(Androidapi.JNI.Support.Jloader_content_Loader));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jloader_content_Loader_OnLoadCanceledListener', TypeInfo(Androidapi.JNI.Support.Jloader_content_Loader_OnLoadCanceledListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jloader_content_Loader_OnLoadCompleteListener', TypeInfo(Androidapi.JNI.Support.Jloader_content_Loader_OnLoadCompleteListener));
end;

initialization
  RegisterTypes;
end.


