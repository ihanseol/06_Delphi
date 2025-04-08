{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.InteractiveSelectors;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Types, System.UITypes, FMX.Objects, FMX.Text.SelectionController, FMX.Controls,
  FMX.Text.TextEditor, FMX.Types, FMX.MagnifierGlass;

type
  TTextSelectorType = (Left, Right, Caret, Unknown);
  TSelectionEvent = procedure (Sender: TObject; const AInitiator: TTextSelectorType) of object;
  TSelectorChangedEvent = procedure (Sender: TObject; const ASelector: TTextSelectorType; const AContentPoint: TPointF) of object;

  /// <summary>
  ///   The class is responsible for implementing interactive text selection and cursor positioning using selection
  ///   points. The class extracts the available selection points from the passed style component and performs their work.
  ///   If there are no points in the style, then the class does not display them.
  /// </summary>
  TInteractiveTextSelectors = class(TNoRefCountObject, IFreeNotification)
  public const
    LoupeOffset = 10;
  private
    [Weak] FOwner: TStyledControl;
    [Weak] FEditor: TTextEditor;
    FActiveInitiator: TTextSelectorType;
    FShouldPlaceLeftSelectionPointBelow: Boolean;
    { Loupe }
    FLoupeEnabled: Boolean;
    FLoupeService: ILoupeService;
    { Style objects }
    FLeftSelector: TSelectionPoint;
    FRightSelector: TSelectionPoint;
    FCaretSelector: TSelectionPoint;
    FOnBeginSelection: TSelectionEvent;
    FOnEndSelection: TSelectionEvent;
    FOnSelectorPositionChanged: TSelectorChangedEvent;
    procedure SetLoupeEnabled(const Value: Boolean);
    procedure SetShouldPlaceLeftSelectionPointBelow(const Value: Boolean);
    { Handlers }
    procedure SelectorMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure SelectorMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure LeftSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);
    procedure RightSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);
    procedure CaretSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);
  protected
    procedure DoBeginSelection(const AInitiator: TTextSelectorType); virtual;
    procedure DoEndSelection; virtual;
    procedure DoSelectorPositionChanged(const AInitiator: TTextSelectorType; const AContentPoint: TPointF); virtual;

    procedure RealignCaretSelector;
    procedure RealignSelectionSelectors;

    /// <summary>Returns position of the caret selector in its parent coordinate system.</summary>
    function GetCaretSelectorPosition: TPointF; virtual;
    /// <summary>Returns position of the left selector in its parent coordinate system.</summary>
    function GetLeftSelectorPosition: TPointF; virtual;
    /// <summary>Returns position of the right selector in its parent coordinate system.</summary>
    function GetRightSelectorPosition: TPointF; virtual;

    function HasSelection: Boolean;
    function IsVisibleInOwner(const ASelector: TSelectionPoint): Boolean;

    { Loupe }
    procedure ShowLoupe;
    procedure SetLoupePosition(const AInitiator: TTextSelectorType); overload;
    function CanUseLoupe: Boolean; virtual;
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);

    { Selectors }
    property LeftSelector: TSelectionPoint read FLeftSelector;
    property RightSelector: TSelectionPoint read FRightSelector;
    property CaretSelector: TSelectionPoint read FCaretSelector;
  public
    constructor Create(const AOwner: TStyledControl; const ATextEditor: TTextEditor);
    destructor Destroy; override;

    procedure Install;
    procedure Uninstall;
    /// <summary>
    ///   Notification from the client that a style has been applied and selection points from the style can be loaded.
    /// </summary>
    procedure ApplyStyle;
    /// <summary>
    ///   Notification from the client that a style has been released and selection points from the style can be unloaded.
    /// </summary>
    procedure FreeStyle;
    /// <summary>
    ///   Updates the location of selectors and their visibility, taking into account the current cursor position and selection.
    /// </summary>
    procedure Realign;
    /// <summary>Are selection points supported for this style?</summary>
    function IsSupported: Boolean;

    { Loupe }

    /// <summary>Hides the magnifying glass.</summary>
    procedure HideLoupe;
    /// <summary>
    ///    Positions and displays the magnifying glass in the X, Y coordinates in the <c>Owner</c> coordinate system.
    /// </summary>
    procedure SetLoupePosition(const X, Y: Single); overload;
  public
    /// <summary>The current selector that the user interacts with.</summary>
    property ActiveInitiator: TTextSelectorType read FActiveInitiator;
    /// <summary>Do class need to display a magnifying glass when working with selectors?</summary>
    property LoupeEnabled: Boolean read FLoupeEnabled write SetLoupeEnabled;
    /// <summary>Do class need to display the left selection point under the selection area?</summary>
    /// <remarks>By default, the selection points are located one at the top of the selection, the second at the bottom.</remarks>
    property ShouldPlaceLeftSelectionPointBelow: Boolean read FShouldPlaceLeftSelectionPointBelow write SetShouldPlaceLeftSelectionPointBelow;
    property Owner: TStyledControl read FOwner;
    property Editor: TTextEditor read FEditor;
    /// <summary>Called when the user starts interacting with the selector.</summary>
    property OnBeginSelection: TSelectionEvent read FOnBeginSelection write FOnBeginSelection;
    /// <summary>Called when the user stops interacting with the selector.</summary>
    property OnEndSelection: TSelectionEvent read FOnEndSelection write FOnEndSelection;
    /// <summary>Called when the user moves the selector.</summary>
    property OnSelectorPositionChanged: TSelectorChangedEvent read FOnSelectorPositionChanged write FOnSelectorPositionChanged;
  end;

