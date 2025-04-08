{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{          Helpers for C++ Variant binding.             }
{*******************************************************}

unit System.Internal.VarHlpr;
{$HPPEMIT NOUSINGNAMESPACE}

interface

  procedure VariantClear(var V: Variant);
  procedure VariantArrayRedim(var V: Variant; High: Integer);
  procedure VariantCast(const src: Variant; var dst: Variant; vt: Integer);

  procedure VariantCpy(const src: Variant; var dst: Variant);
  procedure VariantAdd(const src: Variant; var dst: Variant);
  procedure VariantSub(const src: Variant; var dst: Variant);
  procedure VariantMul(const src: Variant; var dst: Variant);
  procedure VariantDiv(const src: Variant; var dst: Variant);
  procedure VariantMod(const src: Variant; var dst: Variant);
  procedure VariantAnd(const src: Variant; var dst: Variant);
  procedure VariantOr(const src: Variant; var dst: Variant);
  procedure VariantXor(const src: Variant; var dst: Variant);
  procedure VariantShl(const src: Variant; var dst: Variant);
  procedure VariantShr(const src: Variant; var dst: Variant);

  function  VariantAdd2(const V1: Variant; const V2: Variant): Variant;
  function  VariantSub2(const V1: Variant; const V2: Variant): Variant;
  function  VariantMul2(const V1: Variant; const V2: Variant): Variant;
  function  VariantDiv2(const V1: Variant; const V2: Variant): Variant;
  function  VariantMod2(const V1: Variant; const V2: Variant): Variant;
  function  VariantAnd2(const V1: Variant; const V2: Variant): Variant;
  function  VariantOr2(const V1: Variant; const V2: Variant): Variant;
  function  VariantXor2(const V1: Variant; const V2: Variant): Variant;
  function  VariantShl2(const V1: Variant; const V2: Variant): Variant;
  function  VariantShr2(const V1: Variant; const V2: Variant): Variant;
  function  VariantNot(const V1: Variant): Variant;
  function  VariantNeg(const V1: Variant): Variant;

  function  VariantGetElement(const V: Variant; i1: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3, i4: integer): Variant; overload;
  function  VariantGetElement(const V: Variant; i1, i2, i3, i4, i5: integer): Variant; overload;

  procedure VariantPutElement(var V: Variant; const data: Variant; i1: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4: integer); overload;
  procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4, i5: integer); overload;

  procedure VariantFromUnicodeString(var V: Variant; const Str: UnicodeString);
  procedure VariantToUnicodeString(const V: Variant; var Str: UnicodeString);

  function GetTypeInfoHelper(I: Cardinal): Pointer;
  {$NODEFINE GetTypeInfoHelper}

implementation

uses System.Variants,
     System.Classes,
     System.UITypes,
     System.Types;

{ C++Builder helpers, implementation }

procedure VariantClear(var V: Variant);
begin
  VarClear(V);
end;

procedure VariantCast(const src: Variant; var dst: Variant; vt: Integer);
begin
  VarCast(dst, src, vt);
end;

procedure VariantArrayRedim(var V: Variant; High: Integer);
begin
  VarArrayRedim(V, High);
end;

procedure VariantCpy(const src: Variant; var dst: Variant);
begin
  dst := src;
end;

procedure VariantAdd(const src: Variant; var dst: Variant);
begin
  dst := dst + src;
end;

procedure VariantSub(const src: Variant; var dst: Variant);
begin
  dst := dst - src;
end;

procedure VariantMul(const src: Variant; var dst: Variant);
begin
  dst := dst * src;
end;

procedure VariantDiv(const src: Variant; var dst: Variant);
begin
  dst := dst / src;
end;

procedure VariantMod(const src: Variant; var dst: Variant);
begin
  dst := dst mod src;
end;

procedure VariantAnd(const src: Variant; var dst: Variant);
begin
  dst := dst and src;
end;

procedure VariantOr(const src: Variant; var dst: Variant);
begin
  dst := dst or src;
end;

procedure VariantXor(const src: Variant; var dst: Variant);
begin
  dst := dst xor src;
end;

