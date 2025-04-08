{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.TextEditor;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.UITypes, System.Types, FMX.Text, FMX.ScrollBox.Style, FMX.Text.LinesLayout, FMX.Text.UndoManager,
  FMX.Text.SelectionController, FMX.Controls, FMX.Text.IMERender, FMX.Graphics, FMX.Text.SpellingManager, FMX.Menus,
  FMX.Types, FMX.Platform;

type
  TCaretPositionChanged = procedure (Sender: TObject; const ACaretPosition: TCaretPosition) of object;

  /// <summary>
  ///   <para>The IME text visual display mode. Two modes are supported:</para>
  ///   <para>
  ///     <b>InlineText</b> - The text entered by IME is displayed among the entered text by shifting the text
  ///     characters to the right.
  ///   </para>
  ///   <para>
  ///     <b>OverText</b> - The text entered by IME is displayed over of the text already entered.
  ///   </para>
  /// </summary>
  TIMEDisplayMode = (InlineText, OverText);

  /// <summary>
  ///   This class provides functionality for managing, rendering, calculating text alignment, text navigation and
  ///   working with IME. Using the data supplied to client, performs all calculations related to the display of text.
  /// </summary>
  /// <remarks>
  ///   Is not directly responsible for the physical modification of text data. All text changes are performed by
  ///   the client outside of this class and must be accompanied by notifications about these changes through
  ///   the appropriate methods of the class.
  /// </remarks>
  TTextEditor = class(TNoRefCountObject, ITextSpellCheck, ITextSpellCheckActions)
  public const
    DefaultEmptySelectionWidth = 5;
    IMEWindowGap = 2; // Small space between conrol and IME window
    DefaultSelectionColor = $802A8ADF;
    DefaultIMEDisplayMode = TIMEDisplayMode.OverText;
    DefaultShouldDrawLeftAndRightSelectionSides = False;
  private
    [Weak] FOwner: TControl;
    [Weak] FCaret: TCustomCaret;
    FLines: TIMETextLineSourceProxy;
    FLinesLayout: TLinesLayout;
    FScrollableContent: IScrollableContent;
    FIsPassword: Boolean;
    { Painting }
    FSelectionFill: TBrush;
    FOpacity: Single;
    FShouldDrawLeftAndRightSelectionSides: Boolean;
    { Selection }
    FCaretPosition: TCaretPosition;
    FSelectionController: TSelectionController;
    { Content }
    [Weak] FContent: TControl;
    FNeedUpdateContentOffset: Boolean;
    { Spelling }
    FCheckSpelling: Boolean;
    FSpellingManager: TSpellingManager;
    { IME }
    FIMEDisplayMode: TIMEDisplayMode;
    FIMELayout: TIMETextLayout;
    FTextService: TTextService;
    FIMEComposingTextDecoration: IIMEComposingTextDecoration;
    FFillTextFlags: TFillTextFlags;
    FIsIMEActive: Boolean;
    { Behavior }
    FOnCaretPositionChanged: TCaretPositionChanged;
    FOnSelectionChanged: TSelectionChangedEvent;
    procedure SetCaretPosition(const Value: TCaretPosition);
    procedure SetTextSettings(const Value: TTextSettings);
    function GetTextSettings: TTextSettings;
    procedure SetViewportPosition(const Value: TPointF);
    procedure SetCheckSpelling(const Value: Boolean);
    procedure SetOpacity(const Value: Single);
    procedure SetSelectionFill(const Value: TBrush);
    procedure SetFillTextFlags(const Value: TFillTextFlags);
    procedure SetIMEMode(const Value: TImeMode);
    procedure SetMaxLength(const Value: Integer);
    procedure SetCharCase(const Value: TEditCharCase);
    procedure SetIsPassword(const Value: Boolean);
    function GetLines: ITextLinesSource;
    procedure SetIMEDisplayMode(const Value: TIMEDisplayMode);
    { Handlers }
    procedure SelectionChangedHandler(Sender: TObject; const ASelStart, ALength: Integer);
  protected
    procedure DoCaretPositionChanged; virtual;
    procedure DoSelectionChanged(const ASelStart, ALength: Integer); virtual;

    { ITextSpellCheck }
    function IsSpellCheckEnabled: Boolean;
    function IsCurrentWordWrong: Boolean;
    function GetListOfPrepositions: TArray<string>;
    procedure HighlightSpell;
    procedure HideHighlightSpell;

    { ITextSpellCheckActions }
    procedure Spell(const AWord: string);

    function GetPositionShift(const APosition: TCaretPosition; const ADelta: Integer): TCaretPosition;
    function GetWordBegin(const APosition: TCaretPosition): TCaretPosition;
    function GetNextWordBegin(const APosition: TCaretPosition): TCaretPosition;
    function GetPrevWordBegin(const APosition: TCaretPosition): TCaretPosition;
    function GetLeftWordBegin(const APosition: TCaretPosition): TCaretPosition;

    function GetPageSize: Single;

    { Rendering }

    procedure DrawSelection(const ACanvas: TCanvas); virtual;
    procedure DrawSelectionRegion(const ACanvas: TCanvas; const ARegion: TRectF); virtual;
    procedure DrawMarkedText(const ACanvas: TCanvas); virtual;
    procedure DrawComposingText(const ACanvas: TCanvas); virtual;

    { Caret }

    /// <summary>
    ///   The carret position may become outdated and not fall within the text boundaries.
    ///   This method allows to normalize the carriage position within the text.
    /// </summary>
    procedure NormalizeCaretPosition; overload;
    function NormalizeCaretPosition(const Value: TCaretPosition): TCaretPosition; overload;

    { Behavior customization }

    function CreateLinesLayout: TLinesLayout; virtual;
    function CreateIMETextLayout: TIMETextLayout; virtual;
    function CreateSpellingManager: TSpellingManager; virtual;
    function CreateSelectionController: TSelectionController; virtual;
  public
    constructor Create(const AOwner: TControl; const AContent: TControl; const ATextLineSource: ITextLinesSource;
                       const AScrollableContent: IScrollableContent; const AIsMultiLine: Boolean = True);
    destructor Destroy; override;

    { Selection }

    /// <summary>Returns selection region in the <c>Content</c> coordinate system.</summary>
    /// <remarks>
    ///   It works slowly on a large number of lines of text. If you need to get a selection only within
    ///   the visible area, use the method <c>GetVisibleSelectionRegion</c>.
    /// </remarks>
    function GetSelectionRegion: TRegion;
    function GetVisibleSelectionRegion: TRegion;
    procedure SelectText(const AStart: Integer; const ALength: Integer);
    function SelectedText: string;

    { Control updating process }

    procedure BeginUpdate;
    procedure EndUpdate;
    function IsUpdating: Boolean;

    { Caret navigation }

    /// <summary>
    ///   Calculates the Line and the position of the caret in it according to the specified coordinates <c>X, Y</c>
    ///   and positions the caret to the calculated position.
    /// </summary>
    procedure PutCaretTo(const X, Y: Single; const APositionByWord: Boolean = False);
    ///<summary>Moves the cursor to the beginning of the text.</summary>
    procedure GoToTextBegin;
    ///<summary>Moves the cursor to the end of the text.</summary>
    procedure GoToTextEnd;
    procedure GoToLineBegin;
    procedure GoToLineEnd;
    procedure MoveCaretVertical(const ALineDelta: Integer);
    procedure MoveCaretHorizontal(const ADelta: Integer);
    procedure MoveCaretPageUp;
    procedure MoveCaretPageDown;
    procedure MoveCaretLeft(const AIsCtrlOrCmd: Boolean);
    procedure MoveCaretRight(const AIsCtrlOrCmd: Boolean);
    procedure MoveCaretLeftRTL(const AIsCtrlOrCmd: Boolean);
    procedure MoveCaretRightRTL(const AIsCtrlOrCmd: Boolean);

    function CalculateTextBegin: TCaretPosition;
    function CalculateTextEnd: TCaretPosition;
    function CalculateLineBegin(const ACaretPosition: TCaretPosition): TCaretPosition;
    function CalculateLineEnd(const ACaretPosition: TCaretPosition): TCaretPosition;
    function CalculateCaretVertical(const ACaretPosition: TCaretPosition; const ALineDelta: Integer): TCaretPosition;
    function CalculateCaretHorizontal(const ACaretPosition: TCaretPosition; const ADelta: Integer): TCaretPosition;

    /// <summary>Returns caret position in <c>Content</c> coordinate system.</summary>
    function GetCaretPositionPoint(const ACaretPos: TCaretPosition): TPointF;
    ///<summary>Get line number and position in line by the hit point in the content coordinates system.</summary>
    function GetCaretPositionByPoint(const AHitPoint: TPointF; const RoundToWord: Boolean = False): TCaretPosition;

    { Rendering }

    /// <summary>Renders text on the specified canvas in the specified area.</summary>
    /// <remarks><c>ADestRect</c> is not used.</remarks>
    procedure Render(const ACanvas: TCanvas; const ADestRect: TRectF; const ANeedShowSelection: Boolean);
    /// <summary>Sends a request to redraw the text in the <c>Content</c>.</summary>
    procedure Repaint;

    { Text Modification }

    procedure InsertLine(const AIndex: Integer; const ALine: string);
    procedure DeleteLine(const AIndex: Integer);
    procedure ReplaceLine(const AIndex: Integer; const ALine: string);
    procedure ExchangeLines(const AOldIndex, ANewIndex: Integer);
    procedure Clear;

    { Caret }

    /// <summary>Calculates the Viewport position based on the current caret position.</summary>
    /// <remarks>Modifies the Viewport position so that the caret is in the visible part of the Viewport.</remarks>
    procedure UpdateContentOffset;
    /// <summary>Updates caret position in Content.</summary>
    procedure UpdateCaretPoint;
    /// <summary>Return caret position in <c>Content</c> coordinate system.</summary>
    function GetCaretPoint: TPointF;
    /// <summary>Returns the physical size of the caret, taking into account the current line.</summary>
    function GetCaretSize: TSizeF;
    procedure InvalidateContentSize;

    { Scrolling }

    /// <summary>Notifies the editor about changes in the size of the content and the position of the text display area.</summary>
    procedure ChangeViewportPosition(const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);

    { IME }

    /// <summary>Is there an active IME input text or not?</summary>
    function HasIMEMarkedText: Boolean;
    /// <summary>Is there an composing IME input text or not?</summary>
    function HasIMEComposingText: Boolean;
    /// <summary>Sets current text line (according to <c>CaretPosition</c>) to the <c>TextService</c>.</summary>
    procedure UpdateTextInTextService;

    procedure UpdateTextService;
    /// <summary>Specifies whether to hide the caret during IME typing?</summary>
    function NeedHideCaretInIME: Boolean; virtual;

    { ITextInput }

    function GetTextService: TTextService;
    function GetTargetClausePointF: TPointF;
    procedure StartIMEInput;
    procedure IMEStateUpdated;
    procedure EndIMEInput;
    /// <summary>Return text selection rect in Content coordinate system.</summary>
    /// <remarks>Method takes into account clipping regions.</remarks>
    function GetSelectionRect(const ANeedShowSelection: Boolean = True): TRectF;
    function GetSelectionBounds: TRect;
    function GetSelectionPointSize: TSizeF;
    function HasText: Boolean;
  public
    /// <summary>The current position (Line index + Position) of the caret in the text.</summary>
    property CaretPosition: TCaretPosition read FCaretPosition write SetCaretPosition;
    /// <summary>The physical location of the visual carriage in content coordinate system.</summary>
    property CaretPoint: TPointF read GetCaretPoint;
    /// <summary>The selection controller is responsible for managing the selection of text.</summary>
    property SelectionController: TSelectionController read FSelectionController;
    /// <summary>Access to strings.</summary>
    /// <remarks>
    ///   In <c>IMEDisplayMode = InlineText</c> mode, embeds the current IME text into the text strings supplied
    ///   by the client.
    /// </remarks>
    property Lines: ITextLinesSource read GetLines;
    /// <summary>
    ///  LinesLayout, responsible for all physical calculations of string parameters and their display
    ///  (dimensions, positions, hyphenations).
    /// </summary>
    property LinesLayout: TLinesLayout read FLinesLayout;
    /// <summary>Access to scroll <c>Content</c>.</summary>
    property ScrollableContent: IScrollableContent read FScrollableContent;
    /// <summary>Text caret.</summary>
    property Caret: TCustomCaret read FCaret write FCaret;
    /// <summary>
    ///   Should TextEditor need to perform a spell check of the text? If yes, then if errors and inaccuracies are found,
    ///   they will be visually highlighted.
    /// </summary>
    property CheckSpelling: Boolean read FCheckSpelling write SetCheckSpelling;
    /// <summary>Manager for managing the spelling of the text.</summary>
    property SpellingManager: TSpellingManager read FSpellingManager;
    /// <summary>Whether the text is interpreted as secret data that needs to be visually masked or not?</summary>
    property IsPassword: Boolean read FIsPassword write SetIsPassword;
    /// <summary>The client's content control on which the text is visually displayed.</summary>
    property Content: TControl read FContent write FContent;
    /// <summary>The current position of the visible part of the text in <c>Content</c>.</summary>
    property ViewportPosition: TPointF write SetViewportPosition;

    { IME }

    property IMEDisplayMode: TIMEDisplayMode read FIMEDisplayMode write SetIMEDisplayMode;
    property IMEMode: TImeMode write SetIMEMode;
    property CharCase: TEditCharCase write SetCharCase;
    property TextService: TTextService read FTextService;
    property MaxLength: Integer write SetMaxLength;
    property FillTextFlags: TFillTextFlags read FFillTextFlags write SetFillTextFlags;
    property IsIMEActive: Boolean read FIsIMEActive;
    property IMELayout: TIMETextLayout read FIMELayout;

    { Rendering }

    /// <summary>The brush used to display the selection background.</summary>
    property SelectionFill: TBrush read FSelectionFill write SetSelectionFill;
    /// <summary>Text display options (font, word wrap, horizontal and vertical alignment).</summary>
    property TextSettings: TTextSettings read GetTextSettings write SetTextSettings;
    /// <summary>Opacity used when rendering text.</summary>
    property Opacity: Single read FOpacity write SetOpacity;

    { Events }

    /// <summary>The event is triggered when the caret changes its position.</summary>
    property OnCaretPositionChanged: TCaretPositionChanged read FOnCaretPositionChanged write FOnCaretPositionChanged;
    /// <summary>The event is called when the tex selection changes.</summary>
    property OnSelectionChanged: TSelectionChangedEvent read FOnSelectionChanged write FOnSelectionChanged;
  end;

implementation

uses
  System.SysUtils, System.Math, System.Character, System.RTLConsts, System.Rtti, FMX.Consts, FMX.TextLayout,
  FMX.Platform.Metrics;

{ TTextEditor }

procedure TTextEditor.BeginUpdate;
begin
  FLinesLayout.BeginUpdate;
end;

procedure TTextEditor.Clear;
begin
  FLinesLayout.Clear;
  CaretPosition := TCaretPosition.Zero;
  FSelectionController.Reset;
  FSpellingManager.Reset;
  UpdateCaretPoint;
  UpdateContentOffset;
  Repaint;
end;

constructor TTextEditor.Create(const AOwner: TControl; const AContent: TControl; const ATextLineSource: ITextLinesSource;
  const AScrollableContent: IScrollableContent; const AIsMultiLine: Boolean = True);
var
  PlatformTextService: IFMXTextService;
  PropertiesService: IFMXPlatformPropertiesService;
begin
  if ATextLineSource = nil then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['ATextLineSource']);
  if AScrollableContent = nil then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['AScrollableContent']);

  inherited Create;
  FOwner := AOwner;
  FContent := AContent;
  FLines := TIMETextLineSourceProxy.Create(ATextLineSource);

  FScrollableContent := AScrollableContent;
  FLinesLayout := CreateLinesLayout;
  FLinesLayout.IsMultiLine := AIsMultiLine;
  FSelectionController := CreateSelectionController;
  FSelectionController.OnChanged := SelectionChangedHandler;
  FSpellingManager := CreateSpellingManager;
  FIMELayout := CreateIMETextLayout;
  FSelectionFill := TBrush.Create(TBrushKind.Solid, DefaultSelectionColor);
  FOpacity := 1;
  FCaretPosition := TCaretPosition.Zero;

  if TPlatformServices.Current.SupportsPlatformService(IFMXTextService, PlatformTextService) then
  begin
    FTextService := PlatformTextService.GetTextServiceClass.Create(AOwner, AIsMultiLine);
    Supports(FTextService, IIMEComposingTextDecoration, FIMEComposingTextDecoration);
  end;
  if FTextService <> nil then
    FTextService.ImeMode := TImeMode.imDontCare;
  if TPlatformServices.Current.SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
  begin
    FShouldDrawLeftAndRightSelectionSides := PropertiesService.GetValue('TextEditor.ShouldDrawLeftAndRightSelectionSides',
                                                                        DefaultShouldDrawLeftAndRightSelectionSides)
                                                              .AsBoolean;
    IMEDisplayMode := PropertiesService.GetValue('IME.DisplayMode', TValue.From<TIMEDisplayMode>(DefaultIMEDisplayMode))
                                       .AsType<TIMEDisplayMode>;
  end
  else
  begin
    FShouldDrawLeftAndRightSelectionSides := DefaultShouldDrawLeftAndRightSelectionSides;
    IMEDisplayMode := DefaultIMEDisplayMode;
  end;
