{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.BiometricAuth.Android;

interface

procedure RegisterService;
procedure UnRegisterService;

implementation

uses
  System.Classes, System.SysUtils, System.Messaging, Androidapi.JNIBridge, Androidapi.Helpers, Androidapi.JNI.Os,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes, Androidapi.JNI.Support, Androidapi.JNI.Embarcadero, FMX.Platform,
  FMX.BiometricAuth, FMX.Consts;

type
  TAndroidBiometricService = class;

  TBiometricFragmentActivityListener = class(TJavaLocal, JBiometricFragmentActivityListener)
  private
    FBiometricService: TAndroidBiometricService;
  public
    { JBiometricFragmentActivityListener }
    procedure onAuthenticationResult(result: Integer; errorCode: Integer; errString: JCharSequence); cdecl;
    procedure onFinished; cdecl;
    procedure onStarted(activity: JBiometricFragmentActivity); cdecl;
  public
    constructor Create(const AService: TAndroidBiometricService);
  end;

  TAndroidBiometricService = class(TCustomBiometricService, IFMXBiometricAuthService)
  private
    FAttemptCount: Integer;
    FBiometricActivity: JBiometricFragmentActivity;
    FBiometricActivityListener: JBiometricFragmentActivityListener;
    FBiometricManager: Jbiometric_BiometricManager;
    FBiometricStrengths: TBiometricStrengths;
    FPromptProperties: TBiometricPromptProperties;
    function CanAllowDeviceCredential: Boolean;
    function GetAuthenticators: Integer;
    function GetPromptInfo: JBiometricPrompt_PromptInfo;
    function ShowPrompt: Boolean;
  protected
    procedure ActivityFinished;
    procedure ActivityStarted(const AActivity: JBiometricFragmentActivity);
    procedure AuthenticationResult(const AResult, AErrorCode: Integer; const AErrorMsg: string);
    procedure DoAuthenticate;  override;
    property PromptProperties: TBiometricPromptProperties read FPromptProperties;
  public
    { IFMXBiometricAuthService }
    procedure Cancel;
    function CanAuthenticate: Boolean;
    function GetBiometricAvailability: TBiometricAvailability;
    function GetBiometricStrengths: TBiometricStrengths;
    function GetBiometryKind: TBiometryKind;
    function IsActive: Boolean;
    function IsBiometryLockedOut: Boolean;
    function IsSupported: Boolean;
    procedure SetBiometricStrengths(const AStrengths: TBiometricStrengths);
    procedure SetPromptProperties(const AProperties: TBiometricPromptProperties);
    procedure SetReuseTime(const AInterval: Double);
  public
    constructor Create;
  end;

procedure RegisterService;
begin
  TPlatformServices.Current.AddPlatformService(IFMXBiometricAuthService, TAndroidBiometricService.Create);
end;

procedure UnRegisterService;
begin
  if TPlatformServices.Current <> nil then
    TPlatformServices.Current.RemovePlatformService(IFMXBiometricAuthService);
end;

{ TBiometricFragmentActivityListener }

constructor TBiometricFragmentActivityListener.Create(const AService: TAndroidBiometricService);
begin
  inherited Create;
  FBiometricService := AService;
end;

procedure TBiometricFragmentActivityListener.onAuthenticationResult(result, errorCode: Integer; errString: JCharSequence);
begin
  FBiometricService.AuthenticationResult(result, errorCode, JCharSequenceToStr(errString));
end;

procedure TBiometricFragmentActivityListener.onStarted(activity: JBiometricFragmentActivity);
begin
  FBiometricService.ActivityStarted(activity);
end;

procedure TBiometricFragmentActivityListener.onFinished;
begin
  FBiometricService.ActivityFinished;
end;

{ TAndroidBiometricService }

constructor TAndroidBiometricService.Create;
begin
  inherited;
  FBiometricManager := TJbiometric_BiometricManager.JavaClass.from(TAndroidHelper.Context);
  FBiometricActivityListener := TBiometricFragmentActivityListener.Create(Self);
end;

function TAndroidBiometricService.GetPromptInfo: JBiometricPrompt_PromptInfo;
var
  LBuilder: JPromptInfo_Builder;
begin
  LBuilder := TJPromptInfo_Builder.JavaClass.init
    .setDescription(StrToJCharSequence(FPromptProperties.Description))
    .setSubtitle(StrToJCharSequence(FPromptProperties.Subtitle))
    .setTitle(StrToJCharSequence(FPromptProperties.Title))
    .setConfirmationRequired(FPromptProperties.IsConfirmationRequired)
    .setDeviceCredentialAllowed(CanAllowDeviceCredential);
  if not CanAllowDeviceCredential then
    LBuilder := LBuilder.setNegativeButtonText(StrToJCharSequence(FPromptProperties.CancelButtonText));
  Result := LBuilder.build;
end;

procedure TAndroidBiometricService.ActivityStarted(const AActivity: JBiometricFragmentActivity);
begin
  FBiometricActivity := AActivity;
  FBiometricActivity.authenticate(GetPromptInfo);
end;

procedure TAndroidBiometricService.ActivityFinished;
begin
  FBiometricActivity := nil;
end;

function TAndroidBiometricService.CanAuthenticate: Boolean;
begin
  Result:= GetBiometricAvailability = TBiometricAvailability.Available;
end;

function TAndroidBiometricService.CanAllowDeviceCredential: Boolean;
var
  LSDK: Integer;
  LUseDeviceCredentialOnly: Boolean;
begin
  // https://developer.android.com/reference/androidx/biometric/BiometricManager?hl=en#canAuthenticate(int)
  LUseDeviceCredentialOnly := FBiometricStrengths = [TBiometricStrength.DeviceCredential];
  LSDK := TJBuild_VERSION.JavaClass.SDK_INT;
  if LSDK in [28, 29] then
    // Cannot combine Strong and DeviceCredential, or have DeviceCredential only in API 28, 29
    Result := not LUseDeviceCredentialOnly and (FBiometricStrengths <> [TBiometricStrength.DeviceCredential, TBiometricStrength.Strong])
  else if LSDK < 28 then
    // Cannot have DeviceCredential on its own in API < 30
    Result := not LUseDeviceCredentialOnly
  else
    // API >= 30 can have DeviceCredential in any circumstances
    Result := TBiometricStrength.DeviceCredential in FBiometricStrengths;
end;

function TAndroidBiometricService.GetAuthenticators: Integer;
begin
  Result := 0;
  if TBiometricStrength.DeviceCredential in FBiometricStrengths then
    Result := Result or TJbiometric_BiometricManager_Authenticators.JavaClass.DEVICE_CREDENTIAL;
  if TBiometricStrength.Strong in FBiometricStrengths then
    Result := Result or TJbiometric_BiometricManager_Authenticators.JavaClass.BIOMETRIC_STRONG;
  if TBiometricStrength.Weak in FBiometricStrengths then
    Result := Result or TJbiometric_BiometricManager_Authenticators.JavaClass.BIOMETRIC_WEAK;
end;

function TAndroidBiometricService.GetBiometricAvailability: TBiometricAvailability;
var
  LAuthResult: Integer;
begin
  if TJBuild_VERSION.JavaClass.SDK_INT >= 30 then
    LAuthResult := FBiometricManager.canAuthenticate(GetAuthenticators)
  else
    LAuthResult := FBiometricManager.canAuthenticate;
  if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_SUCCESS then
    Result := TBiometricAvailability.Available
  else if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_ERROR_HW_UNAVAILABLE then
    Result := TBiometricAvailability.HardwareUnavailable
  else if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_ERROR_NONE_ENROLLED then
    Result := TBiometricAvailability.NoneEnrolled
  else if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_ERROR_NO_HARDWARE then
    Result := TBiometricAvailability.NoHardware
  else if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_ERROR_SECURITY_UPDATE_REQUIRED then
    Result := TBiometricAvailability.SecurityUpdateRequired
  else if LAuthResult = TJbiometric_BiometricManager.JavaClass.BIOMETRIC_ERROR_UNSUPPORTED then
    Result := TBiometricAvailability.Unsupported
  else
    Result := TBiometricAvailability.Unknown;
end;

function TAndroidBiometricService.GetBiometricStrengths: TBiometricStrengths;
begin
  Result := FBiometricStrengths;
end;

procedure TAndroidBiometricService.SetBiometricStrengths(const AStrengths: TBiometricStrengths);
begin
  FBiometricStrengths := AStrengths;
end;

procedure TAndroidBiometricService.AuthenticationResult(const AResult, AErrorCode: Integer; const AErrorMsg: string);
var
  LFailReason: TBiometricFailReason;
  LMessage: string;
begin
  if AResult = TJBiometricFragmentActivity.JavaClass.AUTHENTICATION_RESULT_SUCCESS then
    DoAuthenticationResult(True)
  // Called when a biometric (e.g. fingerprint, face, etc.) is presented but not recognized as belonging to the user.
  // No error code or message will be returned but the UI will display the failure reason anyway.
  else if AResult = TJBiometricFragmentActivity.JavaClass.AUTHENTICATION_RESULT_ERROR then
  begin
    // See https://developer.android.com/reference/androidx/biometric/BiometricPrompt for error codes
    if (AErrorCode = TJbiometric_BiometricPrompt.JavaClass.ERROR_USER_CANCELED) or (AErrorCode = TJbiometric_BiometricPrompt.JavaClass.ERROR_NEGATIVE_BUTTON) then
      LFailReason := TBiometricFailReason.Cancelled
    else if AErrorCode = TJbiometric_BiometricPrompt.JavaClass.ERROR_LOCKOUT then
      LFailReason := TBiometricFailReason.LockedOut
    else if AErrorCode = TJbiometric_BiometricPrompt.JavaClass.ERROR_LOCKOUT_PERMANENT then
      LFailReason := TBiometricFailReason.LockedOutPermanently
    else
      LFailReason := TBiometricFailReason.Error;
    DoAuthenticationResult(False, Format('Code: %d, Message: %s', [AErrorCode, AErrorMsg]), LFailReason);
  end
  // Failed will happen if auth is working but the user couldn't be autheticated.
  // E.g. couldn't match the finger or face. The UI will tell the user what's wrong
  // so the error message and code will always be empty.
  else if AResult = TJBiometricFragmentActivity.JavaClass.AUTHENTICATION_RESULT_FAILED then
  begin
    Inc(FAttemptCount);
    if (FPromptProperties.AllowedAttempts > 0) and (FAttemptCount = FPromptProperties.AllowedAttempts) then
    begin
      LMessage := SBiometricErrorTooManyAttempts;
      Cancel;
    end
    else
      LMessage := SBiometricErrorAuthenticationDenied;
    DoAuthenticationResult(False, LMessage, TBiometricFailReason.Denied);
  end;
end;

function TAndroidBiometricService.IsSupported: Boolean;
begin
  Result := TOSVersion.Check(6);
end;

function TAndroidBiometricService.GetBiometryKind: TBiometryKind;
begin
  // On Android, unable to determine what biometry kind is selected
  Result := TBiometryKind.Unknown;
end;

procedure TAndroidBiometricService.DoAuthenticate;
begin
  if not ShowPrompt then
    DoAuthenticationResult(False, SBiometricErrorNotAvailable, TBiometricFailReason.Error);
end;

function TAndroidBiometricService.ShowPrompt: Boolean;
begin
  Result := False;
  if GetBiometricAvailability = TBiometricAvailability.Available then
  begin
    TJBiometricFragmentActivity.JavaClass.start(TAndroidHelper.Context, FBiometricActivityListener);
    Result := True;
  end;
end;

procedure TAndroidBiometricService.Cancel;
begin
  if FBiometricActivity <> nil then
    FBiometricActivity.cancel;
end;

function TAndroidBiometricService.IsActive: Boolean;
begin
  Result := FBiometricActivity <> nil;
end;

function TAndroidBiometricService.IsBiometryLockedOut: Boolean;
begin
  Result := False;
end;

procedure TAndroidBiometricService.SetPromptProperties(const AProperties: TBiometricPromptProperties);
begin
  FPromptProperties := AProperties;
  if FPromptProperties.Title.IsEmpty then
    FPromptProperties.Title := SBiometricPromptTitleTextDefault;
  if FPromptProperties.CancelButtonText.IsEmpty then
    FPromptProperties.CancelButtonText := SBiometricPromptCancelTextDefault;
end;

procedure TAndroidBiometricService.SetReuseTime(const AInterval: Double);
begin
  // Does not apply to Android
end;

end.
