{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{ This unit uses code of the Vcl.Styles.Utils project   }
{ https://github.com/RRUZ/vcl-styles-utils licensed to  }
{ Embarcadero for distribution as part of the VCL.      }
{ Copyright(c) 2015 Rodrigo Ruz https://github.com/RRUZ }
{ and  Mahdi Safsafi https://github.com/MahdiSafsafi    }
{*******************************************************}

unit SHDocVw;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 2014/01/27 16:15:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\D20\TP\runtime\internet\vclie\ExDisp\ExDisp.tlb (1)
// LIBID: {EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}
// LCID: 0
// Helpfile:
// HelpString: Microsoft Internet Controls
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\System32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of IWebBrowser.Type changed to 'Type_'
//   Hint: Parameter 'Property' of DWebBrowserEvents.PropertyChange changed to 'Property_'
//   Hint: Parameter 'Property' of IWebBrowserApp.PutProperty changed to 'Property_'
//   Hint: Parameter 'Property' of IWebBrowserApp.GetProperty changed to 'Property_'
//   Hint: Parameter 'Type' of IShellUIHelper.AddDesktopComponent changed to 'Type_'
//   Hint: Parameter 'Type' of IShellUIHelper3.AddToFavoritesBar changed to 'Type_'
//   Hint: Parameter 'var' of IShellNameSpace.Expand changed to 'var_'
// Cmdline:
//   ..\..\..\bin64\tlibimp.exe  -D. -P+ -Fe- -Hr- -HpaInternet -HpsServers D:\D20\TP\runtime\internet\vclie\ExDisp\ExDisp.tlb
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX,
     WinApi.Messages, Winapi.Mshtmhst, Vcl.Controls, Vcl.StdCtrls, Vcl.Forms, Vcl.Edge, Winapi.WebView2;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SHDocVwMajorVersion = 1;
  SHDocVwMinorVersion = 1;

  LIBID_SHDocVw: TGUID = '{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}';

  IID_IWebBrowser: TGUID = '{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}';
  DIID_DWebBrowserEvents: TGUID = '{EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}';
  IID_IWebBrowserApp: TGUID = '{0002DF05-0000-0000-C000-000000000046}';
  IID_IWebBrowser2: TGUID = '{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}';
  DIID_DWebBrowserEvents2: TGUID = '{34A715A0-6587-11D0-924A-0020AFC7AC4D}';
  CLASS_WebBrowser_V1: TGUID = '{EAB22AC3-30C1-11CF-A7EB-0000C05BAE0B}';
  CLASS_WebBrowser: TGUID = '{8856F961-340A-11D0-A96B-00C04FD705A2}';
  CLASS_InternetExplorer: TGUID = '{0002DF01-0000-0000-C000-000000000046}';
  CLASS_InternetExplorerMedium: TGUID = '{D5E8041D-920F-45E9-B8FB-B1DEB82C6E5E}';
  CLASS_ShellBrowserWindow: TGUID = '{C08AFD90-F2A1-11D1-8455-00A0C91F3880}';
  DIID_DShellWindowsEvents: TGUID = '{FE4106E0-399A-11D0-A48C-00A0C90A8F39}';
  IID_IShellWindows: TGUID = '{85CB6900-4D95-11CF-960C-0080C7F4EE85}';
  CLASS_ShellWindows: TGUID = '{9BA05972-F6A8-11CF-A442-00A0C90A8F39}';
  IID_IShellUIHelper: TGUID = '{729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}';
  IID_IShellUIHelper2: TGUID = '{A7FE6EDA-1932-4281-B881-87B31B8BC52C}';
  IID_IShellUIHelper3: TGUID = '{528DF2EC-D419-40BC-9B6D-DCDBF9C1B25D}';
  IID_IShellUIHelper4: TGUID = '{B36E6A53-8073-499E-824C-D776330A333E}';
  IID_IShellUIHelper5: TGUID = '{A2A08B09-103D-4D3F-B91C-EA455CA82EFA}';
  IID_IShellUIHelper6: TGUID = '{987A573E-46EE-4E89-96AB-DDF7F8FDC98C}';
  CLASS_ShellUIHelper: TGUID = '{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}';
  DIID_DShellNameSpaceEvents: TGUID = '{55136806-B2DE-11D1-B9F2-00A0C98BC547}';
  IID_IShellFavoritesNameSpace: TGUID = '{55136804-B2DE-11D1-B9F2-00A0C98BC547}';
  IID_IShellNameSpace: TGUID = '{E572D3C9-37BE-4AE2-825D-D521763E3108}';
  CLASS_ShellNameSpace: TGUID = '{55136805-B2DE-11D1-B9F2-00A0C98BC547}';
  IID_IScriptErrorList: TGUID = '{F3470F24-15FD-11D2-BB2E-00805FF7EFCA}';
  CLASS_CScriptErrorList: TGUID = '{EFD01300-160F-11D2-BB2E-00805FF7EFCA}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum BrowserNavConstants
type
  BrowserNavConstants = TOleEnum;
const
  navOpenInNewWindow = $00000001;
  navNoHistory = $00000002;
  navNoReadFromCache = $00000004;
  navNoWriteToCache = $00000008;
  navAllowAutosearch = $00000010;
  navBrowserBar = $00000020;
  navHyperlink = $00000040;
  navEnforceRestricted = $00000080;
  navNewWindowsManaged = $00000100;
  navUntrustedForDownload = $00000200;
  navTrustedForActiveX = $00000400;
  navOpenInNewTab = $00000800;
  navOpenInBackgroundTab = $00001000;
  navKeepWordWheelText = $00002000;
  navVirtualTab = $00004000;
  navBlockRedirectsXDomain = $00008000;
  navOpenNewForegroundTab = $00010000;
  navTravelLogScreenshot = $00020000;
  navDeferUnload = $00040000;
  navSpeculative = $00080000;
  navSuggestNewWindow = $00100000;
  navSuggestNewTab = $00200000;
  navReserved1 = $00400000;

// Constants for enum RefreshConstants
type
  RefreshConstants = TOleEnum;
const
  REFRESH_NORMAL = $00000000;
  REFRESH_IFEXPIRED = $00000001;
  REFRESH_COMPLETELY = $00000003;

// Constants for enum CommandStateChangeConstants
type
  CommandStateChangeConstants = TOleEnum;
const
  CSC_UPDATECOMMANDS = $FFFFFFFF;
  CSC_NAVIGATEFORWARD = $00000001;
  CSC_NAVIGATEBACK = $00000002;

// Constants for enum OLECMDID
type
  OLECMDID = TOleEnum;
const
  OLECMDID_OPEN = $00000001;
  OLECMDID_NEW = $00000002;
  OLECMDID_SAVE = $00000003;
  OLECMDID_SAVEAS = $00000004;
  OLECMDID_SAVECOPYAS = $00000005;
  OLECMDID_PRINT = $00000006;
  OLECMDID_PRINTPREVIEW = $00000007;
  OLECMDID_PAGESETUP = $00000008;
  OLECMDID_SPELL = $00000009;
  OLECMDID_PROPERTIES = $0000000A;
  OLECMDID_CUT = $0000000B;
  OLECMDID_COPY = $0000000C;
  OLECMDID_PASTE = $0000000D;
  OLECMDID_PASTESPECIAL = $0000000E;
  OLECMDID_UNDO = $0000000F;
  OLECMDID_REDO = $00000010;
  OLECMDID_SELECTALL = $00000011;
  OLECMDID_CLEARSELECTION = $00000012;
  OLECMDID_ZOOM = $00000013;
  OLECMDID_GETZOOMRANGE = $00000014;
  OLECMDID_UPDATECOMMANDS = $00000015;
  OLECMDID_REFRESH = $00000016;
  OLECMDID_STOP = $00000017;
  OLECMDID_HIDETOOLBARS = $00000018;
  OLECMDID_SETPROGRESSMAX = $00000019;
  OLECMDID_SETPROGRESSPOS = $0000001A;
  OLECMDID_SETPROGRESSTEXT = $0000001B;
  OLECMDID_SETTITLE = $0000001C;
  OLECMDID_SETDOWNLOADSTATE = $0000001D;
  OLECMDID_STOPDOWNLOAD = $0000001E;
  OLECMDID_ONTOOLBARACTIVATED = $0000001F;
  OLECMDID_FIND = $00000020;
  OLECMDID_DELETE = $00000021;
  OLECMDID_HTTPEQUIV = $00000022;
  OLECMDID_HTTPEQUIV_DONE = $00000023;
  OLECMDID_ENABLE_INTERACTION = $00000024;
  OLECMDID_ONUNLOAD = $00000025;
  OLECMDID_PROPERTYBAG2 = $00000026;
  OLECMDID_PREREFRESH = $00000027;
  OLECMDID_SHOWSCRIPTERROR = $00000028;
  OLECMDID_SHOWMESSAGE = $00000029;
  OLECMDID_SHOWFIND = $0000002A;
  OLECMDID_SHOWPAGESETUP = $0000002B;
  OLECMDID_SHOWPRINT = $0000002C;
  OLECMDID_CLOSE = $0000002D;
  OLECMDID_ALLOWUILESSSAVEAS = $0000002E;
  OLECMDID_DONTDOWNLOADCSS = $0000002F;
  OLECMDID_UPDATEPAGESTATUS = $00000030;
  OLECMDID_PRINT2 = $00000031;
  OLECMDID_PRINTPREVIEW2 = $00000032;
  OLECMDID_SETPRINTTEMPLATE = $00000033;
  OLECMDID_GETPRINTTEMPLATE = $00000034;
  OLECMDID_PAGEACTIONBLOCKED = $00000037;
  OLECMDID_PAGEACTIONUIQUERY = $00000038;
  OLECMDID_FOCUSVIEWCONTROLS = $00000039;
  OLECMDID_FOCUSVIEWCONTROLSQUERY = $0000003A;
  OLECMDID_SHOWPAGEACTIONMENU = $0000003B;
  OLECMDID_ADDTRAVELENTRY = $0000003C;
  OLECMDID_UPDATETRAVELENTRY = $0000003D;
  OLECMDID_UPDATEBACKFORWARDSTATE = $0000003E;
  OLECMDID_OPTICAL_ZOOM = $0000003F;
  OLECMDID_OPTICAL_GETZOOMRANGE = $00000040;
  OLECMDID_WINDOWSTATECHANGED = $00000041;
  OLECMDID_ACTIVEXINSTALLSCOPE = $00000042;
  OLECMDID_UPDATETRAVELENTRY_DATARECOVERY = $00000043;
  OLECMDID_SHOWTASKDLG = $00000044;
  OLECMDID_POPSTATEEVENT = $00000045;
  OLECMDID_VIEWPORT_MODE = $00000046;
  OLECMDID_LAYOUT_VIEWPORT_WIDTH = $00000047;
  OLECMDID_VISUAL_VIEWPORT_EXCLUDE_BOTTOM = $00000048;
  OLECMDID_USER_OPTICAL_ZOOM = $00000049;
  OLECMDID_PAGEAVAILABLE = $0000004A;
  OLECMDID_GETUSERSCALABLE = $0000004B;
  OLECMDID_UPDATE_CARET = $0000004C;
  OLECMDID_ENABLE_VISIBILITY = $0000004D;
  OLECMDID_MEDIA_PLAYBACK = $0000004E;
  OLECMDID_SETFAVICON = $0000004F;
  OLECMDID_SET_HOST_FULLSCREENMODE = $00000050;
  OLECMDID_EXITFULLSCREEN = $00000051;
  OLECMDID_SCROLLCOMPLETE = $00000052;
  OLECMDID_ONBEFOREUNLOAD = $00000053;

// Constants for enum OLECMDF
type
  OLECMDF = TOleEnum;
const
  OLECMDF_SUPPORTED = $00000001;
  OLECMDF_ENABLED = $00000002;
  OLECMDF_LATCHED = $00000004;
  OLECMDF_NINCHED = $00000008;
  OLECMDF_INVISIBLE = $00000010;
  OLECMDF_DEFHIDEONCTXTMENU = $00000020;

// Constants for enum OLECMDEXECOPT
type
  OLECMDEXECOPT = TOleEnum;
const
  OLECMDEXECOPT_DODEFAULT = $00000000;
  OLECMDEXECOPT_PROMPTUSER = $00000001;
  OLECMDEXECOPT_DONTPROMPTUSER = $00000002;
  OLECMDEXECOPT_SHOWHELP = $00000003;

// Constants for enum tagREADYSTATE
type
  tagREADYSTATE = TOleEnum;
const
  READYSTATE_UNINITIALIZED = $00000000;
  READYSTATE_LOADING = $00000001;
  READYSTATE_LOADED = $00000002;
  READYSTATE_INTERACTIVE = $00000003;
  READYSTATE_COMPLETE = $00000004;

// Constants for enum SecureLockIconConstants
type
  SecureLockIconConstants = TOleEnum;
const
  secureLockIconUnsecure = $00000000;
  secureLockIconMixed = $00000001;
  secureLockIconSecureUnknownBits = $00000002;
  secureLockIconSecure40Bit = $00000003;
  secureLockIconSecure56Bit = $00000004;
  secureLockIconSecureFortezza = $00000005;
  secureLockIconSecure128Bit = $00000006;

// Constants for enum NewProcessCauseConstants
type
  NewProcessCauseConstants = TOleEnum;
const
  ProtectedModeRedirect = $00000001;

// Constants for enum ShellWindowTypeConstants
type
  ShellWindowTypeConstants = TOleEnum;
const
  SWC_EXPLORER = $00000000;
  SWC_BROWSER = $00000001;
  SWC_3RDPARTY = $00000002;
  SWC_CALLBACK = $00000004;
  SWC_DESKTOP = $00000008;

// Constants for enum ShellWindowFindWindowOptions
type
  ShellWindowFindWindowOptions = TOleEnum;
const
  SWFO_NEEDDISPATCH = $00000001;
  SWFO_INCLUDEPENDING = $00000002;
  SWFO_COOKIEPASSED = $00000004;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IWebBrowser = interface;
  IWebBrowserDisp = dispinterface;
  DWebBrowserEvents = dispinterface;
  IWebBrowserApp = interface;
  IWebBrowserAppDisp = dispinterface;
  IWebBrowser2 = interface;
  IWebBrowser2Disp = dispinterface;
  DWebBrowserEvents2 = dispinterface;
  DShellWindowsEvents = dispinterface;
  IShellWindows = interface;
  IShellWindowsDisp = dispinterface;
  IShellUIHelper = interface;
  IShellUIHelperDisp = dispinterface;
  IShellUIHelper2 = interface;
  IShellUIHelper2Disp = dispinterface;
  IShellUIHelper3 = interface;
  IShellUIHelper3Disp = dispinterface;
  IShellUIHelper4 = interface;
  IShellUIHelper4Disp = dispinterface;
  IShellUIHelper5 = interface;
  IShellUIHelper5Disp = dispinterface;
  IShellUIHelper6 = interface;
  IShellUIHelper6Disp = dispinterface;
  DShellNameSpaceEvents = dispinterface;
  IShellFavoritesNameSpace = interface;
  IShellFavoritesNameSpaceDisp = dispinterface;
  IShellNameSpace = interface;
  IShellNameSpaceDisp = dispinterface;
  IScriptErrorList = interface;
  IScriptErrorListDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  WebBrowser_V1 = IWebBrowser;
  WebBrowser = IWebBrowser2;
  InternetExplorer = IWebBrowser2;
  InternetExplorerMedium = IWebBrowser2;
  ShellBrowserWindow = IWebBrowser2;
  ShellWindows = IShellWindows;
  ShellUIHelper = IShellUIHelper6;
  ShellNameSpace = IShellNameSpace;
  CScriptErrorList = IScriptErrorList;


// *********************************************************************//
// Declaration of structures, unions and aliases.
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IWebBrowser
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
  IWebBrowser = interface(IDispatch)
    ['{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}']
    procedure GoBack; safecall;
    procedure GoForward; safecall;
    procedure GoHome; safecall;
    procedure GoSearch; safecall;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); safecall;
    procedure Refresh; safecall;
    procedure Refresh2(const Level: OleVariant); safecall;
    procedure Stop; safecall;
    function Get_Application: IDispatch; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Container: IDispatch; safecall;
    function Get_Document: IDispatch; safecall;
    function Get_TopLevelContainer: WordBool; safecall;
    function Get_type_: WideString; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pl: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pl: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pl: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pl: Integer); safecall;
    function Get_LocationName: WideString; safecall;
    function Get_LocationURL: WideString; safecall;
    function Get_Busy: WordBool; safecall;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Container: IDispatch read Get_Container;
    property Document: IDispatch read Get_Document;
    property TopLevelContainer: WordBool read Get_TopLevelContainer;
    property type_: WideString read Get_type_;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LocationName: WideString read Get_LocationName;
    property LocationURL: WideString read Get_LocationURL;
    property Busy: WordBool read Get_Busy;
  end;

// *********************************************************************//
// DispIntf:  IWebBrowserDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
  IWebBrowserDisp = dispinterface
    ['{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}']
    procedure GoBack; dispid 100;
    procedure GoForward; dispid 101;
    procedure GoHome; dispid 102;
    procedure GoSearch; dispid 103;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); dispid 104;
    procedure Refresh; dispid -550;
    procedure Refresh2(const Level: OleVariant); dispid 105;
    procedure Stop; dispid 106;
    property Application: IDispatch readonly dispid 200;
    property Parent: IDispatch readonly dispid 201;
    property Container: IDispatch readonly dispid 202;
    property Document: IDispatch readonly dispid 203;
    property TopLevelContainer: WordBool readonly dispid 204;
    property type_: WideString readonly dispid 205;
    property Left: Integer dispid 206;
    property Top: Integer dispid 207;
    property Width: Integer dispid 208;
    property Height: Integer dispid 209;
    property LocationName: WideString readonly dispid 210;
    property LocationURL: WideString readonly dispid 211;
    property Busy: WordBool readonly dispid 212;
  end;

// *********************************************************************//
// DispIntf:  DWebBrowserEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
  DWebBrowserEvents = dispinterface
    ['{EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}']
    procedure BeforeNavigate(const URL: WideString; Flags: Integer;
                             const TargetFrameName: WideString; const PostData: OleVariant;
                             const Headers: WideString; var Cancel: WordBool); dispid 100;
    procedure NavigateComplete(const URL: WideString); dispid 101;
    procedure StatusTextChange(const Text: WideString); dispid 102;
    procedure ProgressChange(Progress: Integer; ProgressMax: Integer); dispid 108;
    procedure DownloadComplete; dispid 104;
    procedure CommandStateChange(Command: Integer; Enable: WordBool); dispid 105;
    procedure DownloadBegin; dispid 106;
    procedure NewWindow(const URL: WideString; Flags: Integer; const TargetFrameName: WideString;
                        const PostData: OleVariant; const Headers: WideString;
                        var Processed: WordBool); dispid 107;
    procedure TitleChange(const Text: WideString); dispid 113;
    procedure FrameBeforeNavigate(const URL: WideString; Flags: Integer;
                                  const TargetFrameName: WideString; const PostData: OleVariant;
                                  const Headers: WideString; var Cancel: WordBool); dispid 200;
    procedure FrameNavigateComplete(const URL: WideString); dispid 201;
    procedure FrameNewWindow(const URL: WideString; Flags: Integer;
                             const TargetFrameName: WideString; const PostData: OleVariant;
                             const Headers: WideString; var Processed: WordBool); dispid 204;
    procedure Quit(var Cancel: WordBool); dispid 103;
    procedure WindowMove; dispid 109;
    procedure WindowResize; dispid 110;
    procedure WindowActivate; dispid 111;
    procedure PropertyChange(const Property_: WideString); dispid 112;
  end;

// *********************************************************************//
// Interface: IWebBrowserApp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0002DF05-0000-0000-C000-000000000046}
// *********************************************************************//
  IWebBrowserApp = interface(IWebBrowser)
    ['{0002DF05-0000-0000-C000-000000000046}']
    procedure Quit; safecall;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT); safecall;
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant); safecall;
    function GetProperty(const Property_: WideString): OleVariant; safecall;
    function Get_Name: WideString; safecall;
    function Get_HWND: HWND; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pBool: WordBool); safecall;
    function Get_StatusBar: WordBool; safecall;
    procedure Set_StatusBar(pBool: WordBool); safecall;
    function Get_StatusText: WideString; safecall;
    procedure Set_StatusText(const StatusText: WideString); safecall;
    function Get_ToolBar: SYSINT; safecall;
    procedure Set_ToolBar(Value: SYSINT); safecall;
    function Get_MenuBar: WordBool; safecall;
    procedure Set_MenuBar(Value: WordBool); safecall;
    function Get_FullScreen: WordBool; safecall;
    procedure Set_FullScreen(pbFullScreen: WordBool); safecall;
    property Name: WideString read Get_Name;
    property HWND: HWND read Get_HWND;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property ToolBar: SYSINT read Get_ToolBar write Set_ToolBar;
    property MenuBar: WordBool read Get_MenuBar write Set_MenuBar;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen;
  end;

// *********************************************************************//
// DispIntf:  IWebBrowserAppDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0002DF05-0000-0000-C000-000000000046}
// *********************************************************************//
  IWebBrowserAppDisp = dispinterface
    ['{0002DF05-0000-0000-C000-000000000046}']
    procedure Quit; dispid 300;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT); dispid 301;
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant); dispid 302;
    function GetProperty(const Property_: WideString): OleVariant; dispid 303;
    property Name: WideString readonly dispid 0;
    property HWND: HWND readonly dispid -515;
    property FullName: WideString readonly dispid 400;
    property Path: WideString readonly dispid 401;
    property Visible: WordBool dispid 402;
    property StatusBar: WordBool dispid 403;
    property StatusText: WideString dispid 404;
    property ToolBar: SYSINT dispid 405;
    property MenuBar: WordBool dispid 406;
    property FullScreen: WordBool dispid 407;
    procedure GoBack; dispid 100;
    procedure GoForward; dispid 101;
    procedure GoHome; dispid 102;
    procedure GoSearch; dispid 103;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); dispid 104;
    procedure Refresh; dispid -550;
    procedure Refresh2(const Level: OleVariant); dispid 105;
    procedure Stop; dispid 106;
    property Application: IDispatch readonly dispid 200;
    property Parent: IDispatch readonly dispid 201;
    property Container: IDispatch readonly dispid 202;
    property Document: IDispatch readonly dispid 203;
    property TopLevelContainer: WordBool readonly dispid 204;
    property type_: WideString readonly dispid 205;
    property Left: Integer dispid 206;
    property Top: Integer dispid 207;
    property Width: Integer dispid 208;
    property Height: Integer dispid 209;
    property LocationName: WideString readonly dispid 210;
    property LocationURL: WideString readonly dispid 211;
    property Busy: WordBool readonly dispid 212;
  end;

// *********************************************************************//
// Interface: IWebBrowser2
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}
// *********************************************************************//
  IWebBrowser2 = interface(IWebBrowserApp)
    ['{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}']
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant;
                        const Headers: OleVariant); safecall;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF; safecall;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                     var pvaOut: OleVariant); safecall;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                             const pvarSize: OleVariant); safecall;
    function Get_ReadyState: tagREADYSTATE; safecall;
    function Get_Offline: WordBool; safecall;
    procedure Set_Offline(pbOffline: WordBool); safecall;
    function Get_Silent: WordBool; safecall;
    procedure Set_Silent(pbSilent: WordBool); safecall;
    function Get_RegisterAsBrowser: WordBool; safecall;
    procedure Set_RegisterAsBrowser(pbRegister: WordBool); safecall;
    function Get_RegisterAsDropTarget: WordBool; safecall;
    procedure Set_RegisterAsDropTarget(pbRegister: WordBool); safecall;
    function Get_TheaterMode: WordBool; safecall;
    procedure Set_TheaterMode(pbRegister: WordBool); safecall;
    function Get_AddressBar: WordBool; safecall;
    procedure Set_AddressBar(Value: WordBool); safecall;
    function Get_Resizable: WordBool; safecall;
    procedure Set_Resizable(Value: WordBool); safecall;
    property ReadyState: tagREADYSTATE read Get_ReadyState;
    property Offline: WordBool read Get_Offline write Set_Offline;
    property Silent: WordBool read Get_Silent write Set_Silent;
    property RegisterAsBrowser: WordBool read Get_RegisterAsBrowser write Set_RegisterAsBrowser;
    property RegisterAsDropTarget: WordBool read Get_RegisterAsDropTarget write Set_RegisterAsDropTarget;
    property TheaterMode: WordBool read Get_TheaterMode write Set_TheaterMode;
    property AddressBar: WordBool read Get_AddressBar write Set_AddressBar;
    property Resizable: WordBool read Get_Resizable write Set_Resizable;
  end;

// *********************************************************************//
// DispIntf:  IWebBrowser2Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}
// *********************************************************************//
  IWebBrowser2Disp = dispinterface
    ['{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}']
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant;
                        const Headers: OleVariant); dispid 500;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF; dispid 501;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                     var pvaOut: OleVariant); dispid 502;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                             const pvarSize: OleVariant); dispid 503;
    property ReadyState: tagREADYSTATE readonly dispid -525;
    property Offline: WordBool dispid 550;
    property Silent: WordBool dispid 551;
    property RegisterAsBrowser: WordBool dispid 552;
    property RegisterAsDropTarget: WordBool dispid 553;
    property TheaterMode: WordBool dispid 554;
    property AddressBar: WordBool dispid 555;
    property Resizable: WordBool dispid 556;
    procedure Quit; dispid 300;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT); dispid 301;
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant); dispid 302;
    function GetProperty(const Property_: WideString): OleVariant; dispid 303;
    property Name: WideString readonly dispid 0;
    property HWND: HWND readonly dispid -515;
    property FullName: WideString readonly dispid 400;
    property Path: WideString readonly dispid 401;
    property Visible: WordBool dispid 402;
    property StatusBar: WordBool dispid 403;
    property StatusText: WideString dispid 404;
    property ToolBar: SYSINT dispid 405;
    property MenuBar: WordBool dispid 406;
    property FullScreen: WordBool dispid 407;
    procedure GoBack; dispid 100;
    procedure GoForward; dispid 101;
    procedure GoHome; dispid 102;
    procedure GoSearch; dispid 103;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); dispid 104;
    procedure Refresh; dispid -550;
    procedure Refresh2(const Level: OleVariant); dispid 105;
    procedure Stop; dispid 106;
    property Application: IDispatch readonly dispid 200;
    property Parent: IDispatch readonly dispid 201;
    property Container: IDispatch readonly dispid 202;
    property Document: IDispatch readonly dispid 203;
    property TopLevelContainer: WordBool readonly dispid 204;
    property type_: WideString readonly dispid 205;
    property Left: Integer dispid 206;
    property Top: Integer dispid 207;
    property Width: Integer dispid 208;
    property Height: Integer dispid 209;
    property LocationName: WideString readonly dispid 210;
    property LocationURL: WideString readonly dispid 211;
    property Busy: WordBool readonly dispid 212;
  end;

// *********************************************************************//
// DispIntf:  DWebBrowserEvents2
// Flags:     (4112) Hidden Dispatchable
// GUID:      {34A715A0-6587-11D0-924A-0020AFC7AC4D}
// *********************************************************************//
  DWebBrowserEvents2 = dispinterface
    ['{34A715A0-6587-11D0-924A-0020AFC7AC4D}']
    procedure StatusTextChange(const Text: WideString); dispid 102;
    procedure ProgressChange(Progress: Integer; ProgressMax: Integer); dispid 108;
    procedure CommandStateChange(Command: Integer; Enable: WordBool); dispid 105;
    procedure DownloadBegin; dispid 106;
    procedure DownloadComplete; dispid 104;
    procedure TitleChange(const Text: WideString); dispid 113;
    procedure PropertyChange(const szProperty: WideString); dispid 112;
    procedure BeforeNavigate2(const pDisp: IDispatch; const URL: OleVariant;
                              const Flags: OleVariant; const TargetFrameName: OleVariant;
                              const PostData: OleVariant; const Headers: OleVariant;
                              var Cancel: WordBool); dispid 250;
    procedure NewWindow2(var ppDisp: IDispatch; var Cancel: WordBool); dispid 251;
    procedure NavigateComplete2(const pDisp: IDispatch; const URL: OleVariant); dispid 252;
    procedure DocumentComplete(const pDisp: IDispatch; const URL: OleVariant); dispid 259;
    procedure OnQuit; dispid 253;
    procedure OnVisible(Visible: WordBool); dispid 254;
    procedure OnToolBar(ToolBar: WordBool); dispid 255;
    procedure OnMenuBar(MenuBar: WordBool); dispid 256;
    procedure OnStatusBar(StatusBar: WordBool); dispid 257;
    procedure OnFullScreen(FullScreen: WordBool); dispid 258;
    procedure OnTheaterMode(TheaterMode: WordBool); dispid 260;
    procedure WindowSetResizable(Resizable: WordBool); dispid 262;
    procedure WindowSetLeft(Left: Integer); dispid 264;
    procedure WindowSetTop(Top: Integer); dispid 265;
    procedure WindowSetWidth(Width: Integer); dispid 266;
    procedure WindowSetHeight(Height: Integer); dispid 267;
    procedure WindowClosing(IsChildWindow: WordBool; var Cancel: WordBool); dispid 263;
    procedure ClientToHostWindow(var CX: Integer; var CY: Integer); dispid 268;
    procedure SetSecureLockIcon(SecureLockIcon: Integer); dispid 269;
    procedure FileDownload(ActiveDocument: WordBool; var Cancel: WordBool); dispid 270;
    procedure NavigateError(const pDisp: IDispatch; const URL: OleVariant; const Frame: OleVariant;
                            const StatusCode: OleVariant; var Cancel: WordBool); dispid 271;
    procedure PrintTemplateInstantiation(const pDisp: IDispatch); dispid 225;
    procedure PrintTemplateTeardown(const pDisp: IDispatch); dispid 226;
    procedure UpdatePageStatus(const pDisp: IDispatch; const nPage: OleVariant;
                               const fDone: OleVariant); dispid 227;
    procedure PrivacyImpactedStateChange(bImpacted: WordBool); dispid 272;
    procedure NewWindow3(var ppDisp: IDispatch; var Cancel: WordBool; dwFlags: LongWord;
                         const bstrUrlContext: WideString; const bstrUrl: WideString); dispid 273;
    procedure SetPhishingFilterStatus(PhishingFilterStatus: Integer); dispid 282;
    procedure WindowStateChanged(dwWindowStateFlags: LongWord; dwValidFlagsMask: LongWord); dispid 283;
    procedure NewProcess(lCauseFlag: Integer; const pWB2: IDispatch; var Cancel: WordBool); dispid 284;
    procedure ThirdPartyUrlBlocked(const URL: OleVariant; dwCount: LongWord); dispid 285;
    procedure RedirectXDomainBlocked(const pDisp: IDispatch; const StartURL: OleVariant;
                                     const RedirectURL: OleVariant; const Frame: OleVariant;
                                     const StatusCode: OleVariant); dispid 286;
    procedure BeforeScriptExecute(const pDispWindow: IDispatch); dispid 290;
    procedure WebWorkerStarted(dwUniqueID: LongWord; const bstrWorkerLabel: WideString); dispid 288;
    procedure WebWorkerFinsihed(dwUniqueID: LongWord); dispid 289;
  end;

