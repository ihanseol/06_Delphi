{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiTouch;

interface

uses
  System.Types, System.Classes, System.Generics.Collections, FMX.Types;

type
  TMultiTouchManager = class abstract(TNoRefCountObject, IFreeNotification)
  public const
    UndefinedPoint: TPointF = (X: -1; Y: -1);
    LongTaptreshold = 10; // dp
  private
    [Weak] FParent: TComponent;
    [Weak] FGestureControl: TComponent;
    [Weak] FTouchDownControl: TComponent;
    FTouches: TTouches;
    FActiveGestures: TDictionary<TInteractiveGesture, TComponent>;
    FActiveInteractiveGestures: TInteractiveGestures;
    FEnabledInteractiveGestures: TInteractiveGestures;
    procedure SetGestureControl(const Value: TComponent);
    procedure SetTouchDownControl(const Value: TComponent);
    procedure SetEnabledInteractiveGestures(const Value: TInteractiveGestures);
    { IFreeNotification }
    procedure FreeNotification(AObject: TObject);
  protected
    FFirstPointerDownCoordinates: TPointF;
    FFirstPointer: TPointF;
    FSecondPointer: TPointF;
    FOldPoint1: TPointF;
    FOldPoint2: TPointF;
    FRotationAngle: Single;
    procedure TouchDown; virtual;
    procedure TouchUp; virtual;
    procedure TouchMove; virtual; abstract;
    procedure TouchCancel; virtual;
    property GestureControl: TComponent read FGestureControl write SetGestureControl;
    property TouchDownControl: TComponent read FTouchDownControl write SetTouchDownControl;

    function IsZoom(const APoint1, APoint2: TPointF): Boolean;
    function IsRotate(const APoint1, APoint2: TPointF): Boolean;
    function SendCMGestureMessage(AEventInfo: TGestureEventInfo): Boolean; virtual;
    function CreateGestureEventInfo(const AGesture: TInteractiveGesture; const AGestureEnded: Boolean = False): TGestureEventInfo; virtual;

    { Standard gestures }
    procedure CancelStandardGestures;

    { Interactive gestures }
    function FindAndHandleInteractiveGesture(const EffectiveGestureSet: TInteractiveGestures; const APoint: TPointF;
      const AGestureStarted: Boolean = False): Boolean;
    procedure BeginInteractiveGesture(const AGesture: TInteractiveGesture; const AControl: TComponent);
    function EndInteractiveGesture(const AGesture: TInteractiveGesture): Boolean;
    procedure CancelAllInteractiveGestures;
  public
    constructor Create(const AParent: TComponent); virtual;
    destructor Destroy; override;
    procedure HandleTouches(const ATouches: TTouches; const Action: TTouchAction; const Control: IControl); virtual;

    function IsActive(const AGesture: TInteractiveGesture): Boolean;
    function IsEnabled(const AGesture: TInteractiveGesture): Boolean;
  public
    property Parent: TComponent read FParent write FParent;
    property ActiveInteractiveGestures: TInteractiveGestures read FActiveInteractiveGestures;
    property EnabledInteractiveGestures: TInteractiveGestures read FEnabledInteractiveGestures write SetEnabledInteractiveGestures;
    property Touches: TTouches read FTouches;
  end;

implementation

uses
  System.UITypes, System.SysUtils, System.Math, FMX.Platform, FMX.Gestures;

{ TMultiTouchManager }

constructor TMultiTouchManager.Create(const AParent: TComponent);
begin
  FParent := AParent;
  FActiveInteractiveGestures := [];
  FEnabledInteractiveGestures := [];
  FRotationAngle := 0;
  FOldPoint1 := UndefinedPoint;
  FOldPoint2 := UndefinedPoint;
  FSecondPointer := UndefinedPoint;
  FActiveGestures := TDictionary<TInteractiveGesture, TComponent>.Create;
end;

function TMultiTouchManager.CreateGestureEventInfo(const AGesture: TInteractiveGesture;
  const AGestureEnded: Boolean): TGestureEventInfo;
begin
  FillChar(Result, Sizeof(Result), 0);
  Result.Location := FFirstPointer;
  Result.GestureID := igiZoom + Ord(AGesture);

  if not (AGesture in FActiveInteractiveGestures) then
    Result.Flags := [TInteractiveGestureFlag.gfBegin];
  if AGestureEnded then
    Result.Flags := [TInteractiveGestureFlag.gfEnd];

  case AGesture of
    TInteractiveGesture.Zoom:
      begin
        if AGestureEnded and FSecondPointer.EqualsTo(UndefinedPoint) then
          FSecondPointer := FOldPoint2;
        Result.Location := FFirstPointer.MidPoint(FSecondPointer);
        Result.Distance := Round(FFirstPointer.Distance(FSecondPointer));
      end;
    TInteractiveGesture.Pan:
      if not FSecondPointer.EqualsTo(UndefinedPoint) then
        Result.Distance := Round(FFirstPointer.Distance(FSecondPointer));
    TInteractiveGesture.Rotate:
      begin
        if AGestureEnded and FSecondPointer.EqualsTo(UndefinedPoint) then
          FSecondPointer := FOldPoint2;
        Result.Location := FFirstPointer.MidPoint(FSecondPointer);
        Result.Angle := FRotationAngle;
      end;
    TInteractiveGesture.PressAndTap:
      Result.Distance := Round(FFirstPointer.Distance(FSecondPointer));
    TInteractiveGesture.LongTap:
      Result.Location := FFirstPointerDownCoordinates;
  end;
end;

destructor TMultiTouchManager.Destroy;

  procedure UnsusbscribesActiveGestures;
  begin
    for var Pair in FActiveGestures do
      if Pair.Value is TFMXObject then
        TFmxObject(Pair.Value).RemoveFreeNotify(Self);
  end;

begin
  UnsusbscribesActiveGestures;
  FreeAndNil(FActiveGestures);
  FParent := nil;
  // Reset subscription on IFreeNotification
  GestureControl := nil;
  TouchDownControl := nil;
  inherited;
end;

procedure TMultiTouchManager.CancelAllInteractiveGestures;

  procedure UnsusbscribesActiveGestures;
  begin
    for var Pair in FActiveGestures do
      if Pair.Value is TFMXObject then
        TFmxObject(Pair.Value).RemoveFreeNotify(Self);
  end;

begin
  FActiveInteractiveGestures := [];
  UnsusbscribesActiveGestures;
  FActiveGestures.Clear;
end;

function TMultiTouchManager.EndInteractiveGesture(const AGesture: TInteractiveGesture): Boolean;
var
  LGestureControl: TComponent;
begin
  Result := False;
  if AGesture in FActiveInteractiveGestures then
  begin
    Result := True;
    SendCMGestureMessage(CreateGestureEventInfo(AGesture, True));
    Exclude(FActiveInteractiveGestures, AGesture);
    if FActiveGestures.TryGetValue(AGesture, LGestureControl) and (LGestureControl is TFMXObject) then
      TFMXObject(LGestureControl).RemoveFreeNotify(Self);
    FActiveGestures.Remove(AGesture);

    if AGesture = TInteractiveGesture.Rotate then
      FRotationAngle := 0;
  end;
end;

function TMultiTouchManager.FindAndHandleInteractiveGesture(const EffectiveGestureSet: TInteractiveGestures;
  const APoint: TPointF; const AGestureStarted: Boolean): Boolean;
begin
  Result := False;
  if EffectiveGestureSet <> [] then
  begin
    if (TInteractiveGesture.Zoom in EffectiveGestureSet) and not (FFirstPointer = APoint) and
      IsZoom(FFirstPointer, APoint) then
      Exit(True);

    if (TInteractiveGesture.Rotate in EffectiveGestureSet) and not (FFirstPointer = APoint) and
      IsRotate(FFirstPointer, APoint) then
      Exit(True);

    if TInteractiveGesture.Pan in EffectiveGestureSet then
    begin
      // Testing for already started pan gesture: see that some movement was made.
      if AGestureStarted then
        if (FFirstPointer <> FOldPoint1) and (APoint <> FOldPoint2) and
          SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan)) then
          Exit(True)
          // Testing for a not yet started pan gesture: see that enough movement was made since the first touch.
        else if (FFirstPointer.Distance(FFirstPointerDownCoordinates) > LongTaptreshold) and
          (APoint.Distance(FFirstPointerDownCoordinates) > LongTaptreshold) and
          SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan)) then
        begin
          BeginInteractiveGesture(TInteractiveGesture.Pan, GestureControl);
          Exit(True);
        end;
    end;
  end;
