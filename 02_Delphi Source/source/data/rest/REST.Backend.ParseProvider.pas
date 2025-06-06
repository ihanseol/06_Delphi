{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$HPPEMIT LINKUNIT}
unit REST.Backend.ParseProvider;

interface

uses System.Classes, System.Generics.Collections, REST.Backend.Providers,
  REST.Backend.ParseAPI, REST.Client, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes;

type

  TCustomParseConnectionInfo = class(TComponent)
  public type
    TNotifyList = class
    private
      FList: TList<TNotifyEvent>;
      procedure Notify(Sender: TObject);
    public
      constructor Create;
      destructor Destroy; override;
      procedure Add(const ANotify: TNotifyEvent);
      procedure Remove(const ANotify: TNotifyEvent);
    end;
    TAndroidPush = class(TPersistent)
    private const
      cDefaultGCMAppID = '1076345567071';
    private
      FGCMAppID: string;
      FInstallationID: string;
      FHaveID: Boolean;
      procedure ReadBlank(Reader: TReader);
      procedure WriteBlank(Writer: TWriter);
      function GetGCMAppID: string;
      procedure SetGCMAppID(const Value: string);
      function GetInstallationID: string;
      procedure SetInstallationID(const Value: string);
      function IsGCMAppIDStored: Boolean;
    protected
      procedure AssignTo(AValue: TPersistent); override;
      procedure DefineProperties(Filer: TFiler); override;
    public
      constructor Create;
      class function NewInstallationID: string;
    published
      property GCMAppID: string read GetGCMAppID write SetGCMAppID stored IsGCMAppIDStored;
      property InstallationID: string read GetInstallationID write SetInstallationID stored True;
    end;
  private
    FBaseURL: string;
    FConnectionInfo: TParseApi.TConnectionInfo;
    FNotifyOnChange: TNotifyList;
    FAndroidPush: TAndroidPush;
    procedure SetApiVersion(const Value: string);
    procedure SetApplicationID(const Value: string);
    procedure SetRestApiKey(const Value: string);
    procedure SetMasterKey(const Value: string);
    function GetApiVersion: string;
    function GetRestApiKey: string;
    function GetMasterKey: string;
    function GetApplicationID: string;
    procedure SetAndroidPush(const Value: TAndroidPush);
    function GetProxyPassword: string;
    function GetProxyPort: integer;
    function GetProxyServer: string;
    function GetProxyUsername: string;
    procedure SetProxyPassword(const Value: string);
    procedure SetProxyPort(const Value: integer);
    procedure SetProxyServer(const Value: string);
    procedure SetProxyUsername(const Value: string);
    procedure SetBaseURL(const Value: string);
    function GetConnectTimeout: Integer;
    function GetReadTimeout: Integer;
    procedure SetConnectTimeout(const Value: Integer);
    procedure SetReadTimeout(const Value: Integer);
  protected
    procedure DoChanged; virtual;
    property NotifyOnChange: TNotifyList read FNotifyOnChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateApi(const AParseApi: TParseApi);
                                  
    property BaseURL: string read FBaseURL write SetBaseURL;
    property ApiVersion: string read GetApiVersion write SetApiVersion;
    property ApplicationID: string read GetApplicationID write SetApplicationID;
    property RestApiKey: string read GetRestApiKey write SetRestApiKey;
    property MasterKey: string read GetMasterKey write SetMasterKey;
    property AndroidPush: TAndroidPush read FAndroidPush write SetAndroidPush;
    property ProxyPassword: string read GetProxyPassword write SetProxyPassword;
    property ProxyPort: integer read GetProxyPort write SetProxyPort default 0;
    property ProxyServer: string read GetProxyServer write SetProxyServer;
    property ProxyUsername: string read GetProxyUsername write SetProxyUsername;
    property ConnectTimeout: Integer read GetConnectTimeout write SetConnectTimeout default CRestDefaultTimeout;
    property ReadTimeout: Integer read GetReadTimeout write SetReadTimeout default CRestDefaultTimeout;
  end;

  TCustomParseProvider = class(TCustomParseConnectionInfo, IBackendProvider)
  public const
    ProviderID = 'Parse';
  protected
    { IBackendProvider }
    function GetProviderID: string;
  end;

  TParseProvider = class(TCustomParseProvider)
  published
    property BaseURL;
    property ApiVersion;
    property ApplicationID;
    property RestApiKey;
    property MasterKey;
    // Parse/GCM not currently supported
    property AndroidPush;
    property ProxyPassword;
    property ProxyPort;
    property ProxyServer;
    property ProxyUsername;
    property ConnectTimeout;
    property ReadTimeout;
  end;

  TParseBackendService = class(TInterfacedObject)
  private
    FConnectionInfo: TCustomParseConnectionInfo;
    procedure SetConnectionInfo(const Value: TCustomParseConnectionInfo);
    procedure OnConnectionChanged(Sender: TObject);
  protected
    procedure DoAfterConnectionChanged; virtual;
    property ConnectionInfo: TCustomParseConnectionInfo read FConnectionInfo write SetConnectionInfo;
  public
    constructor Create(const AProvider: IBackendProvider); virtual;
    destructor Destroy; override;
  end;

  // Use to access TParseAPI from a component
  //
  // if Supports(BackendStorage1.ProviderService, IGetParseAPI, LIntf) then
  //    LParseAPI := LIntf.ParseAPI;
  IGetParseAPI = interface
    ['{9EFB309D-6A53-4F3B-8B7F-D9E7D92998E8}']
    function GetParseAPI: TParseAPI;
    property ParseAPI: TParseAPI read GetParseApi;
  end;

  TParseServiceAPI = class(TInterfacedObject, IBackendAPI, IGetParseAPI)
  private
    FParseAPI: TParseAPI;
    { IGetParseAPI }
    function GetParseAPI: TParseAPI;
  protected
    property ParseAPI: TParseAPI read FParseAPI;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TParseServiceAPIAuth = class(TParseServiceAPI, IBackendAuthenticationApi,
    IBackendAuthenticationExportApi)
  protected
    { IBackendAuthenticationApi }
    procedure Login(const ALogin: TBackendEntityValue);
    procedure Logout;
    procedure SetDefaultAuthentication(ADefaultAuthentication: TBackendDefaultAuthentication);
    function GetDefaultAuthentication: TBackendDefaultAuthentication;
    procedure SetAuthentication(AAuthentication: TBackendAuthentication);
    function GetAuthentication: TBackendAuthentication;
    { IBackendAuthenticationExportApi }
    function ExportLogin(const ALogin: TBackendEntityValue): string;
    function ImportLogin(const ALogin: string): TBackendEntityValue;
  end;

  TParseBackendService<TAPI: TParseServiceAPI, constructor> = class(TParseBackendService, IGetParseAPI)
  private
    FBackendAPI: TAPI;
    FBackendAPIIntf: IInterface;
    procedure ReleaseBackendApi;
    { IGetParseAPI }
    function GetParseAPI: TParseAPI;
  protected
    function CreateBackendApi: TAPI; virtual;
    procedure EnsureBackendApi;
    procedure DoAfterConnectionChanged; override;
    property BackendAPI: TAPI read FBackendAPI;
  end;

