{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2012-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Media.AVFoundation;

interface

{$SCOPEDENUMS ON}

uses
  Macapi.ObjectiveC, FMX.Media;

type

{ TAVCaptureDeviceManager }

  /// <summary>Factory for AVFoundation.</summary>
  TAVCaptureDeviceManager = class(TCaptureDeviceManager)
  public
    /// <summary>Default constructor.</summary>
    constructor Create; override;
  end;

  /// <summary>Specialization class for AVFoundation device.</summary>
  /// <remarks>This exists outside the implementation section because an acces to a Device is nedded for iOS and OSX
  /// delegates.</remarks>
  TAVVideoCaptureDeviceBase = class(TVideoCaptureDevice)
    /// <summary>Constructor.</summary>
    /// <remarks>See TVideoCaptureDevice to get more information about the parameters.</remarks>
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean); override;
    destructor Destroy; override;

    /// <summary>Method to be called by the delegate when a frame is incomming.</summary>
    procedure SampleDelegate(ASampleBuffer: Pointer); virtual; abstract;
  end;

  /// <summary>AVFoundation delegate class to manage the incomming buffer.</summary>
  /// <remarks>This is a Base class which is going to be used as base for iOS and OSX implementations.</remarks>
  TVideoSampleDelegateBase = class(TOCLocal)
  protected
    /// <summary>Field to flag the processing state.</summary>
    FIsProcessingCapture: Boolean;
    /// <summary>Camera device for which this(self) is a delegate.</summary>
    FCaptureDevice: TAVVideoCaptureDeviceBase;
  public
    /// <summary>Constructor with a AV Device.</summary>
    constructor Create(const ACaptureDevice: TAVVideoCaptureDeviceBase);
    /// <summary>Property to access the field variable.</summary>
    property IsProcessingCapture: Boolean read FIsProcessingCapture;
  end;


implementation

uses
  {$IF DEFINED(IOS)}
    iOSapi.Foundation, iOSapi.CocoaTypes, iOSapi.AVFoundation, iOSapi.CoreMedia, iOSapi.CoreAudio, iOSapi.CoreVideo,
    FMX.Helpers.iOS, FMX.Platform.iOS, iOSapi.MediaPlayer, iOSapi.UIKit, iOSapi.CoreGraphics, FMX.Media.iOS,
  {$ELSE}
    Macapi.Foundation, Macapi.CocoaTypes, Macapi.AVFoundation, Macapi.CoreVideo, Macapi.CoreMedia,
    FMX.Helpers.Mac, FMX.Media.Mac,
  {$ENDIF}
  Macapi.CoreFoundation, Macapi.Dispatch, Macapi.ObjCRuntime,
  System.SysUtils, System.Messaging, System.Types, System.UITypes, System.Classes, System.RTLConsts, Macapi.Helpers,
  System.Generics.Collections, FMX.Consts, FMX.Forms, FMX.Types, FMX.Graphics;

const
  UNKNOWN_VIDEO_ORIENTATION = 0;

type

{ TAVAudioCaptureDevice }

  TAVAudioCaptureDevice = class(TAudioCaptureDevice)
  private
    FDevice: AVCaptureDevice;
    FAudioRecorder: AVAudioRecorder;
    procedure RecordingRequestAccessForMediaTypeCompletionHandler(granted: Boolean);
  protected
    procedure DoRequestPermission; override;
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    function GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string; override;
    function GetDeviceState: TCaptureDeviceState; override;
  public
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: AVCaptureDevice); reintroduce;
  end;