end;

function TTextEditor.CreateIMETextLayout: TIMETextLayout;
begin
  Result := TIMETextLayout.Create;
end;

function TTextEditor.CreateLinesLayout: TLinesLayout;
begin
  Result := TLinesLayout.Create(FLines, FScrollableContent);
end;

function TTextEditor.CreateSelectionController: TSelectionController;
begin
  Result := TSelectionController.Create(FLines);
end;

function TTextEditor.CreateSpellingManager: TSpellingManager;
begin
  Result := TSpellingManager.Create(FLines);
end;

procedure TTextEditor.DeleteLine(const AIndex: Integer);

  procedure AdjustCaretPosition;
  var
    NewCaretPosition: TCaretPosition;
  begin
    if CaretPosition.Line >= FLines.Count then
      // Old caret line is out of lines count.
      NewCaretPosition.Line := CaretPosition.Line - 1
    else
      // Trying to keep current line.
      NewCaretPosition.Line := CaretPosition.Line;
    NewCaretPosition.Pos := CaretPosition.Pos;
    CaretPosition := NormalizeCaretPosition(NewCaretPosition);
  end;

begin
  FLinesLayout.DeleteLine(AIndex);
  if CaretPosition.Line >= AIndex then
    // We are trying to save the position of the caret in the following lines.
    AdjustCaretPosition;
  SelectionController.SetRange(CaretPosition, CaretPosition);
  if CheckSpelling then
    FSpellingManager.RemoveSpellingErrorsForLine(AIndex);
  if AIndex = CaretPosition.Line then
    UpdateTextInTextService;
