{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.BiometricAuth;

interface

{$SCOPEDENUMS ON}

uses
  System.Messaging, System.SysUtils, System.Classes, FMX.Platform;

type
  TBiometricStrength = (DeviceCredential, Strong, Weak);

  TBiometricStrengths = set of TBiometricStrength;

  TBiometricAvailability = (Unknown, Available, HardwareUnavailable, NoHardware, NoneEnrolled, SecurityUpdateRequired, Unsupported);

  TBiometricFailReason = (Unknown, Cancelled, Fallback, Denied, LockedOut, LockedOutPermanently, Error, Help);

  TBiometryKind = (None, Unknown, Face, Touch);

  TBiometricFailProc = reference to procedure(const FailReason: TBiometricFailReason; const ResultMessage: string);

  TBiometricPromptProperties = record
    AllowedAttempts: Integer;
    CancelButtonText: string;
    Description: string;
    IsConfirmationRequired: Boolean;
    Subtitle: string;
    Title: string;
  end;

  IFMXBiometricAuthService = interface
    ['{66E2556F-E873-4ED1-941B-F87A7F51E708}']
    procedure Authenticate(const ASuccessProc: TProc; const AFailProc: TBiometricFailProc);
    procedure Cancel;
    function CanAuthenticate: Boolean;
    function GetBiometricAvailability: TBiometricAvailability;
    function GetBiometryKind: TBiometryKind;
    function IsActive: Boolean;
    function IsBiometryLockedOut: Boolean;
    function IsSupported: Boolean;
    procedure SetBiometricStrengths(const AStrengths: TBiometricStrengths);
    procedure SetPromptProperties(const AProperties: TBiometricPromptProperties);
    procedure SetReuseTime(const AInterval: Double);
  end;

  TBiometricFailEvent = procedure(Sender: TObject; const FailReason: TBiometricFailReason; const ResultMessage: string) of object;

  TCustomBiometricAuth = class(TComponent)
  private
    FAllowedAttempts: Integer;
    FBiometricStrengths: TBiometricStrengths;
    FPromptCancelButtonText: string;
    FPromptConfirmationRequired: Boolean;
    FPromptDescription: string;
    FPromptSubtitle: string;
    FPromptTitle: string;
    FReuseTime: Double;
    FService: IFMXBiometricAuthService;
    FOnAuthenticateFail: TBiometricFailEvent;
    FOnAuthenticateSuccess: TNotifyEvent;
    procedure BiometricAuthenticateFailHandler(const AFailReason: TBiometricFailReason; const AResultMessage: string);
    procedure BiometricAuthenticateSuccessHandler;
  protected
    property Service: IFMXBiometricAuthService read FService;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Authenticate;
    procedure Cancel;
    function CanAuthenticate: Boolean;
    function GetBiometricAvailability: TBiometricAvailability;
    function GetBiometryKind: TBiometryKind;
    /// <summary> Returns whether biometrics prompt is showing </summary>
    function IsActive: Boolean;
    /// <summary> Returns whether or not the user has been locked out of biometrics </summary>
    function IsBiometryLockedOut: Boolean;
    /// <summary> Returns whether biometrics support is available on the current platform </summary>
    function IsSupported: Boolean;
    /// <summary> Number of attempts at authentication that are allowed before the prompt closes </summary>
    /// <remarks> Defaults to 0, which means unlimited attempts. Applies to Android ONLY </remarks>
    property AllowedAttempts: Integer read FAllowedAttempts write FAllowedAttempts;
    /// <summary> Strengths of biometric authentication </summary>
    /// <remarks> Applies to Android ONLY </remarks>
    property BiometricStrengths: TBiometricStrengths read FBiometricStrengths write FBiometricStrengths;
    /// <summary> Text shown on the Cancel button when the biometric prompt shows </summary>
    /// <remarks> Applies to Android ONLY </remarks>
    property PromptCancelButtonText: string read FPromptCancelButtonText write FPromptCancelButtonText;
    /// <summary> Determines whether or not confirmation is required when the biometric prompt shows </summary>
    /// <remarks> Applies to Android ONLY, and may be IGNORED (defaulting to True) depending on the device </remarks>
    property PromptConfirmationRequired: Boolean read FPromptConfirmationRequired write FPromptConfirmationRequired;
    /// <summary> Description presented to the user when the biometric prompt shows </summary>
    /// <remarks> Applies to Android ONLY </remarks>
    property PromptDescription: string read FPromptDescription write FPromptDescription;
    /// <summary> Subtitle presented to the user when the biometric prompt shows </summary>
    /// <remarks> Applies to Android ONLY </remarks>
    property PromptSubtitle: string read FPromptSubtitle write FPromptSubtitle;
    /// <summary> Title presented to the user when the biometric prompt shows </summary>
    /// <remarks> Applies to Android and iOS </remarks>
    property PromptTitle: string read FPromptTitle write FPromptTitle;
    /// <summary> Time (in seconds) allowed for the authentication to apply </summary>
    /// <remarks> Applies to iOS ONLY </remarks>
    property ReuseTime: Double read FReuseTime write FReuseTime;
    property OnAuthenticateFail: TBiometricFailEvent read FOnAuthenticateFail write FOnAuthenticateFail;
    property OnAuthenticateSuccess: TNotifyEvent read FOnAuthenticateSuccess write FOnAuthenticateSuccess;
  end;

  /// <summary> Provides support for biometric authorization on Android and iOS</summary>
  [ComponentPlatformsAttribute(pfidiOS or pfidAndroid)]
  TBiometricAuth = class(TCustomBiometricAuth)
  published
    property AllowedAttempts;
    property BiometricStrengths;
    property PromptCancelButtonText;
    property PromptConfirmationRequired;
    property PromptDescription;
    property PromptSubtitle;
    property PromptTitle;
    property ReuseTime;
    property OnAuthenticateFail;
    property OnAuthenticateSuccess;
  end;

  TBiometricAuthenticationResult = record
    FailReason: TBiometricFailReason;
    IsPending: Boolean;
    IsSuccess: Boolean;
    Message: string;
    constructor Create(const AIsSuccess: Boolean; const AMessage: string; const AFailReason: TBiometricFailReason);
  end;

  TCustomBiometricService = class(TInterfacedObject)
  private
    FAuthenticateFailProc: TBiometricFailProc;
    FAuthenticateSuccessProc: TProc;
    FAuthenticationResult: TBiometricAuthenticationResult;
    FIsAuthenticating: Boolean;
    FIsBackground: Boolean;
    procedure ApplicationEventMessageHandler(const Sender: TObject; const M: TMessage);
    procedure AuthenticateFailed;
    procedure AuthenticateSuccessful;
    procedure HandleAuthenticationResult;
  protected
    procedure Authenticate(const ASuccessProc: TProc; const AFailProc: TBiometricFailProc);
    procedure DoAuthenticate; virtual;
    procedure DoAuthenticationResult(const AIsSuccess: Boolean; const AMessage: string = '';
      const AFailReason: TBiometricFailReason = TBiometricFailReason.Unknown);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  {$IF Defined(ANDROID)}
  FMX.BiometricAuth.Android,
  {$ENDIF}
  {$IF Defined(IOS)}
  FMX.BiometricAuth.iOS,
  {$ENDIF}
  FMX.Types;

{ TCustomBiometricAuth }

constructor TCustomBiometricAuth.Create(AOwner: TComponent);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXBiometricAuthService, FService);
end;