{ TAVVideoCaptureDevice }

  TAVVideoCaptureDevice = class(TAVVideoCaptureDeviceBase)
  private const
    FrameRateEpsilon = 0.0000001;
  private
    FDevice: AVCaptureDevice;
    FSession: AVCaptureSession;
    FInput: AVCaptureDeviceInput;
    FOutput: AVCaptureVideoDataOutput;
    FSampleDelegate: TVideoSampleDelegateBase;
    FSampleBuffer: CMSampleBufferRef;
    FImageBuffer: CVImageBufferRef;
    FLastTime: TMediaTime;
    procedure RecordingRequestAccessForMediaTypeCompletionHandler(granted: Boolean);
    procedure SampleDelegate(ASampleBuffer: CMSampleBufferRef); override;
    procedure SyncCall;
    class procedure CopyPixels(ASrcData, ADstData: PAlphaColor; APixelCount: NativeUInt); static;
  protected
    procedure DoRequestPermission; override;
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    procedure DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean); override;
    function GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string; override;
    function GetDeviceState: TCaptureDeviceState; override;
    function GetPosition: TDevicePosition; override;
    procedure DoSetQuality(const Value: TVideoCaptureQuality); override;
    function GetHasFlash: Boolean; override;
    function GetFlashMode: TFlashMode; override;
    procedure SetFlashMode(const Value: TFlashMode); override;
    function GetHasTorch: Boolean; override;
    function GetTorchMode: TTorchMode; override;
    procedure SetTorchMode(const Value: TTorchMode); override;
    function GetFocusMode: TFocusMode; override;
    procedure SetFocusMode(const Value: TFocusMode); override;
    function GetCaptureSetting: TVideoCaptureSetting; override;
    function DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean; override;
    function DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>; override;
  public
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: AVCaptureDevice); reintroduce;
  end;

{ TAVCaptureDeviceManager }

constructor TAVCaptureDeviceManager.Create;
var
  I: Integer;
  DS: NSArray;
  DP: Pointer;
  D: AVCaptureDevice;
begin
  inherited;
  
  DS := TAVCaptureDevice.OCClass.devicesWithMediaType(AVMediaTypeAudio);
  for I := 0 to DS.count - 1 do
  begin
    DP := DS.objectAtIndex(I);
    D := TAVCaptureDevice.Wrap(DP);
    TAVAudioCaptureDevice.Create(Self, TAVCaptureDevice.OCClass.defaultDeviceWithMediaType(AVMediaTypeAudio) = DP, D);
  end;
  DS := TAVCaptureDevice.OCClass.devicesWithMediaType(AVMediaTypeVideo);
  for I := 0 to DS.count - 1 do
  begin
    DP := DS.objectAtIndex(I);
    D := TAVCaptureDevice.Wrap(DP);
    TAVVideoCaptureDevice.Create(Self, TAVCaptureDevice.OCClass.defaultDeviceWithMediaType(AVMediaTypeVideo) = DP, D);
  end;
end;

{ TAVAudioCaptureDevice }

constructor TAVAudioCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: AVCaptureDevice);
begin
  inherited Create(AManager, ADefault);
  FDevice := ADevice;
end;

procedure TAVAudioCaptureDevice.DoRequestPermission;
begin
{$IF DEFINED(IOS)}
  TAVCaptureDevice.OCClass.requestAccessForMediaType(AVMediaTypeAudio, RecordingRequestAccessForMediaTypeCompletionHandler);
{$ELSEIF DEFINED(MACOS)}
  if TOSVersion.Check(10, 14) then
    TAVCaptureDevice.OCClass.requestAccessForMediaType(AVMediaTypeAudio, RecordingRequestAccessForMediaTypeCompletionHandler)
  else
    RecordingRequestAccessForMediaTypeCompletionHandler(True);
{$ENDIF}
end;

procedure TAVAudioCaptureDevice.RecordingRequestAccessForMediaTypeCompletionHandler(granted: Boolean);
var
  LMessage: string;
begin
  if granted then
    LMessage := string.Empty
  else
    LMessage := SUserRejectedCaptureDevicePermission;

  TThread.Synchronize(nil,
    procedure
    begin
      DoPermissionRequest(LMessage, granted);
    end);
end;

