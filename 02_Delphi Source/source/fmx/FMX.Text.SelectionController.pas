{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.SelectionController;

interface

{$SCOPEDENUMS ON}

uses
  FMX.Text;

type

{ Selection Controller }

  TSelectionChangedEvent = procedure(Sender: TObject; const ASelStart, ALength: Integer) of object;

  /// <summary>
  ///   The controller is responsible for organizing text selection. Namely, the control of the logical boundaries of
  ///   the selection at the text level.
  /// </summary>
  TSelectionController = class
  private
    FLineSource: ITextLinesSource;
    FSelStart: TCaretPosition;
    FSelFinish: TCaretPosition;
    { Hold selection part }
    FHoldSelBegin: TCaretPosition;
    FHoldSelEnd: TCaretPosition;
    FOnChanged: TSelectionChangedEvent;
    procedure SetSelStart(const Value: TCaretPosition);
    procedure SetSelFinish(const Value: TCaretPosition);
    procedure SetLength(const Value: Integer);
    function GetLength: Integer;
    function GetSelLength: Integer;
  protected
    procedure DoSelectionChanged; virtual;
  public
    constructor Create(const ALineSource: ITextLinesSource);
    destructor Destroy; override;

    /// <summary>Sets non-normalized selection range. <c>ASelStart</c> may be more than <c>ASelEnd</c>.</summary>
    procedure SetRange(const ASelStart, ASelEnd: TCaretPosition); overload;
    /// <summary>
    ///   Sets non-normalized selection range by global indexes and length. <c>ALength</c> may have negative value.
    /// </summary>
    procedure SetRange(const AStartPos, ALength: Integer); overload;

    /// <summary>Resets current selection to (0, 0).</summary>
    procedure Reset;
    /// <summary>Is current text selected?</summary>
    function IsSelected: Boolean;

    { Normalized selection bounds }

    /// <summary>
    ///   Normalized start (Line and position) of selection. The return value is guaranteed to stand until the end of
    ///   the selection <c>SelEnd</c>.
    /// </summary>
    function SelBegin: TCaretPosition;
    /// <summary>The same as <c>SelBegin</c>, but returns global text index.</summary>
    function BeginPos: Integer;
    /// <summary>
    ///   Normalized end (Line and position) of selection. The return value is guaranteed to stand after the begin of
    ///   the selection <c>SelBegin</c>.
    /// </summary>
    function SelEnd: TCaretPosition;
    /// <summary>The same as <c>SelEnd</c>, but returns global text index.</summary>
    function EndPos: Integer;
    /// <summary>Normalized length of selection.</summary>
    property SelLength: Integer read GetSelLength;

    { Hold normalized selection bounds }

    procedure HoldSelection;
    procedure UnholdSelection;
    property HoldSelBegin: TCaretPosition read FHoldSelBegin;
    property HoldSelEnd: TCaretPosition read FHoldSelEnd;

    function ToString: string; override;

    { Unnormalized selection bounds }

    /// <summary>
    ///   Non-normalized start (Line and position) of selection. The <c>Start</c> may be more than the <c>Finish</c>.
    /// </summary>
    /// <remarks>
    ///   To get normalized boundaries, use <c>SelBegin</c>, <c>SelEnd</c>, <c>BeginPos</c> and <c>EndPos</c>.
    /// </remarks>
    property Start: TCaretPosition read FSelStart write SetSelStart;
    /// <summary>
    ///   Non-normalized finish (Line and position)  of selection. The <c>Finish</c> may be less than the <c>Start</c>.
    /// </summary>
    /// <remarks>
    ///   To get normalized boundaries, use <c>SelBegin</c>, <c>SelEnd</c>, <c>BeginPos</c> and <c>EndPos</c>.
    /// </remarks>
    property Finish: TCaretPosition read FSelFinish write SetSelFinish;
    /// <summary>
    ///   Non-normalized length of selection. If the value is positive, then the end of the selection is behind
    ///  the beginning. If negative, then vice versa.
    /// </summary>
    property Length: Integer read GetLength write SetLength;

    /// <summary>The event is being invoked, when text selections was changed.</summary>
    property OnChanged: TSelectionChangedEvent read FOnChanged write FOnChanged;
  end;

implementation

uses
  System.SysUtils, System.RTLConsts;

{ TSelectionController }

constructor TSelectionController.Create(const ALineSource: ITextLinesSource);
begin
  if ALineSource = nil then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['ALineSource']);

  inherited Create;
  FLineSource := ALineSource;
  Reset;
end;

destructor TSelectionController.Destroy;
begin
  FLineSource := nil;
  inherited;
end;

procedure TSelectionController.DoSelectionChanged;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self, BeginPos, EndPos - BeginPos);
end;

function TSelectionController.IsSelected: Boolean;
begin
  Result := FSelStart <> FSelFinish;
end;

procedure TSelectionController.Reset;
begin
  SetRange(TCaretPosition.Zero, TCaretPosition.Zero);
end;

function TSelectionController.SelBegin: TCaretPosition;
begin
  if FSelStart < FSelFinish then
    Result := FSelStart
  else
    Result := FSelFinish;
end;

function TSelectionController.BeginPos: Integer;
begin
  Result := FLineSource.PosToTextPos(SelBegin);
end;

function TSelectionController.SelEnd: TCaretPosition;
begin
  if FSelStart < FSelFinish then
    Result := FSelFinish
  else
    Result := FSelStart;
end;

function TSelectionController.EndPos: Integer;
begin
  Result := FLineSource.PosToTextPos(SelEnd);
end;

function TSelectionController.GetLength: Integer;
begin
  Result := FLineSource.PosToTextPos(Finish) - FLineSource.PosToTextPos(Start);
end;

function TSelectionController.GetSelLength: Integer;
begin
  Result := FLineSource.PosToTextPos(SelEnd) - FLineSource.PosToTextPos(SelBegin);
end;

procedure TSelectionController.SetSelFinish(const Value: TCaretPosition);
begin
  SetRange(Start, Value);
end;

procedure TSelectionController.SetSelStart(const Value: TCaretPosition);
begin
  SetRange(Value, Finish);
end;

function TSelectionController.ToString: string;
begin
  Result := Format('TSelectionController{SelStart=%s, SelFinish=%s}', [FSelStart.ToString, FSelFinish.ToString]);
end;

procedure TSelectionController.SetLength(const Value: Integer);
begin
  Finish := FLineSource.TextPosToPos(FLineSource.PosToTextPos(Start) + Value);
end;

procedure TSelectionController.HoldSelection;
begin
                                                                                                                          
  FHoldSelBegin := SelBegin;
  FHoldSelEnd := SelEnd;
end;

procedure TSelectionController.SetRange(const AStartPos, ALength: Integer);
begin
  SetRange(FLineSource.TextPosToPos(AStartPos), FLineSource.TextPosToPos(AStartPos + ALength));
end;

procedure TSelectionController.SetRange(const ASelStart, ASelEnd: TCaretPosition);
begin
  if (FSelStart <> ASelStart) or (FSelFinish <> ASelEnd) then
  begin
    FSelStart := ASelStart;
    FSelFinish := ASelEnd;

    DoSelectionChanged;
  end;
end;

procedure TSelectionController.UnholdSelection;
begin
  FHoldSelBegin := TCaretPosition.Invalid;
  FHoldSelEnd := TCaretPosition.Invalid;
end;

end.