implementation

uses
  System.SysUtils, System.RTLConsts, FMX.Text, FMX.Graphics, FMX.Platform, FMX.Platform.Metrics, FMX.Presentation.Style,
  FMX.Forms;

function ConvertLocalPointTo(const AFrom: TControl; const ATo: TFmxObject; const APoint: TPointF): TPointF;
begin
  if ATo is TCommonCustomForm then
    Result := AFrom.LocalToAbsolute(APoint)
  else if ATo is TControl then
    Result := AFrom.ConvertLocalPointTo(TControl(ATo), APoint)
  else
    Result := APoint;
end;

function ConvertLocalPointFrom(const ATo: TControl; const AFrom: TFmxObject; const APoint: TPointF): TPointF;
begin
  if AFrom is TCommonCustomForm then
    Result := ATo.AbsoluteToLocal(APoint)
  else if AFrom is TControl then
    Result := ATo.ConvertLocalPointFrom(TControl(AFrom), APoint)
  else
    Result := APoint;
end;

{ TInteractiveTextSelectors }

constructor TInteractiveTextSelectors.Create(const AOwner: TStyledControl; const ATextEditor: TTextEditor);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  if AOwner = nil then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['AOwner']);
  if ATextEditor = nil then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['ATextEditor']);

  inherited Create;
  FOwner := AOwner;
  FEditor := ATextEditor;
  FActiveInitiator := TTextSelectorType.Unknown;
  FLoupeEnabled := TPlatformServices.Current.SupportsPlatformService(ILoupeService, FLoupeService);
  if TPlatformServices.Current.SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
    FShouldPlaceLeftSelectionPointBelow := PropertiesService.GetValue('TextEditor.ShouldPlaceLeftSelectionPointBelow', False)
                                                            .AsBoolean
  else
    FShouldPlaceLeftSelectionPointBelow := False;
end;

destructor TInteractiveTextSelectors.Destroy;
begin
  FreeAndNil(FLeftSelector);
  FreeAndNil(FRightSelector);
  FreeAndNil(FCaretSelector);
  FLoupeService:= nil;
  FEditor := nil;
  FOwner := nil;
  inherited;
end;

procedure TInteractiveTextSelectors.ApplyStyle;
var
  Selector: TSelectionPoint;
