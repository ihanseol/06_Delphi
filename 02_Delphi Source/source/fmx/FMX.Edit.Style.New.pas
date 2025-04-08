{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Edit.Style.New;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.UITypes, System.Classes, FMX.Presentation.Messages, FMX.Presentation.Style,
  FMX.Controls.Presentation, FMX.Edit, FMX.Text, FMX.Text.LinesLayout, FMX.Text.UndoManager, FMX.Text.SelectionController,
  FMX.Text.AutoscrollController, FMX.Text.SpellingManager, FMX.Text.IMERender, FMX.Menus, FMX.Graphics, FMX.Types,
  FMX.Controls.Model, FMX.Controls, FMX.ScrollBox.Style, FMX.Text.TextEditor, FMX.Text.InteractiveSelectors;

type
  TStyledEdit = class;

  TEditUndoManager = class(TUndoManager)
  private
    FModel: TCustomEditModel;
  protected
    procedure DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TInsertOptions); override;
    procedure DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TDeleteOptions); override;
  public
    constructor Create(const AModel: TCustomEditModel);
    property Model: TCustomEditModel read FModel;
  end;

  TOnContentBoundsEvent = procedure (Sender: TObject; var ContentBounds: TRectF) of object;

  /// <summary>Container for the child controls of the scroll box.</summary>
  TStyledEditContent = class(TContent)
  private
    [Weak] FEdit: TStyledEdit;
    FOnGetClipRect: TOnContentBoundsEvent;
  protected
    function GetClipRect: TRectF; override;
    function ObjectAtPoint(P: TPointF): IControl; override;
    function DoGetUpdateRect: TRectF; override;
  public
    constructor Create(AOwner: TComponent); override;
    function PointInObjectLocal(X, Y: Single): Boolean; override;
  public
    /// <summary> The handler for this event should return the clip rectangle </summary>
    property OnGetClipRect:TOnContentBoundsEvent read FOnGetClipRect write FOnGetClipRect;
  end;

