{*******************************************************}
{                                                       }
{       Delphi FireMonkey Media Library Service         }
{                                                       }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MediaLibrary.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterMediaLibraryServices;

implementation

uses
  System.Classes, System.Generics.Collections, System.Generics.Defaults, System.IOUtils, System.Math, System.Messaging,
  System.Permissions, System.SysUtils, System.Types, FMX.Consts, FMX.Controls, FMX.Graphics, FMX.MediaLibrary,
  FMX.Platform, FMX.Platform.Android, FMX.Helpers.Android, Androidapi.Helpers, Androidapi.IOUtils, Androidapi.JNI.App,
  Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes, Androidapi.JNI.Net,
  Androidapi.JNI.Os, Androidapi.JNI.Support, Androidapi.JNIBridge, Androidapi.JNI.Util;

type
{ Taking Image from Library and Camera }

  TImageManagerAndroid = class sealed (TInterfacedObject, IFMXCameraService, IFMXTakenImageService, IFMXPhotoLibrary)
  private type
    TPhotoActivityResponseListener = class(TJavaLocal, JPhotoActivityResponseListener)
    private
      FImageManager: TImageManagerAndroid;
    public
      constructor Create(const AImageManager: TImageManagerAndroid);
      procedure onResponse(response: JPhotoActivityResponse); cdecl;
    end;

    TPhotoResponseListener = class(TJavaLocal, JPhotoResponseListener)
    private
      FImageManager: TImageManagerAndroid;
      FWriteImageCompletionEvent: TWriteImageCompletionEvent;
    public
      constructor Create(const AImageManager: TImageManagerAndroid; const AWriteImageCompletionEvent: TWriteImageCompletionEvent);
      procedure onResponse(response: JPhotoResponse); cdecl;
    end;
  private
    FParams: TParamsPhotoQuery;
    FActivityResponseListener: TPhotoActivityResponseListener;
    FActivityClient: JPhotoActivityClient;
    FResponseListeners: TObjectList<TPhotoResponseListener>;
    FClient: JPhotoClient;
    { The returned size is a frame in which the size of the resultant photo will be adjusted }
    function ApproximateAdmissibleImageSize(const ASize: TSize): Jutil_Size;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXCameraService }
    procedure TakePhoto(const AControl: TControl; const ARequiredResolution: TSize; const AEditable: Boolean;
      const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking); overload;
    procedure TakePhoto(const AControl: TControl; const AParams: TParamsPhotoQuery); overload;
    { IFMXPhotoLibrary }
    procedure AddImageToSavedPhotosAlbum(const ABitmap: TBitmap; const AWriteImageCompletionEvent: TWriteImageCompletionEvent = nil);
    { IFMXTakenImageService }
    procedure TakeImageFromLibrary(const AControl: TControl; const ARequiredResolution: TSize; const AEditable: Boolean;
      const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking); overload;
    procedure TakeImageFromLibrary(const AControl: TControl; const AParams: TParamsPhotoQuery); overload;
  end;

{ Sharing Text, Image, File, or any combination of these }

  TSharingManagerAndroid = class (TInterfacedObject, IFMXShareSheetActionsService)
  private type
    TMIMEKind = (Any, Application, Image, Text, Video);

    // These are the most common MIME types utilized in Android.
    TMIMEApplication = (Any, JSON, PDF);
    TMIMEImage = (Any, GIF, JPEG, PNG);
    TMIMEText = (Any, HTML, Plain, RTF);
    TMIMEVideo = (Any, MP4, ThirdGPP);

    TMIMEType = packed record
      constructor Create(const AExtension: string);
      function ToString: string;
      class function CreateApplication(const AApplication: TMIMEApplication): TMIMEType; static; inline;
      class function CreateImage(const AImage: TMIMEImage): TMIMEType; static; inline;
      class function CreateText(const AText: TMIMEText): TMIMEType; static; inline;
      class function CreateVideo(const AVideo: TMIMEVideo): TMIMEType; static; inline;
      case Kind: TMIMEKind  of
        TMIMEKind.Application: (Application: TMIMEApplication);
        TMIMEKind.Image: (Image: TMIMEImage);
        TMIMEKind.Text: (Text: TMIMEText);
        TMIMEKind.Video: (Video: TMIMEVideo);
    end;
  private
    procedure DoShare(const AControl: TControl; const AText: string; const AImages: TArray<TBitmap>; const AFileNames: TArray<string>);
    function GenerateTempFileName(const AExtension: string): string;
    function MIMETypesToStr(const AMIMETypes: TArray<TMIMEType>): string;
  public
    { IFMXShareSheetActionsService }
    procedure Share(const AControl: TControl; const AText: string; const AImage: TBitmap); overload;
    procedure Share(const AControl: TControl; const AText: string; const AFileNames: TArray<string>); overload;
    procedure Share(const AControl: TControl; const AText: string; const AStreams: TArray<TStream>; const AExtensions: TArray<string>); overload;
  end;