begin
  if FOwner.FindStyleResource<TSelectionPoint>('leftselectionpoint', Selector) then
  begin
    Selector.Visible := False;
    // We don't use selection points from style, because they are placed in style container, which is 0-child in Owner.
    // So they are always placed behind the text and selection.
    FLeftSelector := Selector.Clone(nil) as TSelectionPoint;
    FLeftSelector.Stored := False;
    FLeftSelector.AddFreeNotify(Self);
    FLeftSelector.Touch.InteractiveGestures := [TInteractiveGesture.Pan, TInteractiveGesture.LongTap];
    FLeftSelector.TagString := 'Selector';
    FLeftSelector.OnTrack := LeftSelectorChangePositionHandler;
    FLeftSelector.OnMouseDown := SelectorMouseDownHandler;
    FLeftSelector.OnMouseUp := SelectorMouseUpHandler;
  end
  else
    FreeAndNil(FLeftSelector);

  if FOwner.FindStyleResource<TSelectionPoint>('rightselectionpoint', Selector) then
  begin
    Selector.Visible := False;
    FRightSelector := Selector.Clone(nil) as TSelectionPoint;
    FRightSelector.Stored := False;
    FRightSelector.AddFreeNotify(Self);
    FRightSelector.Touch.InteractiveGestures := [TInteractiveGesture.Pan, TInteractiveGesture.LongTap];
    FRightSelector.TagString := 'Selector';
    FRightSelector.OnTrack := RightSelectorChangePositionHandler;
    FRightSelector.OnMouseDown := SelectorMouseDownHandler;
    FRightSelector.OnMouseUp := SelectorMouseUpHandler;
  end
  else
    FreeAndNil(FRightSelector);

  if FOwner.FindStyleResource<TSelectionPoint>('caretpoint', Selector) then
  begin
    Selector.Visible := False;
    FCaretSelector := Selector.Clone(nil) as TSelectionPoint;
    FCaretSelector.Stored := False;
    FCaretSelector.AddFreeNotify(Self);
    FCaretSelector.Touch.InteractiveGestures := [TInteractiveGesture.Pan, TInteractiveGesture.LongTap];
    FCaretSelector.TagString := 'Selector';
    FCaretSelector.OnTrack := CaretSelectorChangePositionHandler;
    FCaretSelector.OnMouseDown := SelectorMouseDownHandler;
    FCaretSelector.OnMouseUp := SelectorMouseUpHandler;
  end
  else
    FreeAndNil(FCaretSelector);
end;

procedure TInteractiveTextSelectors.FreeNotification(AObject: TObject);
begin
  if AObject = FLeftSelector then
    FLeftSelector := nil
  else if AObject = FRightSelector then
    FRightSelector := nil
  else if AObject = FCaretSelector then
    FCaretSelector := nil
end;

procedure TInteractiveTextSelectors.FreeStyle;
begin
  FreeAndNil(FLeftSelector);
  FreeAndNil(FRightSelector);
  FreeAndNil(FCaretSelector);
end;

function TInteractiveTextSelectors.GetCaretSelectorPosition: TPointF;
var
  CaretPosition: TCaretPosition;
  CaretPoint: TPointF;
begin
  if FCaretSelector = nil then
    Exit(TPointF.Zero);

  if FEditor.TextService = nil then
    CaretPosition := FEditor.CaretPosition
  else if FEditor.TextService.HasMarkedText then
    CaretPosition := FEditor.TextService.TargetClausePosition
  else
    CaretPosition := FEditor.TextService.CaretPosition;

  CaretPoint := FEditor.GetCaretPositionPoint(FEditor.CaretPosition);
  Result := CaretPoint + TPointF.Create(FEditor.Caret.Width / 2, FEditor.LinesLayout.GetLineHeight);
  Result := ConvertLocalPointTo(FEditor.Content, FCaretSelector.Parent, Result);
end;

function TInteractiveTextSelectors.GetLeftSelectorPosition: TPointF;
var
  SelectionRect: TRectF;
  Controller: TSelectionController;
  SelectionRegions: TRegion;
