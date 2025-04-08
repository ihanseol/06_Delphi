{*******************************************************}
{                                                       }
{           Delphi FireMonkey Mobile Services           }
{                                                       }
{     Implementation of interface for phone dialer      }
{                                                       }
{ Copyright(c) 2012-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.PhoneDialer.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterPhoneDialerService;
procedure UnregisterPhoneDialerService;

implementation

uses
  System.SysUtils, System.Generics.Collections, System.Math, System.NetEncoding, System.Permissions, System.RTLConsts,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Telephony, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Net,
  Androidapi.JNIBridge, Androidapi.JNI.Os, Androidapi.JNI.Provider, Androidapi.Helpers, Androidapi.JNI.Support,
  Androidapi.JNI.Embarcadero, FMX.Consts, FMX.Platform, FMX.PhoneDialer, FMX.Helpers.Android, FMX.Types;

type

{ TAndroidCall }

  TAndroidCall = class(TCall)
  private
    FCallID: string;
    FCallState: TCallState;
  protected
    procedure UpdateCallState(const ACallState: TCallState);
  public
    constructor Create(const ACallID: string; const ACallState: TCallState);
    function GetCallState: TCallState; override;
    function GetCallID: string; override;
  end;

  TAndroidCalls = TObjectList<TAndroidCall>;

{ TAndroidCarrier }

  TAndroidCarrier = class(TCarrier)
  private
    FTelephonyManager: JTelephonyManager;
  public
    constructor Create(const ATelephonyManager: JTelephonyManager);
    destructor Destroy; override;
    function GetIsoCountryCode: string; override;
    function GetMobileCountryCode: string; override;
    function GetMobileNetwork: string; override;
    function GetCarrierName: string; override;
  end;

{ TAndroidPhoneDialerService }

  TAndroidPhoneAction = (Call, Listener);

  TAndroidPhoneDialerService = class abstract(TPhoneDialerService, IFMXPhoneDialerListenerService)
  private
    type
      { TAndroidPhoneStateListener }

      TAndroidPhoneStateListener = class(TJavaLocal, JPhoneDialerListener)
      private
        [Weak] FService: TAndroidPhoneDialerService;
        FCalls: TAndroidCalls;
        FLastRingNumber: string;
        FLastActiveCallNumber: string;
      public
        constructor Create(const AService: TAndroidPhoneDialerService);
        destructor Destroy; override;
        procedure onCallStateChanged(State: Integer; IncomingNumber: JString); cdecl;
        procedure onServiceStateChanged(P1: JServiceState); cdecl;

        function GetIndexOfCall(const ANumber: string): Integer;
        function GetCallCount: Integer;
        function AddCall(const CallState: TCallState; const IncomingNumber: string): Integer;
        procedure RemoveCall(const IncomingNumber: string);
      public
        property Calls: TAndroidCalls read FCalls;
        property CallCount: Integer read GetCallCount;
      end;
  private
    FCarrier: TAndroidCarrier;
    FCallLogs: JCallLog_Calls;
    FWasStarted: Boolean;
    FDialingNumber: string;
    FPhoneStateListener: TAndroidPhoneStateListener;
  protected
    FTelephonyManager: JTelephonyManager;

    procedure DoStateCallChanged(const ACall: TAndroidCall);
    procedure DoStateServiceChanged;
    procedure DialingNumberWasStopped;
    procedure DoStart; virtual; abstract;
    procedure DoStop; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;

    function IsPermissionGranted(const AAction: TAndroidPhoneAction): Boolean;

    { IFMXPhoneDialerService }
    function Call(const APhoneNumber: string): Boolean; override;
    function GetCurrentCalls: TCalls; override;
    function GetCarrier: TCarrier; override;

    { IFMXPhoneDialerListenerService }
    procedure Start;
    procedure Stop;
  public
    property DialingNumber: string read FDialingNumber;
  end;

  TAndroidPhoneDialerServiceAPI1 = class(TAndroidPhoneDialerService)
  private
    FListener: JForwardingPhoneStateListener;
  protected
    procedure DoStart; override;
    procedure DoStop; override;
  end;

  TAndroidPhoneDialerServiceAPI31 = class(TAndroidPhoneDialerService)
  private
    FCallback: JForwardingTelephonyCallback;
  protected
    procedure DoStart; override;
    procedure DoStop; override;
  end;

{$REGION 'Android - Delphi Helpers'}

function AndroidCallStateToTCallState(const ACallState: Integer): TCallState;
begin
  if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_OFFHOOK then
    Result := TCallState.Connected
  else if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_RINGING then
    Result := TCallState.Incoming
  else if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_IDLE then
    Result := TCallState.Disconnected
  else
    Result := TCallState.None;
end;

{$ENDREGION}

procedure RegisterPhoneDialerService;
var
  Service: TAndroidPhoneDialerService;
  TelephonyServiceNative: JObject;
begin
  if TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_TELEPHONY) then
  begin
    TelephonyServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
    if TelephonyServiceNative <> nil then
    begin
      if TOSVersion.Check(12, 0) then
        Service := TAndroidPhoneDialerServiceAPI31.Create
      else
        Service := TAndroidPhoneDialerServiceAPI1.Create;
      TPlatformServices.Current.AddPlatformService(IFMXPhoneDialerService, Service);
      TPlatformServices.Current.AddPlatformService(IFMXPhoneDialerListenerService, Service);
    end;
  end;
