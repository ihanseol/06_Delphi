{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI.Text;

{$WEAKPACKAGEUNIT ON}

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses
  Winapi.Windows,
  Winapi.WinRT,
  System.Types,
  System.Win.WinRT,
  Winapi.CommonTypes,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type

  // Forward declarations for interfaces

  // Microsoft.UI.Text.ITextCharacterFormat
  ITextCharacterFormat = interface;
  PITextCharacterFormat = ^ITextCharacterFormat;

  // Microsoft.UI.Text.ITextParagraphFormat
  ITextParagraphFormat = interface;
  PITextParagraphFormat = ^ITextParagraphFormat;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Microsoft.UI.Text.ITextRange
  ITextRange = interface;
  PITextRange = ^ITextRange;

  // Microsoft.UI.Text.ITextSelection
  ITextSelection = interface;
  PITextSelection = ^ITextSelection;

  // Microsoft.UI.Text.ITextDocument
  ITextDocument = interface;
  PITextDocument = ^ITextDocument;

  // Microsoft.UI.Text Enums

  // Microsoft.UI.Text.CaretType
  CaretType = (
    Normal = 0,
    Null = 1
  );
  PCaretType = ^CaretType;

  // Microsoft.UI.Text.FindOptions
  FindOptions = (
    None = 0,
    Word = 2,
    &Case = 4
  );
  PFindOptions = ^FindOptions;

  // Microsoft.UI.Text.FormatEffect
  FormatEffect = (
    Off = 0,
    &On = 1,
    Toggle = 2,
    Undefined = 3
  );
  PFormatEffect = ^FormatEffect;

  // Microsoft.UI.Text.HorizontalCharacterAlignment
  HorizontalCharacterAlignment = (
    Left = 0,
    Right = 1,
    Center = 2
  );
  PHorizontalCharacterAlignment = ^HorizontalCharacterAlignment;

  // Microsoft.UI.Text.LetterCase
  LetterCase = (
    Lower = 0,
    Upper = 1
  );
  PLetterCase = ^LetterCase;

  // Microsoft.UI.Text.LineSpacingRule
  LineSpacingRule = (
    Undefined = 0,
    Single = 1,
    OneAndHalf = 2,
    Double = 3,
    AtLeast = 4,
    Exactly = 5,
    Multiple = 6,
    Percent = 7
  );
  PLineSpacingRule = ^LineSpacingRule;

  // Microsoft.UI.Text.LinkType
  LinkType = (
    Undefined = 0,
    NotALink = 1,
    ClientLink = 2,
    FriendlyLinkName = 3,
    FriendlyLinkAddress = 4,
    AutoLink = 5,
    AutoLinkEmail = 6,
    AutoLinkPhone = 7,
    AutoLinkPath = 8
  );
  PLinkType = ^LinkType;

  // Microsoft.UI.Text.MarkerAlignment
  MarkerAlignment = (
    Undefined = 0,
    Left = 1,
    Center = 2,
    Right = 3
  );
  PMarkerAlignment = ^MarkerAlignment;

  // Microsoft.UI.Text.MarkerStyle
  MarkerStyle = (
    Undefined = 0,
    Parenthesis = 1,
    Parentheses = 2,
    Period = 3,
    Plain = 4,
    Minus = 5,
    NoNumber = 6
  );
  PMarkerStyle = ^MarkerStyle;

  // Microsoft.UI.Text.MarkerType
  MarkerType = (
    Undefined = 0,
    None = 1,
    Bullet = 2,
    Arabic = 3,
    LowercaseEnglishLetter = 4,
    UppercaseEnglishLetter = 5,
    LowercaseRoman = 6,
    UppercaseRoman = 7,
    UnicodeSequence = 8,
    CircledNumber = 9,
    BlackCircleWingding = 10,
    WhiteCircleWingding = 11,
    ArabicWide = 12,
    SimplifiedChinese = 13,
    TraditionalChinese = 14,
    JapanSimplifiedChinese = 15,
    JapanKorea = 16,
    ArabicDictionary = 17,
    ArabicAbjad = 18,
    Hebrew = 19,
    ThaiAlphabetic = 20,
    ThaiNumeric = 21,
    DevanagariVowel = 22,
    DevanagariConsonant = 23,
    DevanagariNumeric = 24
  );
  PMarkerType = ^MarkerType;

  // Microsoft.UI.Text.ParagraphAlignment
  ParagraphAlignment = (
    Undefined = 0,
    Left = 1,
    Center = 2,
    Right = 3,
    Justify = 4
  );
  PParagraphAlignment = ^ParagraphAlignment;

  // Microsoft.UI.Text.ParagraphStyle
  ParagraphStyle = (
    Undefined = 0,
    None = 1,
    Normal = 2,
    Heading1 = 3,
    Heading2 = 4,
    Heading3 = 5,
    Heading4 = 6,
    Heading5 = 7,
    Heading6 = 8,
    Heading7 = 9,
    Heading8 = 10,
    Heading9 = 11
  );
  PParagraphStyle = ^ParagraphStyle;

  // Microsoft.UI.Text.PointOptions
  PointOptions = (
    None = 0,
    IncludeInset = 1,
    Start = 32,
    ClientCoordinates = 256,
    AllowOffClient = 512,
    Transform = 1024,
    NoHorizontalScroll = 65536,
    NoVerticalScroll = 262144
  );
  PPointOptions = ^PointOptions;

  // Microsoft.UI.Text.RangeGravity
  RangeGravity = (
    UIBehavior = 0,
    Backward = 1,
    Forward = 2,
    Inward = 3,
    Outward = 4
  );
  PRangeGravity = ^RangeGravity;

  // Microsoft.UI.Text.RichEditMathMode
  RichEditMathMode = (
    NoMath = 0,
    MathOnly = 1
  );
  PRichEditMathMode = ^RichEditMathMode;

  // Microsoft.UI.Text.SelectionOptions
  SelectionOptions = (
    StartActive = 1,
    AtEndOfLine = 2,
    Overtype = 4,
    Active = 8,
    Replace = 16
  );
  PSelectionOptions = ^SelectionOptions;

  // Microsoft.UI.Text.SelectionType
  SelectionType = (
    None = 0,
    InsertionPoint = 1,
    Normal = 2,
    InlineShape = 7,
    Shape = 8
  );
  PSelectionType = ^SelectionType;

  // Microsoft.UI.Text.TabAlignment
  TabAlignment = (
    Left = 0,
    Center = 1,
    Right = 2,
    Decimal = 3,
    Bar = 4
  );
  PTabAlignment = ^TabAlignment;

  // Microsoft.UI.Text.TabLeader
  TabLeader = (
    Spaces = 0,
    Dots = 1,
    Dashes = 2,
    Lines = 3,
    ThickLines = 4,
    Equals = 5
  );
  PTabLeader = ^TabLeader;

  // Microsoft.UI.Text.TextGetOptions
  TextGetOptions = (
    None = 0,
    AdjustCrlf = 1,
    UseCrlf = 2,
    UseObjectText = 4,
    AllowFinalEop = 8,
    NoHidden = 32,
    IncludeNumbering = 64,
    FormatRtf = 8192,
    UseLf = 16777216
  );
  PTextGetOptions = ^TextGetOptions;

  // Microsoft.UI.Text.TextRangeUnit
  TextRangeUnit = (
    Character = 0,
    Word = 1,
    Sentence = 2,
    Paragraph = 3,
    Line = 4,
    Story = 5,
    Screen = 6,
    Section = 7,
    Window = 8,
    CharacterFormat = 9,
    ParagraphFormat = 10,
    &Object = 11,
    HardParagraph = 12,
    Cluster = 13,
    Bold = 14,
    Italic = 15,
    Underline = 16,
    Strikethrough = 17,
    ProtectedText = 18,
    Link = 19,
    SmallCaps = 20,
    AllCaps = 21,
    Hidden = 22,
    Outline = 23,
    Shadow = 24,
    Imprint = 25,
    Disabled = 26,
    Revised = 27,
    Subscript = 28,
    Superscript = 29,
    FontBound = 30,
    LinkProtected = 31,
    ContentLink = 32
  );
  PTextRangeUnit = ^TextRangeUnit;

  // Microsoft.UI.Text.TextScript
  TextScript = (
    Undefined = 0,
    Ansi = 1,
    EastEurope = 2,
    Cyrillic = 3,
    Greek = 4,
    Turkish = 5,
    Hebrew = 6,
    Arabic = 7,
    Baltic = 8,
    Vietnamese = 9,
    Default = 10,
    Symbol = 11,
    Thai = 12,
    ShiftJis = 13,
    GB2312 = 14,
    Hangul = 15,
    Big5 = 16,
    PC437 = 17,
    Oem = 18,
    Mac = 19,
    Armenian = 20,
    Syriac = 21,
    Thaana = 22,
    Devanagari = 23,
    Bengali = 24,
    Gurmukhi = 25,
    Gujarati = 26,
    Oriya = 27,
    Tamil = 28,
    Telugu = 29,
    Kannada = 30,
    Malayalam = 31,
    Sinhala = 32,
    Lao = 33,
    Tibetan = 34,
    Myanmar = 35,
    Georgian = 36,
    Jamo = 37,
    Ethiopic = 38,
    Cherokee = 39,
    Aboriginal = 40,
    Ogham = 41,
    Runic = 42,
    Khmer = 43,
    Mongolian = 44,
    Braille = 45,
    Yi = 46,
    Limbu = 47,
    TaiLe = 48,
    NewTaiLue = 49,
    SylotiNagri = 50,
    Kharoshthi = 51,
    Kayahli = 52,
    UnicodeSymbol = 53,
    Emoji = 54,
    Glagolitic = 55,
    Lisu = 56,
    Vai = 57,
    NKo = 58,
    Osmanya = 59,
    PhagsPa = 60,
    Gothic = 61,
    Deseret = 62,
    Tifinagh = 63
  );
  PTextScript = ^TextScript;

  // Microsoft.UI.Text.TextSetOptions
  TextSetOptions = (
    None = 0,
    UnicodeBidi = 1,
    Unlink = 8,
    Unhide = 16,
    CheckTextLimit = 32,
    FormatRtf = 8192,
    ApplyRtfDocumentDefaults = 16384
  );
  PTextSetOptions = ^TextSetOptions;

  // Microsoft.UI.Text.UnderlineType
  UnderlineType = (
    Undefined = 0,
    None = 1,
    Single = 2,
    Words = 3,
    Double = 4,
    Dotted = 5,
    Dash = 6,
    DashDot = 7,
    DashDotDot = 8,
    Wave = 9,
    Thick = 10,
    Thin = 11,
    DoubleWave = 12,
    HeavyWave = 13,
    LongDash = 14,
    ThickDash = 15,
    ThickDashDot = 16,
    ThickDashDotDot = 17,
    ThickDotted = 18,
    ThickLongDash = 19
  );
  PUnderlineType = ^UnderlineType;

  // Microsoft.UI.Text.VerticalCharacterAlignment
  VerticalCharacterAlignment = (
    Top = 0,
    Baseline = 1,
    Bottom = 2
  );
  PVerticalCharacterAlignment = ^VerticalCharacterAlignment;

  // Microsoft.UI.Text Interfaces

  // UsedAPI Interface
  // Microsoft.UI.Text.ITextCharacterFormat
  ITextCharacterFormat = interface(IInspectable)
  ['{F5710050-98E5-5788-B1E3-32191EEBF94D}']
    function get_AllCaps: FormatEffect; safecall;
    procedure put_AllCaps(value: FormatEffect); safecall;
    function get_BackgroundColor: Color; safecall;
    procedure put_BackgroundColor(value: Color); safecall;
    function get_Bold: FormatEffect; safecall;
    procedure put_Bold(value: FormatEffect); safecall;
    function get_FontStretch: FontStretch; safecall;
    procedure put_FontStretch(value: FontStretch); safecall;
    function get_FontStyle: FontStyle; safecall;
    procedure put_FontStyle(value: FontStyle); safecall;
    function get_ForegroundColor: Color; safecall;
    procedure put_ForegroundColor(value: Color); safecall;
    function get_Hidden: FormatEffect; safecall;
    procedure put_Hidden(value: FormatEffect); safecall;
    function get_Italic: FormatEffect; safecall;
    procedure put_Italic(value: FormatEffect); safecall;
    function get_Kerning: Single; safecall;
    procedure put_Kerning(value: Single); safecall;
    function get_LanguageTag: HSTRING; safecall;
    procedure put_LanguageTag(value: HSTRING); safecall;
    function get_LinkType: LinkType; safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Outline: FormatEffect; safecall;
    procedure put_Outline(value: FormatEffect); safecall;
    function get_Position: Single; safecall;
    procedure put_Position(value: Single); safecall;
    function get_ProtectedText: FormatEffect; safecall;
    procedure put_ProtectedText(value: FormatEffect); safecall;
    function get_Size: Single; safecall;
    procedure put_Size(value: Single); safecall;
    function get_SmallCaps: FormatEffect; safecall;
    procedure put_SmallCaps(value: FormatEffect); safecall;
    function get_Spacing: Single; safecall;
    procedure put_Spacing(value: Single); safecall;
    function get_Strikethrough: FormatEffect; safecall;
    procedure put_Strikethrough(value: FormatEffect); safecall;
    function get_Subscript: FormatEffect; safecall;
    procedure put_Subscript(value: FormatEffect); safecall;
    function get_Superscript: FormatEffect; safecall;
    procedure put_Superscript(value: FormatEffect); safecall;
    function get_TextScript: TextScript; safecall;
    procedure put_TextScript(value: TextScript); safecall;
    function get_Underline: UnderlineType; safecall;
    procedure put_Underline(value: UnderlineType); safecall;
    function get_Weight: Integer; safecall;
    procedure put_Weight(value: Integer); safecall;
    procedure SetClone(value: ITextCharacterFormat); safecall;
    function GetClone: ITextCharacterFormat; safecall;
    function IsEqual(format: ITextCharacterFormat): Boolean; safecall;
    property AllCaps: FormatEffect read get_AllCaps write put_AllCaps;
    property BackgroundColor: Color read get_BackgroundColor write put_BackgroundColor;
    property Bold: FormatEffect read get_Bold write put_Bold;
    property FontStretch_: FontStretch read get_FontStretch write put_FontStretch;
    property FontStyle_: FontStyle read get_FontStyle write put_FontStyle;
    property ForegroundColor: Color read get_ForegroundColor write put_ForegroundColor;
    property Hidden: FormatEffect read get_Hidden write put_Hidden;
    property Italic: FormatEffect read get_Italic write put_Italic;
    property Kerning: Single read get_Kerning write put_Kerning;
    property LanguageTag: HSTRING read get_LanguageTag write put_LanguageTag;
    property LinkType_: LinkType read get_LinkType;
    property Name: HSTRING read get_Name write put_Name;
    property Outline: FormatEffect read get_Outline write put_Outline;
    property Position: Single read get_Position write put_Position;
    property ProtectedText: FormatEffect read get_ProtectedText write put_ProtectedText;
    property Size: Single read get_Size write put_Size;
    property SmallCaps: FormatEffect read get_SmallCaps write put_SmallCaps;
    property Spacing: Single read get_Spacing write put_Spacing;
    property Strikethrough: FormatEffect read get_Strikethrough write put_Strikethrough;
    property Subscript: FormatEffect read get_Subscript write put_Subscript;
    property Superscript: FormatEffect read get_Superscript write put_Superscript;
    property TextScript_: TextScript read get_TextScript write put_TextScript;
    property Underline: UnderlineType read get_Underline write put_Underline;
    property Weight: Integer read get_Weight write put_Weight;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Text.ITextParagraphFormat
  ITextParagraphFormat = interface(IInspectable)
  ['{219B6CDF-0D0B-5701-B8A1-6C906B3EBBE1}']
    function get_Alignment: ParagraphAlignment; safecall;
    procedure put_Alignment(value: ParagraphAlignment); safecall;
    function get_FirstLineIndent: Single; safecall;
    function get_KeepTogether: FormatEffect; safecall;
    procedure put_KeepTogether(value: FormatEffect); safecall;
    function get_KeepWithNext: FormatEffect; safecall;
    procedure put_KeepWithNext(value: FormatEffect); safecall;
    function get_LeftIndent: Single; safecall;
    function get_LineSpacing: Single; safecall;
    function get_LineSpacingRule: LineSpacingRule; safecall;
    function get_ListAlignment: MarkerAlignment; safecall;
    procedure put_ListAlignment(value: MarkerAlignment); safecall;
    function get_ListLevelIndex: Integer; safecall;
    procedure put_ListLevelIndex(value: Integer); safecall;
    function get_ListStart: Integer; safecall;
    procedure put_ListStart(value: Integer); safecall;
    function get_ListStyle: MarkerStyle; safecall;
    procedure put_ListStyle(value: MarkerStyle); safecall;
    function get_ListTab: Single; safecall;
    procedure put_ListTab(value: Single); safecall;
    function get_ListType: MarkerType; safecall;
    procedure put_ListType(value: MarkerType); safecall;
    function get_NoLineNumber: FormatEffect; safecall;
    procedure put_NoLineNumber(value: FormatEffect); safecall;
    function get_PageBreakBefore: FormatEffect; safecall;
    procedure put_PageBreakBefore(value: FormatEffect); safecall;
    function get_RightIndent: Single; safecall;
    procedure put_RightIndent(value: Single); safecall;
    function get_RightToLeft: FormatEffect; safecall;
    procedure put_RightToLeft(value: FormatEffect); safecall;
    function get_Style: ParagraphStyle; safecall;
    procedure put_Style(value: ParagraphStyle); safecall;
    function get_SpaceAfter: Single; safecall;
    procedure put_SpaceAfter(value: Single); safecall;
    function get_SpaceBefore: Single; safecall;
    procedure put_SpaceBefore(value: Single); safecall;
    function get_WidowControl: FormatEffect; safecall;
    procedure put_WidowControl(value: FormatEffect); safecall;
    function get_TabCount: Integer; safecall;
    procedure AddTab(position: Single; align: TabAlignment; leader: TabLeader); safecall;
    procedure ClearAllTabs; safecall;
    procedure DeleteTab(position: Single); safecall;
    function GetClone: ITextParagraphFormat; safecall;
    procedure GetTab(index: Integer; out position: Single; out align: TabAlignment; out leader: TabLeader); safecall;
    function IsEqual(format: ITextParagraphFormat): Boolean; safecall;
    procedure SetClone(format: ITextParagraphFormat); safecall;
    procedure SetIndents(start: Single; left: Single; right: Single); safecall;
    procedure SetLineSpacing(rule: LineSpacingRule; spacing: Single); safecall;
    property Alignment: ParagraphAlignment read get_Alignment write put_Alignment;
    property FirstLineIndent: Single read get_FirstLineIndent;
    property KeepTogether: FormatEffect read get_KeepTogether write put_KeepTogether;
    property KeepWithNext: FormatEffect read get_KeepWithNext write put_KeepWithNext;
    property LeftIndent: Single read get_LeftIndent;
    property LineSpacing: Single read get_LineSpacing;
    property LineSpacingRule_: LineSpacingRule read get_LineSpacingRule;
    property ListAlignment: MarkerAlignment read get_ListAlignment write put_ListAlignment;
    property ListLevelIndex: Integer read get_ListLevelIndex write put_ListLevelIndex;
    property ListStart: Integer read get_ListStart write put_ListStart;
    property ListStyle: MarkerStyle read get_ListStyle write put_ListStyle;
    property ListTab: Single read get_ListTab write put_ListTab;
    property ListType: MarkerType read get_ListType write put_ListType;
    property NoLineNumber: FormatEffect read get_NoLineNumber write put_NoLineNumber;
    property PageBreakBefore: FormatEffect read get_PageBreakBefore write put_PageBreakBefore;
    property RightIndent: Single read get_RightIndent write put_RightIndent;
    property RightToLeft: FormatEffect read get_RightToLeft write put_RightToLeft;
    property SpaceAfter: Single read get_SpaceAfter write put_SpaceAfter;
    property SpaceBefore: Single read get_SpaceBefore write put_SpaceBefore;
    property Style: ParagraphStyle read get_Style write put_Style;
    property TabCount: Integer read get_TabCount;
    property WidowControl: FormatEffect read get_WidowControl write put_WidowControl;
  end;

  // Generic Delegate for:
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{38F3077E-5DB3-5086-8CFB-A84390F080BA}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
  end;

  // Generic Delegate for:
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{CC373E50-25F3-5972-87A2-B0E2E9A8256B}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base = interface(IInspectable)
  ['{B65E248D-E184-5797-AE90-A88CD6EC980B}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
  end;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Text.ITextRange
  ITextRange = interface(IInspectable)
  ['{06D4ABCF-0C06-5D12-A743-85537EFD09EA}']
    function get_Character: Char; safecall;
    procedure put_Character(value: Char); safecall;
    function get_CharacterFormat: ITextCharacterFormat; safecall;
    procedure put_CharacterFormat(value: ITextCharacterFormat); safecall;
    function get_FormattedText: ITextRange; safecall;
    procedure put_FormattedText(value: ITextRange); safecall;
    function get_EndPosition: Integer; safecall;
    procedure put_EndPosition(value: Integer); safecall;
    function get_Gravity: RangeGravity; safecall;
    procedure put_Gravity(value: RangeGravity); safecall;
    function get_Length: Integer; safecall;
    function get_Link: HSTRING; safecall;
    procedure put_Link(value: HSTRING); safecall;
    function get_ParagraphFormat: ITextParagraphFormat; safecall;
    procedure put_ParagraphFormat(value: ITextParagraphFormat); safecall;
    function get_StartPosition: Integer; safecall;
    procedure put_StartPosition(value: Integer); safecall;
    function get_StoryLength: Integer; safecall;
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function CanPaste(format: Integer): Boolean; safecall;
    procedure ChangeCase(value: LetterCase); safecall;
    procedure Collapse(value: Boolean); safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    function Delete(&unit: TextRangeUnit; count: Integer): Integer; safecall;
    function EndOf(&unit: TextRangeUnit; extend: Boolean): Integer; safecall;
    function Expand(&unit: TextRangeUnit): Integer; safecall;
    function FindText(value: HSTRING; scanLength: Integer; options: FindOptions): Integer; safecall;
    procedure GetCharacterUtf32(out value: Cardinal; offset: Integer); safecall;
    function GetClone: ITextRange; safecall;
    function GetIndex(&unit: TextRangeUnit): Integer; safecall;
    procedure GetPoint(horizontalAlign: HorizontalCharacterAlignment; verticalAlign: VerticalCharacterAlignment; options: PointOptions; out point: TPointF); safecall;
    procedure GetRect(options: PointOptions; out rect: TRectF; out hit: Integer); safecall;
    procedure GetText(options: TextGetOptions; out value: HSTRING); safecall;
    procedure GetTextViaStream(options: TextGetOptions; value: IRandomAccessStream); safecall;
    function InRange(range: ITextRange): Boolean; safecall;
    procedure InsertImage(width: Integer; height: Integer; ascent: Integer; verticalAlign: VerticalCharacterAlignment; alternateText: HSTRING; value: IRandomAccessStream); safecall;
    function InStory(range: ITextRange): Boolean; safecall;
    function IsEqual(range: ITextRange): Boolean; safecall;
    function Move(&unit: TextRangeUnit; count: Integer): Integer; safecall;
    function MoveEnd(&unit: TextRangeUnit; count: Integer): Integer; safecall;
    function MoveStart(&unit: TextRangeUnit; count: Integer): Integer; safecall;
    procedure Paste(format: Integer); safecall;
    procedure ScrollIntoView(value: PointOptions); safecall;
    procedure MatchSelection; safecall;
    procedure SetIndex(&unit: TextRangeUnit; index: Integer; extend: Boolean); safecall;
    procedure SetPoint(point: TPointF; options: PointOptions; extend: Boolean); safecall;
    procedure SetRange(startPosition: Integer; endPosition: Integer); safecall;
    procedure SetText(options: TextSetOptions; value: HSTRING); safecall;
    procedure SetTextViaStream(options: TextSetOptions; value: IRandomAccessStream); safecall;
    function StartOf(&unit: TextRangeUnit; extend: Boolean): Integer; safecall;
    property Character: Char read get_Character write put_Character;
    property CharacterFormat: ITextCharacterFormat read get_CharacterFormat write put_CharacterFormat;
    property EndPosition: Integer read get_EndPosition write put_EndPosition;
    property FormattedText: ITextRange read get_FormattedText write put_FormattedText;
    property Gravity: RangeGravity read get_Gravity write put_Gravity;
    property Length: Integer read get_Length;
    property Link: HSTRING read get_Link write put_Link;
    property ParagraphFormat: ITextParagraphFormat read get_ParagraphFormat write put_ParagraphFormat;
    property StartPosition: Integer read get_StartPosition write put_StartPosition;
    property StoryLength: Integer read get_StoryLength;
    property Text: HSTRING read get_Text write put_Text;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Text.ITextSelection
  ITextSelection = interface(IInspectable)
  ['{8F5E6CB1-2B04-589F-BD24-54E5CD8DD399}']
    function get_Options: SelectionOptions; safecall;
    procedure put_Options(value: SelectionOptions); safecall;
    function get_Type: SelectionType; safecall;
    function EndKey(&unit: TextRangeUnit; extend: Boolean): Integer; safecall;
    function HomeKey(&unit: TextRangeUnit; extend: Boolean): Integer; safecall;
    function MoveDown(&unit: TextRangeUnit; count: Integer; extend: Boolean): Integer; safecall;
    function MoveLeft(&unit: TextRangeUnit; count: Integer; extend: Boolean): Integer; safecall;
    function MoveRight(&unit: TextRangeUnit; count: Integer; extend: Boolean): Integer; safecall;
    function MoveUp(&unit: TextRangeUnit; count: Integer; extend: Boolean): Integer; safecall;
    procedure TypeText(value: HSTRING); safecall;
    property Options: SelectionOptions read get_Options write put_Options;
    property &Type: SelectionType read get_Type;
  end;

  // UsedAPI Interface
  // Microsoft.UI.Text.ITextDocument
  ITextDocument = interface(IInspectable)
  ['{1149D57D-86A6-59DD-88D9-196F27BC5C85}']
    function get_CaretType: CaretType; safecall;
    procedure put_CaretType(value: CaretType); safecall;
    function get_DefaultTabStop: Single; safecall;
    procedure put_DefaultTabStop(value: Single); safecall;
    function get_Selection: ITextSelection; safecall;
    function get_UndoLimit: Cardinal; safecall;
    procedure put_UndoLimit(value: Cardinal); safecall;
    function CanCopy: Boolean; safecall;
    function CanPaste: Boolean; safecall;
    function CanRedo: Boolean; safecall;
    function CanUndo: Boolean; safecall;
    function ApplyDisplayUpdates: Integer; safecall;
    function BatchDisplayUpdates: Integer; safecall;
    procedure BeginUndoGroup; safecall;
    procedure EndUndoGroup; safecall;
    function GetDefaultCharacterFormat: ITextCharacterFormat; safecall;
    function GetDefaultParagraphFormat: ITextParagraphFormat; safecall;
    function GetRange(startPosition: Integer; endPosition: Integer): ITextRange; safecall;
    function GetRangeFromPoint(point: TPointF; options: PointOptions): ITextRange; safecall;
    procedure GetText(options: TextGetOptions; out value: HSTRING); safecall;
    procedure LoadFromStream(options: TextSetOptions; value: IRandomAccessStream); safecall;
    procedure Redo; safecall;
    procedure SaveToStream(options: TextGetOptions; value: IRandomAccessStream); safecall;
    procedure SetDefaultCharacterFormat(value: ITextCharacterFormat); safecall;
    procedure SetDefaultParagraphFormat(value: ITextParagraphFormat); safecall;
    procedure SetText(options: TextSetOptions; value: HSTRING); safecall;
    procedure Undo; safecall;
    function get_AlignmentIncludesTrailingWhitespace: Boolean; safecall;
    procedure put_AlignmentIncludesTrailingWhitespace(value: Boolean); safecall;
    function get_IgnoreTrailingCharacterSpacing: Boolean; safecall;
    procedure put_IgnoreTrailingCharacterSpacing(value: Boolean); safecall;
    procedure ClearUndoRedoHistory; safecall;
    property AlignmentIncludesTrailingWhitespace: Boolean read get_AlignmentIncludesTrailingWhitespace write put_AlignmentIncludesTrailingWhitespace;
    property CaretType_: CaretType read get_CaretType write put_CaretType;
    property DefaultTabStop: Single read get_DefaultTabStop write put_DefaultTabStop;
    property IgnoreTrailingCharacterSpacing: Boolean read get_IgnoreTrailingCharacterSpacing write put_IgnoreTrailingCharacterSpacing;
    property Selection: ITextSelection read get_Selection;
    property UndoLimit: Cardinal read get_UndoLimit write put_UndoLimit;
  end;

implementation

end.