procedure TAVAudioCaptureDevice.DoStartCapture;

  function GetRecordSettings: NSMutableDictionary;
  begin
    Result := TNSMutableDictionary.Create;
    Result.setObject(TNSNumber.OCClass.numberWithFloat(44100.0), NSObjectToID(AVSampleRateKey));
    Result.setObject(TNSNumber.OCClass.numberWithInt(2), NSObjectToID(AVNumberOfChannelsKey));
{$IF DEFINED(IOS)}
    Result.setObject(TNSNumber.OCClass.numberWithFloat(12800.0), NSObjectToID(AVEncoderBitRateKey));
    Result.setObject(TNSNumber.OCClass.numberWithInt(16), NSObjectToID(AVLinearPCMBitDepthKey));
{$ENDIF}
  end;

var
  Error: Pointer;
  URL: NSUrl;
{$IF DEFINED(IOS)}
  AudioSession: AVAudioSession;
{$ENDIF}
begin
  if (FAudioRecorder <> nil) and FAudioRecorder.isRecording then
    FAudioRecorder.stop;
  if FAudioRecorder <> nil then
  begin
    FAudioRecorder.release;
    FAudioRecorder := nil;
  end;

{$IF DEFINED(IOS)}
  if TAVCaptureDevice.OCClass.authorizationStatusForMediaType(AVMediaTypeAudio) <> AVAuthorizationStatusAuthorized then
    raise ECaptureDeviceException.Create(SAudioCaptureUnauthorized);
{$ELSEIF DEFINED(MACOS)}
  if TOSVersion.Check(10, 14) and (TAVCaptureDevice.OCClass.authorizationStatusForMediaType(AVMediaTypeAudio) <> AVAuthorizationStatusAuthorized) then
    raise ECaptureDeviceException.Create(SAudioCaptureUnauthorized);
{$ENDIF}

  URL := TNSUrl.Wrap(TNSUrl.OCClass.fileURLWithPath(StrToNSStr(FileName)));

{$IF DEFINED(IOS)}
  AudioSession := TAVAudioSession.Wrap(TAVAudioSession.OCClass.sharedInstance);
  AudioSession.setCategory(AVAudioSessionCategoryRecord);
  AudioSession.setActive(True);
{$ENDIF}

  // Initialization of Audio Recorder
  FAudioRecorder := TAVAudioRecorder.Alloc;
  FAudioRecorder.initWithURL(URL, GetRecordSettings, @Error);
  FAudioRecorder.retain;
  if Error = nil then
    FAudioRecorder.&record;
end;

procedure TAVAudioCaptureDevice.DoStopCapture;
begin
  if FAudioRecorder <> nil then
  begin
    FAudioRecorder.stop;
    FAudioRecorder.release;
    FAudioRecorder := nil;
  end;
end;

function TAVAudioCaptureDevice.GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string;
begin
  if FDevice <> nil then
  begin
    case Prop of
      TProperty.Description: Result := '';
      TProperty.Name: Result := UTF8ToString(FDevice.localizedName.UTF8String);
      TProperty.UniqueID: Result := UTF8ToString(FDevice.uniqueID.UTF8String);
    else
      Result := '';
    end;
  end
  else
    Result := '';
end;

function TAVAudioCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if (FAudioRecorder <> nil) and FAudioRecorder.isRecording then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

{ TAVVideoCaptureDevice }

constructor TAVVideoCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: AVCaptureDevice);
begin
  inherited Create(AManager, ADefault);
  FDevice := ADevice;
  FSession := TAVCaptureSession.Create;
end;

procedure TAVVideoCaptureDevice.SampleDelegate(ASampleBuffer: CMSampleBufferRef);
var
  T: CMTime;
