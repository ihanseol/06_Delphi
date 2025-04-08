{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.UITypes;

interface

const
  { Logical Font }
  {$EXTERNALSYM LF_FACESIZE}
  LF_FACESIZE = 32;

{$SCOPEDENUMS ON}

type

{ TOpenDialog }
  TOpenOption = (ofReadOnly, ofOverwritePrompt, ofHideReadOnly,
    ofNoChangeDir, ofShowHelp, ofNoValidate, ofAllowMultiSelect,
    ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofCreatePrompt,
    ofShareAware, ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton,
    ofNoLongNames, ofOldStyleDialog, ofNoDereferenceLinks, ofEnableIncludeNotify,
    ofEnableSizing, ofDontAddToRecent, ofForceShowHidden);
  TOpenOptions = set of TOpenOption;

  TOpenOptionEx = (ofExNoPlacesBar);
  TOpenOptionsEx = set of TOpenOptionEx;

  TDialogType = (Standard, Directory);

{ TPrintDialog }
  TPrintRange = (prAllPages, prSelection, prPageNums);
  TPrintDialogOption = (poPrintToFile, poPageNums, poSelection, poWarning,
    poHelp, poDisablePrintToFile);
  TPrintDialogOptions = set of TPrintDialogOption;

  TPageSetupDialogOption = (psoDefaultMinMargins, psoDisableMargins,
    psoDisableOrientation, psoDisablePagePainting, psoDisablePaper, psoDisablePrinter,
    psoMargins, psoMinMargins, psoShowHelp, psoWarning, psoNoNetworkButton);
  TPageSetupDialogOptions = set of TPageSetupDialogOption;
  TPrinterKind = (pkDotMatrix, pkHPPCL);
  TPageType = (ptEnvelope, ptPaper);
  TPageMeasureUnits = (pmDefault, pmMillimeters, pmInches);

{ Message dialog }
  TMsgDlgType = (mtWarning, mtError, mtInformation, mtConfirmation, mtCustom);
  TMsgDlgBtn = (mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore,
    mbAll, mbNoToAll, mbYesToAll, mbHelp, mbClose);
  TMsgDlgButtons = set of TMsgDlgBtn;
  TMsgDlgIcon = (mdiNone, mdiWarning, mdiError, mdiInformation, mdiShield);

{ Calendar common control support }
  TCalDayOfWeek = (dowMonday, dowTuesday, dowWednesday, dowThursday,
    dowFriday, dowSaturday, dowSunday, dowLocaleDefault);

{ TCustomForm }
  TBorderIcon = (biSystemMenu, biMinimize, biMaximize, biHelp);
  TBorderIcons = set of TBorderIcon;

{ TScrollingWinControl }
  TWindowState = (wsNormal, wsMinimized, wsMaximized);

{ Editors common support }
  TEditCharCase = (ecNormal, ecUpperCase, ecLowerCase);

{ TFont }
  TFontCharset = 0..255;
  TFontPitch = (fpDefault, fpVariable, fpFixed);
  TFontQuality = (fqDefault, fqDraft, fqProof, fqNonAntialiased, fqAntialiased,
    fqClearType, fqClearTypeNatural);

  { Changes to the following types should be reflected in the $HPPEMIT directives. }
  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
{$IF NOT DEFINED(CLR)}
  {$NODEFINE TFontStyle}
{$ENDIF}
  TFontStyles = set of TFontStyle;
  TFontName = type string;
{$IF DEFINED(CLR)}
  TFontDataName = string;
{$ELSE}
{$IFNDEF NEXTGEN}
  TFontDataName = string[(LF_FACESIZE - 1) * 4];
  {$NODEFINE TFontDataName}
  TFontStylesBase = set of TFontStyle;
  {$NODEFINE TFontStylesBase}

  (*$HPPEMIT OPENNAMESPACE *)
  (*$HPPEMIT '  enum DECLSPEC_DENUM TFontStyle : unsigned char { fsBold, fsItalic, fsUnderline, fsStrikeOut };'*)
  (*$HPPEMIT '  typedef System::SmallStringBase<124> TFontDataName;'*)
  (*$HPPEMIT '  typedef System::SetBase<TFontStyle, fsBold, fsStrikeOut> TFontStylesBase;'*)
  (*$HPPEMIT CLOSENAMESPACE *)
{$ELSE}
  (*$HPPEMIT OPENNAMESPACE *)
  (*$HPPEMIT '  enum DECLSPEC_DENUM TFontStyle : unsigned char { fsBold, fsItalic, fsUnderline, fsStrikeOut };'*)
  (*$HPPEMIT '  typedef System::String TFontDataName;'*)
  (*$HPPEMIT '  typedef System::SetBase<TFontStyle, fsBold, fsStrikeOut> TFontStylesBase;'*)
  (*$HPPEMIT CLOSENAMESPACE *)
{$ENDIF}
{$ENDIF}


  TCloseAction = (caNone, caHide, caFree, caMinimize);
  TMouseButton = (mbLeft, mbRight, mbMiddle);
  TMouseActivate = (maDefault, maActivate, maActivateAndEat, maNoActivate, maNoActivateAndEat);
  TTabOrder = -1 .. 32767;
  TModalResult = Low(Integer) .. High(Integer);
  TDragMode = (dmManual, dmAutomatic);
  TDragState = (dsDragEnter, dsDragLeave, dsDragMove);
  TDragKind = (dkDrag, dkDock);

  TAnchorKind = (akLeft, akTop, akRight, akBottom);
  TAnchors = set of TAnchorKind;

  TScrollCode = (scLineUp, scLineDown, scPageUp, scPageDown, scPosition,
    scTrack, scTop, scBottom, scEndScroll);

  TPrinterState = (psNoHandle, psHandleIC, psHandleDC);
  TPrinterOrientation = (poPortrait, poLandscape);
  TPrinterCapability = (pcCopies, pcOrientation, pcCollation);
  TPrinterCapabilities = set of TPrinterCapability;

  TCursor = -32768..32767;
{$IF NOT DEFINED(CLR)}
  {$NODEFINE TCursor}
  {$OBJTYPENAME TCursor 'NTCursor'}

  (*$HPPEMIT OPENNAMESPACE*)
  (*$HPPEMIT '  enum DECLSPEC_DENUM TCursor : short {crMin=-32768, crMax=32767};'}*)
  (*$HPPEMIT CLOSENAMESPACE*)
{$ENDIF}

