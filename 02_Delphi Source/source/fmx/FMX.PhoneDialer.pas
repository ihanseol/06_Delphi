{*******************************************************}
{                                                       }
{           Delphi FireMonkey Mobile Services           }
{                                                       }
{       Description of interface for phone dialer       }
{                                                       }
{ Copyright(c) 2012-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$IF Defined(IOS) OR Defined(ANDROID)}
{$HPPEMIT LINKUNIT}
{$ENDIF}
unit FMX.PhoneDialer;

interface

{$SCOPEDENUMS ON}

type

{ TCarrier }

  TCarrier = class;
  TOnCarrierChanged = procedure (ACarrier: TCarrier) of object;

  /// <summary>
  ///   This class obtains information about the user’s home cellular service provider, such as its unique
  ///   identifier and whether.
  /// </summary>
  TCarrier = class abstract
  strict private
    FOnCarrierChanged: TOnCarrierChanged;
  protected
    procedure DoCarrierChanged(const ACarrier: TCarrier); virtual;
  public
    /// <summary>Get ISO country code of the sim-operator. See: "http://en.wikipedia.org/wiki/ISO_3166-1"</summary>
    function GetIsoCountryCode: string; virtual; abstract;
    /// <summary>Get mobile Country Code (MCC). See: "http://en.wikipedia.org/wiki/Mobile_country_code"</summary>
    function GetMobileCountryCode: string; virtual; abstract;
    /// <summary>Get mobile Network Code (MNC). See: "http://en.wikipedia.org/wiki/Mobile_country_code</summary>"
    function GetMobileNetwork: string; virtual; abstract;
    /// <summary>Get carrier name.</summary>
    function GetCarrierName: string; virtual; abstract;
    /// <summary>Event of tracing of change of the operator.</summary>
    property OnCarrierChanged: TOnCarrierChanged read FOnCarrierChanged write FOnCarrierChanged;
  end;

{ TCall }

  TCallState = (None, Connected, Incoming, Dialing, Disconnected);

  { This class is uses for obtaining an identifier for the call and to determine the call’s state. }
  TCall = class abstract
  public
    function GetCallState: TCallState; virtual; abstract;
    function GetCallID: string; virtual; abstract;
  end;

  TCalls = array of TCall;

{ IFMXPhoneDialerService }

  TOnCallStateChanged = procedure (const ACallID: string; const AState: TCallState) of object;

  { Interface of Phone Dialer }
  IFMXPhoneDialerService = interface
  ['{61EE0E7A-7643-4966-873E-384CF798E694}']
    /// <summary>Make a call by specified number.</summary>
    function Call(const APhoneNumber: string): Boolean;
    /// <summary>Get current carrier. The object the Carrier is deleted automatically with deleting service.</summary>
    function GetCarrier: TCarrier;
    /// <summary>
    ///   Get all curtrent calls. If the current calls aren't present, the array will be empty. The developer shall
    ///   delete array cells after use.
    /// </summary>
    /// <remarks>
    ///   A user has to invoke <c>IFMXPhoneDialerListenerService.Start</c> and grant
    ///   "android.permission.READ_PHONE_NUMBERS" permission. Otherwise it will return nil.
    /// </remarks>
    function GetCurrentCalls: TCalls;
    /// <summary>Getter, Setter and property for work with event of tracing of state change of a call.</summary>
    function GetOnCallStateChanged: TOnCallStateChanged;
    procedure SetOnCallStateChanged(const AEvent: TOnCallStateChanged);
    /// <summary>The event is being invoked, when the device modem changes state.</summary>
    /// <remarks>
    ///   A user has to invoke <c>IFMXPhoneDialerListenerService.Start</c> and grant
    ///   "android.permission.READ_PHONE_NUMBERS" permission. Otherwise it will return nil.
    /// </remarks>
    property OnCallStateChanged: TOnCallStateChanged read GetOnCallStateChanged write SetOnCallStateChanged;
  end;

  /// <summary>Service for tracking changes in the state of the phone system service (Calls, Carrier, CallState).</summary>
  /// <remarks>Depending on the platform, to work with the modem, you must first request the appropriate permissions.</remarks>
  IFMXPhoneDialerListenerService = interface
  ['{3F00F2D8-9E6A-4F55-9AE5-AA879D5FC9B4}']
    procedure Start;
    procedure Stop;
  end;

{ TPhoneDialerService }

  TPhoneDialerService = class abstract (TInterfacedObject, IFMXPhoneDialerService)
  strict private
    FOnCallStateChanged: TOnCallStateChanged;
    function GetOnCallStateChanged: TOnCallStateChanged;
    procedure SetOnCallStateChanged(const AEvent: TOnCallStateChanged);
  protected
    procedure DoCallStateChanged(const ACallID: string; const AState: TCallState); virtual;
  public
    function Call(const APhoneNumber: string): Boolean; virtual; abstract;
    function GetCarrier: TCarrier; virtual; abstract;
    function GetCurrentCalls: TCalls; virtual; abstract;
    property OnCallStateChanged: TOnCallStateChanged read GetOnCallStateChanged write SetOnCallStateChanged;
  end;

implementation

uses
{$IFDEF IOS}
  FMX.PhoneDialer.iOS,
{$ENDIF}
{$IFDEF ANDROID}
  FMX.PhoneDialer.Android,
{$ENDIF}
  System.TypInfo;

{ TPhoneDialerService }

procedure TPhoneDialerService.DoCallStateChanged(const ACallID: string; const AState: TCallState);
begin
  if Assigned(FOnCallStateChanged) then
    FOnCallStateChanged(ACallID, AState);
end;

function TPhoneDialerService.GetOnCallStateChanged: TOnCallStateChanged;
begin
  Result := FOnCallStateChanged;
end;

procedure TPhoneDialerService.SetOnCallStateChanged(const AEvent: TOnCallStateChanged);
begin
  FOnCallStateChanged := AEvent;
end;

{ TCarrier }

procedure TCarrier.DoCarrierChanged(const ACarrier: TCarrier);
begin
  if Assigned(FOnCarrierChanged) then
    FOnCarrierChanged(ACarrier);
end;

initialization
{$IF Defined(IOS) OR Defined(ANDROID)}
  RegisterPhoneDialerService;
{$ENDIF}
end.