begin
  Controller := FEditor.SelectionController;

  SelectionRegions := FEditor.LinesLayout.GetRegionForRange(Controller.SelBegin, 1);

  if Length(SelectionRegions) = 0 then
    SelectionRect := TRectF.Create(TPointF.Zero, 1, FEditor.LinesLayout.GetLineHeight)
  else
    SelectionRect := SelectionRegions[0];

  SelectionRect.TopLeft := ConvertLocalPointTo(FEditor.Content, FLeftSelector.Parent, SelectionRect.TopLeft);
  SelectionRect.BottomRight := ConvertLocalPointTo(FEditor.Content, FLeftSelector.Parent, SelectionRect.BottomRight);

  FLeftSelector.ApplyStyleLookup;
  Result.X := SelectionRect.Left;
  if FShouldPlaceLeftSelectionPointBelow then
    Result.Y := SelectionRect.Bottom - FLeftSelector.BackgroundRect.Top
  else
    Result.Y := SelectionRect.Top - 2 * FLeftSelector.GripSize;
end;

function TInteractiveTextSelectors.GetRightSelectorPosition: TPointF;
var
  SelectionRect: TRectF;
  Controller: TSelectionController;
  SelectionRegions: TRegion;
begin
  Controller := FEditor.SelectionController;
  SelectionRegions := FEditor.LinesLayout.GetRegionForRange(Controller.SelEnd, 1);

  if Length(SelectionRegions) = 0 then
    SelectionRect := TRectF.Create(TPointF.Zero, 1, FEditor.LinesLayout.GetLineHeight)
  else
    SelectionRect := SelectionRegions[High(SelectionRegions)];

  SelectionRect.TopLeft := ConvertLocalPointTo(FEditor.Content, FRightSelector.Parent, SelectionRect.TopLeft);
  SelectionRect.BottomRight := ConvertLocalPointTo(FEditor.Content, FRightSelector.Parent, SelectionRect.BottomRight);

  FRightSelector.ApplyStyleLookup;
  Result.X := SelectionRect.Left;
  Result.Y := SelectionRect.Bottom - FRightSelector.BackgroundRect.Top;
end;

function TInteractiveTextSelectors.HasSelection: Boolean;
begin
  Result := FEditor.SelectionController.IsSelected;
end;

procedure TInteractiveTextSelectors.HideLoupe;
begin
  if CanUseLoupe then
    FLoupeService.Hide;
end;

procedure TInteractiveTextSelectors.Install;

  function DefineSelectorParent: TFmxObject;
  begin
    // We are embidding points to form, because it allows to avoid overlapping points by another controls on form.
    if (FOwner.Scene <> nil) and (FOwner.Scene.GetObject <> nil) then
      Result := FOwner.Scene.GetObject
    else if FOwner is TStyledPresentation then
      Result := FOwner.ParentControl
    else
      Result := FOwner;
  end;

var
  SelectorsContainer: TFmxObject;
begin
  SelectorsContainer := DefineSelectorParent;
  if FCaretSelector <> nil then
    SelectorsContainer.AddObject(FCaretSelector);

  if FLeftSelector <> nil then
    SelectorsContainer.AddObject(FLeftSelector);

  if FRightSelector <> nil then
    SelectorsContainer.AddObject(FRightSelector);
end;

procedure TInteractiveTextSelectors.Uninstall;
begin
  if FCaretSelector <> nil then
    FCaretSelector.Parent := nil;

  if FLeftSelector <> nil then
    FLeftSelector.Parent := nil;

  if FRightSelector <> nil then
    FRightSelector.Parent := nil;
end;

function TInteractiveTextSelectors.IsSupported: Boolean;
begin
  Result := (FLeftSelector <> nil) or (FRightSelector <> nil);
end;

function TInteractiveTextSelectors.IsVisibleInOwner(const ASelector: TSelectionPoint): Boolean;
const
  Expansion = 10;
var
  PointInContent: TPointF;
  LocalRect: TRectF;