// *********************************************************************//
// DispIntf:  DShellWindowsEvents
// Flags:     (4096) Dispatchable
// GUID:      {FE4106E0-399A-11D0-A48C-00A0C90A8F39}
// *********************************************************************//
  DShellWindowsEvents = dispinterface
    ['{FE4106E0-399A-11D0-A48C-00A0C90A8F39}']
    procedure WindowRegistered(lCookie: Integer); dispid 200;
    procedure WindowRevoked(lCookie: Integer); dispid 201;
  end;

// *********************************************************************//
// Interface: IShellWindows
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85CB6900-4D95-11CF-960C-0080C7F4EE85}
// *********************************************************************//
  IShellWindows = interface(IDispatch)
    ['{85CB6900-4D95-11CF-960C-0080C7F4EE85}']
    function Get_Count: Integer; safecall;
    function Item(index: OleVariant): IDispatch; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Register(const pid: IDispatch; HWND: Integer; swClass: SYSINT; out plCookie: Integer); safecall;
    procedure RegisterPending(lThreadId: Integer; const pvarloc: OleVariant;
                              const pvarlocRoot: OleVariant; swClass: SYSINT; out plCookie: Integer); safecall;
    procedure Revoke(lCookie: Integer); safecall;
    procedure OnNavigate(lCookie: Integer; const pvarloc: OleVariant); safecall;
    procedure OnActivated(lCookie: Integer; fActive: WordBool); safecall;
    function FindWindowSW(const pvarloc: OleVariant; const pvarlocRoot: OleVariant;
                          swClass: SYSINT; out pHWND: Integer; swfwOptions: SYSINT): IDispatch; safecall;
    procedure OnCreated(lCookie: Integer; const punk: IUnknown); safecall;
    procedure ProcessAttachDetach(fAttach: WordBool); safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IShellWindowsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85CB6900-4D95-11CF-960C-0080C7F4EE85}
// *********************************************************************//
  IShellWindowsDisp = dispinterface
    ['{85CB6900-4D95-11CF-960C-0080C7F4EE85}']
    property Count: Integer readonly dispid 1610743808;
    function Item(index: OleVariant): IDispatch; dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    procedure Register(const pid: IDispatch; HWND: Integer; swClass: SYSINT; out plCookie: Integer); dispid 1610743811;
    procedure RegisterPending(lThreadId: Integer; const pvarloc: OleVariant;
                              const pvarlocRoot: OleVariant; swClass: SYSINT; out plCookie: Integer); dispid 1610743812;
    procedure Revoke(lCookie: Integer); dispid 1610743813;
    procedure OnNavigate(lCookie: Integer; const pvarloc: OleVariant); dispid 1610743814;
    procedure OnActivated(lCookie: Integer; fActive: WordBool); dispid 1610743815;
    function FindWindowSW(const pvarloc: OleVariant; const pvarlocRoot: OleVariant;
                          swClass: SYSINT; out pHWND: Integer; swfwOptions: SYSINT): IDispatch; dispid 1610743816;
    procedure OnCreated(lCookie: Integer; const punk: IUnknown); dispid 1610743817;
    procedure ProcessAttachDetach(fAttach: WordBool); dispid 1610743818;
  end;

// *********************************************************************//
// Interface: IShellUIHelper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}
// *********************************************************************//
  IShellUIHelper = interface(IDispatch)
    ['{729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}']
    procedure ResetFirstBootMode; safecall;
    procedure ResetSafeMode; safecall;
    procedure RefreshOfflineDesktop; safecall;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); safecall;
    procedure AddChannel(const URL: WideString); safecall;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); safecall;
    function IsSubscribed(const URL: WideString): WordBool; safecall;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); safecall;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); safecall;
    procedure AutoCompleteSaveForm(const Form: OleVariant); safecall;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); safecall;
    procedure AutoCompleteAttach(const Reserved: OleVariant); safecall;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelperDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}
// *********************************************************************//
  IShellUIHelperDisp = dispinterface
    ['{729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}']
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// Interface: IShellUIHelper2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A7FE6EDA-1932-4281-B881-87B31B8BC52C}
// *********************************************************************//
  IShellUIHelper2 = interface(IShellUIHelper)
    ['{A7FE6EDA-1932-4281-B881-87B31B8BC52C}']
    procedure AddSearchProvider(const URL: WideString); safecall;
    procedure RunOnceShown; safecall;
    procedure SkipRunOnce; safecall;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); safecall;
    function SqmEnabled: WordBool; safecall;
    function PhishingEnabled: WordBool; safecall;
    function BrandImageUri: WideString; safecall;
    procedure SkipTabsWelcome; safecall;
    procedure DiagnoseConnection; safecall;
    procedure CustomizeClearType(fSet: WordBool); safecall;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; safecall;
    function IsSearchMigrated: WordBool; safecall;
    function DefaultSearchProvider: WideString; safecall;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); safecall;
    function RunOnceHasShown: WordBool; safecall;
    function SearchGuideUrl: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelper2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A7FE6EDA-1932-4281-B881-87B31B8BC52C}
// *********************************************************************//
  IShellUIHelper2Disp = dispinterface
    ['{A7FE6EDA-1932-4281-B881-87B31B8BC52C}']
    procedure AddSearchProvider(const URL: WideString); dispid 14;
    procedure RunOnceShown; dispid 15;
    procedure SkipRunOnce; dispid 16;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); dispid 17;
    function SqmEnabled: WordBool; dispid 18;
    function PhishingEnabled: WordBool; dispid 19;
    function BrandImageUri: WideString; dispid 20;
    procedure SkipTabsWelcome; dispid 21;
    procedure DiagnoseConnection; dispid 22;
    procedure CustomizeClearType(fSet: WordBool); dispid 23;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; dispid 24;
    function IsSearchMigrated: WordBool; dispid 25;
    function DefaultSearchProvider: WideString; dispid 26;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); dispid 27;
    function RunOnceHasShown: WordBool; dispid 28;
    function SearchGuideUrl: WideString; dispid 29;
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// Interface: IShellUIHelper3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {528DF2EC-D419-40BC-9B6D-DCDBF9C1B25D}
// *********************************************************************//
  IShellUIHelper3 = interface(IShellUIHelper2)
    ['{528DF2EC-D419-40BC-9B6D-DCDBF9C1B25D}']
    procedure AddService(const URL: WideString); safecall;
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord; safecall;
    function InPrivateFilteringEnabled: WordBool; safecall;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); safecall;
    procedure BuildNewTabPage; safecall;
    procedure SetRecentlyClosedVisible(fVisible: WordBool); safecall;
    procedure SetActivitiesVisible(fVisible: WordBool); safecall;
    procedure ContentDiscoveryReset; safecall;
    function IsSuggestedSitesEnabled: WordBool; safecall;
    procedure EnableSuggestedSites(fEnable: WordBool); safecall;
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString); safecall;
    procedure ShowTabsHelp; safecall;
    procedure ShowInPrivateHelp; safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelper3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {528DF2EC-D419-40BC-9B6D-DCDBF9C1B25D}
// *********************************************************************//
  IShellUIHelper3Disp = dispinterface
    ['{528DF2EC-D419-40BC-9B6D-DCDBF9C1B25D}']
    procedure AddService(const URL: WideString); dispid 30;
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord; dispid 31;
    function InPrivateFilteringEnabled: WordBool; dispid 37;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); dispid 32;
    procedure BuildNewTabPage; dispid 33;
    procedure SetRecentlyClosedVisible(fVisible: WordBool); dispid 34;
    procedure SetActivitiesVisible(fVisible: WordBool); dispid 35;
    procedure ContentDiscoveryReset; dispid 36;
    function IsSuggestedSitesEnabled: WordBool; dispid 38;
    procedure EnableSuggestedSites(fEnable: WordBool); dispid 39;
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString); dispid 40;
    procedure ShowTabsHelp; dispid 41;
    procedure ShowInPrivateHelp; dispid 42;
    procedure AddSearchProvider(const URL: WideString); dispid 14;
    procedure RunOnceShown; dispid 15;
    procedure SkipRunOnce; dispid 16;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); dispid 17;
    function SqmEnabled: WordBool; dispid 18;
    function PhishingEnabled: WordBool; dispid 19;
    function BrandImageUri: WideString; dispid 20;
    procedure SkipTabsWelcome; dispid 21;
    procedure DiagnoseConnection; dispid 22;
    procedure CustomizeClearType(fSet: WordBool); dispid 23;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; dispid 24;
    function IsSearchMigrated: WordBool; dispid 25;
    function DefaultSearchProvider: WideString; dispid 26;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); dispid 27;
    function RunOnceHasShown: WordBool; dispid 28;
    function SearchGuideUrl: WideString; dispid 29;
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// Interface: IShellUIHelper4
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B36E6A53-8073-499E-824C-D776330A333E}
// *********************************************************************//
  IShellUIHelper4 = interface(IShellUIHelper3)
    ['{B36E6A53-8073-499E-824C-D776330A333E}']
    function msIsSiteMode: WordBool; safecall;
    procedure msSiteModeShowThumbBar; safecall;
    function msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                         const bstrTooltip: WideString): OleVariant; safecall;
    procedure msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                             fVisible: WordBool); safecall;
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString; const pvarDescription: OleVariant); safecall;
    procedure msSiteModeClearIconOverlay; safecall;
    procedure msAddSiteMode; safecall;
    procedure msSiteModeCreateJumpList(const bstrHeader: WideString); safecall;
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString;
                                        const pvarWindowType: OleVariant); safecall;
    procedure msSiteModeClearJumpList; safecall;
    procedure msSiteModeShowJumpList; safecall;
    function msSiteModeAddButtonStyle(uiButtonID: OleVariant; const bstrIconURL: WideString;
                                      const bstrTooltip: WideString): OleVariant; safecall;
    procedure msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant); safecall;
    procedure msSiteModeActivate; safecall;
    function msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant; safecall;
    procedure msAddTrackingProtectionList(const URL: WideString; const bstrFilterName: WideString); safecall;
    function msTrackingProtectionEnabled: WordBool; safecall;
    function msActiveXFilteringEnabled: WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelper4Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B36E6A53-8073-499E-824C-D776330A333E}
// *********************************************************************//
  IShellUIHelper4Disp = dispinterface
    ['{B36E6A53-8073-499E-824C-D776330A333E}']
    function msIsSiteMode: WordBool; dispid 43;
    procedure msSiteModeShowThumbBar; dispid 47;
    function msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                         const bstrTooltip: WideString): OleVariant; dispid 48;
    procedure msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                             fVisible: WordBool); dispid 46;
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString; const pvarDescription: OleVariant); dispid 44;
    procedure msSiteModeClearIconOverlay; dispid 45;
    procedure msAddSiteMode; dispid 49;
    procedure msSiteModeCreateJumpList(const bstrHeader: WideString); dispid 51;
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString;
                                        const pvarWindowType: OleVariant); dispid 52;
    procedure msSiteModeClearJumpList; dispid 53;
    procedure msSiteModeShowJumpList; dispid 56;
    function msSiteModeAddButtonStyle(uiButtonID: OleVariant; const bstrIconURL: WideString;
                                      const bstrTooltip: WideString): OleVariant; dispid 54;
    procedure msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant); dispid 55;
    procedure msSiteModeActivate; dispid 58;
    function msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant; dispid 59;
    procedure msAddTrackingProtectionList(const URL: WideString; const bstrFilterName: WideString); dispid 57;
    function msTrackingProtectionEnabled: WordBool; dispid 60;
    function msActiveXFilteringEnabled: WordBool; dispid 61;
    procedure AddService(const URL: WideString); dispid 30;
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord; dispid 31;
    function InPrivateFilteringEnabled: WordBool; dispid 37;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); dispid 32;
    procedure BuildNewTabPage; dispid 33;
    procedure SetRecentlyClosedVisible(fVisible: WordBool); dispid 34;
    procedure SetActivitiesVisible(fVisible: WordBool); dispid 35;
    procedure ContentDiscoveryReset; dispid 36;
    function IsSuggestedSitesEnabled: WordBool; dispid 38;
    procedure EnableSuggestedSites(fEnable: WordBool); dispid 39;
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString); dispid 40;
    procedure ShowTabsHelp; dispid 41;
    procedure ShowInPrivateHelp; dispid 42;
    procedure AddSearchProvider(const URL: WideString); dispid 14;
    procedure RunOnceShown; dispid 15;
    procedure SkipRunOnce; dispid 16;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); dispid 17;
    function SqmEnabled: WordBool; dispid 18;
    function PhishingEnabled: WordBool; dispid 19;
    function BrandImageUri: WideString; dispid 20;
    procedure SkipTabsWelcome; dispid 21;
    procedure DiagnoseConnection; dispid 22;
    procedure CustomizeClearType(fSet: WordBool); dispid 23;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; dispid 24;
    function IsSearchMigrated: WordBool; dispid 25;
    function DefaultSearchProvider: WideString; dispid 26;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); dispid 27;
    function RunOnceHasShown: WordBool; dispid 28;
    function SearchGuideUrl: WideString; dispid 29;
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// Interface: IShellUIHelper5
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A2A08B09-103D-4D3F-B91C-EA455CA82EFA}
// *********************************************************************//
  IShellUIHelper5 = interface(IShellUIHelper4)
    ['{A2A08B09-103D-4D3F-B91C-EA455CA82EFA}']
    function msProvisionNetworks(const bstrProvisioningXml: WideString): OleVariant; safecall;
    procedure msReportSafeUrl; safecall;
    procedure msSiteModeRefreshBadge; safecall;
    procedure msSiteModeClearBadge; safecall;
    procedure msDiagnoseConnectionUILess; safecall;
    procedure msLaunchNetworkClientHelp; safecall;
    procedure msChangeDefaultBrowser(fChange: WordBool); safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelper5Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A2A08B09-103D-4D3F-B91C-EA455CA82EFA}
// *********************************************************************//
  IShellUIHelper5Disp = dispinterface
    ['{A2A08B09-103D-4D3F-B91C-EA455CA82EFA}']
    function msProvisionNetworks(const bstrProvisioningXml: WideString): OleVariant; dispid 62;
    procedure msReportSafeUrl; dispid 63;
    procedure msSiteModeRefreshBadge; dispid 64;
    procedure msSiteModeClearBadge; dispid 65;
    procedure msDiagnoseConnectionUILess; dispid 66;
    procedure msLaunchNetworkClientHelp; dispid 67;
    procedure msChangeDefaultBrowser(fChange: WordBool); dispid 68;
    function msIsSiteMode: WordBool; dispid 43;
    procedure msSiteModeShowThumbBar; dispid 47;
    function msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                         const bstrTooltip: WideString): OleVariant; dispid 48;
    procedure msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                             fVisible: WordBool); dispid 46;
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString; const pvarDescription: OleVariant); dispid 44;
    procedure msSiteModeClearIconOverlay; dispid 45;
    procedure msAddSiteMode; dispid 49;
    procedure msSiteModeCreateJumpList(const bstrHeader: WideString); dispid 51;
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString;
                                        const pvarWindowType: OleVariant); dispid 52;
    procedure msSiteModeClearJumpList; dispid 53;
    procedure msSiteModeShowJumpList; dispid 56;
    function msSiteModeAddButtonStyle(uiButtonID: OleVariant; const bstrIconURL: WideString;
                                      const bstrTooltip: WideString): OleVariant; dispid 54;
    procedure msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant); dispid 55;
    procedure msSiteModeActivate; dispid 58;
    function msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant; dispid 59;
    procedure msAddTrackingProtectionList(const URL: WideString; const bstrFilterName: WideString); dispid 57;
    function msTrackingProtectionEnabled: WordBool; dispid 60;
    function msActiveXFilteringEnabled: WordBool; dispid 61;
    procedure AddService(const URL: WideString); dispid 30;
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord; dispid 31;
    function InPrivateFilteringEnabled: WordBool; dispid 37;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); dispid 32;
    procedure BuildNewTabPage; dispid 33;
    procedure SetRecentlyClosedVisible(fVisible: WordBool); dispid 34;
    procedure SetActivitiesVisible(fVisible: WordBool); dispid 35;
    procedure ContentDiscoveryReset; dispid 36;
    function IsSuggestedSitesEnabled: WordBool; dispid 38;
    procedure EnableSuggestedSites(fEnable: WordBool); dispid 39;
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString); dispid 40;
    procedure ShowTabsHelp; dispid 41;
    procedure ShowInPrivateHelp; dispid 42;
    procedure AddSearchProvider(const URL: WideString); dispid 14;
    procedure RunOnceShown; dispid 15;
    procedure SkipRunOnce; dispid 16;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); dispid 17;
    function SqmEnabled: WordBool; dispid 18;
    function PhishingEnabled: WordBool; dispid 19;
    function BrandImageUri: WideString; dispid 20;
    procedure SkipTabsWelcome; dispid 21;
    procedure DiagnoseConnection; dispid 22;
    procedure CustomizeClearType(fSet: WordBool); dispid 23;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; dispid 24;
    function IsSearchMigrated: WordBool; dispid 25;
    function DefaultSearchProvider: WideString; dispid 26;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); dispid 27;
    function RunOnceHasShown: WordBool; dispid 28;
    function SearchGuideUrl: WideString; dispid 29;
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// Interface: IShellUIHelper6
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {987A573E-46EE-4E89-96AB-DDF7F8FDC98C}
// *********************************************************************//
  IShellUIHelper6 = interface(IShellUIHelper5)
    ['{987A573E-46EE-4E89-96AB-DDF7F8FDC98C}']
    procedure msStopPeriodicTileUpdate; safecall;
    procedure msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant;
                                        uiUpdateRecurrence: OleVariant); safecall;
    procedure msStartPeriodicTileUpdateBatch(pollingUris: OleVariant; startTime: OleVariant;
                                             uiUpdateRecurrence: OleVariant); safecall;
    procedure msClearTile; safecall;
    procedure msEnableTileNotificationQueue(fChange: WordBool); safecall;
    function msPinnedSiteState: OleVariant; safecall;
    procedure msEnableTileNotificationQueueForSquare150x150(fChange: WordBool); safecall;
    procedure msEnableTileNotificationQueueForWide310x150(fChange: WordBool); safecall;
    procedure msEnableTileNotificationQueueForSquare310x310(fChange: WordBool); safecall;
    procedure msScheduledTileNotification(const bstrNotificationXml: WideString;
                                          const bstrNotificationId: WideString;
                                          const bstrNotificationTag: WideString;
                                          startTime: OleVariant; expirationTime: OleVariant); safecall;
    procedure msRemoveScheduledTileNotification(const bstrNotificationId: WideString); safecall;
    procedure msStartPeriodicBadgeUpdate(const pollingUri: WideString; startTime: OleVariant;
                                         uiUpdateRecurrence: OleVariant); safecall;
    procedure msStopPeriodicBadgeUpdate; safecall;
    procedure msLaunchInternetOptions; safecall;
  end;

// *********************************************************************//
// DispIntf:  IShellUIHelper6Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {987A573E-46EE-4E89-96AB-DDF7F8FDC98C}
// *********************************************************************//
  IShellUIHelper6Disp = dispinterface
    ['{987A573E-46EE-4E89-96AB-DDF7F8FDC98C}']
    procedure msStopPeriodicTileUpdate; dispid 69;
    procedure msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant;
                                        uiUpdateRecurrence: OleVariant); dispid 70;
    procedure msStartPeriodicTileUpdateBatch(pollingUris: OleVariant; startTime: OleVariant;
                                             uiUpdateRecurrence: OleVariant); dispid 75;
    procedure msClearTile; dispid 71;
    procedure msEnableTileNotificationQueue(fChange: WordBool); dispid 72;
    function msPinnedSiteState: OleVariant; dispid 73;
    procedure msEnableTileNotificationQueueForSquare150x150(fChange: WordBool); dispid 76;
    procedure msEnableTileNotificationQueueForWide310x150(fChange: WordBool); dispid 77;
    procedure msEnableTileNotificationQueueForSquare310x310(fChange: WordBool); dispid 78;
    procedure msScheduledTileNotification(const bstrNotificationXml: WideString;
                                          const bstrNotificationId: WideString;
                                          const bstrNotificationTag: WideString;
                                          startTime: OleVariant; expirationTime: OleVariant); dispid 79;
    procedure msRemoveScheduledTileNotification(const bstrNotificationId: WideString); dispid 80;
    procedure msStartPeriodicBadgeUpdate(const pollingUri: WideString; startTime: OleVariant;
                                         uiUpdateRecurrence: OleVariant); dispid 81;
    procedure msStopPeriodicBadgeUpdate; dispid 82;
    procedure msLaunchInternetOptions; dispid 74;
    function msProvisionNetworks(const bstrProvisioningXml: WideString): OleVariant; dispid 62;
    procedure msReportSafeUrl; dispid 63;
    procedure msSiteModeRefreshBadge; dispid 64;
    procedure msSiteModeClearBadge; dispid 65;
    procedure msDiagnoseConnectionUILess; dispid 66;
    procedure msLaunchNetworkClientHelp; dispid 67;
    procedure msChangeDefaultBrowser(fChange: WordBool); dispid 68;
    function msIsSiteMode: WordBool; dispid 43;
    procedure msSiteModeShowThumbBar; dispid 47;
    function msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                         const bstrTooltip: WideString): OleVariant; dispid 48;
    procedure msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                             fVisible: WordBool); dispid 46;
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString; const pvarDescription: OleVariant); dispid 44;
    procedure msSiteModeClearIconOverlay; dispid 45;
    procedure msAddSiteMode; dispid 49;
    procedure msSiteModeCreateJumpList(const bstrHeader: WideString); dispid 51;
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString;
                                        const pvarWindowType: OleVariant); dispid 52;
    procedure msSiteModeClearJumpList; dispid 53;
    procedure msSiteModeShowJumpList; dispid 56;
    function msSiteModeAddButtonStyle(uiButtonID: OleVariant; const bstrIconURL: WideString;
                                      const bstrTooltip: WideString): OleVariant; dispid 54;
    procedure msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant); dispid 55;
    procedure msSiteModeActivate; dispid 58;
    function msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant; dispid 59;
    procedure msAddTrackingProtectionList(const URL: WideString; const bstrFilterName: WideString); dispid 57;
    function msTrackingProtectionEnabled: WordBool; dispid 60;
    function msActiveXFilteringEnabled: WordBool; dispid 61;
    procedure AddService(const URL: WideString); dispid 30;
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord; dispid 31;
    function InPrivateFilteringEnabled: WordBool; dispid 37;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); dispid 32;
    procedure BuildNewTabPage; dispid 33;
    procedure SetRecentlyClosedVisible(fVisible: WordBool); dispid 34;
    procedure SetActivitiesVisible(fVisible: WordBool); dispid 35;
    procedure ContentDiscoveryReset; dispid 36;
    function IsSuggestedSitesEnabled: WordBool; dispid 38;
    procedure EnableSuggestedSites(fEnable: WordBool); dispid 39;
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString); dispid 40;
    procedure ShowTabsHelp; dispid 41;
    procedure ShowInPrivateHelp; dispid 42;
    procedure AddSearchProvider(const URL: WideString); dispid 14;
    procedure RunOnceShown; dispid 15;
    procedure SkipRunOnce; dispid 16;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString); dispid 17;
    function SqmEnabled: WordBool; dispid 18;
    function PhishingEnabled: WordBool; dispid 19;
    function BrandImageUri: WideString; dispid 20;
    procedure SkipTabsWelcome; dispid 21;
    procedure DiagnoseConnection; dispid 22;
    procedure CustomizeClearType(fSet: WordBool); dispid 23;
    function IsSearchProviderInstalled(const URL: WideString): LongWord; dispid 24;
    function IsSearchMigrated: WordBool; dispid 25;
    function DefaultSearchProvider: WideString; dispid 26;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool); dispid 27;
    function RunOnceHasShown: WordBool; dispid 28;
    function SearchGuideUrl: WideString; dispid 29;
    procedure ResetFirstBootMode; dispid 1;
    procedure ResetSafeMode; dispid 2;
    procedure RefreshOfflineDesktop; dispid 3;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); dispid 4;
    procedure AddChannel(const URL: WideString); dispid 5;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); dispid 6;
    function IsSubscribed(const URL: WideString): WordBool; dispid 7;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant); dispid 8;
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString); dispid 9;
    procedure AutoCompleteSaveForm(const Form: OleVariant); dispid 10;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); dispid 11;
    procedure AutoCompleteAttach(const Reserved: OleVariant); dispid 12;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant; dispid 13;
  end;

// *********************************************************************//
// DispIntf:  DShellNameSpaceEvents
// Flags:     (4096) Dispatchable
// GUID:      {55136806-B2DE-11D1-B9F2-00A0C98BC547}
// *********************************************************************//
  DShellNameSpaceEvents = dispinterface
    ['{55136806-B2DE-11D1-B9F2-00A0C98BC547}']
    procedure FavoritesSelectionChange(cItems: Integer; hItem: Integer; const strName: WideString;
                                       const strUrl: WideString; cVisits: Integer;
                                       const strDate: WideString; fAvailableOffline: Integer); dispid 1;
    procedure SelectionChange; dispid 2;
    procedure DoubleClick; dispid 3;
    procedure Initialized; dispid 4;
  end;

// *********************************************************************//
// Interface: IShellFavoritesNameSpace
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55136804-B2DE-11D1-B9F2-00A0C98BC547}
// *********************************************************************//
  IShellFavoritesNameSpace = interface(IDispatch)
    ['{55136804-B2DE-11D1-B9F2-00A0C98BC547}']
    procedure MoveSelectionUp; safecall;
    procedure MoveSelectionDown; safecall;
    procedure ResetSort; safecall;
    procedure NewFolder; safecall;
    procedure Synchronize; safecall;
    procedure Import; safecall;
    procedure Export; safecall;
    procedure InvokeContextMenuCommand(const strCommand: WideString); safecall;
    procedure MoveSelectionTo; safecall;
    function Get_SubscriptionsEnabled: WordBool; safecall;
    function CreateSubscriptionForSelection: WordBool; safecall;
    function DeleteSubscriptionForSelection: WordBool; safecall;
    procedure SetRoot(const bstrFullPath: WideString); safecall;
    property SubscriptionsEnabled: WordBool read Get_SubscriptionsEnabled;
  end;

// *********************************************************************//
// DispIntf:  IShellFavoritesNameSpaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55136804-B2DE-11D1-B9F2-00A0C98BC547}
// *********************************************************************//
  IShellFavoritesNameSpaceDisp = dispinterface
    ['{55136804-B2DE-11D1-B9F2-00A0C98BC547}']
    procedure MoveSelectionUp; dispid 1;
    procedure MoveSelectionDown; dispid 2;
    procedure ResetSort; dispid 3;
    procedure NewFolder; dispid 4;
    procedure Synchronize; dispid 5;
    procedure Import; dispid 6;
    procedure Export; dispid 7;
    procedure InvokeContextMenuCommand(const strCommand: WideString); dispid 8;
    procedure MoveSelectionTo; dispid 9;
    property SubscriptionsEnabled: WordBool readonly dispid 10;
    function CreateSubscriptionForSelection: WordBool; dispid 11;
    function DeleteSubscriptionForSelection: WordBool; dispid 12;
    procedure SetRoot(const bstrFullPath: WideString); dispid 13;
  end;

// *********************************************************************//
// Interface: IShellNameSpace
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E572D3C9-37BE-4AE2-825D-D521763E3108}
// *********************************************************************//
  IShellNameSpace = interface(IShellFavoritesNameSpace)
    ['{E572D3C9-37BE-4AE2-825D-D521763E3108}']
    function Get_EnumOptions: Integer; safecall;
    procedure Set_EnumOptions(pgrfEnumFlags: Integer); safecall;
    function Get_SelectedItem: IDispatch; safecall;
    procedure Set_SelectedItem(const pItem: IDispatch); safecall;
    function Get_Root: OleVariant; safecall;
    procedure Set_Root(pvar: OleVariant); safecall;
    function Get_Depth: SYSINT; safecall;
    procedure Set_Depth(piDepth: SYSINT); safecall;
    function Get_Mode: SYSUINT; safecall;
    procedure Set_Mode(puMode: SYSUINT); safecall;
    function Get_Flags: LongWord; safecall;
    procedure Set_Flags(pdwFlags: LongWord); safecall;
    procedure Set_TVFlags(dwFlags: LongWord); safecall;
    function Get_TVFlags: LongWord; safecall;
    function Get_Columns: WideString; safecall;
    procedure Set_Columns(const bstrColumns: WideString); safecall;
    function Get_CountViewTypes: SYSINT; safecall;
    procedure SetViewType(iType: SYSINT); safecall;
    function SelectedItems: IDispatch; safecall;
    procedure Expand(var_: OleVariant; iDepth: SYSINT); safecall;
    procedure UnselectAll; safecall;
    property EnumOptions: Integer read Get_EnumOptions write Set_EnumOptions;
    property SelectedItem: IDispatch read Get_SelectedItem write Set_SelectedItem;
    property Root: OleVariant read Get_Root write Set_Root;
    property Depth: SYSINT read Get_Depth write Set_Depth;
    property Mode: SYSUINT read Get_Mode write Set_Mode;
    property Flags: LongWord read Get_Flags write Set_Flags;
    property TVFlags: LongWord read Get_TVFlags write Set_TVFlags;
    property Columns: WideString read Get_Columns write Set_Columns;
    property CountViewTypes: SYSINT read Get_CountViewTypes;
  end;