begin
  FSampleBuffer := ASampleBuffer;
  try
    FImageBuffer := CMSampleBufferGetImageBuffer(ASampleBuffer);
    CVBufferRetain(FImageBuffer);
    try
      T := CMSampleBufferGetPresentationTimeStamp(FSampleBuffer);
      FLastTime := T.value div T.timescale;
      TThread.Synchronize(TThread.CurrentThread, SyncCall);
    finally
      CVBufferRelease(FImageBuffer);
      FImageBuffer := 0;
    end;
  finally
    FSampleBuffer := nil;
  end;
end;

procedure TAVVideoCaptureDevice.SetFlashMode(const Value: TFlashMode);
begin
  if FDevice <> nil then
  begin
    FDevice.lockForConfiguration(nil);
    try
      case Value of
        TFlashMode.AutoFlash:
          begin
            FDevice.setFlashMode(AVCaptureFlashModeAuto);
            FDevice.setTorchMode(AVCaptureTorchModeAuto);
          end;
        TFlashMode.FlashOff:
          begin
            FDevice.setFlashMode(AVCaptureFlashModeOff);
            FDevice.setTorchMode(AVCaptureTorchModeOff);
          end;
        TFlashMode.FlashOn:
          begin
            FDevice.setFlashMode(AVCaptureFlashModeOn);
            FDevice.setTorchMode(AVCaptureTorchModeOn);
          end;
      end;
    finally
      FDevice.unlockForConfiguration;
    end;
  end;
end;

procedure TAVVideoCaptureDevice.SetFocusMode(const Value: TFocusMode);
begin
  if FDevice <> nil then
  begin
    FDevice.lockForConfiguration(nil);
    try
      case Value of
        TFocusMode.AutoFocus: FDevice.setFocusMode(AVCaptureFocusModeAutoFocus);
        TFocusMode.ContinuousAutoFocus: FDevice.setFocusMode(AVCaptureFocusModeContinuousAutoFocus);
        TFocusMode.Locked: FDevice.setFocusMode(AVCaptureFocusModeLocked);
      end;
    finally
      FDevice.unlockForConfiguration;
    end;
  end;
end;

procedure TAVVideoCaptureDevice.DoSetQuality(const Value: TVideoCaptureQuality);
var
  Preset: NSString;
begin
  if Value <> TVideoCaptureQuality.CaptureSettings then
  begin
    case Value of
      TVideoCaptureQuality.PhotoQuality: Preset := AVCaptureSessionPresetPhoto;
      TVideoCaptureQuality.HighQuality: Preset := AVCaptureSessionPresetHigh;
      TVideoCaptureQuality.MediumQuality: Preset := AVCaptureSessionPresetMedium;
      TVideoCaptureQuality.LowQuality: Preset := AVCaptureSessionPresetLow;
    end;
    if FSession.canSetSessionPreset(Preset) then
    begin
      FSession.setSessionPreset(Preset);
      inherited;
    end;
  end
  else
    inherited;
end;

procedure TAVVideoCaptureDevice.SetTorchMode(const Value: TTorchMode);
begin
  if FDevice <> nil then
  begin
    FDevice.lockForConfiguration(nil);
    try
      case Value of
        TTorchMode.ModeOff: FDevice.setTorchMode(AVCaptureTorchModeOff);
        TTorchMode.ModeOn: FDevice.setTorchMode(AVCaptureTorchModeOn);
        TTorchMode.ModeAuto: FDevice.setTorchMode(AVCaptureTorchModeAuto);
      end;
    finally
      FDevice.unlockForConfiguration;
    end;
  end;
end;

procedure TAVVideoCaptureDevice.SyncCall;
begin
  SampleBufferReady(FLastTime);
end;

class procedure TAVVideoCaptureDevice.CopyPixels(ASrcData, ADstData: PAlphaColor; APixelCount: NativeUInt);
var
  Pixel: TAlphaColor;