begin
  PointInContent := ConvertLocalPointFrom(FOwner, ASelector, TPointF.Zero);
  LocalRect := FOwner.LocalRect;
  // We allow selectors to go beyond the boundaries of the content, so as not to hide them when they are located on the border.
  LocalRect.Inflate(Expansion, Expansion);
  Result := LocalRect.Contains(PointInContent);
  Result := Result and (FOwner.ParentControl <> nil) and FOwner.ParentControl.IsFocused;
end;

procedure TInteractiveTextSelectors.Realign;
begin
  RealignCaretSelector;
  RealignSelectionSelectors;
end;

function TInteractiveTextSelectors.CanUseLoupe: Boolean;
begin
  Result := FLoupeEnabled and (FLoupeService <> nil);
end;

procedure TInteractiveTextSelectors.CaretSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);
var
  HitPoint: TPointF;
  CaretPoint: TPointF;
begin
  HitPoint := ConvertLocalPointFrom(FEditor.Content, FCaretSelector.Parent, TPointF.Create(X, Y));
  DoSelectorPositionChanged(TTextSelectorType.Caret, HitPoint);

  CaretPoint := TPointF.Create(X, Y - FEditor.LinesLayout.GetLineHeight);
  CaretPoint := ConvertLocalPointFrom(FEditor.Content, FCaretSelector.Parent, CaretPoint);

  FEditor.SelectionController.Length := 0;
  FEditor.CaretPosition := FEditor.GetCaretPositionByPoint(CaretPoint);

  CaretPoint := GetCaretSelectorPosition;
  X := CaretPoint.X;
  Y := CaretPoint.Y;

  SetLoupePosition(TTextSelectorType.Caret);
end;

procedure TInteractiveTextSelectors.DoBeginSelection(const AInitiator: TTextSelectorType);
begin
  FActiveInitiator := AInitiator;
  if (FActiveInitiator in [TTextSelectorType.Left, TTextSelectorType.Right]) and (FEditor.TextService <> nil) then
    FEditor.TextService.BeginSelection;
  SetLoupePosition(AInitiator);
  if Assigned(FOnBeginSelection) then
    FOnBeginSelection(Self, AInitiator);
end;

procedure TInteractiveTextSelectors.DoEndSelection;
begin
  if (FActiveInitiator in [TTextSelectorType.Left, TTextSelectorType.Right]) and (FEditor.TextService <> nil) then
    FEditor.TextService.EndSelection;
  HideLoupe;
  if Assigned(FOnEndSelection) then
    FOnEndSelection(Self, FActiveInitiator);
  FActiveInitiator := TTextSelectorType.Unknown;
end;

procedure TInteractiveTextSelectors.DoSelectorPositionChanged(const AInitiator: TTextSelectorType;
  const AContentPoint: TPointF);
begin
  if Assigned(FOnSelectorPositionChanged) then
    FOnSelectorPositionChanged(Self, AInitiator, AContentPoint);
end;

