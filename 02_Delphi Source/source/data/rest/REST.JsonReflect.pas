{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.JsonReflect;
/// <summary>
/// REST.JsonReflect originates from Data.DBXJSONReflect, but is more light weight
/// and most importanly does not depend on meta data injected in JSON objects.<br/>
/// Its purpose is to "reflect" Json properties into TObject ones and vise versa.<br/>
/// All JSON objects created or processed here are treated in a "plain" way.
/// The implementation found here is still "rough" from a design pov, but will
/// improve over time.<br/>
///  Important: RTTI is heavily involved thus may not be disabled.
/// Currently it is not recommended to use any of this unit directly, as
/// its interface may change over time. Use REST.TJson instead (or Data.DBXJSONReflect).
// The interfaces in REST.Json can be considered stable.
/// </summary>


interface

uses
  System.SysUtils, System.StrUtils, System.JSON, System.Generics.Collections,
  System.TypInfo, System.Rtti, System.Classes,
  REST.Json.Types;

type
  /// <summary> Exception thrown when conversion or reversion process cannot complete
  /// </summary>
  /// <remarks>
  /// Most of these exception are thrown by the internal converter/reverter
  /// code. User code can trigger then when assumed pre-conditions are not met, such
  /// as a field converter transforms the value into a string but the reverter
  /// is defined for an array.
  /// </remarks>
  EConversionError = class(Exception);

  /// <summary>RTTI information cache and provider</summary>
  TRttiMetadataProvider = class
  public type
    TMembers = TArray<TRttiDataMember>;
    TMemberEnum = record
    private
      FMembers: TMembers;
      FIndex: NativeInt;
      FVisibility: TMemberVisibilities;
    public
      constructor Create(const AType: TRttiType; AProvider: TRttiMetadataProvider);
      function GetEnumerator: TMemberEnum;
      function GetCurrent: TRttiDataMember; inline;
      function MoveNext: Boolean;
      property Current: TRttiDataMember read GetCurrent;
    end;
  private type
    TTypeData = class
    private
      FSerialization: TJsonMemberSerialization;
      FVisibility: TMemberVisibilities;
      FMembers: TMembers;
    end;
  private
    FCtx: TRttiContext;
    FTypeSerializations: TObjectDictionary<TRttiType, TTypeData>;
    FMemberSerialization: TJsonMemberSerialization;
    procedure SetMemberSerialization(const AValue: TJsonMemberSerialization);
    function GetTypeData(AType: TRttiType): TTypeData;
  public
    constructor Create;
    destructor Destroy; override;

    function GetType(ATypeInfo: PTypeInfo): TRttiType; overload; inline;
    function GetType(AClass: TClass): TRttiType; overload; inline;
    function GetType(AObj: TObject): TRttiType; overload; inline;
    function GetType(const AQualifiedName: string): TRttiType; overload; inline;
    function GetMembers(const AType: TRttiType): TMemberEnum; overload;
    function GetMembers(const AObj: TObject): TMemberEnum; overload;
    function GetMember(const AType: TRttiType; const AName: string): TRttiDataMember; overload;
    function GetMember(const AObj: TObject; const AName: string): TRttiDataMember; overload;
    function GetMemberToSerialize(const AType: TRttiType; const AName: string): TRttiDataMember; overload;
    function GetMemberToSerialize(const AObj: TObject; const AName: string): TRttiDataMember; overload;
    function GetMemberToDeserialize(const AType: TRttiType; const AName: string): TRttiDataMember; overload;
    function GetMemberToDeserialize(const AObj: TObject; const AName: string): TRttiDataMember; overload;

    property Ctx: TRttiContext read FCtx;
    property MemberSerialization: TJsonMemberSerialization read FMemberSerialization
      write SetMemberSerialization default TJsonMemberSerialization.jmFields;
  end;

  /// <summary>
  /// Base converter class
  /// </summary>
  /// <remarks>
  /// Any serializer needs to inherit from this class. It provides the events
  /// API used by a marshaller class to serialize an user object.
  ///
  /// The serialization process is considered to be successfull if IsConsistent
  /// returns true.
  /// </remarks>
  TConverter<TSerial> = class abstract
  private
    FIdentCase: TJsonIdentCase;
    FRttiProvider: TRttiMetadataProvider;
  protected
    /// <summary> Returns the serialized object </summary>
    /// <returns> Serialized object </returns>
    function GetSerializedData: TSerial; virtual; abstract;
  public
    constructor Create; virtual;
    /// <summary> Resets the instance state </summary>
    /// <remarks>
    /// Clears all residual data so the instance can be reused for a new
    /// conversion.
    /// </remarks>
    procedure Clear; virtual; abstract;
    /// <summary> Event called for pre-visited instance </summary>
    /// <remarks> It is the marshal class that provides the functionality of
    /// detecting circuits in the serialization process. The un-marshal code
    /// will use the id to restore the actual pointer </remarks>
    /// <param name="TypeName"> User object type name </param>
    /// <param name="id"> The pre-visited instance id </param>
    procedure OnRefType(TypeName: string; id: Integer); virtual; abstract;
    /// <summary> Event called for each new object instance </summary>
    /// <param name="TypeName"> user object type name </param>
    procedure OnTypeStart(TypeName: string); virtual; abstract;
    /// <summary> Event called when a new user object processing ends </summary>
    /// <remarks> All fields are processed at this time </remarks>
    /// <param name="TypeName"> user object type name, matching a previous
    /// OnTypeStart event</param>
    procedure OnTypeEnd(TypeName: string); virtual; abstract;
    /// <summary> Event called for each field of an object </summary>
    /// <remarks> The field value is provided by one of the events OnString,
    /// OnNumber, OnBoolean, OnNull, OnListStart.</remarks>
    /// <param name="Field"> field name </param>
    procedure OnFieldStart(Field: TRttiDataMember); virtual; abstract;
    /// <summary> Event called for each field immediately after its value was
    /// processed. </summary>
    /// <param name="Field">Field name matching a previous ObFieldStart</param>
    procedure OnFieldEnd(Field: TRttiDataMember); virtual; abstract;
    /// <summary> Event called when a field value is a list of values </summary>
    /// <remarks> This event may be followed by a number of OnString, OnNumber
    /// OnBoolean, OnNull or even imbricated OnListStart/End events </remarks>
    procedure OnListStart; virtual; abstract;
    /// <summary> Event marking the processing of the last value of a list</summary>
    /// <remarks> The event matches a previous OnListStart event</remarks>
    procedure OnListEnd; virtual; abstract;
    /// <summary> String value event </summary>
    /// <remarks> The event was precedeed by a OnFieldStart (eventually an
    /// OnListStart) open event.</remarks>
    /// <param name="Data">Field or array element value as a string</param>
    procedure OnString(Data: string); virtual; abstract;
    /// <summary> Number value event </summary>
    /// <remarks> The event was precedeed by a OnFieldStart (eventually an
    /// OnListStart) open event.</remarks>
    /// <param name="Data">Field or array element value as a number</param>
    procedure OnNumber(Data: string); virtual; abstract;
    /// <summary> Boolean value event </summary>
    /// <remarks> The event was precedeed by a OnFieldStart (eventually an
    /// OnListStart) open event. Boolean are treated a special case of
    /// enumerations. </remarks>
    /// <param name="Data">Field or array element value as a boolean</param>
    procedure OnBoolean(Data: Boolean); virtual; abstract;
    /// <summary> Nil value event </summary>
    /// <remarks> The event was precedeed by a OnFieldStart (eventually an
    /// OnListStart) open event.</remarks>
    procedure OnNull; virtual; abstract;
    /// <summary> IsConsistent marks the successfull object serialization </summary>
    /// <remarks> By returning true it ensures that no open event exists and the
    /// serialized value can be used to restore the original value. </remarks>
    /// <returns>true if the process will return a consistent serialized object</returns>
    function IsConsistent: Boolean; virtual; abstract;
    /// <summary> Bypass for value events </summary>
    /// <remarks> Sets the expected serialized value directly </remarks>
    /// <param name="Data"> field serialized value </param>
    procedure SetCurrentValue(Data: TSerial); virtual; abstract;
    /// <summary> Serialized value, that can be used if IsConsistent is true</summary>
    property SerializedData: TSerial read GetSerializedData;
    /// <summary> RTTI information cache and provider</summary>
    property RttiProvider: TRttiMetadataProvider read FRttiProvider;
    property IdentCase: TJsonIdentCase read FIdentCase write FIdentCase;
  end;

  TListOfObjects = array of TObject;
  TListOfStrings = array of string;

  /// <summary>Type for field converters that transform a field value into an
  /// array of objects</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <result> an array of serializable objects </result>
  TObjectsConverter = reference to function(Data: TObject; Field: string): TListOfObjects;
  /// <summary>Type for field converters that transform a field value into an
  /// array of strings</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <result> an array of strings </result>
  TStringsConverter = reference to function(Data: TObject; Field: string): TListOfStrings;
  /// <summary>Type for type converters that transform any field value of the
  /// registered type into an array of objects</summary>
  /// <param name="Data">Current field object value</param>
  /// <result> an array of serializable objects </result>
  TTypeObjectsConverter = reference to function(Data: TObject): TListOfObjects;
  /// <summary>Type for type converters that transform any field value of the
  /// registered type into an array of strings</summary>
  /// <param name="Data">Current field object value</param>
  /// <result> an array of serializable strings </result>
  TTypeStringsConverter = reference to function(Data: TObject): TListOfStrings;

  /// <summary>Type for field converters that transform a field value into an
  /// object</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <result> a serializable object </result>
  TObjectConverter = reference to function(Data: TObject; Field: string): TObject;
  /// <summary>Type for field converters that transform a field value into an
  /// string</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <result> a string </result>
  TStringConverter = reference to function(Data: TObject; Field: string): string;
  /// <summary>Type for type converters that transform any field value of the
  /// registered type into an object</summary>
  /// <param name="Data">Current field object value</param>
  /// <result> a serializable object </result>
  TTypeObjectConverter = reference to function(Data: TObject): TObject;
  /// <summary>Type for type converters that transform any field value of the
  /// registered type into a string</summary>
  /// <param name="Data">Current field object value</param>
  /// <result> a string </result>
  TTypeStringConverter = reference to function(Data: TObject): string;

  /// <summary>Converter types</summary>
  TConverterType = (ctObjects, ctStrings, ctTypeObjects, ctTypeStrings, ctObject, ctString, ctTypeObject, ctTypeString);

  /// <summary>Type for field reverters that sets field to a value based on
  /// an array of objects</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <param name="Args"> an array of objects </param>
  TObjectsReverter = reference to procedure(Data: TObject; Field: string; Args: TListOfObjects);
  /// <summary>Type for field reverters that sets field to a value based on
  /// an array of strings</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <param name="Args"> an array of strings </param>
  TStringsReverter = reference to procedure(Data: TObject; Field: string; Args: TListOfStrings);
  /// <summary>Type for type reverters that create a value based on
  /// an array of objects</summary>
  /// <param name="Data">array of objects</param>
  /// <returns>object that will be set to any field of registered type</returns>
  TTypeObjectsReverter = reference to function(Data: TListOfObjects): TObject;
  /// <summary>Type for type reverters that create a value based on
  /// an array of strings</summary>
  /// <param name="Data">array of strings</param>
  /// <returns>object that will be set to any field of registered type</returns>
  TTypeStringsReverter = reference to function(Data: TListOfStrings): TObject;

  /// <summary>Type for field reverters that sets field to a value based on
  /// an object</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <param name="Arg"> an object </param>
  TObjectReverter = reference to procedure(Data: TObject; Field: string; Arg: TObject);
  /// <summary>Type for field reverters that sets field to a value based on
  /// a string</summary>
  /// <param name="Data">Current object instance being serialized</param>
  /// <param name="Field">Field name</param>
  /// <param name="Arg"> a string </param>
  TStringReverter = reference to procedure(Data: TObject; Field: string; Arg: string);
  /// <summary>Type for type reverters that create a value based on
  /// an object</summary>
  /// <param name="Data">an object</param>
  /// <returns>object that will be set to any field of registered type</returns>
  TTypeObjectReverter = reference to function(Data: TObject): TObject;
  /// <summary>Type for type reverters that create a value based on
  /// a string</summary>
  /// <param name="Data">a string</param>
  /// <returns>object that will be set to any field of registered type</returns>
  TTypeStringReverter = reference to function(Data: string): TObject;

  /// <summary>Indicate the type of items that the event or interceptor reverts.</summary>
  TReverterType = (rtObjects, rtStrings, rtTypeObjects, rtTypeStrings, rtObject, rtString, rtTypeObject, rtTypeString);

  /// <summary>Converter event class</summary>
  /// <remarks>Using the appropriate property the event type is used by the
  /// marshalling code to invoke the corresponding converter</remarks>
  TConverterEvent = class
  private
    FFieldClassType: TClass;
    FFieldName: string;
    FConverterType: TConverterType;
    FObjectsConverter: TObjectsConverter;
    FStringsConverter: TStringsConverter;
    FTypeObjectsConverter: TTypeObjectsConverter;
    FTypeStringsConverter: TTypeStringsConverter;
    FObjectConverter: TObjectConverter;
    FStringConverter: TStringConverter;
    FTypeObjectConverter: TTypeObjectConverter;
    FTypeStringConverter: TTypeStringConverter;
  protected
    procedure SetObjectsConverter(const Converter: TObjectsConverter);
    procedure SetStringsConverter(const Converter: TStringsConverter);
    procedure SetTypeObjectsConverter(const Converter: TTypeObjectsConverter);
    procedure SetTypeStringsConverter(const Converter: TTypeStringsConverter);
    procedure SetObjectConverter(const Converter: TObjectConverter);
    procedure SetStringConverter(const Converter: TStringConverter);
    procedure SetTypeObjectConverter(const Converter: TTypeObjectConverter);
    procedure SetTypeStringConverter(const Converter: TTypeStringConverter);
  public
    constructor Create; overload;
    constructor Create(AFieldClassType: TClass; const AFieldName: string); overload;

    function IsTypeConverter: Boolean;

    property ConverterType: TConverterType read FConverterType;
    property ObjectsConverter: TObjectsConverter read FObjectsConverter write SetObjectsConverter;
    property StringsConverter: TStringsConverter read FStringsConverter write SetStringsConverter;
    property TypeObjectsConverter: TTypeObjectsConverter read FTypeObjectsConverter write SetTypeObjectsConverter;
    property TypeStringsConverter: TTypeStringsConverter read FTypeStringsConverter write SetTypeStringsConverter;
    property ObjectConverter: TObjectConverter read FObjectConverter write SetObjectConverter;
    property StringConverter: TStringConverter read FStringConverter write SetStringConverter;
    property TypeObjectConverter: TTypeObjectConverter read FTypeObjectConverter write SetTypeObjectConverter;
    property TypeStringConverter: TTypeStringConverter read FTypeStringConverter write SetTypeStringConverter;
    property FieldClassType: TClass read FFieldClassType;
    property FieldName: string read FFieldName;
  end;

  TReverterEvent = class
  private
    FFieldClassType: TClass;
    FFieldName: string;
    FReverterType: TReverterType;
    FObjectsReverter: TObjectsReverter;
    FStringsReverter: TStringsReverter;
    FTypeObjectsReverter: TTypeObjectsReverter;
    FTypeStringsReverter: TTypeStringsReverter;
    FObjectReverter: TObjectReverter;
    FStringReverter: TStringReverter;
    FTypeObjectReverter: TTypeObjectReverter;
    FTypeStringReverter: TTypeStringReverter;
  protected
    procedure SetObjectsReverter(const Reverter: TObjectsReverter);
    procedure SetStringsReverter(const Reverter: TStringsReverter);
    procedure SetTypeObjectsReverter(const Reverter: TTypeObjectsReverter);
    procedure SetTypeStringsReverter(const Reverter: TTypeStringsReverter);
    procedure SetObjectReverter(const Reverter: TObjectReverter);
    procedure SetStringReverter(const Reverter: TStringReverter);
    procedure SetTypeObjectReverter(const Reverter: TTypeObjectReverter);
    procedure SetTypeStringReverter(const Reverter: TTypeStringReverter);
  public
    constructor Create; overload;
    constructor Create(AFieldClassType: TClass; const AFieldName: string); overload;

    function IsTypeReverter: Boolean;

    property ReverterType: TReverterType read FReverterType;
    property ObjectsReverter: TObjectsReverter read FObjectsReverter write SetObjectsReverter;
    property StringsReverter: TStringsReverter read FStringsReverter write SetStringsReverter;
    property TypeObjectsReverter: TTypeObjectsReverter read FTypeObjectsReverter write SetTypeObjectsReverter;
    property TypeStringsReverter: TTypeStringsReverter read FTypeStringsReverter write SetTypeStringsReverter;
    property ObjectReverter: TObjectReverter read FObjectReverter write SetObjectReverter;
    property StringReverter: TStringReverter read FStringReverter write SetStringReverter;
    property TypeObjectReverter: TTypeObjectReverter read FTypeObjectReverter write SetTypeObjectReverter;
    property TypeStringReverter: TTypeStringReverter read FTypeStringReverter write SetTypeStringReverter;

    property FieldClassType: TClass read FFieldClassType;
    property FieldName: string read FFieldName;
  end;

  TJSONCanPopulateProc = TFunc<TObject, TRttiDataMember, Boolean>;

  TJSONPopulationCustomizer = class
  private
    FCanPopulate: TJSONCanPopulateProc;
    FRttiProvider: TRttiMetadataProvider;
  protected
    function CanPopulate(Data: TObject; rttiField: TRttiDataMember): Boolean; virtual;
    procedure PrePopulateObjField(Data: TObject; rttiField: TRttiDataMember); virtual;
    procedure DoFieldPopulated(Data: TObject; rttiField: TRttiDataMember); virtual;
  public
    constructor Create(ACanPopulate: TJSONCanPopulateProc);
    /// <summary>Customizer to alter an unmarshalled object instance before
    /// populating fields</summary>
    /// <param name="Data">Current object instance being serialized</param>
    procedure PrePopulate(Data: TObject); virtual;
    /// <summary>Customizer to alter an unmarshalled object instance after
    /// populating fields</summary>
    /// <param name="Data">Current object instance being serialized</param>
    procedure PostPopulate(Data: TObject); virtual;
    /// <summary>RTTI information cache and provider</summary>
    property RttiProvider: TRttiMetadataProvider read FRttiProvider;
  end;

  TJSONInterceptor = class
  private
    FConverterType: TConverterType;
    FReverterType: TReverterType;
    FObjectType: TClass;
    FMarshalOwner: Boolean;
    FRttiProvider: TRttiMetadataProvider;
  public
    /// <summary>Converters that transforms a field value into an
    /// array of objects</summary>
    /// <param name="Data">Current object instance being serialized</param>
    /// <param name="Field">Field name</param>
    /// <result> an array of serializable objects </result>
    function ObjectsConverter(Data: TObject; Field: string): TListOfObjects; virtual;
    /// <summary>Converter that transforms a field value into an
    /// array of strings</summary>
    /// <param name="Data">Current object instance being serialized</param>
    /// <param name="Field">Field name</param>
    /// <result> an array of strings </result>
    function StringsConverter(Data: TObject; Field: string): TListOfStrings; virtual;
    /// <summary>Converter that transforms any object into an array of intermediate
    /// objects</summary>
    /// <param name="Data">Current object instance</param>
    /// <result> an array of serializable objects </result>
    function TypeObjectsConverter(Data: TObject): TListOfObjects; virtual;
    /// <summary>Converter that transforms an object instance into an array of
    /// strings</summary>
    /// <param name="Data">Current object instance</param>
    /// <result> an array of strings </result>
    function TypeStringsConverter(Data: TObject): TListOfStrings; virtual;
    /// <summary>Converters that transforms a field value into an
    /// intermediate object</summary>
    /// <param name="Data">Current object instance being serialized</param>
    /// <param name="Field">Field name</param>
    /// <result> a serializable object </result>
    function ObjectConverter(Data: TObject; Field: string): TObject; virtual;
    /// <summary>Converters that transforms a field value into an
    /// string</summary>
    /// <param name="Data">Current object instance being serialized</param>
    /// <param name="Field">Field name</param>
    /// <result> a string </result>
    function StringConverter(Data: TObject; Field: string): string; virtual;
    /// <summary>Converter that transforms an object into an equivalent
    /// that can be eventually marshaled</summary>
    /// <param name="Data">Current object instance</param>
    /// <result> an intermediate object </result>
    function TypeObjectConverter(Data: TObject): TObject; virtual;
    /// <summary>Converter for an object instance into a string</summary>
    /// <param name="Data">Current object</param>
    /// <result>string equivalent</result>
    function TypeStringConverter(Data: TObject): string; virtual;
    /// <summary>Field reverter that sets an object field to a value based on
    /// an array of intermediate objects</summary>
    /// <param name="Data">Current object instance being populated</param>
    /// <param name="Field">Field name</param>
    /// <param name="Args"> an array of objects </param>
    procedure ObjectsReverter(Data: TObject; Field: string; Args: TListOfObjects); virtual;
    /// <summary>Reverter that sets an object field to a value based on
    /// an array of strings</summary>
    /// <param name="Data">Current object instance being populated</param>
    /// <param name="Field">Field name</param>
    /// <param name="Args"> an array of strings </param>
    procedure StringsReverter(Data: TObject; Field: string; Args: TListOfStrings); virtual;
    /// <summary>Reverter that creates an object instance based on
    /// an array of intermediate objects</summary>
    /// <param name="Data">array of intermediate objects</param>
    /// <returns>object that will be set to any field of registered type</returns>
    function TypeObjectsReverter(Data: TListOfObjects): TObject; virtual;
    /// <summary>Reverter that creates an object instance from string array</summary>
    /// <param name="Data">array of strings</param>
    /// <returns>object that will be set to any field of registered type</returns>
    function TypeStringsReverter(Data: TListOfStrings): TObject; virtual;
    /// <summary>Reverter that sets an object field to a value based on
    /// an intermediate object</summary>
    /// <param name="Data">Current object instance being populated</param>
    /// <param name="Field">Field name</param>
    /// <param name="Arg"> intermediate object </param>
    procedure ObjectReverter(Data: TObject; Field: string; Arg: TObject); virtual;
    /// <summary>Reverter that sets an object field to a value from
    /// a string</summary>
    /// <param name="Data">Current object instance being populated</param>
    /// <param name="Field">Field name</param>
    /// <param name="Arg">serialized value as a string </param>
    procedure StringReverter(Data: TObject; Field: string; Arg: string); virtual;
    /// <summary>Reverter that creates an object from an intermediate serialized representation</summary>
    /// <param name="Data">TObject - intermediate object</param>
    /// <returns>object created from the serialized representation</returns>
    function TypeObjectReverter(Data: TObject): TObject; virtual;
    /// <summary>Creates an instance based from a string</summary>
    /// <param name="Data">String - string value</param>
    /// <returns>TObject - object that will be set to any field of registered type</returns>
    function TypeStringReverter(Data: string): TObject; virtual;

    function IsTypeConverter: Boolean;
    function IsTypeReverter: Boolean;

    /// <summary>RTTI information cache and provider</summary>
    property RttiProvider: TRttiMetadataProvider read FRttiProvider;

    property ConverterType: TConverterType read FConverterType write FConverterType;
    property ReverterType: TReverterType read FReverterType write FReverterType;
    property MarshalOwner: Boolean read FMarshalOwner write FMarshalOwner;

    /// <summary>
    ///   Specifies an explicit class type, if the payload object is different from the field type it gets converted from / reverted to. Only
    ///   applies to Object type interceptors. If nil, then field and payload object need to be of same type.
    ///   Used for example for TDatetime, where a date might be represented as {"$date": 123456789}
    /// </summary>
    property ObjectType: TClass read FObjectType write FObjectType;
  end;

  /// <summary>Attribute that defines the interceptor used to marshal/un-marshal
  /// data. It also used to control the life cycle of the intermediate objects
  /// that may be generated by the marshalling process.
  /// A value can be marshalled in various ways and this is the order in which is done:
  /// - a registered field event takes precedence
  /// - a registered type event
  /// - an interceptor defined by a field attribute
  /// - an interceptor defined by a type attribute
  /// - default marshal/un-marshal
  /// </summary>
  JsonReflectAttribute = class(TCustomAttribute)
  private
    FMarshalOwner: Boolean;
    FConverterType: TConverterType;
    FReverterType: TReverterType;
    FInterceptor: TClass;
    FPopulationCustomizer: TClass;
  public
    constructor Create(IsMarshalOwned: Boolean); overload;
    constructor Create(ConverterType: TConverterType; ReverterType: TReverterType; InterceptorType: TClass = nil;
      PopulationCustomizerType: TClass = nil; IsMarshalOwned: Boolean = false); overload;

    /// <summary>Creates a TJSONInterceptor instance from the current definition.
    /// </summary>
    /// <remarks>The caller takes ownership of that object</remarks>
    /// <returns>TJSONInterceptor - interceptor instance</returns>
    function JSONInterceptor: TJSONInterceptor;

    /// <summary>Creates a TJSONPopulationCustomizer instance from the current
    /// definition.</summary>
    /// <remarks>The caller takes ownership of that object</remarks>
    /// <returns>TJSONPopulationCustomizer - population customizer instance</returns>
    function JSONPopulationCustomizer: TJSONPopulationCustomizer;

    /// <summary> If true, the intermediate objects created during marshalling are freed</summary>
    property MarshalOwner: Boolean read FMarshalOwner;
  end;

  TMarshalUnmarshalBase = class
  private
    FMarshalled: TDictionary<string, Boolean>;
    FDateFormat: TJsonDateFormat;
    FDateTimeIsUTC: Boolean;
    FBytesFormat: TJsonBytesFormat;
    FRttiProvider: TRttiMetadataProvider;
    function GetMemberSerialization: TJsonMemberSerialization;
    procedure SetMemberSerialization(const AValue: TJsonMemberSerialization);
    procedure RegisterJSONMarshalled(const AComposeKey: string; Marshal: Boolean); overload;

  public
    /// <summary>static function for key generation used in dictionary lookups</summary>
    /// <param name="clazz">a meta class</param>
    /// <param name="field">field name</param>
    /// <returns>dictionary key</returns>
    class function ComposeKey(clazz: TClass; const Field: string): string; overload;

    /// <summary>Registers whether a field or type should be
    /// marshalled/unmarshalled. This takes priority over the
    /// JSONMarshalled attribute, which defaults to true.
    /// If Marshal is false, the field/type will be skipped during the marshalling or
    /// unmarshalling process</summary>
    /// <remarks>This takes priority over the JSONMarshalled attribute</remarks>
    /// <param name="clazz">object metaclass</param>
    /// <param name="field">field name</param>
    /// <param name="marshal">marshal flag</param>
    procedure RegisterJSONMarshalled(clazz: TClass; const Field: string; Marshal: Boolean); overload;
    /// <summary>Unregisters whether a field or type should be
    /// marshalled/unmarshalled. This clears the existing registration
    /// and defaults back to the JSONMarshalled attribute (if present), and true
    /// if no attribute is available</summary>
    /// <remarks>Clears the existing JSONMarshalled registration if set</remarks>
    /// <param name="clazz">object metaclass</param>
    /// <param name="field">field name</param>
    procedure UnregisterJSONMarshalled(clazz: TClass; const Field: string);
    /// <summary>Checks whether or not an object field should be marshalled
    /// based on the JSONMarshalled registration and attribute</summary>
    /// <remarks>The JSONMarshalled registration takes priority over the attribute,
    /// and both default to True</remarks>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="rttiField">TRttiDataMember - rtti instance associated with the field</param>
    /// <returns>whether or not to marshal</returns>
    function ShouldMarshal(Data: TObject; rttiField: TRttiDataMember): Boolean;

    constructor Create;
    destructor Destroy; override;

    /// <summary>RTTI information cache and provider</summary>
    property RttiProvider: TRttiMetadataProvider read FRttiProvider;

    property DateFormat: TJsonDateFormat read FDateFormat write FDateFormat default TJsonDateFormat.jdfISO8601;
    property DateTimeIsUTC: Boolean read FDateTimeIsUTC write FDateTimeIsUTC default True;
    property BytesFormat: TJsonBytesFormat read FBytesFormat write FBytesFormat default TJsonBytesFormat.jbfArray;
    /// <summary>The property specifies default object type serialization
    /// data members: jmFields, jmPublicProps, jmPublishedProps or jmAllPubProps.
    /// The default value is jmFields. This may be overriden by JSONSerialize
    /// attribute specified for a type.</summary>
    property MemberSerialization: TJsonMemberSerialization read GetMemberSerialization
      write SetMemberSerialization default TJsonMemberSerialization.jmFields;
  end;

  /// <summary> Marshalling parent class</summary>
  /// <remarks> Implements visitor patttern, has object id-marker support,
  /// converter registration support. A specialization of this class usually
  /// provides the serialization type. The constructor accepts the converter
  /// event handling</remarks>
  TTypeMarshaller<TSerial: class> = class(TMarshalUnmarshalBase)
  private type
    TLargestSet = set of byte;
    PLargestSet = ^TLargestSet;
  private
    FConverter: TConverter<TSerial>;
    FOwnConverter: Boolean;
    FConverters: TDictionary<string, TConverterEvent>;
    FShareConverters: Boolean;

  private
    function MarshalSimpleField(rttiField: TRttiDataMember; Data: Pointer): Boolean;
    procedure ReleaseConvertedObj(AObj: TObject; AConverterEvent: TJSONInterceptor);
    procedure MarshalVarValue(Value: TValue; fieldRTTI: TRttiDataMember);
  protected
    /// <summary>composes the type name by qualifying the class name with the
    /// unit name</summary>
    /// <param name="Data">non-nil object instance</param>
    class function ComposeTypeName(Data: TObject): string;
    /// <summary>restores the unit name and the class name from a type name</summary>
    /// <param name="TypeName">Type name generated by ComposeTypeName</param>
    /// <param name="UnitName">Type unit name</param>
    /// <param name="ClassName">Type class name</param>
    class procedure DecomposeTypeName(const TypeName: string; out UnitName: string; out ClassName: string);
    /// <summary>Returns a previously-registered converter for the specified field name of the specified class, or nil if there is no matching converter</summary>
    function Converter(clazz: TClass; const Field: string): TConverterEvent;
    /// <summary>Checks for the existance of a converter for given meta class and field</summary>
    /// <param name="clazz">Object type</param>
    /// <param name="field">field name</param>
    /// <returns>true if there is a converter associated with type and field</returns>
    function HasConverter(clazz: TClass; const Field: string): Boolean;
    /// <summary>Returns the attribute interceptor defined with a class type</summary>
    /// <remarks>Returns nil if there is no attribute defined with the type</remarks>
    /// <param name="clazz">TClass - class type</param>
    /// <returns>TJSONInterceptor instance</returns>
    function GetTypeConverter(clazz: TClass): TJSONInterceptor; overload;
    /// <summary>Returns the attribute interceptor defined with a class type using the class type RTTI instance</summary>
    /// <remarks>Returns nil if there is no attribute defined with the type. It is
    /// expected that the attribute defines a type interceptor
    /// </remarks>
    /// <param name="rttiType">TRTTIType - rtti instance associated with the user class type</param>
    /// <returns>TJSONInterceptor instance</returns>
    function GetTypeConverter(rttiType: TRttiType): TJSONInterceptor; overload;
    /// <summary>Returns the attribute interceptor defined with a field using the field RTTI instance</summary>
    /// <remarks>Returns nil if there is no attribute defined with the field. It is
    /// expected that the attribute defines a value interceptor
    /// </remarks>
    /// <param name="rttiField">TRttiDataMember - rtti instance associated with the field</param>
    /// <returns>TJSONInterceptor instance</returns>
    function GetTypeConverter(rttiField: TRttiDataMember): TJSONInterceptor; overload;
    /// <summary>Returns true if there is an attribute interceptor defined for a given field</summary>
    /// <param name="rttiField">TRttiDataMember - rtti instance associated with the field</param>
    /// <returns>boolean - true if there is an interceptor defined</returns>
    function HasInterceptor(rttiField: TRttiDataMember): Boolean;
    /// <summary>Marshal argument using default converters if user converters are
    /// not defined</summary>
    /// <remarks>If no user converters are defined, it tries to use the default
    /// ones. If a type converter exists then that one is used. If a field converter
    /// is used that the field converter is used. The field converter has precedence
    /// over the type one. </remarks>
    /// <param name="Data">Data to be marshelled</param>
    procedure MarshalData(Data: TObject);
    /// <summary>Marshal argument independent of field name or type</summary>
    /// <param name="Value">Data to be marshelled</param>
    /// <param name="fieldRTTI">TRttiDataMember - rtti instance associated with the field</param>
    procedure MarshalValue(Value: TValue; fieldRTTI: TRttiDataMember = nil);
    /// <summary>Marshal argument using a registered field converter</summary>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="field">field name</param>
    procedure MarshalConverter(Data: TObject; const Field: string); overload;
    /// <summary>Marshal argument using a field converter</summary>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="field">field name</param>
    /// <param name="ConverterEvent">user converter registered with this instance</param>
    procedure MarshalConverter(Data: TObject; const Field: string; const ConverterEvent: TConverterEvent); overload;
    /// <summary>Marshal argument using an attribute interceptor</summary>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="field">field name</param>
    /// <param name="ConverterEvent">interceptor defined through the attribute</param>
    procedure MarshalConverter(Data: TObject; const Field: string; const ConverterEvent: TJSONInterceptor); overload;
    /// <summary>Marshal argument using a type converter</summary>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="field">field name</param>
    /// <param name="ConverterEvent">type converter</param>
    procedure MarshalTypeConverter(Data: TObject; const Field: string; const ConverterEvent: TConverterEvent); overload;
    /// <summary>Marshal argument using a user interceptor</summary>
    /// <param name="Data">Data to be marshalled</param>
    /// <param name="field">field name</param>
    /// <param name="ConverterEvent">user interceptor instance</param>
    procedure MarshalTypeConverter(Data: TObject; const Field: string; const ConverterEvent: TJSONInterceptor); overload;
    function GetFieldType(Data: TObject; const Field: string): TRttiDataMember;
  public
    /// <summary>Marshal constructor for a given converter.</summary>
    /// <remarks> The converter is freed if second parameter is true (default)</remarks>
    /// <param name="Converter">implementation for On* events</param>
    /// <param name="OwnConverter">If true (default) it takes ownership of the
    /// converter</param>
    constructor Create(Converter: TConverter<TSerial>; OwnConverter: Boolean = true); overload; virtual;
    constructor Create(Converter: TConverter<TSerial>; OwnConverter: Boolean;
      Converters: TObjectDictionary<string, TConverterEvent>); overload; virtual;
    destructor Destroy; override;

    /// <summary>Marshals an object into an equivalent representation.</summary>
    /// <remarks>It uses the converter passed in the constructor</remarks>
    /// <param name="Data">Object instance to be serialized</param>
    /// <returns> the serialized equivalent</returns>
    function Marshal(Data: TObject): TSerial; virtual;

    /// <summary>Registers a user converter event</summary>
    /// <remarks>The converter event will be released by the destructor</remarks>
    /// <param name="clazz">object metaclass</param>
    /// <param name="field">field name</param>
    /// <param name="converter">converter event implementation</param>
    procedure RegisterConverter(clazz: TClass; const Field: string; const Converter: TConverterEvent); overload;
    /// <summary> Convenience user converter registration for object list</summary>
    /// <remarks> The event converter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> object list converter</param>
    procedure RegisterConverter(clazz: TClass; const Field: string; const func: TObjectsConverter); overload;
    /// <summary> Convenience user defined converter registration for object</summary>
    /// <remarks> The converter event is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> object converter</param>
    procedure RegisterConverter(clazz: TClass; const Field: string; const func: TObjectConverter); overload;
    /// <summary> Convenience user defined converter registration for string array</summary>
    /// <remarks> A converter event is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> user converter for string array</param>
    procedure RegisterConverter(clazz: TClass; const Field: string; const func: TStringsConverter); overload;
    /// <summary> Convenience user defined converter registration for string</summary>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> user defined string converter</param>
    procedure RegisterConverter(clazz: TClass; const Field: string; const func: TStringConverter); overload;
    /// <summary> Convenience user converter registration for object list</summary>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> user defined converter for string array</param>
    procedure RegisterConverter(clazz: TClass; const func: TTypeObjectsConverter); overload;
    /// <summary> Convenience user defined converter registration for object</summary>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> user defined converter for object</param>
    procedure RegisterConverter(clazz: TClass; const func: TTypeObjectConverter); overload;
    /// <summary> Convenience user defined converter registration for string array</summary>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> type converter for string array</param>
    procedure RegisterConverter(clazz: TClass; const func: TTypeStringsConverter); overload;
    /// <summary> Convenience user defined converter registration for string</summary>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> type converter for string</param>
    procedure RegisterConverter(clazz: TClass; const func: TTypeStringConverter); overload;

    property DefConverter: TConverter<TSerial> read FConverter;
  end;

  TJSONConverter = class(TConverter<TJSONValue>)
  private
    FRoot: TJSONValue;
    FStack: TStack<TJSONAncestor>;
  protected
    function GetSerializedData: TJSONValue; override;
    procedure ProcessData(Data: TJSONAncestor); virtual;
    function GetCurrent: TJSONAncestor;
    property Current: TJSONAncestor read GetCurrent;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Clear; override;
    function ConvertFieldNameToJson(const AField: TRttiDataMember): string; overload;
    function ConvertFieldNameToJson(AObject: TObject; const AFieldName: string): string; overload;
    procedure OnRefType(TypeName: string; id: Integer); override;
    procedure OnTypeStart(TypeName: string); override;
    procedure OnTypeEnd(TypeName: string); override;
    procedure OnFieldStart(Field: TRttiDataMember); override;
    procedure OnFieldEnd(Field: TRttiDataMember); override;
    procedure OnListStart; override;
    procedure OnListEnd; override;
    procedure OnString(Data: string); override;
    procedure OnNumber(Data: string); override;
    procedure OnBoolean(Data: Boolean); override;
    procedure OnNull; override;
    function IsConsistent: Boolean; override;
    procedure SetCurrentValue(Data: TJSONValue); override;
  end;

  TJSONMarshal = class(TTypeMarshaller<TJSONValue>)
  private
  public
    constructor Create; overload;
    constructor Create(Converter: TConverter<TJSONValue>; OwnConverter: Boolean = true); overload; override;
    constructor Create(Converter: TConverter<TJSONValue>; OwnConverter: Boolean;
      Converters: TObjectDictionary<string, TConverterEvent>); overload; override;
  end;

  /// <summary>Un-marshalling class for JSON objects</summary>
  /// <remarks>It is assumed that the JSON object was created by an instance of
  /// TJSONMarshal and proper reverters are defined with the instance.
  /// </remarks>
  TJSONUnMarshal = class(TMarshalUnmarshalBase)
  private
    FObjectHash: TDictionary<string, TObject>;
    FReverters: TDictionary<string, TReverterEvent>;
    FShareReverters: Boolean;
    function ObjectType(const TypeName: string): TRttiType;
                                                       
    // class function InnerGenericType(const ATypeName: string): string; static;
    function ConvertFieldNameFromJson(AObject: TObject; const AFieldName: string): string;
    function JSONToVarTValue(JsonValue: TJSONValue): TValue;
  public
    /// <summary>Creates a new instance of an object based on type name
    /// </summary>
    /// <remarks>It is assumed the object has a no-parameter Create constructor
    /// </remarks>
    /// <param name="TypeName">object type as generated by marshal ComposeKey</param>
    /// <returns>object instance or nil if creation fails</returns>
    function ObjectInstance(const TypeName: string): TObject;

  protected

    /// <summary>returns true if a reverter matching the given key was registered
    /// </summary>
    /// <param name="key">reverter key, as generated by ComposeKey</param>
    /// <returns>true if a reverter is available</returns>
    function HasReverter(const key: string): Boolean;
    /// <summary>Returns the interceptor responsible for reverting a field, if any</summary>
    /// <param name="field">TRttiDataMember instance associated with the field to be reverted</param>
    /// <returns>TReverterEvent instance defined by the attribute, nil there is no JsonReflect attribute</returns>
    function FieldReverter(Field: TRttiDataMember): TJSONInterceptor; overload;
    /// <summary>Returns the interceptor responsible for reverting a field, if any</summary>
    /// <param name="Data">TObject - current data instance</param>
    /// <param name="Field">String - field name where an JsonReflect attribute was defined</param>
    /// <returns>TReverterEvent instance defined by the attribute, nil there is no JsonReflect attribute</returns>
    function FieldReverter(Data: TObject; const Field: string): TJSONInterceptor; overload;
    function FieldTypeReverter(ctxType: TRttiType): TJSONInterceptor; overload;
    function FieldTypeReverter(Data: TObject; const Field: string): TJSONInterceptor; overload;
    /// <summary>Returns the reverter registered with the given key</summary>
    /// <param name="key">reverter key</param>
    /// <returns>reverter event instance</returns>
    function Reverter(const key: string): TReverterEvent;
    /// <summary>Returns the meta-class of a field</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">object field name</param>
    /// <param name="AConvertName"></param>
    /// <returns>meta class instance</returns>
    function ClassTypeOf(Data: TObject; const Field: string; AConvertName: boolean = true): TClass;

    /// <summary>returns true if the object id identifies a created object
    /// </summary>
    /// <param name="ObjId">object id</param>
    /// <returns>true if there is an object with given id</returns>
    function HasObject(const ObjId: string): Boolean;
    /// <summary>returns a stored object based on its id</summary>
    /// <param name="ObjId">object key</param>
    function GetObject(const ObjId: string): TObject;
    /// <summary>returns field's RTTI info</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    /// <returns>TRttiDataMember - RTTI field instance</returns>
    function GetFieldType(Data: TObject; const Field: string): TRttiDataMember;
    /// <summary>populates the instance fields with values from the JSON
    /// serialized representation</summary>
    /// <param name="JsonFields">serialized fields object</param>
    /// <param name="Data">object instance</param>
    /// <param name="JsonCustomizer">population customizer instance</param>
    procedure PopulateFields(JsonFields: TJSONObject; Data: TObject; JsonCustomizer: TJSONPopulationCustomizer);
    /// <summary>transforms a JSON array into an array of objects</summary>
    /// <param name="AClass">Type of objects expected to be in the JSON Array.</param>
    /// <param name="JsonArray">JSON array for a list of objects</param>
    /// <returns>list of objects</returns>
    function GetArgObjects(AClass: TClass; JsonArray: TJSONArray): TListOfObjects;
    /// <summary>transforms a JSON array into an array of strings</summary>
    /// <param name="JsonArray">JSON array for a list of strings</param>
    /// <returns>list of objects of strings</returns>
    function GetArgStrings(JsonArray: TJSONArray): TListOfStrings;
    /// <summary> Converts a JSON value into its TValue equivalent based
    /// on given type info
    /// </summary>
    /// <remarks>Throws exception if the conversion is not possible</remarks>
    /// <param name="JsonValue">JSON value</param>
    /// <param name="rttiType">type to be converted into</param>
    /// <returns>TValue equivalent of JsonValue</returns>
    function JSONToTValue(JsonValue: TJSONValue; rttiType: TRttiType): TValue;

    /// <summary> Marshal a string into a TValue based on type info
    /// </summary>
    /// <remarks>Throws exception if the conversion is not possible</remarks>
    /// <param name="Value">string value</param>
    /// <param name="typeInfo">type to be converted into</param>
    /// <returns>TValue equivalent of Value</returns>
    function StringToTValue(const Value: string; typeInfo: PTypeInfo): TValue;
    /// <summary> Invokes the reverter event for a given field. As an end result
    /// the field is populated with a value from its JSON representation
    /// </summary>
    /// <param name="recField">TRttiDataMember - RTTI field to be populated</param>
    /// <param name="Instance">Pointer - current object address</param>
    /// <param name="revEv">TReverterEvent - user reverter that will generate
    /// the field value </param>
    /// <param name="jsonFieldVal">TJSONValue - JSON value used to populate user's value</param>
    procedure RevertType(recField: TRttiDataMember; Instance: Pointer; const revEv: TReverterEvent;
      jsonFieldVal: TJSONValue); overload;
    /// <summary> Invokes the interceptor for a given field. As an end result
    /// the field is populated with a value from its JSON representation. The
    /// interceptor is defined through an attribute
    /// </summary>
    /// <param name="recField">TRttiDataMember - RTTI field to be populated</param>
    /// <param name="Instance">Pointer - current object address</param>
    /// <param name="revEv">TJSONInterceptor - instance of the user interceptor that will generate
    /// the field value. The interceptor is specified through an attribute </param>
    /// <param name="jsonFieldVal">TJSONValue - JSON value used to populate user's value</param>
    procedure RevertType(recField: TRttiDataMember; Instance: Pointer; revEv: TJSONInterceptor;
      jsonFieldVal: TJSONValue); overload;
  public
    constructor Create; overload; virtual;
    constructor Create(Reverters: TObjectDictionary<string, TReverterEvent>); overload; virtual;
    destructor Destroy; override;

    ///	<summary>
    ///	  creates an object based on a serialized JSON representation
    ///	</summary>
    ///	<param name="AClass">
    ///	  Type of the object to be returned
    ///	</param>
    ///	<param name="JsonObj">
    ///	  JSON object instance
    ///	</param>
    ///	<param name="AObject">
    ///	  If AObject holds an instance of AClass, then this object will be filled from the values in JsonObj. I.e. no
    ///	  new instance will be created.
    ///	</param>
    ///	<returns>
    ///	  object instance
    ///	</returns>
    function CreateObject(AClass: TClass; JsonObj: TJSONObject; AObject:TObject=nil): TObject;

    /// <summary>creates an object based on a serialized JSON representation
    /// returns false isnstead of raising an exception, if the object instance cannnot be created.
    /// </summary>
    /// <param name="AClass">Type of the object to be returned by AObject</param>
    /// <param name="JsonObj">JSON object instance</param>
    /// <param name="AObject">object instance</param>
    /// <returns></returns>
    function TryCreateObject(AClass: TClass; JsonObj: TJSONObject; out AObject: TObject): Boolean;

    /// <summary>Registers a user reverter event</summary>
    /// <remarks>The reverter event object will be released by the destructor</remarks>
    /// <param name="clazz">object metaclass</param>
    /// <param name="field">field name</param>
    /// <param name="reverter">reverter event implementation</param>
    procedure RegisterReverter(clazz: TClass; const Field: string; const Reverter: TReverterEvent); overload;
    /// <summary> Convenience method for user revertor registration for an object list</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> object list reverter</param>
    procedure RegisterReverter(clazz: TClass; const Field: string; const func: TObjectsReverter); overload;
    /// <summary> Convenience method for user revertor registration for an object instance</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> object instance reverter</param>
    procedure RegisterReverter(clazz: TClass; const Field: string; const func: TObjectReverter); overload;
    /// <summary> Convenience method for user revertor registration for an string list</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func">string list reverter</param>
    procedure RegisterReverter(clazz: TClass; const Field: string; const func: TStringsReverter); overload;
    /// <summary> Convenience method for user revertor registration for a string</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="field">field name</param>
    /// <param name="func"> string generated by a converter</param>
    procedure RegisterReverter(clazz: TClass; const Field: string; const func: TStringReverter); overload;
    /// <summary> Convenience method for user type revertor registration for an object list</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> object list reverter</param>
    procedure RegisterReverter(clazz: TClass; const func: TTypeObjectsReverter); overload;
    /// <summary> Convenience method for user type revertor registration for an object</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="func"> object list reverter</param>
    procedure RegisterReverter(clazz: TClass; const func: TTypeObjectReverter); overload;
    /// <summary> Convenience method for user type revertor registration for a string list</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="func">string list reverter</param>
    procedure RegisterReverter(clazz: TClass; const func: TTypeStringsReverter); overload;
    /// <summary> Convenience method for user type revertor registration for a string</summary>
    /// <remarks> The event reverter instance is created behind the scene</remarks>
    /// <param name="clazz">meta class</param>
    /// <param name="func">string generated by a type converter</param>
    procedure RegisterReverter(clazz: TClass; const func: TTypeStringReverter); overload;
    /// <summary>sets an object field with given string value</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    /// <param name="Value">field value</param>
    /// <param name="IsNum">field type is numeric type</param>
    procedure SetField(Data: TObject; const Field: string; const Value: string; IsNum: Boolean); overload;
    /// <summary>sets an object field with given boolean value</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    /// <param name="Value">field value</param>
    procedure SetField(Data: TObject; const Field: string; Value: Boolean); overload;
    /// <summary>sets an object field with given object value</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    /// <param name="Value">field value</param>
    procedure SetField(Data: TObject; const Field: string; Value: TObject); overload;
    /// <summary>sets a field of array type
    /// </summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    /// <param name="Value">field value</param>
    procedure SetFieldArray(Data: TObject; const Field: string; Value: TJSONArray);
    /// <summary>sets an object field to nil</summary>
    /// <param name="Data">object instance</param>
    /// <param name="Field">field name</param>
    procedure SetFieldNull(Data: TObject; const Field: string);
    class function TValueToJson(JsonValue: TValue): TJSONValue; virtual;
  end;

  /// <summary>Serializable TStringList item</summary>
  TSerStringItem = class
  private
    FString: string;
    [Weak]
    FObject: TObject;
  public
    constructor Create(const AString: string; AObject: TObject);
  end;

  /// <summary>Serializable TStringList object</summary>
  [JsonReflect(true)]
  [JsonSerialize(jmFields)]
  TSerStringList = class
  private
    FSerStringItemList: array of TSerStringItem;
    FSorted: Boolean;
    FDuplicates: TDuplicates;
    FCaseSensitive: Boolean;
  public
    constructor Create(Source: TStringList);
    destructor Destroy; override;
    function AsStringList: TStringList;
  end;

  TStringListInterceptor = class(TJSONInterceptor)
  public
    function TypeObjectConverter(Data: TObject): TObject; override;
    function TypeObjectReverter(Data: TObject): TObject; override;
  end;

  TJSONConverters = class
  private
    class var
      CFRegConverters: TObjectDictionary<string, TConverterEvent>;
      CFRegReverters: TObjectDictionary<string, TReverterEvent>;
      CFRegMarshal: TDictionary<string, Boolean>;
  public
    class constructor Create;
    class destructor Destroy;
    class function GetJSONMarshaler: TJSONMarshal;
    class function GetJSONUnMarshaler: TJSONUnMarshal;

    class procedure AddConverter(event: TConverterEvent);
    class procedure AddReverter(event: TReverterEvent);
    class procedure AddMarshalFlag(AClass: TClass; AField: string; Marshal: Boolean);
    class procedure ClearMarshalFlag(AClass: TClass; AField: string);
  end;

/// <summary>Converts a TStringList into a TSerStringList</summary>
function StringListConverter(Data: TObject): TObject;
/// <summary>Reverts a TSerStringList into a TStringList</summary>
function StringListReverter(Ser: TObject): TObject;
/// <summary>Converts the pair list of a JSON Object into a serializable structure</summary>
function JSONObjectPairListConverter(Data: TObject; Field: string): TListOfObjects;
function JSONArrayElementsConverter(Data: TObject; Field: string): TListOfObjects;
procedure JSONObjectPairListReverter(Data: TObject; Field: string; Args: TListOfObjects);
procedure JSONArrayElementsReverter(Data: TObject; Field: string; Args: TListOfObjects);
/// <summary>Converts a TEncoding into a string with encoding MIME name</summary>
function EncodingConverter(Data: TObject): string;
/// <summary>Reverts a string with encoding MIME name into a TEncoding</summary>
function EncodingReverter(Data: string): TObject;

/// <summary>Returns the value of a boolean attribute on an RTTI object or
/// DefaultValue if the attribute is not set. </summary>
/// <param name="rttiObject">Object to check for attribute value</param>
/// <param name="AttributeClass">Class of boolean attribute to check (must
/// extend JSONBooleanAttribute)</param>
/// <param name="DefaultValue">Value to return if the attribute is not
/// present on rttiObject</param>
/// <returns>Value of boolean attribute or DefaultValue if the attribute
/// is not set</returns>
function JSONBooleanAttributeValue(rttiObject: TRttiNamedObject; AttributeClass: TClass;
  DefaultValue: Boolean = false): Boolean;

type
  TInternalJSONPopulationCustomizer = class(TJSONPopulationCustomizer)
  private type
    TBackupCache = class(TObjectDictionary<TRttiDataMember, TObject>)
    protected
      procedure ValueNotify(const Value: TObject; Action: TCollectionNotification); override;
      constructor Create;
    end;
  private
    FBackupCache: TBackupCache;
  protected
    procedure PrePopulateObjField(Data: TObject; rttiField: TRttiDataMember); override;
    procedure DoFieldPopulated(Data: TObject; rttiField: TRttiDataMember); override;
  public
    constructor Create(ACanPopulate: TJSONCanPopulateProc);
    destructor Destroy; override;
    procedure PostPopulate(Data: TObject); override;
  end;

  TListTFieldsEditor = class(TObject)
  private type
    TListCvt = class(TEnumerable<Integer>)
    private
{$HINTS OFF}
      FListHelper: TListHelper;
{$HINTS ON}
    end;
  private
    FRttiProvider: TRttiMetadataProvider;
    FSkipping: Integer;
  public
    constructor Create(const ARTTIProvider: TRttiMetadataProvider);
    class function ShouldEdit(clazz: TClass): Boolean; overload; static;
    class function ShouldEdit(Data: TObject): Boolean; overload; static; inline;
    function ShouldMarshal(Data: TObject; const [ref] rttiField: TRttiDataMember): Boolean;
    function TryPopulateFields(UnMarshal: TJSONUnMarshal; Data: TObject; const FieldName: string;
      JsonFields: TJSONObject; var I: Integer): Boolean;
    function ShouldPrePopulate(Data: TObject; rttiField: TRttiDataMember): Boolean;
  end;

implementation

uses
  System.RTLConsts,
  System.JSONConsts,
  System.JSON.Types,
{$IFDEF MACOS}
  Macapi.CoreFoundation,
{$ENDIF MACOS}
  REST.Json.Interceptors,
  System.Variants;

const
  FIELD_ANY = '*';
  SEP_DOT = '.';

// converts the pair list of a JSON Object into a serializable structure
function JSONObjectPairListConverter(Data: TObject; Field: string): TListOfObjects;
var
  I: Integer;
begin
  Assert(Data is TJSONObject);
  SetLength(Result, TJSONObject(Data).Count);

  for I := 0 to TJSONObject(Data).Count - 1 do
    Result[I] := TJSONObject(Data).Pairs[I]
end;

function JSONArrayElementsConverter(Data: TObject; Field: string): TListOfObjects;
var
  I: Integer;
begin
  Assert(Data is TJSONArray);
  SetLength(Result, TJSONArray(Data).Count);
  for I := 0 to TJSONArray(Data).Count - 1 do
    Result[I] := TJSONArray(Data).Items[I]
end;

procedure JSONObjectPairListReverter(Data: TObject; Field: string; Args: TListOfObjects);
var
  I: Integer;
begin
  Assert(Data is TJSONObject);
  TJSONObject(Data).SetPairs(TList<TJSONPair>.Create);
  for I := 0 to Length(Args) - 1 do
  begin
    Assert(Args[I] <> nil);
    Assert(Args[I] is TJSONPair);
    TJSONObject(Data).AddPair(TJSONPair(Args[I]));
  end;
end;

procedure JSONArrayElementsReverter(Data: TObject; Field: string; Args: TListOfObjects);
var
  I: Integer;
begin
  Assert(Data is TJSONArray);
  TJSONArray(Data).SetElements(TList<TJSONValue>.Create);
  for I := 0 to Length(Args) - 1 do
  begin
    Assert(Args[I] <> nil);
    Assert(Args[I] is TJSONValue);
    TJSONArray(Data).AddElement(TJSONValue(Args[I]));
  end;
end;

procedure JSONStringStrBufferReverter(Data: TObject; Field: string; Arg: TObject);
begin
  Assert(Data is TJSONString);
  Assert(Arg is TStringBuilder);
  TJSONString(Data).Create(TStringBuilder(Arg).ToString);
  Arg.Free;
end;

function JSONStringStrBufferConverter(Data: TObject; Field: string): TObject;
begin
  Assert(Data is TJSONString);
  Result := TStringBuilder.Create(TJSONString(Data).Value);
end;

// Provide converter and reverter because TRttiDataMember.FieldType is nil for TStringBuilder.FData
procedure StringBuilderReverter(Data: TObject; Field: string; Arg: string);
begin
  Assert(Data is TStringBuilder);
  TStringBuilder(Data).Clear;
  TStringBuilder(Data).Append(Arg);
end;

function StringBuilderConverter(Data: TObject; Field: string): string;
begin
  Assert(Data is TStringBuilder);
  Result := TStringBuilder(Data).ToString;
end;

function EncodingReverter(Data: string): TObject;
begin
  if Data = '' then
    Result := nil
  else
    Result := TEncoding.GetEncoding(Data);
end;

function EncodingConverter(Data: TObject): string;
begin
  Assert(Data is TEncoding);
  if Data = nil then
    Result := ''
  else
    Result := TEncoding(Data).MIMEName;
end;

{ TRttiMetadataProvider.TMemberEnum }

constructor TRttiMetadataProvider.TMemberEnum.Create(const AType: TRttiType; AProvider: TRttiMetadataProvider);
var
  LData: TRttiMetadataProvider.TTypeData;
begin
  FIndex := -1;
  if AType = nil then
  begin
    FMembers := nil;
    FVisibility := [];
  end
  else
  begin
    LData := AProvider.GetTypeData(AType);
    FMembers := LData.FMembers;
    FVisibility := LData.FVisibility;
  end;
end;

function TRttiMetadataProvider.TMemberEnum.GetEnumerator: TMemberEnum;
begin
  Result := Self;
end;

function TRttiMetadataProvider.TMemberEnum.GetCurrent: TRttiDataMember;
begin
  Result := FMembers[FIndex];
end;

function TRttiMetadataProvider.TMemberEnum.MoveNext: Boolean;
var
  LHigh: NativeInt;
begin
  LHigh := High(FMembers);
  while FIndex < LHigh do
  begin
    Inc(FIndex);
    if FMembers[FIndex].Visibility in FVisibility then
      Exit(True);
  end;
  Result := False;
end;

{ TRttiMetadataProvider }

constructor TRttiMetadataProvider.Create;
begin
  inherited Create;
  FCtx := TRttiContext.Create;
  FCtx.GetType(TObject);
  MemberSerialization := TJsonMemberSerialization.jmFields;
  FTypeSerializations := TObjectDictionary<TRttiType, TTypeData>.Create([doOwnsValues]);
end;

destructor TRttiMetadataProvider.Destroy;
begin
  FTypeSerializations.Free;
  FCtx.Free;
  inherited Destroy;
end;

procedure TRttiMetadataProvider.SetMemberSerialization(
  const AValue: TJsonMemberSerialization);
begin
  if FMemberSerialization <> AValue then
  begin
    TMonitor.Enter(FTypeSerializations);
    try
      FMemberSerialization := AValue;
      FTypeSerializations.Clear;
    finally
      TMonitor.Exit(FTypeSerializations);
    end;
  end;
end;

function TRttiMetadataProvider.GetTypeData(
  AType: TRttiType): TTypeData;
var
  LAttr: JSONSerializeAttribute;
begin
  TMonitor.Enter(FTypeSerializations);
  try
    if not FTypeSerializations.TryGetValue(AType, Result) then
    begin
      Result := TTypeData.Create;
      if AType is TRttiRecordType then
        Result.FSerialization := jmFields
      else
      begin
        LAttr := AType.GetAttribute<JSONSerializeAttribute>;
        if LAttr <> nil then
          Result.FSerialization := LAttr.Value
        else if (AType is TRttiInstanceType) and (
            TListTFieldsEditor.ShouldEdit(TRttiInstanceType(AType).MetaclassType) or
            TRttiInstanceType(AType).MetaclassType.InheritsFrom(TStringList) or
            TRttiInstanceType(AType).MetaclassType.InheritsFrom(TStringBuilder)) then
          Result.FSerialization := jmFields
        else
          Result.FSerialization := MemberSerialization;
      end;
      case Result.FSerialization of
      TJsonMemberSerialization.jmFields:
        begin
          Result.FMembers := TMembers(AType.GetFields);
          Result.FVisibility := [Low(TMemberVisibility)..High(TMemberVisibility)];
        end;
      TJsonMemberSerialization.jmPublicProps:
        begin
          Result.FMembers := TMembers(AType.GetProperties);
          Result.FVisibility := [mvPublic];
        end;
      TJsonMemberSerialization.jmPublishedProps:
        begin
          Result.FMembers := TMembers(AType.GetProperties);
          Result.FVisibility := [mvPublished];
        end;
      TJsonMemberSerialization.jmAllPubProps:
        begin
          Result.FMembers := TMembers(AType.GetProperties);
          Result.FVisibility := [mvPublic, mvPublished];
        end;
      end;
      FTypeSerializations.Add(AType, Result);
    end;
  finally
    TMonitor.Exit(FTypeSerializations);
  end;
end;

function TRttiMetadataProvider.GetType(ATypeInfo: PTypeInfo): TRttiType;
begin
  Result := FCtx.GetType(ATypeInfo);
end;

function TRttiMetadataProvider.GetType(AClass: TClass): TRttiType;
begin
  Result := FCtx.GetType(AClass);
end;

function TRttiMetadataProvider.GetType(AObj: TObject): TRttiType;
begin
  Result := GetType(AObj.ClassType);
end;

function TRttiMetadataProvider.GetType(const AQualifiedName: string): TRttiType;
begin
  Result := FCtx.FindType(AQualifiedName);
end;

function TRttiMetadataProvider.GetMembers(const AType: TRttiType): TMemberEnum;
begin
  Result := TMemberEnum.Create(AType, Self);
end;

function TRttiMetadataProvider.GetMembers(const AObj: TObject): TMemberEnum;
begin
  Result := GetMembers(GetType(AObj));
end;

function TRttiMetadataProvider.GetMember(const AType: TRttiType; const AName: string): TRttiDataMember;
begin
  Result := nil;
  if AType = nil then
    Exit;
  case GetTypeData(AType).FSerialization of
  TJsonMemberSerialization.jmFields:
    Result := AType.GetField(AName);
  TJsonMemberSerialization.jmPublicProps:
    begin
      Result := AType.GetProperty(AName);
      if (Result <> nil) and (Result.Visibility <> mvPublic) then
        Result := nil;
    end;
  TJsonMemberSerialization.jmPublishedProps:
    begin
      Result := AType.GetProperty(AName);
      if (Result <> nil) and (Result.Visibility <> mvPublished) then
        Result := nil;
    end;
  TJsonMemberSerialization.jmAllPubProps:
    begin
      Result := AType.GetProperty(AName);
      if (Result <> nil) and not (Result.Visibility in [mvPublic, mvPublished]) then
        Result := nil;
    end;
  end;
end;

function TRttiMetadataProvider.GetMember(const AObj: TObject; const AName: string): TRttiDataMember;
begin
  Result := GetMember(GetType(AObj), AName);
end;

function TRttiMetadataProvider.GetMemberToSerialize(const AType: TRttiType; const AName: string): TRttiDataMember;
begin
  if GetTypeData(AType).FSerialization = TJsonMemberSerialization.jmFields then
  begin
    Result := AType.GetField(AName);
    // If property name was given instead of field name
    if not Assigned(Result) then
      Result := AType.GetField('F' + AName);
  end
  else
    Result := GetMember(AType, AName);
end;

function TRttiMetadataProvider.GetMemberToSerialize(const AObj: TObject; const AName: string): TRttiDataMember;
begin
  Result := GetMemberToSerialize(GetType(AObj), AName);
end;

function TRttiMetadataProvider.GetMemberToDeserialize(const AType: TRttiType; const AName: string): TRttiDataMember;
begin
  if GetTypeData(AType).FSerialization = TJsonMemberSerialization.jmFields then
  begin
    // Delphi Fieldname usually start with "F", which we don't have in JSON
    Result := AType.GetField('F' + AName);
    if Result = nil then
      Result := AType.GetField(AName);
  end
  else
    Result := GetMember(AType, AName);
end;

function TRttiMetadataProvider.GetMemberToDeserialize(const AObj: TObject; const AName: string): TRttiDataMember;
begin
  Result := GetMemberToSerialize(GetType(AObj), AName);
end;

{ TConverter<TSerial> }

constructor TConverter<TSerial>.Create;
begin

end;

{ TJSONConverter }

constructor TJSONConverter.Create;
begin
  inherited Create;
  FStack := TStack<TJSONAncestor>.Create;
end;

destructor TJSONConverter.Destroy;
begin
  // it is normally an error to have an non-empty stack at this point
  Clear;
  FreeAndNil(FStack);
  inherited Destroy;
end;

procedure TJSONConverter.Clear;
begin
  if not IsConsistent then
    FreeAndNil(FRoot)
  else
    FRoot := nil;
  FStack.Clear;
end;

function TJSONConverter.GetCurrent: TJSONAncestor;
begin
  if FStack.Count = 0 then
    Result := nil
  else
    Result := FStack.Peek
end;

function TJSONConverter.GetSerializedData: TJSONValue;
begin
  Result := FRoot;
end;

function TJSONConverter.IsConsistent: Boolean;
begin
  Result := (FRoot <> nil) and (FStack.Count = 0)
end;

procedure TJSONConverter.OnBoolean(Data: Boolean);
begin
  if Data then
    ProcessData(TJSONTrue.Create)
  else
    ProcessData(TJSONFalse.Create)
end;

procedure TJSONConverter.OnFieldEnd(Field: TRttiDataMember);
var
  LFieldName: string;
begin
  LFieldName := ConvertFieldNameToJson(Field);
  if (Current is TJSONPair) and (TJSONPair(Current).JsonString.Value = LFieldName) then
  begin
    if TJSONPair(Current).JsonValue = nil then
      raise EConversionError.CreateResFmt(@SFieldValueMissing, [LFieldName]);
    FStack.Pop;
  end
  else
    raise EConversionError.CreateResFmt(@SFieldExpected, [LFieldName]);
end;

procedure TJSONConverter.OnFieldStart(Field: TRttiDataMember);
var
  LFieldName: string;
begin
  LFieldName := ConvertFieldNameToJson(Field);
  ProcessData(TJSONPair.Create(LFieldName, nil));
end;

procedure TJSONConverter.OnListEnd;
begin
  if Current is TJSONArray then
    FStack.Pop
  else if Current = nil then
    raise EConversionError.CreateResFmt(@SArrayExpected, ['nil'])
  else
    raise EConversionError.CreateRes(@SNoArray)
end;

procedure TJSONConverter.OnListStart;
begin
  ProcessData(TJSONArray.Create);
end;

procedure TJSONConverter.OnNull;
begin
  ProcessData(TJSONNull.Create);
end;

procedure TJSONConverter.OnNumber(Data: string);
begin
  ProcessData(TJSONNumber.Create(Data));
end;

procedure TJSONConverter.OnRefType(TypeName: string; id: Integer);
begin
  ProcessData(TJSONObject.Create);
  FStack.Pop;
end;

procedure TJSONConverter.OnString(Data: string);
begin
  ProcessData(TJSONString.Create(Data));
end;

procedure TJSONConverter.OnTypeEnd(TypeName: string);
begin
  FStack.Pop;
end;

procedure TJSONConverter.OnTypeStart(TypeName: string);
begin
  ProcessData(TJSONObject.Create);
end;

procedure TJSONConverter.ProcessData(Data: TJSONAncestor);
begin
  // setup the root
  if FRoot = nil then
    if Data is TJSONValue then
      FRoot := TJSONValue(Data)
    else
      raise EConversionError.CreateResFmt(@SValueExpected, [Data.ClassName]);
  // update current
  if Current <> nil then
  begin
    // pair for an object?
    if Data is TJSONPair then
      if Current is TJSONObject then
        TJSONObject(Current).AddPair(TJSONPair(Data))
      else
        raise EConversionError.CreateRes(@SObjectExpectedForPair)
    else if not(Data is TJSONValue) then
      raise EConversionError.CreateResFmt(@SValueExpected, [Data.ClassName])
    else
      SetCurrentValue(TJSONValue(Data));
  end
  else if Data is TJSONPair then
    raise EConversionError.CreateRes(@SInvalidContextForPair);
  // push into the stack
  if (Data is TJSONObject) or (Data is TJSONPair) or (Data is TJSONArray) then
    FStack.Push(Data);
end;

function TJSONConverter.ConvertFieldNameToJson(AObject: TObject; const AFieldName: string): string;
var
  LField: TRttiDataMember;
begin
  LField := FRttiProvider.GetMemberToSerialize(AObject, AFieldName);
  Result := ConvertFieldNameToJson(LField);
end;

function TJSONConverter.ConvertFieldNameToJson(const AField: TRttiDataMember): string;
var
  LAttribute: TCustomAttribute;
begin
  // First check if JsonNameAttribute is applied. Take without conversion
  Result := '';
  for LAttribute in AField.GetAttributes do
  begin
    if LAttribute is JsonNameAttribute then
    begin
      Result := JsonNameAttribute(LAttribute).Value;
      Break;
    end;
  end;
  // No Name Attribute found, regular rules apply
  if Result = '' then
  begin
    Result := AField.Name;
    // Delphi Fieldname usually start with "F", which we don't want in JSON
    if (AField is TRttiField) and Result.StartsWith('F', True) then
      Result := Result.Remove(0, 1);
    // Javascript (i.e. JSON) defaults to lower Camel case, i.e. first letter lower case
    // FFullName='Elmo' => {"fullName":"Elmo"}
    case IdentCase of
      jicCamel:
        Result := AnsiLowerCase(Result.Chars[0]) + Result.Substring(1);
      jicUpper:
        Result := AnsiUpperCase(Result);
      jicLower:
        Result := AnsiLowerCase(Result);
      jicPreserve:
        ;
    end;
  end;
end;

procedure TJSONConverter.SetCurrentValue(Data: TJSONValue);
begin
  // data for a pair or an array
  if Current is TJSONPair then
    TJSONPair(Current).JsonValue := TJSONValue(Data)
  else if Current is TJSONArray then
    TJSONArray(Current).AddElement(TJSONValue(Data))
  else
    raise EConversionError.CreateRes(@SInvalidContext);
end;

{ TTypeMarshaller<TSerial> }

class function TTypeMarshaller<TSerial>.ComposeTypeName(Data: TObject): string;
begin
  Result := Data.UnitName + SEP_DOT + Data.ClassName;
end;

function TTypeMarshaller<TSerial>.Converter(clazz: TClass; const Field: string): TConverterEvent;
var
  key: string;
begin
  key := ComposeKey(clazz, Field);
  TMonitor.Enter(FConverters);
  try
    FConverters.TryGetValue(key, Result);
  finally
    TMonitor.Exit(FConverters);
  end;
end;

constructor TTypeMarshaller<TSerial>.Create(Converter: TConverter<TSerial>; OwnConverter: Boolean;
  Converters: TObjectDictionary<string, TConverterEvent>);
begin
  inherited Create;
  FConverter := Converter;
  FConverter.FRttiProvider := FRttiProvider;
  FOwnConverter := OwnConverter;
  FConverters := Converters;
  FShareConverters := true;
end;

constructor TTypeMarshaller<TSerial>.Create(Converter: TConverter<TSerial>; OwnConverter: Boolean = true);
begin
  inherited Create;
  FConverters := TObjectDictionary<string, TConverterEvent>.Create([doOwnsValues]);
  FShareConverters := false;
  FConverter := Converter;
  FConverter.FRttiProvider := FRttiProvider;
  FOwnConverter := OwnConverter;
end;

class procedure TTypeMarshaller<TSerial>.DecomposeTypeName(const TypeName: string; out UnitName, ClassName: string);
var
  DotPos: Integer;
begin
  // find the last .
  DotPos := TypeName.LastDelimiter(SEP_DOT) + 1;
  if DotPos > 0 then
  begin
    UnitName := AnsiLeftStr(TypeName, DotPos - 1);
    ClassName := AnsiRightStr(TypeName, TypeName.Length - DotPos);
  end;
end;

destructor TTypeMarshaller<TSerial>.Destroy;
begin
  if not FShareConverters then
    FreeAndNil(FConverters);
  if FOwnConverter then
    FreeAndNil(FConverter);
  inherited;
end;

function TTypeMarshaller<TSerial>.GetTypeConverter(clazz: TClass): TJSONInterceptor;
begin
  Result := GetTypeConverter(FRttiProvider.GetType(clazz));
end;

function TTypeMarshaller<TSerial>.GetFieldType(Data: TObject; const Field: string): TRttiDataMember;
begin
  Result := FRttiProvider.GetMember(Data, Field);
end;

function TTypeMarshaller<TSerial>.GetTypeConverter(rttiField: TRttiDataMember): TJSONInterceptor;
var
  attr: TCustomAttribute;
begin
  Result := nil;
  if rttiField <> nil then
    try
      for attr in rttiField.GetAttributes do
        if attr is JsonReflectAttribute then
          Result := JsonReflectAttribute(attr).JSONInterceptor;

      // Now check for specific Converters
      if (Result = nil) and (rttiField.DataType <> nil) then
      begin
        // TDateTime
        if rttiField.DataType.IsPublicType and (
             (rttiField.DataType.QualifiedName = 'System.TDateTime') or // Do not localize
             (JSONSerializationVersion >= 34) and
               (rttiField.DataType.QualifiedName = 'System.TDate')) then // Do not localize
        begin
          case DateFormat of
            jdfISO8601: Result := TISODateTimeInterceptor.Create(DateTimeIsUTC);
            jdfUnix: Result := TUnixDateTimeInterceptor.Create(DateTimeIsUTC);
            jdfMongo: Result := TMongoDateTimeInterceptor.Create(DateTimeIsUTC);
            jdfParse: Result := TParseDateTimeInterceptor.Create(DateTimeIsUTC);
          end;
        end
        else
        // TBytes and similar
        if (rttiField.DataType is TRttiDynamicArrayType) and
           (TRttiDynamicArrayType(rttiField.DataType).ElementType <> nil) and
           (TRttiDynamicArrayType(rttiField.DataType).ElementType.Handle = TypeInfo(Byte)) then
          case BytesFormat of
          jbfArray: ;
          jbfBase64: Result := TBase64BytesInterceptor.Create;
          end
        else
        // TGUID
        if (rttiField.DataType.Handle = TypeInfo(System.TGUID)) and
           (JSONSerializationVersion >= 36) then
          Result := TGUIDInterceptor.Create;
      end;

      if Result <> nil then
        Result.FRttiProvider := FRttiProvider;
    except
    end;
end;

function TTypeMarshaller<TSerial>.GetTypeConverter(rttiType: TRttiType): TJSONInterceptor;
var
  attr: TCustomAttribute;
begin
  try
    for attr in rttiType.GetAttributes do
      if attr is JsonReflectAttribute then
        Exit(JsonReflectAttribute(attr).JSONInterceptor);
  except
  end;
  Result := nil;
end;

function TTypeMarshaller<TSerial>.HasConverter(clazz: TClass; const Field: string): Boolean;
begin
  TMonitor.Enter(FConverters);
  try
    Result := FConverters.ContainsKey(ComposeKey(clazz, Field));
  finally
    TMonitor.Exit(FConverters);
  end;
end;

//This function has little value, is expensive and should thus not be used
function TTypeMarshaller<TSerial>.HasInterceptor(rttiField: TRttiDataMember): Boolean;
var
  LConverter: TJSONInterceptor;
begin
  LConverter := GetTypeConverter(rttiField);
  result := LConverter <> nil;
  LConverter.Free;
end;

function TTypeMarshaller<TSerial>.Marshal(Data: TObject): TSerial;
begin
  try
    MarshalData(Data);
    if FConverter.IsConsistent then
      Result := FConverter.GetSerializedData
    else
      raise EConversionError.CreateRes(@SInconsistentConversion)
  finally
    FConverter.Clear;
  end;
end;

procedure TTypeMarshaller<TSerial>.ReleaseConvertedObj(AObj: TObject; AConverterEvent: TJSONInterceptor);
var
  attr: TCustomAttribute;
  rttiType: TRttiType;
begin
  if AObj = nil then
    Exit;

  if (AConverterEvent <> nil) and AConverterEvent.MarshalOwner then
  begin
    AObj.Free;
    Exit;
  end;

  rttiType := FRttiProvider.GetType(AObj);
  for attr in rttiType.GetAttributes do
    if (attr is JsonReflectAttribute) and (JsonReflectAttribute(attr).FInterceptor = nil) then
    begin
      if JsonReflectAttribute(attr).MarshalOwner then
        AObj.Free;
      Exit;
    end;
end;

procedure TTypeMarshaller<TSerial>.MarshalConverter(Data: TObject; const Field: string; const ConverterEvent: TConverterEvent);
var
  ObjItem: TObject;
  StrItem: string;
begin
  FConverter.OnFieldStart(GetFieldType(Data, Field));
  case ConverterEvent.ConverterType of
    ctObjects:
      begin
        FConverter.OnListStart;
        for ObjItem in ConverterEvent.ObjectsConverter(Data, Field) do
          try
            MarshalData(ObjItem);
          finally
            ReleaseConvertedObj(ObjItem, nil);
          end;
        FConverter.OnListEnd;
      end;
    ctStrings:
      begin
        FConverter.OnListStart;
        for StrItem in ConverterEvent.StringsConverter(Data, Field) do
          FConverter.OnString(StrItem);
        FConverter.OnListEnd;
      end;
    ctObject:
      begin
        ObjItem := ConverterEvent.ObjectConverter(Data, Field);
        try
          MarshalData(ObjItem);
        finally
          ReleaseConvertedObj(ObjItem, nil);
        end;
      end;
    ctString:
      FConverter.OnString(ConverterEvent.StringConverter(Data, Field));
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TConverterType), Integer(ConverterEvent.ConverterType))]);
  end;
  FConverter.OnFieldEnd(GetFieldType(Data, Field));