var
  ImageManager: TImageManagerAndroid;
  SharingManager: TSharingManagerAndroid;

procedure RegisterMediaLibraryServices;
begin
  ImageManager := TImageManagerAndroid.Create;
  TPlatformServices.Current.AddPlatformService(IFMXPhotoLibrary, ImageManager);
  TPlatformServices.Current.AddPlatformService(IFMXTakenImageService, ImageManager);
  if TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_CAMERA) or
     TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_CAMERA_FRONT) then
    TPlatformServices.Current.AddPlatformService(IFMXCameraService, ImageManager);

  SharingManager := TSharingManagerAndroid.Create;
  TPlatformServices.Current.AddPlatformService(IFMXShareSheetActionsService, SharingManager);
end;

{ TImageManagerAndroid.TPhotoActivityResponseListener }

constructor TImageManagerAndroid.TPhotoActivityResponseListener.Create(const AImageManager: TImageManagerAndroid);
begin
  inherited Create;
  FImageManager := AImageManager;
end;

procedure TImageManagerAndroid.TPhotoActivityResponseListener.onResponse(response: JPhotoActivityResponse);
var
  LParams: TParamsPhotoQuery;
  LNativeBitmap: JBitmap;
  LBitmap: TBitmap;
  LConverted: Boolean;
  LRequestKind: JPhotoActivityRequestKind;
  LException: JException;
  LFailureCause: TTakingFailureCause;

  function GetFailureCauseFromException(const Exception: JException): TTakingFailureCause;
  var
    LName: string;
  begin
    LName := JStringToString(Exception.getClass.getName);

    if LName = 'com.embarcadero.firemonkey.medialibrary.FileNotCreatedException' then
      Result := TTakingFailureCause.FileNotCreated
    else if LName = 'java.io.FileNotFoundException' then
      Result := TTakingFailureCause.FileNotAvailable
    else if LName = 'com.embarcadero.firemonkey.decode.BitmapDecodeException' then
      Result := TTakingFailureCause.DecodeError
    else
      Result := TTakingFailureCause.UnknownError;
  end;

begin
  LParams := FImageManager.FParams;

  if response.isCancelled then
  begin
    if Assigned(LParams.OnDidCancelTaking) then
      LParams.OnDidCancelTaking
    else
      TMessageManager.DefaultManager.SendMessage(FImageManager, TMessageDidCancelTaking.Create);
  end
  else if response.isSuccessful then
  begin
    LNativeBitmap := TJBitmap.Wrap(response.getResult);
    LBitmap := TBitmap.Create;

    try
      LConverted := JBitmapToBitmap(LNativeBitmap, LBitmap);
      LNativeBitmap.recycle;

      if LConverted then
      begin
        if Assigned(LParams.OnDidFinishTaking) then
          LParams.OnDidFinishTaking(LBitmap)
        else
        begin
          LRequestKind := response.getRequestKind;

          if LRequestKind.equals(TJPhotoActivityRequestKind.JavaClass.PICK) then
            TMessageManager.DefaultManager.SendMessage(Self, TMessageDidFinishTakingImageFromLibrary.Create(LBitmap))
          else if LRequestKind.equals(TJPhotoActivityRequestKind.JavaClass.TAKE) then
            TMessageManager.DefaultManager.SendMessage(Self, TMessageDidFinishTakingImageFromCamera.Create(LBitmap));
        end;
      end;
    finally
      LBitmap.Free;
    end;
  end
  else
  begin
    LException := response.getException;
    LFailureCause := GetFailureCauseFromException(LException);

    TJutil_Log.JavaClass.w(StringToJString('PhotoLibrary'), LException);

    if Assigned(LParams.OnDidFailTaking) then
      LParams.OnDidFailTaking(LFailureCause)
    else
      TMessageManager.DefaultManager.SendMessage(FImageManager, TMessageDidFailTaking.Create(LFailureCause));
  end;
