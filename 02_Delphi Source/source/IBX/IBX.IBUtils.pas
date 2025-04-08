{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2024 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBUtils;

interface

uses
  {$IFDEF MSWINDOWS} Winapi.Messages,{$ENDIF}
  System.SysUtils, System.Classes, Data.DB;


type
  TIBProtocols = (ibTCP, ibNamedPipe, ibSPX, ibLocal);
  TIBProtocol = (TCP, SPX, NamedPipe, Local);  {used to be in IBX.IBServices.  Moved in 10.4}

procedure SplitToRelCol(Dialect : Integer; AnOrigin : String; Var Relation : String; Var Column : String);
function RandomString(iLength: Integer): String;
function RandomInteger(iLow, iHigh: Integer): Integer;
function StripString(st: String; CharsToStrip: String): String; inline;
function FormatIdentifier(Dialect: Integer; Value: String): String;
function FormatIdentifierValue(Dialect: Integer; Value: String): String;
function ExtractIdentifier(Dialect: Integer; Value: String): String;
function QuoteIdentifier(Dialect: Integer; Value: String): String; inline;
function AddIBParamSQLForDetail(Params: TParams; SQL: String; Native: Boolean; Dialect : Integer): string;
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Protocol, DatabasePath : String); overload; deprecated 'use either the SSL version or the TProtocol version';
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : string;
            var Protocol : TIBProtocol;
            var DatabasePath : String); overload;
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : string;
            var Protocol : TIBProtocols;
            var DatabasePath : String); overload; {use the TProtocol version for Service compatibility}
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : String;
            var Protocol : TIBProtocol;
            var DatabasePath : String;
            var SSL : Boolean;
            var ServerPublicFile, ServerPublicPath, ClientCertFile,
                ClientPassPhraseFile, ClientPassPhrase : String); overload;
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : String;
            var Protocol : TIBProtocols;
            var DatabasePath : String;
            var SSL : Boolean;
            var ServerPublicFile, ServerPublicPath, ClientCertFile,
                ClientPassPhraseFile, ClientPassPhrase : String); overload; {use the TProtocol version for Service compatibility}
function ComposeDatabaseName(ServerName, Port : String;
            Protocol : TIBProtocol;
            DatabasePath : String;
            SSL : Boolean = false;
            ServerPublicFile : String = '';  ServerPublicPath : String = '';
            ClientCertFile : String = ''; ClientPassPhraseFile  : String = '';
            ClientPassPhrase : String = '') : string; overload;
function ComposeDatabaseName(ServerName, Port : String;
            Protocol : TIBProtocols;
            DatabasePath : String;
            SSL : Boolean = false;
            ServerPublicFile : String = '';  ServerPublicPath : String = '';
            ClientCertFile : String = ''; ClientPassPhraseFile  : String = '';
            ClientPassPhrase : String = '') : string; overload; {use the TProtocol version for Service compatibility}



function PreprocessSQL(sSQL : string) : string;
function IsKeyword(const str : String) : Boolean;
function IsDataType(const str : String) : Boolean;
function IsIBfunction(const str : String) : Boolean;
function GetKeywords : String;
function GetIBFunctions : String;
function GetIBDataTypes : String;
function NeedsQuoting(const Keyword : String) : Boolean; inline;
function IsMinimumServerVersion(CurVersion, MinVersion: string): boolean;

type

  TIBTimer = class(TComponent)
  private
    FInterval: Cardinal;
    {$IFDEF MSWINDOWS}
    FWindowHandle: THandle;
    {$ENDIF MSWINDOWS}
    FOnTimer: TNotifyEvent;
    FEnabled: Boolean;
    procedure UpdateTimer;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Cardinal);
    procedure SetOnTimer(Value: TNotifyEvent);
    {$IFDEF MSWINDOWS}
    procedure WndProc(var Msg: TMessage);
    {$ENDIF}
  protected
    procedure Timer; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

var
  CopyMasterFieldToDetail : Boolean;

implementation

uses {$ifdef MSWINDOWS} Winapi.Windows, {$endif} IBX.IBXConst, IBX.IB, Data.DBCommon, System.Character;
var
  KeyWords, DataTypes, IBFunctions : TStringList;
{
 Preprocess SQL
 Using FSQL, process the typed SQL and put the process SQL
 in FProcessedSQL and parameter names in FSQLParams
}
function PreprocessSQL(sSQL : string) : string;
var
  cCurChar, cNextChar, cQuoteChar: Char;
  sProcessedSQL, sParamName: String;
  i, iLenSQL, iSQLPos: Integer;
  iCurState, iCurParamState: Integer;
  slNames: TStrings;

const
  DefaultState = 0;
  CommentState = 1;
  QuoteState = 2;
  ParamState = 3;
  ParamDefaultState = 0;
  ParamQuoteState = 1;

  procedure AddToProcessedSQL(cChar: Char);
  begin
    sProcessedSQL[iSQLPos] := cChar;
    Inc(iSQLPos);
  end;

