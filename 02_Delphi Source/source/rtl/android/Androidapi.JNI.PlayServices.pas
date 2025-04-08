{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.PlayServices;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.PlayServices.Tasks,
  Androidapi.JNI.Support;

type
// ===== Forward declarations =====

  JSafeParcelable = interface;//com.google.android.gms.common.internal.safeparcel.SafeParcelable
  JAbstractSafeParcelable = interface;//com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable
  JConnectionResult = interface;//com.google.android.gms.common.ConnectionResult
  JGoogleApiAvailabilityLight = interface;//com.google.android.gms.common.GoogleApiAvailabilityLight
  JGoogleApiAvailability = interface;//com.google.android.gms.common.GoogleApiAvailability

// ===== Interface declarations =====

  JSafeParcelableClass = interface(JParcelableClass)
    ['{865435AB-F2E1-4DEF-B775-17CC0CAC9AED}']
    {class} function _GetNULL: JString; cdecl;
    {class} 
  end;

  [JavaSignature('com/google/android/gms/common/internal/safeparcel/SafeParcelable')]
  JSafeParcelable = interface(JParcelable)
    ['{0CBA956D-6EA5-41D8-8AFC-42759ADFD37B}']
  end;
  TJSafeParcelable = class(TJavaGenericImport<JSafeParcelableClass, JSafeParcelable>) end;

  JAbstractSafeParcelableClass = interface(JSafeParcelableClass)
    ['{BC85B4E6-5576-4EB2-A665-AC962376DA97}']
    {class} function init: JAbstractSafeParcelable; cdecl;
  end;

  [JavaSignature('com/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable')]
  JAbstractSafeParcelable = interface(JSafeParcelable)
    ['{5D1DC3DA-DE62-426D-A9F1-202B7329489A}']
    function describeContents: Integer; cdecl;
  end;
  TJAbstractSafeParcelable = class(TJavaGenericImport<JAbstractSafeParcelableClass, JAbstractSafeParcelable>) end;

  JConnectionResultClass = interface(JAbstractSafeParcelableClass)
    ['{4A2A7E79-F9D7-4636-A3CF-C291BEF18896}']
    {class} function _GetAPI_DISABLED: Integer; cdecl;
    {class} function _GetAPI_DISABLED_FOR_CONNECTION: Integer; cdecl;
    {class} function _GetAPI_UNAVAILABLE: Integer; cdecl;
    {class} function _GetCANCELED: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDEVELOPER_ERROR: Integer; cdecl;
    {class} function _GetDRIVE_EXTERNAL_STORAGE_REQUIRED: Integer; cdecl;
    {class} function _GetINTERNAL_ERROR: Integer; cdecl;
    {class} function _GetINTERRUPTED: Integer; cdecl;
    {class} function _GetINVALID_ACCOUNT: Integer; cdecl;
    {class} function _GetLICENSE_CHECK_FAILED: Integer; cdecl;
    {class} function _GetNETWORK_ERROR: Integer; cdecl;
    {class} function _GetRESOLUTION_ACTIVITY_NOT_FOUND: Integer; cdecl;
    {class} function _GetRESOLUTION_REQUIRED: Integer; cdecl;
    {class} function _GetRESTRICTED_PROFILE: Integer; cdecl;
    {class} function _GetRESULT_SUCCESS: JConnectionResult; cdecl;
    {class} function _GetSERVICE_DISABLED: Integer; cdecl;
    {class} function _GetSERVICE_INVALID: Integer; cdecl;
    {class} function _GetSERVICE_MISSING: Integer; cdecl;
    {class} function _GetSERVICE_MISSING_PERMISSION: Integer; cdecl;
    {class} function _GetSERVICE_UPDATING: Integer; cdecl;
    {class} function _GetSERVICE_VERSION_UPDATE_REQUIRED: Integer; cdecl;
    {class} function _GetSIGN_IN_FAILED: Integer; cdecl;
    {class} function _GetSIGN_IN_REQUIRED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function _GetTIMEOUT: Integer; cdecl;
    {class} function _GetUNKNOWN: Integer; cdecl;
    {class} function init(i: Integer): JConnectionResult; cdecl; overload;
    {class} function init(i: Integer; pendingIntent: JPendingIntent): JConnectionResult; cdecl; overload;
    {class} function init(i: Integer; pendingIntent: JPendingIntent; string_: JString): JConnectionResult; cdecl; overload;
    {class} property API_DISABLED: Integer read _GetAPI_DISABLED;
    {class} property API_DISABLED_FOR_CONNECTION: Integer read _GetAPI_DISABLED_FOR_CONNECTION;
    {class} property API_UNAVAILABLE: Integer read _GetAPI_UNAVAILABLE;
    {class} property CANCELED: Integer read _GetCANCELED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DEVELOPER_ERROR: Integer read _GetDEVELOPER_ERROR;
    {class} property DRIVE_EXTERNAL_STORAGE_REQUIRED: Integer read _GetDRIVE_EXTERNAL_STORAGE_REQUIRED;
    {class} property INTERNAL_ERROR: Integer read _GetINTERNAL_ERROR;
    {class} property INTERRUPTED: Integer read _GetINTERRUPTED;
    {class} property INVALID_ACCOUNT: Integer read _GetINVALID_ACCOUNT;
    {class} property LICENSE_CHECK_FAILED: Integer read _GetLICENSE_CHECK_FAILED;
    {class} property NETWORK_ERROR: Integer read _GetNETWORK_ERROR;
    {class} property RESOLUTION_ACTIVITY_NOT_FOUND: Integer read _GetRESOLUTION_ACTIVITY_NOT_FOUND;
    {class} property RESOLUTION_REQUIRED: Integer read _GetRESOLUTION_REQUIRED;
    {class} property RESTRICTED_PROFILE: Integer read _GetRESTRICTED_PROFILE;
    {class} property RESULT_SUCCESS: JConnectionResult read _GetRESULT_SUCCESS;
    {class} property SERVICE_DISABLED: Integer read _GetSERVICE_DISABLED;
    {class} property SERVICE_INVALID: Integer read _GetSERVICE_INVALID;
    {class} property SERVICE_MISSING: Integer read _GetSERVICE_MISSING;
    {class} property SERVICE_MISSING_PERMISSION: Integer read _GetSERVICE_MISSING_PERMISSION;
    {class} property SERVICE_UPDATING: Integer read _GetSERVICE_UPDATING;
    {class} property SERVICE_VERSION_UPDATE_REQUIRED: Integer read _GetSERVICE_VERSION_UPDATE_REQUIRED;
    {class} property SIGN_IN_FAILED: Integer read _GetSIGN_IN_FAILED;
    {class} property SIGN_IN_REQUIRED: Integer read _GetSIGN_IN_REQUIRED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property TIMEOUT: Integer read _GetTIMEOUT;
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
  end;

  [JavaSignature('com/google/android/gms/common/ConnectionResult')]
  JConnectionResult = interface(JAbstractSafeParcelable)
    ['{A6C69B94-8D31-4C7B-9001-1DDF4A76D784}']
    function equals(object_: JObject): Boolean; cdecl;
    function getErrorCode: Integer; cdecl;
    function getErrorMessage: JString; cdecl;
    function getResolution: JPendingIntent; cdecl;
    function hasResolution: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isSuccess: Boolean; cdecl;
    procedure startResolutionForResult(activity: JActivity; i: Integer); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJConnectionResult = class(TJavaGenericImport<JConnectionResultClass, JConnectionResult>) end;

  JGoogleApiAvailabilityLightClass = interface(JObjectClass)
    ['{F410C5F0-F09F-457A-9153-4FEA78B40D31}']
    {class} function _GetGOOGLE_PLAY_SERVICES_PACKAGE: JString; cdecl;
    {class} function _GetGOOGLE_PLAY_SERVICES_VERSION_CODE: Integer; cdecl;
    {class} function _GetGOOGLE_PLAY_STORE_PACKAGE: JString; cdecl;
    {class} function getInstance: JGoogleApiAvailabilityLight; cdecl;
    {class} property GOOGLE_PLAY_SERVICES_PACKAGE: JString read _GetGOOGLE_PLAY_SERVICES_PACKAGE;
    {class} property GOOGLE_PLAY_SERVICES_VERSION_CODE: Integer read _GetGOOGLE_PLAY_SERVICES_VERSION_CODE;
    {class} property GOOGLE_PLAY_STORE_PACKAGE: JString read _GetGOOGLE_PLAY_STORE_PACKAGE;
  end;

  [JavaSignature('com/google/android/gms/common/GoogleApiAvailabilityLight')]
  JGoogleApiAvailabilityLight = interface(JObject)
    ['{F381B679-9652-43A3-B8D1-AFB1E2A900A0}']
    procedure cancelAvailabilityErrorNotifications(context: JContext); cdecl;
    function getApkVersion(context: JContext): Integer; cdecl;
    function getClientVersion(context: JContext): Integer; cdecl;
    function getErrorResolutionIntent(i: Integer): JIntent; cdecl; overload;
    function getErrorResolutionIntent(context: JContext; i: Integer; string_: JString): JIntent; cdecl; overload;
    function getErrorResolutionPendingIntent(context: JContext; i: Integer; i1: Integer): JPendingIntent; cdecl; overload;
    function getErrorResolutionPendingIntent(context: JContext; i: Integer; i1: Integer; string_: JString): JPendingIntent; cdecl; overload;
    function getErrorString(i: Integer): JString; cdecl;
    function isGooglePlayServicesAvailable(context: JContext): Integer; cdecl; overload;
    function isGooglePlayServicesAvailable(context: JContext; i: Integer): Integer; cdecl; overload;
    function isPlayServicesPossiblyUpdating(context: JContext; i: Integer): Boolean; cdecl;
    function isPlayStorePossiblyUpdating(context: JContext; i: Integer): Boolean; cdecl;
    function isUninstalledAppPossiblyUpdating(context: JContext; string_: JString): Boolean; cdecl;
    function isUserResolvableError(i: Integer): Boolean; cdecl;
    procedure verifyGooglePlayServicesIsAvailable(context: JContext; i: Integer); cdecl;
  end;
  TJGoogleApiAvailabilityLight = class(TJavaGenericImport<JGoogleApiAvailabilityLightClass, JGoogleApiAvailabilityLight>) end;

  JGoogleApiAvailabilityClass = interface(JGoogleApiAvailabilityLightClass)
    ['{6C6F4A98-A7F2-494B-AB91-7F3D7E406D6A}']
    {class} function _GetGOOGLE_PLAY_SERVICES_PACKAGE: JString; cdecl;
    {class} function _GetGOOGLE_PLAY_SERVICES_VERSION_CODE: Integer; cdecl;
    {class} function getInstance: JGoogleApiAvailability; cdecl;
    {class} //GOOGLE_PLAY_SERVICES_PACKAGE is defined in parent interface
    {class} //GOOGLE_PLAY_SERVICES_VERSION_CODE is defined in parent interface
  end;

  [JavaSignature('com/google/android/gms/common/GoogleApiAvailability')]
  JGoogleApiAvailability = interface(JGoogleApiAvailabilityLight)
    ['{173F0D87-ED67-4C10-9C1A-BA529C515333}']
    function getClientVersion(context: JContext): Integer; cdecl;
    function getErrorDialog(fragment: Jfragment_app_Fragment; i: Integer; i1: Integer): JDialog; cdecl; overload;
    function getErrorDialog(activity: JActivity; i: Integer; i1: Integer): JDialog; cdecl; overload;
    function getErrorDialog(fragment: Jfragment_app_Fragment; i: Integer; i1: Integer; onCancelListener: JDialogInterface_OnCancelListener): JDialog; cdecl; overload;
    function getErrorDialog(activity: JActivity; i: Integer; i1: Integer; onCancelListener: JDialogInterface_OnCancelListener): JDialog; cdecl; overload;
    function getErrorResolutionIntent(context: JContext; i: Integer; string_: JString): JIntent; cdecl;
    function getErrorResolutionPendingIntent(context: JContext; connectionResult: JConnectionResult): JPendingIntent; cdecl; overload;
    function getErrorResolutionPendingIntent(context: JContext; i: Integer; i1: Integer): JPendingIntent; cdecl; overload;
    function getErrorString(i: Integer): JString; cdecl;
    function isGooglePlayServicesAvailable(context: JContext): Integer; cdecl; overload;
    function isGooglePlayServicesAvailable(context: JContext; i: Integer): Integer; cdecl; overload;
    function isUserResolvableError(i: Integer): Boolean; cdecl;
    function makeGooglePlayServicesAvailable(activity: JActivity): JTask; cdecl;
    procedure setDefaultNotificationChannelId(context: JContext; string_: JString); cdecl;
    function showErrorDialogFragment(activity: JActivity; i: Integer; i1: Integer): Boolean; cdecl; overload;
    function showErrorDialogFragment(activity: JActivity; i: Integer; i1: Integer; onCancelListener: JDialogInterface_OnCancelListener): Boolean; cdecl; overload;
    procedure showErrorNotification(context: JContext; connectionResult: JConnectionResult); cdecl; overload;
    procedure showErrorNotification(context: JContext; i: Integer); cdecl; overload;
  end;
  TJGoogleApiAvailability = class(TJavaGenericImport<JGoogleApiAvailabilityClass, JGoogleApiAvailability>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.PlayServices.JSafeParcelable', TypeInfo(Androidapi.JNI.PlayServices.JSafeParcelable));
  TRegTypes.RegisterType('Androidapi.JNI.PlayServices.JAbstractSafeParcelable', TypeInfo(Androidapi.JNI.PlayServices.JAbstractSafeParcelable));
  TRegTypes.RegisterType('Androidapi.JNI.PlayServices.JConnectionResult', TypeInfo(Androidapi.JNI.PlayServices.JConnectionResult));
  TRegTypes.RegisterType('Androidapi.JNI.PlayServices.JGoogleApiAvailabilityLight', TypeInfo(Androidapi.JNI.PlayServices.JGoogleApiAvailabilityLight));
  TRegTypes.RegisterType('Androidapi.JNI.PlayServices.JGoogleApiAvailability', TypeInfo(Androidapi.JNI.PlayServices.JGoogleApiAvailability));
end;

initialization
  RegisterTypes;
end.


