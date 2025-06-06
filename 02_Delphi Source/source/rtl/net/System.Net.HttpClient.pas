{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

/// <summary>Unit that holds functionality relative to an HTTP Client</summary>
unit System.Net.HttpClient;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Generics.Collections, System.Net.URLClient,
    System.Net.Mime, System.Sysutils, System.Types;

type
  /// <summary>Exceptions related to HTTP</summary>
  ENetHTTPException = class(ENetURIException);
  /// <summary>Exceptions related to HTTPClient</summary>
  ENetHTTPClientException = class(ENetURIClientException);
  /// <summary>Exceptions related to HTTPRequest</summary>
  ENetHTTPRequestException = class(ENetURIRequestException);
  /// <summary>Exceptions related to HTTPResponse</summary>
  ENetHTTPResponseException = class(ENetURIResponseException);

  /// <summary>Exceptions related to Certificates</summary>
  ENetHTTPCertificateException = class(ENetURIException);

  /// <summary>HTTP Protocol version</summary>
  THTTPProtocolVersion = (UNKNOWN_HTTP, HTTP_1_0, HTTP_1_1, HTTP_2_0);

  THTTPRedirectWithGET = (Post301, Post302, Post303, Post307, Post308,
                          Put301, Put302, Put303, Put307, Put308,
                          Delete301, Delete302, Delete303, Delete307, Delete308);
  THTTPRedirectsWithGET = set of THTTPRedirectWithGET;

  THTTPSecureProtocol = (SSL2, SSL3, TLS1, TLS11, TLS12, TLS13);
  THTTPSecureProtocols = set of THTTPSecureProtocol;

  THTTPSecureFailureReason = (CertRevFailed, InvalidCert, CertRevoked, InvalidCA,
    CertCNInvalid, CertDateInvalid, CertWrongUsage, SecurityChannelError,
    CertNotAccepted);
  THTTPSecureFailureReasons = set of THTTPSecureFailureReason;

  THTTPCompressionMethod = (Deflate, GZip, Brotli, Any);
  THTTPCompressionMethods = set of THTTPCompressionMethod;

const
  sHTTPMethodConnect = 'CONNECT'; // do not localize
  sHTTPMethodDelete = 'DELETE'; // do not localize
  sHTTPMethodGet = 'GET'; // do not localize
  sHTTPMethodHead = 'HEAD'; // do not localize
  sHTTPMethodOptions = 'OPTIONS'; // do not localize
  sHTTPMethodPost = 'POST'; // do not localize
  sHTTPMethodPut = 'PUT'; // do not localize
  sHTTPMethodTrace = 'TRACE'; // do not localize
  sHTTPMethodMerge = 'MERGE'; // do not localize
  sHTTPMethodPatch = 'PATCH'; // do not localize

  CHTTPDefRedirectsWithGET = [THTTPRedirectWithGET.Post301, THTTPRedirectWithGET.Post302,
    THTTPRedirectWithGET.Post303, THTTPRedirectWithGET.Put303, THTTPRedirectWithGET.Delete303];
  CHTTPDefSecureProtocols = [];

  CHTTPDefMaxRedirects = 5; // As defined by "rfc2616.txt"

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

type
  /// <summary>Signature of ReceiveData Callback</summary>
  TReceiveDataCallback = reference to procedure(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);
  /// <summary>Signature of ReceiveData Event</summary>
  TReceiveDataEvent = procedure(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean) of object;
  /// <summary>Signature of ReceiveDataEx Callback; allows access to the just-read data</summary>
  TReceiveDataExCallback = reference to procedure(const Sender: TObject; AContentLength, AReadCount: Int64; AChunk: Pointer; AChunkLength: Cardinal; var AAbort: Boolean);
  /// <summary>Signature of ReceiveDataEx Event; allows access to the just-read data</summary>
  TReceiveDataExEvent = procedure(const Sender: TObject; AContentLength, AReadCount: Int64; AChunk: Pointer; AChunkLength: Cardinal; var AAbort: Boolean) of object;

  /// <summary>Signature of SendData Callback</summary>
  TSendDataCallback = reference to procedure(const Sender: TObject; AContentLength, AWriteCount: Int64; var AAbort: Boolean);
  /// <summary>Signature of SendData Event</summary>
  TSendDataEvent = procedure(const Sender: TObject; AContentLength, AWriteCount: Int64; var AAbort: Boolean) of object;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //
  /// <summary>Cookie record.</summary>
  TCookie = record
  public
    /// <summary>Cookie Name</summary>
    Name: string;
    /// <summary>Cookie Value</summary>
    Value: string;
    /// <summary>Cookie Expires. It's the date when the cookie will expire</summary>
    /// <remarks>When Expires is 0 means a session cookie.</remarks>
    Expires: TDateTime;
    /// <summary>Cookie Domain</summary>
    Domain: string;
    /// <summary>Cookie Path</summary>
    Path: string;
    /// <summary>Cookie Secure</summary>
    /// <remarks>If True then the cookie will be sent if https scheme is used</remarks>
    Secure: Boolean;
    /// <summary>Cookie HttpOnly</summary>
    /// <remarks>If True then the cookie will not be used in javascript, it's browser dependant.</remarks>
    HttpOnly: Boolean;

    /// <summary>Return a TCookie parsing ACookieData based on the URI param</summary>
    class function Create(const ACookieData: string; const AURI: TURI): TCookie; static;
    /// <summary>Return the cookie as string to be send to the server</summary>
    function ToString: string;
    /// <summary>Return the cookie as string to be send to the client</summary>
    function GetServerCookie: string;
  end;

  /// <summary>Container for cookies</summary>
  TCookies = class(TList<TCookie>);
  TCookiesArray = TArray<TCookie>;

  /// <summary> Class to manage cookies</summary>
  TCookieManager = class
  private
    FCookies: TCookies;
    function GetCookies: TCookiesArray; overload;
    procedure DeleteExpiredCookies;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary> Returns True when a client ACookie may be sent to a server based on the AURL param</summary>
    class function UseCookie(const ACookie: TCookie; const AURL: TURI): Boolean; static;
    /// <summary> Adds a server cookies from ACookieData to the cookie storage based on the ACookieURL param</summary>
    procedure AddServerCookie(const ACookieData, ACookieURL: string); overload;
    /// <summary> Adds a server ACookie to the cookie storage based on the AURL param</summary>
    procedure AddServerCookie(const ACookie: TCookie; const AURL: TURI); overload;
    /// <summary>Generate the client cookie header value based on the AURL param</summary>
    function CookieHeaders(const AURL: TURI): string;
    /// <summary>Returns an array with the cookies based on the AURL param</summary>
    function GetCookies(const AURL: TURI): TCookiesArray; overload;
    /// <summary>Returns an array with the cookies based on the ACookieURL param</summary>
    function GetCookies(const ACookieURL: string): TCookiesArray; overload;
    /// <summary>Clears the cookie storage/summary>
    procedure Clear;

    /// <summary>Returns an array with the cookies</summary>
    property Cookies: TCookiesArray read GetCookies;
  end;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

  /// <summary>Interface for HTTPRequest</summary>
  IHTTPRequest = interface(IURLRequest)
    /// <summary>Getter for the Property HeaderValue</summary>
    function GetHeaderValue(const AName: string): string;
    /// <summary>Setter for the Property HeaderValue</summary>
    procedure SetHeaderValue(const AName, AValue: string);
    /// <summary>Property to Get/Set Header values</summary>
    /// <param name="AName">Name of the Header</param>
    /// <returns>The string value associated to the given name.</returns>
    property HeaderValue[const AName: string]: string read GetHeaderValue write SetHeaderValue;

    /// <summary>Getter for the Headers Property from the Request</summary>
    function GetHeaders: TNetHeaders;
    /// <summary>Property to Get/Set all Headers from the Request</summary>
    /// <returns>A TStrings containing all Headers with theirs respective values.</returns>
    property Headers: TNetHeaders read GetHeaders;

    /// <summary>Add a Header to the current request. If specified header already was set,
    /// then new value will be added to existing header using comma delimiter. </summary>
    /// <param name="AName">Name of the Header.</param>
    /// <param name="AValue">Value associted.</param>
    procedure AddHeader(const AName, AValue: string);
    /// <summary>Removes a Header from the request</summary>
    /// <param name="AName">Header to be removed.</param>
    function RemoveHeader(const AName: string): Boolean;

    // Helper functions to get/set common Header values
    /// <summary>Getter for the Accept Property</summary>
    function GetAccept: string;
    /// <summary>Getter for the AcceptCharSet Property</summary>
    function GetAcceptCharSet: string;
    /// <summary>Getter for the AcceptEncoding Property</summary>
    function GetAcceptEncoding: string;
    /// <summary>Getter for the AcceptLanguage Property</summary>
    function GetAcceptLanguage: string;
    /// <summary>Getter for the UserAgent Property</summary>
    function GetUserAgent: string;
    /// <summary>Setter for the Accept Property</summary>
    procedure SetAccept(const Value: string);
    /// <summary>Setter for the AcceptCharSet Property</summary>
    procedure SetAcceptCharSet(const Value: string);
    /// <summary>Setter for the AcceptEncoding Property</summary>
    procedure SetAcceptEncoding(const Value: string);
    /// <summary>Setter for the AcceptLanguage Property</summary>
    procedure SetAcceptLanguage(const Value: string);
    /// <summary>Setter for the UserAgent Property</summary>
    procedure SetUserAgent(const Value: string);
    /// <summary>Get the client certificate assigned to the request</summary>
    function GetClientCertificate: TStream;
    /// <summary>Set the client certificate stream for the request (iOS, Linux, Windows)</summary>
    procedure SetClientCertificate(const Value: TStream; const Password: string); overload;
    /// <summary>Set the path containing a client certificate for the request (iOS, Linux, Windows, Android)
    ///  Note, on Android the Path is certificate fingerprint or imported name, not a file path. Password is not used. </summary>
    procedure SetClientCertificate(const Path: string; const Password: string); overload;
    /// <summary>UserAgent Property</summary>
    property UserAgent: string read GetUserAgent write SetUserAgent;
    /// <summary>Accept Property</summary>
    property Accept: string read GetAccept write SetAccept;
    /// <summary>AcceptCharSet Property</summary>
    property AcceptCharSet: string read GetAcceptCharSet write SetAcceptCharSet;
    /// <summary>AcceptEncoding Property</summary>
    property AcceptEncoding: string read GetAcceptEncoding write SetAcceptEncoding;
    /// <summary>AcceptLanguage Property</summary>
    property AcceptLanguage: string read GetAcceptLanguage write SetAcceptLanguage;

    /// <summary> Getter for the SendData Callback Property</summary>
    function GetSendDataCallback: TSendDataCallback;
    /// <summary> Setter for the SendData Callback Property</summary>
    procedure SetSendDataCallback(const Value: TSendDataCallback);
    /// <summary> Getter for the SendData Callback Event</summary>
    function GetSendDataEvent: TSendDataEvent;
    /// <summary> Setter for the SendData Callback Event</summary>
    procedure SetSendDataEvent(const Value: TSendDataEvent);
    /// <summary>Property to manage the SendData Callback</summary>
    property SendDataCallback: TSendDataCallback read GetSendDataCallback write SetSendDataCallback;
    /// <summary>Property to manage the SendData Event</summary>
    property OnSendData: TSendDataEvent read GetSendDataEvent write SetSendDataEvent;

    /// <summary> Getter for the ReceiveData Callback Property</summary>
    function GetReceiveDataCallback: TReceiveDataCallback;
    /// <summary> Setter for the ReceiveData Callback Property</summary>
    procedure SetReceiveDataCallback(const Value: TReceiveDataCallback);
    /// <summary> Getter for the ReceiveData Event</summary>
    function GetReceiveDataEvent: TReceiveDataEvent;
    /// <summary> Setter for the ReceiveData Event</summary>
    procedure SetReceiveDataEvent(const Value: TReceiveDataEvent);
    /// <summary> Getter for the ReceiveDataEx Callback Property</summary>
    function GetReceiveDataExCallback: TReceiveDataExCallback;
    /// <summary> Setter for the ReceiveDataEx Callback Property</summary>
    procedure SetReceiveDataExCallback(const Value: TReceiveDataExCallback);
    /// <summary> Getter for the ReceiveDataEx Event</summary>
    function GetReceiveDataExEvent: TReceiveDataExEvent;
    /// <summary> Setter for the ReceiveDataEx Event</summary>
    procedure SetReceiveDataExEvent(const Value: TReceiveDataExEvent);
    /// <summary>Property to manage the ReceiveData Callback</summary>
    property ReceiveDataCallback: TReceiveDataCallback read GetReceiveDataCallback write SetReceiveDataCallback;
    /// <summary>Property to manage the ReceiveData Event</summary>
    property OnReceiveData: TReceiveDataEvent read GetReceiveDataEvent write SetReceiveDataEvent;
    /// <summary>Property to manage the ReceiveDataEx Callback, allowing access to the just-read data</summary>
    property ReceiveDataExCallback: TReceiveDataExCallback read GetReceiveDataExCallback write SetReceiveDataExCallback;
    /// <summary>Property to manage the ReceiveDataEx Event, allowing access to the just-read data</summary>
    property OnReceiveDataEx: TReceiveDataExEvent read GetReceiveDataExEvent write SetReceiveDataExEvent;
  end;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

  // Forwarded class.
  THTTPClient = class;

  /// <summary>Specific Class to handle HTTP Requests</summary>
  /// <remarks></remarks>
  THTTPRequest = class(TURLRequest, IHTTPRequest)
  private
    FSendDataCallback: TSendDataCallback;
    FOnSendData: TSendDataEvent;
    FReceiveDataCallback: TReceiveDataCallback;
    FOnReceiveData: TReceiveDataEvent;
    FReceiveDataExCallback: TReceiveDataExCallback;
    FOnReceiveDataEx: TReceiveDataExEvent;
    FOwnedStream: TStream;
    { IHTTPRequest }
    // Helper functions to get/set common Header values
    function GetAccept: string;
    function GetAcceptCharSet: string;
    function GetAcceptEncoding: string;
    function GetAcceptLanguage: string;
    function GetUserAgent: string;
    procedure SetAccept(const Value: string);
    procedure SetAcceptCharSet(const Value: string);
    procedure SetAcceptEncoding(const Value: string);
    procedure SetAcceptLanguage(const Value: string);
    procedure SetUserAgent(const Value: string);
    function GetSendDataCallback: TSendDataCallback;
    procedure SetSendDataCallback(const Value: TSendDataCallback);
    function GetSendDataEvent: TSendDataEvent;
    procedure SetSendDataEvent(const Value: TSendDataEvent);
    function GetReceiveDataCallback: TReceiveDataCallback;
    procedure SetReceiveDataCallback(const Value: TReceiveDataCallback);
    function GetReceiveDataEvent: TReceiveDataEvent;
    procedure SetReceiveDataEvent(const Value: TReceiveDataEvent);
    function GetReceiveDataExCallback: TReceiveDataExCallback;
    procedure SetReceiveDataExCallback(const Value: TReceiveDataExCallback);
    function GetReceiveDataExEvent: TReceiveDataExEvent;
    procedure SetReceiveDataExEvent(const Value: TReceiveDataExEvent);
    function GetClientCertificate: TStream;

  protected
    /// <summary>Contains the client certificate (raw data) to use with the request (iOS, Linux, Windows)</summary>
    [Weak] FClientCertificate: TStream;
    /// <summary>To store the client certificate password (iOS, Linux, Windows)</summary>
    FClientCertPassword: string;
    /// <summary>To store the client certificate file path (iOS, Linux, Windows, Android).
    ///  Note, on Android it is certificate serial number, not a file path. </summary>
    FClientCertPath: string;
    /// <summary>Checks and invokes SendData Callback or OnSendData event</summary>
    procedure DoSendDataProgress(AContentLength, AWriteCount: Int64; var AAbort: Boolean; AAllowCancel: Boolean);
    /// <summary>Checks and invokes ReceiveData Callback or OnReceiveData event</summary>
    procedure DoReceiveDataProgress(AStatusCode: Integer; AContentLength, AReadCount: Int64;
      AChunk: Pointer; AChunkLength: Cardinal; var AAbort: Boolean);
    /// <summary>Prepare Request to be executed</summary>
    procedure DoPrepare; virtual; abstract;
    /// <summary>Set the client certificate for the request (iOS, Linux, Windows)</summary>
    procedure SetClientCertificate(const Value: TStream; const Password: string); overload;
    /// <summary>Set the path containing a client certificate for the request (iOS, Linux, Windows, Android)
    ///  Note, on Android the Path is certificate serial number, not a file path. </summary>
    procedure SetClientCertificate(const Path: string; const Password: string); overload;
    /// <summary>Internal implementation used by Linux and Android AddHeader implementations</summary>
    procedure BaseAddHeader(const AName, AValue: string);

    constructor Create(const AClient: THTTPClient; const ARequestMethod: string; const AURI: TURI);
  public
    { IHTTPRequest }
    /// <summary>Getter for the Headers Property from the Request</summary>
    function GetHeaders: TNetHeaders; virtual; abstract;
    /// <summary>Getter for the Property HeaderValue</summary>
    function GetHeaderValue(const AName: string): string; virtual; abstract;
    /// <summary>Setter for the Property HeaderValue</summary>
    procedure SetHeaderValue(const AName, AValue: string); virtual; abstract;
    /// <summary>Add a Header to the current request.</summary>
    /// <param name="AName">Name of the Header.</param>
    /// <param name="AValue">Value associted.</param>
    procedure AddHeader(const AName, AValue: string); virtual; abstract;
    /// <summary>Removes a Header from the request</summary>
    /// <param name="AName">Header to be removed.</param>
    function RemoveHeader(const AName: string): Boolean; virtual; abstract;

    /// <summary>Property to manage the SendData Callback</summary>
    property SendDataCallback: TSendDataCallback read GetSendDataCallback write SetSendDataCallback;
    /// <summary>Property to manage the SendData Event</summary>
    property OnSendData: TSendDataEvent read GetSendDataEvent write SetSendDataEvent;

    /// <summary>Property to manage the ReceiveData Callback</summary>
    property ReceiveDataCallback: TReceiveDataCallback read GetReceiveDataCallback write SetReceiveDataCallback;
    /// <summary>Property to manage the ReceiveData Event</summary>
    property OnReceiveData: TReceiveDataEvent read GetReceiveDataEvent write SetReceiveDataEvent;
    /// <summary>Property to manage the ReceiveDataEx Callback, allowing access to the just-read data</summary>
    property ReceiveDataExCallback: TReceiveDataExCallback read GetReceiveDataExCallback write SetReceiveDataExCallback;
    /// <summary>Property to manage the ReceiveDataEx Event, allowing access to the just-read data</summary>
    property OnReceiveDataEx: TReceiveDataExEvent read GetReceiveDataExEvent write SetReceiveDataExEvent;
  public
    destructor Destroy; override;
  end;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

  /// <summary>Interface for HTTPResponse</summary>
  IHTTPResponse = interface(IURLResponse)
    ['{ED07313B-324B-448F-84AD-F199D38981DA}']

    /// <summary>Getter for the HeaderValue Property</summary>
    function GetHeaderValue(const AName: string): string;
    /// <summary>Getter for the ContentCharSet Standard Header Property</summary>
    function GetContentCharSet: string;
    /// <summary>Getter for the ContentEncoding Standard Header Property</summary>
    function GetContentEncoding: string;
    /// <summary>Getter for the ContentLanguage Standard Header Property</summary>
    function GetContentLanguage: string;
    /// <summary>Getter for the ContentLength Standard Header Property</summary>
    function GetContentLength: Int64;
    /// <summary>Getter for the Date Standard Header Property</summary>
    function GetDate: string;
    /// <summary>Getter for the LastModified Standard Header Property</summary>
    function GetLastModified: string;
    /// <summary>Getter for the StatusCode Property</summary>
    function GetStatusCode: Integer;
    /// <summary>Getter for the StatusText Property</summary>
    function GetStatusText: string;
    /// <summary>Getter for the Version Property</summary>
    function GetVersion: THTTPProtocolVersion;

    /// <summary>Function to know if a given header is present</summary>
    /// <param name="AName">Name of the Header</param>
    /// <returns>True if the Header is present.</returns>
    function ContainsHeader(const AName: string): Boolean;

    /// <summary>Getter for the Cookies Property</summary>
    function GetCookies: TCookies;

    /// <summary>Property to Get Header values</summary>
    /// <param name="AName">Name of the Header</param>
    /// <returns>The string value associated to the given name.</returns>
    property HeaderValue[const AName: string]: string read GetHeaderValue;

    /// <summary>Get ContentCharSet from server response</summary>
    property ContentCharSet: string read GetContentCharSet;
    /// <summary>Get ContentEncoding from server response</summary>
    property ContentEncoding: string read GetContentEncoding;
    /// <summary>Get ContentLanguage from server response</summary>
    property ContentLanguage: string read GetContentLanguage;
    /// <summary>Get ContentLength from server response</summary>
    property ContentLength: Int64 read GetContentLength;

    /// <summary>Get Date from server response</summary>
    property Date: string read GetDate;
    /// <summary>Get LastModified from server response</summary>
    property LastModified: string read GetLastModified;

    /// <summary>Get StatusText from server response</summary>
    property StatusText: string read GetStatusText;
    /// <summary>Get StatusCode from server response</summary>
    property StatusCode: Integer read GetStatusCode;
    /// <summary>Get Version from server response</summary>
    property Version: THTTPProtocolVersion read GetVersion;
    /// <summary>Get Cookies from server response</summary>
    property Cookies: TCookies read GetCookies;
  end;

  /// <summary>Class that implements a HTTP response.</summary>
  THTTPResponse = class(TURLResponse, IHTTPResponse)
  protected
    /// <summary>Headers obtained from the response</summary>
    FHeaders: TNetHeaders;
    /// <summary>Cookies received from server</summary>
    FCookies: TCookies;

    /// <summary>Platform dependant implementation for reading the data from the response into a stream</summary>
    procedure DoReadData(const AStream: TStream); virtual; abstract;
    /// <summary>Platform dependant implementation for checking that the data from response must be decompressed</summary>
    function GetDecompressResponse: Boolean; virtual;
    /// <summary>Reset Response before execution</summary>
    procedure DoReset; virtual;

  public
    { IURLResponse }
    /// <summary>Implementation of IURLResponse Getter for the ContentStream property</summary>
    function GetContentStream: TStream;
    /// <summary>Implementation of IURLResponse Getter for the MimeType property</summary>
    function GetMimeType: string; override;
    /// <summary>Implementation of IURLResponse ContentAsString</summary>
    /// <remarks>If you do not provide AEncoding then the system will try to get it from the response</remarks>
    function ContentAsString(const AnEncoding: TEncoding = nil): string; override;

    { IHTTPResponse }
    /// <summary>Implementation of IHTTPResponse for ContainsHeader</summary>
    function ContainsHeader(const AName: string): Boolean; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the HeaderValue property</summary>
    function GetHeaderValue(const AName: string): string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the ContentCharSet property</summary>
    function GetContentCharSet: string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the ContentEncoding property</summary>
    function GetContentEncoding: string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the ContentLanguage property</summary>
    function GetContentLanguage: string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the ContentLength property</summary>
    function GetContentLength: Int64; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the Date property</summary>
    function GetDate: string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the LastModified property</summary>
    function GetLastModified: string; virtual;
    /// <summary>Implementation of IHTTPResponse Getter for the StatusCode property</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function GetStatusCode: Integer; virtual; abstract;
    /// <summary>Implementation of IHTTPResponse Getter for the StatusText property</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function GetStatusText: string; virtual; abstract;
    /// <summary>Implementation of IHTTPResponse Getter for the Version property</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function GetVersion: THTTPProtocolVersion; virtual; abstract;
    /// <summary>Implementation of IHTTPResponse Getter for the Cookies property</summary>
    function GetCookies: TCookies; virtual;

  protected
    /// <summary>Add cookie to response cookies</summary>
    /// <remarks>Internal use only, used in platform specific code</remarks>
    procedure InternalAddCookie(const ACookieData: string);
    /// <summary>Returns realm attribute from Server/Proxy Authentication response</summary>
    /// <remarks>Internal use only</remarks>
    function InternalGetAuthRealm: string;

    constructor Create(const AContext: TObject; const AProc: TProc;
      const AAsyncCallback: TAsyncCallback; const AAsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequest: IHTTPRequest; const AContentStream: TStream); overload;
  public
    destructor Destroy; override;
  end;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

  THTTPRedirectEvent = procedure(const Sender: TObject; const ARequest: IHTTPRequest;
    const AResponse: IHTTPResponse; ARedirections: Integer; var AAllow: Boolean) of object;

  THTTPUpdateCookieEvent = procedure(const Sender: TObject; const ACookie: TCookie;
    const AURL: TURI; var AAllow: Boolean) of object;

  /// <summary> Class that implements a HTTP Client.</summary>
  THTTPClient = class(TURLClient)
  protected type
    TExecutionResult = (Success, UnknownError, ServerCertificateInvalid, ClientCertificateNeeded, Retry);
    InternalState = (Other, ProxyAuthRequired, ServerAuthRequired);
    THTTPState = record
      NeedProxyCredential: Boolean;
      ProxyCredential: TCredentialsStorage.TCredential;
      ProxyCredentials: TCredentialsStorage.TCredentialArray;
      ProxyIterator: Integer;
      NeedServerCredential: Boolean;
      ServerCredential: TCredentialsStorage.TCredential;
      ServerCredentials: TCredentialsStorage.TCredentialArray;
      ServerIterator: Integer;
      Status: InternalState;
      Redirections: Integer;
    end;
  private
    FAllowCookies: Boolean;
    FHandleRedirects: Boolean;
    FSendDataCallback: TSendDataCallback;
    FOnSendData: TSendDataEvent;
    FReceiveDataCallback: TReceiveDataCallback;
    FOnReceiveData: TReceiveDataEvent;
    FReceiveDataExCallback: TReceiveDataExCallback;
    FOnReceiveDataEx: TReceiveDataExEvent;
    [Weak] FCookieManager: TCookieManager;
    FInternalCookieManager: TCookieManager;
    FRedirectsWithGET: THTTPRedirectsWithGET;
    FSecureProtocols: THTTPSecureProtocols;
    FPreemptiveAuthentication: Boolean;
    FAutomaticDecompression: THTTPCompressionMethods;
    FUseDefaultCredentials: Boolean;
    FProtocolVersion: THTTPProtocolVersion;
    FOnRedirect: THTTPRedirectEvent;
    FOnUpdateCookie: THTTPUpdateCookieEvent;
    function CreateRangeHeader(AStart: Int64; AnEnd: Int64): TNetHeader;
    procedure DoNeedClientCertificate(const LRequest: THTTPRequest; const LClientCertificateList: TCertificateList);
    procedure DoValidateServerCertificate(LRequest: THTTPRequest);
    function SetProxyCredential(const ARequest: THTTPRequest; const AResponse: THTTPResponse;
      var State: THTTPClient.THTTPState): Boolean;
    function SetServerCredential(const ARequest: THTTPRequest; const AResponse: THTTPResponse;
      var State: THTTPClient.THTTPState): Boolean;
    function GetAccept: string; inline;
    function GetAcceptCharSet: string; inline;
    function GetAcceptEncoding: string; inline;
    function GetAcceptLanguage: string; inline;
    procedure SetAccept(const Value: string); inline;
    procedure SetAcceptCharSet(const Value: string); inline;
    procedure SetAcceptEncoding(const Value: string); inline;
    procedure SetAcceptLanguage(const Value: string); inline;
    function GetContentType: string; inline;
    procedure SetContentType(const Value: string); inline;
    procedure SetCookieManager(const Value: TCookieManager);
    procedure UpdateCookiesFromResponse(const AResponse: THTTPResponse);
  protected
    /// <summary>Maximum number of redirects to be processed when executing a request.</summary>
    FMaxRedirects: Integer;
    /// <summary>User callback when a ClientCertificate is needed </summary>
    FNeedClientCertificateCallback: TNeedClientCertificateCallback;
    /// <summary>User event when a ClientCertificate is needed </summary>
    FNeedClientCertificateEvent: TNeedClientCertificateEvent;
    /// <summary>Callback called when is needed to Validate a Server certificate.</summary>
    FValidateServerCertificateCallback: TValidateCertificateCallback;
    /// <summary>Event called when is needed to Validate a Server certificate.</summary>
    FValidateServerCertificateEvent: TValidateCertificateEvent;
    FSecureFailureReasons: THTTPSecureFailureReasons;

    /// <summary>Method to get the platform dependant Client Certificates.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    procedure DoGetClientCertificates(const ARequest: THTTPRequest; const ACertificateList: TList<TCertificate>); virtual; abstract;
    /// <summary>Method to be executed when Client Certificates not found.</summary>
    function DoNoClientCertificate(const ARequest: THTTPRequest): Boolean; virtual;
    /// <summary>Method to be executed when the client certificate has been accepted.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function DoClientCertificateAccepted(const ARequest: THTTPRequest; const AnIndex: Integer): Boolean; virtual; abstract;
    /// <summary>Method to get the platform dependant SSL Server Certificates.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function DoGetSSLCertificateFromServer(const ARequest: THTTPRequest): TCertificate; virtual; abstract;
    /// <summary>Method to be executed when the client SSL server certificate has been accepted.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    procedure DoServerCertificateAccepted(const ARequest: THTTPRequest); virtual; abstract;
    /// <summary>Method to execute the platform dependant HTTP request.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function DoExecuteRequest(const ARequest: THTTPRequest; var AResponse: THTTPResponse;
      const AContentStream: TStream): TExecutionResult; virtual; abstract;
    /// <summary>Method to execute the platform independant HTTP request, which
    ///  is translated into platform independant DoExecuteRequest call. </summary>
    procedure ExecuteHTTP(const ARequest: IHTTPRequest; const AContentStream: TStream;
      const AResponse: IHTTPResponse); virtual;
    /// <summary>Method set the server/proxy credentials for a request.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function DoSetCredential(AnAuthTargetType: TAuthTargetType; const ARequest: THTTPRequest;
      const ACredential: TCredentialsStorage.TCredential): Boolean; virtual; abstract;
    /// <summary>Method to execute specific actions after the request has been executed.</summary>
    /// <remarks>Must be overriden in platform Implementation.</remarks>
    function DoProcessStatus(const ARequest: IHTTPRequest; const  AResponse: IHTTPResponse): Boolean; virtual; abstract;

    /// <summary>Returns a new request instance from the client.</summary>
    function DoGetRequestInstance(const ARequestMethod: string; const AURI: TURI): IURLRequest; override;
    /// <summary> Method to get the platform dependant Request instance from a client.</summary>
    /// <remarks> Must be overriden in platform Implementation.</remarks>
    function DoGetHTTPRequestInstance(const AClient: THTTPClient; const ARequestMethod: string;
      const AURI: TURI): IHTTPRequest; virtual; abstract;

    /// <summary>Returns the supported schemes from the client.</summary>
    function SupportedSchemes: TArray<string>; override;

    function DoExecute(const ARequestMethod: string; const AURI: TURI;
      const ASourceStream, AContentStream: TStream; const AHeaders: TNetHeaders): IURLResponse; override;

    /// <summary>Function that asynchronusly executes a Request and obtains a response</summary>
    /// <remarks> This function creates a request before calling InternalExecuteAsync</remarks>
    function DoExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequestMethod: string; const AURI: TURI; const ASourceStream, AContentStream: TStream;
      const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult; override;

    /// <summary>Function that asynchronusly executes a given Request and obtains a response</summary>
    function InternalExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequest: IHTTPRequest; const AContentStream: TStream;
      const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult;

    /// <summary>Getter for the property MaxRedirects</summary>
    /// <returns>Maximum number of redirections to be performed.</returns>
    function GetMaxRedirects: Integer;
    /// <summary>Setter for the property MaxRedirects</summary>
    /// <remarks>Should be overriden in platform if is needed some processing when changing.</remarks>
    /// <param name="Value">Max number of redirections to be processed by the execution of the request.</param>
    procedure SetMaxRedirects(const Value: Integer); virtual;

    /// <summary>This function is like the constructor Create, but is called Initializer to avoid collision with
    /// class function Create.</summary>
    procedure Initializer;

    class function IsRedirect(const AStatusCode: Integer): Boolean; static;
    function IsAutoRedirect(const AResponse: THTTPResponse): Boolean;
    function IsAutoRedirectWithGET(const ARequest: THTTPRequest; const AResponse: THTTPResponse): Boolean;
    function ComposeRedirectURL(const ARequest: THTTPRequest; const AResponse: THTTPResponse): TURI;
  public
    destructor Destroy; override;
    /// <summary>You have to use this function as a constructor Create.</summary>
    /// <remarks>The user is responsible of freeing the obtained object instance</remarks>
    /// <returns>The platform Implementation of an HTTPClient</returns>
    class function Create: THTTPClient;

    /// <summary>Get a Request instance associated with the client for the given Request Method and URI</summary>
    /// <param name="ARequestMethod">Request method to be performed</param>
    /// <param name="AURI">URI to use for the Request</param>
    /// <returns>An interface to the request platform object.</returns>
    /// <remarks>Under 'Windows' This function can raise an exception if the URL's host cannot be reached.
    /// This is tested before doing the connection to the host. Under other platforms this exception is raised upon connection.
    /// in the Execute method. </remarks>
    /// <exception cref="ENetHTTPRequestException"> This is raised if URL's Host cannot be reached.</exception>
    function GetRequest(const ARequestMethod: string; const AURI: TURI): IHTTPRequest; overload;

    /// <summary>Get a Request instance associated with the client for the given Request Method and URI</summary>
    /// <param name="ARequestMethod">Request method to be performed</param>
    /// <param name="AURL">URL to use for the Request</param>
    /// <returns>An interface to the request platform object.</returns>
    /// <remarks>Under 'Windows' This function can raise an exception if the URL's host cannot be reached.
    /// This is tested before doing the connection to the host. Under other platforms this exception is raised upon connection.
    /// in the Execute method. </remarks>
    /// <exception cref="ENetHTTPRequestException"> This is raised if URL's Host cannot be reached.</exception>
    function GetRequest(const ARequestMethod, AURL: string): IHTTPRequest; overload;

    procedure CreateFormFromStrings(const ASource: TStrings; const AEncoding: TEncoding;
      const AHeaders: TNetHeaders; var ASourceStream: TStream; var ASourceHeaders: TNetHeaders);

    // ------------------------------------------- //
    // Standard HTTP Methods
    // ------------------------------------------- //
    /// <summary>Send 'DELETE' command to url</summary>
    function Delete(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Send asynchronous 'DELETE' command to url</summary>
    function BeginDelete(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginDelete(const AsyncCallback: TAsyncCallback; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginDelete(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'DELETE' command to url with a stream</summary>
    function Delete(const AURL: string; const ASource, AResponseContent: TStream;
      const AHeaders: TNetHeaders): IHTTPResponse; overload;
    /// <summary>Send asynchronous 'DELETE' command to url with a stream</summary>
    function BeginDelete(const AURL: string; const ASource, AResponseContent: TStream;
      const AHeaders: TNetHeaders): IAsyncResult; overload;
    function BeginDelete(const AsyncCallback: TAsyncCallback; const AURL: string;
      const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult; overload;
    function BeginDelete(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
      const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult; overload;

    /// <summary>Send 'OPTIONS' command to url</summary>
    function Options(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Send asynchronous 'OPTIONS' command to url</summary>
    function BeginOptions(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginOptions(const AsyncCallback: TAsyncCallback; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginOptions(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'GET' command to url</summary>
    function Get(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Send asynchronous 'GET' command to url</summary>
    function BeginGet(const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginGet(const AsyncCallback: TAsyncCallback; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginGet(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Check if the server has download resume feature</summary>
    function CheckDownloadResume(const AURL: string): Boolean;

    /// <summary>Send 'GET' command to url adding Range header</summary>
    /// <remarks>It's used for resume downloads</remarks>
    function GetRange(const AURL: string; AStart: Int64; AnEnd: Int64 = -1; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Send asynchronous 'GET' command to url adding Range header</summary>
    /// <remarks>It's used for resume downloads</remarks>
    function BeginGetRange(const AURL: string; AStart: Int64; AnEnd: Int64 = -1; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginGetRange(const AsyncCallback: TAsyncCallback; const AURL: string; AStart: Int64; AnEnd: Int64 = -1;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginGetRange(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; AStart: Int64; AnEnd: Int64 = -1;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'TRACE' command to url</summary>
    function Trace(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Send asynchronous 'TRACE' command to url</summary>
    function BeginTrace(const AURL: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginTrace(const AsyncCallback: TAsyncCallback; const AURL: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginTrace(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'HEAD' command to url</summary>
    function Head(const AURL: string; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Send asynchronous 'HEAD' command to url</summary>
    function BeginHead(const AURL: string; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginHead(const AsyncCallback: TAsyncCallback; const AURL: string; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginHead(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Post a raw file without multipart info</summary>
    function Post(const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Post a raw file without multipart info</summary>
    function BeginPost(const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Post TStrings values adding multipart info</summary>
    function Post(const AURL: string; const ASource: TStrings; const AResponseContent: TStream = nil;
      const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Post TStrings values adding multipart info</summary>
    function BeginPost(const AURL: string; const ASource: TStrings; const AResponseContent: TStream = nil;
      const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStrings;
      const AResponseContent: TStream = nil; const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStrings;
      const AResponseContent: TStream = nil; const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Post a stream without multipart info</summary>
    function Post(const AURL: string; const ASource: TStream; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Post a stream without multipart info</summary>
    function BeginPost(const AURL: string; const ASource: TStream; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStream;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Post a multipart form data object</summary>
    function Post(const AURL: string; const ASource: TMultipartFormData; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Post a multipart form data object</summary>
    function BeginPost(const AURL: string; const ASource: TMultipartFormData; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TMultipartFormData;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TMultipartFormData;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Put a raw file without multipart info</summary>
    function Put(const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Put a raw file without multipart info</summary>
    function BeginPut(const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallback: TAsyncCallback; const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASourceFile: string; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Put TStrings values adding multipart info</summary>
    function Put(const AURL: string; const ASource: TStrings; const AResponseContent: TStream = nil;
      const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Put TStrings values adding multipart info</summary>
    function BeginPut(const AURL: string; const ASource: TStrings; const AResponseContent: TStream = nil;
      const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStrings;
      const AResponseContent: TStream = nil; const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStrings;
      const AResponseContent: TStream = nil; const AEncoding: TEncoding = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'PUT' command to url</summary>
    function Put(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Send 'PUT' command to url</summary>
    function BeginPut(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream = nil;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStream = nil;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Put a multipart form data object</summary>
    function Put(const AURL: string; const ASource: TMultipartFormData; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    /// <summary>Asynchronously Put a multipart form data object</summary>
    function BeginPut(const AURL: string; const ASource: TMultipartFormData; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TMultipartFormData;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TMultipartFormData;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    // Non standard command procedures ...
    /// <summary>Send 'MERGE' command to url</summary>
    function Merge(const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Asynchronously Send 'MERGE' command to url</summary>
    function BeginMerge(const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginMerge(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginMerge(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStream;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    /// <summary>Send a special 'MERGE' command to url. Command based on a 'PUT' + 'x-method-override' </summary>
    function MergeAlternative(const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Asynchronously Send a special 'MERGE' command to url. Command based on a 'PUT' + 'x-method-override' </summary>
    function BeginMergeAlternative(const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginMergeAlternative(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginMergeAlternative(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
      const ASource: TStream; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>Send 'PATCH' command to url</summary>
    function Patch(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Asynchronously Send 'PATCH' command to url</summary>
    function BeginPatch(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPatch(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream = nil;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPatch(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; const ASource: TStream = nil;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    /// <summary>Send a special 'PATCH' command to url. Command based on a 'PUT' + 'x-method-override' </summary>
    function PatchAlternative(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IHTTPResponse;
    /// <summary>Asynchronously Send a special 'PATCH' command to url. Command based on a 'PUT' + 'x-method-override' </summary>
    function BeginPatchAlternative(const AURL: string; const ASource: TStream = nil; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPatchAlternative(const AsyncCallback: TAsyncCallback; const AURL: string; const ASource: TStream = nil;
      const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    function BeginPatchAlternative(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
      const ASource: TStream = nil; const AResponseContent: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    // Execute functions for performing requests ...
    /// <summary>You have to use this function to Execute a given Request</summary>
    /// <param name="ARequest">The request that is going to be Executed</param>
    /// <param name="AContentStream">The stream to store the response data. If provided the user is responsible
    /// of releasing it. If not provided will be created internally and released when not needed.</param>
    /// <param name="AHeaders">Additional Headers to pass to the request that is going to be Executed</param>
    /// <returns>The platform dependant response object associated to the given request. It's an Interfaced object and
    /// It's released automatically.</returns>
    function Execute(const ARequest: IHTTPRequest; const AContentStream: TStream = nil;
      const AHeaders: TNetHeaders = nil): IHTTPResponse; overload;
    function Execute(const ARequest: IURLRequest; const AContentStream: TStream = nil;
      const AHeaders: TNetHeaders = nil): IURLResponse; overload; override;

    /// <summary>You have to use this function to Asynchronously Execute a given Request</summary>
    /// <param name="ARequest">The request that is going to be Executed</param>
    /// <param name="AContentStream">The stream to store the response data. If provided the user is responsible
    /// of releasing it. If not provided will be created internally and released when not needed.</param>
    /// <param name="AHeaders">Additional Headers to pass to the request that is going to be Executed</param>
    /// <returns>The Asynchronous Result object associated to the given request. It's an Interfaced object and
    /// It's released automatically.</returns>
    function BeginExecute(const ARequest: IHTTPRequest; const AContentStream: TStream = nil;
      const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    /// <summary>You have to use this function to Asynchronously Execute a given Request</summary>
    /// <param name="AsyncCallback">The Callback that is going to be Executed when the Request finishes.</param>
    /// <param name="ARequest">The request that is going to be Executed</param>
    /// <param name="AContentStream">The stream to store the response data. If provided the user is responsible
    /// of releasing it. If not provided will be created internally and released when not needed.</param>
    /// <param name="AHeaders">Additional Headers to pass to the request that is going to be Executed</param>
    /// <returns>The Asynchronous Result object associated to the given request. It's an Interfaced object and
    /// It's released automatically.</returns>
    function BeginExecute(const AsyncCallback: TAsyncCallback; const ARequest: IHTTPRequest;
      const AContentStream: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;
    /// <summary>You have to use this function to Asynchronously Execute a given Request</summary>
    /// <param name="AsyncCallbackEvent">The Event that is going to be Executed when the Request finishes.</param>
    /// <param name="ARequest">The request that is going to be Executed</param>
    /// <param name="AContentStream">The stream to store the response data. If provided the user is responsible
    /// of releasing it. If not provided will be created internally and released when not needed.</param>
    /// <param name="AHeaders">Additional Headers to pass to the request that is going to be Executed</param>
    /// <returns>The Asynchronous Result object associated to the given request. It's an Interfaced object and
    /// It's released automatically.</returns>
    function BeginExecute(const AsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IHTTPRequest;
      const AContentStream: TStream = nil; const AHeaders: TNetHeaders = nil): IAsyncResult; overload;

    /// <summary>You have to use this function to Wait for the result of a given Asynchronous Request</summary>
    /// <remarks>You must use this class function to ensure that any pending exceptions are raised in the proper context</remarks>
    /// <returns>The platform dependant response object associated to the given request. It's an Interface and It's
    /// released automatically.</returns>
    class function EndAsyncHTTP(const AAsyncResult: IAsyncResult): IHTTPResponse; overload;
    class function EndAsyncHTTP(const AAsyncResult: IHTTPResponse): IHTTPResponse; overload;

    /// <summary> Specifies HTTP protocol version to use. If the specified version is not supported
    /// by the server, then the client will fall back to a lower version. The default value is
    /// UNKNOWN_HTTP, which means use the default OS version, which most often is HTTP_1_1. </summary>
    property ProtocolVersion: THTTPProtocolVersion read FProtocolVersion write FProtocolVersion default THTTPProtocolVersion.UNKNOWN_HTTP;

    /// <summary> Redirection policy to be used by the client. Default value is True</summary>
    property HandleRedirects: Boolean read FHandleRedirects write FHandleRedirects default True;
    /// <summary> Property to manage the Maximum number of redirects when executing a request.
    /// Default value is 5. </summary>
    property MaxRedirects: Integer read GetMaxRedirects write SetMaxRedirects default CHTTPDefMaxRedirects;
    /// <summary> Property controls which HTTP commands and response statuses will
    /// lead to a redirect with HTTP GET command. Default value is [Post301, Post302,
    /// Post303, Put303, Delete303] </summary>
    property RedirectsWithGET: THTTPRedirectsWithGET read FRedirectsWithGET write FRedirectsWithGET default CHTTPDefRedirectsWithGET;
    /// <summary> Event fired when HTTP response will lead a to redirect.
    /// The event is enabled when HandleRedirects=True and number of redirects <= MaxRedirects.
    /// When AAllow is set to False, the redirection will be terminated. </summary>
    property OnRedirect: THTTPRedirectEvent read FOnRedirect write FOnRedirect;

    /// <summary> Callback fired when a ClientCertificate is needed</summary>
    property NeedClientCertificateCallback: TNeedClientCertificateCallback read FNeedClientCertificateCallback write FNeedClientCertificateCallback;
    /// <summary> Callback fired when checking the validity of a Server Certificate</summary>
    property ValidateServerCertificateCallback: TValidateCertificateCallback read FValidateServerCertificateCallback write FValidateServerCertificateCallback;
    /// <summary> Specifies the set of allowed security protocols to use for HTTPS request.
    /// When it is empty, then default OS protocols will be used. Default value is []. </summary>
    property SecureProtocols: THTTPSecureProtocols read FSecureProtocols write FSecureProtocols default CHTTPDefSecureProtocols;
    /// <summary>Property returns a set of reasons, why OnValidateServerCertificate or
    /// ValidateServerCertificateCallback events was called.</summary>
    property SecureFailureReasons: THTTPSecureFailureReasons read FSecureFailureReasons;

    /// <summary>Property controls preemptive authentication. When set to True, then
    /// basic authentication will be provided before the server gives an unauthorized response.
    /// Default value is False. </summary>
    property PreemptiveAuthentication: Boolean read FPreemptiveAuthentication
      write FPreemptiveAuthentication default False;
    /// <summary>Property controls automatic usage of logged user credentials
    /// for NTLM and Negotiate authentication schemas. It is platform dependent and
    /// currently supported on Windows and Linux. Default value is True. </summary>
    property UseDefaultCredentials: Boolean read FUseDefaultCredentials
      write FUseDefaultCredentials default True;

    /// <summary>Property to manage the SendData CallBack</summary>
    property SendDataCallBack: TSendDataCallback read FSendDataCallback write FSendDataCallback;
    /// <summary>Property to manage the ReceiveData Event</summary>
    property OnSendData: TSendDataEvent read FOnSendData write FOnSendData;

    /// <summary>Property to manage the ReceiveData CallBack</summary>
    property ReceiveDataCallBack: TReceiveDataCallback read FReceiveDataCallback write FReceiveDataCallback;
    /// <summary>Property to manage the ReceiveData Event</summary>
    property OnReceiveData: TReceiveDataEvent read FOnReceiveData write FOnReceiveData;
    /// <summary>Property to manage the ReceiveDataEx Callback</summary>
    property ReceiveDataExCallback: TReceiveDataExCallback read FReceiveDataExCallback write FReceiveDataExCallback;
    /// <summary>Property to manage the ReceiveDataEx Event</summary>
    property OnReceiveDataEx: TReceiveDataExEvent read FOnReceiveDataEx write FOnReceiveDataEx;

    /// <summary> Event fired when a ClientCertificate is needed</summary>
    property OnNeedClientCertificate: TNeedClientCertificateEvent read FNeedClientCertificateEvent write FNeedClientCertificateEvent;
    /// <summary> Event fired when checking the validity of a Server Certificate</summary>
    property OnValidateServerCertificate: TValidateCertificateEvent read FValidateServerCertificateEvent write FValidateServerCertificateEvent;

    /// <summary> Cookies policy to be used by the client. If false the cookies
    /// from server will not be accepted, but the cookies in the cookie manager
    /// will be sent. Default value is True. </summary>
    property AllowCookies: Boolean read FAllowCookies write FAllowCookies default True;
    /// <summary> Cookie manager object to be used by the client.</summary>
    property CookieManager: TCookieManager read FCookieManager write SetCookieManager;
    /// <summary> Event fired when HTTP response cookies are added to cookie manager.
    /// The event is fired for each response cookie. When AAllow is set to False, the
    /// cookie is not added. </summary>
    property OnUpdateCookie: THTTPUpdateCookieEvent read FOnUpdateCookie write FOnUpdateCookie;

    /// <summary>Property controls automatic decompression of response body.
    /// It is platform dependent and currently supported on Windows and Linux.
    /// When set, then corresponding "Accept-Encoding" header will be included
    /// into request, and response body will be automatically decoded. On iOS,
    /// macOS and Android platforms decoding is performed automatically. </summary>
    property AutomaticDecompression: THTTPCompressionMethods
      read FAutomaticDecompression write FAutomaticDecompression default [];

    // Default Request headers properties.
    /// <summary>Property to manage the 'Accept' header</summary>
    property Accept: string read GetAccept write SetAccept;
    /// <summary>Property to manage the 'Accept-CharSet' header</summary>
    property AcceptCharSet: string read GetAcceptCharSet write SetAcceptCharSet;
    /// <summary>Property to manage the 'Accept-Encoding' header</summary>
    property AcceptEncoding: string read GetAcceptEncoding write SetAcceptEncoding;
    /// <summary>Property to manage the 'Accept-Language' header</summary>
    property AcceptLanguage: string read GetAcceptLanguage write SetAcceptLanguage;
    /// <summary>Property to manage the 'Content-Type' header</summary>
    property ContentType: string read GetContentType write SetContentType;
  end;

// -------------------------------------------------------------------------------- //
// -------------------------------------------------------------------------------- //

implementation

uses
{$IFDEF ANDROID}
  System.Net.HttpClient.Android,
{$ENDIF ANDROID}
{$IFDEF LINUX}
  System.Net.HttpClient.Curl,
{$ENDIF LINUX}
{$IFDEF MACOS}
  System.Net.HttpClient.Mac,
{$ENDIF MACOS}
{$IFDEF MSWINDOWS}
  System.Net.HttpClient.Win,
{$ENDIF}
  System.ZLib,
  System.DateUtils,
  System.NetConsts,
  System.NetEncoding;

{ THTTPClient }

procedure THTTPClient.Initializer;
begin
  inherited Create;
  FMaxRedirects := CHTTPDefMaxRedirects;
  FHandleRedirects := True;
  FRedirectsWithGET := CHTTPDefRedirectsWithGET;
  FSecureProtocols := CHTTPDefSecureProtocols;
  FInternalCookieManager := TCookieManager.Create;
  FCookieManager := FInternalCookieManager;
  FAllowCookies := True;
  UseDefaultCredentials := True;
end;

destructor THTTPClient.Destroy;
begin
  FInternalCookieManager.Free;
  inherited;
end;

class function THTTPClient.Create: THTTPClient;
begin
  Result := THTTPClient(TURLSchemes.GetURLClientInstance('HTTP')); // do not translate
end;

class function THTTPClient.EndAsyncHTTP(const AAsyncResult: IAsyncResult): IHTTPResponse;
begin
  (AAsyncResult as TBaseAsyncResult).WaitForCompletion;
  Result := AAsyncResult as IHTTPResponse;
end;

class function THTTPClient.EndAsyncHTTP(const AAsyncResult: IHTTPResponse): IHTTPResponse;
begin
  (AAsyncResult as TBaseAsyncResult).WaitForCompletion;
  Result := AAsyncResult;
end;

function THTTPClient.Execute(const ARequest: IHTTPRequest; const AContentStream: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LHeader: TNetHeader;
begin
  if ARequest.IsCancelled then
    (ARequest as THTTPRequest).DoResetCancel;

  if AHeaders <> nil then
    for LHeader in AHeaders do
      ARequest.SetHeaderValue(LHeader.Name, LHeader.Value);

  Result := DoGetResponseInstance(Self, nil, nil, nil, ARequest, AContentStream) as IHTTPResponse;
  ExecuteHTTP(ARequest, AContentStream, Result);
end;

function THTTPClient.Execute(const ARequest: IURLRequest;
  const AContentStream: TStream; const AHeaders: TNetHeaders): IURLResponse;
begin
  Result := Execute(IHTTPRequest(ARequest), AContentStream, AHeaders);
end;

function THTTPClient.BeginExecute(const ARequest: IHTTPRequest; const AContentStream: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := InternalExecuteAsync(nil, nil, ARequest, AContentStream, AHeaders, False);
end;

function THTTPClient.BeginExecute(const AsyncCallback: TAsyncCallback; const ARequest: IHTTPRequest;
  const AContentStream: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := InternalExecuteAsync(AsyncCallback, nil, ARequest, AContentStream, AHeaders, False);
end;

function THTTPClient.BeginExecute(const AsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IHTTPRequest;
  const AContentStream: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := InternalExecuteAsync(nil, AsyncCallbackEvent, ARequest, AContentStream, AHeaders, False);
end;

function THTTPClient.InternalExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
  const ARequest: IHTTPRequest; const AContentStream: TStream;
  const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult;
var
  LHeader: TNetHeader;
  LContentStream: TStream;
  LAsync: IAsyncResult;
  LRequest: THTTPRequest;
{$IFDEF AUTOREFCOUNT}
  LSourceStream: TStream;
{$ENDIF}
begin
  if ARequest.IsCancelled then
    (ARequest as THTTPRequest).DoResetCancel;

  if AHeaders <> nil then
    for LHeader in AHeaders do
      ARequest.SetHeaderValue(LHeader.Name, LHeader.Value);

  LRequest := ARequest as THTTPRequest;
  if AOwnsSourceStream then
    LRequest.FOwnedStream := LRequest.FSourceStream
{$IFDEF AUTOREFCOUNT}
  else
    LSourceStream := LRequest.FSourceStream
{$ENDIF};
  LContentStream := AContentStream;

  LAsync := DoGetResponseInstance(Self,
    procedure
    begin
      try
        ExecuteHTTP(ARequest, LContentStream, (LAsync as THttpResponse));
      finally
{$IFDEF AUTOREFCOUNT}
        LSourceStream := nil;
{$ENDIF}
      end;
    end, AsyncCallback, AsyncCallbackEvent, ARequest, AContentStream);
  Result := LAsync;

  // Invoke Async Execution.
  (LAsync as THttpResponse).Invoke;
end;

procedure THTTPClient.DoNeedClientCertificate(const LRequest: THTTPRequest; const LClientCertificateList: TCertificateList);
var
  LClientCertificateIndex: Integer;
  LRequestNoCertificate: Boolean;
begin
  LClientCertificateIndex := -1;
  LRequestNoCertificate := False;
  if Assigned(FNeedClientCertificateCallback) or Assigned(FNeedClientCertificateEvent) then
  begin
    DoGetClientCertificates(LRequest, LClientCertificateList);
    if LClientCertificateList.Count = 0 then
    begin
      LRequestNoCertificate := DoNoClientCertificate(LRequest);
      if not LRequestNoCertificate then
        raise ENetHTTPCertificateException.CreateRes(@SNetHttpEmptyCertificateList);
    end
    else if Assigned(FNeedClientCertificateCallback) then
      FNeedClientCertificateCallback(Self, LRequest, LClientCertificateList, LClientCertificateIndex)
    else
      FNeedClientCertificateEvent(Self, LRequest, LClientCertificateList, LClientCertificateIndex);
  end;
  if not LRequestNoCertificate then
  begin
    if LClientCertificateIndex < 0 then
    begin
      LRequestNoCertificate := DoNoClientCertificate(LRequest);
      if not LRequestNoCertificate then
        raise ENetHTTPCertificateException.CreateRes(@SNetHttpUnspecifiedCertificate);
    end
    else
      if DoClientCertificateAccepted(LRequest, LClientCertificateIndex) = False then
        raise ENetHTTPCertificateException.CreateRes(@SNetHttpRejectedCertificate);
  end;
end;

function THTTPClient.DoNoClientCertificate(const ARequest: THTTPRequest): Boolean;
begin
  Result := False;
end;

procedure THTTPClient.DoValidateServerCertificate(LRequest: THTTPRequest);
var
  LServerCertAccepted: Boolean;
  LServerCertificate: TCertificate;
begin
  LServerCertAccepted := SecureFailureReasons = [];
  if Assigned(FValidateServerCertificateCallback) or Assigned(FValidateServerCertificateEvent) then
  begin
    LServerCertificate := DoGetSSLCertificateFromServer(LRequest);
    if LServerCertificate.IsEmpty then
      raise ENetHTTPCertificateException.CreateRes(@SNetHttpGetServerCertificate);
    if Assigned(FValidateServerCertificateCallback) then
      FValidateServerCertificateCallback(Self, LRequest, LServerCertificate, LServerCertAccepted)
    else
      FValidateServerCertificateEvent(Self, LRequest, LServerCertificate, LServerCertAccepted);
  end
  else
    raise ENetHTTPCertificateException.CreateRes(@SNetHttpInvalidServerCertificate);
  if not LServerCertAccepted then
    raise ENetHTTPCertificateException.CreateRes(@SNetHttpServerCertificateNotAccepted)
  else
    DoServerCertificateAccepted(LRequest);
end;

function THTTPClient.DoExecute(const ARequestMethod: string; const AURI: TURI; const ASourceStream,
  AContentStream: TStream; const AHeaders: TNetHeaders): IURLResponse;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(ARequestMethod, AURI);
  LRequest.SourceStream := ASourceStream;
  Result := Execute(LRequest, AContentStream, AHeaders);
end;

function THTTPClient.DoExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
  const ARequestMethod: string; const AURI: TURI; const ASourceStream, AContentStream: TStream;
  const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(ARequestMethod, AURI);
  LRequest.SourceStream := ASourceStream;
  Result := InternalExecuteAsync(AsyncCallback, AsyncCallbackEvent, LRequest, AContentStream, AHeaders, AOwnsSourceStream);
end;

procedure THTTPClient.ExecuteHTTP(const ARequest: IHTTPRequest; const AContentStream: TStream; const AResponse: IHTTPResponse);
var
  LRequest: THTTPRequest;
  LResponse: THTTPResponse;
  State: THTTPState;
  LExecResult: TExecutionResult;
  LClientCertificateList: TCertificateList;
  OrigSourceStreamPosition: Int64;
  OrigContentStreamPosition: Int64;
  OrigContentStreamSize: Int64;
  Status: Integer;
  LCookieHeader: string;
  LAllow: Boolean;
begin
  LResponse := AResponse as THTTPResponse;
  LRequest := ARequest as THTTPRequest;
  OrigSourceStreamPosition := 0;
  if LRequest.FSourceStream <> nil then
    OrigSourceStreamPosition := LRequest.FSourceStream.Position;

  if AContentStream <> nil then
  begin
    OrigContentStreamPosition := AContentStream.Position;
    OrigContentStreamSize := AContentStream.Size;
  end
  else
  begin
    OrigContentStreamPosition := 0;
    OrigContentStreamSize := 0;
  end;

  State := Default(THTTPState);
  FSecureFailureReasons := [];
  LClientCertificateList := TCertificateList.Create;
  try
    while True do
    begin
      if LRequest.FCancelled then
        Exit;
      // Prepare Request for execution
      LRequest.DoPrepare;
      if LRequest.FCancelled then
        Exit;

      // Add Cookies
      if FCookieManager <> nil then
      begin
        LCookieHeader := FCookieManager.CookieHeaders(LRequest.FURL);
        if LCookieHeader <> '' then
          LRequest.SetHeaderValue(sCookie, LCookieHeader);
      end;

      if not SetServerCredential(LRequest, LResponse, State) then
        Break;
      if not SetProxyCredential(LRequest, LResponse, State) then
        Break;
      State.Status := InternalState.Other;

      if LRequest.FSourceStream <> nil then
        LRequest.FSourceStream.Position := OrigSourceStreamPosition;

      if LResponse <> nil then
      begin
        // Reset Response before execution
        LResponse.DoReset;
        LResponse.FStream.Size := OrigContentStreamSize;
        LResponse.FStream.Position := OrigContentStreamPosition;
      end;

      if LRequest.FCancelled then
        Exit;
      LExecResult := DoExecuteRequest(LRequest, LResponse, AContentStream);
      if LRequest.FCancelled then
        Exit;
      case LExecResult of
        TExecutionResult.Success:
          begin
            if not SameText(LRequest.FMethodString, sHTTPMethodHead) and
               (LResponse.FStream <> nil) then
              LResponse.DoReadData(LResponse.FStream);
            if LRequest.FCancelled then
              Exit;
            Status := LResponse.GetStatusCode;
            case Status of
              200:
                begin
                  Break;
                end;
              401:
                begin
                  // If preemptive authentication failed then fallback to normal path
                  if (State.Status = InternalState.Other) and PreemptiveAuthentication then
                    State.ServerCredential := Default(TCredentialsStorage.TCredential);
                  State.Status := InternalState.ServerAuthRequired;
                end;
              407:
                begin
                  // If preemptive authentication failed then fallback to normal path
                  if (State.Status = InternalState.Other) and PreemptiveAuthentication then
                    State.ProxyCredential := Default(TCredentialsStorage.TCredential);
                  State.Status := InternalState.ProxyAuthRequired;
                end;
              else
                begin
                  if IsRedirect(Status) then
                  begin
                    FSecureFailureReasons := [];
                    if FHandleRedirects then
                    begin
                      Inc(State.Redirections);
                      if State.Redirections > FMaxRedirects then
                        raise ENetHTTPRequestException.CreateResFmt(@SNetHttpMaxRedirections, [FMaxRedirects]);
                      if Assigned(OnRedirect) then
                      begin
                        LAllow := True;
                        OnRedirect(Self, ARequest, AResponse, State.Redirections, LAllow);
                        if not LAllow then
                          Break;
                      end;
                    end
                    else
                      Break;
                  end;
                  State.Status := InternalState.Other;
                  if DoProcessStatus(LRequest, LResponse) then
                    Break;
                end;
            end;
          end;
        TExecutionResult.ServerCertificateInvalid:
          DoValidateServerCertificate(LRequest);
        TExecutionResult.ClientCertificateNeeded:
          DoNeedClientCertificate(LRequest, LClientCertificateList);
        TExecutionResult.Retry:
          Continue;
        else
          raise ENetHTTPClientException.CreateRes(@SNetHttpClientUnknownError);
      end;
      if LRequest.FCancelled then
        Exit;
      // Every loop we do, update Cookies.
      if AllowCookies then
        UpdateCookiesFromResponse(LResponse);
    end;
    // When we finish the request, update cookies.
    if AllowCookies then
      UpdateCookiesFromResponse(LResponse);
  finally
    // Always leave streams in the correct positions.
    if LRequest.FSourceStream <> nil then
      LRequest.FSourceStream.Seek(0, TSeekOrigin.soEnd);
    if LResponse.FStream <> nil then
      LResponse.FStream.Position := OrigContentStreamPosition;
    LClientCertificateList.Free;
  end;
end;

function THTTPClient.DoGetRequestInstance(const ARequestMethod: string; const AURI: TURI): IURLRequest;
var
  LHeader: TNetHeader;
  LRequest: IHTTPRequest;
  LRequestObj: THTTPRequest;
begin
  if ARequestMethod = '' then
    LRequest := DoGetHTTPRequestInstance(Self, sHTTPMethodGet, AURI)
  else
    LRequest := DoGetHTTPRequestInstance(Self, ARequestMethod, AURI);
  Result := LRequest;
  for LHeader in FCustomHeaders do
    LRequest.AddHeader(LHeader.Name, LHeader.Value);
  LRequestObj := LRequest as THttpRequest;
  LRequestObj.FOnSendData := FOnSendData;
  LRequestObj.FSendDataCallback := FSendDataCallback;
  LRequestObj.FOnReceiveData := FOnReceiveData;
  LRequestObj.FReceiveDataCallback := FReceiveDataCallback;
  LRequestObj.FOnReceiveDataEx := FOnReceiveDataEx;
  LRequestObj.FReceiveDataExCallback := FReceiveDataExCallback;
end;

function THTTPClient.GetAccept: string;
begin
  Result := GetCustomHeaderValue(sAccept);
end;

function THTTPClient.GetAcceptCharSet: string;
begin
  Result := GetCustomHeaderValue(sAcceptCharset);
end;

function THTTPClient.GetAcceptEncoding: string;
begin
  Result := GetCustomHeaderValue(sAcceptEncoding);
end;

function THTTPClient.GetAcceptLanguage: string;
begin
  Result := GetCustomHeaderValue(sAcceptLanguage);
end;

function THTTPClient.Delete(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodDelete, TURI.Create(AURL), nil,
    AResponseContent, AHeaders));
end;

function THTTPClient.Delete(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodDelete, TURI.Create(AURL), ASource,
    AResponseContent, AHeaders));
end;

function THTTPClient.BeginDelete(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodDelete, TURI.Create(AURL), nil,
    AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginDelete(const AsyncCallback: TAsyncCallback; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodDelete, TURI.Create(AURL),
    nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginDelete(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodDelete, TURI.Create(AURL),
    nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginDelete(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodDelete, TURI.Create(AURL), ASource,
    AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginDelete(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodDelete, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginDelete(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodDelete, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.Get(const AURL: string; const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodGet, TURI.Create(AURL), nil, AResponseContent, AHeaders));
end;

function THTTPClient.BeginGet(const AsyncCallback: TAsyncCallback; const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodGet, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginGet(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodGet, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginGet(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodGet, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.GetContentType: string;
begin
  Result := GetCustomHeaderValue(sContentType);
end;

function THTTPClient.GetMaxRedirects: Integer;
begin
  Result := FMaxRedirects;
end;

function THTTPClient.CheckDownloadResume(const AURL: string): Boolean;
var
  LResponse: IHTTPResponse;
  LValue: string;
begin
  LResponse := Head(AURL, [TNetHeader.Create(sRange, 'bytes=0-1')]); // do not translate
  if LResponse.StatusCode = 206 then
    Result := True
  else
  begin
    LValue := LResponse.HeaderValue[sAcceptRanges];
    if (LValue = '') or SameText(LResponse.HeaderValue[sAcceptRanges], 'none') then  // do not translate
      Result := False
    else
      Result := True;
  end;
end;

function THTTPClient.CreateRangeHeader(AStart: Int64; AnEnd: Int64): TNetHeader;
var
  LRange: string;
begin
  LRange := 'bytes=';  // do not translate
  if AStart > -1 then
    LRange := LRange + AStart.ToString;
  LRange := LRange + '-';
  if AnEnd > -1 then
    LRange := LRange + AnEnd.ToString;
  Result := TNetHeader.Create(sRange, LRange);
end;

function THTTPClient.GetRange(const AURL: string; AStart, AnEnd: Int64; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := Get(AURL, AResponseContent, AHeaders + [CreateRangeHeader(AStart, AnEnd)]);
end;

function THTTPClient.BeginGetRange(const AURL: string; AStart, AnEnd: Int64; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := BeginGet(AURL, AResponseContent, AHeaders + [CreateRangeHeader(AStart, AnEnd)]);
end;

function THTTPClient.BeginGetRange(const AsyncCallback: TAsyncCallback; const AURL: string; AStart, AnEnd: Int64;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := BeginGet(AsyncCallback, AURL, AResponseContent, AHeaders + [CreateRangeHeader(AStart, AnEnd)]);
end;

function THTTPClient.BeginGetRange(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string; AStart,
  AnEnd: Int64; const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := BeginGet(AsyncCallbackEvent, AURL, AResponseContent, AHeaders + [CreateRangeHeader(AStart, AnEnd)]);
end;

function THTTPClient.GetRequest(const ARequestMethod: string; const AURI: TURI): IHTTPRequest;
begin
  Result := IHTTPRequest(TURLClient(Self).GetRequest(ARequestMethod, AURI));
end;

function THTTPClient.GetRequest(const ARequestMethod, AURL: string): IHTTPRequest;
begin
  Result := IHTTPRequest(TURLClient(Self).GetRequest(ARequestMethod, TURI.Create(AURL)));
end;

function THTTPClient.Head(const AURL: string; const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodHead, TURI.Create(AURL), nil, nil, AHeaders));
end;

function THTTPClient.BeginHead(const AURL: string; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodHead, TURI.Create(AURL), nil, nil, AHeaders, False);
end;

function THTTPClient.BeginHead(const AsyncCallback: TAsyncCallback; const AURL: string;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodHead, TURI.Create(AURL),
    nil, nil, AHeaders, False);
end;

function THTTPClient.BeginHead(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodHead, TURI.Create(AURL),
    nil, nil, AHeaders, False);
end;

function THTTPClient.Merge(const AURL: string; const ASource: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodMerge, TURI.Create(AURL),
    ASource, nil, AHeaders));
end;

function THTTPClient.MergeAlternative(const AURL: string; const ASource: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch), TNetHeader.Create('PATCHTYPE', sHTTPMethodMerge)] + AHeaders; // Do not translate
  Result := IHTTPResponse(DoExecute(sHTTPMethodPut, TURI.Create(AURL),
    ASource, nil, LHeaders));
end;

function THTTPClient.BeginMergeAlternative(const AURL: string; const ASource: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch), TNetHeader.Create('PATCHTYPE', sHTTPMethodMerge)] + AHeaders; // Do not translate
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, nil, LHeaders, False);
end;

function THTTPClient.BeginMergeAlternative(const AsyncCallback: TAsyncCallback;
  const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch), TNetHeader.Create('PATCHTYPE', sHTTPMethodMerge)] + AHeaders; // Do not translate
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, nil, LHeaders, False);
end;

function THTTPClient.BeginMergeAlternative(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch), TNetHeader.Create('PATCHTYPE', sHTTPMethodMerge)] + AHeaders; // Do not translate
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPut, TURI.Create(AURL),
    ASource, nil, LHeaders, False);
end;

function THTTPClient.BeginMerge(const AURL: string; const ASource: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodMerge, TURI.Create(AURL),
    ASource, nil, AHeaders, False);
end;

function THTTPClient.BeginMerge(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodMerge, TURI.Create(AURL),
    ASource, nil, AHeaders, False);
end;

function THTTPClient.BeginMerge(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodMerge, TURI.Create(AURL),
    ASource, nil, AHeaders, False);
end;

function THTTPClient.Options(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodOptions, TURI.Create(AURL),
    nil, AResponseContent, AHeaders));
end;

function THTTPClient.BeginOptions(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodOptions, TURI.Create(AURL),
    nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginOptions(const AsyncCallback: TAsyncCallback; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodOptions, TURI.Create(AURL),
    nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginOptions(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodOptions, TURI.Create(AURL),
    nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.Patch(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodPatch, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders));
end;

function THTTPClient.PatchAlternative(const AURL: string; const ASource,
  AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch)] + AHeaders;
  Result := IHTTPResponse(DoExecute(sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, LHeaders));
end;

function THTTPClient.BeginPatchAlternative(const AURL: string; const ASource,
  AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch)] + AHeaders;
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, LHeaders, False);
end;

function THTTPClient.BeginPatchAlternative(const AsyncCallback: TAsyncCallback;
  const AURL: string; const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch)] + AHeaders;
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, LHeaders, False);
end;

function THTTPClient.BeginPatchAlternative(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LHeaders: TNetHeaders;
begin
  LHeaders := [TNetHeader.Create(sXMethodOverride, sHTTPMethodPatch)] + AHeaders;
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, LHeaders, False);
end;

function THTTPClient.BeginPatch(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPatch, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPatch(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPatch, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPatch(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPatch,
    TURI.Create(AURL), ASource, AResponseContent, AHeaders, False);
end;

procedure THTTPClient.CreateFormFromStrings(const ASource: TStrings; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders; var ASourceStream: TStream; var ASourceHeaders: TNetHeaders);
var
  LParams: string;
  LEncoding: TEncoding;
  I: Integer;
  Pos: Integer;
begin
  if AEncoding = nil then
    LEncoding := TEncoding.UTF8
  else
    LEncoding := AEncoding;

  LParams := '';
  for I := 0 to ASource.Count - 1 do
  begin
    Pos := ASource[I].IndexOf('=');
    if Pos >= 0 then
      LParams := LParams +
        TNetEncoding.URL.EncodeForm(ASource[I].Substring(0, Pos), [], LEncoding) + '=' +
        TNetEncoding.URL.EncodeForm(ASource[I].Substring(Pos + 1), [], LEncoding) + '&';
  end;
  if (LParams <> '') and (LParams[High(LParams)] = '&') then
    LParams := LParams.Substring(0, LParams.Length - 1); // Remove last &

  ASourceStream := TStringStream.Create(LParams, TEncoding.ASCII, False);
  try
    ASourceHeaders := [TNetHeader.Create(sContentType,
      'application/x-www-form-urlencoded; charset=' + LEncoding.MIMEName)] + AHeaders;  // do not translate
  except
    FreeAndNil(ASourceStream);
    raise;
  end;
end;

function THTTPClient.Post(const AURL: string; const ASource: TStrings;
  const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IHTTPResponse;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  try
    Result := IHTTPResponse(DoExecute(sHTTPMethodPost, TURI.Create(AURL),
      LSourceStream, AResponseContent, LSourceHeaders));
  finally
    LSourceStream.Free;
  end;
end;

function THTTPClient.Post(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodPost, TURI.Create(AURL), ASource,
    AResponseContent, AHeaders));
end;

function THTTPClient.Post(const AURL: string; const ASourceFile: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LSourceStream: TStream;
begin
  LSourceStream := TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite);
  try
    Result := IHTTPResponse(DoExecute(sHTTPMethodPost, TURI.Create(AURL),
      LSourceStream, AResponseContent, AHeaders));
  finally
    LSourceStream.Free;
  end;
end;

function THTTPClient.Post(const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPost, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := Execute(LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPost(const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPost, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource: TMultipartFormData; const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPost, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(AsyncCallback, LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource: TMultipartFormData; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPost, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(AsyncCallbackEvent, LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPost(const AURL: string; const ASource: TStrings;
  const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPost, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource: TStrings; const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPost, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const ASource: TStrings; const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPost, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.BeginPost(const AURL, ASourceFile: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPost, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.BeginPost(const AsyncCallback: TAsyncCallback;
  const AURL, ASourceFile: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPost, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL, ASourceFile: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPost, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.BeginPost(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPost, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPost(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPost, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPost(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPost, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.Put(const AURL, ASourceFile: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LSourceStream: TStream;
begin
  LSourceStream := TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite);
  try
    Result := IHTTPResponse(DoExecute(sHTTPMethodPut, TURI.Create(AURL),
      LSourceStream, AResponseContent, AHeaders));
  finally
    LSourceStream.Free;
  end;
end;

function THTTPClient.BeginPut(const AURL, ASourceFile: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPut, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.BeginPut(const AsyncCallback: TAsyncCallback; const AURL,
  ASourceFile: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPut, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL, ASourceFile: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPut, TURI.Create(AURL),
    TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite),
    AResponseContent, AHeaders, True);
end;

function THTTPClient.Put(const AURL: string; const ASource: TStrings;
  const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IHTTPResponse;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  try
    Result := IHTTPResponse(DoExecute(sHTTPMethodPut, TURI.Create(AURL),
      LSourceStream, AResponseContent, LSourceHeaders));
  finally
    LSourceStream.Free;
  end;
end;

function THTTPClient.BeginPut(const AURL: string; const ASource: TStrings;
  const AResponseContent: TStream; const AEncoding: TEncoding;
  const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPut, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.BeginPut(const AsyncCallback: TAsyncCallback;
  const AURL: string; const ASource: TStrings; const AResponseContent: TStream;
  const AEncoding: TEncoding; const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPut, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource: TStrings; const AResponseContent: TStream;
  const AEncoding: TEncoding; const AHeaders: TNetHeaders): IAsyncResult;
var
  LSourceStream: TStream;
  LSourceHeaders: TNetHeaders;
begin
  CreateFormFromStrings(ASource, AEncoding, AHeaders, LSourceStream, LSourceHeaders);
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPut, TURI.Create(AURL),
    LSourceStream, AResponseContent, LSourceHeaders, True);
end;

function THTTPClient.Put(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders));
end;

function THTTPClient.BeginPut(const AURL: string; const ASource, AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPut(const AsyncCallback: TAsyncCallback; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const ASource, AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodPut, TURI.Create(AURL),
    ASource, AResponseContent, AHeaders, False);
end;

function THTTPClient.Put(const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPut, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := Execute(LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPut(const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPut, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPut(const AsyncCallback: TAsyncCallback;
  const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPut, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(AsyncCallback, LRequest, AResponseContent, AHeaders);
end;

function THTTPClient.BeginPut(const AsyncCallbackEvent: TAsyncCallbackEvent;
  const AURL: string; const ASource: TMultipartFormData;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
var
  LRequest: IHTTPRequest;
begin
  LRequest := GetRequest(sHTTPMethodPut, AURL);
  LRequest.SourceStream := ASource.Stream;
  LRequest.SourceStream.Position := 0;
  LRequest.SetHeaderValue(sContentType, ASource.MimeTypeHeader);
  Result := BeginExecute(AsyncCallbackEvent, LRequest, AResponseContent, AHeaders);
end;

procedure THTTPClient.SetAccept(const Value: string);
begin
  SetCustomHeaderValue(sAccept, Value);
end;

procedure THTTPClient.SetAcceptCharSet(const Value: string);
begin
  SetCustomHeaderValue(sAcceptCharset, Value);
end;

procedure THTTPClient.SetAcceptEncoding(const Value: string);
begin
  SetCustomHeaderValue(sAcceptEncoding, Value);
end;

procedure THTTPClient.SetAcceptLanguage(const Value: string);
begin
  SetCustomHeaderValue(sAcceptLanguage, Value);
end;

procedure THTTPClient.SetContentType(const Value: string);
begin
  SetCustomHeaderValue(sContentType, Value);
end;

procedure THTTPClient.SetCookieManager(const Value: TCookieManager);
begin
{$IFNDEF AUTOREFCOUNT}
  FInternalCookieManager.Free;
{$ENDIF AUTOREFCOUNT}
  FInternalCookieManager := nil;
  FCookieManager := Value;
  if FCookieManager = nil then
    AllowCookies := False;
end;

procedure THTTPClient.SetMaxRedirects(const Value: Integer);
begin
  FMaxRedirects := Value;
end;

function THTTPClient.SetProxyCredential(const ARequest: THTTPRequest; const AResponse: THTTPResponse;
  var State: THTTPClient.THTTPState): Boolean;
var
  LAbortAuth: Boolean;
  LPersistence: TAuthPersistenceType;
  LCredentials: TCredentialsStorage.TCredentialArray;
  OldPass: string;
  OldUser: string;
begin
  Result := True;
  LPersistence := TAuthPersistenceType.Client;

  // Try Preemptive Authentication
  LCredentials := CredentialsStorage.FindCredentials(TAuthTargetType.Proxy, '');
  if (State.Status = InternalState.Other) and PreemptiveAuthentication and
     (not ProxySettings.Credential.IsEmpty or (Length(LCredentials) = 1) or
      Assigned(FAuthCallback) or Assigned(FAuthEvent)) then
  begin
    if not ProxySettings.Credential.IsEmpty then
      State.ProxyCredential := ProxySettings.Credential
    else if Length(LCredentials) = 1 then
      State.ProxyCredential := LCredentials[0]
    else
      State.ProxyCredential := Default(TCredentialsStorage.TCredential);
    LAbortAuth := False;
    DoAuthCallback(TAuthTargetType.Proxy, State.ProxyCredential.Realm, ARequest.GetURL.ToString,
      State.ProxyCredential.UserName, State.ProxyCredential.Password, LAbortAuth, LPersistence);
    State.NeedProxyCredential := not LAbortAuth and not State.ProxyCredential.IsEmpty;
  end;

  if State.Status = InternalState.ProxyAuthRequired then
  begin
    if State.ProxyCredential.UserName = '' then
    // It's the first Proxy auth request
    begin
      if ProxySettings.Host <> '' then
        State.ProxyCredentials := [ProxySettings.Credential]
      else
        State.ProxyCredentials := [];
      State.ProxyCredentials := State.ProxyCredentials + GetCredentials(TAuthTargetType.Proxy,
        AResponse.InternalGetAuthRealm, '');
      State.NeedProxyCredential := True;
    end;
  end;
  if State.NeedProxyCredential then
  begin
    if State.Status = InternalState.ProxyAuthRequired then
    begin
      if State.ProxyIterator < Length(State.ProxyCredentials) then
      begin
        // Get the next credential from the storage
        State.ProxyCredential.AuthTarget := TAuthTargetType.Proxy;
        State.ProxyCredential.UserName := State.ProxyCredentials[State.ProxyIterator].UserName;
        State.ProxyCredential.Password := State.ProxyCredentials[State.ProxyIterator].Password;
        Inc(State.ProxyIterator);
      end
      else
      begin
        // Can't get a valid proxy credential from the storage so ask to the user
        LAbortAuth := False;
        State.ProxyCredential.AuthTarget := TAuthTargetType.Proxy;
        OldUser := State.ProxyCredential.UserName;
        OldPass := State.ProxyCredential.Password;
        State.ProxyCredential.UserName := '';
        State.ProxyCredential.Password := '';
        DoAuthCallback(TAuthTargetType.Proxy, AResponse.InternalGetAuthRealm, ARequest.GetURL.ToString,
          State.ProxyCredential.UserName, State.ProxyCredential.Password, LAbortAuth, LPersistence);
        if LAbortAuth then
        begin
          State.ProxyCredential.UserName := '';
          State.ProxyCredential.Password := '';
        end;
        if not State.ProxyCredential.IsEmpty then
        begin
          // If it is the same user and password than the previous one we empty the given and abort the operation to avoid infinite loops.
          if (State.ProxyCredential.UserName = OldUser) and (State.ProxyCredential.Password = OldPass) then
          begin
            State.ProxyCredential.UserName := '';
            State.ProxyCredential.Password := '';
          end
          else
            if LPersistence = TAuthPersistenceType.Client then
              CredentialsStorage.AddCredential(State.ProxyCredential);
        end;
      end;
    end;
    if not State.ProxyCredential.IsEmpty then
      Result := DoSetCredential(TAuthTargetType.Proxy, ARequest, State.ProxyCredential)
    else
      // We need a Credential but we haven't found a good one, so exit
      Result := False;
  end;
end;

function THTTPClient.SetServerCredential(const ARequest: THTTPRequest; const AResponse: THTTPResponse;
  var State: THTTPClient.THTTPState): Boolean;
var
  LAbortAuth: Boolean;
  LPersistence: TAuthPersistenceType;
  LCredentials: TCredentialsStorage.TCredentialArray;
  OldPass: string;
  OldUser: string;
begin
  Result := True;
  LPersistence := TAuthPersistenceType.Client;

  // Try Preemptive Authentication
  LCredentials := CredentialsStorage.FindCredentials(TAuthTargetType.Server, '');
  if (State.Status = InternalState.Other) and PreemptiveAuthentication and
     (not ARequest.GetCredential.IsEmpty or (Length(LCredentials) = 1) or
      Assigned(FAuthCallback) or Assigned(FAuthEvent)) then
  begin
    if not ARequest.GetCredential.IsEmpty then
      State.ServerCredential := ARequest.GetCredential
    else if Length(LCredentials) = 1 then
      State.ServerCredential := LCredentials[0]
    else
      State.ServerCredential := Default(TCredentialsStorage.TCredential);
    LAbortAuth := False;
    DoAuthCallback(TAuthTargetType.Server, State.ServerCredential.Realm, ARequest.GetURL.ToString,
      State.ServerCredential.UserName, State.ServerCredential.Password, LAbortAuth, LPersistence);
    State.NeedServerCredential := not LAbortAuth and not State.ServerCredential.IsEmpty;
  end;

  // Set Server Credentials
  if State.Status = InternalState.ServerAuthRequired then
  begin
    if State.ServerCredential.UserName = '' then
    // It's the first Server auth request
    begin
      State.ServerCredentials := GetCredentials(TAuthTargetType.Server, AResponse.InternalGetAuthRealm,
        ARequest.GetURL.ToString);
      if ARequest.GetCredential.UserName <> '' then
        State.ServerCredentials := [ARequest.GetCredential] + State.ServerCredentials;
      State.NeedServerCredential := True;
    end;
  end;
  if State.NeedServerCredential then
  begin
    if State.Status = InternalState.ServerAuthRequired then
    begin
      if State.ServerIterator < Length(State.ServerCredentials) then
      begin
        // Get the next credential from the storage
        State.ServerCredential.AuthTarget := TAuthTargetType.Server;
        State.ServerCredential.UserName := State.ServerCredentials[State.ServerIterator].UserName;
        State.ServerCredential.Password := State.ServerCredentials[State.ServerIterator].Password;
        State.ServerCredential.Realm := State.ServerCredentials[State.ServerIterator].Realm;
        Inc(State.ServerIterator);
      end
      else
      begin
        // Can't get a valid server credential from the storage so ask to the user
        LAbortAuth := False;
        State.ServerCredential.AuthTarget := TAuthTargetType.Server;
        OldUser := State.ServerCredential.UserName;
        OldPass := State.ServerCredential.Password;
        State.ServerCredential.UserName := '';
        State.ServerCredential.Password := '';
        State.ServerCredential.Realm := AResponse.InternalGetAuthRealm;
        DoAuthCallback(TAuthTargetType.Server, State.ServerCredential.Realm, ARequest.GetURL.ToString,
          State.ServerCredential.UserName, State.ServerCredential.Password, LAbortAuth, LPersistence);
        if LAbortAuth then
        begin
          State.ServerCredential.UserName := '';
          State.ServerCredential.Password := '';
        end;
        if not State.ServerCredential.IsEmpty then
        begin
          // If it is the same user and password than the previous one we empty the given and abort the operation to avoid infinite loops.
          if (State.ServerCredential.UserName = OldUser) and (State.ServerCredential.Password = OldPass) then
          begin
            State.ServerCredential.UserName := '';
            State.ServerCredential.Password := '';
          end
          else
            if LPersistence = TAuthPersistenceType.Client then
              CredentialsStorage.AddCredential(State.ServerCredential);
        end;
      end;
    end;
    if not State.ServerCredential.IsEmpty then
      Result := DoSetCredential(TAuthTargetType.Server, ARequest, State.ServerCredential)
    else
      // We need a Credential but we haven't found a good one, so exit
      Result := False;
  end;
end;

function THTTPClient.SupportedSchemes: TArray<string>;
begin
  Result := ['HTTP', 'HTTPS']; // Do not translate
end;

function THTTPClient.Trace(const AURL: string; const AResponseContent: TStream; const AHeaders: TNetHeaders): IHTTPResponse;
begin
  Result := IHTTPResponse(DoExecute(sHTTPMethodTrace, TURI.Create(AURL), nil, AResponseContent, AHeaders));
end;

function THTTPClient.BeginTrace(const AURL: string; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, nil, sHTTPMethodTrace, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginTrace(const AsyncCallback: TAsyncCallback; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(AsyncCallback, nil, sHTTPMethodTrace, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

function THTTPClient.BeginTrace(const AsyncCallbackEvent: TAsyncCallbackEvent; const AURL: string;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): IAsyncResult;
begin
  Result := DoExecuteAsync(nil, AsyncCallbackEvent, sHTTPMethodTrace, TURI.Create(AURL), nil, AResponseContent, AHeaders, False);
end;

procedure THTTPClient.UpdateCookiesFromResponse(const AResponse: THTTPResponse);
var
  I: Integer;
  LAllow: Boolean;
begin
  for I := 0 to AResponse.FCookies.Count - 1 do
  begin
    LAllow := True;
    if Assigned(FOnUpdateCookie) then
      OnUpdateCookie(Self, AResponse.FCookies.List[I], AResponse.FRequest.URL, LAllow);
    FCookieManager.AddServerCookie(AResponse.FCookies.List[I], AResponse.FRequest.URL);
  end;
end;

class function THTTPClient.IsRedirect(const AStatusCode: Integer): Boolean;
begin
  Result := False;
  case AStatusCode of
  // 304 is not really a redirect
  300, 301, 302, 303, 307, 308:
    Result := True;
  end;
end;

function THTTPClient.IsAutoRedirect(const AResponse: THTTPResponse): Boolean;
begin
  Result := HandleRedirects and IsRedirect(AResponse.GetStatusCode) and
    (AResponse.GetHeaderValue(sLocation).Trim <> '');
end;

function THTTPClient.IsAutoRedirectWithGET(const ARequest: THTTPRequest; const AResponse: THTTPResponse): Boolean;
var
  LRedirWithGet: THTTPRedirectsWithGET;
  LMethod: string;
begin
  // POST:
  // * 303 must be redirected to GET according spec
  // * 301, 302, 307 erroneously may be redirected to GET too
  // PUT, DELETE:
  // * 303 must be redirected to GET according spec

  Result := False;
  if not IsAutoRedirect(AResponse) then
    Exit;

  LRedirWithGet := RedirectsWithGET;
  LMethod := ARequest.GetMethodString;
  if SameText(LMethod, sHTTPMethodPost) then
    case AResponse.GetStatusCode of
    301: Result := THTTPRedirectWithGET.Post301 in LRedirWithGet;
    302: Result := THTTPRedirectWithGET.Post302 in LRedirWithGet;
    303: Result := THTTPRedirectWithGET.Post303 in LRedirWithGet;
    307: Result := THTTPRedirectWithGET.Post307 in LRedirWithGet;
    308: Result := THTTPRedirectWithGET.Post308 in LRedirWithGet;
    end
  else if SameText(LMethod, sHTTPMethodPut) then
    case AResponse.GetStatusCode of
    301: Result := THTTPRedirectWithGET.Put301 in LRedirWithGet;
    302: Result := THTTPRedirectWithGET.Put302 in LRedirWithGet;
    303: Result := THTTPRedirectWithGET.Put303 in LRedirWithGet;
    307: Result := THTTPRedirectWithGET.Put307 in LRedirWithGet;
    308: Result := THTTPRedirectWithGET.Put308 in LRedirWithGet;
    end
  else if SameText(LMethod, sHTTPMethodDelete) then
    case AResponse.GetStatusCode of
    301: Result := THTTPRedirectWithGET.Delete301 in LRedirWithGet;
    302: Result := THTTPRedirectWithGET.Delete302 in LRedirWithGet;
    303: Result := THTTPRedirectWithGET.Delete303 in LRedirWithGet;
    307: Result := THTTPRedirectWithGET.Delete307 in LRedirWithGet;
    308: Result := THTTPRedirectWithGET.Delete308 in LRedirWithGet;
    end;
end;

function THTTPClient.ComposeRedirectURL(const ARequest: THTTPRequest;
  const AResponse: THTTPResponse): TURI;
begin
  Result := TURI.Create(TURI.PathRelativeToAbs(AResponse.GetHeaderValue(sLocation), ARequest.FURL));
  // Fragment must be inherited according to:
  // https://tools.ietf.org/html/rfc7231#section-7.1.2
  if (Result.Fragment = '') and (ARequest.FURL.Fragment <> '') then
    Result.Fragment := ARequest.FURL.Fragment;
end;

{ THTTPRequest }

constructor THTTPRequest.Create(const AClient: THTTPClient; const ARequestMethod: string; const AURI: TURI);
begin
  inherited Create(AClient, ARequestMethod, AURI);
end;

destructor THTTPRequest.Destroy;
begin
  FOwnedStream.Free;
  inherited;
end;

procedure THTTPRequest.DoSendDataProgress(AContentLength, AWriteCount: Int64;
  var AAbort: Boolean; AAllowCancel: Boolean);
begin
  AAbort := False;
  if (not FCancelled) then
    if Assigned(FSendDataCallback) then
      FSendDataCallback(Self, AContentLength, AWriteCount, AAbort)
    else if Assigned(FOnSendData) then
      FOnSendData(Self, AContentLength, AWriteCount, AAbort);
  AAbort := AAbort or FCancelled;
  if AAbort and not FCancelled and AAllowCancel then
    Cancel;
end;

procedure THTTPRequest.DoReceiveDataProgress(AStatusCode: Integer; AContentLength,
  AReadCount: Int64; AChunk: Pointer; AChunkLength: Cardinal; var AAbort: Boolean);
begin
  AAbort := False;
  if (not FCancelled) and (AStatusCode < 300) then
    if Assigned(FReceiveDataCallback) or Assigned(FReceiveDataExCallback) then
    begin
      if Assigned(FReceiveDataCallback) then
        FReceiveDataCallback(Self, AContentLength, AReadCount, AAbort);
      if Assigned(FReceiveDataExCallback) then
        FReceiveDataExCallback(Self, AContentLength, AReadCount, AChunk, AChunkLength, AAbort);
    end
    else
    begin
      if Assigned(FOnReceiveData) then
        FOnReceiveData(Self, AContentLength, AReadCount, AAbort);
      if Assigned(FOnReceiveDataEx) then
        FOnReceiveDataEx(Self, AContentLength, AReadCount, AChunk, AChunkLength, AAbort);
    end;
  AAbort := AAbort or FCancelled;
end;

function THTTPRequest.GetAccept: string;
begin
  Result := GetHeaderValue(sAccept);
end;

function THTTPRequest.GetAcceptCharSet: string;
begin
  Result := GetHeaderValue(sAcceptCharset);
end;

function THTTPRequest.GetAcceptEncoding: string;
begin
  Result := GetHeaderValue(sAcceptEncoding);
end;

function THTTPRequest.GetAcceptLanguage: string;
begin
  Result := GetHeaderValue(sAcceptLanguage);
end;

function THTTPRequest.GetClientCertificate: TStream;
begin
  Result := FClientCertificate;
end;

function THTTPRequest.GetSendDataCallback: TSendDataCallback;
begin
  Result := FSendDataCallback;
end;

function THTTPRequest.GetSendDataEvent: TSendDataEvent;
begin
  Result := FOnSendData;
end;

function THTTPRequest.GetReceiveDataCallback: TReceiveDataCallback;
begin
  Result := FReceiveDataCallback;
end;

function THTTPRequest.GetReceiveDataEvent: TReceiveDataEvent;
begin
  Result := FOnReceiveData;
end;

function THTTPRequest.GetReceiveDataExCallback: TReceiveDataExCallback;
begin
  Result := FReceiveDataExCallback;
end;

function THTTPRequest.GetReceiveDataExEvent: TReceiveDataExEvent;
begin
  Result := FOnReceiveDataEx;
end;

function THTTPRequest.GetUserAgent: string;
begin
  Result := GetHeaderValue(sUserAgent);
end;

procedure THTTPRequest.SetAccept(const Value: string);
begin
  SetHeaderValue(sAccept, Value);
end;

procedure THTTPRequest.SetAcceptCharSet(const Value: string);
begin
  SetHeaderValue(sAcceptCharset, Value);
end;

procedure THTTPRequest.SetAcceptEncoding(const Value: string);
begin
  SetHeaderValue(sAcceptEncoding, Value);
end;

procedure THTTPRequest.SetAcceptLanguage(const Value: string);
begin
  SetHeaderValue(sAcceptLanguage, Value);
end;

procedure THTTPRequest.SetClientCertificate(const Path, Password: string);
begin
  FClientCertPath := Path;
  FClientCertificate := nil;
  FClientCertPassword := Password;
end;

procedure THTTPRequest.SetClientCertificate(const Value: TStream; const Password: string);
begin
  FClientCertPath := '';
  FClientCertificate := Value;
  FClientCertPassword := Password;
end;

procedure THTTPRequest.SetSendDataCallback(const Value: TSendDataCallback);
begin
  FSendDataCallback := Value;
end;

procedure THTTPRequest.SetSendDataEvent(const Value: TSendDataEvent);
begin
  FOnSendData := Value;
end;

procedure THTTPRequest.SetReceiveDataCallback(const Value: TReceiveDataCallback);
begin
  FReceiveDataCallback := Value;
end;

procedure THTTPRequest.SetReceiveDataEvent(const Value: TReceiveDataEvent);
begin
  FOnReceiveData := Value;
end;

procedure THTTPRequest.SetReceiveDataExCallback(const Value: TReceiveDataExCallback);
begin
  FReceiveDataExCallback := Value;
end;

procedure THTTPRequest.SetReceiveDataExEvent(const Value: TReceiveDataExEvent);
begin
  FOnReceiveDataEx := Value;
end;

procedure THTTPRequest.SetUserAgent(const Value: string);
begin
  SetHeaderValue(sUserAgent, Value);
end;

procedure THTTPRequest.BaseAddHeader(const AName, AValue: string);
const
  CDelims: array [Boolean] of Char = (',', ';');
var
  LPrevValue: string;
  LCookie: Boolean;
  LList, LValues: TStringList;
  I: Integer;

  procedure ListSetValue(AList: TStrings; const AName, AValue: string);
  var
    I: Integer;
    LName: string;
  begin
    LName := AName.Trim;
    for I := 0 to AList.Count - 1 do
      if SameStr(AList.Names[I].Trim, LName) then
      begin
        AList.ValueFromIndex[I] := AValue;
        Exit;
      end;
    AList.AddPair(AName, AValue);
  end;

  function ListIndexOf(AList: TStrings; const AValue: string): Integer;
  var
    I: Integer;
    LVal: string;
  begin
    Result := -1;
    LVal := AValue.Trim;
    for I := 0 to AList.Count - 1 do
      if SameStr(AList[I].Trim, LVal) then
        Exit(I);
  end;

begin
  LCookie := SameText(AName, sCookie);
  LPrevValue := GetHeaderValue(AName);
  if not LCookie and LPrevValue.IsEmpty then
    SetHeaderValue(AName, AValue)
  else
  begin
    LList := TStringList.Create(#0, CDelims[LCookie], [soStrictDelimiter, soUseLocale]);
    LList.CaseSensitive := False;
    LValues := TStringList.Create(#0, CDelims[LCookie], [soStrictDelimiter, soUseLocale]);
    try
      LList.DelimitedText := GetHeaderValue(AName);
      LValues.DelimitedText := AValue;
      for I := 0 to LValues.Count - 1 do
        if LCookie and (LValues.Names[I] <> '') then
          ListSetValue(LList, LValues.Names[I], LValues.ValueFromIndex[I])
        else if (LValues[I] <> '') and (ListIndexOf(LList, LValues[I]) = -1) then
          LList.Add(LValues[I]);

      SetHeaderValue(AName, LList.DelimitedText);
    finally
      LList.Free;
      LValues.Free;
    end;
  end;
end;

{ THTTPResponse }

procedure THTTPResponse.InternalAddCookie(const ACookieData: string);
begin
  FCookies.Add(TCookie.Create(ACookieData, FRequest.URL));
end;

function THTTPResponse.ContainsHeader(const AName: string): Boolean;
begin
  Result := GetHeaderValue(AName) <> '';
end;

function THTTPResponse.GetDecompressResponse: Boolean;
begin
  Result := False;
end;

function THTTPResponse.ContentAsString(const AnEncoding: TEncoding): string;
var
  LReader: TStringStream;
  LCharset: string;
  LStream: TStream;
  LContEnc: string;
begin
  Result := '';
  if AnEncoding = nil then
  begin
    LCharset := GetContentCharset;
    if (LCharSet <> '') and (string.CompareText(LCharSet, 'utf-8') <> 0) then // do not translate
      LReader := TStringStream.Create('', TEncoding.GetEncoding(LCharSet), True)
    else
      LReader := TStringStream.Create('', TEncoding.UTF8, False);
  end
  else
    LReader := TStringStream.Create('', AnEncoding, False);
  try
    if GetDecompressResponse then
    begin
      LContEnc := GetContentEncoding;
      if LContEnc = 'deflate' then // do not translate
        // 15 is the default mode.
        LStream := TDecompressionStream.Create(FStream, 15)
      else if LContEnc = 'gzip' then
        // +16 to enable gzip mode.  http://www.zlib.net/manual.html#Advanced
        LStream := TDecompressionStream.Create(FStream, 15 + 16)
      else
        LStream := FStream;
    end
    else
      LStream := FStream;

    try
      LReader.CopyFrom(LStream, 0);
      Result := LReader.DataString;
    finally
      if LStream <> FStream then
       LStream.Free;
    end;
  finally
    LReader.Free;
  end;
end;

constructor THTTPResponse.Create(const AContext: TObject; const AProc: TProc;
  const AAsyncCallback: TAsyncCallback; const AAsyncCallbackEvent: TAsyncCallbackEvent;
  const ARequest: IHTTPRequest; const AContentStream: TStream);
begin
  inherited Create(AContext, AProc, AAsyncCallBack, AAsyncCallbackEvent, ARequest, AContentStream);
  SetLength(FHeaders, 0);
  FCookies := TCookies.Create;
end;

destructor THTTPResponse.Destroy;
begin
  FCookies.Free;
  inherited;
end;

procedure THTTPResponse.DoReset;
begin
  SetLength(FHeaders, 0);
  FCookies.Clear;
end;

function THTTPResponse.GetContentCharSet: string;
var
  LCharSet: string;
  LSplitted: TArray<string>;
  LValues: TArray<string>;
  S: string;
begin
  Result := '';
  LCharSet := GetHeaderValue(sContentType);
  LSplitted := LCharset.Split([';']);
  for S in LSplitted do
  begin
    if S.TrimLeft.StartsWith('charset', True) then // do not translate
    begin
      LValues := S.Split(['=']);
      if Length(LValues) = 2 then
        Result := LValues[1].Trim.DeQuotedString.DeQuotedString('"');
      Break;
    end;
  end;
end;

function THTTPResponse.GetContentEncoding: string;
begin
  Result := GetHeaderValue(sContentEncoding);
end;

function THTTPResponse.GetContentLanguage: string;
begin
  Result := GetHeaderValue(sContentLanguage);
end;

function THTTPResponse.GetContentLength: Int64;
begin
  Result := StrToInt64Def(GetHeaderValue(sContentLength), -1);
end;

function THTTPResponse.GetContentStream: TStream;
begin
  Result := FStream;
end;

function THTTPResponse.GetCookies: TCookies;
begin
  Result := FCookies;
end;

function THTTPResponse.GetDate: string;
begin
  Result := GetHeaderValue('Date'); // do not translate
end;

function THTTPResponse.GetHeaderValue(const AName: string): string;
var
  I: Integer;
  LHeaders: TNetHeaders;
begin
  LHeaders := GetHeaders;
  for I := 0 to Length(LHeaders) - 1 do
    if string.CompareText(AName, LHeaders[I].Name) = 0 then
      Exit(LHeaders[I].Value);
  Result := '';
end;

function THTTPResponse.GetLastModified: string;
begin
  Result := GetHeaderValue(sLastModified);
end;

function THTTPResponse.GetMimeType: string;
begin
  Result := GetHeaderValue(sContentType);
end;

function THTTPResponse.InternalGetAuthRealm: string;
const
  CRealm = 'realm="'; // Do not translate
var
  LValue: string;
  LPos: Integer;
  LLower: string;
begin
  Result := '';
  LValue := GetHeaderValue(sWWWAuthenticate);
  if LValue = '' then
    LValue := GetHeaderValue(sProxyAuthenticate);

  if LValue <> '' then
  begin
    LLower := LValue.ToLower;
    LPos := LLower.IndexOf(CRealm);
    if LPos >= 0 then
    begin
      Inc(LPos, Length(CRealm));
      Result := LValue.Substring(LPos, LLower.IndexOf('"', LPos + 1) - LPos);
    end;
  end;
end;

{ TCookieManager }

constructor TCookieManager.Create;
begin
  inherited Create;
  FCookies := TCookies.Create;
end;

destructor TCookieManager.Destroy;
begin
  FCookies.Free;
  inherited Destroy;
end;

procedure TCookieManager.DeleteExpiredCookies;
var
  I: Integer;
begin
  for I := FCookies.Count - 1 downto 0 do
    if (FCookies[I].Expires <> 0) and (FCookies[I].Expires < Now) then
      FCookies.Delete(I);
end;

procedure TCookieManager.Clear;
begin
  FCookies.Clear;
end;

function TCookieManager.GetCookies: TCookiesArray;
begin
  TMonitor.Enter(FCookies);
  try
    DeleteExpiredCookies;
    Result := FCookies.ToArray;
  finally
    TMonitor.Exit(FCookies);
  end;
end;

class function TCookieManager.UseCookie(const ACookie: TCookie; const AURL: TURI): Boolean;
begin
  Result := ('.' + AURL.Host).EndsWith(ACookie.Domain) and AURL.Path.StartsWith(ACookie.Path) and
    (not ACookie.Secure or (ACookie.Secure and (AURL.Scheme = TURI.SCHEME_HTTPS)));
end;

procedure TCookieManager.AddServerCookie(const ACookieData, ACookieURL: string);
var
  LURL: TURI;
  Values: TArray<string>;
  I: Integer;
begin
  if ACookieURL = '' then
    LURL := Default(TURI)
  else
    LURL := TURI.Create(ACookieURL);

  Values := ACookieData.Split([Char(',')], Char('"'));
  for I := 0 to High(Values) do
    AddServerCookie(TCookie.Create(Values[I], LURL), LURL);
end;

procedure TCookieManager.AddServerCookie(const ACookie: TCookie; const AURL: TURI);
var
  I: Integer;
  Found: Boolean;
begin
  TMonitor.Enter(FCookies);
  try
    Found := False;
    DeleteExpiredCookies;
    for I := 0 to FCookies.Count - 1 do
    begin
      if SameText(ACookie.Name, FCookies[I].Name) and
         SameText(ACookie.Domain, FCookies[I].Domain) and
         SameText(ACookie.Path, FCookies[I].Path) then
      begin
        Found := True;
        FCookies[I] := ACookie;
        Break;
      end
    end;
    if not Found and ((ACookie.Expires = 0) or (ACookie.Expires > Now)) then
      FCookies.Add(ACookie);
  finally
    TMonitor.Exit(FCookies);
  end;
end;

function TCookieManager.CookieHeaders(const AURL: TURI): string;
var
  I: Integer;
begin
  Result := '';
  TMonitor.Enter(FCookies);
  try
    DeleteExpiredCookies;
    for I := FCookies.Count - 1 downto 0 do
      if UseCookie(FCookies[I], AURL) then
        Result := Result + FCookies[I].ToString + '; ';
  finally
    TMonitor.Exit(FCookies);
  end;
  if Result <> '' then
    Result := Result.Substring(0, Result.Length - 2); // remove last "; "
end;

function TCookieManager.GetCookies(const AURL: TURI): TCookiesArray;
var
  I, J: Integer;
begin
  Result := nil;
  TMonitor.Enter(FCookies);
  try
    DeleteExpiredCookies;
    for I := FCookies.Count - 1 downto 0 do
      if UseCookie(FCookies[I], AURL) then
      begin
        J := Length(Result);
        SetLength(Result, J + 1);
        Result[J] := FCookies[I];
      end;
  finally
    TMonitor.Exit(FCookies);
  end;
end;

function TCookieManager.GetCookies(const ACookieURL: string): TCookiesArray;
var
  LURL: TURI;
begin
  if ACookieURL = '' then
    LURL := Default(TURI)
  else
    LURL := TURI.Create(ACookieURL);
  Result := GetCookies(LURL);
end;

{ TCookie }

class function TCookie.Create(const ACookieData: string; const AURI: TURI): TCookie;

  procedure SetExpires(const AValue: string);
  begin
    if Result.Expires = 0 then
      Result.Expires := HttpToDate(AValue, False);
  end;

  procedure SetMaxAge(const AValue: string);
  var
    Increment: Integer;
  begin
    if TryStrToInt(AValue, Increment) then
      Result.Expires := IncSecond(Now, Increment);
  end;

  procedure SetPath(const AValue: string);
  begin
    if (AValue = '') or (AValue[High(AValue)] <> '/') then
      Result.Path := AValue + '/'
    else
      Result.Path := AValue;
  end;

  procedure SetDomain(const AValue: string);
  begin
    if (AValue <> '') and (AValue.Chars[0] <> '.') then
      Result.Domain := '.' + AValue
    else
      Result.Domain := AValue;
  end;
var
  Values: TArray<string>;
  I: Integer;
  Pos: Integer;
  LName: string;
  LValue: string;
begin
  Result := Default(TCookie);
  Values := ACookieData.Split([Char(';')], Char('"'));
  if Length(Values) = 0 then
    Exit(Default(TCookie));

  Pos := Values[0].IndexOf(Char('='));
  if Pos <= 0 then
    Exit(Default(TCookie));
  Result.Name := Values[0].Substring(0, Pos).Trim;
  Result.Value := Values[0].Substring(Pos + 1).Trim;
  Result.Path := '/';
  Result.Domain := '.' + AURI.Host;

  for I := 1 to High(Values) do
  begin
    Pos := Values[I].IndexOf(Char('='));
    if Pos > 0 then
    begin
      LName := Values[I].Substring(0, Pos).Trim;
      LValue := Values[I].Substring(Pos + 1).Trim;
      if (LValue.Length > 1) and (LValue.Chars[0] = '"') and (LValue[High(LValue)] = '"') then
        LValue := LValue.Substring(1, LValue.Length - 2);
    end
    else
    begin
      LName := Values[I].Trim;
      LValue := '';
    end;

    if SameText(LName, 'Max-Age') then  // Do not translate
      SetMaxAge(LValue)
    else if SameText(LName, 'Expires') then  // Do not translate
      SetExpires(LValue)
    else if SameText(LName, 'Path') then  // Do not translate
      SetPath(LValue)
    else if SameText(LName, 'Domain') then // Do not translate
      SetDomain(LValue)
    else if SameText(LName, 'HttpOnly') then  // Do not translate
      Result.HttpOnly := True
    else if SameText(LName, 'Secure') then  // Do not translate
      Result.Secure := True;
  end;
end;

function TCookie.ToString: string;
begin
  Result := Name + '=' + Value;
end;

function TCookie.GetServerCookie: string;
var
  LDomain: string;
  LDate: TDateTime;
  LYear, LMonth, LDay: Word;
begin
  Result := ToString;
  if Domain <> '' then
  begin
    LDomain := Domain;
    if LDomain.Chars[0] = '.' then
      LDomain := LDomain.Substring(1);
    Result := Result + ';Domain=' + LDomain;
  end;
  if Path <> '' then
    Result := Result + ';Path=' + Path;
  if Expires <> 0.0 then
  begin
    LDate := Expires;
    if LDate <= 1 then
      LDate := EncodeDateTime(1970, 1, 1, 0, 0, 0, 0)
    else
    begin
      DecodeDate(LDate, LYear, LMonth, LDay);
      if not ((LYear = 9999) and (LMonth = 12) and (LDay = 31)) then
        LDate := TTimeZone.Local.ToUniversalTime(LDate);
    end;
    Result := Result + ';Expires=' +
      FormatDateTime('ddd, dd mmm yyyy hh:nn:ss', LDate, TFormatSettings.Invariant) + ' GMT';
  end;
  if HttpOnly then
    Result := Result + ';HttpOnly';
  if Secure then
    Result := Result + ';Secure';
end;

end.
