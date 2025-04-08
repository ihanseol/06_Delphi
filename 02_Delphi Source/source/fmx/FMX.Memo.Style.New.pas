{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Memo.Style.New;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, System.UITypes, System.Generics.Collections, FMX.Platform, FMX.Memo, FMX.Graphics,
  FMX.Types, FMX.Controls, FMX.TextLayout, FMX.Objects, FMX.SpellChecker, FMX.Menus, FMX.Text,
  FMX.Presentation.Messages, FMX.Presentation.Style, FMX.Controls.Presentation, FMX.ScrollBox.Style,
  FMX.Controls.Model, FMX.ScrollBox, FMX.Text.LinesLayout, FMX.Text.UndoManager, FMX.Text.SelectionController,
  FMX.Text.AutoscrollController, FMX.Text.SpellingManager, FMX.Text.IMERender, FMX.Text.TextEditor,
  FMX.Text.InteractiveSelectors;

type
  TMemoUndoManager = class(TUndoManager)
  private
    FModel: TCustomMemoModel;
  protected
    procedure DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TInsertOptions); override;
    procedure DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TDeleteOptions); override;
  public
    constructor Create(const AModel: TCustomMemoModel);
    property Model: TCustomMemoModel read FModel;
  end;

{ TStyledMemo }

  TContextAction = (Cut, Copy, Paste, Delete, Undo, Redo, SelectAll);

  TContextMenuItem = class(TMenuItem)
  private
    FContextAction: TContextAction;
  public
    property ContextAction: TContextAction read FContextAction write FContextAction;
  end;

  TStyledMemo = class(TStyledCustomScrollBox, ITextInput, ITextSelection)
  protected type
    TSelectionMethod = (Keyboard, Mouse, LeftSelector, RightSelector, LongTapGesture);
    TSelectionMethods = set of TSelectionMethod;
    TSelectionOption = (SelectWords);
    TSelectionOptions = set of TSelectionOption;
    TScrollDirection = (Up, Down);
  private
    FEditor: TTextEditor;
    { Context Menu }
    FPopupMenu: TPopupMenu;
    FUndoManager: TUndoManager;
    FCharsBuffer: string;
    FSetFocusOnUp: Boolean;
    FAutoscrollController: TAutoscrollController;
    { Selection }
    FSelectionMethods: TSelectionMethods;
    FSelectionOptions: TSelectionOptions;
    { Selectors }
    FTextSelectors: TInteractiveTextSelectors;
    { Behavior }
    FDisableCaretInsideWords: Boolean;
    FUseLongTapForWordSelection: Boolean;
    function GetModel: TCustomMemoModel;
    function GetMemo: TCustomMemo;
    procedure SetCaretPosition(const Value: TCaretPosition);
    function GetCaretPosition: TCaretPosition;
    { Handlers }
    procedure ReplaceWordHandler(const ASpellingWord: TSpellingWord; const ASuggestion: string);
    procedure CaretPositionChanged(Sender: TObject; const ACaretPosition: TCaretPosition);
    procedure SelectionChangedHandler(Sender: TObject; const ASelStart, ALength: Integer);
    procedure ContextMenuItemClick(Sender: TObject);
    procedure AutoScrollHandler(const ADirection: TAutoscrollDirection; var AStop: Boolean);
    procedure ContentGetClipRectHandler(Sender: TObject; var AClipRect: TRectF);
    procedure SelectorPositionChangedHandler(Sender: TObject; const ASelector: TTextSelectorType; const AContentPoint: TPointF);
    procedure BeginInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
    procedure EndInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
  protected
    function DefineModelClass: TDataModelClass; override;

    { Messages from model }
    procedure MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>); message MM_MEMO_CHARCASE_CHANGED;
    procedure MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_CHECKSPELLING_CHANGED;
    procedure MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_HIDESELECTIONONEXIT_CHANGED;
    procedure MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_READONLY_CHANGED;
    procedure MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>); message MM_MEMO_IMEMODE_CHANGED;
    procedure MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>); message MM_MEMO_SELSTART_CHANGED;
    procedure MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>); message MM_MEMO_SELLENGTH_CHANGED;
    procedure MMTextSettingsChanged(var Message: TDispatchMessage); message MM_MEMO_TEXT_SETTINGS_CHANGED;
    procedure MMLinesInsertLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_INSERT_LINE;
    procedure MMLinesReplaceLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_PUT_LINE;
    procedure MMLinesDeleteLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_DELETE_LINE;
    procedure MMLinesExchangeLines(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_EXCHANGE_LINES;
    procedure MMLinesClear(var Message: TDispatchMessage); message MM_MEMO_LINES_CLEAR;
    procedure MMUpdateStateChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_UPDATE_STATE_CHANGED;
    procedure MMGetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>); message MM_MEMO_GET_CARET_POSITION;
    procedure MMSetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>); message MM_MEMO_SET_CARET_POSITION;
    procedure MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_CAN_SET_FOCUS;
    procedure MMLinesChanged(var Message: TDispatchMessage); message MM_MEMO_LINES_CHANGED;
    procedure MMMaxLengthChanged(var Message: TDispatchMessage); message MM_MEMO_MAXLENGTH_CHANGED;
    procedure MMGetCaretPositionByPoint(var Message: TDispatchMessageWithValue<TCustomMemoModel.TGetCaretPositionInfo>); message MM_MEMO_GET_CARET_POSITION_BY_POINT;

    { Messages from presented control }
    procedure PMInit(var Message: TDispatchMessage); message PM_INIT;
    procedure PMGotoLineBegin(var Message: TDispatchMessage); message PM_MEMO_GOTO_LINE_BEGIN;
    procedure PMGotoLineEnd(var Message: TDispatchMessage); message PM_MEMO_GOTO_LINE_END;
    procedure PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>); message PM_MEMO_UNDO_MANAGER_INSERT_TEXT;
    procedure PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>); message PM_MEMO_UNDO_MANAGER_DELETE_TEXT;
    procedure PMUndo(var Message: TDispatchMessage); message PM_MEMO_UNDO_MANAGER_UNDO;
    procedure PMSelectText(var Message: TDispatchMessage); message PM_MEMO_SELECT_TEXT;
    procedure PMRootChanged(var Message: TDispatchMessageWithValue<IRoot>); message PM_ROOT_CHANGED;

    { TfgPresentedScrollBox }
    procedure PMSetContent(var Message: TDispatchMessageWithValue<TScrollContent>); message PM_SET_CONTENT;

    { ITextInput }
    function GetTextService: TTextService;
    function GetTargetClausePointF: TPointF;
    procedure StartIMEInput;
    procedure EndIMEInput;
    procedure IMEStateUpdated;
    function GetSelection: string;
    function GetSelectionRect: TRectF;
    function GetSelectionBounds: TRect;
    function GetSelectionPointSize: TSizeF;
    function HasText: Boolean;

    { ITextSelection }
    procedure SetSelection(const AStart: TCaretPosition; const ALength: Integer);

    { Rendering }
    procedure ContentPaint(Sender: TObject; ACanvas: TCanvas; const ARect: TRectF);

    { Selections }
    /// <summary>Returns selection region in the <c>Content</c> coordinate system.</summary>
    /// <remarks>It works slowly on a large number of lines of text. If you need to get a selection only within
    /// the visible area, use the method <c>GetVisibleSelectionRegion</c>.</remarks>
    function IsSelecting: Boolean;
    function NeedShowSelection: Boolean; virtual;

    { Autoscroll }
    procedure StartAutoScroll(const ALocalPoint: TPointF);

    { Popup menu }
    procedure ExecuteContextAction(const AAction: TContextAction); virtual;
    procedure FillPopupMenu(const AMenu: TPopupMenu); virtual;
    ///<summary>Updates the current state of popup menu items.</summary>
    procedure UpdatePopupMenuItems(const AMenu: TPopupMenu); virtual;

    { Mouse events }
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure AniMouseDown(const Touch: Boolean; const X, Y: Single); override;
    procedure AniMouseMove(const Touch: Boolean; const X, Y: Single); override;
    procedure AniMouseUp(const Touch: Boolean; const X, Y: Single); override;

    { Gestures }
    procedure CMGesture(var EventInfo: TGestureEventInfo); override;
    procedure DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean); override;
    procedure LongTap(const ALocalPoint: TPointF; const AFlags: TInteractiveGestureFlags);
    procedure DblTap;

    { inherited }
    function ShowContextMenu(const ScreenPosition: TPointF): Boolean; override;
    procedure DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
                                       const ContentSizeChanged: Boolean); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; var KeyChar: Char; Shift: TShiftState); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DoBeginUpdate; override;
    procedure DoEndUpdate; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Resize; override;
    procedure DoChange; virtual;
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject); override;

    function CreateEditor: TTextEditor; virtual;
    function CreateTextSelectors: TInteractiveTextSelectors; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function QueryInterface(const IID: TGUID; out Obj): HRESULT; override; stdcall;

    procedure RecalcOpacity; override;

    /// <summary>Rollback the latest changes.</summary>
    procedure Undo;
    procedure Redo;

    ///<summary>Repainting content in memo.</summary>
    procedure RepaintContent;

    { Caret navigation }
    procedure PutCaretTo(const X, Y: Single; const APositionByWord: Boolean = False);

    { Viewport }
    procedure ScrollOnLine(const ADirection: TScrollDirection);
    function ViewportRect: TRectF;
  public
    property Model: TCustomMemoModel read GetModel;
    property Memo: TCustomMemo read GetMemo;

    property AutoscrollController: TAutoscrollController read FAutoscrollController;
    ///<summary>Current caret position in text.</summary>
    property CaretPosition: TCaretPosition read GetCaretPosition write SetCaretPosition;
    property DisableCaretInsideWords: Boolean read FDisableCaretInsideWords write FDisableCaretInsideWords;
    property UseLongTapForWordSelection: Boolean read FUseLongTapForWordSelection write FUseLongTapForWordSelection;
    property Editor: TTextEditor read FEditor;
    property UndoManager: TUndoManager read FUndoManager;
    property TextSelectors: TInteractiveTextSelectors read FTextSelectors;
  end;

