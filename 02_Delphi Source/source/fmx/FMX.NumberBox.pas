{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.NumberBox;

interface

{$SCOPEDENUMS ON}

uses
  System.UITypes, FMX.Types, FMX.EditBox, FMX.Presentation.Messages, FMX.Controls.Presentation, FMX.Controls.Model;

type

{ TNumberBox }

  TNumberBoxModel = class(TEditBoxModel)
  public const
    DefaultVertIncrement = 5;
    DefaultVertIncrementEnabled = True;
  private
    FVertIncrement: Single;
    FVertIncrementEnabled: Boolean;
  public
    constructor Create; override;
    property VertIncrement: Single read FVertIncrement write FVertIncrement;
    /// <summary>
    ///   Enables or disables for a quick interactive value change when moving the mouse or finger vertically over
    ///   the component.
    /// </summary>
    property VertIncrementEnabled: Boolean read FVertIncrementEnabled write FVertIncrementEnabled;
  end;

  TNumberBox = class(TCustomEditBox)
  private
    function GetVertIncrement: Single;
    procedure SetVertIncrement(const Value: Single);
    function VertIncrementStored: Boolean;
    function GetVertIncrementEnabled: Boolean;
    procedure SetVertIncrementEnabled(const Value: Boolean);
    function GetModel: TNumberBoxModel; overload;
  protected
    function DefineModelClass: TDataModelClass; override;
    function DefinePresentationName: string; override;
  public
    property Model: TNumberBoxModel read GetModel;
    property TextAlign;
  published
    property Action;
    property CanFocus default True;
    property CanParentFocus;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property ReadOnly;
    property KeyboardType default TVirtualKeyboardType.NumberPad;
    property ReturnKeyType;
    property TextSettings;
    property Position;
    property Width;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HorzIncrement;
    property VertIncrement: Single read GetVertIncrement write SetVertIncrement stored VertIncrementStored nodefault;
    /// <summary>
    ///   Enables or disables for a quick interactive value change when moving the mouse or finger vertically over
    ///   the component.
    /// </summary>
    property VertIncrementEnabled: Boolean read GetVertIncrementEnabled write SetVertIncrementEnabled default TNumberBoxModel.DefaultVertIncrementEnabled;
    property ClipChildren default False;
    property ClipParent default False;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property StyledSettings;
    property TouchTargetExpansion;
    property Visible default True;
    property Caret;
    property KillFocusByReturn;
    property ParentShowHint;
    property ShowHint;
    { Events }
    property OnChange;
    property OnChangeTracking;
    property OnTyping;
    property OnApplyStyleLookup;
    property OnFreeStyle;
    { Drag and Drop events }
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    { Keyboard events }
    property OnKeyDown;
    property OnKeyUp;
    { Mouse events }
    property OnCanFocus;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
    property OnPresentationNameChoosing;
  end;

implementation

uses
  System.Math.Vectors, System.Math, FMX.NumberBox.Style;

{ TNumberBox }

procedure TNumberBox.SetVertIncrement(const Value: Single);
var
  LValue: Single;
begin
  LValue := System.Math.Max(0, Value);
  if not SameValue(Model.VertIncrement, LValue, TEpsilon.Vector) then
    Model.VertIncrement := LValue;
end;

function TNumberBox.VertIncrementStored: Boolean;
begin
  Result := not SameValue(Model.VertIncrement, TNumberBoxModel.DefaultVertIncrement, TEpsilon.Vector);
end;

function TNumberBox.DefineModelClass: TDataModelClass;
begin
  Result := TNumberBoxModel;
end;

function TNumberBox.DefinePresentationName: string;
begin
  Result := 'NumberBox-' + GetPresentationSuffix;
end;

function TNumberBox.GetModel: TNumberBoxModel;
begin
  Result := GetModel<TNumberBoxModel>;
end;

function TNumberBox.GetVertIncrement: Single;
begin
  Result := Model.VertIncrement;
end;

procedure TNumberBox.SetVertIncrementEnabled(const Value: Boolean);
begin
  Model.VertIncrementEnabled := Value;
end;

function TNumberBox.GetVertIncrementEnabled: Boolean;
begin
  Result := Model.VertIncrementEnabled;
end;

{ TNumberBoxModel }

constructor TNumberBoxModel.Create;
begin
  inherited;
  VertIncrement := DefaultVertIncrement;
  FVertIncrementEnabled := DefaultVertIncrementEnabled;
end;

initialization
  RegisterFmxClasses([TNumberBox]);
end.
