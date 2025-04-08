{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MediaLibrary.Actions;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Actions, System.Messaging, FMX.Types, FMX.MediaLibrary, FMX.ActnList, FMX.StdActns, FMX.Consts, 
  FMX.Graphics, FMX.Controls;

type

{ TCustomTakePhotoAction }

  TCustomTakePhotoAction = class(TSysCommonAction)
  public const
    DefaultMaxWidth = 1024;
    DefaultMaxHeight = 1024;
    DefaultEditable = False;
    DefaultNeedSaveToAlbum = False;
    DefaultPickerPresentation = TPickerPresentation.Latest;
  private
    FEditable: Boolean;
    FNeedSaveToAlbum: Boolean;
    FMaxWidth: Cardinal;
    FMaxHeight: Cardinal;
    FPickerPresentation: TPickerPresentation;
    FOnDidCancelTaking: TOnDidCancelTaking;
    FOnDidFinishTaking: TOnDidFinishTaking;
    FOnDidFailTaking: TOnDidFailTaking;
    function GetTargetControl: TControl;
    { Messaging }
    procedure DidCancelTaking(const Sender: TObject; const M: TMessage);
    procedure DidFailTaking(const Sender: TObject; const M: TMessage);
  protected
    procedure DoCancelTaking; virtual;
    procedure DoFinishedTakingImage(AImage: TBitmap); virtual;
    procedure DoFailedTakingImage(FailureCause: TTakingFailureCause); virtual;
    /// <summary>Fills and returns params of information for quering image.</summary>
    function GetParamsPhotoQuery: TParamsPhotoQuery;
    /// <summary>Need save a photo to album or not</summary>
    property NeedSaveToAlbum: Boolean read FNeedSaveToAlbum write FNeedSaveToAlbum default DefaultNeedSaveToAlbum;
    property PickerPresentation: TPickerPresentation read FPickerPresentation write FPickerPresentation default DefaultPickerPresentation;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property TargetControl: TControl read GetTargetControl;
  public
    property Editable: Boolean read FEditable write FEditable default DefaultEditable;
    property MaxHeight: Cardinal read FMaxHeight write FMaxHeight default DefaultMaxHeight;
    property MaxWidth: Cardinal read FMaxWidth write FMaxWidth default DefaultMaxWidth;
    property OnDidCancelTaking: TOnDidCancelTaking read FOnDidCancelTaking write FOnDidCancelTaking;
    property OnDidFinishTaking: TOnDidFinishTaking read FOnDidFinishTaking write FOnDidFinishTaking;
    property OnDidFailTaking: TOnDidFailTaking read FOnDidFailTaking write FOnDidFailTaking;
  end;

{ TTakePhotoFromCameraAction }

  TTakePhotoFromCameraAction = class(TCustomTakePhotoAction)
  private
    FCameraService: IFMXCameraService;
    procedure DidReceiveBitmap(const Sender: TObject; const M: TMessage);
  protected
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Editable;
    property MaxHeight;
    property MaxWidth;
    property NeedSaveToAlbum;
    property OnDidCancelTaking;
    property OnDidFinishTaking;
    property OnDidFailTaking;
  end;

{ TTakePhotoFromLibraryAction }

  TTakePhotoFromLibraryAction = class(TCustomTakePhotoAction)
  private
    FTakenImageService: IFMXTakenImageService;
    procedure DidReceiveBitmap(const Sender: TObject; const M: TMessage);
  protected
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Editable;
    property MaxHeight;
    property MaxWidth;
    property PickerPresentation;
    property OnDidCancelTaking;
    property OnDidFinishTaking;
    property OnDidFailTaking;
  end;

{ TShowShareSheetAction }

  TShowShareSheetAction = class(TSysCommonAction)
  strict private
    FSharingService: IFMXShareSheetActionsService;
    FBitmap: TBitmap;
    FMessage: string;
    FOnBeforeExecute: TNotifyEvent;
  private
    procedure SetBitmap(const Value: TBitmap);
  protected
    procedure DoBeforeExecute;
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property TextMessage: string read FMessage write FMessage;
    property OnBeforeExecute: TNotifyEvent read FOnBeforeExecute write FOnBeforeExecute;
  end;

implementation

uses
  System.SysUtils, FMX.Platform, System.Types;

{ TTakePhotoAction }

constructor TCustomTakePhotoAction.Create(AOwner: TComponent);
begin
  inherited;
  HideIfUnsupportedInterface := True;
  FEditable := DefaultEditable;
  FMaxHeight := DefaultMaxHeight;
  FMaxWidth := DefaultMaxWidth;
  FNeedSaveToAlbum := DefaultNeedSaveToAlbum;
  FPickerPresentation := DefaultPickerPresentation;
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidCancelTaking, DidCancelTaking);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFailTaking, DidFailTaking);
end;

destructor TCustomTakePhotoAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidCancelTaking, DidCancelTaking);
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFailTaking, DidFailTaking);
  inherited;
end;