procedure TInteractiveTextSelectors.LeftSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);

  procedure CalculateNewSelStart;
  var
    NewSelStart: TCaretPosition;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
    HitTestPoint: TPointF;
  begin
    if FShouldPlaceLeftSelectionPointBelow then
      HitTestPoint := TPointF.Create(X, Y - FLeftSelector.Height)
    else
      HitTestPoint := TPointF.Create(X, Y + FLeftSelector.GripSize * 2);
    HitTestPoint := ConvertLocalPointFrom(FEditor.Content, FLeftSelector.Parent, HitTestPoint);

    NewSelStart := FEditor.GetCaretPositionByPoint(HitTestPoint);
    SelStartTmp := FEditor.SelectionController.SelBegin;
    SelEndTmp := FEditor.SelectionController.SelEnd;
    if NewSelStart < SelEndTmp then
      SelStartTmp := NewSelStart
    else
    begin
      SelStartTmp := SelEndTmp;
      if SelStartTmp.Pos > 0 then
        SelStartTmp.Pos := SelStartTmp.Pos - 1
      else
      begin
        Inc(SelStartTmp.Line, -1);
        SelStartTmp.Pos := FEditor.Lines[SelStartTmp.Line].Length - 1;
      end;
    end;
    FEditor.SelectionController.SetRange(SelStartTmp, SelEndTmp);
    FEditor.CaretPosition := SelStartTmp;
  end;

  procedure UpdateLeftPointPosition;
  var
    PointTmp: TPointF;
    Region: TRegion;
    SelEndTmp: TCaretPosition;
    SelStartTmp: TCaretPosition;
  begin
    SelStartTmp := FEditor.SelectionController.SelBegin;
    SelEndTmp := FEditor.SelectionController.SelEnd;

    Region := FEditor.GetSelectionRegion;
    if Length(Region) > 0 then
    begin
      PointTmp := Region[0].TopLeft;
      if FShouldPlaceLeftSelectionPointBelow then
        PointTmp.Y := PointTmp.Y + Region[Low(Region)].Height - FLeftSelector.BackgroundRect.Top
      else
        PointTmp.Y := PointTmp.Y - 2 * FLeftSelector.GripSize;
    end
    else
    begin
      PointTmp := TPointF.Zero;
      if FShouldPlaceLeftSelectionPointBelow then
        PointTmp.Y := PointTmp.Y + FEditor.LinesLayout.GetLineHeight - FLeftSelector.BackgroundRect.Top
      else
        PointTmp.Y := PointTmp.Y - 2 * FLeftSelector.GripSize;
    end;
    PointTmp := ConvertLocalPointTo(FEditor.Content, FLeftSelector.Parent, PointTmp);
    X := PointTmp.X;
    Y := PointTmp.Y;
  end;

var
  HitPoint: TPointF;
begin
  HitPoint := ConvertLocalPointFrom(FEditor.Content, FLeftSelector.Parent, TPointF.Create(X, Y));
  DoSelectorPositionChanged(TTextSelectorType.Left, HitPoint);
  CalculateNewSelStart;
  UpdateLeftPointPosition;
  SetLoupePosition(TTextSelectorType.Left);
end;

procedure TInteractiveTextSelectors.SelectorMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);

  function DefineInitiator(const AObject: TObject): TTextSelectorType;
  begin
    if AObject = FLeftSelector then
      Result := TTextSelectorType.Left
    else if Sender = FRightSelector then
      Result := TTextSelectorType.Right
    else if Sender = FCaretSelector then
      Result := TTextSelectorType.Caret
    else
      Result := TTextSelectorType.Unknown;
  end;

var
  Initiator: TTextSelectorType;
begin
  Initiator := DefineInitiator(Sender);
  DoBeginSelection(Initiator);
end;

procedure TInteractiveTextSelectors.RightSelectorChangePositionHandler(Sender: TObject; var X, Y: Single);

  procedure CalculateNewSelEnd;
  var
    NewSelEnd: TCaretPosition;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
    HitTestPoint: TPointF;
  begin
    if FShouldPlaceLeftSelectionPointBelow then
      HitTestPoint := TPointF.Create(X, Y - FRightSelector.Height)
    else
      HitTestPoint := TPointF.Create(X, Y - FRightSelector.GripSize * 2);
    HitTestPoint := ConvertLocalPointFrom(FEditor.Content, FLeftSelector.Parent, HitTestPoint);

    NewSelEnd := FEditor.GetCaretPositionByPoint(HitTestPoint);
    SelStartTmp := FEditor.SelectionController.SelBegin;
    SelEndTmp := FEditor.SelectionController.SelEnd;

    if NewSelEnd > SelStartTmp then
      SelEndTmp := NewSelEnd;
    if (SelEndTmp.Pos = 0) and (SelEndTmp.Line > 0) then
    begin
      Inc(SelEndTmp.Line, -1);
      SelEndTmp.Pos := FEditor.Lines[SelEndTmp.Line].Length - 1;
    end;
    FEditor.SelectionController.SetRange(SelStartTmp, SelEndTmp);
    FEditor.CaretPosition := SelEndTmp;
  end;

  procedure UpdateRightPointPosition;
  var
    PointTmp: TPointF;
    Region: TRegion;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
  begin
    SelStartTmp := FEditor.SelectionController.SelBegin;
    SelEndTmp := FEditor.SelectionController.SelEnd;
    Region := FEditor.GetSelectionRegion;
    if Length(Region) > 0 then
      PointTmp := TPointF.Create(Region[High(Region)].Right, Region[High(Region)].Bottom)
    else
      PointTmp := TPointF.Zero;

    PointTmp.Y := PointTmp.Y - FRightSelector.BackgroundRect.Top;
    PointTmp := ConvertLocalPointTo(FEditor.Content, FRightSelector.Parent, PointTmp);
    X := PointTmp.X;
    Y := PointTmp.Y;
  end;