begin
  slNames := TStringList.Create;
  try
    { Do some initializations of variables }
    cQuoteChar := '''';
    iLenSQL := Length(sSQL);
    SetString(sProcessedSQL, nil, iLenSQL + 1);
    i := low(sSQL);
    iSQLPos := i;
    iCurState := DefaultState;
    iCurParamState := ParamDefaultState;
    { Now, traverse through the SQL string, character by character,
     picking out the parameters and formatting correctly for InterBase }
    while (i <= iLenSQL) do begin
      { Get the current token and a look-ahead }
      cCurChar := sSQL[i];
      if i = iLenSQL then
        cNextChar := #0
      else
        cNextChar := sSQL[i + 1];
      { Now act based on the current state }
      case iCurState of
        DefaultState: begin
          case cCurChar of
            '''', '"': begin
              cQuoteChar := cCurChar;
              iCurState := QuoteState;
            end;
            '?', ':': begin
              iCurState := ParamState;
              AddToProcessedSQL('?');
            end;
            '/': if (cNextChar = '*') then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
              iCurState := CommentState;
            end;
          end;
        end;
        CommentState:
        begin
          if (cNextChar = #0) then
            IBError(ibxeSQLParseError, [SEOFInComment])
          else if (cCurChar = '*') then begin
            if (cNextChar = '/') then
              iCurState := DefaultState;
          end;
        end;
        QuoteState:
        begin
          if cNextChar = #0 then
            IBError(ibxeSQLParseError, [SEOFInString])
          else if (cCurChar = cQuoteChar) then begin
            if (cNextChar = cQuoteChar) then begin
              AddToProcessedSQL(cCurChar);
              Inc(i);
            end else
              iCurState := DefaultState;
          end;
        end;
        ParamState:
        begin
          { collect the name of the parameter }
          if iCurParamState = ParamDefaultState then
          begin
            if cCurChar = '"' then
              iCurParamState := ParamQuoteState
            else
              if cCurChar.IsInArray(['_', '$']) or
                 cCurChar.IsLetterOrDigit then  {do not localize}
                sParamName := sParamName + cCurChar;
          end
          else
          begin
            { determine if Quoted parameter name is finished }
            if cCurChar = '"' then
            begin
              Inc(i);
              slNames.Add(sParamName);
              SParamName := '';
              iCurParamState := ParamDefaultState;
              iCurState := DefaultState;
            end
            else
              sParamName := sParamName + cCurChar
          end;
          { determine if the unquoted parameter name is finished }
          if (iCurParamState <> ParamQuoteState) and
            (iCurState <> DefaultState) then
          begin
            if not (cNextChar.IsInArray(['_', '$']) or
                    cNextChar.IsLetterOrDigit)  then  {do not localize}
            begin
              Inc(i);
              iCurState := DefaultState;
              slNames.Add(sParamName);
              sParamName := '';
            end;
          end;
        end;
      end;
      if iCurState <> ParamState then
        AddToProcessedSQL(sSQL[i]);
      Inc(i);
    end;
    AddToProcessedSQL(#0);
    SetLength(sProcessedSQL, iSQLPos - 1);
    Result := sProcessedSQL;
  finally
    slNames.Free;
  end;
end;

function RandomString(iLength: Integer): String;
begin
  Result := '';
  while Result.Length < iLength do
    Result := result + IntToStr(RandomInteger(0, High(Integer)));
  if Result.Length > iLength then
    Result := Result.Substring(0, iLength);
end;

function RandomInteger(iLow, iHigh: Integer): Integer;
begin
  result := Random(iHigh - iLow) + iLow;
end;

function StripString(st: String; CharsToStrip: String): String; inline;
var
  c : Char;
begin
  result := st;
  for c in CharsToStrip do
    Result := Result.Replace(c, '');
end;

function FormatIdentifier(Dialect: Integer; Value: String): String;
begin
  Value := Trim(Value);
  if Dialect = 1 then
    Value := AnsiUpperCase(Value)
  else
    if (Value <> '') and (Value[Low(Value)] = '"') then
      Value := '"' + StringReplace (TrimRight(Value), '"', '""', [rfReplaceAll]) + '"'
    else
      Value := AnsiUpperCase(Value);
  Result := Value;
end;

function FormatIdentifierValue(Dialect: Integer; Value: String): String;
begin
  Value := Value.Trim;
  if Dialect = 1 then
    Value := Value.ToUpperInvariant
  else
  begin
    if (Value <> '') and (Value[Low(Value)] = '"') then
    begin
      Value := Value.Remove(0, 1);
      Value := Value.Remove(Value.Length - 1);
      Value := StringReplace (Value, '""', '"', [rfReplaceAll]);
    end
    else
      Value := Value.ToUpperInvariant;
  end;
  Result := Value;
end;

function ExtractIdentifier(Dialect: Integer; Value: String): String;
begin
  Value := Value.Trim;
  if Dialect = 1 then
    Value := Value.ToUpperInvariant
  else
  begin
    if (Value <> '') and (Value[Low(Value)] = '"') then
    begin
      Value := Value.Remove(0, 1);
      Value := Value.Remove(Value.Length - 1, 1);
      Value := StringReplace (Value, '""', '"', [rfReplaceAll]);
    end
    else
      Value := Value.ToUpperInvariant;
  end;
  Result := Value;
end;

function QuoteIdentifier(Dialect: Integer; Value: String): String;
begin
  if Dialect = 1 then
    Value := Value.Trim.ToUpperInvariant
  else
  if NeedsQuoting(Value) then
    Value := '"' + StringReplace (Value, '"', '""', [rfReplaceAll]) + '"';
  Result := Value;
end;

procedure SplitToRelCol(Dialect : Integer; AnOrigin : String; Var Relation : String; Var Column : String);
var
  Pieces : TArray<string>;
begin
  Pieces := AnOrigin.Split(['.']);
  Relation := '';
  Column := '';
  if Length(Pieces) > 1 then
  begin
    Relation := ExtractIdentifier(Dialect, Pieces[0]);
    Column := ExtractIdentifier(Dialect, Pieces[1]);
  end;
end;

function AddIBParamSQLForDetail(Params: TParams; SQL: String; Native: Boolean; Dialect : Integer): string;
const
  SWhere = ' where ';     { do not localize }
  SAnd = ' and ';         { do not localize }

  function GenerateParamSQL: string;  
  var
    I: Integer;
  begin
    for I := 0 to Params.Count -1 do
    begin
      if I > 0 then Result := Result + SAnd;
      if Native then
        Result := Result + format('%s = ?', [QuoteIdentifier(Dialect, Params[I].Name)]) {do not localize}
      else
        Result := Result + format('%0:s = :%0:s', [QuoteIdentifier(Dialect, Params[I].Name)]); {do not localize}
    end;
    if Result.ToLowerInvariant.Contains(SWhere) then
      Result := SAnd + Result
    else
      Result := SWhere + Result;
  end;

  function AddWhereClause: String;
  var
    Start: PWideChar;
    Rest, FName: String;
    SQLToken, CurSection: TSQLToken;
  begin
    Start := PWideChar(SQL);
    CurSection := stUnknown;
    repeat
      SQLToken := NextSQLToken(Start, FName, CurSection);
    until SQLToken in [stFrom, stEnd];
    if SQLToken = stFrom then
      NextSQLToken(Start, FName, CurSection);
    Rest := Start;
    if Rest = '' then                {do not localize}
      Result := SQL + ' ' + GenerateParamSQL   {do not localize}
    else
      Result := SQL.Substring(0, SQL.IndexOf(Rest)) + ' ' + GenerateParamSQL + Rest;   {do not localize}
  end;

begin
  Result := SQL;
  if (Params.Count > 0) then
    Result := AddWhereClause;
end;

procedure DecomposeDatabaseName(DatabaseName : String;
  var ServerName, Protocol, DatabasePath : String);
var
  p : TIBProtocol;
  port : string;
begin
  DecomposeDatabaseName(DatabaseName, ServerName, Port, p, DatabasePath);
  case p of
    TCP: Protocol := 'TCP';
    NamedPipe: Protocol := 'NamedPipe';
    SPX: Protocol := 'SPX';
    Local: Protocol := 'Local';
  end;
end;

function ComposeDatabaseName(ServerName, Port : String;
            Protocol : TIBProtocol;
            DatabasePath : String;
            SSL : Boolean = false;
            ServerPublicFile : String = '';  ServerPublicPath : String = '';
            ClientCertFile : String = ''; ClientPassPhraseFile  : String = '';
            ClientPassPhrase : String = '') : string;
const
  SPF = '?serverPublicFile='; {do nit localize}
  SPP = '?serverPublicPath=';  {do not localize}
  CCF = '?clientCertFile=';   {do not localize}
  CPPF = '?clientPassPhraseFile=';  {do not localize}
  CPP = '?clientPassPhrase=';    {do not localize}

begin
  Result := ServerName;
  if Port <> '' then     {do not localize}
    Result := Result + '/' + Port;     {do not localize}
  if SSL then
  begin
    if (ServerPublicFile <> '') and     {do not localize}
       (ServerPublicPath <> '') then    {do not localize}
      raise Exception.Create(SSSLSeverExclusive);
    if (ClientPassPhraseFile <> '') and    {do not localize}
       (ClientPassPhrase <> '') then       {do not localize}
      raise Exception.Create(SSSLClientExclusive);

    Result := Result + '?ssl=true';      {do not localize}
    if ServerPublicFile <> '' then        {do not localize}
      Result := Result + SPF + ServerPublicFile;
    if ServerPublicPath <> '' then        {do not localize}
      Result := Result + SPP + ServerPublicPath;
    if ClientCertFile <> '' then            {do not localize}
      Result := Result + CCF + ClientCertFile;
    if ClientPassPhraseFile <> '' then       {do not localize}
      Result := Result + CPPF + ClientPassPhraseFile;
    if ClientPassPhrase <> '' then             {do not localize}
      Result := Result + CPP + ClientPassPhrase;
    Result := Result + '??';                   {do not localize}
  end;
  case Protocol of
    TCP : Result := Result + ':' + DatabasePath;  {do not localize}
    NamedPipe : Result := '\\' + Result + '\' + DatabasePath;  {do not localize}
    SPX : Result := Result + '@' + DatabasePath;   {do not localize}
    Local : Result := DatabasePath;
  end;
end;

function ComposeDatabaseName(ServerName, Port : String;
            Protocol : TIBProtocols;
            DatabasePath : String;
            SSL : Boolean = false;
            ServerPublicFile : String = '';  ServerPublicPath : String = '';
            ClientCertFile : String = ''; ClientPassPhraseFile  : String = '';
            ClientPassPhrase : String = '') : string; overload; {use the TProtocol version for Service compatibility}
var
  Proto : TIBProtocol;
begin
  case Protocol of
    ibTCP: Proto := TCP;
    ibNamedPipe: Proto := NamedPipe;
    ibSPX: Proto := SPX;
    else Proto := Local;
  end;
  Result := ComposeDatabaseName(ServerName, Port, Proto, DatabasePath, SSL,
                                ServerPublicFile, ServerPublicPath, ClientCertFile,
                                ClientPassPhraseFile, ClientPassPhrase);
end;
procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : string;
            var Protocol : TIBProtocol;
            var DatabasePath : String); overload;
var
  Idx1, Idx2, Idx3: Integer;

  procedure SplitServerFromPort(PathIdx : Integer);
  begin
    Idx3 := ServerName.IndexOf('/');  {do not localize}
    if Idx3 >= 0 then
    begin
      Port := ServerName.Substring(Idx3+ 1);
      ServerName := ServerName.Substring(0, Idx3);
    end;
    DatabasePath := DatabaseName.SubString(PathIdx);
  end;

begin
  Port := '';                       {do not localize}
  ServerName := '';                {do not localize}
  DatabasePath := '';              {do not localize}
  if DatabaseName.Contains('\\') then {do not localize}
  begin
    Protocol := NamedPipe;
    DatabaseName := DatabaseName.Substring(2);
    Idx1 := DatabaseName.IndexOf('\'); {do not localize}
    if Idx1 < 0 then
      IBError(ibxeUnknownError, [nil])
    else
    begin
      ServerName := DatabaseName.Substring(0, Idx1);
      SplitServerFromPort(Idx1 + 1);
    end;
  end
  else
  begin
    Idx1 := DatabaseName.IndexOf(':'); {do not localize}
    Idx2 := DatabaseName.IndexOf('@'); {do not localize}
    If ((Idx1 < 0) or (Idx1 = 1)) and
        (idx2 < 0) then
    begin
      DatabasePath := DatabaseName;
      Protocol := Local;
    end
    else
    begin
      if Idx2 < 0 then
      begin
        Protocol := TCP;
        ServerName := DatabaseName.Substring(0, Idx1);
        SplitServerFromPort(Idx1 + 1);
      end
      else
      begin
        Protocol := SPX;
        ServerName := DatabaseName.Substring(0, Idx2);
        SplitServerFromPort(Idx2 + 1);
      end;
    end;
  end;
end;

procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : string;
            var Protocol : TIBProtocols;
            var DatabasePath : String); overload;
var
  Proto : TIBProtocol;
begin
  DecomposeDatabaseName(DatabaseName, ServerName, Port, Proto, DatabasePath);
  case Proto of
    TCP: Protocol := ibTCP;
    SPX: Protocol := ibSPX;
    NamedPipe: Protocol := ibNamedPipe;
    Local: Protocol := ibLocal;
  end;
end;

procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : String;
            var Protocol : TIBProtocol;
            var DatabasePath : String;
            var SSL : Boolean;
            var ServerPublicFile, ServerPublicPath, ClientCertFile,
                ClientPassPhraseFile, ClientPassPhrase : String);