procedure TCustomTakePhotoAction.DidCancelTaking(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidCancelTaking then
    DoCancelTaking;
end;

procedure TCustomTakePhotoAction.DidFailTaking(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFailTaking then
    DoFailedTakingImage(TMessageDidFailTaking(M).Value);
end;

procedure TCustomTakePhotoAction.DoCancelTaking;
begin
  if Assigned(OnDidCancelTaking) then
    OnDidCancelTaking;
end;

procedure TCustomTakePhotoAction.DoFinishedTakingImage(AImage: TBitmap);
begin
  if Assigned(OnDidFinishTaking) then
    OnDidFinishTaking(AImage);
end;

procedure TCustomTakePhotoAction.DoFailedTakingImage(FailureCause: TTakingFailureCause);
begin
  if Assigned(OnDidFailTaking) then
    OnDidFailTaking(FailureCause);
end;

function TCustomTakePhotoAction.GetParamsPhotoQuery: TParamsPhotoQuery;
begin
  Result.RequiredResolution := TSize.Create(Longint(MaxWidth), Longint(MaxHeight));
  Result.Editable := Editable;
  Result.NeedSaveToAlbum := NeedSaveToAlbum;
  Result.PickerPresentation := PickerPresentation;
  Result.OnDidFinishTaking := DoFinishedTakingImage;
  Result.OnDidCancelTaking := DoCancelTaking;
  Result.OnDidFailTaking := DoFailedTakingImage;
end;

function TCustomTakePhotoAction.GetTargetControl: TControl;
begin
  if ActionComponent is TControl then
    Result := TControl(ActionComponent)
  else
    Result := nil;
end;

function TCustomTakePhotoAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported;
end;

{ TTakePhotoAction }

constructor TTakePhotoFromCameraAction.Create(AOwner: TComponent);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXCameraService, FCameraService);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromCamera, DidReceiveBitmap);
end;

procedure TTakePhotoFromCameraAction.CustomTextChanged;
begin
  Text := GetDefaultText(STakePhotoFromCamera);
end;

destructor TTakePhotoFromCameraAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFinishTakingImageFromCamera, DidReceiveBitmap);
  FCameraService := nil;
  inherited;
end;

procedure TTakePhotoFromCameraAction.DidReceiveBitmap(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromCamera then
    DoFinishedTakingImage(TMessageDidFinishTakingImageFromCamera(M).Value);
end;

procedure TTakePhotoFromCameraAction.ExecuteTarget(Target: TObject);
var
  LTargetControl: TControl;
begin
  if IsSupportedInterface then
  begin
    if Target is TControl then
      LTargetControl := TControl(Target)
    else
      LTargetControl := TargetControl;
    FCameraService.TakePhoto(LTargetControl, GetParamsPhotoQuery);
  end;
end;

function TTakePhotoFromCameraAction.IsSupportedInterface: Boolean;
begin
  Result := FCameraService <> nil;
end;

{ TTakePhotoFromLibraryAction }

constructor TTakePhotoFromLibraryAction.Create(AOwner: TComponent);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXTakenImageService, FTakenImageService);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
end;

procedure TTakePhotoFromLibraryAction.CustomTextChanged;
begin
  Text := GetDefaultText(STakePhotoFromLibarary);
end;

destructor TTakePhotoFromLibraryAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
  FTakenImageService := nil;
  inherited;
end;

procedure TTakePhotoFromLibraryAction.DidReceiveBitmap(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromLibrary then
    DoFinishedTakingImage(TMessageDidFinishTakingImageFromLibrary(M).Value);
end;

procedure TTakePhotoFromLibraryAction.ExecuteTarget(Target: TObject);
var
  LTargetControl: TControl;
begin
  if IsSupportedInterface then
  begin
    if Target is TControl then
      LTargetControl := TControl(Target)
    else
      LTargetControl := TargetControl;
    FTakenImageService.TakeImageFromLibrary(LTargetControl, GetParamsPhotoQuery);
  end;
end;

function TTakePhotoFromLibraryAction.IsSupportedInterface: Boolean;
begin
  Result := FTakenImageService <> nil;
end;

{ TShowShareSheetAction }

constructor TShowShareSheetAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMessage := '';
  FBitmap := TBitmap.Create(0, 0);
  TPlatformServices.Current.SupportsPlatformService(IFMXShareSheetActionsService, FSharingService);
end;

procedure TShowShareSheetAction.CustomTextChanged;
begin
  Text := GetDefaultText(SOpenStandartServices);
end;

destructor TShowShareSheetAction.Destroy;
begin
  FSharingService := nil;
  FreeAndNil(FBitmap);
  inherited Destroy;
end;

procedure TShowShareSheetAction.DoBeforeExecute;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TShowShareSheetAction.ExecuteTarget(Target: TObject);
var
  TargetControl: TControl;
begin
  DoBeforeExecute;
  inherited ExecuteTarget(Target);
  if Target is TControl then
    TargetControl := TControl(Target)
  else if ActionComponent is TControl then
    TargetControl := TControl(ActionComponent)
  else
    TargetControl := nil;
  if (Bitmap <> nil) and (FSharingService <> nil) then
    FSharingService.Share(TargetControl, TextMessage, Bitmap);
end;

function TShowShareSheetAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported;
end;

function TShowShareSheetAction.IsSupportedInterface: Boolean;
begin
  Result := FSharingService <> nil;
end;

procedure TShowShareSheetAction.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

end.