end;

procedure TTypeMarshaller<TSerial>.MarshalConverter(Data: TObject; const Field: string; const ConverterEvent: TJSONInterceptor);
var
  ObjItem: TObject;
  StrItem: string;
begin
  case ConverterEvent.ConverterType of
    ctObjects:
      begin
        FConverter.OnListStart;
        for ObjItem in ConverterEvent.ObjectsConverter(Data, Field) do
          try
            MarshalData(ObjItem);
          finally
            ReleaseConvertedObj(ObjItem, ConverterEvent);
          end;
        FConverter.OnListEnd;
      end;
    ctStrings:
      begin
        FConverter.OnListStart;
        for StrItem in ConverterEvent.StringsConverter(Data, Field) do
          FConverter.OnString(StrItem);
        FConverter.OnListEnd;
      end;
    ctObject:
      begin
        ObjItem := ConverterEvent.ObjectConverter(Data, Field);
        try
          MarshalData(ObjItem);
        finally
          ReleaseConvertedObj(ObjItem, ConverterEvent);
        end;
      end;
    ctString:
      FConverter.OnString(ConverterEvent.StringConverter(Data, Field));
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TConverterType), Integer(ConverterEvent.ConverterType))]);
  end;
end;

procedure TTypeMarshaller<TSerial>.MarshalTypeConverter(Data: TObject; const Field: string; const ConverterEvent: TConverterEvent);
var
  ObjItem: TObject;
  StrItem: string;
