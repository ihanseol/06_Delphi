{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MultiTouch.Android;

interface

uses
  System.Types, System.Classes, FMX.MultiTouch, FMX.Types;

type
  TMultiTouchManagerAndroid = class(TMultiTouchManager)
  protected
    procedure TouchDown; override;
    procedure TouchUp; override;
    procedure TouchMove; override;
    procedure TouchCancel; override;
  public
    constructor Create(const AParent: TComponent); override;
    destructor Destroy; override;
    procedure HandleTouches(const ATouches: TTouches; const Action: TTouchAction; const Control: IControl); override;
  end;

implementation

uses
  System.Math, System.UITypes, System.SysUtils;

const
  LongTapMovement = 10; // 10 pixels - use scale to transform to points to use on each device

{ TMultiTouchManagerAndroid }

constructor TMultiTouchManagerAndroid.Create(const AParent: TComponent);
begin
  inherited;
end;

destructor TMultiTouchManagerAndroid.Destroy;
begin
  inherited;
end;

procedure TMultiTouchManagerAndroid.HandleTouches(const ATouches: TTouches; const Action: TTouchAction;
  const Control: IControl);
begin
  FFirstPointer := ATouches[0].Location;

  if Length(ATouches) > 1 then
    FSecondPointer := ATouches[1].Location;

  inherited;

  FOldPoint1 := FFirstPointer;
  FOldPoint2 := FSecondPointer;
end;

procedure TMultiTouchManagerAndroid.TouchCancel;
begin
  inherited;
end;

procedure TMultiTouchManagerAndroid.TouchDown;
begin
  inherited;
  if Length(Touches) > 2 then
  begin
    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);
  end;
end;

procedure TMultiTouchManagerAndroid.TouchMove;
begin
  inherited;
  if Length(Touches) = 1 then
  begin
    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);

    FOldPoint2 := TPointF.Zero;
  end;

  if Length(Touches) >= 1 then
  begin
    if (Touches[0].Location.Distance(FFirstPointerDownCoordinates) > LongTaptreshold) and
      (TInteractiveGesture.Pan in (EnabledInteractiveGestures - ActiveInteractiveGestures)) and
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan)) then
      BeginInteractiveGesture(TInteractiveGesture.Pan, GestureControl);

    // Since the pointer moved a bit, we could have a pan.
    if (Touches[0].Location.Distance(FOldPoint1) > 0) and IsActive(TInteractiveGesture.Pan) then
      SendCMGestureMessage(CreateGestureEventInfo(TInteractiveGesture.Pan));
  end;

  if (Length(Touches) = 2) and not FindAndHandleInteractiveGesture(ActiveInteractiveGestures - [TInteractiveGesture.Pan], FSecondPointer, True) then
    FindAndHandleInteractiveGesture(EnabledInteractiveGestures - ActiveInteractiveGestures, FSecondPointer);
end;

procedure TMultiTouchManagerAndroid.TouchUp;
begin
  EndInteractiveGesture(TInteractiveGesture.Pan);

  if Length(Touches) = 1 then
  begin
    // end zoom and rotate gestures if they are active
    EndInteractiveGesture(TInteractiveGesture.Zoom);
    EndInteractiveGesture(TInteractiveGesture.Rotate);
  end;

  inherited;
end;

end.