// *********************************************************************//
// DispIntf:  IShellNameSpaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E572D3C9-37BE-4AE2-825D-D521763E3108}
// *********************************************************************//
  IShellNameSpaceDisp = dispinterface
    ['{E572D3C9-37BE-4AE2-825D-D521763E3108}']
    property EnumOptions: Integer dispid 14;
    property SelectedItem: IDispatch dispid 15;
    property Root: OleVariant dispid 16;
    property Depth: SYSINT dispid 17;
    property Mode: SYSUINT dispid 18;
    property Flags: LongWord dispid 19;
    property TVFlags: LongWord dispid 20;
    property Columns: WideString dispid 21;
    property CountViewTypes: SYSINT readonly dispid 22;
    procedure SetViewType(iType: SYSINT); dispid 23;
    function SelectedItems: IDispatch; dispid 24;
    procedure Expand(var_: OleVariant; iDepth: SYSINT); dispid 25;
    procedure UnselectAll; dispid 26;
    procedure MoveSelectionUp; dispid 1;
    procedure MoveSelectionDown; dispid 2;
    procedure ResetSort; dispid 3;
    procedure NewFolder; dispid 4;
    procedure Synchronize; dispid 5;
    procedure Import; dispid 6;
    procedure Export; dispid 7;
    procedure InvokeContextMenuCommand(const strCommand: WideString); dispid 8;
    procedure MoveSelectionTo; dispid 9;
    property SubscriptionsEnabled: WordBool readonly dispid 10;
    function CreateSubscriptionForSelection: WordBool; dispid 11;
    function DeleteSubscriptionForSelection: WordBool; dispid 12;
    procedure SetRoot(const bstrFullPath: WideString); dispid 13;
  end;

// *********************************************************************//
// Interface: IScriptErrorList
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F3470F24-15FD-11D2-BB2E-00805FF7EFCA}
// *********************************************************************//
  IScriptErrorList = interface(IDispatch)
    ['{F3470F24-15FD-11D2-BB2E-00805FF7EFCA}']
    procedure advanceError; safecall;
    procedure retreatError; safecall;
    function canAdvanceError: Integer; safecall;
    function canRetreatError: Integer; safecall;
    function getErrorLine: Integer; safecall;
    function getErrorChar: Integer; safecall;
    function getErrorCode: Integer; safecall;
    function getErrorMsg: WideString; safecall;
    function getErrorUrl: WideString; safecall;
    function getAlwaysShowLockState: Integer; safecall;
    function getDetailsPaneOpen: Integer; safecall;
    procedure setDetailsPaneOpen(fDetailsPaneOpen: Integer); safecall;
    function getPerErrorDisplay: Integer; safecall;
    procedure setPerErrorDisplay(fPerErrorDisplay: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IScriptErrorListDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F3470F24-15FD-11D2-BB2E-00805FF7EFCA}
// *********************************************************************//
  IScriptErrorListDisp = dispinterface
    ['{F3470F24-15FD-11D2-BB2E-00805FF7EFCA}']
    procedure advanceError; dispid 10;
    procedure retreatError; dispid 11;
    function canAdvanceError: Integer; dispid 12;
    function canRetreatError: Integer; dispid 13;
    function getErrorLine: Integer; dispid 14;
    function getErrorChar: Integer; dispid 15;
    function getErrorCode: Integer; dispid 16;
    function getErrorMsg: WideString; dispid 17;
    function getErrorUrl: WideString; dispid 18;
    function getAlwaysShowLockState: Integer; dispid 23;
    function getDetailsPaneOpen: Integer; dispid 19;
    procedure setDetailsPaneOpen(fDetailsPaneOpen: Integer); dispid 20;
    function getPerErrorDisplay: Integer; dispid 21;
    procedure setPerErrorDisplay(fPerErrorDisplay: Integer); dispid 22;
  end;

// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TWebBrowser
// Help String      : WebBrowser Control
// Default Interface: IWebBrowser2
// Def. Intf. DISP? : No
// Event   Interface: DWebBrowserEvents2
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TWebBrowserStatusTextChange = procedure(ASender: TObject; const Text: WideString) of object;
  TWebBrowserProgressChange = procedure(ASender: TObject; Progress: Integer; ProgressMax: Integer) of object;
  TWebBrowserCommandStateChange = procedure(ASender: TObject; Command: Integer; Enable: WordBool) of object;
  TWebBrowserTitleChange = procedure(ASender: TObject; const Text: WideString) of object;
  TWebBrowserPropertyChange = procedure(ASender: TObject; const szProperty: WideString) of object;
  TWebBrowserBeforeNavigate2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                           const URL: OleVariant;
                                                           const Flags: OleVariant;
                                                           const TargetFrameName: OleVariant;
                                                           const PostData: OleVariant;
                                                           const Headers: OleVariant;
                                                           var Cancel: WordBool) of object;
  TWebBrowserNewWindow2 = procedure(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool) of object;
  TWebBrowserNavigateComplete2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                             const URL: OleVariant) of object;
  TWebBrowserDocumentComplete = procedure(ASender: TObject; const pDisp: IDispatch;
                                                            const URL: OleVariant) of object;
  TWebBrowserOnVisible = procedure(ASender: TObject; Visible: WordBool) of object;
  TWebBrowserOnToolBar = procedure(ASender: TObject; ToolBar: WordBool) of object;
  TWebBrowserOnMenuBar = procedure(ASender: TObject; MenuBar: WordBool) of object;
  TWebBrowserOnStatusBar = procedure(ASender: TObject; StatusBar: WordBool) of object;
  TWebBrowserOnFullScreen = procedure(ASender: TObject; FullScreen: WordBool) of object;
  TWebBrowserOnTheaterMode = procedure(ASender: TObject; TheaterMode: WordBool) of object;
  TWebBrowserWindowSetResizable = procedure(ASender: TObject; Resizable: WordBool) of object;
  TWebBrowserWindowSetLeft = procedure(ASender: TObject; Left: Integer) of object;
  TWebBrowserWindowSetTop = procedure(ASender: TObject; Top: Integer) of object;
  TWebBrowserWindowSetWidth = procedure(ASender: TObject; Width: Integer) of object;
  TWebBrowserWindowSetHeight = procedure(ASender: TObject; Height: Integer) of object;
  TWebBrowserWindowClosing = procedure(ASender: TObject; IsChildWindow: WordBool;
                                                         var Cancel: WordBool) of object;
  TWebBrowserClientToHostWindow = procedure(ASender: TObject; var CX: Integer; var CY: Integer) of object;
  TWebBrowserSetSecureLockIcon = procedure(ASender: TObject; SecureLockIcon: Integer) of object;
  TWebBrowserFileDownload = procedure(ASender: TObject; ActiveDocument: WordBool;
                                                        var Cancel: WordBool) of object;
  TWebBrowserNavigateError = procedure(ASender: TObject; const pDisp: IDispatch;
                                                         const URL: OleVariant;
                                                         const Frame: OleVariant;
                                                         const StatusCode: OleVariant;
                                                         var Cancel: WordBool) of object;
  TWebBrowserPrintTemplateInstantiation = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TWebBrowserPrintTemplateTeardown = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TWebBrowserUpdatePageStatus = procedure(ASender: TObject; const pDisp: IDispatch;
                                                            const nPage: OleVariant;
                                                            const fDone: OleVariant) of object;
  TWebBrowserPrivacyImpactedStateChange = procedure(ASender: TObject; bImpacted: WordBool) of object;
  TWebBrowserNewWindow3 = procedure(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool;
                                                      dwFlags: LongWord;
                                                      const bstrUrlContext: WideString;
                                                      const bstrUrl: WideString) of object;
  TWebBrowserSetPhishingFilterStatus = procedure(ASender: TObject; PhishingFilterStatus: Integer) of object;
  TWebBrowserWindowStateChanged = procedure(ASender: TObject; dwWindowStateFlags: LongWord;
                                                              dwValidFlagsMask: LongWord) of object;
  TWebBrowserNewProcess = procedure(ASender: TObject; lCauseFlag: Integer; const pWB2: IDispatch;
                                                      var Cancel: WordBool) of object;
  TWebBrowserThirdPartyUrlBlocked = procedure(ASender: TObject; const URL: OleVariant;
                                                                dwCount: LongWord) of object;
  TWebBrowserRedirectXDomainBlocked = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                  const StartURL: OleVariant;
                                                                  const RedirectURL: OleVariant;
                                                                  const Frame: OleVariant;
                                                                  const StatusCode: OleVariant) of object;
  TWebBrowserBeforeScriptExecute = procedure(ASender: TObject; const pDispWindow: IDispatch) of object;
  TWebBrowserWebWorkerStarted = procedure(ASender: TObject; dwUniqueID: LongWord;
                                                            const bstrWorkerLabel: WideString) of object;
  TWebBrowserWebWorkerFinsihed = procedure(ASender: TObject; dwUniqueID: LongWord) of object;
  TWebBrowserShowScriptError = procedure(ASender: TObject;
    const AErrorLine, AErrorCharacter, AErrorMessage, AErrorCode, AErrorUrl: OleVariant;
    var AOut: OleVariant; var AHandled: Boolean) of object;

  TWebBrowser = class(TOleControl, IDocHostUIHandler, IDocHostShowUI, IOleCommandTarget)
  strict private
    type
      TWinContainer = class(TWinControl)
      protected
        FCorner: Boolean;
        procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
      end;
    var
    FLSM_CXHTHUMB  : Integer;
    FLSM_CYVTHUMB  : Integer;
    FVScrollBar  : TScrollBar;
    FHScrollBar  : TScrollBar;
    FVScrollBarContainer   : TWinContainer;
    FHScrollBarContainer   : TWinContainer;
    FScrollCornerContainer : TWinContainer;
    FScrollParent: TWinControl;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure InitStyledScrollBars;
    procedure InitStyledScrollBar(AScrollBar: TWinContainer);
    function IsStyledScrollsAssigned: Boolean;
    procedure ResizeScrollBars;
    procedure UpdateContainers(AVisibleChanged: Boolean);
    procedure VScrollChange(Sender: TObject);
    procedure HScrollChange(Sender: TObject);
    function GetIEHandle : HWND;
    procedure DoDocumentComplete(Sender: TObject;const pDisp: IDispatch; const URL: OleVariant);
    procedure DoNavigateComplete2(Sender: TObject;const pDisp: IDispatch;const URL: OleVariant);
    procedure DoBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
    procedure DoCommandStateChange(Sender: TObject; Command: Integer; Enable: WordBool);
    procedure DoProgressChange(Sender: TObject; Progress, ProgressMax: Integer);
  public
    type
      /// <summary>
      ///   The type of the SelectedEngine property of TWebBrowser
      /// </summary>
      TSelectedEngine = (
        /// <summary>
        ///   Use the traditional Internet Explorer WebBrowser browser control
        /// </summary>
        IEOnly,
        /// <summary>
        ///   Use the Edge WebView2 browser control if possible, an exception is raised
        /// </summary>
        EdgeOnly,
        /// <summary>
        ///   Use the Edge WebView2 browser control if possible, otherwise fall back to using the Internet Explorer
        ///   WebBrowser browser control
        /// </summary>
        EdgeIfAvailable);
      /// <summary>
      ///   The type of the ActiveEngine property of TWebBrowser
      /// </summary>
      TActiveEngine = (
        /// <summary>
        ///   There is no browser control in use
        /// </summary>
        None,
        /// <summary>
        ///   No browser control is in use yet, but initialization of the Edge WebView2 control is being attempted
        /// </summary>
        NoneYet,
        /// <summary>
        ///   The Internet Explorer WebBrowser control is in use
        /// </summary>
        IE,
        /// <summary>
        ///   The Edge WebView2 browser control is in use
        /// </summary>
        Edge);
  private
    FLastUrl : WideString;
    FOnStatusTextChange: TWebBrowserStatusTextChange;
    FOnProgressChange: TWebBrowserProgressChange;
    FOnCommandStateChange: TWebBrowserCommandStateChange;
    FOnDownloadBegin: TNotifyEvent;
    FOnDownloadComplete: TNotifyEvent;
    FOnTitleChange: TWebBrowserTitleChange;
    FOnPropertyChange: TWebBrowserPropertyChange;
    FOnBeforeNavigate2: TWebBrowserBeforeNavigate2;
    FOnNewWindow2: TWebBrowserNewWindow2;
    FOnNavigateComplete2: TWebBrowserNavigateComplete2;
    FOnDocumentComplete: TWebBrowserDocumentComplete;
    FOnQuit: TNotifyEvent;
    FOnVisible: TWebBrowserOnVisible;
    FOnToolBar: TWebBrowserOnToolBar;
    FOnMenuBar: TWebBrowserOnMenuBar;
    FOnStatusBar: TWebBrowserOnStatusBar;
    FOnFullScreen: TWebBrowserOnFullScreen;
    FOnTheaterMode: TWebBrowserOnTheaterMode;
    FOnWindowSetResizable: TWebBrowserWindowSetResizable;
    FOnWindowSetLeft: TWebBrowserWindowSetLeft;
    FOnWindowSetTop: TWebBrowserWindowSetTop;
    FOnWindowSetWidth: TWebBrowserWindowSetWidth;
    FOnWindowSetHeight: TWebBrowserWindowSetHeight;
    FOnWindowClosing: TWebBrowserWindowClosing;
    FOnClientToHostWindow: TWebBrowserClientToHostWindow;
    FOnSetSecureLockIcon: TWebBrowserSetSecureLockIcon;
    FOnFileDownload: TWebBrowserFileDownload;
    FOnNavigateError: TWebBrowserNavigateError;
    FOnPrintTemplateInstantiation: TWebBrowserPrintTemplateInstantiation;
    FOnPrintTemplateTeardown: TWebBrowserPrintTemplateTeardown;
    FOnUpdatePageStatus: TWebBrowserUpdatePageStatus;
    FOnPrivacyImpactedStateChange: TWebBrowserPrivacyImpactedStateChange;
    FOnNewWindow3: TWebBrowserNewWindow3;
    FOnSetPhishingFilterStatus: TWebBrowserSetPhishingFilterStatus;
    FOnWindowStateChanged: TWebBrowserWindowStateChanged;
    FOnNewProcess: TWebBrowserNewProcess;
    FOnThirdPartyUrlBlocked: TWebBrowserThirdPartyUrlBlocked;
    FOnRedirectXDomainBlocked: TWebBrowserRedirectXDomainBlocked;
    FOnBeforeScriptExecute: TWebBrowserBeforeScriptExecute;
    FOnWebWorkerStarted: TWebBrowserWebWorkerStarted;
    FOnWebWorkerFinsihed: TWebBrowserWebWorkerFinsihed;
    FOnShowScriptError: TWebBrowserShowScriptError;
    FIEIntf: IWebBrowser2;
    FEdge: TEdgeBrowser;
    FEdgeBusy: Boolean;
    FEdgeReadyState: tagREADYSTATE;
    FSelectedEngine: TSelectedEngine;
    FActiveEngine: TActiveEngine;
    FEdgeUserDataFolder: string;
    FEdgeBrowserExecutableFolder: string;
    //IDocHostUIHandler
    function ShowContextMenu(const dwID: DWORD; const ppt: PPOINT; const pcmdtReserved: IUnknown; const pdispReserved: IDispatch): HRESULT; stdcall;
    function GetHostInfo(var pInfo: TDocHostUIInfo): HRESULT; stdcall;
    function ShowUI(const dwID: DWORD; const pActiveObject: IOleInPlaceActiveObject; const pCommandTarget: IOleCommandTarget; const pFrame:  IOleInPlaceFrame; const pDoc: IOleInPlaceUIWindow): HRESULT; stdcall;
    function HideUI: HRESULT; stdcall;
    function UpdateUI: HRESULT; stdcall;
    function EnableModeless(const fEnable: BOOL): HRESULT; stdcall;
    function OnDocWindowActivate(const fActivate: BOOL): HRESULT; stdcall;
    function OnFrameWindowActivate(const fActivate: BOOL): HRESULT; stdcall;
    function ResizeBorder(const prcBorder: PRECT; const pUIWindow: IOleInPlaceUIWindow; const fRameWindow: BOOL): HRESULT; stdcall;
    function TranslateAccelerator(const lpMsg: PMSG; const pguidCmdGroup: PGUID; const nCmdID: DWORD): HRESULT; stdcall;
    function GetOptionKeyPath(var pchKey: POLESTR; const dw: DWORD): HRESULT; stdcall;
    function GetDropTarget(const pDropTarget: IDropTarget; out ppDropTarget: IDropTarget): HRESULT; stdcall;
    function GetExternal(out ppDispatch: IDispatch): HRESULT; stdcall;
    function TranslateUrl(const dwTranslate: DWORD; const pchURLIn: POLESTR; var ppchURLOut: POLESTR): HRESULT; stdcall;
    function FilterDataObject(const pDO: IDataObject; out ppDORet: IDataObject): HRESULT; stdcall;
    // IDocHostShowUI
    function ShowMessage(hwnd: THandle;lpstrText: POLESTR;lpstrCaption: POLESTR; dwType: longint;lpstrHelpFile: POLESTR;dwHelpContext: longint; var plResult: LRESULT): HRESULT; stdcall;
    function ShowHelp(hwnd: THandle; pszHelpFile: POLESTR; uCommand: integer; dwData: longint; ptMouse: TPoint; var pDispachObjectHit: IDispatch): HRESULT; stdcall;
    //IOleCommandTarget
    function QueryStatus(CmdGroup: PGUID; cCmds: Cardinal; prgCmds: POleCmd; CmdText: POleCmdText): HResult; stdcall;
    function Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD; const vaIn: OleVariant; var vaOut: OleVariant): HResult; stdcall;
    // TEdgeBrowser event handlers
    procedure WebViewCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HResult);
    procedure WebViewHistoryChanged(Sender: TCustomEdgeBrowser);
    procedure WebViewDocumentTitleChanged(Sender: TCustomEdgeBrowser; const ADocumentTitle: string);
    procedure WebViewNavigationStarting(Sender: TCustomEdgeBrowser; Args: TNavigationStartingEventArgs);
    procedure WebViewNavigationCompleted(Sender: TCustomEdgeBrowser; IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
    procedure WebViewNewWindowRequested(Sender: TCustomEdgeBrowser; Args: TNewWindowRequestedEventArgs);
    procedure WebViewScriptDialogOpening(Sender: TCustomEdgeBrowser; Args: TScriptDialogOpeningEventArgs);

    function GetControlInterface: IWebBrowser2;
    procedure SetEdgeBrowserExecutableFolder(const Value: string);
    procedure SetEdgeUserDataFolder(const Value: string);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_AddressBar: WordBool;
    function Get_Application: IDispatch;
    function Get_Busy: WordBool;
    function Get_Container: IDispatch;
    function Get_Document: IDispatch;
    function Get_FullName: WideString;
    function Get_FullScreen: WordBool;
    function Get_HWND: HWND;
    function Get_LocationName: WideString;
    function Get_LocationURL: WideString;
    function Get_MenuBar: WordBool;
    function Get_Name: WideString;
    function Get_Offline: WordBool;
    function Get_Parent: IDispatch;
    function Get_Path: WideString;
    function Get_ReadyState: tagREADYSTATE;
    function Get_RegisterAsBrowser: WordBool;
    function Get_RegisterAsDropTarget: WordBool;
    function Get_Resizable: WordBool;
    function Get_Silent: WordBool;
    function Get_StatusBar: WordBool;
    function Get_StatusText: WideString;
    function Get_TheaterMode: WordBool;
    function Get_ToolBar: Integer;
    function Get_TopLevelContainer: WordBool;
    function Get_Type: WideString;
    function Get_Visible: WordBool;
    procedure Set_AddressBar(Value: WordBool);
    procedure Set_FullScreen(Value: WordBool);
    procedure Set_MenuBar(Value: WordBool);
    procedure Set_Offline(Value: WordBool);
    procedure Set_RegisterAsBrowser(Value: WordBool);
    procedure Set_RegisterAsDropTarget(Value: WordBool);
    procedure Set_Resizable(Value: WordBool);
    procedure Set_Silent(Value: WordBool);
    procedure Set_StatusBar(Value: WordBool);
    procedure Set_StatusText(Value: WideString);
    procedure Set_TheaterMode(Value: WordBool);
    procedure Set_ToolBar(Value: Integer);
    procedure Set_Visible(Value: WordBool);

    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TDispParams);override;
    procedure SetParent(AParent: TWinControl); override;
    procedure Loaded; override;
    /// <summary>
    ///    Need to use WM_TIMER message to check scroll info for styled scrollbars
    /// </summary>
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    /// <summary>
    ///    Need to use WM_SIZE message to update styled scrollbars
    /// </summary>
    procedure WMSize(var Message: TWMSIZE); message WM_SIZE;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetEdgeInterface: TEdgeBrowser;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetFocus; override;
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
    procedure GoSearch;
    procedure Navigate(const URL: WideString); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); overload;
    procedure Refresh;
    procedure Refresh2; overload;
    procedure Refresh2(const Level: OleVariant); overload;
    procedure Stop;
    procedure Quit;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant);
    function GetProperty(const Property_: WideString): OleVariant;
    procedure Navigate2(const URL: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant;
                        const Headers: OleVariant); overload;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                     var pvaOut: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                             const pvarSize: OleVariant); overload;
    /// <summary>
    ///   Which browser control is in use by the TWebBrowser component
    /// </summary>
    property ActiveEngine: TActiveEngine read FActiveEngine;
    property ControlInterface: IWebBrowser2 read GetControlInterface;
    property DefaultInterface: IWebBrowser2 read GetControlInterface;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Container: IDispatch read Get_Container;
    property Document: IDispatch read Get_Document;
    property TopLevelContainer: WordBool read Get_TopLevelContainer;
    property type_: WideString read Get_Type;
    property LocationName: WideString read Get_LocationName;
    property LocationURL: WideString read Get_LocationURL;
    property Busy: WordBool read Get_Busy;
    property Name: WideString read Get_Name;
    property HWND: HWND read Get_HWND;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property ReadyState: tagREADYSTATE read Get_ReadyState;
    /// <summary>
    ///   If SelectedEngine is EdgeOnly or EdgeIfAvailable then this property tells the WebView2 loader where
    ///   to find the WebView2 runtime you want used, e.g. a particular version, as opposed to
    ///   using whatever version is found on the system using the loader's normal locating system, which
    //    is probably updated periodically.
    /// </summary>
    property EdgeBrowserExecutableFolder: string read FEdgeBrowserExecutableFolder write SetEdgeBrowserExecutableFolder;
    /// <summary>
    ///   If SelectedEngine is EdgeOnly or EdgeIfAvailable then this property tells Edge (or, more accurately,
    ///   the WebView2 runtime) where to store user data (e.g. cookies, permissions and cached resources).
    ///   This defaults to a folder in %LOCALAPPDATA% called {Executable File Name}.WebView2.
    ///   The value can contain environment variables surrounded by % signs, e.g. %LOCALAPPDATA%.
    ///   Note: Microsoft states "The app is responsible to clean up the associated user data folder when it is done."
    /// </summary>
    property EdgeUserDataFolder: string read FEdgeUserDataFolder write SetEdgeUserDataFolder;
  published
    property Anchors;
    property TabStop;
    property Align;
    property DragCursor;
    property DragMode;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property StyleElements;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
    /// <summary>
    ///   Tells the component which underlying browser control to use: Internet Explorer or Edge
    /// </summary>
    property SelectedEngine: TSelectedEngine read FSelectedEngine write FSelectedEngine default TSelectedEngine.IEOnly;
    property Visible: WordBool read Get_Visible write Set_Visible stored False;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar stored False;
    property StatusText: WideString read Get_StatusText write Set_StatusText stored False;
    property ToolBar: Integer read Get_ToolBar write Set_ToolBar stored False;
    property MenuBar: WordBool read Get_MenuBar write Set_MenuBar stored False;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen stored False;
    property Offline: WordBool read Get_Offline write Set_Offline stored False;
    property Silent: WordBool read Get_Silent write Set_Silent stored False;
    property RegisterAsBrowser: WordBool read Get_RegisterAsBrowser write Set_RegisterAsBrowser stored False;
    property RegisterAsDropTarget: WordBool read Get_RegisterAsDropTarget write Set_RegisterAsDropTarget stored False;
    property TheaterMode: WordBool read Get_TheaterMode write Set_TheaterMode stored False;
    property AddressBar: WordBool read Get_AddressBar write Set_AddressBar stored False;
    property Resizable: WordBool read Get_Resizable write Set_Resizable stored False;
    property OnStatusTextChange: TWebBrowserStatusTextChange read FOnStatusTextChange write FOnStatusTextChange;
    property OnProgressChange: TWebBrowserProgressChange read FOnProgressChange write FOnProgressChange;
    property OnCommandStateChange: TWebBrowserCommandStateChange read FOnCommandStateChange write FOnCommandStateChange;
    property OnDownloadBegin: TNotifyEvent read FOnDownloadBegin write FOnDownloadBegin;
    property OnDownloadComplete: TNotifyEvent read FOnDownloadComplete write FOnDownloadComplete;
    property OnTitleChange: TWebBrowserTitleChange read FOnTitleChange write FOnTitleChange;
    property OnPropertyChange: TWebBrowserPropertyChange read FOnPropertyChange write FOnPropertyChange;
    property OnBeforeNavigate2: TWebBrowserBeforeNavigate2 read FOnBeforeNavigate2 write FOnBeforeNavigate2;
    property OnNewWindow2: TWebBrowserNewWindow2 read FOnNewWindow2 write FOnNewWindow2;
    property OnNavigateComplete2: TWebBrowserNavigateComplete2 read FOnNavigateComplete2 write FOnNavigateComplete2;
    property OnDocumentComplete: TWebBrowserDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property OnQuit: TNotifyEvent read FOnQuit write FOnQuit;
    property OnVisible: TWebBrowserOnVisible read FOnVisible write FOnVisible;
    property OnToolBar: TWebBrowserOnToolBar read FOnToolBar write FOnToolBar;
    property OnMenuBar: TWebBrowserOnMenuBar read FOnMenuBar write FOnMenuBar;
    property OnStatusBar: TWebBrowserOnStatusBar read FOnStatusBar write FOnStatusBar;
    property OnFullScreen: TWebBrowserOnFullScreen read FOnFullScreen write FOnFullScreen;
    property OnTheaterMode: TWebBrowserOnTheaterMode read FOnTheaterMode write FOnTheaterMode;
    property OnWindowSetResizable: TWebBrowserWindowSetResizable read FOnWindowSetResizable write FOnWindowSetResizable;
    property OnWindowSetLeft: TWebBrowserWindowSetLeft read FOnWindowSetLeft write FOnWindowSetLeft;
    property OnWindowSetTop: TWebBrowserWindowSetTop read FOnWindowSetTop write FOnWindowSetTop;
    property OnWindowSetWidth: TWebBrowserWindowSetWidth read FOnWindowSetWidth write FOnWindowSetWidth;
    property OnWindowSetHeight: TWebBrowserWindowSetHeight read FOnWindowSetHeight write FOnWindowSetHeight;
    property OnWindowClosing: TWebBrowserWindowClosing read FOnWindowClosing write FOnWindowClosing;
    property OnClientToHostWindow: TWebBrowserClientToHostWindow read FOnClientToHostWindow write FOnClientToHostWindow;
    property OnSetSecureLockIcon: TWebBrowserSetSecureLockIcon read FOnSetSecureLockIcon write FOnSetSecureLockIcon;
    property OnFileDownload: TWebBrowserFileDownload read FOnFileDownload write FOnFileDownload;
    property OnNavigateError: TWebBrowserNavigateError read FOnNavigateError write FOnNavigateError;
    property OnPrintTemplateInstantiation: TWebBrowserPrintTemplateInstantiation read FOnPrintTemplateInstantiation write FOnPrintTemplateInstantiation;
    property OnPrintTemplateTeardown: TWebBrowserPrintTemplateTeardown read FOnPrintTemplateTeardown write FOnPrintTemplateTeardown;
    property OnUpdatePageStatus: TWebBrowserUpdatePageStatus read FOnUpdatePageStatus write FOnUpdatePageStatus;
    property OnPrivacyImpactedStateChange: TWebBrowserPrivacyImpactedStateChange read FOnPrivacyImpactedStateChange write FOnPrivacyImpactedStateChange;
    property OnNewWindow3: TWebBrowserNewWindow3 read FOnNewWindow3 write FOnNewWindow3;
    property OnSetPhishingFilterStatus: TWebBrowserSetPhishingFilterStatus read FOnSetPhishingFilterStatus write FOnSetPhishingFilterStatus;
    property OnWindowStateChanged: TWebBrowserWindowStateChanged read FOnWindowStateChanged write FOnWindowStateChanged;
    property OnNewProcess: TWebBrowserNewProcess read FOnNewProcess write FOnNewProcess;
    property OnThirdPartyUrlBlocked: TWebBrowserThirdPartyUrlBlocked read FOnThirdPartyUrlBlocked write FOnThirdPartyUrlBlocked;
    property OnRedirectXDomainBlocked: TWebBrowserRedirectXDomainBlocked read FOnRedirectXDomainBlocked write FOnRedirectXDomainBlocked;
    property OnBeforeScriptExecute: TWebBrowserBeforeScriptExecute read FOnBeforeScriptExecute write FOnBeforeScriptExecute;
    property OnWebWorkerStarted: TWebBrowserWebWorkerStarted read FOnWebWorkerStarted write FOnWebWorkerStarted;
    property OnWebWorkerFinsihed: TWebBrowserWebWorkerFinsihed read FOnWebWorkerFinsihed write FOnWebWorkerFinsihed;
    /// <summary>
    ///    Event to get script error parameters and to handled showing of script error dialog
    /// </summary>
    property OnShowScriptError: TWebBrowserShowScriptError read FOnShowScriptError write FOnShowScriptError;
  end;