begin
  case ConverterEvent.ConverterType of
    ctTypeObjects:
      begin
        FConverter.OnListStart;
        for ObjItem in ConverterEvent.TypeObjectsConverter(Data) do
          MarshalData(ObjItem);
        FConverter.OnListEnd;
      end;
    ctTypeStrings:
      begin
        FConverter.OnListStart;
        for StrItem in ConverterEvent.TypeStringsConverter(Data) do
          FConverter.OnString(StrItem);
        FConverter.OnListEnd;
      end;
    ctTypeObject:
      begin
        ObjItem := ConverterEvent.TypeObjectConverter(Data);
        MarshalData(ObjItem);
      end;
    ctTypeString:
      FConverter.OnString(ConverterEvent.TypeStringConverter(Data));
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TConverterType), Integer(ConverterEvent.ConverterType))]);
  end;
end;

procedure TTypeMarshaller<TSerial>.MarshalTypeConverter(Data: TObject; const Field: string; const ConverterEvent: TJSONInterceptor);
var
  ObjItem: TObject;
  StrItem: string;
begin
  case ConverterEvent.ConverterType of
    ctTypeObjects:
      begin
        FConverter.OnListStart;
        for ObjItem in ConverterEvent.TypeObjectsConverter(Data) do
          try
            MarshalData(ObjItem);
          finally
            ReleaseConvertedObj(ObjItem, ConverterEvent);
          end;
        FConverter.OnListEnd;
      end;
    ctTypeStrings:
      begin
        FConverter.OnListStart;
        for StrItem in ConverterEvent.TypeStringsConverter(Data) do
          FConverter.OnString(StrItem);
        FConverter.OnListEnd;
      end;
    ctTypeObject:
      begin
        ObjItem := ConverterEvent.TypeObjectConverter(Data);
        try
          MarshalData(ObjItem);
        finally
          ReleaseConvertedObj(ObjItem, ConverterEvent);
        end;
      end;
    ctTypeString:
      FConverter.OnString(ConverterEvent.TypeStringConverter(Data));
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TConverterType), Integer(ConverterEvent.ConverterType))]);
  end;
