{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.FontManager;

{$SCOPEDENUMS ON}

interface

uses
  System.Classes, System.SysUtils, System.UITypes;

type
  /// <summary>Information about registered font.</summary>
  TFontInfo = record
    /// <summary>Font family name.</summary>
    FamilyName: TFontName;
  end;

  /// <summary>
  ///   A service that manages fonts in the application. Allows you to add a custom font file in runtime for future use
  ///   in the app.
  /// </summary>
  IFMXFontManagerService = interface
  ['{2F494059-AFEF-4652-93BB-8DE03F41D822}']
    /// <summary>Adds custom font file name to font collection.</summary>
    /// <remarks>The file to be added must exist during the lifetime of the application.</remarks>
    function AddCustomFontFromFile(const AFileName: TFileName): Boolean;
    /// <summary>Adds font from application resources.</summary>
    function AddCustomFontFromResource(const AResourceName: string): Boolean;
    /// <summary>Adds font from stream.</summary>
    /// <remarks>The font manager makes copy of passed stream.</remarks>
    function AddCustomFontFromStream(const AStream: TStream): Boolean;
    /// <summary>If specified font family exists in custom font collection, it returns true.</summary>
    function HasCustomFont(const AFontFamily: TFontName): Boolean;
    /// <summary>If there are any registered custom fonts, it returns true.</summary>
    function HasCustomFonts: Boolean;
    /// <summary>Returns font information of custom font by specified index.</summary>
    function GetCustomFontInfo(const AIndex: Integer): TFontInfo;
    /// <summary>Returns count of registered custom fonts.</summary>
    function GetCustomFontInfoCount: Integer;
  end;

  TFontManager = class
  private
    class function GetService: IFMXFontManagerService; static;
    class function GetCustomFontInfo(const AIndex: Integer): TFontInfo; static;
    class function GetCustomFontInfoCount: Integer; static;
  public
    { Custom fonts }
    /// <summary>Adds custom font file name to font collection.</summary>
    /// <remarks>The file to be added must exist during the lifetime of the application.</remarks>
    class function AddCustomFontFromFile(const AFileName: TFileName): Boolean;
    /// <summary>Adds font from application resources.</summary>
    class function AddCustomFontFromResource(const AResourceName: string): Boolean;
    /// <summary>Adds font from stream.</summary>
    /// <remarks>The font manager makes copy of passed stream.</remarks>
    class function AddCustomFontFromStream(const AStream: TStream): Boolean;
    /// <summary>If specified font family exists in custom font collection, it returns true.</summary>
    class function HasCustomFont(const AFontFamily: TFontName): Boolean;
    /// <summary>If there are any registered custom fonts, it returns true.</summary>
    class function HasCustomFonts: Boolean;
    /// <summary>Returns font information of custom font by specified index.</summary>
    class property CustomFontInfo[const AIndex: Integer]: TFontInfo read GetCustomFontInfo;
    /// <summary>Returns count of registered custom fonts.</summary>
    class property CustomFontInfoCount: Integer read GetCustomFontInfoCount;

    { Common }
    class function IsSupported: Boolean;
    class property Service: IFMXFontManagerService read GetService;
  end;

implementation

uses
  FMX.Platform;

{ TFontManager }

class function TFontManager.AddCustomFontFromFile(const AFileName: TFileName): Boolean;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.AddCustomFontFromFile(AFileName)
  else
    Result := False;
end;

class function TFontManager.AddCustomFontFromResource(const AResourceName: string): Boolean;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.AddCustomFontFromResource(AResourceName)
  else
    Result := False;
end;

class function TFontManager.AddCustomFontFromStream(const AStream: TStream): Boolean;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.AddCustomFontFromStream(AStream)
  else
    Result := False;
end;

class function TFontManager.GetCustomFontInfo(const AIndex: Integer): TFontInfo;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.GetCustomFontInfo(AIndex)
  else
    raise EUnsupportedPlatformService.Create('IFMXFontManagerService');
end;

class function TFontManager.GetCustomFontInfoCount: Integer;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.GetCustomFontInfoCount
  else
    Result := 0;
end;

class function TFontManager.GetService: IFMXFontManagerService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Result);
end;

class function TFontManager.HasCustomFont(const AFontFamily: TFontName): Boolean;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.HasCustomFont(AFontFamily)
  else
    Result := False;
end;

class function TFontManager.HasCustomFonts: Boolean;
var
  Service: IFMXFontManagerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, Service) then
    Result := Service.HasCustomFonts
  else
    Result := False;
end;

class function TFontManager.IsSupported: Boolean;
begin
  Result := TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService);
end;

end.
