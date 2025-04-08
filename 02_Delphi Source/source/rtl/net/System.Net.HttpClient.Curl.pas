{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Net.HttpClient.Curl;

{$WEAKPACKAGEUNIT OFF}

interface

implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
{$IFDEF POSIX}
  Posix.SysTypes, Posix.SysStat, Posix.Unistd,
{$ENDIF}
  System.Classes, System.Generics.Collections, System.SysUtils, System.Net.URLClient, System.Net.HttpClient,
  System.NetConsts, System.DateUtils, System.Types, System.Curl, System.IOUtils, System.SyncObjs;

type
  THTTPRequestMethod = (CONNECT, DELETE, GET, HEAD, OPTIONS, POST, PUT, TRACE, MERGE, PATCH, others);
  THTTPAuthSchemes = set of TCredentialsStorage.TAuthSchemeType;

  TCurlHTTPResponse = class;
  TCurlHTTPRequest = class;

  TCurlHTTPClient = class(THTTPClient)
  private class var
    FLock: TCriticalSection;
  private
    class constructor Create;
    class destructor Destroy;
    function GetServerCertInfoFromRequest(const ARequest: THTTPRequest; var ACertificate: TCertificate): Boolean;
    function GetCertInfo(ACertData: PCurlCertInfo; var ACertificate: TCertificate): Boolean;
    function TryFetchCertificate(const ARequest: TCurlHTTPRequest; var ACertificate: TCertificate): Boolean;
    class procedure DoSetConnectionTimeout(AReq: PCURL; const AValue: Integer); static;
    class procedure DoSetResponseTimeout(AReq: PCURL; const AValue: Integer); static;
  protected
    function DoExecuteRequest(const ARequest: THTTPRequest; var AResponse: THTTPResponse;
      const AContentStream: TStream): THTTPClient.TExecutionResult; override;
    function DoSetCredential(AnAuthTargetType: TAuthTargetType; const ARequest: THTTPRequest;
      const ACredential: TCredentialsStorage.TCredential): Boolean; override;
    function DoGetResponseInstance(const AContext: TObject; const AProc: TProc;
      const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequest: IURLRequest; const AContentStream: TStream): IAsyncResult; override;
    function DoGetHTTPRequestInstance(const AClient: THTTPClient; const ARequestMethod: string;
      const AURI: TURI): IHTTPRequest; override;
    function DoProcessStatus(const ARequest: IHTTPRequest; const  AResponse: IHTTPResponse): Boolean; override;
    function DoGetSSLCertificateFromServer(const ARequest: THTTPRequest): TCertificate; override;
    procedure DoServerCertificateAccepted(const ARequest: THTTPRequest); override;
    procedure DoGetClientCertificates(const ARequest: THTTPRequest; const ACertificateList: TList<TCertificate>); override;
    function DoClientCertificateAccepted(const ARequest: THTTPRequest; const AnIndex: Integer): Boolean; override;
    class function CreateInstance: TURLClient; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCurlHTTPRequest = class(THTTPRequest)
  private
    FRequest: PCurl;
    FHeaders: TDictionary<string, string>;
    FTempFileName: string;
    [Weak] FResponse: TCurlHTTPResponse;
    FErrorBuff: array [0 .. CURL_ERROR_SIZE] of Byte;
    FLastMethodString: string;
    procedure InitRequest;
    procedure CleanupRequest;
    function ChooseAuthScheme(AAuthSchemes: THTTPAuthSchemes): LongInt;

    procedure SetCurlProxySettings(ACurlReq: PCURL);
    procedure SetCurlCertificate(ACurlReq: PCURL);
  protected
    procedure DoPrepare; override;
    procedure DoCancel; override;
    procedure DoResetCancel; override;

    function GetHeaders: TNetHeaders; override;
    procedure AddHeader(const AName, AValue: string); override;
    function RemoveHeader(const AName: string): Boolean; override;

    function GetHeaderValue(const AName: string): string; override;
    procedure SetHeaderValue(const AName, Value: string); override;
    class function CurlReadData(buffer: Pointer; size: size_t; nitems: size_t; instream: Pointer): size_t; cdecl; static;
    class function CurlWriteData(buffer: Pointer; size: size_t; nitems: size_t; instream: Pointer): size_t; cdecl; static;
    class function CurlReadHeaders(buffer: Pointer; size: size_t; nitems: size_t; instream: Pointer): size_t; cdecl; static;

    procedure SetConnectionTimeout(const Value: Integer); override;
    procedure SetResponseTimeout(const Value: Integer); override;
  public
    constructor Create(const AClient: THTTPClient; const ARequestMethod: string; const AURI: TURI);
    destructor Destroy; override;
  end;

  TCurlHTTPResponse = class(THTTPResponse)
  private
    [Weak] FRequest: TCurlHTTPRequest;
    FNativeHeaders: TStringList;
    FNativeStatusCode: string;
    FNativeStatusLine: string;
    FReaded: Int64;
    FDataLength: Int64;
    FWritten: Int64;
    function ReceiveData(buffer: Pointer; size: size_t; nitems: size_t): size_t;
    function ReceiveHeader(buffer: Pointer; size: size_t; nitems: size_t): size_t;
    function SendData(buffer: Pointer; size: size_t; nitems: size_t): size_t;
  protected
    function GetDecompressResponse: Boolean; override;
    procedure DoReadData(const AStream: TStream); override;

    function GetHeaders: TNetHeaders; override;
    function GetStatusCode: Integer; override;
    function GetStatusText: string; override;
    function GetVersion: THTTPProtocolVersion; override;
    function GetAuthSchemes: THTTPAuthSchemes;
  public
    constructor Create(const AContext: TObject; const AProc: TProc; const AAsyncCallback: TAsyncCallback;
      const AAsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: TCurlHTTPRequest;
      const AContentStream: TStream);
    destructor Destroy; override;
  end;

function MethodStringToHTTPMethod(const AMethodString: string): THTTPRequestMethod;
var
  LMethod: string;
begin
  LMethod := AMethodString.ToUpper;
  if LMethod = sHTTPMethodConnect then
    Result := THTTPRequestMethod.CONNECT
  else if LMethod = sHTTPMethodDelete then
    Result := THTTPRequestMethod.DELETE
  else if LMethod = sHTTPMethodGet then
    Result := THTTPRequestMethod.GET
  else if LMethod = sHTTPMethodHead then
    Result := THTTPRequestMethod.HEAD
  else if LMethod = sHTTPMethodOptions then
    Result := THTTPRequestMethod.OPTIONS
  else if LMethod = sHTTPMethodPost then
    Result := THTTPRequestMethod.POST
  else if LMethod = sHTTPMethodPut then
    Result := THTTPRequestMethod.PUT
  else if LMethod = sHTTPMethodTrace then
    Result := THTTPRequestMethod.TRACE
  else if LMethod = sHTTPMethodMerge then
    Result := THTTPRequestMethod.MERGE
  else if LMethod = sHTTPMethodPatch then
    Result := THTTPRequestMethod.PATCH
  else
    Result := THTTPRequestMethod.others;
end;

{ TCurlHTTPClient }

class constructor TCurlHTTPClient.Create;
begin
  FLock := TCriticalSection.Create;
end;

class destructor TCurlHTTPClient.Destroy;
begin
  FreeAndNil(FLock);
end;

constructor TCurlHTTPClient.Create;
begin
  inherited Initializer;
  if not Assigned(@curl_global_init) then
    raise ENetHTTPClientException.CreateResFmt(@SNetHttpClientLibCurlNotFound, [LibCurl]);
  FLock.Acquire;
  try
    // From curl_global_init description:
    // * multiple calls have the same effect as one call
    // * it is thread-safe since libcurl 7.84.0 if curl_version_info
    //   has the CURL_VERSION_THREADSAFE feature bit set (most platforms)
    curl_global_init(CURL_GLOBAL_DEFAULT);
  finally
    FLock.Release;
  end;
end;

destructor TCurlHTTPClient.Destroy;
begin
  FLock.Acquire;
  try
    if Assigned(@curl_global_init) and
       Assigned(@curl_global_cleanup) then
      curl_global_cleanup;
  finally
    FLock.Release;
  end;
  inherited Destroy;
end;

class function TCurlHTTPClient.CreateInstance: TURLClient;
begin
  Result := TCurlHTTPClient.Create;
end;

class procedure TCurlHTTPClient.DoSetConnectionTimeout(AReq: PCURL; const AValue: Integer);
begin
  if (AReq <> nil) and (AValue <> 0) then
    if AValue < 0 then
      curl_easy_setopt(AReq, CURLOPT_CONNECTTIMEOUT_MS, LongInt(0))
    else
      curl_easy_setopt(AReq, CURLOPT_CONNECTTIMEOUT_MS, LongInt(AValue));
end;

class procedure TCurlHTTPClient.DoSetResponseTimeout(AReq: PCURL; const AValue: Integer);
begin
  if (AReq <> nil) and (AValue <> 0) then
    if AValue < 0 then
      curl_easy_setopt(AReq, CURLOPT_TIMEOUT_MS, LongInt(0))
    else
      curl_easy_setopt(AReq, CURLOPT_TIMEOUT_MS, LongInt(AValue));
end;

function TCurlHTTPClient.DoClientCertificateAccepted(const ARequest: THTTPRequest; const AnIndex: Integer): Boolean;
begin
  { Not needed with Curl }
  Result := True;
end;

function TCurlHTTPClient.DoExecuteRequest(const ARequest: THTTPRequest; var AResponse: THTTPResponse;
  const AContentStream: TStream): TCurlHTTPClient.TExecutionResult;
var
  LRequest: TCurlHTTPRequest;
  LList: pcurl_slist;
  LMethod: THTTPRequestMethod;
  LSize: curl_off_t; //long
  LOption: CURLoption;
  LValue: TPair<string, string>;
  LCode: TCurlCode;
  LResponseCode: NativeInt;
  LAbort: Boolean;

  procedure RaiseCurlError(ARequest: TCurlHTTPRequest; ACode: TCurlCode);
  var
    LError: string;
  begin
    LError := UTF8ToString(@ARequest.FErrorBuff[0]);
    if LError = '' then
      LError := UTF8ToString(curl_easy_strerror(ACode));
    raise ENetHTTPClientException.CreateResFmt(@SNetHttpClientErrorAccessing, [
      Integer(ACode), ARequest.FURL.ToString, LError]);
  end;

begin
  Result := TExecutionResult.Success;
  LRequest := TCurlHTTPRequest(ARequest);
  if LRequest.FCancelled then
    Exit;
  try
    LList := nil;
    try
      TMonitor.Enter(LRequest);
      try
        // Cleanup Response Headers
        SetLength(LRequest.FResponse.FHeaders, 0);
        LRequest.FResponse.FNativeHeaders.Clear;
        LRequest.FResponse.FReaded := 0;
        LRequest.FResponse.FDataLength := 0;
        LRequest.FResponse.FWritten := 0;

        LMethod := MethodStringToHTTPMethod(LRequest.FMethodString);
        if LMethod in [THTTPRequestMethod.DELETE, THTTPRequestMethod.PUT,
                       THTTPRequestMethod.POST, THTTPRequestMethod.PATCH] then
        begin
          LList := curl_slist_append(LList, MarshaledAString(UTF8String('Expect:')));
          if Assigned(LRequest.FSourceStream) then
          begin
            LSize := LRequest.FSourceStream.Size - LRequest.FSourceStream.Position;
            if LSize < 0 then
              LSize := 0;
          end
          else
            LSize := 0;
          if LSize > 0 then
          begin
            LRequest.DoSendDataProgress(LSize, LRequest.FResponse.FWritten, LAbort, True);
            if LRequest.FCancelled then
              Exit;
          end;
          LRequest.FResponse.FDataLength := LSize;
          if LMethod in [THTTPRequestMethod.PUT, THTTPRequestMethod.PATCH] then
            LOption := CURLOPT_INFILESIZE_LARGE
          else
            LOption := CURLOPT_POSTFIELDSIZE;
          curl_easy_setopt(LRequest.FRequest, LOption, LSize);
        end;

        for LValue in LRequest.FHeaders do
          LList := curl_slist_append(LList, MarshaledAString(UTF8String(LValue.Key + ': ' + LValue.Value)));
        curl_easy_setopt(LRequest.FRequest, CURLOPT_HTTPHEADER, LList);
      finally
        TMonitor.Exit(LRequest);
      end;

      LCode := curl_easy_perform(LRequest.FRequest);
    finally
      if LList <> nil then
        curl_slist_free_all(LList);
    end;

    case LCode of
      CURLE_OK:
      begin
        Result := TExecutionResult.Success;
        if curl_easy_getinfo(LRequest.FRequest, CURLINFO_RESPONSE_CODE, @LResponseCode) = CURLE_OK then
          TCurlHTTPResponse(AResponse).FNativeStatusCode := LResponseCode.ToString;
      end;

      CURLE_ABORTED_BY_CALLBACK:
      begin
        LRequest.Cancel;
        Result := TExecutionResult.Success;
      end;

      CURLE_SSL_ISSUER_ERROR,
      CURLE_SSL_CACERT:
      begin
        FSecureFailureReasons := [THTTPSecureFailureReason.InvalidCA];
        Result := TExecutionResult.ServerCertificateInvalid;
      end;

      CURLE_PEER_FAILED_VERIFICATION:
      begin
        FSecureFailureReasons := [THTTPSecureFailureReason.CertWrongUsage];
        Result := TExecutionResult.ServerCertificateInvalid;
      end;

      CURLE_SSL_INVALIDCERTSTATUS:
      begin
        FSecureFailureReasons := [];
        Result := TExecutionResult.ServerCertificateInvalid;
      end;

      CURLE_SSL_CACERT_BADFILE,
      CURLE_SSL_CIPHER,
      CURLE_SSL_CERTPROBLEM:
      begin
        FSecureFailureReasons := [THTTPSecureFailureReason.InvalidCert];
        Result := TExecutionResult.ServerCertificateInvalid;
      end;

      CURLE_SSL_CONNECT_ERROR,
      CURLE_SSL_ENGINE_NOTFOUND,
      CURLE_SSL_ENGINE_SETFAILED,
      CURLE_SSL_ENGINE_INITFAILED:
      begin
        FSecureFailureReasons := [THTTPSecureFailureReason.SecurityChannelError];
        RaiseCurlError(LRequest, LCode);
      end;

      else
        // When a request is canceled, then curl_easy_perform can return different errors.
        // We should ignore all errors in this case. This is safe.
        if LRequest.FCancelled then
          Result := TExecutionResult.Success
        else
          RaiseCurlError(LRequest, LCode);
    end;
  finally
    // Update Headers & Cookies
    LRequest.FResponse.GetHeaders;
  end;
end;

procedure TCurlHTTPClient.DoGetClientCertificates(const ARequest: THTTPRequest;
  const ACertificateList: TList<TCertificate>);
begin
  inherited;
  { Not needed with Curl }
end;

function TCurlHTTPClient.DoGetHTTPRequestInstance(const AClient: THTTPClient; const ARequestMethod: string;
  const AURI: TURI): IHTTPRequest;
begin
  Result := TCurlHTTPRequest.Create(AClient, ARequestMethod, AURI);
end;

function TCurlHTTPClient.DoGetResponseInstance(const AContext: TObject; const AProc: TProc;
  const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IURLRequest;
  const AContentStream: TStream): IAsyncResult;
begin
  Result := TCurlHTTPResponse.Create(AContext, AProc, AsyncCallback, AsyncCallbackEvent, ARequest as TCurlHTTPRequest,
    AContentStream);
end;

function TCurlHTTPClient.DoGetSSLCertificateFromServer(const ARequest: THTTPRequest): TCertificate;
begin
  GetServerCertInfoFromRequest(ARequest, Result);
end;

function TCurlHTTPClient.DoProcessStatus(const ARequest: IHTTPRequest; const AResponse: IHTTPResponse): Boolean;
var
  LRequest: TCurlHTTPRequest;
  LResponse: TCurlHTTPResponse;
begin
  LRequest := ARequest as TCurlHTTPRequest;
  LResponse := AResponse as TCurlHTTPResponse;
  // If the result is true then the while ends
  Result := True;
  if IsAutoRedirect(LResponse) then
  begin
    LRequest.FURL := ComposeRedirectURL(LRequest, LResponse);
    if IsAutoRedirectWithGET(LRequest, LResponse) then
    begin
      LRequest.FMethodString := sHTTPMethodGet; // Change to GET
      LRequest.FSourceStream := nil;            // Dont send any data
      LRequest.RemoveHeader(sContentLength);
      LRequest.SetHeaderValue(sContentType, '');// Dont set content type
    end;
    Result := False;
  end;
end;

procedure TCurlHTTPClient.DoServerCertificateAccepted(const ARequest: THTTPRequest);
var
  LRequest: TCurlHTTPRequest;
begin
  inherited;
  LRequest := TCurlHTTPRequest(ARequest);
  if SecureFailureReasons <> [] then
  begin
    curl_easy_setopt(LRequest.FRequest, CURLOPT_SSL_VERIFYHOST, 0);
    curl_easy_setopt(LRequest.FRequest, CURLOPT_SSL_VERIFYPEER, 0);
  end;
  curl_easy_setopt(LRequest.FRequest, CURLOPT_SSL_VERIFYSTATUS, 0);
end;

function TCurlHTTPClient.DoSetCredential(AnAuthTargetType: TAuthTargetType; const ARequest: THTTPRequest;
  const ACredential: TCredentialsStorage.TCredential): Boolean;
var
  LRequest: TCurlHTTPRequest;
  LAuthSchemes: THTTPAuthSchemes;
  LCurlAuth: LongInt;
begin
  LRequest := TCurlHTTPRequest(ARequest);
  LAuthSchemes := LRequest.FResponse.GetAuthSchemes;
  if LAuthSchemes = [] then
    LAuthSchemes := [TCredentialsStorage.TAuthSchemeType.Basic];
  LCurlAuth := LRequest.ChooseAuthScheme(LAuthSchemes);

  if AnAuthTargetType = TAuthTargetType.Server then
  begin
    curl_easy_setopt(LRequest.FRequest, CURLOPT_USERNAME, UTF8String(ACredential.UserName));
    curl_easy_setopt(LRequest.FRequest, CURLOPT_PASSWORD, UTF8String(ACredential.Password));
    curl_easy_setopt(LRequest.FRequest, CURLOPT_HTTPAUTH, LCurlAuth);
  end
  else
  begin
    curl_easy_setopt(LRequest.FRequest, CURLOPT_PROXYUSERNAME, UTF8String(ACredential.UserName));
    curl_easy_setopt(LRequest.FRequest, CURLOPT_PROXYPASSWORD, UTF8String(ACredential.Password));
    curl_easy_setopt(LRequest.FRequest, CURLOPT_PROXYAUTH, LCurlAuth);
  end;
  Result := True;
end;

function TCurlHTTPClient.GetCertInfo(ACertData: PCurlCertInfo; var ACertificate: TCertificate): Boolean;
var
  LDataList: pcurl_slist;
  LData: string;
  LPos, LCode: Integer;
  LKey, LValue: string;
  LName: string;

  function GetDateFromGMT: TDateTime;
  var
    LOrig: string;
  begin
    LOrig := LValue;
    LValue := LValue.Replace(' ', 'T', []);
    LPos := LValue.IndexOf(' ');
    if LPos > 0 then
      LValue := LValue.Substring(0, LPos);
    if not TryISO8601ToDate(LValue, Result) then
      Result := HttpToDate(LOrig, True);
  end;

  function NormalizeDomainName(const AName: string; var ACommonName: string): string;
  var
    LList: TStringList;
    LItem: string;
    I: Integer;
  begin
    Result := '';
    ACommonName := '';
    LList := TStringList.Create;
    try
      LList.Delimiter := ',';
      LList.StrictDelimiter := True;
      LList.DelimitedText := AName;
      for I := 0 to LList.Count - 1 do
      begin
        if Result <> '' then
          Result := Result + ';';
        LItem := LList.ValueFromIndex[I].Trim;
        Result := Result + LItem;
        if I = LList.Count - 1 then
          ACommonName := LItem;
      end;
    finally
      LList.Free;
    end;
  end;

begin
  Result := False;
  if (ACertData <> nil) and (ACertData^.certinfo <> nil) and (ACertData^.certinfo^ <> nil) then
  begin
    Result := True;
    LDataList := ACertData^.certinfo^;
    repeat
      LData := UTF8ToString(LDataList^.data);
      LPos := LData.IndexOf(':');
      LKey := LData.Substring(0, LPos);
      LValue := LData.Substring(LPos + 1);

      if SameText(LKey, 'Subject') then // do not localize
      begin
        ACertificate.Subject := NormalizeDomainName(LValue, LName);
        ACertificate.CertName := LName;
      end
      else if SameText(LKey, 'Issuer') then // do not localize
        ACertificate.Issuer := NormalizeDomainName(LValue, LName)
      else if SameText(LKey, 'Expire date') then // do not localizev
        ACertificate.Expiry := GetDateFromGMT
      else if SameText(LKey, 'Start date') then // do not localize
        ACertificate.Start := GetDateFromGMT
      else if SameText(LKey, 'Signature Algorithm') then // do not localize
        ACertificate.AlgSignature := LValue
      else if SameText(LKey, 'Serial Number') then // do not localize
                                                           
        ACertificate.SerialNum := LValue.ToUpper
      else if LKey.EndsWith('Public Key', True) then // do not localize
      begin
        Val(LValue, ACertificate.KeySize, LCode);
        if LCode <> 0 then
        begin
          ACertificate.PublicKey := LValue;
          ACertificate.KeySize := Length(LValue) div 2;
        end;
      end;

      LDataList := LDataList^.next;
    until LDataList = nil;
  end;
end;

function TCurlHTTPClient.TryFetchCertificate(const ARequest: TCurlHTTPRequest; var ACertificate: TCertificate): Boolean;
var
  LReq: PCURL;
  LCode: TCurlCode;
  LCertData: PCurlCertInfo;
begin
  LReq := curl_easy_init;
  try
    // Setup common options
    curl_easy_setopt(LReq, CURLOPT_CERTINFO, 1);
    curl_easy_setopt(LReq, CURLOPT_NOPROGRESS, 1);
    DoSetConnectionTimeout(LReq, ConnectionTimeout);
    DoSetResponseTimeout(LReq, ResponseTimeout);
    // Setup proxy
    ARequest.SetCurlProxySettings(LReq);
    // Setup client certificate
    ARequest.SetCurlCertificate(LReq);
    // Disable SSL verification
    curl_easy_setopt(LReq, CURLOPT_SSL_VERIFYHOST, 0);
    curl_easy_setopt(LReq, CURLOPT_SSL_VERIFYPEER, 0);
    curl_easy_setopt(LReq, CURLOPT_SSL_VERIFYSTATUS, 0);
    // Setup HEAD request
    curl_easy_setopt(LReq, CURLOPT_URL, UTF8String(ARequest.FURL.ToString));
    curl_easy_setopt(LReq, CURLOPT_CUSTOMREQUEST, PUTF8Char(UTF8String(sHTTPMethodHead)));
    curl_easy_setopt(LReq, CURLOPT_NOBODY, 1);

    LCode := curl_easy_perform(LReq);
    if LCode <> CURLE_OK then
      Exit(False);

    LCode := curl_easy_getinfo(LReq, CURLINFO_CERTINFO, @LCertData);
    if LCode <> CURLE_OK then
      Exit(False);

    Result := GetCertInfo(LCertData, ACertificate);
  finally
    curl_easy_cleanup(LReq);
  end;
end;

function TCurlHTTPClient.GetServerCertInfoFromRequest(const ARequest: THTTPRequest; var ACertificate: TCertificate): Boolean;
var
  LRequest: TCurlHTTPRequest;
  LCode: TCURLcode;
  LCertData: PCurlCertInfo;
begin
  ACertificate := Default(TCertificate);
  LRequest := TCurlHTTPRequest(ARequest);
  // CURLINFO_CERTINFO returns no certificates when connection failed with SSL error,
  // eg CURLE_SSL_CACERT, but returns when SSL handshake succeed. So, to get a certificate
  // in case of invalid or self-signed certificates these options must be disabled:
  // * CURLOPT_SSL_VERIFYPEER
  // * CURLOPT_SSL_VERIFYHOST
  LCode := curl_easy_getinfo(LRequest.FRequest, CURLINFO_CERTINFO, @LCertData);
  if LCode <> CURLE_OK then
    raise ENetHTTPCertificateException.CreateRes(@SNetHttpCertificatesError);
  if LCertData^.num_of_certs > 0 then
    Result := GetCertInfo(LCertData, ACertificate)
  else
    Result := TryFetchCertificate(LRequest, ACertificate);
end;

{ TCurlHTTPRequest }

procedure TCurlHTTPRequest.AddHeader(const AName, AValue: string);
begin
  inherited;
  BaseAddHeader(AName, AValue);
end;

constructor TCurlHTTPRequest.Create(const AClient: THTTPClient; const ARequestMethod: string; const AURI: TURI);
begin
  inherited Create(AClient, ARequestMethod, AURI);
  FHeaders := TDictionary<string, string>.Create;
  InitRequest;
end;

destructor TCurlHTTPRequest.Destroy;
begin
  CleanupRequest;
  FHeaders.Free;
  if FTempFileName <> '' then
    DeleteFile(FTempFileName);
  inherited Destroy;
end;

procedure TCurlHTTPRequest.InitRequest;
{$IFDEF MSWINDOWS}
var
  LCAFile: string;
{$ENDIF}
begin
  if not Assigned(@curl_easy_init) then
    raise ENetHTTPClientException.CreateResFmt(@SNetHttpClientLibCurlNotFound, [LibCurl]);

  FRequest := curl_easy_init;
  { Setup common options for LibCurl }
  curl_easy_setopt(FRequest, CURLOPT_BUFFERSIZE, 102400);
  curl_easy_setopt(FRequest, CURLOPT_WRITEFUNCTION, @CurlReadData);
  curl_easy_setopt(FRequest, CURLOPT_WRITEDATA, Self);
  curl_easy_setopt(FRequest, CURLOPT_HEADERFUNCTION, @CurlReadHeaders);
  curl_easy_setopt(FRequest, CURLOPT_HEADERDATA, Self);
  curl_easy_setopt(FRequest, CURLOPT_CERTINFO, 1);
  curl_easy_setopt(FRequest, CURLOPT_TCP_KEEPALIVE, 1);
  curl_easy_setopt(FRequest, CURLOPT_NOPROGRESS, 1);
  curl_easy_setopt(FRequest, CURLOPT_ERRORBUFFER, @FErrorBuff[0]);
  TCurlHTTPClient.DoSetConnectionTimeout(FRequest, ConnectionTimeout);
  TCurlHTTPClient.DoSetResponseTimeout(FRequest, ResponseTimeout);
  if FURL.Scheme = TURI.SCHEME_HTTPS then
    if Assigned(TCurlHTTPClient(FClient).OnValidateServerCertificate) or
       Assigned(TCurlHTTPClient(FClient).ValidateServerCertificateCallback) then
      curl_easy_setopt(FRequest, CURLOPT_SSL_VERIFYSTATUS, 1)
    else
      curl_easy_setopt(FRequest, CURLOPT_SSL_VERIFYSTATUS, 0);
{$IFDEF MSWINDOWS}
  LCAFile := ExpandFileName('curl-ca-bundle.crt');
  if not LCAFile.IsEmpty and FileExists(LCAFile) then
    curl_easy_setopt(FRequest, CURLOPT_CAINFO, UTF8String(LCAFile));
{$ENDIF}
end;

procedure TCurlHTTPRequest.CleanupRequest;
var
  LReq: PCurl;
begin
  if FRequest <> nil then
  begin
    LReq := FRequest;
    FRequest := nil;
    curl_easy_cleanup(LReq);
  end;
end;

procedure TCurlHTTPRequest.DoResetCancel;
begin
  inherited DoResetCancel;
  CleanupRequest;
  InitRequest;
end;

class function TCurlHTTPRequest.CurlReadData(buffer: Pointer; size, nitems: size_t;
  instream: Pointer): size_t;
begin
  if instream <> nil then
    Result := TCurlHTTPRequest(instream).FResponse.ReceiveData(buffer, size, nitems)
  else
    Result := 0;
end;

class function TCurlHTTPRequest.CurlReadHeaders(buffer: Pointer; size: size_t; nitems: size_t; instream: Pointer): size_t;
begin
  if instream <> nil then
    Result := TCurlHTTPRequest(instream).FResponse.ReceiveHeader(buffer, size, nitems)
  else
    Result := 0;
end;

class function TCurlHTTPRequest.CurlWriteData(buffer: Pointer; size, nitems: size_t; instream: Pointer): size_t;
begin
  if instream <> nil then
    Result := TCurlHTTPRequest(instream).FResponse.SendData(buffer, size, nitems)
  else
    Result := 0;
end;

function TCurlHTTPRequest.ChooseAuthScheme(AAuthSchemes: THTTPAuthSchemes): LongInt;
var
  LCurlAuths: LongInt;
begin
  curl_easy_getinfo(FRequest, CURLINFO_HTTPAUTH_AVAIL, @LCurlAuths);
  if (TCredentialsStorage.TAuthSchemeType.NTLM in AAuthSchemes) and
     (LCurlAuths and CURLAUTH_NTLM <> 0) then
    Result := CURLAUTH_NTLM
  else if (TCredentialsStorage.TAuthSchemeType.Negotiate in AAuthSchemes) and
          (LCurlAuths and CURLAUTH_NEGOTIATE <> 0) then
    Result := CURLAUTH_NEGOTIATE
  else if (TCredentialsStorage.TAuthSchemeType.Digest in AAuthSchemes) and
          (LCurlAuths and CURLAUTH_DIGEST <> 0) then
    Result := CURLAUTH_DIGEST
  else if TCredentialsStorage.TAuthSchemeType.Basic in AAuthSchemes then
    Result := CURLAUTH_BASIC
  else
    Result := 0;
end;

procedure TCurlHTTPRequest.DoPrepare;
var
  LDecompress: THTTPCompressionMethods;
  LEncodings: string;
  LAuthSchemes: THTTPAuthSchemes;
  LCurlAuth: LongInt;
begin
  inherited;
  if (FLastMethodString <> '') and not SameText(FLastMethodString, FMethodString) or
     (FRequest = nil) then
  begin
    CleanupRequest;
    InitRequest;
  end;
  FLastMethodString := FMethodString;

  curl_easy_setopt(FRequest, CURLOPT_URL, UTF8String(FURL.ToString));
  if FURL.Username <> '' then
  begin
    SetCredential(TCredentialsStorage.TCredential.Create(TAuthTargetType.Server, '', FURL.ToString,
      FURL.Username, FURL.Password));
    curl_easy_setopt(FRequest, CURLOPT_USERNAME, UTF8String(FURL.Username));
    curl_easy_setopt(FRequest, CURLOPT_PASSWORD, UTF8String(FURL.Password));
  end;

  if TCurlHTTPClient(FClient).ProtocolVersion = THTTPProtocolVersion.HTTP_2_0 then
    curl_easy_setopt(FRequest, CURLOPT_HTTP_VERSION, LongInt(TCurlHTTPClient(FClient).ProtocolVersion));

  SetCurlProxySettings(FRequest);
  SetCurlCertificate(FRequest);

  LDecompress := TCurlHTTPClient(FClient).AutomaticDecompression;
  if LDecompress <> [] then
  begin
    if THTTPCompressionMethod.Any in LDecompress then
      LEncodings := #0
    else
    begin
      LEncodings := '';
      if THTTPCompressionMethod.Deflate in LDecompress then
        LEncodings := LEncodings + ', deflate';  // do not translate
      if THTTPCompressionMethod.GZip in LDecompress then
        LEncodings := LEncodings + ', gzip';  // do not translate
      if THTTPCompressionMethod.Brotli in LDecompress then
        LEncodings := LEncodings + ', br';  // do not translate
      LEncodings := Copy(LEncodings, 3, MaxInt);
    end;
    curl_easy_setopt(FRequest, CURLOPT_HTTP_CONTENT_DECODING, 1);
    curl_easy_setopt(FRequest, CURLOPT_ENCODING, UTF8String(LEncodings));
  end;

  if TCurlHTTPClient(FClient).UseDefaultCredentials then
  begin
    LAuthSchemes := FResponse.GetAuthSchemes;
    if LAuthSchemes <> [] then
    begin
      LCurlAuth := ChooseAuthScheme(LAuthSchemes);
      curl_easy_setopt(FRequest, CURLOPT_USERPWD, UTF8String(':'));
      curl_easy_setopt(FRequest, CURLOPT_HTTPAUTH, LCurlAuth);
    end;
  end;

  { Handle request methods }
  case MethodStringToHTTPMethod(FMethodString) of
    THTTPRequestMethod.GET, THTTPRequestMethod.CONNECT,
    THTTPRequestMethod.OPTIONS, THTTPRequestMethod.TRACE,
    THTTPRequestMethod.MERGE, THTTPRequestMethod.others:
      curl_easy_setopt(FRequest, CURLOPT_CUSTOMREQUEST, PUTF8Char(UTF8String(FMethodString)));

    THTTPRequestMethod.DELETE:
    begin
      curl_easy_setopt(FRequest, CURLOPT_CUSTOMREQUEST, PUTF8Char(UTF8String(FMethodString)));
      if FSourceStream <> nil then
      begin
        curl_easy_setopt(FRequest, CURLOPT_UPLOAD, 1);
        curl_easy_setopt(FRequest, CURLOPT_READFUNCTION, @CurlWriteData);
        curl_easy_setopt(FRequest, CURLOPT_READDATA, Self);
      end;
    end;

    THTTPRequestMethod.PUT:
    begin
      curl_easy_setopt(FRequest, CURLOPT_UPLOAD, 1);
      curl_easy_setopt(FRequest, CURLOPT_READFUNCTION, @CurlWriteData);
      curl_easy_setopt(FRequest, CURLOPT_READDATA, Self);
    end;

    THTTPRequestMethod.HEAD:
    begin
      curl_easy_setopt(FRequest, CURLOPT_CUSTOMREQUEST, UTF8String(FMethodString));
      curl_easy_setopt(FRequest, CURLOPT_NOBODY, 1);
    end;

    THTTPRequestMethod.PATCH:
    begin
      curl_easy_setopt(FRequest, CURLOPT_CUSTOMREQUEST, UTF8String(FMethodString));
      curl_easy_setopt(FRequest, CURLOPT_UPLOAD, 1);
      curl_easy_setopt(FRequest, CURLOPT_READFUNCTION, @CurlWriteData);
      curl_easy_setopt(FRequest, CURLOPT_READDATA, Self);
    end;

    THTTPRequestMethod.POST:
    begin
      curl_easy_setopt(FRequest, CURLOPT_POST, 1);
      curl_easy_setopt(FRequest, CURLOPT_READFUNCTION, @CurlWriteData);
      curl_easy_setopt(FRequest, CURLOPT_READDATA, Self);
    end;
  end;
end;

procedure TCurlHTTPRequest.DoCancel;
begin
  TMonitor.Enter(Self);
  try
    CleanupRequest;
  finally
    TMonitor.Exit(Self);
  end;
end;

function TCurlHTTPRequest.GetHeaders: TNetHeaders;
var
  Value: TPair<string, string>;
  CntHeader: Integer;
begin
  SetLength(Result, 500); // Max 500 headers
  CntHeader := 0;
  for Value in FHeaders do
  begin
    Result[CntHeader].Create(Value.Key, Value.Value);
    Inc(CntHeader);
  end;
  SetLength(Result, CntHeader);
end;

function TCurlHTTPRequest.GetHeaderValue(const AName: string): string;
begin
  Result := '';
  FHeaders.TryGetValue(AName, Result);
end;

function TCurlHTTPRequest.RemoveHeader(const AName: string): Boolean;
begin
  Result := True;
  if GetHeaderValue(AName) = '' then
    Result := False
  else
    FHeaders.Remove(AName);
end;

procedure TCurlHTTPRequest.SetHeaderValue(const AName, Value: string);
begin
  inherited;
  FHeaders.AddOrSetValue(AName, Value);
end;

procedure TCurlHTTPRequest.SetConnectionTimeout(const Value: Integer);
begin
  inherited;
  TCurlHTTPClient.DoSetConnectionTimeout(FRequest, Value);
end;

procedure TCurlHTTPRequest.SetResponseTimeout(const Value: Integer);
begin
  inherited;
  TCurlHTTPClient.DoSetResponseTimeout(FRequest, Value);
end;

procedure TCurlHTTPRequest.SetCurlProxySettings(ACurlReq: PCURL);
var
  LUrl: string;
  LClient: TCurlHTTPClient;
begin
  LClient := TCurlHTTPClient(FClient);
  if LClient.ProxySettings.Host.IsEmpty then
    Exit;

  LUrl := LClient.ProxySettings.Host;
  if LClient.ProxySettings.Scheme <> '' then
    LUrl := LClient.ProxySettings.Scheme + '://' + LUrl;
  curl_easy_setopt(ACurlReq, CURLOPT_PROXY, UTF8String(LUrl));
  if LClient.ProxySettings.Port > 0 then
    curl_easy_setopt(ACurlReq, CURLOPT_PROXYPORT, LClient.ProxySettings.Port);
  if LClient.ProxySettings.UserName <> '' then
  begin
    // we try to use the usual auth scheme to try to avoid a round trip
    curl_easy_setopt(ACurlReq, CURLOPT_PROXYUSERNAME, UTF8String(LClient.ProxySettings.UserName));
    curl_easy_setopt(ACurlReq, CURLOPT_PROXYPASSWORD, UTF8String(LClient.ProxySettings.Password));
  end;
end;

procedure TCurlHTTPRequest.SetCurlCertificate(ACurlReq: PCURL);
var
  LExt: string;
  LTmpFile: TFileStream;
begin
  if FClientCertPath <> '' then
  begin
    LExt := ExtractFileExt(FClientCertPath).ToLower;
    if (LExt = '.p12') or (LExt = '.pfx') then
      curl_easy_setopt(FRequest, CURLOPT_SSLCERTTYPE, UTF8String('P12'))
    else
      curl_easy_setopt(FRequest, CURLOPT_SSLCERTTYPE, UTF8String('PEM'));

    if curl_easy_setopt(FRequest, CURLOPT_SSLCERT, UTF8String(FClientCertPath)) <> CURLE_OK then
      raise ENetHTTPCertificateException.CreateRes(@SNetHttpCertificateImportError);
  end
  else
  begin
    if FClientCertificate <> nil then
    begin
      FTempFileName := TPath.GetTempFileName + '.pem';
      LTmpFile := TFileStream.Create(FTempFileName, fmCreate {$IFDEF POSIX}, S_IRUSR {$ENDIF});
      try
        FClientCertificate.Position := 0;
        LTmpFile.CopyFrom(FClientCertificate, FClientCertificate.Size);
      finally
        LTmpFile.Free;
      end;

      curl_easy_setopt(FRequest, CURLOPT_SSLCERTTYPE, UTF8String('PEM'));
      if curl_easy_setopt(FRequest, CURLOPT_SSLCERT, UTF8String(FTempFileName)) <> CURLE_OK then
        raise ENetHTTPCertificateException.CreateRes(@SNetHttpCertificateImportError);
    end;
  end;

  if FClientCertPassword <> '' then
    curl_easy_setopt(FRequest, CURLOPT_KEYPASSWD, UTF8String(FClientCertPassword));
end;

{ TCurlHTTPResponse }

constructor TCurlHTTPResponse.Create(const AContext: TObject; const AProc: TProc; const AAsyncCallback: TAsyncCallback;
  const AAsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: TCurlHTTPRequest; const AContentStream: TStream);
begin
  inherited Create(AContext, AProc, AAsyncCallback, AAsyncCallbackEvent, ARequest, AContentStream);
  FRequest := ARequest;
  FRequest.FResponse := Self;
  FNativeHeaders := TStringList.Create;
end;

destructor TCurlHTTPResponse.Destroy;
begin
  FNativeHeaders.Free;
  inherited;
end;

function TCurlHTTPResponse.GetDecompressResponse: Boolean;
var
  LContEnc: string;
begin
  LContEnc := GetContentEncoding;
  Result :=
    ((LContEnc = 'gzip') or (LContEnc = 'deflate')) // do not translate
     and (THTTPClient(TCurlHTTPRequest(FRequest).FClient).AutomaticDecompression *
          [THTTPCompressionMethod.GZip, THTTPCompressionMethod.Deflate, THTTPCompressionMethod.Any] = []);
end;

procedure TCurlHTTPResponse.DoReadData(const AStream: TStream);
begin
  inherited;
  // Do nothing
end;

function TCurlHTTPResponse.GetHeaders: TNetHeaders;
var
  I, P: Integer;
  LPos: Integer;
  LName: string;
  LValue: string;

  procedure AddOrSetHeader;
  var
    J: Integer;
  begin
    for J := 0 to P - 1 do
    begin
      if SameText(FHeaders[J].Name, LName) then
      begin
        FHeaders[J].Value := FHeaders[J].Value + ', ' + LValue;
        Exit;
      end;
    end;
    FHeaders[P].Create(LName, LValue);
    Inc(P);
  end;

begin
  if Length(FHeaders) = 0 then
  begin
    SetLength(FHeaders, FNativeHeaders.Count);
    P := 0;
    for I := 0 to FNativeHeaders.Count - 1 do
    begin
      LPos := FNativeHeaders[I].IndexOf(':');
      LName := FNativeHeaders[I].Substring(0, LPos);
      LValue := FNativeHeaders[I].Substring(LPos + 1).Trim;
      if SameText(LName, sSetCookie) then
        InternalAddCookie(LValue)
      else
        AddOrSetHeader;
    end;
    SetLength(Result, P);
  end;
  Result := FHeaders;
end;

function TCurlHTTPResponse.GetStatusCode: Integer;
begin
  TryStrToInt(FNativeStatusCode, Result);
end;

function TCurlHTTPResponse.GetStatusText: string;
begin
  Result := FNativeStatusLine;
end;

function TCurlHTTPResponse.GetVersion: THTTPProtocolVersion;
var
  LVersion: string;
  LValues: TArray<string>;
begin
  if FNativeStatusLine <> '' then
  begin
    LValues := FNativeStatusLine.Split([' ']);
    LVersion := LValues[0];
    if string.CompareText(LVersion, 'HTTP/1.0') = 0 then
      Result := THTTPProtocolVersion.HTTP_1_0
    else if string.CompareText(LVersion, 'HTTP/1.1') = 0 then
      Result := THTTPProtocolVersion.HTTP_1_1
    else if string.CompareText(LVersion, 'HTTP/2.0') = 0 then
      Result := THTTPProtocolVersion.HTTP_2_0
    else
      Result := THTTPProtocolVersion.UNKNOWN_HTTP;
  end
  else
    Result := THTTPProtocolVersion.UNKNOWN_HTTP;
end;

function TCurlHTTPResponse.ReceiveData(buffer: Pointer; size, nitems: size_t): size_t;
var
  LAbort: Boolean;
  LContentLength: Int64;
  LStatusCode: Integer;
  LTotal: Integer;

  function GetEarlyStatusCode: Integer;
  var
    LTmp: TArray<string>;
  begin
    Result := GetStatusCode;
    if Result = 0 then
    begin
      LTmp := FNativeStatusLine.Split([' ']);
      if Length(LTmp) > 2 then
      begin
        FNativeStatusCode := LTmp[1];
        Result := GetStatusCode;
      end;
    end;
  end;

begin
  LTotal := nitems * size;
  Inc(FReaded, LTotal);
  LContentLength := GetContentLength;
  LStatusCode := GetEarlyStatusCode;
  Result := FStream.Write(buffer^, LTotal);
  FRequest.DoReceiveDataProgress(LStatusCode, LContentLength, FReaded, buffer, LTotal, LAbort);
  if LAbort then
    Result := 0;
end;

function TCurlHTTPResponse.ReceiveHeader(buffer: Pointer; size, nitems: size_t): size_t;
var
  LHeader: string;
  LPos: Integer;
begin
  LHeader := UTF8ToString(buffer).Trim;
  LPos := LHeader.IndexOf(':');
  if LPos > 0 then
    FNativeHeaders.Add(LHeader)
  else
    if LHeader <> '' then
      FNativeStatusLine := LHeader;

  Result := size * nitems;
end;

function TCurlHTTPResponse.SendData(buffer: Pointer; size, nitems: size_t): size_t;
var
  LAbort: Boolean;
begin
  if FDataLength > FWritten then
  begin
    Result := FRequest.FSourceStream.Read(buffer^, size * nitems);
    Inc(FWritten, Result);
    FRequest.DoSendDataProgress(FDataLength, FWritten, LAbort, False);
    if LAbort then
      Result := CURL_READFUNC_ABORT;
  end
  else
    Result := 0;
end;

function TCurlHTTPResponse.GetAuthSchemes: THTTPAuthSchemes;
var
  LHeaders: TNetHeaders;
  LHeader: TNameValuePair;
  LAuths: TArray<string>;
  LAuth: string;
  i: Integer;
begin
  Result := [];
  LHeaders := GetHeaders();
  for LHeader in LHeaders do
    if SameText(LHeader.Name, sWWWAuthenticate) then
    begin
      LAuths := LHeader.Value.Split([',']);
      for i := 0 to Length(LAuths) - 1 do
      begin
        LAuth := LAuths[i].Trim.ToLower();
        if LAuth = 'basic' then  // do not translate
          Include(Result, TCredentialsStorage.TAuthSchemeType.Basic)
        else if LAuth = 'digest' then  // do not translate
          Include(Result, TCredentialsStorage.TAuthSchemeType.Digest)
        else if LAuth = 'ntlm' then  // do not translate
          Include(Result, TCredentialsStorage.TAuthSchemeType.NTLM)
        else if LAuth = 'negotiate' then  // do not translate
          Include(Result, TCredentialsStorage.TAuthSchemeType.Negotiate);
      end;
    end;
end;

initialization
  TURLSchemes.UnRegisterURLClientScheme('HTTP');
  TURLSchemes.UnRegisterURLClientScheme('HTTPS');
  TURLSchemes.RegisterURLClientScheme(TCurlHTTPClient, 'HTTP');
  TURLSchemes.RegisterURLClientScheme(TCurlHTTPClient, 'HTTPS');

finalization
  TURLSchemes.UnRegisterURLClientScheme('HTTP');
  TURLSchemes.UnRegisterURLClientScheme('HTTPS');
end.