{ TStyledEdit }

  TContextAction = (Cut, Copy, Paste, Delete, Undo, Redo, SelectAll);

  TContextMenuItem = class(TMenuItem)
  private
    FContextAction: TContextAction;
  public
    property ContextAction: TContextAction read FContextAction write FContextAction;
  end;

  TStyledEdit = class(TStyledPresentation, ITextInput, ITextSelection, IScrollableContent)
  public const
    DefaultEmptySelectionWidth = 5;
    IMEWindowGap = 2; // Small space between conrol and IME window
    MarkedTextBackgroundOpacity = 0.9;
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
    { Content }
    FContent: TStyledEditContent;
    FViewportPosition: TPointF;
    FAutoscrollController: TAutoscrollController;
    { Selection }
    FSelectionMethods: TSelectionMethods;
    FSelectionOptions: TSelectionOptions;
    { Selectors }
    FTextSelectors: TInteractiveTextSelectors;
    { Style Objects }
    FLeftLayout: TControl;
    FButtonsLayout: TControl;
    FPrompt: TControl;
    FContentLayout: TControl;
    { Behavior }
    FDisableCaretInsideWords: Boolean;
    FUseLongTapForWordSelection: Boolean;
    function GetModel: TCustomEditModel;
    function GetEdit: TCustomEdit;
    procedure SetCaretPosition(const Value: Integer);
    function GetCaretPosition: Integer;
    procedure UpdatePromptTextSettings;
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
    { IScrollableContent }
    function GetViewportPosition: TPointF;
    procedure SetViewportPosition(const Value: TPointF);
    function GetViewportSize: TSizeF;
    procedure SetContentSize(const ASize: TSizeF);
    function GetContentSize: TSizeF;
    property ViewportPosition: TPointF read GetViewportPosition write SetViewportPosition;
    property ViewportSize: TSizeF read GetViewportSize;
  protected
    function DefineModelClass: TDataModelClass; override;

    procedure DoTyping; virtual;
    procedure DoResized; override;

    procedure RealignContent; virtual;
    procedure RealignButtonsContainer; virtual;

    { Messages from TCustomEditModel }
    procedure MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>); message MM_EDIT_CHARCASE_CHANGED;
    procedure MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_EDIT_CHECKSPELLING_CHANGED;
    procedure MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_EDIT_HIDESELECTIONONEXIT_CHANGED;
    procedure MMPasswordChanged(var AMessage: TDispatchMessage); message MM_EDIT_ISPASSWORD_CHANGED;
    procedure MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_EDIT_READONLY_CHANGED;
    procedure MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>); message MM_EDIT_IMEMODE_CHANGED;
    procedure MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>); message MM_EDIT_SELSTART_CHANGED;
    procedure MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>); message MM_EDIT_SELLENGTH_CHANGED;
    procedure MMTextSettingsChanged(var Message: TDispatchMessage); message MM_EDIT_TEXT_SETTINGS_CHANGED;
    procedure MMTextChanged(var AMessage: TDispatchMessageWithValue<string>); message MM_EDIT_TEXT_CHANGED;
    procedure MMTextChanging(var AMessage: TDispatchMessageWithValue<string>); message MM_EDIT_TEXT_CHANGING;
    procedure MMEditButtonsChanged(var Message: TDispatchMessage); message MM_EDIT_EDITBUTTONS_CHANGED;
    procedure MMPromptTextChanged(var Message: TDispatchMessage); message MM_EDIT_PROMPTTEXT_CHANGED;
    procedure MMFilterCharChanged(var Message: TDispatchMessage); message MM_EDIT_FILTERCHAR_CHANGED;
    procedure MMSetCaretPosition(var Message: TDispatchMessageWithValue<Integer>); message MM_EDIT_CARETPOSITION_CHANGED;
    procedure MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>); message MM_EDIT_CAN_SET_FOCUS;
    procedure MMMaxLengthChanged(var Message: TDispatchMessage); message MM_EDIT_MAXLENGTH_CHANGED;
    procedure MMGetCaretPositionByPoint(var Message: TDispatchMessageWithValue<TCustomEditModel.TGetCaretPositionInfo>); message MM_EDIT_GET_CARET_POSITION_BY_POINT;

    { Messages from TCustomEdit }
    procedure PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>); message PM_EDIT_UNDO_MANAGER_INSERT_TEXT;
    procedure PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>); message PM_EDIT_UNDO_MANAGER_DELETE_TEXT;
    procedure PMUndo(var Message: TDispatchMessage); message PM_EDIT_UNDO_MANAGER_UNDO;
    procedure PMRootChanged(var Message: TDispatchMessageWithValue<IRoot>); message PM_ROOT_CHANGED;

    { Messages from TPresentedControl }
    procedure PMInit(var Message: TDispatchMessage); message PM_INIT;

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

    { Gestures }
    procedure CMGesture(var EventInfo: TGestureEventInfo); override;
    procedure DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean); override;
    procedure LongTap(const ALocalPoint: TPointF; const AFlags: TInteractiveGestureFlags);
    procedure DblTap;

    { inherited }
    function ShowContextMenu(const ScreenPosition: TPointF): Boolean; override;
    procedure ChangeViewportPosition(const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
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
    procedure DoRealign; override;
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
    function ContentLayoutRect: TRectF;
  public
    property Model: TCustomEditModel read GetModel;
    property Edit: TCustomEdit read GetEdit;
    property AutoscrollController: TAutoscrollController read FAutoscrollController;
    ///<summary>Current caret position in text.</summary>
    property CaretPosition: Integer read GetCaretPosition write SetCaretPosition;
    property Content: TStyledEditContent read FContent;
    property DisableCaretInsideWords: Boolean read FDisableCaretInsideWords write FDisableCaretInsideWords;
    property UseLongTapForWordSelection: Boolean read FUseLongTapForWordSelection write FUseLongTapForWordSelection;
    property Editor: TTextEditor read FEditor;
    property UndoManager: TUndoManager read FUndoManager;
    property TextSelectors: TInteractiveTextSelectors read FTextSelectors;
    property ButtonsLayout: TControl read FButtonsLayout;
    property LeftLayout: TControl read FLeftLayout;
  end;

implementation

uses
  System.SysUtils, System.RTLConsts, System.Variants, System.Math, System.UIConsts, System.Character, System.Math.Vectors,
  FMX.Presentation.Factory, FMX.Utils, FMX.Consts, FMX.Clipboard, FMX.Platform,
  FMX.ActnList, FMX.TextLayout, FMX.Platform.Metrics;

const
  CutStyleName = 'cut'; //Do not localize
  UndoStyleName = 'undo'; //Do not localize
  RedoStyleName = 'redo'; //Do not localize
  CopyStyleName = 'copy'; //Do not localize
  PasteStyleName = 'paste'; //Do not localize
  DeleteStyleName = 'delete'; //Do not localize
  SelectAllStyleName = 'selectall'; //Do not localize
  PromptVisibilityStyleDataName = 'prompt.Visible'; // do not localize
  ButtonsStyleResourceName = 'buttons'; //Do not localize
  LeftButtonsStyleResourceName = 'leftbuttons'; //Do not localize
  PromptStyleResourcename = 'prompt'; //Do not localize
  ContentStyleResourceName = 'content'; //Do not localize

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

{ TStyledEdit }

function TStyledEdit.GetEdit: TCustomEdit;
begin
  Result := PresentedControl as TCustomEdit;
end;

function TStyledEdit.GetModel: TCustomEditModel;
begin
  Result := inherited GetModel<TCustomEditModel>;
end;

constructor TStyledEdit.Create(AOwner: TComponent);
var
  PropertiesService: IFMXPlatformPropertiesService;
begin
  inherited;
  EnableExecuteAction := False;
  CanFocus := False;
  AutoCapture := True;
  SetAcceptsControls(False);
  Lock;
  Touch.InteractiveGestures := Touch.InteractiveGestures + [TInteractiveGesture.DoubleTap, TInteractiveGesture.LongTap];

  FUndoManager := TEditUndoManager.Create(Model);

  FAutoscrollController := TAutoscrollController.Create;
  FAutoscrollController.OnScroll := AutoScrollHandler;

  { Content }

  FContent := TStyledEditContent.Create(Self);
  FContent.HitTest := False;
  FContent.OnPaint := ContentPaint;
  FContent.OnGetClipRect := ContentGetClipRectHandler;
  AddObject(FContent);

  { Editor }

  FEditor := CreateEditor;
  FEditor.Caret := Model.Caret;
  FEditor.InsertLine(0, string.Empty);
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

function TStyledEdit.CreateEditor: TTextEditor;
begin
  Result := TTextEditor.Create(PresentedControl, FContent, Model, Self, False);
end;

function TStyledEdit.CreateTextSelectors: TInteractiveTextSelectors;
begin
  Result := TFixedInteractiveTextSelectors.Create(Self, FEditor);
end;

function TStyledEdit.DefineModelClass: TDataModelClass;
begin
  Result := TCustomEditModel;
end;

destructor TStyledEdit.Destroy;
begin
  FreeAndNil(FTextSelectors);
  FreeAndNil(FEditor);
  FContent.OnPainting := nil;
  FContent.OnGetClipRect := nil;
  FreeAndNil(FAutoscrollController);
  FreeAndNil(FUndoManager);
  FreeAndNil(FPopupMenu);
  inherited;
end;

procedure TStyledEdit.DoEndUpdate;
begin
  inherited;
  FEditor.EndUpdate;
  if not IsUpdating then
    FTextSelectors.Realign;
end;

procedure TStyledEdit.DoEnter;
begin
  inherited;
  FEditor.UpdateTextService;
  FEditor.UpdateCaretPoint;
  FTextSelectors.Install;
  FTextSelectors.ShouldShowCaretSelector := False;
  FTextSelectors.Realign;
  if Model.AutoSelect then
    Edit.SelectAll;
end;

procedure TStyledEdit.DoExit;
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

procedure TStyledEdit.DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean);
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

function TStyledEdit.GetCaretPosition: Integer;
begin
  Result := FEditor.CaretPosition.Pos;
end;

function TStyledEdit.GetContentSize: TSizeF;
begin
  Result := FEditor.LinesLayout.ContentSize;
end;