end;

procedure TMultiTouchManager.FreeNotification(AObject: TObject);
begin
  if FGestureControl = AObject then
    FGestureControl := nil
  else if FTouchDownControl = AObject then
    FTouchDownControl := nil;

  for var Pair in FActiveGestures.ToArray do
    if Pair.Value = AObject then
      FActiveGestures.Remove(Pair.Key);
end;

procedure TMultiTouchManager.HandleTouches(const ATouches: TTouches; const Action: TTouchAction;
  const Control: IControl);
var
  Obj: IMultiTouch;
begin
  FTouches := ATouches;
  if Action = TTouchAction.Down then
    if Control = nil then
      TouchDownControl := Parent
    else
      TouchDownControl := Control.GetObject;

  if Supports(Parent, IMultiTouch, Obj) then
    Obj.MultiTouch(Touches, Action);

  case Action of
    TTouchAction.Down:
      TouchDown;
    TTouchAction.Up:
      TouchUp;
    TTouchAction.Move:
      TouchMove;
    TTouchAction.Cancel:
      TouchCancel;
  end;
end;

function TMultiTouchManager.IsActive(const AGesture: TInteractiveGesture): Boolean;
begin
  Result := AGesture in FActiveInteractiveGestures;
end;

function TMultiTouchManager.IsEnabled(const AGesture: TInteractiveGesture): Boolean;
begin
  Result := AGesture in FEnabledInteractiveGestures;