begin
  if GlobalUseMetal then
    Move(ASrcData^, ADstData^, APixelCount * SizeOf(TAlphaColor))
  else
  begin
    while APixelCount > 0 do
    begin
      Pixel := ASrcData^;
      ADstData^ := ((Pixel and $FF00FF00)         or
                   ((Pixel and $00FF0000) shr 16) or
                   ((Pixel and $000000FF) shl 16));

      Inc(ASrcData);
      Inc(ADstData);
      Dec(APixelCount);
    end;
  end;
end;

procedure TAVVideoCaptureDevice.DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
var
  BytesPerRow, Width, Height: NativeUInt;
  BaseAddress: Pointer;
  Map: TBitmapData;
begin
  if FSampleBuffer = nil then
    Exit;
  // Lock the base address of the pixel buffer.
  if CVPixelBufferLockBaseAddress(FImageBuffer, 0) = 0 then
  try
    // Get the number of bytes per row for the pixel buffer.
    BytesPerRow := CVPixelBufferGetBytesPerRow(FImageBuffer);
    // Get the pixel buffer width and height.
    Width := CVPixelBufferGetWidth(FImageBuffer);
    Height := CVPixelBufferGetHeight(FImageBuffer);
    // Get the base address of the pixel buffer.
    BaseAddress := CVPixelBufferGetBaseAddress(FImageBuffer);
    // Resize bitmap if need
    if ASetSize then
      ABitmap.SetSize(Width, Height);
    // Create and return an image object to represent the pixel buffer.
    if ABitmap.Map(TMapAccess.Write, Map) then
      try
        if Map.Pitch = Integer(BytesPerRow) then
          CopyPixels(BaseAddress, Map.Data, Width * Height)
        else
        begin
          while Height > 0 do
          begin
            CopyPixels(BaseAddress, Map.Data, Width);

            Inc(PByte(BaseAddress), BytesPerRow);
            Inc(PByte(Map.Data), Map.Pitch);
            Dec(Height);
          end;
        end;
      finally
        ABitmap.Unmap(Map);
      end;
  finally
    CVPixelBufferUnlockBaseAddress(FImageBuffer, 0);
  end;
end;

procedure TAVVideoCaptureDevice.DoRequestPermission;
begin
{$IF DEFINED(IOS)}
  TAVCaptureDevice.OCClass.requestAccessForMediaType(AVMediaTypeVideo, RecordingRequestAccessForMediaTypeCompletionHandler);
{$ELSEIF DEFINED(MACOS)}
  if TOSVersion.Check(10, 14) then
    TAVCaptureDevice.OCClass.requestAccessForMediaType(AVMediaTypeVideo, RecordingRequestAccessForMediaTypeCompletionHandler)
  else
    RecordingRequestAccessForMediaTypeCompletionHandler(True);
{$ENDIF}
end;

procedure TAVVideoCaptureDevice.RecordingRequestAccessForMediaTypeCompletionHandler(granted: Boolean);
var
  LMessage: string;
begin
  if granted then
    LMessage := string.Empty
  else
    LMessage := SUserRejectedCaptureDevicePermission;

  TThread.Synchronize(nil,
    procedure
    begin
      DoPermissionRequest(LMessage, granted);
    end);
end;

procedure TAVVideoCaptureDevice.DoStartCapture;
  function GetCaptureSettings(AWidth, AHeight: Integer; UseQuality: Boolean): NSMutableDictionary;
  begin
    Result := TNSMutableDictionary.Create;
    Result.setObject(TNSNumber.OCClass.numberWithInt(kCVPixelFormatType_32BGRA), Pointer(kCVPixelBufferPixelFormatTypeKey));
{$IFNDEF IOS}
    if not UseQuality then
    begin
      Result.setObject(TNSNumber.OCClass.numberWithInt(AWidth), Pointer(kCVPixelBufferWidthKey));
      Result.setObject(TNSNumber.OCClass.numberWithInt(AHeight), Pointer(kCVPixelBufferHeightKey));
    end;
{$ENDIF}
  end;
