{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.Consts;

interface

const
  HTTP_HEADERFIELD_AUTH = 'Authorization'; // do not localize
  REST_NO_FALLBACK_CHARSET = 'raw'; // do not localize

resourcestring
  RNullableNoValue = 'Nullable type has no value';
  sExecuteRequestNilClient = 'Can''t execute TCustomRESTRequest when Client property is nil.';
  sParameterName = 'Name';
  sParameterValue = 'Value';
  sParameterKind = 'Kind';
  sOperationNotAllowedOnActiveComponent = 'Operation not allowed on active %s';
  sConfigureRESTComponent = 'Configure...';
  sExecuteRESTComponent = 'Execute...';
  sResetRESTClient = 'Reset Client';
  sClearRESTRequest = 'Clear Request Data';
  sClearRESTResponse = 'Clear Response Data';

  sResetRESTClientQuestion = 'Are you sure that you want to reset this Client to its default settings?';
  sClearRESTRequestQuestion ='Are you sure that you want to clear this Request''s data (including its Response)?';
  sClearRESTResponseQuestion ='Are you sure that you want to clear this Response''s data?';
  sInvalidRESTComponent = 'Invalid component-type: "%s"';
  sRESTAdapterUpdateDS = 'Update DataSet';
  sRESTAdapterClearDS = 'Clear DataSet';
  sRESTAdapterUpdatePar = 'Update Parameter';
  sRESTAdapterClearPar = 'Clear Parameter';
  sRESTUnsupportedAuthMethod = 'Unsupported Authentication Method!';
  sRESTUnsupportedRequestMethod = 'Unsupported Request Method';
  sRESTErrorEmptyURL = 'URL for a request must not be empty';
  sRESTErrorEmptyParamName = 'Name of a parameter must not be empty';
  sRESTViewerNoContent = 'There is no content available.';
  sRESTViewerNotAvailable = 'The content-type is not recognized as text. The viewer cannot be opened.';

  sRESTUnsupportedDateTimeFormat = 'Unsupported DateTime format';

  sAdapterResponseComponentIsNil = 'Adapter does not have a Response component';
  sResponseContentIsNotJSON = 'Response content is not valid JSON';
  sResponseContentIsEmpty = 'Response content is empty';
  sAdapterInvalidRootElement = 'Adapter RootElement, "%s", is not a valid path for the response JSON';
  sResponseInvalidRootElement = 'Response RootElement, "%s",  is not a valid path for the response JSON';

  sAdapterRequestComponentIsNil = 'Adapter does not have a Request component';
  sAdapterDatasetComponentIsNil = 'Adapter does not have a DataSet component';
  sAdapterParamIsNotFound = 'Request parameter is "%s" not found';

  sResponseDidNotReturnArray = 'Response did not return an Array of %s';

  SAuthorizationCodeNeeded = 'OAuth2 authorization code is needed before it can be changed into an access token.';
  SRefreshTokenNeeded = 'OAuth2 refresh token is needed before a new access token will be requested.';
  SClientCredNeeded = 'OAuth2 client id/secret are needed before a new access token will be requested.';
  SOAuth2AuthFailed = 'OAuth2 authorization failed: %s';
  SOAuth2LoginNotSetup = 'OAuth2 login is not setup properly';
  SOAuth2LoginFailed = 'OAuth2 login failed';
  SOAuth2AuthProviderNotFound = 'OAuth2 authorization provider %s is not found';

  sNoClientAttached = 'Request has no client component';
  sUnknownRequestMethod = 'Unknown request-method. Cannot execute request.';
  sRESTRequestFailed = 'REST request failed: %s';

  sUnsupportedProtocol = 'Unsupported Protocol: %s';



implementation

end.