end;

procedure TTypeMarshaller<TSerial>.MarshalValue(Value: TValue; fieldRTTI: TRttiDataMember);
var
  I, Len: NativeInt;
  rttiType: TRttiType;
  rttiField: TRttiDataMember;
  convEv: TJSONInterceptor;
  Data: TObject;
  valArr: TValue;
  B, BEnum: Byte;
  EnumOffset: Integer;
  PEnumInfo: PPTypeInfo;
  PSetData: Pointer;
begin
  if not (Value.Kind in [TTypeKind.tkDynArray]) and  Value.IsEmpty then
    FConverter.OnNull
  else
    case Value.Kind of
      TTypeKind.tkInteger:
        FConverter.OnNumber(IntToStr(Value.AsInteger));
      TTypeKind.tkInt64:
        FConverter.OnNumber(IntToStr(Value.AsInt64));
      TTypeKind.tkFloat:
        FConverter.OnNumber(FloatToJson(Value.AsExtended));
      TTypeKind.tkChar:
        if Value.AsType<char> = #0 then
          FConverter.OnString('')
        else
          FConverter.OnString(Value.AsString);
      TTypeKind.tkWChar:
        if Value.AsType<widechar> = #0 then
          FConverter.OnString('')
        else
          FConverter.OnString(Value.AsString);
      TTypeKind.tkString, TTypeKind.tkLString, TTypeKind.tkWString, TTypeKind.tkUString:
        FConverter.OnString(Value.AsString);
      TTypeKind.tkEnumeration:
        if ((fieldRTTI <> nil) and (string.CompareText('Boolean', fieldRTTI.DataType.Name) = 0)) or
          ((fieldRTTI = nil) and (string.CompareText('Boolean', Value.typeInfo.NameFld.ToString) = 0)) then
          FConverter.OnBoolean(Value.AsBoolean)
        else
          FConverter.OnString(GetEnumName(Value.typeInfo, TValueData(Value).FAsSLong));
      TTypeKind.tkSet:
        begin
          FConverter.OnListStart;
          PEnumInfo := Value.TypeData^.CompType;
          PSetData := Value.GetReferenceToRawData;
          if PEnumInfo <> nil then
          begin
            EnumOffset := ByteOffsetOfSet(Value.typeInfo) * 8;
            for B := 0 to SizeOfSet(Value.typeInfo) * 8 - 1 do
              if B in PLargestSet(PSetData)^ then
              begin
                BEnum := B + EnumOffset;
                TValue.Make(@BEnum, PEnumInfo^, valArr);
                MarshalValue(valArr);
              end;
          end
          else
          begin
            for B := 0 to SizeOfSet(Value.typeInfo) * 8 - 1 do
              if B in PLargestSet(PSetData)^ then
                MarshalValue(B);
          end;
          FConverter.OnListEnd;
        end;
      TTypeKind.tkDynArray, TTypeKind.tkArray:
        begin
          FConverter.OnListStart;
          Len := Value.GetArrayLength;
          for I := 0 to Len - 1 do
            MarshalValue(Value.GetArrayElement(I));
          FConverter.OnListEnd;
        end;
      TTypeKind.tkClass:
        begin
          Data := Value.AsObject;
          if (Data <> nil) then
            if HasConverter(Data.ClassType, FIELD_ANY) then
              MarshalTypeConverter(Data, EmptyStr, Converter(Data.ClassType, FIELD_ANY))
            else
            begin
              convEv := GetTypeConverter(Data.ClassType);
              if (convEv = nil) and (fieldRTTI <> nil) then
                convEv := GetTypeConverter(fieldRTTI);
              if convEv <> nil then
                try
                  MarshalTypeConverter(Data, EmptyStr, convEv)
                finally
                  convEv.Free
                end
              else
                MarshalData(Data);
            end
          else
            MarshalData(nil);
        end;
      TTypeKind.tkRecord, TTypeKind.tkMRecord:
        begin
          FConverter.OnListStart;

          // get the type definition
          rttiType := FRttiProvider.GetType(Value.typeInfo);
          // Marshal TList<T>.FListHelper as dynamic array using 10.3 layout
          if rttiType.Handle = TypeInfo(System.Generics.Collections.TListHelper) then
          begin
            valArr := GetArrayValueFromTListHelperValue(FRttiProvider.Ctx, Value, Len);
            for I := 0 to Len - 1 do
              MarshalValue(valArr.GetArrayElement(I));
          end
          else
          begin
            // get the record fields
            for rttiField in FRttiProvider.GetMembers(rttiType) do
            begin
              if rttiField.IsReadable then
                MarshalValue(rttiField.GetValue(Value.GetReferenceToRawData), rttiField);
            end;
          end;

          FConverter.OnListEnd
        end;
      TTypeKind.tkPointer:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkPointer']);
      TTypeKind.tkMethod:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkMethod']);
      TTypeKind.tkVariant:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkVariant']);
      TTypeKind.tkInterface:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkInterface']);
      TTypeKind.tkClassRef:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkClassRef']);
      TTypeKind.tkProcedure:
        raise EConversionError.CreateResFmt(@STypeNotSupported, ['tkProcedure']);
    else
      raise EConversionError.CreateResFmt(@STypeNotSupported,
        [GetEnumName(Value.typeInfo, TValueData(Value).FAsSLong)]);
    end;
