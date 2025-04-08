{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit ToolsAPI.Editor;

interface

{ !!! Please keep this unit's uses clause clean of *any* private IDE             !!! }
{ !!! units.  Before making modifications to this unit, please see senior IDE R&D engineer !!! }

uses
  System.Types, System.Classes, ToolsAPI, Vcl.Controls, Vcl.Graphics,
  System.Generics.Collections;

(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorLineState280,0x2ACE6D47,0x4EA9,0x447C,0xAF,0x32,0x0E,0x76,0x6F,0xA5,0x47,0xB1);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorLineState290,0x3461532F,0xCA15,0x4FF8,0x8D,0xAA,0xEE,0x75,0x96,0x9D,0x43,0x2D);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorLineState,0x06CCFDDE,0x0F16,0x4A71,0xA3,0xF0,0x14,0xB5,0x7C,0x75,0x51,0x27);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorState280,0x564A08CE,0xD5BC,0x4C79,0xAA,0xEB,0x91,0x15,0xAE,0x20,0x2B,0x15);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorState290,0x61482297,0x33B6,0x427A,0x8E,0xC8,0xD7,0x99,0xE2,0x89,0x24,0xB6);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorState,0x2B8C9FE6,0x7D0C,0x4D23,0xAD,0xA7,0x69,0x1F,0xA2,0x71,0x03,0xA2);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorPaintContext280,0x820865CB,0xD3AE,0x4DFA,0xB3,0xFD,0xB0,0xC9,0xAB,0x5C,0xBC,0xFA);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorPaintContext,0xB95F367E,0xB426,0x4D30,0x85,0x94,0x95,0x6A,0x7A,0x29,0x81,0xB0);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorEvents,0x78865D81,0x2D54,0x4CFB,0x9C,0x3D,0xAD,0x72,0x36,0xF5,0x76,0x07);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorOptions280,0xBA2E4ADF,0x7E52,0x42B7,0xB2,0x9F,0x2E,0xB1,0xC9,0xD8,0xEA,0x4A);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorOptions,0x4203F789,0xAC62,0x433A,0xA3,0xF7,0x2D,0x63,0x61,0x6D,0x84,0x03);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorServices280,0xE4501C03,0xCA9C,0x4887,0x98,0xF4,0xF9,0x7B,0x89,0x38,0x98,0x6A);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTACodeEditorServices,0x449D7687,0x9D4C,0x454C,0x84,0x6E,0xFE,0xC6,0x73,0x60,0x5B,0xF8);'*)

