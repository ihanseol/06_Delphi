{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.MPlayer;

{$HPPEMIT LEGACYHPP}
{$R-,T-,H+,X+}

interface

uses Winapi.Windows, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Graphics, Winapi.Messages,
  Winapi.MMSystem, Vcl.Dialogs, System.SysUtils;
  
type
  TMPBtnType = (btPlay, btPause, btStop, btNext, btPrev, btStep, btBack,
    btRecord, btEject);
  TButtonSet = set of TMPBtnType;

  TMPGlyph = (mgEnabled, mgDisabled, mgColored);
  TMPButton = record
    Visible: Boolean;
    Enabled: Boolean;
    Colored: Boolean;
    Auto: Boolean;
    Bitmaps: array[TMPGlyph] of TBitmap;
  end;

  TMPDeviceTypes = (dtAutoSelect, dtAVIVideo, dtCDAudio, dtDAT, dtDigitalVideo, dtMMMovie,
    dtOther, dtOverlay, dtScanner, dtSequencer, dtVCR, dtVideodisc, dtWaveAudio);
  TMPTimeFormats = (tfMilliseconds, tfHMS, tfMSF, tfFrames, tfSMPTE24, tfSMPTE25,
    tfSMPTE30, tfSMPTE30Drop, tfBytes, tfSamples, tfTMSF);
  TMPModes = (mpNotReady, mpStopped, mpPlaying, mpRecording, mpSeeking,
    mpPaused, mpOpen);
  TMPNotifyValues = (nvSuccessful, nvSuperseded, nvAborted, nvFailure);
    
  TMPDevCaps = (mpCanStep, mpCanEject, mpCanPlay, mpCanRecord, mpUsesWindow);
  TMPDevCapsSet = set of TMPDevCaps;
  
  EMPNotify = procedure (Sender: TObject; Button: TMPBtnType;
    var DoDefault: Boolean) of object;
  EMPPostNotify = procedure (Sender: TObject; Button: TMPBtnType) of object;

  EMCIDeviceError = class(Exception);

{$IF DEFINED(CLR)}
  TMediaDevice = class
  private
    FID: Word;
  strict protected
    procedure Finalize; override;
  end;
{$ELSE}
  TMediaDevice = Word;
{$ENDIF}

  TMediaPlayer = class(TCustomControl)
  private
    Buttons: array[TMPBtnType] of TMPButton;
    FVisibleButtons: TButtonSet;
    FEnabledButtons: TButtonSet;
    FColoredButtons: TButtonSet;
    FAutoButtons: TButtonSet;
    Pressed: Boolean;
    Down: Boolean;
    CurrentButton: TMPBtnType;
    CurrentRect: TRect;
    ButtonWidth: Integer;
    MinBtnSize: TPoint;
    FOnClick: EMPNotify;
    FOnPostClick: EMPPostNotify;
    FOnNotify: TNotifyEvent;
    FocusedButton: TMPBtnType;
    MCIOpened: Boolean;
    FCapabilities: TMPDevCapsSet;
    FCanPlay: Boolean;
    FCanStep: Boolean;
    FCanEject: Boolean;
    FCanRecord: Boolean;
    FHasVideo: Boolean;
    FFlags: Longint;
    FWait: Boolean;
    FNotify: Boolean;
    FUseWait: Boolean;
    FUseNotify: Boolean;
    FUseFrom: Boolean;
    FUseTo: Boolean;
    FDeviceID: TMediaDevice;
    FDeviceType: TMPDeviceTypes;
    FTo: Longint;
    FFrom: Longint;
    FFrames: Longint;
    FError: Longint;
    FNotifyValue: TMPNotifyValues;
    FDisplay: TWinControl;
    FDWidth: Integer;
    FDHeight: Integer;
    FElementName: string;
    FAutoEnable: Boolean;
    FAutoOpen: Boolean;
    FAutoRewind: Boolean;
    FShareable: Boolean;
    procedure LoadBitmaps;
    procedure DestroyBitmaps;
    procedure SetEnabledButtons(Value: TButtonSet);
    procedure SetColored(Value: TButtonSet);
    procedure SetVisible(Value: TButtonSet);
    procedure SetAutoEnable(Value: Boolean);
    procedure DrawAutoButtons;
    procedure DoMouseDown(XPos, YPos: Integer);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LButtonDown;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LButtonDblClk;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MouseMove;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LButtonUp;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    function VisibleButtonCount: Integer;
    procedure Adjust;
    procedure DoClick(Button: TMPBtnType);
    procedure DoPostClick(Button: TMPBtnType);
    procedure DrawButton(Btn: TMPBtnType; X: Integer; DPI: Integer = 0);
    procedure CheckIfOpen;
    procedure SetPosition(Value: Longint);
    procedure SetDeviceType( Value: TMPDeviceTypes );
    procedure SetWait( Flag: Boolean );
    procedure SetNotify( Flag: Boolean );
    procedure SetFrom( Value: Longint );
    procedure SetTo( Value: Longint );
    procedure SetTimeFormat( Value: TMPTimeFormats );
    procedure SetDisplay( Value: TWinControl );
    procedure SetOrigDisplay;
    procedure SetDisplayRect( Value: TRect );
    function GetDisplayRect: TRect;
    procedure GetDeviceCaps;
    function GetDeviceID: Word;
    function GetFileName: string;
    function GetStart: Longint;
    function GetLength: Longint;
    function GetMode: TMPModes;
    function GetTracks: Longint;
    function GetPosition: Longint;
    function GetErrorMessage: string;
    function GetTimeFormat: TMPTimeFormats;
    function GetTrackLength(TrackNum: Integer): Longint;
    function GetTrackPosition(TrackNum: Integer): Longint;
    procedure SetFileName(Value: string);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure AutoButtonSet(Btn: TMPBtnType); dynamic;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    procedure MMNotify(var Message: TMessage); message MM_MCINOTIFY;
    procedure Click(Button: TMPBtnType; var DoDefault: Boolean); reintroduce; dynamic;
    procedure PostClick(Button: TMPBtnType); dynamic;
    procedure DoNotify; dynamic;
    procedure Updated; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure Play;
    procedure Stop;
    procedure Pause; {Pause & Resume/Play}
    procedure Step;
    procedure Back;
    procedure Previous;
    procedure Next;
    procedure StartRecording;
    procedure Eject;
    procedure Save;
    procedure PauseOnly;
    procedure Resume;
    procedure Rewind;
    property TrackLength[TrackNum: Integer]: Longint read GetTrackLength;
    property TrackPosition[TrackNum: Integer]: Longint read GetTrackPosition;
    property Capabilities: TMPDevCapsSet read FCapabilities;
    property Error: Longint read FError;
    property ErrorMessage: string read GetErrorMessage;
    property Start: Longint read GetStart;
    property Length: Longint read GetLength;
    property Tracks: Longint read GetTracks;
    property Frames: Longint read FFrames write FFrames;
    property Mode: TMPModes read GetMode;
    property Position: Longint read GetPosition write SetPosition;
    property Wait: Boolean read FWait write SetWait;
    property Notify: Boolean read FNotify write SetNotify;
    property NotifyValue: TMPNotifyValues read FNotifyValue;
    property StartPos: Longint read FFrom write SetFrom;
    property EndPos: Longint read FTo write SetTo;
    property DeviceID: Word read GetDeviceID;
    property TimeFormat: TMPTimeFormats read GetTimeFormat write SetTimeFormat;
    property DisplayRect: TRect read GetDisplayRect write SetDisplayRect;
  published
    property Align;
    property ColoredButtons: TButtonSet read FColoredButtons write SetColored
      default [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack,
               btRecord, btEject];
    property Enabled;
    property EnabledButtons: TButtonSet read FEnabledButtons write SetEnabledButtons
      default [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack,
               btRecord, btEject];
    property VisibleButtons: TButtonSet read FVisibleButtons write SetVisible
      default [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack,
               btRecord, btEject];
    property Anchors;
    property AutoEnable: Boolean read FAutoEnable write SetAutoEnable default True;
    property AutoOpen: Boolean read FAutoOpen write FAutoOpen default False;
    property AutoRewind: Boolean read FAutoRewind write FAutoRewind default True;
    property Constraints;
    property DeviceType: TMPDeviceTypes read FDeviceType write SetDeviceType default dtAutoSelect;
    property DoubleBuffered;
    property DoubleBufferedMode;
    property Display: TWinControl read FDisplay write SetDisplay;
    property FileName: string read GetFileName write SetFileName;
    property Shareable: Boolean read FShareable write FShareable default False;
    property StyleName;
    property Visible;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu;
    property TabOrder;
    property TabStop default True;
    property OnClick: EMPNotify read FOnClick write FOnClick;
    property OnContextPopup;
    property OnEnter;
    property OnExit;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPostClick: EMPPostNotify read FOnPostClick write FOnPostClick;
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;
  end;

implementation

uses
{$IF DEFINED(CLR)}
  Types, System.Runtime.InteropServices, System.Text, System.Reflection,
  System.Security.Permissions,
{$ENDIF}
  System.Types, Vcl.Consts, Vcl.Themes;

{$IF DEFINED(CLR)}
{$R Borland.Vcl.MPlayer.resources}
{$ELSE}
{$R MPlayer.res}
{$ENDIF}

const
  mci_Back     = $0899;  { mci_Step reverse }
{$IF DEFINED(CLR)}
  ResourceBaseName = 'Borland.Vcl.MPlayer'; { Do not localize }

  BtnStateName: array[TMPGlyph] of string = ('EN', 'DI', 'CL');
  BtnTypeName: array[TMPBtnType] of string = ('MPPLAY', 'MPPAUSE', 'MPSTOP',
    'MPNEXT', 'MPPREV', 'MPSTEP', 'MPBACK', 'MPRECORD', 'MPEJECT');
{$ELSE}
  BtnStateName: array[TMPGlyph] of PChar = ('EN', 'DI', 'CL');
  BtnTypeName: array[TMPBtnType] of PChar = ('MPPLAY', 'MPPAUSE', 'MPSTOP',
    'MPNEXT', 'MPPREV', 'MPSTEP', 'MPBACK', 'MPRECORD', 'MPEJECT');
{$ENDIF}

constructor TMediaPlayer.Create(AOwner: TComponent);
var
  I: TMPBtnType;
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque, csOverrideStylePaint];
  LoadBitmaps;
  FVisibleButtons := [btPlay, btPause, btStop, btNext, btPrev, btStep,
    btBack, btRecord, btEject];
  FEnabledButtons := [btPlay, btPause, btStop, btNext, btPrev, btStep,
    btBack, btRecord, btEject];
  FColoredButtons := [btPlay, btPause, btStop, btNext, btPrev, btStep,
    btBack, btRecord, btEject];
  for I := Low(Buttons) to High(Buttons) do
  begin
    Buttons[I].Visible := True;
    Buttons[I].Enabled := True;
    Buttons[I].Colored := True;
    Buttons[I].Auto := False; {enabled/disabled dynamically}
  end;
  Width := 240;
  Height := 30;
  FocusedButton := btPlay;
  FAutoEnable := True;
  FAutoOpen := False;
  FAutoRewind := True;
  FDeviceType := dtAutoSelect; {select through file name extension}
  TabStop := True;