const
  crDefault     = TCursor(0);
  crNone        = TCursor(-1);
  crArrow       = TCursor(-2);
  crCross       = TCursor(-3);
  crIBeam       = TCursor(-4);
  crSize        = TCursor(-22);
  crSizeNESW    = TCursor(-6);
  crSizeNS      = TCursor(-7);
  crSizeNWSE    = TCursor(-8);
  crSizeWE      = TCursor(-9);
  crUpArrow     = TCursor(-10);
  crHourGlass   = TCursor(-11);
  crDrag        = TCursor(-12);
  crNoDrop      = TCursor(-13);
  crHSplit      = TCursor(-14);
  crVSplit      = TCursor(-15);
  crMultiDrag   = TCursor(-16);
  crSQLWait     = TCursor(-17);
  crNo          = TCursor(-18);
  crAppStart    = TCursor(-19);
  crHelp        = TCursor(-20);
  crHandPoint   = TCursor(-21);
  crSizeAll     = TCursor(-22);

const
  idOK       = 1;
  idCancel   = 2;
  idAbort    = 3;
  idRetry    = 4;
  idIgnore   = 5;
  idYes      = 6;
  idNo       = 7;
  idClose    = 8;
  idHelp     = 9;
  idTryAgain = 10;
  idContinue = 11;
  mrNone     = 0;
  mrOk       = idOk;
  mrCancel   = idCancel;
  mrAbort    = idAbort;
  mrRetry    = idRetry;
  mrIgnore   = idIgnore;
  mrYes      = idYes;
  mrNo       = idNo;
  mrClose    = idClose;
  mrHelp     = idHelp;
  mrTryAgain = idTryAgain;
  mrContinue = idContinue;
  mrAll      = mrContinue + 1;
  mrNoToAll  = mrAll + 1;
  mrYesToAll = mrNoToAll + 1;

function IsPositiveResult(const AModalResult: TModalResult): Boolean;
function IsNegativeResult(const AModalResult: TModalResult): Boolean;
function IsAbortResult(const AModalResult: TModalResult): Boolean;
function IsAnAllResult(const AModalResult: TModalResult): Boolean;
function StripAllFromResult(const AModalResult: TModalResult): TModalResult;

const
  { Virtual Keys, Standard Set }
  vkLButton          = $01;  {   1 }
  vkRButton          = $02;  {   2 }
  vkCancel           = $03;  {   3 }
  vkMButton          = $04;  {   4 }
  vkXButton1         = $05;  {   5 }
  vkXButton2         = $06;  {   6 }
  vkBack             = $08;  {   8 }
  vkTab              = $09;  {   9 }
  vkLineFeed         = $0A;  {  10 }
  vkClear            = $0C;  {  12 }
  vkReturn           = $0D;  {  13 }
  vkShift            = $10;  {  16 }
  vkControl          = $11;  {  17 }
  vkMenu             = $12;  {  18 }
  vkPause            = $13;  {  19 }
  vkCapital          = $14;  {  20 }
  vkKana             = $15;  {  21 }
  vkHangul           = $15;  {  21 }
  vkJunja            = $17;  {  23 }
  vkFinal            = $18;  {  24 }
  vkHanja            = $19;  {  25 }
  vkKanji            = $19;  {  25 }
  vkConvert          = $1C;  {  28 }
  vkNonConvert       = $1D;  {  29 }
  vkAccept           = $1E;  {  30 }
  vkModeChange       = $1F;  {  31 }
  vkEscape           = $1B;  {  27 }
  vkSpace            = $20;  {  32 }
  vkPrior            = $21;  {  33 }
  vkNext             = $22;  {  34 }
  vkEnd              = $23;  {  35 }
  vkHome             = $24;  {  36 }
  vkLeft             = $25;  {  37 }
  vkUp               = $26;  {  38 }
  vkRight            = $27;  {  39 }
  vkDown             = $28;  {  40 }
  vkSelect           = $29;  {  41 }
  vkPrint            = $2A;  {  42 }
  vkExecute          = $2B;  {  43 }
  vkSnapshot         = $2C;  {  44 }
  vkInsert           = $2D;  {  45 }
  vkDelete           = $2E;  {  46 }
  vkHelp             = $2F;  {  47 }
  { vk0 thru vk9 are the same as ASCII '0' thru '9' ($30 - $39) }
  vk0                = $30;  {  48 }
  vk1                = $31;  {  49 }
  vk2                = $32;  {  50 }
  vk3                = $33;  {  51 }
  vk4                = $34;  {  52 }
  vk5                = $35;  {  53 }
  vk6                = $36;  {  54 }
  vk7                = $37;  {  55 }
  vk8                = $38;  {  56 }
  vk9                = $39;  {  57 }
  vkLCommand         = $3D;  {  61 }
  vkRCommand         = $3E;  {  62 }
  vkFunction         = $3F;  {  63 }
  { vkA thru vkZ are the same as ASCII 'A' thru 'Z' ($41 - $5A) }
  vkA                = $41;  {  65 }
  vkB                = $42;  {  66 }
  vkC                = $43;  {  67 }
  vkD                = $44;  {  68 }
  vkE                = $45;  {  69 }
  vkF                = $46;  {  70 }
  vkG                = $47;  {  71 }
  vkH                = $48;  {  72 }
  vkI                = $49;  {  73 }
  vkJ                = $4A;  {  74 }
  vkK                = $4B;  {  75 }
  vkL                = $4C;  {  76 }
  vkM                = $4D;  {  77 }
  vkN                = $4E;  {  78 }
  vkO                = $4F;  {  79 }
  vkP                = $50;  {  80 }
  vkQ                = $51;  {  81 }
  vkR                = $52;  {  82 }
  vkS                = $53;  {  83 }
  vkT                = $54;  {  84 }
  vkU                = $55;  {  85 }
  vkV                = $56;  {  86 }
  vkW                = $57;  {  87 }
  vkX                = $58;  {  88 }
  vkY                = $59;  {  89 }
  vkZ                = $5A;  {  90 }
  vkLWin             = $5B;  {  91 }
  vkRWin             = $5C;  {  92 }
  vkApps             = $5D;  {  93 }
  vkSleep            = $5F;  {  95 }
  vkNumpad0          = $60;  {  96 }
  vkNumpad1          = $61;  {  97 }
  vkNumpad2          = $62;  {  98 }
  vkNumpad3          = $63;  {  99 }
  vkNumpad4          = $64;  { 100 }
  vkNumpad5          = $65;  { 101 }
  vkNumpad6          = $66;  { 102 }
  vkNumpad7          = $67;  { 103 }
  vkNumpad8          = $68;  { 104 }
  vkNumpad9          = $69;  { 105 }
  vkMultiply         = $6A;  { 106 }
  vkAdd              = $6B;  { 107 }
  vkSeparator        = $6C;  { 108 }
  vkSubtract         = $6D;  { 109 }
  vkDecimal          = $6E;  { 110 }
  vkDivide           = $6F;  { 111 }
  vkF1               = $70;  { 112 }
  vkF2               = $71;  { 113 }
  vkF3               = $72;  { 114 }
  vkF4               = $73;  { 115 }
  vkF5               = $74;  { 116 }
  vkF6               = $75;  { 117 }
  vkF7               = $76;  { 118 }
  vkF8               = $77;  { 119 }
  vkF9               = $78;  { 120 }
  vkF10              = $79;  { 121 }
  vkF11              = $7A;  { 122 }
  vkF12              = $7B;  { 123 }
  vkF13              = $7C;  { 124 }
  vkF14              = $7D;  { 125 }
  vkF15              = $7E;  { 126 }
  vkF16              = $7F;  { 127 }
  vkF17              = $80;  { 128 }
  vkF18              = $81;  { 129 }
  vkF19              = $82;  { 130 }
  vkF20              = $83;  { 131 }
  vkF21              = $84;  { 132 }
  vkF22              = $85;  { 133 }
  vkF23              = $86;  { 134 }
  vkF24              = $87;  { 135 }

  vkCamera           = $88;  { 136 }
  vkHardwareBack     = $89;  { 137 }

  vkNumLock          = $90;  { 144 }
  vkScroll           = $91;  { 145 }
  vkLShift           = $A0;  { 160 }
  vkRShift           = $A1;  { 161 }
  vkLControl         = $A2;  { 162 }
  vkRControl         = $A3;  { 163 }
  vkLMenu            = $A4;  { 164 }
  vkRMenu            = $A5;  { 165 }

  vkBrowserBack      = $A6;  { 166 }
  vkBrowserForward   = $A7;  { 167 }
  vkBrowserRefresh   = $A8;  { 168 }
  vkBrowserStop      = $A9;  { 169 }
  vkBrowserSearch    = $AA;  { 170 }
  vkBrowserFavorites = $AB;  { 171 }
  vkBrowserHome      = $AC;  { 172 }
  vkVolumeMute       = $AD;  { 173 }
  vkVolumeDown       = $AE;  { 174 }
  vkVolumeUp         = $AF;  { 175 }
  vkMediaNextTrack   = $B0;  { 176 }
  vkMediaPrevTrack   = $B1;  { 177 }
  vkMediaStop        = $B2;  { 178 }
  vkMediaPlayPause   = $B3;  { 179 }
  vkLaunchMail       = $B4;  { 180 }
  vkLaunchMediaSelect= $B5;  { 181 }
  vkLaunchApp1       = $B6;  { 182 }
  vkLaunchApp2       = $B7;  { 183 }

  vkSemicolon        = $BA;  { 186 }
  vkEqual            = $BB;  { 187 }
  vkComma            = $BC;  { 188 }
  vkMinus            = $BD;  { 189 }
  vkPeriod           = $BE;  { 190 }
  vkSlash            = $BF;  { 191 }
  vkTilde            = $C0;  { 192 }
  vkLeftBracket      = $DB;  { 219 }
  vkBackslash        = $DC;  { 220 }
  vkRightBracket     = $DD;  { 221 }
  vkQuote            = $DE;  { 222 }
  vkPara             = $DF;  { 223 }

  vkOem102           = $E2;  { 226 }
  vkIcoHelp          = $E3;  { 227 }
  vkIco00            = $E4;  { 228 }
  vkProcessKey       = $E5;  { 229 }
  vkIcoClear         = $E6;  { 230 }
  vkPacket           = $E7;  { 231 }
  vkAttn             = $F6;  { 246 }
  vkCrsel            = $F7;  { 247 }
  vkExsel            = $F8;  { 248 }
  vkErEof            = $F9;  { 249 }
  vkPlay             = $FA;  { 250 }
  vkZoom             = $FB;  { 251 }
  vkNoname           = $FC;  { 252 }
  vkPA1              = $FD;  { 253 }
  vkOemClear         = $FE;  { 254 }
  vkNone             = $FF;  { 255 }

