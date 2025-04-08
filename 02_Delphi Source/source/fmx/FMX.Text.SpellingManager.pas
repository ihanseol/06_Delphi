{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.SpellingManager;

interface

{$SCOPEDENUMS ON}

uses
  System.Generics.Collections, System.Types, FMX.Menus, FMX.Text.LinesLayout, FMX.Text, FMX.Graphics, FMX.TextLayout,
  FMX.SpellChecker;

type
  { Spell checker }

  ///<summary>Information about a single misspelled word in the text</summary>
  TSpellingWord = class
  private
    FPosition: TCaretPosition;
    FLength: Integer;
    FBounds: TRegion;
    FWord: string;
  public
    constructor Create(const APosition: TCaretPosition; const AWord: string; const ABounds: TRegion);
    function HasBounds: Boolean;
    function PosAtCurrentPos(const APosition: TCaretPosition): Boolean;
    procedure InvalidateBounds;
    function TextRange: TTextRange;
    property Position: TCaretPosition read FPosition write FPosition;
    property Length: Integer read FLength write FLength;
    property Bounds: TRegion read FBounds write FBounds;
    property Word: string read FWord;
  end;

  TOnReplaceWordEvent = procedure(const ASpellingWord: TSpellingWord; const ASuggestion: string) of object;

  TSpellingManager = class(TNoRefCountObject)
  private
    FLines: ITextLinesSource;
    FSpellService: IFMXSpellCheckerService;
    FSpellingWords: TObjectList<TSpellingWord>;
    FMenuItems: TList<TMenuItem>;
    { Appearance }
    FHighlightRect: TRectF;
    FFill: TBrush;
    FUnderlineStroke: TStrokeBrush;
    FOnReplaceWord: TOnReplaceWordEvent;
    procedure SetFill(const Value: TBrush);
    procedure SetStroke(const Value: TStrokeBrush);
    procedure ClearMenuItems;
    { Handlers }
    procedure SpellFixContextMenuHandler(Sender: TObject);
  protected
    procedure DoReplaceWord(const ASpellingWord: TSpellingWord; const ASuggestion: string); virtual;
    function FindSpellingWordByCaret(const ACaretPosition: TCaretPosition; out AIndex: Integer): Boolean;
  public
    constructor Create(const ALines: ITextLinesSource);
    destructor Destroy; override;

    procedure Spell(var ACaretPosition: TCaretPosition; const AWord: string);
    function IsWordWrong(const ACaretPosition: TCaretPosition): Boolean;

    { Searching Spelling words }

    procedure FindSpellingErrorsInLines;
    procedure FindSpellingErrorsInLine(const ALineIndex: Integer);
    procedure RemoveSpellingErrorsForLine(const ALineIndex: Integer);
    function GetListOfPrepositions(const ACaretPosition: TCaretPosition): TArray<string>;

    { UI }

    procedure AddSuggestionsToPopupMenu(const APopupMenu: TPopupMenu; const ACaretPosition: TCaretPosition);
    procedure Reset;
    procedure ResetBounds;
    procedure HighlightSpell(const ALines: TLinesLayout; const ACaretPosition: TCaretPosition);
    procedure HideHighlightSpell;
    procedure UpdateHighlightRect(const ALines: TLinesLayout; const AViewportSize: TSizeF; const AOffset: TPointF);

    { Drawing }

    procedure DrawHighlightSpellingWords(const ALine: TLinesLayout; const AViewportSize: TSizeF; const ACanvas: TCanvas; const AOpacity: Single);
  public
    property Fill: TBrush read FFill write SetFill;
    property Stroke: TStrokeBrush read FUnderlineStroke write SetStroke;
    property SpellingWords: TObjectList<TSpellingWord> read FSpellingWords;
    property OnReplaceWord: TOnReplaceWordEvent read FOnReplaceWord write FOnReplaceWord;
  end;

implementation

uses
  System.SysUtils, System.Math, System.RTLConsts, System.UITypes, FMX.Platform;

function RectsIntersect(const R1, R2: TRectF): Boolean;
begin
  Result := (R1.Left <= R2.Right) and (R1.Right >= R2.Left) and (R1.Top <= R2.Bottom) and (R1.Bottom >= R2.Top);
end;

{ TSpellingWord }

constructor TSpellingWord.Create(const APosition: TCaretPosition; const AWord: string; const ABounds: TRegion);
begin
  FPosition := APosition;
  FLength := AWord.Length;
  FBounds := ABounds;
  FWord := AWord;
end;

function TSpellingWord.HasBounds: Boolean;
begin
  Result := System.Length(Bounds) > 0;
end;

procedure TSpellingWord.InvalidateBounds;
begin
  Bounds := nil;
end;

function TSpellingWord.PosAtCurrentPos(const APosition: TCaretPosition): Boolean;
begin
  Result := (FPosition.Line = APosition.Line) and InRange(APosition.Pos, FPosition.Pos, FPosition.Pos + FLength);
end;

function TSpellingWord.TextRange: TTextRange;
begin
  Result := TTextRange.Create(FPosition.Pos, FLength);
end;

{ TMemoSpellingManager }

procedure TSpellingManager.ClearMenuItems;
var
  I: Integer;
begin
  for I := 0 to FMenuItems.Count - 1 do
    FMenuItems[I].Parent := nil;
  FMenuItems.Clear;
end;

constructor TSpellingManager.Create(const ALines: ITextLinesSource);
begin
  inherited Create;
  FLines := ALines;
  TPlatformServices.Current.SupportsPlatformService(IFMXSpellCheckerService, FSpellService);

  FMenuItems := TList<TMenuItem>.Create;
  FFill := TBrush.Create(TBrushKind.Solid, TAlphaColorRec.Red);
  FUnderlineStroke := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColorRec.Red);
  FUnderlineStroke.Dash := TStrokeDash.Dot;
  FSpellingWords := TObjectList<TSpellingWord>.Create;