end;

{$IF DEFINED(CLR)}
procedure TMediaDevice.Finalize;
var
  GenParm: TMCI_Generic_Parms;
begin
  if FID <> 0 then
    mciSendCommand(FID, mci_Close, mci_Wait, GenParm);
  FID := 0;
end;
{$ENDIF}

destructor TMediaPlayer.Destroy;
var
  GenParm: TMCI_Generic_Parms;
begin
{$IF DEFINED(CLR)}
  if DeviceID <> 0 then
  begin
    mciSendCommand( DeviceID, mci_Close, mci_Wait, GenParm);
    FDeviceID.FID := 0;
  end;
  if (Assigned(FDeviceID)) then
  begin
    System.GC.SuppressFinalize(FDeviceID);
    FreeAndNil(FDeviceID);
  end;
{$ELSE}
  if FDeviceID <> 0 then
    mciSendCommand( FDeviceID, mci_Close, mci_Wait, UIntPtr(@GenParm));
{$ENDIF}
  DestroyBitmaps;
  inherited Destroy;
end;

procedure TMediaPlayer.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TMediaPlayer.Loaded;
begin
  inherited Loaded;
  if (not (csDesigning in ComponentState)) and FAutoOpen then
    Open;
end;

{$IFDEF CLR}[SecurityPermission(SecurityAction.Assert, UnmanagedCode=True)]{$ENDIF}
procedure TMediaPlayer.LoadBitmaps;
var
  I: TMPBtnType;
  J: TMPGlyph;
{$IF DEFINED(CLR)}
  ResName: string;
{$ELSE}
  ResName: array[0..40] of Char;
{$ENDIF}
begin
  MinBtnSize := Point(0, 0);
  for I := Low(Buttons) to High(Buttons) do
  begin
    for J := Low(TMPGlyph) to High(TMPGlyph) do
    begin
      Buttons[I].Bitmaps[J] := TBitmap.Create;
{$IF DEFINED(CLR)}
      ResName := Format('%s_%s', [BtnStateName[J], BtnTypeName[I]]); { Do not localize }
      Buttons[I].Bitmaps[J].LoadFromResourceName(ResName,
        ResourceBaseName, Assembly.GetExecutingAssembly);
{$ELSE}
      Buttons[I].Bitmaps[J].Handle := LoadBitmap(HInstance,
        StrFmt(ResName, '%s_%s', [BtnStateName[J], BtnTypeName[I]]));
{$ENDIF}
      if MinBtnSize.X < Buttons[I].Bitmaps[J].Width then
        MinBtnSize.X := Buttons[I].Bitmaps[J].Width;
      if MinBtnSize.Y < Buttons[I].Bitmaps[J].Height then
        MinBtnSize.Y := Buttons[I].Bitmaps[J].Height;
      Buttons[I].Bitmaps[J].Transparent := True;
    end;
  end;
  Inc(MinBtnSize.X, 2 * 4);
  Inc(MinBtnSize.Y, 2 * 2);
end;

procedure TMediaPlayer.DestroyBitmaps;
var
  I: TMPBtnType;
  J: TMPGlyph;
begin
  for I := Low(Buttons) to High(Buttons) do
    for J := Low(TMPGlyph) to High(TMPGlyph) do
      Buttons[I].Bitmaps[J].Free;
end;