implementation

uses
  System.SysUtils, System.RTLConsts, System.Variants, System.Math, System.UIConsts, System.Character, System.Math.Vectors,
  FMX.Presentation.Factory, FMX.Utils, FMX.Consts, FMX.Clipboard, FMX.Platform.Metrics;

const
  CutStyleName = 'cut'; //Do not localize
  UndoStyleName = 'undo'; //Do not localize
  RedoStyleName = 'redo'; //Do not localize
  CopyStyleName = 'copy'; //Do not localize
  PasteStyleName = 'paste'; //Do not localize
  DeleteStyleName = 'delete'; //Do not localize
  SelectAllStyleName = 'selectall'; //Do not localize

type
  TInteractiveTextSelectorsHelper = class helper for TInteractiveTextSelectors
  private
    procedure SetShouldShowCaretSelector(const Value: Boolean);
  public
    procedure Realign;
    property ShouldShowCaretSelector: Boolean write SetShouldShowCaretSelector;
  end;

  TFixedInteractiveTextSelectors = class(TInteractiveTextSelectors)
  private
    FShouldShowCaretSelector: Boolean;
    procedure SetShouldShowCaretSelector(const Value: Boolean);
  protected
    procedure RealignCaretSelector;
  public
    procedure Realign;
    /// <summary>Should show caret selector point, if it's supported?</summary>
    property ShouldShowCaretSelector: Boolean read FShouldShowCaretSelector write SetShouldShowCaretSelector;
  end;

{ TStyledMemo }

function TStyledMemo.GetMemo: TCustomMemo;
begin
  Result := PresentedControl as TCustomMemo;
end;

function TStyledMemo.GetModel: TCustomMemoModel;
begin
  Result := inherited GetModel<TCustomMemoModel>;
end;

constructor TStyledMemo.Create(AOwner: TComponent);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  inherited;
  EnableExecuteAction := False;
  CanFocus := False;
  AutoCapture := True;
  SetAcceptsControls(False);
  Touch.InteractiveGestures := Touch.InteractiveGestures + [TInteractiveGesture.DoubleTap, TInteractiveGesture.LongTap];

  FUndoManager := TMemoUndoManager.Create(Model);

  FAutoscrollController := TAutoscrollController.Create;
  FAutoscrollController.OnScroll := AutoScrollHandler;

  { Editor }

  FEditor := CreateEditor;
  FEditor.Caret := Model.Caret;
  FEditor.SpellingManager.OnReplaceWord := ReplaceWordHandler;
  FEditor.OnSelectionChanged := SelectionChangedHandler;
  FEditor.OnCaretPositionChanged := CaretPositionChanged;

  { Selectors }

  FTextSelectors := CreateTextSelectors;
  FTextSelectors.OnSelectorPositionChanged := SelectorPositionChangedHandler;
  FTextSelectors.OnBeginSelection := BeginInteractiveSelectionHandler;
  FTextSelectors.OnEndSelection := EndInteractiveSelectionHandler;

  { Context Menu }

  FPopupMenu := TPopupMenu.Create(Self);
  FPopupMenu.Stored := False;
  FPopupMenu.PopupComponent := Self;
  FillPopupMenu(FPopupMenu);
  FPopupMenu.AddFreeNotify(Self);

  if TPlatformServices.Current.SupportsPlatformService(IFMXPlatformPropertiesService, PropertiesService) then
  begin
    FDisableCaretInsideWords := PropertiesService.GetValue('TextEditor.DisableCaretInsideWords', False)
                                                 .AsBoolean;
    FUseLongTapForWordSelection := PropertiesService.GetValue('TextEditor.UseLongTapForWordSelection', False)
                                                    .AsBoolean;
  end
  else
  begin
    FDisableCaretInsideWords := False;
    FUseLongTapForWordSelection := False;
  end;
end;

function TStyledMemo.CreateEditor: TTextEditor;
begin
  Result := TTextEditor.Create(PresentedControl, Content, Model, Self);
end;

function TStyledMemo.CreateTextSelectors: TInteractiveTextSelectors;
begin
  Result := TFixedInteractiveTextSelectors.Create(Self, FEditor);
end;

function TStyledMemo.DefineModelClass: TDataModelClass;
begin
  Result := TCustomMemoModel;
end;

destructor TStyledMemo.Destroy;
begin
  FreeAndNil(FTextSelectors);
  FreeAndNil(FEditor);
  Content.OnPaint := nil;
  Content.OnGetClipRect := nil;
  FreeAndNil(FAutoscrollController);
  FreeAndNil(FUndoManager);
  FreeAndNil(FPopupMenu);
  inherited;
end;

procedure TStyledMemo.DoEndUpdate;
begin
  inherited;
  FEditor.EndUpdate;
  if not IsUpdating then
    FTextSelectors.Realign;
end;

procedure TStyledMemo.DoEnter;
var
  LCaret: ICaret;