const
  SPF = '?serverpublicfile='; {do nit localize}
  SPP = '?serverpublicpath=';  {do not localize}
  CCF = '?clientcertfile=';   {do not localize}
  CPPF = '?clientpassphrasefile=';  {do not localize}
  CPP = '?clientpassphrase=';    {do not localize}

var
  lDBName, SSLSection : String;
  idx1 : Integer;

  procedure StripSSL;
  var
    idx1, idx2 : Integer;
  begin
    idx1 := DatabaseName.ToLowerInvariant.IndexOf('?ssl=true');  {do not localize}
    idx2 := DatabaseName.IndexOf('??');  {do not localize}
    if idx1 >= 0 then
    begin
      if idx2 < 0 then
        raise Exception.Create(SMalformedSSLConnection);
      if idx1 >= idx2 then
        raise Exception.Create(SMalformedSSLConnection2);
      lDBName := DatabaseName.Remove(idx1, idx2 - idx1 + 2);
      SSLSection := DatabaseName.Substring(idx1, idx2 - idx1 + 2);
    end
    else
      lDBName := DatabaseName;
  end;

  function ExtractPiece(Piece : String; starting : Integer) : string;
  var
    i : Integer;
    sSub : String;
  begin
    sSub := SSLSection.Substring(starting);
    i := sSub.IndexOf('?');
    if i >= 0 then
      Result := sSub.Substring(0, i)
    else
      Result := '';
  end;