// *********************************************************************//
// The Class CoInternetExplorer provides a Create and CreateRemote method to
// create instances of the default interface IWebBrowser2 exposed by
// the CoClass InternetExplorer. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoInternetExplorer = class
    class function Create: IWebBrowser2;
    class function CreateRemote(const MachineName: string): IWebBrowser2;
  end;

  TInternetExplorerStatusTextChange = procedure(ASender: TObject; const Text: WideString) of object;
  TInternetExplorerProgressChange = procedure(ASender: TObject; Progress: Integer;
                                                                ProgressMax: Integer) of object;
  TInternetExplorerCommandStateChange = procedure(ASender: TObject; Command: Integer;
                                                                    Enable: WordBool) of object;
  TInternetExplorerTitleChange = procedure(ASender: TObject; const Text: WideString) of object;
  TInternetExplorerPropertyChange = procedure(ASender: TObject; const szProperty: WideString) of object;
  TInternetExplorerBeforeNavigate2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                 const URL: OleVariant;
                                                                 const Flags: OleVariant;
                                                                 const TargetFrameName: OleVariant;
                                                                 const PostData: OleVariant;
                                                                 const Headers: OleVariant;
                                                                 var Cancel: WordBool) of object;
  TInternetExplorerNewWindow2 = procedure(ASender: TObject; var ppDisp: IDispatch;
                                                            var Cancel: WordBool) of object;
  TInternetExplorerNavigateComplete2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                   const URL: OleVariant) of object;
  TInternetExplorerDocumentComplete = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                  const URL: OleVariant) of object;
  TInternetExplorerOnVisible = procedure(ASender: TObject; Visible: WordBool) of object;
  TInternetExplorerOnToolBar = procedure(ASender: TObject; ToolBar: WordBool) of object;
  TInternetExplorerOnMenuBar = procedure(ASender: TObject; MenuBar: WordBool) of object;
  TInternetExplorerOnStatusBar = procedure(ASender: TObject; StatusBar: WordBool) of object;
  TInternetExplorerOnFullScreen = procedure(ASender: TObject; FullScreen: WordBool) of object;
  TInternetExplorerOnTheaterMode = procedure(ASender: TObject; TheaterMode: WordBool) of object;
  TInternetExplorerWindowSetResizable = procedure(ASender: TObject; Resizable: WordBool) of object;
  TInternetExplorerWindowSetLeft = procedure(ASender: TObject; Left: Integer) of object;
  TInternetExplorerWindowSetTop = procedure(ASender: TObject; Top: Integer) of object;
  TInternetExplorerWindowSetWidth = procedure(ASender: TObject; Width: Integer) of object;
  TInternetExplorerWindowSetHeight = procedure(ASender: TObject; Height: Integer) of object;
  TInternetExplorerWindowClosing = procedure(ASender: TObject; IsChildWindow: WordBool;
                                                               var Cancel: WordBool) of object;
  TInternetExplorerClientToHostWindow = procedure(ASender: TObject; var CX: Integer; var CY: Integer) of object;
  TInternetExplorerSetSecureLockIcon = procedure(ASender: TObject; SecureLockIcon: Integer) of object;
  TInternetExplorerFileDownload = procedure(ASender: TObject; ActiveDocument: WordBool;
                                                              var Cancel: WordBool) of object;
  TInternetExplorerNavigateError = procedure(ASender: TObject; const pDisp: IDispatch;
                                                               const URL: OleVariant;
                                                               const Frame: OleVariant;
                                                               const StatusCode: OleVariant;
                                                               var Cancel: WordBool) of object;
  TInternetExplorerPrintTemplateInstantiation = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TInternetExplorerPrintTemplateTeardown = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TInternetExplorerUpdatePageStatus = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                  const nPage: OleVariant;
                                                                  const fDone: OleVariant) of object;
  TInternetExplorerPrivacyImpactedStateChange = procedure(ASender: TObject; bImpacted: WordBool) of object;
  TInternetExplorerNewWindow3 = procedure(ASender: TObject; var ppDisp: IDispatch;
                                                            var Cancel: WordBool;
                                                            dwFlags: LongWord;
                                                            const bstrUrlContext: WideString;
                                                            const bstrUrl: WideString) of object;
  TInternetExplorerSetPhishingFilterStatus = procedure(ASender: TObject; PhishingFilterStatus: Integer) of object;
  TInternetExplorerWindowStateChanged = procedure(ASender: TObject; dwWindowStateFlags: LongWord;
                                                                    dwValidFlagsMask: LongWord) of object;
  TInternetExplorerNewProcess = procedure(ASender: TObject; lCauseFlag: Integer;
                                                            const pWB2: IDispatch;
                                                            var Cancel: WordBool) of object;
  TInternetExplorerThirdPartyUrlBlocked = procedure(ASender: TObject; const URL: OleVariant;
                                                                      dwCount: LongWord) of object;
  TInternetExplorerRedirectXDomainBlocked = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                        const StartURL: OleVariant;
                                                                        const RedirectURL: OleVariant;
                                                                        const Frame: OleVariant;
                                                                        const StatusCode: OleVariant) of object;
  TInternetExplorerBeforeScriptExecute = procedure(ASender: TObject; const pDispWindow: IDispatch) of object;
  TInternetExplorerWebWorkerStarted = procedure(ASender: TObject; dwUniqueID: LongWord;
                                                                  const bstrWorkerLabel: WideString) of object;
  TInternetExplorerWebWorkerFinsihed = procedure(ASender: TObject; dwUniqueID: LongWord) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInternetExplorer
// Help String      : Internet Explorer Application.
// Default Interface: IWebBrowser2
// Def. Intf. DISP? : No
// Event   Interface: DWebBrowserEvents2
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TInternetExplorer = class(TOleServer)
  private
    FOnStatusTextChange: TInternetExplorerStatusTextChange;
    FOnProgressChange: TInternetExplorerProgressChange;
    FOnCommandStateChange: TInternetExplorerCommandStateChange;
    FOnDownloadBegin: TNotifyEvent;
    FOnDownloadComplete: TNotifyEvent;
    FOnTitleChange: TInternetExplorerTitleChange;
    FOnPropertyChange: TInternetExplorerPropertyChange;
    FOnBeforeNavigate2: TInternetExplorerBeforeNavigate2;
    FOnNewWindow2: TInternetExplorerNewWindow2;
    FOnNavigateComplete2: TInternetExplorerNavigateComplete2;
    FOnDocumentComplete: TInternetExplorerDocumentComplete;
    FOnQuit: TNotifyEvent;
    FOnVisible: TInternetExplorerOnVisible;
    FOnToolBar: TInternetExplorerOnToolBar;
    FOnMenuBar: TInternetExplorerOnMenuBar;
    FOnStatusBar: TInternetExplorerOnStatusBar;
    FOnFullScreen: TInternetExplorerOnFullScreen;
    FOnTheaterMode: TInternetExplorerOnTheaterMode;
    FOnWindowSetResizable: TInternetExplorerWindowSetResizable;
    FOnWindowSetLeft: TInternetExplorerWindowSetLeft;
    FOnWindowSetTop: TInternetExplorerWindowSetTop;
    FOnWindowSetWidth: TInternetExplorerWindowSetWidth;
    FOnWindowSetHeight: TInternetExplorerWindowSetHeight;
    FOnWindowClosing: TInternetExplorerWindowClosing;
    FOnClientToHostWindow: TInternetExplorerClientToHostWindow;
    FOnSetSecureLockIcon: TInternetExplorerSetSecureLockIcon;
    FOnFileDownload: TInternetExplorerFileDownload;
    FOnNavigateError: TInternetExplorerNavigateError;
    FOnPrintTemplateInstantiation: TInternetExplorerPrintTemplateInstantiation;
    FOnPrintTemplateTeardown: TInternetExplorerPrintTemplateTeardown;
    FOnUpdatePageStatus: TInternetExplorerUpdatePageStatus;
    FOnPrivacyImpactedStateChange: TInternetExplorerPrivacyImpactedStateChange;
    FOnNewWindow3: TInternetExplorerNewWindow3;
    FOnSetPhishingFilterStatus: TInternetExplorerSetPhishingFilterStatus;
    FOnWindowStateChanged: TInternetExplorerWindowStateChanged;
    FOnNewProcess: TInternetExplorerNewProcess;
    FOnThirdPartyUrlBlocked: TInternetExplorerThirdPartyUrlBlocked;
    FOnRedirectXDomainBlocked: TInternetExplorerRedirectXDomainBlocked;
    FOnBeforeScriptExecute: TInternetExplorerBeforeScriptExecute;
    FOnWebWorkerStarted: TInternetExplorerWebWorkerStarted;
    FOnWebWorkerFinsihed: TInternetExplorerWebWorkerFinsihed;
    FIntf: IWebBrowser2;
    function GetDefaultInterface: IWebBrowser2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Application: IDispatch;
    function Get_Parent: IDispatch;
    function Get_Container: IDispatch;
    function Get_Document: IDispatch;
    function Get_TopLevelContainer: WordBool;
    function Get_type_: WideString;
    function Get_Left: Integer;
    procedure Set_Left(pl: Integer);
    function Get_Top: Integer;
    procedure Set_Top(pl: Integer);
    function Get_Width: Integer;
    procedure Set_Width(pl: Integer);
    function Get_Height: Integer;
    procedure Set_Height(pl: Integer);
    function Get_LocationName: WideString;
    function Get_LocationURL: WideString;
    function Get_Busy: WordBool;
    function Get_Name: WideString;
    function Get_HWND: HWND;
    function Get_FullName: WideString;
    function Get_Path: WideString;
    function Get_Visible: WordBool;
    procedure Set_Visible(pBool: WordBool);
    function Get_StatusBar: WordBool;
    procedure Set_StatusBar(pBool: WordBool);
    function Get_StatusText: WideString;
    procedure Set_StatusText(const StatusText: WideString);
    function Get_ToolBar: SYSINT;
    procedure Set_ToolBar(Value: SYSINT);
    function Get_MenuBar: WordBool;
    procedure Set_MenuBar(Value: WordBool);
    function Get_FullScreen: WordBool;
    procedure Set_FullScreen(pbFullScreen: WordBool);
    function Get_ReadyState: tagREADYSTATE;
    function Get_Offline: WordBool;
    procedure Set_Offline(pbOffline: WordBool);
    function Get_Silent: WordBool;
    procedure Set_Silent(pbSilent: WordBool);
    function Get_RegisterAsBrowser: WordBool;
    procedure Set_RegisterAsBrowser(pbRegister: WordBool);
    function Get_RegisterAsDropTarget: WordBool;
    procedure Set_RegisterAsDropTarget(pbRegister: WordBool);
    function Get_TheaterMode: WordBool;
    procedure Set_TheaterMode(pbRegister: WordBool);
    function Get_AddressBar: WordBool;
    procedure Set_AddressBar(Value: WordBool);
    function Get_Resizable: WordBool;
    procedure Set_Resizable(Value: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IWebBrowser2);
    procedure Disconnect; override;
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
    procedure GoSearch;
    procedure Navigate(const URL: WideString); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); overload;
    procedure Refresh;
    procedure Refresh2; overload;
    procedure Refresh2(const Level: OleVariant); overload;
    procedure Stop;
    procedure Quit;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant);
    function GetProperty(const Property_: WideString): OleVariant;
    procedure Navigate2(const URL: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant;
                        const Headers: OleVariant); overload;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                     var pvaOut: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                             const pvarSize: OleVariant); overload;
    property DefaultInterface: IWebBrowser2 read GetDefaultInterface;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Container: IDispatch read Get_Container;
    property Document: IDispatch read Get_Document;
    property TopLevelContainer: WordBool read Get_TopLevelContainer;
    property type_: WideString read Get_type_;
    property LocationName: WideString read Get_LocationName;
    property LocationURL: WideString read Get_LocationURL;
    property Busy: WordBool read Get_Busy;
    property Name: WideString read Get_Name;
    property HWND: HWND read Get_HWND;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property ReadyState: tagREADYSTATE read Get_ReadyState;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property ToolBar: SYSINT read Get_ToolBar write Set_ToolBar;
    property MenuBar: WordBool read Get_MenuBar write Set_MenuBar;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen;
    property Offline: WordBool read Get_Offline write Set_Offline;
    property Silent: WordBool read Get_Silent write Set_Silent;
    property RegisterAsBrowser: WordBool read Get_RegisterAsBrowser write Set_RegisterAsBrowser;
    property RegisterAsDropTarget: WordBool read Get_RegisterAsDropTarget write Set_RegisterAsDropTarget;
    property TheaterMode: WordBool read Get_TheaterMode write Set_TheaterMode;
    property AddressBar: WordBool read Get_AddressBar write Set_AddressBar;
    property Resizable: WordBool read Get_Resizable write Set_Resizable;
  published
    property OnStatusTextChange: TInternetExplorerStatusTextChange read FOnStatusTextChange write FOnStatusTextChange;
    property OnProgressChange: TInternetExplorerProgressChange read FOnProgressChange write FOnProgressChange;
    property OnCommandStateChange: TInternetExplorerCommandStateChange read FOnCommandStateChange write FOnCommandStateChange;
    property OnDownloadBegin: TNotifyEvent read FOnDownloadBegin write FOnDownloadBegin;
    property OnDownloadComplete: TNotifyEvent read FOnDownloadComplete write FOnDownloadComplete;
    property OnTitleChange: TInternetExplorerTitleChange read FOnTitleChange write FOnTitleChange;
    property OnPropertyChange: TInternetExplorerPropertyChange read FOnPropertyChange write FOnPropertyChange;
    property OnBeforeNavigate2: TInternetExplorerBeforeNavigate2 read FOnBeforeNavigate2 write FOnBeforeNavigate2;
    property OnNewWindow2: TInternetExplorerNewWindow2 read FOnNewWindow2 write FOnNewWindow2;
    property OnNavigateComplete2: TInternetExplorerNavigateComplete2 read FOnNavigateComplete2 write FOnNavigateComplete2;
    property OnDocumentComplete: TInternetExplorerDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property OnQuit: TNotifyEvent read FOnQuit write FOnQuit;
    property OnVisible: TInternetExplorerOnVisible read FOnVisible write FOnVisible;
    property OnToolBar: TInternetExplorerOnToolBar read FOnToolBar write FOnToolBar;
    property OnMenuBar: TInternetExplorerOnMenuBar read FOnMenuBar write FOnMenuBar;
    property OnStatusBar: TInternetExplorerOnStatusBar read FOnStatusBar write FOnStatusBar;
    property OnFullScreen: TInternetExplorerOnFullScreen read FOnFullScreen write FOnFullScreen;
    property OnTheaterMode: TInternetExplorerOnTheaterMode read FOnTheaterMode write FOnTheaterMode;
    property OnWindowSetResizable: TInternetExplorerWindowSetResizable read FOnWindowSetResizable write FOnWindowSetResizable;
    property OnWindowSetLeft: TInternetExplorerWindowSetLeft read FOnWindowSetLeft write FOnWindowSetLeft;
    property OnWindowSetTop: TInternetExplorerWindowSetTop read FOnWindowSetTop write FOnWindowSetTop;
    property OnWindowSetWidth: TInternetExplorerWindowSetWidth read FOnWindowSetWidth write FOnWindowSetWidth;
    property OnWindowSetHeight: TInternetExplorerWindowSetHeight read FOnWindowSetHeight write FOnWindowSetHeight;
    property OnWindowClosing: TInternetExplorerWindowClosing read FOnWindowClosing write FOnWindowClosing;
    property OnClientToHostWindow: TInternetExplorerClientToHostWindow read FOnClientToHostWindow write FOnClientToHostWindow;
    property OnSetSecureLockIcon: TInternetExplorerSetSecureLockIcon read FOnSetSecureLockIcon write FOnSetSecureLockIcon;
    property OnFileDownload: TInternetExplorerFileDownload read FOnFileDownload write FOnFileDownload;
    property OnNavigateError: TInternetExplorerNavigateError read FOnNavigateError write FOnNavigateError;
    property OnPrintTemplateInstantiation: TInternetExplorerPrintTemplateInstantiation read FOnPrintTemplateInstantiation write FOnPrintTemplateInstantiation;
    property OnPrintTemplateTeardown: TInternetExplorerPrintTemplateTeardown read FOnPrintTemplateTeardown write FOnPrintTemplateTeardown;
    property OnUpdatePageStatus: TInternetExplorerUpdatePageStatus read FOnUpdatePageStatus write FOnUpdatePageStatus;
    property OnPrivacyImpactedStateChange: TInternetExplorerPrivacyImpactedStateChange read FOnPrivacyImpactedStateChange write FOnPrivacyImpactedStateChange;
    property OnNewWindow3: TInternetExplorerNewWindow3 read FOnNewWindow3 write FOnNewWindow3;
    property OnSetPhishingFilterStatus: TInternetExplorerSetPhishingFilterStatus read FOnSetPhishingFilterStatus write FOnSetPhishingFilterStatus;
    property OnWindowStateChanged: TInternetExplorerWindowStateChanged read FOnWindowStateChanged write FOnWindowStateChanged;
    property OnNewProcess: TInternetExplorerNewProcess read FOnNewProcess write FOnNewProcess;
    property OnThirdPartyUrlBlocked: TInternetExplorerThirdPartyUrlBlocked read FOnThirdPartyUrlBlocked write FOnThirdPartyUrlBlocked;
    property OnRedirectXDomainBlocked: TInternetExplorerRedirectXDomainBlocked read FOnRedirectXDomainBlocked write FOnRedirectXDomainBlocked;
    property OnBeforeScriptExecute: TInternetExplorerBeforeScriptExecute read FOnBeforeScriptExecute write FOnBeforeScriptExecute;
    property OnWebWorkerStarted: TInternetExplorerWebWorkerStarted read FOnWebWorkerStarted write FOnWebWorkerStarted;
    property OnWebWorkerFinsihed: TInternetExplorerWebWorkerFinsihed read FOnWebWorkerFinsihed write FOnWebWorkerFinsihed;
  end;

// *********************************************************************//
// The Class CoInternetExplorerMedium provides a Create and CreateRemote method to
// create instances of the default interface IWebBrowser2 exposed by
// the CoClass InternetExplorerMedium. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoInternetExplorerMedium = class
    class function Create: IWebBrowser2;
    class function CreateRemote(const MachineName: string): IWebBrowser2;
  end;

  TInternetExplorerMediumStatusTextChange = procedure(ASender: TObject; const Text: WideString) of object;
  TInternetExplorerMediumProgressChange = procedure(ASender: TObject; Progress: Integer;
                                                                      ProgressMax: Integer) of object;
  TInternetExplorerMediumCommandStateChange = procedure(ASender: TObject; Command: Integer;
                                                                          Enable: WordBool) of object;
  TInternetExplorerMediumTitleChange = procedure(ASender: TObject; const Text: WideString) of object;
  TInternetExplorerMediumPropertyChange = procedure(ASender: TObject; const szProperty: WideString) of object;
  TInternetExplorerMediumBeforeNavigate2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                       const URL: OleVariant;
                                                                       const Flags: OleVariant;
                                                                       const TargetFrameName: OleVariant;
                                                                       const PostData: OleVariant;
                                                                       const Headers: OleVariant;
                                                                       var Cancel: WordBool) of object;
  TInternetExplorerMediumNewWindow2 = procedure(ASender: TObject; var ppDisp: IDispatch;
                                                                  var Cancel: WordBool) of object;
  TInternetExplorerMediumNavigateComplete2 = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                         const URL: OleVariant) of object;
  TInternetExplorerMediumDocumentComplete = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                        const URL: OleVariant) of object;
  TInternetExplorerMediumOnVisible = procedure(ASender: TObject; Visible: WordBool) of object;
  TInternetExplorerMediumOnToolBar = procedure(ASender: TObject; ToolBar: WordBool) of object;
  TInternetExplorerMediumOnMenuBar = procedure(ASender: TObject; MenuBar: WordBool) of object;
  TInternetExplorerMediumOnStatusBar = procedure(ASender: TObject; StatusBar: WordBool) of object;
  TInternetExplorerMediumOnFullScreen = procedure(ASender: TObject; FullScreen: WordBool) of object;
  TInternetExplorerMediumOnTheaterMode = procedure(ASender: TObject; TheaterMode: WordBool) of object;
  TInternetExplorerMediumWindowSetResizable = procedure(ASender: TObject; Resizable: WordBool) of object;
  TInternetExplorerMediumWindowSetLeft = procedure(ASender: TObject; Left: Integer) of object;
  TInternetExplorerMediumWindowSetTop = procedure(ASender: TObject; Top: Integer) of object;
  TInternetExplorerMediumWindowSetWidth = procedure(ASender: TObject; Width: Integer) of object;
  TInternetExplorerMediumWindowSetHeight = procedure(ASender: TObject; Height: Integer) of object;
  TInternetExplorerMediumWindowClosing = procedure(ASender: TObject; IsChildWindow: WordBool;
                                                                     var Cancel: WordBool) of object;
  TInternetExplorerMediumClientToHostWindow = procedure(ASender: TObject; var CX: Integer;
                                                                          var CY: Integer) of object;
  TInternetExplorerMediumSetSecureLockIcon = procedure(ASender: TObject; SecureLockIcon: Integer) of object;
  TInternetExplorerMediumFileDownload = procedure(ASender: TObject; ActiveDocument: WordBool;
                                                                    var Cancel: WordBool) of object;
  TInternetExplorerMediumNavigateError = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                     const URL: OleVariant;
                                                                     const Frame: OleVariant;
                                                                     const StatusCode: OleVariant;
                                                                     var Cancel: WordBool) of object;
  TInternetExplorerMediumPrintTemplateInstantiation = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TInternetExplorerMediumPrintTemplateTeardown = procedure(ASender: TObject; const pDisp: IDispatch) of object;
  TInternetExplorerMediumUpdatePageStatus = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                        const nPage: OleVariant;
                                                                        const fDone: OleVariant) of object;
  TInternetExplorerMediumPrivacyImpactedStateChange = procedure(ASender: TObject; bImpacted: WordBool) of object;
  TInternetExplorerMediumNewWindow3 = procedure(ASender: TObject; var ppDisp: IDispatch;
                                                                  var Cancel: WordBool;
                                                                  dwFlags: LongWord;
                                                                  const bstrUrlContext: WideString;
                                                                  const bstrUrl: WideString) of object;
  TInternetExplorerMediumSetPhishingFilterStatus = procedure(ASender: TObject; PhishingFilterStatus: Integer) of object;
  TInternetExplorerMediumWindowStateChanged = procedure(ASender: TObject; dwWindowStateFlags: LongWord;
                                                                          dwValidFlagsMask: LongWord) of object;
  TInternetExplorerMediumNewProcess = procedure(ASender: TObject; lCauseFlag: Integer;
                                                                  const pWB2: IDispatch;
                                                                  var Cancel: WordBool) of object;
  TInternetExplorerMediumThirdPartyUrlBlocked = procedure(ASender: TObject; const URL: OleVariant;
                                                                            dwCount: LongWord) of object;
  TInternetExplorerMediumRedirectXDomainBlocked = procedure(ASender: TObject; const pDisp: IDispatch;
                                                                              const StartURL: OleVariant;
                                                                              const RedirectURL: OleVariant;
                                                                              const Frame: OleVariant;
                                                                              const StatusCode: OleVariant) of object;
  TInternetExplorerMediumBeforeScriptExecute = procedure(ASender: TObject; const pDispWindow: IDispatch) of object;
  TInternetExplorerMediumWebWorkerStarted = procedure(ASender: TObject; dwUniqueID: LongWord;
                                                                        const bstrWorkerLabel: WideString) of object;
  TInternetExplorerMediumWebWorkerFinsihed = procedure(ASender: TObject; dwUniqueID: LongWord) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInternetExplorerMedium
// Help String      : Internet Explorer Application with default integrity of Medium
// Default Interface: IWebBrowser2
// Def. Intf. DISP? : No
// Event   Interface: DWebBrowserEvents2
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TInternetExplorerMedium = class(TOleServer)
  private
    FOnStatusTextChange: TInternetExplorerMediumStatusTextChange;
    FOnProgressChange: TInternetExplorerMediumProgressChange;
    FOnCommandStateChange: TInternetExplorerMediumCommandStateChange;
    FOnDownloadBegin: TNotifyEvent;
    FOnDownloadComplete: TNotifyEvent;
    FOnTitleChange: TInternetExplorerMediumTitleChange;
    FOnPropertyChange: TInternetExplorerMediumPropertyChange;
    FOnBeforeNavigate2: TInternetExplorerMediumBeforeNavigate2;
    FOnNewWindow2: TInternetExplorerMediumNewWindow2;
    FOnNavigateComplete2: TInternetExplorerMediumNavigateComplete2;
    FOnDocumentComplete: TInternetExplorerMediumDocumentComplete;
    FOnQuit: TNotifyEvent;
    FOnVisible: TInternetExplorerMediumOnVisible;
    FOnToolBar: TInternetExplorerMediumOnToolBar;
    FOnMenuBar: TInternetExplorerMediumOnMenuBar;
    FOnStatusBar: TInternetExplorerMediumOnStatusBar;
    FOnFullScreen: TInternetExplorerMediumOnFullScreen;
    FOnTheaterMode: TInternetExplorerMediumOnTheaterMode;
    FOnWindowSetResizable: TInternetExplorerMediumWindowSetResizable;
    FOnWindowSetLeft: TInternetExplorerMediumWindowSetLeft;
    FOnWindowSetTop: TInternetExplorerMediumWindowSetTop;
    FOnWindowSetWidth: TInternetExplorerMediumWindowSetWidth;
    FOnWindowSetHeight: TInternetExplorerMediumWindowSetHeight;
    FOnWindowClosing: TInternetExplorerMediumWindowClosing;
    FOnClientToHostWindow: TInternetExplorerMediumClientToHostWindow;
    FOnSetSecureLockIcon: TInternetExplorerMediumSetSecureLockIcon;
    FOnFileDownload: TInternetExplorerMediumFileDownload;
    FOnNavigateError: TInternetExplorerMediumNavigateError;
    FOnPrintTemplateInstantiation: TInternetExplorerMediumPrintTemplateInstantiation;
    FOnPrintTemplateTeardown: TInternetExplorerMediumPrintTemplateTeardown;
    FOnUpdatePageStatus: TInternetExplorerMediumUpdatePageStatus;
    FOnPrivacyImpactedStateChange: TInternetExplorerMediumPrivacyImpactedStateChange;
    FOnNewWindow3: TInternetExplorerMediumNewWindow3;
    FOnSetPhishingFilterStatus: TInternetExplorerMediumSetPhishingFilterStatus;
    FOnWindowStateChanged: TInternetExplorerMediumWindowStateChanged;
    FOnNewProcess: TInternetExplorerMediumNewProcess;
    FOnThirdPartyUrlBlocked: TInternetExplorerMediumThirdPartyUrlBlocked;
    FOnRedirectXDomainBlocked: TInternetExplorerMediumRedirectXDomainBlocked;
    FOnBeforeScriptExecute: TInternetExplorerMediumBeforeScriptExecute;
    FOnWebWorkerStarted: TInternetExplorerMediumWebWorkerStarted;
    FOnWebWorkerFinsihed: TInternetExplorerMediumWebWorkerFinsihed;
    FIntf: IWebBrowser2;
    function GetDefaultInterface: IWebBrowser2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Application: IDispatch;
    function Get_Parent: IDispatch;
    function Get_Container: IDispatch;
    function Get_Document: IDispatch;
    function Get_TopLevelContainer: WordBool;
    function Get_type_: WideString;
    function Get_Left: Integer;
    procedure Set_Left(pl: Integer);
    function Get_Top: Integer;
    procedure Set_Top(pl: Integer);
    function Get_Width: Integer;
    procedure Set_Width(pl: Integer);
    function Get_Height: Integer;
    procedure Set_Height(pl: Integer);
    function Get_LocationName: WideString;
    function Get_LocationURL: WideString;
    function Get_Busy: WordBool;
    function Get_Name: WideString;
    function Get_HWND: HWND;
    function Get_FullName: WideString;
    function Get_Path: WideString;
    function Get_Visible: WordBool;
    procedure Set_Visible(pBool: WordBool);
    function Get_StatusBar: WordBool;
    procedure Set_StatusBar(pBool: WordBool);
    function Get_StatusText: WideString;
    procedure Set_StatusText(const StatusText: WideString);
    function Get_ToolBar: SYSINT;
    procedure Set_ToolBar(Value: SYSINT);
    function Get_MenuBar: WordBool;
    procedure Set_MenuBar(Value: WordBool);
    function Get_FullScreen: WordBool;
    procedure Set_FullScreen(pbFullScreen: WordBool);
    function Get_ReadyState: tagREADYSTATE;
    function Get_Offline: WordBool;
    procedure Set_Offline(pbOffline: WordBool);
    function Get_Silent: WordBool;
    procedure Set_Silent(pbSilent: WordBool);
    function Get_RegisterAsBrowser: WordBool;
    procedure Set_RegisterAsBrowser(pbRegister: WordBool);
    function Get_RegisterAsDropTarget: WordBool;
    procedure Set_RegisterAsDropTarget(pbRegister: WordBool);
    function Get_TheaterMode: WordBool;
    procedure Set_TheaterMode(pbRegister: WordBool);
    function Get_AddressBar: WordBool;
    procedure Set_AddressBar(Value: WordBool);
    function Get_Resizable: WordBool;
    procedure Set_Resizable(Value: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IWebBrowser2);
    procedure Disconnect; override;
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
    procedure GoSearch;
    procedure Navigate(const URL: WideString); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
                       const TargetFrameName: OleVariant; const PostData: OleVariant;
                       const Headers: OleVariant); overload;
    procedure Refresh;
    procedure Refresh2; overload;
    procedure Refresh2(const Level: OleVariant); overload;
    procedure Stop;
    procedure Quit;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
    procedure PutProperty(const Property_: WideString; vtValue: OleVariant);
    function GetProperty(const Property_: WideString): OleVariant;
    procedure Navigate2(const URL: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant); overload;
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
                        const TargetFrameName: OleVariant; const PostData: OleVariant;
                        const Headers: OleVariant); overload;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant); overload;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                     var pvaOut: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant); overload;
    procedure ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                             const pvarSize: OleVariant); overload;
    property DefaultInterface: IWebBrowser2 read GetDefaultInterface;
    property Application: IDispatch read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Container: IDispatch read Get_Container;
    property Document: IDispatch read Get_Document;
    property TopLevelContainer: WordBool read Get_TopLevelContainer;
    property type_: WideString read Get_type_;
    property LocationName: WideString read Get_LocationName;
    property LocationURL: WideString read Get_LocationURL;
    property Busy: WordBool read Get_Busy;
    property Name: WideString read Get_Name;
    property HWND: HWND read Get_HWND;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property ReadyState: tagREADYSTATE read Get_ReadyState;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property ToolBar: SYSINT read Get_ToolBar write Set_ToolBar;
    property MenuBar: WordBool read Get_MenuBar write Set_MenuBar;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen;
    property Offline: WordBool read Get_Offline write Set_Offline;
    property Silent: WordBool read Get_Silent write Set_Silent;
    property RegisterAsBrowser: WordBool read Get_RegisterAsBrowser write Set_RegisterAsBrowser;
    property RegisterAsDropTarget: WordBool read Get_RegisterAsDropTarget write Set_RegisterAsDropTarget;
    property TheaterMode: WordBool read Get_TheaterMode write Set_TheaterMode;
    property AddressBar: WordBool read Get_AddressBar write Set_AddressBar;
    property Resizable: WordBool read Get_Resizable write Set_Resizable;
  published
    property OnStatusTextChange: TInternetExplorerMediumStatusTextChange read FOnStatusTextChange write FOnStatusTextChange;
    property OnProgressChange: TInternetExplorerMediumProgressChange read FOnProgressChange write FOnProgressChange;
    property OnCommandStateChange: TInternetExplorerMediumCommandStateChange read FOnCommandStateChange write FOnCommandStateChange;
    property OnDownloadBegin: TNotifyEvent read FOnDownloadBegin write FOnDownloadBegin;
    property OnDownloadComplete: TNotifyEvent read FOnDownloadComplete write FOnDownloadComplete;
    property OnTitleChange: TInternetExplorerMediumTitleChange read FOnTitleChange write FOnTitleChange;
    property OnPropertyChange: TInternetExplorerMediumPropertyChange read FOnPropertyChange write FOnPropertyChange;
    property OnBeforeNavigate2: TInternetExplorerMediumBeforeNavigate2 read FOnBeforeNavigate2 write FOnBeforeNavigate2;
    property OnNewWindow2: TInternetExplorerMediumNewWindow2 read FOnNewWindow2 write FOnNewWindow2;
    property OnNavigateComplete2: TInternetExplorerMediumNavigateComplete2 read FOnNavigateComplete2 write FOnNavigateComplete2;
    property OnDocumentComplete: TInternetExplorerMediumDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property OnQuit: TNotifyEvent read FOnQuit write FOnQuit;
    property OnVisible: TInternetExplorerMediumOnVisible read FOnVisible write FOnVisible;
    property OnToolBar: TInternetExplorerMediumOnToolBar read FOnToolBar write FOnToolBar;
    property OnMenuBar: TInternetExplorerMediumOnMenuBar read FOnMenuBar write FOnMenuBar;
    property OnStatusBar: TInternetExplorerMediumOnStatusBar read FOnStatusBar write FOnStatusBar;
    property OnFullScreen: TInternetExplorerMediumOnFullScreen read FOnFullScreen write FOnFullScreen;
    property OnTheaterMode: TInternetExplorerMediumOnTheaterMode read FOnTheaterMode write FOnTheaterMode;
    property OnWindowSetResizable: TInternetExplorerMediumWindowSetResizable read FOnWindowSetResizable write FOnWindowSetResizable;
    property OnWindowSetLeft: TInternetExplorerMediumWindowSetLeft read FOnWindowSetLeft write FOnWindowSetLeft;
    property OnWindowSetTop: TInternetExplorerMediumWindowSetTop read FOnWindowSetTop write FOnWindowSetTop;
    property OnWindowSetWidth: TInternetExplorerMediumWindowSetWidth read FOnWindowSetWidth write FOnWindowSetWidth;
    property OnWindowSetHeight: TInternetExplorerMediumWindowSetHeight read FOnWindowSetHeight write FOnWindowSetHeight;
    property OnWindowClosing: TInternetExplorerMediumWindowClosing read FOnWindowClosing write FOnWindowClosing;
    property OnClientToHostWindow: TInternetExplorerMediumClientToHostWindow read FOnClientToHostWindow write FOnClientToHostWindow;
    property OnSetSecureLockIcon: TInternetExplorerMediumSetSecureLockIcon read FOnSetSecureLockIcon write FOnSetSecureLockIcon;
    property OnFileDownload: TInternetExplorerMediumFileDownload read FOnFileDownload write FOnFileDownload;
    property OnNavigateError: TInternetExplorerMediumNavigateError read FOnNavigateError write FOnNavigateError;
    property OnPrintTemplateInstantiation: TInternetExplorerMediumPrintTemplateInstantiation read FOnPrintTemplateInstantiation write FOnPrintTemplateInstantiation;
    property OnPrintTemplateTeardown: TInternetExplorerMediumPrintTemplateTeardown read FOnPrintTemplateTeardown write FOnPrintTemplateTeardown;
    property OnUpdatePageStatus: TInternetExplorerMediumUpdatePageStatus read FOnUpdatePageStatus write FOnUpdatePageStatus;
    property OnPrivacyImpactedStateChange: TInternetExplorerMediumPrivacyImpactedStateChange read FOnPrivacyImpactedStateChange write FOnPrivacyImpactedStateChange;
    property OnNewWindow3: TInternetExplorerMediumNewWindow3 read FOnNewWindow3 write FOnNewWindow3;
    property OnSetPhishingFilterStatus: TInternetExplorerMediumSetPhishingFilterStatus read FOnSetPhishingFilterStatus write FOnSetPhishingFilterStatus;
    property OnWindowStateChanged: TInternetExplorerMediumWindowStateChanged read FOnWindowStateChanged write FOnWindowStateChanged;
    property OnNewProcess: TInternetExplorerMediumNewProcess read FOnNewProcess write FOnNewProcess;
    property OnThirdPartyUrlBlocked: TInternetExplorerMediumThirdPartyUrlBlocked read FOnThirdPartyUrlBlocked write FOnThirdPartyUrlBlocked;
    property OnRedirectXDomainBlocked: TInternetExplorerMediumRedirectXDomainBlocked read FOnRedirectXDomainBlocked write FOnRedirectXDomainBlocked;
    property OnBeforeScriptExecute: TInternetExplorerMediumBeforeScriptExecute read FOnBeforeScriptExecute write FOnBeforeScriptExecute;
    property OnWebWorkerStarted: TInternetExplorerMediumWebWorkerStarted read FOnWebWorkerStarted write FOnWebWorkerStarted;
    property OnWebWorkerFinsihed: TInternetExplorerMediumWebWorkerFinsihed read FOnWebWorkerFinsihed write FOnWebWorkerFinsihed;
  end;