begin
  inherited;
  if Supports(Memo, ICaret, LCaret) then
    LCaret.ShowCaret;
  FEditor.UpdateTextService;
  FEditor.UpdateCaretPoint;
  FTextSelectors.Install;
  FTextSelectors.Realign;
  if Model.AutoSelect then
    Memo.SelectAll;
end;

procedure TStyledMemo.DoExit;
begin
  DoChange;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueUpdate(Observers);
  FEditor.Repaint;
  FTextSelectors.Realign;
  FTextSelectors.Uninstall;
  inherited;
end;

procedure TStyledMemo.DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    igiLongTap:
    begin
      LongTap(AbsoluteToLocal(EventInfo.Location), EventInfo.Flags);
      Handled := True;
    end;

    igiDoubleTap:
    begin
      DblTap;
      Handled := True;
    end;
  else
    inherited;
  end;
end;

function TStyledMemo.GetCaretPosition: TCaretPosition;
begin
  Result := FEditor.CaretPosition;
end;

procedure TStyledMemo.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);

  function GetLeftWordBegin(const APosition: TCaretPosition): TCaretPosition;
  var
    CurrentLine: string;
    LLines: TStrings;
  begin
    LLines := Model.Lines;
    if LLines.Count = 0 then
      Exit(APosition);

    Result.Pos := APosition.Pos;
    Result.Line := APosition.Line;
    CurrentLine := LLines[Result.Line];

    if APosition.Pos > 0 then
    begin
      Result.Pos := GetLexemeBegin(CurrentLine, APosition.Pos);
      // If cursor is placed in the beginning of word, we have to take beginning pos of previous word.
      if Result.Pos = APosition.Pos then
        Result.Pos := GetPrevLexemeBegin(CurrentLine, APosition.Pos);
    end
    else if (APosition.Line - 1 >= 0) and (APosition.Line - 1 <= LLines.Count - 1) then
    begin
      Result.Line := APosition.Line - 1;
      Result.Pos := CurrentLine.Length;
    end;
  end;

  procedure DeleteTextByBackspace(const AIsCtrlOrCmd: Boolean);
  var
    DeleteLength: Integer;
    LCaret: TCaretPosition;
  begin
    if Model.ReadOnly then
      Exit;

    if Model.SelLength <> 0 then
      Memo.DeleteSelection
    else if AIsCtrlOrCmd then
    begin
      // Deleting whole word
      LCaret := GetLeftWordBegin(CaretPosition);
      if LCaret.IsInvalid then
        Exit;
      Model.DeleteFrom(LCaret, Model.PosToTextPos(CaretPosition) - Model.PosToTextPos(LCaret),
        [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
    end
    // Deleting single character
    else if Model.PosToTextPos(CaretPosition) > 0 then
    begin
      if (Model.Lines[CaretPosition.Line].Length > 0) and
        Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos - 1].IsLowSurrogate then
        Model.DeleteFrom(Model.GetPositionShift(CaretPosition, -2), 2,
          [TDeleteOption.MoveCaret, TDeleteOption.CanUndo])
      else
      begin
        if CaretPosition.Pos = 0 then
          DeleteLength := Model.Lines.LineBreak.Length
        else
          DeleteLength := 1;

         Model.DeleteFrom(Model.GetPositionShift(CaretPosition, -1), DeleteLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
      end;
    end;
  end;

  procedure DeleteTextByDel(const AIsCtrlOrCmd: Boolean);
  begin
    if Model.ReadOnly then
      Exit;

    if Model.SelLength <> 0 then
    begin
      if ssShift in Shift then
        Memo.CutToClipboard
      else
        Memo.DeleteSelection;
    end
    else if AIsCtrlOrCmd then
      Model.DeleteFrom(CaretPosition, Min(FMX.Text.GetLexemeEnd(Model.Lines[CaretPosition.Line],
        CaretPosition.Pos), Model.Lines[CaretPosition.Line].Length) - CaretPosition.Pos + 1,
        [TDeleteOption.CanUndo])
    else if HasText then
    begin
      if (CaretPosition.Pos < Model.Lines[CaretPosition.Line].Length) and
        Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos].IsHighSurrogate then
        Model.DeleteFrom(CaretPosition, 2, [TDeleteOption.CanUndo])
      else if CaretPosition.Pos = Model.Lines[CaretPosition.Line].Length then
        // We are in the end of line, So we have to remove line break
        Model.DeleteFrom(CaretPosition, Model.Lines.LineBreak.Length, [TDeleteOption.CanUndo])
      else
        Model.DeleteFrom(CaretPosition, 1, [TDeleteOption.CanUndo]);
    end;
  end;

var
  TmpS: string;
  IsCtrlOrCmd: Boolean;
  LTmpOptions: TInsertOptions;
  KeyHandled: Boolean;
  IgnoreResetSelection: Boolean;
begin
  KeyHandled := False;
  IgnoreResetSelection := False;

  IsCtrlOrCmd := Shift * [ssCtrl, ssCommand] <> [];

  // Shift key can be used for pressing Uppercase characters, In this case we don't need to consider this case as selection.
  if (ssShift in Shift) and (KeyChar = #0) then
    Include(FSelectionMethods, TSelectionMethod.Keyboard);

  if IsCtrlOrCmd and (Key in [vkControl, vkUp, vkDown, vkC, vkLCommand, vkRCommand]) or (Key in [vkLWin, vkRWin]) then
    IgnoreResetSelection := True;

  if Observers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if (Key in [vkReturn, vkBack, vkDelete]) or ((Key = vkInsert) and (ssShift in Shift)) then
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
      begin
        TLinkObservers.EditLinkReset(Observers);
        Exit;
      end;

    if (KeyChar >= #32) and not TLinkObservers.EditLinkIsValidChar(Observers, KeyChar) then
    begin
      KeyChar := #0;
      Exit;
    end;
    case KeyChar of
      ^H, ^V, ^X, #32 .. High(Char):
        if TLinkObservers.EditLinkEdit(Observers) then
          TLinkObservers.EditLinkModified(Observers)
        else
        begin
          KeyChar := #0;
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end;
      #27:
        begin
          TLinkObservers.EditLinkReset(Observers);
          Memo.SelectAll;
          KeyChar := #0;
          Exit;
        end;
    end;
  end;

  if Observers.IsObserving(TObserverMapping.ControlValueID) and (KeyChar <> #0) then
    TLinkObservers.ControlValueModified(Observers);

  inherited KeyDown(Key, KeyChar, Shift);

  // We don't process any combination with Alt key.
  if ssAlt in Shift then
    Exit;

  if (Key = vkReturn) and not (ssCommand in Shift) and not Model.ReadOnly then
  begin
    if Model.SelLength > 0 then
    begin
      Model.DeleteFrom(FEditor.SelectionController.SelBegin, Model.SelLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo,
                       TDeleteOption.Selected]);
      LTmpOptions := [TInsertOption.UndoPairedWithPrev];
    end
    else
      LTmpOptions := [];
    TmpS := Model.Lines.LineBreak;
    Model.InsertAfter(CaretPosition, TmpS, LTmpOptions + [TInsertOption.MoveCaret, TInsertOption.CanUndo]);
    Model.SelLength := 0;
    Key := 0;
    DoChange;
  end;
  case Key of
    vkA:
      if IsCtrlOrCmd then
      begin
        Memo.SelectAll;
        IgnoreResetSelection := True;
        KeyHandled := True;
      end;
    vkC:
      if IsCtrlOrCmd then
      begin
        Memo.CopyToClipboard;
        KeyHandled := True;
      end;
    vkV:
      if IsCtrlOrCmd then
      begin
        Memo.PasteFromClipboard;
        KeyHandled := True;
      end;
    vkX:
      if IsCtrlOrCmd and not Model.ReadOnly then
      begin
        Memo.CutToClipboard;
        KeyHandled := True;
      end;
    vkZ:
      if IsCtrlOrCmd then
      begin
        if ssShift in Shift then
          Redo
        else
          Undo;
        KeyHandled := True;
      end;
    vkEnd:
      begin
        if IsCtrlOrCmd then
          FEditor.GoToTextEnd
        else
          FEditor.GoToLineEnd;
        KeyHandled := True;
      end;
    vkHome:
      begin
        if IsCtrlOrCmd then
          FEditor.GoToTextBegin
        else
          FEditor.GoToLineBegin;
        KeyHandled := True;
      end;
    vkLeft:
      begin
        FEditor.MoveCaretLeftRTL(IsCtrlOrCmd);
        KeyHandled := True;
      end;
    vkRight:
      begin
        FEditor.MoveCaretRightRTL(IsCtrlOrCmd);
        KeyHandled := True;
      end;
    vkUp:
      begin
        if IsCtrlOrCmd then
          ScrollOnLine(TScrollDirection.Up)
        else
          FEditor.MoveCaretVertical(-1);
        KeyHandled := True;
      end;
    vkDown:
      begin
        if IsCtrlOrCmd then
          ScrollOnLine(TScrollDirection.Down)
        else
          FEditor.MoveCaretVertical(1);
        KeyHandled := True;
      end;
    vkPrior:
      begin
        FEditor.MoveCaretPageUp;
        KeyHandled := True;
      end;
    vkNext:
      begin
        FEditor.MoveCaretPageDown;
        KeyHandled := True;
      end;
    vkDelete:
      begin
        DeleteTextByDel(IsCtrlOrCmd);
        KeyHandled := True;
      end;
    vkBack:
      begin
        DeleteTextByBackspace(IsCtrlOrCmd);
        KeyHandled := True;
      end;
    vkInsert:
      if IsCtrlOrCmd then
      begin
        Memo.CopyToClipboard;
        KeyHandled := True;
      end
      else if [ssShift] * Shift <> [] then
      begin
        Memo.PasteFromClipboard;
        KeyHandled := True;
      end;
    vkProcessKey:
      IgnoreResetSelection := True;
  end;

  if (KeyChar <> #0) and not Model.ReadOnly then
  begin
    FCharsBuffer := FCharsBuffer + KeyChar;
    if not KeyChar.IsHighSurrogate then
    begin
      if Model.SelLength > 0 then
      begin
        Model.DeleteFrom(FEditor.SelectionController.SelBegin, Model.SelLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
        LTmpOptions := [TInsertOption.UndoPairedWithPrev];
      end
      else
        LTmpOptions := [];
      Model.InsertAfter(CaretPosition, FCharsBuffer, LTmpOptions + [TInsertOption.MoveCaret, TInsertOption.CanUndo,
                        TInsertOption.Typed]);
      FCharsBuffer := string.Empty;
      Model.SelLength := 0;
    end;
    KeyHandled := True;
  end
  else
  begin
    FCharsBuffer := string.Empty;
    if Key in [vkEnd, vkHome, vkLeft, vkRight, vkUp, vkDown, vkPrior, vkNext] then
    begin
      if IsSelecting then
        FEditor.SelectionController.Finish := CaretPosition;

      RepaintContent;
      KeyHandled := True;
    end;
  end;
  if not IsSelecting and not IgnoreResetSelection then
    FEditor.SelectionController.SetRange(CaretPosition, CaretPosition);

  if KeyHandled then
  begin
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TStyledMemo.KeyUp(var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  Exclude(FSelectionMethods, TSelectionMethod.Keyboard);
end;

procedure TStyledMemo.LongTap(const ALocalPoint: TPointF; const AFlags: TInteractiveGestureFlags);
begin
  Exclude(FSelectionMethods, TSelectionMethod.Mouse);

  if not (csDesigning in ComponentState) and not PresentedControl.IsFocused then
    PresentedControl.SetFocus;

  if FUseLongTapForWordSelection then
  begin
    if TInteractiveGestureFlag.gfBegin in AFlags then
    begin
      Include(FSelectionMethods, TSelectionMethod.LongTapGesture);
      Include(FSelectionOptions, TSelectionOption.SelectWords);

      PutCaretTo(ALocalPoint.X, ALocalPoint.Y);
      FEditor.SelectionController.SetRange(CaretPosition, CaretPosition);

      Memo.SelectWord;
      // User uses double selection mode, we have to hold selection of one word and don't allow to reset
      // this selection word until selection is not finished.
      FEditor.SelectionController.HoldSelection;
      if FEditor.TextService <> nil then
        FEditor.TextService.BeginSelection;
    end
    else if TInteractiveGestureFlag.gfEnd in AFlags then
    begin
      FEditor.SelectionController.UnholdSelection;
      Exclude(FSelectionMethods, TSelectionMethod.LongTapGesture);
      Exclude(FSelectionOptions, TSelectionOption.SelectWords);
      if FEditor.TextService <> nil then
        FEditor.TextService.EndSelection;
    end
    else
    begin
      PutCaretTo(ALocalPoint.X, ALocalPoint.Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
      FEditor.SelectionController.Finish := CaretPosition;
      StartAutoScroll(ALocalPoint);
      FEditor.UpdateContentOffset;
    end;
  end
  else
  begin
    FEditor.SelectionController.UnholdSelection;

    FTextSelectors.SetLoupePosition(ALocalPoint.X, ALocalPoint.Y);
    PutCaretTo(ALocalPoint.X, ALocalPoint.Y);

    if TInteractiveGestureFlag.gfBegin in AFlags then
      Include(FSelectionMethods, TSelectionMethod.LongTapGesture)
    else if TInteractiveGestureFlag.gfEnd in AFlags then
    begin
      FTextSelectors.HideLoupe;
      Exclude(FSelectionMethods, TSelectionMethod.LongTapGesture);
      // On Windows this event is being invoked in the middle of processing Touch messages, so we cannot start internal
      // popup menu message loop. Because in this case Windows doesn't handle mouse messages correctly.
      TThread.ForceQueue(nil, procedure
      begin
        ShowContextMenu(LocalToScreen(ALocalPoint));
      end);
    end;
  end;
end;

procedure TStyledMemo.MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Message.Value := not FSetFocusOnUp;
end;

procedure TStyledMemo.MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>);
begin
  FEditor.CharCase := Model.CharCase;
  RepaintContent;
end;

procedure TStyledMemo.MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  FEditor.CheckSpelling := Message.Value;
end;

procedure TStyledMemo.PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>);
begin
  FUndoManager.FragmentDeleted(Message.Value.StartPos, Message.Value.Fragment, Message.Value.Selected,
                               Message.Value.CaretMoved);
end;

procedure TStyledMemo.PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>);
begin
  FUndoManager.FragmentInserted(Message.Value.StartPos, Message.Value.Fragment, Message.Value.PairedWithPrev,
                                Message.Value.Typed);
end;

procedure TStyledMemo.MMGetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>);
begin
  Message.Value := CaretPosition;
end;

procedure TStyledMemo.MMGetCaretPositionByPoint(var Message: TDispatchMessageWithValue<TCustomMemoModel.TGetCaretPositionInfo>);
begin
  Message.Value.CaretPosition := FEditor.GetCaretPositionByPoint(Message.Value.HitPoint + ViewportPosition, Message.Value.RoundToWord);
end;

procedure TStyledMemo.PMGotoLineBegin(var Message: TDispatchMessage);
begin
  FEditor.GoToLineBegin;
end;

procedure TStyledMemo.PMGotoLineEnd(var Message: TDispatchMessage);
begin
  FEditor.GoToLineEnd;
end;

procedure TStyledMemo.MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  RepaintContent;
end;

procedure TStyledMemo.MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>);
begin
  FEditor.IMEMode := Message.Value;
end;

procedure TStyledMemo.MMLinesChanged(var Message: TDispatchMessage);
begin
end;

procedure TStyledMemo.MMLinesClear(var Message: TDispatchMessage);
begin
  FEditor.Clear;
end;

procedure TStyledMemo.MMLinesDeleteLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FEditor.DeleteLine(Message.Value.Index);
end;

procedure TStyledMemo.MMLinesExchangeLines(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FEditor.ExchangeLines(Message.Value.Index, Message.Value.ExtraIndex);
end;

procedure TStyledMemo.MMLinesInsertLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FEditor.InsertLine(Message.Value.Index, Message.Value.Text);
end;

procedure TStyledMemo.MMLinesReplaceLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FEditor.ReplaceLine(Message.Value.Index, Message.Value.Text);
end;

procedure TStyledMemo.MMMaxLengthChanged(var Message: TDispatchMessage);
begin
  FEditor.MaxLength := Model.MaxLength;
end;

procedure TStyledMemo.MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Model.Caret.ReadOnly := Message.Value;
end;

procedure TStyledMemo.MMSetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>);
begin
  FEditor.CaretPosition := Message.Value;
end;

procedure TStyledMemo.MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>);
begin
  FEditor.SelectText(Message.Value, 0);
end;

procedure TStyledMemo.MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>);
begin
  FEditor.SelectText(Model.SelStart, Message.Value);