procedure TStyledEdit.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);

  function GetLeftWordBegin(const APosition: Integer): Integer;
  var
    CurrentLine: string;
  begin
    CurrentLine := Model.Text;
    if CurrentLine.IsEmpty then
      Exit(APosition);

    Result := APosition;

    if APosition > 0 then
    begin
      Result := GetLexemeBegin(CurrentLine, APosition);
      // If cursor is placed in the beginning of word, we have to take beginning pos of previous word.
      if Result = APosition then
        Result := GetPrevLexemeBegin(CurrentLine, APosition);
    end;
  end;

  procedure DeleteTextByBackspace(const AIsCtrlOrCmd: Boolean);
  var
    DeleteLength: Integer;
    LCaret: Integer;
  begin
    if Model.ReadOnly then
      Exit;

    if Model.SelLength <> 0 then
      Edit.DeleteSelection
    else if AIsCtrlOrCmd then
    begin
      // Deleting whole word
      LCaret := GetLeftWordBegin(CaretPosition);
      if LCaret < 0 then
        Exit;
      Model.DeleteFrom(LCaret, CaretPosition - LCaret, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
    end
    // Deleting single character
    else if CaretPosition > 0 then
    begin
      if (Model.Text.Length > 0) and
        Model.Text.Chars[CaretPosition - 1].IsLowSurrogate then
        Model.DeleteFrom(Model.GetPositionShift(CaretPosition, -2), 2, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo])
      else
      begin
        if CaretPosition = 0 then
          DeleteLength := 0
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
        Edit.CutToClipboard
      else
        Edit.DeleteSelection;
    end
    else if AIsCtrlOrCmd then
      Model.DeleteFrom(CaretPosition, Min(FMX.Text.GetLexemeEnd(Model.Text, CaretPosition), Model.Text.Length) - CaretPosition + 1,
        [TDeleteOption.CanUndo])
    else if HasText then
    begin
      if (CaretPosition < Model.Text.Length) and
        Model.Text.Chars[CaretPosition].IsHighSurrogate then
        Model.DeleteFrom(CaretPosition, 2, [TDeleteOption.CanUndo])
      else if CaretPosition = Model.Text.Length then
        // We are in the end of line, So we have to remove line break
        Model.DeleteFrom(CaretPosition, 0, [TDeleteOption.CanUndo])
      else
        Model.DeleteFrom(CaretPosition, 1, [TDeleteOption.CanUndo]);
    end;
  end;

var
  IsCtrlOrCmd: Boolean;
  LTmpOptions: TInsertOptions;
  KeyHandled: Boolean;
  IgnoreResetSelection: Boolean;
begin
  if not Model.InputSupport then
    Exit;

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
          Edit.SelectAll;
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

  case Key of
    vkA:
      if IsCtrlOrCmd then
      begin
        Edit.SelectAll;
        IgnoreResetSelection := True;
        KeyHandled := True;
      end;
    vkC:
      if IsCtrlOrCmd then
      begin
        Edit.CopyToClipboard;
        KeyHandled := True;
      end;
    vkV:
      if IsCtrlOrCmd then
      begin
        Edit.PasteFromClipboard;
        DoTyping;
        KeyHandled := True;
      end;
    vkX:
      if IsCtrlOrCmd and not Model.ReadOnly then
      begin
        Edit.CutToClipboard;
        DoTyping;
        KeyHandled := True;
      end;
    vkZ:
      if IsCtrlOrCmd then
      begin
        if ssShift in Shift then
          Redo
        else
          Undo;
        DoTyping;
        IgnoreResetSelection := True;
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
        FEditor.GoToTextBegin;
        KeyHandled := True;
      end;
    vkDown:
      begin
        FEditor.GoToTextEnd;
        KeyHandled := True;
      end;
    vkDelete:
      begin
        DeleteTextByDel(IsCtrlOrCmd);
        DoTyping;
        KeyHandled := True;
      end;
    vkBack:
      begin
        DeleteTextByBackspace(IsCtrlOrCmd);
        DoTyping;
        KeyHandled := True;
      end;
    vkInsert:
      if IsCtrlOrCmd then
      begin
        Edit.CopyToClipboard;
        DoTyping;
        KeyHandled := True;
      end
      else if [ssShift] * Shift <> [] then
      begin
        Edit.PasteFromClipboard;
        DoTyping;
        KeyHandled := True;
      end;
    vkProcessKey:
      IgnoreResetSelection := True;
    vkReturn:
      begin
        Model.DisableNotify;
        try
          Model.Typing := False;
        finally
          Model.EnableNotify;
        end;
        DoChange;
        if Observers.IsObserving(TObserverMapping.EditLinkID) then
          TLinkObservers.EditLinkUpdate(Observers);
        if Observers.IsObserving(TObserverMapping.ControlValueID) then
          TLinkObservers.ControlValueUpdate(Observers);
        if Model.KillFocusByReturn and (Root <> nil) then
          Root.SetFocused(nil);
        // not need to perform KeyHandled := True;
      end;
  end;

  if (KeyChar <> #0) and not Model.FilterChar.IsEmpty and not Model.FilterChar.Contains(KeyChar) then
    KeyChar := #0;

  if (KeyChar <> #0) and not Model.ReadOnly then
  begin
    FCharsBuffer := FCharsBuffer + KeyChar;
    if not KeyChar.IsHighSurrogate then
    begin
      Model.DisableNotify;
      try
        Model.Typing := True;
      finally
        Model.EnableNotify;
      end;
      if Model.SelLength > 0 then
      begin
        Model.DeleteFrom(FEditor.SelectionController.SelBegin.Pos, Model.SelLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
        LTmpOptions := [TInsertOption.UndoPairedWithPrev];
      end
      else
        LTmpOptions := [];
      Model.InsertAfter(CaretPosition, FCharsBuffer, LTmpOptions + [TInsertOption.MoveCaret, TInsertOption.CanUndo,
                        TInsertOption.Typed]);
      FCharsBuffer := string.Empty;
      DoTyping;
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
        FEditor.SelectionController.Finish := TCaretPosition.Create(0, CaretPosition);

      RepaintContent;
      KeyHandled := True;
    end;
  end;
  if not IsSelecting and not IgnoreResetSelection then
    FEditor.SelectionController.SetRange(TCaretPosition.Create(0, CaretPosition), TCaretPosition.Create(0, CaretPosition));

  if KeyHandled then
  begin
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TStyledEdit.KeyUp(var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  Exclude(FSelectionMethods, TSelectionMethod.Keyboard);
end;

procedure TStyledEdit.LongTap(const ALocalPoint: TPointF; const AFlags: TInteractiveGestureFlags);
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
      FEditor.SelectionController.SetRange(TCaretPosition.Create(0, CaretPosition), TCaretPosition.Create(0, CaretPosition));

      Edit.SelectWord;
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
      FEditor.SelectionController.Finish := TCaretPosition.Create(0, CaretPosition);
      StartAutoScroll(ALocalPoint);
      FEditor.UpdateContentOffset;
    end;
  end
  else
  begin
    FEditor.SelectionController.UnholdSelection;

    FTextSelectors.SetLoupePosition(ALocalPoint.X, ALocalPoint.Y);
    PutCaretTo(ALocalPoint.X, ALocalPoint.Y);

    if TInteractiveGestureFlag.gfEnd in AFlags then
    begin
      FTextSelectors.HideLoupe;
      TThread.ForceQueue(nil, procedure
      begin
        ShowContextMenu(LocalToScreen(ALocalPoint));
      end);
    end;
  end;
end;

procedure TStyledEdit.MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Message.Value := not FSetFocusOnUp;
end;

procedure TStyledEdit.MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>);
begin
  FEditor.CharCase := Model.CharCase;
  RepaintContent;
end;

procedure TStyledEdit.MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  FEditor.CheckSpelling := Message.Value;
end;

procedure TStyledEdit.MMEditButtonsChanged(var Message: TDispatchMessage);
begin
  RealignButtonsContainer;
end;

procedure TStyledEdit.MMFilterCharChanged(var Message: TDispatchMessage);
begin
  if FEditor.TextService <> nil then
    FEditor.TextService.FilterChar := Model.FilterChar;
end;

procedure TStyledEdit.PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>);
begin
  FUndoManager.FragmentDeleted(Message.Value.StartPos, Message.Value.Fragment, Message.Value.Selected,
                               Message.Value.CaretMoved);
end;

procedure TStyledEdit.PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>);
begin
  FUndoManager.FragmentInserted(Message.Value.StartPos, Message.Value.Fragment, Message.Value.PairedWithPrev,
                                Message.Value.Typed);
end;

procedure TStyledEdit.MMGetCaretPositionByPoint(var Message: TDispatchMessageWithValue<TCustomEditModel.TGetCaretPositionInfo>);
begin
  Message.Value.CaretPosition := FEditor.GetCaretPositionByPoint(Message.Value.HitPoint + GetViewportPosition, False{Message.Value.RoundToWord}).Pos;
end;

procedure TStyledEdit.MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  RepaintContent;
end;

procedure TStyledEdit.MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>);
begin
  FEditor.IMEMode := Message.Value;