begin
  ServerPublicfile := '';           {do not localize}
  ServerPublicPath := '';           {do not localize}
  ClientCertFile := '';             {do not localize}
  ClientPassPhraseFile := '';        {do not localize}
  ClientPassPhrase := '';            {do not localize}
  // strip it into the components of the connection string and the SSL section
  StripSSL;
  // Decompose jsust the connection part
  DecomposeDatabaseName(lDBName, ServerName, Port, Protocol, DatabasePath);
  if SSLSection = '' then            {do not localize}
    SSL := false
  else
  begin
    // Decompose the SSL pieces
    SSL := true;
    idx1 := SSLSection.ToLowerInvariant.IndexOf(SPF);
    if idx1 >= 0 then
      ServerPublicFile := ExtractPiece(SSLSection, idx1 + SPF.Length);

    idx1 := SSLSection.ToLowerInvariant.IndexOf(SPP);
    if idx1 >= 0 then
      ServerPublicPath := ExtractPiece(SSLSection, idx1 + SPP.Length);

    idx1 := SSLSection.ToLowerInvariant.IndexOf(CCF);
    if idx1 >= 0 then
      ClientCertFile := ExtractPiece(SSLSection, idx1 + CCF.Length);

    idx1 := SSLSection.ToLowerInvariant.IndexOf(CPPF);
    if idx1 >= 0 then
      ClientPassPhraseFile := ExtractPiece(SSLSection, idx1 + CPPF.Length);

    idx1 := SSLSection.ToLowerInvariant.IndexOf(CPP);
    if idx1 >= 0 then
      ClientPassPhrase := ExtractPiece(SSLSection, idx1 + SPP.Length);
  end;