end;

procedure TStyledMemo.MMTextSettingsChanged(var Message: TDispatchMessage);
var
  TextSettings: TTextSettings;
begin
  TextSettings := Model.TextSettingsInfo.ResultingTextSettings;
  FEditor.TextSettings := TextSettings;
  FEditor.FillTextFlags := FillTextFlags;

  if not (csLoading in ComponentState) then
  begin
    if FEditor.TextSettings.WordWrap then
      AniCalculations.TouchTracking := AniCalculations.TouchTracking - [ttHorizontal]
    else
      AniCalculations.TouchTracking := AniCalculations.TouchTracking + [ttHorizontal];

    FEditor.UpdateCaretPoint;
  end;
  RepaintContent;
end;

procedure TStyledMemo.PMUndo(var Message: TDispatchMessage);
begin
  Undo;
end;

procedure TStyledMemo.MMUpdateStateChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  if Message.Value then
    BeginUpdate
  else
    EndUpdate;
end;

procedure TStyledMemo.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FSetFocusOnUp := ([ssDouble, ssTouch] * Shift) = [ssTouch];
  inherited;
  if Button <> TMouseButton.mbLeft then
    Exit;

  if ssDouble in Shift then
  begin
    Memo.SelectWord;
    // User uses double selection mode, we have to hold selection of one word and don't allow to reset
    // this selection word until selection is not finished.
    FEditor.SelectionController.HoldSelection;
    Include(FSelectionOptions, TSelectionOption.SelectWords);
    Include(FSelectionMethods, TSelectionMethod.Mouse);
  end
  else if not (ssTouch in Shift) then
  begin
    PutCaretTo(X, Y, DisableCaretInsideWords);
    if IsSelecting then
      FEditor.SelectionController.Finish := CaretPosition
    else
    begin
      FEditor.SelectionController.SetRange(CaretPosition, CaretPosition);
      FTextSelectors.ShouldShowCaretSelector := True;
    end;

    if DisableCaretInsideWords then
      FEditor.SelectionController.HoldSelection;

    if not (ssTouch in Shift) then
      Include(FSelectionMethods, TSelectionMethod.Mouse);
  end;