procedure TMediaPlayer.SetAutoEnable(Value: Boolean);
begin
  if Value <> FAutoEnable then
  begin
    FAutoEnable := Value;
    if FAutoEnable then
      DrawAutoButtons  {paint buttons based on current state of device}
    else
      SetEnabledButtons(FEnabledButtons);  {paint buttons based on Enabled}
  end;
end;

procedure TMediaPlayer.SetEnabledButtons(Value: TButtonSet);
var
  I: TMPBtnType;
begin
  FEnabledButtons := Value;
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Enabled := I in FEnabledButtons;
  Invalidate;
end;

procedure TMediaPlayer.DrawAutoButtons;
var
  I: TMPBtnType;
begin
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Auto := I in FAutoButtons;
  Invalidate;
end;

procedure TMediaPlayer.SetColored(Value: TButtonSet);
var
  I: TMPBtnType;
begin
  FColoredButtons := Value;
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Colored := I in FColoredButtons;
  Invalidate;
end;

procedure TMediaPlayer.SetVisible(Value: TButtonSet);
var
  I: TMPBtnType;
begin
  FVisibleButtons := Value;
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Visible := I in FVisibleButtons;
  if csUpdating in ComponentState then
  begin
    ButtonWidth := ((Width - 1) div VisibleButtonCount) + 1;
    Invalidate;
  end
  else Adjust;
end;

function TMediaPlayer.VisibleButtonCount: Integer;
var
  I: TMPBtnType;
begin
  Result := 0;
  for I := Low(Buttons) to High(Buttons) do
    if Buttons[I].Visible then Inc(Result);
  if Result = 0 then Inc(Result);
end;

procedure TMediaPlayer.Adjust;
var
  Count: Integer;
begin
  Count := VisibleButtonCount;
  Width := Count * (ButtonWidth - 1) + 1;
  Invalidate;
end;

procedure TMediaPlayer.WMSize(var Message: TWMSize);
var
  Count: Integer;
  MinSize: TPoint;
  W, H: Integer;
begin
  inherited;
  if not (csUpdating in ComponentState) then
  begin
    { check for minimum size }
    Count := VisibleButtonCount;
    MinSize.X := Count * (MinBtnSize.X - 1) + 1;
    MinSize.Y := MinBtnSize.Y;
    ButtonWidth := ((Width - 1) div Count) + 1;

    W := Count * (ButtonWidth - 1) + 1;
    if W < MinSize.X then W := MinSize.X;
    if Height < MinSize.Y then H := MinSize.Y
    else H := Height;

    if (W <> Width) or (H <> Height) then
      SetBounds(Left, Top, W, H);

    Message.Result := 0;
  end;
end;

procedure TMediaPlayer.DrawButton(Btn: TMPBtnType; X: Integer; DPI: Integer = 0);
const
  NormalButtons: array[TMPBtnType] of TThemedMPlayerButtons = (tmpbPlayNormal,
    tmpbPauseNormal, tmpbStopNormal, tmpbNextNormal, tmpbPrevNormal,
    tmpbStepNormal, tmpbBackNormal, tmpbRecordNormal, tmpbEjectNormal);
  HotButtons: array[TMPBtnType] of TThemedMPlayerButtons = (tmpbPlayHot,
    tmpbPauseHot, tmpbStopHot, tmpbNextHot, tmpbPrevHot,
    tmpbStepHot, tmpbBackHot, tmpbRecordHot, tmpbEjectHot);
  PressedButtons: array[TMPBtnType] of TThemedMPlayerButtons = (tmpbPlayPressed,
    tmpbPausePressed, tmpbStopPressed, tmpbNextPressed, tmpbPrevPressed,
    tmpbStepPressed, tmpbBackPressed, tmpbRecordPressed, tmpbEjectPressed);
  DisabledButtons: array[TMPBtnType] of TThemedMPlayerButtons = (tmpbPlayDisabled,
    tmpbPauseDisabled, tmpbStopDisabled, tmpbNextDisabled, tmpbPrevDisabled,
    tmpbStepDisabled, tmpbBackDisabled, tmpbRecordDisabled, tmpbEjectDisabled);

var
  IsDown, IsFocused: Boolean;
  BX, BY: Integer;
  TheGlyph: TMPGlyph;
  Bitmap: TBitmap;
  R: TRect;
  Details: TThemedElementDetails;
  LButton: TThemedMPlayerButtons;
  IsStyleButtonAvailable: Boolean;
  LStyle: TCustomStyleServices;
begin
  IsDown := Down and (Btn = CurrentButton);
  IsFocused := (GetFocus = Handle) and (Btn = FocusedButton);
  IsStyleButtonAvailable := False;
  with Canvas do
  begin
    LStyle := StyleServices(Self);
    if LStyle.Enabled then
    begin
      R := Rect(X, 0, X + ButtonWidth, Height);
      if IsDown then
        Details := LStyle.GetElementDetails(tbPushButtonPressed)
      else
        if IsFocused
        then
          Details := LStyle.GetElementDetails(tbPushButtonDefaulted)
        else
          if Enabled then
            Details := LStyle.GetElementDetails(tbPushButtonNormal)
          else
            Details := LStyle.GetElementDetails(tbPushButtonDisabled);
      Brush.Style := bsSolid;
      Brush.Color := LStyle.GetSystemColor(clBtnFace);
      FillRect(R);
      if not (csDesigning in ComponentState) and TStyleManager.IsCustomStyleActive then InflateRect(R, -1, -1);
      LStyle.DrawElement(Handle, Details, R);

      {check and draw glyph from style}
      if not (csDesigning in ComponentState) and TStyleManager.IsCustomStyleActive then
      begin
        if Enabled then
        begin  {Enabled only affects buttons at runtime}
          if FAutoEnable then
          begin  {AutoEnable only affects buttons at runtime}
            if Buttons[Btn].Auto then {is button available, based on device state}
            begin
              if IsDown then
               LButton := PressedButtons[Btn]
              else
                if IsFocused then
                  LButton := HotButtons[Btn]
                else
                  LButton := NormalButtons[Btn];
            end
            else
              LButton := DisabledButtons[Btn]; {button is not available}
          end
          else  {when not AutoEnabled or at design-time, check Enabled}
            begin
              if Buttons[Btn].Enabled then
              begin
                if IsDown then
                  LButton := PressedButtons[Btn]
                else
                  if IsFocused then
                    LButton := HotButtons[Btn]
                  else
                    LButton := NormalButtons[Btn];
              end
              else
                LButton := DisabledButtons[Btn];
            end;
        end
        else
          LButton := DisabledButtons[Btn]; {main switch set to disabled}

        IsStyleButtonAvailable := LStyle.DrawElement(Canvas.Handle,
          LStyle.GetElementDetails(LButton), R, nil, DPI);
      end;
    end
    else
    begin
      Brush.Style := bsSolid;
      Brush.Color := clBtnFace;
      Pen.Color := clWindowFrame;
      Pen.Width := 1;
      Rectangle(X, 0, X + ButtonWidth, Height);
      { draw button beveling }
      if IsDown then
      begin
        Pen.Color := clBtnShadow;
        MoveTo(X + 1, Height - 2);
        LineTo(X + 1, 1);
        LineTo(X + ButtonWidth - 1, 1);
      end
      else
      begin
        Pen.Color := clBtnHighlight;
        MoveTo(X + 1, Height - 2);
        LineTo(X + 1, 1);
        LineTo(X + ButtonWidth - 1, 1);
        Pen.Color := clBtnShadow;
        MoveTo(X + 2, Height - 2);
        LineTo(X + ButtonWidth - 2, Height - 2);
        LineTo(X + ButtonWidth - 2, 1);
      end;
    end;
    {which bitmap logic - based on Enabled, Colored, and AutoEnable}
    if not IsStyleButtonAvailable then
    begin
      if Enabled or (csDesigning in ComponentState) then
      begin  {Enabled only affects buttons at runtime}
        if FAutoEnable and not (csDesigning in ComponentState) then
        begin  {AutoEnable only affects buttons at runtime}
          if Buttons[Btn].Auto then {is button available, based on device state}
          begin
            TheGlyph := mgEnabled;
            if Buttons[Btn].Colored then
             TheGlyph := mgColored;
          end
          else TheGlyph := mgDisabled;  {button is not available}
        end
        else  {when not AutoEnabled or at design-time, check Enabled}
        begin
          if Buttons[Btn].Enabled then
          begin
            TheGlyph := mgEnabled;
            if Buttons[Btn].Colored then
              TheGlyph := mgColored;
          end
         else TheGlyph := mgDisabled;
        end;
      end
      else TheGlyph := mgDisabled; {main switch set to disabled}

      Bitmap := Buttons[Btn].Bitmaps[TheGlyph];
      BX := (ButtonWidth div 2) - (Bitmap.Width div 2);
      BY := (Height div 2) - (Bitmap.Height div 2);
      if IsDown then
      begin
        Inc(BX);
        Inc(BY);
      end;
      Canvas.Draw(X + BX, BY, Bitmap);
    end;
  end;

  if not IsCustomStyleActive and IsFocused then
  begin
    R := Bounds(X, 0, ButtonWidth, Height);
    InflateRect(R, -3, -3);
    if IsDown then OffsetRect(R, 1, 1);
    DrawFocusRect(Canvas.Handle, R);
  end;
