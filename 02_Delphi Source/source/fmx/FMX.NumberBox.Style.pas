{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.NumberBox.Style;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.UITypes, System.Classes, FMX.EditBox.Style, FMX.NumberBox, FMX.Controls.Presentation;

type

{ TStyledNumberBox }

  TStyledNumberBox = class(TStyledEditBox)
  public const
    Backlash = 5;
    MinimumMovement = 1;
  public type
    TMouseMoved = (None, Vertical, Horizontal);
  private
    FMouseMoved: TMouseMoved;
    FPressedPos: TPointF;
    function GetModel: TNumberBoxModel;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    property MouseMoved: TMouseMoved read FMouseMoved;
  public
    property Model: TNumberBoxModel read GetModel;
  end;

implementation

uses
  FMX.Presentation.Factory, FMX.Controls, FMX.Presentation.Style;

{ TStyledNumberBox }

function TStyledNumberBox.GetModel: TNumberBoxModel;
begin
  Result := inherited GetModel<TNumberBoxModel>;
end;

procedure TStyledNumberBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FMouseMoved := TMouseMoved.None;
    FPressedPos := TPointF.Create(X, Y);
  end;
end;

procedure TStyledNumberBox.MouseMove(Shift: TShiftState; X, Y: Single);
var
  LMinimumMovement: Integer;
  Delta: TPointF;
  Moved: Boolean;
begin
  inherited;
  if Pressed and Model.VertIncrementEnabled then
  begin
    Moved := False;
    Delta := TPointF.Create(X, Y);
    Delta := Delta - FPressedPos;
    if FMouseMoved = TMouseMoved.None then
    begin
      LMinimumMovement := Backlash;
      if (Abs(Delta.X) > LMinimumMovement) or (Abs(Delta.Y) > LMinimumMovement) then
      begin
        if Abs(Delta.X) > Abs(Delta.Y) then
        begin
          Model.ValueRange.Increment := Model.HorzIncrement;
          FMouseMoved := TMouseMoved.Horizontal;
        end
        else
        begin
          Model.ValueRange.Increment := Model.VertIncrement;
          FMouseMoved := TMouseMoved.Vertical;
        end;
      end;
    end
    else
      LMinimumMovement := MinimumMovement;
    if (FMouseMoved = TMouseMoved.Horizontal) and (Model.HorzIncrement > 0) then
    begin
      if X > FPressedPos.X + LMinimumMovement then
      begin
        EditBox.ValueInc;
        Moved := True;
      end
      else
      if X < FPressedPos.X - LMinimumMovement then
      begin
        EditBox.ValueDec;
        Moved := True;
      end;
    end;
    if (FMouseMoved = TMouseMoved.Vertical) and (Model.VertIncrement > 0) then
    begin
      if Y < FPressedPos.Y - LMinimumMovement then
      begin
        Model.ValueRange.Inc;
        Moved := True;
      end
      else
      if Y > FPressedPos.Y + LMinimumMovement then
      begin
        Model.ValueRange.Dec;
        Moved := True;
      end;
    end;
    if Moved then
    begin
      FPressedPos := TPointF.Create(X, Y);
      Repaint;
    end;
  end;
end;

procedure TStyledNumberBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FMouseMoved := TMouseMoved.None;
  if Pressed then
  begin
    Change;
    Repaint;
  end;
end;

type
  TFixedStyledNumberBox= class(TStyledNumberBox)
  private
    FIsRealignTextSelectors: Boolean;
  protected
    procedure RecalculateAbsoluteMatrices; override;
    /// <summary>Notification about lost focus. It's sent directly before the loss of focus.</summary>
    procedure PMDoBeforeExit(var AMessage: TDispatchMessage); message PM_DO_BEFORE_EXIT;
  end;

{ TFixedStyledNumberBox }

procedure TFixedStyledNumberBox.PMDoBeforeExit(var AMessage: TDispatchMessage);
begin
  DoChange;
  inherited;
end;

procedure TFixedStyledNumberBox.RecalculateAbsoluteMatrices;
begin
  inherited;
  if (TextSelectors <> nil) and not FIsRealignTextSelectors then
  begin
    FIsRealignTextSelectors := True;
    try
      TextSelectors.Realign;
    finally
      FIsRealignTextSelectors := False;
    end;
  end;
end;

initialization
  TPresentationProxyFactory.Current.Register(TNumberBox, TControlType.Styled, TStyledPresentationProxy<TFixedStyledNumberBox>);
finalization
  TPresentationProxyFactory.Current.Unregister(TNumberBox, TControlType.Styled, TStyledPresentationProxy<TFixedStyledNumberBox>);
end.
