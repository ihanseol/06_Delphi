{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Net;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Java.Net,
  Androidapi.JNI.Java.Security,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JCaptivePortal = interface;//android.net.CaptivePortal
  JConnectivityDiagnosticsManager = interface;//android.net.ConnectivityDiagnosticsManager
  JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback = interface;//android.net.ConnectivityDiagnosticsManager$ConnectivityDiagnosticsCallback
  JConnectivityDiagnosticsManager_ConnectivityReport = interface;//android.net.ConnectivityDiagnosticsManager$ConnectivityReport
  JConnectivityDiagnosticsManager_DataStallReport = interface;//android.net.ConnectivityDiagnosticsManager$DataStallReport
  JConnectivityManager = interface;//android.net.ConnectivityManager
  JConnectivityManager_NetworkCallback = interface;//android.net.ConnectivityManager$NetworkCallback
  JConnectivityManager_OnNetworkActiveListener = interface;//android.net.ConnectivityManager$OnNetworkActiveListener
  Jnet_Credentials = interface;//android.net.Credentials
  JDhcpInfo = interface;//android.net.DhcpInfo
  JDnsResolver = interface;//android.net.DnsResolver
  JDnsResolver_Callback = interface;//android.net.DnsResolver$Callback
  JDnsResolver_DnsException = interface;//android.net.DnsResolver$DnsException
  JNetworkSpecifier = interface;//android.net.NetworkSpecifier
  JEthernetNetworkSpecifier = interface;//android.net.EthernetNetworkSpecifier
  JPlatformVpnProfile = interface;//android.net.PlatformVpnProfile
  JIkev2VpnProfile = interface;//android.net.Ikev2VpnProfile
  JIkev2VpnProfile_Builder = interface;//android.net.Ikev2VpnProfile$Builder
  JInetAddresses = interface;//android.net.InetAddresses
  JIpConfiguration = interface;//android.net.IpConfiguration
  JIpConfiguration_Builder = interface;//android.net.IpConfiguration$Builder
  JIpPrefix = interface;//android.net.IpPrefix
  JIpSecAlgorithm = interface;//android.net.IpSecAlgorithm
  JIpSecManager = interface;//android.net.IpSecManager
  JIpSecManager_ResourceUnavailableException = interface;//android.net.IpSecManager$ResourceUnavailableException
  JIpSecManager_SecurityParameterIndex = interface;//android.net.IpSecManager$SecurityParameterIndex
  JIpSecManager_SpiUnavailableException = interface;//android.net.IpSecManager$SpiUnavailableException
  JIpSecManager_UdpEncapsulationSocket = interface;//android.net.IpSecManager$UdpEncapsulationSocket
  JIpSecTransform = interface;//android.net.IpSecTransform
  JIpSecTransform_Builder = interface;//android.net.IpSecTransform$Builder
  JLinkAddress = interface;//android.net.LinkAddress
  JLinkProperties = interface;//android.net.LinkProperties
  JLocalServerSocket = interface;//android.net.LocalServerSocket
  JLocalSocket = interface;//android.net.LocalSocket
  JLocalSocketAddress = interface;//android.net.LocalSocketAddress
  JLocalSocketAddress_Namespace = interface;//android.net.LocalSocketAddress$Namespace
  JMacAddress = interface;//android.net.MacAddress
  JMailTo = interface;//android.net.MailTo
  JNetwork = interface;//android.net.Network
  JNetworkBadging = interface;//android.net.NetworkBadging
  JNetworkBadging_Badging = interface;//android.net.NetworkBadging$Badging
  JNetworkCapabilities = interface;//android.net.NetworkCapabilities
  JNetworkInfo = interface;//android.net.NetworkInfo
  JNetworkInfo_DetailedState = interface;//android.net.NetworkInfo$DetailedState
  JNetworkInfo_State = interface;//android.net.NetworkInfo$State
  JNetworkRequest = interface;//android.net.NetworkRequest
  JNetworkRequest_Builder = interface;//android.net.NetworkRequest$Builder
  Jnet_ParseException = interface;//android.net.ParseException
  Jnet_Proxy = interface;//android.net.Proxy
  JProxyInfo = interface;//android.net.ProxyInfo
  Jnet_RouteInfo = interface;//android.net.RouteInfo
  JSSLCertificateSocketFactory = interface;//android.net.SSLCertificateSocketFactory
  JSSLSessionCache = interface;//android.net.SSLSessionCache
  JSocketKeepalive = interface;//android.net.SocketKeepalive
  JSocketKeepalive_Callback = interface;//android.net.SocketKeepalive$Callback
  JStaticIpConfiguration = interface;//android.net.StaticIpConfiguration
  JStaticIpConfiguration_Builder = interface;//android.net.StaticIpConfiguration$Builder
  JTelephonyNetworkSpecifier = interface;//android.net.TelephonyNetworkSpecifier
  JTelephonyNetworkSpecifier_Builder = interface;//android.net.TelephonyNetworkSpecifier$Builder
  JTrafficStats = interface;//android.net.TrafficStats
  JTransportInfo = interface;//android.net.TransportInfo
  Jnet_Uri = interface;//android.net.Uri
  JUri_Builder = interface;//android.net.Uri$Builder
  JUrlQuerySanitizer = interface;//android.net.UrlQuerySanitizer
  JUrlQuerySanitizer_IllegalCharacterValueSanitizer = interface;//android.net.UrlQuerySanitizer$IllegalCharacterValueSanitizer
  JUrlQuerySanitizer_ParameterValuePair = interface;//android.net.UrlQuerySanitizer$ParameterValuePair
  JUrlQuerySanitizer_ValueSanitizer = interface;//android.net.UrlQuerySanitizer$ValueSanitizer
  JVpnManager = interface;//android.net.VpnManager
  JVpnProfileState = interface;//android.net.VpnProfileState
  //JVpnService = interface;//android.net.VpnService
  JVpnService_Builder = interface;//android.net.VpnService$Builder
  JEapInfo = interface;//android.net.eap.EapInfo
  JEapAkaInfo = interface;//android.net.eap.EapAkaInfo
  JEapAkaInfo_Builder = interface;//android.net.eap.EapAkaInfo$Builder
  JEapSessionConfig = interface;//android.net.eap.EapSessionConfig
  JEapSessionConfig_Builder = interface;//android.net.eap.EapSessionConfig$Builder
  JEapSessionConfig_EapAkaConfig = interface;//android.net.eap.EapSessionConfig$EapAkaConfig
  JEapSessionConfig_EapAkaOption = interface;//android.net.eap.EapSessionConfig$EapAkaOption
  JEapAkaOption_Builder = interface;//android.net.eap.EapSessionConfig$EapAkaOption$Builder
  JEapSessionConfig_EapAkaPrimeConfig = interface;//android.net.eap.EapSessionConfig$EapAkaPrimeConfig
  JEapSessionConfig_EapMethodConfig = interface;//android.net.eap.EapSessionConfig$EapMethodConfig
  JEapSessionConfig_EapMsChapV2Config = interface;//android.net.eap.EapSessionConfig$EapMsChapV2Config
  JEapSessionConfig_EapSimConfig = interface;//android.net.eap.EapSessionConfig$EapSimConfig
  JEapSessionConfig_EapTtlsConfig = interface;//android.net.eap.EapSessionConfig$EapTtlsConfig
  JHttpResponseCache = interface;//android.net.http.HttpResponseCache
  JSslCertificate = interface;//android.net.http.SslCertificate
  JSslCertificate_DName = interface;//android.net.http.SslCertificate$DName
  JSslError = interface;//android.net.http.SslError
  JX509TrustManagerExtensions = interface;//android.net.http.X509TrustManagerExtensions
  JSaProposal = interface;//android.net.ipsec.ike.SaProposal
  JChildSaProposal = interface;//android.net.ipsec.ike.ChildSaProposal
  JChildSaProposal_Builder = interface;//android.net.ipsec.ike.ChildSaProposal$Builder
  JChildSessionCallback = interface;//android.net.ipsec.ike.ChildSessionCallback
  JChildSessionConfiguration = interface;//android.net.ipsec.ike.ChildSessionConfiguration
  JChildSessionConfiguration_Builder = interface;//android.net.ipsec.ike.ChildSessionConfiguration$Builder
  JChildSessionParams = interface;//android.net.ipsec.ike.ChildSessionParams
  JIkeIdentification = interface;//android.net.ipsec.ike.IkeIdentification
  JIkeDerAsn1DnIdentification = interface;//android.net.ipsec.ike.IkeDerAsn1DnIdentification
  JIkeFqdnIdentification = interface;//android.net.ipsec.ike.IkeFqdnIdentification
  JIkeIpv4AddrIdentification = interface;//android.net.ipsec.ike.IkeIpv4AddrIdentification
  JIkeIpv6AddrIdentification = interface;//android.net.ipsec.ike.IkeIpv6AddrIdentification
  JIkeKeyIdIdentification = interface;//android.net.ipsec.ike.IkeKeyIdIdentification
  JIkeRfc822AddrIdentification = interface;//android.net.ipsec.ike.IkeRfc822AddrIdentification
  JIkeSaProposal = interface;//android.net.ipsec.ike.IkeSaProposal
  JIkeSaProposal_Builder = interface;//android.net.ipsec.ike.IkeSaProposal$Builder
  JIkeSession = interface;//android.net.ipsec.ike.IkeSession
  JIkeSessionCallback = interface;//android.net.ipsec.ike.IkeSessionCallback
  JIkeSessionConfiguration = interface;//android.net.ipsec.ike.IkeSessionConfiguration
  JIkeSessionConfiguration_Builder = interface;//android.net.ipsec.ike.IkeSessionConfiguration$Builder
  JIkeSessionConnectionInfo = interface;//android.net.ipsec.ike.IkeSessionConnectionInfo
  JIkeSessionParams = interface;//android.net.ipsec.ike.IkeSessionParams
  JIkeSessionParams_Builder = interface;//android.net.ipsec.ike.IkeSessionParams$Builder
  JIkeSessionParams_IkeAuthConfig = interface;//android.net.ipsec.ike.IkeSessionParams$IkeAuthConfig
  JIkeSessionParams_IkeAuthDigitalSignLocalConfig = interface;//android.net.ipsec.ike.IkeSessionParams$IkeAuthDigitalSignLocalConfig
  JIkeSessionParams_IkeAuthDigitalSignRemoteConfig = interface;//android.net.ipsec.ike.IkeSessionParams$IkeAuthDigitalSignRemoteConfig
  JIkeSessionParams_IkeAuthEapConfig = interface;//android.net.ipsec.ike.IkeSessionParams$IkeAuthEapConfig
  JIkeSessionParams_IkeAuthPskConfig = interface;//android.net.ipsec.ike.IkeSessionParams$IkeAuthPskConfig
  JIkeTrafficSelector = interface;//android.net.ipsec.ike.IkeTrafficSelector
  JIkeTunnelConnectionParams = interface;//android.net.ipsec.ike.IkeTunnelConnectionParams
  JTransportModeChildSessionParams = interface;//android.net.ipsec.ike.TransportModeChildSessionParams
  JTransportModeChildSessionParams_Builder = interface;//android.net.ipsec.ike.TransportModeChildSessionParams$Builder
  JTunnelModeChildSessionParams = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams
  JTunnelModeChildSessionParams_Builder = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$Builder
  JTunnelModeChildSessionParams_TunnelModeChildConfigRequest = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$TunnelModeChildConfigRequest
  JTunnelModeChildSessionParams_ConfigRequestIpv4Address = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv4Address
  JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv4DhcpServer
  JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv4DnsServer
  JTunnelModeChildSessionParams_ConfigRequestIpv4Netmask = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv4Netmask
  JTunnelModeChildSessionParams_ConfigRequestIpv6Address = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv6Address
  JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer = interface;//android.net.ipsec.ike.TunnelModeChildSessionParams$ConfigRequestIpv6DnsServer
  JIkeException = interface;//android.net.ipsec.ike.exceptions.IkeException
  JIkeNonProtocolException = interface;//android.net.ipsec.ike.exceptions.IkeNonProtocolException
  JIkeIOException = interface;//android.net.ipsec.ike.exceptions.IkeIOException
  JIkeInternalException = interface;//android.net.ipsec.ike.exceptions.IkeInternalException
  JIkeNetworkLostException = interface;//android.net.ipsec.ike.exceptions.IkeNetworkLostException
  JIkeProtocolException = interface;//android.net.ipsec.ike.exceptions.IkeProtocolException
  JIkeTimeoutException = interface;//android.net.ipsec.ike.exceptions.IkeTimeoutException
  JInvalidKeException = interface;//android.net.ipsec.ike.exceptions.InvalidKeException
  JInvalidMajorVersionException = interface;//android.net.ipsec.ike.exceptions.InvalidMajorVersionException
  JInvalidSelectorsException = interface;//android.net.ipsec.ike.exceptions.InvalidSelectorsException
  JNsdManager = interface;//android.net.nsd.NsdManager
  JNsdManager_DiscoveryListener = interface;//android.net.nsd.NsdManager$DiscoveryListener
  JNsdManager_RegistrationListener = interface;//android.net.nsd.NsdManager$RegistrationListener
  JNsdManager_ResolveListener = interface;//android.net.nsd.NsdManager$ResolveListener
  JNsdServiceInfo = interface;//android.net.nsd.NsdServiceInfo
  JAudioCodec = interface;//android.net.rtp.AudioCodec
  JAudioGroup = interface;//android.net.rtp.AudioGroup
  JRtpStream = interface;//android.net.rtp.RtpStream
  JAudioStream = interface;//android.net.rtp.AudioStream
  JSipAudioCall = interface;//android.net.sip.SipAudioCall
  JSipAudioCall_Listener = interface;//android.net.sip.SipAudioCall$Listener
  JSipErrorCode = interface;//android.net.sip.SipErrorCode
  JSipException = interface;//android.net.sip.SipException
  JSipManager = interface;//android.net.sip.SipManager
  JSipProfile = interface;//android.net.sip.SipProfile
  JSipProfile_Builder = interface;//android.net.sip.SipProfile$Builder
  JSipRegistrationListener = interface;//android.net.sip.SipRegistrationListener
  JSipSession = interface;//android.net.sip.SipSession
  JSipSession_Listener = interface;//android.net.sip.SipSession$Listener
  JSipSession_State = interface;//android.net.sip.SipSession$State
  JSSLEngines = interface;//android.net.ssl.SSLEngines
  JSSLSockets = interface;//android.net.ssl.SSLSockets
  JVcnUnderlyingNetworkTemplate = interface;//android.net.vcn.VcnUnderlyingNetworkTemplate
  JVcnCellUnderlyingNetworkTemplate = interface;//android.net.vcn.VcnCellUnderlyingNetworkTemplate
  JVcnCellUnderlyingNetworkTemplate_Builder = interface;//android.net.vcn.VcnCellUnderlyingNetworkTemplate$Builder
  JVcnConfig = interface;//android.net.vcn.VcnConfig
  JVcnConfig_Builder = interface;//android.net.vcn.VcnConfig$Builder
  JVcnGatewayConnectionConfig = interface;//android.net.vcn.VcnGatewayConnectionConfig
  JVcnGatewayConnectionConfig_Builder = interface;//android.net.vcn.VcnGatewayConnectionConfig$Builder
  JVcnManager = interface;//android.net.vcn.VcnManager
  JVcnManager_VcnStatusCallback = interface;//android.net.vcn.VcnManager$VcnStatusCallback
  JVcnWifiUnderlyingNetworkTemplate = interface;//android.net.vcn.VcnWifiUnderlyingNetworkTemplate
  JVcnWifiUnderlyingNetworkTemplate_Builder = interface;//android.net.vcn.VcnWifiUnderlyingNetworkTemplate$Builder
  JEasyConnectStatusCallback = interface;//android.net.wifi.EasyConnectStatusCallback
  JMloLink = interface;//android.net.wifi.MloLink
  JScanResult = interface;//android.net.wifi.ScanResult
  JScanResult_InformationElement = interface;//android.net.wifi.ScanResult$InformationElement
  JSoftApConfiguration = interface;//android.net.wifi.SoftApConfiguration
  JSupplicantState = interface;//android.net.wifi.SupplicantState
  JWifiConfiguration = interface;//android.net.wifi.WifiConfiguration
  JWifiConfiguration_AuthAlgorithm = interface;//android.net.wifi.WifiConfiguration$AuthAlgorithm
  JWifiConfiguration_GroupCipher = interface;//android.net.wifi.WifiConfiguration$GroupCipher
  JWifiConfiguration_GroupMgmtCipher = interface;//android.net.wifi.WifiConfiguration$GroupMgmtCipher
  JWifiConfiguration_KeyMgmt = interface;//android.net.wifi.WifiConfiguration$KeyMgmt
  JWifiConfiguration_PairwiseCipher = interface;//android.net.wifi.WifiConfiguration$PairwiseCipher
  JWifiConfiguration_Protocol = interface;//android.net.wifi.WifiConfiguration$Protocol
  JWifiConfiguration_Status = interface;//android.net.wifi.WifiConfiguration$Status
  JWifiEnterpriseConfig = interface;//android.net.wifi.WifiEnterpriseConfig
  JWifiEnterpriseConfig_Eap = interface;//android.net.wifi.WifiEnterpriseConfig$Eap
  JWifiEnterpriseConfig_Phase2 = interface;//android.net.wifi.WifiEnterpriseConfig$Phase2
  JWifiInfo = interface;//android.net.wifi.WifiInfo
  JWifiInfo_Builder = interface;//android.net.wifi.WifiInfo$Builder
  JWifiManager = interface;//android.net.wifi.WifiManager
  JWifiManager_AddNetworkResult = interface;//android.net.wifi.WifiManager$AddNetworkResult
  JWifiManager_InterfaceCreationImpact = interface;//android.net.wifi.WifiManager$InterfaceCreationImpact
  JWifiManager_LocalOnlyHotspotCallback = interface;//android.net.wifi.WifiManager$LocalOnlyHotspotCallback
  JWifiManager_LocalOnlyHotspotReservation = interface;//android.net.wifi.WifiManager$LocalOnlyHotspotReservation
  JWifiManager_MulticastLock = interface;//android.net.wifi.WifiManager$MulticastLock
  JWifiManager_ScanResultsCallback = interface;//android.net.wifi.WifiManager$ScanResultsCallback
  JWifiManager_SubsystemRestartTrackingCallback = interface;//android.net.wifi.WifiManager$SubsystemRestartTrackingCallback
  JWifiManager_SuggestionConnectionStatusListener = interface;//android.net.wifi.WifiManager$SuggestionConnectionStatusListener
  JWifiManager_SuggestionUserApprovalStatusListener = interface;//android.net.wifi.WifiManager$SuggestionUserApprovalStatusListener
  JWifiManager_WifiLock = interface;//android.net.wifi.WifiManager$WifiLock
  JWifiManager_WpsCallback = interface;//android.net.wifi.WifiManager$WpsCallback
  JWifiNetworkSpecifier = interface;//android.net.wifi.WifiNetworkSpecifier
  JWifiNetworkSpecifier_Builder = interface;//android.net.wifi.WifiNetworkSpecifier$Builder
  JWifiNetworkSuggestion = interface;//android.net.wifi.WifiNetworkSuggestion
  JWifiNetworkSuggestion_Builder = interface;//android.net.wifi.WifiNetworkSuggestion$Builder
  JWifiSsid = interface;//android.net.wifi.WifiSsid
  JWpsInfo = interface;//android.net.wifi.WpsInfo
  JAttachCallback = interface;//android.net.wifi.aware.AttachCallback
  JAwareResources = interface;//android.net.wifi.aware.AwareResources
  JCharacteristics = interface;//android.net.wifi.aware.Characteristics
  JDiscoverySession = interface;//android.net.wifi.aware.DiscoverySession
  JDiscoverySessionCallback = interface;//android.net.wifi.aware.DiscoverySessionCallback
  JIdentityChangedListener = interface;//android.net.wifi.aware.IdentityChangedListener
  JPeerHandle = interface;//android.net.wifi.aware.PeerHandle
  JParcelablePeerHandle = interface;//android.net.wifi.aware.ParcelablePeerHandle
  JPublishConfig = interface;//android.net.wifi.aware.PublishConfig
  JPublishConfig_Builder = interface;//android.net.wifi.aware.PublishConfig$Builder
  JPublishDiscoverySession = interface;//android.net.wifi.aware.PublishDiscoverySession
  JServiceDiscoveryInfo = interface;//android.net.wifi.aware.ServiceDiscoveryInfo
  JSubscribeConfig = interface;//android.net.wifi.aware.SubscribeConfig
  JSubscribeConfig_Builder = interface;//android.net.wifi.aware.SubscribeConfig$Builder
  JSubscribeDiscoverySession = interface;//android.net.wifi.aware.SubscribeDiscoverySession
  JWifiAwareChannelInfo = interface;//android.net.wifi.aware.WifiAwareChannelInfo
  JWifiAwareDataPathSecurityConfig = interface;//android.net.wifi.aware.WifiAwareDataPathSecurityConfig
  JWifiAwareDataPathSecurityConfig_Builder = interface;//android.net.wifi.aware.WifiAwareDataPathSecurityConfig$Builder
  JWifiAwareManager = interface;//android.net.wifi.aware.WifiAwareManager
  JWifiAwareNetworkInfo = interface;//android.net.wifi.aware.WifiAwareNetworkInfo
  JWifiAwareNetworkSpecifier = interface;//android.net.wifi.aware.WifiAwareNetworkSpecifier
  JWifiAwareNetworkSpecifier_Builder = interface;//android.net.wifi.aware.WifiAwareNetworkSpecifier$Builder
  JWifiAwareSession = interface;//android.net.wifi.aware.WifiAwareSession
  JConfigParser = interface;//android.net.wifi.hotspot2.ConfigParser
  JPasspointConfiguration = interface;//android.net.wifi.hotspot2.PasspointConfiguration
  JPpsMoParser = interface;//android.net.wifi.hotspot2.omadm.PpsMoParser
  JCredential = interface;//android.net.wifi.hotspot2.pps.Credential
  JCredential_CertificateCredential = interface;//android.net.wifi.hotspot2.pps.Credential$CertificateCredential
  JCredential_SimCredential = interface;//android.net.wifi.hotspot2.pps.Credential$SimCredential
  JCredential_UserCredential = interface;//android.net.wifi.hotspot2.pps.Credential$UserCredential
  JHomeSp = interface;//android.net.wifi.hotspot2.pps.HomeSp
  JWifiP2pConfig = interface;//android.net.wifi.p2p.WifiP2pConfig
  JWifiP2pConfig_Builder = interface;//android.net.wifi.p2p.WifiP2pConfig$Builder
  JWifiP2pDevice = interface;//android.net.wifi.p2p.WifiP2pDevice
  JWifiP2pDeviceList = interface;//android.net.wifi.p2p.WifiP2pDeviceList
  JWifiP2pGroup = interface;//android.net.wifi.p2p.WifiP2pGroup
  JWifiP2pInfo = interface;//android.net.wifi.p2p.WifiP2pInfo
  JWifiP2pManager = interface;//android.net.wifi.p2p.WifiP2pManager
  JWifiP2pManager_ActionListener = interface;//android.net.wifi.p2p.WifiP2pManager$ActionListener
  JWifiP2pManager_Channel = interface;//android.net.wifi.p2p.WifiP2pManager$Channel
  JWifiP2pManager_ChannelListener = interface;//android.net.wifi.p2p.WifiP2pManager$ChannelListener
  JWifiP2pManager_ConnectionInfoListener = interface;//android.net.wifi.p2p.WifiP2pManager$ConnectionInfoListener
  JWifiP2pManager_DeviceInfoListener = interface;//android.net.wifi.p2p.WifiP2pManager$DeviceInfoListener
  JWifiP2pManager_DiscoveryStateListener = interface;//android.net.wifi.p2p.WifiP2pManager$DiscoveryStateListener
  JWifiP2pManager_DnsSdServiceResponseListener = interface;//android.net.wifi.p2p.WifiP2pManager$DnsSdServiceResponseListener
  JWifiP2pManager_DnsSdTxtRecordListener = interface;//android.net.wifi.p2p.WifiP2pManager$DnsSdTxtRecordListener
  JWifiP2pManager_ExternalApproverRequestListener = interface;//android.net.wifi.p2p.WifiP2pManager$ExternalApproverRequestListener
  JWifiP2pManager_GroupInfoListener = interface;//android.net.wifi.p2p.WifiP2pManager$GroupInfoListener
  JWifiP2pManager_NetworkInfoListener = interface;//android.net.wifi.p2p.WifiP2pManager$NetworkInfoListener
  JWifiP2pManager_P2pStateListener = interface;//android.net.wifi.p2p.WifiP2pManager$P2pStateListener
  JWifiP2pManager_PeerListListener = interface;//android.net.wifi.p2p.WifiP2pManager$PeerListListener
  JWifiP2pManager_ServiceResponseListener = interface;//android.net.wifi.p2p.WifiP2pManager$ServiceResponseListener
  JWifiP2pManager_UpnpServiceResponseListener = interface;//android.net.wifi.p2p.WifiP2pManager$UpnpServiceResponseListener
  JWifiP2pWfdInfo = interface;//android.net.wifi.p2p.WifiP2pWfdInfo
  JWifiP2pServiceInfo = interface;//android.net.wifi.p2p.nsd.WifiP2pServiceInfo
  JWifiP2pDnsSdServiceInfo = interface;//android.net.wifi.p2p.nsd.WifiP2pDnsSdServiceInfo
  JWifiP2pServiceRequest = interface;//android.net.wifi.p2p.nsd.WifiP2pServiceRequest
  JWifiP2pDnsSdServiceRequest = interface;//android.net.wifi.p2p.nsd.WifiP2pDnsSdServiceRequest
  JWifiP2pUpnpServiceInfo = interface;//android.net.wifi.p2p.nsd.WifiP2pUpnpServiceInfo
  JWifiP2pUpnpServiceRequest = interface;//android.net.wifi.p2p.nsd.WifiP2pUpnpServiceRequest
  JCivicLocationKeys = interface;//android.net.wifi.rtt.CivicLocationKeys
  JRangingRequest = interface;//android.net.wifi.rtt.RangingRequest
  JRangingRequest_Builder = interface;//android.net.wifi.rtt.RangingRequest$Builder
  JRangingResult = interface;//android.net.wifi.rtt.RangingResult
  JRangingResultCallback = interface;//android.net.wifi.rtt.RangingResultCallback
  JResponderConfig = interface;//android.net.wifi.rtt.ResponderConfig
  JResponderConfig_Builder = interface;//android.net.wifi.rtt.ResponderConfig$Builder
  JResponderLocation = interface;//android.net.wifi.rtt.ResponderLocation
  JWifiRttManager = interface;//android.net.wifi.rtt.WifiRttManager

// ===== Interface declarations =====

  JCaptivePortalClass = interface(JObjectClass)
    ['{7DFB7B36-59D5-405E-9DE8-E0DF58B16896}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/CaptivePortal')]
  JCaptivePortal = interface(JObject)
    ['{2AABBCBD-CDF6-4E74-90C4-EB9A987AA631}']
    function describeContents: Integer; cdecl;
    procedure ignoreNetwork; cdecl;
    procedure reportCaptivePortalDismissed; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJCaptivePortal = class(TJavaGenericImport<JCaptivePortalClass, JCaptivePortal>) end;

  JConnectivityDiagnosticsManagerClass = interface(JObjectClass)
    ['{87E33009-A829-4FF6-823A-453D2024674C}']
  end;

  [JavaSignature('android/net/ConnectivityDiagnosticsManager')]
  JConnectivityDiagnosticsManager = interface(JObject)
    ['{69B256F0-6A20-47FE-9F09-02BAD425C3FD}']
    procedure registerConnectivityDiagnosticsCallback(request: JNetworkRequest; e: JExecutor; callback: JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback); cdecl;
    procedure unregisterConnectivityDiagnosticsCallback(callback: JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback); cdecl;
  end;
  TJConnectivityDiagnosticsManager = class(TJavaGenericImport<JConnectivityDiagnosticsManagerClass, JConnectivityDiagnosticsManager>) end;

  JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallbackClass = interface(JObjectClass)
    ['{0533B50B-CECE-448F-9470-66EF3E4016A4}']
    {class} function init: JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback; cdecl;
  end;

  [JavaSignature('android/net/ConnectivityDiagnosticsManager$ConnectivityDiagnosticsCallback')]
  JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback = interface(JObject)
    ['{2BB784B6-D3B9-4F3E-8D52-9EAFB359ED94}']
    procedure onConnectivityReportAvailable(report: JConnectivityDiagnosticsManager_ConnectivityReport); cdecl;
    procedure onDataStallSuspected(report: JConnectivityDiagnosticsManager_DataStallReport); cdecl;
    procedure onNetworkConnectivityReported(network: JNetwork; hasConnectivity: Boolean); cdecl;
  end;
  TJConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback = class(TJavaGenericImport<JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallbackClass, JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback>) end;

  JConnectivityDiagnosticsManager_ConnectivityReportClass = interface(JObjectClass)
    ['{76649667-B28C-4B08-89B6-48A9EE82E3CB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetKEY_NETWORK_PROBES_ATTEMPTED_BITMASK: JString; cdecl;
    {class} function _GetKEY_NETWORK_PROBES_SUCCEEDED_BITMASK: JString; cdecl;
    {class} function _GetKEY_NETWORK_VALIDATION_RESULT: JString; cdecl;
    {class} function _GetNETWORK_PROBE_DNS: Integer; cdecl;
    {class} function _GetNETWORK_PROBE_FALLBACK: Integer; cdecl;
    {class} function _GetNETWORK_PROBE_HTTP: Integer; cdecl;
    {class} function _GetNETWORK_PROBE_HTTPS: Integer; cdecl;
    {class} function _GetNETWORK_PROBE_PRIVATE_DNS: Integer; cdecl;
    {class} function _GetNETWORK_VALIDATION_RESULT_INVALID: Integer; cdecl;
    {class} function _GetNETWORK_VALIDATION_RESULT_PARTIALLY_VALID: Integer; cdecl;
    {class} function _GetNETWORK_VALIDATION_RESULT_SKIPPED: Integer; cdecl;
    {class} function _GetNETWORK_VALIDATION_RESULT_VALID: Integer; cdecl;
    {class} function init(network: JNetwork; reportTimestamp: Int64; linkProperties: JLinkProperties; networkCapabilities: JNetworkCapabilities; additionalInfo: JPersistableBundle): JConnectivityDiagnosticsManager_ConnectivityReport; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property KEY_NETWORK_PROBES_ATTEMPTED_BITMASK: JString read _GetKEY_NETWORK_PROBES_ATTEMPTED_BITMASK;
    {class} property KEY_NETWORK_PROBES_SUCCEEDED_BITMASK: JString read _GetKEY_NETWORK_PROBES_SUCCEEDED_BITMASK;
    {class} property KEY_NETWORK_VALIDATION_RESULT: JString read _GetKEY_NETWORK_VALIDATION_RESULT;
    {class} property NETWORK_PROBE_DNS: Integer read _GetNETWORK_PROBE_DNS;
    {class} property NETWORK_PROBE_FALLBACK: Integer read _GetNETWORK_PROBE_FALLBACK;
    {class} property NETWORK_PROBE_HTTP: Integer read _GetNETWORK_PROBE_HTTP;
    {class} property NETWORK_PROBE_HTTPS: Integer read _GetNETWORK_PROBE_HTTPS;
    {class} property NETWORK_PROBE_PRIVATE_DNS: Integer read _GetNETWORK_PROBE_PRIVATE_DNS;
    {class} property NETWORK_VALIDATION_RESULT_INVALID: Integer read _GetNETWORK_VALIDATION_RESULT_INVALID;
    {class} property NETWORK_VALIDATION_RESULT_PARTIALLY_VALID: Integer read _GetNETWORK_VALIDATION_RESULT_PARTIALLY_VALID;
    {class} property NETWORK_VALIDATION_RESULT_SKIPPED: Integer read _GetNETWORK_VALIDATION_RESULT_SKIPPED;
    {class} property NETWORK_VALIDATION_RESULT_VALID: Integer read _GetNETWORK_VALIDATION_RESULT_VALID;
  end;

  [JavaSignature('android/net/ConnectivityDiagnosticsManager$ConnectivityReport')]
  JConnectivityDiagnosticsManager_ConnectivityReport = interface(JObject)
    ['{5AE53C8F-7A33-4B04-B92A-BCA04167429A}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAdditionalInfo: JPersistableBundle; cdecl;
    function getLinkProperties: JLinkProperties; cdecl;
    function getNetwork: JNetwork; cdecl;
    function getNetworkCapabilities: JNetworkCapabilities; cdecl;
    function getReportTimestamp: Int64; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJConnectivityDiagnosticsManager_ConnectivityReport = class(TJavaGenericImport<JConnectivityDiagnosticsManager_ConnectivityReportClass, JConnectivityDiagnosticsManager_ConnectivityReport>) end;

  JConnectivityDiagnosticsManager_DataStallReportClass = interface(JObjectClass)
    ['{5990E55B-DFA3-4567-9E39-57104A666886}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDETECTION_METHOD_DNS_EVENTS: Integer; cdecl;
    {class} function _GetDETECTION_METHOD_TCP_METRICS: Integer; cdecl;
    {class} function _GetKEY_DNS_CONSECUTIVE_TIMEOUTS: JString; cdecl;
    {class} function _GetKEY_TCP_METRICS_COLLECTION_PERIOD_MILLIS: JString; cdecl;
    {class} function _GetKEY_TCP_PACKET_FAIL_RATE: JString; cdecl;
    {class} function init(network: JNetwork; reportTimestamp: Int64; detectionMethod: Integer; linkProperties: JLinkProperties; networkCapabilities: JNetworkCapabilities; stallDetails: JPersistableBundle): JConnectivityDiagnosticsManager_DataStallReport; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DETECTION_METHOD_DNS_EVENTS: Integer read _GetDETECTION_METHOD_DNS_EVENTS;
    {class} property DETECTION_METHOD_TCP_METRICS: Integer read _GetDETECTION_METHOD_TCP_METRICS;
    {class} property KEY_DNS_CONSECUTIVE_TIMEOUTS: JString read _GetKEY_DNS_CONSECUTIVE_TIMEOUTS;
    {class} property KEY_TCP_METRICS_COLLECTION_PERIOD_MILLIS: JString read _GetKEY_TCP_METRICS_COLLECTION_PERIOD_MILLIS;
    {class} property KEY_TCP_PACKET_FAIL_RATE: JString read _GetKEY_TCP_PACKET_FAIL_RATE;
  end;

  [JavaSignature('android/net/ConnectivityDiagnosticsManager$DataStallReport')]
  JConnectivityDiagnosticsManager_DataStallReport = interface(JObject)
    ['{0BD4AAAC-96A2-47C4-A0D4-E59F51D6998C}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDetectionMethod: Integer; cdecl;
    function getLinkProperties: JLinkProperties; cdecl;
    function getNetwork: JNetwork; cdecl;
    function getNetworkCapabilities: JNetworkCapabilities; cdecl;
    function getReportTimestamp: Int64; cdecl;
    function getStallDetails: JPersistableBundle; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJConnectivityDiagnosticsManager_DataStallReport = class(TJavaGenericImport<JConnectivityDiagnosticsManager_DataStallReportClass, JConnectivityDiagnosticsManager_DataStallReport>) end;

  JConnectivityManagerClass = interface(JObjectClass)
    ['{BEFD9BFE-5C37-4A44-9EF3-E194A9046AC1}']
    {class} function _GetACTION_BACKGROUND_DATA_SETTING_CHANGED: JString; cdecl;
    {class} function _GetACTION_CAPTIVE_PORTAL_SIGN_IN: JString; cdecl;
    {class} function _GetACTION_RESTRICT_BACKGROUND_CHANGED: JString; cdecl;
    {class} function _GetCONNECTIVITY_ACTION: JString; cdecl;
    {class} function _GetDEFAULT_NETWORK_PREFERENCE: Integer; cdecl;
    {class} function _GetEXTRA_CAPTIVE_PORTAL: JString; cdecl;
    {class} function _GetEXTRA_CAPTIVE_PORTAL_URL: JString; cdecl;
    {class} function _GetEXTRA_EXTRA_INFO: JString; cdecl;
    {class} function _GetEXTRA_IS_FAILOVER: JString; cdecl;
    {class} function _GetEXTRA_NETWORK: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_INFO: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_REQUEST: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_TYPE: JString; cdecl;
    {class} function _GetEXTRA_NO_CONNECTIVITY: JString; cdecl;
    {class} function _GetEXTRA_OTHER_NETWORK_INFO: JString; cdecl;
    {class} function _GetEXTRA_REASON: JString; cdecl;
    {class} function _GetMULTIPATH_PREFERENCE_HANDOVER: Integer; cdecl;
    {class} function _GetMULTIPATH_PREFERENCE_PERFORMANCE: Integer; cdecl;
    {class} function _GetMULTIPATH_PREFERENCE_RELIABILITY: Integer; cdecl;
    {class} function _GetRESTRICT_BACKGROUND_STATUS_DISABLED: Integer; cdecl;
    {class} function _GetRESTRICT_BACKGROUND_STATUS_ENABLED: Integer; cdecl;
    {class} function _GetRESTRICT_BACKGROUND_STATUS_WHITELISTED: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH: Integer; cdecl;
    {class} function _GetTYPE_DUMMY: Integer; cdecl;
    {class} function _GetTYPE_ETHERNET: Integer; cdecl;
    {class} function _GetTYPE_MOBILE: Integer; cdecl;
    {class} function _GetTYPE_MOBILE_DUN: Integer; cdecl;
    {class} function _GetTYPE_MOBILE_HIPRI: Integer; cdecl;
    {class} function _GetTYPE_MOBILE_MMS: Integer; cdecl;
    {class} function _GetTYPE_MOBILE_SUPL: Integer; cdecl;
    {class} function _GetTYPE_VPN: Integer; cdecl;
    {class} function _GetTYPE_WIFI: Integer; cdecl;
    {class} function _GetTYPE_WIMAX: Integer; cdecl;
    {class} function getProcessDefaultNetwork: JNetwork; cdecl;//Deprecated
    {class} function isNetworkTypeValid(networkType: Integer): Boolean; cdecl;//Deprecated
    {class} function setProcessDefaultNetwork(network: JNetwork): Boolean; cdecl;//Deprecated
    {class} property ACTION_BACKGROUND_DATA_SETTING_CHANGED: JString read _GetACTION_BACKGROUND_DATA_SETTING_CHANGED;
    {class} property ACTION_CAPTIVE_PORTAL_SIGN_IN: JString read _GetACTION_CAPTIVE_PORTAL_SIGN_IN;
    {class} property ACTION_RESTRICT_BACKGROUND_CHANGED: JString read _GetACTION_RESTRICT_BACKGROUND_CHANGED;
    {class} property CONNECTIVITY_ACTION: JString read _GetCONNECTIVITY_ACTION;
    {class} property DEFAULT_NETWORK_PREFERENCE: Integer read _GetDEFAULT_NETWORK_PREFERENCE;
    {class} property EXTRA_CAPTIVE_PORTAL: JString read _GetEXTRA_CAPTIVE_PORTAL;
    {class} property EXTRA_CAPTIVE_PORTAL_URL: JString read _GetEXTRA_CAPTIVE_PORTAL_URL;
    {class} property EXTRA_EXTRA_INFO: JString read _GetEXTRA_EXTRA_INFO;
    {class} property EXTRA_IS_FAILOVER: JString read _GetEXTRA_IS_FAILOVER;
    {class} property EXTRA_NETWORK: JString read _GetEXTRA_NETWORK;
    {class} property EXTRA_NETWORK_INFO: JString read _GetEXTRA_NETWORK_INFO;
    {class} property EXTRA_NETWORK_REQUEST: JString read _GetEXTRA_NETWORK_REQUEST;
    {class} property EXTRA_NETWORK_TYPE: JString read _GetEXTRA_NETWORK_TYPE;
    {class} property EXTRA_NO_CONNECTIVITY: JString read _GetEXTRA_NO_CONNECTIVITY;
    {class} property EXTRA_OTHER_NETWORK_INFO: JString read _GetEXTRA_OTHER_NETWORK_INFO;
    {class} property EXTRA_REASON: JString read _GetEXTRA_REASON;
    {class} property MULTIPATH_PREFERENCE_HANDOVER: Integer read _GetMULTIPATH_PREFERENCE_HANDOVER;
    {class} property MULTIPATH_PREFERENCE_PERFORMANCE: Integer read _GetMULTIPATH_PREFERENCE_PERFORMANCE;
    {class} property MULTIPATH_PREFERENCE_RELIABILITY: Integer read _GetMULTIPATH_PREFERENCE_RELIABILITY;
    {class} property RESTRICT_BACKGROUND_STATUS_DISABLED: Integer read _GetRESTRICT_BACKGROUND_STATUS_DISABLED;
    {class} property RESTRICT_BACKGROUND_STATUS_ENABLED: Integer read _GetRESTRICT_BACKGROUND_STATUS_ENABLED;
    {class} property RESTRICT_BACKGROUND_STATUS_WHITELISTED: Integer read _GetRESTRICT_BACKGROUND_STATUS_WHITELISTED;
    {class} property TYPE_BLUETOOTH: Integer read _GetTYPE_BLUETOOTH;
    {class} property TYPE_DUMMY: Integer read _GetTYPE_DUMMY;
    {class} property TYPE_ETHERNET: Integer read _GetTYPE_ETHERNET;
    {class} property TYPE_MOBILE: Integer read _GetTYPE_MOBILE;
    {class} property TYPE_MOBILE_DUN: Integer read _GetTYPE_MOBILE_DUN;
    {class} property TYPE_MOBILE_HIPRI: Integer read _GetTYPE_MOBILE_HIPRI;
    {class} property TYPE_MOBILE_MMS: Integer read _GetTYPE_MOBILE_MMS;
    {class} property TYPE_MOBILE_SUPL: Integer read _GetTYPE_MOBILE_SUPL;
    {class} property TYPE_VPN: Integer read _GetTYPE_VPN;
    {class} property TYPE_WIFI: Integer read _GetTYPE_WIFI;
    {class} property TYPE_WIMAX: Integer read _GetTYPE_WIMAX;
  end;

  [JavaSignature('android/net/ConnectivityManager')]
  JConnectivityManager = interface(JObject)
    ['{B3A3E3BA-1E2F-4634-9E54-79F414E0813A}']
    procedure addDefaultNetworkActiveListener(l: JConnectivityManager_OnNetworkActiveListener); cdecl;
    function bindProcessToNetwork(network: JNetwork): Boolean; cdecl;
    function createSocketKeepalive(network: JNetwork; socket: JIpSecManager_UdpEncapsulationSocket; source: JInetAddress; destination: JInetAddress; executor: JExecutor; callback: JSocketKeepalive_Callback): JSocketKeepalive; cdecl;
    function getActiveNetwork: JNetwork; cdecl;
    function getActiveNetworkInfo: JNetworkInfo; cdecl;//Deprecated
    function getAllNetworkInfo: TJavaObjectArray<JNetworkInfo>; cdecl;//Deprecated
    function getAllNetworks: TJavaObjectArray<JNetwork>; cdecl;//Deprecated
    function getBackgroundDataSetting: Boolean; cdecl;//Deprecated
    function getBoundNetworkForProcess: JNetwork; cdecl;
    function getConnectionOwnerUid(protocol: Integer; local: JInetSocketAddress; remote: JInetSocketAddress): Integer; cdecl;
    function getDefaultProxy: JProxyInfo; cdecl;
    function getLinkProperties(network: JNetwork): JLinkProperties; cdecl;
    function getMultipathPreference(network: JNetwork): Integer; cdecl;
    function getNetworkCapabilities(network: JNetwork): JNetworkCapabilities; cdecl;
    function getNetworkInfo(networkType: Integer): JNetworkInfo; cdecl; overload;//Deprecated
    function getNetworkInfo(network: JNetwork): JNetworkInfo; cdecl; overload;//Deprecated
    function getNetworkPreference: Integer; cdecl;//Deprecated
    function getNetworkWatchlistConfigHash: TJavaArray<Byte>; cdecl;
    function getRestrictBackgroundStatus: Integer; cdecl;
    function isActiveNetworkMetered: Boolean; cdecl;
    function isDefaultNetworkActive: Boolean; cdecl;
    procedure registerBestMatchingNetworkCallback(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback; handler: JHandler); cdecl;
    procedure registerDefaultNetworkCallback(networkCallback: JConnectivityManager_NetworkCallback); cdecl; overload;
    procedure registerDefaultNetworkCallback(networkCallback: JConnectivityManager_NetworkCallback; handler: JHandler); cdecl; overload;
    procedure registerNetworkCallback(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback); cdecl; overload;
    procedure registerNetworkCallback(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback; handler: JHandler); cdecl; overload;
    //procedure registerNetworkCallback(request: JNetworkRequest; operation: JPendingIntent); cdecl; overload;
    //procedure releaseNetworkRequest(operation: JPendingIntent); cdecl;
    procedure removeDefaultNetworkActiveListener(l: JConnectivityManager_OnNetworkActiveListener); cdecl;
    procedure reportBadNetwork(network: JNetwork); cdecl;//Deprecated
    procedure reportNetworkConnectivity(network: JNetwork; hasConnectivity: Boolean); cdecl;
    function requestBandwidthUpdate(network: JNetwork): Boolean; cdecl;
    procedure requestNetwork(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback); cdecl; overload;
    procedure requestNetwork(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback; handler: JHandler); cdecl; overload;
    procedure requestNetwork(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback; timeoutMs: Integer); cdecl; overload;
    procedure requestNetwork(request: JNetworkRequest; networkCallback: JConnectivityManager_NetworkCallback; handler: JHandler; timeoutMs: Integer); cdecl; overload;
    //procedure requestNetwork(request: JNetworkRequest; operation: JPendingIntent); cdecl; overload;
    function requestRouteToHost(networkType: Integer; hostAddress: Integer): Boolean; cdecl;//Deprecated
    procedure setNetworkPreference(preference: Integer); cdecl;//Deprecated
    function startUsingNetworkFeature(networkType: Integer; feature: JString): Integer; cdecl;//Deprecated
    function stopUsingNetworkFeature(networkType: Integer; feature: JString): Integer; cdecl;//Deprecated
    procedure unregisterNetworkCallback(networkCallback: JConnectivityManager_NetworkCallback); cdecl; overload;
    //procedure unregisterNetworkCallback(operation: JPendingIntent); cdecl; overload;
  end;
  TJConnectivityManager = class(TJavaGenericImport<JConnectivityManagerClass, JConnectivityManager>) end;

  JConnectivityManager_NetworkCallbackClass = interface(JObjectClass)
    ['{FACA61E5-51BE-40EE-926D-4B9CC89C753A}']
    {class} function _GetFLAG_INCLUDE_LOCATION_INFO: Integer; cdecl;
    {class} function init: JConnectivityManager_NetworkCallback; cdecl; overload;
    {class} function init(flags: Integer): JConnectivityManager_NetworkCallback; cdecl; overload;
    {class} property FLAG_INCLUDE_LOCATION_INFO: Integer read _GetFLAG_INCLUDE_LOCATION_INFO;
  end;

  [JavaSignature('android/net/ConnectivityManager$NetworkCallback')]
  JConnectivityManager_NetworkCallback = interface(JObject)
    ['{BAE23872-6136-41C5-98F8-0A99D4217666}']
    procedure onAvailable(network: JNetwork); cdecl;
    procedure onBlockedStatusChanged(network: JNetwork; blocked: Boolean); cdecl;
    procedure onCapabilitiesChanged(network: JNetwork; networkCapabilities: JNetworkCapabilities); cdecl;
    procedure onLinkPropertiesChanged(network: JNetwork; linkProperties: JLinkProperties); cdecl;
    procedure onLosing(network: JNetwork; maxMsToLive: Integer); cdecl;
    procedure onLost(network: JNetwork); cdecl;
    procedure onUnavailable; cdecl;
  end;
  TJConnectivityManager_NetworkCallback = class(TJavaGenericImport<JConnectivityManager_NetworkCallbackClass, JConnectivityManager_NetworkCallback>) end;

  JConnectivityManager_OnNetworkActiveListenerClass = interface(IJavaClass)
    ['{1E79C682-34E5-4020-8142-CE9C6AF3054D}']
  end;

  [JavaSignature('android/net/ConnectivityManager$OnNetworkActiveListener')]
  JConnectivityManager_OnNetworkActiveListener = interface(IJavaInstance)
    ['{B3A1F8B2-A775-4883-BBB4-72CC948A73CE}']
    procedure onNetworkActive; cdecl;
  end;
  TJConnectivityManager_OnNetworkActiveListener = class(TJavaGenericImport<JConnectivityManager_OnNetworkActiveListenerClass, JConnectivityManager_OnNetworkActiveListener>) end;

  Jnet_CredentialsClass = interface(JObjectClass)
    ['{7945AFF6-6B7E-494E-8F69-E0729616FB7D}']
    {class} function init(pid: Integer; uid: Integer; gid: Integer): Jnet_Credentials; cdecl;
  end;

  [JavaSignature('android/net/Credentials')]
  Jnet_Credentials = interface(JObject)
    ['{9684E3E3-17DB-4157-88F6-8ED3AA37FD33}']
    function getGid: Integer; cdecl;
    function getPid: Integer; cdecl;
    function getUid: Integer; cdecl;
  end;
  TJnet_Credentials = class(TJavaGenericImport<Jnet_CredentialsClass, Jnet_Credentials>) end;

  JDhcpInfoClass = interface(JObjectClass)
    ['{D9CB198A-3E3F-40F8-8F10-B46CF06EE695}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JDhcpInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/DhcpInfo')]
  JDhcpInfo = interface(JObject)
    ['{15AE9247-20B6-412F-8A84-1A6EE8290F09}']
    function _Getdns1: Integer; cdecl;
    procedure _Setdns1(Value: Integer); cdecl;
    function _Getdns2: Integer; cdecl;
    procedure _Setdns2(Value: Integer); cdecl;
    function _Getgateway: Integer; cdecl;
    procedure _Setgateway(Value: Integer); cdecl;
    function _GetipAddress: Integer; cdecl;
    procedure _SetipAddress(Value: Integer); cdecl;
    function _GetleaseDuration: Integer; cdecl;
    procedure _SetleaseDuration(Value: Integer); cdecl;
    function _Getnetmask: Integer; cdecl;
    procedure _Setnetmask(Value: Integer); cdecl;
    function _GetserverAddress: Integer; cdecl;
    procedure _SetserverAddress(Value: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property dns1: Integer read _Getdns1 write _Setdns1;
    property dns2: Integer read _Getdns2 write _Setdns2;
    property gateway: Integer read _Getgateway write _Setgateway;
    property ipAddress: Integer read _GetipAddress write _SetipAddress;
    property leaseDuration: Integer read _GetleaseDuration write _SetleaseDuration;
    property netmask: Integer read _Getnetmask write _Setnetmask;
    property serverAddress: Integer read _GetserverAddress write _SetserverAddress;
  end;
  TJDhcpInfo = class(TJavaGenericImport<JDhcpInfoClass, JDhcpInfo>) end;

  JDnsResolverClass = interface(JObjectClass)
    ['{FCDEBDD0-DD96-4AD5-B6BF-E287C106287F}']
    {class} function _GetCLASS_IN: Integer; cdecl;
    {class} function _GetERROR_PARSE: Integer; cdecl;
    {class} function _GetERROR_SYSTEM: Integer; cdecl;
    {class} function _GetFLAG_EMPTY: Integer; cdecl;
    {class} function _GetFLAG_NO_CACHE_LOOKUP: Integer; cdecl;
    {class} function _GetFLAG_NO_CACHE_STORE: Integer; cdecl;
    {class} function _GetFLAG_NO_RETRY: Integer; cdecl;
    {class} function _GetTYPE_A: Integer; cdecl;
    {class} function _GetTYPE_AAAA: Integer; cdecl;
    {class} function getInstance: JDnsResolver; cdecl;
    {class} property CLASS_IN: Integer read _GetCLASS_IN;
    {class} property ERROR_PARSE: Integer read _GetERROR_PARSE;
    {class} property ERROR_SYSTEM: Integer read _GetERROR_SYSTEM;
    {class} property FLAG_EMPTY: Integer read _GetFLAG_EMPTY;
    {class} property FLAG_NO_CACHE_LOOKUP: Integer read _GetFLAG_NO_CACHE_LOOKUP;
    {class} property FLAG_NO_CACHE_STORE: Integer read _GetFLAG_NO_CACHE_STORE;
    {class} property FLAG_NO_RETRY: Integer read _GetFLAG_NO_RETRY;
    {class} property TYPE_A: Integer read _GetTYPE_A;
    {class} property TYPE_AAAA: Integer read _GetTYPE_AAAA;
  end;

  [JavaSignature('android/net/DnsResolver')]
  JDnsResolver = interface(JObject)
    ['{AF8A2442-6906-4C32-9DCA-5B2FD60E0425}']
    procedure query(network: JNetwork; domain: JString; flags: Integer; executor: JExecutor; cancellationSignal: JCancellationSignal; callback: JDnsResolver_Callback); cdecl; overload;
    procedure query(network: JNetwork; domain: JString; nsType: Integer; flags: Integer; executor: JExecutor; cancellationSignal: JCancellationSignal; callback: JDnsResolver_Callback); cdecl; overload;
    procedure rawQuery(network: JNetwork; query: TJavaArray<Byte>; flags: Integer; executor: JExecutor; cancellationSignal: JCancellationSignal; callback: JDnsResolver_Callback); cdecl; overload;
    procedure rawQuery(network: JNetwork; domain: JString; nsClass: Integer; nsType: Integer; flags: Integer; executor: JExecutor; cancellationSignal: JCancellationSignal; callback: JDnsResolver_Callback); cdecl; overload;
  end;
  TJDnsResolver = class(TJavaGenericImport<JDnsResolverClass, JDnsResolver>) end;

  JDnsResolver_CallbackClass = interface(IJavaClass)
    ['{1FCD52AE-51DD-4752-9A91-7A562676569F}']
  end;

  [JavaSignature('android/net/DnsResolver$Callback')]
  JDnsResolver_Callback = interface(IJavaInstance)
    ['{5DF84E90-8825-4929-B1BB-9BBE6E3DEC2D}']
    procedure onAnswer(answer: JObject; rcode: Integer); cdecl;
    procedure onError(error: JDnsResolver_DnsException); cdecl;
  end;
  TJDnsResolver_Callback = class(TJavaGenericImport<JDnsResolver_CallbackClass, JDnsResolver_Callback>) end;

  JDnsResolver_DnsExceptionClass = interface(JExceptionClass)
    ['{72FE31E7-ED38-44B6-91D2-877BF9968F7F}']
    {class} function init(code: Integer; cause: JThrowable): JDnsResolver_DnsException; cdecl;
  end;

  [JavaSignature('android/net/DnsResolver$DnsException')]
  JDnsResolver_DnsException = interface(JException)
    ['{5B6850CB-BCAC-431F-B1E3-96E0BE4124BC}']
    function _Getcode: Integer; cdecl;
    property code: Integer read _Getcode;
  end;
  TJDnsResolver_DnsException = class(TJavaGenericImport<JDnsResolver_DnsExceptionClass, JDnsResolver_DnsException>) end;

  JNetworkSpecifierClass = interface(JObjectClass)
    ['{3150A191-04BB-4B11-8CFC-0A8257D5E114}']
    {class} function init: JNetworkSpecifier; cdecl;
  end;

  [JavaSignature('android/net/NetworkSpecifier')]
  JNetworkSpecifier = interface(JObject)
    ['{F398C695-254E-41A8-B12E-1F25701FDC42}']
  end;
  TJNetworkSpecifier = class(TJavaGenericImport<JNetworkSpecifierClass, JNetworkSpecifier>) end;

  JEthernetNetworkSpecifierClass = interface(JNetworkSpecifierClass)
    ['{E848A4B5-865D-49E7-B462-2C8F8F3664FA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(interfaceName: JString): JEthernetNetworkSpecifier; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/EthernetNetworkSpecifier')]
  JEthernetNetworkSpecifier = interface(JNetworkSpecifier)
    ['{55FA2BD5-6BE3-4DC6-B59A-56DFFB6A80E3}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getInterfaceName: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJEthernetNetworkSpecifier = class(TJavaGenericImport<JEthernetNetworkSpecifierClass, JEthernetNetworkSpecifier>) end;

  JPlatformVpnProfileClass = interface(JObjectClass)
    ['{5130AEC0-A882-454D-AC0A-07FFDA7BFE94}']
    {class} function _GetTYPE_IKEV2_IPSEC_PSK: Integer; cdecl;
    {class} function _GetTYPE_IKEV2_IPSEC_RSA: Integer; cdecl;
    {class} function _GetTYPE_IKEV2_IPSEC_USER_PASS: Integer; cdecl;
    {class} property TYPE_IKEV2_IPSEC_PSK: Integer read _GetTYPE_IKEV2_IPSEC_PSK;
    {class} property TYPE_IKEV2_IPSEC_RSA: Integer read _GetTYPE_IKEV2_IPSEC_RSA;
    {class} property TYPE_IKEV2_IPSEC_USER_PASS: Integer read _GetTYPE_IKEV2_IPSEC_USER_PASS;
  end;

  [JavaSignature('android/net/PlatformVpnProfile')]
  JPlatformVpnProfile = interface(JObject)
    ['{BF167E6A-5CB8-4E1B-A1F5-EC65958B54EB}']
    function areLocalRoutesExcluded: Boolean; cdecl;
    function getType: Integer; cdecl;
    function getTypeString: JString; cdecl;
    function isInternetValidationRequired: Boolean; cdecl;
  end;
  TJPlatformVpnProfile = class(TJavaGenericImport<JPlatformVpnProfileClass, JPlatformVpnProfile>) end;

  JIkev2VpnProfileClass = interface(JPlatformVpnProfileClass)
    ['{B3720323-376C-4FD8-9904-368094B1224D}']
  end;

  [JavaSignature('android/net/Ikev2VpnProfile')]
  JIkev2VpnProfile = interface(JPlatformVpnProfile)
    ['{1D72CAA7-B441-498A-8267-656805097CA3}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAllowedAlgorithms: JList; cdecl;
    function getIkeTunnelConnectionParams: JIkeTunnelConnectionParams; cdecl;
    function getMaxMtu: Integer; cdecl;
    function getPassword: JString; cdecl;
    function getPresharedKey: TJavaArray<Byte>; cdecl;
    function getProxyInfo: JProxyInfo; cdecl;
    function getRsaPrivateKey: JPrivateKey; cdecl;
    function getServerAddr: JString; cdecl;
    function getServerRootCaCert: JX509Certificate; cdecl;
    function getUserCert: JX509Certificate; cdecl;
    function getUserIdentity: JString; cdecl;
    function getUsername: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isBypassable: Boolean; cdecl;
    function isMetered: Boolean; cdecl;
  end;
  TJIkev2VpnProfile = class(TJavaGenericImport<JIkev2VpnProfileClass, JIkev2VpnProfile>) end;

  JIkev2VpnProfile_BuilderClass = interface(JObjectClass)
    ['{185183AE-F8AD-4E0E-A5B6-8AFE3A28F835}']
    {class} function init(serverAddr: JString; identity: JString): JIkev2VpnProfile_Builder; cdecl; overload;
    {class} function init(ikeTunConnParams: JIkeTunnelConnectionParams): JIkev2VpnProfile_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/Ikev2VpnProfile$Builder')]
  JIkev2VpnProfile_Builder = interface(JObject)
    ['{AEFEEF77-B3B9-4593-A540-2625A2FAC4EB}']
    function build: JIkev2VpnProfile; cdecl;
    function setAllowedAlgorithms(algorithmNames: JList): JIkev2VpnProfile_Builder; cdecl;
    function setAuthDigitalSignature(userCert: JX509Certificate; key: JPrivateKey; serverRootCa: JX509Certificate): JIkev2VpnProfile_Builder; cdecl;
    function setAuthPsk(psk: TJavaArray<Byte>): JIkev2VpnProfile_Builder; cdecl;
    function setAuthUsernamePassword(user: JString; pass: JString; serverRootCa: JX509Certificate): JIkev2VpnProfile_Builder; cdecl;
    function setBypassable(isBypassable: Boolean): JIkev2VpnProfile_Builder; cdecl;
    function setLocalRoutesExcluded(excludeLocalRoutes: Boolean): JIkev2VpnProfile_Builder; cdecl;
    function setMaxMtu(mtu: Integer): JIkev2VpnProfile_Builder; cdecl;
    function setMetered(isMetered: Boolean): JIkev2VpnProfile_Builder; cdecl;
    function setProxy(proxy: JProxyInfo): JIkev2VpnProfile_Builder; cdecl;
    function setRequiresInternetValidation(requiresInternetValidation: Boolean): JIkev2VpnProfile_Builder; cdecl;
  end;
  TJIkev2VpnProfile_Builder = class(TJavaGenericImport<JIkev2VpnProfile_BuilderClass, JIkev2VpnProfile_Builder>) end;

  JInetAddressesClass = interface(JObjectClass)
    ['{9524A693-8154-4D7C-9806-4D93C1FDECC2}']
    {class} function isNumericAddress(address: JString): Boolean; cdecl;
    {class} function parseNumericAddress(address: JString): JInetAddress; cdecl;
  end;

  [JavaSignature('android/net/InetAddresses')]
  JInetAddresses = interface(JObject)
    ['{C8B3F8D5-F3E3-499C-9F12-776D49E9435D}']
  end;
  TJInetAddresses = class(TJavaGenericImport<JInetAddressesClass, JInetAddresses>) end;

  JIpConfigurationClass = interface(JObjectClass)
    ['{8A30B78F-83BB-4FF4-AEB4-4D76C2D1954A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/IpConfiguration')]
  JIpConfiguration = interface(JObject)
    ['{4DA3F1EA-63EA-4AEB-8E35-65FB000C1122}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getHttpProxy: JProxyInfo; cdecl;
    function getStaticIpConfiguration: JStaticIpConfiguration; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJIpConfiguration = class(TJavaGenericImport<JIpConfigurationClass, JIpConfiguration>) end;

  JIpConfiguration_BuilderClass = interface(JObjectClass)
    ['{15F9EA22-B34F-435B-95F3-74ED66D4B6D7}']
    {class} function init: JIpConfiguration_Builder; cdecl;
  end;

  [JavaSignature('android/net/IpConfiguration$Builder')]
  JIpConfiguration_Builder = interface(JObject)
    ['{ADFBA8F0-594C-4EA7-A6BD-F17413A0DDEE}']
    function build: JIpConfiguration; cdecl;
    function setHttpProxy(proxyInfo: JProxyInfo): JIpConfiguration_Builder; cdecl;
    function setStaticIpConfiguration(config: JStaticIpConfiguration): JIpConfiguration_Builder; cdecl;
  end;
  TJIpConfiguration_Builder = class(TJavaGenericImport<JIpConfiguration_BuilderClass, JIpConfiguration_Builder>) end;

  JIpPrefixClass = interface(JObjectClass)
    ['{98BB4D07-AE46-47B2-8B66-B345256D5D89}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(address: JInetAddress; prefixLength: Integer): JIpPrefix; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/IpPrefix')]
  JIpPrefix = interface(JObject)
    ['{4F0565A3-8FE5-46DA-8618-C7487E9A9FA8}']
    function &contains(address: JInetAddress): Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAddress: JInetAddress; cdecl;
    function getPrefixLength: Integer; cdecl;
    function getRawAddress: TJavaArray<Byte>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJIpPrefix = class(TJavaGenericImport<JIpPrefixClass, JIpPrefix>) end;

  JIpSecAlgorithmClass = interface(JObjectClass)
    ['{90ACEFFD-49C8-4FF8-A15B-129EC9C854BA}']
    {class} function _GetAUTH_AES_CMAC: JString; cdecl;
    {class} function _GetAUTH_AES_XCBC: JString; cdecl;
    {class} function _GetAUTH_CRYPT_AES_GCM: JString; cdecl;
    {class} function _GetAUTH_CRYPT_CHACHA20_POLY1305: JString; cdecl;
    {class} function _GetAUTH_HMAC_MD5: JString; cdecl;
    {class} function _GetAUTH_HMAC_SHA1: JString; cdecl;
    {class} function _GetAUTH_HMAC_SHA256: JString; cdecl;
    {class} function _GetAUTH_HMAC_SHA384: JString; cdecl;
    {class} function _GetAUTH_HMAC_SHA512: JString; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCRYPT_AES_CBC: JString; cdecl;
    {class} function _GetCRYPT_AES_CTR: JString; cdecl;
    {class} function init(algorithm: JString; key: TJavaArray<Byte>): JIpSecAlgorithm; cdecl; overload;
    {class} function init(algorithm: JString; key: TJavaArray<Byte>; truncLenBits: Integer): JIpSecAlgorithm; cdecl; overload;
    {class} function getSupportedAlgorithms: JSet; cdecl;
    {class} property AUTH_AES_CMAC: JString read _GetAUTH_AES_CMAC;
    {class} property AUTH_AES_XCBC: JString read _GetAUTH_AES_XCBC;
    {class} property AUTH_CRYPT_AES_GCM: JString read _GetAUTH_CRYPT_AES_GCM;
    {class} property AUTH_CRYPT_CHACHA20_POLY1305: JString read _GetAUTH_CRYPT_CHACHA20_POLY1305;
    {class} property AUTH_HMAC_MD5: JString read _GetAUTH_HMAC_MD5;
    {class} property AUTH_HMAC_SHA1: JString read _GetAUTH_HMAC_SHA1;
    {class} property AUTH_HMAC_SHA256: JString read _GetAUTH_HMAC_SHA256;
    {class} property AUTH_HMAC_SHA384: JString read _GetAUTH_HMAC_SHA384;
    {class} property AUTH_HMAC_SHA512: JString read _GetAUTH_HMAC_SHA512;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property CRYPT_AES_CBC: JString read _GetCRYPT_AES_CBC;
    {class} property CRYPT_AES_CTR: JString read _GetCRYPT_AES_CTR;
  end;

  [JavaSignature('android/net/IpSecAlgorithm')]
  JIpSecAlgorithm = interface(JObject)
    ['{D1D13C6D-A4FF-4104-89CA-9A6D4B114695}']
    function describeContents: Integer; cdecl;
    function getKey: TJavaArray<Byte>; cdecl;
    function getName: JString; cdecl;
    function getTruncationLengthBits: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJIpSecAlgorithm = class(TJavaGenericImport<JIpSecAlgorithmClass, JIpSecAlgorithm>) end;

  JIpSecManagerClass = interface(JObjectClass)
    ['{DE7B768B-46E7-4842-929A-8D56510E5C91}']
    {class} function _GetDIRECTION_IN: Integer; cdecl;
    {class} function _GetDIRECTION_OUT: Integer; cdecl;
    {class} property DIRECTION_IN: Integer read _GetDIRECTION_IN;
    {class} property DIRECTION_OUT: Integer read _GetDIRECTION_OUT;
  end;

  [JavaSignature('android/net/IpSecManager')]
  JIpSecManager = interface(JObject)
    ['{521E6EEB-D59A-402B-BDDB-0D2BD898F92E}']
    function allocateSecurityParameterIndex(destinationAddress: JInetAddress): JIpSecManager_SecurityParameterIndex; cdecl; overload;
    function allocateSecurityParameterIndex(destinationAddress: JInetAddress; requestedSpi: Integer): JIpSecManager_SecurityParameterIndex; cdecl; overload;
    procedure applyTransportModeTransform(socket: JSocket; direction: Integer; transform: JIpSecTransform); cdecl; overload;
    procedure applyTransportModeTransform(socket: JDatagramSocket; direction: Integer; transform: JIpSecTransform); cdecl; overload;
    procedure applyTransportModeTransform(socket: JFileDescriptor; direction: Integer; transform: JIpSecTransform); cdecl; overload;
    function openUdpEncapsulationSocket(port: Integer): JIpSecManager_UdpEncapsulationSocket; cdecl; overload;
    function openUdpEncapsulationSocket: JIpSecManager_UdpEncapsulationSocket; cdecl; overload;
    procedure removeTransportModeTransforms(socket: JSocket); cdecl; overload;
    procedure removeTransportModeTransforms(socket: JDatagramSocket); cdecl; overload;
    procedure removeTransportModeTransforms(socket: JFileDescriptor); cdecl; overload;
  end;
  TJIpSecManager = class(TJavaGenericImport<JIpSecManagerClass, JIpSecManager>) end;

  JIpSecManager_ResourceUnavailableExceptionClass = interface(JAndroidExceptionClass)
    ['{142BD952-30BB-43E0-B775-D39F1B0E7E8C}']
  end;

  [JavaSignature('android/net/IpSecManager$ResourceUnavailableException')]
  JIpSecManager_ResourceUnavailableException = interface(JAndroidException)
    ['{9519FD12-DCDD-4903-85EB-5E22E36A12AA}']
  end;
  TJIpSecManager_ResourceUnavailableException = class(TJavaGenericImport<JIpSecManager_ResourceUnavailableExceptionClass, JIpSecManager_ResourceUnavailableException>) end;

  JIpSecManager_SecurityParameterIndexClass = interface(JObjectClass)
    ['{B4768E40-1A23-4B87-B1DA-A7D8633DA6EB}']
  end;

  [JavaSignature('android/net/IpSecManager$SecurityParameterIndex')]
  JIpSecManager_SecurityParameterIndex = interface(JObject)
    ['{5D0D9B96-4294-4060-AA9A-36EA81CE0F19}']
    procedure close; cdecl;
    function getSpi: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJIpSecManager_SecurityParameterIndex = class(TJavaGenericImport<JIpSecManager_SecurityParameterIndexClass, JIpSecManager_SecurityParameterIndex>) end;

  JIpSecManager_SpiUnavailableExceptionClass = interface(JAndroidExceptionClass)
    ['{DADD02B2-187C-4252-B426-80A18455B80B}']
  end;

  [JavaSignature('android/net/IpSecManager$SpiUnavailableException')]
  JIpSecManager_SpiUnavailableException = interface(JAndroidException)
    ['{292A203C-19C3-405D-BAA6-CC2C20D062B2}']
    function getSpi: Integer; cdecl;
  end;
  TJIpSecManager_SpiUnavailableException = class(TJavaGenericImport<JIpSecManager_SpiUnavailableExceptionClass, JIpSecManager_SpiUnavailableException>) end;

  JIpSecManager_UdpEncapsulationSocketClass = interface(JObjectClass)
    ['{EA627321-7962-4064-8592-348D0AF989B5}']
  end;

  [JavaSignature('android/net/IpSecManager$UdpEncapsulationSocket')]
  JIpSecManager_UdpEncapsulationSocket = interface(JObject)
    ['{693C904D-DB38-43A5-AEF9-23A3DB159C5E}']
    procedure close; cdecl;
    function getFileDescriptor: JFileDescriptor; cdecl;
    function getPort: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJIpSecManager_UdpEncapsulationSocket = class(TJavaGenericImport<JIpSecManager_UdpEncapsulationSocketClass, JIpSecManager_UdpEncapsulationSocket>) end;

  JIpSecTransformClass = interface(JObjectClass)
    ['{702520A7-71CB-45BE-B372-A63702003413}']
  end;

  [JavaSignature('android/net/IpSecTransform')]
  JIpSecTransform = interface(JObject)
    ['{CA55FE04-4099-4605-93DE-5DE4E7C1B7B9}']
    procedure close; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJIpSecTransform = class(TJavaGenericImport<JIpSecTransformClass, JIpSecTransform>) end;

  JIpSecTransform_BuilderClass = interface(JObjectClass)
    ['{2C7ED506-3315-48BD-93B4-FDB7CB5D29C4}']
    {class} //function init(context: JContext): JIpSecTransform_Builder; cdecl;
  end;

  [JavaSignature('android/net/IpSecTransform$Builder')]
  JIpSecTransform_Builder = interface(JObject)
    ['{7CF33F4F-C720-4315-94AC-5B49851EAFBF}']
    function buildTransportModeTransform(sourceAddress: JInetAddress; spi: JIpSecManager_SecurityParameterIndex): JIpSecTransform; cdecl;
    function setAuthenticatedEncryption(algo: JIpSecAlgorithm): JIpSecTransform_Builder; cdecl;
    function setAuthentication(algo: JIpSecAlgorithm): JIpSecTransform_Builder; cdecl;
    function setEncryption(algo: JIpSecAlgorithm): JIpSecTransform_Builder; cdecl;
    function setIpv4Encapsulation(localSocket: JIpSecManager_UdpEncapsulationSocket; remotePort: Integer): JIpSecTransform_Builder; cdecl;
  end;
  TJIpSecTransform_Builder = class(TJavaGenericImport<JIpSecTransform_BuilderClass, JIpSecTransform_Builder>) end;

  JLinkAddressClass = interface(JObjectClass)
    ['{B5DAFF73-84C5-438B-83F4-56D01B8B9AD3}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/LinkAddress')]
  JLinkAddress = interface(JObject)
    ['{6B250E90-A674-4C44-966D-D399AEF49B8F}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAddress: JInetAddress; cdecl;
    function getFlags: Integer; cdecl;
    function getPrefixLength: Integer; cdecl;
    function getScope: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJLinkAddress = class(TJavaGenericImport<JLinkAddressClass, JLinkAddress>) end;

  JLinkPropertiesClass = interface(JObjectClass)
    ['{2E2B6CEE-8281-4BFA-BB02-6A5641E1721E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JLinkProperties; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/LinkProperties')]
  JLinkProperties = interface(JObject)
    ['{58F5C8CE-C6BB-499D-96B9-20D0C6713D1A}']
    function addRoute(route: Jnet_RouteInfo): Boolean; cdecl;
    procedure clear; cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDhcpServerAddress: JInet4Address; cdecl;
    function getDnsServers: JList; cdecl;
    function getDomains: JString; cdecl;
    function getHttpProxy: JProxyInfo; cdecl;
    function getInterfaceName: JString; cdecl;
    function getLinkAddresses: JList; cdecl;
    function getMtu: Integer; cdecl;
    function getNat64Prefix: JIpPrefix; cdecl;
    function getPrivateDnsServerName: JString; cdecl;
    function getRoutes: JList; cdecl;
    function hashCode: Integer; cdecl;
    function isPrivateDnsActive: Boolean; cdecl;
    function isWakeOnLanSupported: Boolean; cdecl;
    procedure setDhcpServerAddress(serverAddress: JInet4Address); cdecl;
    procedure setDnsServers(dnsServers: JCollection); cdecl;
    procedure setDomains(domains: JString); cdecl;
    procedure setHttpProxy(proxy: JProxyInfo); cdecl;
    procedure setInterfaceName(iface: JString); cdecl;
    procedure setLinkAddresses(addresses: JCollection); cdecl;
    procedure setMtu(mtu: Integer); cdecl;
    procedure setNat64Prefix(prefix: JIpPrefix); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJLinkProperties = class(TJavaGenericImport<JLinkPropertiesClass, JLinkProperties>) end;

  JLocalServerSocketClass = interface(JObjectClass)
    ['{B54083B7-63F8-4FEF-9DBF-CC7DC1AC6BFD}']
    {class} function init(name: JString): JLocalServerSocket; cdecl; overload;
    {class} function init(fd: JFileDescriptor): JLocalServerSocket; cdecl; overload;
  end;

  [JavaSignature('android/net/LocalServerSocket')]
  JLocalServerSocket = interface(JObject)
    ['{C54EEEF3-11C0-4B7D-9539-A0AE3D7DB6A7}']
    function accept: JLocalSocket; cdecl;
    procedure close; cdecl;
    function getFileDescriptor: JFileDescriptor; cdecl;
    function getLocalSocketAddress: JLocalSocketAddress; cdecl;
  end;
  TJLocalServerSocket = class(TJavaGenericImport<JLocalServerSocketClass, JLocalServerSocket>) end;

  JLocalSocketClass = interface(JObjectClass)
    ['{EBA731DA-98DE-49CA-BADC-02431412792F}']
    {class} function _GetSOCKET_DGRAM: Integer; cdecl;
    {class} function _GetSOCKET_SEQPACKET: Integer; cdecl;
    {class} function _GetSOCKET_STREAM: Integer; cdecl;
    {class} function init: JLocalSocket; cdecl; overload;
    {class} function init(sockType: Integer): JLocalSocket; cdecl; overload;
    {class} property SOCKET_DGRAM: Integer read _GetSOCKET_DGRAM;
    {class} property SOCKET_SEQPACKET: Integer read _GetSOCKET_SEQPACKET;
    {class} property SOCKET_STREAM: Integer read _GetSOCKET_STREAM;
  end;

  [JavaSignature('android/net/LocalSocket')]
  JLocalSocket = interface(JObject)
    ['{9F048906-3CE2-4B1F-AAF2-C92E28948A5D}']
    procedure bind(bindpoint: JLocalSocketAddress); cdecl;
    procedure close; cdecl;
    procedure connect(endpoint: JLocalSocketAddress); cdecl; overload;
    procedure connect(endpoint: JLocalSocketAddress; timeout: Integer); cdecl; overload;
    function getAncillaryFileDescriptors: TJavaObjectArray<JFileDescriptor>; cdecl;
    function getFileDescriptor: JFileDescriptor; cdecl;
    function getInputStream: JInputStream; cdecl;
    function getLocalSocketAddress: JLocalSocketAddress; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    function getPeerCredentials: Jnet_Credentials; cdecl;
    function getReceiveBufferSize: Integer; cdecl;
    function getRemoteSocketAddress: JLocalSocketAddress; cdecl;
    function getSendBufferSize: Integer; cdecl;
    function getSoTimeout: Integer; cdecl;
    function isBound: Boolean; cdecl;
    function isClosed: Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    function isInputShutdown: Boolean; cdecl;
    function isOutputShutdown: Boolean; cdecl;
    procedure setFileDescriptorsForSend(fds: TJavaObjectArray<JFileDescriptor>); cdecl;
    procedure setReceiveBufferSize(size: Integer); cdecl;
    procedure setSendBufferSize(n: Integer); cdecl;
    procedure setSoTimeout(n: Integer); cdecl;
    procedure shutdownInput; cdecl;
    procedure shutdownOutput; cdecl;
    function toString: JString; cdecl;
  end;
  TJLocalSocket = class(TJavaGenericImport<JLocalSocketClass, JLocalSocket>) end;

  JLocalSocketAddressClass = interface(JObjectClass)
    ['{372D6A57-0BC1-4814-97FB-AA10CEBD0E98}']
    {class} function init(name: JString; namespace: JLocalSocketAddress_Namespace): JLocalSocketAddress; cdecl; overload;
    {class} function init(name: JString): JLocalSocketAddress; cdecl; overload;
  end;

  [JavaSignature('android/net/LocalSocketAddress')]
  JLocalSocketAddress = interface(JObject)
    ['{75D02414-2370-48CF-BDAA-C17AC96D3389}']
    function getName: JString; cdecl;
    function getNamespace: JLocalSocketAddress_Namespace; cdecl;
  end;
  TJLocalSocketAddress = class(TJavaGenericImport<JLocalSocketAddressClass, JLocalSocketAddress>) end;

  JLocalSocketAddress_NamespaceClass = interface(JEnumClass)
    ['{FB572783-A894-4F07-90B7-228491F57729}']
    {class} function _GetABSTRACT: JLocalSocketAddress_Namespace; cdecl;
    {class} function _GetFILESYSTEM: JLocalSocketAddress_Namespace; cdecl;
    {class} function _GetRESERVED: JLocalSocketAddress_Namespace; cdecl;
    {class} function valueOf(name: JString): JLocalSocketAddress_Namespace; cdecl;
    {class} function values: TJavaObjectArray<JLocalSocketAddress_Namespace>; cdecl;
    {class} property &ABSTRACT: JLocalSocketAddress_Namespace read _GetABSTRACT;
    {class} property FILESYSTEM: JLocalSocketAddress_Namespace read _GetFILESYSTEM;
    {class} property RESERVED: JLocalSocketAddress_Namespace read _GetRESERVED;
  end;

  [JavaSignature('android/net/LocalSocketAddress$Namespace')]
  JLocalSocketAddress_Namespace = interface(JEnum)
    ['{92A66884-68BE-4017-A67C-2538BB9A391B}']
  end;
  TJLocalSocketAddress_Namespace = class(TJavaGenericImport<JLocalSocketAddress_NamespaceClass, JLocalSocketAddress_Namespace>) end;

  JMacAddressClass = interface(JObjectClass)
    ['{69E534BB-5A11-4B90-A43F-891350E811E3}']
    {class} function _GetBROADCAST_ADDRESS: JMacAddress; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetTYPE_BROADCAST: Integer; cdecl;
    {class} function _GetTYPE_MULTICAST: Integer; cdecl;
    {class} function _GetTYPE_UNICAST: Integer; cdecl;
    {class} function fromBytes(addr: TJavaArray<Byte>): JMacAddress; cdecl;
    {class} function fromString(addr: JString): JMacAddress; cdecl;
    {class} property BROADCAST_ADDRESS: JMacAddress read _GetBROADCAST_ADDRESS;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property TYPE_BROADCAST: Integer read _GetTYPE_BROADCAST;
    {class} property TYPE_MULTICAST: Integer read _GetTYPE_MULTICAST;
    {class} property TYPE_UNICAST: Integer read _GetTYPE_UNICAST;
  end;

  [JavaSignature('android/net/MacAddress')]
  JMacAddress = interface(JObject)
    ['{EA71A3E6-5030-408C-8C98-0D399C41AD39}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAddressType: Integer; cdecl;
    function getLinkLocalIpv6FromEui48Mac: JInet6Address; cdecl;
    function hashCode: Integer; cdecl;
    function isLocallyAssigned: Boolean; cdecl;
    function matches(baseAddress: JMacAddress; mask: JMacAddress): Boolean; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function toOuiString: JString; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJMacAddress = class(TJavaGenericImport<JMacAddressClass, JMacAddress>) end;

  JMailToClass = interface(JObjectClass)
    ['{35E239FE-8BDD-4895-A86E-0D7F6DA123AD}']
    {class} function _GetMAILTO_SCHEME: JString; cdecl;
    {class} function isMailTo(url: JString): Boolean; cdecl;
    {class} function parse(url: JString): JMailTo; cdecl;
    {class} property MAILTO_SCHEME: JString read _GetMAILTO_SCHEME;
  end;

  [JavaSignature('android/net/MailTo')]
  JMailTo = interface(JObject)
    ['{3A23F169-EAF1-4408-9437-246008CCF9AB}']
    function getBody: JString; cdecl;
    function getCc: JString; cdecl;
    function getHeaders: JMap; cdecl;
    function getSubject: JString; cdecl;
    function getTo: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJMailTo = class(TJavaGenericImport<JMailToClass, JMailTo>) end;

  JNetworkClass = interface(JObjectClass)
    ['{AE027C0D-2183-437C-BAAD-E0BFC70212C8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function fromNetworkHandle(networkHandle: Int64): JNetwork; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/Network')]
  JNetwork = interface(JObject)
    ['{76EC6273-4555-471E-BD82-A52A85C611BF}']
    procedure bindSocket(socket: JDatagramSocket); cdecl; overload;
    procedure bindSocket(socket: JSocket); cdecl; overload;
    procedure bindSocket(fd: JFileDescriptor); cdecl; overload;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAllByName(host: JString): TJavaObjectArray<JInetAddress>; cdecl;
    function getByName(host: JString): JInetAddress; cdecl;
    function getNetworkHandle: Int64; cdecl;
    function getSocketFactory: Jnet_SocketFactory; cdecl;
    function hashCode: Integer; cdecl;
    function openConnection(url: JURL): JURLConnection; cdecl; overload;
    function openConnection(url: JURL; proxy: JProxy): JURLConnection; cdecl; overload;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetwork = class(TJavaGenericImport<JNetworkClass, JNetwork>) end;

  JNetworkBadgingClass = interface(JObjectClass)
    ['{588FF201-A3BC-4194-8970-031A7B5214F6}']
    {class} function _GetBADGING_4K: Integer; cdecl;
    {class} function _GetBADGING_HD: Integer; cdecl;
    {class} function _GetBADGING_NONE: Integer; cdecl;
    {class} function _GetBADGING_SD: Integer; cdecl;
    {class} //function getWifiIcon(signalLevel: Integer; badging: Integer; theme: JResources_Theme): JDrawable; cdecl;
    {class} property BADGING_4K: Integer read _GetBADGING_4K;
    {class} property BADGING_HD: Integer read _GetBADGING_HD;
    {class} property BADGING_NONE: Integer read _GetBADGING_NONE;
    {class} property BADGING_SD: Integer read _GetBADGING_SD;
  end;

  [JavaSignature('android/net/NetworkBadging')]
  JNetworkBadging = interface(JObject)
    ['{3761C316-EB59-416E-A8F4-09DD08D460EC}']
  end;
  TJNetworkBadging = class(TJavaGenericImport<JNetworkBadgingClass, JNetworkBadging>) end;

  JNetworkBadging_BadgingClass = interface(JObjectClass)
    ['{B3FF7630-76EE-4A69-9933-B9F8EED52D4E}']
  end;

  [JavaSignature('android/net/NetworkBadging$Badging')]
  JNetworkBadging_Badging = interface(JObject)
    ['{438B64B3-DF4C-415B-9ABF-F2C870977F43}']
  end;
  TJNetworkBadging_Badging = class(TJavaGenericImport<JNetworkBadging_BadgingClass, JNetworkBadging_Badging>) end;

  JNetworkCapabilitiesClass = interface(JObjectClass)
    ['{E908BEFD-1FFE-4DBA-B9F3-48CE1E205BDE}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetNET_CAPABILITY_CAPTIVE_PORTAL: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_CBS: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_DUN: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_EIMS: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_ENTERPRISE: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_FOREGROUND: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_FOTA: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_HEAD_UNIT: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_IA: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_IMS: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_INTERNET: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_MCX: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_MMS: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_MMTEL: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_CONGESTED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_METERED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_RESTRICTED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_ROAMING: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_SUSPENDED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_NOT_VPN: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_PRIORITIZE_BANDWIDTH: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_PRIORITIZE_LATENCY: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_RCS: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_SUPL: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_TEMPORARILY_NOT_METERED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_TRUSTED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_VALIDATED: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_WIFI_P2P: Integer; cdecl;
    {class} function _GetNET_CAPABILITY_XCAP: Integer; cdecl;
    {class} function _GetNET_ENTERPRISE_ID_1: Integer; cdecl;
    {class} function _GetNET_ENTERPRISE_ID_2: Integer; cdecl;
    {class} function _GetNET_ENTERPRISE_ID_3: Integer; cdecl;
    {class} function _GetNET_ENTERPRISE_ID_4: Integer; cdecl;
    {class} function _GetNET_ENTERPRISE_ID_5: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_UNSPECIFIED: Integer; cdecl;
    {class} function _GetTRANSPORT_BLUETOOTH: Integer; cdecl;
    {class} function _GetTRANSPORT_CELLULAR: Integer; cdecl;
    {class} function _GetTRANSPORT_ETHERNET: Integer; cdecl;
    {class} function _GetTRANSPORT_LOWPAN: Integer; cdecl;
    {class} function _GetTRANSPORT_USB: Integer; cdecl;
    {class} function _GetTRANSPORT_VPN: Integer; cdecl;
    {class} function _GetTRANSPORT_WIFI: Integer; cdecl;
    {class} function _GetTRANSPORT_WIFI_AWARE: Integer; cdecl;
    {class} function init: JNetworkCapabilities; cdecl; overload;
    {class} function init(nc: JNetworkCapabilities): JNetworkCapabilities; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property NET_CAPABILITY_CAPTIVE_PORTAL: Integer read _GetNET_CAPABILITY_CAPTIVE_PORTAL;
    {class} property NET_CAPABILITY_CBS: Integer read _GetNET_CAPABILITY_CBS;
    {class} property NET_CAPABILITY_DUN: Integer read _GetNET_CAPABILITY_DUN;
    {class} property NET_CAPABILITY_EIMS: Integer read _GetNET_CAPABILITY_EIMS;
    {class} property NET_CAPABILITY_ENTERPRISE: Integer read _GetNET_CAPABILITY_ENTERPRISE;
    {class} property NET_CAPABILITY_FOREGROUND: Integer read _GetNET_CAPABILITY_FOREGROUND;
    {class} property NET_CAPABILITY_FOTA: Integer read _GetNET_CAPABILITY_FOTA;
    {class} property NET_CAPABILITY_HEAD_UNIT: Integer read _GetNET_CAPABILITY_HEAD_UNIT;
    {class} property NET_CAPABILITY_IA: Integer read _GetNET_CAPABILITY_IA;
    {class} property NET_CAPABILITY_IMS: Integer read _GetNET_CAPABILITY_IMS;
    {class} property NET_CAPABILITY_INTERNET: Integer read _GetNET_CAPABILITY_INTERNET;
    {class} property NET_CAPABILITY_MCX: Integer read _GetNET_CAPABILITY_MCX;
    {class} property NET_CAPABILITY_MMS: Integer read _GetNET_CAPABILITY_MMS;
    {class} property NET_CAPABILITY_MMTEL: Integer read _GetNET_CAPABILITY_MMTEL;
    {class} property NET_CAPABILITY_NOT_CONGESTED: Integer read _GetNET_CAPABILITY_NOT_CONGESTED;
    {class} property NET_CAPABILITY_NOT_METERED: Integer read _GetNET_CAPABILITY_NOT_METERED;
    {class} property NET_CAPABILITY_NOT_RESTRICTED: Integer read _GetNET_CAPABILITY_NOT_RESTRICTED;
    {class} property NET_CAPABILITY_NOT_ROAMING: Integer read _GetNET_CAPABILITY_NOT_ROAMING;
    {class} property NET_CAPABILITY_NOT_SUSPENDED: Integer read _GetNET_CAPABILITY_NOT_SUSPENDED;
    {class} property NET_CAPABILITY_NOT_VPN: Integer read _GetNET_CAPABILITY_NOT_VPN;
    {class} property NET_CAPABILITY_PRIORITIZE_BANDWIDTH: Integer read _GetNET_CAPABILITY_PRIORITIZE_BANDWIDTH;
    {class} property NET_CAPABILITY_PRIORITIZE_LATENCY: Integer read _GetNET_CAPABILITY_PRIORITIZE_LATENCY;
    {class} property NET_CAPABILITY_RCS: Integer read _GetNET_CAPABILITY_RCS;
    {class} property NET_CAPABILITY_SUPL: Integer read _GetNET_CAPABILITY_SUPL;
    {class} property NET_CAPABILITY_TEMPORARILY_NOT_METERED: Integer read _GetNET_CAPABILITY_TEMPORARILY_NOT_METERED;
    {class} property NET_CAPABILITY_TRUSTED: Integer read _GetNET_CAPABILITY_TRUSTED;
    {class} property NET_CAPABILITY_VALIDATED: Integer read _GetNET_CAPABILITY_VALIDATED;
    {class} property NET_CAPABILITY_WIFI_P2P: Integer read _GetNET_CAPABILITY_WIFI_P2P;
    {class} property NET_CAPABILITY_XCAP: Integer read _GetNET_CAPABILITY_XCAP;
    {class} property NET_ENTERPRISE_ID_1: Integer read _GetNET_ENTERPRISE_ID_1;
    {class} property NET_ENTERPRISE_ID_2: Integer read _GetNET_ENTERPRISE_ID_2;
    {class} property NET_ENTERPRISE_ID_3: Integer read _GetNET_ENTERPRISE_ID_3;
    {class} property NET_ENTERPRISE_ID_4: Integer read _GetNET_ENTERPRISE_ID_4;
    {class} property NET_ENTERPRISE_ID_5: Integer read _GetNET_ENTERPRISE_ID_5;
    {class} property SIGNAL_STRENGTH_UNSPECIFIED: Integer read _GetSIGNAL_STRENGTH_UNSPECIFIED;
    {class} property TRANSPORT_BLUETOOTH: Integer read _GetTRANSPORT_BLUETOOTH;
    {class} property TRANSPORT_CELLULAR: Integer read _GetTRANSPORT_CELLULAR;
    {class} property TRANSPORT_ETHERNET: Integer read _GetTRANSPORT_ETHERNET;
    {class} property TRANSPORT_LOWPAN: Integer read _GetTRANSPORT_LOWPAN;
    {class} property TRANSPORT_USB: Integer read _GetTRANSPORT_USB;
    {class} property TRANSPORT_VPN: Integer read _GetTRANSPORT_VPN;
    {class} property TRANSPORT_WIFI: Integer read _GetTRANSPORT_WIFI;
    {class} property TRANSPORT_WIFI_AWARE: Integer read _GetTRANSPORT_WIFI_AWARE;
  end;

  [JavaSignature('android/net/NetworkCapabilities')]
  JNetworkCapabilities = interface(JObject)
    ['{E9EBA97B-F82A-41BA-8170-537E131E0533}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCapabilities: TJavaArray<Integer>; cdecl;
    function getEnterpriseIds: TJavaArray<Integer>; cdecl;
    function getLinkDownstreamBandwidthKbps: Integer; cdecl;
    function getLinkUpstreamBandwidthKbps: Integer; cdecl;
    function getNetworkSpecifier: JNetworkSpecifier; cdecl;
    function getOwnerUid: Integer; cdecl;
    function getSignalStrength: Integer; cdecl;
    function getTransportInfo: JTransportInfo; cdecl;
    function hasCapability(capability: Integer): Boolean; cdecl;
    function hasEnterpriseId(enterpriseId: Integer): Boolean; cdecl;
    function hasTransport(transportType: Integer): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkCapabilities = class(TJavaGenericImport<JNetworkCapabilitiesClass, JNetworkCapabilities>) end;

  JNetworkInfoClass = interface(JObjectClass)
    ['{AAA1F0A5-4A11-4FAA-BBA9-3AD780E30619}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(type_: Integer; subtype: Integer; typeName: JString; subtypeName: JString): JNetworkInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/NetworkInfo')]
  JNetworkInfo = interface(JObject)
    ['{B271626D-7A97-44DB-AF7D-B6E7B1FE94EC}']
    function describeContents: Integer; cdecl;
    function getDetailedState: JNetworkInfo_DetailedState; cdecl;//Deprecated
    function getExtraInfo: JString; cdecl;//Deprecated
    function getReason: JString; cdecl;//Deprecated
    function getState: JNetworkInfo_State; cdecl;//Deprecated
    function getSubtype: Integer; cdecl;//Deprecated
    function getSubtypeName: JString; cdecl;//Deprecated
    function getType: Integer; cdecl;//Deprecated
    function getTypeName: JString; cdecl;//Deprecated
    function isAvailable: Boolean; cdecl;//Deprecated
    function isConnected: Boolean; cdecl;//Deprecated
    function isConnectedOrConnecting: Boolean; cdecl;//Deprecated
    function isFailover: Boolean; cdecl;//Deprecated
    function isRoaming: Boolean; cdecl;//Deprecated
    procedure setDetailedState(detailedState: JNetworkInfo_DetailedState; reason: JString; extraInfo: JString); cdecl;//Deprecated
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkInfo = class(TJavaGenericImport<JNetworkInfoClass, JNetworkInfo>) end;

  JNetworkInfo_DetailedStateClass = interface(JEnumClass)
    ['{23C018BA-81E4-4B2E-B369-9CF46B9A5DAF}']
    {class} function _GetAUTHENTICATING: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetBLOCKED: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetCAPTIVE_PORTAL_CHECK: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetCONNECTED: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetCONNECTING: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetDISCONNECTED: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetDISCONNECTING: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetFAILED: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetIDLE: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetOBTAINING_IPADDR: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetSCANNING: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetSUSPENDED: JNetworkInfo_DetailedState; cdecl;
    {class} function _GetVERIFYING_POOR_LINK: JNetworkInfo_DetailedState; cdecl;
    {class} function valueOf(name: JString): JNetworkInfo_DetailedState; cdecl;
    {class} function values: TJavaObjectArray<JNetworkInfo_DetailedState>; cdecl;
    {class} property AUTHENTICATING: JNetworkInfo_DetailedState read _GetAUTHENTICATING;
    {class} property BLOCKED: JNetworkInfo_DetailedState read _GetBLOCKED;
    {class} property CAPTIVE_PORTAL_CHECK: JNetworkInfo_DetailedState read _GetCAPTIVE_PORTAL_CHECK;
    {class} property CONNECTED: JNetworkInfo_DetailedState read _GetCONNECTED;
    {class} property CONNECTING: JNetworkInfo_DetailedState read _GetCONNECTING;
    {class} property DISCONNECTED: JNetworkInfo_DetailedState read _GetDISCONNECTED;
    {class} property DISCONNECTING: JNetworkInfo_DetailedState read _GetDISCONNECTING;
    {class} property FAILED: JNetworkInfo_DetailedState read _GetFAILED;
    {class} property IDLE: JNetworkInfo_DetailedState read _GetIDLE;
    {class} property OBTAINING_IPADDR: JNetworkInfo_DetailedState read _GetOBTAINING_IPADDR;
    {class} property SCANNING: JNetworkInfo_DetailedState read _GetSCANNING;
    {class} property SUSPENDED: JNetworkInfo_DetailedState read _GetSUSPENDED;
    {class} property VERIFYING_POOR_LINK: JNetworkInfo_DetailedState read _GetVERIFYING_POOR_LINK;
  end;

  [JavaSignature('android/net/NetworkInfo$DetailedState')]
  JNetworkInfo_DetailedState = interface(JEnum)
    ['{E755D6D6-0DB0-4231-A31B-5AA4E74A4F9F}']
  end;
  TJNetworkInfo_DetailedState = class(TJavaGenericImport<JNetworkInfo_DetailedStateClass, JNetworkInfo_DetailedState>) end;

  JNetworkInfo_StateClass = interface(JEnumClass)
    ['{07095450-13CB-41C7-B482-88392CFB2D09}']
    {class} function _GetCONNECTED: JNetworkInfo_State; cdecl;
    {class} function _GetCONNECTING: JNetworkInfo_State; cdecl;
    {class} function _GetDISCONNECTED: JNetworkInfo_State; cdecl;
    {class} function _GetDISCONNECTING: JNetworkInfo_State; cdecl;
    {class} function _GetSUSPENDED: JNetworkInfo_State; cdecl;
    {class} function _GetUNKNOWN: JNetworkInfo_State; cdecl;
    {class} function valueOf(name: JString): JNetworkInfo_State; cdecl;
    {class} function values: TJavaObjectArray<JNetworkInfo_State>; cdecl;
    {class} property CONNECTED: JNetworkInfo_State read _GetCONNECTED;
    {class} property CONNECTING: JNetworkInfo_State read _GetCONNECTING;
    {class} property DISCONNECTED: JNetworkInfo_State read _GetDISCONNECTED;
    {class} property DISCONNECTING: JNetworkInfo_State read _GetDISCONNECTING;
    {class} property SUSPENDED: JNetworkInfo_State read _GetSUSPENDED;
    {class} property UNKNOWN: JNetworkInfo_State read _GetUNKNOWN;
  end;

  [JavaSignature('android/net/NetworkInfo$State')]
  JNetworkInfo_State = interface(JEnum)
    ['{B057DB6E-72E5-448C-AF59-986D4DE7B578}']
  end;
  TJNetworkInfo_State = class(TJavaGenericImport<JNetworkInfo_StateClass, JNetworkInfo_State>) end;

  JNetworkRequestClass = interface(JObjectClass)
    ['{8BDD713E-715C-4BB4-A42B-23B6D0044D65}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/NetworkRequest')]
  JNetworkRequest = interface(JObject)
    ['{966B3886-AD63-4D8E-8573-D8D997A2933D}']
    function canBeSatisfiedBy(nc: JNetworkCapabilities): Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCapabilities: TJavaArray<Integer>; cdecl;
    function getNetworkSpecifier: JNetworkSpecifier; cdecl;
    function getTransportTypes: TJavaArray<Integer>; cdecl;
    function hasCapability(capability: Integer): Boolean; cdecl;
    function hasTransport(transportType: Integer): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNetworkRequest = class(TJavaGenericImport<JNetworkRequestClass, JNetworkRequest>) end;

  JNetworkRequest_BuilderClass = interface(JObjectClass)
    ['{0DE74060-F025-40C9-8334-05CDECEED85F}']
    {class} function init: JNetworkRequest_Builder; cdecl; overload;
    {class} function init(request: JNetworkRequest): JNetworkRequest_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/NetworkRequest$Builder')]
  JNetworkRequest_Builder = interface(JObject)
    ['{AA7B1C54-8947-4A75-AEAB-8983141D28A7}']
    function addCapability(capability: Integer): JNetworkRequest_Builder; cdecl;
    function addTransportType(transportType: Integer): JNetworkRequest_Builder; cdecl;
    function build: JNetworkRequest; cdecl;
    function clearCapabilities: JNetworkRequest_Builder; cdecl;
    function removeCapability(capability: Integer): JNetworkRequest_Builder; cdecl;
    function removeTransportType(transportType: Integer): JNetworkRequest_Builder; cdecl;
    function setIncludeOtherUidNetworks(include: Boolean): JNetworkRequest_Builder; cdecl;
    function setNetworkSpecifier(networkSpecifier: JString): JNetworkRequest_Builder; cdecl; overload;//Deprecated
    function setNetworkSpecifier(networkSpecifier: JNetworkSpecifier): JNetworkRequest_Builder; cdecl; overload;
  end;
  TJNetworkRequest_Builder = class(TJavaGenericImport<JNetworkRequest_BuilderClass, JNetworkRequest_Builder>) end;

  Jnet_ParseExceptionClass = interface(JRuntimeExceptionClass)
    ['{4F9C6D21-B0AE-4700-BF40-09AA0DB05F03}']
    {class} function init(response: JString): Jnet_ParseException; cdecl; overload;
    {class} function init(response: JString; cause: JThrowable): Jnet_ParseException; cdecl; overload;
  end;

  [JavaSignature('android/net/ParseException')]
  Jnet_ParseException = interface(JRuntimeException)
    ['{C1D0ABEE-7343-482A-8F4B-13C2DF665FEF}']
    function _Getresponse: JString; cdecl;
    procedure _Setresponse(Value: JString); cdecl;
    property response: JString read _Getresponse write _Setresponse;
  end;
  TJnet_ParseException = class(TJavaGenericImport<Jnet_ParseExceptionClass, Jnet_ParseException>) end;

  Jnet_ProxyClass = interface(JObjectClass)
    ['{083E9E07-5502-458C-A6F8-84B869142B56}']
    {class} function _GetEXTRA_PROXY_INFO: JString; cdecl;
    {class} function _GetPROXY_CHANGE_ACTION: JString; cdecl;
    {class} function init: Jnet_Proxy; cdecl;
    {class} function getDefaultHost: JString; cdecl;//Deprecated
    {class} function getDefaultPort: Integer; cdecl;//Deprecated
    {class} //function getHost(ctx: JContext): JString; cdecl;//Deprecated
    {class} //function getPort(ctx: JContext): Integer; cdecl;//Deprecated
    {class} property EXTRA_PROXY_INFO: JString read _GetEXTRA_PROXY_INFO;
    {class} property PROXY_CHANGE_ACTION: JString read _GetPROXY_CHANGE_ACTION;
  end;

  [JavaSignature('android/net/Proxy')]
  Jnet_Proxy = interface(JObject)
    ['{45FB13E6-66A7-494A-9415-0BBC01167F35}']
  end;
  TJnet_Proxy = class(TJavaGenericImport<Jnet_ProxyClass, Jnet_Proxy>) end;

  JProxyInfoClass = interface(JObjectClass)
    ['{31E4D1A9-4E97-4F30-819F-61909D0CFB8A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(source: JProxyInfo): JProxyInfo; cdecl;
    {class} function buildDirectProxy(host: JString; port: Integer): JProxyInfo; cdecl; overload;
    {class} function buildDirectProxy(host: JString; port: Integer; exclList: JList): JProxyInfo; cdecl; overload;
    {class} function buildPacProxy(pacUri: Jnet_Uri): JProxyInfo; cdecl; overload;
    {class} function buildPacProxy(pacUrl: Jnet_Uri; port: Integer): JProxyInfo; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/ProxyInfo')]
  JProxyInfo = interface(JObject)
    ['{7EDC72B5-DE1F-4F6F-8E52-EF201FAD6806}']
    function equals(o: JObject): Boolean; cdecl;
    function getExclusionList: TJavaObjectArray<JString>; cdecl;
    function getHost: JString; cdecl;
    function getPacFileUrl: Jnet_Uri; cdecl;
    function getPort: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isValid: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJProxyInfo = class(TJavaGenericImport<JProxyInfoClass, JProxyInfo>) end;

  Jnet_RouteInfoClass = interface(JObjectClass)
    ['{C12F65E4-E16F-448F-8AB3-DDE945F3E1B8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRTN_THROW: Integer; cdecl;
    {class} function _GetRTN_UNICAST: Integer; cdecl;
    {class} function _GetRTN_UNREACHABLE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RTN_THROW: Integer read _GetRTN_THROW;
    {class} property RTN_UNICAST: Integer read _GetRTN_UNICAST;
    {class} property RTN_UNREACHABLE: Integer read _GetRTN_UNREACHABLE;
  end;

  [JavaSignature('android/net/RouteInfo')]
  Jnet_RouteInfo = interface(JObject)
    ['{6198031B-E49A-4F15-9701-CE9BB025A3C2}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDestination: JIpPrefix; cdecl;
    function getGateway: JInetAddress; cdecl;
    function getInterface: JString; cdecl;
    function getType: Integer; cdecl;
    function hasGateway: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDefaultRoute: Boolean; cdecl;
    function matches(destination: JInetAddress): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJnet_RouteInfo = class(TJavaGenericImport<Jnet_RouteInfoClass, Jnet_RouteInfo>) end;

  JSSLCertificateSocketFactoryClass = interface(Jssl_SSLSocketFactoryClass)
    ['{9D55AD48-6A40-4A25-9D2E-85BEF8D07520}']
    {class} function init(handshakeTimeoutMillis: Integer): JSSLCertificateSocketFactory; cdecl;//Deprecated
    {class} function getDefault(handshakeTimeoutMillis: Integer): Jnet_SocketFactory; cdecl; overload;
    {class} function getDefault(handshakeTimeoutMillis: Integer; cache: JSSLSessionCache): Jssl_SSLSocketFactory; cdecl; overload;
    {class} //function getHttpSocketFactory(handshakeTimeoutMillis: Integer; cache: JSSLSessionCache): JSSLSocketFactory; cdecl;//Deprecated
    {class} function getInsecure(handshakeTimeoutMillis: Integer; cache: JSSLSessionCache): Jssl_SSLSocketFactory; cdecl;
  end;

  [JavaSignature('android/net/SSLCertificateSocketFactory')]
  JSSLCertificateSocketFactory = interface(Jssl_SSLSocketFactory)
    ['{1A6F8032-14A4-4C59-94E8-A4D6FAAB2ED2}']
    function createSocket(k: JSocket; host: JString; port: Integer; close: Boolean): JSocket; cdecl; overload;
    function createSocket: JSocket; cdecl; overload;
    function createSocket(addr: JInetAddress; port: Integer; localAddr: JInetAddress; localPort: Integer): JSocket; cdecl; overload;
    function createSocket(addr: JInetAddress; port: Integer): JSocket; cdecl; overload;
    function createSocket(host: JString; port: Integer; localAddr: JInetAddress; localPort: Integer): JSocket; cdecl; overload;
    function createSocket(host: JString; port: Integer): JSocket; cdecl; overload;
    function getDefaultCipherSuites: TJavaObjectArray<JString>; cdecl;
    function getNpnSelectedProtocol(socket: JSocket): TJavaArray<Byte>; cdecl;
    function getSupportedCipherSuites: TJavaObjectArray<JString>; cdecl;
    procedure setHostname(socket: JSocket; hostName: JString); cdecl;
    procedure setKeyManagers(keyManagers: TJavaObjectArray<JKeyManager>); cdecl;
    procedure setNpnProtocols(npnProtocols: TJavaBiArray<Byte>); cdecl;
    procedure setTrustManagers(trustManager: TJavaObjectArray<JTrustManager>); cdecl;
    procedure setUseSessionTickets(socket: JSocket; useSessionTickets: Boolean); cdecl;
  end;
  TJSSLCertificateSocketFactory = class(TJavaGenericImport<JSSLCertificateSocketFactoryClass, JSSLCertificateSocketFactory>) end;

  JSSLSessionCacheClass = interface(JObjectClass)
    ['{61DD6AD3-8B19-43E5-94CC-524F255B844A}']
    {class} function init(dir: JFile): JSSLSessionCache; cdecl; overload;
    {class} //function init(context: JContext): JSSLSessionCache; cdecl; overload;
  end;

  [JavaSignature('android/net/SSLSessionCache')]
  JSSLSessionCache = interface(JObject)
    ['{7E18FF5B-86E4-418E-BF7C-6D9F5A959B42}']
  end;
  TJSSLSessionCache = class(TJavaGenericImport<JSSLSessionCacheClass, JSSLSessionCache>) end;

  JSocketKeepaliveClass = interface(JObjectClass)
    ['{8D2D853A-86A0-4E49-B70A-01859F59E11D}']
    {class} function _GetERROR_HARDWARE_ERROR: Integer; cdecl;
    {class} function _GetERROR_INSUFFICIENT_RESOURCES: Integer; cdecl;
    {class} function _GetERROR_INVALID_INTERVAL: Integer; cdecl;
    {class} function _GetERROR_INVALID_IP_ADDRESS: Integer; cdecl;
    {class} function _GetERROR_INVALID_LENGTH: Integer; cdecl;
    {class} function _GetERROR_INVALID_NETWORK: Integer; cdecl;
    {class} function _GetERROR_INVALID_PORT: Integer; cdecl;
    {class} function _GetERROR_INVALID_SOCKET: Integer; cdecl;
    {class} function _GetERROR_SOCKET_NOT_IDLE: Integer; cdecl;
    {class} function _GetERROR_UNSUPPORTED: Integer; cdecl;
    {class} property ERROR_HARDWARE_ERROR: Integer read _GetERROR_HARDWARE_ERROR;
    {class} property ERROR_INSUFFICIENT_RESOURCES: Integer read _GetERROR_INSUFFICIENT_RESOURCES;
    {class} property ERROR_INVALID_INTERVAL: Integer read _GetERROR_INVALID_INTERVAL;
    {class} property ERROR_INVALID_IP_ADDRESS: Integer read _GetERROR_INVALID_IP_ADDRESS;
    {class} property ERROR_INVALID_LENGTH: Integer read _GetERROR_INVALID_LENGTH;
    {class} property ERROR_INVALID_NETWORK: Integer read _GetERROR_INVALID_NETWORK;
    {class} property ERROR_INVALID_PORT: Integer read _GetERROR_INVALID_PORT;
    {class} property ERROR_INVALID_SOCKET: Integer read _GetERROR_INVALID_SOCKET;
    {class} property ERROR_SOCKET_NOT_IDLE: Integer read _GetERROR_SOCKET_NOT_IDLE;
    {class} property ERROR_UNSUPPORTED: Integer read _GetERROR_UNSUPPORTED;
  end;

  [JavaSignature('android/net/SocketKeepalive')]
  JSocketKeepalive = interface(JObject)
    ['{701FA2EF-AFBE-4A48-A236-5984B3CA24B0}']
    procedure close; cdecl;
    procedure start(intervalSec: Integer); cdecl;
    procedure stop; cdecl;
  end;
  TJSocketKeepalive = class(TJavaGenericImport<JSocketKeepaliveClass, JSocketKeepalive>) end;

  JSocketKeepalive_CallbackClass = interface(JObjectClass)
    ['{1825AB9C-DF1A-497D-8CF0-B9A1D45403DE}']
    {class} function init: JSocketKeepalive_Callback; cdecl;
  end;

  [JavaSignature('android/net/SocketKeepalive$Callback')]
  JSocketKeepalive_Callback = interface(JObject)
    ['{D01AAA32-2384-4239-BF94-0F988EEC6B98}']
    procedure onDataReceived; cdecl;
    procedure onError(error: Integer); cdecl;
    procedure onStarted; cdecl;
    procedure onStopped; cdecl;
  end;
  TJSocketKeepalive_Callback = class(TJavaGenericImport<JSocketKeepalive_CallbackClass, JSocketKeepalive_Callback>) end;

  JStaticIpConfigurationClass = interface(JObjectClass)
    ['{9D5A3F4F-B4CA-4212-9026-609C1883E3BC}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/StaticIpConfiguration')]
  JStaticIpConfiguration = interface(JObject)
    ['{A1EE5AA6-77B0-4260-A462-DA3EE549D2F0}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDnsServers: JList; cdecl;
    function getDomains: JString; cdecl;
    function getGateway: JInetAddress; cdecl;
    function getIpAddress: JLinkAddress; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJStaticIpConfiguration = class(TJavaGenericImport<JStaticIpConfigurationClass, JStaticIpConfiguration>) end;

  JStaticIpConfiguration_BuilderClass = interface(JObjectClass)
    ['{C2D4BEC2-EEE2-4D60-9FF5-A3F41834DFE5}']
    {class} function init: JStaticIpConfiguration_Builder; cdecl;
  end;

  [JavaSignature('android/net/StaticIpConfiguration$Builder')]
  JStaticIpConfiguration_Builder = interface(JObject)
    ['{18B86794-B2C2-4255-8477-94EA258579C8}']
    function build: JStaticIpConfiguration; cdecl;
    function setDnsServers(dnsServers: JIterable): JStaticIpConfiguration_Builder; cdecl;
    function setDomains(newDomains: JString): JStaticIpConfiguration_Builder; cdecl;
    function setGateway(gateway: JInetAddress): JStaticIpConfiguration_Builder; cdecl;
    function setIpAddress(ipAddress: JLinkAddress): JStaticIpConfiguration_Builder; cdecl;
  end;
  TJStaticIpConfiguration_Builder = class(TJavaGenericImport<JStaticIpConfiguration_BuilderClass, JStaticIpConfiguration_Builder>) end;

  JTelephonyNetworkSpecifierClass = interface(JNetworkSpecifierClass)
    ['{539093F6-B5CF-4912-AF64-B538620620CB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/TelephonyNetworkSpecifier')]
  JTelephonyNetworkSpecifier = interface(JNetworkSpecifier)
    ['{B4F03E64-F211-495B-9A26-5B3CC6D46CF7}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getSubscriptionId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTelephonyNetworkSpecifier = class(TJavaGenericImport<JTelephonyNetworkSpecifierClass, JTelephonyNetworkSpecifier>) end;

  JTelephonyNetworkSpecifier_BuilderClass = interface(JObjectClass)
    ['{71D6E33E-595A-4566-A9C4-60A57961BBA6}']
    {class} function init: JTelephonyNetworkSpecifier_Builder; cdecl;
  end;

  [JavaSignature('android/net/TelephonyNetworkSpecifier$Builder')]
  JTelephonyNetworkSpecifier_Builder = interface(JObject)
    ['{963E3C08-1BF9-4A6D-A8C7-B2E40607EF44}']
    function build: JTelephonyNetworkSpecifier; cdecl;
    function setSubscriptionId(subId: Integer): JTelephonyNetworkSpecifier_Builder; cdecl;
  end;
  TJTelephonyNetworkSpecifier_Builder = class(TJavaGenericImport<JTelephonyNetworkSpecifier_BuilderClass, JTelephonyNetworkSpecifier_Builder>) end;

  JTrafficStatsClass = interface(JObjectClass)
    ['{971C68C9-ABA0-4ED9-A1C7-16A08AF59605}']
    {class} function _GetUNSUPPORTED: Integer; cdecl;
    {class} function init: JTrafficStats; cdecl;
    {class} procedure clearThreadStatsTag; cdecl;
    {class} procedure clearThreadStatsUid; cdecl;
    {class} function getAndSetThreadStatsTag(tag: Integer): Integer; cdecl;
    {class} function getMobileRxBytes: Int64; cdecl;
    {class} function getMobileRxPackets: Int64; cdecl;
    {class} function getMobileTxBytes: Int64; cdecl;
    {class} function getMobileTxPackets: Int64; cdecl;
    {class} function getRxBytes(iface: JString): Int64; cdecl;
    {class} function getRxPackets(iface: JString): Int64; cdecl;
    {class} function getThreadStatsTag: Integer; cdecl;
    {class} function getThreadStatsUid: Integer; cdecl;
    {class} function getTotalRxBytes: Int64; cdecl;
    {class} function getTotalRxPackets: Int64; cdecl;
    {class} function getTotalTxBytes: Int64; cdecl;
    {class} function getTotalTxPackets: Int64; cdecl;
    {class} function getTxBytes(iface: JString): Int64; cdecl;
    {class} function getTxPackets(iface: JString): Int64; cdecl;
    {class} function getUidRxBytes(uid: Integer): Int64; cdecl;
    {class} function getUidRxPackets(uid: Integer): Int64; cdecl;
    {class} function getUidTcpRxBytes(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidTcpRxSegments(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidTcpTxBytes(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidTcpTxSegments(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidTxBytes(uid: Integer): Int64; cdecl;
    {class} function getUidTxPackets(uid: Integer): Int64; cdecl;
    {class} function getUidUdpRxBytes(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidUdpRxPackets(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidUdpTxBytes(uid: Integer): Int64; cdecl;//Deprecated
    {class} function getUidUdpTxPackets(uid: Integer): Int64; cdecl;//Deprecated
    {class} procedure incrementOperationCount(operationCount: Integer); cdecl; overload;
    {class} procedure incrementOperationCount(tag: Integer; operationCount: Integer); cdecl; overload;
    {class} procedure setThreadStatsTag(tag: Integer); cdecl;
    {class} procedure setThreadStatsUid(uid: Integer); cdecl;
    {class} procedure setThreadStatsUidSelf; cdecl;//Deprecated
    {class} procedure tagDatagramSocket(socket: JDatagramSocket); cdecl;
    {class} procedure tagFileDescriptor(fd: JFileDescriptor); cdecl;
    {class} procedure tagSocket(socket: JSocket); cdecl;
    {class} procedure untagDatagramSocket(socket: JDatagramSocket); cdecl;
    {class} procedure untagFileDescriptor(fd: JFileDescriptor); cdecl;
    {class} procedure untagSocket(socket: JSocket); cdecl;
    {class} property UNSUPPORTED: Integer read _GetUNSUPPORTED;
  end;

  [JavaSignature('android/net/TrafficStats')]
  JTrafficStats = interface(JObject)
    ['{98FB5C1E-E7AB-4130-9EEB-2DADA2B3C015}']
  end;
  TJTrafficStats = class(TJavaGenericImport<JTrafficStatsClass, JTrafficStats>) end;

  JTransportInfoClass = interface(IJavaClass)
    ['{6F7B23F1-5A8E-4963-A4B6-580830F475E2}']
  end;

  [JavaSignature('android/net/TransportInfo')]
  JTransportInfo = interface(IJavaInstance)
    ['{E4EC4CAA-4C1F-4C1F-9F63-2F5702993407}']
  end;
  TJTransportInfo = class(TJavaGenericImport<JTransportInfoClass, JTransportInfo>) end;

  Jnet_UriClass = interface(JObjectClass)
    ['{26008A37-774A-4F63-817A-639A3B749539}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEMPTY: Jnet_Uri; cdecl;
    {class} function decode(s: JString): JString; cdecl;
    {class} function encode(s: JString): JString; cdecl; overload;
    {class} function encode(s: JString; allow: JString): JString; cdecl; overload;
    {class} function fromFile(file_: JFile): Jnet_Uri; cdecl;
    {class} function fromParts(scheme: JString; ssp: JString; fragment: JString): Jnet_Uri; cdecl;
    {class} function parse(uriString: JString): Jnet_Uri; cdecl;
    {class} function withAppendedPath(baseUri: Jnet_Uri; pathSegment: JString): Jnet_Uri; cdecl;
    {class} procedure writeToParcel(out_: JParcel; uri: Jnet_Uri); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EMPTY: Jnet_Uri read _GetEMPTY;
  end;

  [JavaSignature('android/net/Uri')]
  Jnet_Uri = interface(JObject)
    ['{FBC1913D-A35B-4E62-ABD1-7575BEC0488E}']
    function buildUpon: JUri_Builder; cdecl;
    function compareTo(other: Jnet_Uri): Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAuthority: JString; cdecl;
    function getBooleanQueryParameter(key: JString; defaultValue: Boolean): Boolean; cdecl;
    function getEncodedAuthority: JString; cdecl;
    function getEncodedFragment: JString; cdecl;
    function getEncodedPath: JString; cdecl;
    function getEncodedQuery: JString; cdecl;
    function getEncodedSchemeSpecificPart: JString; cdecl;
    function getEncodedUserInfo: JString; cdecl;
    function getFragment: JString; cdecl;
    function getHost: JString; cdecl;
    function getLastPathSegment: JString; cdecl;
    function getPath: JString; cdecl;
    function getPathSegments: JList; cdecl;
    function getPort: Integer; cdecl;
    function getQuery: JString; cdecl;
    function getQueryParameter(key: JString): JString; cdecl;
    function getQueryParameterNames: JSet; cdecl;
    function getQueryParameters(key: JString): JList; cdecl;
    function getScheme: JString; cdecl;
    function getSchemeSpecificPart: JString; cdecl;
    function getUserInfo: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isAbsolute: Boolean; cdecl;
    function isHierarchical: Boolean; cdecl;
    function isOpaque: Boolean; cdecl;
    function isRelative: Boolean; cdecl;
    function normalizeScheme: Jnet_Uri; cdecl;
    function toString: JString; cdecl;
  end;
  TJnet_Uri = class(TJavaGenericImport<Jnet_UriClass, Jnet_Uri>) end;

  JUri_BuilderClass = interface(JObjectClass)
    ['{A28CFEC0-2796-4427-A612-4F8D7389ECEB}']
    {class} function init: JUri_Builder; cdecl;
  end;

  [JavaSignature('android/net/Uri$Builder')]
  JUri_Builder = interface(JObject)
    ['{764C6F4F-0EE9-4CC4-98C4-C2FDE6E73B7A}']
    function appendEncodedPath(newSegment: JString): JUri_Builder; cdecl;
    function appendPath(newSegment: JString): JUri_Builder; cdecl;
    function appendQueryParameter(key: JString; value: JString): JUri_Builder; cdecl;
    function authority(authority: JString): JUri_Builder; cdecl;
    function build: Jnet_Uri; cdecl;
    function clearQuery: JUri_Builder; cdecl;
    function encodedAuthority(authority: JString): JUri_Builder; cdecl;
    function encodedFragment(fragment: JString): JUri_Builder; cdecl;
    function encodedOpaquePart(opaquePart: JString): JUri_Builder; cdecl;
    function encodedPath(path: JString): JUri_Builder; cdecl;
    function encodedQuery(query: JString): JUri_Builder; cdecl;
    function fragment(fragment: JString): JUri_Builder; cdecl;
    function opaquePart(opaquePart: JString): JUri_Builder; cdecl;
    function path(path: JString): JUri_Builder; cdecl;
    function query(query: JString): JUri_Builder; cdecl;
    function scheme(scheme: JString): JUri_Builder; cdecl;
    function toString: JString; cdecl;
  end;
  TJUri_Builder = class(TJavaGenericImport<JUri_BuilderClass, JUri_Builder>) end;

  JUrlQuerySanitizerClass = interface(JObjectClass)
    ['{22D8C5C5-F858-4034-88C1-C2459E81E112}']
    {class} function init: JUrlQuerySanitizer; cdecl; overload;
    {class} function init(url: JString): JUrlQuerySanitizer; cdecl; overload;
    {class} function getAllButNulAndAngleBracketsLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getAllButNulLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getAllButWhitespaceLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getAllIllegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getAmpAndSpaceLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getAmpLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getSpaceLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getUrlAndSpaceLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    {class} function getUrlLegal: JUrlQuerySanitizer_ValueSanitizer; cdecl;
  end;

  [JavaSignature('android/net/UrlQuerySanitizer')]
  JUrlQuerySanitizer = interface(JObject)
    ['{2475AD87-4B23-40DE-B157-60C6A65B7BFD}']
    function getAllowUnregisteredParamaters: Boolean; cdecl;
    function getEffectiveValueSanitizer(parameter: JString): JUrlQuerySanitizer_ValueSanitizer; cdecl;
    function getParameterList: JList; cdecl;
    function getParameterSet: JSet; cdecl;
    function getPreferFirstRepeatedParameter: Boolean; cdecl;
    function getUnregisteredParameterValueSanitizer: JUrlQuerySanitizer_ValueSanitizer; cdecl;
    function getValue(parameter: JString): JString; cdecl;
    function getValueSanitizer(parameter: JString): JUrlQuerySanitizer_ValueSanitizer; cdecl;
    function hasParameter(parameter: JString): Boolean; cdecl;
    procedure parseQuery(query: JString); cdecl;
    procedure parseUrl(url: JString); cdecl;
    procedure registerParameter(parameter: JString; valueSanitizer: JUrlQuerySanitizer_ValueSanitizer); cdecl;
    procedure registerParameters(parameters: TJavaObjectArray<JString>; valueSanitizer: JUrlQuerySanitizer_ValueSanitizer); cdecl;
    procedure setAllowUnregisteredParamaters(allowUnregisteredParamaters: Boolean); cdecl;
    procedure setPreferFirstRepeatedParameter(preferFirstRepeatedParameter: Boolean); cdecl;
    procedure setUnregisteredParameterValueSanitizer(sanitizer: JUrlQuerySanitizer_ValueSanitizer); cdecl;
    function unescape(string_: JString): JString; cdecl;
  end;
  TJUrlQuerySanitizer = class(TJavaGenericImport<JUrlQuerySanitizerClass, JUrlQuerySanitizer>) end;

  JUrlQuerySanitizer_IllegalCharacterValueSanitizerClass = interface(JObjectClass)
    ['{EEE055D8-32B1-49CD-AFF3-DA14E32AF8B2}']
    {class} function _GetALL_BUT_NUL_AND_ANGLE_BRACKETS_LEGAL: Integer; cdecl;
    {class} function _GetALL_BUT_NUL_LEGAL: Integer; cdecl;
    {class} function _GetALL_BUT_WHITESPACE_LEGAL: Integer; cdecl;
    {class} function _GetALL_ILLEGAL: Integer; cdecl;
    {class} function _GetALL_OK: Integer; cdecl;
    {class} function _GetALL_WHITESPACE_OK: Integer; cdecl;
    {class} function _GetAMP_AND_SPACE_LEGAL: Integer; cdecl;
    {class} function _GetAMP_LEGAL: Integer; cdecl;
    {class} function _GetAMP_OK: Integer; cdecl;
    {class} function _GetDQUOTE_OK: Integer; cdecl;
    {class} function _GetGT_OK: Integer; cdecl;
    {class} function _GetLT_OK: Integer; cdecl;
    {class} function _GetNON_7_BIT_ASCII_OK: Integer; cdecl;
    {class} function _GetNUL_OK: Integer; cdecl;
    {class} function _GetOTHER_WHITESPACE_OK: Integer; cdecl;
    {class} function _GetPCT_OK: Integer; cdecl;
    {class} function _GetSCRIPT_URL_OK: Integer; cdecl;
    {class} function _GetSPACE_LEGAL: Integer; cdecl;
    {class} function _GetSPACE_OK: Integer; cdecl;
    {class} function _GetSQUOTE_OK: Integer; cdecl;
    {class} function _GetURL_AND_SPACE_LEGAL: Integer; cdecl;
    {class} function _GetURL_LEGAL: Integer; cdecl;
    {class} function init(flags: Integer): JUrlQuerySanitizer_IllegalCharacterValueSanitizer; cdecl;
    {class} property ALL_BUT_NUL_AND_ANGLE_BRACKETS_LEGAL: Integer read _GetALL_BUT_NUL_AND_ANGLE_BRACKETS_LEGAL;
    {class} property ALL_BUT_NUL_LEGAL: Integer read _GetALL_BUT_NUL_LEGAL;
    {class} property ALL_BUT_WHITESPACE_LEGAL: Integer read _GetALL_BUT_WHITESPACE_LEGAL;
    {class} property ALL_ILLEGAL: Integer read _GetALL_ILLEGAL;
    {class} property ALL_OK: Integer read _GetALL_OK;
    {class} property ALL_WHITESPACE_OK: Integer read _GetALL_WHITESPACE_OK;
    {class} property AMP_AND_SPACE_LEGAL: Integer read _GetAMP_AND_SPACE_LEGAL;
    {class} property AMP_LEGAL: Integer read _GetAMP_LEGAL;
    {class} property AMP_OK: Integer read _GetAMP_OK;
    {class} property DQUOTE_OK: Integer read _GetDQUOTE_OK;
    {class} property GT_OK: Integer read _GetGT_OK;
    {class} property LT_OK: Integer read _GetLT_OK;
    {class} property NON_7_BIT_ASCII_OK: Integer read _GetNON_7_BIT_ASCII_OK;
    {class} property NUL_OK: Integer read _GetNUL_OK;
    {class} property OTHER_WHITESPACE_OK: Integer read _GetOTHER_WHITESPACE_OK;
    {class} property PCT_OK: Integer read _GetPCT_OK;
    {class} property SCRIPT_URL_OK: Integer read _GetSCRIPT_URL_OK;
    {class} property SPACE_LEGAL: Integer read _GetSPACE_LEGAL;
    {class} property SPACE_OK: Integer read _GetSPACE_OK;
    {class} property SQUOTE_OK: Integer read _GetSQUOTE_OK;
    {class} property URL_AND_SPACE_LEGAL: Integer read _GetURL_AND_SPACE_LEGAL;
    {class} property URL_LEGAL: Integer read _GetURL_LEGAL;
  end;

  [JavaSignature('android/net/UrlQuerySanitizer$IllegalCharacterValueSanitizer')]
  JUrlQuerySanitizer_IllegalCharacterValueSanitizer = interface(JObject)
    ['{78B43961-AA50-497C-84D8-35F7DEFA0DB3}']
    function sanitize(value: JString): JString; cdecl;
  end;
  TJUrlQuerySanitizer_IllegalCharacterValueSanitizer = class(TJavaGenericImport<JUrlQuerySanitizer_IllegalCharacterValueSanitizerClass, JUrlQuerySanitizer_IllegalCharacterValueSanitizer>) end;

  JUrlQuerySanitizer_ParameterValuePairClass = interface(JObjectClass)
    ['{11CD7EEA-5780-434D-A1BE-FC2475589D93}']
    {class} function init(parameter: JString; value: JString): JUrlQuerySanitizer_ParameterValuePair; cdecl;
  end;

  [JavaSignature('android/net/UrlQuerySanitizer$ParameterValuePair')]
  JUrlQuerySanitizer_ParameterValuePair = interface(JObject)
    ['{A76C91ED-7A5C-46A5-81A2-38A2F4FF9551}']
    function _GetmParameter: JString; cdecl;
    procedure _SetmParameter(Value: JString); cdecl;
    function _GetmValue: JString; cdecl;
    procedure _SetmValue(Value: JString); cdecl;
    property mParameter: JString read _GetmParameter write _SetmParameter;
    property mValue: JString read _GetmValue write _SetmValue;
  end;
  TJUrlQuerySanitizer_ParameterValuePair = class(TJavaGenericImport<JUrlQuerySanitizer_ParameterValuePairClass, JUrlQuerySanitizer_ParameterValuePair>) end;

  JUrlQuerySanitizer_ValueSanitizerClass = interface(IJavaClass)
    ['{7CE445EF-AD82-4C81-BF3E-F5E9F7E085EB}']
  end;

  [JavaSignature('android/net/UrlQuerySanitizer$ValueSanitizer')]
  JUrlQuerySanitizer_ValueSanitizer = interface(IJavaInstance)
    ['{748C377B-1C9B-4602-B488-DBEC1A034D70}']
    function sanitize(value: JString): JString; cdecl;
  end;
  TJUrlQuerySanitizer_ValueSanitizer = class(TJavaGenericImport<JUrlQuerySanitizer_ValueSanitizerClass, JUrlQuerySanitizer_ValueSanitizer>) end;

  JVpnManagerClass = interface(JObjectClass)
    ['{FBED533A-ABBC-445E-B3A0-9BBB08C21178}']
    {class} function _GetACTION_VPN_MANAGER_EVENT: JString; cdecl;
    {class} function _GetCATEGORY_EVENT_ALWAYS_ON_STATE_CHANGED: JString; cdecl;
    {class} function _GetCATEGORY_EVENT_DEACTIVATED_BY_USER: JString; cdecl;
    {class} function _GetCATEGORY_EVENT_IKE_ERROR: JString; cdecl;
    {class} function _GetCATEGORY_EVENT_NETWORK_ERROR: JString; cdecl;
    {class} function _GetERROR_CLASS_NOT_RECOVERABLE: Integer; cdecl;
    {class} function _GetERROR_CLASS_RECOVERABLE: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_IO: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_LOST: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_PROTOCOL_TIMEOUT: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_UNKNOWN_HOST: Integer; cdecl;
    {class} function _GetEXTRA_ERROR_CLASS: JString; cdecl;
    {class} function _GetEXTRA_ERROR_CODE: JString; cdecl;
    {class} function _GetEXTRA_SESSION_KEY: JString; cdecl;
    {class} function _GetEXTRA_TIMESTAMP_MILLIS: JString; cdecl;
    {class} function _GetEXTRA_UNDERLYING_LINK_PROPERTIES: JString; cdecl;
    {class} function _GetEXTRA_UNDERLYING_NETWORK: JString; cdecl;
    {class} function _GetEXTRA_UNDERLYING_NETWORK_CAPABILITIES: JString; cdecl;
    {class} function _GetEXTRA_VPN_PROFILE_STATE: JString; cdecl;
    {class} property ACTION_VPN_MANAGER_EVENT: JString read _GetACTION_VPN_MANAGER_EVENT;
    {class} property CATEGORY_EVENT_ALWAYS_ON_STATE_CHANGED: JString read _GetCATEGORY_EVENT_ALWAYS_ON_STATE_CHANGED;
    {class} property CATEGORY_EVENT_DEACTIVATED_BY_USER: JString read _GetCATEGORY_EVENT_DEACTIVATED_BY_USER;
    {class} property CATEGORY_EVENT_IKE_ERROR: JString read _GetCATEGORY_EVENT_IKE_ERROR;
    {class} property CATEGORY_EVENT_NETWORK_ERROR: JString read _GetCATEGORY_EVENT_NETWORK_ERROR;
    {class} property ERROR_CLASS_NOT_RECOVERABLE: Integer read _GetERROR_CLASS_NOT_RECOVERABLE;
    {class} property ERROR_CLASS_RECOVERABLE: Integer read _GetERROR_CLASS_RECOVERABLE;
    {class} property ERROR_CODE_NETWORK_IO: Integer read _GetERROR_CODE_NETWORK_IO;
    {class} property ERROR_CODE_NETWORK_LOST: Integer read _GetERROR_CODE_NETWORK_LOST;
    {class} property ERROR_CODE_NETWORK_PROTOCOL_TIMEOUT: Integer read _GetERROR_CODE_NETWORK_PROTOCOL_TIMEOUT;
    {class} property ERROR_CODE_NETWORK_UNKNOWN_HOST: Integer read _GetERROR_CODE_NETWORK_UNKNOWN_HOST;
    {class} property EXTRA_ERROR_CLASS: JString read _GetEXTRA_ERROR_CLASS;
    {class} property EXTRA_ERROR_CODE: JString read _GetEXTRA_ERROR_CODE;
    {class} property EXTRA_SESSION_KEY: JString read _GetEXTRA_SESSION_KEY;
    {class} property EXTRA_TIMESTAMP_MILLIS: JString read _GetEXTRA_TIMESTAMP_MILLIS;
    {class} property EXTRA_UNDERLYING_LINK_PROPERTIES: JString read _GetEXTRA_UNDERLYING_LINK_PROPERTIES;
    {class} property EXTRA_UNDERLYING_NETWORK: JString read _GetEXTRA_UNDERLYING_NETWORK;
    {class} property EXTRA_UNDERLYING_NETWORK_CAPABILITIES: JString read _GetEXTRA_UNDERLYING_NETWORK_CAPABILITIES;
    {class} property EXTRA_VPN_PROFILE_STATE: JString read _GetEXTRA_VPN_PROFILE_STATE;
  end;

  [JavaSignature('android/net/VpnManager')]
  JVpnManager = interface(JObject)
    ['{5767601E-A927-4DC1-B234-43CD4639F865}']
    procedure deleteProvisionedVpnProfile; cdecl;
    function getProvisionedVpnProfileState: JVpnProfileState; cdecl;
    //function provisionVpnProfile(profile: JPlatformVpnProfile): JIntent; cdecl;
    procedure startProvisionedVpnProfile; cdecl;//Deprecated
    function startProvisionedVpnProfileSession: JString; cdecl;
    procedure stopProvisionedVpnProfile; cdecl;
  end;
  TJVpnManager = class(TJavaGenericImport<JVpnManagerClass, JVpnManager>) end;

  JVpnProfileStateClass = interface(JObjectClass)
    ['{449C99D6-FFB4-48FA-8EB5-2B6D1846BCE8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSTATE_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSTATE_FAILED: Integer; cdecl;
    {class} function init(state: Integer; sessionKey: JString; alwaysOn: Boolean; lockdown: Boolean): JVpnProfileState; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property STATE_CONNECTED: Integer read _GetSTATE_CONNECTED;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_DISCONNECTED: Integer read _GetSTATE_DISCONNECTED;
    {class} property STATE_FAILED: Integer read _GetSTATE_FAILED;
  end;

  [JavaSignature('android/net/VpnProfileState')]
  JVpnProfileState = interface(JObject)
    ['{3D888549-663D-441D-AE07-4BEDD9C6CBA5}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getSessionId: JString; cdecl;
    function getState: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAlwaysOn: Boolean; cdecl;
    function isLockdownEnabled: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJVpnProfileState = class(TJavaGenericImport<JVpnProfileStateClass, JVpnProfileState>) end;

  // android.net.VpnService
  JVpnService_BuilderClass = interface(JObjectClass)
    ['{F6E76953-EF29-4A89-A854-FF49C09A0590}']
    {class} function init: JVpnService_Builder; cdecl;
  end;

  [JavaSignature('android/net/VpnService$Builder')]
  JVpnService_Builder = interface(JObject)
    ['{947B9F4C-6722-4706-839B-6B9BC06AE2FA}']
    function addAddress(address: JInetAddress; prefixLength: Integer): JVpnService_Builder; cdecl; overload;
    function addAddress(address: JString; prefixLength: Integer): JVpnService_Builder; cdecl; overload;
    function addAllowedApplication(packageName: JString): JVpnService_Builder; cdecl;
    function addDisallowedApplication(packageName: JString): JVpnService_Builder; cdecl;
    function addDnsServer(address: JInetAddress): JVpnService_Builder; cdecl; overload;
    function addDnsServer(address: JString): JVpnService_Builder; cdecl; overload;
    function addRoute(address: JInetAddress; prefixLength: Integer): JVpnService_Builder; cdecl; overload;
    function addRoute(prefix: JIpPrefix): JVpnService_Builder; cdecl; overload;
    function addRoute(address: JString; prefixLength: Integer): JVpnService_Builder; cdecl; overload;
    function addSearchDomain(domain: JString): JVpnService_Builder; cdecl;
    function allowBypass: JVpnService_Builder; cdecl;
    function allowFamily(family: Integer): JVpnService_Builder; cdecl;
    function establish: JParcelFileDescriptor; cdecl;
    function excludeRoute(prefix: JIpPrefix): JVpnService_Builder; cdecl;
    function setBlocking(blocking: Boolean): JVpnService_Builder; cdecl;
    //function setConfigureIntent(intent: JPendingIntent): JVpnService_Builder; cdecl;
    function setHttpProxy(proxyInfo: JProxyInfo): JVpnService_Builder; cdecl;
    function setMetered(isMetered: Boolean): JVpnService_Builder; cdecl;
    function setMtu(mtu: Integer): JVpnService_Builder; cdecl;
    function setSession(session: JString): JVpnService_Builder; cdecl;
    function setUnderlyingNetworks(networks: TJavaObjectArray<JNetwork>): JVpnService_Builder; cdecl;
  end;
  TJVpnService_Builder = class(TJavaGenericImport<JVpnService_BuilderClass, JVpnService_Builder>) end;

  JEapInfoClass = interface(JObjectClass)
    ['{E1129D9A-93A1-43B4-819F-2E51A42ED861}']
  end;

  [JavaSignature('android/net/eap/EapInfo')]
  JEapInfo = interface(JObject)
    ['{9FFA7FE2-5B5E-44A8-9172-D86CB07A6930}']
    function getEapMethodType: Integer; cdecl;
  end;
  TJEapInfo = class(TJavaGenericImport<JEapInfoClass, JEapInfo>) end;

  JEapAkaInfoClass = interface(JEapInfoClass)
    ['{62C7EE53-640E-4D29-BF7E-FE541515403A}']
  end;

  [JavaSignature('android/net/eap/EapAkaInfo')]
  JEapAkaInfo = interface(JEapInfo)
    ['{23EFC4AC-7F2C-4002-9EC6-CD31EF651E1D}']
    function getReauthId: TJavaArray<Byte>; cdecl;
  end;
  TJEapAkaInfo = class(TJavaGenericImport<JEapAkaInfoClass, JEapAkaInfo>) end;

  JEapAkaInfo_BuilderClass = interface(JObjectClass)
    ['{9641BDDB-CE95-462D-B663-DDB5BFA5B641}']
    {class} function init: JEapAkaInfo_Builder; cdecl;
  end;

  [JavaSignature('android/net/eap/EapAkaInfo$Builder')]
  JEapAkaInfo_Builder = interface(JObject)
    ['{36B30307-E1CD-4B29-81DE-E9D3FD48B169}']
    function build: JEapAkaInfo; cdecl;
    function setReauthId(reauthId: TJavaArray<Byte>): JEapAkaInfo_Builder; cdecl;
  end;
  TJEapAkaInfo_Builder = class(TJavaGenericImport<JEapAkaInfo_BuilderClass, JEapAkaInfo_Builder>) end;

  JEapSessionConfigClass = interface(JObjectClass)
    ['{16F20B48-15AB-4841-AE9F-A0A38C8F518C}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig')]
  JEapSessionConfig = interface(JObject)
    ['{DE7AEA82-9D72-40B2-B835-3064EC769BFF}']
    function getEapAkaConfig: JEapSessionConfig_EapAkaConfig; cdecl;
    function getEapAkaPrimeConfig: JEapSessionConfig_EapAkaPrimeConfig; cdecl;
    function getEapIdentity: TJavaArray<Byte>; cdecl;
    function getEapMsChapV2Config: JEapSessionConfig_EapMsChapV2Config; cdecl;
    function getEapSimConfig: JEapSessionConfig_EapSimConfig; cdecl;
    function getEapTtlsConfig: JEapSessionConfig_EapTtlsConfig; cdecl;
  end;
  TJEapSessionConfig = class(TJavaGenericImport<JEapSessionConfigClass, JEapSessionConfig>) end;

  JEapSessionConfig_BuilderClass = interface(JObjectClass)
    ['{994EAEE6-A176-4BA0-B942-7BD1B4262606}']
    {class} function init: JEapSessionConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$Builder')]
  JEapSessionConfig_Builder = interface(JObject)
    ['{91FB10F1-8CCC-4D8F-953D-2CC399EDA25A}']
    function build: JEapSessionConfig; cdecl;
    function setEapAkaConfig(subId: Integer; apptype: Integer): JEapSessionConfig_Builder; cdecl; overload;
    function setEapAkaConfig(subId: Integer; apptype: Integer; options: JEapSessionConfig_EapAkaOption): JEapSessionConfig_Builder; cdecl; overload;
    function setEapAkaPrimeConfig(subId: Integer; apptype: Integer; networkName: JString; allowMismatchedNetworkNames: Boolean): JEapSessionConfig_Builder; cdecl;
    function setEapIdentity(eapIdentity: TJavaArray<Byte>): JEapSessionConfig_Builder; cdecl;
    function setEapMsChapV2Config(username: JString; password: JString): JEapSessionConfig_Builder; cdecl;
    function setEapSimConfig(subId: Integer; apptype: Integer): JEapSessionConfig_Builder; cdecl;
    function setEapTtlsConfig(serverCaCert: JX509Certificate; innerEapSessionConfig: JEapSessionConfig): JEapSessionConfig_Builder; cdecl;
  end;
  TJEapSessionConfig_Builder = class(TJavaGenericImport<JEapSessionConfig_BuilderClass, JEapSessionConfig_Builder>) end;

  JEapSessionConfig_EapAkaConfigClass = interface(JObjectClass)
    ['{BD95316E-CE29-4DCC-9BAB-8C2E25B90043}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapAkaConfig')]
  JEapSessionConfig_EapAkaConfig = interface(JObject)
    ['{080D9F94-F624-4ADC-9A50-3169EA1CEEB3}']
    function getEapAkaOption: JEapSessionConfig_EapAkaOption; cdecl;
  end;
  TJEapSessionConfig_EapAkaConfig = class(TJavaGenericImport<JEapSessionConfig_EapAkaConfigClass, JEapSessionConfig_EapAkaConfig>) end;

  JEapSessionConfig_EapAkaOptionClass = interface(JObjectClass)
    ['{C258ADE5-E3FC-48DF-B39B-D9B8071B107A}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapAkaOption')]
  JEapSessionConfig_EapAkaOption = interface(JObject)
    ['{605A3979-3B58-4891-A864-E2FD2A81BEA7}']
    function getReauthId: TJavaArray<Byte>; cdecl;
  end;
  TJEapSessionConfig_EapAkaOption = class(TJavaGenericImport<JEapSessionConfig_EapAkaOptionClass, JEapSessionConfig_EapAkaOption>) end;

  JEapAkaOption_BuilderClass = interface(JObjectClass)
    ['{8463C837-E7FB-4570-A1E7-BC208BC4A7D1}']
    {class} function init: JEapAkaOption_Builder; cdecl;
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapAkaOption$Builder')]
  JEapAkaOption_Builder = interface(JObject)
    ['{0E5A59C7-A786-4167-81B1-9CF717FD07BD}']
    function build: JEapSessionConfig_EapAkaOption; cdecl;
    function setReauthId(reauthId: TJavaArray<Byte>): JEapAkaOption_Builder; cdecl;
  end;
  TJEapAkaOption_Builder = class(TJavaGenericImport<JEapAkaOption_BuilderClass, JEapAkaOption_Builder>) end;

  JEapSessionConfig_EapAkaPrimeConfigClass = interface(JEapSessionConfig_EapAkaConfigClass)
    ['{D1648FDB-FE07-4FFC-98E2-D9A9BF372865}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapAkaPrimeConfig')]
  JEapSessionConfig_EapAkaPrimeConfig = interface(JEapSessionConfig_EapAkaConfig)
    ['{5453454C-8BD5-41D6-991F-F53884BFB636}']
    function allowsMismatchedNetworkNames: Boolean; cdecl;
    function getNetworkName: JString; cdecl;
  end;
  TJEapSessionConfig_EapAkaPrimeConfig = class(TJavaGenericImport<JEapSessionConfig_EapAkaPrimeConfigClass, JEapSessionConfig_EapAkaPrimeConfig>) end;

  JEapSessionConfig_EapMethodConfigClass = interface(JObjectClass)
    ['{06A6E6C4-BB0B-4735-85E4-13F4D63A6CF4}']
    {class} function _GetEAP_TYPE_AKA: Integer; cdecl;
    {class} function _GetEAP_TYPE_AKA_PRIME: Integer; cdecl;
    {class} function _GetEAP_TYPE_MSCHAP_V2: Integer; cdecl;
    {class} function _GetEAP_TYPE_SIM: Integer; cdecl;
    {class} function _GetEAP_TYPE_TTLS: Integer; cdecl;
    {class} property EAP_TYPE_AKA: Integer read _GetEAP_TYPE_AKA;
    {class} property EAP_TYPE_AKA_PRIME: Integer read _GetEAP_TYPE_AKA_PRIME;
    {class} property EAP_TYPE_MSCHAP_V2: Integer read _GetEAP_TYPE_MSCHAP_V2;
    {class} property EAP_TYPE_SIM: Integer read _GetEAP_TYPE_SIM;
    {class} property EAP_TYPE_TTLS: Integer read _GetEAP_TYPE_TTLS;
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapMethodConfig')]
  JEapSessionConfig_EapMethodConfig = interface(JObject)
    ['{C63809AB-D4FA-4754-9D0E-3CEAB832A094}']
    function getMethodType: Integer; cdecl;
  end;
  TJEapSessionConfig_EapMethodConfig = class(TJavaGenericImport<JEapSessionConfig_EapMethodConfigClass, JEapSessionConfig_EapMethodConfig>) end;

  JEapSessionConfig_EapMsChapV2ConfigClass = interface(JEapSessionConfig_EapMethodConfigClass)
    ['{4DACDC25-0218-4FF7-8826-8BD4C4ADC3A2}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapMsChapV2Config')]
  JEapSessionConfig_EapMsChapV2Config = interface(JEapSessionConfig_EapMethodConfig)
    ['{1E7842F4-1086-4E32-98D6-70825B70A62E}']
    function getPassword: JString; cdecl;
    function getUsername: JString; cdecl;
  end;
  TJEapSessionConfig_EapMsChapV2Config = class(TJavaGenericImport<JEapSessionConfig_EapMsChapV2ConfigClass, JEapSessionConfig_EapMsChapV2Config>) end;

  JEapSessionConfig_EapSimConfigClass = interface(JObjectClass)
    ['{EC43939A-F370-4927-A215-52C0B77539D0}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapSimConfig')]
  JEapSessionConfig_EapSimConfig = interface(JObject)
    ['{50500863-DB4F-4638-AD02-C8528A879747}']
  end;
  TJEapSessionConfig_EapSimConfig = class(TJavaGenericImport<JEapSessionConfig_EapSimConfigClass, JEapSessionConfig_EapSimConfig>) end;

  JEapSessionConfig_EapTtlsConfigClass = interface(JEapSessionConfig_EapMethodConfigClass)
    ['{42C18A12-6C9B-4BC0-A1CB-C4270E4A1F7A}']
  end;

  [JavaSignature('android/net/eap/EapSessionConfig$EapTtlsConfig')]
  JEapSessionConfig_EapTtlsConfig = interface(JEapSessionConfig_EapMethodConfig)
    ['{B311D2B8-5843-4F07-B4A4-347A1E6EA4E2}']
    function getInnerEapSessionConfig: JEapSessionConfig; cdecl;
    function getServerCaCert: JX509Certificate; cdecl;
  end;
  TJEapSessionConfig_EapTtlsConfig = class(TJavaGenericImport<JEapSessionConfig_EapTtlsConfigClass, JEapSessionConfig_EapTtlsConfig>) end;

  JHttpResponseCacheClass = interface(JResponseCacheClass)
    ['{423ADA1E-2EC4-48A6-B45C-E94C16CB2DE2}']
    {class} function getInstalled: JHttpResponseCache; cdecl;
    {class} function install(directory: JFile; maxSize: Int64): JHttpResponseCache; cdecl;
  end;

  [JavaSignature('android/net/http/HttpResponseCache')]
  JHttpResponseCache = interface(JResponseCache)
    ['{A78C1FFC-572F-4155-B25D-BD32134BFABB}']
    procedure close; cdecl;
    procedure delete; cdecl;
    procedure flush; cdecl;
    function &get(uri: JURI; requestMethod: JString; requestHeaders: JMap): JCacheResponse; cdecl;
    function getHitCount: Integer; cdecl;
    function getNetworkCount: Integer; cdecl;
    function getRequestCount: Integer; cdecl;
    function maxSize: Int64; cdecl;
    function put(uri: JURI; urlConnection: JURLConnection): JCacheRequest; cdecl;
    function size: Int64; cdecl;
  end;
  TJHttpResponseCache = class(TJavaGenericImport<JHttpResponseCacheClass, JHttpResponseCache>) end;

  JSslCertificateClass = interface(JObjectClass)
    ['{015060F6-A45B-43B1-99F2-25FF14860D34}']
    {class} function init(issuedTo: JString; issuedBy: JString; validNotBefore: JString; validNotAfter: JString): JSslCertificate; cdecl; overload;//Deprecated
    {class} function init(issuedTo: JString; issuedBy: JString; validNotBefore: JDate; validNotAfter: JDate): JSslCertificate; cdecl; overload;//Deprecated
    {class} function init(certificate: JX509Certificate): JSslCertificate; cdecl; overload;
    {class} function restoreState(bundle: JBundle): JSslCertificate; cdecl;
    {class} function saveState(certificate: JSslCertificate): JBundle; cdecl;
  end;

  [JavaSignature('android/net/http/SslCertificate')]
  JSslCertificate = interface(JObject)
    ['{71905E46-8089-401A-ACA0-7C8CAB5BDCFB}']
    function getIssuedBy: JSslCertificate_DName; cdecl;
    function getIssuedTo: JSslCertificate_DName; cdecl;
    function getValidNotAfter: JString; cdecl;//Deprecated
    function getValidNotAfterDate: JDate; cdecl;
    function getValidNotBefore: JString; cdecl;//Deprecated
    function getValidNotBeforeDate: JDate; cdecl;
    function getX509Certificate: JX509Certificate; cdecl;
    function toString: JString; cdecl;
  end;
  TJSslCertificate = class(TJavaGenericImport<JSslCertificateClass, JSslCertificate>) end;

  JSslCertificate_DNameClass = interface(JObjectClass)
    ['{0E7DC9E1-A295-4FB0-B51C-58BC02DD2443}']
    {class} function init(dName: JString): JSslCertificate_DName; cdecl;
  end;

  [JavaSignature('android/net/http/SslCertificate$DName')]
  JSslCertificate_DName = interface(JObject)
    ['{EC2D4B89-D8F4-4D92-8861-C012DB574347}']
    function getCName: JString; cdecl;
    function getDName: JString; cdecl;
    function getOName: JString; cdecl;
    function getUName: JString; cdecl;
  end;
  TJSslCertificate_DName = class(TJavaGenericImport<JSslCertificate_DNameClass, JSslCertificate_DName>) end;

  JSslErrorClass = interface(JObjectClass)
    ['{46C60DBF-8FB1-4C8B-912D-AA3914A70766}']
    {class} function _GetSSL_DATE_INVALID: Integer; cdecl;
    {class} function _GetSSL_EXPIRED: Integer; cdecl;
    {class} function _GetSSL_IDMISMATCH: Integer; cdecl;
    {class} function _GetSSL_INVALID: Integer; cdecl;
    {class} function _GetSSL_MAX_ERROR: Integer; cdecl;
    {class} function _GetSSL_NOTYETVALID: Integer; cdecl;
    {class} function _GetSSL_UNTRUSTED: Integer; cdecl;
    {class} function init(error: Integer; certificate: JSslCertificate): JSslError; cdecl; overload;//Deprecated
    {class} function init(error: Integer; certificate: JX509Certificate): JSslError; cdecl; overload;//Deprecated
    {class} function init(error: Integer; certificate: JSslCertificate; url: JString): JSslError; cdecl; overload;
    {class} function init(error: Integer; certificate: JX509Certificate; url: JString): JSslError; cdecl; overload;
    {class} property SSL_DATE_INVALID: Integer read _GetSSL_DATE_INVALID;
    {class} property SSL_EXPIRED: Integer read _GetSSL_EXPIRED;
    {class} property SSL_IDMISMATCH: Integer read _GetSSL_IDMISMATCH;
    {class} property SSL_INVALID: Integer read _GetSSL_INVALID;
    {class} property SSL_MAX_ERROR: Integer read _GetSSL_MAX_ERROR;
    {class} property SSL_NOTYETVALID: Integer read _GetSSL_NOTYETVALID;
    {class} property SSL_UNTRUSTED: Integer read _GetSSL_UNTRUSTED;
  end;

  [JavaSignature('android/net/http/SslError')]
  JSslError = interface(JObject)
    ['{F52273BE-40F1-4502-9E59-72B4E06C0A47}']
    function addError(error: Integer): Boolean; cdecl;
    function getCertificate: JSslCertificate; cdecl;
    function getPrimaryError: Integer; cdecl;
    function getUrl: JString; cdecl;
    function hasError(error: Integer): Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJSslError = class(TJavaGenericImport<JSslErrorClass, JSslError>) end;

  JX509TrustManagerExtensionsClass = interface(JObjectClass)
    ['{C2B35291-4228-4954-9EAF-A99E596F9F70}']
    {class} function init(tm: JX509TrustManager): JX509TrustManagerExtensions; cdecl;
  end;

  [JavaSignature('android/net/http/X509TrustManagerExtensions')]
  JX509TrustManagerExtensions = interface(JObject)
    ['{600A4824-9BE9-4BBD-B8F4-9F698DC6015E}']
    function checkServerTrusted(chain: TJavaObjectArray<JX509Certificate>; authType: JString; host: JString): JList; cdecl;
    function isSameTrustConfiguration(hostname1: JString; hostname2: JString): Boolean; cdecl;
    function isUserAddedCertificate(cert: JX509Certificate): Boolean; cdecl;
  end;
  TJX509TrustManagerExtensions = class(TJavaGenericImport<JX509TrustManagerExtensionsClass, JX509TrustManagerExtensions>) end;

  JSaProposalClass = interface(JObjectClass)
    ['{17E76B66-7297-4CB6-BBDF-29E4BB686F54}']
    {class} function _GetDH_GROUP_1024_BIT_MODP: Integer; cdecl;
    {class} function _GetDH_GROUP_1536_BIT_MODP: Integer; cdecl;
    {class} function _GetDH_GROUP_2048_BIT_MODP: Integer; cdecl;
    {class} function _GetDH_GROUP_3072_BIT_MODP: Integer; cdecl;
    {class} function _GetDH_GROUP_4096_BIT_MODP: Integer; cdecl;
    {class} function _GetDH_GROUP_CURVE_25519: Integer; cdecl;
    {class} function _GetDH_GROUP_NONE: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_3DES: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_AES_CBC: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_AES_CTR: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_AES_GCM_12: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_AES_GCM_16: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_AES_GCM_8: Integer; cdecl;
    {class} function _GetENCRYPTION_ALGORITHM_CHACHA20_POLY1305: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_AES_CMAC_96: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_AES_XCBC_96: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_HMAC_SHA1_96: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_HMAC_SHA2_256_128: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_HMAC_SHA2_384_192: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_HMAC_SHA2_512_256: Integer; cdecl;
    {class} function _GetINTEGRITY_ALGORITHM_NONE: Integer; cdecl;
    {class} function _GetKEY_LEN_AES_128: Integer; cdecl;
    {class} function _GetKEY_LEN_AES_192: Integer; cdecl;
    {class} function _GetKEY_LEN_AES_256: Integer; cdecl;
    {class} function _GetKEY_LEN_UNUSED: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_AES128_CMAC: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_AES128_XCBC: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_HMAC_SHA1: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_SHA2_256: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_SHA2_384: Integer; cdecl;
    {class} function _GetPSEUDORANDOM_FUNCTION_SHA2_512: Integer; cdecl;
    {class} function getSupportedDhGroups: JSet; cdecl;
    {class} property DH_GROUP_1024_BIT_MODP: Integer read _GetDH_GROUP_1024_BIT_MODP;
    {class} property DH_GROUP_1536_BIT_MODP: Integer read _GetDH_GROUP_1536_BIT_MODP;
    {class} property DH_GROUP_2048_BIT_MODP: Integer read _GetDH_GROUP_2048_BIT_MODP;
    {class} property DH_GROUP_3072_BIT_MODP: Integer read _GetDH_GROUP_3072_BIT_MODP;
    {class} property DH_GROUP_4096_BIT_MODP: Integer read _GetDH_GROUP_4096_BIT_MODP;
    {class} property DH_GROUP_CURVE_25519: Integer read _GetDH_GROUP_CURVE_25519;
    {class} property DH_GROUP_NONE: Integer read _GetDH_GROUP_NONE;
    {class} property ENCRYPTION_ALGORITHM_3DES: Integer read _GetENCRYPTION_ALGORITHM_3DES;
    {class} property ENCRYPTION_ALGORITHM_AES_CBC: Integer read _GetENCRYPTION_ALGORITHM_AES_CBC;
    {class} property ENCRYPTION_ALGORITHM_AES_CTR: Integer read _GetENCRYPTION_ALGORITHM_AES_CTR;
    {class} property ENCRYPTION_ALGORITHM_AES_GCM_12: Integer read _GetENCRYPTION_ALGORITHM_AES_GCM_12;
    {class} property ENCRYPTION_ALGORITHM_AES_GCM_16: Integer read _GetENCRYPTION_ALGORITHM_AES_GCM_16;
    {class} property ENCRYPTION_ALGORITHM_AES_GCM_8: Integer read _GetENCRYPTION_ALGORITHM_AES_GCM_8;
    {class} property ENCRYPTION_ALGORITHM_CHACHA20_POLY1305: Integer read _GetENCRYPTION_ALGORITHM_CHACHA20_POLY1305;
    {class} property INTEGRITY_ALGORITHM_AES_CMAC_96: Integer read _GetINTEGRITY_ALGORITHM_AES_CMAC_96;
    {class} property INTEGRITY_ALGORITHM_AES_XCBC_96: Integer read _GetINTEGRITY_ALGORITHM_AES_XCBC_96;
    {class} property INTEGRITY_ALGORITHM_HMAC_SHA1_96: Integer read _GetINTEGRITY_ALGORITHM_HMAC_SHA1_96;
    {class} property INTEGRITY_ALGORITHM_HMAC_SHA2_256_128: Integer read _GetINTEGRITY_ALGORITHM_HMAC_SHA2_256_128;
    {class} property INTEGRITY_ALGORITHM_HMAC_SHA2_384_192: Integer read _GetINTEGRITY_ALGORITHM_HMAC_SHA2_384_192;
    {class} property INTEGRITY_ALGORITHM_HMAC_SHA2_512_256: Integer read _GetINTEGRITY_ALGORITHM_HMAC_SHA2_512_256;
    {class} property INTEGRITY_ALGORITHM_NONE: Integer read _GetINTEGRITY_ALGORITHM_NONE;
    {class} property KEY_LEN_AES_128: Integer read _GetKEY_LEN_AES_128;
    {class} property KEY_LEN_AES_192: Integer read _GetKEY_LEN_AES_192;
    {class} property KEY_LEN_AES_256: Integer read _GetKEY_LEN_AES_256;
    {class} property KEY_LEN_UNUSED: Integer read _GetKEY_LEN_UNUSED;
    {class} property PSEUDORANDOM_FUNCTION_AES128_CMAC: Integer read _GetPSEUDORANDOM_FUNCTION_AES128_CMAC;
    {class} property PSEUDORANDOM_FUNCTION_AES128_XCBC: Integer read _GetPSEUDORANDOM_FUNCTION_AES128_XCBC;
    {class} property PSEUDORANDOM_FUNCTION_HMAC_SHA1: Integer read _GetPSEUDORANDOM_FUNCTION_HMAC_SHA1;
    {class} property PSEUDORANDOM_FUNCTION_SHA2_256: Integer read _GetPSEUDORANDOM_FUNCTION_SHA2_256;
    {class} property PSEUDORANDOM_FUNCTION_SHA2_384: Integer read _GetPSEUDORANDOM_FUNCTION_SHA2_384;
    {class} property PSEUDORANDOM_FUNCTION_SHA2_512: Integer read _GetPSEUDORANDOM_FUNCTION_SHA2_512;
  end;

  [JavaSignature('android/net/ipsec/ike/SaProposal')]
  JSaProposal = interface(JObject)
    ['{44EC4DDC-5169-4149-830E-BF39BA287F1C}']
    function equals(o: JObject): Boolean; cdecl;
    function getDhGroups: JList; cdecl;
    function getEncryptionAlgorithms: JList; cdecl;
    function getIntegrityAlgorithms: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJSaProposal = class(TJavaGenericImport<JSaProposalClass, JSaProposal>) end;

  JChildSaProposalClass = interface(JSaProposalClass)
    ['{E85C39E3-C024-4F82-8107-D5A08998E27D}']
    {class} function getSupportedEncryptionAlgorithms: JSet; cdecl;
    {class} function getSupportedIntegrityAlgorithms: JSet; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSaProposal')]
  JChildSaProposal = interface(JSaProposal)
    ['{09CE982E-4E08-42D0-A464-AC269CFD38B9}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJChildSaProposal = class(TJavaGenericImport<JChildSaProposalClass, JChildSaProposal>) end;

  JChildSaProposal_BuilderClass = interface(JObjectClass)
    ['{D2E04798-2DFC-4393-A6B1-955BB570FAE9}']
    {class} function init: JChildSaProposal_Builder; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSaProposal$Builder')]
  JChildSaProposal_Builder = interface(JObject)
    ['{D9B03BC3-7139-4B36-9142-0172773577D4}']
    function addDhGroup(dhGroup: Integer): JChildSaProposal_Builder; cdecl;
    function addEncryptionAlgorithm(algorithm: Integer; keyLength: Integer): JChildSaProposal_Builder; cdecl;
    function addIntegrityAlgorithm(algorithm: Integer): JChildSaProposal_Builder; cdecl;
    function build: JChildSaProposal; cdecl;
  end;
  TJChildSaProposal_Builder = class(TJavaGenericImport<JChildSaProposal_BuilderClass, JChildSaProposal_Builder>) end;

  JChildSessionCallbackClass = interface(IJavaClass)
    ['{DDEE268C-D4B6-4891-B0D5-10FFF7156315}']
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSessionCallback')]
  JChildSessionCallback = interface(IJavaInstance)
    ['{14D3D1E3-8895-4711-BB78-45F83338E46B}']
    procedure onClosed; cdecl;
    procedure onClosedWithException(exception: JIkeException); cdecl;
    procedure onIpSecTransformCreated(ipSecTransform: JIpSecTransform; direction: Integer); cdecl;
    procedure onIpSecTransformDeleted(ipSecTransform: JIpSecTransform; direction: Integer); cdecl;
    procedure onOpened(sessionConfiguration: JChildSessionConfiguration); cdecl;
  end;
  TJChildSessionCallback = class(TJavaGenericImport<JChildSessionCallbackClass, JChildSessionCallback>) end;

  JChildSessionConfigurationClass = interface(JObjectClass)
    ['{3D37ED1A-E937-4500-8ADF-9ACA9B3B7AEE}']
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSessionConfiguration')]
  JChildSessionConfiguration = interface(JObject)
    ['{F2347DFF-769E-48B9-9D9F-FCD790720A6F}']
    function getInboundTrafficSelectors: JList; cdecl;
    function getOutboundTrafficSelectors: JList; cdecl;
  end;
  TJChildSessionConfiguration = class(TJavaGenericImport<JChildSessionConfigurationClass, JChildSessionConfiguration>) end;

  JChildSessionConfiguration_BuilderClass = interface(JObjectClass)
    ['{1E8AFCB3-A7CF-4146-8EDF-C7F1517576AA}']
    {class} function init(inTs: JList; outTs: JList): JChildSessionConfiguration_Builder; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSessionConfiguration$Builder')]
  JChildSessionConfiguration_Builder = interface(JObject)
    ['{C0979A4F-678E-4B0C-B611-5D82B7CA7191}']
    function build: JChildSessionConfiguration; cdecl;
  end;
  TJChildSessionConfiguration_Builder = class(TJavaGenericImport<JChildSessionConfiguration_BuilderClass, JChildSessionConfiguration_Builder>) end;

  JChildSessionParamsClass = interface(JObjectClass)
    ['{01912E26-5517-4EAC-87E3-07D25AFF98D0}']
  end;

  [JavaSignature('android/net/ipsec/ike/ChildSessionParams')]
  JChildSessionParams = interface(JObject)
    ['{55809E87-EB9E-43C8-B1FE-A61C09E90C67}']
    function equals(o: JObject): Boolean; cdecl;
    function getChildSaProposals: JList; cdecl;
    function getHardLifetimeSeconds: Integer; cdecl;
    function getInboundTrafficSelectors: JList; cdecl;
    function getOutboundTrafficSelectors: JList; cdecl;
    function getSoftLifetimeSeconds: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJChildSessionParams = class(TJavaGenericImport<JChildSessionParamsClass, JChildSessionParams>) end;

  JIkeIdentificationClass = interface(JObjectClass)
    ['{C4264FD4-91F1-4A01-BE30-0D9CB91D1CAD}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeIdentification')]
  JIkeIdentification = interface(JObject)
    ['{F927B999-13A9-47B6-8D68-02F100CC7F43}']
  end;
  TJIkeIdentification = class(TJavaGenericImport<JIkeIdentificationClass, JIkeIdentification>) end;

  JIkeDerAsn1DnIdentificationClass = interface(JIkeIdentificationClass)
    ['{7D2F85E5-70D2-495A-BC79-0ADF9F02C8B9}']
    {class} function init(derAsn1Dn: JX500Principal): JIkeDerAsn1DnIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeDerAsn1DnIdentification')]
  JIkeDerAsn1DnIdentification = interface(JIkeIdentification)
    ['{DD0C1144-498C-49F2-8301-3D5D6CD524EB}']
    function _GetderAsn1Dn: JX500Principal; cdecl;
    property derAsn1Dn: JX500Principal read _GetderAsn1Dn;
  end;
  TJIkeDerAsn1DnIdentification = class(TJavaGenericImport<JIkeDerAsn1DnIdentificationClass, JIkeDerAsn1DnIdentification>) end;

  JIkeFqdnIdentificationClass = interface(JIkeIdentificationClass)
    ['{A82BB95C-637A-4CF0-A82C-F0E098B03C1D}']
    {class} function init(fqdn: JString): JIkeFqdnIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeFqdnIdentification')]
  JIkeFqdnIdentification = interface(JIkeIdentification)
    ['{B244A4CD-E1E0-4228-9B6E-80A5A8521A45}']
    function _Getfqdn: JString; cdecl;
    property fqdn: JString read _Getfqdn;
  end;
  TJIkeFqdnIdentification = class(TJavaGenericImport<JIkeFqdnIdentificationClass, JIkeFqdnIdentification>) end;

  JIkeIpv4AddrIdentificationClass = interface(JIkeIdentificationClass)
    ['{2A7B251D-C893-413E-9597-AC07835ACD50}']
    {class} function init(address: JInet4Address): JIkeIpv4AddrIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeIpv4AddrIdentification')]
  JIkeIpv4AddrIdentification = interface(JIkeIdentification)
    ['{E5640A02-B04C-46AC-9F41-BC0EE7482704}']
    function _Getipv4Address: JInet4Address; cdecl;
    property ipv4Address: JInet4Address read _Getipv4Address;
  end;
  TJIkeIpv4AddrIdentification = class(TJavaGenericImport<JIkeIpv4AddrIdentificationClass, JIkeIpv4AddrIdentification>) end;

  JIkeIpv6AddrIdentificationClass = interface(JIkeIdentificationClass)
    ['{95947228-5A83-4356-90B5-14E7EABD8700}']
    {class} function init(address: JInet6Address): JIkeIpv6AddrIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeIpv6AddrIdentification')]
  JIkeIpv6AddrIdentification = interface(JIkeIdentification)
    ['{56500625-97B3-4418-AEC9-E84AECC0388C}']
    function _Getipv6Address: JInet6Address; cdecl;
    property ipv6Address: JInet6Address read _Getipv6Address;
  end;
  TJIkeIpv6AddrIdentification = class(TJavaGenericImport<JIkeIpv6AddrIdentificationClass, JIkeIpv6AddrIdentification>) end;

  JIkeKeyIdIdentificationClass = interface(JIkeIdentificationClass)
    ['{982DF56B-ABB0-44D1-AFB3-73B6905422D8}']
    {class} function init(keyId: TJavaArray<Byte>): JIkeKeyIdIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeKeyIdIdentification')]
  JIkeKeyIdIdentification = interface(JIkeIdentification)
    ['{141CD456-E08B-4AD3-885E-D946ED666A2D}']
    function _GetkeyId: TJavaArray<Byte>; cdecl;
    property keyId: TJavaArray<Byte> read _GetkeyId;
  end;
  TJIkeKeyIdIdentification = class(TJavaGenericImport<JIkeKeyIdIdentificationClass, JIkeKeyIdIdentification>) end;

  JIkeRfc822AddrIdentificationClass = interface(JIkeIdentificationClass)
    ['{55A7948E-85C6-4DDD-BBA5-64F50943CFA2}']
    {class} function init(rfc822Name: JString): JIkeRfc822AddrIdentification; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeRfc822AddrIdentification')]
  JIkeRfc822AddrIdentification = interface(JIkeIdentification)
    ['{87629492-0C79-4CA1-BB5B-D86FCA65EA79}']
    function _Getrfc822Name: JString; cdecl;
    property rfc822Name: JString read _Getrfc822Name;
  end;
  TJIkeRfc822AddrIdentification = class(TJavaGenericImport<JIkeRfc822AddrIdentificationClass, JIkeRfc822AddrIdentification>) end;

  JIkeSaProposalClass = interface(JSaProposalClass)
    ['{295AFF70-3E2C-4DA7-BEE4-006F538C6BF6}']
    {class} function getSupportedEncryptionAlgorithms: JSet; cdecl;
    {class} function getSupportedIntegrityAlgorithms: JSet; cdecl;
    {class} function getSupportedPseudorandomFunctions: JSet; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSaProposal')]
  JIkeSaProposal = interface(JSaProposal)
    ['{5DA874F5-A08F-499D-8305-003E7E058124}']
    function equals(o: JObject): Boolean; cdecl;
    function getPseudorandomFunctions: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSaProposal = class(TJavaGenericImport<JIkeSaProposalClass, JIkeSaProposal>) end;

  JIkeSaProposal_BuilderClass = interface(JObjectClass)
    ['{5C2991F2-6B86-4F1C-9594-C1376982BD94}']
    {class} function init: JIkeSaProposal_Builder; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSaProposal$Builder')]
  JIkeSaProposal_Builder = interface(JObject)
    ['{7B8F0C49-41D9-49AA-9509-FBA35D006FB6}']
    function addDhGroup(dhGroup: Integer): JIkeSaProposal_Builder; cdecl;
    function addEncryptionAlgorithm(algorithm: Integer; keyLength: Integer): JIkeSaProposal_Builder; cdecl;
    function addIntegrityAlgorithm(algorithm: Integer): JIkeSaProposal_Builder; cdecl;
    function addPseudorandomFunction(algorithm: Integer): JIkeSaProposal_Builder; cdecl;
    function build: JIkeSaProposal; cdecl;
  end;
  TJIkeSaProposal_Builder = class(TJavaGenericImport<JIkeSaProposal_BuilderClass, JIkeSaProposal_Builder>) end;

  JIkeSessionClass = interface(JObjectClass)
    ['{B273DCD9-FE16-4609-A05E-E45B889A992E}']
    {class} //function init(context: JContext; ikeSessionParams: JIkeSessionParams; firstChildSessionParams: JChildSessionParams; userCbExecutor: JExecutor; ikeSessionCallback: JIkeSessionCallback; firstChildSessionCallback: JChildSessionCallback): JIkeSession; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSession')]
  JIkeSession = interface(JObject)
    ['{5CD95A24-446B-406F-ACC8-BFAC50BFD911}']
    procedure close; cdecl;
    procedure closeChildSession(childSessionCallback: JChildSessionCallback); cdecl;
    procedure kill; cdecl;
    procedure openChildSession(childSessionParams: JChildSessionParams; childSessionCallback: JChildSessionCallback); cdecl;
  end;
  TJIkeSession = class(TJavaGenericImport<JIkeSessionClass, JIkeSession>) end;

  JIkeSessionCallbackClass = interface(IJavaClass)
    ['{9A338CBF-B7A5-444A-AC48-69D791D1ED49}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionCallback')]
  JIkeSessionCallback = interface(IJavaInstance)
    ['{36EC7BBF-DDC4-4411-9EDF-A5196FA04928}']
    procedure onClosed; cdecl;
    procedure onClosedWithException(exception: JIkeException); cdecl;
    procedure onError(exception: JIkeException); cdecl;
    procedure onOpened(sessionConfiguration: JIkeSessionConfiguration); cdecl;
  end;
  TJIkeSessionCallback = class(TJavaGenericImport<JIkeSessionCallbackClass, JIkeSessionCallback>) end;

  JIkeSessionConfigurationClass = interface(JObjectClass)
    ['{ED3ECA32-ACE1-4F3C-AE18-7FE0C34F8ADD}']
    {class} function _GetEXTENSION_TYPE_FRAGMENTATION: Integer; cdecl;
    {class} function _GetEXTENSION_TYPE_MOBIKE: Integer; cdecl;
    {class} property EXTENSION_TYPE_FRAGMENTATION: Integer read _GetEXTENSION_TYPE_FRAGMENTATION;
    {class} property EXTENSION_TYPE_MOBIKE: Integer read _GetEXTENSION_TYPE_MOBIKE;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionConfiguration')]
  JIkeSessionConfiguration = interface(JObject)
    ['{BC1E9051-7060-42E2-BB2A-02EFA11FDA20}']
    function getEapInfo: JEapInfo; cdecl;
    function getIkeSessionConnectionInfo: JIkeSessionConnectionInfo; cdecl;
    function getRemoteApplicationVersion: JString; cdecl;
    function getRemoteVendorIds: JList; cdecl;
    function isIkeExtensionEnabled(extensionType: Integer): Boolean; cdecl;
  end;
  TJIkeSessionConfiguration = class(TJavaGenericImport<JIkeSessionConfigurationClass, JIkeSessionConfiguration>) end;

  JIkeSessionConfiguration_BuilderClass = interface(JObjectClass)
    ['{0788A1C2-27DD-4F31-814E-1BE4D639971E}']
    {class} function init(ikeConnInfo: JIkeSessionConnectionInfo): JIkeSessionConfiguration_Builder; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionConfiguration$Builder')]
  JIkeSessionConfiguration_Builder = interface(JObject)
    ['{F8C983EB-4D3F-4D24-AADA-CF0441B6A288}']
    function addIkeExtension(extensionType: Integer): JIkeSessionConfiguration_Builder; cdecl;
    function addRemoteVendorId(remoteVendorId: TJavaArray<Byte>): JIkeSessionConfiguration_Builder; cdecl;
    function build: JIkeSessionConfiguration; cdecl;
    function clearIkeExtensions: JIkeSessionConfiguration_Builder; cdecl;
    function clearRemoteApplicationVersion: JIkeSessionConfiguration_Builder; cdecl;
    function clearRemoteVendorIds: JIkeSessionConfiguration_Builder; cdecl;
    function setEapInfo(eapInfo: JEapInfo): JIkeSessionConfiguration_Builder; cdecl;
    function setRemoteApplicationVersion(remoteApplicationVersion: JString): JIkeSessionConfiguration_Builder; cdecl;
  end;
  TJIkeSessionConfiguration_Builder = class(TJavaGenericImport<JIkeSessionConfiguration_BuilderClass, JIkeSessionConfiguration_Builder>) end;

  JIkeSessionConnectionInfoClass = interface(JObjectClass)
    ['{6CC533BA-156F-4832-9A12-CF60D09A1CD2}']
    {class} function init(localAddress: JInetAddress; remoteAddress: JInetAddress; network: JNetwork): JIkeSessionConnectionInfo; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionConnectionInfo')]
  JIkeSessionConnectionInfo = interface(JObject)
    ['{444DFBBA-3961-4BD8-87FC-0353010AA4AE}']
    function getLocalAddress: JInetAddress; cdecl;
    function getNetwork: JNetwork; cdecl;
    function getRemoteAddress: JInetAddress; cdecl;
  end;
  TJIkeSessionConnectionInfo = class(TJavaGenericImport<JIkeSessionConnectionInfoClass, JIkeSessionConnectionInfo>) end;

  JIkeSessionParamsClass = interface(JObjectClass)
    ['{991938ED-EE90-4F42-82EE-952CEA3A400D}']
    {class} function _GetIKE_OPTION_ACCEPT_ANY_REMOTE_ID: Integer; cdecl;
    {class} function _GetIKE_OPTION_EAP_ONLY_AUTH: Integer; cdecl;
    {class} function _GetIKE_OPTION_FORCE_PORT_4500: Integer; cdecl;
    {class} function _GetIKE_OPTION_INITIAL_CONTACT: Integer; cdecl;
    {class} function _GetIKE_OPTION_MOBIKE: Integer; cdecl;
    {class} property IKE_OPTION_ACCEPT_ANY_REMOTE_ID: Integer read _GetIKE_OPTION_ACCEPT_ANY_REMOTE_ID;
    {class} property IKE_OPTION_EAP_ONLY_AUTH: Integer read _GetIKE_OPTION_EAP_ONLY_AUTH;
    {class} property IKE_OPTION_FORCE_PORT_4500: Integer read _GetIKE_OPTION_FORCE_PORT_4500;
    {class} property IKE_OPTION_INITIAL_CONTACT: Integer read _GetIKE_OPTION_INITIAL_CONTACT;
    {class} property IKE_OPTION_MOBIKE: Integer read _GetIKE_OPTION_MOBIKE;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams')]
  JIkeSessionParams = interface(JObject)
    ['{AB62ABB5-5964-455A-88AD-D967C3B62E3F}']
    function getDpdDelaySeconds: Integer; cdecl;
    function getHardLifetimeSeconds: Integer; cdecl;
    function getIkeSaProposals: JList; cdecl;
    function getLocalAuthConfig: JIkeSessionParams_IkeAuthConfig; cdecl;
    function getLocalIdentification: JIkeIdentification; cdecl;
    function getNattKeepAliveDelaySeconds: Integer; cdecl;
    function getNetwork: JNetwork; cdecl;
    function getRemoteAuthConfig: JIkeSessionParams_IkeAuthConfig; cdecl;
    function getRemoteIdentification: JIkeIdentification; cdecl;
    function getRetransmissionTimeoutsMillis: TJavaArray<Integer>; cdecl;
    function getServerHostname: JString; cdecl;
    function getSoftLifetimeSeconds: Integer; cdecl;
    function hasIkeOption(ikeOption: Integer): Boolean; cdecl;
  end;
  TJIkeSessionParams = class(TJavaGenericImport<JIkeSessionParamsClass, JIkeSessionParams>) end;

  JIkeSessionParams_BuilderClass = interface(JObjectClass)
    ['{7EEB3B17-EDBD-44EF-A9E7-6F4C54A24328}']
    {class} function init: JIkeSessionParams_Builder; cdecl; overload;
    {class} function init(ikeSessionParams: JIkeSessionParams): JIkeSessionParams_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$Builder')]
  JIkeSessionParams_Builder = interface(JObject)
    ['{C4385A30-18FB-4C32-B194-6FBFD1C7358E}']
    function addIkeOption(ikeOption: Integer): JIkeSessionParams_Builder; cdecl;
    function addIkeSaProposal(proposal: JIkeSaProposal): JIkeSessionParams_Builder; cdecl;
    function build: JIkeSessionParams; cdecl;
    function removeIkeOption(ikeOption: Integer): JIkeSessionParams_Builder; cdecl;
    function setAuthDigitalSignature(serverCaCert: JX509Certificate; clientEndCert: JX509Certificate; clientPrivateKey: JPrivateKey): JIkeSessionParams_Builder; cdecl; overload;
    function setAuthDigitalSignature(serverCaCert: JX509Certificate; clientEndCert: JX509Certificate; clientIntermediateCerts: JList; clientPrivateKey: JPrivateKey): JIkeSessionParams_Builder; cdecl; overload;
    function setAuthEap(serverCaCert: JX509Certificate; eapConfig: JEapSessionConfig): JIkeSessionParams_Builder; cdecl;
    function setAuthPsk(sharedKey: TJavaArray<Byte>): JIkeSessionParams_Builder; cdecl;
    function setDpdDelaySeconds(dpdDelaySeconds: Integer): JIkeSessionParams_Builder; cdecl;
    function setLifetimeSeconds(hardLifetimeSeconds: Integer; softLifetimeSeconds: Integer): JIkeSessionParams_Builder; cdecl;
    function setLocalIdentification(identification: JIkeIdentification): JIkeSessionParams_Builder; cdecl;
    function setNattKeepAliveDelaySeconds(nattKeepaliveDelaySeconds: Integer): JIkeSessionParams_Builder; cdecl;
    function setNetwork(network: JNetwork): JIkeSessionParams_Builder; cdecl;
    function setRemoteIdentification(identification: JIkeIdentification): JIkeSessionParams_Builder; cdecl;
    function setRetransmissionTimeoutsMillis(retransTimeoutMillisList: TJavaArray<Integer>): JIkeSessionParams_Builder; cdecl;
    function setServerHostname(serverHostname: JString): JIkeSessionParams_Builder; cdecl;
  end;
  TJIkeSessionParams_Builder = class(TJavaGenericImport<JIkeSessionParams_BuilderClass, JIkeSessionParams_Builder>) end;

  JIkeSessionParams_IkeAuthConfigClass = interface(JObjectClass)
    ['{AB01A88B-8C44-43FD-BC4E-763F39BADF82}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$IkeAuthConfig')]
  JIkeSessionParams_IkeAuthConfig = interface(JObject)
    ['{BF6E540A-C7FA-4BA3-A5B3-0DA97D4546FD}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSessionParams_IkeAuthConfig = class(TJavaGenericImport<JIkeSessionParams_IkeAuthConfigClass, JIkeSessionParams_IkeAuthConfig>) end;

  JIkeSessionParams_IkeAuthDigitalSignLocalConfigClass = interface(JIkeSessionParams_IkeAuthConfigClass)
    ['{79559B1E-BF54-45A3-B4D8-65425ACE8370}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$IkeAuthDigitalSignLocalConfig')]
  JIkeSessionParams_IkeAuthDigitalSignLocalConfig = interface(JIkeSessionParams_IkeAuthConfig)
    ['{A3A98EA5-DBE4-4690-92B6-7F2BC457D960}']
    function equals(o: JObject): Boolean; cdecl;
    function getClientEndCertificate: JX509Certificate; cdecl;
    function getIntermediateCertificates: JList; cdecl;
    function getPrivateKey: JPrivateKey; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSessionParams_IkeAuthDigitalSignLocalConfig = class(TJavaGenericImport<JIkeSessionParams_IkeAuthDigitalSignLocalConfigClass, JIkeSessionParams_IkeAuthDigitalSignLocalConfig>) end;

  JIkeSessionParams_IkeAuthDigitalSignRemoteConfigClass = interface(JIkeSessionParams_IkeAuthConfigClass)
    ['{CB2190D5-DD23-420A-B6B9-397095BD1D42}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$IkeAuthDigitalSignRemoteConfig')]
  JIkeSessionParams_IkeAuthDigitalSignRemoteConfig = interface(JIkeSessionParams_IkeAuthConfig)
    ['{0EEDE406-F7B8-47C6-A59F-B9523DD43062}']
    function equals(o: JObject): Boolean; cdecl;
    function getRemoteCaCert: JX509Certificate; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSessionParams_IkeAuthDigitalSignRemoteConfig = class(TJavaGenericImport<JIkeSessionParams_IkeAuthDigitalSignRemoteConfigClass, JIkeSessionParams_IkeAuthDigitalSignRemoteConfig>) end;

  JIkeSessionParams_IkeAuthEapConfigClass = interface(JIkeSessionParams_IkeAuthConfigClass)
    ['{4E2647C0-CD74-48FB-A1D8-7A00D9CC0323}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$IkeAuthEapConfig')]
  JIkeSessionParams_IkeAuthEapConfig = interface(JIkeSessionParams_IkeAuthConfig)
    ['{29409C59-DA3C-4500-95CE-42B34F027FDE}']
    function equals(o: JObject): Boolean; cdecl;
    function getEapConfig: JEapSessionConfig; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSessionParams_IkeAuthEapConfig = class(TJavaGenericImport<JIkeSessionParams_IkeAuthEapConfigClass, JIkeSessionParams_IkeAuthEapConfig>) end;

  JIkeSessionParams_IkeAuthPskConfigClass = interface(JIkeSessionParams_IkeAuthConfigClass)
    ['{D42EDA30-F59A-46E4-936B-6A9749F95797}']
  end;

  [JavaSignature('android/net/ipsec/ike/IkeSessionParams$IkeAuthPskConfig')]
  JIkeSessionParams_IkeAuthPskConfig = interface(JIkeSessionParams_IkeAuthConfig)
    ['{07E7E45F-8016-4591-BB22-84CAF64529CE}']
    function equals(o: JObject): Boolean; cdecl;
    function getPsk: TJavaArray<Byte>; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJIkeSessionParams_IkeAuthPskConfig = class(TJavaGenericImport<JIkeSessionParams_IkeAuthPskConfigClass, JIkeSessionParams_IkeAuthPskConfig>) end;

  JIkeTrafficSelectorClass = interface(JObjectClass)
    ['{9734183E-75B6-4CBA-96B8-389E643C955E}']
    {class} function init(startPort: Integer; endPort: Integer; startingAddress: JInetAddress; endingAddress: JInetAddress): JIkeTrafficSelector; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeTrafficSelector')]
  JIkeTrafficSelector = interface(JObject)
    ['{F97EA730-A8AC-4A35-889D-6E0466247374}']
    function _GetendPort: Integer; cdecl;
    function _GetendingAddress: JInetAddress; cdecl;
    function _GetstartPort: Integer; cdecl;
    function _GetstartingAddress: JInetAddress; cdecl;
    property endPort: Integer read _GetendPort;
    property endingAddress: JInetAddress read _GetendingAddress;
    property startPort: Integer read _GetstartPort;
    property startingAddress: JInetAddress read _GetstartingAddress;
  end;
  TJIkeTrafficSelector = class(TJavaGenericImport<JIkeTrafficSelectorClass, JIkeTrafficSelector>) end;

  JIkeTunnelConnectionParamsClass = interface(JObjectClass)
    ['{A8C09762-3A8B-4681-8EDA-0674EC8C5A5B}']
    {class} function init(ikeParams: JIkeSessionParams; childParams: JTunnelModeChildSessionParams): JIkeTunnelConnectionParams; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/IkeTunnelConnectionParams')]
  JIkeTunnelConnectionParams = interface(JObject)
    ['{8181C21C-04F7-4989-BE7B-1B5F73B47968}']
    function getIkeSessionParams: JIkeSessionParams; cdecl;
    function getTunnelModeChildSessionParams: JTunnelModeChildSessionParams; cdecl;
  end;
  TJIkeTunnelConnectionParams = class(TJavaGenericImport<JIkeTunnelConnectionParamsClass, JIkeTunnelConnectionParams>) end;

  JTransportModeChildSessionParamsClass = interface(JChildSessionParamsClass)
    ['{E9F6AD22-F060-40B8-B022-93EE6304FD93}']
  end;

  [JavaSignature('android/net/ipsec/ike/TransportModeChildSessionParams')]
  JTransportModeChildSessionParams = interface(JChildSessionParams)
    ['{38507603-7AA5-4654-8729-8CB1F81DF569}']
  end;
  TJTransportModeChildSessionParams = class(TJavaGenericImport<JTransportModeChildSessionParamsClass, JTransportModeChildSessionParams>) end;

  JTransportModeChildSessionParams_BuilderClass = interface(JObjectClass)
    ['{4C669345-ECFE-49FF-909C-74B2EF83C15B}']
    {class} function init: JTransportModeChildSessionParams_Builder; cdecl; overload;
    {class} function init(childParams: JTransportModeChildSessionParams): JTransportModeChildSessionParams_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/ipsec/ike/TransportModeChildSessionParams$Builder')]
  JTransportModeChildSessionParams_Builder = interface(JObject)
    ['{C34772E8-C92D-44D8-A3A4-D0136FCFFEA2}']
    function addChildSaProposal(proposal: JChildSaProposal): JTransportModeChildSessionParams_Builder; cdecl;
    function addInboundTrafficSelectors(trafficSelector: JIkeTrafficSelector): JTransportModeChildSessionParams_Builder; cdecl;
    function addOutboundTrafficSelectors(trafficSelector: JIkeTrafficSelector): JTransportModeChildSessionParams_Builder; cdecl;
    function build: JTransportModeChildSessionParams; cdecl;
    function setLifetimeSeconds(hardLifetimeSeconds: Integer; softLifetimeSeconds: Integer): JTransportModeChildSessionParams_Builder; cdecl;
  end;
  TJTransportModeChildSessionParams_Builder = class(TJavaGenericImport<JTransportModeChildSessionParams_BuilderClass, JTransportModeChildSessionParams_Builder>) end;

  JTunnelModeChildSessionParamsClass = interface(JChildSessionParamsClass)
    ['{1F336098-0EDB-48D7-9296-80D38B8D6C3F}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams')]
  JTunnelModeChildSessionParams = interface(JChildSessionParams)
    ['{87193F3F-AAE2-403C-90C8-1F6C7857FDBA}']
    function equals(o: JObject): Boolean; cdecl;
    function getConfigurationRequests: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJTunnelModeChildSessionParams = class(TJavaGenericImport<JTunnelModeChildSessionParamsClass, JTunnelModeChildSessionParams>) end;

  JTunnelModeChildSessionParams_BuilderClass = interface(JObjectClass)
    ['{3355214B-EA0C-498E-9272-201CABBA2625}']
    {class} function init: JTunnelModeChildSessionParams_Builder; cdecl; overload;
    {class} function init(childParams: JTunnelModeChildSessionParams): JTunnelModeChildSessionParams_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$Builder')]
  JTunnelModeChildSessionParams_Builder = interface(JObject)
    ['{07E9BB33-5BA2-4787-AD49-B572E5642AC8}']
    function addChildSaProposal(proposal: JChildSaProposal): JTunnelModeChildSessionParams_Builder; cdecl;
    function addInboundTrafficSelectors(trafficSelector: JIkeTrafficSelector): JTunnelModeChildSessionParams_Builder; cdecl;
    function addInternalAddressRequest(addressFamily: Integer): JTunnelModeChildSessionParams_Builder; cdecl; overload;
    function addInternalAddressRequest(address: JInet4Address): JTunnelModeChildSessionParams_Builder; cdecl; overload;
    function addInternalAddressRequest(address: JInet6Address; prefixLen: Integer): JTunnelModeChildSessionParams_Builder; cdecl; overload;
    function addInternalDhcpServerRequest(addressFamily: Integer): JTunnelModeChildSessionParams_Builder; cdecl;
    function addInternalDnsServerRequest(addressFamily: Integer): JTunnelModeChildSessionParams_Builder; cdecl;
    function addOutboundTrafficSelectors(trafficSelector: JIkeTrafficSelector): JTunnelModeChildSessionParams_Builder; cdecl;
    function build: JTunnelModeChildSessionParams; cdecl;
    function setLifetimeSeconds(hardLifetimeSeconds: Integer; softLifetimeSeconds: Integer): JTunnelModeChildSessionParams_Builder; cdecl;
  end;
  TJTunnelModeChildSessionParams_Builder = class(TJavaGenericImport<JTunnelModeChildSessionParams_BuilderClass, JTunnelModeChildSessionParams_Builder>) end;

  JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass = interface(IJavaClass)
    ['{BBA8B088-267C-49CC-843E-35E2643127D9}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$TunnelModeChildConfigRequest')]
  JTunnelModeChildSessionParams_TunnelModeChildConfigRequest = interface(IJavaInstance)
    ['{41284345-BF2F-48F9-917D-FFB542D06490}']
  end;
  TJTunnelModeChildSessionParams_TunnelModeChildConfigRequest = class(TJavaGenericImport<JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass, JTunnelModeChildSessionParams_TunnelModeChildConfigRequest>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv4AddressClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{D13F61AE-7378-462E-A55C-B1300608BF76}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv4Address')]
  JTunnelModeChildSessionParams_ConfigRequestIpv4Address = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{199A6F4E-D4E8-400D-9C13-54DC46703758}']
    function getAddress: JInet4Address; cdecl;
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv4Address = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv4AddressClass, JTunnelModeChildSessionParams_ConfigRequestIpv4Address>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServerClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{B5601CBA-6671-4F3D-BCC8-21EBE0A141BC}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv4DhcpServer')]
  JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{7AD96DA1-6AB9-4A3B-9ABE-7675D24BF5F2}']
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServerClass, JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServerClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{1282C3B2-CAC2-4B06-9D78-FE9F57AAE9BA}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv4DnsServer')]
  JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{3F8F1FA9-120A-4E38-AF59-B063F44CEAC5}']
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServerClass, JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv4NetmaskClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{D4E11C38-15AB-480C-BAD2-A2D00D335B2E}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv4Netmask')]
  JTunnelModeChildSessionParams_ConfigRequestIpv4Netmask = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{7DAEC023-C7A7-4FF4-85A8-DC7FDB8A434B}']
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv4Netmask = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv4NetmaskClass, JTunnelModeChildSessionParams_ConfigRequestIpv4Netmask>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv6AddressClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{5DC6845A-AE41-44C1-87A3-C77047513C1B}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv6Address')]
  JTunnelModeChildSessionParams_ConfigRequestIpv6Address = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{812DFFEF-4649-4C37-A4CB-0B51A7E03451}']
    function getAddress: JInet6Address; cdecl;
    function getPrefixLength: Integer; cdecl;
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv6Address = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv6AddressClass, JTunnelModeChildSessionParams_ConfigRequestIpv6Address>) end;

  JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServerClass = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequestClass)
    ['{8189C24C-6FB8-4FD8-8233-2FD9B8DB571F}']
  end;

  [JavaSignature('android/net/ipsec/ike/TunnelModeChildSessionParams$ConfigRequestIpv6DnsServer')]
  JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer = interface(JTunnelModeChildSessionParams_TunnelModeChildConfigRequest)
    ['{BE2688C2-743C-4A16-B084-85A7A1934352}']
  end;
  TJTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer = class(TJavaGenericImport<JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServerClass, JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer>) end;

  JIkeExceptionClass = interface(JExceptionClass)
    ['{F900A5E1-55AB-4588-B91F-0D5117AB2D8A}']
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeException')]
  JIkeException = interface(JException)
    ['{A24BD702-9D63-4BC1-A675-0085BCFD5CEB}']
  end;
  TJIkeException = class(TJavaGenericImport<JIkeExceptionClass, JIkeException>) end;

  JIkeNonProtocolExceptionClass = interface(JIkeExceptionClass)
    ['{A1C4040F-FB16-48CA-B183-C2EF14B08F28}']
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeNonProtocolException')]
  JIkeNonProtocolException = interface(JIkeException)
    ['{C3504DEF-BC87-4B46-9086-89109F601CE0}']
  end;
  TJIkeNonProtocolException = class(TJavaGenericImport<JIkeNonProtocolExceptionClass, JIkeNonProtocolException>) end;

  JIkeIOExceptionClass = interface(JIkeNonProtocolExceptionClass)
    ['{C29C367E-47AC-4774-8E96-358FEB2A5BBC}']
    {class} function init(cause: JIOException): JIkeIOException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeIOException')]
  JIkeIOException = interface(JIkeNonProtocolException)
    ['{4B237B77-8795-4EE7-BD3C-7198D181325B}']
    function getCause: JIOException; cdecl;
  end;
  TJIkeIOException = class(TJavaGenericImport<JIkeIOExceptionClass, JIkeIOException>) end;

  JIkeInternalExceptionClass = interface(JIkeNonProtocolExceptionClass)
    ['{A855A627-D494-4AAF-A564-23678C9F06BA}']
    {class} function init(cause: JThrowable): JIkeInternalException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JIkeInternalException; cdecl; overload;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeInternalException')]
  JIkeInternalException = interface(JIkeNonProtocolException)
    ['{78D7880A-ECFE-4554-8C71-FBE1CD1AB9D3}']
  end;
  TJIkeInternalException = class(TJavaGenericImport<JIkeInternalExceptionClass, JIkeInternalException>) end;

  JIkeNetworkLostExceptionClass = interface(JIkeNonProtocolExceptionClass)
    ['{3687F425-DF6E-46DF-9250-196EB0F77AEA}']
    {class} function init(network: JNetwork): JIkeNetworkLostException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeNetworkLostException')]
  JIkeNetworkLostException = interface(JIkeNonProtocolException)
    ['{56591E5E-BBE2-483F-8916-23C91FB847F5}']
    function getNetwork: JNetwork; cdecl;
  end;
  TJIkeNetworkLostException = class(TJavaGenericImport<JIkeNetworkLostExceptionClass, JIkeNetworkLostException>) end;

  JIkeProtocolExceptionClass = interface(JIkeExceptionClass)
    ['{8FE31035-195F-481B-B57D-DB6F2C0D30AA}']
    {class} function _GetERROR_TYPE_AUTHENTICATION_FAILED: Integer; cdecl;
    {class} function _GetERROR_TYPE_CHILD_SA_NOT_FOUND: Integer; cdecl;
    {class} function _GetERROR_TYPE_FAILED_CP_REQUIRED: Integer; cdecl;
    {class} function _GetERROR_TYPE_INTERNAL_ADDRESS_FAILURE: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_IKE_SPI: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_KE_PAYLOAD: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_MAJOR_VERSION: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_MESSAGE_ID: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_SELECTORS: Integer; cdecl;
    {class} function _GetERROR_TYPE_INVALID_SYNTAX: Integer; cdecl;
    {class} function _GetERROR_TYPE_NO_ADDITIONAL_SAS: Integer; cdecl;
    {class} function _GetERROR_TYPE_NO_PROPOSAL_CHOSEN: Integer; cdecl;
    {class} function _GetERROR_TYPE_SINGLE_PAIR_REQUIRED: Integer; cdecl;
    {class} function _GetERROR_TYPE_TEMPORARY_FAILURE: Integer; cdecl;
    {class} function _GetERROR_TYPE_TS_UNACCEPTABLE: Integer; cdecl;
    {class} function _GetERROR_TYPE_UNSUPPORTED_CRITICAL_PAYLOAD: Integer; cdecl;
    {class} property ERROR_TYPE_AUTHENTICATION_FAILED: Integer read _GetERROR_TYPE_AUTHENTICATION_FAILED;
    {class} property ERROR_TYPE_CHILD_SA_NOT_FOUND: Integer read _GetERROR_TYPE_CHILD_SA_NOT_FOUND;
    {class} property ERROR_TYPE_FAILED_CP_REQUIRED: Integer read _GetERROR_TYPE_FAILED_CP_REQUIRED;
    {class} property ERROR_TYPE_INTERNAL_ADDRESS_FAILURE: Integer read _GetERROR_TYPE_INTERNAL_ADDRESS_FAILURE;
    {class} property ERROR_TYPE_INVALID_IKE_SPI: Integer read _GetERROR_TYPE_INVALID_IKE_SPI;
    {class} property ERROR_TYPE_INVALID_KE_PAYLOAD: Integer read _GetERROR_TYPE_INVALID_KE_PAYLOAD;
    {class} property ERROR_TYPE_INVALID_MAJOR_VERSION: Integer read _GetERROR_TYPE_INVALID_MAJOR_VERSION;
    {class} property ERROR_TYPE_INVALID_MESSAGE_ID: Integer read _GetERROR_TYPE_INVALID_MESSAGE_ID;
    {class} property ERROR_TYPE_INVALID_SELECTORS: Integer read _GetERROR_TYPE_INVALID_SELECTORS;
    {class} property ERROR_TYPE_INVALID_SYNTAX: Integer read _GetERROR_TYPE_INVALID_SYNTAX;
    {class} property ERROR_TYPE_NO_ADDITIONAL_SAS: Integer read _GetERROR_TYPE_NO_ADDITIONAL_SAS;
    {class} property ERROR_TYPE_NO_PROPOSAL_CHOSEN: Integer read _GetERROR_TYPE_NO_PROPOSAL_CHOSEN;
    {class} property ERROR_TYPE_SINGLE_PAIR_REQUIRED: Integer read _GetERROR_TYPE_SINGLE_PAIR_REQUIRED;
    {class} property ERROR_TYPE_TEMPORARY_FAILURE: Integer read _GetERROR_TYPE_TEMPORARY_FAILURE;
    {class} property ERROR_TYPE_TS_UNACCEPTABLE: Integer read _GetERROR_TYPE_TS_UNACCEPTABLE;
    {class} property ERROR_TYPE_UNSUPPORTED_CRITICAL_PAYLOAD: Integer read _GetERROR_TYPE_UNSUPPORTED_CRITICAL_PAYLOAD;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeProtocolException')]
  JIkeProtocolException = interface(JIkeException)
    ['{DB9DFB5C-5C04-419B-94FF-4FE03479C8DB}']
    function getErrorType: Integer; cdecl;
  end;
  TJIkeProtocolException = class(TJavaGenericImport<JIkeProtocolExceptionClass, JIkeProtocolException>) end;

  JIkeTimeoutExceptionClass = interface(JIOExceptionClass)
    ['{FEEF9306-62C2-4411-8A5A-FA93C66465AA}']
    {class} function init(message: JString): JIkeTimeoutException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/IkeTimeoutException')]
  JIkeTimeoutException = interface(JIOException)
    ['{78110F22-866D-49CC-9381-3B528E970D9C}']
  end;
  TJIkeTimeoutException = class(TJavaGenericImport<JIkeTimeoutExceptionClass, JIkeTimeoutException>) end;

  JInvalidKeExceptionClass = interface(JIkeProtocolExceptionClass)
    ['{64AFB3FE-DD6F-4378-AB81-F90C3736359F}']
    {class} function init(dhGroup: Integer): JInvalidKeException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/InvalidKeException')]
  JInvalidKeException = interface(JIkeProtocolException)
    ['{AB1CE6DA-25C3-4605-B939-42F7FA49C567}']
    function getDhGroup: Integer; cdecl;
  end;
  TJInvalidKeException = class(TJavaGenericImport<JInvalidKeExceptionClass, JInvalidKeException>) end;

  JInvalidMajorVersionExceptionClass = interface(JIkeProtocolExceptionClass)
    ['{68DE5A88-4FE0-406B-A2CA-D7BCCE71AECC}']
    {class} function init(version: Byte): JInvalidMajorVersionException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/InvalidMajorVersionException')]
  JInvalidMajorVersionException = interface(JIkeProtocolException)
    ['{B1DB6226-88F8-44E1-ADEE-227F844BF428}']
    function getMajorVersion: Byte; cdecl;
  end;
  TJInvalidMajorVersionException = class(TJavaGenericImport<JInvalidMajorVersionExceptionClass, JInvalidMajorVersionException>) end;

  JInvalidSelectorsExceptionClass = interface(JIkeProtocolExceptionClass)
    ['{CBF6E6B4-B154-4E46-8674-6DB3F554482C}']
    {class} function init(spi: Integer; packetInfo: TJavaArray<Byte>): JInvalidSelectorsException; cdecl;
  end;

  [JavaSignature('android/net/ipsec/ike/exceptions/InvalidSelectorsException')]
  JInvalidSelectorsException = interface(JIkeProtocolException)
    ['{186AEC14-9840-4174-9C70-A867A527B31D}']
    function getIpSecPacketInfo: TJavaArray<Byte>; cdecl;
    function getIpSecSpi: Integer; cdecl;
  end;
  TJInvalidSelectorsException = class(TJavaGenericImport<JInvalidSelectorsExceptionClass, JInvalidSelectorsException>) end;

  JNsdManagerClass = interface(JObjectClass)
    ['{64105EE7-4229-4EBC-BECF-F8A59225B42F}']
    {class} function _GetACTION_NSD_STATE_CHANGED: JString; cdecl;
    {class} function _GetEXTRA_NSD_STATE: JString; cdecl;
    {class} function _GetFAILURE_ALREADY_ACTIVE: Integer; cdecl;
    {class} function _GetFAILURE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetFAILURE_MAX_LIMIT: Integer; cdecl;
    {class} function _GetNSD_STATE_DISABLED: Integer; cdecl;
    {class} function _GetNSD_STATE_ENABLED: Integer; cdecl;
    {class} function _GetPROTOCOL_DNS_SD: Integer; cdecl;
    {class} property ACTION_NSD_STATE_CHANGED: JString read _GetACTION_NSD_STATE_CHANGED;
    {class} property EXTRA_NSD_STATE: JString read _GetEXTRA_NSD_STATE;
    {class} property FAILURE_ALREADY_ACTIVE: Integer read _GetFAILURE_ALREADY_ACTIVE;
    {class} property FAILURE_INTERNAL_ERROR: Integer read _GetFAILURE_INTERNAL_ERROR;
    {class} property FAILURE_MAX_LIMIT: Integer read _GetFAILURE_MAX_LIMIT;
    {class} property NSD_STATE_DISABLED: Integer read _GetNSD_STATE_DISABLED;
    {class} property NSD_STATE_ENABLED: Integer read _GetNSD_STATE_ENABLED;
    {class} property PROTOCOL_DNS_SD: Integer read _GetPROTOCOL_DNS_SD;
  end;

  [JavaSignature('android/net/nsd/NsdManager')]
  JNsdManager = interface(JObject)
    ['{A62E010F-FAEB-46CA-AA65-EBB36CC675C4}']
    procedure discoverServices(serviceType: JString; protocolType: Integer; listener: JNsdManager_DiscoveryListener); cdecl; overload;
    procedure discoverServices(serviceType: JString; protocolType: Integer; network: JNetwork; executor: JExecutor; listener: JNsdManager_DiscoveryListener); cdecl; overload;
    procedure discoverServices(serviceType: JString; protocolType: Integer; networkRequest: JNetworkRequest; executor: JExecutor; listener: JNsdManager_DiscoveryListener); cdecl; overload;
    procedure registerService(serviceInfo: JNsdServiceInfo; protocolType: Integer; listener: JNsdManager_RegistrationListener); cdecl; overload;
    procedure registerService(serviceInfo: JNsdServiceInfo; protocolType: Integer; executor: JExecutor; listener: JNsdManager_RegistrationListener); cdecl; overload;
    procedure resolveService(serviceInfo: JNsdServiceInfo; listener: JNsdManager_ResolveListener); cdecl; overload;
    procedure resolveService(serviceInfo: JNsdServiceInfo; executor: JExecutor; listener: JNsdManager_ResolveListener); cdecl; overload;
    procedure stopServiceDiscovery(listener: JNsdManager_DiscoveryListener); cdecl;
    procedure unregisterService(listener: JNsdManager_RegistrationListener); cdecl;
  end;
  TJNsdManager = class(TJavaGenericImport<JNsdManagerClass, JNsdManager>) end;

  JNsdManager_DiscoveryListenerClass = interface(IJavaClass)
    ['{511F2509-D476-4326-84D2-8DEBC96D7661}']
  end;

  [JavaSignature('android/net/nsd/NsdManager$DiscoveryListener')]
  JNsdManager_DiscoveryListener = interface(IJavaInstance)
    ['{057C86EA-2122-4285-9FBE-97738F7C88E5}']
    procedure onDiscoveryStarted(serviceType: JString); cdecl;
    procedure onDiscoveryStopped(serviceType: JString); cdecl;
    procedure onServiceFound(serviceInfo: JNsdServiceInfo); cdecl;
    procedure onServiceLost(serviceInfo: JNsdServiceInfo); cdecl;
    procedure onStartDiscoveryFailed(serviceType: JString; errorCode: Integer); cdecl;
    procedure onStopDiscoveryFailed(serviceType: JString; errorCode: Integer); cdecl;
  end;
  TJNsdManager_DiscoveryListener = class(TJavaGenericImport<JNsdManager_DiscoveryListenerClass, JNsdManager_DiscoveryListener>) end;

  JNsdManager_RegistrationListenerClass = interface(IJavaClass)
    ['{D3DC5E79-7DC6-4118-B653-B61AB1557062}']
  end;

  [JavaSignature('android/net/nsd/NsdManager$RegistrationListener')]
  JNsdManager_RegistrationListener = interface(IJavaInstance)
    ['{D5E1A337-1954-4D1D-8A9F-2FE84FA754BC}']
    procedure onRegistrationFailed(serviceInfo: JNsdServiceInfo; errorCode: Integer); cdecl;
    procedure onServiceRegistered(serviceInfo: JNsdServiceInfo); cdecl;
    procedure onServiceUnregistered(serviceInfo: JNsdServiceInfo); cdecl;
    procedure onUnregistrationFailed(serviceInfo: JNsdServiceInfo; errorCode: Integer); cdecl;
  end;
  TJNsdManager_RegistrationListener = class(TJavaGenericImport<JNsdManager_RegistrationListenerClass, JNsdManager_RegistrationListener>) end;

  JNsdManager_ResolveListenerClass = interface(IJavaClass)
    ['{8AA4124E-568A-45E7-9E06-01EFA7F5B12F}']
  end;

  [JavaSignature('android/net/nsd/NsdManager$ResolveListener')]
  JNsdManager_ResolveListener = interface(IJavaInstance)
    ['{E8171715-94F9-4977-BE5F-61499FA18842}']
    procedure onResolveFailed(serviceInfo: JNsdServiceInfo; errorCode: Integer); cdecl;
    procedure onServiceResolved(serviceInfo: JNsdServiceInfo); cdecl;
  end;
  TJNsdManager_ResolveListener = class(TJavaGenericImport<JNsdManager_ResolveListenerClass, JNsdManager_ResolveListener>) end;

  JNsdServiceInfoClass = interface(JObjectClass)
    ['{A0A690C6-19AD-4DFF-BB84-3E8281EE928A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JNsdServiceInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/nsd/NsdServiceInfo')]
  JNsdServiceInfo = interface(JObject)
    ['{9B224A2D-23FB-4D64-B4D8-B98184D455E3}']
    function describeContents: Integer; cdecl;
    function getAttributes: JMap; cdecl;
    function getHost: JInetAddress; cdecl;
    function getNetwork: JNetwork; cdecl;
    function getPort: Integer; cdecl;
    function getServiceName: JString; cdecl;
    function getServiceType: JString; cdecl;
    procedure removeAttribute(key: JString); cdecl;
    procedure setAttribute(key: JString; value: JString); cdecl;
    procedure setHost(s: JInetAddress); cdecl;
    procedure setNetwork(network: JNetwork); cdecl;
    procedure setPort(p: Integer); cdecl;
    procedure setServiceName(s: JString); cdecl;
    procedure setServiceType(s: JString); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJNsdServiceInfo = class(TJavaGenericImport<JNsdServiceInfoClass, JNsdServiceInfo>) end;

  JAudioCodecClass = interface(JObjectClass)
    ['{D0BBEEA8-326A-426C-BB18-AA66DC82D8FD}']
    {class} function _GetAMR: JAudioCodec; cdecl;
    {class} function _GetGSM: JAudioCodec; cdecl;
    {class} function _GetGSM_EFR: JAudioCodec; cdecl;
    {class} function _GetPCMA: JAudioCodec; cdecl;
    {class} function _GetPCMU: JAudioCodec; cdecl;
    {class} function getCodec(type_: Integer; rtpmap: JString; fmtp: JString): JAudioCodec; cdecl;
    {class} function getCodecs: TJavaObjectArray<JAudioCodec>; cdecl;
    {class} property AMR: JAudioCodec read _GetAMR;
    {class} property GSM: JAudioCodec read _GetGSM;
    {class} property GSM_EFR: JAudioCodec read _GetGSM_EFR;
    {class} property PCMA: JAudioCodec read _GetPCMA;
    {class} property PCMU: JAudioCodec read _GetPCMU;
  end;

  [JavaSignature('android/net/rtp/AudioCodec')]
  JAudioCodec = interface(JObject)
    ['{5D3EAB7F-26CC-45EB-A6F5-1696F429EFD6}']
    function _Getfmtp: JString; cdecl;
    function _Getrtpmap: JString; cdecl;
    function _Gettype: Integer; cdecl;
    property fmtp: JString read _Getfmtp;
    property rtpmap: JString read _Getrtpmap;
    property &type: Integer read _Gettype;
  end;
  TJAudioCodec = class(TJavaGenericImport<JAudioCodecClass, JAudioCodec>) end;

  JAudioGroupClass = interface(JObjectClass)
    ['{FC090273-E720-4111-97EF-F79D17C3CE60}']
    {class} function _GetMODE_ECHO_SUPPRESSION: Integer; cdecl;
    {class} function _GetMODE_MUTED: Integer; cdecl;
    {class} function _GetMODE_NORMAL: Integer; cdecl;
    {class} function _GetMODE_ON_HOLD: Integer; cdecl;
    {class} function init: JAudioGroup; cdecl; overload;//Deprecated
    {class} //function init(context: JContext): JAudioGroup; cdecl; overload;
    {class} property MODE_ECHO_SUPPRESSION: Integer read _GetMODE_ECHO_SUPPRESSION;
    {class} property MODE_MUTED: Integer read _GetMODE_MUTED;
    {class} property MODE_NORMAL: Integer read _GetMODE_NORMAL;
    {class} property MODE_ON_HOLD: Integer read _GetMODE_ON_HOLD;
  end;

  [JavaSignature('android/net/rtp/AudioGroup')]
  JAudioGroup = interface(JObject)
    ['{B0C3CC5C-C61A-4EC7-87FF-CE5F74CD9E3F}']
    procedure clear; cdecl;
    function getMode: Integer; cdecl;
    function getStreams: TJavaObjectArray<JAudioStream>; cdecl;
    procedure sendDtmf(event: Integer); cdecl;
    procedure setMode(mode: Integer); cdecl;
  end;
  TJAudioGroup = class(TJavaGenericImport<JAudioGroupClass, JAudioGroup>) end;

  JRtpStreamClass = interface(JObjectClass)
    ['{F31C4CE4-0378-4F3D-AE1E-79E2E13662A4}']
    {class} function _GetMODE_NORMAL: Integer; cdecl;
    {class} function _GetMODE_RECEIVE_ONLY: Integer; cdecl;
    {class} function _GetMODE_SEND_ONLY: Integer; cdecl;
    {class} property MODE_NORMAL: Integer read _GetMODE_NORMAL;
    {class} property MODE_RECEIVE_ONLY: Integer read _GetMODE_RECEIVE_ONLY;
    {class} property MODE_SEND_ONLY: Integer read _GetMODE_SEND_ONLY;
  end;

  [JavaSignature('android/net/rtp/RtpStream')]
  JRtpStream = interface(JObject)
    ['{9D96096E-B8D2-440A-81C8-318487A5E656}']
    procedure associate(address: JInetAddress; port: Integer); cdecl;
    function getLocalAddress: JInetAddress; cdecl;
    function getLocalPort: Integer; cdecl;
    function getMode: Integer; cdecl;
    function getRemoteAddress: JInetAddress; cdecl;
    function getRemotePort: Integer; cdecl;
    function isBusy: Boolean; cdecl;
    procedure release; cdecl;
    procedure setMode(mode: Integer); cdecl;
  end;
  TJRtpStream = class(TJavaGenericImport<JRtpStreamClass, JRtpStream>) end;

  JAudioStreamClass = interface(JRtpStreamClass)
    ['{B15F1BC2-3A36-4000-AE22-40D8C8F6674C}']
    {class} function init(address: JInetAddress): JAudioStream; cdecl;
  end;

  [JavaSignature('android/net/rtp/AudioStream')]
  JAudioStream = interface(JRtpStream)
    ['{17FFCFDF-7FC5-46AB-81FF-82A4D2611968}']
    function getCodec: JAudioCodec; cdecl;
    function getDtmfType: Integer; cdecl;
    function getGroup: JAudioGroup; cdecl;
    function isBusy: Boolean; cdecl;
    procedure join(group: JAudioGroup); cdecl;
    procedure setCodec(codec: JAudioCodec); cdecl;
    procedure setDtmfType(type_: Integer); cdecl;
  end;
  TJAudioStream = class(TJavaGenericImport<JAudioStreamClass, JAudioStream>) end;

  JSipAudioCallClass = interface(JObjectClass)
    ['{29F8DAE8-810C-47D5-9CCB-550AD83F7B64}']
    {class} //function init(context: JContext; localProfile: JSipProfile): JSipAudioCall; cdecl;
  end;

  [JavaSignature('android/net/sip/SipAudioCall')]
  JSipAudioCall = interface(JObject)
    ['{C202D741-9EF4-46FC-B44E-71A47E1BE0B2}']
    procedure answerCall(timeout: Integer); cdecl;
    procedure attachCall(session: JSipSession; sessionDescription: JString); cdecl;
    procedure close; cdecl;
    procedure continueCall(timeout: Integer); cdecl;
    procedure endCall; cdecl;
    function getLocalProfile: JSipProfile; cdecl;
    function getPeerProfile: JSipProfile; cdecl;
    function getState: Integer; cdecl;
    procedure holdCall(timeout: Integer); cdecl;
    function isInCall: Boolean; cdecl;
    function isMuted: Boolean; cdecl;
    function isOnHold: Boolean; cdecl;
    procedure makeCall(peerProfile: JSipProfile; sipSession: JSipSession; timeout: Integer); cdecl;
    procedure sendDtmf(code: Integer); cdecl; overload;
    procedure sendDtmf(code: Integer; result: JMessage); cdecl; overload;
    procedure setListener(listener: JSipAudioCall_Listener); cdecl; overload;
    procedure setListener(listener: JSipAudioCall_Listener; callbackImmediately: Boolean); cdecl; overload;
    procedure setSpeakerMode(speakerMode: Boolean); cdecl;
    procedure startAudio; cdecl;
    procedure toggleMute; cdecl;
  end;
  TJSipAudioCall = class(TJavaGenericImport<JSipAudioCallClass, JSipAudioCall>) end;

  JSipAudioCall_ListenerClass = interface(JObjectClass)
    ['{F1832CF9-0244-4455-8D81-05CAD7E54EB0}']
    {class} function init: JSipAudioCall_Listener; cdecl;
  end;

  [JavaSignature('android/net/sip/SipAudioCall$Listener')]
  JSipAudioCall_Listener = interface(JObject)
    ['{86A44DF0-7A35-4BD1-9A83-0757D773FFDB}']
    procedure onCallBusy(call: JSipAudioCall); cdecl;
    procedure onCallEnded(call: JSipAudioCall); cdecl;
    procedure onCallEstablished(call: JSipAudioCall); cdecl;
    procedure onCallHeld(call: JSipAudioCall); cdecl;
    procedure onCalling(call: JSipAudioCall); cdecl;
    procedure onChanged(call: JSipAudioCall); cdecl;
    procedure onError(call: JSipAudioCall; errorCode: Integer; errorMessage: JString); cdecl;
    procedure onReadyToCall(call: JSipAudioCall); cdecl;
    procedure onRinging(call: JSipAudioCall; caller: JSipProfile); cdecl;
    procedure onRingingBack(call: JSipAudioCall); cdecl;
  end;
  TJSipAudioCall_Listener = class(TJavaGenericImport<JSipAudioCall_ListenerClass, JSipAudioCall_Listener>) end;

  JSipErrorCodeClass = interface(JObjectClass)
    ['{420819AC-E331-4259-82CC-8E5FACC4DEDD}']
    {class} function _GetCLIENT_ERROR: Integer; cdecl;
    {class} function _GetCROSS_DOMAIN_AUTHENTICATION: Integer; cdecl;
    {class} function _GetDATA_CONNECTION_LOST: Integer; cdecl;
    {class} function _GetINVALID_CREDENTIALS: Integer; cdecl;
    {class} function _GetINVALID_REMOTE_URI: Integer; cdecl;
    {class} function _GetIN_PROGRESS: Integer; cdecl;
    {class} function _GetNO_ERROR: Integer; cdecl;
    {class} function _GetPEER_NOT_REACHABLE: Integer; cdecl;
    {class} function _GetSERVER_ERROR: Integer; cdecl;
    {class} function _GetSERVER_UNREACHABLE: Integer; cdecl;
    {class} function _GetSOCKET_ERROR: Integer; cdecl;
    {class} function _GetTIME_OUT: Integer; cdecl;
    {class} function _GetTRANSACTION_TERMINTED: Integer; cdecl;
    {class} function toString(errorCode: Integer): JString; cdecl;
    {class} property CLIENT_ERROR: Integer read _GetCLIENT_ERROR;
    {class} property CROSS_DOMAIN_AUTHENTICATION: Integer read _GetCROSS_DOMAIN_AUTHENTICATION;
    {class} property DATA_CONNECTION_LOST: Integer read _GetDATA_CONNECTION_LOST;
    {class} property INVALID_CREDENTIALS: Integer read _GetINVALID_CREDENTIALS;
    {class} property INVALID_REMOTE_URI: Integer read _GetINVALID_REMOTE_URI;
    {class} property IN_PROGRESS: Integer read _GetIN_PROGRESS;
    {class} property NO_ERROR: Integer read _GetNO_ERROR;
    {class} property PEER_NOT_REACHABLE: Integer read _GetPEER_NOT_REACHABLE;
    {class} property SERVER_ERROR: Integer read _GetSERVER_ERROR;
    {class} property SERVER_UNREACHABLE: Integer read _GetSERVER_UNREACHABLE;
    {class} property SOCKET_ERROR: Integer read _GetSOCKET_ERROR;
    {class} property TIME_OUT: Integer read _GetTIME_OUT;
    {class} property TRANSACTION_TERMINTED: Integer read _GetTRANSACTION_TERMINTED;
  end;

  [JavaSignature('android/net/sip/SipErrorCode')]
  JSipErrorCode = interface(JObject)
    ['{1982EB59-8190-461C-9973-F4BB2158F96C}']
  end;
  TJSipErrorCode = class(TJavaGenericImport<JSipErrorCodeClass, JSipErrorCode>) end;

  JSipExceptionClass = interface(JExceptionClass)
    ['{2ADC2EBC-0A64-489D-A63A-4C8F3E7299C6}']
    {class} function init: JSipException; cdecl; overload;
    {class} function init(message: JString): JSipException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JSipException; cdecl; overload;
  end;

  [JavaSignature('android/net/sip/SipException')]
  JSipException = interface(JException)
    ['{68E78C59-1BC1-487E-8F4A-4A1D85DF67A9}']
  end;
  TJSipException = class(TJavaGenericImport<JSipExceptionClass, JSipException>) end;

  JSipManagerClass = interface(JObjectClass)
    ['{7778D960-3D28-4DCF-953C-DBB3B8540864}']
    {class} function _GetEXTRA_CALL_ID: JString; cdecl;
    {class} function _GetEXTRA_OFFER_SD: JString; cdecl;
    {class} function _GetINCOMING_CALL_RESULT_CODE: Integer; cdecl;
    {class} //function getCallId(incomingCallIntent: JIntent): JString; cdecl;
    {class} //function getOfferSessionDescription(incomingCallIntent: JIntent): JString; cdecl;
    {class} //function isApiSupported(context: JContext): Boolean; cdecl;
    {class} //function isIncomingCallIntent(intent: JIntent): Boolean; cdecl;
    {class} //function isSipWifiOnly(context: JContext): Boolean; cdecl;
    {class} //function isVoipSupported(context: JContext): Boolean; cdecl;
    {class} //function newInstance(context: JContext): JSipManager; cdecl;
    {class} property EXTRA_CALL_ID: JString read _GetEXTRA_CALL_ID;
    {class} property EXTRA_OFFER_SD: JString read _GetEXTRA_OFFER_SD;
    {class} property INCOMING_CALL_RESULT_CODE: Integer read _GetINCOMING_CALL_RESULT_CODE;
  end;

  [JavaSignature('android/net/sip/SipManager')]
  JSipManager = interface(JObject)
    ['{85E28BFD-DFF2-4513-9054-1D4C01C9DDD3}']
    procedure close(localProfileUri: JString); cdecl;
    function createSipSession(localProfile: JSipProfile; listener: JSipSession_Listener): JSipSession; cdecl;
    //function getSessionFor(incomingCallIntent: JIntent): JSipSession; cdecl;
    function isOpened(localProfileUri: JString): Boolean; cdecl;
    function isRegistered(localProfileUri: JString): Boolean; cdecl;
    function makeAudioCall(localProfile: JSipProfile; peerProfile: JSipProfile; listener: JSipAudioCall_Listener; timeout: Integer): JSipAudioCall; cdecl; overload;
    function makeAudioCall(localProfileUri: JString; peerProfileUri: JString; listener: JSipAudioCall_Listener; timeout: Integer): JSipAudioCall; cdecl; overload;
    procedure open(localProfile: JSipProfile); cdecl; overload;
    //procedure open(localProfile: JSipProfile; incomingCallPendingIntent: JPendingIntent; listener: JSipRegistrationListener); cdecl; overload;
    procedure register(localProfile: JSipProfile; expiryTime: Integer; listener: JSipRegistrationListener); cdecl;
    procedure setRegistrationListener(localProfileUri: JString; listener: JSipRegistrationListener); cdecl;
    //function takeAudioCall(incomingCallIntent: JIntent; listener: JSipAudioCall_Listener): JSipAudioCall; cdecl;
    procedure unregister(localProfile: JSipProfile; listener: JSipRegistrationListener); cdecl;
  end;
  TJSipManager = class(TJavaGenericImport<JSipManagerClass, JSipManager>) end;

  JSipProfileClass = interface(JObjectClass)
    ['{FAC70DC6-3FE4-445E-BA99-8D7D34C26870}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/sip/SipProfile')]
  JSipProfile = interface(JObject)
    ['{9BCA051D-AED4-447D-80E8-B142B27CE630}']
    function describeContents: Integer; cdecl;
    function getAuthUserName: JString; cdecl;
    function getAutoRegistration: Boolean; cdecl;
    function getDisplayName: JString; cdecl;
    function getPassword: JString; cdecl;
    function getPort: Integer; cdecl;
    function getProfileName: JString; cdecl;
    function getProtocol: JString; cdecl;
    function getProxyAddress: JString; cdecl;
    function getSendKeepAlive: Boolean; cdecl;
    function getSipDomain: JString; cdecl;
    function getUriString: JString; cdecl;
    function getUserName: JString; cdecl;
    procedure setCallingUid(uid: Integer); cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJSipProfile = class(TJavaGenericImport<JSipProfileClass, JSipProfile>) end;

  JSipProfile_BuilderClass = interface(JObjectClass)
    ['{05283EF7-C2F7-47BC-A5BE-F8DF295D7382}']
    {class} function init(profile: JSipProfile): JSipProfile_Builder; cdecl; overload;
    {class} function init(uriString: JString): JSipProfile_Builder; cdecl; overload;
    {class} function init(username: JString; serverDomain: JString): JSipProfile_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/sip/SipProfile$Builder')]
  JSipProfile_Builder = interface(JObject)
    ['{767B596B-BC13-4F29-ABE4-AFD83577826B}']
    function build: JSipProfile; cdecl;
    function setAuthUserName(name: JString): JSipProfile_Builder; cdecl;
    function setAutoRegistration(flag: Boolean): JSipProfile_Builder; cdecl;
    function setDisplayName(displayName: JString): JSipProfile_Builder; cdecl;
    function setOutboundProxy(outboundProxy: JString): JSipProfile_Builder; cdecl;
    function setPassword(password: JString): JSipProfile_Builder; cdecl;
    function setPort(port: Integer): JSipProfile_Builder; cdecl;
    function setProfileName(name: JString): JSipProfile_Builder; cdecl;
    function setProtocol(protocol: JString): JSipProfile_Builder; cdecl;
    function setSendKeepAlive(flag: Boolean): JSipProfile_Builder; cdecl;
  end;
  TJSipProfile_Builder = class(TJavaGenericImport<JSipProfile_BuilderClass, JSipProfile_Builder>) end;

  JSipRegistrationListenerClass = interface(IJavaClass)
    ['{4E6C2090-2E90-4D70-B89B-7A99F778DA2D}']
  end;

  [JavaSignature('android/net/sip/SipRegistrationListener')]
  JSipRegistrationListener = interface(IJavaInstance)
    ['{1ED240E6-DDEF-4626-9EA2-C62B459A5F6A}']
    procedure onRegistering(localProfileUri: JString); cdecl;
    procedure onRegistrationDone(localProfileUri: JString; expiryTime: Int64); cdecl;
    procedure onRegistrationFailed(localProfileUri: JString; errorCode: Integer; errorMessage: JString); cdecl;
  end;
  TJSipRegistrationListener = class(TJavaGenericImport<JSipRegistrationListenerClass, JSipRegistrationListener>) end;

  JSipSessionClass = interface(JObjectClass)
    ['{3D6D2C96-28DF-4254-A175-60FF059BA313}']
  end;

  [JavaSignature('android/net/sip/SipSession')]
  JSipSession = interface(JObject)
    ['{F76E851E-8DF2-47FF-ACF1-38177E0DAD5A}']
    procedure answerCall(sessionDescription: JString; timeout: Integer); cdecl;
    procedure changeCall(sessionDescription: JString; timeout: Integer); cdecl;
    procedure endCall; cdecl;
    function getCallId: JString; cdecl;
    function getLocalIp: JString; cdecl;
    function getLocalProfile: JSipProfile; cdecl;
    function getPeerProfile: JSipProfile; cdecl;
    function getState: Integer; cdecl;
    function isInCall: Boolean; cdecl;
    procedure makeCall(callee: JSipProfile; sessionDescription: JString; timeout: Integer); cdecl;
    procedure register(duration: Integer); cdecl;
    procedure setListener(listener: JSipSession_Listener); cdecl;
    procedure unregister; cdecl;
  end;
  TJSipSession = class(TJavaGenericImport<JSipSessionClass, JSipSession>) end;

  JSipSession_ListenerClass = interface(JObjectClass)
    ['{76664C9D-D8F9-42D0-8A2D-D54BF3F3B962}']
    {class} function init: JSipSession_Listener; cdecl;
  end;

  [JavaSignature('android/net/sip/SipSession$Listener')]
  JSipSession_Listener = interface(JObject)
    ['{AE555B3F-03D9-42B0-ADEC-F928509A13EE}']
    procedure onCallBusy(session: JSipSession); cdecl;
    procedure onCallChangeFailed(session: JSipSession; errorCode: Integer; errorMessage: JString); cdecl;
    procedure onCallEnded(session: JSipSession); cdecl;
    procedure onCallEstablished(session: JSipSession; sessionDescription: JString); cdecl;
    procedure onCalling(session: JSipSession); cdecl;
    procedure onError(session: JSipSession; errorCode: Integer; errorMessage: JString); cdecl;
    procedure onRegistering(session: JSipSession); cdecl;
    procedure onRegistrationDone(session: JSipSession; duration: Integer); cdecl;
    procedure onRegistrationFailed(session: JSipSession; errorCode: Integer; errorMessage: JString); cdecl;
    procedure onRegistrationTimeout(session: JSipSession); cdecl;
    procedure onRinging(session: JSipSession; caller: JSipProfile; sessionDescription: JString); cdecl;
    procedure onRingingBack(session: JSipSession); cdecl;
  end;
  TJSipSession_Listener = class(TJavaGenericImport<JSipSession_ListenerClass, JSipSession_Listener>) end;

  JSipSession_StateClass = interface(JObjectClass)
    ['{7DBF834C-22CD-4A2E-9210-DC1C419B8B8E}']
    {class} function _GetDEREGISTERING: Integer; cdecl;
    {class} function _GetINCOMING_CALL: Integer; cdecl;
    {class} function _GetINCOMING_CALL_ANSWERING: Integer; cdecl;
    {class} function _GetIN_CALL: Integer; cdecl;
    {class} function _GetNOT_DEFINED: Integer; cdecl;
    {class} function _GetOUTGOING_CALL: Integer; cdecl;
    {class} function _GetOUTGOING_CALL_CANCELING: Integer; cdecl;
    {class} function _GetOUTGOING_CALL_RING_BACK: Integer; cdecl;
    {class} function _GetPINGING: Integer; cdecl;
    {class} function _GetREADY_TO_CALL: Integer; cdecl;
    {class} function _GetREGISTERING: Integer; cdecl;
    {class} function toString(state: Integer): JString; cdecl;
    {class} property DEREGISTERING: Integer read _GetDEREGISTERING;
    {class} property INCOMING_CALL: Integer read _GetINCOMING_CALL;
    {class} property INCOMING_CALL_ANSWERING: Integer read _GetINCOMING_CALL_ANSWERING;
    {class} property IN_CALL: Integer read _GetIN_CALL;
    {class} property NOT_DEFINED: Integer read _GetNOT_DEFINED;
    {class} property OUTGOING_CALL: Integer read _GetOUTGOING_CALL;
    {class} property OUTGOING_CALL_CANCELING: Integer read _GetOUTGOING_CALL_CANCELING;
    {class} property OUTGOING_CALL_RING_BACK: Integer read _GetOUTGOING_CALL_RING_BACK;
    {class} property PINGING: Integer read _GetPINGING;
    {class} property READY_TO_CALL: Integer read _GetREADY_TO_CALL;
    {class} property REGISTERING: Integer read _GetREGISTERING;
  end;

  [JavaSignature('android/net/sip/SipSession$State')]
  JSipSession_State = interface(JObject)
    ['{C759EABE-2AE4-458F-A9DD-608B3C0E9121}']
  end;
  TJSipSession_State = class(TJavaGenericImport<JSipSession_StateClass, JSipSession_State>) end;

  JSSLEnginesClass = interface(JObjectClass)
    ['{F1984DF4-E74D-4671-9093-D24F90971D56}']
    {class} function exportKeyingMaterial(engine: JSSLEngine; label_: JString; context: TJavaArray<Byte>; length: Integer): TJavaArray<Byte>; cdecl;
    {class} function isSupportedEngine(engine: JSSLEngine): Boolean; cdecl;
    {class} procedure setUseSessionTickets(engine: JSSLEngine; useSessionTickets: Boolean); cdecl;
  end;

  [JavaSignature('android/net/ssl/SSLEngines')]
  JSSLEngines = interface(JObject)
    ['{51D49178-D048-413A-89C5-9071F8519F20}']
  end;
  TJSSLEngines = class(TJavaGenericImport<JSSLEnginesClass, JSSLEngines>) end;

  JSSLSocketsClass = interface(JObjectClass)
    ['{3C5B0BCB-77F6-40EB-9A34-AB3A0F3DC211}']
    {class} function exportKeyingMaterial(socket: JSSLSocket; label_: JString; context: TJavaArray<Byte>; length: Integer): TJavaArray<Byte>; cdecl;
    {class} function isSupportedSocket(socket: JSSLSocket): Boolean; cdecl;
    {class} procedure setUseSessionTickets(socket: JSSLSocket; useSessionTickets: Boolean); cdecl;
  end;

  [JavaSignature('android/net/ssl/SSLSockets')]
  JSSLSockets = interface(JObject)
    ['{62C816E0-9382-4E27-A297-3147ACE27C7C}']
  end;
  TJSSLSockets = class(TJavaGenericImport<JSSLSocketsClass, JSSLSockets>) end;

  JVcnUnderlyingNetworkTemplateClass = interface(JObjectClass)
    ['{2139BA7D-D3C6-4854-AF47-90765EDCEA5E}']
    {class} function _GetMATCH_ANY: Integer; cdecl;
    {class} function _GetMATCH_FORBIDDEN: Integer; cdecl;
    {class} function _GetMATCH_REQUIRED: Integer; cdecl;
    {class} property MATCH_ANY: Integer read _GetMATCH_ANY;
    {class} property MATCH_FORBIDDEN: Integer read _GetMATCH_FORBIDDEN;
    {class} property MATCH_REQUIRED: Integer read _GetMATCH_REQUIRED;
  end;

  [JavaSignature('android/net/vcn/VcnUnderlyingNetworkTemplate')]
  JVcnUnderlyingNetworkTemplate = interface(JObject)
    ['{FAEC84E7-EDB0-444F-AD65-195D1A9B0ECB}']
    function equals(other: JObject): Boolean; cdecl;
    function getMetered: Integer; cdecl;
    function getMinEntryDownstreamBandwidthKbps: Integer; cdecl;
    function getMinEntryUpstreamBandwidthKbps: Integer; cdecl;
    function getMinExitDownstreamBandwidthKbps: Integer; cdecl;
    function getMinExitUpstreamBandwidthKbps: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJVcnUnderlyingNetworkTemplate = class(TJavaGenericImport<JVcnUnderlyingNetworkTemplateClass, JVcnUnderlyingNetworkTemplate>) end;

  JVcnCellUnderlyingNetworkTemplateClass = interface(JVcnUnderlyingNetworkTemplateClass)
    ['{3427429E-F329-4F5C-B203-6E175569210B}']
  end;

  [JavaSignature('android/net/vcn/VcnCellUnderlyingNetworkTemplate')]
  JVcnCellUnderlyingNetworkTemplate = interface(JVcnUnderlyingNetworkTemplate)
    ['{34C312FD-290E-446E-9546-A78B866C72C9}']
    function equals(other: JObject): Boolean; cdecl;
    function getOperatorPlmnIds: JSet; cdecl;
    function getOpportunistic: Integer; cdecl;
    function getRoaming: Integer; cdecl;
    function getSimSpecificCarrierIds: JSet; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJVcnCellUnderlyingNetworkTemplate = class(TJavaGenericImport<JVcnCellUnderlyingNetworkTemplateClass, JVcnCellUnderlyingNetworkTemplate>) end;

  JVcnCellUnderlyingNetworkTemplate_BuilderClass = interface(JObjectClass)
    ['{73895A13-AB35-456D-A715-495981A46570}']
    {class} function init: JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
  end;

  [JavaSignature('android/net/vcn/VcnCellUnderlyingNetworkTemplate$Builder')]
  JVcnCellUnderlyingNetworkTemplate_Builder = interface(JObject)
    ['{B67B0E01-3480-4F71-BD21-D6925382B171}']
    function build: JVcnCellUnderlyingNetworkTemplate; cdecl;
    function setMetered(matchCriteria: Integer): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setMinDownstreamBandwidthKbps(minEntryDownstreamBandwidthKbps: Integer; minExitDownstreamBandwidthKbps: Integer): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setMinUpstreamBandwidthKbps(minEntryUpstreamBandwidthKbps: Integer; minExitUpstreamBandwidthKbps: Integer): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setOperatorPlmnIds(operatorPlmnIds: JSet): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setOpportunistic(matchCriteria: Integer): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setRoaming(matchCriteria: Integer): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
    function setSimSpecificCarrierIds(simSpecificCarrierIds: JSet): JVcnCellUnderlyingNetworkTemplate_Builder; cdecl;
  end;
  TJVcnCellUnderlyingNetworkTemplate_Builder = class(TJavaGenericImport<JVcnCellUnderlyingNetworkTemplate_BuilderClass, JVcnCellUnderlyingNetworkTemplate_Builder>) end;

  JVcnConfigClass = interface(JObjectClass)
    ['{57315FB2-7DE7-4130-806D-3C019E418CB9}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/vcn/VcnConfig')]
  JVcnConfig = interface(JObject)
    ['{38E724CE-F4D8-4189-920E-90BE44BF1225}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getGatewayConnectionConfigs: JSet; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJVcnConfig = class(TJavaGenericImport<JVcnConfigClass, JVcnConfig>) end;

  JVcnConfig_BuilderClass = interface(JObjectClass)
    ['{6CFA5EE2-10A4-4092-966A-77A1C23C40D6}']
    {class} //function init(context: JContext): JVcnConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/vcn/VcnConfig$Builder')]
  JVcnConfig_Builder = interface(JObject)
    ['{3CE50B1C-B427-4952-A5FA-F1FE92516368}']
    function addGatewayConnectionConfig(gatewayConnectionConfig: JVcnGatewayConnectionConfig): JVcnConfig_Builder; cdecl;
    function build: JVcnConfig; cdecl;
  end;
  TJVcnConfig_Builder = class(TJavaGenericImport<JVcnConfig_BuilderClass, JVcnConfig_Builder>) end;

  JVcnGatewayConnectionConfigClass = interface(JObjectClass)
    ['{A15D21ED-B4D8-42C4-9DFE-6B4B61AF7A62}']
  end;

  [JavaSignature('android/net/vcn/VcnGatewayConnectionConfig')]
  JVcnGatewayConnectionConfig = interface(JObject)
    ['{44CCB4E9-65EC-4B5D-B0F0-A9B38156E5A5}']
    function equals(other: JObject): Boolean; cdecl;
    function getExposedCapabilities: TJavaArray<Integer>; cdecl;
    function getGatewayConnectionName: JString; cdecl;
    function getMaxMtu: Integer; cdecl;
    function getRetryIntervalsMillis: TJavaArray<Int64>; cdecl;
    function getVcnUnderlyingNetworkPriorities: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJVcnGatewayConnectionConfig = class(TJavaGenericImport<JVcnGatewayConnectionConfigClass, JVcnGatewayConnectionConfig>) end;

  JVcnGatewayConnectionConfig_BuilderClass = interface(JObjectClass)
    ['{88B9CB8A-D71D-4492-A96D-635B0A5C9EA8}']
    {class} function init(gatewayConnectionName: JString; tunnelConnectionParams: JIkeTunnelConnectionParams): JVcnGatewayConnectionConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/vcn/VcnGatewayConnectionConfig$Builder')]
  JVcnGatewayConnectionConfig_Builder = interface(JObject)
    ['{38CEDD13-A7BD-47BB-9854-F51F3507BC54}']
    function addExposedCapability(exposedCapability: Integer): JVcnGatewayConnectionConfig_Builder; cdecl;
    function build: JVcnGatewayConnectionConfig; cdecl;
    function removeExposedCapability(exposedCapability: Integer): JVcnGatewayConnectionConfig_Builder; cdecl;
    function setMaxMtu(maxMtu: Integer): JVcnGatewayConnectionConfig_Builder; cdecl;
    function setRetryIntervalsMillis(retryIntervalsMs: TJavaArray<Int64>): JVcnGatewayConnectionConfig_Builder; cdecl;
    function setVcnUnderlyingNetworkPriorities(underlyingNetworkTemplates: JList): JVcnGatewayConnectionConfig_Builder; cdecl;
  end;
  TJVcnGatewayConnectionConfig_Builder = class(TJavaGenericImport<JVcnGatewayConnectionConfig_BuilderClass, JVcnGatewayConnectionConfig_Builder>) end;

  JVcnManagerClass = interface(JObjectClass)
    ['{3B054314-987F-43C7-9694-22286CF433E3}']
    {class} function _GetVCN_ERROR_CODE_CONFIG_ERROR: Integer; cdecl;
    {class} function _GetVCN_ERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetVCN_ERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetVCN_STATUS_CODE_ACTIVE: Integer; cdecl;
    {class} function _GetVCN_STATUS_CODE_INACTIVE: Integer; cdecl;
    {class} function _GetVCN_STATUS_CODE_NOT_CONFIGURED: Integer; cdecl;
    {class} function _GetVCN_STATUS_CODE_SAFE_MODE: Integer; cdecl;
    {class} property VCN_ERROR_CODE_CONFIG_ERROR: Integer read _GetVCN_ERROR_CODE_CONFIG_ERROR;
    {class} property VCN_ERROR_CODE_INTERNAL_ERROR: Integer read _GetVCN_ERROR_CODE_INTERNAL_ERROR;
    {class} property VCN_ERROR_CODE_NETWORK_ERROR: Integer read _GetVCN_ERROR_CODE_NETWORK_ERROR;
    {class} property VCN_STATUS_CODE_ACTIVE: Integer read _GetVCN_STATUS_CODE_ACTIVE;
    {class} property VCN_STATUS_CODE_INACTIVE: Integer read _GetVCN_STATUS_CODE_INACTIVE;
    {class} property VCN_STATUS_CODE_NOT_CONFIGURED: Integer read _GetVCN_STATUS_CODE_NOT_CONFIGURED;
    {class} property VCN_STATUS_CODE_SAFE_MODE: Integer read _GetVCN_STATUS_CODE_SAFE_MODE;
  end;

  [JavaSignature('android/net/vcn/VcnManager')]
  JVcnManager = interface(JObject)
    ['{723315A2-D897-40A5-AF2A-ACB7F2921A7B}']
    procedure clearVcnConfig(subscriptionGroup: JParcelUuid); cdecl;
    function getConfiguredSubscriptionGroups: JList; cdecl;
    procedure registerVcnStatusCallback(subscriptionGroup: JParcelUuid; executor: JExecutor; callback: JVcnManager_VcnStatusCallback); cdecl;
    procedure setVcnConfig(subscriptionGroup: JParcelUuid; config: JVcnConfig); cdecl;
    procedure unregisterVcnStatusCallback(callback: JVcnManager_VcnStatusCallback); cdecl;
  end;
  TJVcnManager = class(TJavaGenericImport<JVcnManagerClass, JVcnManager>) end;

  JVcnManager_VcnStatusCallbackClass = interface(JObjectClass)
    ['{56EEA259-0F4A-46C3-AD5F-EF44513C3C48}']
    {class} function init: JVcnManager_VcnStatusCallback; cdecl;
  end;

  [JavaSignature('android/net/vcn/VcnManager$VcnStatusCallback')]
  JVcnManager_VcnStatusCallback = interface(JObject)
    ['{9F731295-A2C7-4FF4-8E4B-10353E335565}']
    procedure onGatewayConnectionError(gatewayConnectionName: JString; errorCode: Integer; detail: JThrowable); cdecl;
    procedure onStatusChanged(statusCode: Integer); cdecl;
  end;
  TJVcnManager_VcnStatusCallback = class(TJavaGenericImport<JVcnManager_VcnStatusCallbackClass, JVcnManager_VcnStatusCallback>) end;

  JVcnWifiUnderlyingNetworkTemplateClass = interface(JVcnUnderlyingNetworkTemplateClass)
    ['{D190F1EF-EE3C-4E5A-BFB1-3E9A64B04EAA}']
  end;

  [JavaSignature('android/net/vcn/VcnWifiUnderlyingNetworkTemplate')]
  JVcnWifiUnderlyingNetworkTemplate = interface(JVcnUnderlyingNetworkTemplate)
    ['{315CD59A-8273-4CCB-83FD-66CCBEC2468F}']
    function equals(other: JObject): Boolean; cdecl;
    function getSsids: JSet; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJVcnWifiUnderlyingNetworkTemplate = class(TJavaGenericImport<JVcnWifiUnderlyingNetworkTemplateClass, JVcnWifiUnderlyingNetworkTemplate>) end;

  JVcnWifiUnderlyingNetworkTemplate_BuilderClass = interface(JObjectClass)
    ['{BD2FCB5B-0C0B-40EF-833F-B134639433FE}']
    {class} function init: JVcnWifiUnderlyingNetworkTemplate_Builder; cdecl;
  end;

  [JavaSignature('android/net/vcn/VcnWifiUnderlyingNetworkTemplate$Builder')]
  JVcnWifiUnderlyingNetworkTemplate_Builder = interface(JObject)
    ['{C0767C7C-009B-41C5-B8B5-5344A2A3461C}']
    function build: JVcnWifiUnderlyingNetworkTemplate; cdecl;
    function setMetered(matchCriteria: Integer): JVcnWifiUnderlyingNetworkTemplate_Builder; cdecl;
    function setMinDownstreamBandwidthKbps(minEntryDownstreamBandwidthKbps: Integer; minExitDownstreamBandwidthKbps: Integer): JVcnWifiUnderlyingNetworkTemplate_Builder; cdecl;
    function setMinUpstreamBandwidthKbps(minEntryUpstreamBandwidthKbps: Integer; minExitUpstreamBandwidthKbps: Integer): JVcnWifiUnderlyingNetworkTemplate_Builder; cdecl;
    function setSsids(ssids: JSet): JVcnWifiUnderlyingNetworkTemplate_Builder; cdecl;
  end;
  TJVcnWifiUnderlyingNetworkTemplate_Builder = class(TJavaGenericImport<JVcnWifiUnderlyingNetworkTemplate_BuilderClass, JVcnWifiUnderlyingNetworkTemplate_Builder>) end;

  JEasyConnectStatusCallbackClass = interface(JObjectClass)
    ['{60249CDB-CF60-4CF9-B361-5C7BEF0B6CDF}']
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_AUTHENTICATION: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_BUSY: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_CANNOT_FIND_NETWORK: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_CONFIGURATION: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_AUTHENTICATION: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_FAILED_TO_SCAN_NETWORK_CHANNEL: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_REJECTED_CONFIGURATION: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_GENERIC: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_INVALID_NETWORK: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_INVALID_URI: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_NOT_COMPATIBLE: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_TIMEOUT: Integer; cdecl;
    {class} function _GetEASY_CONNECT_EVENT_FAILURE_URI_GENERATION: Integer; cdecl;
    {class} property EASY_CONNECT_EVENT_FAILURE_AUTHENTICATION: Integer read _GetEASY_CONNECT_EVENT_FAILURE_AUTHENTICATION;
    {class} property EASY_CONNECT_EVENT_FAILURE_BUSY: Integer read _GetEASY_CONNECT_EVENT_FAILURE_BUSY;
    {class} property EASY_CONNECT_EVENT_FAILURE_CANNOT_FIND_NETWORK: Integer read _GetEASY_CONNECT_EVENT_FAILURE_CANNOT_FIND_NETWORK;
    {class} property EASY_CONNECT_EVENT_FAILURE_CONFIGURATION: Integer read _GetEASY_CONNECT_EVENT_FAILURE_CONFIGURATION;
    {class} property EASY_CONNECT_EVENT_FAILURE_ENROLLEE_AUTHENTICATION: Integer read _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_AUTHENTICATION;
    {class} property EASY_CONNECT_EVENT_FAILURE_ENROLLEE_FAILED_TO_SCAN_NETWORK_CHANNEL: Integer read _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_FAILED_TO_SCAN_NETWORK_CHANNEL;
    {class} property EASY_CONNECT_EVENT_FAILURE_ENROLLEE_REJECTED_CONFIGURATION: Integer read _GetEASY_CONNECT_EVENT_FAILURE_ENROLLEE_REJECTED_CONFIGURATION;
    {class} property EASY_CONNECT_EVENT_FAILURE_GENERIC: Integer read _GetEASY_CONNECT_EVENT_FAILURE_GENERIC;
    {class} property EASY_CONNECT_EVENT_FAILURE_INVALID_NETWORK: Integer read _GetEASY_CONNECT_EVENT_FAILURE_INVALID_NETWORK;
    {class} property EASY_CONNECT_EVENT_FAILURE_INVALID_URI: Integer read _GetEASY_CONNECT_EVENT_FAILURE_INVALID_URI;
    {class} property EASY_CONNECT_EVENT_FAILURE_NOT_COMPATIBLE: Integer read _GetEASY_CONNECT_EVENT_FAILURE_NOT_COMPATIBLE;
    {class} property EASY_CONNECT_EVENT_FAILURE_NOT_SUPPORTED: Integer read _GetEASY_CONNECT_EVENT_FAILURE_NOT_SUPPORTED;
    {class} property EASY_CONNECT_EVENT_FAILURE_TIMEOUT: Integer read _GetEASY_CONNECT_EVENT_FAILURE_TIMEOUT;
    {class} property EASY_CONNECT_EVENT_FAILURE_URI_GENERATION: Integer read _GetEASY_CONNECT_EVENT_FAILURE_URI_GENERATION;
  end;

  [JavaSignature('android/net/wifi/EasyConnectStatusCallback')]
  JEasyConnectStatusCallback = interface(JObject)
    ['{3FA91B69-947B-46E1-8E90-49186E58DD67}']
  end;
  TJEasyConnectStatusCallback = class(TJavaGenericImport<JEasyConnectStatusCallbackClass, JEasyConnectStatusCallback>) end;

  JMloLinkClass = interface(JObjectClass)
    ['{6EA072E3-9DFF-44C3-94FC-4622E6EDEBCD}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetINVALID_MLO_LINK_ID: Integer; cdecl;
    {class} function _GetMLO_LINK_STATE_ACTIVE: Integer; cdecl;
    {class} function _GetMLO_LINK_STATE_IDLE: Integer; cdecl;
    {class} function _GetMLO_LINK_STATE_INVALID: Integer; cdecl;
    {class} function _GetMLO_LINK_STATE_UNASSOCIATED: Integer; cdecl;
    {class} function init: JMloLink; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property INVALID_MLO_LINK_ID: Integer read _GetINVALID_MLO_LINK_ID;
    {class} property MLO_LINK_STATE_ACTIVE: Integer read _GetMLO_LINK_STATE_ACTIVE;
    {class} property MLO_LINK_STATE_IDLE: Integer read _GetMLO_LINK_STATE_IDLE;
    {class} property MLO_LINK_STATE_INVALID: Integer read _GetMLO_LINK_STATE_INVALID;
    {class} property MLO_LINK_STATE_UNASSOCIATED: Integer read _GetMLO_LINK_STATE_UNASSOCIATED;
  end;

  [JavaSignature('android/net/wifi/MloLink')]
  JMloLink = interface(JObject)
    ['{99885658-39F3-438A-8133-489035BBDE76}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getApMacAddress: JMacAddress; cdecl;
    function getBand: Integer; cdecl;
    function getChannel: Integer; cdecl;
    function getLinkId: Integer; cdecl;
    function getStaMacAddress: JMacAddress; cdecl;
    function getState: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMloLink = class(TJavaGenericImport<JMloLinkClass, JMloLink>) end;

  JScanResultClass = interface(JObjectClass)
    ['{6C743694-E698-4C31-805F-13546BC872D7}']
    {class} function _GetCHANNEL_WIDTH_160MHZ: Integer; cdecl;
    {class} function _GetCHANNEL_WIDTH_20MHZ: Integer; cdecl;
    {class} function _GetCHANNEL_WIDTH_320MHZ: Integer; cdecl;
    {class} function _GetCHANNEL_WIDTH_40MHZ: Integer; cdecl;
    {class} function _GetCHANNEL_WIDTH_80MHZ: Integer; cdecl;
    {class} function _GetCHANNEL_WIDTH_80MHZ_PLUS_MHZ: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPREAMBLE_EHT: Integer; cdecl;
    {class} function _GetPREAMBLE_HE: Integer; cdecl;
    {class} function _GetPREAMBLE_HT: Integer; cdecl;
    {class} function _GetPREAMBLE_LEGACY: Integer; cdecl;
    {class} function _GetPREAMBLE_VHT: Integer; cdecl;
    {class} function _GetUNSPECIFIED: Integer; cdecl;
    {class} function _GetWIFI_BAND_24_GHZ: Integer; cdecl;
    {class} function _GetWIFI_BAND_5_GHZ: Integer; cdecl;
    {class} function _GetWIFI_BAND_60_GHZ: Integer; cdecl;
    {class} function _GetWIFI_BAND_6_GHZ: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_11AC: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_11AD: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_11AX: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_11BE: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_11N: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_LEGACY: Integer; cdecl;
    {class} function _GetWIFI_STANDARD_UNKNOWN: Integer; cdecl;
    {class} function init(source: JScanResult): JScanResult; cdecl; overload;
    {class} function init: JScanResult; cdecl; overload;
    {class} function convertChannelToFrequencyMhzIfSupported(channel: Integer; band: Integer): Integer; cdecl;
    {class} function convertFrequencyMhzToChannelIfSupported(freqMhz: Integer): Integer; cdecl;
    {class} property CHANNEL_WIDTH_160MHZ: Integer read _GetCHANNEL_WIDTH_160MHZ;
    {class} property CHANNEL_WIDTH_20MHZ: Integer read _GetCHANNEL_WIDTH_20MHZ;
    {class} property CHANNEL_WIDTH_320MHZ: Integer read _GetCHANNEL_WIDTH_320MHZ;
    {class} property CHANNEL_WIDTH_40MHZ: Integer read _GetCHANNEL_WIDTH_40MHZ;
    {class} property CHANNEL_WIDTH_80MHZ: Integer read _GetCHANNEL_WIDTH_80MHZ;
    {class} property CHANNEL_WIDTH_80MHZ_PLUS_MHZ: Integer read _GetCHANNEL_WIDTH_80MHZ_PLUS_MHZ;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PREAMBLE_EHT: Integer read _GetPREAMBLE_EHT;
    {class} property PREAMBLE_HE: Integer read _GetPREAMBLE_HE;
    {class} property PREAMBLE_HT: Integer read _GetPREAMBLE_HT;
    {class} property PREAMBLE_LEGACY: Integer read _GetPREAMBLE_LEGACY;
    {class} property PREAMBLE_VHT: Integer read _GetPREAMBLE_VHT;
    {class} property UNSPECIFIED: Integer read _GetUNSPECIFIED;
    {class} property WIFI_BAND_24_GHZ: Integer read _GetWIFI_BAND_24_GHZ;
    {class} property WIFI_BAND_5_GHZ: Integer read _GetWIFI_BAND_5_GHZ;
    {class} property WIFI_BAND_60_GHZ: Integer read _GetWIFI_BAND_60_GHZ;
    {class} property WIFI_BAND_6_GHZ: Integer read _GetWIFI_BAND_6_GHZ;
    {class} property WIFI_STANDARD_11AC: Integer read _GetWIFI_STANDARD_11AC;
    {class} property WIFI_STANDARD_11AD: Integer read _GetWIFI_STANDARD_11AD;
    {class} property WIFI_STANDARD_11AX: Integer read _GetWIFI_STANDARD_11AX;
    {class} property WIFI_STANDARD_11BE: Integer read _GetWIFI_STANDARD_11BE;
    {class} property WIFI_STANDARD_11N: Integer read _GetWIFI_STANDARD_11N;
    {class} property WIFI_STANDARD_LEGACY: Integer read _GetWIFI_STANDARD_LEGACY;
    {class} property WIFI_STANDARD_UNKNOWN: Integer read _GetWIFI_STANDARD_UNKNOWN;
  end;

  [JavaSignature('android/net/wifi/ScanResult')]
  JScanResult = interface(JObject)
    ['{A50FF87A-D68A-4CCC-B186-D06D51E76145}']
    function _GetBSSID: JString; cdecl;
    procedure _SetBSSID(Value: JString); cdecl;
    function _GetSSID: JString; cdecl;
    procedure _SetSSID(Value: JString); cdecl;
    function _Getcapabilities: JString; cdecl;
    procedure _Setcapabilities(Value: JString); cdecl;
    function _GetcenterFreq0: Integer; cdecl;
    procedure _SetcenterFreq0(Value: Integer); cdecl;
    function _GetcenterFreq1: Integer; cdecl;
    procedure _SetcenterFreq1(Value: Integer); cdecl;
    function _GetchannelWidth: Integer; cdecl;
    procedure _SetchannelWidth(Value: Integer); cdecl;
    function _Getfrequency: Integer; cdecl;
    procedure _Setfrequency(Value: Integer); cdecl;
    function _Getlevel: Integer; cdecl;
    procedure _Setlevel(Value: Integer); cdecl;
    function _GetoperatorFriendlyName: JCharSequence; cdecl;
    procedure _SetoperatorFriendlyName(Value: JCharSequence); cdecl;
    function _Gettimestamp: Int64; cdecl;
    procedure _Settimestamp(Value: Int64); cdecl;
    function _GetvenueName: JCharSequence; cdecl;
    procedure _SetvenueName(Value: JCharSequence); cdecl;
    function getAffiliatedMloLinks: JList; cdecl;
    function getApMldMacAddress: JMacAddress; cdecl;
    function getApMloLinkId: Integer; cdecl;
    function getInformationElements: JList; cdecl;
    function getSecurityTypes: TJavaArray<Integer>; cdecl;
    function getWifiSsid: JWifiSsid; cdecl;
    function getWifiStandard: Integer; cdecl;
    function is80211mcResponder: Boolean; cdecl;
    function isPasspointNetwork: Boolean; cdecl;
    function toString: JString; cdecl;
    property BSSID: JString read _GetBSSID write _SetBSSID;
    property SSID: JString read _GetSSID write _SetSSID;
    property capabilities: JString read _Getcapabilities write _Setcapabilities;
    property centerFreq0: Integer read _GetcenterFreq0 write _SetcenterFreq0;
    property centerFreq1: Integer read _GetcenterFreq1 write _SetcenterFreq1;
    property channelWidth: Integer read _GetchannelWidth write _SetchannelWidth;
    property frequency: Integer read _Getfrequency write _Setfrequency;
    property level: Integer read _Getlevel write _Setlevel;
    property operatorFriendlyName: JCharSequence read _GetoperatorFriendlyName write _SetoperatorFriendlyName;
    property timestamp: Int64 read _Gettimestamp write _Settimestamp;
    property venueName: JCharSequence read _GetvenueName write _SetvenueName;
  end;
  TJScanResult = class(TJavaGenericImport<JScanResultClass, JScanResult>) end;

  JScanResult_InformationElementClass = interface(JObjectClass)
    ['{BE4524A1-2D71-435B-A645-30CF22800786}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(id: Integer; idExt: Integer; bytes: TJavaArray<Byte>): JScanResult_InformationElement; cdecl; overload;
    {class} function init(rhs: JScanResult_InformationElement): JScanResult_InformationElement; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/ScanResult$InformationElement')]
  JScanResult_InformationElement = interface(JObject)
    ['{FA3F385E-CCF0-435E-8C65-3E3244282A44}']
    function equals(that: JObject): Boolean; cdecl;
    function getBytes: JByteBuffer; cdecl;
    function getId: Integer; cdecl;
    function getIdExt: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJScanResult_InformationElement = class(TJavaGenericImport<JScanResult_InformationElementClass, JScanResult_InformationElement>) end;

  JSoftApConfigurationClass = interface(JObjectClass)
    ['{4A096CD2-56AC-4ADC-9CC7-06E91812FE37}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSECURITY_TYPE_OPEN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WPA2_PSK: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WPA3_OWE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WPA3_OWE_TRANSITION: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WPA3_SAE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WPA3_SAE_TRANSITION: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SECURITY_TYPE_OPEN: Integer read _GetSECURITY_TYPE_OPEN;
    {class} property SECURITY_TYPE_WPA2_PSK: Integer read _GetSECURITY_TYPE_WPA2_PSK;
    {class} property SECURITY_TYPE_WPA3_OWE: Integer read _GetSECURITY_TYPE_WPA3_OWE;
    {class} property SECURITY_TYPE_WPA3_OWE_TRANSITION: Integer read _GetSECURITY_TYPE_WPA3_OWE_TRANSITION;
    {class} property SECURITY_TYPE_WPA3_SAE: Integer read _GetSECURITY_TYPE_WPA3_SAE;
    {class} property SECURITY_TYPE_WPA3_SAE_TRANSITION: Integer read _GetSECURITY_TYPE_WPA3_SAE_TRANSITION;
  end;

  [JavaSignature('android/net/wifi/SoftApConfiguration')]
  JSoftApConfiguration = interface(JObject)
    ['{4B7C6092-C4BB-4789-A01E-1B7EBA80198F}']
    function describeContents: Integer; cdecl;
    function equals(otherObj: JObject): Boolean; cdecl;
    function getBssid: JMacAddress; cdecl;
    function getPassphrase: JString; cdecl;
    function getSecurityType: Integer; cdecl;
    function getSsid: JString; cdecl;//Deprecated
    function getWifiSsid: JWifiSsid; cdecl;
    function hashCode: Integer; cdecl;
    function isHiddenSsid: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSoftApConfiguration = class(TJavaGenericImport<JSoftApConfigurationClass, JSoftApConfiguration>) end;

  JSupplicantStateClass = interface(JEnumClass)
    ['{11D5113E-AE84-4F4C-832D-5F9E78A93530}']
    {class} function _GetASSOCIATED: JSupplicantState; cdecl;
    {class} function _GetASSOCIATING: JSupplicantState; cdecl;
    {class} function _GetAUTHENTICATING: JSupplicantState; cdecl;
    {class} function _GetCOMPLETED: JSupplicantState; cdecl;
    {class} function _GetDISCONNECTED: JSupplicantState; cdecl;
    {class} function _GetDORMANT: JSupplicantState; cdecl;
    {class} function _GetFOUR_WAY_HANDSHAKE: JSupplicantState; cdecl;
    {class} function _GetGROUP_HANDSHAKE: JSupplicantState; cdecl;
    {class} function _GetINACTIVE: JSupplicantState; cdecl;
    {class} function _GetINTERFACE_DISABLED: JSupplicantState; cdecl;
    {class} function _GetINVALID: JSupplicantState; cdecl;
    {class} function _GetSCANNING: JSupplicantState; cdecl;
    {class} function _GetUNINITIALIZED: JSupplicantState; cdecl;
    {class} function isValidState(state: JSupplicantState): Boolean; cdecl;
    {class} function valueOf(name: JString): JSupplicantState; cdecl;
    {class} function values: TJavaObjectArray<JSupplicantState>; cdecl;
    {class} property ASSOCIATED: JSupplicantState read _GetASSOCIATED;
    {class} property ASSOCIATING: JSupplicantState read _GetASSOCIATING;
    {class} property AUTHENTICATING: JSupplicantState read _GetAUTHENTICATING;
    {class} property COMPLETED: JSupplicantState read _GetCOMPLETED;
    {class} property DISCONNECTED: JSupplicantState read _GetDISCONNECTED;
    {class} property DORMANT: JSupplicantState read _GetDORMANT;
    {class} property FOUR_WAY_HANDSHAKE: JSupplicantState read _GetFOUR_WAY_HANDSHAKE;
    {class} property GROUP_HANDSHAKE: JSupplicantState read _GetGROUP_HANDSHAKE;
    {class} property INACTIVE: JSupplicantState read _GetINACTIVE;
    {class} property INTERFACE_DISABLED: JSupplicantState read _GetINTERFACE_DISABLED;
    {class} property INVALID: JSupplicantState read _GetINVALID;
    {class} property SCANNING: JSupplicantState read _GetSCANNING;
    {class} property UNINITIALIZED: JSupplicantState read _GetUNINITIALIZED;
  end;

  [JavaSignature('android/net/wifi/SupplicantState')]
  JSupplicantState = interface(JEnum)
    ['{1733F9B5-2434-461F-8DF6-F23617BFA5D8}']
  end;
  TJSupplicantState = class(TJavaGenericImport<JSupplicantStateClass, JSupplicantState>) end;

  JWifiConfigurationClass = interface(JObjectClass)
    ['{C8BFCCBF-51DC-4210-9559-EFF599859A26}']
    {class} function _GetRANDOMIZATION_AUTO: Integer; cdecl;
    {class} function _GetRANDOMIZATION_NONE: Integer; cdecl;
    {class} function _GetRANDOMIZATION_NON_PERSISTENT: Integer; cdecl;
    {class} function _GetRANDOMIZATION_PERSISTENT: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_DPP: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP_SUITE_B: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_OPEN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_OWE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_PSK: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_SAE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WAPI_CERT: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WAPI_PSK: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WEP: Integer; cdecl;
    {class} function init: JWifiConfiguration; cdecl; overload;
    {class} function init(source: JWifiConfiguration): JWifiConfiguration; cdecl; overload;
    {class} property RANDOMIZATION_AUTO: Integer read _GetRANDOMIZATION_AUTO;
    {class} property RANDOMIZATION_NONE: Integer read _GetRANDOMIZATION_NONE;
    {class} property RANDOMIZATION_NON_PERSISTENT: Integer read _GetRANDOMIZATION_NON_PERSISTENT;
    {class} property RANDOMIZATION_PERSISTENT: Integer read _GetRANDOMIZATION_PERSISTENT;
    {class} property SECURITY_TYPE_DPP: Integer read _GetSECURITY_TYPE_DPP;
    {class} property SECURITY_TYPE_EAP: Integer read _GetSECURITY_TYPE_EAP;
    {class} property SECURITY_TYPE_EAP_SUITE_B: Integer read _GetSECURITY_TYPE_EAP_SUITE_B;
    {class} property SECURITY_TYPE_EAP_WPA3_ENTERPRISE: Integer read _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE;
    {class} property SECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT: Integer read _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT;
    {class} property SECURITY_TYPE_OPEN: Integer read _GetSECURITY_TYPE_OPEN;
    {class} property SECURITY_TYPE_OWE: Integer read _GetSECURITY_TYPE_OWE;
    {class} property SECURITY_TYPE_PSK: Integer read _GetSECURITY_TYPE_PSK;
    {class} property SECURITY_TYPE_SAE: Integer read _GetSECURITY_TYPE_SAE;
    {class} property SECURITY_TYPE_WAPI_CERT: Integer read _GetSECURITY_TYPE_WAPI_CERT;
    {class} property SECURITY_TYPE_WAPI_PSK: Integer read _GetSECURITY_TYPE_WAPI_PSK;
    {class} property SECURITY_TYPE_WEP: Integer read _GetSECURITY_TYPE_WEP;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration')]
  JWifiConfiguration = interface(JObject)
    ['{ED67818C-4A3D-441D-987A-9E8826085924}']
    function _GetBSSID: JString; cdecl;
    procedure _SetBSSID(Value: JString); cdecl;
    function _GetFQDN: JString; cdecl;
    procedure _SetFQDN(Value: JString); cdecl;
    function _GetSSID: JString; cdecl;
    procedure _SetSSID(Value: JString); cdecl;
    function _GetallowedAuthAlgorithms: JBitSet; cdecl;
    procedure _SetallowedAuthAlgorithms(Value: JBitSet); cdecl;
    function _GetallowedGroupCiphers: JBitSet; cdecl;
    procedure _SetallowedGroupCiphers(Value: JBitSet); cdecl;
    function _GetallowedGroupManagementCiphers: JBitSet; cdecl;
    procedure _SetallowedGroupManagementCiphers(Value: JBitSet); cdecl;
    function _GetallowedKeyManagement: JBitSet; cdecl;
    procedure _SetallowedKeyManagement(Value: JBitSet); cdecl;
    function _GetallowedPairwiseCiphers: JBitSet; cdecl;
    procedure _SetallowedPairwiseCiphers(Value: JBitSet); cdecl;
    function _GetallowedProtocols: JBitSet; cdecl;
    procedure _SetallowedProtocols(Value: JBitSet); cdecl;
    function _GetallowedSuiteBCiphers: JBitSet; cdecl;
    procedure _SetallowedSuiteBCiphers(Value: JBitSet); cdecl;
    function _GetenterpriseConfig: JWifiEnterpriseConfig; cdecl;
    procedure _SetenterpriseConfig(Value: JWifiEnterpriseConfig); cdecl;
    function _GethiddenSSID: Boolean; cdecl;
    procedure _SethiddenSSID(Value: Boolean); cdecl;
    function _GetisHomeProviderNetwork: Boolean; cdecl;
    procedure _SetisHomeProviderNetwork(Value: Boolean); cdecl;
    function _GetnetworkId: Integer; cdecl;
    procedure _SetnetworkId(Value: Integer); cdecl;
    function _GetpreSharedKey: JString; cdecl;
    procedure _SetpreSharedKey(Value: JString); cdecl;
    function _Getpriority: Integer; cdecl;
    procedure _Setpriority(Value: Integer); cdecl;
    function _GetproviderFriendlyName: JString; cdecl;
    procedure _SetproviderFriendlyName(Value: JString); cdecl;
    function _GetroamingConsortiumIds: TJavaArray<Int64>; cdecl;
    procedure _SetroamingConsortiumIds(Value: TJavaArray<Int64>); cdecl;
    function _Getstatus: Integer; cdecl;
    procedure _Setstatus(Value: Integer); cdecl;
    function _GetwepKeys: TJavaObjectArray<JString>; cdecl;
    procedure _SetwepKeys(Value: TJavaObjectArray<JString>); cdecl;
    function _GetwepTxKeyIndex: Integer; cdecl;
    procedure _SetwepTxKeyIndex(Value: Integer); cdecl;
    function getHttpProxy: JProxyInfo; cdecl;
    function getKey: JString; cdecl;
    function getMacRandomizationSetting: Integer; cdecl;
    function getRandomizedMacAddress: JMacAddress; cdecl;
    function isDppConfigurator: Boolean; cdecl;
    function isPasspoint: Boolean; cdecl;
    procedure setHttpProxy(httpProxy: JProxyInfo); cdecl;
    procedure setIpConfiguration(ipConfiguration: JIpConfiguration); cdecl;
    procedure setMacRandomizationSetting(macRandomizationSetting: Integer); cdecl;
    procedure setSecurityParams(securityType: Integer); cdecl;
    function toString: JString; cdecl;
    property BSSID: JString read _GetBSSID write _SetBSSID;
    property FQDN: JString read _GetFQDN write _SetFQDN;
    property SSID: JString read _GetSSID write _SetSSID;
    property allowedAuthAlgorithms: JBitSet read _GetallowedAuthAlgorithms write _SetallowedAuthAlgorithms;
    property allowedGroupCiphers: JBitSet read _GetallowedGroupCiphers write _SetallowedGroupCiphers;
    property allowedGroupManagementCiphers: JBitSet read _GetallowedGroupManagementCiphers write _SetallowedGroupManagementCiphers;
    property allowedKeyManagement: JBitSet read _GetallowedKeyManagement write _SetallowedKeyManagement;
    property allowedPairwiseCiphers: JBitSet read _GetallowedPairwiseCiphers write _SetallowedPairwiseCiphers;
    property allowedProtocols: JBitSet read _GetallowedProtocols write _SetallowedProtocols;
    property allowedSuiteBCiphers: JBitSet read _GetallowedSuiteBCiphers write _SetallowedSuiteBCiphers;
    property enterpriseConfig: JWifiEnterpriseConfig read _GetenterpriseConfig write _SetenterpriseConfig;
    property hiddenSSID: Boolean read _GethiddenSSID write _SethiddenSSID;
    property isHomeProviderNetwork: Boolean read _GetisHomeProviderNetwork write _SetisHomeProviderNetwork;
    property networkId: Integer read _GetnetworkId write _SetnetworkId;
    property preSharedKey: JString read _GetpreSharedKey write _SetpreSharedKey;
    property priority: Integer read _Getpriority write _Setpriority;
    property providerFriendlyName: JString read _GetproviderFriendlyName write _SetproviderFriendlyName;
    property roamingConsortiumIds: TJavaArray<Int64> read _GetroamingConsortiumIds write _SetroamingConsortiumIds;
    property status: Integer read _Getstatus write _Setstatus;
    property wepKeys: TJavaObjectArray<JString> read _GetwepKeys write _SetwepKeys;
    property wepTxKeyIndex: Integer read _GetwepTxKeyIndex write _SetwepTxKeyIndex;
  end;
  TJWifiConfiguration = class(TJavaGenericImport<JWifiConfigurationClass, JWifiConfiguration>) end;

  JWifiConfiguration_AuthAlgorithmClass = interface(JObjectClass)
    ['{047D5EC9-9464-4C1F-972A-F1BE5E10672E}']
    {class} function _GetLEAP: Integer; cdecl;
    {class} function _GetOPEN: Integer; cdecl;
    {class} function _GetSAE: Integer; cdecl;
    {class} function _GetSHARED: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} function _GetvarName: JString; cdecl;
    {class} property LEAP: Integer read _GetLEAP;
    {class} property OPEN: Integer read _GetOPEN;
    {class} property SAE: Integer read _GetSAE;
    {class} property SHARED: Integer read _GetSHARED;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
    {class} property varName: JString read _GetvarName;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$AuthAlgorithm')]
  JWifiConfiguration_AuthAlgorithm = interface(JObject)
    ['{2258AEE7-6025-42A4-9812-F8340FDC38EE}']
  end;
  TJWifiConfiguration_AuthAlgorithm = class(TJavaGenericImport<JWifiConfiguration_AuthAlgorithmClass, JWifiConfiguration_AuthAlgorithm>) end;

  JWifiConfiguration_GroupCipherClass = interface(JObjectClass)
    ['{001FFC70-CA9D-415E-BB87-15BB196C6671}']
    {class} function _GetCCMP: Integer; cdecl;
    {class} function _GetGCMP_128: Integer; cdecl;
    {class} function _GetGCMP_256: Integer; cdecl;
    {class} function _GetSMS4: Integer; cdecl;
    {class} function _GetTKIP: Integer; cdecl;
    {class} function _GetWEP104: Integer; cdecl;
    {class} function _GetWEP40: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} function _GetvarName: JString; cdecl;
    {class} property CCMP: Integer read _GetCCMP;
    {class} property GCMP_128: Integer read _GetGCMP_128;
    {class} property GCMP_256: Integer read _GetGCMP_256;
    {class} property SMS4: Integer read _GetSMS4;
    {class} property TKIP: Integer read _GetTKIP;
    {class} property WEP104: Integer read _GetWEP104;
    {class} property WEP40: Integer read _GetWEP40;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
    {class} property varName: JString read _GetvarName;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$GroupCipher')]
  JWifiConfiguration_GroupCipher = interface(JObject)
    ['{B1180E11-3616-45A4-A088-FB7D2964AA75}']
  end;
  TJWifiConfiguration_GroupCipher = class(TJavaGenericImport<JWifiConfiguration_GroupCipherClass, JWifiConfiguration_GroupCipher>) end;

  JWifiConfiguration_GroupMgmtCipherClass = interface(JObjectClass)
    ['{17868363-F02C-4460-8A40-407D415D5B27}']
    {class} function _GetBIP_CMAC_256: Integer; cdecl;
    {class} function _GetBIP_GMAC_128: Integer; cdecl;
    {class} function _GetBIP_GMAC_256: Integer; cdecl;
    {class} property BIP_CMAC_256: Integer read _GetBIP_CMAC_256;
    {class} property BIP_GMAC_128: Integer read _GetBIP_GMAC_128;
    {class} property BIP_GMAC_256: Integer read _GetBIP_GMAC_256;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$GroupMgmtCipher')]
  JWifiConfiguration_GroupMgmtCipher = interface(JObject)
    ['{F5BA6019-CA97-4ED5-B551-9948178004A2}']
  end;
  TJWifiConfiguration_GroupMgmtCipher = class(TJavaGenericImport<JWifiConfiguration_GroupMgmtCipherClass, JWifiConfiguration_GroupMgmtCipher>) end;

  JWifiConfiguration_KeyMgmtClass = interface(JObjectClass)
    ['{EC2914FD-30CD-463D-A620-178C20486690}']
    {class} function _GetIEEE8021X: Integer; cdecl;
    {class} function _GetNONE: Integer; cdecl;
    {class} function _GetOWE: Integer; cdecl;
    {class} function _GetSAE: Integer; cdecl;
    {class} function _GetSUITE_B_192: Integer; cdecl;
    {class} function _GetWPA_EAP: Integer; cdecl;
    {class} function _GetWPA_PSK: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} function _GetvarName: JString; cdecl;
    {class} property IEEE8021X: Integer read _GetIEEE8021X;
    {class} property NONE: Integer read _GetNONE;
    {class} property OWE: Integer read _GetOWE;
    {class} property SAE: Integer read _GetSAE;
    {class} property SUITE_B_192: Integer read _GetSUITE_B_192;
    {class} property WPA_EAP: Integer read _GetWPA_EAP;
    {class} property WPA_PSK: Integer read _GetWPA_PSK;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
    {class} property varName: JString read _GetvarName;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$KeyMgmt')]
  JWifiConfiguration_KeyMgmt = interface(JObject)
    ['{75054BB4-74D2-4C59-95FE-F1B32C1DAAAE}']
  end;
  TJWifiConfiguration_KeyMgmt = class(TJavaGenericImport<JWifiConfiguration_KeyMgmtClass, JWifiConfiguration_KeyMgmt>) end;

  JWifiConfiguration_PairwiseCipherClass = interface(JObjectClass)
    ['{186CC97E-C88C-49C5-AC1C-40679A9E0827}']
    {class} function _GetCCMP: Integer; cdecl;
    {class} function _GetGCMP_128: Integer; cdecl;
    {class} function _GetGCMP_256: Integer; cdecl;
    {class} function _GetNONE: Integer; cdecl;
    {class} function _GetSMS4: Integer; cdecl;
    {class} function _GetTKIP: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} function _GetvarName: JString; cdecl;
    {class} property CCMP: Integer read _GetCCMP;
    {class} property GCMP_128: Integer read _GetGCMP_128;
    {class} property GCMP_256: Integer read _GetGCMP_256;
    {class} property NONE: Integer read _GetNONE;
    {class} property SMS4: Integer read _GetSMS4;
    {class} property TKIP: Integer read _GetTKIP;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
    {class} property varName: JString read _GetvarName;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$PairwiseCipher')]
  JWifiConfiguration_PairwiseCipher = interface(JObject)
    ['{10CF8A7C-307F-45DD-87AD-AAE724FD9486}']
  end;
  TJWifiConfiguration_PairwiseCipher = class(TJavaGenericImport<JWifiConfiguration_PairwiseCipherClass, JWifiConfiguration_PairwiseCipher>) end;

  JWifiConfiguration_ProtocolClass = interface(JObjectClass)
    ['{1FD6FF63-356B-41B1-BD8D-B6C8666BAD18}']
    {class} function _GetRSN: Integer; cdecl;
    {class} function _GetWAPI: Integer; cdecl;
    {class} function _GetWPA: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} function _GetvarName: JString; cdecl;
    {class} property RSN: Integer read _GetRSN;
    {class} property WAPI: Integer read _GetWAPI;
    {class} property WPA: Integer read _GetWPA;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
    {class} property varName: JString read _GetvarName;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$Protocol')]
  JWifiConfiguration_Protocol = interface(JObject)
    ['{E6C85E59-1C0B-4562-933A-63DDC77383CC}']
  end;
  TJWifiConfiguration_Protocol = class(TJavaGenericImport<JWifiConfiguration_ProtocolClass, JWifiConfiguration_Protocol>) end;

  JWifiConfiguration_StatusClass = interface(JObjectClass)
    ['{20D5CCD8-896F-47DD-A0F3-7D00B5CE8A10}']
    {class} function _GetCURRENT: Integer; cdecl;
    {class} function _GetDISABLED: Integer; cdecl;
    {class} function _GetENABLED: Integer; cdecl;
    {class} function _Getstrings: TJavaObjectArray<JString>; cdecl;
    {class} property CURRENT: Integer read _GetCURRENT;
    {class} property DISABLED: Integer read _GetDISABLED;
    {class} property ENABLED: Integer read _GetENABLED;
    {class} property strings: TJavaObjectArray<JString> read _Getstrings;
  end;

  [JavaSignature('android/net/wifi/WifiConfiguration$Status')]
  JWifiConfiguration_Status = interface(JObject)
    ['{F808D628-9382-4509-BD14-BF697EB5A088}']
  end;
  TJWifiConfiguration_Status = class(TJavaGenericImport<JWifiConfiguration_StatusClass, JWifiConfiguration_Status>) end;

  JWifiEnterpriseConfigClass = interface(JObjectClass)
    ['{8583C57E-0204-4BC8-B0D5-8B25DA81985B}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_WAPI_AS_CERTIFICATE_DATA: JString; cdecl;
    {class} function _GetEXTRA_WAPI_AS_CERTIFICATE_NAME: JString; cdecl;
    {class} function _GetEXTRA_WAPI_USER_CERTIFICATE_DATA: JString; cdecl;
    {class} function _GetEXTRA_WAPI_USER_CERTIFICATE_NAME: JString; cdecl;
    {class} function _GetWAPI_AS_CERTIFICATE: JString; cdecl;
    {class} function _GetWAPI_USER_CERTIFICATE: JString; cdecl;
    {class} function init: JWifiEnterpriseConfig; cdecl; overload;
    {class} function init(source: JWifiEnterpriseConfig): JWifiEnterpriseConfig; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_WAPI_AS_CERTIFICATE_DATA: JString read _GetEXTRA_WAPI_AS_CERTIFICATE_DATA;
    {class} property EXTRA_WAPI_AS_CERTIFICATE_NAME: JString read _GetEXTRA_WAPI_AS_CERTIFICATE_NAME;
    {class} property EXTRA_WAPI_USER_CERTIFICATE_DATA: JString read _GetEXTRA_WAPI_USER_CERTIFICATE_DATA;
    {class} property EXTRA_WAPI_USER_CERTIFICATE_NAME: JString read _GetEXTRA_WAPI_USER_CERTIFICATE_NAME;
    {class} property WAPI_AS_CERTIFICATE: JString read _GetWAPI_AS_CERTIFICATE;
    {class} property WAPI_USER_CERTIFICATE: JString read _GetWAPI_USER_CERTIFICATE;
  end;

  [JavaSignature('android/net/wifi/WifiEnterpriseConfig')]
  JWifiEnterpriseConfig = interface(JObject)
    ['{B822B902-C591-48D1-BEFF-56FC393A03A7}']
    function describeContents: Integer; cdecl;
    procedure enableTrustOnFirstUse(enable: Boolean); cdecl;
    function getAltSubjectMatch: JString; cdecl;
    function getAnonymousIdentity: JString; cdecl;
    function getCaCertificate: JX509Certificate; cdecl;
    function getCaCertificates: TJavaObjectArray<JX509Certificate>; cdecl;
    function getClientCertificate: JX509Certificate; cdecl;
    function getClientCertificateChain: TJavaObjectArray<JX509Certificate>; cdecl;
    function getClientKeyPairAlias: JString; cdecl;
    function getClientPrivateKey: JPrivateKey; cdecl;
    function getDecoratedIdentityPrefix: JString; cdecl;
    function getDomainSuffixMatch: JString; cdecl;
    function getEapMethod: Integer; cdecl;
    function getIdentity: JString; cdecl;
    function getPassword: JString; cdecl;
    function getPhase2Method: Integer; cdecl;
    function getPlmn: JString; cdecl;
    function getRealm: JString; cdecl;
    function getSubjectMatch: JString; cdecl;//Deprecated
    function hasCaCertificate: Boolean; cdecl;
    function isAuthenticationSimBased: Boolean; cdecl;
    function isEapMethodServerCertUsed: Boolean; cdecl;
    function isServerCertValidationEnabled: Boolean; cdecl;
    function isTrustOnFirstUseEnabled: Boolean; cdecl;
    procedure setAltSubjectMatch(altSubjectMatch: JString); cdecl;
    procedure setAnonymousIdentity(anonymousIdentity: JString); cdecl;
    procedure setCaCertificate(cert: JX509Certificate); cdecl;
    procedure setCaCertificates(certs: TJavaObjectArray<JX509Certificate>); cdecl;
    procedure setClientKeyEntry(privateKey: JPrivateKey; clientCertificate: JX509Certificate); cdecl;
    procedure setClientKeyEntryWithCertificateChain(privateKey: JPrivateKey; clientCertificateChain: TJavaObjectArray<JX509Certificate>); cdecl;
    procedure setClientKeyPairAlias(alias: JString); cdecl;
    procedure setDecoratedIdentityPrefix(decoratedIdentityPrefix: JString); cdecl;
    procedure setDomainSuffixMatch(domain: JString); cdecl;
    procedure setEapMethod(eapMethod: Integer); cdecl;
    procedure setIdentity(identity: JString); cdecl;
    procedure setPassword(password: JString); cdecl;
    procedure setPhase2Method(phase2Method: Integer); cdecl;
    procedure setPlmn(plmn: JString); cdecl;
    procedure setRealm(realm: JString); cdecl;
    procedure setSubjectMatch(subjectMatch: JString); cdecl;//Deprecated
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiEnterpriseConfig = class(TJavaGenericImport<JWifiEnterpriseConfigClass, JWifiEnterpriseConfig>) end;

  JWifiEnterpriseConfig_EapClass = interface(JObjectClass)
    ['{CFCC6A75-76D5-4094-902D-8B73B1E3888E}']
    {class} function _GetAKA: Integer; cdecl;
    {class} function _GetAKA_PRIME: Integer; cdecl;
    {class} function _GetNONE: Integer; cdecl;
    {class} function _GetPEAP: Integer; cdecl;
    {class} function _GetPWD: Integer; cdecl;
    {class} function _GetSIM: Integer; cdecl;
    {class} function _GetTLS: Integer; cdecl;
    {class} function _GetTTLS: Integer; cdecl;
    {class} function _GetUNAUTH_TLS: Integer; cdecl;
    {class} function _GetWAPI_CERT: Integer; cdecl;
    {class} property AKA: Integer read _GetAKA;
    {class} property AKA_PRIME: Integer read _GetAKA_PRIME;
    {class} property NONE: Integer read _GetNONE;
    {class} property PEAP: Integer read _GetPEAP;
    {class} property PWD: Integer read _GetPWD;
    {class} property SIM: Integer read _GetSIM;
    {class} property TLS: Integer read _GetTLS;
    {class} property TTLS: Integer read _GetTTLS;
    {class} property UNAUTH_TLS: Integer read _GetUNAUTH_TLS;
    {class} property WAPI_CERT: Integer read _GetWAPI_CERT;
  end;

  [JavaSignature('android/net/wifi/WifiEnterpriseConfig$Eap')]
  JWifiEnterpriseConfig_Eap = interface(JObject)
    ['{4880D3DC-10FE-4740-A2DE-BB9EC21EED0B}']
  end;
  TJWifiEnterpriseConfig_Eap = class(TJavaGenericImport<JWifiEnterpriseConfig_EapClass, JWifiEnterpriseConfig_Eap>) end;

  JWifiEnterpriseConfig_Phase2Class = interface(JObjectClass)
    ['{D9150CF8-D11C-4D58-94DF-56BA5805D44E}']
    {class} function _GetAKA: Integer; cdecl;
    {class} function _GetAKA_PRIME: Integer; cdecl;
    {class} function _GetGTC: Integer; cdecl;
    {class} function _GetMSCHAP: Integer; cdecl;
    {class} function _GetMSCHAPV2: Integer; cdecl;
    {class} function _GetNONE: Integer; cdecl;
    {class} function _GetPAP: Integer; cdecl;
    {class} function _GetSIM: Integer; cdecl;
    {class} property AKA: Integer read _GetAKA;
    {class} property AKA_PRIME: Integer read _GetAKA_PRIME;
    {class} property GTC: Integer read _GetGTC;
    {class} property MSCHAP: Integer read _GetMSCHAP;
    {class} property MSCHAPV2: Integer read _GetMSCHAPV2;
    {class} property NONE: Integer read _GetNONE;
    {class} property PAP: Integer read _GetPAP;
    {class} property SIM: Integer read _GetSIM;
  end;

  [JavaSignature('android/net/wifi/WifiEnterpriseConfig$Phase2')]
  JWifiEnterpriseConfig_Phase2 = interface(JObject)
    ['{47DF010A-28A3-4F03-B88E-FD4F1BCD32EC}']
  end;
  TJWifiEnterpriseConfig_Phase2 = class(TJavaGenericImport<JWifiEnterpriseConfig_Phase2Class, JWifiEnterpriseConfig_Phase2>) end;

  JWifiInfoClass = interface(JObjectClass)
    ['{8CC8F57E-4945-400E-9F19-626BDDCB496A}']
    {class} function _GetFREQUENCY_UNITS: JString; cdecl;
    {class} function _GetLINK_SPEED_UNITS: JString; cdecl;
    {class} function _GetLINK_SPEED_UNKNOWN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_DPP: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_OPEN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_OSEN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_OWE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_PASSPOINT_R1_R2: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_PASSPOINT_R3: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_PSK: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_SAE: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WAPI_CERT: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WAPI_PSK: Integer; cdecl;
    {class} function _GetSECURITY_TYPE_WEP: Integer; cdecl;
    {class} function getDetailedStateOf(suppState: JSupplicantState): JNetworkInfo_DetailedState; cdecl;
    {class} property FREQUENCY_UNITS: JString read _GetFREQUENCY_UNITS;
    {class} property LINK_SPEED_UNITS: JString read _GetLINK_SPEED_UNITS;
    {class} property LINK_SPEED_UNKNOWN: Integer read _GetLINK_SPEED_UNKNOWN;
    {class} property SECURITY_TYPE_DPP: Integer read _GetSECURITY_TYPE_DPP;
    {class} property SECURITY_TYPE_EAP: Integer read _GetSECURITY_TYPE_EAP;
    {class} property SECURITY_TYPE_EAP_WPA3_ENTERPRISE: Integer read _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE;
    {class} property SECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT: Integer read _GetSECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT;
    {class} property SECURITY_TYPE_OPEN: Integer read _GetSECURITY_TYPE_OPEN;
    {class} property SECURITY_TYPE_OSEN: Integer read _GetSECURITY_TYPE_OSEN;
    {class} property SECURITY_TYPE_OWE: Integer read _GetSECURITY_TYPE_OWE;
    {class} property SECURITY_TYPE_PASSPOINT_R1_R2: Integer read _GetSECURITY_TYPE_PASSPOINT_R1_R2;
    {class} property SECURITY_TYPE_PASSPOINT_R3: Integer read _GetSECURITY_TYPE_PASSPOINT_R3;
    {class} property SECURITY_TYPE_PSK: Integer read _GetSECURITY_TYPE_PSK;
    {class} property SECURITY_TYPE_SAE: Integer read _GetSECURITY_TYPE_SAE;
    {class} property SECURITY_TYPE_UNKNOWN: Integer read _GetSECURITY_TYPE_UNKNOWN;
    {class} property SECURITY_TYPE_WAPI_CERT: Integer read _GetSECURITY_TYPE_WAPI_CERT;
    {class} property SECURITY_TYPE_WAPI_PSK: Integer read _GetSECURITY_TYPE_WAPI_PSK;
    {class} property SECURITY_TYPE_WEP: Integer read _GetSECURITY_TYPE_WEP;
  end;

  [JavaSignature('android/net/wifi/WifiInfo')]
  JWifiInfo = interface(JObject)
    ['{D1AC40A2-AD68-4A81-ABD0-A0476CA41C22}']
    function equals(that: JObject): Boolean; cdecl;
    function getAffiliatedMloLinks: JList; cdecl;
    function getApMldMacAddress: JMacAddress; cdecl;
    function getApMloLinkId: Integer; cdecl;
    function getApplicableRedactions: Int64; cdecl;
    function getBSSID: JString; cdecl;
    function getCurrentSecurityType: Integer; cdecl;
    function getFrequency: Integer; cdecl;
    function getHiddenSSID: Boolean; cdecl;
    function getInformationElements: JList; cdecl;
    function getIpAddress: Integer; cdecl;//Deprecated
    function getLinkSpeed: Integer; cdecl;
    function getMacAddress: JString; cdecl;
    function getMaxSupportedRxLinkSpeedMbps: Integer; cdecl;
    function getMaxSupportedTxLinkSpeedMbps: Integer; cdecl;
    function getNetworkId: Integer; cdecl;
    function getPasspointFqdn: JString; cdecl;
    function getPasspointProviderFriendlyName: JString; cdecl;
    function getRssi: Integer; cdecl;
    function getRxLinkSpeedMbps: Integer; cdecl;
    function getSSID: JString; cdecl;
    function getSubscriptionId: Integer; cdecl;
    function getSupplicantState: JSupplicantState; cdecl;
    function getTxLinkSpeedMbps: Integer; cdecl;
    function getWifiStandard: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isRestricted: Boolean; cdecl;
    function makeCopy(redactions: Int64): JWifiInfo; cdecl;
    function toString: JString; cdecl;
  end;
  TJWifiInfo = class(TJavaGenericImport<JWifiInfoClass, JWifiInfo>) end;

  JWifiInfo_BuilderClass = interface(JObjectClass)
    ['{CEDCFBA4-2FAB-4B83-953D-9B93ED659BBD}']
    {class} function init: JWifiInfo_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiInfo$Builder')]
  JWifiInfo_Builder = interface(JObject)
    ['{1525F549-5EDC-4395-A8DB-A26BC9544239}']
    function build: JWifiInfo; cdecl;
    function setBssid(bssid: JString): JWifiInfo_Builder; cdecl;
    function setCurrentSecurityType(securityType: Integer): JWifiInfo_Builder; cdecl;
    function setNetworkId(networkId: Integer): JWifiInfo_Builder; cdecl;
    function setRssi(rssi: Integer): JWifiInfo_Builder; cdecl;
    function setSsid(ssid: TJavaArray<Byte>): JWifiInfo_Builder; cdecl;
  end;
  TJWifiInfo_Builder = class(TJavaGenericImport<JWifiInfo_BuilderClass, JWifiInfo_Builder>) end;

  JWifiManagerClass = interface(JObjectClass)
    ['{A3559F69-A273-4480-972E-48D2381B1F93}']
    {class} function _GetACTION_PICK_WIFI_NETWORK: JString; cdecl;
    {class} function _GetACTION_REMOVE_SUGGESTION_DISCONNECT: Integer; cdecl;
    {class} function _GetACTION_REMOVE_SUGGESTION_LINGER: Integer; cdecl;
    {class} function _GetACTION_REQUEST_SCAN_ALWAYS_AVAILABLE: JString; cdecl;
    {class} function _GetACTION_WIFI_NETWORK_SUGGESTION_POST_CONNECTION: JString; cdecl;
    {class} function _GetACTION_WIFI_SCAN_AVAILABILITY_CHANGED: JString; cdecl;
    {class} function _GetERROR_AUTHENTICATING: Integer; cdecl;
    {class} function _GetEXTRA_BSSID: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_INFO: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_SUGGESTION: JString; cdecl;
    {class} function _GetEXTRA_NEW_RSSI: JString; cdecl;
    {class} function _GetEXTRA_NEW_STATE: JString; cdecl;
    {class} function _GetEXTRA_PREVIOUS_WIFI_STATE: JString; cdecl;
    {class} function _GetEXTRA_RESULTS_UPDATED: JString; cdecl;
    {class} function _GetEXTRA_SCAN_AVAILABLE: JString; cdecl;
    {class} function _GetEXTRA_SUPPLICANT_CONNECTED: JString; cdecl;
    {class} function _GetEXTRA_SUPPLICANT_ERROR: JString; cdecl;
    {class} function _GetEXTRA_WIFI_INFO: JString; cdecl;
    {class} function _GetEXTRA_WIFI_STATE: JString; cdecl;
    {class} function _GetNETWORK_IDS_CHANGED_ACTION: JString; cdecl;
    {class} function _GetNETWORK_STATE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetRSSI_CHANGED_ACTION: JString; cdecl;
    {class} function _GetSCAN_RESULTS_AVAILABLE_ACTION: JString; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_DUPLICATE: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_EXCEEDS_MAX_PER_APP: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_INVALID: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_APP_DISALLOWED: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_INTERNAL: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_REMOVE_INVALID: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_RESTRICTED_BY_ADMIN: Integer; cdecl;
    {class} function _GetSTATUS_NETWORK_SUGGESTIONS_SUCCESS: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_APPROVAL_APPROVED_BY_CARRIER_PRIVILEGE: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_APPROVAL_APPROVED_BY_USER: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_APPROVAL_PENDING: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_APPROVAL_REJECTED_BY_USER: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_APPROVAL_UNKNOWN: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_ASSOCIATION: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_AUTHENTICATION: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_IP_PROVISIONING: Integer; cdecl;
    {class} function _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_UNKNOWN: Integer; cdecl;
    {class} function _GetSUPPLICANT_CONNECTION_CHANGE_ACTION: JString; cdecl;
    {class} function _GetSUPPLICANT_STATE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetUNKNOWN_SSID: JString; cdecl;
    {class} function _GetWIFI_INTERFACE_TYPE_AP: Integer; cdecl;
    {class} function _GetWIFI_INTERFACE_TYPE_AWARE: Integer; cdecl;
    {class} function _GetWIFI_INTERFACE_TYPE_DIRECT: Integer; cdecl;
    {class} function _GetWIFI_INTERFACE_TYPE_STA: Integer; cdecl;
    {class} function _GetWIFI_MODE_FULL: Integer; cdecl;
    {class} function _GetWIFI_MODE_FULL_HIGH_PERF: Integer; cdecl;
    {class} function _GetWIFI_MODE_FULL_LOW_LATENCY: Integer; cdecl;
    {class} function _GetWIFI_MODE_SCAN_ONLY: Integer; cdecl;
    {class} function _GetWIFI_MULTI_INTERNET_MODE_DBS_AP: Integer; cdecl;
    {class} function _GetWIFI_MULTI_INTERNET_MODE_DISABLED: Integer; cdecl;
    {class} function _GetWIFI_MULTI_INTERNET_MODE_MULTI_AP: Integer; cdecl;
    {class} function _GetWIFI_STATE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetWIFI_STATE_DISABLED: Integer; cdecl;
    {class} function _GetWIFI_STATE_DISABLING: Integer; cdecl;
    {class} function _GetWIFI_STATE_ENABLED: Integer; cdecl;
    {class} function _GetWIFI_STATE_ENABLING: Integer; cdecl;
    {class} function _GetWIFI_STATE_UNKNOWN: Integer; cdecl;
    {class} function _GetWPS_AUTH_FAILURE: Integer; cdecl;
    {class} function _GetWPS_OVERLAP_ERROR: Integer; cdecl;
    {class} function _GetWPS_TIMED_OUT: Integer; cdecl;
    {class} function _GetWPS_TKIP_ONLY_PROHIBITED: Integer; cdecl;
    {class} function _GetWPS_WEP_PROHIBITED: Integer; cdecl;
    {class} function calculateSignalLevel(rssi: Integer; numLevels: Integer): Integer; cdecl; overload;//Deprecated
    {class} function compareSignalLevel(rssiA: Integer; rssiB: Integer): Integer; cdecl;
    {class} property ACTION_PICK_WIFI_NETWORK: JString read _GetACTION_PICK_WIFI_NETWORK;
    {class} property ACTION_REMOVE_SUGGESTION_DISCONNECT: Integer read _GetACTION_REMOVE_SUGGESTION_DISCONNECT;
    {class} property ACTION_REMOVE_SUGGESTION_LINGER: Integer read _GetACTION_REMOVE_SUGGESTION_LINGER;
    {class} property ACTION_REQUEST_SCAN_ALWAYS_AVAILABLE: JString read _GetACTION_REQUEST_SCAN_ALWAYS_AVAILABLE;
    {class} property ACTION_WIFI_NETWORK_SUGGESTION_POST_CONNECTION: JString read _GetACTION_WIFI_NETWORK_SUGGESTION_POST_CONNECTION;
    {class} property ACTION_WIFI_SCAN_AVAILABILITY_CHANGED: JString read _GetACTION_WIFI_SCAN_AVAILABILITY_CHANGED;
    {class} property ERROR_AUTHENTICATING: Integer read _GetERROR_AUTHENTICATING;
    {class} property EXTRA_BSSID: JString read _GetEXTRA_BSSID;
    {class} property EXTRA_NETWORK_INFO: JString read _GetEXTRA_NETWORK_INFO;
    {class} property EXTRA_NETWORK_SUGGESTION: JString read _GetEXTRA_NETWORK_SUGGESTION;
    {class} property EXTRA_NEW_RSSI: JString read _GetEXTRA_NEW_RSSI;
    {class} property EXTRA_NEW_STATE: JString read _GetEXTRA_NEW_STATE;
    {class} property EXTRA_PREVIOUS_WIFI_STATE: JString read _GetEXTRA_PREVIOUS_WIFI_STATE;
    {class} property EXTRA_RESULTS_UPDATED: JString read _GetEXTRA_RESULTS_UPDATED;
    {class} property EXTRA_SCAN_AVAILABLE: JString read _GetEXTRA_SCAN_AVAILABLE;
    {class} property EXTRA_SUPPLICANT_CONNECTED: JString read _GetEXTRA_SUPPLICANT_CONNECTED;
    {class} property EXTRA_SUPPLICANT_ERROR: JString read _GetEXTRA_SUPPLICANT_ERROR;
    {class} property EXTRA_WIFI_INFO: JString read _GetEXTRA_WIFI_INFO;
    {class} property EXTRA_WIFI_STATE: JString read _GetEXTRA_WIFI_STATE;
    {class} property NETWORK_IDS_CHANGED_ACTION: JString read _GetNETWORK_IDS_CHANGED_ACTION;
    {class} property NETWORK_STATE_CHANGED_ACTION: JString read _GetNETWORK_STATE_CHANGED_ACTION;
    {class} property RSSI_CHANGED_ACTION: JString read _GetRSSI_CHANGED_ACTION;
    {class} property SCAN_RESULTS_AVAILABLE_ACTION: JString read _GetSCAN_RESULTS_AVAILABLE_ACTION;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_DUPLICATE: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_DUPLICATE;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_EXCEEDS_MAX_PER_APP: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_EXCEEDS_MAX_PER_APP;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_INVALID: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_INVALID;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_NOT_ALLOWED: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_ADD_NOT_ALLOWED;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_APP_DISALLOWED: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_APP_DISALLOWED;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_INTERNAL: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_INTERNAL;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_REMOVE_INVALID: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_REMOVE_INVALID;
    {class} property STATUS_NETWORK_SUGGESTIONS_ERROR_RESTRICTED_BY_ADMIN: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_ERROR_RESTRICTED_BY_ADMIN;
    {class} property STATUS_NETWORK_SUGGESTIONS_SUCCESS: Integer read _GetSTATUS_NETWORK_SUGGESTIONS_SUCCESS;
    {class} property STATUS_SUGGESTION_APPROVAL_APPROVED_BY_CARRIER_PRIVILEGE: Integer read _GetSTATUS_SUGGESTION_APPROVAL_APPROVED_BY_CARRIER_PRIVILEGE;
    {class} property STATUS_SUGGESTION_APPROVAL_APPROVED_BY_USER: Integer read _GetSTATUS_SUGGESTION_APPROVAL_APPROVED_BY_USER;
    {class} property STATUS_SUGGESTION_APPROVAL_PENDING: Integer read _GetSTATUS_SUGGESTION_APPROVAL_PENDING;
    {class} property STATUS_SUGGESTION_APPROVAL_REJECTED_BY_USER: Integer read _GetSTATUS_SUGGESTION_APPROVAL_REJECTED_BY_USER;
    {class} property STATUS_SUGGESTION_APPROVAL_UNKNOWN: Integer read _GetSTATUS_SUGGESTION_APPROVAL_UNKNOWN;
    {class} property STATUS_SUGGESTION_CONNECTION_FAILURE_ASSOCIATION: Integer read _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_ASSOCIATION;
    {class} property STATUS_SUGGESTION_CONNECTION_FAILURE_AUTHENTICATION: Integer read _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_AUTHENTICATION;
    {class} property STATUS_SUGGESTION_CONNECTION_FAILURE_IP_PROVISIONING: Integer read _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_IP_PROVISIONING;
    {class} property STATUS_SUGGESTION_CONNECTION_FAILURE_UNKNOWN: Integer read _GetSTATUS_SUGGESTION_CONNECTION_FAILURE_UNKNOWN;
    {class} property SUPPLICANT_CONNECTION_CHANGE_ACTION: JString read _GetSUPPLICANT_CONNECTION_CHANGE_ACTION;
    {class} property SUPPLICANT_STATE_CHANGED_ACTION: JString read _GetSUPPLICANT_STATE_CHANGED_ACTION;
    {class} property UNKNOWN_SSID: JString read _GetUNKNOWN_SSID;
    {class} property WIFI_INTERFACE_TYPE_AP: Integer read _GetWIFI_INTERFACE_TYPE_AP;
    {class} property WIFI_INTERFACE_TYPE_AWARE: Integer read _GetWIFI_INTERFACE_TYPE_AWARE;
    {class} property WIFI_INTERFACE_TYPE_DIRECT: Integer read _GetWIFI_INTERFACE_TYPE_DIRECT;
    {class} property WIFI_INTERFACE_TYPE_STA: Integer read _GetWIFI_INTERFACE_TYPE_STA;
    {class} property WIFI_MODE_FULL: Integer read _GetWIFI_MODE_FULL;
    {class} property WIFI_MODE_FULL_HIGH_PERF: Integer read _GetWIFI_MODE_FULL_HIGH_PERF;
    {class} property WIFI_MODE_FULL_LOW_LATENCY: Integer read _GetWIFI_MODE_FULL_LOW_LATENCY;
    {class} property WIFI_MODE_SCAN_ONLY: Integer read _GetWIFI_MODE_SCAN_ONLY;
    {class} property WIFI_MULTI_INTERNET_MODE_DBS_AP: Integer read _GetWIFI_MULTI_INTERNET_MODE_DBS_AP;
    {class} property WIFI_MULTI_INTERNET_MODE_DISABLED: Integer read _GetWIFI_MULTI_INTERNET_MODE_DISABLED;
    {class} property WIFI_MULTI_INTERNET_MODE_MULTI_AP: Integer read _GetWIFI_MULTI_INTERNET_MODE_MULTI_AP;
    {class} property WIFI_STATE_CHANGED_ACTION: JString read _GetWIFI_STATE_CHANGED_ACTION;
    {class} property WIFI_STATE_DISABLED: Integer read _GetWIFI_STATE_DISABLED;
    {class} property WIFI_STATE_DISABLING: Integer read _GetWIFI_STATE_DISABLING;
    {class} property WIFI_STATE_ENABLED: Integer read _GetWIFI_STATE_ENABLED;
    {class} property WIFI_STATE_ENABLING: Integer read _GetWIFI_STATE_ENABLING;
    {class} property WIFI_STATE_UNKNOWN: Integer read _GetWIFI_STATE_UNKNOWN;
    {class} property WPS_AUTH_FAILURE: Integer read _GetWPS_AUTH_FAILURE;
    {class} property WPS_OVERLAP_ERROR: Integer read _GetWPS_OVERLAP_ERROR;
    {class} property WPS_TIMED_OUT: Integer read _GetWPS_TIMED_OUT;
    {class} property WPS_TKIP_ONLY_PROHIBITED: Integer read _GetWPS_TKIP_ONLY_PROHIBITED;
    {class} property WPS_WEP_PROHIBITED: Integer read _GetWPS_WEP_PROHIBITED;
  end;

  [JavaSignature('android/net/wifi/WifiManager')]
  JWifiManager = interface(JObject)
    ['{7411ED93-E0EC-4DBC-979A-5B895346DA34}']
    function addNetwork(config: JWifiConfiguration): Integer; cdecl;//Deprecated
    function addNetworkPrivileged(config: JWifiConfiguration): JWifiManager_AddNetworkResult; cdecl;
    function addNetworkSuggestions(networkSuggestions: JList): Integer; cdecl;
    procedure addOrUpdatePasspointConfiguration(config: JPasspointConfiguration); cdecl;
    procedure addSuggestionConnectionStatusListener(executor: JExecutor; listener: JWifiManager_SuggestionConnectionStatusListener); cdecl;
    procedure addSuggestionUserApprovalStatusListener(executor: JExecutor; listener: JWifiManager_SuggestionUserApprovalStatusListener); cdecl;
    procedure allowAutojoinGlobal(allowAutojoin: Boolean); cdecl;
    function calculateSignalLevel(rssi: Integer): Integer; cdecl; overload;
    procedure cancelWps(listener: JWifiManager_WpsCallback); cdecl;//Deprecated
    function createMulticastLock(tag: JString): JWifiManager_MulticastLock; cdecl;
    function createWifiLock(lockType: Integer; tag: JString): JWifiManager_WifiLock; cdecl; overload;
    function createWifiLock(tag: JString): JWifiManager_WifiLock; cdecl; overload;//Deprecated
    function disableNetwork(netId: Integer): Boolean; cdecl;//Deprecated
    function disconnect: Boolean; cdecl;//Deprecated
    function enableNetwork(netId: Integer; attemptConnect: Boolean): Boolean; cdecl;//Deprecated
    procedure flushPasspointAnqpCache; cdecl;
    function getCallerConfiguredNetworks: JList; cdecl;
    function getConfiguredNetworks: JList; cdecl;//Deprecated
    function getConnectionInfo: JWifiInfo; cdecl;//Deprecated
    function getDhcpInfo: JDhcpInfo; cdecl;//Deprecated
    function getMaxNumberOfNetworkSuggestionsPerApp: Integer; cdecl;
    function getMaxSignalLevel: Integer; cdecl;
    function getNetworkSuggestions: JList; cdecl;
    function getPasspointConfigurations: JList; cdecl;//Deprecated
    function getScanResults: JList; cdecl;
    function getStaConcurrencyForMultiInternetMode: Integer; cdecl;
    function getWifiState: Integer; cdecl;
    function is24GHzBandSupported: Boolean; cdecl;
    function is5GHzBandSupported: Boolean; cdecl;
    function is60GHzBandSupported: Boolean; cdecl;
    function is6GHzBandSupported: Boolean; cdecl;
    function isAutoWakeupEnabled: Boolean; cdecl;
    function isBridgedApConcurrencySupported: Boolean; cdecl;
    function isCarrierNetworkOffloadEnabled(subscriptionId: Integer; merged: Boolean): Boolean; cdecl;
    function isDecoratedIdentitySupported: Boolean; cdecl;
    function isDeviceToApRttSupported: Boolean; cdecl;//Deprecated
    function isEasyConnectDppAkmSupported: Boolean; cdecl;
    function isEasyConnectEnrolleeResponderModeSupported: Boolean; cdecl;
    function isEasyConnectSupported: Boolean; cdecl;
    function isEnhancedOpenSupported: Boolean; cdecl;
    function isEnhancedPowerReportingSupported: Boolean; cdecl;
    function isMakeBeforeBreakWifiSwitchingSupported: Boolean; cdecl;
    function isP2pSupported: Boolean; cdecl;
    function isPasspointTermsAndConditionsSupported: Boolean; cdecl;
    function isPreferredNetworkOffloadSupported: Boolean; cdecl;
    function isScanAlwaysAvailable: Boolean; cdecl;//Deprecated
    function isScanThrottleEnabled: Boolean; cdecl;
    function isStaApConcurrencySupported: Boolean; cdecl;
    function isStaBridgedApConcurrencySupported: Boolean; cdecl;
    function isStaConcurrencyForLocalOnlyConnectionsSupported: Boolean; cdecl;
    function isStaConcurrencyForMultiInternetSupported: Boolean; cdecl;
    function isTdlsSupported: Boolean; cdecl;
    function isTrustOnFirstUseSupported: Boolean; cdecl;
    function isWapiSupported: Boolean; cdecl;
    function isWifiDisplayR2Supported: Boolean; cdecl;
    function isWifiEnabled: Boolean; cdecl;
    function isWifiPasspointEnabled: Boolean; cdecl;
    function isWifiStandardSupported(standard: Integer): Boolean; cdecl;
    function isWpa3SaeH2eSupported: Boolean; cdecl;
    function isWpa3SaePublicKeySupported: Boolean; cdecl;
    function isWpa3SaeSupported: Boolean; cdecl;
    function isWpa3SuiteBSupported: Boolean; cdecl;
    function pingSupplicant: Boolean; cdecl;//Deprecated
    procedure queryAutojoinGlobal(executor: JExecutor; resultsCallback: JConsumer); cdecl;
    function reassociate: Boolean; cdecl;//Deprecated
    function reconnect: Boolean; cdecl;//Deprecated
    procedure registerScanResultsCallback(executor: JExecutor; callback: JWifiManager_ScanResultsCallback); cdecl;
    procedure registerSubsystemRestartTrackingCallback(executor: JExecutor; callback: JWifiManager_SubsystemRestartTrackingCallback); cdecl;
    function removeNetwork(netId: Integer): Boolean; cdecl;//Deprecated
    function removeNetworkSuggestions(networkSuggestions: JList): Integer; cdecl; overload;
    function removeNetworkSuggestions(networkSuggestions: JList; action: Integer): Integer; cdecl; overload;
    function removeNonCallerConfiguredNetworks: Boolean; cdecl;
    procedure removePasspointConfiguration(fqdn: JString); cdecl;//Deprecated
    procedure removeSuggestionConnectionStatusListener(listener: JWifiManager_SuggestionConnectionStatusListener); cdecl;
    procedure removeSuggestionUserApprovalStatusListener(listener: JWifiManager_SuggestionUserApprovalStatusListener); cdecl;
    procedure reportCreateInterfaceImpact(interfaceType: Integer; requireNewInterface: Boolean; executor: JExecutor; resultCallback: JBiConsumer); cdecl;
    function saveConfiguration: Boolean; cdecl;//Deprecated
    procedure setTdlsEnabled(remoteIPAddress: JInetAddress; enable: Boolean); cdecl;
    procedure setTdlsEnabledWithMacAddress(remoteMacAddress: JString; enable: Boolean); cdecl;
    function setWifiEnabled(enabled: Boolean): Boolean; cdecl;//Deprecated
    procedure startLocalOnlyHotspot(callback: JWifiManager_LocalOnlyHotspotCallback; handler: JHandler); cdecl;
    function startScan: Boolean; cdecl;//Deprecated
    procedure startWps(config: JWpsInfo; listener: JWifiManager_WpsCallback); cdecl;//Deprecated
    procedure unregisterScanResultsCallback(callback: JWifiManager_ScanResultsCallback); cdecl;
    procedure unregisterSubsystemRestartTrackingCallback(callback: JWifiManager_SubsystemRestartTrackingCallback); cdecl;
    function updateNetwork(config: JWifiConfiguration): Integer; cdecl;//Deprecated
  end;
  TJWifiManager = class(TJavaGenericImport<JWifiManagerClass, JWifiManager>) end;

  JWifiManager_AddNetworkResultClass = interface(JObjectClass)
    ['{89DD7BBF-445F-4105-818A-1B03431A535E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSTATUS_ADD_PASSPOINT_FAILURE: Integer; cdecl;
    {class} function _GetSTATUS_ADD_WIFI_CONFIG_FAILURE: Integer; cdecl;
    {class} function _GetSTATUS_FAILURE_UNKNOWN: Integer; cdecl;
    {class} function _GetSTATUS_FAILURE_UPDATE_NETWORK_KEYS: Integer; cdecl;
    {class} function _GetSTATUS_INVALID_CONFIGURATION: Integer; cdecl;
    {class} function _GetSTATUS_INVALID_CONFIGURATION_ENTERPRISE: Integer; cdecl;
    {class} function _GetSTATUS_NO_PERMISSION: Integer; cdecl;
    {class} function _GetSTATUS_NO_PERMISSION_MODIFY_CONFIG: Integer; cdecl;
    {class} function _GetSTATUS_NO_PERMISSION_MODIFY_MAC_RANDOMIZATION: Integer; cdecl;
    {class} function _GetSTATUS_NO_PERMISSION_MODIFY_PROXY_SETTING: Integer; cdecl;
    {class} function _GetSTATUS_SUCCESS: Integer; cdecl;
    {class} function init(statusCode: Integer; networkId: Integer): JWifiManager_AddNetworkResult; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property STATUS_ADD_PASSPOINT_FAILURE: Integer read _GetSTATUS_ADD_PASSPOINT_FAILURE;
    {class} property STATUS_ADD_WIFI_CONFIG_FAILURE: Integer read _GetSTATUS_ADD_WIFI_CONFIG_FAILURE;
    {class} property STATUS_FAILURE_UNKNOWN: Integer read _GetSTATUS_FAILURE_UNKNOWN;
    {class} property STATUS_FAILURE_UPDATE_NETWORK_KEYS: Integer read _GetSTATUS_FAILURE_UPDATE_NETWORK_KEYS;
    {class} property STATUS_INVALID_CONFIGURATION: Integer read _GetSTATUS_INVALID_CONFIGURATION;
    {class} property STATUS_INVALID_CONFIGURATION_ENTERPRISE: Integer read _GetSTATUS_INVALID_CONFIGURATION_ENTERPRISE;
    {class} property STATUS_NO_PERMISSION: Integer read _GetSTATUS_NO_PERMISSION;
    {class} property STATUS_NO_PERMISSION_MODIFY_CONFIG: Integer read _GetSTATUS_NO_PERMISSION_MODIFY_CONFIG;
    {class} property STATUS_NO_PERMISSION_MODIFY_MAC_RANDOMIZATION: Integer read _GetSTATUS_NO_PERMISSION_MODIFY_MAC_RANDOMIZATION;
    {class} property STATUS_NO_PERMISSION_MODIFY_PROXY_SETTING: Integer read _GetSTATUS_NO_PERMISSION_MODIFY_PROXY_SETTING;
    {class} property STATUS_SUCCESS: Integer read _GetSTATUS_SUCCESS;
  end;

  [JavaSignature('android/net/wifi/WifiManager$AddNetworkResult')]
  JWifiManager_AddNetworkResult = interface(JObject)
    ['{63F124CB-DC3D-4999-B71D-BC9A60E15DA5}']
    function _GetnetworkId: Integer; cdecl;
    function _GetstatusCode: Integer; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property networkId: Integer read _GetnetworkId;
    property statusCode: Integer read _GetstatusCode;
  end;
  TJWifiManager_AddNetworkResult = class(TJavaGenericImport<JWifiManager_AddNetworkResultClass, JWifiManager_AddNetworkResult>) end;

  JWifiManager_InterfaceCreationImpactClass = interface(JObjectClass)
    ['{85F565B1-8404-4A3A-BE36-BAACA9E5B64B}']
    {class} function init(interfaceType: Integer; packages: JSet): JWifiManager_InterfaceCreationImpact; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiManager$InterfaceCreationImpact')]
  JWifiManager_InterfaceCreationImpact = interface(JObject)
    ['{0EA38E60-F0D6-4EDA-B8A4-F4AB649DB0A2}']
    function equals(that: JObject): Boolean; cdecl;
    function getInterfaceType: Integer; cdecl;
    function getPackages: JSet; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJWifiManager_InterfaceCreationImpact = class(TJavaGenericImport<JWifiManager_InterfaceCreationImpactClass, JWifiManager_InterfaceCreationImpact>) end;

  JWifiManager_LocalOnlyHotspotCallbackClass = interface(JObjectClass)
    ['{B9F9F12C-0352-4F48-9E11-2B99668EFF84}']
    {class} function _GetERROR_GENERIC: Integer; cdecl;
    {class} function _GetERROR_INCOMPATIBLE_MODE: Integer; cdecl;
    {class} function _GetERROR_NO_CHANNEL: Integer; cdecl;
    {class} function _GetERROR_TETHERING_DISALLOWED: Integer; cdecl;
    {class} function init: JWifiManager_LocalOnlyHotspotCallback; cdecl;
    {class} property ERROR_GENERIC: Integer read _GetERROR_GENERIC;
    {class} property ERROR_INCOMPATIBLE_MODE: Integer read _GetERROR_INCOMPATIBLE_MODE;
    {class} property ERROR_NO_CHANNEL: Integer read _GetERROR_NO_CHANNEL;
    {class} property ERROR_TETHERING_DISALLOWED: Integer read _GetERROR_TETHERING_DISALLOWED;
  end;

  [JavaSignature('android/net/wifi/WifiManager$LocalOnlyHotspotCallback')]
  JWifiManager_LocalOnlyHotspotCallback = interface(JObject)
    ['{3CA9BFFF-A1D8-4457-8A50-444A13D894C0}']
    procedure onFailed(reason: Integer); cdecl;
    procedure onStarted(reservation: JWifiManager_LocalOnlyHotspotReservation); cdecl;
    procedure onStopped; cdecl;
  end;
  TJWifiManager_LocalOnlyHotspotCallback = class(TJavaGenericImport<JWifiManager_LocalOnlyHotspotCallbackClass, JWifiManager_LocalOnlyHotspotCallback>) end;

  JWifiManager_LocalOnlyHotspotReservationClass = interface(JObjectClass)
    ['{EBEB8F7C-BB1E-43FA-99BA-BAC40DA41C83}']
  end;

  [JavaSignature('android/net/wifi/WifiManager$LocalOnlyHotspotReservation')]
  JWifiManager_LocalOnlyHotspotReservation = interface(JObject)
    ['{BA05A886-AA25-4263-928A-671C3AB3333E}']
    procedure close; cdecl;
    function getSoftApConfiguration: JSoftApConfiguration; cdecl;
    function getWifiConfiguration: JWifiConfiguration; cdecl;//Deprecated
  end;
  TJWifiManager_LocalOnlyHotspotReservation = class(TJavaGenericImport<JWifiManager_LocalOnlyHotspotReservationClass, JWifiManager_LocalOnlyHotspotReservation>) end;

  JWifiManager_MulticastLockClass = interface(JObjectClass)
    ['{5A3A1B1D-84FB-4E49-8D92-47A2881314CC}']
  end;

  [JavaSignature('android/net/wifi/WifiManager$MulticastLock')]
  JWifiManager_MulticastLock = interface(JObject)
    ['{682F61D0-82D8-484F-8EA8-72BDF4DD7FA9}']
    procedure acquire; cdecl;
    function isHeld: Boolean; cdecl;
    procedure release; cdecl;
    procedure setReferenceCounted(refCounted: Boolean); cdecl;
    function toString: JString; cdecl;
  end;
  TJWifiManager_MulticastLock = class(TJavaGenericImport<JWifiManager_MulticastLockClass, JWifiManager_MulticastLock>) end;

  JWifiManager_ScanResultsCallbackClass = interface(JObjectClass)
    ['{7175F647-2272-4660-A04B-E6C8CF137236}']
    {class} function init: JWifiManager_ScanResultsCallback; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiManager$ScanResultsCallback')]
  JWifiManager_ScanResultsCallback = interface(JObject)
    ['{9C0C79A2-AF24-442F-A3CE-0E676C5CB3ED}']
    procedure onScanResultsAvailable; cdecl;
  end;
  TJWifiManager_ScanResultsCallback = class(TJavaGenericImport<JWifiManager_ScanResultsCallbackClass, JWifiManager_ScanResultsCallback>) end;

  JWifiManager_SubsystemRestartTrackingCallbackClass = interface(JObjectClass)
    ['{351C4107-4701-4515-8BB6-AF9CF2D5E878}']
    {class} function init: JWifiManager_SubsystemRestartTrackingCallback; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiManager$SubsystemRestartTrackingCallback')]
  JWifiManager_SubsystemRestartTrackingCallback = interface(JObject)
    ['{6D8893EA-21B1-4866-B83D-06C4D7B52ED9}']
    procedure onSubsystemRestarted; cdecl;
    procedure onSubsystemRestarting; cdecl;
  end;
  TJWifiManager_SubsystemRestartTrackingCallback = class(TJavaGenericImport<JWifiManager_SubsystemRestartTrackingCallbackClass, JWifiManager_SubsystemRestartTrackingCallback>) end;

  JWifiManager_SuggestionConnectionStatusListenerClass = interface(IJavaClass)
    ['{3E3A4855-5654-4B42-B3AD-1DC570082B05}']
  end;

  [JavaSignature('android/net/wifi/WifiManager$SuggestionConnectionStatusListener')]
  JWifiManager_SuggestionConnectionStatusListener = interface(IJavaInstance)
    ['{D934C401-129F-45F2-8D50-1CEE089EB8E4}']
    procedure onConnectionStatus(wifiNetworkSuggestion: JWifiNetworkSuggestion; failureReason: Integer); cdecl;
  end;
  TJWifiManager_SuggestionConnectionStatusListener = class(TJavaGenericImport<JWifiManager_SuggestionConnectionStatusListenerClass, JWifiManager_SuggestionConnectionStatusListener>) end;

  JWifiManager_SuggestionUserApprovalStatusListenerClass = interface(IJavaClass)
    ['{D39D3DC6-C30F-4B1B-896E-0D3A95F159B9}']
  end;

  [JavaSignature('android/net/wifi/WifiManager$SuggestionUserApprovalStatusListener')]
  JWifiManager_SuggestionUserApprovalStatusListener = interface(IJavaInstance)
    ['{1942B882-B71B-42E4-97F3-968A0BAA4D77}']
    procedure onUserApprovalStatusChange(status: Integer); cdecl;
  end;
  TJWifiManager_SuggestionUserApprovalStatusListener = class(TJavaGenericImport<JWifiManager_SuggestionUserApprovalStatusListenerClass, JWifiManager_SuggestionUserApprovalStatusListener>) end;

  JWifiManager_WifiLockClass = interface(JObjectClass)
    ['{AE9D4E26-7200-4F0B-A2B7-C0DFA79A4340}']
  end;

  [JavaSignature('android/net/wifi/WifiManager$WifiLock')]
  JWifiManager_WifiLock = interface(JObject)
    ['{43789DF1-6903-4338-A5A6-A6C101944654}']
    procedure acquire; cdecl;
    function isHeld: Boolean; cdecl;
    procedure release; cdecl;
    procedure setReferenceCounted(refCounted: Boolean); cdecl;
    procedure setWorkSource(ws: JWorkSource); cdecl;
    function toString: JString; cdecl;
  end;
  TJWifiManager_WifiLock = class(TJavaGenericImport<JWifiManager_WifiLockClass, JWifiManager_WifiLock>) end;

  JWifiManager_WpsCallbackClass = interface(JObjectClass)
    ['{716B5FDE-D3A4-424E-BDC4-D94C40950BEA}']
    {class} function init: JWifiManager_WpsCallback; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiManager$WpsCallback')]
  JWifiManager_WpsCallback = interface(JObject)
    ['{977FA6F7-2F9D-4BAF-90C3-38784542235B}']
    procedure onFailed(reason: Integer); cdecl;//Deprecated
    procedure onStarted(pin: JString); cdecl;//Deprecated
    procedure onSucceeded; cdecl;//Deprecated
  end;
  TJWifiManager_WpsCallback = class(TJavaGenericImport<JWifiManager_WpsCallbackClass, JWifiManager_WpsCallback>) end;

  JWifiNetworkSpecifierClass = interface(JNetworkSpecifierClass)
    ['{5ABD490B-DE98-44D9-B514-58E0967950DA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/WifiNetworkSpecifier')]
  JWifiNetworkSpecifier = interface(JNetworkSpecifier)
    ['{70B73F1B-1EA2-40D9-9FFB-9131ED4E9C6A}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getBand: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiNetworkSpecifier = class(TJavaGenericImport<JWifiNetworkSpecifierClass, JWifiNetworkSpecifier>) end;

  JWifiNetworkSpecifier_BuilderClass = interface(JObjectClass)
    ['{C40D50C1-1BC0-4956-BB23-FEDEBE6B2621}']
    {class} function init: JWifiNetworkSpecifier_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiNetworkSpecifier$Builder')]
  JWifiNetworkSpecifier_Builder = interface(JObject)
    ['{36947CB4-1F66-41C8-8CFD-C8AA0205E7AF}']
    function build: JWifiNetworkSpecifier; cdecl;
    function setBand(band: Integer): JWifiNetworkSpecifier_Builder; cdecl;
    function setBssid(bssid: JMacAddress): JWifiNetworkSpecifier_Builder; cdecl;
    function setBssidPattern(baseAddress: JMacAddress; mask: JMacAddress): JWifiNetworkSpecifier_Builder; cdecl;
    function setIsEnhancedOpen(isEnhancedOpen: Boolean): JWifiNetworkSpecifier_Builder; cdecl;
    function setIsHiddenSsid(isHiddenSsid: Boolean): JWifiNetworkSpecifier_Builder; cdecl;
    function setSsid(ssid: JString): JWifiNetworkSpecifier_Builder; cdecl;
    function setSsidPattern(ssidPattern: JPatternMatcher): JWifiNetworkSpecifier_Builder; cdecl;
    function setWpa2EnterpriseConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSpecifier_Builder; cdecl;
    function setWpa2Passphrase(passphrase: JString): JWifiNetworkSpecifier_Builder; cdecl;
    function setWpa3Enterprise192BitModeConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSpecifier_Builder; cdecl;
    function setWpa3EnterpriseConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSpecifier_Builder; cdecl;//Deprecated
    function setWpa3EnterpriseStandardModeConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSpecifier_Builder; cdecl;
    function setWpa3Passphrase(passphrase: JString): JWifiNetworkSpecifier_Builder; cdecl;
  end;
  TJWifiNetworkSpecifier_Builder = class(TJavaGenericImport<JWifiNetworkSpecifier_BuilderClass, JWifiNetworkSpecifier_Builder>) end;

  JWifiNetworkSuggestionClass = interface(JObjectClass)
    ['{FBF6AF16-507C-42BA-B4DE-1C77EBCAFA2D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRANDOMIZATION_NON_PERSISTENT: Integer; cdecl;
    {class} function _GetRANDOMIZATION_PERSISTENT: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RANDOMIZATION_NON_PERSISTENT: Integer read _GetRANDOMIZATION_NON_PERSISTENT;
    {class} property RANDOMIZATION_PERSISTENT: Integer read _GetRANDOMIZATION_PERSISTENT;
  end;

  [JavaSignature('android/net/wifi/WifiNetworkSuggestion')]
  JWifiNetworkSuggestion = interface(JObject)
    ['{E85A37EE-30E7-45AF-802A-F5B59FF07B89}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getBssid: JMacAddress; cdecl;
    function getEnterpriseConfig: JWifiEnterpriseConfig; cdecl;
    function getMacRandomizationSetting: Integer; cdecl;
    function getPassphrase: JString; cdecl;
    function getPasspointConfig: JPasspointConfiguration; cdecl;
    function getPriority: Integer; cdecl;
    function getPriorityGroup: Integer; cdecl;
    function getSsid: JString; cdecl;
    function getSubscriptionGroup: JParcelUuid; cdecl;
    function getSubscriptionId: Integer; cdecl;
    function getWifiSsid: JWifiSsid; cdecl;
    function hashCode: Integer; cdecl;
    function isAppInteractionRequired: Boolean; cdecl;
    function isCarrierMerged: Boolean; cdecl;
    function isCredentialSharedWithUser: Boolean; cdecl;
    function isEnhancedOpen: Boolean; cdecl;
    function isHiddenSsid: Boolean; cdecl;
    function isInitialAutojoinEnabled: Boolean; cdecl;
    function isMetered: Boolean; cdecl;
    function isRestricted: Boolean; cdecl;
    function isUntrusted: Boolean; cdecl;
    function isUserInteractionRequired: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiNetworkSuggestion = class(TJavaGenericImport<JWifiNetworkSuggestionClass, JWifiNetworkSuggestion>) end;

  JWifiNetworkSuggestion_BuilderClass = interface(JObjectClass)
    ['{4A81FAD5-7C83-48C6-8465-1B8CE7EAB281}']
    {class} function init: JWifiNetworkSuggestion_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/WifiNetworkSuggestion$Builder')]
  JWifiNetworkSuggestion_Builder = interface(JObject)
    ['{3D0F4209-07DE-4BED-84EA-5EFEEDCDAF20}']
    function build: JWifiNetworkSuggestion; cdecl;
    function setBssid(bssid: JMacAddress): JWifiNetworkSuggestion_Builder; cdecl;
    function setCarrierMerged(isCarrierMerged: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setCredentialSharedWithUser(isShared: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsAppInteractionRequired(isAppInteractionRequired: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsEnhancedOpen(isEnhancedOpen: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsHiddenSsid(isHiddenSsid: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsInitialAutojoinEnabled(enabled: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsMetered(isMetered: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsUserInteractionRequired(isUserInteractionRequired: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setIsWpa3SaeH2eOnlyModeEnabled(enable: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setMacRandomizationSetting(macRandomizationSetting: Integer): JWifiNetworkSuggestion_Builder; cdecl;
    function setPasspointConfig(passpointConfig: JPasspointConfiguration): JWifiNetworkSuggestion_Builder; cdecl;
    function setPriority(priority: Integer): JWifiNetworkSuggestion_Builder; cdecl;
    function setPriorityGroup(priorityGroup: Integer): JWifiNetworkSuggestion_Builder; cdecl;
    function setRestricted(isRestricted: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setSsid(ssid: JString): JWifiNetworkSuggestion_Builder; cdecl;
    function setSubscriptionGroup(groupUuid: JParcelUuid): JWifiNetworkSuggestion_Builder; cdecl;
    function setSubscriptionId(subscriptionId: Integer): JWifiNetworkSuggestion_Builder; cdecl;
    function setUntrusted(isUntrusted: Boolean): JWifiNetworkSuggestion_Builder; cdecl;
    function setWapiEnterpriseConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSuggestion_Builder; cdecl;
    function setWapiPassphrase(passphrase: JString): JWifiNetworkSuggestion_Builder; cdecl;
    function setWifiSsid(wifiSsid: JWifiSsid): JWifiNetworkSuggestion_Builder; cdecl;
    function setWpa2EnterpriseConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSuggestion_Builder; cdecl;
    function setWpa2Passphrase(passphrase: JString): JWifiNetworkSuggestion_Builder; cdecl;
    function setWpa3Enterprise192BitModeConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSuggestion_Builder; cdecl;
    function setWpa3EnterpriseConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSuggestion_Builder; cdecl;//Deprecated
    function setWpa3EnterpriseStandardModeConfig(enterpriseConfig: JWifiEnterpriseConfig): JWifiNetworkSuggestion_Builder; cdecl;
    function setWpa3Passphrase(passphrase: JString): JWifiNetworkSuggestion_Builder; cdecl;
  end;
  TJWifiNetworkSuggestion_Builder = class(TJavaGenericImport<JWifiNetworkSuggestion_BuilderClass, JWifiNetworkSuggestion_Builder>) end;

  JWifiSsidClass = interface(JObjectClass)
    ['{D3BAF747-8F6A-4DEB-999E-E19596C7BB64}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function fromBytes(bytes: TJavaArray<Byte>): JWifiSsid; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/WifiSsid')]
  JWifiSsid = interface(JObject)
    ['{BFCC6994-A9DB-4B96-8F6A-0F21A66D09E9}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiSsid = class(TJavaGenericImport<JWifiSsidClass, JWifiSsid>) end;

  JWpsInfoClass = interface(JObjectClass)
    ['{994C4858-2798-441A-9D35-B111C5EC0932}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDISPLAY: Integer; cdecl;
    {class} function _GetINVALID: Integer; cdecl;
    {class} function _GetKEYPAD: Integer; cdecl;
    {class} function _GetLABEL: Integer; cdecl;
    {class} function _GetPBC: Integer; cdecl;
    {class} function init: JWpsInfo; cdecl; overload;
    {class} function init(source: JWpsInfo): JWpsInfo; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DISPLAY: Integer read _GetDISPLAY;
    {class} property INVALID: Integer read _GetINVALID;
    {class} property KEYPAD: Integer read _GetKEYPAD;
    {class} property &LABEL: Integer read _GetLABEL;
    {class} property PBC: Integer read _GetPBC;
  end;

  [JavaSignature('android/net/wifi/WpsInfo')]
  JWpsInfo = interface(JObject)
    ['{41B1A223-EFB9-4FA6-8C56-8153780CBC4B}']
    function _GetBSSID: JString; cdecl;
    procedure _SetBSSID(Value: JString); cdecl;
    function _Getpin: JString; cdecl;
    procedure _Setpin(Value: JString); cdecl;
    function _Getsetup: Integer; cdecl;
    procedure _Setsetup(Value: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property BSSID: JString read _GetBSSID write _SetBSSID;
    property pin: JString read _Getpin write _Setpin;
    property setup: Integer read _Getsetup write _Setsetup;
  end;
  TJWpsInfo = class(TJavaGenericImport<JWpsInfoClass, JWpsInfo>) end;

  JAttachCallbackClass = interface(JObjectClass)
    ['{FAFEFB07-5766-4139-9EFB-C20CBBA5B120}']
    {class} function init: JAttachCallback; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/AttachCallback')]
  JAttachCallback = interface(JObject)
    ['{328E9B4C-19F7-4100-90A1-A418D73D31D0}']
    procedure onAttachFailed; cdecl;
    procedure onAttached(session: JWifiAwareSession); cdecl;
    procedure onAwareSessionTerminated; cdecl;
  end;
  TJAttachCallback = class(TJavaGenericImport<JAttachCallbackClass, JAttachCallback>) end;

  JAwareResourcesClass = interface(JObjectClass)
    ['{AA3342DA-86EC-4F35-AB84-59313C25E793}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(availableDataPathsCount: Integer; availablePublishSessionsCount: Integer; availableSubscribeSessionsCount: Integer): JAwareResources; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/AwareResources')]
  JAwareResources = interface(JObject)
    ['{01A9BE99-6EF0-4FEF-AE24-D304725577A8}']
    function describeContents: Integer; cdecl;
    function getAvailableDataPathsCount: Integer; cdecl;
    function getAvailablePublishSessionsCount: Integer; cdecl;
    function getAvailableSubscribeSessionsCount: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAwareResources = class(TJavaGenericImport<JAwareResourcesClass, JAwareResources>) end;

  JCharacteristicsClass = interface(JObjectClass)
    ['{6D7FD259-C231-4692-82A8-B593CCA04B50}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetWIFI_AWARE_CIPHER_SUITE_NCS_PK_128: Integer; cdecl;
    {class} function _GetWIFI_AWARE_CIPHER_SUITE_NCS_PK_256: Integer; cdecl;
    {class} function _GetWIFI_AWARE_CIPHER_SUITE_NCS_SK_128: Integer; cdecl;
    {class} function _GetWIFI_AWARE_CIPHER_SUITE_NCS_SK_256: Integer; cdecl;
    {class} function _GetWIFI_AWARE_CIPHER_SUITE_NONE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property WIFI_AWARE_CIPHER_SUITE_NCS_PK_128: Integer read _GetWIFI_AWARE_CIPHER_SUITE_NCS_PK_128;
    {class} property WIFI_AWARE_CIPHER_SUITE_NCS_PK_256: Integer read _GetWIFI_AWARE_CIPHER_SUITE_NCS_PK_256;
    {class} property WIFI_AWARE_CIPHER_SUITE_NCS_SK_128: Integer read _GetWIFI_AWARE_CIPHER_SUITE_NCS_SK_128;
    {class} property WIFI_AWARE_CIPHER_SUITE_NCS_SK_256: Integer read _GetWIFI_AWARE_CIPHER_SUITE_NCS_SK_256;
    {class} property WIFI_AWARE_CIPHER_SUITE_NONE: Integer read _GetWIFI_AWARE_CIPHER_SUITE_NONE;
  end;

  [JavaSignature('android/net/wifi/aware/Characteristics')]
  JCharacteristics = interface(JObject)
    ['{9177574E-7B03-4CD8-8A96-799E8EA6F230}']
    function describeContents: Integer; cdecl;
    function getMaxMatchFilterLength: Integer; cdecl;
    function getMaxServiceNameLength: Integer; cdecl;
    function getMaxServiceSpecificInfoLength: Integer; cdecl;
    function getNumberOfSupportedDataInterfaces: Integer; cdecl;
    function getNumberOfSupportedDataPaths: Integer; cdecl;
    function getNumberOfSupportedPublishSessions: Integer; cdecl;
    function getNumberOfSupportedSubscribeSessions: Integer; cdecl;
    function getSupportedCipherSuites: Integer; cdecl;
    function isInstantCommunicationModeSupported: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCharacteristics = class(TJavaGenericImport<JCharacteristicsClass, JCharacteristics>) end;

  JDiscoverySessionClass = interface(JObjectClass)
    ['{357BB3B1-C5A2-42BD-9C4F-154C8B6DF602}']
  end;

  [JavaSignature('android/net/wifi/aware/DiscoverySession')]
  JDiscoverySession = interface(JObject)
    ['{36722E09-0AA1-4462-820C-B3A1C43B667E}']
    procedure close; cdecl;
    function createNetworkSpecifierOpen(peerHandle: JPeerHandle): JNetworkSpecifier; cdecl;//Deprecated
    function createNetworkSpecifierPassphrase(peerHandle: JPeerHandle; passphrase: JString): JNetworkSpecifier; cdecl;//Deprecated
    procedure sendMessage(peerHandle: JPeerHandle; messageId: Integer; message: TJavaArray<Byte>); cdecl;
  end;
  TJDiscoverySession = class(TJavaGenericImport<JDiscoverySessionClass, JDiscoverySession>) end;

  JDiscoverySessionCallbackClass = interface(JObjectClass)
    ['{C9C08528-4C93-43B1-8DB1-A52914FDBDCD}']
    {class} function init: JDiscoverySessionCallback; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/DiscoverySessionCallback')]
  JDiscoverySessionCallback = interface(JObject)
    ['{068700DB-D155-474F-948A-4FBC1BD575D5}']
    procedure onMessageReceived(peerHandle: JPeerHandle; message: TJavaArray<Byte>); cdecl;
    procedure onMessageSendFailed(messageId: Integer); cdecl;
    procedure onMessageSendSucceeded(messageId: Integer); cdecl;
    procedure onPublishStarted(session: JPublishDiscoverySession); cdecl;
    procedure onServiceDiscovered(peerHandle: JPeerHandle; serviceSpecificInfo: TJavaArray<Byte>; matchFilter: JList); cdecl; overload;
    procedure onServiceDiscovered(info: JServiceDiscoveryInfo); cdecl; overload;
    procedure onServiceDiscoveredWithinRange(peerHandle: JPeerHandle; serviceSpecificInfo: TJavaArray<Byte>; matchFilter: JList; distanceMm: Integer); cdecl; overload;
    procedure onServiceDiscoveredWithinRange(info: JServiceDiscoveryInfo; distanceMm: Integer); cdecl; overload;
    procedure onServiceLost(peerHandle: JPeerHandle; reason: Integer); cdecl;
    procedure onSessionConfigFailed; cdecl;
    procedure onSessionConfigUpdated; cdecl;
    procedure onSessionTerminated; cdecl;
    procedure onSubscribeStarted(session: JSubscribeDiscoverySession); cdecl;
  end;
  TJDiscoverySessionCallback = class(TJavaGenericImport<JDiscoverySessionCallbackClass, JDiscoverySessionCallback>) end;

  JIdentityChangedListenerClass = interface(JObjectClass)
    ['{87E29BBC-DDE1-4CBE-A9E5-6CB1FCD58385}']
    {class} function init: JIdentityChangedListener; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/IdentityChangedListener')]
  JIdentityChangedListener = interface(JObject)
    ['{68A61CB2-2DDF-4DFB-827E-18C0F732F114}']
    procedure onIdentityChanged(mac: TJavaArray<Byte>); cdecl;
  end;
  TJIdentityChangedListener = class(TJavaGenericImport<JIdentityChangedListenerClass, JIdentityChangedListener>) end;

  JPeerHandleClass = interface(JObjectClass)
    ['{27326815-6F69-40F5-8DB8-AE0B136A1144}']
  end;

  [JavaSignature('android/net/wifi/aware/PeerHandle')]
  JPeerHandle = interface(JObject)
    ['{5F3FEF5A-AB67-41E2-ACFB-B9EB3423E266}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJPeerHandle = class(TJavaGenericImport<JPeerHandleClass, JPeerHandle>) end;

  JParcelablePeerHandleClass = interface(JPeerHandleClass)
    ['{79B75EF1-28CE-47E1-8676-BA9DCC628E4B}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(peerHandle: JPeerHandle): JParcelablePeerHandle; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/ParcelablePeerHandle')]
  JParcelablePeerHandle = interface(JPeerHandle)
    ['{073DADF1-2A2E-4DBB-8616-AC1D8B83AF53}']
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJParcelablePeerHandle = class(TJavaGenericImport<JParcelablePeerHandleClass, JParcelablePeerHandle>) end;

  JPublishConfigClass = interface(JObjectClass)
    ['{BAE4D81B-4C8B-409A-8634-A863C44B7815}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPUBLISH_TYPE_SOLICITED: Integer; cdecl;
    {class} function _GetPUBLISH_TYPE_UNSOLICITED: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PUBLISH_TYPE_SOLICITED: Integer read _GetPUBLISH_TYPE_SOLICITED;
    {class} property PUBLISH_TYPE_UNSOLICITED: Integer read _GetPUBLISH_TYPE_UNSOLICITED;
  end;

  [JavaSignature('android/net/wifi/aware/PublishConfig')]
  JPublishConfig = interface(JObject)
    ['{EFD6BAD0-DF2C-458E-A6FB-1D50C7356CDA}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getInstantCommunicationBand: Integer; cdecl;
    function getSecurityConfig: JWifiAwareDataPathSecurityConfig; cdecl;
    function hashCode: Integer; cdecl;
    function isInstantCommunicationModeEnabled: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPublishConfig = class(TJavaGenericImport<JPublishConfigClass, JPublishConfig>) end;

  JPublishConfig_BuilderClass = interface(JObjectClass)
    ['{33BB5E18-DEE8-417C-B6DA-9F9A559450F4}']
    {class} function init: JPublishConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/PublishConfig$Builder')]
  JPublishConfig_Builder = interface(JObject)
    ['{3945E4AE-7DC6-43B7-8844-FA08711F7D60}']
    function build: JPublishConfig; cdecl;
    function setDataPathSecurityConfig(securityConfig: JWifiAwareDataPathSecurityConfig): JPublishConfig_Builder; cdecl;
    function setInstantCommunicationModeEnabled(enabled: Boolean; band: Integer): JPublishConfig_Builder; cdecl;
    function setMatchFilter(matchFilter: JList): JPublishConfig_Builder; cdecl;
    function setPublishType(publishType: Integer): JPublishConfig_Builder; cdecl;
    function setRangingEnabled(enable: Boolean): JPublishConfig_Builder; cdecl;
    function setServiceName(serviceName: JString): JPublishConfig_Builder; cdecl;
    function setServiceSpecificInfo(serviceSpecificInfo: TJavaArray<Byte>): JPublishConfig_Builder; cdecl;
    function setTerminateNotificationEnabled(enable: Boolean): JPublishConfig_Builder; cdecl;
    function setTtlSec(ttlSec: Integer): JPublishConfig_Builder; cdecl;
  end;
  TJPublishConfig_Builder = class(TJavaGenericImport<JPublishConfig_BuilderClass, JPublishConfig_Builder>) end;

  JPublishDiscoverySessionClass = interface(JDiscoverySessionClass)
    ['{24F9DF84-84C6-4C61-9FDE-2B1CB9543948}']
  end;

  [JavaSignature('android/net/wifi/aware/PublishDiscoverySession')]
  JPublishDiscoverySession = interface(JDiscoverySession)
    ['{C8E6DCE7-7453-46A1-997A-8110490A6F49}']
    procedure updatePublish(publishConfig: JPublishConfig); cdecl;
  end;
  TJPublishDiscoverySession = class(TJavaGenericImport<JPublishDiscoverySessionClass, JPublishDiscoverySession>) end;

  JServiceDiscoveryInfoClass = interface(JObjectClass)
    ['{8D7BF245-3338-47AC-AF35-87481A36AD72}']
  end;

  [JavaSignature('android/net/wifi/aware/ServiceDiscoveryInfo')]
  JServiceDiscoveryInfo = interface(JObject)
    ['{62458E1D-471D-47B9-B43B-D275D824D92A}']
    function getMatchFilters: JList; cdecl;
    function getPeerCipherSuite: Integer; cdecl;
    function getPeerHandle: JPeerHandle; cdecl;
    function getScid: TJavaArray<Byte>; cdecl;
    function getServiceSpecificInfo: TJavaArray<Byte>; cdecl;
  end;
  TJServiceDiscoveryInfo = class(TJavaGenericImport<JServiceDiscoveryInfoClass, JServiceDiscoveryInfo>) end;

  JSubscribeConfigClass = interface(JObjectClass)
    ['{B08313D4-2210-41E3-BD3F-C4B9D049A63F}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSUBSCRIBE_TYPE_ACTIVE: Integer; cdecl;
    {class} function _GetSUBSCRIBE_TYPE_PASSIVE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SUBSCRIBE_TYPE_ACTIVE: Integer read _GetSUBSCRIBE_TYPE_ACTIVE;
    {class} property SUBSCRIBE_TYPE_PASSIVE: Integer read _GetSUBSCRIBE_TYPE_PASSIVE;
  end;

  [JavaSignature('android/net/wifi/aware/SubscribeConfig')]
  JSubscribeConfig = interface(JObject)
    ['{997F3A23-2625-49CD-8650-10DD2CD48D16}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getInstantCommunicationBand: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isInstantCommunicationModeEnabled: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSubscribeConfig = class(TJavaGenericImport<JSubscribeConfigClass, JSubscribeConfig>) end;

  JSubscribeConfig_BuilderClass = interface(JObjectClass)
    ['{A2C2BA4D-8E27-4494-B5C6-975185914204}']
    {class} function init: JSubscribeConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/SubscribeConfig$Builder')]
  JSubscribeConfig_Builder = interface(JObject)
    ['{5770C6EC-1CCF-4541-9722-FE302BA26DA6}']
    function build: JSubscribeConfig; cdecl;
    function setInstantCommunicationModeEnabled(enabled: Boolean; band: Integer): JSubscribeConfig_Builder; cdecl;
    function setMatchFilter(matchFilter: JList): JSubscribeConfig_Builder; cdecl;
    function setMaxDistanceMm(maxDistanceMm: Integer): JSubscribeConfig_Builder; cdecl;
    function setMinDistanceMm(minDistanceMm: Integer): JSubscribeConfig_Builder; cdecl;
    function setServiceName(serviceName: JString): JSubscribeConfig_Builder; cdecl;
    function setServiceSpecificInfo(serviceSpecificInfo: TJavaArray<Byte>): JSubscribeConfig_Builder; cdecl;
    function setSubscribeType(subscribeType: Integer): JSubscribeConfig_Builder; cdecl;
    function setTerminateNotificationEnabled(enable: Boolean): JSubscribeConfig_Builder; cdecl;
    function setTtlSec(ttlSec: Integer): JSubscribeConfig_Builder; cdecl;
  end;
  TJSubscribeConfig_Builder = class(TJavaGenericImport<JSubscribeConfig_BuilderClass, JSubscribeConfig_Builder>) end;

  JSubscribeDiscoverySessionClass = interface(JDiscoverySessionClass)
    ['{E79CFEB7-0CA4-4CAD-A9C4-34D322693CF6}']
  end;

  [JavaSignature('android/net/wifi/aware/SubscribeDiscoverySession')]
  JSubscribeDiscoverySession = interface(JDiscoverySession)
    ['{07AC66B4-23C0-48CA-B9D1-506ED85ED009}']
    procedure updateSubscribe(subscribeConfig: JSubscribeConfig); cdecl;
  end;
  TJSubscribeDiscoverySession = class(TJavaGenericImport<JSubscribeDiscoverySessionClass, JSubscribeDiscoverySession>) end;

  JWifiAwareChannelInfoClass = interface(JObjectClass)
    ['{380CFD37-DDBD-4D21-A4F3-8DCC546616F0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareChannelInfo')]
  JWifiAwareChannelInfo = interface(JObject)
    ['{CD76CE70-F8B5-40E6-953B-A319003828D8}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getChannelBandwidth: Integer; cdecl;
    function getChannelFrequencyMhz: Integer; cdecl;
    function getSpatialStreamCount: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiAwareChannelInfo = class(TJavaGenericImport<JWifiAwareChannelInfoClass, JWifiAwareChannelInfo>) end;

  JWifiAwareDataPathSecurityConfigClass = interface(JObjectClass)
    ['{FF78655F-C995-4DA0-839F-FB817CA26373}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareDataPathSecurityConfig')]
  JWifiAwareDataPathSecurityConfig = interface(JObject)
    ['{F7DDED0B-91E9-415F-978F-A7EEFB28F328}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCipherSuite: Integer; cdecl;
    function getPmk: TJavaArray<Byte>; cdecl;
    function getPmkId: TJavaArray<Byte>; cdecl;
    function getPskPassphrase: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiAwareDataPathSecurityConfig = class(TJavaGenericImport<JWifiAwareDataPathSecurityConfigClass, JWifiAwareDataPathSecurityConfig>) end;

  JWifiAwareDataPathSecurityConfig_BuilderClass = interface(JObjectClass)
    ['{E18DADF6-AD63-4529-A484-5883B310A203}']
    {class} function init(cipherSuite: Integer): JWifiAwareDataPathSecurityConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareDataPathSecurityConfig$Builder')]
  JWifiAwareDataPathSecurityConfig_Builder = interface(JObject)
    ['{B729E6D6-EE33-4D39-ADDD-21C0A281E311}']
    function build: JWifiAwareDataPathSecurityConfig; cdecl;
    function setPmk(pmk: TJavaArray<Byte>): JWifiAwareDataPathSecurityConfig_Builder; cdecl;
    function setPmkId(pmkId: TJavaArray<Byte>): JWifiAwareDataPathSecurityConfig_Builder; cdecl;
    function setPskPassphrase(pskPassphrase: JString): JWifiAwareDataPathSecurityConfig_Builder; cdecl;
  end;
  TJWifiAwareDataPathSecurityConfig_Builder = class(TJavaGenericImport<JWifiAwareDataPathSecurityConfig_BuilderClass, JWifiAwareDataPathSecurityConfig_Builder>) end;

  JWifiAwareManagerClass = interface(JObjectClass)
    ['{B23C0A6B-9112-46CA-AE46-E75754479294}']
    {class} function _GetACTION_WIFI_AWARE_RESOURCE_CHANGED: JString; cdecl;
    {class} function _GetACTION_WIFI_AWARE_STATE_CHANGED: JString; cdecl;
    {class} function _GetEXTRA_AWARE_RESOURCES: JString; cdecl;
    {class} function _GetWIFI_AWARE_DATA_PATH_ROLE_INITIATOR: Integer; cdecl;
    {class} function _GetWIFI_AWARE_DATA_PATH_ROLE_RESPONDER: Integer; cdecl;
    {class} function _GetWIFI_AWARE_DISCOVERY_LOST_REASON_PEER_NOT_VISIBLE: Integer; cdecl;
    {class} function _GetWIFI_AWARE_DISCOVERY_LOST_REASON_UNKNOWN: Integer; cdecl;
    {class} property ACTION_WIFI_AWARE_RESOURCE_CHANGED: JString read _GetACTION_WIFI_AWARE_RESOURCE_CHANGED;
    {class} property ACTION_WIFI_AWARE_STATE_CHANGED: JString read _GetACTION_WIFI_AWARE_STATE_CHANGED;
    {class} property EXTRA_AWARE_RESOURCES: JString read _GetEXTRA_AWARE_RESOURCES;
    {class} property WIFI_AWARE_DATA_PATH_ROLE_INITIATOR: Integer read _GetWIFI_AWARE_DATA_PATH_ROLE_INITIATOR;
    {class} property WIFI_AWARE_DATA_PATH_ROLE_RESPONDER: Integer read _GetWIFI_AWARE_DATA_PATH_ROLE_RESPONDER;
    {class} property WIFI_AWARE_DISCOVERY_LOST_REASON_PEER_NOT_VISIBLE: Integer read _GetWIFI_AWARE_DISCOVERY_LOST_REASON_PEER_NOT_VISIBLE;
    {class} property WIFI_AWARE_DISCOVERY_LOST_REASON_UNKNOWN: Integer read _GetWIFI_AWARE_DISCOVERY_LOST_REASON_UNKNOWN;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareManager')]
  JWifiAwareManager = interface(JObject)
    ['{234505FD-A0BF-4F51-B7D4-4DDCD97E2BDE}']
    procedure attach(attachCallback: JAttachCallback; handler: JHandler); cdecl; overload;
    procedure attach(attachCallback: JAttachCallback; identityChangedListener: JIdentityChangedListener; handler: JHandler); cdecl; overload;
    function getAvailableAwareResources: JAwareResources; cdecl;
    function getCharacteristics: JCharacteristics; cdecl;
    function isAvailable: Boolean; cdecl;
    function isDeviceAttached: Boolean; cdecl;
    function isInstantCommunicationModeEnabled: Boolean; cdecl;
    function isSetChannelOnDataPathSupported: Boolean; cdecl;
  end;
  TJWifiAwareManager = class(TJavaGenericImport<JWifiAwareManagerClass, JWifiAwareManager>) end;

  JWifiAwareNetworkInfoClass = interface(JObjectClass)
    ['{EBD495DF-A30F-432A-804C-C07DAA9440CC}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareNetworkInfo')]
  JWifiAwareNetworkInfo = interface(JObject)
    ['{698849AD-41DF-4E68-96B8-3D16DAC13C04}']
    function describeContents: Integer; cdecl;
    function getChannelInfoList: JList; cdecl;
    function getPeerIpv6Addr: JInet6Address; cdecl;
    function getPort: Integer; cdecl;
    function getTransportProtocol: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiAwareNetworkInfo = class(TJavaGenericImport<JWifiAwareNetworkInfoClass, JWifiAwareNetworkInfo>) end;

  JWifiAwareNetworkSpecifierClass = interface(JNetworkSpecifierClass)
    ['{EE15AC6D-A843-4899-A08B-4EC1DAAF6D3C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareNetworkSpecifier')]
  JWifiAwareNetworkSpecifier = interface(JNetworkSpecifier)
    ['{D75DC7F0-2B2F-4C45-91D6-CBDC3BE75474}']
    function describeContents: Integer; cdecl;
    function getChannelFrequencyMhz: Integer; cdecl;
    function getWifiAwareDataPathSecurityConfig: JWifiAwareDataPathSecurityConfig; cdecl;
    function isChannelRequired: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiAwareNetworkSpecifier = class(TJavaGenericImport<JWifiAwareNetworkSpecifierClass, JWifiAwareNetworkSpecifier>) end;

  JWifiAwareNetworkSpecifier_BuilderClass = interface(JObjectClass)
    ['{DEE47562-C8FC-462C-804D-1C972877F034}']
    {class} function init(discoverySession: JDiscoverySession; peerHandle: JPeerHandle): JWifiAwareNetworkSpecifier_Builder; cdecl; overload;
    {class} function init(publishDiscoverySession: JPublishDiscoverySession): JWifiAwareNetworkSpecifier_Builder; cdecl; overload;
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareNetworkSpecifier$Builder')]
  JWifiAwareNetworkSpecifier_Builder = interface(JObject)
    ['{CC4834B5-6B9C-42DC-A9EC-014C14EAF9B0}']
    function build: JWifiAwareNetworkSpecifier; cdecl;
    function setChannelFrequencyMhz(channelInMhz: Integer; required: Boolean): JWifiAwareNetworkSpecifier_Builder; cdecl;
    function setDataPathSecurityConfig(securityConfig: JWifiAwareDataPathSecurityConfig): JWifiAwareNetworkSpecifier_Builder; cdecl;
    function setPmk(pmk: TJavaArray<Byte>): JWifiAwareNetworkSpecifier_Builder; cdecl;
    function setPort(port: Integer): JWifiAwareNetworkSpecifier_Builder; cdecl;
    function setPskPassphrase(pskPassphrase: JString): JWifiAwareNetworkSpecifier_Builder; cdecl;
    function setTransportProtocol(transportProtocol: Integer): JWifiAwareNetworkSpecifier_Builder; cdecl;
  end;
  TJWifiAwareNetworkSpecifier_Builder = class(TJavaGenericImport<JWifiAwareNetworkSpecifier_BuilderClass, JWifiAwareNetworkSpecifier_Builder>) end;

  JWifiAwareSessionClass = interface(JObjectClass)
    ['{299CBCB3-6906-441D-BBD5-1129E1153238}']
  end;

  [JavaSignature('android/net/wifi/aware/WifiAwareSession')]
  JWifiAwareSession = interface(JObject)
    ['{10FAAA5E-0B38-4969-86E2-610E56C1A190}']
    procedure close; cdecl;
    function createNetworkSpecifierOpen(role: Integer; peer: TJavaArray<Byte>): JNetworkSpecifier; cdecl;//Deprecated
    function createNetworkSpecifierPassphrase(role: Integer; peer: TJavaArray<Byte>; passphrase: JString): JNetworkSpecifier; cdecl;//Deprecated
    procedure publish(publishConfig: JPublishConfig; callback: JDiscoverySessionCallback; handler: JHandler); cdecl;
    procedure subscribe(subscribeConfig: JSubscribeConfig; callback: JDiscoverySessionCallback; handler: JHandler); cdecl;
  end;
  TJWifiAwareSession = class(TJavaGenericImport<JWifiAwareSessionClass, JWifiAwareSession>) end;

  JConfigParserClass = interface(JObjectClass)
    ['{60BC954E-DE3D-419B-8D27-3AF26B2A96C9}']
    {class} function parsePasspointConfig(mimeType: JString; data: TJavaArray<Byte>): JPasspointConfiguration; cdecl;
  end;

  [JavaSignature('android/net/wifi/hotspot2/ConfigParser')]
  JConfigParser = interface(JObject)
    ['{734532A5-97B5-4123-B37C-D0E1598C91E8}']
  end;
  TJConfigParser = class(TJavaGenericImport<JConfigParserClass, JConfigParser>) end;

  JPasspointConfigurationClass = interface(JObjectClass)
    ['{BD96F152-60D4-4FEA-BCAA-67B159161FEF}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JPasspointConfiguration; cdecl; overload;
    {class} function init(source: JPasspointConfiguration): JPasspointConfiguration; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/PasspointConfiguration')]
  JPasspointConfiguration = interface(JObject)
    ['{A3C31C9D-EC8A-4852-8322-0F655067407B}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getCredential: JCredential; cdecl;
    function getDecoratedIdentityPrefix: JString; cdecl;
    function getHomeSp: JHomeSp; cdecl;
    function getSubscriptionExpirationTimeMillis: Int64; cdecl;
    function getUniqueId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isOsuProvisioned: Boolean; cdecl;
    procedure setCredential(credential: JCredential); cdecl;
    procedure setDecoratedIdentityPrefix(decoratedIdentityPrefix: JString); cdecl;
    procedure setHomeSp(homeSp: JHomeSp); cdecl;
    procedure setSubscriptionExpirationTimeInMillis(subscriptionExpirationTimeInMillis: Int64); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPasspointConfiguration = class(TJavaGenericImport<JPasspointConfigurationClass, JPasspointConfiguration>) end;

  JPpsMoParserClass = interface(JObjectClass)
    ['{2670551C-893C-43A3-8EF2-460FECA4F132}']
    {class} function parseMoText(xmlString: JString): JPasspointConfiguration; cdecl;
  end;

  [JavaSignature('android/net/wifi/hotspot2/omadm/PpsMoParser')]
  JPpsMoParser = interface(JObject)
    ['{D98DA742-9C1F-42CB-A495-2491FBED210B}']
  end;
  TJPpsMoParser = class(TJavaGenericImport<JPpsMoParserClass, JPpsMoParser>) end;

  JCredentialClass = interface(JObjectClass)
    ['{252D463E-6A42-4C32-839B-F15D263203CD}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JCredential; cdecl; overload;
    {class} function init(source: JCredential): JCredential; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/pps/Credential')]
  JCredential = interface(JObject)
    ['{240F1192-A565-4C6E-8EA2-F069D2C1612C}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getCaCertificate: JX509Certificate; cdecl;
    function getCertCredential: JCredential_CertificateCredential; cdecl;
    function getClientCertificateChain: TJavaObjectArray<JX509Certificate>; cdecl;
    function getClientPrivateKey: JPrivateKey; cdecl;
    function getRealm: JString; cdecl;
    function getSimCredential: JCredential_SimCredential; cdecl;
    function getUserCredential: JCredential_UserCredential; cdecl;
    function hashCode: Integer; cdecl;
    procedure setCaCertificate(caCertificate: JX509Certificate); cdecl;
    procedure setCertCredential(certCredential: JCredential_CertificateCredential); cdecl;
    procedure setClientCertificateChain(certificateChain: TJavaObjectArray<JX509Certificate>); cdecl;
    procedure setClientPrivateKey(clientPrivateKey: JPrivateKey); cdecl;
    procedure setRealm(realm: JString); cdecl;
    procedure setSimCredential(simCredential: JCredential_SimCredential); cdecl;
    procedure setUserCredential(userCredential: JCredential_UserCredential); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCredential = class(TJavaGenericImport<JCredentialClass, JCredential>) end;

  JCredential_CertificateCredentialClass = interface(JObjectClass)
    ['{BF125BCF-C9F6-41A3-8079-026FEE7AF7B0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JCredential_CertificateCredential; cdecl; overload;
    {class} function init(source: JCredential_CertificateCredential): JCredential_CertificateCredential; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/pps/Credential$CertificateCredential')]
  JCredential_CertificateCredential = interface(JObject)
    ['{F51B384F-626A-4D5C-A1D9-6CA76B4418F5}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getCertSha256Fingerprint: TJavaArray<Byte>; cdecl;
    function getCertType: JString; cdecl;
    function hashCode: Integer; cdecl;
    procedure setCertSha256Fingerprint(certSha256Fingerprint: TJavaArray<Byte>); cdecl;
    procedure setCertType(certType: JString); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCredential_CertificateCredential = class(TJavaGenericImport<JCredential_CertificateCredentialClass, JCredential_CertificateCredential>) end;

  JCredential_SimCredentialClass = interface(JObjectClass)
    ['{E01E976D-F977-49D1-868D-7B6830DFBB31}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JCredential_SimCredential; cdecl; overload;
    {class} function init(source: JCredential_SimCredential): JCredential_SimCredential; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/pps/Credential$SimCredential')]
  JCredential_SimCredential = interface(JObject)
    ['{9127F9CE-3282-420C-AC5E-A680E7778557}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getEapType: Integer; cdecl;
    function getImsi: JString; cdecl;
    function hashCode: Integer; cdecl;
    procedure setEapType(eapType: Integer); cdecl;
    procedure setImsi(imsi: JString); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCredential_SimCredential = class(TJavaGenericImport<JCredential_SimCredentialClass, JCredential_SimCredential>) end;

  JCredential_UserCredentialClass = interface(JObjectClass)
    ['{4051F53E-5205-41AC-B088-5865DB95BC51}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JCredential_UserCredential; cdecl; overload;
    {class} function init(source: JCredential_UserCredential): JCredential_UserCredential; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/pps/Credential$UserCredential')]
  JCredential_UserCredential = interface(JObject)
    ['{B7537AA4-4F3F-48EF-A634-ECE36598E1AB}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getEapType: Integer; cdecl;
    function getNonEapInnerMethod: JString; cdecl;
    function getPassword: JString; cdecl;
    function getUsername: JString; cdecl;
    function hashCode: Integer; cdecl;
    procedure setEapType(eapType: Integer); cdecl;
    procedure setNonEapInnerMethod(nonEapInnerMethod: JString); cdecl;
    procedure setPassword(password: JString); cdecl;
    procedure setUsername(username: JString); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCredential_UserCredential = class(TJavaGenericImport<JCredential_UserCredentialClass, JCredential_UserCredential>) end;

  JHomeSpClass = interface(JObjectClass)
    ['{C4ACA98E-50ED-4983-8680-E1AB9DB78A1E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JHomeSp; cdecl; overload;
    {class} function init(source: JHomeSp): JHomeSp; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/hotspot2/pps/HomeSp')]
  JHomeSp = interface(JObject)
    ['{C8E42F9A-AE09-4BCD-954A-5E540BACA419}']
    function describeContents: Integer; cdecl;
    function equals(thatObject: JObject): Boolean; cdecl;
    function getFqdn: JString; cdecl;
    function getFriendlyName: JString; cdecl;
    function getMatchAllOis: TJavaArray<Int64>; cdecl;
    function getMatchAnyOis: TJavaArray<Int64>; cdecl;
    function getOtherHomePartnersList: JCollection; cdecl;
    function getRoamingConsortiumOis: TJavaArray<Int64>; cdecl;
    function hashCode: Integer; cdecl;
    procedure setFqdn(fqdn: JString); cdecl;
    procedure setFriendlyName(friendlyName: JString); cdecl;
    procedure setMatchAllOis(matchAllOis: TJavaArray<Int64>); cdecl;
    procedure setMatchAnyOis(matchAnyOis: TJavaArray<Int64>); cdecl;
    procedure setOtherHomePartnersList(otherHomePartners: JCollection); cdecl;
    procedure setRoamingConsortiumOis(roamingConsortiumOis: TJavaArray<Int64>); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJHomeSp = class(TJavaGenericImport<JHomeSpClass, JHomeSp>) end;

  JWifiP2pConfigClass = interface(JObjectClass)
    ['{4A30B857-FDFC-4000-9937-04E0B0D2F7F4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetGROUP_OWNER_BAND_2GHZ: Integer; cdecl;
    {class} function _GetGROUP_OWNER_BAND_5GHZ: Integer; cdecl;
    {class} function _GetGROUP_OWNER_BAND_AUTO: Integer; cdecl;
    {class} function _GetGROUP_OWNER_INTENT_AUTO: Integer; cdecl;
    {class} function _GetGROUP_OWNER_INTENT_MAX: Integer; cdecl;
    {class} function _GetGROUP_OWNER_INTENT_MIN: Integer; cdecl;
    {class} function init: JWifiP2pConfig; cdecl; overload;
    {class} function init(source: JWifiP2pConfig): JWifiP2pConfig; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property GROUP_OWNER_BAND_2GHZ: Integer read _GetGROUP_OWNER_BAND_2GHZ;
    {class} property GROUP_OWNER_BAND_5GHZ: Integer read _GetGROUP_OWNER_BAND_5GHZ;
    {class} property GROUP_OWNER_BAND_AUTO: Integer read _GetGROUP_OWNER_BAND_AUTO;
    {class} property GROUP_OWNER_INTENT_AUTO: Integer read _GetGROUP_OWNER_INTENT_AUTO;
    {class} property GROUP_OWNER_INTENT_MAX: Integer read _GetGROUP_OWNER_INTENT_MAX;
    {class} property GROUP_OWNER_INTENT_MIN: Integer read _GetGROUP_OWNER_INTENT_MIN;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pConfig')]
  JWifiP2pConfig = interface(JObject)
    ['{CB589540-23B7-4A91-B60D-A7EACC74983F}']
    function _GetdeviceAddress: JString; cdecl;
    procedure _SetdeviceAddress(Value: JString); cdecl;
    function _GetgroupOwnerIntent: Integer; cdecl;
    procedure _SetgroupOwnerIntent(Value: Integer); cdecl;
    function _Getwps: JWpsInfo; cdecl;
    procedure _Setwps(Value: JWpsInfo); cdecl;
    function describeContents: Integer; cdecl;
    function getGroupOwnerBand: Integer; cdecl;
    function getNetworkId: Integer; cdecl;
    function getNetworkName: JString; cdecl;
    function getPassphrase: JString; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property deviceAddress: JString read _GetdeviceAddress write _SetdeviceAddress;
    property groupOwnerIntent: Integer read _GetgroupOwnerIntent write _SetgroupOwnerIntent;
    property wps: JWpsInfo read _Getwps write _Setwps;
  end;
  TJWifiP2pConfig = class(TJavaGenericImport<JWifiP2pConfigClass, JWifiP2pConfig>) end;

  JWifiP2pConfig_BuilderClass = interface(JObjectClass)
    ['{2CE6E477-EDAF-4538-85BF-73AE91136E53}']
    {class} function init: JWifiP2pConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pConfig$Builder')]
  JWifiP2pConfig_Builder = interface(JObject)
    ['{363071C1-3952-4CB5-8866-EFE88B3EE739}']
    function build: JWifiP2pConfig; cdecl;
    function enablePersistentMode(persistent: Boolean): JWifiP2pConfig_Builder; cdecl;
    function setDeviceAddress(deviceAddress: JMacAddress): JWifiP2pConfig_Builder; cdecl;
    function setGroupOperatingBand(band: Integer): JWifiP2pConfig_Builder; cdecl;
    function setGroupOperatingFrequency(frequency: Integer): JWifiP2pConfig_Builder; cdecl;
    function setNetworkName(networkName: JString): JWifiP2pConfig_Builder; cdecl;
    function setPassphrase(passphrase: JString): JWifiP2pConfig_Builder; cdecl;
  end;
  TJWifiP2pConfig_Builder = class(TJavaGenericImport<JWifiP2pConfig_BuilderClass, JWifiP2pConfig_Builder>) end;

  JWifiP2pDeviceClass = interface(JObjectClass)
    ['{D419A55A-3668-4DBB-800B-E6BCD534FC72}']
    {class} function _GetAVAILABLE: Integer; cdecl;
    {class} function _GetCONNECTED: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFAILED: Integer; cdecl;
    {class} function _GetINVITED: Integer; cdecl;
    {class} function _GetUNAVAILABLE: Integer; cdecl;
    {class} function init: JWifiP2pDevice; cdecl; overload;
    {class} function init(source: JWifiP2pDevice): JWifiP2pDevice; cdecl; overload;
    {class} property AVAILABLE: Integer read _GetAVAILABLE;
    {class} property CONNECTED: Integer read _GetCONNECTED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FAILED: Integer read _GetFAILED;
    {class} property INVITED: Integer read _GetINVITED;
    {class} property UNAVAILABLE: Integer read _GetUNAVAILABLE;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pDevice')]
  JWifiP2pDevice = interface(JObject)
    ['{06F8260A-0BD9-4B81-AF3B-4FF3AC9E8DB9}']
    function _GetdeviceAddress: JString; cdecl;
    procedure _SetdeviceAddress(Value: JString); cdecl;
    function _GetdeviceName: JString; cdecl;
    procedure _SetdeviceName(Value: JString); cdecl;
    function _GetprimaryDeviceType: JString; cdecl;
    procedure _SetprimaryDeviceType(Value: JString); cdecl;
    function _GetsecondaryDeviceType: JString; cdecl;
    procedure _SetsecondaryDeviceType(Value: JString); cdecl;
    function _Getstatus: Integer; cdecl;
    procedure _Setstatus(Value: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getVendorElements: JList; cdecl;
    function getWfdInfo: JWifiP2pWfdInfo; cdecl;
    function hashCode: Integer; cdecl;
    function isGroupOwner: Boolean; cdecl;
    function isServiceDiscoveryCapable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure update(device: JWifiP2pDevice); cdecl;
    function wpsDisplaySupported: Boolean; cdecl;
    function wpsKeypadSupported: Boolean; cdecl;
    function wpsPbcSupported: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property deviceAddress: JString read _GetdeviceAddress write _SetdeviceAddress;
    property deviceName: JString read _GetdeviceName write _SetdeviceName;
    property primaryDeviceType: JString read _GetprimaryDeviceType write _SetprimaryDeviceType;
    property secondaryDeviceType: JString read _GetsecondaryDeviceType write _SetsecondaryDeviceType;
    property status: Integer read _Getstatus write _Setstatus;
  end;
  TJWifiP2pDevice = class(TJavaGenericImport<JWifiP2pDeviceClass, JWifiP2pDevice>) end;

  JWifiP2pDeviceListClass = interface(JObjectClass)
    ['{8237D0CE-EBAD-45E7-A56C-2B75CEEC7F62}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JWifiP2pDeviceList; cdecl; overload;
    {class} function init(source: JWifiP2pDeviceList): JWifiP2pDeviceList; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pDeviceList')]
  JWifiP2pDeviceList = interface(JObject)
    ['{E42ECFA9-7A11-4722-9466-C0AE0B6D029B}']
    function describeContents: Integer; cdecl;
    function &get(deviceAddress: JString): JWifiP2pDevice; cdecl;
    function getDeviceList: JCollection; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiP2pDeviceList = class(TJavaGenericImport<JWifiP2pDeviceListClass, JWifiP2pDeviceList>) end;

  JWifiP2pGroupClass = interface(JObjectClass)
    ['{FBFBF497-23D1-4C59-8330-F6CE4F11D213}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetNETWORK_ID_PERSISTENT: Integer; cdecl;
    {class} function _GetNETWORK_ID_TEMPORARY: Integer; cdecl;
    {class} function init: JWifiP2pGroup; cdecl; overload;
    {class} function init(source: JWifiP2pGroup): JWifiP2pGroup; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property NETWORK_ID_PERSISTENT: Integer read _GetNETWORK_ID_PERSISTENT;
    {class} property NETWORK_ID_TEMPORARY: Integer read _GetNETWORK_ID_TEMPORARY;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pGroup')]
  JWifiP2pGroup = interface(JObject)
    ['{5DCCFEDD-4EE6-45C6-B385-C7C1DE690FDB}']
    function describeContents: Integer; cdecl;
    function getClientList: JCollection; cdecl;
    function getFrequency: Integer; cdecl;
    function getInterface: JString; cdecl;
    function getNetworkId: Integer; cdecl;
    function getNetworkName: JString; cdecl;
    function getOwner: JWifiP2pDevice; cdecl;
    function getPassphrase: JString; cdecl;
    function isGroupOwner: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiP2pGroup = class(TJavaGenericImport<JWifiP2pGroupClass, JWifiP2pGroup>) end;

  JWifiP2pInfoClass = interface(JObjectClass)
    ['{50C3454D-B3BF-4A59-8702-B14F497E9855}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JWifiP2pInfo; cdecl; overload;
    {class} function init(source: JWifiP2pInfo): JWifiP2pInfo; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pInfo')]
  JWifiP2pInfo = interface(JObject)
    ['{354CD0A4-C949-472F-B47D-34D503AC96EA}']
    function _GetgroupFormed: Boolean; cdecl;
    procedure _SetgroupFormed(Value: Boolean); cdecl;
    function _GetgroupOwnerAddress: JInetAddress; cdecl;
    procedure _SetgroupOwnerAddress(Value: JInetAddress); cdecl;
    function _GetisGroupOwner: Boolean; cdecl;
    procedure _SetisGroupOwner(Value: Boolean); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property groupFormed: Boolean read _GetgroupFormed write _SetgroupFormed;
    property groupOwnerAddress: JInetAddress read _GetgroupOwnerAddress write _SetgroupOwnerAddress;
    property isGroupOwner: Boolean read _GetisGroupOwner write _SetisGroupOwner;
  end;
  TJWifiP2pInfo = class(TJavaGenericImport<JWifiP2pInfoClass, JWifiP2pInfo>) end;

  JWifiP2pManagerClass = interface(JObjectClass)
    ['{5CFA2312-7CE2-43C5-9171-E5095050F14C}']
    {class} function _GetACTION_WIFI_P2P_REQUEST_RESPONSE_CHANGED: JString; cdecl;
    {class} function _GetBUSY: Integer; cdecl;
    {class} function _GetCONNECTION_REQUEST_ACCEPT: Integer; cdecl;
    {class} function _GetCONNECTION_REQUEST_DEFER_SHOW_PIN_TO_SERVICE: Integer; cdecl;
    {class} function _GetCONNECTION_REQUEST_DEFER_TO_SERVICE: Integer; cdecl;
    {class} function _GetCONNECTION_REQUEST_REJECT: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetEXTRA_DISCOVERY_STATE: JString; cdecl;
    {class} function _GetEXTRA_NETWORK_INFO: JString; cdecl;
    {class} function _GetEXTRA_P2P_DEVICE_LIST: JString; cdecl;
    {class} function _GetEXTRA_REQUEST_CONFIG: JString; cdecl;
    {class} function _GetEXTRA_REQUEST_RESPONSE: JString; cdecl;
    {class} function _GetEXTRA_WIFI_P2P_DEVICE: JString; cdecl;
    {class} function _GetEXTRA_WIFI_P2P_GROUP: JString; cdecl;
    {class} function _GetEXTRA_WIFI_P2P_INFO: JString; cdecl;
    {class} function _GetEXTRA_WIFI_STATE: JString; cdecl;
    {class} function _GetNO_SERVICE_REQUESTS: Integer; cdecl;
    {class} function _GetP2P_UNSUPPORTED: Integer; cdecl;
    {class} function _GetWIFI_P2P_CONNECTION_CHANGED_ACTION: JString; cdecl;
    {class} function _GetWIFI_P2P_DISCOVERY_CHANGED_ACTION: JString; cdecl;
    {class} function _GetWIFI_P2P_DISCOVERY_STARTED: Integer; cdecl;
    {class} function _GetWIFI_P2P_DISCOVERY_STOPPED: Integer; cdecl;
    {class} function _GetWIFI_P2P_PEERS_CHANGED_ACTION: JString; cdecl;
    {class} function _GetWIFI_P2P_STATE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetWIFI_P2P_STATE_DISABLED: Integer; cdecl;
    {class} function _GetWIFI_P2P_STATE_ENABLED: Integer; cdecl;
    {class} function _GetWIFI_P2P_THIS_DEVICE_CHANGED_ACTION: JString; cdecl;
    {class} function getP2pMaxAllowedVendorElementsLengthBytes: Integer; cdecl;
    {class} property ACTION_WIFI_P2P_REQUEST_RESPONSE_CHANGED: JString read _GetACTION_WIFI_P2P_REQUEST_RESPONSE_CHANGED;
    {class} property BUSY: Integer read _GetBUSY;
    {class} property CONNECTION_REQUEST_ACCEPT: Integer read _GetCONNECTION_REQUEST_ACCEPT;
    {class} property CONNECTION_REQUEST_DEFER_SHOW_PIN_TO_SERVICE: Integer read _GetCONNECTION_REQUEST_DEFER_SHOW_PIN_TO_SERVICE;
    {class} property CONNECTION_REQUEST_DEFER_TO_SERVICE: Integer read _GetCONNECTION_REQUEST_DEFER_TO_SERVICE;
    {class} property CONNECTION_REQUEST_REJECT: Integer read _GetCONNECTION_REQUEST_REJECT;
    {class} property ERROR: Integer read _GetERROR;
    {class} property EXTRA_DISCOVERY_STATE: JString read _GetEXTRA_DISCOVERY_STATE;
    {class} property EXTRA_NETWORK_INFO: JString read _GetEXTRA_NETWORK_INFO;
    {class} property EXTRA_P2P_DEVICE_LIST: JString read _GetEXTRA_P2P_DEVICE_LIST;
    {class} property EXTRA_REQUEST_CONFIG: JString read _GetEXTRA_REQUEST_CONFIG;
    {class} property EXTRA_REQUEST_RESPONSE: JString read _GetEXTRA_REQUEST_RESPONSE;
    {class} property EXTRA_WIFI_P2P_DEVICE: JString read _GetEXTRA_WIFI_P2P_DEVICE;
    {class} property EXTRA_WIFI_P2P_GROUP: JString read _GetEXTRA_WIFI_P2P_GROUP;
    {class} property EXTRA_WIFI_P2P_INFO: JString read _GetEXTRA_WIFI_P2P_INFO;
    {class} property EXTRA_WIFI_STATE: JString read _GetEXTRA_WIFI_STATE;
    {class} property NO_SERVICE_REQUESTS: Integer read _GetNO_SERVICE_REQUESTS;
    {class} property P2P_UNSUPPORTED: Integer read _GetP2P_UNSUPPORTED;
    {class} property WIFI_P2P_CONNECTION_CHANGED_ACTION: JString read _GetWIFI_P2P_CONNECTION_CHANGED_ACTION;
    {class} property WIFI_P2P_DISCOVERY_CHANGED_ACTION: JString read _GetWIFI_P2P_DISCOVERY_CHANGED_ACTION;
    {class} property WIFI_P2P_DISCOVERY_STARTED: Integer read _GetWIFI_P2P_DISCOVERY_STARTED;
    {class} property WIFI_P2P_DISCOVERY_STOPPED: Integer read _GetWIFI_P2P_DISCOVERY_STOPPED;
    {class} property WIFI_P2P_PEERS_CHANGED_ACTION: JString read _GetWIFI_P2P_PEERS_CHANGED_ACTION;
    {class} property WIFI_P2P_STATE_CHANGED_ACTION: JString read _GetWIFI_P2P_STATE_CHANGED_ACTION;
    {class} property WIFI_P2P_STATE_DISABLED: Integer read _GetWIFI_P2P_STATE_DISABLED;
    {class} property WIFI_P2P_STATE_ENABLED: Integer read _GetWIFI_P2P_STATE_ENABLED;
    {class} property WIFI_P2P_THIS_DEVICE_CHANGED_ACTION: JString read _GetWIFI_P2P_THIS_DEVICE_CHANGED_ACTION;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager')]
  JWifiP2pManager = interface(JObject)
    ['{BBB52E97-1661-4589-9567-CE7C9CE6A659}']
    procedure addExternalApprover(c: JWifiP2pManager_Channel; deviceAddress: JMacAddress; listener: JWifiP2pManager_ExternalApproverRequestListener); cdecl;
    procedure addLocalService(channel: JWifiP2pManager_Channel; servInfo: JWifiP2pServiceInfo; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure addServiceRequest(channel: JWifiP2pManager_Channel; req: JWifiP2pServiceRequest; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure cancelConnect(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure clearLocalServices(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure clearServiceRequests(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure connect(channel: JWifiP2pManager_Channel; config: JWifiP2pConfig; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure createGroup(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl; overload;
    procedure createGroup(channel: JWifiP2pManager_Channel; config: JWifiP2pConfig; listener: JWifiP2pManager_ActionListener); cdecl; overload;
    procedure discoverPeers(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure discoverPeersOnSocialChannels(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure discoverPeersOnSpecificFrequency(channel: JWifiP2pManager_Channel; frequencyMhz: Integer; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure discoverServices(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    //function initialize(srcContext: JContext; srcLooper: JLooper; listener: JWifiP2pManager_ChannelListener): JWifiP2pManager_Channel; cdecl;
    function isChannelConstrainedDiscoverySupported: Boolean; cdecl;
    function isGroupClientRemovalSupported: Boolean; cdecl;
    function isSetVendorElementsSupported: Boolean; cdecl;
    procedure removeClient(channel: JWifiP2pManager_Channel; peerAddress: JMacAddress; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure removeExternalApprover(c: JWifiP2pManager_Channel; deviceAddress: JMacAddress; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure removeGroup(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure removeLocalService(channel: JWifiP2pManager_Channel; servInfo: JWifiP2pServiceInfo; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure removeServiceRequest(channel: JWifiP2pManager_Channel; req: JWifiP2pServiceRequest; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure requestConnectionInfo(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ConnectionInfoListener); cdecl;
    procedure requestDeviceInfo(c: JWifiP2pManager_Channel; listener: JWifiP2pManager_DeviceInfoListener); cdecl;
    procedure requestDiscoveryState(c: JWifiP2pManager_Channel; listener: JWifiP2pManager_DiscoveryStateListener); cdecl;
    procedure requestGroupInfo(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_GroupInfoListener); cdecl;
    procedure requestNetworkInfo(c: JWifiP2pManager_Channel; listener: JWifiP2pManager_NetworkInfoListener); cdecl;
    procedure requestP2pState(c: JWifiP2pManager_Channel; listener: JWifiP2pManager_P2pStateListener); cdecl;
    procedure requestPeers(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_PeerListListener); cdecl;
    procedure setConnectionRequestResult(c: JWifiP2pManager_Channel; deviceAddress: JMacAddress; result: Integer; listener: JWifiP2pManager_ActionListener); cdecl; overload;
    procedure setConnectionRequestResult(c: JWifiP2pManager_Channel; deviceAddress: JMacAddress; result: Integer; pin: JString; listener: JWifiP2pManager_ActionListener); cdecl; overload;
    procedure setDnsSdResponseListeners(channel: JWifiP2pManager_Channel; servListener: JWifiP2pManager_DnsSdServiceResponseListener; txtListener: JWifiP2pManager_DnsSdTxtRecordListener); cdecl;
    procedure setServiceResponseListener(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ServiceResponseListener); cdecl;
    procedure setUpnpServiceResponseListener(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_UpnpServiceResponseListener); cdecl;
    procedure setVendorElements(c: JWifiP2pManager_Channel; vendorElements: JList; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure startListening(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure stopListening(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
    procedure stopPeerDiscovery(channel: JWifiP2pManager_Channel; listener: JWifiP2pManager_ActionListener); cdecl;
  end;
  TJWifiP2pManager = class(TJavaGenericImport<JWifiP2pManagerClass, JWifiP2pManager>) end;

  JWifiP2pManager_ActionListenerClass = interface(IJavaClass)
    ['{3AD00615-4939-47A4-B581-5DE0C6F47538}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$ActionListener')]
  JWifiP2pManager_ActionListener = interface(IJavaInstance)
    ['{B8864602-8BF3-40CE-8266-9697ED1A15A8}']
    procedure onFailure(reason: Integer); cdecl;
    procedure onSuccess; cdecl;
  end;
  TJWifiP2pManager_ActionListener = class(TJavaGenericImport<JWifiP2pManager_ActionListenerClass, JWifiP2pManager_ActionListener>) end;

  JWifiP2pManager_ChannelClass = interface(JObjectClass)
    ['{64B53A0B-FC52-44F2-83EB-00A6295BD465}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$Channel')]
  JWifiP2pManager_Channel = interface(JObject)
    ['{7B2371D8-425F-4749-A48A-2726F8DA17F9}']
    procedure close; cdecl;
  end;
  TJWifiP2pManager_Channel = class(TJavaGenericImport<JWifiP2pManager_ChannelClass, JWifiP2pManager_Channel>) end;

  JWifiP2pManager_ChannelListenerClass = interface(IJavaClass)
    ['{26D04B51-E7B1-47E7-ACE5-B05CA7FBC538}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$ChannelListener')]
  JWifiP2pManager_ChannelListener = interface(IJavaInstance)
    ['{9CA87220-9212-465A-92E4-020256D1451C}']
    procedure onChannelDisconnected; cdecl;
  end;
  TJWifiP2pManager_ChannelListener = class(TJavaGenericImport<JWifiP2pManager_ChannelListenerClass, JWifiP2pManager_ChannelListener>) end;

  JWifiP2pManager_ConnectionInfoListenerClass = interface(IJavaClass)
    ['{D5B27DFE-BBB6-4E6C-BA65-2A989D55C48E}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$ConnectionInfoListener')]
  JWifiP2pManager_ConnectionInfoListener = interface(IJavaInstance)
    ['{4F55CE0F-3E51-40F8-9F4E-5F550128AC9D}']
    procedure onConnectionInfoAvailable(info: JWifiP2pInfo); cdecl;
  end;
  TJWifiP2pManager_ConnectionInfoListener = class(TJavaGenericImport<JWifiP2pManager_ConnectionInfoListenerClass, JWifiP2pManager_ConnectionInfoListener>) end;

  JWifiP2pManager_DeviceInfoListenerClass = interface(IJavaClass)
    ['{9CA1F7F7-F978-481B-BA28-A8733B2E3D65}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$DeviceInfoListener')]
  JWifiP2pManager_DeviceInfoListener = interface(IJavaInstance)
    ['{7E47EDCA-AB1D-4E4F-8DF7-43949F20E0B8}']
    procedure onDeviceInfoAvailable(wifiP2pDevice: JWifiP2pDevice); cdecl;
  end;
  TJWifiP2pManager_DeviceInfoListener = class(TJavaGenericImport<JWifiP2pManager_DeviceInfoListenerClass, JWifiP2pManager_DeviceInfoListener>) end;

  JWifiP2pManager_DiscoveryStateListenerClass = interface(IJavaClass)
    ['{D4D4DC60-8C63-44CF-8D39-51867C5CC2ED}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$DiscoveryStateListener')]
  JWifiP2pManager_DiscoveryStateListener = interface(IJavaInstance)
    ['{886C40BD-6CF2-4774-8B15-555573FFD4A7}']
    procedure onDiscoveryStateAvailable(state: Integer); cdecl;
  end;
  TJWifiP2pManager_DiscoveryStateListener = class(TJavaGenericImport<JWifiP2pManager_DiscoveryStateListenerClass, JWifiP2pManager_DiscoveryStateListener>) end;

  JWifiP2pManager_DnsSdServiceResponseListenerClass = interface(IJavaClass)
    ['{DF15DDED-A4F6-48C9-B10B-528A2E9E45FC}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$DnsSdServiceResponseListener')]
  JWifiP2pManager_DnsSdServiceResponseListener = interface(IJavaInstance)
    ['{77AE336C-B73B-4A83-B292-BD854F84E10D}']
    procedure onDnsSdServiceAvailable(instanceName: JString; registrationType: JString; srcDevice: JWifiP2pDevice); cdecl;
  end;
  TJWifiP2pManager_DnsSdServiceResponseListener = class(TJavaGenericImport<JWifiP2pManager_DnsSdServiceResponseListenerClass, JWifiP2pManager_DnsSdServiceResponseListener>) end;

  JWifiP2pManager_DnsSdTxtRecordListenerClass = interface(IJavaClass)
    ['{3571DE02-6E77-4298-BDFF-067A51D8B0FC}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$DnsSdTxtRecordListener')]
  JWifiP2pManager_DnsSdTxtRecordListener = interface(IJavaInstance)
    ['{9F272607-82A1-4091-8838-31CD35F978D5}']
    procedure onDnsSdTxtRecordAvailable(fullDomainName: JString; txtRecordMap: JMap; srcDevice: JWifiP2pDevice); cdecl;
  end;
  TJWifiP2pManager_DnsSdTxtRecordListener = class(TJavaGenericImport<JWifiP2pManager_DnsSdTxtRecordListenerClass, JWifiP2pManager_DnsSdTxtRecordListener>) end;

  JWifiP2pManager_ExternalApproverRequestListenerClass = interface(IJavaClass)
    ['{4105D68F-3A26-40F6-ABE7-B7C8334BEC21}']
    {class} function _GetAPPROVER_DETACH_REASON_CLOSE: Integer; cdecl;
    {class} function _GetAPPROVER_DETACH_REASON_FAILURE: Integer; cdecl;
    {class} function _GetAPPROVER_DETACH_REASON_REMOVE: Integer; cdecl;
    {class} function _GetAPPROVER_DETACH_REASON_REPLACE: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_INVITATION: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_JOIN: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_NEGOTIATION: Integer; cdecl;
    {class} property APPROVER_DETACH_REASON_CLOSE: Integer read _GetAPPROVER_DETACH_REASON_CLOSE;
    {class} property APPROVER_DETACH_REASON_FAILURE: Integer read _GetAPPROVER_DETACH_REASON_FAILURE;
    {class} property APPROVER_DETACH_REASON_REMOVE: Integer read _GetAPPROVER_DETACH_REASON_REMOVE;
    {class} property APPROVER_DETACH_REASON_REPLACE: Integer read _GetAPPROVER_DETACH_REASON_REPLACE;
    {class} property REQUEST_TYPE_INVITATION: Integer read _GetREQUEST_TYPE_INVITATION;
    {class} property REQUEST_TYPE_JOIN: Integer read _GetREQUEST_TYPE_JOIN;
    {class} property REQUEST_TYPE_NEGOTIATION: Integer read _GetREQUEST_TYPE_NEGOTIATION;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$ExternalApproverRequestListener')]
  JWifiP2pManager_ExternalApproverRequestListener = interface(IJavaInstance)
    ['{2F8848F5-A6C4-40BD-96D5-7D3141E4BF93}']
    procedure onAttached(deviceAddress: JMacAddress); cdecl;
    procedure onConnectionRequested(requestType: Integer; config: JWifiP2pConfig; device: JWifiP2pDevice); cdecl;
    procedure onDetached(deviceAddress: JMacAddress; reason: Integer); cdecl;
    procedure onPinGenerated(deviceAddress: JMacAddress; pin: JString); cdecl;
  end;
  TJWifiP2pManager_ExternalApproverRequestListener = class(TJavaGenericImport<JWifiP2pManager_ExternalApproverRequestListenerClass, JWifiP2pManager_ExternalApproverRequestListener>) end;

  JWifiP2pManager_GroupInfoListenerClass = interface(IJavaClass)
    ['{29EC2167-C496-4C80-A422-F84B971F3DAA}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$GroupInfoListener')]
  JWifiP2pManager_GroupInfoListener = interface(IJavaInstance)
    ['{AE493F09-9C2C-4722-8D9A-4EE41EBC6207}']
    procedure onGroupInfoAvailable(group: JWifiP2pGroup); cdecl;
  end;
  TJWifiP2pManager_GroupInfoListener = class(TJavaGenericImport<JWifiP2pManager_GroupInfoListenerClass, JWifiP2pManager_GroupInfoListener>) end;

  JWifiP2pManager_NetworkInfoListenerClass = interface(IJavaClass)
    ['{B32AC2F1-7F76-4EDE-A9DB-4B92184F67CD}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$NetworkInfoListener')]
  JWifiP2pManager_NetworkInfoListener = interface(IJavaInstance)
    ['{4B45EE5C-FB42-4E99-B314-10C1EEF73684}']
    procedure onNetworkInfoAvailable(networkInfo: JNetworkInfo); cdecl;
  end;
  TJWifiP2pManager_NetworkInfoListener = class(TJavaGenericImport<JWifiP2pManager_NetworkInfoListenerClass, JWifiP2pManager_NetworkInfoListener>) end;

  JWifiP2pManager_P2pStateListenerClass = interface(IJavaClass)
    ['{801A7162-02FB-4013-91BF-AE02A1C0EE9F}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$P2pStateListener')]
  JWifiP2pManager_P2pStateListener = interface(IJavaInstance)
    ['{51F6E03B-A3A6-46A8-85E5-5C68567F9D6E}']
    procedure onP2pStateAvailable(state: Integer); cdecl;
  end;
  TJWifiP2pManager_P2pStateListener = class(TJavaGenericImport<JWifiP2pManager_P2pStateListenerClass, JWifiP2pManager_P2pStateListener>) end;

  JWifiP2pManager_PeerListListenerClass = interface(IJavaClass)
    ['{8E6C4B5B-BF16-4B48-89AF-13FD643C59CA}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$PeerListListener')]
  JWifiP2pManager_PeerListListener = interface(IJavaInstance)
    ['{EA3E1199-816E-4282-A416-63A503F53C51}']
    procedure onPeersAvailable(peers: JWifiP2pDeviceList); cdecl;
  end;
  TJWifiP2pManager_PeerListListener = class(TJavaGenericImport<JWifiP2pManager_PeerListListenerClass, JWifiP2pManager_PeerListListener>) end;

  JWifiP2pManager_ServiceResponseListenerClass = interface(IJavaClass)
    ['{A29A52CF-7E70-4B10-B93B-C46276009C23}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$ServiceResponseListener')]
  JWifiP2pManager_ServiceResponseListener = interface(IJavaInstance)
    ['{04BB3063-ADCD-40B7-A1DF-BEC996191CF5}']
    procedure onServiceAvailable(protocolType: Integer; responseData: TJavaArray<Byte>; srcDevice: JWifiP2pDevice); cdecl;
  end;
  TJWifiP2pManager_ServiceResponseListener = class(TJavaGenericImport<JWifiP2pManager_ServiceResponseListenerClass, JWifiP2pManager_ServiceResponseListener>) end;

  JWifiP2pManager_UpnpServiceResponseListenerClass = interface(IJavaClass)
    ['{3D411E85-C979-485B-AD2D-5897CFE85888}']
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pManager$UpnpServiceResponseListener')]
  JWifiP2pManager_UpnpServiceResponseListener = interface(IJavaInstance)
    ['{F393404C-A30A-4DC0-BF13-A72914318B52}']
    procedure onUpnpServiceAvailable(uniqueServiceNames: JList; srcDevice: JWifiP2pDevice); cdecl;
  end;
  TJWifiP2pManager_UpnpServiceResponseListener = class(TJavaGenericImport<JWifiP2pManager_UpnpServiceResponseListenerClass, JWifiP2pManager_UpnpServiceResponseListener>) end;

  JWifiP2pWfdInfoClass = interface(JObjectClass)
    ['{612285E2-EF18-40D4-A692-B5630FE3DDA8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDEVICE_INFO_AUDIO_ONLY_SUPPORT_AT_SOURCE: Integer; cdecl;
    {class} function _GetDEVICE_INFO_AUDIO_UNSUPPORTED_AT_PRIMARY_SINK: Integer; cdecl;
    {class} function _GetDEVICE_INFO_CONTENT_PROTECTION_SUPPORT: Integer; cdecl;
    {class} function _GetDEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SINK: Integer; cdecl;
    {class} function _GetDEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SOURCE: Integer; cdecl;
    {class} function _GetDEVICE_INFO_DEVICE_TYPE_MASK: Integer; cdecl;
    {class} function _GetDEVICE_INFO_PREFERRED_CONNECTIVITY_MASK: Integer; cdecl;
    {class} function _GetDEVICE_INFO_SESSION_AVAILABLE_MASK: Integer; cdecl;
    {class} function _GetDEVICE_INFO_TDLS_PERSISTENT_GROUP: Integer; cdecl;
    {class} function _GetDEVICE_INFO_TDLS_PERSISTENT_GROUP_REINVOKE: Integer; cdecl;
    {class} function _GetDEVICE_INFO_TIME_SYNCHRONIZATION_SUPPORT: Integer; cdecl;
    {class} function _GetDEVICE_INFO_WFD_SERVICE_DISCOVERY_SUPPORT: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_PRIMARY_SINK: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_SECONDARY_SINK: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_SOURCE_OR_PRIMARY_SINK: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_WFD_SOURCE: Integer; cdecl;
    {class} function _GetPREFERRED_CONNECTIVITY_P2P: Integer; cdecl;
    {class} function _GetPREFERRED_CONNECTIVITY_TDLS: Integer; cdecl;
    {class} function init: JWifiP2pWfdInfo; cdecl; overload;
    {class} function init(source: JWifiP2pWfdInfo): JWifiP2pWfdInfo; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DEVICE_INFO_AUDIO_ONLY_SUPPORT_AT_SOURCE: Integer read _GetDEVICE_INFO_AUDIO_ONLY_SUPPORT_AT_SOURCE;
    {class} property DEVICE_INFO_AUDIO_UNSUPPORTED_AT_PRIMARY_SINK: Integer read _GetDEVICE_INFO_AUDIO_UNSUPPORTED_AT_PRIMARY_SINK;
    {class} property DEVICE_INFO_CONTENT_PROTECTION_SUPPORT: Integer read _GetDEVICE_INFO_CONTENT_PROTECTION_SUPPORT;
    {class} property DEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SINK: Integer read _GetDEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SINK;
    {class} property DEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SOURCE: Integer read _GetDEVICE_INFO_COUPLED_SINK_SUPPORT_AT_SOURCE;
    {class} property DEVICE_INFO_DEVICE_TYPE_MASK: Integer read _GetDEVICE_INFO_DEVICE_TYPE_MASK;
    {class} property DEVICE_INFO_PREFERRED_CONNECTIVITY_MASK: Integer read _GetDEVICE_INFO_PREFERRED_CONNECTIVITY_MASK;
    {class} property DEVICE_INFO_SESSION_AVAILABLE_MASK: Integer read _GetDEVICE_INFO_SESSION_AVAILABLE_MASK;
    {class} property DEVICE_INFO_TDLS_PERSISTENT_GROUP: Integer read _GetDEVICE_INFO_TDLS_PERSISTENT_GROUP;
    {class} property DEVICE_INFO_TDLS_PERSISTENT_GROUP_REINVOKE: Integer read _GetDEVICE_INFO_TDLS_PERSISTENT_GROUP_REINVOKE;
    {class} property DEVICE_INFO_TIME_SYNCHRONIZATION_SUPPORT: Integer read _GetDEVICE_INFO_TIME_SYNCHRONIZATION_SUPPORT;
    {class} property DEVICE_INFO_WFD_SERVICE_DISCOVERY_SUPPORT: Integer read _GetDEVICE_INFO_WFD_SERVICE_DISCOVERY_SUPPORT;
    {class} property DEVICE_TYPE_PRIMARY_SINK: Integer read _GetDEVICE_TYPE_PRIMARY_SINK;
    {class} property DEVICE_TYPE_SECONDARY_SINK: Integer read _GetDEVICE_TYPE_SECONDARY_SINK;
    {class} property DEVICE_TYPE_SOURCE_OR_PRIMARY_SINK: Integer read _GetDEVICE_TYPE_SOURCE_OR_PRIMARY_SINK;
    {class} property DEVICE_TYPE_WFD_SOURCE: Integer read _GetDEVICE_TYPE_WFD_SOURCE;
    {class} property PREFERRED_CONNECTIVITY_P2P: Integer read _GetPREFERRED_CONNECTIVITY_P2P;
    {class} property PREFERRED_CONNECTIVITY_TDLS: Integer read _GetPREFERRED_CONNECTIVITY_TDLS;
  end;

  [JavaSignature('android/net/wifi/p2p/WifiP2pWfdInfo')]
  JWifiP2pWfdInfo = interface(JObject)
    ['{D9E0A36E-194A-4082-A84E-B32C33B133A8}']
    function describeContents: Integer; cdecl;
    function getControlPort: Integer; cdecl;
    function getDeviceInfo: Integer; cdecl;
    function getDeviceType: Integer; cdecl;
    function getMaxThroughput: Integer; cdecl;
    function getR2DeviceInfo: Integer; cdecl;
    function getR2DeviceType: Integer; cdecl;
    function isContentProtectionSupported: Boolean; cdecl;
    function isCoupledSinkSupportedAtSink: Boolean; cdecl;
    function isCoupledSinkSupportedAtSource: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isR2Supported: Boolean; cdecl;
    function isSessionAvailable: Boolean; cdecl;
    procedure setContentProtectionSupported(enabled: Boolean); cdecl;
    procedure setControlPort(port: Integer); cdecl;
    procedure setCoupledSinkSupportAtSink(enabled: Boolean); cdecl;
    procedure setCoupledSinkSupportAtSource(enabled: Boolean); cdecl;
    function setDeviceType(deviceType: Integer): Boolean; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    procedure setMaxThroughput(maxThroughput: Integer); cdecl;
    function setR2DeviceType(deviceType: Integer): Boolean; cdecl;
    procedure setSessionAvailable(enabled: Boolean); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWifiP2pWfdInfo = class(TJavaGenericImport<JWifiP2pWfdInfoClass, JWifiP2pWfdInfo>) end;

  JWifiP2pServiceInfoClass = interface(JObjectClass)
    ['{4B80F940-17A7-4465-91AF-55DBC7ABAC07}']
    {class} function _GetSERVICE_TYPE_ALL: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_BONJOUR: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_UPNP: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_VENDOR_SPECIFIC: Integer; cdecl;
    {class} property SERVICE_TYPE_ALL: Integer read _GetSERVICE_TYPE_ALL;
    {class} property SERVICE_TYPE_BONJOUR: Integer read _GetSERVICE_TYPE_BONJOUR;
    {class} property SERVICE_TYPE_UPNP: Integer read _GetSERVICE_TYPE_UPNP;
    {class} property SERVICE_TYPE_VENDOR_SPECIFIC: Integer read _GetSERVICE_TYPE_VENDOR_SPECIFIC;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pServiceInfo')]
  JWifiP2pServiceInfo = interface(JObject)
    ['{B6A5469F-3DC7-433C-B9A6-606E02D8AB45}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJWifiP2pServiceInfo = class(TJavaGenericImport<JWifiP2pServiceInfoClass, JWifiP2pServiceInfo>) end;

  JWifiP2pDnsSdServiceInfoClass = interface(JWifiP2pServiceInfoClass)
    ['{2A2827FF-7B46-422F-8724-43BC73C3F2CC}']
    {class} function newInstance(instanceName: JString; serviceType: JString; txtMap: JMap): JWifiP2pDnsSdServiceInfo; cdecl;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceInfo')]
  JWifiP2pDnsSdServiceInfo = interface(JWifiP2pServiceInfo)
    ['{D45C7279-6F15-461A-B3BF-9117D962DFA3}']
  end;
  TJWifiP2pDnsSdServiceInfo = class(TJavaGenericImport<JWifiP2pDnsSdServiceInfoClass, JWifiP2pDnsSdServiceInfo>) end;

  JWifiP2pServiceRequestClass = interface(JObjectClass)
    ['{414BAED5-AF35-4585-BE98-1D7196128792}']
    {class} function newInstance(protocolType: Integer; queryData: JString): JWifiP2pServiceRequest; cdecl; overload;
    {class} function newInstance(protocolType: Integer): JWifiP2pServiceRequest; cdecl; overload;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pServiceRequest')]
  JWifiP2pServiceRequest = interface(JObject)
    ['{46EC5CA0-626B-45C7-A383-6B5E2B87DCE2}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJWifiP2pServiceRequest = class(TJavaGenericImport<JWifiP2pServiceRequestClass, JWifiP2pServiceRequest>) end;

  JWifiP2pDnsSdServiceRequestClass = interface(JWifiP2pServiceRequestClass)
    ['{653F2652-7FAE-495C-8642-A5716FD93CD7}']
    {class} function newInstance: JWifiP2pDnsSdServiceRequest; cdecl; overload;
    {class} function newInstance(serviceType: JString): JWifiP2pDnsSdServiceRequest; cdecl; overload;
    {class} function newInstance(instanceName: JString; serviceType: JString): JWifiP2pDnsSdServiceRequest; cdecl; overload;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceRequest')]
  JWifiP2pDnsSdServiceRequest = interface(JWifiP2pServiceRequest)
    ['{0512A2E8-9545-41C3-8E6A-906C67AF2B21}']
  end;
  TJWifiP2pDnsSdServiceRequest = class(TJavaGenericImport<JWifiP2pDnsSdServiceRequestClass, JWifiP2pDnsSdServiceRequest>) end;

  JWifiP2pUpnpServiceInfoClass = interface(JWifiP2pServiceInfoClass)
    ['{C28ED2C4-0436-4EF5-82F2-306A35B0A0AE}']
    {class} function newInstance(uuid: JString; device: JString; services: JList): JWifiP2pUpnpServiceInfo; cdecl;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pUpnpServiceInfo')]
  JWifiP2pUpnpServiceInfo = interface(JWifiP2pServiceInfo)
    ['{2A62D732-7ED7-4A5F-8423-BD92091D384B}']
  end;
  TJWifiP2pUpnpServiceInfo = class(TJavaGenericImport<JWifiP2pUpnpServiceInfoClass, JWifiP2pUpnpServiceInfo>) end;

  JWifiP2pUpnpServiceRequestClass = interface(JWifiP2pServiceRequestClass)
    ['{52AAD8A3-3D84-4A6A-B8D3-19C33C9ADEBC}']
    {class} function newInstance: JWifiP2pUpnpServiceRequest; cdecl; overload;
    {class} function newInstance(st: JString): JWifiP2pUpnpServiceRequest; cdecl; overload;
  end;

  [JavaSignature('android/net/wifi/p2p/nsd/WifiP2pUpnpServiceRequest')]
  JWifiP2pUpnpServiceRequest = interface(JWifiP2pServiceRequest)
    ['{F884C7CB-175F-46B2-B9FD-E0336737535C}']
  end;
  TJWifiP2pUpnpServiceRequest = class(TJavaGenericImport<JWifiP2pUpnpServiceRequestClass, JWifiP2pUpnpServiceRequest>) end;

  JCivicLocationKeysClass = interface(JObjectClass)
    ['{F9315F21-7E33-42C4-BDF5-97B8AAB4C29D}']
    {class} function _GetADDITIONAL_CODE: Integer; cdecl;
    {class} function _GetAPT: Integer; cdecl;
    {class} function _GetBOROUGH: Integer; cdecl;
    {class} function _GetBRANCH_ROAD_NAME: Integer; cdecl;
    {class} function _GetBUILDING: Integer; cdecl;
    {class} function _GetCITY: Integer; cdecl;
    {class} function _GetCOUNTY: Integer; cdecl;
    {class} function _GetDESK: Integer; cdecl;
    {class} function _GetFLOOR: Integer; cdecl;
    {class} function _GetGROUP_OF_STREETS: Integer; cdecl;
    {class} function _GetHNO: Integer; cdecl;
    {class} function _GetHNS: Integer; cdecl;
    {class} function _GetLANGUAGE: Integer; cdecl;
    {class} function _GetLMK: Integer; cdecl;
    {class} function _GetLOC: Integer; cdecl;
    {class} function _GetNAM: Integer; cdecl;
    {class} function _GetNEIGHBORHOOD: Integer; cdecl;
    {class} function _GetPCN: Integer; cdecl;
    {class} function _GetPOD: Integer; cdecl;
    {class} function _GetPOSTAL_CODE: Integer; cdecl;
    {class} function _GetPO_BOX: Integer; cdecl;
    {class} function _GetPRD: Integer; cdecl;
    {class} function _GetPRIMARY_ROAD_NAME: Integer; cdecl;
    {class} function _GetROAD_SECTION: Integer; cdecl;
    {class} function _GetROOM: Integer; cdecl;
    {class} function _GetSCRIPT: Integer; cdecl;
    {class} function _GetSTATE: Integer; cdecl;
    {class} function _GetSTREET_NAME_POST_MODIFIER: Integer; cdecl;
    {class} function _GetSTREET_NAME_PRE_MODIFIER: Integer; cdecl;
    {class} function _GetSTS: Integer; cdecl;
    {class} function _GetSUBBRANCH_ROAD_NAME: Integer; cdecl;
    {class} function _GetTYPE_OF_PLACE: Integer; cdecl;
    {class} property ADDITIONAL_CODE: Integer read _GetADDITIONAL_CODE;
    {class} property APT: Integer read _GetAPT;
    {class} property BOROUGH: Integer read _GetBOROUGH;
    {class} property BRANCH_ROAD_NAME: Integer read _GetBRANCH_ROAD_NAME;
    {class} property BUILDING: Integer read _GetBUILDING;
    {class} property CITY: Integer read _GetCITY;
    {class} property COUNTY: Integer read _GetCOUNTY;
    {class} property DESK: Integer read _GetDESK;
    {class} property FLOOR: Integer read _GetFLOOR;
    {class} property GROUP_OF_STREETS: Integer read _GetGROUP_OF_STREETS;
    {class} property HNO: Integer read _GetHNO;
    {class} property HNS: Integer read _GetHNS;
    {class} property LANGUAGE: Integer read _GetLANGUAGE;
    {class} property LMK: Integer read _GetLMK;
    {class} property LOC: Integer read _GetLOC;
    {class} property NAM: Integer read _GetNAM;
    {class} property NEIGHBORHOOD: Integer read _GetNEIGHBORHOOD;
    {class} property PCN: Integer read _GetPCN;
    {class} property POD: Integer read _GetPOD;
    {class} property POSTAL_CODE: Integer read _GetPOSTAL_CODE;
    {class} property PO_BOX: Integer read _GetPO_BOX;
    {class} property PRD: Integer read _GetPRD;
    {class} property PRIMARY_ROAD_NAME: Integer read _GetPRIMARY_ROAD_NAME;
    {class} property ROAD_SECTION: Integer read _GetROAD_SECTION;
    {class} property ROOM: Integer read _GetROOM;
    {class} property SCRIPT: Integer read _GetSCRIPT;
    {class} property STATE: Integer read _GetSTATE;
    {class} property STREET_NAME_POST_MODIFIER: Integer read _GetSTREET_NAME_POST_MODIFIER;
    {class} property STREET_NAME_PRE_MODIFIER: Integer read _GetSTREET_NAME_PRE_MODIFIER;
    {class} property STS: Integer read _GetSTS;
    {class} property SUBBRANCH_ROAD_NAME: Integer read _GetSUBBRANCH_ROAD_NAME;
    {class} property TYPE_OF_PLACE: Integer read _GetTYPE_OF_PLACE;
  end;

  [JavaSignature('android/net/wifi/rtt/CivicLocationKeys')]
  JCivicLocationKeys = interface(JObject)
    ['{2707440D-4934-41CF-9248-78D6CDFE1E54}']
  end;
  TJCivicLocationKeys = class(TJavaGenericImport<JCivicLocationKeysClass, JCivicLocationKeys>) end;

  JRangingRequestClass = interface(JObjectClass)
    ['{F2E45AD8-2DFE-4FD9-A868-E9A55D32CCF7}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function getDefaultRttBurstSize: Integer; cdecl;
    {class} function getMaxPeers: Integer; cdecl;
    {class} function getMaxRttBurstSize: Integer; cdecl;
    {class} function getMinRttBurstSize: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/rtt/RangingRequest')]
  JRangingRequest = interface(JObject)
    ['{31CCB7D9-DCDF-491B-BC1B-E2525BE9C0A4}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getRttBurstSize: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRangingRequest = class(TJavaGenericImport<JRangingRequestClass, JRangingRequest>) end;

  JRangingRequest_BuilderClass = interface(JObjectClass)
    ['{4B9131AB-E014-49C6-88F8-2626C91B99B4}']
    {class} function init: JRangingRequest_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/rtt/RangingRequest$Builder')]
  JRangingRequest_Builder = interface(JObject)
    ['{2EFD2898-8765-4F7C-B7DA-EB8302E0A0D4}']
    function addAccessPoint(apInfo: JScanResult): JRangingRequest_Builder; cdecl;
    function addAccessPoints(apInfos: JList): JRangingRequest_Builder; cdecl;
    function addNon80211mcCapableAccessPoint(apInfo: JScanResult): JRangingRequest_Builder; cdecl;
    function addNon80211mcCapableAccessPoints(apInfos: JList): JRangingRequest_Builder; cdecl;
    function addResponder(responder: JResponderConfig): JRangingRequest_Builder; cdecl;
    function addResponders(responders: JList): JRangingRequest_Builder; cdecl;
    function addWifiAwarePeer(peerMacAddress: JMacAddress): JRangingRequest_Builder; cdecl; overload;
    function addWifiAwarePeer(peerHandle: JPeerHandle): JRangingRequest_Builder; cdecl; overload;
    function build: JRangingRequest; cdecl;
    function setRttBurstSize(rttBurstSize: Integer): JRangingRequest_Builder; cdecl;
  end;
  TJRangingRequest_Builder = class(TJavaGenericImport<JRangingRequest_BuilderClass, JRangingRequest_Builder>) end;

  JRangingResultClass = interface(JObjectClass)
    ['{EB675D6A-3319-48B3-9404-4A2AE6D69923}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSTATUS_FAIL: Integer; cdecl;
    {class} function _GetSTATUS_RESPONDER_DOES_NOT_SUPPORT_IEEE80211MC: Integer; cdecl;
    {class} function _GetSTATUS_SUCCESS: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property STATUS_FAIL: Integer read _GetSTATUS_FAIL;
    {class} property STATUS_RESPONDER_DOES_NOT_SUPPORT_IEEE80211MC: Integer read _GetSTATUS_RESPONDER_DOES_NOT_SUPPORT_IEEE80211MC;
    {class} property STATUS_SUCCESS: Integer read _GetSTATUS_SUCCESS;
  end;

  [JavaSignature('android/net/wifi/rtt/RangingResult')]
  JRangingResult = interface(JObject)
    ['{19C6E3D7-AD16-4194-A181-695F3283FE6D}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDistanceMm: Integer; cdecl;
    function getDistanceStdDevMm: Integer; cdecl;
    function getMacAddress: JMacAddress; cdecl;
    function getNumAttemptedMeasurements: Integer; cdecl;
    function getNumSuccessfulMeasurements: Integer; cdecl;
    function getPeerHandle: JPeerHandle; cdecl;
    function getRangingTimestampMillis: Int64; cdecl;
    function getRssi: Integer; cdecl;
    function getStatus: Integer; cdecl;
    function getUnverifiedResponderLocation: JResponderLocation; cdecl;
    function hashCode: Integer; cdecl;
    function is80211mcMeasurement: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRangingResult = class(TJavaGenericImport<JRangingResultClass, JRangingResult>) end;

  JRangingResultCallbackClass = interface(JObjectClass)
    ['{220F4A37-342D-4217-9599-57C397EFF0B0}']
    {class} function _GetSTATUS_CODE_FAIL: Integer; cdecl;
    {class} function _GetSTATUS_CODE_FAIL_RTT_NOT_AVAILABLE: Integer; cdecl;
    {class} function init: JRangingResultCallback; cdecl;
    {class} property STATUS_CODE_FAIL: Integer read _GetSTATUS_CODE_FAIL;
    {class} property STATUS_CODE_FAIL_RTT_NOT_AVAILABLE: Integer read _GetSTATUS_CODE_FAIL_RTT_NOT_AVAILABLE;
  end;

  [JavaSignature('android/net/wifi/rtt/RangingResultCallback')]
  JRangingResultCallback = interface(JObject)
    ['{9D66DEB0-15F4-493D-AEBD-6D3E247B14CE}']
    procedure onRangingFailure(code: Integer); cdecl;
    procedure onRangingResults(results: JList); cdecl;
  end;
  TJRangingResultCallback = class(TJavaGenericImport<JRangingResultCallbackClass, JRangingResultCallback>) end;

  JResponderConfigClass = interface(JObjectClass)
    ['{31FA50A6-1A9D-49D6-9A12-A9CC1B3AC24D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function fromScanResult(scanResult: JScanResult): JResponderConfig; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/net/wifi/rtt/ResponderConfig')]
  JResponderConfig = interface(JObject)
    ['{4B62D119-E83C-41C1-A055-2C48332C6768}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getCenterFreq0Mhz: Integer; cdecl;
    function getCenterFreq1Mhz: Integer; cdecl;
    function getChannelWidth: Integer; cdecl;
    function getFrequencyMhz: Integer; cdecl;
    function getMacAddress: JMacAddress; cdecl;
    function getPreamble: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function is80211mcSupported: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJResponderConfig = class(TJavaGenericImport<JResponderConfigClass, JResponderConfig>) end;

  JResponderConfig_BuilderClass = interface(JObjectClass)
    ['{DAF4E46F-B1CA-4051-B343-9BD49EA90821}']
    {class} function init: JResponderConfig_Builder; cdecl;
  end;

  [JavaSignature('android/net/wifi/rtt/ResponderConfig$Builder')]
  JResponderConfig_Builder = interface(JObject)
    ['{75912051-D80A-4A8B-84AB-836A59971839}']
    function build: JResponderConfig; cdecl;
    function set80211mcSupported(supports80211mc: Boolean): JResponderConfig_Builder; cdecl;
    function setCenterFreq0Mhz(centerFreq0: Integer): JResponderConfig_Builder; cdecl;
    function setCenterFreq1Mhz(centerFreq1: Integer): JResponderConfig_Builder; cdecl;
    function setChannelWidth(channelWidth: Integer): JResponderConfig_Builder; cdecl;
    function setFrequencyMhz(frequency: Integer): JResponderConfig_Builder; cdecl;
    function setMacAddress(macAddress: JMacAddress): JResponderConfig_Builder; cdecl;
    function setPreamble(preamble: Integer): JResponderConfig_Builder; cdecl;
  end;
  TJResponderConfig_Builder = class(TJavaGenericImport<JResponderConfig_BuilderClass, JResponderConfig_Builder>) end;

  JResponderLocationClass = interface(JObjectClass)
    ['{2FD32DD3-0B6F-41EE-92AC-AEC5CA45D112}']
    {class} function _GetALTITUDE_FLOORS: Integer; cdecl;
    {class} function _GetALTITUDE_METERS: Integer; cdecl;
    {class} function _GetALTITUDE_UNDEFINED: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDATUM_NAD83_MLLW: Integer; cdecl;
    {class} function _GetDATUM_NAD83_NAV88: Integer; cdecl;
    {class} function _GetDATUM_UNDEFINED: Integer; cdecl;
    {class} function _GetDATUM_WGS84: Integer; cdecl;
    {class} function _GetLCI_VERSION_1: Integer; cdecl;
    {class} function _GetLOCATION_FIXED: Integer; cdecl;
    {class} function _GetLOCATION_MOVEMENT_UNKNOWN: Integer; cdecl;
    {class} function _GetLOCATION_RESERVED: Integer; cdecl;
    {class} function _GetLOCATION_VARIABLE: Integer; cdecl;
    {class} property ALTITUDE_FLOORS: Integer read _GetALTITUDE_FLOORS;
    {class} property ALTITUDE_METERS: Integer read _GetALTITUDE_METERS;
    {class} property ALTITUDE_UNDEFINED: Integer read _GetALTITUDE_UNDEFINED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DATUM_NAD83_MLLW: Integer read _GetDATUM_NAD83_MLLW;
    {class} property DATUM_NAD83_NAV88: Integer read _GetDATUM_NAD83_NAV88;
    {class} property DATUM_UNDEFINED: Integer read _GetDATUM_UNDEFINED;
    {class} property DATUM_WGS84: Integer read _GetDATUM_WGS84;
    {class} property LCI_VERSION_1: Integer read _GetLCI_VERSION_1;
    {class} property LOCATION_FIXED: Integer read _GetLOCATION_FIXED;
    {class} property LOCATION_MOVEMENT_UNKNOWN: Integer read _GetLOCATION_MOVEMENT_UNKNOWN;
    {class} property LOCATION_RESERVED: Integer read _GetLOCATION_RESERVED;
    {class} property LOCATION_VARIABLE: Integer read _GetLOCATION_VARIABLE;
  end;

  [JavaSignature('android/net/wifi/rtt/ResponderLocation')]
  JResponderLocation = interface(JObject)
    ['{C983C95D-6636-46A8-9F67-62DE6D116FC7}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAltitude: Double; cdecl;
    function getAltitudeType: Integer; cdecl;
    function getAltitudeUncertainty: Double; cdecl;
    function getColocatedBssids: JList; cdecl;
    function getDatum: Integer; cdecl;
    function getExpectedToMove: Integer; cdecl;
    function getFloorNumber: Double; cdecl;
    function getHeightAboveFloorMeters: Double; cdecl;
    function getHeightAboveFloorUncertaintyMeters: Double; cdecl;
    function getLatitude: Double; cdecl;
    function getLatitudeUncertainty: Double; cdecl;
    function getLciVersion: Integer; cdecl;
    function getLongitude: Double; cdecl;
    function getLongitudeUncertainty: Double; cdecl;
    function getMapImageMimeType: JString; cdecl;
    function getMapImageUri: Jnet_Uri; cdecl;
    function getRegisteredLocationAgreementIndication: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isLciSubelementValid: Boolean; cdecl;
    function isZaxisSubelementValid: Boolean; cdecl;
    //function toCivicLocationAddress: JAddress; cdecl;
    function toCivicLocationSparseArray: JSparseArray; cdecl;
    //function toLocation: JLocation; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJResponderLocation = class(TJavaGenericImport<JResponderLocationClass, JResponderLocation>) end;

  JWifiRttManagerClass = interface(JObjectClass)
    ['{FF2C7A69-42CA-4C79-A412-C304E190F317}']
    {class} function _GetACTION_WIFI_RTT_STATE_CHANGED: JString; cdecl;
    {class} property ACTION_WIFI_RTT_STATE_CHANGED: JString read _GetACTION_WIFI_RTT_STATE_CHANGED;
  end;

  [JavaSignature('android/net/wifi/rtt/WifiRttManager')]
  JWifiRttManager = interface(JObject)
    ['{5CF4A1A7-A1F8-4689-B967-BFCD015F4F21}']
    function isAvailable: Boolean; cdecl;
    procedure startRanging(request: JRangingRequest; executor: JExecutor; callback: JRangingResultCallback); cdecl;
  end;
  TJWifiRttManager = class(TJavaGenericImport<JWifiRttManagerClass, JWifiRttManager>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCaptivePortal', TypeInfo(Androidapi.JNI.Net.JCaptivePortal));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityDiagnosticsManager', TypeInfo(Androidapi.JNI.Net.JConnectivityDiagnosticsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback', TypeInfo(Androidapi.JNI.Net.JConnectivityDiagnosticsManager_ConnectivityDiagnosticsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityDiagnosticsManager_ConnectivityReport', TypeInfo(Androidapi.JNI.Net.JConnectivityDiagnosticsManager_ConnectivityReport));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityDiagnosticsManager_DataStallReport', TypeInfo(Androidapi.JNI.Net.JConnectivityDiagnosticsManager_DataStallReport));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityManager', TypeInfo(Androidapi.JNI.Net.JConnectivityManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityManager_NetworkCallback', TypeInfo(Androidapi.JNI.Net.JConnectivityManager_NetworkCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConnectivityManager_OnNetworkActiveListener', TypeInfo(Androidapi.JNI.Net.JConnectivityManager_OnNetworkActiveListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.Jnet_Credentials', TypeInfo(Androidapi.JNI.Net.Jnet_Credentials));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDhcpInfo', TypeInfo(Androidapi.JNI.Net.JDhcpInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDnsResolver', TypeInfo(Androidapi.JNI.Net.JDnsResolver));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDnsResolver_Callback', TypeInfo(Androidapi.JNI.Net.JDnsResolver_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDnsResolver_DnsException', TypeInfo(Androidapi.JNI.Net.JDnsResolver_DnsException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkSpecifier', TypeInfo(Androidapi.JNI.Net.JNetworkSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEthernetNetworkSpecifier', TypeInfo(Androidapi.JNI.Net.JEthernetNetworkSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPlatformVpnProfile', TypeInfo(Androidapi.JNI.Net.JPlatformVpnProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkev2VpnProfile', TypeInfo(Androidapi.JNI.Net.JIkev2VpnProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkev2VpnProfile_Builder', TypeInfo(Androidapi.JNI.Net.JIkev2VpnProfile_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JInetAddresses', TypeInfo(Androidapi.JNI.Net.JInetAddresses));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpConfiguration', TypeInfo(Androidapi.JNI.Net.JIpConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpConfiguration_Builder', TypeInfo(Androidapi.JNI.Net.JIpConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpPrefix', TypeInfo(Androidapi.JNI.Net.JIpPrefix));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecAlgorithm', TypeInfo(Androidapi.JNI.Net.JIpSecAlgorithm));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecManager', TypeInfo(Androidapi.JNI.Net.JIpSecManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecManager_ResourceUnavailableException', TypeInfo(Androidapi.JNI.Net.JIpSecManager_ResourceUnavailableException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecManager_SecurityParameterIndex', TypeInfo(Androidapi.JNI.Net.JIpSecManager_SecurityParameterIndex));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecManager_SpiUnavailableException', TypeInfo(Androidapi.JNI.Net.JIpSecManager_SpiUnavailableException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecManager_UdpEncapsulationSocket', TypeInfo(Androidapi.JNI.Net.JIpSecManager_UdpEncapsulationSocket));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecTransform', TypeInfo(Androidapi.JNI.Net.JIpSecTransform));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIpSecTransform_Builder', TypeInfo(Androidapi.JNI.Net.JIpSecTransform_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLinkAddress', TypeInfo(Androidapi.JNI.Net.JLinkAddress));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLinkProperties', TypeInfo(Androidapi.JNI.Net.JLinkProperties));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLocalServerSocket', TypeInfo(Androidapi.JNI.Net.JLocalServerSocket));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLocalSocket', TypeInfo(Androidapi.JNI.Net.JLocalSocket));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLocalSocketAddress', TypeInfo(Androidapi.JNI.Net.JLocalSocketAddress));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JLocalSocketAddress_Namespace', TypeInfo(Androidapi.JNI.Net.JLocalSocketAddress_Namespace));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JMacAddress', TypeInfo(Androidapi.JNI.Net.JMacAddress));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JMailTo', TypeInfo(Androidapi.JNI.Net.JMailTo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetwork', TypeInfo(Androidapi.JNI.Net.JNetwork));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkBadging', TypeInfo(Androidapi.JNI.Net.JNetworkBadging));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkBadging_Badging', TypeInfo(Androidapi.JNI.Net.JNetworkBadging_Badging));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkCapabilities', TypeInfo(Androidapi.JNI.Net.JNetworkCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkInfo', TypeInfo(Androidapi.JNI.Net.JNetworkInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkInfo_DetailedState', TypeInfo(Androidapi.JNI.Net.JNetworkInfo_DetailedState));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkInfo_State', TypeInfo(Androidapi.JNI.Net.JNetworkInfo_State));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkRequest', TypeInfo(Androidapi.JNI.Net.JNetworkRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNetworkRequest_Builder', TypeInfo(Androidapi.JNI.Net.JNetworkRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.Jnet_ParseException', TypeInfo(Androidapi.JNI.Net.Jnet_ParseException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.Jnet_Proxy', TypeInfo(Androidapi.JNI.Net.Jnet_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JProxyInfo', TypeInfo(Androidapi.JNI.Net.JProxyInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.Jnet_RouteInfo', TypeInfo(Androidapi.JNI.Net.Jnet_RouteInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSSLCertificateSocketFactory', TypeInfo(Androidapi.JNI.Net.JSSLCertificateSocketFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSSLSessionCache', TypeInfo(Androidapi.JNI.Net.JSSLSessionCache));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSocketKeepalive', TypeInfo(Androidapi.JNI.Net.JSocketKeepalive));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSocketKeepalive_Callback', TypeInfo(Androidapi.JNI.Net.JSocketKeepalive_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JStaticIpConfiguration', TypeInfo(Androidapi.JNI.Net.JStaticIpConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JStaticIpConfiguration_Builder', TypeInfo(Androidapi.JNI.Net.JStaticIpConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTelephonyNetworkSpecifier', TypeInfo(Androidapi.JNI.Net.JTelephonyNetworkSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTelephonyNetworkSpecifier_Builder', TypeInfo(Androidapi.JNI.Net.JTelephonyNetworkSpecifier_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTrafficStats', TypeInfo(Androidapi.JNI.Net.JTrafficStats));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTransportInfo', TypeInfo(Androidapi.JNI.Net.JTransportInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.Jnet_Uri', TypeInfo(Androidapi.JNI.Net.Jnet_Uri));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JUri_Builder', TypeInfo(Androidapi.JNI.Net.JUri_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JUrlQuerySanitizer', TypeInfo(Androidapi.JNI.Net.JUrlQuerySanitizer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JUrlQuerySanitizer_IllegalCharacterValueSanitizer', TypeInfo(Androidapi.JNI.Net.JUrlQuerySanitizer_IllegalCharacterValueSanitizer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JUrlQuerySanitizer_ParameterValuePair', TypeInfo(Androidapi.JNI.Net.JUrlQuerySanitizer_ParameterValuePair));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JUrlQuerySanitizer_ValueSanitizer', TypeInfo(Androidapi.JNI.Net.JUrlQuerySanitizer_ValueSanitizer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVpnManager', TypeInfo(Androidapi.JNI.Net.JVpnManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVpnProfileState', TypeInfo(Androidapi.JNI.Net.JVpnProfileState));
  //TRegTypes.RegisterType('Androidapi.JNI.Net.JVpnService', TypeInfo(Androidapi.JNI.Net.JVpnService));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVpnService_Builder', TypeInfo(Androidapi.JNI.Net.JVpnService_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapInfo', TypeInfo(Androidapi.JNI.Net.JEapInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapAkaInfo', TypeInfo(Androidapi.JNI.Net.JEapAkaInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapAkaInfo_Builder', TypeInfo(Androidapi.JNI.Net.JEapAkaInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_Builder', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapAkaConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapAkaConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapAkaOption', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapAkaOption));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapAkaOption_Builder', TypeInfo(Androidapi.JNI.Net.JEapAkaOption_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapAkaPrimeConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapAkaPrimeConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapMethodConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapMethodConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapMsChapV2Config', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapMsChapV2Config));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapSimConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapSimConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEapSessionConfig_EapTtlsConfig', TypeInfo(Androidapi.JNI.Net.JEapSessionConfig_EapTtlsConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JHttpResponseCache', TypeInfo(Androidapi.JNI.Net.JHttpResponseCache));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSslCertificate', TypeInfo(Androidapi.JNI.Net.JSslCertificate));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSslCertificate_DName', TypeInfo(Androidapi.JNI.Net.JSslCertificate_DName));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSslError', TypeInfo(Androidapi.JNI.Net.JSslError));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JX509TrustManagerExtensions', TypeInfo(Androidapi.JNI.Net.JX509TrustManagerExtensions));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSaProposal', TypeInfo(Androidapi.JNI.Net.JSaProposal));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSaProposal', TypeInfo(Androidapi.JNI.Net.JChildSaProposal));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSaProposal_Builder', TypeInfo(Androidapi.JNI.Net.JChildSaProposal_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSessionCallback', TypeInfo(Androidapi.JNI.Net.JChildSessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSessionConfiguration', TypeInfo(Androidapi.JNI.Net.JChildSessionConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSessionConfiguration_Builder', TypeInfo(Androidapi.JNI.Net.JChildSessionConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JChildSessionParams', TypeInfo(Androidapi.JNI.Net.JChildSessionParams));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeIdentification', TypeInfo(Androidapi.JNI.Net.JIkeIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeDerAsn1DnIdentification', TypeInfo(Androidapi.JNI.Net.JIkeDerAsn1DnIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeFqdnIdentification', TypeInfo(Androidapi.JNI.Net.JIkeFqdnIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeIpv4AddrIdentification', TypeInfo(Androidapi.JNI.Net.JIkeIpv4AddrIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeIpv6AddrIdentification', TypeInfo(Androidapi.JNI.Net.JIkeIpv6AddrIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeKeyIdIdentification', TypeInfo(Androidapi.JNI.Net.JIkeKeyIdIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeRfc822AddrIdentification', TypeInfo(Androidapi.JNI.Net.JIkeRfc822AddrIdentification));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSaProposal', TypeInfo(Androidapi.JNI.Net.JIkeSaProposal));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSaProposal_Builder', TypeInfo(Androidapi.JNI.Net.JIkeSaProposal_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSession', TypeInfo(Androidapi.JNI.Net.JIkeSession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionCallback', TypeInfo(Androidapi.JNI.Net.JIkeSessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionConfiguration', TypeInfo(Androidapi.JNI.Net.JIkeSessionConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionConfiguration_Builder', TypeInfo(Androidapi.JNI.Net.JIkeSessionConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionConnectionInfo', TypeInfo(Androidapi.JNI.Net.JIkeSessionConnectionInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_Builder', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_IkeAuthConfig', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_IkeAuthConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_IkeAuthDigitalSignLocalConfig', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_IkeAuthDigitalSignLocalConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_IkeAuthDigitalSignRemoteConfig', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_IkeAuthDigitalSignRemoteConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_IkeAuthEapConfig', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_IkeAuthEapConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeSessionParams_IkeAuthPskConfig', TypeInfo(Androidapi.JNI.Net.JIkeSessionParams_IkeAuthPskConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeTrafficSelector', TypeInfo(Androidapi.JNI.Net.JIkeTrafficSelector));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeTunnelConnectionParams', TypeInfo(Androidapi.JNI.Net.JIkeTunnelConnectionParams));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTransportModeChildSessionParams', TypeInfo(Androidapi.JNI.Net.JTransportModeChildSessionParams));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTransportModeChildSessionParams_Builder', TypeInfo(Androidapi.JNI.Net.JTransportModeChildSessionParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_Builder', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_TunnelModeChildConfigRequest', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_TunnelModeChildConfigRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4Address', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4Address));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4DhcpServer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4DnsServer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4Netmask', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv4Netmask));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv6Address', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv6Address));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer', TypeInfo(Androidapi.JNI.Net.JTunnelModeChildSessionParams_ConfigRequestIpv6DnsServer));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeException', TypeInfo(Androidapi.JNI.Net.JIkeException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeNonProtocolException', TypeInfo(Androidapi.JNI.Net.JIkeNonProtocolException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeIOException', TypeInfo(Androidapi.JNI.Net.JIkeIOException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeInternalException', TypeInfo(Androidapi.JNI.Net.JIkeInternalException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeNetworkLostException', TypeInfo(Androidapi.JNI.Net.JIkeNetworkLostException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeProtocolException', TypeInfo(Androidapi.JNI.Net.JIkeProtocolException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIkeTimeoutException', TypeInfo(Androidapi.JNI.Net.JIkeTimeoutException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JInvalidKeException', TypeInfo(Androidapi.JNI.Net.JInvalidKeException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JInvalidMajorVersionException', TypeInfo(Androidapi.JNI.Net.JInvalidMajorVersionException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JInvalidSelectorsException', TypeInfo(Androidapi.JNI.Net.JInvalidSelectorsException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNsdManager', TypeInfo(Androidapi.JNI.Net.JNsdManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNsdManager_DiscoveryListener', TypeInfo(Androidapi.JNI.Net.JNsdManager_DiscoveryListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNsdManager_RegistrationListener', TypeInfo(Androidapi.JNI.Net.JNsdManager_RegistrationListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNsdManager_ResolveListener', TypeInfo(Androidapi.JNI.Net.JNsdManager_ResolveListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JNsdServiceInfo', TypeInfo(Androidapi.JNI.Net.JNsdServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JAudioCodec', TypeInfo(Androidapi.JNI.Net.JAudioCodec));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JAudioGroup', TypeInfo(Androidapi.JNI.Net.JAudioGroup));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JRtpStream', TypeInfo(Androidapi.JNI.Net.JRtpStream));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JAudioStream', TypeInfo(Androidapi.JNI.Net.JAudioStream));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipAudioCall', TypeInfo(Androidapi.JNI.Net.JSipAudioCall));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipAudioCall_Listener', TypeInfo(Androidapi.JNI.Net.JSipAudioCall_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipErrorCode', TypeInfo(Androidapi.JNI.Net.JSipErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipException', TypeInfo(Androidapi.JNI.Net.JSipException));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipManager', TypeInfo(Androidapi.JNI.Net.JSipManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipProfile', TypeInfo(Androidapi.JNI.Net.JSipProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipProfile_Builder', TypeInfo(Androidapi.JNI.Net.JSipProfile_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipRegistrationListener', TypeInfo(Androidapi.JNI.Net.JSipRegistrationListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipSession', TypeInfo(Androidapi.JNI.Net.JSipSession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipSession_Listener', TypeInfo(Androidapi.JNI.Net.JSipSession_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSipSession_State', TypeInfo(Androidapi.JNI.Net.JSipSession_State));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSSLEngines', TypeInfo(Androidapi.JNI.Net.JSSLEngines));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSSLSockets', TypeInfo(Androidapi.JNI.Net.JSSLSockets));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnUnderlyingNetworkTemplate', TypeInfo(Androidapi.JNI.Net.JVcnUnderlyingNetworkTemplate));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnCellUnderlyingNetworkTemplate', TypeInfo(Androidapi.JNI.Net.JVcnCellUnderlyingNetworkTemplate));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnCellUnderlyingNetworkTemplate_Builder', TypeInfo(Androidapi.JNI.Net.JVcnCellUnderlyingNetworkTemplate_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnConfig', TypeInfo(Androidapi.JNI.Net.JVcnConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnConfig_Builder', TypeInfo(Androidapi.JNI.Net.JVcnConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnGatewayConnectionConfig', TypeInfo(Androidapi.JNI.Net.JVcnGatewayConnectionConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnGatewayConnectionConfig_Builder', TypeInfo(Androidapi.JNI.Net.JVcnGatewayConnectionConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnManager', TypeInfo(Androidapi.JNI.Net.JVcnManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnManager_VcnStatusCallback', TypeInfo(Androidapi.JNI.Net.JVcnManager_VcnStatusCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnWifiUnderlyingNetworkTemplate', TypeInfo(Androidapi.JNI.Net.JVcnWifiUnderlyingNetworkTemplate));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JVcnWifiUnderlyingNetworkTemplate_Builder', TypeInfo(Androidapi.JNI.Net.JVcnWifiUnderlyingNetworkTemplate_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JEasyConnectStatusCallback', TypeInfo(Androidapi.JNI.Net.JEasyConnectStatusCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JMloLink', TypeInfo(Androidapi.JNI.Net.JMloLink));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JScanResult', TypeInfo(Androidapi.JNI.Net.JScanResult));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JScanResult_InformationElement', TypeInfo(Androidapi.JNI.Net.JScanResult_InformationElement));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSoftApConfiguration', TypeInfo(Androidapi.JNI.Net.JSoftApConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSupplicantState', TypeInfo(Androidapi.JNI.Net.JSupplicantState));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_AuthAlgorithm', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_AuthAlgorithm));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_GroupCipher', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_GroupCipher));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_GroupMgmtCipher', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_GroupMgmtCipher));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_KeyMgmt', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_KeyMgmt));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_PairwiseCipher', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_PairwiseCipher));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_Protocol', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_Protocol));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiConfiguration_Status', TypeInfo(Androidapi.JNI.Net.JWifiConfiguration_Status));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiEnterpriseConfig', TypeInfo(Androidapi.JNI.Net.JWifiEnterpriseConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiEnterpriseConfig_Eap', TypeInfo(Androidapi.JNI.Net.JWifiEnterpriseConfig_Eap));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiEnterpriseConfig_Phase2', TypeInfo(Androidapi.JNI.Net.JWifiEnterpriseConfig_Phase2));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiInfo', TypeInfo(Androidapi.JNI.Net.JWifiInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiInfo_Builder', TypeInfo(Androidapi.JNI.Net.JWifiInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager', TypeInfo(Androidapi.JNI.Net.JWifiManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_AddNetworkResult', TypeInfo(Androidapi.JNI.Net.JWifiManager_AddNetworkResult));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_InterfaceCreationImpact', TypeInfo(Androidapi.JNI.Net.JWifiManager_InterfaceCreationImpact));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_LocalOnlyHotspotCallback', TypeInfo(Androidapi.JNI.Net.JWifiManager_LocalOnlyHotspotCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_LocalOnlyHotspotReservation', TypeInfo(Androidapi.JNI.Net.JWifiManager_LocalOnlyHotspotReservation));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_MulticastLock', TypeInfo(Androidapi.JNI.Net.JWifiManager_MulticastLock));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_ScanResultsCallback', TypeInfo(Androidapi.JNI.Net.JWifiManager_ScanResultsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_SubsystemRestartTrackingCallback', TypeInfo(Androidapi.JNI.Net.JWifiManager_SubsystemRestartTrackingCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_SuggestionConnectionStatusListener', TypeInfo(Androidapi.JNI.Net.JWifiManager_SuggestionConnectionStatusListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_SuggestionUserApprovalStatusListener', TypeInfo(Androidapi.JNI.Net.JWifiManager_SuggestionUserApprovalStatusListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_WifiLock', TypeInfo(Androidapi.JNI.Net.JWifiManager_WifiLock));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiManager_WpsCallback', TypeInfo(Androidapi.JNI.Net.JWifiManager_WpsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiNetworkSpecifier', TypeInfo(Androidapi.JNI.Net.JWifiNetworkSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiNetworkSpecifier_Builder', TypeInfo(Androidapi.JNI.Net.JWifiNetworkSpecifier_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiNetworkSuggestion', TypeInfo(Androidapi.JNI.Net.JWifiNetworkSuggestion));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiNetworkSuggestion_Builder', TypeInfo(Androidapi.JNI.Net.JWifiNetworkSuggestion_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiSsid', TypeInfo(Androidapi.JNI.Net.JWifiSsid));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWpsInfo', TypeInfo(Androidapi.JNI.Net.JWpsInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JAttachCallback', TypeInfo(Androidapi.JNI.Net.JAttachCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JAwareResources', TypeInfo(Androidapi.JNI.Net.JAwareResources));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCharacteristics', TypeInfo(Androidapi.JNI.Net.JCharacteristics));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDiscoverySession', TypeInfo(Androidapi.JNI.Net.JDiscoverySession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JDiscoverySessionCallback', TypeInfo(Androidapi.JNI.Net.JDiscoverySessionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JIdentityChangedListener', TypeInfo(Androidapi.JNI.Net.JIdentityChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPeerHandle', TypeInfo(Androidapi.JNI.Net.JPeerHandle));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JParcelablePeerHandle', TypeInfo(Androidapi.JNI.Net.JParcelablePeerHandle));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPublishConfig', TypeInfo(Androidapi.JNI.Net.JPublishConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPublishConfig_Builder', TypeInfo(Androidapi.JNI.Net.JPublishConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPublishDiscoverySession', TypeInfo(Androidapi.JNI.Net.JPublishDiscoverySession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JServiceDiscoveryInfo', TypeInfo(Androidapi.JNI.Net.JServiceDiscoveryInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSubscribeConfig', TypeInfo(Androidapi.JNI.Net.JSubscribeConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSubscribeConfig_Builder', TypeInfo(Androidapi.JNI.Net.JSubscribeConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JSubscribeDiscoverySession', TypeInfo(Androidapi.JNI.Net.JSubscribeDiscoverySession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareChannelInfo', TypeInfo(Androidapi.JNI.Net.JWifiAwareChannelInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareDataPathSecurityConfig', TypeInfo(Androidapi.JNI.Net.JWifiAwareDataPathSecurityConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareDataPathSecurityConfig_Builder', TypeInfo(Androidapi.JNI.Net.JWifiAwareDataPathSecurityConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareManager', TypeInfo(Androidapi.JNI.Net.JWifiAwareManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareNetworkInfo', TypeInfo(Androidapi.JNI.Net.JWifiAwareNetworkInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareNetworkSpecifier', TypeInfo(Androidapi.JNI.Net.JWifiAwareNetworkSpecifier));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareNetworkSpecifier_Builder', TypeInfo(Androidapi.JNI.Net.JWifiAwareNetworkSpecifier_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiAwareSession', TypeInfo(Androidapi.JNI.Net.JWifiAwareSession));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JConfigParser', TypeInfo(Androidapi.JNI.Net.JConfigParser));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPasspointConfiguration', TypeInfo(Androidapi.JNI.Net.JPasspointConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JPpsMoParser', TypeInfo(Androidapi.JNI.Net.JPpsMoParser));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCredential', TypeInfo(Androidapi.JNI.Net.JCredential));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCredential_CertificateCredential', TypeInfo(Androidapi.JNI.Net.JCredential_CertificateCredential));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCredential_SimCredential', TypeInfo(Androidapi.JNI.Net.JCredential_SimCredential));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCredential_UserCredential', TypeInfo(Androidapi.JNI.Net.JCredential_UserCredential));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JHomeSp', TypeInfo(Androidapi.JNI.Net.JHomeSp));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pConfig', TypeInfo(Androidapi.JNI.Net.JWifiP2pConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pConfig_Builder', TypeInfo(Androidapi.JNI.Net.JWifiP2pConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pDevice', TypeInfo(Androidapi.JNI.Net.JWifiP2pDevice));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pDeviceList', TypeInfo(Androidapi.JNI.Net.JWifiP2pDeviceList));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pGroup', TypeInfo(Androidapi.JNI.Net.JWifiP2pGroup));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pInfo', TypeInfo(Androidapi.JNI.Net.JWifiP2pInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_ActionListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_ActionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_Channel', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_Channel));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_ChannelListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_ChannelListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_ConnectionInfoListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_ConnectionInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_DeviceInfoListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_DeviceInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_DiscoveryStateListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_DiscoveryStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_DnsSdServiceResponseListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_DnsSdServiceResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_DnsSdTxtRecordListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_DnsSdTxtRecordListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_ExternalApproverRequestListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_ExternalApproverRequestListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_GroupInfoListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_GroupInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_NetworkInfoListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_NetworkInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_P2pStateListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_P2pStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_PeerListListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_PeerListListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_ServiceResponseListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_ServiceResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pManager_UpnpServiceResponseListener', TypeInfo(Androidapi.JNI.Net.JWifiP2pManager_UpnpServiceResponseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pWfdInfo', TypeInfo(Androidapi.JNI.Net.JWifiP2pWfdInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pServiceInfo', TypeInfo(Androidapi.JNI.Net.JWifiP2pServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pDnsSdServiceInfo', TypeInfo(Androidapi.JNI.Net.JWifiP2pDnsSdServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pServiceRequest', TypeInfo(Androidapi.JNI.Net.JWifiP2pServiceRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pDnsSdServiceRequest', TypeInfo(Androidapi.JNI.Net.JWifiP2pDnsSdServiceRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pUpnpServiceInfo', TypeInfo(Androidapi.JNI.Net.JWifiP2pUpnpServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiP2pUpnpServiceRequest', TypeInfo(Androidapi.JNI.Net.JWifiP2pUpnpServiceRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JCivicLocationKeys', TypeInfo(Androidapi.JNI.Net.JCivicLocationKeys));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JRangingRequest', TypeInfo(Androidapi.JNI.Net.JRangingRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JRangingRequest_Builder', TypeInfo(Androidapi.JNI.Net.JRangingRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JRangingResult', TypeInfo(Androidapi.JNI.Net.JRangingResult));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JRangingResultCallback', TypeInfo(Androidapi.JNI.Net.JRangingResultCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JResponderConfig', TypeInfo(Androidapi.JNI.Net.JResponderConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JResponderConfig_Builder', TypeInfo(Androidapi.JNI.Net.JResponderConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JResponderLocation', TypeInfo(Androidapi.JNI.Net.JResponderLocation));
  TRegTypes.RegisterType('Androidapi.JNI.Net.JWifiRttManager', TypeInfo(Androidapi.JNI.Net.JWifiRttManager));
end;

initialization
  RegisterTypes;
end.


