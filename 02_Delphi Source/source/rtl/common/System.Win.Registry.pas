{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Win.Registry;

{$WEAKPACKAGEUNIT OFF}

{$R-,T-,H+,X+}

interface
{$HPPEMIT LEGACYHPP}

uses {$IFDEF LINUX} WinUtils, {$ENDIF} Winapi.Windows, System.Classes, System.SysUtils, System.IniFiles, System.Types;

type
  ERegistryException = class(Exception);

  TRegKeyInfo = record
    NumSubKeys: Integer;
    MaxSubKeyLen: Integer;
    NumValues: Integer;
    MaxValueLen: Integer;
    MaxDataLen: Integer;
    FileTime: TFileTime;
  end;

  TRegDataType = (rdUnknown, rdString, rdExpandString, rdInteger, rdBinary,
    rdIntegerBE, rdLink, rdMultiString, rdInt64);

  TRegDataInfo = record
    RegData: TRegDataType;
    DataSize: Integer;
  end;

  TRegistry = class(TObject)
  private
    FCurrentKey: HKEY;
    FRootKey: HKEY;
    FLazyWrite: Boolean;
    FCurrentPath: string;
    FCloseRootKey: Boolean;
    FAccess: LongWord;
    FLastError: Longint;
    class var FUseRegDeleteKeyEx: Boolean;
    class constructor Create;
    procedure SetRootKey(Value: HKEY);
    function GetLastErrorMsg: string;
  protected
    procedure ChangeKey(Value: HKey; const Path: string);
    function CheckResult(RetVal: Longint): Boolean;
    function GetBaseKey(Relative: Boolean): HKey;
    function GetData(const Name: string; Buffer: Pointer;
      BufSize: Integer; var RegData: TRegDataType): Integer;
    function GetKey(const Key: string): HKEY;
    function GetRootKeyName: string;
    procedure PutData(const Name: string; Buffer: Pointer; BufSize: Integer; RegData: TRegDataType);
    procedure SetCurrentKey(Value: HKEY);
  public
    constructor Create; overload;
    constructor Create(AAccess: LongWord); overload;
    destructor Destroy; override;
    procedure CloseKey;
    function CreateKey(const Key: string): Boolean;
    function DeleteKey(const Key: string): Boolean;
    function DeleteValue(const Name: string): Boolean;
    function GetDataAsString(const ValueName: string; PrefixType: Boolean = false): string;
    function GetDataInfo(const ValueName: string; var Value: TRegDataInfo): Boolean;
    function GetDataSize(const ValueName: string): Integer;
    function GetDataType(const ValueName: string): TRegDataType;
    function GetKeyInfo(var Value: TRegKeyInfo): Boolean;
    procedure GetKeyNames(Strings: TStrings);
    procedure GetValueNames(Strings: TStrings);
    function HasSubKeys: Boolean;
    function KeyExists(const Key: string): Boolean;
    function LoadKey(const Key, FileName: string): Boolean;
    procedure MoveKey(const OldName, NewName: string; Delete: Boolean);
    function OpenKey(const Key: string; CanCreate: Boolean): Boolean;
    function OpenKeyReadOnly(const Key: String): Boolean;
    function ReadCurrency(const Name: string): Currency;
    function ReadBinaryData(const Name: string; var Buffer; BufSize: Integer): Integer;
    function ReadBool(const Name: string): Boolean;
    function ReadDate(const Name: string): TDateTime;
    function ReadDateTime(const Name: string): TDateTime;
    function ReadFloat(const Name: string): Double;
    function ReadInteger(const Name: string): Integer;
    function ReadInt64(const Name: string): Int64;
    function ReadString(const Name: string): string;
    function ReadTime(const Name: string): TDateTime;
    function ReadMultiString(const Name: string): TArray<string>;
    function RegistryConnect(const UNCName: string): Boolean;
    procedure RenameValue(const OldName, NewName: string);
    function ReplaceKey(const Key, FileName, BackUpFileName: string): Boolean;
    function RestoreKey(const Key, FileName: string): Boolean;
    function SaveKey(const Key, FileName: string): Boolean;
    function UnLoadKey(const Key: string): Boolean;
    function ValueExists(const Name: string): Boolean;
    procedure WriteCurrency(const Name: string; Value: Currency);
    procedure WriteBinaryData(const Name: string; const Buffer; BufSize: Integer);
    procedure WriteBool(const Name: string; Value: Boolean);
    procedure WriteDate(const Name: string; Value: TDateTime);
    procedure WriteDateTime(const Name: string; Value: TDateTime);
    procedure WriteFloat(const Name: string; Value: Double);
    procedure WriteInteger(const Name: string; Value: Integer); overload;
    procedure WriteInteger(const Name: string; Value: Integer; Endian: TEndian); overload;
    procedure WriteInt64(const Name: string; Value: Int64);
    procedure WriteString(const Name, Value: string);
    procedure WriteExpandString(const Name, Value: string);
    procedure WriteTime(const Name: string; Value: TDateTime);
    procedure WriteMultiString(const Name: string; const Value: TArray<string>);
    property CurrentKey: HKEY read FCurrentKey;
    property CurrentPath: string read FCurrentPath;
    property LazyWrite: Boolean read FLazyWrite write FLazyWrite;
    property LastError: Longint read FLastError;
    property LastErrorMsg: string read GetLastErrorMsg;
    property RootKey: HKEY read FRootKey write SetRootKey;
    property RootKeyName: string read GetRootKeyName;
    property Access: LongWord read FAccess write FAccess;
  end;

  TRegIniFile = class(TRegistry)
  private
    FFileName: string;
  public
    constructor Create(const FileName: string); overload;
    constructor Create(const FileName: string; AAccess: LongWord); overload;
    function ReadString(const Section, Ident, Default: string): string;
    function ReadInteger(const Section, Ident: string; Default: Integer): Integer;
    procedure WriteInteger(const Section, Ident: string; Value: Integer);
    procedure WriteString(const Section, Ident, Value: string);
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean;
    procedure WriteBool(const Section, Ident: string; Value: Boolean);
    procedure ReadSection(const Section: string; Strings: TStrings);
    procedure ReadSections(Strings: TStrings);
    procedure ReadSectionValues(const Section: string; Strings: TStrings);
    procedure EraseSection(const Section: string);
    procedure DeleteKey(const Section, Ident: string);
    property FileName: string read FFileName;
  end;

  TRegistryIniFile = class(TCustomIniFile)
  private
    FRegIniFile: TRegIniFile;
  public
    constructor Create(const FileName: string); overload;
    constructor Create(const FileName: string; AAccess: LongWord); overload;
    destructor Destroy; override;
    function ReadDate(const Section, Name: string; Default: TDateTime): TDateTime; override;
    function ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime; override;
    function ReadInteger(const Section, Ident: string; Default: Integer): Integer; override;
    function ReadFloat(const Section, Name: string; Default: Double): Double; override;
    function ReadString(const Section, Ident, Default: string): string; override;
    function ReadTime(const Section, Name: string; Default: TDateTime): TDateTime; override;
    function ReadBinaryStream(const Section, Name: string; Value: TStream): Integer; override;
    procedure WriteDate(const Section, Name: string; Value: TDateTime); override;
    procedure WriteDateTime(const Section, Name: string; Value: TDateTime); override;
    procedure WriteFloat(const Section, Name: string; Value: Double); override;
    procedure WriteInteger(const Section, Ident: string; Value: Integer); override;
    procedure WriteString(const Section, Ident, Value: string); override;
    procedure WriteTime(const Section, Name: string; Value: TDateTime); override;
    procedure WriteBinaryStream(const Section, Name: string; Value: TStream); override;
    procedure ReadSection(const Section: string; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); overload; override;
    procedure ReadSections(const Section: string; Strings: TStrings); overload; override;
    procedure ReadSubSections(const Section: string; Strings: TStrings; Recurse: Boolean = False); override;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
    procedure EraseSection(const Section: string); override;
    procedure DeleteKey(const Section, Ident: string); override;
    procedure UpdateFile; override;

    property RegIniFile: TRegIniFile read FRegIniFile;
  end;

implementation

uses System.RTLConsts;

procedure ReadError(const Name: string);
begin
  raise ERegistryException.CreateResFmt(@SInvalidRegType, [Name]);
end;

function IsRelative(const Value: string): Boolean;
begin
  Result := not ((Value <> '') and (Value[1] = '\'));
end;

function RegDataToDataType(Value: TRegDataType): Integer;
begin
  case Value of
    rdString: Result := REG_SZ;
    rdExpandString: Result := REG_EXPAND_SZ;
    rdInteger: Result := REG_DWORD;
    rdBinary: Result := REG_BINARY;
    rdIntegerBE: Result := REG_DWORD_BIG_ENDIAN;
    rdLink: Result := REG_LINK;
    rdMultiString: Result := REG_MULTI_SZ;
    rdInt64: Result := REG_QWORD;
  else
    Result := REG_NONE;
  end;
end;

function DataTypeToRegData(Value: Integer): TRegDataType;
begin
  case Value of
    REG_SZ: Result := rdString;
    REG_EXPAND_SZ: Result := rdExpandString;
    REG_DWORD: Result := rdInteger;
    REG_BINARY: Result := rdBinary;
    REG_DWORD_BIG_ENDIAN: Result := rdIntegerBE;
    REG_LINK: Result := rdLink;
    REG_MULTI_SZ: Result := rdMultiString;
    REG_QWORD: Result := rdInt64;
  else
    Result := rdUnknown;
  end;
end;

function BinaryToHexString(const BinaryData: array of Byte; const PrefixStr: string): string;
var
  DataSize, I, Offset: Integer;
  HexData: string;
  PResult: PChar;
begin
  OffSet := 0;
  if PrefixStr <> '' then
  begin
    Result := PrefixStr;
    Inc(Offset, Length(PrefixStr));
  end;
  DataSize := Length(BinaryData);

  SetLength(Result, Offset + (DataSize*3) - 1); // less one for last ','
  PResult := PChar(Result); // Use a char pointer to reduce string overhead
  for I := 0 to DataSize - 1 do
  begin
    HexData := IntToHex(BinaryData[I], 2);
    PResult[Offset] := HexData[1];
    PResult[Offset+1] := HexData[2];
    if I < DataSize - 1 then
      PResult[Offset+2] := ',';
    Inc(Offset, 3);
  end;
end;

{ TRegistry }

constructor TRegistry.Create;
begin
  RootKey := HKEY_CURRENT_USER;
  FAccess := KEY_ALL_ACCESS;
  LazyWrite := True;
end;

constructor TRegistry.Create(AAccess: LongWord);
begin
  Create;
  FAccess := AAccess;
end;

class constructor TRegistry.Create;
begin
  // Windows XP 64, or Windows Server 2003 SP 1 or later
  FUseRegDeleteKeyEx := TOSVersion.Check(6) or TOSVersion.Check(5, 2, 1) or
    (TOSVersion.Check(5, 2) and (TOSVersion.Architecture = arIntelX64));
end;

destructor TRegistry.Destroy;
begin
  CloseKey;
  inherited;
end;

function TRegistry.CheckResult(RetVal: Integer): Boolean;
begin
  FLastError := RetVal;
  Result := (RetVal = ERROR_SUCCESS);
end;

procedure TRegistry.CloseKey;
begin
  if CurrentKey <> 0 then
  begin
    if not LazyWrite then
      RegFlushKey(CurrentKey);
    RegCloseKey(CurrentKey);
    FCurrentKey := 0;
    FCurrentPath := '';
  end;
end;

procedure TRegistry.SetRootKey(Value: HKEY);
begin
  if RootKey <> Value then
  begin
    if FCloseRootKey then
    begin
      RegCloseKey(RootKey);
      FCloseRootKey := False;
    end;
    FRootKey := Value;
    CloseKey;
  end;
end;

procedure TRegistry.ChangeKey(Value: HKey; const Path: string);
begin
  CloseKey;
  FCurrentKey := Value;
  FCurrentPath := Path;
end;

function TRegistry.GetBaseKey(Relative: Boolean): HKey;
begin
  if (CurrentKey = 0) or not Relative then
    Result := RootKey else
    Result := CurrentKey;
end;

procedure TRegistry.SetCurrentKey(Value: HKEY);
begin
  FCurrentKey := Value;
end;

function TRegistry.CreateKey(const Key: string): Boolean;
var
  TempKey: HKey;
  S: string;
  Disposition: Integer;
  Relative: Boolean;
  WOWFlags: Cardinal;
begin
  TempKey := 0;
  S := Key;
  Relative := IsRelative(S);
  if not Relative then Delete(S, 1, 1);
  WOWFlags := FAccess and KEY_WOW64_RES;
  Result := CheckResult(RegCreateKeyEx(GetBaseKey(Relative), PChar(S), 0, nil,
    REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS or WOWFlags, nil, TempKey, @Disposition));
  if Result then RegCloseKey(TempKey)
  else raise ERegistryException.CreateResFmt(@SRegCreateFailed, [Key]);
end;

function TRegistry.OpenKey(const Key: string; Cancreate: boolean): Boolean;
var
  TempKey: HKey;
  S: string;
  Disposition: Integer;
  Relative: Boolean;
begin
  S := Key;
  Relative := IsRelative(S);

  if not Relative then Delete(S, 1, 1);
  TempKey := 0;
  if not CanCreate or (S = '') then
  begin
    Result := CheckResult(RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0,
      FAccess, TempKey));
  end else
    Result := CheckResult(RegCreateKeyEx(GetBaseKey(Relative), PChar(S), 0, nil,
      REG_OPTION_NON_VOLATILE, FAccess, nil, TempKey, @Disposition));
  if Result then
  begin
    if (CurrentKey <> 0) and Relative then S := CurrentPath + '\' + S;
    ChangeKey(TempKey, S);
  end;
end;

function TRegistry.OpenKeyReadOnly(const Key: string): Boolean;
var
  TempKey: HKey;
  S: string;
  Relative: Boolean;
  WOWFlags: Cardinal;
begin
  S := Key;
  Relative := IsRelative(S);

  if not Relative then Delete(S, 1, 1);
  TempKey := 0;
  // Preserve KEY_WOW64_XXX flags for later use
  WOWFlags := FAccess and KEY_WOW64_RES;
  Result := CheckResult(RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0,
      KEY_READ or WOWFlags, TempKey));
  if Result then
  begin
    FAccess := KEY_READ or WOWFlags;
    if (CurrentKey <> 0) and Relative then S := CurrentPath + '\' + S;
    ChangeKey(TempKey, S);
  end
  else
  begin
    Result := CheckResult(RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0,
        STANDARD_RIGHTS_READ or KEY_QUERY_VALUE or KEY_ENUMERATE_SUB_KEYS or WOWFlags,
        TempKey));
    if Result then
    begin
      FAccess := STANDARD_RIGHTS_READ or KEY_QUERY_VALUE or KEY_ENUMERATE_SUB_KEYS or WOWFlags;
      if (CurrentKey <> 0) and Relative then S := CurrentPath + '\' + S;
      ChangeKey(TempKey, S);
    end
    else
    begin
      Result := CheckResult(RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0,
          KEY_QUERY_VALUE or WOWFlags, TempKey));
      if Result then
      begin
        FAccess := KEY_QUERY_VALUE or WOWFlags;
        if (CurrentKey <> 0) and Relative then S := CurrentPath + '\' + S;
        ChangeKey(TempKey, S);
      end
    end;
  end;
