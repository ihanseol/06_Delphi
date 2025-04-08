{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.Authenticator.OAuth.WebForm.Win;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  SHDocVw;

type
  TOAuth2WebFormRedirectEvent = procedure(const AURL: string; var DoCloseWebView: Boolean) of object;
  TOAuth2WebFormTitleChangedEvent = procedure(const ATitle: string; var DoCloseWebView: Boolean) of object;

  Tfrm_OAuthWebForm = class(TForm)
    Bevel1: TBevel;
    btn_Close: TButton;
    Browser: TWebBrowser;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BrowserTitleChange(ASender: TObject; const Text: WideString);
    procedure FormCreate(Sender: TObject);
    procedure BrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure BrowserBeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
  private
    { Private declarations }
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    FOnBrowserTitleChanged : TOAuth2WebFormTitleChangedEvent;

    FLastTitle: string;
    FLastURL: string;
  public
    { Public declarations }
    procedure ShowWithURL(const AURL: string);
    procedure ShowModalWithURL(const AURL: string); //deprecated 'Please use ShowWithURL() instead. Sorry for inconvenience.';

    property LastTitle: string read FLastTitle;
    property LastURL: string read FLastURL;

    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write FOnAfterRedirect;
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write FOnBeforeRedirect;
    property OnTitleChanged: TOAuth2WebFormTitleChangedEvent read FOnBrowserTitleChanged write FOnBrowserTitleChanged;
  end;

var
  frm_OAuthWebForm: Tfrm_OAuthWebForm;

implementation

{$R *.dfm}

uses
  REST.Authenticator.OAuth;

procedure Tfrm_OAuthWebForm.FormCreate(Sender: TObject);
begin
  FOnAfterRedirect := nil;
  FOnBeforeRedirect:= nil;
  FOnBrowserTitleChanged:= nil;

  FLastTitle := '';
  FLastURL := '';
end;

procedure Tfrm_OAuthWebForm.BrowserBeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  LDoCloseForm: Boolean;
begin
  if Assigned(FOnBeforeRedirect) then
  begin
    LDoCloseForm := False;
    FOnBeforeRedirect(URL, LDoCloseForm);
    if LDoCloseForm then
    begin
      Cancel := True;
      Close;
    end;
  end;
end;

procedure Tfrm_OAuthWebForm.BrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
  LDoCloseForm: Boolean;
begin
  FLastURL := VarToStrDef(URL, '');
  if Assigned(FOnAfterRedirect) then
  begin
    LDoCloseForm := False;
    FOnAfterRedirect(FLastURL, LDoCloseForm);
    if LDoCloseForm then
      Close;
  end;
end;

procedure Tfrm_OAuthWebForm.BrowserTitleChange(ASender: TObject; const Text: WideString);
var
  LCloseForm: Boolean;
begin
  if Text <> FLastTitle then
  begin
    FLastTitle := Text;
    if Assigned(FOnBrowserTitleChanged) then
    begin
      LCloseForm := False;
      FOnBrowserTitleChanged(FLastTitle, LCloseForm);
      if LCloseForm then
        Close;
    end;
  end;
end;

procedure Tfrm_OAuthWebForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure Tfrm_OAuthWebForm.ShowModalWithURL(const AURL: string);
begin
  // for backwards-compatibility only
  ShowWithURL(AURL);
end;

procedure Tfrm_OAuthWebForm.ShowWithURL(const AURL: string);
begin
  Browser.Navigate(AURL);
  ShowModal;
end;

{ TEventsAdaptor }

type
  TEventsAdaptor = class(TObject)
  private
    FAuthenticator: TOAuth2Authenticator;
    FBeforeRedirectProc,
    FAfterRedirectProc: TOAuth2Authenticator.TWebLoginRedirectProc;
    FTitleChangedProc: TOAuth2Authenticator.TWebLoginTitleChangedProc;
    FOptions: TOAuth2Authenticator.TProviderOptions;
    FLogged: Boolean;
    procedure DoBeforeRedirect(const AURL: string; var DoCloseWebView: Boolean);
    procedure DoAfterRedirect(const AURL: string; var DoCloseWebView: Boolean);
    procedure DoTitleChanged(const ATitle: string; var DoCloseWebView: Boolean);
  end;

procedure TEventsAdaptor.DoBeforeRedirect(const AURL: string;
  var DoCloseWebView: Boolean);
begin
  if Assigned(FBeforeRedirectProc) then
    FBeforeRedirectProc(FAuthenticator, AURL, DoCloseWebView);
  FLogged := DoCloseWebView;
end;

procedure TEventsAdaptor.DoAfterRedirect(const AURL: string;
  var DoCloseWebView: Boolean);
begin
  if Assigned(FAfterRedirectProc) then
    FAfterRedirectProc(FAuthenticator, AURL, DoCloseWebView);
  FLogged := DoCloseWebView;
end;

procedure TEventsAdaptor.DoTitleChanged(const ATitle: string;
  var DoCloseWebView: Boolean);
begin
  if Assigned(FTitleChangedProc) then
    FTitleChangedProc(FAuthenticator, ATitle, DoCloseWebView);
  FLogged := DoCloseWebView;
end;

initialization
  TOAuth2Authenticator.WebLoginProc :=
    procedure (AAuthenticator: TOAuth2Authenticator;
      const AProvider: string; var ALogged: Boolean)
    var
      LForm: Tfrm_OAuthWebForm;
      LAdaptor: TEventsAdaptor;
    begin
      LForm := Tfrm_OAuthWebForm.Create(nil);
      LAdaptor := TEventsAdaptor.Create;
      try
        LAdaptor.FAuthenticator := AAuthenticator;
        AAuthenticator.GetWebLoginProvider(AProvider, LAdaptor.FBeforeRedirectProc,
          LAdaptor.FAfterRedirectProc, LAdaptor.FTitleChangedProc, LAdaptor.FOptions);

        if TOAuth2Authenticator.TProviderOption.EdgeIfAvailable in LAdaptor.FOptions then
          LForm.Browser.SelectedEngine := TWebBrowser.TSelectedEngine.EdgeIfAvailable
        else
          LForm.Browser.SelectedEngine := TWebBrowser.TSelectedEngine.IEOnly;
        LForm.OnTitleChanged := LAdaptor.DoTitleChanged;
        LForm.OnBeforeRedirect := LAdaptor.DoBeforeRedirect;
        LForm.OnAfterRedirect := LAdaptor.DoAfterRedirect;

        LForm.ShowModalWithURL(AAuthenticator.AuthorizationRequestURI);
        ALogged := LAdaptor.FLogged;
      finally
        LForm.Free;
        LAdaptor.Free;
      end;
    end;

end.