end;

destructor TSpellingManager.Destroy;
begin
  FLines := nil;
  FreeAndNil(FSpellingWords);
  FreeAndNil(FUnderlineStroke);
  FreeAndNil(FFill);
  FreeAndNil(FMenuItems);
  FSpellService := nil;
  inherited;
end;

procedure TSpellingManager.DoReplaceWord(const ASpellingWord: TSpellingWord; const ASuggestion: string);
begin
  if Assigned(FOnReplaceWord) then
    FOnReplaceWord(ASpellingWord, ASuggestion);
end;

procedure TSpellingManager.FindSpellingErrorsInLine(const ALineIndex: Integer);
var
  Shift, BegPos, EndPos: Integer;
  Line: string;
  SpellingWord: string;
begin
  if FSpellService = nil then
    Exit;

  Shift := 0;
  Line := FLines[ALineIndex];
  while not Line.IsEmpty do
  begin
    if FMX.Text.FindWordBound(Line, 0, BegPos, EndPos) then
    begin
      SpellingWord := Line.Substring(BegPos, EndPos - BegPos + 1);
      if Length(FSpellService.CheckSpelling(SpellingWord)) > 0 then
        FSpellingWords.Add(TSpellingWord.Create(TCaretPosition.Create(ALineIndex, BegPos + Shift), SpellingWord, nil));
    end
    else
      EndPos := BegPos;
    Inc(Shift, EndPos + 1);
    Line := Line.Remove(0, EndPos + 1);
  end;
end;

procedure TSpellingManager.FindSpellingErrorsInLines;
var
  I: Integer;
begin
  FHighlightRect := TRectF.Empty;
  for I := 0 to FLines.Count - 1 do
    FindSpellingErrorsInLine(I)
end;

function TSpellingManager.FindSpellingWordByCaret(const ACaretPosition: TCaretPosition;
  out AIndex: Integer): Boolean;
var
  I: Integer;
begin
  for I := 0 to FSpellingWords.Count - 1 do
    if FSpellingWords[I].PosAtCurrentPos(ACaretPosition) then
    begin
      AIndex := I;
      Exit(True);
    end;
  Result := False;
end;

function TSpellingManager.GetListOfPrepositions(const ACaretPosition: TCaretPosition): TArray<string>;
var
  BP, EP: Integer;
  Line: string;