end;

destructor TTextEditor.Destroy;
begin
  FContent := nil;
  FCaret := nil;
  FreeAndNil(FSelectionFill);
  FIMEComposingTextDecoration := nil;
  FreeAndNil(FIMELayout);
  FreeAndNil(FSpellingManager);
  FreeAndNil(FTextService);
  FreeAndNil(FLinesLayout);
  FreeAndNil(FSelectionController);
  FreeAndNil(FLines);
  inherited;
end;

procedure TTextEditor.DoCaretPositionChanged;
begin
  if Assigned(FOnCaretPositionChanged) then
    FOnCaretPositionChanged(Self, FCaretPosition);
end;

procedure TTextEditor.DoSelectionChanged(const ASelStart, ALength: Integer);
begin
  if Assigned(FOnSelectionChanged) then
    FOnSelectionChanged(Self, ASelStart, ALength);
end;

function TTextEditor.CalculateCaretHorizontal(const ACaretPosition: TCaretPosition; const ADelta: Integer): TCaretPosition;
begin
  Result := GetPositionShift(ACaretPosition, ADelta);
end;

function TTextEditor.CalculateCaretVertical(const ACaretPosition: TCaretPosition; const ALineDelta: Integer): TCaretPosition;
var
  Pt: TPointF;
  NewCaretPosition: TCaretPosition;
begin
  Pt := FLinesLayout.GetPointByCaretPosition(ACaretPosition);
  Pt.Offset(0, FLinesLayout.GetLineHeight / 2 + ALineDelta * FLinesLayout.GetLineHeight);

  NewCaretPosition := FLinesLayout.GetCaretPositionByPoint(Pt);
  if NewCaretPosition.IsInvalid then
    Exit(ACaretPosition);

  if NewCaretPosition <> ACaretPosition then
    Result := NewCaretPosition
  else if ALineDelta > 0 then
    Result := CalculateLineEnd(ACaretPosition)
  else
    Result := CalculateLineBegin(ACaretPosition);
end;

function TTextEditor.CalculateLineBegin(const ACaretPosition: TCaretPosition): TCaretPosition;
var
  Point: TPointF;
begin
  if HasText then
  begin
    Point := FLinesLayout.GetPointByCaretPosition(ACaretPosition);
    Point := TPointF.Create(0, Point.Y + FLinesLayout.GetLineHeight / 2);
    Result := FLinesLayout.GetCaretPositionByPoint(Point);
  end
  else
    Result := ACaretPosition;
end;

function TTextEditor.CalculateLineEnd(const ACaretPosition: TCaretPosition): TCaretPosition;
var
  Point: TPointF;
begin
  if HasText then
  begin
    Point := FLinesLayout.GetPointByCaretPosition(ACaretPosition);
    Point := TPointF.Create(FLinesLayout[ACaretPosition.Line].Rect.Right - 1,
                            Point.Y + FLinesLayout.GetLineHeight / 2);
    Result := FLinesLayout.GetCaretPositionByPoint(Point);
  end
  else
    Result := ACaretPosition;
end;

function TTextEditor.CalculateTextBegin: TCaretPosition;
begin
  Result := TCaretPosition.Zero;
end;

function TTextEditor.CalculateTextEnd: TCaretPosition;
begin
  if FLines.Count = 0 then
    Result := TCaretPosition.Zero
  else
    Result := TCaretPosition.Create(FLines.Count - 1, FLines[FLines.Count - 1].Length);
end;