const
  // Standard gesture id's
  sgiNoGesture       = 0;
  sgiLeft            = 1;
  sgiRight           = 2;
  sgiUp              = 3;
  sgiDown            = 4;
  sgiUpLeft          = 5;
  sgiUpRight         = 6;
  sgiDownLeft        = 7;
  sgiDownRight       = 8;
  sgiLeftUp          = 9;
  sgiLeftDown        = 10;
  sgiRightUp         = 11;
  sgiRightDown       = 12;
  sgiUpDown          = 13;
  sgiDownUp          = 14;
  sgiLeftRight       = 15;
  sgiRightLeft       = 16;
  sgiUpLeftLong      = 17;
  sgiUpRightLong     = 18;
  sgiDownLeftLong    = 19;
  sgiDownRightLong   = 20;
  sgiScratchout      = 21;
  sgiTriangle        = 22;
  sgiSquare          = 23;
  sgiCheck           = 24;
  sgiCurlicue        = 25;
  sgiDoubleCurlicue  = 26;
  sgiCircle          = 27;
  sgiDoubleCircle    = 28;
  sgiSemiCircleLeft  = 29;
  sgiSemiCircleRight = 30;
  sgiChevronUp       = 31;
  sgiChevronDown     = 32;
  sgiChevronLeft     = 33;
  sgiChevronRight    = 34;
  sgiFirst           = sgiLeft;
  sgiLast            = sgiChevronRight;

  // Recorded custom gestures ID range
  cgiFirst = -512;
  cgiLast  = -1;

  // Registered custom gestures ID range
  rgiFirst = -1024;
  rgiLast  = -513;

  igiFirst = 256;
  igiLast  = 511;

const
  // Interactive gesture id's (maps to Windows 7's WM_GESTURE)
  igiBegin = 1 + igiFirst;
  igiEnd = 2 + igiFirst;
  igiZoom = 3 + igiFirst;
  igiPan = 4 + igiFirst;
  igiRotate = 5 + igiFirst;
  igiTwoFingerTap = 6 + igiFirst;
  igiPressAndTap = 7 + igiFirst;
  // Extra interactive gestures
  igiLongTap = 8 + igiFirst;
  igiDoubleTap = 9 + igiFirst;