begin
  if (FSpellService <> nil) and (FLines.Count > 0) and (ACaretPosition.Line >= 0) and (ACaretPosition.Pos >= 0) then
  begin
    Line := FLines[ACaretPosition.Line];
    if FMX.Text.FindWordBound(Line, ACaretPosition.Pos, BP, EP) then
      Result := FSpellService.CheckSpelling(Line.Substring(BP, EP - BP + 1))
    else
      Result := nil;
  end
  else
    Result := nil;
end;

procedure TSpellingManager.HideHighlightSpell;
begin
  FHighlightRect := TRectF.Empty;
end;

procedure TSpellingManager.HighlightSpell(const ALines: TLinesLayout; const ACaretPosition: TCaretPosition);
var
  StartPos, EndPos: Integer;
  Region: TRegion;
begin
  if (FLines.Count > 0) and (ACaretPosition.Line >= 0) and (ACaretPosition.Pos >= 0) and
    FMX.Text.FindWordBound(FLines[ACaretPosition.Line], ACaretPosition.Pos, StartPos, EndPos) then
  begin
    Region := ALines.GetRegionForRange(TCaretPosition.Create(ACaretPosition.Line, StartPos), EndPos - StartPos + 1);
    if Length(Region) > 0 then
      FHighlightRect := Region[0]
    else
      FHighlightRect := TRectF.Empty;
  end;
end;

procedure TSpellingManager.DrawHighlightSpellingWords(const ALine: TLinesLayout; const AViewportSize: TSizeF; const ACanvas: TCanvas; const AOpacity: Single);

  procedure UnderlineWord(const ASpellingWord: TSpellingWord);
  var
    I: Integer;
    WordRect: TRectF;
  begin
    for I := Low(ASpellingWord.Bounds) to High(ASpellingWord.Bounds) do
    begin
      WordRect := ASpellingWord.Bounds[I];
      ACanvas.DrawLine(TPointF.Create(WordRect.Left, WordRect.Bottom), WordRect.BottomRight, AOpacity, FUnderlineStroke);
    end;
  end;

var
  TmpRect: TRectF;
  I: Integer;
  Line: TLineObject;
  SpellingWord: TSpellingWord;
begin
  if FSpellingWords.Count = 0 then
    Exit;

  TmpRect := TRectF.Create(0, 0, AViewportSize.Width, AViewportSize.Height);
  for I := 0 to FSpellingWords.Count - 1 do
  begin
    SpellingWord := FSpellingWords[I];
    Line := ALine[SpellingWord.Position.Line];

    if RectsIntersect(TmpRect, Line.Rect) then
    begin
      if not SpellingWord.HasBounds and (Line.Layout <> nil) then
        SpellingWord.Bounds := Line.Layout.RegionForRange(SpellingWord.TextRange);

      UnderlineWord(SpellingWord);
    end
    else
      FSpellingWords[I].InvalidateBounds;
  end;
  if not FHighlightRect.IsEmpty then
    ACanvas.FillRect(FHighlightRect, 0.2, FFill);
end;

function TSpellingManager.IsWordWrong(const ACaretPosition: TCaretPosition): Boolean;
var
  Ignore: Integer;
begin
  Result := FindSpellingWordByCaret(ACaretPosition, Ignore);
end;

procedure TSpellingManager.RemoveSpellingErrorsForLine(const ALineIndex: Integer);
var
  I: Integer;
  SpellingWord: TSpellingWord;
  Position: TCaretPosition;
begin
  for I := FSpellingWords.Count - 1 downto 0 do
  begin
    SpellingWord := FSpellingWords[I];
    if SpellingWord.Position.Line = ALineIndex then
      FSpellingWords.Delete(I)
    else if SpellingWord.Position.Line > ALineIndex then
    begin
      Position := SpellingWord.Position;
      Position.DecrementLine;
      SpellingWord.Position := Position;
      SpellingWord.InvalidateBounds;
    end;
  end;
end;

procedure TSpellingManager.Reset;
begin
  ClearMenuItems;
  FSpellingWords.Clear;
  FHighlightRect := TRectF.Empty;
end;

procedure TSpellingManager.ResetBounds;
var
  I: Integer;
begin
  for I := 0 to FSpellingWords.Count - 1 do
    FSpellingWords[I].InvalidateBounds;
end;

procedure TSpellingManager.SetFill(const Value: TBrush);
begin
  FFill.Assign(Value);