// *********************************************************************//
// The Class CoShellBrowserWindow provides a Create and CreateRemote method to
// create instances of the default interface IWebBrowser2 exposed by
// the CoClass ShellBrowserWindow. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoShellBrowserWindow = class
    class function Create: IWebBrowser2;
    class function CreateRemote(const MachineName: string): IWebBrowser2;
  end;

// *********************************************************************//
// The Class CoShellWindows provides a Create and CreateRemote method to
// create instances of the default interface IShellWindows exposed by
// the CoClass ShellWindows. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoShellWindows = class
    class function Create: IShellWindows;
    class function CreateRemote(const MachineName: string): IShellWindows;
  end;

  TShellWindowsWindowRegistered = procedure(ASender: TObject; lCookie: Integer) of object;
  TShellWindowsWindowRevoked = procedure(ASender: TObject; lCookie: Integer) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TShellWindows
// Help String      : ShellDispatch Load in Shell Context
// Default Interface: IShellWindows
// Def. Intf. DISP? : No
// Event   Interface: DShellWindowsEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TShellWindows = class(TOleServer)
  private
    FOnWindowRegistered: TShellWindowsWindowRegistered;
    FOnWindowRevoked: TShellWindowsWindowRevoked;
    FIntf: IShellWindows;
    function GetDefaultInterface: IShellWindows;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IShellWindows);
    procedure Disconnect; override;
    function Item: IDispatch; overload;
    function Item(index: OleVariant): IDispatch; overload;
    function _NewEnum: IUnknown;
    procedure Register(const pid: IDispatch; HWND: Integer; swClass: SYSINT; out plCookie: Integer);
    procedure RegisterPending(lThreadId: Integer; const pvarloc: OleVariant;
                              const pvarlocRoot: OleVariant; swClass: SYSINT; out plCookie: Integer);
    procedure Revoke(lCookie: Integer);
    procedure OnNavigate(lCookie: Integer; const pvarloc: OleVariant);
    procedure OnActivated(lCookie: Integer; fActive: WordBool);
    function FindWindowSW(const pvarloc: OleVariant; const pvarlocRoot: OleVariant;
                          swClass: SYSINT; out pHWND: Integer; swfwOptions: SYSINT): IDispatch;
    procedure OnCreated(lCookie: Integer; const punk: IUnknown);
    procedure ProcessAttachDetach(fAttach: WordBool);
    property DefaultInterface: IShellWindows read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
    property OnWindowRegistered: TShellWindowsWindowRegistered read FOnWindowRegistered write FOnWindowRegistered;
    property OnWindowRevoked: TShellWindowsWindowRevoked read FOnWindowRevoked write FOnWindowRevoked;
  end;

// *********************************************************************//
// The Class CoShellUIHelper provides a Create and CreateRemote method to
// create instances of the default interface IShellUIHelper6 exposed by
// the CoClass ShellUIHelper. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoShellUIHelper = class
    class function Create: IShellUIHelper6;
    class function CreateRemote(const MachineName: string): IShellUIHelper6;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TShellUIHelper
// Help String      :
// Default Interface: IShellUIHelper6
// Def. Intf. DISP? : No
// Event   Interface:
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TShellUIHelper = class(TOleServer)
  private
    FIntf: IShellUIHelper6;
    function GetDefaultInterface: IShellUIHelper6;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IShellUIHelper6);
    procedure Disconnect; override;
    procedure ResetFirstBootMode;
    procedure ResetSafeMode;
    procedure RefreshOfflineDesktop;
    procedure AddFavorite(const URL: WideString); overload;
    procedure AddFavorite(const URL: WideString; const Title: OleVariant); overload;
    procedure AddChannel(const URL: WideString);
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString); overload;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant); overload;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant); overload;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant); overload;
    procedure AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                  const Left: OleVariant; const Top: OleVariant;
                                  const Width: OleVariant; const Height: OleVariant); overload;
    function IsSubscribed(const URL: WideString): WordBool;
    procedure NavigateAndFind(const URL: WideString; const strQuery: WideString;
                              const varTargetFrame: OleVariant);
    procedure ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString);
    procedure AutoCompleteSaveForm; overload;
    procedure AutoCompleteSaveForm(const Form: OleVariant); overload;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString); overload;
    procedure AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                       const pvarTargetFrame: OleVariant); overload;
    procedure AutoCompleteAttach; overload;
    procedure AutoCompleteAttach(const Reserved: OleVariant); overload;
    function ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant;
    procedure AddSearchProvider(const URL: WideString);
    procedure RunOnceShown;
    procedure SkipRunOnce;
    procedure CustomizeSettings(fSQM: WordBool; fPhishing: WordBool; const bstrLocale: WideString);
    function SqmEnabled: WordBool;
    function PhishingEnabled: WordBool;
    function BrandImageUri: WideString;
    procedure SkipTabsWelcome;
    procedure DiagnoseConnection;
    procedure CustomizeClearType(fSet: WordBool);
    function IsSearchProviderInstalled(const URL: WideString): LongWord;
    function IsSearchMigrated: WordBool;
    function DefaultSearchProvider: WideString;
    procedure RunOnceRequiredSettingsComplete(fComplete: WordBool);
    function RunOnceHasShown: WordBool;
    function SearchGuideUrl: WideString;
    procedure AddService(const URL: WideString);
    function IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord;
    function InPrivateFilteringEnabled: WordBool;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString); overload;
    procedure AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                const Type_: OleVariant); overload;
    procedure BuildNewTabPage;
    procedure SetRecentlyClosedVisible(fVisible: WordBool);
    procedure SetActivitiesVisible(fVisible: WordBool);
    procedure ContentDiscoveryReset;
    function IsSuggestedSitesEnabled: WordBool;
    procedure EnableSuggestedSites(fEnable: WordBool);
    procedure NavigateToSuggestedSites(const bstrRelativeUrl: WideString);
    procedure ShowTabsHelp;
    procedure ShowInPrivateHelp;
    function msIsSiteMode: WordBool;
    procedure msSiteModeShowThumbBar;
    function msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                         const bstrTooltip: WideString): OleVariant;
    procedure msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                             fVisible: WordBool);
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString); overload;
    procedure msSiteModeSetIconOverlay(const IconUrl: WideString; const pvarDescription: OleVariant); overload;
    procedure msSiteModeClearIconOverlay;
    procedure msAddSiteMode;
    procedure msSiteModeCreateJumpList(const bstrHeader: WideString);
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString); overload;
    procedure msSiteModeAddJumpListItem(const bstrName: WideString;
                                        const bstrActionUri: WideString;
                                        const bstrIconUri: WideString;
                                        const pvarWindowType: OleVariant); overload;
    procedure msSiteModeClearJumpList;
    procedure msSiteModeShowJumpList;
    function msSiteModeAddButtonStyle(uiButtonID: OleVariant; const bstrIconURL: WideString;
                                      const bstrTooltip: WideString): OleVariant;
    procedure msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant);
    procedure msSiteModeActivate;
    function msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant;
    procedure msAddTrackingProtectionList(const URL: WideString; const bstrFilterName: WideString);
    function msTrackingProtectionEnabled: WordBool;
    function msActiveXFilteringEnabled: WordBool;
    function msProvisionNetworks(const bstrProvisioningXml: WideString): OleVariant;
    procedure msReportSafeUrl;
    procedure msSiteModeRefreshBadge;
    procedure msSiteModeClearBadge;
    procedure msDiagnoseConnectionUILess;
    procedure msLaunchNetworkClientHelp;
    procedure msChangeDefaultBrowser(fChange: WordBool);
    procedure msStopPeriodicTileUpdate;
    procedure msStartPeriodicTileUpdate(pollingUris: OleVariant); overload;
    procedure msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant); overload;
    procedure msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant;
                                        uiUpdateRecurrence: OleVariant); overload;
    procedure msStartPeriodicTileUpdateBatch(pollingUris: OleVariant); overload;
    procedure msStartPeriodicTileUpdateBatch(pollingUris: OleVariant; startTime: OleVariant); overload;
    procedure msStartPeriodicTileUpdateBatch(pollingUris: OleVariant; startTime: OleVariant;
                                             uiUpdateRecurrence: OleVariant); overload;
    procedure msClearTile;
    procedure msEnableTileNotificationQueue(fChange: WordBool);
    function msPinnedSiteState: OleVariant;
    procedure msEnableTileNotificationQueueForSquare150x150(fChange: WordBool);
    procedure msEnableTileNotificationQueueForWide310x150(fChange: WordBool);
    procedure msEnableTileNotificationQueueForSquare310x310(fChange: WordBool);
    procedure msScheduledTileNotification(const bstrNotificationXml: WideString;
                                          const bstrNotificationId: WideString;
                                          const bstrNotificationTag: WideString); overload;
    procedure msScheduledTileNotification(const bstrNotificationXml: WideString;
                                          const bstrNotificationId: WideString;
                                          const bstrNotificationTag: WideString;
                                          startTime: OleVariant); overload;
    procedure msScheduledTileNotification(const bstrNotificationXml: WideString;
                                          const bstrNotificationId: WideString;
                                          const bstrNotificationTag: WideString;
                                          startTime: OleVariant; expirationTime: OleVariant); overload;
    procedure msRemoveScheduledTileNotification(const bstrNotificationId: WideString);
    procedure msStartPeriodicBadgeUpdate(const pollingUri: WideString); overload;
    procedure msStartPeriodicBadgeUpdate(const pollingUri: WideString; startTime: OleVariant); overload;
    procedure msStartPeriodicBadgeUpdate(const pollingUri: WideString; startTime: OleVariant;
                                         uiUpdateRecurrence: OleVariant); overload;
    procedure msStopPeriodicBadgeUpdate;
    procedure msLaunchInternetOptions;
    property DefaultInterface: IShellUIHelper6 read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoShellNameSpace provides a Create and CreateRemote method to
// create instances of the default interface IShellNameSpace exposed by
// the CoClass ShellNameSpace. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoShellNameSpace = class
    class function Create: IShellNameSpace;
    class function CreateRemote(const MachineName: string): IShellNameSpace;
  end;

  TShellNameSpaceFavoritesSelectionChange = procedure(ASender: TObject; cItems: Integer;
                                                                        hItem: Integer;
                                                                        const strName: WideString;
                                                                        const strUrl: WideString;
                                                                        cVisits: Integer;
                                                                        const strDate: WideString;
                                                                        fAvailableOffline: Integer) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TShellNameSpace
// Help String      :
// Default Interface: IShellNameSpace
// Def. Intf. DISP? : No
// Event   Interface: DShellNameSpaceEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TShellNameSpace = class(TOleServer)
  private
    FOnFavoritesSelectionChange: TShellNameSpaceFavoritesSelectionChange;
    FOnSelectionChange: TNotifyEvent;
    FOnDoubleClick: TNotifyEvent;
    FOnInitialized: TNotifyEvent;
    FIntf: IShellNameSpace;
    function GetDefaultInterface: IShellNameSpace;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_SubscriptionsEnabled: WordBool;
    function Get_EnumOptions: Integer;
    procedure Set_EnumOptions(pgrfEnumFlags: Integer);
    function Get_SelectedItem: IDispatch;
    procedure Set_SelectedItem(const pItem: IDispatch);
    function Get_Root: OleVariant;
    procedure Set_Root(pvar: OleVariant);
    function Get_Depth: SYSINT;
    procedure Set_Depth(piDepth: SYSINT);
    function Get_Mode: SYSUINT;
    procedure Set_Mode(puMode: SYSUINT);
    function Get_Flags: LongWord;
    procedure Set_Flags(pdwFlags: LongWord);
    procedure Set_TVFlags(dwFlags: LongWord);
    function Get_TVFlags: LongWord;
    function Get_Columns: WideString;
    procedure Set_Columns(const bstrColumns: WideString);
    function Get_CountViewTypes: SYSINT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IShellNameSpace);
    procedure Disconnect; override;
    procedure MoveSelectionUp;
    procedure MoveSelectionDown;
    procedure ResetSort;
    procedure NewFolder;
    procedure Synchronize;
    procedure Import;
    procedure Export;
    procedure InvokeContextMenuCommand(const strCommand: WideString);
    procedure MoveSelectionTo;
    function CreateSubscriptionForSelection: WordBool;
    function DeleteSubscriptionForSelection: WordBool;
    procedure SetRoot(const bstrFullPath: WideString);
    procedure SetViewType(iType: SYSINT);
    function SelectedItems: IDispatch;
    procedure Expand(var_: OleVariant; iDepth: SYSINT);
    procedure UnselectAll;
    property DefaultInterface: IShellNameSpace read GetDefaultInterface;
    property SubscriptionsEnabled: WordBool read Get_SubscriptionsEnabled;
    property SelectedItem: IDispatch read Get_SelectedItem write Set_SelectedItem;
    property Root: OleVariant read Get_Root write Set_Root;
    property CountViewTypes: SYSINT read Get_CountViewTypes;
    property EnumOptions: Integer read Get_EnumOptions write Set_EnumOptions;
    property Depth: SYSINT read Get_Depth write Set_Depth;
    property Mode: SYSUINT read Get_Mode write Set_Mode;
    property Flags: LongWord read Get_Flags write Set_Flags;
    property TVFlags: LongWord read Get_TVFlags write Set_TVFlags;
    property Columns: WideString read Get_Columns write Set_Columns;
  published
    property OnFavoritesSelectionChange: TShellNameSpaceFavoritesSelectionChange read FOnFavoritesSelectionChange write FOnFavoritesSelectionChange;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
    property OnDoubleClick: TNotifyEvent read FOnDoubleClick write FOnDoubleClick;
    property OnInitialized: TNotifyEvent read FOnInitialized write FOnInitialized;
  end;

// *********************************************************************//
// The Class CoCScriptErrorList provides a Create and CreateRemote method to
// create instances of the default interface IScriptErrorList exposed by
// the CoClass CScriptErrorList. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoCScriptErrorList = class
    class function Create: IScriptErrorList;
    class function CreateRemote(const MachineName: string): IScriptErrorList;
  end;

implementation

uses System.Win.ComObj, Vcl.Themes, System.UITypes, System.Sysutils, MSHTML,
     Vcl.Dialogs, System.IOUtils, Winapi.PsAPI, IEConst;

constructor TWebBrowser.Create(AOwner: TComponent);
begin
  inherited;
  FSelectedEngine := TSelectedEngine.IEOnly;
  FActiveEngine := TActiveEngine.None;
  FEdgeBusy := False;
  FEdgeReadyState := READYSTATE_UNINITIALIZED;
end;

procedure TWebBrowser.InitControlData;
const
  CEventDispIDs: array [0..40] of DWORD = (
    $00000066, $0000006C, $00000069, $0000006A, $00000068, $00000071,
    $00000070, $000000FA, $000000FB, $000000FC, $00000103, $000000FD,
    $000000FE, $000000FF, $00000100, $00000101, $00000102, $00000104,
    $00000106, $00000108, $00000109, $0000010A, $0000010B, $00000107,
    $0000010C, $0000010D, $0000010E, $0000010F, $000000E1, $000000E2,
    $000000E3, $00000110, $00000111, $0000011A, $0000011B, $0000011C,
    $0000011D, $0000011E, $00000122, $00000120, $00000121);
  CControlData: TControlData2 = (
    ClassID:      '{8856F961-340A-11D0-A96B-00C04FD705A2}';
    EventIID:     '{34A715A0-6587-11D0-924A-0020AFC7AC4D}';
    EventCount:   41;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   nil (*HR:$80040111*);
    Flags:        $00000000;
    Version:      500);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnStatusTextChange) - UIntPtr(Self);
end;

//Set background to vcl styles windows color.
procedure TWebBrowser.TWinContainer.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  LCanvas: TCanvas;
begin
  Message.Result := 1;
  if FCorner then
  begin
    LCanvas := TCanvas.Create;
    try
      LCanvas.Handle := Message.DC;
      if StyleServices.Enabled then
        LCanvas.Brush.Color := StyleServices.GetSystemColor(clBtnFace)
      else
        LCanvas.Brush.Color := clBtnFace;
      LCanvas.FillRect(Rect(0, 0, Width, Height));
    finally
      LCanvas.Free;
    end;
  end;
end;

procedure TWebBrowser.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FVScrollBarContainer) then
    FVScrollBarContainer := nil;
  if (Operation = opRemove) and (AComponent = FHScrollBarContainer) then
    FHScrollBarContainer := nil;
  if (Operation = opRemove) and (AComponent = FScrollCornerContainer) then
    FScrollCornerContainer := nil;
end;

procedure TWebBrowser.WMTimer(var Message: TWMTimer);
begin
  inherited;
  if Message.TimerID = 10 then
  begin
    KillTimer(Handle, 10);
    ResizeScrollBars;
    if (FVScrollBarContainer <> nil) and FVScrollBarContainer.Visible then
      FVScrollBar.Repaint;
    if (FHScrollBarContainer <> nil) and FHScrollBarContainer.Visible then
      FHScrollBar.Repaint;
  end;
end;

procedure TWebBrowser.WMSize(var Message: TWMSIZE);
begin
  inherited;
  ResizeScrollBars;
  if FEdge <> nil then
  begin
    FEdge.Width := Width;
    FEdge.Height := Height;
  end;
end;

function TWebBrowser.GetOptionKeyPath(var pchKey: POLESTR; const dw: DWORD): HRESULT;
begin
  Result := E_FAIL;
end;

function TWebBrowser.TranslateAccelerator(const lpMsg: PMSG; const pguidCmdGroup: PGUID; const nCmdID: DWORD): HRESULT;
begin
  Result := S_FALSE;
end;

function TWebBrowser.TranslateUrl(const dwTranslate: DWORD; const pchURLIn: POLESTR; var ppchURLOut: POLESTR): HRESULT;
begin
  Result := E_FAIL;
end;

function TWebBrowser.EnableModeless(const fEnable: BOOL): HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.FilterDataObject(const pDO: IDataObject; out ppDORet: IDataObject): HRESULT;
begin
  ppDORet := nil;
  Result := S_FALSE;
end;

function TWebBrowser.GetDropTarget(const pDropTarget: IDropTarget; out ppDropTarget: IDropTarget): HRESULT;
begin
  ppDropTarget := nil;
  Result := E_FAIL;
end;

function TWebBrowser.GetExternal(out ppDispatch: IDispatch): HRESULT;
begin
  ppDispatch := nil;
  Result := E_FAIL;
end;

function TWebBrowser.UpdateUI: HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.HideUI: HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.OnDocWindowActivate(const fActivate: BOOL): HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.OnFrameWindowActivate(const fActivate: BOOL): HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.ResizeBorder(const prcBorder: PRECT; const pUIWindow: IOleInPlaceUIWindow; const fRameWindow: BOOL): HRESULT;
begin
  Result := S_FALSE;
end;

function TWebBrowser.ShowUI(const dwID: DWORD; const pActiveObject: IOleInPlaceActiveObject; const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;  const pDoc: IOleInPlaceUIWindow): HRESULT;
begin
  Result := S_OK;
end;

function TWebBrowser.ShowContextMenu(const dwID: DWORD; const ppt: PPOINT; const pcmdtReserved: IUnknown; const pdispReserved: IDispatch): HRESULT;
begin
  Result := S_FALSE;
end;

function TWebBrowser.ShowHelp(hwnd: THandle; pszHelpFile: POLESTR;
  uCommand, dwData: Integer; ptMouse: TPoint;
  var pDispachObjectHit: IDispatch): HRESULT;
begin
  Result := S_FALSE;
end;

//http://msdn.microsoft.com/en-us/library/aa753271%28v=vs.85%29.aspx
function TWebBrowser.ShowMessage(hwnd: THandle; lpstrText,
  lpstrCaption: POLESTR; dwType: Integer; lpstrHelpFile: POLESTR;
  dwHelpContext: Integer; var plResult: LRESULT): HRESULT;
var
 DlgType: TMsgDlgType;
 Buttons: TMsgDlgButtons;
begin
  Result := E_NOTIMPL;

  if not TStyleManager.IsCustomStyleActive or
     not (shDialogs in TStyleManager.SystemHooks) then
    Exit;

   DlgType := mtInformation;
  if ((dwType and MB_ICONMASK) = MB_ICONHAND) or ((dwType and MB_ICONMASK) = MB_USERICON) then
   DlgType := mtCustom
  else
  if (dwType and MB_ICONMASK) = MB_ICONWARNING then
   DlgType := mtWarning
  else
  if (dwType and MB_ICONMASK) = MB_ICONQUESTION then
   DlgType := mtConfirmation
  else
  if (dwType and MB_ICONMASK) = MB_ICONEXCLAMATION then
   DlgType := mtInformation;

  case dwType and MB_TYPEMASK of
    MB_OK: Buttons := [mbOK];
    MB_OKCANCEL: Buttons := [mbOK, mbCancel];
    MB_ABORTRETRYIGNORE: Buttons := [mbAbort, mbRetry, mbIgnore];
    MB_YESNOCANCEL: Buttons := [mbYes, mbNo, mbCancel];
    MB_YESNO:Buttons := [mbYes, mbNo];
    MB_RETRYCANCEL: Buttons := [mbRetry, mbCancel];
  else
    Buttons := [mbOK];
  end;

  plResult := MessageDlg(lpstrText, DlgType, Buttons, dwHelpContext);
  Result := S_OK;
end;

function TWebBrowser.QueryStatus(CmdGroup: PGUID; cCmds: Cardinal;
  prgCmds: POleCmd; CmdText: POleCmdText): HResult;
begin
  Result := S_FALSE;
end;

//How to handle script errors as a WebBrowser control host
//http://support.microsoft.com/kb/261003
function TWebBrowser.Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD;
  const vaIn: OleVariant; var vaOut: OleVariant): HResult;
const
  CGID_DocHostCommandHandler: TGUID = (D1: $F38BC242; D2: $B950; D3: $11D1; D4: ($89, $18, $00, $C0, $4F, $C2, $C8, $36));
var
  LHTMLEventObj: IHTMLEventObj;
  LHTMLWindow2: IHTMLWindow2;
  LHTMLDocument2: IHTMLDocument2;
  LUnknown: IUnknown;
  FHandledScriptError: Boolean;

  function GetPropertyValue(const PropName: WideString): OleVariant;
  var
    LParams: TDispParams;
    LDispIDs: Integer;
    Status: Integer;
    ExcepInfo: TExcepInfo;
    LName: PWideChar;
  begin
    ZeroMemory(@LParams, SizeOf(LParams));
    LName := PWideChar(PropName);
    Status := LHTMLEventObj.GetIDsOfNames(GUID_NULL, @LName, 1, LOCALE_SYSTEM_DEFAULT, @LDispIDs);
    if Status = 0 then
    begin
      Status := LHTMLEventObj.Invoke(LDispIDs, GUID_NULL, LOCALE_SYSTEM_DEFAULT, DISPATCH_PROPERTYGET, LParams, @Result, @ExcepInfo, nil);
      if Status <> 0 then DispatchInvokeError(Status, ExcepInfo);
    end
    else
    if Status = DISP_E_UNKNOWNNAME then
      raise EOleError.CreateFmt('Property "%s" is not supported.', [PropName])
    else
      OleCheck(Status);
  end;

begin
  Result := S_OK;
  if (CmdGroup <> nil) and IsEqualGuid(CmdGroup^, CGID_DocHostCommandHandler) then
     case nCmdID of
        OLECMDID_SHOWSCRIPTERROR:
        begin
          LUnknown := IUnknown(TVarData(vaIn).VUnknown);
          if Succeeded(LUnknown.QueryInterface(IID_IHTMLDocument2, LHTMLDocument2)) then
          begin
            LHTMLWindow2 := LHTMLDocument2.Get_parentWindow;
            if LHTMLWindow2 <> nil then
            begin
              LHTMLEventObj := LHTMLWindow2.Get_event;
              if LHTMLEventObj <> nil then
              begin
                if Assigned(FOnShowScriptError) then
                  FOnShowScriptError(Self,
                    GetPropertyValue('errorLine'),
                    GetPropertyValue('errorCharacter'),
                    GetPropertyValue('errorMessage'),
                    GetPropertyValue('errorCode'),
                    GetPropertyValue('errorUrl'),
                    vaOut,
                    FHandledScriptError);
                if not FHandledScriptError then
                  Result := S_FALSE;
              end;
            end;
          end;
        end;
     else
       Result := OLECMDERR_E_NOTSUPPORTED;
     end
   else
     Result := OLECMDERR_E_UNKNOWNGROUP;
end;

function TWebBrowser.GetHostInfo(var pInfo: TDocHostUIInfo): HRESULT;
begin
  pInfo.cbSize := SizeOf(pInfo);
  pInfo.dwFlags := 0;
  pInfo.dwFlags := pInfo.dwFlags or DOCHOSTUIFLAG_NO3DBORDER;
  pInfo.dwFlags := pInfo.dwFlags or DOCHOSTUIFLAG_THEME;
  Result := S_OK;
  ResizeScrollBars;
end;

function TWebBrowser.GetIEHandle: HWND;
var
  ChildHWND: WinApi.Windows.HWND;
  TempHWND: WinApi.Windows.HWND;
  lpClassName: array [0..255] of Char;