end;

procedure TTypeMarshaller<TSerial>.MarshalVarValue(Value: TValue; fieldRTTI: TRttiDataMember);
begin
  MarshalValue(TValue.FromVariant(Value.AsType<Variant>), fieldRTTI);
end;

procedure TTypeMarshaller<TSerial>.MarshalConverter(Data: TObject; const Field: string);
begin
  MarshalConverter(Data, Field, Converter(Data.ClassType, Field));
end;

procedure TTypeMarshaller<TSerial>.MarshalData(Data: TObject);
var
  rttiType: TRttiType;
  rttiField: TRttiDataMember;
  convEv: TJSONInterceptor;
  lConverter: TConverterEvent;
  LFieldName: string;
  LEditor: TListTFieldsEditor;
begin
  if Data = nil then
  begin
    FConverter.OnNull;
  end
  else
  begin
    convEv := GetTypeConverter(Data.ClassType);
    if convEv <> nil then
      try
        MarshalTypeConverter(Data, '', convEv);
        Exit;
      finally
        convEv.Free;
      end;

    FConverter.OnTypeStart(ComposeTypeName(Data));
    // marshall the fields
    rttiType := FRttiProvider.GetType(Data);

    if TListTFieldsEditor.ShouldEdit(Data) then
      LEditor := TListTFieldsEditor.Create(FRttiProvider)
    else
      LEditor := nil;
    try
      for rttiField in FRttiProvider.GetMembers(rttiType) do
      begin
        if (LEditor <> nil) and not LEditor.ShouldMarshal(Data, rttiField) then
          Continue;
        if not ShouldMarshal(Data, rttiField) or not rttiField.IsReadable then
          Continue;
        LFieldName := rttiField.Name;
        if HasConverter(Data.ClassType, LFieldName) then
        begin
          lConverter := Converter(Data.ClassType, LFieldName);
          if lConverter.IsTypeConverter then
            if (rttiField.DataType <> nil) and (rttiField.DataType.TypeKind = tkClass) and
              (rttiField.GetValue(Data).AsObject <> nil) then
            begin
              FConverter.OnFieldStart(rttiField);
              MarshalTypeConverter(rttiField.GetValue(Data).AsObject, LFieldName, lConverter);
              FConverter.OnFieldEnd(rttiField)
            end
            else
              raise EConversionError.CreateResFmt(@SNoTypeInterceptorExpected, [rttiField.DataType.Name])
          else
            MarshalConverter(Data, LFieldName);
        end
        else if HasInterceptor(rttiField) then
        begin
          convEv := GetTypeConverter(rttiField);
          try
            if convEv.IsTypeConverter then
              if (rttiField.DataType <> nil) and (rttiField.DataType.TypeKind = tkClass) and
                (rttiField.GetValue(Data).AsObject <> nil) then
              begin
                FConverter.OnFieldStart(rttiField);
                MarshalTypeConverter(rttiField.GetValue(Data).AsObject, LFieldName, convEv);
                FConverter.OnFieldEnd(rttiField)
              end
              else
                raise EConversionError.CreateResFmt(@SNoTypeInterceptorExpected, [rttiField.DataType.Name])
            else
            begin
              FConverter.OnFieldStart(rttiField);
              MarshalConverter(Data, LFieldName, convEv);
              FConverter.OnFieldEnd(rttiField)
            end
          finally
            convEv.Free
          end
        end
        else if (rttiField.DataType <> nil) and (rttiField.DataType.TypeKind = tkClass) and (rttiField.GetValue(Data).AsObject <> nil) then
        begin
          if HasConverter(rttiField.GetValue(Data).AsObject.ClassType, FIELD_ANY) then
          begin
            FConverter.OnFieldStart(rttiField);
            MarshalTypeConverter(rttiField.GetValue(Data).AsObject, LFieldName,
              Converter(rttiField.GetValue(Data).AsObject.ClassType, FIELD_ANY));
            FConverter.OnFieldEnd(rttiField)
          end
          else
          begin
            convEv := GetTypeConverter(rttiField);
            if convEv <> nil then
              try
                FConverter.OnFieldStart(rttiField);
                if convEv.IsTypeConverter then
                  MarshalTypeConverter(rttiField.GetValue(Data).AsObject, LFieldName, convEv)
                else
                  MarshalConverter(rttiField.GetValue(Data).AsObject, LFieldName, convEv);
                FConverter.OnFieldEnd(rttiField)
              finally
                convEv.Free
              end
            else
            begin
              convEv := GetTypeConverter(rttiField.GetValue(Data).AsObject.ClassType);
              if convEv <> nil then
              begin
                try
                  FConverter.OnFieldStart(rttiField);
                  MarshalTypeConverter(rttiField.GetValue(Data).AsObject, LFieldName, convEv);
                  FConverter.OnFieldEnd(rttiField)
                finally
                  convEv.Free
                end;
              end
              else
              begin
                MarshalSimpleField(rttiField, Data)
              end;
            end;

          end;
        end
        else
          MarshalSimpleField(rttiField, Data)
      end;
    finally
      LEditor.Free;
    end;
    FConverter.OnTypeEnd(ComposeTypeName(Data));

  end;
end;

function TTypeMarshaller<TSerial>.MarshalSimpleField(rttiField: TRttiDataMember; Data: Pointer): Boolean;
var
  fieldValue: TValue;
  valArr: TValue;
  Len, I: NativeInt;
  LLenField: TRttiDataMember;
  LItemsField: TRttiDataMember;