end;

procedure TSpellingManager.SetStroke(const Value: TStrokeBrush);
begin
  FUnderlineStroke.Assign(Value);
end;

procedure TSpellingManager.Spell(var ACaretPosition: TCaretPosition; const AWord: string);
var
  I: Integer;
  Index: Integer;
  SpellingWord: TSpellingWord;
begin
  if FindSpellingWordByCaret(ACaretPosition, Index) then
    try
      SpellingWord := FSpellingWords[Index];
      DoReplaceWord(SpellingWord, AWord);
      HideHighlightSpell;
      for I := Index + 1 to FSpellingWords.Count - 1 do
        FSpellingWords[I].InvalidateBounds;
      ACaretPosition := TCaretPosition.Create(ACaretPosition.Line, SpellingWord.Position.Pos + AWord.Length);
    finally
      FSpellingWords.Delete(Index);
    end;
end;

procedure TSpellingManager.SpellFixContextMenuHandler(Sender: TObject);
var
  SpellingWord: TSpellingWord;
begin
  if Sender is TMenuItem then
  begin
    SpellingWord := FSpellingWords[TMenuItem(Sender).Tag];
    DoReplaceWord(SpellingWord, TMenuItem(Sender).Text);
  end;
end;

procedure TSpellingManager.UpdateHighlightRect(const ALines: TLinesLayout; const AViewportSize: TSizeF; const AOffset: TPointF);
var
  Content: TRectF;

  function IsVisibleLine(const ALine: Integer): Boolean;
  begin
    Result := RectsIntersect(Content, ALines[ALine].Rect);
  end;

  procedure OffsetBounds(const ASpellingWord: TSpellingWord);
  var
    I: Integer;
  begin
    for I := Low(ASpellingWord.Bounds) to High(ASpellingWord.Bounds) do
      ASpellingWord.Bounds[I].Offset(AOffset)
  end;

var
  I: Integer;
  SpellingWord: TSpellingWord;
begin
  if not FHighlightRect.IsEmpty then
    FHighlightRect.Offset(AOffset);

  Content := TRectF.Create(0, 0, AViewportSize.Width, AViewportSize.Height);
  for I := 0 to FSpellingWords.Count - 1 do
  begin
    SpellingWord := FSpellingWords[I];
    if SpellingWord.HasBounds and IsVisibleLine(SpellingWord.Position.Line) then
      OffsetBounds(SpellingWord)
    else
      SpellingWord.InvalidateBounds;
  end;
end;

procedure TSpellingManager.AddSuggestionsToPopupMenu(const APopupMenu: TPopupMenu; const ACaretPosition: TCaretPosition);

  function CreateMenuItemForSuggestion(const AWord: string; const AWordIndex: Integer): TMenuItem;
  begin
    Result := TMenuItem.Create(APopupMenu);
    Result.Text := AWord;
    Result.Tag := AWordIndex;
    Result.Font.Style := Result.Font.Style + [TFontStyle.fsBold];
    Result.OnClick := SpellFixContextMenuHandler;
  end;

  procedure AddMenuItemToPopup(const AMenuItem: TMenuItem);
  begin
    APopupMenu.InsertObject(FMenuItems.Count, AMenuItem);
    FMenuItems.Add(AMenuItem);
  end;

var
  Suggestions: TArray<string>;
  MenuItem: TMenuItem;
  Index: Integer;
  Suggestion: string;
  SpellingWord: string;
begin
  ClearMenuItems;

  if (FSpellService <> nil) and FindSpellingWordByCaret(ACaretPosition, Index) then
  begin
    SpellingWord := FSpellingWords[Index].Word;
    Suggestions := FSpellService.CheckSpelling(SpellingWord);
    if Length(Suggestions) > 0 then
    begin
      { Suggestions }
      for Suggestion in Suggestions do
      begin
        MenuItem := CreateMenuItemForSuggestion(Suggestion, Index);
        AddMenuItemToPopup(MenuItem);
      end;
      { Separator }
      MenuItem := TMenuItem.Create(APopupMenu);
      MenuItem.Text := SMenuSeparator;
      AddMenuItemToPopup(MenuItem);
    end;
  end;
end;

end.