begin
  TempHWND := Self.Handle;
  if TempHWND <> 0 then
  while True do
  begin
    ChildHWND := GetWindow(TempHWND, GW_CHILD);
    if ChildHWND = 0 then
      Break;
    GetClassName(ChildHWND, lpClassName, SizeOf(lpClassName));
    if SameText(string(lpClassName),'Internet Explorer_Server') then
    begin
      Result := ChildHWND;
      Exit;
    end;
    TempHWND := ChildHWND;
  end;
  Result := 0;
end;

procedure TWebBrowser.SetEdgeBrowserExecutableFolder(const Value: string);
begin
  if FEdgeBrowserExecutableFolder <> Value then
  begin
    FEdgeBrowserExecutableFolder := Value;
    if FEdge <> nil then
    begin
      FEdge.BrowserExecutableFolder := FEdgeBrowserExecutableFolder;
      // Without this, the specified user data folder probably won't be applied
      FEdge.ReinitializeWebView;
    end;
  end;
end;

procedure TWebBrowser.SetEdgeUserDataFolder(const Value: string);
begin
  if FEdgeUserDataFolder <> Value then
  begin
    FEdgeUserDataFolder := Value;
    if FEdge <> nil then
    begin
      FEdge.UserDataFolder := FEdgeUserDataFolder;
      // Without this, the specified user data folder probably won't be applied
      FEdge.ReinitializeWebView;
    end;
  end;
end;

procedure TWebBrowser.SetFocus;
begin
  inherited;
  if (FEdge <> nil) and (ActiveEngine = TActiveEngine.Edge) and FEdge.CanFocus then
    FEdge.SetFocus
end;

procedure TWebBrowser.SetParent(AParent: TWinControl);
begin
  inherited;
  FScrollParent := AParent;
  if IsStyledScrollsAssigned then
  begin
    FVScrollBarContainer.Parent := FScrollParent;
    FHScrollBarContainer.Parent := FScrollParent;
    FScrollCornerContainer.Parent := FScrollParent;
  end;
end;

procedure TWebBrowser.InitStyledScrollBar(AScrollBar: TWinContainer);
begin
  AScrollBar.Visible := False;
  AScrollBar.Parent := nil;
  AScrollBar.Parent := FScrollParent;
  AScrollBar.Visible := True;
  AScrollBar.BringToFront;
end;

function TWebBrowser.IsStyledScrollsAssigned: Boolean;
begin
  Result := Assigned(FVScrollBarContainer) and
            Assigned(FHScrollBarContainer) and
            Assigned(FScrollCornerContainer);
end;

procedure TWebBrowser.InitStyledScrollBars;
begin
  if FScrollParent = nil then
    Exit;

  if TStyleManager.IsCustomStyleActive and (seBorder in StyleElements) and
     not IsStyledScrollsAssigned then
  begin
    FLSM_CXHTHUMB := GetSystemMetrics(SM_CXHTHUMB);
    FLSM_CYVTHUMB := GetSystemMetrics(SM_CYVTHUMB);

    FScrollCornerContainer := TWinContainer.Create(Self);
    FScrollCornerContainer.Visible := False;
    FScrollCornerContainer.FCorner := True;

    FVScrollBarContainer := TWinContainer.Create(Self);
    FVScrollBarContainer.Visible := False;
    FVScrollBar := TScrollBar.Create(Self);
    FVScrollBar.Parent := FVScrollBarContainer;
    FVScrollBar.Kind := sbVertical;
    FVScrollBar.Visible := True;
    FVScrollBar.Align := alClient;
    FVScrollBar.ParentCtl3D := False;
    FVScrollBar.Ctl3D := False;
    FVScrollBar.OnChange := VScrollChange;

    FHScrollBarContainer := TWinContainer.Create(Self);
    FHScrollBarContainer.Visible := False;
    FHScrollBar := TScrollBar.Create(Self);
    FHScrollBar.Parent := FHScrollBarContainer;
    FHScrollBar.ParentCtl3D := False;
    FHScrollBar.Ctl3D := False;
    FHScrollBar.Visible := True;
    FHScrollBar.Align := alClient;
    FHScrollBar.OnChange := HScrollChange;

    FHScrollBarContainer.Parent := FScrollParent;
    FVScrollBarContainer.Parent := FScrollParent;
    FScrollCornerContainer.Parent := FScrollParent;

    ResizeScrollBars;
  end
  else
  if TStyleManager.IsCustomStyleActive and (seBorder in StyleElements) and
    IsStyledScrollsAssigned then
  begin
    InitStyledScrollBar(FVScrollBarContainer);
    InitStyledScrollBar(FHScrollBarContainer);
    InitStyledScrollBar(FScrollCornerContainer);
    UpdateContainers(False);
    ResizeScrollBars;
  end
  else
  if (not TStyleManager.IsCustomStyleActive or
     (TStyleManager.IsCustomStyleActive and not (seBorder in StyleElements)))
     and IsStyledScrollsAssigned then
  begin
    FVScrollBarContainer.Visible := False;
    FScrollCornerContainer.Visible := False;
    FHScrollBarContainer.Visible := False;
  end;
end;

procedure TWebBrowser.UpdateContainers(AVisibleChanged: Boolean);
var
  StateVisible: Boolean;
  LRect: TRect;
begin
  if FVScrollBarContainer.Visible then
  begin
    LRect := BoundsRect;
    LRect.Left := LRect.Right - FLSM_CXHTHUMB;
    if FHScrollBarContainer.Visible then
      LRect.Bottom := LRect.Bottom - FLSM_CYVTHUMB;
    FVScrollBarContainer.BoundsRect := LRect;
    if AVisibleChanged then
       FVScrollBarContainer.BringToFront;
  end;

  if FHScrollBarContainer.Visible then
  begin
    LRect := BoundsRect;
    LRect.Top := LRect.Bottom - FLSM_CYVTHUMB;
    if FVScrollBarContainer.Visible then
      LRect.Right := LRect.Right - FLSM_CXHTHUMB;
    FHScrollBarContainer.BoundsRect := LRect;
    if AVisibleChanged then
      FHScrollBarContainer.BringToFront;
  end;

  StateVisible := FScrollCornerContainer.Visible;
  FScrollCornerContainer.Visible := FHScrollBarContainer.Visible and FVScrollBarContainer.Visible;
  if FScrollCornerContainer.Visible then
  begin
    LRect := BoundsRect;
    LRect.Left := LRect.Right - FLSM_CXHTHUMB;
    LRect.Top := LRect.Bottom - FLSM_CYVTHUMB;
    FScrollCornerContainer.BoundsRect := LRect;
    if not StateVisible then
       FScrollCornerContainer.BringToFront;
  end;
end;

procedure TWebBrowser.ResizeScrollBars;
var
  StateVisible, ScrollChangedVisible: Boolean;
  DocClientWidth: Integer;
  ScrollWidth: Integer;
  ScrollHeight: Integer;
  HPageSize: Integer;
  VPageSize: Integer;
  IEHWND: WinApi.Windows.HWND;
begin
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned or
     not (seBorder in StyleElements)
  then
    Exit;

  IEHWND := GetIEHandle;

  if IEHWND = 0 then
  begin
    FVScrollBarContainer.Visible := False;
    FHScrollBarContainer.Visible := False;
    FScrollCornerContainer.Visible := False;
    Exit;
  end;

  if (Document <> nil) and (IHtmldocument2(Document).Body <> nil) then
   begin
     DocClientWidth := OleVariant(Document).documentElement.ClientWidth;
     if (DocClientWidth > 0) then
     begin
       ScrollWidth := OleVariant(Document).DocumentElement.scrollWidth;
       if (FHScrollBar.Max <> ScrollWidth) and (ScrollWidth >= FHScrollBar.PageSize) and (ScrollWidth >= FHScrollBar.Min) then
         FHScrollBar.Max := ScrollWidth;
       ScrollHeight := OleVariant(Document).DocumentElement.scrollHeight;
       if (FVScrollBar.Max <> ScrollHeight) and (ScrollHeight >= FVScrollBar.PageSize) and (ScrollHeight >= FVScrollBar.Min) then
         FVScrollBar.Max := ScrollHeight;
     end
     else
     begin
       ScrollWidth  := IHtmldocument2(Document).Body.getAttribute('ScrollWidth', 0);
       if (FHScrollBar.Max <> ScrollWidth) and (ScrollWidth >= FHScrollBar.PageSize) and (ScrollWidth >= FHScrollBar.Min) then
         FHScrollBar.Max := ScrollWidth;
       ScrollHeight := IHtmldocument2(Document).Body.getAttribute('ScrollHeight', 0);
       if (FVScrollBar.Max <> ScrollHeight) and (ScrollHeight >= FVScrollBar.PageSize) and (ScrollHeight >= FVScrollBar.Min) then
         FVScrollBar.Max := ScrollHeight;
     end;

     if (FHScrollBar.Max > Self.Width - FLSM_CXHTHUMB) and(FHScrollBar.Max > 0) and (FHScrollBar.Max <> Self.Width) then
       VPageSize := Self.Height - FLSM_CYVTHUMB
     else
       VPageSize := Self.Height;

     FVScrollBar.PageSize := VPageSize;
     FVScrollBar.SetParams(FVScrollBar.Position, 0, FVScrollBar.Max);
     FVScrollBar.LargeChange := TScrollBarInc(FVScrollBar.PageSize);

     HPageSize := Self.Width - FLSM_CXHTHUMB;
     FHScrollBar.PageSize := HPageSize;
     FHScrollBar.SetParams(FHScrollBar.Position, 0, FHScrollBar.Max);
     FHScrollBar.LargeChange := FHScrollBar.PageSize;

     ScrollChangedVisible := False;

     StateVisible := FVScrollBarContainer.Visible;
     FVScrollBarContainer.Visible := (VPageSize < FVScrollBar.Max) and (FVScrollBar.PageSize > 0) and
       (FVScrollBar.Max > 0) and (FVScrollBar.Max <> Self.Height);
     if not StateVisible and FVScrollBarContainer.Visible then
       ScrollChangedVisible := True;

     StateVisible := FHScrollBarContainer.Visible;
     FHScrollBarContainer.Visible := (HPageSize < FHScrollBar.Max) and (FHScrollBar.PageSize < FHScrollBar.Max) and
       (FHScrollBar.Max > 0) and (FHScrollBar.Max <> Self.Width);
     if not StateVisible and FHScrollBarContainer.Visible then
       ScrollChangedVisible := True;
     UpdateContainers(ScrollChangedVisible);
     if ScrollChangedVisible then
       SetTimer(Handle, 10, 50, nil);
   end
   else
   begin
     FVScrollBarContainer.Visible := False;
     FHScrollBarContainer.Visible := False;
     FScrollCornerContainer.Visible := False;
   end;
end;

procedure TWebBrowser.DoProgressChange(Sender: TObject; Progress,ProgressMax: Integer);
begin
  ResizeScrollBars;
end;

procedure TWebBrowser.DoDocumentComplete(Sender: TObject;const pDisp: IDispatch; const URL: OleVariant);
begin
  ResizeScrollBars;
end;

procedure TWebBrowser.DoNavigateComplete2(Sender: TObject;const pDisp:IDispatch;const URL: OleVariant);
begin
  ResizeScrollBars;
end;

procedure TWebBrowser.DoCommandStateChange(Sender: TObject; Command: Integer; Enable: WordBool);
begin
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned or
     not (seBorder in StyleElements)
  then
    Exit;
  if (Document <> nil) and (IHtmldocument2(Document).Body <> nil)
  then
  begin
    if (OleVariant(Document).DocumentElement.scrollTop = 0) then
      FVScrollBar.Position := IHtmldocument2(Document).Body.getAttribute('ScrollTop', 0)
    else
      FVScrollBar.Position := OleVariant(Document).DocumentElement.scrollTop;

    if (OleVariant(Document).DocumentElement.scrollLeft = 0) then
      FHScrollBar.Position := IHtmldocument2(Document).Body.getAttribute('ScrollLeft', 0)
    else
      FHScrollBar.Position := OleVariant(Document).DocumentElement.scrollLeft
  end;
  ResizeScrollBars;
end;

procedure TWebBrowser.DoBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
begin
  ResizeScrollBars;
end;

procedure TWebBrowser.VScrollChange(Sender: TObject);
begin
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned or
     not (seBorder in StyleElements) then
    Exit;

  if (Document <> nil) and (IHTMLDocument2(Document).ParentWindow<>nil) then
    IHTMLWindow2(IHTMLDocument2(Document).ParentWindow).Scroll(FHScrollBar.Position, FVScrollBar.Position);
end;

procedure TWebBrowser.HScrollChange(Sender: TObject);
begin
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned or
     not (seBorder in StyleElements)
  then
    Exit;

  if (Document <> nil) and (IHTMLDocument2(Document).ParentWindow <> nil) then
     IHTMLWindow2(IHTMLDocument2(Document).ParentWindow).Scroll(FHScrollBar.Position, FVScrollBar.Position);
end;

procedure TWebBrowser.InvokeEvent(DispID: TDispID; var Params: TDispParams);
var
  ArgCount: Integer;
  LVarArray: array of OleVariant;
  LIndex: Integer;
begin
  inherited;
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned or
     not (seBorder in StyleElements)
  then
    Exit;

  ArgCount := Params.cArgs;
  SetLength(LVarArray, ArgCount);
  for LIndex := Low(LVarArray) to High(LVarArray) do
    LVarArray[High(LVarArray) - LIndex] := OleVariant(TDispParams(Params).rgvarg^[LIndex]);

  case DispID of
    252: DoNavigateComplete2(Self,
                              LVarArray[0] {const IDispatch},
                              LVarArray[1] {const OleVariant});

    259: DoDocumentComplete(Self,
                             LVarArray[0] {const IDispatch},
                             LVarArray[1] {const OleVariant});

    250: DoBeforeNavigate2(Self,
                            LVarArray[0] {const IDispatch},
                            LVarArray[1] {const OleVariant},
                            LVarArray[2] {const OleVariant},
                            LVarArray[3] {const OleVariant},
                            LVarArray[4] {const OleVariant},
                            LVarArray[5] {const OleVariant},
                            WordBool((TVarData(LVarArray[6]).VPointer)^) {var WordBool});

    105:DoCommandStateChange(Self,
                               LVarArray[0] {Integer},
                               LVarArray[1] {WordBool});

    108:DoProgressChange(Self,
                           LVarArray[0] {Integer},
                           LVarArray[1] {Integer});
  end;
  SetLength(LVarArray, 0);
end;

procedure TWebBrowser.CMVisibleChanged(var Message: TMessage);
begin
  inherited;
  if not TStyleManager.IsCustomStyleActive or not IsStyledScrollsAssigned then
    Exit;
  FVScrollBarContainer.Visible := Self.Visible;
  FHScrollBarContainer.Visible := Self.Visible;
  FScrollCornerContainer.Visible := Self.Visible;
  if Visible then
    ResizeScrollBars;
end;

procedure TWebBrowser.Loaded;
begin
  inherited;
  ResizeScrollBars;
end;

procedure TWebBrowser.CreateControl;

  procedure DoCreate;
  begin
    // Create the IE control or the Edge control according to the property
    case FSelectedEngine of
      TSelectedEngine.IEOnly:
      begin
        FIEIntf := IUnknown(OleObject) as IWebBrowser2;
        FActiveEngine := TActiveEngine.IE;
      end;
      TSelectedEngine.EdgeOnly,
      TSelectedEngine.EdgeIfAvailable:
      begin
        // Indicate we are on the case to avoid another call into here starting us off again
        FActiveEngine := TActiveEngine.NoneYet;
        FEdgeReadyState := READYSTATE_LOADING;
        // Set forth trying to create a WebView2 browser control
        if FEdge = nil then
          FEdge := TEdgeBrowser.Create(Self);
        FEdge.OnCreateWebViewCompleted := WebViewCreateWebViewCompleted;
        FEdge.OnDocumentTitleChanged := WebViewDocumentTitleChanged;
        FEdge.OnHistoryChanged := WebViewHistoryChanged;
        FEdge.OnNavigationStarting := WebViewNavigationStarting;
        FEdge.OnNavigationCompleted := WebViewNavigationCompleted;
        FEdge.OnNewWindowRequested := WebViewNewWindowRequested;
        FEdge.OnScriptDialogOpening := WebViewScriptDialogOpening;
        FEdge.Width := Width;
        FEdge.Height := Height;
        FEdge.BrowserExecutableFolder := EdgeBrowserExecutableFolder;
        FEdge.UserDataFolder := FEdgeUserDataFolder;
        FEdge.Parent := Self;
      end;
    end;
  end;

begin
  if (FIEIntf = nil) and
     ((FEdge = nil) or not FEdge.WebViewCreated) and
     (FActiveEngine <> TActiveEngine.NoneYet) then
    DoCreate;
end;

procedure TWebBrowser.CreateWnd;
begin
  inherited;
  InitStyledScrollBars;
  Self.Navigate(FLastUrl);
end;

procedure TWebBrowser.DestroyWnd;
begin
  var Intf := DefaultInterface;
  if Intf <> nil then
    FLastUrl := Intf.LocationURL;
  inherited;
end;

function TWebBrowser.GetControlInterface: IWebBrowser2;
begin
  CreateControl;
  if FEdge = nil then
    Result := FIEIntf;
end;

function TWebBrowser.Get_AddressBar: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(555)
  else
    Result := False;
end;

function TWebBrowser.Get_Application: IDispatch;
begin
  if GetEdgeInterface = nil then
    Result := GetIDispatchProp(200);
end;

function TWebBrowser.Get_Busy: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(212)
  else
    Result := FEdgeBusy;
end;

function TWebBrowser.Get_Container: IDispatch;
begin
  if GetEdgeInterface = nil then
    Result := GetIDispatchProp(202);
end;

function TWebBrowser.Get_Document: IDispatch;
begin
  if GetEdgeInterface = nil then
    Result := GetIDispatchProp(203);
end;

function TWebBrowser.Get_FullName: WideString;

  function PathFromPID(PID: DWORD): string;
  var
    Path: array[0..Pred(MAX_PATH)] of Char;
  begin
    var ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PID);
    if ProcessHandle <> 0 then
      try
        if GetModuleFileNameEx(ProcessHandle, 0, Path, MAX_PATH) = 0 then
          RaiseLastOSError;
        Result := Path;
      finally
        CloseHandle(ProcessHandle);
      end
    else
      RaiseLastOSError;
  end;

begin
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(400)
  else
    Result := PathFromPID(FEdge.BrowserProcessID);
end;

function TWebBrowser.Get_FullScreen: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(407)
  else
    Result := False;
end;

function EnumChildWindowsCallback(hWnd: Winapi.Windows.HWND; lParam: LPARAM): BOOL; stdcall;
begin
  PNativeInt(lParam)^ := hWnd;
  Result := False;
end;

function TWebBrowser.Get_HWND: HWND;
begin
  if GetEdgeInterface = nil then
    Result := DefaultInterface.HWND
  else
  begin
    // Get first Edge control child window, if it's finished initialising
    Result := 0;
    if FEdge.WebViewCreated then
      EnumChildWindows(FEdge.Handle, @EnumChildWindowsCallback, NativeInt(@Result));
  end;
end;

function TWebBrowser.Get_LocationName: WideString;
begin
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(210)
  else
    Result := FEdge.DocumentTitle;
end;

function TWebBrowser.Get_LocationURL: WideString;
begin
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(211)
  else
    Result := FEdge.LocationURL;
end;

function TWebBrowser.Get_MenuBar: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(406)
  else
    Result := False;
end;

function TWebBrowser.Get_Name: WideString;
begin
  Result := '';
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(0);
end;

function TWebBrowser.Get_Offline: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(550)
  else
    Result := False;
end;

function TWebBrowser.Get_Parent: IDispatch;
begin
  if GetEdgeInterface = nil then
    Result := GetIDispatchProp(201);
end;

function TWebBrowser.Get_Path: WideString;
begin
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(401)
  else
    Result := TPath.GetDirectoryName(FullName);
end;

function TWebBrowser.Get_ReadyState: tagREADYSTATE;
begin
  if GetEdgeInterface = nil then
    Result := GetTOleEnumProp(-525)
  else
    Result := FEdgeReadyState;
end;

function TWebBrowser.Get_RegisterAsBrowser: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(552)
  else
    Result := False;
end;

function TWebBrowser.Get_RegisterAsDropTarget: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(553)
  else
    Result := False;
end;

function TWebBrowser.Get_Resizable: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(556)
  else
    Result := True;
end;

function TWebBrowser.Get_Silent: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(551)
  else
  begin
    if FEdge.WebViewCreated then
      Result := not FEdge.DefaultScriptDialogsEnabled
    else
      Result := False;
  end;
end;

function TWebBrowser.Get_StatusBar: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(403)
  else
  begin
    if FEdge.WebViewCreated then
      Result := FEdge.StatusBarEnabled
    else
      Result := False;
  end;
end;

function TWebBrowser.Get_StatusText: WideString;
begin
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(404)
  else
  begin
    // Nothing to do: Edge status bar text is URL of link under mouse
    Result := '';
  end;
end;

function TWebBrowser.Get_TheaterMode: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(554)
  else
    Result := False;
end;

function TWebBrowser.Get_ToolBar: Integer;
begin
  if GetEdgeInterface = nil then
    Result := GetIntegerProp(405)
  else
    Result := Integer(LongBool(False));
end;

function TWebBrowser.Get_TopLevelContainer: WordBool;
begin
  Result := True;
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(204);
end;

function TWebBrowser.Get_Type: WideString;
begin
  Result := '';
  if GetEdgeInterface = nil then
    Result := GetWideStringProp(205);
end;

function TWebBrowser.Get_Visible: WordBool;
begin
  if GetEdgeInterface = nil then
    Result := GetWordBoolProp(402)
  else
    Result := FEdge.Visible;
end;