{ Graphics Objects }

type
  TColorRef = UInt32;

  PColor = ^TColor;
  TColor = -$7FFFFFFF-1..$7FFFFFFF;

{$IF NOT DEFINED(CLR)}
  {$NODEFINE TColor}
  {$OBJTYPENAME TColor 'NTColor'}

  (*$HPPEMIT OPENNAMESPACE*)
  (*$HPPEMIT '  enum DECLSPEC_DENUM TColor : int {clMin=-0x7fffffff-1, clMax=0x7fffffff};'*)
  (*$HPPEMIT CLOSENAMESPACE*)
{$ENDIF}

  PColorRec = ^TColorRec;
  TColorRec = record
  const
    SystemColor = $FF000000;
    // System Colors (Windows only)
    cSCROLLBAR = 0;
    cBACKGROUND = 1;
    cACTIVECAPTION = 2;
    cINACTIVECAPTION = 3;
    cMENU = 4;
    cWINDOW = 5;
    cWINDOWFRAME = 6;
    cMENUTEXT = 7;
    cWINDOWTEXT = 8;
    cCAPTIONTEXT = 9;
    cACTIVEBORDER = 10;
    cINACTIVEBORDER = 11;
    cAPPWORKSPACE = 12;
    cHIGHLIGHT = 13;
    cHIGHLIGHTTEXT = 14;
    cBTNFACE = 15;
    cBTNSHADOW = $10;
    cGRAYTEXT = 17;
    cBTNTEXT = 18;
    cINACTIVECAPTIONTEXT = 19;
    cBTNHIGHLIGHT = 20;
    c3DDKSHADOW = 21;
    c3DLIGHT = 22;
    cINFOTEXT = 23;
    cINFOBK = 24;
    cHOTLIGHT = 26;
    cGRADIENTACTIVECAPTION = 27;
    cGRADIENTINACTIVECAPTION = 28;
    cMENUHILIGHT = 29;
    cMENUBAR = 30;
    cENDCOLORS = cMENUBAR;
    cDESKTOP = cBACKGROUND;
    c3DFACE = cBTNFACE;
    c3DSHADOW = cBTNSHADOW;
    c3DHIGHLIGHT = cBTNHIGHLIGHT;
    c3DHILIGHT = cBTNHIGHLIGHT;
    cBTNHILIGHT = cBTNHIGHLIGHT;
    SysScrollBar = TColor(SystemColor or cSCROLLBAR);
    SysBackground = TColor(SystemColor or cBACKGROUND);
    SysActiveCaption = TColor(SystemColor or cACTIVECAPTION);
    SysInactiveCaption = TColor(SystemColor or cINACTIVECAPTION);
    SysMenu = TColor(SystemColor or cMENU);
    SysWindow = TColor(SystemColor or cWINDOW);
    SysWindowFrame = TColor(SystemColor or cWINDOWFRAME);
    SysMenuText = TColor(SystemColor or cMENUTEXT);
    SysWindowText = TColor(SystemColor or cWINDOWTEXT);
    SysCaptionText = TColor(SystemColor or cCAPTIONTEXT);
    SysActiveBorder = TColor(SystemColor or cACTIVEBORDER);
    SysInactiveBorder = TColor(SystemColor or cINACTIVEBORDER);
    SysAppWorkSpace = TColor(SystemColor or cAPPWORKSPACE);
    SysHighlight = TColor(SystemColor or cHIGHLIGHT);
    SysHighlightText = TColor(SystemColor or cHIGHLIGHTTEXT);
    SysBtnFace = TColor(SystemColor or cBTNFACE);
    SysBtnShadow = TColor(SystemColor or cBTNSHADOW);
    SysGrayText = TColor(SystemColor or cGRAYTEXT);
    SysBtnText = TColor(SystemColor or cBTNTEXT);
    SysInactiveCaptionText = TColor(SystemColor or cINACTIVECAPTIONTEXT);
    SysBtnHighlight = TColor(SystemColor or cBTNHIGHLIGHT);
    Sys3DDkShadow = TColor(SystemColor or c3DDKSHADOW);
    Sys3DLight = TColor(SystemColor or c3DLIGHT);
    SysInfoText = TColor(SystemColor or cINFOTEXT);
    SysInfoBk = TColor(SystemColor or cINFOBK);
    SysHotLight = TColor(SystemColor or cHOTLIGHT);
    SysGradientActiveCaption = TColor(SystemColor or cGRADIENTACTIVECAPTION);
    SysGradientInactiveCaption = TColor(SystemColor or cGRADIENTINACTIVECAPTION);
    SysMenuHighlight = TColor(SystemColor or cMENUHILIGHT);
    SysMenuBar = TColor(SystemColor or cMENUBAR);
    SysNone = TColor($1FFFFFFF);
    SysDefault = TColor($20000000);
    // Actual colors
    Aliceblue = TColor($FFF8F0);
    Antiquewhite = TColor($D7EBFA);
    Aqua = TColor($FFFF00);
    Aquamarine = TColor($D4FF7F);
    Azure = TColor($FFFFF0);
    Beige = TColor($DCF5F5);
    Bisque = TColor($C4E4FF);
    Black = TColor($000000);
    Blanchedalmond = TColor($CDEBFF);
    Blue = TColor($FF0000);
    Blueviolet = TColor($E22B8A);
    Brown = TColor($2A2AA5);
    Burlywood = TColor($87B8DE);
    Cadetblue = TColor($A09E5F);
    Chartreuse = TColor($00FF7F);
    Chocolate = TColor($1E69D2);
    Coral = TColor($507FFF);
    Cornflowerblue = TColor($ED9564);
    Cornsilk = TColor($DCF8FF);
    Crimson = TColor($3C14DC);
    Cyan = TColor($FFFF00);
    Darkblue = TColor($8B0000);
    Darkcyan = TColor($8B8B00);
    Darkgoldenrod = TColor($0B86B8);
    Darkgray = TColor($A9A9A9);
    Darkgreen = TColor($006400);
    Darkgrey = TColor($A9A9A9);
    Darkkhaki = TColor($6BB7BD);
    Darkmagenta = TColor($8B008B);
    Darkolivegreen = TColor($2F6B55);
    Darkorange = TColor($008CFF);
    Darkorchid = TColor($CC3299);
    Darkred = TColor($00008B);
    Darksalmon = TColor($7A96E9);
    Darkseagreen = TColor($8FBC8F);
    Darkslateblue = TColor($8B3D48);
    Darkslategray = TColor($4F4F2F);
    Darkslategrey = TColor($4F4F2F);
    Darkturquoise = TColor($D1CE00);
    Darkviolet = TColor($D30094);
    Deeppink = TColor($9314FF);
    Deepskyblue = TColor($FFBF00);
    Dimgray = TColor($696969);
    Dimgrey = TColor($696969);
    Dodgerblue = TColor($FF901E);
    Firebrick = TColor($2222B2);
    Floralwhite = TColor($F0FAFF);
    Forestgreen = TColor($228B22);
    Fuchsia = TColor($FF00FF);
    Gainsboro = TColor($DCDCDC);
    Ghostwhite = TColor($FFF8F8);
    Gold = TColor($00D7FF);
    Goldenrod = TColor($20A5DA);
    Gray = TColor($808080);
    Green = TColor($008000);
    Greenyellow = TColor($2FFFAD);
    Grey = TColor($808080);
    Honeydew = TColor($F0FFF0);
    Hotpink = TColor($B469FF);
    Indianred = TColor($5C5CCD);
    Indigo = TColor($82004B);
    Ivory = TColor($F0FFFF);
    Khaki = TColor($8CE6F0);
    Lavender = TColor($FAE6E6);
    Lavenderblush = TColor($F5F0FF);
    Lawngreen = TColor($00FC7C);
    Lemonchiffon = TColor($CDFAFF);
    Lightblue = TColor($E6D8AD);
    Lightcoral = TColor($8080F0);
    Lightcyan = TColor($FFFFE0);
    Lightgoldenrodyellow = TColor($D2FAFA);
    Lightgray = TColor($D3D3D3);
    Lightgreen = TColor($90EE90);
    Lightgrey = TColor($D3D3D3);
    Lightpink = TColor($C1B6FF);
    Lightsalmon = TColor($7AA0FF);
    Lightseagreen = TColor($AAB220);
    Lightskyblue = TColor($FACE87);
    Lightslategray = TColor($998877);
    Lightslategrey = TColor($998877);
    Lightsteelblue = TColor($DEC4B0);
    Lightyellow = TColor($E0FFFF);
    LtGray = TColor($C0C0C0);
    MedGray = TColor($A4A0A0);
    DkGray = TColor($808080);
    MoneyGreen = TColor($C0DCC0);
    LegacySkyBlue = TColor($F0CAA6);
    Cream = TColor($F0FBFF);
    Lime = TColor($00FF00);
    Limegreen = TColor($32CD32);
    Linen = TColor($E6F0FA);
    Magenta = TColor($FF00FF);
    Maroon = TColor($000080);
    Mediumaquamarine = TColor($AACD66);
    Mediumblue = TColor($CD0000);
    Mediumorchid = TColor($D355BA);
    Mediumpurple = TColor($DB7093);
    Mediumseagreen = TColor($71B33C);
    Mediumslateblue = TColor($EE687B);
    Mediumspringgreen = TColor($9AFA00);
    Mediumturquoise = TColor($CCD148);
    Mediumvioletred = TColor($8515C7);
    Midnightblue = TColor($701919);
    Mintcream = TColor($FAFFF5);
    Mistyrose = TColor($E1E4FF);
    Moccasin = TColor($B5E4FF);
    Navajowhite = TColor($ADDEFF);
    Navy = TColor($800000);
    Oldlace = TColor($E6F5FD);
    Olive = TColor($008080);
    Olivedrab = TColor($238E6B);
    Orange = TColor($00A5FF);
    Orangered = TColor($0045FF);
    Orchid = TColor($D670DA);
    Palegoldenrod = TColor($AAE8EE);
    Palegreen = TColor($98FB98);
    Paleturquoise = TColor($EEEEAF);
    Palevioletred = TColor($9370DB);
    Papayawhip = TColor($D5EFFF);
    Peachpuff = TColor($B9DAFF);
    Peru = TColor($3F85CD);
    Pink = TColor($CBC0FF);
    Plum = TColor($DDA0DD);
    Powderblue = TColor($E6E0B0);
    Purple = TColor($800080);
    Red = TColor($0000FF);
    Rosybrown = TColor($8F8FBC);
    Royalblue = TColor($E16941);
    Saddlebrown = TColor($13458B);
    Salmon = TColor($7280FA);
    Sandybrown = TColor($60A4F4);
    Seagreen = TColor($578B2E);
    Seashell = TColor($EEF5FF);
    Sienna = TColor($2D52A0);
    Silver = TColor($C0C0C0);
    Skyblue = TColor($EBCE87);
    Slateblue = TColor($CD5A6A);
    Slategray = TColor($908070);
    Slategrey = TColor($908070);
    Snow = TColor($FAFAFF);
    Springgreen = TColor($7FFF00);
    Steelblue = TColor($B48246);
    Tan = TColor($8CB4D2);
    Teal = TColor($808000);
    Thistle = TColor($D8BFD8);
    Tomato = TColor($4763FF);
    Turquoise = TColor($D0E040);
    Violet = TColor($EE82EE);
    Wheat = TColor($B3DEF5);
    White = TColor($FFFFFF);
    Whitesmoke = TColor($F5F5F5);
    Yellow = TColor($00FFFF);
    Yellowgreen = TColor($32CD9A);
    Null = TColor($00000000);
    class var ColorToRGB: function (Color: TColor): Longint;
{    class operator Implicit(const C: TColor): TColorRec; inline;
    class operator Implicit(const C: TColorRec): TColor; inline;
    class operator Implicit(const C: TColorRec): Longint; inline;
    class operator Explicit(const C: TColorRec): Longint; inline;}
    case Cardinal of
      0:
        (Color: TColor);
      2:
        (HiWord, LoWord: Word);
      3:
{$IFDEF BIGENDIAN}
        (A, B, G, R: System.Byte);
{$ELSE}
        (R, G, B, A: System.Byte);
{$ENDIF}
  end;

  TColors = TColorRec;

  PAlphaColor = ^TAlphaColor;
  TAlphaColor = type Cardinal;