end;

function TRegistry.DeleteKey(const Key: string): Boolean;
var
  Len: DWORD;
  I: Integer;
  Relative: Boolean;
  S, KeyName: string;
  OldKey, DeleteKey: HKEY;
  Info: TRegKeyInfo;
begin
  S := Key;
  Relative := IsRelative(S);
  if not Relative then Delete(S, 1, 1);
  OldKey := CurrentKey;
  DeleteKey := GetKey(Key);
  if DeleteKey <> 0 then
  try
    SetCurrentKey(DeleteKey);
    if GetKeyInfo(Info) then
    begin
      SetString(KeyName, nil, Info.MaxSubKeyLen + 1);
      for I := Info.NumSubKeys - 1 downto 0 do
      begin
        Len := Info.MaxSubKeyLen + 1;
        if CheckResult(RegEnumKeyEx(DeleteKey, DWORD(I), PChar(KeyName), Len, nil, nil, nil, nil)) then
          Self.DeleteKey(PChar(KeyName));
      end;
    end;
  finally
    SetCurrentKey(OldKey);
    RegCloseKey(DeleteKey);
  end;
  if FUseRegDeleteKeyEx then
    Result := CheckResult(RegDeleteKeyEx(GetBaseKey(Relative), PChar(S), FAccess and KEY_WOW64_RES, 0))
  else
    Result := CheckResult(RegDeleteKey(GetBaseKey(Relative), PChar(S)));