end;

function TMultiTouchManager.IsRotate(const APoint1, APoint2: TPointF): Boolean;
var
  Angle1, Angle2: Single;
begin
  Result := False;
  // check that there was a previous 2 finger movement
  if FOldPoint1.EqualsTo(UndefinedPoint) or FOldPoint2.EqualsTo(UndefinedPoint) then
    Exit;

  // make sure that either the x or the y values change in opposite directions
  if ((FOldPoint1.X - APoint1.X) * (FOldPoint2.X - APoint2.X) <= 0) or
    ((FOldPoint1.Y - APoint1.Y) * (FOldPoint2.Y - APoint2.Y) <= 0) then
  begin
    Angle1 := APoint1.Angle(APoint2);
    Angle2 := FOldPoint1.Angle(FOldPoint2);

                                                                                                                

    if Min(2 * Pi - Abs(Angle1 - Angle2), Abs(Angle1 - Angle2)) >= 0.01 then
    begin
      Result := True;
      // make rotation value counterclockwise and cumulative
      FRotationAngle := FRotationAngle - Angle1 + Angle2;
      // Keep rotation angle between -2Pi and 2Pi
      if FRotationAngle > 2 * Pi then
        FRotationAngle := FRotationAngle - 2 * Pi
      else if FRotationAngle < -2 * Pi then
        FRotationAngle := FRotationAngle + 2 * Pi
    end;
  end;

  if Result then
    if SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Rotate)) then
      BeginInteractiveGesture(TInteractiveGesture.Rotate, GestureControl)
    else
      Result := False;
end;

function TMultiTouchManager.IsZoom(const APoint1, APoint2: TPointF): Boolean;
var
  Distance1, Distance2: Single;
begin
  Result := False;
  // check that there was a previous 2 finger movement
  if not FOldPoint1.EqualsTo(UndefinedPoint) and not FOldPoint2.EqualsTo(UndefinedPoint) then
  begin
    Distance1 := APoint1.Distance(APoint2);
    Distance2 := FOldPoint1.Distance(FOldPoint2);

    // Take into account an error margin (there is always a distance between two fingers pressed together).
    if (Abs(Distance1) > 2) and (Abs(Distance1 - Distance2) > 2) then
      Result := True;
  end;

  if Result then
    if SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Zoom)) then
      BeginInteractiveGesture(TInteractiveGesture.Zoom, GestureControl)
    else
      Result := False;
end;