procedure VariantShl(const src: Variant; var dst: Variant);
begin
  dst := dst shl src;
end;

procedure VariantShr(const src: Variant; var dst: Variant);
begin
  dst := dst shr src;
end;

function  VariantCmpEQ(const v1: Variant; const V2: Variant): Boolean;
begin
  Result := v1 = v2;
end;

function  VariantCmpLT(const V1: Variant; const V2: Variant): Boolean;
begin
  Result := V1 < V2;
end;

function  VariantCmpGT(const V1: Variant; const V2: Variant): Boolean;
begin
  Result := V1 > V2;
end;

function  VariantAdd2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := v1 + V2;
end;

function  VariantSub2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 - V2;
end;

function  VariantMul2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 * V2;
end;

function  VariantDiv2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 / V2;
end;

function  VariantMod2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 mod V2;
end;

function  VariantAnd2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 and V2;
end;

function  VariantOr2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 or V2;
end;

function  VariantXor2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 xor V2;
end;

function  VariantShl2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 shl V2;
end;

function  VariantShr2(const V1: Variant; const V2: Variant): Variant;
begin
  Result := V1 shr V2;
end;

function  VariantNot(const V1: Variant): Variant;
begin
  Result := not V1;
end;

function  VariantNeg(const V1: Variant): Variant;
begin
  Result := -V1;
end;

function  VariantGetElement(const V: Variant; i1: integer): Variant; overload;
begin
  Result := V[i1];
end;

function  VariantGetElement(const V: Variant; i1, i2: integer): Variant; overload;
begin
  Result := V[i1, i2];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3: integer): Variant; overload;
begin
  Result := V[I1, i2, i3];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3, i4: integer): Variant; overload;
begin
  Result := V[i1, i2, i3, i4];
end;

function  VariantGetElement(const V: Variant; i1, i2, i3, i4, i5: integer): Variant; overload;
begin
  Result := V[i1, i2, i3, i4, i5];
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1: integer); overload;
begin
  V[i1] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2: integer); overload;
begin
  V[i1, i2] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3: integer); overload;
begin
  V[i1, i2, i3] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4: integer); overload;
begin
  V[i1, i2, i3, i4] := data;
end;

procedure VariantPutElement(var V: Variant; const data: Variant; i1, i2, i3, i4, i5: integer); overload;
begin
  V[i1, i2, i3, i4, i5] := data;
end;

procedure VariantFromUnicodeString(var V: Variant; const Str: UnicodeString);
begin
  V := Str;
end;

procedure VariantToUnicodeString(const V: Variant; var Str: UnicodeString);
begin
  Str := V;
end;

type
{$SCOPEDENUMS ON}
  TypeInfoIndex = (tiiBoolean       = 1,
                   tiiByte          = 2,
                   tiiShortInt      = 3,
                   tiiWord          = 4,
                   tiiSmallInt      = 5,
                   tiiLongInt       = 6,
                   tiiLongWord      = 7,
                   tiiInt64         = 8,
                   tiiUInt64        = 9,
                   tiiFloat         = 10,
                   tiiDouble        = 11,
                   tiiExtended      = 12,
                   tiiAnsiChar      = 13,
                   tiiWideChar      = 14,
                   tiiCurrency      = 15,
                   tiiTDateTime     = 16,
                   tiiAnsiString    = 17,
                   tiiUnicodeString = 18,
                   tiiWideString    = 19,
                   tiiNativeInt     = 20,
                   tiiNativeUInt    = 21,
                   tiiTSize         = 22,
                   tiiTSmallPoint   = 23,
                   ttiTPoint        = 24,
                   ttiTRect         = 25,
                   tiiTPointF       = 26,
                   ttiTSizeF        = 27,
                   ttiTRectF        = 28,
                   tiiTAlphaColor   = 29,
                   tiiTNotifyEvent  = 30,
                   tiiIInterface    = 31,
                   tiiIInvokable    = 32,
                   tiiVariant       = 33,
                   tiiOleVariant    = 34,
                   tiiLast,
                   tiiMakeAnInt = MaxInt shr 1);
{$SCOPEDENUMS OFF}

