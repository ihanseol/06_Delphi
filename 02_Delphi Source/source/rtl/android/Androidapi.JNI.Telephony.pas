{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Telephony;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Java.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JAccessNetworkConstants = interface;//android.telephony.AccessNetworkConstants
  JAccessNetworkConstants_AccessNetworkType = interface;//android.telephony.AccessNetworkConstants$AccessNetworkType
  JAccessNetworkConstants_EutranBand = interface;//android.telephony.AccessNetworkConstants$EutranBand
  JAccessNetworkConstants_GeranBand = interface;//android.telephony.AccessNetworkConstants$GeranBand
  JAccessNetworkConstants_NgranBands = interface;//android.telephony.AccessNetworkConstants$NgranBands
  JAccessNetworkConstants_UtranBand = interface;//android.telephony.AccessNetworkConstants$UtranBand
  JAvailableNetworkInfo = interface;//android.telephony.AvailableNetworkInfo
  JAvailableNetworkInfo_Builder = interface;//android.telephony.AvailableNetworkInfo$Builder
  JBarringInfo = interface;//android.telephony.BarringInfo
  JBarringInfo_BarringServiceInfo = interface;//android.telephony.BarringInfo$BarringServiceInfo
  JCarrierConfigManager = interface;//android.telephony.CarrierConfigManager
  JCarrierConfigManager_Apn = interface;//android.telephony.CarrierConfigManager$Apn
  JCarrierConfigManager_Bsf = interface;//android.telephony.CarrierConfigManager$Bsf
  JCarrierConfigManager_Gps = interface;//android.telephony.CarrierConfigManager$Gps
  JCarrierConfigManager_Ims = interface;//android.telephony.CarrierConfigManager$Ims
  JCarrierConfigManager_ImsEmergency = interface;//android.telephony.CarrierConfigManager$ImsEmergency
  JCarrierConfigManager_ImsRtt = interface;//android.telephony.CarrierConfigManager$ImsRtt
  JCarrierConfigManager_ImsServiceEntitlement = interface;//android.telephony.CarrierConfigManager$ImsServiceEntitlement
  JCarrierConfigManager_ImsSms = interface;//android.telephony.CarrierConfigManager$ImsSms
  JCarrierConfigManager_ImsSs = interface;//android.telephony.CarrierConfigManager$ImsSs
  JCarrierConfigManager_ImsVoice = interface;//android.telephony.CarrierConfigManager$ImsVoice
  JCarrierConfigManager_ImsVt = interface;//android.telephony.CarrierConfigManager$ImsVt
  JCarrierConfigManager_ImsWfc = interface;//android.telephony.CarrierConfigManager$ImsWfc
  JCarrierConfigManager_Iwlan = interface;//android.telephony.CarrierConfigManager$Iwlan
  JCellIdentity = interface;//android.telephony.CellIdentity
  JCellIdentityCdma = interface;//android.telephony.CellIdentityCdma
  JCellIdentityGsm = interface;//android.telephony.CellIdentityGsm
  JCellIdentityLte = interface;//android.telephony.CellIdentityLte
  JCellIdentityNr = interface;//android.telephony.CellIdentityNr
  JCellIdentityTdscdma = interface;//android.telephony.CellIdentityTdscdma
  JCellIdentityWcdma = interface;//android.telephony.CellIdentityWcdma
  JCellInfo = interface;//android.telephony.CellInfo
  JCellInfoCdma = interface;//android.telephony.CellInfoCdma
  JCellInfoGsm = interface;//android.telephony.CellInfoGsm
  JCellInfoLte = interface;//android.telephony.CellInfoLte
  JCellInfoNr = interface;//android.telephony.CellInfoNr
  JCellInfoTdscdma = interface;//android.telephony.CellInfoTdscdma
  JCellInfoWcdma = interface;//android.telephony.CellInfoWcdma
  JCellLocation = interface;//android.telephony.CellLocation
  JCellSignalStrength = interface;//android.telephony.CellSignalStrength
  JCellSignalStrengthCdma = interface;//android.telephony.CellSignalStrengthCdma
  JCellSignalStrengthGsm = interface;//android.telephony.CellSignalStrengthGsm
  JCellSignalStrengthLte = interface;//android.telephony.CellSignalStrengthLte
  JCellSignalStrengthNr = interface;//android.telephony.CellSignalStrengthNr
  JCellSignalStrengthTdscdma = interface;//android.telephony.CellSignalStrengthTdscdma
  JCellSignalStrengthWcdma = interface;//android.telephony.CellSignalStrengthWcdma
  JClosedSubscriberGroupInfo = interface;//android.telephony.ClosedSubscriberGroupInfo
  JDataFailCause = interface;//android.telephony.DataFailCause
  Jtelephony_DisconnectCause = interface;//android.telephony.DisconnectCause
  JIccOpenLogicalChannelResponse = interface;//android.telephony.IccOpenLogicalChannelResponse
  JMbmsDownloadSession = interface;//android.telephony.MbmsDownloadSession
  JMbmsGroupCallSession = interface;//android.telephony.MbmsGroupCallSession
  JMbmsStreamingSession = interface;//android.telephony.MbmsStreamingSession
  JNeighboringCellInfo = interface;//android.telephony.NeighboringCellInfo
  JNetworkRegistrationInfo = interface;//android.telephony.NetworkRegistrationInfo
  JNetworkScan = interface;//android.telephony.NetworkScan
  JNetworkScanRequest = interface;//android.telephony.NetworkScanRequest
  JPhoneNumberFormattingTextWatcher = interface;//android.telephony.PhoneNumberFormattingTextWatcher
  JPhoneNumberUtils = interface;//android.telephony.PhoneNumberUtils
  JPhoneStateListener = interface;//android.telephony.PhoneStateListener
  JPhysicalChannelConfig = interface;//android.telephony.PhysicalChannelConfig
  JPreciseDataConnectionState = interface;//android.telephony.PreciseDataConnectionState
  JRadioAccessSpecifier = interface;//android.telephony.RadioAccessSpecifier
  JServiceState = interface;//android.telephony.ServiceState
  JSignalStrength = interface;//android.telephony.SignalStrength
  JSignalStrengthUpdateRequest = interface;//android.telephony.SignalStrengthUpdateRequest
  JSignalStrengthUpdateRequest_Builder = interface;//android.telephony.SignalStrengthUpdateRequest$Builder
  JSignalThresholdInfo = interface;//android.telephony.SignalThresholdInfo
  JSignalThresholdInfo_Builder = interface;//android.telephony.SignalThresholdInfo$Builder
  JSmsManager = interface;//android.telephony.SmsManager
  JSmsManager_FinancialSmsCallback = interface;//android.telephony.SmsManager$FinancialSmsCallback
  JSmsMessage = interface;//android.telephony.SmsMessage
  JSmsMessage_MessageClass = interface;//android.telephony.SmsMessage$MessageClass
  JSmsMessage_SubmitPdu = interface;//android.telephony.SmsMessage$SubmitPdu
  JSubscriptionInfo = interface;//android.telephony.SubscriptionInfo
  JSubscriptionManager = interface;//android.telephony.SubscriptionManager
  JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener = interface;//android.telephony.SubscriptionManager$OnOpportunisticSubscriptionsChangedListener
  JSubscriptionManager_OnSubscriptionsChangedListener = interface;//android.telephony.SubscriptionManager$OnSubscriptionsChangedListener
  JSubscriptionPlan = interface;//android.telephony.SubscriptionPlan
  JSubscriptionPlan_Builder = interface;//android.telephony.SubscriptionPlan$Builder
  JTelephonyCallback = interface;//android.telephony.TelephonyCallback
  JTelephonyCallback_ActiveDataSubscriptionIdListener = interface;//android.telephony.TelephonyCallback$ActiveDataSubscriptionIdListener
  JTelephonyCallback_BarringInfoListener = interface;//android.telephony.TelephonyCallback$BarringInfoListener
  JTelephonyCallback_CallDisconnectCauseListener = interface;//android.telephony.TelephonyCallback$CallDisconnectCauseListener
  JTelephonyCallback_CallForwardingIndicatorListener = interface;//android.telephony.TelephonyCallback$CallForwardingIndicatorListener
  JTelephonyCallback_CallStateListener = interface;//android.telephony.TelephonyCallback$CallStateListener
  JTelephonyCallback_CarrierNetworkListener = interface;//android.telephony.TelephonyCallback$CarrierNetworkListener
  JTelephonyCallback_CellInfoListener = interface;//android.telephony.TelephonyCallback$CellInfoListener
  JTelephonyCallback_CellLocationListener = interface;//android.telephony.TelephonyCallback$CellLocationListener
  JTelephonyCallback_DataActivationStateListener = interface;//android.telephony.TelephonyCallback$DataActivationStateListener
  JTelephonyCallback_DataActivityListener = interface;//android.telephony.TelephonyCallback$DataActivityListener
  JTelephonyCallback_DataConnectionStateListener = interface;//android.telephony.TelephonyCallback$DataConnectionStateListener
  JTelephonyCallback_DisplayInfoListener = interface;//android.telephony.TelephonyCallback$DisplayInfoListener
  JTelephonyCallback_EmergencyNumberListListener = interface;//android.telephony.TelephonyCallback$EmergencyNumberListListener
  JTelephonyCallback_ImsCallDisconnectCauseListener = interface;//android.telephony.TelephonyCallback$ImsCallDisconnectCauseListener
  JTelephonyCallback_MessageWaitingIndicatorListener = interface;//android.telephony.TelephonyCallback$MessageWaitingIndicatorListener
  JTelephonyCallback_PhysicalChannelConfigListener = interface;//android.telephony.TelephonyCallback$PhysicalChannelConfigListener
  JTelephonyCallback_PreciseDataConnectionStateListener = interface;//android.telephony.TelephonyCallback$PreciseDataConnectionStateListener
  JTelephonyCallback_RegistrationFailedListener = interface;//android.telephony.TelephonyCallback$RegistrationFailedListener
  JTelephonyCallback_ServiceStateListener = interface;//android.telephony.TelephonyCallback$ServiceStateListener
  JTelephonyCallback_SignalStrengthsListener = interface;//android.telephony.TelephonyCallback$SignalStrengthsListener
  JTelephonyCallback_UserMobileDataStateListener = interface;//android.telephony.TelephonyCallback$UserMobileDataStateListener
  JTelephonyDisplayInfo = interface;//android.telephony.TelephonyDisplayInfo
  JTelephonyManager = interface;//android.telephony.TelephonyManager
  JTelephonyManager_CallComposerException = interface;//android.telephony.TelephonyManager$CallComposerException
  JTelephonyManager_CellInfoCallback = interface;//android.telephony.TelephonyManager$CellInfoCallback
  JTelephonyManager_NetworkSlicingException = interface;//android.telephony.TelephonyManager$NetworkSlicingException
  JTelephonyManager_ModemErrorException = interface;//android.telephony.TelephonyManager$ModemErrorException
  JTelephonyManager_TimeoutException = interface;//android.telephony.TelephonyManager$TimeoutException
  JTelephonyManager_UssdResponseCallback = interface;//android.telephony.TelephonyManager$UssdResponseCallback
  JTelephonyScanManager = interface;//android.telephony.TelephonyScanManager
  JTelephonyScanManager_NetworkScanCallback = interface;//android.telephony.TelephonyScanManager$NetworkScanCallback
  JUiccCardInfo = interface;//android.telephony.UiccCardInfo
  JUiccPortInfo = interface;//android.telephony.UiccPortInfo
  JVisualVoicemailService = interface;//android.telephony.VisualVoicemailService
  JVisualVoicemailService_VisualVoicemailTask = interface;//android.telephony.VisualVoicemailService$VisualVoicemailTask
  JVisualVoicemailSms = interface;//android.telephony.VisualVoicemailSms
  JVisualVoicemailSmsFilterSettings = interface;//android.telephony.VisualVoicemailSmsFilterSettings
  JVisualVoicemailSmsFilterSettings_Builder = interface;//android.telephony.VisualVoicemailSmsFilterSettings$Builder
  JCdmaCellLocation = interface;//android.telephony.cdma.CdmaCellLocation
  JApnSetting = interface;//android.telephony.data.ApnSetting
  JApnSetting_Builder = interface;//android.telephony.data.ApnSetting$Builder
  JNetworkSliceInfo = interface;//android.telephony.data.NetworkSliceInfo
  JNetworkSliceInfo_Builder = interface;//android.telephony.data.NetworkSliceInfo$Builder
  JNetworkSlicingConfig = interface;//android.telephony.data.NetworkSlicingConfig
  JRouteSelectionDescriptor = interface;//android.telephony.data.RouteSelectionDescriptor
  JTrafficDescriptor = interface;//android.telephony.data.TrafficDescriptor
  JTrafficDescriptor_Builder = interface;//android.telephony.data.TrafficDescriptor$Builder
  JUrspRule = interface;//android.telephony.data.UrspRule
  JEmergencyNumber = interface;//android.telephony.emergency.EmergencyNumber
  JDownloadableSubscription = interface;//android.telephony.euicc.DownloadableSubscription
  JDownloadableSubscription_Builder = interface;//android.telephony.euicc.DownloadableSubscription$Builder
  JEuiccInfo = interface;//android.telephony.euicc.EuiccInfo
  JEuiccManager = interface;//android.telephony.euicc.EuiccManager
  JGsmCellLocation = interface;//android.telephony.gsm.GsmCellLocation
  Jgsm_SmsManager = interface;//android.telephony.gsm.SmsManager
  Jgsm_SmsMessage = interface;//android.telephony.gsm.SmsMessage
  Jgsm_SmsMessage_MessageClass = interface;//android.telephony.gsm.SmsMessage$MessageClass
  Jgsm_SmsMessage_SubmitPdu = interface;//android.telephony.gsm.SmsMessage$SubmitPdu
  JImsException = interface;//android.telephony.ims.ImsException
  JImsManager = interface;//android.telephony.ims.ImsManager
  JImsMmTelManager = interface;//android.telephony.ims.ImsMmTelManager
  JImsMmTelManager_CapabilityCallback = interface;//android.telephony.ims.ImsMmTelManager$CapabilityCallback
  JImsRcsManager = interface;//android.telephony.ims.ImsRcsManager
  JImsReasonInfo = interface;//android.telephony.ims.ImsReasonInfo
  JImsRegistrationAttributes = interface;//android.telephony.ims.ImsRegistrationAttributes
  JImsStateCallback = interface;//android.telephony.ims.ImsStateCallback
  JProvisioningManager = interface;//android.telephony.ims.ProvisioningManager
  JProvisioningManager_FeatureProvisioningCallback = interface;//android.telephony.ims.ProvisioningManager$FeatureProvisioningCallback
  JRcsUceAdapter = interface;//android.telephony.ims.RcsUceAdapter
  JRegistrationManager = interface;//android.telephony.ims.RegistrationManager
  JRegistrationManager_RegistrationCallback = interface;//android.telephony.ims.RegistrationManager$RegistrationCallback
  JMmTelFeature = interface;//android.telephony.ims.feature.MmTelFeature
  JMmTelFeature_MmTelCapabilities = interface;//android.telephony.ims.feature.MmTelFeature$MmTelCapabilities
  JImsRegistrationImplBase = interface;//android.telephony.ims.stub.ImsRegistrationImplBase
  JDownloadProgressListener = interface;//android.telephony.mbms.DownloadProgressListener
  JDownloadRequest = interface;//android.telephony.mbms.DownloadRequest
  JDownloadRequest_Builder = interface;//android.telephony.mbms.DownloadRequest$Builder
  JDownloadStatusListener = interface;//android.telephony.mbms.DownloadStatusListener
  JFileInfo = interface;//android.telephony.mbms.FileInfo
  Jmbms_ServiceInfo = interface;//android.telephony.mbms.ServiceInfo
  JFileServiceInfo = interface;//android.telephony.mbms.FileServiceInfo
  JGroupCall = interface;//android.telephony.mbms.GroupCall
  JGroupCallCallback = interface;//android.telephony.mbms.GroupCallCallback
  JMbmsDownloadReceiver = interface;//android.telephony.mbms.MbmsDownloadReceiver
  JMbmsDownloadSessionCallback = interface;//android.telephony.mbms.MbmsDownloadSessionCallback
  JMbmsErrors = interface;//android.telephony.mbms.MbmsErrors
  JMbmsErrors_DownloadErrors = interface;//android.telephony.mbms.MbmsErrors$DownloadErrors
  JMbmsErrors_GeneralErrors = interface;//android.telephony.mbms.MbmsErrors$GeneralErrors
  JMbmsErrors_GroupCallErrors = interface;//android.telephony.mbms.MbmsErrors$GroupCallErrors
  JMbmsErrors_InitializationErrors = interface;//android.telephony.mbms.MbmsErrors$InitializationErrors
  JMbmsErrors_StreamingErrors = interface;//android.telephony.mbms.MbmsErrors$StreamingErrors
  JMbmsGroupCallSessionCallback = interface;//android.telephony.mbms.MbmsGroupCallSessionCallback
  JMbmsStreamingSessionCallback = interface;//android.telephony.mbms.MbmsStreamingSessionCallback
  JStreamingService = interface;//android.telephony.mbms.StreamingService
  JStreamingServiceCallback = interface;//android.telephony.mbms.StreamingServiceCallback
  JStreamingServiceInfo = interface;//android.telephony.mbms.StreamingServiceInfo

// ===== Interface declarations =====

  JAccessNetworkConstantsClass = interface(JObjectClass)
    ['{420DABF0-9417-4D75-B7F3-035A20B73CFE}']
    {class} function _GetTRANSPORT_TYPE_WLAN: Integer; cdecl;
    {class} function _GetTRANSPORT_TYPE_WWAN: Integer; cdecl;
    {class} property TRANSPORT_TYPE_WLAN: Integer read _GetTRANSPORT_TYPE_WLAN;
    {class} property TRANSPORT_TYPE_WWAN: Integer read _GetTRANSPORT_TYPE_WWAN;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants')]
  JAccessNetworkConstants = interface(JObject)
    ['{6DDB91CE-2C3A-4B95-A08D-FE71910D0478}']
  end;
  TJAccessNetworkConstants = class(TJavaGenericImport<JAccessNetworkConstantsClass, JAccessNetworkConstants>) end;

  JAccessNetworkConstants_AccessNetworkTypeClass = interface(JObjectClass)
    ['{A23DDDBA-C1A5-492E-84D5-3D9567BE513B}']
    {class} function _GetCDMA2000: Integer; cdecl;
    {class} function _GetEUTRAN: Integer; cdecl;
    {class} function _GetGERAN: Integer; cdecl;
    {class} function _GetIWLAN: Integer; cdecl;
    {class} function _GetNGRAN: Integer; cdecl;
    {class} function _GetUNKNOWN: Integer; cdecl;
    {class} function _GetUTRAN: Integer; cdecl;
    {class} property CDMA2000: Integer read _GetCDMA2000;
    {class} property EUTRAN: Integer read _GetEUTRAN;
    {class} property GERAN: Integer read _GetGERAN;
    {class} property IWLAN: Integer read _GetIWLAN;
    {class} property NGRAN: Integer read _GetNGRAN;
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
    {class} property UTRAN: Integer read _GetUTRAN;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants$AccessNetworkType')]
  JAccessNetworkConstants_AccessNetworkType = interface(JObject)
    ['{C3EB28F5-0728-4BAF-987D-D449C3ECB6AC}']
  end;
  TJAccessNetworkConstants_AccessNetworkType = class(TJavaGenericImport<JAccessNetworkConstants_AccessNetworkTypeClass, JAccessNetworkConstants_AccessNetworkType>) end;

  JAccessNetworkConstants_EutranBandClass = interface(JObjectClass)
    ['{2377695D-C2ED-494A-9CD7-76C97DC615E9}']
    {class} function _GetBAND_1: Integer; cdecl;
    {class} function _GetBAND_10: Integer; cdecl;
    {class} function _GetBAND_11: Integer; cdecl;
    {class} function _GetBAND_12: Integer; cdecl;
    {class} function _GetBAND_13: Integer; cdecl;
    {class} function _GetBAND_14: Integer; cdecl;
    {class} function _GetBAND_17: Integer; cdecl;
    {class} function _GetBAND_18: Integer; cdecl;
    {class} function _GetBAND_19: Integer; cdecl;
    {class} function _GetBAND_2: Integer; cdecl;
    {class} function _GetBAND_20: Integer; cdecl;
    {class} function _GetBAND_21: Integer; cdecl;
    {class} function _GetBAND_22: Integer; cdecl;
    {class} function _GetBAND_23: Integer; cdecl;
    {class} function _GetBAND_24: Integer; cdecl;
    {class} function _GetBAND_25: Integer; cdecl;
    {class} function _GetBAND_26: Integer; cdecl;
    {class} function _GetBAND_27: Integer; cdecl;
    {class} function _GetBAND_28: Integer; cdecl;
    {class} function _GetBAND_3: Integer; cdecl;
    {class} function _GetBAND_30: Integer; cdecl;
    {class} function _GetBAND_31: Integer; cdecl;
    {class} function _GetBAND_33: Integer; cdecl;
    {class} function _GetBAND_34: Integer; cdecl;
    {class} function _GetBAND_35: Integer; cdecl;
    {class} function _GetBAND_36: Integer; cdecl;
    {class} function _GetBAND_37: Integer; cdecl;
    {class} function _GetBAND_38: Integer; cdecl;
    {class} function _GetBAND_39: Integer; cdecl;
    {class} function _GetBAND_4: Integer; cdecl;
    {class} function _GetBAND_40: Integer; cdecl;
    {class} function _GetBAND_41: Integer; cdecl;
    {class} function _GetBAND_42: Integer; cdecl;
    {class} function _GetBAND_43: Integer; cdecl;
    {class} function _GetBAND_44: Integer; cdecl;
    {class} function _GetBAND_45: Integer; cdecl;
    {class} function _GetBAND_46: Integer; cdecl;
    {class} function _GetBAND_47: Integer; cdecl;
    {class} function _GetBAND_48: Integer; cdecl;
    {class} function _GetBAND_49: Integer; cdecl;
    {class} function _GetBAND_5: Integer; cdecl;
    {class} function _GetBAND_50: Integer; cdecl;
    {class} function _GetBAND_51: Integer; cdecl;
    {class} function _GetBAND_52: Integer; cdecl;
    {class} function _GetBAND_53: Integer; cdecl;
    {class} function _GetBAND_6: Integer; cdecl;
    {class} function _GetBAND_65: Integer; cdecl;
    {class} function _GetBAND_66: Integer; cdecl;
    {class} function _GetBAND_68: Integer; cdecl;
    {class} function _GetBAND_7: Integer; cdecl;
    {class} function _GetBAND_70: Integer; cdecl;
    {class} function _GetBAND_71: Integer; cdecl;
    {class} function _GetBAND_72: Integer; cdecl;
    {class} function _GetBAND_73: Integer; cdecl;
    {class} function _GetBAND_74: Integer; cdecl;
    {class} function _GetBAND_8: Integer; cdecl;
    {class} function _GetBAND_85: Integer; cdecl;
    {class} function _GetBAND_87: Integer; cdecl;
    {class} function _GetBAND_88: Integer; cdecl;
    {class} function _GetBAND_9: Integer; cdecl;
    {class} property BAND_1: Integer read _GetBAND_1;
    {class} property BAND_10: Integer read _GetBAND_10;
    {class} property BAND_11: Integer read _GetBAND_11;
    {class} property BAND_12: Integer read _GetBAND_12;
    {class} property BAND_13: Integer read _GetBAND_13;
    {class} property BAND_14: Integer read _GetBAND_14;
    {class} property BAND_17: Integer read _GetBAND_17;
    {class} property BAND_18: Integer read _GetBAND_18;
    {class} property BAND_19: Integer read _GetBAND_19;
    {class} property BAND_2: Integer read _GetBAND_2;
    {class} property BAND_20: Integer read _GetBAND_20;
    {class} property BAND_21: Integer read _GetBAND_21;
    {class} property BAND_22: Integer read _GetBAND_22;
    {class} property BAND_23: Integer read _GetBAND_23;
    {class} property BAND_24: Integer read _GetBAND_24;
    {class} property BAND_25: Integer read _GetBAND_25;
    {class} property BAND_26: Integer read _GetBAND_26;
    {class} property BAND_27: Integer read _GetBAND_27;
    {class} property BAND_28: Integer read _GetBAND_28;
    {class} property BAND_3: Integer read _GetBAND_3;
    {class} property BAND_30: Integer read _GetBAND_30;
    {class} property BAND_31: Integer read _GetBAND_31;
    {class} property BAND_33: Integer read _GetBAND_33;
    {class} property BAND_34: Integer read _GetBAND_34;
    {class} property BAND_35: Integer read _GetBAND_35;
    {class} property BAND_36: Integer read _GetBAND_36;
    {class} property BAND_37: Integer read _GetBAND_37;
    {class} property BAND_38: Integer read _GetBAND_38;
    {class} property BAND_39: Integer read _GetBAND_39;
    {class} property BAND_4: Integer read _GetBAND_4;
    {class} property BAND_40: Integer read _GetBAND_40;
    {class} property BAND_41: Integer read _GetBAND_41;
    {class} property BAND_42: Integer read _GetBAND_42;
    {class} property BAND_43: Integer read _GetBAND_43;
    {class} property BAND_44: Integer read _GetBAND_44;
    {class} property BAND_45: Integer read _GetBAND_45;
    {class} property BAND_46: Integer read _GetBAND_46;
    {class} property BAND_47: Integer read _GetBAND_47;
    {class} property BAND_48: Integer read _GetBAND_48;
    {class} property BAND_49: Integer read _GetBAND_49;
    {class} property BAND_5: Integer read _GetBAND_5;
    {class} property BAND_50: Integer read _GetBAND_50;
    {class} property BAND_51: Integer read _GetBAND_51;
    {class} property BAND_52: Integer read _GetBAND_52;
    {class} property BAND_53: Integer read _GetBAND_53;
    {class} property BAND_6: Integer read _GetBAND_6;
    {class} property BAND_65: Integer read _GetBAND_65;
    {class} property BAND_66: Integer read _GetBAND_66;
    {class} property BAND_68: Integer read _GetBAND_68;
    {class} property BAND_7: Integer read _GetBAND_7;
    {class} property BAND_70: Integer read _GetBAND_70;
    {class} property BAND_71: Integer read _GetBAND_71;
    {class} property BAND_72: Integer read _GetBAND_72;
    {class} property BAND_73: Integer read _GetBAND_73;
    {class} property BAND_74: Integer read _GetBAND_74;
    {class} property BAND_8: Integer read _GetBAND_8;
    {class} property BAND_85: Integer read _GetBAND_85;
    {class} property BAND_87: Integer read _GetBAND_87;
    {class} property BAND_88: Integer read _GetBAND_88;
    {class} property BAND_9: Integer read _GetBAND_9;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants$EutranBand')]
  JAccessNetworkConstants_EutranBand = interface(JObject)
    ['{6BD7EAF6-DBE2-4FF3-A7B8-8E7B72FCD8F6}']
  end;
  TJAccessNetworkConstants_EutranBand = class(TJavaGenericImport<JAccessNetworkConstants_EutranBandClass, JAccessNetworkConstants_EutranBand>) end;

  JAccessNetworkConstants_GeranBandClass = interface(JObjectClass)
    ['{F6DC5205-7995-44F1-B91D-635D1E19B039}']
    {class} function _GetBAND_450: Integer; cdecl;
    {class} function _GetBAND_480: Integer; cdecl;
    {class} function _GetBAND_710: Integer; cdecl;
    {class} function _GetBAND_750: Integer; cdecl;
    {class} function _GetBAND_850: Integer; cdecl;
    {class} function _GetBAND_DCS1800: Integer; cdecl;
    {class} function _GetBAND_E900: Integer; cdecl;
    {class} function _GetBAND_ER900: Integer; cdecl;
    {class} function _GetBAND_P900: Integer; cdecl;
    {class} function _GetBAND_PCS1900: Integer; cdecl;
    {class} function _GetBAND_R900: Integer; cdecl;
    {class} function _GetBAND_T380: Integer; cdecl;
    {class} function _GetBAND_T410: Integer; cdecl;
    {class} function _GetBAND_T810: Integer; cdecl;
    {class} property BAND_450: Integer read _GetBAND_450;
    {class} property BAND_480: Integer read _GetBAND_480;
    {class} property BAND_710: Integer read _GetBAND_710;
    {class} property BAND_750: Integer read _GetBAND_750;
    {class} property BAND_850: Integer read _GetBAND_850;
    {class} property BAND_DCS1800: Integer read _GetBAND_DCS1800;
    {class} property BAND_E900: Integer read _GetBAND_E900;
    {class} property BAND_ER900: Integer read _GetBAND_ER900;
    {class} property BAND_P900: Integer read _GetBAND_P900;
    {class} property BAND_PCS1900: Integer read _GetBAND_PCS1900;
    {class} property BAND_R900: Integer read _GetBAND_R900;
    {class} property BAND_T380: Integer read _GetBAND_T380;
    {class} property BAND_T410: Integer read _GetBAND_T410;
    {class} property BAND_T810: Integer read _GetBAND_T810;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants$GeranBand')]
  JAccessNetworkConstants_GeranBand = interface(JObject)
    ['{90BE42EB-3E7C-471D-B5E1-1F35079B60C9}']
  end;
  TJAccessNetworkConstants_GeranBand = class(TJavaGenericImport<JAccessNetworkConstants_GeranBandClass, JAccessNetworkConstants_GeranBand>) end;

  JAccessNetworkConstants_NgranBandsClass = interface(JObjectClass)
    ['{6568E165-FFDE-422C-BFAB-11BF060A8889}']
    {class} function _GetBAND_1: Integer; cdecl;
    {class} function _GetBAND_12: Integer; cdecl;
    {class} function _GetBAND_14: Integer; cdecl;
    {class} function _GetBAND_18: Integer; cdecl;
    {class} function _GetBAND_2: Integer; cdecl;
    {class} function _GetBAND_20: Integer; cdecl;
    {class} function _GetBAND_25: Integer; cdecl;
    {class} function _GetBAND_257: Integer; cdecl;
    {class} function _GetBAND_258: Integer; cdecl;
    {class} function _GetBAND_26: Integer; cdecl;
    {class} function _GetBAND_260: Integer; cdecl;
    {class} function _GetBAND_261: Integer; cdecl;
    {class} function _GetBAND_28: Integer; cdecl;
    {class} function _GetBAND_29: Integer; cdecl;
    {class} function _GetBAND_3: Integer; cdecl;
    {class} function _GetBAND_30: Integer; cdecl;
    {class} function _GetBAND_34: Integer; cdecl;
    {class} function _GetBAND_38: Integer; cdecl;
    {class} function _GetBAND_39: Integer; cdecl;
    {class} function _GetBAND_40: Integer; cdecl;
    {class} function _GetBAND_41: Integer; cdecl;
    {class} function _GetBAND_46: Integer; cdecl;
    {class} function _GetBAND_48: Integer; cdecl;
    {class} function _GetBAND_5: Integer; cdecl;
    {class} function _GetBAND_50: Integer; cdecl;
    {class} function _GetBAND_51: Integer; cdecl;
    {class} function _GetBAND_53: Integer; cdecl;
    {class} function _GetBAND_65: Integer; cdecl;
    {class} function _GetBAND_66: Integer; cdecl;
    {class} function _GetBAND_7: Integer; cdecl;
    {class} function _GetBAND_70: Integer; cdecl;
    {class} function _GetBAND_71: Integer; cdecl;
    {class} function _GetBAND_74: Integer; cdecl;
    {class} function _GetBAND_75: Integer; cdecl;
    {class} function _GetBAND_76: Integer; cdecl;
    {class} function _GetBAND_77: Integer; cdecl;
    {class} function _GetBAND_78: Integer; cdecl;
    {class} function _GetBAND_79: Integer; cdecl;
    {class} function _GetBAND_8: Integer; cdecl;
    {class} function _GetBAND_80: Integer; cdecl;
    {class} function _GetBAND_81: Integer; cdecl;
    {class} function _GetBAND_82: Integer; cdecl;
    {class} function _GetBAND_83: Integer; cdecl;
    {class} function _GetBAND_84: Integer; cdecl;
    {class} function _GetBAND_86: Integer; cdecl;
    {class} function _GetBAND_89: Integer; cdecl;
    {class} function _GetBAND_90: Integer; cdecl;
    {class} function _GetBAND_91: Integer; cdecl;
    {class} function _GetBAND_92: Integer; cdecl;
    {class} function _GetBAND_93: Integer; cdecl;
    {class} function _GetBAND_94: Integer; cdecl;
    {class} function _GetBAND_95: Integer; cdecl;
    {class} function _GetBAND_96: Integer; cdecl;
    {class} property BAND_1: Integer read _GetBAND_1;
    {class} property BAND_12: Integer read _GetBAND_12;
    {class} property BAND_14: Integer read _GetBAND_14;
    {class} property BAND_18: Integer read _GetBAND_18;
    {class} property BAND_2: Integer read _GetBAND_2;
    {class} property BAND_20: Integer read _GetBAND_20;
    {class} property BAND_25: Integer read _GetBAND_25;
    {class} property BAND_257: Integer read _GetBAND_257;
    {class} property BAND_258: Integer read _GetBAND_258;
    {class} property BAND_26: Integer read _GetBAND_26;
    {class} property BAND_260: Integer read _GetBAND_260;
    {class} property BAND_261: Integer read _GetBAND_261;
    {class} property BAND_28: Integer read _GetBAND_28;
    {class} property BAND_29: Integer read _GetBAND_29;
    {class} property BAND_3: Integer read _GetBAND_3;
    {class} property BAND_30: Integer read _GetBAND_30;
    {class} property BAND_34: Integer read _GetBAND_34;
    {class} property BAND_38: Integer read _GetBAND_38;
    {class} property BAND_39: Integer read _GetBAND_39;
    {class} property BAND_40: Integer read _GetBAND_40;
    {class} property BAND_41: Integer read _GetBAND_41;
    {class} property BAND_46: Integer read _GetBAND_46;
    {class} property BAND_48: Integer read _GetBAND_48;
    {class} property BAND_5: Integer read _GetBAND_5;
    {class} property BAND_50: Integer read _GetBAND_50;
    {class} property BAND_51: Integer read _GetBAND_51;
    {class} property BAND_53: Integer read _GetBAND_53;
    {class} property BAND_65: Integer read _GetBAND_65;
    {class} property BAND_66: Integer read _GetBAND_66;
    {class} property BAND_7: Integer read _GetBAND_7;
    {class} property BAND_70: Integer read _GetBAND_70;
    {class} property BAND_71: Integer read _GetBAND_71;
    {class} property BAND_74: Integer read _GetBAND_74;
    {class} property BAND_75: Integer read _GetBAND_75;
    {class} property BAND_76: Integer read _GetBAND_76;
    {class} property BAND_77: Integer read _GetBAND_77;
    {class} property BAND_78: Integer read _GetBAND_78;
    {class} property BAND_79: Integer read _GetBAND_79;
    {class} property BAND_8: Integer read _GetBAND_8;
    {class} property BAND_80: Integer read _GetBAND_80;
    {class} property BAND_81: Integer read _GetBAND_81;
    {class} property BAND_82: Integer read _GetBAND_82;
    {class} property BAND_83: Integer read _GetBAND_83;
    {class} property BAND_84: Integer read _GetBAND_84;
    {class} property BAND_86: Integer read _GetBAND_86;
    {class} property BAND_89: Integer read _GetBAND_89;
    {class} property BAND_90: Integer read _GetBAND_90;
    {class} property BAND_91: Integer read _GetBAND_91;
    {class} property BAND_92: Integer read _GetBAND_92;
    {class} property BAND_93: Integer read _GetBAND_93;
    {class} property BAND_94: Integer read _GetBAND_94;
    {class} property BAND_95: Integer read _GetBAND_95;
    {class} property BAND_96: Integer read _GetBAND_96;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants$NgranBands')]
  JAccessNetworkConstants_NgranBands = interface(JObject)
    ['{B02D8538-732C-45FC-9F52-1DB836FBEF15}']
  end;
  TJAccessNetworkConstants_NgranBands = class(TJavaGenericImport<JAccessNetworkConstants_NgranBandsClass, JAccessNetworkConstants_NgranBands>) end;

  JAccessNetworkConstants_UtranBandClass = interface(JObjectClass)
    ['{2CDD63FE-F7C8-4851-B3F8-3CB9052C719E}']
    {class} function _GetBAND_1: Integer; cdecl;
    {class} function _GetBAND_10: Integer; cdecl;
    {class} function _GetBAND_11: Integer; cdecl;
    {class} function _GetBAND_12: Integer; cdecl;
    {class} function _GetBAND_13: Integer; cdecl;
    {class} function _GetBAND_14: Integer; cdecl;
    {class} function _GetBAND_19: Integer; cdecl;
    {class} function _GetBAND_2: Integer; cdecl;
    {class} function _GetBAND_20: Integer; cdecl;
    {class} function _GetBAND_21: Integer; cdecl;
    {class} function _GetBAND_22: Integer; cdecl;
    {class} function _GetBAND_25: Integer; cdecl;
    {class} function _GetBAND_26: Integer; cdecl;
    {class} function _GetBAND_3: Integer; cdecl;
    {class} function _GetBAND_4: Integer; cdecl;
    {class} function _GetBAND_5: Integer; cdecl;
    {class} function _GetBAND_6: Integer; cdecl;
    {class} function _GetBAND_7: Integer; cdecl;
    {class} function _GetBAND_8: Integer; cdecl;
    {class} function _GetBAND_9: Integer; cdecl;
    {class} function _GetBAND_A: Integer; cdecl;
    {class} function _GetBAND_B: Integer; cdecl;
    {class} function _GetBAND_C: Integer; cdecl;
    {class} function _GetBAND_D: Integer; cdecl;
    {class} function _GetBAND_E: Integer; cdecl;
    {class} function _GetBAND_F: Integer; cdecl;
    {class} property BAND_1: Integer read _GetBAND_1;
    {class} property BAND_10: Integer read _GetBAND_10;
    {class} property BAND_11: Integer read _GetBAND_11;
    {class} property BAND_12: Integer read _GetBAND_12;
    {class} property BAND_13: Integer read _GetBAND_13;
    {class} property BAND_14: Integer read _GetBAND_14;
    {class} property BAND_19: Integer read _GetBAND_19;
    {class} property BAND_2: Integer read _GetBAND_2;
    {class} property BAND_20: Integer read _GetBAND_20;
    {class} property BAND_21: Integer read _GetBAND_21;
    {class} property BAND_22: Integer read _GetBAND_22;
    {class} property BAND_25: Integer read _GetBAND_25;
    {class} property BAND_26: Integer read _GetBAND_26;
    {class} property BAND_3: Integer read _GetBAND_3;
    {class} property BAND_4: Integer read _GetBAND_4;
    {class} property BAND_5: Integer read _GetBAND_5;
    {class} property BAND_6: Integer read _GetBAND_6;
    {class} property BAND_7: Integer read _GetBAND_7;
    {class} property BAND_8: Integer read _GetBAND_8;
    {class} property BAND_9: Integer read _GetBAND_9;
    {class} property BAND_A: Integer read _GetBAND_A;
    {class} property BAND_B: Integer read _GetBAND_B;
    {class} property BAND_C: Integer read _GetBAND_C;
    {class} property BAND_D: Integer read _GetBAND_D;
    {class} property BAND_E: Integer read _GetBAND_E;
    {class} property BAND_F: Integer read _GetBAND_F;
  end;

  [JavaSignature('android/telephony/AccessNetworkConstants$UtranBand')]
  JAccessNetworkConstants_UtranBand = interface(JObject)
    ['{4D82B7AF-A3FB-41B4-8571-3F77E66648F2}']
  end;
  TJAccessNetworkConstants_UtranBand = class(TJavaGenericImport<JAccessNetworkConstants_UtranBandClass, JAccessNetworkConstants_UtranBand>) end;

  JAvailableNetworkInfoClass = interface(JObjectClass)
    ['{0992C6AE-1B1B-4650-A2E8-F4C509A22A3C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPRIORITY_HIGH: Integer; cdecl;
    {class} function _GetPRIORITY_LOW: Integer; cdecl;
    {class} function _GetPRIORITY_MED: Integer; cdecl;
    {class} function init(subId: Integer; priority: Integer; mccMncs: JList; bands: JList): JAvailableNetworkInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PRIORITY_HIGH: Integer read _GetPRIORITY_HIGH;
    {class} property PRIORITY_LOW: Integer read _GetPRIORITY_LOW;
    {class} property PRIORITY_MED: Integer read _GetPRIORITY_MED;
  end;

  [JavaSignature('android/telephony/AvailableNetworkInfo')]
  JAvailableNetworkInfo = interface(JObject)
    ['{5D1A5037-C43F-4957-95DB-12B9F20DCF18}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getBands: JList; cdecl;
    function getMccMncs: JList; cdecl;
    function getPriority: Integer; cdecl;
    function getRadioAccessSpecifiers: JList; cdecl;
    function getSubId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAvailableNetworkInfo = class(TJavaGenericImport<JAvailableNetworkInfoClass, JAvailableNetworkInfo>) end;

  JAvailableNetworkInfo_BuilderClass = interface(JObjectClass)
    ['{CEF4901B-6862-4889-91A0-ACDF5A6C82EE}']
    {class} function init(subId: Integer): JAvailableNetworkInfo_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/AvailableNetworkInfo$Builder')]
  JAvailableNetworkInfo_Builder = interface(JObject)
    ['{3AE71766-EC4F-4065-95EF-42BFFCA0538F}']
    function build: JAvailableNetworkInfo; cdecl;
    function setMccMncs(mccMncs: JList): JAvailableNetworkInfo_Builder; cdecl;
    function setPriority(priority: Integer): JAvailableNetworkInfo_Builder; cdecl;
    function setRadioAccessSpecifiers(radioAccessSpecifiers: JList): JAvailableNetworkInfo_Builder; cdecl;
  end;
  TJAvailableNetworkInfo_Builder = class(TJavaGenericImport<JAvailableNetworkInfo_BuilderClass, JAvailableNetworkInfo_Builder>) end;

  JBarringInfoClass = interface(JObjectClass)
    ['{0BA2F1B6-667D-41F6-8BEE-4DADDFA2F10A}']
    {class} function _GetBARRING_SERVICE_TYPE_CS_FALLBACK: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_CS_SERVICE: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_CS_VOICE: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_EMERGENCY: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_MMTEL_VIDEO: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_MMTEL_VOICE: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_MO_DATA: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_MO_SIGNALLING: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_PS_SERVICE: Integer; cdecl;
    {class} function _GetBARRING_SERVICE_TYPE_SMS: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property BARRING_SERVICE_TYPE_CS_FALLBACK: Integer read _GetBARRING_SERVICE_TYPE_CS_FALLBACK;
    {class} property BARRING_SERVICE_TYPE_CS_SERVICE: Integer read _GetBARRING_SERVICE_TYPE_CS_SERVICE;
    {class} property BARRING_SERVICE_TYPE_CS_VOICE: Integer read _GetBARRING_SERVICE_TYPE_CS_VOICE;
    {class} property BARRING_SERVICE_TYPE_EMERGENCY: Integer read _GetBARRING_SERVICE_TYPE_EMERGENCY;
    {class} property BARRING_SERVICE_TYPE_MMTEL_VIDEO: Integer read _GetBARRING_SERVICE_TYPE_MMTEL_VIDEO;
    {class} property BARRING_SERVICE_TYPE_MMTEL_VOICE: Integer read _GetBARRING_SERVICE_TYPE_MMTEL_VOICE;
    {class} property BARRING_SERVICE_TYPE_MO_DATA: Integer read _GetBARRING_SERVICE_TYPE_MO_DATA;
    {class} property BARRING_SERVICE_TYPE_MO_SIGNALLING: Integer read _GetBARRING_SERVICE_TYPE_MO_SIGNALLING;
    {class} property BARRING_SERVICE_TYPE_PS_SERVICE: Integer read _GetBARRING_SERVICE_TYPE_PS_SERVICE;
    {class} property BARRING_SERVICE_TYPE_SMS: Integer read _GetBARRING_SERVICE_TYPE_SMS;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/BarringInfo')]
  JBarringInfo = interface(JObject)
    ['{104406C5-222F-46FC-8D4D-E03543F07246}']
    function describeContents: Integer; cdecl;
    function equals(rhs: JObject): Boolean; cdecl;
    function getBarringServiceInfo(service: Integer): JBarringInfo_BarringServiceInfo; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJBarringInfo = class(TJavaGenericImport<JBarringInfoClass, JBarringInfo>) end;

  JBarringInfo_BarringServiceInfoClass = interface(JObjectClass)
    ['{3E0D7EF0-8E16-44F9-9D31-D8E2C77B5AF8}']
    {class} function _GetBARRING_TYPE_CONDITIONAL: Integer; cdecl;
    {class} function _GetBARRING_TYPE_NONE: Integer; cdecl;
    {class} function _GetBARRING_TYPE_UNCONDITIONAL: Integer; cdecl;
    {class} function _GetBARRING_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property BARRING_TYPE_CONDITIONAL: Integer read _GetBARRING_TYPE_CONDITIONAL;
    {class} property BARRING_TYPE_NONE: Integer read _GetBARRING_TYPE_NONE;
    {class} property BARRING_TYPE_UNCONDITIONAL: Integer read _GetBARRING_TYPE_UNCONDITIONAL;
    {class} property BARRING_TYPE_UNKNOWN: Integer read _GetBARRING_TYPE_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/BarringInfo$BarringServiceInfo')]
  JBarringInfo_BarringServiceInfo = interface(JObject)
    ['{183173EE-431A-438A-8133-866C4AEEF4CE}']
    function describeContents: Integer; cdecl;
    function equals(rhs: JObject): Boolean; cdecl;
    function getBarringType: Integer; cdecl;
    function getConditionalBarringFactor: Integer; cdecl;
    function getConditionalBarringTimeSeconds: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isBarred: Boolean; cdecl;
    function isConditionallyBarred: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJBarringInfo_BarringServiceInfo = class(TJavaGenericImport<JBarringInfo_BarringServiceInfoClass, JBarringInfo_BarringServiceInfo>) end;

  JCarrierConfigManagerClass = interface(JObjectClass)
    ['{8164A855-B878-453D-BE18-688B0A72A983}']
    {class} function _GetACTION_CARRIER_CONFIG_CHANGED: JString; cdecl;
    {class} function _GetCARRIER_NR_AVAILABILITY_NSA: Integer; cdecl;
    {class} function _GetCARRIER_NR_AVAILABILITY_SA: Integer; cdecl;
    {class} function _GetCROSS_SIM_SPN_FORMAT_CARRIER_NAME_ONLY: Integer; cdecl;
    {class} function _GetCROSS_SIM_SPN_FORMAT_CARRIER_NAME_WITH_BRANDING: Integer; cdecl;
    {class} function _GetDATA_CYCLE_THRESHOLD_DISABLED: Integer; cdecl;
    {class} function _GetDATA_CYCLE_USE_PLATFORM_DEFAULT: Integer; cdecl;
    {class} function _GetENABLE_EAP_METHOD_PREFIX_BOOL: JString; cdecl;
    {class} function _GetEXTRA_REBROADCAST_ON_UNLOCK: JString; cdecl;
    {class} function _GetEXTRA_SLOT_INDEX: JString; cdecl;
    {class} function _GetEXTRA_SUBSCRIPTION_INDEX: JString; cdecl;
    {class} function _GetIMSI_KEY_AVAILABILITY_INT: JString; cdecl;
    {class} function _GetKEY_5G_NR_SSRSRP_THRESHOLDS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_5G_NR_SSRSRQ_THRESHOLDS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_5G_NR_SSSINR_THRESHOLDS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_ADDITIONAL_CALL_SETTING_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_ADDING_APNS_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_ADD_CALL_DURING_VIDEO_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_EMERGENCY_NUMBERS_IN_CALL_LOG_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_EMERGENCY_VIDEO_CALLS_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_HOLD_CALL_DURING_EMERGENCY_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_HOLD_VIDEO_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_LOCAL_DTMF_TONES_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_MERGE_WIFI_CALLS_WHEN_VOWIFI_OFF_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_NON_EMERGENCY_CALLS_IN_ECM_BOOL: JString; cdecl;
    {class} function _GetKEY_ALLOW_VIDEO_CALLING_FALLBACK_BOOL: JString; cdecl;
    {class} function _GetKEY_ALWAYS_SHOW_DATA_RAT_ICON_BOOL: JString; cdecl;
    {class} function _GetKEY_ALWAYS_SHOW_EMERGENCY_ALERT_ONOFF_BOOL: JString; cdecl;
    {class} function _GetKEY_ALWAYS_SHOW_PRIMARY_SIGNAL_BAR_IN_OPPORTUNISTIC_NETWORK_BOOLEAN: JString; cdecl;
    {class} function _GetKEY_APN_EXPAND_BOOL: JString; cdecl;
    {class} function _GetKEY_APN_SETTINGS_DEFAULT_APN_TYPES_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_AUTO_RETRY_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_CALL_BARRING_DEFAULT_SERVICE_CLASS_INT: JString; cdecl;
    {class} function _GetKEY_CALL_BARRING_SUPPORTS_DEACTIVATE_ALL_BOOL: JString; cdecl;
    {class} function _GetKEY_CALL_BARRING_SUPPORTS_PASSWORD_CHANGE_BOOL: JString; cdecl;
    {class} function _GetKEY_CALL_BARRING_VISIBILITY_BOOL: JString; cdecl;
    {class} function _GetKEY_CALL_COMPOSER_PICTURE_SERVER_URL_STRING: JString; cdecl;
    {class} function _GetKEY_CALL_FORWARDING_BLOCKS_WHILE_ROAMING_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CALL_REDIRECTION_SERVICE_COMPONENT_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_ALLOW_DEFLECT_IMS_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_ALLOW_TURNOFF_IMS_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_APP_REQUIRED_DURING_SIM_SETUP_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_CALL_SCREENING_APP_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_CERTIFICATE_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_CONFIG_APPLIED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_CONFIG_VERSION_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_CROSS_SIM_IMS_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_DATA_CALL_PERMANENT_FAILURE_STRINGS: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_DCFAILURE_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_DEFAULT_NETWORK_AVAILABLE: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_REDIRECTION_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_RESET: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_REDIRECTION_URL_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_WFC_IMS_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_WFC_IMS_MODE_INT: JString; cdecl;
    {class} function _GetKEY_CARRIER_DEFAULT_WFC_IMS_ROAMING_MODE_INT: JString; cdecl;
    {class} function _GetKEY_CARRIER_FORCE_DISABLE_ETWS_CMAS_TEST_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_IMS_GBA_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_INSTANT_LETTERING_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_INSTANT_LETTERING_ENCODING_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_INSTANT_LETTERING_ESCAPED_CHARS_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_INSTANT_LETTERING_INVALID_CHARS_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_INSTANT_LETTERING_LENGTH_LIMIT_INT: JString; cdecl;
    {class} function _GetKEY_CARRIER_NAME_OVERRIDE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_NR_AVAILABILITIES_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_PROVISIONS_WIFI_MERGED_NETWORKS_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_RCS_PROVISIONING_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_SETTINGS_ACTIVITY_COMPONENT_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_SETTINGS_ENABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_SUPPORTS_OPP_DATA_AUTO_PROVISIONING_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_SUPPORTS_SS_OVER_UT_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_SUPPORTS_TETHERING_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_USE_IMS_FIRST_FOR_EMERGENCY_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_USSD_METHOD_INT: JString; cdecl;
    {class} function _GetKEY_CARRIER_UT_PROVISIONING_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_OVERRIDE_WFC_PROVISIONING_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_PROVISIONED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_PROVISIONING_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_TTY_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VT_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_VVM_PACKAGE_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_CARRIER_VVM_PACKAGE_NAME_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CARRIER_WFC_IMS_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CARRIER_WFC_SUPPORTS_WIFI_ONLY_BOOL: JString; cdecl;
    {class} function _GetKEY_CDMA_3WAYCALL_FLASH_DELAY_INT: JString; cdecl;
    {class} function _GetKEY_CDMA_DTMF_TONE_DELAY_INT: JString; cdecl;
    {class} function _GetKEY_CDMA_NONROAMING_NETWORKS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CDMA_ROAMING_MODE_INT: JString; cdecl;
    {class} function _GetKEY_CDMA_ROAMING_NETWORKS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_CELLULAR_USAGE_SETTING_INT: JString; cdecl;
    {class} function _GetKEY_CHECK_PRICING_WITH_CARRIER_FOR_DATA_ROAMING_BOOL: JString; cdecl;
    {class} function _GetKEY_CI_ACTION_ON_SYS_UPDATE_BOOL: JString; cdecl;
    {class} function _GetKEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_STRING: JString; cdecl;
    {class} function _GetKEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_VAL_STRING: JString; cdecl;
    {class} function _GetKEY_CI_ACTION_ON_SYS_UPDATE_INTENT_STRING: JString; cdecl;
    {class} function _GetKEY_CONFIG_IMS_MMTEL_PACKAGE_OVERRIDE_STRING: JString; cdecl;
    {class} function _GetKEY_CONFIG_IMS_PACKAGE_OVERRIDE_STRING: JString; cdecl;
    {class} function _GetKEY_CONFIG_IMS_RCS_PACKAGE_OVERRIDE_STRING: JString; cdecl;
    {class} function _GetKEY_CONFIG_PLANS_PACKAGE_OVERRIDE_STRING: JString; cdecl;
    {class} function _GetKEY_CONFIG_TELEPHONY_USE_OWN_NUMBER_FOR_VOICEMAIL_BOOL: JString; cdecl;
    {class} function _GetKEY_CONFIG_WIFI_DISABLE_IN_ECBM: JString; cdecl;
    {class} function _GetKEY_CROSS_SIM_SPN_FORMAT_INT: JString; cdecl;
    {class} function _GetKEY_CSP_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_DATA_LIMIT_NOTIFICATION_BOOL: JString; cdecl;
    {class} function _GetKEY_DATA_LIMIT_THRESHOLD_BYTES_LONG: JString; cdecl;
    {class} function _GetKEY_DATA_RAPID_NOTIFICATION_BOOL: JString; cdecl;
    {class} function _GetKEY_DATA_SWITCH_VALIDATION_TIMEOUT_LONG: JString; cdecl;
    {class} function _GetKEY_DATA_WARNING_NOTIFICATION_BOOL: JString; cdecl;
    {class} function _GetKEY_DATA_WARNING_THRESHOLD_BYTES_LONG: JString; cdecl;
    {class} function _GetKEY_DEFAULT_SIM_CALL_MANAGER_STRING: JString; cdecl;
    {class} function _GetKEY_DEFAULT_VM_NUMBER_ROAMING_AND_IMS_UNREGISTERED_STRING: JString; cdecl;
    {class} function _GetKEY_DEFAULT_VM_NUMBER_STRING: JString; cdecl;
    {class} function _GetKEY_DIAL_STRING_REPLACE_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_DISABLE_CDMA_ACTIVATION_CODE_BOOL: JString; cdecl;
    {class} function _GetKEY_DISABLE_CHARGE_INDICATION_BOOL: JString; cdecl;
    {class} function _GetKEY_DISABLE_SUPPLEMENTARY_SERVICES_IN_AIRPLANE_MODE_BOOL: JString; cdecl;
    {class} function _GetKEY_DISCONNECT_CAUSE_PLAY_BUSYTONE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_DISPLAY_CALL_STRENGTH_INDICATOR_BOOL: JString; cdecl;
    {class} function _GetKEY_DISPLAY_HD_AUDIO_PROPERTY_BOOL: JString; cdecl;
    {class} function _GetKEY_DROP_VIDEO_CALL_WHEN_ANSWERING_AUDIO_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_DTMF_TYPE_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_DURATION_BLOCKING_DISABLED_AFTER_EMERGENCY_INT: JString; cdecl;
    {class} function _GetKEY_EDITABLE_ENHANCED_4G_LTE_BOOL: JString; cdecl;
    {class} function _GetKEY_EDITABLE_VOICEMAIL_NUMBER_BOOL: JString; cdecl;
    {class} function _GetKEY_EDITABLE_VOICEMAIL_NUMBER_SETTING_BOOL: JString; cdecl;
    {class} function _GetKEY_EDITABLE_WFC_MODE_BOOL: JString; cdecl;
    {class} function _GetKEY_EDITABLE_WFC_ROAMING_MODE_BOOL: JString; cdecl;
    {class} function _GetKEY_EMERGENCY_NOTIFICATION_DELAY_INT: JString; cdecl;
    {class} function _GetKEY_EMERGENCY_NUMBER_PREFIX_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_ENABLE_CROSS_SIM_CALLING_ON_OPPORTUNISTIC_DATA_BOOL: JString; cdecl;
    {class} function _GetKEY_ENABLE_DIALER_KEY_VIBRATION_BOOL: JString; cdecl;
    {class} function _GetKEY_ENHANCED_4G_LTE_ON_BY_DEFAULT_BOOL: JString; cdecl;
    {class} function _GetKEY_ENHANCED_4G_LTE_TITLE_VARIANT_INT: JString; cdecl;
    {class} function _GetKEY_ESIM_DOWNLOAD_RETRY_BACKOFF_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_ESIM_MAX_DOWNLOAD_RETRY_ATTEMPTS_INT: JString; cdecl;
    {class} function _GetKEY_FORCE_HOME_NETWORK_BOOL: JString; cdecl;
    {class} function _GetKEY_GSM_DTMF_TONE_DELAY_INT: JString; cdecl;
    {class} function _GetKEY_GSM_NONROAMING_NETWORKS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_GSM_ROAMING_NETWORKS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_HAS_IN_CALL_NOISE_SUPPRESSION_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_CARRIER_NETWORK_SETTINGS_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_ENABLE_2G: JString; cdecl;
    {class} function _GetKEY_HIDE_ENHANCED_4G_LTE_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_IMS_APN_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_LTE_PLUS_DATA_ICON_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_PREFERRED_NETWORK_TYPE_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_PRESET_APN_DETAILS_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_SIM_LOCK_SETTINGS_BOOL: JString; cdecl;
    {class} function _GetKEY_HIDE_TTY_HCO_VCO_WITH_RTT_BOOL: JString; cdecl;
    {class} function _GetKEY_IGNORE_DATA_ENABLED_CHANGED_FOR_VIDEO_CALLS: JString; cdecl;
    {class} function _GetKEY_IGNORE_RTT_MODE_SETTING_BOOL: JString; cdecl;
    {class} function _GetKEY_IGNORE_SIM_NETWORK_LOCKED_EVENTS_BOOL: JString; cdecl;
    {class} function _GetKEY_IMS_CONFERENCE_SIZE_LIMIT_INT: JString; cdecl;
    {class} function _GetKEY_IMS_DTMF_TONE_DELAY_INT: JString; cdecl;
    {class} function _GetKEY_IS_IMS_CONFERENCE_SIZE_ENFORCED_BOOL: JString; cdecl;
    {class} function _GetKEY_IS_OPPORTUNISTIC_SUBSCRIPTION_BOOL: JString; cdecl;
    {class} function _GetKEY_LTE_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_LTE_RSRQ_THRESHOLDS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_LTE_RSSNR_THRESHOLDS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_MDN_IS_ADDITIONAL_VOICEMAIL_NUMBER_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_ALIAS_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_ALIAS_MAX_CHARS_INT: JString; cdecl;
    {class} function _GetKEY_MMS_ALIAS_MIN_CHARS_INT: JString; cdecl;
    {class} function _GetKEY_MMS_ALLOW_ATTACH_AUDIO_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_APPEND_TRANSACTION_ID_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_CLOSE_CONNECTION_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_EMAIL_GATEWAY_NUMBER_STRING: JString; cdecl;
    {class} function _GetKEY_MMS_GROUP_MMS_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_HTTP_PARAMS_STRING: JString; cdecl;
    {class} function _GetKEY_MMS_HTTP_SOCKET_TIMEOUT_INT: JString; cdecl;
    {class} function _GetKEY_MMS_MAX_IMAGE_HEIGHT_INT: JString; cdecl;
    {class} function _GetKEY_MMS_MAX_IMAGE_WIDTH_INT: JString; cdecl;
    {class} function _GetKEY_MMS_MAX_MESSAGE_SIZE_INT: JString; cdecl;
    {class} function _GetKEY_MMS_MESSAGE_TEXT_MAX_SIZE_INT: JString; cdecl;
    {class} function _GetKEY_MMS_MMS_DELIVERY_REPORT_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_MMS_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_MMS_READ_REPORT_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_MULTIPART_SMS_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_NAI_SUFFIX_STRING: JString; cdecl;
    {class} function _GetKEY_MMS_NOTIFY_WAP_MMSC_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_RECIPIENT_LIMIT_INT: JString; cdecl;
    {class} function _GetKEY_MMS_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_SHOW_CELL_BROADCAST_APP_LINKS_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_SMS_DELIVERY_REPORT_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD_INT: JString; cdecl;
    {class} function _GetKEY_MMS_SMS_TO_MMS_TEXT_THRESHOLD_INT: JString; cdecl;
    {class} function _GetKEY_MMS_SUBJECT_MAX_LENGTH_INT: JString; cdecl;
    {class} function _GetKEY_MMS_SUPPORT_HTTP_CHARSET_HEADER_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_SUPPORT_MMS_CONTENT_DISPOSITION_BOOL: JString; cdecl;
    {class} function _GetKEY_MMS_UA_PROF_TAG_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_MMS_UA_PROF_URL_STRING: JString; cdecl;
    {class} function _GetKEY_MMS_USER_AGENT_STRING: JString; cdecl;
    {class} function _GetKEY_MONTHLY_DATA_CYCLE_DAY_INT: JString; cdecl;
    {class} function _GetKEY_ONLY_AUTO_SELECT_IN_HOME_NETWORK_BOOL: JString; cdecl;
    {class} function _GetKEY_ONLY_SINGLE_DC_ALLOWED_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_OPERATOR_SELECTION_EXPAND_BOOL: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_BACKOFF_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_EXIT_HYSTERESIS_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_HYSTERESIS_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_OR_EXIT_HYSTERESIS_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_BANDWIDTH_INT: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSRP_INT: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSSNR_INT: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSRP_INT: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSSNR_INT: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_MAX_BACKOFF_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_OPPORTUNISTIC_NETWORK_PING_PONG_TIME_LONG: JString; cdecl;
    {class} function _GetKEY_PING_TEST_BEFORE_DATA_SWITCH_BOOL: JString; cdecl;
    {class} function _GetKEY_PREFER_2G_BOOL: JString; cdecl;
    {class} function _GetKEY_PREVENT_CLIR_ACTIVATION_AND_DEACTIVATION_CODE_BOOL: JString; cdecl;
    {class} function _GetKEY_RADIO_RESTART_FAILURE_CAUSES_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_RCS_CONFIG_SERVER_URL_STRING: JString; cdecl;
    {class} function _GetKEY_READ_ONLY_APN_FIELDS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_READ_ONLY_APN_TYPES_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_REQUIRE_ENTITLEMENT_CHECKS_BOOL: JString; cdecl;
    {class} function _GetKEY_RESTART_RADIO_ON_PDP_FAIL_REGULAR_DEACTIVATION_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_AUTO_UPGRADE_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_DOWNGRADE_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_SUPPORTED_FOR_VT_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_SUPPORTED_WHILE_ROAMING_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_UPGRADE_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_RTT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_VT_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_4G_FOR_3G_DATA_ICON_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_4G_FOR_LTE_DATA_ICON_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_APN_SETTING_CDMA_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_BLOCKING_PAY_PHONE_OPTION_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_CALL_BLOCKING_DISABLED_NOTIFICATION_ALWAYS_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_CDMA_CHOICES_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_FORWARDED_NUMBER_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_ICCID_IN_SIM_STATUS_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_IMS_REGISTRATION_STATUS_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_ONSCREEN_DIAL_BUTTON_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_SIGNAL_STRENGTH_IN_SIM_STATUS_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_VIDEO_CALL_CHARGES_ALERT_DIALOG_BOOL: JString; cdecl;
    {class} function _GetKEY_SHOW_WFC_LOCATION_PRIVACY_POLICY_BOOL: JString; cdecl;
    {class} function _GetKEY_SIMPLIFIED_NETWORK_SETTINGS_BOOL: JString; cdecl;
    {class} function _GetKEY_SIM_NETWORK_UNLOCK_ALLOW_DISMISS_BOOL: JString; cdecl;
    {class} function _GetKEY_SMDP_SERVER_ADDRESS_STRING: JString; cdecl;
    {class} function _GetKEY_SMS_REQUIRES_DESTINATION_NUMBER_CONVERSION_BOOL: JString; cdecl;
    {class} function _GetKEY_SUBSCRIPTION_GROUP_UUID_STRING: JString; cdecl;
    {class} function _GetKEY_SUPPORTS_CALL_COMPOSER_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_DTMF_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_RTP_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORTS_SDP_NEGOTIATION_OF_D2D_RTP_HEADER_EXTENSIONS_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_3GPP_CALL_FORWARDING_WHILE_ROAMING_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_ADD_CONFERENCE_PARTICIPANTS_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_ADHOC_CONFERENCE_CALLS_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_CLIR_NETWORK_DEFAULT_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_CONFERENCE_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_EMERGENCY_SMS_OVER_IMS_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_ENHANCED_CALL_BLOCKING_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_IMS_CONFERENCE_EVENT_PACKAGE_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_PAUSE_IMS_VIDEO_CALLS_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_SWAP_AFTER_MERGE_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_TDSCDMA_BOOL: JString; cdecl;
    {class} function _GetKEY_SUPPORT_TDSCDMA_ROAMING_NETWORKS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_SWITCH_DATA_TO_PRIMARY_IF_PRIMARY_IS_OOS_BOOL: JString; cdecl;
    {class} function _GetKEY_TREAT_DOWNGRADED_VIDEO_CALLS_AS_VIDEO_CALLS_BOOL: JString; cdecl;
    {class} function _GetKEY_TTY_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_UNLOGGABLE_NUMBERS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_USE_ACS_FOR_RCS_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_HFA_FOR_PROVISIONING_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_IP_FOR_CALLING_INDICATOR_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_OTASP_FOR_PROVISIONING_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_RCS_PRESENCE_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_RCS_SIP_OPTIONS_BOOL: JString; cdecl;
    {class} function _GetKEY_USE_WFC_HOME_NETWORK_MODE_IN_ROAMING_NETWORK_BOOL: JString; cdecl;
    {class} function _GetKEY_VOICEMAIL_NOTIFICATION_PERSISTENT_BOOL: JString; cdecl;
    {class} function _GetKEY_VOICE_PRIVACY_DISABLE_UI_BOOL: JString; cdecl;
    {class} function _GetKEY_VOLTE_REPLACEMENT_RAT_INT: JString; cdecl;
    {class} function _GetKEY_VT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_RTT_CALL_BOOL: JString; cdecl;
    {class} function _GetKEY_VVM_CELLULAR_DATA_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_VVM_CLIENT_PREFIX_STRING: JString; cdecl;
    {class} function _GetKEY_VVM_DESTINATION_NUMBER_STRING: JString; cdecl;
    {class} function _GetKEY_VVM_DISABLED_CAPABILITIES_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_VVM_LEGACY_MODE_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_VVM_PORT_NUMBER_INT: JString; cdecl;
    {class} function _GetKEY_VVM_PREFETCH_BOOL: JString; cdecl;
    {class} function _GetKEY_VVM_SSL_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_VVM_TYPE_STRING: JString; cdecl;
    {class} function _GetKEY_WFC_EMERGENCY_ADDRESS_CARRIER_APP_STRING: JString; cdecl;
    {class} function _GetKEY_WORLD_MODE_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_WORLD_PHONE_BOOL: JString; cdecl;
    {class} function _GetREMOVE_GROUP_UUID_STRING: JString; cdecl;
    {class} function _GetSERVICE_CLASS_NONE: Integer; cdecl;
    {class} function _GetSERVICE_CLASS_VOICE: Integer; cdecl;
    {class} function _GetUSSD_OVER_CS_ONLY: Integer; cdecl;
    {class} function _GetUSSD_OVER_CS_PREFERRED: Integer; cdecl;
    {class} function _GetUSSD_OVER_IMS_ONLY: Integer; cdecl;
    {class} function _GetUSSD_OVER_IMS_PREFERRED: Integer; cdecl;
    {class} function isConfigForIdentifiedCarrier(bundle: JPersistableBundle): Boolean; cdecl;
    {class} property ACTION_CARRIER_CONFIG_CHANGED: JString read _GetACTION_CARRIER_CONFIG_CHANGED;
    {class} property CARRIER_NR_AVAILABILITY_NSA: Integer read _GetCARRIER_NR_AVAILABILITY_NSA;
    {class} property CARRIER_NR_AVAILABILITY_SA: Integer read _GetCARRIER_NR_AVAILABILITY_SA;
    {class} property CROSS_SIM_SPN_FORMAT_CARRIER_NAME_ONLY: Integer read _GetCROSS_SIM_SPN_FORMAT_CARRIER_NAME_ONLY;
    {class} property CROSS_SIM_SPN_FORMAT_CARRIER_NAME_WITH_BRANDING: Integer read _GetCROSS_SIM_SPN_FORMAT_CARRIER_NAME_WITH_BRANDING;
    {class} property DATA_CYCLE_THRESHOLD_DISABLED: Integer read _GetDATA_CYCLE_THRESHOLD_DISABLED;
    {class} property DATA_CYCLE_USE_PLATFORM_DEFAULT: Integer read _GetDATA_CYCLE_USE_PLATFORM_DEFAULT;
    {class} property ENABLE_EAP_METHOD_PREFIX_BOOL: JString read _GetENABLE_EAP_METHOD_PREFIX_BOOL;
    {class} property EXTRA_REBROADCAST_ON_UNLOCK: JString read _GetEXTRA_REBROADCAST_ON_UNLOCK;
    {class} property EXTRA_SLOT_INDEX: JString read _GetEXTRA_SLOT_INDEX;
    {class} property EXTRA_SUBSCRIPTION_INDEX: JString read _GetEXTRA_SUBSCRIPTION_INDEX;
    {class} property IMSI_KEY_AVAILABILITY_INT: JString read _GetIMSI_KEY_AVAILABILITY_INT;
    {class} property KEY_5G_NR_SSRSRP_THRESHOLDS_INT_ARRAY: JString read _GetKEY_5G_NR_SSRSRP_THRESHOLDS_INT_ARRAY;
    {class} property KEY_5G_NR_SSRSRQ_THRESHOLDS_INT_ARRAY: JString read _GetKEY_5G_NR_SSRSRQ_THRESHOLDS_INT_ARRAY;
    {class} property KEY_5G_NR_SSSINR_THRESHOLDS_INT_ARRAY: JString read _GetKEY_5G_NR_SSSINR_THRESHOLDS_INT_ARRAY;
    {class} property KEY_ADDITIONAL_CALL_SETTING_BOOL: JString read _GetKEY_ADDITIONAL_CALL_SETTING_BOOL;
    {class} property KEY_ALLOW_ADDING_APNS_BOOL: JString read _GetKEY_ALLOW_ADDING_APNS_BOOL;
    {class} property KEY_ALLOW_ADD_CALL_DURING_VIDEO_CALL_BOOL: JString read _GetKEY_ALLOW_ADD_CALL_DURING_VIDEO_CALL_BOOL;
    {class} property KEY_ALLOW_EMERGENCY_NUMBERS_IN_CALL_LOG_BOOL: JString read _GetKEY_ALLOW_EMERGENCY_NUMBERS_IN_CALL_LOG_BOOL;
    {class} property KEY_ALLOW_EMERGENCY_VIDEO_CALLS_BOOL: JString read _GetKEY_ALLOW_EMERGENCY_VIDEO_CALLS_BOOL;
    {class} property KEY_ALLOW_HOLD_CALL_DURING_EMERGENCY_BOOL: JString read _GetKEY_ALLOW_HOLD_CALL_DURING_EMERGENCY_BOOL;
    {class} property KEY_ALLOW_HOLD_VIDEO_CALL_BOOL: JString read _GetKEY_ALLOW_HOLD_VIDEO_CALL_BOOL;
    {class} property KEY_ALLOW_LOCAL_DTMF_TONES_BOOL: JString read _GetKEY_ALLOW_LOCAL_DTMF_TONES_BOOL;
    {class} property KEY_ALLOW_MERGE_WIFI_CALLS_WHEN_VOWIFI_OFF_BOOL: JString read _GetKEY_ALLOW_MERGE_WIFI_CALLS_WHEN_VOWIFI_OFF_BOOL;
    {class} property KEY_ALLOW_NON_EMERGENCY_CALLS_IN_ECM_BOOL: JString read _GetKEY_ALLOW_NON_EMERGENCY_CALLS_IN_ECM_BOOL;
    {class} property KEY_ALLOW_VIDEO_CALLING_FALLBACK_BOOL: JString read _GetKEY_ALLOW_VIDEO_CALLING_FALLBACK_BOOL;
    {class} property KEY_ALWAYS_SHOW_DATA_RAT_ICON_BOOL: JString read _GetKEY_ALWAYS_SHOW_DATA_RAT_ICON_BOOL;
    {class} property KEY_ALWAYS_SHOW_EMERGENCY_ALERT_ONOFF_BOOL: JString read _GetKEY_ALWAYS_SHOW_EMERGENCY_ALERT_ONOFF_BOOL;
    {class} property KEY_ALWAYS_SHOW_PRIMARY_SIGNAL_BAR_IN_OPPORTUNISTIC_NETWORK_BOOLEAN: JString read _GetKEY_ALWAYS_SHOW_PRIMARY_SIGNAL_BAR_IN_OPPORTUNISTIC_NETWORK_BOOLEAN;
    {class} property KEY_APN_EXPAND_BOOL: JString read _GetKEY_APN_EXPAND_BOOL;
    {class} property KEY_APN_SETTINGS_DEFAULT_APN_TYPES_STRING_ARRAY: JString read _GetKEY_APN_SETTINGS_DEFAULT_APN_TYPES_STRING_ARRAY;
    {class} property KEY_AUTO_RETRY_ENABLED_BOOL: JString read _GetKEY_AUTO_RETRY_ENABLED_BOOL;
    {class} property KEY_CALL_BARRING_DEFAULT_SERVICE_CLASS_INT: JString read _GetKEY_CALL_BARRING_DEFAULT_SERVICE_CLASS_INT;
    {class} property KEY_CALL_BARRING_SUPPORTS_DEACTIVATE_ALL_BOOL: JString read _GetKEY_CALL_BARRING_SUPPORTS_DEACTIVATE_ALL_BOOL;
    {class} property KEY_CALL_BARRING_SUPPORTS_PASSWORD_CHANGE_BOOL: JString read _GetKEY_CALL_BARRING_SUPPORTS_PASSWORD_CHANGE_BOOL;
    {class} property KEY_CALL_BARRING_VISIBILITY_BOOL: JString read _GetKEY_CALL_BARRING_VISIBILITY_BOOL;
    {class} property KEY_CALL_COMPOSER_PICTURE_SERVER_URL_STRING: JString read _GetKEY_CALL_COMPOSER_PICTURE_SERVER_URL_STRING;
    {class} property KEY_CALL_FORWARDING_BLOCKS_WHILE_ROAMING_STRING_ARRAY: JString read _GetKEY_CALL_FORWARDING_BLOCKS_WHILE_ROAMING_STRING_ARRAY;
    {class} property KEY_CALL_REDIRECTION_SERVICE_COMPONENT_NAME_STRING: JString read _GetKEY_CALL_REDIRECTION_SERVICE_COMPONENT_NAME_STRING;
    {class} property KEY_CARRIER_ALLOW_DEFLECT_IMS_CALL_BOOL: JString read _GetKEY_CARRIER_ALLOW_DEFLECT_IMS_CALL_BOOL;
    {class} property KEY_CARRIER_ALLOW_TURNOFF_IMS_BOOL: JString read _GetKEY_CARRIER_ALLOW_TURNOFF_IMS_BOOL;
    {class} property KEY_CARRIER_APP_REQUIRED_DURING_SIM_SETUP_BOOL: JString read _GetKEY_CARRIER_APP_REQUIRED_DURING_SIM_SETUP_BOOL;
    {class} property KEY_CARRIER_CALL_SCREENING_APP_STRING: JString read _GetKEY_CARRIER_CALL_SCREENING_APP_STRING;
    {class} property KEY_CARRIER_CERTIFICATE_STRING_ARRAY: JString read _GetKEY_CARRIER_CERTIFICATE_STRING_ARRAY;
    {class} property KEY_CARRIER_CONFIG_APPLIED_BOOL: JString read _GetKEY_CARRIER_CONFIG_APPLIED_BOOL;
    {class} property KEY_CARRIER_CONFIG_VERSION_STRING: JString read _GetKEY_CARRIER_CONFIG_VERSION_STRING;
    {class} property KEY_CARRIER_CROSS_SIM_IMS_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_CROSS_SIM_IMS_AVAILABLE_BOOL;
    {class} property KEY_CARRIER_DATA_CALL_PERMANENT_FAILURE_STRINGS: JString read _GetKEY_CARRIER_DATA_CALL_PERMANENT_FAILURE_STRINGS;
    {class} property KEY_CARRIER_DEFAULT_ACTIONS_ON_DCFAILURE_STRING_ARRAY: JString read _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_DCFAILURE_STRING_ARRAY;
    {class} property KEY_CARRIER_DEFAULT_ACTIONS_ON_DEFAULT_NETWORK_AVAILABLE: JString read _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_DEFAULT_NETWORK_AVAILABLE;
    {class} property KEY_CARRIER_DEFAULT_ACTIONS_ON_REDIRECTION_STRING_ARRAY: JString read _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_REDIRECTION_STRING_ARRAY;
    {class} property KEY_CARRIER_DEFAULT_ACTIONS_ON_RESET: JString read _GetKEY_CARRIER_DEFAULT_ACTIONS_ON_RESET;
    {class} property KEY_CARRIER_DEFAULT_REDIRECTION_URL_STRING_ARRAY: JString read _GetKEY_CARRIER_DEFAULT_REDIRECTION_URL_STRING_ARRAY;
    {class} property KEY_CARRIER_DEFAULT_WFC_IMS_ENABLED_BOOL: JString read _GetKEY_CARRIER_DEFAULT_WFC_IMS_ENABLED_BOOL;
    {class} property KEY_CARRIER_DEFAULT_WFC_IMS_MODE_INT: JString read _GetKEY_CARRIER_DEFAULT_WFC_IMS_MODE_INT;
    {class} property KEY_CARRIER_DEFAULT_WFC_IMS_ROAMING_MODE_INT: JString read _GetKEY_CARRIER_DEFAULT_WFC_IMS_ROAMING_MODE_INT;
    {class} property KEY_CARRIER_FORCE_DISABLE_ETWS_CMAS_TEST_BOOL: JString read _GetKEY_CARRIER_FORCE_DISABLE_ETWS_CMAS_TEST_BOOL;
    {class} property KEY_CARRIER_IMS_GBA_REQUIRED_BOOL: JString read _GetKEY_CARRIER_IMS_GBA_REQUIRED_BOOL;
    {class} property KEY_CARRIER_INSTANT_LETTERING_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_INSTANT_LETTERING_AVAILABLE_BOOL;
    {class} property KEY_CARRIER_INSTANT_LETTERING_ENCODING_STRING: JString read _GetKEY_CARRIER_INSTANT_LETTERING_ENCODING_STRING;
    {class} property KEY_CARRIER_INSTANT_LETTERING_ESCAPED_CHARS_STRING: JString read _GetKEY_CARRIER_INSTANT_LETTERING_ESCAPED_CHARS_STRING;
    {class} property KEY_CARRIER_INSTANT_LETTERING_INVALID_CHARS_STRING: JString read _GetKEY_CARRIER_INSTANT_LETTERING_INVALID_CHARS_STRING;
    {class} property KEY_CARRIER_INSTANT_LETTERING_LENGTH_LIMIT_INT: JString read _GetKEY_CARRIER_INSTANT_LETTERING_LENGTH_LIMIT_INT;
    {class} property KEY_CARRIER_NAME_OVERRIDE_BOOL: JString read _GetKEY_CARRIER_NAME_OVERRIDE_BOOL;
    {class} property KEY_CARRIER_NAME_STRING: JString read _GetKEY_CARRIER_NAME_STRING;
    {class} property KEY_CARRIER_NR_AVAILABILITIES_INT_ARRAY: JString read _GetKEY_CARRIER_NR_AVAILABILITIES_INT_ARRAY;
    {class} property KEY_CARRIER_PROVISIONS_WIFI_MERGED_NETWORKS_BOOL: JString read _GetKEY_CARRIER_PROVISIONS_WIFI_MERGED_NETWORKS_BOOL;
    {class} property KEY_CARRIER_RCS_PROVISIONING_REQUIRED_BOOL: JString read _GetKEY_CARRIER_RCS_PROVISIONING_REQUIRED_BOOL;
    {class} property KEY_CARRIER_SETTINGS_ACTIVITY_COMPONENT_NAME_STRING: JString read _GetKEY_CARRIER_SETTINGS_ACTIVITY_COMPONENT_NAME_STRING;
    {class} property KEY_CARRIER_SETTINGS_ENABLE_BOOL: JString read _GetKEY_CARRIER_SETTINGS_ENABLE_BOOL;
    {class} property KEY_CARRIER_SUPPORTS_OPP_DATA_AUTO_PROVISIONING_BOOL: JString read _GetKEY_CARRIER_SUPPORTS_OPP_DATA_AUTO_PROVISIONING_BOOL;
    {class} property KEY_CARRIER_SUPPORTS_SS_OVER_UT_BOOL: JString read _GetKEY_CARRIER_SUPPORTS_SS_OVER_UT_BOOL;
    {class} property KEY_CARRIER_SUPPORTS_TETHERING_BOOL: JString read _GetKEY_CARRIER_SUPPORTS_TETHERING_BOOL;
    {class} property KEY_CARRIER_USE_IMS_FIRST_FOR_EMERGENCY_BOOL: JString read _GetKEY_CARRIER_USE_IMS_FIRST_FOR_EMERGENCY_BOOL;
    {class} property KEY_CARRIER_USSD_METHOD_INT: JString read _GetKEY_CARRIER_USSD_METHOD_INT;
    {class} property KEY_CARRIER_UT_PROVISIONING_REQUIRED_BOOL: JString read _GetKEY_CARRIER_UT_PROVISIONING_REQUIRED_BOOL;
    {class} property KEY_CARRIER_VOLTE_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_VOLTE_AVAILABLE_BOOL;
    {class} property KEY_CARRIER_VOLTE_OVERRIDE_WFC_PROVISIONING_BOOL: JString read _GetKEY_CARRIER_VOLTE_OVERRIDE_WFC_PROVISIONING_BOOL;
    {class} property KEY_CARRIER_VOLTE_PROVISIONED_BOOL: JString read _GetKEY_CARRIER_VOLTE_PROVISIONED_BOOL;
    {class} property KEY_CARRIER_VOLTE_PROVISIONING_REQUIRED_BOOL: JString read _GetKEY_CARRIER_VOLTE_PROVISIONING_REQUIRED_BOOL;
    {class} property KEY_CARRIER_VOLTE_TTY_SUPPORTED_BOOL: JString read _GetKEY_CARRIER_VOLTE_TTY_SUPPORTED_BOOL;
    {class} property KEY_CARRIER_VT_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_VT_AVAILABLE_BOOL;
    {class} property KEY_CARRIER_VVM_PACKAGE_NAME_STRING: JString read _GetKEY_CARRIER_VVM_PACKAGE_NAME_STRING;
    {class} property KEY_CARRIER_VVM_PACKAGE_NAME_STRING_ARRAY: JString read _GetKEY_CARRIER_VVM_PACKAGE_NAME_STRING_ARRAY;
    {class} property KEY_CARRIER_WFC_IMS_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_WFC_IMS_AVAILABLE_BOOL;
    {class} property KEY_CARRIER_WFC_SUPPORTS_WIFI_ONLY_BOOL: JString read _GetKEY_CARRIER_WFC_SUPPORTS_WIFI_ONLY_BOOL;
    {class} property KEY_CDMA_3WAYCALL_FLASH_DELAY_INT: JString read _GetKEY_CDMA_3WAYCALL_FLASH_DELAY_INT;
    {class} property KEY_CDMA_DTMF_TONE_DELAY_INT: JString read _GetKEY_CDMA_DTMF_TONE_DELAY_INT;
    {class} property KEY_CDMA_NONROAMING_NETWORKS_STRING_ARRAY: JString read _GetKEY_CDMA_NONROAMING_NETWORKS_STRING_ARRAY;
    {class} property KEY_CDMA_ROAMING_MODE_INT: JString read _GetKEY_CDMA_ROAMING_MODE_INT;
    {class} property KEY_CDMA_ROAMING_NETWORKS_STRING_ARRAY: JString read _GetKEY_CDMA_ROAMING_NETWORKS_STRING_ARRAY;
    {class} property KEY_CELLULAR_USAGE_SETTING_INT: JString read _GetKEY_CELLULAR_USAGE_SETTING_INT;
    {class} property KEY_CHECK_PRICING_WITH_CARRIER_FOR_DATA_ROAMING_BOOL: JString read _GetKEY_CHECK_PRICING_WITH_CARRIER_FOR_DATA_ROAMING_BOOL;
    {class} property KEY_CI_ACTION_ON_SYS_UPDATE_BOOL: JString read _GetKEY_CI_ACTION_ON_SYS_UPDATE_BOOL;
    {class} property KEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_STRING: JString read _GetKEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_STRING;
    {class} property KEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_VAL_STRING: JString read _GetKEY_CI_ACTION_ON_SYS_UPDATE_EXTRA_VAL_STRING;
    {class} property KEY_CI_ACTION_ON_SYS_UPDATE_INTENT_STRING: JString read _GetKEY_CI_ACTION_ON_SYS_UPDATE_INTENT_STRING;
    {class} property KEY_CONFIG_IMS_MMTEL_PACKAGE_OVERRIDE_STRING: JString read _GetKEY_CONFIG_IMS_MMTEL_PACKAGE_OVERRIDE_STRING;
    {class} property KEY_CONFIG_IMS_PACKAGE_OVERRIDE_STRING: JString read _GetKEY_CONFIG_IMS_PACKAGE_OVERRIDE_STRING;
    {class} property KEY_CONFIG_IMS_RCS_PACKAGE_OVERRIDE_STRING: JString read _GetKEY_CONFIG_IMS_RCS_PACKAGE_OVERRIDE_STRING;
    {class} property KEY_CONFIG_PLANS_PACKAGE_OVERRIDE_STRING: JString read _GetKEY_CONFIG_PLANS_PACKAGE_OVERRIDE_STRING;
    {class} property KEY_CONFIG_TELEPHONY_USE_OWN_NUMBER_FOR_VOICEMAIL_BOOL: JString read _GetKEY_CONFIG_TELEPHONY_USE_OWN_NUMBER_FOR_VOICEMAIL_BOOL;
    {class} property KEY_CONFIG_WIFI_DISABLE_IN_ECBM: JString read _GetKEY_CONFIG_WIFI_DISABLE_IN_ECBM;
    {class} property KEY_CROSS_SIM_SPN_FORMAT_INT: JString read _GetKEY_CROSS_SIM_SPN_FORMAT_INT;
    {class} property KEY_CSP_ENABLED_BOOL: JString read _GetKEY_CSP_ENABLED_BOOL;
    {class} property KEY_DATA_LIMIT_NOTIFICATION_BOOL: JString read _GetKEY_DATA_LIMIT_NOTIFICATION_BOOL;
    {class} property KEY_DATA_LIMIT_THRESHOLD_BYTES_LONG: JString read _GetKEY_DATA_LIMIT_THRESHOLD_BYTES_LONG;
    {class} property KEY_DATA_RAPID_NOTIFICATION_BOOL: JString read _GetKEY_DATA_RAPID_NOTIFICATION_BOOL;
    {class} property KEY_DATA_SWITCH_VALIDATION_TIMEOUT_LONG: JString read _GetKEY_DATA_SWITCH_VALIDATION_TIMEOUT_LONG;
    {class} property KEY_DATA_WARNING_NOTIFICATION_BOOL: JString read _GetKEY_DATA_WARNING_NOTIFICATION_BOOL;
    {class} property KEY_DATA_WARNING_THRESHOLD_BYTES_LONG: JString read _GetKEY_DATA_WARNING_THRESHOLD_BYTES_LONG;
    {class} property KEY_DEFAULT_SIM_CALL_MANAGER_STRING: JString read _GetKEY_DEFAULT_SIM_CALL_MANAGER_STRING;
    {class} property KEY_DEFAULT_VM_NUMBER_ROAMING_AND_IMS_UNREGISTERED_STRING: JString read _GetKEY_DEFAULT_VM_NUMBER_ROAMING_AND_IMS_UNREGISTERED_STRING;
    {class} property KEY_DEFAULT_VM_NUMBER_STRING: JString read _GetKEY_DEFAULT_VM_NUMBER_STRING;
    {class} property KEY_DIAL_STRING_REPLACE_STRING_ARRAY: JString read _GetKEY_DIAL_STRING_REPLACE_STRING_ARRAY;
    {class} property KEY_DISABLE_CDMA_ACTIVATION_CODE_BOOL: JString read _GetKEY_DISABLE_CDMA_ACTIVATION_CODE_BOOL;
    {class} property KEY_DISABLE_CHARGE_INDICATION_BOOL: JString read _GetKEY_DISABLE_CHARGE_INDICATION_BOOL;
    {class} property KEY_DISABLE_SUPPLEMENTARY_SERVICES_IN_AIRPLANE_MODE_BOOL: JString read _GetKEY_DISABLE_SUPPLEMENTARY_SERVICES_IN_AIRPLANE_MODE_BOOL;
    {class} property KEY_DISCONNECT_CAUSE_PLAY_BUSYTONE_INT_ARRAY: JString read _GetKEY_DISCONNECT_CAUSE_PLAY_BUSYTONE_INT_ARRAY;
    {class} property KEY_DISPLAY_CALL_STRENGTH_INDICATOR_BOOL: JString read _GetKEY_DISPLAY_CALL_STRENGTH_INDICATOR_BOOL;
    {class} property KEY_DISPLAY_HD_AUDIO_PROPERTY_BOOL: JString read _GetKEY_DISPLAY_HD_AUDIO_PROPERTY_BOOL;
    {class} property KEY_DROP_VIDEO_CALL_WHEN_ANSWERING_AUDIO_CALL_BOOL: JString read _GetKEY_DROP_VIDEO_CALL_WHEN_ANSWERING_AUDIO_CALL_BOOL;
    {class} property KEY_DTMF_TYPE_ENABLED_BOOL: JString read _GetKEY_DTMF_TYPE_ENABLED_BOOL;
    {class} property KEY_DURATION_BLOCKING_DISABLED_AFTER_EMERGENCY_INT: JString read _GetKEY_DURATION_BLOCKING_DISABLED_AFTER_EMERGENCY_INT;
    {class} property KEY_EDITABLE_ENHANCED_4G_LTE_BOOL: JString read _GetKEY_EDITABLE_ENHANCED_4G_LTE_BOOL;
    {class} property KEY_EDITABLE_VOICEMAIL_NUMBER_BOOL: JString read _GetKEY_EDITABLE_VOICEMAIL_NUMBER_BOOL;
    {class} property KEY_EDITABLE_VOICEMAIL_NUMBER_SETTING_BOOL: JString read _GetKEY_EDITABLE_VOICEMAIL_NUMBER_SETTING_BOOL;
    {class} property KEY_EDITABLE_WFC_MODE_BOOL: JString read _GetKEY_EDITABLE_WFC_MODE_BOOL;
    {class} property KEY_EDITABLE_WFC_ROAMING_MODE_BOOL: JString read _GetKEY_EDITABLE_WFC_ROAMING_MODE_BOOL;
    {class} property KEY_EMERGENCY_NOTIFICATION_DELAY_INT: JString read _GetKEY_EMERGENCY_NOTIFICATION_DELAY_INT;
    {class} property KEY_EMERGENCY_NUMBER_PREFIX_STRING_ARRAY: JString read _GetKEY_EMERGENCY_NUMBER_PREFIX_STRING_ARRAY;
    {class} property KEY_ENABLE_CROSS_SIM_CALLING_ON_OPPORTUNISTIC_DATA_BOOL: JString read _GetKEY_ENABLE_CROSS_SIM_CALLING_ON_OPPORTUNISTIC_DATA_BOOL;
    {class} property KEY_ENABLE_DIALER_KEY_VIBRATION_BOOL: JString read _GetKEY_ENABLE_DIALER_KEY_VIBRATION_BOOL;
    {class} property KEY_ENHANCED_4G_LTE_ON_BY_DEFAULT_BOOL: JString read _GetKEY_ENHANCED_4G_LTE_ON_BY_DEFAULT_BOOL;
    {class} property KEY_ENHANCED_4G_LTE_TITLE_VARIANT_INT: JString read _GetKEY_ENHANCED_4G_LTE_TITLE_VARIANT_INT;
    {class} property KEY_ESIM_DOWNLOAD_RETRY_BACKOFF_TIMER_SEC_INT: JString read _GetKEY_ESIM_DOWNLOAD_RETRY_BACKOFF_TIMER_SEC_INT;
    {class} property KEY_ESIM_MAX_DOWNLOAD_RETRY_ATTEMPTS_INT: JString read _GetKEY_ESIM_MAX_DOWNLOAD_RETRY_ATTEMPTS_INT;
    {class} property KEY_FORCE_HOME_NETWORK_BOOL: JString read _GetKEY_FORCE_HOME_NETWORK_BOOL;
    {class} property KEY_GSM_DTMF_TONE_DELAY_INT: JString read _GetKEY_GSM_DTMF_TONE_DELAY_INT;
    {class} property KEY_GSM_NONROAMING_NETWORKS_STRING_ARRAY: JString read _GetKEY_GSM_NONROAMING_NETWORKS_STRING_ARRAY;
    {class} property KEY_GSM_ROAMING_NETWORKS_STRING_ARRAY: JString read _GetKEY_GSM_ROAMING_NETWORKS_STRING_ARRAY;
    {class} property KEY_HAS_IN_CALL_NOISE_SUPPRESSION_BOOL: JString read _GetKEY_HAS_IN_CALL_NOISE_SUPPRESSION_BOOL;
    {class} property KEY_HIDE_CARRIER_NETWORK_SETTINGS_BOOL: JString read _GetKEY_HIDE_CARRIER_NETWORK_SETTINGS_BOOL;
    {class} property KEY_HIDE_ENABLE_2G: JString read _GetKEY_HIDE_ENABLE_2G;
    {class} property KEY_HIDE_ENHANCED_4G_LTE_BOOL: JString read _GetKEY_HIDE_ENHANCED_4G_LTE_BOOL;
    {class} property KEY_HIDE_IMS_APN_BOOL: JString read _GetKEY_HIDE_IMS_APN_BOOL;
    {class} property KEY_HIDE_LTE_PLUS_DATA_ICON_BOOL: JString read _GetKEY_HIDE_LTE_PLUS_DATA_ICON_BOOL;
    {class} property KEY_HIDE_PREFERRED_NETWORK_TYPE_BOOL: JString read _GetKEY_HIDE_PREFERRED_NETWORK_TYPE_BOOL;
    {class} property KEY_HIDE_PRESET_APN_DETAILS_BOOL: JString read _GetKEY_HIDE_PRESET_APN_DETAILS_BOOL;
    {class} property KEY_HIDE_SIM_LOCK_SETTINGS_BOOL: JString read _GetKEY_HIDE_SIM_LOCK_SETTINGS_BOOL;
    {class} property KEY_HIDE_TTY_HCO_VCO_WITH_RTT_BOOL: JString read _GetKEY_HIDE_TTY_HCO_VCO_WITH_RTT_BOOL;
    {class} property KEY_IGNORE_DATA_ENABLED_CHANGED_FOR_VIDEO_CALLS: JString read _GetKEY_IGNORE_DATA_ENABLED_CHANGED_FOR_VIDEO_CALLS;
    {class} property KEY_IGNORE_RTT_MODE_SETTING_BOOL: JString read _GetKEY_IGNORE_RTT_MODE_SETTING_BOOL;
    {class} property KEY_IGNORE_SIM_NETWORK_LOCKED_EVENTS_BOOL: JString read _GetKEY_IGNORE_SIM_NETWORK_LOCKED_EVENTS_BOOL;
    {class} property KEY_IMS_CONFERENCE_SIZE_LIMIT_INT: JString read _GetKEY_IMS_CONFERENCE_SIZE_LIMIT_INT;
    {class} property KEY_IMS_DTMF_TONE_DELAY_INT: JString read _GetKEY_IMS_DTMF_TONE_DELAY_INT;
    {class} property KEY_IS_IMS_CONFERENCE_SIZE_ENFORCED_BOOL: JString read _GetKEY_IS_IMS_CONFERENCE_SIZE_ENFORCED_BOOL;
    {class} property KEY_IS_OPPORTUNISTIC_SUBSCRIPTION_BOOL: JString read _GetKEY_IS_OPPORTUNISTIC_SUBSCRIPTION_BOOL;
    {class} property KEY_LTE_ENABLED_BOOL: JString read _GetKEY_LTE_ENABLED_BOOL;
    {class} property KEY_LTE_RSRQ_THRESHOLDS_INT_ARRAY: JString read _GetKEY_LTE_RSRQ_THRESHOLDS_INT_ARRAY;
    {class} property KEY_LTE_RSSNR_THRESHOLDS_INT_ARRAY: JString read _GetKEY_LTE_RSSNR_THRESHOLDS_INT_ARRAY;
    {class} property KEY_MDN_IS_ADDITIONAL_VOICEMAIL_NUMBER_BOOL: JString read _GetKEY_MDN_IS_ADDITIONAL_VOICEMAIL_NUMBER_BOOL;
    {class} property KEY_MMS_ALIAS_ENABLED_BOOL: JString read _GetKEY_MMS_ALIAS_ENABLED_BOOL;
    {class} property KEY_MMS_ALIAS_MAX_CHARS_INT: JString read _GetKEY_MMS_ALIAS_MAX_CHARS_INT;
    {class} property KEY_MMS_ALIAS_MIN_CHARS_INT: JString read _GetKEY_MMS_ALIAS_MIN_CHARS_INT;
    {class} property KEY_MMS_ALLOW_ATTACH_AUDIO_BOOL: JString read _GetKEY_MMS_ALLOW_ATTACH_AUDIO_BOOL;
    {class} property KEY_MMS_APPEND_TRANSACTION_ID_BOOL: JString read _GetKEY_MMS_APPEND_TRANSACTION_ID_BOOL;
    {class} property KEY_MMS_CLOSE_CONNECTION_BOOL: JString read _GetKEY_MMS_CLOSE_CONNECTION_BOOL;
    {class} property KEY_MMS_EMAIL_GATEWAY_NUMBER_STRING: JString read _GetKEY_MMS_EMAIL_GATEWAY_NUMBER_STRING;
    {class} property KEY_MMS_GROUP_MMS_ENABLED_BOOL: JString read _GetKEY_MMS_GROUP_MMS_ENABLED_BOOL;
    {class} property KEY_MMS_HTTP_PARAMS_STRING: JString read _GetKEY_MMS_HTTP_PARAMS_STRING;
    {class} property KEY_MMS_HTTP_SOCKET_TIMEOUT_INT: JString read _GetKEY_MMS_HTTP_SOCKET_TIMEOUT_INT;
    {class} property KEY_MMS_MAX_IMAGE_HEIGHT_INT: JString read _GetKEY_MMS_MAX_IMAGE_HEIGHT_INT;
    {class} property KEY_MMS_MAX_IMAGE_WIDTH_INT: JString read _GetKEY_MMS_MAX_IMAGE_WIDTH_INT;
    {class} property KEY_MMS_MAX_MESSAGE_SIZE_INT: JString read _GetKEY_MMS_MAX_MESSAGE_SIZE_INT;
    {class} property KEY_MMS_MESSAGE_TEXT_MAX_SIZE_INT: JString read _GetKEY_MMS_MESSAGE_TEXT_MAX_SIZE_INT;
    {class} property KEY_MMS_MMS_DELIVERY_REPORT_ENABLED_BOOL: JString read _GetKEY_MMS_MMS_DELIVERY_REPORT_ENABLED_BOOL;
    {class} property KEY_MMS_MMS_ENABLED_BOOL: JString read _GetKEY_MMS_MMS_ENABLED_BOOL;
    {class} property KEY_MMS_MMS_READ_REPORT_ENABLED_BOOL: JString read _GetKEY_MMS_MMS_READ_REPORT_ENABLED_BOOL;
    {class} property KEY_MMS_MULTIPART_SMS_ENABLED_BOOL: JString read _GetKEY_MMS_MULTIPART_SMS_ENABLED_BOOL;
    {class} property KEY_MMS_NAI_SUFFIX_STRING: JString read _GetKEY_MMS_NAI_SUFFIX_STRING;
    {class} property KEY_MMS_NOTIFY_WAP_MMSC_ENABLED_BOOL: JString read _GetKEY_MMS_NOTIFY_WAP_MMSC_ENABLED_BOOL;
    {class} property KEY_MMS_RECIPIENT_LIMIT_INT: JString read _GetKEY_MMS_RECIPIENT_LIMIT_INT;
    {class} property KEY_MMS_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES_BOOL: JString read _GetKEY_MMS_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES_BOOL;
    {class} property KEY_MMS_SHOW_CELL_BROADCAST_APP_LINKS_BOOL: JString read _GetKEY_MMS_SHOW_CELL_BROADCAST_APP_LINKS_BOOL;
    {class} property KEY_MMS_SMS_DELIVERY_REPORT_ENABLED_BOOL: JString read _GetKEY_MMS_SMS_DELIVERY_REPORT_ENABLED_BOOL;
    {class} property KEY_MMS_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD_INT: JString read _GetKEY_MMS_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD_INT;
    {class} property KEY_MMS_SMS_TO_MMS_TEXT_THRESHOLD_INT: JString read _GetKEY_MMS_SMS_TO_MMS_TEXT_THRESHOLD_INT;
    {class} property KEY_MMS_SUBJECT_MAX_LENGTH_INT: JString read _GetKEY_MMS_SUBJECT_MAX_LENGTH_INT;
    {class} property KEY_MMS_SUPPORT_HTTP_CHARSET_HEADER_BOOL: JString read _GetKEY_MMS_SUPPORT_HTTP_CHARSET_HEADER_BOOL;
    {class} property KEY_MMS_SUPPORT_MMS_CONTENT_DISPOSITION_BOOL: JString read _GetKEY_MMS_SUPPORT_MMS_CONTENT_DISPOSITION_BOOL;
    {class} property KEY_MMS_UA_PROF_TAG_NAME_STRING: JString read _GetKEY_MMS_UA_PROF_TAG_NAME_STRING;
    {class} property KEY_MMS_UA_PROF_URL_STRING: JString read _GetKEY_MMS_UA_PROF_URL_STRING;
    {class} property KEY_MMS_USER_AGENT_STRING: JString read _GetKEY_MMS_USER_AGENT_STRING;
    {class} property KEY_MONTHLY_DATA_CYCLE_DAY_INT: JString read _GetKEY_MONTHLY_DATA_CYCLE_DAY_INT;
    {class} property KEY_ONLY_AUTO_SELECT_IN_HOME_NETWORK_BOOL: JString read _GetKEY_ONLY_AUTO_SELECT_IN_HOME_NETWORK_BOOL;
    {class} property KEY_ONLY_SINGLE_DC_ALLOWED_INT_ARRAY: JString read _GetKEY_ONLY_SINGLE_DC_ALLOWED_INT_ARRAY;
    {class} property KEY_OPERATOR_SELECTION_EXPAND_BOOL: JString read _GetKEY_OPERATOR_SELECTION_EXPAND_BOOL;
    {class} property KEY_OPPORTUNISTIC_NETWORK_BACKOFF_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_BACKOFF_TIME_LONG;
    {class} property KEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_EXIT_HYSTERESIS_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_EXIT_HYSTERESIS_TIME_LONG;
    {class} property KEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_HYSTERESIS_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_DATA_SWITCH_HYSTERESIS_TIME_LONG;
    {class} property KEY_OPPORTUNISTIC_NETWORK_ENTRY_OR_EXIT_HYSTERESIS_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_OR_EXIT_HYSTERESIS_TIME_LONG;
    {class} property KEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_BANDWIDTH_INT: JString read _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_BANDWIDTH_INT;
    {class} property KEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSRP_INT: JString read _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSRP_INT;
    {class} property KEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSSNR_INT: JString read _GetKEY_OPPORTUNISTIC_NETWORK_ENTRY_THRESHOLD_RSSNR_INT;
    {class} property KEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSRP_INT: JString read _GetKEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSRP_INT;
    {class} property KEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSSNR_INT: JString read _GetKEY_OPPORTUNISTIC_NETWORK_EXIT_THRESHOLD_RSSNR_INT;
    {class} property KEY_OPPORTUNISTIC_NETWORK_MAX_BACKOFF_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_MAX_BACKOFF_TIME_LONG;
    {class} property KEY_OPPORTUNISTIC_NETWORK_PING_PONG_TIME_LONG: JString read _GetKEY_OPPORTUNISTIC_NETWORK_PING_PONG_TIME_LONG;
    {class} property KEY_PING_TEST_BEFORE_DATA_SWITCH_BOOL: JString read _GetKEY_PING_TEST_BEFORE_DATA_SWITCH_BOOL;
    {class} property KEY_PREFER_2G_BOOL: JString read _GetKEY_PREFER_2G_BOOL;
    {class} property KEY_PREVENT_CLIR_ACTIVATION_AND_DEACTIVATION_CODE_BOOL: JString read _GetKEY_PREVENT_CLIR_ACTIVATION_AND_DEACTIVATION_CODE_BOOL;
    {class} property KEY_RADIO_RESTART_FAILURE_CAUSES_INT_ARRAY: JString read _GetKEY_RADIO_RESTART_FAILURE_CAUSES_INT_ARRAY;
    {class} property KEY_RCS_CONFIG_SERVER_URL_STRING: JString read _GetKEY_RCS_CONFIG_SERVER_URL_STRING;
    {class} property KEY_READ_ONLY_APN_FIELDS_STRING_ARRAY: JString read _GetKEY_READ_ONLY_APN_FIELDS_STRING_ARRAY;
    {class} property KEY_READ_ONLY_APN_TYPES_STRING_ARRAY: JString read _GetKEY_READ_ONLY_APN_TYPES_STRING_ARRAY;
    {class} property KEY_REQUIRE_ENTITLEMENT_CHECKS_BOOL: JString read _GetKEY_REQUIRE_ENTITLEMENT_CHECKS_BOOL;
    {class} property KEY_RESTART_RADIO_ON_PDP_FAIL_REGULAR_DEACTIVATION_BOOL: JString read _GetKEY_RESTART_RADIO_ON_PDP_FAIL_REGULAR_DEACTIVATION_BOOL;
    {class} property KEY_RTT_AUTO_UPGRADE_BOOL: JString read _GetKEY_RTT_AUTO_UPGRADE_BOOL;
    {class} property KEY_RTT_DOWNGRADE_SUPPORTED_BOOL: JString read _GetKEY_RTT_DOWNGRADE_SUPPORTED_BOOL;
    {class} property KEY_RTT_SUPPORTED_BOOL: JString read _GetKEY_RTT_SUPPORTED_BOOL;
    {class} property KEY_RTT_SUPPORTED_FOR_VT_BOOL: JString read _GetKEY_RTT_SUPPORTED_FOR_VT_BOOL;
    {class} property KEY_RTT_SUPPORTED_WHILE_ROAMING_BOOL: JString read _GetKEY_RTT_SUPPORTED_WHILE_ROAMING_BOOL;
    {class} property KEY_RTT_UPGRADE_SUPPORTED_BOOL: JString read _GetKEY_RTT_UPGRADE_SUPPORTED_BOOL;
    {class} property KEY_RTT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_VT_CALL_BOOL: JString read _GetKEY_RTT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_VT_CALL_BOOL;
    {class} property KEY_SHOW_4G_FOR_3G_DATA_ICON_BOOL: JString read _GetKEY_SHOW_4G_FOR_3G_DATA_ICON_BOOL;
    {class} property KEY_SHOW_4G_FOR_LTE_DATA_ICON_BOOL: JString read _GetKEY_SHOW_4G_FOR_LTE_DATA_ICON_BOOL;
    {class} property KEY_SHOW_APN_SETTING_CDMA_BOOL: JString read _GetKEY_SHOW_APN_SETTING_CDMA_BOOL;
    {class} property KEY_SHOW_BLOCKING_PAY_PHONE_OPTION_BOOL: JString read _GetKEY_SHOW_BLOCKING_PAY_PHONE_OPTION_BOOL;
    {class} property KEY_SHOW_CALL_BLOCKING_DISABLED_NOTIFICATION_ALWAYS_BOOL: JString read _GetKEY_SHOW_CALL_BLOCKING_DISABLED_NOTIFICATION_ALWAYS_BOOL;
    {class} property KEY_SHOW_CDMA_CHOICES_BOOL: JString read _GetKEY_SHOW_CDMA_CHOICES_BOOL;
    {class} property KEY_SHOW_FORWARDED_NUMBER_BOOL: JString read _GetKEY_SHOW_FORWARDED_NUMBER_BOOL;
    {class} property KEY_SHOW_ICCID_IN_SIM_STATUS_BOOL: JString read _GetKEY_SHOW_ICCID_IN_SIM_STATUS_BOOL;
    {class} property KEY_SHOW_IMS_REGISTRATION_STATUS_BOOL: JString read _GetKEY_SHOW_IMS_REGISTRATION_STATUS_BOOL;
    {class} property KEY_SHOW_ONSCREEN_DIAL_BUTTON_BOOL: JString read _GetKEY_SHOW_ONSCREEN_DIAL_BUTTON_BOOL;
    {class} property KEY_SHOW_SIGNAL_STRENGTH_IN_SIM_STATUS_BOOL: JString read _GetKEY_SHOW_SIGNAL_STRENGTH_IN_SIM_STATUS_BOOL;
    {class} property KEY_SHOW_VIDEO_CALL_CHARGES_ALERT_DIALOG_BOOL: JString read _GetKEY_SHOW_VIDEO_CALL_CHARGES_ALERT_DIALOG_BOOL;
    {class} property KEY_SHOW_WFC_LOCATION_PRIVACY_POLICY_BOOL: JString read _GetKEY_SHOW_WFC_LOCATION_PRIVACY_POLICY_BOOL;
    {class} property KEY_SIMPLIFIED_NETWORK_SETTINGS_BOOL: JString read _GetKEY_SIMPLIFIED_NETWORK_SETTINGS_BOOL;
    {class} property KEY_SIM_NETWORK_UNLOCK_ALLOW_DISMISS_BOOL: JString read _GetKEY_SIM_NETWORK_UNLOCK_ALLOW_DISMISS_BOOL;
    {class} property KEY_SMDP_SERVER_ADDRESS_STRING: JString read _GetKEY_SMDP_SERVER_ADDRESS_STRING;
    {class} property KEY_SMS_REQUIRES_DESTINATION_NUMBER_CONVERSION_BOOL: JString read _GetKEY_SMS_REQUIRES_DESTINATION_NUMBER_CONVERSION_BOOL;
    {class} property KEY_SUBSCRIPTION_GROUP_UUID_STRING: JString read _GetKEY_SUBSCRIPTION_GROUP_UUID_STRING;
    {class} property KEY_SUPPORTS_CALL_COMPOSER_BOOL: JString read _GetKEY_SUPPORTS_CALL_COMPOSER_BOOL;
    {class} property KEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_DTMF_BOOL: JString read _GetKEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_DTMF_BOOL;
    {class} property KEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_RTP_BOOL: JString read _GetKEY_SUPPORTS_DEVICE_TO_DEVICE_COMMUNICATION_USING_RTP_BOOL;
    {class} property KEY_SUPPORTS_SDP_NEGOTIATION_OF_D2D_RTP_HEADER_EXTENSIONS_BOOL: JString read _GetKEY_SUPPORTS_SDP_NEGOTIATION_OF_D2D_RTP_HEADER_EXTENSIONS_BOOL;
    {class} property KEY_SUPPORT_3GPP_CALL_FORWARDING_WHILE_ROAMING_BOOL: JString read _GetKEY_SUPPORT_3GPP_CALL_FORWARDING_WHILE_ROAMING_BOOL;
    {class} property KEY_SUPPORT_ADD_CONFERENCE_PARTICIPANTS_BOOL: JString read _GetKEY_SUPPORT_ADD_CONFERENCE_PARTICIPANTS_BOOL;
    {class} property KEY_SUPPORT_ADHOC_CONFERENCE_CALLS_BOOL: JString read _GetKEY_SUPPORT_ADHOC_CONFERENCE_CALLS_BOOL;
    {class} property KEY_SUPPORT_CLIR_NETWORK_DEFAULT_BOOL: JString read _GetKEY_SUPPORT_CLIR_NETWORK_DEFAULT_BOOL;
    {class} property KEY_SUPPORT_CONFERENCE_CALL_BOOL: JString read _GetKEY_SUPPORT_CONFERENCE_CALL_BOOL;
    {class} property KEY_SUPPORT_EMERGENCY_SMS_OVER_IMS_BOOL: JString read _GetKEY_SUPPORT_EMERGENCY_SMS_OVER_IMS_BOOL;
    {class} property KEY_SUPPORT_ENHANCED_CALL_BLOCKING_BOOL: JString read _GetKEY_SUPPORT_ENHANCED_CALL_BLOCKING_BOOL;
    {class} property KEY_SUPPORT_IMS_CONFERENCE_EVENT_PACKAGE_BOOL: JString read _GetKEY_SUPPORT_IMS_CONFERENCE_EVENT_PACKAGE_BOOL;
    {class} property KEY_SUPPORT_PAUSE_IMS_VIDEO_CALLS_BOOL: JString read _GetKEY_SUPPORT_PAUSE_IMS_VIDEO_CALLS_BOOL;
    {class} property KEY_SUPPORT_SWAP_AFTER_MERGE_BOOL: JString read _GetKEY_SUPPORT_SWAP_AFTER_MERGE_BOOL;
    {class} property KEY_SUPPORT_TDSCDMA_BOOL: JString read _GetKEY_SUPPORT_TDSCDMA_BOOL;
    {class} property KEY_SUPPORT_TDSCDMA_ROAMING_NETWORKS_STRING_ARRAY: JString read _GetKEY_SUPPORT_TDSCDMA_ROAMING_NETWORKS_STRING_ARRAY;
    {class} property KEY_SWITCH_DATA_TO_PRIMARY_IF_PRIMARY_IS_OOS_BOOL: JString read _GetKEY_SWITCH_DATA_TO_PRIMARY_IF_PRIMARY_IS_OOS_BOOL;
    {class} property KEY_TREAT_DOWNGRADED_VIDEO_CALLS_AS_VIDEO_CALLS_BOOL: JString read _GetKEY_TREAT_DOWNGRADED_VIDEO_CALLS_AS_VIDEO_CALLS_BOOL;
    {class} property KEY_TTY_SUPPORTED_BOOL: JString read _GetKEY_TTY_SUPPORTED_BOOL;
    {class} property KEY_UNLOGGABLE_NUMBERS_STRING_ARRAY: JString read _GetKEY_UNLOGGABLE_NUMBERS_STRING_ARRAY;
    {class} property KEY_USE_ACS_FOR_RCS_BOOL: JString read _GetKEY_USE_ACS_FOR_RCS_BOOL;
    {class} property KEY_USE_HFA_FOR_PROVISIONING_BOOL: JString read _GetKEY_USE_HFA_FOR_PROVISIONING_BOOL;
    {class} property KEY_USE_IP_FOR_CALLING_INDICATOR_BOOL: JString read _GetKEY_USE_IP_FOR_CALLING_INDICATOR_BOOL;
    {class} property KEY_USE_OTASP_FOR_PROVISIONING_BOOL: JString read _GetKEY_USE_OTASP_FOR_PROVISIONING_BOOL;
    {class} property KEY_USE_RCS_PRESENCE_BOOL: JString read _GetKEY_USE_RCS_PRESENCE_BOOL;
    {class} property KEY_USE_RCS_SIP_OPTIONS_BOOL: JString read _GetKEY_USE_RCS_SIP_OPTIONS_BOOL;
    {class} property KEY_USE_WFC_HOME_NETWORK_MODE_IN_ROAMING_NETWORK_BOOL: JString read _GetKEY_USE_WFC_HOME_NETWORK_MODE_IN_ROAMING_NETWORK_BOOL;
    {class} property KEY_VOICEMAIL_NOTIFICATION_PERSISTENT_BOOL: JString read _GetKEY_VOICEMAIL_NOTIFICATION_PERSISTENT_BOOL;
    {class} property KEY_VOICE_PRIVACY_DISABLE_UI_BOOL: JString read _GetKEY_VOICE_PRIVACY_DISABLE_UI_BOOL;
    {class} property KEY_VOLTE_REPLACEMENT_RAT_INT: JString read _GetKEY_VOLTE_REPLACEMENT_RAT_INT;
    {class} property KEY_VT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_RTT_CALL_BOOL: JString read _GetKEY_VT_UPGRADE_SUPPORTED_FOR_DOWNGRADED_RTT_CALL_BOOL;
    {class} property KEY_VVM_CELLULAR_DATA_REQUIRED_BOOL: JString read _GetKEY_VVM_CELLULAR_DATA_REQUIRED_BOOL;
    {class} property KEY_VVM_CLIENT_PREFIX_STRING: JString read _GetKEY_VVM_CLIENT_PREFIX_STRING;
    {class} property KEY_VVM_DESTINATION_NUMBER_STRING: JString read _GetKEY_VVM_DESTINATION_NUMBER_STRING;
    {class} property KEY_VVM_DISABLED_CAPABILITIES_STRING_ARRAY: JString read _GetKEY_VVM_DISABLED_CAPABILITIES_STRING_ARRAY;
    {class} property KEY_VVM_LEGACY_MODE_ENABLED_BOOL: JString read _GetKEY_VVM_LEGACY_MODE_ENABLED_BOOL;
    {class} property KEY_VVM_PORT_NUMBER_INT: JString read _GetKEY_VVM_PORT_NUMBER_INT;
    {class} property KEY_VVM_PREFETCH_BOOL: JString read _GetKEY_VVM_PREFETCH_BOOL;
    {class} property KEY_VVM_SSL_ENABLED_BOOL: JString read _GetKEY_VVM_SSL_ENABLED_BOOL;
    {class} property KEY_VVM_TYPE_STRING: JString read _GetKEY_VVM_TYPE_STRING;
    {class} property KEY_WFC_EMERGENCY_ADDRESS_CARRIER_APP_STRING: JString read _GetKEY_WFC_EMERGENCY_ADDRESS_CARRIER_APP_STRING;
    {class} property KEY_WORLD_MODE_ENABLED_BOOL: JString read _GetKEY_WORLD_MODE_ENABLED_BOOL;
    {class} property KEY_WORLD_PHONE_BOOL: JString read _GetKEY_WORLD_PHONE_BOOL;
    {class} property REMOVE_GROUP_UUID_STRING: JString read _GetREMOVE_GROUP_UUID_STRING;
    {class} property SERVICE_CLASS_NONE: Integer read _GetSERVICE_CLASS_NONE;
    {class} property SERVICE_CLASS_VOICE: Integer read _GetSERVICE_CLASS_VOICE;
    {class} property USSD_OVER_CS_ONLY: Integer read _GetUSSD_OVER_CS_ONLY;
    {class} property USSD_OVER_CS_PREFERRED: Integer read _GetUSSD_OVER_CS_PREFERRED;
    {class} property USSD_OVER_IMS_ONLY: Integer read _GetUSSD_OVER_IMS_ONLY;
    {class} property USSD_OVER_IMS_PREFERRED: Integer read _GetUSSD_OVER_IMS_PREFERRED;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager')]
  JCarrierConfigManager = interface(JObject)
    ['{11F40FA1-334D-4683-9D44-7A888F2661B8}']
    function getConfig: JPersistableBundle; cdecl;
    function getConfigByComponentForSubId(prefix: JString; subId: Integer): JPersistableBundle; cdecl;
    function getConfigForSubId(subId: Integer): JPersistableBundle; cdecl;
    procedure notifyConfigChangedForSubId(subId: Integer); cdecl;
  end;
  TJCarrierConfigManager = class(TJavaGenericImport<JCarrierConfigManagerClass, JCarrierConfigManager>) end;

  JCarrierConfigManager_ApnClass = interface(JObjectClass)
    ['{08C59427-8936-45A3-A4FC-378FF9FF134A}']
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_SETTINGS_DEFAULT_PROTOCOL_STRING: JString; cdecl;
    {class} function _GetKEY_SETTINGS_DEFAULT_ROAMING_PROTOCOL_STRING: JString; cdecl;
    {class} function _GetPROTOCOL_IPV4: JString; cdecl;
    {class} function _GetPROTOCOL_IPV4V6: JString; cdecl;
    {class} function _GetPROTOCOL_IPV6: JString; cdecl;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_SETTINGS_DEFAULT_PROTOCOL_STRING: JString read _GetKEY_SETTINGS_DEFAULT_PROTOCOL_STRING;
    {class} property KEY_SETTINGS_DEFAULT_ROAMING_PROTOCOL_STRING: JString read _GetKEY_SETTINGS_DEFAULT_ROAMING_PROTOCOL_STRING;
    {class} property PROTOCOL_IPV4: JString read _GetPROTOCOL_IPV4;
    {class} property PROTOCOL_IPV4V6: JString read _GetPROTOCOL_IPV4V6;
    {class} property PROTOCOL_IPV6: JString read _GetPROTOCOL_IPV6;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$Apn')]
  JCarrierConfigManager_Apn = interface(JObject)
    ['{CD9FF1ED-0A80-4F4B-944C-9D1449200DD2}']
  end;
  TJCarrierConfigManager_Apn = class(TJavaGenericImport<JCarrierConfigManager_ApnClass, JCarrierConfigManager_Apn>) end;

  JCarrierConfigManager_BsfClass = interface(JObjectClass)
    ['{F6861B66-D903-45C5-A4EB-DE6FC0A104A6}']
    {class} function _GetKEY_BSF_SERVER_FQDN_STRING: JString; cdecl;
    {class} function _GetKEY_BSF_SERVER_PORT_INT: JString; cdecl;
    {class} function _GetKEY_BSF_TRANSPORT_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} property KEY_BSF_SERVER_FQDN_STRING: JString read _GetKEY_BSF_SERVER_FQDN_STRING;
    {class} property KEY_BSF_SERVER_PORT_INT: JString read _GetKEY_BSF_SERVER_PORT_INT;
    {class} property KEY_BSF_TRANSPORT_TYPE_INT: JString read _GetKEY_BSF_TRANSPORT_TYPE_INT;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$Bsf')]
  JCarrierConfigManager_Bsf = interface(JObject)
    ['{6AF733F8-F342-4DC5-AFC7-3FD1BFC2049E}']
  end;
  TJCarrierConfigManager_Bsf = class(TJavaGenericImport<JCarrierConfigManager_BsfClass, JCarrierConfigManager_Bsf>) end;

  JCarrierConfigManager_GpsClass = interface(JObjectClass)
    ['{D1231894-AA1A-47EA-BC55-635B58E513A6}']
    {class} function _GetKEY_PERSIST_LPP_MODE_BOOL: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} property KEY_PERSIST_LPP_MODE_BOOL: JString read _GetKEY_PERSIST_LPP_MODE_BOOL;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$Gps')]
  JCarrierConfigManager_Gps = interface(JObject)
    ['{34D86FC6-7F51-4B60-89CC-1F7305412984}']
  end;
  TJCarrierConfigManager_Gps = class(TJavaGenericImport<JCarrierConfigManager_GpsClass, JCarrierConfigManager_Gps>) end;

  JCarrierConfigManager_ImsClass = interface(JObjectClass)
    ['{3C3E63E7-7777-4CA1-9B86-392C0FD19300}']
    {class} function _GetE911_RTCP_INACTIVITY_ON_CONNECTED: Integer; cdecl;
    {class} function _GetE911_RTP_INACTIVITY_ON_CONNECTED: Integer; cdecl;
    {class} function _GetGEOLOCATION_PIDF_FOR_EMERGENCY_ON_CELLULAR: Integer; cdecl;
    {class} function _GetGEOLOCATION_PIDF_FOR_EMERGENCY_ON_WIFI: Integer; cdecl;
    {class} function _GetGEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_CELLULAR: Integer; cdecl;
    {class} function _GetGEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_WIFI: Integer; cdecl;
    {class} function _GetIPSEC_AUTHENTICATION_ALGORITHM_HMAC_MD5: Integer; cdecl;
    {class} function _GetIPSEC_AUTHENTICATION_ALGORITHM_HMAC_SHA1: Integer; cdecl;
    {class} function _GetIPSEC_ENCRYPTION_ALGORITHM_AES_CBC: Integer; cdecl;
    {class} function _GetIPSEC_ENCRYPTION_ALGORITHM_DES_EDE3_CBC: Integer; cdecl;
    {class} function _GetIPSEC_ENCRYPTION_ALGORITHM_NULL: Integer; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_CALL_COMPOSER_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_OPTIONS_UCE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_PRESENCE_UCE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_SMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_UT_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_VIDEO_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CAPABILITY_TYPE_VOICE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_ENABLE_PRESENCE_CAPABILITY_EXCHANGE_BOOL: JString; cdecl;
    {class} function _GetKEY_ENABLE_PRESENCE_GROUP_SUBSCRIBE_BOOL: JString; cdecl;
    {class} function _GetKEY_ENABLE_PRESENCE_PUBLISH_BOOL: JString; cdecl;
    {class} function _GetKEY_GEOLOCATION_PIDF_IN_SIP_INVITE_SUPPORT_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_GEOLOCATION_PIDF_IN_SIP_REGISTER_SUPPORT_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_GRUU_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_IMS_PDN_ENABLED_IN_NO_VOPS_SUPPORT_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_IMS_SINGLE_REGISTRATION_REQUIRED_BOOL: JString; cdecl;
    {class} function _GetKEY_IMS_USER_AGENT_STRING: JString; cdecl;
    {class} function _GetKEY_IPSEC_AUTHENTICATION_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_IPSEC_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_IPV4_SIP_MTU_SIZE_CELLULAR_INT: JString; cdecl;
    {class} function _GetKEY_IPV6_SIP_MTU_SIZE_CELLULAR_INT: JString; cdecl;
    {class} function _GetKEY_KEEP_PDN_UP_IN_NO_VOPS_BOOL: JString; cdecl;
    {class} function _GetKEY_MMTEL_REQUIRES_PROVISIONING_BUNDLE: JString; cdecl;
    {class} function _GetKEY_NON_RCS_CAPABILITIES_CACHE_EXPIRATION_SEC_INT: JString; cdecl;
    {class} function _GetKEY_PHONE_CONTEXT_DOMAIN_NAME_STRING: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_RCS_BULK_CAPABILITY_EXCHANGE_BOOL: JString; cdecl;
    {class} function _GetKEY_RCS_FEATURE_TAG_ALLOWED_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_RCS_REQUIRES_PROVISIONING_BUNDLE: JString; cdecl;
    {class} function _GetKEY_REGISTRATION_EVENT_PACKAGE_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_REGISTRATION_EXPIRY_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_REGISTRATION_RETRY_BASE_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_REGISTRATION_RETRY_MAX_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_REGISTRATION_SUBSCRIBE_EXPIRY_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_REQUEST_URI_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_SIP_OVER_IPSEC_ENABLED_BOOL: JString; cdecl;
    {class} function _GetKEY_SIP_PREFERRED_TRANSPORT_INT: JString; cdecl;
    {class} function _GetKEY_SIP_SERVER_PORT_NUMBER_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_B_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_C_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_D_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_F_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_H_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_J_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_T1_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_T2_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SIP_TIMER_T4_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SUPPORTED_RATS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_USE_SIP_URI_FOR_PRESENCE_SUBSCRIBE_BOOL: JString; cdecl;
    {class} function _GetKEY_WIFI_OFF_DEFERRING_TIME_MILLIS_INT: JString; cdecl;
    {class} function _GetNETWORK_TYPE_HOME: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_ROAMING: Integer; cdecl;
    {class} function _GetPREFERRED_TRANSPORT_DYNAMIC_UDP_TCP: Integer; cdecl;
    {class} function _GetPREFERRED_TRANSPORT_TCP: Integer; cdecl;
    {class} function _GetPREFERRED_TRANSPORT_TLS: Integer; cdecl;
    {class} function _GetPREFERRED_TRANSPORT_UDP: Integer; cdecl;
    {class} function _GetREQUEST_URI_FORMAT_SIP: Integer; cdecl;
    {class} function _GetREQUEST_URI_FORMAT_TEL: Integer; cdecl;
    {class} function _GetRTCP_INACTIVITY_ON_CONNECTED: Integer; cdecl;
    {class} function _GetRTCP_INACTIVITY_ON_HOLD: Integer; cdecl;
    {class} function _GetRTP_INACTIVITY_ON_CONNECTED: Integer; cdecl;
    {class} property E911_RTCP_INACTIVITY_ON_CONNECTED: Integer read _GetE911_RTCP_INACTIVITY_ON_CONNECTED;
    {class} property E911_RTP_INACTIVITY_ON_CONNECTED: Integer read _GetE911_RTP_INACTIVITY_ON_CONNECTED;
    {class} property GEOLOCATION_PIDF_FOR_EMERGENCY_ON_CELLULAR: Integer read _GetGEOLOCATION_PIDF_FOR_EMERGENCY_ON_CELLULAR;
    {class} property GEOLOCATION_PIDF_FOR_EMERGENCY_ON_WIFI: Integer read _GetGEOLOCATION_PIDF_FOR_EMERGENCY_ON_WIFI;
    {class} property GEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_CELLULAR: Integer read _GetGEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_CELLULAR;
    {class} property GEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_WIFI: Integer read _GetGEOLOCATION_PIDF_FOR_NON_EMERGENCY_ON_WIFI;
    {class} property IPSEC_AUTHENTICATION_ALGORITHM_HMAC_MD5: Integer read _GetIPSEC_AUTHENTICATION_ALGORITHM_HMAC_MD5;
    {class} property IPSEC_AUTHENTICATION_ALGORITHM_HMAC_SHA1: Integer read _GetIPSEC_AUTHENTICATION_ALGORITHM_HMAC_SHA1;
    {class} property IPSEC_ENCRYPTION_ALGORITHM_AES_CBC: Integer read _GetIPSEC_ENCRYPTION_ALGORITHM_AES_CBC;
    {class} property IPSEC_ENCRYPTION_ALGORITHM_DES_EDE3_CBC: Integer read _GetIPSEC_ENCRYPTION_ALGORITHM_DES_EDE3_CBC;
    {class} property IPSEC_ENCRYPTION_ALGORITHM_NULL: Integer read _GetIPSEC_ENCRYPTION_ALGORITHM_NULL;
    {class} property KEY_CAPABILITY_TYPE_CALL_COMPOSER_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_CALL_COMPOSER_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_OPTIONS_UCE_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_OPTIONS_UCE_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_PRESENCE_UCE_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_PRESENCE_UCE_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_SMS_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_SMS_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_UT_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_UT_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_VIDEO_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_VIDEO_INT_ARRAY;
    {class} property KEY_CAPABILITY_TYPE_VOICE_INT_ARRAY: JString read _GetKEY_CAPABILITY_TYPE_VOICE_INT_ARRAY;
    {class} property KEY_ENABLE_PRESENCE_CAPABILITY_EXCHANGE_BOOL: JString read _GetKEY_ENABLE_PRESENCE_CAPABILITY_EXCHANGE_BOOL;
    {class} property KEY_ENABLE_PRESENCE_GROUP_SUBSCRIBE_BOOL: JString read _GetKEY_ENABLE_PRESENCE_GROUP_SUBSCRIBE_BOOL;
    {class} property KEY_ENABLE_PRESENCE_PUBLISH_BOOL: JString read _GetKEY_ENABLE_PRESENCE_PUBLISH_BOOL;
    {class} property KEY_GEOLOCATION_PIDF_IN_SIP_INVITE_SUPPORT_INT_ARRAY: JString read _GetKEY_GEOLOCATION_PIDF_IN_SIP_INVITE_SUPPORT_INT_ARRAY;
    {class} property KEY_GEOLOCATION_PIDF_IN_SIP_REGISTER_SUPPORT_INT_ARRAY: JString read _GetKEY_GEOLOCATION_PIDF_IN_SIP_REGISTER_SUPPORT_INT_ARRAY;
    {class} property KEY_GRUU_ENABLED_BOOL: JString read _GetKEY_GRUU_ENABLED_BOOL;
    {class} property KEY_IMS_PDN_ENABLED_IN_NO_VOPS_SUPPORT_INT_ARRAY: JString read _GetKEY_IMS_PDN_ENABLED_IN_NO_VOPS_SUPPORT_INT_ARRAY;
    {class} property KEY_IMS_SINGLE_REGISTRATION_REQUIRED_BOOL: JString read _GetKEY_IMS_SINGLE_REGISTRATION_REQUIRED_BOOL;
    {class} property KEY_IMS_USER_AGENT_STRING: JString read _GetKEY_IMS_USER_AGENT_STRING;
    {class} property KEY_IPSEC_AUTHENTICATION_ALGORITHMS_INT_ARRAY: JString read _GetKEY_IPSEC_AUTHENTICATION_ALGORITHMS_INT_ARRAY;
    {class} property KEY_IPSEC_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString read _GetKEY_IPSEC_ENCRYPTION_ALGORITHMS_INT_ARRAY;
    {class} property KEY_IPV4_SIP_MTU_SIZE_CELLULAR_INT: JString read _GetKEY_IPV4_SIP_MTU_SIZE_CELLULAR_INT;
    {class} property KEY_IPV6_SIP_MTU_SIZE_CELLULAR_INT: JString read _GetKEY_IPV6_SIP_MTU_SIZE_CELLULAR_INT;
    {class} property KEY_KEEP_PDN_UP_IN_NO_VOPS_BOOL: JString read _GetKEY_KEEP_PDN_UP_IN_NO_VOPS_BOOL;
    {class} property KEY_MMTEL_REQUIRES_PROVISIONING_BUNDLE: JString read _GetKEY_MMTEL_REQUIRES_PROVISIONING_BUNDLE;
    {class} property KEY_NON_RCS_CAPABILITIES_CACHE_EXPIRATION_SEC_INT: JString read _GetKEY_NON_RCS_CAPABILITIES_CACHE_EXPIRATION_SEC_INT;
    {class} property KEY_PHONE_CONTEXT_DOMAIN_NAME_STRING: JString read _GetKEY_PHONE_CONTEXT_DOMAIN_NAME_STRING;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_RCS_BULK_CAPABILITY_EXCHANGE_BOOL: JString read _GetKEY_RCS_BULK_CAPABILITY_EXCHANGE_BOOL;
    {class} property KEY_RCS_FEATURE_TAG_ALLOWED_STRING_ARRAY: JString read _GetKEY_RCS_FEATURE_TAG_ALLOWED_STRING_ARRAY;
    {class} property KEY_RCS_REQUIRES_PROVISIONING_BUNDLE: JString read _GetKEY_RCS_REQUIRES_PROVISIONING_BUNDLE;
    {class} property KEY_REGISTRATION_EVENT_PACKAGE_SUPPORTED_BOOL: JString read _GetKEY_REGISTRATION_EVENT_PACKAGE_SUPPORTED_BOOL;
    {class} property KEY_REGISTRATION_EXPIRY_TIMER_SEC_INT: JString read _GetKEY_REGISTRATION_EXPIRY_TIMER_SEC_INT;
    {class} property KEY_REGISTRATION_RETRY_BASE_TIMER_MILLIS_INT: JString read _GetKEY_REGISTRATION_RETRY_BASE_TIMER_MILLIS_INT;
    {class} property KEY_REGISTRATION_RETRY_MAX_TIMER_MILLIS_INT: JString read _GetKEY_REGISTRATION_RETRY_MAX_TIMER_MILLIS_INT;
    {class} property KEY_REGISTRATION_SUBSCRIBE_EXPIRY_TIMER_SEC_INT: JString read _GetKEY_REGISTRATION_SUBSCRIBE_EXPIRY_TIMER_SEC_INT;
    {class} property KEY_REQUEST_URI_TYPE_INT: JString read _GetKEY_REQUEST_URI_TYPE_INT;
    {class} property KEY_SIP_OVER_IPSEC_ENABLED_BOOL: JString read _GetKEY_SIP_OVER_IPSEC_ENABLED_BOOL;
    {class} property KEY_SIP_PREFERRED_TRANSPORT_INT: JString read _GetKEY_SIP_PREFERRED_TRANSPORT_INT;
    {class} property KEY_SIP_SERVER_PORT_NUMBER_INT: JString read _GetKEY_SIP_SERVER_PORT_NUMBER_INT;
    {class} property KEY_SIP_TIMER_B_MILLIS_INT: JString read _GetKEY_SIP_TIMER_B_MILLIS_INT;
    {class} property KEY_SIP_TIMER_C_MILLIS_INT: JString read _GetKEY_SIP_TIMER_C_MILLIS_INT;
    {class} property KEY_SIP_TIMER_D_MILLIS_INT: JString read _GetKEY_SIP_TIMER_D_MILLIS_INT;
    {class} property KEY_SIP_TIMER_F_MILLIS_INT: JString read _GetKEY_SIP_TIMER_F_MILLIS_INT;
    {class} property KEY_SIP_TIMER_H_MILLIS_INT: JString read _GetKEY_SIP_TIMER_H_MILLIS_INT;
    {class} property KEY_SIP_TIMER_J_MILLIS_INT: JString read _GetKEY_SIP_TIMER_J_MILLIS_INT;
    {class} property KEY_SIP_TIMER_T1_MILLIS_INT: JString read _GetKEY_SIP_TIMER_T1_MILLIS_INT;
    {class} property KEY_SIP_TIMER_T2_MILLIS_INT: JString read _GetKEY_SIP_TIMER_T2_MILLIS_INT;
    {class} property KEY_SIP_TIMER_T4_MILLIS_INT: JString read _GetKEY_SIP_TIMER_T4_MILLIS_INT;
    {class} property KEY_SUPPORTED_RATS_INT_ARRAY: JString read _GetKEY_SUPPORTED_RATS_INT_ARRAY;
    {class} property KEY_USE_SIP_URI_FOR_PRESENCE_SUBSCRIBE_BOOL: JString read _GetKEY_USE_SIP_URI_FOR_PRESENCE_SUBSCRIBE_BOOL;
    {class} property KEY_WIFI_OFF_DEFERRING_TIME_MILLIS_INT: JString read _GetKEY_WIFI_OFF_DEFERRING_TIME_MILLIS_INT;
    {class} property NETWORK_TYPE_HOME: Integer read _GetNETWORK_TYPE_HOME;
    {class} property NETWORK_TYPE_ROAMING: Integer read _GetNETWORK_TYPE_ROAMING;
    {class} property PREFERRED_TRANSPORT_DYNAMIC_UDP_TCP: Integer read _GetPREFERRED_TRANSPORT_DYNAMIC_UDP_TCP;
    {class} property PREFERRED_TRANSPORT_TCP: Integer read _GetPREFERRED_TRANSPORT_TCP;
    {class} property PREFERRED_TRANSPORT_TLS: Integer read _GetPREFERRED_TRANSPORT_TLS;
    {class} property PREFERRED_TRANSPORT_UDP: Integer read _GetPREFERRED_TRANSPORT_UDP;
    {class} property REQUEST_URI_FORMAT_SIP: Integer read _GetREQUEST_URI_FORMAT_SIP;
    {class} property REQUEST_URI_FORMAT_TEL: Integer read _GetREQUEST_URI_FORMAT_TEL;
    {class} property RTCP_INACTIVITY_ON_CONNECTED: Integer read _GetRTCP_INACTIVITY_ON_CONNECTED;
    {class} property RTCP_INACTIVITY_ON_HOLD: Integer read _GetRTCP_INACTIVITY_ON_HOLD;
    {class} property RTP_INACTIVITY_ON_CONNECTED: Integer read _GetRTP_INACTIVITY_ON_CONNECTED;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$Ims')]
  JCarrierConfigManager_Ims = interface(JObject)
    ['{FD8F6E1E-EDC1-4A20-ACB0-CFF7BBFE0D91}']
  end;
  TJCarrierConfigManager_Ims = class(TJavaGenericImport<JCarrierConfigManager_ImsClass, JCarrierConfigManager_Ims>) end;

  JCarrierConfigManager_ImsEmergencyClass = interface(JObjectClass)
    ['{503E4557-A7DA-4C79-B3AB-528079E9753F}']
    {class} function _GetKEY_EMERGENCY_CALLBACK_MODE_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_EMERGENCY_OVER_IMS_SUPPORTED_RATS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_EMERGENCY_QOS_PRECONDITION_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_EMERGENCY_REGISTRATION_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_REFRESH_GEOLOCATION_TIMEOUT_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_RETRY_EMERGENCY_ON_IMS_PDN_BOOL: JString; cdecl;
    {class} property KEY_EMERGENCY_CALLBACK_MODE_SUPPORTED_BOOL: JString read _GetKEY_EMERGENCY_CALLBACK_MODE_SUPPORTED_BOOL;
    {class} property KEY_EMERGENCY_OVER_IMS_SUPPORTED_RATS_INT_ARRAY: JString read _GetKEY_EMERGENCY_OVER_IMS_SUPPORTED_RATS_INT_ARRAY;
    {class} property KEY_EMERGENCY_QOS_PRECONDITION_SUPPORTED_BOOL: JString read _GetKEY_EMERGENCY_QOS_PRECONDITION_SUPPORTED_BOOL;
    {class} property KEY_EMERGENCY_REGISTRATION_TIMER_MILLIS_INT: JString read _GetKEY_EMERGENCY_REGISTRATION_TIMER_MILLIS_INT;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_REFRESH_GEOLOCATION_TIMEOUT_MILLIS_INT: JString read _GetKEY_REFRESH_GEOLOCATION_TIMEOUT_MILLIS_INT;
    {class} property KEY_RETRY_EMERGENCY_ON_IMS_PDN_BOOL: JString read _GetKEY_RETRY_EMERGENCY_ON_IMS_PDN_BOOL;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsEmergency')]
  JCarrierConfigManager_ImsEmergency = interface(JObject)
    ['{7C5255B0-CCDD-4380-8FCA-3AFA97C03878}']
  end;
  TJCarrierConfigManager_ImsEmergency = class(TJavaGenericImport<JCarrierConfigManager_ImsEmergencyClass, JCarrierConfigManager_ImsEmergency>) end;

  JCarrierConfigManager_ImsRttClass = interface(JObjectClass)
    ['{2B441991-0547-4DED-83CA-B83489C9694A}']
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_RED_PAYLOAD_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_T140_PAYLOAD_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_TEXT_AS_BANDWIDTH_KBPS_INT: JString; cdecl;
    {class} function _GetKEY_TEXT_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString; cdecl;
    {class} function _GetKEY_TEXT_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_TEXT_QOS_PRECONDITION_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_TEXT_RR_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} function _GetKEY_TEXT_RS_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_RED_PAYLOAD_TYPE_INT: JString read _GetKEY_RED_PAYLOAD_TYPE_INT;
    {class} property KEY_T140_PAYLOAD_TYPE_INT: JString read _GetKEY_T140_PAYLOAD_TYPE_INT;
    {class} property KEY_TEXT_AS_BANDWIDTH_KBPS_INT: JString read _GetKEY_TEXT_AS_BANDWIDTH_KBPS_INT;
    {class} property KEY_TEXT_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString read _GetKEY_TEXT_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE;
    {class} property KEY_TEXT_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString read _GetKEY_TEXT_ON_DEFAULT_BEARER_SUPPORTED_BOOL;
    {class} property KEY_TEXT_QOS_PRECONDITION_SUPPORTED_BOOL: JString read _GetKEY_TEXT_QOS_PRECONDITION_SUPPORTED_BOOL;
    {class} property KEY_TEXT_RR_BANDWIDTH_BPS_INT: JString read _GetKEY_TEXT_RR_BANDWIDTH_BPS_INT;
    {class} property KEY_TEXT_RS_BANDWIDTH_BPS_INT: JString read _GetKEY_TEXT_RS_BANDWIDTH_BPS_INT;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsRtt')]
  JCarrierConfigManager_ImsRtt = interface(JObject)
    ['{F3549EB4-3613-4A45-B145-7E55507BF640}']
  end;
  TJCarrierConfigManager_ImsRtt = class(TJavaGenericImport<JCarrierConfigManager_ImsRttClass, JCarrierConfigManager_ImsRtt>) end;

  JCarrierConfigManager_ImsServiceEntitlementClass = interface(JObjectClass)
    ['{04A5B6FD-BE9F-45FE-82F7-CCD8ABBFBD58}']
    {class} function _GetKEY_ENTITLEMENT_SERVER_URL_STRING: JString; cdecl;
    {class} function _GetKEY_FCM_SENDER_ID_STRING: JString; cdecl;
    {class} function _GetKEY_IMS_PROVISIONING_BOOL: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_SHOW_VOWIFI_WEBVIEW_BOOL: JString; cdecl;
    {class} property KEY_ENTITLEMENT_SERVER_URL_STRING: JString read _GetKEY_ENTITLEMENT_SERVER_URL_STRING;
    {class} property KEY_FCM_SENDER_ID_STRING: JString read _GetKEY_FCM_SENDER_ID_STRING;
    {class} property KEY_IMS_PROVISIONING_BOOL: JString read _GetKEY_IMS_PROVISIONING_BOOL;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_SHOW_VOWIFI_WEBVIEW_BOOL: JString read _GetKEY_SHOW_VOWIFI_WEBVIEW_BOOL;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsServiceEntitlement')]
  JCarrierConfigManager_ImsServiceEntitlement = interface(JObject)
    ['{B09D0CC3-82F4-4CEC-891D-6649CF1DD678}']
  end;
  TJCarrierConfigManager_ImsServiceEntitlement = class(TJavaGenericImport<JCarrierConfigManager_ImsServiceEntitlementClass, JCarrierConfigManager_ImsServiceEntitlement>) end;

  JCarrierConfigManager_ImsSmsClass = interface(JObjectClass)
    ['{4C531A48-A1B1-4F96-8EA2-AB1EF2AD5B19}']
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_SMS_CSFB_RETRY_ON_FAILURE_BOOL: JString; cdecl;
    {class} function _GetKEY_SMS_OVER_IMS_FORMAT_INT: JString; cdecl;
    {class} function _GetKEY_SMS_OVER_IMS_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_SMS_OVER_IMS_SUPPORTED_RATS_INT_ARRAY: JString; cdecl;
    {class} function _GetSMS_FORMAT_3GPP: Integer; cdecl;
    {class} function _GetSMS_FORMAT_3GPP2: Integer; cdecl;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_SMS_CSFB_RETRY_ON_FAILURE_BOOL: JString read _GetKEY_SMS_CSFB_RETRY_ON_FAILURE_BOOL;
    {class} property KEY_SMS_OVER_IMS_FORMAT_INT: JString read _GetKEY_SMS_OVER_IMS_FORMAT_INT;
    {class} property KEY_SMS_OVER_IMS_SUPPORTED_BOOL: JString read _GetKEY_SMS_OVER_IMS_SUPPORTED_BOOL;
    {class} property KEY_SMS_OVER_IMS_SUPPORTED_RATS_INT_ARRAY: JString read _GetKEY_SMS_OVER_IMS_SUPPORTED_RATS_INT_ARRAY;
    {class} property SMS_FORMAT_3GPP: Integer read _GetSMS_FORMAT_3GPP;
    {class} property SMS_FORMAT_3GPP2: Integer read _GetSMS_FORMAT_3GPP2;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsSms')]
  JCarrierConfigManager_ImsSms = interface(JObject)
    ['{F3B05161-594C-4A1B-8CE1-233F167E48E1}']
  end;
  TJCarrierConfigManager_ImsSms = class(TJavaGenericImport<JCarrierConfigManager_ImsSmsClass, JCarrierConfigManager_ImsSms>) end;

  JCarrierConfigManager_ImsSsClass = interface(JObjectClass)
    ['{4EF55BEC-A1DC-49CF-A0E9-D255BACC5EFA}']
    {class} function _GetKEY_NETWORK_INITIATED_USSD_OVER_IMS_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_USE_CSFB_ON_XCAP_OVER_UT_FAILURE_BOOL: JString; cdecl;
    {class} function _GetKEY_UT_AS_SERVER_FQDN_STRING: JString; cdecl;
    {class} function _GetKEY_UT_AS_SERVER_PORT_INT: JString; cdecl;
    {class} function _GetKEY_UT_IPTYPE_HOME_INT: JString; cdecl;
    {class} function _GetKEY_UT_IPTYPE_ROAMING_INT: JString; cdecl;
    {class} function _GetKEY_UT_REQUIRES_IMS_REGISTRATION_BOOL: JString; cdecl;
    {class} function _GetKEY_UT_SERVER_BASED_SERVICES_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_UT_SUPPORTED_WHEN_PS_DATA_OFF_BOOL: JString; cdecl;
    {class} function _GetKEY_UT_SUPPORTED_WHEN_ROAMING_BOOL: JString; cdecl;
    {class} function _GetKEY_UT_TERMINAL_BASED_SERVICES_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_UT_TRANSPORT_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_XCAP_OVER_UT_SUPPORTED_RATS_INT_ARRAY: JString; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_ACR: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_ALL: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BAIC: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BAOC: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BIC_ROAM: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BIL: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BOIC: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_BOIC_EXHC: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_IBS: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CB_OBS: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_ALL: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_ALL_CONDITONAL_FORWARDING: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_CFB: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_CFNL: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_CFNRC: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_CFNRY: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CF_CFU: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_CW: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_OIP: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_OIR: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_TIP: Integer; cdecl;
    {class} function _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_TIR: Integer; cdecl;
    {class} property KEY_NETWORK_INITIATED_USSD_OVER_IMS_SUPPORTED_BOOL: JString read _GetKEY_NETWORK_INITIATED_USSD_OVER_IMS_SUPPORTED_BOOL;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_USE_CSFB_ON_XCAP_OVER_UT_FAILURE_BOOL: JString read _GetKEY_USE_CSFB_ON_XCAP_OVER_UT_FAILURE_BOOL;
    {class} property KEY_UT_AS_SERVER_FQDN_STRING: JString read _GetKEY_UT_AS_SERVER_FQDN_STRING;
    {class} property KEY_UT_AS_SERVER_PORT_INT: JString read _GetKEY_UT_AS_SERVER_PORT_INT;
    {class} property KEY_UT_IPTYPE_HOME_INT: JString read _GetKEY_UT_IPTYPE_HOME_INT;
    {class} property KEY_UT_IPTYPE_ROAMING_INT: JString read _GetKEY_UT_IPTYPE_ROAMING_INT;
    {class} property KEY_UT_REQUIRES_IMS_REGISTRATION_BOOL: JString read _GetKEY_UT_REQUIRES_IMS_REGISTRATION_BOOL;
    {class} property KEY_UT_SERVER_BASED_SERVICES_INT_ARRAY: JString read _GetKEY_UT_SERVER_BASED_SERVICES_INT_ARRAY;
    {class} property KEY_UT_SUPPORTED_WHEN_PS_DATA_OFF_BOOL: JString read _GetKEY_UT_SUPPORTED_WHEN_PS_DATA_OFF_BOOL;
    {class} property KEY_UT_SUPPORTED_WHEN_ROAMING_BOOL: JString read _GetKEY_UT_SUPPORTED_WHEN_ROAMING_BOOL;
    {class} property KEY_UT_TERMINAL_BASED_SERVICES_INT_ARRAY: JString read _GetKEY_UT_TERMINAL_BASED_SERVICES_INT_ARRAY;
    {class} property KEY_UT_TRANSPORT_TYPE_INT: JString read _GetKEY_UT_TRANSPORT_TYPE_INT;
    {class} property KEY_XCAP_OVER_UT_SUPPORTED_RATS_INT_ARRAY: JString read _GetKEY_XCAP_OVER_UT_SUPPORTED_RATS_INT_ARRAY;
    {class} property SUPPLEMENTARY_SERVICE_CB_ACR: Integer read _GetSUPPLEMENTARY_SERVICE_CB_ACR;
    {class} property SUPPLEMENTARY_SERVICE_CB_ALL: Integer read _GetSUPPLEMENTARY_SERVICE_CB_ALL;
    {class} property SUPPLEMENTARY_SERVICE_CB_BAIC: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BAIC;
    {class} property SUPPLEMENTARY_SERVICE_CB_BAOC: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BAOC;
    {class} property SUPPLEMENTARY_SERVICE_CB_BIC_ROAM: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BIC_ROAM;
    {class} property SUPPLEMENTARY_SERVICE_CB_BIL: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BIL;
    {class} property SUPPLEMENTARY_SERVICE_CB_BOIC: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BOIC;
    {class} property SUPPLEMENTARY_SERVICE_CB_BOIC_EXHC: Integer read _GetSUPPLEMENTARY_SERVICE_CB_BOIC_EXHC;
    {class} property SUPPLEMENTARY_SERVICE_CB_IBS: Integer read _GetSUPPLEMENTARY_SERVICE_CB_IBS;
    {class} property SUPPLEMENTARY_SERVICE_CB_OBS: Integer read _GetSUPPLEMENTARY_SERVICE_CB_OBS;
    {class} property SUPPLEMENTARY_SERVICE_CF_ALL: Integer read _GetSUPPLEMENTARY_SERVICE_CF_ALL;
    {class} property SUPPLEMENTARY_SERVICE_CF_ALL_CONDITONAL_FORWARDING: Integer read _GetSUPPLEMENTARY_SERVICE_CF_ALL_CONDITONAL_FORWARDING;
    {class} property SUPPLEMENTARY_SERVICE_CF_CFB: Integer read _GetSUPPLEMENTARY_SERVICE_CF_CFB;
    {class} property SUPPLEMENTARY_SERVICE_CF_CFNL: Integer read _GetSUPPLEMENTARY_SERVICE_CF_CFNL;
    {class} property SUPPLEMENTARY_SERVICE_CF_CFNRC: Integer read _GetSUPPLEMENTARY_SERVICE_CF_CFNRC;
    {class} property SUPPLEMENTARY_SERVICE_CF_CFNRY: Integer read _GetSUPPLEMENTARY_SERVICE_CF_CFNRY;
    {class} property SUPPLEMENTARY_SERVICE_CF_CFU: Integer read _GetSUPPLEMENTARY_SERVICE_CF_CFU;
    {class} property SUPPLEMENTARY_SERVICE_CW: Integer read _GetSUPPLEMENTARY_SERVICE_CW;
    {class} property SUPPLEMENTARY_SERVICE_IDENTIFICATION_OIP: Integer read _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_OIP;
    {class} property SUPPLEMENTARY_SERVICE_IDENTIFICATION_OIR: Integer read _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_OIR;
    {class} property SUPPLEMENTARY_SERVICE_IDENTIFICATION_TIP: Integer read _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_TIP;
    {class} property SUPPLEMENTARY_SERVICE_IDENTIFICATION_TIR: Integer read _GetSUPPLEMENTARY_SERVICE_IDENTIFICATION_TIR;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsSs')]
  JCarrierConfigManager_ImsSs = interface(JObject)
    ['{BFFE2AD1-BC0C-44C3-AC1B-B14633A77274}']
  end;
  TJCarrierConfigManager_ImsSs = class(TJavaGenericImport<JCarrierConfigManager_ImsSsClass, JCarrierConfigManager_ImsSs>) end;

  JCarrierConfigManager_ImsVoiceClass = interface(JObjectClass)
    ['{0A2458C7-DF28-4813-9CAE-170E0C7A847B}']
    {class} function _GetALERTING_SRVCC_SUPPORT: Integer; cdecl;
    {class} function _GetBANDWIDTH_EFFICIENT: Integer; cdecl;
    {class} function _GetBASIC_SRVCC_SUPPORT: Integer; cdecl;
    {class} function _GetCONFERENCE_SUBSCRIBE_TYPE_IN_DIALOG: Integer; cdecl;
    {class} function _GetCONFERENCE_SUBSCRIBE_TYPE_OUT_OF_DIALOG: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_FB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_NB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_NB_WB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_NB_WB_SWB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_NB_WB_SWB_FB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_SWB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_WB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_WB_SWB: Integer; cdecl;
    {class} function _GetEVS_ENCODED_BW_TYPE_WB_SWB_FB: Integer; cdecl;
    {class} function _GetEVS_OPERATIONAL_MODE_AMRWB_IO: Integer; cdecl;
    {class} function _GetEVS_OPERATIONAL_MODE_PRIMARY: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_128_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_13_2_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_16_4_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_24_4_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_32_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_48_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_5_9_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_64_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_7_2_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_8_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_96_0_KBPS: Integer; cdecl;
    {class} function _GetEVS_PRIMARY_MODE_BITRATE_9_6_KBPS: Integer; cdecl;
    {class} function _GetKEY_AMRNB_PAYLOAD_DESCRIPTION_BUNDLE: JString; cdecl;
    {class} function _GetKEY_AMRNB_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_AMRWB_PAYLOAD_DESCRIPTION_BUNDLE: JString; cdecl;
    {class} function _GetKEY_AMRWB_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_AMR_CODEC_ATTRIBUTE_MODESET_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_AMR_CODEC_ATTRIBUTE_PAYLOAD_FORMAT_INT: JString; cdecl;
    {class} function _GetKEY_AUDIO_AS_BANDWIDTH_KBPS_INT: JString; cdecl;
    {class} function _GetKEY_AUDIO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString; cdecl;
    {class} function _GetKEY_AUDIO_INACTIVITY_CALL_END_REASONS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_AUDIO_RR_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} function _GetKEY_AUDIO_RS_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} function _GetKEY_AUDIO_RTCP_INACTIVITY_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_AUDIO_RTP_INACTIVITY_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_CARRIER_VOLTE_ROAMING_AVAILABLE_BOOL: JString; cdecl;
    {class} function _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_CAPABILITY_INT: JString; cdecl;
    {class} function _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_NEIGHBOR_INT: JString; cdecl;
    {class} function _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_PERIOD_INT: JString; cdecl;
    {class} function _GetKEY_CONFERENCE_FACTORY_URI_STRING: JString; cdecl;
    {class} function _GetKEY_CONFERENCE_SUBSCRIBE_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_DEDICATED_BEARER_WAIT_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_DTMFNB_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_DTMFWB_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_BANDWIDTH_INT: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_BITRATE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_CHANNELS_INT: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_CH_AW_RECV_INT: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_CMR_INT: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_DTX_BOOL: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_DTX_RECV_BOOL: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_HF_ONLY_INT: JString; cdecl;
    {class} function _GetKEY_EVS_CODEC_ATTRIBUTE_MODE_SWITCH_INT: JString; cdecl;
    {class} function _GetKEY_EVS_PAYLOAD_DESCRIPTION_BUNDLE: JString; cdecl;
    {class} function _GetKEY_EVS_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_INCLUDE_CALLER_ID_SERVICE_CODES_IN_SIP_INVITE_BOOL: JString; cdecl;
    {class} function _GetKEY_MINIMUM_SESSION_EXPIRES_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_MO_CALL_REQUEST_TIMEOUT_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_MULTIENDPOINT_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_OIP_SOURCE_FROM_HEADER_BOOL: JString; cdecl;
    {class} function _GetKEY_PRACK_SUPPORTED_FOR_18X_BOOL: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_RINGBACK_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_RINGING_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_SESSION_EXPIRES_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_SESSION_PRIVACY_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_SESSION_REFRESHER_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_SESSION_REFRESH_METHOD_INT: JString; cdecl;
    {class} function _GetKEY_SESSION_TIMER_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_SRVCC_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_VOICE_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_VOICE_QOS_PRECONDITION_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetMIDCALL_SRVCC_SUPPORT: Integer; cdecl;
    {class} function _GetOCTET_ALIGNED: Integer; cdecl;
    {class} function _GetPREALERTING_SRVCC_SUPPORT: Integer; cdecl;
    {class} function _GetSESSION_PRIVACY_TYPE_HEADER: Integer; cdecl;
    {class} function _GetSESSION_PRIVACY_TYPE_ID: Integer; cdecl;
    {class} function _GetSESSION_PRIVACY_TYPE_NONE: Integer; cdecl;
    {class} function _GetSESSION_REFRESHER_TYPE_UAC: Integer; cdecl;
    {class} function _GetSESSION_REFRESHER_TYPE_UAS: Integer; cdecl;
    {class} function _GetSESSION_REFRESHER_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetSESSION_REFRESH_METHOD_INVITE: Integer; cdecl;
    {class} function _GetSESSION_REFRESH_METHOD_UPDATE_PREFERRED: Integer; cdecl;
    {class} property ALERTING_SRVCC_SUPPORT: Integer read _GetALERTING_SRVCC_SUPPORT;
    {class} property BANDWIDTH_EFFICIENT: Integer read _GetBANDWIDTH_EFFICIENT;
    {class} property BASIC_SRVCC_SUPPORT: Integer read _GetBASIC_SRVCC_SUPPORT;
    {class} property CONFERENCE_SUBSCRIBE_TYPE_IN_DIALOG: Integer read _GetCONFERENCE_SUBSCRIBE_TYPE_IN_DIALOG;
    {class} property CONFERENCE_SUBSCRIBE_TYPE_OUT_OF_DIALOG: Integer read _GetCONFERENCE_SUBSCRIBE_TYPE_OUT_OF_DIALOG;
    {class} property EVS_ENCODED_BW_TYPE_FB: Integer read _GetEVS_ENCODED_BW_TYPE_FB;
    {class} property EVS_ENCODED_BW_TYPE_NB: Integer read _GetEVS_ENCODED_BW_TYPE_NB;
    {class} property EVS_ENCODED_BW_TYPE_NB_WB: Integer read _GetEVS_ENCODED_BW_TYPE_NB_WB;
    {class} property EVS_ENCODED_BW_TYPE_NB_WB_SWB: Integer read _GetEVS_ENCODED_BW_TYPE_NB_WB_SWB;
    {class} property EVS_ENCODED_BW_TYPE_NB_WB_SWB_FB: Integer read _GetEVS_ENCODED_BW_TYPE_NB_WB_SWB_FB;
    {class} property EVS_ENCODED_BW_TYPE_SWB: Integer read _GetEVS_ENCODED_BW_TYPE_SWB;
    {class} property EVS_ENCODED_BW_TYPE_WB: Integer read _GetEVS_ENCODED_BW_TYPE_WB;
    {class} property EVS_ENCODED_BW_TYPE_WB_SWB: Integer read _GetEVS_ENCODED_BW_TYPE_WB_SWB;
    {class} property EVS_ENCODED_BW_TYPE_WB_SWB_FB: Integer read _GetEVS_ENCODED_BW_TYPE_WB_SWB_FB;
    {class} property EVS_OPERATIONAL_MODE_AMRWB_IO: Integer read _GetEVS_OPERATIONAL_MODE_AMRWB_IO;
    {class} property EVS_OPERATIONAL_MODE_PRIMARY: Integer read _GetEVS_OPERATIONAL_MODE_PRIMARY;
    {class} property EVS_PRIMARY_MODE_BITRATE_128_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_128_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_13_2_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_13_2_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_16_4_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_16_4_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_24_4_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_24_4_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_32_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_32_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_48_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_48_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_5_9_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_5_9_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_64_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_64_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_7_2_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_7_2_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_8_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_8_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_96_0_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_96_0_KBPS;
    {class} property EVS_PRIMARY_MODE_BITRATE_9_6_KBPS: Integer read _GetEVS_PRIMARY_MODE_BITRATE_9_6_KBPS;
    {class} property KEY_AMRNB_PAYLOAD_DESCRIPTION_BUNDLE: JString read _GetKEY_AMRNB_PAYLOAD_DESCRIPTION_BUNDLE;
    {class} property KEY_AMRNB_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_AMRNB_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_AMRWB_PAYLOAD_DESCRIPTION_BUNDLE: JString read _GetKEY_AMRWB_PAYLOAD_DESCRIPTION_BUNDLE;
    {class} property KEY_AMRWB_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_AMRWB_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_AMR_CODEC_ATTRIBUTE_MODESET_INT_ARRAY: JString read _GetKEY_AMR_CODEC_ATTRIBUTE_MODESET_INT_ARRAY;
    {class} property KEY_AMR_CODEC_ATTRIBUTE_PAYLOAD_FORMAT_INT: JString read _GetKEY_AMR_CODEC_ATTRIBUTE_PAYLOAD_FORMAT_INT;
    {class} property KEY_AUDIO_AS_BANDWIDTH_KBPS_INT: JString read _GetKEY_AUDIO_AS_BANDWIDTH_KBPS_INT;
    {class} property KEY_AUDIO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString read _GetKEY_AUDIO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE;
    {class} property KEY_AUDIO_INACTIVITY_CALL_END_REASONS_INT_ARRAY: JString read _GetKEY_AUDIO_INACTIVITY_CALL_END_REASONS_INT_ARRAY;
    {class} property KEY_AUDIO_RR_BANDWIDTH_BPS_INT: JString read _GetKEY_AUDIO_RR_BANDWIDTH_BPS_INT;
    {class} property KEY_AUDIO_RS_BANDWIDTH_BPS_INT: JString read _GetKEY_AUDIO_RS_BANDWIDTH_BPS_INT;
    {class} property KEY_AUDIO_RTCP_INACTIVITY_TIMER_MILLIS_INT: JString read _GetKEY_AUDIO_RTCP_INACTIVITY_TIMER_MILLIS_INT;
    {class} property KEY_AUDIO_RTP_INACTIVITY_TIMER_MILLIS_INT: JString read _GetKEY_AUDIO_RTP_INACTIVITY_TIMER_MILLIS_INT;
    {class} property KEY_CARRIER_VOLTE_ROAMING_AVAILABLE_BOOL: JString read _GetKEY_CARRIER_VOLTE_ROAMING_AVAILABLE_BOOL;
    {class} property KEY_CODEC_ATTRIBUTE_MODE_CHANGE_CAPABILITY_INT: JString read _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_CAPABILITY_INT;
    {class} property KEY_CODEC_ATTRIBUTE_MODE_CHANGE_NEIGHBOR_INT: JString read _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_NEIGHBOR_INT;
    {class} property KEY_CODEC_ATTRIBUTE_MODE_CHANGE_PERIOD_INT: JString read _GetKEY_CODEC_ATTRIBUTE_MODE_CHANGE_PERIOD_INT;
    {class} property KEY_CONFERENCE_FACTORY_URI_STRING: JString read _GetKEY_CONFERENCE_FACTORY_URI_STRING;
    {class} property KEY_CONFERENCE_SUBSCRIBE_TYPE_INT: JString read _GetKEY_CONFERENCE_SUBSCRIBE_TYPE_INT;
    {class} property KEY_DEDICATED_BEARER_WAIT_TIMER_MILLIS_INT: JString read _GetKEY_DEDICATED_BEARER_WAIT_TIMER_MILLIS_INT;
    {class} property KEY_DTMFNB_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_DTMFNB_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_DTMFWB_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_DTMFWB_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_BANDWIDTH_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_BANDWIDTH_INT;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_BITRATE_INT_ARRAY: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_BITRATE_INT_ARRAY;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_CHANNELS_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_CHANNELS_INT;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_CH_AW_RECV_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_CH_AW_RECV_INT;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_CMR_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_CMR_INT;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_DTX_BOOL: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_DTX_BOOL;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_DTX_RECV_BOOL: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_DTX_RECV_BOOL;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_HF_ONLY_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_HF_ONLY_INT;
    {class} property KEY_EVS_CODEC_ATTRIBUTE_MODE_SWITCH_INT: JString read _GetKEY_EVS_CODEC_ATTRIBUTE_MODE_SWITCH_INT;
    {class} property KEY_EVS_PAYLOAD_DESCRIPTION_BUNDLE: JString read _GetKEY_EVS_PAYLOAD_DESCRIPTION_BUNDLE;
    {class} property KEY_EVS_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_EVS_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_INCLUDE_CALLER_ID_SERVICE_CODES_IN_SIP_INVITE_BOOL: JString read _GetKEY_INCLUDE_CALLER_ID_SERVICE_CODES_IN_SIP_INVITE_BOOL;
    {class} property KEY_MINIMUM_SESSION_EXPIRES_TIMER_SEC_INT: JString read _GetKEY_MINIMUM_SESSION_EXPIRES_TIMER_SEC_INT;
    {class} property KEY_MO_CALL_REQUEST_TIMEOUT_MILLIS_INT: JString read _GetKEY_MO_CALL_REQUEST_TIMEOUT_MILLIS_INT;
    {class} property KEY_MULTIENDPOINT_SUPPORTED_BOOL: JString read _GetKEY_MULTIENDPOINT_SUPPORTED_BOOL;
    {class} property KEY_OIP_SOURCE_FROM_HEADER_BOOL: JString read _GetKEY_OIP_SOURCE_FROM_HEADER_BOOL;
    {class} property KEY_PRACK_SUPPORTED_FOR_18X_BOOL: JString read _GetKEY_PRACK_SUPPORTED_FOR_18X_BOOL;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_RINGBACK_TIMER_MILLIS_INT: JString read _GetKEY_RINGBACK_TIMER_MILLIS_INT;
    {class} property KEY_RINGING_TIMER_MILLIS_INT: JString read _GetKEY_RINGING_TIMER_MILLIS_INT;
    {class} property KEY_SESSION_EXPIRES_TIMER_SEC_INT: JString read _GetKEY_SESSION_EXPIRES_TIMER_SEC_INT;
    {class} property KEY_SESSION_PRIVACY_TYPE_INT: JString read _GetKEY_SESSION_PRIVACY_TYPE_INT;
    {class} property KEY_SESSION_REFRESHER_TYPE_INT: JString read _GetKEY_SESSION_REFRESHER_TYPE_INT;
    {class} property KEY_SESSION_REFRESH_METHOD_INT: JString read _GetKEY_SESSION_REFRESH_METHOD_INT;
    {class} property KEY_SESSION_TIMER_SUPPORTED_BOOL: JString read _GetKEY_SESSION_TIMER_SUPPORTED_BOOL;
    {class} property KEY_SRVCC_TYPE_INT_ARRAY: JString read _GetKEY_SRVCC_TYPE_INT_ARRAY;
    {class} property KEY_VOICE_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString read _GetKEY_VOICE_ON_DEFAULT_BEARER_SUPPORTED_BOOL;
    {class} property KEY_VOICE_QOS_PRECONDITION_SUPPORTED_BOOL: JString read _GetKEY_VOICE_QOS_PRECONDITION_SUPPORTED_BOOL;
    {class} property MIDCALL_SRVCC_SUPPORT: Integer read _GetMIDCALL_SRVCC_SUPPORT;
    {class} property OCTET_ALIGNED: Integer read _GetOCTET_ALIGNED;
    {class} property PREALERTING_SRVCC_SUPPORT: Integer read _GetPREALERTING_SRVCC_SUPPORT;
    {class} property SESSION_PRIVACY_TYPE_HEADER: Integer read _GetSESSION_PRIVACY_TYPE_HEADER;
    {class} property SESSION_PRIVACY_TYPE_ID: Integer read _GetSESSION_PRIVACY_TYPE_ID;
    {class} property SESSION_PRIVACY_TYPE_NONE: Integer read _GetSESSION_PRIVACY_TYPE_NONE;
    {class} property SESSION_REFRESHER_TYPE_UAC: Integer read _GetSESSION_REFRESHER_TYPE_UAC;
    {class} property SESSION_REFRESHER_TYPE_UAS: Integer read _GetSESSION_REFRESHER_TYPE_UAS;
    {class} property SESSION_REFRESHER_TYPE_UNKNOWN: Integer read _GetSESSION_REFRESHER_TYPE_UNKNOWN;
    {class} property SESSION_REFRESH_METHOD_INVITE: Integer read _GetSESSION_REFRESH_METHOD_INVITE;
    {class} property SESSION_REFRESH_METHOD_UPDATE_PREFERRED: Integer read _GetSESSION_REFRESH_METHOD_UPDATE_PREFERRED;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsVoice')]
  JCarrierConfigManager_ImsVoice = interface(JObject)
    ['{F1B6E0E0-04BC-4318-B999-F701D95DB066}']
  end;
  TJCarrierConfigManager_ImsVoice = class(TJavaGenericImport<JCarrierConfigManager_ImsVoiceClass, JCarrierConfigManager_ImsVoice>) end;

  JCarrierConfigManager_ImsVtClass = interface(JObjectClass)
    ['{FC9FE108-A291-446F-ACA9-A3FB284FFD02}']
    {class} function _GetKEY_H264_PAYLOAD_DESCRIPTION_BUNDLE: JString; cdecl;
    {class} function _GetKEY_H264_PAYLOAD_TYPE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_H264_VIDEO_CODEC_ATTRIBUTE_PROFILE_LEVEL_ID_STRING: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_VIDEO_AS_BANDWIDTH_KBPS_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_CODEC_ATTRIBUTE_FRAME_RATE_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_CODEC_ATTRIBUTE_PACKETIZATION_MODE_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_CODEC_ATTRIBUTE_RESOLUTION_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_VIDEO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString; cdecl;
    {class} function _GetKEY_VIDEO_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_VIDEO_QOS_PRECONDITION_SUPPORTED_BOOL: JString; cdecl;
    {class} function _GetKEY_VIDEO_RR_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_RS_BANDWIDTH_BPS_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_RTCP_INACTIVITY_TIMER_MILLIS_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_RTP_DSCP_INT: JString; cdecl;
    {class} function _GetKEY_VIDEO_RTP_INACTIVITY_TIMER_MILLIS_INT: JString; cdecl;
    {class} property KEY_H264_PAYLOAD_DESCRIPTION_BUNDLE: JString read _GetKEY_H264_PAYLOAD_DESCRIPTION_BUNDLE;
    {class} property KEY_H264_PAYLOAD_TYPE_INT_ARRAY: JString read _GetKEY_H264_PAYLOAD_TYPE_INT_ARRAY;
    {class} property KEY_H264_VIDEO_CODEC_ATTRIBUTE_PROFILE_LEVEL_ID_STRING: JString read _GetKEY_H264_VIDEO_CODEC_ATTRIBUTE_PROFILE_LEVEL_ID_STRING;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_VIDEO_AS_BANDWIDTH_KBPS_INT: JString read _GetKEY_VIDEO_AS_BANDWIDTH_KBPS_INT;
    {class} property KEY_VIDEO_CODEC_ATTRIBUTE_FRAME_RATE_INT: JString read _GetKEY_VIDEO_CODEC_ATTRIBUTE_FRAME_RATE_INT;
    {class} property KEY_VIDEO_CODEC_ATTRIBUTE_PACKETIZATION_MODE_INT: JString read _GetKEY_VIDEO_CODEC_ATTRIBUTE_PACKETIZATION_MODE_INT;
    {class} property KEY_VIDEO_CODEC_ATTRIBUTE_RESOLUTION_INT_ARRAY: JString read _GetKEY_VIDEO_CODEC_ATTRIBUTE_RESOLUTION_INT_ARRAY;
    {class} property KEY_VIDEO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE: JString read _GetKEY_VIDEO_CODEC_CAPABILITY_PAYLOAD_TYPES_BUNDLE;
    {class} property KEY_VIDEO_ON_DEFAULT_BEARER_SUPPORTED_BOOL: JString read _GetKEY_VIDEO_ON_DEFAULT_BEARER_SUPPORTED_BOOL;
    {class} property KEY_VIDEO_QOS_PRECONDITION_SUPPORTED_BOOL: JString read _GetKEY_VIDEO_QOS_PRECONDITION_SUPPORTED_BOOL;
    {class} property KEY_VIDEO_RR_BANDWIDTH_BPS_INT: JString read _GetKEY_VIDEO_RR_BANDWIDTH_BPS_INT;
    {class} property KEY_VIDEO_RS_BANDWIDTH_BPS_INT: JString read _GetKEY_VIDEO_RS_BANDWIDTH_BPS_INT;
    {class} property KEY_VIDEO_RTCP_INACTIVITY_TIMER_MILLIS_INT: JString read _GetKEY_VIDEO_RTCP_INACTIVITY_TIMER_MILLIS_INT;
    {class} property KEY_VIDEO_RTP_DSCP_INT: JString read _GetKEY_VIDEO_RTP_DSCP_INT;
    {class} property KEY_VIDEO_RTP_INACTIVITY_TIMER_MILLIS_INT: JString read _GetKEY_VIDEO_RTP_INACTIVITY_TIMER_MILLIS_INT;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsVt')]
  JCarrierConfigManager_ImsVt = interface(JObject)
    ['{437BECC9-54F3-4E3C-9050-1878181F8052}']
  end;
  TJCarrierConfigManager_ImsVt = class(TJavaGenericImport<JCarrierConfigManager_ImsVtClass, JCarrierConfigManager_ImsVt>) end;

  JCarrierConfigManager_ImsWfcClass = interface(JObjectClass)
    ['{48095A6A-934D-4D2B-B97E-17FF1C8C4E41}']
    {class} function _GetKEY_EMERGENCY_CALL_OVER_EMERGENCY_PDN_BOOL: JString; cdecl;
    {class} function _GetKEY_PIDF_SHORT_CODE_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} property KEY_EMERGENCY_CALL_OVER_EMERGENCY_PDN_BOOL: JString read _GetKEY_EMERGENCY_CALL_OVER_EMERGENCY_PDN_BOOL;
    {class} property KEY_PIDF_SHORT_CODE_STRING_ARRAY: JString read _GetKEY_PIDF_SHORT_CODE_STRING_ARRAY;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$ImsWfc')]
  JCarrierConfigManager_ImsWfc = interface(JObject)
    ['{5511FF07-D812-4195-B8FF-9AAE13B80ACC}']
  end;
  TJCarrierConfigManager_ImsWfc = class(TJavaGenericImport<JCarrierConfigManager_ImsWfcClass, JCarrierConfigManager_ImsWfc>) end;

  JCarrierConfigManager_IwlanClass = interface(JObjectClass)
    ['{01905826-7A24-4322-907D-320C24B25EC4}']
    {class} function _GetAUTHENTICATION_METHOD_CERT: Integer; cdecl;
    {class} function _GetAUTHENTICATION_METHOD_EAP_ONLY: Integer; cdecl;
    {class} function _GetEPDG_ADDRESS_CELLULAR_LOC: Integer; cdecl;
    {class} function _GetEPDG_ADDRESS_PCO: Integer; cdecl;
    {class} function _GetEPDG_ADDRESS_PLMN: Integer; cdecl;
    {class} function _GetEPDG_ADDRESS_STATIC: Integer; cdecl;
    {class} function _GetEPDG_ADDRESS_VISITED_COUNTRY: Integer; cdecl;
    {class} function _GetID_TYPE_FQDN: Integer; cdecl;
    {class} function _GetID_TYPE_KEY_ID: Integer; cdecl;
    {class} function _GetID_TYPE_RFC822_ADDR: Integer; cdecl;
    {class} function _GetKEY_ADD_KE_TO_CHILD_SESSION_REKEY_BOOL: JString; cdecl;
    {class} function _GetKEY_CHILD_SA_REKEY_HARD_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_CHILD_SA_REKEY_SOFT_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_CHILD_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_CHILD_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_DIFFIE_HELLMAN_GROUPS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_DPD_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_EPDG_ADDRESS_PRIORITY_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_EPDG_AUTHENTICATION_METHOD_INT: JString; cdecl;
    {class} function _GetKEY_EPDG_PCO_ID_IPV4_INT: JString; cdecl;
    {class} function _GetKEY_EPDG_PCO_ID_IPV6_INT: JString; cdecl;
    {class} function _GetKEY_EPDG_STATIC_ADDRESS_ROAMING_STRING: JString; cdecl;
    {class} function _GetKEY_EPDG_STATIC_ADDRESS_STRING: JString; cdecl;
    {class} function _GetKEY_IKE_LOCAL_ID_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_IKE_REKEY_HARD_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_IKE_REKEY_SOFT_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_IKE_REMOTE_ID_TYPE_INT: JString; cdecl;
    {class} function _GetKEY_IKE_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_IKE_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_MAX_RETRIES_INT: JString; cdecl;
    {class} function _GetKEY_MCC_MNCS_STRING_ARRAY: JString; cdecl;
    {class} function _GetKEY_NATT_KEEP_ALIVE_TIMER_SEC_INT: JString; cdecl;
    {class} function _GetKEY_PREFIX: JString; cdecl;
    {class} function _GetKEY_RETRANSMIT_TIMER_MSEC_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_SUPPORTED_CHILD_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_SUPPORTED_IKE_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_SUPPORTED_INTEGRITY_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_SUPPORTED_PRF_ALGORITHMS_INT_ARRAY: JString; cdecl;
    {class} function _GetKEY_SUPPORTS_EAP_AKA_FAST_REAUTH_BOOL: JString; cdecl;
    {class} property AUTHENTICATION_METHOD_CERT: Integer read _GetAUTHENTICATION_METHOD_CERT;
    {class} property AUTHENTICATION_METHOD_EAP_ONLY: Integer read _GetAUTHENTICATION_METHOD_EAP_ONLY;
    {class} property EPDG_ADDRESS_CELLULAR_LOC: Integer read _GetEPDG_ADDRESS_CELLULAR_LOC;
    {class} property EPDG_ADDRESS_PCO: Integer read _GetEPDG_ADDRESS_PCO;
    {class} property EPDG_ADDRESS_PLMN: Integer read _GetEPDG_ADDRESS_PLMN;
    {class} property EPDG_ADDRESS_STATIC: Integer read _GetEPDG_ADDRESS_STATIC;
    {class} property EPDG_ADDRESS_VISITED_COUNTRY: Integer read _GetEPDG_ADDRESS_VISITED_COUNTRY;
    {class} property ID_TYPE_FQDN: Integer read _GetID_TYPE_FQDN;
    {class} property ID_TYPE_KEY_ID: Integer read _GetID_TYPE_KEY_ID;
    {class} property ID_TYPE_RFC822_ADDR: Integer read _GetID_TYPE_RFC822_ADDR;
    {class} property KEY_ADD_KE_TO_CHILD_SESSION_REKEY_BOOL: JString read _GetKEY_ADD_KE_TO_CHILD_SESSION_REKEY_BOOL;
    {class} property KEY_CHILD_SA_REKEY_HARD_TIMER_SEC_INT: JString read _GetKEY_CHILD_SA_REKEY_HARD_TIMER_SEC_INT;
    {class} property KEY_CHILD_SA_REKEY_SOFT_TIMER_SEC_INT: JString read _GetKEY_CHILD_SA_REKEY_SOFT_TIMER_SEC_INT;
    {class} property KEY_CHILD_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY: JString read _GetKEY_CHILD_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY;
    {class} property KEY_CHILD_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY: JString read _GetKEY_CHILD_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY;
    {class} property KEY_DIFFIE_HELLMAN_GROUPS_INT_ARRAY: JString read _GetKEY_DIFFIE_HELLMAN_GROUPS_INT_ARRAY;
    {class} property KEY_DPD_TIMER_SEC_INT: JString read _GetKEY_DPD_TIMER_SEC_INT;
    {class} property KEY_EPDG_ADDRESS_PRIORITY_INT_ARRAY: JString read _GetKEY_EPDG_ADDRESS_PRIORITY_INT_ARRAY;
    {class} property KEY_EPDG_AUTHENTICATION_METHOD_INT: JString read _GetKEY_EPDG_AUTHENTICATION_METHOD_INT;
    {class} property KEY_EPDG_PCO_ID_IPV4_INT: JString read _GetKEY_EPDG_PCO_ID_IPV4_INT;
    {class} property KEY_EPDG_PCO_ID_IPV6_INT: JString read _GetKEY_EPDG_PCO_ID_IPV6_INT;
    {class} property KEY_EPDG_STATIC_ADDRESS_ROAMING_STRING: JString read _GetKEY_EPDG_STATIC_ADDRESS_ROAMING_STRING;
    {class} property KEY_EPDG_STATIC_ADDRESS_STRING: JString read _GetKEY_EPDG_STATIC_ADDRESS_STRING;
    {class} property KEY_IKE_LOCAL_ID_TYPE_INT: JString read _GetKEY_IKE_LOCAL_ID_TYPE_INT;
    {class} property KEY_IKE_REKEY_HARD_TIMER_SEC_INT: JString read _GetKEY_IKE_REKEY_HARD_TIMER_SEC_INT;
    {class} property KEY_IKE_REKEY_SOFT_TIMER_SEC_INT: JString read _GetKEY_IKE_REKEY_SOFT_TIMER_SEC_INT;
    {class} property KEY_IKE_REMOTE_ID_TYPE_INT: JString read _GetKEY_IKE_REMOTE_ID_TYPE_INT;
    {class} property KEY_IKE_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY: JString read _GetKEY_IKE_SESSION_AES_CBC_KEY_SIZE_INT_ARRAY;
    {class} property KEY_IKE_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY: JString read _GetKEY_IKE_SESSION_AES_CTR_KEY_SIZE_INT_ARRAY;
    {class} property KEY_MAX_RETRIES_INT: JString read _GetKEY_MAX_RETRIES_INT;
    {class} property KEY_MCC_MNCS_STRING_ARRAY: JString read _GetKEY_MCC_MNCS_STRING_ARRAY;
    {class} property KEY_NATT_KEEP_ALIVE_TIMER_SEC_INT: JString read _GetKEY_NATT_KEEP_ALIVE_TIMER_SEC_INT;
    {class} property KEY_PREFIX: JString read _GetKEY_PREFIX;
    {class} property KEY_RETRANSMIT_TIMER_MSEC_INT_ARRAY: JString read _GetKEY_RETRANSMIT_TIMER_MSEC_INT_ARRAY;
    {class} property KEY_SUPPORTED_CHILD_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString read _GetKEY_SUPPORTED_CHILD_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY;
    {class} property KEY_SUPPORTED_IKE_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY: JString read _GetKEY_SUPPORTED_IKE_SESSION_ENCRYPTION_ALGORITHMS_INT_ARRAY;
    {class} property KEY_SUPPORTED_INTEGRITY_ALGORITHMS_INT_ARRAY: JString read _GetKEY_SUPPORTED_INTEGRITY_ALGORITHMS_INT_ARRAY;
    {class} property KEY_SUPPORTED_PRF_ALGORITHMS_INT_ARRAY: JString read _GetKEY_SUPPORTED_PRF_ALGORITHMS_INT_ARRAY;
    {class} property KEY_SUPPORTS_EAP_AKA_FAST_REAUTH_BOOL: JString read _GetKEY_SUPPORTS_EAP_AKA_FAST_REAUTH_BOOL;
  end;

  [JavaSignature('android/telephony/CarrierConfigManager$Iwlan')]
  JCarrierConfigManager_Iwlan = interface(JObject)
    ['{6FD04AC5-A823-4070-8769-E938FB564271}']
  end;
  TJCarrierConfigManager_Iwlan = class(TJavaGenericImport<JCarrierConfigManager_IwlanClass, JCarrierConfigManager_Iwlan>) end;

  JCellIdentityClass = interface(JObjectClass)
    ['{C8A56B05-7C77-4E9F-A89B-DDA7D02B1029}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellIdentity')]
  JCellIdentity = interface(JObject)
    ['{43D1DD53-F754-4576-BD86-B6929E292976}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getOperatorAlphaLong: JCharSequence; cdecl;
    function getOperatorAlphaShort: JCharSequence; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJCellIdentity = class(TJavaGenericImport<JCellIdentityClass, JCellIdentity>) end;

  JCellIdentityCdmaClass = interface(JCellIdentityClass)
    ['{47D53089-08D3-430B-8D56-2B54959C6F8A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityCdma')]
  JCellIdentityCdma = interface(JCellIdentity)
    ['{D2456865-988D-40AE-B4B3-42471181056E}']
    function equals(other: JObject): Boolean; cdecl;
    function getBasestationId: Integer; cdecl;
    function getLatitude: Integer; cdecl;
    function getLongitude: Integer; cdecl;
    function getNetworkId: Integer; cdecl;
    function getSystemId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellIdentityCdma = class(TJavaGenericImport<JCellIdentityCdmaClass, JCellIdentityCdma>) end;

  JCellIdentityGsmClass = interface(JCellIdentityClass)
    ['{F238DC50-40FA-4093-BDA2-2839208E79CE}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityGsm')]
  JCellIdentityGsm = interface(JCellIdentity)
    ['{9DD941A0-7403-4CD9-B000-22D4E7500A6D}']
    function equals(other: JObject): Boolean; cdecl;
    function getAdditionalPlmns: JSet; cdecl;
    function getArfcn: Integer; cdecl;
    function getBsic: Integer; cdecl;
    function getCid: Integer; cdecl;
    function getLac: Integer; cdecl;
    function getMcc: Integer; cdecl;//Deprecated
    function getMccString: JString; cdecl;
    function getMnc: Integer; cdecl;//Deprecated
    function getMncString: JString; cdecl;
    function getMobileNetworkOperator: JString; cdecl;
    function getPsc: Integer; cdecl;//Deprecated
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellIdentityGsm = class(TJavaGenericImport<JCellIdentityGsmClass, JCellIdentityGsm>) end;

  JCellIdentityLteClass = interface(JCellIdentityClass)
    ['{3F1A9F22-BF62-4D7C-ABA7-ECECF9725F68}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityLte')]
  JCellIdentityLte = interface(JCellIdentity)
    ['{A1796A99-CC9C-47E8-97EA-E7AF5B27A5BE}']
    function equals(other: JObject): Boolean; cdecl;
    function getAdditionalPlmns: JSet; cdecl;
    function getBands: TJavaArray<Integer>; cdecl;
    function getBandwidth: Integer; cdecl;
    function getCi: Integer; cdecl;
    function getClosedSubscriberGroupInfo: JClosedSubscriberGroupInfo; cdecl;
    function getEarfcn: Integer; cdecl;
    function getMcc: Integer; cdecl;//Deprecated
    function getMccString: JString; cdecl;
    function getMnc: Integer; cdecl;//Deprecated
    function getMncString: JString; cdecl;
    function getMobileNetworkOperator: JString; cdecl;
    function getPci: Integer; cdecl;
    function getTac: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellIdentityLte = class(TJavaGenericImport<JCellIdentityLteClass, JCellIdentityLte>) end;

  JCellIdentityNrClass = interface(JCellIdentityClass)
    ['{7632CA76-7990-4543-8281-818430605935}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityNr')]
  JCellIdentityNr = interface(JCellIdentity)
    ['{07FEA317-332D-45F5-AA93-B33F2E50DD8A}']
    function equals(other: JObject): Boolean; cdecl;
    function getAdditionalPlmns: JSet; cdecl;
    function getBands: TJavaArray<Integer>; cdecl;
    function getMccString: JString; cdecl;
    function getMncString: JString; cdecl;
    function getNci: Int64; cdecl;
    function getNrarfcn: Integer; cdecl;
    function getPci: Integer; cdecl;
    function getTac: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; type_: Integer); cdecl;
  end;
  TJCellIdentityNr = class(TJavaGenericImport<JCellIdentityNrClass, JCellIdentityNr>) end;

  JCellIdentityTdscdmaClass = interface(JCellIdentityClass)
    ['{218515C1-90E2-4C6A-8236-3B094D93D961}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityTdscdma')]
  JCellIdentityTdscdma = interface(JCellIdentity)
    ['{87BB7E5A-AD4B-49BF-B282-4D644BC5E260}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getAdditionalPlmns: JSet; cdecl;
    function getCid: Integer; cdecl;
    function getClosedSubscriberGroupInfo: JClosedSubscriberGroupInfo; cdecl;
    function getCpid: Integer; cdecl;
    function getLac: Integer; cdecl;
    function getMccString: JString; cdecl;
    function getMncString: JString; cdecl;
    function getMobileNetworkOperator: JString; cdecl;
    function getUarfcn: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellIdentityTdscdma = class(TJavaGenericImport<JCellIdentityTdscdmaClass, JCellIdentityTdscdma>) end;

  JCellIdentityWcdmaClass = interface(JCellIdentityClass)
    ['{F9C9B6D7-9DB2-4E50-8B47-7CC9F5EC7ED6}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellIdentityWcdma')]
  JCellIdentityWcdma = interface(JCellIdentity)
    ['{1B622051-779D-4813-9CA6-992ABA3535D0}']
    function equals(other: JObject): Boolean; cdecl;
    function getAdditionalPlmns: JSet; cdecl;
    function getCid: Integer; cdecl;
    function getClosedSubscriberGroupInfo: JClosedSubscriberGroupInfo; cdecl;
    function getLac: Integer; cdecl;
    function getMcc: Integer; cdecl;//Deprecated
    function getMccString: JString; cdecl;
    function getMnc: Integer; cdecl;//Deprecated
    function getMncString: JString; cdecl;
    function getMobileNetworkOperator: JString; cdecl;
    function getPsc: Integer; cdecl;
    function getUarfcn: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellIdentityWcdma = class(TJavaGenericImport<JCellIdentityWcdmaClass, JCellIdentityWcdma>) end;

  JCellInfoClass = interface(JObjectClass)
    ['{D5A9AC63-0BEA-45CB-A8E3-6DCBA1B9FD89}']
    {class} function _GetCONNECTION_NONE: Integer; cdecl;
    {class} function _GetCONNECTION_PRIMARY_SERVING: Integer; cdecl;
    {class} function _GetCONNECTION_SECONDARY_SERVING: Integer; cdecl;
    {class} function _GetCONNECTION_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetUNAVAILABLE: Integer; cdecl;
    {class} function _GetUNAVAILABLE_LONG: Int64; cdecl;
    {class} property CONNECTION_NONE: Integer read _GetCONNECTION_NONE;
    {class} property CONNECTION_PRIMARY_SERVING: Integer read _GetCONNECTION_PRIMARY_SERVING;
    {class} property CONNECTION_SECONDARY_SERVING: Integer read _GetCONNECTION_SECONDARY_SERVING;
    {class} property CONNECTION_UNKNOWN: Integer read _GetCONNECTION_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property UNAVAILABLE: Integer read _GetUNAVAILABLE;
    {class} property UNAVAILABLE_LONG: Int64 read _GetUNAVAILABLE_LONG;
  end;

  [JavaSignature('android/telephony/CellInfo')]
  JCellInfo = interface(JObject)
    ['{726F121A-E75C-4A37-B6CB-9DA886794FDF}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getCellConnectionStatus: Integer; cdecl;
    function getCellIdentity: JCellIdentity; cdecl;
    function getCellSignalStrength: JCellSignalStrength; cdecl;
    function getTimeStamp: Int64; cdecl;//Deprecated
    function getTimestampMillis: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function isRegistered: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfo = class(TJavaGenericImport<JCellInfoClass, JCellInfo>) end;

  JCellInfoCdmaClass = interface(JCellInfoClass)
    ['{553A50F7-6149-45ED-9077-17F3A93B024A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoCdma')]
  JCellInfoCdma = interface(JCellInfo)
    ['{AF6F61BE-45A9-46D4-A45F-D1B71A4F7152}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentityCdma; cdecl;
    function getCellSignalStrength: JCellSignalStrengthCdma; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoCdma = class(TJavaGenericImport<JCellInfoCdmaClass, JCellInfoCdma>) end;

  JCellInfoGsmClass = interface(JCellInfoClass)
    ['{EF7AB5EA-EE8E-42F6-8652-E50E630E46B4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoGsm')]
  JCellInfoGsm = interface(JCellInfo)
    ['{0E1045BB-B110-4AC7-803F-1BECCD8F9C3C}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentityGsm; cdecl;
    function getCellSignalStrength: JCellSignalStrengthGsm; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoGsm = class(TJavaGenericImport<JCellInfoGsmClass, JCellInfoGsm>) end;

  JCellInfoLteClass = interface(JCellInfoClass)
    ['{ED725D53-684B-4A2F-814F-9A9650AAF0F4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoLte')]
  JCellInfoLte = interface(JCellInfo)
    ['{8C7BB823-B037-49B8-8FBA-8C8AFE1F5177}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentityLte; cdecl;
    function getCellSignalStrength: JCellSignalStrengthLte; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoLte = class(TJavaGenericImport<JCellInfoLteClass, JCellInfoLte>) end;

  JCellInfoNrClass = interface(JCellInfoClass)
    ['{AD09102D-FC07-41DF-8572-2FFCC072C25C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoNr')]
  JCellInfoNr = interface(JCellInfo)
    ['{6C5674B2-5DD4-4CFE-BF12-B7E892D569F2}']
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentity; cdecl;
    function getCellSignalStrength: JCellSignalStrength; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoNr = class(TJavaGenericImport<JCellInfoNrClass, JCellInfoNr>) end;

  JCellInfoTdscdmaClass = interface(JCellInfoClass)
    ['{BC1DA511-4016-47DD-82EC-74183C613BE2}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoTdscdma')]
  JCellInfoTdscdma = interface(JCellInfo)
    ['{B01E06C1-26AC-41D5-A1FD-28793C2BE440}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentityTdscdma; cdecl;
    function getCellSignalStrength: JCellSignalStrengthTdscdma; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoTdscdma = class(TJavaGenericImport<JCellInfoTdscdmaClass, JCellInfoTdscdma>) end;

  JCellInfoWcdmaClass = interface(JCellInfoClass)
    ['{D77AEE44-3759-4C79-8D70-4E323C80C5FC}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/telephony/CellInfoWcdma')]
  JCellInfoWcdma = interface(JCellInfo)
    ['{6B66E6E1-BF02-48EA-9B98-5D891AA80788}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCellIdentity: JCellIdentityWcdma; cdecl;
    function getCellSignalStrength: JCellSignalStrengthWcdma; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellInfoWcdma = class(TJavaGenericImport<JCellInfoWcdmaClass, JCellInfoWcdma>) end;

  JCellLocationClass = interface(JObjectClass)
    ['{048C4A3E-4C00-40E1-A471-364959ED7986}']
    {class} function init: JCellLocation; cdecl;
    {class} function getEmpty: JCellLocation; cdecl;
    {class} procedure requestLocationUpdate; cdecl;//Deprecated
  end;

  [JavaSignature('android/telephony/CellLocation')]
  JCellLocation = interface(JObject)
    ['{769C920D-0E68-4A1D-ABA3-42894B5742C8}']
  end;
  TJCellLocation = class(TJavaGenericImport<JCellLocationClass, JCellLocation>) end;

  JCellSignalStrengthClass = interface(JObjectClass)
    ['{2E408E0B-E6EF-450A-BE16-FE6258E458B9}']
    {class} function _GetSIGNAL_STRENGTH_GOOD: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_GREAT: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_MODERATE: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_NONE_OR_UNKNOWN: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_POOR: Integer; cdecl;
    {class} property SIGNAL_STRENGTH_GOOD: Integer read _GetSIGNAL_STRENGTH_GOOD;
    {class} property SIGNAL_STRENGTH_GREAT: Integer read _GetSIGNAL_STRENGTH_GREAT;
    {class} property SIGNAL_STRENGTH_MODERATE: Integer read _GetSIGNAL_STRENGTH_MODERATE;
    {class} property SIGNAL_STRENGTH_NONE_OR_UNKNOWN: Integer read _GetSIGNAL_STRENGTH_NONE_OR_UNKNOWN;
    {class} property SIGNAL_STRENGTH_POOR: Integer read _GetSIGNAL_STRENGTH_POOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrength')]
  JCellSignalStrength = interface(JObject)
    ['{E28FDB30-AFA1-40FC-98B8-C2267E1532E0}']
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJCellSignalStrength = class(TJavaGenericImport<JCellSignalStrengthClass, JCellSignalStrength>) end;

  JCellSignalStrengthCdmaClass = interface(JCellSignalStrengthClass)
    ['{01B4BDE1-698E-4773-B65E-89BEC2EB3074}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthCdma')]
  JCellSignalStrengthCdma = interface(JCellSignalStrength)
    ['{06C07B11-232F-40E1-9072-885B7D40F92D}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getCdmaDbm: Integer; cdecl;
    function getCdmaEcio: Integer; cdecl;
    function getCdmaLevel: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getEvdoDbm: Integer; cdecl;
    function getEvdoEcio: Integer; cdecl;
    function getEvdoLevel: Integer; cdecl;
    function getEvdoSnr: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellSignalStrengthCdma = class(TJavaGenericImport<JCellSignalStrengthCdmaClass, JCellSignalStrengthCdma>) end;

  JCellSignalStrengthGsmClass = interface(JCellSignalStrengthClass)
    ['{BC14D3AE-FBE8-4778-9922-2DC549FAA3A3}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthGsm')]
  JCellSignalStrengthGsm = interface(JCellSignalStrength)
    ['{17546ED7-86F4-4A5F-A432-9D0477B4F29C}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getBitErrorRate: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function getRssi: Integer; cdecl;
    function getTimingAdvance: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellSignalStrengthGsm = class(TJavaGenericImport<JCellSignalStrengthGsmClass, JCellSignalStrengthGsm>) end;

  JCellSignalStrengthLteClass = interface(JCellSignalStrengthClass)
    ['{B2AEC25C-986C-49A8-85F0-5CF96A9E0856}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthLte')]
  JCellSignalStrengthLte = interface(JCellSignalStrength)
    ['{C0E93090-5675-481F-8BB4-5642161E3393}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getCqi: Integer; cdecl;
    function getCqiTableIndex: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function getRsrp: Integer; cdecl;
    function getRsrq: Integer; cdecl;
    function getRssi: Integer; cdecl;
    function getRssnr: Integer; cdecl;
    function getTimingAdvance: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellSignalStrengthLte = class(TJavaGenericImport<JCellSignalStrengthLteClass, JCellSignalStrengthLte>) end;

  JCellSignalStrengthNrClass = interface(JCellSignalStrengthClass)
    ['{2D1DCEA7-8826-4D51-B4C7-4B5FB4EF4157}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthNr')]
  JCellSignalStrengthNr = interface(JCellSignalStrength)
    ['{1839169E-79B1-4819-A828-645A31E241A5}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getCsiCqiReport: JList; cdecl;
    function getCsiCqiTableIndex: Integer; cdecl;
    function getCsiRsrp: Integer; cdecl;
    function getCsiRsrq: Integer; cdecl;
    function getCsiSinr: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function getSsRsrp: Integer; cdecl;
    function getSsRsrq: Integer; cdecl;
    function getSsSinr: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJCellSignalStrengthNr = class(TJavaGenericImport<JCellSignalStrengthNrClass, JCellSignalStrengthNr>) end;

  JCellSignalStrengthTdscdmaClass = interface(JCellSignalStrengthClass)
    ['{FEC5D3EA-EBAA-4B97-AFDC-A5353EFED16C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthTdscdma')]
  JCellSignalStrengthTdscdma = interface(JCellSignalStrength)
    ['{FD10B2FB-A03F-473B-895D-957F3EA22856}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function getRscp: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellSignalStrengthTdscdma = class(TJavaGenericImport<JCellSignalStrengthTdscdmaClass, JCellSignalStrengthTdscdma>) end;

  JCellSignalStrengthWcdmaClass = interface(JCellSignalStrengthClass)
    ['{2DEBF0C2-DE83-4B07-98A8-BF6CE9070ADF}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/CellSignalStrengthWcdma')]
  JCellSignalStrengthWcdma = interface(JCellSignalStrength)
    ['{09E2490B-D681-44B3-8C18-F4543582F1A3}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAsuLevel: Integer; cdecl;
    function getDbm: Integer; cdecl;
    function getEcNo: Integer; cdecl;
    function getLevel: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCellSignalStrengthWcdma = class(TJavaGenericImport<JCellSignalStrengthWcdmaClass, JCellSignalStrengthWcdma>) end;

  JClosedSubscriberGroupInfoClass = interface(JObjectClass)
    ['{BD164F62-0107-48C7-8353-CB796B9EF72E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/ClosedSubscriberGroupInfo')]
  JClosedSubscriberGroupInfo = interface(JObject)
    ['{B6498F72-0F81-4ACB-8455-DFDE9590507A}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getCsgIdentity: Integer; cdecl;
    function getCsgIndicator: Boolean; cdecl;
    function getHomeNodebName: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; type_: Integer); cdecl;
  end;
  TJClosedSubscriberGroupInfo = class(TJavaGenericImport<JClosedSubscriberGroupInfoClass, JClosedSubscriberGroupInfo>) end;

  JDataFailCauseClass = interface(JObjectClass)
    ['{D0E6F38E-E3B1-4203-9DB4-9362800B8A3B}']
    {class} function _GetACCESS_ATTEMPT_ALREADY_IN_PROGRESS: Integer; cdecl;
    {class} function _GetACCESS_BLOCK: Integer; cdecl;
    {class} function _GetACCESS_BLOCK_ALL: Integer; cdecl;
    {class} function _GetACCESS_CLASS_DSAC_REJECTION: Integer; cdecl;
    {class} function _GetACCESS_CONTROL_LIST_CHECK_FAILURE: Integer; cdecl;
    {class} function _GetACTIVATION_REJECTED_BCM_VIOLATION: Integer; cdecl;
    {class} function _GetACTIVATION_REJECT_GGSN: Integer; cdecl;
    {class} function _GetACTIVATION_REJECT_UNSPECIFIED: Integer; cdecl;
    {class} function _GetACTIVE_PDP_CONTEXT_MAX_NUMBER_REACHED: Integer; cdecl;
    {class} function _GetALL_MATCHING_RULES_FAILED: Integer; cdecl;
    {class} function _GetAPN_DISABLED: Integer; cdecl;
    {class} function _GetAPN_DISALLOWED_ON_ROAMING: Integer; cdecl;
    {class} function _GetAPN_MISMATCH: Integer; cdecl;
    {class} function _GetAPN_PARAMETERS_CHANGED: Integer; cdecl;
    {class} function _GetAPN_PENDING_HANDOVER: Integer; cdecl;
    {class} function _GetAPN_TYPE_CONFLICT: Integer; cdecl;
    {class} function _GetAUTH_FAILURE_ON_EMERGENCY_CALL: Integer; cdecl;
    {class} function _GetBEARER_HANDLING_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetCALL_DISALLOWED_IN_ROAMING: Integer; cdecl;
    {class} function _GetCALL_PREEMPT_BY_EMERGENCY_APN: Integer; cdecl;
    {class} function _GetCANNOT_ENCODE_OTA_MESSAGE: Integer; cdecl;
    {class} function _GetCDMA_ALERT_STOP: Integer; cdecl;
    {class} function _GetCDMA_INCOMING_CALL: Integer; cdecl;
    {class} function _GetCDMA_INTERCEPT: Integer; cdecl;
    {class} function _GetCDMA_LOCK: Integer; cdecl;
    {class} function _GetCDMA_RELEASE_DUE_TO_SO_REJECTION: Integer; cdecl;
    {class} function _GetCDMA_REORDER: Integer; cdecl;
    {class} function _GetCDMA_RETRY_ORDER: Integer; cdecl;
    {class} function _GetCHANNEL_ACQUISITION_FAILURE: Integer; cdecl;
    {class} function _GetCLOSE_IN_PROGRESS: Integer; cdecl;
    {class} function _GetCOLLISION_WITH_NETWORK_INITIATED_REQUEST: Integer; cdecl;
    {class} function _GetCOMPANION_IFACE_IN_USE: Integer; cdecl;
    {class} function _GetCONCURRENT_SERVICES_INCOMPATIBLE: Integer; cdecl;
    {class} function _GetCONCURRENT_SERVICES_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCONCURRENT_SERVICE_NOT_SUPPORTED_BY_BASE_STATION: Integer; cdecl;
    {class} function _GetCONDITIONAL_IE_ERROR: Integer; cdecl;
    {class} function _GetCONGESTION: Integer; cdecl;
    {class} function _GetCONNECTION_RELEASED: Integer; cdecl;
    {class} function _GetCS_DOMAIN_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetCS_FALLBACK_CALL_ESTABLISHMENT_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetDATA_PLAN_EXPIRED: Integer; cdecl;
    {class} function _GetDATA_ROAMING_SETTINGS_DISABLED: Integer; cdecl;
    {class} function _GetDATA_SETTINGS_DISABLED: Integer; cdecl;
    {class} function _GetDBM_OR_SMS_IN_PROGRESS: Integer; cdecl;
    {class} function _GetDDS_SWITCHED: Integer; cdecl;
    {class} function _GetDDS_SWITCH_IN_PROGRESS: Integer; cdecl;
    {class} function _GetDRB_RELEASED_BY_RRC: Integer; cdecl;
    {class} function _GetDS_EXPLICIT_DEACTIVATION: Integer; cdecl;
    {class} function _GetDUAL_SWITCH: Integer; cdecl;
    {class} function _GetDUN_CALL_DISALLOWED: Integer; cdecl;
    {class} function _GetDUPLICATE_BEARER_ID: Integer; cdecl;
    {class} function _GetEHRPD_TO_HRPD_FALLBACK: Integer; cdecl;
    {class} function _GetEMBMS_NOT_ENABLED: Integer; cdecl;
    {class} function _GetEMBMS_REGULAR_DEACTIVATION: Integer; cdecl;
    {class} function _GetEMERGENCY_IFACE_ONLY: Integer; cdecl;
    {class} function _GetEMERGENCY_MODE: Integer; cdecl;
    {class} function _GetEMM_ACCESS_BARRED: Integer; cdecl;
    {class} function _GetEMM_ACCESS_BARRED_INFINITE_RETRY: Integer; cdecl;
    {class} function _GetEMM_ATTACH_FAILED: Integer; cdecl;
    {class} function _GetEMM_ATTACH_STARTED: Integer; cdecl;
    {class} function _GetEMM_DETACHED: Integer; cdecl;
    {class} function _GetEMM_T3417_EXPIRED: Integer; cdecl;
    {class} function _GetEMM_T3417_EXT_EXPIRED: Integer; cdecl;
    {class} function _GetEPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetEPS_SERVICES_NOT_ALLOWED_IN_PLMN: Integer; cdecl;
    {class} function _GetERROR_UNSPECIFIED: Integer; cdecl;
    {class} function _GetESM_BAD_OTA_MESSAGE: Integer; cdecl;
    {class} function _GetESM_BEARER_DEACTIVATED_TO_SYNC_WITH_NETWORK: Integer; cdecl;
    {class} function _GetESM_COLLISION_SCENARIOS: Integer; cdecl;
    {class} function _GetESM_CONTEXT_TRANSFERRED_DUE_TO_IRAT: Integer; cdecl;
    {class} function _GetESM_DOWNLOAD_SERVER_REJECTED_THE_CALL: Integer; cdecl;
    {class} function _GetESM_FAILURE: Integer; cdecl;
    {class} function _GetESM_INFO_NOT_RECEIVED: Integer; cdecl;
    {class} function _GetESM_LOCAL_CAUSE_NONE: Integer; cdecl;
    {class} function _GetESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER: Integer; cdecl;
    {class} function _GetESM_PROCEDURE_TIME_OUT: Integer; cdecl;
    {class} function _GetESM_UNKNOWN_EPS_BEARER_CONTEXT: Integer; cdecl;
    {class} function _GetEVDO_CONNECTION_DENY_BY_BILLING_OR_AUTHENTICATION_FAILURE: Integer; cdecl;
    {class} function _GetEVDO_CONNECTION_DENY_BY_GENERAL_OR_NETWORK_BUSY: Integer; cdecl;
    {class} function _GetEVDO_HDR_CHANGED: Integer; cdecl;
    {class} function _GetEVDO_HDR_CONNECTION_SETUP_TIMEOUT: Integer; cdecl;
    {class} function _GetEVDO_HDR_EXITED: Integer; cdecl;
    {class} function _GetEVDO_HDR_NO_SESSION: Integer; cdecl;
    {class} function _GetEVDO_USING_GPS_FIX_INSTEAD_OF_HDR_CALL: Integer; cdecl;
    {class} function _GetFADE: Integer; cdecl;
    {class} function _GetFAILED_TO_ACQUIRE_COLOCATED_HDR: Integer; cdecl;
    {class} function _GetFEATURE_NOT_SUPP: Integer; cdecl;
    {class} function _GetFILTER_SEMANTIC_ERROR: Integer; cdecl;
    {class} function _GetFILTER_SYTAX_ERROR: Integer; cdecl;
    {class} function _GetFORBIDDEN_APN_NAME: Integer; cdecl;
    {class} function _GetGPRS_REGISTRATION_FAIL: Integer; cdecl;
    {class} function _GetGPRS_SERVICES_AND_NON_GPRS_SERVICES_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetGPRS_SERVICES_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetGPRS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN: Integer; cdecl;
    {class} function _GetHANDOFF_PREFERENCE_CHANGED: Integer; cdecl;
    {class} function _GetHDR_ACCESS_FAILURE: Integer; cdecl;
    {class} function _GetHDR_FADE: Integer; cdecl;
    {class} function _GetHDR_NO_LOCK_GRANTED: Integer; cdecl;
    {class} function _GetIFACE_AND_POL_FAMILY_MISMATCH: Integer; cdecl;
    {class} function _GetIFACE_MISMATCH: Integer; cdecl;
    {class} function _GetILLEGAL_ME: Integer; cdecl;
    {class} function _GetILLEGAL_MS: Integer; cdecl;
    {class} function _GetIMEI_NOT_ACCEPTED: Integer; cdecl;
    {class} function _GetIMPLICITLY_DETACHED: Integer; cdecl;
    {class} function _GetIMSI_UNKNOWN_IN_HOME_SUBSCRIBER_SERVER: Integer; cdecl;
    {class} function _GetINCOMING_CALL_REJECTED: Integer; cdecl;
    {class} function _GetINSUFFICIENT_RESOURCES: Integer; cdecl;
    {class} function _GetINTERFACE_IN_USE: Integer; cdecl;
    {class} function _GetINTERNAL_CALL_PREEMPT_BY_HIGH_PRIO_APN: Integer; cdecl;
    {class} function _GetINTERNAL_EPC_NONEPC_TRANSITION: Integer; cdecl;
    {class} function _GetINVALID_CONNECTION_ID: Integer; cdecl;
    {class} function _GetINVALID_DNS_ADDR: Integer; cdecl;
    {class} function _GetINVALID_EMM_STATE: Integer; cdecl;
    {class} function _GetINVALID_MANDATORY_INFO: Integer; cdecl;
    {class} function _GetINVALID_MODE: Integer; cdecl;
    {class} function _GetINVALID_PCSCF_ADDR: Integer; cdecl;
    {class} function _GetINVALID_PCSCF_OR_DNS_ADDRESS: Integer; cdecl;
    {class} function _GetINVALID_PRIMARY_NSAPI: Integer; cdecl;
    {class} function _GetINVALID_SIM_STATE: Integer; cdecl;
    {class} function _GetINVALID_TRANSACTION_ID: Integer; cdecl;
    {class} function _GetIPV6_ADDRESS_TRANSFER_FAILED: Integer; cdecl;
    {class} function _GetIPV6_PREFIX_UNAVAILABLE: Integer; cdecl;
    {class} function _GetIP_ADDRESS_MISMATCH: Integer; cdecl;
    {class} function _GetIP_VERSION_MISMATCH: Integer; cdecl;
    {class} function _GetIRAT_HANDOVER_FAILED: Integer; cdecl;
    {class} function _GetIS707B_MAX_ACCESS_PROBES: Integer; cdecl;
    {class} function _GetIWLAN_AUTHORIZATION_REJECTED: Integer; cdecl;
    {class} function _GetIWLAN_DNS_RESOLUTION_NAME_FAILURE: Integer; cdecl;
    {class} function _GetIWLAN_DNS_RESOLUTION_TIMEOUT: Integer; cdecl;
    {class} function _GetIWLAN_IKEV2_AUTH_FAILURE: Integer; cdecl;
    {class} function _GetIWLAN_IKEV2_CERT_INVALID: Integer; cdecl;
    {class} function _GetIWLAN_IKEV2_CONFIG_FAILURE: Integer; cdecl;
    {class} function _GetIWLAN_IKEV2_MSG_TIMEOUT: Integer; cdecl;
    {class} function _GetIWLAN_ILLEGAL_ME: Integer; cdecl;
    {class} function _GetIWLAN_IMEI_NOT_ACCEPTED: Integer; cdecl;
    {class} function _GetIWLAN_MAX_CONNECTION_REACHED: Integer; cdecl;
    {class} function _GetIWLAN_NETWORK_FAILURE: Integer; cdecl;
    {class} function _GetIWLAN_NON_3GPP_ACCESS_TO_EPC_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetIWLAN_NO_APN_SUBSCRIPTION: Integer; cdecl;
    {class} function _GetIWLAN_PDN_CONNECTION_REJECTION: Integer; cdecl;
    {class} function _GetIWLAN_PLMN_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetIWLAN_RAT_TYPE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetIWLAN_SEMANTIC_ERRORS_IN_PACKET_FILTERS: Integer; cdecl;
    {class} function _GetIWLAN_SEMANTIC_ERROR_IN_THE_TFT_OPERATION: Integer; cdecl;
    {class} function _GetIWLAN_SYNTACTICAL_ERRORS_IN_PACKET_FILTERS: Integer; cdecl;
    {class} function _GetIWLAN_SYNTACTICAL_ERROR_IN_THE_TFT_OPERATION: Integer; cdecl;
    {class} function _GetIWLAN_UNAUTHENTICATED_EMERGENCY_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetIWLAN_USER_UNKNOWN: Integer; cdecl;
    {class} function _GetLIMITED_TO_IPV4: Integer; cdecl;
    {class} function _GetLIMITED_TO_IPV6: Integer; cdecl;
    {class} function _GetLLC_SNDCP: Integer; cdecl;
    {class} function _GetLOCAL_END: Integer; cdecl;
    {class} function _GetLOCATION_AREA_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetLOST_CONNECTION: Integer; cdecl;
    {class} function _GetLOWER_LAYER_REGISTRATION_FAILURE: Integer; cdecl;
    {class} function _GetLOW_POWER_MODE_OR_POWERING_DOWN: Integer; cdecl;
    {class} function _GetLTE_NAS_SERVICE_REQUEST_FAILED: Integer; cdecl;
    {class} function _GetLTE_THROTTLING_NOT_REQUIRED: Integer; cdecl;
    {class} function _GetMAC_FAILURE: Integer; cdecl;
    {class} function _GetMATCH_ALL_RULE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetMAXIMIUM_NSAPIS_EXCEEDED: Integer; cdecl;
    {class} function _GetMAXINUM_SIZE_OF_L2_MESSAGE_EXCEEDED: Integer; cdecl;
    {class} function _GetMAX_ACCESS_PROBE: Integer; cdecl;
    {class} function _GetMAX_IPV4_CONNECTIONS: Integer; cdecl;
    {class} function _GetMAX_IPV6_CONNECTIONS: Integer; cdecl;
    {class} function _GetMAX_PPP_INACTIVITY_TIMER_EXPIRED: Integer; cdecl;
    {class} function _GetMESSAGE_INCORRECT_SEMANTIC: Integer; cdecl;
    {class} function _GetMESSAGE_TYPE_UNSUPPORTED: Integer; cdecl;
    {class} function _GetMIP_CONFIG_FAILURE: Integer; cdecl;
    {class} function _GetMIP_FA_ADMIN_PROHIBITED: Integer; cdecl;
    {class} function _GetMIP_FA_DELIVERY_STYLE_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetMIP_FA_ENCAPSULATION_UNAVAILABLE: Integer; cdecl;
    {class} function _GetMIP_FA_HOME_AGENT_AUTHENTICATION_FAILURE: Integer; cdecl;
    {class} function _GetMIP_FA_INSUFFICIENT_RESOURCES: Integer; cdecl;
    {class} function _GetMIP_FA_MALFORMED_REPLY: Integer; cdecl;
    {class} function _GetMIP_FA_MALFORMED_REQUEST: Integer; cdecl;
    {class} function _GetMIP_FA_MISSING_CHALLENGE: Integer; cdecl;
    {class} function _GetMIP_FA_MISSING_HOME_ADDRESS: Integer; cdecl;
    {class} function _GetMIP_FA_MISSING_HOME_AGENT: Integer; cdecl;
    {class} function _GetMIP_FA_MISSING_NAI: Integer; cdecl;
    {class} function _GetMIP_FA_MOBILE_NODE_AUTHENTICATION_FAILURE: Integer; cdecl;
    {class} function _GetMIP_FA_REASON_UNSPECIFIED: Integer; cdecl;
    {class} function _GetMIP_FA_REQUESTED_LIFETIME_TOO_LONG: Integer; cdecl;
    {class} function _GetMIP_FA_REVERSE_TUNNEL_IS_MANDATORY: Integer; cdecl;
    {class} function _GetMIP_FA_REVERSE_TUNNEL_UNAVAILABLE: Integer; cdecl;
    {class} function _GetMIP_FA_STALE_CHALLENGE: Integer; cdecl;
    {class} function _GetMIP_FA_UNKNOWN_CHALLENGE: Integer; cdecl;
    {class} function _GetMIP_FA_VJ_HEADER_COMPRESSION_UNAVAILABLE: Integer; cdecl;
    {class} function _GetMIP_HA_ADMIN_PROHIBITED: Integer; cdecl;
    {class} function _GetMIP_HA_ENCAPSULATION_UNAVAILABLE: Integer; cdecl;
    {class} function _GetMIP_HA_FOREIGN_AGENT_AUTHENTICATION_FAILURE: Integer; cdecl;
    {class} function _GetMIP_HA_INSUFFICIENT_RESOURCES: Integer; cdecl;
    {class} function _GetMIP_HA_MALFORMED_REQUEST: Integer; cdecl;
    {class} function _GetMIP_HA_MOBILE_NODE_AUTHENTICATION_FAILURE: Integer; cdecl;
    {class} function _GetMIP_HA_REASON_UNSPECIFIED: Integer; cdecl;
    {class} function _GetMIP_HA_REGISTRATION_ID_MISMATCH: Integer; cdecl;
    {class} function _GetMIP_HA_REVERSE_TUNNEL_IS_MANDATORY: Integer; cdecl;
    {class} function _GetMIP_HA_REVERSE_TUNNEL_UNAVAILABLE: Integer; cdecl;
    {class} function _GetMIP_HA_UNKNOWN_HOME_AGENT_ADDRESS: Integer; cdecl;
    {class} function _GetMISSING_UNKNOWN_APN: Integer; cdecl;
    {class} function _GetMODEM_APP_PREEMPTED: Integer; cdecl;
    {class} function _GetMODEM_RESTART: Integer; cdecl;
    {class} function _GetMSC_TEMPORARILY_NOT_REACHABLE: Integer; cdecl;
    {class} function _GetMSG_AND_PROTOCOL_STATE_UNCOMPATIBLE: Integer; cdecl;
    {class} function _GetMSG_TYPE_NONCOMPATIBLE_STATE: Integer; cdecl;
    {class} function _GetMS_IDENTITY_CANNOT_BE_DERIVED_BY_THE_NETWORK: Integer; cdecl;
    {class} function _GetMULTIPLE_PDP_CALL_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetMULTI_CONN_TO_SAME_PDN_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetNAS_LAYER_FAILURE: Integer; cdecl;
    {class} function _GetNAS_REQUEST_REJECTED_BY_NETWORK: Integer; cdecl;
    {class} function _GetNAS_SIGNALLING: Integer; cdecl;
    {class} function _GetNETWORK_FAILURE: Integer; cdecl;
    {class} function _GetNETWORK_INITIATED_DETACH_NO_AUTO_REATTACH: Integer; cdecl;
    {class} function _GetNETWORK_INITIATED_DETACH_WITH_AUTO_REATTACH: Integer; cdecl;
    {class} function _GetNETWORK_INITIATED_TERMINATION: Integer; cdecl;
    {class} function _GetNONE: Integer; cdecl;
    {class} function _GetNON_IP_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetNORMAL_RELEASE: Integer; cdecl;
    {class} function _GetNO_CDMA_SERVICE: Integer; cdecl;
    {class} function _GetNO_COLLOCATED_HDR: Integer; cdecl;
    {class} function _GetNO_EPS_BEARER_CONTEXT_ACTIVATED: Integer; cdecl;
    {class} function _GetNO_GPRS_CONTEXT: Integer; cdecl;
    {class} function _GetNO_HYBRID_HDR_SERVICE: Integer; cdecl;
    {class} function _GetNO_PDP_CONTEXT_ACTIVATED: Integer; cdecl;
    {class} function _GetNO_RESPONSE_FROM_BASE_STATION: Integer; cdecl;
    {class} function _GetNO_SERVICE: Integer; cdecl;
    {class} function _GetNO_SERVICE_ON_GATEWAY: Integer; cdecl;
    {class} function _GetNSAPI_IN_USE: Integer; cdecl;
    {class} function _GetNULL_APN_DISALLOWED: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_1: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_10: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_11: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_12: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_13: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_14: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_15: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_2: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_3: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_4: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_5: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_6: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_7: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_8: Integer; cdecl;
    {class} function _GetOEM_DCFAILCAUSE_9: Integer; cdecl;
    {class} function _GetONLY_IPV4V6_ALLOWED: Integer; cdecl;
    {class} function _GetONLY_IPV4_ALLOWED: Integer; cdecl;
    {class} function _GetONLY_IPV6_ALLOWED: Integer; cdecl;
    {class} function _GetONLY_NON_IP_ALLOWED: Integer; cdecl;
    {class} function _GetONLY_SINGLE_BEARER_ALLOWED: Integer; cdecl;
    {class} function _GetOPERATOR_BARRED: Integer; cdecl;
    {class} function _GetOTASP_COMMIT_IN_PROGRESS: Integer; cdecl;
    {class} function _GetPDN_CONN_DOES_NOT_EXIST: Integer; cdecl;
    {class} function _GetPDN_INACTIVITY_TIMER_EXPIRED: Integer; cdecl;
    {class} function _GetPDN_IPV4_CALL_DISALLOWED: Integer; cdecl;
    {class} function _GetPDN_IPV4_CALL_THROTTLED: Integer; cdecl;
    {class} function _GetPDN_IPV6_CALL_DISALLOWED: Integer; cdecl;
    {class} function _GetPDN_IPV6_CALL_THROTTLED: Integer; cdecl;
    {class} function _GetPDN_NON_IP_CALL_DISALLOWED: Integer; cdecl;
    {class} function _GetPDN_NON_IP_CALL_THROTTLED: Integer; cdecl;
    {class} function _GetPDP_ACTIVATE_MAX_RETRY_FAILED: Integer; cdecl;
    {class} function _GetPDP_DUPLICATE: Integer; cdecl;
    {class} function _GetPDP_ESTABLISH_TIMEOUT_EXPIRED: Integer; cdecl;
    {class} function _GetPDP_INACTIVE_TIMEOUT_EXPIRED: Integer; cdecl;
    {class} function _GetPDP_LOWERLAYER_ERROR: Integer; cdecl;
    {class} function _GetPDP_MODIFY_COLLISION: Integer; cdecl;
    {class} function _GetPDP_MODIFY_TIMEOUT_EXPIRED: Integer; cdecl;
    {class} function _GetPDP_PPP_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetPDP_WITHOUT_ACTIVE_TFT: Integer; cdecl;
    {class} function _GetPHONE_IN_USE: Integer; cdecl;
    {class} function _GetPHYSICAL_LINK_CLOSE_IN_PROGRESS: Integer; cdecl;
    {class} function _GetPLMN_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetPPP_AUTH_FAILURE: Integer; cdecl;
    {class} function _GetPPP_CHAP_FAILURE: Integer; cdecl;
    {class} function _GetPPP_CLOSE_IN_PROGRESS: Integer; cdecl;
    {class} function _GetPPP_OPTION_MISMATCH: Integer; cdecl;
    {class} function _GetPPP_PAP_FAILURE: Integer; cdecl;
    {class} function _GetPPP_TIMEOUT: Integer; cdecl;
    {class} function _GetPREF_RADIO_TECH_CHANGED: Integer; cdecl;
    {class} function _GetPROFILE_BEARER_INCOMPATIBLE: Integer; cdecl;
    {class} function _GetPROTOCOL_ERRORS: Integer; cdecl;
    {class} function _GetQOS_NOT_ACCEPTED: Integer; cdecl;
    {class} function _GetRADIO_ACCESS_BEARER_FAILURE: Integer; cdecl;
    {class} function _GetRADIO_ACCESS_BEARER_SETUP_FAILURE: Integer; cdecl;
    {class} function _GetRADIO_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetRADIO_POWER_OFF: Integer; cdecl;
    {class} function _GetREDIRECTION_OR_HANDOFF_IN_PROGRESS: Integer; cdecl;
    {class} function _GetREGISTRATION_FAIL: Integer; cdecl;
    {class} function _GetREGULAR_DEACTIVATION: Integer; cdecl;
    {class} function _GetREJECTED_BY_BASE_STATION: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ABORTED_AFTER_HANDOVER: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ABORTED_AFTER_IRAT_CELL_CHANGE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ABORTED_DUE_TO_IRAT_CHANGE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ABORTED_DURING_IRAT_CELL_CHANGE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ABORT_REQUEST: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ACCESS_BARRED: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ACCESS_STRATUM_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_ANOTHER_PROCEDURE_IN_PROGRESS: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_CELL_NOT_CAMPED: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_CELL_RESELECTION: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_CONFIG_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_LINK_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_NORMAL_RELEASE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_OUT_OF_SERVICE_DURING_CELL_REGISTER: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_RADIO_LINK_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_REESTABLISHMENT_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_REJECT_BY_NETWORK: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_RELEASED_SECURITY_NOT_ACTIVE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_RF_UNAVAILABLE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_SYSTEM_INFORMATION_BLOCK_READ_ERROR: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_SYSTEM_INTERVAL_FAILURE: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_TIMER_EXPIRED: Integer; cdecl;
    {class} function _GetRRC_CONNECTION_TRACKING_AREA_ID_CHANGED: Integer; cdecl;
    {class} function _GetRRC_UPLINK_CONNECTION_RELEASE: Integer; cdecl;
    {class} function _GetRRC_UPLINK_DATA_TRANSMISSION_FAILURE: Integer; cdecl;
    {class} function _GetRRC_UPLINK_DELIVERY_FAILED_DUE_TO_HANDOVER: Integer; cdecl;
    {class} function _GetRRC_UPLINK_ERROR_REQUEST_FROM_NAS: Integer; cdecl;
    {class} function _GetRRC_UPLINK_RADIO_LINK_FAILURE: Integer; cdecl;
    {class} function _GetRUIM_NOT_PRESENT: Integer; cdecl;
    {class} function _GetSECURITY_MODE_REJECTED: Integer; cdecl;
    {class} function _GetSERVICE_NOT_ALLOWED_ON_PLMN: Integer; cdecl;
    {class} function _GetSERVICE_OPTION_NOT_SUBSCRIBED: Integer; cdecl;
    {class} function _GetSERVICE_OPTION_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetSERVICE_OPTION_OUT_OF_ORDER: Integer; cdecl;
    {class} function _GetSIGNAL_LOST: Integer; cdecl;
    {class} function _GetSIM_CARD_CHANGED: Integer; cdecl;
    {class} function _GetSLICE_REJECTED: Integer; cdecl;
    {class} function _GetSYNCHRONIZATION_FAILURE: Integer; cdecl;
    {class} function _GetTEST_LOOPBACK_REGULAR_DEACTIVATION: Integer; cdecl;
    {class} function _GetTETHERED_CALL_ACTIVE: Integer; cdecl;
    {class} function _GetTFT_SEMANTIC_ERROR: Integer; cdecl;
    {class} function _GetTFT_SYTAX_ERROR: Integer; cdecl;
    {class} function _GetTHERMAL_EMERGENCY: Integer; cdecl;
    {class} function _GetTHERMAL_MITIGATION: Integer; cdecl;
    {class} function _GetTRAT_SWAP_FAILED: Integer; cdecl;
    {class} function _GetUE_INITIATED_DETACH_OR_DISCONNECT: Integer; cdecl;
    {class} function _GetUE_IS_ENTERING_POWERSAVE_MODE: Integer; cdecl;
    {class} function _GetUE_RAT_CHANGE: Integer; cdecl;
    {class} function _GetUE_SECURITY_CAPABILITIES_MISMATCH: Integer; cdecl;
    {class} function _GetUMTS_HANDOVER_TO_IWLAN: Integer; cdecl;
    {class} function _GetUMTS_REACTIVATION_REQ: Integer; cdecl;
    {class} function _GetUNACCEPTABLE_NETWORK_PARAMETER: Integer; cdecl;
    {class} function _GetUNACCEPTABLE_NON_EPS_AUTHENTICATION: Integer; cdecl;
    {class} function _GetUNKNOWN: Integer; cdecl;
    {class} function _GetUNKNOWN_INFO_ELEMENT: Integer; cdecl;
    {class} function _GetUNKNOWN_PDP_ADDRESS_TYPE: Integer; cdecl;
    {class} function _GetUNKNOWN_PDP_CONTEXT: Integer; cdecl;
    {class} function _GetUNPREFERRED_RAT: Integer; cdecl;
    {class} function _GetUNSUPPORTED_1X_PREV: Integer; cdecl;
    {class} function _GetUNSUPPORTED_APN_IN_CURRENT_PLMN: Integer; cdecl;
    {class} function _GetUNSUPPORTED_QCI_VALUE: Integer; cdecl;
    {class} function _GetUSER_AUTHENTICATION: Integer; cdecl;
    {class} function _GetVSNCP_ADMINISTRATIVELY_PROHIBITED: Integer; cdecl;
    {class} function _GetVSNCP_APN_UNAUTHORIZED: Integer; cdecl;
    {class} function _GetVSNCP_GEN_ERROR: Integer; cdecl;
    {class} function _GetVSNCP_INSUFFICIENT_PARAMETERS: Integer; cdecl;
    {class} function _GetVSNCP_NO_PDN_GATEWAY_ADDRESS: Integer; cdecl;
    {class} function _GetVSNCP_PDN_EXISTS_FOR_THIS_APN: Integer; cdecl;
    {class} function _GetVSNCP_PDN_GATEWAY_REJECT: Integer; cdecl;
    {class} function _GetVSNCP_PDN_GATEWAY_UNREACHABLE: Integer; cdecl;
    {class} function _GetVSNCP_PDN_ID_IN_USE: Integer; cdecl;
    {class} function _GetVSNCP_PDN_LIMIT_EXCEEDED: Integer; cdecl;
    {class} function _GetVSNCP_RECONNECT_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetVSNCP_RESOURCE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetVSNCP_SUBSCRIBER_LIMITATION: Integer; cdecl;
    {class} function _GetVSNCP_TIMEOUT: Integer; cdecl;
    {class} property ACCESS_ATTEMPT_ALREADY_IN_PROGRESS: Integer read _GetACCESS_ATTEMPT_ALREADY_IN_PROGRESS;
    {class} property ACCESS_BLOCK: Integer read _GetACCESS_BLOCK;
    {class} property ACCESS_BLOCK_ALL: Integer read _GetACCESS_BLOCK_ALL;
    {class} property ACCESS_CLASS_DSAC_REJECTION: Integer read _GetACCESS_CLASS_DSAC_REJECTION;
    {class} property ACCESS_CONTROL_LIST_CHECK_FAILURE: Integer read _GetACCESS_CONTROL_LIST_CHECK_FAILURE;
    {class} property ACTIVATION_REJECTED_BCM_VIOLATION: Integer read _GetACTIVATION_REJECTED_BCM_VIOLATION;
    {class} property ACTIVATION_REJECT_GGSN: Integer read _GetACTIVATION_REJECT_GGSN;
    {class} property ACTIVATION_REJECT_UNSPECIFIED: Integer read _GetACTIVATION_REJECT_UNSPECIFIED;
    {class} property ACTIVE_PDP_CONTEXT_MAX_NUMBER_REACHED: Integer read _GetACTIVE_PDP_CONTEXT_MAX_NUMBER_REACHED;
    {class} property ALL_MATCHING_RULES_FAILED: Integer read _GetALL_MATCHING_RULES_FAILED;
    {class} property APN_DISABLED: Integer read _GetAPN_DISABLED;
    {class} property APN_DISALLOWED_ON_ROAMING: Integer read _GetAPN_DISALLOWED_ON_ROAMING;
    {class} property APN_MISMATCH: Integer read _GetAPN_MISMATCH;
    {class} property APN_PARAMETERS_CHANGED: Integer read _GetAPN_PARAMETERS_CHANGED;
    {class} property APN_PENDING_HANDOVER: Integer read _GetAPN_PENDING_HANDOVER;
    {class} property APN_TYPE_CONFLICT: Integer read _GetAPN_TYPE_CONFLICT;
    {class} property AUTH_FAILURE_ON_EMERGENCY_CALL: Integer read _GetAUTH_FAILURE_ON_EMERGENCY_CALL;
    {class} property BEARER_HANDLING_NOT_SUPPORTED: Integer read _GetBEARER_HANDLING_NOT_SUPPORTED;
    {class} property CALL_DISALLOWED_IN_ROAMING: Integer read _GetCALL_DISALLOWED_IN_ROAMING;
    {class} property CALL_PREEMPT_BY_EMERGENCY_APN: Integer read _GetCALL_PREEMPT_BY_EMERGENCY_APN;
    {class} property CANNOT_ENCODE_OTA_MESSAGE: Integer read _GetCANNOT_ENCODE_OTA_MESSAGE;
    {class} property CDMA_ALERT_STOP: Integer read _GetCDMA_ALERT_STOP;
    {class} property CDMA_INCOMING_CALL: Integer read _GetCDMA_INCOMING_CALL;
    {class} property CDMA_INTERCEPT: Integer read _GetCDMA_INTERCEPT;
    {class} property CDMA_LOCK: Integer read _GetCDMA_LOCK;
    {class} property CDMA_RELEASE_DUE_TO_SO_REJECTION: Integer read _GetCDMA_RELEASE_DUE_TO_SO_REJECTION;
    {class} property CDMA_REORDER: Integer read _GetCDMA_REORDER;
    {class} property CDMA_RETRY_ORDER: Integer read _GetCDMA_RETRY_ORDER;
    {class} property CHANNEL_ACQUISITION_FAILURE: Integer read _GetCHANNEL_ACQUISITION_FAILURE;
    {class} property CLOSE_IN_PROGRESS: Integer read _GetCLOSE_IN_PROGRESS;
    {class} property COLLISION_WITH_NETWORK_INITIATED_REQUEST: Integer read _GetCOLLISION_WITH_NETWORK_INITIATED_REQUEST;
    {class} property COMPANION_IFACE_IN_USE: Integer read _GetCOMPANION_IFACE_IN_USE;
    {class} property CONCURRENT_SERVICES_INCOMPATIBLE: Integer read _GetCONCURRENT_SERVICES_INCOMPATIBLE;
    {class} property CONCURRENT_SERVICES_NOT_ALLOWED: Integer read _GetCONCURRENT_SERVICES_NOT_ALLOWED;
    {class} property CONCURRENT_SERVICE_NOT_SUPPORTED_BY_BASE_STATION: Integer read _GetCONCURRENT_SERVICE_NOT_SUPPORTED_BY_BASE_STATION;
    {class} property CONDITIONAL_IE_ERROR: Integer read _GetCONDITIONAL_IE_ERROR;
    {class} property CONGESTION: Integer read _GetCONGESTION;
    {class} property CONNECTION_RELEASED: Integer read _GetCONNECTION_RELEASED;
    {class} property CS_DOMAIN_NOT_AVAILABLE: Integer read _GetCS_DOMAIN_NOT_AVAILABLE;
    {class} property CS_FALLBACK_CALL_ESTABLISHMENT_NOT_ALLOWED: Integer read _GetCS_FALLBACK_CALL_ESTABLISHMENT_NOT_ALLOWED;
    {class} property DATA_PLAN_EXPIRED: Integer read _GetDATA_PLAN_EXPIRED;
    {class} property DATA_ROAMING_SETTINGS_DISABLED: Integer read _GetDATA_ROAMING_SETTINGS_DISABLED;
    {class} property DATA_SETTINGS_DISABLED: Integer read _GetDATA_SETTINGS_DISABLED;
    {class} property DBM_OR_SMS_IN_PROGRESS: Integer read _GetDBM_OR_SMS_IN_PROGRESS;
    {class} property DDS_SWITCHED: Integer read _GetDDS_SWITCHED;
    {class} property DDS_SWITCH_IN_PROGRESS: Integer read _GetDDS_SWITCH_IN_PROGRESS;
    {class} property DRB_RELEASED_BY_RRC: Integer read _GetDRB_RELEASED_BY_RRC;
    {class} property DS_EXPLICIT_DEACTIVATION: Integer read _GetDS_EXPLICIT_DEACTIVATION;
    {class} property DUAL_SWITCH: Integer read _GetDUAL_SWITCH;
    {class} property DUN_CALL_DISALLOWED: Integer read _GetDUN_CALL_DISALLOWED;
    {class} property DUPLICATE_BEARER_ID: Integer read _GetDUPLICATE_BEARER_ID;
    {class} property EHRPD_TO_HRPD_FALLBACK: Integer read _GetEHRPD_TO_HRPD_FALLBACK;
    {class} property EMBMS_NOT_ENABLED: Integer read _GetEMBMS_NOT_ENABLED;
    {class} property EMBMS_REGULAR_DEACTIVATION: Integer read _GetEMBMS_REGULAR_DEACTIVATION;
    {class} property EMERGENCY_IFACE_ONLY: Integer read _GetEMERGENCY_IFACE_ONLY;
    {class} property EMERGENCY_MODE: Integer read _GetEMERGENCY_MODE;
    {class} property EMM_ACCESS_BARRED: Integer read _GetEMM_ACCESS_BARRED;
    {class} property EMM_ACCESS_BARRED_INFINITE_RETRY: Integer read _GetEMM_ACCESS_BARRED_INFINITE_RETRY;
    {class} property EMM_ATTACH_FAILED: Integer read _GetEMM_ATTACH_FAILED;
    {class} property EMM_ATTACH_STARTED: Integer read _GetEMM_ATTACH_STARTED;
    {class} property EMM_DETACHED: Integer read _GetEMM_DETACHED;
    {class} property EMM_T3417_EXPIRED: Integer read _GetEMM_T3417_EXPIRED;
    {class} property EMM_T3417_EXT_EXPIRED: Integer read _GetEMM_T3417_EXT_EXPIRED;
    {class} property EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED: Integer read _GetEPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED;
    {class} property EPS_SERVICES_NOT_ALLOWED_IN_PLMN: Integer read _GetEPS_SERVICES_NOT_ALLOWED_IN_PLMN;
    {class} property ERROR_UNSPECIFIED: Integer read _GetERROR_UNSPECIFIED;
    {class} property ESM_BAD_OTA_MESSAGE: Integer read _GetESM_BAD_OTA_MESSAGE;
    {class} property ESM_BEARER_DEACTIVATED_TO_SYNC_WITH_NETWORK: Integer read _GetESM_BEARER_DEACTIVATED_TO_SYNC_WITH_NETWORK;
    {class} property ESM_COLLISION_SCENARIOS: Integer read _GetESM_COLLISION_SCENARIOS;
    {class} property ESM_CONTEXT_TRANSFERRED_DUE_TO_IRAT: Integer read _GetESM_CONTEXT_TRANSFERRED_DUE_TO_IRAT;
    {class} property ESM_DOWNLOAD_SERVER_REJECTED_THE_CALL: Integer read _GetESM_DOWNLOAD_SERVER_REJECTED_THE_CALL;
    {class} property ESM_FAILURE: Integer read _GetESM_FAILURE;
    {class} property ESM_INFO_NOT_RECEIVED: Integer read _GetESM_INFO_NOT_RECEIVED;
    {class} property ESM_LOCAL_CAUSE_NONE: Integer read _GetESM_LOCAL_CAUSE_NONE;
    {class} property ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER: Integer read _GetESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER;
    {class} property ESM_PROCEDURE_TIME_OUT: Integer read _GetESM_PROCEDURE_TIME_OUT;
    {class} property ESM_UNKNOWN_EPS_BEARER_CONTEXT: Integer read _GetESM_UNKNOWN_EPS_BEARER_CONTEXT;
    {class} property EVDO_CONNECTION_DENY_BY_BILLING_OR_AUTHENTICATION_FAILURE: Integer read _GetEVDO_CONNECTION_DENY_BY_BILLING_OR_AUTHENTICATION_FAILURE;
    {class} property EVDO_CONNECTION_DENY_BY_GENERAL_OR_NETWORK_BUSY: Integer read _GetEVDO_CONNECTION_DENY_BY_GENERAL_OR_NETWORK_BUSY;
    {class} property EVDO_HDR_CHANGED: Integer read _GetEVDO_HDR_CHANGED;
    {class} property EVDO_HDR_CONNECTION_SETUP_TIMEOUT: Integer read _GetEVDO_HDR_CONNECTION_SETUP_TIMEOUT;
    {class} property EVDO_HDR_EXITED: Integer read _GetEVDO_HDR_EXITED;
    {class} property EVDO_HDR_NO_SESSION: Integer read _GetEVDO_HDR_NO_SESSION;
    {class} property EVDO_USING_GPS_FIX_INSTEAD_OF_HDR_CALL: Integer read _GetEVDO_USING_GPS_FIX_INSTEAD_OF_HDR_CALL;
    {class} property FADE: Integer read _GetFADE;
    {class} property FAILED_TO_ACQUIRE_COLOCATED_HDR: Integer read _GetFAILED_TO_ACQUIRE_COLOCATED_HDR;
    {class} property FEATURE_NOT_SUPP: Integer read _GetFEATURE_NOT_SUPP;
    {class} property FILTER_SEMANTIC_ERROR: Integer read _GetFILTER_SEMANTIC_ERROR;
    {class} property FILTER_SYTAX_ERROR: Integer read _GetFILTER_SYTAX_ERROR;
    {class} property FORBIDDEN_APN_NAME: Integer read _GetFORBIDDEN_APN_NAME;
    {class} property GPRS_REGISTRATION_FAIL: Integer read _GetGPRS_REGISTRATION_FAIL;
    {class} property GPRS_SERVICES_AND_NON_GPRS_SERVICES_NOT_ALLOWED: Integer read _GetGPRS_SERVICES_AND_NON_GPRS_SERVICES_NOT_ALLOWED;
    {class} property GPRS_SERVICES_NOT_ALLOWED: Integer read _GetGPRS_SERVICES_NOT_ALLOWED;
    {class} property GPRS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN: Integer read _GetGPRS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN;
    {class} property HANDOFF_PREFERENCE_CHANGED: Integer read _GetHANDOFF_PREFERENCE_CHANGED;
    {class} property HDR_ACCESS_FAILURE: Integer read _GetHDR_ACCESS_FAILURE;
    {class} property HDR_FADE: Integer read _GetHDR_FADE;
    {class} property HDR_NO_LOCK_GRANTED: Integer read _GetHDR_NO_LOCK_GRANTED;
    {class} property IFACE_AND_POL_FAMILY_MISMATCH: Integer read _GetIFACE_AND_POL_FAMILY_MISMATCH;
    {class} property IFACE_MISMATCH: Integer read _GetIFACE_MISMATCH;
    {class} property ILLEGAL_ME: Integer read _GetILLEGAL_ME;
    {class} property ILLEGAL_MS: Integer read _GetILLEGAL_MS;
    {class} property IMEI_NOT_ACCEPTED: Integer read _GetIMEI_NOT_ACCEPTED;
    {class} property IMPLICITLY_DETACHED: Integer read _GetIMPLICITLY_DETACHED;
    {class} property IMSI_UNKNOWN_IN_HOME_SUBSCRIBER_SERVER: Integer read _GetIMSI_UNKNOWN_IN_HOME_SUBSCRIBER_SERVER;
    {class} property INCOMING_CALL_REJECTED: Integer read _GetINCOMING_CALL_REJECTED;
    {class} property INSUFFICIENT_RESOURCES: Integer read _GetINSUFFICIENT_RESOURCES;
    {class} property INTERFACE_IN_USE: Integer read _GetINTERFACE_IN_USE;
    {class} property INTERNAL_CALL_PREEMPT_BY_HIGH_PRIO_APN: Integer read _GetINTERNAL_CALL_PREEMPT_BY_HIGH_PRIO_APN;
    {class} property INTERNAL_EPC_NONEPC_TRANSITION: Integer read _GetINTERNAL_EPC_NONEPC_TRANSITION;
    {class} property INVALID_CONNECTION_ID: Integer read _GetINVALID_CONNECTION_ID;
    {class} property INVALID_DNS_ADDR: Integer read _GetINVALID_DNS_ADDR;
    {class} property INVALID_EMM_STATE: Integer read _GetINVALID_EMM_STATE;
    {class} property INVALID_MANDATORY_INFO: Integer read _GetINVALID_MANDATORY_INFO;
    {class} property INVALID_MODE: Integer read _GetINVALID_MODE;
    {class} property INVALID_PCSCF_ADDR: Integer read _GetINVALID_PCSCF_ADDR;
    {class} property INVALID_PCSCF_OR_DNS_ADDRESS: Integer read _GetINVALID_PCSCF_OR_DNS_ADDRESS;
    {class} property INVALID_PRIMARY_NSAPI: Integer read _GetINVALID_PRIMARY_NSAPI;
    {class} property INVALID_SIM_STATE: Integer read _GetINVALID_SIM_STATE;
    {class} property INVALID_TRANSACTION_ID: Integer read _GetINVALID_TRANSACTION_ID;
    {class} property IPV6_ADDRESS_TRANSFER_FAILED: Integer read _GetIPV6_ADDRESS_TRANSFER_FAILED;
    {class} property IPV6_PREFIX_UNAVAILABLE: Integer read _GetIPV6_PREFIX_UNAVAILABLE;
    {class} property IP_ADDRESS_MISMATCH: Integer read _GetIP_ADDRESS_MISMATCH;
    {class} property IP_VERSION_MISMATCH: Integer read _GetIP_VERSION_MISMATCH;
    {class} property IRAT_HANDOVER_FAILED: Integer read _GetIRAT_HANDOVER_FAILED;
    {class} property IS707B_MAX_ACCESS_PROBES: Integer read _GetIS707B_MAX_ACCESS_PROBES;
    {class} property IWLAN_AUTHORIZATION_REJECTED: Integer read _GetIWLAN_AUTHORIZATION_REJECTED;
    {class} property IWLAN_DNS_RESOLUTION_NAME_FAILURE: Integer read _GetIWLAN_DNS_RESOLUTION_NAME_FAILURE;
    {class} property IWLAN_DNS_RESOLUTION_TIMEOUT: Integer read _GetIWLAN_DNS_RESOLUTION_TIMEOUT;
    {class} property IWLAN_IKEV2_AUTH_FAILURE: Integer read _GetIWLAN_IKEV2_AUTH_FAILURE;
    {class} property IWLAN_IKEV2_CERT_INVALID: Integer read _GetIWLAN_IKEV2_CERT_INVALID;
    {class} property IWLAN_IKEV2_CONFIG_FAILURE: Integer read _GetIWLAN_IKEV2_CONFIG_FAILURE;
    {class} property IWLAN_IKEV2_MSG_TIMEOUT: Integer read _GetIWLAN_IKEV2_MSG_TIMEOUT;
    {class} property IWLAN_ILLEGAL_ME: Integer read _GetIWLAN_ILLEGAL_ME;
    {class} property IWLAN_IMEI_NOT_ACCEPTED: Integer read _GetIWLAN_IMEI_NOT_ACCEPTED;
    {class} property IWLAN_MAX_CONNECTION_REACHED: Integer read _GetIWLAN_MAX_CONNECTION_REACHED;
    {class} property IWLAN_NETWORK_FAILURE: Integer read _GetIWLAN_NETWORK_FAILURE;
    {class} property IWLAN_NON_3GPP_ACCESS_TO_EPC_NOT_ALLOWED: Integer read _GetIWLAN_NON_3GPP_ACCESS_TO_EPC_NOT_ALLOWED;
    {class} property IWLAN_NO_APN_SUBSCRIPTION: Integer read _GetIWLAN_NO_APN_SUBSCRIPTION;
    {class} property IWLAN_PDN_CONNECTION_REJECTION: Integer read _GetIWLAN_PDN_CONNECTION_REJECTION;
    {class} property IWLAN_PLMN_NOT_ALLOWED: Integer read _GetIWLAN_PLMN_NOT_ALLOWED;
    {class} property IWLAN_RAT_TYPE_NOT_ALLOWED: Integer read _GetIWLAN_RAT_TYPE_NOT_ALLOWED;
    {class} property IWLAN_SEMANTIC_ERRORS_IN_PACKET_FILTERS: Integer read _GetIWLAN_SEMANTIC_ERRORS_IN_PACKET_FILTERS;
    {class} property IWLAN_SEMANTIC_ERROR_IN_THE_TFT_OPERATION: Integer read _GetIWLAN_SEMANTIC_ERROR_IN_THE_TFT_OPERATION;
    {class} property IWLAN_SYNTACTICAL_ERRORS_IN_PACKET_FILTERS: Integer read _GetIWLAN_SYNTACTICAL_ERRORS_IN_PACKET_FILTERS;
    {class} property IWLAN_SYNTACTICAL_ERROR_IN_THE_TFT_OPERATION: Integer read _GetIWLAN_SYNTACTICAL_ERROR_IN_THE_TFT_OPERATION;
    {class} property IWLAN_UNAUTHENTICATED_EMERGENCY_NOT_SUPPORTED: Integer read _GetIWLAN_UNAUTHENTICATED_EMERGENCY_NOT_SUPPORTED;
    {class} property IWLAN_USER_UNKNOWN: Integer read _GetIWLAN_USER_UNKNOWN;
    {class} property LIMITED_TO_IPV4: Integer read _GetLIMITED_TO_IPV4;
    {class} property LIMITED_TO_IPV6: Integer read _GetLIMITED_TO_IPV6;
    {class} property LLC_SNDCP: Integer read _GetLLC_SNDCP;
    {class} property LOCAL_END: Integer read _GetLOCAL_END;
    {class} property LOCATION_AREA_NOT_ALLOWED: Integer read _GetLOCATION_AREA_NOT_ALLOWED;
    {class} property LOST_CONNECTION: Integer read _GetLOST_CONNECTION;
    {class} property LOWER_LAYER_REGISTRATION_FAILURE: Integer read _GetLOWER_LAYER_REGISTRATION_FAILURE;
    {class} property LOW_POWER_MODE_OR_POWERING_DOWN: Integer read _GetLOW_POWER_MODE_OR_POWERING_DOWN;
    {class} property LTE_NAS_SERVICE_REQUEST_FAILED: Integer read _GetLTE_NAS_SERVICE_REQUEST_FAILED;
    {class} property LTE_THROTTLING_NOT_REQUIRED: Integer read _GetLTE_THROTTLING_NOT_REQUIRED;
    {class} property MAC_FAILURE: Integer read _GetMAC_FAILURE;
    {class} property MATCH_ALL_RULE_NOT_ALLOWED: Integer read _GetMATCH_ALL_RULE_NOT_ALLOWED;
    {class} property MAXIMIUM_NSAPIS_EXCEEDED: Integer read _GetMAXIMIUM_NSAPIS_EXCEEDED;
    {class} property MAXINUM_SIZE_OF_L2_MESSAGE_EXCEEDED: Integer read _GetMAXINUM_SIZE_OF_L2_MESSAGE_EXCEEDED;
    {class} property MAX_ACCESS_PROBE: Integer read _GetMAX_ACCESS_PROBE;
    {class} property MAX_IPV4_CONNECTIONS: Integer read _GetMAX_IPV4_CONNECTIONS;
    {class} property MAX_IPV6_CONNECTIONS: Integer read _GetMAX_IPV6_CONNECTIONS;
    {class} property MAX_PPP_INACTIVITY_TIMER_EXPIRED: Integer read _GetMAX_PPP_INACTIVITY_TIMER_EXPIRED;
    {class} property MESSAGE_INCORRECT_SEMANTIC: Integer read _GetMESSAGE_INCORRECT_SEMANTIC;
    {class} property MESSAGE_TYPE_UNSUPPORTED: Integer read _GetMESSAGE_TYPE_UNSUPPORTED;
    {class} property MIP_CONFIG_FAILURE: Integer read _GetMIP_CONFIG_FAILURE;
    {class} property MIP_FA_ADMIN_PROHIBITED: Integer read _GetMIP_FA_ADMIN_PROHIBITED;
    {class} property MIP_FA_DELIVERY_STYLE_NOT_SUPPORTED: Integer read _GetMIP_FA_DELIVERY_STYLE_NOT_SUPPORTED;
    {class} property MIP_FA_ENCAPSULATION_UNAVAILABLE: Integer read _GetMIP_FA_ENCAPSULATION_UNAVAILABLE;
    {class} property MIP_FA_HOME_AGENT_AUTHENTICATION_FAILURE: Integer read _GetMIP_FA_HOME_AGENT_AUTHENTICATION_FAILURE;
    {class} property MIP_FA_INSUFFICIENT_RESOURCES: Integer read _GetMIP_FA_INSUFFICIENT_RESOURCES;
    {class} property MIP_FA_MALFORMED_REPLY: Integer read _GetMIP_FA_MALFORMED_REPLY;
    {class} property MIP_FA_MALFORMED_REQUEST: Integer read _GetMIP_FA_MALFORMED_REQUEST;
    {class} property MIP_FA_MISSING_CHALLENGE: Integer read _GetMIP_FA_MISSING_CHALLENGE;
    {class} property MIP_FA_MISSING_HOME_ADDRESS: Integer read _GetMIP_FA_MISSING_HOME_ADDRESS;
    {class} property MIP_FA_MISSING_HOME_AGENT: Integer read _GetMIP_FA_MISSING_HOME_AGENT;
    {class} property MIP_FA_MISSING_NAI: Integer read _GetMIP_FA_MISSING_NAI;
    {class} property MIP_FA_MOBILE_NODE_AUTHENTICATION_FAILURE: Integer read _GetMIP_FA_MOBILE_NODE_AUTHENTICATION_FAILURE;
    {class} property MIP_FA_REASON_UNSPECIFIED: Integer read _GetMIP_FA_REASON_UNSPECIFIED;
    {class} property MIP_FA_REQUESTED_LIFETIME_TOO_LONG: Integer read _GetMIP_FA_REQUESTED_LIFETIME_TOO_LONG;
    {class} property MIP_FA_REVERSE_TUNNEL_IS_MANDATORY: Integer read _GetMIP_FA_REVERSE_TUNNEL_IS_MANDATORY;
    {class} property MIP_FA_REVERSE_TUNNEL_UNAVAILABLE: Integer read _GetMIP_FA_REVERSE_TUNNEL_UNAVAILABLE;
    {class} property MIP_FA_STALE_CHALLENGE: Integer read _GetMIP_FA_STALE_CHALLENGE;
    {class} property MIP_FA_UNKNOWN_CHALLENGE: Integer read _GetMIP_FA_UNKNOWN_CHALLENGE;
    {class} property MIP_FA_VJ_HEADER_COMPRESSION_UNAVAILABLE: Integer read _GetMIP_FA_VJ_HEADER_COMPRESSION_UNAVAILABLE;
    {class} property MIP_HA_ADMIN_PROHIBITED: Integer read _GetMIP_HA_ADMIN_PROHIBITED;
    {class} property MIP_HA_ENCAPSULATION_UNAVAILABLE: Integer read _GetMIP_HA_ENCAPSULATION_UNAVAILABLE;
    {class} property MIP_HA_FOREIGN_AGENT_AUTHENTICATION_FAILURE: Integer read _GetMIP_HA_FOREIGN_AGENT_AUTHENTICATION_FAILURE;
    {class} property MIP_HA_INSUFFICIENT_RESOURCES: Integer read _GetMIP_HA_INSUFFICIENT_RESOURCES;
    {class} property MIP_HA_MALFORMED_REQUEST: Integer read _GetMIP_HA_MALFORMED_REQUEST;
    {class} property MIP_HA_MOBILE_NODE_AUTHENTICATION_FAILURE: Integer read _GetMIP_HA_MOBILE_NODE_AUTHENTICATION_FAILURE;
    {class} property MIP_HA_REASON_UNSPECIFIED: Integer read _GetMIP_HA_REASON_UNSPECIFIED;
    {class} property MIP_HA_REGISTRATION_ID_MISMATCH: Integer read _GetMIP_HA_REGISTRATION_ID_MISMATCH;
    {class} property MIP_HA_REVERSE_TUNNEL_IS_MANDATORY: Integer read _GetMIP_HA_REVERSE_TUNNEL_IS_MANDATORY;
    {class} property MIP_HA_REVERSE_TUNNEL_UNAVAILABLE: Integer read _GetMIP_HA_REVERSE_TUNNEL_UNAVAILABLE;
    {class} property MIP_HA_UNKNOWN_HOME_AGENT_ADDRESS: Integer read _GetMIP_HA_UNKNOWN_HOME_AGENT_ADDRESS;
    {class} property MISSING_UNKNOWN_APN: Integer read _GetMISSING_UNKNOWN_APN;
    {class} property MODEM_APP_PREEMPTED: Integer read _GetMODEM_APP_PREEMPTED;
    {class} property MODEM_RESTART: Integer read _GetMODEM_RESTART;
    {class} property MSC_TEMPORARILY_NOT_REACHABLE: Integer read _GetMSC_TEMPORARILY_NOT_REACHABLE;
    {class} property MSG_AND_PROTOCOL_STATE_UNCOMPATIBLE: Integer read _GetMSG_AND_PROTOCOL_STATE_UNCOMPATIBLE;
    {class} property MSG_TYPE_NONCOMPATIBLE_STATE: Integer read _GetMSG_TYPE_NONCOMPATIBLE_STATE;
    {class} property MS_IDENTITY_CANNOT_BE_DERIVED_BY_THE_NETWORK: Integer read _GetMS_IDENTITY_CANNOT_BE_DERIVED_BY_THE_NETWORK;
    {class} property MULTIPLE_PDP_CALL_NOT_ALLOWED: Integer read _GetMULTIPLE_PDP_CALL_NOT_ALLOWED;
    {class} property MULTI_CONN_TO_SAME_PDN_NOT_ALLOWED: Integer read _GetMULTI_CONN_TO_SAME_PDN_NOT_ALLOWED;
    {class} property NAS_LAYER_FAILURE: Integer read _GetNAS_LAYER_FAILURE;
    {class} property NAS_REQUEST_REJECTED_BY_NETWORK: Integer read _GetNAS_REQUEST_REJECTED_BY_NETWORK;
    {class} property NAS_SIGNALLING: Integer read _GetNAS_SIGNALLING;
    {class} property NETWORK_FAILURE: Integer read _GetNETWORK_FAILURE;
    {class} property NETWORK_INITIATED_DETACH_NO_AUTO_REATTACH: Integer read _GetNETWORK_INITIATED_DETACH_NO_AUTO_REATTACH;
    {class} property NETWORK_INITIATED_DETACH_WITH_AUTO_REATTACH: Integer read _GetNETWORK_INITIATED_DETACH_WITH_AUTO_REATTACH;
    {class} property NETWORK_INITIATED_TERMINATION: Integer read _GetNETWORK_INITIATED_TERMINATION;
    {class} property NONE: Integer read _GetNONE;
    {class} property NON_IP_NOT_SUPPORTED: Integer read _GetNON_IP_NOT_SUPPORTED;
    {class} property NORMAL_RELEASE: Integer read _GetNORMAL_RELEASE;
    {class} property NO_CDMA_SERVICE: Integer read _GetNO_CDMA_SERVICE;
    {class} property NO_COLLOCATED_HDR: Integer read _GetNO_COLLOCATED_HDR;
    {class} property NO_EPS_BEARER_CONTEXT_ACTIVATED: Integer read _GetNO_EPS_BEARER_CONTEXT_ACTIVATED;
    {class} property NO_GPRS_CONTEXT: Integer read _GetNO_GPRS_CONTEXT;
    {class} property NO_HYBRID_HDR_SERVICE: Integer read _GetNO_HYBRID_HDR_SERVICE;
    {class} property NO_PDP_CONTEXT_ACTIVATED: Integer read _GetNO_PDP_CONTEXT_ACTIVATED;
    {class} property NO_RESPONSE_FROM_BASE_STATION: Integer read _GetNO_RESPONSE_FROM_BASE_STATION;
    {class} property NO_SERVICE: Integer read _GetNO_SERVICE;
    {class} property NO_SERVICE_ON_GATEWAY: Integer read _GetNO_SERVICE_ON_GATEWAY;
    {class} property NSAPI_IN_USE: Integer read _GetNSAPI_IN_USE;
    {class} property NULL_APN_DISALLOWED: Integer read _GetNULL_APN_DISALLOWED;
    {class} property OEM_DCFAILCAUSE_1: Integer read _GetOEM_DCFAILCAUSE_1;
    {class} property OEM_DCFAILCAUSE_10: Integer read _GetOEM_DCFAILCAUSE_10;
    {class} property OEM_DCFAILCAUSE_11: Integer read _GetOEM_DCFAILCAUSE_11;
    {class} property OEM_DCFAILCAUSE_12: Integer read _GetOEM_DCFAILCAUSE_12;
    {class} property OEM_DCFAILCAUSE_13: Integer read _GetOEM_DCFAILCAUSE_13;
    {class} property OEM_DCFAILCAUSE_14: Integer read _GetOEM_DCFAILCAUSE_14;
    {class} property OEM_DCFAILCAUSE_15: Integer read _GetOEM_DCFAILCAUSE_15;
    {class} property OEM_DCFAILCAUSE_2: Integer read _GetOEM_DCFAILCAUSE_2;
    {class} property OEM_DCFAILCAUSE_3: Integer read _GetOEM_DCFAILCAUSE_3;
    {class} property OEM_DCFAILCAUSE_4: Integer read _GetOEM_DCFAILCAUSE_4;
    {class} property OEM_DCFAILCAUSE_5: Integer read _GetOEM_DCFAILCAUSE_5;
    {class} property OEM_DCFAILCAUSE_6: Integer read _GetOEM_DCFAILCAUSE_6;
    {class} property OEM_DCFAILCAUSE_7: Integer read _GetOEM_DCFAILCAUSE_7;
    {class} property OEM_DCFAILCAUSE_8: Integer read _GetOEM_DCFAILCAUSE_8;
    {class} property OEM_DCFAILCAUSE_9: Integer read _GetOEM_DCFAILCAUSE_9;
    {class} property ONLY_IPV4V6_ALLOWED: Integer read _GetONLY_IPV4V6_ALLOWED;
    {class} property ONLY_IPV4_ALLOWED: Integer read _GetONLY_IPV4_ALLOWED;
    {class} property ONLY_IPV6_ALLOWED: Integer read _GetONLY_IPV6_ALLOWED;
    {class} property ONLY_NON_IP_ALLOWED: Integer read _GetONLY_NON_IP_ALLOWED;
    {class} property ONLY_SINGLE_BEARER_ALLOWED: Integer read _GetONLY_SINGLE_BEARER_ALLOWED;
    {class} property OPERATOR_BARRED: Integer read _GetOPERATOR_BARRED;
    {class} property OTASP_COMMIT_IN_PROGRESS: Integer read _GetOTASP_COMMIT_IN_PROGRESS;
    {class} property PDN_CONN_DOES_NOT_EXIST: Integer read _GetPDN_CONN_DOES_NOT_EXIST;
    {class} property PDN_INACTIVITY_TIMER_EXPIRED: Integer read _GetPDN_INACTIVITY_TIMER_EXPIRED;
    {class} property PDN_IPV4_CALL_DISALLOWED: Integer read _GetPDN_IPV4_CALL_DISALLOWED;
    {class} property PDN_IPV4_CALL_THROTTLED: Integer read _GetPDN_IPV4_CALL_THROTTLED;
    {class} property PDN_IPV6_CALL_DISALLOWED: Integer read _GetPDN_IPV6_CALL_DISALLOWED;
    {class} property PDN_IPV6_CALL_THROTTLED: Integer read _GetPDN_IPV6_CALL_THROTTLED;
    {class} property PDN_NON_IP_CALL_DISALLOWED: Integer read _GetPDN_NON_IP_CALL_DISALLOWED;
    {class} property PDN_NON_IP_CALL_THROTTLED: Integer read _GetPDN_NON_IP_CALL_THROTTLED;
    {class} property PDP_ACTIVATE_MAX_RETRY_FAILED: Integer read _GetPDP_ACTIVATE_MAX_RETRY_FAILED;
    {class} property PDP_DUPLICATE: Integer read _GetPDP_DUPLICATE;
    {class} property PDP_ESTABLISH_TIMEOUT_EXPIRED: Integer read _GetPDP_ESTABLISH_TIMEOUT_EXPIRED;
    {class} property PDP_INACTIVE_TIMEOUT_EXPIRED: Integer read _GetPDP_INACTIVE_TIMEOUT_EXPIRED;
    {class} property PDP_LOWERLAYER_ERROR: Integer read _GetPDP_LOWERLAYER_ERROR;
    {class} property PDP_MODIFY_COLLISION: Integer read _GetPDP_MODIFY_COLLISION;
    {class} property PDP_MODIFY_TIMEOUT_EXPIRED: Integer read _GetPDP_MODIFY_TIMEOUT_EXPIRED;
    {class} property PDP_PPP_NOT_SUPPORTED: Integer read _GetPDP_PPP_NOT_SUPPORTED;
    {class} property PDP_WITHOUT_ACTIVE_TFT: Integer read _GetPDP_WITHOUT_ACTIVE_TFT;
    {class} property PHONE_IN_USE: Integer read _GetPHONE_IN_USE;
    {class} property PHYSICAL_LINK_CLOSE_IN_PROGRESS: Integer read _GetPHYSICAL_LINK_CLOSE_IN_PROGRESS;
    {class} property PLMN_NOT_ALLOWED: Integer read _GetPLMN_NOT_ALLOWED;
    {class} property PPP_AUTH_FAILURE: Integer read _GetPPP_AUTH_FAILURE;
    {class} property PPP_CHAP_FAILURE: Integer read _GetPPP_CHAP_FAILURE;
    {class} property PPP_CLOSE_IN_PROGRESS: Integer read _GetPPP_CLOSE_IN_PROGRESS;
    {class} property PPP_OPTION_MISMATCH: Integer read _GetPPP_OPTION_MISMATCH;
    {class} property PPP_PAP_FAILURE: Integer read _GetPPP_PAP_FAILURE;
    {class} property PPP_TIMEOUT: Integer read _GetPPP_TIMEOUT;
    {class} property PREF_RADIO_TECH_CHANGED: Integer read _GetPREF_RADIO_TECH_CHANGED;
    {class} property PROFILE_BEARER_INCOMPATIBLE: Integer read _GetPROFILE_BEARER_INCOMPATIBLE;
    {class} property PROTOCOL_ERRORS: Integer read _GetPROTOCOL_ERRORS;
    {class} property QOS_NOT_ACCEPTED: Integer read _GetQOS_NOT_ACCEPTED;
    {class} property RADIO_ACCESS_BEARER_FAILURE: Integer read _GetRADIO_ACCESS_BEARER_FAILURE;
    {class} property RADIO_ACCESS_BEARER_SETUP_FAILURE: Integer read _GetRADIO_ACCESS_BEARER_SETUP_FAILURE;
    {class} property RADIO_NOT_AVAILABLE: Integer read _GetRADIO_NOT_AVAILABLE;
    {class} property RADIO_POWER_OFF: Integer read _GetRADIO_POWER_OFF;
    {class} property REDIRECTION_OR_HANDOFF_IN_PROGRESS: Integer read _GetREDIRECTION_OR_HANDOFF_IN_PROGRESS;
    {class} property REGISTRATION_FAIL: Integer read _GetREGISTRATION_FAIL;
    {class} property REGULAR_DEACTIVATION: Integer read _GetREGULAR_DEACTIVATION;
    {class} property REJECTED_BY_BASE_STATION: Integer read _GetREJECTED_BY_BASE_STATION;
    {class} property RRC_CONNECTION_ABORTED_AFTER_HANDOVER: Integer read _GetRRC_CONNECTION_ABORTED_AFTER_HANDOVER;
    {class} property RRC_CONNECTION_ABORTED_AFTER_IRAT_CELL_CHANGE: Integer read _GetRRC_CONNECTION_ABORTED_AFTER_IRAT_CELL_CHANGE;
    {class} property RRC_CONNECTION_ABORTED_DUE_TO_IRAT_CHANGE: Integer read _GetRRC_CONNECTION_ABORTED_DUE_TO_IRAT_CHANGE;
    {class} property RRC_CONNECTION_ABORTED_DURING_IRAT_CELL_CHANGE: Integer read _GetRRC_CONNECTION_ABORTED_DURING_IRAT_CELL_CHANGE;
    {class} property RRC_CONNECTION_ABORT_REQUEST: Integer read _GetRRC_CONNECTION_ABORT_REQUEST;
    {class} property RRC_CONNECTION_ACCESS_BARRED: Integer read _GetRRC_CONNECTION_ACCESS_BARRED;
    {class} property RRC_CONNECTION_ACCESS_STRATUM_FAILURE: Integer read _GetRRC_CONNECTION_ACCESS_STRATUM_FAILURE;
    {class} property RRC_CONNECTION_ANOTHER_PROCEDURE_IN_PROGRESS: Integer read _GetRRC_CONNECTION_ANOTHER_PROCEDURE_IN_PROGRESS;
    {class} property RRC_CONNECTION_CELL_NOT_CAMPED: Integer read _GetRRC_CONNECTION_CELL_NOT_CAMPED;
    {class} property RRC_CONNECTION_CELL_RESELECTION: Integer read _GetRRC_CONNECTION_CELL_RESELECTION;
    {class} property RRC_CONNECTION_CONFIG_FAILURE: Integer read _GetRRC_CONNECTION_CONFIG_FAILURE;
    {class} property RRC_CONNECTION_INVALID_REQUEST: Integer read _GetRRC_CONNECTION_INVALID_REQUEST;
    {class} property RRC_CONNECTION_LINK_FAILURE: Integer read _GetRRC_CONNECTION_LINK_FAILURE;
    {class} property RRC_CONNECTION_NORMAL_RELEASE: Integer read _GetRRC_CONNECTION_NORMAL_RELEASE;
    {class} property RRC_CONNECTION_OUT_OF_SERVICE_DURING_CELL_REGISTER: Integer read _GetRRC_CONNECTION_OUT_OF_SERVICE_DURING_CELL_REGISTER;
    {class} property RRC_CONNECTION_RADIO_LINK_FAILURE: Integer read _GetRRC_CONNECTION_RADIO_LINK_FAILURE;
    {class} property RRC_CONNECTION_REESTABLISHMENT_FAILURE: Integer read _GetRRC_CONNECTION_REESTABLISHMENT_FAILURE;
    {class} property RRC_CONNECTION_REJECT_BY_NETWORK: Integer read _GetRRC_CONNECTION_REJECT_BY_NETWORK;
    {class} property RRC_CONNECTION_RELEASED_SECURITY_NOT_ACTIVE: Integer read _GetRRC_CONNECTION_RELEASED_SECURITY_NOT_ACTIVE;
    {class} property RRC_CONNECTION_RF_UNAVAILABLE: Integer read _GetRRC_CONNECTION_RF_UNAVAILABLE;
    {class} property RRC_CONNECTION_SYSTEM_INFORMATION_BLOCK_READ_ERROR: Integer read _GetRRC_CONNECTION_SYSTEM_INFORMATION_BLOCK_READ_ERROR;
    {class} property RRC_CONNECTION_SYSTEM_INTERVAL_FAILURE: Integer read _GetRRC_CONNECTION_SYSTEM_INTERVAL_FAILURE;
    {class} property RRC_CONNECTION_TIMER_EXPIRED: Integer read _GetRRC_CONNECTION_TIMER_EXPIRED;
    {class} property RRC_CONNECTION_TRACKING_AREA_ID_CHANGED: Integer read _GetRRC_CONNECTION_TRACKING_AREA_ID_CHANGED;
    {class} property RRC_UPLINK_CONNECTION_RELEASE: Integer read _GetRRC_UPLINK_CONNECTION_RELEASE;
    {class} property RRC_UPLINK_DATA_TRANSMISSION_FAILURE: Integer read _GetRRC_UPLINK_DATA_TRANSMISSION_FAILURE;
    {class} property RRC_UPLINK_DELIVERY_FAILED_DUE_TO_HANDOVER: Integer read _GetRRC_UPLINK_DELIVERY_FAILED_DUE_TO_HANDOVER;
    {class} property RRC_UPLINK_ERROR_REQUEST_FROM_NAS: Integer read _GetRRC_UPLINK_ERROR_REQUEST_FROM_NAS;
    {class} property RRC_UPLINK_RADIO_LINK_FAILURE: Integer read _GetRRC_UPLINK_RADIO_LINK_FAILURE;
    {class} property RUIM_NOT_PRESENT: Integer read _GetRUIM_NOT_PRESENT;
    {class} property SECURITY_MODE_REJECTED: Integer read _GetSECURITY_MODE_REJECTED;
    {class} property SERVICE_NOT_ALLOWED_ON_PLMN: Integer read _GetSERVICE_NOT_ALLOWED_ON_PLMN;
    {class} property SERVICE_OPTION_NOT_SUBSCRIBED: Integer read _GetSERVICE_OPTION_NOT_SUBSCRIBED;
    {class} property SERVICE_OPTION_NOT_SUPPORTED: Integer read _GetSERVICE_OPTION_NOT_SUPPORTED;
    {class} property SERVICE_OPTION_OUT_OF_ORDER: Integer read _GetSERVICE_OPTION_OUT_OF_ORDER;
    {class} property SIGNAL_LOST: Integer read _GetSIGNAL_LOST;
    {class} property SIM_CARD_CHANGED: Integer read _GetSIM_CARD_CHANGED;
    {class} property SLICE_REJECTED: Integer read _GetSLICE_REJECTED;
    {class} property SYNCHRONIZATION_FAILURE: Integer read _GetSYNCHRONIZATION_FAILURE;
    {class} property TEST_LOOPBACK_REGULAR_DEACTIVATION: Integer read _GetTEST_LOOPBACK_REGULAR_DEACTIVATION;
    {class} property TETHERED_CALL_ACTIVE: Integer read _GetTETHERED_CALL_ACTIVE;
    {class} property TFT_SEMANTIC_ERROR: Integer read _GetTFT_SEMANTIC_ERROR;
    {class} property TFT_SYTAX_ERROR: Integer read _GetTFT_SYTAX_ERROR;
    {class} property THERMAL_EMERGENCY: Integer read _GetTHERMAL_EMERGENCY;
    {class} property THERMAL_MITIGATION: Integer read _GetTHERMAL_MITIGATION;
    {class} property TRAT_SWAP_FAILED: Integer read _GetTRAT_SWAP_FAILED;
    {class} property UE_INITIATED_DETACH_OR_DISCONNECT: Integer read _GetUE_INITIATED_DETACH_OR_DISCONNECT;
    {class} property UE_IS_ENTERING_POWERSAVE_MODE: Integer read _GetUE_IS_ENTERING_POWERSAVE_MODE;
    {class} property UE_RAT_CHANGE: Integer read _GetUE_RAT_CHANGE;
    {class} property UE_SECURITY_CAPABILITIES_MISMATCH: Integer read _GetUE_SECURITY_CAPABILITIES_MISMATCH;
    {class} property UMTS_HANDOVER_TO_IWLAN: Integer read _GetUMTS_HANDOVER_TO_IWLAN;
    {class} property UMTS_REACTIVATION_REQ: Integer read _GetUMTS_REACTIVATION_REQ;
    {class} property UNACCEPTABLE_NETWORK_PARAMETER: Integer read _GetUNACCEPTABLE_NETWORK_PARAMETER;
    {class} property UNACCEPTABLE_NON_EPS_AUTHENTICATION: Integer read _GetUNACCEPTABLE_NON_EPS_AUTHENTICATION;
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
    {class} property UNKNOWN_INFO_ELEMENT: Integer read _GetUNKNOWN_INFO_ELEMENT;
    {class} property UNKNOWN_PDP_ADDRESS_TYPE: Integer read _GetUNKNOWN_PDP_ADDRESS_TYPE;
    {class} property UNKNOWN_PDP_CONTEXT: Integer read _GetUNKNOWN_PDP_CONTEXT;
    {class} property UNPREFERRED_RAT: Integer read _GetUNPREFERRED_RAT;
    {class} property UNSUPPORTED_1X_PREV: Integer read _GetUNSUPPORTED_1X_PREV;
    {class} property UNSUPPORTED_APN_IN_CURRENT_PLMN: Integer read _GetUNSUPPORTED_APN_IN_CURRENT_PLMN;
    {class} property UNSUPPORTED_QCI_VALUE: Integer read _GetUNSUPPORTED_QCI_VALUE;
    {class} property USER_AUTHENTICATION: Integer read _GetUSER_AUTHENTICATION;
    {class} property VSNCP_ADMINISTRATIVELY_PROHIBITED: Integer read _GetVSNCP_ADMINISTRATIVELY_PROHIBITED;
    {class} property VSNCP_APN_UNAUTHORIZED: Integer read _GetVSNCP_APN_UNAUTHORIZED;
    {class} property VSNCP_GEN_ERROR: Integer read _GetVSNCP_GEN_ERROR;
    {class} property VSNCP_INSUFFICIENT_PARAMETERS: Integer read _GetVSNCP_INSUFFICIENT_PARAMETERS;
    {class} property VSNCP_NO_PDN_GATEWAY_ADDRESS: Integer read _GetVSNCP_NO_PDN_GATEWAY_ADDRESS;
    {class} property VSNCP_PDN_EXISTS_FOR_THIS_APN: Integer read _GetVSNCP_PDN_EXISTS_FOR_THIS_APN;
    {class} property VSNCP_PDN_GATEWAY_REJECT: Integer read _GetVSNCP_PDN_GATEWAY_REJECT;
    {class} property VSNCP_PDN_GATEWAY_UNREACHABLE: Integer read _GetVSNCP_PDN_GATEWAY_UNREACHABLE;
    {class} property VSNCP_PDN_ID_IN_USE: Integer read _GetVSNCP_PDN_ID_IN_USE;
    {class} property VSNCP_PDN_LIMIT_EXCEEDED: Integer read _GetVSNCP_PDN_LIMIT_EXCEEDED;
    {class} property VSNCP_RECONNECT_NOT_ALLOWED: Integer read _GetVSNCP_RECONNECT_NOT_ALLOWED;
    {class} property VSNCP_RESOURCE_UNAVAILABLE: Integer read _GetVSNCP_RESOURCE_UNAVAILABLE;
    {class} property VSNCP_SUBSCRIBER_LIMITATION: Integer read _GetVSNCP_SUBSCRIBER_LIMITATION;
    {class} property VSNCP_TIMEOUT: Integer read _GetVSNCP_TIMEOUT;
  end;

  [JavaSignature('android/telephony/DataFailCause')]
  JDataFailCause = interface(JObject)
    ['{691FA9A0-E2DF-4DD1-B2B2-BDBB24B24055}']
  end;
  TJDataFailCause = class(TJavaGenericImport<JDataFailCauseClass, JDataFailCause>) end;

  Jtelephony_DisconnectCauseClass = interface(JObjectClass)
    ['{539056B2-1A2D-4273-9EEF-6E7CF044D39A}']
    {class} function _GetALREADY_DIALING: Integer; cdecl;
    {class} function _GetANSWERED_ELSEWHERE: Integer; cdecl;
    {class} function _GetBUSY: Integer; cdecl;
    {class} function _GetCALLING_DISABLED: Integer; cdecl;
    {class} function _GetCALL_BARRED: Integer; cdecl;
    {class} function _GetCALL_PULLED: Integer; cdecl;
    {class} function _GetCANT_CALL_WHILE_RINGING: Integer; cdecl;
    {class} function _GetCDMA_ACCESS_BLOCKED: Integer; cdecl;
    {class} function _GetCDMA_ACCESS_FAILURE: Integer; cdecl;
    {class} function _GetCDMA_ALREADY_ACTIVATED: Integer; cdecl;
    {class} function _GetCDMA_DROP: Integer; cdecl;
    {class} function _GetCDMA_INTERCEPT: Integer; cdecl;
    {class} function _GetCDMA_LOCKED_UNTIL_POWER_CYCLE: Integer; cdecl;
    {class} function _GetCDMA_NOT_EMERGENCY: Integer; cdecl;
    {class} function _GetCDMA_PREEMPTED: Integer; cdecl;
    {class} function _GetCDMA_REORDER: Integer; cdecl;
    {class} function _GetCDMA_RETRY_ORDER: Integer; cdecl;
    {class} function _GetCDMA_SO_REJECT: Integer; cdecl;
    {class} function _GetCONGESTION: Integer; cdecl;
    {class} function _GetCS_RESTRICTED: Integer; cdecl;
    {class} function _GetCS_RESTRICTED_EMERGENCY: Integer; cdecl;
    {class} function _GetCS_RESTRICTED_NORMAL: Integer; cdecl;
    {class} function _GetDATA_DISABLED: Integer; cdecl;
    {class} function _GetDATA_LIMIT_REACHED: Integer; cdecl;
    {class} function _GetDIALED_CALL_FORWARDING_WHILE_ROAMING: Integer; cdecl;
    {class} function _GetDIALED_MMI: Integer; cdecl;
    {class} function _GetDIAL_LOW_BATTERY: Integer; cdecl;
    {class} function _GetDIAL_MODIFIED_TO_DIAL: Integer; cdecl;
    {class} function _GetDIAL_MODIFIED_TO_DIAL_VIDEO: Integer; cdecl;
    {class} function _GetDIAL_MODIFIED_TO_SS: Integer; cdecl;
    {class} function _GetDIAL_MODIFIED_TO_USSD: Integer; cdecl;
    {class} function _GetDIAL_VIDEO_MODIFIED_TO_DIAL: Integer; cdecl;
    {class} function _GetDIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO: Integer; cdecl;
    {class} function _GetDIAL_VIDEO_MODIFIED_TO_SS: Integer; cdecl;
    {class} function _GetDIAL_VIDEO_MODIFIED_TO_USSD: Integer; cdecl;
    {class} function _GetEMERGENCY_CALL_OVER_WFC_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetEMERGENCY_PERM_FAILURE: Integer; cdecl;
    {class} function _GetEMERGENCY_TEMP_FAILURE: Integer; cdecl;
    {class} function _GetERROR_UNSPECIFIED: Integer; cdecl;
    {class} function _GetFDN_BLOCKED: Integer; cdecl;
    {class} function _GetICC_ERROR: Integer; cdecl;
    {class} function _GetIMEI_NOT_ACCEPTED: Integer; cdecl;
    {class} function _GetIMS_ACCESS_BLOCKED: Integer; cdecl;
    {class} function _GetIMS_MERGED_SUCCESSFULLY: Integer; cdecl;
    {class} function _GetIMS_SIP_ALTERNATE_EMERGENCY_CALL: Integer; cdecl;
    {class} function _GetINCOMING_AUTO_REJECTED: Integer; cdecl;
    {class} function _GetINCOMING_MISSED: Integer; cdecl;
    {class} function _GetINCOMING_REJECTED: Integer; cdecl;
    {class} function _GetINVALID_CREDENTIALS: Integer; cdecl;
    {class} function _GetINVALID_NUMBER: Integer; cdecl;
    {class} function _GetLIMIT_EXCEEDED: Integer; cdecl;
    {class} function _GetLOCAL: Integer; cdecl;
    {class} function _GetLOST_SIGNAL: Integer; cdecl;
    {class} function _GetLOW_BATTERY: Integer; cdecl;
    {class} function _GetMAXIMUM_NUMBER_OF_CALLS_REACHED: Integer; cdecl;
    {class} function _GetMEDIA_TIMEOUT: Integer; cdecl;
    {class} function _GetMMI: Integer; cdecl;
    {class} function _GetNORMAL: Integer; cdecl;
    {class} function _GetNORMAL_UNSPECIFIED: Integer; cdecl;
    {class} function _GetNOT_DISCONNECTED: Integer; cdecl;
    {class} function _GetNOT_VALID: Integer; cdecl;
    {class} function _GetNO_PHONE_NUMBER_SUPPLIED: Integer; cdecl;
    {class} function _GetNUMBER_UNREACHABLE: Integer; cdecl;
    {class} function _GetOTASP_PROVISIONING_IN_PROCESS: Integer; cdecl;
    {class} function _GetOUTGOING_CANCELED: Integer; cdecl;
    {class} function _GetOUTGOING_EMERGENCY_CALL_PLACED: Integer; cdecl;
    {class} function _GetOUTGOING_FAILURE: Integer; cdecl;
    {class} function _GetOUT_OF_NETWORK: Integer; cdecl;
    {class} function _GetOUT_OF_SERVICE: Integer; cdecl;
    {class} function _GetPOWER_OFF: Integer; cdecl;
    {class} function _GetSERVER_ERROR: Integer; cdecl;
    {class} function _GetSERVER_UNREACHABLE: Integer; cdecl;
    {class} function _GetTIMED_OUT: Integer; cdecl;
    {class} function _GetTOO_MANY_ONGOING_CALLS: Integer; cdecl;
    {class} function _GetUNOBTAINABLE_NUMBER: Integer; cdecl;
    {class} function _GetVIDEO_CALL_NOT_ALLOWED_WHILE_TTY_ENABLED: Integer; cdecl;
    {class} function _GetVOICEMAIL_NUMBER_MISSING: Integer; cdecl;
    {class} function _GetWFC_SERVICE_NOT_AVAILABLE_IN_THIS_LOCATION: Integer; cdecl;
    {class} function _GetWIFI_LOST: Integer; cdecl;
    {class} property ALREADY_DIALING: Integer read _GetALREADY_DIALING;
    {class} property ANSWERED_ELSEWHERE: Integer read _GetANSWERED_ELSEWHERE;
    {class} property BUSY: Integer read _GetBUSY;
    {class} property CALLING_DISABLED: Integer read _GetCALLING_DISABLED;
    {class} property CALL_BARRED: Integer read _GetCALL_BARRED;
    {class} property CALL_PULLED: Integer read _GetCALL_PULLED;
    {class} property CANT_CALL_WHILE_RINGING: Integer read _GetCANT_CALL_WHILE_RINGING;
    {class} property CDMA_ACCESS_BLOCKED: Integer read _GetCDMA_ACCESS_BLOCKED;
    {class} property CDMA_ACCESS_FAILURE: Integer read _GetCDMA_ACCESS_FAILURE;
    {class} property CDMA_ALREADY_ACTIVATED: Integer read _GetCDMA_ALREADY_ACTIVATED;
    {class} property CDMA_DROP: Integer read _GetCDMA_DROP;
    {class} property CDMA_INTERCEPT: Integer read _GetCDMA_INTERCEPT;
    {class} property CDMA_LOCKED_UNTIL_POWER_CYCLE: Integer read _GetCDMA_LOCKED_UNTIL_POWER_CYCLE;
    {class} property CDMA_NOT_EMERGENCY: Integer read _GetCDMA_NOT_EMERGENCY;
    {class} property CDMA_PREEMPTED: Integer read _GetCDMA_PREEMPTED;
    {class} property CDMA_REORDER: Integer read _GetCDMA_REORDER;
    {class} property CDMA_RETRY_ORDER: Integer read _GetCDMA_RETRY_ORDER;
    {class} property CDMA_SO_REJECT: Integer read _GetCDMA_SO_REJECT;
    {class} property CONGESTION: Integer read _GetCONGESTION;
    {class} property CS_RESTRICTED: Integer read _GetCS_RESTRICTED;
    {class} property CS_RESTRICTED_EMERGENCY: Integer read _GetCS_RESTRICTED_EMERGENCY;
    {class} property CS_RESTRICTED_NORMAL: Integer read _GetCS_RESTRICTED_NORMAL;
    {class} property DATA_DISABLED: Integer read _GetDATA_DISABLED;
    {class} property DATA_LIMIT_REACHED: Integer read _GetDATA_LIMIT_REACHED;
    {class} property DIALED_CALL_FORWARDING_WHILE_ROAMING: Integer read _GetDIALED_CALL_FORWARDING_WHILE_ROAMING;
    {class} property DIALED_MMI: Integer read _GetDIALED_MMI;
    {class} property DIAL_LOW_BATTERY: Integer read _GetDIAL_LOW_BATTERY;
    {class} property DIAL_MODIFIED_TO_DIAL: Integer read _GetDIAL_MODIFIED_TO_DIAL;
    {class} property DIAL_MODIFIED_TO_DIAL_VIDEO: Integer read _GetDIAL_MODIFIED_TO_DIAL_VIDEO;
    {class} property DIAL_MODIFIED_TO_SS: Integer read _GetDIAL_MODIFIED_TO_SS;
    {class} property DIAL_MODIFIED_TO_USSD: Integer read _GetDIAL_MODIFIED_TO_USSD;
    {class} property DIAL_VIDEO_MODIFIED_TO_DIAL: Integer read _GetDIAL_VIDEO_MODIFIED_TO_DIAL;
    {class} property DIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO: Integer read _GetDIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO;
    {class} property DIAL_VIDEO_MODIFIED_TO_SS: Integer read _GetDIAL_VIDEO_MODIFIED_TO_SS;
    {class} property DIAL_VIDEO_MODIFIED_TO_USSD: Integer read _GetDIAL_VIDEO_MODIFIED_TO_USSD;
    {class} property EMERGENCY_CALL_OVER_WFC_NOT_AVAILABLE: Integer read _GetEMERGENCY_CALL_OVER_WFC_NOT_AVAILABLE;
    {class} property EMERGENCY_PERM_FAILURE: Integer read _GetEMERGENCY_PERM_FAILURE;
    {class} property EMERGENCY_TEMP_FAILURE: Integer read _GetEMERGENCY_TEMP_FAILURE;
    {class} property ERROR_UNSPECIFIED: Integer read _GetERROR_UNSPECIFIED;
    {class} property FDN_BLOCKED: Integer read _GetFDN_BLOCKED;
    {class} property ICC_ERROR: Integer read _GetICC_ERROR;
    {class} property IMEI_NOT_ACCEPTED: Integer read _GetIMEI_NOT_ACCEPTED;
    {class} property IMS_ACCESS_BLOCKED: Integer read _GetIMS_ACCESS_BLOCKED;
    {class} property IMS_MERGED_SUCCESSFULLY: Integer read _GetIMS_MERGED_SUCCESSFULLY;
    {class} property IMS_SIP_ALTERNATE_EMERGENCY_CALL: Integer read _GetIMS_SIP_ALTERNATE_EMERGENCY_CALL;
    {class} property INCOMING_AUTO_REJECTED: Integer read _GetINCOMING_AUTO_REJECTED;
    {class} property INCOMING_MISSED: Integer read _GetINCOMING_MISSED;
    {class} property INCOMING_REJECTED: Integer read _GetINCOMING_REJECTED;
    {class} property INVALID_CREDENTIALS: Integer read _GetINVALID_CREDENTIALS;
    {class} property INVALID_NUMBER: Integer read _GetINVALID_NUMBER;
    {class} property LIMIT_EXCEEDED: Integer read _GetLIMIT_EXCEEDED;
    {class} property LOCAL: Integer read _GetLOCAL;
    {class} property LOST_SIGNAL: Integer read _GetLOST_SIGNAL;
    {class} property LOW_BATTERY: Integer read _GetLOW_BATTERY;
    {class} property MAXIMUM_NUMBER_OF_CALLS_REACHED: Integer read _GetMAXIMUM_NUMBER_OF_CALLS_REACHED;
    {class} property MEDIA_TIMEOUT: Integer read _GetMEDIA_TIMEOUT;
    {class} property MMI: Integer read _GetMMI;
    {class} property NORMAL: Integer read _GetNORMAL;
    {class} property NORMAL_UNSPECIFIED: Integer read _GetNORMAL_UNSPECIFIED;
    {class} property NOT_DISCONNECTED: Integer read _GetNOT_DISCONNECTED;
    {class} property NOT_VALID: Integer read _GetNOT_VALID;
    {class} property NO_PHONE_NUMBER_SUPPLIED: Integer read _GetNO_PHONE_NUMBER_SUPPLIED;
    {class} property NUMBER_UNREACHABLE: Integer read _GetNUMBER_UNREACHABLE;
    {class} property OTASP_PROVISIONING_IN_PROCESS: Integer read _GetOTASP_PROVISIONING_IN_PROCESS;
    {class} property OUTGOING_CANCELED: Integer read _GetOUTGOING_CANCELED;
    {class} property OUTGOING_EMERGENCY_CALL_PLACED: Integer read _GetOUTGOING_EMERGENCY_CALL_PLACED;
    {class} property OUTGOING_FAILURE: Integer read _GetOUTGOING_FAILURE;
    {class} property OUT_OF_NETWORK: Integer read _GetOUT_OF_NETWORK;
    {class} property OUT_OF_SERVICE: Integer read _GetOUT_OF_SERVICE;
    {class} property POWER_OFF: Integer read _GetPOWER_OFF;
    {class} property SERVER_ERROR: Integer read _GetSERVER_ERROR;
    {class} property SERVER_UNREACHABLE: Integer read _GetSERVER_UNREACHABLE;
    {class} property TIMED_OUT: Integer read _GetTIMED_OUT;
    {class} property TOO_MANY_ONGOING_CALLS: Integer read _GetTOO_MANY_ONGOING_CALLS;
    {class} property UNOBTAINABLE_NUMBER: Integer read _GetUNOBTAINABLE_NUMBER;
    {class} property VIDEO_CALL_NOT_ALLOWED_WHILE_TTY_ENABLED: Integer read _GetVIDEO_CALL_NOT_ALLOWED_WHILE_TTY_ENABLED;
    {class} property VOICEMAIL_NUMBER_MISSING: Integer read _GetVOICEMAIL_NUMBER_MISSING;
    {class} property WFC_SERVICE_NOT_AVAILABLE_IN_THIS_LOCATION: Integer read _GetWFC_SERVICE_NOT_AVAILABLE_IN_THIS_LOCATION;
    {class} property WIFI_LOST: Integer read _GetWIFI_LOST;
  end;

  [JavaSignature('android/telephony/DisconnectCause')]
  Jtelephony_DisconnectCause = interface(JObject)
    ['{9FAE0819-2D07-4DD1-9FEE-B0384C470369}']
  end;
  TJtelephony_DisconnectCause = class(TJavaGenericImport<Jtelephony_DisconnectCauseClass, Jtelephony_DisconnectCause>) end;

  JIccOpenLogicalChannelResponseClass = interface(JObjectClass)
    ['{BADEDECF-3EFB-4912-9478-37C4ADCDC8A3}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetINVALID_CHANNEL: Integer; cdecl;
    {class} function _GetSTATUS_MISSING_RESOURCE: Integer; cdecl;
    {class} function _GetSTATUS_NO_ERROR: Integer; cdecl;
    {class} function _GetSTATUS_NO_SUCH_ELEMENT: Integer; cdecl;
    {class} function _GetSTATUS_UNKNOWN_ERROR: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property INVALID_CHANNEL: Integer read _GetINVALID_CHANNEL;
    {class} property STATUS_MISSING_RESOURCE: Integer read _GetSTATUS_MISSING_RESOURCE;
    {class} property STATUS_NO_ERROR: Integer read _GetSTATUS_NO_ERROR;
    {class} property STATUS_NO_SUCH_ELEMENT: Integer read _GetSTATUS_NO_SUCH_ELEMENT;
    {class} property STATUS_UNKNOWN_ERROR: Integer read _GetSTATUS_UNKNOWN_ERROR;
  end;

  [JavaSignature('android/telephony/IccOpenLogicalChannelResponse')]
  JIccOpenLogicalChannelResponse = interface(JObject)
    ['{75F3CEEA-52CC-4693-8E6A-264831D23AC9}']
    function describeContents: Integer; cdecl;
    function getChannel: Integer; cdecl;
    function getSelectResponse: TJavaArray<Byte>; cdecl;
    function getStatus: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJIccOpenLogicalChannelResponse = class(TJavaGenericImport<JIccOpenLogicalChannelResponseClass, JIccOpenLogicalChannelResponse>) end;

  JMbmsDownloadSessionClass = interface(JObjectClass)
    ['{7ED29228-1C18-4C2F-A96B-A2FAC608CDA3}']
    {class} function _GetDEFAULT_TOP_LEVEL_TEMP_DIRECTORY: JString; cdecl;
    {class} function _GetEXTRA_MBMS_COMPLETED_FILE_URI: JString; cdecl;
    {class} function _GetEXTRA_MBMS_DOWNLOAD_REQUEST: JString; cdecl;
    {class} function _GetEXTRA_MBMS_DOWNLOAD_RESULT: JString; cdecl;
    {class} function _GetEXTRA_MBMS_FILE_INFO: JString; cdecl;
    {class} function _GetRESULT_CANCELLED: Integer; cdecl;
    {class} function _GetRESULT_DOWNLOAD_FAILURE: Integer; cdecl;
    {class} function _GetRESULT_EXPIRED: Integer; cdecl;
    {class} function _GetRESULT_FILE_ROOT_UNREACHABLE: Integer; cdecl;
    {class} function _GetRESULT_IO_ERROR: Integer; cdecl;
    {class} function _GetRESULT_OUT_OF_STORAGE: Integer; cdecl;
    {class} function _GetRESULT_SERVICE_ID_NOT_DEFINED: Integer; cdecl;
    {class} function _GetRESULT_SUCCESSFUL: Integer; cdecl;
    {class} function _GetSTATUS_ACTIVELY_DOWNLOADING: Integer; cdecl;
    {class} function _GetSTATUS_PENDING_DOWNLOAD: Integer; cdecl;
    {class} function _GetSTATUS_PENDING_DOWNLOAD_WINDOW: Integer; cdecl;
    {class} function _GetSTATUS_PENDING_REPAIR: Integer; cdecl;
    {class} function _GetSTATUS_UNKNOWN: Integer; cdecl;
    {class} function create(context: JContext; executor: JExecutor; callback: JMbmsDownloadSessionCallback): JMbmsDownloadSession; cdecl; overload;
    {class} function create(context: JContext; executor: JExecutor; subscriptionId: Integer; callback: JMbmsDownloadSessionCallback): JMbmsDownloadSession; cdecl; overload;
    {class} function getMaximumServiceAnnouncementSize: Integer; cdecl;
    {class} property DEFAULT_TOP_LEVEL_TEMP_DIRECTORY: JString read _GetDEFAULT_TOP_LEVEL_TEMP_DIRECTORY;
    {class} property EXTRA_MBMS_COMPLETED_FILE_URI: JString read _GetEXTRA_MBMS_COMPLETED_FILE_URI;
    {class} property EXTRA_MBMS_DOWNLOAD_REQUEST: JString read _GetEXTRA_MBMS_DOWNLOAD_REQUEST;
    {class} property EXTRA_MBMS_DOWNLOAD_RESULT: JString read _GetEXTRA_MBMS_DOWNLOAD_RESULT;
    {class} property EXTRA_MBMS_FILE_INFO: JString read _GetEXTRA_MBMS_FILE_INFO;
    {class} property RESULT_CANCELLED: Integer read _GetRESULT_CANCELLED;
    {class} property RESULT_DOWNLOAD_FAILURE: Integer read _GetRESULT_DOWNLOAD_FAILURE;
    {class} property RESULT_EXPIRED: Integer read _GetRESULT_EXPIRED;
    {class} property RESULT_FILE_ROOT_UNREACHABLE: Integer read _GetRESULT_FILE_ROOT_UNREACHABLE;
    {class} property RESULT_IO_ERROR: Integer read _GetRESULT_IO_ERROR;
    {class} property RESULT_OUT_OF_STORAGE: Integer read _GetRESULT_OUT_OF_STORAGE;
    {class} property RESULT_SERVICE_ID_NOT_DEFINED: Integer read _GetRESULT_SERVICE_ID_NOT_DEFINED;
    {class} property RESULT_SUCCESSFUL: Integer read _GetRESULT_SUCCESSFUL;
    {class} property STATUS_ACTIVELY_DOWNLOADING: Integer read _GetSTATUS_ACTIVELY_DOWNLOADING;
    {class} property STATUS_PENDING_DOWNLOAD: Integer read _GetSTATUS_PENDING_DOWNLOAD;
    {class} property STATUS_PENDING_DOWNLOAD_WINDOW: Integer read _GetSTATUS_PENDING_DOWNLOAD_WINDOW;
    {class} property STATUS_PENDING_REPAIR: Integer read _GetSTATUS_PENDING_REPAIR;
    {class} property STATUS_UNKNOWN: Integer read _GetSTATUS_UNKNOWN;
  end;

  [JavaSignature('android/telephony/MbmsDownloadSession')]
  JMbmsDownloadSession = interface(JObject)
    ['{5F45F397-7768-4710-B7EF-CE707D018D95}']
    procedure addProgressListener(request: JDownloadRequest; executor: JExecutor; listener: JDownloadProgressListener); cdecl;
    procedure addServiceAnnouncement(contents: TJavaArray<Byte>); cdecl;
    procedure addStatusListener(request: JDownloadRequest; executor: JExecutor; listener: JDownloadStatusListener); cdecl;
    procedure cancelDownload(downloadRequest: JDownloadRequest); cdecl;
    procedure close; cdecl;
    procedure download(request: JDownloadRequest); cdecl;
    function getTempFileRootDirectory: JFile; cdecl;
    function listPendingDownloads: JList; cdecl;
    procedure removeProgressListener(request: JDownloadRequest; listener: JDownloadProgressListener); cdecl;
    procedure removeStatusListener(request: JDownloadRequest; listener: JDownloadStatusListener); cdecl;
    procedure requestDownloadState(downloadRequest: JDownloadRequest; fileInfo: JFileInfo); cdecl;
    procedure requestUpdateFileServices(classList: JList); cdecl;
    procedure resetDownloadKnowledge(downloadRequest: JDownloadRequest); cdecl;
    procedure setTempFileRootDirectory(tempFileRootDirectory: JFile); cdecl;
  end;
  TJMbmsDownloadSession = class(TJavaGenericImport<JMbmsDownloadSessionClass, JMbmsDownloadSession>) end;

  JMbmsGroupCallSessionClass = interface(JObjectClass)
    ['{4B08B222-F824-4405-A1B5-91DDFC6B9A9D}']
    {class} function create(context: JContext; subscriptionId: Integer; executor: JExecutor; callback: JMbmsGroupCallSessionCallback): JMbmsGroupCallSession; cdecl; overload;
    {class} function create(context: JContext; executor: JExecutor; callback: JMbmsGroupCallSessionCallback): JMbmsGroupCallSession; cdecl; overload;
  end;

  [JavaSignature('android/telephony/MbmsGroupCallSession')]
  JMbmsGroupCallSession = interface(JObject)
    ['{98BF80AA-A991-48ED-A392-6B02E9EA7103}']
    procedure close; cdecl;
    function startGroupCall(tmgi: Int64; saiList: JList; frequencyList: JList; executor: JExecutor; callback: JGroupCallCallback): JGroupCall; cdecl;
  end;
  TJMbmsGroupCallSession = class(TJavaGenericImport<JMbmsGroupCallSessionClass, JMbmsGroupCallSession>) end;

  JMbmsStreamingSessionClass = interface(JObjectClass)
    ['{D0059D58-94AB-40AD-9032-8E091ED37217}']
    {class} function create(context: JContext; executor: JExecutor; subscriptionId: Integer; callback: JMbmsStreamingSessionCallback): JMbmsStreamingSession; cdecl; overload;
    {class} function create(context: JContext; executor: JExecutor; callback: JMbmsStreamingSessionCallback): JMbmsStreamingSession; cdecl; overload;
  end;

  [JavaSignature('android/telephony/MbmsStreamingSession')]
  JMbmsStreamingSession = interface(JObject)
    ['{033BB32F-CEC4-45A2-A844-940D5B60B069}']
    procedure close; cdecl;
    procedure requestUpdateStreamingServices(serviceClassList: JList); cdecl;
    function startStreaming(serviceInfo: JStreamingServiceInfo; executor: JExecutor; callback: JStreamingServiceCallback): JStreamingService; cdecl;
  end;
  TJMbmsStreamingSession = class(TJavaGenericImport<JMbmsStreamingSessionClass, JMbmsStreamingSession>) end;

  JNeighboringCellInfoClass = interface(JObjectClass)
    ['{EB3E8F37-13C7-4E29-9015-FE80FD8BD4A7}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetUNKNOWN_CID: Integer; cdecl;
    {class} function _GetUNKNOWN_RSSI: Integer; cdecl;
    {class} function init: JNeighboringCellInfo; cdecl; overload;//Deprecated
    {class} function init(rssi: Integer; cid: Integer): JNeighboringCellInfo; cdecl; overload;//Deprecated
    {class} function init(rssi: Integer; location: JString; radioType: Integer): JNeighboringCellInfo; cdecl; overload;
    {class} function init(in_: JParcel): JNeighboringCellInfo; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property UNKNOWN_CID: Integer read _GetUNKNOWN_CID;
    {class} property UNKNOWN_RSSI: Integer read _GetUNKNOWN_RSSI;
  end;

  [JavaSignature('android/telephony/NeighboringCellInfo')]
  JNeighboringCellInfo = interface(JObject)
    ['{8BF5BF7B-3E55-4C97-A2A5-11C1D079EF73}']
    function describeContents: Integer; cdecl;
    function getCid: Integer; cdecl;
    function getLac: Integer; cdecl;
    function getNetworkType: Integer; cdecl;
    function getPsc: Integer; cdecl;
    function getRssi: Integer; cdecl;
    procedure setCid(cid: Integer); cdecl;//Deprecated
    procedure setRssi(rssi: Integer); cdecl;//Deprecated
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNeighboringCellInfo = class(TJavaGenericImport<JNeighboringCellInfoClass, JNeighboringCellInfo>) end;

  JNetworkRegistrationInfoClass = interface(JObjectClass)
    ['{628AFA73-5ED3-4325-B560-41568500D5B5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDOMAIN_CS: Integer; cdecl;
    {class} function _GetDOMAIN_CS_PS: Integer; cdecl;
    {class} function _GetDOMAIN_PS: Integer; cdecl;
    {class} function _GetDOMAIN_UNKNOWN: Integer; cdecl;
    {class} function _GetNR_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetNR_STATE_NONE: Integer; cdecl;
    {class} function _GetNR_STATE_NOT_RESTRICTED: Integer; cdecl;
    {class} function _GetNR_STATE_RESTRICTED: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_DATA: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_EMERGENCY: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_SMS: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_VIDEO: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_VOICE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DOMAIN_CS: Integer read _GetDOMAIN_CS;
    {class} property DOMAIN_CS_PS: Integer read _GetDOMAIN_CS_PS;
    {class} property DOMAIN_PS: Integer read _GetDOMAIN_PS;
    {class} property DOMAIN_UNKNOWN: Integer read _GetDOMAIN_UNKNOWN;
    {class} property NR_STATE_CONNECTED: Integer read _GetNR_STATE_CONNECTED;
    {class} property NR_STATE_NONE: Integer read _GetNR_STATE_NONE;
    {class} property NR_STATE_NOT_RESTRICTED: Integer read _GetNR_STATE_NOT_RESTRICTED;
    {class} property NR_STATE_RESTRICTED: Integer read _GetNR_STATE_RESTRICTED;
    {class} property SERVICE_TYPE_DATA: Integer read _GetSERVICE_TYPE_DATA;
    {class} property SERVICE_TYPE_EMERGENCY: Integer read _GetSERVICE_TYPE_EMERGENCY;
    {class} property SERVICE_TYPE_SMS: Integer read _GetSERVICE_TYPE_SMS;
    {class} property SERVICE_TYPE_UNKNOWN: Integer read _GetSERVICE_TYPE_UNKNOWN;
    {class} property SERVICE_TYPE_VIDEO: Integer read _GetSERVICE_TYPE_VIDEO;
    {class} property SERVICE_TYPE_VOICE: Integer read _GetSERVICE_TYPE_VOICE;
  end;

  [JavaSignature('android/telephony/NetworkRegistrationInfo')]
  JNetworkRegistrationInfo = interface(JObject)
    ['{E7D998A3-792B-4C01-AC23-0A0F06DCC11E}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAccessNetworkTechnology: Integer; cdecl;
    function getAvailableServices: JList; cdecl;
    function getCellIdentity: JCellIdentity; cdecl;
    function getDomain: Integer; cdecl;
    function getRegisteredPlmn: JString; cdecl;
    function getTransportType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isRegistered: Boolean; cdecl;
    function isRoaming: Boolean; cdecl;
    function isSearching: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJNetworkRegistrationInfo = class(TJavaGenericImport<JNetworkRegistrationInfoClass, JNetworkRegistrationInfo>) end;

  JNetworkScanClass = interface(JObjectClass)
    ['{8B58609A-E4DA-439F-8BC4-9D853A249314}']
    {class} function _GetERROR_INTERRUPTED: Integer; cdecl;
    {class} function _GetERROR_INVALID_SCAN: Integer; cdecl;
    {class} function _GetERROR_INVALID_SCANID: Integer; cdecl;
    {class} function _GetERROR_MODEM_ERROR: Integer; cdecl;
    {class} function _GetERROR_MODEM_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_RADIO_INTERFACE_ERROR: Integer; cdecl;
    {class} function _GetERROR_UNSUPPORTED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} property ERROR_INTERRUPTED: Integer read _GetERROR_INTERRUPTED;
    {class} property ERROR_INVALID_SCAN: Integer read _GetERROR_INVALID_SCAN;
    {class} property ERROR_INVALID_SCANID: Integer read _GetERROR_INVALID_SCANID;
    {class} property ERROR_MODEM_ERROR: Integer read _GetERROR_MODEM_ERROR;
    {class} property ERROR_MODEM_UNAVAILABLE: Integer read _GetERROR_MODEM_UNAVAILABLE;
    {class} property ERROR_RADIO_INTERFACE_ERROR: Integer read _GetERROR_RADIO_INTERFACE_ERROR;
    {class} property ERROR_UNSUPPORTED: Integer read _GetERROR_UNSUPPORTED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/telephony/NetworkScan')]
  JNetworkScan = interface(JObject)
    ['{483AEFF4-AEFB-45D5-92F0-02B485B1FC0D}']
    procedure stop; cdecl;//Deprecated
    procedure stopScan; cdecl;
  end;
  TJNetworkScan = class(TJavaGenericImport<JNetworkScanClass, JNetworkScan>) end;

  JNetworkScanRequestClass = interface(JObjectClass)
    ['{CCCC7E9C-CA9B-4DBF-B2A0-8C8E089C8427}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSCAN_TYPE_ONE_SHOT: Integer; cdecl;
    {class} function _GetSCAN_TYPE_PERIODIC: Integer; cdecl;
    {class} function init(scanType: Integer; specifiers: TJavaObjectArray<JRadioAccessSpecifier>; searchPeriodicity: Integer; maxSearchTime: Integer; incrementalResults: Boolean; incrementalResultsPeriodicity: Integer; mccMncs: JArrayList): JNetworkScanRequest; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SCAN_TYPE_ONE_SHOT: Integer read _GetSCAN_TYPE_ONE_SHOT;
    {class} property SCAN_TYPE_PERIODIC: Integer read _GetSCAN_TYPE_PERIODIC;
  end;

  [JavaSignature('android/telephony/NetworkScanRequest')]
  JNetworkScanRequest = interface(JObject)
    ['{7012FEFD-A231-4B92-8613-2DDB98DD9B54}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getIncrementalResults: Boolean; cdecl;
    function getIncrementalResultsPeriodicity: Integer; cdecl;
    function getMaxSearchTime: Integer; cdecl;
    function getPlmns: JArrayList; cdecl;
    function getScanType: Integer; cdecl;
    function getSearchPeriodicity: Integer; cdecl;
    function getSpecifiers: TJavaObjectArray<JRadioAccessSpecifier>; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkScanRequest = class(TJavaGenericImport<JNetworkScanRequestClass, JNetworkScanRequest>) end;

  JPhoneNumberFormattingTextWatcherClass = interface(JObjectClass)
    ['{41B14776-2EE7-4DE2-8E4E-C1E936C866C1}']
    {class} function init: JPhoneNumberFormattingTextWatcher; cdecl; overload;
    {class} function init(countryCode: JString): JPhoneNumberFormattingTextWatcher; cdecl; overload;
  end;

  [JavaSignature('android/telephony/PhoneNumberFormattingTextWatcher')]
  JPhoneNumberFormattingTextWatcher = interface(JObject)
    ['{891E6B45-DD52-484F-8E52-5F5272FC56DC}']
    procedure afterTextChanged(s: JEditable); cdecl;
    procedure beforeTextChanged(s: JCharSequence; start: Integer; count: Integer; after: Integer); cdecl;
    procedure onTextChanged(s: JCharSequence; start: Integer; before: Integer; count: Integer); cdecl;
  end;
  TJPhoneNumberFormattingTextWatcher = class(TJavaGenericImport<JPhoneNumberFormattingTextWatcherClass, JPhoneNumberFormattingTextWatcher>) end;

  JPhoneNumberUtilsClass = interface(JObjectClass)
    ['{B641F06B-F83E-4853-BAA9-1939B5B5C231}']
    {class} function _GetBCD_EXTENDED_TYPE_CALLED_PARTY: Integer; cdecl;
    {class} function _GetBCD_EXTENDED_TYPE_EF_ADN: Integer; cdecl;
    {class} function _GetFORMAT_JAPAN: Integer; cdecl;
    {class} function _GetFORMAT_NANP: Integer; cdecl;
    {class} function _GetFORMAT_UNKNOWN: Integer; cdecl;
    {class} function _GetPAUSE: Char; cdecl;
    {class} function _GetTOA_International: Integer; cdecl;
    {class} function _GetTOA_Unknown: Integer; cdecl;
    {class} function _GetWAIT: Char; cdecl;
    {class} function _GetWILD: Char; cdecl;
    {class} function init: JPhoneNumberUtils; cdecl;
    {class} procedure addTtsSpan(s: JSpannable; start: Integer; endExclusive: Integer); cdecl;
    {class} function areSamePhoneNumber(number1: JString; number2: JString; defaultCountryIso: JString): Boolean; cdecl;
    {class} function calledPartyBCDFragmentToString(bytes: TJavaArray<Byte>; offset: Integer; length: Integer): JString; cdecl; overload;//Deprecated
    {class} function calledPartyBCDFragmentToString(bytes: TJavaArray<Byte>; offset: Integer; length: Integer; bcdExtType: Integer): JString; cdecl; overload;
    {class} function calledPartyBCDToString(bytes: TJavaArray<Byte>; offset: Integer; length: Integer): JString; cdecl; overload;//Deprecated
    {class} function calledPartyBCDToString(bytes: TJavaArray<Byte>; offset: Integer; length: Integer; bcdExtType: Integer): JString; cdecl; overload;
    {class} function compare(a: JString; b: JString): Boolean; cdecl; overload;//Deprecated
    {class} function compare(context: JContext; a: JString; b: JString): Boolean; cdecl; overload;//Deprecated
    {class} function convertKeypadLettersToDigits(input: JString): JString; cdecl;
    {class} function createTtsSpan(phoneNumberString: JString): JTtsSpan; cdecl;
    {class} function createTtsSpannable(phoneNumber: JCharSequence): JCharSequence; cdecl;
    {class} function extractNetworkPortion(phoneNumber: JString): JString; cdecl;
    {class} function extractPostDialPortion(phoneNumber: JString): JString; cdecl;
    {class} procedure formatJapaneseNumber(text: JEditable); cdecl;//Deprecated
    {class} procedure formatNanpNumber(text: JEditable); cdecl;//Deprecated
    {class} function formatNumber(source: JString): JString; cdecl; overload;//Deprecated
    {class} procedure formatNumber(text: JEditable; defaultFormattingType: Integer); cdecl; overload;//Deprecated
    {class} function formatNumber(phoneNumber: JString; defaultCountryIso: JString): JString; cdecl; overload;
    {class} function formatNumber(phoneNumber: JString; phoneNumberE164: JString; defaultCountryIso: JString): JString; cdecl; overload;
    {class} function formatNumberToE164(phoneNumber: JString; defaultCountryIso: JString): JString; cdecl;
    {class} function formatNumberToRFC3966(phoneNumber: JString; defaultCountryIso: JString): JString; cdecl;
    {class} function getFormatTypeForLocale(locale: JLocale): Integer; cdecl;//Deprecated
    {class} function getNumberFromIntent(intent: JIntent; context: JContext): JString; cdecl;
    {class} function getStrippedReversed(phoneNumber: JString): JString; cdecl;
    {class} function is12Key(c: Char): Boolean; cdecl;
    {class} function isDialable(c: Char): Boolean; cdecl;
    {class} function isEmergencyNumber(number: JString): Boolean; cdecl;//Deprecated
    {class} function isGlobalPhoneNumber(phoneNumber: JString): Boolean; cdecl;
    {class} function isISODigit(c: Char): Boolean; cdecl;
    {class} function isLocalEmergencyNumber(context: JContext; number: JString): Boolean; cdecl;//Deprecated
    {class} function isNonSeparator(c: Char): Boolean; cdecl;
    {class} function isReallyDialable(c: Char): Boolean; cdecl;
    {class} function isStartsPostDial(c: Char): Boolean; cdecl;
    {class} function isVoiceMailNumber(number: JString): Boolean; cdecl;
    {class} function isWellFormedSmsAddress(address: JString): Boolean; cdecl;
    {class} function networkPortionToCalledPartyBCD(s: JString): TJavaArray<Byte>; cdecl;
    {class} function networkPortionToCalledPartyBCDWithLength(s: JString): TJavaArray<Byte>; cdecl;
    {class} function normalizeNumber(phoneNumber: JString): JString; cdecl;
    {class} function numberToCalledPartyBCD(number: JString): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function numberToCalledPartyBCD(number: JString; bcdExtType: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function replaceUnicodeDigits(number: JString): JString; cdecl;
    {class} function stringFromStringAndTOA(s: JString; TOA: Integer): JString; cdecl;
    {class} function stripSeparators(phoneNumber: JString): JString; cdecl;
    {class} function toCallerIDMinMatch(phoneNumber: JString): JString; cdecl;
    {class} function toaFromString(s: JString): Integer; cdecl;
    {class} property BCD_EXTENDED_TYPE_CALLED_PARTY: Integer read _GetBCD_EXTENDED_TYPE_CALLED_PARTY;
    {class} property BCD_EXTENDED_TYPE_EF_ADN: Integer read _GetBCD_EXTENDED_TYPE_EF_ADN;
    {class} property FORMAT_JAPAN: Integer read _GetFORMAT_JAPAN;
    {class} property FORMAT_NANP: Integer read _GetFORMAT_NANP;
    {class} property FORMAT_UNKNOWN: Integer read _GetFORMAT_UNKNOWN;
    {class} property PAUSE: Char read _GetPAUSE;
    {class} property TOA_International: Integer read _GetTOA_International;
    {class} property TOA_Unknown: Integer read _GetTOA_Unknown;
    {class} property WAIT: Char read _GetWAIT;
    {class} property WILD: Char read _GetWILD;
  end;

  [JavaSignature('android/telephony/PhoneNumberUtils')]
  JPhoneNumberUtils = interface(JObject)
    ['{8217405F-564B-4CA0-AF0A-3FEEE87A0444}']
  end;
  TJPhoneNumberUtils = class(TJavaGenericImport<JPhoneNumberUtilsClass, JPhoneNumberUtils>) end;

  JPhoneStateListenerClass = interface(JObjectClass)
    ['{897EC9F9-957F-4942-859D-50BCED64009B}']
    {class} function _GetLISTEN_ACTIVE_DATA_SUBSCRIPTION_ID_CHANGE: Integer; cdecl;
    {class} function _GetLISTEN_BARRING_INFO: Integer; cdecl;
    {class} function _GetLISTEN_CALL_DISCONNECT_CAUSES: Integer; cdecl;
    {class} function _GetLISTEN_CALL_FORWARDING_INDICATOR: Integer; cdecl;
    {class} function _GetLISTEN_CALL_STATE: Integer; cdecl;
    {class} function _GetLISTEN_CELL_INFO: Integer; cdecl;
    {class} function _GetLISTEN_CELL_LOCATION: Integer; cdecl;
    {class} function _GetLISTEN_DATA_ACTIVITY: Integer; cdecl;
    {class} function _GetLISTEN_DATA_CONNECTION_STATE: Integer; cdecl;
    {class} function _GetLISTEN_DISPLAY_INFO_CHANGED: Integer; cdecl;
    {class} function _GetLISTEN_EMERGENCY_NUMBER_LIST: Integer; cdecl;
    {class} function _GetLISTEN_IMS_CALL_DISCONNECT_CAUSES: Integer; cdecl;
    {class} function _GetLISTEN_MESSAGE_WAITING_INDICATOR: Integer; cdecl;
    {class} function _GetLISTEN_NONE: Integer; cdecl;
    {class} function _GetLISTEN_PRECISE_DATA_CONNECTION_STATE: Integer; cdecl;
    {class} function _GetLISTEN_REGISTRATION_FAILURE: Integer; cdecl;
    {class} function _GetLISTEN_SERVICE_STATE: Integer; cdecl;
    {class} function _GetLISTEN_SIGNAL_STRENGTH: Integer; cdecl;
    {class} function _GetLISTEN_SIGNAL_STRENGTHS: Integer; cdecl;
    {class} function _GetLISTEN_USER_MOBILE_DATA_STATE: Integer; cdecl;
    {class} function init: JPhoneStateListener; cdecl; overload;
    {class} function init(executor: JExecutor): JPhoneStateListener; cdecl; overload;//Deprecated
    {class} property LISTEN_ACTIVE_DATA_SUBSCRIPTION_ID_CHANGE: Integer read _GetLISTEN_ACTIVE_DATA_SUBSCRIPTION_ID_CHANGE;
    {class} property LISTEN_BARRING_INFO: Integer read _GetLISTEN_BARRING_INFO;
    {class} property LISTEN_CALL_DISCONNECT_CAUSES: Integer read _GetLISTEN_CALL_DISCONNECT_CAUSES;
    {class} property LISTEN_CALL_FORWARDING_INDICATOR: Integer read _GetLISTEN_CALL_FORWARDING_INDICATOR;
    {class} property LISTEN_CALL_STATE: Integer read _GetLISTEN_CALL_STATE;
    {class} property LISTEN_CELL_INFO: Integer read _GetLISTEN_CELL_INFO;
    {class} property LISTEN_CELL_LOCATION: Integer read _GetLISTEN_CELL_LOCATION;
    {class} property LISTEN_DATA_ACTIVITY: Integer read _GetLISTEN_DATA_ACTIVITY;
    {class} property LISTEN_DATA_CONNECTION_STATE: Integer read _GetLISTEN_DATA_CONNECTION_STATE;
    {class} property LISTEN_DISPLAY_INFO_CHANGED: Integer read _GetLISTEN_DISPLAY_INFO_CHANGED;
    {class} property LISTEN_EMERGENCY_NUMBER_LIST: Integer read _GetLISTEN_EMERGENCY_NUMBER_LIST;
    {class} property LISTEN_IMS_CALL_DISCONNECT_CAUSES: Integer read _GetLISTEN_IMS_CALL_DISCONNECT_CAUSES;
    {class} property LISTEN_MESSAGE_WAITING_INDICATOR: Integer read _GetLISTEN_MESSAGE_WAITING_INDICATOR;
    {class} property LISTEN_NONE: Integer read _GetLISTEN_NONE;
    {class} property LISTEN_PRECISE_DATA_CONNECTION_STATE: Integer read _GetLISTEN_PRECISE_DATA_CONNECTION_STATE;
    {class} property LISTEN_REGISTRATION_FAILURE: Integer read _GetLISTEN_REGISTRATION_FAILURE;
    {class} property LISTEN_SERVICE_STATE: Integer read _GetLISTEN_SERVICE_STATE;
    {class} property LISTEN_SIGNAL_STRENGTH: Integer read _GetLISTEN_SIGNAL_STRENGTH;
    {class} property LISTEN_SIGNAL_STRENGTHS: Integer read _GetLISTEN_SIGNAL_STRENGTHS;
    {class} property LISTEN_USER_MOBILE_DATA_STATE: Integer read _GetLISTEN_USER_MOBILE_DATA_STATE;
  end;

  [JavaSignature('android/telephony/PhoneStateListener')]
  JPhoneStateListener = interface(JObject)
    ['{50CE10E1-C584-4145-BC72-65BFA48BB281}']
    procedure onActiveDataSubscriptionIdChanged(subId: Integer); cdecl;//Deprecated
    procedure onBarringInfoChanged(barringInfo: JBarringInfo); cdecl;//Deprecated
    procedure onCallDisconnectCauseChanged(disconnectCause: Integer; preciseDisconnectCause: Integer); cdecl;//Deprecated
    procedure onCallForwardingIndicatorChanged(cfi: Boolean); cdecl;//Deprecated
    procedure onCallStateChanged(state: Integer; phoneNumber: JString); cdecl;//Deprecated
    procedure onCellInfoChanged(cellInfo: JList); cdecl;//Deprecated
    procedure onCellLocationChanged(location: JCellLocation); cdecl;//Deprecated
    procedure onDataActivity(direction: Integer); cdecl;//Deprecated
    procedure onDataConnectionStateChanged(state: Integer); cdecl; overload;//Deprecated
    procedure onDataConnectionStateChanged(state: Integer; networkType: Integer); cdecl; overload;//Deprecated
    procedure onDisplayInfoChanged(telephonyDisplayInfo: JTelephonyDisplayInfo); cdecl;//Deprecated
    procedure onEmergencyNumberListChanged(emergencyNumberList: JMap); cdecl;//Deprecated
    procedure onImsCallDisconnectCauseChanged(imsReasonInfo: JImsReasonInfo); cdecl;//Deprecated
    procedure onMessageWaitingIndicatorChanged(mwi: Boolean); cdecl;//Deprecated
    procedure onPreciseDataConnectionStateChanged(dataConnectionState: JPreciseDataConnectionState); cdecl;//Deprecated
    procedure onRegistrationFailed(cellIdentity: JCellIdentity; chosenPlmn: JString; domain: Integer; causeCode: Integer; additionalCauseCode: Integer); cdecl;//Deprecated
    procedure onServiceStateChanged(serviceState: JServiceState); cdecl;//Deprecated
    procedure onSignalStrengthChanged(asu: Integer); cdecl;//Deprecated
    procedure onSignalStrengthsChanged(signalStrength: JSignalStrength); cdecl;//Deprecated
    procedure onUserMobileDataStateChanged(enabled: Boolean); cdecl;//Deprecated
  end;
  TJPhoneStateListener = class(TJavaGenericImport<JPhoneStateListenerClass, JPhoneStateListener>) end;

  JPhysicalChannelConfigClass = interface(JObjectClass)
    ['{6C6DC125-FCD4-450D-B7B5-373E9B2D3001}']
    {class} function _GetBAND_UNKNOWN: Integer; cdecl;
    {class} function _GetCELL_BANDWIDTH_UNKNOWN: Integer; cdecl;
    {class} function _GetCHANNEL_NUMBER_UNKNOWN: Integer; cdecl;
    {class} function _GetCONNECTION_PRIMARY_SERVING: Integer; cdecl;
    {class} function _GetCONNECTION_SECONDARY_SERVING: Integer; cdecl;
    {class} function _GetCONNECTION_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFREQUENCY_UNKNOWN: Integer; cdecl;
    {class} function _GetPHYSICAL_CELL_ID_MAXIMUM_VALUE: Integer; cdecl;
    {class} function _GetPHYSICAL_CELL_ID_UNKNOWN: Integer; cdecl;
    {class} property BAND_UNKNOWN: Integer read _GetBAND_UNKNOWN;
    {class} property CELL_BANDWIDTH_UNKNOWN: Integer read _GetCELL_BANDWIDTH_UNKNOWN;
    {class} property CHANNEL_NUMBER_UNKNOWN: Integer read _GetCHANNEL_NUMBER_UNKNOWN;
    {class} property CONNECTION_PRIMARY_SERVING: Integer read _GetCONNECTION_PRIMARY_SERVING;
    {class} property CONNECTION_SECONDARY_SERVING: Integer read _GetCONNECTION_SECONDARY_SERVING;
    {class} property CONNECTION_UNKNOWN: Integer read _GetCONNECTION_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FREQUENCY_UNKNOWN: Integer read _GetFREQUENCY_UNKNOWN;
    {class} property PHYSICAL_CELL_ID_MAXIMUM_VALUE: Integer read _GetPHYSICAL_CELL_ID_MAXIMUM_VALUE;
    {class} property PHYSICAL_CELL_ID_UNKNOWN: Integer read _GetPHYSICAL_CELL_ID_UNKNOWN;
  end;

  [JavaSignature('android/telephony/PhysicalChannelConfig')]
  JPhysicalChannelConfig = interface(JObject)
    ['{2D5F4CC6-E1E6-46E5-8DE7-44C56E177823}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getBand: Integer; cdecl;
    function getCellBandwidthDownlinkKhz: Integer; cdecl;
    function getCellBandwidthUplinkKhz: Integer; cdecl;
    function getConnectionStatus: Integer; cdecl;
    function getDownlinkChannelNumber: Integer; cdecl;
    function getDownlinkFrequencyKhz: Integer; cdecl;
    function getNetworkType: Integer; cdecl;
    function getPhysicalCellId: Integer; cdecl;
    function getUplinkChannelNumber: Integer; cdecl;
    function getUplinkFrequencyKhz: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPhysicalChannelConfig = class(TJavaGenericImport<JPhysicalChannelConfigClass, JPhysicalChannelConfig>) end;

  JPreciseDataConnectionStateClass = interface(JObjectClass)
    ['{2F117260-BFC4-45B5-AF0A-80EA19CA5A94}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/PreciseDataConnectionState')]
  JPreciseDataConnectionState = interface(JObject)
    ['{32573E4C-2534-4C9F-A40B-99F3DCCD2FC5}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getApnSetting: JApnSetting; cdecl;
    function getId: Integer; cdecl;
    function getLastCauseCode: Integer; cdecl;
    function getLinkProperties: JLinkProperties; cdecl;
    function getNetworkType: Integer; cdecl;
    function getState: Integer; cdecl;
    function getTransportType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJPreciseDataConnectionState = class(TJavaGenericImport<JPreciseDataConnectionStateClass, JPreciseDataConnectionState>) end;

  JRadioAccessSpecifierClass = interface(JObjectClass)
    ['{E22F2976-BC1F-40A5-BEC2-247BA6E2AF4D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(ran: Integer; bands: TJavaArray<Integer>; channels: TJavaArray<Integer>): JRadioAccessSpecifier; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/RadioAccessSpecifier')]
  JRadioAccessSpecifier = interface(JObject)
    ['{EAB1D033-E219-4576-B389-C4633D2D70D7}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getBands: TJavaArray<Integer>; cdecl;
    function getChannels: TJavaArray<Integer>; cdecl;
    function getRadioAccessNetwork: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRadioAccessSpecifier = class(TJavaGenericImport<JRadioAccessSpecifierClass, JRadioAccessSpecifier>) end;

  JServiceStateClass = interface(JObjectClass)
    ['{5E369BCE-8950-478C-88C1-1612B0C7999C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDUPLEX_MODE_FDD: Integer; cdecl;
    {class} function _GetDUPLEX_MODE_TDD: Integer; cdecl;
    {class} function _GetDUPLEX_MODE_UNKNOWN: Integer; cdecl;
    {class} function _GetSTATE_EMERGENCY_ONLY: Integer; cdecl;
    {class} function _GetSTATE_IN_SERVICE: Integer; cdecl;
    {class} function _GetSTATE_OUT_OF_SERVICE: Integer; cdecl;
    {class} function _GetSTATE_POWER_OFF: Integer; cdecl;
    {class} function _GetUNKNOWN_ID: Integer; cdecl;
    {class} function init: JServiceState; cdecl; overload;
    {class} function init(s: JServiceState): JServiceState; cdecl; overload;
    {class} function init(in_: JParcel): JServiceState; cdecl; overload;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DUPLEX_MODE_FDD: Integer read _GetDUPLEX_MODE_FDD;
    {class} property DUPLEX_MODE_TDD: Integer read _GetDUPLEX_MODE_TDD;
    {class} property DUPLEX_MODE_UNKNOWN: Integer read _GetDUPLEX_MODE_UNKNOWN;
    {class} property STATE_EMERGENCY_ONLY: Integer read _GetSTATE_EMERGENCY_ONLY;
    {class} property STATE_IN_SERVICE: Integer read _GetSTATE_IN_SERVICE;
    {class} property STATE_OUT_OF_SERVICE: Integer read _GetSTATE_OUT_OF_SERVICE;
    {class} property STATE_POWER_OFF: Integer read _GetSTATE_POWER_OFF;
    {class} property UNKNOWN_ID: Integer read _GetUNKNOWN_ID;
  end;

  [JavaSignature('android/telephony/ServiceState')]
  JServiceState = interface(JObject)
    ['{981444BD-E25C-4943-97AE-C21D85913DEF}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getCdmaNetworkId: Integer; cdecl;
    function getCdmaSystemId: Integer; cdecl;
    function getCellBandwidths: TJavaArray<Integer>; cdecl;
    function getChannelNumber: Integer; cdecl;
    function getDuplexMode: Integer; cdecl;
    function getIsManualSelection: Boolean; cdecl;
    function getNetworkRegistrationInfoList: JList; cdecl;
    function getOperatorAlphaLong: JString; cdecl;
    function getOperatorAlphaShort: JString; cdecl;
    function getOperatorNumeric: JString; cdecl;
    function getRoaming: Boolean; cdecl;
    function getState: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isSearching: Boolean; cdecl;
    procedure setIsManualSelection(isManual: Boolean); cdecl;
    procedure setOperatorName(longName: JString; shortName: JString; numeric: JString); cdecl;
    procedure setRoaming(roaming: Boolean); cdecl;
    procedure setState(state: Integer); cdecl;
    procedure setStateOff; cdecl;
    procedure setStateOutOfService; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJServiceState = class(TJavaGenericImport<JServiceStateClass, JServiceState>) end;

  JSignalStrengthClass = interface(JObjectClass)
    ['{C579E9F5-9291-4F6F-B4BE-8C8522EE8C5E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetINVALID: Integer; cdecl;
    {class} function init(s: JSignalStrength): JSignalStrength; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property INVALID: Integer read _GetINVALID;
  end;

  [JavaSignature('android/telephony/SignalStrength')]
  JSignalStrength = interface(JObject)
    ['{1260215B-42EC-4F73-8FFB-168FABD93E9A}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getCdmaDbm: Integer; cdecl;//Deprecated
    function getCdmaEcio: Integer; cdecl;//Deprecated
    function getCellSignalStrengths: JList; cdecl; overload;
    function getCellSignalStrengths(clazz: Jlang_Class): JList; cdecl; overload;
    function getEvdoDbm: Integer; cdecl;//Deprecated
    function getEvdoEcio: Integer; cdecl;//Deprecated
    function getEvdoSnr: Integer; cdecl;//Deprecated
    function getGsmBitErrorRate: Integer; cdecl;//Deprecated
    function getGsmSignalStrength: Integer; cdecl;//Deprecated
    function getLevel: Integer; cdecl;
    function getTimestampMillis: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function isGsm: Boolean; cdecl;//Deprecated
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJSignalStrength = class(TJavaGenericImport<JSignalStrengthClass, JSignalStrength>) end;

  JSignalStrengthUpdateRequestClass = interface(JObjectClass)
    ['{65B28B1F-FE34-4E90-A1BB-B279359E69A0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/SignalStrengthUpdateRequest')]
  JSignalStrengthUpdateRequest = interface(JObject)
    ['{6D7611B6-E65B-47B3-ACF3-D312B4CCEEE5}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getSignalThresholdInfos: JCollection; cdecl;
    function hashCode: Integer; cdecl;
    function isReportingRequestedWhileIdle: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSignalStrengthUpdateRequest = class(TJavaGenericImport<JSignalStrengthUpdateRequestClass, JSignalStrengthUpdateRequest>) end;

  JSignalStrengthUpdateRequest_BuilderClass = interface(JObjectClass)
    ['{6B060499-1099-473B-90D7-94C26C216D78}']
    {class} function init: JSignalStrengthUpdateRequest_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/SignalStrengthUpdateRequest$Builder')]
  JSignalStrengthUpdateRequest_Builder = interface(JObject)
    ['{C1E70529-E54A-4822-8B75-5D449048BA96}']
    function build: JSignalStrengthUpdateRequest; cdecl;
    function setReportingRequestedWhileIdle(isReportingRequestedWhileIdle: Boolean): JSignalStrengthUpdateRequest_Builder; cdecl;
    function setSignalThresholdInfos(signalThresholdInfos: JCollection): JSignalStrengthUpdateRequest_Builder; cdecl;
  end;
  TJSignalStrengthUpdateRequest_Builder = class(TJavaGenericImport<JSignalStrengthUpdateRequest_BuilderClass, JSignalStrengthUpdateRequest_Builder>) end;

  JSignalThresholdInfoClass = interface(JObjectClass)
    ['{02675FF6-6E54-43B9-8CF5-E05AE26A69E4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_RSCP: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_RSRP: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_RSRQ: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_RSSI: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_RSSNR: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_SSRSRP: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_SSRSRQ: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_SSSINR: Integer; cdecl;
    {class} function _GetSIGNAL_MEASUREMENT_TYPE_UNKNOWN: Integer; cdecl;
    {class} function getMaximumNumberOfThresholdsAllowed: Integer; cdecl;
    {class} function getMinimumNumberOfThresholdsAllowed: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SIGNAL_MEASUREMENT_TYPE_RSCP: Integer read _GetSIGNAL_MEASUREMENT_TYPE_RSCP;
    {class} property SIGNAL_MEASUREMENT_TYPE_RSRP: Integer read _GetSIGNAL_MEASUREMENT_TYPE_RSRP;
    {class} property SIGNAL_MEASUREMENT_TYPE_RSRQ: Integer read _GetSIGNAL_MEASUREMENT_TYPE_RSRQ;
    {class} property SIGNAL_MEASUREMENT_TYPE_RSSI: Integer read _GetSIGNAL_MEASUREMENT_TYPE_RSSI;
    {class} property SIGNAL_MEASUREMENT_TYPE_RSSNR: Integer read _GetSIGNAL_MEASUREMENT_TYPE_RSSNR;
    {class} property SIGNAL_MEASUREMENT_TYPE_SSRSRP: Integer read _GetSIGNAL_MEASUREMENT_TYPE_SSRSRP;
    {class} property SIGNAL_MEASUREMENT_TYPE_SSRSRQ: Integer read _GetSIGNAL_MEASUREMENT_TYPE_SSRSRQ;
    {class} property SIGNAL_MEASUREMENT_TYPE_SSSINR: Integer read _GetSIGNAL_MEASUREMENT_TYPE_SSSINR;
    {class} property SIGNAL_MEASUREMENT_TYPE_UNKNOWN: Integer read _GetSIGNAL_MEASUREMENT_TYPE_UNKNOWN;
  end;

  [JavaSignature('android/telephony/SignalThresholdInfo')]
  JSignalThresholdInfo = interface(JObject)
    ['{B154762B-0101-4683-BCAB-28FE781C61C3}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getRadioAccessNetworkType: Integer; cdecl;
    function getSignalMeasurementType: Integer; cdecl;
    function getThresholds: TJavaArray<Integer>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJSignalThresholdInfo = class(TJavaGenericImport<JSignalThresholdInfoClass, JSignalThresholdInfo>) end;

  JSignalThresholdInfo_BuilderClass = interface(JObjectClass)
    ['{1A8EC048-2146-4AC0-8155-6437571A0E54}']
    {class} function init: JSignalThresholdInfo_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/SignalThresholdInfo$Builder')]
  JSignalThresholdInfo_Builder = interface(JObject)
    ['{48E03E3A-8D6F-4360-A02E-4E44AA3C4E1A}']
    function build: JSignalThresholdInfo; cdecl;
    function setRadioAccessNetworkType(ran: Integer): JSignalThresholdInfo_Builder; cdecl;
    function setSignalMeasurementType(signalMeasurementType: Integer): JSignalThresholdInfo_Builder; cdecl;
    function setThresholds(thresholds: TJavaArray<Integer>): JSignalThresholdInfo_Builder; cdecl;
  end;
  TJSignalThresholdInfo_Builder = class(TJavaGenericImport<JSignalThresholdInfo_BuilderClass, JSignalThresholdInfo_Builder>) end;

  JSmsManagerClass = interface(JObjectClass)
    ['{5FD2ABA7-01A0-4AA1-BDE6-B125CD6A6752}']
    {class} function _GetEXTRA_MMS_DATA: JString; cdecl;
    {class} function _GetEXTRA_MMS_HTTP_STATUS: JString; cdecl;
    {class} function _GetMMS_CONFIG_ALIAS_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_ALIAS_MAX_CHARS: JString; cdecl;
    {class} function _GetMMS_CONFIG_ALIAS_MIN_CHARS: JString; cdecl;
    {class} function _GetMMS_CONFIG_ALLOW_ATTACH_AUDIO: JString; cdecl;
    {class} function _GetMMS_CONFIG_APPEND_TRANSACTION_ID: JString; cdecl;
    {class} function _GetMMS_CONFIG_EMAIL_GATEWAY_NUMBER: JString; cdecl;
    {class} function _GetMMS_CONFIG_GROUP_MMS_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_HTTP_PARAMS: JString; cdecl;
    {class} function _GetMMS_CONFIG_HTTP_SOCKET_TIMEOUT: JString; cdecl;
    {class} function _GetMMS_CONFIG_MAX_IMAGE_HEIGHT: JString; cdecl;
    {class} function _GetMMS_CONFIG_MAX_IMAGE_WIDTH: JString; cdecl;
    {class} function _GetMMS_CONFIG_MAX_MESSAGE_SIZE: JString; cdecl;
    {class} function _GetMMS_CONFIG_MESSAGE_TEXT_MAX_SIZE: JString; cdecl;
    {class} function _GetMMS_CONFIG_MMS_DELIVERY_REPORT_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_MMS_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_MMS_READ_REPORT_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_MULTIPART_SMS_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_NAI_SUFFIX: JString; cdecl;
    {class} function _GetMMS_CONFIG_NOTIFY_WAP_MMSC_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_RECIPIENT_LIMIT: JString; cdecl;
    {class} function _GetMMS_CONFIG_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES: JString; cdecl;
    {class} function _GetMMS_CONFIG_SHOW_CELL_BROADCAST_APP_LINKS: JString; cdecl;
    {class} function _GetMMS_CONFIG_SMS_DELIVERY_REPORT_ENABLED: JString; cdecl;
    {class} function _GetMMS_CONFIG_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD: JString; cdecl;
    {class} function _GetMMS_CONFIG_SMS_TO_MMS_TEXT_THRESHOLD: JString; cdecl;
    {class} function _GetMMS_CONFIG_SUBJECT_MAX_LENGTH: JString; cdecl;
    {class} function _GetMMS_CONFIG_SUPPORT_HTTP_CHARSET_HEADER: JString; cdecl;
    {class} function _GetMMS_CONFIG_SUPPORT_MMS_CONTENT_DISPOSITION: JString; cdecl;
    {class} function _GetMMS_CONFIG_UA_PROF_TAG_NAME: JString; cdecl;
    {class} function _GetMMS_CONFIG_UA_PROF_URL: JString; cdecl;
    {class} function _GetMMS_CONFIG_USER_AGENT: JString; cdecl;
    {class} function _GetMMS_ERROR_CONFIGURATION_ERROR: Integer; cdecl;
    {class} function _GetMMS_ERROR_DATA_DISABLED: Integer; cdecl;
    {class} function _GetMMS_ERROR_HTTP_FAILURE: Integer; cdecl;
    {class} function _GetMMS_ERROR_INACTIVE_SUBSCRIPTION: Integer; cdecl;
    {class} function _GetMMS_ERROR_INVALID_APN: Integer; cdecl;
    {class} function _GetMMS_ERROR_INVALID_SUBSCRIPTION_ID: Integer; cdecl;
    {class} function _GetMMS_ERROR_IO_ERROR: Integer; cdecl;
    {class} function _GetMMS_ERROR_NO_DATA_NETWORK: Integer; cdecl;
    {class} function _GetMMS_ERROR_RETRY: Integer; cdecl;
    {class} function _GetMMS_ERROR_UNABLE_CONNECT_MMS: Integer; cdecl;
    {class} function _GetMMS_ERROR_UNSPECIFIED: Integer; cdecl;
    {class} function _GetRESULT_BLUETOOTH_DISCONNECTED: Integer; cdecl;
    {class} function _GetRESULT_CANCELLED: Integer; cdecl;
    {class} function _GetRESULT_ENCODING_ERROR: Integer; cdecl;
    {class} function _GetRESULT_ERROR_FDN_CHECK_FAILURE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_GENERIC_FAILURE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_LIMIT_EXCEEDED: Integer; cdecl;
    {class} function _GetRESULT_ERROR_NONE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_NO_SERVICE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_NULL_PDU: Integer; cdecl;
    {class} function _GetRESULT_ERROR_RADIO_OFF: Integer; cdecl;
    {class} function _GetRESULT_ERROR_SHORT_CODE_NEVER_ALLOWED: Integer; cdecl;
    {class} function _GetRESULT_ERROR_SHORT_CODE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetRESULT_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetRESULT_INVALID_ARGUMENTS: Integer; cdecl;
    {class} function _GetRESULT_INVALID_BLUETOOTH_ADDRESS: Integer; cdecl;
    {class} function _GetRESULT_INVALID_SMSC_ADDRESS: Integer; cdecl;
    {class} function _GetRESULT_INVALID_SMS_FORMAT: Integer; cdecl;
    {class} function _GetRESULT_INVALID_STATE: Integer; cdecl;
    {class} function _GetRESULT_MODEM_ERROR: Integer; cdecl;
    {class} function _GetRESULT_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetRESULT_NETWORK_REJECT: Integer; cdecl;
    {class} function _GetRESULT_NO_BLUETOOTH_SERVICE: Integer; cdecl;
    {class} function _GetRESULT_NO_DEFAULT_SMS_APP: Integer; cdecl;
    {class} function _GetRESULT_NO_MEMORY: Integer; cdecl;
    {class} function _GetRESULT_NO_RESOURCES: Integer; cdecl;
    {class} function _GetRESULT_OPERATION_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetRESULT_RADIO_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_DISPATCH_FAILURE: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_INJECTED_NULL_PDU: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_NULL_MESSAGE_FROM_RIL: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_RUNTIME_EXCEPTION: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_SQL_EXCEPTION: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_URI_EXCEPTION: Integer; cdecl;
    {class} function _GetRESULT_RECEIVE_WHILE_ENCRYPTED: Integer; cdecl;
    {class} function _GetRESULT_REMOTE_EXCEPTION: Integer; cdecl;
    {class} function _GetRESULT_REQUEST_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetRESULT_RIL_ACCESS_BARRED: Integer; cdecl;
    {class} function _GetRESULT_RIL_BLOCKED_DUE_TO_CALL: Integer; cdecl;
    {class} function _GetRESULT_RIL_CANCELLED: Integer; cdecl;
    {class} function _GetRESULT_RIL_ENCODING_ERR: Integer; cdecl;
    {class} function _GetRESULT_RIL_GENERIC_ERROR: Integer; cdecl;
    {class} function _GetRESULT_RIL_INTERNAL_ERR: Integer; cdecl;
    {class} function _GetRESULT_RIL_INVALID_ARGUMENTS: Integer; cdecl;
    {class} function _GetRESULT_RIL_INVALID_MODEM_STATE: Integer; cdecl;
    {class} function _GetRESULT_RIL_INVALID_SMSC_ADDRESS: Integer; cdecl;
    {class} function _GetRESULT_RIL_INVALID_SMS_FORMAT: Integer; cdecl;
    {class} function _GetRESULT_RIL_INVALID_STATE: Integer; cdecl;
    {class} function _GetRESULT_RIL_MODEM_ERR: Integer; cdecl;
    {class} function _GetRESULT_RIL_NETWORK_ERR: Integer; cdecl;
    {class} function _GetRESULT_RIL_NETWORK_NOT_READY: Integer; cdecl;
    {class} function _GetRESULT_RIL_NETWORK_REJECT: Integer; cdecl;
    {class} function _GetRESULT_RIL_NO_MEMORY: Integer; cdecl;
    {class} function _GetRESULT_RIL_NO_RESOURCES: Integer; cdecl;
    {class} function _GetRESULT_RIL_OPERATION_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetRESULT_RIL_RADIO_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetRESULT_RIL_REQUEST_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetRESULT_RIL_REQUEST_RATE_LIMITED: Integer; cdecl;
    {class} function _GetRESULT_RIL_SIMULTANEOUS_SMS_AND_CALL_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetRESULT_RIL_SIM_ABSENT: Integer; cdecl;
    {class} function _GetRESULT_RIL_SMS_SEND_FAIL_RETRY: Integer; cdecl;
    {class} function _GetRESULT_RIL_SYSTEM_ERR: Integer; cdecl;
    {class} function _GetRESULT_SMS_BLOCKED_DURING_EMERGENCY: Integer; cdecl;
    {class} function _GetRESULT_SMS_SEND_RETRY_FAILED: Integer; cdecl;
    {class} function _GetRESULT_SYSTEM_ERROR: Integer; cdecl;
    {class} function _GetRESULT_UNEXPECTED_EVENT_STOP_SENDING: Integer; cdecl;
    {class} function _GetSTATUS_ON_ICC_FREE: Integer; cdecl;
    {class} function _GetSTATUS_ON_ICC_READ: Integer; cdecl;
    {class} function _GetSTATUS_ON_ICC_SENT: Integer; cdecl;
    {class} function _GetSTATUS_ON_ICC_UNREAD: Integer; cdecl;
    {class} function _GetSTATUS_ON_ICC_UNSENT: Integer; cdecl;
    {class} function getDefault: JSmsManager; cdecl;//Deprecated
    {class} function getDefaultSmsSubscriptionId: Integer; cdecl;
    {class} function getSmsManagerForSubscriptionId(subId: Integer): JSmsManager; cdecl;//Deprecated
    {class} property EXTRA_MMS_DATA: JString read _GetEXTRA_MMS_DATA;
    {class} property EXTRA_MMS_HTTP_STATUS: JString read _GetEXTRA_MMS_HTTP_STATUS;
    {class} property MMS_CONFIG_ALIAS_ENABLED: JString read _GetMMS_CONFIG_ALIAS_ENABLED;
    {class} property MMS_CONFIG_ALIAS_MAX_CHARS: JString read _GetMMS_CONFIG_ALIAS_MAX_CHARS;
    {class} property MMS_CONFIG_ALIAS_MIN_CHARS: JString read _GetMMS_CONFIG_ALIAS_MIN_CHARS;
    {class} property MMS_CONFIG_ALLOW_ATTACH_AUDIO: JString read _GetMMS_CONFIG_ALLOW_ATTACH_AUDIO;
    {class} property MMS_CONFIG_APPEND_TRANSACTION_ID: JString read _GetMMS_CONFIG_APPEND_TRANSACTION_ID;
    {class} property MMS_CONFIG_EMAIL_GATEWAY_NUMBER: JString read _GetMMS_CONFIG_EMAIL_GATEWAY_NUMBER;
    {class} property MMS_CONFIG_GROUP_MMS_ENABLED: JString read _GetMMS_CONFIG_GROUP_MMS_ENABLED;
    {class} property MMS_CONFIG_HTTP_PARAMS: JString read _GetMMS_CONFIG_HTTP_PARAMS;
    {class} property MMS_CONFIG_HTTP_SOCKET_TIMEOUT: JString read _GetMMS_CONFIG_HTTP_SOCKET_TIMEOUT;
    {class} property MMS_CONFIG_MAX_IMAGE_HEIGHT: JString read _GetMMS_CONFIG_MAX_IMAGE_HEIGHT;
    {class} property MMS_CONFIG_MAX_IMAGE_WIDTH: JString read _GetMMS_CONFIG_MAX_IMAGE_WIDTH;
    {class} property MMS_CONFIG_MAX_MESSAGE_SIZE: JString read _GetMMS_CONFIG_MAX_MESSAGE_SIZE;
    {class} property MMS_CONFIG_MESSAGE_TEXT_MAX_SIZE: JString read _GetMMS_CONFIG_MESSAGE_TEXT_MAX_SIZE;
    {class} property MMS_CONFIG_MMS_DELIVERY_REPORT_ENABLED: JString read _GetMMS_CONFIG_MMS_DELIVERY_REPORT_ENABLED;
    {class} property MMS_CONFIG_MMS_ENABLED: JString read _GetMMS_CONFIG_MMS_ENABLED;
    {class} property MMS_CONFIG_MMS_READ_REPORT_ENABLED: JString read _GetMMS_CONFIG_MMS_READ_REPORT_ENABLED;
    {class} property MMS_CONFIG_MULTIPART_SMS_ENABLED: JString read _GetMMS_CONFIG_MULTIPART_SMS_ENABLED;
    {class} property MMS_CONFIG_NAI_SUFFIX: JString read _GetMMS_CONFIG_NAI_SUFFIX;
    {class} property MMS_CONFIG_NOTIFY_WAP_MMSC_ENABLED: JString read _GetMMS_CONFIG_NOTIFY_WAP_MMSC_ENABLED;
    {class} property MMS_CONFIG_RECIPIENT_LIMIT: JString read _GetMMS_CONFIG_RECIPIENT_LIMIT;
    {class} property MMS_CONFIG_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES: JString read _GetMMS_CONFIG_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES;
    {class} property MMS_CONFIG_SHOW_CELL_BROADCAST_APP_LINKS: JString read _GetMMS_CONFIG_SHOW_CELL_BROADCAST_APP_LINKS;
    {class} property MMS_CONFIG_SMS_DELIVERY_REPORT_ENABLED: JString read _GetMMS_CONFIG_SMS_DELIVERY_REPORT_ENABLED;
    {class} property MMS_CONFIG_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD: JString read _GetMMS_CONFIG_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD;
    {class} property MMS_CONFIG_SMS_TO_MMS_TEXT_THRESHOLD: JString read _GetMMS_CONFIG_SMS_TO_MMS_TEXT_THRESHOLD;
    {class} property MMS_CONFIG_SUBJECT_MAX_LENGTH: JString read _GetMMS_CONFIG_SUBJECT_MAX_LENGTH;
    {class} property MMS_CONFIG_SUPPORT_HTTP_CHARSET_HEADER: JString read _GetMMS_CONFIG_SUPPORT_HTTP_CHARSET_HEADER;
    {class} property MMS_CONFIG_SUPPORT_MMS_CONTENT_DISPOSITION: JString read _GetMMS_CONFIG_SUPPORT_MMS_CONTENT_DISPOSITION;
    {class} property MMS_CONFIG_UA_PROF_TAG_NAME: JString read _GetMMS_CONFIG_UA_PROF_TAG_NAME;
    {class} property MMS_CONFIG_UA_PROF_URL: JString read _GetMMS_CONFIG_UA_PROF_URL;
    {class} property MMS_CONFIG_USER_AGENT: JString read _GetMMS_CONFIG_USER_AGENT;
    {class} property MMS_ERROR_CONFIGURATION_ERROR: Integer read _GetMMS_ERROR_CONFIGURATION_ERROR;
    {class} property MMS_ERROR_DATA_DISABLED: Integer read _GetMMS_ERROR_DATA_DISABLED;
    {class} property MMS_ERROR_HTTP_FAILURE: Integer read _GetMMS_ERROR_HTTP_FAILURE;
    {class} property MMS_ERROR_INACTIVE_SUBSCRIPTION: Integer read _GetMMS_ERROR_INACTIVE_SUBSCRIPTION;
    {class} property MMS_ERROR_INVALID_APN: Integer read _GetMMS_ERROR_INVALID_APN;
    {class} property MMS_ERROR_INVALID_SUBSCRIPTION_ID: Integer read _GetMMS_ERROR_INVALID_SUBSCRIPTION_ID;
    {class} property MMS_ERROR_IO_ERROR: Integer read _GetMMS_ERROR_IO_ERROR;
    {class} property MMS_ERROR_NO_DATA_NETWORK: Integer read _GetMMS_ERROR_NO_DATA_NETWORK;
    {class} property MMS_ERROR_RETRY: Integer read _GetMMS_ERROR_RETRY;
    {class} property MMS_ERROR_UNABLE_CONNECT_MMS: Integer read _GetMMS_ERROR_UNABLE_CONNECT_MMS;
    {class} property MMS_ERROR_UNSPECIFIED: Integer read _GetMMS_ERROR_UNSPECIFIED;
    {class} property RESULT_BLUETOOTH_DISCONNECTED: Integer read _GetRESULT_BLUETOOTH_DISCONNECTED;
    {class} property RESULT_CANCELLED: Integer read _GetRESULT_CANCELLED;
    {class} property RESULT_ENCODING_ERROR: Integer read _GetRESULT_ENCODING_ERROR;
    {class} property RESULT_ERROR_FDN_CHECK_FAILURE: Integer read _GetRESULT_ERROR_FDN_CHECK_FAILURE;
    {class} property RESULT_ERROR_GENERIC_FAILURE: Integer read _GetRESULT_ERROR_GENERIC_FAILURE;
    {class} property RESULT_ERROR_LIMIT_EXCEEDED: Integer read _GetRESULT_ERROR_LIMIT_EXCEEDED;
    {class} property RESULT_ERROR_NONE: Integer read _GetRESULT_ERROR_NONE;
    {class} property RESULT_ERROR_NO_SERVICE: Integer read _GetRESULT_ERROR_NO_SERVICE;
    {class} property RESULT_ERROR_NULL_PDU: Integer read _GetRESULT_ERROR_NULL_PDU;
    {class} property RESULT_ERROR_RADIO_OFF: Integer read _GetRESULT_ERROR_RADIO_OFF;
    {class} property RESULT_ERROR_SHORT_CODE_NEVER_ALLOWED: Integer read _GetRESULT_ERROR_SHORT_CODE_NEVER_ALLOWED;
    {class} property RESULT_ERROR_SHORT_CODE_NOT_ALLOWED: Integer read _GetRESULT_ERROR_SHORT_CODE_NOT_ALLOWED;
    {class} property RESULT_INTERNAL_ERROR: Integer read _GetRESULT_INTERNAL_ERROR;
    {class} property RESULT_INVALID_ARGUMENTS: Integer read _GetRESULT_INVALID_ARGUMENTS;
    {class} property RESULT_INVALID_BLUETOOTH_ADDRESS: Integer read _GetRESULT_INVALID_BLUETOOTH_ADDRESS;
    {class} property RESULT_INVALID_SMSC_ADDRESS: Integer read _GetRESULT_INVALID_SMSC_ADDRESS;
    {class} property RESULT_INVALID_SMS_FORMAT: Integer read _GetRESULT_INVALID_SMS_FORMAT;
    {class} property RESULT_INVALID_STATE: Integer read _GetRESULT_INVALID_STATE;
    {class} property RESULT_MODEM_ERROR: Integer read _GetRESULT_MODEM_ERROR;
    {class} property RESULT_NETWORK_ERROR: Integer read _GetRESULT_NETWORK_ERROR;
    {class} property RESULT_NETWORK_REJECT: Integer read _GetRESULT_NETWORK_REJECT;
    {class} property RESULT_NO_BLUETOOTH_SERVICE: Integer read _GetRESULT_NO_BLUETOOTH_SERVICE;
    {class} property RESULT_NO_DEFAULT_SMS_APP: Integer read _GetRESULT_NO_DEFAULT_SMS_APP;
    {class} property RESULT_NO_MEMORY: Integer read _GetRESULT_NO_MEMORY;
    {class} property RESULT_NO_RESOURCES: Integer read _GetRESULT_NO_RESOURCES;
    {class} property RESULT_OPERATION_NOT_ALLOWED: Integer read _GetRESULT_OPERATION_NOT_ALLOWED;
    {class} property RESULT_RADIO_NOT_AVAILABLE: Integer read _GetRESULT_RADIO_NOT_AVAILABLE;
    {class} property RESULT_RECEIVE_DISPATCH_FAILURE: Integer read _GetRESULT_RECEIVE_DISPATCH_FAILURE;
    {class} property RESULT_RECEIVE_INJECTED_NULL_PDU: Integer read _GetRESULT_RECEIVE_INJECTED_NULL_PDU;
    {class} property RESULT_RECEIVE_NULL_MESSAGE_FROM_RIL: Integer read _GetRESULT_RECEIVE_NULL_MESSAGE_FROM_RIL;
    {class} property RESULT_RECEIVE_RUNTIME_EXCEPTION: Integer read _GetRESULT_RECEIVE_RUNTIME_EXCEPTION;
    {class} property RESULT_RECEIVE_SQL_EXCEPTION: Integer read _GetRESULT_RECEIVE_SQL_EXCEPTION;
    {class} property RESULT_RECEIVE_URI_EXCEPTION: Integer read _GetRESULT_RECEIVE_URI_EXCEPTION;
    {class} property RESULT_RECEIVE_WHILE_ENCRYPTED: Integer read _GetRESULT_RECEIVE_WHILE_ENCRYPTED;
    {class} property RESULT_REMOTE_EXCEPTION: Integer read _GetRESULT_REMOTE_EXCEPTION;
    {class} property RESULT_REQUEST_NOT_SUPPORTED: Integer read _GetRESULT_REQUEST_NOT_SUPPORTED;
    {class} property RESULT_RIL_ACCESS_BARRED: Integer read _GetRESULT_RIL_ACCESS_BARRED;
    {class} property RESULT_RIL_BLOCKED_DUE_TO_CALL: Integer read _GetRESULT_RIL_BLOCKED_DUE_TO_CALL;
    {class} property RESULT_RIL_CANCELLED: Integer read _GetRESULT_RIL_CANCELLED;
    {class} property RESULT_RIL_ENCODING_ERR: Integer read _GetRESULT_RIL_ENCODING_ERR;
    {class} property RESULT_RIL_GENERIC_ERROR: Integer read _GetRESULT_RIL_GENERIC_ERROR;
    {class} property RESULT_RIL_INTERNAL_ERR: Integer read _GetRESULT_RIL_INTERNAL_ERR;
    {class} property RESULT_RIL_INVALID_ARGUMENTS: Integer read _GetRESULT_RIL_INVALID_ARGUMENTS;
    {class} property RESULT_RIL_INVALID_MODEM_STATE: Integer read _GetRESULT_RIL_INVALID_MODEM_STATE;
    {class} property RESULT_RIL_INVALID_SMSC_ADDRESS: Integer read _GetRESULT_RIL_INVALID_SMSC_ADDRESS;
    {class} property RESULT_RIL_INVALID_SMS_FORMAT: Integer read _GetRESULT_RIL_INVALID_SMS_FORMAT;
    {class} property RESULT_RIL_INVALID_STATE: Integer read _GetRESULT_RIL_INVALID_STATE;
    {class} property RESULT_RIL_MODEM_ERR: Integer read _GetRESULT_RIL_MODEM_ERR;
    {class} property RESULT_RIL_NETWORK_ERR: Integer read _GetRESULT_RIL_NETWORK_ERR;
    {class} property RESULT_RIL_NETWORK_NOT_READY: Integer read _GetRESULT_RIL_NETWORK_NOT_READY;
    {class} property RESULT_RIL_NETWORK_REJECT: Integer read _GetRESULT_RIL_NETWORK_REJECT;
    {class} property RESULT_RIL_NO_MEMORY: Integer read _GetRESULT_RIL_NO_MEMORY;
    {class} property RESULT_RIL_NO_RESOURCES: Integer read _GetRESULT_RIL_NO_RESOURCES;
    {class} property RESULT_RIL_OPERATION_NOT_ALLOWED: Integer read _GetRESULT_RIL_OPERATION_NOT_ALLOWED;
    {class} property RESULT_RIL_RADIO_NOT_AVAILABLE: Integer read _GetRESULT_RIL_RADIO_NOT_AVAILABLE;
    {class} property RESULT_RIL_REQUEST_NOT_SUPPORTED: Integer read _GetRESULT_RIL_REQUEST_NOT_SUPPORTED;
    {class} property RESULT_RIL_REQUEST_RATE_LIMITED: Integer read _GetRESULT_RIL_REQUEST_RATE_LIMITED;
    {class} property RESULT_RIL_SIMULTANEOUS_SMS_AND_CALL_NOT_ALLOWED: Integer read _GetRESULT_RIL_SIMULTANEOUS_SMS_AND_CALL_NOT_ALLOWED;
    {class} property RESULT_RIL_SIM_ABSENT: Integer read _GetRESULT_RIL_SIM_ABSENT;
    {class} property RESULT_RIL_SMS_SEND_FAIL_RETRY: Integer read _GetRESULT_RIL_SMS_SEND_FAIL_RETRY;
    {class} property RESULT_RIL_SYSTEM_ERR: Integer read _GetRESULT_RIL_SYSTEM_ERR;
    {class} property RESULT_SMS_BLOCKED_DURING_EMERGENCY: Integer read _GetRESULT_SMS_BLOCKED_DURING_EMERGENCY;
    {class} property RESULT_SMS_SEND_RETRY_FAILED: Integer read _GetRESULT_SMS_SEND_RETRY_FAILED;
    {class} property RESULT_SYSTEM_ERROR: Integer read _GetRESULT_SYSTEM_ERROR;
    {class} property RESULT_UNEXPECTED_EVENT_STOP_SENDING: Integer read _GetRESULT_UNEXPECTED_EVENT_STOP_SENDING;
    {class} property STATUS_ON_ICC_FREE: Integer read _GetSTATUS_ON_ICC_FREE;
    {class} property STATUS_ON_ICC_READ: Integer read _GetSTATUS_ON_ICC_READ;
    {class} property STATUS_ON_ICC_SENT: Integer read _GetSTATUS_ON_ICC_SENT;
    {class} property STATUS_ON_ICC_UNREAD: Integer read _GetSTATUS_ON_ICC_UNREAD;
    {class} property STATUS_ON_ICC_UNSENT: Integer read _GetSTATUS_ON_ICC_UNSENT;
  end;

  [JavaSignature('android/telephony/SmsManager')]
  JSmsManager = interface(JObject)
    ['{8C75DE6B-0BC5-4B5B-9B70-E714A01033E0}']
    function createAppSpecificSmsToken(intent: JPendingIntent): JString; cdecl;
    function createAppSpecificSmsTokenWithPackageInfo(prefixes: JString; intent: JPendingIntent): JString; cdecl;
    function createForSubscriptionId(subId: Integer): JSmsManager; cdecl;
    function divideMessage(text: JString): JArrayList; cdecl;
    procedure downloadMultimediaMessage(context: JContext; locationUrl: JString; contentUri: Jnet_Uri; configOverrides: JBundle; downloadedIntent: JPendingIntent); cdecl; overload;
    procedure downloadMultimediaMessage(context: JContext; locationUrl: JString; contentUri: Jnet_Uri; configOverrides: JBundle; downloadedIntent: JPendingIntent; messageId: Int64); cdecl; overload;
    function getCarrierConfigValues: JBundle; cdecl;
    function getSmsCapacityOnIcc: Integer; cdecl;
    procedure getSmsMessagesForFinancialApp(params: JBundle; executor: JExecutor; callback: JSmsManager_FinancialSmsCallback); cdecl;
    function getSmscAddress: JString; cdecl;
    function getSubscriptionId: Integer; cdecl;
    procedure injectSmsPdu(pdu: TJavaArray<Byte>; format: JString; receivedIntent: JPendingIntent); cdecl;
    procedure sendDataMessage(destinationAddress: JString; scAddress: JString; destinationPort: SmallInt; data: TJavaArray<Byte>; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent); cdecl;
    procedure sendMultimediaMessage(context: JContext; contentUri: Jnet_Uri; locationUrl: JString; configOverrides: JBundle; sentIntent: JPendingIntent); cdecl; overload;
    procedure sendMultimediaMessage(context: JContext; contentUri: Jnet_Uri; locationUrl: JString; configOverrides: JBundle; sentIntent: JPendingIntent; messageId: Int64); cdecl; overload;
    procedure sendMultipartTextMessage(destinationAddress: JString; scAddress: JString; parts: JArrayList; sentIntents: JArrayList; deliveryIntents: JArrayList); cdecl; overload;
    procedure sendMultipartTextMessage(destinationAddress: JString; scAddress: JString; parts: JList; sentIntents: JList; deliveryIntents: JList; messageId: Int64); cdecl; overload;
    procedure sendMultipartTextMessage(destinationAddress: JString; scAddress: JString; parts: JList; sentIntents: JList; deliveryIntents: JList; packageName: JString; attributionTag: JString); cdecl; overload;
    procedure sendTextMessage(destinationAddress: JString; scAddress: JString; text: JString; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent); cdecl; overload;
    procedure sendTextMessage(destinationAddress: JString; scAddress: JString; text: JString; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent; messageId: Int64); cdecl; overload;
    procedure sendTextMessageWithoutPersisting(destinationAddress: JString; scAddress: JString; text: JString; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent); cdecl;
    function setSmscAddress(smsc: JString): Boolean; cdecl;
  end;
  TJSmsManager = class(TJavaGenericImport<JSmsManagerClass, JSmsManager>) end;

  JSmsManager_FinancialSmsCallbackClass = interface(JObjectClass)
    ['{F84D91C2-97DD-4E46-ABF1-51322790E2BD}']
    {class} function init: JSmsManager_FinancialSmsCallback; cdecl;
  end;

  [JavaSignature('android/telephony/SmsManager$FinancialSmsCallback')]
  JSmsManager_FinancialSmsCallback = interface(JObject)
    ['{A8B6B734-8F19-460F-B3F5-4903D2F46B5B}']
    procedure onFinancialSmsMessages(msgs: JCursorWindow); cdecl;
  end;
  TJSmsManager_FinancialSmsCallback = class(TJavaGenericImport<JSmsManager_FinancialSmsCallbackClass, JSmsManager_FinancialSmsCallback>) end;

  JSmsMessageClass = interface(JObjectClass)
    ['{227C1E7B-3064-474A-8930-D244309E7D27}']
    {class} function _GetENCODING_16BIT: Integer; cdecl;
    {class} function _GetENCODING_7BIT: Integer; cdecl;
    {class} function _GetENCODING_8BIT: Integer; cdecl;
    {class} function _GetENCODING_KSC5601: Integer; cdecl;
    {class} function _GetENCODING_UNKNOWN: Integer; cdecl;
    {class} function _GetFORMAT_3GPP: JString; cdecl;
    {class} function _GetFORMAT_3GPP2: JString; cdecl;
    {class} function _GetMAX_USER_DATA_BYTES: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_BYTES_WITH_HEADER: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_SEPTETS: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_SEPTETS_WITH_HEADER: Integer; cdecl;
    {class} function calculateLength(msgBody: JCharSequence; use7bitOnly: Boolean): TJavaArray<Integer>; cdecl; overload;
    {class} function calculateLength(messageBody: JString; use7bitOnly: Boolean): TJavaArray<Integer>; cdecl; overload;
    {class} function createFromPdu(pdu: TJavaArray<Byte>): JSmsMessage; cdecl; overload;//Deprecated
    {class} function createFromPdu(pdu: TJavaArray<Byte>; format: JString): JSmsMessage; cdecl; overload;
    {class} function getSubmitPdu(scAddress: JString; destinationAddress: JString; message: JString; statusReportRequested: Boolean): JSmsMessage_SubmitPdu; cdecl; overload;
    {class} function getSubmitPdu(scAddress: JString; destinationAddress: JString; destinationPort: SmallInt; data: TJavaArray<Byte>; statusReportRequested: Boolean): JSmsMessage_SubmitPdu; cdecl; overload;
    {class} function getTPLayerLengthForPDU(pdu: JString): Integer; cdecl;
    {class} property ENCODING_16BIT: Integer read _GetENCODING_16BIT;
    {class} property ENCODING_7BIT: Integer read _GetENCODING_7BIT;
    {class} property ENCODING_8BIT: Integer read _GetENCODING_8BIT;
    {class} property ENCODING_KSC5601: Integer read _GetENCODING_KSC5601;
    {class} property ENCODING_UNKNOWN: Integer read _GetENCODING_UNKNOWN;
    {class} property FORMAT_3GPP: JString read _GetFORMAT_3GPP;
    {class} property FORMAT_3GPP2: JString read _GetFORMAT_3GPP2;
    {class} property MAX_USER_DATA_BYTES: Integer read _GetMAX_USER_DATA_BYTES;
    {class} property MAX_USER_DATA_BYTES_WITH_HEADER: Integer read _GetMAX_USER_DATA_BYTES_WITH_HEADER;
    {class} property MAX_USER_DATA_SEPTETS: Integer read _GetMAX_USER_DATA_SEPTETS;
    {class} property MAX_USER_DATA_SEPTETS_WITH_HEADER: Integer read _GetMAX_USER_DATA_SEPTETS_WITH_HEADER;
  end;

  [JavaSignature('android/telephony/SmsMessage')]
  JSmsMessage = interface(JObject)
    ['{012AA641-B8DD-4F6A-9056-98498FB0B05C}']
    function getDisplayMessageBody: JString; cdecl;
    function getDisplayOriginatingAddress: JString; cdecl;
    function getEmailBody: JString; cdecl;
    function getEmailFrom: JString; cdecl;
    function getIndexOnIcc: Integer; cdecl;
    function getIndexOnSim: Integer; cdecl;//Deprecated
    function getMessageBody: JString; cdecl;
    function getMessageClass: JSmsMessage_MessageClass; cdecl;
    function getOriginatingAddress: JString; cdecl;
    function getPdu: TJavaArray<Byte>; cdecl;
    function getProtocolIdentifier: Integer; cdecl;
    function getPseudoSubject: JString; cdecl;
    function getServiceCenterAddress: JString; cdecl;
    function getStatus: Integer; cdecl;
    function getStatusOnIcc: Integer; cdecl;
    function getStatusOnSim: Integer; cdecl;//Deprecated
    function getTimestampMillis: Int64; cdecl;
    function getUserData: TJavaArray<Byte>; cdecl;
    function isCphsMwiMessage: Boolean; cdecl;
    function isEmail: Boolean; cdecl;
    function isMWIClearMessage: Boolean; cdecl;
    function isMWISetMessage: Boolean; cdecl;
    function isMwiDontStore: Boolean; cdecl;
    function isReplace: Boolean; cdecl;
    function isReplyPathPresent: Boolean; cdecl;
    function isStatusReportMessage: Boolean; cdecl;
  end;
  TJSmsMessage = class(TJavaGenericImport<JSmsMessageClass, JSmsMessage>) end;

  JSmsMessage_MessageClassClass = interface(JEnumClass)
    ['{02240F3E-83D9-4ED3-9C44-6F739AD319F1}']
    {class} function _GetCLASS_0: JSmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_1: JSmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_2: JSmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_3: JSmsMessage_MessageClass; cdecl;
    {class} function _GetUNKNOWN: JSmsMessage_MessageClass; cdecl;
    {class} function valueOf(name: JString): JSmsMessage_MessageClass; cdecl;
    {class} function values: TJavaObjectArray<JSmsMessage_MessageClass>; cdecl;
    {class} property CLASS_0: JSmsMessage_MessageClass read _GetCLASS_0;
    {class} property CLASS_1: JSmsMessage_MessageClass read _GetCLASS_1;
    {class} property CLASS_2: JSmsMessage_MessageClass read _GetCLASS_2;
    {class} property CLASS_3: JSmsMessage_MessageClass read _GetCLASS_3;
    {class} property UNKNOWN: JSmsMessage_MessageClass read _GetUNKNOWN;
  end;

  [JavaSignature('android/telephony/SmsMessage$MessageClass')]
  JSmsMessage_MessageClass = interface(JEnum)
    ['{A7AA6F95-590D-48F9-9EAD-7DEF27FB0AD3}']
  end;
  TJSmsMessage_MessageClass = class(TJavaGenericImport<JSmsMessage_MessageClassClass, JSmsMessage_MessageClass>) end;

  JSmsMessage_SubmitPduClass = interface(JObjectClass)
    ['{3B92B0B3-1E7C-418F-B5DD-222AD433A5AC}']
  end;

  [JavaSignature('android/telephony/SmsMessage$SubmitPdu')]
  JSmsMessage_SubmitPdu = interface(JObject)
    ['{D69C5B7B-6E92-4599-A3ED-EBB174FEDB68}']
    function _GetencodedMessage: TJavaArray<Byte>; cdecl;
    procedure _SetencodedMessage(Value: TJavaArray<Byte>); cdecl;
    function _GetencodedScAddress: TJavaArray<Byte>; cdecl;
    procedure _SetencodedScAddress(Value: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;
    property encodedMessage: TJavaArray<Byte> read _GetencodedMessage write _SetencodedMessage;
    property encodedScAddress: TJavaArray<Byte> read _GetencodedScAddress write _SetencodedScAddress;
  end;
  TJSmsMessage_SubmitPdu = class(TJavaGenericImport<JSmsMessage_SubmitPduClass, JSmsMessage_SubmitPdu>) end;

  JSubscriptionInfoClass = interface(JObjectClass)
    ['{1ECF5C35-07D4-477C-96B9-6F00EC3944B6}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/SubscriptionInfo')]
  JSubscriptionInfo = interface(JObject)
    ['{2B00AA07-B712-4597-8FA6-05EBB3B1C58E}']
    function createIconBitmap(context: JContext): JBitmap; cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCardId: Integer; cdecl;
    function getCarrierId: Integer; cdecl;
    function getCarrierName: JCharSequence; cdecl;
    function getCountryIso: JString; cdecl;
    function getDataRoaming: Integer; cdecl;
    function getDisplayName: JCharSequence; cdecl;
    function getGroupUuid: JParcelUuid; cdecl;
    function getIccId: JString; cdecl;
    function getIconTint: Integer; cdecl;
    function getMcc: Integer; cdecl;//Deprecated
    function getMccString: JString; cdecl;
    function getMnc: Integer; cdecl;//Deprecated
    function getMncString: JString; cdecl;
    function getNumber: JString; cdecl;//Deprecated
    function getPortIndex: Integer; cdecl;
    function getSimSlotIndex: Integer; cdecl;
    function getSubscriptionId: Integer; cdecl;
    function getSubscriptionType: Integer; cdecl;
    function getUsageSetting: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isEmbedded: Boolean; cdecl;
    function isOpportunistic: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSubscriptionInfo = class(TJavaGenericImport<JSubscriptionInfoClass, JSubscriptionInfo>) end;

  JSubscriptionManagerClass = interface(JObjectClass)
    ['{119324F9-C6B0-4E89-94F1-0EAB9CA0287E}']
    {class} function _GetACTION_DEFAULT_SMS_SUBSCRIPTION_CHANGED: JString; cdecl;
    {class} function _GetACTION_DEFAULT_SUBSCRIPTION_CHANGED: JString; cdecl;
    {class} function _GetACTION_MANAGE_SUBSCRIPTION_PLANS: JString; cdecl;
    {class} function _GetACTION_REFRESH_SUBSCRIPTION_PLANS: JString; cdecl;
    {class} function _GetD2D_SHARING_ALL: Integer; cdecl;
    {class} function _GetD2D_SHARING_ALL_CONTACTS: Integer; cdecl;
    {class} function _GetD2D_SHARING_DISABLED: Integer; cdecl;
    {class} function _GetD2D_SHARING_SELECTED_CONTACTS: Integer; cdecl;
    {class} function _GetD2D_STATUS_SHARING: JString; cdecl;
    {class} function _GetD2D_STATUS_SHARING_SELECTED_CONTACTS: JString; cdecl;
    {class} function _GetDATA_ROAMING_DISABLE: Integer; cdecl;
    {class} function _GetDATA_ROAMING_ENABLE: Integer; cdecl;
    {class} function _GetDEFAULT_SUBSCRIPTION_ID: Integer; cdecl;
    {class} function _GetEXTRA_SLOT_INDEX: JString; cdecl;
    {class} function _GetEXTRA_SUBSCRIPTION_INDEX: JString; cdecl;
    {class} function _GetINVALID_SIM_SLOT_INDEX: Integer; cdecl;
    {class} function _GetINVALID_SUBSCRIPTION_ID: Integer; cdecl;
    {class} function _GetPHONE_NUMBER_SOURCE_CARRIER: Integer; cdecl;
    {class} function _GetPHONE_NUMBER_SOURCE_IMS: Integer; cdecl;
    {class} function _GetPHONE_NUMBER_SOURCE_UICC: Integer; cdecl;
    {class} function _GetSUBSCRIPTION_TYPE_LOCAL_SIM: Integer; cdecl;
    {class} function _GetSUBSCRIPTION_TYPE_REMOTE_SIM: Integer; cdecl;
    {class} function _GetUSAGE_SETTING_DATA_CENTRIC: Integer; cdecl;
    {class} function _GetUSAGE_SETTING_DEFAULT: Integer; cdecl;
    {class} function _GetUSAGE_SETTING_UNKNOWN: Integer; cdecl;
    {class} function _GetUSAGE_SETTING_VOICE_CENTRIC: Integer; cdecl;
    {class} function from(context: JContext): JSubscriptionManager; cdecl;//Deprecated
    {class} function getActiveDataSubscriptionId: Integer; cdecl;
    {class} function getDefaultDataSubscriptionId: Integer; cdecl;
    {class} function getDefaultSmsSubscriptionId: Integer; cdecl;
    {class} function getDefaultSubscriptionId: Integer; cdecl;
    {class} function getDefaultVoiceSubscriptionId: Integer; cdecl;
    {class} function getSlotIndex(subscriptionId: Integer): Integer; cdecl;
    {class} function isUsableSubscriptionId(subscriptionId: Integer): Boolean; cdecl;
    {class} function isValidSubscriptionId(subscriptionId: Integer): Boolean; cdecl;
    {class} property ACTION_DEFAULT_SMS_SUBSCRIPTION_CHANGED: JString read _GetACTION_DEFAULT_SMS_SUBSCRIPTION_CHANGED;
    {class} property ACTION_DEFAULT_SUBSCRIPTION_CHANGED: JString read _GetACTION_DEFAULT_SUBSCRIPTION_CHANGED;
    {class} property ACTION_MANAGE_SUBSCRIPTION_PLANS: JString read _GetACTION_MANAGE_SUBSCRIPTION_PLANS;
    {class} property ACTION_REFRESH_SUBSCRIPTION_PLANS: JString read _GetACTION_REFRESH_SUBSCRIPTION_PLANS;
    {class} property D2D_SHARING_ALL: Integer read _GetD2D_SHARING_ALL;
    {class} property D2D_SHARING_ALL_CONTACTS: Integer read _GetD2D_SHARING_ALL_CONTACTS;
    {class} property D2D_SHARING_DISABLED: Integer read _GetD2D_SHARING_DISABLED;
    {class} property D2D_SHARING_SELECTED_CONTACTS: Integer read _GetD2D_SHARING_SELECTED_CONTACTS;
    {class} property D2D_STATUS_SHARING: JString read _GetD2D_STATUS_SHARING;
    {class} property D2D_STATUS_SHARING_SELECTED_CONTACTS: JString read _GetD2D_STATUS_SHARING_SELECTED_CONTACTS;
    {class} property DATA_ROAMING_DISABLE: Integer read _GetDATA_ROAMING_DISABLE;
    {class} property DATA_ROAMING_ENABLE: Integer read _GetDATA_ROAMING_ENABLE;
    {class} property DEFAULT_SUBSCRIPTION_ID: Integer read _GetDEFAULT_SUBSCRIPTION_ID;
    {class} property EXTRA_SLOT_INDEX: JString read _GetEXTRA_SLOT_INDEX;
    {class} property EXTRA_SUBSCRIPTION_INDEX: JString read _GetEXTRA_SUBSCRIPTION_INDEX;
    {class} property INVALID_SIM_SLOT_INDEX: Integer read _GetINVALID_SIM_SLOT_INDEX;
    {class} property INVALID_SUBSCRIPTION_ID: Integer read _GetINVALID_SUBSCRIPTION_ID;
    {class} property PHONE_NUMBER_SOURCE_CARRIER: Integer read _GetPHONE_NUMBER_SOURCE_CARRIER;
    {class} property PHONE_NUMBER_SOURCE_IMS: Integer read _GetPHONE_NUMBER_SOURCE_IMS;
    {class} property PHONE_NUMBER_SOURCE_UICC: Integer read _GetPHONE_NUMBER_SOURCE_UICC;
    {class} property SUBSCRIPTION_TYPE_LOCAL_SIM: Integer read _GetSUBSCRIPTION_TYPE_LOCAL_SIM;
    {class} property SUBSCRIPTION_TYPE_REMOTE_SIM: Integer read _GetSUBSCRIPTION_TYPE_REMOTE_SIM;
    {class} property USAGE_SETTING_DATA_CENTRIC: Integer read _GetUSAGE_SETTING_DATA_CENTRIC;
    {class} property USAGE_SETTING_DEFAULT: Integer read _GetUSAGE_SETTING_DEFAULT;
    {class} property USAGE_SETTING_UNKNOWN: Integer read _GetUSAGE_SETTING_UNKNOWN;
    {class} property USAGE_SETTING_VOICE_CENTRIC: Integer read _GetUSAGE_SETTING_VOICE_CENTRIC;
  end;

  [JavaSignature('android/telephony/SubscriptionManager')]
  JSubscriptionManager = interface(JObject)
    ['{0029EBE7-5EF6-4C05-A608-8BB19F2FB263}']
    procedure addOnOpportunisticSubscriptionsChangedListener(executor: JExecutor; listener: JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener); cdecl;
    procedure addOnSubscriptionsChangedListener(listener: JSubscriptionManager_OnSubscriptionsChangedListener); cdecl; overload;//Deprecated
    procedure addOnSubscriptionsChangedListener(executor: JExecutor; listener: JSubscriptionManager_OnSubscriptionsChangedListener); cdecl; overload;
    procedure addSubscriptionsIntoGroup(subIdList: JList; groupUuid: JParcelUuid); cdecl;
    function canManageSubscription(info: JSubscriptionInfo): Boolean; cdecl;
    function createSubscriptionGroup(subIdList: JList): JParcelUuid; cdecl;
    function getAccessibleSubscriptionInfoList: JList; cdecl;
    function getActiveSubscriptionInfo(subId: Integer): JSubscriptionInfo; cdecl;
    function getActiveSubscriptionInfoCount: Integer; cdecl;
    function getActiveSubscriptionInfoCountMax: Integer; cdecl;
    function getActiveSubscriptionInfoForSimSlotIndex(slotIndex: Integer): JSubscriptionInfo; cdecl;
    function getActiveSubscriptionInfoList: JList; cdecl;
    function getCompleteActiveSubscriptionInfoList: JList; cdecl;
    function getDeviceToDeviceStatusSharingContacts(subscriptionId: Integer): JList; cdecl;
    function getDeviceToDeviceStatusSharingPreference(subscriptionId: Integer): Integer; cdecl;
    function getOpportunisticSubscriptions: JList; cdecl;
    function getPhoneNumber(subscriptionId: Integer; source: Integer): JString; cdecl; overload;
    function getPhoneNumber(subscriptionId: Integer): JString; cdecl; overload;
    function getSubscriptionIds(slotIndex: Integer): TJavaArray<Integer>; cdecl;
    function getSubscriptionPlans(subId: Integer): JList; cdecl;
    function getSubscriptionsInGroup(groupUuid: JParcelUuid): JList; cdecl;
    function isActiveSubscriptionId(subscriptionId: Integer): Boolean; cdecl;
    function isNetworkRoaming(subId: Integer): Boolean; cdecl;
    procedure removeOnOpportunisticSubscriptionsChangedListener(listener: JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener); cdecl;
    procedure removeOnSubscriptionsChangedListener(listener: JSubscriptionManager_OnSubscriptionsChangedListener); cdecl;
    procedure removeSubscriptionsFromGroup(subIdList: JList; groupUuid: JParcelUuid); cdecl;
    procedure setCarrierPhoneNumber(subscriptionId: Integer; number: JString); cdecl;
    procedure setDeviceToDeviceStatusSharingContacts(subscriptionId: Integer; contacts: JList); cdecl;
    procedure setDeviceToDeviceStatusSharingPreference(subscriptionId: Integer; sharing: Integer); cdecl;
    function setOpportunistic(opportunistic: Boolean; subId: Integer): Boolean; cdecl;
    procedure setSubscriptionOverrideCongested(subId: Integer; overrideCongested: Boolean; expirationDurationMillis: Int64); cdecl; overload;
    procedure setSubscriptionOverrideCongested(subId: Integer; overrideCongested: Boolean; networkTypes: TJavaArray<Integer>; expirationDurationMillis: Int64); cdecl; overload;
    procedure setSubscriptionOverrideUnmetered(subId: Integer; overrideUnmetered: Boolean; expirationDurationMillis: Int64); cdecl; overload;
    procedure setSubscriptionOverrideUnmetered(subId: Integer; overrideUnmetered: Boolean; networkTypes: TJavaArray<Integer>; expirationDurationMillis: Int64); cdecl; overload;
    procedure setSubscriptionPlans(subId: Integer; plans: JList); cdecl; overload;//Deprecated
    procedure setSubscriptionPlans(subId: Integer; plans: JList; expirationDurationMillis: Int64); cdecl; overload;
    procedure switchToSubscription(subId: Integer; callbackIntent: JPendingIntent); cdecl;
  end;
  TJSubscriptionManager = class(TJavaGenericImport<JSubscriptionManagerClass, JSubscriptionManager>) end;

  JSubscriptionManager_OnOpportunisticSubscriptionsChangedListenerClass = interface(JObjectClass)
    ['{D626699B-B48B-4123-9470-6ADAB5B37437}']
    {class} function init: JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener; cdecl;
  end;

  [JavaSignature('android/telephony/SubscriptionManager$OnOpportunisticSubscriptionsChangedListener')]
  JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener = interface(JObject)
    ['{F312C41D-8156-4702-868D-2F1FC237FDFF}']
    procedure onOpportunisticSubscriptionsChanged; cdecl;
  end;
  TJSubscriptionManager_OnOpportunisticSubscriptionsChangedListener = class(TJavaGenericImport<JSubscriptionManager_OnOpportunisticSubscriptionsChangedListenerClass, JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener>) end;

  JSubscriptionManager_OnSubscriptionsChangedListenerClass = interface(JObjectClass)
    ['{F2559847-2FB4-4AE0-90CB-7FF3B0D44875}']
    {class} function init: JSubscriptionManager_OnSubscriptionsChangedListener; cdecl;
  end;

  [JavaSignature('android/telephony/SubscriptionManager$OnSubscriptionsChangedListener')]
  JSubscriptionManager_OnSubscriptionsChangedListener = interface(JObject)
    ['{36F98257-7442-4AB5-8854-928260DC45BF}']
    procedure onSubscriptionsChanged; cdecl;
  end;
  TJSubscriptionManager_OnSubscriptionsChangedListener = class(TJavaGenericImport<JSubscriptionManager_OnSubscriptionsChangedListenerClass, JSubscriptionManager_OnSubscriptionsChangedListener>) end;

  JSubscriptionPlanClass = interface(JObjectClass)
    ['{39D328BB-4137-484E-B603-62DB0FEC0A25}']
    {class} function _GetBYTES_UNKNOWN: Int64; cdecl;
    {class} function _GetBYTES_UNLIMITED: Int64; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetLIMIT_BEHAVIOR_BILLED: Integer; cdecl;
    {class} function _GetLIMIT_BEHAVIOR_DISABLED: Integer; cdecl;
    {class} function _GetLIMIT_BEHAVIOR_THROTTLED: Integer; cdecl;
    {class} function _GetLIMIT_BEHAVIOR_UNKNOWN: Integer; cdecl;
    {class} function _GetTIME_UNKNOWN: Int64; cdecl;
    {class} property BYTES_UNKNOWN: Int64 read _GetBYTES_UNKNOWN;
    {class} property BYTES_UNLIMITED: Int64 read _GetBYTES_UNLIMITED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property LIMIT_BEHAVIOR_BILLED: Integer read _GetLIMIT_BEHAVIOR_BILLED;
    {class} property LIMIT_BEHAVIOR_DISABLED: Integer read _GetLIMIT_BEHAVIOR_DISABLED;
    {class} property LIMIT_BEHAVIOR_THROTTLED: Integer read _GetLIMIT_BEHAVIOR_THROTTLED;
    {class} property LIMIT_BEHAVIOR_UNKNOWN: Integer read _GetLIMIT_BEHAVIOR_UNKNOWN;
    {class} property TIME_UNKNOWN: Int64 read _GetTIME_UNKNOWN;
  end;

  [JavaSignature('android/telephony/SubscriptionPlan')]
  JSubscriptionPlan = interface(JObject)
    ['{86266E04-BE64-4BBE-90B2-64458FE3E844}']
    function cycleIterator: JIterator; cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDataLimitBehavior: Integer; cdecl;
    function getDataLimitBytes: Int64; cdecl;
    function getDataUsageBytes: Int64; cdecl;
    function getDataUsageTime: Int64; cdecl;
    function getNetworkTypes: TJavaArray<Integer>; cdecl;
    function getSummary: JCharSequence; cdecl;
    function getTitle: JCharSequence; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSubscriptionPlan = class(TJavaGenericImport<JSubscriptionPlanClass, JSubscriptionPlan>) end;

  JSubscriptionPlan_BuilderClass = interface(JObjectClass)
    ['{6E5CE5BD-E03B-483F-9AAE-31B781D94737}']
    {class} function createNonrecurring(start: JZonedDateTime; end_: JZonedDateTime): JSubscriptionPlan_Builder; cdecl;
    {class} function createRecurring(start: JZonedDateTime; period: JPeriod): JSubscriptionPlan_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/SubscriptionPlan$Builder')]
  JSubscriptionPlan_Builder = interface(JObject)
    ['{3C9BB891-A042-4908-B2F8-C59023EF60E9}']
    function build: JSubscriptionPlan; cdecl;
    function resetNetworkTypes: JSubscriptionPlan_Builder; cdecl;
    function setDataLimit(dataLimitBytes: Int64; dataLimitBehavior: Integer): JSubscriptionPlan_Builder; cdecl;
    function setDataUsage(dataUsageBytes: Int64; dataUsageTime: Int64): JSubscriptionPlan_Builder; cdecl;
    function setNetworkTypes(networkTypes: TJavaArray<Integer>): JSubscriptionPlan_Builder; cdecl;
    function setSummary(summary: JCharSequence): JSubscriptionPlan_Builder; cdecl;
    function setTitle(title: JCharSequence): JSubscriptionPlan_Builder; cdecl;
  end;
  TJSubscriptionPlan_Builder = class(TJavaGenericImport<JSubscriptionPlan_BuilderClass, JSubscriptionPlan_Builder>) end;

  JTelephonyCallbackClass = interface(JObjectClass)
    ['{48FF24C0-E764-47F0-8539-35B3F079C4D0}']
    {class} function init: JTelephonyCallback; cdecl;
  end;

  [JavaSignature('android/telephony/TelephonyCallback')]
  JTelephonyCallback = interface(JObject)
    ['{9B2B8432-847C-4BFB-BF87-BBCDA2007A87}']
  end;
  TJTelephonyCallback = class(TJavaGenericImport<JTelephonyCallbackClass, JTelephonyCallback>) end;

  JTelephonyCallback_ActiveDataSubscriptionIdListenerClass = interface(IJavaClass)
    ['{D1F23C7D-EB89-4B6D-8D05-8940F6DB6EF1}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$ActiveDataSubscriptionIdListener')]
  JTelephonyCallback_ActiveDataSubscriptionIdListener = interface(IJavaInstance)
    ['{4958463F-8A94-4023-9227-B17BD664492F}']
    procedure onActiveDataSubscriptionIdChanged(subId: Integer); cdecl;
  end;
  TJTelephonyCallback_ActiveDataSubscriptionIdListener = class(TJavaGenericImport<JTelephonyCallback_ActiveDataSubscriptionIdListenerClass, JTelephonyCallback_ActiveDataSubscriptionIdListener>) end;

  JTelephonyCallback_BarringInfoListenerClass = interface(IJavaClass)
    ['{41315940-185F-4905-AAE3-70A302DED2C1}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$BarringInfoListener')]
  JTelephonyCallback_BarringInfoListener = interface(IJavaInstance)
    ['{36AAC7A1-0027-47EE-A5C2-FB3C8370495C}']
    procedure onBarringInfoChanged(barringInfo: JBarringInfo); cdecl;
  end;
  TJTelephonyCallback_BarringInfoListener = class(TJavaGenericImport<JTelephonyCallback_BarringInfoListenerClass, JTelephonyCallback_BarringInfoListener>) end;

  JTelephonyCallback_CallDisconnectCauseListenerClass = interface(IJavaClass)
    ['{B86B259F-E1F9-4BE1-9D7E-E6AC8CE53579}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CallDisconnectCauseListener')]
  JTelephonyCallback_CallDisconnectCauseListener = interface(IJavaInstance)
    ['{2AE9C886-FB03-4F58-B265-78A0239E74DF}']
    procedure onCallDisconnectCauseChanged(disconnectCause: Integer; preciseDisconnectCause: Integer); cdecl;
  end;
  TJTelephonyCallback_CallDisconnectCauseListener = class(TJavaGenericImport<JTelephonyCallback_CallDisconnectCauseListenerClass, JTelephonyCallback_CallDisconnectCauseListener>) end;

  JTelephonyCallback_CallForwardingIndicatorListenerClass = interface(IJavaClass)
    ['{98AE29E9-CDE5-402E-994E-F03F94939F77}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CallForwardingIndicatorListener')]
  JTelephonyCallback_CallForwardingIndicatorListener = interface(IJavaInstance)
    ['{9B9A3DA9-2A48-42B4-8B46-2BED47DF2358}']
    procedure onCallForwardingIndicatorChanged(cfi: Boolean); cdecl;
  end;
  TJTelephonyCallback_CallForwardingIndicatorListener = class(TJavaGenericImport<JTelephonyCallback_CallForwardingIndicatorListenerClass, JTelephonyCallback_CallForwardingIndicatorListener>) end;

  JTelephonyCallback_CallStateListenerClass = interface(IJavaClass)
    ['{CE50D45C-6071-4D08-BABF-1BFAE5D391AD}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CallStateListener')]
  JTelephonyCallback_CallStateListener = interface(IJavaInstance)
    ['{5550BA04-5646-47C7-AFDE-54597FE1B802}']
    procedure onCallStateChanged(state: Integer); cdecl;
  end;
  TJTelephonyCallback_CallStateListener = class(TJavaGenericImport<JTelephonyCallback_CallStateListenerClass, JTelephonyCallback_CallStateListener>) end;

  JTelephonyCallback_CarrierNetworkListenerClass = interface(IJavaClass)
    ['{162457C6-C88C-42A3-9B29-EE67229F118E}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CarrierNetworkListener')]
  JTelephonyCallback_CarrierNetworkListener = interface(IJavaInstance)
    ['{F0FB71EB-EEC5-4DA2-BC04-451C0D077B9A}']
    procedure onCarrierNetworkChange(active: Boolean); cdecl;
  end;
  TJTelephonyCallback_CarrierNetworkListener = class(TJavaGenericImport<JTelephonyCallback_CarrierNetworkListenerClass, JTelephonyCallback_CarrierNetworkListener>) end;

  JTelephonyCallback_CellInfoListenerClass = interface(IJavaClass)
    ['{616B4E0D-2583-4190-A82F-12EED15DEFAE}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CellInfoListener')]
  JTelephonyCallback_CellInfoListener = interface(IJavaInstance)
    ['{685EE912-BF11-4553-AD37-ED743605ED32}']
    procedure onCellInfoChanged(cellInfo: JList); cdecl;
  end;
  TJTelephonyCallback_CellInfoListener = class(TJavaGenericImport<JTelephonyCallback_CellInfoListenerClass, JTelephonyCallback_CellInfoListener>) end;

  JTelephonyCallback_CellLocationListenerClass = interface(IJavaClass)
    ['{E007D5C9-5504-4EE7-82D2-BD007DF81710}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$CellLocationListener')]
  JTelephonyCallback_CellLocationListener = interface(IJavaInstance)
    ['{059ADCBD-8FFB-45B8-84A4-6BBFFDA90DC7}']
    procedure onCellLocationChanged(location: JCellLocation); cdecl;
  end;
  TJTelephonyCallback_CellLocationListener = class(TJavaGenericImport<JTelephonyCallback_CellLocationListenerClass, JTelephonyCallback_CellLocationListener>) end;

  JTelephonyCallback_DataActivationStateListenerClass = interface(IJavaClass)
    ['{3D14372E-61CB-44C0-8747-A72182733F20}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$DataActivationStateListener')]
  JTelephonyCallback_DataActivationStateListener = interface(IJavaInstance)
    ['{4D481219-59BE-4E08-8EA9-0A9DA009A54F}']
    procedure onDataActivationStateChanged(state: Integer); cdecl;
  end;
  TJTelephonyCallback_DataActivationStateListener = class(TJavaGenericImport<JTelephonyCallback_DataActivationStateListenerClass, JTelephonyCallback_DataActivationStateListener>) end;

  JTelephonyCallback_DataActivityListenerClass = interface(IJavaClass)
    ['{71356DA0-BCD5-410C-8228-828E07313F92}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$DataActivityListener')]
  JTelephonyCallback_DataActivityListener = interface(IJavaInstance)
    ['{601990CA-6952-4A66-914E-C97BDCE56BE3}']
    procedure onDataActivity(direction: Integer); cdecl;
  end;
  TJTelephonyCallback_DataActivityListener = class(TJavaGenericImport<JTelephonyCallback_DataActivityListenerClass, JTelephonyCallback_DataActivityListener>) end;

  JTelephonyCallback_DataConnectionStateListenerClass = interface(IJavaClass)
    ['{22D2FBA9-24A0-4E86-84C9-94BBAD833AB8}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$DataConnectionStateListener')]
  JTelephonyCallback_DataConnectionStateListener = interface(IJavaInstance)
    ['{E4EB368A-8BA7-4CA4-A4EF-A409130533E2}']
    procedure onDataConnectionStateChanged(state: Integer; networkType: Integer); cdecl;
  end;
  TJTelephonyCallback_DataConnectionStateListener = class(TJavaGenericImport<JTelephonyCallback_DataConnectionStateListenerClass, JTelephonyCallback_DataConnectionStateListener>) end;

  JTelephonyCallback_DisplayInfoListenerClass = interface(IJavaClass)
    ['{4D981BD6-BA57-4933-A183-2D112BAC0FBF}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$DisplayInfoListener')]
  JTelephonyCallback_DisplayInfoListener = interface(IJavaInstance)
    ['{D0A8897C-E57A-41A2-9FEA-23FD79EB8954}']
    procedure onDisplayInfoChanged(telephonyDisplayInfo: JTelephonyDisplayInfo); cdecl;
  end;
  TJTelephonyCallback_DisplayInfoListener = class(TJavaGenericImport<JTelephonyCallback_DisplayInfoListenerClass, JTelephonyCallback_DisplayInfoListener>) end;

  JTelephonyCallback_EmergencyNumberListListenerClass = interface(IJavaClass)
    ['{8A36939C-E46A-4269-A009-EEC9E62DADCF}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$EmergencyNumberListListener')]
  JTelephonyCallback_EmergencyNumberListListener = interface(IJavaInstance)
    ['{C88FB784-B98B-47B1-8FE5-3F1CBA66EC10}']
    procedure onEmergencyNumberListChanged(emergencyNumberList: JMap); cdecl;
  end;
  TJTelephonyCallback_EmergencyNumberListListener = class(TJavaGenericImport<JTelephonyCallback_EmergencyNumberListListenerClass, JTelephonyCallback_EmergencyNumberListListener>) end;

  JTelephonyCallback_ImsCallDisconnectCauseListenerClass = interface(IJavaClass)
    ['{AAACD8B3-0231-4423-A881-5DF693A132BF}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$ImsCallDisconnectCauseListener')]
  JTelephonyCallback_ImsCallDisconnectCauseListener = interface(IJavaInstance)
    ['{3EE01504-E540-4515-9E53-CD0521ACDFF6}']
    procedure onImsCallDisconnectCauseChanged(imsReasonInfo: JImsReasonInfo); cdecl;
  end;
  TJTelephonyCallback_ImsCallDisconnectCauseListener = class(TJavaGenericImport<JTelephonyCallback_ImsCallDisconnectCauseListenerClass, JTelephonyCallback_ImsCallDisconnectCauseListener>) end;

  JTelephonyCallback_MessageWaitingIndicatorListenerClass = interface(IJavaClass)
    ['{73EC9F72-7FD7-47CB-BADD-0DC052A80928}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$MessageWaitingIndicatorListener')]
  JTelephonyCallback_MessageWaitingIndicatorListener = interface(IJavaInstance)
    ['{C2F8973D-1A8C-4D13-9625-CC26F6C13311}']
    procedure onMessageWaitingIndicatorChanged(mwi: Boolean); cdecl;
  end;
  TJTelephonyCallback_MessageWaitingIndicatorListener = class(TJavaGenericImport<JTelephonyCallback_MessageWaitingIndicatorListenerClass, JTelephonyCallback_MessageWaitingIndicatorListener>) end;

  JTelephonyCallback_PhysicalChannelConfigListenerClass = interface(IJavaClass)
    ['{6DCBE8AF-4D58-4CAC-A34D-424E1E1D96A6}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$PhysicalChannelConfigListener')]
  JTelephonyCallback_PhysicalChannelConfigListener = interface(IJavaInstance)
    ['{B24DC679-9DBF-420A-8D91-405511228FD4}']
    procedure onPhysicalChannelConfigChanged(configs: JList); cdecl;
  end;
  TJTelephonyCallback_PhysicalChannelConfigListener = class(TJavaGenericImport<JTelephonyCallback_PhysicalChannelConfigListenerClass, JTelephonyCallback_PhysicalChannelConfigListener>) end;

  JTelephonyCallback_PreciseDataConnectionStateListenerClass = interface(IJavaClass)
    ['{3A202F50-0736-4CBF-BAA5-070CBBC3C80C}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$PreciseDataConnectionStateListener')]
  JTelephonyCallback_PreciseDataConnectionStateListener = interface(IJavaInstance)
    ['{02B4694D-8913-4513-8F80-FAAD53E4FEB2}']
    procedure onPreciseDataConnectionStateChanged(dataConnectionState: JPreciseDataConnectionState); cdecl;
  end;
  TJTelephonyCallback_PreciseDataConnectionStateListener = class(TJavaGenericImport<JTelephonyCallback_PreciseDataConnectionStateListenerClass, JTelephonyCallback_PreciseDataConnectionStateListener>) end;

  JTelephonyCallback_RegistrationFailedListenerClass = interface(IJavaClass)
    ['{6FFC6F73-01EB-461F-9046-9979FB167DDB}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$RegistrationFailedListener')]
  JTelephonyCallback_RegistrationFailedListener = interface(IJavaInstance)
    ['{87432FD4-DF97-4C87-83B3-64BFA7544995}']
    procedure onRegistrationFailed(cellIdentity: JCellIdentity; chosenPlmn: JString; domain: Integer; causeCode: Integer; additionalCauseCode: Integer); cdecl;
  end;
  TJTelephonyCallback_RegistrationFailedListener = class(TJavaGenericImport<JTelephonyCallback_RegistrationFailedListenerClass, JTelephonyCallback_RegistrationFailedListener>) end;

  JTelephonyCallback_ServiceStateListenerClass = interface(IJavaClass)
    ['{94B04B7E-C4F6-48EE-B5EB-C26F728EB0D7}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$ServiceStateListener')]
  JTelephonyCallback_ServiceStateListener = interface(IJavaInstance)
    ['{C0959915-FEA9-41F0-AC85-3EB2462A0347}']
    procedure onServiceStateChanged(serviceState: JServiceState); cdecl;
  end;
  TJTelephonyCallback_ServiceStateListener = class(TJavaGenericImport<JTelephonyCallback_ServiceStateListenerClass, JTelephonyCallback_ServiceStateListener>) end;

  JTelephonyCallback_SignalStrengthsListenerClass = interface(IJavaClass)
    ['{E2DF0A44-46BB-403F-A2D3-B418ED7E586C}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$SignalStrengthsListener')]
  JTelephonyCallback_SignalStrengthsListener = interface(IJavaInstance)
    ['{2CA25436-3B60-4A92-A5A7-A9A6F2F66C8A}']
    procedure onSignalStrengthsChanged(signalStrength: JSignalStrength); cdecl;
  end;
  TJTelephonyCallback_SignalStrengthsListener = class(TJavaGenericImport<JTelephonyCallback_SignalStrengthsListenerClass, JTelephonyCallback_SignalStrengthsListener>) end;

  JTelephonyCallback_UserMobileDataStateListenerClass = interface(IJavaClass)
    ['{B31798E8-7BC7-41A7-9E8F-7AB902955502}']
  end;

  [JavaSignature('android/telephony/TelephonyCallback$UserMobileDataStateListener')]
  JTelephonyCallback_UserMobileDataStateListener = interface(IJavaInstance)
    ['{D0714C4E-1903-4265-BFEB-4A30E0DA4D2D}']
    procedure onUserMobileDataStateChanged(enabled: Boolean); cdecl;
  end;
  TJTelephonyCallback_UserMobileDataStateListener = class(TJavaGenericImport<JTelephonyCallback_UserMobileDataStateListenerClass, JTelephonyCallback_UserMobileDataStateListener>) end;

  JTelephonyDisplayInfoClass = interface(JObjectClass)
    ['{DA8CC159-A546-46C3-A3B0-0EFE5EA26FCF}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_LTE_ADVANCED_PRO: Integer; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_LTE_CA: Integer; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_NONE: Integer; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_NR_ADVANCED: Integer; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_NR_NSA: Integer; cdecl;
    {class} function _GetOVERRIDE_NETWORK_TYPE_NR_NSA_MMWAVE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property OVERRIDE_NETWORK_TYPE_LTE_ADVANCED_PRO: Integer read _GetOVERRIDE_NETWORK_TYPE_LTE_ADVANCED_PRO;
    {class} property OVERRIDE_NETWORK_TYPE_LTE_CA: Integer read _GetOVERRIDE_NETWORK_TYPE_LTE_CA;
    {class} property OVERRIDE_NETWORK_TYPE_NONE: Integer read _GetOVERRIDE_NETWORK_TYPE_NONE;
    {class} property OVERRIDE_NETWORK_TYPE_NR_ADVANCED: Integer read _GetOVERRIDE_NETWORK_TYPE_NR_ADVANCED;
    {class} property OVERRIDE_NETWORK_TYPE_NR_NSA: Integer read _GetOVERRIDE_NETWORK_TYPE_NR_NSA;
    {class} property OVERRIDE_NETWORK_TYPE_NR_NSA_MMWAVE: Integer read _GetOVERRIDE_NETWORK_TYPE_NR_NSA_MMWAVE;
  end;

  [JavaSignature('android/telephony/TelephonyDisplayInfo')]
  JTelephonyDisplayInfo = interface(JObject)
    ['{67963182-E8F7-4303-A3A6-43FD80097E87}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getNetworkType: Integer; cdecl;
    function getOverrideNetworkType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTelephonyDisplayInfo = class(TJavaGenericImport<JTelephonyDisplayInfoClass, JTelephonyDisplayInfo>) end;

  JTelephonyManagerClass = interface(JObjectClass)
    ['{543679F3-38DC-4FCA-ADCD-648A27B9B5DD}']
    {class} function _GetACTION_CARRIER_MESSAGING_CLIENT_SERVICE: JString; cdecl;
    {class} function _GetACTION_CARRIER_SIGNAL_DEFAULT_NETWORK_AVAILABLE: JString; cdecl;
    {class} function _GetACTION_CARRIER_SIGNAL_PCO_VALUE: JString; cdecl;
    {class} function _GetACTION_CARRIER_SIGNAL_REDIRECTED: JString; cdecl;
    {class} function _GetACTION_CARRIER_SIGNAL_REQUEST_NETWORK_FAILED: JString; cdecl;
    {class} function _GetACTION_CARRIER_SIGNAL_RESET: JString; cdecl;
    {class} function _GetACTION_CONFIGURE_VOICEMAIL: JString; cdecl;
    {class} function _GetACTION_MULTI_SIM_CONFIG_CHANGED: JString; cdecl;
    {class} function _GetACTION_NETWORK_COUNTRY_CHANGED: JString; cdecl;
    {class} function _GetACTION_PHONE_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_RESPOND_VIA_MESSAGE: JString; cdecl;
    {class} function _GetACTION_SECRET_CODE: JString; cdecl;
    {class} function _GetACTION_SHOW_VOICEMAIL_NOTIFICATION: JString; cdecl;
    {class} function _GetACTION_SUBSCRIPTION_CARRIER_IDENTITY_CHANGED: JString; cdecl;
    {class} function _GetACTION_SUBSCRIPTION_SPECIFIC_CARRIER_IDENTITY_CHANGED: JString; cdecl;
    {class} function _GetALLOWED_NETWORK_TYPES_REASON_CARRIER: Integer; cdecl;
    {class} function _GetALLOWED_NETWORK_TYPES_REASON_USER: Integer; cdecl;
    {class} function _GetAPPTYPE_CSIM: Integer; cdecl;
    {class} function _GetAPPTYPE_ISIM: Integer; cdecl;
    {class} function _GetAPPTYPE_RUIM: Integer; cdecl;
    {class} function _GetAPPTYPE_SIM: Integer; cdecl;
    {class} function _GetAPPTYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetAPPTYPE_USIM: Integer; cdecl;
    {class} function _GetAUTHTYPE_EAP_AKA: Integer; cdecl;
    {class} function _GetAUTHTYPE_EAP_SIM: Integer; cdecl;
    {class} function _GetCALL_COMPOSER_STATUS_OFF: Integer; cdecl;
    {class} function _GetCALL_COMPOSER_STATUS_ON: Integer; cdecl;
    {class} function _GetCALL_STATE_IDLE: Integer; cdecl;
    {class} function _GetCALL_STATE_OFFHOOK: Integer; cdecl;
    {class} function _GetCALL_STATE_RINGING: Integer; cdecl;
    {class} function _GetCAPABILITY_SLICING_CONFIG_SUPPORTED: JString; cdecl;
    {class} function _GetCDMA_ROAMING_MODE_AFFILIATED: Integer; cdecl;
    {class} function _GetCDMA_ROAMING_MODE_ANY: Integer; cdecl;
    {class} function _GetCDMA_ROAMING_MODE_HOME: Integer; cdecl;
    {class} function _GetCDMA_ROAMING_MODE_RADIO_DEFAULT: Integer; cdecl;
    {class} function _GetDATA_ACTIVITY_DORMANT: Integer; cdecl;
    {class} function _GetDATA_ACTIVITY_IN: Integer; cdecl;
    {class} function _GetDATA_ACTIVITY_INOUT: Integer; cdecl;
    {class} function _GetDATA_ACTIVITY_NONE: Integer; cdecl;
    {class} function _GetDATA_ACTIVITY_OUT: Integer; cdecl;
    {class} function _GetDATA_CONNECTED: Integer; cdecl;
    {class} function _GetDATA_CONNECTING: Integer; cdecl;
    {class} function _GetDATA_DISCONNECTED: Integer; cdecl;
    {class} function _GetDATA_DISCONNECTING: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_CARRIER: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_OVERRIDE: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_POLICY: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_THERMAL: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_UNKNOWN: Integer; cdecl;
    {class} function _GetDATA_ENABLED_REASON_USER: Integer; cdecl;
    {class} function _GetDATA_HANDOVER_IN_PROGRESS: Integer; cdecl;
    {class} function _GetDATA_SUSPENDED: Integer; cdecl;
    {class} function _GetDATA_UNKNOWN: Integer; cdecl;
    {class} function _GetDEFAULT_PORT_INDEX: Integer; cdecl;
    {class} function _GetERI_FLASH: Integer; cdecl;
    {class} function _GetERI_OFF: Integer; cdecl;
    {class} function _GetERI_ON: Integer; cdecl;
    {class} function _GetEXTRA_ACTIVE_SIM_SUPPORTED_COUNT: JString; cdecl;
    {class} function _GetEXTRA_APN_PROTOCOL: JString; cdecl;
    {class} function _GetEXTRA_APN_TYPE: JString; cdecl;
    {class} function _GetEXTRA_CALL_VOICEMAIL_INTENT: JString; cdecl;
    {class} function _GetEXTRA_CARRIER_ID: JString; cdecl;
    {class} function _GetEXTRA_CARRIER_NAME: JString; cdecl;
    {class} function _GetEXTRA_DATA_FAIL_CAUSE: JString; cdecl;
    {class} function _GetEXTRA_DEFAULT_NETWORK_AVAILABLE: JString; cdecl;
    {class} function _GetEXTRA_HIDE_PUBLIC_SETTINGS: JString; cdecl;
    {class} function _GetEXTRA_INCOMING_NUMBER: JString; cdecl;
    {class} function _GetEXTRA_IS_REFRESH: JString; cdecl;
    {class} function _GetEXTRA_LAUNCH_VOICEMAIL_SETTINGS_INTENT: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_COUNTRY: JString; cdecl;
    {class} function _GetEXTRA_NOTIFICATION_COUNT: JString; cdecl;
    {class} function _GetEXTRA_PCO_ID: JString; cdecl;
    {class} function _GetEXTRA_PCO_VALUE: JString; cdecl;
    {class} function _GetEXTRA_PHONE_ACCOUNT_HANDLE: JString; cdecl;
    {class} function _GetEXTRA_REDIRECTION_URL: JString; cdecl;
    {class} function _GetEXTRA_SPECIFIC_CARRIER_ID: JString; cdecl;
    {class} function _GetEXTRA_SPECIFIC_CARRIER_NAME: JString; cdecl;
    {class} function _GetEXTRA_STATE: JString; cdecl;
    {class} function _GetEXTRA_STATE_IDLE: JString; cdecl;
    {class} function _GetEXTRA_STATE_OFFHOOK: JString; cdecl;
    {class} function _GetEXTRA_STATE_RINGING: JString; cdecl;
    {class} function _GetEXTRA_SUBSCRIPTION_ID: JString; cdecl;
    {class} function _GetEXTRA_VOICEMAIL_NUMBER: JString; cdecl;
    {class} function _GetINCLUDE_LOCATION_DATA_COARSE: Integer; cdecl;
    {class} function _GetINCLUDE_LOCATION_DATA_FINE: Integer; cdecl;
    {class} function _GetINCLUDE_LOCATION_DATA_NONE: Integer; cdecl;
    {class} function _GetMETADATA_HIDE_VOICEMAIL_SETTINGS_MENU: JString; cdecl;
    {class} function _GetMULTISIM_ALLOWED: Integer; cdecl;
    {class} function _GetMULTISIM_NOT_SUPPORTED_BY_CARRIER: Integer; cdecl;
    {class} function _GetMULTISIM_NOT_SUPPORTED_BY_HARDWARE: Integer; cdecl;
    {class} function _GetNETWORK_SELECTION_MODE_AUTO: Integer; cdecl;
    {class} function _GetNETWORK_SELECTION_MODE_MANUAL: Integer; cdecl;
    {class} function _GetNETWORK_SELECTION_MODE_UNKNOWN: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_1xRTT: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_1xRTT: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_CDMA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_EDGE: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_EHRPD: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_EVDO_0: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_EVDO_A: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_EVDO_B: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_GPRS: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_GSM: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_HSDPA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_HSPA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_HSPAP: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_HSUPA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_IWLAN: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_LTE: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_LTE_CA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_NR: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_TD_SCDMA: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_UMTS: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_BITMASK_UNKNOWN: Int64; cdecl;
    {class} function _GetNETWORK_TYPE_CDMA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_EDGE: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_EHRPD: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_EVDO_0: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_EVDO_A: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_EVDO_B: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_GPRS: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_GSM: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_HSDPA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_HSPA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_HSPAP: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_HSUPA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_IDEN: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_IWLAN: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_LTE: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_NR: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_TD_SCDMA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_UMTS: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetPHONE_TYPE_CDMA: Integer; cdecl;
    {class} function _GetPHONE_TYPE_GSM: Integer; cdecl;
    {class} function _GetPHONE_TYPE_NONE: Integer; cdecl;
    {class} function _GetPHONE_TYPE_SIP: Integer; cdecl;
    {class} function _GetSET_OPPORTUNISTIC_SUB_INACTIVE_SUBSCRIPTION: Integer; cdecl;
    {class} function _GetSET_OPPORTUNISTIC_SUB_NO_OPPORTUNISTIC_SUB_AVAILABLE: Integer; cdecl;
    {class} function _GetSET_OPPORTUNISTIC_SUB_REMOTE_SERVICE_EXCEPTION: Integer; cdecl;
    {class} function _GetSET_OPPORTUNISTIC_SUB_SUCCESS: Integer; cdecl;
    {class} function _GetSET_OPPORTUNISTIC_SUB_VALIDATION_FAILED: Integer; cdecl;
    {class} function _GetSIM_STATE_ABSENT: Integer; cdecl;
    {class} function _GetSIM_STATE_CARD_IO_ERROR: Integer; cdecl;
    {class} function _GetSIM_STATE_CARD_RESTRICTED: Integer; cdecl;
    {class} function _GetSIM_STATE_NETWORK_LOCKED: Integer; cdecl;
    {class} function _GetSIM_STATE_NOT_READY: Integer; cdecl;
    {class} function _GetSIM_STATE_PERM_DISABLED: Integer; cdecl;
    {class} function _GetSIM_STATE_PIN_REQUIRED: Integer; cdecl;
    {class} function _GetSIM_STATE_PUK_REQUIRED: Integer; cdecl;
    {class} function _GetSIM_STATE_READY: Integer; cdecl;
    {class} function _GetSIM_STATE_UNKNOWN: Integer; cdecl;
    {class} function _GetUNINITIALIZED_CARD_ID: Integer; cdecl;
    {class} function _GetUNKNOWN_CARRIER_ID: Integer; cdecl;
    {class} function _GetUNSUPPORTED_CARD_ID: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_ABORTED: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_DISABLE_MODEM_FAIL: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_ENABLE_MODEM_FAIL: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_INVALID_ARGUMENTS: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_MULTIPLE_NETWORKS_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_NO_CARRIER_PRIVILEGE: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_NO_OPPORTUNISTIC_SUB_AVAILABLE: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_REMOTE_SERVICE_EXCEPTION: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_SERVICE_IS_DISABLED: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_SUCCESS: Integer; cdecl;
    {class} function _GetUPDATE_AVAILABLE_NETWORKS_UNKNOWN_FAILURE: Integer; cdecl;
    {class} function _GetUSSD_ERROR_SERVICE_UNAVAIL: Integer; cdecl;
    {class} function _GetUSSD_RETURN_FAILURE: Integer; cdecl;
    {class} function _GetVVM_TYPE_CVVM: JString; cdecl;
    {class} function _GetVVM_TYPE_OMTP: JString; cdecl;
    {class} function getMaximumCallComposerPictureSize: Int64; cdecl;
    {class} property ACTION_CARRIER_MESSAGING_CLIENT_SERVICE: JString read _GetACTION_CARRIER_MESSAGING_CLIENT_SERVICE;
    {class} property ACTION_CARRIER_SIGNAL_DEFAULT_NETWORK_AVAILABLE: JString read _GetACTION_CARRIER_SIGNAL_DEFAULT_NETWORK_AVAILABLE;
    {class} property ACTION_CARRIER_SIGNAL_PCO_VALUE: JString read _GetACTION_CARRIER_SIGNAL_PCO_VALUE;
    {class} property ACTION_CARRIER_SIGNAL_REDIRECTED: JString read _GetACTION_CARRIER_SIGNAL_REDIRECTED;
    {class} property ACTION_CARRIER_SIGNAL_REQUEST_NETWORK_FAILED: JString read _GetACTION_CARRIER_SIGNAL_REQUEST_NETWORK_FAILED;
    {class} property ACTION_CARRIER_SIGNAL_RESET: JString read _GetACTION_CARRIER_SIGNAL_RESET;
    {class} property ACTION_CONFIGURE_VOICEMAIL: JString read _GetACTION_CONFIGURE_VOICEMAIL;
    {class} property ACTION_MULTI_SIM_CONFIG_CHANGED: JString read _GetACTION_MULTI_SIM_CONFIG_CHANGED;
    {class} property ACTION_NETWORK_COUNTRY_CHANGED: JString read _GetACTION_NETWORK_COUNTRY_CHANGED;
    {class} property ACTION_PHONE_STATE_CHANGED: JString read _GetACTION_PHONE_STATE_CHANGED;
    {class} property ACTION_RESPOND_VIA_MESSAGE: JString read _GetACTION_RESPOND_VIA_MESSAGE;
    {class} property ACTION_SECRET_CODE: JString read _GetACTION_SECRET_CODE;
    {class} property ACTION_SHOW_VOICEMAIL_NOTIFICATION: JString read _GetACTION_SHOW_VOICEMAIL_NOTIFICATION;
    {class} property ACTION_SUBSCRIPTION_CARRIER_IDENTITY_CHANGED: JString read _GetACTION_SUBSCRIPTION_CARRIER_IDENTITY_CHANGED;
    {class} property ACTION_SUBSCRIPTION_SPECIFIC_CARRIER_IDENTITY_CHANGED: JString read _GetACTION_SUBSCRIPTION_SPECIFIC_CARRIER_IDENTITY_CHANGED;
    {class} property ALLOWED_NETWORK_TYPES_REASON_CARRIER: Integer read _GetALLOWED_NETWORK_TYPES_REASON_CARRIER;
    {class} property ALLOWED_NETWORK_TYPES_REASON_USER: Integer read _GetALLOWED_NETWORK_TYPES_REASON_USER;
    {class} property APPTYPE_CSIM: Integer read _GetAPPTYPE_CSIM;
    {class} property APPTYPE_ISIM: Integer read _GetAPPTYPE_ISIM;
    {class} property APPTYPE_RUIM: Integer read _GetAPPTYPE_RUIM;
    {class} property APPTYPE_SIM: Integer read _GetAPPTYPE_SIM;
    {class} property APPTYPE_UNKNOWN: Integer read _GetAPPTYPE_UNKNOWN;
    {class} property APPTYPE_USIM: Integer read _GetAPPTYPE_USIM;
    {class} property AUTHTYPE_EAP_AKA: Integer read _GetAUTHTYPE_EAP_AKA;
    {class} property AUTHTYPE_EAP_SIM: Integer read _GetAUTHTYPE_EAP_SIM;
    {class} property CALL_COMPOSER_STATUS_OFF: Integer read _GetCALL_COMPOSER_STATUS_OFF;
    {class} property CALL_COMPOSER_STATUS_ON: Integer read _GetCALL_COMPOSER_STATUS_ON;
    {class} property CALL_STATE_IDLE: Integer read _GetCALL_STATE_IDLE;
    {class} property CALL_STATE_OFFHOOK: Integer read _GetCALL_STATE_OFFHOOK;
    {class} property CALL_STATE_RINGING: Integer read _GetCALL_STATE_RINGING;
    {class} property CAPABILITY_SLICING_CONFIG_SUPPORTED: JString read _GetCAPABILITY_SLICING_CONFIG_SUPPORTED;
    {class} property CDMA_ROAMING_MODE_AFFILIATED: Integer read _GetCDMA_ROAMING_MODE_AFFILIATED;
    {class} property CDMA_ROAMING_MODE_ANY: Integer read _GetCDMA_ROAMING_MODE_ANY;
    {class} property CDMA_ROAMING_MODE_HOME: Integer read _GetCDMA_ROAMING_MODE_HOME;
    {class} property CDMA_ROAMING_MODE_RADIO_DEFAULT: Integer read _GetCDMA_ROAMING_MODE_RADIO_DEFAULT;
    {class} property DATA_ACTIVITY_DORMANT: Integer read _GetDATA_ACTIVITY_DORMANT;
    {class} property DATA_ACTIVITY_IN: Integer read _GetDATA_ACTIVITY_IN;
    {class} property DATA_ACTIVITY_INOUT: Integer read _GetDATA_ACTIVITY_INOUT;
    {class} property DATA_ACTIVITY_NONE: Integer read _GetDATA_ACTIVITY_NONE;
    {class} property DATA_ACTIVITY_OUT: Integer read _GetDATA_ACTIVITY_OUT;
    {class} property DATA_CONNECTED: Integer read _GetDATA_CONNECTED;
    {class} property DATA_CONNECTING: Integer read _GetDATA_CONNECTING;
    {class} property DATA_DISCONNECTED: Integer read _GetDATA_DISCONNECTED;
    {class} property DATA_DISCONNECTING: Integer read _GetDATA_DISCONNECTING;
    {class} property DATA_ENABLED_REASON_CARRIER: Integer read _GetDATA_ENABLED_REASON_CARRIER;
    {class} property DATA_ENABLED_REASON_OVERRIDE: Integer read _GetDATA_ENABLED_REASON_OVERRIDE;
    {class} property DATA_ENABLED_REASON_POLICY: Integer read _GetDATA_ENABLED_REASON_POLICY;
    {class} property DATA_ENABLED_REASON_THERMAL: Integer read _GetDATA_ENABLED_REASON_THERMAL;
    {class} property DATA_ENABLED_REASON_UNKNOWN: Integer read _GetDATA_ENABLED_REASON_UNKNOWN;
    {class} property DATA_ENABLED_REASON_USER: Integer read _GetDATA_ENABLED_REASON_USER;
    {class} property DATA_HANDOVER_IN_PROGRESS: Integer read _GetDATA_HANDOVER_IN_PROGRESS;
    {class} property DATA_SUSPENDED: Integer read _GetDATA_SUSPENDED;
    {class} property DATA_UNKNOWN: Integer read _GetDATA_UNKNOWN;
    {class} property DEFAULT_PORT_INDEX: Integer read _GetDEFAULT_PORT_INDEX;
    {class} property ERI_FLASH: Integer read _GetERI_FLASH;
    {class} property ERI_OFF: Integer read _GetERI_OFF;
    {class} property ERI_ON: Integer read _GetERI_ON;
    {class} property EXTRA_ACTIVE_SIM_SUPPORTED_COUNT: JString read _GetEXTRA_ACTIVE_SIM_SUPPORTED_COUNT;
    {class} property EXTRA_APN_PROTOCOL: JString read _GetEXTRA_APN_PROTOCOL;
    {class} property EXTRA_APN_TYPE: JString read _GetEXTRA_APN_TYPE;
    {class} property EXTRA_CALL_VOICEMAIL_INTENT: JString read _GetEXTRA_CALL_VOICEMAIL_INTENT;
    {class} property EXTRA_CARRIER_ID: JString read _GetEXTRA_CARRIER_ID;
    {class} property EXTRA_CARRIER_NAME: JString read _GetEXTRA_CARRIER_NAME;
    {class} property EXTRA_DATA_FAIL_CAUSE: JString read _GetEXTRA_DATA_FAIL_CAUSE;
    {class} property EXTRA_DEFAULT_NETWORK_AVAILABLE: JString read _GetEXTRA_DEFAULT_NETWORK_AVAILABLE;
    {class} property EXTRA_HIDE_PUBLIC_SETTINGS: JString read _GetEXTRA_HIDE_PUBLIC_SETTINGS;
    {class} property EXTRA_INCOMING_NUMBER: JString read _GetEXTRA_INCOMING_NUMBER;
    {class} property EXTRA_IS_REFRESH: JString read _GetEXTRA_IS_REFRESH;
    {class} property EXTRA_LAUNCH_VOICEMAIL_SETTINGS_INTENT: JString read _GetEXTRA_LAUNCH_VOICEMAIL_SETTINGS_INTENT;
    {class} property EXTRA_NETWORK_COUNTRY: JString read _GetEXTRA_NETWORK_COUNTRY;
    {class} property EXTRA_NOTIFICATION_COUNT: JString read _GetEXTRA_NOTIFICATION_COUNT;
    {class} property EXTRA_PCO_ID: JString read _GetEXTRA_PCO_ID;
    {class} property EXTRA_PCO_VALUE: JString read _GetEXTRA_PCO_VALUE;
    {class} property EXTRA_PHONE_ACCOUNT_HANDLE: JString read _GetEXTRA_PHONE_ACCOUNT_HANDLE;
    {class} property EXTRA_REDIRECTION_URL: JString read _GetEXTRA_REDIRECTION_URL;
    {class} property EXTRA_SPECIFIC_CARRIER_ID: JString read _GetEXTRA_SPECIFIC_CARRIER_ID;
    {class} property EXTRA_SPECIFIC_CARRIER_NAME: JString read _GetEXTRA_SPECIFIC_CARRIER_NAME;
    {class} property EXTRA_STATE: JString read _GetEXTRA_STATE;
    {class} property EXTRA_STATE_IDLE: JString read _GetEXTRA_STATE_IDLE;
    {class} property EXTRA_STATE_OFFHOOK: JString read _GetEXTRA_STATE_OFFHOOK;
    {class} property EXTRA_STATE_RINGING: JString read _GetEXTRA_STATE_RINGING;
    {class} property EXTRA_SUBSCRIPTION_ID: JString read _GetEXTRA_SUBSCRIPTION_ID;
    {class} property EXTRA_VOICEMAIL_NUMBER: JString read _GetEXTRA_VOICEMAIL_NUMBER;
    {class} property INCLUDE_LOCATION_DATA_COARSE: Integer read _GetINCLUDE_LOCATION_DATA_COARSE;
    {class} property INCLUDE_LOCATION_DATA_FINE: Integer read _GetINCLUDE_LOCATION_DATA_FINE;
    {class} property INCLUDE_LOCATION_DATA_NONE: Integer read _GetINCLUDE_LOCATION_DATA_NONE;
    {class} property METADATA_HIDE_VOICEMAIL_SETTINGS_MENU: JString read _GetMETADATA_HIDE_VOICEMAIL_SETTINGS_MENU;
    {class} property MULTISIM_ALLOWED: Integer read _GetMULTISIM_ALLOWED;
    {class} property MULTISIM_NOT_SUPPORTED_BY_CARRIER: Integer read _GetMULTISIM_NOT_SUPPORTED_BY_CARRIER;
    {class} property MULTISIM_NOT_SUPPORTED_BY_HARDWARE: Integer read _GetMULTISIM_NOT_SUPPORTED_BY_HARDWARE;
    {class} property NETWORK_SELECTION_MODE_AUTO: Integer read _GetNETWORK_SELECTION_MODE_AUTO;
    {class} property NETWORK_SELECTION_MODE_MANUAL: Integer read _GetNETWORK_SELECTION_MODE_MANUAL;
    {class} property NETWORK_SELECTION_MODE_UNKNOWN: Integer read _GetNETWORK_SELECTION_MODE_UNKNOWN;
    {class} property NETWORK_TYPE_1xRTT: Integer read _GetNETWORK_TYPE_1xRTT;
    {class} property NETWORK_TYPE_BITMASK_1xRTT: Int64 read _GetNETWORK_TYPE_BITMASK_1xRTT;
    {class} property NETWORK_TYPE_BITMASK_CDMA: Int64 read _GetNETWORK_TYPE_BITMASK_CDMA;
    {class} property NETWORK_TYPE_BITMASK_EDGE: Int64 read _GetNETWORK_TYPE_BITMASK_EDGE;
    {class} property NETWORK_TYPE_BITMASK_EHRPD: Int64 read _GetNETWORK_TYPE_BITMASK_EHRPD;
    {class} property NETWORK_TYPE_BITMASK_EVDO_0: Int64 read _GetNETWORK_TYPE_BITMASK_EVDO_0;
    {class} property NETWORK_TYPE_BITMASK_EVDO_A: Int64 read _GetNETWORK_TYPE_BITMASK_EVDO_A;
    {class} property NETWORK_TYPE_BITMASK_EVDO_B: Int64 read _GetNETWORK_TYPE_BITMASK_EVDO_B;
    {class} property NETWORK_TYPE_BITMASK_GPRS: Int64 read _GetNETWORK_TYPE_BITMASK_GPRS;
    {class} property NETWORK_TYPE_BITMASK_GSM: Int64 read _GetNETWORK_TYPE_BITMASK_GSM;
    {class} property NETWORK_TYPE_BITMASK_HSDPA: Int64 read _GetNETWORK_TYPE_BITMASK_HSDPA;
    {class} property NETWORK_TYPE_BITMASK_HSPA: Int64 read _GetNETWORK_TYPE_BITMASK_HSPA;
    {class} property NETWORK_TYPE_BITMASK_HSPAP: Int64 read _GetNETWORK_TYPE_BITMASK_HSPAP;
    {class} property NETWORK_TYPE_BITMASK_HSUPA: Int64 read _GetNETWORK_TYPE_BITMASK_HSUPA;
    {class} property NETWORK_TYPE_BITMASK_IWLAN: Int64 read _GetNETWORK_TYPE_BITMASK_IWLAN;
    {class} property NETWORK_TYPE_BITMASK_LTE: Int64 read _GetNETWORK_TYPE_BITMASK_LTE;
    {class} property NETWORK_TYPE_BITMASK_LTE_CA: Int64 read _GetNETWORK_TYPE_BITMASK_LTE_CA;
    {class} property NETWORK_TYPE_BITMASK_NR: Int64 read _GetNETWORK_TYPE_BITMASK_NR;
    {class} property NETWORK_TYPE_BITMASK_TD_SCDMA: Int64 read _GetNETWORK_TYPE_BITMASK_TD_SCDMA;
    {class} property NETWORK_TYPE_BITMASK_UMTS: Int64 read _GetNETWORK_TYPE_BITMASK_UMTS;
    {class} property NETWORK_TYPE_BITMASK_UNKNOWN: Int64 read _GetNETWORK_TYPE_BITMASK_UNKNOWN;
    {class} property NETWORK_TYPE_CDMA: Integer read _GetNETWORK_TYPE_CDMA;
    {class} property NETWORK_TYPE_EDGE: Integer read _GetNETWORK_TYPE_EDGE;
    {class} property NETWORK_TYPE_EHRPD: Integer read _GetNETWORK_TYPE_EHRPD;
    {class} property NETWORK_TYPE_EVDO_0: Integer read _GetNETWORK_TYPE_EVDO_0;
    {class} property NETWORK_TYPE_EVDO_A: Integer read _GetNETWORK_TYPE_EVDO_A;
    {class} property NETWORK_TYPE_EVDO_B: Integer read _GetNETWORK_TYPE_EVDO_B;
    {class} property NETWORK_TYPE_GPRS: Integer read _GetNETWORK_TYPE_GPRS;
    {class} property NETWORK_TYPE_GSM: Integer read _GetNETWORK_TYPE_GSM;
    {class} property NETWORK_TYPE_HSDPA: Integer read _GetNETWORK_TYPE_HSDPA;
    {class} property NETWORK_TYPE_HSPA: Integer read _GetNETWORK_TYPE_HSPA;
    {class} property NETWORK_TYPE_HSPAP: Integer read _GetNETWORK_TYPE_HSPAP;
    {class} property NETWORK_TYPE_HSUPA: Integer read _GetNETWORK_TYPE_HSUPA;
    {class} property NETWORK_TYPE_IDEN: Integer read _GetNETWORK_TYPE_IDEN;
    {class} property NETWORK_TYPE_IWLAN: Integer read _GetNETWORK_TYPE_IWLAN;
    {class} property NETWORK_TYPE_LTE: Integer read _GetNETWORK_TYPE_LTE;
    {class} property NETWORK_TYPE_NR: Integer read _GetNETWORK_TYPE_NR;
    {class} property NETWORK_TYPE_TD_SCDMA: Integer read _GetNETWORK_TYPE_TD_SCDMA;
    {class} property NETWORK_TYPE_UMTS: Integer read _GetNETWORK_TYPE_UMTS;
    {class} property NETWORK_TYPE_UNKNOWN: Integer read _GetNETWORK_TYPE_UNKNOWN;
    {class} property PHONE_TYPE_CDMA: Integer read _GetPHONE_TYPE_CDMA;
    {class} property PHONE_TYPE_GSM: Integer read _GetPHONE_TYPE_GSM;
    {class} property PHONE_TYPE_NONE: Integer read _GetPHONE_TYPE_NONE;
    {class} property PHONE_TYPE_SIP: Integer read _GetPHONE_TYPE_SIP;
    {class} property SET_OPPORTUNISTIC_SUB_INACTIVE_SUBSCRIPTION: Integer read _GetSET_OPPORTUNISTIC_SUB_INACTIVE_SUBSCRIPTION;
    {class} property SET_OPPORTUNISTIC_SUB_NO_OPPORTUNISTIC_SUB_AVAILABLE: Integer read _GetSET_OPPORTUNISTIC_SUB_NO_OPPORTUNISTIC_SUB_AVAILABLE;
    {class} property SET_OPPORTUNISTIC_SUB_REMOTE_SERVICE_EXCEPTION: Integer read _GetSET_OPPORTUNISTIC_SUB_REMOTE_SERVICE_EXCEPTION;
    {class} property SET_OPPORTUNISTIC_SUB_SUCCESS: Integer read _GetSET_OPPORTUNISTIC_SUB_SUCCESS;
    {class} property SET_OPPORTUNISTIC_SUB_VALIDATION_FAILED: Integer read _GetSET_OPPORTUNISTIC_SUB_VALIDATION_FAILED;
    {class} property SIM_STATE_ABSENT: Integer read _GetSIM_STATE_ABSENT;
    {class} property SIM_STATE_CARD_IO_ERROR: Integer read _GetSIM_STATE_CARD_IO_ERROR;
    {class} property SIM_STATE_CARD_RESTRICTED: Integer read _GetSIM_STATE_CARD_RESTRICTED;
    {class} property SIM_STATE_NETWORK_LOCKED: Integer read _GetSIM_STATE_NETWORK_LOCKED;
    {class} property SIM_STATE_NOT_READY: Integer read _GetSIM_STATE_NOT_READY;
    {class} property SIM_STATE_PERM_DISABLED: Integer read _GetSIM_STATE_PERM_DISABLED;
    {class} property SIM_STATE_PIN_REQUIRED: Integer read _GetSIM_STATE_PIN_REQUIRED;
    {class} property SIM_STATE_PUK_REQUIRED: Integer read _GetSIM_STATE_PUK_REQUIRED;
    {class} property SIM_STATE_READY: Integer read _GetSIM_STATE_READY;
    {class} property SIM_STATE_UNKNOWN: Integer read _GetSIM_STATE_UNKNOWN;
    {class} property UNINITIALIZED_CARD_ID: Integer read _GetUNINITIALIZED_CARD_ID;
    {class} property UNKNOWN_CARRIER_ID: Integer read _GetUNKNOWN_CARRIER_ID;
    {class} property UNSUPPORTED_CARD_ID: Integer read _GetUNSUPPORTED_CARD_ID;
    {class} property UPDATE_AVAILABLE_NETWORKS_ABORTED: Integer read _GetUPDATE_AVAILABLE_NETWORKS_ABORTED;
    {class} property UPDATE_AVAILABLE_NETWORKS_DISABLE_MODEM_FAIL: Integer read _GetUPDATE_AVAILABLE_NETWORKS_DISABLE_MODEM_FAIL;
    {class} property UPDATE_AVAILABLE_NETWORKS_ENABLE_MODEM_FAIL: Integer read _GetUPDATE_AVAILABLE_NETWORKS_ENABLE_MODEM_FAIL;
    {class} property UPDATE_AVAILABLE_NETWORKS_INVALID_ARGUMENTS: Integer read _GetUPDATE_AVAILABLE_NETWORKS_INVALID_ARGUMENTS;
    {class} property UPDATE_AVAILABLE_NETWORKS_MULTIPLE_NETWORKS_NOT_SUPPORTED: Integer read _GetUPDATE_AVAILABLE_NETWORKS_MULTIPLE_NETWORKS_NOT_SUPPORTED;
    {class} property UPDATE_AVAILABLE_NETWORKS_NO_CARRIER_PRIVILEGE: Integer read _GetUPDATE_AVAILABLE_NETWORKS_NO_CARRIER_PRIVILEGE;
    {class} property UPDATE_AVAILABLE_NETWORKS_NO_OPPORTUNISTIC_SUB_AVAILABLE: Integer read _GetUPDATE_AVAILABLE_NETWORKS_NO_OPPORTUNISTIC_SUB_AVAILABLE;
    {class} property UPDATE_AVAILABLE_NETWORKS_REMOTE_SERVICE_EXCEPTION: Integer read _GetUPDATE_AVAILABLE_NETWORKS_REMOTE_SERVICE_EXCEPTION;
    {class} property UPDATE_AVAILABLE_NETWORKS_SERVICE_IS_DISABLED: Integer read _GetUPDATE_AVAILABLE_NETWORKS_SERVICE_IS_DISABLED;
    {class} property UPDATE_AVAILABLE_NETWORKS_SUCCESS: Integer read _GetUPDATE_AVAILABLE_NETWORKS_SUCCESS;
    {class} property UPDATE_AVAILABLE_NETWORKS_UNKNOWN_FAILURE: Integer read _GetUPDATE_AVAILABLE_NETWORKS_UNKNOWN_FAILURE;
    {class} property USSD_ERROR_SERVICE_UNAVAIL: Integer read _GetUSSD_ERROR_SERVICE_UNAVAIL;
    {class} property USSD_RETURN_FAILURE: Integer read _GetUSSD_RETURN_FAILURE;
    {class} property VVM_TYPE_CVVM: JString read _GetVVM_TYPE_CVVM;
    {class} property VVM_TYPE_OMTP: JString read _GetVVM_TYPE_OMTP;
  end;

  [JavaSignature('android/telephony/TelephonyManager')]
  JTelephonyManager = interface(JObject)
    ['{7725226B-9F82-4BFA-B1DE-3960703BB92C}']
    function canChangeDtmfToneLength: Boolean; cdecl;
    procedure clearSignalStrengthUpdateRequest(request: JSignalStrengthUpdateRequest); cdecl;
    //function createForPhoneAccountHandle(phoneAccountHandle: JPhoneAccountHandle): JTelephonyManager; cdecl;
    function createForSubscriptionId(subId: Integer): JTelephonyManager; cdecl;
    function doesSwitchMultiSimConfigTriggerReboot: Boolean; cdecl;
    function getActiveModemCount: Integer; cdecl;
    function getAllCellInfo: JList; cdecl;
    function getAllowedNetworkTypesForReason(reason: Integer): Int64; cdecl;
    function getCallComposerStatus: Integer; cdecl;
    function getCallState: Integer; cdecl;//Deprecated
    function getCallStateForSubscription: Integer; cdecl;
    function getCardIdForDefaultEuicc: Integer; cdecl;
    function getCarrierConfig: JPersistableBundle; cdecl;
    function getCarrierIdFromSimMccMnc: Integer; cdecl;
    function getCellLocation: JCellLocation; cdecl;//Deprecated
    function getDataActivity: Integer; cdecl;
    function getDataNetworkType: Integer; cdecl;
    function getDataState: Integer; cdecl;
    function getDeviceId: JString; cdecl; overload;//Deprecated
    function getDeviceId(slotIndex: Integer): JString; cdecl; overload;//Deprecated
    function getDeviceSoftwareVersion: JString; cdecl;
    function getEmergencyNumberList: JMap; cdecl; overload;
    function getEmergencyNumberList(categories: Integer): JMap; cdecl; overload;
    function getEquivalentHomePlmns: JList; cdecl;
    function getForbiddenPlmns: TJavaObjectArray<JString>; cdecl;
    function getGroupIdLevel1: JString; cdecl;
    function getIccAuthentication(appType: Integer; authType: Integer; data: JString): JString; cdecl;
    function getImei: JString; cdecl; overload;
    function getImei(slotIndex: Integer): JString; cdecl; overload;
    function getLine1Number: JString; cdecl;//Deprecated
    function getManualNetworkSelectionPlmn: JString; cdecl;
    function getManufacturerCode: JString; cdecl; overload;
    function getManufacturerCode(slotIndex: Integer): JString; cdecl; overload;
    function getMeid: JString; cdecl; overload;
    function getMeid(slotIndex: Integer): JString; cdecl; overload;
    function getMmsUAProfUrl: JString; cdecl;
    function getMmsUserAgent: JString; cdecl;
    function getNai: JString; cdecl;
    function getNeighboringCellInfo: JList; cdecl;//Deprecated
    function getNetworkCountryIso: JString; cdecl; overload;
    function getNetworkCountryIso(slotIndex: Integer): JString; cdecl; overload;
    function getNetworkOperator: JString; cdecl;
    function getNetworkOperatorName: JString; cdecl;
    function getNetworkSelectionMode: Integer; cdecl;
    procedure getNetworkSlicingConfiguration(executor: JExecutor; callback: JOutcomeReceiver); cdecl;
    function getNetworkSpecifier: JString; cdecl;
    function getNetworkType: Integer; cdecl;//Deprecated
    //function getPhoneAccountHandle: JPhoneAccountHandle; cdecl;
    function getPhoneCount: Integer; cdecl;//Deprecated
    function getPhoneType: Integer; cdecl;
    function getPreferredOpportunisticDataSubscription: Integer; cdecl;
    function getServiceState: JServiceState; cdecl; overload;
    function getServiceState(includeLocationData: Integer): JServiceState; cdecl; overload;
    function getSignalStrength: JSignalStrength; cdecl;
    function getSimCarrierId: Integer; cdecl;
    function getSimCarrierIdName: JCharSequence; cdecl;
    function getSimCountryIso: JString; cdecl;
    function getSimOperator: JString; cdecl;
    function getSimOperatorName: JString; cdecl;
    function getSimSerialNumber: JString; cdecl;
    function getSimSpecificCarrierId: Integer; cdecl;
    function getSimSpecificCarrierIdName: JCharSequence; cdecl;
    function getSimState: Integer; cdecl; overload;
    function getSimState(slotIndex: Integer): Integer; cdecl; overload;
    function getSubscriberId: JString; cdecl;
    function getSubscriptionId: Integer; cdecl; overload;
    //function getSubscriptionId(phoneAccountHandle: JPhoneAccountHandle): Integer; cdecl; overload;
    function getSupportedModemCount: Integer; cdecl;
    function getSupportedRadioAccessFamily: Int64; cdecl;
    function getTypeAllocationCode: JString; cdecl; overload;
    function getTypeAllocationCode(slotIndex: Integer): JString; cdecl; overload;
    function getUiccCardsInfo: JList; cdecl;
    function getVisualVoicemailPackageName: JString; cdecl;
    function getVoiceMailAlphaTag: JString; cdecl;
    function getVoiceMailNumber: JString; cdecl;
    function getVoiceNetworkType: Integer; cdecl;
    //function getVoicemailRingtoneUri(accountHandle: JPhoneAccountHandle): Jnet_Uri; cdecl;
    function hasCarrierPrivileges: Boolean; cdecl;
    function hasIccCard: Boolean; cdecl;
    function iccCloseLogicalChannel(channel: Integer): Boolean; cdecl;
    function iccExchangeSimIO(fileID: Integer; command: Integer; p1: Integer; p2: Integer; p3: Integer; filePath: JString): TJavaArray<Byte>; cdecl;
    function iccOpenLogicalChannel(AID: JString): JIccOpenLogicalChannelResponse; cdecl; overload;//Deprecated
    function iccOpenLogicalChannel(AID: JString; p2: Integer): JIccOpenLogicalChannelResponse; cdecl; overload;
    function iccTransmitApduBasicChannel(cla: Integer; instruction: Integer; p1: Integer; p2: Integer; p3: Integer; data: JString): JString; cdecl;
    function iccTransmitApduLogicalChannel(channel: Integer; cla: Integer; instruction: Integer; p1: Integer; p2: Integer; p3: Integer; data: JString): JString; cdecl;
    function isConcurrentVoiceAndDataSupported: Boolean; cdecl;
    function isDataCapable: Boolean; cdecl;
    function isDataConnectionAllowed: Boolean; cdecl;
    function isDataEnabled: Boolean; cdecl;
    function isDataEnabledForReason(reason: Integer): Boolean; cdecl;
    function isDataRoamingEnabled: Boolean; cdecl;
    function isEmergencyNumber(number: JString): Boolean; cdecl;
    function isHearingAidCompatibilitySupported: Boolean; cdecl;
    function isManualNetworkSelectionAllowed: Boolean; cdecl;
    function isModemEnabledForSlot(slotIndex: Integer): Boolean; cdecl;
    function isMultiSimSupported: Integer; cdecl;
    function isNetworkRoaming: Boolean; cdecl;
    function isRadioInterfaceCapabilitySupported(capability: JString): Boolean; cdecl;
    function isRttSupported: Boolean; cdecl;
    function isSmsCapable: Boolean; cdecl;
    function isTtyModeSupported: Boolean; cdecl;//Deprecated
    function isVoiceCapable: Boolean; cdecl;
    //function isVoicemailVibrationEnabled(accountHandle: JPhoneAccountHandle): Boolean; cdecl;
    function isWorldPhone: Boolean; cdecl;
    procedure listen(listener: JPhoneStateListener; events: Integer); cdecl;//Deprecated
    procedure rebootModem; cdecl;
    procedure registerTelephonyCallback(executor: JExecutor; callback: JTelephonyCallback); cdecl; overload;
    procedure registerTelephonyCallback(includeLocationData: Integer; executor: JExecutor; callback: JTelephonyCallback); cdecl; overload;
    procedure requestCellInfoUpdate(executor: JExecutor; callback: JTelephonyManager_CellInfoCallback); cdecl;
    function requestNetworkScan(request: JNetworkScanRequest; executor: JExecutor; callback: JTelephonyScanManager_NetworkScanCallback): JNetworkScan; cdecl; overload;
    function requestNetworkScan(includeLocationData: Integer; request: JNetworkScanRequest; executor: JExecutor; callback: JTelephonyScanManager_NetworkScanCallback): JNetworkScan; cdecl; overload;
    function requestNetworkScan(request: JNetworkScanRequest; callback: JTelephonyScanManager_NetworkScanCallback): JNetworkScan; cdecl; overload;//Deprecated
    procedure sendDialerSpecialCode(inputCode: JString); cdecl;
    function sendEnvelopeWithStatus(content: JString): JString; cdecl;
    procedure sendUssdRequest(ussdRequest: JString; callback: JTelephonyManager_UssdResponseCallback; handler: JHandler); cdecl;
    procedure sendVisualVoicemailSms(number: JString; port: Integer; text: JString; sentIntent: JPendingIntent); cdecl;
    procedure setAllowedNetworkTypesForReason(reason: Integer; allowedNetworkTypes: Int64); cdecl;
    procedure setCallComposerStatus(status: Integer); cdecl;
    procedure setDataEnabled(enable: Boolean); cdecl;//Deprecated
    procedure setDataEnabledForReason(reason: Integer; enabled: Boolean); cdecl;
    function setForbiddenPlmns(fplmns: JList): Integer; cdecl;
    function setLine1NumberForDisplay(alphaTag: JString; number: JString): Boolean; cdecl;//Deprecated
    procedure setNetworkSelectionModeAutomatic; cdecl;
    function setNetworkSelectionModeManual(operatorNumeric: JString; persistSelection: Boolean): Boolean; cdecl; overload;
    function setNetworkSelectionModeManual(operatorNumeric: JString; persistSelection: Boolean; ran: Integer): Boolean; cdecl; overload;
    function setOperatorBrandOverride(brand: JString): Boolean; cdecl;
    function setPreferredNetworkTypeToGlobal: Boolean; cdecl;
    procedure setPreferredOpportunisticDataSubscription(subId: Integer; needValidation: Boolean; executor: JExecutor; callback: JConsumer); cdecl;
    procedure setSignalStrengthUpdateRequest(request: JSignalStrengthUpdateRequest); cdecl;
    procedure setVisualVoicemailSmsFilterSettings(settings: JVisualVoicemailSmsFilterSettings); cdecl;
    function setVoiceMailNumber(alphaTag: JString; number: JString): Boolean; cdecl;
    //procedure setVoicemailRingtoneUri(phoneAccountHandle: JPhoneAccountHandle; uri: Jnet_Uri); cdecl;//Deprecated
    //procedure setVoicemailVibrationEnabled(phoneAccountHandle: JPhoneAccountHandle; enabled: Boolean); cdecl;//Deprecated
    procedure switchMultiSimConfig(numOfSims: Integer); cdecl;
    procedure unregisterTelephonyCallback(callback: JTelephonyCallback); cdecl;
    procedure updateAvailableNetworks(availableNetworks: JList; executor: JExecutor; callback: JConsumer); cdecl;
    procedure uploadCallComposerPicture(pictureToUpload: Jfile_Path; contentType: JString; executor: JExecutor; callback: JOutcomeReceiver); cdecl; overload;
    procedure uploadCallComposerPicture(pictureToUpload: JInputStream; contentType: JString; executor: JExecutor; callback: JOutcomeReceiver); cdecl; overload;
  end;
  TJTelephonyManager = class(TJavaGenericImport<JTelephonyManagerClass, JTelephonyManager>) end;

  JTelephonyManager_CallComposerExceptionClass = interface(JExceptionClass)
    ['{23F60829-F8E0-402F-87FD-5D601DE0ABB1}']
    {class} function _GetERROR_AUTHENTICATION_FAILED: Integer; cdecl;
    {class} function _GetERROR_FILE_TOO_LARGE: Integer; cdecl;
    {class} function _GetERROR_INPUT_CLOSED: Integer; cdecl;
    {class} function _GetERROR_IO_EXCEPTION: Integer; cdecl;
    {class} function _GetERROR_NETWORK_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_REMOTE_END_CLOSED: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} function init(errorCode: Integer; ioException: JIOException): JTelephonyManager_CallComposerException; cdecl;
    {class} property ERROR_AUTHENTICATION_FAILED: Integer read _GetERROR_AUTHENTICATION_FAILED;
    {class} property ERROR_FILE_TOO_LARGE: Integer read _GetERROR_FILE_TOO_LARGE;
    {class} property ERROR_INPUT_CLOSED: Integer read _GetERROR_INPUT_CLOSED;
    {class} property ERROR_IO_EXCEPTION: Integer read _GetERROR_IO_EXCEPTION;
    {class} property ERROR_NETWORK_UNAVAILABLE: Integer read _GetERROR_NETWORK_UNAVAILABLE;
    {class} property ERROR_REMOTE_END_CLOSED: Integer read _GetERROR_REMOTE_END_CLOSED;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
  end;

  [JavaSignature('android/telephony/TelephonyManager$CallComposerException')]
  JTelephonyManager_CallComposerException = interface(JException)
    ['{32B6FF3E-02CC-4617-A638-16AEDC6CF974}']
    function getErrorCode: Integer; cdecl;
    function getIOException: JIOException; cdecl;
  end;
  TJTelephonyManager_CallComposerException = class(TJavaGenericImport<JTelephonyManager_CallComposerExceptionClass, JTelephonyManager_CallComposerException>) end;

  JTelephonyManager_CellInfoCallbackClass = interface(JObjectClass)
    ['{4DF9EAF4-B07A-4ABD-BA37-F694B324AE1E}']
    {class} function _GetERROR_MODEM_ERROR: Integer; cdecl;
    {class} function _GetERROR_TIMEOUT: Integer; cdecl;
    {class} function init: JTelephonyManager_CellInfoCallback; cdecl;
    {class} property ERROR_MODEM_ERROR: Integer read _GetERROR_MODEM_ERROR;
    {class} property ERROR_TIMEOUT: Integer read _GetERROR_TIMEOUT;
  end;

  [JavaSignature('android/telephony/TelephonyManager$CellInfoCallback')]
  JTelephonyManager_CellInfoCallback = interface(JObject)
    ['{863C99BD-0A74-495D-B9EE-B08E6E2724E8}']
    procedure onCellInfo(cellInfo: JList); cdecl;
    procedure onError(errorCode: Integer; detail: JThrowable); cdecl;
  end;
  TJTelephonyManager_CellInfoCallback = class(TJavaGenericImport<JTelephonyManager_CellInfoCallbackClass, JTelephonyManager_CellInfoCallback>) end;

  JTelephonyManager_NetworkSlicingExceptionClass = interface(JExceptionClass)
    ['{5013419B-80CB-4F5F-8522-F007AFB616F2}']
  end;

  [JavaSignature('android/telephony/TelephonyManager$NetworkSlicingException')]
  JTelephonyManager_NetworkSlicingException = interface(JException)
    ['{03C623FB-8B7D-498A-82F3-1F92654F2822}']
    function toString: JString; cdecl;
  end;
  TJTelephonyManager_NetworkSlicingException = class(TJavaGenericImport<JTelephonyManager_NetworkSlicingExceptionClass, JTelephonyManager_NetworkSlicingException>) end;

  JTelephonyManager_ModemErrorExceptionClass = interface(JTelephonyManager_NetworkSlicingExceptionClass)
    ['{675F04EC-23EF-4BEB-8E4B-43686CA1F792}']
  end;

  [JavaSignature('android/telephony/TelephonyManager$ModemErrorException')]
  JTelephonyManager_ModemErrorException = interface(JTelephonyManager_NetworkSlicingException)
    ['{0F8097BE-FAAA-4C04-B95D-903DA7EB6A8A}']
  end;
  TJTelephonyManager_ModemErrorException = class(TJavaGenericImport<JTelephonyManager_ModemErrorExceptionClass, JTelephonyManager_ModemErrorException>) end;

  JTelephonyManager_TimeoutExceptionClass = interface(JTelephonyManager_NetworkSlicingExceptionClass)
    ['{47C664F9-D070-40D7-981F-04BF3A139F5F}']
  end;

  [JavaSignature('android/telephony/TelephonyManager$TimeoutException')]
  JTelephonyManager_TimeoutException = interface(JTelephonyManager_NetworkSlicingException)
    ['{DE7A0243-D9D6-42F7-A0AC-E0384B265E55}']
  end;
  TJTelephonyManager_TimeoutException = class(TJavaGenericImport<JTelephonyManager_TimeoutExceptionClass, JTelephonyManager_TimeoutException>) end;

  JTelephonyManager_UssdResponseCallbackClass = interface(JObjectClass)
    ['{124673C6-2EEC-49C3-A608-8EE16F820123}']
    {class} function init: JTelephonyManager_UssdResponseCallback; cdecl;
  end;

  [JavaSignature('android/telephony/TelephonyManager$UssdResponseCallback')]
  JTelephonyManager_UssdResponseCallback = interface(JObject)
    ['{A99C7F8A-EDD5-4F21-97D8-87E118578E0F}']
    procedure onReceiveUssdResponse(telephonyManager: JTelephonyManager; request: JString; response: JCharSequence); cdecl;
    procedure onReceiveUssdResponseFailed(telephonyManager: JTelephonyManager; request: JString; failureCode: Integer); cdecl;
  end;
  TJTelephonyManager_UssdResponseCallback = class(TJavaGenericImport<JTelephonyManager_UssdResponseCallbackClass, JTelephonyManager_UssdResponseCallback>) end;

  JTelephonyScanManagerClass = interface(JObjectClass)
    ['{640462D4-CA28-4DED-ACB6-DFEB110A5D2F}']
    {class} function init: JTelephonyScanManager; cdecl;
  end;

  [JavaSignature('android/telephony/TelephonyScanManager')]
  JTelephonyScanManager = interface(JObject)
    ['{A9772E01-E833-4F0E-B41F-8A6F87FF9FAF}']
  end;
  TJTelephonyScanManager = class(TJavaGenericImport<JTelephonyScanManagerClass, JTelephonyScanManager>) end;

  JTelephonyScanManager_NetworkScanCallbackClass = interface(JObjectClass)
    ['{849C40F3-9B89-40D3-B4D5-0FF44E628E24}']
    {class} function init: JTelephonyScanManager_NetworkScanCallback; cdecl;
  end;

  [JavaSignature('android/telephony/TelephonyScanManager$NetworkScanCallback')]
  JTelephonyScanManager_NetworkScanCallback = interface(JObject)
    ['{1F7E3554-22EC-4359-8D79-3B45D7E30AEA}']
    procedure onComplete; cdecl;
    procedure onError(error: Integer); cdecl;
    procedure onResults(results: JList); cdecl;
  end;
  TJTelephonyScanManager_NetworkScanCallback = class(TJavaGenericImport<JTelephonyScanManager_NetworkScanCallbackClass, JTelephonyScanManager_NetworkScanCallback>) end;

  JUiccCardInfoClass = interface(JObjectClass)
    ['{4C646FBB-AACB-4900-A7AA-29AAE880AF12}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/UiccCardInfo')]
  JUiccCardInfo = interface(JObject)
    ['{7FB66E9F-14E9-46A0-BB68-D340E575D632}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCardId: Integer; cdecl;
    function getEid: JString; cdecl;
    function getIccId: JString; cdecl;//Deprecated
    function getPhysicalSlotIndex: Integer; cdecl;
    function getPorts: JCollection; cdecl;
    function getSlotIndex: Integer; cdecl;//Deprecated
    function hashCode: Integer; cdecl;
    function isEuicc: Boolean; cdecl;
    function isMultipleEnabledProfilesSupported: Boolean; cdecl;
    function isRemovable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJUiccCardInfo = class(TJavaGenericImport<JUiccCardInfoClass, JUiccCardInfo>) end;

  JUiccPortInfoClass = interface(JObjectClass)
    ['{3DBCD867-AFF2-4558-B589-292F52D15181}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetICCID_REDACTED: JString; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property ICCID_REDACTED: JString read _GetICCID_REDACTED;
  end;

  [JavaSignature('android/telephony/UiccPortInfo')]
  JUiccPortInfo = interface(JObject)
    ['{B3221AF8-C275-4D5F-9374-C392B7650FDC}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getIccId: JString; cdecl;
    function getLogicalSlotIndex: Integer; cdecl;
    function getPortIndex: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isActive: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJUiccPortInfo = class(TJavaGenericImport<JUiccPortInfoClass, JUiccPortInfo>) end;

  JVisualVoicemailServiceClass = interface(JServiceClass)
    ['{336F6B7D-63A9-467A-A696-619D200ABF52}']
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function init: JVisualVoicemailService; cdecl;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
  end;

  [JavaSignature('android/telephony/VisualVoicemailService')]
  JVisualVoicemailService = interface(JService)
    ['{2CD44619-916D-4E14-967B-16C73431A524}']
    function onBind(intent: JIntent): JIBinder; cdecl;
    //procedure onCellServiceConnected(task: JVisualVoicemailService_VisualVoicemailTask; phoneAccountHandle: JPhoneAccountHandle); cdecl;
    //procedure onSimRemoved(task: JVisualVoicemailService_VisualVoicemailTask; phoneAccountHandle: JPhoneAccountHandle); cdecl;
    procedure onSmsReceived(task: JVisualVoicemailService_VisualVoicemailTask; sms: JVisualVoicemailSms); cdecl;
    procedure onStopped(task: JVisualVoicemailService_VisualVoicemailTask); cdecl;
  end;
  TJVisualVoicemailService = class(TJavaGenericImport<JVisualVoicemailServiceClass, JVisualVoicemailService>) end;

  JVisualVoicemailService_VisualVoicemailTaskClass = interface(JObjectClass)
    ['{8F06F81C-DF44-47FD-BE24-65C536CB21FC}']
  end;

  [JavaSignature('android/telephony/VisualVoicemailService$VisualVoicemailTask')]
  JVisualVoicemailService_VisualVoicemailTask = interface(JObject)
    ['{3AAC9A1A-C72E-43FF-9649-94D4CEC01B75}']
    function equals(obj: JObject): Boolean; cdecl;
    procedure finish; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJVisualVoicemailService_VisualVoicemailTask = class(TJavaGenericImport<JVisualVoicemailService_VisualVoicemailTaskClass, JVisualVoicemailService_VisualVoicemailTask>) end;

  JVisualVoicemailSmsClass = interface(JObjectClass)
    ['{8AA434EB-5FFB-4F0A-8A7B-E8F5B7101340}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/VisualVoicemailSms')]
  JVisualVoicemailSms = interface(JObject)
    ['{34969245-D8EF-4020-BF72-4B0DDF47B946}']
    function describeContents: Integer; cdecl;
    function getFields: JBundle; cdecl;
    function getMessageBody: JString; cdecl;
    //function getPhoneAccountHandle: JPhoneAccountHandle; cdecl;
    function getPrefix: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJVisualVoicemailSms = class(TJavaGenericImport<JVisualVoicemailSmsClass, JVisualVoicemailSms>) end;

  JVisualVoicemailSmsFilterSettingsClass = interface(JObjectClass)
    ['{80EE86AD-EBCF-4B1C-8332-D5B6DA81DCAB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDESTINATION_PORT_ANY: Integer; cdecl;
    {class} function _GetDESTINATION_PORT_DATA_SMS: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DESTINATION_PORT_ANY: Integer read _GetDESTINATION_PORT_ANY;
    {class} property DESTINATION_PORT_DATA_SMS: Integer read _GetDESTINATION_PORT_DATA_SMS;
  end;

  [JavaSignature('android/telephony/VisualVoicemailSmsFilterSettings')]
  JVisualVoicemailSmsFilterSettings = interface(JObject)
    ['{344C0FC0-663A-43D9-BFE7-6838E4FA08C1}']
    function _GetclientPrefix: JString; cdecl;
    function _GetdestinationPort: Integer; cdecl;
    function _GetoriginatingNumbers: JList; cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property clientPrefix: JString read _GetclientPrefix;
    property destinationPort: Integer read _GetdestinationPort;
    property originatingNumbers: JList read _GetoriginatingNumbers;
  end;
  TJVisualVoicemailSmsFilterSettings = class(TJavaGenericImport<JVisualVoicemailSmsFilterSettingsClass, JVisualVoicemailSmsFilterSettings>) end;

  JVisualVoicemailSmsFilterSettings_BuilderClass = interface(JObjectClass)
    ['{08F69835-A7CE-47E7-8483-C65CEA9217DB}']
    {class} function init: JVisualVoicemailSmsFilterSettings_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/VisualVoicemailSmsFilterSettings$Builder')]
  JVisualVoicemailSmsFilterSettings_Builder = interface(JObject)
    ['{7BD5DA71-F4FF-4F9B-AFC2-BA8FCF5DAD8A}']
    function build: JVisualVoicemailSmsFilterSettings; cdecl;
    function setClientPrefix(clientPrefix: JString): JVisualVoicemailSmsFilterSettings_Builder; cdecl;
    function setDestinationPort(destinationPort: Integer): JVisualVoicemailSmsFilterSettings_Builder; cdecl;
    function setOriginatingNumbers(originatingNumbers: JList): JVisualVoicemailSmsFilterSettings_Builder; cdecl;
  end;
  TJVisualVoicemailSmsFilterSettings_Builder = class(TJavaGenericImport<JVisualVoicemailSmsFilterSettings_BuilderClass, JVisualVoicemailSmsFilterSettings_Builder>) end;

  JCdmaCellLocationClass = interface(JCellLocationClass)
    ['{0287239E-831E-4687-B06D-87243B3FC994}']
    {class} function init: JCdmaCellLocation; cdecl; overload;
    {class} function init(bundle: JBundle): JCdmaCellLocation; cdecl; overload;
    {class} function convertQuartSecToDecDegrees(quartSec: Integer): Double; cdecl;
  end;

  [JavaSignature('android/telephony/cdma/CdmaCellLocation')]
  JCdmaCellLocation = interface(JCellLocation)
    ['{30F5155B-56EB-4449-A3B2-90BFE8F170EB}']
    function equals(o: JObject): Boolean; cdecl;
    procedure fillInNotifierBundle(bundleToFill: JBundle); cdecl;
    function getBaseStationId: Integer; cdecl;
    function getBaseStationLatitude: Integer; cdecl;
    function getBaseStationLongitude: Integer; cdecl;
    function getNetworkId: Integer; cdecl;
    function getSystemId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure setCellLocationData(baseStationId: Integer; baseStationLatitude: Integer; baseStationLongitude: Integer); cdecl; overload;
    procedure setCellLocationData(baseStationId: Integer; baseStationLatitude: Integer; baseStationLongitude: Integer; systemId: Integer; networkId: Integer); cdecl; overload;
    procedure setStateInvalid; cdecl;
    function toString: JString; cdecl;
  end;
  TJCdmaCellLocation = class(TJavaGenericImport<JCdmaCellLocationClass, JCdmaCellLocation>) end;

  JApnSettingClass = interface(JObjectClass)
    ['{92BD317B-B8AC-4D12-94E9-C2CE4D316278}']
    {class} function _GetAUTH_TYPE_CHAP: Integer; cdecl;
    {class} function _GetAUTH_TYPE_NONE: Integer; cdecl;
    {class} function _GetAUTH_TYPE_PAP: Integer; cdecl;
    {class} function _GetAUTH_TYPE_PAP_OR_CHAP: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMVNO_TYPE_GID: Integer; cdecl;
    {class} function _GetMVNO_TYPE_ICCID: Integer; cdecl;
    {class} function _GetMVNO_TYPE_IMSI: Integer; cdecl;
    {class} function _GetMVNO_TYPE_SPN: Integer; cdecl;
    {class} function _GetPROTOCOL_IP: Integer; cdecl;
    {class} function _GetPROTOCOL_IPV4V6: Integer; cdecl;
    {class} function _GetPROTOCOL_IPV6: Integer; cdecl;
    {class} function _GetPROTOCOL_NON_IP: Integer; cdecl;
    {class} function _GetPROTOCOL_PPP: Integer; cdecl;
    {class} function _GetPROTOCOL_UNSTRUCTURED: Integer; cdecl;
    {class} function _GetTYPE_BIP: Integer; cdecl;
    {class} function _GetTYPE_CBS: Integer; cdecl;
    {class} function _GetTYPE_DEFAULT: Integer; cdecl;
    {class} function _GetTYPE_DUN: Integer; cdecl;
    {class} function _GetTYPE_EMERGENCY: Integer; cdecl;
    {class} function _GetTYPE_ENTERPRISE: Integer; cdecl;
    {class} function _GetTYPE_FOTA: Integer; cdecl;
    {class} function _GetTYPE_HIPRI: Integer; cdecl;
    {class} function _GetTYPE_IA: Integer; cdecl;
    {class} function _GetTYPE_IMS: Integer; cdecl;
    {class} function _GetTYPE_MCX: Integer; cdecl;
    {class} function _GetTYPE_MMS: Integer; cdecl;
    {class} function _GetTYPE_SUPL: Integer; cdecl;
    {class} function _GetTYPE_VSIM: Integer; cdecl;
    {class} function _GetTYPE_XCAP: Integer; cdecl;
    {class} property AUTH_TYPE_CHAP: Integer read _GetAUTH_TYPE_CHAP;
    {class} property AUTH_TYPE_NONE: Integer read _GetAUTH_TYPE_NONE;
    {class} property AUTH_TYPE_PAP: Integer read _GetAUTH_TYPE_PAP;
    {class} property AUTH_TYPE_PAP_OR_CHAP: Integer read _GetAUTH_TYPE_PAP_OR_CHAP;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property MVNO_TYPE_GID: Integer read _GetMVNO_TYPE_GID;
    {class} property MVNO_TYPE_ICCID: Integer read _GetMVNO_TYPE_ICCID;
    {class} property MVNO_TYPE_IMSI: Integer read _GetMVNO_TYPE_IMSI;
    {class} property MVNO_TYPE_SPN: Integer read _GetMVNO_TYPE_SPN;
    {class} property PROTOCOL_IP: Integer read _GetPROTOCOL_IP;
    {class} property PROTOCOL_IPV4V6: Integer read _GetPROTOCOL_IPV4V6;
    {class} property PROTOCOL_IPV6: Integer read _GetPROTOCOL_IPV6;
    {class} property PROTOCOL_NON_IP: Integer read _GetPROTOCOL_NON_IP;
    {class} property PROTOCOL_PPP: Integer read _GetPROTOCOL_PPP;
    {class} property PROTOCOL_UNSTRUCTURED: Integer read _GetPROTOCOL_UNSTRUCTURED;
    {class} property TYPE_BIP: Integer read _GetTYPE_BIP;
    {class} property TYPE_CBS: Integer read _GetTYPE_CBS;
    {class} property TYPE_DEFAULT: Integer read _GetTYPE_DEFAULT;
    {class} property TYPE_DUN: Integer read _GetTYPE_DUN;
    {class} property TYPE_EMERGENCY: Integer read _GetTYPE_EMERGENCY;
    {class} property TYPE_ENTERPRISE: Integer read _GetTYPE_ENTERPRISE;
    {class} property TYPE_FOTA: Integer read _GetTYPE_FOTA;
    {class} property TYPE_HIPRI: Integer read _GetTYPE_HIPRI;
    {class} property TYPE_IA: Integer read _GetTYPE_IA;
    {class} property TYPE_IMS: Integer read _GetTYPE_IMS;
    {class} property TYPE_MCX: Integer read _GetTYPE_MCX;
    {class} property TYPE_MMS: Integer read _GetTYPE_MMS;
    {class} property TYPE_SUPL: Integer read _GetTYPE_SUPL;
    {class} property TYPE_VSIM: Integer read _GetTYPE_VSIM;
    {class} property TYPE_XCAP: Integer read _GetTYPE_XCAP;
  end;

  [JavaSignature('android/telephony/data/ApnSetting')]
  JApnSetting = interface(JObject)
    ['{6CCF8698-DB97-4434-A231-E527349D835F}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getApnName: JString; cdecl;
    function getApnTypeBitmask: Integer; cdecl;
    function getAuthType: Integer; cdecl;
    function getCarrierId: Integer; cdecl;
    function getEntryName: JString; cdecl;
    function getId: Integer; cdecl;
    function getMmsProxyAddress: JInetAddress; cdecl;//Deprecated
    function getMmsProxyAddressAsString: JString; cdecl;
    function getMmsProxyPort: Integer; cdecl;
    function getMmsc: Jnet_Uri; cdecl;
    function getMtuV4: Integer; cdecl;
    function getMtuV6: Integer; cdecl;
    function getMvnoType: Integer; cdecl;
    function getNetworkTypeBitmask: Integer; cdecl;
    function getOperatorNumeric: JString; cdecl;
    function getPassword: JString; cdecl;
    function getProfileId: Integer; cdecl;
    function getProtocol: Integer; cdecl;
    function getProxyAddress: JInetAddress; cdecl;//Deprecated
    function getProxyAddressAsString: JString; cdecl;
    function getProxyPort: Integer; cdecl;
    function getRoamingProtocol: Integer; cdecl;
    function getUser: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isEnabled: Boolean; cdecl;
    function isPersistent: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJApnSetting = class(TJavaGenericImport<JApnSettingClass, JApnSetting>) end;

  JApnSetting_BuilderClass = interface(JObjectClass)
    ['{44009BBA-F182-48BF-A88B-48606B9F8D5F}']
    {class} function init: JApnSetting_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/data/ApnSetting$Builder')]
  JApnSetting_Builder = interface(JObject)
    ['{F832E26D-B718-46A6-A49B-484B16408B22}']
    function build: JApnSetting; cdecl;
    function setApnName(apnName: JString): JApnSetting_Builder; cdecl;
    function setApnTypeBitmask(apnTypeBitmask: Integer): JApnSetting_Builder; cdecl;
    function setAuthType(authType: Integer): JApnSetting_Builder; cdecl;
    function setCarrierEnabled(carrierEnabled: Boolean): JApnSetting_Builder; cdecl;
    function setCarrierId(carrierId: Integer): JApnSetting_Builder; cdecl;
    function setEntryName(entryName: JString): JApnSetting_Builder; cdecl;
    function setMmsProxyAddress(mmsProxy: JInetAddress): JApnSetting_Builder; cdecl; overload;//Deprecated
    function setMmsProxyAddress(mmsProxy: JString): JApnSetting_Builder; cdecl; overload;
    function setMmsProxyPort(mmsPort: Integer): JApnSetting_Builder; cdecl;
    function setMmsc(mmsc: Jnet_Uri): JApnSetting_Builder; cdecl;
    function setMtuV4(mtuV4: Integer): JApnSetting_Builder; cdecl;
    function setMtuV6(mtuV6: Integer): JApnSetting_Builder; cdecl;
    function setMvnoType(mvnoType: Integer): JApnSetting_Builder; cdecl;
    function setNetworkTypeBitmask(networkTypeBitmask: Integer): JApnSetting_Builder; cdecl;
    function setOperatorNumeric(operatorNumeric: JString): JApnSetting_Builder; cdecl;
    function setPassword(password: JString): JApnSetting_Builder; cdecl;
    function setPersistent(isPersistent: Boolean): JApnSetting_Builder; cdecl;
    function setProfileId(profileId: Integer): JApnSetting_Builder; cdecl;
    function setProtocol(protocol: Integer): JApnSetting_Builder; cdecl;
    function setProxyAddress(proxy: JInetAddress): JApnSetting_Builder; cdecl; overload;//Deprecated
    function setProxyAddress(proxy: JString): JApnSetting_Builder; cdecl; overload;
    function setProxyPort(port: Integer): JApnSetting_Builder; cdecl;
    function setRoamingProtocol(roamingProtocol: Integer): JApnSetting_Builder; cdecl;
    function setUser(user: JString): JApnSetting_Builder; cdecl;
  end;
  TJApnSetting_Builder = class(TJavaGenericImport<JApnSetting_BuilderClass, JApnSetting_Builder>) end;

  JNetworkSliceInfoClass = interface(JObjectClass)
    ['{40530937-EFDF-4C68-B8D3-C450BAF23627}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSLICE_DIFFERENTIATOR_NO_SLICE: Integer; cdecl;
    {class} function _GetSLICE_SERVICE_TYPE_EMBB: Integer; cdecl;
    {class} function _GetSLICE_SERVICE_TYPE_MIOT: Integer; cdecl;
    {class} function _GetSLICE_SERVICE_TYPE_NONE: Integer; cdecl;
    {class} function _GetSLICE_SERVICE_TYPE_URLLC: Integer; cdecl;
    {class} function _GetSLICE_STATUS_ALLOWED: Integer; cdecl;
    {class} function _GetSLICE_STATUS_CONFIGURED: Integer; cdecl;
    {class} function _GetSLICE_STATUS_DEFAULT_CONFIGURED: Integer; cdecl;
    {class} function _GetSLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_PLMN: Integer; cdecl;
    {class} function _GetSLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_REGISTERED_AREA: Integer; cdecl;
    {class} function _GetSLICE_STATUS_UNKNOWN: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SLICE_DIFFERENTIATOR_NO_SLICE: Integer read _GetSLICE_DIFFERENTIATOR_NO_SLICE;
    {class} property SLICE_SERVICE_TYPE_EMBB: Integer read _GetSLICE_SERVICE_TYPE_EMBB;
    {class} property SLICE_SERVICE_TYPE_MIOT: Integer read _GetSLICE_SERVICE_TYPE_MIOT;
    {class} property SLICE_SERVICE_TYPE_NONE: Integer read _GetSLICE_SERVICE_TYPE_NONE;
    {class} property SLICE_SERVICE_TYPE_URLLC: Integer read _GetSLICE_SERVICE_TYPE_URLLC;
    {class} property SLICE_STATUS_ALLOWED: Integer read _GetSLICE_STATUS_ALLOWED;
    {class} property SLICE_STATUS_CONFIGURED: Integer read _GetSLICE_STATUS_CONFIGURED;
    {class} property SLICE_STATUS_DEFAULT_CONFIGURED: Integer read _GetSLICE_STATUS_DEFAULT_CONFIGURED;
    {class} property SLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_PLMN: Integer read _GetSLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_PLMN;
    {class} property SLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_REGISTERED_AREA: Integer read _GetSLICE_STATUS_REJECTED_NOT_AVAILABLE_IN_REGISTERED_AREA;
    {class} property SLICE_STATUS_UNKNOWN: Integer read _GetSLICE_STATUS_UNKNOWN;
  end;

  [JavaSignature('android/telephony/data/NetworkSliceInfo')]
  JNetworkSliceInfo = interface(JObject)
    ['{012689E8-E49B-4CAC-8D00-C4A2242D4D87}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getMappedHplmnSliceDifferentiator: Integer; cdecl;
    function getMappedHplmnSliceServiceType: Integer; cdecl;
    function getSliceDifferentiator: Integer; cdecl;
    function getSliceServiceType: Integer; cdecl;
    function getStatus: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkSliceInfo = class(TJavaGenericImport<JNetworkSliceInfoClass, JNetworkSliceInfo>) end;

  JNetworkSliceInfo_BuilderClass = interface(JObjectClass)
    ['{5F1C7622-A986-48D4-BE8E-DFD1489FAA8E}']
    {class} function init: JNetworkSliceInfo_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/data/NetworkSliceInfo$Builder')]
  JNetworkSliceInfo_Builder = interface(JObject)
    ['{AF048B9F-8A94-48BB-94A9-94559B3EE4AC}']
    function build: JNetworkSliceInfo; cdecl;
    function setMappedHplmnSliceDifferentiator(mappedHplmnSliceDifferentiator: Integer): JNetworkSliceInfo_Builder; cdecl;
    function setMappedHplmnSliceServiceType(mappedHplmnSliceServiceType: Integer): JNetworkSliceInfo_Builder; cdecl;
    function setSliceDifferentiator(sliceDifferentiator: Integer): JNetworkSliceInfo_Builder; cdecl;
    function setSliceServiceType(mSliceServiceType: Integer): JNetworkSliceInfo_Builder; cdecl;
    function setStatus(status: Integer): JNetworkSliceInfo_Builder; cdecl;
  end;
  TJNetworkSliceInfo_Builder = class(TJavaGenericImport<JNetworkSliceInfo_BuilderClass, JNetworkSliceInfo_Builder>) end;

  JNetworkSlicingConfigClass = interface(JObjectClass)
    ['{72EABB98-9CBC-48BE-B8BB-624CA051CD12}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JNetworkSlicingConfig; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/data/NetworkSlicingConfig')]
  JNetworkSlicingConfig = interface(JObject)
    ['{F82243DA-8F3C-4C1A-9094-F1DAAA16CD95}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSliceInfo: JList; cdecl;
    function getUrspRules: JList; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkSlicingConfig = class(TJavaGenericImport<JNetworkSlicingConfigClass, JNetworkSlicingConfig>) end;

  JRouteSelectionDescriptorClass = interface(JObjectClass)
    ['{0446D416-CB01-48FF-9142-BF74F970A448}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetROUTE_SSC_MODE_1: Integer; cdecl;
    {class} function _GetROUTE_SSC_MODE_2: Integer; cdecl;
    {class} function _GetROUTE_SSC_MODE_3: Integer; cdecl;
    {class} function _GetSESSION_TYPE_IPV4: Integer; cdecl;
    {class} function _GetSESSION_TYPE_IPV4V6: Integer; cdecl;
    {class} function _GetSESSION_TYPE_IPV6: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property ROUTE_SSC_MODE_1: Integer read _GetROUTE_SSC_MODE_1;
    {class} property ROUTE_SSC_MODE_2: Integer read _GetROUTE_SSC_MODE_2;
    {class} property ROUTE_SSC_MODE_3: Integer read _GetROUTE_SSC_MODE_3;
    {class} property SESSION_TYPE_IPV4: Integer read _GetSESSION_TYPE_IPV4;
    {class} property SESSION_TYPE_IPV4V6: Integer read _GetSESSION_TYPE_IPV4V6;
    {class} property SESSION_TYPE_IPV6: Integer read _GetSESSION_TYPE_IPV6;
  end;

  [JavaSignature('android/telephony/data/RouteSelectionDescriptor')]
  JRouteSelectionDescriptor = interface(JObject)
    ['{2ABE8FD6-4B29-4B04-B448-C857D140E31A}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDataNetworkName: JList; cdecl;
    function getPrecedence: Integer; cdecl;
    function getSessionType: Integer; cdecl;
    function getSliceInfo: JList; cdecl;
    function getSscMode: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRouteSelectionDescriptor = class(TJavaGenericImport<JRouteSelectionDescriptorClass, JRouteSelectionDescriptor>) end;

  JTrafficDescriptorClass = interface(JObjectClass)
    ['{3880BFAD-44BC-4874-9D23-BEAA53557AE4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/data/TrafficDescriptor')]
  JTrafficDescriptor = interface(JObject)
    ['{ADA25E09-D000-428D-89F2-09E1B3E93045}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDataNetworkName: JString; cdecl;
    function getOsAppId: TJavaArray<Byte>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTrafficDescriptor = class(TJavaGenericImport<JTrafficDescriptorClass, JTrafficDescriptor>) end;

  JTrafficDescriptor_BuilderClass = interface(JObjectClass)
    ['{87930CAF-BF58-4625-A12C-A8DF94FDD155}']
    {class} function init: JTrafficDescriptor_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/data/TrafficDescriptor$Builder')]
  JTrafficDescriptor_Builder = interface(JObject)
    ['{1B9514A8-D71C-4AC5-910E-5757EBC09092}']
    function build: JTrafficDescriptor; cdecl;
    function setDataNetworkName(dnn: JString): JTrafficDescriptor_Builder; cdecl;
    function setOsAppId(osAppId: TJavaArray<Byte>): JTrafficDescriptor_Builder; cdecl;
  end;
  TJTrafficDescriptor_Builder = class(TJavaGenericImport<JTrafficDescriptor_BuilderClass, JTrafficDescriptor_Builder>) end;

  JUrspRuleClass = interface(JObjectClass)
    ['{5406C0EA-4738-4969-9CEF-23064694DA43}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/data/UrspRule')]
  JUrspRule = interface(JObject)
    ['{ACC7B97C-B4DA-440F-98A1-F9A4E517A301}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getPrecedence: Integer; cdecl;
    function getRouteSelectionDescriptor: JList; cdecl;
    function getTrafficDescriptors: JList; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJUrspRule = class(TJavaGenericImport<JUrspRuleClass, JUrspRule>) end;

  JEmergencyNumberClass = interface(JObjectClass)
    ['{3C4E2D6F-3E17-448B-B26A-7E8FB7F5DC04}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEMERGENCY_CALL_ROUTING_EMERGENCY: Integer; cdecl;
    {class} function _GetEMERGENCY_CALL_ROUTING_NORMAL: Integer; cdecl;
    {class} function _GetEMERGENCY_CALL_ROUTING_UNKNOWN: Integer; cdecl;
    {class} function _GetEMERGENCY_NUMBER_SOURCE_DATABASE: Integer; cdecl;
    {class} function _GetEMERGENCY_NUMBER_SOURCE_DEFAULT: Integer; cdecl;
    {class} function _GetEMERGENCY_NUMBER_SOURCE_MODEM_CONFIG: Integer; cdecl;
    {class} function _GetEMERGENCY_NUMBER_SOURCE_NETWORK_SIGNALING: Integer; cdecl;
    {class} function _GetEMERGENCY_NUMBER_SOURCE_SIM: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_AIEC: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_AMBULANCE: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_FIRE_BRIGADE: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_MARINE_GUARD: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_MIEC: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_MOUNTAIN_RESCUE: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_POLICE: Integer; cdecl;
    {class} function _GetEMERGENCY_SERVICE_CATEGORY_UNSPECIFIED: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EMERGENCY_CALL_ROUTING_EMERGENCY: Integer read _GetEMERGENCY_CALL_ROUTING_EMERGENCY;
    {class} property EMERGENCY_CALL_ROUTING_NORMAL: Integer read _GetEMERGENCY_CALL_ROUTING_NORMAL;
    {class} property EMERGENCY_CALL_ROUTING_UNKNOWN: Integer read _GetEMERGENCY_CALL_ROUTING_UNKNOWN;
    {class} property EMERGENCY_NUMBER_SOURCE_DATABASE: Integer read _GetEMERGENCY_NUMBER_SOURCE_DATABASE;
    {class} property EMERGENCY_NUMBER_SOURCE_DEFAULT: Integer read _GetEMERGENCY_NUMBER_SOURCE_DEFAULT;
    {class} property EMERGENCY_NUMBER_SOURCE_MODEM_CONFIG: Integer read _GetEMERGENCY_NUMBER_SOURCE_MODEM_CONFIG;
    {class} property EMERGENCY_NUMBER_SOURCE_NETWORK_SIGNALING: Integer read _GetEMERGENCY_NUMBER_SOURCE_NETWORK_SIGNALING;
    {class} property EMERGENCY_NUMBER_SOURCE_SIM: Integer read _GetEMERGENCY_NUMBER_SOURCE_SIM;
    {class} property EMERGENCY_SERVICE_CATEGORY_AIEC: Integer read _GetEMERGENCY_SERVICE_CATEGORY_AIEC;
    {class} property EMERGENCY_SERVICE_CATEGORY_AMBULANCE: Integer read _GetEMERGENCY_SERVICE_CATEGORY_AMBULANCE;
    {class} property EMERGENCY_SERVICE_CATEGORY_FIRE_BRIGADE: Integer read _GetEMERGENCY_SERVICE_CATEGORY_FIRE_BRIGADE;
    {class} property EMERGENCY_SERVICE_CATEGORY_MARINE_GUARD: Integer read _GetEMERGENCY_SERVICE_CATEGORY_MARINE_GUARD;
    {class} property EMERGENCY_SERVICE_CATEGORY_MIEC: Integer read _GetEMERGENCY_SERVICE_CATEGORY_MIEC;
    {class} property EMERGENCY_SERVICE_CATEGORY_MOUNTAIN_RESCUE: Integer read _GetEMERGENCY_SERVICE_CATEGORY_MOUNTAIN_RESCUE;
    {class} property EMERGENCY_SERVICE_CATEGORY_POLICE: Integer read _GetEMERGENCY_SERVICE_CATEGORY_POLICE;
    {class} property EMERGENCY_SERVICE_CATEGORY_UNSPECIFIED: Integer read _GetEMERGENCY_SERVICE_CATEGORY_UNSPECIFIED;
  end;

  [JavaSignature('android/telephony/emergency/EmergencyNumber')]
  JEmergencyNumber = interface(JObject)
    ['{8D5BD7E8-DF4D-448D-8FA0-4124F6A33760}']
    function compareTo(emergencyNumber: JEmergencyNumber): Integer; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getCountryIso: JString; cdecl;
    function getEmergencyCallRouting: Integer; cdecl;
    function getEmergencyNumberSources: JList; cdecl;
    function getEmergencyServiceCategories: JList; cdecl;
    function getEmergencyUrns: JList; cdecl;
    function getMnc: JString; cdecl;
    function getNumber: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isFromSources(sources: Integer): Boolean; cdecl;
    function isInEmergencyServiceCategories(categories: Integer): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJEmergencyNumber = class(TJavaGenericImport<JEmergencyNumberClass, JEmergencyNumber>) end;

  JDownloadableSubscriptionClass = interface(JObjectClass)
    ['{0EACBADC-CA08-431F-BF36-F062F498BC76}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function forActivationCode(encodedActivationCode: JString): JDownloadableSubscription; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/euicc/DownloadableSubscription')]
  JDownloadableSubscription = interface(JObject)
    ['{3A8BF2D1-9B85-4C9D-9B80-AFA6B8997F40}']
    function describeContents: Integer; cdecl;
    function getConfirmationCode: JString; cdecl;
    function getEncodedActivationCode: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJDownloadableSubscription = class(TJavaGenericImport<JDownloadableSubscriptionClass, JDownloadableSubscription>) end;

  JDownloadableSubscription_BuilderClass = interface(JObjectClass)
    ['{51E68702-FFD3-49B5-A056-3D5F96BC2A7E}']
    {class} function init(baseSubscription: JDownloadableSubscription): JDownloadableSubscription_Builder; cdecl; overload;
    {class} function init(encodedActivationCode: JString): JDownloadableSubscription_Builder; cdecl; overload;
  end;

  [JavaSignature('android/telephony/euicc/DownloadableSubscription$Builder')]
  JDownloadableSubscription_Builder = interface(JObject)
    ['{F2F6DC25-627D-4F03-ACA7-A182948DA0AE}']
    function build: JDownloadableSubscription; cdecl;
    function setConfirmationCode(value: JString): JDownloadableSubscription_Builder; cdecl;
    function setEncodedActivationCode(value: JString): JDownloadableSubscription_Builder; cdecl;
  end;
  TJDownloadableSubscription_Builder = class(TJavaGenericImport<JDownloadableSubscription_BuilderClass, JDownloadableSubscription_Builder>) end;

  JEuiccInfoClass = interface(JObjectClass)
    ['{B80EE87B-8C18-4AE3-B170-765BC8CF6D49}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(osVersion: JString): JEuiccInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/euicc/EuiccInfo')]
  JEuiccInfo = interface(JObject)
    ['{1699E440-6827-4EC7-B485-BEF80ADFCD67}']
    function describeContents: Integer; cdecl;
    function getOsVersion: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJEuiccInfo = class(TJavaGenericImport<JEuiccInfoClass, JEuiccInfo>) end;

  JEuiccManagerClass = interface(JObjectClass)
    ['{BF175E28-235E-4481-9097-F7519E26047B}']
    {class} function _GetACTION_MANAGE_EMBEDDED_SUBSCRIPTIONS: JString; cdecl;
    {class} function _GetACTION_NOTIFY_CARRIER_SETUP_INCOMPLETE: JString; cdecl;
    {class} function _GetACTION_START_EUICC_ACTIVATION: JString; cdecl;
    {class} function _GetEMBEDDED_SUBSCRIPTION_RESULT_ERROR: Integer; cdecl;
    {class} function _GetEMBEDDED_SUBSCRIPTION_RESULT_OK: Integer; cdecl;
    {class} function _GetEMBEDDED_SUBSCRIPTION_RESULT_RESOLVABLE_ERROR: Integer; cdecl;
    {class} function _GetERROR_ADDRESS_MISSING: Integer; cdecl;
    {class} function _GetERROR_CARRIER_LOCKED: Integer; cdecl;
    {class} function _GetERROR_CERTIFICATE_ERROR: Integer; cdecl;
    {class} function _GetERROR_CONNECTION_ERROR: Integer; cdecl;
    {class} function _GetERROR_DISALLOWED_BY_PPR: Integer; cdecl;
    {class} function _GetERROR_EUICC_INSUFFICIENT_MEMORY: Integer; cdecl;
    {class} function _GetERROR_EUICC_MISSING: Integer; cdecl;
    {class} function _GetERROR_INCOMPATIBLE_CARRIER: Integer; cdecl;
    {class} function _GetERROR_INSTALL_PROFILE: Integer; cdecl;
    {class} function _GetERROR_INVALID_ACTIVATION_CODE: Integer; cdecl;
    {class} function _GetERROR_INVALID_CONFIRMATION_CODE: Integer; cdecl;
    {class} function _GetERROR_INVALID_PORT: Integer; cdecl;
    {class} function _GetERROR_INVALID_RESPONSE: Integer; cdecl;
    {class} function _GetERROR_NO_PROFILES_AVAILABLE: Integer; cdecl;
    {class} function _GetERROR_OPERATION_BUSY: Integer; cdecl;
    {class} function _GetERROR_SIM_MISSING: Integer; cdecl;
    {class} function _GetERROR_TIME_OUT: Integer; cdecl;
    {class} function _GetERROR_UNSUPPORTED_VERSION: Integer; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_DETAILED_CODE: JString; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_DOWNLOADABLE_SUBSCRIPTION: JString; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_ERROR_CODE: JString; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_OPERATION_CODE: JString; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_SMDX_REASON_CODE: JString; cdecl;
    {class} function _GetEXTRA_EMBEDDED_SUBSCRIPTION_SMDX_SUBJECT_CODE: JString; cdecl;
    {class} function _GetEXTRA_USE_QR_SCANNER: JString; cdecl;
    {class} function _GetMETA_DATA_CARRIER_ICON: JString; cdecl;
    {class} function _GetOPERATION_APDU: Integer; cdecl;
    {class} function _GetOPERATION_DOWNLOAD: Integer; cdecl;
    {class} function _GetOPERATION_EUICC_CARD: Integer; cdecl;
    {class} function _GetOPERATION_EUICC_GSMA: Integer; cdecl;
    {class} function _GetOPERATION_HTTP: Integer; cdecl;
    {class} function _GetOPERATION_METADATA: Integer; cdecl;
    {class} function _GetOPERATION_SIM_SLOT: Integer; cdecl;
    {class} function _GetOPERATION_SMDX: Integer; cdecl;
    {class} function _GetOPERATION_SMDX_SUBJECT_REASON_CODE: Integer; cdecl;
    {class} function _GetOPERATION_SWITCH: Integer; cdecl;
    {class} function _GetOPERATION_SYSTEM: Integer; cdecl;
    {class} property ACTION_MANAGE_EMBEDDED_SUBSCRIPTIONS: JString read _GetACTION_MANAGE_EMBEDDED_SUBSCRIPTIONS;
    {class} property ACTION_NOTIFY_CARRIER_SETUP_INCOMPLETE: JString read _GetACTION_NOTIFY_CARRIER_SETUP_INCOMPLETE;
    {class} property ACTION_START_EUICC_ACTIVATION: JString read _GetACTION_START_EUICC_ACTIVATION;
    {class} property EMBEDDED_SUBSCRIPTION_RESULT_ERROR: Integer read _GetEMBEDDED_SUBSCRIPTION_RESULT_ERROR;
    {class} property EMBEDDED_SUBSCRIPTION_RESULT_OK: Integer read _GetEMBEDDED_SUBSCRIPTION_RESULT_OK;
    {class} property EMBEDDED_SUBSCRIPTION_RESULT_RESOLVABLE_ERROR: Integer read _GetEMBEDDED_SUBSCRIPTION_RESULT_RESOLVABLE_ERROR;
    {class} property ERROR_ADDRESS_MISSING: Integer read _GetERROR_ADDRESS_MISSING;
    {class} property ERROR_CARRIER_LOCKED: Integer read _GetERROR_CARRIER_LOCKED;
    {class} property ERROR_CERTIFICATE_ERROR: Integer read _GetERROR_CERTIFICATE_ERROR;
    {class} property ERROR_CONNECTION_ERROR: Integer read _GetERROR_CONNECTION_ERROR;
    {class} property ERROR_DISALLOWED_BY_PPR: Integer read _GetERROR_DISALLOWED_BY_PPR;
    {class} property ERROR_EUICC_INSUFFICIENT_MEMORY: Integer read _GetERROR_EUICC_INSUFFICIENT_MEMORY;
    {class} property ERROR_EUICC_MISSING: Integer read _GetERROR_EUICC_MISSING;
    {class} property ERROR_INCOMPATIBLE_CARRIER: Integer read _GetERROR_INCOMPATIBLE_CARRIER;
    {class} property ERROR_INSTALL_PROFILE: Integer read _GetERROR_INSTALL_PROFILE;
    {class} property ERROR_INVALID_ACTIVATION_CODE: Integer read _GetERROR_INVALID_ACTIVATION_CODE;
    {class} property ERROR_INVALID_CONFIRMATION_CODE: Integer read _GetERROR_INVALID_CONFIRMATION_CODE;
    {class} property ERROR_INVALID_PORT: Integer read _GetERROR_INVALID_PORT;
    {class} property ERROR_INVALID_RESPONSE: Integer read _GetERROR_INVALID_RESPONSE;
    {class} property ERROR_NO_PROFILES_AVAILABLE: Integer read _GetERROR_NO_PROFILES_AVAILABLE;
    {class} property ERROR_OPERATION_BUSY: Integer read _GetERROR_OPERATION_BUSY;
    {class} property ERROR_SIM_MISSING: Integer read _GetERROR_SIM_MISSING;
    {class} property ERROR_TIME_OUT: Integer read _GetERROR_TIME_OUT;
    {class} property ERROR_UNSUPPORTED_VERSION: Integer read _GetERROR_UNSUPPORTED_VERSION;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_DETAILED_CODE: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_DETAILED_CODE;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_DOWNLOADABLE_SUBSCRIPTION: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_DOWNLOADABLE_SUBSCRIPTION;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_ERROR_CODE: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_ERROR_CODE;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_OPERATION_CODE: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_OPERATION_CODE;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_SMDX_REASON_CODE: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_SMDX_REASON_CODE;
    {class} property EXTRA_EMBEDDED_SUBSCRIPTION_SMDX_SUBJECT_CODE: JString read _GetEXTRA_EMBEDDED_SUBSCRIPTION_SMDX_SUBJECT_CODE;
    {class} property EXTRA_USE_QR_SCANNER: JString read _GetEXTRA_USE_QR_SCANNER;
    {class} property META_DATA_CARRIER_ICON: JString read _GetMETA_DATA_CARRIER_ICON;
    {class} property OPERATION_APDU: Integer read _GetOPERATION_APDU;
    {class} property OPERATION_DOWNLOAD: Integer read _GetOPERATION_DOWNLOAD;
    {class} property OPERATION_EUICC_CARD: Integer read _GetOPERATION_EUICC_CARD;
    {class} property OPERATION_EUICC_GSMA: Integer read _GetOPERATION_EUICC_GSMA;
    {class} property OPERATION_HTTP: Integer read _GetOPERATION_HTTP;
    {class} property OPERATION_METADATA: Integer read _GetOPERATION_METADATA;
    {class} property OPERATION_SIM_SLOT: Integer read _GetOPERATION_SIM_SLOT;
    {class} property OPERATION_SMDX: Integer read _GetOPERATION_SMDX;
    {class} property OPERATION_SMDX_SUBJECT_REASON_CODE: Integer read _GetOPERATION_SMDX_SUBJECT_REASON_CODE;
    {class} property OPERATION_SWITCH: Integer read _GetOPERATION_SWITCH;
    {class} property OPERATION_SYSTEM: Integer read _GetOPERATION_SYSTEM;
  end;

  [JavaSignature('android/telephony/euicc/EuiccManager')]
  JEuiccManager = interface(JObject)
    ['{392C3AA1-84C4-4AD3-B57A-FE6FA761BAFE}']
    function createForCardId(cardId: Integer): JEuiccManager; cdecl;
    procedure deleteSubscription(subscriptionId: Integer; callbackIntent: JPendingIntent); cdecl;
    procedure downloadSubscription(subscription: JDownloadableSubscription; switchAfterDownload: Boolean; callbackIntent: JPendingIntent); cdecl;
    function getEid: JString; cdecl;
    function getEuiccInfo: JEuiccInfo; cdecl;
    function isEnabled: Boolean; cdecl;
    function isSimPortAvailable(portIndex: Integer): Boolean; cdecl;
    procedure startResolutionActivity(activity: JActivity; requestCode: Integer; resultIntent: JIntent; callbackIntent: JPendingIntent); cdecl;
    procedure switchToSubscription(subscriptionId: Integer; callbackIntent: JPendingIntent); cdecl; overload;
    procedure switchToSubscription(subscriptionId: Integer; portIndex: Integer; callbackIntent: JPendingIntent); cdecl; overload;
    procedure updateSubscriptionNickname(subscriptionId: Integer; nickname: JString; callbackIntent: JPendingIntent); cdecl;
  end;
  TJEuiccManager = class(TJavaGenericImport<JEuiccManagerClass, JEuiccManager>) end;

  JGsmCellLocationClass = interface(JCellLocationClass)
    ['{31FDA1F7-0041-4FF2-91D2-F15D974EAC2C}']
    {class} function init: JGsmCellLocation; cdecl; overload;
    {class} function init(bundle: JBundle): JGsmCellLocation; cdecl; overload;
  end;

  [JavaSignature('android/telephony/gsm/GsmCellLocation')]
  JGsmCellLocation = interface(JCellLocation)
    ['{D09EE10D-C54B-40AB-AE80-461A6AC0DB66}']
    function equals(o: JObject): Boolean; cdecl;
    procedure fillInNotifierBundle(m: JBundle); cdecl;
    function getCid: Integer; cdecl;
    function getLac: Integer; cdecl;
    function getPsc: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure setLacAndCid(lac: Integer; cid: Integer); cdecl;
    procedure setStateInvalid; cdecl;
    function toString: JString; cdecl;
  end;
  TJGsmCellLocation = class(TJavaGenericImport<JGsmCellLocationClass, JGsmCellLocation>) end;

  Jgsm_SmsManagerClass = interface(JObjectClass)
    ['{17F8CCF3-8CA3-4E7C-86AA-CD21CF9AE9C5}']
    {class} function _GetRESULT_ERROR_GENERIC_FAILURE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_NO_SERVICE: Integer; cdecl;
    {class} function _GetRESULT_ERROR_NULL_PDU: Integer; cdecl;
    {class} function _GetRESULT_ERROR_RADIO_OFF: Integer; cdecl;
    {class} function _GetSTATUS_ON_SIM_FREE: Integer; cdecl;
    {class} function _GetSTATUS_ON_SIM_READ: Integer; cdecl;
    {class} function _GetSTATUS_ON_SIM_SENT: Integer; cdecl;
    {class} function _GetSTATUS_ON_SIM_UNREAD: Integer; cdecl;
    {class} function _GetSTATUS_ON_SIM_UNSENT: Integer; cdecl;
    {class} function getDefault: Jgsm_SmsManager; cdecl;//Deprecated
    {class} property RESULT_ERROR_GENERIC_FAILURE: Integer read _GetRESULT_ERROR_GENERIC_FAILURE;
    {class} property RESULT_ERROR_NO_SERVICE: Integer read _GetRESULT_ERROR_NO_SERVICE;
    {class} property RESULT_ERROR_NULL_PDU: Integer read _GetRESULT_ERROR_NULL_PDU;
    {class} property RESULT_ERROR_RADIO_OFF: Integer read _GetRESULT_ERROR_RADIO_OFF;
    {class} property STATUS_ON_SIM_FREE: Integer read _GetSTATUS_ON_SIM_FREE;
    {class} property STATUS_ON_SIM_READ: Integer read _GetSTATUS_ON_SIM_READ;
    {class} property STATUS_ON_SIM_SENT: Integer read _GetSTATUS_ON_SIM_SENT;
    {class} property STATUS_ON_SIM_UNREAD: Integer read _GetSTATUS_ON_SIM_UNREAD;
    {class} property STATUS_ON_SIM_UNSENT: Integer read _GetSTATUS_ON_SIM_UNSENT;
  end;

  [JavaSignature('android/telephony/gsm/SmsManager')]
  Jgsm_SmsManager = interface(JObject)
    ['{0E3A70E1-7A4B-4480-896E-62E41FBF913E}']
    function divideMessage(text: JString): JArrayList; cdecl;//Deprecated
    procedure sendDataMessage(destinationAddress: JString; scAddress: JString; destinationPort: SmallInt; data: TJavaArray<Byte>; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent); cdecl;//Deprecated
    procedure sendMultipartTextMessage(destinationAddress: JString; scAddress: JString; parts: JArrayList; sentIntents: JArrayList; deliveryIntents: JArrayList); cdecl;//Deprecated
    procedure sendTextMessage(destinationAddress: JString; scAddress: JString; text: JString; sentIntent: JPendingIntent; deliveryIntent: JPendingIntent); cdecl;//Deprecated
  end;
  TJgsm_SmsManager = class(TJavaGenericImport<Jgsm_SmsManagerClass, Jgsm_SmsManager>) end;

  Jgsm_SmsMessageClass = interface(JObjectClass)
    ['{F5132C01-2558-4829-8125-7EACA7B45F08}']
    {class} function _GetENCODING_16BIT: Integer; cdecl;
    {class} function _GetENCODING_7BIT: Integer; cdecl;
    {class} function _GetENCODING_8BIT: Integer; cdecl;
    {class} function _GetENCODING_UNKNOWN: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_BYTES: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_SEPTETS: Integer; cdecl;
    {class} function _GetMAX_USER_DATA_SEPTETS_WITH_HEADER: Integer; cdecl;
    {class} function init: Jgsm_SmsMessage; cdecl;//Deprecated
    {class} function calculateLength(messageBody: JCharSequence; use7bitOnly: Boolean): TJavaArray<Integer>; cdecl; overload;//Deprecated
    {class} function calculateLength(messageBody: JString; use7bitOnly: Boolean): TJavaArray<Integer>; cdecl; overload;//Deprecated
    {class} function createFromPdu(pdu: TJavaArray<Byte>): Jgsm_SmsMessage; cdecl;//Deprecated
    {class} function getSubmitPdu(scAddress: JString; destinationAddress: JString; message: JString; statusReportRequested: Boolean): Jgsm_SmsMessage_SubmitPdu; cdecl; overload;//Deprecated
    {class} function getSubmitPdu(scAddress: JString; destinationAddress: JString; destinationPort: SmallInt; data: TJavaArray<Byte>; statusReportRequested: Boolean): Jgsm_SmsMessage_SubmitPdu; cdecl; overload;//Deprecated
    {class} function getTPLayerLengthForPDU(pdu: JString): Integer; cdecl;//Deprecated
    {class} property ENCODING_16BIT: Integer read _GetENCODING_16BIT;
    {class} property ENCODING_7BIT: Integer read _GetENCODING_7BIT;
    {class} property ENCODING_8BIT: Integer read _GetENCODING_8BIT;
    {class} property ENCODING_UNKNOWN: Integer read _GetENCODING_UNKNOWN;
    {class} property MAX_USER_DATA_BYTES: Integer read _GetMAX_USER_DATA_BYTES;
    {class} property MAX_USER_DATA_SEPTETS: Integer read _GetMAX_USER_DATA_SEPTETS;
    {class} property MAX_USER_DATA_SEPTETS_WITH_HEADER: Integer read _GetMAX_USER_DATA_SEPTETS_WITH_HEADER;
  end;

  [JavaSignature('android/telephony/gsm/SmsMessage')]
  Jgsm_SmsMessage = interface(JObject)
    ['{71AD7E64-87CA-4EC5-BB5B-91DCB9A3F8D5}']
    function getDisplayMessageBody: JString; cdecl;//Deprecated
    function getDisplayOriginatingAddress: JString; cdecl;//Deprecated
    function getEmailBody: JString; cdecl;//Deprecated
    function getEmailFrom: JString; cdecl;//Deprecated
    function getIndexOnSim: Integer; cdecl;//Deprecated
    function getMessageBody: JString; cdecl;//Deprecated
    function getMessageClass: Jgsm_SmsMessage_MessageClass; cdecl;//Deprecated
    function getOriginatingAddress: JString; cdecl;//Deprecated
    function getPdu: TJavaArray<Byte>; cdecl;//Deprecated
    function getProtocolIdentifier: Integer; cdecl;//Deprecated
    function getPseudoSubject: JString; cdecl;//Deprecated
    function getServiceCenterAddress: JString; cdecl;//Deprecated
    function getStatus: Integer; cdecl;//Deprecated
    function getStatusOnSim: Integer; cdecl;//Deprecated
    function getTimestampMillis: Int64; cdecl;//Deprecated
    function getUserData: TJavaArray<Byte>; cdecl;//Deprecated
    function isCphsMwiMessage: Boolean; cdecl;//Deprecated
    function isEmail: Boolean; cdecl;//Deprecated
    function isMWIClearMessage: Boolean; cdecl;//Deprecated
    function isMWISetMessage: Boolean; cdecl;//Deprecated
    function isMwiDontStore: Boolean; cdecl;//Deprecated
    function isReplace: Boolean; cdecl;//Deprecated
    function isReplyPathPresent: Boolean; cdecl;//Deprecated
    function isStatusReportMessage: Boolean; cdecl;//Deprecated
  end;
  TJgsm_SmsMessage = class(TJavaGenericImport<Jgsm_SmsMessageClass, Jgsm_SmsMessage>) end;

  Jgsm_SmsMessage_MessageClassClass = interface(JEnumClass)
    ['{39AF35BE-04BA-4BA5-815F-EAF9192F6413}']
    {class} function _GetCLASS_0: Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_1: Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_2: Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function _GetCLASS_3: Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function _GetUNKNOWN: Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function valueOf(name: JString): Jgsm_SmsMessage_MessageClass; cdecl;
    {class} function values: TJavaObjectArray<Jgsm_SmsMessage_MessageClass>; cdecl;
    {class} property CLASS_0: Jgsm_SmsMessage_MessageClass read _GetCLASS_0;
    {class} property CLASS_1: Jgsm_SmsMessage_MessageClass read _GetCLASS_1;
    {class} property CLASS_2: Jgsm_SmsMessage_MessageClass read _GetCLASS_2;
    {class} property CLASS_3: Jgsm_SmsMessage_MessageClass read _GetCLASS_3;
    {class} property UNKNOWN: Jgsm_SmsMessage_MessageClass read _GetUNKNOWN;
  end;

  [JavaSignature('android/telephony/gsm/SmsMessage$MessageClass')]
  Jgsm_SmsMessage_MessageClass = interface(JEnum)
    ['{2A8F0F0C-A782-40C9-A015-DEB6470488E3}']
  end;
  TJgsm_SmsMessage_MessageClass = class(TJavaGenericImport<Jgsm_SmsMessage_MessageClassClass, Jgsm_SmsMessage_MessageClass>) end;

  Jgsm_SmsMessage_SubmitPduClass = interface(JObjectClass)
    ['{1F8AD068-26C6-4018-AC53-2568912E18AC}']
    {class} function init: Jgsm_SmsMessage_SubmitPdu; cdecl;//Deprecated
  end;

  [JavaSignature('android/telephony/gsm/SmsMessage$SubmitPdu')]
  Jgsm_SmsMessage_SubmitPdu = interface(JObject)
    ['{F5357F33-764B-4656-9332-78162CB99DEF}']
    function _GetencodedMessage: TJavaArray<Byte>; cdecl;
    procedure _SetencodedMessage(Value: TJavaArray<Byte>); cdecl;
    function _GetencodedScAddress: TJavaArray<Byte>; cdecl;
    procedure _SetencodedScAddress(Value: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;//Deprecated
    property encodedMessage: TJavaArray<Byte> read _GetencodedMessage write _SetencodedMessage;
    property encodedScAddress: TJavaArray<Byte> read _GetencodedScAddress write _SetencodedScAddress;
  end;
  TJgsm_SmsMessage_SubmitPdu = class(TJavaGenericImport<Jgsm_SmsMessage_SubmitPduClass, Jgsm_SmsMessage_SubmitPdu>) end;

  JImsExceptionClass = interface(JExceptionClass)
    ['{A49270B0-C6E4-4E00-B261-E2451628A756}']
    {class} function _GetCODE_ERROR_INVALID_SUBSCRIPTION: Integer; cdecl;
    {class} function _GetCODE_ERROR_SERVICE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_ERROR_UNSPECIFIED: Integer; cdecl;
    {class} function _GetCODE_ERROR_UNSUPPORTED_OPERATION: Integer; cdecl;
    {class} property CODE_ERROR_INVALID_SUBSCRIPTION: Integer read _GetCODE_ERROR_INVALID_SUBSCRIPTION;
    {class} property CODE_ERROR_SERVICE_UNAVAILABLE: Integer read _GetCODE_ERROR_SERVICE_UNAVAILABLE;
    {class} property CODE_ERROR_UNSPECIFIED: Integer read _GetCODE_ERROR_UNSPECIFIED;
    {class} property CODE_ERROR_UNSUPPORTED_OPERATION: Integer read _GetCODE_ERROR_UNSUPPORTED_OPERATION;
  end;

  [JavaSignature('android/telephony/ims/ImsException')]
  JImsException = interface(JException)
    ['{06F38C2B-8C39-4F6E-A590-9055862DB910}']
    function getCode: Integer; cdecl;
  end;
  TJImsException = class(TJavaGenericImport<JImsExceptionClass, JImsException>) end;

  JImsManagerClass = interface(JObjectClass)
    ['{5F8C840D-2F2C-461A-B93E-2D3A58854F5E}']
    {class} function _GetACTION_WFC_IMS_REGISTRATION_ERROR: JString; cdecl;
    {class} function _GetEXTRA_WFC_REGISTRATION_FAILURE_MESSAGE: JString; cdecl;
    {class} function _GetEXTRA_WFC_REGISTRATION_FAILURE_TITLE: JString; cdecl;
    {class} property ACTION_WFC_IMS_REGISTRATION_ERROR: JString read _GetACTION_WFC_IMS_REGISTRATION_ERROR;
    {class} property EXTRA_WFC_REGISTRATION_FAILURE_MESSAGE: JString read _GetEXTRA_WFC_REGISTRATION_FAILURE_MESSAGE;
    {class} property EXTRA_WFC_REGISTRATION_FAILURE_TITLE: JString read _GetEXTRA_WFC_REGISTRATION_FAILURE_TITLE;
  end;

  [JavaSignature('android/telephony/ims/ImsManager')]
  JImsManager = interface(JObject)
    ['{5A04F154-A011-4326-8B40-14EA70837AE8}']
    function getImsMmTelManager(subscriptionId: Integer): JImsMmTelManager; cdecl;
    function getImsRcsManager(subscriptionId: Integer): JImsRcsManager; cdecl;
    function getProvisioningManager(subscriptionId: Integer): JProvisioningManager; cdecl;
  end;
  TJImsManager = class(TJavaGenericImport<JImsManagerClass, JImsManager>) end;

  JImsMmTelManagerClass = interface(JObjectClass)
    ['{601268F3-B3BF-401D-9904-03C75133F79A}']
    {class} function _GetWIFI_MODE_CELLULAR_PREFERRED: Integer; cdecl;
    {class} function _GetWIFI_MODE_WIFI_ONLY: Integer; cdecl;
    {class} function _GetWIFI_MODE_WIFI_PREFERRED: Integer; cdecl;
    {class} property WIFI_MODE_CELLULAR_PREFERRED: Integer read _GetWIFI_MODE_CELLULAR_PREFERRED;
    {class} property WIFI_MODE_WIFI_ONLY: Integer read _GetWIFI_MODE_WIFI_ONLY;
    {class} property WIFI_MODE_WIFI_PREFERRED: Integer read _GetWIFI_MODE_WIFI_PREFERRED;
  end;

  [JavaSignature('android/telephony/ims/ImsMmTelManager')]
  JImsMmTelManager = interface(JObject)
    ['{EDD09E91-606C-4768-9EA0-6EB904A59CDB}']
    procedure getRegistrationTransportType(executor: JExecutor; transportTypeCallback: JConsumer); cdecl;
    function getVoWiFiModeSetting: Integer; cdecl;
    function isAdvancedCallingSettingEnabled: Boolean; cdecl;
    function isCrossSimCallingEnabled: Boolean; cdecl;
    function isTtyOverVolteEnabled: Boolean; cdecl;
    function isVoWiFiRoamingSettingEnabled: Boolean; cdecl;
    function isVoWiFiSettingEnabled: Boolean; cdecl;
    function isVtSettingEnabled: Boolean; cdecl;
    procedure registerImsRegistrationCallback(executor: JExecutor; c: JRegistrationManager_RegistrationCallback); cdecl;
    procedure registerImsStateCallback(executor: JExecutor; callback: JImsStateCallback); cdecl;
    procedure registerMmTelCapabilityCallback(executor: JExecutor; c: JImsMmTelManager_CapabilityCallback); cdecl;
    procedure unregisterImsRegistrationCallback(c: JRegistrationManager_RegistrationCallback); cdecl;
    procedure unregisterImsStateCallback(callback: JImsStateCallback); cdecl;
    procedure unregisterMmTelCapabilityCallback(c: JImsMmTelManager_CapabilityCallback); cdecl;
  end;
  TJImsMmTelManager = class(TJavaGenericImport<JImsMmTelManagerClass, JImsMmTelManager>) end;

  JImsMmTelManager_CapabilityCallbackClass = interface(JObjectClass)
    ['{B658617A-498F-4A0C-9F7C-ABD9748512E7}']
    {class} function init: JImsMmTelManager_CapabilityCallback; cdecl;
  end;

  [JavaSignature('android/telephony/ims/ImsMmTelManager$CapabilityCallback')]
  JImsMmTelManager_CapabilityCallback = interface(JObject)
    ['{8E50B67A-2BCB-4192-AB43-660BFABCBCA0}']
    procedure onCapabilitiesStatusChanged(capabilities: JMmTelFeature_MmTelCapabilities); cdecl;
  end;
  TJImsMmTelManager_CapabilityCallback = class(TJavaGenericImport<JImsMmTelManager_CapabilityCallbackClass, JImsMmTelManager_CapabilityCallback>) end;

  JImsRcsManagerClass = interface(JObjectClass)
    ['{0B6A28C5-94B3-4737-9F64-EBE01F6BEC8C}']
    {class} function _GetACTION_SHOW_CAPABILITY_DISCOVERY_OPT_IN: JString; cdecl;
    {class} function _GetCAPABILITY_TYPE_NONE: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_OPTIONS_UCE: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_PRESENCE_UCE: Integer; cdecl;
    {class} property ACTION_SHOW_CAPABILITY_DISCOVERY_OPT_IN: JString read _GetACTION_SHOW_CAPABILITY_DISCOVERY_OPT_IN;
    {class} property CAPABILITY_TYPE_NONE: Integer read _GetCAPABILITY_TYPE_NONE;
    {class} property CAPABILITY_TYPE_OPTIONS_UCE: Integer read _GetCAPABILITY_TYPE_OPTIONS_UCE;
    {class} property CAPABILITY_TYPE_PRESENCE_UCE: Integer read _GetCAPABILITY_TYPE_PRESENCE_UCE;
  end;

  [JavaSignature('android/telephony/ims/ImsRcsManager')]
  JImsRcsManager = interface(JObject)
    ['{6BED5D0F-62DB-47CC-806C-5A21FF9F3CD3}']
    procedure getRegistrationState(executor: JExecutor; stateCallback: JConsumer); cdecl;
    procedure getRegistrationTransportType(executor: JExecutor; transportTypeCallback: JConsumer); cdecl;
    function getUceAdapter: JRcsUceAdapter; cdecl;
    procedure registerImsRegistrationCallback(executor: JExecutor; c: JRegistrationManager_RegistrationCallback); cdecl;
    procedure registerImsStateCallback(executor: JExecutor; callback: JImsStateCallback); cdecl;
    procedure unregisterImsRegistrationCallback(c: JRegistrationManager_RegistrationCallback); cdecl;
    procedure unregisterImsStateCallback(callback: JImsStateCallback); cdecl;
  end;
  TJImsRcsManager = class(TJavaGenericImport<JImsRcsManagerClass, JImsRcsManager>) end;

  JImsReasonInfoClass = interface(JObjectClass)
    ['{565D7AD9-E767-4107-B080-7CE3118E2306}']
    {class} function _GetCODE_ACCESS_CLASS_BLOCKED: Integer; cdecl;
    {class} function _GetCODE_ANSWERED_ELSEWHERE: Integer; cdecl;
    {class} function _GetCODE_BLACKLISTED_CALL_ID: Integer; cdecl;
    {class} function _GetCODE_CALL_BARRED: Integer; cdecl;
    {class} function _GetCODE_CALL_DROP_IWLAN_TO_LTE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_CALL_END_CAUSE_CALL_PULL: Integer; cdecl;
    {class} function _GetCODE_CALL_PULL_OUT_OF_SYNC: Integer; cdecl;
    {class} function _GetCODE_DATA_DISABLED: Integer; cdecl;
    {class} function _GetCODE_DATA_LIMIT_REACHED: Integer; cdecl;
    {class} function _GetCODE_DIAL_MODIFIED_TO_DIAL: Integer; cdecl;
    {class} function _GetCODE_DIAL_MODIFIED_TO_DIAL_VIDEO: Integer; cdecl;
    {class} function _GetCODE_DIAL_MODIFIED_TO_SS: Integer; cdecl;
    {class} function _GetCODE_DIAL_MODIFIED_TO_USSD: Integer; cdecl;
    {class} function _GetCODE_DIAL_VIDEO_MODIFIED_TO_DIAL: Integer; cdecl;
    {class} function _GetCODE_DIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO: Integer; cdecl;
    {class} function _GetCODE_DIAL_VIDEO_MODIFIED_TO_SS: Integer; cdecl;
    {class} function _GetCODE_DIAL_VIDEO_MODIFIED_TO_USSD: Integer; cdecl;
    {class} function _GetCODE_ECBM_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetCODE_EMERGENCY_PERM_FAILURE: Integer; cdecl;
    {class} function _GetCODE_EMERGENCY_TEMP_FAILURE: Integer; cdecl;
    {class} function _GetCODE_EPDG_TUNNEL_ESTABLISH_FAILURE: Integer; cdecl;
    {class} function _GetCODE_EPDG_TUNNEL_LOST_CONNECTION: Integer; cdecl;
    {class} function _GetCODE_EPDG_TUNNEL_REKEY_FAILURE: Integer; cdecl;
    {class} function _GetCODE_FDN_BLOCKED: Integer; cdecl;
    {class} function _GetCODE_IKEV2_AUTH_FAILURE: Integer; cdecl;
    {class} function _GetCODE_IMEI_NOT_ACCEPTED: Integer; cdecl;
    {class} function _GetCODE_IWLAN_DPD_FAILURE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_BUSY: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_CS_RETRY_REQUIRED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_DECLINE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_EXCEEDED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_RESOURCE_RESERVATION_FAILED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_TERMINATED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_VCC_ON_PROGRESSING: Integer; cdecl;
    {class} function _GetCODE_LOCAL_CALL_VOLTE_RETRY_REQUIRED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_ENDED_BY_CONFERENCE_MERGE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_HO_NOT_FEASIBLE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_ILLEGAL_ARGUMENT: Integer; cdecl;
    {class} function _GetCODE_LOCAL_ILLEGAL_STATE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_IMS_SERVICE_DOWN: Integer; cdecl;
    {class} function _GetCODE_LOCAL_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetCODE_LOCAL_LOW_BATTERY: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NETWORK_IP_CHANGED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NETWORK_NO_LTE_COVERAGE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NETWORK_NO_SERVICE: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NETWORK_ROAMING: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NOT_REGISTERED: Integer; cdecl;
    {class} function _GetCODE_LOCAL_NO_PENDING_CALL: Integer; cdecl;
    {class} function _GetCODE_LOCAL_POWER_OFF: Integer; cdecl;
    {class} function _GetCODE_LOCAL_SERVICE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_LOW_BATTERY: Integer; cdecl;
    {class} function _GetCODE_MAXIMUM_NUMBER_OF_CALLS_REACHED: Integer; cdecl;
    {class} function _GetCODE_MEDIA_INIT_FAILED: Integer; cdecl;
    {class} function _GetCODE_MEDIA_NOT_ACCEPTABLE: Integer; cdecl;
    {class} function _GetCODE_MEDIA_NO_DATA: Integer; cdecl;
    {class} function _GetCODE_MEDIA_UNSPECIFIED: Integer; cdecl;
    {class} function _GetCODE_MULTIENDPOINT_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetCODE_NETWORK_CONGESTION: Integer; cdecl;
    {class} function _GetCODE_NETWORK_DETACH: Integer; cdecl;
    {class} function _GetCODE_NETWORK_REJECT: Integer; cdecl;
    {class} function _GetCODE_NETWORK_RESP_TIMEOUT: Integer; cdecl;
    {class} function _GetCODE_NO_CSFB_IN_CS_ROAM: Integer; cdecl;
    {class} function _GetCODE_NO_VALID_SIM: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_1: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_10: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_11: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_12: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_13: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_14: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_15: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_2: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_3: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_4: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_5: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_6: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_7: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_8: Integer; cdecl;
    {class} function _GetCODE_OEM_CAUSE_9: Integer; cdecl;
    {class} function _GetCODE_RADIO_ACCESS_FAILURE: Integer; cdecl;
    {class} function _GetCODE_RADIO_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetCODE_RADIO_LINK_FAILURE: Integer; cdecl;
    {class} function _GetCODE_RADIO_LINK_LOST: Integer; cdecl;
    {class} function _GetCODE_RADIO_OFF: Integer; cdecl;
    {class} function _GetCODE_RADIO_RELEASE_ABNORMAL: Integer; cdecl;
    {class} function _GetCODE_RADIO_RELEASE_NORMAL: Integer; cdecl;
    {class} function _GetCODE_RADIO_SETUP_FAILURE: Integer; cdecl;
    {class} function _GetCODE_RADIO_UPLINK_FAILURE: Integer; cdecl;
    {class} function _GetCODE_REGISTRATION_ERROR: Integer; cdecl;
    {class} function _GetCODE_REJECTED_ELSEWHERE: Integer; cdecl;
    {class} function _GetCODE_REJECT_1X_COLLISION: Integer; cdecl;
    {class} function _GetCODE_REJECT_CALL_ON_OTHER_SUB: Integer; cdecl;
    {class} function _GetCODE_REJECT_CALL_TYPE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_REJECT_CONFERENCE_TTY_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_REJECT_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetCODE_REJECT_MAX_CALL_LIMIT_REACHED: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CALL_SETUP: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CALL_TRANSFER: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CALL_UPGRADE: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CALL_WAITING_DISABLED: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CONFERENCE_CALL: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_CS_CALL: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_E911_CALL: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_ENCRYPTED_CALL: Integer; cdecl;
    {class} function _GetCODE_REJECT_ONGOING_HANDOVER: Integer; cdecl;
    {class} function _GetCODE_REJECT_QOS_FAILURE: Integer; cdecl;
    {class} function _GetCODE_REJECT_SERVICE_NOT_REGISTERED: Integer; cdecl;
    {class} function _GetCODE_REJECT_UNKNOWN: Integer; cdecl;
    {class} function _GetCODE_REJECT_UNSUPPORTED_SDP_HEADERS: Integer; cdecl;
    {class} function _GetCODE_REJECT_UNSUPPORTED_SIP_HEADERS: Integer; cdecl;
    {class} function _GetCODE_REJECT_VT_AVPF_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_REJECT_VT_TTY_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_REMOTE_CALL_DECLINE: Integer; cdecl;
    {class} function _GetCODE_SESSION_MODIFICATION_FAILED: Integer; cdecl;
    {class} function _GetCODE_SIP_ALTERNATE_EMERGENCY_CALL: Integer; cdecl;
    {class} function _GetCODE_SIP_AMBIGUOUS: Integer; cdecl;
    {class} function _GetCODE_SIP_BAD_ADDRESS: Integer; cdecl;
    {class} function _GetCODE_SIP_BAD_REQUEST: Integer; cdecl;
    {class} function _GetCODE_SIP_BUSY: Integer; cdecl;
    {class} function _GetCODE_SIP_CALL_OR_TRANS_DOES_NOT_EXIST: Integer; cdecl;
    {class} function _GetCODE_SIP_CLIENT_ERROR: Integer; cdecl;
    {class} function _GetCODE_SIP_EXTENSION_REQUIRED: Integer; cdecl;
    {class} function _GetCODE_SIP_FORBIDDEN: Integer; cdecl;
    {class} function _GetCODE_SIP_GLOBAL_ERROR: Integer; cdecl;
    {class} function _GetCODE_SIP_INTERVAL_TOO_BRIEF: Integer; cdecl;
    {class} function _GetCODE_SIP_LOOP_DETECTED: Integer; cdecl;
    {class} function _GetCODE_SIP_METHOD_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_SIP_NOT_ACCEPTABLE: Integer; cdecl;
    {class} function _GetCODE_SIP_NOT_FOUND: Integer; cdecl;
    {class} function _GetCODE_SIP_NOT_REACHABLE: Integer; cdecl;
    {class} function _GetCODE_SIP_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetCODE_SIP_PROXY_AUTHENTICATION_REQUIRED: Integer; cdecl;
    {class} function _GetCODE_SIP_REDIRECTED: Integer; cdecl;
    {class} function _GetCODE_SIP_REQUEST_CANCELLED: Integer; cdecl;
    {class} function _GetCODE_SIP_REQUEST_ENTITY_TOO_LARGE: Integer; cdecl;
    {class} function _GetCODE_SIP_REQUEST_PENDING: Integer; cdecl;
    {class} function _GetCODE_SIP_REQUEST_TIMEOUT: Integer; cdecl;
    {class} function _GetCODE_SIP_REQUEST_URI_TOO_LARGE: Integer; cdecl;
    {class} function _GetCODE_SIP_SERVER_ERROR: Integer; cdecl;
    {class} function _GetCODE_SIP_SERVER_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetCODE_SIP_SERVER_TIMEOUT: Integer; cdecl;
    {class} function _GetCODE_SIP_SERVICE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_SIP_TEMPRARILY_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_SIP_TOO_MANY_HOPS: Integer; cdecl;
    {class} function _GetCODE_SIP_TRANSACTION_DOES_NOT_EXIST: Integer; cdecl;
    {class} function _GetCODE_SIP_UNDECIPHERABLE: Integer; cdecl;
    {class} function _GetCODE_SIP_USER_MARKED_UNWANTED: Integer; cdecl;
    {class} function _GetCODE_SIP_USER_REJECTED: Integer; cdecl;
    {class} function _GetCODE_SUPP_SVC_CANCELLED: Integer; cdecl;
    {class} function _GetCODE_SUPP_SVC_FAILED: Integer; cdecl;
    {class} function _GetCODE_SUPP_SVC_REINVITE_COLLISION: Integer; cdecl;
    {class} function _GetCODE_TIMEOUT_1XX_WAITING: Integer; cdecl;
    {class} function _GetCODE_TIMEOUT_NO_ANSWER: Integer; cdecl;
    {class} function _GetCODE_TIMEOUT_NO_ANSWER_CALL_UPDATE: Integer; cdecl;
    {class} function _GetCODE_UNSPECIFIED: Integer; cdecl;
    {class} function _GetCODE_USER_CANCELLED_SESSION_MODIFICATION: Integer; cdecl;
    {class} function _GetCODE_USER_DECLINE: Integer; cdecl;
    {class} function _GetCODE_USER_IGNORE: Integer; cdecl;
    {class} function _GetCODE_USER_NOANSWER: Integer; cdecl;
    {class} function _GetCODE_USER_REJECTED_SESSION_MODIFICATION: Integer; cdecl;
    {class} function _GetCODE_USER_TERMINATED: Integer; cdecl;
    {class} function _GetCODE_USER_TERMINATED_BY_REMOTE: Integer; cdecl;
    {class} function _GetCODE_UT_CB_PASSWORD_MISMATCH: Integer; cdecl;
    {class} function _GetCODE_UT_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetCODE_UT_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetCODE_UT_OPERATION_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetCODE_UT_SERVICE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCODE_UT_SS_MODIFIED_TO_DIAL: Integer; cdecl;
    {class} function _GetCODE_UT_SS_MODIFIED_TO_DIAL_VIDEO: Integer; cdecl;
    {class} function _GetCODE_UT_SS_MODIFIED_TO_SS: Integer; cdecl;
    {class} function _GetCODE_UT_SS_MODIFIED_TO_USSD: Integer; cdecl;
    {class} function _GetCODE_WIFI_LOST: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_CODE_CALL_RETRY_BY_SETTINGS: Integer; cdecl;
    {class} function _GetEXTRA_CODE_CALL_RETRY_EMERGENCY: Integer; cdecl;
    {class} function _GetEXTRA_CODE_CALL_RETRY_NORMAL: Integer; cdecl;
    {class} function _GetEXTRA_CODE_CALL_RETRY_SILENT_REDIAL: Integer; cdecl;
    {class} function init(code: Integer; extraCode: Integer; extraMessage: JString): JImsReasonInfo; cdecl;
    {class} property CODE_ACCESS_CLASS_BLOCKED: Integer read _GetCODE_ACCESS_CLASS_BLOCKED;
    {class} property CODE_ANSWERED_ELSEWHERE: Integer read _GetCODE_ANSWERED_ELSEWHERE;
    {class} property CODE_BLACKLISTED_CALL_ID: Integer read _GetCODE_BLACKLISTED_CALL_ID;
    {class} property CODE_CALL_BARRED: Integer read _GetCODE_CALL_BARRED;
    {class} property CODE_CALL_DROP_IWLAN_TO_LTE_UNAVAILABLE: Integer read _GetCODE_CALL_DROP_IWLAN_TO_LTE_UNAVAILABLE;
    {class} property CODE_CALL_END_CAUSE_CALL_PULL: Integer read _GetCODE_CALL_END_CAUSE_CALL_PULL;
    {class} property CODE_CALL_PULL_OUT_OF_SYNC: Integer read _GetCODE_CALL_PULL_OUT_OF_SYNC;
    {class} property CODE_DATA_DISABLED: Integer read _GetCODE_DATA_DISABLED;
    {class} property CODE_DATA_LIMIT_REACHED: Integer read _GetCODE_DATA_LIMIT_REACHED;
    {class} property CODE_DIAL_MODIFIED_TO_DIAL: Integer read _GetCODE_DIAL_MODIFIED_TO_DIAL;
    {class} property CODE_DIAL_MODIFIED_TO_DIAL_VIDEO: Integer read _GetCODE_DIAL_MODIFIED_TO_DIAL_VIDEO;
    {class} property CODE_DIAL_MODIFIED_TO_SS: Integer read _GetCODE_DIAL_MODIFIED_TO_SS;
    {class} property CODE_DIAL_MODIFIED_TO_USSD: Integer read _GetCODE_DIAL_MODIFIED_TO_USSD;
    {class} property CODE_DIAL_VIDEO_MODIFIED_TO_DIAL: Integer read _GetCODE_DIAL_VIDEO_MODIFIED_TO_DIAL;
    {class} property CODE_DIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO: Integer read _GetCODE_DIAL_VIDEO_MODIFIED_TO_DIAL_VIDEO;
    {class} property CODE_DIAL_VIDEO_MODIFIED_TO_SS: Integer read _GetCODE_DIAL_VIDEO_MODIFIED_TO_SS;
    {class} property CODE_DIAL_VIDEO_MODIFIED_TO_USSD: Integer read _GetCODE_DIAL_VIDEO_MODIFIED_TO_USSD;
    {class} property CODE_ECBM_NOT_SUPPORTED: Integer read _GetCODE_ECBM_NOT_SUPPORTED;
    {class} property CODE_EMERGENCY_PERM_FAILURE: Integer read _GetCODE_EMERGENCY_PERM_FAILURE;
    {class} property CODE_EMERGENCY_TEMP_FAILURE: Integer read _GetCODE_EMERGENCY_TEMP_FAILURE;
    {class} property CODE_EPDG_TUNNEL_ESTABLISH_FAILURE: Integer read _GetCODE_EPDG_TUNNEL_ESTABLISH_FAILURE;
    {class} property CODE_EPDG_TUNNEL_LOST_CONNECTION: Integer read _GetCODE_EPDG_TUNNEL_LOST_CONNECTION;
    {class} property CODE_EPDG_TUNNEL_REKEY_FAILURE: Integer read _GetCODE_EPDG_TUNNEL_REKEY_FAILURE;
    {class} property CODE_FDN_BLOCKED: Integer read _GetCODE_FDN_BLOCKED;
    {class} property CODE_IKEV2_AUTH_FAILURE: Integer read _GetCODE_IKEV2_AUTH_FAILURE;
    {class} property CODE_IMEI_NOT_ACCEPTED: Integer read _GetCODE_IMEI_NOT_ACCEPTED;
    {class} property CODE_IWLAN_DPD_FAILURE: Integer read _GetCODE_IWLAN_DPD_FAILURE;
    {class} property CODE_LOCAL_CALL_BUSY: Integer read _GetCODE_LOCAL_CALL_BUSY;
    {class} property CODE_LOCAL_CALL_CS_RETRY_REQUIRED: Integer read _GetCODE_LOCAL_CALL_CS_RETRY_REQUIRED;
    {class} property CODE_LOCAL_CALL_DECLINE: Integer read _GetCODE_LOCAL_CALL_DECLINE;
    {class} property CODE_LOCAL_CALL_EXCEEDED: Integer read _GetCODE_LOCAL_CALL_EXCEEDED;
    {class} property CODE_LOCAL_CALL_RESOURCE_RESERVATION_FAILED: Integer read _GetCODE_LOCAL_CALL_RESOURCE_RESERVATION_FAILED;
    {class} property CODE_LOCAL_CALL_TERMINATED: Integer read _GetCODE_LOCAL_CALL_TERMINATED;
    {class} property CODE_LOCAL_CALL_VCC_ON_PROGRESSING: Integer read _GetCODE_LOCAL_CALL_VCC_ON_PROGRESSING;
    {class} property CODE_LOCAL_CALL_VOLTE_RETRY_REQUIRED: Integer read _GetCODE_LOCAL_CALL_VOLTE_RETRY_REQUIRED;
    {class} property CODE_LOCAL_ENDED_BY_CONFERENCE_MERGE: Integer read _GetCODE_LOCAL_ENDED_BY_CONFERENCE_MERGE;
    {class} property CODE_LOCAL_HO_NOT_FEASIBLE: Integer read _GetCODE_LOCAL_HO_NOT_FEASIBLE;
    {class} property CODE_LOCAL_ILLEGAL_ARGUMENT: Integer read _GetCODE_LOCAL_ILLEGAL_ARGUMENT;
    {class} property CODE_LOCAL_ILLEGAL_STATE: Integer read _GetCODE_LOCAL_ILLEGAL_STATE;
    {class} property CODE_LOCAL_IMS_SERVICE_DOWN: Integer read _GetCODE_LOCAL_IMS_SERVICE_DOWN;
    {class} property CODE_LOCAL_INTERNAL_ERROR: Integer read _GetCODE_LOCAL_INTERNAL_ERROR;
    {class} property CODE_LOCAL_LOW_BATTERY: Integer read _GetCODE_LOCAL_LOW_BATTERY;
    {class} property CODE_LOCAL_NETWORK_IP_CHANGED: Integer read _GetCODE_LOCAL_NETWORK_IP_CHANGED;
    {class} property CODE_LOCAL_NETWORK_NO_LTE_COVERAGE: Integer read _GetCODE_LOCAL_NETWORK_NO_LTE_COVERAGE;
    {class} property CODE_LOCAL_NETWORK_NO_SERVICE: Integer read _GetCODE_LOCAL_NETWORK_NO_SERVICE;
    {class} property CODE_LOCAL_NETWORK_ROAMING: Integer read _GetCODE_LOCAL_NETWORK_ROAMING;
    {class} property CODE_LOCAL_NOT_REGISTERED: Integer read _GetCODE_LOCAL_NOT_REGISTERED;
    {class} property CODE_LOCAL_NO_PENDING_CALL: Integer read _GetCODE_LOCAL_NO_PENDING_CALL;
    {class} property CODE_LOCAL_POWER_OFF: Integer read _GetCODE_LOCAL_POWER_OFF;
    {class} property CODE_LOCAL_SERVICE_UNAVAILABLE: Integer read _GetCODE_LOCAL_SERVICE_UNAVAILABLE;
    {class} property CODE_LOW_BATTERY: Integer read _GetCODE_LOW_BATTERY;
    {class} property CODE_MAXIMUM_NUMBER_OF_CALLS_REACHED: Integer read _GetCODE_MAXIMUM_NUMBER_OF_CALLS_REACHED;
    {class} property CODE_MEDIA_INIT_FAILED: Integer read _GetCODE_MEDIA_INIT_FAILED;
    {class} property CODE_MEDIA_NOT_ACCEPTABLE: Integer read _GetCODE_MEDIA_NOT_ACCEPTABLE;
    {class} property CODE_MEDIA_NO_DATA: Integer read _GetCODE_MEDIA_NO_DATA;
    {class} property CODE_MEDIA_UNSPECIFIED: Integer read _GetCODE_MEDIA_UNSPECIFIED;
    {class} property CODE_MULTIENDPOINT_NOT_SUPPORTED: Integer read _GetCODE_MULTIENDPOINT_NOT_SUPPORTED;
    {class} property CODE_NETWORK_CONGESTION: Integer read _GetCODE_NETWORK_CONGESTION;
    {class} property CODE_NETWORK_DETACH: Integer read _GetCODE_NETWORK_DETACH;
    {class} property CODE_NETWORK_REJECT: Integer read _GetCODE_NETWORK_REJECT;
    {class} property CODE_NETWORK_RESP_TIMEOUT: Integer read _GetCODE_NETWORK_RESP_TIMEOUT;
    {class} property CODE_NO_CSFB_IN_CS_ROAM: Integer read _GetCODE_NO_CSFB_IN_CS_ROAM;
    {class} property CODE_NO_VALID_SIM: Integer read _GetCODE_NO_VALID_SIM;
    {class} property CODE_OEM_CAUSE_1: Integer read _GetCODE_OEM_CAUSE_1;
    {class} property CODE_OEM_CAUSE_10: Integer read _GetCODE_OEM_CAUSE_10;
    {class} property CODE_OEM_CAUSE_11: Integer read _GetCODE_OEM_CAUSE_11;
    {class} property CODE_OEM_CAUSE_12: Integer read _GetCODE_OEM_CAUSE_12;
    {class} property CODE_OEM_CAUSE_13: Integer read _GetCODE_OEM_CAUSE_13;
    {class} property CODE_OEM_CAUSE_14: Integer read _GetCODE_OEM_CAUSE_14;
    {class} property CODE_OEM_CAUSE_15: Integer read _GetCODE_OEM_CAUSE_15;
    {class} property CODE_OEM_CAUSE_2: Integer read _GetCODE_OEM_CAUSE_2;
    {class} property CODE_OEM_CAUSE_3: Integer read _GetCODE_OEM_CAUSE_3;
    {class} property CODE_OEM_CAUSE_4: Integer read _GetCODE_OEM_CAUSE_4;
    {class} property CODE_OEM_CAUSE_5: Integer read _GetCODE_OEM_CAUSE_5;
    {class} property CODE_OEM_CAUSE_6: Integer read _GetCODE_OEM_CAUSE_6;
    {class} property CODE_OEM_CAUSE_7: Integer read _GetCODE_OEM_CAUSE_7;
    {class} property CODE_OEM_CAUSE_8: Integer read _GetCODE_OEM_CAUSE_8;
    {class} property CODE_OEM_CAUSE_9: Integer read _GetCODE_OEM_CAUSE_9;
    {class} property CODE_RADIO_ACCESS_FAILURE: Integer read _GetCODE_RADIO_ACCESS_FAILURE;
    {class} property CODE_RADIO_INTERNAL_ERROR: Integer read _GetCODE_RADIO_INTERNAL_ERROR;
    {class} property CODE_RADIO_LINK_FAILURE: Integer read _GetCODE_RADIO_LINK_FAILURE;
    {class} property CODE_RADIO_LINK_LOST: Integer read _GetCODE_RADIO_LINK_LOST;
    {class} property CODE_RADIO_OFF: Integer read _GetCODE_RADIO_OFF;
    {class} property CODE_RADIO_RELEASE_ABNORMAL: Integer read _GetCODE_RADIO_RELEASE_ABNORMAL;
    {class} property CODE_RADIO_RELEASE_NORMAL: Integer read _GetCODE_RADIO_RELEASE_NORMAL;
    {class} property CODE_RADIO_SETUP_FAILURE: Integer read _GetCODE_RADIO_SETUP_FAILURE;
    {class} property CODE_RADIO_UPLINK_FAILURE: Integer read _GetCODE_RADIO_UPLINK_FAILURE;
    {class} property CODE_REGISTRATION_ERROR: Integer read _GetCODE_REGISTRATION_ERROR;
    {class} property CODE_REJECTED_ELSEWHERE: Integer read _GetCODE_REJECTED_ELSEWHERE;
    {class} property CODE_REJECT_1X_COLLISION: Integer read _GetCODE_REJECT_1X_COLLISION;
    {class} property CODE_REJECT_CALL_ON_OTHER_SUB: Integer read _GetCODE_REJECT_CALL_ON_OTHER_SUB;
    {class} property CODE_REJECT_CALL_TYPE_NOT_ALLOWED: Integer read _GetCODE_REJECT_CALL_TYPE_NOT_ALLOWED;
    {class} property CODE_REJECT_CONFERENCE_TTY_NOT_ALLOWED: Integer read _GetCODE_REJECT_CONFERENCE_TTY_NOT_ALLOWED;
    {class} property CODE_REJECT_INTERNAL_ERROR: Integer read _GetCODE_REJECT_INTERNAL_ERROR;
    {class} property CODE_REJECT_MAX_CALL_LIMIT_REACHED: Integer read _GetCODE_REJECT_MAX_CALL_LIMIT_REACHED;
    {class} property CODE_REJECT_ONGOING_CALL_SETUP: Integer read _GetCODE_REJECT_ONGOING_CALL_SETUP;
    {class} property CODE_REJECT_ONGOING_CALL_TRANSFER: Integer read _GetCODE_REJECT_ONGOING_CALL_TRANSFER;
    {class} property CODE_REJECT_ONGOING_CALL_UPGRADE: Integer read _GetCODE_REJECT_ONGOING_CALL_UPGRADE;
    {class} property CODE_REJECT_ONGOING_CALL_WAITING_DISABLED: Integer read _GetCODE_REJECT_ONGOING_CALL_WAITING_DISABLED;
    {class} property CODE_REJECT_ONGOING_CONFERENCE_CALL: Integer read _GetCODE_REJECT_ONGOING_CONFERENCE_CALL;
    {class} property CODE_REJECT_ONGOING_CS_CALL: Integer read _GetCODE_REJECT_ONGOING_CS_CALL;
    {class} property CODE_REJECT_ONGOING_E911_CALL: Integer read _GetCODE_REJECT_ONGOING_E911_CALL;
    {class} property CODE_REJECT_ONGOING_ENCRYPTED_CALL: Integer read _GetCODE_REJECT_ONGOING_ENCRYPTED_CALL;
    {class} property CODE_REJECT_ONGOING_HANDOVER: Integer read _GetCODE_REJECT_ONGOING_HANDOVER;
    {class} property CODE_REJECT_QOS_FAILURE: Integer read _GetCODE_REJECT_QOS_FAILURE;
    {class} property CODE_REJECT_SERVICE_NOT_REGISTERED: Integer read _GetCODE_REJECT_SERVICE_NOT_REGISTERED;
    {class} property CODE_REJECT_UNKNOWN: Integer read _GetCODE_REJECT_UNKNOWN;
    {class} property CODE_REJECT_UNSUPPORTED_SDP_HEADERS: Integer read _GetCODE_REJECT_UNSUPPORTED_SDP_HEADERS;
    {class} property CODE_REJECT_UNSUPPORTED_SIP_HEADERS: Integer read _GetCODE_REJECT_UNSUPPORTED_SIP_HEADERS;
    {class} property CODE_REJECT_VT_AVPF_NOT_ALLOWED: Integer read _GetCODE_REJECT_VT_AVPF_NOT_ALLOWED;
    {class} property CODE_REJECT_VT_TTY_NOT_ALLOWED: Integer read _GetCODE_REJECT_VT_TTY_NOT_ALLOWED;
    {class} property CODE_REMOTE_CALL_DECLINE: Integer read _GetCODE_REMOTE_CALL_DECLINE;
    {class} property CODE_SESSION_MODIFICATION_FAILED: Integer read _GetCODE_SESSION_MODIFICATION_FAILED;
    {class} property CODE_SIP_ALTERNATE_EMERGENCY_CALL: Integer read _GetCODE_SIP_ALTERNATE_EMERGENCY_CALL;
    {class} property CODE_SIP_AMBIGUOUS: Integer read _GetCODE_SIP_AMBIGUOUS;
    {class} property CODE_SIP_BAD_ADDRESS: Integer read _GetCODE_SIP_BAD_ADDRESS;
    {class} property CODE_SIP_BAD_REQUEST: Integer read _GetCODE_SIP_BAD_REQUEST;
    {class} property CODE_SIP_BUSY: Integer read _GetCODE_SIP_BUSY;
    {class} property CODE_SIP_CALL_OR_TRANS_DOES_NOT_EXIST: Integer read _GetCODE_SIP_CALL_OR_TRANS_DOES_NOT_EXIST;
    {class} property CODE_SIP_CLIENT_ERROR: Integer read _GetCODE_SIP_CLIENT_ERROR;
    {class} property CODE_SIP_EXTENSION_REQUIRED: Integer read _GetCODE_SIP_EXTENSION_REQUIRED;
    {class} property CODE_SIP_FORBIDDEN: Integer read _GetCODE_SIP_FORBIDDEN;
    {class} property CODE_SIP_GLOBAL_ERROR: Integer read _GetCODE_SIP_GLOBAL_ERROR;
    {class} property CODE_SIP_INTERVAL_TOO_BRIEF: Integer read _GetCODE_SIP_INTERVAL_TOO_BRIEF;
    {class} property CODE_SIP_LOOP_DETECTED: Integer read _GetCODE_SIP_LOOP_DETECTED;
    {class} property CODE_SIP_METHOD_NOT_ALLOWED: Integer read _GetCODE_SIP_METHOD_NOT_ALLOWED;
    {class} property CODE_SIP_NOT_ACCEPTABLE: Integer read _GetCODE_SIP_NOT_ACCEPTABLE;
    {class} property CODE_SIP_NOT_FOUND: Integer read _GetCODE_SIP_NOT_FOUND;
    {class} property CODE_SIP_NOT_REACHABLE: Integer read _GetCODE_SIP_NOT_REACHABLE;
    {class} property CODE_SIP_NOT_SUPPORTED: Integer read _GetCODE_SIP_NOT_SUPPORTED;
    {class} property CODE_SIP_PROXY_AUTHENTICATION_REQUIRED: Integer read _GetCODE_SIP_PROXY_AUTHENTICATION_REQUIRED;
    {class} property CODE_SIP_REDIRECTED: Integer read _GetCODE_SIP_REDIRECTED;
    {class} property CODE_SIP_REQUEST_CANCELLED: Integer read _GetCODE_SIP_REQUEST_CANCELLED;
    {class} property CODE_SIP_REQUEST_ENTITY_TOO_LARGE: Integer read _GetCODE_SIP_REQUEST_ENTITY_TOO_LARGE;
    {class} property CODE_SIP_REQUEST_PENDING: Integer read _GetCODE_SIP_REQUEST_PENDING;
    {class} property CODE_SIP_REQUEST_TIMEOUT: Integer read _GetCODE_SIP_REQUEST_TIMEOUT;
    {class} property CODE_SIP_REQUEST_URI_TOO_LARGE: Integer read _GetCODE_SIP_REQUEST_URI_TOO_LARGE;
    {class} property CODE_SIP_SERVER_ERROR: Integer read _GetCODE_SIP_SERVER_ERROR;
    {class} property CODE_SIP_SERVER_INTERNAL_ERROR: Integer read _GetCODE_SIP_SERVER_INTERNAL_ERROR;
    {class} property CODE_SIP_SERVER_TIMEOUT: Integer read _GetCODE_SIP_SERVER_TIMEOUT;
    {class} property CODE_SIP_SERVICE_UNAVAILABLE: Integer read _GetCODE_SIP_SERVICE_UNAVAILABLE;
    {class} property CODE_SIP_TEMPRARILY_UNAVAILABLE: Integer read _GetCODE_SIP_TEMPRARILY_UNAVAILABLE;
    {class} property CODE_SIP_TOO_MANY_HOPS: Integer read _GetCODE_SIP_TOO_MANY_HOPS;
    {class} property CODE_SIP_TRANSACTION_DOES_NOT_EXIST: Integer read _GetCODE_SIP_TRANSACTION_DOES_NOT_EXIST;
    {class} property CODE_SIP_UNDECIPHERABLE: Integer read _GetCODE_SIP_UNDECIPHERABLE;
    {class} property CODE_SIP_USER_MARKED_UNWANTED: Integer read _GetCODE_SIP_USER_MARKED_UNWANTED;
    {class} property CODE_SIP_USER_REJECTED: Integer read _GetCODE_SIP_USER_REJECTED;
    {class} property CODE_SUPP_SVC_CANCELLED: Integer read _GetCODE_SUPP_SVC_CANCELLED;
    {class} property CODE_SUPP_SVC_FAILED: Integer read _GetCODE_SUPP_SVC_FAILED;
    {class} property CODE_SUPP_SVC_REINVITE_COLLISION: Integer read _GetCODE_SUPP_SVC_REINVITE_COLLISION;
    {class} property CODE_TIMEOUT_1XX_WAITING: Integer read _GetCODE_TIMEOUT_1XX_WAITING;
    {class} property CODE_TIMEOUT_NO_ANSWER: Integer read _GetCODE_TIMEOUT_NO_ANSWER;
    {class} property CODE_TIMEOUT_NO_ANSWER_CALL_UPDATE: Integer read _GetCODE_TIMEOUT_NO_ANSWER_CALL_UPDATE;
    {class} property CODE_UNSPECIFIED: Integer read _GetCODE_UNSPECIFIED;
    {class} property CODE_USER_CANCELLED_SESSION_MODIFICATION: Integer read _GetCODE_USER_CANCELLED_SESSION_MODIFICATION;
    {class} property CODE_USER_DECLINE: Integer read _GetCODE_USER_DECLINE;
    {class} property CODE_USER_IGNORE: Integer read _GetCODE_USER_IGNORE;
    {class} property CODE_USER_NOANSWER: Integer read _GetCODE_USER_NOANSWER;
    {class} property CODE_USER_REJECTED_SESSION_MODIFICATION: Integer read _GetCODE_USER_REJECTED_SESSION_MODIFICATION;
    {class} property CODE_USER_TERMINATED: Integer read _GetCODE_USER_TERMINATED;
    {class} property CODE_USER_TERMINATED_BY_REMOTE: Integer read _GetCODE_USER_TERMINATED_BY_REMOTE;
    {class} property CODE_UT_CB_PASSWORD_MISMATCH: Integer read _GetCODE_UT_CB_PASSWORD_MISMATCH;
    {class} property CODE_UT_NETWORK_ERROR: Integer read _GetCODE_UT_NETWORK_ERROR;
    {class} property CODE_UT_NOT_SUPPORTED: Integer read _GetCODE_UT_NOT_SUPPORTED;
    {class} property CODE_UT_OPERATION_NOT_ALLOWED: Integer read _GetCODE_UT_OPERATION_NOT_ALLOWED;
    {class} property CODE_UT_SERVICE_UNAVAILABLE: Integer read _GetCODE_UT_SERVICE_UNAVAILABLE;
    {class} property CODE_UT_SS_MODIFIED_TO_DIAL: Integer read _GetCODE_UT_SS_MODIFIED_TO_DIAL;
    {class} property CODE_UT_SS_MODIFIED_TO_DIAL_VIDEO: Integer read _GetCODE_UT_SS_MODIFIED_TO_DIAL_VIDEO;
    {class} property CODE_UT_SS_MODIFIED_TO_SS: Integer read _GetCODE_UT_SS_MODIFIED_TO_SS;
    {class} property CODE_UT_SS_MODIFIED_TO_USSD: Integer read _GetCODE_UT_SS_MODIFIED_TO_USSD;
    {class} property CODE_WIFI_LOST: Integer read _GetCODE_WIFI_LOST;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_CODE_CALL_RETRY_BY_SETTINGS: Integer read _GetEXTRA_CODE_CALL_RETRY_BY_SETTINGS;
    {class} property EXTRA_CODE_CALL_RETRY_EMERGENCY: Integer read _GetEXTRA_CODE_CALL_RETRY_EMERGENCY;
    {class} property EXTRA_CODE_CALL_RETRY_NORMAL: Integer read _GetEXTRA_CODE_CALL_RETRY_NORMAL;
    {class} property EXTRA_CODE_CALL_RETRY_SILENT_REDIAL: Integer read _GetEXTRA_CODE_CALL_RETRY_SILENT_REDIAL;
  end;

  [JavaSignature('android/telephony/ims/ImsReasonInfo')]
  JImsReasonInfo = interface(JObject)
    ['{01B97FF0-BF50-4460-AB9F-874B389EA9EB}']
    function describeContents: Integer; cdecl;
    function getCode: Integer; cdecl;
    function getExtraCode: Integer; cdecl;
    function getExtraMessage: JString; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJImsReasonInfo = class(TJavaGenericImport<JImsReasonInfoClass, JImsReasonInfo>) end;

  JImsRegistrationAttributesClass = interface(JObjectClass)
    ['{C24E5016-F031-4724-B7DA-16FE14F805CA}']
    {class} function _GetATTR_EPDG_OVER_CELL_INTERNET: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property ATTR_EPDG_OVER_CELL_INTERNET: Integer read _GetATTR_EPDG_OVER_CELL_INTERNET;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/ims/ImsRegistrationAttributes')]
  JImsRegistrationAttributes = interface(JObject)
    ['{08CE6244-D985-4229-80BF-9FBDA63CAEF2}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAttributeFlags: Integer; cdecl;
    function getFeatureTags: JSet; cdecl;
    function getTransportType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJImsRegistrationAttributes = class(TJavaGenericImport<JImsRegistrationAttributesClass, JImsRegistrationAttributes>) end;

  JImsStateCallbackClass = interface(JObjectClass)
    ['{83BD8A24-114C-4276-9F8E-B97314D8F451}']
    {class} function _GetREASON_IMS_SERVICE_DISCONNECTED: Integer; cdecl;
    {class} function _GetREASON_IMS_SERVICE_NOT_READY: Integer; cdecl;
    {class} function _GetREASON_NO_IMS_SERVICE_CONFIGURED: Integer; cdecl;
    {class} function _GetREASON_SUBSCRIPTION_INACTIVE: Integer; cdecl;
    {class} function _GetREASON_UNKNOWN_PERMANENT_ERROR: Integer; cdecl;
    {class} function _GetREASON_UNKNOWN_TEMPORARY_ERROR: Integer; cdecl;
    {class} function init: JImsStateCallback; cdecl;
    {class} property REASON_IMS_SERVICE_DISCONNECTED: Integer read _GetREASON_IMS_SERVICE_DISCONNECTED;
    {class} property REASON_IMS_SERVICE_NOT_READY: Integer read _GetREASON_IMS_SERVICE_NOT_READY;
    {class} property REASON_NO_IMS_SERVICE_CONFIGURED: Integer read _GetREASON_NO_IMS_SERVICE_CONFIGURED;
    {class} property REASON_SUBSCRIPTION_INACTIVE: Integer read _GetREASON_SUBSCRIPTION_INACTIVE;
    {class} property REASON_UNKNOWN_PERMANENT_ERROR: Integer read _GetREASON_UNKNOWN_PERMANENT_ERROR;
    {class} property REASON_UNKNOWN_TEMPORARY_ERROR: Integer read _GetREASON_UNKNOWN_TEMPORARY_ERROR;
  end;

  [JavaSignature('android/telephony/ims/ImsStateCallback')]
  JImsStateCallback = interface(JObject)
    ['{D0A64703-AC0F-463C-80DC-4C078A581843}']
    procedure onAvailable; cdecl;
    procedure onError; cdecl;
    procedure onUnavailable(reason: Integer); cdecl;
  end;
  TJImsStateCallback = class(TJavaGenericImport<JImsStateCallbackClass, JImsStateCallback>) end;

  JProvisioningManagerClass = interface(JObjectClass)
    ['{C00DB6C4-38CD-432B-8BB2-483D90A48E62}']
  end;

  [JavaSignature('android/telephony/ims/ProvisioningManager')]
  JProvisioningManager = interface(JObject)
    ['{2CC893E7-6B3E-4B47-831D-0972181AA322}']
    function getProvisioningStatusForCapability(capability: Integer; tech: Integer): Boolean; cdecl;
    function getRcsProvisioningStatusForCapability(capability: Integer; tech: Integer): Boolean; cdecl;
    function isProvisioningRequiredForCapability(capability: Integer; tech: Integer): Boolean; cdecl;
    function isRcsProvisioningRequiredForCapability(capability: Integer; tech: Integer): Boolean; cdecl;
    procedure registerFeatureProvisioningChangedCallback(executor: JExecutor; callback: JProvisioningManager_FeatureProvisioningCallback); cdecl;
    procedure setProvisioningStatusForCapability(capability: Integer; tech: Integer; isProvisioned: Boolean); cdecl;
    procedure setRcsProvisioningStatusForCapability(capability: Integer; tech: Integer; isProvisioned: Boolean); cdecl;
    procedure unregisterFeatureProvisioningChangedCallback(callback: JProvisioningManager_FeatureProvisioningCallback); cdecl;
  end;
  TJProvisioningManager = class(TJavaGenericImport<JProvisioningManagerClass, JProvisioningManager>) end;

  JProvisioningManager_FeatureProvisioningCallbackClass = interface(JObjectClass)
    ['{72DFBA1A-4006-479A-97A1-1D66727E6F1C}']
    {class} function init: JProvisioningManager_FeatureProvisioningCallback; cdecl;
  end;

  [JavaSignature('android/telephony/ims/ProvisioningManager$FeatureProvisioningCallback')]
  JProvisioningManager_FeatureProvisioningCallback = interface(JObject)
    ['{B41BD770-5A96-43F6-B992-DA1A81BCD2F1}']
    procedure onFeatureProvisioningChanged(capability: Integer; tech: Integer; isProvisioned: Boolean); cdecl;
    procedure onRcsFeatureProvisioningChanged(capability: Integer; tech: Integer; isProvisioned: Boolean); cdecl;
  end;
  TJProvisioningManager_FeatureProvisioningCallback = class(TJavaGenericImport<JProvisioningManager_FeatureProvisioningCallbackClass, JProvisioningManager_FeatureProvisioningCallback>) end;

  JRcsUceAdapterClass = interface(JObjectClass)
    ['{59A8C2ED-CF46-434B-8224-E9E27984486F}']
  end;

  [JavaSignature('android/telephony/ims/RcsUceAdapter')]
  JRcsUceAdapter = interface(JObject)
    ['{9F778A55-AF10-499C-9A88-7437F583740F}']
    function isUceSettingEnabled: Boolean; cdecl;
  end;
  TJRcsUceAdapter = class(TJavaGenericImport<JRcsUceAdapterClass, JRcsUceAdapter>) end;

  JRegistrationManagerClass = interface(IJavaClass)
    ['{7843CCCE-37A8-43CF-B59A-A160F07F0BDC}']
    {class} function _GetREGISTRATION_STATE_NOT_REGISTERED: Integer; cdecl;
    {class} function _GetREGISTRATION_STATE_REGISTERED: Integer; cdecl;
    {class} function _GetREGISTRATION_STATE_REGISTERING: Integer; cdecl;
    {class} property REGISTRATION_STATE_NOT_REGISTERED: Integer read _GetREGISTRATION_STATE_NOT_REGISTERED;
    {class} property REGISTRATION_STATE_REGISTERED: Integer read _GetREGISTRATION_STATE_REGISTERED;
    {class} property REGISTRATION_STATE_REGISTERING: Integer read _GetREGISTRATION_STATE_REGISTERING;
  end;

  [JavaSignature('android/telephony/ims/RegistrationManager')]
  JRegistrationManager = interface(IJavaInstance)
    ['{DF4967EE-C277-4F56-B0F8-C790C2B6300E}']
    procedure getRegistrationState(executor: JExecutor; stateCallback: JConsumer); cdecl;
    procedure getRegistrationTransportType(executor: JExecutor; transportTypeCallback: JConsumer); cdecl;
    procedure registerImsRegistrationCallback(executor: JExecutor; c: JRegistrationManager_RegistrationCallback); cdecl;
    procedure unregisterImsRegistrationCallback(c: JRegistrationManager_RegistrationCallback); cdecl;
  end;
  TJRegistrationManager = class(TJavaGenericImport<JRegistrationManagerClass, JRegistrationManager>) end;

  JRegistrationManager_RegistrationCallbackClass = interface(JObjectClass)
    ['{2FB4D331-7A85-4104-87F8-75A622632907}']
    {class} function init: JRegistrationManager_RegistrationCallback; cdecl;
  end;

  [JavaSignature('android/telephony/ims/RegistrationManager$RegistrationCallback')]
  JRegistrationManager_RegistrationCallback = interface(JObject)
    ['{23B6B6D9-FCD0-401C-A200-93B3342B5756}']
    procedure onRegistered(imsTransportType: Integer); cdecl; overload;//Deprecated
    procedure onRegistered(attributes: JImsRegistrationAttributes); cdecl; overload;
    procedure onRegistering(imsTransportType: Integer); cdecl; overload;//Deprecated
    procedure onRegistering(attributes: JImsRegistrationAttributes); cdecl; overload;
    procedure onTechnologyChangeFailed(imsTransportType: Integer; info: JImsReasonInfo); cdecl;
    procedure onUnregistered(info: JImsReasonInfo); cdecl;
  end;
  TJRegistrationManager_RegistrationCallback = class(TJavaGenericImport<JRegistrationManager_RegistrationCallbackClass, JRegistrationManager_RegistrationCallback>) end;

  JMmTelFeatureClass = interface(JObjectClass)
    ['{1F357FA4-6ED6-4FEC-AEF8-F69CC35182C9}']
  end;

  [JavaSignature('android/telephony/ims/feature/MmTelFeature')]
  JMmTelFeature = interface(JObject)
    ['{F1E85116-45A0-48DE-8765-FABDD09F6036}']
  end;
  TJMmTelFeature = class(TJavaGenericImport<JMmTelFeatureClass, JMmTelFeature>) end;

  JMmTelFeature_MmTelCapabilitiesClass = interface(JObjectClass)
    ['{5E7A7F9B-FEA8-40B1-8FFB-46451E604D91}']
    {class} function _GetCAPABILITY_TYPE_CALL_COMPOSER: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_SMS: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_UT: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_VIDEO: Integer; cdecl;
    {class} function _GetCAPABILITY_TYPE_VOICE: Integer; cdecl;
    {class} property CAPABILITY_TYPE_CALL_COMPOSER: Integer read _GetCAPABILITY_TYPE_CALL_COMPOSER;
    {class} property CAPABILITY_TYPE_SMS: Integer read _GetCAPABILITY_TYPE_SMS;
    {class} property CAPABILITY_TYPE_UT: Integer read _GetCAPABILITY_TYPE_UT;
    {class} property CAPABILITY_TYPE_VIDEO: Integer read _GetCAPABILITY_TYPE_VIDEO;
    {class} property CAPABILITY_TYPE_VOICE: Integer read _GetCAPABILITY_TYPE_VOICE;
  end;

  [JavaSignature('android/telephony/ims/feature/MmTelFeature$MmTelCapabilities')]
  JMmTelFeature_MmTelCapabilities = interface(JObject)
    ['{66171B9C-8EBA-4BDE-84F3-03E3F05A6FF6}']
    function isCapable(capabilities: Integer): Boolean; cdecl;
  end;
  TJMmTelFeature_MmTelCapabilities = class(TJavaGenericImport<JMmTelFeature_MmTelCapabilitiesClass, JMmTelFeature_MmTelCapabilities>) end;

  JImsRegistrationImplBaseClass = interface(JObjectClass)
    ['{F31E56C6-5834-41BF-A6EC-F6BDD9C7CAA9}']
    {class} function _GetREGISTRATION_TECH_CROSS_SIM: Integer; cdecl;
    {class} function _GetREGISTRATION_TECH_IWLAN: Integer; cdecl;
    {class} function _GetREGISTRATION_TECH_LTE: Integer; cdecl;
    {class} function _GetREGISTRATION_TECH_NONE: Integer; cdecl;
    {class} function _GetREGISTRATION_TECH_NR: Integer; cdecl;
    {class} property REGISTRATION_TECH_CROSS_SIM: Integer read _GetREGISTRATION_TECH_CROSS_SIM;
    {class} property REGISTRATION_TECH_IWLAN: Integer read _GetREGISTRATION_TECH_IWLAN;
    {class} property REGISTRATION_TECH_LTE: Integer read _GetREGISTRATION_TECH_LTE;
    {class} property REGISTRATION_TECH_NONE: Integer read _GetREGISTRATION_TECH_NONE;
    {class} property REGISTRATION_TECH_NR: Integer read _GetREGISTRATION_TECH_NR;
  end;

  [JavaSignature('android/telephony/ims/stub/ImsRegistrationImplBase')]
  JImsRegistrationImplBase = interface(JObject)
    ['{5DC25604-B28D-4089-9910-91903A033284}']
  end;
  TJImsRegistrationImplBase = class(TJavaGenericImport<JImsRegistrationImplBaseClass, JImsRegistrationImplBase>) end;

  JDownloadProgressListenerClass = interface(JObjectClass)
    ['{14953955-7FDC-4A56-BE7C-9E94E895CF23}']
    {class} function init: JDownloadProgressListener; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/DownloadProgressListener')]
  JDownloadProgressListener = interface(JObject)
    ['{E488EFC5-0E8B-4322-A28C-EEA08056A389}']
    procedure onProgressUpdated(request: JDownloadRequest; fileInfo: JFileInfo; currentDownloadSize: Integer; fullDownloadSize: Integer; currentDecodedSize: Integer; fullDecodedSize: Integer); cdecl;
  end;
  TJDownloadProgressListener = class(TJavaGenericImport<JDownloadProgressListenerClass, JDownloadProgressListener>) end;

  JDownloadRequestClass = interface(JObjectClass)
    ['{55C033AD-A505-4956-B124-432880B64267}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function getMaxAppIntentSize: Integer; cdecl;
    {class} function getMaxDestinationUriSize: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/mbms/DownloadRequest')]
  JDownloadRequest = interface(JObject)
    ['{609896C8-29DB-4871-9BDA-822FA00DC32D}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDestinationUri: Jnet_Uri; cdecl;
    function getFileServiceId: JString; cdecl;
    function getSourceUri: Jnet_Uri; cdecl;
    function getSubscriptionId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJDownloadRequest = class(TJavaGenericImport<JDownloadRequestClass, JDownloadRequest>) end;

  JDownloadRequest_BuilderClass = interface(JObjectClass)
    ['{B5BEA137-B734-45A6-8A81-A231DF4081C5}']
    {class} function init(sourceUri: Jnet_Uri; destinationUri: Jnet_Uri): JDownloadRequest_Builder; cdecl;
    {class} function fromDownloadRequest(other: JDownloadRequest): JDownloadRequest_Builder; cdecl;
    {class} function fromSerializedRequest(data: TJavaArray<Byte>): JDownloadRequest_Builder; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/DownloadRequest$Builder')]
  JDownloadRequest_Builder = interface(JObject)
    ['{D4E2B7A7-5B0E-42CA-8F03-B2A94A9CCDBE}']
    function build: JDownloadRequest; cdecl;
    function setAppIntent(intent: JIntent): JDownloadRequest_Builder; cdecl;
    function setServiceInfo(serviceInfo: JFileServiceInfo): JDownloadRequest_Builder; cdecl;
    function setSubscriptionId(subscriptionId: Integer): JDownloadRequest_Builder; cdecl;
  end;
  TJDownloadRequest_Builder = class(TJavaGenericImport<JDownloadRequest_BuilderClass, JDownloadRequest_Builder>) end;

  JDownloadStatusListenerClass = interface(JObjectClass)
    ['{0D08CC85-D1FF-453C-95A9-6C14E2D2A23E}']
    {class} function init: JDownloadStatusListener; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/DownloadStatusListener')]
  JDownloadStatusListener = interface(JObject)
    ['{1BE3F91F-8694-4BF6-847F-77F11E11DF61}']
    procedure onStatusUpdated(request: JDownloadRequest; fileInfo: JFileInfo; status: Integer); cdecl;
  end;
  TJDownloadStatusListener = class(TJavaGenericImport<JDownloadStatusListenerClass, JDownloadStatusListener>) end;

  JFileInfoClass = interface(JObjectClass)
    ['{AC8CB228-8644-4D12-890E-0197E38D2CED}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/mbms/FileInfo')]
  JFileInfo = interface(JObject)
    ['{7A10FD5B-E3C9-4EDD-B923-94F685D6352A}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getMimeType: JString; cdecl;
    function getUri: Jnet_Uri; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJFileInfo = class(TJavaGenericImport<JFileInfoClass, JFileInfo>) end;

  Jmbms_ServiceInfoClass = interface(JObjectClass)
    ['{A3AD9485-73D8-4119-9370-298F205B06F4}']
  end;

  [JavaSignature('android/telephony/mbms/ServiceInfo')]
  Jmbms_ServiceInfo = interface(JObject)
    ['{DB318AA2-FE5D-41BF-9A80-55A5F2BC8C6F}']
    function equals(o: JObject): Boolean; cdecl;
    function getLocales: JList; cdecl;
    function getNameForLocale(locale: JLocale): JCharSequence; cdecl;
    function getNamedContentLocales: JSet; cdecl;
    function getServiceClassName: JString; cdecl;
    function getServiceId: JString; cdecl;
    function getSessionEndTime: JDate; cdecl;
    function getSessionStartTime: JDate; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJmbms_ServiceInfo = class(TJavaGenericImport<Jmbms_ServiceInfoClass, Jmbms_ServiceInfo>) end;

  JFileServiceInfoClass = interface(Jmbms_ServiceInfoClass)
    ['{728AAA1C-F6B2-4E7E-8F5F-EC04A0F352EF}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/mbms/FileServiceInfo')]
  JFileServiceInfo = interface(Jmbms_ServiceInfo)
    ['{53DB3B07-F403-477F-BFEE-3A75ACA1BB00}']
    function describeContents: Integer; cdecl;
    function getFiles: JList; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJFileServiceInfo = class(TJavaGenericImport<JFileServiceInfoClass, JFileServiceInfo>) end;

  JGroupCallClass = interface(JObjectClass)
    ['{214320AE-F31A-43F5-B4B0-F8B22A2AF2D6}']
    {class} function _GetREASON_BY_USER_REQUEST: Integer; cdecl;
    {class} function _GetREASON_FREQUENCY_CONFLICT: Integer; cdecl;
    {class} function _GetREASON_LEFT_MBMS_BROADCAST_AREA: Integer; cdecl;
    {class} function _GetREASON_NONE: Integer; cdecl;
    {class} function _GetREASON_NOT_CONNECTED_TO_HOMECARRIER_LTE: Integer; cdecl;
    {class} function _GetREASON_OUT_OF_MEMORY: Integer; cdecl;
    {class} function _GetSTATE_STALLED: Integer; cdecl;
    {class} function _GetSTATE_STARTED: Integer; cdecl;
    {class} function _GetSTATE_STOPPED: Integer; cdecl;
    {class} property REASON_BY_USER_REQUEST: Integer read _GetREASON_BY_USER_REQUEST;
    {class} property REASON_FREQUENCY_CONFLICT: Integer read _GetREASON_FREQUENCY_CONFLICT;
    {class} property REASON_LEFT_MBMS_BROADCAST_AREA: Integer read _GetREASON_LEFT_MBMS_BROADCAST_AREA;
    {class} property REASON_NONE: Integer read _GetREASON_NONE;
    {class} property REASON_NOT_CONNECTED_TO_HOMECARRIER_LTE: Integer read _GetREASON_NOT_CONNECTED_TO_HOMECARRIER_LTE;
    {class} property REASON_OUT_OF_MEMORY: Integer read _GetREASON_OUT_OF_MEMORY;
    {class} property STATE_STALLED: Integer read _GetSTATE_STALLED;
    {class} property STATE_STARTED: Integer read _GetSTATE_STARTED;
    {class} property STATE_STOPPED: Integer read _GetSTATE_STOPPED;
  end;

  [JavaSignature('android/telephony/mbms/GroupCall')]
  JGroupCall = interface(JObject)
    ['{95636F5B-A589-4487-945B-2E6DADA8A5A3}']
    procedure close; cdecl;
    function getTmgi: Int64; cdecl;
    procedure updateGroupCall(saiList: JList; frequencyList: JList); cdecl;
  end;
  TJGroupCall = class(TJavaGenericImport<JGroupCallClass, JGroupCall>) end;

  JGroupCallCallbackClass = interface(IJavaClass)
    ['{BC4630F5-0997-4629-BD40-200437F54BDD}']
    {class} function _GetSIGNAL_STRENGTH_UNAVAILABLE: Integer; cdecl;
    {class} property SIGNAL_STRENGTH_UNAVAILABLE: Integer read _GetSIGNAL_STRENGTH_UNAVAILABLE;
  end;

  [JavaSignature('android/telephony/mbms/GroupCallCallback')]
  JGroupCallCallback = interface(IJavaInstance)
    ['{B8401659-6772-4C36-B728-66C048E396F5}']
    procedure onBroadcastSignalStrengthUpdated(signalStrength: Integer); cdecl;
    procedure onError(errorCode: Integer; message: JString); cdecl;
    procedure onGroupCallStateChanged(state: Integer; reason: Integer); cdecl;
  end;
  TJGroupCallCallback = class(TJavaGenericImport<JGroupCallCallbackClass, JGroupCallCallback>) end;

  JMbmsDownloadReceiverClass = interface(JBroadcastReceiverClass)
    ['{80783C2D-A846-4C68-9A76-AAF5A5E06414}']
    {class} function init: JMbmsDownloadReceiver; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/MbmsDownloadReceiver')]
  JMbmsDownloadReceiver = interface(JBroadcastReceiver)
    ['{CA17E18B-E73D-4BD3-9D86-37568C94C49E}']
  end;
  TJMbmsDownloadReceiver = class(TJavaGenericImport<JMbmsDownloadReceiverClass, JMbmsDownloadReceiver>) end;

  JMbmsDownloadSessionCallbackClass = interface(JObjectClass)
    ['{B6E17225-905D-4AB1-A060-FB1E724D3B9E}']
    {class} function init: JMbmsDownloadSessionCallback; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/MbmsDownloadSessionCallback')]
  JMbmsDownloadSessionCallback = interface(JObject)
    ['{CD8ABDF8-0BED-4485-8AE3-AEB450314BCF}']
    procedure onError(errorCode: Integer; message: JString); cdecl;
    procedure onFileServicesUpdated(services: JList); cdecl;
    procedure onMiddlewareReady; cdecl;
  end;
  TJMbmsDownloadSessionCallback = class(TJavaGenericImport<JMbmsDownloadSessionCallbackClass, JMbmsDownloadSessionCallback>) end;

  JMbmsErrorsClass = interface(JObjectClass)
    ['{E629782D-7CAC-434F-B22F-C9ECBE9076ED}']
    {class} function _GetERROR_MIDDLEWARE_LOST: Integer; cdecl;
    {class} function _GetERROR_MIDDLEWARE_NOT_BOUND: Integer; cdecl;
    {class} function _GetERROR_NO_UNIQUE_MIDDLEWARE: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function _GetUNKNOWN: Integer; cdecl;
    {class} property ERROR_MIDDLEWARE_LOST: Integer read _GetERROR_MIDDLEWARE_LOST;
    {class} property ERROR_MIDDLEWARE_NOT_BOUND: Integer read _GetERROR_MIDDLEWARE_NOT_BOUND;
    {class} property ERROR_NO_UNIQUE_MIDDLEWARE: Integer read _GetERROR_NO_UNIQUE_MIDDLEWARE;
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors')]
  JMbmsErrors = interface(JObject)
    ['{53D80E3D-A45E-4604-B047-BCC9275FBDD2}']
  end;
  TJMbmsErrors = class(TJavaGenericImport<JMbmsErrorsClass, JMbmsErrors>) end;

  JMbmsErrors_DownloadErrorsClass = interface(JObjectClass)
    ['{A97A0108-6F12-4B31-8600-7C343F7C5F64}']
    {class} function _GetERROR_CANNOT_CHANGE_TEMP_FILE_ROOT: Integer; cdecl;
    {class} function _GetERROR_MALFORMED_SERVICE_ANNOUNCEMENT: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN_DOWNLOAD_REQUEST: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN_FILE_INFO: Integer; cdecl;
    {class} property ERROR_CANNOT_CHANGE_TEMP_FILE_ROOT: Integer read _GetERROR_CANNOT_CHANGE_TEMP_FILE_ROOT;
    {class} property ERROR_MALFORMED_SERVICE_ANNOUNCEMENT: Integer read _GetERROR_MALFORMED_SERVICE_ANNOUNCEMENT;
    {class} property ERROR_UNKNOWN_DOWNLOAD_REQUEST: Integer read _GetERROR_UNKNOWN_DOWNLOAD_REQUEST;
    {class} property ERROR_UNKNOWN_FILE_INFO: Integer read _GetERROR_UNKNOWN_FILE_INFO;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors$DownloadErrors')]
  JMbmsErrors_DownloadErrors = interface(JObject)
    ['{2CFF3027-B8C9-4E75-850F-0BA42C7F34C6}']
  end;
  TJMbmsErrors_DownloadErrors = class(TJavaGenericImport<JMbmsErrors_DownloadErrorsClass, JMbmsErrors_DownloadErrors>) end;

  JMbmsErrors_GeneralErrorsClass = interface(JObjectClass)
    ['{FA5F5574-E4FC-4283-BCB8-0BBC34A79830}']
    {class} function _GetERROR_CARRIER_CHANGE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetERROR_IN_E911: Integer; cdecl;
    {class} function _GetERROR_MIDDLEWARE_NOT_YET_READY: Integer; cdecl;
    {class} function _GetERROR_MIDDLEWARE_TEMPORARILY_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_NOT_CONNECTED_TO_HOME_CARRIER_LTE: Integer; cdecl;
    {class} function _GetERROR_OUT_OF_MEMORY: Integer; cdecl;
    {class} function _GetERROR_UNABLE_TO_READ_SIM: Integer; cdecl;
    {class} property ERROR_CARRIER_CHANGE_NOT_ALLOWED: Integer read _GetERROR_CARRIER_CHANGE_NOT_ALLOWED;
    {class} property ERROR_IN_E911: Integer read _GetERROR_IN_E911;
    {class} property ERROR_MIDDLEWARE_NOT_YET_READY: Integer read _GetERROR_MIDDLEWARE_NOT_YET_READY;
    {class} property ERROR_MIDDLEWARE_TEMPORARILY_UNAVAILABLE: Integer read _GetERROR_MIDDLEWARE_TEMPORARILY_UNAVAILABLE;
    {class} property ERROR_NOT_CONNECTED_TO_HOME_CARRIER_LTE: Integer read _GetERROR_NOT_CONNECTED_TO_HOME_CARRIER_LTE;
    {class} property ERROR_OUT_OF_MEMORY: Integer read _GetERROR_OUT_OF_MEMORY;
    {class} property ERROR_UNABLE_TO_READ_SIM: Integer read _GetERROR_UNABLE_TO_READ_SIM;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors$GeneralErrors')]
  JMbmsErrors_GeneralErrors = interface(JObject)
    ['{D45D2804-8B3C-4331-91F7-A6FCA98EA9C1}']
  end;
  TJMbmsErrors_GeneralErrors = class(TJavaGenericImport<JMbmsErrors_GeneralErrorsClass, JMbmsErrors_GeneralErrors>) end;

  JMbmsErrors_GroupCallErrorsClass = interface(JObjectClass)
    ['{44E36690-6479-4A56-BEB7-B66EF81FF71D}']
    {class} function _GetERROR_DUPLICATE_START_GROUP_CALL: Integer; cdecl;
    {class} function _GetERROR_UNABLE_TO_START_SERVICE: Integer; cdecl;
    {class} property ERROR_DUPLICATE_START_GROUP_CALL: Integer read _GetERROR_DUPLICATE_START_GROUP_CALL;
    {class} property ERROR_UNABLE_TO_START_SERVICE: Integer read _GetERROR_UNABLE_TO_START_SERVICE;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors$GroupCallErrors')]
  JMbmsErrors_GroupCallErrors = interface(JObject)
    ['{EE71E1FC-8E78-4A4C-BDE3-AF8FE5BDAB1A}']
  end;
  TJMbmsErrors_GroupCallErrors = class(TJavaGenericImport<JMbmsErrors_GroupCallErrorsClass, JMbmsErrors_GroupCallErrors>) end;

  JMbmsErrors_InitializationErrorsClass = interface(JObjectClass)
    ['{8EA63BAB-EF72-4A70-8AFD-30BC80E7BF27}']
    {class} function _GetERROR_APP_PERMISSIONS_NOT_GRANTED: Integer; cdecl;
    {class} function _GetERROR_DUPLICATE_INITIALIZE: Integer; cdecl;
    {class} function _GetERROR_UNABLE_TO_INITIALIZE: Integer; cdecl;
    {class} property ERROR_APP_PERMISSIONS_NOT_GRANTED: Integer read _GetERROR_APP_PERMISSIONS_NOT_GRANTED;
    {class} property ERROR_DUPLICATE_INITIALIZE: Integer read _GetERROR_DUPLICATE_INITIALIZE;
    {class} property ERROR_UNABLE_TO_INITIALIZE: Integer read _GetERROR_UNABLE_TO_INITIALIZE;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors$InitializationErrors')]
  JMbmsErrors_InitializationErrors = interface(JObject)
    ['{6778D2B6-BA53-43B6-BFC6-D2DD06683ABF}']
  end;
  TJMbmsErrors_InitializationErrors = class(TJavaGenericImport<JMbmsErrors_InitializationErrorsClass, JMbmsErrors_InitializationErrors>) end;

  JMbmsErrors_StreamingErrorsClass = interface(JObjectClass)
    ['{9977F725-6E3E-4D50-9D5D-90A045743041}']
    {class} function _GetERROR_CONCURRENT_SERVICE_LIMIT_REACHED: Integer; cdecl;
    {class} function _GetERROR_DUPLICATE_START_STREAM: Integer; cdecl;
    {class} function _GetERROR_UNABLE_TO_START_SERVICE: Integer; cdecl;
    {class} property ERROR_CONCURRENT_SERVICE_LIMIT_REACHED: Integer read _GetERROR_CONCURRENT_SERVICE_LIMIT_REACHED;
    {class} property ERROR_DUPLICATE_START_STREAM: Integer read _GetERROR_DUPLICATE_START_STREAM;
    {class} property ERROR_UNABLE_TO_START_SERVICE: Integer read _GetERROR_UNABLE_TO_START_SERVICE;
  end;

  [JavaSignature('android/telephony/mbms/MbmsErrors$StreamingErrors')]
  JMbmsErrors_StreamingErrors = interface(JObject)
    ['{388FC3AA-0491-40AC-9E1D-EB4C525AE88A}']
  end;
  TJMbmsErrors_StreamingErrors = class(TJavaGenericImport<JMbmsErrors_StreamingErrorsClass, JMbmsErrors_StreamingErrors>) end;

  JMbmsGroupCallSessionCallbackClass = interface(IJavaClass)
    ['{FD2AA9C6-C9D7-4BF9-A7C2-81BFEB8EF1E3}']
  end;

  [JavaSignature('android/telephony/mbms/MbmsGroupCallSessionCallback')]
  JMbmsGroupCallSessionCallback = interface(IJavaInstance)
    ['{584A2320-9007-4011-B25A-A05A2D382C09}']
    procedure onAvailableSaisUpdated(currentSais: JList; availableSais: JList); cdecl;
    procedure onError(errorCode: Integer; message: JString); cdecl;
    procedure onMiddlewareReady; cdecl;
    procedure onServiceInterfaceAvailable(interfaceName: JString; index: Integer); cdecl;
  end;
  TJMbmsGroupCallSessionCallback = class(TJavaGenericImport<JMbmsGroupCallSessionCallbackClass, JMbmsGroupCallSessionCallback>) end;

  JMbmsStreamingSessionCallbackClass = interface(JObjectClass)
    ['{C347CC2C-AEFA-490B-BF34-40D894818AFC}']
    {class} function init: JMbmsStreamingSessionCallback; cdecl;
  end;

  [JavaSignature('android/telephony/mbms/MbmsStreamingSessionCallback')]
  JMbmsStreamingSessionCallback = interface(JObject)
    ['{18DA5858-C907-4C94-AAC1-EEE907E358C8}']
    procedure onError(errorCode: Integer; message: JString); cdecl;
    procedure onMiddlewareReady; cdecl;
    procedure onStreamingServicesUpdated(services: JList); cdecl;
  end;
  TJMbmsStreamingSessionCallback = class(TJavaGenericImport<JMbmsStreamingSessionCallbackClass, JMbmsStreamingSessionCallback>) end;

  JStreamingServiceClass = interface(JObjectClass)
    ['{0C8A4527-82D6-4396-B389-D1CF2D08EAF6}']
    {class} function _GetBROADCAST_METHOD: Integer; cdecl;
    {class} function _GetREASON_BY_USER_REQUEST: Integer; cdecl;
    {class} function _GetREASON_END_OF_SESSION: Integer; cdecl;
    {class} function _GetREASON_FREQUENCY_CONFLICT: Integer; cdecl;
    {class} function _GetREASON_LEFT_MBMS_BROADCAST_AREA: Integer; cdecl;
    {class} function _GetREASON_NONE: Integer; cdecl;
    {class} function _GetREASON_NOT_CONNECTED_TO_HOMECARRIER_LTE: Integer; cdecl;
    {class} function _GetREASON_OUT_OF_MEMORY: Integer; cdecl;
    {class} function _GetSTATE_STALLED: Integer; cdecl;
    {class} function _GetSTATE_STARTED: Integer; cdecl;
    {class} function _GetSTATE_STOPPED: Integer; cdecl;
    {class} function _GetUNICAST_METHOD: Integer; cdecl;
    {class} property BROADCAST_METHOD: Integer read _GetBROADCAST_METHOD;
    {class} property REASON_BY_USER_REQUEST: Integer read _GetREASON_BY_USER_REQUEST;
    {class} property REASON_END_OF_SESSION: Integer read _GetREASON_END_OF_SESSION;
    {class} property REASON_FREQUENCY_CONFLICT: Integer read _GetREASON_FREQUENCY_CONFLICT;
    {class} property REASON_LEFT_MBMS_BROADCAST_AREA: Integer read _GetREASON_LEFT_MBMS_BROADCAST_AREA;
    {class} property REASON_NONE: Integer read _GetREASON_NONE;
    {class} property REASON_NOT_CONNECTED_TO_HOMECARRIER_LTE: Integer read _GetREASON_NOT_CONNECTED_TO_HOMECARRIER_LTE;
    {class} property REASON_OUT_OF_MEMORY: Integer read _GetREASON_OUT_OF_MEMORY;
    {class} property STATE_STALLED: Integer read _GetSTATE_STALLED;
    {class} property STATE_STARTED: Integer read _GetSTATE_STARTED;
    {class} property STATE_STOPPED: Integer read _GetSTATE_STOPPED;
    {class} property UNICAST_METHOD: Integer read _GetUNICAST_METHOD;
  end;

  [JavaSignature('android/telephony/mbms/StreamingService')]
  JStreamingService = interface(JObject)
    ['{E67C3D98-86C8-4A2C-9A66-B5BF949E3A7E}']
    procedure close; cdecl;
    function getInfo: JStreamingServiceInfo; cdecl;
    function getPlaybackUri: Jnet_Uri; cdecl;
  end;
  TJStreamingService = class(TJavaGenericImport<JStreamingServiceClass, JStreamingService>) end;

  JStreamingServiceCallbackClass = interface(JObjectClass)
    ['{FB47712F-D511-4701-85C0-E04DDF1C161B}']
    {class} function _GetSIGNAL_STRENGTH_UNAVAILABLE: Integer; cdecl;
    {class} function init: JStreamingServiceCallback; cdecl;
    {class} property SIGNAL_STRENGTH_UNAVAILABLE: Integer read _GetSIGNAL_STRENGTH_UNAVAILABLE;
  end;

  [JavaSignature('android/telephony/mbms/StreamingServiceCallback')]
  JStreamingServiceCallback = interface(JObject)
    ['{B0DDF10B-6F4B-48A0-9213-EAADC0526E4E}']
    procedure onBroadcastSignalStrengthUpdated(signalStrength: Integer); cdecl;
    procedure onError(errorCode: Integer; message: JString); cdecl;
    procedure onMediaDescriptionUpdated; cdecl;
    procedure onStreamMethodUpdated(methodType: Integer); cdecl;
    procedure onStreamStateUpdated(state: Integer; reason: Integer); cdecl;
  end;
  TJStreamingServiceCallback = class(TJavaGenericImport<JStreamingServiceCallbackClass, JStreamingServiceCallback>) end;

  JStreamingServiceInfoClass = interface(Jmbms_ServiceInfoClass)
    ['{04D6B99B-4B65-4B84-BCB5-733BE21246D2}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/telephony/mbms/StreamingServiceInfo')]
  JStreamingServiceInfo = interface(Jmbms_ServiceInfo)
    ['{9F0A3CFE-7114-40DA-8854-7EB2A7C7EF40}']
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJStreamingServiceInfo = class(TJavaGenericImport<JStreamingServiceInfoClass, JStreamingServiceInfo>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants_AccessNetworkType', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants_AccessNetworkType));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants_EutranBand', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants_EutranBand));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants_GeranBand', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants_GeranBand));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants_NgranBands', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants_NgranBands));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAccessNetworkConstants_UtranBand', TypeInfo(Androidapi.JNI.Telephony.JAccessNetworkConstants_UtranBand));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAvailableNetworkInfo', TypeInfo(Androidapi.JNI.Telephony.JAvailableNetworkInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JAvailableNetworkInfo_Builder', TypeInfo(Androidapi.JNI.Telephony.JAvailableNetworkInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JBarringInfo', TypeInfo(Androidapi.JNI.Telephony.JBarringInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JBarringInfo_BarringServiceInfo', TypeInfo(Androidapi.JNI.Telephony.JBarringInfo_BarringServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_Apn', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_Apn));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_Bsf', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_Bsf));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_Gps', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_Gps));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_Ims', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_Ims));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsEmergency', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsEmergency));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsRtt', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsRtt));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsServiceEntitlement', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsServiceEntitlement));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsSms', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsSms));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsSs', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsSs));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsVoice', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsVoice));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsVt', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsVt));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_ImsWfc', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_ImsWfc));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCarrierConfigManager_Iwlan', TypeInfo(Androidapi.JNI.Telephony.JCarrierConfigManager_Iwlan));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentity', TypeInfo(Androidapi.JNI.Telephony.JCellIdentity));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityCdma', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityCdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityGsm', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityGsm));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityLte', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityLte));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityNr', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityNr));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityTdscdma', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityTdscdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellIdentityWcdma', TypeInfo(Androidapi.JNI.Telephony.JCellIdentityWcdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfo', TypeInfo(Androidapi.JNI.Telephony.JCellInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoCdma', TypeInfo(Androidapi.JNI.Telephony.JCellInfoCdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoGsm', TypeInfo(Androidapi.JNI.Telephony.JCellInfoGsm));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoLte', TypeInfo(Androidapi.JNI.Telephony.JCellInfoLte));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoNr', TypeInfo(Androidapi.JNI.Telephony.JCellInfoNr));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoTdscdma', TypeInfo(Androidapi.JNI.Telephony.JCellInfoTdscdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellInfoWcdma', TypeInfo(Androidapi.JNI.Telephony.JCellInfoWcdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellLocation', TypeInfo(Androidapi.JNI.Telephony.JCellLocation));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrength', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrength));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthCdma', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthCdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthGsm', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthGsm));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthLte', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthLte));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthNr', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthNr));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthTdscdma', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthTdscdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCellSignalStrengthWcdma', TypeInfo(Androidapi.JNI.Telephony.JCellSignalStrengthWcdma));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JClosedSubscriberGroupInfo', TypeInfo(Androidapi.JNI.Telephony.JClosedSubscriberGroupInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDataFailCause', TypeInfo(Androidapi.JNI.Telephony.JDataFailCause));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jtelephony_DisconnectCause', TypeInfo(Androidapi.JNI.Telephony.Jtelephony_DisconnectCause));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JIccOpenLogicalChannelResponse', TypeInfo(Androidapi.JNI.Telephony.JIccOpenLogicalChannelResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsDownloadSession', TypeInfo(Androidapi.JNI.Telephony.JMbmsDownloadSession));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsGroupCallSession', TypeInfo(Androidapi.JNI.Telephony.JMbmsGroupCallSession));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsStreamingSession', TypeInfo(Androidapi.JNI.Telephony.JMbmsStreamingSession));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNeighboringCellInfo', TypeInfo(Androidapi.JNI.Telephony.JNeighboringCellInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkRegistrationInfo', TypeInfo(Androidapi.JNI.Telephony.JNetworkRegistrationInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkScan', TypeInfo(Androidapi.JNI.Telephony.JNetworkScan));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkScanRequest', TypeInfo(Androidapi.JNI.Telephony.JNetworkScanRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JPhoneNumberFormattingTextWatcher', TypeInfo(Androidapi.JNI.Telephony.JPhoneNumberFormattingTextWatcher));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JPhoneNumberUtils', TypeInfo(Androidapi.JNI.Telephony.JPhoneNumberUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JPhoneStateListener', TypeInfo(Androidapi.JNI.Telephony.JPhoneStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JPhysicalChannelConfig', TypeInfo(Androidapi.JNI.Telephony.JPhysicalChannelConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JPreciseDataConnectionState', TypeInfo(Androidapi.JNI.Telephony.JPreciseDataConnectionState));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JRadioAccessSpecifier', TypeInfo(Androidapi.JNI.Telephony.JRadioAccessSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JServiceState', TypeInfo(Androidapi.JNI.Telephony.JServiceState));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSignalStrength', TypeInfo(Androidapi.JNI.Telephony.JSignalStrength));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSignalStrengthUpdateRequest', TypeInfo(Androidapi.JNI.Telephony.JSignalStrengthUpdateRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSignalStrengthUpdateRequest_Builder', TypeInfo(Androidapi.JNI.Telephony.JSignalStrengthUpdateRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSignalThresholdInfo', TypeInfo(Androidapi.JNI.Telephony.JSignalThresholdInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSignalThresholdInfo_Builder', TypeInfo(Androidapi.JNI.Telephony.JSignalThresholdInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSmsManager', TypeInfo(Androidapi.JNI.Telephony.JSmsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSmsManager_FinancialSmsCallback', TypeInfo(Androidapi.JNI.Telephony.JSmsManager_FinancialSmsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSmsMessage', TypeInfo(Androidapi.JNI.Telephony.JSmsMessage));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSmsMessage_MessageClass', TypeInfo(Androidapi.JNI.Telephony.JSmsMessage_MessageClass));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSmsMessage_SubmitPdu', TypeInfo(Androidapi.JNI.Telephony.JSmsMessage_SubmitPdu));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionInfo', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionManager', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionManager_OnOpportunisticSubscriptionsChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionManager_OnSubscriptionsChangedListener', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionManager_OnSubscriptionsChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionPlan', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionPlan));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JSubscriptionPlan_Builder', TypeInfo(Androidapi.JNI.Telephony.JSubscriptionPlan_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_ActiveDataSubscriptionIdListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_ActiveDataSubscriptionIdListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_BarringInfoListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_BarringInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CallDisconnectCauseListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CallDisconnectCauseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CallForwardingIndicatorListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CallForwardingIndicatorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CallStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CallStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CarrierNetworkListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CarrierNetworkListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CellInfoListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CellInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_CellLocationListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_CellLocationListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_DataActivationStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_DataActivationStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_DataActivityListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_DataActivityListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_DataConnectionStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_DataConnectionStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_DisplayInfoListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_DisplayInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_EmergencyNumberListListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_EmergencyNumberListListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_ImsCallDisconnectCauseListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_ImsCallDisconnectCauseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_MessageWaitingIndicatorListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_MessageWaitingIndicatorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_PhysicalChannelConfigListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_PhysicalChannelConfigListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_PreciseDataConnectionStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_PreciseDataConnectionStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_RegistrationFailedListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_RegistrationFailedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_ServiceStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_ServiceStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_SignalStrengthsListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_SignalStrengthsListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyCallback_UserMobileDataStateListener', TypeInfo(Androidapi.JNI.Telephony.JTelephonyCallback_UserMobileDataStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyDisplayInfo', TypeInfo(Androidapi.JNI.Telephony.JTelephonyDisplayInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_CallComposerException', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_CallComposerException));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_CellInfoCallback', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_CellInfoCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_NetworkSlicingException', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_NetworkSlicingException));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_ModemErrorException', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_ModemErrorException));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_TimeoutException', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_TimeoutException));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyManager_UssdResponseCallback', TypeInfo(Androidapi.JNI.Telephony.JTelephonyManager_UssdResponseCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyScanManager', TypeInfo(Androidapi.JNI.Telephony.JTelephonyScanManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTelephonyScanManager_NetworkScanCallback', TypeInfo(Androidapi.JNI.Telephony.JTelephonyScanManager_NetworkScanCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JUiccCardInfo', TypeInfo(Androidapi.JNI.Telephony.JUiccCardInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JUiccPortInfo', TypeInfo(Androidapi.JNI.Telephony.JUiccPortInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JVisualVoicemailService', TypeInfo(Androidapi.JNI.Telephony.JVisualVoicemailService));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JVisualVoicemailService_VisualVoicemailTask', TypeInfo(Androidapi.JNI.Telephony.JVisualVoicemailService_VisualVoicemailTask));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JVisualVoicemailSms', TypeInfo(Androidapi.JNI.Telephony.JVisualVoicemailSms));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JVisualVoicemailSmsFilterSettings', TypeInfo(Androidapi.JNI.Telephony.JVisualVoicemailSmsFilterSettings));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JVisualVoicemailSmsFilterSettings_Builder', TypeInfo(Androidapi.JNI.Telephony.JVisualVoicemailSmsFilterSettings_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JCdmaCellLocation', TypeInfo(Androidapi.JNI.Telephony.JCdmaCellLocation));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JApnSetting', TypeInfo(Androidapi.JNI.Telephony.JApnSetting));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JApnSetting_Builder', TypeInfo(Androidapi.JNI.Telephony.JApnSetting_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkSliceInfo', TypeInfo(Androidapi.JNI.Telephony.JNetworkSliceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkSliceInfo_Builder', TypeInfo(Androidapi.JNI.Telephony.JNetworkSliceInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JNetworkSlicingConfig', TypeInfo(Androidapi.JNI.Telephony.JNetworkSlicingConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JRouteSelectionDescriptor', TypeInfo(Androidapi.JNI.Telephony.JRouteSelectionDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTrafficDescriptor', TypeInfo(Androidapi.JNI.Telephony.JTrafficDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JTrafficDescriptor_Builder', TypeInfo(Androidapi.JNI.Telephony.JTrafficDescriptor_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JUrspRule', TypeInfo(Androidapi.JNI.Telephony.JUrspRule));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JEmergencyNumber', TypeInfo(Androidapi.JNI.Telephony.JEmergencyNumber));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadableSubscription', TypeInfo(Androidapi.JNI.Telephony.JDownloadableSubscription));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadableSubscription_Builder', TypeInfo(Androidapi.JNI.Telephony.JDownloadableSubscription_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JEuiccInfo', TypeInfo(Androidapi.JNI.Telephony.JEuiccInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JEuiccManager', TypeInfo(Androidapi.JNI.Telephony.JEuiccManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JGsmCellLocation', TypeInfo(Androidapi.JNI.Telephony.JGsmCellLocation));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jgsm_SmsManager', TypeInfo(Androidapi.JNI.Telephony.Jgsm_SmsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jgsm_SmsMessage', TypeInfo(Androidapi.JNI.Telephony.Jgsm_SmsMessage));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jgsm_SmsMessage_MessageClass', TypeInfo(Androidapi.JNI.Telephony.Jgsm_SmsMessage_MessageClass));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jgsm_SmsMessage_SubmitPdu', TypeInfo(Androidapi.JNI.Telephony.Jgsm_SmsMessage_SubmitPdu));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsException', TypeInfo(Androidapi.JNI.Telephony.JImsException));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsManager', TypeInfo(Androidapi.JNI.Telephony.JImsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsMmTelManager', TypeInfo(Androidapi.JNI.Telephony.JImsMmTelManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsMmTelManager_CapabilityCallback', TypeInfo(Androidapi.JNI.Telephony.JImsMmTelManager_CapabilityCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsRcsManager', TypeInfo(Androidapi.JNI.Telephony.JImsRcsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsReasonInfo', TypeInfo(Androidapi.JNI.Telephony.JImsReasonInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsRegistrationAttributes', TypeInfo(Androidapi.JNI.Telephony.JImsRegistrationAttributes));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsStateCallback', TypeInfo(Androidapi.JNI.Telephony.JImsStateCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JProvisioningManager', TypeInfo(Androidapi.JNI.Telephony.JProvisioningManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JProvisioningManager_FeatureProvisioningCallback', TypeInfo(Androidapi.JNI.Telephony.JProvisioningManager_FeatureProvisioningCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JRcsUceAdapter', TypeInfo(Androidapi.JNI.Telephony.JRcsUceAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JRegistrationManager', TypeInfo(Androidapi.JNI.Telephony.JRegistrationManager));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JRegistrationManager_RegistrationCallback', TypeInfo(Androidapi.JNI.Telephony.JRegistrationManager_RegistrationCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMmTelFeature', TypeInfo(Androidapi.JNI.Telephony.JMmTelFeature));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMmTelFeature_MmTelCapabilities', TypeInfo(Androidapi.JNI.Telephony.JMmTelFeature_MmTelCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JImsRegistrationImplBase', TypeInfo(Androidapi.JNI.Telephony.JImsRegistrationImplBase));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadProgressListener', TypeInfo(Androidapi.JNI.Telephony.JDownloadProgressListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadRequest', TypeInfo(Androidapi.JNI.Telephony.JDownloadRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadRequest_Builder', TypeInfo(Androidapi.JNI.Telephony.JDownloadRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JDownloadStatusListener', TypeInfo(Androidapi.JNI.Telephony.JDownloadStatusListener));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JFileInfo', TypeInfo(Androidapi.JNI.Telephony.JFileInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.Jmbms_ServiceInfo', TypeInfo(Androidapi.JNI.Telephony.Jmbms_ServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JFileServiceInfo', TypeInfo(Androidapi.JNI.Telephony.JFileServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JGroupCall', TypeInfo(Androidapi.JNI.Telephony.JGroupCall));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JGroupCallCallback', TypeInfo(Androidapi.JNI.Telephony.JGroupCallCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsDownloadReceiver', TypeInfo(Androidapi.JNI.Telephony.JMbmsDownloadReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsDownloadSessionCallback', TypeInfo(Androidapi.JNI.Telephony.JMbmsDownloadSessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors_DownloadErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors_DownloadErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors_GeneralErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors_GeneralErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors_GroupCallErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors_GroupCallErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors_InitializationErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors_InitializationErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsErrors_StreamingErrors', TypeInfo(Androidapi.JNI.Telephony.JMbmsErrors_StreamingErrors));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsGroupCallSessionCallback', TypeInfo(Androidapi.JNI.Telephony.JMbmsGroupCallSessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JMbmsStreamingSessionCallback', TypeInfo(Androidapi.JNI.Telephony.JMbmsStreamingSessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JStreamingService', TypeInfo(Androidapi.JNI.Telephony.JStreamingService));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JStreamingServiceCallback', TypeInfo(Androidapi.JNI.Telephony.JStreamingServiceCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Telephony.JStreamingServiceInfo', TypeInfo(Androidapi.JNI.Telephony.JStreamingServiceInfo));
end;

initialization
  RegisterTypes;
end.