end;

{ TImageManagerAndroid.TPhotoResponseListener }

constructor TImageManagerAndroid.TPhotoResponseListener.Create(const AImageManager: TImageManagerAndroid;
  const AWriteImageCompletionEvent: TWriteImageCompletionEvent);
begin
  inherited Create;
  FImageManager := AImageManager;
  FWriteImageCompletionEvent := AWriteImageCompletionEvent;
end;

procedure TImageManagerAndroid.TPhotoResponseListener.onResponse(response: JPhotoResponse);
begin
  try
    if response.isSuccessful then
      FWriteImageCompletionEvent(True, SImageSaved)
    else
      FWriteImageCompletionEvent(False, JStringToString(response.getException.getMessage));
  finally
    FImageManager.FResponseListeners.Remove(Self);
  end;
end;

{ TImageManagerAndroid }

constructor TImageManagerAndroid.Create;
begin
  FActivityResponseListener := TPhotoActivityResponseListener.Create(Self);
  FActivityClient := MainActivity.getPhotoActivityClient;
  FActivityClient.setResponseListener(FActivityResponseListener);
  FResponseListeners := TObjectList<TPhotoResponseListener>.Create(True);
  FClient := MainActivity.getPhotoClient;
end;

destructor TImageManagerAndroid.Destroy;
begin
  FActivityClient.setResponseListener(nil);
  FreeAndNil(FActivityResponseListener);
  FreeAndNil(FResponseListeners);
  inherited;
end;

procedure TImageManagerAndroid.AddImageToSavedPhotosAlbum(const ABitmap: TBitmap;
  const AWriteImageCompletionEvent: TWriteImageCompletionEvent = nil);
var
  LNativeBitmap: JBitmap;
  LResponseListener: TPhotoResponseListener;
  LRequestParams: JSavePhotoRequestParams;
begin
  LNativeBitmap := TJBitmap.JavaClass.createBitmap(ABitmap.Width, ABitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);

  if BitmapToJBitmap(ABitmap, LNativeBitmap) then
  begin
    if Assigned(AWriteImageCompletionEvent) then
    begin
      LResponseListener := TPhotoResponseListener.Create(Self, AWriteImageCompletionEvent);

      FResponseListeners.Add(LResponseListener);
    end
    else
      LResponseListener := nil;

    LRequestParams := TJSavePhotoRequestParams.JavaClass.newBuilder
      .setBitmap(LNativeBitmap)
      .setRecycle(True)
      .build;

    FClient.savePhoto(LRequestParams, LResponseListener);
  end
  else if Assigned(AWriteImageCompletionEvent) then
    AWriteImageCompletionEvent(False, SCannotConvertBitmapToNative);
end;

function TImageManagerAndroid.ApproximateAdmissibleImageSize(const ASize: TSize): Jutil_Size;
var
  LWidth: Integer;
  LHeight: Integer;
begin
  LWidth := Min(TCanvasManager.DefaultCanvas.GetAttribute(TCanvasAttribute.MaxBitmapSize), ASize.Width);
  LHeight := Min(TCanvasManager.DefaultCanvas.GetAttribute(TCanvasAttribute.MaxBitmapSize), ASize.Height);
  Result := TJutil_Size.JavaClass.init(LWidth, LHeight);
end;

procedure TImageManagerAndroid.TakeImageFromLibrary(const AControl: TControl; const ARequiredResolution: TSize;
  const AEditable: Boolean; const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking);
var
  LParams: TParamsPhotoQuery;