end;

procedure TStyledMemo.ContentGetClipRectHandler(Sender: TObject; var AClipRect: TRectF);
var
  ClipRectExpansion: TRectF;
begin
  AClipRect := FEditor.LinesLayout.ViewportRect;
  ClipRectExpansion := FEditor.IMELayout.ExpandBackgroundMargins;
  AClipRect.Inflate(ClipRectExpansion.Left, ClipRectExpansion.Top, ClipRectExpansion.Right, ClipRectExpansion.Bottom);
end;

procedure TStyledMemo.ContentPaint(Sender: TObject; ACanvas: TCanvas; const ARect: TRectF);
begin
  FEditor.Render(ACanvas, ARect, NeedShowSelection);
end;

procedure TStyledMemo.DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  inherited;
  FEditor.ChangeViewportPosition(OldViewportPosition, NewViewportPosition, ContentSizeChanged);
  FTextSelectors.Realign;
end;

procedure TStyledMemo.AniMouseDown(const Touch: Boolean; const X, Y: Single);
begin
  if Touch and (FSelectionMethods = []) then
    inherited;
end;

procedure TStyledMemo.AniMouseMove(const Touch: Boolean; const X, Y: Single);
begin
  if Touch and (FSelectionMethods = []) then
    inherited;
end;

procedure TStyledMemo.AniMouseUp(const Touch: Boolean; const X, Y: Single);
begin
  if Touch and (FSelectionMethods = []) then
    inherited;
end;

procedure TStyledMemo.ApplyStyle;
var
  StyleResource: TFmxObject;
  BrushObject: TBrushObject;
  FontObject: IFontObject;
  TextSettingsInfo: TTextSettingsInfo;
  TextSettings: TTextSettings;
  DefaultTextSettings: TTextSettings;
  LColor: TAlphaColor;
begin
  TextSettingsInfo := Model.TextSettingsInfo;
  TextSettings := TextSettingsInfo.TextSettings;
  DefaultTextSettings := TextSettingsInfo.DefaultTextSettings;

  TextSettings.BeginUpdate;
  try
    TextSettingsInfo.Design := False;
    inherited;

    if FindStyleResource<TBrushObject>('selection', BrushObject) then
      Model.SelectionFill := BrushObject.Brush;

    { Default Text settings }
    if FindStyleResource<TBrushObject>('foreground', BrushObject) and BrushObject.TryGetSolidColor(LColor) then
      DefaultTextSettings.FontColor := LColor;
    StyleResource := FindStyleResource('font');
    if Supports(StyleResource, IFontObject, FontObject) and not TextSettings.Font.IsSizeStored then
      DefaultTextSettings.Font := FontObject.Font;
    DefaultTextSettings.HorzAlign := TTextAlign.Leading;

    { Caret Color }
    StyleResource := FindStyleResource('caretcolor');
    if StyleResource is TColorObject then
      Model.Caret.DefaultColor := TColorObject(StyleResource).Color
    else
      Model.Caret.DefaultColor := TAlphaColorRec.Null;
    TextSettings.Change;

    { Selectors }
    FTextSelectors.ApplyStyle;
  finally
    TextSettings.EndUpdate;
    TextSettingsInfo.Design := csDesigning in ComponentState;
  end;
  FEditor.TextSettings := Model.TextSettingsInfo.ResultingTextSettings;
end;

procedure TStyledMemo.RepaintContent;
begin
  if Content <> nil then
    Content.Repaint;
end;