{$IF defined(IOS) or defined(ANDROID) or defined(LINUX) }

(*$HPPEMIT END '#include <SystemUITypes.h> ' *)

{$ENDIF}

  PAlphaColorRec = ^TAlphaColorRec;
  TAlphaColorRec = record
  const
    Alpha = TAlphaColor($FF000000);
    Aliceblue = TAlphaColor(Alpha or $F0F8FF);
    Antiquewhite = TAlphaColor(Alpha or $FAEBD7);
    Aqua = TAlphaColor(Alpha or $00FFFF);
    Aquamarine = TAlphaColor(Alpha or $7FFFD4);
    Azure = TAlphaColor(Alpha or $F0FFFF);
    Beige = TAlphaColor(Alpha or $F5F5DC);
    Bisque = TAlphaColor(Alpha or $FFE4C4);
    Black = TAlphaColor(Alpha or $000000);
    Blanchedalmond = TAlphaColor(Alpha or $FFEBCD);
    Blue = TAlphaColor(Alpha or $0000FF);
    Blueviolet = TAlphaColor(Alpha or $8A2BE2);
    Brown = TAlphaColor(Alpha or $A52A2A);
    Burlywood = TAlphaColor(Alpha or $DEB887);
    Cadetblue = TAlphaColor(Alpha or $5F9EA0);
    Chartreuse = TAlphaColor(Alpha or $7FFF00);
    Chocolate = TAlphaColor(Alpha or $D2691E);
    Coral = TAlphaColor(Alpha or $FF7F50);
    Cornflowerblue = TAlphaColor(Alpha or $6495ED);
    Cornsilk = TAlphaColor(Alpha or $FFF8DC);
    Crimson = TAlphaColor(Alpha or $DC143C);
    Cyan = TAlphaColor(Alpha or $00FFFF);
    Darkblue = TAlphaColor(Alpha or $00008B);
    Darkcyan = TAlphaColor(Alpha or $008B8B);
    Darkgoldenrod = TAlphaColor(Alpha or $B8860B);
    Darkgray = TAlphaColor(Alpha or $A9A9A9);
    Darkgreen = TAlphaColor(Alpha or $006400);
    Darkgrey = TAlphaColor(Alpha or $A9A9A9);
    Darkkhaki = TAlphaColor(Alpha or $BDB76B);
    Darkmagenta = TAlphaColor(Alpha or $8B008B);
    Darkolivegreen = TAlphaColor(Alpha or $556B2F);
    Darkorange = TAlphaColor(Alpha or $FF8C00);
    Darkorchid = TAlphaColor(Alpha or $9932CC);
    Darkred = TAlphaColor(Alpha or $8B0000);
    Darksalmon = TAlphaColor(Alpha or $E9967A);
    Darkseagreen = TAlphaColor(Alpha or $8FBC8F);
    Darkslateblue = TAlphaColor(Alpha or $483D8B);
    Darkslategray = TAlphaColor(Alpha or $2F4F4F);
    Darkslategrey = TAlphaColor(Alpha or $2F4F4F);
    Darkturquoise = TAlphaColor(Alpha or $00CED1);
    Darkviolet = TAlphaColor(Alpha or $9400D3);
    Deeppink = TAlphaColor(Alpha or $FF1493);
    Deepskyblue = TAlphaColor(Alpha or $00BFFF);
    Dimgray = TAlphaColor(Alpha or $696969);
    Dimgrey = TAlphaColor(Alpha or $696969);
    Dodgerblue = TAlphaColor(Alpha or $1E90FF);
    Firebrick = TAlphaColor(Alpha or $B22222);
    Floralwhite = TAlphaColor(Alpha or $FFFAF0);
    Forestgreen = TAlphaColor(Alpha or $228B22);
    Fuchsia = TAlphaColor(Alpha or $FF00FF);
    Gainsboro = TAlphaColor(Alpha or $DCDCDC);
    Ghostwhite = TAlphaColor(Alpha or $F8F8FF);
    Gold = TAlphaColor(Alpha or $FFD700);
    Goldenrod = TAlphaColor(Alpha or $DAA520);
    Gray = TAlphaColor(Alpha or $808080);
    Green = TAlphaColor(Alpha or $008000);
    Greenyellow = TAlphaColor(Alpha or $ADFF2F);
    Grey = TAlphaColor(Alpha or $808080);
    Honeydew = TAlphaColor(Alpha or $F0FFF0);
    Hotpink = TAlphaColor(Alpha or $FF69B4);
    Indianred = TAlphaColor(Alpha or $CD5C5C);
    Indigo = TAlphaColor(Alpha or $4B0082);
    Ivory = TAlphaColor(Alpha or $FFFFF0);
    Khaki = TAlphaColor(Alpha or $F0E68C);
    Lavender = TAlphaColor(Alpha or $E6E6FA);
    Lavenderblush = TAlphaColor(Alpha or $FFF0F5);
    Lawngreen = TAlphaColor(Alpha or $7CFC00);
    Lemonchiffon = TAlphaColor(Alpha or $FFFACD);
    Lightblue = TAlphaColor(Alpha or $ADD8E6);
    Lightcoral = TAlphaColor(Alpha or $F08080);
    Lightcyan = TAlphaColor(Alpha or $E0FFFF);
    Lightgoldenrodyellow = TAlphaColor(Alpha or $FAFAD2);
    Lightgray = TAlphaColor(Alpha or $D3D3D3);
    Lightgreen = TAlphaColor(Alpha or $90EE90);
    Lightgrey = TAlphaColor(Alpha or $D3D3D3);
    Lightpink = TAlphaColor(Alpha or $FFB6C1);
    Lightsalmon = TAlphaColor(Alpha or $FFA07A);
    Lightseagreen = TAlphaColor(Alpha or $20B2AA);
    Lightskyblue = TAlphaColor(Alpha or $87CEFA);
    Lightslategray = TAlphaColor(Alpha or $778899);
    Lightslategrey = TAlphaColor(Alpha or $778899);
    Lightsteelblue = TAlphaColor(Alpha or $B0C4DE);
    Lightyellow = TAlphaColor(Alpha or $FFFFE0);
    LtGray = TAlphaColor(Alpha or $C0C0C0);
    MedGray = TAlphaColor(Alpha or $A0A0A0);
    DkGray = TAlphaColor(Alpha or $808080);
    MoneyGreen = TAlphaColor(Alpha or $C0DCC0);
    LegacySkyBlue = TAlphaColor(Alpha or $F0CAA6);
    Cream = TAlphaColor(Alpha or $F0FBFF);
    Lime = TAlphaColor(Alpha or $00FF00);
    Limegreen = TAlphaColor(Alpha or $32CD32);
    Linen = TAlphaColor(Alpha or $FAF0E6);
    Magenta = TAlphaColor(Alpha or $FF00FF);
    Maroon = TAlphaColor(Alpha or $800000);
    Mediumaquamarine = TAlphaColor(Alpha or $66CDAA);
    Mediumblue = TAlphaColor(Alpha or $0000CD);
    Mediumorchid = TAlphaColor(Alpha or $BA55D3);
    Mediumpurple = TAlphaColor(Alpha or $9370DB);
    Mediumseagreen = TAlphaColor(Alpha or $3CB371);
    Mediumslateblue = TAlphaColor(Alpha or $7B68EE);
    Mediumspringgreen = TAlphaColor(Alpha or $00FA9A);
    Mediumturquoise = TAlphaColor(Alpha or $48D1CC);
    Mediumvioletred = TAlphaColor(Alpha or $C71585);
    Midnightblue = TAlphaColor(Alpha or $191970);
    Mintcream = TAlphaColor(Alpha or $F5FFFA);
    Mistyrose = TAlphaColor(Alpha or $FFE4E1);
    Moccasin = TAlphaColor(Alpha or $FFE4B5);
    Navajowhite = TAlphaColor(Alpha or $FFDEAD);
    Navy = TAlphaColor(Alpha or $000080);
    Oldlace = TAlphaColor(Alpha or $FDF5E6);
    Olive = TAlphaColor(Alpha or $808000);
    Olivedrab = TAlphaColor(Alpha or $6B8E23);
    Orange = TAlphaColor(Alpha or $FFA500);
    Orangered = TAlphaColor(Alpha or $FF4500);
    Orchid = TAlphaColor(Alpha or $DA70D6);
    Palegoldenrod = TAlphaColor(Alpha or $EEE8AA);
    Palegreen = TAlphaColor(Alpha or $98FB98);
    Paleturquoise = TAlphaColor(Alpha or $AFEEEE);
    Palevioletred = TAlphaColor(Alpha or $DB7093);
    Papayawhip = TAlphaColor(Alpha or $FFEFD5);
    Peachpuff = TAlphaColor(Alpha or $FFDAB9);
    Peru = TAlphaColor(Alpha or $CD853F);
    Pink = TAlphaColor(Alpha or $FFC0CB);
    Plum = TAlphaColor(Alpha or $DDA0DD);
    Powderblue = TAlphaColor(Alpha or $B0E0E6);
    Purple = TAlphaColor(Alpha or $800080);
    Red = TAlphaColor(Alpha or $FF0000);
    Rosybrown = TAlphaColor(Alpha or $BC8F8F);
    Royalblue = TAlphaColor(Alpha or $4169E1);
    Saddlebrown = TAlphaColor(Alpha or $8B4513);
    Salmon = TAlphaColor(Alpha or $FA8072);
    Sandybrown = TAlphaColor(Alpha or $F4A460);
    Seagreen = TAlphaColor(Alpha or $2E8B57);
    Seashell = TAlphaColor(Alpha or $FFF5EE);
    Sienna = TAlphaColor(Alpha or $A0522D);
    Silver = TAlphaColor(Alpha or $C0C0C0);
    Skyblue = TAlphaColor(Alpha or $87CEEB);
    Slateblue = TAlphaColor(Alpha or $6A5ACD);
    Slategray = TAlphaColor(Alpha or $708090);
    Slategrey = TAlphaColor(Alpha or $708090);
    Snow = TAlphaColor(Alpha or $FFFAFA);
    Springgreen = TAlphaColor(Alpha or $00FF7F);
    Steelblue = TAlphaColor(Alpha or $4682B4);
    Tan = TAlphaColor(Alpha or $D2B48C);
    Teal = TAlphaColor(Alpha or $008080);
    Thistle = TAlphaColor(Alpha or $D8BFD8);
    Tomato = TAlphaColor(Alpha or $FF6347);
    Turquoise = TAlphaColor(Alpha or $40E0D0);
    Violet = TAlphaColor(Alpha or $EE82EE);
    Wheat = TAlphaColor(Alpha or $F5DEB3);
    White = TAlphaColor(Alpha or $FFFFFF);
    Whitesmoke = TAlphaColor(Alpha or $F5F5F5);
    Yellow = TAlphaColor(Alpha or $FFFF00);
    Yellowgreen = TAlphaColor(Alpha or $9ACD32);
    Null = TAlphaColor($00000000);
    constructor Create(const Color: TAlphaColor);
    class var ColorToRGB: function (Color: TAlphaColor): Longint;
    case Cardinal of
      0:
        (Color: TAlphaColor);
      2:
        (HiWord, LoWord: Word);
      3:
{$IFDEF BIGENDIAN}
        (A, R, G, B: System.Byte);
{$ELSE}
        (B, G, R, A: System.Byte);
{$ENDIF}
  end;

  TAlphaColors = TAlphaColorRec;

  PAlphaColorF = ^TAlphaColorF;
  TAlphaColorF = record
  public const
    Epsilon = 1.5259E-05; // 1 / 65535, minimal value for TPixelFormat.RGBA16 components
  private
    class function SameComponent(const Value1, Value2: Single): Boolean; static; inline;
    class function ClampComponent(const Value: Single): Single; static; inline;
  public
    R, G, B, A: Single;

    class function Create(const R, G, B: Single; const A: Single = 1): TAlphaColorF; overload; static; inline;
    class function Create(const Color: TAlphaColor): TAlphaColorF; overload; static; inline;

    class operator Add(const Color1, Color2: TAlphaColorF): TAlphaColorF;
    class operator Subtract(const Color1, Color2: TAlphaColorF): TAlphaColorF;
    class operator Equal(const Color1, Color2: TAlphaColorF): Boolean;
    class operator NotEqual(const Color1, Color2: TAlphaColorF): Boolean;
    class operator Negative(const Color: TAlphaColorF): TAlphaColorF;
    class operator Multiply(const Color1, Color2: TAlphaColorF): TAlphaColorF;
    class operator Multiply(const Color: TAlphaColorF; const Factor: Single): TAlphaColorF;
    class operator Multiply(const Factor: Single; const Color: TAlphaColorF): TAlphaColorF; inline;
    class operator Divide(const Color: TAlphaColorF; const Factor: Single): TAlphaColorF; inline;

    function PremultipliedAlpha: TAlphaColorF;
    function UnpremultipliedAlpha: TAlphaColorF;

    function Clamp: TAlphaColorF;
    function ToAlphaColor: TAlphaColor;
  end;

  {+ ! Moved here from Vcl.ImgList.pas !!}
  TImageIndex = type Integer;
  TImageName = type string;
  {+ ! Moved here from Vcl.StdCtrls.pas !!}
  TScrollStyle = (ssNone, ssHorizontal, ssVertical, ssBoth);

