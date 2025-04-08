{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.LinesLayout;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Generics.Collections, FMX.TextLayout, FMX.Graphics, FMX.Text, FMX.ScrollBox.Style, FMX.Types;

type

{ Lines layout }

  ///<summary>Visual presentation single rendering text-line.</summary>
  TLineObject = class
  public type
    TState = (InvalidSize, InvalidPositionByX, InvalidPositionByY, InvalidLayout);
    TStates = set of TState;
    TRenderingMode = (MatchToLineTop, MatchLayoutToLineRect);
  private
    FLayout: TTextLayout;
    FRect: TRectF;
    FState: TStates;
    FRenderingMode: TRenderingMode;
    procedure SetRect(const Value: TRectF);
    function GetSize: TSizeF;
    procedure SetSize(const Value: TSizeF);
    procedure SetLocation(const Value: TPointF);
    function GetLocation: TPointF;
    procedure SetLayout(const Value: TTextLayout);
    procedure SetRenderingMode(const Value: TRenderingMode);
  protected
    procedure DoRender(const ACanvas: TCanvas); virtual;
    procedure UpdateLayoutTopLeft;
  public
    constructor Create; overload;
    destructor Destroy; override;

    procedure ReleaseLayoutIfNotVisible(const AViewportRect: TRectF);
    function IsVisible(const AViewportRect: TRectF): Boolean;
    function IsVerticallyIn(const AViewportRect: TRectF): Boolean;
    function IsInvalidPosition: Boolean;
    function ContainsPoint(const AHitPoint: TPointF): Boolean;

    ///<summary>Reset current size and line rectangle if line parameters were changed.</summary>
    procedure InvalidateSize;
    procedure InvalidatePosition;
    procedure InvalidateLayout;
    procedure Invalidate;

    procedure Render(const ACanvas: TCanvas);

    function ToString: string; override;
  public
    property State: TStates read FState;
    property Size: TSizeF read GetSize write SetSize;
    property Rect: TRectF read FRect write SetRect;
    property RenderingMode: TRenderingMode read FRenderingMode write SetRenderingMode;
    property Location: TPointF read GetLocation write SetLocation;
    property Layout: TTextLayout read FLayout write SetLayout;
  end;

  /// <summary>
  ///   Providing a bridge between lines of text and the visual lines representation. This class is responsible for
  ///   calculating line sizes, alignment, calculating the area for text output, as well as optimization for
  ///   quick edits on large texts.
  /// </summary>
  TLinesLayout = class
  public const
    DefaultMaskChar = '*';
    DefaultCaretWidth = 1;
    {$REGION 'Debuggging'}
    class var DebugDrawLinesBounds: Boolean;
    class var DebugDrawContentSize: Boolean;
    {$ENDREGION}
  private type
    TState = (NeedAlignmentByX, NeedAlignmentByY, ContentSizeChanged);
    TStates = set of TState;
  private
    FLinesSource: ITextLinesSource;
    FScrollableContent: IScrollableContent;
    FLineHeight: Single;
    FLines: TObjectList<TLineObject>;
    FViewportRect: TRectF;
    FContentSize: TSizeF;
    FNeedMaskContent: Boolean;
    FMaskChar: Char;
    FIsRightToLeft: Boolean;
    FIsMultiLineMode: Boolean;
    { Optimization }
    FState: TStates;
    FUpdating: Integer;
    FFirstVisibleLineIndex: Integer;
    FLastVisibleLineIndex: Integer;
    { Appearance }
    FTextSettings: TTextSettings;
    FCaretWidth: Single;
    FOpacity: Single;
    procedure SetOpacity(const Value: Single);
    procedure SetTextSettings(const Value: TTextSettings);
    procedure SetViewportRect(const Value: TRectF);
    procedure SetCaretWidth(const Value: Single);
    procedure SetNeedMaskContent(const Value: Boolean);
    procedure SetMaskChar(const Value: Char);
    procedure SetIsRightToLeft(const Value: Boolean);
    function CreateLayout(const ALineIndex: Integer; const S: string): TTextLayout;
    procedure UpdateLayoutsColor;
    function GetCount: Integer;
    function GetItem(const Index: Integer): TLineObject;
    procedure SetContentSize(const AContentSize: TSizeF);
    function GetHorzAlignRTL: TTextAlign;
    { Handlers }
    procedure TextSettingsChanged(Sender: TObject);
  protected
    { Working with TTextLayout }

    procedure RefreshLineLayout(const ALineIndex: Integer);
    procedure UpdateLayoutParams(const ALineIndex: Integer; const ALayout: TTextLayout); virtual;
    function CreateLineLayoutIfNotCreated(const ALineIndex: Integer): TTextLayout;
    procedure CreateLayoutsForVisibleLinesIfNotCreated;

    { Calculation measurements }

    procedure CalculateLineSize(const ALineIndex: Integer);
    procedure CalculateLinesX;
    procedure CalculateLineX(const ALineIndex: Integer);
    procedure CalculateLineY(const ALineIndex: Integer);
    procedure OffsetLinesYFrom(const ALineIndex: Integer; const AOffset: Single);
    procedure OffsetLinesLocationBetween(const AStartLineIndex, AEndLineIndex: Integer; const AOffsetY: Single);
    /// <summary>Returns caret position by <c>AHitPoint</c>.</summary>
    /// <remarks>Specified line has to contain <c>AHitPoint</c>, otherwise it returns invalid caret position.</remarks>
    function GetCaretPositionByPointInLine(const ALineIndex: Integer; const AHitPoint: TPointF; const ARoundToWord: Boolean = False): TCaretPosition;

    { Optimization }

    /// <summary>Recalculates indexes of visible lines.</summary>
    procedure UpdateVisibleIndexes;
    procedure MarkInvalidatePositionFrom(const AFromIndex: Integer);
    procedure MarkForRealign;

    function ApplyMaskIfRequired(const AText: string): string; virtual;
    function RenderingMode: TLineObject.TRenderingMode;
  public
    constructor Create(const ALineSource: ITextLinesSource; const AScrollableContent: IScrollableContent);
    destructor Destroy; override;

    { Control updating process }

    /// <summary>
    ///   Begins updating process. During the update process, all line alignment and calculation operations are suspended.
    /// </summary>
    procedure BeginUpdate;
    /// <summary>Ends updating process. At the end, performs text alignment if it's required.</summary>
    procedure EndUpdate;
    function IsUpdating: Boolean;

    { Lines changes notifications }

    procedure InsertLine(const AIndex: Integer; const ALine: string); virtual;
    procedure DeleteLine(const AIndex: Integer); virtual;
    procedure ReplaceLine(const AIndex: Integer; const ALine: string); virtual;
    procedure ExchangeLines(const AOldIndex, ANewIndex: Integer); virtual;
    procedure Clear; virtual;

    /// <summary>Returns default line height according to current text decoration settings.</summary>
    function GetLineHeight: Single; overload;
    /// <summary>
    ///   Returns default line height according to current text decoration settings for specified line index.
    /// </summary>
    function GetLineHeight(const AIndex: Integer): Single; overload;
    /// <summary>Should be used word wrap for displaying lines?</summary>
    /// <remarks>
    ///   The WordWrap is always enabled in case of usage multiline text with center or right text alignment.
    /// </remarks>
    function IsWordWrap: Boolean;
    /// <summary>Is the left alignment of the text used taking into account RTL?</summary>
    function IsLeftAlignment: Boolean;

    { Caret support }

    /// <summary>Get line number and position in line by the hit point in the content coordinates system.</summary>
    function GetCaretPositionByPoint(const AHitPoint: TPointF; const RoundToWord: Boolean = False): TCaretPosition;
    /// <summary>Returns coordinates of caret point by <c>ACaretPos</c>.</summary>
    function GetPointByCaretPosition(const ACaretPosition: TCaretPosition): TPointF;
    /// <summary>
    ///  Get the coordinates on the region that holds range of text starting from defined line, position in
    ///  that line and the defined length.
    /// </summary>
    function GetRegionForRange(const ACaretPosition: TCaretPosition; const ALength: Integer; const RoundToWord: Boolean = False): TRegion;

    { Layout }

    /// <summary>Recalculates and layout text lines.</summary>
    procedure Realign;
    /// <summary>Starts lines alignment if it's required.</summary>
    procedure RealignIfNeeded;

    { Painting }

    /// <summary>Renders visible lines in <c>ViewportRect</c>.</summary>
    procedure Render(const ACanvas: TCanvas);
  public
    /// <summary>Access to line data.</summary>
    property Items[const Index: Integer]: TLineObject read GetItem; default;
    /// <summary>Lines count. A string with all breaks is counted as one.</summary>
    property Count: Integer read GetCount;
    /// <summary>Index of the first visible line in the <c>ViewportRect</c>.</summary>
    /// <remarks>Returns -1, if there are no lines. Can return invalid value, if <c>IsUpdating</c> is <c>true</c>.</remarks>
    property FirstVisibleLineIndex: Integer read FFirstVisibleLineIndex;
    /// <summary>Index of the last visible line in the <c>ViewportRect</c>.</summary>
    /// <remarks>Returns -1, if there are no lines. Can return invalid value, if <c>IsUpdating</c> is <c>true</c>.</remarks>
    property LastVisibleLineIndex: Integer read FLastVisibleLineIndex;
    /// <summary>Target text horizontal alignment with accounting RightToLeft languages.</summary>
    property HorzAlignRTL: TTextAlign read GetHorzAlignRTL;
    /// <summary>
    ///   Special mode for displaying multiline text. In this mode, word wrapping is forcibly used when the lines are
    ///   aligned right and center. This is due to optimizing the calculation of a large number of lines.
    /// </summary>
    /// <remarks>If you display only one line, then disable it.</remarks>
    property IsMultiLine: Boolean read FIsMultiLineMode write FIsMultiLineMode;
    /// <summary>Should be used Right-To-Left alignment?</summary>
    property IsRightToLeft: Boolean read FIsRightToLeft write SetIsRightToLeft;
    /// <summary>
    ///   Masking character. Used to replace characters in a string with this character. By default, it is used "*".
    /// </summary>
    /// <remarks>
    ///   It is used only when the masking mode is enabled <c>NeedMaskContent = True</c>.
    /// </remarks>
    property MaskChar: Char read FMaskChar write SetMaskChar;
    /// <summary>Do layout need to mask strings and replace all characters with <c>MaskChar</c>?</summary>
    property NeedMaskContent: Boolean read FNeedMaskContent write SetNeedMaskContent;
    /// <summary>
    ///   Caret width. It is used to correctly calculate the size of the content so that the carriage is not cut off
    ///   at the border.
    /// </summary>
    property CaretWidth: Single read FCaretWidth write SetCaretWidth;
    property Opacity: Single read FOpacity write SetOpacity;
    property TextSettings: TTextSettings read FTextSettings write SetTextSettings;
    /// <summary>Calculated text size.</summary>
    property ContentSize: TSizeF read FContentSize;
    /// <summary>
    ///   The current bounds of the Viewport in the coordinates of the content. Used to optimize and free up resources
    ///   for invisible lines.
    /// </summary>
    property ViewportRect: TRectF read FViewportRect write SetViewportRect;
    property LinesSource: ITextLinesSource read FLinesSource;
    property ScrollableContent: IScrollableContent read FScrollableContent;
  end;

implementation

uses
  System.Math, System.Math.Vectors, System.SysUtils, System.TypInfo, System.UITypes, FMX.Consts;

{ TLineObject }

function TLineObject.ContainsPoint(const AHitPoint: TPointF): Boolean;
begin
  Result := ((AHitPoint.Y > FRect.Top) or SameValue(AHitPoint.Y, FRect.Top, TEpsilon.Position)) and
            ((AHitPoint.Y < FRect.Bottom) or SameValue(AHitPoint.Y, FRect.Bottom, TEpsilon.Position));
end;

constructor TLineObject.Create;
begin
  inherited Create;
  FLayout := nil;
  FRect := TRectF.Empty;
  FState := [TState.InvalidSize, TState.InvalidPositionByX, TState.InvalidPositionByY, TState.InvalidLayout];
  FRenderingMode := TRenderingMode.MatchToLineTop;
end;

destructor TLineObject.Destroy;
begin
  FreeAndNil(FLayout);
  inherited;
end;

procedure TLineObject.DoRender(const ACanvas: TCanvas);
begin
  FLayout.RenderLayout(ACanvas);
end;

function TLineObject.GetLocation: TPointF;
begin
  Result := FRect.TopLeft;
end;

function TLineObject.GetSize: TSizeF;
begin
  Result := FRect.Size;
end;

procedure TLineObject.Invalidate;
begin
  InvalidateLayout;
  InvalidateSize;
  InvalidatePosition;
end;

procedure TLineObject.InvalidateLayout;
begin
  if Layout <> nil then
    Include(FState, TState.InvalidLayout);
end;

procedure TLineObject.InvalidatePosition;
begin
  Include(FState, TState.InvalidPositionByX);
  Include(FState, TState.InvalidPositionByY);
end;

procedure TLineObject.InvalidateSize;
begin
  Include(FState, TState.InvalidSize);
end;

procedure TLineObject.ReleaseLayoutIfNotVisible(const AViewportRect: TRectF);
begin
  if not IsVisible(AViewportRect) then
    FreeAndNil(FLayout);
end;

procedure TLineObject.Render(const ACanvas: TCanvas);

  procedure DrawLineBounds(const ABounds: TRectF);
  begin
    ACanvas.Stroke.Kind := TBrushKind.Solid;
    ACanvas.Stroke.Color := TAlphaColorRec.Red;
    ACanvas.DrawRect(ABounds, 0, 0, AllCorners, 1);
  end;

begin
  if FLayout <> nil then
    DoRender(ACanvas);

  if TLinesLayout.DebugDrawLinesBounds then
    DrawLineBounds(FRect);
end;

procedure TLineObject.SetLayout(const Value: TTextLayout);
begin
  FLayout := Value;
  UpdateLayoutTopLeft;
end;

procedure TLineObject.SetLocation(const Value: TPointF);
begin
  FRect.Location := Value;
  UpdateLayoutTopLeft;
end;

procedure TLineObject.SetRect(const Value: TRectF);
begin
  FRect := Value;
  UpdateLayoutTopLeft;
end;

procedure TLineObject.SetRenderingMode(const Value: TRenderingMode);
begin
  FRenderingMode := Value;
end;

procedure TLineObject.SetSize(const Value: TSizeF);
begin
  FRect.Size := Value;
end;

function TLineObject.ToString: string;
var
  RenderingModeStr: string;
begin
  RenderingModeStr := GetEnumName(TypeInfo(TRenderingMode), Ord(FRenderingMode));
  Result := Format('TLineObject{RenderingMode=%s, Rect=(%f, %f, %f x %f)}', [RenderingModeStr, FRect.Left, FRect.Top, FRect.Width, FRect.Height]);
end;

procedure TLineObject.UpdateLayoutTopLeft;
begin
  if FLayout = nil then
    Exit;
  case FRenderingMode of
    TRenderingMode.MatchToLineTop:
      FLayout.TopLeft := TPointF.Create(0, FRect.Top);
    TRenderingMode.MatchLayoutToLineRect:
      FLayout.TopLeft := FRect.TopLeft;
  end;
end;

function TLineObject.IsInvalidPosition: Boolean;
begin
  Result := (TLineObject.TState.InvalidPositionByX in FState) and (TLineObject.TState.InvalidPositionByY in FState)
end;

function TLineObject.IsVerticallyIn(const AViewportRect: TRectF): Boolean;
begin
  Result := (FRect.Top < AViewportRect.Bottom) and (FRect.Bottom > AViewportRect.Top);
end;

function TLineObject.IsVisible(const AViewportRect: TRectF): Boolean;
begin
  Result := IntersectRect(AViewportRect, Rect);
end;

{ TLinesLayout }

function TLinesLayout.ApplyMaskIfRequired(const AText: string): string;
begin
  if FNeedMaskContent then
    Result := string.Create(MaskChar, AText.Length)
  else
    Result := AText;

  Assert(AText.Length = Result.Length);
end;

procedure TLinesLayout.BeginUpdate;
begin
  Inc(FUpdating);
end;

procedure TLinesLayout.CalculateLineY(const ALineIndex: Integer);
var
  Line: TLineObject;
  LineTop: Single;
begin
  Line := FLines[ALineIndex];

  if ALineIndex = 0 then
    LineTop := 0
  else
    LineTop := FLines[ALineIndex - 1].Rect.Bottom;

  Line.Location := TPointF.Create(Line.Location.X, LineTop);
  Exclude(Line.FState, TLineObject.TState.InvalidPositionByY);
end;

procedure TLinesLayout.CalculateLineSize(const ALineIndex: Integer);
var
  Layout: TTextLayout;
  Line: TLineObject;
begin
  Line := FLines[ALineIndex];

  CreateLineLayoutIfNotCreated(ALineIndex);
  Layout := Line.Layout;
  Line.Size := TSizeF.Create(Max(1, Layout.Width), Layout.Height);
  Line.ReleaseLayoutIfNotVisible(ViewportRect);
  Exclude(Line.FState, TLineObject.TState.InvalidSize);
end;

procedure TLinesLayout.CalculateLinesX;
var
  I: Integer;
begin
  try
    for I := 0 to FLines.Count - 1 do
      CalculateLineX(I);
  finally
    Exclude(FState, TState.NeedAlignmentByX);
  end;
end;

procedure TLinesLayout.CalculateLineX(const ALineIndex: Integer);
var
  Line: TLineObject;
  ContentCenterX: Extended;
  LContentWidth: Single;
begin
  Line := FLines[ALineIndex];
  case HorzAlignRTL of
    TTextAlign.Leading:
      Line.Location := TPointF.Create(0, Line.Rect.Top);

    TTextAlign.Center:
    begin
      LContentWidth := Max(ContentSize.Width, ViewportRect.Width - 1);
      ContentCenterX := LContentWidth / 2;
      Line.Location := TPointF.Create(ContentCenterX - Line.Size.Width / 2, Line.Rect.Top);
    end;

    TTextAlign.Trailing:
    begin
      LContentWidth := Max(ContentSize.Width, ViewportRect.Width);
      Line.Location := TPointF.Create(LContentWidth - Line.Size.Width, Line.Rect.Top);
    end;
  end;

  Exclude(Line.FState, TLineObject.TState.InvalidPositionByX);
end;

procedure TLinesLayout.Clear;
begin
  FLines.Clear;
  UpdateVisibleIndexes;
  if IsUpdating then
  begin
    Include(FState, TState.ContentSizeChanged);
    Include(FState, TState.NeedAlignmentByX);
    Include(FState, TState.NeedAlignmentByY);
  end
  else
    SetContentSize(TSizeF.Create(0, 0));
end;

constructor TLinesLayout.Create(const ALineSource: ITextLinesSource; const AScrollableContent: IScrollableContent);
begin
  inherited Create;
  FLines := TObjectList<TLineObject>.Create;
  FLinesSource := ALineSource;
  FScrollableContent := AScrollableContent;
  FLineHeight := InvalidSize.Height;
  FUpdating := 0;
  FTextSettings := TTextSettings.Create(nil);
  FTextSettings.OnChanged := TextSettingsChanged;
  FFirstVisibleLineIndex := -1;
  FLastVisibleLineIndex := -1;
  FContentSize := TSizeF.Create(0, 0);
  FMaskChar := DefaultMaskChar;
  FIsMultiLineMode := True;
end;

function TLinesLayout.CreateLayout(const ALineIndex: Integer; const S: string): TTextLayout;
begin
  Result := TTextLayoutManager.DefaultTextLayout.Create;
  Result.BeginUpdate;
  try
    UpdateLayoutParams(ALineIndex, Result);
    if S.IsEmpty then
      // Setting some string if text is empty to recreate layout,
      // if other properties have default values
      Result.Text := ' ';
    Result.Text := S;
  finally
    Result.EndUpdate;
  end;
end;

procedure TLinesLayout.CreateLayoutsForVisibleLinesIfNotCreated;
var
  I: Integer;
begin
  for I := Max(0, FFirstVisibleLineIndex) to Min(FLastVisibleLineIndex, Count - 1) do
    CreateLineLayoutIfNotCreated(I);
end;

function TLinesLayout.CreateLineLayoutIfNotCreated(const ALineIndex: Integer): TTextLayout;
var
  Line: TLineObject;
begin
  Line := FLines[ALineIndex];
  if Line.Layout = nil then
  begin
    Line.Layout := CreateLayout(ALineIndex, ApplyMaskIfRequired(FLinesSource[ALineIndex]));
    Exclude(Line.FState, TLineObject.TState.InvalidLayout);
  end;
  Result := Line.Layout;
end;

function TLinesLayout.GetPointByCaretPosition(const ACaretPosition: TCaretPosition): TPointF;

  function GetDefaultCaretPos: TPointF;
  begin
    case HorzAlignRTL of
      TTextAlign.Leading:
        Result := TPointF.Zero;
      TTextAlign.Center:
        Result := TPointF.Create(FViewportRect.CenterPoint.X, 0);
      TTextAlign.Trailing:
        Result := TPointF.Create(FViewportRect.Right - FCaretWidth, 0);
    else
      Result := TPointF.Zero;
    end;
  end;

var
  Region: TRegion;
begin
  Region := GetRegionForRange(ACaretPosition, 1);
  if Length(Region) > 0 then
    Result := Region[0].TopLeft
  else
    Result := GetDefaultCaretPos;
end;

function TLinesLayout.GetCaretPositionByPointInLine(const ALineIndex: Integer; const AHitPoint: TPointF; const ARoundToWord: Boolean): TCaretPosition;
var
  Line: TLineObject;
  Layout: TTextLayout;
  CenteredHitPoint: TPointF;
begin
  if not InRange(ALineIndex, 0, Count - 1) then
    Exit(TCaretPosition.Invalid);

  Line := FLines[ALineIndex];
  Layout := CreateLineLayoutIfNotCreated(ALineIndex);
  try
    if AHitPoint.Y < Line.Rect.Top then
      // Above
      CenteredHitPoint := TPointF.Create(AHitPoint.X, Line.Rect.Top + GetLineHeight(ALineIndex) / 2)
    else
      // Under
      CenteredHitPoint := TPointF.Create(AHitPoint.X, Line.Rect.Bottom - GetLineHeight(ALineIndex) / 2);

    Result.Line := ALineIndex;
    Result.Pos := Layout.PositionAtPoint(CenteredHitPoint, ARoundToWord);
  finally
    Line.ReleaseLayoutIfNotVisible(ViewportRect);
  end;

  if Result.Pos <> -1 then
    Exit;

  // If Point out of Line bounds, Trying to round the position to the border values
  if CenteredHitPoint.X < Line.Rect.Left then
    Result.Pos := 0
  else
    Result.Pos := FLinesSource[ALineIndex].Length;
end;

function TLinesLayout.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TLinesLayout.GetHorzAlignRTL: TTextAlign;
begin
  if IsRightToLeft then
    case FTextSettings.HorzAlign of
      TTextAlign.Leading:
        Result := TTextAlign.Trailing;
      TTextAlign.Trailing:
        Result := TTextAlign.Leading;
    else
      Result := FTextSettings.HorzAlign;
    end
  else
    Result := FTextSettings.HorzAlign;
end;

function TLinesLayout.GetItem(const Index: Integer): TLineObject;
begin
  Result := FLines[Index];
end;

function TLinesLayout.GetLineHeight(const AIndex: Integer): Single;
begin
                                                                                               
  Result := GetLineHeight;
end;

function TLinesLayout.GetLineHeight: Single;
begin
  if FLineHeight <= 0 then
  begin
    TCanvasManager.MeasureCanvas.Font.Assign(FTextSettings.Font);
    FLineHeight := Round(TCanvasManager.MeasureCanvas.TextHeight('Ply|'));
  end;
  Result := FLineHeight;
end;

function TLinesLayout.GetCaretPositionByPoint(const AHitPoint: TPointF; const RoundToWord: Boolean): TCaretPosition;
var
  Point: TPointF;
  I: Integer;
  LPos: Integer;
  Rgn: TRegion;
  Line: TLineObject;
  Layout: TTextLayout;
begin
  Result := TCaretPosition.Invalid;
  if FLines.Count = 0  then
    Exit;

  for I := 0 to FLines.Count - 1 do
  begin
    Line := FLines[I];
    if not Line.ContainsPoint(AHitPoint) then
      Continue;

    Layout := CreateLineLayoutIfNotCreated(I);
    try
      Point := TPointF.Create(EnsureRange(AHitPoint.X, Layout.TextRect.Left, Layout.TextRect.Right), AHitPoint.Y);
      LPos := Layout.PositionAtPoint(Point, RoundToWord);
      if LPos < 0 then
      begin
        LPos := Layout.PositionAtPoint(TPointF.Create(AHitPoint.X, Layout.TextRect.Bottom - GetLineHeight(I) / 2), RoundToWord);
        if LPos < 0 then
          raise ETextLayoutException.Create(SPointInTextLayoutError);
      end;
      if LPos >= 0 then
      begin
        // If user uses WordWrap mode, line break location does not contain control symbols,
        // so we shouldn't consider them.
        if (LPos > 0) and not IsWordWrap then
        begin
          Rgn := Layout.RegionForRange(TTextRange.Create(LPos, 1), RoundToWord);
          if (Length(Rgn) > 0) and (Rgn[0].Top > AHitPoint.Y) then
            Dec(LPos);
        end;
        Result := TCaretPosition.Create(I, LPos);
        Exit;
      end;
    finally
      Line.ReleaseLayoutIfNotVisible(ViewportRect);
    end;
  end;
  // We don't find caret position, So last try to determinate it
  if AHitPoint.Y > FLines.Last.Rect.Bottom then
    // Below
    Result := GetCaretPositionByPointInLine(FLines.Count - 1, AHitPoint)
  else
    // Above
    Result := GetCaretPositionByPointInLine(0, AHitPoint);
end;

function TLinesLayout.GetRegionForRange(const ACaretPosition: TCaretPosition; const ALength: Integer; const RoundToWord: Boolean): TRegion;
var
  I, J: Integer;
  LPos, RemainLength, LLength, LineLength: Integer;
  Layout: TTextLayout;
  LRegion: TRegion;
  Line: TLineObject;
begin
  SetLength(Result, 0);
  if not InRange(ACaretPosition.Line, 0, FLines.Count - 1) then
    Exit;

  LPos := ACaretPosition.Pos;
  RemainLength := ALength;
  for I := ACaretPosition.Line to FLines.Count - 1 do
  begin
    // Checking layout for contains a part of requested range
    if RemainLength <= 0 then
      Break;

    Line := FLines[I];

    LineLength := FLinesSource[I].Length;
    LLength := Min(RemainLength, LineLength - LPos);

    CreateLineLayoutIfNotCreated(I);
    Layout := Line.Layout;
    try
      LRegion := Layout.RegionForRange(TTextRange.Create(LPos, LLength), RoundToWord);
      for J := 0 to High(LRegion) do
      begin
        SetLength(Result, Length(Result) + 1);
        Result[High(Result)] := LRegion[J];
        Result[High(Result)].Top := Max(FLines[I].Rect.Top, LRegion[J].Top);
        Result[High(Result)].Bottom := Min(FLines[I].Rect.Bottom, LRegion[J].Bottom);
      end;
    finally
      Line.ReleaseLayoutIfNotVisible(ViewportRect);
    end;

    Inc(LPos, LLength);
    if LPos >= LineLength then
    begin
      LPos := 0;
      Dec(RemainLength);
    end;
    Dec(RemainLength, LLength + FLinesSource.GetLineBreak.Length - 1);
  end;

  for I := Low(Result) to High(Result) do
    Result[I].Right := Min(Result[I].Right, TTextLayout.MaxLayoutSize.X);
end;

procedure TLinesLayout.DeleteLine(const AIndex: Integer);

  function CalculateContentWidth: Single;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to FLines.Count - 1 do
      Result := Max(Result, FLines[I].Size.Width);

    // We don't support word wrap mode for center text alignment for multiline text.
    if IsMultiLine then
      case HorzAlignRTL of
        TTextAlign.Center,
        TTextAlign.Trailing:
          Result := Max(Result, ViewportRect.Width);
      end;
  end;

var
  DeletedLineHeight: Single;
  NewContentSize: TSizeF;
begin
  DeletedLineHeight := FLines[AIndex].Size.Height;
  FLines.Delete(AIndex);

  if IsUpdating then
  begin
    Include(FState, TState.ContentSizeChanged);
    MarkForRealign;
    MarkInvalidatePositionFrom(AIndex);
  end
  else
  begin
    OffsetLinesYFrom(AIndex, -DeletedLineHeight);
    UpdateVisibleIndexes;

    if IsMultiLine or IsLeftAlignment then
    begin
      { Adjust content size}
      if DeletedLineHeight > 0 then
      begin
        NewContentSize.Height := ContentSize.Height - DeletedLineHeight;
        NewContentSize.Width := CalculateContentWidth;
        SetContentSize(NewContentSize);
      end;
    end
    else
    begin
      // Content Width depends on current line width
      Include(FState, TState.NeedAlignmentByX);
      Include(FState, TState.ContentSizeChanged);
      Realign;
    end;
  end;
end;

destructor TLinesLayout.Destroy;
begin
  FreeAndNil(FTextSettings);
  FreeAndNil(FLines);
  inherited;
end;

procedure TLinesLayout.EndUpdate;
begin
  if not IsUpdating then
    Exit;

  Dec(FUpdating);
  if not IsUpdating then
    RealignIfNeeded;
end;

procedure TLinesLayout.ExchangeLines(const AOldIndex, ANewIndex: Integer);

  procedure SwapLocation(const ALine1, ALine2: Integer);
  var
    Line1Pos: TPointF;
    Line1: TLineObject;
    Line2: TLineObject;
  begin
    Line1 := FLines[ALine1];
    Line2 := FLines[ALine2];

    Line1Pos := Line1.Location;
    Line1.Location := Line2.Location;
    Line2.Location := Line1Pos;
  end;

var
  MinIndex: Integer;
  MaxIndex: Integer;
  Offset: Single;
begin
  MinIndex := Min(AOldIndex, ANewIndex);
  MaxIndex := Max(AOldIndex, ANewIndex);
  if IsUpdating then
  begin
    FLines.Exchange(AOldIndex, ANewIndex);
    Include(FState, TState.NeedAlignmentByY);
    // We could mark only range of lines between AOldIndex, ANewIndex. Because lines outside the range do not change
    // their positions. But since we are using optimization in MarkInvalidatePositionFrom, based on the continuity
    // condition of TState.InvalidPosition, we don't do it.
    MarkInvalidatePositionFrom(MinIndex);
  end
  else
  begin
    Offset := FLines[MaxIndex].Size.Height - FLines[MinIndex].Size.Height;
    OffsetLinesLocationBetween(MinIndex, MaxIndex, Offset);

    FLines.Exchange(AOldIndex, ANewIndex);

    SwapLocation(MinIndex, MaxIndex);
    UpdateVisibleIndexes;
  end;
end;

procedure TLinesLayout.InsertLine(const AIndex: Integer; const ALine: string);
var
  NewLine: TLineObject;
  NewContentSize: TSizeF;
begin
  NewLine := TLineObject.Create;
  NewLine.RenderingMode := RenderingMode;
  FLines.Insert(AIndex, NewLine);
  if IsUpdating then
  begin
    MarkForRealign;
    Include(FState, TState.ContentSizeChanged);
    // New line affects only changes of positions on the next lines
    MarkInvalidatePositionFrom(AIndex + 1);
  end
  else
  begin
    CalculateLineSize(AIndex);
    CalculateLineY(AIndex);
    OffsetLinesYFrom(AIndex + 1, NewLine.Size.Height);
    UpdateVisibleIndexes;

    if IsMultiLine or IsLeftAlignment then
    begin
      { Adjust content size}
      NewContentSize.Height := ContentSize.Height + NewLine.Size.Height;
      NewContentSize.Width := Max(ContentSize.Width, NewLine.Size.Width);
      SetContentSize(NewContentSize);
    end
    else
    begin
      // Content Width can depend on current line width
      Include(FState, TState.ContentSizeChanged);
      Include(FState, TState.NeedAlignmentByX);
      Realign;
    end;
  end;
end;

function TLinesLayout.IsLeftAlignment: Boolean;
begin
  Result := HorzAlignRTL = TTextAlign.Leading;
end;

function TLinesLayout.IsUpdating: Boolean;
begin
  Result := FUpdating > 0;
end;

function TLinesLayout.IsWordWrap: Boolean;
begin
  Result := TextSettings.WordWrap or (not IsLeftAlignment and IsMultiline);
end;

procedure TLinesLayout.MarkForRealign;
begin
  Include(FState, TState.NeedAlignmentByX);
  Include(FState, TState.NeedAlignmentByY);
end;

procedure TLinesLayout.MarkInvalidatePositionFrom(const AFromIndex: Integer);
var
  I: Integer;
  Line: TLineObject;
begin
  for I := AFromIndex to Count - 1 do
  begin
    Line := FLines[I];
    if Line.IsInvalidPosition then
      Break;
    Line.InvalidatePosition;
  end;
end;

procedure TLinesLayout.OffsetLinesLocationBetween(const AStartLineIndex, AEndLineIndex: Integer; const AOffsetY: Single);
var
  I: Integer;
  Line: TLineObject;
begin
  if IsZero(AOffsetY) then
    Exit;

  for I := AStartLineIndex to AEndLineIndex do
  begin
    Line := FLines[I];
    Line.Location := Line.Location + TPointF.Create(0, AOffsetY);
    Line.ReleaseLayoutIfNotVisible(ViewportRect);
  end;
end;

procedure TLinesLayout.OffsetLinesYFrom(const ALineIndex: Integer; const AOffset: Single);
begin
  OffsetLinesLocationBetween(ALineIndex, FLines.Count - 1, AOffset);
end;

procedure TLinesLayout.Render(const ACanvas: TCanvas);

  procedure DrawContentBounds(const ABounds: TRectF);
  begin
    ACanvas.Stroke.Kind := TBrushKind.Solid;
    ACanvas.Stroke.Color := TAlphaColorRec.Blue;
    ACanvas.DrawRect(ABounds, 0, 0, AllCorners, 1);
  end;

var
  I: Integer;
begin
  for I := Max(0, FirstVisibleLineIndex) to Min(LastVisibleLineIndex, Count - 1) do
    Items[I].Render(ACanvas);

  if DebugDrawContentSize then
    DrawContentBounds(TRectF.Create(0, 0, ContentSize.Width, ContentSize.Height));
end;

function TLinesLayout.RenderingMode: TLineObject.TRenderingMode;
begin
  if IsMultiLine then
    RenderingMode := TLineObject.TRenderingMode.MatchToLineTop
  else
    RenderingMode := TLineObject.TRenderingMode.MatchLayoutToLineRect;
end;

procedure TLinesLayout.Realign;

  function LinesConvexHull: TSizeF;
  var
    I: Integer;
    TotalWidth: Single;
  begin
    TotalWidth := 0;
    for I := 0 to FLines.Count - 1 do
      TotalWidth := Max(FLines[I].Size.Width, TotalWidth);

    if FLines.Count > 0 then
      Result := TSizeF.Create(TotalWidth, FLines.Last.Rect.Bottom)
    else
      Result := TSizeF.Create(0, 0);
  end;

var
  I: Integer;
  Line: TLineObject;
  LContentSize: TSizeF;
begin
  if FLinesSource.Count <> FLines.Count then
    raise Exception.Create('Realign(): Text lines are not matching rendering lines');

  for I := 0 to FLines.Count - 1 do
  begin
    Line := FLines[I];
    if TLineObject.TState.InvalidLayout in Line.State then
      if Line.Layout = nil then
        CreateLineLayoutIfNotCreated(I)
      else
        RefreshLineLayout(I);

    if TLineObject.TState.InvalidSize in Line.State then
    begin
      Include(FState, TState.ContentSizeChanged);
      CalculateLineSize(I);
    end;

    if TLineObject.TState.InvalidPositionByY in Line.State then
    begin
      CalculateLineY(I);
      Include(FState, TState.ContentSizeChanged);
    end;

    Line.ReleaseLayoutIfNotVisible(ViewportRect);
  end;

  if FLines.Count = 0 then
    Include(FState, TState.ContentSizeChanged);

  if TState.ContentSizeChanged in FState then
  begin
    LContentSize := LinesConvexHull;
    if HorzAlignRTL <> TTextAlign.Leading then
      LContentSize.Width := Max(LContentSize.Width, ViewportRect.Width - 1);
    SetContentSize(LContentSize);
    CalculateLinesX;
    UpdateVisibleIndexes;
  end;

  if TState.NeedAlignmentByX in FState then
  begin
    CalculateLinesX;
    UpdateVisibleIndexes;
  end;

  FState := [];
end;

procedure TLinesLayout.RealignIfNeeded;
begin
  if [TState.NeedAlignmentByX, TState.NeedAlignmentByY] * FState = [] then
    Exit;

  Realign;
end;

procedure TLinesLayout.ReplaceLine(const AIndex: Integer; const ALine: string);
var
  Line: TLineObject;
  OldLineHeight: Single;
  NewContentSize: TSizeF;
  HeightOffset: Single;
begin
  Line := FLines[AIndex];
  OldLineHeight := Line.Size.Height;
  if Line.Layout <> nil then
    Line.Layout.Text := ApplyMaskIfRequired(ALine);

  if IsUpdating then
  begin
    MarkForRealign;
    if IsWordWrap then
      Include(FState, TState.ContentSizeChanged);
    Line.InvalidateSize;
    MarkInvalidatePositionFrom(AIndex + 1);
  end
  else
  begin
    CalculateLineSize(AIndex);
    CalculateLineY(AIndex);

    HeightOffset := Line.Size.Height - OldLineHeight;
    OffsetLinesYFrom(AIndex + 1, HeightOffset);
    UpdateVisibleIndexes;

    if IsMultiLine or IsLeftAlignment then
    begin
      { Adjust content size}
      NewContentSize.Height := ContentSize.Height + HeightOffset;
      NewContentSize.Width := Max(ContentSize.Width, Line.Size.Width);
      SetContentSize(NewContentSize);
    end
    else
    begin
      // Content Width depends on current line width
      Include(FState, TState.NeedAlignmentByX);
      Include(FState, TState.ContentSizeChanged);
      Realign;
    end;
  end;
end;

procedure TLinesLayout.SetCaretWidth(const Value: Single);
begin
  FCaretWidth := Max(1, Value);
end;

procedure TLinesLayout.SetMaskChar(const Value: Char);
begin
  FMaskChar := Value;
end;

procedure TLinesLayout.SetNeedMaskContent(const Value: Boolean);
var
  I: Integer;
begin
  if FNeedMaskContent <> Value then
  begin
    FNeedMaskContent := Value;

    BeginUpdate;
    try
      Clear;
      for I := 0 to FLinesSource.Count - 1 do
        InsertLine(I, FLinesSource[I]);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TLinesLayout.SetOpacity(const Value: Single);
begin
  if not SameValue(FOpacity, Value) then
  begin
    FOpacity := Value;
    UpdateLayoutsColor;
  end;
end;

procedure TLinesLayout.SetIsRightToLeft(const Value: Boolean);
var
  I: Integer;
  Line: TLineObject;
begin
  if FIsRightToLeft <> Value then
  begin
    FIsRightToLeft := Value;
    for I := 0 to FLines.Count - 1 do
    begin
      Line := FLines[I];
      Line.Invalidate;
    end;
  end;
end;

procedure TLinesLayout.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettings.Assign(Value);
end;

procedure TLinesLayout.SetViewportRect(const Value: TRectF);

  procedure MarkLinesForRealign;
  var
    I: Integer;
  begin
    for I := 0 to Count - 1 do
      FLines[I].Invalidate;
  end;

var
  IsWidthChanged: Boolean;
  IsHeightChanged: Boolean;
  IsXPositionChanged: Boolean;
  IsYPositionChanged: Boolean;
begin
  IsHeightChanged := not SameValue(FViewportRect.Size.Height, Value.Size.Height, TEpsilon.Position);
  IsWidthChanged := not SameValue(FViewportRect.Size.Width, Value.Size.Width, TEpsilon.Position);
  IsXPositionChanged := not SameValue(FViewportRect.Left, Value.Left, TEpsilon.Position);
  IsYPositionChanged := not SameValue(FViewportRect.Top, Value.Top, TEpsilon.Position);

  FViewportRect := Value;
  if (IsWordWrap or not IsLeftAlignment) and IsWidthChanged then
  begin
    // Changing the width of the content may cause text hyphenation, so we have to recalculate lines.
    MarkLinesForRealign;
    Realign;
  end;

  if IsHeightChanged or IsYPositionChanged then
    UpdateVisibleIndexes
  else if IsXPositionChanged then
    // If we have short lines of text in viewport and user scrolls text by horizontally,
    // text line can be disappeared (it's a part of optimization).
    CreateLayoutsForVisibleLinesIfNotCreated;
end;

procedure TLinesLayout.TextSettingsChanged(Sender: TObject);

  procedure InvalidateLines;
  var
    I: Integer;
  begin
    for I := 0 to Count - 1 do
    begin
      FLines[I].Invalidate;
      FLines[I].RenderingMode := RenderingMode;
    end;
  end;

begin
  FLineHeight := InvalidSize.Height;

  InvalidateLines;
  Realign;
end;

procedure TLinesLayout.SetContentSize(const AContentSize: TSizeF);
var
  LContentSize: TSizeF;
  LCaretWidth: Single;
begin
  FContentSize := AContentSize;
  LCaretWidth := Max(CaretWidth, DefaultCaretWidth);
  // We don't account caret width in FContentSize, because we use this field value for recalculation content width
  // extension, when user adds/insert new line
  if IsWordWrap then
  begin
    LContentSize := FContentSize;
    LContentSize.Width := Min(LContentSize.Width + LCaretWidth, ViewportRect.Width);
  end
  else
    LContentSize := FContentSize + TSizeF.Create(LCaretWidth, 0);
  LContentSize.Height := Max(LContentSize.Height, GetLineHeight);
  FScrollableContent.ContentSize := LContentSize;
end;

procedure TLinesLayout.UpdateLayoutParams(const ALineIndex: Integer; const ALayout: TTextLayout);
begin
  ALayout.BeginUpdate;
  try
    if IsMultiLine then
      ALayout.HorizontalAlign := TextSettings.HorzAlign
    else if IsRightToLeft then
      ALayout.HorizontalAlign := TTextAlign.Trailing
    else
      ALayout.HorizontalAlign := TTextAlign.Leading;
    ALayout.Font := TextSettings.Font;
    ALayout.Color := TextSettings.FontColor;
    ALayout.WordWrap := IsWordWrap;
    if IsWordWrap then
      ALayout.MaxSize := TPointF.Create(ViewportRect.Width - 1, TTextLayout.MaxLayoutSize.Y)
    else
      ALayout.MaxSize := TTextLayout.MaxLayoutSize;
    ALayout.RightToLeft := IsRightToLeft;
    ALayout.Opacity := Opacity;
  finally
    ALayout.EndUpdate;
  end;
end;

procedure TLinesLayout.UpdateLayoutsColor;
var
  I: Integer;
  Layout: TTextLayout;
begin
  for I := 0 to FLines.Count - 1 do
  begin
    Layout := FLines[I].Layout;
    if Layout <> nil then
    begin
      Layout.Color := TextSettings.FontColor;
      Layout.Opacity := Opacity;
    end;
  end;
end;

procedure TLinesLayout.UpdateVisibleIndexes;
type
  TDirection = (Up, Down);

  function SkipInvisibleLines(const AIndex: Integer; const ADirection: TDirection): Integer;
  begin
    Result := AIndex;
    case ADirection of
      TDirection.Up:
        while (Result >= 0) and not FLines[Result].IsVerticallyIn(ViewportRect) do
          Dec(Result);
      TDirection.Down:
        while (Result < Count) and not FLines[Result].IsVerticallyIn(ViewportRect) do
          Inc(Result);
    end;
  end;

  function SkipVisibleLines(const AIndex: Integer; const ADirection: TDirection): Integer;
  begin
    Result := AIndex;
    case ADirection of
      TDirection.Up:
        while (Result >= 0) and FLines[Result].IsVerticallyIn(ViewportRect) do
          Dec(Result);
      TDirection.Down:
        while (Result < Count) and FLines[Result].IsVerticallyIn(ViewportRect) do
          Inc(Result);
    end;
  end;

  function FindFirstVisibleLine(const AStartIndex: Integer): Integer;
  var
    I: Integer;
  begin
    if Count = 0 then
      Exit(-1);

    I := EnsureRange(AStartIndex, 0, Count - 1);
    if FLines[I].IsVerticallyIn(ViewportRect) then
      // The line is in viewport
      Result := SkipVisibleLines(I, TDirection.Up) + 1
    else if FLines[I].Rect.Bottom <= ViewportRect.Top then
      // The line is above viewport
      Result := SkipInvisibleLines(I, TDirection.Down)
    else
    begin
      // The line is below viewport
      I := SkipInvisibleLines(I, TDirection.Up);
      Result := SkipVisibleLines(I, TDirection.Up) + 1;
    end;
    Result := EnsureRange(Result, -1, Count - 1);
  end;

  function FindLastFirstVisibleLine(const AStartIndex: Integer): Integer;
  var
    I: Integer;
  begin
    if Count = 0 then
      Exit(-1);

    I := EnsureRange(AStartIndex, 0, Count - 1);
    if FLines[I].IsVerticallyIn(ViewportRect) then
      // The line is in viewport
      Result  := SkipVisibleLines(I, TDirection.Down) - 1
    else if FLines[I].Rect.Bottom <= ViewportRect.Top then
    begin
      // The line is above viewport
      I := SkipInvisibleLines(I, TDirection.Down);
      Result := SkipVisibleLines(I, TDirection.Down) - 1;
    end
    else
      // The line is below viewport
      Result := SkipInvisibleLines(I, TDirection.Up);

    Result := EnsureRange(Result, -1, Count - 1);
  end;

var
  I: Integer;
begin
  { Release layouts for hidden lines }

  for I := Max(0, FFirstVisibleLineIndex) to Min(FLastVisibleLineIndex, Count - 1) do
    FLines[I].ReleaseLayoutIfNotVisible(ViewportRect);

  { Definition first and last visible lines indexes }

  FFirstVisibleLineIndex := FindFirstVisibleLine(FFirstVisibleLineIndex);
  FLastVisibleLineIndex := Max(FFirstVisibleLineIndex, FindLastFirstVisibleLine(FLastVisibleLineIndex));

  { Create layouts for visible lines }

  CreateLayoutsForVisibleLinesIfNotCreated;
end;

procedure TLinesLayout.RefreshLineLayout(const ALineIndex: Integer);
var
  Line: TLineObject;
begin
  Line := FLines[ALineIndex];

  UpdateLayoutParams(ALineIndex, Line.Layout);
  Exclude(Line.FState, TLineObject.TState.InvalidLayout);
end;

end.