destructor TCustomBiometricAuth.Destroy;
begin
  FService := nil;
  inherited;
end;

procedure TCustomBiometricAuth.Cancel;
begin
  if FService <> nil then
    FService.Cancel;
end;

function TCustomBiometricAuth.CanAuthenticate: Boolean;
begin
  if FService <> nil then
  begin
    FService.SetBiometricStrengths(FBiometricStrengths);
    Result := FService.CanAuthenticate;
  end
  else
    Result := False;
end;

procedure TCustomBiometricAuth.BiometricAuthenticateFailHandler(const AFailReason: TBiometricFailReason; const AResultMessage: string);
begin
  if Assigned(FOnAuthenticateFail) then
    FOnAuthenticateFail(Self, AFailReason, AResultMessage);
end;

procedure TCustomBiometricAuth.BiometricAuthenticateSuccessHandler;
begin
  if Assigned(FOnAuthenticateSuccess) then
    FOnAuthenticateSuccess(Self);
end;

function TCustomBiometricAuth.GetBiometricAvailability: TBiometricAvailability;
begin
  if FService = nil then
    Result := TBiometricAvailability.Unsupported
  else
    Result := FService.GetBiometricAvailability;
end;

function TCustomBiometricAuth.GetBiometryKind: TBiometryKind;
begin
  if FService <> nil then
    Result := FService.GetBiometryKind
  else
    Result := TBiometryKind.None;
