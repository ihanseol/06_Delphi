{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit REST.Backend.EMSProvider;

interface

uses System.Classes, System.SysUtils, System.Generics.Collections, REST.Backend.Providers,
  REST.Backend.EMSAPI, REST.Client, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes, System.Net.URLClient;

type

  TCustomEMSConnectionInfo = class(TComponent)
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

    TProtocolNames = record
    public const
      HTTP = 'http';
      HTTPS = 'https';
    end;

    TAndroidPush = class(TPersistent)
    private
      FOwner: TCustomEMSConnectionInfo;
      FGCMAppID: string;
      procedure SetGCMAppID(const Value: string);
    protected
      procedure AssignTo(AValue: TPersistent); override;
    published
      property GCMAppID: string read FGCMAppID write SetGCMAppID;
    end;

  private
    FConnectionInfo: TEMSClientAPI.TConnectionInfo;
    FNotifyOnChange: TNotifyList;
    FURLBasePath: string;
    FURLPort: Integer;
    FURLHost: string;
    FURLProtocol: string;
    FAndroidPush: TAndroidPush;
    FOnValidateCertificate: TValidateCertificateEvent;
    FOnNeedClientCertificate: TNeedClientCertificateEvent;
    procedure SetApiVersion(const Value: string);
    procedure SetAppSecret(const Value: string);
    procedure SetMasterSecret(const Value: string);
    function GetApiVersion: string;
    function GetAppSecret: string;
    function GetMasterSecret: string;
    function GetPassword: string;
    function GetLoginResource: string;
    function GetUserName: string;
    procedure SetLoginResource(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    function GetProxyPassword: string;
    function GetProxyPort: integer;
    function GetProxyServer: string;
    function GetProxyUsername: string;
    procedure SetProxyPassword(const Value: string);
    procedure SetProxyPort(const Value: integer);
    procedure SetProxyServer(const Value: string);
    procedure SetProxyUsername(const Value: string);
    function GetBaseURL: string;
    function IsURLProtocolStored: Boolean;
    procedure SetURLProtocol(const Value: string);
    procedure SetURLBasePath(const Value: string);
    procedure SetURLHost(const Value: string);
    procedure SetURLPort(const Value: Integer);
    function GetApplicationId: string;
    procedure SetApplicationId(const Value: string);
    procedure SetAndroidPush(const Value: TAndroidPush);
    procedure SetOnValidateCertificate(const Value: TValidateCertificateEvent);
    procedure SetOnNeedClientCertificate(const Value: TNeedClientCertificateEvent);
    function GetTenantId: string;
    procedure SetTenantId(const Value: string);
    function GetTenantSecret: string;
    procedure SetTenantSecret(const Value: string);
    function GetConnectTimeout: Integer;
    function GetReadTimeout: Integer;
    procedure SetConnectTimeout(const Value: Integer);
    procedure SetReadTimeout(const Value: Integer);
    function GetSqidsAlphabet: string;
    function GetSqidsMinLength: Integer;
    procedure SetSqidsAlphabet(const Value: string);
    procedure SetSqidsMinLength(const Value: Integer);
  protected
    procedure DoChanged; virtual;
    property NotifyOnChange: TNotifyList read FNotifyOnChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateApi(const AApi: TEMSClientAPI);
    procedure AppHandshake(const ACallback: TEMSClientAPI.TAppHandshakeProc);
    procedure CheckURL;

    property URLProtocol: string read FURLProtocol write SetURLProtocol stored IsURLProtocolStored nodefault;
    property URLHost: string read FURLHost write SetURLHost;
    property URLPort: Integer read FURLPort write SetURLPort;
    property URLBasePath: string read FURLBasePath write SetURLBasePath;
    property OnValidateCertificate: TValidateCertificateEvent read FOnValidateCertificate write SetOnValidateCertificate;
    property OnNeedClientCertificate: TNeedClientCertificateEvent read FOnNeedClientCertificate write SetOnNeedClientCertificate;
    property AndroidPush: TAndroidPush read FAndroidPush write SetAndroidPush;
    property ApiVersion: string read GetApiVersion write SetApiVersion;
    property AppSecret: string read GetAppSecret write SetAppSecret;
    property ApplicationId: string read GetApplicationId write SetApplicationId;
    property MasterSecret: string read GetMasterSecret write SetMasterSecret;
    property BaseURL: string read GetBaseURL;
    property UserName: string read GetUserName write SetUserName;
    property LoginResource: string read GetLoginResource write SetLoginResource;
    property Password: string read GetPassword write SetPassword;
    property ProxyPassword: string read GetProxyPassword write SetProxyPassword;
    property ProxyPort: integer read GetProxyPort write SetProxyPort default 0;
    property ProxyServer: string read GetProxyServer write SetProxyServer;
    property ProxyUsername: string read GetProxyUsername write SetProxyUsername;
    property TenantId: string read GetTenantId write SetTenantId;
    property TenantSecret: string read GetTenantSecret write SetTenantSecret;
    property ConnectTimeout: Integer read GetConnectTimeout write SetConnectTimeout default CRestDefaultTimeout;
    property ReadTimeout: Integer read GetReadTimeout write SetReadTimeout default CRestDefaultTimeout;
    property SqidsAlphabet: string read GetSqidsAlphabet write SetSqidsAlphabet;
    property SqidsMinLength: Integer read GetSqidsMinLength write SetSqidsMinLength default 0;
  end;

  TCustomEMSProvider = class(TCustomEMSConnectionInfo, IBackendProvider)
  public const
    ProviderID = 'EMS';
  protected
    { IBackendProvider }
    function GetProviderID: string;
  end;

  TEMSProvider = class(TCustomEMSProvider)
  published
                                    
    property AndroidPush;
    property ApiVersion;
    property ApplicationId;
    property AppSecret;
    property MasterSecret;
    property LoginResource;

    property URLProtocol;
    property URLHost;
    property URLPort;
    property URLBasePath;

    property ProxyPassword;
    property ProxyPort;
    property ProxyServer;
    property ProxyUsername;

    property TenantId;
    property TenantSecret;

    property ConnectTimeout;
    property ReadTimeout;

    property SqidsAlphabet;
    property SqidsMinLength;

    property OnValidateCertificate;
    property OnNeedClientCertificate;
  end;

  TEMSBackendService = class(TInterfacedObject)
  private
    FConnectionInfo: TCustomEMSConnectionInfo;
    procedure SetConnectionInfo(const Value: TCustomEMSConnectionInfo);
    procedure OnConnectionChanged(Sender: TObject);
  protected
    procedure DoAfterConnectionChanged; virtual;
    property ConnectionInfo: TCustomEMSConnectionInfo read FConnectionInfo
      write SetConnectionInfo;
  public
    constructor Create(const AProvider: IBackendProvider); virtual;
    destructor Destroy; override;
  end;

  IGetEMSApi = interface
    ['{554D8251-5BC6-4542-AD35-0EAC3F3031DE}']
    function GetEMSAPI: TEMSClientAPI;
    property EMSAPI: TEMSClientAPI read GetEMSAPI;
  end;

  TEMSServiceAPI = class(TInterfacedObject, IBackendAPI, IGetEMSApi)
  private
    FEMSAPI: TEMSClientAPI;
    { IGetEMSAPI }
    function GetEMSAPI: TEMSClientAPI;
  protected
    property EMSAPI: TEMSClientAPI read FEMSAPI;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TEMSServiceAPIAuth = class(TEMSServiceAPI, IBackendAuthenticationApi,
    IBackendAuthenticationExportApi)
  protected
    { IBackendAuthenticationApi }
    procedure Login(const ALogin: TBackendEntityValue);
    procedure Logout;
    procedure SetDefaultAuthentication(ADefaultAuthentication
      : TBackendDefaultAuthentication);
    function GetDefaultAuthentication: TBackendDefaultAuthentication;
    procedure SetAuthentication(AAuthentication: TBackendAuthentication);
    function GetAuthentication: TBackendAuthentication;
    { IBackendAuthenticationExportApi }
    function ExportLogin(const ALogin: TBackendEntityValue): string;
    function ImportLogin(const ALogin: string): TBackendEntityValue;
  end;

  TEMSBackendService<TAPI: TEMSServiceAPI, constructor> = class
    (TEMSBackendService, IGetEMSApi)
  private
    FBackendAPI: TAPI;
    FBackendAPIIntf: IInterface;
    { IGetEMSAPI }
    function GetEMSAPI: TEMSClientAPI;
  protected
    function CreateBackendApi: TAPI; virtual;
    procedure EnsureBackendApi;
    procedure DoAfterConnectionChanged; override;
    property BackendAPI: TAPI read FBackendAPI;
  end;

  EEMSProviderError = class(Exception);

implementation

uses REST.Backend.EMSMetaTypes, REST.Backend.Consts, System.TypInfo,
    REST.Backend.EMSConsts, REST.Json;

{ TCustomEMSConnectionInfo }

procedure TCustomEMSConnectionInfo.AppHandshake(
  const ACallback: TEMSClientAPI.TAppHandshakeProc);
var
  LClientAPI: TEMSClientAPI;
begin
  CheckURL;
  LClientAPI := TEMSClientAPI.Create(nil);
  try
    UpdateApi(LClientAPI);
    LClientAPI.AppHandshake(ACallback);
  finally
    LClientAPI.Free;
  end;
end;

procedure TCustomEMSConnectionInfo.CheckURL;
begin
  if URLHost = '' then
    raise EEMSProviderError.Create(sURLHostNotBlank);
  if URLProtocol = '' then
    raise EEMSProviderError.Create(sURLProtocolNotBlank);
end;

constructor TCustomEMSConnectionInfo.Create(AOwner: TComponent);
begin
  inherited;
  FConnectionInfo := TEMSClientAPI.TConnectionInfo.Create(TEMSClientAPI.cDefaultApiVersion, '');
  FURLProtocol := TProtocolNames.HTTP;
  FConnectionInfo.BaseURL := BaseURL;
  FAndroidPush := TAndroidPush.Create;
  FAndroidPush.FOwner := Self;
  FNotifyOnChange := TNotifyList.Create;
end;

destructor TCustomEMSConnectionInfo.Destroy;
begin
  inherited;
  FAndroidPush.Free;
  FNotifyOnChange.Free;
end;

procedure TCustomEMSConnectionInfo.DoChanged;
begin
  FNotifyOnChange.Notify(Self);
end;

function TCustomEMSConnectionInfo.GetApiVersion: string;
begin
  Result := FConnectionInfo.ApiVersion;
end;

function TCustomEMSConnectionInfo.GetApplicationId: string;
begin
  Result := FConnectionInfo.ApplicationId;
end;

function TCustomEMSConnectionInfo.GetAppSecret: string;
begin
  Result := FConnectionInfo.AppSecret;
end;

function TCustomEMSConnectionInfo.GetMasterSecret: string;
begin
  Result := FConnectionInfo.MasterSecret;
end;

function TCustomEMSConnectionInfo.GetPassword: string;
begin
  Result := FConnectionInfo.Password;
end;

function TCustomEMSConnectionInfo.GetProxyPassword: string;
begin
  Result := FConnectionInfo.ProxyPassword;
end;

function TCustomEMSConnectionInfo.GetProxyPort: integer;
begin
  Result := FConnectionInfo.ProxyPort;
end;

function TCustomEMSConnectionInfo.GetProxyServer: string;
begin
  Result := FConnectionInfo.ProxyServer;
end;

function TCustomEMSConnectionInfo.GetProxyUsername: string;
begin
  Result := FConnectionInfo.ProxyUsername;
end;

function TCustomEMSConnectionInfo.GetReadTimeout: Integer;
begin
  Result := FConnectionInfo.ReadTimeout;
end;

function TCustomEMSConnectionInfo.GetTenantId: string;
begin
  Result := FConnectionInfo.TenantId;
end;

function TCustomEMSConnectionInfo.GetTenantSecret: string;
begin
  Result := FConnectionInfo.TenantSecret;
end;

function TCustomEMSConnectionInfo.GetUserName: string;
begin
  Result := FConnectionInfo.UserName;
end;

function TCustomEMSConnectionInfo.GetLoginResource: string;
begin
  Result := FConnectionInfo.LoginResource;
end;

function TCustomEMSConnectionInfo.IsURLProtocolStored: Boolean;
begin
  Result := not SameText(URLProtocol, TProtocolNames.HTTP);
end;

function TCustomEMSConnectionInfo.GetBaseURL: string;
begin
  if (URLProtocol <> '') and (URLHost <> '') then // Leave blank if no protocol or host
  begin
    if URLPort <> 0 then
      Result := Format('%s://%s:%d', [URLProtocol, URLHost, URLPort])
    else
      Result := Format('%s://%s', [URLProtocol, URLHost]);
    if URLBasePath <> '' then
      if URLBasePath.StartsWith('/') then
        Result := Result + URLBasePath
      else
        Result := Result + '/' + URLBasePath;
  end;
end;

function TCustomEMSConnectionInfo.GetConnectTimeout: Integer;
begin
  Result := FConnectionInfo.ConnectTimeout;
end;

function TCustomEMSConnectionInfo.GetSqidsAlphabet: string;
begin
  Result := FConnectionInfo.SqidsAlphabet;
end;

function TCustomEMSConnectionInfo.GetSqidsMinLength: Integer;
begin
  Result := FConnectionInfo.SqidsMinLength;
end;

procedure TCustomEMSConnectionInfo.SetAndroidPush(const Value: TAndroidPush);
begin
  FAndroidPush.Assign(Value);
end;

procedure TCustomEMSConnectionInfo.SetApiVersion(const Value: string);
begin
  if Value <> ApiVersion then
  begin
    FConnectionInfo.ApiVersion := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetApplicationId(const Value: string);
begin
  if Value <> ApplicationId then
  begin
    FConnectionInfo.ApplicationId := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetAppSecret(const Value: string);
begin
  if Value <> AppSecret then
  begin
    FConnectionInfo.AppSecret := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetConnectTimeout(const Value: Integer);
begin
  if Value <> ConnectTimeout then
  begin
    FConnectionInfo.ConnectTimeout := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetSqidsAlphabet(const Value: string);
begin
  if Value <> SqidsAlphabet then
  begin
    FConnectionInfo.SqidsAlphabet := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetSqidsMinLength(const Value: Integer);
begin
  if Value <> SqidsMinLength then
  begin
    FConnectionInfo.SqidsMinLength := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetMasterSecret(const Value: string);
begin
  if Value <> MasterSecret then
  begin
    FConnectionInfo.MasterSecret := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetPassword(const Value: string);
begin
  if Value <> Password then
  begin
    FConnectionInfo.Password := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetURLBasePath(const Value: string);
begin
  if Value <> URLBasePath then
  begin
    FURLBasePath := Value;
    FConnectionInfo.BaseURL := BaseURL;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetOnValidateCertificate(const Value: TValidateCertificateEvent);
begin
  FOnValidateCertificate := Value;
  FConnectionInfo.OnValidateCertificate := Value;
  DoChanged;
end;

procedure TCustomEMSConnectionInfo.SetOnNeedClientCertificate(const Value: TNeedClientCertificateEvent);
begin
  FOnNeedClientCertificate := Value;
  FConnectionInfo.OnNeedClientCertificate := Value;
  DoChanged;
end;

procedure TCustomEMSConnectionInfo.SetURLHost(const Value: string);
begin
  if Value <> URLHost then
  begin
    FURLHost := Value;
    FConnectionInfo.BaseURL := BaseURL;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetURLPort(const Value: Integer);
begin
  if Value <> URLPort then
  begin
    FURLPort := Value;
    FConnectionInfo.BaseURL := BaseURL;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetURLProtocol(const Value: string);
begin
  if Value <> URLProtocol then
  begin
    FURLProtocol := Value;
    FConnectionInfo.BaseURL := BaseURL;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetProxyPassword(const Value: string);
begin
  if Value <> ProxyPassword then
  begin
    FConnectionInfo.ProxyPassword := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetProxyPort(const Value: integer);
begin
  if Value <> ProxyPort then
  begin
    FConnectionInfo.ProxyPort := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetProxyServer(const Value: string);
begin
  if Value <> ProxyServer then
  begin
    FConnectionInfo.ProxyServer := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetProxyUsername(const Value: string);
begin
  if Value <> ProxyUsername then
  begin
    FConnectionInfo.ProxyUsername := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetReadTimeout(const Value: Integer);
begin
  if Value <> ReadTimeout then
  begin
    FConnectionInfo.ReadTimeout := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetTenantId(const Value: string);
begin
  if Value <> TenantId then
  begin
    FConnectionInfo.TenantId := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetTenantSecret(const Value: string);
begin
  if Value <> TenantSecret then
  begin
    FConnectionInfo.TenantSecret := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetUserName(const Value: string);
begin
  if Value <> UserName then
  begin
    FConnectionInfo.UserName := Value;
    DoChanged;
  end;
end;

procedure TCustomEMSConnectionInfo.SetLoginResource(const Value: string);
begin
  if Value <> LoginResource then
  begin
    FConnectionInfo.LoginResource := Value;
    DoChanged;
  end;
end;

//procedure TCustomEMSConnectionInfo.SetBaseURL(const Value: string);
//begin
//  if Value <> AppKey then
//  begin
//    FConnectionInfo.BaseURL := Value;
//    DoChanged;
//  end;
//end;

procedure TCustomEMSConnectionInfo.UpdateApi(const AApi: TEMSClientAPI);
begin
  AApi.ConnectionInfo := FConnectionInfo;
end;

{ TCustomEMSConnectionInfo.TNotifyList }

procedure TCustomEMSConnectionInfo.TNotifyList.Add(const ANotify
  : TNotifyEvent);
begin
  Assert(not FList.Contains(ANotify));
  if not FList.Contains(ANotify) then
    FList.Add(ANotify);
end;

constructor TCustomEMSConnectionInfo.TNotifyList.Create;
begin
  FList := TList<TNotifyEvent>.Create;
end;

destructor TCustomEMSConnectionInfo.TNotifyList.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TCustomEMSConnectionInfo.TNotifyList.Notify(Sender: TObject);
var
  LProc: TNotifyEvent;
begin
  for LProc in FList do
    LProc(Sender);
end;

procedure TCustomEMSConnectionInfo.TNotifyList.Remove(const ANotify
  : TNotifyEvent);
begin
  Assert(FList.Contains(ANotify));
  FList.Remove(ANotify);
end;

{ TCustomEMSProvider }

function TCustomEMSProvider.GetProviderID: string;
begin
  Result := ProviderID;
end;

{ TEMSBackendService }

constructor TEMSBackendService.Create(const AProvider: IBackendProvider);
begin
  if AProvider is TCustomEMSConnectionInfo then
    ConnectionInfo := TCustomEMSConnectionInfo(AProvider)
  else
    raise EArgumentException.Create('AProvider'); // Do not localize
end;

destructor TEMSBackendService.Destroy;
begin
  if Assigned(FConnectionInfo) then
    FConnectionInfo.NotifyOnChange.Remove(OnConnectionChanged);
  inherited;
end;

procedure TEMSBackendService.DoAfterConnectionChanged;
begin
  //
end;

procedure TEMSBackendService.OnConnectionChanged(Sender: TObject);
begin
  DoAfterConnectionChanged;
end;

procedure TEMSBackendService.SetConnectionInfo(const Value
  : TCustomEMSConnectionInfo);
begin
  if FConnectionInfo <> nil then
    FConnectionInfo.NotifyOnChange.Remove(OnConnectionChanged);
  FConnectionInfo := Value;
  if FConnectionInfo <> nil then
    FConnectionInfo.NotifyOnChange.Add(OnConnectionChanged);
  OnConnectionChanged(Self);
end;

{ TKinveyServiceAPI }

constructor TEMSServiceAPI.Create;
begin
  FEMSAPI := TEMSClientAPI.Create(nil);
end;

destructor TEMSServiceAPI.Destroy;
begin
  FEMSAPI.Free;
  inherited;
end;

function TEMSServiceAPI.GetEMSAPI: TEMSClientAPI;
begin
  Result := FEMSAPI;
end;

{ TEMSBackendService<TAPI> }

function TEMSBackendService<TAPI>.CreateBackendApi: TAPI;
begin
  Result := TAPI.Create;
  if ConnectionInfo <> nil then
    ConnectionInfo.UpdateApi(Result.FEMSAPI)
  else
    Result.FEMSAPI.ConnectionInfo := TEMSClientAPI.EmptyConnectionInfo;
end;

procedure TEMSBackendService<TAPI>.EnsureBackendApi;
begin
  if FBackendAPI = nil then
  begin
    FBackendAPI := CreateBackendApi;
    FBackendAPIIntf := FBackendAPI; // Reference
  end;
end;

function TEMSBackendService<TAPI>.GetEMSAPI: TEMSClientAPI;
begin
  EnsureBackendApi;
  if FBackendAPI <> nil then
    Result := FBackendAPI.FEMSAPI
  else
    Result := nil;
end;

procedure TEMSBackendService<TAPI>.DoAfterConnectionChanged;
begin
  if FBackendAPI <> nil then
  begin
    if ConnectionInfo <> nil then
      ConnectionInfo.UpdateApi(FBackendAPI.FEMSAPI)
    else
      FBackendAPI.FEMSAPI.ConnectionInfo := TEMSClientAPI.EmptyConnectionInfo;
  end;
end;

{ TKinveyServiceAPIAuth }

function TEMSServiceAPIAuth.GetAuthentication: TBackendAuthentication;
begin
  case EMSAPI.Authentication of
    TEMSClientAPI.TAuthentication.Default:
      Result := TBackendAuthentication.Default;
    TEMSClientAPI.TAuthentication.MasterSecret:
      Result := TBackendAuthentication.Root;
    // TEMSClientAPI.TAuthentication.UserName:
    // Result := TBackendAuthentication.User;
    TEMSClientAPI.TAuthentication.Session:
      Result := TBackendAuthentication.Session;
    TEMSClientAPI.TAuthentication.AppSecret:
      Result := TBackendAuthentication.Application;
    TEMSClientAPI.TAuthentication.None:
      Result := TBackendAuthentication.None;
  else
    Result := TBackendAuthentication.Default;
  end;
end;

function TEMSServiceAPIAuth.GetDefaultAuthentication
  : TBackendDefaultAuthentication;
begin
  case EMSAPI.DefaultAuthentication of
    TEMSClientAPI.TDefaultAuthentication.MasterSecret:
      Result := TBackendDefaultAuthentication.Root;
    // TEMSClientAPI.TDefaultAuthentication.UserName:
    // Result := TBackendDefaultAuthentication.User;
    TEMSClientAPI.TDefaultAuthentication.Session:
      Result := TBackendDefaultAuthentication.Session;
    TEMSClientAPI.TDefaultAuthentication.AppSecret:
      Result := TBackendDefaultAuthentication.Application;
    TEMSClientAPI.TDefaultAuthentication.None:
      Result := TBackendDefaultAuthentication.None;
  else
    Result := TBackendDefaultAuthentication.None;
  end;
end;

procedure TEMSServiceAPIAuth.Login(const ALogin: TBackendEntityValue);
var
  LMetaLogin: TMetaLogin;
begin
  if ALogin.Data is TMetaLogin then
  begin
    LMetaLogin := TMetaLogin(ALogin.Data);
    EMSAPI.Login(LMetaLogin.Login);
  end
  else
    raise EArgumentException.Create(sParameterNotLogin);
end;

procedure TEMSServiceAPIAuth.Logout;
begin
  EMSAPI.Logout;
end;

procedure TEMSServiceAPIAuth.SetAuthentication(AAuthentication
  : TBackendAuthentication);
begin
  case AAuthentication of
    TBackendAuthentication.Default:
      FEMSAPI.Authentication := TEMSClientAPI.TAuthentication.Default;
    TBackendAuthentication.Root:
      FEMSAPI.Authentication := TEMSClientAPI.TAuthentication.MasterSecret;
    TBackendAuthentication.Application:
      FEMSAPI.Authentication := TEMSClientAPI.TAuthentication.AppSecret;
    // TBackendAuthentication.User:
    // FKinveyAPI.Authentication := TEMSClientAPI.TAuthentication.UserName;
    TBackendAuthentication.Session:
      FEMSAPI.Authentication := TEMSClientAPI.TAuthentication.Session;
    TBackendAuthentication.None:
      FEMSAPI.Authentication := TEMSClientAPI.TAuthentication.None;
    TBackendAuthentication.User:
      raise EEMSProviderError.CreateFmt(sAuthenticationNotSupported, [
        System.TypInfo.GetEnumName(TypeInfo(TBackendAuthentication), Integer(AAuthentication))]);
  else
    Assert(False); // Unexpected
  end;
end;

procedure TEMSServiceAPIAuth.SetDefaultAuthentication(ADefaultAuthentication
  : TBackendDefaultAuthentication);
begin
  case ADefaultAuthentication of
    TBackendDefaultAuthentication.Root:
      FEMSAPI.DefaultAuthentication := TEMSClientAPI.TDefaultAuthentication.
        MasterSecret;
    TBackendDefaultAuthentication.Application:
      FEMSAPI.DefaultAuthentication :=
        TEMSClientAPI.TDefaultAuthentication.AppSecret;
    // TBackendDefaultAuthentication.User:
    // FKinveyAPI.DefaultAuthentication := TEMSClientAPI.TDefaultAuthentication.UserName;
    TBackendDefaultAuthentication.Session:
      FEMSAPI.DefaultAuthentication :=
        TEMSClientAPI.TDefaultAuthentication.Session;
    TBackendDefaultAuthentication.None:
      FEMSAPI.DefaultAuthentication :=
        TEMSClientAPI.TDefaultAuthentication.None;
    TBackendDefaultAuthentication.User:
      raise EEMSProviderError.CreateFmt(sAuthenticationNotSupported, [
        System.TypInfo.GetEnumName(TypeInfo(TBackendDefaultAuthentication), Integer(ADefaultAuthentication))]);
  else
    Assert(False); // Unexpected
  end;
end;

function TEMSServiceAPIAuth.ExportLogin(const ALogin: TBackendEntityValue): string;
begin
  if ALogin.Data is TMetaLoginUser then
    Result := TJson.ObjectToJsonString(ALogin.Data as TMetaLoginUser)
  else
    raise EArgumentException.Create(sParameterNotLogin);
end;

function TEMSServiceAPIAuth.ImportLogin(const ALogin: string): TBackendEntityValue;
begin
  if ALogin.Trim.IsEmpty then
    raise EArgumentException.Create(sParameterNotLogin);
  try
    Result := TBackendEntityValue.Create(TJson.JsonToObject<TMetaLoginUser>(ALogin));
  except
    raise EArgumentException.Create(sParameterNotLogin);
  end;
end;

const
  sDisplayName = 'EMS';

{ TCustomEMSConnectionInfo.TAndroidPush }

procedure TCustomEMSConnectionInfo.TAndroidPush.AssignTo(AValue: TPersistent);
begin
  if AValue is TAndroidPush then
  begin
    Self.FGCMAppID := TAndroidPush(AValue).FGCMAppID
  end
  else
    inherited;
end;

procedure TCustomEMSConnectionInfo.TAndroidPush.SetGCMAppID(
  const Value: string);
begin
  if FGCMAppID <> Value then
  begin
    FGCMAppID := Value;
    FOwner.DoChanged;
  end;
end;

initialization

TBackendProviders.Instance.Register(TCustomEMSProvider.ProviderID,
  sDisplayName);

finalization

TBackendProviders.Instance.UnRegister(TCustomEMSProvider.ProviderID);

end.