end;

procedure DecomposeDatabaseName(DatabaseName : String;
            var ServerName, Port : String;
            var Protocol : TIBProtocols;
            var DatabasePath : String;
            var SSL : Boolean;
            var ServerPublicFile, ServerPublicPath, ClientCertFile,
                ClientPassPhraseFile, ClientPassPhrase : String); overload;
var
  Proto : TIBProtocol;
begin
  DecomposeDatabaseName(DatabaseName, ServerName, Port, Proto, DatabasePath,
                        SSL, ServerPublicFile, ServerPublicPath, ClientCertFile,
                        ClientPassPhraseFile, ClientPassPhrase);
  case Proto of
    TCP: Protocol := ibTCP;
    SPX: Protocol := ibSPX;
    NamedPipe: Protocol := ibNamedPipe;
    Local: Protocol := ibLocal;
  end;
end;

function IsKeyword(const str : String) : Boolean;
var
  i : Integer;
begin
  Result := Keywords.Find(str, i);
end;

function IsDataType(const str : String) : Boolean;
var
  i : Integer;
begin
  Result := DataTypes.Find(str, i);
end;

function IsIBFunction(const str : String) : Boolean;
var
  i : Integer;
begin
  Result := IBFunctions.Find(str, i);
end;

function NeedsQuoting(const Keyword : String) : Boolean;
begin
  Result := (Keyword <> Keyword.ToUpperInvariant) or
             Keyword.Contains(' ') or
             IsKeyword(Keyword) or
             IsDataType(Keyword) or
             IsIBfunction(KeyWord) or
             ((Keyword.Length > 0) and (Keyword[Low(String)].IsNumber));
end;

function GetKeywords : String;
begin
  Result := Keywords.DelimitedText;
end;

function GetIBFunctions : String;
begin
  Result := IBFunctions.DelimitedText; {do not localize}
end;

function GetIBDataTypes : String;
begin
  Result := DataTypes.DelimitedText;
end;