var
  ErrorPtr: Pointer;
  Queue: dispatch_queue_t;
  VS: NSDictionary;
  Inputs, Outputs: NSArray;
  I: Integer;
  LInput: AVCaptureDeviceInput;
  LOutput: AVCaptureOutput;
  Format: AVCaptureDeviceFormat;
  Desc: CMFormatDescriptionRef;
  Dimensions: CMVideoDimensions;
begin
  if FSession = nil then
    Exit;

{$IF DEFINED(IOS)}
  if TAVCaptureDevice.OCClass.authorizationStatusForMediaType(AVMediaTypeVideo) <> AVAuthorizationStatusAuthorized then
    raise ECaptureDeviceException.Create(SVideoCaptureUnauthorized);
{$ELSEIF DEFINED(MACOS)}
  if TOSVersion.Check(10, 14) and (TAVCaptureDevice.OCClass.authorizationStatusForMediaType(AVMediaTypeVideo) <> AVAuthorizationStatusAuthorized) then
    raise ECaptureDeviceException.Create(SVideoCaptureUnauthorized);
{$ENDIF}

  ErrorPtr := nil;

  // Remove all inputs
  Inputs := FSession.inputs;
  if (Inputs <> nil) and (Inputs.count > 0) then
    for I := 0 to Inputs.count - 1 do
    begin
      LInput := TAVCaptureDeviceInput.Wrap(Inputs.objectAtIndex(I));
      FSession.removeInput(LInput);
    end;

  // Remove all outputs
  Outputs := FSession.outputs;
  if (Outputs <> nil) and (Outputs.count > 0) then
    for I := 0 to Outputs.count - 1 do
    begin
      LOutput := TAVCaptureOutput.Wrap(Outputs.objectAtIndex(I));
      FSession.removeOutput(LOutput);
    end;

  FInput := TAVCaptureDeviceInput.Wrap(TAVCaptureDeviceInput.OCClass.deviceInputWithDevice(FDevice, @ErrorPtr));
  if ErrorPtr = nil then
  begin
    FSession.addInput(FInput);

    FOutput := TAVCaptureVideoDataOutput.Create;
    FOutput.setAlwaysDiscardsLateVideoFrames(True);
    FSession.addOutput(FOutput);
    FSampleDelegate := TAVVideoSampleDelegate.Create(Self);

    Queue := dispatch_queue_create('Video Capture Queue', 0);
    try
      FOutput.setSampleBufferDelegate(FSampleDelegate.GetObjectID, Queue);
    finally
      dispatch_release(Queue);
    end;

    Format := FDevice.activeFormat;
    Desc := Format.formatDescription;
    Dimensions := CMVideoFormatDescriptionGetDimensions(Desc);
    VS := GetCaptureSettings(Dimensions.width, Dimensions.height, Quality <> TVideoCaptureQuality.CaptureSettings);
    FOutput.setVideoSettings(VS);
    FSession.startRunning;
  end;
end;

procedure TAVVideoCaptureDevice.DoStopCapture;
begin
  if FSession = nil then
    Exit;

  FSession.stopRunning;
  { Waiting of finishing processing capture. Because, when we invoke stopRunning
    in this moment we can process a video frame. So we should wait of ending it  }
  while FSampleDelegate.IsProcessingCapture do
    Application.ProcessMessages;
end;

function TAVVideoCaptureDevice.GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string;
begin
  if FDevice <> nil then
  begin
    case Prop of
      TProperty.Description: Result := '';
      TProperty.Name: Result := UTF8ToString(FDevice.localizedName.UTF8String);
      TProperty.UniqueID: Result := UTF8ToString(FDevice.uniqueID.UTF8String);
    else
      Result := '';
    end;
  end
  else
    Result := '';
end;

function TAVVideoCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if (FSession <> nil) and FSession.isRunning then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

