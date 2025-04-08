{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.FontManager.Mac;

{$SCOPEDENUMS ON}

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, SYstem.UITypes, Macapi.CocoaTypes, Macapi.CoreFoundation,
  FMX.FontManager;

type
  TMacFontManager = class(TInterfacedObject, IFMXFontManagerService)
  private
    FFonts: TList<CGFontRef>;
    FFontInfos: TList<TFontInfo>;
    FFontFamilyNames: TDictionary<TFontName, TFontName>;
    class procedure PrintErrorToLog(const AErrorRef: PCFErrorRef);
    function RegisterFont(const AFontRef: CGFontRef): Boolean;
    function AddCustomFontFromMemoryStream(const AStream: TCustomMemoryStream): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    { IFMXFontManagerService }
    function AddCustomFontFromFile(const AFileName: TFileName): Boolean;
    function AddCustomFontFromResource(const AResourceName: string): Boolean;
    function AddCustomFontFromStream(const AStream: TStream): Boolean;
    function HasCustomFont(const AFontFamily: TFontName): Boolean;
    function HasCustomFonts: Boolean;
    function GetCustomFontInfo(const AIndex: Integer): TFontInfo;
    function GetCustomFontInfoCount: Integer;
  end;

implementation

uses
  System.IOUtils, System.Types, System.Net.URLClient, Macapi.Foundation, Macapi.AppKit, Macapi.CoreText, Macapi.Helpers,
  Macapi.CoreGraphics, Macapi.ObjectiveC, FMX.Types, System.Generics.Defaults;

{ TMacFontManager }

function CTFontManagerRegisterGraphicsFont(font: CGFontRef; error: PCFErrorRef): Integer; cdecl; external libCoreText name _PU + 'CTFontManagerRegisterGraphicsFont';

function TMacFontManager.AddCustomFontFromFile(const AFileName: TFileName): Boolean;

  function FileToNameToUrl(const AFileName: TFileName): NSUrl;
  var
    NormalizedFileName: string;
    Uri: TURI;
  begin
    NormalizedFileName := TURI.FixupForREST(AFileName);
    Uri := TURI.Create(NormalizedFileName);
    Uri.Scheme := 'file';
    Result := StrToNSUrl(Uri.Encode);
  end;

var
  FontUrl: NSURL;
  ErrorRef: PCFErrorRef;
  FontDataProvider: CGDataProviderRef;
  FontRef: CGFontRef;
begin
  if AFileName = '' then
    Exit(False);

  FontUrl := FileToNameToUrl(AFileName);
  Result := CTFontManagerRegisterFontsForURL(NSObjectToID(FontUrl), kCTFontManagerScopeProcess, @ErrorRef) <> 0;
  if Result then
  begin
    FontDataProvider := CGDataProviderCreateWithURL(NSObjectToID(FontUrl));
    if FontDataProvider = nil then
      Result := False
    else
    begin
      FontRef := CGFontCreateWithDataProvider(fontDataProvider);
      CGDataProviderRelease(FontDataProvider);
      Result := RegisterFont(FontRef);
    end;
  end
  else
    PrintErrorToLog(ErrorRef);
end;

function TMacFontManager.AddCustomFontFromResource(const AResourceName: string): Boolean;
var
  ResStream: TResourceStream;
begin
  if FindResource(HInstance, PChar(AResourceName), RT_RCDATA) <> 0 then
  begin
    ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
    try
      Result := AddCustomFontFromMemoryStream(ResStream);
    finally
      ResStream.Free;
    end;
  end
  else
    Result := False;
end;

function TMacFontManager.AddCustomFontFromMemoryStream(const AStream: TCustomMemoryStream): Boolean;
var
  FontDataProvider: CGDataProviderRef;
  FontRef: CGFontRef;
begin
  Assert(AStream <> nil);
  Result := AStream.Size > 0;
  if Result then
  begin
    FontDataProvider := CGDataProviderCreateWithData(nil, AStream.Memory, AStream.Size, nil);
    if FontDataProvider = nil then
      Result := False
    else
    begin
      FontRef := CGFontCreateWithDataProvider(fontDataProvider);
      CGDataProviderRelease(FontDataProvider);
      Result := RegisterFont(FontRef);
    end;
  end;
end;

function TMacFontManager.AddCustomFontFromStream(const AStream: TStream): Boolean;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.CopyFrom(AStream, AStream.Size);
    Result := AddCustomFontFromMemoryStream(Stream);
  finally
    Stream.Free;
  end;
end;

constructor TMacFontManager.Create;
begin
  FFonts := TList<CGFontRef>.Create;
  FFontFamilyNames := TDictionary<TFontName, TFontName>.Create;
  FFontInfos := TList<TFontInfo>.Create(TComparer<TFontInfo>.Construct(function(const Left, Right: TFontInfo): Integer
    begin
      Result := CompareText(TFontInfo(Left).FamilyName, TFontInfo(Right).FamilyName);
    end));
end;

destructor TMacFontManager.Destroy;
begin
  FreeAndNil(FFontInfos);
  FreeAndNil(FFontFamilyNames);
  FreeAndNil(FFonts);
  inherited;
end;

function TMacFontManager.GetCustomFontInfo(const AIndex: Integer): TFontInfo;
begin
  Result := FFontInfos[AIndex];
end;

function TMacFontManager.GetCustomFontInfoCount: Integer;
begin
  Result := FFontInfos.Count;
end;

function TMacFontManager.HasCustomFont(const AFontFamily: TFontName): Boolean;
begin
  Result := FFontFamilyNames.ContainsKey(string(AFontFamily).ToLower);
end;

function TMacFontManager.HasCustomFonts: Boolean;
begin
  Result := FFonts.Count > 0;
end;

class procedure TMacFontManager.PrintErrorToLog(const AErrorRef: PCFErrorRef);
var
  Error: NSError;
  Description: string;
begin
  Error := TNSError.Wrap(AErrorRef);
  Description := NSStrToStr(Error.localizedDescription);
  Log.d('Cannot register font: code="%d", description="%s"', [Error.code, Description]);
end;

function TMacFontManager.RegisterFont(const AFontRef: CGFontRef): Boolean;
var
  ErrorRef: PCFErrorRef;
  NameRef: CFStringRef;
  Name: string;
  FontInfo: TFontInfo;
begin
  Result := CTFontManagerRegisterGraphicsFont(AFontRef, @ErrorRef) <> 0;
  if Result then
  begin
    FFonts.Add(AFontRef);
    NameRef := CGFontCopyFullName(AFontRef);
    Name := NSStrToStr(TNSString.Wrap(NameRef));
    FontInfo.FamilyName := Name;
    FFontFamilyNames.Add(Name.ToLower, Name);
    FFontInfos.Add(FontInfo);
  end
  else
    PrintErrorToLog(ErrorRef);
end;

end.