begin
  LParams.RequiredResolution := ARequiredResolution;
  LParams.Editable := AEditable;
  LParams.NeedSaveToAlbum := False;
  LParams.OnDidFinishTaking := AOnDidFinishTaking;
  LParams.OnDidCancelTaking := AOnDidCancelTaking;

  TakeImageFromLibrary(AControl, LParams);
end;

procedure TImageManagerAndroid.TakeImageFromLibrary(const AControl: TControl; const AParams: TParamsPhotoQuery);
var
  LMaximumSize: Jutil_Size;
  LPickerPresentation: JPickerPresentation;
  LRequestParams: JPickPhotoActivityRequestParams;
begin
  FParams := AParams;
  LMaximumSize := ApproximateAdmissibleImageSize(FParams.RequiredResolution);

  if FParams.PickerPresentation in [Low(TPickerPresentation)..High(TPickerPresentation)] then
    LPickerPresentation := TJPickerPresentation.JavaClass.values[Integer(FParams.PickerPresentation)]
  else
    LPickerPresentation := TJPickerPresentation.JavaClass.LATEST;

  LRequestParams := TJPickPhotoActivityRequestParams.JavaClass.newBuilder
    .setMaximumSize(LMaximumSize)
    .setPickerPresentation(LPickerPresentation)
    .build;

  FActivityClient.pickPhoto(LRequestParams);
end;

procedure TImageManagerAndroid.TakePhoto(const AControl: TControl; const AParams: TParamsPhotoQuery);
var
  LMaximumSize: Jutil_Size;
  LRequestParams: JTakePhotoActivityRequestParams;
begin
  FParams := AParams;
  LMaximumSize := ApproximateAdmissibleImageSize(FParams.RequiredResolution);
  LRequestParams := TJTakePhotoActivityRequestParams.JavaClass.newBuilder
    .setMaximumSize(LMaximumSize)
    .setPersistent(FParams.NeedSaveToAlbum)
    .build;

  FActivityClient.takePhoto(LRequestParams);
end;

procedure TImageManagerAndroid.TakePhoto(const AControl: TControl; const ARequiredResolution: TSize;
  const AEditable: Boolean; const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking);
var
  LParams: TParamsPhotoQuery;
begin
  LParams.RequiredResolution := ARequiredResolution;
  LParams.Editable := AEditable;
  LParams.NeedSaveToAlbum := False;
  LParams.OnDidFinishTaking := AOnDidFinishTaking;
  LParams.OnDidCancelTaking := AOnDidCancelTaking;

  TakePhoto(AControl, LParams);
end;

{ TSharingAndroid }

procedure TSharingManagerAndroid.DoShare(const AControl: TControl; const AText: string; const AImages: TArray<TBitmap>;
  const AFileNames: TArray<string>);

  function GetImageCount: Integer;
  begin
    Result := 0;
    for var I := Low(AImages) to High(AImages) do
      if (AImages[I] <> nil) and not AImages[I].IsEmpty then
        Inc(Result);
  end;

  function GetFileCount: Integer;
  begin
    Result := 0;
    for var I := Low(AFileNames) to High(AFileNames) do
      if TFile.Exists(AFileNames[I]) then
        Inc(Result);
  end;

  function GetFileUri(const AFileName: string): Jnet_Uri;
  var
    LFile: JFile;
  begin
    LFile := TJFile.JavaClass.init(StringToJString(AFileName));
    Result := TAndroidHelper.JFileToJURI(LFile);
  end;

  function GetImageUri(const AImage: TBitmap): Jnet_Uri;
  var
    LFileName: string;
  begin
    LFileName := GenerateTempFileName('.png');
    AImage.SaveToFile(LFileName);
    Result := GetFileUri(LFileName);
  end;

  procedure AddData(const AIntent: JIntent; const ASendMultiple: Boolean);
  begin
    if ASendMultiple then
    begin
      if not AText.IsEmpty then
        AIntent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(AText));
      var LArrayList: JArrayList := TJArrayList.Create;
      for var I := Low(AImages) to High(AImages) do
        if not AImages[I].IsEmpty then
          LArrayList.add(GetImageUri(AImages[I]));
      for var I := Low(AFileNames) to High(AFileNames) do
        if TFile.Exists(AFileNames[I]) then
          LArrayList.add(GetFileUri(AFileNames[I]));
      AIntent.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM, LArrayList);
    end
    else
    begin
      if not AText.IsEmpty then
      begin
        AIntent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(AText));
        Exit;
      end;
      for var I := Low(AImages) to High(AImages) do
        if not AImages[I].IsEmpty then
        begin
          AIntent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap(GetImageUri(AImages[I])));
          Exit;
        end;
      for var I := Low(AFileNames) to High(AFileNames) do
        if TFile.Exists(AFileNames[I]) then
        begin
          AIntent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap(GetFileUri(AFileNames[I])));
          Exit;
        end;
    end;
  end;

