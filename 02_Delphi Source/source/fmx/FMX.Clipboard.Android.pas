{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2012-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Clipboard.Android;

interface

{$SCOPEDENUMS ON}

implementation

uses
  System.Rtti, System.Classes, System.Generics.Collections, System.Types, System.SysUtils, System.RTLConsts,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes, Androidapi.Helpers, Androidapi.JNIBridge,
  Androidapi.JNI.App, Androidapi.JNI, Androidapi.JNI.Os,
  FMX.Platform, FMX.Clipboard, FMX.Surfaces, FMX.Graphics, FMX.Utils, FMX.Types, FMX.Consts, FMX.Helpers.Android;


type
  TAndroidClipboardWrapper = class
  strict private
    FClipboardManager: Jcontent_ClipboardManager;
    function HasContent(const MimeType: JString): Boolean; inline;
  public
    constructor Create;
    destructor Destroy; override;
    //
    function HasText: Boolean;
    function GetText: string;
    procedure SetText(Value: string; IsSensitive: Boolean);
    function HasData(Name: string): Boolean;
    function GetData(Name: string; Stream: TStream): Boolean;
    procedure SetData(Name: string; Stream: TStream);
  end;

  TAndroidClipboardService = class(TInterfacedObject, IFMXClipboardService, IFMXExtendedClipboardService)
  private
    FClipboardWrapper: TAndroidClipboardWrapper;
    FClipboardFormats: TList<string>;
    procedure CheckWrapper;
    procedure CheckDictionary;
  public
    destructor Destroy; override;
    { IFMXClipboardService }
    function GetClipboard: TValue;
    procedure SetClipboard(Value: TValue);
    { IFMXExtendedClipboardService }
    function HasText: Boolean;
    function GetText: string;
    procedure SetText(const Value: string; IsSensitive: Boolean = False);
    function HasImage: Boolean;
    function GetImage: TBitmapSurface;
    procedure SetImage(const Value: TBitmapSurface);
    procedure RegisterCustomFormat(const AFormatName: string);
    function IsCustomFormatRegistered(const AFormatName: string): Boolean;
    procedure UnregisterCustomFormat(const AFormatName: string);
    function HasCustomFormat(const AFormatName: string): Boolean;
    function GetCustomFormat(const AFormatName: string; const AStream: TStream): Boolean;
    procedure SetCustomFormat(const AFormatName: string; const AStream: TStream);
  end;

const
  cnAFormatNameParameter = 'AFormatName';
  cnAStreamParameter = 'AStream';

var
  AndroidClipboard: TAndroidClipboardService;

procedure RegisterService;
begin
  AndroidClipboard := TAndroidClipboardService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXClipboardService, AndroidClipboard);
  TPlatformServices.Current.AddPlatformService(IFMXExtendedClipboardService, AndroidClipboard);
end;

procedure UnregisterService;
begin
  if TPlatformServices.Current <> nil then
  begin
    TPlatformServices.Current.RemovePlatformService(IFMXClipboardService);
    TPlatformServices.Current.RemovePlatformService(IFMXExtendedClipboardService);
  end;
end;

{ TAndroidClipboardWrapper }

constructor TAndroidClipboardWrapper.Create;
begin
  FClipboardManager := TJcontent_ClipboardManager.Wrap(TAndroidHelper.Context.
    getSystemService(TJContext.JavaClass.CLIPBOARD_SERVICE));
end;

function TAndroidClipboardWrapper.HasContent(const MimeType: JString): Boolean;
begin
  Result := FClipboardManager.hasPrimaryClip and FClipboardManager.getPrimaryClipDescription.hasMimeType(MimeType);
end;

function TAndroidClipboardWrapper.HasText: Boolean;
begin
  Result := HasContent(TJClipDescription.JavaClass.MIMETYPE_TEXT_PLAIN);
end;

function TAndroidClipboardWrapper.GetText: string;
begin
  if HasContent(TJClipDescription.JavaClass.MIMETYPE_TEXT_PLAIN) then
    Result := JCharSequenceToStr(FClipboardManager.getPrimaryClip.getItemAt(0).getText)
  else
    Result := string.Empty;
end;

procedure TAndroidClipboardWrapper.SetText(Value: string; IsSensitive: Boolean);
var
  ClipData: JClipData;
  Extras: JPersistableBundle;
begin
  ClipData := TJClipData.JavaClass.newPlainText(nil, StrToJCharSequence(Value));

  if TOSVersion.Check(13, 0) and IsSensitive then
  begin
    Extras := TJPersistableBundle.JavaClass.init;
    Extras.putBoolean(TJClipDescription.JavaClass.EXTRA_IS_SENSITIVE, True);

    ClipData.getDescription.setExtras(Extras);
  end;

  FClipboardManager.setPrimaryClip(ClipData);
end;

function TAndroidClipboardWrapper.HasData(Name: string): Boolean;
var
  Intent: JIntent;
begin
  if HasContent(TJClipDescription.JavaClass.MIMETYPE_TEXT_INTENT) then
    Intent := FClipboardManager.getPrimaryClip.getItemAt(0).getIntent
  else
    Intent := nil;

  Result := (Intent <> nil) and Intent.hasExtra(StringToJString(Name));
end;

destructor TAndroidClipboardWrapper.Destroy;
begin
  FClipboardManager := nil;
  inherited;
end;

function TAndroidClipboardWrapper.GetData(Name: string; Stream: TStream): Boolean;
var
  Intent: JIntent;
  ByteArray: TJavaArray<Byte>;