procedure TTextEditor.ChangeViewportPosition(const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  FLinesLayout.ViewportRect := TRectF.Create(NewViewportPosition, FScrollableContent.ViewportSize.Width, FScrollableContent.ViewportSize.Height);
  FIMELayout.MaxSize := FScrollableContent.ViewportSize;
  if not (OldViewportPosition - NewViewportPosition).IsZero then
  begin
    if CheckSpelling then
      FSpellingManager.UpdateHighlightRect(FLinesLayout, FScrollableContent.ViewportSize, OldViewportPosition - NewViewportPosition);

    if HasIMEMarkedText then
      FTextService.RefreshImePosition;
  end;
end;

procedure TTextEditor.DrawComposingText(const ACanvas: TCanvas);
var
  Range: TTextRange;
  Regions: TRegion;
  Region: TRectF;
  I: Integer;
begin
  if FIMEComposingTextDecoration = nil then
    Exit;

  ACanvas.Stroke.Kind := TBrushKind.Solid;
  ACanvas.Stroke.Color := TextSettings.FontColor;
  ACanvas.Stroke.Thickness := 1;
  ACanvas.Stroke.Dash := TStrokeDash.Solid;

  Range := FIMEComposingTextDecoration.GetRange;
  Regions := FLinesLayout.GetRegionForRange(TCaretPosition.Create(CaretPosition.Line, Range.Pos), Range.Length);
  for I := Low(Regions) to High(Regions) do
  begin
    Region := Regions[I];
    ACanvas.DrawLine(TPointF.Create(Region.Left, Region.Bottom), Region.BottomRight, Opacity);
  end;
end;

procedure TTextEditor.DrawMarkedText(const ACanvas: TCanvas);

  procedure InitImeTextLayout(const ATextSettings: TTextSettings);
  begin
    FIMELayout.BeginUpdate;
    try
      FIMELayout.Color := ATextSettings.FontColor;
      FIMELayout.Opacity := Opacity;
      FIMELayout.Text := FTextService.MarkedText;
      FIMELayout.TextAttributes := FTextService.MarketTextAttributes;
    finally
      FIMELayout.EndUpdate;
    end;
  end;

begin
  InitImeTextLayout(TextSettings);
  FIMELayout.Render(ACanvas);
end;

procedure TTextEditor.DrawSelection(const ACanvas: TCanvas);

  procedure DrawLeftAndRightSelectionSide(const ARegion: TRegion);
  var
    SelectionRect: TRectF;
    HalfCaretWidth: Single;
    SideRect: TRectF;
  begin
    if Length(ARegion) > 0 then
    begin
      HalfCaretWidth := FCaret.Flasher.Size.Width / 2;
      ACanvas.Fill.Color := FCaret.Flasher.Color;
      ACanvas.Fill.Kind := TBrushKind.Solid;
      // Draw Left selection side
      SelectionRect := ARegion[0];
      SideRect := TRectF.Create(SelectionRect.Left - HalfCaretWidth, SelectionRect.Top,
        SelectionRect.Left + HalfCaretWidth, SelectionRect.Bottom);
      ACanvas.FillRect(SideRect, 0, 0, AllCorners, FOwner.AbsoluteOpacity);
      // Draw Right selection side
      SelectionRect := ARegion[High(ARegion)];
      SideRect := TRectF.Create(SelectionRect.Right - HalfCaretWidth, SelectionRect.Top,
        SelectionRect.Right + HalfCaretWidth, SelectionRect.Bottom);
      ACanvas.FillRect(SideRect, 0, 0, AllCorners, FOwner.AbsoluteOpacity);
    end;
  end;

var
  I: Integer;
  Region: TRegion;
begin
  Region := GetVisibleSelectionRegion;
  for I := Low(Region) to High(Region) do
  begin
    if Region[I].Width = 0 then
      Region[I].Width := DefaultEmptySelectionWidth;

    DrawSelectionRegion(ACanvas, Region[I]);
  end;

  if FShouldDrawLeftAndRightSelectionSides then
    DrawLeftAndRightSelectionSide(Region);
end;

procedure TTextEditor.DrawSelectionRegion(const ACanvas: TCanvas; const ARegion: TRectF);
begin
  ACanvas.FillRect(ARegion, 1, SelectionFill);
end;

procedure TTextEditor.EndIMEInput;
var
  SavedSelBegin: TCaretPosition;
  SavedSelEnd: TCaretPosition;
begin
  // Some platforms have their own behavior in displaying the cursor. For example, macOS displays marked IME text
  // via underlining
  FCaret.TemporarilyHidden := False;
  FIMELayout.Text := string.Empty;
  FLines.MarkedText := string.Empty;
  FLines.MarkedTextPosition := CaretPosition;
  if FIMEDisplayMode = TIMEDIsplayMode.InlineText then
  begin
    SavedSelBegin := FSelectionController.SelBegin;
    SavedSelEnd := FSelectionController.SelEnd;
    try
      // This replacement only expands the string, so saved selection bounds are still valid after it
      ReplaceLine(CaretPosition.Line, FLines.GetLine(CaretPosition.Line));
    finally
      FSelectionController.SetRange(SavedSelBegin, SavedSelEnd);
    end;
  end;
  NormalizeCaretPosition;
  Repaint;
  FIsIMEActive := False;
end;

procedure TTextEditor.EndUpdate;

  function IsLoading: Boolean;
  begin
    Result := csLoading in FOwner.ComponentState;
  end;

  function IsDestroying: Boolean;
  begin
    Result := csDestroying in FOwner.ComponentState;
  end;

begin
  FLinesLayout.EndUpdate;

  if not (IsUpdating or IsLoading or IsDestroying) then
  begin
    UpdateCaretPoint;
    if FNeedUpdateContentOffset then
      UpdateContentOffset;
    Repaint;
  end;
end;

procedure TTextEditor.ExchangeLines(const AOldIndex, ANewIndex: Integer);
begin
  if CheckSpelling then
  begin
    FSpellingManager.RemoveSpellingErrorsForLine(AOldIndex);
    FSpellingManager.RemoveSpellingErrorsForLine(ANewIndex);
  end;
  FLinesLayout.ExchangeLines(AOldIndex, ANewIndex);
  if CheckSpelling then
  begin
    FSpellingManager.FindSpellingErrorsInLine(AOldIndex);
    FSpellingManager.FindSpellingErrorsInLine(ANewIndex);
  end;

  if not IsUpdating then
    Repaint;
end;

function TTextEditor.GetCaretPoint: TPointF;

  function GetImeCaretPoint: TPointF;
  var
    MarkedTextPosition: Integer;
    OffsetPosition: Integer;
    TextRange: TTextRange;
    CaretPoint: TPointF;
  begin
    MarkedTextPosition := FLines.PosToTextPos(FTextService.MarkedTextPosition);
    OffsetPosition := FLines.PosToTextPos(FTextService.TargetClausePosition) - MarkedTextPosition;
    TextRange := TTextRange.Create(OffsetPosition, 1);
    CaretPoint := GetCaretPositionPoint(CaretPosition);
    FImeLayout.TopLeft := TPointF.Create(FScrollableContent.ViewportPosition.X, CaretPoint.Y);
    FImeLayout.FirstLineOffset := CaretPoint.X - FScrollableContent.ViewportPosition.X;

    case FIMEDisplayMode of
      TIMEDisplayMode.InlineText:
        Result := GetCaretPositionPoint(TCaretPosition.Create(CaretPosition.Line, CaretPosition.Pos + OffsetPosition));

      TIMEDisplayMode.OverText:
        Result := FImeLayout.GetPositionPoint(OffsetPosition);
    end;
  end;

begin
  if HasIMEMarkedText then
    Result := GetImeCaretPoint
  else
    Result := GetCaretPositionPoint(CaretPosition);
end;

function TTextEditor.GetCaretPositionByPoint(const AHitPoint: TPointF; const RoundToWord: Boolean): TCaretPosition;
begin
  Result := FLinesLayout.GetCaretPositionByPoint(AHitPoint, RoundToWord);
end;

function TTextEditor.GetCaretPositionPoint(const ACaretPos: TCaretPosition): TPointF;
begin
  Result := FLinesLayout.GetPointByCaretPosition(ACaretPos);
end;

function TTextEditor.GetCaretSize: TSizeF;
var
  LineHeight: Single;
begin
  if (CaretPosition.Line >= 0) and (CaretPosition.Line < FLinesLayout.Count) then
  begin
    if FLinesLayout.IsWordWrap then
      LineHeight := FLinesLayout.GetLineHeight(CaretPosition.Line)
    else
      LineHeight := FLinesLayout[CaretPosition.Line].Size.Height
  end
  else
    LineHeight := FLinesLayout.GetLineHeight;

  Result := TPointF.Create(Caret.Size.cx, LineHeight);
end;

function TTextEditor.GetLeftWordBegin(const APosition: TCaretPosition): TCaretPosition;
var
  CurrentLine: string;
begin
  if FLines.Count = 0 then
    Exit(APosition);

  Result.Pos := APosition.Pos;
  Result.Line := APosition.Line;
  CurrentLine := FLines[Result.Line];

  if APosition.Pos > 0 then
  begin
    Result.Pos := GetLexemeBegin(CurrentLine, APosition.Pos);
    // If cursor is placed in the beginning of word, we have to take beginning pos of previous word.
    if Result.Pos = APosition.Pos then
      Result.Pos := GetPrevLexemeBegin(CurrentLine, APosition.Pos);
  end
  else if (APosition.Line - 1 >= 0) and (APosition.Line - 1 <= FLines.Count - 1) then
  begin
    Result.Line := APosition.Line - 1;
    Result.Pos := CurrentLine.Length;
  end;
end;

function TTextEditor.GetLines: ITextLinesSource;
begin
  Result := FLines;
end;

function TTextEditor.GetListOfPrepositions: TArray<string>;
begin
  Result := FSpellingManager.GetListOfPrepositions(CaretPosition);
end;

function TTextEditor.GetNextWordBegin(const APosition: TCaretPosition): TCaretPosition;
var
  CurrentLine: string;
begin
  if FLines.Count = 0 then
    Exit(APosition);

  Result.Pos := APosition.Pos;
  Result.Line := APosition.Line;
  CurrentLine := FLines[Result.Line];

  if APosition.Pos < CurrentLine.Length then
    Result.Pos := GetNextLexemeBegin(CurrentLine, Result.Pos)
  else if APosition.Line < FLines.Count - 1 then
  begin
    Result.Line := APosition.Line + 1;
    Result.Pos := 0;
  end;
end;

function TTextEditor.GetPageSize: Single;
begin
  Result := FScrollableContent.ViewportSize.Height / FLinesLayout.GetLineHeight;
end;

function TTextEditor.GetPositionShift(const APosition: TCaretPosition; const ADelta: Integer): TCaretPosition;
begin
  Result := APosition;
  Inc(Result.Pos, ADelta);

  if FLines.Count = 0 then
    Exit(Result);

  if Result.Pos < 0 then
    while Result.Pos < 0 do
    begin
      Inc(Result.Pos, FLines[Result.Line].Length + 1);
      Dec(Result.Line);
      if Result.Line < 0 then
        Result := TCaretPosition.Zero
      else
        Result.Pos := FLines[Result.Line].Length;
    end
  else
    while Result.Pos > FLines[Result.Line].Length do
    begin
      Result.IncrementLine;
      if Result.Line >= FLines.Count then
        Result := TCaretPosition.Create(FLines.Count - 1, FLines[FLines.Count - 1].Length)
      else
        Dec(Result.Pos, FLines[Result.Line - 1].Length + 1);
    end;
end;

function TTextEditor.GetPrevWordBegin(const APosition: TCaretPosition): TCaretPosition;
var
  CurrentLine: string;
begin
  if FLines.Count = 0 then
    Exit(APosition);

  Result.Pos := APosition.Pos;
  Result.Line := APosition.Line;
  CurrentLine := FLines[Result.Line];

  if APosition.Pos > 0 then
    Result.Pos := GetPrevLexemeBegin(CurrentLine, Result.Pos)
  else if (APosition.Line - 1 >= 0) and (APosition.Line - 1 <= FLines.Count - 1) then
  begin
    Result.Line := APosition.Line - 1;
    Result.Pos := CurrentLine.Length;
  end;
end;

function TTextEditor.GetSelectionBounds: TRect;
begin
  if FSelectionController.IsSelected then
    Result := TRect.Create(FSelectionController.SelBegin, FSelectionController.SelEnd)
  else
    Result := TRect.Create(FCaretPosition, FCaretPosition);
end;

function TTextEditor.GetSelectionPointSize: TSizeF;
begin
  Result := TSizeF.Create(0, 0);
end;

function TTextEditor.GetSelectionRect(const ANeedShowSelection: Boolean): TRectF;
var
  TmpRect, SelRect: TRectF;
  Region: TRegion;
  I: Integer;
  TmpPt: TPointF;
begin
  Region := FLinesLayout.GetRegionForRange(CaretPosition, 1);
  if Length(Region) = 0 then
    TmpPt := TPointF.Zero
  else
    TmpPt := Region[0].TopLeft;

  Result := TRectF.Create(TmpPt, 1, FLinesLayout.GetLineHeight);
  if ANeedShowSelection and (FSelectionController.Length <> 0) then
  begin
    Region := GetVisibleSelectionRegion;
    if Length(Region) > 0 then
      Result := Region[0];
    SelRect := TRectF.Create(FScrollableContent.ViewportPosition, FScrollableContent.ViewportSize.Width, FScrollableContent.ViewportSize.Height);
    for I := Low(Region) to High(Region) do
    begin
      IntersectRect(TmpRect, Region[I], SelRect);
      Result := TRectF.Union(Result, TmpRect);
    end;
  end;
end;

function TTextEditor.GetSelectionRegion: TRegion;
var
  LCaret: TCaretPosition;
begin
  LCaret := FSelectionController.SelBegin;
  Result := FLinesLayout.GetRegionForRange(LCaret, FSelectionController.Length);
end;

function TTextEditor.GetTargetClausePointF: TPointF;
var
  TmpPt: TPointF;
begin
  if FTextService = nil then
    Result := TPointF.Zero
  else
  begin
    TmpPt := GetCaretPositionPoint(FTextService.MarkedTextPosition);
    TmpPt.Offset(0, FIMELayout.BoundsRect.Height + IMEWindowGap);
    Result := Content.LocalToAbsolute(TmpPt);
  end;
end;

function TTextEditor.GetTextService: TTextService;
begin
  Result := FTextService;
end;

function TTextEditor.GetTextSettings: TTextSettings;
begin
  Result := FLinesLayout.TextSettings;
end;

function TTextEditor.GetVisibleSelectionRegion: TRegion;

  function Max(const AValue1, AValue2: TCaretPosition): TCaretPosition;
  begin
    if AValue1 >= AValue2 then
      Result := AValue1
    else
      Result := AValue2;
  end;

  function Min(const AValue1, AValue2: TCaretPosition): TCaretPosition;
  begin
    if AValue1 <= AValue2 then
      Result := AValue1
    else
      Result := AValue2;
  end;

  function IntersectSegments(const A1, A2, B1, B2: TCaretPosition; var C1, C2: TCaretPosition): Boolean;
  var
    IsABIntersection: Boolean;
    IsBAIntersection: Boolean;
  begin
    Assert(A1 <= A2);
    Assert(B1 <= B2);

    IsABIntersection := (B1 <= A2) and (A2 <= B2);
    IsBAIntersection := (A1 <= B2) and (B2 <= A2);
    Result := IsABIntersection or IsBAIntersection;
    if Result then
    begin
      C1 := Max(A1, B1);
      C2 := Min(A2, B2);
    end;
  end;

var
  VisibleSelBegin: TCaretPosition;
  VisibleSelEnd: TCaretPosition;
  VisibleSelLength: Integer;
  FirstVisibleLine: TCaretPosition;
  LastVisibleLine: TCaretPosition;
begin
  // FirstVisibleLineIndex and LastVisibleLineIndex can have invalid values in case of updating process.
  if (FLinesLayout.FirstVisibleLineIndex = -1) or (FLinesLayout.LastVisibleLineIndex = -1) or FLinesLayout.IsUpdating then
    Exit(nil);

  FirstVisibleLine := TCaretPosition.Create(FLinesLayout.FirstVisibleLineIndex, 0);
  LastVisibleLine := TCaretPosition.Create(FLinesLayout.LastVisibleLineIndex, FLines[FLinesLayout.LastVisibleLineIndex].Length);

  if IntersectSegments(FSelectionController.SelBegin, FSelectionController.SelEnd,
                       FirstVisibleLine, LastVisibleLine,
                       VisibleSelBegin, VisibleSelEnd) then
  begin
    VisibleSelLength := FLines.PosToTextPos(VisibleSelEnd) - FLines.PosToTextPos(VisibleSelBegin);
    Result := FLinesLayout.GetRegionForRange(VisibleSelBegin, VisibleSelLength);
  end
  else
    Result := [];
end;

function TTextEditor.GetWordBegin(const APosition: TCaretPosition): TCaretPosition;
var
  CurrentLine: string;
begin
  if FLines.Count = 0 then
    Exit(APosition);

  Result.Pos := APosition.Pos;
  Result.Line := APosition.Line;
  CurrentLine := FLines[Result.Line];

  if APosition.Pos < CurrentLine.Length then
    Result.Pos := GetLexemeBegin(CurrentLine, Result.Pos)
  else if APosition.Line < FLines.Count - 1 then
  begin
    Result.Line := APosition.Line + 1;
    Result.Pos := 0;
  end;
end;

procedure TTextEditor.GoToLineBegin;
begin
  CaretPosition := CalculateLineBegin(CaretPosition);
end;

procedure TTextEditor.GoToLineEnd;
begin
  CaretPosition := CalculateLineEnd(CaretPosition);
end;

procedure TTextEditor.GoToTextBegin;
begin
  CaretPosition := CalculateTextBegin;
end;

procedure TTextEditor.GoToTextEnd;
begin
  CaretPosition := CalculateTextEnd;
end;

function TTextEditor.HasIMEComposingText: Boolean;
begin
  Result := (FIMEComposingTextDecoration <> nil) and not FIMEComposingTextDecoration.GetText.IsEmpty;
end;

function TTextEditor.HasIMEMarkedText: Boolean;
begin
  Result := (FTextService <> nil) and FTextService.HasMarkedText;
end;

function TTextEditor.HasText: Boolean;
begin
  Result := (FLines.GetOriginalCount = 1) and (FLines[0].Length > 0) or (FLines.GetOriginalCount > 1);
end;

procedure TTextEditor.HideHighlightSpell;
begin
  FSpellingManager.HideHighlightSpell;
  Repaint;
end;

procedure TTextEditor.HighlightSpell;
begin
  FSpellingManager.HighlightSpell(FLinesLayout, CaretPosition);
  Repaint;
end;

procedure TTextEditor.IMEStateUpdated;
var
  SavedSelBegin: TCaretPosition;
  SavedSelEnd: TCaretPosition;
begin
  if FTextService <> nil then
  begin
    FIMELayout.Text := FTextService.MarkedText;
    FLines.MarkedText := FTextService.MarkedText;
    FLines.MarkedTextPosition := FTextService.CaretPosition;

    if FIMEDisplayMode = TIMEDIsplayMode.InlineText then
    begin
      SavedSelBegin := FSelectionController.SelBegin;
      SavedSelEnd := FSelectionController.SelEnd;
      try
        // This replacement only expands the string, so saved selection bounds are still valid after it
        if FLines.GetOriginalCount = 0 then
        begin
          if FLines.MarkedText.IsEmpty then
            DeleteLine(0)
          else if FLinesLayout.Count = 0 then
            InsertLine(0, FLines.MarkedText)
          else
            ReplaceLine(0, FLines.MarkedText);
        end
        else
          ReplaceLine(FLines.MarkedTextPosition.Line, FLines.GetLine(FLines.MarkedTextPosition.Line));
      finally
        FSelectionController.SetRange(SavedSelBegin, SavedSelEnd);
      end;
    end;
    UpdateCaretPoint;
    Repaint;
  end;
end;

procedure TTextEditor.InsertLine(const AIndex: Integer; const ALine: string);

  procedure AdjustCaretPosition;
  var
    NewCaretPosition: TCaretPosition;
  begin
    NewCaretPosition.Line := CaretPosition.Line + 1;
    NewCaretPosition.Pos := CaretPosition.Pos;
    CaretPosition := NormalizeCaretPosition(NewCaretPosition);
  end;

begin
  FLinesLayout.InsertLine(AIndex, ALine);
  if CaretPosition.Line >= AIndex then
    // We are trying to save the position of the carret in the following lines.
    AdjustCaretPosition;
  if CheckSpelling then
    FSpellingManager.FindSpellingErrorsInLine(AIndex);
  if AIndex = CaretPosition.Line then
    UpdateTextInTextService;
end;

procedure TTextEditor.InvalidateContentSize;
begin
  if CheckSpelling then
    FSpellingManager.ResetBounds;
  UpdateCaretPoint;
  UpdateContentOffset;
end;

function TTextEditor.IsCurrentWordWrong: Boolean;
begin
  Result := FSpellingManager.IsWordWrong(CaretPosition);
end;

function TTextEditor.IsSpellCheckEnabled: Boolean;
begin
  Result := FCheckSpelling;
end;

function TTextEditor.IsUpdating: Boolean;
begin
  Result := FLinesLayout.IsUpdating;
end;

procedure TTextEditor.MoveCaretHorizontal(const ADelta: Integer);
begin
  CaretPosition := CalculateCaretHorizontal(CaretPosition, ADelta);
end;

procedure TTextEditor.MoveCaretLeft(const AIsCtrlOrCmd: Boolean);
var
  Offset: Integer;
begin
  if AIsCtrlOrCmd then
    CaretPosition := GetLeftWordBegin(CaretPosition)
  else
  begin
    if FLines.Count = 0 then
      Exit;

    if (FLines[CaretPosition.Line].Length > 1) and (CaretPosition.Pos > 0) and FLines[CaretPosition.Line].Chars[CaretPosition.Pos - 1].IsLowSurrogate then
      Offset := -2
    else
      Offset := -1;

    MoveCaretHorizontal(Offset);
  end;
end;

procedure TTextEditor.MoveCaretLeftRTL(const AIsCtrlOrCmd: Boolean);
begin
  if TFillTextFlag.RightToLeft in FFillTextFlags then
    MoveCaretRight(AIsCtrlOrCmd)
  else
    MoveCaretLeft(AIsCtrlOrCmd);
end;

procedure TTextEditor.MoveCaretPageDown;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Max(1, Trunc(GetPageSize));
  MoveCaretVertical(ScrollLineNumber);
end;

procedure TTextEditor.MoveCaretPageUp;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Max(1, Trunc(GetPageSize));
  MoveCaretVertical(-ScrollLineNumber);
end;

procedure TTextEditor.MoveCaretRight(const AIsCtrlOrCmd: Boolean);
var
  Offset: Integer;
begin
  if AIsCtrlOrCmd then
    CaretPosition := GetNextWordBegin(CaretPosition)
  else
  begin
    if FLines.Count = 0 then
      Exit;

    if (FLines[CaretPosition.Line].Length > CaretPosition.Pos) and FLines[CaretPosition.Line].Chars[CaretPosition.Pos].IsHighSurrogate then
      Offset := 2
    else
      Offset := 1;

    MoveCaretHorizontal(Offset);
  end;
end;

procedure TTextEditor.MoveCaretRightRTL(const AIsCtrlOrCmd: Boolean);
begin
  if TFillTextFlag.RightToLeft in FFillTextFlags then
    MoveCaretLeft(AIsCtrlOrCmd)
  else
    MoveCaretRight(AIsCtrlOrCmd);
end;

procedure TTextEditor.MoveCaretVertical(const ALineDelta: Integer);
begin
  CaretPosition := CalculateCaretVertical(CaretPosition, ALineDelta);
end;

function TTextEditor.NeedHideCaretInIME: Boolean;
begin
{$IF DEFINED(MACOS) AND NOT DEFINED(IOS)}
  Result := True;
{$ELSE}
  Result := False;
{$ENDIF}
end;

function TTextEditor.NormalizeCaretPosition(const Value: TCaretPosition): TCaretPosition;
begin
  if Value.IsInvalid or (FLines.Count = 0) then
    Result := TCaretPosition.Zero
  else
  begin
    Result.Line := EnsureRange(Value.Line, 0, FLines.Count - 1);
    Result.Pos := EnsureRange(Value.Pos, 0, FLines[Result.Line].Length);
  end;
end;

procedure TTextEditor.NormalizeCaretPosition;
begin
  CaretPosition := NormalizeCaretPosition(CaretPosition);
end;

procedure TTextEditor.PutCaretTo(const X, Y: Single; const APositionByWord: Boolean);
type
  TRelativePositionToInitialSelection = (Before, &In, After);

  function DefineRelativePosition(const ACaretPosition: TCaretPosition): TRelativePositionToInitialSelection;
  begin
    if ACaretPosition < SelectionController.HoldSelBegin then
      Result := TRelativePositionToInitialSelection.Before
    else if SelectionController.HoldSelEnd < ACaretPosition then
      Result := TRelativePositionToInitialSelection.After
    else
      Result := TRelativePositionToInitialSelection.&In;
  end;

  function GetPrevWordEnd(const ACaretPosition: TCaretPosition): TCaretPosition;
  var
    WordStartIndex: Integer;
    WordEndIndex: Integer;
  begin
    Result := ACaretPosition;
    if FindWordBound(FLines[ACaretPosition.Line], ACaretPosition.Pos, WordStartIndex, WordEndIndex) then
      if InRange(ACaretPosition.Pos, WordStartIndex, WordEndIndex) then
        Result.Pos := WordStartIndex
      else
        Result.Pos := WordEndIndex + 1
    else
    begin
      Result := GetPrevWordBegin(ACaretPosition);
      if FindWordBound(FLines[Result.Line], Result.Pos, WordStartIndex, WordEndIndex) then
        Result.Pos := WordEndIndex + 1;
    end;
  end;

  function FindNextWordBegin(const ACaretPosition: TCaretPosition): TCaretPosition;
  var
    WordStartIndex: Integer;
    WordEndIndex: Integer;
    NextWordCaretPosition: TCaretPosition;
  begin
    Result := ACaretPosition;
    if FindWordBound(FLines[Result.Line], Result.Pos, WordStartIndex, WordEndIndex) then
    begin
      if Result.Pos = WordStartIndex then
        // We are at the word beginning
        Result.Pos := WordStartIndex
      else
        // Caret is in the bounds of new word, so move caret to the word end
        Result.Pos := WordEndIndex + 1
    end
    else
    begin
      // Caret is in words separators (spaces, coma, column)
      NextWordCaretPosition := GetNextWordBegin(Result);
      if NextWordCaretPosition = Result then
      begin
        Result := NextWordCaretPosition;
        Result.Pos := Result.Pos + 1;
      end
      else
        Result := NextWordCaretPosition;
    end;
  end;

  function FindPreviousWordEnd(const ACaretPosition: TCaretPosition): TCaretPosition;
  var
    WordStartIndex: Integer;
    WordEndIndex: Integer;
  begin
    Result := ACaretPosition;

    if FindWordBound(FLines[Result.Line], Result.Pos, WordStartIndex, WordEndIndex) and InRange(Result.Pos, WordStartIndex, WordEndIndex) then
      // Inside the word. move the cursor to the beginning of the word
      Result.Pos := WordStartIndex
    else
      // The carret hit the separator between the words, should round the position to the end of the previous word
      Result := GetPrevWordEnd(Result);
  end;

var
  NewCaretPosition: TCaretPosition;
  RelativePosition: TRelativePositionToInitialSelection;
begin
  // X, Y in the Content coordinate system
  NewCaretPosition := FLinesLayout.GetCaretPositionByPoint(TPointF.Create(X, Y), False);
  if NewCaretPosition.IsInvalid then
    Exit;

  // We don't allow to put caret in any places in case of active IME input
  if IsIMEActive and (FIMEDisplayMode = TIMEDisplayMode.InlineText) then
    Exit;

  if APositionByWord then
  begin
    if IsPassword then
      NewCaretPosition.Pos := FLines[NewCaretPosition.Line].Length
    else if SelectionController.IsSelected then
    begin
      // When user uses selection by words, we have to keep initial selected word independently of selection direction.
      RelativePosition := DefineRelativePosition(NewCaretPosition);
      case RelativePosition of
        TRelativePositionToInitialSelection.Before:
        begin
          SelectionController.SetRange(SelectionController.HoldSelEnd, SelectionController.SelBegin);
          NewCaretPosition := FindPreviousWordEnd(NewCaretPosition);
        end;
        TRelativePositionToInitialSelection.In:
        begin
          SelectionController.SetRange(SelectionController.HoldSelBegin, SelectionController.HoldSelEnd);
          NewCaretPosition := SelectionController.HoldSelEnd;
        end;
        TRelativePositionToInitialSelection.After:
        begin
          SelectionController.SetRange(SelectionController.HoldSelBegin, SelectionController.SelEnd);
          NewCaretPosition := FindNextWordBegin(NewCaretPosition);
        end;
      end;
    end
    else if not (NewCaretPosition.Pos = FLines[NewCaretPosition.Line].Length) and (GetWordBegin(NewCaretPosition) <> NewCaretPosition) then
      NewCaretPosition := GetNextWordBegin(NewCaretPosition);
  end;

  CaretPosition := NewCaretPosition;
end;

procedure TTextEditor.Render(const ACanvas: TCanvas; const ADestRect: TRectF; const ANeedShowSelection: Boolean);
begin
  FLinesLayout.RealignIfNeeded;

  if ANeedShowSelection then
    DrawSelection(ACanvas);

  FLinesLayout.Render(ACanvas);

  if HasIMEComposingText then
    DrawComposingText(ACanvas);

  if HasIMEMarkedText then
    DrawMarkedText(ACanvas);

  if CheckSpelling then
    FSpellingManager.DrawHighlightSpellingWords(FLinesLayout, FScrollableContent.ViewportSize, ACanvas, Opacity);
end;

procedure TTextEditor.Repaint;
begin
  if FContent <> nil then
    FContent.Repaint;
end;

procedure TTextEditor.ReplaceLine(const AIndex: Integer; const ALine: string);
begin
  FLinesLayout.ReplaceLine(AIndex, ALine);
  NormalizeCaretPosition;
  SelectionController.SetRange(CaretPosition, CaretPosition);
  if CheckSpelling then
  begin
    FSpellingManager.RemoveSpellingErrorsForLine(AIndex);
    FSpellingManager.FindSpellingErrorsInLine(AIndex);
  end;
  if AIndex = CaretPosition.Line then
    UpdateTextInTextService;
end;

function TTextEditor.SelectedText: string;
var
  LSelStart, LSelLength, Line, LLength: Integer;
  SelText: TStringBuilder;
  SelBeg: TCaretPosition;
begin
  if FSelectionController.Length > 0 then
  begin
    SelText := TStringBuilder.Create;
    try
      SelBeg := FLines.TextPosToPos(FSelectionController.BeginPos);
      LSelStart := SelBeg.Pos;
      Line := SelBeg.Line;
      LSelLength := Min(FSelectionController.Length, FLines.Text.Length);
      while LSelLength > 0 do
      begin
        LLength := Min(LSelLength, FLines[Line].Length - LSelStart);
        SelText.Append(FLines[Line].Substring(LSelStart, LSelLength));
        Dec(LSelLength, LLength);
        Inc(Line);
        if LSelLength > 0 then
        begin
          SelText.AppendLine;
          LSelStart := 0;
          Dec(LSelLength, FLines.LineBreak.Length);
        end;
      end;
      Result := SelText.ToString(True);
    finally
      SelText.Free;
    end;
  end
  else
    Result := string.Empty;
end;

procedure TTextEditor.SelectionChangedHandler(Sender: TObject; const ASelStart, ALength: Integer);
begin
  DoSelectionChanged(ASelStart, ALength);
end;

procedure TTextEditor.SelectText(const AStart: Integer; const ALength: Integer);
begin
  FSelectionController.SetRange(AStart, ALength);
  CaretPosition := FSelectionController.SelEnd;
end;

procedure TTextEditor.SetCaretPosition(const Value: TCaretPosition);
var
  OldCaretPosition: TCaretPosition;
  NewCaretPosition: TCaretPosition;
  IsLineChanged: Boolean;
begin
  if FCaretPosition <> Value then
  begin
    OldCaretPosition := FCaretPosition;
    NewCaretPosition := NormalizeCaretPosition(Value);
    IsLineChanged := FCaretPosition.Line <> NewCaretPosition.Line;
    FCaretPosition := NewCaretPosition;

    DoCaretPositionChanged;
    if FTextService <> nil then
    begin
      FLines.MarkedTextPosition := FCaretPosition;
      if IsLineChanged then
      begin
        // Restoring original line text (Removing Marked text)
        if (FIMEDisplayMode = TIMEDIsplayMode.InlineText) and FLines.CanEmbedIMEText then
          ReplaceLine(OldCaretPosition.Line, FLines.GetLine(OldCaretPosition.Line));

        UpdateTextInTextService;
      end;
      FTextService.MarkedTextPosition := FCaretPosition;
      FTextService.CaretPosition := FCaretPosition;

      if (FIMEDisplayMode = TIMEDIsplayMode.InlineText) and FLines.CanEmbedIMEText then
        ReplaceLine(FLines.MarkedTextPosition.Line, FLines.GetLine(FLines.MarkedTextPosition.Line));
    end;
  end;

  if IsUpdating then
    FNeedUpdateContentOffset := True
  else
  begin
    UpdateCaretPoint;
    UpdateContentOffset;
    Repaint;
  end;
end;

procedure TTextEditor.SetCharCase(const Value: TEditCharCase);
begin
  if FTextService <> nil then
  begin
    UpdateTextInTextService;
    TextService.CharCase := Value;
  end;
end;

procedure TTextEditor.SetCheckSpelling(const Value: Boolean);
begin
  if FCheckSpelling <> Value then
  begin
    FCheckSpelling := Value;

    if Value then
      FSpellingManager.FindSpellingErrorsInLines
    else
      FSpellingManager.Reset;

    Repaint;
  end;
end;

procedure TTextEditor.SetFillTextFlags(const Value: TFillTextFlags);
begin
  if FFillTextFlags <> Value then
  begin
    FFillTextFlags := Value;
    FLinesLayout.IsRightToLeft := TFillTextFlag.RightToLeft in FFillTextFlags;
  end;
end;

procedure TTextEditor.SetIMEDisplayMode(const Value: TIMEDisplayMode);
begin
  FIMEDisplayMode := Value;
  FLines.NeedEmbedIMEText := FIMEDisplayMode = TIMEDisplayMode.InlineText;
end;

procedure TTextEditor.SetIMEMode(const Value: TImeMode);
begin
  if FTextService <> nil then
    FTextService.ImeMode := Value;
end;

procedure TTextEditor.SetIsPassword(const Value: Boolean);
var
  SavedCaretPosition: TCaretPosition;
begin
  if FIsPassword <> Value then
  begin
    FIsPassword := Value;
    SavedCaretPosition := CaretPosition;
    BeginUpdate;
    try
      FLinesLayout.NeedMaskContent := Value;
      CaretPosition := SavedCaretPosition;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TTextEditor.SetMaxLength(const Value: Integer);
begin
  if FTextService <> nil then
    FTextService.MaxLength := Max(0, Value);
end;

procedure TTextEditor.SetOpacity(const Value: Single);
begin
  FOpacity := EnsureRange(Value, 0, 1);
  FLinesLayout.Opacity := FOpacity;
  FIMELayout.Opacity := FOpacity;
end;

procedure TTextEditor.SetSelectionFill(const Value: TBrush);
begin
  FSelectionFill.Assign(Value);
end;

procedure TTextEditor.SetTextSettings(const Value: TTextSettings);
begin
  FLinesLayout.TextSettings := Value;
  FIMELayout.BeginUpdate;
  try
    FIMELayout.Font := Value.Font;
    FIMELayout.Color := Value.FontColor;
    FIMELayout.Opacity := Opacity;
    FIMELayout.RightToLeft := TFillTextFlag.RightToLeft in FillTextFlags;
  finally
    FIMELayout.EndUpdate;
  end;
end;

procedure TTextEditor.SetViewportPosition(const Value: TPointF);
begin
  FScrollableContent.ViewportPosition := TPointF.Create(Max(0, Value.X), Value.Y);
end;

procedure TTextEditor.Spell(const AWord: string);
var
  LCaretPosition: TCaretPosition;
begin
  LCaretPosition := CaretPosition;
  FSpellingManager.Spell(LCaretPosition, AWord);
  CaretPosition := LCaretPosition;
end;

procedure TTextEditor.StartIMEInput;
begin
  if FTextService = nil then
    Exit;

  FIsIMEActive := True;
  Caret.TemporarilyHidden := NeedHideCaretInIME;

  UpdateTextInTextService;

  FLines.MarkedText := string.Empty;
  FLines.MarkedTextPosition := CaretPosition;
  FTextService.CaretPosition := CaretPosition;
  FTextService.MarkedTextPosition := CaretPosition;

  UpdateCaretPoint;
end;

procedure TTextEditor.UpdateCaretPoint;
var
  LCaretPoint: TPointF;
  CaretControl: IControl;
  CaretParent: TControl;
begin
  FCaret.BeginUpdate;
  try
    FCaret.Size := GetCaretSize;
    LCaretPoint := GetCaretPoint;
    { Converting point from Content -> Caret.Parent coordinate system }
    if Supports(FCaret.Flasher, IControl, CaretControl) and (FContent <> nil) then
    begin
      CaretParent := TControl(CaretControl.GetObject).ParentControl;
      if CaretParent = nil then
        LCaretPoint := FContent.ConvertLocalPointTo(FOwner, LCaretPoint)
      else
        LCaretPoint := FContent.ConvertLocalPointTo(CaretParent, LCaretPoint);
    end;
    FCaret.Pos := LCaretPoint;
  finally
    FCaret.EndUpdate;
  end;
end;

procedure TTextEditor.UpdateContentOffset;
type
  TRelativeLocation = (Above, Below, &In, OnTheLeftSide, OnTheRightSide);

  function RectLocation(const ARect: TRectF): TRelativeLocation;
  begin
    if ARect.Left < 0 then
      Result := TRelativeLocation.OnTheLeftSide
    else if ARect.Left > FScrollableContent.ViewportSize.Width then
      Result := TRelativeLocation.OnTheRightSide
    else if ARect.Bottom > FScrollableContent.ViewportSize.Height then
      Result := TRelativeLocation.Below
    else if ARect.Top < 0 then
      Result := TRelativeLocation.Above
    else
      Result := TRelativeLocation.&In;
  end;

  function CalculateViewportOffset(const ACaretRect: TRectF): TPointF;
  const
    DefaultOffset = 50;
  var
    LOffset: Integer;
  begin
    case RectLocation(ACaretRect) of
      TRelativeLocation.Above:
        Result := TPointF.Create(0, ACaretRect.Top);
      TRelativeLocation.Below:
        Result := TPointF.Create(0, ACaretRect.Bottom - FScrollableContent.ViewportSize.Height);
      TRelativeLocation.OnTheLeftSide:
        Result := TPointF.Create(ACaretRect.Left - DefaultOffset, 0);
      TRelativeLocation.OnTheRightSide:
      begin
        if FLinesLayout.HorzAlignRTL = TTextAlign.Leading then
          LOffset := DefaultOffset
        else
          LOffset := 0;

        Result := TPointF.Create(ACaretRect.Left - FScrollableContent.ViewportSize.Width + LOffset, 0);
      end
    else
      Result := TPointF.Zero;
    end;
  end;

var
  CaretRegion: TRegion;
  CaretRect: TRectF;
begin
  if csLoading in FOwner.ComponentState then
    Exit;

  if (FLinesLayout.ContentSize.Width <= FLinesLayout.ViewportRect.Width)then
    ViewportPosition := TPointF.Create(0, FScrollableContent.ViewportPosition.Y);

  CaretRegion := FLinesLayout.GetRegionForRange(CaretPosition, 1);
  if Length(CaretRegion) = 0 then
    Exit;

  // Convert rect to viewport coordinate system
  CaretRect := CaretRegion[0];
  CaretRect.Offset(-FScrollableContent.ViewportPosition);

  var LViewportPosition := FScrollableContent.ViewportPosition + CalculateViewportOffset(CaretRect);
  ViewportPosition := LViewportPosition;

  FNeedUpdateContentOffset := False;
end;

procedure TTextEditor.UpdateTextInTextService;
begin
  if FTextService = nil then
    Exit;

  if HasText then
    FTextService.Text := FLines.GetOriginalLine(FCaretPosition.Line)
  else
    FTextService.Text := string.Empty;
end;

procedure TTextEditor.UpdateTextService;
begin
  if FTextService = nil then
    Exit;

  if HasText then
    FTextService.Text := FLines.GetOriginalLine(FCaretPosition.Line)
  else
    FTextService.Text := string.Empty;
  FTextService.CaretPosition := CaretPosition;
end;

end.