type
  /// <summary>
  ///   Enumeration of possible states for a line in a code editor control.
  /// </summary>
  TCodeEditorLineState = (
    /// <summary>
    ///   Line is highlighted.
    /// </summary>
    eleLineHighlight,
    /// <summary>
    ///   Line contains an error.
    /// </summary>
    eleErrorLine,
    /// <summary>
    ///   Line is currently executing.
    /// </summary>
    eleExecution,
    /// <summary>
    ///   Line contains a breakpoint.
    /// </summary>
    eleBreakpoint,
    /// <summary>
    ///   Line contains an invalid breakpoint.
    /// </summary>
    eleInvalidBreakpoint,
    /// <summary>
    ///   Line contains a disabled breakpoint.
    /// </summary>
    eleDisabledBreakpoint,
    /// <summary>
    ///   Line has been compiled and is breakpointable.
    /// </summary>
    eleCompiled
  );
  TCodeEditorLineStates = set of TCodeEditorLineState;

  /// <summary>
  ///   A set of flags that indicate the state of a code editor cell.
  /// </summary>
  TCodeEditorCellState = (
    /// <summary>The cell is currently selected.</summary>
    eceSelected,
    /// <summary>The cell contains an active hotlink.</summary>
    eceHotLink,
    /// <summary>The cell supports hotlink.</summary>
    eceHotLinkable,
    /// <summary>The cell is in the background of a synchronized edit group.</summary>
    eceSyncEditBackground,
    /// <summary>The cell is part of a synchronized edit group that is being searched.</summary>
    eceSyncEditSearch,
    /// <summary>The cell is part of a synchronized edit group that has a matching item.</summary>
    eceSyncEditMatch,
    /// <summary>The cell is a match for a search query.</summary>
    eceSearchMatch,
    /// <summary>The cell is a secondary match for a search query.</summary>
    eceExtraMatch,
    /// <summary>The cell is a matching brace or bracket.</summary>
    eceBraceMatch,
    /// <summary>The cell contains a hint.</summary>
    eceHint,
    /// <summary>The cell contains a warning message.</summary>
    eceWarning,
    /// <summary>The cell contains an error message.</summary>
    eceError,
    /// <summary>The cell contains disabled code.</summary>
    eceDisabledCode,
    /// <summary>The cell is a fold box.</summary>
    eceFoldBox
  );
  TCodeEditorCellStates = set of TCodeEditorCellState;

  INTACodeEditorLineState280 = interface
    ['{2ACE6D47-4EA9-447C-AF32-0E766FA547B1}']
    /// <summary>
    /// is this the +/- line, that has been collapsed so represents several lines?
    /// </summary>
    function IsElidedLine: Boolean; //
    /// <summary>
    /// If Elided, is this line in the Elided section?
    /// </summary>
    function IsLogicalLineInElidedSection(const LogicalLine: Integer): Boolean;
    function GetEditorLineNum: Integer;
    function GetLogicalLineNum: Integer;
    function GetElidedLineStart: Integer;
    function GetElidedLineEnd: Integer;
    function GetWholeRect: TRect;
    function GetGutterRect: TRect;
    function GetGutterLineDataRect: TRect;
    function GetCodeRect: TRect;
    function GetText: string;
    function GetVisibleText: string;
    function GetVisibleTextRect: TRect;
    /// <summary>
    /// Visible Line num. is always continuous, eg 1, 2, 3...
    /// </summary>
    property EditorLineNum: Integer read GetEditorLineNum; //
    /// <summary>
    /// Line of code, can jump if some are Elided: 1, 2, 7...
    /// </summary>
    property LogicalLineNum: Integer read GetLogicalLineNum; //
    /// <summary>
    /// Logical line range start enclosed in this Elided line
    /// </summary>
    property ElidedLineStart: Integer read GetElidedLineStart;
    /// <summary>
    /// Logical line range end enclosed in this Elided line
    /// </summary>
    property ElidedLineEnd: Integer read GetElidedLineEnd;
    /// <summary>
    /// Entire line, left-right across the window, gutter and code etc
    /// </summary>
    property WholeRect: TRect read GetWholeRect;
    /// <summary>
    /// Leftmost part of the line where breakpoints are displayed
    /// </summary>
    property GutterRect: TRect read GetGutterRect;
    /// <summary>
    /// Where line numbers, code folding etc is displayed
    /// </summary>
    property GutterLineDataRect: TRect read GetGutterLineDataRect;
    /// <summary>
    /// Editable area, where code text is displayed
    /// </summary>
    property CodeRect: TRect read GetCodeRect;
    /// <summary>
    /// The text of this line
    /// </summary>
    property Text: string read GetText;
    /// <summary>
    /// Substring that is visible onscreen
    /// </summary>
    property VisibleText: string read GetVisibleText;
    /// <summary>
    /// Rect enclosing the visible text onscreen
    /// </summary>
    property VisibleTextRect: TRect read GetVisibleTextRect;
  end;

  INTACodeEditorLineState290 = interface(INTACodeEditorLineState280)
    ['{3461532F-CA15-4FF8-8DAA-EE75969D432D}']
    function GetCellState(Column: Integer): TCodeEditorCellStates;
    function GetState: TCodeEditorLineStates;
    /// <summary>
    /// Get a enum w/ the current states for the line
    /// </summary>
    property State: TCodeEditorLineStates read GetState;
    /// <summary>
    /// Get a enum w/ the current states for the column
    /// </summary>
    property CellState[Column: Integer]: TCodeEditorCellStates read GetCellState;
  end;

  /// <summary>
  /// INTACodeEditorLineState retrieves info about the current state for a editor line.
  /// </summary>
  INTACodeEditorLineState = interface(INTACodeEditorLineState290)
    ['{06CCFDDE-0F16-4A71-A3F0-14B57C755127}']
  end;

  INTACodeEditorState280 = interface
    ['{564A08CE-D5BC-4C79-AAEB-9115AE202B15}']
    function GetLineState(VisibleLine: Integer): INTACodeEditorLineState;
    function GetLogicalLineState(LogicalLine: Integer): INTACodeEditorLineState;
    function IsLineVisible(const LogicalLine: Integer): Boolean;
    function IsLogicalLineVisible(const LogicalLineNum: Integer): Boolean;
    function GetLineForElidedLogicalLine(const InvisibleLogicalLine: Integer): Integer;
    function GetTopLine: Integer;
    function GetBottomLine: Integer;
    function GetEditorRect: TRect;
    function GetGutterWidth: Integer;
    function GetCodeLeftEdge: Integer;
    function GetCodeEditor: TWinControl;
    function GetView: IOTAEditView;
    /// <summary>
    /// A rectangle enclosing the specified character
    /// </summary>
    function GetCharacterPosPx(const Column, VisibleLine: Integer): TRect;
    /// <summary>
    /// Convert a editor pixel position into a character position.
    /// </summary>
    function PointToCharacterPos(const ClientPos: TPoint; out Column, VisibleLine: Integer): Boolean;
    function LineFromY(const Y: SmallInt; const VisibleLine: Boolean = false): Integer;
    function ColFromX(const X: SmallInt): Integer;
    function GetLeftColumn: Integer;
    function GetRightColumn: Integer;
    function GetLargestVisibleLineChars: Integer;
    /// <summary>
    /// Returns the X position for the Gutter column.
    /// </summary>
    /// <param name="Editor">
    /// Editor control.
    /// </param>
    /// <param name="ColumnIndex">
    /// Column Index returned by RequestGutterColumn.
    /// </param>
    function GetGutterColumnLeft(const Editor: TWinControl; const ColumnIndex: Integer): Integer;
    /// <summary>
    /// Returns the Rect for the Gutter column.
    /// </summary>
    /// <param name="Editor">
    /// Editor control.
    /// </param>
    /// <param name="VisibleLine">
    /// Visible Line number.
    /// </param>
    /// <param name="ColumnIndex">
    /// Column Index returned by RequestGutterColumn.
    /// </param>
    function GetGutterColumnRect(const Editor: TWinControl; const VisibleLine, ColumnIndex: Integer): TRect;
    /// <summary>
    /// Get a INTACodeEditorLineState for a visible line.
    /// </summary>
    property LineState[VisibleLine: Integer]: INTACodeEditorLineState read GetLineState;
    /// <summary>
    /// Get a INTACodeEditorLineState for a logical line.
    /// </summary>
    property LogicalLineState[LogicalLine: Integer]: INTACodeEditorLineState read GetLogicalLineState;
    /// <summary>
    /// first visible line
    /// </summary>
    property TopLine: Integer read GetTopLine;
    /// <summary>
    /// Last visible line
    /// </summary>
    property BottomLine: Integer read GetBottomLine;
    /// <summary>
    /// Editor bounds
    /// </summary>
    property EditorRect: TRect read GetEditorRect;
    /// <summary>
    /// Gutter width in pixels.
    /// </summary>
    property GutterWidth: Integer read GetGutterWidth;
    /// <summary>
    /// X Pos for code
    /// </summary>
    property CodeLeftEdge: Integer read GetCodeLeftEdge;
    /// <summary>
    /// Editor control
    /// </summary>
    property CodeEditor: TWinControl read GetCodeEditor;
    /// <summary>
    /// Active view (IOTAEditView) for Editor control
    /// </summary>
    property View: IOTAEditView read GetView;
    /// <summary>
    /// First visible column
    /// </summary>
    property LeftColumn: Integer read GetLeftColumn;
    /// <summary>
    /// Last visible column
    /// </summary>
    property RightColumn: Integer read GetRightColumn;
    /// <summary>
    /// Largest visible column
    /// </summary>
    property LargestVisibleLineChars: Integer read GetLargestVisibleLineChars;
  end;

  INTACodeEditorState290 = interface(INTACodeEditorState280)
    ['{61482297-33B6-427A-8EC8-D799E28924B6}']
    function GetEditorToken: string;
    function GetCharWidth: Integer;
    function GetCharHeight: Integer;
    /// <summary>
    /// Refresh the editor state info.
    /// </summary>
    procedure Refresh;
    /// <summary>
    /// get the editor token under the cursor.
    /// </summary>
    property EditorToken: string read GetEditorToken;
    /// <summary>
    /// get the editor char width
    /// </summary>
    property CharWidth: Integer read GetCharWidth;
    /// <summary>
    /// get the editor char height
    /// </summary>
    property CharHeight: Integer read GetCharHeight;
  end;

  /// <summary>
  /// INTACodeEditorState retrieves info about the current state for a code editor.
  /// </summary>
  INTACodeEditorState = interface(INTACodeEditorState290)
    ['{2B8C9FE6-7D0C-4D23-ADA7-691FA27103A2}']
  end;

  /// <summary>
  ///   Enumeration of events used for filtering events dispatching.
  /// </summary>
  TCodeEditorEvent = (
    /// <summary>
    ///   Window events such as resizing and scrolling.
    /// </summary>
    cevWindowEvents,
    /// <summary>
    ///   Mouse events such as clicking and moving.
    /// </summary>
    cevMouseEvents,
    /// <summary>
    ///   Begin/end paint events that occur when painting the control.
    /// </summary>
    cevBeginEndPaintEvents,
    /// <summary>
    ///   Paint events that occur for each visible line of text.
    /// </summary>
    cevPaintLineEvents,
    /// <summary>
    ///   Paint events that occur for the gutter area (left of the text).
    /// </summary>
    cevPaintGutterEvents,
    /// <summary>
    ///   Paint events that occur for the text itself.
    /// </summary>
    cevPaintTextEvents
  );
  TCodeEditorEvents = set of TCodeEditorEvent;

  /// <summary>
  /// Enumeration of stages in the painting of a line in the code editor control.
  /// </summary>
  TPaintLineStage = (
    /// <summary>
    ///   Beginning of the line painting process.
    /// </summary>
    plsBeginPaint,
    /// <summary>
    ///   End of the line painting process.
    /// </summary>
    plsEndPaint,
    /// <summary>
    ///   Painting the background of the line.
    /// </summary>
    plsBackground,
    /// <summary>
    ///   Painting any marks (bookmarks, breakpoints, etc.) on the line.
    /// </summary>
    plsMarks,
    /// <summary>
    ///   Highlighting paired characters (e.g. parentheses) on the line.
    /// </summary>
    plsHighlightPairChars,
    /// <summary>
    ///   Drawing the right margin (if enabled) on the line.
    /// </summary>
    plsRightMargin,
    /// <summary>
    ///   Painting the folded box (if any) on the line.
    /// </summary>
    plsFoldedBox
  );

  TPaintLineStages = set of TPaintLineStage;

  /// <summary>
  ///   Enumeration of stages in the painting of the gutter area in the code editor control.
  /// </summary>
  TPaintGutterStage = (
    /// <summary>
    ///   Beginning of the gutter painting process.
    /// </summary>
    pgsBeginPaint,
    /// <summary>
    ///   End of the gutter painting process.
    /// </summary>
    pgsEndPaint,
    /// <summary>
    ///   Painting bookmarks on the gutter.
    /// </summary>
    pgsBookMarks,
    /// <summary>
    ///   Drawing execution marks in the gutter.
    /// </summary>
    pgsCSIP,
    /// <summary>
    ///   Drawing breakpoint marks on the gutter.
    /// </summary>
    pgsBreakpoint,
    /// <summary>
    ///   Drawing the edge of the gutter area.
    /// </summary>
    pgsGutterEdge,
    /// <summary>
    ///   Drawing the elision (code folding) area on the gutter.
    /// </summary>
    pgsElision,
    /// <summary>
    ///   Painting line numbers on the gutter.
    /// </summary>
    pgsLineNumber,
    /// <summary>
    ///   Annotating the gutter.
    /// </summary>
    pgsAnnotate,
    /// <summary>
    ///   Drawing the modified lines indicator on the gutter.
    /// </summary>
    pgsModifiedLines
  );

  TPaintGutterStages = set of TPaintGutterStage;

  /// <summary>
  ///   Scroll directions for a code editor control.
  /// </summary>
  TCodeEditorScrollDirection = (
    /// <summary>
    ///   Horizontal scroll direction.
    /// </summary>
    sdHorizontal,
    /// <summary>
    ///   Vertical scroll direction.
    /// </summary>
    sdVertical
  );

  TCodeEditorUIOption = (ceoDisableScrollDC, ceoDisableFontScaling);
  TCodeEditorUIOptions = set of TCodeEditorUIOption;

  /// <summary>
  ///   Enumeration of possible positions for a custom gutter column in a code editor control.
  /// </summary>
  TGutterColumnPosition = (
    /// <summary>
    ///   Column located before the breakpoint mark.
    /// </summary>
    gclBeforeBreakPoint,
    /// <summary>
    ///   Column located after the breakpoint mark.
    /// </summary>
    gclAfterBreakPoint,
    /// <summary>
    ///   Column located before the line numbers.
    /// </summary>
    gclBeforeLineNumbers,
    /// <summary>
    ///   Column located after the line numbers.
    /// </summary>
    gclAfterLineNumbers
  );
  TGutterColumnPositions = set of TGutterColumnPosition;

  INTACodeEditorPaintContext280 = interface
    ['{820865CB-D3AE-4DFA-B3FD-B0C9AB5CBCFA}']
    function GetFileName: string;
    function GetEditView: IOTAEditView;
    function GetEditControl: TWinControl;
    function GetEditorLineNum: Integer;
    function GetLogicalLineNum: Integer;
    function GetCanvas: TCanvas;
    function GetEditorState: INTACodeEditorState;
    function GetLineState: INTACodeEditorLineState;
    /// <summary>
    ///   Gets the name of the file being edited.
    /// </summary>
    property FileName: string read GetFileName;
    /// <summary>
    ///   Gets the current edit view of the code editor.
    /// </summary>
    property EditView: IOTAEditView read GetEditView;
    /// <summary>
    ///   Gets the ode editor control
    /// </summary>
    property EditControl: TWinControl read GetEditControl;
    /// <summary>
    ///   Gets the line number in the editor.
    /// </summary>
    property EditorLineNum: Integer read GetEditorLineNum;
    /// <summary>
    ///   Gets the logical line number in the editor.
    /// </summary>
    property LogicalLineNum: Integer read GetLogicalLineNum;
    /// <summary>
    ///   Gets the canvas of the paint context.
    /// </summary>
    property Canvas: TCanvas read GetCanvas;
    /// <summary>
    ///   Gets the state of the code editor.
    /// </summary>
    property EditorState: INTACodeEditorState read GetEditorState;
    /// <summary>
    ///   Gets the line state of the code editor.
    /// </summary>
    property LineState: INTACodeEditorLineState read GetLineState;
  end;

  /// <summary>
  /// INTACodeEditorPaintContext returns Editor and line info during the current paint operation.
  /// </summary>
  INTACodeEditorPaintContext = interface(INTACodeEditorPaintContext280)
    ['{B95F367E-B426-4D30-8594-956A7A2981B0}']
  end;

  /// <summary>
  /// Editor events notifier.
  /// </summary>
  INTACodeEditorEvents = interface(IOTANotifier)
    ['{78865D81-2D54-4CFB-9C3D-AD7236F57607}']
    /// <summary>
    /// EditorScrolled returns the editor and the direction where the scroll occurs.
    ///
    /// For get notification from this event you should add cevWindowEvents in AllowedEvents result.
    /// </summary>
    procedure EditorScrolled(const Editor: TWinControl;
      const Direction: TCodeEditorScrollDirection);
    /// <summary>
    /// Editor Resized
    ///
    /// For get notification from this event you should add cevWindowEvents in AllowedEvents result.
    /// </summary>
    procedure EditorResized(const Editor: TWinControl);
    /// <summary>
    /// Notifies when a Editor line was Elided
    ///
    /// For get notification from this event you should add cevWindowEvents in AllowedEvents result.
    /// </summary>
    procedure EditorElided(const Editor: TWinControl; const LogicalLineNum: Integer);
    /// <summary>
    /// Notifies when a Editor line was UnElided
    ///
    /// For get notification from this event you should add cevWindowEvents in AllowedEvents result.
    /// </summary>
    procedure EditorUnElided(const Editor: TWinControl; const LogicalLineNum: Integer);

    procedure EditorMouseDown(const Editor: TWinControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EditorMouseMove(const Editor: TWinControl; Shift: TShiftState; X, Y: Integer);
    procedure EditorMouseUp(const Editor: TWinControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    /// <summary>
    /// BeginPaint is called right before the code editor is repainted.
    ///
    /// For get notification from this event you should add cevBeginEndPaintEvents in AllowedEvents result.
    /// </summary>
    procedure BeginPaint(const Editor: TWinControl; const ForceFullRepaint: Boolean);
    /// <summary>
    /// EndPaint is called right after the code editor is repainted.
    ///
    /// For get notification from this event you should add cevBeginEndPaintEvents in AllowedEvents result.
    /// </summary>
    procedure EndPaint(const Editor: TWinControl);
    /// <summary>
    /// PaintLine event is triggered multiple times for each TPaintLineStage
    ///
    /// For get notification from this event you should add cevPaintLineEvents in AllowedEvents result.
    /// </summary>
    /// <param name="Rect">
    /// Bounds where the events occurs. The area depends of the current stage.
    /// </param>
    /// <param name="Stage">
    /// Indicates the current paint stage.
    /// </param>
    /// <param name="BeforeEvent">
    /// True means the event is about to happen.
    /// </param>
    /// <param name="AllowDefaultPainting">
    /// Set AllowDefaultPainting to False to allows the plugin to skip the
    /// IDE's default painting, and to do any custom painting of its own.
    ///
    /// AllowDefaultPainting has effect only when BeforeEvent is True.
    /// </param>
    /// <param name="Context">
    /// Retrieve info about the Editor and the line.
    /// </param>
    procedure PaintLine(const Rect: TRect; const Stage: TPaintLineStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
    /// <summary>
    /// PaintGutter event is triggered multiple times for each TPaintGutterStage
    ///
    /// For get notification from this event you should add cevPaintGutterEvents in AllowedEvents result.
    /// </summary>
    /// <param name="Rect">
    /// Bounds where the paint gutter events occurs. The area depends of the current stage.
    /// </param>
    /// <param name="Stage">
    /// Indicates the current paint stage.
    /// </param>
    /// <param name="BeforeEvent">
    /// True means the event is about to happen.
    /// </param>
    /// <param name="AllowDefaultPainting">
    /// Set AllowDefaultPainting to False to allows the plugin to skip the
    /// IDE's default painting, and to do any custom painting of its own.
    ///
    /// AllowDefaultPainting has effect only when BeforeEvent is True.
    /// </param>
    /// <param name="Context">
    /// Retrieve info about the Editor and the line.
    /// </param>
    procedure PaintGutter(const Rect: TRect; const Stage: TPaintGutterStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
    /// <summary>
    /// PaintText event is triggered for each part of code: each keyword, number, comment, etc
    ///
    /// For get notification from this event you should add cevPaintTextEvents in AllowedEvents result.
    /// </summary>
    /// <param name="Rect">
    /// Bounds where the events occurs. The area depends of the current stage.
    /// </param>
    /// <param name="ColNum">
    /// Column where the text starts.
    /// </param>
    /// <param name="Text">
    /// painting text
    /// </param>
    /// <param name="SyntaxCode">
    /// Indicates the TOTASyntaxCode(atComment, atString, atWhiteSpace,...) for the paint operation.
    /// </param>
    /// <param name="Hilight">
    /// True means the text is Selected.
    /// </param>
    /// <param name="BeforeEvent">
    /// True means the event is about to happen.
    /// </param>
    /// <param name="AllowDefaultPainting">
    /// Set AllowDefaultPainting to False to allows the plugin to skip the
    /// IDE's default text painting, and to do any custom painting of its own.
    ///
    /// AllowDefaultPainting has effect only when BeforeEvent is True.
    /// </param>
    /// <param name="Context">
    /// Retrieve info about the Editor and the line.
    /// </param>
    procedure PaintText(const Rect: TRect; const ColNum: SmallInt; const Text: string;
      const SyntaxCode: TOTASyntaxCode; const Hilight, BeforeEvent: Boolean;
      var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext);
    /// <summary>
    /// override this method for allow get events from the code editor.
    /// </summary>
    function AllowedEvents: TCodeEditorEvents;
    /// <summary>
    /// override this method for specify the gutter stages that should be notified
    /// </summary>
    function AllowedGutterStages: TPaintGutterStages;
    /// <summary>
    /// override this method for specify the line stages that should be notified
    /// </summary>
    function AllowedLineStages: TPaintLineStages;
    /// <summary>
    /// override UIOptions for tweak advanced UI editor settings.
    /// </summary>
    function UIOptions: TCodeEditorUIOptions;
  end;

  INTACodeEditorOptions280 = interface
    ['{BA2E4ADF-7E52-42B7-B29F-2EB1C9D8EA4A}']
    function GetFontColor(Kind: TOTASyntaxCode): TColor;
    function GetBackgroundColor(Kind: TOTASyntaxCode): TColor;
    function GetGutterVisible: Boolean;
    function GetGutterWidth: Integer;
    function GetRightMarginVisible: Boolean;
    function GetRightMarginChars: Integer;
    function GetFontStyles(Kind: TOTASyntaxCode): TFontStyles;
    procedure GetEditorFont(var Font: TFont);
    /// <summary>
    /// Gets the font color for the given syntax code type.
    /// </summary>
    /// <param name="Kind">The type of syntax code.</param>
    /// <returns>The color of the font.</returns>
    property FontColor[Kind: TOTASyntaxCode]: TColor read GetFontColor;
    /// <summary>
    /// Gets the background color for the given syntax code type.
    /// </summary>
    /// <param name="Kind">The type of syntax code.</param>
    /// <returns>The color of the background.</returns>
    property BackgroundColor[Kind: TOTASyntaxCode]: TColor read GetBackgroundColor;
    /// <summary>
    /// Gets a value indicating whether the gutter is visible.
    /// </summary>
    property GutterVisible: Boolean read GetGutterVisible;
    /// <summary>
    /// Gets the width of the gutter.
    /// </summary>
    property GutterWidth: Integer read GetGutterWidth;
    /// <summary>
    /// Gets a value indicating whether the right margin is visible.
    /// </summary>
    property RightMarginVisible: Boolean read GetRightMarginVisible;
    /// <summary>
    /// Gets the number of characters in the right margin.
    /// </summary>
    property RightMarginChars: Integer read GetRightMarginChars;
    /// <summary>
    /// Gets the font styles for the given syntax code type.
    /// </summary>
    /// <param name="Kind">The type of syntax code.</param>
    /// <returns>The font styles.</returns>
    property FontStyles[Kind: TOTASyntaxCode]: TFontStyles read GetFontStyles;
  end;

  INTACodeEditorOptions = interface(INTACodeEditorOptions280)
    ['{4203F789-AC62-433A-A3F7-2D63616D8403}']
  end;

  INTACodeEditorServices280 = interface
    ['{E4501C03-CA9C-4887-98F4-F97B8938986A}']
    /// <summary>
    /// Get the active IOTAEditView for a editor control.
    /// </summary>
    function GetViewForEditor(const Editor: TWinControl): IOTAEditView;
    /// <summary>
    /// Get the editor control for a IOTAEditView.
    /// </summary>
    function GetEditorForView(const View: IOTAEditView): TWinControl;
    /// <summary>
    /// Set the focus for the top editor.
    /// </summary>
    procedure FocusTopEditor;

    function GetTopEditor: TWinControl;
    /// <summary>
    /// Checks if the control is a IDE Code Editor instance.
    /// </summary>
    function IsIDEEditor(const Control: TWinControl): Boolean;
    function GetEditorState(const Editor: TWinControl): INTACodeEditorState;
    /// <summary>
    /// Get a list for the IDE editors.
    /// </summary>
    function GetKnownEditors: TList<TWinControl>;
    /// <summary>
    /// Get a list for the IDE active views.
    /// </summary>
    function GetKnownViews: TList<IOTAEditView>;
    /// <summary>
    /// Call this to register an INTACodeEditorEvents. The result is the index to be
    /// used when calling RemoveNotifier. If &lt;0 then an error occurred.
    /// </summary>
    function AddEditorEventsNotifier(const ANotifier: INTACodeEditorEvents): Integer;
    /// <summary>
    /// Call with the index obtained from AddEditorEventsNotifier
    /// </summary>
    procedure RemoveEditorEventsNotifier(Index: Integer);
    function GetCodeEditorOptions: INTACodeEditorOptions;

    /// <summary>
    /// Request a gutter column (that is, horizontal space in each line) that is "theirs" to draw in.
    ///
    /// </summary>
    /// <param name="NotifierIndex">
    /// The Notifier that owns the gutter column
    /// </param>
    /// <param name="Size">
    /// Column Size in pixels, always assume 96 DPI, Editor control scale this value.
    /// </param>
    /// <param name="Position">
    /// Set the gutter column location (before/after breakpoints or before/after the line numbers).
    /// </param>
    function RequestGutterColumn(const NotifierIndex, Size: Integer; Position: TGutterColumnPosition): Integer;
    /// <summary>
    /// Call with the index obtained from RequestGutterColumn
    /// </summary>
    procedure RemoveGutterColumn(const ColumnIndex: Integer);

    procedure InvalidateEditor(const Editor: TWinControl); overload;
    procedure InvalidateEditorRect(const Editor: TWinControl; ARect: TRect); overload;
    procedure InvalidateEditorLogicalLine(const Editor: TWinControl; const LogicalLine: Integer); overload;
    procedure InvalidateTopEditor;
    procedure InvalidateTopEditorRect(ARect: TRect);
    procedure InvalidateTopEditorLogicalLine(const LogicalLine: Integer);

    property TopEditor: TWinControl read GetTopEditor;
    property EditorState[const Editor: TWinControl]: INTACodeEditorState read GetEditorState;
    property Options: INTACodeEditorOptions read GetCodeEditorOptions;
  end;

  INTACodeEditorServices = interface(INTACodeEditorServices280)
    ['{449D7687-9D4C-454C-846E-FEC673605BF8}']
  end;

  TEditorScrolledEvent = procedure(const Editor: TWinControl;
    const Direction: TCodeEditorScrollDirection) of object;
  TEditorResizedEvent = procedure(const Editor: TWinControl) of object;
  TEditorElidedEvent = procedure(const Editor: TWinControl;
    const LogicalLineNum: Integer) of object;
  TEditorMouseDownEvent = procedure(const Editor: TWinControl;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer) of object;
  TEditorMouseUpEvent = procedure(const Editor: TWinControl;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer) of object;
  TEditorMouseMoveEvent = procedure(const Editor: TWinControl; Shift: TShiftState; X, Y: Integer) of object;
  TEditorBeginPaintEvent = procedure(const Editor: TWinControl;
    const ForceFullRepaint: Boolean) of object;
  TEditorEndPaintEvent = procedure(const Editor: TWinControl) of object;
  TEditorPaintLineEvent = procedure(const Rect: TRect; const Stage: TPaintLineStage;
    const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
    const Context: INTACodeEditorPaintContext) of object;
  TEditorPaintGutterEvent = procedure(const Rect: TRect; const Stage: TPaintGutterStage;
    const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
    const Context: INTACodeEditorPaintContext) of object;
  TEditorPaintTextEvent = procedure(const Rect: TRect; const ColNum: SmallInt; const Text: string;
    const SyntaxCode: TOTASyntaxCode; const Hilight, BeforeEvent: Boolean;
    var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext) of object;

  TNTACodeEditorNotifier = class(TNotifierObject, INTACodeEditorEvents)
  private
    FEditorScrolled: TEditorScrolledEvent;
    FEditorResized: TEditorResizedEvent;
    FEditorElided, FEditorUnElided: TEditorElidedEvent;
    FEditorBeginPaint: TEditorBeginPaintEvent;
    FEditorEndPaint: TEditorEndPaintEvent;
    FEditorPaintGutter: TEditorPaintGutterEvent;
    FEditorPaintLine: TEditorPaintLineEvent;
    FEditorPaintText: TEditorPaintTextEvent;
    FEditorMouseDown: TEditorMouseDownEvent;
    FEditorMouseUp: TEditorMouseUpEvent;
    FEditorMouseMove: TEditorMouseMoveEvent;
  protected
    procedure EditorScrolled(const Editor: TWinControl;
      const Direction: TCodeEditorScrollDirection);
    procedure EditorResized(const Editor: TWinControl);
    procedure EditorElided(const Editor: TWinControl; const LogicalLineNum: Integer);
    procedure EditorUnElided(const Editor: TWinControl; const LogicalLineNum: Integer);
    procedure EditorMouseDown(const Editor: TWinControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EditorMouseMove(const Editor: TWinControl; Shift: TShiftState; X, Y: Integer);
    procedure EditorMouseUp(const Editor: TWinControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BeginPaint(const Editor: TWinControl; const ForceFullRepaint: Boolean);
    procedure EndPaint(const Editor: TWinControl);
    procedure PaintLine(const Rect: TRect; const Stage: TPaintLineStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
    procedure PaintGutter(const Rect: TRect; const Stage: TPaintGutterStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
    procedure PaintText(const Rect: TRect; const ColNum: SmallInt; const Text: string;
      const SyntaxCode: TOTASyntaxCode; const Hilight, BeforeEvent: Boolean;
      var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext);
    function AllowedEvents: TCodeEditorEvents; virtual;
    function AllowedGutterStages: TPaintGutterStages; virtual;
    function AllowedLineStages: TPaintLineStages; virtual;
    function UIOptions: TCodeEditorUIOptions; virtual;
  public
    property OnEditorScrolled: TEditorScrolledEvent read FEditorScrolled write FEditorScrolled;
    property OnEditorResized: TEditorResizedEvent read FEditorResized write FEditorResized;
    property OnEditorElided: TEditorElidedEvent read FEditorElided write FEditorElided;
    property OnEditorUnElided: TEditorElidedEvent read FEditorUnElided write FEditorUnElided;
    property OnEditorMouseDown: TEditorMouseDownEvent read FEditorMouseDown write FEditorMouseDown;
    property OnEditorMouseUp: TEditorMouseUpEvent read FEditorMouseUp write FEditorMouseUp;
    property OnEditorMouseMove: TEditorMouseMoveEvent read FEditorMouseMove write FEditorMouseMove;
    property OnEditorBeginPaint: TEditorBeginPaintEvent read FEditorBeginPaint write FEditorBeginPaint;
    property OnEditorEndPaint: TEditorEndPaintEvent read FEditorEndPaint write FEditorEndPaint;
    property OnEditorPaintGutter: TEditorPaintGutterEvent read FEditorPaintGutter write FEditorPaintGutter;
    property OnEditorPaintLine: TEditorPaintLineEvent read FEditorPaintLine write FEditorPaintLine;
    property OnEditorPaintText: TEditorPaintTextEvent read FEditorPaintText write FEditorPaintText;
  end;

const
  cGutterColumnAllPositions = [gclBeforeBreakPoint, gclAfterBreakPoint,
    gclBeforeLineNumbers, gclAfterLineNumbers];

  /// <summary>
  /// Returns a string representation of the given TOTASyntaxCode value.
  /// </summary>
  /// <param name="SyntaxCode">The TOTASyntaxCode value to be converted to string.</param>
  function OTASyntaxCodeToStr(SyntaxCode: TOTASyntaxCode): string;

implementation

uses
  System.SysUtils;

function OTASyntaxCodeToStr(SyntaxCode: TOTASyntaxCode): string;
begin
  case SyntaxCode of
    atWhiteSpace: Result := 'atWhiteSpace';
    atComment: Result := 'atComment';
    atReservedWord: Result := 'atReservedWord';
    atIdentifier: Result := 'atIdentifier';
    atSymbol: Result := 'atSymbol';
    atString: Result := 'atString';
    atNumber: Result := 'atNumber';
    atFloat: Result := 'atFloat';
    atOctal: Result := 'atOctal';
    atHex: Result := 'atHex';
    atBinary: Result := 'atBinary';
    atCharacter: Result := 'atCharacter';
    atPreproc: Result := 'atPreproc';
    atIllegal: Result := 'atIllegal';
    atAssembler: Result := 'atAssembler';
    SyntaxOff: Result := 'SyntaxOff';
    MarkedBlock: Result := 'MarkedBlock';
    SearchMatch: Result := 'SearchMatch';
    //ModifiedLine: Result := 'ModifiedLine';
    atHotLink: Result := 'atHotLink';
    atTags: Result := 'atTags';
    atAttrNames: Result := 'atAttrNames';
    atAttrValues: Result := 'atAttrValues';
    atScripts: Result := 'atScripts';
    RightMargin: Result := 'RightMargin';
    atBraceHighlight: Result := 'atBraceHighlight';
    atLineHighlight: Result := 'atLineHighlight';
    atSearchOtherMatchHighlight: Result := 'atSearchOtherMatchHighlight';
    atFolded: Result := 'atFolded';
    else Result := Format('SyntaxCode %d', [SyntaxCode]);
  end;
end;

{ TNTACodeEditorNotifier }

function TNTACodeEditorNotifier.AllowedEvents: TCodeEditorEvents;
begin
  Result := [];
end;

function TNTACodeEditorNotifier.AllowedGutterStages: TPaintGutterStages;
begin
  Result := [];
end;

function TNTACodeEditorNotifier.AllowedLineStages: TPaintLineStages;
begin
  Result := [];
end;

procedure TNTACodeEditorNotifier.BeginPaint(const Editor: TWinControl;
  const ForceFullRepaint: Boolean);
begin
  if @FEditorBeginPaint <> nil then
    FEditorBeginPaint(Editor, ForceFullRepaint);
end;

procedure TNTACodeEditorNotifier.EditorElided(const Editor: TWinControl;
  const LogicalLineNum: Integer);
begin
  if @FEditorElided <> nil then
    FEditorElided(Editor, LogicalLineNum);
end;

procedure TNTACodeEditorNotifier.EditorMouseDown(const Editor: TWinControl;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if @FEditorMouseDown <> nil then
    FEditorMouseDown(Editor, Button, Shift, X, Y);
end;

procedure TNTACodeEditorNotifier.EditorMouseMove(const Editor: TWinControl;
  Shift: TShiftState; X, Y: Integer);
begin
  if @FEditorMouseMove <> nil then
    FEditorMouseMove(Editor, Shift, X, Y);
end;

procedure TNTACodeEditorNotifier.EditorMouseUp(const Editor: TWinControl;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if @FEditorMouseUp <> nil then
    FEditorMouseUp(Editor, Button, Shift, X, Y);
end;

procedure TNTACodeEditorNotifier.EditorResized(const Editor: TWinControl);
begin
  if @FEditorResized <> nil then
    FEditorResized(Editor);
end;

procedure TNTACodeEditorNotifier.EditorScrolled(const Editor: TWinControl;
  const Direction: TCodeEditorScrollDirection);
begin
  if @FEditorScrolled <> nil then
    FEditorScrolled(Editor, Direction);
end;

procedure TNTACodeEditorNotifier.EditorUnElided(const Editor: TWinControl;
  const LogicalLineNum: Integer);
begin
  if @FEditorUnElided <> nil then
    FEditorUnElided(Editor, LogicalLineNum);
end;

procedure TNTACodeEditorNotifier.EndPaint(const Editor: TWinControl);
begin
  if @FEditorEndPaint <> nil then
    FEditorEndPaint(Editor);
end;

procedure TNTACodeEditorNotifier.PaintGutter(const Rect: TRect;
  const Stage: TPaintGutterStage; const BeforeEvent: Boolean;
  var AllowDefaultPainting: Boolean;
  const Context: INTACodeEditorPaintContext);
begin
  if @FEditorPaintGutter <> nil then
    FEditorPaintGutter(Rect, Stage, BeforeEvent, AllowDefaultPainting, Context);
end;

procedure TNTACodeEditorNotifier.PaintLine(const Rect: TRect;
  const Stage: TPaintLineStage; const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
  const Context: INTACodeEditorPaintContext);
begin
  if @FEditorPaintLine <> nil then
    FEditorPaintLine(Rect, Stage, BeforeEvent, AllowDefaultPainting, Context);
end;

procedure TNTACodeEditorNotifier.PaintText(const Rect: TRect; const ColNum: SmallInt; const Text: string;
  const SyntaxCode: TOTASyntaxCode; const Hilight, BeforeEvent: Boolean;
  var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext);
begin
  if @FEditorPaintText <> nil then
    FEditorPaintText(Rect, ColNum, Text, SyntaxCode, Hilight, BeforeEvent, AllowDefaultPainting, Context);
end;

function TNTACodeEditorNotifier.UIOptions: TCodeEditorUIOptions;
begin
  Result := [];
end;

end.


