{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2015-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.JSON.Types;

interface

{$SCOPEDENUMS ON}

uses
  System.SysUtils, System.Generics.Collections, System.Classes;

const
  JsonExtOidPropertyName = '$oid';
  JsonExtBinaryPropertyName = '$binary';
  JsonExtTypePropertyName = '$type';
  JsonExtDatePropertyName = '$date';
  JsonExtRegexPropertyName = '$regex';
  JsonExtOptionsPropertyName = '$options';
  JsonExtRefPropertyName = '$ref';
  JsonExtIdPropertyName = '$id';
  JsonExtDbPropertyName = '$db';
  JsonExtCodePropertyName = '$code';
  JsonExtScopePropertyName = '$scope';
  JsonExtUndefinedPropertyName = '$undefined';
  JsonExtMinKeyPropertyName = '$minkey';
  JsonExtMaxKeyPropertyName = '$maxkey';
  JsonExtNumberLongPropertyName = '$numberlong';
  JsonExtDecimalPropertyName = '$numberdecimal';
  JsonExtMaxPropertyNameLen = Length(JsonExtNumberLongPropertyName);

  JsonUndefined = 'undefined';
  JsonNull = 'null';
  JsonTrue = 'true';
  JsonFalse = 'false';
  JsonNew = 'new';
  JsonPositiveInfinity = 'Infinity';
  JsonNegativeInfinity = '-Infinity';
  JsonNan = 'NaN';

type
  /// <summary> Json and Json extended / BSON token types </summary>
  TJsonToken = (
    None,
    StartObject,
    StartArray,
    StartConstructor,
    PropertyName,
    Comment,
    Raw,
    Integer,
    Float,
    &String,
    Boolean,
    Null,
    Undefined,
    EndObject,
    EndArray,
    EndConstructor,
    Date,
    Bytes,
    // Only in Extended JSON, BSON
    Oid,
    RegEx,
    DBRef,
    CodeWScope,
    MinKey,
    MaxKey,
    Decimal
  );

  /// <summary> Specifies the handling for empty values in managed types like array and string([], '') </summary>
  TJsonEmptyValueHandling = (Empty, Null);

  /// <summary> Specifies the handling of text format for TDateTime values </summary>
  TJsonDateFormatHandling = (Iso, Unix, FormatSettings);

  /// <summary> Specifies the handling of time zone for TDateTime values </summary>
  TJsonDateTimeZoneHandling = (Local, Utc);

  /// <summary> Indicates whether tokens should be parsed as TDatetime or not </summary>
  TJsonDateParseHandling = (None, DateTime);

  /// <summary> 
  ///  Specifies how strings are escaped when writing JSON text:
  ///   - Default: Only control characters (e.g. newline) are escaped
  ///   - EscapeNonAscii: All non-ASCII and control characters (e.g. newline) are escaped.
  ///   - EscapeHtml: HTML (&lt;, &gt;, &amp;, &apos;, &quot;) and control characters (e.g. newline) are escaped.
  /// </summary>
  TJsonStringEscapeHandling = (Default, EscapeNonAscii, EscapeHtml);

  /// <summary>
  ///  Specifies float format handling options when writing special floating point numbers:
  ///   - String: Write special floating point values as strings in JSON, e.g. "NaN", "Infinity", "-Infinity".
  ///   - Symbol: Write special floating point values as symbols in JSON, e.g. NaN, Infinity, -Infinity. Note that this will produce non-valid JSON.
  ///   - DefaultValue: Write special floating point values as the property's default value in JSON.
  /// </summary>
  TJsonFloatFormatHandling = (&String, Symbol, DefaultValue);

  /// <summary>
  ///  Specifies formatting options for the TJsonTextWriter.
  ///   - None: No special formatting is applied. This is the default.
  ///   - Indented: Causes child objects to be indented according to the TJsonTextWriter.Indentation and TJsonTextWriter.IndentChar settings.
  /// </summary>
  TJsonFormatting = (None, Indented);

  /// <summary> Container types for JSON </summary>
  TJsonContainerType = (None, &Object, &Array, &Constructor);
  
                                                                        
  TJsonNullValueHandling = (Include, Ignore);

                                                                        
  TJsonDefaultValueHandling = (Include, Ignore, Populate, IgnoreAndPopulate);
  
                                                                        
  TJsonReferenceLoopHandling = (Error, Ignore, Serialize);

                                                                        
  TJsonObjectCreationHandling = (Auto, Reuse, Replace);

                                                                        
  TJsonTypeNameHandling = (None, Objects, Arrays, All, Auto);


  TJsonLineInfo = class
  public
    /// <summary>
    ///  Gets the current line number.
    /// </summary>
    function GetLineNumber: Integer; virtual;
    /// <summary>
    ///  Gets the current line position.
    /// </summary>
    function GetLinePosition: Integer; virtual;
    /// <summary>
    ///  Gets a value indicating whether the class can return line information
    /// </summary>
    function HasLineInfo: Boolean; virtual;
    /// <summary>
    ///  Gets the current line number.
    /// </summary>
    property LineNumber: Integer read GetLineNumber;
    /// <summary>
    ///  Gets the current line position.
    /// </summary>
    property LinePosition: Integer read GetLinePosition;
  end;

  /// <summary>
  ///  Specifies the modes in which JSON text should be written/readed. See http://mongodb.github.io/mongo-java-driver/3.0/bson/extended-json/
  ///   - None: The reader doesn't try to parse tokens as extended JSON types, is treated
  ///   - StrictMode: Extended json is written/readed as representations of BSON types that conform to the JSON RFC.
  ///   - MongoShell: Extended json is written/readed as a superset of JSON that the MongoDB shell can parse
  /// </summary>
  TJsonExtendedJsonMode = (None, StrictMode, MongoShell);

  /// <summary> Binary subtypes that represents Extended JSON / BSON binary data type.
  ///   See http://docs.mongodb.org/manual/reference/mongodb-extended-json/#binary
  ///   See http://bsonspec.org/spec.html
  /// </summary>
  TJsonBinaryType = (Generic = $00, &Function = $01, BinaryOld = $02,
    UUIDOld = $03, UUID = $04, MD5 = $05, UserDefined = $80);

  /// <summary> Represents a path position within a JSON </summary>
  TJsonPosition = record
  private
    class function TypeHasIndex(Atype: TJsonContainerType): Boolean; static;
  public
    /// <summary> Container type where the position resides </summary>
    ContainerType: TJsonContainerType;
    /// <summary> Position itself </summary>
    Position: Integer;
    /// <summary> Property Name </summary>
    PropertyName: string;
    /// <summary> Tells if the container has index info </summary>
    HasIndex: Boolean;
    constructor Create(AType: TJsonContainerType); overload;
    /// <summary> Sets all info to initial state </summary>
    procedure Clear;
    /// <summary> Helper to write the info to an TStringBuilder </summary>
    procedure WriteTo(const Sb: TStringBuilder);
    class function Create: TJsonPosition; overload; inline; static;
    /// <summary> Builds a formatted path from a collection of <see cref="TJsonPosition"/> </summary>
    class function BuildPath(const Positions: TEnumerable<TJsonPosition>; AFromIndex: Integer = 0): string; static;
    /// <summary> Helper to format LineInfo + Path + Msg </summary>
    class function FormatMessage(const LineInfo: TJsonLineInfo; const Path, Msg: string): string; static;
  end;

  /// <summary>
  ///  Base class for Json readers and writers
  /// </summary>
  TJsonFiler = class(TJsonLineInfo)
  private
    [HPPGEN('#if defined(__CGVER__)' + #13#10 +
             'public:'               + #13#10 +
             '#endif'                + #13#10 +
             'System::UnicodeString __fastcall GetPath()')]
    function GetPath: string; overload; inline;
  protected
    FStack: TList<TJsonPosition>;
    FPathBuilder: TStringBuilder;
    /// <summary> Current Position </summary>
    FCurrentPosition: TJsonPosition;
    /// <summary> Gets the position info based on depth </summary>
    function GetPosition(ADepth: Integer): TJsonPosition;
    function Peek: TJsonContainerType; inline;
    function Pop: TJsonContainerType;
    procedure Push(AValue: TJsonContainerType);
    function GetInsideContainer: Boolean; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary> Gets the path of the current JSON token starting from specified depth. </summary>
    function GetPath(AFromDepth: Integer): string; overload;
    /// <summary> Resets the internal state allowing write/read from the begining </summary>
    procedure Rewind; virtual;
    property InsideContainer: Boolean read GetInsideContainer;
    /// <summary> Checks whether the token is an end token </summary>
    class function IsEndToken(Token: TJsonToken): Boolean; static; inline;
    /// <summary> Checks whether the token is an start token </summary>
    class function IsStartToken(Token: TJsonToken): Boolean; static; inline;
    /// <summary> Checks whether the token is an primitive token </summary>
    class function IsPrimitiveToken(Token: TJsonToken): Boolean; static; inline;
    /// <summary> Gets the path of the current JSON token. </summary>
    property Path: string read GetPath;
  end;

  /// <summary>
  ///  Generic Exception type for Json
  /// </summary>
  EJsonException = class(Exception)
  private
    FInnerException: Exception;
  public
    constructor Create(const Msg: string; const InnerException: Exception); overload;
    /// <summary>
    ///  Gets the underlying exception
    /// </summary>
    property InnerException: Exception read FInnerException;
  end;

  /// <summary> TJsonOid class represents Extended JSON OID / BSON data type.
  ///  See http://docs.mongodb.org/manual/reference/mongodb-extended-json/#oid
  ///      http://bsonspec.org/spec.html 
  /// </summary>
  TJsonOid = record
  private
    function GetAsString: String;
    procedure SetAsString(const Value: String);
    function GetAsBytes: TBytes;
    procedure SetAsBytes(const Value: TBytes);
  public
    /// <summary> Oid value. </summary>
    Bytes: array [0 .. 12-1] of Byte;
    constructor Create(const AOid: TBytes); overload;
    constructor Create(const AOid: String); overload;
    /// <summary> Provides access to Oid value as a hexadecimal string. </summary>
    property AsString: String read GetAsString write SetAsString;
    /// <summary> Provides access to Oid value as a TBytes. </summary>
    property AsBytes: TBytes read GetAsBytes write SetAsBytes;
  end;

  /// <summary> TJsonRegEx class represents Extended JSON / BSON Regular Expression data type.
  ///  See http://docs.mongodb.org/manual/reference/mongodb-extended-json/#regular-expression
  ///      http://bsonspec.org/spec.html 
  /// </summary>
  TJsonRegEx = record
  private
    function GetAsString: String;
    procedure SetAsString(const AValue: String);
  public
    /// <summary> Regular expression pattern value. </summary>
    RegEx: String;
    /// <summary> Regular expression options value. </summary>
    Options: String;
    constructor Create(const ARegEx, AOptions: String);
    /// <summary> Provides access to RegEx value as a string of '/regex/options' format. </summary>
    property AsString: String read GetAsString write SetAsString;
  end;

  /// <summary> TJsonDBRef class represents Extended JSON  / BSON DB Reference data type.
  ///  See http://docs.mongodb.org/manual/reference/mongodb-extended-json/#db-reference
  ///      http://bsonspec.org/spec.html 
  /// </summary>
  TJsonDBRef = record
  private
    function GetAsString: String;
    procedure SetAsString(const AValue: String);
  public
    /// <summary> DB reference optional database name. </summary>
    DB: String;
    /// <summary> DB reference mandatory collection name. </summary>
    Ref: String;
    /// <summary> DB reference mandatory document ID. </summary>
    Id: TJsonOid;
    constructor Create(const ADb, ARef, AId: String); overload;
    constructor Create(const ARef, AId: String); overload;
    constructor Create(const ADb, ARef: String; const AId: TJsonOid); overload;
    constructor Create(const ARef: String; const AId: TJsonOid); overload;
    /// <summary> Provides access to DBRef value as a string of 'db.ref.id' format. </summary>
    property AsString: String read GetAsString write SetAsString;
  end;

  /// <summary> TJsonCodeWScope class represents BSON Code With Scope data type.
  ///  See http://bsonspec.org/spec.html </summary>
  TJsonCodeWScope = record
  public type
    TScopeItem = record
      Ident: String;
      Value: String;
    end;
  public
    /// <summary> CodeWScope code value. </summary>
    Code: String;
    /// <summary> CodeWScope array of scope items. </summary>
    Scope: array of TScopeItem;
    constructor Create(const ACode: String; AScope: TStrings);
  end;

  /// <summary> TJsonDecimal128 class represents BSON Decimal128 data type.
  ///  See http://bsonspec.org/spec.html
  ///      https://github.com/mongodb/specifications/blob/master/source/bson-decimal128/decimal128.rst
  /// </summary>
  TJsonDecimal128 = record
  public
    type
      TDec128ToString = function (const ADec: TJsonDecimal128): string of object;
      TStringToDec128 = function (const AStr: string; var ADec: TJsonDecimal128): Boolean of object;
    class var
      FDec128ToString: TDec128ToString;
      FStringToDec128: TStringToDec128;
    const
      MaxStrLen = 42;
  private
    function GetAsString: String;
    procedure SetAsString(const Value: String);
    function GetAsExtended: Extended;
    procedure SetAsExtended(const Value: Extended);
    function GetIsNan: Boolean;
    function GetIsNegInfinity: Boolean;
    function GetIsPosInfinity: Boolean;
    function GetIsZero: Boolean;
  public
    lo, hi: UInt64;
    constructor Create(const AValue: string); overload;
    constructor Create(const AValue: Extended); overload;
    property IsNan: Boolean read GetIsNan;
    property IsPosInfinity: Boolean read GetIsPosInfinity;
    property IsNegInfinity: Boolean read GetIsNegInfinity;
    property IsZero: Boolean read GetIsZero;
    property AsString: String read GetAsString write SetAsString;
    property AsExtended: Extended read GetAsExtended write SetAsExtended;
  end;

  /// <summary>Attribute that specifies a JSON name to use when serializing
  /// a field or property.
  /// </summary>
  JsonNameAttribute = class(TCustomAttribute)
  private
    FValue: string;
  public
    constructor Create(const AValue: string);
    property Value: string read FValue;
  end;

var
  /// <summary> General JSON format settings. </summary>
  JSONFormatSettings: TFormatSettings;
  /// <summary> Specifies RTL version to use for JSON serialization format.
  /// Affects TList&lt;T&gt; / TListHelper, TJSONString, TDate, TGUID serialization. </summary>
  JSONSerializationVersion: Integer = 36;

implementation

uses
  System.JSONConsts;

{ TJsonLineInfo }

function TJsonLineInfo.GetLineNumber: Integer;
begin
  Result := 0; // implement in child classes
end;

function TJsonLineInfo.GetLinePosition: Integer;
begin
  Result := 0; // implement in child classes
end;

function TJsonLineInfo.HasLineInfo: Boolean;
begin
  Result := False; // implement in child classes
end;

{ TJsonPosition }

class function TJsonPosition.BuildPath(const Positions: TEnumerable<TJsonPosition>; AFromIndex: Integer = 0): string;
var
  Sb: TStringBuilder;
  LList: TList<TJsonPosition>;
  I: Integer;
begin
  Sb := TStringBuilder.Create;
  try
    if AFromIndex < 0 then
      AFromIndex := 0;

    LList := Positions as TList<TJsonPosition>;
    for I := AFromIndex to LList.Count - 1 do
      LList[I].WriteTo(Sb);

    Result := Sb.ToString(True);
  finally
    Sb.Free;
  end;
end;

constructor TJsonPosition.Create(AType: TJsonContainerType);
begin
  ContainerType := Atype;
  HasIndex := TypeHasIndex(Atype);
  Position := -1;
  PropertyName := '';
end;

class function TJsonPosition.Create: TJsonPosition;
begin
  Result.Clear;
end;

procedure TJsonPosition.Clear;
begin
  ContainerType := TJsonContainerType.None;
  HasIndex := TypeHasIndex(TJsonContainerType.None);
  Position := -1;
  PropertyName := '';
end;

class function TJsonPosition.FormatMessage(const LineInfo: TJsonLineInfo; const Path, Msg: string): string;
begin
  Result := Msg;
  if not Result.EndsWith(sLineBreak) then
  begin
    Result := Result.Trim;
    if not Result.EndsWith('.') then
      Result := Result + '.';
    Result := Result + ' ';
  end;

  Result := Result + Format(SFormatMessagePath, [Path], JSONFormatSettings);

  if (LineInfo <> nil) and (LineInfo.HasLineInfo) then
    Result := Result + Format(SFormatMessageLinePos, [LineInfo.LineNumber, LineInfo.LinePosition], JSONFormatSettings);
end;

class function TJsonPosition.TypeHasIndex(Atype: TJsonContainerType): Boolean;
begin
  Result := (Atype = TJsonContainerType.Array) or (Atype = TJsonContainerType.Constructor);
end;

procedure TJsonPosition.WriteTo(const Sb: TStringBuilder);
begin
  case ContainerType of
    TJsonContainerType.Object:
    begin
      if Sb.Length > 0 then
        Sb.Append('.');
      Sb.Append(PropertyName);
    end;
    TJsonContainerType.Array,
    TJsonContainerType.Constructor:
    begin
      Sb.Append('[');
      Sb.Append(Position);
      Sb.Append(']');
    end;
  end;
end;

{ TJsonFiler }

constructor TJsonFiler.Create;
begin
  inherited Create;
  FStack := TList<TJsonPosition>.Create;
  FStack.Capacity := 4;
  FPathBuilder := TStringBuilder.Create;
  FCurrentPosition.Clear;
end;

destructor TJsonFiler.Destroy;
begin
  FStack.Free;
  FPathBuilder.Free;
  inherited Destroy;
end;

function TJsonFiler.GetPath: string;
begin
  Result := GetPath(0);
end;

function TJsonFiler.GetPath(AFromDepth: Integer): string;
var
  I: Integer;
begin
  if FCurrentPosition.ContainerType = TJsonContainerType.None then
    Result := ''
  else
  begin
    if AFromDepth < 0 then
      AFromDepth := 0;

    FPathBuilder.Length := 0;
    for I := AFromDepth to FStack.Count - 1 do
      FStack[I].WriteTo(FPathBuilder);

    if InsideContainer and (AFromDepth <= FStack.Count) then
      FCurrentPosition.WriteTo(FPathBuilder);

    Result := FPathBuilder.ToString(False);
  end;
end;

function TJsonFiler.GetPosition(ADepth: Integer): TJsonPosition;
begin
  if ADepth < FStack.Count then
    Result := FStack.List[ADepth]
  else
    Result := FCurrentPosition;
end;

function TJsonFiler.Peek: TJsonContainerType;
begin
  Result := FCurrentPosition.ContainerType;
end;

function TJsonFiler.Pop: TJsonContainerType;
begin
  if FStack.Count > 0 then
  begin
    Result := FCurrentPosition.ContainerType;
    FCurrentPosition := FStack.List[FStack.Count - 1];
    FStack.Delete(FStack.Count - 1);
  end
  else
  begin
    Result := FCurrentPosition.ContainerType;
    FCurrentPosition.Clear;
  end;
end;

procedure TJsonFiler.Push(AValue: TJsonContainerType);
begin
  if FCurrentPosition.ContainerType <> TJsonContainerType.None then
    FStack.Add(FCurrentPosition);
  FCurrentPosition.Create(AValue);
end;

procedure TJsonFiler.Rewind;
begin
  FStack.Clear;
  FCurrentPosition.Clear;
end;

class function TJsonFiler.IsPrimitiveToken(Token: TJsonToken): Boolean;
begin
  Result := Token in [
    TJsonToken.Integer,
    TJsonToken.Float,
    TJsonToken.String,
    TJsonToken.Boolean,
    TJsonToken.Undefined,
    TJsonToken.Null,
    TJsonToken.Date,
    TJsonToken.Bytes,
    TJsonToken.Oid,
    TJsonToken.RegEx,
    TJsonToken.DBRef,
    TJsonToken.CodeWScope,
    TJsonToken.MinKey,
    TJsonToken.MaxKey];
end;

class function TJsonFiler.IsStartToken(Token: TJsonToken): Boolean;
begin
  Result := Token in [
    TJsonToken.StartObject,
    TJsonToken.StartArray,
    TJsonToken.StartConstructor];
end;

class function TJsonFiler.IsEndToken(Token: TJsonToken): Boolean;
begin
  Result := Token in [
    TJsonToken.EndObject,
    TJsonToken.EndArray,
    TJsonToken.EndConstructor];
end;

{ EJsonException }

constructor EJsonException.Create(const Msg: string; const InnerException: Exception);
begin
  Create(Msg);
  FInnerException := InnerException;
end;

{ TJsonOid }

constructor TJsonOid.Create(const AOid: TBytes);
begin
  AsBytes := AOid;
end;

constructor TJsonOid.Create(const AOid: String);
begin
  AsString := AOid;
end;

function TJsonOid.GetAsBytes: TBytes;
begin
  SetLength(Result, SizeOf(bytes));
  Move(bytes[0], Result[0], SizeOf(bytes));
end;

procedure TJsonOid.SetAsBytes(const Value: TBytes);
begin
  if Length(Value) = 0 then
    FillChar(bytes[0], SizeOf(bytes), 0)
  else
  begin
    if Length(Value) <> SizeOf(bytes) then
      raise EJsonException.CreateRes(@SInvalidObjectId);
    Move(Value[0], bytes[0], SizeOf(bytes));
  end;
end;

function TJsonOid.GetAsString: String;
var
  LBytes, LText: TBytes;
begin
  LBytes := AsBytes;
  SetLength(LText, Length(LBytes) * 2);
  BinToHex(LBytes, 0, LText, 0, SizeOf(bytes));
  Result := TEncoding.ANSI.GetString(LText);
end;

procedure TJsonOid.SetAsString(const Value: String);
var
  LText, LBytes: TBytes;
begin
  LText := BytesOf(Value);
  SetLength(LBytes, Length(LText) div 2);
  HexToBin(LText, 0, LBytes, 0, Length(LBytes));
  SetAsBytes(LBytes);
end;

{ TJsonRegEx }

constructor TJsonRegEx.Create(const ARegEx, AOptions: String);
begin
  RegEx := ARegEx;
  Options := AOptions;
end;

function TJsonRegEx.GetAsString: String;
begin
  Result := '/' + RegEx + '/' + Options;
end;

procedure TJsonRegEx.SetAsString(const AValue: String);
var
  LVals: TArray<string>;
begin
  RegEx := '';
  Options := '';
  LVals := AValue.Split(['/']);
  if Length(LVals) = 1 then
    RegEx := LVals[0]
  else if Length(LVals) = 2 then
    RegEx := LVals[1]
  else if Length(LVals) = 3 then
  begin
    RegEx := LVals[1];
    Options := LVals[2];
  end;
end;

{ TJsonDBRef }

constructor TJsonDBRef.Create(const ADb, ARef, AId: String);
begin
  DB := ADb;
  Ref := ARef;
  Id.AsString := AId;
end;

constructor TJsonDBRef.Create(const ARef, AId: String);
begin
  Create('', ARef, AId);
end;

constructor TJsonDBRef.Create(const ADb, ARef: String; const AId: TJsonOid);
begin
  DB := ADb;
  Ref := ARef;
  Id := AId;
end;

constructor TJsonDBRef.Create(const ARef: String; const AId: TJsonOid);
begin
  Create('', ARef, AId);
end;

function TJsonDBRef.GetAsString: String;
begin
  Result := DB;
  if Result <> '' then
    Result := Result + '.';
  Result := Result + Ref + '.' + Id.AsString;
end;

procedure TJsonDBRef.SetAsString(const AValue: String);
var
  LVals: TArray<string>;
begin
  LVals := AValue.Split(['.']);
  if Length(LVals) = 2 then
  begin
    DB := '';
    Ref := LVals[0];
    Id.AsString := LVals[1];
  end
  else
  begin
    DB := LVals[0];
    Ref := LVals[1];
    Id.AsString := LVals[2];
  end;
end;

{ TJsonCodeWScope }

constructor TJsonCodeWScope.Create(const ACode: String; AScope: TStrings);
var
  I: Integer;
begin
  Code := ACode;
  if (AScope = nil) or (AScope.Count = 0) then
    SetLength(Scope, 0)
  else
  begin
    SetLength(Scope, AScope.Count);
    for I := 0 to AScope.Count - 1 do
    begin
      Scope[I].Ident := AScope.Names[I];
      Scope[I].Value := AScope.ValueFromIndex[I];
    end;
  end;
end;

{ TJsonDecimal128 }

constructor TJsonDecimal128.Create(const AValue: Extended);
begin
  AsExtended := AValue;
end;

constructor TJsonDecimal128.Create(const AValue: string);
begin
  AsString := AValue;
end;

function TJsonDecimal128.GetAsString: String;
begin
  if not Assigned(FDec128ToString) then
    raise EJsonException.CreateRes(@SDecimalNotImpl);
  Result := FDec128ToString(Self);
end;

procedure TJsonDecimal128.SetAsString(const Value: String);
begin
  if not Assigned(FStringToDec128) then
    raise EJsonException.CreateRes(@SDecimalNotImpl);
  if Value <> '' then
  begin
    if not FStringToDec128(Value, Self) then
      raise EJsonException.CreateResFmt(@SDecimalInvStr, [Value]);
  end
  else
  begin
    lo := 0;
    hi := $3040000000000000;
  end;
end;

function TJsonDecimal128.GetAsExtended: Extended;
begin
  if IsZero then
    Result := 0.0
  else if IsNan then
    Result := Extended.NaN
  else if IsNegInfinity then
    Result := Extended.NegativeInfinity
  else if IsPosInfinity then
    Result := Extended.PositiveInfinity
  else if not TextToFloat(AsString, Result, JSONFormatSettings) then
    Result := Extended.NaN;
end;

procedure TJsonDecimal128.SetAsExtended(const Value: Extended);
begin
  AsString := FloatToStr(Value, JSONFormatSettings);
end;

function TJsonDecimal128.GetIsNan: Boolean;
begin
  Result := (lo = 0) and (hi = $7C00000000000000);
end;

function TJsonDecimal128.GetIsNegInfinity: Boolean;
begin
  Result := (lo = 0) and (hi = $F800000000000000);
end;

function TJsonDecimal128.GetIsPosInfinity: Boolean;
begin
  Result := (lo = 0) and (hi = $7800000000000000);
end;

function TJsonDecimal128.GetIsZero: Boolean;
begin
  Result := (lo = 0) and (hi = $3040000000000000);
end;

{ JsonNameAttribute }

constructor JsonNameAttribute.Create(const AValue: string);
begin
  inherited Create;
  FValue := AValue;
end;

initialization
  JSONFormatSettings := TFormatSettings.Invariant;

end.