var
  LChooserCaption: string;
  LFileCount: Integer;
  LImageCount: Integer;
  LIntent: JIntent;
  LMIMETypes: TArray<TMIMEType>;
  LSendMultiple: Boolean;
begin
  LImageCount := GetImageCount;
  LFileCount := GetFileCount;
  if AText.IsEmpty and (LImageCount = 0) and (LFileCount = 0) then
    Exit;

  LMIMETypes := nil;
  if not AText.IsEmpty then
    LMIMETypes := LMIMETypes + [TMIMEType.CreateText(TMIMEText.Plain)];
  if LImageCount > 0 then
    LMIMETypes := LMIMETypes + [TMIMEType.CreateImage(TMIMEImage.PNG)];
  for var I := Low(AFileNames) to High(AFileNames) do
    if TFile.Exists(AFileNames[I]) then
      LMIMETypes := LMIMETypes + [TMIMEType.Create(TPath.GetExtension(AFileNames[I]))];
  LSendMultiple :=  (AText.IsEmpty and ((LImageCount + LFileCount) > 1)) or (not AText.IsEmpty and ((LImageCount + LFileCount) > 0));

  LIntent := TJIntent.Create;
  if not LSendMultiple then
    LIntent.setAction(TJIntent.JavaClass.ACTION_SEND)
  else
    LIntent.setAction(TJIntent.JavaClass.ACTION_SEND_MULTIPLE);
  LIntent.setType(StringToJString(MIMETypesToStr(LMIMETypes)));
  LIntent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
  LIntent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  AddData(LIntent, LSendMultiple);

  if (LFileCount > 0) or (LImageCount > 1) then
  begin
    if AText.IsEmpty then
      LChooserCaption := SMediaLibraryOpenFilesWith
    else
      LChooserCaption := SMediaLibraryOpenTextAndFilesWith;
  end
  else
  begin
    if LImageCount = 0 then
      LChooserCaption := SMediaLibraryOpenTextWith
    else
      if AText.IsEmpty then
        LChooserCaption := SMediaLibraryOpenImageWith
      else
        LChooserCaption := SMediaLibraryOpenTextAndImageWith;
  end;
  TAndroidHelper.Context.startActivity(TJIntent.JavaClass.createChooser(LIntent, StrToJCharSequence(LChooserCaption)));
end;

function TSharingManagerAndroid.GenerateTempFileName(const AExtension: string): string;
var
  LGUID: TGUID;
begin
  LGUID := TGUID.NewGuid;
  Result := TPath.Combine(GetExternalCacheDir, Format('attachment_%8x%4x%4x%16x%s', [LGUID.D1, LGUID.D2, LGUID.D3, PInt64(@LGUID.D4[0])^, AExtension]));
end;