end;

function TRegistry.DeleteValue(const Name: string): Boolean;
begin
  Result := CheckResult(RegDeleteValue(CurrentKey, PChar(Name)));
end;

function TRegistry.GetKeyInfo(var Value: TRegKeyInfo): Boolean;
begin
  FillChar(Value, SizeOf(TRegKeyInfo), 0);
  Result := CheckResult(RegQueryInfoKey(CurrentKey, nil, nil, nil, @Value.NumSubKeys,
    @Value.MaxSubKeyLen, nil, @Value.NumValues, @Value.MaxValueLen,
    @Value.MaxDataLen, nil, @Value.FileTime));
  if SysLocale.FarEast and (Win32Platform = VER_PLATFORM_WIN32_NT) then
    with Value do
    begin
      Inc(MaxSubKeyLen, MaxSubKeyLen);
      Inc(MaxValueLen, MaxValueLen);
    end;
end;

procedure TRegistry.GetKeyNames(Strings: TStrings);
var
  Len: DWORD;
  I: Integer;
  Info: TRegKeyInfo;
  S: string;
begin
  Strings.Clear;
  if GetKeyInfo(Info) then
  begin
    SetString(S, nil, Info.MaxSubKeyLen + 1);
    for I := 0 to Info.NumSubKeys - 1 do
    begin
      Len := Info.MaxSubKeyLen + 1;
      RegEnumKeyEx(CurrentKey, I, PChar(S), Len, nil, nil, nil, nil);
      Strings.Add(PChar(S));
    end;
  end;