implementation

uses System.SysUtils, REST.Backend.ParseMetaTypes, System.TypInfo,
  REST.Backend.Consts, REST.Json;

{ TCustomParseProvider }

function TCustomParseProvider.GetProviderID: string;
begin
  Result := ProviderID;
end;

{ TCustomParseConnectionInfo }

constructor TCustomParseConnectionInfo.Create(AOwner: TComponent);
begin
  inherited;
  FBaseURL := TParseApi.cDefaultBaseURL;
  FConnectionInfo := TParseApi.TConnectionInfo.Create(TParseApi.cDefaultApiVersion, '');
  FNotifyOnChange := TNotifyList.Create;
  FAndroidPush := TAndroidPush.Create;
end;

destructor TCustomParseConnectionInfo.Destroy;
begin
  FAndroidPush.Free;
  inherited;
  FNotifyOnChange.Free;
end;

procedure TCustomParseConnectionInfo.DoChanged;
begin
  FNotifyOnChange.Notify(Self);
end;

function TCustomParseConnectionInfo.GetApiVersion: string;
begin
  Result := FConnectionInfo.ApiVersion;
end;

function TCustomParseConnectionInfo.GetApplicationID: string;
begin
  Result := FConnectionInfo.ApplicationID;
end;

function TCustomParseConnectionInfo.GetConnectTimeout: Integer;
begin
  Result := FConnectionInfo.ConnectTimeout;
end;

function TCustomParseConnectionInfo.GetReadTimeout: Integer;
begin
  Result := FConnectionInfo.ReadTimeout;
end;

function TCustomParseConnectionInfo.GetRestApiKey: string;
begin
  Result := FConnectionInfo.RestApiKey;
end;