procedure TStyledMemo.ReplaceWordHandler(const ASpellingWord: TSpellingWord; const ASuggestion: string);
begin
  Model.Replace(ASpellingWord.Position, ASpellingWord.Length, ASuggestion);
  RepaintContent;
end;

procedure TStyledMemo.Resize;
begin
  inherited;
  FEditor.InvalidateContentSize;
end;

procedure TStyledMemo.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if TSelectionMethod.Mouse in FSelectionMethods then
  begin
    PutCaretTo(X, Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
    FTextSelectors.ShouldShowCaretSelector := True;
    FEditor.SelectionController.Finish := CaretPosition;
    StartAutoScroll(TPointF.Create(X, Y));
    FEditor.UpdateContentOffset;
  end;
end;

procedure TStyledMemo.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FSetFocusOnUp and not AniCalculations.Moved then
  begin
    FSetFocusOnUp := False;
    if not (csDesigning in PresentedControl.ComponentState) and not PresentedControl.IsFocused then
      PresentedControl.SetFocus;
  end;
  if (ssTouch in Shift) and not AniCalculations.Moved then
  begin
    PutCaretTo(X, Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
    if not (TSelectionOption.SelectWords in FSelectionOptions) then
      FEditor.SelectionController.SetRange(CaretPosition, CaretPosition);
  end
  else if not (ssTouch in Shift) and (TSelectionMethod.Mouse in FSelectionMethods) and not AniCalculations.Moved then
  begin
    PutCaretTo(X, Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
    FEditor.SelectionController.Finish := CaretPosition;
  end;
  FEditor.UpdateCaretPoint;
  FEditor.SelectionController.UnholdSelection;
  FTextSelectors.ShouldShowCaretSelector := True;
  Exclude(FSelectionMethods, TSelectionMethod.Mouse);
  Exclude(FSelectionOptions, TSelectionOption.SelectWords);
  FAutoscrollController.Stop;
end;

procedure TStyledMemo.FillPopupMenu(const AMenu: TPopupMenu);
var
  LMenuItem: TContextMenuItem;
begin
  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditUndo);
  LMenuItem.StyleName := UndoStyleName;
  LMenuItem.ContextAction := TContextAction.Undo;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditRedo);
  LMenuItem.StyleName := RedoStyleName;
  LMenuItem.ContextAction := TContextAction.Redo;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := SMenuSeparator;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditCut);
  LMenuItem.StyleName := CutStyleName;
  LMenuItem.ContextAction := TContextAction.Cut;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditCopy);
  LMenuItem.StyleName := CopyStyleName;
  LMenuItem.ContextAction := TContextAction.Copy;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditPaste);
  LMenuItem.StyleName := PasteStyleName;
  LMenuItem.ContextAction := TContextAction.Paste;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditDelete);
  LMenuItem.StyleName := DeleteStyleName;
  LMenuItem.ContextAction := TContextAction.Delete;
  LMenuItem.OnClick := ContextMenuItemClick;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := SMenuSeparator;

  LMenuItem := TContextMenuItem.Create(AMenu);
  LMenuItem.Parent := AMenu;
  LMenuItem.Text := Translate(SEditSelectAll);
  LMenuItem.StyleName := SelectAllStyleName;
  LMenuItem.ContextAction := TContextAction.SelectAll;
  LMenuItem.OnClick := ContextMenuItemClick;
end;

procedure TStyledMemo.UpdatePopupMenuItems(const AMenu: TPopupMenu);
var
  ClipService: IFMXExtendedClipboardService;

  procedure SetEnabled(const AParamName: string; const AValue : Boolean);
  var
    MenuItem : TMenuItem;
  begin
    MenuItem := TMenuItem(AMenu.FindStyleResource(AParamName));
    if MenuItem <> nil then
      MenuItem.Enabled := AValue;
  end;

begin
  SetEnabled(UndoStyleName, not Model.ReadOnly and FUndoManager.CanUndo);
  SetEnabled(RedoStyleName, not Model.ReadOnly and FUndoManager.CanRedo);
  SetEnabled(CutStyleName, FEditor.SelectionController.IsSelected and not Model.ReadOnly);
  SetEnabled(CopyStyleName, FEditor.SelectionController.IsSelected);
  SetEnabled(PasteStyleName, TPlatformServices.Current.SupportsPlatformService(IFMXExtendedClipboardService, ClipService) and
    ClipService.HasText and not Model.ReadOnly);
  SetEnabled(DeleteStyleName, FEditor.SelectionController.IsSelected and not Model.ReadOnly);
  SetEnabled(SelectAllStyleName, Model.SelLength <> Model.Lines.Text.Length);
end;

function TStyledMemo.ViewportRect: TRectF;
begin
  if ContentLayout = nil then
    Result := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height)
  else
    Result := ContentLayout.BoundsRect;
end;

procedure TStyledMemo.ScrollOnLine(const ADirection: TScrollDirection);
var
  LLineHeight : Single;
  NewViewportPosition: TPointF;
  Delta: Single;
begin
  if HasText and VScrollBar.Visible then
  begin
    LLineHeight := Model.ContentBounds.Height / Model.Lines.Count;
    NewViewportPosition := ViewportPosition;
    case ADirection of
      TStyledMemo.TScrollDirection.Up: Delta := -LLineHeight;
      TStyledMemo.TScrollDirection.Down: Delta := LLineHeight;
    else
      Delta := LLineHeight;
    end;
    NewViewportPosition.Offset(0, Delta);
    ViewportPosition := NewViewportPosition;
  end;
end;

procedure TStyledMemo.EndIMEInput;
begin
  FEditor.EndIMEInput;
end;

procedure TStyledMemo.EndInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
begin
  FAutoscrollController.Stop;
  Exclude(FSelectionMethods, TSelectionMethod.LeftSelector);
  Exclude(FSelectionMethods, TSelectionMethod.RightSelector);
end;

procedure TStyledMemo.ExecuteContextAction(const AAction: TContextAction);
begin
  case AAction of
    TContextAction.Cut:
      Memo.CutToClipboard;
    TContextAction.Copy:
      Memo.CopyToClipboard;
    TContextAction.Paste:
      Memo.PasteFromClipboard;
    TContextAction.Delete:
      Memo.DeleteSelection;
    TContextAction.Undo:
      Undo;
    TContextAction.Redo:
      Redo;
    TContextAction.SelectAll:
      Memo.SelectAll;
  end;
end;

procedure TStyledMemo.AutoScrollHandler(const ADirection: TAutoscrollDirection; var AStop: Boolean);

  function DefineCaretPosition(const ACaretPosition: TCaretPosition; const ADirection: TAutoscrollDirection): TCaretPosition;
  begin
    Result := ACaretPosition;
    case ADirection of
      TAutoscrollDirection.LeftToRight:
        Result := TCaretPosition.Create(ACaretPosition.Line, ACaretPosition.Pos + 1);

      TAutoscrollDirection.RightToLeft:
        Result := TCaretPosition.Create(ACaretPosition.Line, Max(0, ACaretPosition.Pos - 1));

      TAutoscrollDirection.BottomToTop:
        if ACaretPosition.Line > 0 then
          Result := FEditor.CalculateCaretVertical(ACaretPosition, -1);

      TAutoscrollDirection.LeftBottomToRightTop,
      TAutoscrollDirection.RightBottomToLeftTop:
        Result := FEditor.CalculateCaretVertical(ACaretPosition, -1);

      TAutoscrollDirection.TopToBottom:
        if ACaretPosition.Line < FEditor.Lines.Count - 1  then
          Result := FEditor.CalculateCaretVertical(ACaretPosition, 1);

      TAutoscrollDirection.RightTopToLeftBottom:
        Result := FEditor.CalculateCaretVertical(ACaretPosition, 1);

      TAutoscrollDirection.LeftTopToRightBottom:
      begin
        Result := FEditor.CalculateCaretVertical(ACaretPosition, 1);
        if Result.Line = FEditor.LinesLayout.Count - 1 then
          Result := FEditor.CalculateLineEnd(Result);
      end;
    end;
  end;