function TSharingManagerAndroid.MIMETypesToStr(const AMIMETypes: TArray<TMIMEType>): string;

  procedure Append(const AMIMEType: TMIMEType);
  begin
    if not Result.IsEmpty then
      Result := Result + ';';
    Result := Result + AMIMEType.ToString;
  end;

  function IsAny(AMIMETypes: TList<TMIMEType>): Boolean;
  begin
    for var I := 0 to AMIMETypes.Count - 1 do
      if AMIMETypes[I].Kind = TMIMEKind.Any then
      begin
        Append(AMIMETypes[I]);
        Exit(True);
      end;
    Result := False;
  end;

  procedure ParseText(AMIMETypes: TList<TMIMEType>);
  begin
    for var I := 0 to AMIMETypes.Count - 1 do
      if (AMIMETypes[I].Kind = TMIMEKind.Text) and (AMIMETypes[I].Text = TMIMEText.Any) then
      begin
        Append(AMIMETypes[I]);
        Exit;
      end;
    for var I := 0 to AMIMETypes.Count - 1 do
      if AMIMETypes[I].Kind = TMIMEKind.Text then
        Append(AMIMETypes[I]);
  end;

  procedure ParseImage(AMIMETypes: TList<TMIMEType>);
  begin
    for var I := 0 to AMIMETypes.Count - 1 do
      if (AMIMETypes[I].Kind = TMIMEKind.Image) and (AMIMETypes[I].Image = TMIMEImage.Any) then
      begin
        Append(AMIMETypes[I]);
        Exit;
      end;
    for var I := 0 to AMIMETypes.Count - 1 do
      if AMIMETypes[I].Kind = TMIMEKind.Image then
        Append(AMIMETypes[I]);
  end;

  procedure ParseVideo(AMIMETypes: TList<TMIMEType>);
  begin
    for var I := 0 to AMIMETypes.Count - 1 do
      if (AMIMETypes[I].Kind = TMIMEKind.Video) and (AMIMETypes[I].Video = TMIMEVideo.Any) then
      begin
        Append(AMIMETypes[I]);
        Exit;
      end;
    for var I := 0 to AMIMETypes.Count - 1 do
      if AMIMETypes[I].Kind = TMIMEKind.Video then
        Append(AMIMETypes[I]);
  end;

  procedure ParseApplication(AMIMETypes: TList<TMIMEType>);
  begin
    for var I := 0 to AMIMETypes.Count - 1 do
      if (AMIMETypes[I].Kind = TMIMEKind.Application) and (AMIMETypes[I].Application = TMIMEApplication.Any) then
      begin
        Append(AMIMETypes[I]);
        Exit;
      end;
    for var I := 0 to AMIMETypes.Count - 1 do
      if AMIMETypes[I].Kind = TMIMEKind.Application then
        Append(AMIMETypes[I]);
  end;

var
  LMIMETypes: TList<TMIMEType>;
begin
  Result := '';

  LMIMETypes := TList<TMIMEType>.Create;
  try
    for var I := Low(AMIMETypes) to High(AMIMETypes) do
      if LMIMETypes.IndexOf(AMIMETypes[I]) < 0 then
        LMIMETypes.Add(AMIMETypes[I]);

    if IsAny(LMIMETypes) then
      Exit;
    ParseText(LMIMETypes);
    ParseImage(LMIMETypes);
    ParseVideo(LMIMETypes);
    ParseApplication(LMIMETypes);
  finally
   LMIMETypes.Free;
  end;
end;

procedure TSharingManagerAndroid.Share(const AControl: TControl; const AText: string; const AImage: TBitmap);
begin
  DoShare(AControl, AText, [AImage], []);
end;

procedure TSharingManagerAndroid.Share(const AControl: TControl; const AText: string; const AFileNames: TArray<string>);
begin
  DoShare(AControl, AText, [], AFileNames);
end;

procedure TSharingManagerAndroid.Share(const AControl: TControl; const AText: string; const AStreams: TArray<TStream>;
  const AExtensions: TArray<string>);
var
  LCount: Integer;
  LFileNames: TArray<string>;
begin
  SetLength(LFileNames, Min(Length(AStreams), Length(AExtensions)));
  LCount := 0;
  for var I := Low(LFileNames) to High(LFileNames) do
  begin
    if AStreams[I] <> nil then
    begin
      LFileNames[I] := GenerateTempFileName(TPath.GetExtension(AExtensions[I]));
      var LStream := TFileStream.Create(LFileNames[I], fmCreate);
      try
        LStream.CopyFrom(AStreams[I]);
      finally
        LStream.Free;
      end;
      Inc(LCount);
    end;
  end;
  SetLength(LFileNames, LCount);
  DoShare(AControl, AText, [], LFileNames);