var
  HitPoint: TPointF;
begin
  HitPoint := ConvertLocalPointFrom(FEditor.Content, FRightSelector.Parent, TPointF.Create(X, Y));
  DoSelectorPositionChanged(TTextSelectorType.Right, HitPoint);
  CalculateNewSelEnd;
  UpdateRightPointPosition;
  SetLoupePosition(TTextSelectorType.Right);
end;

procedure TInteractiveTextSelectors.SelectorMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  DoEndSelection;
end;

procedure TInteractiveTextSelectors.SetLoupeEnabled(const Value: Boolean);
begin
  if FLoupeEnabled <> Value then
  begin
    FLoupeEnabled := Value;
    if not FLoupeEnabled then
      HideLoupe;
  end;
end;

procedure TInteractiveTextSelectors.SetLoupePosition(const X, Y: Single);
const
  FingerSize = 20;
var
  LoupePos: TPointF;
  ZoomCenter: TPointF;
begin
  if not CanUseLoupe then
    Exit;

  ShowLoupe;
  FLoupeService.SetLoupeMode(TLoupeMode.Circle);

  LoupePos := TPointF.Create(X, Y) + TPointF.Create(-FLoupeService.GetWidth / 2, -FLoupeService.GetHeight) +
              TPointF.Create(0, -LoupeOffset - FingerSize);
  ZoomCenter := TPointF.Create(X, Y);
  LoupePos := FOwner.LocalToAbsolute(LoupePos);
  ZoomCenter := FOwner.LocalToAbsolute(ZoomCenter);

  FLoupeService.SetPosition(LoupePos);
  FLoupeService.SetZoomRegionCenter(ZoomCenter);
end;

procedure TInteractiveTextSelectors.SetShouldPlaceLeftSelectionPointBelow(const Value: Boolean);
begin
  if FShouldPlaceLeftSelectionPointBelow <> Value then
  begin
    FShouldPlaceLeftSelectionPointBelow := Value;
    Realign;
  end;
end;

procedure TInteractiveTextSelectors.SetLoupePosition(const AInitiator: TTextSelectorType);

  function GetSelectionRect: TRectF;
  var
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
    Region: TRegion;
  begin
    SelStartTmp := FEditor.SelectionController.SelBegin;
    SelEndTmp := FEditor.SelectionController.SelEnd;
    case AInitiator of
      TTextSelectorType.Left:
        begin
          Region := FEditor.LinesLayout.GetRegionForRange(SelStartTmp, 1);
          if Length(Region) > 0 then
            Result := TRectF.Create(Region[0].TopLeft, Region[0].Width, Region[0].Height)
          else
            Result := TRectF.Empty;
        end;
      TTextSelectorType.Right:
        begin
          Region := FEditor.LinesLayout.GetRegionForRange(SelEndTmp, 1);
          if Length(Region) > 0 then
            Result := TRectF.Create(Region[0].TopLeft, Region[0].Width, Region[0].Height)
          else
            Result := TRectF.Empty;
        end;
    end;

    if FEditor.Content <> nil then
    begin
      Result.TopLeft := ConvertLocalPointFrom(FOwner, FEditor.Content, Result.TopLeft);
      Result.BottomRight := ConvertLocalPointFrom(FOwner, FEditor.Content, Result.BottomRight);
    end;
  end;