procedure InitializeKeywords;
const
//  {2017 wiki}
//  sKeywords = 'ACTION ACTIVE ADD ADMIN AFTER ALL ALTER AND ANY AS ASC ASCENDING AT AUTO AUTODDL AVG ' + {do not localize}
//              'BASED BASENAME BASE_NAME BEFORE BEGIN BETWEEN BLOB BLOBEDIT BOOLEAN BUFFER BY CACHE ' + {do not localize}
//              'CASCADE CASE CAST CHAR CHARACTER CHARACTER_LENGTH CHAR_LENGTH CHECK CHECK_POINT_LEN ' + {do not localize}
//              'CHECK_POINT_LENGTH COALESCE COLLATE COLLATION COLUMN COMMIT COMMITTED COMPILETIME COMPUTED ' + {do not localize}
//              'CLOSE CONDITIONAL CONNECT CONSTRAINT CONTAINING CONTINUE COUNT CREATE CSTRING ' + {do not localize}
//              'CURRENT CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP CURSOR DATABASE DATE DAY DB_KEY ' + {do not localize}
//              'DEBUG DEC DECIMAL DECLARE DECRYPT DEFAULT DELETE DESC DESCENDING DESCRIBE ' + {do not localize}
//              'DESCRIPTOR DISCONNECT DISPLAY DISTINCT DO DOMAIN DOUBLE DROP ECHO EDIT ' + {do not localize}
//              'ELSE ENCRYPT ENCRYPTION END ENTRY_POINT ESCAPE EVENT EXCEPTION EXECUTE EXISTS ' + {do not localize}
//              'EXIT EXTERN EXTERNAL EXTRACT FALSE FETCH FILE FILTER FLOAT FOR FOREIGN FOUND ' + {do not localize}
//              'FREE_IT FROM FULL FUNCTION GDSCODE GENERATOR GEN_ID GLOBAL GOTO GRANT GROUP ' + {do not localize}
//              'GROUP_COMMIT_WAIT GROUP_COMMIT_WAIT_TIME HAVING HELP HOUR IF IMMEDIATE IN ' + {do not localize}
//              'INACTIVE INDEX INDICATOR INIT INNER INPUT INPUT_TYPE INSERT INT INTEGER INTO ' + {do not localize}
//              'IS ISOLATION ISQL JOIN KEY LC_MESSAGES LC_TYPE LEFT LENGTH LEV LEVEL LIKE ' + {do not localize}
//              'LOGFILE LOG_BUFFER_SIZE LOG_BUF_SIZE LONG MANUAL MAX MAXIMUM MAXIMUM_SEGMENT ' + {do not localize}
//              'MAX_SEGMENT MERGE MESSAGE MIN MINIMUM MINUTE MODULE_NAME MONTH NAMES NATIONAL ' + {do not localize}
//              'NATURAL NCHAR NO NOAUTO NOT NULL NULLIF NUMERIC NUM_LOG_BUFS NUM_LOG_BUFFERS '+ {do not localize}
//              'OCTET_LENGTH OF ON ONLY OPEN OPTION OR ORDER OUTER OUTPUT OUTPUT_TYPE ' + {do not localize}
//              'OVERFLOW PAGE PAGELENGTH PAGES PAGE_SIZE PARAMETERS PASSWORD PERCENT ' + {do not localize}
//              'PLAN POSITION POST_EVENT PRECISION PREPARE PRESERVE PROCEDURE PROTECTED ' + {do not localize}
//              'PRIMARY PRIVILEGES PUBLIC QUIT RAW_PARTITIONS RDB$DB_KEY READ REAL ' + {do not localize}
//              'RECORD_VERSION REFERENCES RELEASE RESERV RESERVING RESTRICT RETAIN ' + {do not localize}
//              'RETURN RETURNING_VALUES RETURNS REVOKE RIGHT ROLE ROLLBACK ROW ROWS ' + {do not localize}
//              'RUNTIME SCHEMA SECOND SEGMENT SELECT SET SHADOW SHARED SHELL SHOW ' + {do not localize}
//              'SINGULAR SIZE SMALLINT SNAPSHOT SOME SORT SQLCODE SQLERROR SQLWARNING ' + {do not localize}
//              'STABILITY STARTING STARTS STATEMENT STATIC SUSPEND TABLE TEMPORARY ' + {do not localize}
//              'TERMINATOR THEN TIES TIME TIMESTAMP TO TRANSACTION TRANSLATE TRANSLATION ' + {do not localize}
//              'TRIGGER TRIM TRUE TYPE UNCOMMITTED UNION UNIQUE UNKNOWN UPDATE UPPER ' + {do not localize}
//              'USER USING VALUE VALUES VARCHAR VARIABLE VARYING VERSION VIEW WAIT ' + {do not localize}
//              'WEEKDAY WHEN WHENEVER WHERE WHILE WITH WORK WRITE YEAR YEARDAY ' + {do not localize}
// {From IB}
//sKeywords = 'ACTION ACTIVE ADD ADMIN AFTER ALL ALTER AND ANY AS ASC ASCENDING AT AUTO AVG ' + {do not localize}
//              'BEFORE BEGIN BETWEEN BLOB BOOLEAN BUFFERS BY CACHE CASCADE CASE CAST CHAR CHARACTER ' + {do not localize}
//              'CHECK COALESCE COLLATE COLLATION COLUMN COMMIT COMMITTED COMPUTED CONDITIONAL CONSTRAINT ' + {do not localize}
//              'CONTAINING COUNT CREATE CSTRING CURRENT CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP CURSOR ' + {do not localize}
//              'DATABASE DATE DAY DEBUG DEC DECIMAL DECLARE DECRYPT DEFAULT DELETE DESC DESCENDING DESCRIPTOR ' + {do not localize}
//              'DISTINCT DO DOMAIN DOUBLE DROP ELSE END ENCRYPT ENCRYPTION ENTRY_POINT ESCAPE ' + {do not localize}
//              'EXCEPTION EXCLUSIVE EXCLUSIVITY EXECUTE EXISTS EXIT EXTERNAL EXTRACT FILE FILTER ' + {do not localize}
//              'FLOAT FALSE FOR FOREIGN FREE_IT FROM FULL FUNCTION GDSCODE GENERATOR GEN_ID ' + {do not localize}
//              'GLOBAL GRANT GROUP HAVING HOUR IF IN INACTIVE INDEX INNER INPUT_TYPE INSERT ' + {do not localize}
//              'INT INTEGER INTO IS ISOLATION JOIN KEY LEFT LENGTH LEVEL LIKE LONG MANUAL MAX ' + {do not localize}
//              'MAXIMUM_SEGMENT MERGE MESSAGE MIN MINUTE MODULE_NAME MONTH NAMES NATIONAL NATURAL ' + {do not localize}
//              'NCHAR NO NOT NULL UNKNOWN NUMERIC NULLIF OF ON ONLY OPTION OR ORDER OUTER ' + {do not localize}
//              'OUTPUT_TYPE PAGE PAGES PAGE_SIZE PARAMETER PASSWORD PERCENT PLAN POSITION ' + {do not localize}
//              'POST_EVENT PRECISION PRESERVE PRIMARY PRIVILEGES PROCEDURE PROTECTED ' + {do not localize}
//              'RAW_PARTITIONS RDB$DB_KEY READ REAL RECORD_VERSION RECURSIVE REFERENCES ' + {do not localize}
//              'RELEASE RESERV RESERVING RESTRICT RETAIN RETURNING_VALUES RETURNS REVOKE ' + {do not localize}
//              'RIGHT ROLE ROLLBACK ROW ROWS SAVEPOINT SCHEMA SECOND SEGMENT SELECT SET ' + {do not localize}
//              'SHADOW SHARED SINGULAR SIZE SMALLINT SNAPSHOT SOME SORT SQLCODE STABILITY ' + {do not localize}
//              'STARTING STARTS STATISTICS SUB_TYPE SUM SUSPEND TABLE TABLESPACE TEMPORARY ' + {do not localize}
//              'THEN TIES TIME TIMESTAMP TO TRANSACTION TRIGGER TRUE TRUNCATE TYPE UNCOMMITTED ' + {do not localize}
//              'UNION UNIQUE UPDATE UPPER USER VALUE VALUES VARCHAR VARIABLE VARYING VIEW WAIT ' + {do not localize}
//              'WEEKDAY WHEN WHERE WHILE WITH WORK WRITE YEAR YEARDAY';
// Combined list
  sKeywords = 'ACTION ACTIVE ADD ADMIN AFTER ALL ALTER AND ANY AS ASC ASCENDING AT AUTO ' + {do not localize}
              'AUTODDL BASE_NAME BASED BASENAME BEFORE BEGIN BETWEEN BLOBEDIT ' + {do not localize}
              'BOOLEAN BUFFER BUFFERS BY CACHE CASCADE CASE CHAR_LENGTH ' + {do not localize}
              'CHARACTER_LENGTH CHECK CHECK_POINT_LEN CHECK_POINT_LENGTH ' + {do not localize}
              'CLOSE COLLATE COLLATION COLUMN COMMIT COMMITTED COMPILETIME ' + {do not localize}
              'COMPUTED CONDITIONAL CONNECT CONSTRAINT CONTAINING CONTINUE ' + {do not localize}
              'CREATE CSTRING CURRENT CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP ' + {do not localize}
              'CURSOR DATABASE DAY DB_KEY DEBUG DEC DECLARE DECRYPT ' + {do not localize}
              'DEFAULT DELETE DESC DESCENDING DESCRIBE DESCRIPTION DESCRIPTOR DISCONNECT DISPLAY ' + {do not localize}
              'DISTINCT DO DOMAIN DROP ECHO EDIT ELSE ENCRYPT ENCRYPTION END ' + {do not localize}
              'ENTRY_POINT ESCAPE EVENT EXCEPTION EXCLUSIVE EXCLUSIVITY EXECUTE EXISTS ' + {do not localize}
              'EXIT EXTERN EXTERNAL FALSE FETCH FILE FILTER FOR FOREIGN ' + {do not localize}
              'FOUND FREE_IT FROM FULL FUNCTION GDSCODE GENERATOR GLOBAL GOTO ' + {do not localize}
              'GRANT GROUP GROUP_COMMIT_WAIT GROUP_COMMIT_WAIT_TIME HAVING HELP HOUR ' + {do not localize}
              'IF IMMEDIATE IN INACTIVE INDEX INDICATOR INIT INNER INPUT INPUT_TYPE ' + {do not localize}
              'INSERT INT INTO IS ISOLATION ISQL JOIN KEY LC_MESSAGES LC_TYPE ' + {do not localize}
              'LEFT LENGTH LEV LEVEL LIKE LOG_BUF_SIZE LOG_BUFFER_SIZE LOGFILE LONG ' + {do not localize}
              'MANUAL MAX_SEGMENT MAXIMUM MAXIMUM_SEGMENT MERGE MESSAGE MINIMUM ' + {do not localize}
              'MINUTE MODULE_NAME MONTH NAMES NATIONAL NATURAL NCHAR NO NOAUTO NOT NULL ' + {do not localize}
              'NUM_LOG_BUFFERS NUM_LOG_BUFS OCTET_LENGTH OF ON ONLY OPEN ' + {do not localize}
              'OPTION OR ORDER OUTER OUTPUT OUTPUT_TYPE OVERFLOW PAGE PAGE_SIZE PAGELENGTH ' + {do not localize}
              'PAGES PARAMETER PARAMETERS PASSWORD PERCENT PLAN POSITION POST_EVENT PRECISION ' + {do not localize}
              'PREPARE PRESERVE PRIMARY PRIVILEGES PROCEDURE PROTECTED PUBLIC QUIT ' + {do not localize}
              'RAW_PARTITIONS RDB$DB_KEY READ REAL RECORD_VERSION RECURSIVE REFERENCES ' + {do not localize}
              'RELEASE RESERV RESERVING RESTRICT RETAIN RETURN RETURNING_VALUES RETURNS ' + {do not localize}
              'REVOKE RIGHT ROLE ROLLBACK ROW ROWS RUNTIME SAVEPOINT SCHEMA SECOND ' + {do not localize}
              'SEGMENT SELECT SET SHADOW SHARED SHELL SHOW SINGULAR SIZE ' + {do not localize}
              'SNAPSHOT SOME SORT SQLCODE SQLERROR SQLWARNING STABILITY STARTING ' + {do not localize}
              'STARTS STATEMENT STATIC STATISTICS SUB_TYPE SUSPEND TABLE TABLESPACE ' + {do not localize}
              'TEMPORARY TERMINATOR THEN TIES TO TRANSACTION TRANSLATE ' + {do not localize}
              'TRANSLATION TRIGGER TRIM TRUE TRUNCATE TYPE UNCOMMITTED UNION UNIQUE ' + {do not localize}
              'UNKNOWN UPDATE USER USING VALUE VALUES VARIABLE VARYING ' + {do not localize}
              'VERSION VIEW WAIT WEEKDAY WHEN WHENEVER WHERE WHILE WITH WORK WRITE YEAR YEARDAY';

  sDataTypes = 'BLOB CHAR CHARACTER DATE DECIMAL DOUBLE FLOAT INTEGER ' + {do not localize}
               'NUMERIC SMALLINT TIME TIMESTAMP VARCHAR'; {do not localize}

  sIBFunctions = 'AVG CAST COUNT GEN_ID MAX MIN SUM UPPER GEN_ID EXTRACT COALESCE NULLIF'; {do not localize}


