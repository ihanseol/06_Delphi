{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

/// <summary>
/// Implements several build-in interceptors used by REST.JsonReflect.
/// </summary>
unit REST.Json.Interceptors;

interface

uses
  System.Json, REST.JsonReflect;

type
  /// <summary>TBytes Interceptor for conversions between TBytes and string with Base64 representation.
  /// It is created and used automatically when TMarshalUnmarshalBase.BytesFormat is jbfBase64. </summary>
  TBase64BytesInterceptor = class(TJSONInterceptor)
  public
    constructor Create;
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  /// <summary>Base class for DateTime Interceptors.</summary>
  TDateTimeInterceptor = class(TJSONInterceptor)
  private
    FDateTimeIsUTC: Boolean;
  public
    constructor Create(ADateTimeIsUTC: Boolean); reintroduce;
    property DateTimeIsUTC: Boolean read FDateTimeIsUTC write FDateTimeIsUTC;
  end;

  /// <summary>DateTime Interceptor for conversions between TDateTime and string with ISO date/time representation.
  /// It is created and used automatically when TMarshalUnmarshalBase.DateFormat is jdfISO8601. </summary>
  TISODateTimeInterceptor = class(TDateTimeInterceptor)
  public
    constructor Create(ADateTimeIsUTC: Boolean); reintroduce;
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  /// <summary>DateTime Interceptor for conversions between TDateTime and string with Unix date/time representation.
  /// It is created and used automatically when TMarshalUnmarshalBase.DateFormat is jdfUnix. </summary>
  TUnixDateTimeInterceptor = class(TDateTimeInterceptor)
  public
    constructor Create(ADateTimeIsUTC: Boolean); reintroduce;
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  /// <summary>DateTime Interceptor for conversions between TDateTime and MongoDB TMongoDate object.
  /// It is created and used automatically when TMarshalUnmarshalBase.DateFormat is jdfMongo. </summary>
  TMongoDateTimeInterceptor = class(TDateTimeInterceptor)
  public
    constructor Create(ADateTimeIsUTC: Boolean); reintroduce;
    function ObjectConverter(Data: TObject; Field: string): TObject; override;
    procedure ObjectReverter(Data: TObject; Field: string; Arg: TObject); override;
  end;

  /// <summary>DateTime Interceptor for conversions between TDateTime and Parse TParseDate object.
  /// It is created and used automatically when TMarshalUnmarshalBase.DateFormat is jdfParse. </summary>
  TParseDateTimeInterceptor = class(TDateTimeInterceptor)
  public
    constructor Create(ADateTimeIsUTC: Boolean); reintroduce;
    function ObjectConverter(Data: TObject; Field: string): TObject; override;
    procedure ObjectReverter(Data: TObject; Field: string; Arg: TObject); override;
  end;

  /// <summary>GUID Interceptor for conversions between TGUID and string.
  /// It is created and used automatically. </summary>
  TGUIDInterceptor = class(TJSONInterceptor)
  public
    constructor Create;
    function  StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

implementation

uses
  System.TypInfo, System.Rtti, System.SysUtils, System.DateUtils, System.NetEncoding,
  REST.Json.Types;

{ TBase64BytesInterceptor }

constructor TBase64BytesInterceptor.Create;
begin
  inherited Create;
  ConverterType := ctString;
  ReverterType := rtString;
end;

function TBase64BytesInterceptor.StringConverter(Data: TObject; Field: string): string;
var
  LBytes: TBytes;
begin
  LBytes := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TBytes>;
  Result := TNetEncoding.Base64String.EncodeBytesToString(LBytes);
end;

procedure TBase64BytesInterceptor.StringReverter(Data: TObject; Field: string; Arg: string);
var
  LBytes: TBytes;
  LValue: TValue;
begin
  LBytes := TNetEncoding.Base64String.DecodeStringToBytes(Arg);
  TValue.Make<TBytes>(LBytes, LValue);
  RTTIProvider.GetMember(Data, Field).SetValue(Data, LValue);
end;

{ TDateTimeInterceptor }

constructor TDateTimeInterceptor.Create(ADateTimeIsUTC: Boolean);
begin
  inherited Create;
  FDateTimeIsUTC := ADateTimeIsUTC;
end;

{ TISODateTimeInterceptor }

constructor TISODateTimeInterceptor.Create(ADateTimeIsUTC: Boolean);
begin
  inherited Create(ADateTimeIsUTC);
  ConverterType := ctString;
  ReverterType := rtString;
end;

function TISODateTimeInterceptor.StringConverter(Data: TObject; Field: string): string;
var
  date: TDateTime;
begin
  date := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TDateTime>;
  result := DateToISO8601(date, DateTimeIsUTC);
end;

procedure TISODateTimeInterceptor.StringReverter(Data: TObject; Field: string; Arg: string);
var
  date: TDateTime;
begin
  date := ISO8601ToDate(Arg, DateTimeIsUTC);
  RTTIProvider.GetMember(Data, Field).SetValue(Data, date);
end;

{ TUnixDateTimeInterceptor }

constructor TUnixDateTimeInterceptor.Create(ADateTimeIsUTC: Boolean);
begin
  inherited Create(ADateTimeIsUTC);
  ConverterType := ctString;
  ReverterType := rtString;
end;

function TUnixDateTimeInterceptor.StringConverter(Data: TObject; Field: string): string;
var
  date: TDateTime;
begin
  date := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TDateTime>;
  result := IntToStr(DateTimeToUnix(date, DateTimeIsUTC));
end;

procedure TUnixDateTimeInterceptor.StringReverter(Data: TObject; Field: string; Arg: string);
var
  date: TDateTime;
begin
  date := UnixToDateTime(StrToIntDef(Arg, 0), DateTimeIsUTC);
  RTTIProvider.GetMember(Data, Field).SetValue(Data, date);
end;

{ TMongoDateTimeInterceptor }

constructor TMongoDateTimeInterceptor.Create(ADateTimeIsUTC: Boolean);
begin
  inherited Create(ADateTimeIsUTC);
  ConverterType := ctObject;
  ReverterType := rtObject;
  ObjectType := TMongoDate;
end;

function TMongoDateTimeInterceptor.ObjectConverter(Data: TObject; Field: string): TObject;
var
  date: TDateTime;
begin
  // http://docs.mongodb.org/manual/reference/mongodb-extended-json/
  // Strict mode: {"$date" : 1382128582}
  date := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TDateTime>;
  result := TMongoDate.Create(DateTimeToUnix(date, DateTimeIsUTC));  // '{"$date" : ' + IntToStr(DateToUnix(date, DateTimeIsUTC)) + '}';
end;

procedure TMongoDateTimeInterceptor.ObjectReverter(Data: TObject; Field: string; Arg: TObject);
var
  date: TDateTime;
begin
 if assigned(Arg) then begin
    date := (Arg as TMongoDate).GetDatetime(DateTimeIsUTC);
    RTTIProvider.GetMember(Data, Field).SetValue(Data, date);
  end;
end;

{ TParseDateTimeInterceptor }

constructor TParseDateTimeInterceptor.Create(ADateTimeIsUTC: Boolean);
begin
  inherited Create(ADateTimeIsUTC);
  ConverterType := ctObject;
  ReverterType := rtObject;
  ObjectType := TParseDate;
end;

function TParseDateTimeInterceptor.ObjectConverter(Data: TObject; Field: string): TObject;
var
  date: TDateTime;
begin
  date := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TDateTime>;
  result := TParseDate.Create(date, DateTimeIsUTC);
end;

procedure TParseDateTimeInterceptor.ObjectReverter(Data: TObject; Field: string; Arg: TObject);
var
  date: TDateTime;
begin
 if assigned(Arg) then begin
    date := (Arg as TParseDate).GetDatetime(DateTimeIsUTC);
    RTTIProvider.GetMember(Data, Field).SetValue(Data, date);
  end;
end;

{ TGUIDInterceptor }

constructor TGUIDInterceptor.Create;
begin
  inherited Create;
  ConverterType := ctString;
  ReverterType := rtString;
end;

function TGUIDInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := RTTIProvider.GetMember(Data, Field).GetValue(Data).AsType<TGUID>.ToString;
end;

procedure TGUIDInterceptor.StringReverter(Data: TObject; Field: string; Arg: string);
var
  LGUID: TGUID;
begin
  if Arg.IsEmpty then
    LGUID := TGUID.Empty
  else
  begin
    if (Arg[1] <> '{') and (Arg[Length(Arg)] <> '}') then
      Arg := '{' + Arg + '}';
    LGUID := TGUID.Create(Arg);
  end;
  RTTIProvider.GetMember(Data, Field).SetValue(Data, TValue.From<TGUID>(LGUID));
end;

end.