var
  CurrentCaretPosition: TCaretPosition;
  NewCaretPosition: TCaretPosition;
begin
  if TSelectionMethod.LeftSelector in FSelectionMethods then
    CurrentCaretPosition := FEditor.SelectionController.Start
  else if TSelectionMethod.RightSelector in FSelectionMethods then
    CurrentCaretPosition := FEditor.SelectionController.Finish
  else
    CurrentCaretPosition := CaretPosition;

  NewCaretPosition := DefineCaretPosition(CurrentCaretPosition, ADirection);

  AStop := CurrentCaretPosition = NewCaretPosition;
  if AStop then
    Exit;

  FEditor.CaretPosition := NewCaretPosition;
  if TSelectionMethod.LeftSelector in FSelectionMethods then
  begin
    if NewCaretPosition < FEditor.SelectionController.Finish then
      FEditor.SelectionController.Start := NewCaretPosition
    else
      AStop := True;
  end
  else if TSelectionMethod.RightSelector in FSelectionMethods then
  begin
    if FEditor.SelectionController.Start < NewCaretPosition then
      FEditor.SelectionController.Finish := NewCaretPosition
    else
      AStop := True;
  end
  else if FSelectionMethods <> [] then
    FEditor.SelectionController.Finish := NewCaretPosition;
end;

procedure TStyledMemo.BeginInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
begin
  if AInitiator = TTextSelectorType.Left then
    Include(FSelectionMethods, TSelectionMethod.LeftSelector)
  else if AInitiator = TTextSelectorType.Right then
    Include(FSelectionMethods, TSelectionMethod.RightSelector);
end;

procedure TStyledMemo.DoBeginUpdate;
begin
  inherited;
  FEditor.BeginUpdate;
end;

procedure TStyledMemo.DoChange;
begin
  if not (csLoading in ComponentState) then
    Model.Change;
end;

procedure TStyledMemo.CaretPositionChanged(Sender: TObject; const ACaretPosition: TCaretPosition);
begin
  Model.DisableNotify;
  try
    Model.CaretPosition := ACaretPosition;
  finally
    Model.EnableNotify;
  end;
  if FTextSelectors.ActiveInitiator <> TTextSelectorType.Caret then
    FTextSelectors.ShouldShowCaretSelector := False;
end;

procedure TStyledMemo.CMGesture(var EventInfo: TGestureEventInfo);
begin
  inherited;
end;

procedure TStyledMemo.ContextMenuItemClick(Sender: TObject);
var
  Action: TContextAction;
begin
  if Sender is TContextMenuItem then
  begin
    Action := TContextMenuItem(Sender).ContextAction;
    ExecuteContextAction(Action);
  end;
end;

function TStyledMemo.ShowContextMenu(const ScreenPosition: TPointF): Boolean;
var
  LCaretPosition: TCaretPosition;
begin
  Result := inherited;
  FSelectionMethods := [];
  if not Result and not (csDesigning in ComponentState) then
  begin
    UpdatePopupMenuItems(FPopupMenu);
    if Model.CheckSpelling then
    begin
      LCaretPosition := FEditor.GetCaretPositionByPoint(ScreenToLocal(ScreenPosition));
      FEditor.SpellingManager.AddSuggestionsToPopupMenu(FPopupMenu, LCaretPosition);
    end;

    if Root <> nil then
      FPopupMenu.Parent := Root.GetObject;
    try
      FPopupMenu.Popup(Round(ScreenPosition.X), Round(ScreenPosition.Y));
    finally
      FPopupMenu.Parent := nil;
    end;
    Result := True;
  end;
end;

procedure TStyledMemo.FreeNotification(AObject: TObject);
begin
  inherited;
  if AObject = FPopupMenu then
    FPopupMenu := nil;
end;

procedure TStyledMemo.FreeStyle;
begin
  FTextSelectors.FreeStyle;
  inherited;
end;

procedure TStyledMemo.SetCaretPosition(const Value: TCaretPosition);
begin
  FEditor.CaretPosition := Value;
end;

procedure TStyledMemo.SetSelection(const AStart: TCaretPosition; const ALength: Integer);
begin
  FEditor.SelectionController.SetRange(AStart, TCaretPosition.Create(AStart.Line, AStart.Pos + ALength));
end;

procedure TStyledMemo.RecalcOpacity;
begin
  inherited;
  FEditor.Opacity := AbsoluteOpacity;
end;

procedure TStyledMemo.Redo;
begin
  if not Model.ReadOnly then
    FUndoManager.Redo;
end;

procedure TStyledMemo.DblTap;
begin
end;

function TStyledMemo.GetTextService: TTextService;
begin
  Result := FEditor.GetTextService;
end;

function LinkObserversValueModified(const AObservers: TObservers): Boolean;
begin
  Result := True;
  if AObservers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    Result := TLinkObservers.EditLinkEdit(AObservers);
    if Result then
      TLinkObservers.EditLinkModified(AObservers);
  end;
  if Result and AObservers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueModified(AObservers);
end;

procedure TStyledMemo.IMEStateUpdated;
begin
  FEditor.IMEStateUpdated;
end;

function TStyledMemo.GetTargetClausePointF: TPointF;
begin
  Result := FEditor.GetTargetClausePointF;
end;

procedure TStyledMemo.Undo;
begin
  if not Model.ReadOnly then
    FUndoManager.Undo;
end;

function TStyledMemo.IsSelecting: Boolean;
begin
  Result := FSelectionMethods <> [];
end;

procedure TStyledMemo.StartAutoScroll(const ALocalPoint: TPointF);
var
  Rect: TRectF;
  Direction: TAutoscrollDirection;
begin
  if not HasText then
    Exit;

  Rect := ViewportRect;
  if (ALocalPoint.X <= Rect.Left) and (ALocalPoint.Y <= Rect.Top) then
    Direction := TAutoscrollDirection.RightBottomToLeftTop
  else if (ALocalPoint.X <= Rect.Left) and (ALocalPoint.Y >= Rect.Bottom) then
    Direction := TAutoscrollDirection.RightTopToLeftBottom
  else if (ALocalPoint.X >= Rect.Right) and (ALocalPoint.Y <= Rect.Top) then
    Direction := TAutoscrollDirection.LeftBottomToRightTop
  else if (ALocalPoint.X >= Rect.Right) and (ALocalPoint.Y >= Rect.Bottom) then
    Direction := TAutoscrollDirection.LeftTopToRightBottom
  else if ALocalPoint.X <= Rect.Left then
    Direction := TAutoscrollDirection.RightToLeft
  else if ALocalPoint.X >= Rect.Right then
    Direction := TAutoscrollDirection.LeftToRight
  else if ALocalPoint.Y <= Rect.Top then
    Direction := TAutoscrollDirection.BottomToTop
  else if ALocalPoint.Y >= Rect.Bottom then
    Direction := TAutoscrollDirection.TopToBottom
  else
  begin
    FAutoscrollController.Stop;
    Exit;
  end;

  FAutoscrollController.Start(Direction);
end;

procedure TStyledMemo.StartIMEInput;
begin
  FEditor.StartIMEInput;
