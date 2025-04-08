{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiTouch.Win;

interface

uses
  System.Types, System.Classes, FMX.MultiTouch, FMX.Types;

type
  TMultiTouchManagerWin = class(TMultiTouchManager)
  private
    FDblTapFirstTouchUp: Boolean;
    FPressAndTapPossible: Boolean;
    FPressAndTapSecondTouchDown: Boolean;
    FDoubleTapTimer: TFmxHandle;
    FLongTapTimer: TFmxHandle;
    FTimerService: IFMXTimerService;
    procedure StandardGesturesDown(const ALocalPoint: TPointF);
    procedure StandardGesturesUp(const ALocalPoint: TPointF);
    procedure StandardGesturesMove(const ALocalPoint: TPointF);
    { Double Tap }
    procedure CreateDoubleTapTimer;
    procedure DestroyDoubleTapTimer;
    procedure DoubleTapTimerHandler;
    { Long Tap }
    procedure CreateLongTapTimer;
    procedure DestroyLongTapTimer;
    procedure LongTapTimerHandler;
  protected
    procedure TouchDown; override;
    procedure TouchUp; override;
    procedure TouchMove; override;
    procedure TouchCancel; override;
  public
    constructor Create(const AParent: TComponent); override;
    destructor Destroy; override;
    procedure HandleTouches(const ATouches: TTouches; const Action: TTouchAction; const Control: IControl); override;
    procedure HandleMouseGestures(const ALocalPoint: TPointF; const Action: TTouchAction; const Control: IControl);
  end;

implementation

uses
  System.SysUtils, System.UITypes, System.Math, FMX.Gestures, FMX.Gestures.Win, FMX.Platform, Winapi.Windows;

const
  DblTapDelay = 300; // delay between the 2 taps
  LongTapDuration = 500;

  { TMultiTouchManagerWin }

constructor TMultiTouchManagerWin.Create(const AParent: TComponent);
begin
  inherited;
  if not TPlatformServices.Current.SupportsPlatformService(IFMXTimerService, FTimerService) then
    raise EUnsupportedPlatformService.Create('IFMXTimerService');
end;

procedure TMultiTouchManagerWin.CreateDoubleTapTimer;
begin
  if FDoubleTapTimer = 0 then
    FDoubleTapTimer := FTimerService.CreateTimer(DblTapDelay, DoubleTapTimerHandler);
end;

procedure TMultiTouchManagerWin.CreateLongTapTimer;
begin
  if FLongTapTimer = 0 then
    FLongTapTimer := FTimerService.CreateTimer(LongTapDuration, LongTapTimerHandler);
end;

destructor TMultiTouchManagerWin.Destroy;
begin
  DestroyDoubleTapTimer;
  DestroyLongTapTimer;
  FTimerService := nil;
  inherited;
end;

procedure TMultiTouchManagerWin.DestroyDoubleTapTimer;
begin
  if FDoubleTapTimer <> 0 then
  begin
    FTimerService.DestroyTimer(FDoubleTapTimer);
    FDoubleTapTimer := 0;
    FDblTapFirstTouchUp := False;
  end;
end;

procedure TMultiTouchManagerWin.DestroyLongTapTimer;
begin
  if FLongTapTimer <> 0 then
  begin
    FTimerService.DestroyTimer(FLongTapTimer);
    FLongTapTimer := 0;
  end;
end;

procedure TMultiTouchManagerWin.DoubleTapTimerHandler;
begin
  // no double tap was made
  DestroyDoubleTapTimer;
end;

procedure TMultiTouchManagerWin.HandleMouseGestures(const ALocalPoint: TPointF; const Action: TTouchAction; const Control: IControl);
begin
  if Action = TTouchAction.Down then
    if Control <> nil then
      TouchDownControl := Control.GetObject
    else
      TouchDownControl := Parent;

  case Action of
    TTouchAction.Down:
      StandardGesturesDown(ALocalPoint);
    TTouchAction.Up:
      StandardGesturesUp(ALocalPoint);
    TTouchAction.Move:
      StandardGesturesMove(ALocalPoint);
    TTouchAction.Cancel:
      CancelStandardGestures;
  end;
end;

procedure TMultiTouchManagerWin.HandleTouches(const ATouches: TTouches; const Action: TTouchAction;
  const Control: IControl);
begin
  FFirstPointer := ATouches[0].Location;

  if Length(ATouches) > 1 then
    FSecondPointer := ATouches[1].Location;

  inherited;

  FOldPoint1 := FFirstPointer;
  FOldPoint2 := FSecondPointer;
end;

procedure TMultiTouchManagerWin.LongTapTimerHandler;
begin
  // a long press was recognized
  DestroyLongTapTimer;
  if SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.LongTap)) then
    BeginInteractiveGesture(TInteractiveGesture.LongTap, GestureControl);
end;

procedure TMultiTouchManagerWin.StandardGesturesDown(const ALocalPoint: TPointF);
var
  GestureObj: IGestureControl;
  InitialPoint: TPointF;
begin
  if Supports(TouchDownControl, IGestureControl, GestureObj) then
  begin
    GestureControl := GestureObj.GetFirstControlWithGestureEngine;
    if Supports(GestureControl, IGestureControl, GestureObj) then
    begin
      InitialPoint := ALocalPoint;

      TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).InitialPoint := InitialPoint;
      TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).ClearPoints;
      TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).AddPoint(ALocalPoint.X, ALocalPoint.Y);
    end;
  end;
end;