end;

procedure TStyledEdit.MMMaxLengthChanged(var Message: TDispatchMessage);
begin
  FEditor.MaxLength := Model.MaxLength;
end;

procedure TStyledEdit.MMPasswordChanged(var AMessage: TDispatchMessage);
begin
  if Model.Password then
    FEditor.IMEMode := TImeMode.imDisable
  else
    FEditor.IMEMode := Model.ImeMode;
  FEditor.IsPassword := Model.Password;
end;

procedure TStyledEdit.MMPromptTextChanged(var Message: TDispatchMessage);
var
  Caption: ICaption;
begin
  if Supports(FPrompt, ICaption, Caption) then
    Caption.Text := Model.TextPrompt;
end;

procedure TStyledEdit.MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Model.Caret.ReadOnly := Message.Value;
end;

procedure TStyledEdit.MMSetCaretPosition(var Message: TDispatchMessageWithValue<Integer>);
begin
  CaretPosition := Message.Value;
end;

procedure TStyledEdit.MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>);
begin
  FEditor.SelectText(Message.Value, 0);
end;

procedure TStyledEdit.MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>);
begin
  FEditor.SelectText(Model.SelStart, Message.Value);
end;

procedure TStyledEdit.MMTextChanged(var AMessage: TDispatchMessageWithValue<string>);
begin
  FEditor.ReplaceLine(0, AMessage.Value);
  StylesData[PromptVisibilityStyleDataName] := Model.Text.IsEmpty and not FEditor.IsIMEActive;
end;

procedure TStyledEdit.MMTextChanging(var AMessage: TDispatchMessageWithValue<string>);
begin
end;

procedure TStyledEdit.MMTextSettingsChanged(var Message: TDispatchMessage);
var
  TextSettings: TTextSettings;
begin
  TextSettings := Model.TextSettingsInfo.ResultingTextSettings;
  FEditor.TextSettings := TextSettings;
  FEditor.FillTextFlags := FillTextFlags;

  if not (csLoading in ComponentState) then
    FEditor.UpdateCaretPoint;

  UpdatePromptTextSettings;
  RealignContent;
  RepaintContent;
end;

procedure TStyledEdit.PMUndo(var Message: TDispatchMessage);
begin
  Undo;
end;

procedure TStyledEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FSetFocusOnUp := ([ssDouble, ssTouch] * Shift) = [ssTouch];
  inherited;
  if Button <> TMouseButton.mbLeft then
    Exit;

  if ssDouble in Shift then
  begin
    Edit.SelectWord;
    // User uses double selection mode, we have to hold selection of one word and don't allow to reset
    // this selection word until selection is not finished.
    FEditor.SelectionController.HoldSelection;
    Include(FSelectionOptions, TSelectionOption.SelectWords);
    Include(FSelectionMethods, TSelectionMethod.Mouse);
  end
  else
  begin
    PutCaretTo(X, Y, DisableCaretInsideWords);
    if IsSelecting then
      FEditor.SelectionController.Finish := TCaretPosition.Create(0, CaretPosition)
    else
    begin
      FEditor.SelectionController.SetRange(TCaretPosition.Create(0, CaretPosition), TCaretPosition.Create(0, CaretPosition));
      FTextSelectors.ShouldShowCaretSelector := True;
    end;

    if DisableCaretInsideWords then
      FEditor.SelectionController.HoldSelection;

    if not (ssTouch in Shift) then
      Include(FSelectionMethods, TSelectionMethod.Mouse);
  end;