function TCustomParseConnectionInfo.GetMasterKey: string;
begin
  Result := FConnectionInfo.MasterKey;
end;

function TCustomParseConnectionInfo.GetProxyPassword: string;
begin
  Result := FConnectionInfo.ProxyPassword;
end;

function TCustomParseConnectionInfo.GetProxyPort: integer;
begin
  Result := FConnectionInfo.ProxyPort;
end;

function TCustomParseConnectionInfo.GetProxyServer: string;
begin
  Result := FConnectionInfo.ProxyServer;
end;

function TCustomParseConnectionInfo.GetProxyUsername: string;
begin
  Result := FConnectionInfo.ProxyUsername;
end;

procedure TCustomParseConnectionInfo.SetAndroidPush(const Value: TAndroidPush);
begin
  FAndroidPush.Assign(Value);
end;

procedure TCustomParseConnectionInfo.SetApiVersion(const Value: string);
begin
  if Value <> ApiVersion then
  begin
    FConnectionInfo.ApiVersion := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetApplicationID(const Value: string);
begin
  if Value <> ApplicationID then
  begin
    FConnectionInfo.ApplicationID := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetBaseURL(const Value: string);
begin
  if Value <> BaseURL then
  begin
    FBaseURL := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetConnectTimeout(const Value: Integer);
begin
  if Value <> ConnectTimeout then
  begin
    FConnectionInfo.ConnectTimeout := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetReadTimeout(const Value: Integer);
begin
  if Value <> ReadTimeout then
  begin
    FConnectionInfo.ReadTimeout := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetRestApiKey(const Value: string);
begin
  if Value <> RestApiKey then
  begin
    FConnectionInfo.RestApiKey := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetMasterKey(const Value: string);
begin
  if Value <> MasterKey then
  begin
    FConnectionInfo.MasterKey := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetProxyPassword(const Value: string);
begin
  if Value <> ProxyPassword then
  begin
    FConnectionInfo.ProxyPassword := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetProxyPort(const Value: integer);
begin
  if Value <> ProxyPort then
  begin
    FConnectionInfo.ProxyPort := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetProxyServer(const Value: string);
begin
  if Value <> ProxyServer then
  begin
    FConnectionInfo.ProxyServer := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.SetProxyUsername(const Value: string);
begin
  if Value <> ProxyUsername then
  begin
    FConnectionInfo.ProxyUsername := Value;
    DoChanged;
  end;
end;

procedure TCustomParseConnectionInfo.UpdateApi(const AParseApi: TParseApi);
begin
  AParseApi.ConnectionInfo := FConnectionInfo;
  AParseApi.BaseURL := FBaseURL;
end;

{ TCustomParseConnectionInfo.TNotifyList }

procedure TCustomParseConnectionInfo.TNotifyList.Add(const ANotify: TNotifyEvent);
begin
  Assert(not FList.Contains(ANotify));
  if not FList.Contains(ANotify) then
    FList.Add(ANotify);
end;

constructor TCustomParseConnectionInfo.TNotifyList.Create;
begin
  FList := TList<TNotifyEvent>.Create;
end;

destructor TCustomParseConnectionInfo.TNotifyList.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TCustomParseConnectionInfo.TNotifyList.Notify(Sender: TObject);
var
  LProc: TNotifyEvent;
begin
  for LProc in FList do
    LProc(Sender);
end;

procedure TCustomParseConnectionInfo.TNotifyList.Remove(
  const ANotify: TNotifyEvent);
begin
  Assert(FList.Contains(ANotify));
  FList.Remove(ANotify);
end;

{ TParseServiceAPI }

constructor TParseServiceAPI.Create;
begin
  FParseAPI := TParseAPI.Create(nil);
end;

destructor TParseServiceAPI.Destroy;
begin
  FParseAPI.Free;
  inherited;
end;

function TParseServiceAPI.GetParseAPI: TParseAPI;
begin
  Result := FParseAPI;
end;

{ TParseBackendService<TAPI> }

function TParseBackendService<TAPI>.CreateBackendApi: TAPI;
begin
  Result := TAPI.Create;
  if ConnectionInfo <> nil then
    ConnectionInfo.UpdateAPI(Result.FParseAPI)
  else
    Result.FParseAPI.ConnectionInfo := TParseAPI.EmptyConnectionInfo;
end;

procedure TParseBackendService<TAPI>.EnsureBackendApi;
begin
  if FBackendAPI = nil then
  begin
    FBackendAPI := CreateBackendApi;
    FBackendAPIIntf := FBackendAPI; // Reference
  end;