procedure TWebBrowser.Set_AddressBar(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(555, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_FullScreen(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(407, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_MenuBar(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(406, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_Offline(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(550, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_RegisterAsBrowser(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(552, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_RegisterAsDropTarget(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(553, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_Resizable(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(556, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_Silent(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(551, Value)
  else
  begin
    if FEdge.WebViewCreated then
      FEdge.DefaultScriptDialogsEnabled := not Value;
  end;
end;

procedure TWebBrowser.Set_StatusBar(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(403, Value)
  else
    FEdge.StatusBarEnabled := Value;
end;

procedure TWebBrowser.Set_StatusText(Value: WideString);
begin
  if GetEdgeInterface = nil then
    SetWideStringProp(404, Value)
  else
  begin
    // Nothing to do: Edge status bar text is URL of link under mouse
  end;
end;

procedure TWebBrowser.Set_TheaterMode(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(554, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_ToolBar(Value: Integer);
begin
  if GetEdgeInterface = nil then
    SetIntegerProp(405, Value)
  else
  begin
    // Nothing to do for Edge
  end;
end;

procedure TWebBrowser.Set_Visible(Value: WordBool);
begin
  if GetEdgeInterface = nil then
    SetWordBoolProp(402, Value)
  else
  begin
    if FEdge.ControllerInterface <> nil then
      FEdge.ControllerInterface.Set_IsVisible(Integer(LongBool(Value)));
    FEdge.Visible := Value;
  end;
end;

procedure TWebBrowser.GoBack;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.GoBack
  else
    FEdge.GoBack;
end;

procedure TWebBrowser.GoForward;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.GoForward
  else
    FEdge.GoForward;
end;

procedure TWebBrowser.GoHome;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.GoHome
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.GoSearch;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.GoSearch
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate(const URL: WideString);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  end
  else
  begin
    FLastURL := URL; // in case we fail to create an Edge browser
    FEdge.Navigate(URL);
  end;
end;

procedure TWebBrowser.Navigate(const URL: WideString; const Flags: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate(const URL: WideString; const Flags: OleVariant;
                               const TargetFrameName: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate(const URL: WideString; const Flags: OleVariant;
                               const TargetFrameName: OleVariant; const PostData: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, EmptyParam)
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate(const URL: WideString; const Flags: OleVariant;
                               const TargetFrameName: OleVariant; const PostData: OleVariant;
                               const Headers: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, Headers)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Refresh;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Refresh
  else
    FEdge.Refresh;
end;

procedure TWebBrowser.Refresh2;
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Refresh2(EmptyParam);
  end
  else
    FEdge.Refresh;
end;

procedure TWebBrowser.Refresh2(const Level: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Refresh2(Level)
  else
    FEdge.Refresh;
end;

procedure TWebBrowser.Stop;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Stop
  else
    FEdge.Stop;
end;

procedure TWebBrowser.Quit;
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Quit
  else
    FEdge.CloseBrowserProcess;
end;

procedure TWebBrowser.ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.ClientToWindow(pcx, pcy)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.PutProperty(const Property_: WideString; vtValue: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.PutProperty(Property_, vtValue)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

function TWebBrowser.GetProperty(const Property_: WideString): OleVariant;
begin
  if GetEdgeInterface = nil then
    Result := DefaultInterface.GetProperty(Property_)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate2(const URL: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate2(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  end
  else
  begin
    FLastURL := URL; // in case we fail to create an Edge browser
    FEdge.Navigate(URL);
  end;
end;

procedure TWebBrowser.Navigate2(const URL: OleVariant; const Flags: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate2(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                const TargetFrameName: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                const TargetFrameName: OleVariant; const PostData: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                const TargetFrameName: OleVariant; const PostData: OleVariant;
                                const Headers: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, Headers)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

function TWebBrowser.QueryStatusWB(cmdID: OLECMDID): OLECMDF;
begin
  if GetEdgeInterface = nil then
    Result := DefaultInterface.QueryStatusWB(cmdID)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.ExecWB(cmdID, cmdexecopt, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT; const pvaIn: OleVariant;
                             var pvaOut: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ShowBrowserBar(const pvaClsid: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.ShowBrowserBar(pvaClsid, EmptyParam, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant);
begin
  if GetEdgeInterface = nil then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, EmptyParam);
  end
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

procedure TWebBrowser.ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                                     const pvarSize: OleVariant);
begin
  if GetEdgeInterface = nil then
    DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, pvarSize)
  else
    raise ENotImplemented.Create(SNotSupportedByEdge);
end;

function TWebBrowser.GetEdgeInterface: TEdgeBrowser;
begin
  if (FEdge = nil) and
     (FSelectedEngine in [TSelectedEngine.EdgeOnly, TSelectedEngine.EdgeIfAvailable]) and
     (FActiveEngine = TActiveEngine.None) then
    CreateControl;
  Result := FEdge;
end;

procedure TWebBrowser.WebViewCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HResult);
begin
  if Succeeded(AResult) then
  begin
    FActiveEngine := TActiveEngine.Edge;
    FEdgeReadyState := READYSTATE_COMPLETE;
  end
  else
  begin
    // Failure to initiate an Edge (WebView2) browser control
    if FSelectedEngine = TSelectedEngine.EdgeIfAvailable then
    begin
      // Defer to IE browser control
      FIEIntf := IUnknown(OleObject) as IWebBrowser2;
      // This frees the Edge object from within one of its event handlers,
      // but the event handler is actually called from an anonymous method
      // executed in the UI thread, not directly by an object method
      FEdge.Free;
      FEdge := nil;
      FActiveEngine := TActiveEngine.IE;
      if FLastURL <> '' then
        Navigate(FLastURL);
    end
    else
    begin
      // That is the end of the road - it was Edge or error
      FActiveEngine := TActiveEngine.None;
      FEdgeReadyState := READYSTATE_UNINITIALIZED;
    end;
  end;
end;

procedure TWebBrowser.WebViewHistoryChanged(Sender: TCustomEdgeBrowser);
begin
  if Assigned(FOnCommandStateChange) then
    FOnCommandStateChange(Self, CSC_NAVIGATEBACK, FEdge.CanGoBack);
  if Assigned(FOnCommandStateChange) then
    FOnCommandStateChange(Self, CSC_NAVIGATEFORWARD, FEdge.CanGoForward);
end;

procedure TWebBrowser.WebViewDocumentTitleChanged(Sender: TCustomEdgeBrowser; const ADocumentTitle: string);
begin
  if Assigned(FOnTitleChange) then
    FOnTitleChange(Self, ADocumentTitle);
end;

procedure TWebBrowser.WebViewNavigationStarting(Sender: TCustomEdgeBrowser; Args: TNavigationStartingEventArgs);
begin
  FEdgeBusy := True;
  if Assigned(FOnBeforeNavigate2) then
  begin
    var EmptyParam := System.Variants.EmptyParam;
    var URL := System.Variants.EmptyParam;
    var Uri: PChar;
    if Succeeded(Args.ArgsInterface.Get_uri(Uri)) then
      URL := string(Uri);
    CoTaskMemFree(Uri);
    var Cancel: WordBool := False;
    FOnBeforeNavigate2(Self, nil, Url, EmptyParam, EmptyParam, EmptyParam, EmptyParam, Cancel);
    if Cancel then
      Args.ArgsInterface.Set_Cancel(Integer(LongBool(Cancel)));
  end;
end;

procedure TWebBrowser.WebViewNavigationCompleted(Sender: TCustomEdgeBrowser; IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
begin
  FEdgeBusy := False;
  if IsSuccess and Assigned(FOnDocumentComplete) then
    FOnDocumentComplete(Self, nil, FEdge.LocationURL);
  if Assigned(OnNavigateComplete2) then
    OnNavigateComplete2(Self, nil, FEdge.LocationURL);
end;

procedure TWebBrowser.WebViewNewWindowRequested(Sender: TCustomEdgeBrowser; Args: TNewWindowRequestedEventArgs);
begin
  var Disp: IDispatch := nil;
  var Cancel: WordBool := False;
  if Assigned(FOnNewWindow2) then
    FOnNewWindow2(Self, Disp, Cancel);
  if Assigned(FOnNewWindow3) then
  begin
    var URL: string;
    var Uri: PChar;
    if Succeeded(Args.ArgsInterface.Get_uri(Uri)) then
      URL := string(Uri);
    CoTaskMemFree(Uri);
    FOnNewWindow3(Self, Disp, Cancel, 0, '', URL);
  end;
  if Cancel then
    Args.ArgsInterface.Set_Handled(Integer(LongBool(Cancel)));
end;

procedure TWebBrowser.WebViewScriptDialogOpening(Sender: TCustomEdgeBrowser; Args: TScriptDialogOpeningEventArgs);
begin
  // This handler is only called only called (and so can only auto-accepts Edge script dialogs) if Silent is True
  Args.ArgsInterface.Accept;
end;

class function CoInternetExplorer.Create: IWebBrowser2;
begin
  Result := CreateComObject(CLASS_InternetExplorer) as IWebBrowser2;
end;

class function CoInternetExplorer.CreateRemote(const MachineName: string): IWebBrowser2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InternetExplorer) as IWebBrowser2;
end;

procedure TInternetExplorer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0002DF01-0000-0000-C000-000000000046}';
    IntfIID:   '{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}';
    EventIID:  '{34A715A0-6587-11D0-924A-0020AFC7AC4D}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInternetExplorer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IWebBrowser2;
  end;
end;

procedure TInternetExplorer.ConnectTo(svrIntf: IWebBrowser2);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TInternetExplorer.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TInternetExplorer.GetDefaultInterface: IWebBrowser2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TInternetExplorer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TInternetExplorer.Destroy;
begin
  inherited Destroy;
end;

procedure TInternetExplorer.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    102: if Assigned(FOnStatusTextChange) then
         FOnStatusTextChange(Self, Params[0] {const WideString});
    108: if Assigned(FOnProgressChange) then
         FOnProgressChange(Self,
                           Params[0] {Integer},
                           Params[1] {Integer});
    105: if Assigned(FOnCommandStateChange) then
         FOnCommandStateChange(Self,
                               Params[0] {Integer},
                               Params[1] {WordBool});
    106: if Assigned(FOnDownloadBegin) then
         FOnDownloadBegin(Self);
    104: if Assigned(FOnDownloadComplete) then
         FOnDownloadComplete(Self);
    113: if Assigned(FOnTitleChange) then
         FOnTitleChange(Self, Params[0] {const WideString});
    112: if Assigned(FOnPropertyChange) then
         FOnPropertyChange(Self, Params[0] {const WideString});
    250: if Assigned(FOnBeforeNavigate2) then
         FOnBeforeNavigate2(Self,
                            Params[0] {const IDispatch},
                            Params[1] {const OleVariant},
                            Params[2] {const OleVariant},
                            Params[3] {const OleVariant},
                            Params[4] {const OleVariant},
                            Params[5] {const OleVariant},
                            WordBool((TVarData(Params[6]).VPointer)^) {var WordBool});
    251: if Assigned(FOnNewWindow2) then
         FOnNewWindow2(Self,
                       IDispatch((TVarData(Params[0]).VPointer)^) {var IDispatch},
                       WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    252: if Assigned(FOnNavigateComplete2) then
         FOnNavigateComplete2(Self,
                              Params[0] {const IDispatch},
                              Params[1] {const OleVariant});
    259: if Assigned(FOnDocumentComplete) then
         FOnDocumentComplete(Self,
                             Params[0] {const IDispatch},
                             Params[1] {const OleVariant});
    253: if Assigned(FOnQuit) then
         FOnQuit(Self);
    254: if Assigned(FOnVisible) then
         FOnVisible(Self, Params[0] {WordBool});
    255: if Assigned(FOnToolBar) then
         FOnToolBar(Self, Params[0] {WordBool});
    256: if Assigned(FOnMenuBar) then
         FOnMenuBar(Self, Params[0] {WordBool});
    257: if Assigned(FOnStatusBar) then
         FOnStatusBar(Self, Params[0] {WordBool});
    258: if Assigned(FOnFullScreen) then
         FOnFullScreen(Self, Params[0] {WordBool});
    260: if Assigned(FOnTheaterMode) then
         FOnTheaterMode(Self, Params[0] {WordBool});
    262: if Assigned(FOnWindowSetResizable) then
         FOnWindowSetResizable(Self, Params[0] {WordBool});
    264: if Assigned(FOnWindowSetLeft) then
         FOnWindowSetLeft(Self, Params[0] {Integer});
    265: if Assigned(FOnWindowSetTop) then
         FOnWindowSetTop(Self, Params[0] {Integer});
    266: if Assigned(FOnWindowSetWidth) then
         FOnWindowSetWidth(Self, Params[0] {Integer});
    267: if Assigned(FOnWindowSetHeight) then
         FOnWindowSetHeight(Self, Params[0] {Integer});
    263: if Assigned(FOnWindowClosing) then
         FOnWindowClosing(Self,
                          Params[0] {WordBool},
                          WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    268: if Assigned(FOnClientToHostWindow) then
         FOnClientToHostWindow(Self,
                               Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                               Integer((TVarData(Params[1]).VPointer)^) {var Integer});
    269: if Assigned(FOnSetSecureLockIcon) then
         FOnSetSecureLockIcon(Self, Params[0] {Integer});
    270: if Assigned(FOnFileDownload) then
         FOnFileDownload(Self,
                         Params[0] {WordBool},
                         WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    271: if Assigned(FOnNavigateError) then
         FOnNavigateError(Self,
                          Params[0] {const IDispatch},
                          Params[1] {const OleVariant},
                          Params[2] {const OleVariant},
                          Params[3] {const OleVariant},
                          WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    225: if Assigned(FOnPrintTemplateInstantiation) then
         FOnPrintTemplateInstantiation(Self, Params[0] {const IDispatch});
    226: if Assigned(FOnPrintTemplateTeardown) then
         FOnPrintTemplateTeardown(Self, Params[0] {const IDispatch});
    227: if Assigned(FOnUpdatePageStatus) then
         FOnUpdatePageStatus(Self,
                             Params[0] {const IDispatch},
                             Params[1] {const OleVariant},
                             Params[2] {const OleVariant});
    272: if Assigned(FOnPrivacyImpactedStateChange) then
         FOnPrivacyImpactedStateChange(Self, Params[0] {WordBool});
    273: if Assigned(FOnNewWindow3) then
         FOnNewWindow3(Self,
                       IDispatch((TVarData(Params[0]).VPointer)^) {var IDispatch},
                       WordBool((TVarData(Params[1]).VPointer)^) {var WordBool},
                       Params[2] {LongWord},
                       Params[3] {const WideString},
                       Params[4] {const WideString});
    282: if Assigned(FOnSetPhishingFilterStatus) then
         FOnSetPhishingFilterStatus(Self, Params[0] {Integer});
    283: if Assigned(FOnWindowStateChanged) then
         FOnWindowStateChanged(Self,
                               Params[0] {LongWord},
                               Params[1] {LongWord});
    284: if Assigned(FOnNewProcess) then
         FOnNewProcess(Self,
                       Params[0] {Integer},
                       Params[1] {const IDispatch},
                       WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    285: if Assigned(FOnThirdPartyUrlBlocked) then
         FOnThirdPartyUrlBlocked(Self,
                                 Params[0] {const OleVariant},
                                 Params[1] {LongWord});
    286: if Assigned(FOnRedirectXDomainBlocked) then
         FOnRedirectXDomainBlocked(Self,
                                   Params[0] {const IDispatch},
                                   Params[1] {const OleVariant},
                                   Params[2] {const OleVariant},
                                   Params[3] {const OleVariant},
                                   Params[4] {const OleVariant});
    290: if Assigned(FOnBeforeScriptExecute) then
         FOnBeforeScriptExecute(Self, Params[0] {const IDispatch});
    288: if Assigned(FOnWebWorkerStarted) then
         FOnWebWorkerStarted(Self,
                             Params[0] {LongWord},
                             Params[1] {const WideString});
    289: if Assigned(FOnWebWorkerFinsihed) then
         FOnWebWorkerFinsihed(Self, Params[0] {LongWord});
  end; {case DispID}
end;

function TInternetExplorer.Get_Application: IDispatch;
begin
  Result := DefaultInterface.Application;
end;

function TInternetExplorer.Get_Parent: IDispatch;
begin
  Result := DefaultInterface.Parent;
end;

function TInternetExplorer.Get_Container: IDispatch;
begin
  Result := DefaultInterface.Container;
end;

function TInternetExplorer.Get_Document: IDispatch;
begin
  Result := DefaultInterface.Document;
end;

function TInternetExplorer.Get_TopLevelContainer: WordBool;
begin
  Result := DefaultInterface.TopLevelContainer;
end;

function TInternetExplorer.Get_type_: WideString;
begin
  Result := DefaultInterface.type_;
end;

function TInternetExplorer.Get_Left: Integer;
begin
  Result := DefaultInterface.Left;
end;

procedure TInternetExplorer.Set_Left(pl: Integer);
begin
  DefaultInterface.Left := pl;
end;

function TInternetExplorer.Get_Top: Integer;
begin
  Result := DefaultInterface.Top;
end;

procedure TInternetExplorer.Set_Top(pl: Integer);
begin
  DefaultInterface.Top := pl;
end;

function TInternetExplorer.Get_Width: Integer;
begin
  Result := DefaultInterface.Width;
end;

procedure TInternetExplorer.Set_Width(pl: Integer);
begin
  DefaultInterface.Width := pl;
end;

function TInternetExplorer.Get_Height: Integer;
begin
  Result := DefaultInterface.Height;
end;

procedure TInternetExplorer.Set_Height(pl: Integer);
begin
  DefaultInterface.Height := pl;
end;

function TInternetExplorer.Get_LocationName: WideString;
begin
  Result := DefaultInterface.LocationName;
end;

function TInternetExplorer.Get_LocationURL: WideString;
begin
  Result := DefaultInterface.LocationURL;
end;

function TInternetExplorer.Get_Busy: WordBool;
begin
  Result := DefaultInterface.Busy;
end;

function TInternetExplorer.Get_Name: WideString;
begin
  Result := DefaultInterface.Name;
end;

function TInternetExplorer.Get_HWND: HWND;
begin
  Result := DefaultInterface.HWND;
end;

function TInternetExplorer.Get_FullName: WideString;
begin
  Result := DefaultInterface.FullName;
end;

function TInternetExplorer.Get_Path: WideString;
begin
  Result := DefaultInterface.Path;
end;

function TInternetExplorer.Get_Visible: WordBool;
begin
  Result := DefaultInterface.Visible;
end;

procedure TInternetExplorer.Set_Visible(pBool: WordBool);
begin
  DefaultInterface.Visible := pBool;
end;

function TInternetExplorer.Get_StatusBar: WordBool;
begin
  Result := DefaultInterface.StatusBar;
end;

procedure TInternetExplorer.Set_StatusBar(pBool: WordBool);
begin
  DefaultInterface.StatusBar := pBool;
end;

function TInternetExplorer.Get_StatusText: WideString;
begin
  Result := DefaultInterface.StatusText;
end;

procedure TInternetExplorer.Set_StatusText(const StatusText: WideString);
begin
  DefaultInterface.StatusText := StatusText;
end;

function TInternetExplorer.Get_ToolBar: SYSINT;
begin
  Result := DefaultInterface.ToolBar;
end;

procedure TInternetExplorer.Set_ToolBar(Value: SYSINT);
begin
  DefaultInterface.ToolBar := Value;
end;

function TInternetExplorer.Get_MenuBar: WordBool;
begin
  Result := DefaultInterface.MenuBar;
end;

procedure TInternetExplorer.Set_MenuBar(Value: WordBool);
begin
  DefaultInterface.MenuBar := Value;
end;

function TInternetExplorer.Get_FullScreen: WordBool;
begin
  Result := DefaultInterface.FullScreen;
end;

procedure TInternetExplorer.Set_FullScreen(pbFullScreen: WordBool);
begin
  DefaultInterface.FullScreen := pbFullScreen;
end;

function TInternetExplorer.Get_ReadyState: tagREADYSTATE;
begin
  Result := DefaultInterface.ReadyState;
end;

function TInternetExplorer.Get_Offline: WordBool;
begin
  Result := DefaultInterface.Offline;
end;

procedure TInternetExplorer.Set_Offline(pbOffline: WordBool);
begin
  DefaultInterface.Offline := pbOffline;
end;

function TInternetExplorer.Get_Silent: WordBool;
begin
  Result := DefaultInterface.Silent;
end;

procedure TInternetExplorer.Set_Silent(pbSilent: WordBool);
begin
  DefaultInterface.Silent := pbSilent;
end;

function TInternetExplorer.Get_RegisterAsBrowser: WordBool;
begin
  Result := DefaultInterface.RegisterAsBrowser;
end;

procedure TInternetExplorer.Set_RegisterAsBrowser(pbRegister: WordBool);
begin
  DefaultInterface.RegisterAsBrowser := pbRegister;
end;

function TInternetExplorer.Get_RegisterAsDropTarget: WordBool;
begin
  Result := DefaultInterface.RegisterAsDropTarget;
end;

procedure TInternetExplorer.Set_RegisterAsDropTarget(pbRegister: WordBool);
begin
  DefaultInterface.RegisterAsDropTarget := pbRegister;
end;

function TInternetExplorer.Get_TheaterMode: WordBool;
begin
  Result := DefaultInterface.TheaterMode;
end;

procedure TInternetExplorer.Set_TheaterMode(pbRegister: WordBool);
begin
  DefaultInterface.TheaterMode := pbRegister;
end;

function TInternetExplorer.Get_AddressBar: WordBool;
begin
  Result := DefaultInterface.AddressBar;
end;

procedure TInternetExplorer.Set_AddressBar(Value: WordBool);
begin
  DefaultInterface.AddressBar := Value;
end;

function TInternetExplorer.Get_Resizable: WordBool;
begin
  Result := DefaultInterface.Resizable;
end;

procedure TInternetExplorer.Set_Resizable(Value: WordBool);
begin
  DefaultInterface.Resizable := Value;
end;

procedure TInternetExplorer.GoBack;
begin
  DefaultInterface.GoBack;
end;

procedure TInternetExplorer.GoForward;
begin
  DefaultInterface.GoForward;
end;

procedure TInternetExplorer.GoHome;
begin
  DefaultInterface.GoHome;
end;

procedure TInternetExplorer.GoSearch;
begin
  DefaultInterface.GoSearch;
end;

procedure TInternetExplorer.Navigate(const URL: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate(const URL: WideString; const Flags: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate(const URL: WideString; const Flags: OleVariant;
                                     const TargetFrameName: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate(const URL: WideString; const Flags: OleVariant;
                                     const TargetFrameName: OleVariant; const PostData: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, EmptyParam);
end;

procedure TInternetExplorer.Navigate(const URL: WideString; const Flags: OleVariant;
                                     const TargetFrameName: OleVariant; const PostData: OleVariant;
                                     const Headers: OleVariant);
begin
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, Headers);
end;

procedure TInternetExplorer.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure TInternetExplorer.Refresh2;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Refresh2(EmptyParam);
end;

procedure TInternetExplorer.Refresh2(const Level: OleVariant);
begin
  DefaultInterface.Refresh2(Level);
end;

procedure TInternetExplorer.Stop;
begin
  DefaultInterface.Stop;
end;

procedure TInternetExplorer.Quit;
begin
  DefaultInterface.Quit;
end;

procedure TInternetExplorer.ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
begin
  DefaultInterface.ClientToWindow(pcx, pcy);
end;

procedure TInternetExplorer.PutProperty(const Property_: WideString; vtValue: OleVariant);
begin
  DefaultInterface.PutProperty(Property_, vtValue);
end;

function TInternetExplorer.GetProperty(const Property_: WideString): OleVariant;
begin
  Result := DefaultInterface.GetProperty(Property_);
end;

procedure TInternetExplorer.Navigate2(const URL: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate2(const URL: OleVariant; const Flags: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                      const TargetFrameName: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                      const TargetFrameName: OleVariant; const PostData: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, PostData, EmptyParam);
end;

procedure TInternetExplorer.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                      const TargetFrameName: OleVariant;
                                      const PostData: OleVariant; const Headers: OleVariant);
begin
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, PostData, Headers);
end;

function TInternetExplorer.QueryStatusWB(cmdID: OLECMDID): OLECMDF;
begin
  Result := DefaultInterface.QueryStatusWB(cmdID);
end;

procedure TInternetExplorer.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ExecWB(cmdID, cmdexecopt, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT;
                                   const pvaIn: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, EmptyParam);
end;

procedure TInternetExplorer.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT;
                                   const pvaIn: OleVariant; var pvaOut: OleVariant);
begin
  DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut);
end;

procedure TInternetExplorer.ShowBrowserBar(const pvaClsid: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ShowBrowserBar(pvaClsid, EmptyParam, EmptyParam);
end;

procedure TInternetExplorer.ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, EmptyParam);
end;

procedure TInternetExplorer.ShowBrowserBar(const pvaClsid: OleVariant; const pvarShow: OleVariant;
                                           const pvarSize: OleVariant);
begin
  DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, pvarSize);
end;

class function CoInternetExplorerMedium.Create: IWebBrowser2;
begin
  Result := CreateComObject(CLASS_InternetExplorerMedium) as IWebBrowser2;
end;

class function CoInternetExplorerMedium.CreateRemote(const MachineName: string): IWebBrowser2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InternetExplorerMedium) as IWebBrowser2;
end;

procedure TInternetExplorerMedium.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D5E8041D-920F-45E9-B8FB-B1DEB82C6E5E}';
    IntfIID:   '{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}';
    EventIID:  '{34A715A0-6587-11D0-924A-0020AFC7AC4D}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInternetExplorerMedium.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IWebBrowser2;
  end;
end;

procedure TInternetExplorerMedium.ConnectTo(svrIntf: IWebBrowser2);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TInternetExplorerMedium.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TInternetExplorerMedium.GetDefaultInterface: IWebBrowser2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TInternetExplorerMedium.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TInternetExplorerMedium.Destroy;
begin
  inherited Destroy;
end;

procedure TInternetExplorerMedium.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    102: if Assigned(FOnStatusTextChange) then
         FOnStatusTextChange(Self, Params[0] {const WideString});
    108: if Assigned(FOnProgressChange) then
         FOnProgressChange(Self,
                           Params[0] {Integer},
                           Params[1] {Integer});
    105: if Assigned(FOnCommandStateChange) then
         FOnCommandStateChange(Self,
                               Params[0] {Integer},
                               Params[1] {WordBool});
    106: if Assigned(FOnDownloadBegin) then
         FOnDownloadBegin(Self);
    104: if Assigned(FOnDownloadComplete) then
         FOnDownloadComplete(Self);
    113: if Assigned(FOnTitleChange) then
         FOnTitleChange(Self, Params[0] {const WideString});
    112: if Assigned(FOnPropertyChange) then
         FOnPropertyChange(Self, Params[0] {const WideString});
    250: if Assigned(FOnBeforeNavigate2) then
         FOnBeforeNavigate2(Self,
                            Params[0] {const IDispatch},
                            Params[1] {const OleVariant},
                            Params[2] {const OleVariant},
                            Params[3] {const OleVariant},
                            Params[4] {const OleVariant},
                            Params[5] {const OleVariant},
                            WordBool((TVarData(Params[6]).VPointer)^) {var WordBool});
    251: if Assigned(FOnNewWindow2) then
         FOnNewWindow2(Self,
                       IDispatch((TVarData(Params[0]).VPointer)^) {var IDispatch},
                       WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    252: if Assigned(FOnNavigateComplete2) then
         FOnNavigateComplete2(Self,
                              Params[0] {const IDispatch},
                              Params[1] {const OleVariant});
    259: if Assigned(FOnDocumentComplete) then
         FOnDocumentComplete(Self,
                             Params[0] {const IDispatch},
                             Params[1] {const OleVariant});
    253: if Assigned(FOnQuit) then
         FOnQuit(Self);
    254: if Assigned(FOnVisible) then
         FOnVisible(Self, Params[0] {WordBool});
    255: if Assigned(FOnToolBar) then
         FOnToolBar(Self, Params[0] {WordBool});
    256: if Assigned(FOnMenuBar) then
         FOnMenuBar(Self, Params[0] {WordBool});
    257: if Assigned(FOnStatusBar) then
         FOnStatusBar(Self, Params[0] {WordBool});
    258: if Assigned(FOnFullScreen) then
         FOnFullScreen(Self, Params[0] {WordBool});
    260: if Assigned(FOnTheaterMode) then
         FOnTheaterMode(Self, Params[0] {WordBool});
    262: if Assigned(FOnWindowSetResizable) then
         FOnWindowSetResizable(Self, Params[0] {WordBool});
    264: if Assigned(FOnWindowSetLeft) then
         FOnWindowSetLeft(Self, Params[0] {Integer});
    265: if Assigned(FOnWindowSetTop) then
         FOnWindowSetTop(Self, Params[0] {Integer});
    266: if Assigned(FOnWindowSetWidth) then
         FOnWindowSetWidth(Self, Params[0] {Integer});
    267: if Assigned(FOnWindowSetHeight) then
         FOnWindowSetHeight(Self, Params[0] {Integer});
    263: if Assigned(FOnWindowClosing) then
         FOnWindowClosing(Self,
                          Params[0] {WordBool},
                          WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    268: if Assigned(FOnClientToHostWindow) then
         FOnClientToHostWindow(Self,
                               Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                               Integer((TVarData(Params[1]).VPointer)^) {var Integer});
    269: if Assigned(FOnSetSecureLockIcon) then
         FOnSetSecureLockIcon(Self, Params[0] {Integer});
    270: if Assigned(FOnFileDownload) then
         FOnFileDownload(Self,
                         Params[0] {WordBool},
                         WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    271: if Assigned(FOnNavigateError) then
         FOnNavigateError(Self,
                          Params[0] {const IDispatch},
                          Params[1] {const OleVariant},
                          Params[2] {const OleVariant},
                          Params[3] {const OleVariant},
                          WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
    225: if Assigned(FOnPrintTemplateInstantiation) then
         FOnPrintTemplateInstantiation(Self, Params[0] {const IDispatch});
    226: if Assigned(FOnPrintTemplateTeardown) then
         FOnPrintTemplateTeardown(Self, Params[0] {const IDispatch});
    227: if Assigned(FOnUpdatePageStatus) then
         FOnUpdatePageStatus(Self,
                             Params[0] {const IDispatch},
                             Params[1] {const OleVariant},
                             Params[2] {const OleVariant});
    272: if Assigned(FOnPrivacyImpactedStateChange) then
         FOnPrivacyImpactedStateChange(Self, Params[0] {WordBool});
    273: if Assigned(FOnNewWindow3) then
         FOnNewWindow3(Self,
                       IDispatch((TVarData(Params[0]).VPointer)^) {var IDispatch},
                       WordBool((TVarData(Params[1]).VPointer)^) {var WordBool},
                       Params[2] {LongWord},
                       Params[3] {const WideString},
                       Params[4] {const WideString});
    282: if Assigned(FOnSetPhishingFilterStatus) then
         FOnSetPhishingFilterStatus(Self, Params[0] {Integer});
    283: if Assigned(FOnWindowStateChanged) then
         FOnWindowStateChanged(Self,
                               Params[0] {LongWord},
                               Params[1] {LongWord});
    284: if Assigned(FOnNewProcess) then
         FOnNewProcess(Self,
                       Params[0] {Integer},
                       Params[1] {const IDispatch},
                       WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    285: if Assigned(FOnThirdPartyUrlBlocked) then
         FOnThirdPartyUrlBlocked(Self,
                                 Params[0] {const OleVariant},
                                 Params[1] {LongWord});
    286: if Assigned(FOnRedirectXDomainBlocked) then
         FOnRedirectXDomainBlocked(Self,
                                   Params[0] {const IDispatch},
                                   Params[1] {const OleVariant},
                                   Params[2] {const OleVariant},
                                   Params[3] {const OleVariant},
                                   Params[4] {const OleVariant});
    290: if Assigned(FOnBeforeScriptExecute) then
         FOnBeforeScriptExecute(Self, Params[0] {const IDispatch});
    288: if Assigned(FOnWebWorkerStarted) then
         FOnWebWorkerStarted(Self,
                             Params[0] {LongWord},
                             Params[1] {const WideString});
    289: if Assigned(FOnWebWorkerFinsihed) then
         FOnWebWorkerFinsihed(Self, Params[0] {LongWord});
  end; {case DispID}
end;

function TInternetExplorerMedium.Get_Application: IDispatch;
begin
  Result := DefaultInterface.Application;
end;

function TInternetExplorerMedium.Get_Parent: IDispatch;
begin
  Result := DefaultInterface.Parent;
end;

function TInternetExplorerMedium.Get_Container: IDispatch;
begin
  Result := DefaultInterface.Container;
end;

function TInternetExplorerMedium.Get_Document: IDispatch;
begin
  Result := DefaultInterface.Document;
end;

function TInternetExplorerMedium.Get_TopLevelContainer: WordBool;
begin
  Result := DefaultInterface.TopLevelContainer;
end;

function TInternetExplorerMedium.Get_type_: WideString;
begin
  Result := DefaultInterface.type_;
end;

function TInternetExplorerMedium.Get_Left: Integer;
begin
  Result := DefaultInterface.Left;
end;

procedure TInternetExplorerMedium.Set_Left(pl: Integer);
begin
  DefaultInterface.Left := pl;
end;

function TInternetExplorerMedium.Get_Top: Integer;
begin
  Result := DefaultInterface.Top;
end;

procedure TInternetExplorerMedium.Set_Top(pl: Integer);
begin
  DefaultInterface.Top := pl;
end;

function TInternetExplorerMedium.Get_Width: Integer;
begin
  Result := DefaultInterface.Width;
end;

procedure TInternetExplorerMedium.Set_Width(pl: Integer);
begin
  DefaultInterface.Width := pl;
end;

function TInternetExplorerMedium.Get_Height: Integer;
begin
  Result := DefaultInterface.Height;
end;

procedure TInternetExplorerMedium.Set_Height(pl: Integer);
begin
  DefaultInterface.Height := pl;
end;

function TInternetExplorerMedium.Get_LocationName: WideString;
begin
  Result := DefaultInterface.LocationName;
end;

function TInternetExplorerMedium.Get_LocationURL: WideString;
begin
  Result := DefaultInterface.LocationURL;
end;

function TInternetExplorerMedium.Get_Busy: WordBool;
begin
  Result := DefaultInterface.Busy;
end;

function TInternetExplorerMedium.Get_Name: WideString;
begin
  Result := DefaultInterface.Name;
end;

function TInternetExplorerMedium.Get_HWND: HWND;
begin
  Result := DefaultInterface.HWND;
end;

function TInternetExplorerMedium.Get_FullName: WideString;
begin
  Result := DefaultInterface.FullName;
end;

function TInternetExplorerMedium.Get_Path: WideString;
begin
  Result := DefaultInterface.Path;
end;

function TInternetExplorerMedium.Get_Visible: WordBool;
begin
  Result := DefaultInterface.Visible;
end;

procedure TInternetExplorerMedium.Set_Visible(pBool: WordBool);
begin
  DefaultInterface.Visible := pBool;
end;

function TInternetExplorerMedium.Get_StatusBar: WordBool;
begin
  Result := DefaultInterface.StatusBar;
end;

procedure TInternetExplorerMedium.Set_StatusBar(pBool: WordBool);
begin
  DefaultInterface.StatusBar := pBool;
end;

function TInternetExplorerMedium.Get_StatusText: WideString;
begin
  Result := DefaultInterface.StatusText;
end;

procedure TInternetExplorerMedium.Set_StatusText(const StatusText: WideString);
begin
  DefaultInterface.StatusText := StatusText;
end;

function TInternetExplorerMedium.Get_ToolBar: SYSINT;
begin
  Result := DefaultInterface.ToolBar;
end;

procedure TInternetExplorerMedium.Set_ToolBar(Value: SYSINT);
begin
  DefaultInterface.ToolBar := Value;
end;

function TInternetExplorerMedium.Get_MenuBar: WordBool;
begin
  Result := DefaultInterface.MenuBar;
end;

procedure TInternetExplorerMedium.Set_MenuBar(Value: WordBool);
begin
  DefaultInterface.MenuBar := Value;
end;

function TInternetExplorerMedium.Get_FullScreen: WordBool;
begin
  Result := DefaultInterface.FullScreen;
end;

procedure TInternetExplorerMedium.Set_FullScreen(pbFullScreen: WordBool);
begin
  DefaultInterface.FullScreen := pbFullScreen;
end;

function TInternetExplorerMedium.Get_ReadyState: tagREADYSTATE;
begin
  Result := DefaultInterface.ReadyState;
end;

function TInternetExplorerMedium.Get_Offline: WordBool;
begin
  Result := DefaultInterface.Offline;
end;

procedure TInternetExplorerMedium.Set_Offline(pbOffline: WordBool);
begin
  DefaultInterface.Offline := pbOffline;
end;

function TInternetExplorerMedium.Get_Silent: WordBool;
begin
  Result := DefaultInterface.Silent;
end;

procedure TInternetExplorerMedium.Set_Silent(pbSilent: WordBool);
begin
  DefaultInterface.Silent := pbSilent;
end;

function TInternetExplorerMedium.Get_RegisterAsBrowser: WordBool;
begin
  Result := DefaultInterface.RegisterAsBrowser;
end;

procedure TInternetExplorerMedium.Set_RegisterAsBrowser(pbRegister: WordBool);
begin
  DefaultInterface.RegisterAsBrowser := pbRegister;
end;

function TInternetExplorerMedium.Get_RegisterAsDropTarget: WordBool;
begin
  Result := DefaultInterface.RegisterAsDropTarget;
end;

procedure TInternetExplorerMedium.Set_RegisterAsDropTarget(pbRegister: WordBool);
begin
  DefaultInterface.RegisterAsDropTarget := pbRegister;
end;

function TInternetExplorerMedium.Get_TheaterMode: WordBool;
begin
  Result := DefaultInterface.TheaterMode;
end;

procedure TInternetExplorerMedium.Set_TheaterMode(pbRegister: WordBool);
begin
  DefaultInterface.TheaterMode := pbRegister;
end;

function TInternetExplorerMedium.Get_AddressBar: WordBool;
begin
  Result := DefaultInterface.AddressBar;
end;

procedure TInternetExplorerMedium.Set_AddressBar(Value: WordBool);
begin
  DefaultInterface.AddressBar := Value;
end;

function TInternetExplorerMedium.Get_Resizable: WordBool;
begin
  Result := DefaultInterface.Resizable;
end;

procedure TInternetExplorerMedium.Set_Resizable(Value: WordBool);
begin
  DefaultInterface.Resizable := Value;
end;

procedure TInternetExplorerMedium.GoBack;
begin
  DefaultInterface.GoBack;
end;

procedure TInternetExplorerMedium.GoForward;
begin
  DefaultInterface.GoForward;
end;

procedure TInternetExplorerMedium.GoHome;
begin
  DefaultInterface.GoHome;
end;

procedure TInternetExplorerMedium.GoSearch;
begin
  DefaultInterface.GoSearch;
end;

procedure TInternetExplorerMedium.Navigate(const URL: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate(const URL: WideString; const Flags: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate(const URL: WideString; const Flags: OleVariant;
                                           const TargetFrameName: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate(const URL: WideString; const Flags: OleVariant;
                                           const TargetFrameName: OleVariant;
                                           const PostData: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate(const URL: WideString; const Flags: OleVariant;
                                           const TargetFrameName: OleVariant;
                                           const PostData: OleVariant; const Headers: OleVariant);
begin
  DefaultInterface.Navigate(URL, Flags, TargetFrameName, PostData, Headers);
end;

procedure TInternetExplorerMedium.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure TInternetExplorerMedium.Refresh2;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Refresh2(EmptyParam);
end;

procedure TInternetExplorerMedium.Refresh2(const Level: OleVariant);
begin
  DefaultInterface.Refresh2(Level);
end;

procedure TInternetExplorerMedium.Stop;
begin
  DefaultInterface.Stop;
end;

procedure TInternetExplorerMedium.Quit;
begin
  DefaultInterface.Quit;
end;

procedure TInternetExplorerMedium.ClientToWindow(var pcx: SYSINT; var pcy: SYSINT);
begin
  DefaultInterface.ClientToWindow(pcx, pcy);
end;

procedure TInternetExplorerMedium.PutProperty(const Property_: WideString; vtValue: OleVariant);
begin
  DefaultInterface.PutProperty(Property_, vtValue);
end;

function TInternetExplorerMedium.GetProperty(const Property_: WideString): OleVariant;
begin
  Result := DefaultInterface.GetProperty(Property_);
end;

procedure TInternetExplorerMedium.Navigate2(const URL: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate2(const URL: OleVariant; const Flags: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                            const TargetFrameName: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                            const TargetFrameName: OleVariant;
                                            const PostData: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, PostData, EmptyParam);
end;

procedure TInternetExplorerMedium.Navigate2(const URL: OleVariant; const Flags: OleVariant;
                                            const TargetFrameName: OleVariant;
                                            const PostData: OleVariant; const Headers: OleVariant);
begin
  DefaultInterface.Navigate2(URL, Flags, TargetFrameName, PostData, Headers);
end;

function TInternetExplorerMedium.QueryStatusWB(cmdID: OLECMDID): OLECMDF;
begin
  Result := DefaultInterface.QueryStatusWB(cmdID);
end;

procedure TInternetExplorerMedium.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ExecWB(cmdID, cmdexecopt, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT;
                                         const pvaIn: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, EmptyParam);
end;

procedure TInternetExplorerMedium.ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT;
                                         const pvaIn: OleVariant; var pvaOut: OleVariant);
begin
  DefaultInterface.ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut);
end;

procedure TInternetExplorerMedium.ShowBrowserBar(const pvaClsid: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ShowBrowserBar(pvaClsid, EmptyParam, EmptyParam);
end;

procedure TInternetExplorerMedium.ShowBrowserBar(const pvaClsid: OleVariant;
                                                 const pvarShow: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, EmptyParam);
end;

procedure TInternetExplorerMedium.ShowBrowserBar(const pvaClsid: OleVariant;
                                                 const pvarShow: OleVariant;
                                                 const pvarSize: OleVariant);
begin
  DefaultInterface.ShowBrowserBar(pvaClsid, pvarShow, pvarSize);
end;

class function CoShellBrowserWindow.Create: IWebBrowser2;
begin
  Result := CreateComObject(CLASS_ShellBrowserWindow) as IWebBrowser2;
end;

class function CoShellBrowserWindow.CreateRemote(const MachineName: string): IWebBrowser2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ShellBrowserWindow) as IWebBrowser2;
end;

class function CoShellWindows.Create: IShellWindows;
begin
  Result := CreateComObject(CLASS_ShellWindows) as IShellWindows;
end;

class function CoShellWindows.CreateRemote(const MachineName: string): IShellWindows;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ShellWindows) as IShellWindows;
end;

procedure TShellWindows.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{9BA05972-F6A8-11CF-A442-00A0C90A8F39}';
    IntfIID:   '{85CB6900-4D95-11CF-960C-0080C7F4EE85}';
    EventIID:  '{FE4106E0-399A-11D0-A48C-00A0C90A8F39}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TShellWindows.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IShellWindows;
  end;
end;

procedure TShellWindows.ConnectTo(svrIntf: IShellWindows);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TShellWindows.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TShellWindows.GetDefaultInterface: IShellWindows;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TShellWindows.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TShellWindows.Destroy;
begin
  inherited Destroy;
end;

procedure TShellWindows.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    200: if Assigned(FOnWindowRegistered) then
         FOnWindowRegistered(Self, Params[0] {Integer});
    201: if Assigned(FOnWindowRevoked) then
         FOnWindowRevoked(Self, Params[0] {Integer});
  end; {case DispID}
end;

function TShellWindows.Get_Count: Integer;
begin
  Result := DefaultInterface.Count;
end;

function TShellWindows.Item: IDispatch;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.Item(EmptyParam);
end;

function TShellWindows.Item(index: OleVariant): IDispatch;
begin
  Result := DefaultInterface.Item(index);
end;

function TShellWindows._NewEnum: IUnknown;
begin
  Result := DefaultInterface._NewEnum;
end;

procedure TShellWindows.Register(const pid: IDispatch; HWND: Integer; swClass: SYSINT;
                                 out plCookie: Integer);
begin
  DefaultInterface.Register(pid, HWND, swClass, plCookie);
end;

procedure TShellWindows.RegisterPending(lThreadId: Integer; const pvarloc: OleVariant;
                                        const pvarlocRoot: OleVariant; swClass: SYSINT;
                                        out plCookie: Integer);
begin
  DefaultInterface.RegisterPending(lThreadId, pvarloc, pvarlocRoot, swClass, plCookie);
end;

procedure TShellWindows.Revoke(lCookie: Integer);
begin
  DefaultInterface.Revoke(lCookie);
end;

procedure TShellWindows.OnNavigate(lCookie: Integer; const pvarloc: OleVariant);
begin
  DefaultInterface.OnNavigate(lCookie, pvarloc);
end;

procedure TShellWindows.OnActivated(lCookie: Integer; fActive: WordBool);
begin
  DefaultInterface.OnActivated(lCookie, fActive);
end;

function TShellWindows.FindWindowSW(const pvarloc: OleVariant; const pvarlocRoot: OleVariant;
                                    swClass: SYSINT; out pHWND: Integer; swfwOptions: SYSINT): IDispatch;
begin
  Result := DefaultInterface.FindWindowSW(pvarloc, pvarlocRoot, swClass, pHWND, swfwOptions);
end;

procedure TShellWindows.OnCreated(lCookie: Integer; const punk: IUnknown);
begin
  DefaultInterface.OnCreated(lCookie, punk);
end;

procedure TShellWindows.ProcessAttachDetach(fAttach: WordBool);
begin
  DefaultInterface.ProcessAttachDetach(fAttach);
end;

class function CoShellUIHelper.Create: IShellUIHelper6;
begin
  Result := CreateComObject(CLASS_ShellUIHelper) as IShellUIHelper6;
end;

class function CoShellUIHelper.CreateRemote(const MachineName: string): IShellUIHelper6;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ShellUIHelper) as IShellUIHelper6;
end;

procedure TShellUIHelper.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}';
    IntfIID:   '{987A573E-46EE-4E89-96AB-DDF7F8FDC98C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TShellUIHelper.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IShellUIHelper6;
  end;
end;

procedure TShellUIHelper.ConnectTo(svrIntf: IShellUIHelper6);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TShellUIHelper.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TShellUIHelper.GetDefaultInterface: IShellUIHelper6;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TShellUIHelper.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TShellUIHelper.Destroy;
begin
  inherited Destroy;
end;

procedure TShellUIHelper.ResetFirstBootMode;
begin
  DefaultInterface.ResetFirstBootMode;
end;

procedure TShellUIHelper.ResetSafeMode;
begin
  DefaultInterface.ResetSafeMode;
end;

procedure TShellUIHelper.RefreshOfflineDesktop;
begin
  DefaultInterface.RefreshOfflineDesktop;
end;

procedure TShellUIHelper.AddFavorite(const URL: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddFavorite(URL, EmptyParam);
end;

procedure TShellUIHelper.AddFavorite(const URL: WideString; const Title: OleVariant);
begin
  DefaultInterface.AddFavorite(URL, Title);
end;

procedure TShellUIHelper.AddChannel(const URL: WideString);
begin
  DefaultInterface.AddChannel(URL);
end;

procedure TShellUIHelper.AddDesktopComponent(const URL: WideString; const Type_: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddDesktopComponent(URL, Type_, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                             const Left: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddDesktopComponent(URL, Type_, Left, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                             const Left: OleVariant; const Top: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddDesktopComponent(URL, Type_, Left, Top, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                             const Left: OleVariant; const Top: OleVariant;
                                             const Width: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddDesktopComponent(URL, Type_, Left, Top, Width, EmptyParam);
end;

procedure TShellUIHelper.AddDesktopComponent(const URL: WideString; const Type_: WideString;
                                             const Left: OleVariant; const Top: OleVariant;
                                             const Width: OleVariant; const Height: OleVariant);
begin
  DefaultInterface.AddDesktopComponent(URL, Type_, Left, Top, Width, Height);
end;

function TShellUIHelper.IsSubscribed(const URL: WideString): WordBool;
begin
  Result := DefaultInterface.IsSubscribed(URL);
end;

procedure TShellUIHelper.NavigateAndFind(const URL: WideString; const strQuery: WideString;
                                         const varTargetFrame: OleVariant);
begin
  DefaultInterface.NavigateAndFind(URL, strQuery, varTargetFrame);
end;

procedure TShellUIHelper.ImportExportFavorites(fImport: WordBool; const strImpExpPath: WideString);
begin
  DefaultInterface.ImportExportFavorites(fImport, strImpExpPath);
end;

procedure TShellUIHelper.AutoCompleteSaveForm;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AutoCompleteSaveForm(EmptyParam);
end;

procedure TShellUIHelper.AutoCompleteSaveForm(const Form: OleVariant);
begin
  DefaultInterface.AutoCompleteSaveForm(Form);
end;

procedure TShellUIHelper.AutoScan(const strSearch: WideString; const strFailureUrl: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AutoScan(strSearch, strFailureUrl, EmptyParam);
end;

procedure TShellUIHelper.AutoScan(const strSearch: WideString; const strFailureUrl: WideString;
                                  const pvarTargetFrame: OleVariant);
begin
  DefaultInterface.AutoScan(strSearch, strFailureUrl, pvarTargetFrame);
end;

procedure TShellUIHelper.AutoCompleteAttach;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AutoCompleteAttach(EmptyParam);
end;

procedure TShellUIHelper.AutoCompleteAttach(const Reserved: OleVariant);
begin
  DefaultInterface.AutoCompleteAttach(Reserved);
end;

function TShellUIHelper.ShowBrowserUI(const bstrName: WideString; const pvarIn: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ShowBrowserUI(bstrName, pvarIn);
end;

procedure TShellUIHelper.AddSearchProvider(const URL: WideString);
begin
  DefaultInterface.AddSearchProvider(URL);
end;

procedure TShellUIHelper.RunOnceShown;
begin
  DefaultInterface.RunOnceShown;
end;

procedure TShellUIHelper.SkipRunOnce;
begin
  DefaultInterface.SkipRunOnce;
end;

procedure TShellUIHelper.CustomizeSettings(fSQM: WordBool; fPhishing: WordBool;
                                           const bstrLocale: WideString);
begin
  DefaultInterface.CustomizeSettings(fSQM, fPhishing, bstrLocale);
end;

function TShellUIHelper.SqmEnabled: WordBool;
begin
  Result := DefaultInterface.SqmEnabled;
end;

function TShellUIHelper.PhishingEnabled: WordBool;
begin
  Result := DefaultInterface.PhishingEnabled;
end;

function TShellUIHelper.BrandImageUri: WideString;
begin
  Result := DefaultInterface.BrandImageUri;
end;

procedure TShellUIHelper.SkipTabsWelcome;
begin
  DefaultInterface.SkipTabsWelcome;
end;

procedure TShellUIHelper.DiagnoseConnection;
begin
  DefaultInterface.DiagnoseConnection;
end;

procedure TShellUIHelper.CustomizeClearType(fSet: WordBool);
begin
  DefaultInterface.CustomizeClearType(fSet);
end;

function TShellUIHelper.IsSearchProviderInstalled(const URL: WideString): LongWord;
begin
  Result := DefaultInterface.IsSearchProviderInstalled(URL);
end;

function TShellUIHelper.IsSearchMigrated: WordBool;
begin
  Result := DefaultInterface.IsSearchMigrated;
end;

function TShellUIHelper.DefaultSearchProvider: WideString;
begin
  Result := DefaultInterface.DefaultSearchProvider;
end;

procedure TShellUIHelper.RunOnceRequiredSettingsComplete(fComplete: WordBool);
begin
  DefaultInterface.RunOnceRequiredSettingsComplete(fComplete);
end;

function TShellUIHelper.RunOnceHasShown: WordBool;
begin
  Result := DefaultInterface.RunOnceHasShown;
end;

function TShellUIHelper.SearchGuideUrl: WideString;
begin
  Result := DefaultInterface.SearchGuideUrl;
end;

procedure TShellUIHelper.AddService(const URL: WideString);
begin
  DefaultInterface.AddService(URL);
end;

function TShellUIHelper.IsServiceInstalled(const URL: WideString; const Verb: WideString): LongWord;
begin
  Result := DefaultInterface.IsServiceInstalled(URL, Verb);
end;

function TShellUIHelper.InPrivateFilteringEnabled: WordBool;
begin
  Result := DefaultInterface.InPrivateFilteringEnabled;
end;

procedure TShellUIHelper.AddToFavoritesBar(const URL: WideString; const Title: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddToFavoritesBar(URL, Title, EmptyParam);
end;

procedure TShellUIHelper.AddToFavoritesBar(const URL: WideString; const Title: WideString;
                                           const Type_: OleVariant);
begin
  DefaultInterface.AddToFavoritesBar(URL, Title, Type_);
end;

procedure TShellUIHelper.BuildNewTabPage;
begin
  DefaultInterface.BuildNewTabPage;
end;

procedure TShellUIHelper.SetRecentlyClosedVisible(fVisible: WordBool);
begin
  DefaultInterface.SetRecentlyClosedVisible(fVisible);
end;

procedure TShellUIHelper.SetActivitiesVisible(fVisible: WordBool);
begin
  DefaultInterface.SetActivitiesVisible(fVisible);
end;

procedure TShellUIHelper.ContentDiscoveryReset;
begin
  DefaultInterface.ContentDiscoveryReset;
end;

function TShellUIHelper.IsSuggestedSitesEnabled: WordBool;
begin
  Result := DefaultInterface.IsSuggestedSitesEnabled;
end;

procedure TShellUIHelper.EnableSuggestedSites(fEnable: WordBool);
begin
  DefaultInterface.EnableSuggestedSites(fEnable);
end;

procedure TShellUIHelper.NavigateToSuggestedSites(const bstrRelativeUrl: WideString);
begin
  DefaultInterface.NavigateToSuggestedSites(bstrRelativeUrl);
end;

procedure TShellUIHelper.ShowTabsHelp;
begin
  DefaultInterface.ShowTabsHelp;
end;

procedure TShellUIHelper.ShowInPrivateHelp;
begin
  DefaultInterface.ShowInPrivateHelp;
end;

function TShellUIHelper.msIsSiteMode: WordBool;
begin
  Result := DefaultInterface.msIsSiteMode;
end;

procedure TShellUIHelper.msSiteModeShowThumbBar;
begin
  DefaultInterface.msSiteModeShowThumbBar;
end;

function TShellUIHelper.msSiteModeAddThumbBarButton(const bstrIconURL: WideString;
                                                    const bstrTooltip: WideString): OleVariant;
begin
  Result := DefaultInterface.msSiteModeAddThumbBarButton(bstrIconURL, bstrTooltip);
end;

procedure TShellUIHelper.msSiteModeUpdateThumbBarButton(ButtonID: OleVariant; fEnabled: WordBool;
                                                        fVisible: WordBool);
begin
  DefaultInterface.msSiteModeUpdateThumbBarButton(ButtonID, fEnabled, fVisible);
end;

procedure TShellUIHelper.msSiteModeSetIconOverlay(const IconUrl: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msSiteModeSetIconOverlay(IconUrl, EmptyParam);
end;

procedure TShellUIHelper.msSiteModeSetIconOverlay(const IconUrl: WideString;
                                                  const pvarDescription: OleVariant);
begin
  DefaultInterface.msSiteModeSetIconOverlay(IconUrl, pvarDescription);
end;

procedure TShellUIHelper.msSiteModeClearIconOverlay;
begin
  DefaultInterface.msSiteModeClearIconOverlay;
end;

procedure TShellUIHelper.msAddSiteMode;
begin
  DefaultInterface.msAddSiteMode;
end;

procedure TShellUIHelper.msSiteModeCreateJumpList(const bstrHeader: WideString);
begin
  DefaultInterface.msSiteModeCreateJumpList(bstrHeader);
end;

procedure TShellUIHelper.msSiteModeAddJumpListItem(const bstrName: WideString;
                                                   const bstrActionUri: WideString;
                                                   const bstrIconUri: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msSiteModeAddJumpListItem(bstrName, bstrActionUri, bstrIconUri, EmptyParam);
end;

procedure TShellUIHelper.msSiteModeAddJumpListItem(const bstrName: WideString;
                                                   const bstrActionUri: WideString;
                                                   const bstrIconUri: WideString;
                                                   const pvarWindowType: OleVariant);
begin
  DefaultInterface.msSiteModeAddJumpListItem(bstrName, bstrActionUri, bstrIconUri, pvarWindowType);
end;

procedure TShellUIHelper.msSiteModeClearJumpList;
begin
  DefaultInterface.msSiteModeClearJumpList;
end;

procedure TShellUIHelper.msSiteModeShowJumpList;
begin
  DefaultInterface.msSiteModeShowJumpList;
end;

function TShellUIHelper.msSiteModeAddButtonStyle(uiButtonID: OleVariant;
                                                 const bstrIconURL: WideString;
                                                 const bstrTooltip: WideString): OleVariant;
begin
  Result := DefaultInterface.msSiteModeAddButtonStyle(uiButtonID, bstrIconURL, bstrTooltip);
end;

procedure TShellUIHelper.msSiteModeShowButtonStyle(uiButtonID: OleVariant; uiStyleID: OleVariant);
begin
  DefaultInterface.msSiteModeShowButtonStyle(uiButtonID, uiStyleID);
end;

procedure TShellUIHelper.msSiteModeActivate;
begin
  DefaultInterface.msSiteModeActivate;
end;

function TShellUIHelper.msIsSiteModeFirstRun(fPreserveState: WordBool): OleVariant;
begin
  Result := DefaultInterface.msIsSiteModeFirstRun(fPreserveState);
end;

procedure TShellUIHelper.msAddTrackingProtectionList(const URL: WideString;
                                                     const bstrFilterName: WideString);
begin
  DefaultInterface.msAddTrackingProtectionList(URL, bstrFilterName);
end;

function TShellUIHelper.msTrackingProtectionEnabled: WordBool;
begin
  Result := DefaultInterface.msTrackingProtectionEnabled;
end;

function TShellUIHelper.msActiveXFilteringEnabled: WordBool;
begin
  Result := DefaultInterface.msActiveXFilteringEnabled;
end;

function TShellUIHelper.msProvisionNetworks(const bstrProvisioningXml: WideString): OleVariant;
begin
  Result := DefaultInterface.msProvisionNetworks(bstrProvisioningXml);
end;

procedure TShellUIHelper.msReportSafeUrl;
begin
  DefaultInterface.msReportSafeUrl;
end;

procedure TShellUIHelper.msSiteModeRefreshBadge;
begin
  DefaultInterface.msSiteModeRefreshBadge;
end;

procedure TShellUIHelper.msSiteModeClearBadge;
begin
  DefaultInterface.msSiteModeClearBadge;
end;

procedure TShellUIHelper.msDiagnoseConnectionUILess;
begin
  DefaultInterface.msDiagnoseConnectionUILess;
end;

procedure TShellUIHelper.msLaunchNetworkClientHelp;
begin
  DefaultInterface.msLaunchNetworkClientHelp;
end;

procedure TShellUIHelper.msChangeDefaultBrowser(fChange: WordBool);
begin
  DefaultInterface.msChangeDefaultBrowser(fChange);
end;

procedure TShellUIHelper.msStopPeriodicTileUpdate;
begin
  DefaultInterface.msStopPeriodicTileUpdate;
end;

procedure TShellUIHelper.msStartPeriodicTileUpdate(pollingUris: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicTileUpdate(pollingUris, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicTileUpdate(pollingUris, startTime, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicTileUpdate(pollingUris: OleVariant; startTime: OleVariant;
                                                   uiUpdateRecurrence: OleVariant);
begin
  DefaultInterface.msStartPeriodicTileUpdate(pollingUris, startTime, uiUpdateRecurrence);
end;

procedure TShellUIHelper.msStartPeriodicTileUpdateBatch(pollingUris: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicTileUpdateBatch(pollingUris, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicTileUpdateBatch(pollingUris: OleVariant;
                                                        startTime: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicTileUpdateBatch(pollingUris, startTime, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicTileUpdateBatch(pollingUris: OleVariant;
                                                        startTime: OleVariant;
                                                        uiUpdateRecurrence: OleVariant);
begin
  DefaultInterface.msStartPeriodicTileUpdateBatch(pollingUris, startTime, uiUpdateRecurrence);
end;

procedure TShellUIHelper.msClearTile;
begin
  DefaultInterface.msClearTile;
end;

procedure TShellUIHelper.msEnableTileNotificationQueue(fChange: WordBool);
begin
  DefaultInterface.msEnableTileNotificationQueue(fChange);
end;

function TShellUIHelper.msPinnedSiteState: OleVariant;
begin
  Result := DefaultInterface.msPinnedSiteState;
end;

procedure TShellUIHelper.msEnableTileNotificationQueueForSquare150x150(fChange: WordBool);
begin
  DefaultInterface.msEnableTileNotificationQueueForSquare150x150(fChange);
end;

procedure TShellUIHelper.msEnableTileNotificationQueueForWide310x150(fChange: WordBool);
begin
  DefaultInterface.msEnableTileNotificationQueueForWide310x150(fChange);
end;

procedure TShellUIHelper.msEnableTileNotificationQueueForSquare310x310(fChange: WordBool);
begin
  DefaultInterface.msEnableTileNotificationQueueForSquare310x310(fChange);
end;

procedure TShellUIHelper.msScheduledTileNotification(const bstrNotificationXml: WideString;
                                                     const bstrNotificationId: WideString;
                                                     const bstrNotificationTag: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msScheduledTileNotification(bstrNotificationXml, bstrNotificationId,
                                               bstrNotificationTag, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.msScheduledTileNotification(const bstrNotificationXml: WideString;
                                                     const bstrNotificationId: WideString;
                                                     const bstrNotificationTag: WideString;
                                                     startTime: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msScheduledTileNotification(bstrNotificationXml, bstrNotificationId,
                                               bstrNotificationTag, startTime, EmptyParam);
end;

procedure TShellUIHelper.msScheduledTileNotification(const bstrNotificationXml: WideString;
                                                     const bstrNotificationId: WideString;
                                                     const bstrNotificationTag: WideString;
                                                     startTime: OleVariant;
                                                     expirationTime: OleVariant);
begin
  DefaultInterface.msScheduledTileNotification(bstrNotificationXml, bstrNotificationId,
                                               bstrNotificationTag, startTime, expirationTime);
end;

procedure TShellUIHelper.msRemoveScheduledTileNotification(const bstrNotificationId: WideString);
begin
  DefaultInterface.msRemoveScheduledTileNotification(bstrNotificationId);
end;

procedure TShellUIHelper.msStartPeriodicBadgeUpdate(const pollingUri: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicBadgeUpdate(pollingUri, EmptyParam, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicBadgeUpdate(const pollingUri: WideString;
                                                    startTime: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.msStartPeriodicBadgeUpdate(pollingUri, startTime, EmptyParam);
end;

procedure TShellUIHelper.msStartPeriodicBadgeUpdate(const pollingUri: WideString;
                                                    startTime: OleVariant;
                                                    uiUpdateRecurrence: OleVariant);
begin
  DefaultInterface.msStartPeriodicBadgeUpdate(pollingUri, startTime, uiUpdateRecurrence);
end;

procedure TShellUIHelper.msStopPeriodicBadgeUpdate;
begin
  DefaultInterface.msStopPeriodicBadgeUpdate;
end;

procedure TShellUIHelper.msLaunchInternetOptions;
begin
  DefaultInterface.msLaunchInternetOptions;
end;

class function CoShellNameSpace.Create: IShellNameSpace;
begin
  Result := CreateComObject(CLASS_ShellNameSpace) as IShellNameSpace;
end;

class function CoShellNameSpace.CreateRemote(const MachineName: string): IShellNameSpace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ShellNameSpace) as IShellNameSpace;
end;

procedure TShellNameSpace.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{55136805-B2DE-11D1-B9F2-00A0C98BC547}';
    IntfIID:   '{E572D3C9-37BE-4AE2-825D-D521763E3108}';
    EventIID:  '{55136806-B2DE-11D1-B9F2-00A0C98BC547}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TShellNameSpace.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IShellNameSpace;
  end;
end;

procedure TShellNameSpace.ConnectTo(svrIntf: IShellNameSpace);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TShellNameSpace.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TShellNameSpace.GetDefaultInterface: IShellNameSpace;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TShellNameSpace.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TShellNameSpace.Destroy;
begin
  inherited Destroy;
end;

procedure TShellNameSpace.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnFavoritesSelectionChange) then
         FOnFavoritesSelectionChange(Self,
                                     Params[0] {Integer},
                                     Params[1] {Integer},
                                     Params[2] {const WideString},
                                     Params[3] {const WideString},
                                     Params[4] {Integer},
                                     Params[5] {const WideString},
                                     Params[6] {Integer});
    2: if Assigned(FOnSelectionChange) then
         FOnSelectionChange(Self);
    3: if Assigned(FOnDoubleClick) then
         FOnDoubleClick(Self);
    4: if Assigned(FOnInitialized) then
         FOnInitialized(Self);
  end; {case DispID}
end;

function TShellNameSpace.Get_SubscriptionsEnabled: WordBool;
begin
  Result := DefaultInterface.SubscriptionsEnabled;
end;

function TShellNameSpace.Get_EnumOptions: Integer;
begin
  Result := DefaultInterface.EnumOptions;
end;

procedure TShellNameSpace.Set_EnumOptions(pgrfEnumFlags: Integer);
begin
  DefaultInterface.EnumOptions := pgrfEnumFlags;
end;

function TShellNameSpace.Get_SelectedItem: IDispatch;
begin
  Result := DefaultInterface.SelectedItem;
end;

procedure TShellNameSpace.Set_SelectedItem(const pItem: IDispatch);
begin
  DefaultInterface.SelectedItem := pItem;
end;

function TShellNameSpace.Get_Root: OleVariant;
begin
  Result := DefaultInterface.Root;
end;

procedure TShellNameSpace.Set_Root(pvar: OleVariant);
begin
  DefaultInterface.Root := pvar;
end;

function TShellNameSpace.Get_Depth: SYSINT;
begin
  Result := DefaultInterface.Depth;
end;

procedure TShellNameSpace.Set_Depth(piDepth: SYSINT);
begin
  DefaultInterface.Depth := piDepth;
end;

function TShellNameSpace.Get_Mode: SYSUINT;
begin
  Result := DefaultInterface.Mode;
end;

procedure TShellNameSpace.Set_Mode(puMode: SYSUINT);
begin
  DefaultInterface.Mode := puMode;
end;

function TShellNameSpace.Get_Flags: LongWord;
begin
  Result := DefaultInterface.Flags;
end;

procedure TShellNameSpace.Set_Flags(pdwFlags: LongWord);
begin
  DefaultInterface.Flags := pdwFlags;
end;

procedure TShellNameSpace.Set_TVFlags(dwFlags: LongWord);
begin
  DefaultInterface.TVFlags := dwFlags;
end;

function TShellNameSpace.Get_TVFlags: LongWord;
begin
  Result := DefaultInterface.TVFlags;
end;

function TShellNameSpace.Get_Columns: WideString;
begin
  Result := DefaultInterface.Columns;
end;

procedure TShellNameSpace.Set_Columns(const bstrColumns: WideString);
begin
  DefaultInterface.Columns := bstrColumns;
end;

function TShellNameSpace.Get_CountViewTypes: SYSINT;
begin
  Result := DefaultInterface.CountViewTypes;
end;

procedure TShellNameSpace.MoveSelectionUp;
begin
  DefaultInterface.MoveSelectionUp;
end;

procedure TShellNameSpace.MoveSelectionDown;
begin
  DefaultInterface.MoveSelectionDown;
end;

procedure TShellNameSpace.ResetSort;
begin
  DefaultInterface.ResetSort;
end;

procedure TShellNameSpace.NewFolder;
begin
  DefaultInterface.NewFolder;
end;

procedure TShellNameSpace.Synchronize;
begin
  DefaultInterface.Synchronize;
end;

procedure TShellNameSpace.Import;
begin
  DefaultInterface.Import;
end;

procedure TShellNameSpace.Export;
begin
  DefaultInterface.Export;
end;

procedure TShellNameSpace.InvokeContextMenuCommand(const strCommand: WideString);
begin
  DefaultInterface.InvokeContextMenuCommand(strCommand);
end;

procedure TShellNameSpace.MoveSelectionTo;
begin
  DefaultInterface.MoveSelectionTo;
end;

function TShellNameSpace.CreateSubscriptionForSelection: WordBool;
begin
  Result := DefaultInterface.CreateSubscriptionForSelection;
end;

function TShellNameSpace.DeleteSubscriptionForSelection: WordBool;
begin
  Result := DefaultInterface.DeleteSubscriptionForSelection;
end;

procedure TShellNameSpace.SetRoot(const bstrFullPath: WideString);
begin
  DefaultInterface.SetRoot(bstrFullPath);
end;

procedure TShellNameSpace.SetViewType(iType: SYSINT);
begin
  DefaultInterface.SetViewType(iType);
end;

function TShellNameSpace.SelectedItems: IDispatch;
begin
  Result := DefaultInterface.SelectedItems;
end;

procedure TShellNameSpace.Expand(var_: OleVariant; iDepth: SYSINT);
begin
  DefaultInterface.Expand(var_, iDepth);
end;

procedure TShellNameSpace.UnselectAll;
begin
  DefaultInterface.UnselectAll;
end;

class function CoCScriptErrorList.Create: IScriptErrorList;
begin
  Result := CreateComObject(CLASS_CScriptErrorList) as IScriptErrorList;
end;

class function CoCScriptErrorList.CreateRemote(const MachineName: string): IScriptErrorList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CScriptErrorList) as IScriptErrorList;
end;

begin
  FSetExceptMask(femALLEXCEPT);
end.