{$SCOPEDENUMS OFF}
  TTouchTrackingItem = (ttVertical, ttHorizontal);
  TTouchTracking = set of TTouchTrackingItem;
{$SCOPEDENUMS ON}

implementation

constructor TAlphaColorRec.Create(const Color: TAlphaColor);
begin
  Self := TAlphaColorRec(Color);
end;

class function TAlphaColorF.Create(const R, G, B, A: Single): TAlphaColorF;
begin
  Result.R := R;
  Result.G := G;
  Result.B := B;
  Result.A := A;
end;

class function TAlphaColorF.Create(const Color: TAlphaColor): TAlphaColorF;
begin
  Result.R := TAlphaColorRec(Color).R / 255;
  Result.G := TAlphaColorRec(Color).G / 255;
  Result.B := TAlphaColorRec(Color).B / 255;
  Result.A := TAlphaColorRec(Color).A / 255;
end;

class function TAlphaColorF.SameComponent(const Value1, Value2: Single): Boolean;
begin
  Result := Abs(Value1 - Value2) <= Epsilon;
end;

class function TAlphaColorF.ClampComponent(const Value: Single): Single;
begin
  if Value < 0 then
    Result := 0
  else if Value > 1 then
    Result := 1
  else
    Result := Value;
end;

class operator TAlphaColorF.Add(const Color1, Color2: TAlphaColorF): TAlphaColorF;
begin
  Result.R := Color1.R + Color2.R;
  Result.G := Color1.G + Color2.G;
  Result.B := Color1.B + Color2.B;
  Result.A := Color1.A + Color2.A;