begin
  Keywords := TStringList.Create;
  Keywords.CaseSensitive := false;
  Keywords.Sorted := true;
  Keywords.Duplicates := dupIgnore;
  Keywords.Delimiter := ' ';
  Keywords.StrictDelimiter := true;
  Keywords.DelimitedText := sKeywords;
  Keywords.Delimiter := ',';

  DataTypes := TStringList.Create;
  DataTypes.CaseSensitive := false;
  DataTypes.Sorted := true;
  DataTypes.Duplicates := dupIgnore;
  DataTypes.Delimiter := ' ';
  DataTypes.StrictDelimiter := true;
  DataTypes.DelimitedText := sDataTypes;
  DataTypes.Delimiter := ',';

  IBFunctions := TStringList.Create;
  IBFunctions.CaseSensitive := false;
  IBFunctions.Sorted := true;
  IBFunctions.Duplicates := dupIgnore;
  IBFunctions.Delimiter := ' ';
  IBFunctions.StrictDelimiter := true;
  IBFunctions.DelimitedText := sIBFunctions;
  IBFunctions.Delimiter := ',';


end;

function IsMinimumServerVersion(CurVersion, MinVersion: string): boolean;
var
  lServer : String;
  Idx : Integer;
  ServerAsInt, MinAsInt : Double;

  function GetNextNumber(var s : String) : Integer;
  begin
    Idx := Pos('.', s);  {do not localize}
    if Idx > 0 then
    begin
      Result := StrToInt(Copy(s, 0, Idx - 1));
      s := Copy(s, Pos('.', s) + 1, Length(s)); {do not localize}
    end
    else
    begin
      Result := StrToInt(s);
      s := '';
    end;
  end;