end;

procedure TMediaPlayer.Paint;
var
  X: Integer;
  I: TMPBtnType;
  LPPI: Integer;
  LStyle: TCustomStyleServices;
begin
  LStyle := StyleServices(Self);
  if LStyle.Enabled and not DoubleBuffered then
    DoubleBuffered := True;

  LPPI := CurrentPPI;
  with Canvas do
  begin
    Brush.Style := bsClear;
    if LStyle.Enabled then
    begin
      Pen.Color := LStyle.GetSystemColor(clBtnFace);
    end
    else
      Pen.Color := clWindowFrame;

    Pen.Width := 1;
    Rectangle(0, 0, Width, Height);

    X := 0;
    for I := Low(Buttons) to High(Buttons) do
    begin
      if Buttons[I].Visible then
      begin
        DrawButton(I, X, LPPI);
        Inc(X, ButtonWidth - 1);
      end;
    end;
  end;
end;

{AutoEnable=True, enable/disable button set based on button passed (pressed)}
procedure TMediaPlayer.AutoButtonSet(Btn: TMPBtnType);
begin
  case Btn of
    btPlay:
    begin
      FAutoButtons := FAutoButtons - [btPlay,btRecord];
      FAutoButtons := FAutoButtons + [btStop,btPause];
    end;
    btPause:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
    end;
    btStop:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
    btNext:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
    btPrev:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
    btStep:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
    btBack:
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
    btRecord:
    begin
      FAutoButtons := FAutoButtons - [btPlay,btRecord];
      FAutoButtons := FAutoButtons + [btStop,btPause];
    end;
    btEject: {without polling no way to determine when CD is inserted}
    begin
      if FCanPlay then Include(FAutoButtons,btPlay);
      if FCanRecord then Include(FAutoButtons,btRecord);
      FAutoButtons := FAutoButtons - [btStop,btPause];
    end;
  end;
end;
      
procedure TMediaPlayer.DoMouseDown(XPos, YPos: Integer);
var
  I: TMPBtnType;
  X: Integer;
  FoundButton: Boolean;
begin
  {which button was clicked}
  X := 0;
  FoundButton := False;
  for I := Low(Buttons) to High(Buttons) do
  begin
    if Buttons[I].Visible then
    begin
      if (XPos >= X) and (XPos <= X + ButtonWidth) then
      begin
        if (FAutoEnable and Buttons[I].Auto) or (Buttons[I].Enabled) then
        begin
          CurrentButton := I;
          FoundButton := True;
          Break;
        end
        else
          Exit;
      end;
      Inc(X, ButtonWidth - 1);
    end;
  end;
  if FoundButton then
  begin
    if CurrentButton <> FocusedButton then
    begin
      FocusedButton := CurrentButton;
      Paint;
    end;
    CurrentRect := Rect(X, 0, X + ButtonWidth, Height);
    Pressed := True;
    Down := True;
    DrawButton(I, X, CurrentPPI);
    MouseCapture := True;
  end;
end;

procedure TMediaPlayer.WMLButtonDown(var Message: TWMLButtonDown);
begin
  DoMouseDown(Message.XPos, Message.YPos);
end;

procedure TMediaPlayer.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  DoMouseDown(Message.XPos, Message.YPos);
end;

procedure TMediaPlayer.WMMouseMove(var Message: TWMMouseMove);
var
  P: TPoint;
begin
  if Pressed then
  begin
    P := Point(Message.XPos, Message.YPos);
    if CurrentRect.Contains(P) <> Down then
    begin
      Down := not Down;
      DrawButton(CurrentButton, CurrentRect.Left, CurrentPPI);
    end;
  end;
end;

procedure TMediaPlayer.DoClick(Button: TMPBtnType);
var
  DoDefault: Boolean;
begin
  DoDefault := True;
  Click(CurrentButton, DoDefault);
  if DoDefault then
  begin
    case CurrentButton of
      btPlay: Play;
      btPause: Pause;
      btStop: Stop;
      btNext: Next;
      btPrev: Previous;
      btStep: Step;
      btBack: Back;
      btRecord: StartRecording;
      btEject: Eject;
    end;
    DoPostClick(CurrentButton);
  end;
end;

procedure TMediaPlayer.DoPostClick(Button: TMPBtnType);
begin
  PostClick(CurrentButton);
end;

procedure TMediaPlayer.WMLButtonUp(var Message: TWMLButtonUp);
begin
  MouseCapture := False;
  if Pressed and Down then
  begin
    Down := False;
    DrawButton(CurrentButton, CurrentRect.Left, CurrentPPI);  {raise button before calling code}
    DoClick(CurrentButton);
    if FAutoEnable and (FError = 0) and MCIOpened then
    begin
      AutoButtonSet(CurrentButton);
      DrawAutoButtons;
    end;
  end;
  Pressed := False;
end;

procedure TMediaPlayer.WMSetFocus(var Message: TWMSetFocus);
begin
  Paint;
end;

procedure TMediaPlayer.WMKillFocus(var Message: TWMKillFocus);
begin
  Paint;
end;

procedure TMediaPlayer.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TMediaPlayer.KeyDown(var Key: Word; Shift: TShiftState);
var
  NewFocus: TMPBtnType;