function TAVVideoCaptureDevice.GetFlashMode: TFlashMode;
begin
  Result := inherited GetFlashMode;
  if FDevice <> nil then
    case FDevice.flashMode of
      AVCaptureFlashModeAuto: Result := TFlashMode.AutoFlash;
      AVCaptureFlashModeOff: Result := TFlashMode.FlashOff;
      AVCaptureFlashModeOn: Result := TFlashMode.FlashOn;
    end;
end;

function TAVVideoCaptureDevice.GetFocusMode: TFocusMode;
begin
  Result := inherited;
  if FDevice <> nil then
    case FDevice.focusMode of
      AVCaptureFocusModeAutoFocus: Result := TFocusMode.AutoFocus;
      AVCaptureFocusModeContinuousAutoFocus: Result := TFocusMode.ContinuousAutoFocus;
      AVCaptureFocusModeLocked: Result := TFocusMode.Locked;
    end;
end;

function TAVVideoCaptureDevice.GetCaptureSetting: TVideoCaptureSetting;
var
  Format: AVCaptureDeviceFormat;
  Desc: CMFormatDescriptionRef;
  Dimensions: CMVideoDimensions;
  MinFrameRate, MaxFrameRate, Time: Double;
begin
  Result := TVideoCaptureSetting.Create;

  Format := FDevice.activeFormat;
  Time := CMTimeGetSeconds(FDevice.activeVideoMinFrameDuration);
  if Time > 0 then
    MaxFrameRate := 1 / Time
  else
    MaxFrameRate := 0;
  Time := CMTimeGetSeconds(FDevice.activeVideoMaxFrameDuration);
  if Time > 0 then
    MinFrameRate := 1 / Time
  else
    MinFrameRate := 0;

  if Format <> nil then
  begin
    Desc := Format.formatDescription;
    Dimensions := CMVideoFormatDescriptionGetDimensions(Desc);
    Result := CreateCaptureSettings(Dimensions.width, Dimensions.height, MinFrameRate, MinFrameRate, MaxFrameRate);
  end;
end;

function TAVVideoCaptureDevice.DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
var
  Format: AVCaptureDeviceFormat;
  Range: AVFrameRateRange;
  Formats, Ranges: NSArray;
  Desc: CMFormatDescriptionRef;
  Dimensions: CMVideoDimensions;
  I, J: Integer;
  DesiredDuration: CMTime;
  FrameRate: Double;
begin
  Result := False;
  Formats := FDevice.formats;
  if (Formats <> nil) and (Formats.count > 0) then
    for I := 0 to Formats.count - 1 do
    begin
      Format := TAVCaptureDeviceFormat.Wrap(Formats.objectAtIndex(I));
      Desc := Format.formatDescription;
      Dimensions := CMVideoFormatDescriptionGetDimensions(Desc);
      if (ASetting.Width <> Dimensions.width) or (ASetting.Height <> Dimensions.height) then
        Continue;

      Ranges := Format.videoSupportedFrameRateRanges;
      if (Ranges <> nil) and (Ranges.count > 0) then
        for J := 0 to Ranges.count - 1 do
        begin
          Range := TAVFrameRateRange.Wrap(Ranges.objectAtIndex(J));
          if (Range.minFrameRate <= (ASetting.FrameRate + FrameRateEpsilon)) and
             (Range.maxFrameRate >= (ASetting.FrameRate - FrameRateEpsilon)) then
          begin
            if FDevice.lockForConfiguration(nil) then
            begin
              try
                if Range.minFrameRate <> Range.maxFrameRate then
                begin
                  FrameRate := ASetting.FrameRate;
                  DesiredDuration := Range.maxFrameDuration;
                  DesiredDuration.value := 1;
                  DesiredDuration.timescale := Round(FrameRate);
                end
                else
                  DesiredDuration := Range.maxFrameDuration;

                FDevice.setActiveFormat(Format);
                FDevice.setActiveVideoMinFrameDuration(Range.minFrameDuration);
                FDevice.setActiveVideoMaxFrameDuration(DesiredDuration);
              finally
                FDevice.unlockForConfiguration;
              end;
              {$IF DEFINED(IOS)}
                if FSession.canSetSessionPreset(AVCaptureSessionPresetInputPriority) then
                  FSession.setSessionPreset(AVCaptureSessionPresetInputPriority);
              {$ENDIF}
              Exit(True);
            end;
          end;
        end;
    end;