end;

function TParseBackendService<TAPI>.GetParseAPI: TParseAPI;
begin
  EnsureBackendApi;
  if FBackendAPI <> nil then
    Result := FBackendAPI.FParseAPI
  else
    Result := nil;
end;

procedure TParseBackendService<TAPI>.ReleaseBackendApi;
begin
  FBackendAPI := nil;
  FBackendAPIIntf := nil;
end;

procedure TParseBackendService<TAPI>.DoAfterConnectionChanged;
begin
  ReleaseBackendApi;
end;

{ TParseBackendService }

constructor TParseBackendService.Create(const AProvider: IBackendProvider);
begin
  if AProvider is TCustomParseConnectionInfo then
    ConnectionInfo := TCustomParseConnectionInfo(AProvider)
  else
    raise EArgumentException.Create(sWrongProvider);
end;

destructor TParseBackendService.Destroy;
begin
  if Assigned(FConnectionInfo) then
    FConnectionInfo.NotifyOnChange.Remove(OnConnectionChanged);
  inherited;
end;

procedure TParseBackendService.DoAfterConnectionChanged;
begin
//
end;

procedure TParseBackendService.OnConnectionChanged(Sender: TObject);
begin
  DoAfterConnectionChanged;
end;

procedure TParseBackendService.SetConnectionInfo(
  const Value: TCustomParseConnectionInfo);
begin
  if FConnectionInfo <> nil then
    FConnectionInfo.NotifyOnChange.Remove(OnConnectionChanged);
  FConnectionInfo := Value;
  if FConnectionInfo <> nil then
    FConnectionInfo.NotifyOnChange.Add(OnConnectionChanged);
  OnConnectionChanged(Self);
end;

{ TCustomParseConnectionInfo.TAndroidProps }

procedure TCustomParseConnectionInfo.TAndroidPush.AssignTo(
  AValue: TPersistent);
begin
  if AValue is TAndroidPush then
  begin
    Self.FGCMAppID := TAndroidPush(AValue).FGCMAppID;
    Self.FInstallationID := TAndroidPush(AValue).FInstallationID
  end
  else
    inherited;
end;

constructor TCustomParseConnectionInfo.TAndroidPush.Create;
begin
  inherited Create;
end;

procedure TCustomParseConnectionInfo.TAndroidPush.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('BlankID', ReadBlank, WriteBlank,
    FInstallationID = '');
end;

function TCustomParseConnectionInfo.TAndroidPush.GetGCMAppID: string;
begin
  if FGCMAppID.IsEmpty then
    Result := cDefaultGCMAppID
  else
    Result := FGCMAppID;
end;

function TCustomParseConnectionInfo.TAndroidPush.GetInstallationID: string;
begin
  if not FHaveID then
  begin
    FHaveID := True;
    if FInstallationID = '' then
      FInstallationID := NewInstallationID;
  end;
  Result := FInstallationID;
end;

function TCustomParseConnectionInfo.TAndroidPush.IsGCMAppIDStored: Boolean;
begin
  Result := not FGCMAppID.IsEmpty;
end;

procedure TCustomParseConnectionInfo.TAndroidPush.WriteBlank(Writer: TWriter);
begin
  Writer.WriteBoolean(True);
end;

procedure TCustomParseConnectionInfo.TAndroidPush.ReadBlank(Reader: TReader);
begin
  Reader.ReadBoolean;
  FHaveID := True;
end;

procedure TCustomParseConnectionInfo.TAndroidPush.SetInstallationID(
  const Value: string);
begin
  FHaveID := True;
  FInstallationID := Value;
end;

procedure TCustomParseConnectionInfo.TAndroidPush.SetGCMAppID(const Value: string);
begin
  if not FGCMAppID.Equals(Value) then
    FGCMAppID := Value;
end;

{ TParseServiceAPIAuth }

function TParseServiceAPIAuth.GetAuthentication: TBackendAuthentication;
begin
  case ParseAPI.Authentication of
    TParseApi.TAuthentication.Default:
      Result := TBackendAuthentication.Default;
    TParseApi.TAuthentication.MasterKey:
      Result := TBackendAuthentication.Root;
    TParseApi.TAuthentication.APIKey:
       Result := TBackendAuthentication.Application;
   TParseApi.TAuthentication.Session:
       Result := TBackendAuthentication.Session;
  else
    Assert(False);
    Result := TBackendAuthentication.Default;
  end;
end;