var
  SelectionRect: TRectF;
  ZoomCenter: TPointF;
  LoupePos: TPointF;
  LoupeMode: TLoupeMode;
begin
  if not CanUseLoupe then
    Exit;

  ShowLoupe;
  SelectionRect := GetSelectionRect;
  case AInitiator of
    TTextSelectorType.Left:
    begin
      ZoomCenter := TPointF.Create(SelectionRect.Left, SelectionRect.Top + SelectionRect.Height / 2);
      LoupePos := SelectionRect.TopLeft;
      LoupeMode := TLoupeMode.Rectangle;
    end;
    TTextSelectorType.Right:
    begin
      ZoomCenter := TPointF.Create(SelectionRect.Right, SelectionRect.Top + SelectionRect.Height / 2);
      LoupePos := TPointF.Create(SelectionRect.Right, SelectionRect.Top) ;
      LoupeMode := TLoupeMode.Rectangle;
    end;
    TTextSelectorType.Caret:
    begin
      var CaretPoint := ConvertLocalPointTo(FEditor.Content, FOwner, FEditor.CaretPoint);
      ZoomCenter := CaretPoint + TPointF.Create(0, FEditor.Caret.Size.Height / 2);
      LoupePos := CaretPoint;
      LoupeMode := TLoupeMode.Circle;
    end;
  else
    LoupeMode := TLoupeMode.Circle;
  end;
  // Important to set loupe mode before getting size. Because size of Magnifier glass depends on LoupeMode style
  FLoupeService.SetLoupeMode(LoupeMode);

  LoupePos := LoupePos + TPointF.Create(-FLoupeService.GetWidth / 2, -FLoupeService.GetHeight) + TPointF.Create(0, -LoupeOffset);
  LoupePos := FOwner.LocalToAbsolute(LoupePos);
  FLoupeService.SetPosition(LoupePos);

  ZoomCenter := FOwner.LocalToAbsolute(ZoomCenter);
  FLoupeService.SetZoomRegionCenter(ZoomCenter);
end;

procedure TInteractiveTextSelectors.ShowLoupe;
begin
  if CanUseLoupe then
  begin
    FLoupeService.SetLoupeScale(TCustomMagnifierGlass.DefaultLoupeScale);
    FLoupeService.ShowFor(FOwner);
  end;
end;

procedure TInteractiveTextSelectors.RealignCaretSelector;
var
  OldVisible: Boolean;
begin
  if (FCaretSelector = nil) or not FCaretSelector.HasParent then
    Exit;

  OldVisible := FCaretSelector.Visible;
  FCaretSelector.Position.Point := GetCaretSelectorPosition;
  FCaretSelector.Visible := not HasSelection and FOwner.IsFocused and IsVisibleInOwner(FCaretSelector);
  if FCaretSelector.Visible and not OldVisible then
    FCaretSelector.BringToFront;
end;

procedure TInteractiveTextSelectors.RealignSelectionSelectors;
var
  IsParentFocused: Boolean;
  OldVisible: Boolean;
begin
  IsParentFocused := (FOwner.ParentControl <> nil) and FOwner.IsFocused;

  if IsSupported then
    FEditor.Caret.TemporarilyHidden := HasSelection and IsParentFocused;
  if (FLeftSelector <> nil) and FLeftSelector.HasParent then
  begin
    OldVisible := FLeftSelector.Visible;
    FLeftSelector.Position.Point := GetLeftSelectorPosition;
    FLeftSelector.Visible := HasSelection and IsParentFocused and IsVisibleInOwner(FLeftSelector);
    if FLeftSelector.Visible and not OldVisible then
      FLeftSelector.BringToFront;
  end;

  if (FRightSelector <> nil) and FRightSelector.HasParent then
  begin
    OldVisible := FRightSelector.Visible;
    FRightSelector.Position.Point := GetRightSelectorPosition;
    FRightSelector.Visible := HasSelection and IsParentFocused and IsVisibleInOwner(FRightSelector);
    if FRightSelector.Visible and not OldVisible then
      FRightSelector.BringToFront;
  end;
end;

end.