end;

procedure TStyledMemo.PMInit(var Message: TDispatchMessage);
var
  I: Integer;
begin
  inherited;
  FEditor.MaxLength := Model.MaxLength;
  if HasText then
  begin
    BeginUpdate;
    try
      for I := 0 to Model.Lines.Count - 1 do
        FEditor.LinesLayout.InsertLine(I, Model.Lines[I]);
    finally
      EndUpdate;
    end;
  end;
  if Model.Caret.Flasher <> nil then
    FEditor.LinesLayout.CaretWidth := Model.Caret.Flasher.Size.Width;
  Content.OnPaint := ContentPaint;
  Content.OnGetClipRect := ContentGetClipRectHandler;
end;

procedure TStyledMemo.PMRootChanged(var Message: TDispatchMessageWithValue<IRoot>);
begin
  inherited;
  FEditor.FillTextFlags := FillTextFlags;
end;

procedure TStyledMemo.PMSelectText(var Message: TDispatchMessage);
begin
  FEditor.SelectText(Model.SelStart, Model.SelLength);
end;

procedure TStyledMemo.PMSetContent(var Message: TDispatchMessageWithValue<TScrollContent>);
begin
  inherited;
  FEditor.Content := Content;
end;

procedure TStyledMemo.PutCaretTo(const X, Y: Single; const APositionByWord: Boolean);
var
  ContentPoint: TPointF;
begin
  // X, Y in the presentation coordinate system
  ContentPoint := ConvertLocalPointTo(Content, TPointF.Create(X, Y));
  FEditor.PutCaretTo(ContentPoint.X, ContentPoint.Y, APositionByWord);
end;

function TStyledMemo.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  if GetInterface(IID, Obj) or FEditor.GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TStyledMemo.HasText: Boolean;
begin
  Result := FEditor.HasText;
end;

function TStyledMemo.GetSelection: string;
begin
  Result := FEditor.SelectedText;
end;

function TStyledMemo.GetSelectionBounds: TRect;
begin
  Result := FEditor.GetSelectionBounds;
end;

function TStyledMemo.GetSelectionPointSize: TSizeF;
begin
  Result := TSizeF.Create(0, 0);
end;

function TStyledMemo.GetSelectionRect: TRectF;
begin
  Result := FEditor.GetSelectionRect(NeedShowSelection);
  Result.Location := ConvertLocalPointFrom(Content, Result.TopLeft);
end;

procedure TStyledMemo.SelectionChangedHandler(Sender: TObject; const ASelStart, ALength: Integer);
begin
  Model.DisableNotify;
  try
    Model.SelStart := ASelStart;
    Model.SelLength := ALength;
  finally
    Model.EnableNotify;
  end;
  if not IsUpdating then
    FTextSelectors.Realign;
  RepaintContent;
end;

procedure TStyledMemo.SelectorPositionChangedHandler(Sender: TObject; const ASelector: TTextSelectorType;
  const AContentPoint: TPointF);
var
  LocalPoint: TPointF;
begin
  LocalPoint := ConvertLocalPointFrom(Content, AContentPoint);
  StartAutoScroll(LocalPoint);
end;

function TStyledMemo.NeedShowSelection: Boolean;
begin
  Result := IsFocused or not Model.HideSelectionOnExit and FEditor.SelectionController.IsSelected;
end;

{ TMemoUndoManager }

constructor TMemoUndoManager.Create(const AModel: TCustomMemoModel);
begin
  inherited Create;
  FModel := AModel;
end;

procedure TMemoUndoManager.DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction;
  const AOptions: TDeleteOptions);
begin
  inherited;
  Model.DisableNotify;
  try
    Model.SelLength := 0;
  finally
    Model.EnableNotify;
  end;

  case AActionType of
    TActionType.Delete:
      Model.DeleteFrom(FModel.TextPosToPos(AEditInfo.StartPosition), AEditInfo.Fragment.Length, AOptions);
    TActionType.Insert:
      Model.InsertAfter(FModel.TextPosToPos(AEditInfo.StartPosition), AEditInfo.Fragment, [TInsertOption.MoveCaret]);
  end;
end;

procedure TMemoUndoManager.DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction;
  const AOptions: TInsertOptions);
begin
  inherited;
  Model.DisableNotify;
  try
    Model.SelLength := 0;
  finally
    Model.EnableNotify;
  end;

  case AActionType of
    TActionType.Delete:
      Model.InsertAfter(FModel.TextPosToPos(AEditInfo.StartPosition), AEditInfo.Fragment, AOptions);
    TActionType.Insert:
      Model.DeleteFrom(FModel.TextPosToPos(AEditInfo.StartPosition), AEditInfo.Fragment.Length, [TDeleteOption.MoveCaret]);
  end;
end;

type
  TFixedStyledMemo = class(TStyledMemo)
  private
    FIsRealignTextSelectors: Boolean;
    FIsRealigningViewport: Boolean;
  protected
    procedure RecalculateAbsoluteMatrices; override;
    procedure DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
                                       const ContentSizeChanged: Boolean); override;
  end;

{ TFixedStyledMemo }

procedure TFixedStyledMemo.DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  if FIsRealigningViewport then
    Exit;

  FIsRealigningViewport := True;
  try
    inherited;
  finally
    FIsRealigningViewport := False;
  end;
end;

procedure TFixedStyledMemo.RecalculateAbsoluteMatrices;
begin
  inherited;
  if (FTextSelectors <> nil) and not FIsRealignTextSelectors then
  begin
    FIsRealignTextSelectors := True;
    try
      FTextSelectors.Realign;
    finally
      FIsRealignTextSelectors := False;
    end;
  end;
end;

{ TFixedInteractiveTextSelectors }

procedure TFixedInteractiveTextSelectors.Realign;
begin
  RealignCaretSelector;
  RealignSelectionSelectors;
end;

procedure TFixedInteractiveTextSelectors.RealignCaretSelector;
var
  OldVisible: Boolean;
begin
  if (CaretSelector = nil) or not CaretSelector.HasParent then
    Exit;

  OldVisible := CaretSelector.Visible;
  CaretSelector.Position.Point := GetCaretSelectorPosition;
  CaretSelector.Visible := not HasSelection and Owner.IsFocused and IsVisibleInOwner(CaretSelector) and ShouldShowCaretSelector;
  if CaretSelector.Visible and not OldVisible then
    CaretSelector.BringToFront;
end;

procedure TFixedInteractiveTextSelectors.SetShouldShowCaretSelector(const Value: Boolean);
begin
  if FShouldShowCaretSelector <> Value then
  begin
    FShouldShowCaretSelector := Value;
    Realign;
  end;
end;

{ TInteractiveTextSelectorsHelper }

procedure TInteractiveTextSelectorsHelper.Realign;
begin
  if Self is TFixedInteractiveTextSelectors then
    TFixedInteractiveTextSelectors(Self).Realign
  else
    inherited Realign;
end;

procedure TInteractiveTextSelectorsHelper.SetShouldShowCaretSelector(const Value: Boolean);
begin
  if Self is TFixedInteractiveTextSelectors then
    TFixedInteractiveTextSelectors(Self).ShouldShowCaretSelector := Value
  else
    Self.Realign;
end;

initialization
  TPresentationProxyFactory.Current.Replace(TMemo, TControlType.Styled, TStyledPresentationProxy<TFixedStyledMemo>);
finalization
  TPresentationProxyFactory.Current.Unregister(TMemo, TControlType.Styled, TStyledPresentationProxy<TFixedStyledMemo>);
end.