begin
  if rttiField.DataType = nil then
    Exit(False);
  case rttiField.DataType.TypeKind of
    TTypeKind.tkInteger, TTypeKind.tkInt64, TTypeKind.tkChar, TTypeKind.tkWChar, TTypeKind.tkString,
      TTypeKind.tkLString, TTypeKind.tkWString, TTypeKind.tkUString, TTypeKind.tkFloat, TTypeKind.tkClass,
      TTypeKind.tkDynArray, TTypeKind.tkArray, TTypeKind.tkSet:
      begin
        fieldValue := rttiField.GetValue(Data);
        // exclude self referencing object fields
        if (rttiField.DataType.TypeKind = TTypeKind.tkClass) and
           (fieldValue.AsObject = Data) then
          Exit(False);
        FConverter.OnFieldStart(rttiField);
        MarshalValue(fieldValue);
        FConverter.OnFieldEnd(rttiField);
      end;
    TTypeKind.tkEnumeration:
      begin
        fieldValue := rttiField.GetValue(Data);
        FConverter.OnFieldStart(rttiField);
        // if fieldValue.IsType<Boolean> then
        if string.CompareText('Boolean', rttiField.DataType.Name) = 0 then
          // JSON has boolean value types
          FConverter.OnBoolean(fieldValue.AsBoolean)
        else
          MarshalValue(rttiField.GetValue(Data));
        FConverter.OnFieldEnd(rttiField);
      end;
    TTypeKind.tkRecord, TTypeKind.tkMRecord:
      begin
        // Marshal TList<T>.FListHelper as dynamic array using 10.2 layout
        if (rttiField.DataType.Handle = TypeInfo(System.Generics.Collections.TListHelper)) and
           (JSONSerializationVersion <= 32) then
        begin
          valArr := GetArrayValueFromTListHelperValue(FRttiProvider.Ctx, rttiField.GetValue(Data), Len);
          LItemsField := TRttiRecordType(rttiField.DataType).GetDeclaredFields()[0];
          LLenField := TRttiRecordType(rttiField.DataType).GetDeclaredFields()[1];
          // "listHelper":[2]
          FConverter.OnFieldStart(rttiField);
          FConverter.OnListStart;
          MarshalValue(Len, LLenField);
          FConverter.OnListEnd;
          FConverter.OnFieldEnd(rttiField);
          // "items":[{},{}]
          FConverter.OnFieldStart(LItemsField);
          FConverter.OnListStart;
          for I := 0 to Len - 1 do
            MarshalValue(valArr.GetArrayElement(I));
          FConverter.OnListEnd;
          FConverter.OnFieldEnd(LItemsField);
        end
        else
        begin
          FConverter.OnFieldStart(rttiField);
          MarshalValue(rttiField.GetValue(Data), rttiField);
          FConverter.OnFieldEnd(rttiField);
        end;
      end;
    TTypeKind.tkVariant:
      begin
        FConverter.OnFieldStart(rttiField);
        MarshalVarValue(rttiField.GetValue(Data), rttiField);
        FConverter.OnFieldEnd(rttiField);
      end;
    TTypeKind.tkMethod, TTypeKind.tkInterface, TTypeKind.tkPointer,
      TTypeKind.tkClassRef, TTypeKind.tkProcedure:
      begin
        Exit(false);
      end;
  else
    raise EConversionError.CreateResFmt(@STypeNotSupported, [rttiField.DataType.Name]);
  end;
  Exit(true);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const Field: string; const func: TStringsConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.StringsConverter := func;
  RegisterConverter(clazz, Field, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const Field: string; const func: TObjectConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.ObjectConverter := func;
  RegisterConverter(clazz, Field, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const Field: string; const func: TStringConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.StringConverter := func;
  RegisterConverter(clazz, Field, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const Field: string; const func: TObjectsConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.ObjectsConverter := func;
  RegisterConverter(clazz, Field, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const Field: string; const Converter: TConverterEvent);
begin
  TMonitor.Enter(FConverters);
  try
    FConverters.AddOrSetValue(ComposeKey(clazz, Field), Converter);
  finally
    TMonitor.Exit(FConverters);
  end;
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const func: TTypeStringsConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.TypeStringsConverter := func;
  RegisterConverter(clazz, FIELD_ANY, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const func: TTypeObjectConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.TypeObjectConverter := func;
  RegisterConverter(clazz, FIELD_ANY, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const func: TTypeObjectsConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.TypeObjectsConverter := func;
  RegisterConverter(clazz, FIELD_ANY, ConverterEvent);
end;

procedure TTypeMarshaller<TSerial>.RegisterConverter(clazz: TClass; const func: TTypeStringConverter);
var
  ConverterEvent: TConverterEvent;
begin
  ConverterEvent := TConverterEvent.Create;
  ConverterEvent.TypeStringConverter := func;
  RegisterConverter(clazz, FIELD_ANY, ConverterEvent);
end;

{ TConverterEvent }

procedure TConverterEvent.SetTypeObjectConverter(const Converter: TTypeObjectConverter);
begin
  FConverterType := ctTypeObject;
  FTypeObjectConverter := Converter;
end;

procedure TConverterEvent.SetTypeObjectsConverter(const Converter: TTypeObjectsConverter);
begin
  FConverterType := ctTypeObjects;
  FTypeObjectsConverter := Converter;
end;

procedure TConverterEvent.SetTypeStringConverter(const Converter: TTypeStringConverter);
begin
  FConverterType := ctTypeString;
  FTypeStringConverter := Converter;
end;

procedure TConverterEvent.SetTypeStringsConverter(const Converter: TTypeStringsConverter);
begin
  FConverterType := ctTypeStrings;
  FTypeStringsConverter := Converter;
end;

constructor TConverterEvent.Create;
begin
  inherited;
end;

constructor TConverterEvent.Create(AFieldClassType: TClass; const AFieldName: string);
begin
  inherited Create;

  FFieldClassType := AFieldClassType;
  FFieldName := AFieldName;
end;

function TConverterEvent.IsTypeConverter: Boolean;
begin
  Result := FConverterType in [ctTypeObjects, ctTypeStrings, ctTypeObject, ctTypeString];
end;

procedure TConverterEvent.SetObjectConverter(const Converter: TObjectConverter);
begin
  FConverterType := ctObject;
  FObjectConverter := Converter;
end;

procedure TConverterEvent.SetObjectsConverter(const Converter: TObjectsConverter);
begin
  FConverterType := ctObjects;
  FObjectsConverter := Converter;
end;

procedure TConverterEvent.SetStringConverter(const Converter: TStringConverter);
begin
  FConverterType := ctString;
  FStringConverter := Converter;
end;

procedure TConverterEvent.SetStringsConverter(const Converter: TStringsConverter);
begin
  FConverterType := ctStrings;
  FStringsConverter := Converter;
end;

{ TReverterEvent }

constructor TReverterEvent.Create;
begin
  inherited;
end;

constructor TReverterEvent.Create(AFieldClassType: TClass; const AFieldName: string);
begin
  inherited Create;

  FFieldClassType := AFieldClassType;
  FFieldName := AFieldName;
end;

function TReverterEvent.IsTypeReverter: Boolean;
begin
  Result := FReverterType in [rtTypeObjects, rtTypeStrings, rtTypeObject, rtTypeString];
end;

procedure TReverterEvent.SetObjectReverter(const Reverter: TObjectReverter);
begin
  FReverterType := rtObject;
  FObjectReverter := Reverter;
end;

procedure TReverterEvent.SetObjectsReverter(const Reverter: TObjectsReverter);
begin
  FReverterType := rtObjects;
  FObjectsReverter := Reverter;
end;

procedure TReverterEvent.SetStringReverter(const Reverter: TStringReverter);
begin
  FReverterType := rtString;
  FStringReverter := Reverter;
end;

procedure TReverterEvent.SetStringsReverter(const Reverter: TStringsReverter);
begin
  FReverterType := rtStrings;
  FStringsReverter := Reverter;
end;

procedure TReverterEvent.SetTypeObjectReverter(const Reverter: TTypeObjectReverter);
begin
  FReverterType := rtTypeObject;
  FTypeObjectReverter := Reverter;
end;

procedure TReverterEvent.SetTypeObjectsReverter(const Reverter: TTypeObjectsReverter);
begin
  FReverterType := rtTypeObjects;
  FTypeObjectsReverter := Reverter;
end;

procedure TReverterEvent.SetTypeStringReverter(const Reverter: TTypeStringReverter);
begin
  FReverterType := rtTypeString;
  FTypeStringReverter := Reverter;
end;

procedure TReverterEvent.SetTypeStringsReverter(const Reverter: TTypeStringsReverter);
begin
  FReverterType := rtTypeStrings;
  FTypeStringsReverter := Reverter;
end;

{ TJSONUnMarshal }

function TJSONUnMarshal.FieldReverter(Data: TObject; const Field: string): TJSONInterceptor;
begin
  Result := FieldReverter(GetFieldType(Data, Field));
end;

function TJSONUnMarshal.FieldTypeReverter(ctxType: TRttiType): TJSONInterceptor;
var
  attr: TCustomAttribute;
begin
  if ctxType <> nil then
  begin
    try
      for attr in ctxType.GetAttributes do
        if attr is JsonReflectAttribute then
          Exit(JsonReflectAttribute(attr).JSONInterceptor);
    except
    end;
  end;
  Result := nil;
end;

function TJSONUnMarshal.FieldTypeReverter(Data: TObject; const Field: string): TJSONInterceptor;
var
  LField: TRttiDataMember;
begin
  LField := GetFieldType(Data, Field);
  if LField <> nil then
    Result := FieldTypeReverter(LField.DataType)
  else
    Result := nil;
end;

function TJSONUnMarshal.ClassTypeOf(Data: TObject; const Field: string; AConvertName: boolean = true): TClass;
var
  tRtti: TRttiType;
  fRtti: TRttiDataMember;
  LFieldName: string;
begin
  Result := nil;
  tRtti := FRttiProvider.GetType(Data);
  if tRtti <> nil then
  begin
    LFieldName := Field;
    if AConvertName then
      LFieldName := ConvertFieldNameFromJson(Data, LFieldName);
    fRtti := FRttiProvider.GetMember(tRtti, LFieldName);
    if (fRtti <> nil) and (fRtti.DataType.IsInstance) then
      Result := fRtti.DataType.AsInstance.MetaclassType;
  end;
end;

constructor TJSONUnMarshal.Create;
begin
  inherited Create;
  FObjectHash := TDictionary<string, TObject>.Create;
  FReverters := TObjectDictionary<string, TReverterEvent>.Create([doOwnsValues]);
  FShareReverters := false;

  // JSON reverters
  RegisterReverter(TJSONObject, 'FMembers', JSONObjectPairListReverter);
  RegisterReverter(TJSONArray, 'FElements', JSONArrayElementsReverter);
  RegisterReverter(TJSONString, 'FStrBuffer', JSONStringStrBufferReverter);
  RegisterReverter(TStringBuilder, 'FData', StringBuilderReverter);
end;

constructor TJSONUnMarshal.Create(Reverters: TObjectDictionary<string, TReverterEvent>);
begin
  inherited Create;
  FObjectHash := TDictionary<string, TObject>.Create;
  FReverters := Reverters;
  FShareReverters := true;
end;

function TJSONUnMarshal.TryCreateObject(AClass: TClass; JsonObj: TJSONObject; out AObject: TObject): Boolean;
begin
  if not Assigned(AClass) then
    Result := false
  else
    try
      AObject := CreateObject(AClass, JsonObj);
      Result := true;
    except
      Result := false;
    end;
end;

function TJSONUnMarshal.CreateObject(AClass: TClass; JsonObj: TJSONObject; AObject:TObject=nil): TObject;
var
  LObjectType: string;
  LObject: TObject;
  LRttiType: TRttiType;
  LAttribute: TCustomAttribute;
  LCustomizer: TJSONPopulationCustomizer;
  LInterceptor: TJSONInterceptor;
begin
  Assert(JsonObj <> nil);
  if not Assigned(AClass) then
    result := nil
  else
  begin
    LInterceptor := nil;
    LCustomizer := nil;

    try
      LObjectType := AClass.QualifiedClassName; // RttiTypeOf(T).QualifiedName;
      LRttiType := ObjectType(LObjectType);
      if LRttiType <> nil then
        for LAttribute in LRttiType.GetAttributes do
          if LAttribute is JsonReflectAttribute then
          begin
            LCustomizer := JsonReflectAttribute(LAttribute).JSONPopulationCustomizer;
            LInterceptor := JsonReflectAttribute(LAttribute).JSONInterceptor;
          end;

      if (AObject = nil) and (LInterceptor <> nil) and (LInterceptor.ReverterType = rtTypeObject) then
      begin
        Result := LInterceptor.TypeObjectReverter(CreateObject(LInterceptor.ObjectType, JsonObj));
        Exit;
      end
      else
      begin
        if not Assigned(AObject) then
          LObject := ObjectInstance(LObjectType)
        else
          LObject := AObject;
        if LObject = nil then
          raise EConversionError.CreateResFmt(@SCannotCreateType, [LObjectType]);
      end;

      if LCustomizer = nil then // Use default population customizer to prevent leaked memory
        LCustomizer := TInternalJSONPopulationCustomizer.Create(
          function(AData: TObject; AField: TRttiDataMember): Boolean
          begin
            Result := ShouldMarshal(AData, AField);
          end);
      try
        LCustomizer.FRttiProvider := FRttiProvider;
        LCustomizer.PrePopulate(LObject);
        PopulateFields(JsonObj, LObject, LCustomizer);
        LCustomizer.PostPopulate(LObject);
      except
        if LObject <> AObject then
          LObject.Free;
        raise
      end;
    finally
      LCustomizer.Free;
      LInterceptor.Free;
    end;
    Result := LObject;
  end;
end;

destructor TJSONUnMarshal.Destroy;
begin
  FreeAndNil(FObjectHash);
  if not FShareReverters then
    FreeAndNil(FReverters);

  inherited;
end;

function TJSONUnMarshal.FieldReverter(Field: TRttiDataMember): TJSONInterceptor;
var
  fieldAttr: TCustomAttribute;
begin
  Result := nil;
  if Field <> nil then
    // First check for individual Attribute
    try
      for fieldAttr in Field.GetAttributes do
        if fieldAttr is JsonReflectAttribute then
          Result := JsonReflectAttribute(fieldAttr).JSONInterceptor;

      // Now check for specific Reverters
      if (Result = nil) and (Field.DataType <> nil) then
      begin
        // TDateTime
        if (Field.DataType.IsPublicType) and (
             (Field.DataType.QualifiedName = 'System.TDateTime') or // Do not localize
             (JSONSerializationVersion >= 34) and
               (Field.DataType.QualifiedName = 'System.TDate')) then // Do not localize
        begin
          case DateFormat of
            jdfISO8601: Result := TISODateTimeInterceptor.Create(DateTimeIsUTC);
            jdfUnix: Result := TUnixDateTimeInterceptor.Create(DateTimeIsUTC);
            jdfMongo: Result := TMongoDateTimeInterceptor.Create(DateTimeIsUTC);
            jdfParse: Result := TParseDateTimeInterceptor.Create(DateTimeIsUTC);
          end;
        end
        else
        // TBytes and similar
        if (Field.DataType is TRttiDynamicArrayType) and
           (TRttiDynamicArrayType(Field.DataType).ElementType <> nil) and
           (TRttiDynamicArrayType(Field.DataType).ElementType.Handle = TypeInfo(Byte)) then
          case BytesFormat of
          jbfArray: ;
          jbfBase64: Result := TBase64BytesInterceptor.Create;
          end
        else
        // TGUID
        if (Field.DataType.Handle = TypeInfo(System.TGUID)) and
           (JSONSerializationVersion >= 36) then
          Result := TGUIDInterceptor.Create;
      end;

      if Result <> nil then
        Result.FRttiProvider := FRttiProvider;
    except
    end;
end;

function TJSONUnMarshal.GetArgObjects(AClass: TClass; JsonArray: TJSONArray): TListOfObjects;
var
  I, Count: Integer;
  jsonVal: TJSONValue;
begin
  Count := JsonArray.Count;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
  begin
    jsonVal := JsonArray.Items[I];
    if jsonVal is TJSONObject then
      Result[I] := CreateObject(AClass, TJSONObject(jsonVal))
    else
      raise EConversionError.CreateResFmt(@SObjectExpectedInArray, [I, JsonArray.ToString]);
  end;
end;

function TJSONUnMarshal.GetArgStrings(JsonArray: TJSONArray): TListOfStrings;
var
  I, Count: Integer;
  jsonVal: TJSONValue;
begin
  Count := JsonArray.Count;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
  begin
    jsonVal := JsonArray.Items[I];
    if jsonVal is TJSONString then
      Result[I] := TJSONString(jsonVal).Value
    else
      raise EConversionError.CreateResFmt(@SStringExpectedInArray, [I, JsonArray.ToString])
  end;
end;

function TJSONUnMarshal.GetFieldType(Data: TObject; const Field: string): TRttiDataMember;
var
  LField: string;
begin
  LField := ConvertFieldNameFromJson(Data, Field);
  Result := FRttiProvider.GetMember(Data, LField);
end;

function TJSONUnMarshal.GetObject(const ObjId: string): TObject;
begin
  Result := FObjectHash.Items[ObjId];
end;

function TJSONUnMarshal.HasObject(const ObjId: string): Boolean;
begin
  Result := FObjectHash.ContainsKey(ObjId);
end;

function TJSONUnMarshal.HasReverter(const key: string): Boolean;
begin
  TMonitor.Enter(FReverters);
  try
    Exit(FReverters.ContainsKey(key));
  finally
    TMonitor.Exit(FReverters);
  end;
end;

function TJSONUnMarshal.ConvertFieldNameFromJson(AObject: TObject; const AFieldName: string): string;
var
  LRTTIField: TRttiDataMember;
  LAttribute: TCustomAttribute;
begin
  Result := '';
  // First check if any of the fields in AObject has a JSONName field name mapping
  for LRTTIField in FRttiProvider.GetMembers(AObject) do
  begin
    for LAttribute in LRTTIField.GetAttributes do
    begin
      if LAttribute is JSONNameAttribute then
      begin
        if AFieldName = JSONNameAttribute(LAttribute).Value then
          Result := LRTTIField.Name;
        Break;
      end;
    end;
  end;

  if Result = '' then
  begin
    // Delphi Fieldname usually start with "F", which we don't have in JSON:
    // FName='Elmo' => {"Name":"Elmo"}
                                        
    LRTTIField := FRttiProvider.GetMemberToDeserialize(AObject, AFieldName);
    if LRTTIField = nil then
      Result := AFieldName
    else
    begin
      Result := LRTTIField.Name;
      for LAttribute in LRTTIField.GetAttributes do
      begin
        if (LAttribute is JSONNameAttribute) or
           (LAttribute is JSONMarshalledAttribute) and not JSONMarshalledAttribute(LAttribute).Value then
        begin
          // Attributes define rules for this field
          Result := '';
          Break;
        end;
      end;
    end;
  end;
end;

procedure TJSONUnMarshal.RevertType(recField: TRttiDataMember; Instance: Pointer; const revEv: TReverterEvent;
  jsonFieldVal: TJSONValue);
begin
  case revEv.ReverterType of
    rtTypeObjects:
      begin
                                                
        if jsonFieldVal is TJSONArray then
          recField.SetValue(Instance, revEv.TypeObjectsReverter(GetArgObjects(revEv.FFieldClassType,
            TJSONArray(jsonFieldVal))))
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SArrayExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeStrings:
      begin
        if jsonFieldVal is TJSONArray then
          recField.SetValue(Instance, revEv.TypeStringsReverter(GetArgStrings(TJSONArray(jsonFieldVal))))
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SArrayExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeObject:
      begin
        if jsonFieldVal is TJSONObject then
        begin
          recField.SetValue(Instance, revEv.TypeObjectReverter(CreateObject(revEv.FFieldClassType,
            TJSONObject(jsonFieldVal))))
        end
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SObjectExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeString:
      begin
        if jsonFieldVal is TJSONString then
          recField.SetValue(Instance, revEv.TypeStringReverter(TJSONString(jsonFieldVal).Value))
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SObjectExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TReverterType), Integer(revEv.ReverterType))]);
  end;
end;

procedure TJSONUnMarshal.RevertType(recField: TRttiDataMember; Instance: Pointer; revEv: TJSONInterceptor;
  jsonFieldVal: TJSONValue);
var
  LFieldType: TClass;
begin
  case revEv.ReverterType of
    rtTypeObjects:
      begin
        if jsonFieldVal is TJSONArray then
        begin
                                                  
          LFieldType := recField.DataType.AsInstance.MetaclassType;
          recField.SetValue(Instance, revEv.TypeObjectsReverter(GetArgObjects(LFieldType, TJSONArray(jsonFieldVal))))
        end
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SArrayExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeStrings:
      begin
        if jsonFieldVal is TJSONArray then
          recField.SetValue(Instance, revEv.TypeStringsReverter(GetArgStrings(TJSONArray(jsonFieldVal))))
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SArrayExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeObject:
      begin
        if jsonFieldVal is TJSONObject then
        begin
          LFieldType := recField.DataType.AsInstance.MetaclassType;
          recField.SetValue(Instance, revEv.TypeObjectReverter(CreateObject(LFieldType, TJSONObject(jsonFieldVal))))
        end
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SObjectExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end;
    rtTypeString:
      begin
        if jsonFieldVal is TJSONString then
          recField.SetValue(Instance, revEv.TypeStringReverter(TJSONString(jsonFieldVal).Value))
        else if jsonFieldVal is TJSONNull then
          recField.SetValue(Instance, TValue.Empty)
        else
          raise EConversionError.CreateResFmt(@SObjectExpectedForField, [recField.Name, jsonFieldVal.ToString]);
      end
  else
    raise EConversionError.CreateResFmt(@SNoConversionForType,
      [GetEnumName(typeInfo(TReverterType), Integer(revEv.ReverterType))]);
  end;
end;

function TJSONUnMarshal.JSONToVarTValue(JsonValue: TJSONValue): TValue;
var
  LStr: string;
  LVal: Variant;
  LInt: Integer;
  LInt64: Int64;
begin
  if (JsonValue = nil) or (JsonValue is TJSONNull) or JsonValue.Null then
    LVal := Null
  else if JsonValue is TJSONNumber then
  begin
    LStr := TJSONNumber(JsonValue).Value;
    if TryStrToInt(LStr, LInt) then
      LVal := LInt
    else if TryStrToInt64(LStr, LInt64) then
      LVal := LInt64
    else
      LVal := TJSONNumber(JsonValue).AsDouble
  end
  else if JsonValue is TJSONString then
    LVal := TJSONString(JsonValue).Value
  else if JsonValue is TJSONBool then
    LVal := TJSONBool(JsonValue).AsBoolean
  else
    raise EConversionError.CreateResFmt(@SNoConversionAvailableForValue, [JsonValue.ClassName, 'Variant']);
  Result := TValue.FromVariant(LVal);
end;

function TJSONUnMarshal.JSONToTValue(JsonValue: TJSONValue; rttiType: TRttiType): TValue;
var
  tvArray: array of TValue;
  Value: string;
  I: Integer;
  elementType: TRttiType;
  Data: TValue;
  recField: TRttiDataMember;
  attrRev: TJSONInterceptor;
  jsonFieldVal: TJSONValue;
  ClassType: TClass;
  Instance: Pointer;
  LFieldType: TClass;
begin
  if rttiType.TypeKind = TTypeKind.tkVariant then
    Exit(JSONToVarTValue(JsonValue));

  // null or nil returns empty
  if (JsonValue = nil) or (JsonValue is TJSONNull) then
    Exit(TValue.Empty);

  // for each JSON value type
  if JsonValue is TJSONNumber then
    // get data "as is"
    Value := TJSONNumber(JsonValue).ToString
  else if JsonValue is TJSONString then
    Value := TJSONString(JsonValue).Value
  else if JsonValue is TJSONBool then
    Exit(TJSONBool(JsonValue).AsBoolean)
  else if JsonValue is TJSONObject then
  // object...
  begin
    LFieldType := rttiType.AsInstance.MetaclassType;
    Exit(CreateObject(LFieldType, TJSONObject(JsonValue)))
  end
  else
  begin
    case rttiType.TypeKind of
      TTypeKind.tkDynArray, TTypeKind.tkArray:
        begin
          // array
          SetLength(tvArray, TJSONArray(JsonValue).Count);
          if rttiType is TRttiArrayType then
            elementType := TRttiArrayType(rttiType).elementType
          else
            elementType := TRttiDynamicArrayType(rttiType).elementType;
          if elementType <> nil then
            for I := 0 to Length(tvArray) - 1 do
              tvArray[I] := JSONToTValue(TJSONArray(JsonValue).Items[I], elementType);
          Exit(TValue.FromArray(rttiType.Handle, tvArray));
        end;
      TTypeKind.tkRecord, TTypeKind.tkMRecord:
        begin
          TValue.Make(nil, rttiType.Handle, Data);
          // match the fields with the array elements
          I := 0;
          for recField in FRttiProvider.GetMembers(rttiType) do
          begin
            if not recField.IsWritable then
            begin
              Inc(I);
              Continue;
            end;

            Instance := Data.GetReferenceToRawData;
            jsonFieldVal := TJSONArray(JsonValue).Items[I];
            // check for type reverter
            ClassType := nil;
            if recField.DataType.IsInstance then
              ClassType := recField.DataType.AsInstance.MetaclassType;
            if (ClassType <> nil) then
            begin
              if HasReverter(ComposeKey(ClassType, FIELD_ANY)) then
                RevertType(recField, Instance, Reverter(ComposeKey(ClassType, FIELD_ANY)), jsonFieldVal)
              else
              begin
                attrRev := FieldTypeReverter(recField.DataType);
                if attrRev = nil then
                  attrRev := FieldReverter(recField);
                if attrRev <> nil then
                  try
                    RevertType(recField, Instance, attrRev, jsonFieldVal)
                  finally
                    attrRev.Free
                  end
                else
                  recField.SetValue(Instance, JSONToTValue(jsonFieldVal, recField.DataType));
              end
            end
            else
              recField.SetValue(Instance, JSONToTValue(jsonFieldVal, recField.DataType));
            Inc(I);
          end;
          Exit(Data);
        end;
    end;
  end;

  // transform value string into TValue based on type info
  Exit(StringToTValue(Value, rttiType.Handle));
end;

function TJSONUnMarshal.ObjectType(const TypeName: string): TRttiType;
begin
  // type name is qualified at this point (UnitName.TypeName)
  Result := FRttiProvider.GetType(TypeName);
end;

function TJSONUnMarshal.ObjectInstance(const TypeName: string): TObject;
var
  rType: TRttiType;
  mType: TRTTIMethod;
  metaClass: TClass;
begin
  Result := nil;
  rType := ObjectType(TypeName);
  if rType <> nil then
    for mType in rType.GetMethods do
      if mType.IsConstructor and (Length(mType.GetParameters) = 0) then
      begin
        // invoke
        metaClass := rType.AsInstance.MetaclassType;
        Exit(mType.Invoke(metaClass, []).AsObject);
      end;
end;

procedure TJSONUnMarshal.PopulateFields(JsonFields: TJSONObject; Data: TObject;
  JsonCustomizer: TJSONPopulationCustomizer);
var
  FieldName: string;
  jsonFieldVal: TJSONValue;
  revEv: TReverterEvent;
  revAttr: TJSONInterceptor;
  ClassType: TClass;
  JsonPairField: TJSONPair;
  LObject: TObject;
  LPopulated: Boolean;
  LObjectType: TClass;
  LDlpFieldName: string;
  I: Integer;
  LEditor: TListTFieldsEditor;
  LField: TRttiDataMember;
begin
  I := 0;
  while I < JsonFields.Count do
  begin
    JsonPairField := JsonFields.Pairs[I];
    FieldName := JsonPairField.JsonString.Value;
    jsonFieldVal := JsonPairField.JsonValue;

    LField := GetFieldType(Data, FieldName);
    if (LField <> nil) and not (LField.DataType.TypeKind in [tkClass, tkInterface]) and not LField.IsWritable then
    begin
      Inc(I);
      Continue;
    end;

    LPopulated := true;
    ClassType := Data.ClassType;
    // check for reverters
    if HasReverter(ComposeKey(ClassType, FieldName)) then
    begin
      revEv := Reverter(ComposeKey(ClassType, FieldName));
      case revEv.ReverterType of
        rtTypeObjects:
          begin
            if jsonFieldVal is TJSONArray then
            begin
                                                      
              SetField(Data, FieldName, revEv.TypeObjectsReverter(GetArgObjects(revEv.FFieldClassType,
                TJSONArray(jsonFieldVal))));
            end
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeStrings:
          begin
            if jsonFieldVal is TJSONArray then
              SetField(Data, FieldName, revEv.TypeStringsReverter(GetArgStrings(TJSONArray(jsonFieldVal))))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeObject:
          begin
            if jsonFieldVal is TJSONObject then
              SetField(Data, FieldName, revEv.TypeObjectReverter(CreateObject(revEv.FFieldClassType,
                TJSONObject(jsonFieldVal))))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeString:
          begin
            if jsonFieldVal is TJSONString then
              SetField(Data, FieldName, revEv.TypeStringReverter(TJSONString(jsonFieldVal).Value))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtObjects:
          begin
            if jsonFieldVal is TJSONArray then
                                                      
              revEv.ObjectsReverter(Data, FieldName, GetArgObjects(revEv.FFieldClassType, TJSONArray(jsonFieldVal)))
            else if jsonFieldVal is TJSONNull then
              revEv.ObjectsReverter(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtStrings:
          begin
            if jsonFieldVal is TJSONArray then
              revEv.StringsReverter(Data, FieldName, GetArgStrings(TJSONArray(jsonFieldVal)))
            else if jsonFieldVal is TJSONNull then
              revEv.ObjectsReverter(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtObject:
          begin
            if jsonFieldVal is TJSONObject then
              revEv.ObjectReverter(Data, FieldName, CreateObject(revEv.FFieldClassType, TJSONObject(jsonFieldVal)))
            else if jsonFieldVal is TJSONNull then
              revEv.ObjectsReverter(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtString:
          begin
            if jsonFieldVal is TJSONString then
              revEv.StringReverter(Data, FieldName, TJSONString(jsonFieldVal).Value)
            else if jsonFieldVal is TJSONNull then
              revEv.ObjectsReverter(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
      else
        raise EConversionError.CreateResFmt(@SNoConversionForType,
          [GetEnumName(typeInfo(TReverterType), Integer(revEv.ReverterType))]);
      end;
    end
    else if HasReverter(ComposeKey(ClassTypeOf(Data, FieldName), FIELD_ANY)) then
    begin
      revEv := Reverter(ComposeKey(ClassTypeOf(Data, FieldName), FIELD_ANY));
      case revEv.ReverterType of
        rtTypeObjects:
          begin
            if jsonFieldVal is TJSONArray then
              SetField(Data, FieldName, revEv.TypeObjectsReverter(GetArgObjects(revEv.FFieldClassType,
                TJSONArray(jsonFieldVal))))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeStrings:
          begin
            if jsonFieldVal is TJSONArray then
              SetField(Data, FieldName, revEv.TypeStringsReverter(GetArgStrings(TJSONArray(jsonFieldVal))))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeObject:
          begin
            if jsonFieldVal is TJSONObject then
              SetField(Data, FieldName, revEv.TypeObjectReverter(CreateObject(revEv.FFieldClassType,
                TJSONObject(jsonFieldVal))))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end;
        rtTypeString:
          begin
            if jsonFieldVal is TJSONString then
              SetField(Data, FieldName, revEv.TypeStringReverter(TJSONString(jsonFieldVal).Value))
            else if jsonFieldVal is TJSONNull then
              SetField(Data, FieldName, nil)
            else
              raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
          end
      else
        raise EConversionError.CreateResFmt(@SNoConversionForType,
          [GetEnumName(typeInfo(TReverterType), Integer(revEv.ReverterType))]);
      end;
    end
    else
    begin
      revAttr := FieldReverter(Data, FieldName);
      if revAttr = nil then
        revAttr := FieldTypeReverter(Data, FieldName);
      if revAttr <> nil then
        try
          // Reverters may be implemented elsewhere and don't know about our fieldName Mapping rules
          LDlpFieldName := ConvertFieldNameFromJson(Data, FieldName);
          if assigned(revAttr.ObjectType) then
            LObjectType := revAttr.ObjectType
          else
            LObjectType := ClassTypeOf(Data, LDlpFieldName, false);
          case revAttr.ReverterType of
            rtTypeObjects:
              begin
                if jsonFieldVal is TJSONArray then
                begin
                  SetField(Data, FieldName, revAttr.TypeObjectsReverter(GetArgObjects(revAttr.ObjectType,
                    TJSONArray(jsonFieldVal))))
                end
                else if jsonFieldVal is TJSONNull then
                  SetField(Data, FieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtTypeStrings:
              begin
                if jsonFieldVal is TJSONArray then
                  SetField(Data, FieldName, revAttr.TypeStringsReverter(GetArgStrings(TJSONArray(jsonFieldVal))))
                else if jsonFieldVal is TJSONNull then
                  SetField(Data, FieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtTypeObject:
              begin
                if jsonFieldVal is TJSONObject then
                  SetField(Data, FieldName, revAttr.TypeObjectReverter(CreateObject(LObjectType, TJSONObject(jsonFieldVal))))
                else if jsonFieldVal is TJSONNull then
                  SetField(Data, FieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtTypeString:
              begin
                if jsonFieldVal is TJSONString then
                  SetField(Data, FieldName, revAttr.TypeStringReverter(TJSONString(jsonFieldVal).Value))
                else if jsonFieldVal is TJSONNull then
                  SetField(Data, FieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtObjects:
              begin
                if jsonFieldVal is TJSONArray then
                  revAttr.ObjectsReverter(Data, LDlpFieldName, GetArgObjects(revAttr.ObjectType,
                    TJSONArray(jsonFieldVal)))
                else if jsonFieldVal is TJSONNull then
                  revAttr.ObjectsReverter(Data, LDlpFieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtStrings:
              begin
                if jsonFieldVal is TJSONArray then
                  revAttr.StringsReverter(Data, LDlpFieldName, GetArgStrings(TJSONArray(jsonFieldVal)))
                else if jsonFieldVal is TJSONNull then
                  revAttr.ObjectsReverter(Data, LDlpFieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SArrayExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtObject:
              begin
                if jsonFieldVal is TJSONObject then
                  revAttr.ObjectReverter(Data, LDlpFieldName, CreateObject(LObjectType, TJSONObject(jsonFieldVal)))
                else if jsonFieldVal is TJSONNull then
                  revAttr.ObjectReverter(Data, LDlpFieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end;
            rtString:
              begin
                if (jsonFieldVal is TJSONString) or (jsonFieldVal is TJSONNumber) then
                  revAttr.StringReverter(Data, LDlpFieldName, jsonFieldVal.Value)
                else if jsonFieldVal is TJSONNull then
                  revAttr.ObjectsReverter(Data, LDlpFieldName, nil)
                else
                  raise EConversionError.CreateResFmt(@SObjectExpectedForField, [FieldName, jsonFieldVal.ToString]);
              end
          else
            raise EConversionError.CreateResFmt(@SNoConversionForType,
              [GetEnumName(typeInfo(TReverterType), Integer(revAttr.ReverterType))]);
          end
        finally
          revAttr.Free
        end
      else
      begin
        if jsonFieldVal is TJSONNumber then
          SetField(Data, FieldName, jsonFieldVal.ToString, True)
        else if jsonFieldVal is TJSONString then
          SetField(Data, FieldName, jsonFieldVal.Value, False)
        else if jsonFieldVal is TJSONBool then
          SetField(Data, FieldName, TJSONBool(jsonFieldVal).AsBoolean)
        else if jsonFieldVal is TJSONNull then
          SetFieldNull(Data, FieldName)
        else if jsonFieldVal is TJSONObject then
        begin
          // object...
          if (LField <> nil) and
             LField.DataType.IsInstance and not LField.IsWritable and LField.IsReadable and
             (LField.GetValue(Data).AsObject <> nil) then
          begin
            LObject := LField.GetValue(Data).AsObject;
            try
              CreateObject(LObject.ClassType, TJSONObject(jsonFieldVal), LObject);
            except
              LPopulated := false;
            end;
          end
          else
            if TryCreateObject(ClassTypeOf(Data, FieldName), TJSONObject(jsonFieldVal), LObject) then
              SetField(Data, FieldName, LObject)
            else
              LPopulated := false;
        end
        else if jsonFieldVal is TJSONArray then
        begin
          if TListTFieldsEditor.ShouldEdit(Data) then
            LEditor := TListTFieldsEditor.Create(FRttiProvider)
          else
            LEditor := nil;
          try
            if (LEditor = nil) or not LEditor.TryPopulateFields(Self, Data, FieldName, JsonFields, I) then
              SetFieldArray(Data, FieldName, TJSONArray(jsonFieldVal));
          finally
            LEditor.Free;
          end;
        end
        else
          raise EConversionError.CreateResFmt(@SInvalidJSONFieldType, [FieldName, Data.ClassName]);
      end
    end;
    if LPopulated then
      JsonCustomizer.DoFieldPopulated(Data, LField);
    Inc(I);
  end
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const Field: string; const func: TObjectReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.ObjectReverter := func;
  RegisterReverter(clazz, Field, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const Field: string; const func: TStringsReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.StringsReverter := func;
  RegisterReverter(clazz, Field, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const Field: string; const Reverter: TReverterEvent);
begin
  TMonitor.Enter(FReverters);
  try
    FReverters.AddOrSetValue(ComposeKey(clazz, Field), Reverter);
  finally
    TMonitor.Exit(FReverters);
  end;
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const Field: string; const func: TObjectsReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.ObjectsReverter := func;
  RegisterReverter(clazz, Field, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const Field: string; const func: TStringReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.StringReverter := func;
  RegisterReverter(clazz, Field, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const func: TTypeStringsReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.TypeStringsReverter := func;
  RegisterReverter(clazz, FIELD_ANY, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const func: TTypeStringReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.TypeStringReverter := func;
  RegisterReverter(clazz, FIELD_ANY, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const func: TTypeObjectsReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.TypeObjectsReverter := func;
  RegisterReverter(clazz, FIELD_ANY, ReverterEvent);
end;

procedure TJSONUnMarshal.RegisterReverter(clazz: TClass; const func: TTypeObjectReverter);
var
  ReverterEvent: TReverterEvent;
begin
  ReverterEvent := TReverterEvent.Create;
  ReverterEvent.TypeObjectReverter := func;
  RegisterReverter(clazz, FIELD_ANY, ReverterEvent);
end;

function TJSONUnMarshal.Reverter(const key: string): TReverterEvent;
begin
  TMonitor.Enter(FReverters);
  try
    Exit(FReverters.Items[key]);
  finally
    TMonitor.Exit(FReverters);
  end;
end;

procedure TJSONUnMarshal.SetField(Data: TObject; const Field: string; Value: TObject);
var
  LField: TRttiDataMember;
begin
  LField := GetFieldType(Data, Field);
  if LField <> nil then
    LField.SetValue(Data, Value);
end;

procedure TJSONUnMarshal.SetField(Data: TObject; const Field, Value: string; IsNum: Boolean);
var
  rField: TRttiDataMember;

  procedure SetVariantField;
  var
    LInt: Integer;
    LInt64: Int64;
    LDbl: Double;
  begin
    if not IsNum then
      rField.SetValue(Data, Value)
    else if TryStrToInt(Value, LInt) then
      rField.SetValue(Data, LInt)
    else if TryStrToInt64(Value, LInt64) then
      rField.SetValue(Data, LInt64)
    else if TryStrToFloat(Value, LDbl) then
      rField.SetValue(Data, LDbl)
    else
      rField.SetValue(Data, Value);
  end;

begin
  rField := GetFieldType(Data, Field);
  // if the field does not exist, then we just ignore it silently
  if rField <> nil then
    case rField.DataType.TypeKind of
      TTypeKind.tkString, TTypeKind.tkWString, TTypeKind.tkLString, TTypeKind.tkUString, TTypeKind.tkFloat,
      TTypeKind.tkInteger, TTypeKind.tkInt64, TTypeKind.tkChar, TTypeKind.tkWChar, TTypeKind.tkEnumeration:
        rField.SetValue(Data, StringToTValue(Value, rField.DataType.Handle));
      TTypeKind.tkVariant:
        SetVariantField;
    else
      raise EConversionError.CreateResFmt(@SNoValueConversionForField, [Value, Field, Data.ClassName]);
    end;
end;

procedure TJSONUnMarshal.SetField(Data: TObject; const Field: string; Value: Boolean);
var
  LField: TRttiDataMember;
begin
  LField := GetFieldType(Data, Field);
  if LField <> nil then
    LField.SetValue(Data, Value);
end;

procedure TJSONUnMarshal.SetFieldArray(Data: TObject; const Field: string; Value: TJSONArray);
var
  rField: TRttiDataMember;
  LValue: TValue;
  EnumValue: NativeInt;
  PEnumInfo: PPTypeInfo;
  LSet: Integer;
  LItem: TJSONValue;
begin
  rField := GetFieldType(Data, Field);
  if rField = nil then
    Exit;
  case rField.DataType.TypeKind of
  TTypeKind.tkArray, TTypeKind.tkDynArray:
    rField.SetValue(Data, JSONToTValue(Value, rField.DataType));
  TTypeKind.tkRecord, TTypeKind.tkMRecord:
    // Unmarshal TList<T>.FListHelper as dynamic array using 10.3 layout
    if rField.DataType.Handle = TypeInfo(System.Generics.Collections.TListHelper) then
    begin
      LValue := rField.GetValue(Data); // Get FListHelper
      SetTListHelperValueFromArrayValue(FRttiProvider.Ctx, LValue,
        function (AArrType: TRttiType): TValue
        begin
          Result := JSONToTValue(Value, AArrType);
        end);
      rField.SetValue(Data, LValue); // Set FListHelper
    end
    else
      rField.SetValue(Data, JSONToTValue(Value, rField.DataType));
  TTypeKind.tkSet:
    begin
      LSet := 0;
      PEnumInfo := GetTypeData(rField.DataType.Handle)^.CompType;
      if PEnumInfo <> nil then
      begin
        for LItem in Value do
        begin
          EnumValue := GetEnumValue(PEnumInfo^, LItem.Value);
          if EnumValue < 0 then
            raise EConversionError.CreateResFmt(@SInvalidPropertyElement, [LItem.Value]);
          Include(TIntegerSet(LSet), Enumvalue);
        end;
      end
      else
      begin
        for LItem in Value do
        begin
          EnumValue := StrToIntDef(LItem.Value, -1);
          if EnumValue < 0 then
            raise EConversionError.CreateResFmt(@SInvalidPropertyElement, [LItem.Value]);
          Include(TIntegerSet(LSet), Enumvalue);
        end;
      end;
      TValue.Make(@LSet, rField.DataType.Handle, LValue);
      rField.SetValue(Data, LValue);
    end;
  else
    raise EConversionError.CreateResFmt(@SInvalidTypeForField, [Field, rField.DataType.Name]);
  end;
end;

procedure TJSONUnMarshal.SetFieldNull(Data: TObject; const Field: string);
var
  LField: TRttiDataMember;
begin
  LField := GetFieldType(Data, Field);
  if LField <> nil then
    LField.SetValue(Data, TValue.Empty);
end;

function TJSONUnMarshal.StringToTValue(const Value: string; typeInfo: PTypeInfo): TValue;
var
  vChar: char;
  vWChar: widechar;
  FValue: TValue;
  enumVal: Integer;
  LResultDouble: Double;
begin
  case typeInfo.Kind of
{$IFNDEF NEXTGEN}
    TTypeKind.tkString:
      Exit(TValue.From<ShortString>(ShortString(Value)));
    TTypeKind.tkWString:
      Exit(TValue.From<WideString>(WideString(Value)));
{$ELSE}
    TTypeKind.tkString, TTypeKind.tkWString,
{$ENDIF !NEXTGEN}
    TTypeKind.tkLString, TTypeKind.tkUString:
      Exit(Value);
    TTypeKind.tkFloat:
      if System.Json.TryJsonToFloat(Value, LResultDouble) then
        exit(LResultDouble)
      else
        exit(0.0);
    TTypeKind.tkInteger:
      Exit(StrToIntDef(Value, 0));
    TTypeKind.tkInt64:
      Exit(StrToInt64Def(Value, 0));
    TTypeKind.tkChar:
      begin
        if Value = '' then
          vChar := #0
        else
          vChar := Value.Chars[0];
        TValue.Make(@vChar, typeInfo, FValue);
        Exit(FValue);
      end;
    TTypeKind.tkWChar:
      begin
        if Value = '' then
          vWChar := #0
        else
          vWChar := Value.Chars[0];
        TValue.Make(@vWChar, typeInfo, FValue);
        Exit(FValue);
      end;
    TTypeKind.tkEnumeration:
      begin
        enumVal := GetEnumValue(typeInfo, Value);
        TValue.Make(@enumVal, typeInfo, FValue);
        Exit(FValue);
      end
  else
    raise EConversionError.CreateResFmt(@SNoConversionAvailableForValue, [Value, typeInfo.NameFld.ToString]);
  end;
end;

class function TJSONUnMarshal.TValueToJson(JsonValue: TValue): TJSONValue;
begin
  case JsonValue.Kind of
    tkInteger, tkInt64: result := TJSONNumber.Create(JsonValue.AsInt64);
    tkFloat: result := TJSONNumber.Create(JsonValue.AsExtended);
    tkChar, tkString, tkWChar, tkLString, tkWString, tkUString: result := TJSONString.Create(JsonValue.AsString);
    //tkArray, tkDynArray: ;
  else
    begin
       result := TJSONString.Create(JsonValue.ToString);
    end;
  end;
end;

{ TSerStringItem }

constructor TSerStringItem.Create(const AString: string; AObject: TObject);
begin
  FString := AString;
  FObject := AObject;
end;

{ TSerStringList }

function TSerStringList.AsStringList: TStringList;
var
  item: TSerStringItem;
begin
  Result := TStringList.Create;
  for item in FSerStringItemList do
    Result.AddObject(item.FString, item.FObject);
  Result.Duplicates := FDuplicates;
  Result.Sorted := FSorted;
  Result.CaseSensitive := FCaseSensitive
end;

constructor TSerStringList.Create(Source: TStringList);
var
  I: Integer;
begin
  SetLength(FSerStringItemList, Source.Count);
  for I := 0 to Source.Count - 1 do
    FSerStringItemList[I] := TSerStringItem.Create(Source[I], Source.Objects[I]);
  FCaseSensitive := Source.CaseSensitive;
  FSorted := Source.Sorted;
  FDuplicates := Source.Duplicates;
end;

destructor TSerStringList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FSerStringItemList) - 1 do
    FSerStringItemList[I].Free;
  inherited;
end;

{ StringListConverter }

function StringListConverter(Data: TObject): TObject;
begin
  if Data = nil then
    Exit(nil);
  Exit(TSerStringList.Create(TStringList(Data)));
end;

{ StringListReverter }

function StringListReverter(Ser: TObject): TObject;
begin
  if Ser = nil then
    Exit(nil);
  try
    Exit(TSerStringList(Ser).AsStringList);
  finally
    Ser.Free;
  end;
end;

function JSONBooleanAttributeValue(rttiObject: TRttiNamedObject; AttributeClass: TClass; DefaultValue: Boolean = false): Boolean;
var
  rttiAttrib: TCustomAttribute;
begin
  for rttiAttrib in rttiObject.GetAttributes do
    if rttiAttrib is AttributeClass then
      Exit(JSONBooleanAttribute(rttiAttrib).Value);
  Exit(DefaultValue);
end;

{ TJSONPopulationCustomizer }

procedure TJSONPopulationCustomizer.PrePopulate(Data: TObject);
var
  rttiField: TRttiDataMember;
  LEditor: TListTFieldsEditor;
begin
  // Free any initialized fields before population
  if TListTFieldsEditor.ShouldEdit(Data) then
    LEditor := TListTFieldsEditor.Create(FRttiProvider)
  else
    LEditor := nil;
  try
    for rttiField in FRttiProvider.GetMembers(Data) do
    begin
      if not CanPopulate(Data, rttiField) then
        continue;
      if (rttiField.DataType <> nil) and (rttiField.DataType.TypeKind = tkClass) and
         rttiField.IsWritable and rttiField.IsReadable and
         JSONBooleanAttributeValue(rttiField, JSONOwnedAttribute, true) and
         (rttiField.GetValue(Data).AsObject <> nil) and
         ((LEditor = nil) or LEditor.ShouldPrePopulate(Data, rttiField)) then
        PrePopulateObjField(Data, rttiField);
    end;
  finally
    LEditor.Free;
  end;
end;

procedure TJSONPopulationCustomizer.PrePopulateObjField(Data: TObject; rttiField: TRttiDataMember);
var
  Value: TObject;
begin
  if rttiField <> nil then
  begin
    if not CanPopulate(Data, rttiField) then
      Exit;
    Value := rttiField.GetValue(Data).AsObject;
    Value.Free;
    rttiField.SetValue(Data, TValue.Empty);
  end;
end;

function TJSONPopulationCustomizer.CanPopulate(Data: TObject; rttiField: TRttiDataMember): Boolean;
begin
  if Assigned(FCanPopulate) then
    Result := FCanPopulate(Data, rttiField)
  else
    Result := JSONBooleanAttributeValue(rttiField, JSONMarshalledAttribute, true);
end;

constructor TJSONPopulationCustomizer.Create(ACanPopulate: TJSONCanPopulateProc);
begin
  inherited Create;
  FCanPopulate := ACanPopulate;
end;

procedure TJSONPopulationCustomizer.DoFieldPopulated(Data: TObject; rttiField: TRttiDataMember);
begin
  // No customization by default
end;

procedure TJSONPopulationCustomizer.PostPopulate(Data: TObject);
begin
  // No customization by default
end;

{ TJSONInterceptor }

function TJSONInterceptor.IsTypeConverter: Boolean;
begin
  Result := FConverterType in [ctTypeObjects, ctTypeStrings, ctTypeObject, ctTypeString];
end;

function TJSONInterceptor.IsTypeReverter: Boolean;
begin
  Result := FReverterType in [rtTypeObjects, rtTypeStrings, rtTypeObject, rtTypeString];
end;

function TJSONInterceptor.ObjectConverter(Data: TObject; Field: string): TObject;
begin
  Result := nil;
end;

procedure TJSONInterceptor.ObjectReverter(Data: TObject; Field: string; Arg: TObject);
begin

end;

function TJSONInterceptor.ObjectsConverter(Data: TObject; Field: string): TListOfObjects;
begin
  Result := nil;
end;

procedure TJSONInterceptor.ObjectsReverter(Data: TObject; Field: string; Args: TListOfObjects);
begin

end;

function TJSONInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := EmptyStr;
end;

procedure TJSONInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin

end;

function TJSONInterceptor.StringsConverter(Data: TObject; Field: string): TListOfStrings;
begin
  Result := nil;
end;

procedure TJSONInterceptor.StringsReverter(Data: TObject; Field: string; Args: TListOfStrings);
begin

end;

function TJSONInterceptor.TypeObjectConverter(Data: TObject): TObject;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeObjectReverter(Data: TObject): TObject;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeObjectsConverter(Data: TObject): TListOfObjects;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeObjectsReverter(Data: TListOfObjects): TObject;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeStringConverter(Data: TObject): string;
begin
  Result := EmptyStr;
end;

function TJSONInterceptor.TypeStringReverter(Data: string): TObject;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeStringsConverter(Data: TObject): TListOfStrings;
begin
  Result := nil;
end;

function TJSONInterceptor.TypeStringsReverter(Data: TListOfStrings): TObject;
begin
  Result := nil;
end;

{ TStringListInterceptor }

function TStringListInterceptor.TypeObjectConverter(Data: TObject): TObject;
begin
  Result := StringListConverter(Data);
end;

function TStringListInterceptor.TypeObjectReverter(Data: TObject): TObject;
begin
  Result := StringListReverter(Data);
end;

{ TJSONMarshal }

constructor TJSONMarshal.Create;
begin
  Create(TJSONConverter.Create, true);
end;

constructor TJSONMarshal.Create(Converter: TConverter<TJSONValue>; OwnConverter: Boolean);
begin
  inherited Create(Converter, OwnConverter);
  // JSON converters
  RegisterConverter(TJSONObject, 'FMembers', JSONObjectPairListConverter);
  RegisterConverter(TJSONArray, 'FElements', JSONArrayElementsConverter);
  RegisterConverter(TJSONString, 'FStrBuffer', JSONStringStrBufferConverter);
  RegisterConverter(TStringBuilder, 'FData', StringBuilderConverter);
end;

constructor TJSONMarshal.Create(Converter: TConverter<TJSONValue>; OwnConverter: Boolean;
  Converters: TObjectDictionary<string, TConverterEvent>);
begin
  inherited Create(Converter, OwnConverter, Converters);

end;

{ TConverters }

class constructor TJSONConverters.Create;
begin
  CFRegConverters := TObjectDictionary<string, TConverterEvent>.Create([doOwnsValues]);
  CFRegReverters := TObjectDictionary<string, TReverterEvent>.Create([doOwnsValues]);
  CFRegMarshal := TDictionary<string, Boolean>.Create;
end;

class destructor TJSONConverters.Destroy;
begin
  FreeAndNil(CFRegMarshal);
  FreeAndNil(CFRegConverters);
  FreeAndNil(CFRegReverters);
end;

class function TJSONConverters.GetJSONMarshaler: TJSONMarshal;
var
  LKey: string;
begin
  Result := TJSONMarshal.Create(TJSONConverter.Create, true, CFRegConverters);
  TMonitor.Enter(CFRegMarshal);
  try
    for LKey in CFRegMarshal.Keys do
      Result.RegisterJSONMarshalled(LKey, CFRegMarshal.Items[LKey]);
  finally
    TMonitor.Exit(CFRegMarshal);
  end;
  // add JSON converters
  Result.RegisterConverter(TJSONObject, 'FMembers', JSONObjectPairListConverter);
  Result.RegisterConverter(TJSONArray, 'FElements', JSONArrayElementsConverter);
  Result.RegisterConverter(TJSONString, 'FStrBuffer', JSONStringStrBufferConverter);
  Result.RegisterConverter(TStringBuilder, 'FData', StringBuilderConverter);
end;

class function TJSONConverters.GetJSONUnMarshaler: TJSONUnMarshal;
var
  LKey: string;
begin
  Result := TJSONUnMarshal.Create(CFRegReverters);
  TMonitor.Enter(CFRegMarshal);
  try
    for LKey in CFRegMarshal.Keys do
      Result.RegisterJSONMarshalled(LKey, CFRegMarshal.Items[LKey]);
  finally
    TMonitor.Exit(CFRegMarshal);
  end;
  // add JSON reverters
  Result.RegisterReverter(TJSONObject, 'FMembers', JSONObjectPairListReverter);
  Result.RegisterReverter(TJSONArray, 'FElements', JSONArrayElementsReverter);
  Result.RegisterReverter(TJSONString, 'FStrBuffer', JSONStringStrBufferReverter);
  Result.RegisterReverter(TStringBuilder, 'FData', StringBuilderReverter);
end;

class procedure TJSONConverters.AddConverter(event: TConverterEvent);
begin
  TMonitor.Enter(CFRegConverters);
  try
    CFRegConverters.Add(TJSONMarshal.ComposeKey(event.FieldClassType, event.FieldName), event);
  finally
    TMonitor.Exit(CFRegConverters);
  end;
end;

class procedure TJSONConverters.AddMarshalFlag(AClass: TClass; AField: string; Marshal: Boolean);
begin
  TMonitor.Enter(CFRegMarshal);
  try
    CFRegMarshal.AddOrSetValue(TJSONMarshal.ComposeKey(AClass, AField), Marshal);
  finally
    TMonitor.Exit(CFRegMarshal);
  end;
end;

class procedure TJSONConverters.ClearMarshalFlag(AClass: TClass; AField: string);
var
  LKey: string;
begin
  TMonitor.Enter(CFRegMarshal);
  try
    LKey := TJSONMarshal.ComposeKey(AClass, AField);
    if CFRegMarshal.ContainsKey(LKey) then
      CFRegMarshal.Remove(LKey);
  finally
    TMonitor.Exit(CFRegMarshal);
  end;
end;

class procedure TJSONConverters.AddReverter(event: TReverterEvent);
begin
  TMonitor.Enter(CFRegReverters);
  try
    CFRegReverters.Add(TJSONMarshal.ComposeKey(event.FieldClassType, event.FieldName), event);
  finally
    TMonitor.Exit(CFRegReverters);
  end;
end;

{ TMarshalUnmarshalBase }

constructor TMarshalUnmarshalBase.Create;
begin
  inherited Create;
  FMarshalled := TDictionary<string, Boolean>.Create;
  DateTimeIsUTC := True;
  DateFormat := TJsonDateFormat.jdfISO8601;
  BytesFormat := TJsonBytesFormat.jbfArray;
  FRttiProvider := TRttiMetadataProvider.Create;
end;

destructor TMarshalUnmarshalBase.Destroy;
begin
  FRttiProvider.Free;
  FMarshalled.Free;
  inherited Destroy;
end;

function TMarshalUnmarshalBase.GetMemberSerialization: TJsonMemberSerialization;
begin
  Result := FRttiProvider.MemberSerialization;
end;

procedure TMarshalUnmarshalBase.SetMemberSerialization(const AValue: TJsonMemberSerialization);
begin
  FRttiProvider.MemberSerialization := AValue;
end;

class function TMarshalUnmarshalBase.ComposeKey(clazz: TClass; const Field: string): string;
begin
  if clazz <> nil then
    Result := clazz.UnitName + SEP_DOT + clazz.ClassName + SEP_DOT + Field
  else
    Result := '';
end;

procedure TMarshalUnmarshalBase.RegisterJSONMarshalled(const AComposeKey: string; Marshal: Boolean);
begin
  FMarshalled.AddOrSetValue(AComposeKey, Marshal);
end;

procedure TMarshalUnmarshalBase.RegisterJSONMarshalled(clazz: TClass; const Field: string; Marshal: Boolean);
begin
  FMarshalled.AddOrSetValue(ComposeKey(clazz, Field), Marshal);
end;

procedure TMarshalUnmarshalBase.UnregisterJSONMarshalled(clazz: TClass; const Field: string);
var
  LKey: string;
begin
  LKey := ComposeKey(clazz, Field);
  if FMarshalled.ContainsKey(LKey) then
    FMarshalled.Remove(LKey);
end;

function TMarshalUnmarshalBase.ShouldMarshal(Data: TObject; rttiField: TRttiDataMember): Boolean;
var
  LKey: string;
begin
  Assert(Data <> nil);
  // Under ARC there is always a refCount field which we DO NOT WANT serialized
  if rttiField.Name = 'FRefCount' then
  begin
    Result := false;
  end
  else
  begin
    LKey := ComposeKey(Data.ClassType, rttiField.Name);
    if FMarshalled.ContainsKey(LKey) then
      Exit(FMarshalled.Items[LKey]);
    Result := JSONBooleanAttributeValue(rttiField, JSONMarshalledAttribute, true);
  end;
end;

{ TInternalJSONPopulationCustomizer.TBackupCache }

constructor TInternalJSONPopulationCustomizer.TBackupCache.Create;
begin
  inherited Create([doOwnsValues]);
end;

procedure TInternalJSONPopulationCustomizer.TBackupCache.ValueNotify(
  const Value: TObject; Action: TCollectionNotification);
begin
  if (Action = cnRemoved) and (Value is TEncoding) and
     TEncoding.IsStandardEncoding(TEncoding(Value)) then
    Exit;
  inherited;
end;

{ TInternalJSONPopulationCustomizer }

constructor TInternalJSONPopulationCustomizer.Create(ACanPopulate: TJSONCanPopulateProc);
begin
  inherited Create(ACanPopulate);
  FBackupCache := TBackupCache.Create;
end;

destructor TInternalJSONPopulationCustomizer.Destroy;
begin
  FBackupCache.Free;
  inherited;
end;

procedure TInternalJSONPopulationCustomizer.DoFieldPopulated(Data: TObject; rttiField: TRttiDataMember);
begin
  if FBackupCache.ContainsKey(rttiField) then
    FBackupCache.Remove(rttiField);
end;

procedure TInternalJSONPopulationCustomizer.PostPopulate(Data: TObject);
var
  LRttiField: TRttiDataMember;
  LPair: TPair<TRttiDataMember, TObject>;
begin
  for LRttiField in FBackupCache.Keys do
  begin
    Assert(LRttiField.GetValue(Data).AsObject = nil);
    LPair := FBackupCache.ExtractPair(LRttiField);
    LPair.Key.SetValue(Data, TValue.From<TObject>(LPair.Value));
  end;
  FBackupCache.Clear;
end;

procedure TInternalJSONPopulationCustomizer.PrePopulateObjField(Data: TObject; rttiField: TRttiDataMember);
begin
  if rttiField <> nil then
  begin
    FBackupCache.AddOrSetValue(rttiField, rttiField.GetValue(Data).AsObject);
    rttiField.SetValue(Data, TValue.Empty);
  end;
end;

{ JSONReflect }

constructor JsonReflectAttribute.Create(IsMarshalOwned: Boolean);
begin
  FMarshalOwner := IsMarshalOwned;
  inherited Create;
end;

constructor JsonReflectAttribute.Create(ConverterType: TConverterType; ReverterType: TReverterType; InterceptorType: TClass;
PopulationCustomizerType: TClass; IsMarshalOwned: Boolean);
begin
  FMarshalOwner := IsMarshalOwned;
  FReverterType := ReverterType;
  FConverterType := ConverterType;
  FInterceptor := InterceptorType;
  FPopulationCustomizer := PopulationCustomizerType;
  inherited Create;
end;

function JsonReflectAttribute.JSONInterceptor: TJSONInterceptor;
var
  FCtx: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;
  LConstructor: TRttiMethod;
begin
  if FInterceptor <> nil then
  begin
    LConstructor := nil;
    FCtx := TRttiContext.Create;
    LType := FCtx.GetType(FInterceptor);
    if LType <> nil then
      for LMethod in LType.GetMethods do
        if LMethod.IsConstructor and (Length(LMethod.GetParameters) = 0) then
        begin
          LConstructor := LMethod;
          Break;
        end;
    if LConstructor <> nil then
      Result := LConstructor.Invoke(FInterceptor, []).AsObject as TJSONInterceptor
    else
      Result := FInterceptor.Create as TJSONInterceptor;
    Result.ConverterType := FConverterType;
    Result.ReverterType := FReverterType;
  end
  else
    Result := nil;
end;

function JsonReflectAttribute.JSONPopulationCustomizer: TJSONPopulationCustomizer;
begin
  if FPopulationCustomizer <> nil then
    Result := FPopulationCustomizer.Create as TJSONPopulationCustomizer
  else
    Result := nil;
end;

{ TListTFieldsEditor }

constructor TListTFieldsEditor.Create(const ARTTIProvider: TRttiMetadataProvider);
begin
  inherited Create;
  FRttiProvider := ARTTIProvider;
end;

class function TListTFieldsEditor.ShouldEdit(clazz: TClass): Boolean;
begin
  while (clazz <> nil) and
        not clazz.QualifiedClassName.StartsWith('System.Generics.Collections.TList<') do
    clazz := clazz.ClassParent;
  Result := clazz <> nil;
end;

class function TListTFieldsEditor.ShouldEdit(Data: TObject): Boolean;
begin
  Result := ShouldEdit(Data.ClassType)
end;

function TListTFieldsEditor.ShouldMarshal(Data: TObject; const [ref] rttiField: TRttiDataMember): Boolean;
type
  PRttiField = ^TRttiDataMember;
begin
  Result := True;
  if (FSkipping = 0) and rttiField.Name.Equals('FItems') then
  begin
    FSkipping := 1;
    PRttiField(@rttiField)^ := FRttiProvider.Ctx.GetType(TListCvt).GetField('FListHelper');
  end
  else if FSkipping = 1 then
  begin
    if rttiField.Name.Equals('FCompare') then
      FSkipping := 2;
    Result := False;
  end;
end;

function TListTFieldsEditor.TryPopulateFields(UnMarshal: TJSONUnMarshal; Data: TObject;
  const FieldName: string; JsonFields: TJSONObject; var I: Integer): Boolean;
var
  rField: TRttiDataMember;
  jsonFieldVal: TJSONValue;
  LValue: TValue;
begin
  Result := False;
  rField := FRttiProvider.Ctx.GetType(TListCvt).GetField('FListHelper');
  // Unmarshal TList<T>.FListHelper as dynamic array using 10.2 layout
  if (rField <> nil) and
     (rField.DataType.Handle = TypeInfo(System.Generics.Collections.TListHelper)) and
     (string.CompareText('listHelper', FieldName) = 0) then
  begin
    // "listHelper":[2] - ignore
    if (I < JsonFields.Count - 1) and
       (string.CompareText('items', JsonFields.Pairs[I + 1].JsonString.Value) = 0) then
      Inc(I);
    // "items":[{},{}]
    jsonFieldVal := JsonFields.Pairs[I].JsonValue;
    LValue := rField.GetValue(Data); // Get FListHelper
    SetTListHelperValueFromArrayValue(FRttiProvider.Ctx, LValue,
      function (AArrType: TRttiType): TValue
      begin
        Result := UnMarshal.JSONToTValue(jsonFieldVal, AArrType);
      end);
    rField.SetValue(Data, LValue); // Set FListHelper
    Result := True;
  end;
end;

function TListTFieldsEditor.ShouldPrePopulate(Data: TObject; rttiField: TRttiDataMember): Boolean;
begin
  Result := not rttiField.Name.Equals('FListObj');
end;

end.
