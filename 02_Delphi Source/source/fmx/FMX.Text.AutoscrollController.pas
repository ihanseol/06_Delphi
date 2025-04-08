{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.AutoscrollController;

interface

{$SCOPEDENUMS ON}

uses
  FMX.Types;

type
  /// <summary>Automatic scrolling direction.</summary>
  TAutoscrollDirection = (LeftToRight, RightToLeft, TopToBottom, BottomToTop,
                          LeftTopToRightBottom, LeftBottomToRightTop, RightTopToLeftBottom, RightBottomToLeftTop);
  TOnAutoScrollEvent = procedure(const ADirection: TAutoscrollDirection; var AStop: Boolean) of object;

  /// <summary>
  ///   Automatic scroll controller. In fact, it generates a monotonous sequence of scrolling events,
  ///   in which the client performs actual scrolling of the content, cursor movement, and so on. The controller supports
  ///   8 scroll directions.
  /// </summary>
  TAutoscrollController = class
  public const
    DefaultScrollStepInterval = 100; // msec
    DefaultStartScrollDelay = 100; // msec
  private
    FStartAutoScrollTimer: TTimer;
    FAutoScrollTimer: TTimer;
    FScrollDirection: TAutoscrollDirection;
    FOnScroll: TOnAutoScrollEvent;
    procedure SetStartDelay(const Value: Integer);
    function GetStartDelay: Integer;
    function GetScrollInterval: Integer;
    procedure SetScrollInterval(const Value: Integer);
    { Handlers }
    procedure StartAutoScrollHandler(Sender: TObject);
    procedure AutoScrollHandler(Sender: TObject);
  protected
    procedure DoScroll(var AStop: Boolean); virtual;
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>Starts autoscroll on specified direction.</summary>
    procedure Start(const ADirection: TAutoscrollDirection);
    /// <summary>Stops current autoscroll.</summary>
    procedure Stop;
  public
    /// <summary>Delay in msec between invocation <c>Start</c> and the beginning of generation <c>OnScroll</c> events.</summary>
    property StartDelay: Integer read GetStartDelay write SetStartDelay;
    /// <summary>Interval in msec between invocation of <c>OnScroll</c> event.</summary>
    property ScrollInterval: Integer read GetScrollInterval write SetScrollInterval;
    /// <summary>Current scroll direction.</summary>
    property ScrollDirection: TAutoscrollDirection read FScrollDirection;
    /// <summary>The event is called when developer need to scroll.</summary>
    property OnScroll: TOnAutoScrollEvent read FOnScroll write FOnScroll;
  end;

implementation

uses
  System.SysUtils, System.Math;

{ TAutoscrollController }

procedure TAutoscrollController.AutoScrollHandler(Sender: TObject);
var
  NeedStop: Boolean;
begin
  NeedStop := False;
  try
    DoScroll(NeedStop);
  finally
    if NeedStop then
      Stop;
  end;
end;

constructor TAutoscrollController.Create;
begin
  FStartAutoScrollTimer := TTimer.Create(nil);
  FStartAutoScrollTimer.Enabled := False;
  FStartAutoScrollTimer.Interval := DefaultStartScrollDelay;
  FStartAutoScrollTimer.OnTimer := StartAutoScrollHandler;

  FAutoScrollTimer := TTimer.Create(nil);
  FAutoScrollTimer.Interval := DefaultScrollStepInterval;
  FAutoScrollTimer.OnTimer := AutoScrollHandler;
  FAutoScrollTimer.Enabled := False;
end;

destructor TAutoscrollController.Destroy;
begin
  FreeAndNil(FAutoScrollTimer);
  FreeAndNil(FStartAutoScrollTimer);
  inherited;
end;

procedure TAutoscrollController.DoScroll(var AStop: Boolean);
begin
  if Assigned(FOnScroll) then
    FOnScroll(FScrollDirection, AStop);
end;

function TAutoscrollController.GetScrollInterval: Integer;
begin
  Result := FAutoScrollTimer.Interval;
end;

function TAutoscrollController.GetStartDelay: Integer;
begin
  Result := FStartAutoScrollTimer.Interval;
end;

procedure TAutoscrollController.SetScrollInterval(const Value: Integer);
begin
  FAutoScrollTimer.Interval := Max(0, Value);
end;

procedure TAutoscrollController.SetStartDelay(const Value: Integer);
begin
  FStartAutoScrollTimer.Interval := Max(0, Value);
end;

procedure TAutoscrollController.Start(const ADirection: TAutoscrollDirection);
begin
  FScrollDirection := ADirection;
  FStartAutoScrollTimer.Enabled := not FAutoScrollTimer.Enabled;
end;

procedure TAutoscrollController.StartAutoScrollHandler(Sender: TObject);
begin
  FStartAutoScrollTimer.Enabled := False;
  FAutoScrollTimer.Enabled := True;
end;

procedure TAutoscrollController.Stop;
begin
  FStartAutoScrollTimer.Enabled := False;
  FAutoScrollTimer.Enabled := False;
end;

end.
