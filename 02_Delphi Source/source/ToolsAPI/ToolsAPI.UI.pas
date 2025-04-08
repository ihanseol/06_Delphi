{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit ToolsAPI.UI;

interface

{ !!! Please keep this unit's uses clause clean of *any* private IDE             !!! }
{ !!! units.  Before making modifications to this unit, please see senior IDE R&D engineer !!! }

uses
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls;

(*$HPPEMIT 'DEFINE_GUID(IID_INTAIDEUIServices290,0xC367DC4F,0x58E9,0x4BC1,0x96,0xD0,0x60,0x00,0xC3,0x09,0xF7,0x9C);'*)
(*$HPPEMIT 'DEFINE_GUID(IID_INTAIDEUIServices,0x14C3D21A,0xFB47,0x43A9,0x9B,0xC1,0x35,0xBE,0x3E,0xF0,0x30,0xED);'*)

type
  /// <summary>
  /// IDE palette colors
  /// </summary>
  TIDEThemeColors = (itcBlue, itcRed, itcYellow, itcGreen, itcViolet, itcGray, itcOrange);

  INTAIDEUIServices290 = interface
    ['{C367DC4F-58E9-4BC1-96D0-6000C309F79C}']
    function GetThemeAwareColor(ITC: TIDEThemeColors): TColor;
    function GetDarkColor(ITC: TIDEThemeColors): TColor;
    function GetGenericColor(ITC: TIDEThemeColors): TColor;
    function GetLightColor(ITC: TIDEThemeColors): TColor;
    /// <summary>
    /// Sets up or inserts a custom title bar in the specified form using the IDE current title bar settings.
    /// </summary>
    /// <param name="AForm">The form to update.</param>
    /// <param name="ATitleBar">The title bar to use. If this is <c>nil</c>, a new <c>TTitleBarPanel</c> control will be created.</param>
    /// <param name="InsertRootPanel">If <c>True</c>, a parent container will be inserted in the form.</param>
    procedure SetupTitleBar(AForm: TCustomForm; ATitleBar: TTitleBarPanel; InsertRootPanel: Boolean = False);
    /// <summary>
    /// MessageDlg Displays a message dialog box in the center of the screen, is based on Vcl.Dialogs.MessageDlg.
    /// Supports IDE UI/Styling, IDE Titlebar
    /// </summary>
    /// <param name="Msg">is the content of the message that appears.</param>
    /// <param name="DlgType">indicates the purpose of the dialog.</param>
    /// <param name="Buttons">
    /// is a set of buttons and indicates what buttons should appear in the message box.
    /// The buttons appear in the same order they appear in the Buttons set.
    /// </param>
    /// <param name="HelpCtx">
    /// specifies the context ID for the Help topic that should appear when the user clicks the Help button or presses F1 while the dialog is displayed.
    /// </param>
    function MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload;
    /// <summary>
    /// MessageDlg Displays a message dialog box in the center of the screen, is based on Vcl.Dialogs.MessageDlg.
    /// Supports IDE UI/Styling, IDE Titlebar
    /// </summary>
    /// <param name="Msg">is the content of the message that appears.</param>
    /// <param name="DlgType">indicates the purpose of the dialog.</param>
    /// <param name="Buttons">
    /// is a set of buttons and indicates what buttons should appear in the message box.
    /// The buttons appear in the same order they appear in the Buttons set.
    /// </param>
    /// <param name="HelpCtx">
    /// specifies the context ID for the Help topic that should appear when the user clicks the Help button or presses F1 while the dialog is displayed.
    /// </param>
    /// <param name="DefaultButton">
    /// specifies which button from among those specified by Buttons is the default button (focused button) for the dialog..
    /// </param>
    function MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload;
    /// <summary>
    /// Displays an input dialog box that lets the user enter a string, double, or integer.
    /// </summary>
    /// <param name="ACaption">The caption of the dialog box.</param>
    /// <param name="APrompt">The text that prompts the user to enter input in the edit box.</param>
    /// <param name="ADefault">The value that appears in the edit box when the dialog box first appears.</param>
    /// <returns>If the user chooses the Cancel button, InputBox returns the default value. If the user chooses the OK button, InputBox returns the value in the edit box.</returns>
    function InputBox(const ACaption, APrompt, ADefault: string): string;
    /// <summary>
    /// Displays an input dialog box that lets the user enter a string, double, or integer.
    /// </summary>
    /// <param name="ACaption">The caption of the dialog box.</param>
    /// <param name="APrompts">An array of strings that prompt the user to enter input in the edit box.</param>
    /// <param name="AValues">An array of strings that contains the value that appears in the edit box when the dialog box first appears and which returns the value that the user enters.</param>
    /// <param name="CloseQueryFunc">An optional function that gets called when the input dialog box is closed. The function should return true to allow the dialog box to close, or false to prevent it from closing.</param>
    /// <returns>InputQuery returns true if the user chooses OK, and false if the user chooses Cancel or presses the Esc key.</returns>
    function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; const CloseQueryFunc: TInputCloseQueryFunc = nil): Boolean; overload;
    function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; const CloseQueryEvent: TInputCloseQueryEvent; Context: TObject = nil): Boolean; overload;
    function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean; overload;
    procedure ShowMessage(const Msg: string);

    /// <summary>
    /// 99% of the time ThemeAwareColors is the one you want to use: it will
    /// automatically return the right thing for you based on theme.
    /// This is first, so it will show first in code completion
    /// </summary>
    property ThemeAwareColors[ITC: TIDEThemeColors]: TColor read GetThemeAwareColor;
    /// <summary>
    /// Returns a "Light" version of the IDE color that is suitable to be used in "Dark" VCL Styles.
    /// </summary>
    property LightColors[ITC: TIDEThemeColors]: TColor read GetLightColor;
    /// <summary>
    /// Returns a "Dark" version of the IDE color that is suitable to be used in "Light" VCL Styles.
    /// </summary>
    property DarkColors[ITC: TIDEThemeColors]: TColor read GetDarkColor;
    /// <summary>
    /// Generic colours are used in rare cases where the light/darkness doesn't
    /// matter, eg some alert red text
    /// </summary>
    property GenericColors[ITC: TIDEThemeColors]: TColor read GetGenericColor;
  end;

  /// <summary>
  ///  Provide access to IDE UI Services
  /// </summary>
  INTAIDEUIServices = interface(INTAIDEUIServices290)
    ['{14C3D21A-FB47-43A9-9BC1-35BE3EF030ED}']
  end;

implementation

end.