begin
  case Key of
    VK_RIGHT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus < High(Buttons) then
            NewFocus := Succ(NewFocus);
        until (NewFocus = High(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Invalidate;
        end;
      end;
    VK_LEFT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus > Low(Buttons) then
            NewFocus := Pred(NewFocus);
        until (NewFocus = Low(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Invalidate;
        end;
      end;
    VK_SPACE:
      begin
        if Buttons[FocusedButton].Enabled then
        begin
          CurrentButton := FocusedButton;
          DoClick(CurrentButton);
          if FAutoEnable then
          begin
            AutoButtonSet(CurrentButton);
            DrawAutoButtons;
          end;
        end;
      end;
  end;
end;

{MCI message generated when Notify=True, and MCI command completes}
procedure TMediaPlayer.MMNotify(var Message: TMessage);
begin
  if FAutoEnable and (Mode = mpStopped) then
  begin {special AutoEnable case for when Play and Record finish}
    if FCanPlay then Include(FAutoButtons,btPlay);
    if FCanRecord then Include(FAutoButtons,btRecord);
    FAutoButtons := FAutoButtons - [btStop,btPause];
    DrawAutoButtons;
  end;
{$IF DEFINED(CLR)}
  case Message.WParam.ToInt64 of
{$ELSE}
  case Message.WParam of
{$ENDIF}
    mci_Notify_Successful: FNotifyValue := nvSuccessful;
    mci_Notify_Superseded: FNotifyValue := nvSuperseded;
    mci_Notify_Aborted: FNotifyValue := nvAborted;
    mci_Notify_Failure: FNotifyValue := nvFailure;
  end;
  DoNotify;
end;

{for MCI Commands to make sure device is open, else raise exception}
procedure TMediaPlayer.CheckIfOpen;
begin
  if not MCIOpened then 
    raise EMCIDeviceError.CreateRes({$IFNDEF CLR}@{$ENDIF}SNotOpenErr);
end;

procedure TMediaPlayer.Click(Button: TMPBtnType; var DoDefault: Boolean);
begin
  if Assigned(FOnCLick) then FOnClick(Self, Button, DoDefault);
end;

procedure TMediaPlayer.PostClick(Button: TMPBtnType);
begin
  if Assigned(FOnPostCLick) then FOnPostClick(Self, Button);
end;

procedure TMediaPlayer.DoNotify;
begin
  if Assigned(FOnNotify) then FOnNotify(Self);
end;

procedure TMediaPlayer.Updated;
begin
  inherited;
  Adjust;
end;

function TMediaPlayer.GetDeviceID: Word;
begin
{$IF DEFINED(CLR)}
  if Assigned(FDeviceID) then
    Result := FDeviceID.FID
  else
    Result := 0;
{$ELSE}
  Result := FDeviceID;
{$ENDIF}
end;

{***** MCI Commands *****}

{$IF DEFINED(CLR)}
const
  DeviceName: array[TMPDeviceTypes] of string = ('', 'AVIVideo', 'CDAudio', 'DAT',
    'DigitalVideo', 'MMMovie', 'Other', 'Overlay', 'Scanner', 'Sequencer',
    'VCR', 'Videodisc', 'WaveAudio');
{$ENDIF}

procedure TMediaPlayer.Open;
{$IF NOT DEFINED(CLR)}
const
  DeviceName: array[TMPDeviceTypes] of PChar = ('', 'AVIVideo', 'CDAudio', 'DAT',
    'DigitalVideo', 'MMMovie', 'Other', 'Overlay', 'Scanner', 'Sequencer',
    'VCR', 'Videodisc', 'WaveAudio');
{$ENDIF}
var
  OpenParm: TMCI_Open_Parms;
  DisplayR: TRect;
begin
  { zero out memory }
{$IF NOT DEFINED(CLR)}
  FillChar(OpenParm, SizeOf(TMCI_Open_Parms), 0);
{$ENDIF}
  if MCIOpened then Close; {must close MCI Device first before opening another}

  OpenParm.dwCallback := 0;
  OpenParm.lpstrDeviceType := DeviceName[FDeviceType];
{$IF DEFINED(CLR)}
  OpenParm.lpstrElementName := FElementName;
{$ELSE}
  OpenParm.lpstrElementName := PChar(FElementName);
{$ENDIF}

  FFlags := 0;

  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else
    FFlags := mci_Wait;

  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;

  if FDeviceType <> dtAutoSelect then
    FFlags := FFlags or mci_Open_Type
  else
    FFlags := FFlags or MCI_OPEN_ELEMENT;

  if FElementName <> '' then
    FFlags := FFlags or MCI_OPEN_ELEMENT;

  if FShareable then
    FFlags := FFlags or mci_Open_Shareable;
  OpenParm.dwCallback := Handle;

{$IF DEFINED(CLR)}
  FError := mciSendCommand(0, mci_Open, FFlags, OpenParm);
{$ELSE}
  FError := mciSendCommand(0, mci_Open, FFlags, UIntPtr(@OpenParm));
{$ENDIF}

  if FError <> 0 then {problem opening device}
    raise EMCIDeviceError.Create(ErrorMessage)
  else {device successfully opened}
  begin
    MCIOpened := True;
{$IF DEFINED(CLR)}
    if not Assigned(FDeviceID) then
      FDeviceID := TMediaDevice.Create;
    FDeviceID.FID := OpenParm.wDeviceID;
{$ELSE}
    FDeviceID := OpenParm.wDeviceID;
{$ENDIF}
    FFrames := Length div 10;  {default frames to step = 10% of total frames}
    GetDeviceCaps; {must first get device capabilities}
    if FHasVideo then {used for video output positioning}
    begin
      Display := FDisplay; {if one was set in design mode}
      DisplayR := GetDisplayRect;
      FDWidth := DisplayR.Right-DisplayR.Left;
      FDHeight := DisplayR.Bottom-DisplayR.Top;
    end;
    if (FDeviceType = dtCDAudio) or (FDeviceType = dtVideodisc) then
      TimeFormat := tfTMSF; {set timeformat to use tracks}
    
    FAutoButtons := [btNext,btPrev]; {assumed all devices can seek to start, end}
    if FCanStep then FAutoButtons := FAutoButtons + [btStep,btBack];
    if FCanPlay then Include(FAutoButtons, btPlay);
    if FCanRecord then Include(FAutoButtons, btRecord);
    if FCanEject then Include(FAutoButtons, btEject);
    if Mode = mpPlaying then AutoButtonSet(btPlay); {e.g. CD device}
    DrawAutoButtons;
  end;
    
end;

procedure TMediaPlayer.Close;
var
  GenParm: TMCI_Generic_Parms;
begin
  if DeviceID <> 0 then
  begin
    FFlags := 0;
    if FUseWait then
    begin
      if FWait then FFlags := mci_Wait;
      FUseWait := False;
    end
    else FFlags := mci_Wait;
    if FUseNotify then
    begin
      if FNotify then FFlags := FFlags or mci_Notify;
      FUseNotify := False;
    end;
    GenParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Close, FFlags, GenParm);
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Close, FFlags, UIntPtr(@GenParm));
{$ENDIF}
    if FError = 0 then
    begin
      MCIOpened := False;
{$IF DEFINED(CLR)}
      FDeviceID.FID := 0;
{$ELSE}
      FDeviceID := 0;
{$ENDIF}
      FAutoButtons := [];
      DrawAutoButtons;
    end;
  end; {if DeviceID <> 0}
end;

procedure TMediaPlayer.Play;
var
  PlayParm: TMCI_Play_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  {if at the end of media, and not using StartPos or EndPos - go to start}
  if FAutoRewind and (Position = Length) then
    if not FUseFrom and not FUseTo then Rewind;

  FFlags := 0;
  if FUseNotify then
  begin
    if FNotify then FFlags := mci_Notify;
    FUseNotify := False;
  end else FFlags := mci_Notify;
  if FUseWait then
  begin
    if FWait then FFlags := FFlags or mci_Wait;
    FUseWait := False;
  end;
  if FUseFrom then
  begin
    FFlags := FFlags or mci_From;
    PlayParm.dwFrom := FFrom;
    FUseFrom := False; {only applies to this mciSendCommand}
  end;
  if FUseTo then
  begin
    FFlags := FFlags or mci_To;
    PlayParm.dwTo := FTo;
    FUseTo := False; {only applies to this mciSendCommand}
  end;
  PlayParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Play, FFlags, PlayParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Play, FFlags, UIntPtr(@PlayParm));
{$ENDIF}
end;

procedure TMediaPlayer.StartRecording;
var
  RecordParm: TMCI_Record_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseNotify then
  begin
    if FNotify then FFlags := mci_Notify;
    FUseNotify := False;
  end
  else FFlags := mci_Notify;
  if FUseWait then
  begin
    if FWait then FFlags := FFlags or mci_Wait;
    FUseWait := False;
  end;

  if FUseFrom then
  begin
    FFlags := FFlags or mci_From;
    RecordParm.dwFrom := FFrom;
    FUseFrom := False;
  end;
  if FUseTo then
  begin
    FFlags := FFlags or mci_To;
    RecordParm.dwTo := FTo;
    FUseTo := False;
  end;
  RecordParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand(DeviceID, mci_Record, FFlags, RecordParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Record, FFlags, UIntPtr(@RecordParm));
{$ENDIF}
end;

procedure TMediaPlayer.Stop;
var
  GenParm: TMCI_Generic_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else FFlags := mci_Wait;
  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;
  GenParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Stop, FFlags, GenParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Stop, FFlags, UIntPtr(@GenParm));
{$ENDIF}
end;

