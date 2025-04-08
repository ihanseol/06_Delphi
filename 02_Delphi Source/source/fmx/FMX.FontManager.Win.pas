{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.FontManager.Win;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.UITypes, System.Generics.Collections, Winapi.D2D1, Winapi.GDIPOBJ,
  Winapi.GDIPAPI, FMX.FontManager;

type
  /// <summary>A factory for creating a collection of custom fonts for future use in DirectWrite.</summary>
  IFontCollectionFactoryDW = interface
  ['{6FBF9EE9-433C-4B7D-B318-CC4C74FB6725}']
    /// <summary>Creates a new DirectWrite font collection.</summary>
    function CreateCustomFontCollection: IDWriteFontCollection;
  end;

  /// <summary>A factory for getting a private collection of custom fonts for future use in GDI+.</summary>
  IFontCollectionFactoryGDIP = interface
  ['{2D230494-F32E-4946-9D07-64A1AB9F8F7C}']
    /// <summary>Returns a GDI+ private font collection.</summary>
    function GetCustomFontCollection: TGPPrivateFontCollection;
  end;

  TWinFontManager = class(TInterfacedObject, IFMXFontManagerService, IFontCollectionFactoryDW, IFontCollectionFactoryGDIP)
  private
    FFontInfos: TList<TFontInfo>;
    FFontFamilyNames: TDictionary<TFontName, TFontName>;
    { DirectWrite }
    FWasDWLoadersRegistered: Boolean;
    FFontCollectionDWLoader: IDWriteFontCollectionLoader;
    FFontFileLoader: IDWriteFontFileLoader;
    { GDI+ }
    FFontCollectionGDIP: TGPPrivateFontCollection;
    function GetCustomGDIPFontCollection: TGPPrivateFontCollection;
    procedure RefreshFontFamilyNames;
    function GetFontCollectionGDIP: TGPPrivateFontCollection;
    { DirectWrite }
    function CreateCustomDWFontCollection: IDWriteFontCollection;
    procedure RegisterLoadersIfRequired;
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

    { IFontCollectionFactoryDW }
    function IFontCollectionFactoryDW.CreateCustomFontCollection = CreateCustomDWFontCollection;

    { IFontCollectionFactoryGDIP }
    function IFontCollectionFactoryGDIP.GetCustomFontCollection = GetCustomGDIPFontCollection;
  public
    property FontCollectionGDIP: TGPPrivateFontCollection read GetFontCollectionGDIP;
  end;

implementation

uses
  System.IOUtils, System.Win.ComObj, System.Generics.Defaults, Winapi.Windows, Winapi.Messages, FMX.Canvas.D2D, FMX.Types, FMX.Consts;

type
  IFMXFontCollection = interface
  ['{C210DAE2-C170-4627-8773-7EBA0C707836}']
    procedure AddFontFile(const AFontFileName: string); overload;
    procedure AddFontStream(const AStream: TStream); overload;
    function HasCustomFonts: Boolean;
    function GenerateCollectionKey: Integer;
    procedure Clear;
  end;

  TFontFileEnumeratorDW = class(TInterfacedObject, IDWriteFontFileEnumerator)
  private
    FFontFileEnum: TList<IDWriteFontFile>.TEnumerator;
  public
    constructor Create(const AFontFileEnum: TList<IDWriteFontFile>.TEnumerator);
    destructor Destroy; override;
    { IDWriteFontFileEnumerator }
    function MoveNext(var hasCurrentFile: BOOL): HResult; stdcall;
    function GetCurrentFontFile(out fontFile: IDWriteFontFile): HResult; stdcall;
  end;

  TFontFileStreamDW = class(TInterfacedObject, IDWriteFontFileStream)
  private type
    TFragmentContext = record
      FragmentStart: Pointer;
      FragmentSize: UINT64;
    end;
    PFragmentContext = ^TFragmentContext;
  private
    FStream: TStream;
  public
    constructor Create(const AStream: TStream);
    { IDWriteFontFileStream }
    function ReadFileFragment(var fragmentStart: Pointer; fileOffset: UINT64; fragmentSize: UINT64; var fragmentContext: Pointer): HResult; stdcall;
    procedure ReleaseFileFragment(fragmentContext: Pointer); stdcall;
    function GetFileSize(var fileSize: UINT64): HResult; stdcall;
    function GetLastWriteTime(var lastWriteTime: UINT64): HResult; stdcall;
  end;

  TFontCollectionDW = class(TInterfacedObject, IFMXFontCollection, IDWriteFontCollectionLoader,  IDWriteFontFileLoader)
  private
    FFonts: TList<IDWriteFontFile>;
    FFontFileNames: TList<string>;
    FFontStreams: TObjectList<TStream>;
    FNextKey: Integer;
    FIssuedKeys: TDictionary<Integer, Boolean>; // <Key> - <Was Key used for generation collection>?
    function GetDWFactory: IDWriteFactory;
  private
    { IFMXFontCollection }
    procedure AddFontFile(const AFontFileName: string); overload;
    procedure AddFontStream(const AStream: TStream); overload;
    procedure Clear;
    function HasCustomFonts: Boolean;
    { IDWriteFontCollectionLoader }
    function CreateEnumeratorFromKey(const factory: IDWriteFactory; collectionKey: Pointer; collectionKeySize: Cardinal;
                                     out fontFileEnumerator: IDWriteFontFileEnumerator): HResult; stdcall;
    { IDWriteFontFileLoader }
    function CreateStreamFromKey(fontFileReferenceKey: Pointer; fontFileReferenceKeySize: Cardinal;
                                 out fontFileStream: IDWriteFontFileStream): HResult; stdcall;
  public
    constructor Create;
    destructor Destroy; override;
    function GenerateCollectionKey: Integer;
    property DWFactory: IDWriteFactory read GetDWFactory;
  end;

{ TWinFontManager }

function TWinFontManager.AddCustomFontFromResource(const AResourceName: string): Boolean;
type
  TResourceType = (Font, Binary);

  function TryDefineResourceType(const AResourceName: string; var AType: TResourceType): Boolean;
  var
    FontId: Integer;
  begin
    if FindResource(HInstance, PChar(AResourceName), RT_RCDATA) <> 0 then
    begin
      AType := TResourceType.Binary;
      Result := True;
    end
    else if TryStrToInt(AResourceName, FontId) and (FindResource(HInstance, PChar(FontId), RT_FONT) <> 0) then
    begin
      AType := TResourceType.Font;
      Result := True;
    end
    else
      Result := False;
  end;

var
  ResStream: TResourceStream;
  ResourceType: TResourceType;
begin
  if TryDefineResourceType(AResourceName, ResourceType) then
  begin
    case ResourceType of
      TResourceType.Font:
        ResStream := TResourceStream.CreateFromID(HInstance, StrToInt(AResourceName), RT_FONT);
      TResourceType.Binary:
        ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
    else
      raise Exception.CreateRes(@SUnknowType);
    end;

    try
      Result := AddCustomFontFromStream(ResStream);
    finally
      ResStream.Free;
    end;
  end
  else
  begin
    Log.d(SCannotFindFontResource, [AResourceName]);
    Result := False;
  end;
end;

function TWinFontManager.AddCustomFontFromStream(const AStream: TStream): Boolean;
var
  FontCollection: IFMXFontCollection;
  Stream: TMemoryStream;
begin
  Result := AStream.Size > 0;
  if Result then
  begin
    Stream := TMemoryStream.Create;
    try
      Stream.CopyFrom(AStream, AStream.Size);

      // GDI, GDI+
      FontCollectionGDIP.AddMemoryFont(Stream.Memory, Stream.Size);
      RefreshFontFamilyNames;

      // DirectWrite
      if Supports(FFontCollectionDWLoader, IFMXFontCollection, FontCollection) then
      begin
        RegisterLoadersIfRequired;
        FontCollection.AddFontStream(Stream);
      end;
    finally
      // DirectWrite uses lazy font loading, so it doesn't make copy of passed memory. So we have to keep stream instance
      if FontCollection = nil then
        Stream.Free;
    end;

    SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  end;
end;

constructor TWinFontManager.Create;
var
  Loader: TFontCollectionDW;
begin
  inherited;
  // We don't allocate FFontCollectionGDIP here, because If user uses FMX as loadable package, host has to init GDI+
  // before it for usage in FMX. In order not to create problems, we use lazy initialization.
  FFontFamilyNames := TDictionary<TFontName, TFontName>.Create;
  FFontInfos := TList<TFontInfo>.Create(TComparer<TFontInfo>.Construct(function(const Left, Right: TFontInfo): Integer
    begin
      Result := CompareText(TFontInfo(Left).FamilyName, TFontInfo(Right).FamilyName);
    end));
  if TOSVersion.Check(6, 1) then
  begin
    Loader := TFontCollectionDW.Create;
    FFontCollectionDWLoader := Loader;
    FFontFileLoader := Loader;
  end;
end;

destructor TWinFontManager.Destroy;
var
  FontCollection: IFMXFontCollection;
  Factory: IDWriteFactory;
begin
  FreeAndNil(FFontInfos);
  FreeAndNil(FFontFamilyNames);
  FreeAndNil(FFontCollectionGDIP);
  if TOSVersion.Check(6, 1) then
  begin
    if Supports(FFontCollectionDWLoader, IFMXFontCollection, FontCollection) then
      FontCollection.Clear;
    if FWasDWLoadersRegistered then
    begin
      Factory := TCustomCanvasD2D.SharedDWriteFactory;
      OleCheck(Factory.UnregisterFontFileLoader(FFontFileLoader));
      OleCheck(Factory.UnregisterFontCollectionLoader(FFontCollectionDWLoader));
    end;
    FFontFileLoader := nil;
    FFontCollectionDWLoader := nil;
  end;
  inherited;
end;

function TWinFontManager.CreateCustomDWFontCollection: IDWriteFontCollection;
var
  CollectionKey: Integer;
  FontCollection: IFMXFontCollection;
begin
  if HasCustomFonts and Supports(FFontCollectionDWLoader, IFMXFontCollection, FontCollection) then
  begin
    RegisterLoadersIfRequired;
    CollectionKey := FontCollection.GenerateCollectionKey;
    TCustomCanvasD2D.SharedDWriteFactory.CreateCustomFontCollection(FFontCollectionDWLoader, @CollectionKey,
                                                                    SizeOf(Integer), Result);
  end
  else
    Result := nil;
end;

function TWinFontManager.GetFontCollectionGDIP: TGPPrivateFontCollection;
begin
  if FFontCollectionGDIP = nil then
    FFontCollectionGDIP := TGPPrivateFontCollection.Create;

  Result := FFontCollectionGDIP;
end;

function TWinFontManager.GetCustomFontInfo(const AIndex: Integer): TFontInfo;
begin
  Result := FFontInfos[AIndex];
end;

function TWinFontManager.GetCustomFontInfoCount: Integer;
begin
  Result := FFontInfos.Count;
end;

function TWinFontManager.GetCustomGDIPFontCollection: TGPPrivateFontCollection;
begin
  Result := FontCollectionGDIP;
end;

function TWinFontManager.HasCustomFont(const AFontFamily: TFontName): Boolean;
begin
  Result := FFontFamilyNames.ContainsKey(string(AFontFamily).ToLower);
end;

function TWinFontManager.HasCustomFonts: Boolean;
var
  FontCollection: IFMXFontCollection;
begin
  if Supports(FFontCollectionDWLoader, IFMXFontCollection, FontCollection) then
    Result := FontCollection.HasCustomFonts
  else
    Result := False;
end;

procedure TWinFontManager.RefreshFontFamilyNames;
var
  Families: array of TGPFontFamily;
  Count: Integer;
  I: Integer;
  FamilyName: string;
  FontInfo: TFontInfo;
begin
  FFontFamilyNames.Clear;
  FFontInfos.Clear;
  Count := FontCollectionGDIP.GetFamilyCount;

  SetLength(Families, Count);
  for I := 0 to Count - 1 do
    Families[i] := TGPFontFamily.Create;

  FontCollectionGDIP.GetFamilies(Count, Families, Count);
  for I := 0 to Count - 1 do
  begin
    Families[I].GetFamilyName(FamilyName);
    FontInfo.FamilyName := FamilyName;
    FFontFamilyNames.Add(FamilyName.ToLower, FamilyName);
    FFontInfos.Add(FontInfo);
  end;
end;

procedure TWinFontManager.RegisterLoadersIfRequired;
var
  Factory: IDWriteFactory;
begin
  if FWasDWLoadersRegistered then
    Exit;

  Factory := TCustomCanvasD2D.SharedDWriteFactory;
  OleCheck(Factory.RegisterFontCollectionLoader(FFontCollectionDWLoader));
  OleCheck(Factory.RegisterFontFileLoader(FFontFileLoader));

  FWasDWLoadersRegistered := True;
end;

function TWinFontManager.AddCustomFontFromFile(const AFileName: TFileName): Boolean;
var
  FontCollection: IFMXFontCollection;
begin
  Result := FileExists(AFileName);
  if Result then
  begin
    // GDI, GDI+
    FontCollectionGDIP.AddFontFile(AFileName);
    RefreshFontFamilyNames;

    // DirectWrite
    if Supports(FFontCollectionDWLoader, IFMXFontCollection, FontCollection) then
    begin
      RegisterLoadersIfRequired;
      FontCollection.AddFontFile(AFileName);
    end;

    SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  end
  else
    Log.d(SCannotFindFontFile, [AFileName]);
end;

{ TFontFileEnumeratorDW }

constructor TFontFileEnumeratorDW.Create(const AFontFileEnum: TList<IDWriteFontFile>.TEnumerator);
begin
  if AFontFileEnum = nil then
    raise EArgumentNilException.CreateResFmt(@SWrongParameter, ['AFontFileEnum']);

  inherited Create;
  FFontFileEnum := AFontFileEnum;
end;

destructor TFontFileEnumeratorDW.Destroy;
begin
  FreeAndNil(FFontFileEnum);
  inherited;
end;

function TFontFileEnumeratorDW.GetCurrentFontFile(out fontFile: IDWriteFontFile): HResult;
begin
  fontFile := FFontFileEnum.Current;
  Result := S_OK;
end;

function TFontFileEnumeratorDW.MoveNext(var hasCurrentFile: BOOL): HResult;
begin
  hasCurrentFile := FFontFileEnum.MoveNext;
  Result := S_OK;
end;

{ TFontCollectionDW }

procedure TFontCollectionDW.AddFontFile(const AFontFileName: string);
var
  FontFile: IDWriteFontFile;
  NormalizedFileName: string;
begin
  NormalizedFileName := AFontFileName.ToLower;
  if not FFontFileNames.Contains(NormalizedFileName) then
    if Succeeded(DWFactory.CreateFontFileReference(PChar(AFontFileName), nil, FontFile)) then
    begin
      FFontFileNames.Add(NormalizedFileName);
      FFonts.Add(FontFile);
    end;
end;

procedure TFontCollectionDW.AddFontStream(const AStream: TStream);
var
  FontFile: IDWriteFontFile;
begin
  if not FFontStreams.Contains(AStream) then
  begin
    FFontStreams.Add(AStream);
    if Succeeded(DWFactory.CreateCustomFontFileReference(Pointer(@AStream), SizeOf(Pointer), Self, FontFile)) then
    begin
      FFonts.Add(FontFile);
    end;
  end;
end;

procedure TFontCollectionDW.Clear;
begin
  FFonts.Clear;
  FFontStreams.Clear;
  FFontFileNames.Clear;
end;

constructor TFontCollectionDW.Create;
begin
  inherited Create;
  FNextKey := 1;
  FFontFileNames := TList<string>.Create;
  FIssuedKeys := TDictionary<Integer, Boolean>.Create;
  FFontStreams := TObjectList<TStream>.Create;
  FFonts := TList<IDWriteFontFile>.Create;
end;

destructor TFontCollectionDW.Destroy;
begin
  FreeAndNil(FFonts);
  FreeAndNil(FFontStreams);
  FreeAndNil(FIssuedKeys);
  FreeAndNil(FFontFileNames);
  inherited;
end;

function TFontCollectionDW.CreateEnumeratorFromKey(const factory: IDWriteFactory; collectionKey: Pointer;
  collectionKeySize: Cardinal; out fontFileEnumerator: IDWriteFontFileEnumerator): HResult;
var
  LCollectionKey: Integer;
begin
  LCollectionKey := Integer(collectionKey^);
  if (SizeOf(Integer) = collectionKeySize) and FIssuedKeys.ContainsKey(LCollectionKey) then
  begin
    FIssuedKeys.AddOrSetValue(LCollectionKey, True);
    fontFileEnumerator := TFontFileEnumeratorDW.Create(FFonts.GetEnumerator);
    Result := S_OK;
  end
  else
  begin
    fontFileEnumerator := nil;
    Result := E_FAIL;
  end;
end;

function TFontCollectionDW.CreateStreamFromKey(fontFileReferenceKey: Pointer; fontFileReferenceKeySize: Cardinal;
  out fontFileStream: IDWriteFontFileStream): HResult;
var
  Stream: TStream;
begin
  if SizeOf(Pointer) = fontFileReferenceKeySize then
  begin
    Stream := TStream(fontFileReferenceKey^);
    fontFileStream := TFontFileStreamDW.Create(Stream);
    Result := S_OK;
  end
  else
  begin
    fontFileStream := nil;
    Result := E_FAIL;
  end;
end;

function TFontCollectionDW.GenerateCollectionKey: Integer;
begin
  Result := FNextKey;
  FIssuedKeys.Add(Result, False); // False - There is no related font collection yet
  Inc(FNextKey);
end;

function TFontCollectionDW.GetDWFactory: IDWriteFactory;
begin
  Result := TCustomCanvasD2D.SharedDWriteFactory;
end;

function TFontCollectionDW.HasCustomFonts: Boolean;
begin
  Result := FFonts.Count > 0;
end;

{ TFontFileStreamDW }

constructor TFontFileStreamDW.Create(const AStream: TStream);
begin
  if AStream = nil then
    raise EArgumentNilException.CreateResFmt(@SWrongParameter, ['AStream']);

  inherited Create;
  FStream := AStream;
end;

function TFontFileStreamDW.GetFileSize(var fileSize: UINT64): HResult;
begin
  fileSize := FStream.Size;
  Result := S_OK;
end;

function TFontFileStreamDW.GetLastWriteTime(var lastWriteTime: UINT64): HResult;
begin
  lastWriteTime := 0;
  Result := S_OK;
end;

function TFontFileStreamDW.ReadFileFragment(var fragmentStart: Pointer; fileOffset, fragmentSize: UINT64;
  var fragmentContext: Pointer): HResult;
var
  Context: PFragmentContext;
begin
  TMonitor.Enter(Self);
  try
    FStream.Seek(fileOffset, TSeekOrigin.soBeginning);
    GetMem(fragmentStart, fragmentSize);
    FStream.ReadData(fragmentStart, fragmentSize);

    GetMem(Context, SizeOf(TFragmentContext));
    Context.FragmentStart := fragmentStart;
    Context.FragmentSize := fragmentSize;
    fragmentContext := Context;

    Result := S_OK;
  finally
    TMonitor.Exit(Self);
  end;
end;

procedure TFontFileStreamDW.ReleaseFileFragment(fragmentContext: Pointer);
var
  Context: PFragmentContext;
begin
  Context := fragmentContext;
  FreeMem(Context.FragmentStart);
  FreeMem(Context);
end;

end.
