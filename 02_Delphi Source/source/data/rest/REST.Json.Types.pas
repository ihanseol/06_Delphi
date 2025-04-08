{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

/// <summary>
/// Implements several types and conversion routines for Json, such as DateTime.
/// </summary>
unit REST.Json.Types;

interface

uses
  System.Classes, System.SysUtils, System.DateUtils, System.JSON, System.JSON.Types,
  REST.Consts;

type
  TJsonIdentCase = (jicCamel, jicUpper, jicLower, jicPreserve);
  TJsonDateFormat = (jdfISO8601, jdfUnix, jdfMongo, jdfParse);
  TJsonBytesFormat = (jbfArray, jbfBase64);
  TJsonMemberSerialization = (jmFields, jmPublicProps, jmPublishedProps, jmAllPubProps);

  TJsonDates = class
  public type
    TFormat = (ISO8601, Unix, Mongo, Parse);
  public
                                      
    class function AsDateTime(const AValue: TJSONValue; ADateFormat: TFormat; AReturnUTC: Boolean): TDatetime; static;
  end;

  JSONBooleanAttribute = class(TCustomAttribute)
  private
    FValue: Boolean;
  public
    constructor Create(const AValue: Boolean = True);
    property Value: Boolean read FValue;
  end;

  /// <summary>Attribute that specifies whether a field or type should be
  /// marshalled/unmarshalled. If the attribute is not present, defaults to true.
  /// If false, the field/type will be skipped during the marshalling and
  /// unmarshalling process</summary>
  JSONMarshalledAttribute = class(JSONBooleanAttribute)
  end;

  /// <summary>Attribute that specifies whether a field should be
  /// freed before being populated during unmarshalling (if a value was
  /// assigned by the constructor). If the attribute is not present,
  /// defaults to true. If false, the field will not be freed during
  /// unmarshalling, even if an object was allocated by the constructor
  /// (may lead to memory leaks).</summary>
  JSONOwnedAttribute = class(JSONBooleanAttribute)
  end;

  /// <summary>Attribute that specifies a JSON name to use when serializing
  /// a field. If the attribute is not present, default to:
  /// * for a field - field name without leading 'F' character
  /// * for a property - property name
  /// </summary>
  JSONNameAttribute = System.JSON.Types.JsonNameAttribute;

  /// <summary>Attribute that specifies object type serialization data members:
  /// jmFields, jmPublicProps, jmPublishedProps or jmAllPubProps. If the attribute
  /// is not present, defaults to TMarshalUnmarshalBase.MemberSerialization, which
  /// by default is jmFields.</summary>
  JSONSerializeAttribute = class(TCustomAttribute)
  private
    FValue: TJsonMemberSerialization;
  public
    constructor Create(AValue: TJsonMemberSerialization);
    property Value: TJsonMemberSerialization read FValue;
  end;

  [JSONSerialize(jmFields)]
  TMongoDate = class (TObject)
  private
    [JSONName('$date')]
    FEpochDate: Int64;
  public
    constructor Create(AUnixDate: Int64);
    function GetDatetime(AReturnAsUTC: Boolean): TDatetime;
    procedure SetDatetime(const Value: TDatetime; InputIsUTC: Boolean);
  end;

  /// <summary>Represents a Parse Date Object Type for marshalling and unmarshalling </summary>
  [JSONSerialize(jmFields)]
  TParseDate = class(TObject)
  private
    [JSONName('__type')]
    Ftype: string;
    [JSONName('iso')]
    Fiso: string;
  public
    constructor Create(AValue: TDateTime; InputIsUTC: Boolean);
    /// <summary>Returns a Tdatetime based on the ISO string conversion class variable Fiso and UTC boolean</summary>
    function GetDateTime(AReturnAsUTC: Boolean): TDatetime;
    /// <summary>Set the class members ISOdate (Fiso) using a Tdatetime and UTC boolean</summary>
    procedure SetDateTime(const Value: TDateTime; InputIsUTC: Boolean);
  end;

implementation

uses
  System.StrUtils, System.Types, System.Rtti, System.TypInfo;

class function TJsonDates.AsDateTime(const AValue: TJSONValue; ADateFormat: TFormat; AReturnUTC: Boolean): TDatetime;
var
  LDateString: string;
  LEpochMS: int64;
begin
  try
    case ADateFormat of
      TFormat.ISO8601:
      begin
        LDateString := AValue.Value;
        Result := ISO8601ToDate(LDateString, AReturnUTC);
      end;
      TFormat.Unix:
      begin
        LDateString := AValue.Value;
        Result := ISO8601ToDate(LDateString, AReturnUTC);
      end;
      TFormat.Mongo:
      begin
        //{date : {$date : _ms_since_epoch}}
        LEpochMS := StrToInt64Def((AValue as TJSONObject).Get('$date').JsonValue.Value , 0);
        Result :=  UnixToDateTime(LEpochMS div 1000 , AReturnUTC);
      end;
      TFormat.Parse:
      begin
        //{"__type" : "Date", "iso" : "2015-10-08T12:30:00.000Z"}
        LDateString := (AValue as TJSONObject).Get('iso').JsonValue.Value;
        Result := ISO8601ToDate(LDateString,AReturnUTC);
      end
    else
      raise Exception.Create(sRESTUnsupportedDateTimeFormat);
    end;
  except
    result := 0;
  end;
end;

{ TMongoDate }

constructor TMongoDate.Create(AUnixDate: Int64);
begin
  inherited create;
  FEpochDate := AUnixDate * 1000; //Mongo uses Milliseconds instead of seconds
end;

function TMongoDate.GetDatetime(AReturnAsUTC: Boolean): TDatetime;
begin
  Result := UnixToDateTime(FEpochDate div 1000, AReturnAsUTC);
end;

procedure TMongoDate.SetDatetime(const Value: TDatetime; InputIsUTC: Boolean);
begin
  FEpochDate := DateTimeToUnix(Value, InputIsUTC) * 1000;
end;

{ TParseDate }

constructor TParseDate.Create(AValue: TDateTime; InputIsUTC: Boolean);
begin
  inherited create;
  Ftype := 'Date';
  Fiso := DateToISO8601(AValue, InputIsUTC);
end;

function TParseDate.GetDateTime(AReturnAsUTC: Boolean): TDatetime;
begin
  Result := ISO8601ToDate(Fiso, AReturnAsUTC);
end;

procedure TParseDate.SetDateTime(const Value: TDateTime; InputIsUTC: Boolean);
begin
  Fiso := DateToISO8601(Value, InputIsUTC);
end;

{ JSONBooleanAttribute }

constructor JSONBooleanAttribute.Create(const AValue: Boolean);
begin
  FValue := AValue;
end;

{ JSONSerializeAttribute }

constructor JSONSerializeAttribute.Create(AValue: TJsonMemberSerialization);
begin
  FValue := AValue;
end;

end.
