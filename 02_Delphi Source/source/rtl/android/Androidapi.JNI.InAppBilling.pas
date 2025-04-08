{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.InAppBilling;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JAccountIdentifiers = interface;//com.android.billingclient.api.AccountIdentifiers
  JAcknowledgePurchaseParams = interface;//com.android.billingclient.api.AcknowledgePurchaseParams
  JAcknowledgePurchaseParams_Builder = interface;//com.android.billingclient.api.AcknowledgePurchaseParams$Builder
  JAcknowledgePurchaseResponseListener = interface;//com.android.billingclient.api.AcknowledgePurchaseResponseListener
  JAlternativeBillingListener = interface;//com.android.billingclient.api.AlternativeBillingListener
  JAlternativeChoiceDetails = interface;//com.android.billingclient.api.AlternativeChoiceDetails
  JAlternativeChoiceDetails_Product = interface;//com.android.billingclient.api.AlternativeChoiceDetails$Product
  JBillingClient = interface;//com.android.billingclient.api.BillingClient
  JBillingClient_BillingResponseCode = interface;//com.android.billingclient.api.BillingClient$BillingResponseCode
  JBillingClient_Builder = interface;//com.android.billingclient.api.BillingClient$Builder
  JBillingClient_ConnectionState = interface;//com.android.billingclient.api.BillingClient$ConnectionState
  JBillingClient_FeatureType = interface;//com.android.billingclient.api.BillingClient$FeatureType
  JBillingClient_ProductType = interface;//com.android.billingclient.api.BillingClient$ProductType
  JBillingClient_SkuType = interface;//com.android.billingclient.api.BillingClient$SkuType
  //JBillingClientImpl = interface;//com.android.billingclient.api.BillingClientImpl
  JBillingClientStateListener = interface;//com.android.billingclient.api.BillingClientStateListener
  JBillingFlowParams = interface;//com.android.billingclient.api.BillingFlowParams
  JBillingFlowParams_Builder = interface;//com.android.billingclient.api.BillingFlowParams$Builder
  JBillingFlowParams_ProductDetailsParams = interface;//com.android.billingclient.api.BillingFlowParams$ProductDetailsParams
  JProductDetailsParams_Builder = interface;//com.android.billingclient.api.BillingFlowParams$ProductDetailsParams$Builder
  JBillingFlowParams_ProrationMode = interface;//com.android.billingclient.api.BillingFlowParams$ProrationMode
  JBillingFlowParams_SubscriptionUpdateParams = interface;//com.android.billingclient.api.BillingFlowParams$SubscriptionUpdateParams
  JSubscriptionUpdateParams_Builder = interface;//com.android.billingclient.api.BillingFlowParams$SubscriptionUpdateParams$Builder
  JSubscriptionUpdateParams_ReplacementMode = interface;//com.android.billingclient.api.BillingFlowParams$SubscriptionUpdateParams$ReplacementMode
  JBillingResult = interface;//com.android.billingclient.api.BillingResult
  JBillingResult_Builder = interface;//com.android.billingclient.api.BillingResult$Builder
  JConsumeParams = interface;//com.android.billingclient.api.ConsumeParams
  JConsumeParams_Builder = interface;//com.android.billingclient.api.ConsumeParams$Builder
  JConsumeResponseListener = interface;//com.android.billingclient.api.ConsumeResponseListener
  JInAppMessageParams = interface;//com.android.billingclient.api.InAppMessageParams
  JInAppMessageParams_Builder = interface;//com.android.billingclient.api.InAppMessageParams$Builder
  JInAppMessageParams_InAppMessageCategoryId = interface;//com.android.billingclient.api.InAppMessageParams$InAppMessageCategoryId
  JInAppMessageResponseListener = interface;//com.android.billingclient.api.InAppMessageResponseListener
  JInAppMessageResult = interface;//com.android.billingclient.api.InAppMessageResult
  JInAppMessageResult_InAppMessageResponseCode = interface;//com.android.billingclient.api.InAppMessageResult$InAppMessageResponseCode
  JProductDetails = interface;//com.android.billingclient.api.ProductDetails
  JProductDetails_OneTimePurchaseOfferDetails = interface;//com.android.billingclient.api.ProductDetails$OneTimePurchaseOfferDetails
  JProductDetails_PricingPhase = interface;//com.android.billingclient.api.ProductDetails$PricingPhase
  JProductDetails_PricingPhases = interface;//com.android.billingclient.api.ProductDetails$PricingPhases
  JProductDetails_RecurrenceMode = interface;//com.android.billingclient.api.ProductDetails$RecurrenceMode
  JProductDetails_SubscriptionOfferDetails = interface;//com.android.billingclient.api.ProductDetails$SubscriptionOfferDetails
  JProductDetailsResponseListener = interface;//com.android.billingclient.api.ProductDetailsResponseListener
  JProxyBillingActivity = interface;//com.android.billingclient.api.ProxyBillingActivity
  JPurchase = interface;//com.android.billingclient.api.Purchase
  JPurchase_PurchaseState = interface;//com.android.billingclient.api.Purchase$PurchaseState
  JPurchaseHistoryRecord = interface;//com.android.billingclient.api.PurchaseHistoryRecord
  JPurchaseHistoryResponseListener = interface;//com.android.billingclient.api.PurchaseHistoryResponseListener
  JPurchasesResponseListener = interface;//com.android.billingclient.api.PurchasesResponseListener
  JPurchasesUpdatedListener = interface;//com.android.billingclient.api.PurchasesUpdatedListener
  JQueryProductDetailsParams = interface;//com.android.billingclient.api.QueryProductDetailsParams
  JQueryProductDetailsParams_Builder = interface;//com.android.billingclient.api.QueryProductDetailsParams$Builder
  JQueryProductDetailsParams_Product = interface;//com.android.billingclient.api.QueryProductDetailsParams$Product
  JProduct_Builder = interface;//com.android.billingclient.api.QueryProductDetailsParams$Product$Builder
  JQueryPurchaseHistoryParams = interface;//com.android.billingclient.api.QueryPurchaseHistoryParams
  JQueryPurchaseHistoryParams_Builder = interface;//com.android.billingclient.api.QueryPurchaseHistoryParams$Builder
  JQueryPurchasesParams = interface;//com.android.billingclient.api.QueryPurchasesParams
  JQueryPurchasesParams_Builder = interface;//com.android.billingclient.api.QueryPurchasesParams$Builder
  JSkuDetails = interface;//com.android.billingclient.api.SkuDetails
  JSkuDetailsParams = interface;//com.android.billingclient.api.SkuDetailsParams
  JSkuDetailsParams_Builder = interface;//com.android.billingclient.api.SkuDetailsParams$Builder
  JSkuDetailsResponseListener = interface;//com.android.billingclient.api.SkuDetailsResponseListener
  //Jbillingclient_api_zza = interface;//com.android.billingclient.api.zza
  //Japi_zzaa = interface;//com.android.billingclient.api.zzaa
  //Japi_zzab = interface;//com.android.billingclient.api.zzab
  //Japi_zzac = interface;//com.android.billingclient.api.zzac
  //Japi_zzad = interface;//com.android.billingclient.api.zzad
  //Japi_zzae = interface;//com.android.billingclient.api.zzae
  //Japi_zzaf = interface;//com.android.billingclient.api.zzaf
  //Japi_zzag = interface;//com.android.billingclient.api.zzag
  //Japi_zzah = interface;//com.android.billingclient.api.zzah
  //Japi_zzai = interface;//com.android.billingclient.api.zzai
  //Japi_zzaj = interface;//com.android.billingclient.api.zzaj
  //Japi_zzak = interface;//com.android.billingclient.api.zzak
  //Japi_zzal = interface;//com.android.billingclient.api.zzal
  //Japi_zzam = interface;//com.android.billingclient.api.zzam
  //Japi_zzan = interface;//com.android.billingclient.api.zzan
  //Japi_zzao = interface;//com.android.billingclient.api.zzao
  //Japi_zzap = interface;//com.android.billingclient.api.zzap
  //Japi_zzaq = interface;//com.android.billingclient.api.zzaq
  //Japi_zzar = interface;//com.android.billingclient.api.zzar
  //Japi_zzas = interface;//com.android.billingclient.api.zzas
  //Japi_zzat = interface;//com.android.billingclient.api.zzat
  //Japi_zzau = interface;//com.android.billingclient.api.zzau
  //Japi_zzav = interface;//com.android.billingclient.api.zzav
  //Japi_zzaw = interface;//com.android.billingclient.api.zzaw
  //Japi_zzax = interface;//com.android.billingclient.api.zzax
  //Japi_zzay = interface;//com.android.billingclient.api.zzay
  //Japi_zzaz = interface;//com.android.billingclient.api.zzaz
  //Jbillingclient_api_zzb = interface;//com.android.billingclient.api.zzb
  //Japi_zzba = interface;//com.android.billingclient.api.zzba
  //Japi_zzbb = interface;//com.android.billingclient.api.zzbb
  //Japi_zzbc = interface;//com.android.billingclient.api.zzbc
  //Japi_zzbd = interface;//com.android.billingclient.api.zzbd
  //Japi_zzbe = interface;//com.android.billingclient.api.zzbe
  //Japi_zzbf = interface;//com.android.billingclient.api.zzbf
  //Japi_zzbg = interface;//com.android.billingclient.api.zzbg
  //Japi_zzbh = interface;//com.android.billingclient.api.zzbh
  //Japi_zzbi = interface;//com.android.billingclient.api.zzbi
  //Japi_zzbj = interface;//com.android.billingclient.api.zzbj
  //Japi_zzbk = interface;//com.android.billingclient.api.zzbk
  //Japi_zzbl = interface;//com.android.billingclient.api.zzbl
  //Japi_zzbm = interface;//com.android.billingclient.api.zzbm
  //Japi_zzbn = interface;//com.android.billingclient.api.zzbn
  //Japi_zzbo = interface;//com.android.billingclient.api.zzbo
  //Japi_zzbp = interface;//com.android.billingclient.api.zzbp
  //Japi_zzbq = interface;//com.android.billingclient.api.zzbq
  //Japi_zzbr = interface;//com.android.billingclient.api.zzbr
  //Japi_zzbs = interface;//com.android.billingclient.api.zzbs
  //Japi_zzbt = interface;//com.android.billingclient.api.zzbt
  //Japi_zzbu = interface;//com.android.billingclient.api.zzbu
  //Japi_zzc = interface;//com.android.billingclient.api.zzc
  //Japi_zzd = interface;//com.android.billingclient.api.zzd
  //Japi_zze = interface;//com.android.billingclient.api.zze
  //Japi_zzf = interface;//com.android.billingclient.api.zzf
  //Japi_zzg = interface;//com.android.billingclient.api.zzg
  //Japi_zzh = interface;//com.android.billingclient.api.zzh
  //Japi_zzi = interface;//com.android.billingclient.api.zzi
  //Japi_zzj = interface;//com.android.billingclient.api.zzj
  //Japi_zzk = interface;//com.android.billingclient.api.zzk
  //Japi_zzl = interface;//com.android.billingclient.api.zzl
  //Japi_zzm = interface;//com.android.billingclient.api.zzm
  //Japi_zzn = interface;//com.android.billingclient.api.zzn
  //Japi_zzo = interface;//com.android.billingclient.api.zzo
  //Japi_zzp = interface;//com.android.billingclient.api.zzp
  //Japi_zzq = interface;//com.android.billingclient.api.zzq
  //Japi_zzr = interface;//com.android.billingclient.api.zzr
  //Japi_zzs = interface;//com.android.billingclient.api.zzs
  //Japi_zzt = interface;//com.android.billingclient.api.zzt
  //Japi_zzu = interface;//com.android.billingclient.api.zzu
  //Japi_zzv = interface;//com.android.billingclient.api.zzv
  //Japi_zzw = interface;//com.android.billingclient.api.zzw
  //Japi_zzx = interface;//com.android.billingclient.api.zzx
  //Japi_zzy = interface;//com.android.billingclient.api.zzy
  //Japi_zzz = interface;//com.android.billingclient.api.zzz

// ===== Interface declarations =====

  JAccountIdentifiersClass = interface(JObjectClass)
    ['{54C12E5B-3AA7-4A2D-881B-467461C7929C}']
  end;

  [JavaSignature('com/android/billingclient/api/AccountIdentifiers')]
  JAccountIdentifiers = interface(JObject)
    ['{F236B658-87C4-4F21-8060-1A9AF7D3C9BA}']
    function getObfuscatedAccountId: JString; cdecl;
    function getObfuscatedProfileId: JString; cdecl;
  end;
  TJAccountIdentifiers = class(TJavaGenericImport<JAccountIdentifiersClass, JAccountIdentifiers>) end;

  JAcknowledgePurchaseParamsClass = interface(JObjectClass)
    ['{C309E723-7818-4297-A7CD-DE5A6A3AF6A2}']
    {class} function newBuilder: JAcknowledgePurchaseParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/AcknowledgePurchaseParams')]
  JAcknowledgePurchaseParams = interface(JObject)
    ['{53B9E7E9-4B9D-478D-AF63-0732121475F6}']
    function getPurchaseToken: JString; cdecl;
  end;
  TJAcknowledgePurchaseParams = class(TJavaGenericImport<JAcknowledgePurchaseParamsClass, JAcknowledgePurchaseParams>) end;

  JAcknowledgePurchaseParams_BuilderClass = interface(JObjectClass)
    ['{4B3B484A-324A-4BCA-B839-8E1933A66D87}']
  end;

  [JavaSignature('com/android/billingclient/api/AcknowledgePurchaseParams$Builder')]
  JAcknowledgePurchaseParams_Builder = interface(JObject)
    ['{891F4B88-982D-4F3D-B8AD-413060C638BA}']
    function build: JAcknowledgePurchaseParams; cdecl;
    function setPurchaseToken(purchaseToken: JString): JAcknowledgePurchaseParams_Builder; cdecl;
  end;
  TJAcknowledgePurchaseParams_Builder = class(TJavaGenericImport<JAcknowledgePurchaseParams_BuilderClass, JAcknowledgePurchaseParams_Builder>) end;

  JAcknowledgePurchaseResponseListenerClass = interface(IJavaClass)
    ['{07701673-E94F-47D5-B520-5BACF64253E0}']
  end;

  [JavaSignature('com/android/billingclient/api/AcknowledgePurchaseResponseListener')]
  JAcknowledgePurchaseResponseListener = interface(IJavaInstance)
    ['{4E2E7040-5D1C-44C6-AFD2-403DD1D5E21D}']
    procedure onAcknowledgePurchaseResponse(billingResult: JBillingResult); cdecl;
  end;
  TJAcknowledgePurchaseResponseListener = class(TJavaGenericImport<JAcknowledgePurchaseResponseListenerClass, JAcknowledgePurchaseResponseListener>) end;

  JAlternativeBillingListenerClass = interface(IJavaClass)
    ['{05384022-2699-41DF-8725-7D343D43C706}']
  end;

  [JavaSignature('com/android/billingclient/api/AlternativeBillingListener')]
  JAlternativeBillingListener = interface(IJavaInstance)
    ['{E6E67E97-A372-49FD-8A81-82E46B4495A1}']
    procedure userSelectedAlternativeBilling(alternativeChoiceDetails: JAlternativeChoiceDetails); cdecl;
  end;
  TJAlternativeBillingListener = class(TJavaGenericImport<JAlternativeBillingListenerClass, JAlternativeBillingListener>) end;

  JAlternativeChoiceDetailsClass = interface(JObjectClass)
    ['{278DFEC7-3A2F-4F4A-9C94-83277EE76048}']
  end;

  [JavaSignature('com/android/billingclient/api/AlternativeChoiceDetails')]
  JAlternativeChoiceDetails = interface(JObject)
    ['{DE0DAD2D-CE96-4656-AF29-C902ADC7134E}']
    function getExternalTransactionToken: JString; cdecl;
    function getOriginalExternalTransactionId: JString; cdecl;
    function getProducts: JList; cdecl;
  end;
  TJAlternativeChoiceDetails = class(TJavaGenericImport<JAlternativeChoiceDetailsClass, JAlternativeChoiceDetails>) end;

  JAlternativeChoiceDetails_ProductClass = interface(JObjectClass)
    ['{B433ECEB-65AB-4FF3-B8E8-5B47D99B8EE9}']
  end;

  [JavaSignature('com/android/billingclient/api/AlternativeChoiceDetails$Product')]
  JAlternativeChoiceDetails_Product = interface(JObject)
    ['{BAA7EEF8-C9EF-43E6-AB0E-8690731369DF}']
    function equals(o: JObject): Boolean; cdecl;
    function getId: JString; cdecl;
    function getOfferToken: JString; cdecl;
    function getType: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAlternativeChoiceDetails_Product = class(TJavaGenericImport<JAlternativeChoiceDetails_ProductClass, JAlternativeChoiceDetails_Product>) end;

  JBillingClientClass = interface(JObjectClass)
    ['{A434A6E1-AADD-461A-A14E-7F11ED420F0C}']
    {class} function init: JBillingClient; cdecl;
    {class} function newBuilder(context: JContext): JBillingClient_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient')]
  JBillingClient = interface(JObject)
    ['{D5E51326-F1FD-4830-A32A-CD73BAD5D191}']
    procedure acknowledgePurchase(params: JAcknowledgePurchaseParams; listener: JAcknowledgePurchaseResponseListener); cdecl;
    procedure consumeAsync(consumeParams: JConsumeParams; listener: JConsumeResponseListener); cdecl;
    procedure endConnection; cdecl;
    function getConnectionState: Integer; cdecl;
    function isFeatureSupported(feature: JString): JBillingResult; cdecl;
    function isReady: Boolean; cdecl;
    function launchBillingFlow(activity: JActivity; params: JBillingFlowParams): JBillingResult; cdecl;
    procedure queryProductDetailsAsync(params: JQueryProductDetailsParams; listener: JProductDetailsResponseListener); cdecl;
    procedure queryPurchaseHistoryAsync(skuType: JString; listener: JPurchaseHistoryResponseListener); cdecl; overload;
    procedure queryPurchaseHistoryAsync(queryPurchaseHistoryParams: JQueryPurchaseHistoryParams; listener: JPurchaseHistoryResponseListener); cdecl; overload;
    procedure queryPurchasesAsync(skuType: JString; listener: JPurchasesResponseListener); cdecl; overload;
    procedure queryPurchasesAsync(queryPurchasesParams: JQueryPurchasesParams; listener: JPurchasesResponseListener); cdecl; overload;
    procedure querySkuDetailsAsync(params: JSkuDetailsParams; listener: JSkuDetailsResponseListener); cdecl;
    function showInAppMessages(activity: JActivity; params: JInAppMessageParams; listener: JInAppMessageResponseListener): JBillingResult; cdecl;
    procedure startConnection(listener: JBillingClientStateListener); cdecl;
  end;
  TJBillingClient = class(TJavaGenericImport<JBillingClientClass, JBillingClient>) end;

  JBillingClient_BillingResponseCodeClass = interface(JAnnotationClass)
    ['{D0FD3261-41B9-4D8B-B384-013849E65E36}']
    {class} function _GetBILLING_UNAVAILABLE: Integer; cdecl;
    {class} function _GetDEVELOPER_ERROR: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetFEATURE_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetITEM_ALREADY_OWNED: Integer; cdecl;
    {class} function _GetITEM_NOT_OWNED: Integer; cdecl;
    {class} function _GetITEM_UNAVAILABLE: Integer; cdecl;
    {class} function _GetNETWORK_ERROR: Integer; cdecl;
    {class} function _GetOK: Integer; cdecl;
    {class} function _GetSERVICE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSERVICE_TIMEOUT: Integer; cdecl;
    {class} function _GetSERVICE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetUSER_CANCELED: Integer; cdecl;
    {class} property BILLING_UNAVAILABLE: Integer read _GetBILLING_UNAVAILABLE;
    {class} property DEVELOPER_ERROR: Integer read _GetDEVELOPER_ERROR;
    {class} property ERROR: Integer read _GetERROR;
    {class} property FEATURE_NOT_SUPPORTED: Integer read _GetFEATURE_NOT_SUPPORTED;
    {class} property ITEM_ALREADY_OWNED: Integer read _GetITEM_ALREADY_OWNED;
    {class} property ITEM_NOT_OWNED: Integer read _GetITEM_NOT_OWNED;
    {class} property ITEM_UNAVAILABLE: Integer read _GetITEM_UNAVAILABLE;
    {class} property NETWORK_ERROR: Integer read _GetNETWORK_ERROR;
    {class} property OK: Integer read _GetOK;
    {class} property SERVICE_DISCONNECTED: Integer read _GetSERVICE_DISCONNECTED;
    {class} property SERVICE_TIMEOUT: Integer read _GetSERVICE_TIMEOUT;
    {class} property SERVICE_UNAVAILABLE: Integer read _GetSERVICE_UNAVAILABLE;
    {class} property USER_CANCELED: Integer read _GetUSER_CANCELED;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$BillingResponseCode')]
  JBillingClient_BillingResponseCode = interface(JAnnotation)
    ['{D76F7368-EF8A-4567-B5DC-10D75860C3B5}']
  end;
  TJBillingClient_BillingResponseCode = class(TJavaGenericImport<JBillingClient_BillingResponseCodeClass, JBillingClient_BillingResponseCode>) end;

  JBillingClient_BuilderClass = interface(JObjectClass)
    ['{A200D971-E13E-4AD3-BDFC-EFF15A5FB290}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$Builder')]
  JBillingClient_Builder = interface(JObject)
    ['{CCDAAFD6-F509-414B-A1C8-9904AC9CA641}']
    function build: JBillingClient; cdecl;
    function enableAlternativeBilling(alternativeBillingListener: JAlternativeBillingListener): JBillingClient_Builder; cdecl;
    function enablePendingPurchases: JBillingClient_Builder; cdecl;
    function setListener(listener: JPurchasesUpdatedListener): JBillingClient_Builder; cdecl;
  end;
  TJBillingClient_Builder = class(TJavaGenericImport<JBillingClient_BuilderClass, JBillingClient_Builder>) end;

  JBillingClient_ConnectionStateClass = interface(JAnnotationClass)
    ['{18D6F734-5178-402B-B7E2-FF684C24E020}']
    {class} function _GetCLOSED: Integer; cdecl;
    {class} function _GetCONNECTED: Integer; cdecl;
    {class} function _GetCONNECTING: Integer; cdecl;
    {class} function _GetDISCONNECTED: Integer; cdecl;
    {class} property CLOSED: Integer read _GetCLOSED;
    {class} property CONNECTED: Integer read _GetCONNECTED;
    {class} property CONNECTING: Integer read _GetCONNECTING;
    {class} property DISCONNECTED: Integer read _GetDISCONNECTED;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$ConnectionState')]
  JBillingClient_ConnectionState = interface(JAnnotation)
    ['{22D3C579-8630-471D-B059-274B21A2AE3B}']
  end;
  TJBillingClient_ConnectionState = class(TJavaGenericImport<JBillingClient_ConnectionStateClass, JBillingClient_ConnectionState>) end;

  JBillingClient_FeatureTypeClass = interface(JAnnotationClass)
    ['{E3F8FCE3-1E32-4DDC-A053-240E0D48A75D}']
    {class} function _GetIN_APP_MESSAGING: JString; cdecl;
    {class} function _GetPRICE_CHANGE_CONFIRMATION: JString; cdecl;
    {class} function _GetPRODUCT_DETAILS: JString; cdecl;
    {class} function _GetSUBSCRIPTIONS: JString; cdecl;
    {class} function _GetSUBSCRIPTIONS_UPDATE: JString; cdecl;
    {class} property IN_APP_MESSAGING: JString read _GetIN_APP_MESSAGING;
    {class} property PRICE_CHANGE_CONFIRMATION: JString read _GetPRICE_CHANGE_CONFIRMATION;
    {class} property PRODUCT_DETAILS: JString read _GetPRODUCT_DETAILS;
    {class} property SUBSCRIPTIONS: JString read _GetSUBSCRIPTIONS;
    {class} property SUBSCRIPTIONS_UPDATE: JString read _GetSUBSCRIPTIONS_UPDATE;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$FeatureType')]
  JBillingClient_FeatureType = interface(JAnnotation)
    ['{931B9E87-D2BA-4480-B257-B93EF7370BD9}']
  end;
  TJBillingClient_FeatureType = class(TJavaGenericImport<JBillingClient_FeatureTypeClass, JBillingClient_FeatureType>) end;

  JBillingClient_ProductTypeClass = interface(JAnnotationClass)
    ['{5D44C026-D82E-4E91-880A-9363041F8D95}']
    {class} function _GetINAPP: JString; cdecl;
    {class} function _GetSUBS: JString; cdecl;
    {class} property INAPP: JString read _GetINAPP;
    {class} property SUBS: JString read _GetSUBS;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$ProductType')]
  JBillingClient_ProductType = interface(JAnnotation)
    ['{A29B80BC-E1BD-4C5C-92AC-44A497DC8BCE}']
  end;
  TJBillingClient_ProductType = class(TJavaGenericImport<JBillingClient_ProductTypeClass, JBillingClient_ProductType>) end;

  JBillingClient_SkuTypeClass = interface(JAnnotationClass)
    ['{43812266-76F1-42E2-9421-6CE60149A298}']
    {class} function _GetINAPP: JString; cdecl;
    {class} function _GetSUBS: JString; cdecl;
    {class} property INAPP: JString read _GetINAPP;
    {class} property SUBS: JString read _GetSUBS;
  end;

  [JavaSignature('com/android/billingclient/api/BillingClient$SkuType')]
  JBillingClient_SkuType = interface(JAnnotation)
    ['{89F7BBF5-92BA-4AD5-8A94-97522A6E9BD8}']
  end;
  TJBillingClient_SkuType = class(TJavaGenericImport<JBillingClient_SkuTypeClass, JBillingClient_SkuType>) end;

  // com.android.billingclient.api.BillingClientImpl
  JBillingClientStateListenerClass = interface(IJavaClass)
    ['{93238DE8-9838-4189-B4C7-06D75A3CB9DD}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingClientStateListener')]
  JBillingClientStateListener = interface(IJavaInstance)
    ['{3831AC56-24D0-4A0F-9732-878A02D6D306}']
    procedure onBillingServiceDisconnected; cdecl;
    procedure onBillingSetupFinished(billingResult: JBillingResult); cdecl;
  end;
  TJBillingClientStateListener = class(TJavaGenericImport<JBillingClientStateListenerClass, JBillingClientStateListener>) end;

  JBillingFlowParamsClass = interface(JObjectClass)
    ['{74D49052-C862-42ED-BB13-8ECC17D5D33F}']
    {class} function _GetEXTRA_PARAM_KEY_ACCOUNT_ID: JString; cdecl;
    {class} function newBuilder: JBillingFlowParams_Builder; cdecl;
    {class} property EXTRA_PARAM_KEY_ACCOUNT_ID: JString read _GetEXTRA_PARAM_KEY_ACCOUNT_ID;
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams')]
  JBillingFlowParams = interface(JObject)
    ['{ABF549EE-63F7-4167-BE65-0F47FAFE3848}']
    //function zza: Integer; cdecl;
    //function zzb: Integer; cdecl;
    //function zzc: JString; cdecl;
    //function zzd: JString; cdecl;
    //function zze: JString; cdecl;
    //function zzf: JString; cdecl;
    //function zzg: JArrayList; cdecl;
    //function zzh: JList; cdecl;
    //function zzp: Boolean; cdecl;
  end;
  TJBillingFlowParams = class(TJavaGenericImport<JBillingFlowParamsClass, JBillingFlowParams>) end;

  JBillingFlowParams_BuilderClass = interface(JObjectClass)
    ['{55C4AFB5-7181-4379-BEC7-87CA32884552}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$Builder')]
  JBillingFlowParams_Builder = interface(JObject)
    ['{AD27BDD3-6295-4612-BF77-DC0D1C0353C6}']
    function build: JBillingFlowParams; cdecl;
    function setIsOfferPersonalized(isOfferPersonalized: Boolean): JBillingFlowParams_Builder; cdecl;
    function setObfuscatedAccountId(obfuscatedAccountid: JString): JBillingFlowParams_Builder; cdecl;
    function setObfuscatedProfileId(obfuscatedProfileId: JString): JBillingFlowParams_Builder; cdecl;
    function setProductDetailsParamsList(productDetailsParamsList: JList): JBillingFlowParams_Builder; cdecl;
    function setSkuDetails(skuDetails: JSkuDetails): JBillingFlowParams_Builder; cdecl;
    function setSubscriptionUpdateParams(subscriptionUpdateParams: JBillingFlowParams_SubscriptionUpdateParams): JBillingFlowParams_Builder; cdecl;
  end;
  TJBillingFlowParams_Builder = class(TJavaGenericImport<JBillingFlowParams_BuilderClass, JBillingFlowParams_Builder>) end;

  JBillingFlowParams_ProductDetailsParamsClass = interface(JObjectClass)
    ['{2CB0B91D-B7C7-4DD9-8215-2F7D5774983D}']
    {class} function newBuilder: JProductDetailsParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$ProductDetailsParams')]
  JBillingFlowParams_ProductDetailsParams = interface(JObject)
    ['{6F6B3B89-8CCB-4925-AABD-5BCF1029AD66}']
    //function zza: JProductDetails; cdecl;
    //function zzb: JString; cdecl;
  end;
  TJBillingFlowParams_ProductDetailsParams = class(TJavaGenericImport<JBillingFlowParams_ProductDetailsParamsClass, JBillingFlowParams_ProductDetailsParams>) end;

  JProductDetailsParams_BuilderClass = interface(JObjectClass)
    ['{53C790C2-2471-4CA4-8B9F-9F5B8547D755}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder')]
  JProductDetailsParams_Builder = interface(JObject)
    ['{EA236678-1EA0-4CF7-AB0B-D2377D443528}']
    function build: JBillingFlowParams_ProductDetailsParams; cdecl;
    function setOfferToken(offerToken: JString): JProductDetailsParams_Builder; cdecl;
    function setProductDetails(productDetails: JProductDetails): JProductDetailsParams_Builder; cdecl;
  end;
  TJProductDetailsParams_Builder = class(TJavaGenericImport<JProductDetailsParams_BuilderClass, JProductDetailsParams_Builder>) end;

  JBillingFlowParams_ProrationModeClass = interface(JAnnotationClass)
    ['{99728726-539C-4877-B1A9-D0CC1DA7A424}']
    {class} function _GetDEFERRED: Integer; cdecl;
    {class} function _GetIMMEDIATE_AND_CHARGE_FULL_PRICE: Integer; cdecl;
    {class} function _GetIMMEDIATE_AND_CHARGE_PRORATED_PRICE: Integer; cdecl;
    {class} function _GetIMMEDIATE_WITHOUT_PRORATION: Integer; cdecl;
    {class} function _GetIMMEDIATE_WITH_TIME_PRORATION: Integer; cdecl;
    {class} function _GetUNKNOWN_SUBSCRIPTION_UPGRADE_DOWNGRADE_POLICY: Integer; cdecl;
    {class} property DEFERRED: Integer read _GetDEFERRED;
    {class} property IMMEDIATE_AND_CHARGE_FULL_PRICE: Integer read _GetIMMEDIATE_AND_CHARGE_FULL_PRICE;
    {class} property IMMEDIATE_AND_CHARGE_PRORATED_PRICE: Integer read _GetIMMEDIATE_AND_CHARGE_PRORATED_PRICE;
    {class} property IMMEDIATE_WITHOUT_PRORATION: Integer read _GetIMMEDIATE_WITHOUT_PRORATION;
    {class} property IMMEDIATE_WITH_TIME_PRORATION: Integer read _GetIMMEDIATE_WITH_TIME_PRORATION;
    {class} property UNKNOWN_SUBSCRIPTION_UPGRADE_DOWNGRADE_POLICY: Integer read _GetUNKNOWN_SUBSCRIPTION_UPGRADE_DOWNGRADE_POLICY;
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$ProrationMode')]
  JBillingFlowParams_ProrationMode = interface(JAnnotation)
    ['{300B2445-6F3C-4CC8-A95A-FC84AEE147C6}']
  end;
  TJBillingFlowParams_ProrationMode = class(TJavaGenericImport<JBillingFlowParams_ProrationModeClass, JBillingFlowParams_ProrationMode>) end;

  JBillingFlowParams_SubscriptionUpdateParamsClass = interface(JObjectClass)
    ['{EADFA883-E8E0-4B1E-A376-EFB9BAC52BFA}']
    {class} function newBuilder: JSubscriptionUpdateParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams')]
  JBillingFlowParams_SubscriptionUpdateParams = interface(JObject)
    ['{B64EFDAE-A885-4465-977B-B56159F04B76}']
  end;
  TJBillingFlowParams_SubscriptionUpdateParams = class(TJavaGenericImport<JBillingFlowParams_SubscriptionUpdateParamsClass, JBillingFlowParams_SubscriptionUpdateParams>) end;

  JSubscriptionUpdateParams_BuilderClass = interface(JObjectClass)
    ['{BCABD44B-8BD9-45C0-8D32-6A59E850A383}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$Builder')]
  JSubscriptionUpdateParams_Builder = interface(JObject)
    ['{C23EE354-36AE-44B6-BF6F-EB2BED2CC00D}']
    function build: JBillingFlowParams_SubscriptionUpdateParams; cdecl;
    function setOldPurchaseToken(purchaseToken: JString): JSubscriptionUpdateParams_Builder; cdecl;
    function setOldSkuPurchaseToken(purchaseToken: JString): JSubscriptionUpdateParams_Builder; cdecl;
    function setOriginalExternalTransactionId(externalTransactionId: JString): JSubscriptionUpdateParams_Builder; cdecl;
    function setReplaceProrationMode(replaceSkusProrationMode: Integer): JSubscriptionUpdateParams_Builder; cdecl;
    function setReplaceSkusProrationMode(replaceSkusProrationMode: Integer): JSubscriptionUpdateParams_Builder; cdecl;
    function setSubscriptionReplacementMode(subscriptionReplacementMode: Integer): JSubscriptionUpdateParams_Builder; cdecl;
  end;
  TJSubscriptionUpdateParams_Builder = class(TJavaGenericImport<JSubscriptionUpdateParams_BuilderClass, JSubscriptionUpdateParams_Builder>) end;

  JSubscriptionUpdateParams_ReplacementModeClass = interface(JAnnotationClass)
    ['{54F4F100-A928-43B8-A8BE-F1F0A0B8876B}']
    {class} function _GetCHARGE_FULL_PRICE: Integer; cdecl;
    {class} function _GetCHARGE_PRORATED_PRICE: Integer; cdecl;
    {class} function _GetDEFERRED: Integer; cdecl;
    {class} function _GetUNKNOWN_REPLACEMENT_MODE: Integer; cdecl;
    {class} function _GetWITHOUT_PRORATION: Integer; cdecl;
    {class} function _GetWITH_TIME_PRORATION: Integer; cdecl;
    {class} property CHARGE_FULL_PRICE: Integer read _GetCHARGE_FULL_PRICE;
    {class} property CHARGE_PRORATED_PRICE: Integer read _GetCHARGE_PRORATED_PRICE;
    {class} property DEFERRED: Integer read _GetDEFERRED;
    {class} property UNKNOWN_REPLACEMENT_MODE: Integer read _GetUNKNOWN_REPLACEMENT_MODE;
    {class} property WITHOUT_PRORATION: Integer read _GetWITHOUT_PRORATION;
    {class} property WITH_TIME_PRORATION: Integer read _GetWITH_TIME_PRORATION;
  end;

  [JavaSignature('com/android/billingclient/api/BillingFlowParams$SubscriptionUpdateParams$ReplacementMode')]
  JSubscriptionUpdateParams_ReplacementMode = interface(JAnnotation)
    ['{DBA621E8-52D6-4FA7-A533-981D37C10B84}']
  end;
  TJSubscriptionUpdateParams_ReplacementMode = class(TJavaGenericImport<JSubscriptionUpdateParams_ReplacementModeClass, JSubscriptionUpdateParams_ReplacementMode>) end;

  JBillingResultClass = interface(JObjectClass)
    ['{615D63AE-70E4-4684-8843-7351D56E6B52}']
    {class} function init: JBillingResult; cdecl;
    {class} function newBuilder: JBillingResult_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/BillingResult')]
  JBillingResult = interface(JObject)
    ['{615CADE8-31B1-458C-BBCE-DF7F6CEF40FF}']
    function getDebugMessage: JString; cdecl;
    function getResponseCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJBillingResult = class(TJavaGenericImport<JBillingResultClass, JBillingResult>) end;

  JBillingResult_BuilderClass = interface(JObjectClass)
    ['{E9E22C49-56C8-45E4-8CD6-07B4AD7FB7C4}']
  end;

  [JavaSignature('com/android/billingclient/api/BillingResult$Builder')]
  JBillingResult_Builder = interface(JObject)
    ['{DC1EBD92-0A9A-48D6-A886-D1D74130B795}']
    function build: JBillingResult; cdecl;
    function setDebugMessage(debugMessage: JString): JBillingResult_Builder; cdecl;
    function setResponseCode(responseCode: Integer): JBillingResult_Builder; cdecl;
  end;
  TJBillingResult_Builder = class(TJavaGenericImport<JBillingResult_BuilderClass, JBillingResult_Builder>) end;

  JConsumeParamsClass = interface(JObjectClass)
    ['{2AF612AC-E505-40CF-9A5D-45123A6C58C5}']
    {class} function newBuilder: JConsumeParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/ConsumeParams')]
  JConsumeParams = interface(JObject)
    ['{650C49FE-AB18-4399-A0B7-C6D7E4E0BB33}']
    function getPurchaseToken: JString; cdecl;
  end;
  TJConsumeParams = class(TJavaGenericImport<JConsumeParamsClass, JConsumeParams>) end;

  JConsumeParams_BuilderClass = interface(JObjectClass)
    ['{BB60298A-DE65-4C0B-A6A0-D2EDF55E8A54}']
  end;

  [JavaSignature('com/android/billingclient/api/ConsumeParams$Builder')]
  JConsumeParams_Builder = interface(JObject)
    ['{44EA18AE-D16C-4078-8C3F-6AB68CC2E8E5}']
    function build: JConsumeParams; cdecl;
    function setPurchaseToken(purchaseToken: JString): JConsumeParams_Builder; cdecl;
  end;
  TJConsumeParams_Builder = class(TJavaGenericImport<JConsumeParams_BuilderClass, JConsumeParams_Builder>) end;

  JConsumeResponseListenerClass = interface(IJavaClass)
    ['{21F0E14F-E5F6-454B-BFBB-02429E9ABF8F}']
  end;

  [JavaSignature('com/android/billingclient/api/ConsumeResponseListener')]
  JConsumeResponseListener = interface(IJavaInstance)
    ['{08AD2D2E-1B9F-472D-86D1-205630D40DEC}']
    procedure onConsumeResponse(billingResult: JBillingResult; purchaseToken: JString); cdecl;
  end;
  TJConsumeResponseListener = class(TJavaGenericImport<JConsumeResponseListenerClass, JConsumeResponseListener>) end;

  JInAppMessageParamsClass = interface(JObjectClass)
    ['{EC26971B-D104-435A-ABA0-DB21CEF753A6}']
    {class} function newBuilder: JInAppMessageParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageParams')]
  JInAppMessageParams = interface(JObject)
    ['{DDB0D846-D84A-4C1F-BD50-8096046CFDCE}']
  end;
  TJInAppMessageParams = class(TJavaGenericImport<JInAppMessageParamsClass, JInAppMessageParams>) end;

  JInAppMessageParams_BuilderClass = interface(JObjectClass)
    ['{FDA7AEAD-2C91-468C-886B-F362A6F7032F}']
    {class} function init: JInAppMessageParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageParams$Builder')]
  JInAppMessageParams_Builder = interface(JObject)
    ['{0E572AF2-FABA-4264-BE8E-64A5C1DB7CDD}']
    function addAllInAppMessageCategoriesToShow: JInAppMessageParams_Builder; cdecl;
    function addInAppMessageCategoryToShow(inAppMessageCategoryId: Integer): JInAppMessageParams_Builder; cdecl;
    function build: JInAppMessageParams; cdecl;
  end;
  TJInAppMessageParams_Builder = class(TJavaGenericImport<JInAppMessageParams_BuilderClass, JInAppMessageParams_Builder>) end;

  JInAppMessageParams_InAppMessageCategoryIdClass = interface(JAnnotationClass)
    ['{7382BF21-79E0-4D08-8FBB-58E6F61EFE81}']
    {class} function _GetTRANSACTIONAL: Integer; cdecl;
    {class} function _GetUNKNOWN_IN_APP_MESSAGE_CATEGORY_ID: Integer; cdecl;
    {class} property TRANSACTIONAL: Integer read _GetTRANSACTIONAL;
    {class} property UNKNOWN_IN_APP_MESSAGE_CATEGORY_ID: Integer read _GetUNKNOWN_IN_APP_MESSAGE_CATEGORY_ID;
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageParams$InAppMessageCategoryId')]
  JInAppMessageParams_InAppMessageCategoryId = interface(JAnnotation)
    ['{88F50CCB-A4DD-4181-9A01-FB6BF0A018CC}']
  end;
  TJInAppMessageParams_InAppMessageCategoryId = class(TJavaGenericImport<JInAppMessageParams_InAppMessageCategoryIdClass, JInAppMessageParams_InAppMessageCategoryId>) end;

  JInAppMessageResponseListenerClass = interface(IJavaClass)
    ['{44BBEBE7-B0F4-4996-825C-CCFB677A02FE}']
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageResponseListener')]
  JInAppMessageResponseListener = interface(IJavaInstance)
    ['{84C65E8C-C67E-48BF-B6D4-2367FC78CC2C}']
    procedure onInAppMessageResponse(inAppMessageResult: JInAppMessageResult); cdecl;
  end;
  TJInAppMessageResponseListener = class(TJavaGenericImport<JInAppMessageResponseListenerClass, JInAppMessageResponseListener>) end;

  JInAppMessageResultClass = interface(JObjectClass)
    ['{50642A32-5FC9-464C-A8C4-6177F9DEA067}']
    //{class} function init(i: Integer; string_: JString): JInAppMessageResult; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageResult')]
  JInAppMessageResult = interface(JObject)
    ['{22F8D915-C445-4F4F-80DE-BD18B55FF08E}']
    function getPurchaseToken: JString; cdecl;
    function getResponseCode: Integer; cdecl;
  end;
  TJInAppMessageResult = class(TJavaGenericImport<JInAppMessageResultClass, JInAppMessageResult>) end;

  JInAppMessageResult_InAppMessageResponseCodeClass = interface(JAnnotationClass)
    ['{B07EC876-B8D1-400B-B641-7AE6BE6328D8}']
    {class} function _GetNO_ACTION_NEEDED: Integer; cdecl;
    {class} function _GetSUBSCRIPTION_STATUS_UPDATED: Integer; cdecl;
    {class} property NO_ACTION_NEEDED: Integer read _GetNO_ACTION_NEEDED;
    {class} property SUBSCRIPTION_STATUS_UPDATED: Integer read _GetSUBSCRIPTION_STATUS_UPDATED;
  end;

  [JavaSignature('com/android/billingclient/api/InAppMessageResult$InAppMessageResponseCode')]
  JInAppMessageResult_InAppMessageResponseCode = interface(JAnnotation)
    ['{DB0499FB-6FD5-47BC-869E-BB1F4A19B3BD}']
  end;
  TJInAppMessageResult_InAppMessageResponseCode = class(TJavaGenericImport<JInAppMessageResult_InAppMessageResponseCodeClass, JInAppMessageResult_InAppMessageResponseCode>) end;

  JProductDetailsClass = interface(JObjectClass)
    ['{B66559A8-C8D0-42E3-835C-F079B3F38BC2}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails')]
  JProductDetails = interface(JObject)
    ['{3CEC1FF7-67CC-4893-8382-45F77638D905}']
    function equals(o: JObject): Boolean; cdecl;
    function getDescription: JString; cdecl;
    function getName: JString; cdecl;
    function getOneTimePurchaseOfferDetails: JProductDetails_OneTimePurchaseOfferDetails; cdecl;
    function getProductId: JString; cdecl;
    function getProductType: JString; cdecl;
    function getSubscriptionOfferDetails: JList; cdecl;
    function getTitle: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    //function zza: JString; cdecl;
    //function zzc: JString; cdecl;
  end;
  TJProductDetails = class(TJavaGenericImport<JProductDetailsClass, JProductDetails>) end;

  JProductDetails_OneTimePurchaseOfferDetailsClass = interface(JObjectClass)
    ['{56B05A79-0CA7-4646-B8A6-57E5B4C26273}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails')]
  JProductDetails_OneTimePurchaseOfferDetails = interface(JObject)
    ['{56121FDF-1F33-4604-BB70-C2E9AE3FAF27}']
    function getFormattedPrice: JString; cdecl;
    function getPriceAmountMicros: Int64; cdecl;
    function getPriceCurrencyCode: JString; cdecl;
    //function zza: JString; cdecl;
  end;
  TJProductDetails_OneTimePurchaseOfferDetails = class(TJavaGenericImport<JProductDetails_OneTimePurchaseOfferDetailsClass, JProductDetails_OneTimePurchaseOfferDetails>) end;

  JProductDetails_PricingPhaseClass = interface(JObjectClass)
    ['{89BD6B39-D50F-4005-8090-D84683950CD5}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails$PricingPhase')]
  JProductDetails_PricingPhase = interface(JObject)
    ['{E2A071A2-9EC7-404F-8F08-D1E083F3AB59}']
    function getBillingCycleCount: Integer; cdecl;
    function getBillingPeriod: JString; cdecl;
    function getFormattedPrice: JString; cdecl;
    function getPriceAmountMicros: Int64; cdecl;
    function getPriceCurrencyCode: JString; cdecl;
    function getRecurrenceMode: Integer; cdecl;
  end;
  TJProductDetails_PricingPhase = class(TJavaGenericImport<JProductDetails_PricingPhaseClass, JProductDetails_PricingPhase>) end;

  JProductDetails_PricingPhasesClass = interface(JObjectClass)
    ['{6C0561F9-A4C5-4961-AAC9-BC459A26FD34}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails$PricingPhases')]
  JProductDetails_PricingPhases = interface(JObject)
    ['{37DA7C9E-FA32-4920-B8D8-214FDA9887BD}']
    function getPricingPhaseList: JList; cdecl;
  end;
  TJProductDetails_PricingPhases = class(TJavaGenericImport<JProductDetails_PricingPhasesClass, JProductDetails_PricingPhases>) end;

  JProductDetails_RecurrenceModeClass = interface(JAnnotationClass)
    ['{B970C0EE-3F8E-4499-96FB-18B9FF2FBD27}']
    {class} function _GetFINITE_RECURRING: Integer; cdecl;
    {class} function _GetINFINITE_RECURRING: Integer; cdecl;
    {class} function _GetNON_RECURRING: Integer; cdecl;
    {class} property FINITE_RECURRING: Integer read _GetFINITE_RECURRING;
    {class} property INFINITE_RECURRING: Integer read _GetINFINITE_RECURRING;
    {class} property NON_RECURRING: Integer read _GetNON_RECURRING;
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails$RecurrenceMode')]
  JProductDetails_RecurrenceMode = interface(JAnnotation)
    ['{A313C591-DC3A-426D-9171-D1D98E2C4DE3}']
  end;
  TJProductDetails_RecurrenceMode = class(TJavaGenericImport<JProductDetails_RecurrenceModeClass, JProductDetails_RecurrenceMode>) end;

  JProductDetails_SubscriptionOfferDetailsClass = interface(JObjectClass)
    ['{A0F07674-F6E1-4E27-A8F5-39C99B4C84BC}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetails$SubscriptionOfferDetails')]
  JProductDetails_SubscriptionOfferDetails = interface(JObject)
    ['{D2F740FF-8A8F-4AAB-948E-D33189C1F351}']
    function getBasePlanId: JString; cdecl;
    function getOfferId: JString; cdecl;
    function getOfferTags: JList; cdecl;
    function getOfferToken: JString; cdecl;
    function getPricingPhases: JProductDetails_PricingPhases; cdecl;
  end;
  TJProductDetails_SubscriptionOfferDetails = class(TJavaGenericImport<JProductDetails_SubscriptionOfferDetailsClass, JProductDetails_SubscriptionOfferDetails>) end;

  JProductDetailsResponseListenerClass = interface(IJavaClass)
    ['{A5865840-0B92-4571-B977-AE2CEB8A11F2}']
  end;

  [JavaSignature('com/android/billingclient/api/ProductDetailsResponseListener')]
  JProductDetailsResponseListener = interface(IJavaInstance)
    ['{E8DF5C01-A29F-435F-9B16-C7CEFEE6C942}']
    procedure onProductDetailsResponse(billingResult: JBillingResult; productDetailsList: JList); cdecl;
  end;
  TJProductDetailsResponseListener = class(TJavaGenericImport<JProductDetailsResponseListenerClass, JProductDetailsResponseListener>) end;

  JProxyBillingActivityClass = interface(JActivityClass)
    ['{388A6DCD-DA34-47C5-A2BC-55330C2A59B7}']
    {class} function init: JProxyBillingActivity; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/ProxyBillingActivity')]
  JProxyBillingActivity = interface(JActivity)
    ['{B29FF465-6A55-41B1-B16A-DD13A46C94A6}']
  end;
  TJProxyBillingActivity = class(TJavaGenericImport<JProxyBillingActivityClass, JProxyBillingActivity>) end;

  JPurchaseClass = interface(JObjectClass)
    ['{561501CB-863F-494F-A426-7C12DB777A7E}']
    {class} function init(jsonPurchaseInfo: JString; signature: JString): JPurchase; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/Purchase')]
  JPurchase = interface(JObject)
    ['{0B39C9D9-B606-49DF-A4AF-E64D69CE8A40}']
    function equals(o: JObject): Boolean; cdecl;
    function getAccountIdentifiers: JAccountIdentifiers; cdecl;
    function getDeveloperPayload: JString; cdecl;
    function getOrderId: JString; cdecl;
    function getOriginalJson: JString; cdecl;
    function getPackageName: JString; cdecl;
    function getProducts: JList; cdecl;
    function getPurchaseState: Integer; cdecl;
    function getPurchaseTime: Int64; cdecl;
    function getPurchaseToken: JString; cdecl;
    function getQuantity: Integer; cdecl;
    function getSignature: JString; cdecl;
    function getSkus: JArrayList; cdecl;
    function hashCode: Integer; cdecl;
    function isAcknowledged: Boolean; cdecl;
    function isAutoRenewing: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJPurchase = class(TJavaGenericImport<JPurchaseClass, JPurchase>) end;

  JPurchase_PurchaseStateClass = interface(JAnnotationClass)
    ['{F1B58CCE-0114-4DDD-B330-B86E6705C28D}']
    {class} function _GetPENDING: Integer; cdecl;
    {class} function _GetPURCHASED: Integer; cdecl;
    {class} function _GetUNSPECIFIED_STATE: Integer; cdecl;
    {class} property PENDING: Integer read _GetPENDING;
    {class} property PURCHASED: Integer read _GetPURCHASED;
    {class} property UNSPECIFIED_STATE: Integer read _GetUNSPECIFIED_STATE;
  end;

  [JavaSignature('com/android/billingclient/api/Purchase$PurchaseState')]
  JPurchase_PurchaseState = interface(JAnnotation)
    ['{81B9ABD9-0F7B-4D2A-AA7E-8491919152E6}']
  end;
  TJPurchase_PurchaseState = class(TJavaGenericImport<JPurchase_PurchaseStateClass, JPurchase_PurchaseState>) end;

  JPurchaseHistoryRecordClass = interface(JObjectClass)
    ['{37C27545-F18D-44D0-B33E-14365007AE8D}']
    {class} function init(string_: JString; string_1: JString): JPurchaseHistoryRecord; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/PurchaseHistoryRecord')]
  JPurchaseHistoryRecord = interface(JObject)
    ['{14057885-7118-48D9-AAFF-75CEBBE16FBE}']
    function equals(o: JObject): Boolean; cdecl;
    function getDeveloperPayload: JString; cdecl;
    function getOriginalJson: JString; cdecl;
    function getProducts: JList; cdecl;
    function getPurchaseTime: Int64; cdecl;
    function getPurchaseToken: JString; cdecl;
    function getQuantity: Integer; cdecl;
    function getSignature: JString; cdecl;
    function getSkus: JArrayList; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJPurchaseHistoryRecord = class(TJavaGenericImport<JPurchaseHistoryRecordClass, JPurchaseHistoryRecord>) end;

  JPurchaseHistoryResponseListenerClass = interface(IJavaClass)
    ['{B3F65BC3-BA08-478A-A5E3-B194B8D0077D}']
  end;

  [JavaSignature('com/android/billingclient/api/PurchaseHistoryResponseListener')]
  JPurchaseHistoryResponseListener = interface(IJavaInstance)
    ['{560C7068-FBA1-4409-9010-2528FE442A3D}']
    procedure onPurchaseHistoryResponse(billingResult: JBillingResult; purchaseHistoryRecordList: JList); cdecl;
  end;
  TJPurchaseHistoryResponseListener = class(TJavaGenericImport<JPurchaseHistoryResponseListenerClass, JPurchaseHistoryResponseListener>) end;

  JPurchasesResponseListenerClass = interface(IJavaClass)
    ['{B940DD0E-85C1-40A0-A9F5-E8E6DF0023E5}']
  end;

  [JavaSignature('com/android/billingclient/api/PurchasesResponseListener')]
  JPurchasesResponseListener = interface(IJavaInstance)
    ['{8D98FC47-2F10-4BFC-88E0-E1A2895B5004}']
    procedure onQueryPurchasesResponse(billingResult: JBillingResult; purchases: JList); cdecl;
  end;
  TJPurchasesResponseListener = class(TJavaGenericImport<JPurchasesResponseListenerClass, JPurchasesResponseListener>) end;

  JPurchasesUpdatedListenerClass = interface(IJavaClass)
    ['{44D840E9-F456-4B69-9C4C-2F35BDBB401D}']
  end;

  [JavaSignature('com/android/billingclient/api/PurchasesUpdatedListener')]
  JPurchasesUpdatedListener = interface(IJavaInstance)
    ['{F2C61DA5-927E-4A09-99B6-7A990540E392}']
    procedure onPurchasesUpdated(billingResult: JBillingResult; purchases: JList); cdecl;
  end;
  TJPurchasesUpdatedListener = class(TJavaGenericImport<JPurchasesUpdatedListenerClass, JPurchasesUpdatedListener>) end;

  JQueryProductDetailsParamsClass = interface(JObjectClass)
    ['{57057ACD-3079-41B5-AF1E-138D55A4E273}']
    {class} function newBuilder: JQueryProductDetailsParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/QueryProductDetailsParams')]
  JQueryProductDetailsParams = interface(JObject)
    ['{826C765A-85B2-4A37-9991-D2EE2457FAB4}']
    //function zza: Jplay_billing_zzu; cdecl;
    //function zzb: JString; cdecl;
  end;
  TJQueryProductDetailsParams = class(TJavaGenericImport<JQueryProductDetailsParamsClass, JQueryProductDetailsParams>) end;

  JQueryProductDetailsParams_BuilderClass = interface(JObjectClass)
    ['{DB05EE86-6214-4D5B-8BC5-817C4A747A9D}']
  end;

  [JavaSignature('com/android/billingclient/api/QueryProductDetailsParams$Builder')]
  JQueryProductDetailsParams_Builder = interface(JObject)
    ['{4AAAA347-B67C-469D-87E1-89EA323BAD9E}']
    function build: JQueryProductDetailsParams; cdecl;
    function setProductList(productList: JList): JQueryProductDetailsParams_Builder; cdecl;
  end;
  TJQueryProductDetailsParams_Builder = class(TJavaGenericImport<JQueryProductDetailsParams_BuilderClass, JQueryProductDetailsParams_Builder>) end;

  JQueryProductDetailsParams_ProductClass = interface(JObjectClass)
    ['{03DD9493-0E89-4D1D-8E8B-4AF54B23061E}']
    {class} function newBuilder: JProduct_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/QueryProductDetailsParams$Product')]
  JQueryProductDetailsParams_Product = interface(JObject)
    ['{35334471-E148-40A6-852A-A5BBA35889A6}']
    //function zza: JString; cdecl;
    //function zzb: JString; cdecl;
  end;
  TJQueryProductDetailsParams_Product = class(TJavaGenericImport<JQueryProductDetailsParams_ProductClass, JQueryProductDetailsParams_Product>) end;

  JProduct_BuilderClass = interface(JObjectClass)
    ['{977AEE05-2FD6-4448-8272-A2077BD69F00}']
  end;

  [JavaSignature('com/android/billingclient/api/QueryProductDetailsParams$Product$Builder')]
  JProduct_Builder = interface(JObject)
    ['{0E9A6428-C788-4975-984E-0F07F787EC48}']
    function build: JQueryProductDetailsParams_Product; cdecl;
    function setProductId(productId: JString): JProduct_Builder; cdecl;
    function setProductType(productType: JString): JProduct_Builder; cdecl;
  end;
  TJProduct_Builder = class(TJavaGenericImport<JProduct_BuilderClass, JProduct_Builder>) end;

  JQueryPurchaseHistoryParamsClass = interface(JObjectClass)
    ['{956EA5A7-5C15-415B-B5E5-132E79577C09}']
    {class} function newBuilder: JQueryPurchaseHistoryParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/QueryPurchaseHistoryParams')]
  JQueryPurchaseHistoryParams = interface(JObject)
    ['{F9CE6A58-FBCD-4653-B355-9F62B447B6E3}']
    //function zza: JString; cdecl;
  end;
  TJQueryPurchaseHistoryParams = class(TJavaGenericImport<JQueryPurchaseHistoryParamsClass, JQueryPurchaseHistoryParams>) end;

  JQueryPurchaseHistoryParams_BuilderClass = interface(JObjectClass)
    ['{E1EC8963-E341-4239-96E6-20226EB386F4}']
  end;

  [JavaSignature('com/android/billingclient/api/QueryPurchaseHistoryParams$Builder')]
  JQueryPurchaseHistoryParams_Builder = interface(JObject)
    ['{7CCAA6E0-BAAC-46B1-BE53-DF73E5B85435}']
    function build: JQueryPurchaseHistoryParams; cdecl;
    function setProductType(productType: JString): JQueryPurchaseHistoryParams_Builder; cdecl;
  end;
  TJQueryPurchaseHistoryParams_Builder = class(TJavaGenericImport<JQueryPurchaseHistoryParams_BuilderClass, JQueryPurchaseHistoryParams_Builder>) end;

  JQueryPurchasesParamsClass = interface(JObjectClass)
    ['{B6C913AF-2D9F-4B50-A627-4117BE1CB070}']
    {class} function newBuilder: JQueryPurchasesParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/QueryPurchasesParams')]
  JQueryPurchasesParams = interface(JObject)
    ['{EB510D13-60BF-4992-AAB0-F575B1340105}']
    //function zza: JString; cdecl;
  end;
  TJQueryPurchasesParams = class(TJavaGenericImport<JQueryPurchasesParamsClass, JQueryPurchasesParams>) end;

  JQueryPurchasesParams_BuilderClass = interface(JObjectClass)
    ['{502ABCF8-6D5F-4B70-A48F-69FAFB69EF43}']
  end;

  [JavaSignature('com/android/billingclient/api/QueryPurchasesParams$Builder')]
  JQueryPurchasesParams_Builder = interface(JObject)
    ['{E6965B0F-F1E3-4B85-80F6-56F68E4DD43A}']
    function build: JQueryPurchasesParams; cdecl;
    function setProductType(productType: JString): JQueryPurchasesParams_Builder; cdecl;
  end;
  TJQueryPurchasesParams_Builder = class(TJavaGenericImport<JQueryPurchasesParams_BuilderClass, JQueryPurchasesParams_Builder>) end;

  JSkuDetailsClass = interface(JObjectClass)
    ['{D6359924-1CE7-42C2-9E50-42F0776153D4}']
    {class} function init(jsonSkuDetails: JString): JSkuDetails; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/SkuDetails')]
  JSkuDetails = interface(JObject)
    ['{761E7F65-7DA0-4E59-9E1D-9FFC87FB5F53}']
    function equals(o: JObject): Boolean; cdecl;
    function getDescription: JString; cdecl;
    function getFreeTrialPeriod: JString; cdecl;
    function getIconUrl: JString; cdecl;
    function getIntroductoryPrice: JString; cdecl;
    function getIntroductoryPriceAmountMicros: Int64; cdecl;
    function getIntroductoryPriceCycles: Integer; cdecl;
    function getIntroductoryPricePeriod: JString; cdecl;
    function getOriginalJson: JString; cdecl;
    function getOriginalPrice: JString; cdecl;
    function getOriginalPriceAmountMicros: Int64; cdecl;
    function getPrice: JString; cdecl;
    function getPriceAmountMicros: Int64; cdecl;
    function getPriceCurrencyCode: JString; cdecl;
    function getSku: JString; cdecl;
    function getSubscriptionPeriod: JString; cdecl;
    function getTitle: JString; cdecl;
    function getType: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    //function zza: Integer; cdecl;
    //function zzb: JString; cdecl;
    //function zzc: JString; cdecl;
    //function zzd: JString; cdecl;
    //function zze: JString; cdecl;
  end;
  TJSkuDetails = class(TJavaGenericImport<JSkuDetailsClass, JSkuDetails>) end;

  JSkuDetailsParamsClass = interface(JObjectClass)
    ['{7B05DB14-8CC7-4F30-AB9B-5E6DE4357681}']
    {class} function init: JSkuDetailsParams; cdecl;
    {class} function newBuilder: JSkuDetailsParams_Builder; cdecl;
  end;

  [JavaSignature('com/android/billingclient/api/SkuDetailsParams')]
  JSkuDetailsParams = interface(JObject)
    ['{AFE02E69-698B-4F08-8DD0-58C5747F3657}']
    function getSkuType: JString; cdecl;
    function getSkusList: JList; cdecl;
  end;
  TJSkuDetailsParams = class(TJavaGenericImport<JSkuDetailsParamsClass, JSkuDetailsParams>) end;

  JSkuDetailsParams_BuilderClass = interface(JObjectClass)
    ['{10B0AC77-A44D-46AC-B97C-7B7556F78CFE}']
  end;

  [JavaSignature('com/android/billingclient/api/SkuDetailsParams$Builder')]
  JSkuDetailsParams_Builder = interface(JObject)
    ['{DBA648E5-B19E-46F6-A88E-FB0F50B1448B}']
    function build: JSkuDetailsParams; cdecl;
    function setSkusList(skusList: JList): JSkuDetailsParams_Builder; cdecl;
    function setType(&type: JString): JSkuDetailsParams_Builder; cdecl;
  end;
  TJSkuDetailsParams_Builder = class(TJavaGenericImport<JSkuDetailsParams_BuilderClass, JSkuDetailsParams_Builder>) end;

  JSkuDetailsResponseListenerClass = interface(IJavaClass)
    ['{92239311-184F-4E1F-A430-E8E81F7ADB0F}']
  end;

  [JavaSignature('com/android/billingclient/api/SkuDetailsResponseListener')]
  JSkuDetailsResponseListener = interface(IJavaInstance)
    ['{96D21B9E-FEEB-456D-BD79-5971121CE532}']
    procedure onSkuDetailsResponse(billingResult: JBillingResult; skuDetailsList: JList); cdecl;
  end;
  TJSkuDetailsResponseListener = class(TJavaGenericImport<JSkuDetailsResponseListenerClass, JSkuDetailsResponseListener>) end;

  // com.android.billingclient.api.zza
  // com.android.billingclient.api.zzaa
  // com.android.billingclient.api.zzab
  // com.android.billingclient.api.zzac
  // com.android.billingclient.api.zzad
  // com.android.billingclient.api.zzae
  // com.android.billingclient.api.zzaf
  // com.android.billingclient.api.zzag
  // com.android.billingclient.api.zzah
  // com.android.billingclient.api.zzai
  // com.android.billingclient.api.zzaj
  // com.android.billingclient.api.zzak
  // com.android.billingclient.api.zzal
  // com.android.billingclient.api.zzam
  // com.android.billingclient.api.zzan
  // com.android.billingclient.api.zzao
  // com.android.billingclient.api.zzap
  // com.android.billingclient.api.zzaq
  // com.android.billingclient.api.zzar
  // com.android.billingclient.api.zzas
  // com.android.billingclient.api.zzat
  // com.android.billingclient.api.zzau
  // com.android.billingclient.api.zzav
  // com.android.billingclient.api.zzaw
  // com.android.billingclient.api.zzax
  // com.android.billingclient.api.zzay
  // com.android.billingclient.api.zzaz
  // com.android.billingclient.api.zzb
  // com.android.billingclient.api.zzba
  // com.android.billingclient.api.zzbb
  // com.android.billingclient.api.zzbc
  // com.android.billingclient.api.zzbd
  // com.android.billingclient.api.zzbe
  // com.android.billingclient.api.zzbf
  // com.android.billingclient.api.zzbg
  // com.android.billingclient.api.zzbh
  // com.android.billingclient.api.zzbi
  // com.android.billingclient.api.zzbj
  // com.android.billingclient.api.zzbk
  // com.android.billingclient.api.zzbl
  // com.android.billingclient.api.zzbm
  // com.android.billingclient.api.zzbn
  // com.android.billingclient.api.zzbo
  // com.android.billingclient.api.zzbp
  // com.android.billingclient.api.zzbq
  // com.android.billingclient.api.zzbr
  // com.android.billingclient.api.zzbs
  // com.android.billingclient.api.zzbt
  // com.android.billingclient.api.zzbu
  // com.android.billingclient.api.zzc
  // com.android.billingclient.api.zzd
  // com.android.billingclient.api.zze
  // com.android.billingclient.api.zzf
  // com.android.billingclient.api.zzg
  // com.android.billingclient.api.zzh
  // com.android.billingclient.api.zzi
  // com.android.billingclient.api.zzj
  // com.android.billingclient.api.zzk
  // com.android.billingclient.api.zzl
  // com.android.billingclient.api.zzm
  // com.android.billingclient.api.zzn
  // com.android.billingclient.api.zzo
  // com.android.billingclient.api.zzp
  // com.android.billingclient.api.zzq
  // com.android.billingclient.api.zzr
  // com.android.billingclient.api.zzs
  // com.android.billingclient.api.zzt
  // com.android.billingclient.api.zzu
  // com.android.billingclient.api.zzv
  // com.android.billingclient.api.zzw
  // com.android.billingclient.api.zzx
  // com.android.billingclient.api.zzy
  // com.android.billingclient.api.zzz
implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAccountIdentifiers', TypeInfo(Androidapi.JNI.InAppBilling.JAccountIdentifiers));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAcknowledgePurchaseParams', TypeInfo(Androidapi.JNI.InAppBilling.JAcknowledgePurchaseParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAcknowledgePurchaseParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JAcknowledgePurchaseParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAcknowledgePurchaseResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JAcknowledgePurchaseResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAlternativeBillingListener', TypeInfo(Androidapi.JNI.InAppBilling.JAlternativeBillingListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAlternativeChoiceDetails', TypeInfo(Androidapi.JNI.InAppBilling.JAlternativeChoiceDetails));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JAlternativeChoiceDetails_Product', TypeInfo(Androidapi.JNI.InAppBilling.JAlternativeChoiceDetails_Product));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_BillingResponseCode', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_BillingResponseCode));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_ConnectionState', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_ConnectionState));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_FeatureType', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_FeatureType));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_ProductType', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_ProductType));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClient_SkuType', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClient_SkuType));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClientImpl', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClientImpl));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingClientStateListener', TypeInfo(Androidapi.JNI.InAppBilling.JBillingClientStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingFlowParams', TypeInfo(Androidapi.JNI.InAppBilling.JBillingFlowParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingFlowParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JBillingFlowParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingFlowParams_ProductDetailsParams', TypeInfo(Androidapi.JNI.InAppBilling.JBillingFlowParams_ProductDetailsParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetailsParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetailsParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingFlowParams_ProrationMode', TypeInfo(Androidapi.JNI.InAppBilling.JBillingFlowParams_ProrationMode));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingFlowParams_SubscriptionUpdateParams', TypeInfo(Androidapi.JNI.InAppBilling.JBillingFlowParams_SubscriptionUpdateParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSubscriptionUpdateParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JSubscriptionUpdateParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSubscriptionUpdateParams_ReplacementMode', TypeInfo(Androidapi.JNI.InAppBilling.JSubscriptionUpdateParams_ReplacementMode));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingResult', TypeInfo(Androidapi.JNI.InAppBilling.JBillingResult));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JBillingResult_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JBillingResult_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JConsumeParams', TypeInfo(Androidapi.JNI.InAppBilling.JConsumeParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JConsumeParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JConsumeParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JConsumeResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JConsumeResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageParams', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageParams_InAppMessageCategoryId', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageParams_InAppMessageCategoryId));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageResult', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageResult));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JInAppMessageResult_InAppMessageResponseCode', TypeInfo(Androidapi.JNI.InAppBilling.JInAppMessageResult_InAppMessageResponseCode));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails_OneTimePurchaseOfferDetails', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails_OneTimePurchaseOfferDetails));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails_PricingPhase', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails_PricingPhase));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails_PricingPhases', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails_PricingPhases));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails_RecurrenceMode', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails_RecurrenceMode));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetails_SubscriptionOfferDetails', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetails_SubscriptionOfferDetails));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProductDetailsResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JProductDetailsResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProxyBillingActivity', TypeInfo(Androidapi.JNI.InAppBilling.JProxyBillingActivity));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchase', TypeInfo(Androidapi.JNI.InAppBilling.JPurchase));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchase_PurchaseState', TypeInfo(Androidapi.JNI.InAppBilling.JPurchase_PurchaseState));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchaseHistoryRecord', TypeInfo(Androidapi.JNI.InAppBilling.JPurchaseHistoryRecord));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchaseHistoryResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JPurchaseHistoryResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchasesResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JPurchasesResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JPurchasesUpdatedListener', TypeInfo(Androidapi.JNI.InAppBilling.JPurchasesUpdatedListener));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryProductDetailsParams', TypeInfo(Androidapi.JNI.InAppBilling.JQueryProductDetailsParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryProductDetailsParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JQueryProductDetailsParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryProductDetailsParams_Product', TypeInfo(Androidapi.JNI.InAppBilling.JQueryProductDetailsParams_Product));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JProduct_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JProduct_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryPurchaseHistoryParams', TypeInfo(Androidapi.JNI.InAppBilling.JQueryPurchaseHistoryParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryPurchaseHistoryParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JQueryPurchaseHistoryParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryPurchasesParams', TypeInfo(Androidapi.JNI.InAppBilling.JQueryPurchasesParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JQueryPurchasesParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JQueryPurchasesParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSkuDetails', TypeInfo(Androidapi.JNI.InAppBilling.JSkuDetails));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSkuDetailsParams', TypeInfo(Androidapi.JNI.InAppBilling.JSkuDetailsParams));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSkuDetailsParams_Builder', TypeInfo(Androidapi.JNI.InAppBilling.JSkuDetailsParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.JSkuDetailsResponseListener', TypeInfo(Androidapi.JNI.InAppBilling.JSkuDetailsResponseListener));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Jbillingclient_api_zza', TypeInfo(Androidapi.JNI.InAppBilling.Jbillingclient_api_zza));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaa', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaa));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzab', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzab));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzac', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzac));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzad', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzad));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzae', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzae));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaf', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaf));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzag', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzag));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzah', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzah));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzai', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzai));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaj', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaj));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzak', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzak));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzal', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzal));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzam', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzam));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzan', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzan));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzao', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzao));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzap', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzap));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaq', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaq));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzar', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzar));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzas', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzas));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzat', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzat));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzau', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzau));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzav', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzav));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaw', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaw));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzax', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzax));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzay', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzay));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzaz', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzaz));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Jbillingclient_api_zzb', TypeInfo(Androidapi.JNI.InAppBilling.Jbillingclient_api_zzb));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzba', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzba));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbb', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbb));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbc', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbc));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbd', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbd));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbe', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbe));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbf', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbf));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbg', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbg));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbh', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbh));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbi', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbi));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbj', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbj));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbk', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbk));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbl', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbl));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbm', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbm));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbn', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbn));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbo', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbo));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbp', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbp));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbq', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbq));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbr', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbr));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbs', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbs));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbt', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbt));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzbu', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzbu));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzc', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzc));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzd', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzd));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zze', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zze));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzf', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzf));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzg', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzg));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzh', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzh));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzi', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzi));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzj', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzj));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzk', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzk));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzl', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzl));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzm', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzm));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzn', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzn));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzo', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzo));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzp', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzp));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzq', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzq));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzr', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzr));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzs', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzs));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzt', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzt));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzu', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzu));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzv', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzv));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzw', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzw));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzx', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzx));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzy', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzy));
  //TRegTypes.RegisterType('Androidapi.JNI.InAppBilling.Japi_zzz', TypeInfo(Androidapi.JNI.InAppBilling.Japi_zzz));
end;

initialization
  RegisterTypes;
end.


