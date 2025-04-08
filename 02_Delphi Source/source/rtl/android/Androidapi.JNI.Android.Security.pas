{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Android.Security;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Java.Security,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JAppUriAuthenticationPolicy = interface;//android.security.AppUriAuthenticationPolicy
  JKeyChain = interface;//android.security.KeyChain
  JKeyChainAliasCallback = interface;//android.security.KeyChainAliasCallback
  JIdentityCredential = interface;//android.security.identity.IdentityCredential
  JPersonalizationData = interface;//android.security.identity.PersonalizationData
  JResultData = interface;//android.security.identity.ResultData

// ===== Interface declarations =====

  JAppUriAuthenticationPolicyClass = interface(JObjectClass)
    ['{4EC01DDD-D224-4702-85B3-16FF922DE4C2}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/security/AppUriAuthenticationPolicy')]
  JAppUriAuthenticationPolicy = interface(JObject)
    ['{4538536E-828A-4922-B1D4-5C17B00477EE}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getAppAndUriMappings: JMap; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAppUriAuthenticationPolicy = class(TJavaGenericImport<JAppUriAuthenticationPolicyClass, JAppUriAuthenticationPolicy>) end;

  JKeyChainClass = interface(JObjectClass)
    ['{318B9BE7-6348-4F80-B891-DC10D7045678}']
    {class} function _GetACTION_KEYCHAIN_CHANGED: JString; cdecl;
    {class} function _GetACTION_KEY_ACCESS_CHANGED: JString; cdecl;
    {class} function _GetACTION_STORAGE_CHANGED: JString; cdecl;
    {class} function _GetACTION_TRUST_STORE_CHANGED: JString; cdecl;
    {class} function _GetEXTRA_CERTIFICATE: JString; cdecl;
    {class} function _GetEXTRA_KEY_ACCESSIBLE: JString; cdecl;
    {class} function _GetEXTRA_KEY_ALIAS: JString; cdecl;
    {class} function _GetEXTRA_NAME: JString; cdecl;
    {class} function _GetEXTRA_PKCS12: JString; cdecl;
    {class} function _GetKEY_ALIAS_SELECTION_DENIED: JString; cdecl;
    {class} function init: JKeyChain; cdecl;
    {class} procedure choosePrivateKeyAlias(activity: JActivity; response: JKeyChainAliasCallback; keyTypes: TJavaObjectArray<JString>; issuers: TJavaObjectArray<JPrincipal>; host: JString; port: Integer; alias: JString); cdecl; overload;
    {class} procedure choosePrivateKeyAlias(activity: JActivity; response: JKeyChainAliasCallback; keyTypes: TJavaObjectArray<JString>; issuers: TJavaObjectArray<JPrincipal>; uri: Jnet_Uri; alias: JString); cdecl; overload;
    {class} function createInstallIntent: JIntent; cdecl;
    {class} function createManageCredentialsIntent(policy: JAppUriAuthenticationPolicy): JIntent; cdecl;
    {class} function getCertificateChain(context: JContext; alias: JString): TJavaObjectArray<JX509Certificate>; cdecl;
    {class} function getCredentialManagementAppPolicy(context: JContext): JAppUriAuthenticationPolicy; cdecl;
    {class} function getPrivateKey(context: JContext; alias: JString): JPrivateKey; cdecl;
    {class} function isBoundKeyAlgorithm(algorithm: JString): Boolean; cdecl;//Deprecated
    {class} function isCredentialManagementApp(context: JContext): Boolean; cdecl;
    {class} function isKeyAlgorithmSupported(algorithm: JString): Boolean; cdecl;
    {class} function removeCredentialManagementApp(context: JContext): Boolean; cdecl;
    {class} property ACTION_KEYCHAIN_CHANGED: JString read _GetACTION_KEYCHAIN_CHANGED;
    {class} property ACTION_KEY_ACCESS_CHANGED: JString read _GetACTION_KEY_ACCESS_CHANGED;
    {class} property ACTION_STORAGE_CHANGED: JString read _GetACTION_STORAGE_CHANGED;
    {class} property ACTION_TRUST_STORE_CHANGED: JString read _GetACTION_TRUST_STORE_CHANGED;
    {class} property EXTRA_CERTIFICATE: JString read _GetEXTRA_CERTIFICATE;
    {class} property EXTRA_KEY_ACCESSIBLE: JString read _GetEXTRA_KEY_ACCESSIBLE;
    {class} property EXTRA_KEY_ALIAS: JString read _GetEXTRA_KEY_ALIAS;
    {class} property EXTRA_NAME: JString read _GetEXTRA_NAME;
    {class} property EXTRA_PKCS12: JString read _GetEXTRA_PKCS12;
    {class} property KEY_ALIAS_SELECTION_DENIED: JString read _GetKEY_ALIAS_SELECTION_DENIED;
  end;

  [JavaSignature('android/security/KeyChain')]
  JKeyChain = interface(JObject)
    ['{BAB71601-7B0E-49A7-9760-EB868ACFF24A}']
  end;
  TJKeyChain = class(TJavaGenericImport<JKeyChainClass, JKeyChain>) end;

  JKeyChainAliasCallbackClass = interface(IJavaClass)
    ['{1DD718B7-A496-4C6A-96AE-5C7D37E5476F}']
  end;

  [JavaSignature('android/security/KeyChainAliasCallback')]
  JKeyChainAliasCallback = interface(IJavaInstance)
    ['{91594681-1CCA-4081-9A5B-0703B73F380E}']
    procedure alias(alias: JString); cdecl;
  end;
  TJKeyChainAliasCallback = class(TJavaGenericImport<JKeyChainAliasCallbackClass, JKeyChainAliasCallback>) end;

  JIdentityCredentialClass = interface(JObjectClass)
    ['{5CEBDDC9-0E55-4722-86B0-6AC4C131A89C}']
  end;

  [JavaSignature('android/security/identity/IdentityCredential')]
  JIdentityCredential = interface(JObject)
    ['{6F431426-D70B-4803-B7D0-0547ABB407F6}']
    function createEphemeralKeyPair: JKeyPair; cdecl;//Deprecated
    function decryptMessageFromReader(messageCiphertext: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    function delete(challenge: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function encryptMessageToReader(messagePlaintext: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    function getAuthKeysNeedingCertification: JCollection; cdecl;
    function getAuthenticationDataUsageCount: TJavaArray<Integer>; cdecl;
    function getCredentialKeyCertificateChain: JCollection; cdecl;
    function getEntries(requestMessage: TJavaArray<Byte>; entriesToRequest: JMap; sessionTranscript: TJavaArray<Byte>; readerSignature: TJavaArray<Byte>): JResultData; cdecl;//Deprecated
    function proveOwnership(challenge: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    procedure setAllowUsingExhaustedKeys(allowUsingExhaustedKeys: Boolean); cdecl;//Deprecated
    procedure setAllowUsingExpiredKeys(allowUsingExpiredKeys: Boolean); cdecl;//Deprecated
    procedure setAvailableAuthenticationKeys(keyCount: Integer; maxUsesPerKey: Integer); cdecl;
    procedure setReaderEphemeralPublicKey(readerEphemeralPublicKey: JPublicKey); cdecl;//Deprecated
    procedure storeStaticAuthenticationData(authenticationKey: JX509Certificate; staticAuthData: TJavaArray<Byte>); cdecl; overload;//Deprecated
    procedure storeStaticAuthenticationData(authenticationKey: JX509Certificate; expirationDate: JInstant; staticAuthData: TJavaArray<Byte>); cdecl; overload;
    function update(personalizationData: JPersonalizationData): TJavaArray<Byte>; cdecl;
  end;
  TJIdentityCredential = class(TJavaGenericImport<JIdentityCredentialClass, JIdentityCredential>) end;

  JPersonalizationDataClass = interface(JObjectClass)
    ['{5E33E0B8-1B88-4F7A-A2B5-F8D559D4CBCE}']
  end;

  [JavaSignature('android/security/identity/PersonalizationData')]
  JPersonalizationData = interface(JObject)
    ['{538E7215-46A3-42D0-B778-F053E62E0679}']
  end;
  TJPersonalizationData = class(TJavaGenericImport<JPersonalizationDataClass, JPersonalizationData>) end;

  JResultDataClass = interface(JObjectClass)
    ['{BFBED8D0-17C1-4F2E-9EC5-13B502EE9A7C}']
    {class} function _GetSTATUS_NOT_IN_REQUEST_MESSAGE: Integer; cdecl;
    {class} function _GetSTATUS_NOT_REQUESTED: Integer; cdecl;
    {class} function _GetSTATUS_NO_ACCESS_CONTROL_PROFILES: Integer; cdecl;
    {class} function _GetSTATUS_NO_SUCH_ENTRY: Integer; cdecl;
    {class} function _GetSTATUS_OK: Integer; cdecl;
    {class} function _GetSTATUS_READER_AUTHENTICATION_FAILED: Integer; cdecl;
    {class} function _GetSTATUS_USER_AUTHENTICATION_FAILED: Integer; cdecl;
    {class} property STATUS_NOT_IN_REQUEST_MESSAGE: Integer read _GetSTATUS_NOT_IN_REQUEST_MESSAGE;
    {class} property STATUS_NOT_REQUESTED: Integer read _GetSTATUS_NOT_REQUESTED;
    {class} property STATUS_NO_ACCESS_CONTROL_PROFILES: Integer read _GetSTATUS_NO_ACCESS_CONTROL_PROFILES;
    {class} property STATUS_NO_SUCH_ENTRY: Integer read _GetSTATUS_NO_SUCH_ENTRY;
    {class} property STATUS_OK: Integer read _GetSTATUS_OK;
    {class} property STATUS_READER_AUTHENTICATION_FAILED: Integer read _GetSTATUS_READER_AUTHENTICATION_FAILED;
    {class} property STATUS_USER_AUTHENTICATION_FAILED: Integer read _GetSTATUS_USER_AUTHENTICATION_FAILED;
  end;

  [JavaSignature('android/security/identity/ResultData')]
  JResultData = interface(JObject)
    ['{CF48A148-B58B-4CF4-B575-4731D9A784E3}']
    function getAuthenticatedData: TJavaArray<Byte>; cdecl;
    function getEntry(namespaceName: JString; name: JString): TJavaArray<Byte>; cdecl;
    function getEntryNames(namespaceName: JString): JCollection; cdecl;
    function getMessageAuthenticationCode: TJavaArray<Byte>; cdecl;
    function getNamespaces: JCollection; cdecl;
    function getRetrievedEntryNames(namespaceName: JString): JCollection; cdecl;
    function getStaticAuthenticationData: TJavaArray<Byte>; cdecl;
    function getStatus(namespaceName: JString; name: JString): Integer; cdecl;
  end;
  TJResultData = class(TJavaGenericImport<JResultDataClass, JResultData>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JAppUriAuthenticationPolicy', TypeInfo(Androidapi.JNI.Android.Security.JAppUriAuthenticationPolicy));
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JKeyChain', TypeInfo(Androidapi.JNI.Android.Security.JKeyChain));
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JKeyChainAliasCallback', TypeInfo(Androidapi.JNI.Android.Security.JKeyChainAliasCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JIdentityCredential', TypeInfo(Androidapi.JNI.Android.Security.JIdentityCredential));
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JPersonalizationData', TypeInfo(Androidapi.JNI.Android.Security.JPersonalizationData));
  TRegTypes.RegisterType('Androidapi.JNI.Android.Security.JResultData', TypeInfo(Androidapi.JNI.Android.Security.JResultData));
end;

initialization
  RegisterTypes;
end.


