{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.IMERender;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.UITypes, FMX.TextLayout, FMX.Text, FMX.Graphics;

type

{ IME Text layout }

  TIMEParagraphLine = record
    Range: TTextRange;
    LineRect: TRectF;
  end;
  TIMEParagraphLines = TArray<TIMEParagraphLine>;

  /// <summary>Extension for TextLayout for layout IME text as paragraph with first line offset.</summary>
  TIMETextLayout = class
  public const
    MarkedTextBackgroundOpacity = 1;
    DefaultDarkBackgroundColor: TAlphaColor = TAlphaColor($E6000000);
    DefaultLightBackgroundColor: TAlphaColor = TAlphaColor($E6FFFFFF);
    DefaultBackgroundCornerRadius = 0;
    DefaultExpandBackgroundMargins: TRectF = (Left: 0; Top: 2; Right: 0; Bottom: 2);
  {$IFDEF MACOS}
    MaxThickness = 3;
  {$ELSE}
    MaxThickness = 4;
  {$ENDIF}
  private
    FTextLayout: TTextLayout;
    FFirstLineOffset: Single;
    FMaxSize: TSizeF;
    FTopLeft: TPointF;
    FText: string;
    FColor: TAlphaColor;
    FOpacity: Single;
    FMarkedTextAttributes: TArray<TMarkedTextAttribute>;
    FLightBackgroundColor: TAlphaColor;
    FDarkBackgroundColor: TAlphaColor;
    FBackgroundCornerRadius: Single;
    FExpandBackgroundMargins: TRectF;
    { Paragraph Metrics }
    FLines: TIMEParagraphLines;
    FNeedRecalculate: Boolean;
    procedure SetTopLeft(const Value: TPointF);
    procedure SetMaxSize(const Value: TSizeF);
    procedure SetText(const Value: string);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
    procedure SetOpacity(const Value: Single);
    procedure SetColor(const Value: TAlphaColor);
    procedure SetRightToLeft(const Value: Boolean);
    function GetRightToLeft: Boolean;
    function GetLines: TIMEParagraphLines;
    function GetBoundsRect: TRectF;
  protected
    class function MarkedTextAttributeToStrokeDash(const AAttribute: TMarkedTextAttribute): TStrokeDash;
    class function MarkedTextAttributeToThickness(const AAttribute: TMarkedTextAttribute): Single;

    function GetTextRangeFor(const ARegion: TRectF): TTextRange;
    function GetAbsoluteTextRectFor(const ARegion: TRectF): TRectF;
    procedure RecalculateMetrics;

    { Painting }
    procedure DrawBackground(const ACanvas: TCanvas); virtual;
    procedure DrawLines(const ACanvas: TCanvas);
    procedure UnderlineLine(const ACanvas: TCanvas; const ARange: TTextRange); virtual;
    procedure UnderlineRegion(const ACanvas: TCanvas; const ARegions: TRegion; const ANeedAddSpace: Boolean); virtual;
    procedure ApplyMarkedTextAttribute(const ACanvas: TCanvas; const AAttribute: TMarkedTextAttribute); virtual;
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>Renders IME text according specified properties on the <c>ACanvas</c>.</summary>
    procedure Render(const ACanvas: TCanvas);

    procedure BeginUpdate;
    procedure EndUpdate;

    /// <summary>Returns Top-Left corner of character bounds at specified position <c>APos</c>.</summary>
    /// <remarks>If <c>APos</c> is invalid value, the it retruns <c>TPointF.Zero</c>.</remarks>
    function GetPositionPoint(const APos: Integer): TPointF;

    /// <summary>The calculated the paragraph bounds.</summary>
    property BoundsRect: TRectF read GetBoundsRect;
  public
    /// <summary>Paragraph text.</summary>
    property Text: string read FText write SetText;
    /// <summary>Coordinates of Top-Left corner of paragraph bounds.</summary>
    property TopLeft: TPointF read FTopLeft write SetTopLeft;
    /// <summary>Max available size for rendering paragraph.</summary>
    property MaxSize: TSizeF read FMaxSize write SetMaxSize;
    /// <summary>IME text attributes.</summary>
    property TextAttributes: TArray<TMarkedTextAttribute> read FMarkedTextAttributes write FMarkedTextAttributes;
    /// <summary>Local horizontal offset (from TopLeft) of first paragraph line.</summary>
    property FirstLineOffset: Single read FFirstLineOffset write FFirstLineOffset;
    /// <summary>Text font.</summary>
    property Font: TFont read GetFont write SetFont;
    /// <summary>Text color.</summary>
    property Color: TAlphaColor read FColor write SetColor;
    /// <summary>Text opacity.</summary>
    property Opacity: Single read FOpacity write SetOpacity;
    /// <summary>Should be used Right-To-Left rendering?</summary>
    property RightToLeft: Boolean read GetRightToLeft write SetRightToLeft;
    /// <summary>Calculated parameters of the paragraph lines.</summary>
    property Lines: TIMEParagraphLines read GetLines;

    { Appearance }
    property BackgroundCornerRadius: Single read FBackgroundCornerRadius write FBackgroundCornerRadius;
    property LightBackgroundColor: TAlphaColor read FLightBackgroundColor write FLightBackgroundColor;
    property DarkBackgroundColor: TAlphaColor read FDarkBackgroundColor write FDarkBackgroundColor;
    property ExpandBackgroundMargins: TRectF read FExpandBackgroundMargins write FExpandBackgroundMargins;
  end;

implementation

uses
  System.SysUtils, System.Rtti, System.Math, FMX.Utils, FMX.Platform, FMX.Platform.Metrics, FMX.Types, FMX.Consts;

{ TIMETextLayout }

procedure TIMETextLayout.ApplyMarkedTextAttribute(const ACanvas: TCanvas; const AAttribute: TMarkedTextAttribute);
begin
  ACanvas.Stroke.Dash := MarkedTextAttributeToStrokeDash(AAttribute);
  ACanvas.Stroke.Thickness := MarkedTextAttributeToThickness(AAttribute);
end;

procedure TIMETextLayout.BeginUpdate;
begin
  FTextLayout.BeginUpdate;
end;

constructor TIMETextLayout.Create;
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  FOpacity := 1;
  FColor := TAlphaColorRec.Black;
  FTextLayout := TTextLayoutManager.DefaultTextLayout.Create;
  FTextLayout.WordWrap := True;
  FTextLayout.Color := FColor;
  FTextLayout.Opacity := FOpacity;
  FExpandBackgroundMargins := DefaultExpandBackgroundMargins;

  if TPlatformServices.Current.SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
  begin
    FLightBackgroundColor := PropertiesService.GetValue('IME.MarkedText.LightBackgroundColor', TValue.From<TAlphaColor>(DefaultLightBackgroundColor))
                                              .AsType<TAlphaColor>;
    FDarkBackgroundColor := PropertiesService.GetValue('IME.MarkedText.DarkBackgroundColor', TValue.From<TAlphaColor>(DefaultDarkBackgroundColor))
                                             .AsType<TAlphaColor>;
    FBackgroundCornerRadius := PropertiesService.GetValue('IME.MarkedText.BackgroundCornerRadius', DefaultBackgroundCornerRadius)
                                                .AsExtended;
  end
  else
  begin
    FLightBackgroundColor := DefaultLightBackgroundColor;
    FDarkBackgroundColor := DefaultDarkBackgroundColor;
    FBackgroundCornerRadius := DefaultBackgroundCornerRadius;
  end;
end;

destructor TIMETextLayout.Destroy;
begin
  FreeAndNil(FTextLayout);
  inherited;
end;

procedure TIMETextLayout.DrawBackground(const ACanvas: TCanvas);
const
  LightTextThreshold = 0.5;
var
  BackgroundRect: TRectF;
  Line: TIMEParagraphLine;
  NeedExpandBackground: Boolean;
begin
  if Luminance(FTextLayout.Color) > LightTextThreshold then
    ACanvas.Fill.Color := FDarkBackgroundColor
  else
    ACanvas.Fill.Color := FLightBackgroundColor;

{$IF DEFINED(MACOS) AND DEFINED(IOS)}
  NeedExpandBackground := Length(FLines) = 1;
{$ELSE}
  NeedExpandBackground := False;
{$ENDIF}
  for Line in Lines do
  begin
    BackgroundRect := Line.LineRect;
    if NeedExpandBackground then
      BackgroundRect.Inflate(FExpandBackgroundMargins.Left, FExpandBackgroundMargins.Top,
                             FExpandBackgroundMargins.Right, FExpandBackgroundMargins.Bottom)
    else
      BackgroundRect.Inflate(0, 0, 0, MaxThickness);
    if IsZero(FBackgroundCornerRadius) then
      ACanvas.FillRect(BackgroundRect, MarkedTextBackgroundOpacity * FOpacity)
    else
      ACanvas.FillRect(BackgroundRect, FBackgroundCornerRadius, FBackgroundCornerRadius, AllCorners, MarkedTextBackgroundOpacity * FOpacity);
  end;
end;

procedure TIMETextLayout.DrawLines(const ACanvas: TCanvas);
var
  Line: TIMEParagraphLine;
begin
  FTextLayout.Opacity := FOpacity;
  FTextLayout.MaxSize := FMaxSize;
  for Line in Lines do
  begin
    FTextLayout.Text := FText.Substring(Line.Range.Pos, Line.Range.Length);
    FTextLayout.TopLeft := Line.LineRect.TopLeft;
    FTextLayout.RenderLayout(ACanvas);
    UnderlineLine(ACanvas, Line.Range);
  end;
end;

procedure TIMETextLayout.EndUpdate;
begin
  FTextLayout.EndUpdate;
end;

function TIMETextLayout.GetAbsoluteTextRectFor(const ARegion: TRectF): TRectF;
begin
  Result := TRectF.Create(FTopLeft + ARegion.TopLeft, ARegion.Width, ARegion.Height);
end;

function TIMETextLayout.GetBoundsRect: TRectF;
var
  Metric: TIMEParagraphLine;
begin
  Result := TRectF.Create(FTopLeft, 0, 0);
  for Metric in Lines do
    Result := TRectF.Union(Result, Metric.LineRect);
end;

function TIMETextLayout.GetFont: TFont;
begin
  Result := FTextLayout.Font;
end;

function TIMETextLayout.GetLines: TIMEParagraphLines;
begin
  if FNeedRecalculate then
  begin
    RecalculateMetrics;
    FNeedRecalculate := False;
  end;

  Result := FLines;
end;

function TIMETextLayout.GetPositionPoint(const APos: Integer): TPointF;

  function FindMeasurement(const APos: Integer; out AMeasurement: TIMEParagraphLine): Boolean;
  var
    I: Integer;
  begin
    for I := Low(Lines) to High(Lines) do
      if Lines[I].Range.InRange(APos) then
      begin
        AMeasurement := Lines[I];
        Exit(True);
      end;

    Result := False;
  end;

  function LocatePosition(const AMeasurement: TIMEParagraphLine; const APos: Integer): TPointF;
  var
    Regions: TRegion;
  begin
    FTextLayout.TopLeft := AMeasurement.LineRect.TopLeft;
    FTextLayout.MaxSize := AMeasurement.LineRect.Size;
    FTextLayout.Text := FText.Substring(AMeasurement.Range.Pos, AMeasurement.Range.Length);

    Regions := FTextLayout.RegionForRange(TTextRange.Create(APos - AMeasurement.Range.Pos, 1));
    Result := Regions[0].TopLeft;
  end;

var
  Measurement: TIMEParagraphLine;
begin
  if FindMeasurement(APos, Measurement) then
    Result := LocatePosition(Measurement, APos)
  else if APos >= FText.Length then
  begin
    Measurement := FLines[High(FLines)];
    Result := LocatePosition(Measurement, APos);
  end
  else
    Result := TPointF.Zero;
end;

function TIMETextLayout.GetRightToLeft: Boolean;
begin
  Result := FTextLayout.RightToLeft;
end;

function TIMETextLayout.GetTextRangeFor(const ARegion: TRectF): TTextRange;
var
  StartPos: Integer;
  EndPos: Integer;
begin
  StartPos := FTextLayout.PositionAtPoint(TPointF.Create(0, ARegion.CenterPoint.Y));
  if StartPos = -1 then
    StartPos := 0;
  EndPos := FTextLayout.PositionAtPoint(TPointF.Create(ARegion.Width, ARegion.CenterPoint.Y));
  if EndPos = -1 then
    EndPos := 1;

  Result.Pos := StartPos;
  Result.Length := EndPos - StartPos;
end;

class function TIMETextLayout.MarkedTextAttributeToStrokeDash(const AAttribute: TMarkedTextAttribute): TStrokeDash;
begin
{$IFDEF MSWINDOWS}
  case AAttribute of
    TMarkedTextAttribute.Input:
      Result := TStrokeDash.Dash;
    TMarkedTextAttribute.TargetConverted,
    TMarkedTextAttribute.Converted,
    TMarkedTextAttribute.TargetNotConverted:
      Result := TStrokeDash.Solid;
    TMarkedTextAttribute.InputError:
      Result := TStrokeDash.Dot
  else
    Result := TStrokeDash.Solid;
  end;
{$ELSE}
  Result := TStrokeDash.Solid;
{$ENDIF}
end;

class function TIMETextLayout.MarkedTextAttributeToThickness(const AAttribute: TMarkedTextAttribute): Single;
begin
{$IFDEF MSWINDOWS}
  case AAttribute of
    TMarkedTextAttribute.Input,
    TMarkedTextAttribute.Converted,
    TMarkedTextAttribute.InputError:
      Result := 1;
    TMarkedTextAttribute.TargetConverted:
      Result := 2;
    TMarkedTextAttribute.TargetNotConverted:
      Result := 4;
  else
    Result := 1;
  end;
{$ELSE}
  {$IFDEF MACOS}
  case AAttribute of
    TMarkedTextAttribute.Converted:
      Result := 1;
    TMarkedTextAttribute.TargetNotConverted:
      Result := 2;
  else
    Result := 1;
  end;
  {$ELSE}
  Result := 1; 
  {$ENDIF}
{$ENDIF}
end;

procedure TIMETextLayout.RecalculateMetrics;
var
  Regions: TRegion;
  Region: TRectF;
  I: Integer;
  FirstLine: TIMEParagraphLine;
  Range: TTextRange;
begin
  FTextLayout.BeginUpdate;
  try
    FTextLayout.TopLeft := TPointF.Zero;
    FTextLayout.WordWrap := True;
    FTextLayout.MaxSize := TSizeF.Create(FMaxSize.Width - FFirstLineOffset, FMaxSize.Height);
    FTextLayout.Text := FText;
  finally
    FTextLayout.EndUpdate;
  end;

  Regions := FTextLayout.RegionForRange(TTextRange.Create(0, FText.Length));
  if Length(Regions) = 0 then
  begin
    FTextLayout.MaxSize := TSizeF.Create(FMaxSize.Width, Single.MaxValue);
    Regions := FTextLayout.RegionForRange(TTextRange.Create(0, FText.Length));
    SetLength(FLines, Length(Regions));
    for I := Low(Regions) to High(Regions) do
    begin
      Region := Regions[I];
      FLines[I].LineRect := GetAbsoluteTextRectFor(Region);
      FLines[I].Range := GetTextRangeFor(Region);
    end;
  end
  else
  begin
    SetLength(FLines, 1);
    Region := Regions[0];
    FLines[0].Range := GetTextRangeFor(Region);
    FLines[0].LineRect := TRectF.Create(FTopLeft + Region.TopLeft + TPointF.Create(FFirstLineOffset, 0), Region.Width, Region.Height);

    if Length(Regions) > 1 then
    begin
      FirstLine := FLines[0];

      FTextLayout.MaxSize := TSizeF.Create(FMaxSize.Width, Single.MaxValue);
      FTextLayout.Text := FText.Substring(FLines[0].Range.Length);
      Regions := FTextLayout.RegionForRange(TTextRange.Create(0, FText.Length));

      SetLength(FLines, Length(Regions) + 1);
      for I := Low(Regions) to High(Regions) do
      begin
        Region := Regions[I];
        Range := GetTextRangeFor(Region);
        FLines[I + 1].Range := TTextRange.Create(FirstLine.Range.Pos + FirstLine.Range.Length + Range.Pos, Range.Length);
        FLines[I + 1].LineRect := TRectF.Create(FTopLeft + Region.TopLeft + TPointF.Create(0, FirstLine.LineRect.Height), Region.Width, Region.Height);
      end;
    end;
  end;
end;

procedure TIMETextLayout.Render(const ACanvas: TCanvas);
begin
  if ACanvas = nil then
    raise EArgumentNilException.CreateResFmt(@SWrongParameter, ['ACanvas']);

  DrawBackground(ACanvas);
  DrawLines(ACanvas);
end;

procedure TIMETextLayout.SetFont(const Value: TFont);
begin
  FTextLayout.Font := Value;
  FNeedRecalculate := True;
end;

procedure TIMETextLayout.SetMaxSize(const Value: TSizeF);
begin
  if FMaxSize <> Value then
  begin
    FMaxSize := Value;
    FNeedRecalculate := True;
  end;
end;

procedure TIMETextLayout.SetRightToLeft(const Value: Boolean);
begin
  FTextLayout.RightToLeft := Value;
end;

procedure TIMETextLayout.SetText(const Value: string);
begin
  FText := Value;
  FNeedRecalculate := True;
end;

procedure TIMETextLayout.SetColor(const Value: TAlphaColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FTextLayout.Color := Value;
  end;
end;

procedure TIMETextLayout.SetOpacity(const Value: Single);
begin
  if not SameValue(FOpacity, Value) then
  begin
    FOpacity := Max(0, Value);
    FTextLayout.Opacity := FOpacity;
  end;
end;

procedure TIMETextLayout.SetTopLeft(const Value: TPointF);
begin
  if FTopLeft <> Value then
  begin
    FTopLeft := Value;
    FNeedRecalculate := True;
  end;
end;

procedure TIMETextLayout.UnderlineLine(const ACanvas: TCanvas; const ARange: TTextRange);
var
  SavedState: TCanvasSaveState;
  I: Integer;
  Attributes: TArray<TMarkedTextAttribute>;
  GroupRange: TTextRange;
  Region: TRegion;
  NeedAddSpace: Boolean;
  MaxValue: Integer;
begin
  SavedState := ACanvas.SaveState;
  try
    ACanvas.Stroke.Assign(ACanvas.Fill);
    ACanvas.Stroke.Color := FTextLayout.Color;

    GroupRange := TTextRange.Create(0, 0);
    Attributes := FMarkedTextAttributes;
    MaxValue := Min(High(Attributes), ARange.Pos + ARange.Length - 1);
    for I := ARange.Pos to MaxValue do
    begin
      ApplyMarkedTextAttribute(ACanvas, Attributes[I]);

      if (I < High(Attributes)) and (Attributes[I] <> Attributes[I + 1]) or (I = MaxValue) then
      begin
        GroupRange.Length := I - GroupRange.Pos + 1 - ARange.Pos;
        Region := FTextLayout.RegionForRange(GroupRange);
      {$IFDEF MACOS}
        NeedAddSpace := Attributes[I] = TMarkedTextAttribute.TargetNotConverted;
      {$ELSE}
        NeedAddSpace := False;
      {$ENDIF}
        UnderlineRegion(ACanvas, Region, NeedAddSpace);
        GroupRange := TTextRange.Create(I + 1 - ARange.Pos, 0);
      end;
    end;
  finally
    ACanvas.RestoreState(SavedState);
  end;
end;

procedure TIMETextLayout.UnderlineRegion(const ACanvas: TCanvas; const ARegions: TRegion; const ANeedAddSpace: Boolean);
var
  I: Integer;
  Region: TRectF;
  HalfThickness: Single;
  StartPoint, EndPoint: TPointF;
  Thickness: Single;
  ShrinkValue: Integer;
begin
  Thickness := ACanvas.Stroke.Thickness;
  HalfThickness := Thickness / 2;
  ShrinkValue := IFThen(ANeedAddSpace, 1, 0);

  for I := Low(ARegions) to High(ARegions) do
  begin
    Region := ACanvas.AlignToPixel(ARegions[I]);
    Region.Offset(0, Thickness);

    StartPoint := TPointF.Create(Region.Left, Region.Bottom);
    StartPoint.Offset(ShrinkValue, -HalfThickness);
    EndPoint := Region.BottomRight;
    EndPoint.Offset(-ShrinkValue, -HalfThickness);
    ACanvas.DrawLine(StartPoint, EndPoint, Opacity);
  end;
end;

end.
