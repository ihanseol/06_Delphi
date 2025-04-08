{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Hardware;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Java.Security,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JBatteryState = interface;//android.hardware.BatteryState
  JCamera = interface;//android.hardware.Camera
  JCamera_AutoFocusCallback = interface;//android.hardware.Camera$AutoFocusCallback
  JCamera_AutoFocusMoveCallback = interface;//android.hardware.Camera$AutoFocusMoveCallback
  JCamera_CameraInfo = interface;//android.hardware.Camera$CameraInfo
  JCamera_ErrorCallback = interface;//android.hardware.Camera$ErrorCallback
  JCamera_Face = interface;//android.hardware.Camera$Face
  JCamera_FaceDetectionListener = interface;//android.hardware.Camera$FaceDetectionListener
  JCamera_OnZoomChangeListener = interface;//android.hardware.Camera$OnZoomChangeListener
  JCamera_Parameters = interface;//android.hardware.Camera$Parameters
  JCamera_PictureCallback = interface;//android.hardware.Camera$PictureCallback
  JCamera_PreviewCallback = interface;//android.hardware.Camera$PreviewCallback
  JCamera_ShutterCallback = interface;//android.hardware.Camera$ShutterCallback
  JCamera_Size = interface;//android.hardware.Camera$Size
  JHardwareBuffer = interface;//android.hardware.HardwareBuffer
  JSensor = interface;//android.hardware.Sensor
  JSensorDirectChannel = interface;//android.hardware.SensorDirectChannel
  JSensorEvent = interface;//android.hardware.SensorEvent
  JSensorEventListener = interface;//android.hardware.SensorEventListener
  JSensorListener = interface;//android.hardware.SensorListener
  JSensorManager = interface;//android.hardware.SensorManager
  JSensorManager_DynamicSensorCallback = interface;//android.hardware.SensorManager$DynamicSensorCallback
  JSyncFence = interface;//android.hardware.SyncFence
  JTriggerEvent = interface;//android.hardware.TriggerEvent
  JTriggerEventListener = interface;//android.hardware.TriggerEventListener
  JBiometricManager = interface;//android.hardware.biometrics.BiometricManager
  JBiometricManager_Strings = interface;//android.hardware.biometrics.BiometricManager$Strings
  JDeviceProductInfo = interface;//android.hardware.display.DeviceProductInfo
  JDisplayManager = interface;//android.hardware.display.DisplayManager
  JDisplayManager_DisplayListener = interface;//android.hardware.display.DisplayManager$DisplayListener
  JVirtualDisplay = interface;//android.hardware.display.VirtualDisplay
  JVirtualDisplay_Callback = interface;//android.hardware.display.VirtualDisplay$Callback
  JFingerprintManager_CryptoObject = interface;//android.hardware.fingerprint.FingerprintManager$CryptoObject
  JLight = interface;//android.hardware.lights.Light
  JLightState = interface;//android.hardware.lights.LightState
  JLightsManager = interface;//android.hardware.lights.LightsManager
  JLightsManager_LightsSession = interface;//android.hardware.lights.LightsManager$LightsSession
  JLightsRequest = interface;//android.hardware.lights.LightsRequest

// ===== Interface declarations =====

  JBatteryStateClass = interface(JObjectClass)
    ['{BE3A9E21-1328-4FF7-86EA-FE2A47B7DC06}']
    {class} function _GetSTATUS_CHARGING: Integer; cdecl;
    {class} function _GetSTATUS_DISCHARGING: Integer; cdecl;
    {class} function _GetSTATUS_FULL: Integer; cdecl;
    {class} function _GetSTATUS_NOT_CHARGING: Integer; cdecl;
    {class} function _GetSTATUS_UNKNOWN: Integer; cdecl;
    {class} function init: JBatteryState; cdecl;
    {class} property STATUS_CHARGING: Integer read _GetSTATUS_CHARGING;
    {class} property STATUS_DISCHARGING: Integer read _GetSTATUS_DISCHARGING;
    {class} property STATUS_FULL: Integer read _GetSTATUS_FULL;
    {class} property STATUS_NOT_CHARGING: Integer read _GetSTATUS_NOT_CHARGING;
    {class} property STATUS_UNKNOWN: Integer read _GetSTATUS_UNKNOWN;
  end;

  [JavaSignature('android/hardware/BatteryState')]
  JBatteryState = interface(JObject)
    ['{E6373433-B153-4E8F-8388-8E5FC4DE449D}']
    function getCapacity: Single; cdecl;
    function getStatus: Integer; cdecl;
    function isPresent: Boolean; cdecl;
  end;
  TJBatteryState = class(TJavaGenericImport<JBatteryStateClass, JBatteryState>) end;

  JCameraClass = interface(JObjectClass)
    ['{EC7FA230-96BA-4ED6-9328-CAC5F459C235}']
    {class} function _GetACTION_NEW_PICTURE: JString; cdecl;
    {class} function _GetACTION_NEW_VIDEO: JString; cdecl;
    {class} function _GetCAMERA_ERROR_EVICTED: Integer; cdecl;
    {class} function _GetCAMERA_ERROR_SERVER_DIED: Integer; cdecl;
    {class} function _GetCAMERA_ERROR_UNKNOWN: Integer; cdecl;
    {class} procedure getCameraInfo(cameraId: Integer; cameraInfo: JCamera_CameraInfo); cdecl;
    {class} function getNumberOfCameras: Integer; cdecl;
    {class} function open(cameraId: Integer): JCamera; cdecl; overload;
    {class} function open: JCamera; cdecl; overload;
    {class} property ACTION_NEW_PICTURE: JString read _GetACTION_NEW_PICTURE;
    {class} property ACTION_NEW_VIDEO: JString read _GetACTION_NEW_VIDEO;
    {class} property CAMERA_ERROR_EVICTED: Integer read _GetCAMERA_ERROR_EVICTED;
    {class} property CAMERA_ERROR_SERVER_DIED: Integer read _GetCAMERA_ERROR_SERVER_DIED;
    {class} property CAMERA_ERROR_UNKNOWN: Integer read _GetCAMERA_ERROR_UNKNOWN;
  end;

  [JavaSignature('android/hardware/Camera')]
  JCamera = interface(JObject)
    ['{40A86A47-3393-4E33-8884-C33107CD903B}']
    procedure addCallbackBuffer(callbackBuffer: TJavaArray<Byte>); cdecl;
    procedure autoFocus(cb: JCamera_AutoFocusCallback); cdecl;
    procedure cancelAutoFocus; cdecl;
    function enableShutterSound(enabled: Boolean): Boolean; cdecl;
    function getParameters: JCamera_Parameters; cdecl;
    procedure lock; cdecl;
    procedure reconnect; cdecl;
    procedure release; cdecl;
    procedure setAutoFocusMoveCallback(cb: JCamera_AutoFocusMoveCallback); cdecl;
    procedure setDisplayOrientation(degrees: Integer); cdecl;
    procedure setErrorCallback(cb: JCamera_ErrorCallback); cdecl;
    procedure setFaceDetectionListener(listener: JCamera_FaceDetectionListener); cdecl;
    procedure setOneShotPreviewCallback(cb: JCamera_PreviewCallback); cdecl;
    procedure setParameters(params: JCamera_Parameters); cdecl;
    procedure setPreviewCallback(cb: JCamera_PreviewCallback); cdecl;
    procedure setPreviewCallbackWithBuffer(cb: JCamera_PreviewCallback); cdecl;
    procedure setPreviewDisplay(holder: JSurfaceHolder); cdecl;
    procedure setPreviewTexture(surfaceTexture: JSurfaceTexture); cdecl;
    procedure setZoomChangeListener(listener: JCamera_OnZoomChangeListener); cdecl;
    procedure startFaceDetection; cdecl;
    procedure startPreview; cdecl;
    procedure startSmoothZoom(value: Integer); cdecl;
    procedure stopFaceDetection; cdecl;
    procedure stopPreview; cdecl;
    procedure stopSmoothZoom; cdecl;
    procedure takePicture(shutter: JCamera_ShutterCallback; raw: JCamera_PictureCallback; jpeg: JCamera_PictureCallback); cdecl; overload;
    procedure takePicture(shutter: JCamera_ShutterCallback; raw: JCamera_PictureCallback; postview: JCamera_PictureCallback; jpeg: JCamera_PictureCallback); cdecl; overload;
    procedure unlock; cdecl;
  end;
  TJCamera = class(TJavaGenericImport<JCameraClass, JCamera>) end;

  JCamera_AutoFocusCallbackClass = interface(IJavaClass)
    ['{624541C8-C3C3-4A09-8367-4C3237E658D0}']
  end;

  [JavaSignature('android/hardware/Camera$AutoFocusCallback')]
  JCamera_AutoFocusCallback = interface(IJavaInstance)
    ['{2E9C9152-C3B7-43EE-98BD-04189FBE43A7}']
    procedure onAutoFocus(success: Boolean; camera: JCamera); cdecl;
  end;
  TJCamera_AutoFocusCallback = class(TJavaGenericImport<JCamera_AutoFocusCallbackClass, JCamera_AutoFocusCallback>) end;

  JCamera_AutoFocusMoveCallbackClass = interface(IJavaClass)
    ['{901C04AC-438E-4233-A469-A3A53EA3A5E3}']
  end;

  [JavaSignature('android/hardware/Camera$AutoFocusMoveCallback')]
  JCamera_AutoFocusMoveCallback = interface(IJavaInstance)
    ['{3F071E3E-4BE6-4DFF-A5C9-458E91DD4204}']
    procedure onAutoFocusMoving(start: Boolean; camera: JCamera); cdecl;
  end;
  TJCamera_AutoFocusMoveCallback = class(TJavaGenericImport<JCamera_AutoFocusMoveCallbackClass, JCamera_AutoFocusMoveCallback>) end;

  JCamera_CameraInfoClass = interface(JObjectClass)
    ['{4D9A2405-77B3-4828-B7F5-AF756B98D6B5}']
    {class} function _GetCAMERA_FACING_BACK: Integer; cdecl;
    {class} function _GetCAMERA_FACING_FRONT: Integer; cdecl;
    {class} function init: JCamera_CameraInfo; cdecl;
    {class} property CAMERA_FACING_BACK: Integer read _GetCAMERA_FACING_BACK;
    {class} property CAMERA_FACING_FRONT: Integer read _GetCAMERA_FACING_FRONT;
  end;

  [JavaSignature('android/hardware/Camera$CameraInfo')]
  JCamera_CameraInfo = interface(JObject)
    ['{D7A9C455-C629-40F6-BCAE-E20195C6069B}']
    function _GetcanDisableShutterSound: Boolean; cdecl;
    procedure _SetcanDisableShutterSound(Value: Boolean); cdecl;
    function _Getfacing: Integer; cdecl;
    procedure _Setfacing(Value: Integer); cdecl;
    function _Getorientation: Integer; cdecl;
    procedure _Setorientation(Value: Integer); cdecl;
    property canDisableShutterSound: Boolean read _GetcanDisableShutterSound write _SetcanDisableShutterSound;
    property facing: Integer read _Getfacing write _Setfacing;
    property orientation: Integer read _Getorientation write _Setorientation;
  end;
  TJCamera_CameraInfo = class(TJavaGenericImport<JCamera_CameraInfoClass, JCamera_CameraInfo>) end;

  JCamera_ErrorCallbackClass = interface(IJavaClass)
    ['{5AAEF0D6-153A-481B-8A54-527D810352D2}']
  end;

  [JavaSignature('android/hardware/Camera$ErrorCallback')]
  JCamera_ErrorCallback = interface(IJavaInstance)
    ['{45CC94C4-4AEC-43B6-861D-A7AC2392CB2D}']
    procedure onError(error: Integer; camera: JCamera); cdecl;
  end;
  TJCamera_ErrorCallback = class(TJavaGenericImport<JCamera_ErrorCallbackClass, JCamera_ErrorCallback>) end;

  JCamera_FaceClass = interface(JObjectClass)
    ['{3926BFB1-9866-403B-A24E-7FCB9251F1A5}']
    {class} function init: JCamera_Face; cdecl;
  end;

  [JavaSignature('android/hardware/Camera$Face')]
  JCamera_Face = interface(JObject)
    ['{4FBCBB16-3A6B-493C-952F-55AC60C75DE9}']
    function _Getid: Integer; cdecl;
    procedure _Setid(Value: Integer); cdecl;
    function _GetleftEye: JPoint; cdecl;
    procedure _SetleftEye(Value: JPoint); cdecl;
    function _Getmouth: JPoint; cdecl;
    procedure _Setmouth(Value: JPoint); cdecl;
    function _Getrect: JRect; cdecl;
    procedure _Setrect(Value: JRect); cdecl;
    function _GetrightEye: JPoint; cdecl;
    procedure _SetrightEye(Value: JPoint); cdecl;
    function _Getscore: Integer; cdecl;
    procedure _Setscore(Value: Integer); cdecl;
    property id: Integer read _Getid write _Setid;
    property leftEye: JPoint read _GetleftEye write _SetleftEye;
    property mouth: JPoint read _Getmouth write _Setmouth;
    property rect: JRect read _Getrect write _Setrect;
    property rightEye: JPoint read _GetrightEye write _SetrightEye;
    property score: Integer read _Getscore write _Setscore;
  end;
  TJCamera_Face = class(TJavaGenericImport<JCamera_FaceClass, JCamera_Face>) end;

  JCamera_FaceDetectionListenerClass = interface(IJavaClass)
    ['{2C26C033-6093-440C-8B6F-E0E8632CE495}']
  end;

  [JavaSignature('android/hardware/Camera$FaceDetectionListener')]
  JCamera_FaceDetectionListener = interface(IJavaInstance)
    ['{F5A3CD35-3B25-41A8-9B69-6EC00C39A0BF}']
    procedure onFaceDetection(faces: TJavaObjectArray<JCamera_Face>; camera: JCamera); cdecl;
  end;
  TJCamera_FaceDetectionListener = class(TJavaGenericImport<JCamera_FaceDetectionListenerClass, JCamera_FaceDetectionListener>) end;

  JCamera_OnZoomChangeListenerClass = interface(IJavaClass)
    ['{7D8BC2A6-9164-48A0-B14F-D65D3642D2BA}']
  end;

  [JavaSignature('android/hardware/Camera$OnZoomChangeListener')]
  JCamera_OnZoomChangeListener = interface(IJavaInstance)
    ['{8083D248-A911-4752-8C17-5F3C9F26CB33}']
    procedure onZoomChange(zoomValue: Integer; stopped: Boolean; camera: JCamera); cdecl;
  end;
  TJCamera_OnZoomChangeListener = class(TJavaGenericImport<JCamera_OnZoomChangeListenerClass, JCamera_OnZoomChangeListener>) end;

  JCamera_ParametersClass = interface(JObjectClass)
    ['{519157BE-F3CB-41ED-90A0-239A67F07E7C}']
    {class} function _GetANTIBANDING_50HZ: JString; cdecl;
    {class} function _GetANTIBANDING_60HZ: JString; cdecl;
    {class} function _GetANTIBANDING_AUTO: JString; cdecl;
    {class} function _GetANTIBANDING_OFF: JString; cdecl;
    {class} function _GetEFFECT_AQUA: JString; cdecl;
    {class} function _GetEFFECT_BLACKBOARD: JString; cdecl;
    {class} function _GetEFFECT_MONO: JString; cdecl;
    {class} function _GetEFFECT_NEGATIVE: JString; cdecl;
    {class} function _GetEFFECT_NONE: JString; cdecl;
    {class} function _GetEFFECT_POSTERIZE: JString; cdecl;
    {class} function _GetEFFECT_SEPIA: JString; cdecl;
    {class} function _GetEFFECT_SOLARIZE: JString; cdecl;
    {class} function _GetEFFECT_WHITEBOARD: JString; cdecl;
    {class} function _GetFLASH_MODE_AUTO: JString; cdecl;
    {class} function _GetFLASH_MODE_OFF: JString; cdecl;
    {class} function _GetFLASH_MODE_ON: JString; cdecl;
    {class} function _GetFLASH_MODE_RED_EYE: JString; cdecl;
    {class} function _GetFLASH_MODE_TORCH: JString; cdecl;
    {class} function _GetFOCUS_DISTANCE_FAR_INDEX: Integer; cdecl;
    {class} function _GetFOCUS_DISTANCE_NEAR_INDEX: Integer; cdecl;
    {class} function _GetFOCUS_DISTANCE_OPTIMAL_INDEX: Integer; cdecl;
    {class} function _GetFOCUS_MODE_AUTO: JString; cdecl;
    {class} function _GetFOCUS_MODE_CONTINUOUS_PICTURE: JString; cdecl;
    {class} function _GetFOCUS_MODE_CONTINUOUS_VIDEO: JString; cdecl;
    {class} function _GetFOCUS_MODE_EDOF: JString; cdecl;
    {class} function _GetFOCUS_MODE_FIXED: JString; cdecl;
    {class} function _GetFOCUS_MODE_INFINITY: JString; cdecl;
    {class} function _GetFOCUS_MODE_MACRO: JString; cdecl;
    {class} function _GetPREVIEW_FPS_MAX_INDEX: Integer; cdecl;
    {class} function _GetPREVIEW_FPS_MIN_INDEX: Integer; cdecl;
    {class} function _GetSCENE_MODE_ACTION: JString; cdecl;
    {class} function _GetSCENE_MODE_AUTO: JString; cdecl;
    {class} function _GetSCENE_MODE_BARCODE: JString; cdecl;
    {class} function _GetSCENE_MODE_BEACH: JString; cdecl;
    {class} function _GetSCENE_MODE_CANDLELIGHT: JString; cdecl;
    {class} function _GetSCENE_MODE_FIREWORKS: JString; cdecl;
    {class} function _GetSCENE_MODE_HDR: JString; cdecl;
    {class} function _GetSCENE_MODE_LANDSCAPE: JString; cdecl;
    {class} function _GetSCENE_MODE_NIGHT: JString; cdecl;
    {class} function _GetSCENE_MODE_NIGHT_PORTRAIT: JString; cdecl;
    {class} function _GetSCENE_MODE_PARTY: JString; cdecl;
    {class} function _GetSCENE_MODE_PORTRAIT: JString; cdecl;
    {class} function _GetSCENE_MODE_SNOW: JString; cdecl;
    {class} function _GetSCENE_MODE_SPORTS: JString; cdecl;
    {class} function _GetSCENE_MODE_STEADYPHOTO: JString; cdecl;
    {class} function _GetSCENE_MODE_SUNSET: JString; cdecl;
    {class} function _GetSCENE_MODE_THEATRE: JString; cdecl;
    {class} function _GetWHITE_BALANCE_AUTO: JString; cdecl;
    {class} function _GetWHITE_BALANCE_CLOUDY_DAYLIGHT: JString; cdecl;
    {class} function _GetWHITE_BALANCE_DAYLIGHT: JString; cdecl;
    {class} function _GetWHITE_BALANCE_FLUORESCENT: JString; cdecl;
    {class} function _GetWHITE_BALANCE_INCANDESCENT: JString; cdecl;
    {class} function _GetWHITE_BALANCE_SHADE: JString; cdecl;
    {class} function _GetWHITE_BALANCE_TWILIGHT: JString; cdecl;
    {class} function _GetWHITE_BALANCE_WARM_FLUORESCENT: JString; cdecl;
    {class} property ANTIBANDING_50HZ: JString read _GetANTIBANDING_50HZ;
    {class} property ANTIBANDING_60HZ: JString read _GetANTIBANDING_60HZ;
    {class} property ANTIBANDING_AUTO: JString read _GetANTIBANDING_AUTO;
    {class} property ANTIBANDING_OFF: JString read _GetANTIBANDING_OFF;
    {class} property EFFECT_AQUA: JString read _GetEFFECT_AQUA;
    {class} property EFFECT_BLACKBOARD: JString read _GetEFFECT_BLACKBOARD;
    {class} property EFFECT_MONO: JString read _GetEFFECT_MONO;
    {class} property EFFECT_NEGATIVE: JString read _GetEFFECT_NEGATIVE;
    {class} property EFFECT_NONE: JString read _GetEFFECT_NONE;
    {class} property EFFECT_POSTERIZE: JString read _GetEFFECT_POSTERIZE;
    {class} property EFFECT_SEPIA: JString read _GetEFFECT_SEPIA;
    {class} property EFFECT_SOLARIZE: JString read _GetEFFECT_SOLARIZE;
    {class} property EFFECT_WHITEBOARD: JString read _GetEFFECT_WHITEBOARD;
    {class} property FLASH_MODE_AUTO: JString read _GetFLASH_MODE_AUTO;
    {class} property FLASH_MODE_OFF: JString read _GetFLASH_MODE_OFF;
    {class} property FLASH_MODE_ON: JString read _GetFLASH_MODE_ON;
    {class} property FLASH_MODE_RED_EYE: JString read _GetFLASH_MODE_RED_EYE;
    {class} property FLASH_MODE_TORCH: JString read _GetFLASH_MODE_TORCH;
    {class} property FOCUS_DISTANCE_FAR_INDEX: Integer read _GetFOCUS_DISTANCE_FAR_INDEX;
    {class} property FOCUS_DISTANCE_NEAR_INDEX: Integer read _GetFOCUS_DISTANCE_NEAR_INDEX;
    {class} property FOCUS_DISTANCE_OPTIMAL_INDEX: Integer read _GetFOCUS_DISTANCE_OPTIMAL_INDEX;
    {class} property FOCUS_MODE_AUTO: JString read _GetFOCUS_MODE_AUTO;
    {class} property FOCUS_MODE_CONTINUOUS_PICTURE: JString read _GetFOCUS_MODE_CONTINUOUS_PICTURE;
    {class} property FOCUS_MODE_CONTINUOUS_VIDEO: JString read _GetFOCUS_MODE_CONTINUOUS_VIDEO;
    {class} property FOCUS_MODE_EDOF: JString read _GetFOCUS_MODE_EDOF;
    {class} property FOCUS_MODE_FIXED: JString read _GetFOCUS_MODE_FIXED;
    {class} property FOCUS_MODE_INFINITY: JString read _GetFOCUS_MODE_INFINITY;
    {class} property FOCUS_MODE_MACRO: JString read _GetFOCUS_MODE_MACRO;
    {class} property PREVIEW_FPS_MAX_INDEX: Integer read _GetPREVIEW_FPS_MAX_INDEX;
    {class} property PREVIEW_FPS_MIN_INDEX: Integer read _GetPREVIEW_FPS_MIN_INDEX;
    {class} property SCENE_MODE_ACTION: JString read _GetSCENE_MODE_ACTION;
    {class} property SCENE_MODE_AUTO: JString read _GetSCENE_MODE_AUTO;
    {class} property SCENE_MODE_BARCODE: JString read _GetSCENE_MODE_BARCODE;
    {class} property SCENE_MODE_BEACH: JString read _GetSCENE_MODE_BEACH;
    {class} property SCENE_MODE_CANDLELIGHT: JString read _GetSCENE_MODE_CANDLELIGHT;
    {class} property SCENE_MODE_FIREWORKS: JString read _GetSCENE_MODE_FIREWORKS;
    {class} property SCENE_MODE_HDR: JString read _GetSCENE_MODE_HDR;
    {class} property SCENE_MODE_LANDSCAPE: JString read _GetSCENE_MODE_LANDSCAPE;
    {class} property SCENE_MODE_NIGHT: JString read _GetSCENE_MODE_NIGHT;
    {class} property SCENE_MODE_NIGHT_PORTRAIT: JString read _GetSCENE_MODE_NIGHT_PORTRAIT;
    {class} property SCENE_MODE_PARTY: JString read _GetSCENE_MODE_PARTY;
    {class} property SCENE_MODE_PORTRAIT: JString read _GetSCENE_MODE_PORTRAIT;
    {class} property SCENE_MODE_SNOW: JString read _GetSCENE_MODE_SNOW;
    {class} property SCENE_MODE_SPORTS: JString read _GetSCENE_MODE_SPORTS;
    {class} property SCENE_MODE_STEADYPHOTO: JString read _GetSCENE_MODE_STEADYPHOTO;
    {class} property SCENE_MODE_SUNSET: JString read _GetSCENE_MODE_SUNSET;
    {class} property SCENE_MODE_THEATRE: JString read _GetSCENE_MODE_THEATRE;
    {class} property WHITE_BALANCE_AUTO: JString read _GetWHITE_BALANCE_AUTO;
    {class} property WHITE_BALANCE_CLOUDY_DAYLIGHT: JString read _GetWHITE_BALANCE_CLOUDY_DAYLIGHT;
    {class} property WHITE_BALANCE_DAYLIGHT: JString read _GetWHITE_BALANCE_DAYLIGHT;
    {class} property WHITE_BALANCE_FLUORESCENT: JString read _GetWHITE_BALANCE_FLUORESCENT;
    {class} property WHITE_BALANCE_INCANDESCENT: JString read _GetWHITE_BALANCE_INCANDESCENT;
    {class} property WHITE_BALANCE_SHADE: JString read _GetWHITE_BALANCE_SHADE;
    {class} property WHITE_BALANCE_TWILIGHT: JString read _GetWHITE_BALANCE_TWILIGHT;
    {class} property WHITE_BALANCE_WARM_FLUORESCENT: JString read _GetWHITE_BALANCE_WARM_FLUORESCENT;
  end;

  [JavaSignature('android/hardware/Camera$Parameters')]
  JCamera_Parameters = interface(JObject)
    ['{EFDE0CD6-C9EB-4DE2-B903-A61589549842}']
    function flatten: JString; cdecl;
    function &get(key: JString): JString; cdecl;
    function getAntibanding: JString; cdecl;
    function getAutoExposureLock: Boolean; cdecl;
    function getAutoWhiteBalanceLock: Boolean; cdecl;
    function getColorEffect: JString; cdecl;
    function getExposureCompensation: Integer; cdecl;
    function getExposureCompensationStep: Single; cdecl;
    function getFlashMode: JString; cdecl;
    function getFocalLength: Single; cdecl;
    function getFocusAreas: JList; cdecl;
    procedure getFocusDistances(output: TJavaArray<Single>); cdecl;
    function getFocusMode: JString; cdecl;
    function getHorizontalViewAngle: Single; cdecl;
    function getInt(key: JString): Integer; cdecl;
    function getJpegQuality: Integer; cdecl;
    function getJpegThumbnailQuality: Integer; cdecl;
    function getJpegThumbnailSize: JCamera_Size; cdecl;
    function getMaxExposureCompensation: Integer; cdecl;
    function getMaxNumDetectedFaces: Integer; cdecl;
    function getMaxNumFocusAreas: Integer; cdecl;
    function getMaxNumMeteringAreas: Integer; cdecl;
    function getMaxZoom: Integer; cdecl;
    function getMeteringAreas: JList; cdecl;
    function getMinExposureCompensation: Integer; cdecl;
    function getPictureFormat: Integer; cdecl;
    function getPictureSize: JCamera_Size; cdecl;
    function getPreferredPreviewSizeForVideo: JCamera_Size; cdecl;
    function getPreviewFormat: Integer; cdecl;
    procedure getPreviewFpsRange(range: TJavaArray<Integer>); cdecl;
    function getPreviewFrameRate: Integer; cdecl;//Deprecated
    function getPreviewSize: JCamera_Size; cdecl;
    function getSceneMode: JString; cdecl;
    function getSupportedAntibanding: JList; cdecl;
    function getSupportedColorEffects: JList; cdecl;
    function getSupportedFlashModes: JList; cdecl;
    function getSupportedFocusModes: JList; cdecl;
    function getSupportedJpegThumbnailSizes: JList; cdecl;
    function getSupportedPictureFormats: JList; cdecl;
    function getSupportedPictureSizes: JList; cdecl;
    function getSupportedPreviewFormats: JList; cdecl;
    function getSupportedPreviewFpsRange: JList; cdecl;
    function getSupportedPreviewFrameRates: JList; cdecl;//Deprecated
    function getSupportedPreviewSizes: JList; cdecl;
    function getSupportedSceneModes: JList; cdecl;
    function getSupportedVideoSizes: JList; cdecl;
    function getSupportedWhiteBalance: JList; cdecl;
    function getVerticalViewAngle: Single; cdecl;
    function getVideoStabilization: Boolean; cdecl;
    function getWhiteBalance: JString; cdecl;
    function getZoom: Integer; cdecl;
    function getZoomRatios: JList; cdecl;
    function isAutoExposureLockSupported: Boolean; cdecl;
    function isAutoWhiteBalanceLockSupported: Boolean; cdecl;
    function isSmoothZoomSupported: Boolean; cdecl;
    function isVideoSnapshotSupported: Boolean; cdecl;
    function isVideoStabilizationSupported: Boolean; cdecl;
    function isZoomSupported: Boolean; cdecl;
    procedure remove(key: JString); cdecl;
    procedure removeGpsData; cdecl;
    procedure &set(key: JString; value: JString); cdecl; overload;
    procedure &set(key: JString; value: Integer); cdecl; overload;
    procedure setAntibanding(antibanding: JString); cdecl;
    procedure setAutoExposureLock(toggle: Boolean); cdecl;
    procedure setAutoWhiteBalanceLock(toggle: Boolean); cdecl;
    procedure setColorEffect(value: JString); cdecl;
    procedure setExposureCompensation(value: Integer); cdecl;
    procedure setFlashMode(value: JString); cdecl;
    procedure setFocusAreas(focusAreas: JList); cdecl;
    procedure setFocusMode(value: JString); cdecl;
    procedure setGpsAltitude(altitude: Double); cdecl;
    procedure setGpsLatitude(latitude: Double); cdecl;
    procedure setGpsLongitude(longitude: Double); cdecl;
    procedure setGpsProcessingMethod(processing_method: JString); cdecl;
    procedure setGpsTimestamp(timestamp: Int64); cdecl;
    procedure setJpegQuality(quality: Integer); cdecl;
    procedure setJpegThumbnailQuality(quality: Integer); cdecl;
    procedure setJpegThumbnailSize(width: Integer; height: Integer); cdecl;
    procedure setMeteringAreas(meteringAreas: JList); cdecl;
    procedure setPictureFormat(pixel_format: Integer); cdecl;
    procedure setPictureSize(width: Integer; height: Integer); cdecl;
    procedure setPreviewFormat(pixel_format: Integer); cdecl;
    procedure setPreviewFpsRange(min: Integer; max: Integer); cdecl;
    procedure setPreviewFrameRate(fps: Integer); cdecl;//Deprecated
    procedure setPreviewSize(width: Integer; height: Integer); cdecl;
    procedure setRecordingHint(hint: Boolean); cdecl;
    procedure setRotation(rotation: Integer); cdecl;
    procedure setSceneMode(value: JString); cdecl;
    procedure setVideoStabilization(toggle: Boolean); cdecl;
    procedure setWhiteBalance(value: JString); cdecl;
    procedure setZoom(value: Integer); cdecl;
    procedure unflatten(flattened: JString); cdecl;
  end;
  TJCamera_Parameters = class(TJavaGenericImport<JCamera_ParametersClass, JCamera_Parameters>) end;

  JCamera_PictureCallbackClass = interface(IJavaClass)
    ['{45CCC52F-A446-40A5-BA95-A16D17A11415}']
  end;

  [JavaSignature('android/hardware/Camera$PictureCallback')]
  JCamera_PictureCallback = interface(IJavaInstance)
    ['{307615DE-4EFD-4290-A113-CCE958C0C8C2}']
    procedure onPictureTaken(data: TJavaArray<Byte>; camera: JCamera); cdecl;
  end;
  TJCamera_PictureCallback = class(TJavaGenericImport<JCamera_PictureCallbackClass, JCamera_PictureCallback>) end;

  JCamera_PreviewCallbackClass = interface(IJavaClass)
    ['{C6836D36-1914-4DB8-8458-D6AEC71A7257}']
  end;

  [JavaSignature('android/hardware/Camera$PreviewCallback')]
  JCamera_PreviewCallback = interface(IJavaInstance)
    ['{6F2F0374-DCFF-43EC-B8BF-DB2F72574EBB}']
    procedure onPreviewFrame(data: TJavaArray<Byte>; camera: JCamera); cdecl;
  end;
  TJCamera_PreviewCallback = class(TJavaGenericImport<JCamera_PreviewCallbackClass, JCamera_PreviewCallback>) end;

  JCamera_ShutterCallbackClass = interface(IJavaClass)
    ['{D658141F-9627-4E2E-8B23-CDF1814F02FB}']
  end;

  [JavaSignature('android/hardware/Camera$ShutterCallback')]
  JCamera_ShutterCallback = interface(IJavaInstance)
    ['{50F23354-86CD-4B59-9CC8-E647BDF98EC2}']
    procedure onShutter; cdecl;
  end;
  TJCamera_ShutterCallback = class(TJavaGenericImport<JCamera_ShutterCallbackClass, JCamera_ShutterCallback>) end;

  JCamera_SizeClass = interface(JObjectClass)
    ['{23FA6E4F-E2F1-4FDF-9892-A56C71EEA6D4}']
    {class} function init(w: Integer; h: Integer): JCamera_Size; cdecl;
  end;

  [JavaSignature('android/hardware/Camera$Size')]
  JCamera_Size = interface(JObject)
    ['{2D2A15A6-C3ED-4B61-8276-214F497A766A}']
    function _Getheight: Integer; cdecl;
    procedure _Setheight(Value: Integer); cdecl;
    function _Getwidth: Integer; cdecl;
    procedure _Setwidth(Value: Integer); cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property height: Integer read _Getheight write _Setheight;
    property width: Integer read _Getwidth write _Setwidth;
  end;
  TJCamera_Size = class(TJavaGenericImport<JCamera_SizeClass, JCamera_Size>) end;

  JHardwareBufferClass = interface(JObjectClass)
    ['{53C34A93-09FC-4A97-91F4-24BFF99A1D98}']
    {class} function _GetBLOB: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDS_24UI8: Integer; cdecl;
    {class} function _GetDS_FP32UI8: Integer; cdecl;
    {class} function _GetD_16: Integer; cdecl;
    {class} function _GetD_24: Integer; cdecl;
    {class} function _GetD_FP32: Integer; cdecl;
    {class} function _GetRGBA_1010102: Integer; cdecl;
    {class} function _GetRGBA_8888: Integer; cdecl;
    {class} function _GetRGBA_FP16: Integer; cdecl;
    {class} function _GetRGBX_8888: Integer; cdecl;
    {class} function _GetRGB_565: Integer; cdecl;
    {class} function _GetRGB_888: Integer; cdecl;
    {class} function _GetS_UI8: Integer; cdecl;
    {class} function _GetUSAGE_COMPOSER_OVERLAY: Int64; cdecl;
    {class} function _GetUSAGE_CPU_READ_OFTEN: Int64; cdecl;
    {class} function _GetUSAGE_CPU_READ_RARELY: Int64; cdecl;
    {class} function _GetUSAGE_CPU_WRITE_OFTEN: Int64; cdecl;
    {class} function _GetUSAGE_CPU_WRITE_RARELY: Int64; cdecl;
    {class} function _GetUSAGE_FRONT_BUFFER: Int64; cdecl;
    {class} function _GetUSAGE_GPU_COLOR_OUTPUT: Int64; cdecl;
    {class} function _GetUSAGE_GPU_CUBE_MAP: Int64; cdecl;
    {class} function _GetUSAGE_GPU_DATA_BUFFER: Int64; cdecl;
    {class} function _GetUSAGE_GPU_MIPMAP_COMPLETE: Int64; cdecl;
    {class} function _GetUSAGE_GPU_SAMPLED_IMAGE: Int64; cdecl;
    {class} function _GetUSAGE_PROTECTED_CONTENT: Int64; cdecl;
    {class} function _GetUSAGE_SENSOR_DIRECT_DATA: Int64; cdecl;
    {class} function _GetUSAGE_VIDEO_ENCODE: Int64; cdecl;
    {class} function _GetYCBCR_420_888: Integer; cdecl;
    {class} function _GetYCBCR_P010: Integer; cdecl;
    {class} function create(width: Integer; height: Integer; format: Integer; layers: Integer; usage: Int64): JHardwareBuffer; cdecl;
    {class} function isSupported(width: Integer; height: Integer; format: Integer; layers: Integer; usage: Int64): Boolean; cdecl;
    {class} property BLOB: Integer read _GetBLOB;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DS_24UI8: Integer read _GetDS_24UI8;
    {class} property DS_FP32UI8: Integer read _GetDS_FP32UI8;
    {class} property D_16: Integer read _GetD_16;
    {class} property D_24: Integer read _GetD_24;
    {class} property D_FP32: Integer read _GetD_FP32;
    {class} property RGBA_1010102: Integer read _GetRGBA_1010102;
    {class} property RGBA_8888: Integer read _GetRGBA_8888;
    {class} property RGBA_FP16: Integer read _GetRGBA_FP16;
    {class} property RGBX_8888: Integer read _GetRGBX_8888;
    {class} property RGB_565: Integer read _GetRGB_565;
    {class} property RGB_888: Integer read _GetRGB_888;
    {class} property S_UI8: Integer read _GetS_UI8;
    {class} property USAGE_COMPOSER_OVERLAY: Int64 read _GetUSAGE_COMPOSER_OVERLAY;
    {class} property USAGE_CPU_READ_OFTEN: Int64 read _GetUSAGE_CPU_READ_OFTEN;
    {class} property USAGE_CPU_READ_RARELY: Int64 read _GetUSAGE_CPU_READ_RARELY;
    {class} property USAGE_CPU_WRITE_OFTEN: Int64 read _GetUSAGE_CPU_WRITE_OFTEN;
    {class} property USAGE_CPU_WRITE_RARELY: Int64 read _GetUSAGE_CPU_WRITE_RARELY;
    {class} property USAGE_FRONT_BUFFER: Int64 read _GetUSAGE_FRONT_BUFFER;
    {class} property USAGE_GPU_COLOR_OUTPUT: Int64 read _GetUSAGE_GPU_COLOR_OUTPUT;
    {class} property USAGE_GPU_CUBE_MAP: Int64 read _GetUSAGE_GPU_CUBE_MAP;
    {class} property USAGE_GPU_DATA_BUFFER: Int64 read _GetUSAGE_GPU_DATA_BUFFER;
    {class} property USAGE_GPU_MIPMAP_COMPLETE: Int64 read _GetUSAGE_GPU_MIPMAP_COMPLETE;
    {class} property USAGE_GPU_SAMPLED_IMAGE: Int64 read _GetUSAGE_GPU_SAMPLED_IMAGE;
    {class} property USAGE_PROTECTED_CONTENT: Int64 read _GetUSAGE_PROTECTED_CONTENT;
    {class} property USAGE_SENSOR_DIRECT_DATA: Int64 read _GetUSAGE_SENSOR_DIRECT_DATA;
    {class} property USAGE_VIDEO_ENCODE: Int64 read _GetUSAGE_VIDEO_ENCODE;
    {class} property YCBCR_420_888: Integer read _GetYCBCR_420_888;
    {class} property YCBCR_P010: Integer read _GetYCBCR_P010;
  end;

  [JavaSignature('android/hardware/HardwareBuffer')]
  JHardwareBuffer = interface(JObject)
    ['{4B7F287C-C562-4B9D-9E1D-A0D82AD2882B}']
    procedure close; cdecl;
    function describeContents: Integer; cdecl;
    function getFormat: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getLayers: Integer; cdecl;
    function getUsage: Int64; cdecl;
    function getWidth: Integer; cdecl;
    function isClosed: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJHardwareBuffer = class(TJavaGenericImport<JHardwareBufferClass, JHardwareBuffer>) end;

  JSensorClass = interface(JObjectClass)
    ['{9025B1D0-DA48-4D2C-9D19-2E1F23FB7B8E}']
    {class} function _GetREPORTING_MODE_CONTINUOUS: Integer; cdecl;
    {class} function _GetREPORTING_MODE_ONE_SHOT: Integer; cdecl;
    {class} function _GetREPORTING_MODE_ON_CHANGE: Integer; cdecl;
    {class} function _GetREPORTING_MODE_SPECIAL_TRIGGER: Integer; cdecl;
    {class} function _GetSTRING_TYPE_ACCELEROMETER: JString; cdecl;
    {class} function _GetSTRING_TYPE_ACCELEROMETER_LIMITED_AXES: JString; cdecl;
    {class} function _GetSTRING_TYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED: JString; cdecl;
    {class} function _GetSTRING_TYPE_ACCELEROMETER_UNCALIBRATED: JString; cdecl;
    {class} function _GetSTRING_TYPE_AMBIENT_TEMPERATURE: JString; cdecl;
    {class} function _GetSTRING_TYPE_GAME_ROTATION_VECTOR: JString; cdecl;
    {class} function _GetSTRING_TYPE_GEOMAGNETIC_ROTATION_VECTOR: JString; cdecl;
    {class} function _GetSTRING_TYPE_GRAVITY: JString; cdecl;
    {class} function _GetSTRING_TYPE_GYROSCOPE: JString; cdecl;
    {class} function _GetSTRING_TYPE_GYROSCOPE_LIMITED_AXES: JString; cdecl;
    {class} function _GetSTRING_TYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED: JString; cdecl;
    {class} function _GetSTRING_TYPE_GYROSCOPE_UNCALIBRATED: JString; cdecl;
    {class} function _GetSTRING_TYPE_HEADING: JString; cdecl;
    {class} function _GetSTRING_TYPE_HEAD_TRACKER: JString; cdecl;
    {class} function _GetSTRING_TYPE_HEART_BEAT: JString; cdecl;
    {class} function _GetSTRING_TYPE_HEART_RATE: JString; cdecl;
    {class} function _GetSTRING_TYPE_HINGE_ANGLE: JString; cdecl;
    {class} function _GetSTRING_TYPE_LIGHT: JString; cdecl;
    {class} function _GetSTRING_TYPE_LINEAR_ACCELERATION: JString; cdecl;
    {class} function _GetSTRING_TYPE_LOW_LATENCY_OFFBODY_DETECT: JString; cdecl;
    {class} function _GetSTRING_TYPE_MAGNETIC_FIELD: JString; cdecl;
    {class} function _GetSTRING_TYPE_MAGNETIC_FIELD_UNCALIBRATED: JString; cdecl;
    {class} function _GetSTRING_TYPE_MOTION_DETECT: JString; cdecl;
    {class} function _GetSTRING_TYPE_ORIENTATION: JString; cdecl;
    {class} function _GetSTRING_TYPE_POSE_6DOF: JString; cdecl;
    {class} function _GetSTRING_TYPE_PRESSURE: JString; cdecl;
    {class} function _GetSTRING_TYPE_PROXIMITY: JString; cdecl;
    {class} function _GetSTRING_TYPE_RELATIVE_HUMIDITY: JString; cdecl;
    {class} function _GetSTRING_TYPE_ROTATION_VECTOR: JString; cdecl;
    {class} function _GetSTRING_TYPE_SIGNIFICANT_MOTION: JString; cdecl;
    {class} function _GetSTRING_TYPE_STATIONARY_DETECT: JString; cdecl;
    {class} function _GetSTRING_TYPE_STEP_COUNTER: JString; cdecl;
    {class} function _GetSTRING_TYPE_STEP_DETECTOR: JString; cdecl;
    {class} function _GetSTRING_TYPE_TEMPERATURE: JString; cdecl;
    {class} function _GetTYPE_ACCELEROMETER: Integer; cdecl;
    {class} function _GetTYPE_ACCELEROMETER_LIMITED_AXES: Integer; cdecl;
    {class} function _GetTYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED: Integer; cdecl;
    {class} function _GetTYPE_ACCELEROMETER_UNCALIBRATED: Integer; cdecl;
    {class} function _GetTYPE_ALL: Integer; cdecl;
    {class} function _GetTYPE_AMBIENT_TEMPERATURE: Integer; cdecl;
    {class} function _GetTYPE_DEVICE_PRIVATE_BASE: Integer; cdecl;
    {class} function _GetTYPE_GAME_ROTATION_VECTOR: Integer; cdecl;
    {class} function _GetTYPE_GEOMAGNETIC_ROTATION_VECTOR: Integer; cdecl;
    {class} function _GetTYPE_GRAVITY: Integer; cdecl;
    {class} function _GetTYPE_GYROSCOPE: Integer; cdecl;
    {class} function _GetTYPE_GYROSCOPE_LIMITED_AXES: Integer; cdecl;
    {class} function _GetTYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED: Integer; cdecl;
    {class} function _GetTYPE_GYROSCOPE_UNCALIBRATED: Integer; cdecl;
    {class} function _GetTYPE_HEADING: Integer; cdecl;
    {class} function _GetTYPE_HEAD_TRACKER: Integer; cdecl;
    {class} function _GetTYPE_HEART_BEAT: Integer; cdecl;
    {class} function _GetTYPE_HEART_RATE: Integer; cdecl;
    {class} function _GetTYPE_HINGE_ANGLE: Integer; cdecl;
    {class} function _GetTYPE_LIGHT: Integer; cdecl;
    {class} function _GetTYPE_LINEAR_ACCELERATION: Integer; cdecl;
    {class} function _GetTYPE_LOW_LATENCY_OFFBODY_DETECT: Integer; cdecl;
    {class} function _GetTYPE_MAGNETIC_FIELD: Integer; cdecl;
    {class} function _GetTYPE_MAGNETIC_FIELD_UNCALIBRATED: Integer; cdecl;
    {class} function _GetTYPE_MOTION_DETECT: Integer; cdecl;
    {class} function _GetTYPE_ORIENTATION: Integer; cdecl;
    {class} function _GetTYPE_POSE_6DOF: Integer; cdecl;
    {class} function _GetTYPE_PRESSURE: Integer; cdecl;
    {class} function _GetTYPE_PROXIMITY: Integer; cdecl;
    {class} function _GetTYPE_RELATIVE_HUMIDITY: Integer; cdecl;
    {class} function _GetTYPE_ROTATION_VECTOR: Integer; cdecl;
    {class} function _GetTYPE_SIGNIFICANT_MOTION: Integer; cdecl;
    {class} function _GetTYPE_STATIONARY_DETECT: Integer; cdecl;
    {class} function _GetTYPE_STEP_COUNTER: Integer; cdecl;
    {class} function _GetTYPE_STEP_DETECTOR: Integer; cdecl;
    {class} function _GetTYPE_TEMPERATURE: Integer; cdecl;
    {class} property REPORTING_MODE_CONTINUOUS: Integer read _GetREPORTING_MODE_CONTINUOUS;
    {class} property REPORTING_MODE_ONE_SHOT: Integer read _GetREPORTING_MODE_ONE_SHOT;
    {class} property REPORTING_MODE_ON_CHANGE: Integer read _GetREPORTING_MODE_ON_CHANGE;
    {class} property REPORTING_MODE_SPECIAL_TRIGGER: Integer read _GetREPORTING_MODE_SPECIAL_TRIGGER;
    {class} property STRING_TYPE_ACCELEROMETER: JString read _GetSTRING_TYPE_ACCELEROMETER;
    {class} property STRING_TYPE_ACCELEROMETER_LIMITED_AXES: JString read _GetSTRING_TYPE_ACCELEROMETER_LIMITED_AXES;
    {class} property STRING_TYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED: JString read _GetSTRING_TYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED;
    {class} property STRING_TYPE_ACCELEROMETER_UNCALIBRATED: JString read _GetSTRING_TYPE_ACCELEROMETER_UNCALIBRATED;
    {class} property STRING_TYPE_AMBIENT_TEMPERATURE: JString read _GetSTRING_TYPE_AMBIENT_TEMPERATURE;
    {class} property STRING_TYPE_GAME_ROTATION_VECTOR: JString read _GetSTRING_TYPE_GAME_ROTATION_VECTOR;
    {class} property STRING_TYPE_GEOMAGNETIC_ROTATION_VECTOR: JString read _GetSTRING_TYPE_GEOMAGNETIC_ROTATION_VECTOR;
    {class} property STRING_TYPE_GRAVITY: JString read _GetSTRING_TYPE_GRAVITY;
    {class} property STRING_TYPE_GYROSCOPE: JString read _GetSTRING_TYPE_GYROSCOPE;
    {class} property STRING_TYPE_GYROSCOPE_LIMITED_AXES: JString read _GetSTRING_TYPE_GYROSCOPE_LIMITED_AXES;
    {class} property STRING_TYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED: JString read _GetSTRING_TYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED;
    {class} property STRING_TYPE_GYROSCOPE_UNCALIBRATED: JString read _GetSTRING_TYPE_GYROSCOPE_UNCALIBRATED;
    {class} property STRING_TYPE_HEADING: JString read _GetSTRING_TYPE_HEADING;
    {class} property STRING_TYPE_HEAD_TRACKER: JString read _GetSTRING_TYPE_HEAD_TRACKER;
    {class} property STRING_TYPE_HEART_BEAT: JString read _GetSTRING_TYPE_HEART_BEAT;
    {class} property STRING_TYPE_HEART_RATE: JString read _GetSTRING_TYPE_HEART_RATE;
    {class} property STRING_TYPE_HINGE_ANGLE: JString read _GetSTRING_TYPE_HINGE_ANGLE;
    {class} property STRING_TYPE_LIGHT: JString read _GetSTRING_TYPE_LIGHT;
    {class} property STRING_TYPE_LINEAR_ACCELERATION: JString read _GetSTRING_TYPE_LINEAR_ACCELERATION;
    {class} property STRING_TYPE_LOW_LATENCY_OFFBODY_DETECT: JString read _GetSTRING_TYPE_LOW_LATENCY_OFFBODY_DETECT;
    {class} property STRING_TYPE_MAGNETIC_FIELD: JString read _GetSTRING_TYPE_MAGNETIC_FIELD;
    {class} property STRING_TYPE_MAGNETIC_FIELD_UNCALIBRATED: JString read _GetSTRING_TYPE_MAGNETIC_FIELD_UNCALIBRATED;
    {class} property STRING_TYPE_MOTION_DETECT: JString read _GetSTRING_TYPE_MOTION_DETECT;
    {class} property STRING_TYPE_ORIENTATION: JString read _GetSTRING_TYPE_ORIENTATION;
    {class} property STRING_TYPE_POSE_6DOF: JString read _GetSTRING_TYPE_POSE_6DOF;
    {class} property STRING_TYPE_PRESSURE: JString read _GetSTRING_TYPE_PRESSURE;
    {class} property STRING_TYPE_PROXIMITY: JString read _GetSTRING_TYPE_PROXIMITY;
    {class} property STRING_TYPE_RELATIVE_HUMIDITY: JString read _GetSTRING_TYPE_RELATIVE_HUMIDITY;
    {class} property STRING_TYPE_ROTATION_VECTOR: JString read _GetSTRING_TYPE_ROTATION_VECTOR;
    {class} property STRING_TYPE_SIGNIFICANT_MOTION: JString read _GetSTRING_TYPE_SIGNIFICANT_MOTION;
    {class} property STRING_TYPE_STATIONARY_DETECT: JString read _GetSTRING_TYPE_STATIONARY_DETECT;
    {class} property STRING_TYPE_STEP_COUNTER: JString read _GetSTRING_TYPE_STEP_COUNTER;
    {class} property STRING_TYPE_STEP_DETECTOR: JString read _GetSTRING_TYPE_STEP_DETECTOR;
    {class} property STRING_TYPE_TEMPERATURE: JString read _GetSTRING_TYPE_TEMPERATURE;
    {class} property TYPE_ACCELEROMETER: Integer read _GetTYPE_ACCELEROMETER;
    {class} property TYPE_ACCELEROMETER_LIMITED_AXES: Integer read _GetTYPE_ACCELEROMETER_LIMITED_AXES;
    {class} property TYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED: Integer read _GetTYPE_ACCELEROMETER_LIMITED_AXES_UNCALIBRATED;
    {class} property TYPE_ACCELEROMETER_UNCALIBRATED: Integer read _GetTYPE_ACCELEROMETER_UNCALIBRATED;
    {class} property TYPE_ALL: Integer read _GetTYPE_ALL;
    {class} property TYPE_AMBIENT_TEMPERATURE: Integer read _GetTYPE_AMBIENT_TEMPERATURE;
    {class} property TYPE_DEVICE_PRIVATE_BASE: Integer read _GetTYPE_DEVICE_PRIVATE_BASE;
    {class} property TYPE_GAME_ROTATION_VECTOR: Integer read _GetTYPE_GAME_ROTATION_VECTOR;
    {class} property TYPE_GEOMAGNETIC_ROTATION_VECTOR: Integer read _GetTYPE_GEOMAGNETIC_ROTATION_VECTOR;
    {class} property TYPE_GRAVITY: Integer read _GetTYPE_GRAVITY;
    {class} property TYPE_GYROSCOPE: Integer read _GetTYPE_GYROSCOPE;
    {class} property TYPE_GYROSCOPE_LIMITED_AXES: Integer read _GetTYPE_GYROSCOPE_LIMITED_AXES;
    {class} property TYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED: Integer read _GetTYPE_GYROSCOPE_LIMITED_AXES_UNCALIBRATED;
    {class} property TYPE_GYROSCOPE_UNCALIBRATED: Integer read _GetTYPE_GYROSCOPE_UNCALIBRATED;
    {class} property TYPE_HEADING: Integer read _GetTYPE_HEADING;
    {class} property TYPE_HEAD_TRACKER: Integer read _GetTYPE_HEAD_TRACKER;
    {class} property TYPE_HEART_BEAT: Integer read _GetTYPE_HEART_BEAT;
    {class} property TYPE_HEART_RATE: Integer read _GetTYPE_HEART_RATE;
    {class} property TYPE_HINGE_ANGLE: Integer read _GetTYPE_HINGE_ANGLE;
    {class} property TYPE_LIGHT: Integer read _GetTYPE_LIGHT;
    {class} property TYPE_LINEAR_ACCELERATION: Integer read _GetTYPE_LINEAR_ACCELERATION;
    {class} property TYPE_LOW_LATENCY_OFFBODY_DETECT: Integer read _GetTYPE_LOW_LATENCY_OFFBODY_DETECT;
    {class} property TYPE_MAGNETIC_FIELD: Integer read _GetTYPE_MAGNETIC_FIELD;
    {class} property TYPE_MAGNETIC_FIELD_UNCALIBRATED: Integer read _GetTYPE_MAGNETIC_FIELD_UNCALIBRATED;
    {class} property TYPE_MOTION_DETECT: Integer read _GetTYPE_MOTION_DETECT;
    {class} property TYPE_ORIENTATION: Integer read _GetTYPE_ORIENTATION;
    {class} property TYPE_POSE_6DOF: Integer read _GetTYPE_POSE_6DOF;
    {class} property TYPE_PRESSURE: Integer read _GetTYPE_PRESSURE;
    {class} property TYPE_PROXIMITY: Integer read _GetTYPE_PROXIMITY;
    {class} property TYPE_RELATIVE_HUMIDITY: Integer read _GetTYPE_RELATIVE_HUMIDITY;
    {class} property TYPE_ROTATION_VECTOR: Integer read _GetTYPE_ROTATION_VECTOR;
    {class} property TYPE_SIGNIFICANT_MOTION: Integer read _GetTYPE_SIGNIFICANT_MOTION;
    {class} property TYPE_STATIONARY_DETECT: Integer read _GetTYPE_STATIONARY_DETECT;
    {class} property TYPE_STEP_COUNTER: Integer read _GetTYPE_STEP_COUNTER;
    {class} property TYPE_STEP_DETECTOR: Integer read _GetTYPE_STEP_DETECTOR;
    {class} property TYPE_TEMPERATURE: Integer read _GetTYPE_TEMPERATURE;
  end;

  [JavaSignature('android/hardware/Sensor')]
  JSensor = interface(JObject)
    ['{6A4E470B-F097-434E-B27D-6C771C44F318}']
    function getFifoMaxEventCount: Integer; cdecl;
    function getFifoReservedEventCount: Integer; cdecl;
    function getHighestDirectReportRateLevel: Integer; cdecl;
    function getId: Integer; cdecl;
    function getMaxDelay: Integer; cdecl;
    function getMaximumRange: Single; cdecl;
    function getMinDelay: Integer; cdecl;
    function getName: JString; cdecl;
    function getPower: Single; cdecl;
    function getReportingMode: Integer; cdecl;
    function getResolution: Single; cdecl;
    function getStringType: JString; cdecl;
    function getType: Integer; cdecl;
    function getVendor: JString; cdecl;
    function getVersion: Integer; cdecl;
    function isAdditionalInfoSupported: Boolean; cdecl;
    function isDirectChannelTypeSupported(sharedMemType: Integer): Boolean; cdecl;
    function isDynamicSensor: Boolean; cdecl;
    function isWakeUpSensor: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJSensor = class(TJavaGenericImport<JSensorClass, JSensor>) end;

  JSensorDirectChannelClass = interface(JObjectClass)
    ['{15303AE9-1BFD-4EEE-9E14-EF4195167445}']
    {class} function _GetRATE_FAST: Integer; cdecl;
    {class} function _GetRATE_NORMAL: Integer; cdecl;
    {class} function _GetRATE_STOP: Integer; cdecl;
    {class} function _GetRATE_VERY_FAST: Integer; cdecl;
    {class} function _GetTYPE_HARDWARE_BUFFER: Integer; cdecl;
    {class} function _GetTYPE_MEMORY_FILE: Integer; cdecl;
    {class} property RATE_FAST: Integer read _GetRATE_FAST;
    {class} property RATE_NORMAL: Integer read _GetRATE_NORMAL;
    {class} property RATE_STOP: Integer read _GetRATE_STOP;
    {class} property RATE_VERY_FAST: Integer read _GetRATE_VERY_FAST;
    {class} property TYPE_HARDWARE_BUFFER: Integer read _GetTYPE_HARDWARE_BUFFER;
    {class} property TYPE_MEMORY_FILE: Integer read _GetTYPE_MEMORY_FILE;
  end;

  [JavaSignature('android/hardware/SensorDirectChannel')]
  JSensorDirectChannel = interface(JObject)
    ['{7DEA8D1C-67FA-428C-A824-9414BF23E296}']
    procedure close; cdecl;
    function configure(sensor: JSensor; rateLevel: Integer): Integer; cdecl;
    function isOpen: Boolean; cdecl;
    function isValid: Boolean; cdecl;//Deprecated
  end;
  TJSensorDirectChannel = class(TJavaGenericImport<JSensorDirectChannelClass, JSensorDirectChannel>) end;

  JSensorEventClass = interface(JObjectClass)
    ['{F24352F6-3196-48D5-8512-A337867AB54C}']
  end;

  [JavaSignature('android/hardware/SensorEvent')]
  JSensorEvent = interface(JObject)
    ['{583C4821-4D8A-407E-8797-BA1D2853CC36}']
    function _Getaccuracy: Integer; cdecl;
    procedure _Setaccuracy(Value: Integer); cdecl;
    function _GetfirstEventAfterDiscontinuity: Boolean; cdecl;
    procedure _SetfirstEventAfterDiscontinuity(Value: Boolean); cdecl;
    function _Getsensor: JSensor; cdecl;
    procedure _Setsensor(Value: JSensor); cdecl;
    function _Gettimestamp: Int64; cdecl;
    procedure _Settimestamp(Value: Int64); cdecl;
    function _Getvalues: TJavaArray<Single>; cdecl;
    property accuracy: Integer read _Getaccuracy write _Setaccuracy;
    property firstEventAfterDiscontinuity: Boolean read _GetfirstEventAfterDiscontinuity write _SetfirstEventAfterDiscontinuity;
    property sensor: JSensor read _Getsensor write _Setsensor;
    property timestamp: Int64 read _Gettimestamp write _Settimestamp;
    property values: TJavaArray<Single> read _Getvalues;
  end;
  TJSensorEvent = class(TJavaGenericImport<JSensorEventClass, JSensorEvent>) end;

  JSensorEventListenerClass = interface(IJavaClass)
    ['{6943522B-147C-4C46-895F-562843FA365D}']
  end;

  [JavaSignature('android/hardware/SensorEventListener')]
  JSensorEventListener = interface(IJavaInstance)
    ['{EFEC7A15-54EC-416D-938E-B225C7A24F9A}']
    procedure onAccuracyChanged(sensor: JSensor; accuracy: Integer); cdecl;
    procedure onSensorChanged(event: JSensorEvent); cdecl;
  end;
  TJSensorEventListener = class(TJavaGenericImport<JSensorEventListenerClass, JSensorEventListener>) end;

  JSensorListenerClass = interface(IJavaClass)
    ['{50DAACBA-22C2-4D0B-8221-70F4E322D45B}']
  end;

  [JavaSignature('android/hardware/SensorListener')]
  JSensorListener = interface(IJavaInstance)
    ['{B456AFE9-D0C1-41EC-BD0C-50DBB07CA41E}']
    procedure onAccuracyChanged(sensor: Integer; accuracy: Integer); cdecl;
    procedure onSensorChanged(sensor: Integer; values: TJavaArray<Single>); cdecl;
  end;
  TJSensorListener = class(TJavaGenericImport<JSensorListenerClass, JSensorListener>) end;

  JSensorManagerClass = interface(JObjectClass)
    ['{D74F76E9-975D-4B6C-84EA-24C8F16CA81E}']
    {class} function _GetAXIS_MINUS_X: Integer; cdecl;
    {class} function _GetAXIS_MINUS_Y: Integer; cdecl;
    {class} function _GetAXIS_MINUS_Z: Integer; cdecl;
    {class} function _GetAXIS_X: Integer; cdecl;
    {class} function _GetAXIS_Y: Integer; cdecl;
    {class} function _GetAXIS_Z: Integer; cdecl;
    {class} function _GetDATA_X: Integer; cdecl;
    {class} function _GetDATA_Y: Integer; cdecl;
    {class} function _GetDATA_Z: Integer; cdecl;
    {class} function _GetGRAVITY_DEATH_STAR_I: Single; cdecl;
    {class} function _GetGRAVITY_EARTH: Single; cdecl;
    {class} function _GetGRAVITY_JUPITER: Single; cdecl;
    {class} function _GetGRAVITY_MARS: Single; cdecl;
    {class} function _GetGRAVITY_MERCURY: Single; cdecl;
    {class} function _GetGRAVITY_MOON: Single; cdecl;
    {class} function _GetGRAVITY_NEPTUNE: Single; cdecl;
    {class} function _GetGRAVITY_PLUTO: Single; cdecl;
    {class} function _GetGRAVITY_SATURN: Single; cdecl;
    {class} function _GetGRAVITY_SUN: Single; cdecl;
    {class} function _GetGRAVITY_THE_ISLAND: Single; cdecl;
    {class} function _GetGRAVITY_URANUS: Single; cdecl;
    {class} function _GetGRAVITY_VENUS: Single; cdecl;
    {class} function _GetLIGHT_CLOUDY: Single; cdecl;
    {class} function _GetLIGHT_FULLMOON: Single; cdecl;
    {class} function _GetLIGHT_NO_MOON: Single; cdecl;
    {class} function _GetLIGHT_OVERCAST: Single; cdecl;
    {class} function _GetLIGHT_SHADE: Single; cdecl;
    {class} function _GetLIGHT_SUNLIGHT: Single; cdecl;
    {class} function _GetLIGHT_SUNLIGHT_MAX: Single; cdecl;
    {class} function _GetLIGHT_SUNRISE: Single; cdecl;
    {class} function _GetMAGNETIC_FIELD_EARTH_MAX: Single; cdecl;
    {class} function _GetMAGNETIC_FIELD_EARTH_MIN: Single; cdecl;
    {class} function _GetPRESSURE_STANDARD_ATMOSPHERE: Single; cdecl;
    {class} function _GetRAW_DATA_INDEX: Integer; cdecl;
    {class} function _GetRAW_DATA_X: Integer; cdecl;
    {class} function _GetRAW_DATA_Y: Integer; cdecl;
    {class} function _GetRAW_DATA_Z: Integer; cdecl;
    {class} function _GetSENSOR_ACCELEROMETER: Integer; cdecl;
    {class} function _GetSENSOR_ALL: Integer; cdecl;
    {class} function _GetSENSOR_DELAY_FASTEST: Integer; cdecl;
    {class} function _GetSENSOR_DELAY_GAME: Integer; cdecl;
    {class} function _GetSENSOR_DELAY_NORMAL: Integer; cdecl;
    {class} function _GetSENSOR_DELAY_UI: Integer; cdecl;
    {class} function _GetSENSOR_LIGHT: Integer; cdecl;
    {class} function _GetSENSOR_MAGNETIC_FIELD: Integer; cdecl;
    {class} function _GetSENSOR_MAX: Integer; cdecl;
    {class} function _GetSENSOR_MIN: Integer; cdecl;
    {class} function _GetSENSOR_ORIENTATION: Integer; cdecl;
    {class} function _GetSENSOR_ORIENTATION_RAW: Integer; cdecl;
    {class} function _GetSENSOR_PROXIMITY: Integer; cdecl;
    {class} function _GetSENSOR_STATUS_ACCURACY_HIGH: Integer; cdecl;
    {class} function _GetSENSOR_STATUS_ACCURACY_LOW: Integer; cdecl;
    {class} function _GetSENSOR_STATUS_ACCURACY_MEDIUM: Integer; cdecl;
    {class} function _GetSENSOR_STATUS_NO_CONTACT: Integer; cdecl;
    {class} function _GetSENSOR_STATUS_UNRELIABLE: Integer; cdecl;
    {class} function _GetSENSOR_TEMPERATURE: Integer; cdecl;
    {class} function _GetSENSOR_TRICORDER: Integer; cdecl;
    {class} function _GetSTANDARD_GRAVITY: Single; cdecl;
    {class} function getAltitude(p0: Single; p: Single): Single; cdecl;
    {class} procedure getAngleChange(angleChange: TJavaArray<Single>; R: TJavaArray<Single>; prevR: TJavaArray<Single>); cdecl;
    {class} function getInclination(I: TJavaArray<Single>): Single; cdecl;
    {class} function getOrientation(R: TJavaArray<Single>; values: TJavaArray<Single>): TJavaArray<Single>; cdecl;
    {class} procedure getQuaternionFromVector(Q: TJavaArray<Single>; rv: TJavaArray<Single>); cdecl;
    {class} function getRotationMatrix(R: TJavaArray<Single>; I: TJavaArray<Single>; gravity: TJavaArray<Single>; geomagnetic: TJavaArray<Single>): Boolean; cdecl;
    {class} procedure getRotationMatrixFromVector(R: TJavaArray<Single>; rotationVector: TJavaArray<Single>); cdecl;
    {class} function remapCoordinateSystem(inR: TJavaArray<Single>; X: Integer; Y: Integer; outR: TJavaArray<Single>): Boolean; cdecl;
    {class} property AXIS_MINUS_X: Integer read _GetAXIS_MINUS_X;
    {class} property AXIS_MINUS_Y: Integer read _GetAXIS_MINUS_Y;
    {class} property AXIS_MINUS_Z: Integer read _GetAXIS_MINUS_Z;
    {class} property AXIS_X: Integer read _GetAXIS_X;
    {class} property AXIS_Y: Integer read _GetAXIS_Y;
    {class} property AXIS_Z: Integer read _GetAXIS_Z;
    {class} property DATA_X: Integer read _GetDATA_X;
    {class} property DATA_Y: Integer read _GetDATA_Y;
    {class} property DATA_Z: Integer read _GetDATA_Z;
    {class} property GRAVITY_DEATH_STAR_I: Single read _GetGRAVITY_DEATH_STAR_I;
    {class} property GRAVITY_EARTH: Single read _GetGRAVITY_EARTH;
    {class} property GRAVITY_JUPITER: Single read _GetGRAVITY_JUPITER;
    {class} property GRAVITY_MARS: Single read _GetGRAVITY_MARS;
    {class} property GRAVITY_MERCURY: Single read _GetGRAVITY_MERCURY;
    {class} property GRAVITY_MOON: Single read _GetGRAVITY_MOON;
    {class} property GRAVITY_NEPTUNE: Single read _GetGRAVITY_NEPTUNE;
    {class} property GRAVITY_PLUTO: Single read _GetGRAVITY_PLUTO;
    {class} property GRAVITY_SATURN: Single read _GetGRAVITY_SATURN;
    {class} property GRAVITY_SUN: Single read _GetGRAVITY_SUN;
    {class} property GRAVITY_THE_ISLAND: Single read _GetGRAVITY_THE_ISLAND;
    {class} property GRAVITY_URANUS: Single read _GetGRAVITY_URANUS;
    {class} property GRAVITY_VENUS: Single read _GetGRAVITY_VENUS;
    {class} property LIGHT_CLOUDY: Single read _GetLIGHT_CLOUDY;
    {class} property LIGHT_FULLMOON: Single read _GetLIGHT_FULLMOON;
    {class} property LIGHT_NO_MOON: Single read _GetLIGHT_NO_MOON;
    {class} property LIGHT_OVERCAST: Single read _GetLIGHT_OVERCAST;
    {class} property LIGHT_SHADE: Single read _GetLIGHT_SHADE;
    {class} property LIGHT_SUNLIGHT: Single read _GetLIGHT_SUNLIGHT;
    {class} property LIGHT_SUNLIGHT_MAX: Single read _GetLIGHT_SUNLIGHT_MAX;
    {class} property LIGHT_SUNRISE: Single read _GetLIGHT_SUNRISE;
    {class} property MAGNETIC_FIELD_EARTH_MAX: Single read _GetMAGNETIC_FIELD_EARTH_MAX;
    {class} property MAGNETIC_FIELD_EARTH_MIN: Single read _GetMAGNETIC_FIELD_EARTH_MIN;
    {class} property PRESSURE_STANDARD_ATMOSPHERE: Single read _GetPRESSURE_STANDARD_ATMOSPHERE;
    {class} property RAW_DATA_INDEX: Integer read _GetRAW_DATA_INDEX;
    {class} property RAW_DATA_X: Integer read _GetRAW_DATA_X;
    {class} property RAW_DATA_Y: Integer read _GetRAW_DATA_Y;
    {class} property RAW_DATA_Z: Integer read _GetRAW_DATA_Z;
    {class} property SENSOR_ACCELEROMETER: Integer read _GetSENSOR_ACCELEROMETER;
    {class} property SENSOR_ALL: Integer read _GetSENSOR_ALL;
    {class} property SENSOR_DELAY_FASTEST: Integer read _GetSENSOR_DELAY_FASTEST;
    {class} property SENSOR_DELAY_GAME: Integer read _GetSENSOR_DELAY_GAME;
    {class} property SENSOR_DELAY_NORMAL: Integer read _GetSENSOR_DELAY_NORMAL;
    {class} property SENSOR_DELAY_UI: Integer read _GetSENSOR_DELAY_UI;
    {class} property SENSOR_LIGHT: Integer read _GetSENSOR_LIGHT;
    {class} property SENSOR_MAGNETIC_FIELD: Integer read _GetSENSOR_MAGNETIC_FIELD;
    {class} property SENSOR_MAX: Integer read _GetSENSOR_MAX;
    {class} property SENSOR_MIN: Integer read _GetSENSOR_MIN;
    {class} property SENSOR_ORIENTATION: Integer read _GetSENSOR_ORIENTATION;
    {class} property SENSOR_ORIENTATION_RAW: Integer read _GetSENSOR_ORIENTATION_RAW;
    {class} property SENSOR_PROXIMITY: Integer read _GetSENSOR_PROXIMITY;
    {class} property SENSOR_STATUS_ACCURACY_HIGH: Integer read _GetSENSOR_STATUS_ACCURACY_HIGH;
    {class} property SENSOR_STATUS_ACCURACY_LOW: Integer read _GetSENSOR_STATUS_ACCURACY_LOW;
    {class} property SENSOR_STATUS_ACCURACY_MEDIUM: Integer read _GetSENSOR_STATUS_ACCURACY_MEDIUM;
    {class} property SENSOR_STATUS_NO_CONTACT: Integer read _GetSENSOR_STATUS_NO_CONTACT;
    {class} property SENSOR_STATUS_UNRELIABLE: Integer read _GetSENSOR_STATUS_UNRELIABLE;
    {class} property SENSOR_TEMPERATURE: Integer read _GetSENSOR_TEMPERATURE;
    {class} property SENSOR_TRICORDER: Integer read _GetSENSOR_TRICORDER;
    {class} property STANDARD_GRAVITY: Single read _GetSTANDARD_GRAVITY;
  end;

  [JavaSignature('android/hardware/SensorManager')]
  JSensorManager = interface(JObject)
    ['{BDC77D59-3B37-44EC-9386-F75117670E80}']
    function cancelTriggerSensor(listener: JTriggerEventListener; sensor: JSensor): Boolean; cdecl;
    function createDirectChannel(mem: JMemoryFile): JSensorDirectChannel; cdecl; overload;
    function createDirectChannel(mem: JHardwareBuffer): JSensorDirectChannel; cdecl; overload;
    function flush(listener: JSensorEventListener): Boolean; cdecl;
    function getDefaultSensor(type_: Integer): JSensor; cdecl; overload;
    function getDefaultSensor(type_: Integer; wakeUp: Boolean): JSensor; cdecl; overload;
    function getDynamicSensorList(type_: Integer): JList; cdecl;
    function getSensorList(type_: Integer): JList; cdecl;
    function getSensors: Integer; cdecl;//Deprecated
    function isDynamicSensorDiscoverySupported: Boolean; cdecl;
    procedure registerDynamicSensorCallback(callback: JSensorManager_DynamicSensorCallback); cdecl; overload;
    procedure registerDynamicSensorCallback(callback: JSensorManager_DynamicSensorCallback; handler: JHandler); cdecl; overload;
    function registerListener(listener: JSensorListener; sensors: Integer): Boolean; cdecl; overload;//Deprecated
    function registerListener(listener: JSensorListener; sensors: Integer; rate: Integer): Boolean; cdecl; overload;//Deprecated
    function registerListener(listener: JSensorEventListener; sensor: JSensor; samplingPeriodUs: Integer): Boolean; cdecl; overload;
    function registerListener(listener: JSensorEventListener; sensor: JSensor; samplingPeriodUs: Integer; maxReportLatencyUs: Integer): Boolean; cdecl; overload;
    function registerListener(listener: JSensorEventListener; sensor: JSensor; samplingPeriodUs: Integer; handler: JHandler): Boolean; cdecl; overload;
    function registerListener(listener: JSensorEventListener; sensor: JSensor; samplingPeriodUs: Integer; maxReportLatencyUs: Integer; handler: JHandler): Boolean; cdecl; overload;
    function requestTriggerSensor(listener: JTriggerEventListener; sensor: JSensor): Boolean; cdecl;
    procedure unregisterDynamicSensorCallback(callback: JSensorManager_DynamicSensorCallback); cdecl;
    procedure unregisterListener(listener: JSensorListener); cdecl; overload;//Deprecated
    procedure unregisterListener(listener: JSensorListener; sensors: Integer); cdecl; overload;//Deprecated
    procedure unregisterListener(listener: JSensorEventListener; sensor: JSensor); cdecl; overload;
    procedure unregisterListener(listener: JSensorEventListener); cdecl; overload;
  end;
  TJSensorManager = class(TJavaGenericImport<JSensorManagerClass, JSensorManager>) end;

  JSensorManager_DynamicSensorCallbackClass = interface(JObjectClass)
    ['{3D82C356-8204-43CA-A65B-9A5E37A1B8F9}']
    {class} function init: JSensorManager_DynamicSensorCallback; cdecl;
  end;

  [JavaSignature('android/hardware/SensorManager$DynamicSensorCallback')]
  JSensorManager_DynamicSensorCallback = interface(JObject)
    ['{1269F59A-61F4-4754-9E0B-C83F6EAF6135}']
    procedure onDynamicSensorConnected(sensor: JSensor); cdecl;
    procedure onDynamicSensorDisconnected(sensor: JSensor); cdecl;
  end;
  TJSensorManager_DynamicSensorCallback = class(TJavaGenericImport<JSensorManager_DynamicSensorCallbackClass, JSensorManager_DynamicSensorCallback>) end;

  JSyncFenceClass = interface(JObjectClass)
    ['{C575D87F-3AD5-4E55-B29E-2F7D38E00D51}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSIGNAL_TIME_INVALID: Int64; cdecl;
    {class} function _GetSIGNAL_TIME_PENDING: Int64; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SIGNAL_TIME_INVALID: Int64 read _GetSIGNAL_TIME_INVALID;
    {class} property SIGNAL_TIME_PENDING: Int64 read _GetSIGNAL_TIME_PENDING;
  end;

  [JavaSignature('android/hardware/SyncFence')]
  JSyncFence = interface(JObject)
    ['{ACD6C75C-EF97-440A-A3DB-766E29F15A6C}']
    function await(timeout: Jtime_Duration): Boolean; cdecl;
    function awaitForever: Boolean; cdecl;
    procedure close; cdecl;
    function describeContents: Integer; cdecl;
    function getSignalTime: Int64; cdecl;
    function isValid: Boolean; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJSyncFence = class(TJavaGenericImport<JSyncFenceClass, JSyncFence>) end;

  JTriggerEventClass = interface(JObjectClass)
    ['{F78AF156-EFBE-4746-879C-D6CC66EF2331}']
  end;

  [JavaSignature('android/hardware/TriggerEvent')]
  JTriggerEvent = interface(JObject)
    ['{E7D0476D-E806-4F94-B91B-C686E54AF563}']
    function _Getsensor: JSensor; cdecl;
    procedure _Setsensor(Value: JSensor); cdecl;
    function _Gettimestamp: Int64; cdecl;
    procedure _Settimestamp(Value: Int64); cdecl;
    function _Getvalues: TJavaArray<Single>; cdecl;
    property sensor: JSensor read _Getsensor write _Setsensor;
    property timestamp: Int64 read _Gettimestamp write _Settimestamp;
    property values: TJavaArray<Single> read _Getvalues;
  end;
  TJTriggerEvent = class(TJavaGenericImport<JTriggerEventClass, JTriggerEvent>) end;

  JTriggerEventListenerClass = interface(JObjectClass)
    ['{AD91A8F2-F9F5-4B53-991C-C82B2CC5D103}']
    {class} function init: JTriggerEventListener; cdecl;
  end;

  [JavaSignature('android/hardware/TriggerEventListener')]
  JTriggerEventListener = interface(JObject)
    ['{6D2A9C5C-7EDC-4B5D-84AC-E866F466A281}']
    procedure onTrigger(event: JTriggerEvent); cdecl;
  end;
  TJTriggerEventListener = class(TJavaGenericImport<JTriggerEventListenerClass, JTriggerEventListener>) end;

  JBiometricManagerClass = interface(JObjectClass)
    ['{268DA375-F253-4880-857A-27FB25C0EFB4}']
    {class} function _GetBIOMETRIC_ERROR_HW_UNAVAILABLE: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_NONE_ENROLLED: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_NO_HARDWARE: Integer; cdecl;
    {class} function _GetBIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED: Integer; cdecl;
    {class} function _GetBIOMETRIC_SUCCESS: Integer; cdecl;
    {class} property BIOMETRIC_ERROR_HW_UNAVAILABLE: Integer read _GetBIOMETRIC_ERROR_HW_UNAVAILABLE;
    {class} property BIOMETRIC_ERROR_NONE_ENROLLED: Integer read _GetBIOMETRIC_ERROR_NONE_ENROLLED;
    {class} property BIOMETRIC_ERROR_NO_HARDWARE: Integer read _GetBIOMETRIC_ERROR_NO_HARDWARE;
    {class} property BIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED: Integer read _GetBIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED;
    {class} property BIOMETRIC_SUCCESS: Integer read _GetBIOMETRIC_SUCCESS;
  end;

  [JavaSignature('android/hardware/biometrics/BiometricManager')]
  JBiometricManager = interface(JObject)
    ['{D69C911C-F478-4FF8-BCAC-057BBB89EB72}']
    function canAuthenticate: Integer; cdecl; overload;//Deprecated
    function canAuthenticate(authenticators: Integer): Integer; cdecl; overload;
    function getStrings(authenticators: Integer): JBiometricManager_Strings; cdecl;
  end;
  TJBiometricManager = class(TJavaGenericImport<JBiometricManagerClass, JBiometricManager>) end;

  JBiometricManager_StringsClass = interface(JObjectClass)
    ['{9DE7687C-85AB-4BE5-BB0B-486F95849DB4}']
  end;

  [JavaSignature('android/hardware/biometrics/BiometricManager$Strings')]
  JBiometricManager_Strings = interface(JObject)
    ['{BDAAD20C-F907-4088-9380-17B0E27A9B87}']
    function getButtonLabel: JCharSequence; cdecl;
    function getPromptMessage: JCharSequence; cdecl;
    function getSettingName: JCharSequence; cdecl;
  end;
  TJBiometricManager_Strings = class(TJavaGenericImport<JBiometricManager_StringsClass, JBiometricManager_Strings>) end;

  JDeviceProductInfoClass = interface(JObjectClass)
    ['{8B04BF80-C531-4A48-AA14-D12A98194A41}']
    {class} function _GetCONNECTION_TO_SINK_BUILT_IN: Integer; cdecl;
    {class} function _GetCONNECTION_TO_SINK_DIRECT: Integer; cdecl;
    {class} function _GetCONNECTION_TO_SINK_TRANSITIVE: Integer; cdecl;
    {class} function _GetCONNECTION_TO_SINK_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(name: JString; manufacturerPnpId: JString; productId: JString; modelYear: Integer; connectionToSinkType: Integer): JDeviceProductInfo; cdecl;
    {class} property CONNECTION_TO_SINK_BUILT_IN: Integer read _GetCONNECTION_TO_SINK_BUILT_IN;
    {class} property CONNECTION_TO_SINK_DIRECT: Integer read _GetCONNECTION_TO_SINK_DIRECT;
    {class} property CONNECTION_TO_SINK_TRANSITIVE: Integer read _GetCONNECTION_TO_SINK_TRANSITIVE;
    {class} property CONNECTION_TO_SINK_UNKNOWN: Integer read _GetCONNECTION_TO_SINK_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/display/DeviceProductInfo')]
  JDeviceProductInfo = interface(JObject)
    ['{C38057C3-1D99-441D-B5CA-D39FE8A1391E}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getConnectionToSinkType: Integer; cdecl;
    function getManufactureWeek: Integer; cdecl;
    function getManufactureYear: Integer; cdecl;
    function getManufacturerPnpId: JString; cdecl;
    function getModelYear: Integer; cdecl;
    function getName: JString; cdecl;
    function getProductId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJDeviceProductInfo = class(TJavaGenericImport<JDeviceProductInfoClass, JDeviceProductInfo>) end;

  JDisplayManagerClass = interface(JObjectClass)
    ['{EAF20941-0999-4B3C-B333-5DC80A38FB36}']
    {class} function _GetDISPLAY_CATEGORY_PRESENTATION: JString; cdecl;
    {class} function _GetMATCH_CONTENT_FRAMERATE_ALWAYS: Integer; cdecl;
    {class} function _GetMATCH_CONTENT_FRAMERATE_NEVER: Integer; cdecl;
    {class} function _GetMATCH_CONTENT_FRAMERATE_SEAMLESSS_ONLY: Integer; cdecl;
    {class} function _GetMATCH_CONTENT_FRAMERATE_UNKNOWN: Integer; cdecl;
    {class} function _GetVIRTUAL_DISPLAY_FLAG_AUTO_MIRROR: Integer; cdecl;
    {class} function _GetVIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY: Integer; cdecl;
    {class} function _GetVIRTUAL_DISPLAY_FLAG_PRESENTATION: Integer; cdecl;
    {class} function _GetVIRTUAL_DISPLAY_FLAG_PUBLIC: Integer; cdecl;
    {class} function _GetVIRTUAL_DISPLAY_FLAG_SECURE: Integer; cdecl;
    {class} property DISPLAY_CATEGORY_PRESENTATION: JString read _GetDISPLAY_CATEGORY_PRESENTATION;
    {class} property MATCH_CONTENT_FRAMERATE_ALWAYS: Integer read _GetMATCH_CONTENT_FRAMERATE_ALWAYS;
    {class} property MATCH_CONTENT_FRAMERATE_NEVER: Integer read _GetMATCH_CONTENT_FRAMERATE_NEVER;
    {class} property MATCH_CONTENT_FRAMERATE_SEAMLESSS_ONLY: Integer read _GetMATCH_CONTENT_FRAMERATE_SEAMLESSS_ONLY;
    {class} property MATCH_CONTENT_FRAMERATE_UNKNOWN: Integer read _GetMATCH_CONTENT_FRAMERATE_UNKNOWN;
    {class} property VIRTUAL_DISPLAY_FLAG_AUTO_MIRROR: Integer read _GetVIRTUAL_DISPLAY_FLAG_AUTO_MIRROR;
    {class} property VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY: Integer read _GetVIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY;
    {class} property VIRTUAL_DISPLAY_FLAG_PRESENTATION: Integer read _GetVIRTUAL_DISPLAY_FLAG_PRESENTATION;
    {class} property VIRTUAL_DISPLAY_FLAG_PUBLIC: Integer read _GetVIRTUAL_DISPLAY_FLAG_PUBLIC;
    {class} property VIRTUAL_DISPLAY_FLAG_SECURE: Integer read _GetVIRTUAL_DISPLAY_FLAG_SECURE;
  end;

  [JavaSignature('android/hardware/display/DisplayManager')]
  JDisplayManager = interface(JObject)
    ['{5B4765F5-3933-4CE4-BDA9-DA797F5B913D}']
    function createVirtualDisplay(name: JString; width: Integer; height: Integer; densityDpi: Integer; surface: JSurface; flags: Integer): JVirtualDisplay; cdecl; overload;
    function createVirtualDisplay(name: JString; width: Integer; height: Integer; densityDpi: Integer; surface: JSurface; flags: Integer; callback: JVirtualDisplay_Callback; handler: JHandler): JVirtualDisplay; cdecl; overload;
    function getDisplay(displayId: Integer): JDisplay; cdecl;
    function getDisplays: TJavaObjectArray<JDisplay>; cdecl; overload;
    function getDisplays(category: JString): TJavaObjectArray<JDisplay>; cdecl; overload;
    function getMatchContentFrameRateUserPreference: Integer; cdecl;
    procedure registerDisplayListener(listener: JDisplayManager_DisplayListener; handler: JHandler); cdecl;
    procedure unregisterDisplayListener(listener: JDisplayManager_DisplayListener); cdecl;
  end;
  TJDisplayManager = class(TJavaGenericImport<JDisplayManagerClass, JDisplayManager>) end;

  JDisplayManager_DisplayListenerClass = interface(IJavaClass)
    ['{77B7E5F8-15B2-4463-BF5C-EB037A7C8673}']
  end;

  [JavaSignature('android/hardware/display/DisplayManager$DisplayListener')]
  JDisplayManager_DisplayListener = interface(IJavaInstance)
    ['{96449BAC-9FC3-41DF-9784-CFEA8E98341E}']
    procedure onDisplayAdded(displayId: Integer); cdecl;
    procedure onDisplayChanged(displayId: Integer); cdecl;
    procedure onDisplayRemoved(displayId: Integer); cdecl;
  end;
  TJDisplayManager_DisplayListener = class(TJavaGenericImport<JDisplayManager_DisplayListenerClass, JDisplayManager_DisplayListener>) end;

  JVirtualDisplayClass = interface(JObjectClass)
    ['{306EA32E-6D20-433A-A8D4-DD0C5489A026}']
  end;

  [JavaSignature('android/hardware/display/VirtualDisplay')]
  JVirtualDisplay = interface(JObject)
    ['{38AFF33C-3F86-4FF3-B2B7-987CFBA39506}']
    function getDisplay: JDisplay; cdecl;
    function getSurface: JSurface; cdecl;
    procedure release; cdecl;
    procedure resize(width: Integer; height: Integer; densityDpi: Integer); cdecl;
    procedure setSurface(surface: JSurface); cdecl;
    function toString: JString; cdecl;
  end;
  TJVirtualDisplay = class(TJavaGenericImport<JVirtualDisplayClass, JVirtualDisplay>) end;

  JVirtualDisplay_CallbackClass = interface(JObjectClass)
    ['{9DED19F6-C2C2-4F18-AE4A-4ED00C3F790A}']
    {class} function init: JVirtualDisplay_Callback; cdecl;
  end;

  [JavaSignature('android/hardware/display/VirtualDisplay$Callback')]
  JVirtualDisplay_Callback = interface(JObject)
    ['{3917E6C4-8330-4CA4-8866-CC55C0F3EA23}']
    procedure onPaused; cdecl;
    procedure onResumed; cdecl;
    procedure onStopped; cdecl;
  end;
  TJVirtualDisplay_Callback = class(TJavaGenericImport<JVirtualDisplay_CallbackClass, JVirtualDisplay_Callback>) end;

  JFingerprintManager_CryptoObjectClass = interface(JObjectClass)
    ['{4B4CF256-9483-4D76-A965-ED1BCF6FE123}']
    {class} function init(signature: Jsecurity_Signature): JFingerprintManager_CryptoObject; cdecl; overload;
    {class} function init(cipher: JCipher): JFingerprintManager_CryptoObject; cdecl; overload;
    {class} function init(mac: JMac): JFingerprintManager_CryptoObject; cdecl; overload;
  end;

  [JavaSignature('android/hardware/fingerprint/FingerprintManager$CryptoObject')]
  JFingerprintManager_CryptoObject = interface(JObject)
    ['{216277CF-9BA8-4C16-B42E-144731624A74}']
    function getCipher: JCipher; cdecl;
    function getMac: JMac; cdecl;
    function getSignature: Jsecurity_Signature; cdecl;
  end;
  TJFingerprintManager_CryptoObject = class(TJavaGenericImport<JFingerprintManager_CryptoObjectClass, JFingerprintManager_CryptoObject>) end;

  JLightClass = interface(JObjectClass)
    ['{11F0F07F-63B6-4314-9756-5B05BEFBEBD6}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetLIGHT_CAPABILITY_BRIGHTNESS: Integer; cdecl;
    {class} function _GetLIGHT_CAPABILITY_RGB: Integer; cdecl;
    {class} function _GetLIGHT_TYPE_INPUT: Integer; cdecl;
    {class} function _GetLIGHT_TYPE_MICROPHONE: Integer; cdecl;
    {class} function _GetLIGHT_TYPE_PLAYER_ID: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property LIGHT_CAPABILITY_BRIGHTNESS: Integer read _GetLIGHT_CAPABILITY_BRIGHTNESS;
    {class} property LIGHT_CAPABILITY_RGB: Integer read _GetLIGHT_CAPABILITY_RGB;
    {class} property LIGHT_TYPE_INPUT: Integer read _GetLIGHT_TYPE_INPUT;
    {class} property LIGHT_TYPE_MICROPHONE: Integer read _GetLIGHT_TYPE_MICROPHONE;
    {class} property LIGHT_TYPE_PLAYER_ID: Integer read _GetLIGHT_TYPE_PLAYER_ID;
  end;

  [JavaSignature('android/hardware/lights/Light')]
  JLight = interface(JObject)
    ['{840DFC21-A9A0-4FF6-87FF-2C4E2BD4FCF9}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getId: Integer; cdecl;
    function getName: JString; cdecl;
    function getOrdinal: Integer; cdecl;
    function getType: Integer; cdecl;
    function hasBrightnessControl: Boolean; cdecl;
    function hasRgbControl: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJLight = class(TJavaGenericImport<JLightClass, JLight>) end;

  JLightStateClass = interface(JObjectClass)
    ['{BFD6BA02-2A9F-466C-A2A7-98B307B53FC5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/lights/LightState')]
  JLightState = interface(JObject)
    ['{436A408F-EA6D-4307-8B0E-99A07177DD69}']
    function describeContents: Integer; cdecl;
    function getColor: Integer; cdecl;
    function getPlayerId: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJLightState = class(TJavaGenericImport<JLightStateClass, JLightState>) end;

  JLightsManagerClass = interface(JObjectClass)
    ['{ED5BA5A5-707F-442A-99A9-6ECE7449CD88}']
  end;

  [JavaSignature('android/hardware/lights/LightsManager')]
  JLightsManager = interface(JObject)
    ['{C1B40ECF-2D52-466D-B8D6-91ED01EF64D5}']
    function getLightState(light: JLight): JLightState; cdecl;
    function getLights: JList; cdecl;
    function openSession: JLightsManager_LightsSession; cdecl;
  end;
  TJLightsManager = class(TJavaGenericImport<JLightsManagerClass, JLightsManager>) end;

  JLightsManager_LightsSessionClass = interface(JObjectClass)
    ['{3571BAE2-AF43-417A-B328-F92FC9B29A33}']
  end;

  [JavaSignature('android/hardware/lights/LightsManager$LightsSession')]
  JLightsManager_LightsSession = interface(JObject)
    ['{B4ACE63D-636B-41A2-98C7-484E8B685B3A}']
    procedure close; cdecl;
    procedure requestLights(request: JLightsRequest); cdecl;
  end;
  TJLightsManager_LightsSession = class(TJavaGenericImport<JLightsManager_LightsSessionClass, JLightsManager_LightsSession>) end;

  JLightsRequestClass = interface(JObjectClass)
    ['{5D12D86F-405F-47A8-91E9-464876B23639}']
  end;

  [JavaSignature('android/hardware/lights/LightsRequest')]
  JLightsRequest = interface(JObject)
    ['{6E823A8A-2672-4E09-9E0A-04139DF02BE0}']
    function getLightStates: JList; cdecl;
    function getLights: JList; cdecl;
    function getLightsAndStates: JMap; cdecl;
  end;
  TJLightsRequest = class(TJavaGenericImport<JLightsRequestClass, JLightsRequest>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JBatteryState', TypeInfo(Androidapi.JNI.Hardware.JBatteryState));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera', TypeInfo(Androidapi.JNI.Hardware.JCamera));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_AutoFocusCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_AutoFocusCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_AutoFocusMoveCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_AutoFocusMoveCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_CameraInfo', TypeInfo(Androidapi.JNI.Hardware.JCamera_CameraInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_ErrorCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_ErrorCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_Face', TypeInfo(Androidapi.JNI.Hardware.JCamera_Face));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_FaceDetectionListener', TypeInfo(Androidapi.JNI.Hardware.JCamera_FaceDetectionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_OnZoomChangeListener', TypeInfo(Androidapi.JNI.Hardware.JCamera_OnZoomChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_Parameters', TypeInfo(Androidapi.JNI.Hardware.JCamera_Parameters));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_PictureCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_PictureCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_PreviewCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_PreviewCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_ShutterCallback', TypeInfo(Androidapi.JNI.Hardware.JCamera_ShutterCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JCamera_Size', TypeInfo(Androidapi.JNI.Hardware.JCamera_Size));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JHardwareBuffer', TypeInfo(Androidapi.JNI.Hardware.JHardwareBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensor', TypeInfo(Androidapi.JNI.Hardware.JSensor));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorDirectChannel', TypeInfo(Androidapi.JNI.Hardware.JSensorDirectChannel));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorEvent', TypeInfo(Androidapi.JNI.Hardware.JSensorEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorEventListener', TypeInfo(Androidapi.JNI.Hardware.JSensorEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorListener', TypeInfo(Androidapi.JNI.Hardware.JSensorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorManager', TypeInfo(Androidapi.JNI.Hardware.JSensorManager));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSensorManager_DynamicSensorCallback', TypeInfo(Androidapi.JNI.Hardware.JSensorManager_DynamicSensorCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JSyncFence', TypeInfo(Androidapi.JNI.Hardware.JSyncFence));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JTriggerEvent', TypeInfo(Androidapi.JNI.Hardware.JTriggerEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JTriggerEventListener', TypeInfo(Androidapi.JNI.Hardware.JTriggerEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JBiometricManager', TypeInfo(Androidapi.JNI.Hardware.JBiometricManager));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JBiometricManager_Strings', TypeInfo(Androidapi.JNI.Hardware.JBiometricManager_Strings));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JDeviceProductInfo', TypeInfo(Androidapi.JNI.Hardware.JDeviceProductInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JDisplayManager', TypeInfo(Androidapi.JNI.Hardware.JDisplayManager));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JDisplayManager_DisplayListener', TypeInfo(Androidapi.JNI.Hardware.JDisplayManager_DisplayListener));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JVirtualDisplay', TypeInfo(Androidapi.JNI.Hardware.JVirtualDisplay));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JVirtualDisplay_Callback', TypeInfo(Androidapi.JNI.Hardware.JVirtualDisplay_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JFingerprintManager_CryptoObject', TypeInfo(Androidapi.JNI.Hardware.JFingerprintManager_CryptoObject));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JLight', TypeInfo(Androidapi.JNI.Hardware.JLight));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JLightState', TypeInfo(Androidapi.JNI.Hardware.JLightState));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JLightsManager', TypeInfo(Androidapi.JNI.Hardware.JLightsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JLightsManager_LightsSession', TypeInfo(Androidapi.JNI.Hardware.JLightsManager_LightsSession));
  TRegTypes.RegisterType('Androidapi.JNI.Hardware.JLightsRequest', TypeInfo(Androidapi.JNI.Hardware.JLightsRequest));
end;

initialization
  RegisterTypes;
end.