end;

function TCustomBiometricAuth.IsActive: Boolean;
begin
  Result := (FService <> nil) and FService.IsActive;
end;

function TCustomBiometricAuth.IsBiometryLockedOut: Boolean;
begin
  Result := (FService <> nil) and FService.IsBiometryLockedOut;
end;

function TCustomBiometricAuth.IsSupported: Boolean;
begin
  Result := (FService <> nil) and (FService.IsSupported);
end;

procedure TCustomBiometricAuth.Authenticate;
var
  LPromptProperties: TBiometricPromptProperties;
begin
  if FService <> nil then
  begin
    LPromptProperties.AllowedAttempts := FAllowedAttempts;
    LPromptProperties.CancelButtonText := FPromptCancelButtonText;
    LPromptProperties.IsConfirmationRequired:= FPromptConfirmationRequired;
    LPromptProperties.Description := FPromptDescription;
    LPromptProperties.Subtitle := FPromptSubtitle;
    LPromptProperties.Title := FPromptTitle;
    FService.SetPromptProperties(LPromptProperties);
    FService.SetBiometricStrengths(FBiometricStrengths);
    FService.SetReuseTime(FReuseTime);
    FService.Authenticate(BiometricAuthenticateSuccessHandler, BiometricAuthenticateFailHandler);
  end;
end;

{ TBiometricAuthenticationResult }

constructor TBiometricAuthenticationResult.Create(const AIsSuccess: Boolean; const AMessage: string; const AFailReason: TBiometricFailReason);
begin
  IsPending := True;
  IsSuccess := AIsSuccess;
  Message := AMessage;
  FailReason := AFailReason;
end;

{ TCustomBiometricService }

constructor TCustomBiometricService.Create;
begin
  inherited;
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventMessageHandler);
end;

destructor TCustomBiometricService.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TApplicationEventMessage, ApplicationEventMessageHandler);
  inherited;
end;

procedure TCustomBiometricService.ApplicationEventMessageHandler(const Sender: TObject; const M: TMessage);
begin
  case TApplicationEventMessage(M).Value.Event of
    TApplicationEvent.WillBecomeInactive:
      FIsBackground := True;
    TApplicationEvent.BecameActive:
    begin
      FIsBackground := False;
      if FAuthenticationResult.IsPending then
        HandleAuthenticationResult;
    end;
  end;
end;

procedure TCustomBiometricService.Authenticate(const ASuccessProc: TProc; const AFailProc: TBiometricFailProc);
begin
  if not FIsAuthenticating then
  begin
    FIsAuthenticating := True;
    FAuthenticateSuccessProc := ASuccessProc;
    FAuthenticateFailProc := AFailProc;
    DoAuthenticate;
  end;
end;

procedure TCustomBiometricService.AuthenticateFailed;
begin
  FIsAuthenticating := False;
  if Assigned(FAuthenticateFailProc) then
    FAuthenticateFailProc(FAuthenticationResult.FailReason, FAuthenticationResult.Message);
end;

procedure TCustomBiometricService.AuthenticateSuccessful;
begin
  FIsAuthenticating := False;
  if Assigned(FAuthenticateSuccessProc) then
    FAuthenticateSuccessProc;
end;

procedure TCustomBiometricService.DoAuthenticate;
begin
  // Implemented in descendants
end;

procedure TCustomBiometricService.DoAuthenticationResult(const AIsSuccess: Boolean; const AMessage: string = '';
  const AFailReason: TBiometricFailReason = TBiometricFailReason.Unknown);
begin
  FAuthenticationResult := TBiometricAuthenticationResult.Create(AIsSuccess, AMessage, AFailReason);
  if not FIsBackground then
    HandleAuthenticationResult;
end;

procedure TCustomBiometricService.HandleAuthenticationResult;
begin
  FAuthenticationResult.IsPending := False;
  if FAuthenticationResult.IsSuccess then
    AuthenticateSuccessful
  else
    AuthenticateFailed;
end;

initialization
  RegisterFmxClasses([TBiometricAuth]);
  GroupDescendentsWith(TBiometricAuth, TFmxObject);
{$IF Defined(IOS) OR Defined(ANDROID)}
  RegisterService;
{$ENDIF}

end.