function GetTypeInfoHelper(I: Cardinal): Pointer;
begin
  Result := nil;
  if (I >= Cardinal(TypeInfoIndex.tiiLast)) then
    Exit;
  case TypeInfoIndex(I) of
    TypeInfoIndex.tiiBoolean:       Exit(System.TypeInfo(System.Boolean));
    TypeInfoIndex.tiiByte:          Exit(System.TypeInfo(System.Byte));
    TypeInfoIndex.tiiShortInt:      Exit(System.TypeInfo(System.ShortInt));
    TypeInfoIndex.tiiWord:          Exit(System.TypeInfo(System.Word));
    TypeInfoIndex.tiiSmallInt:      Exit(System.TypeInfo(System.SmallInt));
    TypeInfoIndex.tiiLongInt:       Exit(System.TypeInfo(System.LongInt));
    TypeInfoIndex.tiiLongWord:      Exit(System.TypeInfo(System.LongWord));
    TypeInfoIndex.tiiInt64:         Exit(System.TypeInfo(System.Int64));
    TypeInfoIndex.tiiUInt64:        Exit(System.TypeInfo(System.UInt64));
    TypeInfoIndex.tiiFloat:         Exit(System.TypeInfo(System.Single));
    TypeInfoIndex.tiiDouble:        Exit(System.TypeInfo(System.Double));
    TypeInfoIndex.tiiExtended:      Exit(System.TypeInfo(System.Extended));
{$IFNDEF NEXTGEN}
    TypeInfoIndex.tiiAnsiChar:      Exit(System.TypeInfo(System.AnsiChar));
{$ENDIF}
    TypeInfoIndex.tiiWideChar:      Exit(System.TypeInfo(System.WideChar));
    TypeInfoIndex.tiiCurrency:      Exit(System.TypeInfo(System.Currency));
    TypeInfoIndex.tiiTDateTime:     Exit(System.TypeInfo(System.TDateTime));
{$IFNDEF NEXTGEN}
    TypeInfoIndex.tiiAnsiString:    Exit(System.TypeInfo(System.AnsiString));
{$ENDIF}
    TypeInfoIndex.tiiUnicodeString: Exit(System.TypeInfo(System.UnicodeString));
{$IFNDEF NEXTGEN}
    TypeInfoIndex.tiiWideString:    Exit(System.TypeInfo(System.WideString));
{$ENDIF}
    TypeInfoIndex.tiiNativeInt:     Exit(System.TypeInfo(System.NativeInt));
    TypeInfoIndex.tiiNativeUInt:    Exit(System.TypeInfo(System.NativeUInt));
    TypeInfoIndex.tiiTSize:         Exit(System.TypeInfo(System.Types.TSize));
    TypeInfoIndex.tiiTSmallPoint:   Exit(System.TypeInfo(System.Types.TSmallPoint));
    TypeInfoIndex.ttiTPoint:        Exit(System.TypeInfo(System.Types.TPoint));
    TypeInfoIndex.ttiTRect:         Exit(System.TypeInfo(System.Types.TRect));
    TypeInfoIndex.tiiTPointF:       Exit(System.TypeInfo(System.Types.TPointF));
    TypeInfoIndex.ttiTSizeF:        Exit(System.TypeInfo(System.Types.TSizeF));
    TypeInfoIndex.ttiTRectF:        Exit(System.TypeInfo(System.Types.TRectF));
    TypeInfoIndex.tiiTAlphaColor:   Exit(System.TypeInfo(System.UITypes.TAlphaColor));
    TypeInfoIndex.tiiTNotifyEvent:  Exit(System.TypeInfo(System.Classes.TNotifyEvent));
    TypeInfoIndex.tiiIInterface:    Exit(System.TypeInfo(System.IInterface));
    TypeInfoIndex.tiiIInvokable:    Exit(System.TypeInfo(System.IInvokable));
    TypeInfoIndex.tiiVariant:       Exit(System.TypeInfo(System.Variant));
    TypeInfoIndex.tiiOleVariant:    Exit(System.TypeInfo(System.OleVariant));
  end;
end;


end.

