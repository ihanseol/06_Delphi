{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit REST.Authenticator.OAuth.WebForm.FMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.WebBrowser, FMX.StdCtrls;

type
  TOAuth2WebFormRedirectEvent = procedure(const AURL: string; var DoCloseWebView: Boolean) of object;
  TOAuth2WebFormTitleChangedEvent = procedure(const ATitle: string; var DoCloseWebView: Boolean) of object;

  Tfrm_OAuthWebForm = class(TForm)
   {$NODEFINE Tfrm_OAuthWebForm}
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    WebBrowser: TWebBrowser;
    btn_Close: TButton;
    procedure FormCreate(Sender: TObject);
    procedure WebBrowserShouldStartLoadWithRequest(ASender: TObject;
      const URL: string);
    procedure WebBrowserDidFinishLoad(ASender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    FOnBrowserTitleChanged : TOAuth2WebFormTitleChangedEvent;

    FLastURL: string;
  public
    { Public declarations }
    procedure ShowWithURL(const AURL: string);

    property LastURL: string read FLastURL;

    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write FOnAfterRedirect;
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write FOnBeforeRedirect;
    property OnTitleChanged : TOAuth2WebFormTitleChangedEvent read FOnBrowserTitleChanged write FOnBrowserTitleChanged;
  end;

var
  frm_OAuthWebForm: Tfrm_OAuthWebForm;
  {$NODEFINE frm_OAuthWebForm}

implementation

{$R *.fmx}

uses
  REST.Authenticator.OAuth;

type
  TWebBrowserAccess = class(TWebBrowser);

procedure Tfrm_OAuthWebForm.FormCreate(Sender: TObject);
begin
  FOnAfterRedirect := nil;
  FOnBeforeRedirect:= nil;
  FOnBrowserTitleChanged:= nil;

  FLastURL := '';
end;

procedure Tfrm_OAuthWebForm.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_OAuthWebForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TWebBrowserAccess(WebBrowser).Hide;
end;

procedure Tfrm_OAuthWebForm.WebBrowserDidFinishLoad(ASender: TObject);
var
  LDoCloseForm: Boolean;
begin
  FLastURL := WebBrowser.URL;
  if Assigned(FOnAfterRedirect) then
  begin
    LDoCloseForm := False;
    FOnAfterRedirect(FLastURL, LDoCloseForm);
    if LDoCloseForm then
      Close;
  end;
end;

procedure Tfrm_OAuthWebForm.WebBrowserShouldStartLoadWithRequest(
  ASender: TObject; const URL: string);
var
  LDoCloseForm: Boolean;
begin
  if Assigned(FOnBeforeRedirect) then
  begin
    LDoCloseForm:= FALSE;
    FOnBeforeRedirect(URL, LDoCloseForm);
    if LDoCloseForm then
      Close;
  end;
end;

procedure Tfrm_OAuthWebForm.ShowWithURL(const AURL: string);
begin
  WebBrowser.CanFocus := True;
  WebBrowser.Navigate(AURL);
  WebBrowser.SetFocus;
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
          LForm.WebBrowser.WindowsEngine := TWindowsEngine.EdgeIfAvailable
        else
          LForm.WebBrowser.WindowsEngine := TWindowsEngine.IEOnly;
        LForm.OnTitleChanged := LAdaptor.DoTitleChanged;
        LForm.OnBeforeRedirect := LAdaptor.DoBeforeRedirect;
        LForm.OnAfterRedirect := LAdaptor.DoAfterRedirect;

        LForm.ShowWithURL(AAuthenticator.AuthorizationRequestURI);
        ALogged := LAdaptor.FLogged;
      finally
        LForm.Free;
        LAdaptor.Free;
      end;
    end;

end.
