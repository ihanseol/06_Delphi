{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.NetEncoding.Sqids;

{$WEAKPACKAGEUNIT OFF}

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.SyncObjs, System.ZLib;

type
  TSqidsEncoding = class
  private class var
    FLock: TCriticalSection;
    FDefBlockList: TArray<string>;
  public const
    CMinValue = 0;
    CMinAlphabetLength = 3;
    CMaxMinLength = 255;
    CAlphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  private
    FAlphabet: string;
    FMinHashLength: Integer;
    FBlockList: TArray<string>;
    class constructor Create;
    class destructor Destroy;
    class procedure InitDefBlockList; static;
    class function ConsistentShuffle(const AValue: string): string; static;
    class function Reverse(const AStr: string): string; static;
    function EncodeNumbers(const ANumbers: TArray<Integer>; AIncrement: Integer): string;
    function ToId(ANumber: Integer; const AAlphabet: string): string;
    function ToNumber(const AId, AAlphabet: string): Integer;
    function IsBlockedId(const AId: string): Boolean;
  public
    constructor Create(const AAlphabet: string = ''; AMinHashLength: Integer = 0;
                       const ABlockList: TArray<string> = nil);

    function Encode(const ANumbers: TArray<Integer>): string; overload;
    function Encode(const ANumber: Integer): string; overload;
    function Encode(const ANumbers: string): string; overload;

    function Decode(const AHash: string): TArray<Integer>;
    function DecodeSingle(const AHash: string): Integer;
    function TryDecodeSingle(const AHash: string; out ANumber: Integer): Boolean;
    function DecodeToStr(const AHash: string): string;
  end;

implementation

uses
  System.RTLConsts, System.Math, System.Generics.Collections, System.Types,
  System.Character;

{ TSqidsEncoding }

{$R sqids_block_list.res}

class constructor TSqidsEncoding.Create;
begin
  FLock := TCriticalSection.Create;
end;

class destructor TSqidsEncoding.Destroy;
begin
  FreeAndNil(FLock);
end;

class procedure TSqidsEncoding.InitDefBlockList;
var
  LRS: TResourceStream;
  LCS: TZDecompressionStream;
  I: Integer;
  B: TBytes;
  L: Byte;
  W: Word;
begin
  FLock.Enter;
  try
    if FDefBlockList <> nil then
      Exit;
    LRS := TResourceStream.Create(HInstance, 'sqids_block_list', RT_RCDATA);
    try
      LCS := TZDecompressionStream.Create(LRS);
      try
        LCS.ReadData(W);
        SetLength(FDefBlockList, W);
        for I := 0 to W - 1 do
        begin
          LCS.ReadData(L);
          SetLength(B, L);
          LCS.Read(B, L);
          FDefBlockList[I] := TEncoding.UTF8.GetString(B);
        end;
      finally
        LCS.Free;
      end;
    finally
      LRS.Free;
    end;
  finally
    FLock.Leave;
  end;
end;

constructor TSqidsEncoding.Create(const AAlphabet: string;
  AMinHashLength: Integer; const ABlockList: TArray<string>);
var
  LAlphabetChars: THashSet<Char>;
  C: Char;
  LBlockSet: THashSet<string>;
  S, SLower: string;
  LSkip: Boolean;
begin
  inherited Create;

  if AAlphabet = '' then
    FAlphabet := CAlphabet
  else
    FAlphabet := AAlphabet;
  if TEncoding.UTF8.GetByteCount(FAlphabet) <> FAlphabet.Length then
    raise EArgumentException.CreateRes(@sSqidsAlphNoMultiByte);
  if Length(FAlphabet) < CMinAlphabetLength then
    raise EArgumentException.CreateResFmt(@sSqidsAlphTooShort, [CMinAlphabetLength]);

  if (AMinHashLength < 0) or (AMinHashLength > CMaxMinLength) then
    raise EArgumentException.CreateResFmt(@sSqidsMinLenInvalid, [AMinHashLength, CMaxMinLength]);
  FMinHashLength := AMinHashLength;

  if ABlockList <> nil then
    FBlockList := ABlockList
  else
  begin
    if FDefBlockList = nil then
      InitDefBlockList;
    FBlockList := Copy(FDefBlockList);
  end;

  LAlphabetChars := THashSet<Char>.Create;
  try
    // check that the alphabet has only unique characters
    for C in FAlphabet do
    begin
      if LAlphabetChars.Contains(C) then
        raise EArgumentException.CreateRes(@sSqidsAlphMBUnique);
      LAlphabetChars.Add(C);
    end;

    // Cleanup the blocklist
    LBlockSet := THashSet<string>.Create;
    try
      for S in FBlockList do
      begin
        SLower := S.ToLower;
        if Length(SLower) < 3 then
          Continue;
        if LBlockSet.Contains(SLower) then
          Continue;
        LSkip := False;
        for C in SLower do
          if not LAlphabetChars.Contains(C) and not LAlphabetChars.Contains(C.ToUpper) then
          begin
            LSkip := True;
            Break;
          end;
        if not LSkip then
          LBlockSet.Add(SLower);
      end;
      FBlockList := LBlockSet.ToArray;
      TArray.Sort<string>(FBlockList);
    finally
      LBlockSet.Free;
    end;
  finally
    LAlphabetChars.Free;
  end;

  // Shuffle Alphabet
  FAlphabet := ConsistentShuffle(FAlphabet);
end;

class function TSqidsEncoding.ConsistentShuffle(const AValue: string): string;
var
  I, J, LLen, R: Integer;
  C: Char;
begin
  Result := AValue;
  I := 0;
  LLen := Length(Result);
  J := LLen - 1;
  while J > 0 do
  begin
    R := (I * J + Ord(Result[I + 1]) + Ord(Result[J + 1])) mod LLen;
    C := Result[I + 1];
    Result[I + 1] := Result[R + 1];
    Result[R + 1] := C;
    Dec(J);
    Inc(I);
  end;
end;

function TSqidsEncoding.ToId(ANumber: Integer; const AAlphabet: string): string;
var
  LLen: Integer;
begin
  Result := '';
  LLen := Length(AAlphabet);
  while True do
  begin
    Result := AAlphabet[(ANumber mod LLen) + 1] + Result;
    ANumber := ANumber div LLen;
    if ANumber = 0 then
      Break;
  end;
end;

function TSqidsEncoding.ToNumber(const AId, AAlphabet: string): Integer;
var
  LLen: Integer;
  I: Integer;
begin
  Result := 0;
  LLen := Length(AAlphabet);
  for I := Low(AId) to High(AId) do
    Result := Result * LLen + AAlphabet.IndexOf(AId[I]);
end;

function TSqidsEncoding.IsBlockedId(const AId: string): Boolean;
var
  LId: string;
  LIdLen: Integer;
  I: Integer;
  LWord: string;
  LWordLen: Integer;
  LWordContainsDigit: Boolean;
  J: Integer;
  C: Char;
  LPos: Integer;
begin
  LId := AId.ToLower;
  LIdLen := Length(AId);
  for I := Low(FBlockList) to High(FBlockList) do
  begin
    // NOTE: FBlockList contains 'lowered' strings
    LWord := FBlockList[I];
    LWordLen := Length(LWord);
    if LWordLen > LIdLen then
      Continue;

    if ((LIdLen <= 3) or (LWordLen <= 3)) and (LWord = LId) then
      Exit(True);

    LWordContainsDigit := False;
    for J := Low(LWord) to High(LWord) do
    begin
      C := LWord[J];
      if (C >= '0') and (C <= '9') then
      begin
        LWordContainsDigit := True;
        Break;
      end;
    end;

    LPos := LId.IndexOf(LWord);
    if LWordContainsDigit and ((LPos = 0) or (LPos = LIdLen - LWordLen)) then
      Exit(True);

    if LPos >= 0 then
      Exit(True);
  end;

  Result := False;
end;

class function TSqidsEncoding.Reverse(const AStr: string): string;
var
  i, j: PChar;
  C: Char;
begin
  Result := AStr;
  UniqueString(Result);
  i := PChar(Result);
  j := PChar(Result) + Length(Result) - 1;
  while i < j do
  begin
    C := i^;
    i^ := j^;
    j^ := C;
    Inc(i);
    Dec(j);
  end;
end;

function TSqidsEncoding.EncodeNumbers(const ANumbers: TArray<Integer>; AIncrement: Integer): string;
var
  LOffset: Integer;
  LAlphabetLen: Integer;
  I: Integer;
  LAlphabet: string;
  LPrefix: Char;
  LRet: string;
  LNum: Integer;
  LAlphabetWithoutSeparator: string;
  LSeparator: Char;
  LToIndex: Integer;
begin
  if AIncrement > Length(FAlphabet) then
    raise EArgumentException.CreateRes(@sSqidsMaxAttempts);

  LOffset := 0;
  LAlphabetLen := Length(FAlphabet);
  for I := 0 to Length(ANumbers) - 1 do
    LOffset := LOffset + Ord(FAlphabet[(ANumbers[I] mod LAlphabetLen) + 1]) + I;
  LOffset := (Length(ANumbers) + LOffset) mod LAlphabetLen;
  LOffset := (LOffset + AIncrement) mod LAlphabetLen;
  LAlphabet := FAlphabet.Substring(LOffset) + FAlphabet.Substring(0, LOffset);

  LPrefix := LAlphabet[Low(LAlphabet)];
  LAlphabet := Reverse(LAlphabet);

  LRet := LPrefix;
  for I := Low(ANumbers) to High(ANumbers) do
  begin
    LNum := ANumbers[I];
    LAlphabetWithoutSeparator := LAlphabet.Substring(1);
    LRet := LRet + ToId(LNum, LAlphabetWithoutSeparator);

    if I < Length(ANumbers) - 1 then
    begin
      LSeparator := LAlphabet[Low(LAlphabet)];
      LRet := LRet + LSeparator;
      LAlphabet := ConsistentShuffle(LAlphabet);
    end;
  end;

  if Length(LRet) < FMinHashLength then
  begin
    LSeparator := LAlphabet[Low(LAlphabet)];
    LRet := LRet + LSeparator;

    while Length(LRet) < FMinHashLength do
    begin
      LAlphabet := ConsistentShuffle(LAlphabet);
      LToIndex := Min(FMinHashLength - Length(LRet), Length(LAlphabet));
      LRet := LRet + LAlphabet.Substring(0, LToIndex);
    end;
  end;

  if IsBlockedId(LRet) then
    LRet := EncodeNumbers(ANumbers, AIncrement + 1);

  Result := LRet;
end;

function TSqidsEncoding.Encode(const ANumbers: TArray<Integer>): string;
var
  I: Integer;
begin
  if ANumbers = nil then
    Exit('');

  for I in ANumbers do
    if I < CMinValue then
      raise EConvertError.CreateResFmt(@sSqidsPosNumber, [I.ToString]);

  Result := EncodeNumbers(ANumbers, 0);
end;

function TSqidsEncoding.Encode(const ANumber: Integer): string;
begin
  Result := Encode([ANumber]);
end;

function TSqidsEncoding.Encode(const ANumbers: string): string;
var
  LList: TArray<string>;
  N: Integer;
  LNums: TArray<Integer>;
  I: Integer;
  LCode: Integer;
begin
  LList := ANumbers.Split([',']);
  N := Length(LList);
  if N = 0 then
    Exit;
  SetLength(LNums, N);
  for I := 0 to N - 1 do
  begin
    Val(LList[I], LNums[I], LCode);
    if LCode <> 0 then
      raise EConvertError.CreateResFmt(@sSqidsInvNumber, [LList[I]]);
    if LNums[I] < CMinValue then
      raise EConvertError.CreateResFmt(@sSqidsPosNumber, [LList[I]]);
  end;
  Result := Encode(LNums);
end;

function TSqidsEncoding.Decode(const AHash: string): TArray<Integer>;
var
  C: Char;
  LPrefix: Char;
  LOffset: Integer;
  LAlphabet: string;
  LHash: string;
  LSeparator: Char;
  LSeparatorIndex: Integer;
  LAlphabetWithoutSeparator: string;
  LChunk: string;
begin
  SetLength(Result, 0);
  if AHash = '' then
    Exit;

  for C in AHash do
    if FAlphabet.IndexOf(C) < 0 then
      Exit;

  LPrefix := AHash[Low(AHash)];
  LOffset := FAlphabet.IndexOf(LPrefix);

  LAlphabet := FAlphabet.Substring(LOffset) + FAlphabet.Substring(0, LOffset);
  LAlphabet := Reverse(LAlphabet);

  LHash := AHash.Substring(1);

  while LHash <> '' do
  begin
    LSeparator := LAlphabet[Low(LAlphabet)];

    LSeparatorIndex := LHash.IndexOf(LSeparator);
    if LSeparatorIndex < 0 then
    begin
      LChunk := LHash;
      LHash := '';
    end
    else
    begin
      LChunk := LHash.Substring(0, LSeparatorIndex);
      LHash := LHash.Substring(LSeparatorIndex + 1);
    end;

    if LChunk.IsEmpty then
      Exit;

    LAlphabetWithoutSeparator := LAlphabet.Substring(1);
    Result := Result + [ToNumber(LChunk, LAlphabetWithoutSeparator)];

    if not LHash.IsEmpty then
      LAlphabet := ConsistentShuffle(LAlphabet);
  end;
end;

function TSqidsEncoding.DecodeSingle(const AHash: string): Integer;
var
  LNums: TArray<Integer>;
begin
  LNums := Decode(AHash);
  if (Length(LNums) <> 1) or (LNums[0] < 0) then
    raise EConvertError.CreateResFmt(@sSqidsInvHash, [AHash]);
  Result := LNums[0];
end;

function TSqidsEncoding.TryDecodeSingle(const AHash: string; out ANumber: Integer): Boolean;
var
  LNums: TArray<Integer>;
begin
  LNums := Decode(AHash);
  if (Length(LNums) <> 1) or (LNums[0] < 0) then
  begin
    Result := False;
    ANumber := 0;
  end
  else
  begin
    Result := True;
    ANumber := LNums[0];
  end;
end;

function TSqidsEncoding.DecodeToStr(const AHash: string): string;
var
  LNums: TArray<Integer>;
  I: Integer;
begin
  LNums := Decode(AHash);
  Result := '';
  for I := Low(LNums) to High(LNums) do
  begin
    if I > 0 then
      Result := Result + ',';
    Result := Result + LNums[i].ToString;
  end;
end;

end.