end;

function TAVVideoCaptureDevice.DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>;
var
  List: TList<TVideoCaptureSetting>;
  Format: AVCaptureDeviceFormat;
  Range: AVFrameRateRange;
  Formats, Ranges: NSArray;
  Desc: CMFormatDescriptionRef;
  Dimensions: CMVideoDimensions;
  I, J: Integer;
  MaxFrameRate, MinFrameRate: Double;
  Setting: TVideoCaptureSetting;
  Size: TSize;
begin
  SetLength(Result, 0);
  Formats := FDevice.formats;
  if (Formats <> nil) and (Formats.count > 0) then
  begin
    List := TList<TVideoCaptureSetting>.Create;
    try
      for I := 0 to Formats.count - 1 do
      begin
        Format := TAVCaptureDeviceFormat.Wrap(Formats.objectAtIndex(I));
        Desc := Format.formatDescription;
        Dimensions := CMVideoFormatDescriptionGetDimensions(Desc);

        Size.Width := Dimensions.width;
        Size.Height := Dimensions.height;

        Ranges := Format.videoSupportedFrameRateRanges;
        if (Ranges <> nil) and (Ranges.count > 0) then
          for J := 0 to Ranges.count - 1 do
          begin
            Range := TAVFrameRateRange.Wrap(Ranges.objectAtIndex(J));
            MinFrameRate := Range.minFrameRate;
            MaxFrameRate := Range.maxFrameRate;
            Setting := CreateCaptureSettings(Size.Width, Size.Height, MaxFrameRate, MinFrameRate, MaxFrameRate);
            if not List.Contains(Setting) then
              List.Add(Setting);
          end;
      end;
      Result := List.ToArray;
    finally
      List.Free;
    end;
  end;
end;

function TAVVideoCaptureDevice.GetHasFlash: Boolean;
begin
  if FDevice <> nil then
    Result := FDevice.hasFlash
  else
    Result := False;
end;

function TAVVideoCaptureDevice.GetHasTorch: Boolean;
begin
  if FDevice <> nil then
    Result := FDevice.hasTorch
  else
    Result := False;
end;

function TAVVideoCaptureDevice.GetPosition: TDevicePosition;
begin
  if FDevice <> nil then
  begin
    case FDevice.position of
      AVCaptureDevicePositionBack: Result := TDevicePosition.Back;
      AVCaptureDevicePositionFront: Result := TDevicePosition.Front;
    else
      Result := TDevicePosition.Unspecified;
    end;
  end
  else
    Result := TDevicePosition.Unspecified;
end;

function TAVVideoCaptureDevice.GetTorchMode: TTorchMode;
begin
  Result := inherited GetTorchMode;
  if FDevice <> nil then
    case FDevice.TorchMode of
      AVCaptureTorchModeOff: Result := TTorchMode.ModeOff;
      AVCaptureTorchModeOn: Result := TTorchMode.ModeOn;
      AVCaptureTorchModeAuto: Result := TTorchMode.ModeAuto;
    end;
end;

{ TVideoSampleDelegateBase }

constructor TVideoSampleDelegateBase.Create(const ACaptureDevice: TAVVideoCaptureDeviceBase);
begin
  inherited Create;
  FCaptureDevice := ACaptureDevice;
end;

{ TAVVideoCaptureDeviceBase }

constructor TAVVideoCaptureDeviceBase.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean);
begin
  inherited;
end;

destructor TAVVideoCaptureDeviceBase.Destroy;
begin
  inherited;
end;

end.