end;

class operator TAlphaColorF.Subtract(const Color1, Color2: TAlphaColorF): TAlphaColorF;
begin
  Result.R := Color1.R - Color2.R;
  Result.G := Color1.G - Color2.G;
  Result.B := Color1.B - Color2.B;
  Result.A := Color1.A - Color2.A;
end;

class operator TAlphaColorF.Equal(const Color1, Color2: TAlphaColorF): Boolean;
begin
  Result := SameComponent(Color1.R, Color2.R) and SameComponent(Color1.G, Color2.G) and
    SameComponent(Color1.B, Color2.B) and SameComponent(Color1.A, Color2.A);
end;

class operator TAlphaColorF.NotEqual(const Color1, Color2: TAlphaColorF): Boolean;
begin
  Result := not (Color1 = Color2);
end;

class operator TAlphaColorF.Negative(const Color: TAlphaColorF): TAlphaColorF;
begin
  Result.R := -Color.R;
  Result.G := -Color.G;
  Result.B := -Color.B;
  Result.A := -Color.A;
end;

class operator TAlphaColorF.Multiply(const Color1, Color2: TAlphaColorF): TAlphaColorF;
begin
  Result.R := Color1.R * Color2.R;
  Result.G := Color1.G * Color2.G;
  Result.B := Color1.B * Color2.B;
  Result.A := Color1.A * Color2.A;