procedure TMultiTouchManagerWin.StandardGesturesMove(const ALocalPoint: TPointF);
var
  GestureObj: IGestureControl;
begin
  if Supports(GestureControl, IGestureControl, GestureObj) and (GestureObj.TouchManager.GestureEngine <> nil) then
    TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).AddPoint(ALocalPoint.X, ALocalPoint.Y);
end;

procedure TMultiTouchManagerWin.StandardGesturesUp(const ALocalPoint: TPointF);
var
  GestureObj: IGestureControl;
  EventInfo: TGestureEventInfo;
const
  LGestureTypes: TGestureTypes = [TGestureType.Standard, TGestureType.Recorded, TGestureType.Registered];
begin
  if Supports(GestureControl, IGestureControl, GestureObj) and (GestureObj.TouchManager.GestureEngine <> nil) then
  begin
    if TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).PointCount > 1 then
    begin
      FillChar(EventInfo, Sizeof(EventInfo), 0);
      if TPlatformGestureEngine.IsGesture(TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).Points,
        TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).GestureList, LGestureTypes, EventInfo) then
        TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).BroadcastGesture(GestureControl, EventInfo);
    end;

    TPlatformGestureEngine(GestureObj.TouchManager.GestureEngine).ClearPoints;
    GestureControl := nil;
  end;
end;

procedure TMultiTouchManagerWin.TouchCancel;
begin
  inherited;
  DestroyLongTapTimer;
  DestroyDoubleTapTimer;
  if Length(Touches) = 1 then
    CancelStandardGestures;
end;

procedure TMultiTouchManagerWin.TouchDown;
begin
  inherited;
  if Length(Touches) = 1 then
  begin
    if (FDoubleTapTimer = 0) and IsEnabled(TInteractiveGesture.DoubleTap) then
      CreateDoubleTapTimer;
    if IsEnabled(TInteractiveGesture.LongTap) then
      CreateLongTapTimer;

    if IsEnabled(TInteractiveGesture.PressAndTap) then
      FPressAndTapPossible := True;
    StandardGesturesDown(Touches[0].Location);
  end
  else if Length(Touches) = 2 then
    FPressAndTapSecondTouchDown := True
  else if Length(Touches) > 2 then
  begin
    FPressAndTapPossible := False;
    FPressAndTapSecondTouchDown := False;

    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);
  end;
end;

procedure TMultiTouchManagerWin.TouchMove;
begin
  if Length(Touches) = 1 then
  begin
    if FFirstPointer.Distance(FFirstPointerDownCoordinates) > LongTaptreshold then
    begin
      DestroyLongTapTimer;
      DestroyDoubleTapTimer;
      FPressAndTapPossible := False;
    end;

    StandardGesturesMove(FFirstPointer);

    if (FFirstPointer.Distance(FFirstPointerDownCoordinates) > LongTaptreshold) and
      (TInteractiveGesture.Pan in (EnabledInteractiveGestures - ActiveInteractiveGestures)) and
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan)) then
      BeginInteractiveGesture(TInteractiveGesture.Pan, GestureControl);

    // Since the pointer moved a bit, we could have a pan.
    if (FFirstPointer.Distance(FOldPoint1) > 0) and IsActive(TInteractiveGesture.Pan) then
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan));

    // LongTap
    if (FFirstPointer.Distance(FOldPoint1) > 0) and IsActive(TInteractiveGesture.LongTap) then
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.LongTap));

    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);

    FOldPoint2 := UndefinedPoint;
  end;

  if Length(Touches) = 2 then
  begin
    if not FindAndHandleInteractiveGesture(ActiveInteractiveGestures, FSecondPointer, True) then
      FindAndHandleInteractiveGesture(EnabledInteractiveGestures - ActiveInteractiveGestures, FSecondPointer);
    if IsEnabled(TInteractiveGesture.PressAndTap) and
      ((FSecondPointer.Distance(FOldPoint2) > LongTaptreshold) or
      (FFirstPointer.Distance(FOldPoint1) > LongTaptreshold)) then
      FPressAndTapPossible := False;
  end;

  if Length(Touches) > 1 then
  begin
    DestroyLongTapTimer;
    DestroyDoubleTapTimer;
  end;
end;

procedure TMultiTouchManagerWin.TouchUp;
const
  LGestureTypes: TGestureTypes = [TGestureType.Standard, TGestureType.Recorded, TGestureType.Registered];
begin
  DestroyLongTapTimer;
  // pan gesture ends, if it is active
  EndInteractiveGesture(TInteractiveGesture.Pan);
  EndInteractiveGesture(TInteractiveGesture.LongTap);

  if FDoubleTapTimer <> 0 then
    if not FDblTapFirstTouchUp then
      FDblTapFirstTouchUp := True
    else
    begin
      DestroyDoubleTapTimer;
      FDblTapFirstTouchUp := False;
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.DoubleTap));
    end;

  if Length(Touches) = 1 then
  begin
    StandardGesturesUp(Touches[0].Location);
    if FPressAndTapPossible and FPressAndTapSecondTouchDown and
      IsEnabled(TInteractiveGesture.PressAndTap) then
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.PressAndTap));
    FPressAndTapPossible := False;
    FPressAndTapSecondTouchDown := False;

    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);
  end;

  if (Length(Touches) = 2) and FPressAndTapPossible and FPressAndTapSecondTouchDown and
    IsEnabled(TInteractiveGesture.PressAndTap) then
  begin
    SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.PressAndTap));
    FPressAndTapPossible := False;
    FPressAndTapSecondTouchDown := False;
  end;

  inherited;
end;

end.
