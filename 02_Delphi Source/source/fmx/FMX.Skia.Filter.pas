{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit FMX.Skia.Filter;

interface

{$SCOPEDENUMS ON}

uses
  { Delphi }
  FMX.Skia.Canvas,
  System.SysUtils;

type
  ESkFilterContext = class(Exception);

procedure RegisterSkiaFilterContextForCanvas(const ACanvasClass: TSkCanvasCustomClass);

implementation

uses
  { Delphi }
  FMX.Graphics,
  FMX.Filter,
  FMX.Types3D,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Math,
  System.Math.Vectors,
  System.Generics.Collections,


  { Skia }
  FMX.Skia,
  System.Skia;

type
  TSkFilterImageValue = class
  private
    FBitmap: TBitmap;
    FBitmapSelfOwned: Boolean;
    FImage: ISkImage;
    FImageFilter: ISkImageFilter;
    FName: string;
    FSize: TSize;
    FTexture: TTexture;
    FTextureSelfOwned: Boolean;
    function GetBitmap: TBitmap;
    function GetImage: ISkImage;
    function GetImageFilter: ISkImageFilter;
    function GetTexture: TTexture;
    procedure SetBitmap(const AValue: TBitmap);
    procedure SetTexture(const ATexture: TTexture);
  public
    constructor Create(const AName: string);
    destructor Destroy; override;
    function IsEmpty: Boolean; inline;
    property Bitmap: TBitmap read GetBitmap write SetBitmap;
    property Image: ISkImage read GetImage;
    property ImageFilter: ISkImageFilter read GetImageFilter;
    property Name: string read FName;
    property Size: TSize read FSize;
    property Texture: TTexture read GetTexture write SetTexture;
  end;

  TSkFilterImageOutput = class
  private
    FBitmap: TBitmap;
    FBitmapOutdated: Boolean;
    FImageFilter: ISkImageFilter;
    FInputImage: ISkImage;
    FSize: TSize;
    FTexture: TTexture;
    FTextureSelfOwned: Boolean;
    procedure Changed;
    function GetBitmap: TBitmap;
    function GetTexture: TTexture;
    procedure SetImageFilter(const AValue: ISkImageFilter);
    procedure SetInputImage(const AValue: ISkImage);
    procedure SetSize(const AValue: TSize);
  public
    constructor Create;
    destructor Destroy; override;
    property Bitmap: TBitmap read GetBitmap;
    property ImageFilter: ISkImageFilter read FImageFilter write SetImageFilter;
    property InputImage: ISkImage read FInputImage write SetInputImage;
    property Size: TSize read FSize write SetSize;
    property Texture: TTexture read GetTexture;
  end;

  PSkFilterContextShaderPass = ^TSkFilterContextShaderPass;
  TSkFilterContextShaderPass = record
    Children: TArray<string>;
    ChildrenInputs: TArray<ISkImageFilter>;
    ImageFilter: ISkImageFilter;
    PixelShader: TContextShader;
    PixelShaderSource: TContextShaderSource;
    ResolutionExists: Boolean;
    RuntimeShader: ISkRuntimeShaderBuilder;
  end;

  TSkFilterContext = class(TFilterContext)
  private class var
    FLock: TObject;
    FSecondTexturesDic: TDictionary<string, TPair<ISkImageFilter, TSizeF>>;
  private
    FApplying: Boolean;
    FImageValues: TArray<TSkFilterImageValue>;
    FPass: Integer;
    FPassCount: Integer;
    FPassInputImage: ISkImageFilter;
    FPassShader: PSkFilterContextShaderPass;
    FOutput: TSkFilterImageOutput;
    FSavingLayerCanvas: ISkCanvas;
    FSavingLayerCount: Integer;
    FSecondImageResourceName: string;
    FSecondTexture: ISkImageFilter;
    FSecondTextureResolution: TSizeF;
    FShaders: TArray<TSkFilterContextShaderPass>;
    class constructor Create;
    procedure CreateSecondTexture;
    class destructor Destroy;
    function FindImageValue(const AName: string; const ACaseSensitive: Boolean = False): TSkFilterImageValue;
    procedure SetShaderVariable(const AName: string; const AImage: ISkImageFilter; const AResolution: TSizeF); overload;
  protected
    procedure Apply(var APass: Integer; const AAntiAliasing: Boolean; APassCount: Integer; const ASecondImageResourceName: string); override;
    function BeginLayer(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean; override;
    procedure Changed(const AValue: TFilterValueRec); override;
    procedure EndLayer(const ACacheLayer: IFilterCacheLayer); override;
    procedure LoadTextures; override;
    function OutputAsBitmap: TBitmap; override;
    function OutputAsImageFilter: ISkImageFilter;
    function OutputAsTexture: TTexture; override;
    class function SupportsShaders(AVertexShader: TContextShader; const AShaders: array of TContextShader; AShadersCount: Integer): Boolean; override;
  public
    constructor Create(const AFilter: TFilter; const AValues: TFilterValueRecArray); override;
    destructor Destroy; override;
    class procedure UnInitialize; override;
    procedure CopyToBitmap(const ADest: TBitmap; const ARect: TRect); override;
    procedure SetInputToShaderVariable(const AName: string); override;
    procedure SetShaders(const AVertexShader, APixelShader: TContextShader); override;
    procedure SetShaderVariable(const AName: string; const AData: array of TVector3D); override;
    procedure SetShaderVariable(const AName: string; const ATexture: TTexture); override;
    procedure SetShaderVariable(const AName: string; const AMatrix: TMatrix3D); override;
    procedure SetShaderVariable(const AName: string; const AColor: TAlphaColor); override;
  end;

  { TSkTextureCacheLayer }

  TSkTextureCacheLayer = class(TInterfacedObject, IFilterCacheLayer, ISkCanvasWrapper, IGrCanvasWrapper)
  private type
    TOpenCanvas = class(TCanvas);
    TOpenGrCanvas = class(TGrCanvas)
    public
      property GrDirectContext: IGrDirectContext read FGrDirectContext write FGrDirectContext;
    end;

  private
    FCacheCanvas: TCanvas;
    FCanvasScale: Single;
    FGrBackendTexture: IGrBackendTexture;
    FNeedUpdate: Boolean;
    FSavedDestRect: TRectF;
    FSavedHighSpeed: Boolean;
    FSavedOpacity: Single;
    FSavedTarget: TCanvas;
    FSharedContext: IGrSharedContext;
    FSize: TSize;
    FSurface: ISkSurface;
    function CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
    procedure CanvasEnd;
    procedure DestroyTexture;
    procedure DrawCacheTo(const ATarget: TCanvas; const ADestRect: TRectF;
      const AOpacity: Single; const AHighSpeed: Boolean);
    function GetCanvasHeight: Integer;
    function GetCanvasScale: Single;
    function GetCanvasWidth: integer;
  public
    destructor Destroy; override;
    function BeginUpdate(const ATarget: TCanvas; const ADestRect: TRectF; const AOpacity: Single;
      const AHighSpeed: Boolean; out ACacheCanvas: TCanvas): Boolean;
    procedure EndUpdate;
    procedure SetNeedUpdate;
    class function Supports(const ATarget: TCanvas): Boolean;
    property Size: TSize read FSize;
  end;

resourcestring
  SFilterContextDoesNotAcceptTexture = 'This filter context does not accept texture';
  SFilterContextInvalidShaderType = 'Invalid type for the variable "%s" in shader "%s"';
  SRuntimeShaderCreationError = 'Could not create the runtime shader for the shader "%s". Error message: "%s"';

var
  FEmptyImageFilter: ISkImageFilter;

{ TSkFilterContext }

procedure TSkFilterContext.Apply(var APass: Integer; const AAntiAliasing: Boolean;
  APassCount: Integer; const ASecondImageResourceName: string);
begin
  FApplying := True;
  try
    FPassCount := APassCount;
    if FSecondImageResourceName <> ASecondImageResourceName then
    begin
      FSecondImageResourceName := ASecondImageResourceName;
      CreateSecondTexture;
    end;

    FOutput.Size := Filter.OutputSize;
    if Filter.InputFilter <> nil then
      FOutput.InputImage := TSkFilterContext(Filter.InputFilter.FilterContext).FOutput.InputImage
    else
      FOutput.InputImage := FindImageValue('Input', True).Image;

    SetLength(FShaders, APassCount);

    for var I := 0 to APassCount - 1 do
    begin
      APass := I;
      FPass := I;
      FPassShader := @FShaders[FPass];

      // Apply pixel shader of pass
      LoadShaders;
      // Apply child shader of pass
      LoadTextures;

      if FPassShader.RuntimeShader = nil then
        FPassShader.ImageFilter := nil
      else
        FPassShader.ImageFilter := TSkImageFilter.MakeRuntimeShader(FPassShader.RuntimeShader, FPassShader.Children, FPassShader.ChildrenInputs);
      FPassInputImage := FPassShader.ImageFilter;
    end;
    FOutput.ImageFilter := FPassInputImage;
    FPassInputImage := nil;
  finally
    FApplying := False;
  end;
end;

function TSkFilterContext.BeginLayer(const ATarget: TCanvas;
  const ADestRect: TRectF; const AOpacity: Single; const AHighSpeed: Boolean;
  var ACacheLayer: IFilterCacheLayer; out ACacheCanvas: TCanvas): Boolean;
begin
  if TSkTextureCacheLayer.Supports(ATarget) then
  begin
    if not (TObject(ACacheLayer) is TSkTextureCacheLayer) then
      ACacheLayer := TSkTextureCacheLayer.Create;
    Result := TSkTextureCacheLayer(ACacheLayer).BeginUpdate(ATarget, ADestRect, AOpacity, AHighSpeed, ACacheCanvas);
    if Result then
    begin
      SetRootInputLayerSize(TSkTextureCacheLayer(ACacheLayer).Size);
      Filter.ApplyWithoutCopyToOutput;

      FSavingLayerCanvas := TSkCanvasCustom(ACacheCanvas).Canvas;
      var LPaint: ISkPaint := TSkPaint.Create;
      LPaint.ImageFilter := OutputAsImageFilter;
      FSavingLayerCount := FSavingLayerCanvas.SaveLayer(LPaint);
    end;
  end
  else
    Result := inherited;
end;

procedure TSkFilterContext.Changed(const AValue: TFilterValueRec);
begin
  if AValue.ValueType = TFilterValueType.Bitmap then
  begin
    var LImageValue := FindImageValue(AValue.Name, True);
    if LImageValue = nil then
      Exit;
    if AValue.Value.AsObject is TBitmap then
      LImageValue.Bitmap := TBitmap(AValue.Value.AsObject)
    else if AValue.Value.AsObject is TTexture then
      LImageValue.Texture := TTexture(AValue.Value.AsObject)
    else
      LImageValue.Bitmap := nil;
  end;
end;

procedure TSkFilterContext.CopyToBitmap(const ADest: TBitmap;
  const ARect: TRect);
begin
  var LOutputBitmap := OutputAsBitmap;
  if LOutputBitmap = nil then
    Exit;
  if (ADest.Bounds = ARect) and (ARect.Size = Filter.OutputSize) and (ARect.Size = LOutputBitmap.Size) then
    ADest.Assign(LOutputBitmap)
  else
  begin
    ADest.Canvas.BeginScene;
    try
      ADest.Canvas.ClearRect(ARect, TAlphaColors.Null);
      var LDestRect := LOutputBitmap.BoundsF;
      LDestRect.Offset(ARect.TopLeft);
      ADest.Canvas.DrawBitmap(LOutputBitmap, LOutputBitmap.BoundsF, LDestRect, 1, True);
    finally
      ADest.Canvas.EndScene;
    end;
  end;
end;

constructor TSkFilterContext.Create(const AFilter: TFilter;
  const AValues: TFilterValueRecArray);
begin
  inherited;
  if FEmptyImageFilter = nil then
    FEmptyImageFilter := TSkImageFilter.MakeShader(TSkShader.MakeEmpty, False);
  FOutput := TSkFilterImageOutput.Create;
  SetLength(FImageValues, Length(AValues));
  var LImagesCount := 0;
  for var I := 0 to High(AValues) do
  begin
    if (AValues[I].ValueType = TFilterValueType.Bitmap) and (not SameText(AValues[I].Name, 'Output')) and (not SameText(AValues[I].Name, 'Second')) then
    begin
      FImageValues[LImagesCount] := TSkFilterImageValue.Create(AValues[I].Name);
      Inc(LImagesCount);
    end;
  end;
  SetLength(FImageValues, LImagesCount);
end;

class constructor TSkFilterContext.Create;
begin
  FLock := TObject.Create;
end;

procedure TSkFilterContext.CreateSecondTexture;
var
  LValue: TPair<ISkImageFilter, TSizeF>;
  LTextureFound: Boolean;
begin
  TMonitor.Enter(FLock);
  try
    if FSecondTexturesDic = nil then
      FSecondTexturesDic := TDictionary<string, TPair<ISkImageFilter, TSizeF>>.Create;
    LTextureFound := FSecondTexturesDic.TryGetValue(FSecondImageResourceName, LValue);
  finally
    TMonitor.Exit(FLock);
  end;

  if LTextureFound then
  begin
    FSecondTexture := LValue.Key;
    FSecondTextureResolution := LValue.Value;
  end
  else
  begin
    var LStream := TResourceStream.Create(HInstance, FSecondImageResourceName, RT_RCDATA);
    try
      var LImage := TSkImage.MakeFromEncodedStream(LStream);
      FSecondTexture := TSkImageFilter.MakeImage(LImage);
      FSecondTextureResolution := TSizeF.Create(LImage.Width, LImage.Height);
      TMonitor.Enter(FLock);
      try
        FSecondTexturesDic.Add(FSecondImageResourceName, TPair<ISkImageFilter, TSizeF>.Create(FSecondTexture, FSecondTextureResolution));
      finally
        TMonitor.Exit(FLock);
      end;
    finally
      LStream.Free;
    end;
  end;
end;

class destructor TSkFilterContext.Destroy;
begin
  FLock.Free;
end;

destructor TSkFilterContext.Destroy;
begin
  for var I := 0 to High(FImageValues) do
    FImageValues[I].Free;
  FOutput.Free;
  inherited;
end;

procedure TSkFilterContext.EndLayer(const ACacheLayer: IFilterCacheLayer);
begin
  if TObject(ACacheLayer) is TSkTextureCacheLayer then
  begin
    FSavingLayerCanvas.RestoreToCount(FSavingLayerCount);
    FSavingLayerCanvas := nil;
    TSkTextureCacheLayer(ACacheLayer).EndUpdate;
  end
  else
    inherited;
end;

function TSkFilterContext.FindImageValue(const AName: string;
  const ACaseSensitive: Boolean): TSkFilterImageValue;
begin
  if ACaseSensitive then
  begin
    for var I := 0 to High(FImageValues) do
      if FImageValues[I].Name = AName then
        Exit(FImageValues[I]);
  end
  else
  begin
    for var I := 0 to High(FImageValues) do
      if SameText(FImageValues[I].Name, AName) then
        Exit(FImageValues[I]);
  end;
  Result := nil;
end;

procedure TSkFilterContext.LoadTextures;
begin
  if FPass = 0 then
    SetInputToShaderVariable('Input')
  else
    SetShaderVariable('Input', FPassInputImage, Filter.InputSize);
  if FSecondTexture <> nil then
    SetShaderVariable('Second', FSecondTexture, FSecondTextureResolution);

  for var LImageValue in FImageValues do
  begin
    if SameText(LImageValue.Name, 'Input') or
      SameText(LImageValue.Name, 'Second') then
    begin
      Continue;
    end;

    SetShaderVariable(LImageValue.Name, LImageValue.ImageFilter, LImageValue.Size);
  end;
  inherited;
end;

function TSkFilterContext.OutputAsBitmap: TBitmap;
begin
  Result := FOutput.Bitmap;
end;

function TSkFilterContext.OutputAsImageFilter: ISkImageFilter;
begin
  Result := FOutput.ImageFilter;
end;

function TSkFilterContext.OutputAsTexture: TTexture;
begin
  Result := FOutput.Texture;
end;

procedure TSkFilterContext.SetInputToShaderVariable(const AName: string);
begin
  if Filter.InputFilter = nil then
    SetShaderVariable(AName, nil, Filter.InputSize)
  else
    SetShaderVariable(AName, TSkFilterContext(Filter.InputFilter.FilterContext).OutputAsImageFilter, Filter.InputSize);
end;

procedure TSkFilterContext.SetShaders(const AVertexShader,
  APixelShader: TContextShader);
var
  LVariable: TContextShaderVariable;
begin
  if not FApplying then
    Exit;
  if APixelShader <> FPassShader.PixelShader then
  begin
    FPassShader^ := Default(TSkFilterContextShaderPass);
    FPassShader.PixelShader := APixelShader;
    if APixelShader <> nil then
      FPassShader.PixelShaderSource := APixelShader.GetSourceByArch(TContextShaderArch.SKSL);
    if FPassShader.PixelShaderSource.IsDefined then
    begin
      var LError: string;
      var LRuntimeEffect: ISkRuntimeEffect;
      if FPassShader.PixelShaderSource.Code[Length(FPassShader.PixelShaderSource.Code) - 1] = 0 then
        LRuntimeEffect := TSkRuntimeEffect.MakeForShader(Pointer(FPassShader.PixelShaderSource.Code), LError)
      else
        LRuntimeEffect := TSkRuntimeEffect.MakeForShader(TEncoding.UTF8.GetString(FPassShader.PixelShaderSource.Code), LError);
      if LRuntimeEffect = nil then
        raise ESkFilterContext.CreateResFmt(@SRuntimeShaderCreationError, [APixelShader.Name, LError]);
      FPassShader.RuntimeShader := TSkRuntimeShaderBuilder.Create(LRuntimeEffect);
      FPassShader.ResolutionExists := FPassShader.PixelShaderSource.FindVariable('Resolution', LVariable);
      for var I := 0 to High(FPassShader.PixelShaderSource.Variables) do
      begin
        if FPassShader.PixelShaderSource.Variables[I].Kind = TContextShaderVariableKind.Texture then
        begin
          // It should be ordered by index
          Assert(FPassShader.PixelShaderSource.Variables[I].Index = Length(FPassShader.Children));
          FPassShader.Children := FPassShader.Children + [FPassShader.PixelShaderSource.Variables[I].Name];
        end;
      end;
      SetLength(FPassShader.ChildrenInputs, Length(FPassShader.Children));
    end
    else
      FPassShader.RuntimeShader := nil;
  end;
  if FPassShader.RuntimeShader <> nil then
  begin
    for var I := 0 to High(FPassShader.ChildrenInputs) do
      FPassShader.ChildrenInputs[I] := FEmptyImageFilter;
    if FPassShader.ResolutionExists then
    begin
      var LResolution := Filter.OutputSize;
      FPassShader.RuntimeShader.SetUniform('Resolution', PointF(LResolution.Width, LResolution.Height));
    end;
  end;
end;

procedure TSkFilterContext.SetShaderVariable(const AName: string;
  const AImage: ISkImageFilter; const AResolution: TSizeF);
var
  LVariable: TContextShaderVariable;
begin
  if (FPassShader.RuntimeShader <> nil) and FPassShader.PixelShaderSource.FindVariable(AName, LVariable) then
  begin
    if LVariable.Kind = TContextShaderVariableKind.Texture then
    begin
      SetShaderVariable(AName + 'Resolution', [TVector3D.Create(AResolution.Width, AResolution.Height, 0, 0)]);
      FPassShader.ChildrenInputs[LVariable.Index] := AImage;
    end
    else
      raise ESkFilterContext.CreateResFmt(@SFilterContextInvalidShaderType, [AName, FPassShader.PixelShader.Name]);
  end;
end;

procedure TSkFilterContext.SetShaderVariable(const AName: string;
  const AData: array of TVector3D);
var
  LVariable: TContextShaderVariable;
begin
  if not FApplying then
    Exit;
  if (FPassShader.RuntimeShader <> nil) and FPassShader.PixelShaderSource.FindVariable(AName, LVariable) then
  begin
    case LVariable.Kind of
      TContextShaderVariableKind.Float: FPassShader.RuntimeShader.SetUniform(LVariable.Name, AData[0].X);
      TContextShaderVariableKind.Float2: FPassShader.RuntimeShader.SetUniform(LVariable.Name, PointF(AData[0].X, AData[0].Y));
      TContextShaderVariableKind.Float3: FPassShader.RuntimeShader.SetUniform(LVariable.Name, [AData[0].X, AData[0].Y, AData[0].Z]);
      TContextShaderVariableKind.Vector: FPassShader.RuntimeShader.SetUniform(LVariable.Name, [AData[0].X, AData[0].Y, AData[0].Z, AData[0].W]);
      TContextShaderVariableKind.Matrix:
        begin
          if Length(AData) <> 4 then
            raise ESkFilterContext.CreateResFmt(@SFilterContextInvalidShaderType, [AName, FPassShader.PixelShader.Name]);
          FPassShader.RuntimeShader.SetUniform(LVariable.Name,
            TSkRuntimeEffectFloat4x4.Create(
              AData[0].V[0], AData[0].V[1], AData[0].V[2], AData[0].V[3],
              AData[1].V[0], AData[1].V[1], AData[1].V[2], AData[1].V[3],
              AData[2].V[0], AData[2].V[1], AData[2].V[2], AData[2].V[3],
              AData[3].V[0], AData[3].V[1], AData[3].V[2], AData[3].V[3]));
        end;
    else
      raise ESkFilterContext.CreateResFmt(@SFilterContextInvalidShaderType, [AName, FPassShader.PixelShader.Name]);
    end;
  end;
end;

procedure TSkFilterContext.SetShaderVariable(const AName: string;
  const ATexture: TTexture);
begin
  raise ESkFilterContext.CreateRes(@SFilterContextDoesNotAcceptTexture);
end;

procedure TSkFilterContext.SetShaderVariable(const AName: string;
  const AMatrix: TMatrix3D);
var
  LVariable: TContextShaderVariable;
begin
  if not FApplying then
    Exit;
  if (FPassShader.RuntimeShader <> nil) and FPassShader.PixelShaderSource.FindVariable(AName, LVariable) then
  begin
    if LVariable.Kind = TContextShaderVariableKind.Matrix then
    begin
      FPassShader.RuntimeShader.SetUniform(LVariable.Name,
        TSkRuntimeEffectFloat4x4.Create(
          AMatrix.M[0].V[0], AMatrix.M[0].V[1], AMatrix.M[0].V[2], AMatrix.M[0].V[3],
          AMatrix.M[1].V[0], AMatrix.M[1].V[1], AMatrix.M[1].V[2], AMatrix.M[1].V[3],
          AMatrix.M[2].V[0], AMatrix.M[2].V[1], AMatrix.M[2].V[2], AMatrix.M[2].V[3],
          AMatrix.M[3].V[0], AMatrix.M[3].V[1], AMatrix.M[3].V[2], AMatrix.M[3].V[3]));
    end
    else
      raise ESkFilterContext.CreateResFmt(@SFilterContextInvalidShaderType, [AName, FPassShader.PixelShader.Name]);
  end;
end;

procedure TSkFilterContext.SetShaderVariable(const AName: string;
  const AColor: TAlphaColor);
var
  LComponents: TAlphaColorRec absolute AColor;
begin
  SetShaderVariable(AName, [Vector3D(LComponents.R / $FF, LComponents.G / $FF, LComponents.B / $FF, LComponents.A / $FF)]);
end;

class function TSkFilterContext.SupportsShaders(AVertexShader: TContextShader;
  const AShaders: array of TContextShader; AShadersCount: Integer): Boolean;
begin
  for var I := 0 to AShadersCount - 1 do
  begin
    if (AShaders[I] <> nil) and not AShaders[I].GetSourceByArch(TContextShaderArch.SKSL).IsDefined then
      Exit(False);
  end;
  Result := True;
end;

class procedure TSkFilterContext.UnInitialize;
begin
  FreeAndNil(FSecondTexturesDic);
end;

{ TSkFilterImageValue }

constructor TSkFilterImageValue.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
end;

destructor TSkFilterImageValue.Destroy;
begin
  if FBitmapSelfOwned then
    FBitmap.Free;
  if FTextureSelfOwned then
    FTexture.Free;
  inherited;
end;

function TSkFilterImageValue.GetBitmap: TBitmap;
begin
  if (FBitmap = nil) and (FTexture <> nil) then
  begin
    FBitmap := TBitmap.Create;
    var LContext3D := TContextManager.CreateFromTexture(FTexture, TMultisample.None, False);
    try
      FBitmap.Assign(LContext3D);
    finally
      LContext3D.Free;
    end;
    FBitmapSelfOwned := True;
  end;
  Result := FBitmap;
end;

function TSkFilterImageValue.GetImage: ISkImage;
begin
  if FImage = nil then
  begin
    if IsEmpty then
      Exit(nil);
    FImage := Bitmap.ToSkImage;
  end;
  Result := FImage;
end;

function TSkFilterImageValue.GetImageFilter: ISkImageFilter;
begin
  if FImageFilter = nil then
  begin
    if IsEmpty then
      Exit(FEmptyImageFilter);
    FImageFilter := TSkImageFilter.MakeImage(Image);
  end;
  Result := FImageFilter;
end;

function TSkFilterImageValue.GetTexture: TTexture;
begin
  if (FTexture = nil) and (FBitmap <> nil) then
  begin
    FTexture := TContextManager.DefaultContextClass.BitmapToTexture(FBitmap);
    FTextureSelfOwned := not (TCanvasStyle.NeedGPUSurface in FBitmap.CanvasClass.GetCanvasStyle);
  end;
  Result := FTexture;
end;

function TSkFilterImageValue.IsEmpty: Boolean;
begin
  Result := (FSize.Width <= 0) or (FSize.Height <= 0);
end;

procedure TSkFilterImageValue.SetBitmap(const AValue: TBitmap);
begin
  if FTextureSelfOwned then
  begin
    FTexture.Free;
    FTextureSelfOwned := False;
  end;
  FTexture := nil;
  FImage := nil;
  FImageFilter := nil;
  FBitmap := AValue;
  FBitmapSelfOwned := False;
  if FBitmap = nil then
    FSize := TSize.Create(0, 0)
  else if FBitmap.IsEmpty then
    FSize := TSize.Create(0, 0)
  else
    FSize := FBitmap.Size;
end;

procedure TSkFilterImageValue.SetTexture(const ATexture: TTexture);
begin
  if FBitmapSelfOwned then
  begin
    FBitmap.Free;
    FBitmapSelfOwned := False;
  end;
  FBitmap := nil;
  FImage := nil;
  FImageFilter := nil;
  FTexture := ATexture;
  FTextureSelfOwned := False;
  if FTexture = nil then
    FSize := TSize.Create(0, 0)
  else if FTexture.IsEmpty then
    FSize := TSize.Create(0, 0)
  else
    FSize := TSize.Create(FTexture.Width, FTexture.Height);
end;

{ TSkFilterImageOutput }

procedure TSkFilterImageOutput.Changed;
begin
  FBitmapOutdated := True;
  if FTextureSelfOwned then
  begin
    FreeAndNil(FTexture);
    FTextureSelfOwned := False;
  end
  else
    FTexture := nil;
end;

constructor TSkFilterImageOutput.Create;
begin
  inherited Create;
  FImageFilter := FEmptyImageFilter;
  FBitmap := TBitmap.Create;
end;

destructor TSkFilterImageOutput.Destroy;
begin
  FBitmap.Free;
  if FTextureSelfOwned then
    FTexture.Free;
  inherited;
end;

function TSkFilterImageOutput.GetBitmap: TBitmap;
begin
  if FBitmapOutdated then
  begin
    FBitmap.SetSize(FSize);
    if FBitmap.Canvas.BeginScene then
      try
        FBitmap.Canvas.Clear(TAlphaColors.Null);
        if (FInputImage <> nil) and (FImageFilter <> FEmptyImageFilter) then
        begin
          // Executing the RuntimeEffect through the SaveLayer method, painting the input on the output image is the
          // fastest method, however, when the output is smaller than the input, there are internal optimizations in
          // Skia that can cut the input.As there are very few cases where this occurs, it is better to keep the
          // faster method and carry out a special treatment for this case.
          if (FInputImage.Width > FSize.Width) or (FInputImage.Height > FSize.Height) then
          begin
            var LOutputBitmap := TBitmap.Create(Max(FInputImage.Width, FSize.Width), Max(FInputImage.Height, FSize.Height));
            try
              if LOutputBitmap.Canvas.BeginScene then
              try
                LOutputBitmap.Canvas.Clear(TAlphaColors.Null);
                var LCanvas := TSkCanvasCustom(LOutputBitmap.Canvas).Canvas;
                var LPaint: ISkPaint := TSkPaint.Create;
                LPaint.ImageFilter := FImageFilter;
                LCanvas.SaveLayer(LPaint);
                try
                  LCanvas.DrawImage(FInputImage, 0, 0);
                finally
                  LCanvas.Restore;
                end;
              finally
                LOutputBitmap.Canvas.EndScene;
              end;
              FBitmap.Canvas.DrawBitmap(LOutputBitmap, FBitmap.BoundsF, FBitmap.BoundsF, 1, False);
            finally
              LOutputBitmap.Free;
            end;
          end
          else
          begin
            var LCanvas := TSkCanvasCustom(FBitmap.Canvas).Canvas;
            var LPaint: ISkPaint := TSkPaint.Create;
            LPaint.ImageFilter := FImageFilter;
            LCanvas.SaveLayer(LPaint);
            try
              LCanvas.DrawImage(FInputImage, 0, 0);
            finally
              LCanvas.Restore;
            end;
          end;
        end;
      finally
        FBitmap.Canvas.EndScene;
      end;
    FBitmapOutdated := False;
  end;
  Result := FBitmap;
end;

function TSkFilterImageOutput.GetTexture: TTexture;
begin
  if FTexture = nil then
  begin
    FTexture := TContextManager.DefaultContextClass.BitmapToTexture(FBitmap);
    FTextureSelfOwned := not (TCanvasStyle.NeedGPUSurface in FBitmap.CanvasClass.GetCanvasStyle);
  end;
  Result := FTexture;
end;

procedure TSkFilterImageOutput.SetImageFilter(const AValue: ISkImageFilter);
begin
  if (AValue = nil) and (FImageFilter = FEmptyImageFilter) then
    Exit;
  if FImageFilter <> AValue then
  begin
    if AValue = nil then
      FImageFilter := FEmptyImageFilter
    else
      FImageFilter := AValue;
    Changed;
  end;
end;

procedure TSkFilterImageOutput.SetInputImage(const AValue: ISkImage);
begin
  if FInputImage <> AValue then
  begin
    FInputImage := AValue;
    Changed;
  end;
end;

procedure TSkFilterImageOutput.SetSize(const AValue: TSize);
begin
  if FSize <> AValue then
  begin
    FSize := AValue;
    Changed;
  end;
end;

{ TSkTextureCacheLayer }

procedure TSkTextureCacheLayer.DrawCacheTo(const ATarget: TCanvas; const ADestRect: TRectF;
  const AOpacity: Single; const AHighSpeed: Boolean);
begin
  var LImage := TSkImage.MakeFromTexture(TGrCanvas(ATarget).GrDirectContext, FGrBackendTexture, FSharedContext.TextureOrigin, FSharedContext.TextureColorType);
  var LPaint: ISkPaint := TSkPaint.Create;
  LPaint.AlphaF := AOpacity;
  TSkCanvasCustom(ATarget).Canvas.DrawImageRect(LImage, ADestRect,
    TSkCanvasCustom(ATarget).QualityToSamplingOptions(ATarget.Quality, AHighSpeed), LPaint);
end;

function TSkTextureCacheLayer.BeginUpdate(const ATarget: TCanvas;
  const ADestRect: TRectF; const AOpacity: Single; const AHighSpeed: Boolean;
  out ACacheCanvas: TCanvas): Boolean;

  function CalcTextureSize: TSize;
  begin
    var LRect := ADestRect;
    var LScale := ATarget.Matrix.ExtractScale;
    MultiplyRect(LRect, LScale.X, LScale.Y);
    MultiplyRect(LRect, ATarget.Scale, ATarget.Scale);
    Result := TSize.Create(Round(LRect.Width), Round(LRect.Height));
    if (Result.Width <= 0) or (Result.Height <= 0) then
      Result := TSize.Create(0, 0);
  end;

begin
  ACacheCanvas := nil;
  if FCacheCanvas <> nil then
    Exit(False);
  var LTextureSize := CalcTextureSize;
  if FNeedUpdate or (FGrBackendTexture = nil) or (LTextureSize <> FSize) then
  begin
    if LTextureSize <> FSize then
      DestroyTexture;
    FSize := LTextureSize;
    if FSize.IsZero then
      Exit(False);
    Result := False;
    FSharedContext := TGrCanvas(ATarget).SharedContext;
    FSharedContext.BeginContext;
    try
      if FGrBackendTexture = nil then
        FGrBackendTexture := FSharedContext.GrDirectContext.CreateTexture(FSize.Width, FSize.Height, FSharedContext.TextureColorType, False, True);
      FSurface := TSkSurface.MakeFromTexture(FSharedContext.GrDirectContext, FGrBackendTexture, FSharedContext.TextureOrigin,
        Min(CanvasQualitySampleCount[TCanvasQuality.SystemDefault], FSharedContext.GrDirectContext.GetMaxSurfaceSampleCountForColorType(FSharedContext.TextureColorType)),
        FSharedContext.TextureColorType);
      FCanvasScale := ATarget.Scale;
      FCacheCanvas := DefaultSkiaRenderCanvasClass.Wrap(Self);
      Assert(FCacheCanvas is TGrCanvas);
      TOpenGrCanvas(FCacheCanvas).GrDirectContext := FSharedContext.GrDirectContext;
      FNeedUpdate := False;
      if FCacheCanvas.BeginScene then
      begin
        FSavedDestRect := ADestRect;
        FSavedHighSpeed := AHighSpeed;
        FSavedOpacity := AOpacity;
        FSavedTarget := ATarget;
        ACacheCanvas := FCacheCanvas;
        FCacheCanvas.Clear(TAlphaColors.Null);
        Result := True;
      end
      else
        FreeAndNil(FCacheCanvas);
    finally
      if not Result then
        FSharedContext.EndContext;
    end;
  end
  else
  begin
    DrawCacheTo(ATarget, ADestRect, AOpacity, AHighSpeed);
    Result := False;
  end;
end;

function TSkTextureCacheLayer.CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
begin
  Result := FSurface.Canvas;
end;

procedure TSkTextureCacheLayer.CanvasEnd;
begin
  FSurface.FlushAndSubmit;
end;

destructor TSkTextureCacheLayer.Destroy;
begin
  DestroyTexture;
  inherited;
end;

procedure TSkTextureCacheLayer.DestroyTexture;
begin
  if FGrBackendTexture <> nil then
  begin
    FSharedContext.BeginContext;
    try
      FSharedContext.GrDirectContext.DeleteTexture(FGrBackendTexture);
      FGrBackendTexture := nil;
    finally
      FSharedContext.EndContext;
    end;
  end;
end;

procedure TSkTextureCacheLayer.EndUpdate;
begin
  if FCacheCanvas = nil then
    Exit;
  FCacheCanvas.EndScene;
  FreeAndNil(FCacheCanvas);
  FSurface := nil;
  FSharedContext.EndContext;
  DrawCacheTo(FSavedTarget, FSavedDestRect, FSavedOpacity, FSavedHighSpeed);
  FSavedTarget := nil;
end;

function TSkTextureCacheLayer.GetCanvasHeight: Integer;
begin
  Result := FGrBackendTexture.Height;
end;

function TSkTextureCacheLayer.GetCanvasScale: Single;
begin
  Result := FCanvasScale;
end;

function TSkTextureCacheLayer.GetCanvasWidth: integer;
begin
  Result := FGrBackendTexture.Width;
end;

procedure TSkTextureCacheLayer.SetNeedUpdate;
begin
  FNeedUpdate := True;
end;

class function TSkTextureCacheLayer.Supports(const ATarget: TCanvas): Boolean;
begin
  Result := TGrCanvas.Initialized and (ATarget is TGrCanvas) and (TGrCanvas(ATarget).GrDirectContext <> nil);
end;

{ Register }

procedure RegisterSkiaFilterContextForCanvas(const ACanvasClass: TSkCanvasCustomClass);
begin
  TFilterManager.RegisterFilterContextForCanvas(TSkFilterContext, ACanvasClass);
end;

{$HPPEMIT NOUSINGNAMESPACE}
{$HPPEMIT END '#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FMX_SKIA_FILTER)'}
{$HPPEMIT END '    using ::Fmx::Skia::Filter::ESkFilterContext;'}
{$HPPEMIT END '    typedef void (__fastcall *TRegisterSkiaFilterContextForCanvasProc)(const ::Fmx::Skia::Canvas::TSkCanvasCustomClass ACanvasClass);'}
{$HPPEMIT END '    static const TRegisterSkiaFilterContextForCanvasProc RegisterSkiaFilterContextForCanvas = ::Fmx::Skia::Filter::RegisterSkiaFilterContextForCanvas;'}
{$HPPEMIT END '#endif'}
end.