procedure TMediaPlayer.Pause;
begin
  if not MCIOpened then Raise EMCIDeviceError.CreateRes({$IFNDEF CLR}@{$ENDIF}SNotOpenErr);
  if Mode = mpPlaying then PauseOnly
  else
   if Mode = mpPaused then Resume;
end;

procedure TMediaPlayer.PauseOnly;
var
  GenParm: TMCI_Generic_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else FFlags := mci_Wait;
  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;
  GenParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Pause, FFlags, GenParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Pause, FFlags, UIntPtr(@GenParm));
{$ENDIF}
end;

procedure TMediaPlayer.Resume;
var
  GenParm: TMCI_Generic_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseNotify then
  begin
    if FNotify then FFlags := mci_Notify;
  end
  else FFlags := mci_Notify;
  if FUseWait then
  begin
    if FWait then FFlags := FFlags or mci_Wait;
  end;
  GenParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Resume, FFlags, GenParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Resume, FFlags, UIntPtr(@GenParm));
{$ENDIF}

  {if error calling resume (resume not supported),  call Play}
  if FError <> 0 then
    Play {FUseNotify & FUseWait reset by Play}
  else
  begin
    if FUseNotify then
      FUseNotify := False;
    if FUseWait then
      FUseWait := False;
  end;
end;

procedure TMediaPlayer.Next;
var
  SeekParm: TMCI_Seek_Parms;
  TempFlags: Longint;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else FFlags := mci_Wait;
  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;

  TempFlags := FFlags; {preserve FFlags from GetTimeFormat & GetPosition}
  if TimeFormat = tfTMSF then {using Tracks}
  begin
    if Mode = mpPlaying then
    begin
      if mci_TMSF_Track(Position) = Tracks then {if at last track}
         StartPos := GetTrackPosition(Tracks) {go to beg of last}
      else {go to next track}
         StartPos := GetTrackPosition((mci_TMSF_Track(Position))+1);
      Play;
      CurrentButton := btPlay;
      Exit;
    end
    else
    begin
      if mci_TMSF_Track(Position) = Tracks then {if at last track}
         SeekParm.dwTo := GetTrackPosition(Tracks) {go to beg of last}
      else {go to next track}
         SeekParm.dwTo := GetTrackPosition((mci_TMSF_Track(Position))+1);
      FFlags := TempFlags or mci_To;
    end;
  end
  else
    FFlags := TempFlags or mci_Seek_To_End;

  SeekParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Seek, FFlags, SeekParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Seek, FFlags, UIntPtr(@SeekParm));
{$ENDIF}
end; {Next}


procedure TMediaPlayer.Previous;
var
  SeekParm: TMCI_Seek_Parms;
  tpos,cpos,TempFlags: Longint;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else FFlags := mci_Wait;
  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;

  TempFlags := FFlags; {preserve FFlags from GetTimeFormat & GetPosition}
  if TimeFormat = tfTMSF then {using Tracks}
  begin
    cpos := Position;
    tpos := GetTrackPosition(mci_TMSF_Track(Position));
    if Mode = mpPlaying then
    begin
      {if not on first track, and at beginning of current track}
      if (mci_TMSF_Track(cpos) <> 1) and
         (mci_TMSF_Minute(cpos) = mci_TMSF_Minute(tpos)) and
         (mci_TMSF_Second(cpos) = mci_TMSF_Second(tpos)) then
        StartPos := GetTrackPosition(mci_TMSF_Track(Position)-1) {go to previous}
      else
        StartPos := tpos; {otherwise, go to beginning of current}
      Play;
      CurrentButton := btPlay;
      Exit;
    end
    else
    begin
      {if not on first track, and at beginning of current track}
      if (mci_TMSF_Track(cpos) <> 1) and
         (mci_TMSF_Minute(cpos) = mci_TMSF_Minute(tpos)) and
         (mci_TMSF_Second(cpos) = mci_TMSF_Second(tpos)) then
        SeekParm.dwTo := GetTrackPosition(mci_TMSF_Track(Position)-1) {go to previous}
      else
         SeekParm.dwTo := tpos; {otherwise, go to beginning of current}
      FFlags := TempFlags or mci_To;
    end;
  end
  else
    FFlags := TempFlags or mci_Seek_To_Start;

  SeekParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Seek, FFlags, SeekParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Seek, FFlags, UIntPtr(@SeekParm));
{$ENDIF}
end; {Previous}

procedure TMediaPlayer.Step;
var
  AStepParm: TMCI_Anim_Step_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  if FHasVideo then
  begin
    if FAutoRewind and (Position = Length) then Rewind;

    FFlags := 0;
    if FUseWait then
    begin
      if FWait then FFlags := mci_Wait;
      FUseWait := False;
    end
    else FFlags := mci_Wait;
    if FUseNotify then
    begin
      if FNotify then FFlags := FFlags or mci_Notify;
      FUseNotify := False;
    end;
    FFlags := FFlags or mci_Anim_Step_Frames;
    AStepParm.dwFrames := FFrames;
    AStepParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Step, FFlags, AStepParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Step, FFlags, UIntPtr(@AStepParm) );
{$ENDIF}
  end; {if HasVideo}
end;