function TParseServiceAPIAuth.GetDefaultAuthentication: TBackendDefaultAuthentication;
begin
  case ParseAPI.DefaultAuthentication of
    TParseApi.TDefaultAuthentication.APIKey:
      Result := TBackendDefaultAuthentication.Application;
    TParseApi.TDefaultAuthentication.MasterKey:
      Result := TBackendDefaultAuthentication.Root;
    TParseApi.TDefaultAuthentication.Session:
      Result := TBackendDefaultAuthentication.Session;
  else
    Assert(False);
    Result := TBackendDefaultAuthentication.Root;
  end;
end;

procedure TParseServiceAPIAuth.Login(const ALogin: TBackendEntityValue);
var
  LMetaLogin: TMetaLogin;
begin
  if ALogin.Data is TMetaLogin then
  begin
    LMetaLogin := TMetaLogin(ALogin.Data);
    ParseAPI.Login(LMetaLogin.Login);
  end
  else
    raise EArgumentException.Create(sParameterNotLogin); // Do not localize
end;

procedure TParseServiceAPIAuth.Logout;
begin
  ParseAPI.Logout;
end;

procedure TParseServiceAPIAuth.SetAuthentication(
  AAuthentication: TBackendAuthentication);
begin
  case AAuthentication of
    TBackendAuthentication.Default:
      ParseAPI.Authentication := TParseApi.TAuthentication.Default;
    TBackendAuthentication.Root:
      ParseAPI.Authentication := TParseApi.TAuthentication.MasterKey;
    TBackendAuthentication.Application:
      ParseAPI.Authentication := TParseApi.TAuthentication.APIKey;
    TBackendAuthentication.Session:
      ParseAPI.Authentication := TParseApi.TAuthentication.Session;
    TBackendAuthentication.None:
      ParseAPI.Authentication := TParseApi.TAuthentication.None;
    TBackendAuthentication.User:
      raise EParseAPIError.CreateFmt(sAuthenticationNotSupported, [
        System.TypInfo.GetEnumName(TypeInfo(TBackendAuthentication), Integer(AAuthentication))]);
  else
    Assert(False);
  end;

end;

procedure TParseServiceAPIAuth.SetDefaultAuthentication(
  ADefaultAuthentication: TBackendDefaultAuthentication);
begin
  case ADefaultAuthentication of
    TBackendDefaultAuthentication.Root:
      ParseAPI.DefaultAuthentication := TParseApi.TDefaultAuthentication.MasterKey;
    TBackendDefaultAuthentication.Application:
      ParseAPI.DefaultAuthentication := TParseApi.TDefaultAuthentication.APIKey;
    TBackendDefaultAuthentication.Session:
      ParseAPI.DefaultAuthentication := TParseApi.TDefaultAuthentication.Session;
    TBackendDefaultAuthentication.None:
      ParseAPI.DefaultAuthentication := TParseApi.TDefaultAuthentication.None;
    TBackendDefaultAuthentication.User:
      raise EParseAPIError.CreateFmt(sAuthenticationNotSupported, [
        System.TypInfo.GetEnumName(TypeInfo(TBackendDefaultAuthentication), Integer(ADefaultAuthentication))]);
  else
    Assert(False);
  end;
end;

function TParseServiceAPIAuth.ExportLogin(
  const ALogin: TBackendEntityValue): string;
begin
  if ALogin.Data is TMetaLoginUser then
    Result := TJson.ObjectToJsonString(ALogin.Data as TMetaLoginUser)
  else
    raise EArgumentException.Create(sParameterNotLogin);
end;

function TParseServiceAPIAuth.ImportLogin(
  const ALogin: string): TBackendEntityValue;
begin
  if ALogin.Trim.IsEmpty then
    raise EArgumentException.Create(sParameterNotLogin);
  try
    Result := TBackendEntityValue.Create(TJson.JsonToObject<TMetaLoginUser>(ALogin));
  except
    raise EArgumentException.Create(sParameterNotLogin);
  end;
end;

class function TCustomParseConnectionInfo.TAndroidPush.NewInstallationID: string;
var
  LGuid: TGuid;
begin
  CreateGUID(LGuid);
  Result := GUIDToString(LGuid);
  // Strip '{','}'
  Result := Result.Substring(1, Result.Length - 2);
end;

initialization
  TBackendProviders.Instance.Register(TCustomParseProvider.ProviderID, 'Parse'); // Do not localize
finalization
  TBackendProviders.Instance.UnRegister(TCustomParseProvider.ProviderID);
end.