end;

procedure TStyledEdit.ContentGetClipRectHandler(Sender: TObject; var AClipRect: TRectF);
var
  LLayoutBounds: TRectF;
  ClipRectExpansion: TRectF;
begin
  if FContentLayout = nil then
    LLayoutBounds := FEditor.LinesLayout.ViewportRect
  else
  begin
    LLayoutBounds := ContentLayoutRect;
    LLayoutBounds.TopLeft := FContent.ConvertLocalPointFrom(FContentLayout.ParentControl, LLayoutBounds.TopLeft);
    LLayoutBounds.BottomRight := FContent.ConvertLocalPointFrom(FContentLayout.ParentControl, LLayoutBounds.BottomRight);
  end;
  AClipRect := LLayoutBounds;
  ClipRectExpansion := FEditor.IMELayout.ExpandBackgroundMargins;
  AClipRect.Inflate(ClipRectExpansion.Left, ClipRectExpansion.Top, ClipRectExpansion.Right, ClipRectExpansion.Bottom);
end;

procedure TStyledEdit.ContentPaint(Sender: TObject; ACanvas: TCanvas; const ARect: TRectF);
begin
  FEditor.Render(ACanvas, ARect, NeedShowSelection);
end;

procedure TStyledEdit.CaretPositionChanged(Sender: TObject; const ACaretPosition: TCaretPosition);
begin
  Model.DisableNotify;
  try
    Model.CaretPosition := ACaretPosition.Pos;
  finally
    Model.EnableNotify;
  end;

  if FTextSelectors.ActiveInitiator <> TTextSelectorType.Caret then
    FTextSelectors.ShouldShowCaretSelector := False;
end;