end;

class operator TAlphaColorF.Multiply(const Color: TAlphaColorF; const Factor: Single): TAlphaColorF;
begin
  Result.R := Color.R * Factor;
  Result.G := Color.G * Factor;
  Result.B := Color.B * Factor;
  Result.A := Color.A * Factor;
end;

class operator TAlphaColorF.Multiply(const Factor: Single; const Color: TAlphaColorF): TAlphaColorF;
begin
  Result := Color * Factor;
end;

class operator TAlphaColorF.Divide(const Color: TAlphaColorF; const Factor: Single): TAlphaColorF;
begin
  if Abs(Factor) >= Epsilon then
    Result := Color * (1 / Factor)
  else
    Result := Color;
end;

function TAlphaColorF.Clamp: TAlphaColorF;
begin
  Result.R := ClampComponent(R);
  Result.G := ClampComponent(G);
  Result.B := ClampComponent(B);
  Result.A := ClampComponent(A);
end;

function TAlphaColorF.ToAlphaColor: TAlphaColor;
begin
  TAlphaColorRec(Result).R := Round(R * 255);
  TAlphaColorRec(Result).G := Round(G * 255);
  TAlphaColorRec(Result).B := Round(B * 255);
  TAlphaColorRec(Result).A := Round(A * 255);
end;

function TAlphaColorF.PremultipliedAlpha: TAlphaColorF;
begin
  Result.R := R * A;
  Result.G := G * A;
  Result.B := B * A;
  Result.A := A;
end;

function TAlphaColorF.UnpremultipliedAlpha: TAlphaColorF;
var
  OneDivAlpha: Single;
begin
  if A < Epsilon then
  begin
    Result.R := 0;
    Result.G := 0;
    Result.B := 0;
    Result.A := 0;
  end
  else if Abs(A - 1) < Epsilon then
    Result := Self
  else
  begin
    OneDivAlpha := 1 / A;
    Result.R := R * OneDivAlpha;
    Result.G := G * OneDivAlpha;
    Result.B := B * OneDivAlpha;
    Result.A := A;
  end;
end;

{ Modal result testers }

function IsPositiveResult(const AModalResult: TModalResult): Boolean;
begin
  case AModalResult of
    mrOk, mrYes, mrAll, mrYesToAll, mrContinue: Result := True;
  else
    Result := False;
  end;
end;

function IsNegativeResult(const AModalResult: TModalResult): Boolean;
begin
  case AModalResult of
    mrNo, mrNoToAll, mrTryAgain: Result := True;
  else
    Result := False;
  end;
end;

function IsAbortResult(const AModalResult: TModalResult): Boolean;
begin
  case AModalResult of
    mrCancel, mrAbort: Result := True;
  else
    Result := False;
  end;
end;

function IsAnAllResult(const AModalResult: TModalResult): Boolean;
begin
  case AModalResult of
    mrAll, mrNoToAll, mrYesToAll: Result := True;
  else
    Result := False;
  end;
end;

function StripAllFromResult(const AModalResult: TModalResult): TModalResult;
begin
  case AModalResult of
    mrAll:      Result := mrOk;
    mrNoToAll:  Result := mrNo;
    mrYesToAll: Result := mrYes;
  else
    Result := AModalResult;
  end;
end;

function ColorToIntColor(Color: TColor): Longint;
begin
  Result := Color;
end;

initialization
  System.UITypes.TColorRec.ColorToRGB := ColorToIntColor;

end.