procedure TMediaPlayer.Back;
var
  AStepParm: TMCI_Anim_Step_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  if FHasVideo then
  begin
    FFlags := 0;
    if FUseWait then
    begin
      if FWait then FFlags := mci_Wait;
      FUseWait := False;
    end
    else FFlags := mci_Wait;
    if FUseNotify then
    begin
      if FNotify then FFlags := FFlags or mci_Notify;
      FUseNotify := False;
    end;
    FFlags := FFlags or mci_Anim_Step_Frames or mci_Anim_Step_Reverse;
    AStepParm.dwFrames := FFrames;
    AStepParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Step, FFlags, AStepParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Step, FFlags, UIntPtr(@AStepParm) );
{$ENDIF}
  end; {if HasVideo}
end; {Back}

procedure TMediaPlayer.Eject;
var
  SetParm: TMCI_Set_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  if FCanEject then
  begin
    FFlags := 0;
    if FUseWait then
    begin
      if FWait then FFlags := mci_Wait;
      FUseWait := False;
    end
    else FFlags := mci_Wait;
    if FUseNotify then
    begin
      if FNotify then FFlags := FFlags or mci_Notify;
      FUseNotify := False;
    end;
    FFlags := FFlags or mci_Set_Door_Open;
    SetParm.dwCallback := Handle;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Set, FFlags, SetParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Set, FFlags, UIntPtr(@SetParm) );
{$ENDIF}
  end; {if CanEject}
end; {Eject}

procedure TMediaPlayer.SetPosition(Value: Longint);
var
  SeekParm: TMCI_Seek_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}

  FFlags := 0;
  if FUseWait then
  begin
    if FWait then FFlags := mci_Wait;
    FUseWait := False;
  end
  else FFlags := mci_Wait;
  if FUseNotify then
  begin
    if FNotify then FFlags := FFlags or mci_Notify;
    FUseNotify := False;
  end;
  FFlags := FFlags or mci_To;
  SeekParm.dwCallback := Handle;
  SeekParm.dwTo := Value;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Seek, FFlags, SeekParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Seek, FFlags, UIntPtr(@SeekParm));
{$ENDIF}
end;

procedure TMediaPlayer.Rewind;
var
  SeekParm: TMCI_Seek_Parms;
  RFlags: Longint;
begin
  CheckIfOpen; {raises exception if device is not open}
  RFlags := mci_Wait or mci_Seek_To_Start;
{$IF DEFINED(CLR)}
  mciSendCommand( DeviceID, mci_Seek, RFlags, SeekParm);
{$ELSE}
  mciSendCommand( FDeviceID, mci_Seek, RFlags, UIntPtr(@SeekParm));
{$ENDIF}
end;

function TMediaPlayer.GetTrackLength(TrackNum: Integer): Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}
  FFlags := mci_Wait or mci_Status_Item or mci_Track;
  StatusParm.dwItem := mci_Status_Length;
  StatusParm.dwTrack := Longint(TrackNum);
{$IF DEFINED(CLR)}
  mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

function TMediaPlayer.GetTrackPosition(TrackNum: Integer): Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  FFlags := mci_Wait or mci_Status_Item or mci_Track;
  StatusParm.dwItem := mci_Status_Position;
  StatusParm.dwTrack := Longint(TrackNum);
{$IF DEFINED(CLR)}
  mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

procedure TMediaPlayer.Save;
var
  SaveParm: TMCI_SaveParms;
begin
  CheckIfOpen; {raises exception if device is not open}
  if FElementName <> '' then {make sure a file has been specified to save to}
  begin
{$IF DEFINED(CLR)}
    SaveParm.lpfilename := FElementName;
{$ELSE}
    SaveParm.lpfilename := PChar(FElementName);
{$ENDIF}

    FFlags := 0;
    if FUseWait then
    begin
      if FWait then FFlags := mci_Wait;
      FUseWait := False;
    end
    else FFlags := mci_Wait;
    if FUseNotify then
    begin
      if FNotify then FFlags := FFlags or mci_Notify;
      FUseNotify := False;
    end;
    SaveParm.dwCallback := Handle;
    FFlags := FFlags or mci_Save_File;
{$IF DEFINED(CLR)}
    FError := mciSendCommand(DeviceID, mci_Save, FFlags, SaveParm);
{$ELSE}
    FError := mciSendCommand(FDeviceID, mci_Save, FFlags, UIntPtr(@SaveParm));
{$ENDIF}
    end;
end;


{*** procedures that set control flags for MCI Commands ***}
procedure TMediaPlayer.SetWait( Flag: Boolean );
begin
  if Flag <> FWait then FWait := Flag;
  FUseWait := True;
end;

procedure TMediaPlayer.SetNotify( Flag: Boolean );
begin
  if Flag <> FNotify then FNotify := Flag;
  FUseNotify := True;
end;

procedure TMediaPlayer.SetFrom( Value: Longint );
begin
  if Value <> FFrom then FFrom := Value;
  FUseFrom := True;
end;

procedure TMediaPlayer.SetTo( Value: Longint );
begin
  if Value <> FTo then FTo := Value;
  FUseTo := True;
end;


procedure TMediaPlayer.SetDeviceType( Value: TMPDeviceTypes );
begin
  if Value <> FDeviceType then FDeviceType := Value;
end;

procedure TMediaPlayer.SetTimeFormat( Value: TMPTimeFormats );
var
  SetParm: TMCI_Set_Parms;
begin
  begin
    FFlags := mci_Notify or mci_Set_Time_Format;
    SetParm.dwTimeFormat := Longint(Value);
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Set, FFlags, SetParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Set, FFlags, UIntPtr(@SetParm) );
{$ENDIF}
  end;
end;

{setting a TWinControl to display video devices' output}
procedure TMediaPlayer.SetDisplay( Value: TWinControl );
var
  AWindowParm: TMCI_Anim_Window_Parms;
begin
  if (Value <> nil) and MCIOpened and FHasVideo then
  begin
    FFlags := mci_Wait or mci_Anim_Window_hWnd;
    AWindowParm.Wnd := Value.Handle;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Window, FFlags, AWindowParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Window, FFlags, UIntPtr(@AWindowParm) );
{$ENDIF}
    if FError <> 0 then
      FDisplay := nil {alternate window not supported}
    else
    begin
      FDisplay := Value; {alternate window supported}
      Value.FreeNotification(Self);
    end;
  end
  else FDisplay := Value;
end;

procedure TMediaPlayer.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDisplay) then
  begin
    if MCIOpened then SetOrigDisplay;
    FDisplay := nil;
  end;
end;

{ special case to set video display back to original window,
  when FDisplay's TWinControl is deleted at runtime }
procedure TMediaPlayer.SetOrigDisplay;
var
  AWindowParm: TMCI_Anim_Window_Parms;
begin
  if MCIOpened and FHasVideo then
  begin
    FFlags := mci_Wait or mci_Anim_Window_hWnd;
    AWindowParm.Wnd := mci_Anim_Window_Default;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Window, FFlags, AWindowParm );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Window, FFlags, UIntPtr(@AWindowParm) );
{$ENDIF}
  end;
end;