procedure TStyledEdit.ChangeViewportPosition(const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  inherited;
  FEditor.ChangeViewportPosition(OldViewportPosition, NewViewportPosition, ContentSizeChanged);
end;

procedure TStyledEdit.ApplyStyle;
var
  StyleResource: TFmxObject;
  BrushObject: TBrushObject;
  FontObject: IFontObject;
  TextSettingsInfo: TTextSettingsInfo;
  TextSettings: TTextSettings;
  DefaultTextSettings: TTextSettings;
  Caption: ICaption;
  LColor: TAlphaColor;
begin
  TextSettingsInfo := Model.TextSettingsInfo;
  TextSettings := TextSettingsInfo.TextSettings;
  DefaultTextSettings := TextSettingsInfo.DefaultTextSettings;

  TextSettings.BeginUpdate;
  try
    TextSettingsInfo.Design := False;
    inherited;

    { Container for right-hand buttons}
    FindStyleResource<TControl>(ButtonsStyleResourceName, FButtonsLayout);

    { Container for left-hand buttons}
    FindStyleResource<TControl>(LeftButtonsStyleResourceName, FLeftLayout);

    if (FButtonsLayout <> nil) or (FLeftLayout <> nil) then
      RealignButtonsContainer;

    { Text prompt }
    if FindStyleResource<TControl>(PromptStyleResourcename, FPrompt) then
    begin
      if Supports(FPrompt, ICaption, Caption) then
        Caption.Text := Model.TextPrompt;
      FPrompt.Visible := Model.Text.IsEmpty and not FEditor.IsIMEActive;
      UpdatePromptTextSettings;
    end;

    { Content }
    if FindStyleResource<TControl>(ContentStyleResourceName, FContentLayout) then
      RealignContent;

    if FindStyleResource<TBrushObject>('selection', BrushObject) then
      Model.SelectionFill := BrushObject.Brush;

    { Default Text settings }
    if FindStyleResource<TBrushObject>('foreground', BrushObject) and BrushObject.TryGetSolidColor(LColor) then
      DefaultTextSettings.FontColor := LColor;
    StyleResource := FindStyleResource('font');
    if Supports(StyleResource, IFontObject, FontObject) then
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

procedure TStyledEdit.RepaintContent;
begin
  FContent.Repaint;
end;

procedure TStyledEdit.ReplaceWordHandler(const ASpellingWord: TSpellingWord; const ASuggestion: string);
begin
  Model.Replace(ASpellingWord.Position.Pos, ASpellingWord.Length, ASuggestion);
  RepaintContent;
end;

procedure TStyledEdit.Resize;
begin
  inherited;
  FEditor.InvalidateContentSize;
end;

procedure TStyledEdit.DoRealign;
begin
  if FNeedAlign then
  begin
    inherited;
    RealignContent;
  end;
end;

procedure TStyledEdit.DoResized;
begin
  inherited;
  if not (csLoading in ComponentState) then
  begin
    ChangeViewportPosition(FViewportPosition, FViewportPosition, True);
    RealignContent;
    RealignButtonsContainer;
  end;
end;

procedure TStyledEdit.DoTyping;
begin
  if Assigned(Model.OnTyping) then
    Model.OnTyping(PresentedControl);
end;

procedure TStyledEdit.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if TSelectionMethod.Mouse in FSelectionMethods then
  begin
    PutCaretTo(X, Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
    FTextSelectors.ShouldShowCaretSelector := True;
    FEditor.SelectionController.Finish := TCaretPosition.Create(0, CaretPosition);
    StartAutoScroll(TPointF.Create(X, Y));
    FEditor.UpdateContentOffset;
  end;
end;

procedure TStyledEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FSetFocusOnUp {and not AniCalculations.Moved} then
  begin
    FSetFocusOnUp := False;
    if not (csDesigning in PresentedControl.ComponentState) and not PresentedControl.IsFocused then
      PresentedControl.SetFocus;
  end;
  if TSelectionMethod.Mouse in FSelectionMethods then
  begin
    PutCaretTo(X, Y, (TSelectionOption.SelectWords in FSelectionOptions) or DisableCaretInsideWords);
    FEditor.SelectionController.Finish := TCaretPosition.Create(0, CaretPosition);
  end;
  FEditor.UpdateCaretPoint;
  FEditor.SelectionController.UnholdSelection;
  FTextSelectors.ShouldShowCaretSelector := True;
  Exclude(FSelectionMethods, TSelectionMethod.Mouse);
  Exclude(FSelectionOptions, TSelectionOption.SelectWords);
  FAutoscrollController.Stop;
end;

procedure TStyledEdit.FillPopupMenu(const AMenu: TPopupMenu);
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

procedure TStyledEdit.UpdatePopupMenuItems(const AMenu: TPopupMenu);
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
  SetEnabled(SelectAllStyleName, Model.SelLength <> Model.Text.Length);
end;

procedure TStyledEdit.UpdatePromptTextSettings;
var
  PromptTextSettings: ITextSettings;
begin
  if Supports(FPrompt, ITextSettings, PromptTextSettings) then
  begin
    PromptTextSettings.StyledSettings := [];
    PromptTextSettings.TextSettings.Assign(Model.TextSettingsInfo.ResultingTextSettings);
  end;
end;

function TStyledEdit.ContentLayoutRect: TRectF;
begin
  if FContentLayout = nil then
    Result := TRectF.Create(0, 0, ViewportSize.Width, ViewportSize.Height)
  else
    Result := FContentLayout.BoundsRect;
end;

procedure TStyledEdit.EndIMEInput;
begin
  FEditor.EndIMEInput;
end;

procedure TStyledEdit.EndInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
begin
  FAutoscrollController.Stop;
  Exclude(FSelectionMethods, TSelectionMethod.LeftSelector);
  Exclude(FSelectionMethods, TSelectionMethod.RightSelector);
end;

procedure TStyledEdit.ExecuteContextAction(const AAction: TContextAction);
begin
  case AAction of
    TContextAction.Cut:
      Edit.CutToClipboard;
    TContextAction.Copy:
      Edit.CopyToClipboard;
    TContextAction.Paste:
      Edit.PasteFromClipboard;
    TContextAction.Delete:
      Edit.DeleteSelection;
    TContextAction.Undo:
      Undo;
    TContextAction.Redo:
      Redo;
    TContextAction.SelectAll:
      Edit.SelectAll;
  end;
end;

procedure TStyledEdit.AutoScrollHandler(const ADirection: TAutoscrollDirection; var AStop: Boolean);

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
  CurrentCaretPosition: Integer;
  NewCaretPosition: TCaretPosition;
begin
  if TSelectionMethod.LeftSelector in FSelectionMethods then
    CurrentCaretPosition := FEditor.SelectionController.Start.Pos
  else if TSelectionMethod.RightSelector in FSelectionMethods then
    CurrentCaretPosition := FEditor.SelectionController.Finish.Pos
  else
    CurrentCaretPosition := CaretPosition;

  NewCaretPosition := DefineCaretPosition(TCaretPosition.Create(0, CurrentCaretPosition), ADirection);

  AStop := CurrentCaretPosition = NewCaretPosition.Pos;
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

procedure TStyledEdit.BeginInteractiveSelectionHandler(Sender: TObject; const AInitiator: TTextSelectorType);
begin
  if AInitiator = TTextSelectorType.Left then
    Include(FSelectionMethods, TSelectionMethod.LeftSelector)
  else if AInitiator = TTextSelectorType.Right then
    Include(FSelectionMethods, TSelectionMethod.RightSelector);
end;

procedure TStyledEdit.DoBeginUpdate;
begin
  inherited;
  FEditor.BeginUpdate;
end;

procedure TStyledEdit.DoChange;
begin
  if not (csLoading in ComponentState) then
    Model.Change;
end;

procedure TStyledEdit.CMGesture(var EventInfo: TGestureEventInfo);
begin
  inherited;
end;

procedure TStyledEdit.ContextMenuItemClick(Sender: TObject);
var
  Action: TContextAction;
begin
  if Sender is TContextMenuItem then
  begin
    Action := TContextMenuItem(Sender).ContextAction;
    ExecuteContextAction(Action);
  end;
end;

function TStyledEdit.ShowContextMenu(const ScreenPosition: TPointF): Boolean;
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

procedure TStyledEdit.FreeNotification(AObject: TObject);
begin
  inherited;
  if AObject = FPopupMenu then
    FPopupMenu := nil;
end;

procedure TStyledEdit.FreeStyle;
begin
  FTextSelectors.FreeStyle;
  FLeftLayout := nil;
  FButtonsLayout := nil;
  FPrompt := nil;
  FContentLayout := nil;
  inherited;
end;

procedure TStyledEdit.SetCaretPosition(const Value: Integer);
begin
  FEditor.CaretPosition := TCaretPosition.Create(0, Value);
end;

procedure TStyledEdit.SetContentSize(const ASize: TSizeF);
begin
end;

procedure TStyledEdit.SetSelection(const AStart: TCaretPosition; const ALength: Integer);
begin
  FEditor.SelectionController.SetRange(AStart, TCaretPosition.Create(AStart.Line, AStart.Pos + ALength));
end;

procedure TStyledEdit.SetViewportPosition(const Value: TPointF);
var
  OldValue: TPointF;
  NewValue: TPointF;
begin
  NewValue := TPointF.Create(Value.X, 0);
  if ViewportPosition <> NewValue then
  begin
    OldValue := FViewportPosition;
    FViewportPosition := NewValue;
    ChangeViewportPosition(OldValue, FViewportPosition, False);
    RealignContent;
    FEditor.UpdateCaretPoint;
    FTextSelectors.Realign;
  end;
end;

function ConvertLocalPointFromTo(const AFrom: TControl; const ATo: TControl; const APoint: TPointF): TPointF;
begin
  // If control is using In Point To, it holds InPaintAbsoluteMatrix and uses in all coordinate conversion,
  // however if control is being changed location, it doesn't update this matrix, So as result it leads to incorrect
  // calculation absolute/local coordinates. See implementation of TControl.LocalToAbsolute/AbsoluteToLocal
  if ATo.InPaintTo then
  begin
    Result := APoint * AFrom.AbsoluteMatrix;
    Result := Result * ATo.InvertAbsoluteMatrix;
  end
  else
    Result := ATo.ConvertLocalPointFrom(AFrom, APoint);
end;

procedure TStyledEdit.RealignButtonsContainer;
var
  TotalWidth: Single;
  EditControl: IEditControl;
begin
  if FButtonsLayout = nil then
    Exit;

  TotalWidth := 0;
  for var I := 0 to Edit.ButtonsContent.ChildrenCount - 1 do
    if Supports(Edit.ButtonsContent.Children[I], IEditControl, EditControl) then
      TotalWidth := TotalWidth + EditControl.BoundsRect.Width;

  FButtonsLayout.Width := TotalWidth;
  FButtonsLayout.Height := Height;

  Edit.ButtonsContent.Position.Point := ConvertLocalPointFromTo(FButtonsLayout, Edit.ButtonsContent.ParentControl, TPointF.Zero);
  Edit.ButtonsContent.Size.Size := FButtonsLayout.Size.Size;
end;

procedure TStyledEdit.RealignContent;
var
  OldDisableAlign: Boolean;
  TopOffset: Single;
  LContentSize: TSizeF;
  LLayoutBounds: TRectF;
begin
  OldDisableAlign := FDisableAlign;
  try
    FDisableAlign := True;
    RealignButtonsContainer;
    ChangeViewportPosition(ViewportPosition, ViewportPosition, False);
    if FContentLayout <> nil then
    begin
      LContentSize := FEditor.LinesLayout.ContentSize;
      LLayoutBounds := ContentLayoutRect;
      LLayoutBounds.TopLeft := ConvertLocalPointFromTo(FContentLayout.ParentControl, Self, LLayoutBounds.TopLeft);
      LLayoutBounds.BottomRight := ConvertLocalPointFromTo(FContentLayout.ParentControl, Self, LLayoutBounds.BottomRight);

      case FEditor.TextSettings.VertAlign of
        TTextAlign.Center:
          TopOffset := (LLayoutBounds.Height - LContentSize.Height) / 2;
        TTextAlign.Leading:
          TopOffset := 0;
        TTextAlign.Trailing:
          TopOffset := LLayoutBounds.Height - LContentSize.Height;
      else
        TopOffset := 0;
      end;
      FContent.SetBounds(LLayoutBounds.Left - ViewportPosition.X, LLayoutBounds.Top - ViewportPosition.Y + TopOffset,
                         LContentSize.Width, LContentSize.Height);
      if FPrompt <> nil then
        FPrompt.SetBounds(LLayoutBounds.Left, LLayoutBounds.Top, LLayoutBounds.Width, LLayoutBounds.Height);

      // FContent takes update rect from Parent (this control). So when we change content size,
      // The FContent doesn't recalculate update rect. So we should force it in this place.
      RecalcUpdateRect;
    end;
  finally
    FDisableAlign := OldDisableAlign;
  end;
end;

procedure TStyledEdit.RecalcOpacity;
begin
  inherited;
  FEditor.Opacity := AbsoluteOpacity;
end;

procedure TStyledEdit.Redo;
begin
  if not Model.ReadOnly then
    FUndoManager.Redo;
end;

procedure TStyledEdit.DblTap;
begin
end;

function TStyledEdit.GetTextService: TTextService;
begin
  Result := FEditor.TextService;
end;

function TStyledEdit.GetViewportPosition: TPointF;
begin
  Result := FViewportPosition;
end;

function TStyledEdit.GetViewportSize: TSizeF;
begin
  if FContentLayout = nil then
    Result := Size.Size
  else
    Result := FContentLayout.Size.Size;
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

procedure TStyledEdit.IMEStateUpdated;
begin
  FEditor.IMEStateUpdated;
  StylesData[PromptVisibilityStyleDataName] := Model.Text.IsEmpty and not FEditor.IsIMEActive;
end;

function TStyledEdit.GetTargetClausePointF: TPointF;
begin
  Result := FEditor.GetTargetClausePointF;
end;

procedure TStyledEdit.Undo;
begin
  if not Model.ReadOnly then
    FUndoManager.Undo;
end;

function TStyledEdit.IsSelecting: Boolean;
begin
  Result := FSelectionMethods <> [];
end;

procedure TStyledEdit.StartAutoScroll(const ALocalPoint: TPointF);
var
  Rect: TRectF;
  Direction: TAutoscrollDirection;
begin
  if not HasText then
    Exit;

  Rect := ContentLayoutRect;
  if ALocalPoint.X <= Rect.Left then
    Direction := TAutoscrollDirection.RightToLeft
  else if ALocalPoint.X >= Rect.Right then
    Direction := TAutoscrollDirection.LeftToRight
  else
  begin
    FAutoscrollController.Stop;
    Exit;
  end;

  FAutoscrollController.Start(Direction);
end;

procedure TStyledEdit.StartIMEInput;
begin
  FEditor.StartIMEInput;
end;

procedure TStyledEdit.PMInit(var Message: TDispatchMessage);
begin
  inherited;
  FEditor.MaxLength := Model.MaxLength;
  if HasText then
  begin
    BeginUpdate;
    try
      FEditor.ReplaceLine(0, Model.Text);
    finally
      EndUpdate;
    end;
  end;
  if Model.Caret.Flasher <> nil then
    FEditor.LinesLayout.CaretWidth := Model.Caret.Flasher.Size.Width;
end;

procedure TStyledEdit.PMRootChanged(var Message: TDispatchMessageWithValue<IRoot>);
begin
  inherited;
  FEditor.FillTextFlags := FillTextFlags;
end;

procedure TStyledEdit.PutCaretTo(const X, Y: Single; const APositionByWord: Boolean);
var
  ContentPoint: TPointF;
begin
  // X, Y in the presentation coordinate system
  ContentPoint := ConvertLocalPointTo(FContent, TPointF.Create(X, Y));
  FEditor.PutCaretTo(ContentPoint.X, ContentPoint.Y, APositionByWord);
end;

function TStyledEdit.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  if GetInterface(IID, Obj) or FEditor.GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TStyledEdit.HasText: Boolean;
begin
  Result := not Model.Text.IsEmpty;
end;

function TStyledEdit.GetSelection: string;
begin
  Result := Model.SelectedText;
end;

function TStyledEdit.GetSelectionBounds: TRect;
begin
  Result := FEditor.GetSelectionBounds;
end;

function TStyledEdit.GetSelectionPointSize: TSizeF;
begin
  Result := TSizeF.Create(0, 0);
end;

function TStyledEdit.GetSelectionRect: TRectF;
begin
  Result := FEditor.GetSelectionRect(NeedShowSelection);
  Result.Location := ConvertLocalPointFrom(FContent, Result.TopLeft);
end;

procedure TStyledEdit.SelectionChangedHandler(Sender: TObject; const ASelStart, ALength: Integer);
begin
  Model.DisableNotify;
  try
    Model.SelStart := ASelStart;
    Model.SelLength := ALength;
  finally
    Model.EnableNotify;
  end;
  StylesData[PromptVisibilityStyleDataName] := Model.Text.IsEmpty and not FEditor.IsIMEActive;
  FTextSelectors.Realign;
  RepaintContent;
end;

procedure TStyledEdit.SelectorPositionChangedHandler(Sender: TObject; const ASelector: TTextSelectorType;
  const AContentPoint: TPointF);
var
  LocalPoint: TPointF;
begin
  LocalPoint := ConvertLocalPointFrom(Content, AContentPoint);
  StartAutoScroll(LocalPoint);
end;

function TStyledEdit.NeedShowSelection: Boolean;
begin
  Result := IsFocused or not Model.HideSelectionOnExit and FEditor.SelectionController.IsSelected;
end;

{ TEditUndoManager }

constructor TEditUndoManager.Create(const AModel: TCustomEditModel);
begin
  inherited Create;
  FModel := AModel;
end;

procedure TEditUndoManager.DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction;
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
      Model.DeleteFrom(AEditInfo.StartPosition, AEditInfo.Fragment.Length, AOptions);
    TActionType.Insert:
      Model.InsertAfter(AEditInfo.StartPosition, AEditInfo.Fragment, [TInsertOption.MoveCaret]);
  end;
end;

procedure TEditUndoManager.DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction;
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
      Model.InsertAfter(AEditInfo.StartPosition, AEditInfo.Fragment, AOptions);
    TActionType.Insert:
      Model.DeleteFrom(AEditInfo.StartPosition, AEditInfo.Fragment.Length, [TDeleteOption.MoveCaret]);
  end;
end;

{ TStyledEditContent }

constructor TStyledEditContent.Create(AOwner: TComponent);
begin
  inherited;
  if not (AOwner is TStyledEdit) then
    raise EArgumentException.Create(SScrollBoxOwnerWrong);
  FEdit := TStyledEdit(AOwner);
  ClipChildren := True;
  SetAcceptsControls(False);
  Lock;
  Stored := False;
end;

function TStyledEditContent.DoGetUpdateRect: TRectF;
begin
  // TControl.PaintTo unlinks control from parent. So in this case ParentControl can be nil.
  if ParentControl <> nil then
    Result := ParentControl.UpdateRect
  else
    Result := inherited;
end;

function TStyledEditContent.GetClipRect: TRectF;
begin
  if FEdit.ViewportSize.IsZero then
    Result := FEdit.BoundsRect
  else
    Result := TRectF.Create(FEdit.ViewportPosition, FEdit.ViewportSize.Width, FEdit.ViewportSize.Height);
  if Assigned(FOnGetClipRect) then
    FOnGetClipRect(Self, Result);
end;

function TStyledEditContent.ObjectAtPoint(P: TPointF): IControl;
begin
  Result := inherited;
  if Result <> nil then
  begin
    P := ScreenToLocal(P);
    if not ClipRect.Contains(P) then
      Result := nil;
  end;
end;

function TStyledEditContent.PointInObjectLocal(X, Y: Single): Boolean;
var
  LClipRect: TRectF;
begin
  LClipRect := GetClipRect;
  LClipRect.Inflate(TouchTargetExpansion.Left, TouchTargetExpansion.Top, TouchTargetExpansion.Right,
    TouchTargetExpansion.Bottom);
  Result := LClipRect.Contains(TPointF.Create(X, Y));
end;

type
  TPlatformEdit = class(TStyledEdit)
  protected
    procedure SetAdjustSizeValue(const Value: TSizeF); override;
    procedure SetAdjustType(const Value: TAdjustType); override;
  end;

{ TPlatformEdit }

procedure TPlatformEdit.SetAdjustSizeValue(const Value: TSizeF);
begin
  inherited SetAdjustSizeValue(TSizeF.Create(0, 0));
end;

procedure TPlatformEdit.SetAdjustType(const Value: TAdjustType);
begin
  inherited SetAdjustType(TAdjustType.None);
end;

type
  TFixedStyledEdit = class(TStyledEdit)
  private
    FIsRealignTextSelectors: Boolean;
  protected
    procedure RecalculateAbsoluteMatrices; override;
    procedure PMGetTextContentRect(var AMessage: TDispatchMessageWithValue<TRectF>); message PM_EDIT_GET_TEXT_CONTENT_RECT;
  end;

{ TFixedStyledEdit }

procedure TFixedStyledEdit.PMGetTextContentRect(var AMessage: TDispatchMessageWithValue<TRectF>);
begin
  AMessage.Value := ContentLayoutRect;
end;

procedure TFixedStyledEdit.RecalculateAbsoluteMatrices;
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
  TPresentationProxyFactory.Current.Replace(TEdit, TControlType.Styled, TStyledPresentationProxy<TFixedStyledEdit>);
  TPresentationProxyFactory.Current.Register('Edit-ide-platform', TStyledPresentationProxy<TPlatformEdit>);
finalization
  TPresentationProxyFactory.Current.Unregister(TEdit, TControlType.Styled, TStyledPresentationProxy<TFixedStyledEdit>);
  TPresentationProxyFactory.Current.Unregister('Edit-ide-platform', TStyledPresentationProxy<TPlatformEdit>);
end.
