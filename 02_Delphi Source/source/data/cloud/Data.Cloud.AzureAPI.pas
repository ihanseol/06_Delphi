{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Data.Cloud.AzureAPI;

interface

uses System.Classes,
     System.SysUtils,
     System.Generics.Collections,
     Data.Cloud.CloudAPI, Data.Cloud.AzureAPI.StorageAnalytics,
     Xml.XMLIntf
;

type

  /// <summary>Azure extension of TCloudConnectionInfo</summary>
  /// <remarks>This provides Azure specific information, such as settings for development storage,
  ///    and getting the service URLs.
  /// </remarks>
  TAzureConnectionInfo = class(TCloudConnectionInfo)
  private
    /// <summary>True to connect to a local development storage service, False to connect to the cloud.</summary>
    FUseDevelopmentStorage: Boolean;
    /// <summary>The blob service URL to use if FUseDefaultEndpoints is false</summary>
    FBlobEndpoint: string;
    /// <summary>The queue service URL to use if FUseDefaultEndpoints is false</summary>
    FQueueEndpoint: string;
    /// <summary>The table service URL to use if FUseDefaultEndpoints is false</summary>
    FTableEndpoint: string;
    /// <summary>Sets if development storage should be used, instead of issuing requests to the cloud.</summary>
    /// <param name="use">True to use development storage, false otherwise</param>
    procedure SetUseDevelopmentStorage(use: Boolean);
    /// <summary>Returns the service URL, based on the given information</summary>
    /// <remarks>This is a helper function used by the BlobURL, TableURL and QueueURL functions.</remarks>
    /// <param name="ServiceType">One of: (blob|table|queue)</param>
    /// <param name="ServiceEndpoint">The value of the corresponding [X]Endpoint property.</param>
    /// <param name="AGetSecondary">Flag to retrieve secondary URL.</param>
    /// <returns>The URL to the storage service.</returns>
    function ServiceURL(const ServiceType, ServiceEndpoint: string; AGetSecondary: Boolean): string;

    function GetBlobEndpoint: string;
    function GetQueueEndpoint: string;
    function GetTableEndpoint: string;
  protected
    /// <summary>Returns the account name used for authentication with the service</summary>
    function GetAccountName: string; override;
    /// <summary>Returns the account key/password used for authenticating the service</summary>
    function GetAccountKey: string; override;
  public
    /// <summary>Creates a new instance of TAzureConnectionInfo</summary>
    // / <param name="AOwner">The TComponent owning this one, or nil</param>
    constructor Create(AOwner: TComponent); override;

    /// <summary>Returns the URL for working with the blob service.</summary>
    /// <returns>The URL for working with the blob service.</returns>
    function BlobURL: string;
    /// <summary>Returns the secondary URL for working with the blob service.</summary>
    /// <returns>The secondary URL for working with the blob service.</returns>
    function BlobSecondaryURL: string;
    /// <summary>Returns the URL for working with the table service.</summary>
    /// <returns>The URL for working with the table service.</returns>
    function TableURL: string;
    /// <summary>Returns the secondary URL for working with the table service.</summary>
    /// <returns>The secondary URL for working with the table service.</returns>
    function TableSecondaryURL: string;
    /// <summary>Returns the URL for working with the queue service.</summary>
    /// <returns>The URL for working with the queue service.</returns>
    function QueueURL: string;
    /// <summary>Returns the secondary URL for working with the queue service.</summary>
    /// <returns>The secondary URL for working with the queue service.</returns>
    function QueueSecondaryURL: string;
  published
    /// <summary>True to connect to a local development storage service, False to connect to the cloud.</summary>
    [Default(False)]
    property UseDevelopmentStorage: Boolean read FUseDevelopmentStorage write SetUseDevelopmentStorage default False;
    /// <summary>The blob service URL to use if FUseDefaultEndpoints is false</summary>
    property BlobEndpoint: string read GetBlobEndpoint write FBlobEndpoint;
    /// <summary>The queue service URL to use if FUseDefaultEndpoints is false</summary>
    property QueueEndpoint: string read GetQueueEndpoint write FQueueEndpoint;
    /// <summary>The table service URL to use if FUseDefaultEndpoints is false</summary>
    property TableEndpoint: string read GetTableEndpoint write FTableEndpoint;
    /// <summary>The protocol to use as part of the service URL (http|https)</summary>
    property Protocol;
    /// <summary>Raising the property to published</summary>
    property AccountName;
    /// <summary>Raising the property to published</summary>
    property AccountKey;
    /// <summary>The proxy host to use for the HTTP requests to the cloud, or empty string to use none</summary>
    property RequestProxyHost;
    /// <summary>The proxy host's port to use for the HTTP requests to the cloud</summary>
    property RequestProxyPort;
    /// <summary>True to use the default service URLs, false to use endpoints from the endpoint properties.
    /// </summary>
    property UseDefaultEndpoints;
  end;

  /// <summary>Azure specific implementation of TCloudSHA256Authentication</summary>
  /// <remarks>Sets the Authorization type to 'SharedKey'</remarks>
  TAzureAuthentication = class(TCloudSHA256Authentication)
  protected
    /// <summary>Overrides the base implementation, treating the key as base64 encoded.</summary>
    /// <param name="AccountKey">The account key, in base64 encoded string representation.</param>
     procedure AssignKey(const AccountKey: string); override;
  public
    /// <summary>Creates a new instance of TAzureAuthentication</summary>
    /// <remarks>Sets the authorization type (for the authorization header) to 'SharedKey'</remarks>
    // / <param name="ConnectionInfo">The connection info to use in authentiation</param>
    constructor Create(ConnectionInfo: TAzureConnectionInfo); overload;
  end;

  /// <summary>Access policy information, specifying the allowed public operations.</summary>
  /// <remarks>
  ///   The access policy can have a start time and an expiry time, to create a window of time the policy
  ///   takes effect for.
  /// </remarks>
  TPolicy = class abstract
  private
    FStartDate: string;
    FExpiryDate: string;

    function CreateInstance: TPolicy; virtual; abstract;
    function GetPermission: string; virtual; abstract;
    procedure SetPermission(const AValue: string); virtual; abstract;
    function GetXML: string; virtual;
  public
    /// <summary>Creates a new instance of TPolicy with the start date set to actual date.</summary>
    /// <returns>The new initialized instance.</returns>
    constructor Create; virtual;
    /// <summary>Copies the contents of another TPolicy object.</summary>
    procedure Assign(const ASource: TPolicy); virtual; abstract;

    /// <summary>The date the access policy is not valid before.</summary>
    /// <remarks>must be expressed as UTC times and must adhere to a valid ISO 8601 format.
    ///          Supported formats include:
    ///          YYYY-MM-DD
    ///          YYYY-MM-DDThh:mmTZD
    ///          YYYY-MM-DDThh:mm:ssTZD
    ///          YYYY-MM-DDThh:mm:ss.ffffffTZD
    /// </remarks>
    property StartDate: string read FStartDate write FStartDate;
    /// <summary>The date the access policy is not valid after.</summary>
    /// <remarks>must be expressed as UTC times and must adhere to a valid ISO 8601 format.
    ///          Supported formats include:
    ///          YYYY-MM-DD
    ///          YYYY-MM-DDThh:mmTZD
    ///          YYYY-MM-DDThh:mm:ssTZD
    ///          YYYY-MM-DDThh:mm:ss.ffffffTZD
    /// </remarks>
    property ExpiryDate: string read FExpiryDate write FExpiryDate;
    /// <summary>The string representation of the permissions.</summary>
    property Permission: string read GetPermission write SetPermission;
  end;

  /// <summary>Access policy information, specifying the allowed public operations on queues.</summary>
  /// <remarks>The four operations are: Read, Add, Update and Process. Each of these can be enabled or disabled.</remarks>
  TQueuePolicy = class(TPolicy)
  private
    FCanReadMessage: Boolean;
    FCanAddMessage: Boolean;
    FCanUpdateMessage:Boolean;
    FCanProcessMessage: Boolean;

    function CreateInstance: TPolicy; override;
    function GetPermission: string; override;
    procedure SetPermission(const AValue: string); override;
  public
    /// <summary>Creates a new instance of TQueuePolicy with all permissions off.</summary>
    /// <returns>The new initialized instance.</returns>
    constructor Create; override;
    /// <summary>Copies the contents of another TQueuePolicy object.</summary>
    procedure Assign(const ASource: TPolicy); override;

    /// <summary>True when read permission is granted by this access policy</summary>
    property CanReadMessage: Boolean read FCanReadMessage write FCanReadMessage;
    /// <summary>True when add permission is granted by this access policy</summary>
    property CanAddMessage: Boolean read FCanAddMessage write FCanAddMessage;
    /// <summary>True when update permission is granted by this access policy</summary>
    property CanUpdateMessage: Boolean read FCanUpdateMessage write FCanUpdateMessage;
    /// <summary>True when process permission is granted by this access policy</summary>
    property CanProcessMessage: Boolean read FCanProcessMessage write FCanProcessMessage;
  end;

  /// <summary>Access policy information, specifying the allowed public operations on tables.</summary>
  /// <remarks>The four operations are: Query, Add, Update and Delete. Each of these can be enabled or disabled.</remarks>
  TTablePolicy = class(TPolicy)
  private
    FCanQueryTable: Boolean;
    FCanAddTable: Boolean;
    FCanUpdateTable:Boolean;
    FCanDeleteTable: Boolean;

    function CreateInstance: TPolicy; override;
    function GetPermission: string; override;
    procedure SetPermission(const AValue: string); override;
  public
    /// <summary>Creates a new instance of TTablePolicy with all permissions off.</summary>
    /// <returns>The new initialized instance.</returns>
    constructor Create; override;
    /// <summary>Copies the contents of another TTablePolicy object.</summary>
    procedure Assign(const ASource: TPolicy); override;

    /// <summary>True when query permission is granted by this access policy</summary>
    property CanQueryTable: Boolean read FCanQueryTable write FCanQueryTable;
    /// <summary>True when add permission is granted by this access policy</summary>
    property CanAddTable: Boolean read FCanAddTable write FCanAddTable;
    /// <summary>True when update permission is granted by this access policy</summary>
    property CanUpdateTable: Boolean read FCanUpdateTable write FCanUpdateTable;
    /// <summary>True when delete permission is granted by this access policy</summary>
    property CanDeleteTable: Boolean read FCanDeleteTable write FCanDeleteTable;
  end;

  /// <summary>Access policy information, specifying the allowed public operations on blobs.</summary>
  /// <remarks>The four operations are: Read, Write, Delete and List. Each of these can be enabled or disabled.</remarks>
  TBlobPolicy = class(TPolicy)
  private
    FCanReadBlob: Boolean;
    FCanWriteBlob: Boolean;
    FCanDeleteBlob: Boolean;
    FCanListBlob: Boolean;

    function CreateInstance: TPolicy; override;
    function GetPermission: string; override;
    procedure SetPermission(const AValue: string); override;
  public
    /// <summary>Creates a new instance of TBlobPolicy with all permissions off.</summary>
    /// <returns>The new initialized instance.</returns>
    constructor Create; override;
    /// <summary>Copies the contents of another TBlobPolicy object.</summary>
    procedure Assign(const ASource: TPolicy); override;

    /// <summary>True when read permission is granted by this access policy</summary>
    property CanReadBlob: Boolean read FCanReadBlob write FCanReadBlob;
    /// <summary>True when write permission is granted by this access policy</summary>
    property CanWriteBlob: Boolean read FCanWriteBlob write FCanWriteBlob;
    /// <summary>True when delete permission is granted by this access policy</summary>
    property CanDeleteBlob: Boolean read FCanDeleteBlob write FCanDeleteBlob;
    /// <summary>True when list permission is granted by this access policy</summary>
    property CanListBlob: Boolean read FCanListBlob write FCanListBlob;
  end;

  /// <summary>Access policy information, specifying the allowed public operations.</summary>
  /// <remarks>The four operations are: Read, Write, Delete and List. Each of these can be
  ///          enabled or disabled. Furthermore, the access policy can have a start time and
  ///          an expiry time, to create a window of time the policy takes effect for.
  /// </remarks>
  TAccessPolicy = record
    /// <summary>The date the access policy is not valid before.</summary>
    /// <remarks>must be expressed as UTC times and must adhere to a valid ISO 8601 format.
    ///          Supported formats include:
    ///          YYYY-MM-DD
    ///          YYYY-MM-DDThh:mmTZD
    ///          YYYY-MM-DDThh:mm:ssTZD
    ///          YYYY-MM-DDThh:mm:ss.ffffffTZD
    /// </remarks>
    Start: string;
    /// <summary>The date the access policy is not valid after.</summary>
    /// <remarks>must be expressed as UTC times and must adhere to a valid ISO 8601 format.
    ///          Supported formats include:
    ///          YYYY-MM-DD
    ///          YYYY-MM-DDThh:mmTZD
    ///          YYYY-MM-DDThh:mm:ssTZD
    ///          YYYY-MM-DDThh:mm:ss.ffffffTZD
    /// </remarks>
    Expiry: string;
    /// <summary>True when read permission is granted by this access policy</summary>
    PermRead: Boolean;
    /// <summary>True when write permission is granted by this access policy</summary>
    PermWrite: Boolean;
    /// <summary>True when delete permission is granted by this access policy</summary>
    PermDelete:Boolean;
    /// <summary>True when list permission is granted by this access policy</summary>
    PermList: Boolean;
    /// <summary>Returns the string representation of the permissions.</summary>
    /// <remarks>Always in the order: rwdl, omitting any which are currently set to false.</remarks>
    /// <returns>The string representation of the permissions currently set to true.</returns>
    function GetPermission: string;
    /// <summary>Sets the boolean fields by parsing the string representation.</summary>
    /// <remarks>Only four characters, at most, are expected in the string: rwdl. If one of
    ///          those characters is present in the string, then its corresponding permission
    ///          boolean field is set to true. Otherwise, it is set to false.
    /// </remarks>
    /// <param name="rwdl">The string representation of the permission fields that should be set to true</param>
    procedure SetPermission(const rwdl: string);
    /// <summary>Returns the XML representation of the access policy, as it is required by Azure</summary>
    /// <returns>The XML representation of the access policy, as it is required by Azure</returns>
    function AsXML: string;
    /// <summary>Creates a new instance of TAccessPolicy with all permissions, except read, off.</summary>
    /// <returns>The new initialized instance.</returns>
    class function Create: TAccessPolicy; static;
    /// <summary>Returns or sets the permissions with a string representation.</summary>
    property Permission: string read GetPermission write SetPermission;
  end;

  ISignedIdentifier = interface

  end;
  /// <summary>A signed identifier, which is used to uniquely identify an Access Policy.</summary>
  TSignedIdentifier = class(TInterfacedObject, ISignedIdentifier)
  private
    FId: string;
    FResource: string;
    FPolicy: TPolicy;
  public
    /// <summary>The Access Policy this identifies.</summary>
    AccessPolicy: TAccessPolicy;

    /// <summary>Creates a new instance of TSignedIdentifier</summary>
    /// <param name="Resource">The resource (container, for example) name this is for.</param>
    constructor Create(const Resource: string); overload;
    /// <summary>Creates a new instance of TSignedIdentifier</summary>
    /// <param name="Resource">The resource (container, for example) name this is for.</param>
    /// <param name="Policy">The access policy this identifies.</param>
    /// <param name="UniqueId">String that uniquely identifies this signed identifier.</param>
    constructor Create(const Resource: string; Policy: TAccessPolicy; UniqueId: string = ''); overload;
    /// <summary>Creates a new instance of TSignedIdentifier</summary>
    /// <param name="Resource">The resource (container, for example) name this is for.</param>
    /// <param name="Policy">The access policy this identifies.</param>
    /// <param name="UniqueId">String that uniquely identifies this signed identifier.</param>
    constructor Create(const Resource: string; const Policy: TPolicy; const UniqueId: string = ''); overload;
    destructor Destroy; override;

    /// <summary>The XML representation of the signed identifier, as it is required for Azure requests.</summary>
    /// <returns>The XML representation used for create/update requests.</returns>
    function AsXML: string; virtual;

    /// <summary>The unique Id</summary>
    /// <remarks>The maximum length of the unique identifier is 64 characters</remarks>
    property Id: string read FId write FId;
    /// <summary>Access policy information, specifying the allowed public operations.</summary>
    /// <remarks>
    ///   The access policy can have a start time and an expiry time, to create a window of time the policy
    ///   takes effect for.
    /// </remarks>
    property Policy: TPolicy read FPolicy write FPolicy;
  end;

  /// <summary>Abstract extension of the TCloudService class.</summary>
  /// <remarks>This implements all functionality common to the Azure Blob, Queue and Table
  ///    services, or common two two of them (allowing the third to extend further and override.)
  ///</remarks>
  TAzureService = class abstract(TCloudService)
  private
    /// <summary>If the server timeout interval elapses before the service has finished processing the request,
    ///          the service returns an error.
    /// </summary>
    /// <param name="AValue">The new timeout value.</param>
    procedure SetTimeout(const AValue: Integer);
  protected
    /// <summary>The lazy-loaded list of required header names.</summary>
    FRequiredHeaderNames: TStrings;
    /// <summary>The timeout service value.</summary>
    FTimeout: Integer;

    /// <summary>URL Encodes the param name and value.</summary>
    /// <remarks>Skips encoding if not for URL.</remarks>
    /// <param name="ForURL">True if the parameter is for a URL, false if it is for a signature.</param>
    /// <param name="ParamName">Name of the parameter</param>
    /// <param name="ParamValue">Value of the parameter</param>
    procedure URLEncodeQueryParams(const ForURL: Boolean; var ParamName, ParamValue: string); override;

    /// <summary>Returns the current date and time, properly formatted for the x-ms-date header.</summary>
    /// <returns>The current date and time, properly formatted for the x-ms-date header.</returns>
    function XMsDate: string;
    /// <summary>Populates the x-ms-date (and optionally the Date) header in the given list.</summary>
    /// <param name="Headers">The header list to add the date header(s) to.</param>
    /// <param name="AddRegularDateHeader">True to add the Date header instead of just thex-ms-date one.</param>
    procedure PopulateDateHeader(Headers: TStrings; AddRegularDateHeader: Boolean = True);
    /// <summary>Returns the TAzureConnectionInfo held by the service</summary>
    /// <returns>The TAzureConnectionInfo held by the service</returns>
    function GetConnectionInfo: TAzureConnectionInfo;

    /// <summary>Returns the list of required header names</summary>
    /// <remarks>Implementation of abstract declaration in parent class.
    ///    Lazy-loads and returns FRequiredHeaderNames. Sets InstanceOwner to false,
    ///    since this class instance will manage the memory for the object.
    /// </remarks>
    /// <param name="InstanceOwner">Returns false, specifying the caller doesn't own the list.</param>
    /// <returns>The list of required hear names. No values.</returns>
    function GetRequiredHeaderNames(out InstanceOwner: Boolean): TStrings; override;
    /// <summary>Returns the header name prefix for Azure services, for headers to be included
    ///     as name/value pairs in the StringToSign in authentication.
    /// </summary>
    /// <returns>The header prefix (x-ms-)</returns>
    function GetCanonicalizedHeaderPrefix: string; override;
  public
    /// <summary>Creates a new instance of TAzureService</summary>
    /// <remarks>This class does not own the ConnectionInfo instance.</remarks>
    // / <param name="ConnectionInfo">The Azure service connection info</param>
    constructor Create(ConnectionInfo: TAzureConnectionInfo);
    /// <summary>Frees the required headers list and destroys the instance</summary>
    destructor Destroy; override;

    /// <summary>The timeout service value.</summary>
    property Timeout: Integer read FTimeout write SetTimeout;
  end;

  /// <summary>Implementation of TAzureService for managing a Microsoft Azure Table Service account.</summary>
  TAzureTableService = class(TAzureService)
  private
    function ModifyEntityHelper(const TableName: string; const Entity: TCloudTableRow;
                                out url, QueryPrefix: string;
                                out Headers: TStringList): Boolean;
    procedure AddTableVersionHeaders(Headers: TStrings);
    function UpdatedDate: string;
    function BuildRowList(const XML: string; const FromQuery: Boolean): TList<TCloudTableRow>;
    function GetTablesQueryPrefix(Headers: TStrings; TableName: string = 'Tables'): string;
    function GetInsertEntityXML(Entity: TCloudTableRow): string;
  protected
    /// <summary>Returns the list of required header names</summary>
    /// <remarks>Overrides the base implementation, as the Table Service had different/fewer
    ///     required headers. Lazy-loads and returns FRequiredHeaderNames. Sets InstanceOwner to false,
    ///     since this class instance will manage the memory for the object.
    /// </remarks>
    /// <param name="InstanceOwner">Returns false, specifying the caller doesn't own the list.</param>
    /// <returns>The list of required hear names. No values.</returns>
    function GetRequiredHeaderNames(out InstanceOwner: Boolean): TStrings; override;
  public
    /// <summary>Creates a new instance of TAzureTableService</summary>
    /// <remarks>Sets FUseCanonicalizedHeaders to False</remarks>
    // / <param name="ConnectionInfo">The connection info to use for issuing requests.</param>
    constructor Create(ConnectionInfo: TAzureConnectionInfo);

    /// <summary>Gets the properties of a storage account�s Table service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the properties for the service</returns>
    function GetTableServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Gets the properties of a storage account�s Table service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for storing service properties.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure GetTableServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Sets the properties of a storage account�s Table service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for loading service properties.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    function SetTableServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>Retrieves statistics related to replication for the Table service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the statistics for the service</returns>
    function GetTableServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Retrieves statistics related to replication for the Table service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AStats">The class for loading service stats.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure GetTableServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);

    /// <summary>Returns an XML representation of the tables existing in the table service account.</summary>
    /// <remarks>ContinuationToken is used if there exists more than 1000 tables, and a previous call
    ///     didn't return the last of the tables. It would have provided a ContinuationToken in the header:
    ///     'x-ms-continuation-NextTableName'.
    /// </remarks>
    /// <param name="ContinuationToken">The optional name of the table to start retrieval from</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The XML representation of the available tables for the service</returns>
    function QueryTablesXML(const ContinuationToken: string = ''; ResponseInfo: TCloudResponseInfo = nil): string;
    /// <summary>Returns a list of the tables existing in the table service account.</summary>
    /// <remarks>ContinuationToken is used if there exists more than 1000 tables, and a previous call
    ///     didn't return the last of the tables. It would have provided a ContinuationToken in the header:
    ///     'x-ms-continuation-NextTableName'.
    /// </remarks>
    /// <param name="ContinuationToken">The optional name of the table to start retrieval from</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The list of available tables for the service</returns>
    function QueryTables(const ContinuationToken: string = ''; ResponseInfo: TCloudResponseInfo = nil): TStrings;
    /// <summary>Returns the entities (rows) for the specified table, optionally filtering the result.</summary>
    /// <remarks> See the MSDN documentation on "Querying Tables and Entities" for more information
    ///           on the FilterExpression parameter.
    ///           At most, 1000 rows are returned. If 1000 rows are returned, use the header values for:
    ///           x-ms-continuation-NextPartitionKey and x-ms-continuation-NextRowKey to get the unique
    ///           identifier of the 1001th row. To get these values you need to use the ResponseInfo parameter.
    ///           Uses the unique identifier values (NextParitionKey and NextRowKey) in your next call to this
    ///           function, to retrieve the next batch of rows.
    /// </remarks>
    /// <param name="TableName">The name of the table to get the rows for</param>
    /// <param name="FilterExpression">The optional filter expression for refining the results</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <param name="NextPartitionKey">Continuation token value from x-ms-continuation-NextPartitionKey</param>
    /// <param name="NextRowKey">Continuation token value from x-ms-continuation-NextRowKey</param>
    /// <returns>The XML representation of the rows</returns>
    function QueryEntitiesXML(const TableName: string; const FilterExpression: string = '';
                              ResponseInfo: TCloudResponseInfo = nil;
                              const NextPartitionKey: string = '';
                              const NextRowKey: string = ''): string; overload;
    /// <summary>Returns the entities (rows) for the specified table, optionally filtering the result.</summary>
    /// <remarks> See the MSDN documentation on "Querying Tables and Entities" for more information
    ///           on the FilterExpression parameter.
    ///           At most, 1000 rows are returned. If 1000 rows are returned, use the header values for:
    ///           x-ms-continuation-NextPartitionKey and x-ms-continuation-NextRowKey to get the unique
    ///           identifier of the 1001th row. To get these values you need to use the ResponseInfo parameter.
    ///           Uses the unique identifier values (NextParitionKey and NextRowKey) in your next call to this
    ///           function, to retrieve the next batch of rows.
    /// </remarks>
    /// <param name="TableName">The name of the table to get the rows for</param>
    /// <param name="FilterExpression">The optional filter expression for refining the results</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <param name="NextPartitionKey">Continuation token value from x-ms-continuation-NextPartitionKey</param>
    /// <param name="NextRowKey">Continuation token value from x-ms-continuation-NextRowKey</param>
    /// <returns>The table's rows which match the given filter, or all rows (up to 1000 rows)
    ///          if no filter is given.
    /// </returns>
    function QueryEntities(const TableName: string; const FilterExpression: string = '';
                           ResponseInfo: TCloudResponseInfo = nil;
                           const NextPartitionKey: string = '';
                           const NextRowKey: string = ''): TList<TCloudTableRow>; overload;
    /// <summary>Returns the entity(row) for the specified table with the given partition and row keys.</summary>
    /// <remarks> The unique key of any Azure table row is comprised of both the Partition Key and Row Key.
    ///           There should be no situation where a call to this function returns more than one row.
    /// </remarks>
    /// <param name="TableName">The name of the table to get the row from</param>
    /// <param name="PartitionKey">The value of the partition key in the row you want to get</param>
    /// <param name="RowKey">The value of the row key in the row you want to get</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The XML representation of the row</returns>
    function QueryEntityXML(const TableName: string; const PartitionKey: string; const RowKey: string;
                            ResponseInfo: TCloudResponseInfo = nil): string; overload;
    /// <summary>Returns the entity(row) for the specified table with the given partition and row keys.</summary>
    /// <remarks> The unique key of any Azure table row is comprised of both the Partition Key and Row Key.
    /// </remarks>
    /// <param name="TableName">The name of the table to get the row from</param>
    /// <param name="PartitionKey">The value of the partition key in the row you want to get</param>
    /// <param name="RowKey">The value of the row key in the row you want to get</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The table's row matching the specified keys, or nil if not found</returns>
    function QueryEntity(const TableName: string; const PartitionKey: string; const RowKey: string;
                         ResponseInfo: TCloudResponseInfo = nil): TCloudTableRow; overload;
    /// <summary>Creates a table with the given name.</summary>
    /// <param name="TableName">The name of the table to create</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the creation was a success, false otherwise.</returns>
    function CreateTable(const TableName: string; ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Deletes the table with the given name.</summary>
    /// <remarks>This marks the table for delete and hides it from future calls when querying the
    ///          list of available tables. However, it isn't deleted from the server right away,
    ///          and for a short time after calling delete, you will not be able to create a new table
    ///          with the same name.
    /// </remarks>
    /// <param name="TableName">The name of the table to delete</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the delete is successful, false otherwise</returns>
    function DeleteTable(const TableName: string; ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Queries the Cross-Origin Resource Sharing (CORS) rules for the Blob service prior to sending
    ///          the actual request.
    /// </summary>
    /// <param name="ATableName">The table resource that is to be the target of the actual request.</param>
    /// <param name="AOrigin">
    ///   Required. Specifies the origin from which the actual request will be issued. The origin is checked against the
    ///   service's CORS rules to determine the success or failure of the preflight request.</param>
    /// <param name="AAccessControlRequestMethod">
    ///   Required. Specifies the method (or HTTP verb) for the actual request. The method is checked against the
    ///   service's CORS rules to determine the failure or success of the preflight request.</param>
    /// <param name="AAccessControlRequestHeaders">
    ///   Optional. Specifies the headers for the actual request headers that will be sent, then the service assumes no
    ///   headers are sent with the actual request.</param>
    /// <param name="ARule">The class for storing service rules.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure PreflightTableRequest(const ATableName: string; const AOrigin: string;
      const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
      const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Inserts a row into the given table.</summary>
    /// <remarks> The row must have a PartitionKey and RowKey column. If it has a Timestamp column,
    ///           it will be ignored.
    ///           Insert fails (409 - Conflict) if another row with the same PartitonKey and RowKey exists.
    /// </remarks>
    /// <param name="TableName">The name of the table to insert the row into</param>
    /// <param name="Entity">The row to insert</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the insertion is successful, false otherwise</returns>
    function InsertEntity(const TableName: string; Entity: TCloudTableRow;
                          ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Inserts a row into the given table, replacing a previous version of the row, if any.</summary>
    /// <remarks> The row must have a PartitionKey and RowKey column. If it has a Timestamp column,
    ///           it will be ignored.
    ///           If another row already exists in the table with the given PartitionKey and RowKey, it will
    ///           be replaced by this row, losing any columns the original row had but this new one doesn't.
    /// </remarks>
    /// <param name="TableName">The name of the table to insert the row into</param>
    /// <param name="Entity">The row to insert</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the insertion is successful, false otherwise</returns>
    function UpdateEntity(const TableName: string; Entity: TCloudTableRow;
                          ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Inserts a row into the given table, merging with a previous version of the row, if any.</summary>
    /// <remarks> The row must have a PartitionKey and RowKey column. If it has a Timestamp column,
    ///           it will be ignored.
    ///           If another row already exists in the table with the given PartitionKey and RowKey, it will
    ///           be merged with the row being specified in this call. The resulting row will be the one
    ///           specified here, plus any columns not in this row, but existing in the original row.
    /// </remarks>
    /// <param name="TableName">The name of the table to insert the row into</param>
    /// <param name="Entity">The row to insert</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the insertion is successful, false otherwise</returns>
    function MergeEntity(const TableName: string; Entity: TCloudTableRow;
                         ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Deletes the given row from the specified table.</summary>
    /// <remarks>The row must have a PartitionKey and RowKey column specified.</remarks>
    /// <param name="TableName">The name of the table to delete the row from.</param>
    /// <param name="Entity">The row to delete</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the deletion is successful, false otherwise.</returns>
    function DeleteEntity(const TableName: string; const Entity: TCloudTableRow;
                          ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Returns details about any stored access policies on the table that may be used with Shared Access Signatures.</summary>
    /// <param name="ATableName">The name of the table to get the access policies.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the stored access policies.</returns>
    function GetTableACLXML(const ATableName: string; const AClientRequestID: string;
      const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Returns details about any stored access policies on the table that may be used with Shared Access Signatures.</summary>
    /// <param name="ATableName">The name of the table to get the access policies.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>An array with every stored access policies.</returns>
    function GetTableACL(const ATableName: string; const AClientRequestID: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TSignedIdentifier>;
    /// <summary>Sets the stored access policies for the table that may be used with Shared Access Signatures.</summary>
    /// <remarks>
    ///   When you establish a stored access policy on a table, it may take up to 30 seconds to take effect.
    ///   During this interval, a shared access signature that is associated with the stored access policy will fail
    ///   with status code 403 (Forbidden), until the access policy becomes active.
    /// </remarks>
    /// <param name="ATableName">The name of the table to set the access policies.</param>
    /// <param name="ASignedIdentifierId">An unique identifier to specify a stored access policy.</param>
    /// <param name="AAccessPolicy">An access policy to store.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>True if the ACL was added successfully, false otherwise.</returns>
    function SetTableACL(const ATableName: string; const ASignedIdentifierId: string; const AAccessPolicy: TPolicy;
      const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Sets the stored access policies for the table that may be used with Shared Access Signatures.</summary>
    /// <remarks>
    ///   When you establish a stored access policy on a table, it may take up to 30 seconds to take effect.
    ///   During this interval, a shared access signature that is associated with the stored access policy will fail
    ///   with status code 403 (Forbidden), until the access policy becomes active.
    /// </remarks>
    /// <param name="ATableName">The name of the table to set the access policies.</param>
    /// <param name="ASignedIdentifiers">An array with the ACL's to store.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>True if the ACL's were added successfully, false otherwise.</returns>
    function SetTableACL(const ATableName: string; ASignedIdentifiers: TArray<TSignedIdentifier>;
      const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
  end;

  /// <summary>Implementation of TAzureService for managing a Microsoft Azure Queue Service account.</summary>
  TAzureQueueService = class(TAzureService)
  private
    function GetQueuesQueryPrefix(Headers: TStrings; QueueName: string = 'Queues'): string;
    function GetMessagesFromXML(const xml: string): TList<TCloudQueueMessage>;
    function GetOrPeekMessagesXML(const QueueName: string;
                                  PeekOnly: Boolean;
                                  NumOfMessages: Integer = 0;
                                  VisibilityTimeout: Integer = 0;
                                  ResponseInfo: TCloudResponseInfo = nil): string;
  public
    /// <summary>Returns the maximum number of queue messages that can be returned.</summary>
    /// <returns>The number of queue messages which can be returned by the API for a given queue.</returns>
    function GetMaxMessageReturnCount: Integer;

    /// <summary>Gets the properties of a storage account�s Queue service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the properties for the service</returns>
    function GetQueueServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Gets the properties of a storage account�s Queue service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for storing service properties.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure GetQueueServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Sets the properties of a storage account�s Queue service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for loading service properties.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    function SetQueueServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>Retrieves statistics related to replication for the Queue service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the statistics for the service</returns>
    function GetQueueServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Retrieves statistics related to replication for the Queue service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AStats">The class for loading service stats.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure GetQueueServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Lists the queues currently available in the queue service account.</summary>
    /// <remarks>The supported optional parameters are: prefix, maxresults, include=metadata
    ///          The 'prefix' parameter has a value which is the prefix a queue name must start with
    ///          in order to be includes in the list of queues returned by this request.
    ///          The 'maxresults' parameter takes an integer value specifying how many
    ///          queues to return. If this isn't specified, up to 5000 queues will be returned.
    ///          If the 'include' parameter is specified with a value of 'metadata', then metadata
    ///          corresponding to each queue will be returned in the XML.
    /// </remarks>
    /// <param name="OptionalParams">Optional parameters to use in the query. See remarks for more information.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The XML string representing the queues</returns>
    function ListQueuesXML(OptionalParams: TStrings = nil; ResponseInfo: TCloudResponseInfo = nil): string;
    /// <summary>Lists the queues currently available in the queue service account.</summary>
    /// <remarks>The supported optional parameters are: prefix, maxresults
    ///          The 'prefix' parameter has a value which is the prefix a queue name must start with
    ///          in order to be includes in the list of queues returned by this request.
    ///          The 'maxresults' parameter takes an integer value specifying how many
    ///          queues to return. If this isn't specified, up to 5000 queues will be returned.
    /// </remarks>
    /// <param name="OptionalParams">Optional parameters to use in the query. See remarks for more information.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The list of queues, or an empty list</returns>
    function ListQueues(OptionalParams: TStrings = nil; ResponseInfo: TCloudResponseInfo = nil): TList<TCloudQueue>;
    /// <summary>Creates a queue with the given name and metadata.</summary>
    /// <remarks>If metadata is specified, it will be set as the metadata associated with the queue.</remarks>
    /// <param name="QueueName">The name of the queue to create.</param>
    /// <param name="MetaDataHeaders">The header name/value pairs to associate with the queue.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the create was successful, false otherwise.</returns>
    function CreateQueue(const QueueName: string; const MetaDataHeaders: TStrings = nil;
                         ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Deletes the queue with the given name.</summary>
    /// <remarks>The queue is marked for delete and won't show up in queries, but there will be a short time
    ///          before the server allows another queue with the same name to be created again.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to delete.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the delete is successful, false otherwise</returns>
    function DeleteQueue(const QueueName: string; ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Returns the metadata name/value pairs associated with the given queue</summary>
    /// <param name="QueueName">The name of the queue to get the metadata for</param>
    /// <param name="MetaData">The returned metadata, or nil if the call fails</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the call is successful, false otherwise</returns>
    function GetQueueMetadata(const QueueName: string; out MetaData: TStrings;
                              ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Sets the metadata name/value pairs associated with the given queue</summary>
    /// <param name="QueueName">The name of the queue to set the metadata for</param>
    /// <param name="MetaData">The metadata to set for the queue</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the call is successful, false otherwise</returns>
    function SetQueueMetadata(const QueueName: string; const MetaData: TStrings;
                              ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Returns details about any stored access policies on the queue that may be used with Shared Access Signatures.</summary>
    /// <param name="AQueueName">The name of the queue to get the access policies.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the stored access policies.</returns>
    function GetQueueACLXML(const AQueueName: string; const AClientRequestID: string;
      const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Returns details about any stored access policies on the queue that may be used with Shared Access Signatures.</summary>
    /// <param name="AQueueName">The name of the queue to get the access policies.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>An array with every stored access policies.</returns>
    function GetQueueACL(const AQueueName: string; const AClientRequestID: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TSignedIdentifier>;
    /// <summary>Sets the stored access policies for the queue that may be used with Shared Access Signatures.</summary>
    /// <remarks>
    ///   When you establish a stored access policy on a queue, it may take up to 30 seconds to take effect.
    ///   During this interval, a shared access signature that is associated with the stored access policy will fail
    ///   with status code 403 (Forbidden), until the access policy becomes active.
    /// </remarks>
    /// <param name="AQueueName">The name of the queue to set the access policies.</param>
    /// <param name="ASignedIdentifierId">An unique identifier to specify a stored access policy.</param>
    /// <param name="AAccessPolicy">An access policy to store.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>True if the ACL was added successfully, false otherwise.</returns>
    function SetQueueACL(const AQueueName: string; const ASignedIdentifierId: string; const AAccessPolicy: TPolicy;
      const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Sets the stored access policies for the queue that may be used with Shared Access Signatures.</summary>
    /// <remarks>
    ///   When you establish a stored access policy on a queue, it may take up to 30 seconds to take effect.
    ///   During this interval, a shared access signature that is associated with the stored access policy will fail
    ///   with status code 403 (Forbidden), until the access policy becomes active.
    /// </remarks>
    /// <param name="AQueueName">The name of the queue to set the access policies.</param>
    /// <param name="ASignedIdentifiers">An array with the ACL's to store.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>True if the ACL's were added successfully, false otherwise.</returns>
    function SetQueueACL(const AQueueName: string; ASignedIdentifiers: TArray<TSignedIdentifier>;
      const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Queries the Cross-Origin Resource Sharing (CORS) rules for the Queue service prior to sending
    ///          the actual request.
    /// </summary>
    /// <param name="AQueueName">The table resource that is to be the target of the actual request.</param>
    /// <param name="AOrigin">
    ///   Required. Specifies the origin from which the actual request will be issued. The origin is checked against the
    ///   service's CORS rules to determine the success or failure of the preflight request.</param>
    /// <param name="AAccessControlRequestMethod">
    ///   Required. Specifies the method (or HTTP verb) for the actual request. The method is checked against the
    ///   service's CORS rules to determine the failure or success of the preflight request.</param>
    /// <param name="AAccessControlRequestHeaders">
    ///   Optional. Specifies the headers for the actual request headers that will be sent, then the service assumes no
    ///   headers are sent with the actual request.</param>
    /// <param name="ARule">The class for storing service rules.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure PreflightQueueRequest(const AQueueName: string; const AOrigin: string;
      const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
      const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Adds a message to the given queue</summary>
    /// <remarks>The TimeToLive parameter, if set to something greater tha 0, speicifies the time in seconds
    ///          to leave the message in the queue before expiring it. The maximum (and default) is 7 days.
    /// </remarks>
    /// <param name="QueueName">The queue to add the message to</param>
    /// <param name="MessageText">The text of the message</param>
    /// <param name="TimeToLive">The time in seconds before the message expires, or 0 to use the server default.
    /// </param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the message was added successfully, false otherwise.</returns>
    function AddMessage(const QueueName: string; const MessageText: string; const TimeToLive: Integer = 0;
                        ResponseInfo: TCloudResponseInfo = nil): Boolean;
    /// <summary>Returns messages from the given queue.</summary>
    /// <remarks>If NumOfMessages isn't set, then the server default of 1 is used. The maximum allowed value is 32.
    ///          If VisibilityTimeout isn't set, the server default (30 seconds) is used. The maximum allowed
    ///          value is 2 hours.
    ///          Note that messages returned by this call will have their PopReceipt specified, which is a
    ///          token unique to the message during the VisibilityTimeout which can be used to delete the message.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to get the messages for</param>
    /// <param name="NumOfMessages">The maximum number of messages to return.</param>
    /// <param name="VisibilityTimeout">How long the messages should be reserved for</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The XML representation of the messages</returns>
    function GetMessagesXML(const QueueName: string;
                            NumOfMessages: Integer = 0;
                            VisibilityTimeout: Integer = 0;
                            ResponseInfo: TCloudResponseInfo = nil): string;
    /// <summary>Returns messages from the given queue.</summary>
    /// <remarks>If NumOfMessages isn't set, then the server default of 1 is used. The maximum allowed value is 32.
    ///          If VisibilityTimeout isn't set, the server default (30 seconds) is used. The maximum allowed
    ///          value is 2 hours.
    ///          Note that messages returned by this call will have their PopReceipt specified, which is a
    ///          token unique to the message during the VisibilityTimeout which can be used to delete the message.
    ///          During VisibilityTimeout the messages are hidden from any further message querying.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to get the messages for</param>
    /// <param name="NumOfMessages">The maximum number of messages to return.</param>
    /// <param name="VisibilityTimeout">How long the messages should be reserved for</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The list of messages, with their pop receipts populated</returns>
    function GetMessages(const QueueName: string;
                         NumOfMessages: Integer = 0;
                         VisibilityTimeout: Integer = 0;
                         ResponseInfo: TCloudResponseInfo = nil): TList<TCloudQueueMessage>;
    /// <summary>Returns messages from the given queue.</summary>
    /// <remarks>If NumOfMessages isn't set, then the server default of 1 is used. The maximum allowed value is 32.
    ///          Note that messages returned by this call will NOT have their PopReceipt specified. There is
    ///          not VisibilityTimeout, and so other people can instantly query messages and see them.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to get the messages for</param>
    /// <param name="NumOfMessages">The maximum number of messages to return.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The XML representation of the messages</returns>
    function PeekMessagesXML(const QueueName: string; NumOfMessages: Integer;
                             ResponseInfo: TCloudResponseInfo = nil): string;
    /// <summary>Returns messages from the given queue.</summary>
    /// <remarks>If NumOfMessages isn't set, then the server default of 1 is used. The maximum allowed value is 32.
    ///          Note that messages returned by this call will NOT have their PopReceipt specified. There is
    ///          no VisibilityTimeout, so other people can instantly query messages and see them.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to get the messages for</param>
    /// <param name="NumOfMessages">The maximum number of messages to return.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>The list of messages</returns>
    function PeekMessages(const QueueName: string; NumOfMessages: Integer;
                          ResponseInfo: TCloudResponseInfo = nil): TList<TCloudQueueMessage>;
    /// <summary>Deletes the given message from the specified queue</summary>
    /// <param name="QueueName">Name of the queue to delete a message from</param>
    /// <param name="MessageId">The unique ID of the message to delete</param>
    /// <param name="PopReceipt">The pop receipt required for deleting the message</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the delete was successful, false otherwise</returns>
    function DeleteMessage(const QueueName: string; const MessageId: string; const PopReceipt: string;
                           ResponseInfo: TCloudResponseInfo = nil): Boolean; overload;
    /// <summary>Deletes the given message from the specified queue</summary>
    /// <remarks>If GetPopReceiptIfNeeded is set to true (which it is by default) then if the message object
    ///          has empty string set as its pop receipt then a pop receipt is acquired by first calling
    ///          GetMessages with the default values for number of messages and visibility timeout.
    ///          If the message requesting deletion isn't on the top of the queue, the deletion will fail.
    /// </remarks>
    /// <param name="QueueName">The name of the queue to delete the message from</param>
    /// <param name="QueueMessage">The message to delete</param>
    /// <param name="GetPopReceiptIfNeeded">True to try getting a pop receipt for the message
    ///                                     if it doesn't have one already.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the deletion succeeds, false otherwise.</returns>
    function DeleteMessage(const QueueName: string; const QueueMessage: TCloudQueueMessage;
                           GetPopReceiptIfNeeded: Boolean = True;
                           ResponseInfo: TCloudResponseInfo = nil): Boolean; overload;
    /// <summary>Clears the messages from the given queue</summary>
    /// <param name="QueueName">The name of the queue to delete all messages from</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if successful, false otherwise</returns>
    function ClearMessages(const QueueName: string;
                           ResponseInfo: TCloudResponseInfo = nil): Boolean;
  end;

  TAzureContainerItem = record
    /// <summary>The name of the container</summary>
    Name: string;
    /// <summary>The unique URL of the container</summary>
    URL: string;
    /// <summary>The properties associated with the container</summary>
    Properties: TArray<TPair<string, string>>;
    /// <summary>The metadata associated with the container</summary>
    Metadata: TArray<TPair<string, string>>;

    function IsRoot: Boolean;
  end;

  /// <summary>Represents a container for the Microsoft Azure Blob Service</summary>
  TAzureContainer = class
  private
    FName: string;
    FURL: string;
    FProperties: TStrings;
    FMetadata: TStrings;
  public
    /// <summary>Creates a new instance of TAzureContainer</summary>
    /// <remarks>If Properties and/or Metadata are left as nil, then a new empty TStrings will be created.
    /// </remarks>
    // / <param name="Name">The name of the container</param>
    // / <param name="URL">The unique URL of the container</param>
    // / <param name="Properties">The properties associated with the container</param>
    // / <param name="Metadata">The metadata associated with the container</param>
    constructor Create(const Name, URL: string; Properties: TStrings = nil; Metadata: TStrings = nil);
    class function CreateFromRecord(AAzureContainer: TAzureContainerItem): TAzureContainer;
    /// <summary>Frees the properties and metadata and destroys the instance.</summary>
    destructor Destroy; override;

    /// <summary>Says if this container is the root container</summary>
    /// <returns>Returns </returns>
    function IsRoot: Boolean;

    /// <summary>The name of the container</summary>
    property Name: string read FName;
    /// <summary>The unique URL of the container</summary>
    property URL: string read FURL;
    /// <summary>The properties associated with the container</summary>
    property Properties: TStrings read FProperties;
    /// <summary>The metadata associated with the container</summary>
    property Metadata: TStrings read FMetadata;
  end;

  /// <summary>Options for container and blob public access restrictions.</summary>
  /// <remarks>These are used to determine which containers (and the blobs they contain) are visible to the public
  ///          and with which restrictions they are visible.
  ///          When bpaPrivate is used, neither the Container or the blobs it contains are publicly visible.
  ///          When bpaContainer is used, the container and its blobs are fully visible
  ///          When bpaBlob is used, the blobs within the container are visible, but the container
  ///          data itself is hidden. This also prevents enumerating the blobs of a container.
  /// </remarks>
  TBlobPublicAccess = (bpaPrivate, bpaContainer, bpaBlob);

  /// <summary>Enumerates the types of Azure blobs</summary>
  /// <remarks>abtPrefix is used when the item represents a virtual subdirectory containing blobs</remarks>
  TAzureBlobType = (abtBlock, abtPage, abtAppend, abtPrefix);

  /// <summary>Enumerates the different states a leasable item can be in.</summary>
  TAzureLeaseStatus = (alsLocked, alsUnlocked);

  TAzureBlobItem = record
    Name: string;
    Url: string;
    Snapshot: string;
    BlobType: TAzureBlobType;
    LeaseStatus: TAzureLeaseStatus;
    Properties: array of TPair<string, string>;
    Metadata: array of TPair<string, string>;
  end;

  /// <summary>Represents a blob of any supported type, with its common features.</summary>
  /// <remarks>abtPrefix is used as the BlobType when the item represents a virtual subdirectory
  ///          containing blobs and/or subdirectories. It signifies that only the Name property of
  ///          the blob instance is valid, as it doesn't represent a blob itself, but instead
  ///          represents a directory.
  /// </remarks>
  TAzureBlob = class
  private
    FName: string;
    FUrl: string;
    FSnapshot: string;
    FBlobType: TAzureBlobType;
    FLeaseStatus: TAzureLeaseStatus;
    FProperties: TStrings;
    FMetadata: TStrings;
  public
    /// <summary>Creates a new instance of TAzureBlob</summary>
    // / <param name="Name">The name of the blob, or BlobPrefix if BlobType is abtPrefix</param>
    // / <param name="BlobType">The blob type</param>
    // / <param name="Url">The Blob URL, or empty string if BlobType is abtPrefix</param>
    // / <param name="LeaseStatus">The lease status of the blob</param>
    // / <param name="Snapshot">The optional Snapshot date-time-value</param>
    constructor Create(const Name: string; BlobType: TAzureBlobType; const Url: string = '';
                       LeaseStatus: TAzureLeaseStatus = alsUnlocked; const Snapshot: string = '');
    class function CreateFromRecord(AAzureBlobItem: TAzureBlobItem): TAzureBlob;
    /// <summary>Frees the metadata and properties and destroys the instance.</summary>
    destructor Destroy; override;
    /// <summary>The name of the blob, or BlobPrefix if BlobType is abtPrefix</summary>
    property Name: string read FName;
    /// <summary>The Blob URL, or empty string if BlobType is abtPrefix</summary>
    property Url: string read FUrl;
    /// <summary>The Blob type</summary>
    property BlobType: TAzureBlobType read FBlobType;
    /// <summary>The optional Snapshot date-time-value</summary>
    property Snapshot: string read FSnapshot;
    /// <summary>The lease status of the blob (locked/unlocked)</summary>
    property LeaseStatus: TAzureLeaseStatus read FLeaseStatus write FLeaseStatus;
    /// <summary>The blob's list of property name/value pairs</summary>
    property Properties: TStrings read FProperties;
    /// <summary>The blob's list of metadata name/value pairs</summary>
    property Metadata: TStrings read FMetadata;
  end;

  /// <summary>Record of optional conditional restrictions.</summary>
  /// <remarks>These can be used, for example, when copying a blob or when creating a blob
  ///          snapshot. They provide a way to specify under which conditions the action
  ///          should happen or not happen.
  /// </remarks>
  TBlobActionConditional = record
    /// <summary>A DateTime value. Specify to copy the blob only if the source blob has been
    ///          modified since the specified date/time.
    ///</summary>
    IfSourceModifiedSince: string;
    /// <summary>A DateTime value. Specify to copy the blob only if the source blob has not been
    ///          modified since the specified date/time.
    /// </summary>
    IfSourceUnmodifiedSince: string;
    /// <summary>Specify this conditional header to copy the source blob only if its
    ///          ETag matches the value specified.
    /// </summary>
    IfSourceMatch: string;
    /// <summary>Specify this conditional header to copy the blob only if its ETag
    ///          does not match the value specified.
    /// </summary>
    IfSourceNoneMatch: string;
    /// <summary>A DateTime value. Specify this conditional header to perform the action:
    ///          Copying a Blob:
    ///          only if the destination blob has been modified since the specified date/time.
    ///          Creating a Snapshot:
    ///          only if the blob has been modified since the specified date/time.
    /// </summary>
    IfModifiedSince: string;
    /// <summary>A DateTime value. Specify this conditional header to perform the action:
    ///          Copying a Blob:
    ///          only if the destination blob has not been modified since the specified date/time.
    ///          Creating a Snapshot:
    ///          only if the blob has not been modified since the specified date/time.
    /// </summary>
    IfUnmodifiedSince: string;
    /// <summary>Specify an ETag value to perform the action only if the blob's ETag value
    ///          matches the value specified. The blob checked is either the destination
    ///          blob (when copying a blob) or the blob being snapshotted (when creating a snapshot.)
    /// </summary>
    IfMatch: string;
    /// <summary>Specify an ETag value to perform the action only if the blob's ETag value
    ///          does not match the value specified. The blob checked is either the destination
    ///          blob (when copying a blob) or the blob being snapshotted (when creating a snapshot.)
    /// </summary>
    IfNoneMatch: string;
    /// <summary>Specifies a number that the sequence number must be less than or equal to.
    ///          Used in the PutPage action.
    /// </summary>
    IfSequenceNumberLessThanOrEqual: string;
    /// <summary>Specifies a number that the sequence number must be less than.
    ///          Used in the PutPage action.
    /// </summary>
    IfSequenceNumberLessThan: string;
    /// <summary>Specifies a number that the sequence number must be equal to.
    ///          Used in the PutPage action.
    /// </summary>
    IfSequenceNumberEquals: string;

    /// <summary>Creates a new instance of TBlobActionConditional</summary>
    class function Create: TBlobActionConditional; static;

    /// <summary>Populates the given header list with the key/value pair of any field with an assigned value.
    /// </summary>
    /// <remarks>The keys used will be the header names, as required by Azure requests.</remarks>
    /// <param name="Headers">The headers list to populate</param>
    procedure PopulateHeaders(Headers: TStrings);
  end;

  /// <summary>The available block types for Azure block blobs</summary>
  /// <remarks>abtLatest is used when calling PutBlockList and you want to use the latest version
  ///          of a block, which would either be in the uncommitted list (newer)
  ///          or the commited list (older.)
  /// </remarks>
  TAzureBlockType = (abtCommitted, abtUncommitted, abtLatest);

  /// <summary>A block blob block item.</summary>
  /// <remarks>Size can be left out if this item is being used in a PutBlockList operation.
  ///          It will be populated when calling GetBlockList.
  /// </remarks>
  TAzureBlockListItem = record
    /// <summary>The base 64 encoded unique ID of the block</summary>
    BlockId: string;
    /// <summary>The size of the block data in bytes</summary>
    /// <remarks>Ignore this value when doing utBlockList requests</remarks>
    Size: string;
    /// <summary>The block type</summary>
    /// <remarks>When populated from a GetBlockList call, the available types are:
    ///          abtCommitted and abtUncommitted. When calling PutBlockList, abtLatest is also supported.
    ///          A given ID can have up to two blocks associated with it, where one block is in
    ///          the committed list, and the other is in the uncommited list.
    /// </remarks>
    BlockType: TAzureBlockType;

    /// <summary>Creates a new instance of TAzureBlockListItem with the given values</summary>
    /// <param name="ABlockId">The blob Id to set</param>
    /// <param name="ABlockType">The block type to set</param>
    /// <param name="ASize">The size to set</param>
    /// <returns>A new instance of TAzureBlockListItem</returns>
    class function Create(ABlockId: string; ABlockType: TAzureBlockType;
                          ASize: string = '0'): TAzureBlockListItem; static;
    /// <summary>Returns the XML in a format as required by the PutBlockList action.</summary>
    function AsXML: string;
  end;

  /// <summary>Used when querying blocks, to get all blocks, or refine based on type.</summary>
  TAzureQueryIncludeBlockType = (aqbtCommitted, aqbtUncommitted, aqbtAll);

  /// <summary>Represents a page range, as returned by GetPageRegions.</summary>
  /// <remarks>These are used to specify pages which have been populated with data.
  /// </remarks>
  TAzureBlobPageRange = record
    /// <summary>The first byte of the range, which can be used to infer the page</summary>
    StartByte: Int64;
    /// <summary>The end byte of the range, which can be used to calculate how many pages are in the range.</summary>
    EndByte: Int64;
    /// <summary>Creates a new instance of TAzureBlobPageRange</summary>
    class function Create(StartByte, EndByte: Int64): TAzureBlobPageRange; static;
    /// <summary>Returns the starting page, zero-indexed, based on the StartByte.</summary>
    /// <returns>the starting page of the range</returns>
    function GetStartPage: Integer;
    /// <summary>Returns the number of pages in the range.</summary>
    /// <returns>The number of pages in the range.</returns>
    function GetPageCount: Integer;
  end;

  TAzureContainerLeaseActionMode = (clamAcquire, clamRenew, clamChange, clamRelease, clamBreak);
  TAzureBlobDataset = (bdsSnapshots, bdsMetadata, bdsUncommitedBlobs, bdsCopy);
  TAzureBlobDatasets = set of TAzureBlobDataset;

  /// <summary>Implementation of TAzureService for managing a Microsoft Azure Blob Service account.</summary>
  TAzureBlobService = class(TAzureService)
  private
    function GetBlobContainerQueryPrefix(const AHeaders: TStrings; const AContainerName, ABlobName: string): string;
    function ParseContainerPropertiesFromNode(const ANode: IXMLNode): TArray<TPair<string, string>>;
    function ParseContainerFromNode(const AContainerNode: IXMLNode): TAzureContainerItem;
    function ParseBlobFromNode(const ABlobNode: IXMLNode): TAzureBlobItem;
    function BuildMetadataHeaderList(const AMetadata: TStrings): TStringList;
    function GetPublicAccessString(APublicAccess: TBlobPublicAccess): string;
    function HandleContainerLease(const AContainerName: string; ALeaseAction: TAzureContainerLeaseActionMode;
      var ALeaseId: string; const AProposedLeaseId: string; ALeaseDuration: Integer;
      out ALeaseTimeRemaining: Integer; const AResponseInfo: TCloudResponseInfo): Boolean;
    function HandleBlobLease(const AContainerName, ABlobName, ALeaseAction, ALeaseId, AProposedLeaseId: string;
      ALeaseDuration, ASuccessCode: Integer; out ASuccess: Boolean; AResponseInfo: TCloudResponseInfo): string;
    function DeleteBlobInternal(const AContainerName, ABlobName, ASnapShot: string; AOnlySnapshots: Boolean;
      const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): Boolean;
    function GetBlobInternal(const AContainerName, ABlobName, ASnapshot, ALeaseId: string;
      AStartByte, AEndByte: Int64; AGetAsHash: Boolean; out AMetadata, AProperties: TArray<TPair<string, string>>;
      AResponseContent: TStream; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    function PutBlobInternal(ABlobType: TAzureBlobType; const AContainerName, ABlobName, ALeaseID: string;
      const ABlockContent: TArray<Byte>; AMaximumSize, ABlobSequenceNumber: Int64;
      AOptionalHeaders, AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
    function CopyBlobInternal(const ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
      ASourceSnapshot, ATargetLeaseId: string; ACopyConditionals: TBlobActionConditional;
      AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;

    function PutPageInternal(const AContainerName, ABlobName, ALeaseID: string; ADoClear: Boolean;
      AStartPage, APageCount: Integer; const AContent: TArray<Byte>; const AContentMD5: string;
      AActions: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    procedure PopulateBlobPropertyHeaders(AHeaders, AProperties: TStrings);
    procedure PopulatePropertyHeaders(const AHeaders: TStrings; const AProperties: array of TPair<string, string>);
    procedure PopulateMetadataHeaders(const AHeaders: TStrings; const AMetadata: array of TPair<string, string>);
    procedure PopulateOptionalHeaders(const AHeaders: TStrings; const AOptions: array of TPair<string, string>);
    function ParseBlockItemsFromNode(ABlocksNode: IXMLNode; ABlockType: TAzureBlockType): TArray<TAzureBlockListItem>;

    class procedure GetOptionalParams(OptionalParams: TStrings; var APrefix,
      ADelimiter, AMarker: string; ADatasets: TAzureBlobDatasets); static;

    /// <summary>Returns the containers available on the blob service account.</summary>
    /// <param name="AIncludeMetadata">Indicates that the container's metadata be returned as part of the response body.</param>
    /// <param name="APrefix">Filters the results to return only containers whose name begins with the specified prefix.</param>
    /// <param name="AMarker">A string value that identifies the portion of the list to be returned with the next list operation.</param>
    /// <param name="AMaxResult">Specifies the maximum number of containers to return.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>The XML representation of the available containers.</returns>
    function ListContainersXML(AIncludeMetadata: Boolean; const APrefix: string; const AMarker: string;
      AMaxResult: Integer; const AResponseInfo: TCloudResponseInfo): string; overload;
    /// <summary>Returns the list of blobs for the given container.</summary>
    /// <remarks>The following parameters are supported:
    ///          prefix, delimiter, marker, maxresults, include={snapshots,metadata,uncommittedblobs}
    ///          If prefix is specified, only blobs with names starting with the specified prefix are shown.
    ///          If delimiter is specified, then Any blob with a name (after the prefix string) containing
    ///          the delimiter string will be grouped into a 'BlobPrefix' node, as appropriate. What this
    ///          does is provides a way to view the blobs with a virtual directory structure, where you could
    ///          then take the values of the returned 'BlobPrefix' Name nodes, and use those as prefix values
    ///          for subsequent calls.
    ///          If marker is specified, it is used as a continuation token to retrieve more blobs from where
    ///          a previous invocation left off when it wasn't able to return all the blobs.
    ///          If maxresults is specified, then it is treated as an integer representing the maximum
    ///          number of blobs to return. The default (and maximum) is 5000. If more blobs exist than the
    ///          maxresults allows, then the 'NextMarker' in the XML will be populated, and you can use this
    ///          as the value of 'marker' in a future call.
    ///          If include is specified it can have a set of one or more of the following values:
    ///            snapshots - Snapshots should be included in the enumeration.
    ///            metadata - Blob metadata be returned in the response.
    ///            uncommittedblobs - Blobs for which blocks have been uploaded, but which have not been committed using Put Block List, be included in the response.
    ///            copy - Metadata related to any current or previous Copy Blob operation should be included in the response.
    ///          Note that blobs under the $root container can't have a slash in thier name.
    /// </remarks>
    /// <param name="AContainerName">The container to get the blobs for. Or $root for the root container.</param>
    /// <param name="APrefix">Filters the results to return only blobs whose names begin with the specified prefix.</param>
    /// <param name="ADelimiter">When the request includes this parameter, the operation returns a BlobPrefix element in the response body that acts as a placeholder for all blobs whose names begin with the same substring up to the appearance of the delimiter character.</param>
    /// <param name="AMarker">A string value that identifies the portion of the list to be returned with the next list operation. </param>
    /// <param name="AMaxResult">Specifies the maximum number of blobs to return, including all BlobPrefix elements.</param>
    /// <param name="ADatasets">Specifies one or more datasets to include in the response.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>The XML representation of the container's blobs.</returns>
    function ListBlobsXML(const AContainerName: string; const APrefix: string; const ADelimiter: string;
      const AMarker: string; AMaxResult: Integer; ADatasets: TAzureBlobDatasets; const AResponseInfo: TCloudResponseInfo): string; overload;

    function GetPageRangesXML(const AContainerName, ABlobName, ALeaseID: string; AStartByte, AEndByte: Int64;
      const ASnapshot, APrevSnapshot: string; const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Returns the block list for the given blob.</summary>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the block blob to get the block list for.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="ASnapShot">The snapshot Id if you want the list of a snapshot instead of the blob.</param>
    /// <param name="ABlockType">The type of blocks to get. Either committed, uncommitted, or both.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>The XML representation of the block list.</returns>
    function GetBlockListXML(const AContainerName, ABlobName, ALeaseID, ASnapShot: string;
      ABlockType: TAzureQueryIncludeBlockType; const AResponseInfo: TCloudResponseInfo): string; overload;
    /// <summary>Returns the public permissions for the container.</summary>
    /// <param name="AContainerName">The name of the container to get the permissions for</param>
    /// <param name="APublicAccess">The public access setting for the container</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>The XML representation of the access policies</returns>
    function GetContainerACLXML(const AContainerName: string; out APublicAccess: TBlobPublicAccess;
      const AResponseInfo: TCloudResponseInfo): string; overload;
  public
    /// <summary>Gets the properties of a storage account�s Blob service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>The XML representation of the properties for the service</returns>
    function GetBlobServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): String;
    /// <summary>Gets the properties of a storage account�s Blob service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for storing service properties.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    procedure GetBlobServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
    /// <summary>Sets the properties of a storage account�s Blob service, including properties for Storage Analytics
    ///          and CORS (Cross-Origin Resource Sharing) rules.
    /// </summary>
    /// <remarks>Only the storage account owner may call this operation.</remarks>
    /// <param name="AProperties">The class for loading service properties.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    function SetBlobServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>Retrieves statistics related to replication for the Blob service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>The XML representation of the statistics for the service</returns>
    function GetBlobServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
    /// <summary>Retrieves statistics related to replication for the Blob service.</summary>
    /// <remarks>It is only available on the secondary location endpoint when read-access geo-redundant replication is
    ///          enabled for the storage account.
    /// </remarks>
    /// <param name="AStats">The class for loading service stats.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure GetBlobServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);

    /// <summary>This fuction is deprecated. Instead, use ListContainers method.</summary>
    function ListContainersXML(OptionalParams: TStrings = nil; ResponseInfo: TCloudResponseInfo = nil): string; overload; deprecated 'Use ListContainers method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ListContainers(out NextMarker: string;
                            OptionalParams: TStrings = nil;
                            ResponseInfo: TCloudResponseInfo = nil): TList<TAzureContainer>; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ListContainers(OptionalParams: TStrings = nil;
                            ResponseInfo: TCloudResponseInfo = nil): TList<TAzureContainer>; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the containers available on the blob service account.</summary>
    /// <param name="AIncludeMetadata">Indicates that the container's metadata be returned as part of the response body.</param>
    /// <param name="APrefix">Filters the results to return only containers whose name begins with the specified prefix.</param>
    /// <param name="AMarker">A string value that identifies the portion of the list to be returned with the next list operation.</param>
    /// <param name="AMaxResult">Specifies the maximum number of containers to return.</param>
    /// <param name="ANextMarker">Indicates the next container to return on a subsequent request.</param>
    /// <param name="AResponseXML">The response in XML format.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>The list of the available containers.</returns>
    function ListContainers(AIncludeMetadata: Boolean; const APrefix: string; const AMarker: string;
      AMaxResult: Integer; out ANextMarker: string; out AResponseXML: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TAzureContainerItem>; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CreateContainer(ContainerName: string;
                             MetaData: TStrings = nil;
                             PublicAccess: TBlobPublicAccess = bpaContainer;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates a new container with the given name</summary>
    /// <remarks>If the container with the same name already exists, or if the naming requirements
    ///          aren't followed, then the operation fails.
    /// </remarks>
    /// <param name="AContainerName">The name of the container to create.</param>
    /// <param name="AMetaData">A name-value pair to associate with the container as metadata.</param>
    /// <param name="APublicAccess">Specifies whether data in the container may be accessed publicly and the level of access.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the creation was successful, false otherwise.</returns>
    function CreateContainer(const AContainerName: string; const AMetaData: array of TPair<string, string>;
      APublicAccess: TBlobPublicAccess; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CreateRootContainer(MetaData: TStrings = nil;
                                 PublicAccess: TBlobPublicAccess = bpaContainer;
                                 ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates the root container.</summary>
    /// <remarks>If the root container already exists then the operation fails. This calls into
    ///          CreateContainer, passing $root as the ContainerName.
    /// </remarks>
    /// <param name="AMetaData">A name-value pair to associate with the container as metadata.</param>
    /// <param name="APublicAccess">Specifies whether data in the container may be accessed publicly and the level of access.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the creation was successful, false otherwise.</returns>
    function CreateRootContainer(const AMetaData: array of TPair<string, string>; APublicAccess: TBlobPublicAccess;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function DeleteContainer(ContainerName: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Deletes the container with the given name.</summary>
    /// <remarks>The container and any blobs contained within it are later deleted during garbage collection.</remarks>
    /// <param name="AContainerName">The name of the container to delete.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the delete is successful, false otherwise.</returns>
    function DeleteContainer(const AContainerName: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Deletes the root container</summary>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the delete is successful, false otherwise.</returns>
    function DeleteRootContainer(const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetContainerProperties(ContainerName: string; out Properties: TStrings;
                                    ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetContainerProperties(ContainerName: string; out Properties, Metadata: TStrings;
                                    ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the properties for the container with the given name.</summary>
    /// <param name="AContainerName">The name of the container to get the properties for</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>List of the container properties.</returns>
    function GetContainerProperties(const AContainerName: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetContainerMetadata(ContainerName: string; out Metadata: TStrings;
                                  ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the metadata for the container with the given name.</summary>
    /// <param name="AContainerName">The name of the container to get the metadata for.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>List of the container metadata.</returns>
    function GetContainerMetadata(const AContainerName: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetContainerMetadata(ContainerName: string; const Metadata: TStrings;
                                  ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Sets the metadata for the specified container.</summary>
    /// <remarks>Note that this replaces any existing metadata values. If you don't want to lose any
    ///          of the metadata already on the container, be sure to include them in the Metadata
    ///          passed in to this call.
    /// </remarks>
    /// <param name="AContainerName">The name of the container to set the metadata for.</param>
    /// <param name="AMetadata">The metadata to set onto the container</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the action was successful, false otherwise</returns>
    function SetContainerMetadata(const AContainerName: string; AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use GetContainerACL method.</summary>
    function GetContainerACLXML(ContainerName: string; out PublicAccess: TBlobPublicAccess): string; overload; deprecated 'Use GetContainerACL method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetContainerACL(ContainerName: string; out PublicAccess: TBlobPublicAccess;
                             ResponseInfo: TCloudResponseInfo = nil): TList<TSignedIdentifier>; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the public permissions for the container.</summary>
    /// <param name="AContainerName">The name of the container to get the permissions for</param>
    /// <param name="APublicAccess">The public access setting for the container</param>
    /// <param name="AResponseXML">The response in XML format.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>The list of access policies</returns>
    function GetContainerACL(const AContainerName: string; out APublicAccess: TBlobPublicAccess;
      out AResponseXML: string; const AResponseInfo: TCloudResponseInfo): TArray<ISignedIdentifier>; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetContainerACL(ContainerName: string;
                             const SignedIdentifierId: string;
                             AccessPolicy: TAccessPolicy;
                             PublicAccess: TBlobPublicAccess = bpaContainer;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetContainerACL(const AContainerName: string; const ASignedIdentifierId: string;
                             const AAccessPolicy: TPolicy; APublicAccess: TBlobPublicAccess;
                             const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetContainerACL(ContainerName: string;
                             SignedIdentifiers: TList<TSignedIdentifier>;
                             PublicAccess: TBlobPublicAccess = bpaContainer;
                             ResponseInfo: TCloudResponseInfo = nil;
                             const AClientRequestID: string = ''): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Adds or updates the Signed Identifiers for the specified container.</summary>
    /// <remarks>When calling this function, the existing permissions are replaced.
    ///          To update the container's permissions, call GetContainerACL to retrieve all access policies
    ///          associated with the container, change the access policy that you want,
    ///          then call SetContainerACL with the complete list of TSignedIdentifier to perform the update.
    /// </remarks>
    /// <param name="AContainerName">The name of the container to set the signed identifiers for</param>
    /// <param name="ASignedIdentifiers">The signed identifiers (with their access policies) to set.</param>
    /// <param name="APublicAccess">The value to set as the container's public access. Defaults to container</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled.
    /// </param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the action was successful, false otherwise</returns>
    function SetContainerACL(const AContainerName: string; ASignedIdentifiers: array of ISignedIdentifier;
      const APublicAccess: TBlobPublicAccess; const AClientRequestID: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Attempts to acquire a lease on the specified container.</summary>
    /// <remarks>When calling this function, specify a valid GUID on LeaseId parameter
    ///          to use it as proposed lease ID.
    /// </remarks>
    /// <param name="AContainerName">The name of the container.</param>
    /// <param name="ALeaseId">The acquired lease ID, or empty string is failed.</param>
    /// <param name="ALeaseDuration">Specifies the duration of the lease, in seconds, or negative one (-1) for a lease that never expires. A non-infinite lease can be between 15 and 60 seconds.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the lease was acquired, false otherwise.</returns>
    function AcquireContainerLease(const AContainerName: string; var ALeaseId: string; ALeaseDuration: Integer;
      const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>Attempts to renew the specified lease for the given container.</summary>
    /// <param name="AContainerName">The name of the container.</param>
    /// <param name="ALeaseId">The Id of the lease that was previously acquired.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the lease was renewed, false otherwise.</returns>
    function RenewContainerLease(const AContainerName: string; var ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ReleaseContainerLease(const AContainerName: string; var ALeaseId: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Releases a lease that was previously acquired.</summary>
    /// <param name="AContainerName">The name of the container.</param>
    /// <param name="ALeaseId">The Id of the lease that was previously acquired.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the call executes successfully, false otherwise.</returns>
    function ReleaseContainerLease(const AContainerName: string; var ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Breaks a lease previously acquired, without specifying the lease Id.</summary>
    /// <remarks>Similar to calling 'ReleaseContainerLease' but since the LeaseId is not specified,
    ///          the lease is allowed to expire before a new lease can be acquired. In this period,
    ///          the lease is not able to be renewed.
    ///          The value set into LeaseTimeRemaining specifies how many seconds remain before
    ///          the current lease expires.
    /// </remarks>
    /// <param name="AContainerName">The name of the container.</param>
    /// <param name="ALeaseTimeRemaining">The number of seconds remaining until the lease expires.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function BreakContainerLease(const AContainerName: string; out ALeaseTimeRemaining: Integer;
      const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>Changes the ID of an existing lease.</summary>
    /// <param name="AContainerName">The name of the container.</param>
    /// <param name="ALeaseID">The actual lease ID.</param>
    /// <param name="AProposedLeaseID">The new lease ID.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function ChangeContainerLease(const AContainerName: string; var ALeaseID: string; const AProposedLeaseID: string;
      const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>This fuction is deprecated. Instead, use ListBlobs method.</summary>
    function ListBlobsXML(ContainerName: string; OptionalParams: TStrings = nil;
                          ResponseInfo: TCloudResponseInfo = nil): string; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ListBlobs(ContainerName: string; OptionalParams: TStrings = nil;
                       ResponseInfo: TCloudResponseInfo = nil): TList<TAzureBlob>; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ListBlobs(ContainerName: string; out NextMarker: string; OptionalParams: TStrings = nil;
                       ResponseInfo: TCloudResponseInfo = nil): TList<TAzureBlob>; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the list of blobs for the given container.</summary>
    /// <param name="AContainerName">The container to get the blobs for. Or $root for the root container.</param>
    /// <param name="APrefix">Filters the results to return only containers whose name begins with the specified prefix.</param>
    /// <param name="ADelimiter">Returns a BlobPrefix element in the response body that acts as a placeholder for all
    ///  blobs whose names begin with the same APrefix up to the appearance of the ADelimiter character. These placeholders
    ///  are added to ABlobPrefix and to Result with BlobType=abtPrefix.</param>
    /// <param name="AMarker">A string value that identifies the portion of the list to be returned with the next list operation.</param>
    /// <param name="AMaxResult">Specifies the maximum number of containers to return.</param>
    /// <param name="ADatasets">Specifies one or more datasets to include in the response.</param>
    /// <param name="ANextMarker">Indicates the next container to return on a subsequent request.</param>
    /// <param name="ABlobPrefix">The list of blob prefixes.</param>
    /// <param name="AResponseXML">The response in XML format.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>The list of the container's blobs.</returns>
    function ListBlobs(const AContainerName: string; const APrefix: string; const ADelimiter: string;
      const AMarker: string; AMaxResult: Integer; ADatasets: TAzureBlobDatasets; out ANextMarker: string;
      out ABlobPrefix: TArray<string>; out AResponseXML: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlobItem>; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutBlockBlob(ContainerName, BlobName: string; Content: TArray<Byte>;
                          LeaseId: string = '';
                          OptionalHeaders: TStrings = nil; Metadata: TStrings = nil;
                          ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates a new block blob, or updates an existing one, in the given container</summary>
    /// <remarks>If a block blob with the given name (in the specified container) already exists,
    ///          then its content will be replaced with the data from this call.
    ///          Note that LeaseId should be set as EmptyString, except when a blob with the given name
    ///          already exists, and it is currently locked.
    ///          The Optional headers can be set onto the request. Such as:
    ///            Content-Type (or x-ms-blob-content-type)
    ///            Content-Encoding (or x-ms-blob-content-encoding)
    ///            Content-Language (or x-ms-blob-content-language)
    ///            Content-MD5 (or x-ms-blob-content-md5)
    ///            Cache-Control (or x-ms-blob-cache-control)
    ///            If-Modified-Since
    ///            If-Unmodified-Since
    ///            If-Match (Compares the resource's Etag value to the value of this header)
    ///            If-None-Match (Compares the resource's Etag value to the value of this header)
    ///          The optional metadata names should start with 'x-ms-meta-'. If they do not,
    ///          this prefix will be added.
    ///          The maximum allowed Content-Length of a block blob is 64 MB. If it is larger than
    ///          that, then you need to upload it as blocks.
    /// </remarks>
    /// <param name="AContainerName">The name of the blob's container</param>
    /// <param name="ABlobName">The name of the blob</param>
    /// <param name="ALeaseId">The optional lease Id.</param>
    /// <param name="AContent">The content to set into the blob</param>
    /// <param name="AOptionalHeaders">The optional headers</param>
    /// <param name="AMetadata">The metadata to set onto the blob</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the create/replace was successful, false otherwise.</returns>
    function PutBlockBlob(const AContainerName, ABlobName, ALeaseID: string; const AContent: TArray<Byte>;
      const AOptionalHeaders, AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutPageBlob(ContainerName, BlobName: string; MaximumSize: int64;
                         OptionalHeaders: TStrings = nil; Metadata: TStrings = nil;
                         BlobSequenceNumber: int64 = 0;
                         ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates a new block blob, or updates an existing one, in the given container</summary>
    /// <remarks>Creates a new page blob, with no content, but a specified maximum content length.
    ///          Page blobs don't have content until you add pages with a PutPage request.
    ///          For more information on the Header and Metadata parameters, see the documentation
    ///          for PutBlockBlob.
    ///          The maximum supported length is 1TB. Each page must be aligned to a 512-byte boundary.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob should be created in.</param>
    /// <param name="ABlobName">The name of the blob.</param>
    /// <param name="ALeaseId">The optional lease Id.</param>
    /// <param name="AMaximumSize">The maximum contentent length of the blob.</param>
    /// <param name="ABlobSequenceNumber">Optional user-controlled value usable for tracking requests.</param>
    /// <param name="AOptionalHeaders">The optional headers.</param>
    /// <param name="AMetadata">The metadata to set onto the blob.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the create/replace was successful, false otherwise.</returns>
    function PutPageBlob(AContainerName, ABlobName, ALeaseID: string; AMaximumSize, ABlobSequenceNumber: Int64;
      const AOptionalHeaders, AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutAppendBlob(const AContainerName, ABlobName, ALeaseID: string;
                           const AOptionalHeaders: TStrings; const AMetadata: TStrings;
                           const AResponseInfo: TCloudResponseInfo): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates a new append blob.</summary>
    /// <param name="AContainerName">The name of the container the blob should be created in.</param>
    /// <param name="ABlobName">The name of the blob.</param>
    /// <param name="ALeaseId">Required if the blob has an active lease.</param>
    /// <param name="AOptionalHeaders">The optional headers.</param>
    /// <param name="AMetadata">The metadata to set onto the blob.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the create was successful, false otherwise.</returns>
    function PutAppendBlob(const AContainerName, ABlobName, ALeaseID: string;
      const AOptionalHeaders, AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function AcquireBlobLease(ContainerName, BlobName: string; out LeaseId: string;
                             ResponseInfo: TCloudResponseInfo = nil; LeaseDuration: Integer = -1;
                             const ProposedLeaseID: string = ''): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Attempts to acquire a lease on the specified blob</summary>
    /// <remarks>You can not acquire a lease for a snapshot.</remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to acquire a lease for</param>
    /// <param name="ALeaseId">The acquired lease ID, or empty string is failed</param>
    /// <param name="AProposedLeaseID">Allow the option for users to propose the lease-id</param>
    /// <param name="ALeaseDuration">Specifies the duration of the lease, in seconds, or negative one (-1) for a lease that never expires. A non-infinite lease can be between 15 and 60 seconds</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the lease was acquired, false otherwise</returns>
    function AcquireBlobLease(const AContainerName, ABlobName: string; out ALeaseId: string;
      const AProposedLeaseID: string; ALeaseDuration: Integer; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function RenewBlobLease(ContainerName, BlobName, LeaseId: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Attempts to renew the specified lease for the given blob.</summary>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to renew the lease for</param>
    /// <param name="ALeaseId">The Id of the lease that was previously acquired</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the lease was renewed, false otherwise</returns>
    function RenewBlobLease(const AContainerName, ABlobName, ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ReleaseBlobLease(ContainerName, BlobName, LeaseId: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Releases a lease that was previously acquired</summary>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to release the lease for</param>
    /// <param name="ALeaseId">The Id of the lease that was previously acquired</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function ReleaseBlobLease(const AContainerName, ABlobName, ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function BreakBlobLease(ContainerName, BlobName: string; out LeaseTimeRemaining: Integer): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Breaks a lease previously acquired, without specifying the lease Id</summary>
    /// <remarks>Similar to calling 'ReleaseBlobLease' but since the LeaseId is not specified,
    ///          the lease is allowed to expire before a new lease can be acquired. In this period,
    ///          the lease is not able to be renewed.
    ///          The value set into LeaseTimeRemaining specifies how many seconds remain before
    ///          the current lease expires.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to break the lease for</param>
    /// <param name="ALeaseTimeRemaining">The number of seconds remaining until the lease expires</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function BreakBlobLease(const AContainerName, ABlobName: string; out ALeaseTimeRemaining: Integer;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Changes the ID of an existing lease</summary>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to change the lease ID</param>
    /// <param name="ALeaseID">The actual lease ID</param>
    /// <param name="AProposedLeaseID">The new lease ID</param>
    /// <param name="AResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function ChangeBlobLease(const AContainerName, ABlobName, ALeaseID, AProposedLeaseID: string;
      const AResponseInfo: TCloudResponseInfo): Boolean;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobMetadata(ContainerName, BlobName: string; out Metadata: TStrings;
                             const Snapshot: string = ''; const LeaseId: string = '';
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Gets the metadata for a given blob.</summary>
    /// <remarks>LeaseId is only required if it is the blob (not a snapshot) you are interested in,
    ///          and if that blob is currently locked. In no other situation should you specify a value
    ///          other than empty string for LeaseId, otherwise the request will fail.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob to get the metadata for.</param>
    /// <param name="ASnapshot">The snapshot identifier, if you are interested in a snapshot of the blob.</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>Returns the metadata stored in the blob.</returns>
    function GetBlobMetadata(const AContainerName: string; const ABlobName: string; const ASnapshot: string;
      const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetBlobMetadata(ContainerName, BlobName: string; Metadata: TStrings; LeaseId: string = '';
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Sets the given metadata onto the specified blob.</summary>
    /// <remarks>LeaseId should only be something other than empty string if the blob is locked.
    ///          This replaces the full set of metadata currently on the blob, it doesn't append to it.
    ///          Updating the metadata of a snapshot is not supported.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to set the metadata for</param>
    /// <param name="AMetadata">The metadata to set.</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function SetBlobMetadata(const AContainerName, ABlobName: string; AMetadata: array of TPair<string, string>;
      const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Queries the Cross-Origin Resource Sharing (CORS) rules for the Blob service prior to sending
    ///          the actual request.
    /// </summary>
    /// <param name="AContainerName">The container resource that is to be the target of the actual request.</param>
    /// <param name="AOrigin">
    ///   Required. Specifies the origin from which the actual request will be issued. The origin is checked against the
    ///   service's CORS rules to determine the success or failure of the preflight request.</param>
    /// <param name="AAccessControlRequestMethod">
    ///   Required. Specifies the method (or HTTP verb) for the actual request. The method is checked against the
    ///   service's CORS rules to determine the failure or success of the preflight request.</param>
    /// <param name="AAccessControlRequestHeaders">
    ///   Optional. Specifies the headers for the actual request headers that will be sent, then the service assumes no
    ///   headers are sent with the actual request.</param>
    /// <param name="ARule">The class for storing service rules.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure PreflightBlobRequest(const AContainerName: string; const AOrigin: string;
      const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
      const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo) overload;
    /// <summary>Queries the Cross-Origin Resource Sharing (CORS) rules for the Blob service prior to sending
    ///          the actual request.
    /// </summary>
    /// <param name="AContainerName">The container resource that is to be the target of the actual request.</param>
    /// <param name="ABlobName">The blob resource that is to be the target of the actual request.</param>
    /// <param name="AOrigin">
    ///   Required. Specifies the origin from which the actual request will be issued. The origin is checked against the
    ///   service's CORS rules to determine the success or failure of the preflight request.</param>
    /// <param name="AAccessControlRequestMethod">
    ///   Required. Specifies the method (or HTTP verb) for the actual request. The method is checked against the
    ///   service's CORS rules to determine the failure or success of the preflight request.</param>
    /// <param name="AAccessControlRequestHeaders">
    ///   Optional. Specifies the headers for the actual request headers that will be sent, then the service assumes no
    ///   headers are sent with the actual request.</param>
    /// <param name="ARule">The class for storing service rules.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    procedure PreflightBlobRequest(const AContainerName, ABlobName: string; const AOrigin: string;
      const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
      const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo) overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobProperties(ContainerName, BlobName: string; out Properties: TStrings;
                               const Snapshot: string = ''; const LeaseId: string = '';
                               ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobProperties(ContainerName, BlobName: string; out Properties: TStrings;
                               out Metadata: TStrings;
                               const Snapshot: string = ''; const LeaseId: string = '';
                               ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Gets the properties for a given blob.</summary>
    /// <remarks>LeaseId is only required if it is the blob (not a snapshot) you are interested in,
    ///          and if that blob is currently locked. In no other situation should you specify a value
    ///          other than empty string for LeaseId, otherwise the request will fail.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob to get the properties for.</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked.</param>
    /// <param name="ASnapshot">The snapshot identifier, if you are interested in a snapshot of the blob.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>Returns the properties stored in the blob.</returns>
    function GetBlobProperties(const AContainerName, ABlobName, ALeaseId, ASnapshot: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SetBlobProperties(ContainerName, BlobName: string; Properties: TStrings;
                               const LeaseId: string = '';
                               ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Sets the given properties onto the specified blob</summary>
    /// <remarks>The supported properties are:
    ///           x-ms-blob-cache-control,
    ///           x-ms-blob-content-type,
    ///           x-ms-blob-content-md5,
    ///           x-ms-blob-content-encoding,
    ///           x-ms-blob-content-language.
    ///          For Page Blobs, these are also supported:
    ///           x-ms-blob-content-length,
    ///           x-ms-sequence-number-action (max, update, increment)
    ///           x-ms-blob-sequence-number (unless x-ms-sequence-number-action = increment).
    ///          When issuing a GetBlobProperties request, the names of the properties are different:
    ///           Cache-Control,
    ///           Content-Type,
    ///           Content-MD5,
    ///           Content-Encoding,
    ///           Content-Language.
    ///          Properties passed in will be given the 'x-ms-blob-' prefix if it is missing. All other
    ///          properties will be ignored.
    ///          LeaseId should only be something other than empty string if the blob is locked.
    ///          This replaces the full set of metadata currently on the blob, it doesn't append to it.
    ///          Updating the metadata of a snapshot is not supported.
    ///
    ///          The x-ms-blob-content-length property can be set to change the "MaximumSize" value specified
    ///          when 'PutPageBlob' was executed.
    ///
    ///          The x-ms-sequence-number-action can be one of 'max', 'update', 'increment'.
    ///            'max': Use the largest integer, either the one specified with 'x-ms-blob-sequence-number'
    ///                   or the one already existing on the server.
    ///            'update': Replace the value of 'x-ms-blob-sequence-number' on the server with this one.
    ///            'increment': Increment the server's value of 'x-ms-blob-sequence-number' by one. Do not
    ///                         specify the 'x-ms-blob-sequence-number' header in this request.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to set the properties for</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked</param>
    /// <param name="AProperties">The properties to set.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the call executes successfully, false otherwise</returns>
    function SetBlobProperties(const AContainerName, ABlobName, ALeaseId: string;
      const AProperties: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function DeleteBlob(ContainerName, BlobName: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Deletes the specified blob, or deletes all of its snapshots.</summary>
    /// <remarks>Deletes the specified blob if 'OnlySnapshots' is False, or deletes
    ///          only the blob's snapshots if 'OnlySnapShot' is true.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to delete</param>
    /// <param name="AOnlySnapshots">True to delete all of the blob's snapshots, but not the blob.</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked</param>
    /// <param name="AResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the blob is deleted successfully, false otherwise</returns>
    function DeleteBlob(const AContainerName, ABlobName: string; AOnlySnapshots: Boolean; const ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function DeleteBlobSnapshot(ContainerName, BlobName, SnapShot: string): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Deletes the specified snapshot of then given blob.</summary>
    /// <remarks>Deletes one specific snapshot of the specified blob.
    ///          To delete all snapshots, or the blob itself, call DeleteBlob.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in</param>
    /// <param name="ABlobName">The name of the blob to delete</param>
    /// <param name="ASnapShot">The snapshot to delete</param>
    /// <param name="ALeaseId">The LeaseId, required if the blob is locked</param>
    /// <param name="AResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the snapshot is deleted successfully, false otherwise</returns>
    function DeleteBlobSnapshot(const AContainerName, ABlobName, ASnapShot, ALeaseId: string;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                     const LeaseId: string = ''; ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                     out Properties, Metadata: TStrings; const LeaseId: string = '';
                     ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                     StartByte: int64; EndByte: int64; GetAsHash: Boolean = False;
                     const LeaseId: string = ''; ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                     out Properties, Metadata: TStrings;
                     StartByte: int64; EndByte: int64; GetAsHash: Boolean = False;
                     const LeaseId: string = ''; ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Downloads the given blob, writing its content into the provided stream.</summary>
    /// <remarks>This call also returns the blob's properties and metadata.
    ///          You can request only a range of the blob to be returned by specifying values
    ///          for StartByte and EndByte. If you specify a range, you can also set GetAsHash
    ///          to True, which will return the MD5 hash of the range's content, instead of the
    ///          content itself. Note that you can only return the hash for a range, and not the
    ///          full content.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob to download.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="AStartByte">The starting byte index.</param>
    /// <param name="AEndByte">The ending byte index, or 0 if you don't want a range of the blob.</param>
    /// <param name="AGetAsHash">True, if EndByte greater than Start byte, returns content as MD5 hash.</param>
    /// <param name="AProperties">The blob's property name/value pairs.</param>
    /// <param name="AMetadata">The blob's metadata name/value pairs.</param>
    /// <param name="ABlobStream">The stream to write the blob content into.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into.</param>
    /// <returns>True if the task was successful, false otherwise.</returns>
    function GetBlob(const AContainerName, ABlobName, ALeaseID: string; AStartByte, AEndByte: Int64;
      AGetAsHash: Boolean; out AProperties, AMetadata: TArray<TPair<string, string>>; ABlobStream: TStream;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                             out Properties, Metadata: TStrings;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                             StartByte: int64 = 0; EndByte: int64 = 0;
                             GetAsHash: Boolean = False;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                             out Properties, Metadata: TStrings;
                             StartByte: int64 = 0; EndByte: int64 = 0;
                             GetAsHash: Boolean = False;
                             ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Downloads the given snapshot, writing its content into the provided stream.</summary>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob the snapshot is for.</param>
    /// <param name="ASnapshot">The snapshot to get.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="AStartByte">The starting byte index.</param>
    /// <param name="AEndByte">The ending byte index, or 0 if you don't want a range of the snapshot.</param>
    /// <param name="AGetAsHash">True, if EndByte greater than Start byte, returns content as MD5 hash.</param>
    /// <param name="AProperties">The snapshot's property name/value pairs.</param>
    /// <param name="AMetadata">The snapshot's metadata name/value pairs.</param>
    /// <param name="ASnapshotStream">The stream to write the snapshot content into.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if the task was successful, false otherwise.</returns>
    function GetBlobSnapshot(const AContainerName, ABlobName, ASnapshot, ALeaseId: string; AStartByte, AEndByte: Int64;
      AGetAsHash: Boolean; out AProperties, AMetadata: TArray<TPair<string, string>>; out ASnapshotStream: TStream;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>Copies the specified blob to the given target location.</summary>
    /// <remarks>If a blob exists at the target location, the content will be replaced.
    ///          If metadata is specified, then the target blob will have that metadata,
    ///          otherwise, it will have the metadata that exists on the source blob.
    /// </remarks>
    /// <param name="TargetContainerName">The container to put the copied blob into</param>
    /// <param name="TargetBlobName">The name of the resulting blob</param>
    /// <param name="SourceContainerName">The container the blob being copied is in</param>
    /// <param name="SourceBlobName">The name of the blob being copied</param>
    /// <param name="TargetLeaseId">The lease Id, required if the target blob exists already and is locked.</param>
    /// <param name="Metadata">The optional metadata to use on the target, instead of the source's</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the copy was successful, false otherwise.</returns>
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName: string;
                      const TargetLeaseId: string = ''; Metadata: TStrings = nil;
                      ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName: string;
                      CopyConditionals: TBlobActionConditional;
                      const TargetLeaseId: string = ''; Metadata: TStrings = nil;
                      ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Copies the specified blob to the given target location.</summary>
    /// <remarks>If a blob exists at the target location, the content will be replaced.
    ///          If metadata is specified, then the target blob will have that metadata,
    ///          otherwise, it will have the metadata that exists on the source blob.
    /// </remarks>
    /// <param name="ATargetContainerName">The container to put the copied blob into</param>
    /// <param name="ATargetBlobName">The name of the resulting blob</param>
    /// <param name="ASourceContainerName">The container the blob being copied is in</param>
    /// <param name="ASourceBlobName">The name of the blob being copied</param>
    /// <param name="ATargetLeaseId">The lease Id, required if the target blob exists already and is locked.</param>
    /// <param name="ACopyConditionals">The conditions to meet in order to do the copy</param>
    /// <param name="AMetadata">The metadata to use on the target, instead of the source's</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the copy was successful, false otherwise.</returns>
    function CopyBlob(const ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
      ATargetLeaseId: string; ACopyConditionals: TBlobActionConditional; AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName: string;
                                const SourceSnapshot: string; Metadata: TStrings = nil;
                                ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName: string;
                                const SourceSnapshot: string;
                                CopyConditionals: TBlobActionConditional;
                                Metadata: TStrings = nil;
                                ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Copies the specified snapshot into the target blob location.</summary>
    /// <remarks>If a blob exists at the target location, the content will be replaced.
    ///          If metadata is specified, then the target blob will have that metadata,
    ///          otherwise, it will have the metadata that exists on the source snapshot.
    /// </remarks>
    /// <param name="ATargetContainerName">The container to put the copied blob into</param>
    /// <param name="ATargetBlobName">The name of the resulting blob</param>
    /// <param name="ASourceContainerName">The container the blob being copied is in</param>
    /// <param name="ASourceBlobName">The name of the blob owning the snapshot being copied</param>
    /// <param name="ASourceSnapshot">The blob's snapshot to copy</param>
    /// <param name="ACopyConditionals">The conditions to meet in order to do the copy</param>
    /// <param name="AMetadata">The metadata to use on the target, instead of the source's</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if the copy was successful, false otherwise.</returns>
    function CopySnapshotToBlob(const ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
      ASourceSnapshot: string; ACopyConditionals: TBlobActionConditional; AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SnapshotBlob(ContainerName, BlobName: string; out SnapshotId: string; const LeaseId: string = '';
                          Metadata: TStrings = nil; ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function SnapshotBlob(ContainerName, BlobName: string;
                          SnapshotConditionals: TBlobActionConditional;
                          out SnapshotId: string;
                          const LeaseId: string = '';
                          Metadata: TStrings = nil;
                          ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Conditionally creates a new snapshot of the specified blob.</summary>
    /// <remarks>The snapshot is only created if the conditions specified in SnapshotConditionals are met.
    ///          Only some of the conditionals of the TBlobActionConditional instance are used.
    ///          For example, none which have field names beginning with 'IfSource' are used here.
    ///          Set Metadata to nil or an empty list unless you want the snapshot's metadata
    ///          to be that, instead of the metadata on the blob having the snapshot taken.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob to create a snapshot for</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked</param>
    /// <param name="ASnapshotConditionals">The conditions to meet in order to create the snapshot</param>
    /// <param name="AMetadata">The metadata to set onto the snapshot, instead of the blob's</param>
    /// <param name="ASnapshotId">The resulting Snapshot Id, if successfully created</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if successful, false otherwise</returns>
    function SnapshotBlob(const AContainerName, ABlobName, ALeaseID: string;
      ASnapshotConditionals: TBlobActionConditional; AMetadata: array of TPair<string, string>;
      out ASnapshotId: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutBlock(ContainerName, BlobName: string; const BlockId: string; Content: TArray<Byte>;
                      const ContentMD5: string = ''; const LeaseId: string = '';
                      ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Creates a new block to be committed as part of a blob.</summary>
    /// <remarks>A block may be up to 4 MB in size.
    ///          BlockId must be a base 64 encoded string, which was less than or equal to 64 bytes
    ///          in size before it was encoded.
    ///          For a given blob, all block IDs must be the same length.
    ///          After you have uploaded a set of blocks, you can create or update the blob
    ///          on the server from this set by calling PutBlockList. Until then, the blob does
    ///          not contain this block as part of its content.
    ///          If you call Put Block on a blob that does not yet exist, a new uncommitted
    ///          block blob is created with a content length of 0.
    ///          If you call Put Block using a BlockId of an existing uncommitted block,
    ///          the content will be replaced.
    ///          If PutBlockList isn't called within a week, all uncommitted blocks will be deleted.
    ///          After calling PutBlockList, any uncommitted blocks not included in the list
    ///          will be deleted.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the blob to upload the block for</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked</param>
    /// <param name="ABlockId">The Id to that uniquely identifies the block</param>
    /// <param name="AContent">The block's content in bytes</param>
    /// <param name="AContentMD5">An optional MD5 hash of the content, for verification purposes.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if successful, false otherwise</returns>
    function PutBlock(const AContainerName, ABlobName, ALeaseId, ABlockId: string; AContent: TArray<Byte>;
      const AContentMD5: string; const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutPage(ContainerName, BlobName: string; Content: TArray<Byte>;
                     StartPage, PageCount: Integer;
                     const LeaseId: string = '';
                     const ContentMD5: string = '';
                     ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutPage(ContainerName, BlobName: string; Content: TArray<Byte>;
                     StartPage, PageCount: Integer; ActionConditional: TBlobActionConditional;
                     const ContentMD5: string = '';
                     const LeaseId: string = '';
                     ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutPage(ContainerName, BlobName: string; Content: TArray<Byte>;
                     StartPage: Integer; ActionConditional: TBlobActionConditional;
                     const LeaseId: string = '';
                     ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function PutPage(ContainerName, BlobName: string; Content: TArray<Byte>; StartPage: Integer;
                     const LeaseId: string = '';
                     ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Writes content to a range with a page blob.</summary>
    /// <remarks>The StartPage is zero-indexed, and maps to the first page in a range of 1 or more pages
    ///          to create or modify the content for.
    ///          The number is pages is calculated dynamically based on the length of the specified content.
    ///          If the content's length isn't evenly divisible by 512, then it is padded with zeros.
    ///          This must only be called on a page blob that already exists.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the page blob.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="AStartPage">The zero-based index of the first page this content applies to.</param>
    /// <param name="AContent">The content to add. Must be evenly divisible by 512. Pad with zeros if needed.</param>
    /// <param name="AContentMD5">The optional MD5 hash of the content being sent, for verifying integrity.</param>
    /// <param name="AActionConditional">Conditions that must be met for the action to be executed.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>True if successful, false otherwise</returns>
    function PutPage(const AContainerName, ABlobName, ALeaseID: string; AStartPage: Integer; AContent: TArray<Byte>;
      const AContentMD5: string; AActionConditional: TBlobActionConditional;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;

    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ClearPage(ContainerName, BlobName: string; StartPage, PageCount: Integer;
                       const LeaseId: string = '';
                       ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function ClearPage(ContainerName, BlobName: string; StartPage, PageCount: Integer;
                       ActionConditional: TBlobActionConditional;
                       const LeaseId: string = '';
                       ResponseInfo: TCloudResponseInfo = nil): Boolean; overload; deprecated 'Use overloaded method instead';
    /// <summary>Clears the specified range and releases the spaced used in storage for that range.</summary>
    /// <remarks>Supported action conditionals include:
    ///            IfModifiedSince,
    ///            IfUnmodifiedSince,
    ///            IfMatch,
    ///            IfNoneMatch,
    ///            if-sequence-number-lte,
    ///            if-sequence-number-lt,
    ///            if-sequence-number-eq.
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the page blob</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked</param>
    /// <param name="AStartPage">The zero-based index of the first page this action applies to</param>
    /// <param name="APageCount">The number of (512 bytes) pages this content spans.</param>
    /// <param name="AActionConditional">Conditions that must be met for the action to be executed.</param>
    /// <param name="AResponseInfo">The class for storing response info into</param>
    /// <returns>True if successful, false otherwise</returns>
    function ClearPage(const AContainerName, ABlobName, ALeaseID: string; AStartPage, APageCount: Integer;
      AActionConditional: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>Specifies the list of blocks to form the blob content from.</summary>
    /// <remarks>The list of blocks is used to build the given blob's content. The blocks
    ///          can either be committed (already part of the blob's content) or uncommitted
    ///          (uploaded with PutBlock, but not yet included in a PutBlockList call.)
    ///          Once this call is made, any block not in the block list is permanently deleted.
    /// </remarks>
    /// <param name="ContainerName">The name of the container the blob is in.</param>
    /// <param name="BlobName">The blob to commit the block list for</param>
    /// <param name="BlockList">The list of blocks to form the blob's content with</param>
    /// <param name="Properties">Optional list of properties to specify on the blob</param>
    /// <param name="Metadata">Optional list of metadata to specify on the blob</param>
    /// <param name="LeaseId">The lease Id, required if the blob is locked</param>
    /// <param name="ContentMD5">The optional MD5 hash of the content being sent, for verifying integrity.</param>
    /// <param name="ResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if successful, false otherwise</returns>
    function PutBlockList(ContainerName, BlobName: string; BlockList: TList<TAzureBlockListItem>;
                          Properties: TStrings = nil; Metadata: TStrings = nil;
                          const LeaseId: string = ''; const ContentMD5: string = '';
                          ResponseInfo: TCloudResponseInfo = nil): Boolean; overload;
    function PutBlockList(const AContainerName, ABlobName, ALeaseId, AContentMD5: string;
      ABlockList: array of TAzureBlockListItem; AProperties, AMetadata: array of TPair<string, string>;
      const AResponseInfo: TCloudResponseInfo): Boolean; overload;
    /// <summary>This fuction is deprecated. Instead, use GetBlockList method.</summary>
    function GetBlockListXML(ContainerName, BlobName: string;
                             BlockType: TAzureQueryIncludeBlockType = aqbtCommitted;
                             const SnapShot: string = ''; const LeaseId: string = '';
                             ResponseInfo: TCloudResponseInfo = nil): string; overload; deprecated 'Use GetBlckList method instead';
    /// <summary>This fuction is deprecated. Instead, use overloaded method.</summary>
    function GetBlockList(ContainerName, BlobName: string;
                          BlockType: TAzureQueryIncludeBlockType = aqbtCommitted;
                          const SnapShot: string = ''; const LeaseId: string = '';
                          ResponseInfo: TCloudResponseInfo = nil): TList<TAzureBlockListItem>; overload; deprecated 'Use overloaded method instead';
    /// <summary>Returns the block list for the given blob.</summary>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the block blob to get the block list for.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="ASnapShot">The snapshot Id if you want the list of a snapshot instead of the blob.</param>
    /// <param name="ABlockType">The type of blocks to get. Either committed, uncommitted, or both.</param>
    /// <param name="AResponseXML">The response in XML format.</param>
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>The list of blocks for the given blob or snapshot.</returns>
    function GetBlockList(const AContainerName, ABlobName, ALeaseId, ASnapshot: string;
      ABlockType: TAzureQueryIncludeBlockType; out AResponseXML: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlockListItem>; overload;

    /// <summary>This fuction is deprecated. Instead, use GetPageRanges method.</summary>
    function GetPageRegionsXML(ContainerName, BlobName: string; StartByte, EndByte: Int64;
                               const Snapshot: string = ''; const LeaseId: string = '';
                               ResponseInfo: TCloudResponseInfo = nil): string; overload; deprecated 'Use GetPageRanges method instead';
    /// <summary>This fuction is deprecated. Instead, use GetPageRanges method.</summary>
    function GetPageRegionsXML(ContainerName, BlobName: string;
                               const Snapshot: string = ''; const LeaseId: string = '';
                               ResponseInfo: TCloudResponseInfo = nil): string; overload; deprecated 'Use GetPageRanges method instead';
    /// <summary>This fuction is deprecated. Instead, use GetPageRange method.</summary>
    function GetPageRegions(ContainerName, BlobName: string; StartByte, EndByte: Int64;
                            const Snapshot: string = ''; const LeaseId: string = '';
                            ResponseInfo: TCloudResponseInfo = nil): TList<TAzureBlobPageRange>; overload; deprecated 'Use GetPageRanges method instead';
    /// <summary>This fuction is deprecated. Instead, use GetPageRange method.</summary>
    function GetPageRegions(ContainerName, BlobName: string;
                            const Snapshot: string = ''; const LeaseId: string = '';
                            ResponseInfo: TCloudResponseInfo = nil): TList<TAzureBlobPageRange>; overload; deprecated 'Use GetPageRanges method instead';
    /// <summary>Returns the page regions for the given page blob.</summary>
    /// <remarks>The whole page blob will be analyzed.
    ///          What is returns is a list of valid page ranges (start byte / end byte pairs).
    /// </remarks>
    /// <param name="AContainerName">The name of the container the blob is in.</param>
    /// <param name="ABlobName">The name of the page blob.</param>
    /// <param name="ALeaseId">The lease Id, required if the blob is locked.</param>
    /// <param name="AStartByte">The start byte in the range to check for valid pages.</param>
    /// <param name="AEndByte">The end byte in the range to check for valid pages.</param>
    /// <param name="ASnapshot">Specifies the blob snapshot to retrieve information from.</param>
    /// <param name="APrevSnapshot">Specifies that the response will contain only pages that were changed between target blob and previous snapshot.</param>
    /// <param name="AResponseXML">The response in XML format.</param>    ///
    /// <param name="AResponseInfo">The class for storing response info into.</param>
    /// <returns>The list of valid page ranges.</returns>
    function GetPageRanges(const AContainerName, ABlobName, ALeaseId: string; AStartByte, AEndByte: Int64;
      const ASnapshot, APrevSnapshot: string; out AResponseXML: string;
      const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlobPageRange>;

    /// <summary>Commits a new block of data to the end of an existing append blob.</summary>
    /// <param name="AContainerName">The name of the container the blob should be created in</param>
    /// <param name="ABlobName">The name of the blob</param>
    /// <param name="AContent">The content to set into the blob</param>
    /// <param name="AContentMD5">
    ///   Optional. An MD5 hash of the block content. This hash is used to verify the integrity of the block during
    ///   transport. When this header is specified, the storage service compares the hash of the content that has
    ///   arrived with this header value.The optional headers</param>
    /// <param name="ALeaseId">Required if the blob has an active lease.</param>
    /// <param name="AClientRequestID">
    ///   Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the
    ///   analytics logs when storage analytics logging is enabled. </param>
    /// <param name="AMaxSize">Optional. The max length in bytes permitted for the append blob.</param>
    /// <param name="AAppendPos">
    ///   Optional. A number indicating the byte offset to compare. Append Block will succeed only if the append
    ///   position is equal to this number.</param>
    /// <param name="AActionConditional">
    ///   Optional. A number indicating the byte offset to compare. Append Block will succeed only if the append
    ///   position is equal to this number.</param>
    /// <param name="AResponseInfo">The optional class for storing response info into</param>
    /// <returns>True if the append was successful, false otherwise.</returns>
    function AppendBlock(const AContainerName, ABlobName: string; AContent: TArray<Byte>; const AContentMD5: string;
      const ALeaseId: string; const AClientRequestID: string; AMaxSize, AAppendPos: Integer;
      const AActionConditional: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): boolean;
  end;

const
  /// <summary>The root container's name for the blob service.</summary>
  ROOT_CONTAINER = '$root';

implementation

uses System.DateUtils, System.StrUtils, System.NetEncoding, Xml.XMLDoc, Data.Cloud.CloudResStrs
{$IFDEF MACOS}
  , Macapi.CoreFoundation
{$ENDIF MACOS}
  ;

const
  NODE_TABLE = 'entry';
  NODE_TABLE_CONTENT = 'content';
  NODE_PROPERTIES = 'm:properties';
  NODE_TABLE_NAME = 'd:TableName';
  NODE_QUEUES = 'Queues';
  NODE_QUEUE = 'Queue';
  NODE_QUEUE_NAME = 'Name';
  NODE_QUEUE_URL = 'Url';

  DT_XML_PREFIX = 'Edm.';
  DT_BINARY = 'Binary';
  DT_BOOLEAN = 'Boolean';
  DT_DATETIME = 'DateTime';
  DT_DOUBLE = 'Double';
  DT_GUID = 'Guid';
  DT_INT32 = 'Int32';
  DT_INT64 = 'Int64';
  DT_STRING = 'String';

function GetRowFromContentNode(ContentNode: IXMLNode): TCloudTableRow;
var
  PropertiesNode, PropertyNode: IXMLNode;
  PropName: string;
  Aux: Integer;
  Column: TCloudTableColumn;
begin
  if (ContentNode = nil) or (ContentNode.NodeName <> NODE_TABLE_CONTENT) then
    Exit(nil);

  Result := nil;

  if (ContentNode.HasChildNodes) then
  begin
    PropertiesNode := GetFirstMatchingChildNode(ContentNode, NODE_PROPERTIES);

    if (PropertiesNode <> nil) and (PropertiesNode.HasChildNodes) then
    begin
      PropertyNode := PropertiesNode.ChildNodes.First;
      Result := TCloudTableRow.Create;

      while PropertyNode <> nil do
      begin
        try
          PropName := PropertyNode.NodeName;
          Aux := AnsiPos(':', PropName);
          if Aux > 0 then
            PropName := PropName.Substring(Aux);

          Column := TCloudTableColumn.Create;
          Column.Name := PropName;
          Column.Value := PropertyNode.Text;

          if PropertyNode.HasAttribute('m:type') then
            Column.DataType := PropertyNode.Attributes['m:type'];

          Result.Columns.Add(Column);
        except
          break;
        end;
        PropertyNode := PropertyNode.NextSibling;
      end;
    end;
  end;
end;

{ TAzureConnectionInfo }

constructor TAzureConnectionInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FUseDevelopmentStorage := false;
  FUseDefaultEndpoints := true;
  FProtocol := 'http';
end;

function TAzureConnectionInfo.GetAccountKey: string;
begin
  if FUseDevelopmentStorage then
    Exit('Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==');

  Exit(FAccountKey);
end;

function TAzureConnectionInfo.GetAccountName: string;
begin
  if FUseDevelopmentStorage then
    Exit('devstoreaccount1');

  Exit(FAccountName);
end;

function TAzureConnectionInfo.GetBlobEndpoint: string;
begin
  if UseDefaultEndpoints and (not UseDevelopmentStorage) then
    Exit(Format('%s.%s.core.windows.net', [AccountName, 'blob']));

  Exit(FBlobEndpoint);
end;

function TAzureConnectionInfo.GetQueueEndpoint: string;
begin
  if UseDefaultEndpoints and (not UseDevelopmentStorage) then
    Exit(Format('%s.%s.core.windows.net', [AccountName, 'queue']));

  Exit(FQueueEndpoint);
end;

function TAzureConnectionInfo.GetTableEndpoint: string;
begin
  if UseDefaultEndpoints and (not UseDevelopmentStorage) then
    Exit(Format('%s.%s.core.windows.net', [AccountName, 'table']));

  Exit(FTableEndpoint);
end;

function TAzureConnectionInfo.BlobURL: string;
begin
  Result := ServiceURL('blob', BlobEndpoint, False);
end;

function TAzureConnectionInfo.BlobSecondaryURL: string;
begin
  Result := ServiceURL('blob', BlobEndpoint, True);
end;

function TAzureConnectionInfo.TableURL: string;
begin
  Result := ServiceURL('table', TableEndpoint, False);
end;

function TAzureConnectionInfo.TableSecondaryURL: string;
begin
  Result := ServiceURL('table', TableEndpoint, True);
end;

function TAzureConnectionInfo.QueueURL: string;
begin
  Result := ServiceURL('queue', QueueEndpoint, False);
end;

function TAzureConnectionInfo.QueueSecondaryURL: string;
begin
  Result := ServiceURL('queue', QueueEndpoint, True);
end;

function TAzureConnectionInfo.ServiceURL(const ServiceType, ServiceEndpoint: string; AGetSecondary: Boolean): string;
var
  url: string;
  LAccountName: string;
  PortNo: Integer;
begin
  if UseDevelopmentStorage then
  begin
    if SameText(ServiceType, 'blob') then 
      PortNo := 10000
    else if SameText(ServiceType, 'queue') then 
      PortNo := 10001
    else if SameText(ServiceType, 'table') then 
      PortNo := 10002
    else
      PortNo := 10000;
    url := Format('127.0.0.1:%d/devstoreaccount1', [PortNo]);
  end
  else if UseDefaultEndpoints then
  begin
    LAccountName := AccountName;
    if AGetSecondary then
      LAccountName := LAccountName + '-secondary';
    url := Format('%s.%s.core.windows.net', [LAccountName, ServiceType]);
  end
  else
    url := ServiceEndpoint;
  Result := Format('%s://%s', [Protocol, url]);
end;

procedure TAzureConnectionInfo.SetUseDevelopmentStorage(use: Boolean);
begin
  FUseDevelopmentStorage := use;
end;


{ TAzureAuthentication }

procedure TAzureAuthentication.AssignKey(const AccountKey: string);
begin
  FSHAKey := TNetEncoding.Base64.DecodeStringToBytes(AccountKey);
end;

constructor TAzureAuthentication.Create(ConnectionInfo: TAzureConnectionInfo);
begin
  inherited Create(ConnectionInfo, 'SharedKey'); {do not localize}
end;

{ TAzureService }

constructor TAzureService.Create(ConnectionInfo: TAzureConnectionInfo);
begin
  inherited Create(ConnectionInfo, TAzureAuthentication.Create(ConnectionInfo));

  FRequiredHeaderNames := nil;
  FTimeout := 30;

  //characters to use when building the query parameter part of the
  //CanonicalizedResource part of the 'stringToSign'
  FQueryStartChar := #10;
  FQueryParamKeyValueSeparator := ':';
  FQueryParamSeparator := #10;
end;

destructor TAzureService.Destroy;
begin
  FreeAndNil(FRequiredHeaderNames);
  inherited;
end;

function TAzureService.GetCanonicalizedHeaderPrefix: string;
begin
  Result := 'x-ms-'; {do not localize}
end;

function TAzureService.GetConnectionInfo: TAzureConnectionInfo;
begin
  Result := TAzureConnectionInfo(FConnectionInfo);
end;

function TAzureService.GetRequiredHeaderNames(out InstanceOwner: Boolean): TStrings;
begin
  InstanceOwner := False;
  //Required headers shared by Queue and Blob service. These go into the 'String To Sign' as just values
  if FRequiredHeaderNames = nil then
  begin
    //http://msdn.microsoft.com/en-us/library/dd179428.aspx
    FRequiredHeaderNames := TStringList.Create;
    FRequiredHeaderNames.Add('content-encoding');
    FRequiredHeaderNames.Add('content-language');
    FRequiredHeaderNames.Add('content-length');
    FRequiredHeaderNames.Add('content-md5');
    FRequiredHeaderNames.Add('content-type');
    FRequiredHeaderNames.Add('date');
    FRequiredHeaderNames.Add('if-modified-since');
    FRequiredHeaderNames.Add('if-match');
    FRequiredHeaderNames.Add('if-none-match');
    FRequiredHeaderNames.Add('if-unmodified-since');
    FRequiredHeaderNames.Add('range');
  end;
  Result := FRequiredHeaderNames;
end;

procedure TAzureService.PopulateDateHeader(Headers: TStrings; AddRegularDateHeader: Boolean);
var
  msDate: string;
begin
  if Headers <> nil then
  begin
    msDate := XMsDate;
    if AddRegularDateHeader then
      Headers.Values['date'] := msDate;
    Headers.Values['x-ms-date'] := msDate;
  end;
end;

procedure TAzureService.SetTimeout(const AValue: Integer);
begin
  FTimeout := AValue;
end;

procedure TAzureService.URLEncodeQueryParams(const ForURL: Boolean; var ParamName, ParamValue: string);
begin
  if ForURL then
  begin
    ParamName := TNetEncoding.URL.Encode(ParamName);
    ParamValue := TNetEncoding.URL.Encode(ParamValue);
  end;
end;

function TAzureService.XMsDate: string;
begin
  Result := FormatDateTime('ddd, dd mmm yyyy hh:nn:ss "GMT"',
                           TTimeZone.Local.ToUniversalTime(Now),
                           TFormatSettings.Create('en-US'));
end;

{ TAzureTableService }

procedure TAzureTableService.AddTableVersionHeaders(Headers: TStrings);
begin
  if Headers <> nil then
  begin
    Headers.Values['x-ms-version'] := '2015-02-21';
    Headers.Values['DataServiceVersion'] := '3.0;NetFx';
    Headers.Values['MaxDataServiceVersion'] := '3.0;NetFx';
  end;
end;

constructor TAzureTableService.Create(ConnectionInfo: TAzureConnectionInfo);
begin
  inherited Create(ConnectionInfo);

  FUseCanonicalizedHeaders := False;
end;

function TAzureTableService.GetInsertEntityXML(Entity: TCloudTableRow): string;
var
  I, Count: Integer;
  Col: TCloudTableColumn;
begin
  Result :=
        string.Format('<?xml version="1.0" encoding="utf-8" standalone="yes"?>' +
                  '<entry xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" ' +
                         'xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" ' +
                         'xmlns="http://www.w3.org/2005/Atom">' +
                    '<title />' +
                    '<updated>%s</updated>' +
                    '<author><name /></author>' +
                    '<id />' +
                    '<content type="application/xml">' +
                        '<m:properties>',
                  [TNetEncoding.HTML.Encode(UpdatedDate)]);

  Count := Entity.Columns.Count;
  for I := 0 to Count - 1 do
  begin
    Col := Entity.Columns[I];
    if (Col.DataType.Length > 0) then
      Result := Result + string.Format('<d:%s m:type="%s">%s</d:%s>',
                                [Col.Name, Col.DataType, TNetEncoding.HTML.Encode(Col.Value), Col.Name])
    else
      Result := Result + string.Format('<d:%s>%s</d:%s>', [Col.Name, TNetEncoding.HTML.Encode(Col.Value), Col.Name]);
  end;

  Result := Result + '</m:properties></content></entry>';
end;

function TAzureTableService.GetRequiredHeaderNames(out InstanceOwner: Boolean): TStrings;
begin
  InstanceOwner := False;
  if FRequiredHeaderNames = nil then
  begin
    //http://msdn.microsoft.com/en-us/library/dd179428.aspx
    FRequiredHeaderNames := TStringList.Create;
    FRequiredHeaderNames.Add('content-md5');
    FRequiredHeaderNames.Add('content-type');
    FRequiredHeaderNames.Add('date');
  end;
  Result := FRequiredHeaderNames;
end;

procedure TAzureTableService.GetTableServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
begin
  AProperties.LoadFromXML(GetTableServicePropertiesXML(AResponseInfo))
end;

function TAzureTableService.GetTableServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): String;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders);
    AddTableVersionHeaders(LHeaders);

    LUrl := GetConnectionInfo.TableURL + '/?restype=service&comp=properties&timeout=' + FTimeout.ToString;
    LQueryPrefix := '/' + GetConnectionInfo.AccountName + '/?comp=properties';
    LResponse := IssueGetRequest(LUrl, LHeaders, nil, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LResponse.Free;
  end;
end;

function TAzureTableService.GetTableACL(const ATableName: string; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TSignedIdentifier>;
var
  LXml: string;
  LXmlDoc: IXMLDocument;
  LRootNode, LSidNode, LChildNode, LSubChildNode: IXMLNode;
  LSignedIdentifier: TSignedIdentifier;
  LPolicy: TTablePolicy;
begin
  LXml := GetTableACLXML(ATableName, AClientRequestID, AResponseInfo);

  if LXml <> '' then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(LXml);
    LRootNode := LXmlDoc.DocumentElement;

    if not LRootNode.HasChildNodes then
      Exit(nil);

    LSidNode := LRootNode.ChildNodes.First;
    (*
       The XML looks like this:
       <SignedIdentifiers>
         <SignedIdentifier>
           <Id>unique-value</Id>
           <AccessPolicy>
             <Start>start-time</Start>
             <Expiry>expiry-time</Expiry>
             <Permission>abbreviated-permission-list</Permission>
           </AccessPolicy>
         </SignedIdentifier>
       </SignedIdentifiers>
    *)
    while LSidNode <> nil do
    begin
      if AnsiSameText(LSidNode.NodeName, 'SignedIdentifier') then
      begin
        LChildNode := GetFirstMatchingChildNode(LSidNode, 'Id');
        if LChildNode <> nil then
        begin
          LPolicy := TTablePolicy.Create;
          try
            LSignedIdentifier := TSignedIdentifier.Create(ATableName, LPolicy, LChildNode.Text);
            Result := Result + [LSignedIdentifier];

            LChildNode := GetFirstMatchingChildNode(LSidNode, 'AccessPolicy');
            if (LChildNode <> nil) and (LChildNode.HasChildNodes) then
            begin
              LSubChildNode := LChildNode.ChildNodes.First;
              while LSubChildNode <> nil do
              begin
                case IndexText(LSubChildNode.NodeName, ['Start', 'Expiry', 'Permission']) of
                  0: LSignedIdentifier.Policy.StartDate := LSubChildNode.Text;
                  1: LSignedIdentifier.Policy.ExpiryDate := LSubChildNode.Text;
                  2: LSignedIdentifier.Policy.Permission := LSubChildNode.Text;
                end;

                LSubChildNode := LSubChildNode.NextSibling;
              end;
            end;
          finally
            LPolicy.Free;
          end;
        end;
      end;

      LSidNode := LSidNode.NextSibling;
    end;
  end;
end;

function TAzureTableService.GetTableACLXML(const ATableName: string; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LUrl := GetConnectionInfo.TableURL + '/' + ATableName + '?comp=acl&timeout=' + FTimeout.ToString;
  LResponse := nil;

  LHeaders := TStringList.Create;
  try
    PopulateDateHeader(LHeaders);
    LHeaders.Values['x-ms-client-request-id'] := AClientRequestID;
    LQueryPrefix := GetTablesQueryPrefix(LHeaders, ATableName);
    LQueryPrefix := LQueryPrefix + '?comp=acl';

    LResponse := IssueGetRequest(LUrl, LHeaders, nil, LQueryPrefix, AResponseInfo, Result);
  finally
    LResponse.Free;
    LHeaders.Free;
  end;
end;

function TAzureTableService.GetTablesQueryPrefix(Headers: TStrings; TableName: string): string;
begin
  if GetConnectionInfo.UseDevelopmentStorage then
    Result := Format('/%s/%s/%s', [GetConnectionInfo.AccountName, GetConnectionInfo.AccountName, TableName])
  else
  begin
    AddTableVersionHeaders(Headers);
    Result := Format('/%s/%s', [GetConnectionInfo.AccountName, TableName]);
  end;
end;

function TAzureTableService.InsertEntity(const TableName: string; Entity: TCloudTableRow;
                                         ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  InputStream : TBytesStream;
  FreeResponseInfo: Boolean;
  xml: string;
begin
  url := Format('%s/%s', [GetConnectionInfo.TableURL, TableName]);

  if (Entity = nil) or (URL = EmptyStr) then
    Exit(False);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);
  Headers.Values['Content-Type'] := 'application/atom+xml';

  QueryPrefix := GetTablesQueryPrefix(Headers, TableName);

  xml := GetInsertEntityXML(Entity);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  Response := nil;
  InputStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(xml));
  try
    try
      Response := IssuePostRequest(url, Headers, nil, QueryPrefix, ResponseInfo, InputStream);
      Result := ResponseInfo.StatusCode = 201;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    InputStream.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

function TAzureTableService.MergeEntity(const TableName: string; Entity: TCloudTableRow;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  InputStream : TBytesStream;
  FreeResponseInfo: Boolean;
  xml: string;
begin
  if not ModifyEntityHelper(TableName, Entity, url, QueryPrefix, Headers) then
    Exit(False);

  xml := GetInsertEntityXML(Entity);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  Response := nil;
  InputStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(xml));
  try
    try
      Response := IssueMergeRequest(url, Headers, nil, QueryPrefix, ResponseInfo, InputStream);
      Result := ResponseInfo.StatusCode = 204;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    InputStream.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

function TAzureTableService.ModifyEntityHelper(const TableName: string; const Entity: TCloudTableRow;
                                               out url, QueryPrefix: string;
                                               out Headers: TStringList): Boolean;
var
  partitionKey, rowKey: string;
begin
  Headers := nil;
  if Entity = nil then
    Exit(False);

  if not (Entity.GetColumnValue('PartitionKey', partitionKey) and
          Entity.GetColumnValue('RowKey', rowKey)) then
    Exit(False);

  Result := True;

  url := Format('%s/%s(PartitionKey=''%s'',RowKey=''%s'')',
                [GetConnectionInfo.TableURL, TableName, partitionKey, rowKey]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);
  Headers.Values['Content-Type'] := 'application/atom+xml';
  Headers.Values['If-Match'] := '*';

  QueryPrefix := GetTablesQueryPrefix(Headers, TableName);
  QueryPrefix := Format('%s(PartitionKey=''%s'',RowKey=''%s'')', [QueryPrefix, partitionKey, rowKey]);
end;

function TAzureTableService.UpdateEntity(const TableName: string; Entity: TCloudTableRow;
                                         ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  InputStream : TBytesStream;
  FreeResponseInfo: Boolean;
  xml: string;
begin
  if not ModifyEntityHelper(TableName, Entity, url, QueryPrefix, Headers) then
    Exit(False);

  xml := GetInsertEntityXML(Entity);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  Response := nil;
  InputStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(xml));
  try
    try
      Response := IssuePutRequest(url, Headers, nil, QueryPrefix, ResponseInfo, InputStream);
      Result := ResponseInfo.StatusCode = 204;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    InputStream.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

function TAzureTableService.DeleteEntity(const TableName: string; const Entity: TCloudTableRow;
                                         ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
begin
  if not ModifyEntityHelper(TableName, Entity, url, QueryPrefix, Headers) then
    Exit(False);

  Response := nil;
  try
    try
      Response := IssueDeleteRequest(url, Headers, nil, QueryPrefix, ResponseInfo);
      Result := (Response <> nil) and (Response.ResponseCode = 204);
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
  end;
end;

function TAzureTableService.CreateTable(const TableName: string;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  InputStream : TBytesStream;
  xml: string;
  FreeResponseInfo: Boolean;
begin
  url := Format('%s/%s?timeout=%s', [GetConnectionInfo.TableURL, 'Tables', FTimeout.ToString]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);

  Headers.Values['Content-Type'] := 'application/atom+xml';

  QueryPrefix := GetTablesQueryPrefix(Headers);

  xml := Format('<?xml version="1.0" encoding="utf-8" standalone="yes"?>' +
                  '<entry xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" ' +
                         'xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" ' +
                         'xmlns="http://www.w3.org/2005/Atom">' +
                    '<title />' +
                    '<updated>%s</updated>' +
                    '<author>' +
                      '<name />' +
                    '</author>' +
                    '<content type="application/xml">' +
                        '<m:properties>' +
                          '<d:TableName>%s</d:TableName>' +
                        '</m:properties>' +
                    '</content>' +
                  '</entry>',
                  [TNetEncoding.HTML.Encode(UpdatedDate), TNetEncoding.HTML.Encode(TableName)]);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  InputStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(xml));

  Response := nil;
  try
    try
      Response := IssuePostRequest(url, Headers, nil, QueryPrefix, ResponseInfo, InputStream);
      Result := ResponseInfo.StatusCode = 201;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    InputStream.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

function TAzureTableService.DeleteTable(const TableName: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  FreeResponseInfo: Boolean;
begin
  url := Format('%s/Tables(''%s'')', [GetConnectionInfo.TableURL, TableName]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);

  QueryPrefix := GetTablesQueryPrefix(Headers);
  QueryPrefix := Format('%s(''%s'')', [QueryPrefix, TableName]);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  Response := nil;
  try
    try
      Response := IssueDeleteRequest(url, Headers, nil, QueryPrefix, ResponseInfo);
      Result := ResponseInfo.StatusCode = 204;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

procedure TAzureTableService.PreflightTableRequest(const ATableName, AOrigin, AAccessControlRequestMethod,
  AAccessControlRequestHeaders: string; const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  LHeaders := nil;
  LResponse := nil;

  LResponseInfo := TCloudResponseInfo.Create;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders);
    AddTableVersionHeaders(LHeaders);
    LHeaders.Values['Origin'] := AOrigin;
    LHeaders.Values['Access-Control-Request-Method'] := AAccessControlRequestMethod;
    LHeaders.Values['Access-Control-Request-Headers'] := AAccessControlRequestHeaders;

    LQueryPrefix := GetTablesQueryPrefix(LHeaders, ATableName);
    LUrl := BuildQueryParameterString(GetConnectionInfo.TableURL + '/' + ATableName, nil, False, True);

    LResponse := IssueOptionsRequest(LUrl, LHeaders, nil, LQueryPrefix, LResponseInfo);
    if LResponseInfo.StatusCode = 200 then
    begin
      ARule.AddAllowedOrigin(LResponseInfo.Headers.Values['Access-Control-Allow-Origin']);
      ARule.AddAllowedMethod(LResponseInfo.Headers.Values['Access-Control-Allow-Methods']);
      ARule.AddAllowedHeader(LResponseInfo.Headers.Values['Access-Control-Allow-Headers']);
      ARule.MaxAgeInSeconds := LResponseInfo.Headers.Values['Access-Control-Max-Age'].ToInteger;
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LHeaders.Free;
    LResponse.Free;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);

    LResponseInfo.Free;
  end;
end;

function TAzureTableService.QueryTablesXML(const ContinuationToken: string; ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
begin
  url := Format('%s/%s', [GetConnectionInfo.TableURL, 'Tables']);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);

  if ContinuationToken <> EmptyStr then
    url := url + Format('?NextTableName=%s&timeout=%s', [URLEncode(ContinuationToken), FTimeout.ToString])
  else
    url := url + '?timeout=' + FTimeout.ToString;

  QueryPrefix := GetTablesQueryPrefix(Headers);

  Response := nil;
  try
    Response := IssueGetRequest(url, Headers, nil, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    Headers.Free;
  end;
end;

function TAzureTableService.SetTableServiceProperties(const AProperties: TStorageServiceProperties;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LResponse: TCloudHTTP;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponseInfo: TCloudResponseInfo;
  LContent: TBytesStream;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  LContent := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LContent := TBytesStream.Create(TEncoding.UTF8.GetBytes(AProperties.XML));

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders);
    AddTableVersionHeaders(LHeaders);
    if LContent.Size > 0 then
    begin
      LHeaders.Values['Content-Length'] := IntToStr(LContent.Size);
      LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
    end;

    LQueryPrefix := '/' + GetConnectionInfo.AccountName + '/?comp=properties';
    LUrl := GetConnectionInfo.TableURL + '/?restype=service&comp=properties&timeout=' + FTimeout.ToString;

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo, LContent);
    Result := LResponseInfo.StatusCode = 202;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LContent.Free;
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureTableService.GetTableServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders);
    AddTableVersionHeaders(LHeaders);

    LQueryPrefix := '/' + GetConnectionInfo.AccountName + '/?comp=stats';
    LUrl := GetConnectionInfo.TableSecondaryURL + '/?restype=service&comp=stats&timeout=' + FTimeout.ToString;

    LResponse := IssueGetRequest(LUrl, LHeaders, nil, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LResponse.Free;
  end;
end;

procedure TAzureTableService.GetTableServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);
begin
  AStats.LoadFromXML(GetTableServiceStatsXML(AResponseInfo));
end;

function TAzureTableService.SetTableACL(const ATableName, ASignedIdentifierId: string; const AAccessPolicy: TPolicy;
  const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LSignedIdentifier: TSignedIdentifier;
begin
  LSignedIdentifier := nil;
  try
    //create a signed identifier list with the single signed identifier,
    //then call the function that takes a list.
    LSignedIdentifier := TSignedIdentifier.Create(ATableName, AAccessPolicy, ASignedIdentifierId);
    Result := SetTableACL(ATableName, [LSignedIdentifier], AClientRequestID, AResponseInfo);
  finally
    LSignedIdentifier.Free;
  end;
end;

function TAzureTableService.SetTableACL(const ATableName: string;  ASignedIdentifiers: TArray<TSignedIdentifier>;
  const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LContentString: string;
  I, LCount: Integer;
  LContentStream: TBytesStream;
begin
  if ASignedIdentifiers = nil then
    Exit(False);

  LUrl := GetConnectionInfo.TableURL + '/' + ATableName + '?comp=acl&timeout=' + FTimeout.ToString;

  LResponse := nil;
  LHeaders := nil;
  LContentStream := nil;

  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders);
    LHeaders.Values['x-ms-client-request-id'] := AClientRequestID;

    //Create the XML representation of the ASignedIdentifiers list, to 'PUT' to the server
    LContentString := '<?xml version="1.0" encoding="utf-8"?><SignedIdentifiers>';
    LCount := Length(ASignedIdentifiers);
    for I := 0 to LCount - 1 do
      LContentString := LContentString + ASignedIdentifiers[I].AsXML;
    LContentString := LContentString + '</SignedIdentifiers>';

    LContentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(LContentString));
    LQueryPrefix := GetTablesQueryPrefix(LHeaders, ATableName) + '?comp=acl';

    LResponse := IssuePutRequest(LUrl, LHeaders, nil, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 204);
  finally
    LResponse.Free;
    LContentStream.Free;
    LHeaders.Free;
  end;
end;

function TAzureTableService.UpdatedDate: string;
begin
  Result := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"Z"', TTimeZone.Local.ToUniversalTime(Now));
end;

function TAzureTableService.QueryTables(const ContinuationToken: string; ResponseInfo: TCloudResponseInfo): TStrings;
var
  xml: string;
  xmlDoc: IXMLDocument;
  TableNode: IXMLNode;
  ContentNode: IXMLNode;
  PropertiesNode: IXMLNode;
  TableNameNode: IXMLNode;
begin
  xml := QueryTablesXML(ContinuationToken, ResponseInfo);

  Result := TStringList.Create;

  if xml <> EmptyStr then
  begin
    xmlDoc := TXMLDocument.Create(nil);

    try
      xmlDoc.LoadFromXML(xml);
    except
      Exit(Result);
    end;

    TableNode := xmlDoc.DocumentElement.ChildNodes.FindNode(NODE_TABLE);

    while (TableNode <> nil) and (TableNode.HasChildNodes) do
    begin
      if (TableNode.NodeName = NODE_TABLE) then
      begin
        ContentNode := TableNode.ChildNodes.FindNode(NODE_TABLE_CONTENT);

        if (ContentNode <> nil) and (ContentNode.HasChildNodes) then
        begin
          PropertiesNode := GetFirstMatchingChildNode(ContentNode, NODE_PROPERTIES);

          if (PropertiesNode <> nil) and (PropertiesNode.HasChildNodes) then
          begin
            TableNameNode := GetFirstMatchingChildNode(PropertiesNode, NODE_TABLE_NAME);
            Result.Add(TableNameNode.Text);
          end;
        end;
      end;
      TableNode := TableNode.NextSibling;
    end;
  end;
end;

function TAzureTableService.QueryEntityXML(const TableName, PartitionKey, RowKey: string;
                                             ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
begin
  url := Format('%s/%s(PartitionKey=''%s'',RowKey=''%s'')',
                [GetConnectionInfo.TableURL, TableName, PartitionKey, RowKey]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);

  if GetConnectionInfo.UseDevelopmentStorage then
    QueryPrefix := Format('/%s/%s/%s(PartitionKey=''%s'',RowKey=''%s'')',
          [GetConnectionInfo.AccountName, GetConnectionInfo.AccountName,  TableName, PartitionKey, RowKey])
  else
  begin
    AddTableVersionHeaders(Headers);
    QueryPrefix := Format('/%s/%s(PartitionKey=''%s'',RowKey=''%s'')',
                          [GetConnectionInfo.AccountName, TableName, PartitionKey, RowKey]);
  end;

  Response := nil;
  try
    Response := IssueGetRequest(url, Headers, nil, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    Headers.Free;
  end;
end;

function TAzureTableService.QueryEntitiesXML(const TableName, FilterExpression: string;
                                             ResponseInfo: TCloudResponseInfo;
                                             const NextPartitionKey, NextRowKey: string): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  QueryParams: TStringList;
  Response: TCloudHTTP;
begin
  url := Format('%s/%s()', [GetConnectionInfo.TableURL, TableName]);

  QueryParams := nil;
  if (NextPartitionKey <> EmptyStr) or (NextRowKey <> EmptyStr) then
  begin
    QueryParams := TStringList.Create;
    QueryParams.Values['NextPartitionKey'] := NextPartitionKey;
    QueryParams.Values['NextRowKey'] := NextRowKey;
  end;

  if FilterExpression <> EmptyStr then
  begin
    if QueryParams = nil then
      QueryParams := TStringList.Create;
    QueryParams.Values['$filter'] :=  FilterExpression;
  end;

  url := BuildQueryParameterString(url, QueryParams, False, True);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers);

  QueryPrefix := GetTablesQueryPrefix(Headers, TableName) + '()';

  Response := nil;
  try
    Response := IssueGetRequest(url, Headers, nil, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    Headers.Free;
    QueryParams.Free;
  end;
end;

function TAzureTableService.BuildRowList(const XML: string; const FromQuery: Boolean): TList<TCloudTableRow>;
var
  xmlDoc: IXMLDocument;
  TableNode: IXMLNode;
  ContentNode: IXMLNode;
  Row: TCloudTableRow;
begin
  Result := TList<TCloudTableRow>.Create;

  if XML = EmptyStr then
    Exit;

  xmlDoc := TXMLDocument.Create(nil);
  xmlDoc.LoadFromXML(XML);

   //If it isn't from a query, then they specified PartitionKey and RowKey, so the root node represents the result
   //instead of having multiple child 'entry' nodes.
  if FromQuery then
    TableNode := xmlDoc.DocumentElement.ChildNodes.FindNode(NODE_TABLE)
  else if AnsiCompareText(xmlDoc.DocumentElement.NodeName, NODE_TABLE) = 0 then
    TableNode := xmlDoc.DocumentElement;

  while (TableNode <> nil) and (TableNode.HasChildNodes) do
  begin
    if (TableNode.NodeName = NODE_TABLE) then
    begin
      ContentNode := TableNode.ChildNodes.FindNode(NODE_TABLE_CONTENT);

      Row := GetRowFromContentNode(ContentNode);
      if Row <> nil then
        Result.Add(Row);
    end;

    //If it isn't from a query, then they specified PartitionKey and RowKey, so there is only one result
    if FromQuery then
      TableNode := TableNode.NextSibling
    else
      Break;
  end;
end;

function TAzureTableService.QueryEntity(const TableName, PartitionKey, RowKey: string;
                                          ResponseInfo: TCloudResponseInfo): TCloudTableRow;
var
  LResultList: TList<TCloudTableRow>;
  I, Count: Integer;
begin
  LResultList := BuildRowList(QueryEntityXML(TableName, PartitionKey, RowKey, ResponseInfo), False);

  try
    Count := LResultList.Count;
    if (LResultList = nil) or (Count = 0) then
      Exit(nil);

    //set the first row as the result.
    Result := LResultList[0];

    //there should never be a case where more than one row was returned, but
    //handle that possibility anyway, by freeing any other rows returned.
    if Count > 1 then
      for I := 1 to Count - 1 do
        LResultList[I].Free;
  finally
    LResultList.Free;
  end;
end;

function TAzureTableService.QueryEntities(const TableName, FilterExpression: string;
                                          ResponseInfo: TCloudResponseInfo;
                                          const NextPartitionKey, NextRowKey: string): TList<TCloudTableRow>;
begin
  Result := BuildRowList(QueryEntitiesXML(TableName, FilterExpression, ResponseInfo,
                                         NextPartitionKey, NextRowKey), True);
end;

{ TAzureQueueService }

function TAzureQueueService.ListQueuesXML(OptionalParams: TStrings;
                                          ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  QueryParams: TStringList;
begin
  Headers := nil;
  QueryParams := nil;
  Response := nil;
  try
    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);

    QueryPrefix := GetQueuesQueryPrefix(Headers, '');
    QueryParams := TStringList.Create;
    QueryParams.Values['comp'] := 'list';
    QueryParams.Values['timeout'] := FTimeout.ToString;
    if OptionalParams <> nil then
      QueryParams.AddStrings(OptionalParams);

    url := BuildQueryParameterString(GetConnectionInfo.QueueURL+'/', QueryParams, False, True);

    Response := IssueGetRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureQueueService.GetQueuesQueryPrefix(Headers: TStrings; QueueName: string): string;
begin
  Headers.Values['x-ms-version'] := '2015-02-21';
  if GetConnectionInfo.UseDevelopmentStorage then
    Result := Format('/%s/%s/%s', [GetConnectionInfo.AccountName, GetConnectionInfo.AccountName, QueueName])
  else
    Result := Format('/%s/%s', [GetConnectionInfo.AccountName, QueueName]);
end;

function TAzureQueueService.ListQueues(OptionalParams: TStrings;
                                       ResponseInfo: TCloudResponseInfo): TList<TCloudQueue>;
var
  xml: string;
  xmlDoc: IXMLDocument;
  QueuesXMLNode: IXMLNode;
  QueueNode: IXMLNode;
  NameNode: IXMLNode;
  URL: String;
begin
  xml := ListQueuesXML(OptionalParams, ResponseInfo);

  if XML = EmptyStr then
    Exit(nil);

  Result := TList<TCloudQueue>.Create;

  xmlDoc := TXMLDocument.Create(nil);
  xmlDoc.LoadFromXML(XML);

  QueuesXMLNode := xmlDoc.DocumentElement.ChildNodes.FindNode(NODE_QUEUES);

  if (QueuesXMLNode <> nil) and (QueuesXMLNode.HasChildNodes) then
  begin
    QueueNode := QueuesXMLNode.ChildNodes.FindNode(NODE_QUEUE);

    while (QueueNode <> nil) do
    begin
      if QueueNode.NodeName = NODE_QUEUE then
      begin
        NameNode := QueueNode.ChildNodes.FindNode(NODE_QUEUE_NAME);
        URL := Format('%s/%s', [GetConnectionInfo.QueueURL, NameNode.Text]);
        if (NameNode <> nil) then
          Result.Add(TCloudQueue.Create(NameNode.Text, URL));
      end;
      QueueNode := QueueNode.NextSibling;
    end;
  end;
end;

function TAzureQueueService.CreateQueue(const QueueName: string; const MetaDataHeaders: TStrings;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  LQueryParams: TStringList;
  Response: TCloudHTTP;
  FreeResponseInfo: Boolean;
begin
  url := Format('%s/%s', [GetConnectionInfo.QueueURL, QueueName]);
  Headers := TStringList.Create;

  if MetaDataHeaders <> nil then
    Headers.AddStrings(MetaDataHeaders);

  PopulateDateHeader(Headers, False);

  QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName);

  FreeResponseInfo := ResponseInfo = nil;
  if FreeResponseInfo then
    ResponseInfo := TCloudResponseInfo.Create;

  Response := nil;
  LQueryParams := TStringList.Create;
  try
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    url := BuildQueryParameterString(url, LQueryParams, False, True);
    try
      Response := IssuePutRequest(url, Headers, LQueryParams, QueryPrefix, ResponseInfo);
      Result := ResponseInfo.StatusCode = 201;
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
    LQueryParams.Free;
  end;
end;

function TAzureQueueService.DeleteQueue(const QueueName: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  LQueryParams: TStringList;
  Response: TCloudHTTP;
begin
  Headers := nil;
  Response := nil;
  LQueryParams := nil;
  try
    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);

    QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    url := Format('%s/%s', [GetConnectionInfo.QueueURL, QueueName]);
    url := BuildQueryParameterString(url, LQueryParams, False, True);
    try
      Response := IssueDeleteRequest(url, Headers, LQueryParams, QueryPrefix, ResponseInfo);
      Result := (Response <> nil) and (Response.ResponseCode = 204);
    except
      Result := false;
    end;
  finally
    Response.Free;
    Headers.Free;
    LQueryParams.Free;
  end;
end;

function TAzureQueueService.GetMaxMessageReturnCount: Integer;
begin
  Result := 32;
end;

function TAzureQueueService.GetQueueServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'properties';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, '');
    LUrl := BuildQueryParameterString(GetConnectionInfo.QueueURL + '/', LQueryParams, False, True);

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
  end;
end;

procedure TAzureQueueService.GetQueueServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
begin
  AProperties.LoadFromXML(GetQueueServicePropertiesXML(AResponseInfo))
end;

function TAzureQueueService.SetQueueServiceProperties(const AProperties: TStorageServiceProperties;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LContent: TBytesStream;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  LContent := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LContent := TBytesStream.Create(TEncoding.UTF8.GetBytes('<?xml version="1.0" encoding="utf-8"?>' + AProperties.XML));

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if LContent.Size > 0 then
    begin
      LHeaders.Values['Content-Length'] := IntToStr(LContent.Size);
      LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
    end;

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'properties';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, '');
    LUrl := BuildQueryParameterString(GetConnectionInfo.QueueURL + '/', LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo, LContent);
    Result := LResponseInfo.StatusCode = 202;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LContent.Free;
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureQueueService.GetQueueServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'stats';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, '');
    LUrl := BuildQueryParameterString(GetConnectionInfo.QueueSecondaryURL + '/', LQueryParams, False, True);

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
  end;
end;

procedure TAzureQueueService.GetQueueServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);
begin
  AStats.LoadFromXML(GetQueueServiceStatsXML(AResponseInfo));
end;

function TAzureQueueService.GetQueueMetadata(const QueueName: string; out MetaData: TStrings;
                                             ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  FreeResponseInfo: Boolean;
  QueryParams: TStringList;
  I, Count: Integer;
begin
  QueryParams := nil;
  MetaData := nil;
  Headers := nil;
  Response := nil;
  ResponseInfo := nil;
  FreeResponseInfo := ResponseInfo = nil;
  try
    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);

    QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName);
    QueryParams := TStringList.Create;
    QueryParams.Values['comp'] := 'metadata';
    QueryParams.Values['timeout'] := FTimeout.ToString;

    url := Format('%s/%s', [GetConnectionInfo.QueueURL, QueueName]);
    url := BuildQueryParameterString(url, QueryParams, False, True);

    if FreeResponseInfo then
      ResponseInfo := TCloudResponseInfo.Create;

    try
      Response := IssueGetRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo);
      Result := ResponseInfo.StatusCode = 200;
      if Result then
      begin
        MetaData := TStringList.Create;
        Count := ResponseInfo.Headers.Count;
        for I := 0 to Count - 1 do
        begin
          if AnsiContainsText(ResponseInfo.Headers.Names[I], 'x-ms-')then
          begin
            MetaData.Add(ResponseInfo.Headers[I]);
          end;
        end;
      end;
    except
      Result := false;
    end;
  finally
    Response.Free;
    QueryParams.Free;
    Headers.Free;
    if FreeResponseInfo then
      ResponseInfo.Free;
  end;
end;

function TAzureQueueService.SetQueueMetadata(const QueueName: string; const MetaData: TStrings;
                                             ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  QueryParams: TStringList;
  I, Count: Integer;
  MetaName: string;
begin
  QueryParams := nil;
  Response := nil;
  Headers := nil;
  try
    Headers := TStringList.Create;
    if MetaData <> nil then
    begin
      Count := MetaData.Count;
      for I := 0 to Count - 1 do
      begin
        MetaName := MetaData.Names[I];
        if not AnsiStartsText('x-ms-meta-', MetaName) then
          MetaName := 'x-ms-meta-' + MetaName;
        Headers.Values[MetaName] := MetaData.ValueFromIndex[I];
      end;
    end;
    PopulateDateHeader(Headers, False);

    QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName);

    QueryParams := TStringList.Create;
    QueryParams.Values['comp'] := 'metadata';
    QueryParams.Values['timeout'] := FTimeout.ToString;

    url := Format('%s/%s', [GetConnectionInfo.QueueURL, QueueName]);
    url := BuildQueryParameterString(url, QueryParams, False, True);
    try
      Response := IssuePutRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo);
      Result := (Response <> nil) and (Response.ResponseCode = 204);
    except
      Result := false;
    end;
  finally
    Response.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

procedure TAzureQueueService.PreflightQueueRequest(const AQueueName: string; const AOrigin: string;
  const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
  const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  LHeaders := nil;
  LResponse := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['x-ms-version'] := '2015-02-21';
    LHeaders.Values['Origin'] := AOrigin;
    LHeaders.Values['Access-Control-Request-Method'] := AAccessControlRequestMethod;
    LHeaders.Values['Access-Control-Request-Headers'] := AAccessControlRequestHeaders;

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, AQueueName);
    LUrl := BuildQueryParameterString(GetConnectionInfo.QueueURL + '/' + AQueueName, nil, False, True);

    LResponse := IssueOptionsRequest(LUrl, LHeaders, nil, LQueryPrefix, LResponseInfo);
    if LResponseInfo.StatusCode = 200 then
    begin
      ARule.AddAllowedOrigin(LResponseInfo.Headers.Values['Access-Control-Allow-Origin']);
      ARule.AddAllowedMethod(LResponseInfo.Headers.Values['Access-Control-Allow-Methods']);
      ARule.AddAllowedHeader(LResponseInfo.Headers.Values['Access-Control-Allow-Headers']);
      ARule.MaxAgeInSeconds := LResponseInfo.Headers.Values['Access-Control-Max-Age'].ToInteger;
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LHeaders.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureQueueService.GetQueueACLXML(const AQueueName: string; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LQueryParams: TStringList;
begin
  LQueryParams := nil;
  LHeaders := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['x-ms-client-request-id'] := AClientRequestID;

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, AQueueName);
    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'acl';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.QueueURL + '/' + AQueueName;
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LResponse.Free;
    LHeaders.Free;
    LQueryParams.Free;
  end;
end;

function TAzureQueueService.GetQueueACL(const AQueueName: string; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TSignedIdentifier>;
var
  LXml: string;
  LXmlDoc: IXMLDocument;
  LRootNode, LSidNode, LChildNode, LSubChildNode: IXMLNode;
  LSignedIdentifier: TSignedIdentifier;
  LPolicy: TQueuePolicy;
begin
  LXml := GetQueueACLXML(AQueueName, AClientRequestID, AResponseInfo);

  if LXml <> '' then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(LXml);
    LRootNode := LXmlDoc.DocumentElement;

    if not LRootNode.HasChildNodes then
      Exit(nil);

    LSidNode := LRootNode.ChildNodes.First;
    (*
       The XML looks like this:
       <SignedIdentifiers>
         <SignedIdentifier>
           <Id>unique-value</Id>
           <AccessPolicy>
             <Start>start-time</Start>
             <Expiry>expiry-time</Expiry>
             <Permission>abbreviated-permission-list</Permission>
           </AccessPolicy>
         </SignedIdentifier>
       </SignedIdentifiers>
    *)
    while LSidNode <> nil do
    begin
      if AnsiSameText(LSidNode.NodeName, 'SignedIdentifier') then
      begin
        LChildNode := GetFirstMatchingChildNode(LSidNode, 'Id');
        if LChildNode <> nil then
        begin
          LPolicy := TQueuePolicy.Create;
          try
            LSignedIdentifier := TSignedIdentifier.Create(AQueueName, LPolicy, LChildNode.Text);
            Result := Result + [LSignedIdentifier];

            LChildNode := GetFirstMatchingChildNode(LSidNode, 'AccessPolicy');
            if (LChildNode <> nil) and (LChildNode.HasChildNodes) then
            begin
              LSubChildNode := LChildNode.ChildNodes.First;
              while LSubChildNode <> nil do
              begin
                case IndexText(LSubChildNode.NodeName, ['Start', 'Expiry', 'Permission']) of
                  0: LSignedIdentifier.Policy.StartDate := LSubChildNode.Text;
                  1: LSignedIdentifier.Policy.ExpiryDate := LSubChildNode.Text;
                  2: LSignedIdentifier.Policy.Permission := LSubChildNode.Text;
                end;

                LSubChildNode := LSubChildNode.NextSibling;
              end;
            end;
          finally
            LPolicy.Free;
          end;
        end;
      end;

      LSidNode := LSidNode.NextSibling;
    end;
  end;
end;

function TAzureQueueService.SetQueueACL(const AQueueName: string; const ASignedIdentifierId: string;
  const AAccessPolicy: TPolicy; const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LSignedIdentifier: TSignedIdentifier;
begin
  LSignedIdentifier := nil;
  try
    //create a signed identifier list with the single signed identifier,
    //then call the function that takes a list.
    LSignedIdentifier := TSignedIdentifier.Create(AQueueName, AAccessPolicy, ASignedIdentifierId);
    Result := SetQueueACL(AQueueName, [LSignedIdentifier], AClientRequestID, AResponseInfo);
  finally
    LSignedIdentifier.Free;
  end;
end;

function TAzureQueueService.SetQueueACL(const AQueueName: string; ASignedIdentifiers: TArray<TSignedIdentifier>;
  const AClientRequestID: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LContentString: string;
  I, LCount: Integer;
  LContentStream: TBytesStream;
begin
  if ASignedIdentifiers = nil then
    Exit(False);

  LUrl := GetConnectionInfo.QueueURL + '/' + AQueueName;

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LContentStream := nil;

  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['x-ms-client-request-id'] := AClientRequestID;

    //Create the XML representation of the SignedIdentifiers list, to 'PUT' to the server
    LContentString := '<?xml version="1.0" encoding="utf-8"?><SignedIdentifiers>';
    LCount := Length(ASignedIdentifiers);
    for I := 0 to LCount - 1 do
      LContentString := LContentString + ASignedIdentifiers[I].AsXML;
    LContentString := LContentString + '</SignedIdentifiers>';

    LContentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(LContentString));
    //Add the XML's length as the Content-Length of the request
    if LContentStream.Size > 0 then
      LHeaders.Values['Content-Length'] := IntToStr(LContentStream.Size);

    LQueryPrefix := GetQueuesQueryPrefix(LHeaders, AQueueName);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'acl';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 204);
  finally
    LResponse.Free;
    LContentStream.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureQueueService.AddMessage(const QueueName, MessageText: string; const TimeToLive: Integer;
                                       ResponseInfo: TCloudResponseInfo): Boolean;
var
  strContent: string;
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  QueryParams: TStringList;
  reqStream: TBytesStream;
begin
  Response := nil;
  reqStream := nil;
  QueryParams := nil;
  Headers := nil;
  try
    strContent := '<?xml version="1.0" encoding="utf-8" standalone="yes"?>' +
      '<QueueMessage><MessageText>' + TNetEncoding.HTML.Encode(MessageText) + '</MessageText></QueueMessage>';

    QueryParams := TStringList.Create;
    QueryParams.Values['timeout'] := FTimeout.ToString;
    if TimeToLive > 0 then
      QueryParams.Values['messagettl'] := IntToStr(TimeToLive);

    url := Format('%s/%s/messages', [GetConnectionInfo.QueueURL, QueueName]);
    url := BuildQueryParameterString(url, QueryParams, False, True);

    reqStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(strContent));

    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);
    if reqStream.Size > 0 then
    begin
      Headers.Values['Content-Length'] := IntToStr(reqStream.Size);
      Headers.Values['Content-Type'] := 'application/x-www-form-urlencoded';
    end;

    QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName) + '/messages';

    try
      Response := IssuePostRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, reqStream);
      Result := (Response <> nil) and (Response.ResponseCode = 201);
    except
      Result := false;
    end;
  finally
    Response.Free;
    reqStream.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureQueueService.GetOrPeekMessagesXML(const QueueName: string; PeekOnly: Boolean; NumOfMessages,
                                                VisibilityTimeout: Integer;
                                                ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  QueryParams: TStringList;
begin
  Response := nil;
  QueryParams := nil;
  Headers := nil;
  try
    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);

    QueryParams := TStringList.Create;
    QueryParams.Values['timeout'] := FTimeout.ToString;
    if (NumOfMessages > 0) or ((not PeekOnly) and (VisibilityTimeout > 0)) or PeekOnly then
    begin
      if NumOfMessages > 0 then
        QueryParams.Values['numofmessages'] := IntToStr(NumOfMessages);
      if (not PeekOnly) and (VisibilityTimeout > 0) then
        QueryParams.Values['visibilitytimeout'] := IntToStr(VisibilityTimeout);
      if PeekOnly then
        QueryParams.Values['peekonly'] := 'true';
    end;

    url := Format('%s/%s/messages', [GetConnectionInfo.QueueURL, QueueName]);
    url := BuildQueryParameterString(url, QueryParams, False, True);

    QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName) + '/messages';

    Response := IssueGetRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    Headers.Free;
    QueryParams.Free;
  end;
end;

function TAzureQueueService.GetMessagesXML(const QueueName: string; NumOfMessages, VisibilityTimeout: Integer;
                                           ResponseInfo: TCloudResponseInfo): string;
begin
  Result := GetOrPeekMessagesXML(QueueName, False, NumOfMessages, VisibilityTimeout, ResponseInfo);
end;

function TAzureQueueService.GetMessages(const QueueName: string; NumOfMessages, VisibilityTimeout: Integer;
                                        ResponseInfo: TCloudResponseInfo): TList<TCloudQueueMessage>;
var
  xml: string;
begin
  xml := GetMessagesXML(QueueName, NumOfMessages, VisibilityTimeout, ResponseInfo);
  Result := GetMessagesFromXML(xml);
end;

function TAzureQueueService.GetMessagesFromXML(const xml: string): TList<TCloudQueueMessage>;
var
  xmlDoc: IXMLDocument;
  RootNode: IXMLNode;
  MessageNode, ChildNode: IXMLNode;
  MsgId, MsgText, PopReceipt: string;
  Msg: TCloudQueueMessage;
  MsgProps: TStrings;
begin
  Result := nil;

  if xml <> EmptyStr then
  begin
    Result := TList<TCloudQueueMessage>.Create;

    xmlDoc := TXMLDocument.Create(nil);
    xmlDoc.LoadFromXML(xml);
    RootNode := xmlDoc.DocumentElement;

    if (RootNode <> nil) and (RootNode.HasChildNodes) then
    begin
      MessageNode := RootNode.ChildNodes.FindNode('QueueMessage');

      while (MessageNode <> nil) do
      begin
        MsgProps := nil;

        //making sure to only add the message if MessageId and MessageText are both found
        if (MessageNode.NodeName = 'QueueMessage') and MessageNode.HasChildNodes then
        begin
          ChildNode := MessageNode.ChildNodes.First;

          MsgProps := TStringList.Create;

          while (ChildNode <> nil) do
          begin
            if AnsiSameText('MessageId' , ChildNode.NodeName) then
              MsgId := ChildNode.Text
            else if AnsiSameText('MessageText' , ChildNode.NodeName) then
              MsgText := ChildNode.Text
            else if AnsiSameText('PopReceipt' , ChildNode.NodeName) then
              PopReceipt := ChildNode.Text
            else
              MsgProps.Values[ChildNode.NodeName] := ChildNode.Text;

            ChildNode := ChildNode.NextSibling;
          end;

          if (MsgId <> EmptyStr) and (MsgText <> EmptyStr) then
          begin
            Msg := TCloudQueueMessage.Create(MsgId, MsgText, MsgProps);
            Msg.PopReceipt := PopReceipt;
            Result.Add(Msg);
          end
          else
            FreeAndNil(MsgProps);
        end;

        MessageNode := MessageNode.NextSibling;
      end;
    end;
  end;
end;

function TAzureQueueService.PeekMessagesXML(const QueueName: string; NumOfMessages: Integer;
                                            ResponseInfo: TCloudResponseInfo): string;
begin
  Result := GetOrPeekMessagesXML(QueueName, True, NumOfMessages, 0, ResponseInfo);
end;

function TAzureQueueService.PeekMessages(const QueueName: string; NumOfMessages: Integer;
                                         ResponseInfo: TCloudResponseInfo): TList<TCloudQueueMessage>;
var
  xml: string;
begin
  xml := PeekMessagesXML(QueueName, NumOfMessages, ResponseInfo);
  Result := GetMessagesFromXML(xml);
end;

function TAzureQueueService.DeleteMessage(const QueueName: string; const QueueMessage: TCloudQueueMessage;
                                          GetPopReceiptIfNeeded: Boolean; ResponseInfo: TCloudResponseInfo): Boolean;
var
  Msgs: TList<TCloudQueueMessage>;
begin
  if (QueueName = EmptyStr) or (QueueMessage = nil) or (QueueMessage.MessageId = EmptyStr) then
    Exit(False);

  if QueueMessage.PopReceipt = EmptyStr then
  begin
    //If there is no pop receipt, and the caller doesn't want to compute one, fail the execution.
    if not GetPopReceiptIfNeeded then
      Exit(False);

    Msgs := GetMessages(QueueName, 1, 0, ResponseInfo);
    try
      if (Msgs = nil) or (Msgs.Count <> 1) then
        Exit(False);

      //only set the pop receipt if the message on the top of the queue was the one requesting deletion.
      if Msgs[0].MessageId = QueueMessage.MessageId then
        QueueMessage.PopReceipt := Msgs[0].PopReceipt;
    finally
      Msgs.Free;
    end;
  end;

  Result := DeleteMessage(QueueName, QueueMessage.MessageId, QueueMessage.PopReceipt, ResponseInfo);
end;

function TAzureQueueService.DeleteMessage(const QueueName, MessageId, PopReceipt: string;
                                          ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  Response: TCloudHTTP;
  QueryParams: TStringList;
begin
  if (QueueName = EmptyStr) or (MessageId = EmptyStr) or (PopReceipt = EmptyStr) then
    Exit(False);

  url := Format('%s/%s/messages/%s', [GetConnectionInfo.QueueURL, QueueName, MessageId]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers, False);

  QueryParams := TStringList.Create;
  QueryParams.Values['popreceipt'] := PopReceipt;
  QueryParams.Values['timeout'] := FTimeout.ToString;

  QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName) + '/messages/' + MessageId;
  url := BuildQueryParameterString(url, QueryParams, False, True);

  Response := nil;
  try
    Response := IssueDeleteRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo);
    Result := (Response <> nil) and (Response.ResponseCode = 204);
  finally
    Response.Free;
    Headers.Free;
    QueryParams.Free;
  end;
end;


function TAzureQueueService.ClearMessages(const QueueName: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  LQueryParams: TStringList;
  Response: TCloudHTTP;
begin
  if (QueueName = EmptyStr) then
    Exit(False);

  url := Format('%s/%s/messages', [GetConnectionInfo.QueueURL, QueueName]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers, False);

  QueryPrefix := GetQueuesQueryPrefix(Headers, QueueName) + '/messages';

  Response := nil;
  LQueryParams := TStringList.Create;
  try
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    url := BuildQueryParameterString(url, LQueryParams, False, True);

    Response := IssueDeleteRequest(url, Headers, LQueryParams, QueryPrefix, ResponseInfo);
    Result := (Response <> nil) and (Response.ResponseCode = 204);
  finally
    Response.Free;
    Headers.Free;
    LQueryParams.Free;
  end;
end;

{ TAzureBlobService }

function TAzureBlobService.ListContainersXML(OptionalParams: TStrings;
                                             ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  QueryParams: TStringList;
  Response: TCloudHTTP;
begin
  Response := nil;
  Headers := nil;
  QueryParams := nil;
  try
    Headers := TStringList.Create;
    PopulateDateHeader(Headers, False);

    QueryParams := TStringList.Create;
    QueryParams.Values['comp'] := 'list';
    QueryParams.Values['timeout'] := FTimeout.ToString;
    if OptionalParams <> nil then
      QueryParams.AddStrings(OptionalParams);

    url := GetConnectionInfo.BlobURL + '/';
    url := BuildQueryParameterString(url, QueryParams, False, True);

    QueryPrefix := GetBlobContainerQueryPrefix(Headers, '', '');

    Response := IssueGetRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, Result);
  finally
    Response.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureBlobService.ListContainersXML(AIncludeMetadata: Boolean; const APrefix: string; const AMarker: string;
  AMaxResult: Integer; const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'list';
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not APrefix.IsEmpty then
      LQueryParams.Values['prefix'] := APrefix;
    if AMaxResult > 0 then
      LQueryParams.Values['maxresults'] := AMaxResult.ToString;
    if not AMarker.IsEmpty then
      LQueryParams.Values['marker'] := AMarker;
    if AIncludeMetadata then
      LQueryParams.Values['include'] := 'metadata';

    LUrl := GetConnectionInfo.BlobURL + '/';
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, '', '');

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LQueryParams.Free;
    LHeaders.Free;
    LResponse.Free;
  end;
end;

function GetBlobDatasetValue(ADatasets: TAzureBlobDatasets): string;
var
  LDataset: TAzureBlobDataset;
begin
  for LDataset := Low(TAzureBlobDataset) to High(TAzureBlobDataset) do
    if LDataset in ADatasets then
    begin
      if not Result.IsEmpty then
        Result := Result + ',';
      case LDataset of
        bdsSnapshots: Result := Result + 'snapshots';
        bdsMetadata: Result := Result + 'metadata';
        bdsUncommitedBlobs: Result := Result + 'uncommittedblobs';
        bdsCopy: Result := Result + 'copy';
      end;
    end;
end;

function TAzureBlobService.ListBlobsXML(const AContainerName: string; const APrefix: string; const ADelimiter: string;
  const AMarker: string; AMaxResult: Integer; ADatasets: TAzureBlobDatasets; const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['comp'] := 'list';
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not APrefix.IsEmpty then
      LQueryParams.Values['prefix'] := APrefix;
    if not ADelimiter.IsEmpty then
      LQueryParams.Values['delimiter'] := ADelimiter;
    if AMaxResult > 0 then
      LQueryParams.Values['maxresults'] := AMaxResult.ToString;
    if not AMarker.IsEmpty then
      LQueryParams.Values['marker'] := AMarker;
    if ADatasets <> [] then
      LQueryParams.Values['include'] := GetBlobDatasetValue(ADatasets);

    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower, LQueryParams, False, True);
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.ParseContainerPropertiesFromNode(const ANode: IXMLNode): TArray<TPair<string, string>>;
var
  LChildNode: IXMLNode;
begin
  if (ANode <> nil) and ANode.HasChildNodes then
  begin
    LChildNode := ANode.ChildNodes.First;
    while LChildNode <> nil do
    begin
      if LChildNode.IsTextElement then
        Result := Result + [TPair<string, string>.Create(LChildNode.NodeName, LChildNode.Text)];

      LChildNode := LChildNode.NextSibling;
    end;
  end;
end;

function TAzureBlobService.ParseContainerFromNode(const AContainerNode: IXMLNode): TAzureContainerItem;
var
  LContainerItem: IXMLNode;
begin
  Result := Default(TAzureContainerItem);
  if (AContainerNode <> nil) and AContainerNode.NodeName.Equals('Container') and AContainerNode.HasChildNodes then
  begin
    LContainerItem := AContainerNode.ChildNodes.First;

    while LContainerItem <> nil do
    begin
      if LContainerItem.NodeName.Equals('Name') then
        Result.Name := LContainerItem.Text
      else if LContainerItem.NodeName.Equals('Properties') then
        Result.Properties := ParseContainerPropertiesFromNode(LContainerItem)
      else if LContainerItem.NodeName.Equals('Metadata') then
        Result.Metadata := ParseContainerPropertiesFromNode(LContainerItem);

      LContainerItem := LContainerItem.NextSibling;
    end;
  end;
end;

function TAzureBlobService.ParseBlobFromNode(const ABlobNode: IXMLNode): TAzureBlobItem;

  procedure ParseBlobProperties(const APropsNode: IXMLNode);
  var
    LProp: IXMLNode;
  begin
    if (APropsNode <> nil) and APropsNode.HasChildNodes then
    begin
      LProp := APropsNode.ChildNodes.First;

      while LProp <> nil do
      begin
        Result.Properties := Result.Properties + [TPair<string, string>.Create(LProp.NodeName, LProp.Text)];
        if LProp.NodeName.Equals('BlobType') then
        begin
          if LProp.Text.Equals('BlockBlob') then
            Result.BlobType := TAzureBlobType.abtBlock
          else if LProp.Text.Equals('PageBlob') then
            Result.BlobType := TAzureBlobType.abtPage
          else
            Result.BlobType := TAzureBlobType.abtAppend;
        end
        else if LProp.NodeName.Equals('LeaseStatus') then
        begin
          if LProp.Text.Equals('locked') then
            Result.LeaseStatus := TAzureLeaseStatus.alsLocked
          else
            Result.LeaseStatus := TAzureLeaseStatus.alsUnlocked
        end;

        LProp := LProp.NextSibling;
      end;
    end;
  end;

  procedure ParseBlobMetadata(const AMetadataNode: IXMLNode);
  var
    LMetadata: IXMLNode;
  begin
    if (AMetadataNode <> nil) and AMetadataNode.HasChildNodes then
    begin
      LMetadata := AMetadataNode.ChildNodes.First;
      while LMetadata <> nil do
      begin
        Result.Metadata := Result.Metadata + [TPair<string, string>.Create(LMetadata.NodeName, LMetadata.Text)];
        LMetadata := LMetadata.NextSibling;
      end;
    end;
  end;

var
  LItem: IXMLNode;
begin
  Result := Default(TAzureBlobItem);
  if (ABlobNode <> nil) and ABlobNode.NodeName.Equals('Blob') and ABlobNode.HasChildNodes then
  begin
    LItem := ABlobNode.ChildNodes.First;

    while LItem <> nil do
    begin
      if LItem.NodeName.Equals('Name') then
        Result.Name := LItem.Text
      else if LItem.NodeName.Equals('Snapshot') then
        Result.Snapshot := LItem.Text
      else if LItem.NodeName.Equals('Properties') then
        ParseBlobProperties(LItem)
      else if LItem.NodeName.Equals('Metadata') then
        ParseBlobMetadata(LItem);

      LItem := LItem.NextSibling;
    end;
  end;
end;

procedure TAzureBlobService.PopulateBlobPropertyHeaders(AHeaders, AProperties: TStrings);
var
  PropName: string;
  I, Count: Integer;
begin
  if (AProperties <> nil) and (AHeaders <> nil) then
  begin
    Count := AProperties.Count;
    for I := 0 to Count - 1 do
    begin
      PropName := AProperties.Names[I];
      //if the value doesn't start with 'x-ms-blob-' then the prefix will be added.
      //otherwise, the header will be added as-is, and may or may not be a valid header
      if AnsiSameText(PropName, 'x-ms-blob-cache-control') or
         AnsiSameText(PropName, 'Cache-Control') then
        AHeaders.Values['x-ms-blob-cache-control'] := AProperties.ValueFromIndex[I]
      else if AnsiSameText(PropName, 'x-ms-blob-content-type') or
              AnsiSameText(PropName, 'Content-Type') then
        AHeaders.Values['x-ms-blob-content-type'] := AProperties.ValueFromIndex[I]
      else if AnsiSameText(PropName, 'x-ms-blob-content-md5') or
              AnsiSameText(PropName, 'Content-MD5') then
        AHeaders.Values['x-ms-blob-content-md5'] := AProperties.ValueFromIndex[I]
      else if AnsiSameText(PropName, 'x-ms-blob-content-encoding') or
              AnsiSameText(PropName, 'Content-Encoding') then
        AHeaders.Values['x-ms-blob-content-encoding'] := AProperties.ValueFromIndex[I]
      else if AnsiSameText(PropName, 'x-ms-blob-content-language') or
              AnsiSameText(PropName, 'Content-Language') then
        AHeaders.Values['x-ms-blob-content-language'] := AProperties.ValueFromIndex[I]
      else
        AHeaders.Values[PropName] := AProperties.ValueFromIndex[I];
    end;
  end;
end;

procedure TAzureBlobService.PopulatePropertyHeaders(const AHeaders: TStrings;
  const AProperties: array of TPair<string, string>);
var
  LProperty: TPair<string, string>;
begin
  if AHeaders <> nil then
    for LProperty in AProperties do
      //if the value doesn't start with 'x-ms-blob-' then the prefix will be added.
      //otherwise, the header will be added as-is, and may or may not be a valid header
      if LProperty.Key.Equals('x-ms-blob-cache-control') or LProperty.Key.Equals('Cache-Control') then
        AHeaders.Values['x-ms-blob-cache-control'] := LProperty.Value
      else if LProperty.Key.Equals('x-ms-blob-content-type') or LProperty.Key.Equals('Content-Type') then
        AHeaders.Values['x-ms-blob-content-type'] := LProperty.Value
      else if LProperty.Key.Equals('x-ms-blob-content-md5') or LProperty.Key.Equals('Content-MD5') then
        AHeaders.Values['x-ms-blob-content-md5'] := LProperty.Value
      else if LProperty.Key.Equals('x-ms-blob-content-encoding') or LProperty.Key.Equals('Content-Encoding') then
        AHeaders.Values['x-ms-blob-content-encoding'] := LProperty.Value
      else if LProperty.Key.Equals('x-ms-blob-content-language') or LProperty.Key.Equals('Content-Language') then
        AHeaders.Values['x-ms-blob-content-language'] := LProperty.Value
      else
        AHeaders.Values[LProperty.Key] := LProperty.Value;
end;

function TAzureBlobService.PutBlock(ContainerName, BlobName: string; const BlockId: string; Content: TArray<Byte>;
                                    const ContentMD5, LeaseId: string;
                                    ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutBlock(ContainerName, BlobName, LeaseId, BlockId, Content, ContentMD5, ResponseInfo);
end;

function TAzureBlobService.PutBlock(const AContainerName, ABlobName, ALeaseId, ABlockId: string; AContent: TArray<Byte>;
  const AContentMD5: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LContentStream: TBytesStream;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if (AContent = nil) or AContainerName.IsEmpty or ABlobName.IsEmpty or ABlockId.IsEmpty then
    Exit(False);

  LResponse := nil;
  LContentStream := nil;
  LQueryParams := nil;
  LHeaders := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';

    if not AContentMD5.IsEmpty then
      LHeaders.Values['Content-MD5'] := AContentMD5;

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LContentStream := TBytesStream.Create(AContent);
    //issuing a put, so need content length
    if LContentStream.Size > 0 then
      LHeaders.Values['Content-Length'] := LContentStream.Size.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'block';
    LQueryParams.Values['blockid'] := ABlockId; //Base64 encode the BlockId

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
  finally
    LResponse.Free;
    LContentStream.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.PutBlockBlob(ContainerName, BlobName: string; Content: TArray<Byte>; LeaseId: string;
                                        OptionalHeaders, Metadata: TStrings;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  LOptions, LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  if OptionalHeaders <> nil then
    for I := 0 to OptionalHeaders.Count-1 do
      LOptions := LOptions + [TPair<string, string>.Create(OptionalHeaders.Names[I], OptionalHeaders.ValueFromIndex[I])];

  Result := PutBlockBlob(ContainerName, BlobName, LeaseID, Content, LOptions, LMetadata, ResponseInfo);
end;

function TAzureBlobService.PutBlockBlob(const AContainerName, ABlobName, ALeaseID: string; const AContent: TArray<Byte>;
  const AOptionalHeaders, AMetadata: array of TPair<string, string>;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutBlobInternal(TAzureBlobType.abtBlock, AContainerName, ABlobName, ALeaseID, AContent, 0, 0,
    AOptionalHeaders, AMetadata, AResponseInfo);
end;

function TAzureBlobService.PutBlockList(ContainerName, BlobName: string; BlockList: TList<TAzureBlockListItem>;
                                        Properties, Metadata: TStrings; const LeaseId: string;
                                        const ContentMD5: string;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  url: string;
  xml: string;
  contentStream: TBytesStream;
  Headers: TStringList;
  QueryPrefix: string;
  QueryParams: TStringList;
  Response: TCloudHTTP;
  Item: TAzureBlockListItem;
begin
  if (ContainerName = EmptyStr) or (BlobName = EmptyStr) or
     (BlockList = nil) or (BlockList.Count = 0) then
    Exit(False);

  url := Format('%s/%s/%s', [GetConnectionInfo.BlobURL, ContainerName, URLEncode(BlobName)]);

  Headers := BuildMetadataHeaderList(Metadata);
  PopulateDateHeader(Headers, False);

  if LeaseId <> EmptyStr then
    headers.Values['x-ms-lease-id'] := LeaseId;

  if ContentMD5 <> EmptyStr then
    Headers.Values['Content-MD5'] := ContentMD5;

  //Populate the headers, possibly prefixing with x-ms-blob-, when appropriate.
  //For example, 'Content-Type' in the Properties list would be added
  //to the Headers list as 'x-ms-blob-content-type'
  PopulateBlobPropertyHeaders(Headers, Properties);

  QueryParams := TStringList.Create;
  QueryParams.Values['comp'] := 'blocklist';
  QueryParams.Values['timeout'] := FTimeout.ToString;

  url := BuildQueryParameterString(url, QueryParams, False, True);

  xml := '<?xml version="1.0" encoding="utf-8"?><BlockList>';
  for Item In BlockList do
    xml := xml + Item.AsXML;
  xml := xml + '</BlockList>';

  contentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(xml));
  if contentStream.Size > 0 then
    Headers.Values['Content-Length'] := IntToStr(contentStream.Size);

  QueryPrefix := GetBlobContainerQueryPrefix(Headers, ContainerName, URLEncode(BlobName));

  Response := nil;
  try
    Response := IssuePutRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, contentStream);
    Result := (Response <> nil) and (Response.ResponseCode = 201);
  finally
    Response.Free;
    contentStream.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureBlobService.PutBlockList(const AContainerName, ABlobName, ALeaseId, AContentMD5: string;
  ABlockList: array of TAzureBlockListItem; AProperties, AMetadata: array of TPair<string, string>;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LXML: string;
  LContentStream: TBytesStream;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LItem: TAzureBlockListItem;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty or (Length(ABlockList) = 0) then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LContentStream := nil;
  try
    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetadata);
    PopulateDateHeader(LHeaders, False);

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    if not AContentMD5.IsEmpty then
      LHeaders.Values['Content-MD5'] := AContentMD5;

    //Populate the headers, possibly prefixing with x-ms-blob-, when appropriate.
    //For example, 'Content-Type' in the Properties list would be added
    //to the Headers list as 'x-ms-blob-content-type'
    PopulatePropertyHeaders(LHeaders, AProperties);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'blocklist';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LXML := '<?xml version="1.0" encoding="utf-8"?><BlockList>';
    for LItem In ABlockList do
      LXML := LXML + LItem.AsXML;
    LXML := LXML + '</BlockList>';

    LContentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(LXML));
    if LContentStream.Size > 0 then
      LHeaders.Values['Content-Length'] := LContentStream.Size.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName, URLEncode(ABlobName));
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
  finally
    LResponse.Free;
    LContentStream.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.PutPageInternal(const AContainerName, ABlobName, ALeaseID: string; ADoClear: Boolean;
  AStartPage, APageCount: Integer; const AContent: TArray<Byte>; const AContentMD5: string;
  AActions: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LContentStream: TBytesStream;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LStartByte, LEndByte: Int64;
begin
  if (AContainerName.IsEmpty or ABlobName.IsEmpty) or
     //Content should only be nil if doing a 'clear' action on the given range
     ((AContent = nil) and not ADoClear) then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LContentStream := nil;
  try
    //calculate the starting and ending byte based on the start page and page count
    LStartByte := AStartPage * 512; //Pages must each be 512 bytes
    LEndByte := LStartByte + (APageCount * 512 - 1); //Zero based indexing, so subtract 1 from the range

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';

    if LEndByte > LStartByte then
      LHeaders.Values['x-ms-range'] := 'bytes=' + LStartByte.ToString + '-' + LEndByte.ToString;

    if not AContentMD5.IsEmpty then
      LHeaders.Values['Content-MD5'] := AContentMD5;

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    //either an update or clear action
    if ADoClear then
      LHeaders.Values['x-ms-page-write'] := 'clear'
    else
    begin
      LHeaders.Values['x-ms-page-write'] := 'update';
      //issuing a put, so need content length
      LContentStream := nil;
      if AContent <> nil then
      begin
        LContentStream := TBytesStream.Create(AContent);
        LHeaders.Values['Content-Length'] := LContentStream.Size.ToString;
      end;
    end;

    //add the conditional headers, if any are set
    AActions.PopulateHeaders(LHeaders);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'page';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
  finally
    LResponse.Free;
    LContentStream.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.PutPage(ContainerName, BlobName: string; Content: TArray<Byte>; StartPage: Integer;
                                   const LeaseId: string; ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutPage(ContainerName, BlobName, LeaseID, StartPage, Content, '', TBlobActionConditional.Create,
    ResponseInfo);
end;

function TAzureBlobService.PutPage(ContainerName, BlobName: string; Content: TArray<Byte>; StartPage: Integer;
                                   ActionConditional: TBlobActionConditional; const LeaseId: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutPage(ContainerName, BlobName, LeaseID, StartPage, Content, '', ActionConditional, ResponseInfo);
end;

function TAzureBlobService.PutPage(ContainerName, BlobName: string; Content: TArray<Byte>;
                                   StartPage, PageCount: Integer; ActionConditional: TBlobActionConditional;
                                   const ContentMD5, LeaseId: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutPage(ContainerName, BlobName, LeaseID, StartPage, Content, ContentMD5, ActionConditional,
    ResponseInfo);
end;

function TAzureBlobService.PutPage(ContainerName, BlobName: string; Content: TArray<Byte>;
                                   StartPage, PageCount: Integer; const LeaseId, ContentMD5: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutPage(ContainerName, BlobName, LeaseID, StartPage, Content, ContentMD5, TBlobActionConditional.Create,
    ResponseInfo);
end;

function TAzureBlobService.PutPage(const AContainerName, ABlobName, ALeaseID: string; AStartPage: Integer;
  AContent: TArray<Byte>; const AContentMD5: string; AActionConditional: TBlobActionConditional;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LLen: Integer;
  LLeftToPad, LPageCount: Int64;
begin
  LPageCount := 0;
  if AContent <> nil then
  begin
    //get the actual length of the content
    LLen := Length(AContent);
    //get the page count, which may or may not be one fewer than it needs to be
    LPageCount := Trunc(LLen / 512);
    //Determine if the current PageCount is correct, or if one more (partially filled) page is needed.
    //If one more page is needed, specify how many bytes need to be added as padding on the end.
    LLeftToPad := 512 - (LLen mod 512);
    //Increment the page count by one and pad the content with enough bytes to make (Length Mod 512) equal zero.
    if LLeftToPad < 512 then
    begin
      Inc(LPageCount);
      SetLength(AContent, LLen + LLeftToPad);
    end;
  end;

  Result := PutPageInternal(AContainerName, ABlobName, ALeaseID, False, AStartPage, LPageCount, AContent, AContentMD5,
    AActionConditional, AResponseInfo);
end;

function TAzureBlobService.ClearPage(ContainerName, BlobName: string; StartPage, PageCount: Integer;
                                     ActionConditional: TBlobActionConditional; const LeaseId: string;
                                     ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := ClearPage(ContainerName, BlobName, LeaseId, StartPage, PageCount, ActionConditional, ResponseInfo);
end;

function TAzureBlobService.ClearPage(ContainerName, BlobName: string; StartPage, PageCount: Integer;
                                     const LeaseId: string; ResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := ClearPage(ContainerName, BlobName, LeaseId, StartPage, PageCount, TBlobActionConditional.Create,
    ResponseInfo);
end;

function TAzureBlobService.ClearPage(const AContainerName, ABlobName, ALeaseID: string; AStartPage, APageCount: Integer;
  AActionConditional: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutPageInternal(AContainerName, ABlobName, ALeaseID, True, AStartPage, APageCount, nil, '',
    AActionConditional, AResponseInfo);
end;

function TAzureBlobService.PutPageBlob(ContainerName, BlobName: string; MaximumSize: int64; OptionalHeaders,
                                       Metadata: TStrings; BlobSequenceNumber: int64;
                                       ResponseInfo: TCloudResponseInfo): Boolean;
var
  LOptions, LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  if OptionalHeaders <> nil then
    for I := 0 to OptionalHeaders.Count-1 do
      LOptions := LOptions + [TPair<string, string>.Create(OptionalHeaders.Names[I], OptionalHeaders.ValueFromIndex[I])];

  Result := PutPageBlob(ContainerName, BlobName, '', MaximumSize, BlobSequenceNumber, LOptions, LMetadata, ResponseInfo);
end;

function TAzureBlobService.PutPageBlob(AContainerName, ABlobName, ALeaseID: string; AMaximumSize,
  ABlobSequenceNumber: Int64; const AOptionalHeaders, AMetadata: array of TPair<string, string>;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutBlobInternal(TAzureBlobType.abtPage, AContainerName, ABlobName, ALeaseID, nil, AMaximumSize,
    ABlobSequenceNumber, AOptionalHeaders, AMetadata, AResponseInfo);
end;

function TAzureBlobService.PutAppendBlob(const AContainerName, ABlobName, ALeaseID: string;
  const AOptionalHeaders, AMetadata: TStrings; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LOptions, LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if AMetadata <> nil then
    for I := 0 to AMetadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(AMetadata.Names[I], AMetadata.ValueFromIndex[I])];

  if AOptionalHeaders <> nil then
    for I := 0 to AOptionalHeaders.Count-1 do
      LOptions := LOptions + [TPair<string, string>.Create(AOptionalHeaders.Names[I], AOptionalHeaders.ValueFromIndex[I])];

  Result := PutBlobInternal(TAzureBlobType.abtAppend, AContainerName, ABlobName, ALeaseID, nil, 0, 0, LOptions,
    LMetadata, AResponseInfo);
end;

function TAzureBlobService.PutAppendBlob(const AContainerName, ABlobName, ALeaseID: string;
 const AOptionalHeaders, AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := PutBlobInternal(TAzureBlobType.abtAppend, AContainerName, ABlobName, ALeaseID, nil, 0, 0, AOptionalHeaders,
    AMetadata, AResponseInfo);
end;

function TAzureBlobService.SetContainerACL(ContainerName: string; const SignedIdentifierId: string;
  AccessPolicy: TAccessPolicy; PublicAccess: TBlobPublicAccess; ResponseInfo: TCloudResponseInfo): Boolean;
var
  acp: TBlobPolicy;
begin
  acp := TBlobPolicy.Create;
  try
    acp.CanReadBlob := AccessPolicy.PermRead;
    acp.CanWriteBlob := AccessPolicy.PermWrite;
    acp.CanDeleteBlob := AccessPolicy.PermDelete;
    acp.CanListBlob := AccessPolicy.PermDelete;
    acp.StartDate := AccessPolicy.Start;
    acp.ExpiryDate := AccessPolicy.Expiry;

    Result := SetContainerACL(ContainerName, [TSignedIdentifier.Create(ContainerName, acp, SignedIdentifierId)],
      PublicAccess, '', ResponseInfo);
  finally
    acp.Free;
  end;
end;

function TAzureBlobService.SetContainerACL(const AContainerName: string; const ASignedIdentifierId: string;
  const AAccessPolicy: TPolicy; APublicAccess: TBlobPublicAccess; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LSignedIdentifiers: TArray<ISignedIdentifier>;
begin
  //create a signed identifier list with the single signed identifier,
  //then call the function that takes a list.
  LSignedIdentifiers := LSignedIdentifiers + [TSignedIdentifier.Create(AContainerName, AAccessPolicy, ASignedIdentifierId)];
  Result := SetContainerACL(AContainerName, LSignedIdentifiers, APublicAccess, AClientRequestID, AResponseInfo);
end;

function TAzureBlobService.SetBlobMetadata(ContainerName, BlobName: string; Metadata: TStrings;
                                           LeaseId: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], MEtadata.ValueFromIndex[I])];

  Result := SetBlobMetadata(ContainerName, BlobName, LMetadata, LeaseId, ResponseInfo);
end;

function TAzureBlobService.SetBlobMetadata(const AContainerName, ABlobName: string; AMetadata: array of TPair<string, string>;
  const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetaData);
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'metadata';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 200);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

procedure TAzureBlobService.PreflightBlobRequest(const AContainerName: string; const AOrigin: string;
  const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
  const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  LHeaders := nil;
  LResponse := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['x-ms-version'] := '2015-02-21';
    LHeaders.Values['Origin'] := AOrigin;
    LHeaders.Values['Access-Control-Request-Method'] := AAccessControlRequestMethod;
    LHeaders.Values['Access-Control-Request-Headers'] := AAccessControlRequestHeaders;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName, '');
    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName;

    LResponse := IssueOptionsRequest(LUrl, LHeaders, nil, LQueryPrefix, LResponseInfo);
    if LResponseInfo.StatusCode = 200 then
    begin
      ARule.AddAllowedOrigin(LResponseInfo.Headers.Values['Access-Control-Allow-Origin']);
      ARule.AddAllowedMethod(LResponseInfo.Headers.Values['Access-Control-Allow-Methods']);
      ARule.AddAllowedHeader(LResponseInfo.Headers.Values['Access-Control-Allow-Headers']);
      ARule.MaxAgeInSeconds := LResponseInfo.Headers.Values['Access-Control-Max-Age'].ToInteger;
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LHeaders.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

procedure TAzureBlobService.PreflightBlobRequest(const AContainerName: string; const ABlobName: string;
  const AOrigin: string; const AAccessControlRequestMethod: string; const AAccessControlRequestHeaders: string;
  const ARule: TCorsRule; const AResponseInfo: TCloudResponseInfo);
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  LHeaders := nil;
  LResponse := nil;
  LQueryParams := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['x-ms-version'] := '2015-02-21';
    LHeaders.Values['Origin'] := AOrigin;
    LHeaders.Values['Access-Control-Request-Method'] := AAccessControlRequestMethod;
    LHeaders.Values['Access-Control-Request-Headers'] := AAccessControlRequestHeaders;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/' + AContainerName + '/' + ABlobName, LQueryParams, False, True);

    LResponse := IssueOptionsRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    if LResponseInfo.StatusCode = 200 then
    begin
      ARule.AddAllowedOrigin(LResponseInfo.Headers.Values['Access-Control-Allow-Origin']);
      ARule.AddAllowedMethod(LResponseInfo.Headers.Values['Access-Control-Allow-Methods']);
      ARule.AddAllowedHeader(LResponseInfo.Headers.Values['Access-Control-Allow-Headers']);
      ARule.MaxAgeInSeconds := LResponseInfo.Headers.Values['Access-Control-Max-Age'].ToInteger;
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LHeaders.Free;
    LResponse.Free;
    LResponseInfo.Free;
    LQueryParams.Free;
  end;
end;

function TAzureBlobService.SetBlobProperties(ContainerName, BlobName: string; Properties: TStrings;
                                             const LeaseId: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LProperties: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Properties <> nil then
    for I := 0 to Properties.Count-1 do
      LProperties := LProperties + [TPair<string, string>.Create(Properties.Names[I], Properties.ValueFromIndex[I])];

  Result := SetBlobProperties(ContainerName, BlobName, LeaseId, LProperties, ResponseInfo);
end;

function TAzureBlobService.SetBlobProperties(const AContainerName, ABlobName, ALeaseId: string;
  const AProperties: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;
    //Populate the headers, possibly prefixing with x-ms-blob-, when appropriate.
    //For example, 'Content-Type' in the Properties list would be added
    //to the Headers list as 'x-ms-blob-content-type'
    PopulatePropertyHeaders(LHeaders, AProperties);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'properties';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 200);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.SetBlobServiceProperties(const AProperties: TStorageServiceProperties;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LContent: TBytesStream;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  LContent := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LContent := TBytesStream.Create(TEncoding.UTF8.GetBytes('<?xml version="1.0" encoding="utf-8"?>' + AProperties.XML));

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if LContent.Size > 0 then
    begin
      LHeaders.Values['Content-Length'] := IntToStr(LContent.Size);
      LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
    end;

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'properties';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, '', '');

    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/', LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo, LContent);
    Result := LResponseInfo.StatusCode = 202;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LContent.Free;
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureBlobService.GetBlobServiceStatsXML(const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'stats';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, '', '');

    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobSecondaryURL + '/', LQueryParams, False, True);

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
  end;
end;

procedure TAzureBlobService.GetBlobServiceStats(const AStats: TStorageServiceStats; const AResponseInfo: TCloudResponseInfo);
begin
  AStats.LoadFromXML(GetBlobServiceStatsXML(AResponseInfo));
end;

function TAzureBlobService.SetContainerACL(ContainerName: string; SignedIdentifiers: TList<TSignedIdentifier>;
  PublicAccess: TBlobPublicAccess; ResponseInfo: TCloudResponseInfo; const AClientRequestID: string): Boolean;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  QueryParams: TStringList;
  Response: TCloudHTTP;
  ContentString: string;
  I, Count: Integer;
  ContentStream: TBytesStream;
begin
  if SignedIdentifiers = nil then
    Exit(False);

  ContainerName := AnsiLowerCase(ContainerName);

  url := Format('%s/%s', [GetConnectionInfo.BlobURL, ContainerName]);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers, False);

  //Create the XML representation of the SignedIdentifiers list, to 'PUT' to the server
  ContentString := '<?xml version="1.0" encoding="utf-8"?><SignedIdentifiers>';
  Count := SignedIdentifiers.Count;
  for I := 0 to Count - 1 do
    ContentString := ContentString + SignedIdentifiers[I].AsXML;
  ContentString := ContentString + '</SignedIdentifiers>';

  ContentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(ContentString));
  //Add the XML's length as the Content-Length of the request
  if ContentStream.Size > 0 then
  begin
    Headers.Values['Content-Length'] := IntToStr(ContentStream.Size);
    Headers.Values['Content-Type'] := 'application/x-www-form-urlencoded';
  end;
  if GetConnectionInfo.UseDevelopmentStorage then
    Headers.Values['x-ms-prop-publicaccess'] := 'true'
  else
    Headers.Values['x-ms-blob-public-access'] := GetPublicAccessString(PublicAccess);
  Headers.Values['x-ms-client-request-id'] := AClientRequestID;

  QueryPrefix := GetBlobContainerQueryPrefix(Headers, ContainerName, '');

  QueryParams := TStringList.Create;
  QueryParams.Values['restype'] := 'container';
  QueryParams.Values['comp'] := 'acl';
  QueryParams.Values['timeout'] := FTimeout.ToString;

  url := BuildQueryParameterString(url, QueryParams, False, True);

  Response := nil;
  try
    Response := IssuePutRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, ContentStream);
    Result := (Response <> nil) and (Response.ResponseCode = 200);
  finally
    Response.Free;
    ContentStream.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureBlobService.SetContainerACL(const AContainerName: string; ASignedIdentifiers: array of ISignedIdentifier;
  const APublicAccess: TBlobPublicAccess; const AClientRequestID: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LContentString, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LContentStream: TBytesStream;
  LSignedIdentifier: ISignedIdentifier;
begin
  if Length(ASignedIdentifiers) = 0 then
    Exit(False);

  LResponse := nil;
  LContentStream := nil;
  LQueryParams := nil;
  LHeaders := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    //Create the XML representation of the SignedIdentifiers list, to 'PUT' to the server
    LContentString := '<?xml version="1.0" encoding="utf-8"?><SignedIdentifiers>';
    for LSignedIdentifier in ASignedIdentifiers do
      LContentString := LContentString + TSignedIdentifier(LSignedIdentifier).AsXML;
    LContentString := LContentString + '</SignedIdentifiers>';

    LContentStream := TBytesStream.Create(TEncoding.UTF8.GetBytes(LContentString));
    //Add the XML's length as the Content-Length of the request
    if LContentStream.Size > 0 then
    begin
      LHeaders.Values['Content-Length'] := IntToStr(LContentStream.Size);
      LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
    end;
    if GetConnectionInfo.UseDevelopmentStorage then
      LHeaders.Values['x-ms-prop-publicaccess'] := 'true'
    else
      LHeaders.Values['x-ms-blob-public-access'] := GetPublicAccessString(APublicAccess);
    LHeaders.Values['x-ms-client-request-id'] := AClientRequestID;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');
    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['comp'] := 'acl';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 200);
  finally
    LResponse.Free;
    LContentStream.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.SetContainerMetadata(ContainerName: string; const Metadata: TStrings;
                                                ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  for I := 0 to Metadata.Count-1 do
    LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], MEtadata.ValueFromIndex[I])];
  Result := SetContainerMetadata(ContainerName, LMetadata, ResponseInfo);
end;

function TAzureBlobService.SetContainerMetadata(const AContainerName: string; AMetadata: array of TPair<string, string>;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LMetadata, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LItem: TPair<string, string>;
begin
  LResponse := nil;
  LQueryParams := nil;
  LHeaders := nil;
  LMetadata := nil;
  try
    LMetadata := TStringList.Create;
    for LItem in AMetadata do
      LMetadata.AddPair(LItem.Key, LItem.Value);

    LHeaders := BuildMetadataHeaderList(LMetaData);
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['comp'] := 'metadata';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 200);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
    LMetadata.Free;
  end;
end;

function TAzureBlobService.SnapshotBlob(ContainerName, BlobName: string; out SnapshotId: string;
                                        const LeaseId: string; Metadata: TStrings;
                                        ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], MEtadata.ValueFromIndex[I])];

  Result := SnapshotBlob(ContainerName, BlobName, LeaseId, TBlobActionConditional.Create, LMetadata,
    SnapshotId, ResponseInfo);
end;

function TAzureBlobService.SnapshotBlob(ContainerName, BlobName: string;
                                        SnapshotConditionals: TBlobActionConditional;
                                        out SnapshotId: string; const LeaseId: string;
                                        Metadata: TStrings; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], MEtadata.ValueFromIndex[I])];

  Result := SnapshotBlob(ContainerName, BlobName, LeaseId, SnapshotConditionals, LMetadata, SnapshotId, ResponseInfo);
end;

function TAzureBlobService.SnapshotBlob(const AContainerName, ABlobName, ALeaseID: string;
  ASnapshotConditionals: TBlobActionConditional; AMetadata: array of TPair<string, string>;
  out ASnapshotId: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LResponseInfo := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetaData);
    PopulateDateHeader(LHeaders, False);

    ASnapshotConditionals.PopulateHeaders(LHeaders);

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'snapshot';

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
    if Result then
      ASnapshotId := LResponseInfo.Headers.Values['x-ms-snapshot'];

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponse.Free;
    LResponseInfo.Free;
    LQueryParams.Free;;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.BuildMetadataHeaderList(const AMetadata: TStrings): TStringList;
var
  I, Count: Integer;
  MetaName: string;
begin
  Result := TStringList.Create;

  //add the specified metadata into the headers, prefixing each
  //metadata header name with 'x-ms-meta-' if it wasn't already.
  if AMetadata <> nil then
  begin
    Count := AMetadata.Count;
    for I := 0 to Count - 1 do
    begin
      MetaName := AMetadata.Names[I];
      if not AnsiStartsText('x-ms-meta-', MetaName) then
        MetaName := 'x-ms-meta-' + MetaName;
      Result.Values[MetaName] := AMetadata.ValueFromIndex[I];
    end;
  end;
end;

procedure TAzureBlobService.PopulateMetadataHeaders(const AHeaders: TStrings;
  const AMetadata: array of TPair<string, string>);
var
  LMetaName: string;
  LPair: TPair<string, string>;
begin
  //add the specified metadata into the headers, prefixing each
  //metadata header name with 'x-ms-meta-' if it wasn't already.
  for LPair in AMetadata do
  begin
    LMetaName := LPair.Key;
    if not LMetaName.StartsWith('x-ms-meta-') then
      LMetaName := 'x-ms-meta-' + LMetaName;
    AHeaders.Values[LMetaName] := LPair.Value;
  end;
end;

procedure TAzureBlobService.PopulateOptionalHeaders(const AHeaders: TStrings;
  const AOptions: array of TPair<string, string>);
var
  LPair: TPair<string, string>;
begin
  for LPair in AOptions do
    AHeaders.AddPair(LPair.Key, LPair.Value);
end;

function TAzureBlobService.PutBlobInternal(ABlobType: TAzureBlobType; const AContainerName, ABlobName, ALeaseID: string;
  const ABlockContent: TArray<Byte>; AMaximumSize, ABlobSequenceNumber: Int64;
  AOptionalHeaders, AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LContentStream: TBytesStream;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  if (ABlobType = TAzureBlobType.abtPage) and (AMaximumSize < 512) then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LContentStream := nil;
  try
    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetaData);
    PopulateOptionalHeaders(LHeaders, AOptionalHeaders);
    PopulateDateHeader(LHeaders, False);

    case ABlobType of
      abtBlock:
      begin
        LHeaders.Values['x-ms-blob-type'] := 'BlockBlob';
        LContentStream := TBytesStream.Create(ABlockContent);
        if LContentStream.Size > 0 then
          LHeaders.Values['Content-Length'] := LContentStream.Size.ToString;
        LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
      end;
      abtPage:
      begin
        LHeaders.Values['x-ms-blob-type'] := 'PageBlob';
        LHeaders.Values['x-ms-blob-content-length'] := AMaximumSize.ToString;
        if ABlobSequenceNumber > 0 then
          LHeaders.Values['x-ms-blob-sequence-number'] := ABlobSequenceNumber.ToString;
      end;
      abtAppend: LHeaders.Values['x-ms-blob-type'] := 'AppendBlob';
    end;

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContentStream);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
  finally
    LResponse.Free;
    LContentStream.Free;
    LHeaders.Free;
    LQueryParams.Free;
  end;
end;

function TAzureBlobService.CopyBlobInternal(const ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
  ASourceSnapshot, ATargetLeaseId: string; ACopyConditionals: TBlobActionConditional;
  AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix, ACopySourceVal: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if ATargetContainerName.IsEmpty or ATargetBlobName.IsEmpty or ASourceContainerName.IsEmpty or ASourceBlobName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LQueryParams := nil;
  LHeaders := nil;
  try
    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetaData);
    PopulateDateHeader(LHeaders, False);

    if ASourceContainerName.IsEmpty or ASourceContainerName.Equals(ROOT_CONTAINER) then
      ACopySourceVal := 'https://' + GetConnectionInfo.AccountName + '.blob.core.windows.net/' + ASourceBlobName
    else
      ACopySourceVal := 'https://' + GetConnectionInfo.AccountName + '.blob.core.windows.net/' + ASourceContainerName +
        '/' + ASourceBlobName;

    if not ASourceSnapshot.IsEmpty then
      ACopySourceVal := ACopySourceVal + '?snapshot=' + ASourceSnapshot;

    LHeaders.Values['x-ms-copy-source'] := ACopySourceVal;
    ACopyConditionals.PopulateHeaders(LHeaders);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, ATargetContainerName, URLEncode(ATargetBlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    LUrl := GetConnectionInfo.BlobURL + '/' + ATargetContainerName.ToLower + '/' + URLEncode(ATargetBlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 202);
  finally
    LResponse.Free;
    LHeaders.Free;
    LQueryParams.Free;
  end;
end;

function TAzureBlobService.CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName,
                                    SourceBlobName: string; CopyConditionals: TBlobActionConditional;
                                    const TargetLeaseId: string; Metadata: TStrings;
                                    ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count - 1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  Result := CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName, TargetLeaseId,
    CopyConditionals, LMetadata, ResponseInfo);
end;

function TAzureBlobService.CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName,
                                    SourceBlobName: string; const TargetLeaseId: string;
                                    Metadata: TStrings; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count - 1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  Result := CopyBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName, TargetLeaseId,
    TBlobActionConditional.Create, LMetadata, ResponseInfo);
end;

function TAzureBlobService.CopyBlob(const ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
  ATargetLeaseId: string; ACopyConditionals: TBlobActionConditional; AMetadata: array of TPair<string, string>;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := CopyBlobInternal(ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName, '',
    ATargetLeaseId, ACopyConditionals, AMetadata, AResponseInfo);
end;

function TAzureBlobService.CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName,
                                              SourceBlobName: string; const SourceSnapshot: string;
                                              CopyConditionals: TBlobActionConditional;
                                              Metadata: TStrings;
                                              ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count - 1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  Result := CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName,
    SourceSnapshot, CopyConditionals, LMetadata, ResponseInfo);
end;

function TAzureBlobService.CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName,
                                              SourceBlobName: string; const SourceSnapshot: string;
                                              Metadata: TStrings;
                                              ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count - 1 do
      LMetadata := LMetadata + [TPair<string, string>.Create(Metadata.Names[I], Metadata.ValueFromIndex[I])];

  Result := CopySnapshotToBlob(TargetContainerName, TargetBlobName, SourceContainerName, SourceBlobName, SourceSnapshot,
    TBlobActionConditional.Create, LMetadata, ResponseInfo);
end;

function TAzureBlobService.CopySnapshotToBlob(const ATargetContainerName, ATargetBlobName, ASourceContainerName,
  ASourceBlobName, ASourceSnapshot: string; ACopyConditionals: TBlobActionConditional;
  AMetadata: array of TPair<string, string>; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := CopyBlobInternal(ATargetContainerName, ATargetBlobName, ASourceContainerName, ASourceBlobName,
    ASourceSnapshot, '', ACopyConditionals, AMetadata, AResponseInfo);
end;

function TAzureBlobService.CreateContainer(ContainerName: string;
                                           MetaData: TStrings;
                                           PublicAccess: TBlobPublicAccess;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: array of TPair<string, string>;
  LPair: TPair<string, string>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
    begin
      LPair.Key := Metadata.Names[I];
      LPair.Value := Metadata.ValueFromIndex[I];
      LMetadata := LMetadata + [LPair];
    end;

  Result := CreateContainer(ContainerName, LMetadata, PublicAccess, ResponseInfo);
end;

function TAzureBlobService.CreateContainer(const AContainerName: string;
  const AMetaData: array of TPair<string, string>; APublicAccess: TBlobPublicAccess;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  LResponse := nil;
  LQueryParams := nil;
  LHeaders := nil;
  try
    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;

    LHeaders := TStringList.Create;
    PopulateMetadataHeaders(LHeaders, AMetaData);
    PopulateDateHeader(LHeaders, False);
    if APublicAccess = TBlobPublicAccess.bpaContainer then
      LHeaders.Values['x-ms-blob-public-access'] := 'container'
    else if APublicAccess = TBlobPublicAccess.bpaBlob then
      LHeaders.Values['x-ms-blob-public-access'] := 'blob';

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');
    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 201);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.CreateRootContainer(const AMetaData: array of TPair<string, string>;
  APublicAccess: TBlobPublicAccess; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := CreateContainer(ROOT_CONTAINER, AMetaData, APublicAccess, AResponseInfo);
end;

function TAzureBlobService.CreateRootContainer(MetaData: TStrings; PublicAccess: TBlobPublicAccess;
                                               ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: array of TPair<string, string>;
  LPair: TPair<string, string>;
  I: Integer;
begin
  if Metadata <> nil then
    for I := 0 to Metadata.Count-1 do
    begin
      LPair.Key := Metadata.Names[I];
      LPair.Value := Metadata.ValueFromIndex[I];
      LMetadata := LMetadata + [LPair];
    end;

  Result := CreateContainer(ROOT_CONTAINER, LMetadata, PublicAccess, ResponseInfo);
end;

function TAzureBlobService.DeleteBlob(ContainerName, BlobName: string): Boolean;
begin
  Result := DeleteBlob(ContainerName, BlobName, False, '', nil);
end;

function TAzureBlobService.DeleteBlob(const AContainerName, ABlobName: string; AOnlySnapshots: Boolean;
  const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := DeleteBlobInternal(AContainerName, ABlobName, '', AOnlySnapshots, ALeaseId, AResponseInfo);
end;

function TAzureBlobService.DeleteBlobSnapshot(ContainerName, BlobName, SnapShot: string): Boolean;
begin
  Result := DeleteBlobSnapshot(ContainerName, BlobName, SnapShot, '', nil);
end;

function TAzureBlobService.DeleteBlobSnapshot(const AContainerName, ABlobName, ASnapShot, ALeaseId: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  if ASnapShot.IsEmpty then
    Exit(False);

  Result := DeleteBlobInternal(AContainerName, ABlobName, ASnapShot, True, ALeaseId, AResponseInfo);
end;

function TAzureBlobService.DeleteBlobInternal(const AContainerName, ABlobName, ASnapShot: string;
  AOnlySnapshots: Boolean; const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not ASnapShot.IsEmpty then
      LQueryParams.Values['snapshot'] := ASnapShot
    else
    begin
      //Controls if only the snapshots should be deleted, or the whole blob
      if AOnlySnapshots then
        LHeaders.Values['x-ms-delete-snapshots'] := 'only'
      else
        LHeaders.Values['x-ms-delete-snapshots'] := 'include';
    end;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssueDeleteRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (LResponse <> nil) and (LResponse.ResponseCode = 202);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.DeleteContainer(ContainerName: string): Boolean;
begin
  Result := DeleteContainer(ContainerName, nil);
end;

function TAzureBlobService.DeleteContainer(const AContainerName: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  Response: TCloudHTTP;
begin
  Response := nil;
  LQueryParams := nil;
  LHeaders := nil;
  try
    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');
    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    Response := IssueDeleteRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);
    Result := (Response <> nil) and (Response.ResponseCode = 202);
  finally
    Response.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.DeleteRootContainer(const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := DeleteContainer(ROOT_CONTAINER, AResponseInfo);
end;

function TAzureBlobService.GetBlobInternal(const AContainerName, ABlobName, ASnapshot, ALeaseId: string;
  AStartByte, AEndByte: Int64; AGetAsHash: Boolean; out AMetadata, AProperties: TArray<TPair<string, string>>;
  AResponseContent: TStream; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LHeaderName, LQueryPrefix, LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  I: Integer;
  LResponseInfo: TCloudResponseInfo;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit(False);

  LHeaders := nil;
  LResponse := nil;
  LQueryParams := nil;
  LResponseInfo := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not ASnapshot.IsEmpty then
      LQueryParams.Values['snapshot'] := ASnapshot;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    //Populate Range, and possibly also x-ms-range-get-content-md5
    if AEndByte > AStartByte then
    begin
      LHeaders.Values['x-ms-range'] := 'bytes=' + AStartByte.ToString + '-' + AEndByte.ToString;
      if AGetAsHash then
        LHeaders.Values['x-ms-range-get-content-md5'] := 'true'
    end;

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo, AResponseContent);
    Result := (LResponse <> nil) and ((LResponse.ResponseCode = 200) or (LResponse.ResponseCode = 206));

    //If the request was successful, populate the metadata and properties lists
    if Result then
      for I := 0 to LResponseInfo.Headers.Count - 1 do
      begin
        LHeaderName := LResponseInfo.Headers.Names[I];
        if LHeaderName.StartsWith('x-ms-meta-') then
          AMetadata := AMetadata + [TPair<string, string>.Create(LHeaderName, LResponseInfo.Headers.ValueFromIndex[I])]
        else
          AProperties := AProperties + [TPair<string, string>.Create(LHeaderName, LResponseInfo.Headers.ValueFromIndex[I])]
      end;

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponseInfo.Free;
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetBlob(ContainerName, BlobName: string; BlobStream: TStream; StartByte,
                                   EndByte: int64; GetAsHash: Boolean; const LeaseId: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
begin
  Result := GetBlob(ContainerName, BlobName, LeaseId, StartByte, EndByte, GetAsHash, LProperties, LMetadata,
    BlobStream, ResponseInfo);
end;

function TAzureBlobService.GetBlob(ContainerName, BlobName: string; BlobStream: TStream; out Properties,
                                   Metadata: TStrings; StartByte, EndByte: int64;
                                   GetAsHash: Boolean; const LeaseId: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
  LItem: TPair<string, string>;
begin
  Result := GetBlob(ContainerName, BlobName, LeaseId, StartByte, EndByte, GetAsHash, LProperties, LMetadata,
    BlobStream, ResponseInfo);

  if Length(LProperties) > 0 then
  begin
    Properties := TStringList.Create;
    for LItem in LProperties do
      Properties.AddPair(LItem.Key, LItem.Value);
  end;

  if Length(LMetadata) > 0 then
  begin
    Metadata := TStringList.Create;
    for LItem in LMetadata do
      Metadata.AddPair(LItem.Key, LItem.Value);
  end;
end;

function TAzureBlobService.GetBlob(const AContainerName, ABlobName, ALeaseId: string; AStartByte, AEndByte: int64;
  AGetAsHash: Boolean; out AProperties, AMetadata: TArray<TPair<string, string>>;
  ABlobStream: TStream; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := GetBlobInternal(AContainerName, ABlobName, '', ALeaseId, AStartByte, AEndByte, AGetAsHash, AMetadata,
    AProperties, ABlobStream, AResponseInfo);
end;

function TAzureBlobService.GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                                   const LeaseId: string; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
begin
  Result := GetBlob(ContainerName, BlobName, LeaseId, 0, 0, False, LProperties, LMetadata, BlobStream, ResponseInfo);
end;

function TAzureBlobService.GetBlob(ContainerName, BlobName: string; BlobStream: TStream;
                                   out Properties, Metadata: TStrings; const LeaseId: string;
                                   ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
  LItem: TPair<string, string>;
begin
  Result := GetBlob(ContainerName, BlobName, LeaseId, 0, 0, False, LProperties, LMetadata, BlobStream, ResponseInfo);

  if Length(LProperties) > 0 then
  begin
    Properties := TStringList.Create;
    for LItem in LProperties do
      Properties.AddPair(LItem.Key, LItem.Value);
  end;

  if Length(LMetadata) > 0 then
  begin
    Metadata := TStringList.Create;
    for LItem in LMetadata do
      Metadata.AddPair(LItem.Key, LItem.Value);
  end;
end;

function TAzureBlobService.GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                                           StartByte, EndByte: int64; GetAsHash: Boolean;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
begin
  Result := GetBlobSnapshot(ContainerName, BlobName, Snapshot, '', StartByte, EndByte, GetAsHash, LMetadata,
    LProperties, SnapshotStream, ResponseInfo);
end;

procedure TAzureBlobService.GetBlobServiceProperties(const AProperties: TStorageServiceProperties; const AResponseInfo: TCloudResponseInfo);
begin
  AProperties.LoadFromXML(GetBlobServicePropertiesXML(AResponseInfo))
end;

function TAzureBlobService.GetBlobServicePropertiesXML(const AResponseInfo: TCloudResponseInfo): String;
var
  LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LQueryPrefix: string;
  LResponse: TCloudHTTP;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'service';
    LQueryParams.Values['comp'] := 'properties';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, '', '');
    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/', LQueryParams, False, True);

    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
  end;
end;

function TAzureBlobService.GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                                           out Properties, Metadata: TStrings; StartByte, EndByte: int64;
                                           GetAsHash: Boolean;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
  LItem: TPair<string, string>;
begin
  Result := GetBlobSnapshot(ContainerName, BlobName, Snapshot, '', StartByte, EndByte, GetAsHash, LMetadata,
    LProperties, SnapshotStream, ResponseInfo);

  if Length(LProperties) > 0 then
  begin
    Properties := TStringList.Create;
    for LItem in LProperties do
      Properties.AddPair(LItem.Key, LItem.Value);
  end;

  if Length(LMetadata) > 0 then
  begin
    Metadata := TStringList.Create;
    for LItem in LMetadata do
      Metadata.AddPair(LItem.Key, LItem.Value);
  end;
end;

function TAzureBlobService.GetBlobSnapshot(const AContainerName, ABlobName, ASnapshot, ALeaseId: string;
  AStartByte, AEndByte: Int64; AGetAsHash: Boolean; out AProperties, AMetadata: TArray<TPair<string, string>>;
  out ASnapshotStream: TStream; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  Result := GetBlobInternal(AContainerName, ABlobName, ASnapshot, ALeaseId, AStartByte, AEndByte, AGetAsHash,
    AMetadata, AProperties, ASnapshotStream, AResponseInfo);
end;

function TAzureBlobService.GetBlockListXML(ContainerName, BlobName: string;
                                           BlockType: TAzureQueryIncludeBlockType;
                                           const SnapShot, LeaseId: string; ResponseInfo: TCloudResponseInfo): string;
var
  url: string;
  Headers: TStringList;
  QueryPrefix: string;
  QueryParams: TStringList;
  Response: TCloudHTTP;
begin
  if (ContainerName = EmptyStr) or (BlobName = EmptyStr) then
    Exit(EmptyStr);

  ContainerName := AnsiLowerCase(ContainerName);

  Headers := TStringList.Create;
  PopulateDateHeader(Headers, False);
  if LeaseId <> EmptyStr then
    Headers.Values['x-ms-lease-id'] := LeaseId;

  QueryParams := TStringList.Create;
  QueryParams.Values['comp'] := 'blocklist';
  if Snapshot <> EmptyStr then
    QueryParams.Values['snapshot'] := Snapshot;

  if BlockType = aqbtUncommitted then
    QueryParams.Values['blocklisttype'] := 'uncommitted'
  else if BlockType = aqbtCommitted then
    QueryParams.Values['blocklisttype'] := 'committed'
  else if BlockType = aqbtAll then
    QueryParams.Values['blocklisttype'] := 'all';
  QueryParams.Values['timeout'] := FTimeout.ToString;

  url := Format('%s/%s/%s', [GetConnectionInfo.BlobURL, ContainerName, URLEncode(BlobName)]);
  url := BuildQueryParameterString(url, QueryParams, False, True);

  QueryPrefix := GetBlobContainerQueryPrefix(Headers, ContainerName, URLEncode(BlobName));

  Response := nil;
  try
    Response := IssueGetRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo, Result);
    if (Response = nil) or (Response.ResponseCode <> 200) then
      Result := '';
  finally
    Response.Free;
    QueryParams.Free;
    Headers.Free;
  end;
end;

function TAzureBlobService.GetBlockListXML(const AContainerName, ABlobName, ALeaseID, ASnapShot: string;
  ABlockType: TAzureQueryIncludeBlockType; const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit('');

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'blocklist';
    if not ASnapshot.IsEmpty then
      LQueryParams.Values['snapshot'] := ASnapshot;
    case ABlockType of
      aqbtCommitted: LQueryParams.Values['blocklisttype'] := 'committed';
      aqbtUncommitted: LQueryParams.Values['blocklisttype'] := 'uncommitted';
      aqbtAll: LQueryParams.Values['blocklisttype'] := 'all';
    end;
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
    if (LResponse = nil) or (LResponse.ResponseCode <> 200) then
      Result := '';
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetBlockList(ContainerName, BlobName: string;
                                        BlockType: TAzureQueryIncludeBlockType;
                                        const SnapShot, LeaseId: string;
                                        ResponseInfo: TCloudResponseInfo): TList<TAzureBlockListItem>;
var
  LList: TArray<TAzureBlockListItem>;
  LItem: TAzureBlockListItem;
  LResponseXML: string;
begin
  Result := TList<TAzureBlockListItem>.Create;
  LList := GetBlockList(ContainerName, BlobName, LeaseID, SnapShot, BlockType, LResponseXML, ResponseInfo);

  if Length(LList) > 0 then
    for LItem in LList do
      Result.Add(LItem);
end;

function TAzureBlobService.GetBlockList(const AContainerName, ABlobName, ALeaseId, ASnapshot: string;
  ABlockType: TAzureQueryIncludeBlockType; out AResponseXML: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlockListItem>;
var
  LXmlDoc: IXMLDocument;
  LRootNode, LContainerNode: IXMLNode;
begin
  AResponseXML := GetBlockListXML(AContainerName, ABlobName, ALeaseId, ASnapshot, ABlockType, AResponseInfo);

  if not AResponseXML.IsEmpty then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(AResponseXML);
    LRootNode := LXmlDoc.DocumentElement;

    LContainerNode := GetFirstMatchingChildNode(LRootNode, 'CommittedBlocks');
    Result := ParseBlockItemsFromNode(LContainerNode, TAzureBlockType.abtCommitted);

    LContainerNode := GetFirstMatchingChildNode(LRootNode, 'UncommittedBlocks');
    Result := Result + ParseBlockItemsFromNode(LContainerNode, TAzureBlockType.abtUncommitted);
  end;
end;

function TAzureBlobService.ParseBlockItemsFromNode(ABlocksNode: IXMLNode; ABlockType: TAzureBlockType): TArray<TAzureBlockListItem>;
var
  LBlockNode, SubNode: IXMLNode;
  LName, LSize: string;
begin
  if (ABlocksNode = nil) or not ABlocksNode.HasChildNodes then
    Exit;

  LBlockNode := ABlocksNode.ChildNodes.First;

  while LBlockNode <> nil do
  begin
    LName := '';
    LSize := '';

    if LBlockNode.HasChildNodes then
    begin
      SubNode := LBlockNode.ChildNodes.First;
      while SubNode <> nil do
      begin
        if SubNode.NodeName.Equals('Name') then
          LName := SubNode.Text
        else if SubNode.NodeName.Equals('Size') then
          LSize := SubNode.Text;

        SubNode := SubNode.NextSibling;
      end;
    end;

    if not LName.IsEmpty and not LSize.IsEmpty then
      Result := Result + [TAzureBlockListItem.Create(LName, ABlockType, LSize)];

    LBlockNode := LBlockNode.NextSibling;
  end;
end;

function TAzureBlobService.AppendBlock(const AContainerName, ABlobName: string; AContent: TArray<Byte>;
  const AContentMD5, ALeaseId, AClientRequestID: string; AMaxSize, AAppendPos: Integer;
  const AActionConditional: TBlobActionConditional; const AResponseInfo: TCloudResponseInfo): boolean;
var
  LUrl: string;
  LContent: TBytesStream;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  LResponse := nil;
  LContent := nil;
  LQueryParams := nil;
  LHeaders := nil;

  try
    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);

    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';

    if AContentMD5 <> '' then
      LHeaders.Values['Content-MD5'] := AContentMD5;

    if ALeaseId <> '' then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    //issuing a put, so need content length
    if (AContent <> nil) AND (Length(AContent) > 0) then
    begin
      LContent := TBytesStream.Create(AContent);
      LHeaders.Values['Content-Type'] := 'application/x-www-form-urlencoded';
      LHeaders.Values['Content-Length'] := IntToStr(LContent.Size);
    end;

    if AMaxSize > 0 then
      LHeaders.Values['x-ms-blob-condition-maxsize'] := AMaxSize.ToString;

    if AAppendPos <> -1 then
      LHeaders.Values['x-ms-blob-condition-appendpos'] := AAppendPos.ToString;

    //add the conditional headers, if any are set
    AActionConditional.PopulateHeaders(LHeaders);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'appendblock';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, LContent);
    Result := LResponse.ResponseCode = 201;
  finally
    LResponse.Free;
    LContent.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
begin
  Result := GetBlobSnapshot(ContainerName, BlobName, Snapshot, '', 0, 0, False, LMetadata, LProperties,
    SnapshotStream, ResponseInfo);
end;

function TAzureBlobService.GetBlobSnapshot(ContainerName, BlobName, Snapshot: string; SnapshotStream: TStream;
                                           out Properties, Metadata: TStrings;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata, LProperties: TArray<TPair<string, string>>;
  LItem: TPair<string, string>;
begin
  Result := GetBlobSnapshot(ContainerName, BlobName, Snapshot, '', 0, 0, False, LMetadata, LProperties,
    SnapshotStream, ResponseInfo);

  if Length(LProperties) > 0 then
  begin
    Properties := TStringList.Create;
    for LItem in LProperties do
      Properties.AddPair(LItem.Key, LItem.Value);
  end;

  if Length(LMetadata) > 0 then
  begin
    Metadata := TStringList.Create;
    for LItem in LMetadata do
      Metadata.AddPair(LItem.Key, LItem.Value);
  end;
end;

function TAzureBlobService.GetContainerProperties(ContainerName: string; out Properties: TStrings;
                                                  ResponseInfo: TCloudResponseInfo): Boolean;
var
  LProperties: TArray<TPair<string, string>>;
  LProperty: TPair<string, string>;
begin
  Result := False;
  Properties := nil;

  LProperties := GetContainerProperties(ContainerName, ResponseInfo);
  if Length(LProperties) > 0 then
  begin
    Result := True;
    Properties := TStringList.Create;
    for LProperty in LProperties do
      Properties.AddPair(LProperty.Key, LProperty.Value)
  end;
end;

function TAzureBlobService.GetBlobContainerQueryPrefix(const AHeaders: TStrings; const AContainerName,
  ABlobName: string): string;
begin
  AHeaders.Values['x-ms-version'] := '2015-02-21';
  if GetConnectionInfo.UseDevelopmentStorage then
    Result := '/' + GetConnectionInfo.AccountName + '/' + GetConnectionInfo.AccountName + '/' + AContainerName
  else
    Result := '/' + GetConnectionInfo.AccountName + '/' + AContainerName;
  if not ABlobName.IsEmpty then
    Result := Result + '/' + ABlobName;
end;

function TAzureBlobService.GetBlobMetadata(ContainerName, BlobName: string; out Metadata: TStrings;
                                           const Snapshot, LeaseId: string;
                                           ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  LItem: TPair<string, string>;
  LResponseInfo: TCloudResponseInfo;
begin
  Metadata := nil;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    LMetadata := GetBlobMetadata(ContainerName, BlobName, Snapshot, LeaseId, LResponseInfo);
    if ResponseInfo <> nil then
      ResponseInfo.Assign(LResponseInfo);

    Result := LResponseInfo.StatusCode = 200;
    if Result then
    begin
      Metadata := TStringList.Create;
      for LItem in LMetadata do
        Metadata.AddPair(LItem.Key, LItem.Value)
    end;
  finally
    LResponseInfo.Free;
  end;
end;

function TAzureBlobService.GetBlobMetadata(const AContainerName: string; const ABlobName: string; const ASnapshot: string;
  const ALeaseId: string; const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>;
var
  LHeaderName, LQueryPrefix, LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  I: Integer;
begin
  LHeaders := nil;
  LQueryParams := nil;
  LResponseInfo := nil;
  LResponse := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'metadata';
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not ASnapshot.IsEmpty then
      LQueryParams.Values['snapshot'] := ASnapshot;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);

    if (LResponse <> nil) and (LResponse.ResponseCode = 200) then
    begin
      for I := 0 to LResponseInfo.Headers.Count - 1 do
      begin
        LHeaderName := LResponseInfo.Headers.Names[I];
        if LHeaderName.StartsWith('x-ms-meta-') then
          Result := Result + [TPair<string, string>.Create(LHeaderName, LResponseInfo.Headers.ValueFromIndex[I])];
      end;
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponseInfo.Free;
    LResponse.Free;
    LHeaders.Free;
    LQueryParams.Free;
  end;
end;

function TAzureBlobService.GetBlobProperties(ContainerName, BlobName: string; out Properties: TStrings;
                                             const Snapshot, LeaseId: string;
                                             ResponseInfo: TCloudResponseInfo): Boolean;
var
  LProperties: TArray<TPair<string, string>>;
  LProperty: TPair<string, string>;
begin
  LProperties := GetBlobProperties(ContainerName, BlobName, LeaseId, Snapshot, ResponseInfo);
  if Length(LProperties) > 0 then
  begin
    Result := True;
    Properties := TStringList.Create;
    for LProperty in LProperties do
      Properties.AddPair(LProperty.Key, LProperty.Value);
  end
  else
    Result := False;
end;

function TAzureBlobService.GetBlobProperties(ContainerName, BlobName: string; out Properties,
                                             Metadata: TStrings; const Snapshot, LeaseId: string;
                                             ResponseInfo: TCloudResponseInfo): Boolean;
var
  HeaderName, QueryPrefix, url: string;
  Headers, QueryParams: TStringList;
  Response: TCloudHTTP;
  FreeResponseInfo: Boolean;
  I, Count: Integer;
begin
  Properties := nil;
  Metadata := nil;

  if (ContainerName = EmptyStr) or (BlobName = EmptyStr) then
    Exit(False);

  ContainerName := AnsiLowerCase(ContainerName);

  url := string.Format('%s/%s/%s', [GetConnectionInfo.BlobURL, ContainerName, URLEncode(BlobName)]);

  Headers := TStringList.Create;
  try
    PopulateDateHeader(Headers, False);
    if LeaseId <> EmptyStr then
      headers.Values['x-ms-lease-id'] := LeaseId;

    QueryPrefix := GetBlobContainerQueryPrefix(Headers, ContainerName, URLEncode(BlobName));

    QueryParams := TStringList.Create;
    try
      QueryParams.Values['timeout'] := FTimeout.ToString;
      if Snapshot <> EmptyStr then
        QueryParams.Values['snapshot'] := Snapshot;

      url := BuildQueryParameterString(url, QueryParams, False, True);

      FreeResponseInfo := ResponseInfo = nil;
      if FreeResponseInfo then
        ResponseInfo := TCloudResponseInfo.Create;

      Response := nil;
      try
        Response := IssueHeadRequest(url, Headers, QueryParams, QueryPrefix, ResponseInfo);
        Result := (Response <> nil) and (Response.ResponseCode = 200);

        if Result then
        begin
          Properties := TStringList.Create;
          Metadata := TStringList.Create;

          //Populate the result lists based on the returned headers from the request
          Count := ResponseInfo.Headers.Count;
          for I := 0 to Count - 1 do
          begin
            HeaderName := ResponseInfo.Headers.Names[I];
            //if a header name starts with x-ms-meta- then it is a metadata header.
            //exclude the metadata header name prefix from the name returned as the metadata name
            if AnsiStartsText('x-ms-meta-', HeaderName) and (HeaderName.Length > 11) then
              Metadata.Values[HeaderName.Substring(10)] := ResponseInfo.Headers.ValueFromIndex[I]
            else if not AnsiStartsText('x-ms-', HeaderName) then
              Properties.Values[HeaderName] := ResponseInfo.Headers.ValueFromIndex[I];
          end;
        end;
      finally
        Response.Free;
        if FreeResponseInfo then
          ResponseInfo.Free;
      end;
    finally
      QueryParams.Free;
    end;
  finally
    Headers.Free;
  end;
end;

function TAzureBlobService.GetBlobProperties(const AContainerName, ABlobName, ALeaseId, ASnapshot: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>;
var
  LQueryPrefix, LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  I: Integer;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit;

  LHeaders := nil;
  LQueryParams := nil;
  LResponse := nil;
  LResponseInfo := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['timeout'] := FTimeout.ToString;
    if not ASnapshot.IsEmpty then
      LQueryParams.Values['snapshot'] := ASnapshot;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssueHeadRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    if (LResponse <> nil) and (LResponse.ResponseCode = 200) then
    begin
      //Populate the result lists based on the returned headers from the request
      for I := 0 to LResponseInfo.Headers.Count - 1 do
        if not LResponseInfo.Headers.Names[I].StartsWith('x-ms-') then
          Result := Result + [TPair<string, string>.Create(LResponseInfo.Headers.Names[I],
            LResponseInfo.Headers.ValueFromIndex[I])];
    end;
    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LHeaders.Free;
    LQueryParams.Free;
    LResponse.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureBlobService.GetContainerACLXML(ContainerName: string; out PublicAccess: TBlobPublicAccess): string;
begin
  Result := GetContainerACLXML(ContainerName, PublicAccess, nil);
end;

function TAzureBlobService.GetContainerACLXML(const AContainerName: string; out APublicAccess: TBlobPublicAccess;
  const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponsePublicAccess: string;
  LResponseInfo: TCloudResponseInfo;
begin
  APublicAccess := TBlobPublicAccess.bpaPrivate;

  LResponse := nil;
  LHeaders := nil;
  LResponseInfo := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');
    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['comp'] := 'acl';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo, Result);

    LResponsePublicAccess := LResponseInfo.Headers.Values['x-ms-blob-public-access'];
    if LResponsePublicAccess.Equals('container') then
      APublicAccess := TBlobPublicAccess.bpaContainer
    else if LResponsePublicAccess.Equals('blob') then
      APublicAccess := TBlobPublicAccess.bpaBlob;

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
    LResponseInfo.Free;
  end;
end;

function TAzureBlobService.GetContainerACL(ContainerName: string; out PublicAccess: TBlobPublicAccess;
                                           ResponseInfo: TCloudResponseInfo): TList<TSignedIdentifier>;
var
  LList: TArray<ISignedIdentifier>;
  LItem: ISignedIdentifier;
  LResponseXML: string;
begin
  Result := nil;
  LList := GetContainerACL(ContainerName, PublicAccess, LResponseXML, ResponseInfo);
  if Length(LList) > 0 then
  begin
    Result := TList<TSignedIdentifier>.Create;
    for LItem in LList do
      Result.Add(TSignedIdentifier(LItem));
  end;
end;

function TAzureBlobService.GetContainerACL(const AContainerName: string; out APublicAccess: TBlobPublicAccess;
  out AResponseXML: string; const AResponseInfo: TCloudResponseInfo): TArray<ISignedIdentifier>;
var
  LXMLDoc: IXMLDocument;
  LRootNode, LSignedNode, LChildNode, LSubChildNode: IXMLNode;
  LSignedIdentifier: TSignedIdentifier;
  LPolicy: TBlobPolicy;
begin
  AResponseXML := GetContainerACLXML(AContainerName, APublicAccess, AResponseInfo);

  if not AResponseXML.IsEmpty then
  begin
    LXMLDoc := TXMLDocument.Create(nil);
    LXMLDoc.LoadFromXML(AResponseXML);
    LRootNode := LXMLDoc.DocumentElement;

    if not LRootNode.HasChildNodes then
      Exit(nil);

    LSignedNode := LRootNode.ChildNodes.First;
    (*
       The XML looks like this:
       <SignedIdentifiers>
         <SignedIdentifier>
           <Id>unique-value</Id>
           <AccessPolicy>
             <Start>start-time</Start>
             <Expiry>expiry-time</Expiry>
             <Permission>abbreviated-permission-list</Permission>
           </AccessPolicy>
         </SignedIdentifier>
       </SignedIdentifiers>
    *)
    while LSignedNode <> nil do
    begin
      if LSignedNode.NodeName.Equals('SignedIdentifier') then
      begin
        LChildNode := GetFirstMatchingChildNode(LSignedNode, 'Id');
        LPolicy := TBlobPolicy.Create;
        try
          LSignedIdentifier := TSignedIdentifier.Create(AContainerName, LPolicy, LChildNode.Text);
          Result := Result + [LSignedIdentifier];

          LChildNode := GetFirstMatchingChildNode(LSignedNode, 'AccessPolicy');
          if (LChildNode <> nil) and (LChildNode.HasChildNodes) then
          begin
            LSubChildNode := LChildNode.ChildNodes.First;
            while LSubChildNode <> nil do
            begin
              if LSubChildNode.NodeName.Equals('Start') then
              begin
                LSignedIdentifier.AccessPolicy.Start := LSubChildNode.Text;
                LSignedIdentifier.Policy.StartDate := LSubChildNode.Text;
              end
              else if LSubChildNode.NodeName.Equals('Expiry') then
              begin
                LSignedIdentifier.AccessPolicy.Expiry := LSubChildNode.Text;
                LSignedIdentifier.Policy.ExpiryDate := LSubChildNode.Text;
              end
              else if LSubChildNode.NodeName.Equals('Permission') then
              begin
                LSignedIdentifier.AccessPolicy.Permission := LSubChildNode.Text;
                LSignedIdentifier.Policy.Permission := LSubChildNode.Text;
              end;

              LSubChildNode := LSubChildNode.NextSibling;
            end;
          end;
        finally
          LPolicy.Free;
        end;
      end;
      LSignedNode := LSignedNode.NextSibling;
    end;
  end;
end;

function TAzureBlobService.GetContainerMetadata(ContainerName: string; out Metadata: TStrings;
                                                ResponseInfo: TCloudResponseInfo): Boolean;
var
  LMetadata: TArray<TPair<string, string>>;
  LProperty: TPair<string, string>;
begin
  Result := False;
  Metadata := nil;

  LMetadata := GetContainerMetadata(ContainerName, ResponseInfo);
  if Length(LMetadata) > 0 then
  begin
    Result := True;
    Metadata := TStringList.Create;
    for LProperty in LMetadata do
      Metadata.AddPair(LProperty.Key, LProperty.Value)
  end;
end;

function TAzureBlobService.GetContainerMetadata(const AContainerName: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>;
var
  LQueryPrefix, LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  I: Integer;
begin
  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LResponseInfo := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['comp'] := 'metadata';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    if (LResponse <> nil) and (LResponse.ResponseCode = 200) then
      //Populate the result lists based on the returned headers from the request
      for I := 0 to LResponseInfo.Headers.Count-1 do
        if LResponseInfo.Headers.Names[I].StartsWith('x-ms-meta-') then
          Result := Result +
            [TPair<string, string>.Create(LResponseInfo.Headers.Names[I], LResponseInfo.Headers.ValueFromIndex[I])];

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponseInfo.Free;
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetContainerProperties(ContainerName: string; out Properties,
                                                  Metadata: TStrings; ResponseInfo: TCloudResponseInfo): Boolean;
var
  LProperties, LMetadata: TArray<TPair<string, string>>;
  LProperty: TPair<string, string>;
begin
  Properties := nil;
  Metadata := nil;

  LProperties := GetContainerProperties(ContainerName, ResponseInfo);
  LMetadata := GetContainerProperties(ContainerName, ResponseInfo);
  if (Length(LProperties) = 0) or (Length(LMetadata) = 0) then
    Exit(False);

  Result := True;
  Properties := TStringList.Create;
  for LProperty in LProperties do
    Properties.AddPair(LProperty.Key, LProperty.Value);

  Metadata := TStringList.Create;
  for LProperty in LMetadata do
    Metadata.AddPair(LProperty.Key, LProperty.Value)
end;

function TAzureBlobService.GetContainerProperties(const AContainerName: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TPair<string, string>>;
var
  LHeaderName, LQueryPrefix, LUrl: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  I: Integer;
begin
  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');

    LQueryParams := TStringList.Create;
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower;
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo);

    if (LResponse <> nil) and (LResponse.ResponseCode = 200) then
      //Populate the result lists based on the returned headers from the request
      for I := 0 to AResponseInfo.Headers.Count - 1 do
      begin
        LHeaderName := AResponseInfo.Headers.Names[I];
        if not LHeaderName.StartsWith('x-ms-meta-') then
          Result := Result + [TPair<string, string>.Create(LHeaderName, AResponseInfo.Headers.ValueFromIndex[I])];
      end;
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetPageRangesXML(const AContainerName, ABlobName, ALeaseID: string;
  AStartByte, AEndByte: Int64; const ASnapshot, APrevSnapshot: string; const AResponseInfo: TCloudResponseInfo): string;
var
  LUrl, LQueryPrefix: string;
  LHeaders, LQueryParams: TStringList;
  LResponse: TCloudHTTP;
begin
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit('');

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;

    if (AStartByte >= 0) and (AEndByte > AStartByte) then
      LHeaders.Values['x-ms-range'] := 'bytes=' + AStartByte.ToString + '-' + AEndByte.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'pagelist';
    //development storiage doesn't support the snapshot query parameter
    if not ASnapshot.IsEmpty and not GetConnectionInfo.UseDevelopmentStorage then
    begin
      LQueryParams.Values['snapshot'] := ASnapshot;
      if not APrevSnapshot.IsEmpty then
        LQueryParams.Values['prevsnapshot'] := APrevSnapshot;
    end;
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);
    LResponse := IssueGetRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, AResponseInfo, Result);
  finally
    LResponse.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.GetPageRegionsXML(ContainerName, BlobName: string; const Snapshot, LeaseId: string;
                                             ResponseInfo: TCloudResponseInfo): string;
begin
  Result := GetPageRangesXML(ContainerName, BlobName, LeaseId, 0, 0, Snapshot, '', ResponseInfo);
end;

function TAzureBlobService.GetPageRegionsXML(ContainerName, BlobName: string; StartByte, EndByte: Int64;
                                             const Snapshot, LeaseId: string;
                                             ResponseInfo: TCloudResponseInfo): string;
begin
  Result := GetPageRangesXML(ContainerName, BlobName, LeaseId, StartByte, EndByte, Snapshot, '', ResponseInfo);
end;

function TAzureBlobService.GetPageRegions(ContainerName, BlobName: string; StartByte, EndByte: Int64;
                                          const Snapshot, LeaseId: string;
                                          ResponseInfo: TCloudResponseInfo): TList<TAzureBlobPageRange>;
var
  LList: TArray<TAzureBlobPageRange>;
  LItem: TAzureBlobPageRange;
  LResponseXML: string;
begin
  Result := nil;
  LList := GetPageRanges(ContainerName, BlobName, LeaseId, StartByte, EndByte, Snapshot, '', LResponseXML, ResponseInfo);

  if Length(LList) > 0 then
  begin
    Result := TList<TAzureBlobPageRange>.Create;
    for LItem in LList do
      Result.Add(LItem);
  end;
end;

function TAzureBlobService.GetPageRegions(ContainerName, BlobName: string; const Snapshot, LeaseId: string;
                                          ResponseInfo: TCloudResponseInfo): TList<TAzureBlobPageRange>;
var
  LList: TArray<TAzureBlobPageRange>;
  LItem: TAzureBlobPageRange;
  LResponseXML: string;
begin
  Result := nil;
  LList := GetPageRanges(ContainerName, BlobName, LeaseId, 0, 0, Snapshot, '', LResponseXML, ResponseInfo);

  if Length(LList) > 0 then
  begin
    Result := TList<TAzureBlobPageRange>.Create;
    for LItem in LList do
      Result.Add(LItem);
  end;
end;

function TAzureBlobService.GetPageRanges(const AContainerName, ABlobName, ALeaseId: string; AStartByte, AEndByte: Int64;
  const ASnapshot, APrevSnapshot: string; out AResponseXML: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlobPageRange>;
var
  LXmlDoc: IXMLDocument;
  LRootNode, LPageRangeNode, LStartNode, LEndNode: IXMLNode;
begin
  AResponseXML := GetPageRangesXML(AContainerName, ABlobName, ALeaseId, AStartByte, AEndByte, ASnapshot, APrevSnapshot, AResponseInfo);

  if not AResponseXML.IsEmpty then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(AResponseXML);
    LRootNode := LXmlDoc.DocumentElement;

    if (LRootNode <> nil) and LRootNode.HasChildNodes then
    begin
      LPageRangeNode := GetFirstMatchingChildNode(LRootNode, 'PageRange');

      while LPageRangeNode <> nil do
      begin
        LStartNode := GetFirstMatchingChildNode(LPageRangeNode, 'Start');
        LEndNode := GetFirstMatchingChildNode(LPageRangeNode, 'End');
        if (LStartNode <> nil) and (LEndNode <> nil) then
          Result := Result + [TAzureBlobPageRange.Create(LStartNode.Text.ToInt64, LEndNode.Text.ToInt64)];

        LPageRangeNode := LPageRangeNode.NextSibling;
      end;
    end;
  end;
end;

function TAzureBlobService.GetPublicAccessString(APublicAccess: TBlobPublicAccess): string;
begin
  if APublicAccess = TBlobPublicAccess.bpaContainer then
    Exit('container');
  if APublicAccess = TBlobPublicAccess.bpaBlob then
    Exit('blob');
end;

function TAzureBlobService.HandleContainerLease(const AContainerName: string;
  ALeaseAction: TAzureContainerLeaseActionMode; var ALeaseId: string; const AProposedLeaseId: string;
  ALeaseDuration: Integer; out ALeaseTimeRemaining: Integer; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
  LSuccessCode: Integer;
begin
  if AContainerName.IsEmpty then
    Exit(False);

  LResponse := nil;
  LHeaders := nil;
  LQueryParams := nil;
  LResponseInfo := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);
    case ALeaseAction of
      TAzureContainerLeaseActionMode.clamAcquire:
        begin
          LHeaders.Values['x-ms-lease-action'] := 'acquire';
          if not AProposedLeaseId.IsEmpty then
            LHeaders.Values['x-ms-proposed-lease-id'] := AProposedLeaseId;
          LHeaders.Values['x-ms-lease-duration'] := ALeaseDuration.ToString;
          LSuccessCode := 201;
        end;
      TAzureContainerLeaseActionMode.clamRenew:
        begin
          LHeaders.Values['x-ms-lease-action'] := 'renew';
          LHeaders.Values['x-ms-lease-id'] := ALeaseId;
          LSuccessCode := 200;
        end;
      TAzureContainerLeaseActionMode.clamChange:
        begin
          LHeaders.Values['x-ms-lease-action'] := 'change';
          LHeaders.Values['x-ms-lease-id'] := ALeaseId;
          LHeaders.Values['x-ms-proposed-lease-id'] := AProposedLeaseId;
          LSuccessCode := 200;
        end;
      TAzureContainerLeaseActionMode.clamRelease:
        begin
          LHeaders.Values['x-ms-lease-action'] := 'release';
          LHeaders.Values['x-ms-lease-id'] := ALeaseId;
          LSuccessCode := 200;
        end;
      TAzureContainerLeaseActionMode.clamBreak:
        begin
          LHeaders.Values['x-ms-lease-action'] := 'break';
          LSuccessCode := 202;
        end;
      else
        LSuccessCode := -1;
    end;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, '');

    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'lease';
    LQueryParams.Values['restype'] := 'container';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LResponseInfo := TCloudResponseInfo.Create;
    LUrl := BuildQueryParameterString(GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower, LQueryParams, False, True);
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    Result := LResponse.ResponseCode = LSuccessCode;

    if Result then
    begin
      case ALeaseAction of
        clamAcquire: ALeaseId := LResponseInfo.Headers.Values['x-ms-lease-id'];
        clamRenew: ;
        clamChange: ;
        clamRelease: ;
        clamBreak: ALeaseTimeRemaining := LResponseInfo.Headers.Values['x-ms-lease-time'].ToInteger;
      end;
    end;

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponse.Free;
    LResponseInfo.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.HandleBlobLease(const AContainerName, ABlobName, ALeaseAction, ALeaseId,
  AProposedLeaseId: string; ALeaseDuration, ASuccessCode: Integer; out ASuccess: Boolean;
  AResponseInfo: TCloudResponseInfo): string;
var
  LUrl: string;
  LHeaders: TStringList;
  LQueryPrefix: string;
  LQueryParams: TStringList;
  LResponse: TCloudHTTP;
  LResponseInfo: TCloudResponseInfo;
begin
  ASuccess := False;
  if AContainerName.IsEmpty or ABlobName.IsEmpty then
    Exit('');

  LResponse := nil;
  LResponseInfo := nil;
  LHeaders := nil;
  LQueryParams := nil;
  try
    LHeaders := TStringList.Create;
    PopulateDateHeader(LHeaders, False);

    LHeaders.Values['x-ms-lease-action'] := ALeaseAction;
    if not ALeaseId.IsEmpty then
      LHeaders.Values['x-ms-lease-id'] := ALeaseId;
    if not AProposedLeaseId.IsEmpty then
      LHeaders.Values['x-ms-proposed-lease-id'] := AProposedLeaseId;
    if ALeaseAction.Equals('acquire') then
      LHeaders.Values['x-ms-lease-duration'] := ALeaseDuration.ToString;

    LQueryPrefix := GetBlobContainerQueryPrefix(LHeaders, AContainerName.ToLower, URLEncode(ABlobName));
    LQueryParams := TStringList.Create;
    LQueryParams.Values['comp'] := 'lease';
    LQueryParams.Values['timeout'] := FTimeout.ToString;

    LUrl := GetConnectionInfo.BlobURL + '/' + AContainerName.ToLower + '/' + URLEncode(ABlobName);
    LUrl := BuildQueryParameterString(LUrl, LQueryParams, False, True);

    LResponseInfo := TCloudResponseInfo.Create;
    LResponse := IssuePutRequest(LUrl, LHeaders, LQueryParams, LQueryPrefix, LResponseInfo);
    ASuccess := LResponse.ResponseCode = ASuccessCode;
    if ASuccess then
      Result := LResponseInfo.Headers.Values['x-ms-lease-id'];

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponse.Free;
    LResponseInfo.Free;
    LQueryParams.Free;
    LHeaders.Free;
  end;
end;

function TAzureBlobService.AcquireBlobLease(ContainerName, BlobName: string; out LeaseId: string;
                                           ResponseInfo: TCloudResponseInfo; LeaseDuration: Integer;
                                           const ProposedLeaseID: string): Boolean;
begin
  Result := AcquireBlobLease(ContainerName, BlobName, LeaseId, ProposedLeaseID, LeaseDuration, ResponseInfo);
end;

function TAzureBlobService.AcquireBlobLease(const AContainerName, ABlobName: string; out ALeaseId: string;
  const AProposedLeaseID: string; ALeaseDuration: Integer; const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  ALeaseId := HandleBlobLease(AContainerName, ABlobName, 'acquire', '', AProposedLeaseID, ALeaseDuration, 201, Result,
    AResponseInfo);
end;

function TAzureBlobService.AcquireContainerLease(const AContainerName: string; var ALeaseId: string;
  ALeaseDuration: Integer; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  ALeaseTimeRemaining: Integer;
begin
  Result := HandleContainerLease(AContainerName, TAzureContainerLeaseActionMode.clamAcquire, ALeaseId, ALeaseId,
    ALeaseDuration, ALeaseTimeRemaining, AResponseInfo);
end;

function TAzureBlobService.RenewBlobLease(ContainerName, BlobName, LeaseId: string): Boolean;
begin
  Result := RenewBlobLease(ContainerName, BlobName, LeaseId, nil);
end;

function TAzureBlobService.RenewBlobLease(const AContainerName, ABlobName, ALeaseId: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  HandleBlobLease(AContainerName, ABlobName, 'renew', ALeaseId, '', -1, 200, Result, AResponseInfo);
end;

function TAzureBlobService.RenewContainerLease(const AContainerName: string; var ALeaseId: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LLeaseTimeRemaining: Integer;
begin
  Result := HandleContainerLease(AContainerName, TAzureContainerLeaseActionMode.clamRenew, ALeaseId, '', -1,
    LLeaseTimeRemaining, AResponseInfo);
end;

function TAzureBlobService.ReleaseBlobLease(ContainerName, BlobName, LeaseId: string): Boolean;
begin
  Result := ReleaseBlobLease(ContainerName, BlobName, LeaseId, nil);
end;

function TAzureBlobService.ReleaseBlobLease(const AContainerName, ABlobName, ALeaseId: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  HandleBlobLease(AContainerName, ABlobName, 'release', ALeaseId, '', -1, 200, Result, AResponseInfo);
end;

function TAzureBlobService.ReleaseContainerLease(const AContainerName: string; var ALeaseId: string): Boolean;
begin
  Result := ReleaseContainerLease(AContainerName, ALeaseId, nil);
end;

function TAzureBlobService.ReleaseContainerLease(const AContainerName: string; var ALeaseId: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LLeaseTimeRemaining: Integer;
begin
  Result := HandleContainerLease(AContainerName, TAzureContainerLeaseActionMode.clamRelease, ALeaseId, '', -1,
    LLeaseTimeRemaining, AResponseInfo);
end;

function TAzureBlobService.BreakBlobLease(ContainerName, BlobName: string; out LeaseTimeRemaining: Integer): Boolean;
begin
  Result := BreakBlobLease(ContainerName, BlobName, LeaseTimeRemaining, nil);
end;

function TAzureBlobService.BreakBlobLease(const AContainerName, ABlobName: string; out ALeaseTimeRemaining: Integer;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LResponseInfo: TCloudResponseInfo;
  LTimeRemaining: string;
begin
  ALeaseTimeRemaining := -1;
  LResponseInfo := TCloudResponseInfo.Create;
  try
    HandleBlobLease(AContainerName, ABlobName, 'break', '', '', -1, 202, Result, LResponseInfo);
    if Result then
    begin
      LTimeRemaining := LResponseInfo.Headers.Values['x-ms-lease-time'];
      if not LTimeRemaining.IsEmpty then
        ALeasetimeRemaining := LTimeRemaining.ToInteger;
    end;

    if AResponseInfo <> nil then
      AResponseInfo.Assign(LResponseInfo);
  finally
    LResponseInfo.Free;
  end;
end;

function TAzureBlobService.BreakContainerLease(const AContainerName: string; out ALeaseTimeRemaining: Integer;
  const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LLeaseID: string;
begin
  Result := HandleContainerLease(AContainerName, TAzureContainerLeaseActionMode.clamBreak, LLeaseID, '', -1,
    ALeaseTimeRemaining, AResponseInfo);
end;

function TAzureBlobService.ChangeBlobLease(const AContainerName, ABlobName, ALeaseID, AProposedLeaseID: string;
  const AResponseInfo: TCloudResponseInfo): Boolean;
begin
  HandleBlobLease(AContainerName, ABlobName, 'change', ALeaseID, AProposedLeaseID, -1, 200, Result, AResponseInfo);
end;

function TAzureBlobService.ChangeContainerLease(const AContainerName: string; var ALeaseID: string;
  const AProposedLeaseID: string; const AResponseInfo: TCloudResponseInfo): Boolean;
var
  LLeaseTimeRemaining: Integer;
begin
  Result := HandleContainerLease(AContainerName, TAzureContainerLeaseActionMode.clamChange, ALeaseID, AProposedLeaseID,
    -1, LLeaseTimeRemaining, AResponseInfo);
end;

class procedure TAzureBlobService.GetOptionalParams(OptionalParams: TStrings; var APrefix, ADelimiter, AMarker: string;
  ADatasets: TAzureBlobDatasets);
var
  LInclude: string;
begin
  if OptionalParams <> nil then
  begin
    APrefix := OptionalParams.Values['prefix'];
    ADelimiter := OptionalParams.Values['delimiter'];
    AMarker := OptionalParams.Values['marker'];
    LInclude := OptionalParams.Values['include'];
  end
  else
  begin
    APrefix := '';
    ADelimiter := '';
    AMarker := '';
    LInclude := '';
  end;
  ADatasets := [];
  if LInclude.Contains('snapshots') then ADatasets := ADatasets + [TAzureBlobDataset.bdsSnapshots];
  if LInclude.Contains('metadata') then ADatasets := ADatasets + [TAzureBlobDataset.bdsMetadata];
  if LInclude.Contains('uncommittedblobs') then ADatasets := ADatasets + [TAzureBlobDataset.bdsUncommitedBlobs];
  if LInclude.Contains('copy') then ADatasets := ADatasets + [TAzureBlobDataset.bdsCopy];
end;

function TAzureBlobService.ListBlobs(ContainerName: string; OptionalParams: TStrings;
                                     ResponseInfo: TCloudResponseInfo): TList<TAzureBlob>;
var
  LNextMarker, LPrefix, LDelimiter, LMarker, LResponseXML: string;
  LDatasets: TAzureBlobDatasets;
  LListBlobs: TArray<TAzureBlobItem>;
  LBlobItem: TAzureBlobItem;
  LBlobPrefix: TArray<string>;
begin
  GetOptionalParams(OptionalParams, LPrefix, LDelimiter, LMarker, LDatasets);
  LListBlobs := ListBlobs(ContainerName, LPrefix, LDelimiter, LMarker, 0, LDatasets, LNextMarker, LBlobPrefix, LResponseXML, ResponseInfo);

  Result := TList<TAzureBlob>.Create;
  for LBlobItem in LListBlobs do
    Result.Add(TAzureBlob.CreateFromRecord(LBlobItem));
end;

function TAzureBlobService.ListBlobs(ContainerName: string; out NextMarker: string;
                                     OptionalParams: TStrings;
                                     ResponseInfo: TCloudResponseInfo): TList<TAzureBlob>;
var
  LPrefix, LDelimiter, LMarker, LResponseXML: string;
  LDatasets: TAzureBlobDatasets;
  LListBlobs: TArray<TAzureBlobItem>;
  LBlobItem: TAzureBlobItem;
  LBlobPrefix: TArray<string>;
begin
  GetOptionalParams(OptionalParams, LPrefix, LDelimiter, LMarker, LDatasets);
  LListBlobs := ListBlobs(ContainerName, LPrefix, LDelimiter, LMarker, 0, LDatasets, NextMarker, LBlobPrefix, LResponseXML, ResponseInfo);

  Result := TList<TAzureBlob>.Create;
  for LBlobItem in LListBlobs do
    Result.Add(TAzureBlob.CreateFromRecord(LBlobItem));
end;

function TAzureBlobService.ListBlobs(const AContainerName: string; const APrefix: string; const ADelimiter: string;
  const AMarker: string; AMaxResult: Integer; ADatasets: TAzureBlobDatasets; out ANextMarker: string;
  out ABlobPrefix: TArray<string>; out AResponseXML: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TAzureBlobItem>;
var
  LXmlDoc: IXMLDocument;
  LRootNode, LBlobsNode, LBlobNode, LNextMarkerNode, LBlobPrefixNode: IXMLNode;
  LBlob: TAzureBlobItem;
begin
  AResponseXML := ListBlobsXML(AContainerName, APrefix, ADelimiter, AMarker, AMaxResult,  ADatasets, AResponseInfo);

  if not AResponseXML.IsEmpty then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(AResponseXML);
    LRootNode := LXmlDoc.DocumentElement;

    if (LRootNode <> nil) and (LRootNode.HasChildNodes) then
    begin
      LNextMarkerNode := LRootNode.ChildNodes.FindNode('NextMarker');
      if LNextMarkerNode <> nil then
        ANextMarker := LNextMarkerNode.Text;

      LBlobsNode := GetFirstMatchingChildNode(LRootNode, 'Blobs');
      if (LBlobsNode <> nil) and LBlobsNode.HasChildNodes then
        LBlobNode := LBlobsNode.ChildNodes.First;

      while LBlobNode <> nil do
      begin
        if LBlobNode.NodeName.Equals('Blob') then
        begin
          LBlob := ParseBlobFromNode(LBlobNode);
          LBlob.Url := LRootNode.Attributes['ServiceEndpoint'] + LRootNode.Attributes['ContainerName'] + '/' + LBlob.Name;
          Result := Result + [LBlob];
        end
        // If the node is a 'BlobPrefix' node, instead of a full blob, just get the prefix name
        // this is used for virtual-drectory iteration through a blob list, using 'prefix' and 'delimiter'
        else if LBlobNode.NodeName.Equals('BlobPrefix') then
        begin
          LBlobPrefixNode := GetFirstMatchingChildNode(LBlobNode, 'Name');
          while LBlobPrefixNode <> nil do
          begin
            // create a 'prefix' blob and add it to the result
            // this is a placeholder for all blobs that have names starting
            // with the specified prefix, and containing the specified delimiter
            LBlob := Default(TAzureBlobItem);
            LBlob.Name := LBlobPrefixNode.Text;
            LBlob.Url := LRootNode.Attributes['ServiceEndpoint'] + LRootNode.Attributes['ContainerName'] + '/' + LBlob.Name;
            LBlob.BlobType := TAzureBlobType.abtPrefix;
            Result := Result + [LBlob];

            ABlobPrefix := ABlobPrefix + [LBlobPrefixNode.Text];
            LBlobPrefixNode := LBlobPrefixNode.NextSibling;
          end;
        end;
        LBlobNode := LBlobNode.NextSibling;
      end;
    end;
  end;
end;

function TAzureBlobService.ListBlobsXML(ContainerName: string; OptionalParams: TStrings;
                                        ResponseInfo: TCloudResponseInfo): string;
var
  LPrefix, LDelimiter, LMarker: string;
  LDatasets: TAzureBlobDatasets;
begin
  GetOptionalParams(OptionalParams, LPrefix, LDelimiter, LMarker, LDatasets);
  Result := ListBlobsXML(ContainerName, LPrefix, LDelimiter, LMarker, 0, LDatasets, ResponseInfo);
end;

function TAzureBlobService.ListContainers(OptionalParams: TStrings;
                                          ResponseInfo: TCloudResponseInfo): TList<TAzureContainer>;
var
  LNextMarker, LResponseXML: string;
  LResult: TArray<TAzureContainerItem>;
  LItem: TAzureContainerItem;
begin
  Result := nil;

  LResult := ListContainers(False, '', '', 0, LNextMarker, LResponseXML, ResponseInfo);
  if Length(LResult) > 0 then
  begin
    Result := TList<TAzureContainer>.Create;
    for LItem in LResult do
      Result.Add(TAzureContainer.CreateFromRecord(LItem));
  end;
end;

function TAzureBlobService.ListContainers(out NextMarker: string; OptionalParams: TStrings;
                                          ResponseInfo: TCloudResponseInfo): TList<TAzureContainer>;
var
  LResponseXML: string;
  LResult: TArray<TAzureContainerItem>;
  LItem: TAzureContainerItem;
begin
  Result := nil;

  LResult := ListContainers(False, '', '', 0, NextMarker, LResponseXML, ResponseInfo);
  if Length(LResult) > 0 then
  begin
    Result := TList<TAzureContainer>.Create;
    for LItem in LResult do
      Result.Add(TAzureContainer.CreateFromRecord(LItem));
  end;
end;

function TAzureBlobService.ListContainers(AIncludeMetadata: Boolean; const APrefix: string; const AMarker: string;
  AMaxResult: Integer; out ANextMarker: string; out AResponseXML: string;
  const AResponseInfo: TCloudResponseInfo): TArray<TAzureContainerItem>;
var
  LXmlDoc: IXMLDocument;
  LRootNode, LContainersNode, LContainerNode, LNextMarkerNode: IXMLNode;
begin
  AResponseXML := ListContainersXML(AIncludeMetadata, APrefix, AMarker, AMaxResult, AResponseInfo);

  if not AResponseXML.IsEmpty then
  begin
    LXmlDoc := TXMLDocument.Create(nil);
    LXmlDoc.LoadFromXML(AResponseXML);
    LRootNode := LXmlDoc.DocumentElement;

    if (LRootNode <> nil) and (LRootNode.HasChildNodes) then
    begin
      LNextMarkerNode := LRootNode.ChildNodes.FindNode('NextMarker');
      if LNextMarkerNode <> nil then
        ANextMarker := LNextMarkerNode.Text;

      LContainersNode := GetFirstMatchingChildNode(LRootNode, 'Containers');
      if (LContainersNode <> nil) and LContainersNode.HasChildNodes then
        LContainerNode := LContainersNode.ChildNodes.First;

      while LContainerNode <> nil do
      begin
        Result := Result + [ParseContainerFromNode(LContainerNode)];
        LContainerNode := LContainerNode.NextSibling;
      end;
    end;
  end;
end;

{ TAzureContainerRecord }

function TAzureContainerItem.IsRoot: Boolean;
begin
  Result := Name = ROOT_CONTAINER;
end;

{ TAzureContainer }

class function TAzureContainer.CreateFromRecord(AAzureContainer: TAzureContainerItem): TAzureContainer;
var
  LItem: TPair<string, string>;
begin
  Result := TAzureContainer.Create(AAzureContainer.Name, AAzureContainer.URL);
  for LItem in AAzureContainer.Properties do
    Result.Properties.AddPair(LItem.Key, LItem.Value);
  for LItem in AAzureContainer.Metadata do
    Result.Metadata.AddPair(LItem.Key, LItem.Value);
end;

constructor TAzureContainer.Create(const Name, URL: string; Properties, Metadata: TStrings);
begin
  FName := Name;
  FURL := URL;

  if Properties = nil then
    FProperties := TStringList.Create
  else
    FProperties := Properties;

  if Metadata = nil then
    FMetadata := TStringList.Create
  else
    FMetadata := Metadata;
end;

destructor TAzureContainer.Destroy;
begin
  FreeAndNil(FProperties);
  FreeAndNil(FMetadata);
  inherited;
end;

function TAzureContainer.IsRoot: Boolean;
begin
  Result := Name = ROOT_CONTAINER;
end;

{ TAccessPolicy }

class function TAccessPolicy.Create: TAccessPolicy;
var
  ap: TAccessPolicy;
begin
  ap.Start := FormatDateTime('yyyy-mm-dd', Now);
  ap.SetPermission('r');
  Exit(ap);
end;

function TAccessPolicy.AsXML: string;
begin
  Result := '<AccessPolicy><Start>' + Start + '</Start><Expiry>' + Expiry +
            '</Expiry><Permission>' + Permission + '</Permission></AccessPolicy>';
end;

function TAccessPolicy.GetPermission: string;
begin
  Result := '';
  if PermRead then
    Result := Result + 'r';
  if PermWrite then
    Result := Result + 'w';
  if PermDelete then
    Result := Result + 'd';
  if PermList then
    Result := Result + 'l';
end;

procedure TAccessPolicy.SetPermission(const rwdl: string);
var
  I, Count: Integer;
begin
  Count := rwdl.Length;
  PermRead   := False;
  PermWrite  := False;
  PermDelete := False;
  PermList   := False;
  for I := 0 to Count - 1 do
    if rwdl.Chars[I] = 'r' then
      PermRead := True
    else if rwdl.Chars[I] = 'w' then
      PermWrite := True
    else if rwdl.Chars[I] = 'd' then
      PermDelete := True
    else if rwdl.Chars[I] = 'l' then
      PermList := True;
end;

{ TSignedIdentifier }

constructor TSignedIdentifier.Create(const Resource: string);
begin
  FResource := Resource;
  AccessPolicy.PermRead := false;
  AccessPolicy.PermWrite := false;
  AccessPolicy.PermDelete := false;
  AccessPolicy.PermList := false;

                                                                                          
  FPolicy := TBlobPolicy.Create;
  FPolicy.SetPermission(AccessPolicy.GetPermission);
  FPolicy.StartDate := AccessPolicy.Start;
  FPolicy.ExpiryDate := AccessPolicy.Expiry;
end;

constructor TSignedIdentifier.Create(const Resource: string; Policy: TAccessPolicy; UniqueId: string);
begin
  FResource := Resource;
  AccessPolicy := Policy;
  FId := UniqueId;

                                                                                          
  FPolicy := TBlobPolicy.Create;
  FPolicy.SetPermission(AccessPolicy.GetPermission);
  FPolicy.StartDate := AccessPolicy.Start;
  FPolicy.ExpiryDate := AccessPolicy.Expiry;
end;

constructor TSignedIdentifier.Create(const Resource: string; const Policy: TPolicy; const UniqueId: string);
begin
  FResource := Resource;
  FPolicy := Policy.CreateInstance;
  FPolicy.Assign(Policy);
  FId := UniqueId;

                                                                                          
  if FPolicy.ClassType = TBlobPolicy then
    AccessPolicy.SetPermission(FPolicy.GetPermission)
  else
    AccessPolicy.SetPermission('');
  AccessPolicy.Start := FPolicy.StartDate;
  AccessPolicy.Expiry := FPolicy.ExpiryDate;
end;

destructor TSignedIdentifier.Destroy;
begin
  FPolicy.Free;
  inherited;
end;

function TSignedIdentifier.AsXML: string;
begin
  Result := '<SignedIdentifier><Id>' + Id + '</Id>' + Policy.GetXML + '</SignedIdentifier>';
end;

{ TAzureBlob }

constructor TAzureBlob.Create(const Name: string; BlobType: TAzureBlobType; const Url: string;
  LeaseStatus: TAzureLeaseStatus; const Snapshot: string);
begin
  FName := Name;
  FBlobType := BlobType;
  FUrl := Url;
  FLeaseStatus := LeaseStatus;
  FSnapshot := Snapshot;
  FProperties := TStringList.Create;
  FMetadata := TStringList.Create;
end;

class function TAzureBlob.CreateFromRecord(AAzureBlobItem: TAzureBlobItem): TAzureBlob;
begin
  Result := TAzureBlob.Create(AAzureBlobItem.Name, AAzureBlobItem.BlobType, AAzureBlobItem.Url,
    AAzureBlobItem.LeaseStatus, AAzureBlobItem.Snapshot);
end;

destructor TAzureBlob.Destroy;
begin
  FreeAndNil(FProperties);
  FreeAndnil(FMetadata);
  inherited;
end;

{ TBlobActionConditional }

class function TBlobActionConditional.Create: TBlobActionConditional;
var
  Inst: TBlobActionConditional;
begin
  Exit(Inst);
end;

procedure TBlobActionConditional.PopulateHeaders(Headers: TStrings);
begin
  if Headers <> nil then
  begin
    if not IfSourceModifiedSince.IsEmpty then
      Headers.Values['x-ms-source-if-modified-since'] := IfSourceModifiedSince;
    if not IfSourceUnmodifiedSince.IsEmpty then
      Headers.Values['x-ms-source-if-unmodified-since'] := IfSourceUnmodifiedSince;
    if not IfSourceMatch.IsEmpty then
      Headers.Values['x-ms-source-if-match'] := IfSourceMatch;
    if not IfSourceNoneMatch.IsEmpty then
      Headers.Values['x-ms-source-if-none-match'] := IfSourceNoneMatch;
    if not IfModifiedSince.IsEmpty then
      Headers.Values['If-Modified-Since'] := IfModifiedSince;
    if not IfUnmodifiedSince.IsEmpty then
      Headers.Values['If-Unmodified-Since'] := IfUnmodifiedSince;
    if not IfMatch.IsEmpty then
      Headers.Values['If-Match'] := IfMatch;
    if not IfNoneMatch.IsEmpty then
      Headers.Values['If-None-Match'] := IfNoneMatch;
    if not IfSequenceNumberLessThanOrEqual.IsEmpty then
      Headers.Values['x-ms-if-sequence-number-lte'] := IfSequenceNumberLessThanOrEqual;
    if not IfSequenceNumberLessThan.IsEmpty then
      Headers.Values['x-ms-if-sequence-number-lt'] := IfSequenceNumberLessThan;
    if not IfSequenceNumberEquals.IsEmpty then
      Headers.Values['x-ms-if-sequence-number-eq'] := IfSequenceNumberEquals;
  end;
end;

{ TAzureBlockListItem }

class function TAzureBlockListItem.Create(ABlockId: string; ABlockType: TAzureBlockType;
                                          ASize: string): TAzureBlockListItem;
var
  abli: TAzureBlockListItem;
begin
  abli.BlockId := ABlockId;
  abli.BlockType := ABlockType;
  abli.Size := ASize;

  Result := abli;
end;

function TAzureBlockListItem.AsXML: string;
var
  TagName: string;
begin
  case BlockType of
    abtUncommitted: TagName := 'Uncommitted';
    abtLatest: TagName := 'Latest';
    else
      TagName := 'Committed';
  end;

  Result := Format('<%s>%s</%0:s>', [TagName, TNetEncoding.HTML.Encode(BlockId)]);
end;

{ TAzureBlobPageRange }

class function TAzureBlobPageRange.Create(StartByte, EndByte: Int64): TAzureBlobPageRange;
var
  res: TAzureBlobPageRange;
begin
  res.StartByte := StartByte;
  res.EndByte := EndByte;
  Exit(res);
end;

function TAzureBlobPageRange.GetPageCount: Integer;
var
  ByteCount: Int64;
begin
  ByteCount := EndByte - StartByte;

  //get the page count, which may or may not be one fewer than it needs to be
  Result := Trunc(ByteCount / 512);

  //Determine if the current PageCount is correct, or if one more page is needed.
  if (ByteCount Mod 512) <> 0 then
    Inc(Result);
end;

function TAzureBlobPageRange.GetStartPage: Integer;
begin
  Result := Trunc(StartByte / 512);
end;

{ TPolicy }

constructor TPolicy.Create;
begin
  FStartDate := FormatDateTime('yyyy-mm-dd', Now);
end;

function TPolicy.GetXML: string;
begin
  Result := '<AccessPolicy><Start>' + StartDate + '</Start><Expiry>' + ExpiryDate +
            '</Expiry><Permission>' + Permission + '</Permission></AccessPolicy>';
end;

{ TQueuePolicy }

constructor TQueuePolicy.Create;
begin
  inherited;
  FCanReadMessage := False;
  FCanAddMessage := False;
  FCanUpdateMessage := False;
  FCanProcessMessage := False;
end;

function TQueuePolicy.CreateInstance: TPolicy;
begin
  Result := TQueuePolicy.Create;
end;

procedure TQueuePolicy.Assign(const ASource: TPolicy);
begin
  if ASource is TQueuePolicy then
  begin
    Self.CanReadMessage := TQueuePolicy(ASource).CanReadMessage;
    Self.CanAddMessage := TQueuePolicy(ASource).CanAddMessage;
    Self.CanUpdateMessage := TQueuePolicy(ASource).CanUpdateMessage;
    Self.CanProcessMessage := TQueuePolicy(ASource).CanProcessMessage;
    Self.StartDate := ASource.StartDate;
    Self.ExpiryDate := ASource.ExpiryDate;
  end
  else
    raise EConvertError.CreateFmt(SInvalidSourceException, ['TQueuePolicy']);
end;

function TQueuePolicy.GetPermission: string;
begin
  Result := '';
  if FCanReadMessage then Result := Result + 'r';
  if FCanAddMessage then Result := Result + 'a';
  if FCanUpdateMessage then Result := Result + 'u';
  if FCanProcessMessage then Result := Result + 'p';
end;

procedure TQueuePolicy.SetPermission(const AValue: string);
begin
  FCanReadMessage := AValue.IndexOf('r') <> -1;
  FCanAddMessage := AValue.IndexOf('a') <> -1;
  FCanUpdateMessage := AValue.IndexOf('u') <> -1;
  FCanProcessMessage := AValue.IndexOf('p') <> -1;
end;

{ TBlobPolicy }

constructor TBlobPolicy.Create;
begin
  inherited;
  FCanReadBlob := False;
  FCanWriteBlob := False;
  FCanDeleteBlob := False;
  FCanListBlob := False;
end;

function TBlobPolicy.CreateInstance: TPolicy;
begin
  Result := TBlobPolicy.Create;
end;

procedure TBlobPolicy.Assign(const ASource: TPolicy);
begin
  if ASource is TBlobPolicy then
  begin
    Self.CanReadBlob := TBlobPolicy(ASource).CanReadBlob;
    Self.CanWriteBlob := TBlobPolicy(ASource).CanWriteBlob;
    Self.CanDeleteBlob := TBlobPolicy(ASource).CanDeleteBlob;
    Self.CanListBlob := TBlobPolicy(ASource).CanListBlob;
    Self.StartDate := ASource.StartDate;
    Self.ExpiryDate := ASource.ExpiryDate;
  end
  else
    raise EConvertError.CreateFmt(SInvalidSourceException, ['TBlobPolicy']);
end;

function TBlobPolicy.GetPermission: string;
begin
  Result := '';
  if FCanReadBlob then Result := Result + 'r';
  if FCanWriteBlob then Result := Result + 'w';
  if FCanDeleteBlob then Result := Result + 'd';
  if FCanListBlob then Result := Result + 'l';
end;

procedure TBlobPolicy.SetPermission(const AValue: string);
begin
  FCanReadBlob := AValue.IndexOf('r') <> -1;
  FCanWriteBlob := AValue.IndexOf('w') <> -1;
  FCanDeleteBlob := AValue.IndexOf('d') <> -1;
  FCanListBlob := AValue.IndexOf('l') <> -1;
end;

{ TTablePolicy }

constructor TTablePolicy.Create;
begin
  inherited;
  FCanQueryTable := False;
  FCanAddTable := False;
  FCanUpdateTable := False;
  FCanDeleteTable := False;
end;

function TTablePolicy.CreateInstance: TPolicy;
begin
  Result := TTablePolicy.Create;
end;

procedure TTablePolicy.Assign(const ASource: TPolicy);
begin
  if ASource is TTablePolicy then
  begin
    Self.CanQueryTable := TTablePolicy(ASource).CanQueryTable;
    Self.CanAddTable := TTablePolicy(ASource).CanAddTable;
    Self.CanUpdateTable := TTablePolicy(ASource).CanUpdateTable;
    Self.CanDeleteTable := TTablePolicy(ASource).CanDeleteTable;
    Self.StartDate := ASource.StartDate;
    Self.ExpiryDate := ASource.ExpiryDate;
  end
  else
    raise EConvertError.CreateFmt(SInvalidSourceException, ['TTablePolicy']);
end;

function TTablePolicy.GetPermission: string;
begin
  Result := '';
  if FCanQueryTable then Result := Result + 'r';
  if FCanAddTable then Result := Result + 'a';
  if FCanUpdateTable then Result := Result + 'u';
  if FCanDeleteTable then Result := Result + 'd';
end;

procedure TTablePolicy.SetPermission(const AValue: string);
begin
  FCanQueryTable := AValue.IndexOf('r') <> -1;
  FCanAddTable := AValue.IndexOf('a') <> -1;
  FCanUpdateTable := AValue.IndexOf('u') <> -1;
  FCanDeleteTable := AValue.IndexOf('d') <> -1;
end;

end.
