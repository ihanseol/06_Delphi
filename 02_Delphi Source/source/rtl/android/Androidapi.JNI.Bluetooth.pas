{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Bluetooth;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JBluetoothA2dp = interface;//android.bluetooth.BluetoothA2dp
  JBluetoothAdapter = interface;//android.bluetooth.BluetoothAdapter
  JBluetoothAdapter_LeScanCallback = interface;//android.bluetooth.BluetoothAdapter$LeScanCallback
  JBluetoothAssignedNumbers = interface;//android.bluetooth.BluetoothAssignedNumbers
  Jbluetooth_BluetoothClass = interface;//android.bluetooth.BluetoothClass
  JBluetoothClass_Device = interface;//android.bluetooth.BluetoothClass$Device
  JDevice_Major = interface;//android.bluetooth.BluetoothClass$Device$Major
  JBluetoothClass_Service = interface;//android.bluetooth.BluetoothClass$Service
  JBluetoothCodecConfig = interface;//android.bluetooth.BluetoothCodecConfig
  JBluetoothCodecConfig_Builder = interface;//android.bluetooth.BluetoothCodecConfig$Builder
  JBluetoothCodecStatus = interface;//android.bluetooth.BluetoothCodecStatus
  JBluetoothCodecStatus_Builder = interface;//android.bluetooth.BluetoothCodecStatus$Builder
  JBluetoothCsipSetCoordinator = interface;//android.bluetooth.BluetoothCsipSetCoordinator
  JBluetoothDevice = interface;//android.bluetooth.BluetoothDevice
  JBluetoothGatt = interface;//android.bluetooth.BluetoothGatt
  JBluetoothGattCallback = interface;//android.bluetooth.BluetoothGattCallback
  JBluetoothGattCharacteristic = interface;//android.bluetooth.BluetoothGattCharacteristic
  JBluetoothGattDescriptor = interface;//android.bluetooth.BluetoothGattDescriptor
  JBluetoothGattServer = interface;//android.bluetooth.BluetoothGattServer
  JBluetoothGattServerCallback = interface;//android.bluetooth.BluetoothGattServerCallback
  JBluetoothGattService = interface;//android.bluetooth.BluetoothGattService
  JBluetoothHeadset = interface;//android.bluetooth.BluetoothHeadset
  JBluetoothHealth = interface;//android.bluetooth.BluetoothHealth
  JBluetoothHealthAppConfiguration = interface;//android.bluetooth.BluetoothHealthAppConfiguration
  JBluetoothHealthCallback = interface;//android.bluetooth.BluetoothHealthCallback
  JBluetoothHearingAid = interface;//android.bluetooth.BluetoothHearingAid
  JBluetoothHidDevice = interface;//android.bluetooth.BluetoothHidDevice
  JBluetoothHidDevice_Callback = interface;//android.bluetooth.BluetoothHidDevice$Callback
  JBluetoothHidDeviceAppQosSettings = interface;//android.bluetooth.BluetoothHidDeviceAppQosSettings
  JBluetoothHidDeviceAppSdpSettings = interface;//android.bluetooth.BluetoothHidDeviceAppSdpSettings
  JBluetoothLeAudio = interface;//android.bluetooth.BluetoothLeAudio
  JBluetoothLeAudioCodecConfig = interface;//android.bluetooth.BluetoothLeAudioCodecConfig
  JBluetoothLeAudioCodecConfig_Builder = interface;//android.bluetooth.BluetoothLeAudioCodecConfig$Builder
  JBluetoothLeAudioCodecStatus = interface;//android.bluetooth.BluetoothLeAudioCodecStatus
  JBluetoothManager = interface;//android.bluetooth.BluetoothManager
  JBluetoothProfile = interface;//android.bluetooth.BluetoothProfile
  JBluetoothProfile_ServiceListener = interface;//android.bluetooth.BluetoothProfile$ServiceListener
  JBluetoothServerSocket = interface;//android.bluetooth.BluetoothServerSocket
  JBluetoothSocket = interface;//android.bluetooth.BluetoothSocket
  JBluetoothStatusCodes = interface;//android.bluetooth.BluetoothStatusCodes
  JAdvertiseCallback = interface;//android.bluetooth.le.AdvertiseCallback
  JAdvertiseData = interface;//android.bluetooth.le.AdvertiseData
  JAdvertiseData_Builder = interface;//android.bluetooth.le.AdvertiseData$Builder
  JAdvertiseSettings = interface;//android.bluetooth.le.AdvertiseSettings
  JAdvertiseSettings_Builder = interface;//android.bluetooth.le.AdvertiseSettings$Builder
  JAdvertisingSet = interface;//android.bluetooth.le.AdvertisingSet
  JAdvertisingSetCallback = interface;//android.bluetooth.le.AdvertisingSetCallback
  JAdvertisingSetParameters = interface;//android.bluetooth.le.AdvertisingSetParameters
  JAdvertisingSetParameters_Builder = interface;//android.bluetooth.le.AdvertisingSetParameters$Builder
  JBluetoothLeAdvertiser = interface;//android.bluetooth.le.BluetoothLeAdvertiser
  JBluetoothLeScanner = interface;//android.bluetooth.le.BluetoothLeScanner
  JPeriodicAdvertisingParameters = interface;//android.bluetooth.le.PeriodicAdvertisingParameters
  JPeriodicAdvertisingParameters_Builder = interface;//android.bluetooth.le.PeriodicAdvertisingParameters$Builder
  JScanCallback = interface;//android.bluetooth.le.ScanCallback
  JScanFilter = interface;//android.bluetooth.le.ScanFilter
  JScanFilter_Builder = interface;//android.bluetooth.le.ScanFilter$Builder
  JScanRecord = interface;//android.bluetooth.le.ScanRecord
  Jle_ScanResult = interface;//android.bluetooth.le.ScanResult
  JScanSettings = interface;//android.bluetooth.le.ScanSettings
  JScanSettings_Builder = interface;//android.bluetooth.le.ScanSettings$Builder
  JTransportBlock = interface;//android.bluetooth.le.TransportBlock
  JTransportDiscoveryData = interface;//android.bluetooth.le.TransportDiscoveryData

// ===== Interface declarations =====

  JBluetoothA2dpClass = interface(JObjectClass)
    ['{2B9E047D-CF63-4A9C-97A9-C4F372207C86}']
    {class} function _GetACTION_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_PLAYING_STATE_CHANGED: JString; cdecl;
    {class} function _GetSTATE_NOT_PLAYING: Integer; cdecl;
    {class} function _GetSTATE_PLAYING: Integer; cdecl;
    {class} property ACTION_CONNECTION_STATE_CHANGED: JString read _GetACTION_CONNECTION_STATE_CHANGED;
    {class} property ACTION_PLAYING_STATE_CHANGED: JString read _GetACTION_PLAYING_STATE_CHANGED;
    {class} property STATE_NOT_PLAYING: Integer read _GetSTATE_NOT_PLAYING;
    {class} property STATE_PLAYING: Integer read _GetSTATE_PLAYING;
  end;

  [JavaSignature('android/bluetooth/BluetoothA2dp')]
  JBluetoothA2dp = interface(JObject)
    ['{61C30A48-9578-4FDA-B2A4-B748DB7A55DE}']
    procedure finalize; cdecl;
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function isA2dpPlaying(device: JBluetoothDevice): Boolean; cdecl;
  end;
  TJBluetoothA2dp = class(TJavaGenericImport<JBluetoothA2dpClass, JBluetoothA2dp>) end;

  JBluetoothAdapterClass = interface(JObjectClass)
    ['{7C08F8A8-7F06-4797-BECA-F5C4564BAEEC}']
    {class} function _GetACTION_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_DISCOVERY_FINISHED: JString; cdecl;
    {class} function _GetACTION_DISCOVERY_STARTED: JString; cdecl;
    {class} function _GetACTION_LOCAL_NAME_CHANGED: JString; cdecl;
    {class} function _GetACTION_REQUEST_DISCOVERABLE: JString; cdecl;
    {class} function _GetACTION_REQUEST_ENABLE: JString; cdecl;
    {class} function _GetACTION_SCAN_MODE_CHANGED: JString; cdecl;
    {class} function _GetACTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetEXTRA_CONNECTION_STATE: JString; cdecl;
    {class} function _GetEXTRA_DISCOVERABLE_DURATION: JString; cdecl;
    {class} function _GetEXTRA_LOCAL_NAME: JString; cdecl;
    {class} function _GetEXTRA_PREVIOUS_CONNECTION_STATE: JString; cdecl;
    {class} function _GetEXTRA_PREVIOUS_SCAN_MODE: JString; cdecl;
    {class} function _GetEXTRA_PREVIOUS_STATE: JString; cdecl;
    {class} function _GetEXTRA_SCAN_MODE: JString; cdecl;
    {class} function _GetEXTRA_STATE: JString; cdecl;
    {class} function _GetSCAN_MODE_CONNECTABLE: Integer; cdecl;
    {class} function _GetSCAN_MODE_CONNECTABLE_DISCOVERABLE: Integer; cdecl;
    {class} function _GetSCAN_MODE_NONE: Integer; cdecl;
    {class} function _GetSTATE_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSTATE_DISCONNECTING: Integer; cdecl;
    {class} function _GetSTATE_OFF: Integer; cdecl;
    {class} function _GetSTATE_ON: Integer; cdecl;
    {class} function _GetSTATE_TURNING_OFF: Integer; cdecl;
    {class} function _GetSTATE_TURNING_ON: Integer; cdecl;
    {class} function checkBluetoothAddress(address: JString): Boolean; cdecl;
    {class} function getDefaultAdapter: JBluetoothAdapter; cdecl;//Deprecated
    {class} property ACTION_CONNECTION_STATE_CHANGED: JString read _GetACTION_CONNECTION_STATE_CHANGED;
    {class} property ACTION_DISCOVERY_FINISHED: JString read _GetACTION_DISCOVERY_FINISHED;
    {class} property ACTION_DISCOVERY_STARTED: JString read _GetACTION_DISCOVERY_STARTED;
    {class} property ACTION_LOCAL_NAME_CHANGED: JString read _GetACTION_LOCAL_NAME_CHANGED;
    {class} property ACTION_REQUEST_DISCOVERABLE: JString read _GetACTION_REQUEST_DISCOVERABLE;
    {class} property ACTION_REQUEST_ENABLE: JString read _GetACTION_REQUEST_ENABLE;
    {class} property ACTION_SCAN_MODE_CHANGED: JString read _GetACTION_SCAN_MODE_CHANGED;
    {class} property ACTION_STATE_CHANGED: JString read _GetACTION_STATE_CHANGED;
    {class} property ERROR: Integer read _GetERROR;
    {class} property EXTRA_CONNECTION_STATE: JString read _GetEXTRA_CONNECTION_STATE;
    {class} property EXTRA_DISCOVERABLE_DURATION: JString read _GetEXTRA_DISCOVERABLE_DURATION;
    {class} property EXTRA_LOCAL_NAME: JString read _GetEXTRA_LOCAL_NAME;
    {class} property EXTRA_PREVIOUS_CONNECTION_STATE: JString read _GetEXTRA_PREVIOUS_CONNECTION_STATE;
    {class} property EXTRA_PREVIOUS_SCAN_MODE: JString read _GetEXTRA_PREVIOUS_SCAN_MODE;
    {class} property EXTRA_PREVIOUS_STATE: JString read _GetEXTRA_PREVIOUS_STATE;
    {class} property EXTRA_SCAN_MODE: JString read _GetEXTRA_SCAN_MODE;
    {class} property EXTRA_STATE: JString read _GetEXTRA_STATE;
    {class} property SCAN_MODE_CONNECTABLE: Integer read _GetSCAN_MODE_CONNECTABLE;
    {class} property SCAN_MODE_CONNECTABLE_DISCOVERABLE: Integer read _GetSCAN_MODE_CONNECTABLE_DISCOVERABLE;
    {class} property SCAN_MODE_NONE: Integer read _GetSCAN_MODE_NONE;
    {class} property STATE_CONNECTED: Integer read _GetSTATE_CONNECTED;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_DISCONNECTED: Integer read _GetSTATE_DISCONNECTED;
    {class} property STATE_DISCONNECTING: Integer read _GetSTATE_DISCONNECTING;
    {class} property STATE_OFF: Integer read _GetSTATE_OFF;
    {class} property STATE_ON: Integer read _GetSTATE_ON;
    {class} property STATE_TURNING_OFF: Integer read _GetSTATE_TURNING_OFF;
    {class} property STATE_TURNING_ON: Integer read _GetSTATE_TURNING_ON;
  end;

  [JavaSignature('android/bluetooth/BluetoothAdapter')]
  JBluetoothAdapter = interface(JObject)
    ['{3C62EC75-B2D5-4F6F-820C-02222EA05B54}']
    function cancelDiscovery: Boolean; cdecl;
    procedure closeProfileProxy(profile: Integer; proxy: JBluetoothProfile); cdecl;
    function disable: Boolean; cdecl;//Deprecated
    function enable: Boolean; cdecl;//Deprecated
    function getAddress: JString; cdecl;
    function getBluetoothLeAdvertiser: JBluetoothLeAdvertiser; cdecl;
    function getBluetoothLeScanner: JBluetoothLeScanner; cdecl;
    function getBondedDevices: JSet; cdecl;
    function getDiscoverableTimeout: Jtime_Duration; cdecl;
    function getLeMaximumAdvertisingDataLength: Integer; cdecl;
    function getMaxConnectedAudioDevices: Integer; cdecl;
    function getName: JString; cdecl;
    function getProfileConnectionState(profile: Integer): Integer; cdecl;
    function getProfileProxy(context: JContext; listener: JBluetoothProfile_ServiceListener; profile: Integer): Boolean; cdecl;
    function getRemoteDevice(address: JString): JBluetoothDevice; cdecl; overload;
    function getRemoteDevice(address: TJavaArray<Byte>): JBluetoothDevice; cdecl; overload;
    function getRemoteLeDevice(address: JString; addressType: Integer): JBluetoothDevice; cdecl;
    function getScanMode: Integer; cdecl;
    function getState: Integer; cdecl;
    function isDiscovering: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isLe2MPhySupported: Boolean; cdecl;
    function isLeAudioBroadcastAssistantSupported: Integer; cdecl;
    function isLeAudioBroadcastSourceSupported: Integer; cdecl;
    function isLeAudioSupported: Integer; cdecl;
    function isLeCodedPhySupported: Boolean; cdecl;
    function isLeExtendedAdvertisingSupported: Boolean; cdecl;
    function isLePeriodicAdvertisingSupported: Boolean; cdecl;
    function isMultipleAdvertisementSupported: Boolean; cdecl;
    function isOffloadedFilteringSupported: Boolean; cdecl;
    function isOffloadedScanBatchingSupported: Boolean; cdecl;
    function listenUsingInsecureL2capChannel: JBluetoothServerSocket; cdecl;
    function listenUsingInsecureRfcommWithServiceRecord(name: JString; uuid: JUUID): JBluetoothServerSocket; cdecl;
    function listenUsingL2capChannel: JBluetoothServerSocket; cdecl;
    function listenUsingRfcommWithServiceRecord(name: JString; uuid: JUUID): JBluetoothServerSocket; cdecl;
    function setName(name: JString): Boolean; cdecl;
    function startDiscovery: Boolean; cdecl;
    function startLeScan(callback: JBluetoothAdapter_LeScanCallback): Boolean; cdecl; overload;//Deprecated
    function startLeScan(serviceUuids: TJavaObjectArray<JUUID>; callback: JBluetoothAdapter_LeScanCallback): Boolean; cdecl; overload;//Deprecated
    procedure stopLeScan(callback: JBluetoothAdapter_LeScanCallback); cdecl;//Deprecated
  end;
  TJBluetoothAdapter = class(TJavaGenericImport<JBluetoothAdapterClass, JBluetoothAdapter>) end;

  JBluetoothAdapter_LeScanCallbackClass = interface(IJavaClass)
    ['{A774D140-5BD1-4EAC-98B8-1124178FFE47}']
  end;

  [JavaSignature('android/bluetooth/BluetoothAdapter$LeScanCallback')]
  JBluetoothAdapter_LeScanCallback = interface(IJavaInstance)
    ['{A520E11B-267D-4EA6-850B-3074F1C11D95}']
    procedure onLeScan(device: JBluetoothDevice; rssi: Integer; scanRecord: TJavaArray<Byte>); cdecl;
  end;
  TJBluetoothAdapter_LeScanCallback = class(TJavaGenericImport<JBluetoothAdapter_LeScanCallbackClass, JBluetoothAdapter_LeScanCallback>) end;

  JBluetoothAssignedNumbersClass = interface(JObjectClass)
    ['{C5F0EBA1-1D77-43F6-B645-EF5A5D248FE7}']
    {class} function _GetAAMP_OF_AMERICA: Integer; cdecl;
    {class} function _GetACCEL_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetACE_SENSOR: Integer; cdecl;
    {class} function _GetADIDAS: Integer; cdecl;
    {class} function _GetADVANCED_PANMOBIL_SYSTEMS: Integer; cdecl;
    {class} function _GetAIROHA_TECHNOLOGY: Integer; cdecl;
    {class} function _GetALCATEL: Integer; cdecl;
    {class} function _GetALPWISE: Integer; cdecl;
    {class} function _GetAMICCOM_ELECTRONICS: Integer; cdecl;
    {class} function _GetAPLIX: Integer; cdecl;
    {class} function _GetAPPLE: Integer; cdecl;
    {class} function _GetAPT_LICENSING: Integer; cdecl;
    {class} function _GetARCHOS: Integer; cdecl;
    {class} function _GetARP_DEVICES: Integer; cdecl;
    {class} function _GetATHEROS_COMMUNICATIONS: Integer; cdecl;
    {class} function _GetATMEL: Integer; cdecl;
    {class} function _GetAUSTCO_COMMUNICATION_SYSTEMS: Integer; cdecl;
    {class} function _GetAUTONET_MOBILE: Integer; cdecl;
    {class} function _GetAVAGO: Integer; cdecl;
    {class} function _GetAVM_BERLIN: Integer; cdecl;
    {class} function _GetA_AND_D_ENGINEERING: Integer; cdecl;
    {class} function _GetA_AND_R_CAMBRIDGE: Integer; cdecl;
    {class} function _GetBANDSPEED: Integer; cdecl;
    {class} function _GetBAND_XI_INTERNATIONAL: Integer; cdecl;
    {class} function _GetBDE_TECHNOLOGY: Integer; cdecl;
    {class} function _GetBEATS_ELECTRONICS: Integer; cdecl;
    {class} function _GetBEAUTIFUL_ENTERPRISE: Integer; cdecl;
    {class} function _GetBEKEY: Integer; cdecl;
    {class} function _GetBELKIN_INTERNATIONAL: Integer; cdecl;
    {class} function _GetBINAURIC: Integer; cdecl;
    {class} function _GetBIOSENTRONICS: Integer; cdecl;
    {class} function _GetBLUEGIGA: Integer; cdecl;
    {class} function _GetBLUERADIOS: Integer; cdecl;
    {class} function _GetBLUETOOTH_SIG: Integer; cdecl;
    {class} function _GetBLUETREK_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetBOSE: Integer; cdecl;
    {class} function _GetBRIARTEK: Integer; cdecl;
    {class} function _GetBROADCOM: Integer; cdecl;
    {class} function _GetCAEN_RFID: Integer; cdecl;
    {class} function _GetCAMBRIDGE_SILICON_RADIO: Integer; cdecl;
    {class} function _GetCATC: Integer; cdecl;
    {class} function _GetCINETIX: Integer; cdecl;
    {class} function _GetCLARINOX_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetCOLORFY: Integer; cdecl;
    {class} function _GetCOMMIL: Integer; cdecl;
    {class} function _GetCONEXANT_SYSTEMS: Integer; cdecl;
    {class} function _GetCONNECTBLUE: Integer; cdecl;
    {class} function _GetCONTINENTAL_AUTOMOTIVE: Integer; cdecl;
    {class} function _GetCONWISE_TECHNOLOGY: Integer; cdecl;
    {class} function _GetCREATIVE_TECHNOLOGY: Integer; cdecl;
    {class} function _GetC_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetDANLERS: Integer; cdecl;
    {class} function _GetDELORME_PUBLISHING_COMPANY: Integer; cdecl;
    {class} function _GetDEXCOM: Integer; cdecl;
    {class} function _GetDIALOG_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetDIGIANSWER: Integer; cdecl;
    {class} function _GetECLIPSE: Integer; cdecl;
    {class} function _GetECOTEST: Integer; cdecl;
    {class} function _GetELGATO_SYSTEMS: Integer; cdecl;
    {class} function _GetEM_MICROELECTRONIC_MARIN: Integer; cdecl;
    {class} function _GetEQUINOX_AG: Integer; cdecl;
    {class} function _GetERICSSON_TECHNOLOGY: Integer; cdecl;
    {class} function _GetEVLUMA: Integer; cdecl;
    {class} function _GetFREE2MOVE: Integer; cdecl;
    {class} function _GetFUNAI_ELECTRIC: Integer; cdecl;
    {class} function _GetGARMIN_INTERNATIONAL: Integer; cdecl;
    {class} function _GetGCT_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetGELO: Integer; cdecl;
    {class} function _GetGENEQ: Integer; cdecl;
    {class} function _GetGENERAL_MOTORS: Integer; cdecl;
    {class} function _GetGENNUM: Integer; cdecl;
    {class} function _GetGEOFORCE: Integer; cdecl;
    {class} function _GetGIBSON_GUITARS: Integer; cdecl;
    {class} function _GetGN_NETCOM: Integer; cdecl;
    {class} function _GetGN_RESOUND: Integer; cdecl;
    {class} function _GetGOOGLE: Integer; cdecl;
    {class} function _GetGREEN_THROTTLE_GAMES: Integer; cdecl;
    {class} function _GetGROUP_SENSE: Integer; cdecl;
    {class} function _GetHANLYNN_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetHARMAN_INTERNATIONAL: Integer; cdecl;
    {class} function _GetHEWLETT_PACKARD: Integer; cdecl;
    {class} function _GetHITACHI: Integer; cdecl;
    {class} function _GetHOSIDEN: Integer; cdecl;
    {class} function _GetIBM: Integer; cdecl;
    {class} function _GetINFINEON_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetINGENIEUR_SYSTEMGRUPPE_ZAHN: Integer; cdecl;
    {class} function _GetINTEGRATED_SILICON_SOLUTION: Integer; cdecl;
    {class} function _GetINTEGRATED_SYSTEM_SOLUTION: Integer; cdecl;
    {class} function _GetINTEL: Integer; cdecl;
    {class} function _GetINVENTEL: Integer; cdecl;
    {class} function _GetIPEXTREME: Integer; cdecl;
    {class} function _GetI_TECH_DYNAMIC_GLOBAL_DISTRIBUTION: Integer; cdecl;
    {class} function _GetJAWBONE: Integer; cdecl;
    {class} function _GetJIANGSU_TOPPOWER_AUTOMOTIVE_ELECTRONICS: Integer; cdecl;
    {class} function _GetJOHNSON_CONTROLS: Integer; cdecl;
    {class} function _GetJ_AND_M: Integer; cdecl;
    {class} function _GetKAWANTECH: Integer; cdecl;
    {class} function _GetKC_TECHNOLOGY: Integer; cdecl;
    {class} function _GetKENSINGTON_COMPUTER_PRODUCTS_GROUP: Integer; cdecl;
    {class} function _GetLAIRD_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetLESSWIRE: Integer; cdecl;
    {class} function _GetLG_ELECTRONICS: Integer; cdecl;
    {class} function _GetLINAK: Integer; cdecl;
    {class} function _GetLUCENT: Integer; cdecl;
    {class} function _GetLUDUS_HELSINKI: Integer; cdecl;
    {class} function _GetMACRONIX: Integer; cdecl;
    {class} function _GetMAGNETI_MARELLI: Integer; cdecl;
    {class} function _GetMANSELLA: Integer; cdecl;
    {class} function _GetMARVELL: Integer; cdecl;
    {class} function _GetMATSUSHITA_ELECTRIC: Integer; cdecl;
    {class} function _GetMC10: Integer; cdecl;
    {class} function _GetMEDIATEK: Integer; cdecl;
    {class} function _GetMESO_INTERNATIONAL: Integer; cdecl;
    {class} function _GetMETA_WATCH: Integer; cdecl;
    {class} function _GetMEWTEL_TECHNOLOGY: Integer; cdecl;
    {class} function _GetMICOMMAND: Integer; cdecl;
    {class} function _GetMICROCHIP_TECHNOLOGY: Integer; cdecl;
    {class} function _GetMICROSOFT: Integer; cdecl;
    {class} function _GetMINDTREE: Integer; cdecl;
    {class} function _GetMISFIT_WEARABLES: Integer; cdecl;
    {class} function _GetMITEL_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetMITSUBISHI_ELECTRIC: Integer; cdecl;
    {class} function _GetMOBILIAN_CORPORATION: Integer; cdecl;
    {class} function _GetMONSTER: Integer; cdecl;
    {class} function _GetMOTOROLA: Integer; cdecl;
    {class} function _GetMSTAR_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetMUZIK: Integer; cdecl;
    {class} function _GetNEC: Integer; cdecl;
    {class} function _GetNEC_LIGHTING: Integer; cdecl;
    {class} function _GetNEWLOGIC: Integer; cdecl;
    {class} function _GetNIKE: Integer; cdecl;
    {class} function _GetNINE_SOLUTIONS: Integer; cdecl;
    {class} function _GetNOKIA_MOBILE_PHONES: Integer; cdecl;
    {class} function _GetNORDIC_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetNORWOOD_SYSTEMS: Integer; cdecl;
    {class} function _GetODM_TECHNOLOGY: Integer; cdecl;
    {class} function _GetOMEGAWAVE: Integer; cdecl;
    {class} function _GetONSET_COMPUTER: Integer; cdecl;
    {class} function _GetOPEN_INTERFACE: Integer; cdecl;
    {class} function _GetOTL_DYNAMICS: Integer; cdecl;
    {class} function _GetPANDA_OCEAN: Integer; cdecl;
    {class} function _GetPARROT: Integer; cdecl;
    {class} function _GetPARTHUS_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetPASSIF_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetPETER_SYSTEMTECHNIK: Integer; cdecl;
    {class} function _GetPHILIPS_SEMICONDUCTORS: Integer; cdecl;
    {class} function _GetPLANTRONICS: Integer; cdecl;
    {class} function _GetPOLAR_ELECTRO: Integer; cdecl;
    {class} function _GetPOLAR_ELECTRO_EUROPE: Integer; cdecl;
    {class} function _GetPROCTER_AND_GAMBLE: Integer; cdecl;
    {class} function _GetQUALCOMM: Integer; cdecl;
    {class} function _GetQUALCOMM_CONNECTED_EXPERIENCES: Integer; cdecl;
    {class} function _GetQUALCOMM_INNOVATION_CENTER: Integer; cdecl;
    {class} function _GetQUALCOMM_LABS: Integer; cdecl;
    {class} function _GetQUALCOMM_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetQUINTIC: Integer; cdecl;
    {class} function _GetQUUPPA: Integer; cdecl;
    {class} function _GetRALINK_TECHNOLOGY: Integer; cdecl;
    {class} function _GetRDA_MICROELECTRONICS: Integer; cdecl;
    {class} function _GetREALTEK_SEMICONDUCTOR: Integer; cdecl;
    {class} function _GetRED_M: Integer; cdecl;
    {class} function _GetRENESAS_TECHNOLOGY: Integer; cdecl;
    {class} function _GetRESEARCH_IN_MOTION: Integer; cdecl;
    {class} function _GetRF_MICRO_DEVICES: Integer; cdecl;
    {class} function _GetRIVIERAWAVES: Integer; cdecl;
    {class} function _GetROHDE_AND_SCHWARZ: Integer; cdecl;
    {class} function _GetRTX_TELECOM: Integer; cdecl;
    {class} function _GetSAMSUNG_ELECTRONICS: Integer; cdecl;
    {class} function _GetSARIS_CYCLING_GROUP: Integer; cdecl;
    {class} function _GetSEERS_TECHNOLOGY: Integer; cdecl;
    {class} function _GetSEIKO_EPSON: Integer; cdecl;
    {class} function _GetSELFLY: Integer; cdecl;
    {class} function _GetSEMILINK: Integer; cdecl;
    {class} function _GetSENNHEISER_COMMUNICATIONS: Integer; cdecl;
    {class} function _GetSHANGHAI_SUPER_SMART_ELECTRONICS: Integer; cdecl;
    {class} function _GetSHENZHEN_EXCELSECU_DATA_TECHNOLOGY: Integer; cdecl;
    {class} function _GetSIGNIA_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetSILICON_WAVE: Integer; cdecl;
    {class} function _GetSIRF_TECHNOLOGY: Integer; cdecl;
    {class} function _GetSOCKET_MOBILE: Integer; cdecl;
    {class} function _GetSONY_ERICSSON: Integer; cdecl;
    {class} function _GetSOUND_ID: Integer; cdecl;
    {class} function _GetSPORTS_TRACKING_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetSR_MEDIZINELEKTRONIK: Integer; cdecl;
    {class} function _GetSTACCATO_COMMUNICATIONS: Integer; cdecl;
    {class} function _GetSTALMART_TECHNOLOGY: Integer; cdecl;
    {class} function _GetSTARKEY_LABORATORIES: Integer; cdecl;
    {class} function _GetSTOLLMAN_E_PLUS_V: Integer; cdecl;
    {class} function _GetSTONESTREET_ONE: Integer; cdecl;
    {class} function _GetST_MICROELECTRONICS: Integer; cdecl;
    {class} function _GetSUMMIT_DATA_COMMUNICATIONS: Integer; cdecl;
    {class} function _GetSUUNTO: Integer; cdecl;
    {class} function _GetSWIRL_NETWORKS: Integer; cdecl;
    {class} function _GetSYMBOL_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetSYNOPSYS: Integer; cdecl;
    {class} function _GetSYSTEMS_AND_CHIPS: Integer; cdecl;
    {class} function _GetS_POWER_ELECTRONICS: Integer; cdecl;
    {class} function _GetTAIXINGBANG_TECHNOLOGY: Integer; cdecl;
    {class} function _GetTENOVIS: Integer; cdecl;
    {class} function _GetTERAX: Integer; cdecl;
    {class} function _GetTEXAS_INSTRUMENTS: Integer; cdecl;
    {class} function _GetTHINKOPTICS: Integer; cdecl;
    {class} function _GetTHREECOM: Integer; cdecl;
    {class} function _GetTHREE_DIJOY: Integer; cdecl;
    {class} function _GetTHREE_DSP: Integer; cdecl;
    {class} function _GetTIMEKEEPING_SYSTEMS: Integer; cdecl;
    {class} function _GetTIMEX_GROUP_USA: Integer; cdecl;
    {class} function _GetTOPCORN_POSITIONING_SYSTEMS: Integer; cdecl;
    {class} function _GetTOSHIBA: Integer; cdecl;
    {class} function _GetTRANSILICA: Integer; cdecl;
    {class} function _GetTRELAB: Integer; cdecl;
    {class} function _GetTTPCOM: Integer; cdecl;
    {class} function _GetTXTR: Integer; cdecl;
    {class} function _GetTZERO_TECHNOLOGIES: Integer; cdecl;
    {class} function _GetUNIVERSAL_ELECTRONICS: Integer; cdecl;
    {class} function _GetVERTU: Integer; cdecl;
    {class} function _GetVISTEON: Integer; cdecl;
    {class} function _GetVIZIO: Integer; cdecl;
    {class} function _GetVOYETRA_TURTLE_BEACH: Integer; cdecl;
    {class} function _GetWAVEPLUS_TECHNOLOGY: Integer; cdecl;
    {class} function _GetWICENTRIC: Integer; cdecl;
    {class} function _GetWIDCOMM: Integer; cdecl;
    {class} function _GetWUXI_VIMICRO: Integer; cdecl;
    {class} function _GetZEEVO: Integer; cdecl;
    {class} function _GetZER01_TV: Integer; cdecl;
    {class} function _GetZOMM: Integer; cdecl;
    {class} function _GetZSCAN_SOFTWARE: Integer; cdecl;
    {class} property AAMP_OF_AMERICA: Integer read _GetAAMP_OF_AMERICA;
    {class} property ACCEL_SEMICONDUCTOR: Integer read _GetACCEL_SEMICONDUCTOR;
    {class} property ACE_SENSOR: Integer read _GetACE_SENSOR;
    {class} property ADIDAS: Integer read _GetADIDAS;
    {class} property ADVANCED_PANMOBIL_SYSTEMS: Integer read _GetADVANCED_PANMOBIL_SYSTEMS;
    {class} property AIROHA_TECHNOLOGY: Integer read _GetAIROHA_TECHNOLOGY;
    {class} property ALCATEL: Integer read _GetALCATEL;
    {class} property ALPWISE: Integer read _GetALPWISE;
    {class} property AMICCOM_ELECTRONICS: Integer read _GetAMICCOM_ELECTRONICS;
    {class} property APLIX: Integer read _GetAPLIX;
    {class} property APPLE: Integer read _GetAPPLE;
    {class} property APT_LICENSING: Integer read _GetAPT_LICENSING;
    {class} property ARCHOS: Integer read _GetARCHOS;
    {class} property ARP_DEVICES: Integer read _GetARP_DEVICES;
    {class} property ATHEROS_COMMUNICATIONS: Integer read _GetATHEROS_COMMUNICATIONS;
    {class} property ATMEL: Integer read _GetATMEL;
    {class} property AUSTCO_COMMUNICATION_SYSTEMS: Integer read _GetAUSTCO_COMMUNICATION_SYSTEMS;
    {class} property AUTONET_MOBILE: Integer read _GetAUTONET_MOBILE;
    {class} property AVAGO: Integer read _GetAVAGO;
    {class} property AVM_BERLIN: Integer read _GetAVM_BERLIN;
    {class} property A_AND_D_ENGINEERING: Integer read _GetA_AND_D_ENGINEERING;
    {class} property A_AND_R_CAMBRIDGE: Integer read _GetA_AND_R_CAMBRIDGE;
    {class} property BANDSPEED: Integer read _GetBANDSPEED;
    {class} property BAND_XI_INTERNATIONAL: Integer read _GetBAND_XI_INTERNATIONAL;
    {class} property BDE_TECHNOLOGY: Integer read _GetBDE_TECHNOLOGY;
    {class} property BEATS_ELECTRONICS: Integer read _GetBEATS_ELECTRONICS;
    {class} property BEAUTIFUL_ENTERPRISE: Integer read _GetBEAUTIFUL_ENTERPRISE;
    {class} property BEKEY: Integer read _GetBEKEY;
    {class} property BELKIN_INTERNATIONAL: Integer read _GetBELKIN_INTERNATIONAL;
    {class} property BINAURIC: Integer read _GetBINAURIC;
    {class} property BIOSENTRONICS: Integer read _GetBIOSENTRONICS;
    {class} property BLUEGIGA: Integer read _GetBLUEGIGA;
    {class} property BLUERADIOS: Integer read _GetBLUERADIOS;
    {class} property BLUETOOTH_SIG: Integer read _GetBLUETOOTH_SIG;
    {class} property BLUETREK_TECHNOLOGIES: Integer read _GetBLUETREK_TECHNOLOGIES;
    {class} property BOSE: Integer read _GetBOSE;
    {class} property BRIARTEK: Integer read _GetBRIARTEK;
    {class} property BROADCOM: Integer read _GetBROADCOM;
    {class} property CAEN_RFID: Integer read _GetCAEN_RFID;
    {class} property CAMBRIDGE_SILICON_RADIO: Integer read _GetCAMBRIDGE_SILICON_RADIO;
    {class} property CATC: Integer read _GetCATC;
    {class} property CINETIX: Integer read _GetCINETIX;
    {class} property CLARINOX_TECHNOLOGIES: Integer read _GetCLARINOX_TECHNOLOGIES;
    {class} property COLORFY: Integer read _GetCOLORFY;
    {class} property COMMIL: Integer read _GetCOMMIL;
    {class} property CONEXANT_SYSTEMS: Integer read _GetCONEXANT_SYSTEMS;
    {class} property CONNECTBLUE: Integer read _GetCONNECTBLUE;
    {class} property CONTINENTAL_AUTOMOTIVE: Integer read _GetCONTINENTAL_AUTOMOTIVE;
    {class} property CONWISE_TECHNOLOGY: Integer read _GetCONWISE_TECHNOLOGY;
    {class} property CREATIVE_TECHNOLOGY: Integer read _GetCREATIVE_TECHNOLOGY;
    {class} property C_TECHNOLOGIES: Integer read _GetC_TECHNOLOGIES;
    {class} property DANLERS: Integer read _GetDANLERS;
    {class} property DELORME_PUBLISHING_COMPANY: Integer read _GetDELORME_PUBLISHING_COMPANY;
    {class} property DEXCOM: Integer read _GetDEXCOM;
    {class} property DIALOG_SEMICONDUCTOR: Integer read _GetDIALOG_SEMICONDUCTOR;
    {class} property DIGIANSWER: Integer read _GetDIGIANSWER;
    {class} property ECLIPSE: Integer read _GetECLIPSE;
    {class} property ECOTEST: Integer read _GetECOTEST;
    {class} property ELGATO_SYSTEMS: Integer read _GetELGATO_SYSTEMS;
    {class} property EM_MICROELECTRONIC_MARIN: Integer read _GetEM_MICROELECTRONIC_MARIN;
    {class} property EQUINOX_AG: Integer read _GetEQUINOX_AG;
    {class} property ERICSSON_TECHNOLOGY: Integer read _GetERICSSON_TECHNOLOGY;
    {class} property EVLUMA: Integer read _GetEVLUMA;
    {class} property FREE2MOVE: Integer read _GetFREE2MOVE;
    {class} property FUNAI_ELECTRIC: Integer read _GetFUNAI_ELECTRIC;
    {class} property GARMIN_INTERNATIONAL: Integer read _GetGARMIN_INTERNATIONAL;
    {class} property GCT_SEMICONDUCTOR: Integer read _GetGCT_SEMICONDUCTOR;
    {class} property GELO: Integer read _GetGELO;
    {class} property GENEQ: Integer read _GetGENEQ;
    {class} property GENERAL_MOTORS: Integer read _GetGENERAL_MOTORS;
    {class} property GENNUM: Integer read _GetGENNUM;
    {class} property GEOFORCE: Integer read _GetGEOFORCE;
    {class} property GIBSON_GUITARS: Integer read _GetGIBSON_GUITARS;
    {class} property GN_NETCOM: Integer read _GetGN_NETCOM;
    {class} property GN_RESOUND: Integer read _GetGN_RESOUND;
    {class} property GOOGLE: Integer read _GetGOOGLE;
    {class} property GREEN_THROTTLE_GAMES: Integer read _GetGREEN_THROTTLE_GAMES;
    {class} property GROUP_SENSE: Integer read _GetGROUP_SENSE;
    {class} property HANLYNN_TECHNOLOGIES: Integer read _GetHANLYNN_TECHNOLOGIES;
    {class} property HARMAN_INTERNATIONAL: Integer read _GetHARMAN_INTERNATIONAL;
    {class} property HEWLETT_PACKARD: Integer read _GetHEWLETT_PACKARD;
    {class} property HITACHI: Integer read _GetHITACHI;
    {class} property HOSIDEN: Integer read _GetHOSIDEN;
    {class} property IBM: Integer read _GetIBM;
    {class} property INFINEON_TECHNOLOGIES: Integer read _GetINFINEON_TECHNOLOGIES;
    {class} property INGENIEUR_SYSTEMGRUPPE_ZAHN: Integer read _GetINGENIEUR_SYSTEMGRUPPE_ZAHN;
    {class} property INTEGRATED_SILICON_SOLUTION: Integer read _GetINTEGRATED_SILICON_SOLUTION;
    {class} property INTEGRATED_SYSTEM_SOLUTION: Integer read _GetINTEGRATED_SYSTEM_SOLUTION;
    {class} property INTEL: Integer read _GetINTEL;
    {class} property INVENTEL: Integer read _GetINVENTEL;
    {class} property IPEXTREME: Integer read _GetIPEXTREME;
    {class} property I_TECH_DYNAMIC_GLOBAL_DISTRIBUTION: Integer read _GetI_TECH_DYNAMIC_GLOBAL_DISTRIBUTION;
    {class} property JAWBONE: Integer read _GetJAWBONE;
    {class} property JIANGSU_TOPPOWER_AUTOMOTIVE_ELECTRONICS: Integer read _GetJIANGSU_TOPPOWER_AUTOMOTIVE_ELECTRONICS;
    {class} property JOHNSON_CONTROLS: Integer read _GetJOHNSON_CONTROLS;
    {class} property J_AND_M: Integer read _GetJ_AND_M;
    {class} property KAWANTECH: Integer read _GetKAWANTECH;
    {class} property KC_TECHNOLOGY: Integer read _GetKC_TECHNOLOGY;
    {class} property KENSINGTON_COMPUTER_PRODUCTS_GROUP: Integer read _GetKENSINGTON_COMPUTER_PRODUCTS_GROUP;
    {class} property LAIRD_TECHNOLOGIES: Integer read _GetLAIRD_TECHNOLOGIES;
    {class} property LESSWIRE: Integer read _GetLESSWIRE;
    {class} property LG_ELECTRONICS: Integer read _GetLG_ELECTRONICS;
    {class} property LINAK: Integer read _GetLINAK;
    {class} property LUCENT: Integer read _GetLUCENT;
    {class} property LUDUS_HELSINKI: Integer read _GetLUDUS_HELSINKI;
    {class} property MACRONIX: Integer read _GetMACRONIX;
    {class} property MAGNETI_MARELLI: Integer read _GetMAGNETI_MARELLI;
    {class} property MANSELLA: Integer read _GetMANSELLA;
    {class} property MARVELL: Integer read _GetMARVELL;
    {class} property MATSUSHITA_ELECTRIC: Integer read _GetMATSUSHITA_ELECTRIC;
    {class} property MC10: Integer read _GetMC10;
    {class} property MEDIATEK: Integer read _GetMEDIATEK;
    {class} property MESO_INTERNATIONAL: Integer read _GetMESO_INTERNATIONAL;
    {class} property META_WATCH: Integer read _GetMETA_WATCH;
    {class} property MEWTEL_TECHNOLOGY: Integer read _GetMEWTEL_TECHNOLOGY;
    {class} property MICOMMAND: Integer read _GetMICOMMAND;
    {class} property MICROCHIP_TECHNOLOGY: Integer read _GetMICROCHIP_TECHNOLOGY;
    {class} property MICROSOFT: Integer read _GetMICROSOFT;
    {class} property MINDTREE: Integer read _GetMINDTREE;
    {class} property MISFIT_WEARABLES: Integer read _GetMISFIT_WEARABLES;
    {class} property MITEL_SEMICONDUCTOR: Integer read _GetMITEL_SEMICONDUCTOR;
    {class} property MITSUBISHI_ELECTRIC: Integer read _GetMITSUBISHI_ELECTRIC;
    {class} property MOBILIAN_CORPORATION: Integer read _GetMOBILIAN_CORPORATION;
    {class} property MONSTER: Integer read _GetMONSTER;
    {class} property MOTOROLA: Integer read _GetMOTOROLA;
    {class} property MSTAR_SEMICONDUCTOR: Integer read _GetMSTAR_SEMICONDUCTOR;
    {class} property MUZIK: Integer read _GetMUZIK;
    {class} property NEC: Integer read _GetNEC;
    {class} property NEC_LIGHTING: Integer read _GetNEC_LIGHTING;
    {class} property NEWLOGIC: Integer read _GetNEWLOGIC;
    {class} property NIKE: Integer read _GetNIKE;
    {class} property NINE_SOLUTIONS: Integer read _GetNINE_SOLUTIONS;
    {class} property NOKIA_MOBILE_PHONES: Integer read _GetNOKIA_MOBILE_PHONES;
    {class} property NORDIC_SEMICONDUCTOR: Integer read _GetNORDIC_SEMICONDUCTOR;
    {class} property NORWOOD_SYSTEMS: Integer read _GetNORWOOD_SYSTEMS;
    {class} property ODM_TECHNOLOGY: Integer read _GetODM_TECHNOLOGY;
    {class} property OMEGAWAVE: Integer read _GetOMEGAWAVE;
    {class} property ONSET_COMPUTER: Integer read _GetONSET_COMPUTER;
    {class} property OPEN_INTERFACE: Integer read _GetOPEN_INTERFACE;
    {class} property OTL_DYNAMICS: Integer read _GetOTL_DYNAMICS;
    {class} property PANDA_OCEAN: Integer read _GetPANDA_OCEAN;
    {class} property PARROT: Integer read _GetPARROT;
    {class} property PARTHUS_TECHNOLOGIES: Integer read _GetPARTHUS_TECHNOLOGIES;
    {class} property PASSIF_SEMICONDUCTOR: Integer read _GetPASSIF_SEMICONDUCTOR;
    {class} property PETER_SYSTEMTECHNIK: Integer read _GetPETER_SYSTEMTECHNIK;
    {class} property PHILIPS_SEMICONDUCTORS: Integer read _GetPHILIPS_SEMICONDUCTORS;
    {class} property PLANTRONICS: Integer read _GetPLANTRONICS;
    {class} property POLAR_ELECTRO: Integer read _GetPOLAR_ELECTRO;
    {class} property POLAR_ELECTRO_EUROPE: Integer read _GetPOLAR_ELECTRO_EUROPE;
    {class} property PROCTER_AND_GAMBLE: Integer read _GetPROCTER_AND_GAMBLE;
    {class} property QUALCOMM: Integer read _GetQUALCOMM;
    {class} property QUALCOMM_CONNECTED_EXPERIENCES: Integer read _GetQUALCOMM_CONNECTED_EXPERIENCES;
    {class} property QUALCOMM_INNOVATION_CENTER: Integer read _GetQUALCOMM_INNOVATION_CENTER;
    {class} property QUALCOMM_LABS: Integer read _GetQUALCOMM_LABS;
    {class} property QUALCOMM_TECHNOLOGIES: Integer read _GetQUALCOMM_TECHNOLOGIES;
    {class} property QUINTIC: Integer read _GetQUINTIC;
    {class} property QUUPPA: Integer read _GetQUUPPA;
    {class} property RALINK_TECHNOLOGY: Integer read _GetRALINK_TECHNOLOGY;
    {class} property RDA_MICROELECTRONICS: Integer read _GetRDA_MICROELECTRONICS;
    {class} property REALTEK_SEMICONDUCTOR: Integer read _GetREALTEK_SEMICONDUCTOR;
    {class} property RED_M: Integer read _GetRED_M;
    {class} property RENESAS_TECHNOLOGY: Integer read _GetRENESAS_TECHNOLOGY;
    {class} property RESEARCH_IN_MOTION: Integer read _GetRESEARCH_IN_MOTION;
    {class} property RF_MICRO_DEVICES: Integer read _GetRF_MICRO_DEVICES;
    {class} property RIVIERAWAVES: Integer read _GetRIVIERAWAVES;
    {class} property ROHDE_AND_SCHWARZ: Integer read _GetROHDE_AND_SCHWARZ;
    {class} property RTX_TELECOM: Integer read _GetRTX_TELECOM;
    {class} property SAMSUNG_ELECTRONICS: Integer read _GetSAMSUNG_ELECTRONICS;
    {class} property SARIS_CYCLING_GROUP: Integer read _GetSARIS_CYCLING_GROUP;
    {class} property SEERS_TECHNOLOGY: Integer read _GetSEERS_TECHNOLOGY;
    {class} property SEIKO_EPSON: Integer read _GetSEIKO_EPSON;
    {class} property SELFLY: Integer read _GetSELFLY;
    {class} property SEMILINK: Integer read _GetSEMILINK;
    {class} property SENNHEISER_COMMUNICATIONS: Integer read _GetSENNHEISER_COMMUNICATIONS;
    {class} property SHANGHAI_SUPER_SMART_ELECTRONICS: Integer read _GetSHANGHAI_SUPER_SMART_ELECTRONICS;
    {class} property SHENZHEN_EXCELSECU_DATA_TECHNOLOGY: Integer read _GetSHENZHEN_EXCELSECU_DATA_TECHNOLOGY;
    {class} property SIGNIA_TECHNOLOGIES: Integer read _GetSIGNIA_TECHNOLOGIES;
    {class} property SILICON_WAVE: Integer read _GetSILICON_WAVE;
    {class} property SIRF_TECHNOLOGY: Integer read _GetSIRF_TECHNOLOGY;
    {class} property SOCKET_MOBILE: Integer read _GetSOCKET_MOBILE;
    {class} property SONY_ERICSSON: Integer read _GetSONY_ERICSSON;
    {class} property SOUND_ID: Integer read _GetSOUND_ID;
    {class} property SPORTS_TRACKING_TECHNOLOGIES: Integer read _GetSPORTS_TRACKING_TECHNOLOGIES;
    {class} property SR_MEDIZINELEKTRONIK: Integer read _GetSR_MEDIZINELEKTRONIK;
    {class} property STACCATO_COMMUNICATIONS: Integer read _GetSTACCATO_COMMUNICATIONS;
    {class} property STALMART_TECHNOLOGY: Integer read _GetSTALMART_TECHNOLOGY;
    {class} property STARKEY_LABORATORIES: Integer read _GetSTARKEY_LABORATORIES;
    {class} property STOLLMAN_E_PLUS_V: Integer read _GetSTOLLMAN_E_PLUS_V;
    {class} property STONESTREET_ONE: Integer read _GetSTONESTREET_ONE;
    {class} property ST_MICROELECTRONICS: Integer read _GetST_MICROELECTRONICS;
    {class} property SUMMIT_DATA_COMMUNICATIONS: Integer read _GetSUMMIT_DATA_COMMUNICATIONS;
    {class} property SUUNTO: Integer read _GetSUUNTO;
    {class} property SWIRL_NETWORKS: Integer read _GetSWIRL_NETWORKS;
    {class} property SYMBOL_TECHNOLOGIES: Integer read _GetSYMBOL_TECHNOLOGIES;
    {class} property SYNOPSYS: Integer read _GetSYNOPSYS;
    {class} property SYSTEMS_AND_CHIPS: Integer read _GetSYSTEMS_AND_CHIPS;
    {class} property S_POWER_ELECTRONICS: Integer read _GetS_POWER_ELECTRONICS;
    {class} property TAIXINGBANG_TECHNOLOGY: Integer read _GetTAIXINGBANG_TECHNOLOGY;
    {class} property TENOVIS: Integer read _GetTENOVIS;
    {class} property TERAX: Integer read _GetTERAX;
    {class} property TEXAS_INSTRUMENTS: Integer read _GetTEXAS_INSTRUMENTS;
    {class} property THINKOPTICS: Integer read _GetTHINKOPTICS;
    {class} property THREECOM: Integer read _GetTHREECOM;
    {class} property THREE_DIJOY: Integer read _GetTHREE_DIJOY;
    {class} property THREE_DSP: Integer read _GetTHREE_DSP;
    {class} property TIMEKEEPING_SYSTEMS: Integer read _GetTIMEKEEPING_SYSTEMS;
    {class} property TIMEX_GROUP_USA: Integer read _GetTIMEX_GROUP_USA;
    {class} property TOPCORN_POSITIONING_SYSTEMS: Integer read _GetTOPCORN_POSITIONING_SYSTEMS;
    {class} property TOSHIBA: Integer read _GetTOSHIBA;
    {class} property TRANSILICA: Integer read _GetTRANSILICA;
    {class} property TRELAB: Integer read _GetTRELAB;
    {class} property TTPCOM: Integer read _GetTTPCOM;
    {class} property TXTR: Integer read _GetTXTR;
    {class} property TZERO_TECHNOLOGIES: Integer read _GetTZERO_TECHNOLOGIES;
    {class} property UNIVERSAL_ELECTRONICS: Integer read _GetUNIVERSAL_ELECTRONICS;
    {class} property VERTU: Integer read _GetVERTU;
    {class} property VISTEON: Integer read _GetVISTEON;
    {class} property VIZIO: Integer read _GetVIZIO;
    {class} property VOYETRA_TURTLE_BEACH: Integer read _GetVOYETRA_TURTLE_BEACH;
    {class} property WAVEPLUS_TECHNOLOGY: Integer read _GetWAVEPLUS_TECHNOLOGY;
    {class} property WICENTRIC: Integer read _GetWICENTRIC;
    {class} property WIDCOMM: Integer read _GetWIDCOMM;
    {class} property WUXI_VIMICRO: Integer read _GetWUXI_VIMICRO;
    {class} property ZEEVO: Integer read _GetZEEVO;
    {class} property ZER01_TV: Integer read _GetZER01_TV;
    {class} property ZOMM: Integer read _GetZOMM;
    {class} property ZSCAN_SOFTWARE: Integer read _GetZSCAN_SOFTWARE;
  end;

  [JavaSignature('android/bluetooth/BluetoothAssignedNumbers')]
  JBluetoothAssignedNumbers = interface(JObject)
    ['{FD73BBEE-B1E1-4F52-AF25-AC98D94FA319}']
  end;
  TJBluetoothAssignedNumbers = class(TJavaGenericImport<JBluetoothAssignedNumbersClass, JBluetoothAssignedNumbers>) end;

  Jbluetooth_BluetoothClassClass = interface(JObjectClass)
    ['{FF258AE0-A7F8-4869-B4F6-F061D1AE1264}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPROFILE_A2DP: Integer; cdecl;
    {class} function _GetPROFILE_HEADSET: Integer; cdecl;
    {class} function _GetPROFILE_HID: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PROFILE_A2DP: Integer read _GetPROFILE_A2DP;
    {class} property PROFILE_HEADSET: Integer read _GetPROFILE_HEADSET;
    {class} property PROFILE_HID: Integer read _GetPROFILE_HID;
  end;

  [JavaSignature('android/bluetooth/BluetoothClass')]
  Jbluetooth_BluetoothClass = interface(JObject)
    ['{5B43837A-0671-4D08-9885-EA58330D393E}']
    function describeContents: Integer; cdecl;
    function doesClassMatch(profile: Integer): Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDeviceClass: Integer; cdecl;
    function getMajorDeviceClass: Integer; cdecl;
    function hasService(service: Integer): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJbluetooth_BluetoothClass = class(TJavaGenericImport<Jbluetooth_BluetoothClassClass, Jbluetooth_BluetoothClass>) end;

  JBluetoothClass_DeviceClass = interface(JObjectClass)
    ['{38E343FC-1BF6-439D-96B5-C71B4B066930}']
    {class} function _GetAUDIO_VIDEO_CAMCORDER: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_CAR_AUDIO: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_HANDSFREE: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_HEADPHONES: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_HIFI_AUDIO: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_LOUDSPEAKER: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_MICROPHONE: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_PORTABLE_AUDIO: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_SET_TOP_BOX: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VCR: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VIDEO_CAMERA: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VIDEO_CONFERENCING: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VIDEO_GAMING_TOY: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_VIDEO_MONITOR: Integer; cdecl;
    {class} function _GetAUDIO_VIDEO_WEARABLE_HEADSET: Integer; cdecl;
    {class} function _GetCOMPUTER_DESKTOP: Integer; cdecl;
    {class} function _GetCOMPUTER_HANDHELD_PC_PDA: Integer; cdecl;
    {class} function _GetCOMPUTER_LAPTOP: Integer; cdecl;
    {class} function _GetCOMPUTER_PALM_SIZE_PC_PDA: Integer; cdecl;
    {class} function _GetCOMPUTER_SERVER: Integer; cdecl;
    {class} function _GetCOMPUTER_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetCOMPUTER_WEARABLE: Integer; cdecl;
    {class} function _GetHEALTH_BLOOD_PRESSURE: Integer; cdecl;
    {class} function _GetHEALTH_DATA_DISPLAY: Integer; cdecl;
    {class} function _GetHEALTH_GLUCOSE: Integer; cdecl;
    {class} function _GetHEALTH_PULSE_OXIMETER: Integer; cdecl;
    {class} function _GetHEALTH_PULSE_RATE: Integer; cdecl;
    {class} function _GetHEALTH_THERMOMETER: Integer; cdecl;
    {class} function _GetHEALTH_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetHEALTH_WEIGHING: Integer; cdecl;
    {class} function _GetPERIPHERAL_KEYBOARD: Integer; cdecl;
    {class} function _GetPERIPHERAL_KEYBOARD_POINTING: Integer; cdecl;
    {class} function _GetPERIPHERAL_NON_KEYBOARD_NON_POINTING: Integer; cdecl;
    {class} function _GetPERIPHERAL_POINTING: Integer; cdecl;
    {class} function _GetPHONE_CELLULAR: Integer; cdecl;
    {class} function _GetPHONE_CORDLESS: Integer; cdecl;
    {class} function _GetPHONE_ISDN: Integer; cdecl;
    {class} function _GetPHONE_MODEM_OR_GATEWAY: Integer; cdecl;
    {class} function _GetPHONE_SMART: Integer; cdecl;
    {class} function _GetPHONE_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetTOY_CONTROLLER: Integer; cdecl;
    {class} function _GetTOY_DOLL_ACTION_FIGURE: Integer; cdecl;
    {class} function _GetTOY_GAME: Integer; cdecl;
    {class} function _GetTOY_ROBOT: Integer; cdecl;
    {class} function _GetTOY_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetTOY_VEHICLE: Integer; cdecl;
    {class} function _GetWEARABLE_GLASSES: Integer; cdecl;
    {class} function _GetWEARABLE_HELMET: Integer; cdecl;
    {class} function _GetWEARABLE_JACKET: Integer; cdecl;
    {class} function _GetWEARABLE_PAGER: Integer; cdecl;
    {class} function _GetWEARABLE_UNCATEGORIZED: Integer; cdecl;
    {class} function _GetWEARABLE_WRIST_WATCH: Integer; cdecl;
    {class} function init: JBluetoothClass_Device; cdecl;
    {class} property AUDIO_VIDEO_CAMCORDER: Integer read _GetAUDIO_VIDEO_CAMCORDER;
    {class} property AUDIO_VIDEO_CAR_AUDIO: Integer read _GetAUDIO_VIDEO_CAR_AUDIO;
    {class} property AUDIO_VIDEO_HANDSFREE: Integer read _GetAUDIO_VIDEO_HANDSFREE;
    {class} property AUDIO_VIDEO_HEADPHONES: Integer read _GetAUDIO_VIDEO_HEADPHONES;
    {class} property AUDIO_VIDEO_HIFI_AUDIO: Integer read _GetAUDIO_VIDEO_HIFI_AUDIO;
    {class} property AUDIO_VIDEO_LOUDSPEAKER: Integer read _GetAUDIO_VIDEO_LOUDSPEAKER;
    {class} property AUDIO_VIDEO_MICROPHONE: Integer read _GetAUDIO_VIDEO_MICROPHONE;
    {class} property AUDIO_VIDEO_PORTABLE_AUDIO: Integer read _GetAUDIO_VIDEO_PORTABLE_AUDIO;
    {class} property AUDIO_VIDEO_SET_TOP_BOX: Integer read _GetAUDIO_VIDEO_SET_TOP_BOX;
    {class} property AUDIO_VIDEO_UNCATEGORIZED: Integer read _GetAUDIO_VIDEO_UNCATEGORIZED;
    {class} property AUDIO_VIDEO_VCR: Integer read _GetAUDIO_VIDEO_VCR;
    {class} property AUDIO_VIDEO_VIDEO_CAMERA: Integer read _GetAUDIO_VIDEO_VIDEO_CAMERA;
    {class} property AUDIO_VIDEO_VIDEO_CONFERENCING: Integer read _GetAUDIO_VIDEO_VIDEO_CONFERENCING;
    {class} property AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER: Integer read _GetAUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER;
    {class} property AUDIO_VIDEO_VIDEO_GAMING_TOY: Integer read _GetAUDIO_VIDEO_VIDEO_GAMING_TOY;
    {class} property AUDIO_VIDEO_VIDEO_MONITOR: Integer read _GetAUDIO_VIDEO_VIDEO_MONITOR;
    {class} property AUDIO_VIDEO_WEARABLE_HEADSET: Integer read _GetAUDIO_VIDEO_WEARABLE_HEADSET;
    {class} property COMPUTER_DESKTOP: Integer read _GetCOMPUTER_DESKTOP;
    {class} property COMPUTER_HANDHELD_PC_PDA: Integer read _GetCOMPUTER_HANDHELD_PC_PDA;
    {class} property COMPUTER_LAPTOP: Integer read _GetCOMPUTER_LAPTOP;
    {class} property COMPUTER_PALM_SIZE_PC_PDA: Integer read _GetCOMPUTER_PALM_SIZE_PC_PDA;
    {class} property COMPUTER_SERVER: Integer read _GetCOMPUTER_SERVER;
    {class} property COMPUTER_UNCATEGORIZED: Integer read _GetCOMPUTER_UNCATEGORIZED;
    {class} property COMPUTER_WEARABLE: Integer read _GetCOMPUTER_WEARABLE;
    {class} property HEALTH_BLOOD_PRESSURE: Integer read _GetHEALTH_BLOOD_PRESSURE;
    {class} property HEALTH_DATA_DISPLAY: Integer read _GetHEALTH_DATA_DISPLAY;
    {class} property HEALTH_GLUCOSE: Integer read _GetHEALTH_GLUCOSE;
    {class} property HEALTH_PULSE_OXIMETER: Integer read _GetHEALTH_PULSE_OXIMETER;
    {class} property HEALTH_PULSE_RATE: Integer read _GetHEALTH_PULSE_RATE;
    {class} property HEALTH_THERMOMETER: Integer read _GetHEALTH_THERMOMETER;
    {class} property HEALTH_UNCATEGORIZED: Integer read _GetHEALTH_UNCATEGORIZED;
    {class} property HEALTH_WEIGHING: Integer read _GetHEALTH_WEIGHING;
    {class} property PERIPHERAL_KEYBOARD: Integer read _GetPERIPHERAL_KEYBOARD;
    {class} property PERIPHERAL_KEYBOARD_POINTING: Integer read _GetPERIPHERAL_KEYBOARD_POINTING;
    {class} property PERIPHERAL_NON_KEYBOARD_NON_POINTING: Integer read _GetPERIPHERAL_NON_KEYBOARD_NON_POINTING;
    {class} property PERIPHERAL_POINTING: Integer read _GetPERIPHERAL_POINTING;
    {class} property PHONE_CELLULAR: Integer read _GetPHONE_CELLULAR;
    {class} property PHONE_CORDLESS: Integer read _GetPHONE_CORDLESS;
    {class} property PHONE_ISDN: Integer read _GetPHONE_ISDN;
    {class} property PHONE_MODEM_OR_GATEWAY: Integer read _GetPHONE_MODEM_OR_GATEWAY;
    {class} property PHONE_SMART: Integer read _GetPHONE_SMART;
    {class} property PHONE_UNCATEGORIZED: Integer read _GetPHONE_UNCATEGORIZED;
    {class} property TOY_CONTROLLER: Integer read _GetTOY_CONTROLLER;
    {class} property TOY_DOLL_ACTION_FIGURE: Integer read _GetTOY_DOLL_ACTION_FIGURE;
    {class} property TOY_GAME: Integer read _GetTOY_GAME;
    {class} property TOY_ROBOT: Integer read _GetTOY_ROBOT;
    {class} property TOY_UNCATEGORIZED: Integer read _GetTOY_UNCATEGORIZED;
    {class} property TOY_VEHICLE: Integer read _GetTOY_VEHICLE;
    {class} property WEARABLE_GLASSES: Integer read _GetWEARABLE_GLASSES;
    {class} property WEARABLE_HELMET: Integer read _GetWEARABLE_HELMET;
    {class} property WEARABLE_JACKET: Integer read _GetWEARABLE_JACKET;
    {class} property WEARABLE_PAGER: Integer read _GetWEARABLE_PAGER;
    {class} property WEARABLE_UNCATEGORIZED: Integer read _GetWEARABLE_UNCATEGORIZED;
    {class} property WEARABLE_WRIST_WATCH: Integer read _GetWEARABLE_WRIST_WATCH;
  end;

  [JavaSignature('android/bluetooth/BluetoothClass$Device')]
  JBluetoothClass_Device = interface(JObject)
    ['{075C1041-C493-488E-A668-5D470339A25B}']
  end;
  TJBluetoothClass_Device = class(TJavaGenericImport<JBluetoothClass_DeviceClass, JBluetoothClass_Device>) end;

  JDevice_MajorClass = interface(JObjectClass)
    ['{5C10CF59-50A2-4C87-B8D9-0BEC242F190C}']
    {class} function _GetAUDIO_VIDEO: Integer; cdecl;
    {class} function _GetCOMPUTER: Integer; cdecl;
    {class} function _GetHEALTH: Integer; cdecl;
    {class} function _GetIMAGING: Integer; cdecl;
    {class} function _GetMISC: Integer; cdecl;
    {class} function _GetNETWORKING: Integer; cdecl;
    {class} function _GetPERIPHERAL: Integer; cdecl;
    {class} function _GetPHONE: Integer; cdecl;
    {class} function _GetTOY: Integer; cdecl;
    {class} function _GetUNCATEGORIZED: Integer; cdecl;
    {class} function _GetWEARABLE: Integer; cdecl;
    {class} function init: JDevice_Major; cdecl;
    {class} property AUDIO_VIDEO: Integer read _GetAUDIO_VIDEO;
    {class} property COMPUTER: Integer read _GetCOMPUTER;
    {class} property HEALTH: Integer read _GetHEALTH;
    {class} property IMAGING: Integer read _GetIMAGING;
    {class} property MISC: Integer read _GetMISC;
    {class} property NETWORKING: Integer read _GetNETWORKING;
    {class} property PERIPHERAL: Integer read _GetPERIPHERAL;
    {class} property PHONE: Integer read _GetPHONE;
    {class} property TOY: Integer read _GetTOY;
    {class} property UNCATEGORIZED: Integer read _GetUNCATEGORIZED;
    {class} property WEARABLE: Integer read _GetWEARABLE;
  end;

  [JavaSignature('android/bluetooth/BluetoothClass$Device$Major')]
  JDevice_Major = interface(JObject)
    ['{3BF5E3F7-14A8-4940-AA15-4E41858E41CE}']
  end;
  TJDevice_Major = class(TJavaGenericImport<JDevice_MajorClass, JDevice_Major>) end;

  JBluetoothClass_ServiceClass = interface(JObjectClass)
    ['{119150F9-9A31-46EE-871B-8DB6BDD19F17}']
    {class} function _GetAUDIO: Integer; cdecl;
    {class} function _GetCAPTURE: Integer; cdecl;
    {class} function _GetINFORMATION: Integer; cdecl;
    {class} function _GetLE_AUDIO: Integer; cdecl;
    {class} function _GetLIMITED_DISCOVERABILITY: Integer; cdecl;
    {class} function _GetNETWORKING: Integer; cdecl;
    {class} function _GetOBJECT_TRANSFER: Integer; cdecl;
    {class} function _GetPOSITIONING: Integer; cdecl;
    {class} function _GetRENDER: Integer; cdecl;
    {class} function _GetTELEPHONY: Integer; cdecl;
    {class} function init: JBluetoothClass_Service; cdecl;
    {class} property AUDIO: Integer read _GetAUDIO;
    {class} property CAPTURE: Integer read _GetCAPTURE;
    {class} property INFORMATION: Integer read _GetINFORMATION;
    {class} property LE_AUDIO: Integer read _GetLE_AUDIO;
    {class} property LIMITED_DISCOVERABILITY: Integer read _GetLIMITED_DISCOVERABILITY;
    {class} property NETWORKING: Integer read _GetNETWORKING;
    {class} property OBJECT_TRANSFER: Integer read _GetOBJECT_TRANSFER;
    {class} property POSITIONING: Integer read _GetPOSITIONING;
    {class} property RENDER: Integer read _GetRENDER;
    {class} property TELEPHONY: Integer read _GetTELEPHONY;
  end;

  [JavaSignature('android/bluetooth/BluetoothClass$Service')]
  JBluetoothClass_Service = interface(JObject)
    ['{DD0314CB-EE35-4535-81CB-71F4D9E149E9}']
  end;
  TJBluetoothClass_Service = class(TJavaGenericImport<JBluetoothClass_ServiceClass, JBluetoothClass_Service>) end;

  JBluetoothCodecConfigClass = interface(JObjectClass)
    ['{1BD5FF4A-6BEB-4671-80AA-AF8232104BB9}']
    {class} function _GetBITS_PER_SAMPLE_16: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_24: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_32: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_NONE: Integer; cdecl;
    {class} function _GetCHANNEL_MODE_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_MODE_NONE: Integer; cdecl;
    {class} function _GetCHANNEL_MODE_STEREO: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_DEFAULT: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_DISABLED: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_HIGHEST: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSAMPLE_RATE_176400: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_192000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_44100: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_48000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_88200: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_96000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_NONE: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_AAC: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_APTX: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_APTX_HD: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_INVALID: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_LC3: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_LDAC: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_SBC: Integer; cdecl;
    {class} property BITS_PER_SAMPLE_16: Integer read _GetBITS_PER_SAMPLE_16;
    {class} property BITS_PER_SAMPLE_24: Integer read _GetBITS_PER_SAMPLE_24;
    {class} property BITS_PER_SAMPLE_32: Integer read _GetBITS_PER_SAMPLE_32;
    {class} property BITS_PER_SAMPLE_NONE: Integer read _GetBITS_PER_SAMPLE_NONE;
    {class} property CHANNEL_MODE_MONO: Integer read _GetCHANNEL_MODE_MONO;
    {class} property CHANNEL_MODE_NONE: Integer read _GetCHANNEL_MODE_NONE;
    {class} property CHANNEL_MODE_STEREO: Integer read _GetCHANNEL_MODE_STEREO;
    {class} property CODEC_PRIORITY_DEFAULT: Integer read _GetCODEC_PRIORITY_DEFAULT;
    {class} property CODEC_PRIORITY_DISABLED: Integer read _GetCODEC_PRIORITY_DISABLED;
    {class} property CODEC_PRIORITY_HIGHEST: Integer read _GetCODEC_PRIORITY_HIGHEST;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SAMPLE_RATE_176400: Integer read _GetSAMPLE_RATE_176400;
    {class} property SAMPLE_RATE_192000: Integer read _GetSAMPLE_RATE_192000;
    {class} property SAMPLE_RATE_44100: Integer read _GetSAMPLE_RATE_44100;
    {class} property SAMPLE_RATE_48000: Integer read _GetSAMPLE_RATE_48000;
    {class} property SAMPLE_RATE_88200: Integer read _GetSAMPLE_RATE_88200;
    {class} property SAMPLE_RATE_96000: Integer read _GetSAMPLE_RATE_96000;
    {class} property SAMPLE_RATE_NONE: Integer read _GetSAMPLE_RATE_NONE;
    {class} property SOURCE_CODEC_TYPE_AAC: Integer read _GetSOURCE_CODEC_TYPE_AAC;
    {class} property SOURCE_CODEC_TYPE_APTX: Integer read _GetSOURCE_CODEC_TYPE_APTX;
    {class} property SOURCE_CODEC_TYPE_APTX_HD: Integer read _GetSOURCE_CODEC_TYPE_APTX_HD;
    {class} property SOURCE_CODEC_TYPE_INVALID: Integer read _GetSOURCE_CODEC_TYPE_INVALID;
    {class} property SOURCE_CODEC_TYPE_LC3: Integer read _GetSOURCE_CODEC_TYPE_LC3;
    {class} property SOURCE_CODEC_TYPE_LDAC: Integer read _GetSOURCE_CODEC_TYPE_LDAC;
    {class} property SOURCE_CODEC_TYPE_SBC: Integer read _GetSOURCE_CODEC_TYPE_SBC;
  end;

  [JavaSignature('android/bluetooth/BluetoothCodecConfig')]
  JBluetoothCodecConfig = interface(JObject)
    ['{81DAEEED-E2AA-4BEF-BEC0-86F16FCBD9F2}']
    function equals(o: JObject): Boolean; cdecl;
    function getBitsPerSample: Integer; cdecl;
    function getChannelMode: Integer; cdecl;
    function getCodecPriority: Integer; cdecl;
    function getCodecSpecific1: Int64; cdecl;
    function getCodecSpecific2: Int64; cdecl;
    function getCodecSpecific3: Int64; cdecl;
    function getCodecSpecific4: Int64; cdecl;
    function getCodecType: Integer; cdecl;
    function getSampleRate: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isMandatoryCodec: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJBluetoothCodecConfig = class(TJavaGenericImport<JBluetoothCodecConfigClass, JBluetoothCodecConfig>) end;

  JBluetoothCodecConfig_BuilderClass = interface(JObjectClass)
    ['{2F9D8688-305A-4C7C-9F9B-504C5B629E87}']
    {class} function init: JBluetoothCodecConfig_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothCodecConfig$Builder')]
  JBluetoothCodecConfig_Builder = interface(JObject)
    ['{A848A59D-EC7E-4F22-B625-2792B1F23480}']
    function build: JBluetoothCodecConfig; cdecl;
    function setBitsPerSample(bitsPerSample: Integer): JBluetoothCodecConfig_Builder; cdecl;
    function setChannelMode(channelMode: Integer): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecPriority(codecPriority: Integer): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecSpecific1(codecSpecific1: Int64): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecSpecific2(codecSpecific2: Int64): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecSpecific3(codecSpecific3: Int64): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecSpecific4(codecSpecific4: Int64): JBluetoothCodecConfig_Builder; cdecl;
    function setCodecType(codecType: Integer): JBluetoothCodecConfig_Builder; cdecl;
    function setSampleRate(sampleRate: Integer): JBluetoothCodecConfig_Builder; cdecl;
  end;
  TJBluetoothCodecConfig_Builder = class(TJavaGenericImport<JBluetoothCodecConfig_BuilderClass, JBluetoothCodecConfig_Builder>) end;

  JBluetoothCodecStatusClass = interface(JObjectClass)
    ['{64E72538-5BA4-4C4C-9AB3-2DCC0AAC7090}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_CODEC_STATUS: JString; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_CODEC_STATUS: JString read _GetEXTRA_CODEC_STATUS;
  end;

  [JavaSignature('android/bluetooth/BluetoothCodecStatus')]
  JBluetoothCodecStatus = interface(JObject)
    ['{94587844-69EB-47C0-BDCB-625B44949A05}']
    function equals(o: JObject): Boolean; cdecl;
    function getCodecConfig: JBluetoothCodecConfig; cdecl;
    function getCodecsLocalCapabilities: JList; cdecl;
    function getCodecsSelectableCapabilities: JList; cdecl;
    function hashCode: Integer; cdecl;
    function isCodecConfigSelectable(codecConfig: JBluetoothCodecConfig): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothCodecStatus = class(TJavaGenericImport<JBluetoothCodecStatusClass, JBluetoothCodecStatus>) end;

  JBluetoothCodecStatus_BuilderClass = interface(JObjectClass)
    ['{85C62D38-BD35-4DF9-ACFF-8E640CF2FA34}']
    {class} function init: JBluetoothCodecStatus_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothCodecStatus$Builder')]
  JBluetoothCodecStatus_Builder = interface(JObject)
    ['{4664C550-3150-4301-B37B-0B1E0F943875}']
    function build: JBluetoothCodecStatus; cdecl;
    function setCodecConfig(codecConfig: JBluetoothCodecConfig): JBluetoothCodecStatus_Builder; cdecl;
    function setCodecsLocalCapabilities(codecsLocalCapabilities: JList): JBluetoothCodecStatus_Builder; cdecl;
    function setCodecsSelectableCapabilities(codecsSelectableCapabilities: JList): JBluetoothCodecStatus_Builder; cdecl;
  end;
  TJBluetoothCodecStatus_Builder = class(TJavaGenericImport<JBluetoothCodecStatus_BuilderClass, JBluetoothCodecStatus_Builder>) end;

  JBluetoothCsipSetCoordinatorClass = interface(JObjectClass)
    ['{C5C5301E-C2D7-4968-BF04-E4C91D595F5E}']
    {class} function _GetACTION_CSIS_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} property ACTION_CSIS_CONNECTION_STATE_CHANGED: JString read _GetACTION_CSIS_CONNECTION_STATE_CHANGED;
  end;

  [JavaSignature('android/bluetooth/BluetoothCsipSetCoordinator')]
  JBluetoothCsipSetCoordinator = interface(JObject)
    ['{85CE89BA-C0F4-4914-AC01-AD1C43CA7CCA}']
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
  end;
  TJBluetoothCsipSetCoordinator = class(TJavaGenericImport<JBluetoothCsipSetCoordinatorClass, JBluetoothCsipSetCoordinator>) end;

  JBluetoothDeviceClass = interface(JObjectClass)
    ['{E230F5F8-B398-45A4-8872-9157EBB23736}']
    {class} function _GetACTION_ACL_CONNECTED: JString; cdecl;
    {class} function _GetACTION_ACL_DISCONNECTED: JString; cdecl;
    {class} function _GetACTION_ACL_DISCONNECT_REQUESTED: JString; cdecl;
    {class} function _GetACTION_ALIAS_CHANGED: JString; cdecl;
    {class} function _GetACTION_BOND_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_CLASS_CHANGED: JString; cdecl;
    {class} function _GetACTION_FOUND: JString; cdecl;
    {class} function _GetACTION_NAME_CHANGED: JString; cdecl;
    {class} function _GetACTION_PAIRING_REQUEST: JString; cdecl;
    {class} function _GetACTION_UUID: JString; cdecl;
    {class} function _GetADDRESS_TYPE_PUBLIC: Integer; cdecl;
    {class} function _GetADDRESS_TYPE_RANDOM: Integer; cdecl;
    {class} function _GetADDRESS_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetBOND_BONDED: Integer; cdecl;
    {class} function _GetBOND_BONDING: Integer; cdecl;
    {class} function _GetBOND_NONE: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDEVICE_TYPE_CLASSIC: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_DUAL: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_LE: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetEXTRA_BOND_STATE: JString; cdecl;
    {class} function _GetEXTRA_CLASS: JString; cdecl;
    {class} function _GetEXTRA_DEVICE: JString; cdecl;
    {class} function _GetEXTRA_IS_COORDINATED_SET_MEMBER: JString; cdecl;
    {class} function _GetEXTRA_NAME: JString; cdecl;
    {class} function _GetEXTRA_PAIRING_KEY: JString; cdecl;
    {class} function _GetEXTRA_PAIRING_VARIANT: JString; cdecl;
    {class} function _GetEXTRA_PREVIOUS_BOND_STATE: JString; cdecl;
    {class} function _GetEXTRA_RSSI: JString; cdecl;
    {class} function _GetEXTRA_TRANSPORT: JString; cdecl;
    {class} function _GetEXTRA_UUID: JString; cdecl;
    {class} function _GetPAIRING_VARIANT_PASSKEY_CONFIRMATION: Integer; cdecl;
    {class} function _GetPAIRING_VARIANT_PIN: Integer; cdecl;
    {class} function _GetPHY_LE_1M: Integer; cdecl;
    {class} function _GetPHY_LE_1M_MASK: Integer; cdecl;
    {class} function _GetPHY_LE_2M: Integer; cdecl;
    {class} function _GetPHY_LE_2M_MASK: Integer; cdecl;
    {class} function _GetPHY_LE_CODED: Integer; cdecl;
    {class} function _GetPHY_LE_CODED_MASK: Integer; cdecl;
    {class} function _GetPHY_OPTION_NO_PREFERRED: Integer; cdecl;
    {class} function _GetPHY_OPTION_S2: Integer; cdecl;
    {class} function _GetPHY_OPTION_S8: Integer; cdecl;
    {class} function _GetTRANSPORT_AUTO: Integer; cdecl;
    {class} function _GetTRANSPORT_BREDR: Integer; cdecl;
    {class} function _GetTRANSPORT_LE: Integer; cdecl;
    {class} property ACTION_ACL_CONNECTED: JString read _GetACTION_ACL_CONNECTED;
    {class} property ACTION_ACL_DISCONNECTED: JString read _GetACTION_ACL_DISCONNECTED;
    {class} property ACTION_ACL_DISCONNECT_REQUESTED: JString read _GetACTION_ACL_DISCONNECT_REQUESTED;
    {class} property ACTION_ALIAS_CHANGED: JString read _GetACTION_ALIAS_CHANGED;
    {class} property ACTION_BOND_STATE_CHANGED: JString read _GetACTION_BOND_STATE_CHANGED;
    {class} property ACTION_CLASS_CHANGED: JString read _GetACTION_CLASS_CHANGED;
    {class} property ACTION_FOUND: JString read _GetACTION_FOUND;
    {class} property ACTION_NAME_CHANGED: JString read _GetACTION_NAME_CHANGED;
    {class} property ACTION_PAIRING_REQUEST: JString read _GetACTION_PAIRING_REQUEST;
    {class} property ACTION_UUID: JString read _GetACTION_UUID;
    {class} property ADDRESS_TYPE_PUBLIC: Integer read _GetADDRESS_TYPE_PUBLIC;
    {class} property ADDRESS_TYPE_RANDOM: Integer read _GetADDRESS_TYPE_RANDOM;
    {class} property ADDRESS_TYPE_UNKNOWN: Integer read _GetADDRESS_TYPE_UNKNOWN;
    {class} property BOND_BONDED: Integer read _GetBOND_BONDED;
    {class} property BOND_BONDING: Integer read _GetBOND_BONDING;
    {class} property BOND_NONE: Integer read _GetBOND_NONE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DEVICE_TYPE_CLASSIC: Integer read _GetDEVICE_TYPE_CLASSIC;
    {class} property DEVICE_TYPE_DUAL: Integer read _GetDEVICE_TYPE_DUAL;
    {class} property DEVICE_TYPE_LE: Integer read _GetDEVICE_TYPE_LE;
    {class} property DEVICE_TYPE_UNKNOWN: Integer read _GetDEVICE_TYPE_UNKNOWN;
    {class} property ERROR: Integer read _GetERROR;
    {class} property EXTRA_BOND_STATE: JString read _GetEXTRA_BOND_STATE;
    {class} property EXTRA_CLASS: JString read _GetEXTRA_CLASS;
    {class} property EXTRA_DEVICE: JString read _GetEXTRA_DEVICE;
    {class} property EXTRA_IS_COORDINATED_SET_MEMBER: JString read _GetEXTRA_IS_COORDINATED_SET_MEMBER;
    {class} property EXTRA_NAME: JString read _GetEXTRA_NAME;
    {class} property EXTRA_PAIRING_KEY: JString read _GetEXTRA_PAIRING_KEY;
    {class} property EXTRA_PAIRING_VARIANT: JString read _GetEXTRA_PAIRING_VARIANT;
    {class} property EXTRA_PREVIOUS_BOND_STATE: JString read _GetEXTRA_PREVIOUS_BOND_STATE;
    {class} property EXTRA_RSSI: JString read _GetEXTRA_RSSI;
    {class} property EXTRA_TRANSPORT: JString read _GetEXTRA_TRANSPORT;
    {class} property EXTRA_UUID: JString read _GetEXTRA_UUID;
    {class} property PAIRING_VARIANT_PASSKEY_CONFIRMATION: Integer read _GetPAIRING_VARIANT_PASSKEY_CONFIRMATION;
    {class} property PAIRING_VARIANT_PIN: Integer read _GetPAIRING_VARIANT_PIN;
    {class} property PHY_LE_1M: Integer read _GetPHY_LE_1M;
    {class} property PHY_LE_1M_MASK: Integer read _GetPHY_LE_1M_MASK;
    {class} property PHY_LE_2M: Integer read _GetPHY_LE_2M;
    {class} property PHY_LE_2M_MASK: Integer read _GetPHY_LE_2M_MASK;
    {class} property PHY_LE_CODED: Integer read _GetPHY_LE_CODED;
    {class} property PHY_LE_CODED_MASK: Integer read _GetPHY_LE_CODED_MASK;
    {class} property PHY_OPTION_NO_PREFERRED: Integer read _GetPHY_OPTION_NO_PREFERRED;
    {class} property PHY_OPTION_S2: Integer read _GetPHY_OPTION_S2;
    {class} property PHY_OPTION_S8: Integer read _GetPHY_OPTION_S8;
    {class} property TRANSPORT_AUTO: Integer read _GetTRANSPORT_AUTO;
    {class} property TRANSPORT_BREDR: Integer read _GetTRANSPORT_BREDR;
    {class} property TRANSPORT_LE: Integer read _GetTRANSPORT_LE;
  end;

  [JavaSignature('android/bluetooth/BluetoothDevice')]
  JBluetoothDevice = interface(JObject)
    ['{1B2DF3AB-7AE0-4EC2-A9AC-94FCFB33FAEA}']
    function connectGatt(context: JContext; autoConnect: Boolean; callback: JBluetoothGattCallback): JBluetoothGatt; cdecl; overload;
    function connectGatt(context: JContext; autoConnect: Boolean; callback: JBluetoothGattCallback; transport: Integer): JBluetoothGatt; cdecl; overload;
    function connectGatt(context: JContext; autoConnect: Boolean; callback: JBluetoothGattCallback; transport: Integer; phy: Integer): JBluetoothGatt; cdecl; overload;
    function connectGatt(context: JContext; autoConnect: Boolean; callback: JBluetoothGattCallback; transport: Integer; phy: Integer; handler: JHandler): JBluetoothGatt; cdecl; overload;
    function createBond: Boolean; cdecl;
    function createInsecureL2capChannel(psm: Integer): JBluetoothSocket; cdecl;
    function createInsecureRfcommSocketToServiceRecord(uuid: JUUID): JBluetoothSocket; cdecl;
    function createL2capChannel(psm: Integer): JBluetoothSocket; cdecl;
    function createRfcommSocketToServiceRecord(uuid: JUUID): JBluetoothSocket; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function fetchUuidsWithSdp: Boolean; cdecl;
    function getAddress: JString; cdecl;
    function getAlias: JString; cdecl;
    function getBluetoothClass: Jbluetooth_BluetoothClass; cdecl;
    function getBondState: Integer; cdecl;
    function getName: JString; cdecl;
    function getType: Integer; cdecl;
    function getUuids: TJavaObjectArray<JParcelUuid>; cdecl;
    function hashCode: Integer; cdecl;
    function setAlias(alias: JString): Integer; cdecl;
    function setPairingConfirmation(confirm: Boolean): Boolean; cdecl;
    function setPin(pin: TJavaArray<Byte>): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothDevice = class(TJavaGenericImport<JBluetoothDeviceClass, JBluetoothDevice>) end;

  JBluetoothGattClass = interface(JObjectClass)
    ['{1AF3FF11-8E2B-4F62-9634-1027DF298C9C}']
    {class} function _GetCONNECTION_PRIORITY_BALANCED: Integer; cdecl;
    {class} function _GetCONNECTION_PRIORITY_HIGH: Integer; cdecl;
    {class} function _GetCONNECTION_PRIORITY_LOW_POWER: Integer; cdecl;
    {class} function _GetGATT_CONNECTION_CONGESTED: Integer; cdecl;
    {class} function _GetGATT_FAILURE: Integer; cdecl;
    {class} function _GetGATT_INSUFFICIENT_AUTHENTICATION: Integer; cdecl;
    {class} function _GetGATT_INSUFFICIENT_AUTHORIZATION: Integer; cdecl;
    {class} function _GetGATT_INSUFFICIENT_ENCRYPTION: Integer; cdecl;
    {class} function _GetGATT_INVALID_ATTRIBUTE_LENGTH: Integer; cdecl;
    {class} function _GetGATT_INVALID_OFFSET: Integer; cdecl;
    {class} function _GetGATT_READ_NOT_PERMITTED: Integer; cdecl;
    {class} function _GetGATT_REQUEST_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetGATT_SUCCESS: Integer; cdecl;
    {class} function _GetGATT_WRITE_NOT_PERMITTED: Integer; cdecl;
    {class} property CONNECTION_PRIORITY_BALANCED: Integer read _GetCONNECTION_PRIORITY_BALANCED;
    {class} property CONNECTION_PRIORITY_HIGH: Integer read _GetCONNECTION_PRIORITY_HIGH;
    {class} property CONNECTION_PRIORITY_LOW_POWER: Integer read _GetCONNECTION_PRIORITY_LOW_POWER;
    {class} property GATT_CONNECTION_CONGESTED: Integer read _GetGATT_CONNECTION_CONGESTED;
    {class} property GATT_FAILURE: Integer read _GetGATT_FAILURE;
    {class} property GATT_INSUFFICIENT_AUTHENTICATION: Integer read _GetGATT_INSUFFICIENT_AUTHENTICATION;
    {class} property GATT_INSUFFICIENT_AUTHORIZATION: Integer read _GetGATT_INSUFFICIENT_AUTHORIZATION;
    {class} property GATT_INSUFFICIENT_ENCRYPTION: Integer read _GetGATT_INSUFFICIENT_ENCRYPTION;
    {class} property GATT_INVALID_ATTRIBUTE_LENGTH: Integer read _GetGATT_INVALID_ATTRIBUTE_LENGTH;
    {class} property GATT_INVALID_OFFSET: Integer read _GetGATT_INVALID_OFFSET;
    {class} property GATT_READ_NOT_PERMITTED: Integer read _GetGATT_READ_NOT_PERMITTED;
    {class} property GATT_REQUEST_NOT_SUPPORTED: Integer read _GetGATT_REQUEST_NOT_SUPPORTED;
    {class} property GATT_SUCCESS: Integer read _GetGATT_SUCCESS;
    {class} property GATT_WRITE_NOT_PERMITTED: Integer read _GetGATT_WRITE_NOT_PERMITTED;
  end;

  [JavaSignature('android/bluetooth/BluetoothGatt')]
  JBluetoothGatt = interface(JObject)
    ['{2219308F-B680-4E5A-BF4A-F0B25B3DB5F9}']
    procedure abortReliableWrite; cdecl; overload;
    procedure abortReliableWrite(mDevice: JBluetoothDevice); cdecl; overload;//Deprecated
    function beginReliableWrite: Boolean; cdecl;
    procedure close; cdecl;
    function connect: Boolean; cdecl;
    procedure disconnect; cdecl;
    function discoverServices: Boolean; cdecl;
    function executeReliableWrite: Boolean; cdecl;
    function getConnectedDevices: JList; cdecl;//Deprecated
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;//Deprecated
    function getDevice: JBluetoothDevice; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;//Deprecated
    function getService(uuid: JUUID): JBluetoothGattService; cdecl;
    function getServices: JList; cdecl;
    function readCharacteristic(characteristic: JBluetoothGattCharacteristic): Boolean; cdecl;
    function readDescriptor(descriptor: JBluetoothGattDescriptor): Boolean; cdecl;
    procedure readPhy; cdecl;
    function readRemoteRssi: Boolean; cdecl;
    function requestConnectionPriority(connectionPriority: Integer): Boolean; cdecl;
    function requestMtu(mtu: Integer): Boolean; cdecl;
    function setCharacteristicNotification(characteristic: JBluetoothGattCharacteristic; enable: Boolean): Boolean; cdecl;
    procedure setPreferredPhy(txPhy: Integer; rxPhy: Integer; phyOptions: Integer); cdecl;
    function writeCharacteristic(characteristic: JBluetoothGattCharacteristic): Boolean; cdecl; overload;//Deprecated
    function writeCharacteristic(characteristic: JBluetoothGattCharacteristic; value: TJavaArray<Byte>; writeType: Integer): Integer; cdecl; overload;
    function writeDescriptor(descriptor: JBluetoothGattDescriptor): Boolean; cdecl; overload;//Deprecated
    function writeDescriptor(descriptor: JBluetoothGattDescriptor; value: TJavaArray<Byte>): Integer; cdecl; overload;
    // refresh method handy added, public but hidden api method.
    function refresh: Boolean; cdecl;
  end;
  TJBluetoothGatt = class(TJavaGenericImport<JBluetoothGattClass, JBluetoothGatt>) end;

  JBluetoothGattCallbackClass = interface(JObjectClass)
    ['{2E94E69F-765D-47FC-A45C-62182F73CF9B}']
    {class} function init: JBluetoothGattCallback; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothGattCallback')]
  JBluetoothGattCallback = interface(JObject)
    ['{E07848AC-B968-4C94-9F67-4DC5E62CB8D3}']
    procedure onCharacteristicChanged(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic); cdecl; overload;//Deprecated
    procedure onCharacteristicChanged(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; value: TJavaArray<Byte>); cdecl; overload;
    procedure onCharacteristicRead(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl; overload;//Deprecated
    procedure onCharacteristicRead(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; value: TJavaArray<Byte>; status: Integer); cdecl; overload;
    procedure onCharacteristicWrite(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl;
    procedure onConnectionStateChange(gatt: JBluetoothGatt; status: Integer; newState: Integer); cdecl;
    procedure onDescriptorRead(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl; overload;//Deprecated
    procedure onDescriptorRead(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer; value: TJavaArray<Byte>); cdecl; overload;
    procedure onDescriptorWrite(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl;
    procedure onMtuChanged(gatt: JBluetoothGatt; mtu: Integer; status: Integer); cdecl;
    procedure onPhyRead(gatt: JBluetoothGatt; txPhy: Integer; rxPhy: Integer; status: Integer); cdecl;
    procedure onPhyUpdate(gatt: JBluetoothGatt; txPhy: Integer; rxPhy: Integer; status: Integer); cdecl;
    procedure onReadRemoteRssi(gatt: JBluetoothGatt; rssi: Integer; status: Integer); cdecl;
    procedure onReliableWriteCompleted(gatt: JBluetoothGatt; status: Integer); cdecl;
    procedure onServiceChanged(gatt: JBluetoothGatt); cdecl;
    procedure onServicesDiscovered(gatt: JBluetoothGatt; status: Integer); cdecl;
  end;
  TJBluetoothGattCallback = class(TJavaGenericImport<JBluetoothGattCallbackClass, JBluetoothGattCallback>) end;

  JBluetoothGattCharacteristicClass = interface(JObjectClass)
    ['{3BA3788A-A058-43CA-BFE1-BB06896EA7FD}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFORMAT_FLOAT: Integer; cdecl;
    {class} function _GetFORMAT_SFLOAT: Integer; cdecl;
    {class} function _GetFORMAT_SINT16: Integer; cdecl;
    {class} function _GetFORMAT_SINT32: Integer; cdecl;
    {class} function _GetFORMAT_SINT8: Integer; cdecl;
    {class} function _GetFORMAT_UINT16: Integer; cdecl;
    {class} function _GetFORMAT_UINT32: Integer; cdecl;
    {class} function _GetFORMAT_UINT8: Integer; cdecl;
    {class} function _GetPERMISSION_READ: Integer; cdecl;
    {class} function _GetPERMISSION_READ_ENCRYPTED: Integer; cdecl;
    {class} function _GetPERMISSION_READ_ENCRYPTED_MITM: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_ENCRYPTED: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_ENCRYPTED_MITM: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_SIGNED: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_SIGNED_MITM: Integer; cdecl;
    {class} function _GetPROPERTY_BROADCAST: Integer; cdecl;
    {class} function _GetPROPERTY_EXTENDED_PROPS: Integer; cdecl;
    {class} function _GetPROPERTY_INDICATE: Integer; cdecl;
    {class} function _GetPROPERTY_NOTIFY: Integer; cdecl;
    {class} function _GetPROPERTY_READ: Integer; cdecl;
    {class} function _GetPROPERTY_SIGNED_WRITE: Integer; cdecl;
    {class} function _GetPROPERTY_WRITE: Integer; cdecl;
    {class} function _GetPROPERTY_WRITE_NO_RESPONSE: Integer; cdecl;
    {class} function _GetWRITE_TYPE_DEFAULT: Integer; cdecl;
    {class} function _GetWRITE_TYPE_NO_RESPONSE: Integer; cdecl;
    {class} function _GetWRITE_TYPE_SIGNED: Integer; cdecl;
    {class} function init(uuid: JUUID; properties: Integer; permissions: Integer): JBluetoothGattCharacteristic; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FORMAT_FLOAT: Integer read _GetFORMAT_FLOAT;
    {class} property FORMAT_SFLOAT: Integer read _GetFORMAT_SFLOAT;
    {class} property FORMAT_SINT16: Integer read _GetFORMAT_SINT16;
    {class} property FORMAT_SINT32: Integer read _GetFORMAT_SINT32;
    {class} property FORMAT_SINT8: Integer read _GetFORMAT_SINT8;
    {class} property FORMAT_UINT16: Integer read _GetFORMAT_UINT16;
    {class} property FORMAT_UINT32: Integer read _GetFORMAT_UINT32;
    {class} property FORMAT_UINT8: Integer read _GetFORMAT_UINT8;
    {class} property PERMISSION_READ: Integer read _GetPERMISSION_READ;
    {class} property PERMISSION_READ_ENCRYPTED: Integer read _GetPERMISSION_READ_ENCRYPTED;
    {class} property PERMISSION_READ_ENCRYPTED_MITM: Integer read _GetPERMISSION_READ_ENCRYPTED_MITM;
    {class} property PERMISSION_WRITE: Integer read _GetPERMISSION_WRITE;
    {class} property PERMISSION_WRITE_ENCRYPTED: Integer read _GetPERMISSION_WRITE_ENCRYPTED;
    {class} property PERMISSION_WRITE_ENCRYPTED_MITM: Integer read _GetPERMISSION_WRITE_ENCRYPTED_MITM;
    {class} property PERMISSION_WRITE_SIGNED: Integer read _GetPERMISSION_WRITE_SIGNED;
    {class} property PERMISSION_WRITE_SIGNED_MITM: Integer read _GetPERMISSION_WRITE_SIGNED_MITM;
    {class} property PROPERTY_BROADCAST: Integer read _GetPROPERTY_BROADCAST;
    {class} property PROPERTY_EXTENDED_PROPS: Integer read _GetPROPERTY_EXTENDED_PROPS;
    {class} property PROPERTY_INDICATE: Integer read _GetPROPERTY_INDICATE;
    {class} property PROPERTY_NOTIFY: Integer read _GetPROPERTY_NOTIFY;
    {class} property PROPERTY_READ: Integer read _GetPROPERTY_READ;
    {class} property PROPERTY_SIGNED_WRITE: Integer read _GetPROPERTY_SIGNED_WRITE;
    {class} property PROPERTY_WRITE: Integer read _GetPROPERTY_WRITE;
    {class} property PROPERTY_WRITE_NO_RESPONSE: Integer read _GetPROPERTY_WRITE_NO_RESPONSE;
    {class} property WRITE_TYPE_DEFAULT: Integer read _GetWRITE_TYPE_DEFAULT;
    {class} property WRITE_TYPE_NO_RESPONSE: Integer read _GetWRITE_TYPE_NO_RESPONSE;
    {class} property WRITE_TYPE_SIGNED: Integer read _GetWRITE_TYPE_SIGNED;
  end;

  [JavaSignature('android/bluetooth/BluetoothGattCharacteristic')]
  JBluetoothGattCharacteristic = interface(JObject)
    ['{BB707DD3-B74D-4B10-9BD0-C53E4D63FC37}']
    function addDescriptor(descriptor: JBluetoothGattDescriptor): Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function getDescriptor(uuid: JUUID): JBluetoothGattDescriptor; cdecl;
    function getDescriptors: JList; cdecl;
    function getFloatValue(formatType: Integer; offset: Integer): JFloat; cdecl;//Deprecated
    function getInstanceId: Integer; cdecl;
    function getIntValue(formatType: Integer; offset: Integer): JInteger; cdecl;//Deprecated
    function getPermissions: Integer; cdecl;
    function getProperties: Integer; cdecl;
    function getService: JBluetoothGattService; cdecl;
    function getStringValue(offset: Integer): JString; cdecl;//Deprecated
    function getUuid: JUUID; cdecl;
    function getValue: TJavaArray<Byte>; cdecl;//Deprecated
    function getWriteType: Integer; cdecl;
    function setValue(value: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function setValue(value: Integer; formatType: Integer; offset: Integer): Boolean; cdecl; overload;//Deprecated
    function setValue(mantissa: Integer; exponent: Integer; formatType: Integer; offset: Integer): Boolean; cdecl; overload;//Deprecated
    function setValue(value: JString): Boolean; cdecl; overload;//Deprecated
    procedure setWriteType(writeType: Integer); cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothGattCharacteristic = class(TJavaGenericImport<JBluetoothGattCharacteristicClass, JBluetoothGattCharacteristic>) end;

  JBluetoothGattDescriptorClass = interface(JObjectClass)
    ['{28C0B7DC-35A2-4C0B-BF12-377AFB7D767C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDISABLE_NOTIFICATION_VALUE: TJavaArray<Byte>; cdecl;
    {class} function _GetENABLE_INDICATION_VALUE: TJavaArray<Byte>; cdecl;
    {class} function _GetENABLE_NOTIFICATION_VALUE: TJavaArray<Byte>; cdecl;
    {class} function _GetPERMISSION_READ: Integer; cdecl;
    {class} function _GetPERMISSION_READ_ENCRYPTED: Integer; cdecl;
    {class} function _GetPERMISSION_READ_ENCRYPTED_MITM: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_ENCRYPTED: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_ENCRYPTED_MITM: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_SIGNED: Integer; cdecl;
    {class} function _GetPERMISSION_WRITE_SIGNED_MITM: Integer; cdecl;
    {class} function init(uuid: JUUID; permissions: Integer): JBluetoothGattDescriptor; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DISABLE_NOTIFICATION_VALUE: TJavaArray<Byte> read _GetDISABLE_NOTIFICATION_VALUE;
    {class} property ENABLE_INDICATION_VALUE: TJavaArray<Byte> read _GetENABLE_INDICATION_VALUE;
    {class} property ENABLE_NOTIFICATION_VALUE: TJavaArray<Byte> read _GetENABLE_NOTIFICATION_VALUE;
    {class} property PERMISSION_READ: Integer read _GetPERMISSION_READ;
    {class} property PERMISSION_READ_ENCRYPTED: Integer read _GetPERMISSION_READ_ENCRYPTED;
    {class} property PERMISSION_READ_ENCRYPTED_MITM: Integer read _GetPERMISSION_READ_ENCRYPTED_MITM;
    {class} property PERMISSION_WRITE: Integer read _GetPERMISSION_WRITE;
    {class} property PERMISSION_WRITE_ENCRYPTED: Integer read _GetPERMISSION_WRITE_ENCRYPTED;
    {class} property PERMISSION_WRITE_ENCRYPTED_MITM: Integer read _GetPERMISSION_WRITE_ENCRYPTED_MITM;
    {class} property PERMISSION_WRITE_SIGNED: Integer read _GetPERMISSION_WRITE_SIGNED;
    {class} property PERMISSION_WRITE_SIGNED_MITM: Integer read _GetPERMISSION_WRITE_SIGNED_MITM;
  end;

  [JavaSignature('android/bluetooth/BluetoothGattDescriptor')]
  JBluetoothGattDescriptor = interface(JObject)
    ['{E6B635CF-FA07-443D-A538-CD9EB22110BA}']
    function describeContents: Integer; cdecl;
    function getCharacteristic: JBluetoothGattCharacteristic; cdecl;
    function getPermissions: Integer; cdecl;
    function getUuid: JUUID; cdecl;
    function getValue: TJavaArray<Byte>; cdecl;//Deprecated
    function setValue(value: TJavaArray<Byte>): Boolean; cdecl;//Deprecated
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothGattDescriptor = class(TJavaGenericImport<JBluetoothGattDescriptorClass, JBluetoothGattDescriptor>) end;

  JBluetoothGattServerClass = interface(JObjectClass)
    ['{FA3AE62C-030E-4325-BDE6-228CA519226A}']
  end;

  [JavaSignature('android/bluetooth/BluetoothGattServer')]
  JBluetoothGattServer = interface(JObject)
    ['{0C8EE0C3-F591-454A-B1AE-1F7A51CF0762}']
    function addService(service: JBluetoothGattService): Boolean; cdecl;
    procedure cancelConnection(device: JBluetoothDevice); cdecl;
    procedure clearServices; cdecl;
    procedure close; cdecl;
    function connect(device: JBluetoothDevice; autoConnect: Boolean): Boolean; cdecl;
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function getService(uuid: JUUID): JBluetoothGattService; cdecl;
    function getServices: JList; cdecl;
    function notifyCharacteristicChanged(device: JBluetoothDevice; characteristic: JBluetoothGattCharacteristic; confirm: Boolean): Boolean; cdecl; overload;//Deprecated
    function notifyCharacteristicChanged(device: JBluetoothDevice; characteristic: JBluetoothGattCharacteristic; confirm: Boolean; value: TJavaArray<Byte>): Integer; cdecl; overload;
    procedure readPhy(device: JBluetoothDevice); cdecl;
    function removeService(service: JBluetoothGattService): Boolean; cdecl;
    function sendResponse(device: JBluetoothDevice; requestId: Integer; status: Integer; offset: Integer; value: TJavaArray<Byte>): Boolean; cdecl;
    procedure setPreferredPhy(device: JBluetoothDevice; txPhy: Integer; rxPhy: Integer; phyOptions: Integer); cdecl;
  end;
  TJBluetoothGattServer = class(TJavaGenericImport<JBluetoothGattServerClass, JBluetoothGattServer>) end;

  JBluetoothGattServerCallbackClass = interface(JObjectClass)
    ['{3AAB7F16-EAFB-42F1-AB0B-B69913D30828}']
    {class} function init: JBluetoothGattServerCallback; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothGattServerCallback')]
  JBluetoothGattServerCallback = interface(JObject)
    ['{0DAA40B9-3010-43B9-A8BC-38953BCE641E}']
    procedure onCharacteristicReadRequest(device: JBluetoothDevice; requestId: Integer; offset: Integer; characteristic: JBluetoothGattCharacteristic); cdecl;
    procedure onCharacteristicWriteRequest(device: JBluetoothDevice; requestId: Integer; characteristic: JBluetoothGattCharacteristic; preparedWrite: Boolean; responseNeeded: Boolean; offset: Integer; value: TJavaArray<Byte>); cdecl;
    procedure onConnectionStateChange(device: JBluetoothDevice; status: Integer; newState: Integer); cdecl;
    procedure onDescriptorReadRequest(device: JBluetoothDevice; requestId: Integer; offset: Integer; descriptor: JBluetoothGattDescriptor); cdecl;
    procedure onDescriptorWriteRequest(device: JBluetoothDevice; requestId: Integer; descriptor: JBluetoothGattDescriptor; preparedWrite: Boolean; responseNeeded: Boolean; offset: Integer; value: TJavaArray<Byte>); cdecl;
    procedure onExecuteWrite(device: JBluetoothDevice; requestId: Integer; execute: Boolean); cdecl;
    procedure onMtuChanged(device: JBluetoothDevice; mtu: Integer); cdecl;
    procedure onNotificationSent(device: JBluetoothDevice; status: Integer); cdecl;
    procedure onPhyRead(device: JBluetoothDevice; txPhy: Integer; rxPhy: Integer; status: Integer); cdecl;
    procedure onPhyUpdate(device: JBluetoothDevice; txPhy: Integer; rxPhy: Integer; status: Integer); cdecl;
    procedure onServiceAdded(status: Integer; service: JBluetoothGattService); cdecl;
  end;
  TJBluetoothGattServerCallback = class(TJavaGenericImport<JBluetoothGattServerCallbackClass, JBluetoothGattServerCallback>) end;

  JBluetoothGattServiceClass = interface(JObjectClass)
    ['{67244B78-B5BE-473E-B84C-EBE8898975B9}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSERVICE_TYPE_PRIMARY: Integer; cdecl;
    {class} function _GetSERVICE_TYPE_SECONDARY: Integer; cdecl;
    {class} function init(uuid: JUUID; serviceType: Integer): JBluetoothGattService; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SERVICE_TYPE_PRIMARY: Integer read _GetSERVICE_TYPE_PRIMARY;
    {class} property SERVICE_TYPE_SECONDARY: Integer read _GetSERVICE_TYPE_SECONDARY;
  end;

  [JavaSignature('android/bluetooth/BluetoothGattService')]
  JBluetoothGattService = interface(JObject)
    ['{3EF3B4CF-735C-4DA5-A62B-8B7F3862DEA7}']
    function addCharacteristic(characteristic: JBluetoothGattCharacteristic): Boolean; cdecl;
    function addService(service: JBluetoothGattService): Boolean; cdecl;
    function getCharacteristic(uuid: JUUID): JBluetoothGattCharacteristic; cdecl;
    function getCharacteristics: JList; cdecl;
    function getIncludedServices: JList; cdecl;
    function getInstanceId: Integer; cdecl;
    function getType: Integer; cdecl;
    function getUuid: JUUID; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothGattService = class(TJavaGenericImport<JBluetoothGattServiceClass, JBluetoothGattService>) end;

  JBluetoothHeadsetClass = interface(JObjectClass)
    ['{1C02789A-AD09-44E2-B844-5AE59B74D108}']
    {class} function _GetACTION_AUDIO_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_VENDOR_SPECIFIC_HEADSET_EVENT: JString; cdecl;
    {class} function _GetAT_CMD_TYPE_ACTION: Integer; cdecl;
    {class} function _GetAT_CMD_TYPE_BASIC: Integer; cdecl;
    {class} function _GetAT_CMD_TYPE_READ: Integer; cdecl;
    {class} function _GetAT_CMD_TYPE_SET: Integer; cdecl;
    {class} function _GetAT_CMD_TYPE_TEST: Integer; cdecl;
    {class} function _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS: JString; cdecl;
    {class} function _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD: JString; cdecl;
    {class} function _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE: JString; cdecl;
    {class} function _GetSTATE_AUDIO_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_AUDIO_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_AUDIO_DISCONNECTED: Integer; cdecl;
    {class} function _GetVENDOR_RESULT_CODE_COMMAND_ANDROID: JString; cdecl;
    {class} function _GetVENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY: JString; cdecl;
    {class} property ACTION_AUDIO_STATE_CHANGED: JString read _GetACTION_AUDIO_STATE_CHANGED;
    {class} property ACTION_CONNECTION_STATE_CHANGED: JString read _GetACTION_CONNECTION_STATE_CHANGED;
    {class} property ACTION_VENDOR_SPECIFIC_HEADSET_EVENT: JString read _GetACTION_VENDOR_SPECIFIC_HEADSET_EVENT;
    {class} property AT_CMD_TYPE_ACTION: Integer read _GetAT_CMD_TYPE_ACTION;
    {class} property AT_CMD_TYPE_BASIC: Integer read _GetAT_CMD_TYPE_BASIC;
    {class} property AT_CMD_TYPE_READ: Integer read _GetAT_CMD_TYPE_READ;
    {class} property AT_CMD_TYPE_SET: Integer read _GetAT_CMD_TYPE_SET;
    {class} property AT_CMD_TYPE_TEST: Integer read _GetAT_CMD_TYPE_TEST;
    {class} property EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS: JString read _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS;
    {class} property EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD: JString read _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD;
    {class} property EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE: JString read _GetEXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE;
    {class} property STATE_AUDIO_CONNECTED: Integer read _GetSTATE_AUDIO_CONNECTED;
    {class} property STATE_AUDIO_CONNECTING: Integer read _GetSTATE_AUDIO_CONNECTING;
    {class} property STATE_AUDIO_DISCONNECTED: Integer read _GetSTATE_AUDIO_DISCONNECTED;
    {class} property VENDOR_RESULT_CODE_COMMAND_ANDROID: JString read _GetVENDOR_RESULT_CODE_COMMAND_ANDROID;
    {class} property VENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY: JString read _GetVENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY;
  end;

  [JavaSignature('android/bluetooth/BluetoothHeadset')]
  JBluetoothHeadset = interface(JObject)
    ['{F5113343-8748-4A7C-AA6C-BD15197A0953}']
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function isAudioConnected(device: JBluetoothDevice): Boolean; cdecl;
    function isNoiseReductionSupported(device: JBluetoothDevice): Boolean; cdecl;
    function isVoiceRecognitionSupported(device: JBluetoothDevice): Boolean; cdecl;
    function sendVendorSpecificResultCode(device: JBluetoothDevice; command: JString; arg: JString): Boolean; cdecl;
    function startVoiceRecognition(device: JBluetoothDevice): Boolean; cdecl;
    function stopVoiceRecognition(device: JBluetoothDevice): Boolean; cdecl;
  end;
  TJBluetoothHeadset = class(TJavaGenericImport<JBluetoothHeadsetClass, JBluetoothHeadset>) end;

  JBluetoothHealthClass = interface(JObjectClass)
    ['{300F6FEB-972D-4E7B-A50C-A15F454008B4}']
    {class} function _GetAPP_CONFIG_REGISTRATION_FAILURE: Integer; cdecl;
    {class} function _GetAPP_CONFIG_REGISTRATION_SUCCESS: Integer; cdecl;
    {class} function _GetAPP_CONFIG_UNREGISTRATION_FAILURE: Integer; cdecl;
    {class} function _GetAPP_CONFIG_UNREGISTRATION_SUCCESS: Integer; cdecl;
    {class} function _GetCHANNEL_TYPE_RELIABLE: Integer; cdecl;
    {class} function _GetCHANNEL_TYPE_STREAMING: Integer; cdecl;
    {class} function _GetSINK_ROLE: Integer; cdecl;
    {class} function _GetSOURCE_ROLE: Integer; cdecl;
    {class} function _GetSTATE_CHANNEL_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CHANNEL_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_CHANNEL_DISCONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CHANNEL_DISCONNECTING: Integer; cdecl;
    {class} property APP_CONFIG_REGISTRATION_FAILURE: Integer read _GetAPP_CONFIG_REGISTRATION_FAILURE;
    {class} property APP_CONFIG_REGISTRATION_SUCCESS: Integer read _GetAPP_CONFIG_REGISTRATION_SUCCESS;
    {class} property APP_CONFIG_UNREGISTRATION_FAILURE: Integer read _GetAPP_CONFIG_UNREGISTRATION_FAILURE;
    {class} property APP_CONFIG_UNREGISTRATION_SUCCESS: Integer read _GetAPP_CONFIG_UNREGISTRATION_SUCCESS;
    {class} property CHANNEL_TYPE_RELIABLE: Integer read _GetCHANNEL_TYPE_RELIABLE;
    {class} property CHANNEL_TYPE_STREAMING: Integer read _GetCHANNEL_TYPE_STREAMING;
    {class} property SINK_ROLE: Integer read _GetSINK_ROLE;
    {class} property SOURCE_ROLE: Integer read _GetSOURCE_ROLE;
    {class} property STATE_CHANNEL_CONNECTED: Integer read _GetSTATE_CHANNEL_CONNECTED;
    {class} property STATE_CHANNEL_CONNECTING: Integer read _GetSTATE_CHANNEL_CONNECTING;
    {class} property STATE_CHANNEL_DISCONNECTED: Integer read _GetSTATE_CHANNEL_DISCONNECTED;
    {class} property STATE_CHANNEL_DISCONNECTING: Integer read _GetSTATE_CHANNEL_DISCONNECTING;
  end;

  [JavaSignature('android/bluetooth/BluetoothHealth')]
  JBluetoothHealth = interface(JObject)
    ['{2C7C401F-FDC8-4C14-B495-A888A7E63035}']
    function connectChannelToSource(device: JBluetoothDevice; config: JBluetoothHealthAppConfiguration): Boolean; cdecl;//Deprecated
    function disconnectChannel(device: JBluetoothDevice; config: JBluetoothHealthAppConfiguration; channelId: Integer): Boolean; cdecl;//Deprecated
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function getMainChannelFd(device: JBluetoothDevice; config: JBluetoothHealthAppConfiguration): JParcelFileDescriptor; cdecl;//Deprecated
    function registerSinkAppConfiguration(name: JString; dataType: Integer; callback: JBluetoothHealthCallback): Boolean; cdecl;//Deprecated
    function unregisterAppConfiguration(config: JBluetoothHealthAppConfiguration): Boolean; cdecl;//Deprecated
  end;
  TJBluetoothHealth = class(TJavaGenericImport<JBluetoothHealthClass, JBluetoothHealth>) end;

  JBluetoothHealthAppConfigurationClass = interface(JObjectClass)
    ['{D01FD0E1-8DDC-4F7C-9366-E557F7AA1E5A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/BluetoothHealthAppConfiguration')]
  JBluetoothHealthAppConfiguration = interface(JObject)
    ['{795DED40-D984-43F1-BF05-48D979EE7E32}']
    function describeContents: Integer; cdecl;
    function getDataType: Integer; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function getRole: Integer; cdecl;//Deprecated
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothHealthAppConfiguration = class(TJavaGenericImport<JBluetoothHealthAppConfigurationClass, JBluetoothHealthAppConfiguration>) end;

  JBluetoothHealthCallbackClass = interface(JObjectClass)
    ['{7B57EB4C-C41D-4E04-A684-7FA1F28947DE}']
    {class} function init: JBluetoothHealthCallback; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothHealthCallback')]
  JBluetoothHealthCallback = interface(JObject)
    ['{0B5BE0DB-6275-4F55-9E86-CF1074072A0A}']
    procedure onHealthAppConfigurationStatusChange(config: JBluetoothHealthAppConfiguration; status: Integer); cdecl;//Deprecated
    procedure onHealthChannelStateChange(config: JBluetoothHealthAppConfiguration; device: JBluetoothDevice; prevState: Integer; newState: Integer; fd: JParcelFileDescriptor; channelId: Integer); cdecl;//Deprecated
  end;
  TJBluetoothHealthCallback = class(TJavaGenericImport<JBluetoothHealthCallbackClass, JBluetoothHealthCallback>) end;

  JBluetoothHearingAidClass = interface(JObjectClass)
    ['{AE772225-68B3-4F1A-90F4-8B775B1996E0}']
    {class} function _GetACTION_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} property ACTION_CONNECTION_STATE_CHANGED: JString read _GetACTION_CONNECTION_STATE_CHANGED;
  end;

  [JavaSignature('android/bluetooth/BluetoothHearingAid')]
  JBluetoothHearingAid = interface(JObject)
    ['{FBAFF87C-B2E3-4FBE-9D5A-01BAB61071E8}']
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
  end;
  TJBluetoothHearingAid = class(TJavaGenericImport<JBluetoothHearingAidClass, JBluetoothHearingAid>) end;

  JBluetoothHidDeviceClass = interface(JObjectClass)
    ['{C535C48D-2104-4BE2-BA7E-AEF5F37CCBE4}']
    {class} function _GetACTION_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetERROR_RSP_INVALID_PARAM: Byte; cdecl;
    {class} function _GetERROR_RSP_INVALID_RPT_ID: Byte; cdecl;
    {class} function _GetERROR_RSP_NOT_READY: Byte; cdecl;
    {class} function _GetERROR_RSP_SUCCESS: Byte; cdecl;
    {class} function _GetERROR_RSP_UNKNOWN: Byte; cdecl;
    {class} function _GetERROR_RSP_UNSUPPORTED_REQ: Byte; cdecl;
    {class} function _GetPROTOCOL_BOOT_MODE: Byte; cdecl;
    {class} function _GetPROTOCOL_REPORT_MODE: Byte; cdecl;
    {class} function _GetREPORT_TYPE_FEATURE: Byte; cdecl;
    {class} function _GetREPORT_TYPE_INPUT: Byte; cdecl;
    {class} function _GetREPORT_TYPE_OUTPUT: Byte; cdecl;
    {class} function _GetSUBCLASS1_COMBO: Byte; cdecl;
    {class} function _GetSUBCLASS1_KEYBOARD: Byte; cdecl;
    {class} function _GetSUBCLASS1_MOUSE: Byte; cdecl;
    {class} function _GetSUBCLASS1_NONE: Byte; cdecl;
    {class} function _GetSUBCLASS2_CARD_READER: Byte; cdecl;
    {class} function _GetSUBCLASS2_DIGITIZER_TABLET: Byte; cdecl;
    {class} function _GetSUBCLASS2_GAMEPAD: Byte; cdecl;
    {class} function _GetSUBCLASS2_JOYSTICK: Byte; cdecl;
    {class} function _GetSUBCLASS2_REMOTE_CONTROL: Byte; cdecl;
    {class} function _GetSUBCLASS2_SENSING_DEVICE: Byte; cdecl;
    {class} function _GetSUBCLASS2_UNCATEGORIZED: Byte; cdecl;
    {class} property ACTION_CONNECTION_STATE_CHANGED: JString read _GetACTION_CONNECTION_STATE_CHANGED;
    {class} property ERROR_RSP_INVALID_PARAM: Byte read _GetERROR_RSP_INVALID_PARAM;
    {class} property ERROR_RSP_INVALID_RPT_ID: Byte read _GetERROR_RSP_INVALID_RPT_ID;
    {class} property ERROR_RSP_NOT_READY: Byte read _GetERROR_RSP_NOT_READY;
    {class} property ERROR_RSP_SUCCESS: Byte read _GetERROR_RSP_SUCCESS;
    {class} property ERROR_RSP_UNKNOWN: Byte read _GetERROR_RSP_UNKNOWN;
    {class} property ERROR_RSP_UNSUPPORTED_REQ: Byte read _GetERROR_RSP_UNSUPPORTED_REQ;
    {class} property PROTOCOL_BOOT_MODE: Byte read _GetPROTOCOL_BOOT_MODE;
    {class} property PROTOCOL_REPORT_MODE: Byte read _GetPROTOCOL_REPORT_MODE;
    {class} property REPORT_TYPE_FEATURE: Byte read _GetREPORT_TYPE_FEATURE;
    {class} property REPORT_TYPE_INPUT: Byte read _GetREPORT_TYPE_INPUT;
    {class} property REPORT_TYPE_OUTPUT: Byte read _GetREPORT_TYPE_OUTPUT;
    {class} property SUBCLASS1_COMBO: Byte read _GetSUBCLASS1_COMBO;
    {class} property SUBCLASS1_KEYBOARD: Byte read _GetSUBCLASS1_KEYBOARD;
    {class} property SUBCLASS1_MOUSE: Byte read _GetSUBCLASS1_MOUSE;
    {class} property SUBCLASS1_NONE: Byte read _GetSUBCLASS1_NONE;
    {class} property SUBCLASS2_CARD_READER: Byte read _GetSUBCLASS2_CARD_READER;
    {class} property SUBCLASS2_DIGITIZER_TABLET: Byte read _GetSUBCLASS2_DIGITIZER_TABLET;
    {class} property SUBCLASS2_GAMEPAD: Byte read _GetSUBCLASS2_GAMEPAD;
    {class} property SUBCLASS2_JOYSTICK: Byte read _GetSUBCLASS2_JOYSTICK;
    {class} property SUBCLASS2_REMOTE_CONTROL: Byte read _GetSUBCLASS2_REMOTE_CONTROL;
    {class} property SUBCLASS2_SENSING_DEVICE: Byte read _GetSUBCLASS2_SENSING_DEVICE;
    {class} property SUBCLASS2_UNCATEGORIZED: Byte read _GetSUBCLASS2_UNCATEGORIZED;
  end;

  [JavaSignature('android/bluetooth/BluetoothHidDevice')]
  JBluetoothHidDevice = interface(JObject)
    ['{741A15DE-08A1-4412-B783-34181CAB8B17}']
    function connect(device: JBluetoothDevice): Boolean; cdecl;
    function disconnect(device: JBluetoothDevice): Boolean; cdecl;
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function registerApp(sdp: JBluetoothHidDeviceAppSdpSettings; inQos: JBluetoothHidDeviceAppQosSettings; outQos: JBluetoothHidDeviceAppQosSettings; executor: JExecutor; callback: JBluetoothHidDevice_Callback): Boolean; cdecl;
    function replyReport(device: JBluetoothDevice; type_: Byte; id: Byte; data: TJavaArray<Byte>): Boolean; cdecl;
    function reportError(device: JBluetoothDevice; error: Byte): Boolean; cdecl;
    function sendReport(device: JBluetoothDevice; id: Integer; data: TJavaArray<Byte>): Boolean; cdecl;
    function unregisterApp: Boolean; cdecl;
  end;
  TJBluetoothHidDevice = class(TJavaGenericImport<JBluetoothHidDeviceClass, JBluetoothHidDevice>) end;

  JBluetoothHidDevice_CallbackClass = interface(JObjectClass)
    ['{92BD2015-A69A-4465-B9E9-46523196A051}']
    {class} function init: JBluetoothHidDevice_Callback; cdecl;
  end;

  [JavaSignature('android/bluetooth/BluetoothHidDevice$Callback')]
  JBluetoothHidDevice_Callback = interface(JObject)
    ['{538A0D9B-7BA8-432E-B1F3-9AF5AC4266F0}']
    procedure onAppStatusChanged(pluggedDevice: JBluetoothDevice; registered: Boolean); cdecl;
    procedure onConnectionStateChanged(device: JBluetoothDevice; state: Integer); cdecl;
    procedure onGetReport(device: JBluetoothDevice; type_: Byte; id: Byte; bufferSize: Integer); cdecl;
    procedure onInterruptData(device: JBluetoothDevice; reportId: Byte; data: TJavaArray<Byte>); cdecl;
    procedure onSetProtocol(device: JBluetoothDevice; protocol: Byte); cdecl;
    procedure onSetReport(device: JBluetoothDevice; type_: Byte; id: Byte; data: TJavaArray<Byte>); cdecl;
    procedure onVirtualCableUnplug(device: JBluetoothDevice); cdecl;
  end;
  TJBluetoothHidDevice_Callback = class(TJavaGenericImport<JBluetoothHidDevice_CallbackClass, JBluetoothHidDevice_Callback>) end;

  JBluetoothHidDeviceAppQosSettingsClass = interface(JObjectClass)
    ['{DDCE69F3-1D0E-448B-8082-9C4F0D136572}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMAX: Integer; cdecl;
    {class} function _GetSERVICE_BEST_EFFORT: Integer; cdecl;
    {class} function _GetSERVICE_GUARANTEED: Integer; cdecl;
    {class} function _GetSERVICE_NO_TRAFFIC: Integer; cdecl;
    {class} function init(serviceType: Integer; tokenRate: Integer; tokenBucketSize: Integer; peakBandwidth: Integer; latency: Integer; delayVariation: Integer): JBluetoothHidDeviceAppQosSettings; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property MAX: Integer read _GetMAX;
    {class} property SERVICE_BEST_EFFORT: Integer read _GetSERVICE_BEST_EFFORT;
    {class} property SERVICE_GUARANTEED: Integer read _GetSERVICE_GUARANTEED;
    {class} property SERVICE_NO_TRAFFIC: Integer read _GetSERVICE_NO_TRAFFIC;
  end;

  [JavaSignature('android/bluetooth/BluetoothHidDeviceAppQosSettings')]
  JBluetoothHidDeviceAppQosSettings = interface(JObject)
    ['{47487DF4-93A2-4FE2-82BC-7D13E80EEEE7}']
    function describeContents: Integer; cdecl;
    function getDelayVariation: Integer; cdecl;
    function getLatency: Integer; cdecl;
    function getPeakBandwidth: Integer; cdecl;
    function getServiceType: Integer; cdecl;
    function getTokenBucketSize: Integer; cdecl;
    function getTokenRate: Integer; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothHidDeviceAppQosSettings = class(TJavaGenericImport<JBluetoothHidDeviceAppQosSettingsClass, JBluetoothHidDeviceAppQosSettings>) end;

  JBluetoothHidDeviceAppSdpSettingsClass = interface(JObjectClass)
    ['{0F63767E-724E-40D0-AF02-DF074D0109F0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(name: JString; description: JString; provider: JString; subclass: Byte; descriptors: TJavaArray<Byte>): JBluetoothHidDeviceAppSdpSettings; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/BluetoothHidDeviceAppSdpSettings')]
  JBluetoothHidDeviceAppSdpSettings = interface(JObject)
    ['{FF9D55E3-7FB3-4B02-86E3-D92E8F6F0FD5}']
    function describeContents: Integer; cdecl;
    function getDescription: JString; cdecl;
    function getDescriptors: TJavaArray<Byte>; cdecl;
    function getName: JString; cdecl;
    function getProvider: JString; cdecl;
    function getSubclass: Byte; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothHidDeviceAppSdpSettings = class(TJavaGenericImport<JBluetoothHidDeviceAppSdpSettingsClass, JBluetoothHidDeviceAppSdpSettings>) end;

  JBluetoothLeAudioClass = interface(JObjectClass)
    ['{8E193CC1-B3EE-4F4A-87DE-45E9B6A0EF73}']
    {class} function _GetACTION_LE_AUDIO_CONNECTION_STATE_CHANGED: JString; cdecl;
    {class} function _GetGROUP_ID_INVALID: Integer; cdecl;
    {class} property ACTION_LE_AUDIO_CONNECTION_STATE_CHANGED: JString read _GetACTION_LE_AUDIO_CONNECTION_STATE_CHANGED;
    {class} property GROUP_ID_INVALID: Integer read _GetGROUP_ID_INVALID;
  end;

  [JavaSignature('android/bluetooth/BluetoothLeAudio')]
  JBluetoothLeAudio = interface(JObject)
    ['{EA355499-7B1E-48B9-ADEF-C5FA6A6417F0}']
    function getConnectedDevices: JList; cdecl;
    function getConnectedGroupLeadDevice(groupId: Integer): JBluetoothDevice; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
    function getGroupId(device: JBluetoothDevice): Integer; cdecl;
  end;
  TJBluetoothLeAudio = class(TJavaGenericImport<JBluetoothLeAudioClass, JBluetoothLeAudio>) end;

  JBluetoothLeAudioCodecConfigClass = interface(JObjectClass)
    ['{D658C4DC-E950-4D2F-AA0E-3B008DF8FEB9}']
    {class} function _GetBITS_PER_SAMPLE_16: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_24: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_32: Integer; cdecl;
    {class} function _GetBITS_PER_SAMPLE_NONE: Integer; cdecl;
    {class} function _GetCHANNEL_COUNT_1: Integer; cdecl;
    {class} function _GetCHANNEL_COUNT_2: Integer; cdecl;
    {class} function _GetCHANNEL_COUNT_NONE: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_DEFAULT: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_DISABLED: Integer; cdecl;
    {class} function _GetCODEC_PRIORITY_HIGHEST: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFRAME_DURATION_10000: Integer; cdecl;
    {class} function _GetFRAME_DURATION_7500: Integer; cdecl;
    {class} function _GetFRAME_DURATION_NONE: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_16000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_24000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_32000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_44100: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_48000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_8000: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_NONE: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_INVALID: Integer; cdecl;
    {class} function _GetSOURCE_CODEC_TYPE_LC3: Integer; cdecl;
    {class} property BITS_PER_SAMPLE_16: Integer read _GetBITS_PER_SAMPLE_16;
    {class} property BITS_PER_SAMPLE_24: Integer read _GetBITS_PER_SAMPLE_24;
    {class} property BITS_PER_SAMPLE_32: Integer read _GetBITS_PER_SAMPLE_32;
    {class} property BITS_PER_SAMPLE_NONE: Integer read _GetBITS_PER_SAMPLE_NONE;
    {class} property CHANNEL_COUNT_1: Integer read _GetCHANNEL_COUNT_1;
    {class} property CHANNEL_COUNT_2: Integer read _GetCHANNEL_COUNT_2;
    {class} property CHANNEL_COUNT_NONE: Integer read _GetCHANNEL_COUNT_NONE;
    {class} property CODEC_PRIORITY_DEFAULT: Integer read _GetCODEC_PRIORITY_DEFAULT;
    {class} property CODEC_PRIORITY_DISABLED: Integer read _GetCODEC_PRIORITY_DISABLED;
    {class} property CODEC_PRIORITY_HIGHEST: Integer read _GetCODEC_PRIORITY_HIGHEST;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FRAME_DURATION_10000: Integer read _GetFRAME_DURATION_10000;
    {class} property FRAME_DURATION_7500: Integer read _GetFRAME_DURATION_7500;
    {class} property FRAME_DURATION_NONE: Integer read _GetFRAME_DURATION_NONE;
    {class} property SAMPLE_RATE_16000: Integer read _GetSAMPLE_RATE_16000;
    {class} property SAMPLE_RATE_24000: Integer read _GetSAMPLE_RATE_24000;
    {class} property SAMPLE_RATE_32000: Integer read _GetSAMPLE_RATE_32000;
    {class} property SAMPLE_RATE_44100: Integer read _GetSAMPLE_RATE_44100;
    {class} property SAMPLE_RATE_48000: Integer read _GetSAMPLE_RATE_48000;
    {class} property SAMPLE_RATE_8000: Integer read _GetSAMPLE_RATE_8000;
    {class} property SAMPLE_RATE_NONE: Integer read _GetSAMPLE_RATE_NONE;
    {class} property SOURCE_CODEC_TYPE_INVALID: Integer read _GetSOURCE_CODEC_TYPE_INVALID;
    {class} property SOURCE_CODEC_TYPE_LC3: Integer read _GetSOURCE_CODEC_TYPE_LC3;
  end;

  [JavaSignature('android/bluetooth/BluetoothLeAudioCodecConfig')]
  JBluetoothLeAudioCodecConfig = interface(JObject)
    ['{13EF492D-2B0B-479B-90F3-C5E19AAA4938}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getBitsPerSample: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getCodecName: JString; cdecl;
    function getCodecPriority: Integer; cdecl;
    function getCodecType: Integer; cdecl;
    function getFrameDuration: Integer; cdecl;
    function getMaxOctetsPerFrame: Integer; cdecl;
    function getMinOctetsPerFrame: Integer; cdecl;
    function getOctetsPerFrame: Integer; cdecl;
    function getSampleRate: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothLeAudioCodecConfig = class(TJavaGenericImport<JBluetoothLeAudioCodecConfigClass, JBluetoothLeAudioCodecConfig>) end;

  JBluetoothLeAudioCodecConfig_BuilderClass = interface(JObjectClass)
    ['{0DCFB05F-3429-4C44-955A-895C6CC1E43D}']
    {class} function init: JBluetoothLeAudioCodecConfig_Builder; cdecl; overload;
    {class} function init(config: JBluetoothLeAudioCodecConfig): JBluetoothLeAudioCodecConfig_Builder; cdecl; overload;
  end;

  [JavaSignature('android/bluetooth/BluetoothLeAudioCodecConfig$Builder')]
  JBluetoothLeAudioCodecConfig_Builder = interface(JObject)
    ['{6B2FFC98-708C-441E-98F9-9F07E140A8DC}']
    function build: JBluetoothLeAudioCodecConfig; cdecl;
    function setBitsPerSample(bitsPerSample: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setChannelCount(channelCount: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setCodecPriority(codecPriority: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setCodecType(codecType: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setFrameDuration(frameDuration: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setMaxOctetsPerFrame(maxOctetsPerFrame: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setMinOctetsPerFrame(minOctetsPerFrame: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setOctetsPerFrame(octetsPerFrame: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
    function setSampleRate(sampleRate: Integer): JBluetoothLeAudioCodecConfig_Builder; cdecl;
  end;
  TJBluetoothLeAudioCodecConfig_Builder = class(TJavaGenericImport<JBluetoothLeAudioCodecConfig_BuilderClass, JBluetoothLeAudioCodecConfig_Builder>) end;

  JBluetoothLeAudioCodecStatusClass = interface(JObjectClass)
    ['{FA5F193F-5303-4532-8CF5-88E182EF9DA7}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_LE_AUDIO_CODEC_STATUS: JString; cdecl;
    {class} function init(inputCodecConfig: JBluetoothLeAudioCodecConfig; outputCodecConfig: JBluetoothLeAudioCodecConfig; inputCodecsLocalCapabilities: JList; outputCodecsLocalCapabilities: JList; inputCodecsSelectableCapabilities: JList; outputCodecsSelectableCapabilities: JList): JBluetoothLeAudioCodecStatus; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_LE_AUDIO_CODEC_STATUS: JString read _GetEXTRA_LE_AUDIO_CODEC_STATUS;
  end;

  [JavaSignature('android/bluetooth/BluetoothLeAudioCodecStatus')]
  JBluetoothLeAudioCodecStatus = interface(JObject)
    ['{596A8B13-BACE-4AC3-8149-576354E9417E}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getInputCodecConfig: JBluetoothLeAudioCodecConfig; cdecl;
    function getInputCodecLocalCapabilities: JList; cdecl;
    function getInputCodecSelectableCapabilities: JList; cdecl;
    function getOutputCodecConfig: JBluetoothLeAudioCodecConfig; cdecl;
    function getOutputCodecLocalCapabilities: JList; cdecl;
    function getOutputCodecSelectableCapabilities: JList; cdecl;
    function hashCode: Integer; cdecl;
    function isInputCodecConfigSelectable(codecConfig: JBluetoothLeAudioCodecConfig): Boolean; cdecl;
    function isOutputCodecConfigSelectable(codecConfig: JBluetoothLeAudioCodecConfig): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJBluetoothLeAudioCodecStatus = class(TJavaGenericImport<JBluetoothLeAudioCodecStatusClass, JBluetoothLeAudioCodecStatus>) end;

  JBluetoothManagerClass = interface(JObjectClass)
    ['{A44BF6BA-ED3D-4136-9C6B-1DF9DAA37178}']
  end;

  [JavaSignature('android/bluetooth/BluetoothManager')]
  JBluetoothManager = interface(JObject)
    ['{67B37813-B270-438B-A23C-F71C37660C75}']
    function getAdapter: JBluetoothAdapter; cdecl;
    function getConnectedDevices(profile: Integer): JList; cdecl;
    function getConnectionState(device: JBluetoothDevice; profile: Integer): Integer; cdecl;
    function getDevicesMatchingConnectionStates(profile: Integer; states: TJavaArray<Integer>): JList; cdecl;
    function openGattServer(context: JContext; callback: JBluetoothGattServerCallback): JBluetoothGattServer; cdecl;
  end;
  TJBluetoothManager = class(TJavaGenericImport<JBluetoothManagerClass, JBluetoothManager>) end;

  JBluetoothProfileClass = interface(IJavaClass)
    ['{D4C874B9-3002-41AB-AE93-FDD3E9A75A66}']
    {class} function _GetA2DP: Integer; cdecl;
    {class} function _GetCSIP_SET_COORDINATOR: Integer; cdecl;
    {class} function _GetEXTRA_PREVIOUS_STATE: JString; cdecl;
    {class} function _GetEXTRA_STATE: JString; cdecl;
    {class} function _GetGATT: Integer; cdecl;
    {class} function _GetGATT_SERVER: Integer; cdecl;
    {class} function _GetHAP_CLIENT: Integer; cdecl;
    {class} function _GetHEADSET: Integer; cdecl;
    {class} function _GetHEALTH: Integer; cdecl;
    {class} function _GetHEARING_AID: Integer; cdecl;
    {class} function _GetHID_DEVICE: Integer; cdecl;
    {class} function _GetLE_AUDIO: Integer; cdecl;
    {class} function _GetSAP: Integer; cdecl;
    {class} function _GetSTATE_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSTATE_DISCONNECTING: Integer; cdecl;
    {class} property A2DP: Integer read _GetA2DP;
    {class} property CSIP_SET_COORDINATOR: Integer read _GetCSIP_SET_COORDINATOR;
    {class} property EXTRA_PREVIOUS_STATE: JString read _GetEXTRA_PREVIOUS_STATE;
    {class} property EXTRA_STATE: JString read _GetEXTRA_STATE;
    {class} property GATT: Integer read _GetGATT;
    {class} property GATT_SERVER: Integer read _GetGATT_SERVER;
    {class} property HAP_CLIENT: Integer read _GetHAP_CLIENT;
    {class} property HEADSET: Integer read _GetHEADSET;
    {class} property HEALTH: Integer read _GetHEALTH;
    {class} property HEARING_AID: Integer read _GetHEARING_AID;
    {class} property HID_DEVICE: Integer read _GetHID_DEVICE;
    {class} property LE_AUDIO: Integer read _GetLE_AUDIO;
    {class} property SAP: Integer read _GetSAP;
    {class} property STATE_CONNECTED: Integer read _GetSTATE_CONNECTED;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_DISCONNECTED: Integer read _GetSTATE_DISCONNECTED;
    {class} property STATE_DISCONNECTING: Integer read _GetSTATE_DISCONNECTING;
  end;

  [JavaSignature('android/bluetooth/BluetoothProfile')]
  JBluetoothProfile = interface(IJavaInstance)
    ['{ED35C263-DCA1-4E11-8945-0950AD3EF7A6}']
    function getConnectedDevices: JList; cdecl;
    function getConnectionState(device: JBluetoothDevice): Integer; cdecl;
    function getDevicesMatchingConnectionStates(states: TJavaArray<Integer>): JList; cdecl;
  end;
  TJBluetoothProfile = class(TJavaGenericImport<JBluetoothProfileClass, JBluetoothProfile>) end;

  JBluetoothProfile_ServiceListenerClass = interface(IJavaClass)
    ['{2601CF0E-06F4-430C-9EAF-498D4CE00504}']
  end;

  [JavaSignature('android/bluetooth/BluetoothProfile$ServiceListener')]
  JBluetoothProfile_ServiceListener = interface(IJavaInstance)
    ['{545ECD2A-6684-4A8E-87BA-62FCA4DDFB73}']
    procedure onServiceConnected(profile: Integer; proxy: JBluetoothProfile); cdecl;
    procedure onServiceDisconnected(profile: Integer); cdecl;
  end;
  TJBluetoothProfile_ServiceListener = class(TJavaGenericImport<JBluetoothProfile_ServiceListenerClass, JBluetoothProfile_ServiceListener>) end;

  JBluetoothServerSocketClass = interface(JObjectClass)
    ['{0E4C4370-61A3-46AD-B79A-9818D6A86AD3}']
  end;

  [JavaSignature('android/bluetooth/BluetoothServerSocket')]
  JBluetoothServerSocket = interface(JObject)
    ['{CFA2FCE7-C9B5-4826-806D-5327363840DC}']
    function accept: JBluetoothSocket; cdecl; overload;
    function accept(timeout: Integer): JBluetoothSocket; cdecl; overload;
    procedure close; cdecl;
    function getPsm: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJBluetoothServerSocket = class(TJavaGenericImport<JBluetoothServerSocketClass, JBluetoothServerSocket>) end;

  JBluetoothSocketClass = interface(JObjectClass)
    ['{E282B24F-E194-4C88-A065-B84BEE426B4F}']
    {class} function _GetTYPE_L2CAP: Integer; cdecl;
    {class} function _GetTYPE_RFCOMM: Integer; cdecl;
    {class} function _GetTYPE_SCO: Integer; cdecl;
    {class} property TYPE_L2CAP: Integer read _GetTYPE_L2CAP;
    {class} property TYPE_RFCOMM: Integer read _GetTYPE_RFCOMM;
    {class} property TYPE_SCO: Integer read _GetTYPE_SCO;
  end;

  [JavaSignature('android/bluetooth/BluetoothSocket')]
  JBluetoothSocket = interface(JObject)
    ['{FC81DB7D-A513-4D9D-8BDC-6D852A5BEB34}']
    procedure close; cdecl;
    procedure connect; cdecl;
    function getConnectionType: Integer; cdecl;
    function getInputStream: JInputStream; cdecl;
    function getMaxReceivePacketSize: Integer; cdecl;
    function getMaxTransmitPacketSize: Integer; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    function getRemoteDevice: JBluetoothDevice; cdecl;
    function isConnected: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJBluetoothSocket = class(TJavaGenericImport<JBluetoothSocketClass, JBluetoothSocket>) end;

  JBluetoothStatusCodesClass = interface(JObjectClass)
    ['{0D06D5A9-E67F-42BB-9CAB-9F42ECBC59F6}']
    {class} function _GetERROR_BLUETOOTH_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetERROR_BLUETOOTH_NOT_ENABLED: Integer; cdecl;
    {class} function _GetERROR_DEVICE_NOT_BONDED: Integer; cdecl;
    {class} function _GetERROR_GATT_WRITE_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetERROR_GATT_WRITE_REQUEST_BUSY: Integer; cdecl;
    {class} function _GetERROR_MISSING_BLUETOOTH_CONNECT_PERMISSION: Integer; cdecl;
    {class} function _GetERROR_PROFILE_SERVICE_NOT_BOUND: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetFEATURE_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetFEATURE_SUPPORTED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} property ERROR_BLUETOOTH_NOT_ALLOWED: Integer read _GetERROR_BLUETOOTH_NOT_ALLOWED;
    {class} property ERROR_BLUETOOTH_NOT_ENABLED: Integer read _GetERROR_BLUETOOTH_NOT_ENABLED;
    {class} property ERROR_DEVICE_NOT_BONDED: Integer read _GetERROR_DEVICE_NOT_BONDED;
    {class} property ERROR_GATT_WRITE_NOT_ALLOWED: Integer read _GetERROR_GATT_WRITE_NOT_ALLOWED;
    {class} property ERROR_GATT_WRITE_REQUEST_BUSY: Integer read _GetERROR_GATT_WRITE_REQUEST_BUSY;
    {class} property ERROR_MISSING_BLUETOOTH_CONNECT_PERMISSION: Integer read _GetERROR_MISSING_BLUETOOTH_CONNECT_PERMISSION;
    {class} property ERROR_PROFILE_SERVICE_NOT_BOUND: Integer read _GetERROR_PROFILE_SERVICE_NOT_BOUND;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
    {class} property FEATURE_NOT_SUPPORTED: Integer read _GetFEATURE_NOT_SUPPORTED;
    {class} property FEATURE_SUPPORTED: Integer read _GetFEATURE_SUPPORTED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/bluetooth/BluetoothStatusCodes')]
  JBluetoothStatusCodes = interface(JObject)
    ['{8733A840-907F-4953-B8C8-592871360981}']
  end;
  TJBluetoothStatusCodes = class(TJavaGenericImport<JBluetoothStatusCodesClass, JBluetoothStatusCodes>) end;

  JAdvertiseCallbackClass = interface(JObjectClass)
    ['{C0E01FDC-4190-46E5-83D7-A6639511BC81}']
    {class} function _GetADVERTISE_FAILED_ALREADY_STARTED: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_DATA_TOO_LARGE: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_FEATURE_UNSUPPORTED: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_TOO_MANY_ADVERTISERS: Integer; cdecl;
    {class} function init: JAdvertiseCallback; cdecl;
    {class} property ADVERTISE_FAILED_ALREADY_STARTED: Integer read _GetADVERTISE_FAILED_ALREADY_STARTED;
    {class} property ADVERTISE_FAILED_DATA_TOO_LARGE: Integer read _GetADVERTISE_FAILED_DATA_TOO_LARGE;
    {class} property ADVERTISE_FAILED_FEATURE_UNSUPPORTED: Integer read _GetADVERTISE_FAILED_FEATURE_UNSUPPORTED;
    {class} property ADVERTISE_FAILED_INTERNAL_ERROR: Integer read _GetADVERTISE_FAILED_INTERNAL_ERROR;
    {class} property ADVERTISE_FAILED_TOO_MANY_ADVERTISERS: Integer read _GetADVERTISE_FAILED_TOO_MANY_ADVERTISERS;
  end;

  [JavaSignature('android/bluetooth/le/AdvertiseCallback')]
  JAdvertiseCallback = interface(JObject)
    ['{D4C9216C-7F9A-4CBF-8B2B-223023389F7F}']
    procedure onStartFailure(errorCode: Integer); cdecl;
    procedure onStartSuccess(settingsInEffect: JAdvertiseSettings); cdecl;
  end;
  TJAdvertiseCallback = class(TJavaGenericImport<JAdvertiseCallbackClass, JAdvertiseCallback>) end;

  JAdvertiseDataClass = interface(JObjectClass)
    ['{D904B990-967D-4B88-A845-A6D0A3AAB229}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/AdvertiseData')]
  JAdvertiseData = interface(JObject)
    ['{1A692105-2B87-4D48-AA87-AE3D4874D1A6}']
    function describeContents: Integer; cdecl;
    function getIncludeDeviceName: Boolean; cdecl;
    function getIncludeTxPowerLevel: Boolean; cdecl;
    function getManufacturerSpecificData: JSparseArray; cdecl;
    function getServiceData: JMap; cdecl;
    function getServiceSolicitationUuids: JList; cdecl;
    function getServiceUuids: JList; cdecl;
    function getTransportDiscoveryData: JList; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAdvertiseData = class(TJavaGenericImport<JAdvertiseDataClass, JAdvertiseData>) end;

  JAdvertiseData_BuilderClass = interface(JObjectClass)
    ['{04AD7CFA-5013-49D7-8714-866B66ABCABF}']
    {class} function init: JAdvertiseData_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/AdvertiseData$Builder')]
  JAdvertiseData_Builder = interface(JObject)
    ['{1927C788-38E0-406B-886C-7939CBA10C6F}']
    function addManufacturerData(manufacturerId: Integer; manufacturerSpecificData: TJavaArray<Byte>): JAdvertiseData_Builder; cdecl;
    function addServiceData(serviceDataUuid: JParcelUuid; serviceData: TJavaArray<Byte>): JAdvertiseData_Builder; cdecl;
    function addServiceSolicitationUuid(serviceSolicitationUuid: JParcelUuid): JAdvertiseData_Builder; cdecl;
    function addServiceUuid(serviceUuid: JParcelUuid): JAdvertiseData_Builder; cdecl;
    function addTransportDiscoveryData(transportDiscoveryData: JTransportDiscoveryData): JAdvertiseData_Builder; cdecl;
    function build: JAdvertiseData; cdecl;
    function setIncludeDeviceName(includeDeviceName: Boolean): JAdvertiseData_Builder; cdecl;
    function setIncludeTxPowerLevel(includeTxPowerLevel: Boolean): JAdvertiseData_Builder; cdecl;
  end;
  TJAdvertiseData_Builder = class(TJavaGenericImport<JAdvertiseData_BuilderClass, JAdvertiseData_Builder>) end;

  JAdvertiseSettingsClass = interface(JObjectClass)
    ['{5F84BBCE-073D-4CFE-AD88-51313256A925}']
    {class} function _GetADVERTISE_MODE_BALANCED: Integer; cdecl;
    {class} function _GetADVERTISE_MODE_LOW_LATENCY: Integer; cdecl;
    {class} function _GetADVERTISE_MODE_LOW_POWER: Integer; cdecl;
    {class} function _GetADVERTISE_TX_POWER_HIGH: Integer; cdecl;
    {class} function _GetADVERTISE_TX_POWER_LOW: Integer; cdecl;
    {class} function _GetADVERTISE_TX_POWER_MEDIUM: Integer; cdecl;
    {class} function _GetADVERTISE_TX_POWER_ULTRA_LOW: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property ADVERTISE_MODE_BALANCED: Integer read _GetADVERTISE_MODE_BALANCED;
    {class} property ADVERTISE_MODE_LOW_LATENCY: Integer read _GetADVERTISE_MODE_LOW_LATENCY;
    {class} property ADVERTISE_MODE_LOW_POWER: Integer read _GetADVERTISE_MODE_LOW_POWER;
    {class} property ADVERTISE_TX_POWER_HIGH: Integer read _GetADVERTISE_TX_POWER_HIGH;
    {class} property ADVERTISE_TX_POWER_LOW: Integer read _GetADVERTISE_TX_POWER_LOW;
    {class} property ADVERTISE_TX_POWER_MEDIUM: Integer read _GetADVERTISE_TX_POWER_MEDIUM;
    {class} property ADVERTISE_TX_POWER_ULTRA_LOW: Integer read _GetADVERTISE_TX_POWER_ULTRA_LOW;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/AdvertiseSettings')]
  JAdvertiseSettings = interface(JObject)
    ['{9959EE83-A90F-4A14-9722-F7D1F079621A}']
    function describeContents: Integer; cdecl;
    function getMode: Integer; cdecl;
    function getTimeout: Integer; cdecl;
    function getTxPowerLevel: Integer; cdecl;
    function isConnectable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAdvertiseSettings = class(TJavaGenericImport<JAdvertiseSettingsClass, JAdvertiseSettings>) end;

  JAdvertiseSettings_BuilderClass = interface(JObjectClass)
    ['{B83834DB-02C7-47F7-AFEC-D8454A69D8A5}']
    {class} function init: JAdvertiseSettings_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/AdvertiseSettings$Builder')]
  JAdvertiseSettings_Builder = interface(JObject)
    ['{90BF25C9-3B6B-4859-8FA3-66CDB830089A}']
    function build: JAdvertiseSettings; cdecl;
    function setAdvertiseMode(advertiseMode: Integer): JAdvertiseSettings_Builder; cdecl;
    function setConnectable(connectable: Boolean): JAdvertiseSettings_Builder; cdecl;
    function setTimeout(timeoutMillis: Integer): JAdvertiseSettings_Builder; cdecl;
    function setTxPowerLevel(txPowerLevel: Integer): JAdvertiseSettings_Builder; cdecl;
  end;
  TJAdvertiseSettings_Builder = class(TJavaGenericImport<JAdvertiseSettings_BuilderClass, JAdvertiseSettings_Builder>) end;

  JAdvertisingSetClass = interface(JObjectClass)
    ['{0DD37CF8-1353-4286-98D1-7799F2D490F4}']
  end;

  [JavaSignature('android/bluetooth/le/AdvertisingSet')]
  JAdvertisingSet = interface(JObject)
    ['{428985DA-D77E-4628-8A6D-EDDABD8E1B73}']
    procedure enableAdvertising(enable: Boolean; duration: Integer; maxExtendedAdvertisingEvents: Integer); cdecl;
    procedure setAdvertisingData(advertiseData: JAdvertiseData); cdecl;
    procedure setAdvertisingParameters(parameters: JAdvertisingSetParameters); cdecl;
    procedure setPeriodicAdvertisingData(periodicData: JAdvertiseData); cdecl;
    procedure setPeriodicAdvertisingEnabled(enable: Boolean); cdecl;
    procedure setPeriodicAdvertisingParameters(parameters: JPeriodicAdvertisingParameters); cdecl;
    procedure setScanResponseData(scanResponse: JAdvertiseData); cdecl;
  end;
  TJAdvertisingSet = class(TJavaGenericImport<JAdvertisingSetClass, JAdvertisingSet>) end;

  JAdvertisingSetCallbackClass = interface(JObjectClass)
    ['{4C1FC767-D422-4A72-9EE2-C12F536E8049}']
    {class} function _GetADVERTISE_FAILED_ALREADY_STARTED: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_DATA_TOO_LARGE: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_FEATURE_UNSUPPORTED: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetADVERTISE_FAILED_TOO_MANY_ADVERTISERS: Integer; cdecl;
    {class} function _GetADVERTISE_SUCCESS: Integer; cdecl;
    {class} function init: JAdvertisingSetCallback; cdecl;
    {class} property ADVERTISE_FAILED_ALREADY_STARTED: Integer read _GetADVERTISE_FAILED_ALREADY_STARTED;
    {class} property ADVERTISE_FAILED_DATA_TOO_LARGE: Integer read _GetADVERTISE_FAILED_DATA_TOO_LARGE;
    {class} property ADVERTISE_FAILED_FEATURE_UNSUPPORTED: Integer read _GetADVERTISE_FAILED_FEATURE_UNSUPPORTED;
    {class} property ADVERTISE_FAILED_INTERNAL_ERROR: Integer read _GetADVERTISE_FAILED_INTERNAL_ERROR;
    {class} property ADVERTISE_FAILED_TOO_MANY_ADVERTISERS: Integer read _GetADVERTISE_FAILED_TOO_MANY_ADVERTISERS;
    {class} property ADVERTISE_SUCCESS: Integer read _GetADVERTISE_SUCCESS;
  end;

  [JavaSignature('android/bluetooth/le/AdvertisingSetCallback')]
  JAdvertisingSetCallback = interface(JObject)
    ['{F90414F7-95C5-4D53-9050-1275567B735C}']
    procedure onAdvertisingDataSet(advertisingSet: JAdvertisingSet; status: Integer); cdecl;
    procedure onAdvertisingEnabled(advertisingSet: JAdvertisingSet; enable: Boolean; status: Integer); cdecl;
    procedure onAdvertisingParametersUpdated(advertisingSet: JAdvertisingSet; txPower: Integer; status: Integer); cdecl;
    procedure onAdvertisingSetStarted(advertisingSet: JAdvertisingSet; txPower: Integer; status: Integer); cdecl;
    procedure onAdvertisingSetStopped(advertisingSet: JAdvertisingSet); cdecl;
    procedure onPeriodicAdvertisingDataSet(advertisingSet: JAdvertisingSet; status: Integer); cdecl;
    procedure onPeriodicAdvertisingEnabled(advertisingSet: JAdvertisingSet; enable: Boolean; status: Integer); cdecl;
    procedure onPeriodicAdvertisingParametersUpdated(advertisingSet: JAdvertisingSet; status: Integer); cdecl;
    procedure onScanResponseDataSet(advertisingSet: JAdvertisingSet; status: Integer); cdecl;
  end;
  TJAdvertisingSetCallback = class(TJavaGenericImport<JAdvertisingSetCallbackClass, JAdvertisingSetCallback>) end;

  JAdvertisingSetParametersClass = interface(JObjectClass)
    ['{A118B424-8CFF-478E-AA2A-C7AD4A4B7720}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetINTERVAL_HIGH: Integer; cdecl;
    {class} function _GetINTERVAL_LOW: Integer; cdecl;
    {class} function _GetINTERVAL_MAX: Integer; cdecl;
    {class} function _GetINTERVAL_MEDIUM: Integer; cdecl;
    {class} function _GetINTERVAL_MIN: Integer; cdecl;
    {class} function _GetTX_POWER_HIGH: Integer; cdecl;
    {class} function _GetTX_POWER_LOW: Integer; cdecl;
    {class} function _GetTX_POWER_MAX: Integer; cdecl;
    {class} function _GetTX_POWER_MEDIUM: Integer; cdecl;
    {class} function _GetTX_POWER_MIN: Integer; cdecl;
    {class} function _GetTX_POWER_ULTRA_LOW: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property INTERVAL_HIGH: Integer read _GetINTERVAL_HIGH;
    {class} property INTERVAL_LOW: Integer read _GetINTERVAL_LOW;
    {class} property INTERVAL_MAX: Integer read _GetINTERVAL_MAX;
    {class} property INTERVAL_MEDIUM: Integer read _GetINTERVAL_MEDIUM;
    {class} property INTERVAL_MIN: Integer read _GetINTERVAL_MIN;
    {class} property TX_POWER_HIGH: Integer read _GetTX_POWER_HIGH;
    {class} property TX_POWER_LOW: Integer read _GetTX_POWER_LOW;
    {class} property TX_POWER_MAX: Integer read _GetTX_POWER_MAX;
    {class} property TX_POWER_MEDIUM: Integer read _GetTX_POWER_MEDIUM;
    {class} property TX_POWER_MIN: Integer read _GetTX_POWER_MIN;
    {class} property TX_POWER_ULTRA_LOW: Integer read _GetTX_POWER_ULTRA_LOW;
  end;

  [JavaSignature('android/bluetooth/le/AdvertisingSetParameters')]
  JAdvertisingSetParameters = interface(JObject)
    ['{8C218B5A-714E-4597-8541-EF64EC367A70}']
    function describeContents: Integer; cdecl;
    function getInterval: Integer; cdecl;
    function getPrimaryPhy: Integer; cdecl;
    function getSecondaryPhy: Integer; cdecl;
    function getTxPowerLevel: Integer; cdecl;
    function includeTxPower: Boolean; cdecl;
    function isAnonymous: Boolean; cdecl;
    function isConnectable: Boolean; cdecl;
    function isLegacy: Boolean; cdecl;
    function isScannable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAdvertisingSetParameters = class(TJavaGenericImport<JAdvertisingSetParametersClass, JAdvertisingSetParameters>) end;

  JAdvertisingSetParameters_BuilderClass = interface(JObjectClass)
    ['{BC2C47DE-8C72-430B-BC4F-8F5B6B1EBAAC}']
    {class} function init: JAdvertisingSetParameters_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/AdvertisingSetParameters$Builder')]
  JAdvertisingSetParameters_Builder = interface(JObject)
    ['{580EFC33-4F03-4673-ABA9-4771215EA7F3}']
    function build: JAdvertisingSetParameters; cdecl;
    function setAnonymous(isAnonymous: Boolean): JAdvertisingSetParameters_Builder; cdecl;
    function setConnectable(connectable: Boolean): JAdvertisingSetParameters_Builder; cdecl;
    function setIncludeTxPower(includeTxPower: Boolean): JAdvertisingSetParameters_Builder; cdecl;
    function setInterval(interval: Integer): JAdvertisingSetParameters_Builder; cdecl;
    function setLegacyMode(isLegacy: Boolean): JAdvertisingSetParameters_Builder; cdecl;
    function setPrimaryPhy(primaryPhy: Integer): JAdvertisingSetParameters_Builder; cdecl;
    function setScannable(scannable: Boolean): JAdvertisingSetParameters_Builder; cdecl;
    function setSecondaryPhy(secondaryPhy: Integer): JAdvertisingSetParameters_Builder; cdecl;
    function setTxPowerLevel(txPowerLevel: Integer): JAdvertisingSetParameters_Builder; cdecl;
  end;
  TJAdvertisingSetParameters_Builder = class(TJavaGenericImport<JAdvertisingSetParameters_BuilderClass, JAdvertisingSetParameters_Builder>) end;

  JBluetoothLeAdvertiserClass = interface(JObjectClass)
    ['{80721D97-DB54-461C-A1D0-A67526BCEF9C}']
  end;

  [JavaSignature('android/bluetooth/le/BluetoothLeAdvertiser')]
  JBluetoothLeAdvertiser = interface(JObject)
    ['{62DF5392-8FFA-4F1A-A801-2DB6DC44C9B3}']
    procedure startAdvertising(settings: JAdvertiseSettings; advertiseData: JAdvertiseData; callback: JAdvertiseCallback); cdecl; overload;
    procedure startAdvertising(settings: JAdvertiseSettings; advertiseData: JAdvertiseData; scanResponse: JAdvertiseData; callback: JAdvertiseCallback); cdecl; overload;
    procedure startAdvertisingSet(parameters: JAdvertisingSetParameters; advertiseData: JAdvertiseData; scanResponse: JAdvertiseData; periodicParameters: JPeriodicAdvertisingParameters; periodicData: JAdvertiseData; callback: JAdvertisingSetCallback); cdecl; overload;
    procedure startAdvertisingSet(parameters: JAdvertisingSetParameters; advertiseData: JAdvertiseData; scanResponse: JAdvertiseData; periodicParameters: JPeriodicAdvertisingParameters; periodicData: JAdvertiseData; callback: JAdvertisingSetCallback; handler: JHandler); cdecl; overload;
    procedure startAdvertisingSet(parameters: JAdvertisingSetParameters; advertiseData: JAdvertiseData; scanResponse: JAdvertiseData; periodicParameters: JPeriodicAdvertisingParameters; periodicData: JAdvertiseData; duration: Integer; maxExtendedAdvertisingEvents: Integer; callback: JAdvertisingSetCallback); cdecl; overload;
    procedure startAdvertisingSet(parameters: JAdvertisingSetParameters; advertiseData: JAdvertiseData; scanResponse: JAdvertiseData; periodicParameters: JPeriodicAdvertisingParameters; periodicData: JAdvertiseData; duration: Integer; maxExtendedAdvertisingEvents: Integer; callback: JAdvertisingSetCallback; handler: JHandler); cdecl; overload;
    procedure stopAdvertising(callback: JAdvertiseCallback); cdecl;
    procedure stopAdvertisingSet(callback: JAdvertisingSetCallback); cdecl;
  end;
  TJBluetoothLeAdvertiser = class(TJavaGenericImport<JBluetoothLeAdvertiserClass, JBluetoothLeAdvertiser>) end;

  JBluetoothLeScannerClass = interface(JObjectClass)
    ['{037CB52E-670F-4EC0-8036-7B518C73D8D6}']
    {class} function _GetEXTRA_CALLBACK_TYPE: JString; cdecl;
    {class} function _GetEXTRA_ERROR_CODE: JString; cdecl;
    {class} function _GetEXTRA_LIST_SCAN_RESULT: JString; cdecl;
    {class} property EXTRA_CALLBACK_TYPE: JString read _GetEXTRA_CALLBACK_TYPE;
    {class} property EXTRA_ERROR_CODE: JString read _GetEXTRA_ERROR_CODE;
    {class} property EXTRA_LIST_SCAN_RESULT: JString read _GetEXTRA_LIST_SCAN_RESULT;
  end;

  [JavaSignature('android/bluetooth/le/BluetoothLeScanner')]
  JBluetoothLeScanner = interface(JObject)
    ['{D9746B62-4BD2-49A5-A756-954FC149B136}']
    procedure flushPendingScanResults(callback: JScanCallback); cdecl;
    procedure startScan(callback: JScanCallback); cdecl; overload;
    procedure startScan(filters: JList; settings: JScanSettings; callback: JScanCallback); cdecl; overload;
    function startScan(filters: JList; settings: JScanSettings; callbackIntent: JPendingIntent): Integer; cdecl; overload;
    procedure stopScan(callback: JScanCallback); cdecl; overload;
    procedure stopScan(callbackIntent: JPendingIntent); cdecl; overload;
  end;
  TJBluetoothLeScanner = class(TJavaGenericImport<JBluetoothLeScannerClass, JBluetoothLeScanner>) end;

  JPeriodicAdvertisingParametersClass = interface(JObjectClass)
    ['{550E5511-B44F-4EAF-80B9-FCF2C533B094}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/PeriodicAdvertisingParameters')]
  JPeriodicAdvertisingParameters = interface(JObject)
    ['{506432D6-7F07-4E2F-92B2-AF7D1BF1AFA1}']
    function describeContents: Integer; cdecl;
    function getIncludeTxPower: Boolean; cdecl;
    function getInterval: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPeriodicAdvertisingParameters = class(TJavaGenericImport<JPeriodicAdvertisingParametersClass, JPeriodicAdvertisingParameters>) end;

  JPeriodicAdvertisingParameters_BuilderClass = interface(JObjectClass)
    ['{C2E7C307-018C-47B3-8E49-A8A15C4771E8}']
    {class} function init: JPeriodicAdvertisingParameters_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/PeriodicAdvertisingParameters$Builder')]
  JPeriodicAdvertisingParameters_Builder = interface(JObject)
    ['{C9A0174E-DE54-492F-88A7-BFA145CDC9A2}']
    function build: JPeriodicAdvertisingParameters; cdecl;
    function setIncludeTxPower(includeTxPower: Boolean): JPeriodicAdvertisingParameters_Builder; cdecl;
    function setInterval(interval: Integer): JPeriodicAdvertisingParameters_Builder; cdecl;
  end;
  TJPeriodicAdvertisingParameters_Builder = class(TJavaGenericImport<JPeriodicAdvertisingParameters_BuilderClass, JPeriodicAdvertisingParameters_Builder>) end;

  JScanCallbackClass = interface(JObjectClass)
    ['{54AC4025-A2D2-4F97-96A8-8B99C58C31C3}']
    {class} function _GetSCAN_FAILED_ALREADY_STARTED: Integer; cdecl;
    {class} function _GetSCAN_FAILED_APPLICATION_REGISTRATION_FAILED: Integer; cdecl;
    {class} function _GetSCAN_FAILED_FEATURE_UNSUPPORTED: Integer; cdecl;
    {class} function _GetSCAN_FAILED_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetSCAN_FAILED_OUT_OF_HARDWARE_RESOURCES: Integer; cdecl;
    {class} function _GetSCAN_FAILED_SCANNING_TOO_FREQUENTLY: Integer; cdecl;
    {class} function init: JScanCallback; cdecl;
    {class} property SCAN_FAILED_ALREADY_STARTED: Integer read _GetSCAN_FAILED_ALREADY_STARTED;
    {class} property SCAN_FAILED_APPLICATION_REGISTRATION_FAILED: Integer read _GetSCAN_FAILED_APPLICATION_REGISTRATION_FAILED;
    {class} property SCAN_FAILED_FEATURE_UNSUPPORTED: Integer read _GetSCAN_FAILED_FEATURE_UNSUPPORTED;
    {class} property SCAN_FAILED_INTERNAL_ERROR: Integer read _GetSCAN_FAILED_INTERNAL_ERROR;
    {class} property SCAN_FAILED_OUT_OF_HARDWARE_RESOURCES: Integer read _GetSCAN_FAILED_OUT_OF_HARDWARE_RESOURCES;
    {class} property SCAN_FAILED_SCANNING_TOO_FREQUENTLY: Integer read _GetSCAN_FAILED_SCANNING_TOO_FREQUENTLY;
  end;

  [JavaSignature('android/bluetooth/le/ScanCallback')]
  JScanCallback = interface(JObject)
    ['{7EFE6E06-FCDD-448F-92BA-D29B0AC06FF3}']
    procedure onBatchScanResults(results: JList); cdecl;
    procedure onScanFailed(errorCode: Integer); cdecl;
    procedure onScanResult(callbackType: Integer; result: Jle_ScanResult); cdecl;
  end;
  TJScanCallback = class(TJavaGenericImport<JScanCallbackClass, JScanCallback>) end;

  JScanFilterClass = interface(JObjectClass)
    ['{3F554F98-0D00-4364-8C99-0F69610E404E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/ScanFilter')]
  JScanFilter = interface(JObject)
    ['{6A6D8301-C452-45DB-BE33-A23ABF3564E4}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAdvertisingData: TJavaArray<Byte>; cdecl;
    function getAdvertisingDataMask: TJavaArray<Byte>; cdecl;
    function getAdvertisingDataType: Integer; cdecl;
    function getDeviceAddress: JString; cdecl;
    function getDeviceName: JString; cdecl;
    function getManufacturerData: TJavaArray<Byte>; cdecl;
    function getManufacturerDataMask: TJavaArray<Byte>; cdecl;
    function getManufacturerId: Integer; cdecl;
    function getServiceData: TJavaArray<Byte>; cdecl;
    function getServiceDataMask: TJavaArray<Byte>; cdecl;
    function getServiceDataUuid: JParcelUuid; cdecl;
    function getServiceSolicitationUuid: JParcelUuid; cdecl;
    function getServiceSolicitationUuidMask: JParcelUuid; cdecl;
    function getServiceUuid: JParcelUuid; cdecl;
    function getServiceUuidMask: JParcelUuid; cdecl;
    function hashCode: Integer; cdecl;
    function matches(scanResult: Jle_ScanResult): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJScanFilter = class(TJavaGenericImport<JScanFilterClass, JScanFilter>) end;

  JScanFilter_BuilderClass = interface(JObjectClass)
    ['{CA942A72-9984-418B-9053-FCBFFAEF3C76}']
    {class} function init: JScanFilter_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/ScanFilter$Builder')]
  JScanFilter_Builder = interface(JObject)
    ['{4A1C4430-A3A5-40D7-9C2D-827357F884DC}']
    function build: JScanFilter; cdecl;
    function setAdvertisingDataType(advertisingDataType: Integer): JScanFilter_Builder; cdecl;
    function setAdvertisingDataTypeWithData(advertisingDataType: Integer; advertisingData: TJavaArray<Byte>; advertisingDataMask: TJavaArray<Byte>): JScanFilter_Builder; cdecl;
    function setDeviceAddress(deviceAddress: JString): JScanFilter_Builder; cdecl;
    function setDeviceName(deviceName: JString): JScanFilter_Builder; cdecl;
    function setManufacturerData(manufacturerId: Integer; manufacturerData: TJavaArray<Byte>): JScanFilter_Builder; cdecl; overload;
    function setManufacturerData(manufacturerId: Integer; manufacturerData: TJavaArray<Byte>; manufacturerDataMask: TJavaArray<Byte>): JScanFilter_Builder; cdecl; overload;
    function setServiceData(serviceDataUuid: JParcelUuid; serviceData: TJavaArray<Byte>): JScanFilter_Builder; cdecl; overload;
    function setServiceData(serviceDataUuid: JParcelUuid; serviceData: TJavaArray<Byte>; serviceDataMask: TJavaArray<Byte>): JScanFilter_Builder; cdecl; overload;
    function setServiceSolicitationUuid(serviceSolicitationUuid: JParcelUuid): JScanFilter_Builder; cdecl; overload;
    function setServiceSolicitationUuid(serviceSolicitationUuid: JParcelUuid; solicitationUuidMask: JParcelUuid): JScanFilter_Builder; cdecl; overload;
    function setServiceUuid(serviceUuid: JParcelUuid): JScanFilter_Builder; cdecl; overload;
    function setServiceUuid(serviceUuid: JParcelUuid; uuidMask: JParcelUuid): JScanFilter_Builder; cdecl; overload;
  end;
  TJScanFilter_Builder = class(TJavaGenericImport<JScanFilter_BuilderClass, JScanFilter_Builder>) end;

  JScanRecordClass = interface(JObjectClass)
    ['{E8C389F7-8E29-44DD-A897-601E4AA601A1}']
    {class} function _GetDATA_TYPE_3D_INFORMATION_DATA: Integer; cdecl;
    {class} function _GetDATA_TYPE_ADVERTISING_INTERVAL: Integer; cdecl;
    {class} function _GetDATA_TYPE_ADVERTISING_INTERVAL_LONG: Integer; cdecl;
    {class} function _GetDATA_TYPE_APPEARANCE: Integer; cdecl;
    {class} function _GetDATA_TYPE_BIG_INFO: Integer; cdecl;
    {class} function _GetDATA_TYPE_BROADCAST_CODE: Integer; cdecl;
    {class} function _GetDATA_TYPE_CHANNEL_MAP_UPDATE_INDICATION: Integer; cdecl;
    {class} function _GetDATA_TYPE_CLASS_OF_DEVICE: Integer; cdecl;
    {class} function _GetDATA_TYPE_DEVICE_ID: Integer; cdecl;
    {class} function _GetDATA_TYPE_FLAGS: Integer; cdecl;
    {class} function _GetDATA_TYPE_INDOOR_POSITIONING: Integer; cdecl;
    {class} function _GetDATA_TYPE_LE_BLUETOOTH_DEVICE_ADDRESS: Integer; cdecl;
    {class} function _GetDATA_TYPE_LE_ROLE: Integer; cdecl;
    {class} function _GetDATA_TYPE_LE_SECURE_CONNECTIONS_CONFIRMATION_VALUE: Integer; cdecl;
    {class} function _GetDATA_TYPE_LE_SECURE_CONNECTIONS_RANDOM_VALUE: Integer; cdecl;
    {class} function _GetDATA_TYPE_LE_SUPPORTED_FEATURES: Integer; cdecl;
    {class} function _GetDATA_TYPE_LOCAL_NAME_COMPLETE: Integer; cdecl;
    {class} function _GetDATA_TYPE_LOCAL_NAME_SHORT: Integer; cdecl;
    {class} function _GetDATA_TYPE_MANUFACTURER_SPECIFIC_DATA: Integer; cdecl;
    {class} function _GetDATA_TYPE_MESH_BEACON: Integer; cdecl;
    {class} function _GetDATA_TYPE_MESH_MESSAGE: Integer; cdecl;
    {class} function _GetDATA_TYPE_NONE: Integer; cdecl;
    {class} function _GetDATA_TYPE_PB_ADV: Integer; cdecl;
    {class} function _GetDATA_TYPE_PUBLIC_TARGET_ADDRESS: Integer; cdecl;
    {class} function _GetDATA_TYPE_RANDOM_TARGET_ADDRESS: Integer; cdecl;
    {class} function _GetDATA_TYPE_RESOLVABLE_SET_IDENTIFIER: Integer; cdecl;
    {class} function _GetDATA_TYPE_SECURITY_MANAGER_OUT_OF_BAND_FLAGS: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_DATA_128_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_DATA_16_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_DATA_32_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_128_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_16_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_32_BIT: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_128_BIT_COMPLETE: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_128_BIT_PARTIAL: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_16_BIT_COMPLETE: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_16_BIT_PARTIAL: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_32_BIT_COMPLETE: Integer; cdecl;
    {class} function _GetDATA_TYPE_SERVICE_UUIDS_32_BIT_PARTIAL: Integer; cdecl;
    {class} function _GetDATA_TYPE_SIMPLE_PAIRING_HASH_C: Integer; cdecl;
    {class} function _GetDATA_TYPE_SIMPLE_PAIRING_HASH_C_256: Integer; cdecl;
    {class} function _GetDATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R: Integer; cdecl;
    {class} function _GetDATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R_256: Integer; cdecl;
    {class} function _GetDATA_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE: Integer; cdecl;
    {class} function _GetDATA_TYPE_TRANSPORT_DISCOVERY_DATA: Integer; cdecl;
    {class} function _GetDATA_TYPE_TX_POWER_LEVEL: Integer; cdecl;
    {class} function _GetDATA_TYPE_URI: Integer; cdecl;
    {class} property DATA_TYPE_3D_INFORMATION_DATA: Integer read _GetDATA_TYPE_3D_INFORMATION_DATA;
    {class} property DATA_TYPE_ADVERTISING_INTERVAL: Integer read _GetDATA_TYPE_ADVERTISING_INTERVAL;
    {class} property DATA_TYPE_ADVERTISING_INTERVAL_LONG: Integer read _GetDATA_TYPE_ADVERTISING_INTERVAL_LONG;
    {class} property DATA_TYPE_APPEARANCE: Integer read _GetDATA_TYPE_APPEARANCE;
    {class} property DATA_TYPE_BIG_INFO: Integer read _GetDATA_TYPE_BIG_INFO;
    {class} property DATA_TYPE_BROADCAST_CODE: Integer read _GetDATA_TYPE_BROADCAST_CODE;
    {class} property DATA_TYPE_CHANNEL_MAP_UPDATE_INDICATION: Integer read _GetDATA_TYPE_CHANNEL_MAP_UPDATE_INDICATION;
    {class} property DATA_TYPE_CLASS_OF_DEVICE: Integer read _GetDATA_TYPE_CLASS_OF_DEVICE;
    {class} property DATA_TYPE_DEVICE_ID: Integer read _GetDATA_TYPE_DEVICE_ID;
    {class} property DATA_TYPE_FLAGS: Integer read _GetDATA_TYPE_FLAGS;
    {class} property DATA_TYPE_INDOOR_POSITIONING: Integer read _GetDATA_TYPE_INDOOR_POSITIONING;
    {class} property DATA_TYPE_LE_BLUETOOTH_DEVICE_ADDRESS: Integer read _GetDATA_TYPE_LE_BLUETOOTH_DEVICE_ADDRESS;
    {class} property DATA_TYPE_LE_ROLE: Integer read _GetDATA_TYPE_LE_ROLE;
    {class} property DATA_TYPE_LE_SECURE_CONNECTIONS_CONFIRMATION_VALUE: Integer read _GetDATA_TYPE_LE_SECURE_CONNECTIONS_CONFIRMATION_VALUE;
    {class} property DATA_TYPE_LE_SECURE_CONNECTIONS_RANDOM_VALUE: Integer read _GetDATA_TYPE_LE_SECURE_CONNECTIONS_RANDOM_VALUE;
    {class} property DATA_TYPE_LE_SUPPORTED_FEATURES: Integer read _GetDATA_TYPE_LE_SUPPORTED_FEATURES;
    {class} property DATA_TYPE_LOCAL_NAME_COMPLETE: Integer read _GetDATA_TYPE_LOCAL_NAME_COMPLETE;
    {class} property DATA_TYPE_LOCAL_NAME_SHORT: Integer read _GetDATA_TYPE_LOCAL_NAME_SHORT;
    {class} property DATA_TYPE_MANUFACTURER_SPECIFIC_DATA: Integer read _GetDATA_TYPE_MANUFACTURER_SPECIFIC_DATA;
    {class} property DATA_TYPE_MESH_BEACON: Integer read _GetDATA_TYPE_MESH_BEACON;
    {class} property DATA_TYPE_MESH_MESSAGE: Integer read _GetDATA_TYPE_MESH_MESSAGE;
    {class} property DATA_TYPE_NONE: Integer read _GetDATA_TYPE_NONE;
    {class} property DATA_TYPE_PB_ADV: Integer read _GetDATA_TYPE_PB_ADV;
    {class} property DATA_TYPE_PUBLIC_TARGET_ADDRESS: Integer read _GetDATA_TYPE_PUBLIC_TARGET_ADDRESS;
    {class} property DATA_TYPE_RANDOM_TARGET_ADDRESS: Integer read _GetDATA_TYPE_RANDOM_TARGET_ADDRESS;
    {class} property DATA_TYPE_RESOLVABLE_SET_IDENTIFIER: Integer read _GetDATA_TYPE_RESOLVABLE_SET_IDENTIFIER;
    {class} property DATA_TYPE_SECURITY_MANAGER_OUT_OF_BAND_FLAGS: Integer read _GetDATA_TYPE_SECURITY_MANAGER_OUT_OF_BAND_FLAGS;
    {class} property DATA_TYPE_SERVICE_DATA_128_BIT: Integer read _GetDATA_TYPE_SERVICE_DATA_128_BIT;
    {class} property DATA_TYPE_SERVICE_DATA_16_BIT: Integer read _GetDATA_TYPE_SERVICE_DATA_16_BIT;
    {class} property DATA_TYPE_SERVICE_DATA_32_BIT: Integer read _GetDATA_TYPE_SERVICE_DATA_32_BIT;
    {class} property DATA_TYPE_SERVICE_SOLICITATION_UUIDS_128_BIT: Integer read _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_128_BIT;
    {class} property DATA_TYPE_SERVICE_SOLICITATION_UUIDS_16_BIT: Integer read _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_16_BIT;
    {class} property DATA_TYPE_SERVICE_SOLICITATION_UUIDS_32_BIT: Integer read _GetDATA_TYPE_SERVICE_SOLICITATION_UUIDS_32_BIT;
    {class} property DATA_TYPE_SERVICE_UUIDS_128_BIT_COMPLETE: Integer read _GetDATA_TYPE_SERVICE_UUIDS_128_BIT_COMPLETE;
    {class} property DATA_TYPE_SERVICE_UUIDS_128_BIT_PARTIAL: Integer read _GetDATA_TYPE_SERVICE_UUIDS_128_BIT_PARTIAL;
    {class} property DATA_TYPE_SERVICE_UUIDS_16_BIT_COMPLETE: Integer read _GetDATA_TYPE_SERVICE_UUIDS_16_BIT_COMPLETE;
    {class} property DATA_TYPE_SERVICE_UUIDS_16_BIT_PARTIAL: Integer read _GetDATA_TYPE_SERVICE_UUIDS_16_BIT_PARTIAL;
    {class} property DATA_TYPE_SERVICE_UUIDS_32_BIT_COMPLETE: Integer read _GetDATA_TYPE_SERVICE_UUIDS_32_BIT_COMPLETE;
    {class} property DATA_TYPE_SERVICE_UUIDS_32_BIT_PARTIAL: Integer read _GetDATA_TYPE_SERVICE_UUIDS_32_BIT_PARTIAL;
    {class} property DATA_TYPE_SIMPLE_PAIRING_HASH_C: Integer read _GetDATA_TYPE_SIMPLE_PAIRING_HASH_C;
    {class} property DATA_TYPE_SIMPLE_PAIRING_HASH_C_256: Integer read _GetDATA_TYPE_SIMPLE_PAIRING_HASH_C_256;
    {class} property DATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R: Integer read _GetDATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R;
    {class} property DATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R_256: Integer read _GetDATA_TYPE_SIMPLE_PAIRING_RANDOMIZER_R_256;
    {class} property DATA_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE: Integer read _GetDATA_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE;
    {class} property DATA_TYPE_TRANSPORT_DISCOVERY_DATA: Integer read _GetDATA_TYPE_TRANSPORT_DISCOVERY_DATA;
    {class} property DATA_TYPE_TX_POWER_LEVEL: Integer read _GetDATA_TYPE_TX_POWER_LEVEL;
    {class} property DATA_TYPE_URI: Integer read _GetDATA_TYPE_URI;
  end;

  [JavaSignature('android/bluetooth/le/ScanRecord')]
  JScanRecord = interface(JObject)
    ['{8EE1B96E-AB84-499C-B9F1-1F656029FEE8}']
    function getAdvertiseFlags: Integer; cdecl;
    function getAdvertisingDataMap: JMap; cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    function getDeviceName: JString; cdecl;
    function getManufacturerSpecificData: JSparseArray; cdecl; overload;
    function getManufacturerSpecificData(manufacturerId: Integer): TJavaArray<Byte>; cdecl; overload;
    function getServiceData: JMap; cdecl; overload;
    function getServiceData(serviceDataUuid: JParcelUuid): TJavaArray<Byte>; cdecl; overload;
    function getServiceSolicitationUuids: JList; cdecl;
    function getServiceUuids: JList; cdecl;
    function getTxPowerLevel: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJScanRecord = class(TJavaGenericImport<JScanRecordClass, JScanRecord>) end;

  Jle_ScanResultClass = interface(JObjectClass)
    ['{C654A063-A05D-4E45-A116-59736A9EAFA9}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDATA_COMPLETE: Integer; cdecl;
    {class} function _GetDATA_TRUNCATED: Integer; cdecl;
    {class} function _GetPERIODIC_INTERVAL_NOT_PRESENT: Integer; cdecl;
    {class} function _GetPHY_UNUSED: Integer; cdecl;
    {class} function _GetSID_NOT_PRESENT: Integer; cdecl;
    {class} function _GetTX_POWER_NOT_PRESENT: Integer; cdecl;
    {class} function init(device: JBluetoothDevice; scanRecord: JScanRecord; rssi: Integer; timestampNanos: Int64): Jle_ScanResult; cdecl; overload;//Deprecated
    {class} function init(device: JBluetoothDevice; eventType: Integer; primaryPhy: Integer; secondaryPhy: Integer; advertisingSid: Integer; txPower: Integer; rssi: Integer; periodicAdvertisingInterval: Integer; scanRecord: JScanRecord; timestampNanos: Int64): Jle_ScanResult; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DATA_COMPLETE: Integer read _GetDATA_COMPLETE;
    {class} property DATA_TRUNCATED: Integer read _GetDATA_TRUNCATED;
    {class} property PERIODIC_INTERVAL_NOT_PRESENT: Integer read _GetPERIODIC_INTERVAL_NOT_PRESENT;
    {class} property PHY_UNUSED: Integer read _GetPHY_UNUSED;
    {class} property SID_NOT_PRESENT: Integer read _GetSID_NOT_PRESENT;
    {class} property TX_POWER_NOT_PRESENT: Integer read _GetTX_POWER_NOT_PRESENT;
  end;

  [JavaSignature('android/bluetooth/le/ScanResult')]
  Jle_ScanResult = interface(JObject)
    ['{3277CDD4-F1F2-49A6-96FD-99F6C30C828F}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAdvertisingSid: Integer; cdecl;
    function getDataStatus: Integer; cdecl;
    function getDevice: JBluetoothDevice; cdecl;
    function getPeriodicAdvertisingInterval: Integer; cdecl;
    function getPrimaryPhy: Integer; cdecl;
    function getRssi: Integer; cdecl;
    function getScanRecord: JScanRecord; cdecl;
    function getSecondaryPhy: Integer; cdecl;
    function getTimestampNanos: Int64; cdecl;
    function getTxPower: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isConnectable: Boolean; cdecl;
    function isLegacy: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJle_ScanResult = class(TJavaGenericImport<Jle_ScanResultClass, Jle_ScanResult>) end;

  JScanSettingsClass = interface(JObjectClass)
    ['{71D2996A-A5B7-4EE7-961E-C6E939D3A98D}']
    {class} function _GetCALLBACK_TYPE_ALL_MATCHES: Integer; cdecl;
    {class} function _GetCALLBACK_TYPE_FIRST_MATCH: Integer; cdecl;
    {class} function _GetCALLBACK_TYPE_MATCH_LOST: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMATCH_MODE_AGGRESSIVE: Integer; cdecl;
    {class} function _GetMATCH_MODE_STICKY: Integer; cdecl;
    {class} function _GetMATCH_NUM_FEW_ADVERTISEMENT: Integer; cdecl;
    {class} function _GetMATCH_NUM_MAX_ADVERTISEMENT: Integer; cdecl;
    {class} function _GetMATCH_NUM_ONE_ADVERTISEMENT: Integer; cdecl;
    {class} function _GetPHY_LE_ALL_SUPPORTED: Integer; cdecl;
    {class} function _GetSCAN_MODE_BALANCED: Integer; cdecl;
    {class} function _GetSCAN_MODE_LOW_LATENCY: Integer; cdecl;
    {class} function _GetSCAN_MODE_LOW_POWER: Integer; cdecl;
    {class} function _GetSCAN_MODE_OPPORTUNISTIC: Integer; cdecl;
    {class} property CALLBACK_TYPE_ALL_MATCHES: Integer read _GetCALLBACK_TYPE_ALL_MATCHES;
    {class} property CALLBACK_TYPE_FIRST_MATCH: Integer read _GetCALLBACK_TYPE_FIRST_MATCH;
    {class} property CALLBACK_TYPE_MATCH_LOST: Integer read _GetCALLBACK_TYPE_MATCH_LOST;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property MATCH_MODE_AGGRESSIVE: Integer read _GetMATCH_MODE_AGGRESSIVE;
    {class} property MATCH_MODE_STICKY: Integer read _GetMATCH_MODE_STICKY;
    {class} property MATCH_NUM_FEW_ADVERTISEMENT: Integer read _GetMATCH_NUM_FEW_ADVERTISEMENT;
    {class} property MATCH_NUM_MAX_ADVERTISEMENT: Integer read _GetMATCH_NUM_MAX_ADVERTISEMENT;
    {class} property MATCH_NUM_ONE_ADVERTISEMENT: Integer read _GetMATCH_NUM_ONE_ADVERTISEMENT;
    {class} property PHY_LE_ALL_SUPPORTED: Integer read _GetPHY_LE_ALL_SUPPORTED;
    {class} property SCAN_MODE_BALANCED: Integer read _GetSCAN_MODE_BALANCED;
    {class} property SCAN_MODE_LOW_LATENCY: Integer read _GetSCAN_MODE_LOW_LATENCY;
    {class} property SCAN_MODE_LOW_POWER: Integer read _GetSCAN_MODE_LOW_POWER;
    {class} property SCAN_MODE_OPPORTUNISTIC: Integer read _GetSCAN_MODE_OPPORTUNISTIC;
  end;

  [JavaSignature('android/bluetooth/le/ScanSettings')]
  JScanSettings = interface(JObject)
    ['{6EFFF088-8CE9-46CB-80E6-6C44513B07BC}']
    function describeContents: Integer; cdecl;
    function getCallbackType: Integer; cdecl;
    function getLegacy: Boolean; cdecl;
    function getPhy: Integer; cdecl;
    function getReportDelayMillis: Int64; cdecl;
    function getScanMode: Integer; cdecl;
    function getScanResultType: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJScanSettings = class(TJavaGenericImport<JScanSettingsClass, JScanSettings>) end;

  JScanSettings_BuilderClass = interface(JObjectClass)
    ['{EAFEC592-65E5-48F5-98C1-C3FD2DC334CB}']
    {class} function init: JScanSettings_Builder; cdecl;
  end;

  [JavaSignature('android/bluetooth/le/ScanSettings$Builder')]
  JScanSettings_Builder = interface(JObject)
    ['{8AF38CAF-C3A9-4319-B138-7132DAF82175}']
    function build: JScanSettings; cdecl;
    function setCallbackType(callbackType: Integer): JScanSettings_Builder; cdecl;
    function setLegacy(legacy: Boolean): JScanSettings_Builder; cdecl;
    function setMatchMode(matchMode: Integer): JScanSettings_Builder; cdecl;
    function setNumOfMatches(numOfMatches: Integer): JScanSettings_Builder; cdecl;
    function setPhy(phy: Integer): JScanSettings_Builder; cdecl;
    function setReportDelay(reportDelayMillis: Int64): JScanSettings_Builder; cdecl;
    function setScanMode(scanMode: Integer): JScanSettings_Builder; cdecl;
  end;
  TJScanSettings_Builder = class(TJavaGenericImport<JScanSettings_BuilderClass, JScanSettings_Builder>) end;

  JTransportBlockClass = interface(JObjectClass)
    ['{D6414B4F-0E69-4367-BB64-828C67ED37A5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(orgId: Integer; tdsFlags: Integer; transportDataLength: Integer; transportData: TJavaArray<Byte>): JTransportBlock; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/TransportBlock')]
  JTransportBlock = interface(JObject)
    ['{530F1232-770E-4B7E-B489-8316CE01909A}']
    function getOrgId: Integer; cdecl;
    function getTdsFlags: Integer; cdecl;
    function getTransportData: TJavaArray<Byte>; cdecl;
    function getTransportDataLength: Integer; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function totalBytes: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTransportBlock = class(TJavaGenericImport<JTransportBlockClass, JTransportBlock>) end;

  JTransportDiscoveryDataClass = interface(JObjectClass)
    ['{A86C5FE1-0544-47DA-B133-36A04893FF4B}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(transportDataType: Integer; transportBlocks: JList): JTransportDiscoveryData; cdecl; overload;
    {class} function init(transportDiscoveryData: TJavaArray<Byte>): JTransportDiscoveryData; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/bluetooth/le/TransportDiscoveryData')]
  JTransportDiscoveryData = interface(JObject)
    ['{7B17C1B4-B25D-42AD-B030-15509D47E5F5}']
    function getTransportBlocks: JList; cdecl;
    function getTransportDataType: Integer; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function totalBytes: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTransportDiscoveryData = class(TJavaGenericImport<JTransportDiscoveryDataClass, JTransportDiscoveryData>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothA2dp', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothA2dp));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothAdapter', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothAdapter_LeScanCallback', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothAdapter_LeScanCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothAssignedNumbers', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothAssignedNumbers));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.Jbluetooth_BluetoothClass', TypeInfo(Androidapi.JNI.Bluetooth.Jbluetooth_BluetoothClass));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothClass_Device', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothClass_Device));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JDevice_Major', TypeInfo(Androidapi.JNI.Bluetooth.JDevice_Major));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothClass_Service', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothClass_Service));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothCodecConfig', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothCodecConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothCodecConfig_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothCodecConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothCodecStatus', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothCodecStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothCodecStatus_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothCodecStatus_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothCsipSetCoordinator', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothCsipSetCoordinator));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothDevice', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothDevice));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGatt', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGatt));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattCallback', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattCharacteristic', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattCharacteristic));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattDescriptor', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattServer', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattServer));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattServerCallback', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattServerCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothGattService', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothGattService));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHeadset', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHeadset));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHealth', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHealth));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHealthAppConfiguration', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHealthAppConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHealthCallback', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHealthCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHearingAid', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHearingAid));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHidDevice', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHidDevice));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHidDevice_Callback', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHidDevice_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHidDeviceAppQosSettings', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHidDeviceAppQosSettings));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothHidDeviceAppSdpSettings', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothHidDeviceAppSdpSettings));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeAudio', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeAudio));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecConfig', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecConfig));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecConfig_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecStatus', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeAudioCodecStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothManager', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothManager));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothProfile', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothProfile_ServiceListener', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothProfile_ServiceListener));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothServerSocket', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothServerSocket));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothSocket', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothSocket));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothStatusCodes', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothStatusCodes));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertiseCallback', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertiseCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertiseData', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertiseData));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertiseData_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertiseData_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertiseSettings', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertiseSettings));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertiseSettings_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertiseSettings_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertisingSet', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertisingSet));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertisingSetCallback', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertisingSetCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertisingSetParameters', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertisingSetParameters));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JAdvertisingSetParameters_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JAdvertisingSetParameters_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeAdvertiser', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeAdvertiser));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JBluetoothLeScanner', TypeInfo(Androidapi.JNI.Bluetooth.JBluetoothLeScanner));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JPeriodicAdvertisingParameters', TypeInfo(Androidapi.JNI.Bluetooth.JPeriodicAdvertisingParameters));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JPeriodicAdvertisingParameters_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JPeriodicAdvertisingParameters_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanCallback', TypeInfo(Androidapi.JNI.Bluetooth.JScanCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanFilter', TypeInfo(Androidapi.JNI.Bluetooth.JScanFilter));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanFilter_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JScanFilter_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanRecord', TypeInfo(Androidapi.JNI.Bluetooth.JScanRecord));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.Jle_ScanResult', TypeInfo(Androidapi.JNI.Bluetooth.Jle_ScanResult));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanSettings', TypeInfo(Androidapi.JNI.Bluetooth.JScanSettings));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JScanSettings_Builder', TypeInfo(Androidapi.JNI.Bluetooth.JScanSettings_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JTransportBlock', TypeInfo(Androidapi.JNI.Bluetooth.JTransportBlock));
  TRegTypes.RegisterType('Androidapi.JNI.Bluetooth.JTransportDiscoveryData', TypeInfo(Androidapi.JNI.Bluetooth.JTransportDiscoveryData));
end;

initialization
  RegisterTypes;
end.