end;

function TRegistry.GetLastErrorMsg: string;
begin
  if FLastError <> ERROR_SUCCESS then
    Result := SysErrorMessage(FLastError)
  else
    Result := '';
end;

function TRegistry.GetRootKeyName: string;
const
  KeyNames: array[HKEY_CLASSES_ROOT..HKEY_DYN_DATA] of string = (
    'HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE',
    'HKEY_USERS', 'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG', 'HKEY_DYN_DATA');
begin
  if (FRootKey >= HKEY_CLASSES_ROOT) and (FRootKey <= HKEY_DYN_DATA) then
    Result := KeyNames[FRootKey]
  else
    Result := '';
end;

procedure TRegistry.GetValueNames(Strings: TStrings);
var
  Len: DWORD;
  I: Integer;
  Info: TRegKeyInfo;
  S: string;
begin
  Strings.Clear;
  if GetKeyInfo(Info) then
  begin
    SetString(S, nil, Info.MaxValueLen + 1);
    for I := 0 to Info.NumValues - 1 do
    begin
      Len := Info.MaxValueLen + 1;
      RegEnumValue(CurrentKey, I, PChar(S), Len, nil, nil, nil, nil);
      Strings.Add(PChar(S));
    end;
  end;
end;

function TRegistry.GetDataInfo(const ValueName: string; var Value: TRegDataInfo): Boolean;
var
  DataType: Integer;
begin
  FillChar(Value, SizeOf(TRegDataInfo), 0);
  Result := CheckResult(RegQueryValueEx(CurrentKey, PChar(ValueName), nil, @DataType, nil,
    @Value.DataSize));
  Value.RegData := DataTypeToRegData(DataType);
end;

function TRegistry.GetDataSize(const ValueName: string): Integer;
var
  Info: TRegDataInfo;
begin
  if GetDataInfo(ValueName, Info) then
    Result := Info.DataSize else
    Result := -1;
end;

function TRegistry.GetDataType(const ValueName: string): TRegDataType;
var
  Info: TRegDataInfo;
begin
  if GetDataInfo(ValueName, Info) then
    Result := Info.RegData else
    Result := rdUnknown;
end;

procedure TRegistry.WriteString(const Name, Value: string);
begin
  PutData(Name, PChar(Value), (Length(Value)+1) * SizeOf(Char), rdString);
end;

procedure TRegistry.WriteExpandString(const Name, Value: string);
begin
  PutData(Name, PChar(Value), (Length(Value)+1) * SizeOf(Char), rdExpandString);
end;

procedure TRegistry.WriteMultiString(const Name: string; const Value: TArray<string>);
var
  Bld: TStringBuilder;
  I: Integer;
  S: string;