begin
  Result := False;
  if HasContent(TJClipDescription.JavaClass.MIMETYPE_TEXT_INTENT) then
  begin
    Intent := FClipboardManager.getPrimaryClip.getItemAt(0).getIntent;
    if Intent <> nil then
    begin
      ByteArray := Intent.getByteArrayExtra(StringToJString(Name));
      try
        Stream.Write(ByteArray.Data^, ByteArray.Length);
      finally
        FreeAndNil(ByteArray);
      end;
      Result := True;
    end;
  end;
end;

procedure TAndroidClipboardWrapper.SetData(Name: string; Stream: TStream);
var
  Intent: JIntent;
  ByteArray: TJavaArray<Byte>;
  ClipData: JClipData;
begin
  Intent := TJIntent.Create;
  ByteArray := TJavaArray<Byte>.Create(Stream.Size - Stream.Position);
  try
    Stream.Read(ByteArray.Data^, Stream.Size - Stream.Position);
    Intent.putExtra(StringToJString(Name), ByteArray);
  finally
    FreeAndNil(ByteArray);
  end;
  ClipData := TJClipData.JavaClass.newIntent(StrToJCharSequence(Name), Intent);

  FClipboardManager.setPrimaryClip(ClipData);
end;

{ TAndroidClipboardService }

procedure TAndroidClipboardService.CheckWrapper;
begin
  if FClipboardWrapper = nil then
    FClipboardWrapper := TUIThreadCaller.Call<TAndroidClipboardWrapper>(
      function: TAndroidClipboardWrapper
      begin
        Result := TAndroidClipboardWrapper.Create;
      end);
end;

procedure TAndroidClipboardService.CheckDictionary;
begin
  if FClipboardFormats = nil then
    FClipboardFormats := TList<string>.Create;
end;

destructor TAndroidClipboardService.Destroy;
begin
  FreeAndNil(FClipboardFormats);
  FreeAndNil(FClipboardWrapper);
  inherited;
end;

function TAndroidClipboardService.GetClipboard: TValue;
begin
  Result := GetText;
end;

procedure TAndroidClipboardService.SetClipboard(Value: TValue);
begin
  SetText(Value.ToString);
end;

function TAndroidClipboardService.HasText: Boolean;
begin
  CheckWrapper;
  Result := TUIThreadCaller.Call<Boolean>(FClipboardWrapper.HasText);
end;

function TAndroidClipboardService.GetText: string;
begin
  CheckWrapper;
  Result := TUIThreadCaller.Call<string>(FClipboardWrapper.GetText);
end;

procedure TAndroidClipboardService.SetText(const Value: string; IsSensitive: Boolean);
begin
  CheckWrapper;
  TUIThreadCaller.Call<string, Boolean>(FClipboardWrapper.SetText, Value, IsSensitive);
end;

function TAndroidClipboardService.HasImage: Boolean;
begin
  Result := False;
end;

function TAndroidClipboardService.GetImage: TBitmapSurface;
begin
  Result := nil;
end;

procedure TAndroidClipboardService.SetImage(const Value: TBitmapSurface);
begin
  raise ENotImplemented.Create('SetImage is not implemented');
end;

procedure TAndroidClipboardService.RegisterCustomFormat(const AFormatName: string);
begin
  if string.IsNullOrEmpty(AFormatName) then
    raise EArgumentException.CreateFmt(SParamIsNil, [cnAFormatNameParameter]);

  CheckDictionary;
  if FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatRegisterError.Create(Format(SFormatAlreadyRegistered, [AFormatName]));

  FClipboardFormats.Add(AFormatName);
end;

function TAndroidClipboardService.IsCustomFormatRegistered(const AFormatName: string): Boolean;
begin
  if string.IsNullOrEmpty(AFormatName) then
    raise EArgumentException.CreateFmt(SParamIsNil, [cnAFormatNameParameter]);

  CheckDictionary;
  Result := FClipboardFormats.Contains(AFormatName);
end;

procedure TAndroidClipboardService.UnregisterCustomFormat(const AFormatName: string);
begin
  if string.IsNullOrEmpty(AFormatName) then
    raise EArgumentException.CreateFmt(SParamIsNil, [cnAFormatNameParameter]);

  CheckDictionary;
  if FClipboardFormats.Contains(AFormatName) then
    FClipboardFormats.Remove(AFormatName)
  else
    raise EClipboardFormatNotRegistered.Create(Format(SFormatWasNotRegistered, [AFormatName]));
end;

function TAndroidClipboardService.HasCustomFormat(const AFormatName: string): Boolean;
begin
  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  Result := TUIThreadCaller.Call<string, Boolean>(FClipboardWrapper.HasData, AFormatName);
end;

function TAndroidClipboardService.GetCustomFormat(const AFormatName: string; const AStream: TStream): Boolean;
begin
  if string.IsNullOrEmpty(AFormatName) then
    raise EArgumentException.CreateFmt(SParamIsNil, [cnAFormatNameParameter]);
  if AStream = nil then
    raise EArgumentNilException.CreateFmt(SParamIsNil, [cnAStreamParameter]);

  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  Result := TUIThreadCaller.Call<string, TStream, Boolean>(FClipboardWrapper.GetData, AFormatName, AStream);
end;

procedure TAndroidClipboardService.SetCustomFormat(const AFormatName: string; const AStream: TStream);
begin
  if string.IsNullOrEmpty(AFormatName) then
    raise EArgumentException.CreateFmt(SParamIsNil, [cnAFormatNameParameter]);
  if AStream = nil then
    raise EArgumentNilException.CreateFmt(SParamIsNil, [cnAStreamParameter]);

  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  CallInUIThreadAndWaitFinishing(
    procedure
    begin
      FClipboardWrapper.SetData(AFormatName, AStream);
    end);
end;


initialization
  RegisterService;
finalization
  UnregisterService;
end.

