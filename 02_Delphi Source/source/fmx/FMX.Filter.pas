{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Filter;

interface

{$SCOPEDENUMS ON}

uses
  System.SysUtils, System.Classes, System.Types, System.Math.Vectors, System.Rtti,
  System.UITypes, System.Generics.Collections, FMX.Types3D, FMX.Graphics;

type
{ IFilterCacheLayer }

  IFilterCacheLayer = interface
    ['{49EEF76F-3BD6-4688-994F-DC1B55002DEA}']
    /// <summary>Force refresh cache on next use.</summary>
    procedure SetNeedUpdate;
  end;

{ TBitmapCacheLayer }

  IBitmapCacheLayer = interface(IFilterCacheLayer)
    ['{C321CAF5-994B-4B64-9E99-8903B7B6A67D}']
    /// <summary>Attempts to initiate the draw cache update, rendering the cache image on the target.</summary>
    /// <returns>True when cache modification is required and False when the current cache could be drawn to the target without updating.</returns>
    function BeginUpdate(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; out ACacheCanvas: TCanvas): Boolean;
    /// <summary>Concludes the cache update rendering the result onto the target.</summary>
    /// <param name="AGeneratedBitmap">Allows to change the generated cache image before storing it.</param>
    procedure EndUpdate(const AGeneratedBitmap: TProc<TBitmap> = nil);
  end;

  TBitmapCacheLayer = class(TInterfacedObject, IBitmapCacheLayer)
  private
    FBitmap: TBitmap;
    FNeedUpdate: Boolean;
    FSavedDestRect: TRectF;
    FSavedHighSpeed: Boolean;
    FSavedOpacity: Single;
    FSavedTarget: TCanvas;
  public
    destructor Destroy; override;
    /// <summary>Attempts to initiate the draw cache update, rendering the cache image on the target.</summary>
    /// <returns>True when cache modification is required and False when the current cache could be drawn to the target without updating.</returns>
    function BeginUpdate(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; out ACacheCanvas: TCanvas): Boolean;
    /// <summary>Concludes the cache update rendering the result onto the target.</summary>
    /// <param name="AGeneratedBitmap">Allows to change the generated cache image before storing it.</param>
    procedure EndUpdate(const AGeneratedBitmap: TProc<TBitmap> = nil);
    /// <summary>Force refresh cache on next use.</summary>
    procedure SetNeedUpdate;
  end;

{ TFilter }

  TFilterClass = class of TFilter;
  TFilterContext = class;
  TFilterContextClass = class of TFilterContext;
  TFilterValueType = (Float, Point, Color, Bitmap);
  TFilterImageType = (Undefined, Bitmap, Texture);

  PFilterValueRec = ^TFilterValueRec;
  TFilterValueRec = record
    Name: string;
    Desc: string;
    ValueType: TFilterValueType;
    Value: TValue;
    Min, Max, Default: TValue;
    Bitmap: TBitmap;
    constructor Create(const AName, ADesc: string; AType: TFilterValueType; const ADefault, AMin, AMax: TValue); overload;
    constructor Create(const AName, ADesc: string; AType: TFilterValueType); overload;
    constructor Create(const AName, ADesc: string; ADefault: TAlphaColor); overload;
    constructor Create(const AName, ADesc: string; ADefault, AMin, AMax: Single); overload;
    constructor Create(const AName, ADesc: string; const ADefault, AMin, AMax: TPointF); overload;
  end;

  TFilterValueRecArray = array of TFilterValueRec;

  TFilterRec = record
    Name: string;
    Desc: string;
    Values: TFilterValueRecArray;
    constructor Create(const AName, ADesc: string; const AValues: TFilterValueRecArray); overload;
  end;

  TFilter = class(TPersistent)
  private class var
    FDefaultVertexShader: TContextShader;
    FProcessingFilter: TFilter;
  private
    FCacheLayer: IFilterCacheLayer;
    FFilterContext: TFilterContext;
    FInputFilter: TFilter;
    FInputLayerSize: TSize;
    FInputSize: TSize;
    FKeepCurrentContext: Boolean;
    FModified: Boolean;
    FNotifierList: TList<TFilter>;
    FOutputSize: TSize;
    FRecalcInputSize: Boolean;
    FRecalcOutputSize: Boolean;
    FRootInputFilter: TFilter;
    FValues: TFilterValueRecArray;
    procedure AddChangeNotifier(const ATargetFilter: TFilter);
    function GetBestFilterContext(const AOutputType: TFilterImageType; const AOutputCanvasClass: TCanvasClass): TFilterContextClass;
    function GetFilterValue(const AName: string): TValue;
    function GetFilterValuesAsBitmap(const AName: string): TBitmap;
    function GetFilterValuesAsColor(const AName: string): TAlphaColor;
    function GetFilterValuesAsFloat(const AName: string): Single;
    function GetFilterValuesAsPoint(const AName: string): TPointF;
    function GetFilterValuesAsTexture(const AName: string): TTexture;
    function GetOutputSize: TSize;
    procedure RemoveChangeNotifier(const ATargetFilter: TFilter);
    procedure SetFilterContextClass(const AContextClass: TFilterContextClass);
    procedure SetFilterValue(const AName: string; const AValue: TValue);
    procedure SetFilterValuesAsBitmap(const AName: string; const AValue: TBitmap);
    procedure SetFilterValuesAsColor(const AName: string; const AValue: TAlphaColor);
    procedure SetFilterValuesAsFloat(const AName: string; const AValue: Single);
    procedure SetFilterValuesAsPoint(const AName: string; const AValue: TPointF);
    procedure SetFilterValuesAsTexture(const AName: string; const AValue: TTexture);
    procedure SetInputAsFilter(const AValue: TFilter);
    procedure SetInputLayerSize(const AValue: TSize);
    function GetInputSize: TSize;
    property KeepCurrentContext: Boolean read FKeepCurrentContext write FKeepCurrentContext;
    property RootInputFilter: TFilter read FRootInputFilter;
    property Values[const Name: string]: TValue read GetFilterValue write SetFilterValue; default;
  protected
    FAntiAliasing: Boolean;
    FNeedInternalSecondTex: string;
    FPass: Integer;
    FPassCount: Integer;
    FShaders: array of TContextShader;
    FVertexShader: TContextShader;
    procedure CalcSize(var W, H: Integer); virtual;
    procedure Changed;
    procedure FilterDestroying(const AFilter: TFilter);
    procedure InputChanged;
    procedure LoadShaders; virtual;
    procedure LoadTextures; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Apply; virtual;
    procedure ApplyWithoutCopyToOutput;
    /// <summary>Attempt to initiate a layer to apply the filter directly to the canvas drawings from that point on, until the EndLayer is called.</summary>
    function BeginLayer(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean;
    /// <summary>End the drawings in the direct filter layer, merging the result into the original canvas.</summary>
    procedure EndLayer;
    function CalcOutputSize(const AInputSize: TSize): TSize;
    class function FilterAttr: TFilterRec; virtual;
    { Class static method for C++ access }
    class function FilterAttrForClass(C: TFilterClass): TFilterRec; static;
    property FilterContext: TFilterContext read FFilterContext;
    property InputFilter: TFilter read FInputFilter write SetInputAsFilter;
    property InputSize: TSize read GetInputSize;
    property OutputSize: TSize read GetOutputSize;
    property ValuesAsBitmap[const Name: string]: TBitmap read GetFilterValuesAsBitmap write SetFilterValuesAsBitmap;
    property ValuesAsColor[const Name: string]: TAlphaColor read GetFilterValuesAsColor write SetFilterValuesAsColor;
    property ValuesAsFloat[const Name: string]: Single read GetFilterValuesAsFloat write SetFilterValuesAsFloat;
    property ValuesAsPoint[const Name: string]: TPointF read GetFilterValuesAsPoint write SetFilterValuesAsPoint;
    property ValuesAsTexture[const Name: string]: TTexture read GetFilterValuesAsTexture write SetFilterValuesAsTexture;
  end;

{ TFilterManager }

  TFilterManager = class sealed
  private type
    TFilterCategoryDict = TDictionary<TFilterClass, string>;
    TFilterClassDict = TDictionary<string, TFilterClass>;
    TFilterContextClassDict = TDictionary<TCanvasClass, TFilterContextClass>;
  private class var
    FDefaultFilterContextClass: TFilterContextClass;
    FFilterList: TFilterClassDict;
    FFilterCategoryList: TFilterCategoryDict;
    FFilterContextDic: TFilterContextClassDict;
    class function GetBestFilterContext(AVertexShader: TContextShader; const AShaders: array of TContextShader; AShadersCount: Integer;
      AInputCanvasClass, AOutputCanvasClass: TCanvasClass; AInputValue, AOutputValue: TFilterImageType): TFilterContextClass;
  public
    /// <summary>Write the filter categories in a list</summary>
    class procedure FillCategory(AList: TStrings);
    /// <summary>Write the filters of a category in a list</summary>
    class procedure FillFiltersInCategory(const ACategory: string; AList: TStrings);
    /// <summary>Get a new filter instance by the filter name</summary>
    class function FilterByName(const AName: string): TFilter;
    /// <summary>Get the filter class by it's name</summary>
    class function FilterClassByName(const AName: string): TFilterClass;
    /// <summary>Register new filter class.</summary>
    class procedure RegisterFilter(const ACategory: string; AFilter: TFilterClass);
    /// <summary>Register new filter context for a specific canvas.</summary>
    class procedure RegisterFilterContextForCanvas(const AContextClass: TFilterContextClass; const ACanvasClass: TCanvasClass);
    /// <summary>Reserved for internal use only - do not call directly!</summary>
    class procedure UnInitialize;
    /// <summary>Unregister a filter class.</summary>
    class procedure UnregisterFilter(AFilter: TFilterClass);
    class function FilterContext: TFilterContext; static; deprecated 'use TFilter.FilterContext instead';
    class function FilterTexture: TTexture; static; deprecated 'use TFilter.ValuesAsTexture[''Output''] instead';
  end;

{ TFilterContext }

  TFilterContext = class abstract
  private
    FFilter: TFilter;
    FNoCopyForOutput: Boolean;
  protected
    procedure Apply(var APass: Integer; const AAntiAliasing: Boolean; APassCount: Integer; const ASecondImageResourceName: string); virtual; abstract;
    function BeginLayer(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean; virtual;
    procedure Changed(const AValue: TFilterValueRec); virtual; abstract;
    procedure EnableBitmapOutput; virtual;
    procedure EndLayer(const ACacheLayer: IFilterCacheLayer); virtual;
    procedure LoadShaders; virtual;
    procedure LoadTextures; virtual;
    function OutputAsBitmap: TBitmap; virtual; abstract;
    function OutputAsTexture: TTexture; virtual; abstract;
    procedure SetRootInputLayerSize(const ASize: TSize);
    class function SupportsShaders(AVertexShader: TContextShader; const AShaders: array of TContextShader; AShadersCount: Integer): Boolean; virtual;
    property Filter: TFilter read FFilter;
    property NoCopyForOutput: Boolean read FNoCopyForOutput write FNoCopyForOutput;
  public
    constructor Create(const AFilter: TFilter; const AValue: TFilterValueRecArray); virtual;
    class function Style: TContextStyles; virtual;
    /// <summary>Reserved for internal use only - do not call directly!</summary>
    class procedure UnInitialize; virtual; abstract;
    procedure CopyToBitmap(const ADest: TBitmap; const ARect: TRect); virtual; abstract;
    procedure SetInputToShaderVariable(const AName: string); virtual; abstract;
    procedure SetShaders(const AVertexShader, APixelShader: TContextShader); virtual; abstract;
    procedure SetShaderVariable(const AName: string; const AData: array of TVector3D); overload; virtual; abstract;
    procedure SetShaderVariable(const AName: string; const ATexture: TTexture); overload; virtual; abstract;
    procedure SetShaderVariable(const AName: string; const AMatrix: TMatrix3D); overload; virtual; abstract;
    procedure SetShaderVariable(const AName: string; const AColor: TAlphaColor); overload; virtual; abstract;
  end;

  EFilterException = class(Exception);
  EFilterManagerException = class(Exception);

implementation

uses
  System.RTLConsts, System.TypInfo, System.Math, FMX.Materials, FMX.Surfaces, FMX.Consts;

{$R *.res}

type
  TFilterContext3D = class(TFilterContext)
  private type
    TContextRec = record
      Texture: TTexture;
      Context: TContext3D;
    end;
  private class var
    FContextList: TList<TContextRec>;
    FCurrentContext: Integer;
    FNoise: TTexture;
  private
    procedure CreateNoise;
    function GetFilterValues(const Index: string): TValue;
    procedure RenderTextureToContext(const Context: TContext3D;
      const Texture: TTexture; const ARect: TRect; const DstPos: TPoint);
    procedure SetFilterValues(const Index: string; Value: TValue);
    property Values[const Index: string]: TValue read GetFilterValues write SetFilterValues;
    class function GetContextCount: Integer; static;
    class function GetFilterContext3D: TContext3D; static;
    class function GetFilterTexture: TTexture; static;
    class function GetTexture(const Index: Integer): TTexture;
    class procedure SetContextCount(const Value: Integer); static;
    class procedure SetCurrentContext(const Value: Integer); static;
    class procedure ResizeContext(Width, Height: Integer);
    class property ContextCount: Integer read GetContextCount write SetContextCount;
    class property CurrentContext: Integer read FCurrentContext write SetCurrentContext;
    class property FilterContext3D: TContext3D read GetFilterContext3D;
    class property FilterTexture: TTexture read GetFilterTexture;
  protected
    FValues: TFilterValueRecArray;
    FInputRT: TTexture;
    FInputRTContext: TContext3D;
    FTargetRT: TTexture;
    FTargetRTContext: TContext3D;
    FPassInputRT: TTexture;
    FPassInputRTContext: TContext3D;
    FInput: TTexture;
    [Weak] FInputBitmap: TBitmap;
    FTarget: TTexture;
    [Weak] FTargetBitmap: TBitmap;
    FOutputBitmap: TBitmap;
    FProcessing: Boolean;
    FModified: Boolean;
    FNeedInternalSecondTex: string; // need internal texture as second
    FPass, FPassCount: Integer; // for multipass - default shader have 1 pass
    FAntiAliasing: Boolean; // add transparent border for antialising
    procedure Apply(var APass: Integer; const AAntiAliasing: Boolean; APassCount: Integer; const ASecondImageResourceName: string); override;
    procedure Changed(const AValue: TFilterValueRec); override;
    function CreateFilterMaterial: TMaterial; virtual;
    procedure EnableBitmapOutput; override;
    function InputTexture: TTexture;
    procedure LoadTextures; override;
    function OutputAsBitmap: TBitmap; override;
    function OutputAsTexture: TTexture; override;
    procedure Render(W, H: Integer); virtual;
    function TargetTexture: TTexture;
  public
    constructor Create(const AFilter: TFilter; const AValues: TFilterValueRecArray); override;
    destructor Destroy; override;
    class procedure UnInitialize; override;
    class function Style: TContextStyles; override;
    procedure CopyToBitmap(const ADest: TBitmap; const ARect: TRect); override;
    procedure SetInputToShaderVariable(const AName: string); override;
    procedure SetShaders(const AVertexShader, APixelShader: TContextShader); override;
    procedure SetShaderVariable(const AName: string; const AData: array of TVector3D); overload; override;
    procedure SetShaderVariable(const AName: string; const ATexture: TTexture); overload; override;
    procedure SetShaderVariable(const AName: string; const AMatrix: TMatrix3D); overload; override;
    procedure SetShaderVariable(const AName: string; const AColor: TAlphaColor); overload; override;
  end;

function FindValue(const AValues: TFilterValueRecArray; const AName: string;
  const ACaseSensitive: Boolean = False): PFilterValueRec;
begin
  if ACaseSensitive then
  begin
    for var I := 0 to High(AValues) do
      if AValues[I].Name = AName then
        Exit(@AValues[I]);
  end
  else
  begin
    for var I := 0 to High(AValues) do
      if SameText(AValues[I].Name, AName) then
        Exit(@AValues[I]);
  end;
  Result := nil;
end;

{ TBitmapCacheLayer }

function TBitmapCacheLayer.BeginUpdate(const ATarget: TCanvas;
  const ADestRect: TRectF; const AOpacity: Single; const AHighSpeed: Boolean;
  out ACacheCanvas: TCanvas): Boolean;

  function CalcBitmapSize: TSize;
  begin
    var LRect := ADestRect;
    var LScale := ATarget.Matrix.ExtractScale;
    MultiplyRect(LRect, LScale.X, LScale.Y);
    MultiplyRect(LRect, ATarget.Scale, ATarget.Scale);
    Result := TSize.Create(Round(LRect.Width), Round(LRect.Height));
    if (Result.Width <= 0) or (Result.Height <= 0) then
      Result := TSize.Create(0, 0);
  end;

var
  LBitmapSize: TSize;
begin
  ACacheCanvas := nil;
  if (FBitmap <> nil) and (FBitmap.Canvas.BeginSceneCount > 0) then
    Exit(False);
  LBitmapSize := CalcBitmapSize;
  if FNeedUpdate or (FBitmap = nil) or (LBitmapSize <> FBitmap.Size) then
  begin
    if LBitmapSize.IsZero then
    begin
      FreeAndNil(FBitmap);
      Exit(False);
    end;
    if FBitmap = nil then
      FBitmap := TBitmap.Create(LBitmapSize.Width, LBitmapSize.Height)
    else
      FBitmap.SetSize(LBitmapSize.Width, LBitmapSize.Height);
    FBitmap.BitmapScale := ATarget.Scale;
    FSavedDestRect := ADestRect;
    FSavedHighSpeed := AHighSpeed;
    FSavedOpacity := AOpacity;
    FSavedTarget := ATarget;
    FNeedUpdate := False;
    Result := FBitmap.Canvas.BeginScene;
    if Result then
    begin
      ACacheCanvas := FBitmap.Canvas;
      ACacheCanvas.Clear(TAlphaColors.Null);
    end;
  end
  else
  begin
    ATarget.DrawBitmap(FBitmap, FBitmap.BoundsF, ADestRect, AOpacity, AHighSpeed);
    Result := False;
  end;
end;

destructor TBitmapCacheLayer.Destroy;
begin
  FreeAndNil(FBitmap);
  inherited;
end;

procedure TBitmapCacheLayer.EndUpdate(const AGeneratedBitmap: TProc<TBitmap>);
begin
  FBitmap.Canvas.EndScene;
  if Assigned(AGeneratedBitmap) then
    AGeneratedBitmap(FBitmap);
  FSavedTarget.DrawBitmap(FBitmap, FBitmap.BoundsF, FSavedDestRect, FSavedOpacity, FSavedHighSpeed);
  FSavedTarget := nil;
end;

procedure TBitmapCacheLayer.SetNeedUpdate;
begin
  FNeedUpdate := True;
end;

{ TFilterValueRec }

constructor TFilterValueRec.Create(const AName, ADesc: string; AType: TFilterValueType; const ADefault, AMin, AMax: TValue);
begin
  Name := AName;
  Desc := ADesc;
  ValueType := AType;
  Default := ADefault;
  Value := Default;
  Min := AMin;
  Max := AMax;
end;

constructor TFilterValueRec.Create(const AName, ADesc: string; ADefault: TAlphaColor);
begin
  Name := AName;
  Desc := ADesc;
  ValueType := TFilterValueType.Color;
  Default := TValue.From<TAlphaColor>(ADefault);
  Value := Default;
  Min := TValue.Empty;
  Max := TValue.Empty;
end;

constructor TFilterValueRec.Create(const AName, ADesc: string; ADefault, AMin, AMax: Single);
begin
  Name := AName;
  Desc := ADesc;
  ValueType := TFilterValueType.Float;
  Default := ADefault;
  Value := Default;
  Min := AMin;
  Max := AMax;
end;

constructor TFilterValueRec.Create(const AName, ADesc: string; const ADefault, AMin, AMax: TPointF);
begin
  Name := AName;
  Desc := ADesc;
  ValueType := TFilterValueType.Point;
  Default := TValue.From<TPointF>(ADefault);
  Value := Default;
  Min := TValue.From<TPointF>(AMin);
  Max := TValue.From<TPointF>(AMax);
end;

constructor TFilterValueRec.Create(const AName, ADesc: string; AType: TFilterValueType);
begin
  Name := AName;
  Desc := ADesc;
  ValueType := AType;
  Default := TValue.Empty;
  Value := Default;
  Min := TValue.Empty;
  Max := TValue.Empty;
end;

{ TFilterRec }

constructor TFilterRec.Create(const AName, ADesc: string; const AValues: TFilterValueRecArray);
begin
  Name := AName;
  Desc := ADesc;
  Values := Copy(AValues);
end;

{ TFilterManager }

class procedure TFilterManager.FillCategory(AList: TStrings);
begin
  AList.Clear;
  if FFilterCategoryList = nil then
    Exit;
  for var LCategory in FFilterCategoryList.Values do
    if AList.IndexOf(LCategory) < 0 then
      AList.Add(LCategory);
end;

class procedure TFilterManager.FillFiltersInCategory(const ACategory: string;
  AList: TStrings);
begin
  AList.Clear;
  if FFilterCategoryList = nil then
    Exit;
  for var LPair in FFilterCategoryList do
    if LPair.Value = ACategory then
      AList.Add(LPair.Key.FilterAttr.Name);
end;

class function TFilterManager.FilterByName(const AName: string): TFilter;
var
  LFilterClass: TFilterClass;
begin
  if (FFilterList <> nil) and FFilterList.TryGetValue(AName.ToLower, LFilterClass) then
    Result := LFilterClass.Create
  else
    Result := nil;
end;

class function TFilterManager.FilterClassByName(
  const AName: string): TFilterClass;
begin
  if FFilterList = nil then
    Result := nil
  else
    FFilterList.TryGetValue(AName.ToLower, Result);
end;

class function TFilterManager.FilterContext: TFilterContext;
begin
  Result := TFilter.FProcessingFilter.FilterContext;
end;

class function TFilterManager.FilterTexture: TTexture;
begin
  Result := TFilter.FProcessingFilter.ValuesAsTexture['Output'];
end;

class function TFilterManager.GetBestFilterContext(
  AVertexShader: TContextShader; const AShaders: array of TContextShader;
  AShadersCount: Integer; AInputCanvasClass, AOutputCanvasClass: TCanvasClass;
  AInputValue, AOutputValue: TFilterImageType): TFilterContextClass;
var
  LCanvasClass: TCanvasClass;
begin
  case AOutputValue of
    TFilterImageType.Bitmap: LCanvasClass := AOutputCanvasClass;
    TFilterImageType.Texture: Exit(FDefaultFilterContextClass);
  else
    if AInputValue = TFilterImageType.Bitmap then
      LCanvasClass := AInputCanvasClass
    else
      Exit(FDefaultFilterContextClass);
  end;
  if (FFilterContextDic = nil) or not FFilterContextDic.TryGetValue(LCanvasClass, Result) or
    not Result.SupportsShaders(AVertexShader, AShaders, AShadersCount) then
  begin
    Result := FDefaultFilterContextClass;
  end;
end;

class procedure TFilterManager.RegisterFilter(const ACategory: string; AFilter: TFilterClass);
var
  LName: string;
begin
  if AFilter = nil then
    raise EFilterManagerException.CreateRes(@SArgumentNil);
  LName := AFilter.FilterAttr.Name;
  if FFilterList = nil then
  begin
    FFilterList := TFilterClassDict.Create;
    FFilterCategoryList := TFilterCategoryDict.Create;
    if FDefaultFilterContextClass = nil then
      FDefaultFilterContextClass := TFilterContext3D;
  end
  else if FFilterList.ContainsKey(LName.ToLower) then
    raise EFilterManagerException.CreateResFmt(@SFilterAlreadyExists, [LName]);
  FFilterList.Add(LName.ToLower, AFilter);
  FFilterCategoryList.Add(AFilter, ACategory);
end;

class procedure TFilterManager.RegisterFilterContextForCanvas(
  const AContextClass: TFilterContextClass; const ACanvasClass: TCanvasClass);
begin
  if AContextClass = nil then
    raise EFilterManagerException.CreateRes(@SArgumentNil);
  if ACanvasClass = nil then
  begin
    if FDefaultFilterContextClass <> AContextClass then
    begin
      if FDefaultFilterContextClass <> nil then
        FDefaultFilterContextClass.UnInitialize;
      FDefaultFilterContextClass := AContextClass;
    end;
  end
  else
  begin
    if FFilterContextDic = nil then
      FFilterContextDic := TFilterContextClassDict.Create;
    var LCurrentContextClass: TFilterContextClass;
    FFilterContextDic.TryGetValue(ACanvasClass, LCurrentContextClass);
    if LCurrentContextClass <> AContextClass then
    begin
      if LCurrentContextClass <> nil then
        LCurrentContextClass.UnInitialize;
      FFilterContextDic.AddOrSetValue(ACanvasClass, AContextClass);
    end;
  end;
end;

class procedure TFilterManager.UnInitialize;
begin
  if FDefaultFilterContextClass <> nil then
    FDefaultFilterContextClass.UnInitialize;
  if FFilterContextDic <> nil then
  begin
    for var LFilterContext in FFilterContextDic.Values do
      LFilterContext.UnInitialize;
    FreeAndNil(FFilterContextDic);
  end;
  FreeAndNil(FFilterList);
  FreeAndNil(FFilterCategoryList);
end;

class procedure TFilterManager.UnregisterFilter(AFilter: TFilterClass);
begin
  if FFilterList <> nil then
    FFilterList.Remove(AFilter.FilterAttr.Name.ToLower);
  if FFilterCategoryList <> nil then
    FFilterCategoryList.Remove(AFilter);
end;

{ TFilter }

procedure TFilter.AddChangeNotifier(const ATargetFilter: TFilter);
begin
  FNotifierList.Add(ATargetFilter);
end;

procedure TFilter.Apply;
begin
  if FFilterContext = nil then
    SetFilterContextClass(GetBestFilterContext(TFilterImageType.Undefined, nil))
  else if FInputFilter <> nil then
    FInputFilter.SetFilterContextClass(TFilterContextClass(FFilterContext.ClassType));
  if FModified then
  begin
    if FInputFilter <> nil then
      FInputFilter.ApplyWithoutCopyToOutput;
    FProcessingFilter := Self;
    FFilterContext.Apply(FPass, FAntiAliasing, FPassCount, FNeedInternalSecondTex);
    FModified := False;
  end;
end;

procedure TFilter.ApplyWithoutCopyToOutput;
begin
  if FFilterContext = nil then
    SetFilterContextClass(GetBestFilterContext(TFilterImageType.Undefined, nil));
  FFilterContext.NoCopyForOutput := True;
  try
    Apply;
  finally
    FFilterContext.NoCopyForOutput := False;
  end;
end;

function TFilter.BeginLayer(const ATarget: TCanvas; const ADestRect: TRectF;
  const AOpacity: Single; const AHighSpeed: Boolean;
  var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean;
begin
  if IsZero(ADestRect.Width, TEpsilon.Position) or IsZero(ADestRect.Height, TEpsilon.Position) then
    Exit(False);
  SetFilterContextClass(GetBestFilterContext(TFilterImageType.Bitmap, TCanvasClass(ATarget.ClassType)));
  Result := FFilterContext.BeginLayer(ATarget, ADestRect, AOpacity, AHighSpeed, ACacheLayer, ACacheCanvas);
  if Result then
    FCacheLayer := ACacheLayer;
end;

function TFilter.CalcOutputSize(const AInputSize: TSize): TSize;
begin
  var LSavedInputSize := FInputSize;
  var LSavedRecalcInputSize := FRecalcInputSize;
  var LSavedRecalcOutputSize := FRecalcOutputSize;
  try
    FInputSize := AInputSize;
    FRecalcInputSize := False;
    FRecalcOutputSize := True;
    Result := OutputSize;
  finally
    FInputSize := LSavedInputSize;
    FRecalcInputSize := LSavedRecalcInputSize;
    FRecalcOutputSize := LSavedRecalcOutputSize;
  end;
end;

procedure TFilter.CalcSize(var W, H: Integer);
var
  LInputSize: TSize;
begin
  LInputSize := InputSize;
  W := LInputSize.Width;
  H := LInputSize.Height;
end;

procedure TFilter.Changed;
begin
  FModified := True;
  FRecalcOutputSize := True;
  for var LFilter in FNotifierList do
    LFilter.InputChanged;
end;

constructor TFilter.Create;
begin
  inherited Create;
  FNotifierList := TList<TFilter>.Create;
  if FDefaultVertexShader = nil then
  begin
    FDefaultVertexShader := TShaderManager.RegisterShaderFromData('filter.fvs', TContextShaderKind.VertexShader, '', [

      {$REGION 'TContextShaderArch.DX9'}
      {$IF defined(MSWindows)}
      TContextShaderSource.Create(TContextShaderArch.DX9, [
        $00, $02, $FE, $FF, $FE, $FF, $1F, $00, $43, $54, $41, $42, $1C, $00, $00, $00, $53, $00, $00, $00, $00, $02, $FE, $FF, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $01, $00, $20, $4C, $00, $00, $00,
        $30, $00, $00, $00, $02, $00, $00, $00, $04, $00, $00, $00, $3C, $00, $00, $00, $00, $00, $00, $00, $4D, $56, $50, $4D, $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00,
        $01, $00, $00, $00, $00, $00, $00, $00, $76, $73, $5F, $32, $5F, $30, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $44, $33, $44, $58, $39, $20, $53, $68, $61, $64, $65,
        $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $00, $1F, $00, $00, $02, $00, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $00, $80, $01, $00, $0F, $90, $05, $00, $00, $03,
        $00, $00, $0F, $80, $00, $00, $55, $90, $01, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $0F, $80, $00, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80,
        $02, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80, $02, $00, $00, $03, $00, $00, $0F, $C0, $00, $00, $E4, $80, $03, $00, $E4, $A0, $01, $00, $00, $02, $00, $00, $03, $E0, $01, $00, $E4, $90,
        $FF, $FF, $00, $00], [
        TContextShaderVariable.Create('MVPMatrix', TContextShaderVariableKind.Matrix, 0, 4)]
      ),
      {$ENDIF}
      {$ENDREGION}

      {$REGION 'TContextShaderArch.DX11_level_9'}
      {$IF defined(MSWindows)}
      TContextShaderSource.Create(TContextShaderArch.DX11_level_9, [
        $44, $58, $42, $43, $F8, $1F, $8F, $3D, $4B, $A9, $C9, $45, $B4, $6C, $29, $4E, $9F, $CF, $27, $39, $01, $00, $00, $00, $04, $04, $00, $00, $06, $00, $00, $00, $38, $00, $00, $00, $08, $01, $00, $00,
        $0C, $02, $00, $00, $88, $02, $00, $00, $58, $03, $00, $00, $AC, $03, $00, $00, $41, $6F, $6E, $39, $C8, $00, $00, $00, $C8, $00, $00, $00, $00, $02, $FE, $FF, $94, $00, $00, $00, $34, $00, $00, $00,
        $01, $00, $24, $00, $00, $00, $30, $00, $00, $00, $30, $00, $00, $00, $24, $00, $01, $00, $30, $00, $00, $00, $00, $00, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $FE, $FF,
        $1F, $00, $00, $02, $05, $00, $00, $80, $00, $00, $0F, $90, $1F, $00, $00, $02, $05, $00, $01, $80, $01, $00, $0F, $90, $05, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $55, $90, $02, $00, $E4, $A0,
        $04, $00, $00, $04, $00, $00, $0F, $80, $01, $00, $E4, $A0, $00, $00, $00, $90, $00, $00, $E4, $80, $04, $00, $00, $04, $00, $00, $0F, $80, $03, $00, $E4, $A0, $00, $00, $AA, $90, $00, $00, $E4, $80,
        $02, $00, $00, $03, $00, $00, $0F, $80, $00, $00, $E4, $80, $04, $00, $E4, $A0, $04, $00, $00, $04, $00, $00, $03, $C0, $00, $00, $FF, $80, $00, $00, $E4, $A0, $00, $00, $E4, $80, $01, $00, $00, $02,
        $00, $00, $0C, $C0, $00, $00, $E4, $80, $01, $00, $00, $02, $00, $00, $03, $E0, $01, $00, $E4, $90, $FF, $FF, $00, $00, $53, $48, $44, $52, $FC, $00, $00, $00, $40, $00, $01, $00, $3F, $00, $00, $00,
        $59, $00, $00, $04, $46, $8E, $20, $00, $00, $00, $00, $00, $04, $00, $00, $00, $5F, $00, $00, $03, $72, $10, $10, $00, $00, $00, $00, $00, $5F, $00, $00, $03, $32, $10, $10, $00, $01, $00, $00, $00,
        $65, $00, $00, $03, $32, $20, $10, $00, $00, $00, $00, $00, $67, $00, $00, $04, $F2, $20, $10, $00, $01, $00, $00, $00, $01, $00, $00, $00, $68, $00, $00, $02, $01, $00, $00, $00, $36, $00, $00, $05,
        $32, $20, $10, $00, $00, $00, $00, $00, $46, $10, $10, $00, $01, $00, $00, $00, $38, $00, $00, $08, $F2, $00, $10, $00, $00, $00, $00, $00, $56, $15, $10, $00, $00, $00, $00, $00, $46, $8E, $20, $00,
        $00, $00, $00, $00, $01, $00, $00, $00, $32, $00, $00, $0A, $F2, $00, $10, $00, $00, $00, $00, $00, $46, $8E, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $10, $10, $00, $00, $00, $00, $00,
        $46, $0E, $10, $00, $00, $00, $00, $00, $32, $00, $00, $0A, $F2, $00, $10, $00, $00, $00, $00, $00, $46, $8E, $20, $00, $00, $00, $00, $00, $02, $00, $00, $00, $A6, $1A, $10, $00, $00, $00, $00, $00,
        $46, $0E, $10, $00, $00, $00, $00, $00, $00, $00, $00, $08, $F2, $20, $10, $00, $01, $00, $00, $00, $46, $0E, $10, $00, $00, $00, $00, $00, $46, $8E, $20, $00, $00, $00, $00, $00, $03, $00, $00, $00,
        $3E, $00, $00, $01, $53, $54, $41, $54, $74, $00, $00, $00, $06, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $04, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
        $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
        $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
        $00, $00, $00, $00, $00, $00, $00, $00, $52, $44, $45, $46, $C8, $00, $00, $00, $01, $00, $00, $00, $48, $00, $00, $00, $01, $00, $00, $00, $1C, $00, $00, $00, $00, $04, $FE, $FF, $00, $11, $00, $00,
        $94, $00, $00, $00, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $24, $47, $6C, $6F,
        $62, $61, $6C, $73, $00, $AB, $AB, $AB, $3C, $00, $00, $00, $01, $00, $00, $00, $60, $00, $00, $00, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $78, $00, $00, $00, $00, $00, $00, $00,
        $40, $00, $00, $00, $02, $00, $00, $00, $84, $00, $00, $00, $00, $00, $00, $00, $4D, $56, $50, $4D, $61, $74, $72, $69, $78, $00, $AB, $AB, $03, $00, $03, $00, $04, $00, $04, $00, $00, $00, $00, $00,
        $00, $00, $00, $00, $4D, $69, $63, $72, $6F, $73, $6F, $66, $74, $20, $28, $52, $29, $20, $48, $4C, $53, $4C, $20, $53, $68, $61, $64, $65, $72, $20, $43, $6F, $6D, $70, $69, $6C, $65, $72, $20, $39,
        $2E, $32, $36, $2E, $39, $35, $32, $2E, $32, $38, $34, $34, $00, $AB, $AB, $AB, $49, $53, $47, $4E, $4C, $00, $00, $00, $02, $00, $00, $00, $08, $00, $00, $00, $38, $00, $00, $00, $00, $00, $00, $00,
        $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $07, $07, $00, $00, $41, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $01, $00, $00, $00, $03, $03, $00, $00,
        $50, $4F, $53, $49, $54, $49, $4F, $4E, $00, $54, $45, $58, $43, $4F, $4F, $52, $44, $00, $AB, $AB, $4F, $53, $47, $4E, $50, $00, $00, $00, $02, $00, $00, $00, $08, $00, $00, $00, $38, $00, $00, $00,
        $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $03, $0C, $00, $00, $41, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $03, $00, $00, $00, $01, $00, $00, $00,
        $0F, $00, $00, $00, $54, $45, $58, $43, $4F, $4F, $52, $44, $00, $53, $56, $5F, $50, $6F, $73, $69, $74, $69, $6F, $6E, $00, $AB, $AB, $AB], [
        TContextShaderVariable.Create('MVPMatrix', TContextShaderVariableKind.Matrix, 0, 64)]
      ),
      {$ENDIF}
      {$ENDREGION}

      {$REGION 'TContextShaderArch.Metal'}
      {$IF defined(MACOS)}
      TContextShaderSource.Create(
        TContextShaderArch.Metal,
        TEncoding.UTF8.GetBytes(
          'using namespace metal;'+

          'struct Vertex {'+
            '<#VertexDeclaration#>'+
          '};'+

          'struct ProjectedVertex {'+
            'float4 position [[position]];'+
            'float2 textureCoord;'+
            'float pointSize [[point_size]];'+
          '};'+

          'vertex ProjectedVertex vertexShader(constant Vertex *vertexArray [[buffer(0)]],'+
                                              'const unsigned int vertexId [[vertex_id]],'+
                                              'constant float4x4 &MVPMatrix [[buffer(1)]]){'+
            'Vertex in = vertexArray[vertexId];'+
            'ProjectedVertex out;'+
            'out.position = float4(in.position[0], in.position[1], in.position[2], 1) * MVPMatrix;'+
            'out.textureCoord = in.texcoord0;'+
            'out.pointSize = 1.0f;'+
            'return out;'+
          '}'
        ),
        [TContextShaderVariable.Create('MVPMatrix', TContextShaderVariableKind.Matrix, 1, 4)]
      ),
      {$ENDIF}
      {$ENDREGION}

      {$REGION 'TContextShaderArch.GLSL'}
      TContextShaderSource.Create(TContextShaderArch.GLSL, [
        $61, $74, $74, $72, $69, $62, $75, $74, $65, $20, $76, $65, $63, $32, $20, $61, $5F, $54, $65, $78, $43, $6F, $6F, $72, $64, $30, $3B, $0D, $0A, $61, $74, $74, $72, $69, $62, $75, $74, $65, $20, $76,
        $65, $63, $33, $20, $61, $5F, $50, $6F, $73, $69, $74, $69, $6F, $6E, $3B, $0D, $0A, $76, $61, $72, $79, $69, $6E, $67, $20, $76, $65, $63, $34, $20, $54, $45, $58, $30, $3B, $0D, $0A, $76, $65, $63,
        $34, $20, $5F, $6F, $5F, $70, $6F, $73, $31, $3B, $0D, $0A, $76, $65, $63, $32, $20, $5F, $6F, $5F, $74, $65, $78, $63, $6F, $6F, $72, $64, $30, $31, $3B, $0D, $0A, $76, $65, $63, $34, $20, $5F, $72,
        $30, $30, $30, $33, $3B, $0D, $0A, $76, $65, $63, $34, $20, $5F, $76, $30, $30, $30, $33, $3B, $0D, $0A, $75, $6E, $69, $66, $6F, $72, $6D, $20, $76, $65, $63, $34, $20, $5F, $4D, $56, $50, $4D, $61,
        $74, $72, $69, $78, $5B, $34, $5D, $3B, $0D, $0A, $76, $6F, $69, $64, $20, $6D, $61, $69, $6E, $28, $29, $0D, $0A, $7B, $0D, $0A, $20, $20, $20, $20, $5F, $76, $30, $30, $30, $33, $20, $3D, $20, $76,
        $65, $63, $34, $28, $61, $5F, $50, $6F, $73, $69, $74, $69, $6F, $6E, $2E, $78, $2C, $20, $61, $5F, $50, $6F, $73, $69, $74, $69, $6F, $6E, $2E, $79, $2C, $20, $61, $5F, $50, $6F, $73, $69, $74, $69,
        $6F, $6E, $2E, $7A, $2C, $20, $31, $2E, $30, $29, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $72, $30, $30, $30, $33, $2E, $78, $20, $3D, $20, $64, $6F, $74, $28, $5F, $4D, $56, $50, $4D, $61, $74, $72,
        $69, $78, $5B, $30, $5D, $2C, $20, $5F, $76, $30, $30, $30, $33, $29, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $72, $30, $30, $30, $33, $2E, $79, $20, $3D, $20, $64, $6F, $74, $28, $5F, $4D, $56, $50,
        $4D, $61, $74, $72, $69, $78, $5B, $31, $5D, $2C, $20, $5F, $76, $30, $30, $30, $33, $29, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $72, $30, $30, $30, $33, $2E, $7A, $20, $3D, $20, $64, $6F, $74, $28,
        $5F, $4D, $56, $50, $4D, $61, $74, $72, $69, $78, $5B, $32, $5D, $2C, $20, $5F, $76, $30, $30, $30, $33, $29, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $72, $30, $30, $30, $33, $2E, $77, $20, $3D, $20,
        $64, $6F, $74, $28, $5F, $4D, $56, $50, $4D, $61, $74, $72, $69, $78, $5B, $33, $5D, $2C, $20, $5F, $76, $30, $30, $30, $33, $29, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $6F, $5F, $70, $6F, $73, $31,
        $20, $3D, $20, $5F, $72, $30, $30, $30, $33, $3B, $0D, $0A, $20, $20, $20, $20, $5F, $6F, $5F, $74, $65, $78, $63, $6F, $6F, $72, $64, $30, $31, $20, $3D, $20, $61, $5F, $54, $65, $78, $43, $6F, $6F,
        $72, $64, $30, $2E, $78, $79, $3B, $0D, $0A, $20, $20, $20, $20, $54, $45, $58, $30, $2E, $78, $79, $20, $3D, $20, $61, $5F, $54, $65, $78, $43, $6F, $6F, $72, $64, $30, $2E, $78, $79, $3B, $0D, $0A,
        $20, $20, $20, $20, $67, $6C, $5F, $50, $6F, $73, $69, $74, $69, $6F, $6E, $20, $3D, $20, $5F, $72, $30, $30, $30, $33, $3B, $0D, $0A, $7D, $20, $0D, $0A], [
        TContextShaderVariable.Create('MVPMatrix', TContextShaderVariableKind.Matrix, 0, 4)]
      )
      {$ENDREGION}

    ]);
  end;
  FVertexShader := FDefaultVertexShader;
  FValues := FilterAttr.Values;
  SetLength(FValues, Length(FValues) + 2);
  FValues[High(FValues) - 1] := TFilterValueRec.Create('Input', '', TFilterValueType.Bitmap);
  FValues[High(FValues)] := TFilterValueRec.Create('Output', '', TFilterValueType.Bitmap);
  SetLength(FShaders, 10);
  FPassCount := 1;
  FRootInputFilter := Self;
end;

destructor TFilter.Destroy;
begin
  FFilterContext.Free;
  if FInputFilter <> nil then
    FInputFilter.RemoveChangeNotifier(Self);
  for var LFilter in FNotifierList do
    LFilter.FilterDestroying(Self);
  FNotifierList.Free;
  inherited;
end;

procedure TFilter.EndLayer;
begin
  FFilterContext.EndLayer(FCacheLayer);
  FCacheLayer := nil;
end;

class function TFilter.FilterAttr: TFilterRec;
begin
  Result := Default(TFilterRec);
end;

class function TFilter.FilterAttrForClass(C: TFilterClass): TFilterRec;
begin
  Result := C.FilterAttr;
end;

procedure TFilter.FilterDestroying(const AFilter: TFilter);
begin
  FInputFilter := nil;
  FRootInputFilter := Self;
  InputChanged;
end;

function TFilter.GetBestFilterContext(const AOutputType: TFilterImageType;
  const AOutputCanvasClass: TCanvasClass): TFilterContextClass;
var
  LImageObject: TObject;
  LInputCanvasClass: TCanvasClass;
  LInputType: TFilterImageType;
begin
  LImageObject := FindValue(FRootInputFilter.FValues, 'Input', True).Value.AsObject;
  if LImageObject is TBitmap then
  begin
    LInputType := TFilterImageType.Bitmap;
    LInputCanvasClass := TBitmap(LImageObject).CanvasClass;
  end
  else
  begin
    LInputCanvasClass := nil;
    if LImageObject is TTexture then
      LInputType := TFilterImageType.Texture
    else
      LInputType := TFilterImageType.Undefined;
  end;
  Result := TFilterManager.GetBestFilterContext(FVertexShader, FShaders, Min(FPassCount, Length(FShaders)),
    LInputCanvasClass, AOutputCanvasClass, LInputType, AOutputType);
end;

function TFilter.GetFilterValue(const AName: string): TValue;
var
  LValue: PFilterValueRec;
begin
  LValue := FindValue(FValues, AName);
  if LValue = nil then
    Exit(TValue.Empty);
  if LValue.ValueType = TFilterValueType.Bitmap then
    Result := TValue.Empty
  else
    Result := LValue.Value;
end;

function TFilter.GetFilterValuesAsBitmap(const AName: string): TBitmap;
begin
  if SameText(AName, 'Output') then
  begin
    SetFilterContextClass(GetBestFilterContext(TFilterImageType.Bitmap, TCanvasManager.DefaultCanvas));
    FFilterContext.EnableBitmapOutput;
    if FModified then
      Apply;
    Result := FFilterContext.OutputAsBitmap;
  end
  else
    Result := nil;
end;

function TFilter.GetFilterValuesAsColor(const AName: string): TAlphaColor;
begin
  Result := Values[AName].AsType<TAlphaColor>;
end;

function TFilter.GetFilterValuesAsFloat(const AName: string): Single;
begin
  Result := Values[AName].AsType<Single>;
end;

function TFilter.GetFilterValuesAsPoint(const AName: string): TPointF;
begin
  Result := Values[AName].AsType<TPointF>;
end;

function TFilter.GetFilterValuesAsTexture(const AName: string): TTexture;
begin
  if SameText(AName, 'Output') then
  begin
    SetFilterContextClass(GetBestFilterContext(TFilterImageType.Texture, nil));
    if FModified then
      Apply;
    Result := FFilterContext.OutputAsTexture;
  end
  else
    Result := nil;
end;

function TFilter.GetInputSize: TSize;
begin
  if FRecalcInputSize then
  begin
    if FInputFilter <> nil then
      FInputSize := FInputFilter.OutputSize
    else if not FInputLayerSize.IsZero then
      FInputSize := FInputLayerSize
    else
    begin
      var LImageObject := FindValue(FValues, 'Input', True).Value.AsObject;
      if LImageObject is TBitmap then
        FInputSize := TBitmap(LImageObject).Size
      else if LImageObject is TTexture then
        FInputSize := TSize.Create(TTexture(LImageObject).Width, TTexture(LImageObject).Height)
      else
        FInputSize := TSize.Create(0, 0);
    end;
    if (FInputSize.Width <= 0) or (FInputSize.Height <= 0) then
      FInputSize := TSize.Create(0, 0);
    FRecalcInputSize := False;
  end;
  Result := FInputSize;
end;

function TFilter.GetOutputSize: TSize;
begin
  if FRecalcOutputSize then
  begin
    FOutputSize := InputSize;
    CalcSize(FOutputSize.cx, FOutputSize.cy);
    if (FOutputSize.Width <= 0) or (FOutputSize.Height <= 0) then
      FOutputSize := TSize.Create(0, 0);
    FRecalcOutputSize := False;
  end;
  Result := FOutputSize;
end;

procedure TFilter.InputChanged;
begin
  FRecalcInputSize := True;
  Changed;
  if FFilterContext <> nil then
  begin
    FRootInputFilter := Self;
    while FRootInputFilter.InputFilter <> nil do
      FRootInputFilter := FRootInputFilter.InputFilter;
    FFilterContext.Changed(FindValue(FValues, 'Input', True)^);
  end;
end;

procedure TFilter.LoadShaders;
begin
  if FShaders[FPass] <> nil then
  begin
    // Shaders
    FilterContext.SetShaders(FVertexShader, FShaders[FPass]);
    // Params
    for var I := 0 to High(FValues) do
    begin
      case FValues[I].ValueType of
        TFilterValueType.Bitmap: ;
        TFilterValueType.Float:
          begin
            FilterContext.SetShaderVariable(FValues[I].Name, [Vector3D(FValues[I].Value.AsType<Single>,
              FValues[I].Value.AsType<Single>, FValues[I].Value.AsType<Single>, FValues[I].Value.AsType<Single>)]);
          end;
        TFilterValueType.Point:
          begin
            var LInputSize := InputSize;
            if (LInputSize.Width > 0) and (LInputSize.Height > 0) then
            begin
              if TContextStyle.RenderTargetFlipped in FilterContext.Style then
                FilterContext.SetShaderVariable(FValues[I].Name, [Vector3D(FValues[I].Value.AsType<TPointF>.X / LInputSize.Width,
                  (LInputSize.Height - FValues[I].Value.AsType<TPointF>.Y) / LInputSize.Height, 0, 0)])
              else
                FilterContext.SetShaderVariable(FValues[I].Name, [Vector3D(FValues[I].Value.AsType<TPointF>.X / LInputSize.Width,
                  FValues[I].Value.AsType<TPointF>.Y / LInputSize.Height, 0, 0)]);
            end;
          end;
        TFilterValueType.Color:
          begin
            var C := TAlphaColorRec(FValues[I].Value.AsType<TAlphaColor>());
            FilterContext.SetShaderVariable(FValues[I].Name, [Vector3D(C.R / $FF, C.G / $FF, C.B / $FF, C.A / $FF)]);
          end;
      end;
    end;
  end;
end;

procedure TFilter.LoadTextures;
begin
end;

procedure TFilter.RemoveChangeNotifier(const ATargetFilter: TFilter);
begin
  FNotifierList.Remove(ATargetFilter);
end;

procedure TFilter.SetFilterContextClass(
  const AContextClass: TFilterContextClass);
begin
  if not FKeepCurrentContext then
  begin
    if (FFilterContext = nil) or (FFilterContext.ClassType <> AContextClass) then
    begin
      FreeAndNil(FFilterContext);
      if AContextClass <> nil then
      begin
        FModified := True;
        FFilterContext := AContextClass.Create(Self, FValues);
        for var I := 0 to High(FValues) do
          if (FValues[I].Name <> 'Output') and (FValues[I].Name <> 'Second') then
            FFilterContext.Changed(FValues[I]);
      end;
    end;
    if FInputFilter <> nil then
      FInputFilter.SetFilterContextClass(AContextClass);
  end;
end;

procedure TFilter.SetFilterValue(const AName: string; const AValue: TValue);
var
  LValue: PFilterValueRec;
begin
  LValue := FindValue(FValues, AName);
  if LValue = nil then
    Exit;
  case LValue.ValueType of
    TFilterValueType.Color:
      begin
        if AValue.TypeInfo <> TypeInfo(TAlphaColor) then
          raise EFilterException.CreateResFmt(@SInvalidPropertyType, [AName]);
        LValue.Value := AValue;
      end;
    TFilterValueType.Float:
      begin
        if AValue.TypeInfo <> TypeInfo(Single) then
          raise EFilterException.CreateResFmt(@SInvalidPropertyType, [AName]);
        LValue.Value := EnsureRange(AValue.AsType<Single>, LValue.Min.AsType<Single>, LValue.Max.AsType<Single>);
      end;
    TFilterValueType.Point:
      begin
        if AValue.TypeInfo <> TypeInfo(TPointF) then
          raise EFilterException.CreateResFmt(@SInvalidPropertyType, [AName]);
        var LPoint := AValue.AsType<TPointF>;
        var LMin := LValue.Min.AsType<TPointF>;
        var LMax := LValue.Max.AsType<TPointF>;
        LValue.Value := TValue.From<TPointF>(PointF(EnsureRange(LPoint.X, LMin.X, LMax.X), EnsureRange(LPoint.Y, LMin.Y, LMax.Y)));
      end;
    TFilterValueType.Bitmap:
      begin
        if LValue.Name = 'Input' then
        begin
          FRecalcInputSize := True;
          FInputLayerSize := TSize.Create(0, 0);
          InputFilter := nil;
        end
        else if (LValue.Name = 'Output') or SameText(AName, 'Second') then
          Exit;
        if (AValue.AsObject is TBitmap) or (AValue.AsObject is TTexture) then
          LValue.Value := AValue
        else if AValue.IsEmpty then
          LValue.Value := LValue.Default
        else
          raise EFilterException.CreateResFmt(@SInvalidPropertyType, [AName]);
      end;
  else
    LValue.Value := AValue;
  end;
  Changed;
  if FFilterContext <> nil then
    FFilterContext.Changed(LValue^);
end;

procedure TFilter.SetFilterValuesAsBitmap(const AName: string;
  const AValue: TBitmap);
begin
  Values[AName] := TValue.From<TBitmap>(AValue);
end;

procedure TFilter.SetFilterValuesAsColor(const AName: string;
  const AValue: TAlphaColor);
begin
  Values[AName] := TValue.From<TAlphaColor>(AValue);
end;

procedure TFilter.SetFilterValuesAsFloat(const AName: string;
  const AValue: Single);
begin
  Values[AName] := TValue.From<Single>(AValue);
end;

procedure TFilter.SetFilterValuesAsPoint(const AName: string;
  const AValue: TPointF);
begin
  Values[AName] := TValue.From<TPointF>(AValue);
end;

procedure TFilter.SetFilterValuesAsTexture(const AName: string;
  const AValue: TTexture);
begin
  Values[AName] := TValue.From<TTexture>(AValue);
end;

procedure TFilter.SetInputAsFilter(const AValue: TFilter);
begin
  if FInputFilter <> AValue then
  begin
    if FInputFilter <> nil then
      FInputFilter.RemoveChangeNotifier(Self);
    FInputFilter := AValue;
    if FInputFilter <> nil then
    begin
      FInputFilter.AddChangeNotifier(Self);
      if FFilterContext <> nil then
        FInputFilter.SetFilterContextClass(TFilterContextClass(FFilterContext.ClassType));
    end;
    FRootInputFilter := Self;
    while FRootInputFilter.InputFilter <> nil do
      FRootInputFilter := FRootInputFilter.InputFilter;
    FInputLayerSize := TSize.Create(0, 0);
    FindValue(FValues, 'Input', True).Value := TValue.Empty;
    InputChanged;
  end;
end;

procedure TFilter.SetInputLayerSize(const AValue: TSize);
begin
  if FInputLayerSize <> AValue then
  begin
    FInputLayerSize := AValue;
    InputChanged;
  end;
end;

{ TFilterContext }

function TFilterContext.BeginLayer(const ATarget: TCanvas;
  const ADestRect: TRectF; const AOpacity: Single; const AHighSpeed: Boolean;
  var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean;
var
  LBitmapCacheLayer: IBitmapCacheLayer;
begin
  if not Supports(ACacheLayer, IBitmapCacheLayer, LBitmapCacheLayer) then
  begin
    LBitmapCacheLayer := TBitmapCacheLayer.Create;
    ACacheLayer := LBitmapCacheLayer;
  end;
  Result := LBitmapCacheLayer.BeginUpdate(ATarget, ADestRect, AOpacity, AHighSpeed, ACacheCanvas);
end;

constructor TFilterContext.Create(const AFilter: TFilter;
  const AValue: TFilterValueRecArray);
begin
  inherited Create;
  FFilter := AFilter;
end;

procedure TFilterContext.EnableBitmapOutput;
begin
end;

procedure TFilterContext.EndLayer(const ACacheLayer: IFilterCacheLayer);
var
  LBitmapCacheLayer: IBitmapCacheLayer;
begin
  if Supports(ACacheLayer, IBitmapCacheLayer, LBitmapCacheLayer) then
    LBitmapCacheLayer.EndUpdate(
      procedure(ABitmap: TBitmap)
      begin
        FFilter.KeepCurrentContext := True;
        try
          FFilter.ValuesAsBitmap['Input'] := ABitmap;
          FFilter.ApplyWithoutCopyToOutput;
          CopyToBitmap(ABitmap, ABitmap.Bounds);
          FFilter.ValuesAsBitmap['Input'] := nil;
        finally
          FFilter.KeepCurrentContext := False;
        end;
      end);
end;

procedure TFilterContext.LoadShaders;
begin
  FFilter.LoadShaders;
end;

procedure TFilterContext.LoadTextures;
begin
  FFilter.LoadTextures;
end;

procedure TFilterContext.SetRootInputLayerSize(const ASize: TSize);
begin
  FFilter.RootInputFilter.SetInputLayerSize(ASize);
end;

class function TFilterContext.Style: TContextStyles;
begin
  Result := [];
end;

class function TFilterContext.SupportsShaders(AVertexShader: TContextShader;
  const AShaders: array of TContextShader; AShadersCount: Integer): Boolean;
begin
  Result := True;
end;

{ TFilterMaterial }

type
  TFilterMaterial = class(TMaterial)
  private
    FFilterContext: TFilterContext;
    procedure SetFilterContext(const Value: TFilterContext);
  protected
    procedure DoApply(const Context: TContext3D); override;
    procedure DoInitialize; override;
    class function DoGetMaterialProperty(const Prop: TMaterial.TProperty): string; override;
  public
    property FilterContext: TFilterContext write SetFilterContext;
  end;

{ TFilterMaterial }

class function TFilterMaterial.DoGetMaterialProperty(const Prop: TMaterial.TProperty): string;
begin
  case Prop of
    TProperty.ModelViewProjection: Result := 'MVPMatrix';
  else
    Result := '';
  end;
end;

procedure TFilterMaterial.DoInitialize;
begin
end;

procedure TFilterMaterial.DoApply(const Context: TContext3D);
begin
  // Shaders
  FFilterContext.LoadShaders;
  // Textures
  FFilterContext.LoadTextures;
end;

procedure TFilterMaterial.SetFilterContext(const Value: TFilterContext);
begin
  FFilterContext := Value;
end;

{ TFilterContext3D }

procedure TFilterContext3D.Apply(var APass: Integer; const AAntiAliasing: Boolean;
  APassCount: Integer; const ASecondImageResourceName: string);
begin
  if not FModified then
    Exit;
  FAntiAliasing := AAntiAliasing;
  FPassCount := APassCount;
  FNeedInternalSecondTex := ASecondImageResourceName;
  FProcessing := True;
  try
    var LInputSize := Filter.InputSize;
    var LOutputSize := Filter.OutputSize;
    if LOutputSize.IsZero then
      Exit;
    // Correct size
    if ContextCount < FPassCount then
    begin
      ContextCount := FPassCount;
      ResizeContext(LOutputSize.Width, LOutputSize.Height);
    end;
    if (FilterContext3D = nil) or ((LOutputSize.Width > FilterTexture.Width) or (LOutputSize.Height > FilterTexture.Height)) then
      ResizeContext(LOutputSize.Width, LOutputSize.Height);
    // Prepare textures
    if Filter.InputFilter = nil then
    begin
      if FAntiAliasing then
      begin
        if FInputBitmap <> nil then
        begin
          if FInputRT = nil then
          begin
            FInputRT := TTexture.Create;
            FInputRT.Style := [TTextureStyle.RenderTarget];
            FInputRT.SetSize(FInput.Width + 2, FInput.Height + 2);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          if (FInputRT.Width <> FInputBitmap.Width + 2) or (FInputRT.Height <> FInputBitmap.Height + 2) then
          begin
            FreeAndNil(FInputRTContext);
            FInputRT.SetSize(FInputBitmap.Width + 2, FInputBitmap.Height + 2);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          RenderTextureToContext(FInputRTContext, InputTexture, TRect.Create(0, 0, FInput.Width, FInput.Height),
            TPoint.Create(1, 1));
        end
        else
        begin
          if FInputRT = nil then
          begin
            FInputRT := TTexture.Create;
            FInputRT.Style := [TTextureStyle.RenderTarget];
            FInputRT.SetSize(FInput.Width + 2, FInput.Height + 2);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          if (FInputRT.Width <> FInput.Width + 2) or (FInputRT.Height <> FInput.Height + 2) then
          begin
            FreeAndNil(FInputRTContext);
            FInputRT.SetSize(FInput.Width + 2, FInput.Height + 2);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          RenderTextureToContext(FInputRTContext, InputTexture, TRect.Create(0, 0, FInput.Width, FInput.Height),
            TPoint.Create(1, 1));
        end;
      end else begin
        if not (TTextureStyle.RenderTarget in FInput.Style) and (TContextStyle.RenderTargetFlipped in FilterContext3D.Style) then
        begin
          if FInputRT = nil then
          begin
            FInputRT := TTexture.Create;
            FInputRT.Style := [TTextureStyle.RenderTarget];
            FInputRT.SetSize(FInput.Width, FInput.Height);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          if (FInputRT.Width <> FInput.Width) or (FInputRT.Height <> FInput.Height) then
          begin
            FreeAndNil(FInputRTContext);
            FInputRT.SetSize(FInput.Width, FInput.Height);
            FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
          end;
          RenderTextureToContext(FInputRTContext, InputTexture, TRect.Create(0, 0, FInput.Width, FInput.Height),
            TPoint.Zero);
        end;
      end;
    end
    else if Assigned(FilterTexture) then
    begin
      if FInputRT = nil then
      begin
        FInputRT := TTexture.Create;
        FInputRT.Style := [TTextureStyle.RenderTarget];
        FInputRT.SetSize(LInputSize.Width, LInputSize.Height);
        FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
      end;
      if (FInputRT.Width <> LInputSize.Width) or (FInputRT.Height <> LInputSize.Height) then
      begin
        FreeAndNil(FInputRTContext);
        FInputRT.SetSize(LInputSize.Width, LInputSize.Height);
        FInputRTContext := TContextManager.CreateFromTexture(FInputRT, TMultisample.None, False);
      end;
      RenderTextureToContext(FInputRTContext, FilterTexture, TRect.Create(0, 0, LInputSize.Width, LInputSize.Height),
        TPoint.Zero);
    end;
    if (FTarget <> nil) and not FTarget.IsEmpty then
    begin
      if not (TTextureStyle.RenderTarget in FTarget.Style) and (TContextStyle.RenderTargetFlipped in FilterContext3D.Style) then
      begin
        if FTargetRT = nil then
        begin
          FTargetRT := TTexture.Create;
          FTargetRT.Style := [TTextureStyle.RenderTarget];
          FTargetRT.SetSize(FTarget.Width, FTarget.Height);
          FTargetRTContext := TContextManager.CreateFromTexture(FTargetRT, TMultisample.None, False);
        end;
        if (FTargetRT.Width <> FTarget.Width) or (FTargetRT.Height <> FTarget.Height) then
        begin
          FreeAndNil(FTargetRTContext);
          FTargetRT.SetSize(FTarget.Width, FTarget.Height);
          FTargetRTContext := TContextManager.CreateFromTexture(FTargetRT, TMultisample.None, False);
        end;
        RenderTextureToContext(FTargetRTContext, TargetTexture, TRect.Create(0, 0, FTarget.Width, FTarget.Height),
          TPoint.Zero);
      end;
    end;
    if FNeedInternalSecondTex <> '' then
      CreateNoise;
    // Process passes
    for var i := 0 to FPassCount - 1 do
    begin
      FPass := i;
      APass := i;
      if FPass > 0 then
      begin
        if FPassInputRT = nil then
        begin
          FPassInputRT := TTexture.Create;
          FPassInputRT.Style := [TTextureStyle.RenderTarget];
          FPassInputRT.SetSize(LOutputSize.Width, LOutputSize.Height);
          FPassInputRTContext := TContextManager.CreateFromTexture(FPassInputRT, TMultisample.None, False);
        end;
        if (FPassInputRT.Width <> LOutputSize.Width) or (FPassInputRT.Height <> LOutputSize.Height) then
        begin
          FreeAndNil(FPassInputRTContext);
          FPassInputRT.SetSize(LOutputSize.Width, LOutputSize.Height);
          FPassInputRTContext := TContextManager.CreateFromTexture(FPassInputRT, TMultisample.None, False);
        end;
        RenderTextureToContext(FPassInputRTContext, GetTexture(FPass - 1),
          TRect.Create(0, 0, FPassInputRT.Width, FPassInputRT.Height), TPoint.Zero);
      end;
      CurrentContext := FPass;
      if FilterContext3D.BeginScene then
      try
        FilterContext3D.SetMatrix(TMatrix3D.Identity);
        FilterContext3D.SetContextState(TContextState.cs2DScene);
        FilterContext3D.SetContextState(TContextState.csZWriteOff);
        FilterContext3D.SetContextState(TContextState.csZTestOff);
        FilterContext3D.SetContextState(TContextState.csAllFace);
        FilterContext3D.SetContextState(TContextState.csAlphaBlendOff);
        FilterContext3D.SetContextState(TContextState.csScissorOff);
        FilterContext3D.Clear(0);
        Render(LOutputSize.Width, LOutputSize.Height);
      finally
        FilterContext3D.EndScene;
      end;
      // Copy result to output texture
      if not NoCopyForOutput then
      begin
        if (FOutputBitmap <> nil) then
        begin
          FOutputBitmap.SetSize(LOutputSize.Width, LOutputSize.Height);
          FilterContext3D.CopyToBitmap(FOutputBitmap,
            TRect.Create(0, 0, FOutputBitmap.Width, FOutputBitmap.Height));
        end;
      end;
    end;
  finally
    if Filter.InputFilter <> nil then
      FInput := nil;
    FProcessing := False;
    FModified := False;
  end;
end;

procedure TFilterContext3D.Changed(const AValue: TFilterValueRec);
begin
  FModified := True;
  if AValue.ValueType = TFilterValueType.Bitmap then
    SetFilterValues(AValue.Name, AValue.Value);
end;

procedure TFilterContext3D.CopyToBitmap(const ADest: TBitmap;
  const ARect: TRect);
begin
  FilterContext3D.CopyToBitmap(ADest, ARect);
end;

constructor TFilterContext3D.Create(const AFilter: TFilter;
  const AValues: TFilterValueRecArray);
begin
  inherited;
  FValues := Copy(AValues);
  FModified := True;
end;

function TFilterContext3D.CreateFilterMaterial: TMaterial;
begin
  Result := TFilterMaterial.Create;
  TFilterMaterial(Result).FilterContext := Self;
end;

procedure TFilterContext3D.CreateNoise;
var
  S: TStream;
begin
  if FNeedInternalSecondTex = '' then Exit;
  if FNoise = nil then
  begin
    S := TResourceStream.Create(HInstance, FNeedInternalSecondTex, RT_RCDATA);
    try
      FNoise := TTexture.Create;
      FNoise.Style := [TTextureStyle.Dynamic];
      FNoise.LoadFromStream(S);
    finally
      S.Free;
    end;
  end;
end;

destructor TFilterContext3D.Destroy;
begin
  if (FInputBitmap <> nil) and not (TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle) then
    FreeAndNil(FInput);
  if (FTargetBitmap <> nil) and not (TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle) then
    FreeAndNil(FTarget);
  FreeAndNil(FPassInputRTContext);
  FreeAndNil(FPassInputRT);
  FreeAndNil(FInputRTContext);
  FreeAndNil(FInputRT);
  FreeAndNil(FTargetRTContext);
  FreeAndNil(FTargetRT);
  FreeAndNil(FOutputBitmap);
  for var LValue in FValues do
  begin
    if (LValue.ValueType = TFilterValueType.Bitmap) and (LValue.Bitmap <> nil) and
      not (TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle) then
    begin
      LValue.Value.AsObject.Free;
    end;
  end;
  inherited;
end;

procedure TFilterContext3D.EnableBitmapOutput;
begin
  // real copy to output bitmap
  if FOutputBitmap = nil then
    FOutputBitmap := TBitmap.Create(0, 0);
end;

class function TFilterContext3D.GetContextCount: Integer;
begin
  if Assigned(FContextList) then
    Result := FContextList.Count
  else
    Result := 0;
end;

class function TFilterContext3D.GetFilterContext3D: TContext3D;
begin
  if Assigned(FContextList) then
    Result := FContextList[FCurrentContext].Context
  else
    Result := nil;
end;

class function TFilterContext3D.GetFilterTexture: TTexture;
begin
  if Assigned(FContextList) then
    Result := FContextList[FCurrentContext].Texture
  else
    Result := nil;
end;

function TFilterContext3D.GetFilterValues(const Index: string): TValue;
var
  I: Integer;
begin
  for I := 0 to High(FValues) do
    if SameText(FValues[I].Name, Index) then
    begin
      if SameText(FValues[I].Name, 'Output') then
      begin
        if not FProcessing and FModified then
          Filter.Apply;
        Result := GetTexture(FPass);
        FValues[I].Value := Result;
        Exit;
      end;
      Result := FValues[I].Value;
      Exit;
    end;
  Result := TValue.Empty;
end;

class function TFilterContext3D.GetTexture(const Index: Integer): TTexture;
begin
  if Assigned(FContextList) and (Index < FContextList.Count) then
    Result := FContextList[Index].Texture
  else
    Result := nil;
end;

function TFilterContext3D.InputTexture: TTexture;
begin
  if TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle then
    Result := TContextManager.DefaultContextClass.BitmapToTexture(FInputBitmap)
  else
    Result := FInput;
end;

procedure TFilterContext3D.LoadTextures;
var
  I: Integer;
begin
  if FPass = 0 then
  begin
    if Filter.InputFilter = nil then
    begin
      if Assigned(FInputRT) then
        FilterContext3D.SetShaderVariable('Input', FInputRT)
      else
        FilterContext3D.SetShaderVariable('Input', InputTexture);
    end
    else
      FilterContext3D.SetShaderVariable('Input', FInputRT);
  end
  else
    FilterContext3D.SetShaderVariable('Input', FPassInputRT);
  if (FTarget <> nil) and not FTarget.IsEmpty then
  begin
    if Assigned(FTargetRT) then
      FilterContext3D.SetShaderVariable('Target', FTargetRT)
    else
      FilterContext3D.SetShaderVariable('Target', TargetTexture);
  end;
  if FNeedInternalSecondTex <> '' then
    FilterContext3D.SetShaderVariable('Second', FNoise);
  { load another }
  for I := 0 to High(FValues) do
  begin
    if (FValues[I].ValueType = TFilterValueType.Bitmap) then
    begin
      if SameText(FValues[I].Name, 'input') then Continue;
      if SameText(FValues[I].Name, 'output') then Continue;
      if SameText(FValues[I].Name, 'second') then Continue;
      if SameText(FValues[I].Name, 'target') then Continue;
    end;
    if (FValues[I].ValueType = TFilterValueType.Bitmap) and not FValues[I].Value.IsEmpty and (FValues[I].Value.IsObject)
      and (FValues[I].Value.AsObject is TTexture) then
    begin
      if TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle then
        FilterContext3D.SetShaderVariable(FValues[I].Name,
          TContextManager.DefaultContextClass.BitmapToTexture(FValues[I].Bitmap))
      else
        FilterContext3D.SetShaderVariable(FValues[I].Name, TTexture(FValues[I].Value.AsObject));
    end;
  end;
  inherited;
end;

function TFilterContext3D.OutputAsBitmap: TBitmap;
begin
  // real copy to output bitmap
  if FOutputBitmap = nil then
    FOutputBitmap := TBitmap.Create(0, 0);
  Values['Output']; // apply
  Result := FOutputBitmap;
end;

function TFilterContext3D.OutputAsTexture: TTexture;
var
  LValue: TValue;
begin
  LValue := Values['Output'];
  if not LValue.IsEmpty then
    Result := TTexture(LValue.AsObject)
  else
    Result := nil;
end;

procedure TFilterContext3D.Render(W, H: Integer);
var
  Ver: TVertexBuffer;
  Ind: TIndexBuffer;
  Mat: TMaterial;
  P: TPointF;
begin
  // Fill
  Ver := TVertexBuffer.Create([TVertexFormat.Vertex, TVertexFormat.TexCoord0], 4);
  P := FilterContext3D.PixelToPixelPolygonOffset;
  if FAntiAliasing then
  begin
    Ver.Vertices[0] := Point3D(-1 + P.X, -1 + P.Y, 0);
    Ver.Vertices[1] := Point3D(W + 1 + P.X, -1 + P.Y, 0);
    Ver.Vertices[2] := Point3D(W + 1 + P.X, H + 1 + P.Y, 0);
    Ver.Vertices[3] := Point3D(-1 + P.X, H + 1 + P.Y, 0);
  end
  else
  begin
    Ver.Vertices[0] := Point3D(0 + P.X, 0 + P.Y, 0);
    Ver.Vertices[1] := Point3D(W + P.X, 0 + P.Y, 0);
    Ver.Vertices[2] := Point3D(W + P.X, H + P.Y, 0);
    Ver.Vertices[3] := Point3D(0 + P.X, H + P.Y, 0);
  end;
  if TContextStyle.RenderTargetFlipped in FilterContext3D.Style then
  begin
    Ver.TexCoord0[0] := PointF(0.0, 1.0);
    Ver.TexCoord0[1] := PointF(1.0, 1.0);
    Ver.TexCoord0[2] := PointF(1.0, 0.0);
    Ver.TexCoord0[3] := PointF(0.0, 0.0);
  end else begin
    Ver.TexCoord0[0] := PointF(0.0, 0.0);
    Ver.TexCoord0[1] := PointF(1.0, 0.0);
    Ver.TexCoord0[2] := PointF(1.0, 1.0);
    Ver.TexCoord0[3] := PointF(0.0, 1.0);
  end;
  Ind := TIndexBuffer.Create(6);
  Ind[0] := 0;
  Ind[1] := 1;
  Ind[2] := 3;
  Ind[3] := 3;
  Ind[4] := 1;
  Ind[5] := 2;
  Mat := CreateFilterMaterial;
  FilterContext3D.DrawTriangles(Ver, Ind, Mat, 1);
  Mat.Free;
  Ind.Free;
  Ver.Free;
end;

procedure TFilterContext3D.RenderTextureToContext(const Context: TContext3D;
  const Texture: TTexture; const ARect: TRect; const DstPos: TPoint);
var
  Ver: TVertexBuffer;
  Ind: TIndexBuffer;
  Mat: TTextureMaterial;
begin
  if Context.BeginScene then
  try
    Ver := TVertexBuffer.Create([TVertexFormat.Vertex, TVertexFormat.TexCoord0], 4);
    Ver.Vertices[0] := Point3D(ARect.Left, ARect.Top, 0);
    Ver.Vertices[1] := Point3D(ARect.Right, ARect.Top, 0);
    Ver.Vertices[2] := Point3D(ARect.Right, ARect.Bottom, 0);
    Ver.Vertices[3] := Point3D(ARect.Left, ARect.Bottom, 0);
    Ver.TexCoord0[0] := PointF((DstPos.X + ARect.Left) / Texture.Width, (DstPos.Y + ARect.Top) / Texture.Height);
    Ver.TexCoord0[1] := PointF((DstPos.X + ARect.Right) / Texture.Width, (DstPos.Y + ARect.Top) / Texture.Height);
    Ver.TexCoord0[2] := PointF((DstPos.X + ARect.Right) / Texture.Width, (DstPos.Y + ARect.Bottom) / Texture.Height);
    Ver.TexCoord0[3] := PointF((DstPos.X + ARect.Left) / Texture.Width, (DstPos.Y + ARect.Bottom) / Texture.Height);
    Ind := TIndexBuffer.Create(6);
    Ind[0] := 0;
    Ind[1] := 1;
    Ind[2] := 3;
    Ind[3] := 3;
    Ind[4] := 1;
    Ind[5] := 2;
    Mat := TTextureMaterial.Create;
    Mat.Texture := Texture;
    Context.SetMatrix(TMatrix3D.Identity);
    Context.SetContextState(TContextState.cs2DScene);
    Context.SetContextState(TContextState.csZWriteOff);
    Context.SetContextState(TContextState.csZTestOff);
    Context.SetContextState(TContextState.csAllFace);
    Context.SetContextState(TContextState.csAlphaBlendOff);
    Context.SetContextState(TContextState.csScissorOff);
    Context.Clear(0);
    Context.DrawTriangles(Ver, Ind, Mat, 1);
    Mat.Free;
    Ind.Free;
    Ver.Free;
  finally
    Context.EndScene;
  end;
end;

class procedure TFilterContext3D.ResizeContext(Width, Height: Integer);
var
  I: Integer;
  Rec: TContextRec;
  CurWidth, CurHeight: Integer;
begin
  if not Assigned(FContextList) then
    FContextList := TList<TContextRec>.Create;

  CurWidth := 0;
  CurHeight := 0;
  for I := 0 to FContextList.Count - 1 do
  begin
    Rec := FContextList[I];
    if Assigned(Rec.Context) then
      Rec.Context.Free;
    if Assigned(Rec.Texture) then
    begin
      if Rec.Texture.Width > CurWidth then
        CurWidth := Rec.Texture.Width;
      if Rec.Texture.Height > CurHeight then
        CurHeight := Rec.Texture.Height;
      Rec.Texture.Free;
    end;
    Rec.Texture := nil;
    Rec.Context := nil;
    FContextList[I] := Rec;
  end;

  if Width > CurWidth then
    CurWidth := Width;
  if Height > CurHeight then
    CurHeight := Height;

  for I := 0 to FContextList.Count - 1 do
  begin
    Rec.Texture := TTexture.Create;
    Rec.Texture.SetSize(CurWidth, CurHeight);
    Rec.Texture.Style := [TTextureStyle.RenderTarget];
    Rec.Context := TContextManager.CreateFromTexture(Rec.Texture, TMultisample.None, False);
    FContextList[I] := Rec;
  end;
end;

class procedure TFilterContext3D.SetContextCount(const Value: Integer);
begin
  if not Assigned(FContextList) then
    FContextList := TList<TContextRec>.Create;
  FContextList.Count := Value;
end;

class procedure TFilterContext3D.SetCurrentContext(const Value: Integer);
begin
  FCurrentContext := Value;
  if not Assigned(FContextList) then
    FContextList := TList<TContextRec>.Create;
  if (FCurrentContext > FContextList.Count) then
    FContextList.Count := FCurrentContext;
end;

procedure TFilterContext3D.SetFilterValues(const Index: string; Value: TValue);
var
  I: Integer;
begin
  for I := 0 to High(FValues) do
    if SameText(FValues[I].Name, Index) then
    begin
      case FValues[I].ValueType of
        TFilterValueType.Bitmap:
          begin
            if Value.IsObject and ((Value.AsObject is TBitmap) or (Value.AsObject is TTexture)) then
            begin
              if SameText(Index, 'Output') then
                Exit;
              if FValues[I].Bitmap <> nil then
              begin
                FValues[I].Bitmap := nil;
                FValues[I].Value.AsObject.Free;
              end;
              FValues[I].Value := Value;
              if SameText(Index, 'Input') then
              begin
                if Value.AsObject is TBitmap then
                begin
                  FInputBitmap := TBitmap(Value.AsObject);
                  if not (TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle) then
                    FreeAndNil(FInput);
                  FInput := TContextManager.DefaultContextClass.BitmapToTexture(FInputBitmap);
                end;
                if Value.AsObject is TTexture then
                  FInput := TTexture(Value.AsObject);
              end
              else
              if SameText(Index, 'Target') then
              begin
                if Value.AsObject is TBitmap then
                begin
                  FTargetBitmap := TBitmap(Value.AsObject);
                  if not (TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle) then
                    FreeAndNil(FTarget);
                  FTarget := TContextManager.DefaultContextClass.BitmapToTexture(FTargetBitmap);
                end;
                if Value.AsObject is TTexture then
                  FTarget := TTexture(Value.AsObject);
              end
              else
              if Value.AsObject is TBitmap then
              begin
                FValues[I].Bitmap := TBitmap(Value.AsObject);
                FValues[I].Value := TContextManager.DefaultContextClass.BitmapToTexture(TBitmap(Value.AsObject));
              end;
            end;
          end;
      else
      end;
      FModified := True;
      Exit;
    end;
end;

procedure TFilterContext3D.SetInputToShaderVariable(const AName: string);
begin
  FilterContext3D.SetShaderVariable(AName, FInput);
end;

procedure TFilterContext3D.SetShaders(const AVertexShader,
  APixelShader: TContextShader);
begin
  FilterContext3D.SetShaders(AVertexShader, APixelShader);
end;

procedure TFilterContext3D.SetShaderVariable(const AName: string;
  const AData: array of TVector3D);
begin
  FilterContext3D.SetShaderVariable(AName, AData);
end;

procedure TFilterContext3D.SetShaderVariable(const AName: string;
  const AColor: TAlphaColor);
begin
  FilterContext3D.SetShaderVariable(AName, AColor);
end;

procedure TFilterContext3D.SetShaderVariable(const AName: string;
  const AMatrix: TMatrix3D);
begin
  FilterContext3D.SetShaderVariable(AName, AMatrix);
end;

procedure TFilterContext3D.SetShaderVariable(const AName: string;
  const ATexture: TTexture);
begin
  FilterContext3D.SetShaderVariable(AName, ATexture);
end;

class function TFilterContext3D.Style: TContextStyles;
begin
  Result := FilterContext3D.Style;
end;

function TFilterContext3D.TargetTexture: TTexture;
begin
  if TCanvasStyle.NeedGPUSurface in TCanvasManager.DefaultCanvas.GetCanvasStyle then
    Result := TContextManager.DefaultContextClass.BitmapToTexture(FTargetBitmap)
  else
    Result := FTarget;
end;

class procedure TFilterContext3D.UnInitialize;
var
  I: Integer;
  Rec: TContextRec;
begin
  if Assigned(FContextList) then
    for I := 0 to FContextList.Count - 1 do
    begin
      Rec := FContextList[I];
      FreeAndNil(Rec.Context);
      FreeAndNil(Rec.Texture);
    end;
  FreeAndNil(FContextList);
end;

end.