begin
  Bld := TStringBuilder.Create;
  try
    for I := Low(Value) to High(Value) do
    begin
      Bld.Append(Value[I]);
      Bld.Append(#0);
    end;
    S := Bld.ToString(True);
    PutData(Name, PChar(S), (Length(S)+1) * SizeOf(Char), rdMultiString);
  finally
    Bld.Free;
  end;
end;

function TRegistry.ReadString(const Name: string): string;
var
  Len: Integer;
  RegData: TRegDataType;
begin
  Len := GetDataSize(Name);
  if Len > 0 then
  begin
    SetString(Result, nil, Len div SizeOf(Char));
    GetData(Name, PChar(Result), Len, RegData);
    if (RegData = rdString) or (RegData = rdExpandString) then
      SetLength(Result, StrLen(PChar(Result)))
    else ReadError(Name);
  end
  else Result := '';
end;

function TRegistry.ReadMultiString(const Name: string): TArray<string>;
var
  Len: Integer;
  RegData: TRegDataType;
  S: string;
  I, J: Integer;
begin
  Result := nil;
  Len := GetDataSize(Name);
  if Len > 0 then
  begin
    SetString(S, nil, Len div SizeOf(Char));
    GetData(Name, PChar(S), Len, RegData);
    if RegData <> rdMultiString then ReadError(Name);
    I := -1;
    while True do
    begin
      J := S.IndexOf(#0, I + 1);
      if (J = -1) or (J = I + 1) then
        Break;
      SetLength(Result, Length(Result) + 1);
      Result[Length(Result) - 1] := S.Substring(I + 1, J - I - 1);
      I := J;
    end;
  end;
end;

// Returns rdInteger and rdBinary as strings
function TRegistry.GetDataAsString(const ValueName: string;
  PrefixType: Boolean = false): string;
const
  SDWORD_PREFIX = 'dword:';
  SQWORD_PREFIX = 'qword:';
  SHEX_PREFIX = 'hex:';
var
  Info: TRegDataInfo;
  BinaryBuffer: array of Byte;
begin
  Result := '';
  if GetDataInfo(ValueName, Info) and (Info.DataSize > 0) then
  begin
    case Info.RegData of
      rdString, rdExpandString, rdLink:
        begin
          SetString(Result, nil, Info.DataSize);
          GetData(ValueName, PChar(Result), Info.DataSize, Info.RegData);
          SetLength(Result, StrLen(PChar(Result)));
        end;
      rdInteger, rdIntegerBE:
        begin
          if PrefixType then
            Result := SDWORD_PREFIX+IntToHex(ReadInteger(ValueName), 8)
          else
            Result := IntToStr(ReadInteger(ValueName));
        end;
      rdInt64:
        begin
          if PrefixType then
            Result := SQWORD_PREFIX+IntToHex(ReadInt64(ValueName), 8)
          else
            Result := IntToStr(ReadInt64(ValueName));
        end;
      rdBinary, rdUnknown, rdMultiString:
        begin
          SetLength(BinaryBuffer, Info.DataSize);
          ReadBinaryData(ValueName, Pointer(BinaryBuffer)^, Info.DataSize);
          if PrefixType then
            Result := BinaryToHexString(BinaryBuffer, SHEX_PREFIX)
          else
            Result := BinaryToHexString(BinaryBuffer, '');
        end;
    end;
  end;
end;

procedure TRegistry.WriteInteger(const Name: string; Value: Integer);
begin
  PutData(Name, @Value, SizeOf(Integer), rdInteger);
end;

procedure TRegistry.WriteInteger(const Name: string; Value: Integer; Endian: TEndian);
begin
  if Endian = TEndian.Little then
    PutData(Name, @Value, SizeOf(Integer), rdInteger)
  else
    PutData(Name, @Value, SizeOf(Integer), rdIntegerBE);
end;

function TRegistry.ReadInteger(const Name: string): Integer;
var
  RegData: TRegDataType;
begin
  GetData(Name, @Result, SizeOf(Integer), RegData);
  if not (RegData in [rdInt64, rdInteger, rdIntegerBE]) then ReadError(Name);
end;

procedure TRegistry.WriteInt64(const Name: string; Value: Int64);
begin
  PutData(Name, @Value, SizeOf(Int64), rdInt64);
end;

function TRegistry.ReadInt64(const Name: string): Int64;
var
  RegData: TRegDataType;
begin
  Result := 0;
  GetData(Name, @Result, SizeOf(Int64), RegData);
  if not (RegData in [rdInt64, rdInteger, rdIntegerBE]) then ReadError(Name);
end;

procedure TRegistry.WriteBool(const Name: string; Value: Boolean);
begin
  WriteInteger(Name, Ord(Value));
end;

function TRegistry.ReadBool(const Name: string): Boolean;
begin
  Result := ReadInteger(Name) <> 0;
end;

procedure TRegistry.WriteFloat(const Name: string; Value: Double);
begin
  PutData(Name, @Value, SizeOf(Double), rdBinary);
end;

function TRegistry.ReadFloat(const Name: string): Double;
var
  Len: Integer;
  RegData: TRegDataType;
begin
  Len := GetData(Name, @Result, SizeOf(Double), RegData);
  if (RegData <> rdBinary) or (Len <> SizeOf(Double)) then
    ReadError(Name);
end;

procedure TRegistry.WriteCurrency(const Name: string; Value: Currency);
begin
  PutData(Name, @Value, SizeOf(Currency), rdBinary);
end;

function TRegistry.ReadCurrency(const Name: string): Currency;
var
  Len: Integer;
  RegData: TRegDataType;
begin
  Len := GetData(Name, @Result, SizeOf(Currency), RegData);
  if (RegData <> rdBinary) or (Len <> SizeOf(Currency)) then
    ReadError(Name);
end;

procedure TRegistry.WriteDateTime(const Name: string; Value: TDateTime);
begin
  PutData(Name, @Value, SizeOf(TDateTime), rdBinary);
end;

function TRegistry.ReadDateTime(const Name: string): TDateTime;
var
  Len: Integer;
  RegData: TRegDataType;
begin
  Len := GetData(Name, @Result, SizeOf(TDateTime), RegData);
  if (RegData <> rdBinary) or (Len <> SizeOf(TDateTime)) then
    ReadError(Name);
end;

procedure TRegistry.WriteDate(const Name: string; Value: TDateTime);
begin
  WriteDateTime(Name, Value);
end;

function TRegistry.ReadDate(const Name: string): TDateTime;
begin
  Result := ReadDateTime(Name);
end;

procedure TRegistry.WriteTime(const Name: string; Value: TDateTime);
begin
  WriteDateTime(Name, Value);
end;

function TRegistry.ReadTime(const Name: string): TDateTime;
begin
  Result := ReadDateTime(Name);
end;

procedure TRegistry.WriteBinaryData(const Name: string; const Buffer; BufSize: Integer);
begin
  PutData(Name, @Buffer, BufSize, rdBinary);
end;

function TRegistry.ReadBinaryData(const Name: string; var Buffer; BufSize: Integer): Integer;
var
  RegData: TRegDataType;
  Info: TRegDataInfo;
begin
  if GetDataInfo(Name, Info) then
  begin
    Result := Info.DataSize;
    RegData := Info.RegData;
    if ((RegData = rdBinary) or (RegData = rdUnknown)) and (Result <= BufSize) then
      GetData(Name, @Buffer, Result, RegData)
    else ReadError(Name);
  end else
    Result := 0;
end;

procedure TRegistry.PutData(const Name: string; Buffer: Pointer;
  BufSize: Integer; RegData: TRegDataType);
var
  DataType: Integer;
begin
  DataType := RegDataToDataType(RegData);
  if not CheckResult(RegSetValueEx(CurrentKey, PChar(Name), 0, DataType, Buffer,
    BufSize)) then
    raise ERegistryException.CreateResFmt(@SRegSetDataFailed, [Name]);
end;

function TRegistry.GetData(const Name: string; Buffer: Pointer;
  BufSize: Integer; var RegData: TRegDataType): Integer;
var
  DataType: Integer;
begin
  DataType := REG_NONE;
  if not CheckResult(RegQueryValueEx(CurrentKey, PChar(Name), nil, @DataType, PByte(Buffer),
    @BufSize)) then
    raise ERegistryException.CreateResFmt(@SRegGetDataFailed, [Name]);
  Result := BufSize;
  RegData := DataTypeToRegData(DataType);
end;

function TRegistry.HasSubKeys: Boolean;
var
  Info: TRegKeyInfo;
begin
  Result := GetKeyInfo(Info) and (Info.NumSubKeys > 0);
end;

function TRegistry.ValueExists(const Name: string): Boolean;
var
  Info: TRegDataInfo;
begin
  Result := GetDataInfo(Name, Info);
end;

function TRegistry.GetKey(const Key: string): HKEY;
var
  S: string;
  Relative: Boolean;
begin
  S := Key;
  Relative := IsRelative(S);
  if not Relative then Delete(S, 1, 1);
  Result := 0;
  RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0, FAccess, Result);
end;

function TRegistry.RegistryConnect(const UNCName: string): Boolean;
var
  TempKey: HKEY;
begin
  Result := CheckResult(RegConnectRegistry(PChar(UNCname), RootKey, TempKey));
  if Result then
  begin
    RootKey := TempKey;
    FCloseRootKey := True;
  end;
end;

function TRegistry.LoadKey(const Key, FileName: string): Boolean;
var
  S: string;
begin
  S := Key;
  if not IsRelative(S) then Delete(S, 1, 1);
  Result := CheckResult(RegLoadKey(RootKey, PChar(S), PChar(FileName)));
end;

function TRegistry.UnLoadKey(const Key: string): Boolean;
var
  S: string;
begin
  S := Key;
  if not IsRelative(S) then Delete(S, 1, 1);
  Result := CheckResult(RegUnLoadKey(RootKey, PChar(S)));
end;

function TRegistry.RestoreKey(const Key, FileName: string): Boolean;
var
  RestoreKey: HKEY;
begin
  Result := False;
  RestoreKey := GetKey(Key);
  if RestoreKey <> 0 then
  try
    Result := CheckResult(RegRestoreKey(RestoreKey, PChar(FileName), 0));
  finally
    RegCloseKey(RestoreKey);
  end;
end;

function TRegistry.ReplaceKey(const Key, FileName, BackUpFileName: string): Boolean;
var
  S: string;
  Relative: Boolean;
begin
  S := Key;
  Relative := IsRelative(S);
  if not Relative then Delete(S, 1, 1);
  Result := CheckResult(RegReplaceKey(GetBaseKey(Relative), PChar(S),
    PChar(FileName), PChar(BackUpFileName)));
end;

function TRegistry.SaveKey(const Key, FileName: string): Boolean;
var
  SaveKey: HKEY;
begin
  Result := False;
  SaveKey := GetKey(Key);
  if SaveKey <> 0 then
  try
    Result := CheckResult(RegSaveKey(SaveKey, PChar(FileName), nil));
  finally
    RegCloseKey(SaveKey);
  end;
end;

function TRegistry.KeyExists(const Key: string): Boolean;
var
  TempKey: HKEY;
  OldAccess: Longword;
begin
  OldAccess := FAccess;
  try
    FAccess := STANDARD_RIGHTS_READ or KEY_QUERY_VALUE or
      KEY_ENUMERATE_SUB_KEYS or (OldAccess and KEY_WOW64_RES);
    TempKey := GetKey(Key);
    if TempKey <> 0 then RegCloseKey(TempKey);
    Result := TempKey <> 0;
  finally
    FAccess := OldAccess;
  end;
end;

procedure TRegistry.RenameValue(const OldName, NewName: string);
var
  Len: Integer;
  RegData: TRegDataType;
  Buffer: PChar;
begin
  if ValueExists(OldName) and not ValueExists(NewName) then
  begin
    Len := GetDataSize(OldName);
    if Len >= 0 then
    begin
      Buffer := AllocMem(Len);
      try
        Len := GetData(OldName, Buffer, Len, RegData);
        DeleteValue(OldName);
        PutData(NewName, Buffer, Len, RegData);
      finally
        FreeMem(Buffer);
      end;
    end;
  end;
end;

procedure TRegistry.MoveKey(const OldName, NewName: string; Delete: Boolean);
var
  SrcKey, DestKey: HKEY;

  procedure MoveValue(SrcKey, DestKey: HKEY; const Name: string);
  var
    Len: Integer;
    OldKey, PrevKey: HKEY;
    Buffer: PChar;
    RegData: TRegDataType;
  begin
    OldKey := CurrentKey;
    SetCurrentKey(SrcKey);
    try
      Len := GetDataSize(Name);
      if Len >= 0 then
      begin
        Buffer := AllocMem(Len);
        try
          Len := GetData(Name, Buffer, Len, RegData);
          PrevKey := CurrentKey;
          SetCurrentKey(DestKey);
          try
            PutData(Name, Buffer, Len, RegData);
          finally
            SetCurrentKey(PrevKey);
          end;
        finally
          FreeMem(Buffer);
        end;
      end;
    finally
      SetCurrentKey(OldKey);
    end;
  end;

  procedure CopyValues(SrcKey, DestKey: HKEY);
  var
    Len: DWORD;
    I: Integer;
    KeyInfo: TRegKeyInfo;
    S: string;
    OldKey: HKEY;
  begin
    OldKey := CurrentKey;
    SetCurrentKey(SrcKey);
    try
      if GetKeyInfo(KeyInfo) then
      begin
        MoveValue(SrcKey, DestKey, '');
        SetString(S, nil, KeyInfo.MaxValueLen + 1);
        for I := 0 to KeyInfo.NumValues - 1 do
        begin
          Len := KeyInfo.MaxValueLen + 1;
          if CheckResult(RegEnumValue(SrcKey, I, PChar(S), Len, nil, nil, nil, nil)) then
            MoveValue(SrcKey, DestKey, PChar(S));
        end;
      end;
    finally
      SetCurrentKey(OldKey);
    end;
  end;

  procedure CopyKeys(SrcKey, DestKey: HKEY);
  var
    Len: DWORD;
    I: Integer;
    Info: TRegKeyInfo;
    S: string;
    OldKey, PrevKey, NewSrc, NewDest: HKEY;
  begin
    OldKey := CurrentKey;
    SetCurrentKey(SrcKey);
    try
      if GetKeyInfo(Info) then
      begin
        SetString(S, nil, Info.MaxSubKeyLen + 1);
        for I := 0 to Info.NumSubKeys - 1 do
        begin
          Len := Info.MaxSubKeyLen + 1;
          if CheckResult(RegEnumKeyEx(SrcKey, I, PChar(S), Len, nil, nil, nil, nil)) then
          begin
            NewSrc := GetKey(PChar(S));
            if NewSrc <> 0 then
            try
              PrevKey := CurrentKey;
              SetCurrentKey(DestKey);
              try
                CreateKey(PChar(S));
                NewDest := GetKey(PChar(S));
                try
                  CopyValues(NewSrc, NewDest);
                  CopyKeys(NewSrc, NewDest);
                finally
                  RegCloseKey(NewDest);
                end;
              finally
                SetCurrentKey(PrevKey);
              end;
            finally
              RegCloseKey(NewSrc);
            end;
          end;
        end;
      end;
    finally
      SetCurrentKey(OldKey);
    end;
  end;

begin
  if KeyExists(OldName) and not KeyExists(NewName) then
  begin
    SrcKey := GetKey(OldName);
    if SrcKey <> 0 then
    try
      CreateKey(NewName);
      DestKey := GetKey(NewName);
      if DestKey <> 0 then
      try
        CopyValues(SrcKey, DestKey);
        CopyKeys(SrcKey, DestKey);
        if Delete then DeleteKey(OldName);
      finally
        RegCloseKey(DestKey);
      end;
    finally
      RegCloseKey(SrcKey);
    end;
  end;
end;

{ TRegIniFile }

constructor TRegIniFile.Create(const FileName: string);
begin
  Create(FileName, KEY_ALL_ACCESS);
end;

constructor TRegIniFile.Create(const FileName: string; AAccess: LongWord);
begin
  inherited Create(AAccess);
  FFilename := FileName;
  OpenKey(FileName, True);
end;

function TRegIniFile.ReadString(const Section, Ident, Default: string): string;
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if (Default = '') or ValueExists(Ident) then
        Result := inherited ReadString(Ident) else
        Result := Default;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end
  else Result := Default;
end;

procedure TRegIniFile.WriteString(const Section, Ident, Value: String);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteString(Ident, Value);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

function TRegIniFile.ReadInteger(const Section, Ident: string; Default: Integer): Integer;
var
  Key, OldKey: HKEY;
  S: string;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      S := inherited ReadString(Ident);
      Result := StrToIntDef(S, Default);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end
  else Result := Default;
end;

procedure TRegIniFile.WriteInteger(const Section, Ident: string; Value: Integer);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteString(Ident, IntToStr(Value));
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

function TRegIniFile.ReadBool(const Section, Ident: string; Default: Boolean): Boolean;
begin
  Result := ReadInteger(Section, Ident, Ord(Default)) <> 0;
end;

procedure TRegIniFile.WriteBool(const Section, Ident: string; Value: Boolean);
const
  Values: array[Boolean] of string = ('0', '1');
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteString(Ident, Values[Value]);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

procedure TRegIniFile.ReadSection(const Section: string; Strings: TStrings);
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited GetValueNames(Strings);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

procedure TRegIniFile.ReadSections(Strings: TStrings);
begin
  GetKeyNames(Strings);
end;

procedure TRegIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
var
  Key, OldKey: HKEY;
  ValueName: string;
  ValueNames: TStringList;
  I: Integer;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      ValueNames := TStringList.Create;
      Strings.BeginUpdate;
      try
        inherited GetValueNames(ValueNames);
        for I := 0 to ValueNames.Count - 1 do
        begin
          ValueName := ValueNames[I];
          Strings.Values[ValueName] := GetDataAsString(ValueName, True);
        end;
      finally
        Strings.EndUpdate;
        ValueNames.Free;
      end;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end
end;

procedure TRegIniFile.EraseSection(const Section: string);
begin
  inherited DeleteKey(Section);
end;

procedure TRegIniFile.DeleteKey(const Section, Ident: String);
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited DeleteValue(Ident);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

{ TRegistryIniFile }

constructor TRegistryIniFile.Create(const FileName: string);
begin
  Create(FileName, KEY_ALL_ACCESS);
end;

constructor TRegistryIniFile.Create(const FileName: string; AAccess: LongWord);
begin
  inherited Create(FileName);
  FRegIniFile := TRegIniFile.Create(FileName, AAccess);
end;

destructor TRegistryIniFile.Destroy;
begin
  FRegIniFile.Free;
  inherited Destroy;
end;

function TRegistryIniFile.ReadString(const Section, Ident, Default: string): string;
begin
  Result := FRegIniFile.ReadString(Section, Ident, Default);
end;

function TRegistryIniFile.ReadDate(const Section, Name: string; Default: TDateTime): TDateTime;
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if ValueExists(Name) then
          Result := ReadDate(Name)
        else Result := Default;
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end else Result := Default;
  end;
end;

function TRegistryIniFile.ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime;
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if ValueExists(Name) then
          Result := ReadDateTime(Name)
        else Result := Default;
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end else Result := Default;
  end;
end;

function TRegistryIniFile.ReadFloat(const Section, Name: string; Default: Double): Double;
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if ValueExists(Name) then
          Result := ReadFloat(Name)
        else Result := Default;
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end else Result := Default;
  end;
end;

function TRegistryIniFile.ReadInteger(const Section, Ident: string; Default: Integer): Integer;
var
  Key, OldKey: HKEY;
  Info: TRegDataInfo;
begin
  with TRegistry(FRegIniFile) do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        Result := Default;
        if GetDataInfo(Ident, Info) then
          if Info.RegData = rdString then
            Result := StrToIntDef(ReadString(Ident), Default)
          else Result := ReadInteger(Ident);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end
    else Result := Default;
  end;
end;

function TRegistryIniFile.ReadTime(const Section, Name: string; Default: TDateTime): TDateTime;
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if ValueExists(Name) then
          Result := ReadTime(Name)
        else Result := Default;
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end else Result := Default;
  end;
end;

function TRegistryIniFile.ReadBinaryStream(const Section, Name: string; Value: TStream): Integer;
var
  RegData: TRegDataType;
  Info: TRegDataInfo;
  Key, OldKey: HKEY;
  Stream: TMemoryStream;
begin
  Result := 0;
  with RegIniFile do
  begin
    Key := TRegistry(FRegIniFile).GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      TRegistry(FRegIniFile).SetCurrentKey(Key);
      try
        if GetDataInfo(Name, Info) then
        begin
          Result := Info.DataSize;
          RegData := Info.RegData;
          if Value is TMemoryStream then
            Stream := TMemoryStream(Value)
          else Stream := TMemoryStream.Create;
          try
            if (RegData = rdBinary) or (RegData = rdUnknown) then
            begin
              Stream.Size := Stream.Position + Info.DataSize;
              Result := ReadBinaryData(Name,
                Pointer(PByte(Stream.Memory) + Stream.Position)^, Stream.Size);
              if Stream <> Value then Value.CopyFrom(Stream, Stream.Size - Stream.Position);
            end;
          finally
            if Stream <> Value then Stream.Free;
          end;
        end;
      finally
        TRegistry(FRegIniFile).SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteDate(const Section, Name: string; Value: TDateTime);
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    CreateKey(Section);
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        WriteDate(Name, Value);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteDateTime(const Section, Name: string; Value: TDateTime);
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    CreateKey(Section);
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        WriteDateTime(Name, Value);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteFloat(const Section, Name: string; Value: Double);
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    CreateKey(Section);
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        WriteFloat(Name, Value);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteInteger(const Section, Ident: string; Value: Integer);
var
  Key, OldKey: HKEY;
  Info: TRegDataInfo;
begin
  with TRegistry(FRegIniFile) do
  begin
    CreateKey(Section);
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if GetDataInfo(Ident, Info) and (Info.RegData = rdString) then
          WriteString(Ident, IntToStr(Value))
        else WriteInteger(Ident, Value);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteTime(const Section, Name: string; Value: TDateTime);
var
  Key, OldKey: HKEY;
begin
  with FRegIniFile do
  begin
    CreateKey(Section);
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        WriteTime(Name, Value);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteBinaryStream(const Section, Name: string;
  Value: TStream);
var
  Key, OldKey: HKEY;
  Stream: TMemoryStream;
begin
  with RegIniFile do
  begin
    CreateKey(Section);
    Key := TRegistry(FRegIniFile).GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      if Value is TMemoryStream then
        Stream := TMemoryStream(Value)
      else Stream := TMemoryStream.Create;
      try
        if Stream <> Value then
        begin
          Stream.CopyFrom(Value, Value.Size - Value.Position);
          Stream.Position := 0;
        end;
        TRegistry(FRegIniFile).SetCurrentKey(Key);
        try
          WriteBinaryData(Name, Pointer(PByte(Stream.Memory) + Stream.Position)^,
            Stream.Size - Stream.Position);
        finally
          TRegistry(FRegIniFile).SetCurrentKey(OldKey);
        end;
      finally
        if Value <> Stream then Stream.Free;
      end;
    finally
      RegCloseKey(Key);
    end;
  end;
end;

procedure TRegistryIniFile.WriteString(const Section, Ident, Value: String);
begin
  FRegIniFile.WriteString(Section, Ident, Value);
end;

procedure TRegistryIniFile.ReadSection(const Section: string; Strings: TStrings);
begin
  FRegIniFile.ReadSection(Section, Strings);
end;

procedure TRegistryIniFile.ReadSections(Strings: TStrings);
begin
  FRegIniFile.ReadSections(Strings);
end;

procedure TRegistryIniFile.ReadSections(const Section: string; Strings: TStrings);
var
  Key, OldKey: HKEY;
begin
  with RegIniFile do
  begin
    Key := GetKey(Section);
    if Key <> 0 then
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        GetKeyNames(Strings);
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end
    else
      Strings.Clear;
  end;
end;

procedure TRegistryIniFile.ReadSubSections(const Section: string; Strings: TStrings; Recurse: Boolean = False);

  procedure AddSubSection(const Parent, Section: string);
  var
    SubSection, FullSubSection: string;
    SubSections: TStrings;
  begin
    SubSections := TStringList.Create;
    try
      ReadSections(Section, SubSections);
      for SubSection in SubSections do
      begin
        if Parent <> '' then
          FullSubSection := Parent + SectionNameSeparator + SubSection else
          FullSubSection := SubSection;
        Strings.Add(FullSubSection);
        if Section <> '' then
          AddSubSection(FullSubSection, Section + SectionNameSeparator + SubSection) else
          AddSubSection(FullSubSection, SubSection);
      end;
    finally
      SubSections.Free;
    end;
  end;

begin
  if Recurse then
  begin
    Strings.BeginUpdate;
    try
      AddSubSection('', Section);
    finally
      Strings.EndUpdate;
    end;
  end
  else
    ReadSections(Section, Strings);
end;

procedure TRegistryIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
begin
  FRegIniFile.ReadSectionValues(Section, Strings);
end;

procedure TRegistryIniFile.EraseSection(const Section: string);
begin
  FRegIniFile.EraseSection(Section);
end;

procedure TRegistryIniFile.DeleteKey(const Section, Ident: String);
begin
  FRegIniFile.DeleteKey(Section, Ident);
end;

procedure TRegistryIniFile.UpdateFile;
begin
  { Do nothing }
end;


end.



