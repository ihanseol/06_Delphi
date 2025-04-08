{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.AdMob;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Location,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.PlayServices,
  Androidapi.JNI.Util,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JAdError = interface;//com.google.android.gms.ads.AdError
  JAdInspectorError = interface;//com.google.android.gms.ads.AdInspectorError
  JAdListener = interface;//com.google.android.gms.ads.AdListener
  JAdLoadCallback = interface;//com.google.android.gms.ads.AdLoadCallback
  JAdLoader = interface;//com.google.android.gms.ads.AdLoader
  JAdLoader_Builder = interface;//com.google.android.gms.ads.AdLoader$Builder
  JAdRequest = interface;//com.google.android.gms.ads.AdRequest
  JAdRequest_Builder = interface;//com.google.android.gms.ads.AdRequest$Builder
  JAdSize = interface;//com.google.android.gms.ads.AdSize
  JAdValue = interface;//com.google.android.gms.ads.AdValue
  JBaseAdView = interface;//com.google.android.gms.ads.BaseAdView
  JAdView = interface;//com.google.android.gms.ads.AdView
  JAdapterResponseInfo = interface;//com.google.android.gms.ads.AdapterResponseInfo
  JFullScreenContentCallback = interface;//com.google.android.gms.ads.FullScreenContentCallback
  JLoadAdError = interface;//com.google.android.gms.ads.LoadAdError
  JMediaContent = interface;//com.google.android.gms.ads.MediaContent
  JMobileAds = interface;//com.google.android.gms.ads.MobileAds
  JMuteThisAdListener = interface;//com.google.android.gms.ads.MuteThisAdListener
  JMuteThisAdReason = interface;//com.google.android.gms.ads.MuteThisAdReason
  JOnAdInspectorClosedListener = interface;//com.google.android.gms.ads.OnAdInspectorClosedListener
  JOnPaidEventListener = interface;//com.google.android.gms.ads.OnPaidEventListener
  JRequestConfiguration = interface;//com.google.android.gms.ads.RequestConfiguration
  JRequestConfiguration_Builder = interface;//com.google.android.gms.ads.RequestConfiguration$Builder
  JResponseInfo = interface;//com.google.android.gms.ads.ResponseInfo
  Jads_VersionInfo = interface;//com.google.android.gms.ads.VersionInfo
  JVideoController = interface;//com.google.android.gms.ads.VideoController
  JVideoController_VideoLifecycleCallbacks = interface;//com.google.android.gms.ads.VideoController$VideoLifecycleCallbacks
  JVideoOptions = interface;//com.google.android.gms.ads.VideoOptions
  JVideoOptions_Builder = interface;//com.google.android.gms.ads.VideoOptions$Builder
  JAdManagerAdRequest = interface;//com.google.android.gms.ads.admanager.AdManagerAdRequest
  JAdManagerAdRequest_Builder = interface;//com.google.android.gms.ads.admanager.AdManagerAdRequest$Builder
  JAdManagerAdView = interface;//com.google.android.gms.ads.admanager.AdManagerAdView
  Jadmanager_AppEventListener = interface;//com.google.android.gms.ads.admanager.AppEventListener
  JAdManagerAdViewOptions = interface;//com.google.android.gms.ads.formats.AdManagerAdViewOptions
  JAdManagerAdViewOptions_Builder = interface;//com.google.android.gms.ads.formats.AdManagerAdViewOptions$Builder
  JMediaView = interface;//com.google.android.gms.ads.formats.MediaView
  JNativeAd_AdChoicesInfo = interface;//com.google.android.gms.ads.formats.NativeAd$AdChoicesInfo
  JNativeAd_Image = interface;//com.google.android.gms.ads.formats.NativeAd$Image
  JNativeAdOptions = interface;//com.google.android.gms.ads.formats.NativeAdOptions
  JNativeAdOptions_Builder = interface;//com.google.android.gms.ads.formats.NativeAdOptions$Builder
  JNativeCustomTemplateAd = interface;//com.google.android.gms.ads.formats.NativeCustomTemplateAd
  JNativeCustomTemplateAd_DisplayOpenMeasurement = interface;//com.google.android.gms.ads.formats.NativeCustomTemplateAd$DisplayOpenMeasurement
  JNativeCustomTemplateAd_OnCustomClickListener = interface;//com.google.android.gms.ads.formats.NativeCustomTemplateAd$OnCustomClickListener
  JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener = interface;//com.google.android.gms.ads.formats.NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener
  JOnAdManagerAdViewLoadedListener = interface;//com.google.android.gms.ads.formats.OnAdManagerAdViewLoadedListener
  JShouldDelayBannerRenderingListener = interface;//com.google.android.gms.ads.formats.ShouldDelayBannerRenderingListener
  JUnifiedNativeAd = interface;//com.google.android.gms.ads.formats.UnifiedNativeAd
  JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener = interface;//com.google.android.gms.ads.formats.UnifiedNativeAd$OnUnifiedNativeAdLoadedListener
  JUnifiedNativeAd_UnconfirmedClickListener = interface;//com.google.android.gms.ads.formats.UnifiedNativeAd$UnconfirmedClickListener
  JInitializationStatus = interface;//com.google.android.gms.ads.initialization.InitializationStatus
  JOnInitializationCompleteListener = interface;//com.google.android.gms.ads.initialization.OnInitializationCompleteListener
  //Jclient_zza = interface;//com.google.android.gms.ads.internal.client.zza
  //Jclient_zzaz = interface;//com.google.android.gms.ads.internal.client.zzaz
  //Jclient_zzbe = interface;//com.google.android.gms.ads.internal.client.zzbe
  //Jclient_zzbh = interface;//com.google.android.gms.ads.internal.client.zzbh
  //Jclient_zzbk = interface;//com.google.android.gms.ads.internal.client.zzbk
  //Jclient_zzbn = interface;//com.google.android.gms.ads.internal.client.zzbn
  //Jclient_zzbu = interface;//com.google.android.gms.ads.internal.client.zzbu
  //Jclient_zzby = interface;//com.google.android.gms.ads.internal.client.zzby
  //Jclient_zzc = interface;//com.google.android.gms.ads.internal.client.zzc
  //Jclient_zzcb = interface;//com.google.android.gms.ads.internal.client.zzcb
  //Jclient_zzcf = interface;//com.google.android.gms.ads.internal.client.zzcf
  //Jclient_zzci = interface;//com.google.android.gms.ads.internal.client.zzci
  //Jclient_zzdg = interface;//com.google.android.gms.ads.internal.client.zzdg
  //Jclient_zzdn = interface;//com.google.android.gms.ads.internal.client.zzdn
  //Jclient_zzdq = interface;//com.google.android.gms.ads.internal.client.zzdq
  //Jclient_zzdt = interface;//com.google.android.gms.ads.internal.client.zzdt
  //Jclient_zzdu = interface;//com.google.android.gms.ads.internal.client.zzdu
  //Jclient_zzdw = interface;//com.google.android.gms.ads.internal.client.zzdw
  //Jclient_zzdx = interface;//com.google.android.gms.ads.internal.client.zzdx
  //Jclient_zze = interface;//com.google.android.gms.ads.internal.client.zze
  //Jclient_zzea = interface;//com.google.android.gms.ads.internal.client.zzea
  //Jclient_zzfh = interface;//com.google.android.gms.ads.internal.client.zzfh
  //Jclient_zzfl = interface;//com.google.android.gms.ads.internal.client.zzfl
  //Jclient_zzl = interface;//com.google.android.gms.ads.internal.client.zzl
  //Jclient_zzp = interface;//com.google.android.gms.ads.internal.client.zzp
  //Jclient_zzq = interface;//com.google.android.gms.ads.internal.client.zzq
  //Jclient_zzs = interface;//com.google.android.gms.ads.internal.client.zzs
  //Jclient_zzu = interface;//com.google.android.gms.ads.internal.client.zzu
  //Jclient_zzw = interface;//com.google.android.gms.ads.internal.client.zzw
  Jinterstitial_InterstitialAd = interface;//com.google.android.gms.ads.interstitial.InterstitialAd
  JInterstitialAdLoadCallback = interface;//com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback
  Jmediation_MediationAdRequest = interface;//com.google.android.gms.ads.mediation.MediationAdRequest
  JMediationExtrasReceiver = interface;//com.google.android.gms.ads.mediation.MediationExtrasReceiver
  Jmediation_MediationAdapter = interface;//com.google.android.gms.ads.mediation.MediationAdapter
  Jmediation_MediationBannerAdapter = interface;//com.google.android.gms.ads.mediation.MediationBannerAdapter
  Jmediation_MediationBannerListener = interface;//com.google.android.gms.ads.mediation.MediationBannerListener
  Jmediation_MediationInterstitialAdapter = interface;//com.google.android.gms.ads.mediation.MediationInterstitialAdapter
  Jmediation_MediationInterstitialListener = interface;//com.google.android.gms.ads.mediation.MediationInterstitialListener
  JMediationNativeAdapter = interface;//com.google.android.gms.ads.mediation.MediationNativeAdapter
  JMediationNativeListener = interface;//com.google.android.gms.ads.mediation.MediationNativeListener
  JNativeMediationAdRequest = interface;//com.google.android.gms.ads.mediation.NativeMediationAdRequest
  JNetworkExtras = interface;//com.google.android.gms.ads.mediation.NetworkExtras
  JUnifiedNativeAdMapper = interface;//com.google.android.gms.ads.mediation.UnifiedNativeAdMapper
  Jnativead_NativeAd = interface;//com.google.android.gms.ads.nativead.NativeAd
  Jnativead_NativeAd_AdChoicesInfo = interface;//com.google.android.gms.ads.nativead.NativeAd$AdChoicesInfo
  Jnativead_NativeAd_Image = interface;//com.google.android.gms.ads.nativead.NativeAd$Image
  JNativeAd_OnNativeAdLoadedListener = interface;//com.google.android.gms.ads.nativead.NativeAd$OnNativeAdLoadedListener
  JNativeAd_UnconfirmedClickListener = interface;//com.google.android.gms.ads.nativead.NativeAd$UnconfirmedClickListener
  Jnativead_NativeAdOptions = interface;//com.google.android.gms.ads.nativead.NativeAdOptions
  Jnativead_NativeAdOptions_Builder = interface;//com.google.android.gms.ads.nativead.NativeAdOptions$Builder
  JNativeCustomFormatAd = interface;//com.google.android.gms.ads.nativead.NativeCustomFormatAd
  JNativeCustomFormatAd_DisplayOpenMeasurement = interface;//com.google.android.gms.ads.nativead.NativeCustomFormatAd$DisplayOpenMeasurement
  JNativeCustomFormatAd_OnCustomClickListener = interface;//com.google.android.gms.ads.nativead.NativeCustomFormatAd$OnCustomClickListener
  JNativeCustomFormatAd_OnCustomFormatAdLoadedListener = interface;//com.google.android.gms.ads.nativead.NativeCustomFormatAd$OnCustomFormatAdLoadedListener
  JSearchAdRequest = interface;//com.google.android.gms.ads.search.SearchAdRequest
  //Jsearch_zzb = interface;//com.google.android.gms.ads.search.zzb

// ===== Interface declarations =====

  JAdErrorClass = interface(JObjectClass)
    ['{78903148-2EDD-4C82-A5FA-1F0B605B4532}']
    {class} function _GetUNDEFINED_DOMAIN: JString; cdecl;
    {class} function init(i: Integer; string_: JString; string_1: JString): JAdError; cdecl; overload;
    {class} function init(i: Integer; string_: JString; string_1: JString; adError: JAdError): JAdError; cdecl; overload;
    {class} property UNDEFINED_DOMAIN: JString read _GetUNDEFINED_DOMAIN;
  end;

  [JavaSignature('com/google/android/gms/ads/AdError')]
  JAdError = interface(JObject)
    ['{70FB4B50-3EE1-461B-BAFE-FCAA37E89F06}']
    function getCause: JAdError; cdecl;
    function getCode: Integer; cdecl;
    function getDomain: JString; cdecl;
    function getMessage: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJAdError = class(TJavaGenericImport<JAdErrorClass, JAdError>) end;

  JAdInspectorErrorClass = interface(JAdErrorClass)
    ['{F32319A4-7D63-4F83-9506-7C7D1C1FAB92}']
    {class} function _GetERROR_CODE_ALREADY_OPEN: Integer; cdecl;
    {class} function _GetERROR_CODE_FAILED_TO_LOAD: Integer; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NOT_IN_TEST_MODE: Integer; cdecl;
    {class} function init(i: Integer; string_: JString; string_1: JString): JAdInspectorError; cdecl;
    {class} property ERROR_CODE_ALREADY_OPEN: Integer read _GetERROR_CODE_ALREADY_OPEN;
    {class} property ERROR_CODE_FAILED_TO_LOAD: Integer read _GetERROR_CODE_FAILED_TO_LOAD;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_NOT_IN_TEST_MODE: Integer read _GetERROR_CODE_NOT_IN_TEST_MODE;
  end;

  [JavaSignature('com/google/android/gms/ads/AdInspectorError')]
  JAdInspectorError = interface(JAdError)
    ['{E11C06D2-FEE5-4897-B627-712372862BA9}']
    function getCode: Integer; cdecl;
  end;
  TJAdInspectorError = class(TJavaGenericImport<JAdInspectorErrorClass, JAdInspectorError>) end;

  JAdListenerClass = interface(JObjectClass)
    ['{22D3BB99-7931-49A5-B29C-893667600EFD}']
    {class} function init: JAdListener; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdListener')]
  JAdListener = interface(JObject)
    ['{62EE9CD8-6B80-4046-A01D-5AFDFC095925}']
    procedure onAdClicked; cdecl;
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(loadAdError: JLoadAdError); cdecl;
    procedure onAdImpression; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
    procedure onAdSwipeGestureClicked; cdecl;
  end;
  TJAdListener = class(TJavaGenericImport<JAdListenerClass, JAdListener>) end;

  JAdLoadCallbackClass = interface(JObjectClass)
    ['{5BE0F043-DEDD-48ED-989F-18719C1D5EC8}']
    {class} function init: JAdLoadCallback; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdLoadCallback')]
  JAdLoadCallback = interface(JObject)
    ['{D4AC674D-D1BD-47C2-8144-C395D7206C60}']
    procedure onAdFailedToLoad(loadAdError: JLoadAdError); cdecl;
    //procedure onAdLoaded(adT: J); cdecl;
  end;
  TJAdLoadCallback = class(TJavaGenericImport<JAdLoadCallbackClass, JAdLoadCallback>) end;

  JAdLoaderClass = interface(JObjectClass)
    ['{C101BDD4-80DB-4DFC-AD8B-BCB0BF6A1392}']
  end;

  [JavaSignature('com/google/android/gms/ads/AdLoader')]
  JAdLoader = interface(JObject)
    ['{27AC9982-D63C-4BB1-A307-C78F183A3AE7}']
    function isLoading: Boolean; cdecl;
    procedure loadAd(adManagerAdRequest: JAdManagerAdRequest); cdecl; overload;
    procedure loadAd(adRequest: JAdRequest); cdecl; overload;
    procedure loadAds(adRequest: JAdRequest; i: Integer); cdecl;
  end;
  TJAdLoader = class(TJavaGenericImport<JAdLoaderClass, JAdLoader>) end;

  JAdLoader_BuilderClass = interface(JObjectClass)
    ['{0ED5CDD0-EABB-4EC1-8ADA-6D2F7D73FF46}']
    {class} function init(context: JContext; string_: JString): JAdLoader_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdLoader$Builder')]
  JAdLoader_Builder = interface(JObject)
    ['{F2CE438E-E07F-4A82-A90A-91A175B26EED}']
    function build: JAdLoader; cdecl;
    function forCustomFormatAd(string_: JString; onCustomFormatAdLoadedListener: JNativeCustomFormatAd_OnCustomFormatAdLoadedListener; onCustomClickListener: JNativeCustomFormatAd_OnCustomClickListener): JAdLoader_Builder; cdecl;
    function forCustomTemplateAd(string_: JString; onCustomTemplateAdLoadedListener: JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener; onCustomClickListener: JNativeCustomTemplateAd_OnCustomClickListener): JAdLoader_Builder; cdecl;
    function forNativeAd(onNativeAdLoadedListener: JNativeAd_OnNativeAdLoadedListener): JAdLoader_Builder; cdecl;
    function forUnifiedNativeAd(onUnifiedNativeAdLoadedListener: JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener): JAdLoader_Builder; cdecl;
    function withAdListener(adListener: JAdListener): JAdLoader_Builder; cdecl;
    function withAdManagerAdViewOptions(adManagerAdViewOptions: JAdManagerAdViewOptions): JAdLoader_Builder; cdecl;
    function withNativeAdOptions(nativeAdOptions: Jnativead_NativeAdOptions): JAdLoader_Builder; cdecl; overload;
    function withNativeAdOptions(nativeAdOptions: JNativeAdOptions): JAdLoader_Builder; cdecl; overload;
  end;
  TJAdLoader_Builder = class(TJavaGenericImport<JAdLoader_BuilderClass, JAdLoader_Builder>) end;

  JAdRequestClass = interface(JObjectClass)
    ['{83BBA0E5-5A1B-4C4E-8174-BF55FB897504}']
    {class} function _GetDEVICE_ID_EMULATOR: JString; cdecl;
    {class} function _GetERROR_CODE_APP_ID_MISSING: Integer; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_AD_STRING: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetERROR_CODE_MEDIATION_NO_FILL: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NO_FILL: Integer; cdecl;
    {class} function _GetERROR_CODE_REQUEST_ID_MISMATCH: Integer; cdecl;
    {class} function _GetGENDER_FEMALE: Integer; cdecl;
    {class} function _GetGENDER_MALE: Integer; cdecl;
    {class} function _GetGENDER_UNKNOWN: Integer; cdecl;
    {class} function _GetMAX_CONTENT_URL_LENGTH: Integer; cdecl;
    {class} property DEVICE_ID_EMULATOR: JString read _GetDEVICE_ID_EMULATOR;
    {class} property ERROR_CODE_APP_ID_MISSING: Integer read _GetERROR_CODE_APP_ID_MISSING;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_INVALID_AD_STRING: Integer read _GetERROR_CODE_INVALID_AD_STRING;
    {class} property ERROR_CODE_INVALID_REQUEST: Integer read _GetERROR_CODE_INVALID_REQUEST;
    {class} property ERROR_CODE_MEDIATION_NO_FILL: Integer read _GetERROR_CODE_MEDIATION_NO_FILL;
    {class} property ERROR_CODE_NETWORK_ERROR: Integer read _GetERROR_CODE_NETWORK_ERROR;
    {class} property ERROR_CODE_NO_FILL: Integer read _GetERROR_CODE_NO_FILL;
    {class} property ERROR_CODE_REQUEST_ID_MISMATCH: Integer read _GetERROR_CODE_REQUEST_ID_MISMATCH;
    {class} property GENDER_FEMALE: Integer read _GetGENDER_FEMALE;
    {class} property GENDER_MALE: Integer read _GetGENDER_MALE;
    {class} property GENDER_UNKNOWN: Integer read _GetGENDER_UNKNOWN;
    {class} property MAX_CONTENT_URL_LENGTH: Integer read _GetMAX_CONTENT_URL_LENGTH;
  end;

  [JavaSignature('com/google/android/gms/ads/AdRequest')]
  JAdRequest = interface(JObject)
    ['{6A952D89-493B-4EC3-9B2D-419540C3E919}']
    function getAdString: JString; cdecl;
    function getContentUrl: JString; cdecl;
    function getCustomEventExtrasBundle(class_: Jlang_Class): JBundle; cdecl;
    function getCustomTargeting: JBundle; cdecl;
    function getKeywords: JSet; cdecl;
    function getNeighboringContentUrls: JList; cdecl;
    function getNetworkExtrasBundle(class_: Jlang_Class): JBundle; cdecl;
    function getRequestAgent: JString; cdecl;
    function isTestDevice(context: JContext): Boolean; cdecl;
  end;
  TJAdRequest = class(TJavaGenericImport<JAdRequestClass, JAdRequest>) end;

  JAdRequest_BuilderClass = interface(JObjectClass)
    ['{31A61751-C547-4A56-AB61-F867EBA5961D}']
    {class} function init: JAdRequest_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdRequest$Builder')]
  JAdRequest_Builder = interface(JObject)
    ['{983C6775-921E-4A57-B560-F364B7D60ADC}']
    function addCustomEventExtrasBundle(class_: Jlang_Class; bundle: JBundle): JAdRequest_Builder; cdecl;
    function addKeyword(string_: JString): JAdRequest_Builder; cdecl;
    function addNetworkExtrasBundle(class_: Jlang_Class; bundle: JBundle): JAdRequest_Builder; cdecl;
    function build: JAdRequest; cdecl;
    function setAdString(string_: JString): JAdRequest_Builder; cdecl;
    function setContentUrl(string_: JString): JAdRequest_Builder; cdecl;
    function setHttpTimeoutMillis(i: Integer): JAdRequest_Builder; cdecl;
    function setNeighboringContentUrls(list: JList): JAdRequest_Builder; cdecl;
    function setRequestAgent(string_: JString): JAdRequest_Builder; cdecl;
  end;
  TJAdRequest_Builder = class(TJavaGenericImport<JAdRequest_BuilderClass, JAdRequest_Builder>) end;

  JAdSizeClass = interface(JObjectClass)
    ['{3A15A6B8-8EB9-49BA-9FD9-6B8D507F7707}']
    {class} function _GetAUTO_HEIGHT: Integer; cdecl;
    {class} function _GetBANNER: JAdSize; cdecl;
    {class} function _GetFLUID: JAdSize; cdecl;
    {class} function _GetFULL_BANNER: JAdSize; cdecl;
    {class} function _GetFULL_WIDTH: Integer; cdecl;
    {class} function _GetINVALID: JAdSize; cdecl;
    {class} function _GetLARGE_BANNER: JAdSize; cdecl;
    {class} function _GetLEADERBOARD: JAdSize; cdecl;
    {class} function _GetMEDIUM_RECTANGLE: JAdSize; cdecl;
    {class} function _GetSEARCH: JAdSize; cdecl;
    {class} function _GetSMART_BANNER: JAdSize; cdecl;
    {class} function _GetWIDE_SKYSCRAPER: JAdSize; cdecl;
    {class} function getCurrentOrientationAnchoredAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getCurrentOrientationInlineAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getCurrentOrientationInterscrollerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getInlineAdaptiveBannerAdSize(i: Integer; i1: Integer): JAdSize; cdecl;
    {class} function getLandscapeAnchoredAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getLandscapeInlineAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getLandscapeInterscrollerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getPortraitAnchoredAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getPortraitInlineAdaptiveBannerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function getPortraitInterscrollerAdSize(context: JContext; i: Integer): JAdSize; cdecl;
    {class} function init(i: Integer; i1: Integer): JAdSize; cdecl; overload;
    {class} property AUTO_HEIGHT: Integer read _GetAUTO_HEIGHT;
    {class} property BANNER: JAdSize read _GetBANNER;
    {class} property FLUID: JAdSize read _GetFLUID;
    {class} property FULL_BANNER: JAdSize read _GetFULL_BANNER;
    {class} property FULL_WIDTH: Integer read _GetFULL_WIDTH;
    {class} property INVALID: JAdSize read _GetINVALID;
    {class} property LARGE_BANNER: JAdSize read _GetLARGE_BANNER;
    {class} property LEADERBOARD: JAdSize read _GetLEADERBOARD;
    {class} property MEDIUM_RECTANGLE: JAdSize read _GetMEDIUM_RECTANGLE;
    {class} property SEARCH: JAdSize read _GetSEARCH;
    {class} property SMART_BANNER: JAdSize read _GetSMART_BANNER;
    {class} property WIDE_SKYSCRAPER: JAdSize read _GetWIDE_SKYSCRAPER;
  end;

  [JavaSignature('com/google/android/gms/ads/AdSize')]
  JAdSize = interface(JObject)
    ['{6A30E519-3C74-464C-B145-C0A6A02B3093}']
    function equals(object_: JObject): Boolean; cdecl;
    function getHeight: Integer; cdecl;
    function getHeightInPixels(context: JContext): Integer; cdecl;
    function getWidth: Integer; cdecl;
    function getWidthInPixels(context: JContext): Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAutoHeight: Boolean; cdecl;
    function isFluid: Boolean; cdecl;
    function isFullWidth: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJAdSize = class(TJavaGenericImport<JAdSizeClass, JAdSize>) end;

  JAdValueClass = interface(JObjectClass)
    ['{BC8C0529-48A0-45D9-A518-8BC55B64785F}']
  end;

  [JavaSignature('com/google/android/gms/ads/AdValue')]
  JAdValue = interface(JObject)
    ['{1609B647-B6F3-4275-8B89-3E695A6FA9CE}']
    function getCurrencyCode: JString; cdecl;
    function getPrecisionType: Integer; cdecl;
    function getValueMicros: Int64; cdecl;
  end;
  TJAdValue = class(TJavaGenericImport<JAdValueClass, JAdValue>) end;

  JBaseAdViewClass = interface(JViewGroupClass)
    ['{D9CDE901-0B35-480E-81D0-4A45C7D6C856}']
  end;

  [JavaSignature('com/google/android/gms/ads/BaseAdView')]
  JBaseAdView = interface(JViewGroup)
    ['{B279FD2D-B14F-410F-944A-6464CD214C55}']
    procedure destroy; cdecl;
    function getAdListener: JAdListener; cdecl;
    function getAdSize: JAdSize; cdecl;
    function getAdUnitId: JString; cdecl;
    function getOnPaidEventListener: JOnPaidEventListener; cdecl;
    function getResponseInfo: JResponseInfo; cdecl;
    function isLoading: Boolean; cdecl;
    procedure loadAd(adRequest: JAdRequest); cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdSize(adSize: JAdSize); cdecl;
    procedure setAdUnitId(string_: JString); cdecl;
    procedure setOnPaidEventListener(onPaidEventListener: JOnPaidEventListener); cdecl;
  end;
  TJBaseAdView = class(TJavaGenericImport<JBaseAdViewClass, JBaseAdView>) end;

  JAdViewClass = interface(JBaseAdViewClass)
    ['{D2A51E0D-437B-4F72-8826-BCCCBF315647}']
    {class} function init(context: JContext): JAdView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet): JAdView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet; i: Integer): JAdView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/AdView')]
  JAdView = interface(JBaseAdView)
    ['{58156621-09A0-4178-81FD-9349FD929B6B}']
    function zza: JVideoController; cdecl;
  end;
  TJAdView = class(TJavaGenericImport<JAdViewClass, JAdView>) end;

  JAdapterResponseInfoClass = interface(JObjectClass)
    ['{2E6E1469-DB03-4DCF-B96A-70498B3F3B13}']
  end;

  [JavaSignature('com/google/android/gms/ads/AdapterResponseInfo')]
  JAdapterResponseInfo = interface(JObject)
    ['{7DCC1707-0F6E-4489-B1A5-314A343776F0}']
    function getAdError: JAdError; cdecl;
    function getAdSourceId: JString; cdecl;
    function getAdSourceInstanceId: JString; cdecl;
    function getAdSourceInstanceName: JString; cdecl;
    function getAdSourceName: JString; cdecl;
    function getAdapterClassName: JString; cdecl;
    function getCredentials: JBundle; cdecl;
    function getLatencyMillis: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJAdapterResponseInfo = class(TJavaGenericImport<JAdapterResponseInfoClass, JAdapterResponseInfo>) end;

  JFullScreenContentCallbackClass = interface(JObjectClass)
    ['{4AE5DFFF-D055-4899-B45C-6E0A3FB46294}']
    {class} function _GetERROR_CODE_AD_REUSED: Integer; cdecl;
    {class} function _GetERROR_CODE_APP_NOT_FOREGROUND: Integer; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_MEDIATION_SHOW_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NOT_READY: Integer; cdecl;
    {class} function init: JFullScreenContentCallback; cdecl;
    {class} property ERROR_CODE_AD_REUSED: Integer read _GetERROR_CODE_AD_REUSED;
    {class} property ERROR_CODE_APP_NOT_FOREGROUND: Integer read _GetERROR_CODE_APP_NOT_FOREGROUND;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_MEDIATION_SHOW_ERROR: Integer read _GetERROR_CODE_MEDIATION_SHOW_ERROR;
    {class} property ERROR_CODE_NOT_READY: Integer read _GetERROR_CODE_NOT_READY;
  end;

  [JavaSignature('com/google/android/gms/ads/FullScreenContentCallback')]
  JFullScreenContentCallback = interface(JObject)
    ['{BC938920-F8A2-4DEF-8AD2-58A25158C597}']
    procedure onAdClicked; cdecl;
    procedure onAdDismissedFullScreenContent; cdecl;
    procedure onAdFailedToShowFullScreenContent(adError: JAdError); cdecl;
    procedure onAdImpression; cdecl;
    procedure onAdShowedFullScreenContent; cdecl;
  end;
  TJFullScreenContentCallback = class(TJavaGenericImport<JFullScreenContentCallbackClass, JFullScreenContentCallback>) end;

  JLoadAdErrorClass = interface(JAdErrorClass)
    ['{7BDC9D6B-A9BF-4BA6-97EC-58E5DA6CC6AE}']
    {class} function init(i: Integer; string_: JString; string_1: JString; adError: JAdError; responseInfo: JResponseInfo): JLoadAdError; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/LoadAdError')]
  JLoadAdError = interface(JAdError)
    ['{5D61E232-CDDB-4DA1-8D01-EF23F3A469BD}']
    function getResponseInfo: JResponseInfo; cdecl;
    function toString: JString; cdecl;
    function zzb: JJSONObject; cdecl;
  end;
  TJLoadAdError = class(TJavaGenericImport<JLoadAdErrorClass, JLoadAdError>) end;

  JMediaContentClass = interface(IJavaClass)
    ['{09E7B007-922A-4461-8B89-1C43B073DCB8}']
  end;

  [JavaSignature('com/google/android/gms/ads/MediaContent')]
  JMediaContent = interface(IJavaInstance)
    ['{512105DF-EF07-412F-B3DE-4BE73B1851F4}']
    function getAspectRatio: Single; cdecl;
    function getCurrentTime: Single; cdecl;
    function getDuration: Single; cdecl;
    function getMainImage: JDrawable; cdecl;
    function getVideoController: JVideoController; cdecl;
    function hasVideoContent: Boolean; cdecl;
    procedure setMainImage(drawable: JDrawable); cdecl;
  end;
  TJMediaContent = class(TJavaGenericImport<JMediaContentClass, JMediaContent>) end;

  JMobileAdsClass = interface(JObjectClass)
    ['{3D93A524-A1F1-463F-9892-40911A24B89F}']
    {class} function _GetERROR_DOMAIN: JString; cdecl;
    {class} procedure disableMediationAdapterInitialization(context: JContext); cdecl;
    {class} procedure enableSameAppKey(b: Boolean); cdecl;
    {class} function getInitializationStatus: JInitializationStatus; cdecl;
    {class} function getRequestConfiguration: JRequestConfiguration; cdecl;
    {class} function getVersion: Jads_VersionInfo; cdecl;
    {class} procedure initialize(context: JContext); cdecl; overload;
    {class} procedure initialize(context: JContext; onInitializationCompleteListener: JOnInitializationCompleteListener); cdecl; overload;
    {class} procedure openAdInspector(context: JContext; onAdInspectorClosedListener: JOnAdInspectorClosedListener); cdecl;
    {class} procedure openDebugMenu(context: JContext; string_: JString); cdecl;
    {class} procedure registerRtbAdapter(class_: Jlang_Class); cdecl;
    {class} procedure registerWebView(webView: JWebView); cdecl;
    {class} procedure setAppMuted(b: Boolean); cdecl;
    {class} procedure setAppVolume(f: Single); cdecl;
    {class} procedure setRequestConfiguration(requestConfiguration: JRequestConfiguration); cdecl;
    {class} property ERROR_DOMAIN: JString read _GetERROR_DOMAIN;
  end;

  [JavaSignature('com/google/android/gms/ads/MobileAds')]
  JMobileAds = interface(JObject)
    ['{A32AC866-E4AD-483B-B67B-AA22020169EE}']
  end;
  TJMobileAds = class(TJavaGenericImport<JMobileAdsClass, JMobileAds>) end;

  JMuteThisAdListenerClass = interface(IJavaClass)
    ['{76E9FA8B-CC8C-4E01-8D4D-6C6C66F29A5F}']
  end;

  [JavaSignature('com/google/android/gms/ads/MuteThisAdListener')]
  JMuteThisAdListener = interface(IJavaInstance)
    ['{D02DD772-9B10-4793-8666-4B6413F3EA20}']
    procedure onAdMuted; cdecl;
  end;
  TJMuteThisAdListener = class(TJavaGenericImport<JMuteThisAdListenerClass, JMuteThisAdListener>) end;

  JMuteThisAdReasonClass = interface(IJavaClass)
    ['{78EC50FA-9BBD-4B65-84F1-8ACBC0A36671}']
  end;

  [JavaSignature('com/google/android/gms/ads/MuteThisAdReason')]
  JMuteThisAdReason = interface(IJavaInstance)
    ['{4A38C1D0-3156-4270-8843-72115092C4CF}']
    function getDescription: JString; cdecl;
  end;
  TJMuteThisAdReason = class(TJavaGenericImport<JMuteThisAdReasonClass, JMuteThisAdReason>) end;

  JOnAdInspectorClosedListenerClass = interface(IJavaClass)
    ['{E252ED93-92AA-4C34-8250-AF40380E1126}']
  end;

  [JavaSignature('com/google/android/gms/ads/OnAdInspectorClosedListener')]
  JOnAdInspectorClosedListener = interface(IJavaInstance)
    ['{B54491B4-5480-4A20-AD23-CCB96CB046A0}']
    procedure onAdInspectorClosed(adInspectorError: JAdInspectorError); cdecl;
  end;
  TJOnAdInspectorClosedListener = class(TJavaGenericImport<JOnAdInspectorClosedListenerClass, JOnAdInspectorClosedListener>) end;

  JOnPaidEventListenerClass = interface(IJavaClass)
    ['{C843CA6F-265F-4FAD-92F2-C53EF38C11E6}']
  end;

  [JavaSignature('com/google/android/gms/ads/OnPaidEventListener')]
  JOnPaidEventListener = interface(IJavaInstance)
    ['{BFC46E7C-7DA3-429A-9FBA-38A99261B5F8}']
    procedure onPaidEvent(adValue: JAdValue); cdecl;
  end;
  TJOnPaidEventListener = class(TJavaGenericImport<JOnPaidEventListenerClass, JOnPaidEventListener>) end;

  JRequestConfigurationClass = interface(JObjectClass)
    ['{D7012D76-D59A-434B-B99D-AC35A122F1D4}']
    {class} function _GetMAX_AD_CONTENT_RATING_G: JString; cdecl;
    {class} function _GetMAX_AD_CONTENT_RATING_MA: JString; cdecl;
    {class} function _GetMAX_AD_CONTENT_RATING_PG: JString; cdecl;
    {class} function _GetMAX_AD_CONTENT_RATING_T: JString; cdecl;
    {class} function _GetMAX_AD_CONTENT_RATING_UNSPECIFIED: JString; cdecl;
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE: Integer; cdecl;
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE: Integer; cdecl;
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED: Integer; cdecl;
    {class} function _GetTAG_FOR_UNDER_AGE_OF_CONSENT_FALSE: Integer; cdecl;
    {class} function _GetTAG_FOR_UNDER_AGE_OF_CONSENT_TRUE: Integer; cdecl;
    {class} function _GetTAG_FOR_UNDER_AGE_OF_CONSENT_UNSPECIFIED: Integer; cdecl;
    {class} property MAX_AD_CONTENT_RATING_G: JString read _GetMAX_AD_CONTENT_RATING_G;
    {class} property MAX_AD_CONTENT_RATING_MA: JString read _GetMAX_AD_CONTENT_RATING_MA;
    {class} property MAX_AD_CONTENT_RATING_PG: JString read _GetMAX_AD_CONTENT_RATING_PG;
    {class} property MAX_AD_CONTENT_RATING_T: JString read _GetMAX_AD_CONTENT_RATING_T;
    {class} property MAX_AD_CONTENT_RATING_UNSPECIFIED: JString read _GetMAX_AD_CONTENT_RATING_UNSPECIFIED;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED;
    {class} property TAG_FOR_UNDER_AGE_OF_CONSENT_FALSE: Integer read _GetTAG_FOR_UNDER_AGE_OF_CONSENT_FALSE;
    {class} property TAG_FOR_UNDER_AGE_OF_CONSENT_TRUE: Integer read _GetTAG_FOR_UNDER_AGE_OF_CONSENT_TRUE;
    {class} property TAG_FOR_UNDER_AGE_OF_CONSENT_UNSPECIFIED: Integer read _GetTAG_FOR_UNDER_AGE_OF_CONSENT_UNSPECIFIED;
  end;

  [JavaSignature('com/google/android/gms/ads/RequestConfiguration')]
  JRequestConfiguration = interface(JObject)
    ['{87413AEC-7DB6-4352-AB6D-F7BA1060D46E}']
    function getMaxAdContentRating: JString; cdecl;
    function getTagForChildDirectedTreatment: Integer; cdecl;
    function getTagForUnderAgeOfConsent: Integer; cdecl;
    function getTestDeviceIds: JList; cdecl;
    function toBuilder: JRequestConfiguration_Builder; cdecl;
  end;
  TJRequestConfiguration = class(TJavaGenericImport<JRequestConfigurationClass, JRequestConfiguration>) end;

  JRequestConfiguration_BuilderClass = interface(JObjectClass)
    ['{7502C2A5-9CE7-4393-955F-09AA71D147A9}']
    {class} function init: JRequestConfiguration_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/RequestConfiguration$Builder')]
  JRequestConfiguration_Builder = interface(JObject)
    ['{CDFD4672-779C-49D4-8132-E59394CB0460}']
    function build: JRequestConfiguration; cdecl;
    function setMaxAdContentRating(string_: JString): JRequestConfiguration_Builder; cdecl;
    function setTagForChildDirectedTreatment(i: Integer): JRequestConfiguration_Builder; cdecl;
    function setTagForUnderAgeOfConsent(i: Integer): JRequestConfiguration_Builder; cdecl;
    function setTestDeviceIds(list: JList): JRequestConfiguration_Builder; cdecl;
  end;
  TJRequestConfiguration_Builder = class(TJavaGenericImport<JRequestConfiguration_BuilderClass, JRequestConfiguration_Builder>) end;

  JResponseInfoClass = interface(JObjectClass)
    ['{DA46688A-5AC8-4B3B-9873-8DA7862C8578}']
  end;

  [JavaSignature('com/google/android/gms/ads/ResponseInfo')]
  JResponseInfo = interface(JObject)
    ['{5847783B-0E9B-45E3-B1E2-9525462C1F50}']
    function getAdapterResponses: JList; cdecl;
    function getLoadedAdapterResponseInfo: JAdapterResponseInfo; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    function getResponseExtras: JBundle; cdecl;
    function getResponseId: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJResponseInfo = class(TJavaGenericImport<JResponseInfoClass, JResponseInfo>) end;

  Jads_VersionInfoClass = interface(JObjectClass)
    ['{4CC1A33E-6AFE-4BFD-B277-8F59B473C0C4}']
    {class} function init(i: Integer; i1: Integer; i2: Integer): Jads_VersionInfo; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/VersionInfo')]
  Jads_VersionInfo = interface(JObject)
    ['{6134EB85-93F7-4E29-883E-225CF1406398}']
    function getMajorVersion: Integer; cdecl;
    function getMicroVersion: Integer; cdecl;
    function getMinorVersion: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJads_VersionInfo = class(TJavaGenericImport<Jads_VersionInfoClass, Jads_VersionInfo>) end;

  JVideoControllerClass = interface(JObjectClass)
    ['{B40803A8-D03C-4A3C-B7D3-05594134412C}']
    {class} function _GetPLAYBACK_STATE_ENDED: Integer; cdecl;
    {class} function _GetPLAYBACK_STATE_PAUSED: Integer; cdecl;
    {class} function _GetPLAYBACK_STATE_PLAYING: Integer; cdecl;
    {class} function _GetPLAYBACK_STATE_READY: Integer; cdecl;
    {class} function _GetPLAYBACK_STATE_UNKNOWN: Integer; cdecl;
    {class} function init: JVideoController; cdecl;
    {class} property PLAYBACK_STATE_ENDED: Integer read _GetPLAYBACK_STATE_ENDED;
    {class} property PLAYBACK_STATE_PAUSED: Integer read _GetPLAYBACK_STATE_PAUSED;
    {class} property PLAYBACK_STATE_PLAYING: Integer read _GetPLAYBACK_STATE_PLAYING;
    {class} property PLAYBACK_STATE_READY: Integer read _GetPLAYBACK_STATE_READY;
    {class} property PLAYBACK_STATE_UNKNOWN: Integer read _GetPLAYBACK_STATE_UNKNOWN;
  end;

  [JavaSignature('com/google/android/gms/ads/VideoController')]
  JVideoController = interface(JObject)
    ['{DB81E433-4245-4D6B-BA13-5A30A7105695}']
    function getPlaybackState: Integer; cdecl;
    function getVideoLifecycleCallbacks: JVideoController_VideoLifecycleCallbacks; cdecl;
    function hasVideoContent: Boolean; cdecl;
    function isClickToExpandEnabled: Boolean; cdecl;
    function isCustomControlsEnabled: Boolean; cdecl;
    function isMuted: Boolean; cdecl;
    procedure mute(b: Boolean); cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure setVideoLifecycleCallbacks(videoLifecycleCallbacks: JVideoController_VideoLifecycleCallbacks); cdecl;
    procedure stop; cdecl;
  end;
  TJVideoController = class(TJavaGenericImport<JVideoControllerClass, JVideoController>) end;

  JVideoController_VideoLifecycleCallbacksClass = interface(JObjectClass)
    ['{AA3C3330-33F5-4C9D-92AA-64BCF2D5DB37}']
    {class} function init: JVideoController_VideoLifecycleCallbacks; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/VideoController$VideoLifecycleCallbacks')]
  JVideoController_VideoLifecycleCallbacks = interface(JObject)
    ['{749DC977-CCFE-49E6-A135-6AA507FEF9AA}']
    procedure onVideoEnd; cdecl;
    procedure onVideoMute(b: Boolean); cdecl;
    procedure onVideoPause; cdecl;
    procedure onVideoPlay; cdecl;
    procedure onVideoStart; cdecl;
  end;
  TJVideoController_VideoLifecycleCallbacks = class(TJavaGenericImport<JVideoController_VideoLifecycleCallbacksClass, JVideoController_VideoLifecycleCallbacks>) end;

  JVideoOptionsClass = interface(JObjectClass)
    ['{0BAAEE8B-3D12-48E0-9AE1-DE86CBB30E21}']
  end;

  [JavaSignature('com/google/android/gms/ads/VideoOptions')]
  JVideoOptions = interface(JObject)
    ['{670CDDED-CA2E-4479-B895-BF57C42BAF94}']
    function getClickToExpandRequested: Boolean; cdecl;
    function getCustomControlsRequested: Boolean; cdecl;
    function getStartMuted: Boolean; cdecl;
  end;
  TJVideoOptions = class(TJavaGenericImport<JVideoOptionsClass, JVideoOptions>) end;

  JVideoOptions_BuilderClass = interface(JObjectClass)
    ['{A1B136B1-E4D5-4E96-A3B3-0B7324091EA0}']
    {class} function init: JVideoOptions_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/VideoOptions$Builder')]
  JVideoOptions_Builder = interface(JObject)
    ['{23B5B3BB-4F1A-4B7C-BC68-DAB01142ADA4}']
    function build: JVideoOptions; cdecl;
    function setClickToExpandRequested(b: Boolean): JVideoOptions_Builder; cdecl;
    function setCustomControlsRequested(b: Boolean): JVideoOptions_Builder; cdecl;
    function setStartMuted(b: Boolean): JVideoOptions_Builder; cdecl;
  end;
  TJVideoOptions_Builder = class(TJavaGenericImport<JVideoOptions_BuilderClass, JVideoOptions_Builder>) end;

  JAdManagerAdRequestClass = interface(JAdRequestClass)
    ['{8E42703E-BFF3-47D3-8F96-051881577F4F}']
  end;

  [JavaSignature('com/google/android/gms/ads/admanager/AdManagerAdRequest')]
  JAdManagerAdRequest = interface(JAdRequest)
    ['{71E6F778-E11E-4E68-BE10-8A505B234998}']
    function getCustomTargeting: JBundle; cdecl;
    function getPublisherProvidedId: JString; cdecl;
  end;
  TJAdManagerAdRequest = class(TJavaGenericImport<JAdManagerAdRequestClass, JAdManagerAdRequest>) end;

  JAdManagerAdRequest_BuilderClass = interface(JAdRequest_BuilderClass)
    ['{0BFC5AC0-B0E5-42B2-A414-17EEC263834D}']
    {class} function init: JAdManagerAdRequest_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/admanager/AdManagerAdRequest$Builder')]
  JAdManagerAdRequest_Builder = interface(JAdRequest_Builder)
    ['{9950ED86-37FA-41E8-9400-07B509268B73}']
    function addCategoryExclusion(string_: JString): JAdManagerAdRequest_Builder; cdecl;
    function addCustomTargeting(string_: JString; list: JList): JAdManagerAdRequest_Builder; cdecl; overload;
    function addCustomTargeting(string_: JString; string_1: JString): JAdManagerAdRequest_Builder; cdecl; overload;
    function build: JAdRequest; cdecl;
    function setPublisherProvidedId(string_: JString): JAdManagerAdRequest_Builder; cdecl;
  end;
  TJAdManagerAdRequest_Builder = class(TJavaGenericImport<JAdManagerAdRequest_BuilderClass, JAdManagerAdRequest_Builder>) end;

  JAdManagerAdViewClass = interface(JBaseAdViewClass)
    ['{69236534-6550-4516-901E-9D03EFD8016F}']
    {class} function init(context: JContext): JAdManagerAdView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet): JAdManagerAdView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet; i: Integer): JAdManagerAdView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/admanager/AdManagerAdView')]
  JAdManagerAdView = interface(JBaseAdView)
    ['{FB4BE702-17B4-4EF7-8F60-8CD244AB55AC}']
    function getAdSizes: TJavaObjectArray<JAdSize>; cdecl;
    function getAppEventListener: Jadmanager_AppEventListener; cdecl;
    function getVideoController: JVideoController; cdecl;
    function getVideoOptions: JVideoOptions; cdecl;
    procedure loadAd(adManagerAdRequest: JAdManagerAdRequest); cdecl;
    procedure recordManualImpression; cdecl;
    procedure setAppEventListener(appEventListener: Jadmanager_AppEventListener); cdecl;
    procedure setManualImpressionsEnabled(b: Boolean); cdecl;
    procedure setVideoOptions(videoOptions: JVideoOptions); cdecl;
  end;
  TJAdManagerAdView = class(TJavaGenericImport<JAdManagerAdViewClass, JAdManagerAdView>) end;

  Jadmanager_AppEventListenerClass = interface(IJavaClass)
    ['{4F0CB424-EC17-4384-8010-8BCCA56E7FE7}']
  end;

  [JavaSignature('com/google/android/gms/ads/admanager/AppEventListener')]
  Jadmanager_AppEventListener = interface(IJavaInstance)
    ['{A5E42D4D-B87F-46C5-8EFE-2E9D38098053}']
    procedure onAppEvent(string_: JString; string_1: JString); cdecl;
  end;
  TJadmanager_AppEventListener = class(TJavaGenericImport<Jadmanager_AppEventListenerClass, Jadmanager_AppEventListener>) end;

  JAdManagerAdViewOptionsClass = interface(JAbstractSafeParcelableClass)
    ['{CAF8D0A2-AA62-4233-8741-A320AA167D9C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/AdManagerAdViewOptions')]
  JAdManagerAdViewOptions = interface(JAbstractSafeParcelable)
    ['{ACD06150-4EC4-4CBE-B058-46FB181EA40C}']
    function getManualImpressionsEnabled: Boolean; cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJAdManagerAdViewOptions = class(TJavaGenericImport<JAdManagerAdViewOptionsClass, JAdManagerAdViewOptions>) end;

  JAdManagerAdViewOptions_BuilderClass = interface(JObjectClass)
    ['{48F5813F-7F2F-4601-A446-F03A574ED39A}']
    {class} function init: JAdManagerAdViewOptions_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/AdManagerAdViewOptions$Builder')]
  JAdManagerAdViewOptions_Builder = interface(JObject)
    ['{59CB3E63-BF75-423C-9E8D-702B764587F2}']
    function build: JAdManagerAdViewOptions; cdecl;
    function setManualImpressionsEnabled(b: Boolean): JAdManagerAdViewOptions_Builder; cdecl;
    function setShouldDelayBannerRenderingListener(shouldDelayBannerRenderingListener: JShouldDelayBannerRenderingListener): JAdManagerAdViewOptions_Builder; cdecl;
  end;
  TJAdManagerAdViewOptions_Builder = class(TJavaGenericImport<JAdManagerAdViewOptions_BuilderClass, JAdManagerAdViewOptions_Builder>) end;

  JMediaViewClass = interface(JFrameLayoutClass)
    ['{F43BBF8B-F284-44F2-B820-B65DAA019FD1}']
    {class} function init(context: JContext): JMediaView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet): JMediaView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet; i: Integer): JMediaView; cdecl; overload;
    {class} function init(context: JContext; attributeSet: JAttributeSet; i: Integer; i1: Integer): JMediaView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/MediaView')]
  JMediaView = interface(JFrameLayout)
    ['{AD776CC1-67B5-4A03-AB58-6BC60C099D1F}']
    procedure setImageScaleType(scaleType: JImageView_ScaleType); cdecl;
    procedure setMediaContent(mediaContent: JMediaContent); cdecl;
  end;
  TJMediaView = class(TJavaGenericImport<JMediaViewClass, JMediaView>) end;

  JNativeAd_AdChoicesInfoClass = interface(JObjectClass)
    ['{C2EF5AD3-7427-42C8-B345-E7BDF4EAED7D}']
    {class} function init: JNativeAd_AdChoicesInfo; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeAd$AdChoicesInfo')]
  JNativeAd_AdChoicesInfo = interface(JObject)
    ['{EDE6E626-EDDA-4E52-99B1-83D5FB6A03E3}']
    function getImages: JList; cdecl;
    function getText: JCharSequence; cdecl;
  end;
  TJNativeAd_AdChoicesInfo = class(TJavaGenericImport<JNativeAd_AdChoicesInfoClass, JNativeAd_AdChoicesInfo>) end;

  JNativeAd_ImageClass = interface(JObjectClass)
    ['{D215B653-3257-421A-BB4A-48B80C28E8B3}']
    {class} function init: JNativeAd_Image; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeAd$Image')]
  JNativeAd_Image = interface(JObject)
    ['{C4AE857D-F323-4B3B-BB9B-189E124739AA}']
    function getDrawable: JDrawable; cdecl;
    function getScale: Double; cdecl;
    function getUri: Jnet_Uri; cdecl;
    function zza: Integer; cdecl;
    function zzb: Integer; cdecl;
  end;
  TJNativeAd_Image = class(TJavaGenericImport<JNativeAd_ImageClass, JNativeAd_Image>) end;

  JNativeAdOptionsClass = interface(JObjectClass)
    ['{3F41235C-F359-441E-B82E-E3B3771A27CC}']
    {class} function _GetADCHOICES_BOTTOM_LEFT: Integer; cdecl;
    {class} function _GetADCHOICES_BOTTOM_RIGHT: Integer; cdecl;
    {class} function _GetADCHOICES_TOP_LEFT: Integer; cdecl;
    {class} function _GetADCHOICES_TOP_RIGHT: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_ANY: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_PORTRAIT: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_SQUARE: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_UNKNOWN: Integer; cdecl;
    {class} function _GetORIENTATION_ANY: Integer; cdecl;
    {class} function _GetORIENTATION_LANDSCAPE: Integer; cdecl;
    {class} function _GetORIENTATION_PORTRAIT: Integer; cdecl;
    {class} property ADCHOICES_BOTTOM_LEFT: Integer read _GetADCHOICES_BOTTOM_LEFT;
    {class} property ADCHOICES_BOTTOM_RIGHT: Integer read _GetADCHOICES_BOTTOM_RIGHT;
    {class} property ADCHOICES_TOP_LEFT: Integer read _GetADCHOICES_TOP_LEFT;
    {class} property ADCHOICES_TOP_RIGHT: Integer read _GetADCHOICES_TOP_RIGHT;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_ANY: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_ANY;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_PORTRAIT: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_PORTRAIT;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_SQUARE: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_SQUARE;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_UNKNOWN: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_UNKNOWN;
    {class} property ORIENTATION_ANY: Integer read _GetORIENTATION_ANY;
    {class} property ORIENTATION_LANDSCAPE: Integer read _GetORIENTATION_LANDSCAPE;
    {class} property ORIENTATION_PORTRAIT: Integer read _GetORIENTATION_PORTRAIT;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeAdOptions')]
  JNativeAdOptions = interface(JObject)
    ['{C0175877-FCF9-4AC7-9EC6-DCA0599B924F}']
    function getAdChoicesPlacement: Integer; cdecl;
    function getImageOrientation: Integer; cdecl;
    function getMediaAspectRatio: Integer; cdecl;
    function getVideoOptions: JVideoOptions; cdecl;
    function shouldRequestMultipleImages: Boolean; cdecl;
    function shouldReturnUrlsForImageAssets: Boolean; cdecl;
    function zza: Boolean; cdecl;
  end;
  TJNativeAdOptions = class(TJavaGenericImport<JNativeAdOptionsClass, JNativeAdOptions>) end;

  JNativeAdOptions_BuilderClass = interface(JObjectClass)
    ['{1B00FF73-D2D9-4EFE-B9FE-C2D4653654DA}']
    {class} function init: JNativeAdOptions_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeAdOptions$Builder')]
  JNativeAdOptions_Builder = interface(JObject)
    ['{6F1BE2EE-1D44-4164-B84F-8691F2C86899}']
    function build: JNativeAdOptions; cdecl;
    function setAdChoicesPlacement(i: Integer): JNativeAdOptions_Builder; cdecl;
    function setImageOrientation(i: Integer): JNativeAdOptions_Builder; cdecl;
    function setMediaAspectRatio(i: Integer): JNativeAdOptions_Builder; cdecl;
    function setRequestCustomMuteThisAd(b: Boolean): JNativeAdOptions_Builder; cdecl;
    function setRequestMultipleImages(b: Boolean): JNativeAdOptions_Builder; cdecl;
    function setReturnUrlsForImageAssets(b: Boolean): JNativeAdOptions_Builder; cdecl;
    function setVideoOptions(videoOptions: JVideoOptions): JNativeAdOptions_Builder; cdecl;
  end;
  TJNativeAdOptions_Builder = class(TJavaGenericImport<JNativeAdOptions_BuilderClass, JNativeAdOptions_Builder>) end;

  JNativeCustomTemplateAdClass = interface(IJavaClass)
    ['{B600216B-B510-4684-9F6E-1BBF6C86C3D2}']
    {class} function _GetASSET_NAME_VIDEO: JString; cdecl;
    {class} property ASSET_NAME_VIDEO: JString read _GetASSET_NAME_VIDEO;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeCustomTemplateAd')]
  JNativeCustomTemplateAd = interface(IJavaInstance)
    ['{92016655-285A-4A5D-830E-9F8184E865F8}']
    procedure destroy; cdecl;
    function getAvailableAssetNames: JList; cdecl;
    function getCustomTemplateId: JString; cdecl;
    function getDisplayOpenMeasurement: JNativeCustomTemplateAd_DisplayOpenMeasurement; cdecl;
    function getImage(string_: JString): JNativeAd_Image; cdecl;
    function getText(string_: JString): JCharSequence; cdecl;
    function getVideoController: JVideoController; cdecl;
    function getVideoMediaView: JMediaView; cdecl;
    procedure performClick(string_: JString); cdecl;
    procedure recordImpression; cdecl;
  end;
  TJNativeCustomTemplateAd = class(TJavaGenericImport<JNativeCustomTemplateAdClass, JNativeCustomTemplateAd>) end;

  JNativeCustomTemplateAd_DisplayOpenMeasurementClass = interface(IJavaClass)
    ['{C8786937-0980-405C-BF0A-AD25FD2A60D1}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeCustomTemplateAd$DisplayOpenMeasurement')]
  JNativeCustomTemplateAd_DisplayOpenMeasurement = interface(IJavaInstance)
    ['{CC2B8E3C-BB82-4FC9-A22D-9DD7E89A43C1}']
    procedure setView(view: JView); cdecl;
    function start: Boolean; cdecl;
  end;
  TJNativeCustomTemplateAd_DisplayOpenMeasurement = class(TJavaGenericImport<JNativeCustomTemplateAd_DisplayOpenMeasurementClass, JNativeCustomTemplateAd_DisplayOpenMeasurement>) end;

  JNativeCustomTemplateAd_OnCustomClickListenerClass = interface(IJavaClass)
    ['{A3EF687B-3392-488A-B3C8-E6E7EC038E4F}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener')]
  JNativeCustomTemplateAd_OnCustomClickListener = interface(IJavaInstance)
    ['{EA97A3ED-1C2D-488C-AAB8-CB5821EF63DE}']
    procedure onCustomClick(nativeCustomTemplateAd: JNativeCustomTemplateAd; string_: JString); cdecl;
  end;
  TJNativeCustomTemplateAd_OnCustomClickListener = class(TJavaGenericImport<JNativeCustomTemplateAd_OnCustomClickListenerClass, JNativeCustomTemplateAd_OnCustomClickListener>) end;

  JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListenerClass = interface(IJavaClass)
    ['{230DCCD8-4EE5-4F11-AEFD-C4BA06F6350E}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener')]
  JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener = interface(IJavaInstance)
    ['{85A2358F-3967-40D7-B319-F8A3F126060C}']
    procedure onCustomTemplateAdLoaded(nativeCustomTemplateAd: JNativeCustomTemplateAd); cdecl;
  end;
  TJNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener = class(TJavaGenericImport<JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListenerClass, JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener>) end;

  JOnAdManagerAdViewLoadedListenerClass = interface(IJavaClass)
    ['{84BBA2D4-0266-4962-83D5-0DE54F956F9D}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/OnAdManagerAdViewLoadedListener')]
  JOnAdManagerAdViewLoadedListener = interface(IJavaInstance)
    ['{4664A31D-6445-489B-AD11-5901294946FC}']
    procedure onAdManagerAdViewLoaded(adManagerAdView: JAdManagerAdView); cdecl;
  end;
  TJOnAdManagerAdViewLoadedListener = class(TJavaGenericImport<JOnAdManagerAdViewLoadedListenerClass, JOnAdManagerAdViewLoadedListener>) end;

  JShouldDelayBannerRenderingListenerClass = interface(IJavaClass)
    ['{BF1457DC-15F6-4563-B71B-675814187085}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/ShouldDelayBannerRenderingListener')]
  JShouldDelayBannerRenderingListener = interface(IJavaInstance)
    ['{0B0142CC-CE4B-473D-B97B-FD1FCA277B92}']
    function shouldDelayBannerRendering(runnable: JRunnable): Boolean; cdecl;
  end;
  TJShouldDelayBannerRenderingListener = class(TJavaGenericImport<JShouldDelayBannerRenderingListenerClass, JShouldDelayBannerRenderingListener>) end;

  JUnifiedNativeAdClass = interface(JObjectClass)
    ['{B74CB80C-AFE8-4604-898D-EC17336205E8}']
    {class} function init: JUnifiedNativeAd; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/formats/UnifiedNativeAd')]
  JUnifiedNativeAd = interface(JObject)
    ['{9724B29E-CDCB-4A77-99A5-26DCA009F0E3}']
    procedure cancelUnconfirmedClick; cdecl;
    procedure destroy; cdecl;
    procedure enableCustomClickGesture; cdecl;
    function getAdChoicesInfo: JNativeAd_AdChoicesInfo; cdecl;
    function getAdvertiser: JString; cdecl;
    function getBody: JString; cdecl;
    function getCallToAction: JString; cdecl;
    function getExtras: JBundle; cdecl;
    function getHeadline: JString; cdecl;
    function getIcon: JNativeAd_Image; cdecl;
    function getImages: JList; cdecl;
    function getMediaContent: JMediaContent; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    function getMuteThisAdReasons: JList; cdecl;
    function getPrice: JString; cdecl;
    function getResponseInfo: JResponseInfo; cdecl;
    function getStarRating: JDouble; cdecl;
    function getStore: JString; cdecl;
    function getVideoController: JVideoController; cdecl;
    function isCustomClickGestureEnabled: Boolean; cdecl;
    function isCustomMuteThisAdEnabled: Boolean; cdecl;
    procedure muteThisAd(muteThisAdReason: JMuteThisAdReason); cdecl;
    procedure performClick(bundle: JBundle); cdecl;
    procedure recordCustomClickGesture; cdecl;
    function recordImpression(bundle: JBundle): Boolean; cdecl;
    procedure reportTouchEvent(bundle: JBundle); cdecl;
    procedure setMuteThisAdListener(muteThisAdListener: JMuteThisAdListener); cdecl;
    procedure setOnPaidEventListener(onPaidEventListener: JOnPaidEventListener); cdecl;
    procedure setUnconfirmedClickListener(unconfirmedClickListener: JUnifiedNativeAd_UnconfirmedClickListener); cdecl;
    function zza: JObject; cdecl;
  end;
  TJUnifiedNativeAd = class(TJavaGenericImport<JUnifiedNativeAdClass, JUnifiedNativeAd>) end;

  JUnifiedNativeAd_OnUnifiedNativeAdLoadedListenerClass = interface(IJavaClass)
    ['{908741AD-F1E5-4B83-99C5-92041731702C}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/UnifiedNativeAd$OnUnifiedNativeAdLoadedListener')]
  JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener = interface(IJavaInstance)
    ['{9FCA357E-A343-4C71-8234-B0DEE6CAA4FC}']
    procedure onUnifiedNativeAdLoaded(unifiedNativeAd: JUnifiedNativeAd); cdecl;
  end;
  TJUnifiedNativeAd_OnUnifiedNativeAdLoadedListener = class(TJavaGenericImport<JUnifiedNativeAd_OnUnifiedNativeAdLoadedListenerClass, JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener>) end;

  JUnifiedNativeAd_UnconfirmedClickListenerClass = interface(IJavaClass)
    ['{C5DF4247-E5D5-4315-A122-0E51874D0142}']
  end;

  [JavaSignature('com/google/android/gms/ads/formats/UnifiedNativeAd$UnconfirmedClickListener')]
  JUnifiedNativeAd_UnconfirmedClickListener = interface(IJavaInstance)
    ['{7DF4834D-BB3F-425F-917A-1A7F4D523E94}']
    procedure onUnconfirmedClickCancelled; cdecl;
    procedure onUnconfirmedClickReceived(string_: JString); cdecl;
  end;
  TJUnifiedNativeAd_UnconfirmedClickListener = class(TJavaGenericImport<JUnifiedNativeAd_UnconfirmedClickListenerClass, JUnifiedNativeAd_UnconfirmedClickListener>) end;

  JInitializationStatusClass = interface(IJavaClass)
    ['{F186532A-D415-47D8-AC36-0519660DEB9F}']
  end;

  [JavaSignature('com/google/android/gms/ads/initialization/InitializationStatus')]
  JInitializationStatus = interface(IJavaInstance)
    ['{A4BD598D-20DD-4CBC-899D-979FEF554AB5}']
    function getAdapterStatusMap: JMap; cdecl;
  end;
  TJInitializationStatus = class(TJavaGenericImport<JInitializationStatusClass, JInitializationStatus>) end;

  JOnInitializationCompleteListenerClass = interface(IJavaClass)
    ['{F725AF5C-17D7-46EB-B60C-FA1A737EF965}']
  end;

  [JavaSignature('com/google/android/gms/ads/initialization/OnInitializationCompleteListener')]
  JOnInitializationCompleteListener = interface(IJavaInstance)
    ['{78C48F46-BC9A-4BA1-BC4F-E8D5ED29F7D3}']
    procedure onInitializationComplete(initializationStatus: JInitializationStatus); cdecl;
  end;
  TJOnInitializationCompleteListener = class(TJavaGenericImport<JOnInitializationCompleteListenerClass, JOnInitializationCompleteListener>) end;

  // com.google.android.gms.ads.internal.client.zza
  // com.google.android.gms.ads.internal.client.zzaz
  // com.google.android.gms.ads.internal.client.zzbe
  // com.google.android.gms.ads.internal.client.zzbh
  // com.google.android.gms.ads.internal.client.zzbk
  // com.google.android.gms.ads.internal.client.zzbn
  // com.google.android.gms.ads.internal.client.zzbu
  // com.google.android.gms.ads.internal.client.zzby
  // com.google.android.gms.ads.internal.client.zzc
  // com.google.android.gms.ads.internal.client.zzcb
  // com.google.android.gms.ads.internal.client.zzcf
  // com.google.android.gms.ads.internal.client.zzci
  // com.google.android.gms.ads.internal.client.zzdg
  // com.google.android.gms.ads.internal.client.zzdn
  // com.google.android.gms.ads.internal.client.zzdq
  // com.google.android.gms.ads.internal.client.zzdt
  // com.google.android.gms.ads.internal.client.zzdu
  // com.google.android.gms.ads.internal.client.zzdw
  // com.google.android.gms.ads.internal.client.zzdx
  // com.google.android.gms.ads.internal.client.zze
  // com.google.android.gms.ads.internal.client.zzea
  // com.google.android.gms.ads.internal.client.zzfh
  // com.google.android.gms.ads.internal.client.zzfl
  // com.google.android.gms.ads.internal.client.zzl
  // com.google.android.gms.ads.internal.client.zzp
  // com.google.android.gms.ads.internal.client.zzq
  // com.google.android.gms.ads.internal.client.zzs
  // com.google.android.gms.ads.internal.client.zzu
  // com.google.android.gms.ads.internal.client.zzw
  Jinterstitial_InterstitialAdClass = interface(JObjectClass)
    ['{F6EE0193-3B01-4F77-B909-9B7E812C4F40}']
    {class} function init: Jinterstitial_InterstitialAd; cdecl;
    {class} procedure load(context: JContext; string_: JString; adRequest: JAdRequest; interstitialAdLoadCallback: JInterstitialAdLoadCallback); cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/interstitial/InterstitialAd')]
  Jinterstitial_InterstitialAd = interface(JObject)
    ['{7117C82F-1926-44A6-A3C5-3E0EA5612BEF}']
    function getAdUnitId: JString; cdecl;
    function getFullScreenContentCallback: JFullScreenContentCallback; cdecl;
    function getOnPaidEventListener: JOnPaidEventListener; cdecl;
    function getResponseInfo: JResponseInfo; cdecl;
    procedure setFullScreenContentCallback(fullScreenContentCallback: JFullScreenContentCallback); cdecl;
    procedure setImmersiveMode(b: Boolean); cdecl;
    procedure setOnPaidEventListener(onPaidEventListener: JOnPaidEventListener); cdecl;
    procedure show(activity: JActivity); cdecl;
  end;
  TJinterstitial_InterstitialAd = class(TJavaGenericImport<Jinterstitial_InterstitialAdClass, Jinterstitial_InterstitialAd>) end;

  JInterstitialAdLoadCallbackClass = interface(JAdLoadCallbackClass)
    ['{3B052E52-8E13-4AFF-84CE-BDF8EAEA94F0}']
    {class} function init: JInterstitialAdLoadCallback; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/interstitial/InterstitialAdLoadCallback')]
  JInterstitialAdLoadCallback = interface(JAdLoadCallback)
    ['{EC68D59C-EC2D-4B6D-BE43-01CFE9D8553A}']
  end;
  TJInterstitialAdLoadCallback = class(TJavaGenericImport<JInterstitialAdLoadCallbackClass, JInterstitialAdLoadCallback>) end;

  Jmediation_MediationAdRequestClass = interface(IJavaClass)
    ['{9916C74C-6549-4129-9A68-B0F4FDF9D6E6}']
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE: Integer; cdecl;
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE: Integer; cdecl;
    {class} function _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED: Integer; cdecl;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE;
    {class} property TAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED: Integer read _GetTAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED;
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationAdRequest')]
  Jmediation_MediationAdRequest = interface(IJavaInstance)
    ['{7875E348-E12C-418F-A96B-89B391B411CD}']
    function getBirthday: JDate; cdecl;
    function getGender: Integer; cdecl;
    function getKeywords: JSet; cdecl;
    function getLocation: JLocation; cdecl;
    function isDesignedForFamilies: Boolean; cdecl;
    function isTesting: Boolean; cdecl;
    function taggedForChildDirectedTreatment: Integer; cdecl;
  end;
  TJmediation_MediationAdRequest = class(TJavaGenericImport<Jmediation_MediationAdRequestClass, Jmediation_MediationAdRequest>) end;

  JMediationExtrasReceiverClass = interface(IJavaClass)
    ['{F109A898-BE9C-49D3-B58A-FF22E2DA7726}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationExtrasReceiver')]
  JMediationExtrasReceiver = interface(IJavaInstance)
    ['{95481BFA-B73F-4ED0-B0F7-220CB61F2618}']
  end;
  TJMediationExtrasReceiver = class(TJavaGenericImport<JMediationExtrasReceiverClass, JMediationExtrasReceiver>) end;

  Jmediation_MediationAdapterClass = interface(JMediationExtrasReceiverClass)
    ['{56434ADF-62C9-4FED-B605-4ED88F4151D9}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationAdapter')]
  Jmediation_MediationAdapter = interface(JMediationExtrasReceiver)
    ['{CDF50BCB-4148-4DEF-8CE7-7DBD8B5A5A25}']
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
  end;
  TJmediation_MediationAdapter = class(TJavaGenericImport<Jmediation_MediationAdapterClass, Jmediation_MediationAdapter>) end;

  Jmediation_MediationBannerAdapterClass = interface(Jmediation_MediationAdapterClass)
    ['{895F58F0-3EBC-4ED1-803B-9BE1BD2DC781}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationBannerAdapter')]
  Jmediation_MediationBannerAdapter = interface(Jmediation_MediationAdapter)
    ['{A613CE5E-C4D8-4BDE-A9AC-364D0E553C9A}']
    function getBannerView: JView; cdecl;
    procedure requestBannerAd(context: JContext; mediationBannerListener: Jmediation_MediationBannerListener; bundle: JBundle; adSize: JAdSize; mediationAdRequest: Jmediation_MediationAdRequest; bundle1: JBundle); cdecl;
  end;
  TJmediation_MediationBannerAdapter = class(TJavaGenericImport<Jmediation_MediationBannerAdapterClass, Jmediation_MediationBannerAdapter>) end;

  Jmediation_MediationBannerListenerClass = interface(IJavaClass)
    ['{A0C1233D-2CEF-4135-91F1-F5435230A5E4}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationBannerListener')]
  Jmediation_MediationBannerListener = interface(IJavaInstance)
    ['{B5EB31F0-707E-4935-AA57-6915280B75CC}']
    procedure onAdClicked(mediationBannerAdapter: Jmediation_MediationBannerAdapter); cdecl;
    procedure onAdClosed(mediationBannerAdapter: Jmediation_MediationBannerAdapter); cdecl;
    procedure onAdFailedToLoad(mediationBannerAdapter: Jmediation_MediationBannerAdapter; adError: JAdError); cdecl; overload;
    procedure onAdFailedToLoad(mediationBannerAdapter: Jmediation_MediationBannerAdapter; i: Integer); cdecl; overload;
    procedure onAdLeftApplication(mediationBannerAdapter: Jmediation_MediationBannerAdapter); cdecl;
    procedure onAdLoaded(mediationBannerAdapter: Jmediation_MediationBannerAdapter); cdecl;
    procedure onAdOpened(mediationBannerAdapter: Jmediation_MediationBannerAdapter); cdecl;
  end;
  TJmediation_MediationBannerListener = class(TJavaGenericImport<Jmediation_MediationBannerListenerClass, Jmediation_MediationBannerListener>) end;

  Jmediation_MediationInterstitialAdapterClass = interface(Jmediation_MediationAdapterClass)
    ['{5F4FAC50-91FC-4438-A712-0DE59B68DF0B}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationInterstitialAdapter')]
  Jmediation_MediationInterstitialAdapter = interface(Jmediation_MediationAdapter)
    ['{287270DB-58DC-4CB0-86FF-CFF530C09F1F}']
    procedure requestInterstitialAd(context: JContext; mediationInterstitialListener: Jmediation_MediationInterstitialListener; bundle: JBundle; mediationAdRequest: Jmediation_MediationAdRequest; bundle1: JBundle); cdecl;
    procedure showInterstitial; cdecl;
  end;
  TJmediation_MediationInterstitialAdapter = class(TJavaGenericImport<Jmediation_MediationInterstitialAdapterClass, Jmediation_MediationInterstitialAdapter>) end;

  Jmediation_MediationInterstitialListenerClass = interface(IJavaClass)
    ['{F6CD7C91-9206-47F0-B83C-72A6470E16FF}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationInterstitialListener')]
  Jmediation_MediationInterstitialListener = interface(IJavaInstance)
    ['{3BA473E5-0F3D-4DF5-88DB-6502B4886381}']
    procedure onAdClicked(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter); cdecl;
    procedure onAdClosed(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter); cdecl;
    procedure onAdFailedToLoad(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter; adError: JAdError); cdecl; overload;
    procedure onAdFailedToLoad(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter; i: Integer); cdecl; overload;
    procedure onAdLeftApplication(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter); cdecl;
    procedure onAdLoaded(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter); cdecl;
    procedure onAdOpened(mediationInterstitialAdapter: Jmediation_MediationInterstitialAdapter); cdecl;
  end;
  TJmediation_MediationInterstitialListener = class(TJavaGenericImport<Jmediation_MediationInterstitialListenerClass, Jmediation_MediationInterstitialListener>) end;

  JMediationNativeAdapterClass = interface(Jmediation_MediationAdapterClass)
    ['{58DD5DEE-A850-4E8E-A85F-4718C9184750}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationNativeAdapter')]
  JMediationNativeAdapter = interface(Jmediation_MediationAdapter)
    ['{60334DB6-7D57-4D7B-A21A-0B130FAA39B4}']
    procedure requestNativeAd(context: JContext; mediationNativeListener: JMediationNativeListener; bundle: JBundle; nativeMediationAdRequest: JNativeMediationAdRequest; bundle1: JBundle); cdecl;
  end;
  TJMediationNativeAdapter = class(TJavaGenericImport<JMediationNativeAdapterClass, JMediationNativeAdapter>) end;

  JMediationNativeListenerClass = interface(IJavaClass)
    ['{A4516C16-A769-42C0-BF80-F11FC74C1751}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/MediationNativeListener')]
  JMediationNativeListener = interface(IJavaInstance)
    ['{C536554B-C650-4203-BBB2-DE64FBF92177}']
    procedure onAdClicked(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
    procedure onAdClosed(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
    procedure onAdFailedToLoad(mediationNativeAdapter: JMediationNativeAdapter; adError: JAdError); cdecl; overload;
    procedure onAdFailedToLoad(mediationNativeAdapter: JMediationNativeAdapter; i: Integer); cdecl; overload;
    procedure onAdImpression(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
    procedure onAdLeftApplication(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
    procedure onAdLoaded(mediationNativeAdapter: JMediationNativeAdapter; unifiedNativeAdMapper: JUnifiedNativeAdMapper); cdecl;
    procedure onAdOpened(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
    procedure onVideoEnd(mediationNativeAdapter: JMediationNativeAdapter); cdecl;
  end;
  TJMediationNativeListener = class(TJavaGenericImport<JMediationNativeListenerClass, JMediationNativeListener>) end;

  JNativeMediationAdRequestClass = interface(Jmediation_MediationAdRequestClass)
    ['{F0458E92-FECC-40AA-BBF1-2D9E78B8002A}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/NativeMediationAdRequest')]
  JNativeMediationAdRequest = interface(Jmediation_MediationAdRequest)
    ['{D153DC8C-8E0D-4C0D-B989-DE8E86FF3C70}']
    function getAdVolume: Single; cdecl;
    function getNativeAdOptions: JNativeAdOptions; cdecl;
    function getNativeAdRequestOptions: Jnativead_NativeAdOptions; cdecl;
    function isAdMuted: Boolean; cdecl;
    function isUnifiedNativeAdRequested: Boolean; cdecl;
  end;
  TJNativeMediationAdRequest = class(TJavaGenericImport<JNativeMediationAdRequestClass, JNativeMediationAdRequest>) end;

  JNetworkExtrasClass = interface(IJavaClass)
    ['{CD85A32A-AD18-4FEB-9378-775086001CBC}']
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/NetworkExtras')]
  JNetworkExtras = interface(IJavaInstance)
    ['{87A70156-1EB5-4B91-AB24-47468B2E2FB1}']
  end;
  TJNetworkExtras = class(TJavaGenericImport<JNetworkExtrasClass, JNetworkExtras>) end;

  JUnifiedNativeAdMapperClass = interface(JObjectClass)
    ['{84228FFB-6E69-4419-BF32-207A901064F3}']
    {class} function init: JUnifiedNativeAdMapper; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/mediation/UnifiedNativeAdMapper')]
  JUnifiedNativeAdMapper = interface(JObject)
    ['{E2A26653-A7C3-412E-84B6-7CBDD16F8A34}']
    function getAdChoicesContent: JView; cdecl;
    function getAdvertiser: JString; cdecl;
    function getBody: JString; cdecl;
    function getCallToAction: JString; cdecl;
    function getCurrentTime: Single; cdecl;
    function getDuration: Single; cdecl;
    function getExtras: JBundle; cdecl;
    function getHeadline: JString; cdecl;
    function getIcon: JNativeAd_Image; cdecl;
    function getImages: JList; cdecl;
    function getMediaContentAspectRatio: Single; cdecl;
    function getOverrideClickHandling: Boolean; cdecl;
    function getOverrideImpressionRecording: Boolean; cdecl;
    function getPrice: JString; cdecl;
    function getStarRating: JDouble; cdecl;
    function getStore: JString; cdecl;
    procedure handleClick(view: JView); cdecl;
    function hasVideoContent: Boolean; cdecl;
    procedure recordImpression; cdecl;
    procedure setAdChoicesContent(view: JView); cdecl;
    procedure setAdvertiser(string_: JString); cdecl;
    procedure setBody(string_: JString); cdecl;
    procedure setCallToAction(string_: JString); cdecl;
    procedure setExtras(bundle: JBundle); cdecl;
    procedure setHasVideoContent(b: Boolean); cdecl;
    procedure setHeadline(string_: JString); cdecl;
    procedure setIcon(image: JNativeAd_Image); cdecl;
    procedure setImages(list: JList); cdecl;
    procedure setMediaContentAspectRatio(f: Single); cdecl;
    procedure setMediaView(view: JView); cdecl;
    procedure setOverrideClickHandling(b: Boolean); cdecl;
    procedure setOverrideImpressionRecording(b: Boolean); cdecl;
    procedure setPrice(string_: JString); cdecl;
    procedure setStarRating(double: JDouble); cdecl;
    procedure setStore(string_: JString); cdecl;
    procedure trackViews(view: JView; map: JMap; map1: JMap); cdecl;
    procedure untrackView(view: JView); cdecl;
  end;
  TJUnifiedNativeAdMapper = class(TJavaGenericImport<JUnifiedNativeAdMapperClass, JUnifiedNativeAdMapper>) end;

  Jnativead_NativeAdClass = interface(JObjectClass)
    ['{3E45EB19-CABC-4AF0-A0B6-843BA05B70B4}']
    {class} function init: Jnativead_NativeAd; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAd')]
  Jnativead_NativeAd = interface(JObject)
    ['{5E4B5786-94D4-4793-A98C-0DB42843D646}']
    procedure cancelUnconfirmedClick; cdecl;
    procedure destroy; cdecl;
    procedure enableCustomClickGesture; cdecl;
    function getAdChoicesInfo: Jnativead_NativeAd_AdChoicesInfo; cdecl;
    function getAdvertiser: JString; cdecl;
    function getBody: JString; cdecl;
    function getCallToAction: JString; cdecl;
    function getExtras: JBundle; cdecl;
    function getHeadline: JString; cdecl;
    function getIcon: Jnativead_NativeAd_Image; cdecl;
    function getImages: JList; cdecl;
    function getMediaContent: JMediaContent; cdecl;
    function getMuteThisAdReasons: JList; cdecl;
    function getPrice: JString; cdecl;
    function getResponseInfo: JResponseInfo; cdecl;
    function getStarRating: JDouble; cdecl;
    function getStore: JString; cdecl;
    function isCustomClickGestureEnabled: Boolean; cdecl;
    function isCustomMuteThisAdEnabled: Boolean; cdecl;
    procedure muteThisAd(muteThisAdReason: JMuteThisAdReason); cdecl;
    procedure performClick(bundle: JBundle); cdecl;
    procedure recordCustomClickGesture; cdecl;
    function recordImpression(bundle: JBundle): Boolean; cdecl;
    procedure reportTouchEvent(bundle: JBundle); cdecl;
    procedure setMuteThisAdListener(muteThisAdListener: JMuteThisAdListener); cdecl;
    procedure setOnPaidEventListener(onPaidEventListener: JOnPaidEventListener); cdecl;
    procedure setUnconfirmedClickListener(unconfirmedClickListener: JNativeAd_UnconfirmedClickListener); cdecl;
  end;
  TJnativead_NativeAd = class(TJavaGenericImport<Jnativead_NativeAdClass, Jnativead_NativeAd>) end;

  Jnativead_NativeAd_AdChoicesInfoClass = interface(JObjectClass)
    ['{F0DEF0DA-028A-4EC2-AB6A-ED5BCF942112}']
    {class} function init: Jnativead_NativeAd_AdChoicesInfo; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAd$AdChoicesInfo')]
  Jnativead_NativeAd_AdChoicesInfo = interface(JObject)
    ['{16B5A34D-4C42-47B6-9E7D-F74FA2495BE7}']
    function getImages: JList; cdecl;
    function getText: JCharSequence; cdecl;
  end;
  TJnativead_NativeAd_AdChoicesInfo = class(TJavaGenericImport<Jnativead_NativeAd_AdChoicesInfoClass, Jnativead_NativeAd_AdChoicesInfo>) end;

  Jnativead_NativeAd_ImageClass = interface(JObjectClass)
    ['{602F65A0-4EC6-4339-AF2A-F6D61E995BFC}']
    {class} function init: Jnativead_NativeAd_Image; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAd$Image')]
  Jnativead_NativeAd_Image = interface(JObject)
    ['{88B9C1BE-9504-4042-A461-B17666454A08}']
    function getDrawable: JDrawable; cdecl;
    function getScale: Double; cdecl;
    function getUri: Jnet_Uri; cdecl;
  end;
  TJnativead_NativeAd_Image = class(TJavaGenericImport<Jnativead_NativeAd_ImageClass, Jnativead_NativeAd_Image>) end;

  JNativeAd_OnNativeAdLoadedListenerClass = interface(IJavaClass)
    ['{366D3ED1-CAD1-4536-914E-071E3D012207}']
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAd$OnNativeAdLoadedListener')]
  JNativeAd_OnNativeAdLoadedListener = interface(IJavaInstance)
    ['{1B7FBBCC-4B6E-4B77-9819-ABB191166D6B}']
    procedure onNativeAdLoaded(nativeAd: Jnativead_NativeAd); cdecl;
  end;
  TJNativeAd_OnNativeAdLoadedListener = class(TJavaGenericImport<JNativeAd_OnNativeAdLoadedListenerClass, JNativeAd_OnNativeAdLoadedListener>) end;

  JNativeAd_UnconfirmedClickListenerClass = interface(IJavaClass)
    ['{52BD5876-5EC6-47A6-BD98-DB3570DDAA8B}']
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAd$UnconfirmedClickListener')]
  JNativeAd_UnconfirmedClickListener = interface(IJavaInstance)
    ['{5D7E2A05-3626-436E-BBD4-CD8D2A0DA7A8}']
    procedure onUnconfirmedClickCancelled; cdecl;
    procedure onUnconfirmedClickReceived(string_: JString); cdecl;
  end;
  TJNativeAd_UnconfirmedClickListener = class(TJavaGenericImport<JNativeAd_UnconfirmedClickListenerClass, JNativeAd_UnconfirmedClickListener>) end;

  Jnativead_NativeAdOptionsClass = interface(JObjectClass)
    ['{EC60EF29-BB6D-40FA-9F7D-26D388D2E5C4}']
    {class} function _GetADCHOICES_BOTTOM_LEFT: Integer; cdecl;
    {class} function _GetADCHOICES_BOTTOM_RIGHT: Integer; cdecl;
    {class} function _GetADCHOICES_TOP_LEFT: Integer; cdecl;
    {class} function _GetADCHOICES_TOP_RIGHT: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_ANY: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_PORTRAIT: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_SQUARE: Integer; cdecl;
    {class} function _GetNATIVE_MEDIA_ASPECT_RATIO_UNKNOWN: Integer; cdecl;
    {class} function _GetSWIPE_GESTURE_DIRECTION_DOWN: Integer; cdecl;
    {class} function _GetSWIPE_GESTURE_DIRECTION_LEFT: Integer; cdecl;
    {class} function _GetSWIPE_GESTURE_DIRECTION_RIGHT: Integer; cdecl;
    {class} function _GetSWIPE_GESTURE_DIRECTION_UP: Integer; cdecl;
    {class} property ADCHOICES_BOTTOM_LEFT: Integer read _GetADCHOICES_BOTTOM_LEFT;
    {class} property ADCHOICES_BOTTOM_RIGHT: Integer read _GetADCHOICES_BOTTOM_RIGHT;
    {class} property ADCHOICES_TOP_LEFT: Integer read _GetADCHOICES_TOP_LEFT;
    {class} property ADCHOICES_TOP_RIGHT: Integer read _GetADCHOICES_TOP_RIGHT;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_ANY: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_ANY;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_LANDSCAPE;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_PORTRAIT: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_PORTRAIT;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_SQUARE: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_SQUARE;
    {class} property NATIVE_MEDIA_ASPECT_RATIO_UNKNOWN: Integer read _GetNATIVE_MEDIA_ASPECT_RATIO_UNKNOWN;
    {class} property SWIPE_GESTURE_DIRECTION_DOWN: Integer read _GetSWIPE_GESTURE_DIRECTION_DOWN;
    {class} property SWIPE_GESTURE_DIRECTION_LEFT: Integer read _GetSWIPE_GESTURE_DIRECTION_LEFT;
    {class} property SWIPE_GESTURE_DIRECTION_RIGHT: Integer read _GetSWIPE_GESTURE_DIRECTION_RIGHT;
    {class} property SWIPE_GESTURE_DIRECTION_UP: Integer read _GetSWIPE_GESTURE_DIRECTION_UP;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAdOptions')]
  Jnativead_NativeAdOptions = interface(JObject)
    ['{76D8EC06-85C9-4B3B-9580-CDCEDD3CCC28}']
    function getAdChoicesPlacement: Integer; cdecl;
    function getMediaAspectRatio: Integer; cdecl;
    function getVideoOptions: JVideoOptions; cdecl;
    function shouldRequestMultipleImages: Boolean; cdecl;
    function shouldReturnUrlsForImageAssets: Boolean; cdecl;
  end;
  TJnativead_NativeAdOptions = class(TJavaGenericImport<Jnativead_NativeAdOptionsClass, Jnativead_NativeAdOptions>) end;

  Jnativead_NativeAdOptions_BuilderClass = interface(JObjectClass)
    ['{AE7A5117-7923-4361-9D18-889332329120}']
    {class} function init: Jnativead_NativeAdOptions_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeAdOptions$Builder')]
  Jnativead_NativeAdOptions_Builder = interface(JObject)
    ['{858BA149-7041-4A34-97B2-E0EA172715E6}']
    function build: Jnativead_NativeAdOptions; cdecl;
    function enableCustomClickGestureDirection(i: Integer; b: Boolean): Jnativead_NativeAdOptions_Builder; cdecl;
    function setAdChoicesPlacement(i: Integer): Jnativead_NativeAdOptions_Builder; cdecl;
    function setMediaAspectRatio(i: Integer): Jnativead_NativeAdOptions_Builder; cdecl;
    function setRequestCustomMuteThisAd(b: Boolean): Jnativead_NativeAdOptions_Builder; cdecl;
    function setRequestMultipleImages(b: Boolean): Jnativead_NativeAdOptions_Builder; cdecl;
    function setReturnUrlsForImageAssets(b: Boolean): Jnativead_NativeAdOptions_Builder; cdecl;
    function setVideoOptions(videoOptions: JVideoOptions): Jnativead_NativeAdOptions_Builder; cdecl;
  end;
  TJnativead_NativeAdOptions_Builder = class(TJavaGenericImport<Jnativead_NativeAdOptions_BuilderClass, Jnativead_NativeAdOptions_Builder>) end;

  JNativeCustomFormatAdClass = interface(IJavaClass)
    ['{D90D223F-16F0-4586-9F0C-E2D910C7F1F6}']
    {class} function _GetASSET_NAME_VIDEO: JString; cdecl;
    {class} property ASSET_NAME_VIDEO: JString read _GetASSET_NAME_VIDEO;
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeCustomFormatAd')]
  JNativeCustomFormatAd = interface(IJavaInstance)
    ['{1CA721BE-968F-4A7B-9BC6-45CEEBCB5A8E}']
    procedure destroy; cdecl;
    function getAvailableAssetNames: JList; cdecl;
    function getCustomFormatId: JString; cdecl;
    function getDisplayOpenMeasurement: JNativeCustomFormatAd_DisplayOpenMeasurement; cdecl;
    function getImage(string_: JString): Jnativead_NativeAd_Image; cdecl;
    function getMediaContent: JMediaContent; cdecl;
    function getText(string_: JString): JCharSequence; cdecl;
    procedure performClick(string_: JString); cdecl;
    procedure recordImpression; cdecl;
  end;
  TJNativeCustomFormatAd = class(TJavaGenericImport<JNativeCustomFormatAdClass, JNativeCustomFormatAd>) end;

  JNativeCustomFormatAd_DisplayOpenMeasurementClass = interface(IJavaClass)
    ['{D36360EB-9717-471C-A4C3-EDA07C214A1D}']
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeCustomFormatAd$DisplayOpenMeasurement')]
  JNativeCustomFormatAd_DisplayOpenMeasurement = interface(IJavaInstance)
    ['{F283E131-2317-456F-AD86-EAA00EC01678}']
    procedure setView(view: JView); cdecl;
    function start: Boolean; cdecl;
  end;
  TJNativeCustomFormatAd_DisplayOpenMeasurement = class(TJavaGenericImport<JNativeCustomFormatAd_DisplayOpenMeasurementClass, JNativeCustomFormatAd_DisplayOpenMeasurement>) end;

  JNativeCustomFormatAd_OnCustomClickListenerClass = interface(IJavaClass)
    ['{2F6FA8F2-1F14-4DA9-94C3-2BE324BBB6E7}']
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeCustomFormatAd$OnCustomClickListener')]
  JNativeCustomFormatAd_OnCustomClickListener = interface(IJavaInstance)
    ['{1B0D8A7E-7531-4DE3-97C4-EBB46C02E62A}']
    procedure onCustomClick(nativeCustomFormatAd: JNativeCustomFormatAd; string_: JString); cdecl;
  end;
  TJNativeCustomFormatAd_OnCustomClickListener = class(TJavaGenericImport<JNativeCustomFormatAd_OnCustomClickListenerClass, JNativeCustomFormatAd_OnCustomClickListener>) end;

  JNativeCustomFormatAd_OnCustomFormatAdLoadedListenerClass = interface(IJavaClass)
    ['{EFAFD77C-2705-4DF1-B2EF-E02B2283D98C}']
  end;

  [JavaSignature('com/google/android/gms/ads/nativead/NativeCustomFormatAd$OnCustomFormatAdLoadedListener')]
  JNativeCustomFormatAd_OnCustomFormatAdLoadedListener = interface(IJavaInstance)
    ['{26E6A389-3AB2-46E7-AD5E-3EC3F02CF861}']
    procedure onCustomFormatAdLoaded(nativeCustomFormatAd: JNativeCustomFormatAd); cdecl;
  end;
  TJNativeCustomFormatAd_OnCustomFormatAdLoadedListener = class(TJavaGenericImport<JNativeCustomFormatAd_OnCustomFormatAdLoadedListenerClass, JNativeCustomFormatAd_OnCustomFormatAdLoadedListener>) end;

  JSearchAdRequestClass = interface(JObjectClass)
    ['{31CC1220-F7EC-44D3-9805-80A0C42377CE}']
    {class} function _GetBORDER_TYPE_DASHED: Integer; cdecl;
    {class} function _GetBORDER_TYPE_DOTTED: Integer; cdecl;
    {class} function _GetBORDER_TYPE_NONE: Integer; cdecl;
    {class} function _GetBORDER_TYPE_SOLID: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_DARK: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_LIGHT: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_MEDIUM: Integer; cdecl;
    {class} function _GetDEVICE_ID_EMULATOR: JString; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NO_FILL: Integer; cdecl;
    {class} property BORDER_TYPE_DASHED: Integer read _GetBORDER_TYPE_DASHED;
    {class} property BORDER_TYPE_DOTTED: Integer read _GetBORDER_TYPE_DOTTED;
    {class} property BORDER_TYPE_NONE: Integer read _GetBORDER_TYPE_NONE;
    {class} property BORDER_TYPE_SOLID: Integer read _GetBORDER_TYPE_SOLID;
    {class} property CALL_BUTTON_COLOR_DARK: Integer read _GetCALL_BUTTON_COLOR_DARK;
    {class} property CALL_BUTTON_COLOR_LIGHT: Integer read _GetCALL_BUTTON_COLOR_LIGHT;
    {class} property CALL_BUTTON_COLOR_MEDIUM: Integer read _GetCALL_BUTTON_COLOR_MEDIUM;
    {class} property DEVICE_ID_EMULATOR: JString read _GetDEVICE_ID_EMULATOR;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_INVALID_REQUEST: Integer read _GetERROR_CODE_INVALID_REQUEST;
    {class} property ERROR_CODE_NETWORK_ERROR: Integer read _GetERROR_CODE_NETWORK_ERROR;
    {class} property ERROR_CODE_NO_FILL: Integer read _GetERROR_CODE_NO_FILL;
  end;

  [JavaSignature('com/google/android/gms/ads/search/SearchAdRequest')]
  JSearchAdRequest = interface(JObject)
    ['{7105D858-7D2D-4105-A415-4B9C3B187692}']
    function getAnchorTextColor: Integer; cdecl;
    function getBackgroundColor: Integer; cdecl;
    function getBackgroundGradientBottom: Integer; cdecl;
    function getBackgroundGradientTop: Integer; cdecl;
    function getBorderColor: Integer; cdecl;
    function getBorderThickness: Integer; cdecl;
    function getBorderType: Integer; cdecl;
    function getCallButtonColor: Integer; cdecl;
    function getCustomChannels: JString; cdecl;
    function getCustomEventExtrasBundle(class_: Jlang_Class): JBundle; cdecl;
    function getDescriptionTextColor: Integer; cdecl;
    function getFontFace: JString; cdecl;
    function getHeaderTextColor: Integer; cdecl;
    function getHeaderTextSize: Integer; cdecl;
    function getLocation: JLocation; cdecl;
    function getNetworkExtras(class_: Jlang_Class): JNetworkExtras; cdecl;
    function getNetworkExtrasBundle(class_: Jlang_Class): JBundle; cdecl;
    function getQuery: JString; cdecl;
    function isTestDevice(context: JContext): Boolean; cdecl;
  end;
  TJSearchAdRequest = class(TJavaGenericImport<JSearchAdRequestClass, JSearchAdRequest>) end;

  // com.google.android.gms.ads.search.zzb
implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdError', TypeInfo(Androidapi.JNI.AdMob.JAdError));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdInspectorError', TypeInfo(Androidapi.JNI.AdMob.JAdInspectorError));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdListener', TypeInfo(Androidapi.JNI.AdMob.JAdListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdLoadCallback', TypeInfo(Androidapi.JNI.AdMob.JAdLoadCallback));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdLoader', TypeInfo(Androidapi.JNI.AdMob.JAdLoader));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdLoader_Builder', TypeInfo(Androidapi.JNI.AdMob.JAdLoader_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdRequest', TypeInfo(Androidapi.JNI.AdMob.JAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdRequest_Builder', TypeInfo(Androidapi.JNI.AdMob.JAdRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdSize', TypeInfo(Androidapi.JNI.AdMob.JAdSize));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdValue', TypeInfo(Androidapi.JNI.AdMob.JAdValue));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JBaseAdView', TypeInfo(Androidapi.JNI.AdMob.JBaseAdView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdView', TypeInfo(Androidapi.JNI.AdMob.JAdView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdapterResponseInfo', TypeInfo(Androidapi.JNI.AdMob.JAdapterResponseInfo));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JFullScreenContentCallback', TypeInfo(Androidapi.JNI.AdMob.JFullScreenContentCallback));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JLoadAdError', TypeInfo(Androidapi.JNI.AdMob.JLoadAdError));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMediaContent', TypeInfo(Androidapi.JNI.AdMob.JMediaContent));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMobileAds', TypeInfo(Androidapi.JNI.AdMob.JMobileAds));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMuteThisAdListener', TypeInfo(Androidapi.JNI.AdMob.JMuteThisAdListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMuteThisAdReason', TypeInfo(Androidapi.JNI.AdMob.JMuteThisAdReason));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JOnAdInspectorClosedListener', TypeInfo(Androidapi.JNI.AdMob.JOnAdInspectorClosedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JOnPaidEventListener', TypeInfo(Androidapi.JNI.AdMob.JOnPaidEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JRequestConfiguration', TypeInfo(Androidapi.JNI.AdMob.JRequestConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JRequestConfiguration_Builder', TypeInfo(Androidapi.JNI.AdMob.JRequestConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JResponseInfo', TypeInfo(Androidapi.JNI.AdMob.JResponseInfo));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jads_VersionInfo', TypeInfo(Androidapi.JNI.AdMob.Jads_VersionInfo));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JVideoController', TypeInfo(Androidapi.JNI.AdMob.JVideoController));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JVideoController_VideoLifecycleCallbacks', TypeInfo(Androidapi.JNI.AdMob.JVideoController_VideoLifecycleCallbacks));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JVideoOptions', TypeInfo(Androidapi.JNI.AdMob.JVideoOptions));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JVideoOptions_Builder', TypeInfo(Androidapi.JNI.AdMob.JVideoOptions_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdManagerAdRequest', TypeInfo(Androidapi.JNI.AdMob.JAdManagerAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdManagerAdRequest_Builder', TypeInfo(Androidapi.JNI.AdMob.JAdManagerAdRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdManagerAdView', TypeInfo(Androidapi.JNI.AdMob.JAdManagerAdView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jadmanager_AppEventListener', TypeInfo(Androidapi.JNI.AdMob.Jadmanager_AppEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdManagerAdViewOptions', TypeInfo(Androidapi.JNI.AdMob.JAdManagerAdViewOptions));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdManagerAdViewOptions_Builder', TypeInfo(Androidapi.JNI.AdMob.JAdManagerAdViewOptions_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMediaView', TypeInfo(Androidapi.JNI.AdMob.JMediaView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAd_AdChoicesInfo', TypeInfo(Androidapi.JNI.AdMob.JNativeAd_AdChoicesInfo));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAd_Image', TypeInfo(Androidapi.JNI.AdMob.JNativeAd_Image));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAdOptions', TypeInfo(Androidapi.JNI.AdMob.JNativeAdOptions));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAdOptions_Builder', TypeInfo(Androidapi.JNI.AdMob.JNativeAdOptions_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomTemplateAd', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomTemplateAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomTemplateAd_DisplayOpenMeasurement', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomTemplateAd_DisplayOpenMeasurement));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomTemplateAd_OnCustomClickListener', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomTemplateAd_OnCustomClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomTemplateAd_OnCustomTemplateAdLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JOnAdManagerAdViewLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JOnAdManagerAdViewLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JShouldDelayBannerRenderingListener', TypeInfo(Androidapi.JNI.AdMob.JShouldDelayBannerRenderingListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JUnifiedNativeAd', TypeInfo(Androidapi.JNI.AdMob.JUnifiedNativeAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JUnifiedNativeAd_OnUnifiedNativeAdLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JUnifiedNativeAd_UnconfirmedClickListener', TypeInfo(Androidapi.JNI.AdMob.JUnifiedNativeAd_UnconfirmedClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInitializationStatus', TypeInfo(Androidapi.JNI.AdMob.JInitializationStatus));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JOnInitializationCompleteListener', TypeInfo(Androidapi.JNI.AdMob.JOnInitializationCompleteListener));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zza', TypeInfo(Androidapi.JNI.AdMob.Jclient_zza));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzaz', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzaz));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzbe', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzbe));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzbh', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzbh));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzbk', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzbk));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzbn', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzbn));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzbu', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzbu));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzby', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzby));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzc', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzc));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzcb', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzcb));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzcf', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzcf));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzci', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzci));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdg', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdg));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdn', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdn));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdq', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdq));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdt', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdt));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdu', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdu));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdw', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdw));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzdx', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzdx));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zze', TypeInfo(Androidapi.JNI.AdMob.Jclient_zze));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzea', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzea));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzfh', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzfh));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzfl', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzfl));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzl', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzl));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzp', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzp));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzq', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzq));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzs', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzs));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzu', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzu));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jclient_zzw', TypeInfo(Androidapi.JNI.AdMob.Jclient_zzw));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jinterstitial_InterstitialAd', TypeInfo(Androidapi.JNI.AdMob.Jinterstitial_InterstitialAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInterstitialAdLoadCallback', TypeInfo(Androidapi.JNI.AdMob.JInterstitialAdLoadCallback));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationAdRequest', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMediationExtrasReceiver', TypeInfo(Androidapi.JNI.AdMob.JMediationExtrasReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationAdapter', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationBannerAdapter', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationBannerAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationBannerListener', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationBannerListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationInterstitialAdapter', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationInterstitialAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jmediation_MediationInterstitialListener', TypeInfo(Androidapi.JNI.AdMob.Jmediation_MediationInterstitialListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMediationNativeAdapter', TypeInfo(Androidapi.JNI.AdMob.JMediationNativeAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JMediationNativeListener', TypeInfo(Androidapi.JNI.AdMob.JMediationNativeListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeMediationAdRequest', TypeInfo(Androidapi.JNI.AdMob.JNativeMediationAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNetworkExtras', TypeInfo(Androidapi.JNI.AdMob.JNetworkExtras));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JUnifiedNativeAdMapper', TypeInfo(Androidapi.JNI.AdMob.JUnifiedNativeAdMapper));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jnativead_NativeAd', TypeInfo(Androidapi.JNI.AdMob.Jnativead_NativeAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jnativead_NativeAd_AdChoicesInfo', TypeInfo(Androidapi.JNI.AdMob.Jnativead_NativeAd_AdChoicesInfo));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jnativead_NativeAd_Image', TypeInfo(Androidapi.JNI.AdMob.Jnativead_NativeAd_Image));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAd_OnNativeAdLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JNativeAd_OnNativeAdLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeAd_UnconfirmedClickListener', TypeInfo(Androidapi.JNI.AdMob.JNativeAd_UnconfirmedClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jnativead_NativeAdOptions', TypeInfo(Androidapi.JNI.AdMob.Jnativead_NativeAdOptions));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jnativead_NativeAdOptions_Builder', TypeInfo(Androidapi.JNI.AdMob.Jnativead_NativeAdOptions_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomFormatAd', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomFormatAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomFormatAd_DisplayOpenMeasurement', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomFormatAd_DisplayOpenMeasurement));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomFormatAd_OnCustomClickListener', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomFormatAd_OnCustomClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JNativeCustomFormatAd_OnCustomFormatAdLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JNativeCustomFormatAd_OnCustomFormatAdLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JSearchAdRequest', TypeInfo(Androidapi.JNI.AdMob.JSearchAdRequest));
  //TRegTypes.RegisterType('Androidapi.JNI.AdMob.Jsearch_zzb', TypeInfo(Androidapi.JNI.AdMob.Jsearch_zzb));
end;

initialization
  RegisterTypes;
end.