{setting a rect for user-defined form to display video devices' output}
procedure TMediaPlayer.SetDisplayRect( Value: TRect );
var
  RectParms: TMCI_Anim_Rect_Parms;
  WorkR: TRect;
begin
  if MCIOpened and FHasVideo then
  begin
    {special case, use default width and height}
    if (Value.Bottom = 0) and (Value.Right = 0) then
    begin
      with Value do
        WorkR := Rect(Left, Top, FDWidth, FDHeight);
    end
    else WorkR := Value;
    FFlags := mci_Anim_RECT or mci_Anim_Put_Destination;
    RectParms.rc := WorkR;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Put, FFlags, RectParms );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Put, FFlags, UIntPtr(@RectParms) );
{$ENDIF}
  end;
end;


{***** functions to get device capabilities and status ***}

function TMediaPlayer.GetDisplayRect: TRect;
var
  RectParms: TMCI_Anim_Rect_Parms;
begin
  if MCIOpened and FHasVideo then
  begin
    FFlags := mci_Anim_Where_Destination;
{$IF DEFINED(CLR)}
    FError := mciSendCommand( DeviceID, mci_Where, FFlags, RectParms );
{$ELSE}
    FError := mciSendCommand( FDeviceID, mci_Where, FFlags, UIntPtr(@RectParms) );
{$ENDIF}
    Result := RectParms.rc;
  end;
end;

{ fills in static properties upon opening MCI Device }
procedure TMediaPlayer.GetDeviceCaps;
var
  DevCapParm: TMCI_GetDevCaps_Parms;
  devType: Longint;
  RectParms: TMCI_Anim_Rect_Parms;
  WorkR: TRect;
begin
  FFlags := mci_Wait or mci_GetDevCaps_Item;

  DevCapParm.dwItem := mci_GetDevCaps_Can_Play;
{$IF DEFINED(CLR)}
  mciSendCommand(DeviceID, mci_GetDevCaps, FFlags,  DevCapParm );
{$ELSE}
  mciSendCommand(FDeviceID, mci_GetDevCaps, FFlags,  UIntPtr(@DevCapParm) );
{$ENDIF}
  FCanPlay := Boolean(DevCapParm.dwReturn);
  if FCanPlay then Include(FCapabilities, mpCanPlay);

  DevCapParm.dwItem := mci_GetDevCaps_Can_Record;
{$IF DEFINED(CLR)}
  mciSendCommand(DeviceID, mci_GetDevCaps, FFlags,  DevCapParm );
{$ELSE}
  mciSendCommand(FDeviceID, mci_GetDevCaps, FFlags,  UIntPtr(@DevCapParm) );
{$ENDIF}
  FCanRecord := Boolean(DevCapParm.dwReturn);
  if FCanRecord then Include(FCapabilities, mpCanRecord);

  DevCapParm.dwItem := mci_GetDevCaps_Can_Eject;
{$IF DEFINED(CLR)}
  mciSendCommand(DeviceID, mci_GetDevCaps, FFlags,  DevCapParm );
{$ELSE}
  mciSendCommand(FDeviceID, mci_GetDevCaps, FFlags,  UIntPtr(@DevCapParm) );
{$ENDIF}
  FCanEject := Boolean(DevCapParm.dwReturn);
  if FCanEject then Include(FCapabilities, mpCanEject);

  DevCapParm.dwItem := mci_GetDevCaps_Has_Video;
{$IF DEFINED(CLR)}
  mciSendCommand(DeviceID, mci_GetDevCaps, FFlags,  DevCapParm );
{$ELSE}
  mciSendCommand(FDeviceID, mci_GetDevCaps, FFlags,  UIntPtr(@DevCapParm) );
{$ENDIF}
  FHasVideo := Boolean(DevCapParm.dwReturn);
  if FHasVideo then Include(FCapabilities, mpUsesWindow);

  DevCapParm.dwItem := mci_GetDevCaps_Device_Type;
{$IF DEFINED(CLR)}
  mciSendCommand(DeviceID, mci_GetDevCaps, FFlags,  DevCapParm );
{$ELSE}
  mciSendCommand(FDeviceID, mci_GetDevCaps, FFlags,  UIntPtr(@DevCapParm) );
{$ENDIF}
  devType := DevCapParm.dwReturn;
  if (devType = mci_DevType_Animation) or
     (devType = mci_DevType_Digital_Video) or
     (devType = mci_DevType_Overlay) or
     (devType = mci_DevType_VCR) then FCanStep := True;
  if FCanStep then Include(FCapabilities, mpCanStep);

  FFlags := mci_Anim_Where_Source;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Where, FFlags, RectParms );
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Where, FFlags, UIntPtr(@RectParms) );
{$ENDIF}
  WorkR := RectParms.rc;
  FDWidth := WorkR.Right - WorkR.Left;
  FDHeight := WorkR.Bottom - WorkR.Top;
end; {GetDeviceCaps}

{$IFDEF CLR}[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]{$ENDIF}
function TMediaPlayer.GetFileName: string;
begin
  Result := FElementName;
end;

function TMediaPlayer.GetStart: Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}
  FFlags := mci_Wait or mci_Status_Item or mci_Status_Start;
  StatusParm.dwItem := mci_Status_Position;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

function TMediaPlayer.GetLength: Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}
  FFlags := mci_Wait or mci_Status_Item;
  StatusParm.dwItem := mci_Status_Length;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

function TMediaPlayer.GetTracks: Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}
  FFlags := mci_Wait or mci_Status_Item;
  StatusParm.dwItem := mci_Status_Number_Of_Tracks;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

function TMediaPlayer.GetMode: TMPModes;
var
  StatusParm: TMCI_Status_Parms;
begin
  FFlags := mci_Wait or mci_Status_Item;
  StatusParm.dwItem := mci_Status_Mode;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := TMPModes(StatusParm.dwReturn - 524); {MCI Mode #s are 524+enum}
end;

function TMediaPlayer.GetPosition: Longint;
var
  StatusParm: TMCI_Status_Parms;
begin
  FFlags := mci_Wait or mci_Status_Item;
  StatusParm.dwItem := mci_Status_Position;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := StatusParm.dwReturn;
end;

function TMediaPlayer.GetTimeFormat: TMPTimeFormats;
var
  StatusParm: TMCI_Status_Parms;
begin
  CheckIfOpen; {raises exception if device is not open}
  FFlags := mci_Wait or mci_Status_Item;
  StatusParm.dwItem := mci_Status_Time_Format;
{$IF DEFINED(CLR)}
  FError := mciSendCommand( DeviceID, mci_Status, FFlags, StatusParm);
{$ELSE}
  FError := mciSendCommand( FDeviceID, mci_Status, FFlags, UIntPtr(@StatusParm));
{$ENDIF}
  Result := TMPTimeFormats(StatusParm.dwReturn);
end;

function TMediaPlayer.GetErrorMessage: string;
{$IF DEFINED(CLR)}
var
  ErrMsg: System.Text.StringBuilder;
begin
  ErrMsg := StringBuilder.Create(4096);
  if not mciGetErrorString(FError, ErrMsg, ErrMsg.Capacity) then
    Result := SMCIUnknownError
  else
    Result := ErrMsg.ToString;
{$ELSE}
var
  ErrMsg: array[0..4095] of Char;
begin
  if not mciGetErrorString(FError, ErrMsg, SizeOf(ErrMsg)) then
    Result := SMCIUnknownError
  else SetString(Result, ErrMsg, StrLen(ErrMsg));
{$ENDIF}
end;

{$IFDEF CLR}[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]{$ENDIF}
procedure TMediaPlayer.SetFileName(Value: string);
begin
  if Value <> FElementname then
    FElementname := Value;
end;

end.