end;

procedure UnregisterPhoneDialerService;
begin
  if TPlatformServices.Current <> nil then
  begin
    TPlatformServices.Current.RemovePlatformService(IFMXPhoneDialerListenerService);
    TPlatformServices.Current.RemovePlatformService(IFMXPhoneDialerService);
  end;
end;

{ TAndroidPhoneDialerService.TAndroidPhoneStateListener }

constructor TAndroidPhoneDialerService.TAndroidPhoneStateListener.Create(const AService: TAndroidPhoneDialerService);
begin
  inherited Create;
  FCalls := TObjectList<TAndroidCall>.Create;
  FService := AService;
  FLastRingNumber := string.Empty;
  FLastActiveCallNumber := string.Empty;
end;

destructor TAndroidPhoneDialerService.TAndroidPhoneStateListener.Destroy;
begin
  inherited;
  FreeAndNil(FCalls);
end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.GetCallCount: Integer;
begin
  Result := FCalls.Count;
end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.GetIndexOfCall(const ANumber: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  // get index of the stored call
  for I := 0 to FCalls.Count - 1 do
    if FCalls.Items[I].GetCallID = ANumber then
    begin
      Result := I;
      Exit;
    end;
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.RemoveCall(const IncomingNumber: string);
var
  LItem: TAndroidCall;
begin
  for LItem in FCalls do
    if LItem.GetCallID = IncomingNumber then
      FCalls.Remove(LItem);
end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.AddCall(const CallState: TCallState;
  const IncomingNumber: string): Integer;
begin
  Result := FCalls.Add(TAndroidCall.Create(IncomingNumber, CallState));
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onCallStateChanged(State: Integer; IncomingNumber: JString);
var
  I: Integer;
  TempIndex: Integer;
  LastRingIndex: Integer;
  LastCallIndex: Integer;
  DialingIndex: Integer;
begin
  if State = TJTelephonyManager.JavaClass.CALL_STATE_RINGING then
  begin // add call state in the call list
    if JStringToString(IncomingNumber) <> '' then
    begin
      // get incoming number
      FLastRingNumber := JStringToString(IncomingNumber);
      // add call into the array
      TempIndex := AddCall(AndroidCallStateToTCallState(State), FLastRingNumber);

      // not found call number (accepted last ringing number)
      if (FService <> nil) and (FService.DialingNumber <> '') then
      begin
        // update dialing number state from dialing to connected
        DialingIndex := GetIndexOfCall(FService.DialingNumber);
        if DialingIndex <> -1 then
        begin
          FCalls.Items[DialingIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          FService.DialingNumberWasStopped;
        end;
      end;

      // callback
      if (FService <> nil) and (TempIndex > -1) and (TempIndex < CallCount) then
        FService.DoStateCallChanged(FCalls[TempIndex]);
    end;
  end // end CALL_STATE_RINGING
  else
  if State = TJTelephonyManager.JavaClass.CALL_STATE_OFFHOOK then
  begin // update call state as active
    // get index of the stored call
    TempIndex := GetIndexOfCall(JStringToString(IncomingNumber));
    // found incoming number (Canceled number)
    if TempIndex > -1 then
    begin
      FLastActiveCallNumber := JStringToString(IncomingNumber);
      // update call state
      FCalls.Items[TempIndex].UpdateCallState(TCallState.Disconnected);
      // callback
      if FService <> nil then
        FService.DoStateCallChanged(FCalls[TempIndex]);
      // remove incoming call
      RemoveCall(FLastActiveCallNumber);
    end
    else
    begin // not found call number (accepted last ringing number)
      if (FService <> nil) and (FService.DialingNumber <> '') then
      begin
        // add calling number
        LastRingIndex := AddCall(TCallState.Dialing, FService.DialingNumber);
      end
      else
      begin
        // change last ringing number
        LastRingIndex := GetIndexOfCall(FLastRingNumber);
        // if is a valid call index
        if InRange(LastRingIndex, 0, CallCount - 1) then
        begin
          // update call state from incoming to connected
          FCalls.Items[LastRingIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          FLastActiveCallNumber := FCalls.Items[LastRingIndex].GetCallID;
        end;
      end;
      // callback
      if (FService <> nil) and (LastRingIndex > -1) and (LastRingIndex < CallCount) then
        FService.DoStateCallChanged(FCalls.Items[LastRingIndex]);
    end; // end if TempIndex > -1
  end  // end CALL_STATE_OFFHOOK
  else
  if State = TJTelephonyManager.JavaClass.CALL_STATE_IDLE then
  begin // remove call from the active list
    // get index of the stored call
    TempIndex := GetIndexOfCall(JStringToString(IncomingNumber));

    // found incoming call stored (Canceled call)
    if TempIndex > -1 then
    begin
      // update call state
      FCalls.Items[TempIndex].UpdateCallState(AndroidCallStateToTCallState(State));
      // callback
      if FService <> nil then
        FService.DoStateCallChanged(FCalls.Items[TempIndex]);
      // remove dialed number
      RemoveCall(JStringToString(IncomingNumber));
    end
    else
    begin // not found call number
      if (FService <> nil) and (FService.DialingNumber <> '') then
      begin
        // get last active dialed number
        LastCallIndex := GetIndexOfCall(FService.DialingNumber);
        // if is a valid call index
        if InRange(LastCallIndex, 0, CallCount - 1) then
        begin
          // update dialed state to connected
          FCalls.Items[LastCallIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          // callback
          FService.DoStateCallChanged(FCalls.Items[LastCallIndex]);
          // remove dialed number
          RemoveCall(FService.DialingNumber);
          FService.DialingNumberWasStopped;
        end;
      end
      else
      if FLastActiveCallNumber <> '' then
      begin
        // get last active incoming number
        LastCallIndex := GetIndexOfCall(FLastActiveCallNumber);
        // if is a valid call index
        if InRange(LastCallIndex, 0, CallCount - 1) then
        begin
          // update incoming call state to connected
          FCalls.Items[LastCallIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          // callback
          if FService <> nil then
            FService.DoStateCallChanged(FCalls.Items[LastCallIndex]);
          // remove called number
          RemoveCall(FLastActiveCallNumber);
        end;
      end;
    end;  // end if TempIndex > -1

    // remove remaining calls
    for I := FCalls.Count - 1 downto 0 do
    begin
      // callback
      if FService <> nil then
      begin
        FCalls.Items[I].UpdateCallState(AndroidCallStateToTCallState(State));
        FService.DoStateCallChanged(FCalls.Items[I]);
      end;
      RemoveCall(FCalls.Items[I].GetCallID);
    end;

    FCalls.Clear;
    FLastRingNumber := string.Empty;
    FLastActiveCallNumber := string.Empty;
  end; // end CALL_STATE_IDLE
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onServiceStateChanged(P1: JServiceState);
begin
  if P1.getState = TJServiceState.JavaClass.STATE_IN_SERVICE then
    FService.DoStateServiceChanged;

  if P1.getState = TJServiceState.JavaClass.STATE_OUT_OF_SERVICE then
    FService.DoStateServiceChanged;
end;

{ TAndroidCarrier }

constructor TAndroidCarrier.Create(const ATelephonyManager: JTelephonyManager);
begin
  if ATelephonyManager = nil then
    raise EArgumentException.CreateFmt(SParamIsNil, [ATelephonyManager]);
  FTelephonyManager := ATelephonyManager;
end;

destructor TAndroidCarrier.Destroy;
begin
  FTelephonyManager := nil;
  inherited;
end;

function TAndroidCarrier.GetCarrierName: string;
begin
  Result := JStringToString(FTelephonyManager.getNetworkOperatorName);
end;

function TAndroidCarrier.GetIsoCountryCode: string;
begin
  Result := JStringToString(FTelephonyManager.getNetworkCountryIso);
end;

function TAndroidCarrier.GetMobileCountryCode: string;
var
  MCCAndMNC: string;
begin
  MCCAndMNC := JStringToString(FTelephonyManager.getNetworkOperator);
  Result := MCCAndMNC.Substring(0, 3);
end;

function TAndroidCarrier.GetMobileNetwork: string;
var
  MCCAndMNC: string;
begin
  MCCAndMNC := JStringToString(FTelephonyManager.getNetworkOperator);
  Result := MCCAndMNC.Substring(3);
end;

{ TAndroidPhoneDialerService }

function TAndroidPhoneDialerService.IsPermissionGranted(const AAction: TAndroidPhoneAction): Boolean;

  function IsPermissionGranted(const APermission: JString): Boolean;
  begin
    Result := PermissionsService.IsPermissionGranted(JStringToString(APermission));
  end;

begin
  case AAction of
    TAndroidPhoneAction.Call:
      Result := IsPermissionGranted(TJManifest_permission.JavaClass.CALL_PHONE);
    TAndroidPhoneAction.Listener:
      Result := IsPermissionGranted(TJManifest_permission.JavaClass.READ_PHONE_STATE);
  else
    Result := False;
  end;
end;

function TAndroidPhoneDialerService.Call(const APhoneNumber: string): Boolean;
var
  PhoneUrl: Jnet_Uri;
  Intent: JIntent;
begin
  if not IsPermissionGranted(TAndroidPhoneAction.Call) then
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent, ['CALL_PHONE']);

  FDialingNumber := APhoneNumber.Replace('#', TNetEncoding.URL.Encode('#'));
  PhoneUrl := StrToJURI(Format('tel:%s', [FDialingNumber]));
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_CALL, PhoneUrl);
  TAndroidHelper.Context.startActivity(Intent);
  Result := FTelephonyManager <> nil;
end;

constructor TAndroidPhoneDialerService.Create;
var
  TelephonyServiceNative: JObject;
begin
  TelephonyServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if TelephonyServiceNative = nil then
    raise EArgumentException.CreateFmt(SParamIsNil, ['TELEPHONY_SERVICE']);
  FTelephonyManager := TJTelephonyManager.Wrap(TelephonyServiceNative);
  FCarrier := TAndroidCarrier.Create(FTelephonyManager);
  FDialingNumber := string.Empty;

  if IsPermissionGranted(TAndroidPhoneAction.Listener) then
    Start;
end;

procedure TAndroidPhoneDialerService.Start;
begin
  if FWasStarted then
    Exit;

  if IsPermissionGranted(TAndroidPhoneAction.Listener) then
  begin
    FPhoneStateListener := TAndroidPhoneStateListener.Create(Self);
    DoStart;
    FWasStarted := True;
  end
  else
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent, ['READ_PHONE_STATE']);
end;

procedure TAndroidPhoneDialerService.Stop;
begin
  DoStop;
  FreeAndNil(FPhoneStateListener);
  FWasStarted := False;
end;

destructor TAndroidPhoneDialerService.Destroy;
begin
  Stop;
  FreeAndNil(FCarrier);
  FTelephonyManager := nil;
  FCallLogs := nil;
  inherited;
end;

procedure TAndroidPhoneDialerService.DialingNumberWasStopped;
begin
  FDialingNumber := string.Empty;
end;

procedure TAndroidPhoneDialerService.DoStateCallChanged(const ACall: TAndroidCall);
begin
  DoCallStateChanged(ACall.GetCallID, ACall.GetCallState);
end;

procedure TAndroidPhoneDialerService.DoStateServiceChanged;
begin
  FCarrier.DoCarrierChanged(FCarrier);
end;

function TAndroidPhoneDialerService.GetCarrier: TCarrier;
begin
  Result := FCarrier;
end;

function TAndroidPhoneDialerService.GetCurrentCalls: TCalls;
var
  I: Integer;
begin
  if (FPhoneStateListener = nil) or (FPhoneStateListener.Calls <> nil) then
    Exit(nil);

  SetLength(Result, FPhoneStateListener.CallCount);
  for I := 0 to FPhoneStateListener.CallCount - 1 do
    Result[I] := FPhoneStateListener.Calls[I];
end;

{ TAndroidPhoneDialerServiceAPI1 }

procedure TAndroidPhoneDialerServiceAPI1.DoStart;
begin
  FListener := TJForwardingPhoneStateListener.JavaClass.init(FPhoneStateListener);
  FTelephonyManager.listen(FListener,
                           TJPhoneStateListener.JavaClass.LISTEN_CALL_STATE or
                           TJPhoneStateListener.JavaClass.LISTEN_SERVICE_STATE);
end;

procedure TAndroidPhoneDialerServiceAPI1.DoStop;
begin
  if FListener <> nil then
  begin
    FTelephonyManager.listen(FListener, TJPhoneStateListener.JavaClass.LISTEN_NONE);
    FListener := nil;
  end;
end;

{ TAndroidPhoneDialerServiceAPI31 }

procedure TAndroidPhoneDialerServiceAPI31.DoStart;
begin
  FCallback := TJForwardingTelephonyCallback.JavaClass.init(FPhoneStateListener);
  FTelephonyManager.registerTelephonyCallback(TAndroidHelper.Context.getMainExecutor, FCallback);
end;

procedure TAndroidPhoneDialerServiceAPI31.DoStop;
begin
  if FCallback <> nil then
  begin
    FTelephonyManager.unregisterTelephonyCallback(FCallback);
    FCallback := nil;
  end;
end;

{ TAndroidCall }

constructor TAndroidCall.Create(const ACallID: string; const ACallState: TCallState);
begin
  FCallID := ACallID;
  FCallState := ACallState;
end;

function TAndroidCall.GetCallID: string;
begin
  Result := FCallID;
end;

function TAndroidCall.GetCallState: TCallState;
begin
  Result := FCallState;
end;

procedure TAndroidCall.UpdateCallState(const ACallState: TCallState);
begin
  FCallState := ACallState;
end;

end.

