{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Skia.AnimatedCodec;

interface

uses
  { Delphi }
  FMX.Graphics,
  System.Classes,
  System.SysUtils,

  { Skia }
  FMX.Skia,
  FMX.Skia.Canvas,
  System.Skia,
  System.Skia.API;

type
  ESkAnimatedCodec = class(Exception);

  { TSkAnimatedCodec }

  TSkAnimatedCodec = class(TCustomAnimatedCodec)
  strict private
    function GetFrames(out ABitmapsData: TArray<TBitmapData>): TArray<TSkFrame>;
    procedure ReleaseFrames(const ABitmapsData: TArray<TBitmapData>);
  strict protected
    constructor Create(const AExtension: string); override;
  public
    destructor Destroy; override;
    function LoadFromStream(const AStream: TStream): Boolean; override;
    function SaveToFile(const AFileName: string; const AQuality: Integer = 80): Boolean; override;
    function SaveToStream(const AStream: TStream; const AQuality: Integer = 80): Boolean; override;
  end;


implementation

{ TSkAnimatedCodec }

constructor TSkAnimatedCodec.Create(const AExtension: string);
begin
  inherited;
  SkInitialize;
end;

destructor TSkAnimatedCodec.Destroy;
begin
  SkFinalize;
  inherited;
end;

function TSkAnimatedCodec.GetFrames(
  out ABitmapsData: TArray<TBitmapData>): TArray<TSkFrame>;
var
  I: Integer;
  J: Integer;
begin
  SetLength(Result, Count);
  SetLength(ABitmapsData, Length(Result));
  for I := 0 to Length(Result) - 1 do
  begin
    try
      if (SkFmxColorType[Frames[I].Bitmap.PixelFormat] = TSkColorType.Unknown) or (not Frames[I].Bitmap.Map(TMapAccess.Read, ABitmapsData[I])) then
        raise ESkAnimatedCodec.Create('Unable to map the bitmap.');
      Result[I].Pixmap   := TSkPixmap.Create(TSkImageInfo.Create(ABitmapsData[I].Width, ABitmapsData[I].Height, SkFmxColorType[ABitmapsData[I].PixelFormat]), ABitmapsData[I].Data, ABitmapsData[I].Pitch);
      Result[I].Duration := Frames[I].Duration;
    except
      for J := I - 1 downto 0 do
        Frames[J].Bitmap.Unmap(ABitmapsData[J]);
      raise;
    end;
  end;
end;

function TSkAnimatedCodec.LoadFromStream(const AStream: TStream): Boolean;
begin
  Result := False;
end;

procedure TSkAnimatedCodec.ReleaseFrames(
  const ABitmapsData: TArray<TBitmapData>);
var
  I: Integer;
begin
  for I := 0 to Length(ABitmapsData) - 1 do
    Frames[I].Bitmap.Unmap(ABitmapsData[I]);
end;

function TSkAnimatedCodec.SaveToFile(const AFileName: string;
  const AQuality: Integer): Boolean;
var
  LBitmapsData: TArray<TBitmapData>;
  LFrames: TArray<TSkFrame>;
begin
  if Extension = '.webp' then
  begin
    LFrames := GetFrames(LBitmapsData);
    try
      Result := TSkAnimatedWebPEncoder.EncodeToFile(AFileName, LFrames, AQuality);
    finally
      ReleaseFrames(LBitmapsData);
    end;
  end
  else
    Result := False;
end;

function TSkAnimatedCodec.SaveToStream(const AStream: TStream;
  const AQuality: Integer): Boolean;
var
  LBitmapsData: TArray<TBitmapData>;
  LFrames: TArray<TSkFrame>;
begin
  if Extension = '.webp' then
  begin
    LFrames := GetFrames(LBitmapsData);
    try
      Result := TSkAnimatedWebPEncoder.EncodeToStream(AStream, LFrames, AQuality);
    finally
      ReleaseFrames(LBitmapsData);
    end;
  end
  else
    Result := False;
end;

{$HPPEMIT NOUSINGNAMESPACE}
{$HPPEMIT END '#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FMX_SKIA_ANIMATEDCODEC)'}
{$HPPEMIT END '    using ::Fmx::Skia::Animatedcodec::ESkAnimatedCodec;'}
{$HPPEMIT END '    using ::Fmx::Skia::Animatedcodec::TSkAnimatedCodec;'}
{$HPPEMIT END '#endif'}

initialization
  TAnimatedCodecManager.RegisterAnimatedCodecClass('.webp', SVWEBPImages, [TAnimatedCapability.Encode], TSkAnimatedCodec);
finalization
  TAnimatedCodecManager.UnregisterAnimatedCodecClass('.webp');
end.