function TMultiTouchManager.SendCMGestureMessage(AEventInfo: TGestureEventInfo): Boolean;
var
  GObj: IGestureControl;
  OldGestureControl: TComponent;
  LGestureControl: TComponent;
const
  LGestureMap: array [igiZoom .. igiDoubleTap] of TInteractiveGesture = (TInteractiveGesture.Zoom,
    TInteractiveGesture.Pan, TInteractiveGesture.Rotate, TInteractiveGesture.TwoFingerTap,
    TInteractiveGesture.PressAndtap, TInteractiveGesture.LongTap, TInteractiveGesture.DoubleTap);
begin
  Result := False;
  OldGestureControl := GestureControl;
  if (TInteractiveGestureFlag.gfBegin in AEventInfo.Flags) and Supports(TouchDownControl, IGestureControl, GObj) then
    GestureControl := GObj.GetFirstControlWithGesture(LGestureMap[AEventInfo.GestureID]);

  if not (TInteractiveGestureFlag.gfBegin in AEventInfo.Flags) and FActiveGestures.TryGetValue(LGestureMap[AEventInfo.GestureID], LGestureControl) then
    GestureControl := LGestureControl;

  if Supports(GestureControl, IGestureControl, GObj) then
  begin
    GObj.CMGesture(AEventInfo);
    Result := True;
  end
  else
    GestureControl := OldGestureControl;

  if TInteractiveGestureFlag.gfEnd in AEventInfo.Flags then
    GestureControl := nil;
end;

procedure TMultiTouchManager.SetEnabledInteractiveGestures(const Value: TInteractiveGestures);
begin
  FEnabledInteractiveGestures := Value;
end;

procedure TMultiTouchManager.SetGestureControl(const Value: TComponent);
begin
  if FGestureControl <> Value then
  begin
    if FGestureControl is TFmxObject then
      TFmxObject(FGestureControl).RemoveFreeNotify(Self);
    FGestureControl := Value;
    if FGestureControl is TFmxObject then
      TFmxObject(FGestureControl).AddFreeNotify(Self);
  end;
end;

procedure TMultiTouchManager.SetTouchDownControl(const Value: TComponent);
begin
  if FTouchDownControl <> Value then
  begin
    if FTouchDownControl is TFmxObject then
      TFmxObject(FTouchDownControl).RemoveFreeNotify(Self);
    FTouchDownControl := Value;
    if FTouchDownControl is TFmxObject then
      TFmxObject(FTouchDownControl).AddFreeNotify(Self);
  end;
end;

procedure TMultiTouchManager.CancelStandardGestures;
var
  LGestureControl: IGestureControl;
begin
  if Supports(GestureControl, IGestureControl, LGestureControl) and (LGestureControl.TouchManager.GestureEngine <> nil) then
    TGestureEngine(LGestureControl.TouchManager.GestureEngine).ClearPoints;
end;

procedure TMultiTouchManager.BeginInteractiveGesture(const AGesture: TInteractiveGesture; const AControl: TComponent);
begin
  Include(FActiveInteractiveGestures, AGesture);
  if not FActiveGestures.ContainsKey(AGesture) then
  begin
    FActiveGestures.Add(AGesture, AControl);
    if AControl is TFmxObject then
      TFmxObject(AControl).AddFreeNotify(Self);
  end;
end;

procedure TMultiTouchManager.TouchCancel;
begin
  CancelAllInteractiveGestures;
  FRotationAngle := 0;
  FFirstPointerDownCoordinates := TPointF.Zero;
end;

procedure TMultiTouchManager.TouchDown;
begin
  if Length(Touches) = 1 then
    FFirstPointerDownCoordinates := Touches[0].Location;
end;

procedure TMultiTouchManager.TouchUp;
var
  LGestureControl: IGestureControl;
begin
  if Length(Touches) = 1 then
  begin
    // Tap
    if (FFirstPointerDownCoordinates.Distance(Touches[0].Location) <= LongTaptreshold) and
      Supports(Parent, IGestureControl, LGestureControl) then
      LGestureControl.Tap(Touches[0].Location);

    FFirstPointerDownCoordinates := UndefinedPoint;
  end;
end;

end.