begin
  Result := true;
  Idx := 0;
  while (Idx < Length(CurVersion)) and
        (not CurVersion[Idx].IsNumber) do {do not localize}
    Inc(Idx);
  lServer := Copy(CurVersion, Idx, Length(CurVersion));
  if (Trim(lServer) = '') or
     (trim(MinVersion) = '') then
    Result := false;
  ServerAsInt := 0;
  MinAsInt := 0;
  while Result and (MinVersion <> '') do
  begin
    ServerAsInt := (ServerAsInt * 1000) + GetNextNumber(lServer);
    MinAsInt := (MinAsInt * 1000) + GetNextNumber(MinVersion);
    Result := MinAsInt <= ServerAsInt;
  end;
end;

{ TIBTimer }

constructor TIBTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := True;
  FInterval := 1000;
  {$IFDEF MSWINDOWS}
  FWindowHandle := AllocateHWnd(WndProc);
  {$ENDIF}
end;

destructor TIBTimer.Destroy;
begin
  FEnabled := False;
  UpdateTimer;
  {$IFDEF MSWINDOWS}
  DeallocateHWnd(FWindowHandle);
  {$ENDIF}
  inherited Destroy;
end;

{$IFDEF MSWINDOWS}
procedure TIBTimer.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_TIMER then
    try
      Timer;
    except
      if Assigned(ApplicationHandleException) then
        ApplicationHandleException(Self);
    end
  else
    Msg.Result := DefWindowProc(FWindowHandle, Msg.Msg, Msg.wParam, Msg.lParam);
end;
{$ENDIF}

procedure TIBTimer.UpdateTimer;
begin
{$IFDEF MSWINDOWS}
  KillTimer(FWindowHandle, 1);
  if (FInterval <> 0) and FEnabled and Assigned(FOnTimer) then
    if SetTimer(FWindowHandle, 1, FInterval, nil) = 0 then
      raise EOutOfResources.Create(SNoTimers);
{$ENDIF}
end;

procedure TIBTimer.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TIBTimer.SetInterval(Value: Cardinal);
begin
  if Value <> FInterval then
  begin
    FInterval := Value;
    UpdateTimer;
  end;
end;

procedure TIBTimer.SetOnTimer(Value: TNotifyEvent);
begin
  FOnTimer := Value;
  UpdateTimer;
end;

procedure TIBTimer.Timer;
begin
  if Assigned(FOnTimer) then FOnTimer(Self);
end;

initialization
  CopyMasterFieldToDetail := false;
  InitializeKeywords;
finalization
  Keywords.Free;
  DataTypes.Free;
  IBFunctions.Free;
end.