end;

{ TSharingManagerAndroid.TMIMEType }

constructor TSharingManagerAndroid.TMIMEType.Create(const AExtension: string);

  function IsExtensionEqual(const AValue: string): Boolean;
  begin
    Result := SameText(AExtension, AValue, loUserLocale) or SameText('.' + AExtension, AValue, loUserLocale);
  end;

begin
  { MIME Type: application }
  if IsExtensionEqual('.json') then
  begin
    Kind := TMIMEKind.Application;
    Application := TMIMEApplication.JSON;
  end
  else if IsExtensionEqual('.pdf') then
  begin
    Kind := TMIMEKind.Application;
    Application := TMIMEApplication.PDF;
  end
  { MIME Type: image }
  else if IsExtensionEqual('.gif') then
  begin
    Kind := TMIMEKind.Image;
    Image := TMIMEImage.GIF;
  end
  else if (IsExtensionEqual('.jpg')) or (IsExtensionEqual('.jpeg')) then
  begin
    Kind := TMIMEKind.Image;
    Image := TMIMEImage.JPEG;
  end
  else if IsExtensionEqual('.png') then
  begin
    Kind := TMIMEKind.Image;
    Image := TMIMEImage.PNG;
  end
  { MIME Type: text }
  else if (IsExtensionEqual('.htm')) or (IsExtensionEqual('.html')) then
  begin
    Kind := TMIMEKind.Text;
    Text := TMIMEText.HTML;
  end
  else if IsExtensionEqual('.txt') then
  begin
    Kind := TMIMEKind.Text;
    Text := TMIMEText.Plain;
  end
  else if IsExtensionEqual('.rtf') then
  begin
    Kind := TMIMEKind.Text;
    Text := TMIMEText.RTF;
  end
  { MIME Type: video }
  else if IsExtensionEqual('.mp4') then
  begin
    Kind := TMIMEKind.Video;
    Video := TMIMEVideo.MP4;
  end
  else if IsExtensionEqual('.3gp') then
  begin
    Kind := TMIMEKind.Video;
    Video := TMIMEVideo.ThirdGPP;
  end
  { MYME Type: any }
  else
    Kind := TMIMEKind.Any;
end;

class function TSharingManagerAndroid.TMIMEType.CreateApplication(const AApplication: TMIMEApplication): TMIMEType;
begin
  Result.Kind := TMIMEKind.Application;
  Result.Application := AApplication;
end;

class function TSharingManagerAndroid.TMIMEType.CreateImage(const AImage: TMIMEImage): TMIMEType;
begin
  Result.Kind := TMIMEKind.Image;
  Result.Image := AImage;
end;

class function TSharingManagerAndroid.TMIMEType.CreateText(const AText: TMIMEText): TMIMEType;
begin
  Result.Kind := TMIMEKind.Text;
  Result.Text := AText;
end;

class function TSharingManagerAndroid.TMIMEType.CreateVideo(const AVideo: TMIMEVideo): TMIMEType;
begin
  Result.Kind := TMIMEKind.Video;
  Result.Video := AVideo;
end;

function TSharingManagerAndroid.TMIMEType.ToString: string;
const
  MIMEApplicationStr: array[TMIMEApplication] of string = ('*', 'pdf', 'json');
  MIMEImageStr: array[TMIMEImage] of string = ('*', 'gif', 'jpeg', 'png');
  MIMETextStr: array[TMIMEText] of string = ('*', 'html', 'plain', 'rtf');
  MIMEVideoStr: array[TMIMEVideo] of string = ('*', 'mp4', '3gpp');
begin
  case Kind of
    TMIMEKind.Application:
      Result := 'application/' + MIMEApplicationStr[Application];
    TMIMEKind.Image:
      Result := 'image/' + MIMEImageStr[Image];
    TMIMEKind.Text:
      Result := 'text/' + MIMETextStr[Text];
    TMIMEKind.Video:
      Result := 'video/' + MIMEVideoStr[Video];
  else
    Result := '*/*';
  end;
end;

end.
