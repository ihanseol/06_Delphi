{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{        All rights reserved                            }
{                                                       }
{*******************************************************}

unit FMX.BiometricAuth.iOS;

interface

procedure RegisterService;
procedure UnRegisterService;

implementation

uses
  System.Classes, System.SysUtils, iOSapi.Foundation, iOSapi.LocalAuthentication, Macapi.Helpers, FMX.Types, FMX.Platform, FMX.BiometricAuth,
  FMX.Consts;

type
  TiOSBiometricService = class(TCustomBiometricService, IFMXBiometricAuthService)
  private
    class function CheckBiometry: NSError;
  private
    FContext: LAContext;
    FPromptProperties: TBiometricPromptProperties;
    procedure AuthenticateReplyHandler(success: Boolean; error: NSError);
    procedure ExtractFailReason(error: NSError; var AFailReason: TBiometricFailReason; var AMessage: string);
    procedure ReleaseContext;
  protected
    procedure DoAuthenticate; override;
  public
    { IFMXBiometricAuthService }
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
  public
    constructor Create;
    destructor Destroy; override;
  end;

procedure RegisterService;
begin
  TPlatformServices.Current.AddPlatformService(IFMXBiometricAuthService, TiOSBiometricService.Create);
end;

procedure UnRegisterService;
begin
  if TPlatformServices.Current <> nil then
    TPlatformServices.Current.RemovePlatformService(IFMXBiometricAuthService);
end;

{ TiOSBiometricService }

constructor TiOSBiometricService.Create;
begin
  inherited;
  //
end;

destructor TiOSBiometricService.Destroy;
begin
  ReleaseContext;
  inherited;
end;

function TiOSBiometricService.GetBiometryKind: TBiometryKind;
var
  LContext: LAContext;
begin
  Result := TBiometryKind.None;
  LContext := TLAContext.Create;
  if LContext.canEvaluatePolicy(LAPolicyDeviceOwnerAuthentication, nil) then
  begin
    case LContext.biometryType of
      LABiometryTypeFaceID:
        Result := TBiometryKind.Face;
      LABiometryTypeTouchID:
        Result := TBiometryKind.Touch;
    end;
  end;
end;

function TiOSBiometricService.CanAuthenticate: Boolean;
var
  LContext: LAContext;
begin
  LContext := TLAContext.Create;
  Result := LContext.canEvaluatePolicy(LAPolicyDeviceOwnerAuthentication, nil);
end;

class function TiOSBiometricService.CheckBiometry: NSError;
var
  LPointer: Pointer;
  LContext: LAContext;
begin
  LContext := TLAContext.Create;
  LContext.canEvaluatePolicy(LAPolicyDeviceOwnerAuthentication, @LPointer);
  Result := TNSError.Wrap(LPointer);
end;

function TiOSBiometricService.IsSupported: Boolean;
var
  LError: NSError;
begin
  Result := False;
  if TOSVersion.Check(8) then
  begin
    LError := CheckBiometry;
    Result := (LError = nil) or (LError.code = 0);
  end;
end;

procedure TiOSBiometricService.ReleaseContext;
begin
  if FContext <> nil then
    FContext.release;
  FContext := nil;
end;

function TiOSBiometricService.GetBiometricAvailability: TBiometricAvailability;
begin
  Result := TBiometricAvailability.Unknown;
end;

procedure TiOSBiometricService.SetBiometricStrengths(const AStrengths: TBiometricStrengths);
begin
  // Does not apply to iOS
end;

procedure TiOSBiometricService.SetPromptProperties(const AProperties: TBiometricPromptProperties);
begin
  FPromptProperties := AProperties;
end;

function TiOSBiometricService.IsActive: Boolean;
begin
  Result := FContext <> nil;
end;

procedure TiOSBiometricService.ExtractFailReason(error: NSError; var AFailReason: TBiometricFailReason; var AMessage: string);
begin
  AMessage := '';
  AFailReason := TBiometricFailReason.Unknown;
  case error.code of
    // User resolvable conditions (possibly)
    LAErrorTouchIDNotEnrolled, LAErrorTouchIDLockout, LAErrorPasscodeNotSet, LAErrorAuthenticationFailed:
    begin
      AFailReason := TBiometricFailReason.Denied;
    end;
    LAErrorUserCancel:
      AFailReason := TBiometricFailReason.Cancelled;
    LAErrorUserFallback:
      AFailReason := TBiometricFailReason.Fallback;
    LAErrorInvalidContext:
    begin
      AFailReason := TBiometricFailReason.Error;
      AMessage := Format(SBiometricErrorSystemError, [SBiometricErrorSystemErrorInvalidContext]);
    end;
    LAErrorSystemCancel:
    begin
      AFailReason := TBiometricFailReason.Error;
      AMessage := Format(SBiometricErrorSystemError, [SBiometricErrorSystemErrorCancelledBySystem]);
    end;
    LAErrorTouchIDNotAvailable:
    begin
      AFailReason := TBiometricFailReason.Error;
      AMessage := SBiometricErrorNotAvailable;
    end;
  end;
end;

procedure TiOSBiometricService.AuthenticateReplyHandler(success: Boolean; error: NSError);
var
  LFailReason: TBiometricFailReason;
  LMessage: string;
begin
  ReleaseContext;
  if not success then
  begin
    LFailReason := TBiometricFailReason.Error;
    ExtractFailReason(error, LFailReason, LMessage);
    DoAuthenticationResult(False, LMessage, LFailReason);
  end
  else
    DoAuthenticationResult(True);
end;

procedure TiOSBiometricService.DoAuthenticate;
begin
  ReleaseContext;
  FContext := TLAContext.Create;
  if FContext.canEvaluatePolicy(LAPolicyDeviceOwnerAuthentication, nil) then
    FContext.evaluatePolicy(LAPolicyDeviceOwnerAuthentication, StrToNSStr(FPromptProperties.Title), AuthenticateReplyHandler)
  else
  begin
    ReleaseContext;
    DoAuthenticationResult(False, SBiometricErrorCannotAuthenticate, TBiometricFailReason.Error);
  end;
end;

procedure TiOSBiometricService.Cancel;
begin
  if TOSVersion.Check(9) and (FContext<> nil) then
  begin
    FContext.invalidate;
    ReleaseContext;
  end;
end;

function TiOSBiometricService.IsBiometryLockedOut: Boolean;
var
  LError: NSError;
begin
  Result := False;
  LError := CheckBiometry;
  if LError <> nil then
    Result := LError.code = LAErrorTouchIDLockout;
end;

procedure TiOSBiometricService.SetReuseTime(const AInterval: Double);
var
  LContext: LAContext;
begin
  LContext := TLAContext.Create;
  LContext.setTouchIDAuthenticationAllowableReuseDuration(AInterval);
end;

end.
