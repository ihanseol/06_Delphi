{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FmxAnimationEditors;

interface

uses
  System.Classes, DesignEditors, DesignIntf, System.UITypes, System.UIConsts,
  System.Generics.Collections, FMX.Types, FMX.Graphics, FMX.Ani, System.TypInfo,
  VCLEditors, System.Types, Vcl.Graphics, Vcl.ComCtrls, Vcl.Controls, FMX.Design.Bitmap;

type

  TAnimationPropertyName = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure GetValueList(List: TList<string>); virtual; abstract;
  end;

  TFloatAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    procedure GetValueList(List: TList<string>); override;
  end;

  TColorAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    procedure GetValueList(List: TList<string>); override;
  end;

  TGradientAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    procedure GetValueList(List: TList<string>); override;
  end;

  TRectAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TList<string>); override;
  end;

  TBitmapAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    procedure GetValueList(List: TList<string>); override;
  end;

  TBitmapListAnimationPropertyName = class(TAnimationPropertyName)
  private
  public
    procedure GetValueList(List: TList<string>); override;
  end;

  TConfigureAnimationEvent = procedure(Animation: TAnimation; PropertyName: string) of object;
  TAddItemsEvent = procedure(Items: TListItems) of object;

  TAnimationListView = class(TCustomListView)
  private const
    FDefItemHeight = 20;
  private
    FDesigner: IDesigner;
    FConfigureProc: TConfigureAnimationEvent;
    FAddItemsProc: TAddItemsEvent;
    procedure RebuildListView;
    procedure SetDesigner(const Value: IDesigner);
    procedure UpdateFont;
    function GetControlForDPI: TWinControl;
  protected
    procedure CreateWnd; override;
    procedure CreateNewAction(AnimationClass: TComponentClass); virtual;
    function CustomDrawItem(Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage)
      : Boolean; override;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    property Designer: IDesigner read FDesigner write SetDesigner;
    property OnConfigureAnimation: TConfigureAnimationEvent read FConfigureProc write FConfigureProc;
    property OnAddItems: TAddItemsEvent read FAddItemsProc write FAddItemsProc;
  end;

  TGradientProperty = class(TStringProperty, ICustomPropertyDrawing,
    ICustomPropertyDrawing80, IProperty80, IProperty160)
  private
    FHost: IPropertyHost;
    FAnimationListView: TAnimationListView;
    FPropertyPath: string;
  protected
    procedure AddItems(Items: TListItems); virtual;
    procedure ConfigureAnimation(Animation: TAnimation; PropertyName: string); virtual;
    function IsAnimated: Boolean; virtual;
    procedure ShowEditDialog; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetProperties(Proc: TGetPropProc); override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure Edit(const Host: IPropertyHost; DblClick: Boolean); reintroduce; overload;
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
    { IProperty160 }
    procedure SetPropertyPath(const Value: string);
  end;

  TFmxFloatProperty = class(TFloatProperty, ICustomPropertyDrawing,
    ICustomPropertyDrawing80, IProperty80, IProperty160)
  private
    FHost: IPropertyHost;
    FAnimationListView: TAnimationListView;
    FPropertyPath: string;
  protected
    procedure AddItems(Items: TListItems); virtual;
    procedure ConfigureAnimation(Animation: TAnimation; PropertyName: string); virtual;
    function IsAnimated: Boolean; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetProperties(Proc: TGetPropProc); override;
    procedure Edit(const Host: IPropertyHost; DblClick: Boolean); reintroduce; overload;
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
    { IProperty160 }
    procedure SetPropertyPath(const Value: string);
  end;

  TRectAnimationProperty = class(TStringProperty, ICustomPropertyDrawing,
    ICustomPropertyDrawing80, IProperty80, IProperty160)
  private
    FHost: IPropertyHost;
    FAnimationListView: TAnimationListView;
    FPropertyPath: string;
  protected
    procedure AddItems(Items: TListItems); virtual;
    procedure ConfigureAnimation(Animation: TAnimation; PropertyName: string); virtual;
    function IsAnimated: Boolean; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetProperties(Proc: TGetPropProc); override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure Edit(const Host: IPropertyHost; DblClick: Boolean); reintroduce; overload;
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
    { IProperty160 }
    procedure SetPropertyPath(const Value: string);
  end;

  TBitmapProperty = class(TStringProperty, ICustomPropertyDrawing,
    ICustomPropertyDrawing80, IProperty80, IProperty160)
  private
    FHost: IPropertyHost;
    FAnimationListView: TAnimationListView;
    FPropertyPath: string;
  protected
    procedure AddItems(Items: TListItems); virtual;
    procedure ConfigureAnimation(Animation: TAnimation; PropertyName: string); virtual;
    function IsAnimated: Boolean; virtual;
    procedure ShowEditDialog; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetProperties(Proc: TGetPropProc); override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure Edit(const Host: IPropertyHost; Dblclick: Boolean); reintroduce; overload;
    {ICustomPropertyDrawing}
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
    { IProperty160 }
    procedure SetPropertyPath(const Value: string);
  end;

  TBitmapOfItemProperty = class(TClassProperty, ICustomPropertyDrawing,
    ICustomPropertyDrawing80)
  private
    function GetBitmap: FMX.Graphics.TBitmap;
  public
    property Bitmap: FMX.Graphics.TBitmap read GetBitmap;
    function GetEditLimit: Integer; override;
    procedure ShowEditDialog; virtual;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
    {ICustomPropertyDrawing}
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
  end;


  TAlphaColorProperty = class(TIntegerProperty, ICustomPropertyDrawing,
    ICustomPropertyListDrawing, ICustomPropertyDrawing80, IProperty160)
  private
    FPropertyPath: string;
  protected
    function IsAnimated: Boolean; virtual;
    procedure CreateNewAnimation(AnimationClass: TComponentClass);
    function TextToAlphaColor(const Value: string): TAlphaColor; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetProperties(Proc: TGetPropProc); override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
    procedure Edit; override;
    { ICustomPropertyListDrawing }
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer);
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer);
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean);
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
    { IProperty160 }
    procedure SetPropertyPath(const Value: string);
  end;

  TColorForStateProperty = class(TAlphaColorProperty)
  protected
    function TextToAlphaColor(const Value: string): TAlphaColor; override;
  end;

  TFmxAnimationVisualizationProperty = class(TBasePropertyEditor, IProperty, IPropertyKind)
  private
    FDesigner: IDesigner;
    FAnimation: TAnimation;
  protected
    { IProperty }
    procedure Initialize; override;
    procedure SetPropEntry(Index: Integer; AInstance: TPersistent;
      APropInfo: PPropInfo); override;
    procedure Activate;
    function AllEqual: Boolean;
    function AutoFill: Boolean;
    procedure Edit; virtual;
    function HasInstance(Instance: TPersistent): Boolean;
    function GetAttributes: TPropertyAttributes; virtual;
    function GetEditLimit: Integer;
    function GetEditValue(out Value: string): Boolean;
    function GetName: string; virtual;
    function GetValue: string; virtual;
    procedure SetValue(const Value: string); virtual;
    procedure GetProperties(Proc: TGetPropProc); virtual;
    function GetPropInfo: PPropInfo; virtual;
    function GetPropType: PTypeInfo; virtual;
    procedure GetValues(Proc: TGetStrProc); virtual;
    procedure Revert;
    function ValueAvailable: Boolean;
    { IPropertyKind }
    function GetKind: TTypeKind; virtual;
  public
    constructor Create(const ADesigner: IDesigner; APropCount: Integer); override;
    property Designer: IDesigner read FDesigner;
    property Animation: TAnimation read FAnimation write FAnimation;
  end;

  TColorAnimationVisualizationProperty = class(TFmxAnimationVisualizationProperty,
    ICustomPropertyDrawing, ICustomPropertyDrawing80)
  public
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;
  end;

  TFloatAnimationVisualizationProperty = class(TFmxAnimationVisualizationProperty,
    ICustomPropertyDrawing, ICustomPropertyDrawing80)
  public
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;

  end;

  TFloatKeyAnimationVisuaLizationProperty = class(TFmxAnimationVisualizationProperty,
    ICustomPropertyDrawing, ICustomPropertyDrawing80)
  public
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    { ICustomPropertyDrawing80 }
    function PropDrawNameRect(const ARect: TRect): TRect;
    function PropDrawValueRect(const ARect: TRect): TRect;

  end;

implementation

uses
  System.Rtti, System.SysUtils, FmxDsnConst, System.Math, Vcl.Forms, Vcl.Themes, 
  Winapi.Windows, ToolsAPI, PropInspAPI, System.StrUtils, FMX.Design.Brush, Vcl.Dialogs,
  System.RTLConsts, FMX.Consts, FmxBitmapItemEdit, FMX.MultiResBitmap, FMXVclUtils,
  BrandingAPI, IDETheme.Utils, Winapi.CommCtrl, ToolsAPI.UI;

const
  FilmStripMargin: Integer = 2;
  FilmStripWidth: Integer = 12;
  FilmStripHeight: Integer = 13;

type

  TOnExecuteEvent = procedure of object;
  TExecutableListItem = class(TListItem)
  private
    FOnExecuteEvent: TOnExecuteEvent;
  public
    procedure Execute;
    property OnExecute: TOnExecuteEvent read FOnExecuteEvent write FOnExecuteEvent;
  end;

function PaintFilmStrip(const Value: string; ACanvas: TCanvas; const ARect: TRect;
  IsAnimated: Boolean): TRect;
var
  I, Right, Left, Top: Integer;
  BorderColor, CellColor: TColor;
begin
  Left := ARect.Left + FilmStripMargin;
  Right := Left + FilmStripWidth;
  Top := ARect.Top +  Round((ARect.Bottom - ARect.Top - FilmStripHeight)/2);
  var LCanvasRecall := TCanvasRecall.Create(ACanvas, [creBrush, crePen]);
  try
    with ACanvas do
    begin
      Pen.Color := ACanvas.Brush.Color;
      Rectangle(ARect.Left, ARect.Top, Right + FilmStripMargin, ARect.Bottom);
      // frame things
      if IsAnimated then
      begin
        BorderColor := TColors.Black;
        CellColor := TColors.LtGray;
      end
      else
      begin
        BorderColor := TColors.LtGray;
        CellColor := TColors.White;
      end;
    
      Pen.Color := BorderColor;
      Rectangle(Left, Top, Right, Top + FilmStripHeight);
      for I := 0 to 2 do
      begin
        Rectangle(Left, Top + 2 + (4 * I), Right, Top + 5 + (4 * I));
      end;
      Rectangle(Left + 2, Top, Right - 2, Top + FilmStripHeight);
    
      Brush.Color := CellColor;
      Pen.Color := CellColor;
      Rectangle(Left + 3, Top, Right - 3, Top + FilmStripHeight);
    
      Pen.Color := BorderColor;
      Rectangle(Left + 2, Top + 3, Right - 2, Top + FilmStripHeight - 3);

      Result := Rect(Right + FilmStripMargin, ARect.Top, ARect.Right, ARect.Bottom);
    end;
  finally
    // restore the things we twiddled with
    LCanvasRecall.Free;
  end;
end;

const
  TransitionMargin: Integer = 1;
  TransitionWidth: Integer = 16;
  TransitionHeight: Integer = 7;

var
  StartValueTextWidth, StopValueTextWidth: single;

function PaintTransitionBox(ACanvas: TCanvas; const ARect: TRect;
  IsLooped, IsAutoReversed: Boolean): TRect;
var
  Right, Left, Top, ArrowLeft, ArrowRight: Integer;
  DarkColor, LightColor, LColor: TColor;
begin
  Left := ARect.Left + TransitionMargin;
  Right := Left + TransitionWidth;
  Top := ARect.Top +  Round((ARect.Bottom - ARect.Top - TransitionHeight)/2);
  LColor := ACanvas.Brush.Color;
  var LCanvasRecall := TCanvasRecall.Create(ACanvas, [creBrush, crePen]);
  try
    with ACanvas do
    begin
      // frame things
      DarkColor := TColors.Black;
      LightColor := TColors.LtGray;
    
      Pen.Color := LightColor;
      if IsLooped or IsAutoReversed then
      begin
        RoundRect(Left, Top, Right, Top + TransitionHeight, TransitionHeight, TransitionHeight);
        ArrowRight := Right - 5;
      end
      else
      begin
        Top := Top - Trunc(TransitionHeight/2);
        ArrowRight := Right - 2;
      end;
    
      if IsLooped then
      begin
        ArrowLeft := Left + 4;
  //       MoveTo(ArrowLeft - 2, Top + TransitionHeight - 1);
  //       LineTo(ArrowLeft - 5, Top + TransitionHeight - 1 + 3);
      end
      else
      begin
        ArrowLeft := Left + 1;
        // if it looped, erase the left end of the round rect
        Pen.Color := LColor;
        Brush.Color := LColor;
        Brush.Style := bsSolid;
        Rectangle(Left, Top - 1, Left + 6, Top + TransitionHeight + 1);
      end;
    
  //     if IsAutoReversed then
  //     begin
  //       MoveTo(ArrowRight + 1, Top);
  //       LineTo(ArrowRight + 4, Top - 3);
  //     end;
    
      // Left to Right Arrow
      Pen.Color := DarkColor;
      MoveTo(ArrowLeft, Top + TransitionHeight - 1);
      LineTo(ArrowRight + 1, Top + TransitionHeight - 1);
      LineTo(ArrowRight - 2, Top + TransitionHeight - 1 + 3);
      MoveTo(ArrowRight + 1, Top + TransitionHeight - 1);
      LineTo(ArrowRight - 2, Top + TransitionHeight - 1 - 3);

      if IsAutoReversed then
      begin
        // Right to Left Arrow
        MoveTo(ArrowRight, Top);
        LineTo(ArrowLeft - 1, Top);
        LineTo(ArrowLeft + 2, Top - 3);
        MoveTo(ArrowLeft - 1, Top);
        LineTo(ArrowLeft + 2, Top + 3);
      end;

      Result := Rect(Right + TransitionMargin, ARect.Top, ARect.Right, ARect.Bottom);
    end;
  finally
    // restore the things we twiddled with
    LCanvasRecall.Free;
  end;
end;

var
  VCLBitmap: Vcl.Graphics.TBitmap = nil;
  FMXBitmap: FMX.Graphics.TBitmap = nil;

function PaintColorBox(const Value: TAlphaColor; ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean): TRect;
  overload;
const
  SquareSize = 3;
var
  Right, Size: Integer;
  NewRect: TRect;
begin
  Right := (ARect.Bottom - ARect.Top) {* 2} + ARect.Left;
  // save off things
  var LCanvasRecall := TCanvasRecall.Create(ACanvas, [creBrush, crePen]);
  try
    Size := ((ARect.Height - TIDEThemeMetrics.AlignFactor) div SquareSize) * SquareSize +  TIDEThemeMetrics.AlignFactor div 2;
    NewRect := TRect.Create(ARect.TopLeft, Size, Size);
    NewRect.Offset(FilmStripMargin, (ARect.Height - NewRect.Height + 1) div 2);
    if FMXBitmap = nil then
      FMXBitmap := FMX.Graphics.TBitmap.Create(Size - TIDEThemeMetrics.AlignFactor div 2, Size - TIDEThemeMetrics.AlignFactor div 2)
    else
      FMXBitmap.SetSize(Size - TIDEThemeMetrics.AlignFactor div 2, Size - TIDEThemeMetrics.AlignFactor div 2);
    FMXBitmap.Clear(Value);
    CreatePreview(FMXBitmap, VCLBitmap, TRect.Create(TPoint.Create(0, 0), FMXBitmap.Width, FMXBitmap.Height), clBlack,
      clWhite, SquareSize, True);
    ACanvas.Pen.Color := ACanvas.Brush.Color;
    ACanvas.Rectangle(ARect.Left, ARect.Top, Right, ARect.Bottom);
    if ASelected then
      ACanvas.Pen.Color := GetIDEStyleServices.GetSystemColor(clHighlightText)
    else
      ACanvas.Pen.Color := GetIDEStyleServices.GetSystemColor(clWindowText);
    ACanvas.Rectangle(NewRect);
    ACanvas.Draw(NewRect.Left + 1, NewRect.Top + 1, VCLBitmap);
  finally
    // restore the things we twiddled with
    LCanvasRecall.Free;
    Result := Rect(Right, ARect.Top, ARect.Right, ARect.Bottom);
  end;
end;

function PaintColorBox(const Value: string; ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean): TRect; overload;
var
  LValue: TAlphaColor;
begin
  LValue := StringToAlphaColor(Value);
  Result := PaintColorBox(LValue, ACanvas, ARect, ASelected);
end;

function PaintFloatValue(const Value: string; ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean): TRect;
var
  Right, Left, Top: Integer;
  TextW, TextH: integer;
  TmpRect: TRect;
begin
  var LCanvasRecall := TCanvasRecall.Create(ACanvas, [creBrush, crePen]);
  try
    with ACanvas do
    begin
      // calculate text size
      TextW := TextWidth(Value);
      TextH := TextHeight(Value);

      //update de text rectangle dimensions
      Left := ARect.Left;
      Right := ARect.Left + TextW;
      Top := ARect.Top + Round((ARect.Bottom - ARect.Top - TextH)/2);
    
      // frame things
      Pen.Color := GetIDEStyleServices.GetSystemColor(clWindowText);
      TmpRect := Rect(Left, Top, Right, ARect.Bottom);
      TextRect(TmpRect,TmpRect.Left, TmpRect.Top, Value);

      Result := Rect(Right + TransitionMargin, ARect.Top, ARect.Right, ARect.Bottom);
    end;
  finally
    // restore the things we twiddled with
    LCanvasRecall.Free;
  end;
end;

function PropDrawFilmStripRect(const ARect: TRect): TRect;
begin
  Result := Rect(ARect.Left, ARect.Top, FilmStripMargin * 2 + FilmStripWidth + ARect.Left, ARect.Bottom);
end;

procedure AddProperties(List: TList<string>; PropertyPrefix: string; RType: TRttiType;
  targetKind: TTypeKind; targetType: TRttiType = nil); overload;
var
  LProperties: TArray<TRttiProperty>;
  LProperty: TRttiProperty;
begin
    LProperties := RType.GetProperties;
    if Length(LProperties) > 0 then
    begin
      for LProperty in LProperties do
      begin
        if (LProperty.PropertyType.TypeKind = targetKind) and
          (LProperty.Visibility = mvPublished) and
          ((targetType = nil) or (LProperty.PropertyType = targetType)) then
        begin
          if not List.Contains(PropertyPrefix + LProperty.Name) then
            List.Add(PropertyPrefix + LProperty.Name);
        end
        else
          // Only look one level deep
          if Length(PropertyPrefix) = 0 then
            AddProperties(List, LProperty.Name + '.', LProperty.PropertyType, targetKind, targetType);
      end;
    end;
end;

function GetPropertyName(const AnAnimation: TAnimation): string;
begin
  Result := AnsiString('');

  if AnAnimation is TFloatAnimation then
  begin
    Result := TFloatAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TFloatKeyAnimation then
  begin
    Result := TFloatKeyAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TGradientAnimation then
  begin
    Result := TGradientAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TColorAnimation then
  begin
    Result := TColorAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TColorKeyAnimation then
  begin
    Result := TColorKeyAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TRectAnimation then
  begin
    Result := TRectAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TBitmapAnimation then
  begin
    Result := TBitmapAnimation(AnAnimation).PropertyName;
    Exit;
  end;

  if AnAnimation is TBitmapListAnimation then
  begin
    Result := TBitmapListAnimation(AnAnimation).PropertyName;
    Exit;
  end;

end;

function ComponentOfPersistent(APersistent: TPersistent): TComponent;
begin
  while Assigned(APersistent) do
  begin
     if APersistent is TOwnedCollection then
      APersistent := TOwnedCollection(APersistent).Owner
    else if APersistent is TCollectionItem then
      APersistent := TCollectionItem(APersistent).Collection
    else if APersistent is TComponent then
      Break
    else
      APersistent := nil;
  end;
  Result := TComponent(APersistent);
end;

function FMXObjectOfDesigner(const ADesigner: IDesigner;
                             const AIndex: Integer = 0): TFmxObject;
var
  LSelections: IDesignerSelections;
  LComp: TComponent;
begin
  Result := nil;
  if Assigned(ADesigner) and (AIndex >= 0) then
  begin
    LSelections := TDesignerSelections.Create;
    ADesigner.GetSelections(LSelections);
    if Assigned(LSelections) and (AIndex < LSelections.Count) then
    begin
      LComp := ComponentOfPersistent(LSelections.Items[AIndex]);
      if LComp is TFmxObject then
        Result := TFmxObject(LComp);
    end;
  end;
end;

function IsAnimatedImpl(const APropertyPath: string; const ADesigner: IDesigner): Boolean;
var
  BO, LChild: TFmxObject;
  I: Integer;
begin
  Result := False;
  BO := FMXObjectOfDesigner(ADesigner);
  if Assigned(BO) then
  for I := 0 to BO.ChildrenCount - 1 do
  begin
    LChild := BO.Children[I];
    if (LChild is TAnimation) and
       (APropertyPath = GetPropertyName(TAnimation(LChild))) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function CreateVisualizationProperty(Animation: TAnimation; ADesigner: IDesigner): TFmxAnimationVisualizationProperty;
begin
  if Animation is TColorAnimation then
    Result := TColorAnimationVisualizationProperty.Create(ADesigner, 0)
  else if Animation is TFloatAnimation then
    Result := TFloatAnimationVisualizationProperty.Create(ADesigner, 0)
  else if Animation is TFloatKeyAnimation then
    Result:= TFloatKeyAnimationVisualizationProperty.Create(ADesigner, 0)
  else
    Result:= TFmxAnimationVisualizationProperty.Create(ADesigner, 0);

  Result.Animation := Animation;
end;

procedure GetPropertiesImpl(const APropertyPath: string; const ADesigner: IDesigner;
  Proc: TGetPropProc);
var
  BO, LChild: TFmxObject;
  I: Integer;
  AniProp: TFmxAnimationVisualizationProperty;
begin
  BO := FMXObjectOfDesigner(ADesigner);
  if Assigned(BO) then
  for I := 0 to BO.ChildrenCount - 1 do
  begin
    LChild := BO.Children[I];
    if (LChild is TAnimation) and
       (APropertyPath = GetPropertyName(TAnimation(LChild))) then
    begin
      AniProp := CreateVisualizationProperty(TAnimation(LChild), ADesigner);
      Proc(AniProp);
    end;
  end;
end;

{ TAnimationPropertyName }

function TAnimationPropertyName.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TAnimationPropertyName.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TList<string>;
begin
  Values := TList<string>.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

{ TFloatAnimationPropertyName }

procedure TFloatAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType: TRttiInstanceType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType) as TRttiInstanceType;
      AddProperties(List, '', LType, tkFloat);
    end;
  end;
end;

{ TColorAnimationPropertyName }

procedure TColorAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType, LTargetType: TRttiType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType);
      LTargetType := LContext.GetType(TypeInfo(TAlphaColor));
      AddProperties(List, '', LType, LTargetType.TypeKind, LTargetType);
    end;
  end;
end;

{ TFmxFloatProperty }

procedure TFmxFloatProperty.AddItems(Items: TListItems);
var
  ListItem: TListItem;
begin
  ListItem := Items.Add;
  ListItem.Caption := SCreateNewFloatAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TFloatAnimation);

  ListItem := Items.Add;
  ListItem.Caption := SCreateNewFloatKeyAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TFloatKeyAnimation);
end;

procedure TFmxFloatProperty.ConfigureAnimation(Animation: TAnimation; PropertyName: string);
begin
  if Animation is TFloatAnimation then
    TFloatAnimation(Animation).PropertyName := PropertyName;
  if Animation is TFloatKeyAnimation then
    TFloatKeyAnimation(Animation).PropertyName := PropertyName;
end;

procedure TFmxFloatProperty.Edit(const Host: IPropertyHost; DblClick: Boolean);
var
  LHost20: IPropertyHost20;
begin
  FHost := Host;
  if FAnimationListView <> nil then
    FAnimationListView.Free;

  FAnimationListView := TAnimationListView.Create(nil);
  if Supports(FHost, IPropertyHost20, LHost20) then
    FAnimationListView.Width := LHost20.GetDropDownWidth;
  FAnimationListView.OnConfigureAnimation := ConfigureAnimation;
  FAnimationListView.OnAddItems := AddItems;
  FAnimationListView.Designer := Designer;
  FAnimationListView.Visible := True;
  FHost.DropDownControl(FAnimationListView);
end;

function TFmxFloatProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited;
  Result := Result + [paCustomDropDown, paVolatileSubProperties] - [paValueList, paSortList];
  if IsAnimated then
    Result := Result + [paSubProperties];
end;

procedure TFmxFloatProperty.GetProperties(Proc: TGetPropProc);
begin
  GetPropertiesImpl(FPropertyPath, Designer, Proc);
end;

function TFmxFloatProperty.IsAnimated(): Boolean;
begin
  Result := IsAnimatedImpl(FPropertyPath, Designer);
end;

procedure TFmxFloatProperty.PropDrawName(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TFmxFloatProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result := ARect;
end;

function TFmxFloatProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := PropDrawFilmStripRect(ARect);
end;

procedure TFmxFloatProperty.SetPropertyPath(const Value: string);
begin
  FPropertyPath := Value;
end;

procedure TFmxFloatProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    PaintFilmStrip(GetVisualValue, ACanvas, ARect, IsAnimated)
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

{ TFmxAnimationVisualizationProperty }

constructor TFmxAnimationVisualizationProperty.Create(const ADesigner: IDesigner; APropCount: Integer);
begin
  inherited;
  FDesigner := ADesigner;
end;

procedure TFmxAnimationVisualizationProperty.Activate;
begin
end;

function TFmxAnimationVisualizationProperty.AllEqual: Boolean;
begin
  Result := True;
end;

function TFmxAnimationVisualizationProperty.AutoFill: Boolean;
begin
  Result := True;
end;

procedure TFmxAnimationVisualizationProperty.Edit;
begin
  if Assigned(FAnimation) then
    Designer.SelectComponent(PersistentToDesignObject(FAnimation));
end;

function TFmxAnimationVisualizationProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paNotNestable, paReadOnly, paValueEditable, paDialog];
end;

function TFmxAnimationVisualizationProperty.GetEditLimit: Integer;
begin
  Result := -1;
end;

function TFmxAnimationVisualizationProperty.GetEditValue(out Value: string): Boolean;
begin
  Result := True;
  Value := GetValue;
end;

function TFmxAnimationVisualizationProperty.GetKind: TTypeKind;
begin
  Result := tkInteger;
end;

function TFmxAnimationVisualizationProperty.GetName: string;
begin
  if Assigned(Animation) then
    Result := Animation.Name
  else
    Result := '';
end;

procedure TFmxAnimationVisualizationProperty.GetProperties(Proc: TGetPropProc);
begin
end;

function TFmxAnimationVisualizationProperty.GetPropInfo: PPropInfo;
begin
  Result := nil;
end;

function TFmxAnimationVisualizationProperty.GetPropType: PTypeInfo;
begin
  Result := nil;
end;

function TFmxAnimationVisualizationProperty.GetValue: string;
begin
  if Assigned(Animation) then
    Result := Format('(dly: %fs, dur: %fs)', [Animation.Delay, Animation.Duration])
  else
    Result := '';
end;

procedure TFmxAnimationVisualizationProperty.GetValues(Proc: TGetStrProc);
begin
end;

function TFmxAnimationVisualizationProperty.HasInstance(Instance: TPersistent): Boolean;
begin
  Result := False;
end;

procedure TFmxAnimationVisualizationProperty.Initialize;
begin
  inherited;
end;

procedure TFmxAnimationVisualizationProperty.Revert;
begin
end;

procedure TFmxAnimationVisualizationProperty.SetPropEntry(Index: Integer;
  AInstance: TPersistent; APropInfo: PPropInfo);
begin
  inherited;
end;

procedure TFmxAnimationVisualizationProperty.SetValue(const Value: string);
begin
end;

function TFmxAnimationVisualizationProperty.ValueAvailable: Boolean;
begin
  Result := True;
end;

{ TAnimationListView }

procedure TAnimationListView.Click;
var
  P: TPoint;
  Item: TListItem;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  Item := GetItemAt(P.X, P.Y);
  if Item <> nil then
  begin
    if Item is TExecutableListItem then
      TExecutableListItem(Item).Execute
    else
      CreateNewAction(TComponentClass(Item.Data));
  end;
end;

constructor TAnimationListView.Create(AOwner: TComponent);
begin
  inherited;
  BorderStyle := bsNone;
  Columns.Add;
  var LControlDPI := GetControlForDPI;
  Height := LControlDPI.ScaleValue(FDefItemHeight);
  ReadOnly := True;
  RowSelect := True;
  ShowColumnHeaders := False;
  ViewStyle := vsReport;
  ShowHint := False;
  Width := LControlDPI.ScaleValue(200);
  UpdateFont;
end;

procedure TAnimationListView.UpdateFont;
begin
  if TIDEThemeMetrics.Font.Enabled then
  begin
    Font.Assign(BrandingAPI.TIDEThemeMetrics.Font.GetFont());
    TIDEThemeMetrics.Font.AdjustDPISize(Font, TIDEThemeMetrics.Font.DefaultSize, GetControlForDPI.CurrentPPI);
    Canvas.Font.Assign(Font);
  end;
end;

function TAnimationListView.GetControlForDPI: TWinControl;
begin
  if Parent = nil then
    Result := TIDEHighDPIService.GetFormDPI(nil) as TWinControl
  else
    Result := Parent;
end;

function TAnimationListView.IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean;
begin
  Result := (Stage = cdPrePaint) or (Stage = cdPostPaint);
end;

function TAnimationListView.CustomDrawItem(Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage): Boolean;
var
  LRect: TRect;
  LStyle: TCustomStyleServices;
begin
  Result := True;
  LRect := Item.DisplayRect(drBounds);
  if ThemeProperties = nil then
    LStyle := StyleServices
  else
    LStyle := ThemeProperties.StyleServices;

  var LControlDPI := GetControlForDPI;
  var LSelected := ([cdsSelected, cdsFocused, cdsHot] * State <> []);
  case Stage of
    cdPostPaint:
      begin
        if LSelected then
        begin
          Canvas.Font.Color := LStyle.GetSystemColor(clHighlightText);
          Canvas.Brush.Color := LStyle.GetSystemColor(clHighlight);
        end
        else
        begin
          Canvas.Font.Color := LStyle.GetSystemColor(clWindowText);
          Canvas.Brush.Color := LStyle.GetSystemColor(clWindow);
        end;

        Canvas.FillRect(LRect);
        Inc(LRect.Left, LControlDPI.ScaleValue(TIDEThemeMetrics.AlignFactor) * 3);
        var s := Item.Caption;
        Canvas.TextRect(LRect, s, [tfLeft, tfSingleLine, tfVerticalCenter]);
      end;
  end;
end;

procedure TAnimationListView.CreateNewAction(AnimationClass: TComponentClass);
var
  BO: TFmxObject;
  LAni: TAnimation;
  LPropName: string;
begin
  LPropName := (BorlandIDEServices as IOTAPropInspServices).Selection.GetActiveItem;
  BO := FMXObjectOfDesigner(Designer);
  if Assigned(BO) then
  begin
    LAni := TAnimation(Designer.CreateComponent(AnimationClass, BO, 0, 0, 0, 0));
    LAni.Parent := BO;
    if Assigned(FConfigureProc) then
      FConfigureProc(LAni, LPropName);
  end;
end;


procedure TAnimationListView.CreateWnd;
begin
  inherited;
  if Designer.Root <> nil then
    RebuildListView;
end;

procedure TAnimationListView.RebuildListView;
var
  LRect: TRect;
  ListItem: TListItem;
  LMaxWidth: Integer;
begin
  LMaxWidth := 0;
  Items.BeginUpdate;
  try
    Items.Clear;
    if Assigned(FAddItemsProc) then
      FAddItemsProc(Items);
  finally
    Items.EndUpdate;
  end;

  var LOffset := GetControlForDPI.ScaleValue(25);
  UpdateFont;
  // Set Width
  for ListItem in Items do
    LMaxWidth := Max(LMaxWidth, Canvas.TextWidth(ListItem.Caption) + LOffset);

  Width := Max(Width, LMaxWidth);
  Columns[0].Width := Width;

  // Set Height
  LRect := Items[0].DisplayRect(drBounds);
  Height := LRect.Bottom * Items.Count;
end;

procedure TAnimationListView.SetDesigner(const Value: IDesigner);
begin
  if Value <> FDesigner then
  begin
    FDesigner := Value;

    if HandleAllocated then
      RebuildListView;
  end;
end;

{ TGradientAnimationPropertyName }

procedure TGradientAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType, LTargetType: TRttiType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType);
      LTargetType := LContext.GetType(TypeInfo(FMX.Graphics.TGradient));
      AddProperties(List, '', LType, LTargetType.TypeKind, LTargetType);
    end;
  end;
end;

{ TGradientProperty }

function TGradientProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited;
  Result := Result + [paCustomDropDown, paVolatileSubProperties, paDialog, paReadOnly] - [paValueList, paSortList];
  Result := Result - [paValueList, paSortList];
  if IsAnimated then
    Result := Result + [paSubProperties];
end;

function TGradientProperty.GetValue: string;
begin
  Result := '(Gradient)';
end;

procedure TGradientProperty.SetPropertyPath(const Value: string);
begin
  FPropertyPath := Value;
end;

procedure TGradientProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do (BorlandIDEServices as INTAIDEUIServices).ShowMessage(E.Message);
  end;
end;

procedure TGradientProperty.PropDrawName(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TGradientProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result := ARect;
end;

function TGradientProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := PropDrawFilmStripRect(ARect);
end;

procedure TGradientProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    PaintFilmStrip(GetVisualValue, ACanvas, ARect, IsAnimated)
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

procedure TGradientProperty.ShowEditDialog;
var
  GradientDialog: TBrushDialog;
begin
  GradientDialog := TBrushDialog.Create(Application);
  GradientDialog.ShowStyles := GradientDialog.ShowStyles + [FMX.Graphics.TBrushKind.Gradient];
  GradientDialog.ShowBrushList := false;
  GradientDialog.Brush.Kind := FMX.Graphics.TBrushKind.Gradient;
  GradientDialog.Brush.Gradient.Assign(TGradient(GetOrdValue));
  if GradientDialog.Execute then
  begin
    TGradient(GetOrdValue).Assign(GradientDialog.Brush.Gradient);
    Modified;
  end;
  GradientDialog.Free;
end;

procedure TGradientProperty.Edit(const Host: IPropertyHost; DblClick: Boolean);
var
  LHost20: IPropertyHost20;
begin
  if DblClick then
  begin
    ShowEditDialog;
  end
  else
  begin
    FHost := Host;
    if FAnimationListView <> nil then
      FAnimationListView.Free;

    FAnimationListView := TAnimationListView.Create(nil);
    if Supports(FHost, IPropertyHost20, LHost20) then
      FAnimationListView.Width := LHost20.GetDropDownWidth;
    FAnimationListView.OnConfigureAnimation := ConfigureAnimation;
    FAnimationListView.OnAddItems := AddItems;
    FAnimationListView.Designer := Designer;
    FAnimationListView.Visible := True;
    FHost.DropDownControl(FAnimationListView);
  end;
end;

procedure TGradientProperty.AddItems(Items: TListItems);
var
  ListItem: TListItem;
begin
  ListItem := Items.Add;
  ListItem.Caption := SCreateNewGradientAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TGradientAnimation);

  ListItem := TExecutableListItem.Create(Items);
  TExecutableListItem(ListItem).OnExecute := ShowEditDialog;
  Items.AddItem(ListItem);
  ListItem.Caption := SEditItemCaption;
  ListItem.ImageIndex := -1;
end;

procedure TGradientProperty.ConfigureAnimation(Animation: TAnimation; PropertyName: string);
begin
  if Animation is TGradientAnimation then
    TGradientAnimation(Animation).PropertyName := PropertyName;
end;

function TGradientProperty.IsAnimated(): Boolean;
begin
  Result := IsAnimatedImpl(FPropertyPath, Designer);
end;

procedure TGradientProperty.GetProperties(Proc: TGetPropProc);
begin
  GetPropertiesImpl(FPropertyPath, Designer, Proc);
end;

{ TExecutableListItem }

procedure TExecutableListItem.Execute;
begin
  if Assigned(FOnExecuteEvent) then
    FOnExecuteEvent;
end;

{ TRectAnimationPropertyName }

function TRectAnimationPropertyName.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TRectAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType, LTargetType: TRttiType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType);
      LTargetType := LContext.GetType(TypeInfo(FMX.Types.TBounds));
      AddProperties(List, '', LType, LTargetType.TypeKind, LTargetType);
    end;
  end;
end;

{ TBitmapAnimationPropertyName }

procedure TBitmapAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType, LTargetType: TRttiType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType);
      LTargetType := LContext.GetType(TypeInfo(FMX.Graphics.TBitmap));
      AddProperties(List, '', LType, LTargetType.TypeKind, LTargetType);
    end;
  end;
end;

{ TBitmapListAnimationPropertyName }

procedure TBitmapListAnimationPropertyName.GetValueList(List: TList<string>);
var
  LAni, LAniParent: TFmxObject;
  LContext: TRttiContext;
  LType, LTargetType: TRttiType;
begin
  LAni := GetComponent(0) as TFmxObject;
  if Assigned(LAni) then
  begin
    LAniParent := LAni.Parent;
    if Assigned(LAniParent) then
    begin
      LType := LContext.GetType(LAniParent.ClassType);
      LTargetType := LContext.GetType(TypeInfo(FMX.Graphics.TBitmap));
      AddProperties(List, '', LType, LTargetType.TypeKind, LTargetType);
    end;
  end;
end;

{ TRectAnimationProperty }

procedure TRectAnimationProperty.AddItems(Items: TListItems);
var
  ListItem: TListItem;
begin
  ListItem := Items.Add;
  ListItem.Caption := SCreateNewRectAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TRectAnimation);
end;

procedure TRectAnimationProperty.ConfigureAnimation(Animation: TAnimation;
  PropertyName: string);
begin
  if Animation is TRectAnimation then
    TRectAnimation(Animation).PropertyName := PropertyName;
end;

procedure TRectAnimationProperty.Edit(const Host: IPropertyHost;
  DblClick: Boolean);
var
  LHost20: IPropertyHost20;
begin
  FHost := Host;
  if FAnimationListView <> nil then
    FAnimationListView.Free;

  FAnimationListView := TAnimationListView.Create(nil);
  if Supports(FHost, IPropertyHost20, LHost20) then
    FAnimationListView.Width := LHost20.GetDropDownWidth;
  FAnimationListView.OnConfigureAnimation := ConfigureAnimation;
  FAnimationListView.OnAddItems := AddItems;
  FAnimationListView.Designer := Designer;
  FAnimationListView.Visible := True;
  FHost.DropDownControl(FAnimationListView);
end;

function TRectAnimationProperty.GetAttributes: TPropertyAttributes;
begin
//  Result := inherited;
//  Result := Result + [paCustomDropDown, paVolatileSubProperties, paDialog, paReadOnly] - [paValueList, paSortList];
//  Result := Result - [paValueList, paSortList];
//  if IsAnimated then
//    Result := Result + [paSubProperties];
  Result := inherited;
  Result := Result + [paCustomDropDown, paVolatileSubProperties] - [paValueList, paSortList];
  if IsAnimated then
    Result := Result + [paSubProperties];
end;

procedure TRectAnimationProperty.GetProperties(Proc: TGetPropProc);
begin
  GetPropertiesImpl(FPropertyPath, Designer, Proc);
end;

function TRectAnimationProperty.IsAnimated: Boolean;
begin
  Result := IsAnimatedImpl(FPropertyPath, Designer);
end;

function TRectAnimationProperty.GetValue: string;
begin
  Result := '(Bounds)';
end;

procedure TRectAnimationProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do (BorlandIDEServices as INTAIDEUIServices).ShowMessage(E.Message);
  end;
end;

procedure TRectAnimationProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TRectAnimationProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result := ARect;
end;

procedure TRectAnimationProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    PaintFilmStrip(GetVisualValue, ACanvas, ARect, IsAnimated)
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

function TRectAnimationProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := PropDrawFilmStripRect(ARect);
end;

procedure TRectAnimationProperty.SetPropertyPath(const Value: string);
begin
  FPropertyPath := Value;
end;

{ TAlphaColorProperty }

procedure TAlphaColorProperty.Edit;
var
  D: TBrushDialog;
begin
  D := TBrushDialog.Create(Application);
  D.ShowStyles := [FMX.Graphics.TBrushKind.Solid];
  D.ShowBrushList := false;
  D.Brush.Color := TAlphaColor(GetOrdValue);
  if D.Execute then
  begin
    SetOrdValue(Integer(D.Brush.Color));
    Modified;
  end;
  D.Free;
end;

function TAlphaColorProperty.GetValue: string;
begin
  try
    Result := AlphaColorToString(TAlphaColor(GetOrdValue));
  except
    on E: Exception do (BorlandIDEServices as INTAIDEUIServices).ShowMessage(E.Message);
  end;
end;

procedure TAlphaColorProperty.GetValues(Proc: TGetStrProc);
begin
  GetAlphaColorValues(Proc);
  Proc(SCreateNewColorAnimation);
  Proc(SCreateNewColorKeyAnimation);
end;

procedure TAlphaColorProperty.SetValue(const Value: string);
begin
  if SameText(Value, SCreateNewColorAnimation) then
  begin
    CreateNewAnimation(TColorAnimation);
    Exit;
  end;
  if SameText(Value, SCreateNewColorKeyAnimation) then
  begin
    CreateNewAnimation(TColorKeyAnimation);
    Exit;
  end;

  try
    SetOrdValue(Integer(StringToAlphaColor(Value)));
    Modified;
  except
    on E: Exception do (BorlandIDEServices as INTAIDEUIServices).ShowMessage(E.Message);
  end;
end;

procedure TAlphaColorProperty.CreateNewAnimation(AnimationClass: TComponentClass);
var
  BO: TFmxObject;
  LAni: TAnimation;
  LPropName: string;
begin
  LPropName := (BorlandIDEServices as IOTAPropInspServices).Selection.GetActiveItem;
  BO := FMXObjectOfDesigner(Designer);
  if Assigned(BO) then
  begin
    LAni := TAnimation(Designer.CreateComponent(AnimationClass, BO, 0,0,0,0));
    LAni.Parent := BO;
    if LAni is TColorAnimation then
      TColorAnimation(LAni).PropertyName := LPropName;
    if LAni is TColorKeyAnimation then
      TColorKeyAnimation(LAni).PropertyName := LPropName;
  end;
end;

function TAlphaColorProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := Rect(ARect.Left, ARect.Top, FilmStripMargin * 2 + FilmStripWidth +
    (ARect.Bottom - ARect.Top) + ARect.Left, ARect.Bottom);
end;

function TAlphaColorProperty.TextToAlphaColor(const Value: string): TAlphaColor;
begin
  Result := StringToAlphaColor(Value);
end;

procedure TAlphaColorProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
var
  LRect: TRect;
begin
  if GetVisualValue <> '' then
  begin
    LRect := PaintFilmStrip(GetVisualValue, ACanvas, ARect, IsAnimated);
    PaintColorBox(TextToAlphaColor(GetVisualValue), ACanvas, LRect, False);
  end
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

procedure TAlphaColorProperty.GetProperties(Proc: TGetPropProc);
begin
  GetPropertiesImpl(FPropertyPath, Designer, Proc);
end;

procedure TAlphaColorProperty.SetPropertyPath(const Value: string);
begin
  FPropertyPath := Value;
end;

function TAlphaColorProperty.IsAnimated(): Boolean;
begin
  Result := IsAnimatedImpl(FPropertyPath, Designer);
end;

procedure TAlphaColorProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  ValueRect: TRect;
  LControl: TWinControl;
begin
  if Screen.ActiveControl <> nil then
    LControl := Screen.ActiveControl
  else
    LControl := Application.MainForm;
  if (not SameText(Value, SCreateNewColorAnimation)) and
    (not SameText(Value, SCreateNewColorKeyAnimation)) then
    ValueRect := PaintColorBox(Value, ACanvas, Rect(ARect.Left + PropertyDrawingOffset,
    ARect.Top, ARect.Right, ARect.Bottom), ASelected)
  else
    ValueRect := PaintFilmStrip(Value, ACanvas, Rect(ARect.Left + PropertyDrawingOffset,
    ARect.Top, ARect.Right, ARect.Bottom), true);
  ValueRect.Left := ValueRect.Left + LControl.ScaleValue(TIDEThemeMetrics.AlignFactor);
  DefaultPropertyListDrawValue(Value, ACanvas, ValueRect, ASelected);
end;

procedure TAlphaColorProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  AWidth := AWidth + ACanvas.TextHeight('M') {* 2};
end;

procedure TAlphaColorProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
var
  LControl: TWinControl;
begin
  if Screen.ActiveControl <> nil then
    LControl := Screen.ActiveControl
  else
    LControl := Application.MainForm;
  AHeight :=  LControl.ScaleValue(((FilmStripHeight + 2 * FilmStripMargin) div 2 + 1) * 2);
end;

procedure TAlphaColorProperty.PropDrawName(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TAlphaColorProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result := ARect;
end;

function TAlphaColorProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited;
  Result := Result + [paMultiSelect, paDialog, paValueList, paRevertable, paVolatileSubProperties];
  if IsAnimated then
    Result := Result + [paSubProperties];
end;

{ TColorForStateProperty }

function TColorForStateProperty.TextToAlphaColor(const Value: string): TAlphaColor;
var
  S: string;
  State: TFontColorForState;
  I: Integer;
begin
  Result := inherited;
  if (Result = claNull) and (PropCount = 1) then
  begin
    if GetComponent(0) is TFontColorForState then
    begin
      State := TFontColorForState(GetComponent(0));
      S := string(GetPropInfo.Name);
      I := GetEnumValue(TypeInfo(TFontColorForState.TIndex), S);
      Result := State.CurrentColor[TFontColorForState.TIndex(I)];
    end;
  end;
end;

{ TBitmapAnimationProperty }

procedure TBitmapProperty.AddItems(Items: TListItems);
var
  ListItem: TListItem;
begin
  ListItem := Items.Add;
  ListItem.Caption := SCreateNewBitmapAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TBitmapAnimation);

  ListItem := Items.Add;
  ListItem.Caption := SCreateNewBitmapListAnimation;
  ListItem.ImageIndex := -1;
  ListItem.Data := Pointer(TBitmapListAnimation);

  ListItem := TExecutableListItem.Create(Items);
  TExecutableListItem(ListItem).OnExecute := ShowEditDialog;
  Items.AddItem(ListItem);
  ListItem.Caption := SEditItemCaption;
  ListItem.ImageIndex := -1;
end;

procedure TBitmapProperty.ConfigureAnimation(Animation: TAnimation;
  PropertyName: string);
begin
  if Animation is TBitmapAnimation then
    TBitmapAnimation(Animation).PropertyName := PropertyName;
  if Animation is TBitmapListAnimation then
    TBitmapListAnimation(Animation).PropertyName := PropertyName;
end;

procedure TBitmapProperty.Edit(const Host: IPropertyHost;
  Dblclick: Boolean);
var
  LHost20: IPropertyHost20;
begin
  if DblClick then
  begin
    ShowEditDialog;
  end
  else
  begin
    FHost := Host;
    if FAnimationListView <> nil then
      FAnimationListView.Free;

    FAnimationListView := TAnimationListView.Create(nil);
    if Supports(FHost, IPropertyHost20, LHost20) then
      FAnimationListView.Width := LHost20.GetDropDownWidth;
    FAnimationListView.OnConfigureAnimation := ConfigureAnimation;
    FAnimationListView.OnAddItems := AddItems;
    FAnimationListView.Designer := Designer;
    FAnimationListView.Visible := True;
    FHost.DropDownControl(FAnimationListView);
  end;
end;

function TBitmapProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited;
  Result := Result +  [paVolatileSubProperties, paDialog, paReadOnly] - [paValueList, paSortList];
  if IsAnimated then
    Result := Result + [paSubProperties];
end;

procedure TBitmapProperty.GetProperties(Proc: TGetPropProc);
begin
  GetPropertiesImpl(FPropertyPath, Designer, Proc);
end;

function TBitmapProperty.GetValue: string;
var
  Obj: TObject;
  Bitmap: FMX.Graphics.TBitmap;
begin
  Result := '';
  if PropCount > 0 then
  begin
    Obj := TObject(GetOrdValue);
    if Assigned(Obj) and (Obj is FMX.Graphics.TBitmap) then
    begin
      Bitmap := FMX.Graphics.TBitmap(Obj);
      if Bitmap.IsEmpty then
        Result := string.Format(SBitmapSize, [SEmpty])
      else
        Result := string.Format(SBitmapSize,
                               [string.Format(SSize, [Bitmap.Width, Bitmap.Height])]);
    end;
  end;
end;

function TBitmapProperty.isAnimated: Boolean;
begin
  Result := IsAnimatedImpl(FPropertyPath, Designer);
end;

procedure TBitmapProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TBitmapProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result:= ARect;
end;

procedure TBitmapProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    PaintFilmStrip(GetVisualValue, ACanvas, ARect, IsAnimated)
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

function TBitmapProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := PropDrawFilmStripRect(ARect);
end;

procedure TBitmapProperty.SetPropertyPath(const Value: string);
begin
  FPropertyPath := Value;
end;

procedure TBitmapProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do (BorlandIDEServices as INTAIDEUIServices).ShowMessage(E.Message);
  end;
end;

procedure TBitmapProperty.ShowEditDialog;
var
  BitmapDesigner: TBitmapDesigner;
begin
  BitmapDesigner := TBitmapDesigner.Create(nil);
  BitmapDesigner.AssignFromBitmap(FMX.Graphics.TBitmap(GetOrdValue));
  if BitmapDesigner.ShowModal = mrOk then
  begin
    BitmapDesigner.AssignToBitmap(FMX.Graphics.TBitmap(GetOrdValue));
    Modified;
  end;
  BitmapDesigner.Free;
end;

{ TBitmapOfItemProperty }

procedure TBitmapOfItemProperty.Edit;
begin
  inherited;
  ShowEditDialog;
end;

function TBitmapOfItemProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited - [paMultiSelect, paValueList, paSubProperties] + [paDialog, paReadOnly, paValueEditable];
end;

function TBitmapOfItemProperty.GetBitmap: FMX.Graphics.TBitmap;
var
  Obj: TObject;
begin
  Result := nil;
  if PropCount = 1 then
  begin
    Obj := TObject(GetOrdValue);
    if Assigned(Obj) and (Obj is FMX.Graphics.TBitmap) then
      Result := FMX.Graphics.TBitmap(Obj);
  end;
end;

function TBitmapOfItemProperty.GetValue: string;
var
  LBitmap: FMX.Graphics.TBitmap;
begin
  Result := '';
  LBitmap := Bitmap;
  if Assigned(LBitmap) then
  begin
    if LBitmap.IsEmpty then
      Result := string.Format(SBitmapSize, [SEmpty])
    else
      Result := string.Format(SBitmapSize,
                             [string.Format(SSize, [LBitmap.Width, LBitmap.Height])]);
  end;
end;

procedure TBitmapOfItemProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

function TBitmapOfItemProperty.PropDrawNameRect(const ARect: TRect): TRect;
begin
  Result:= ARect;
end;

procedure TBitmapOfItemProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  LBitmap: FMX.Graphics.TBitmap;
  LRect, R: TRectF;
  TmpBitmap: VCL.Graphics.TBitmap;
  Item: TCustomBitmapItem;
begin
  LRect.Create(ARect);
  LRect.Left := LRect.Left + 1;
  LBitmap := Bitmap;
  Item := nil;
  if Assigned(LBitmap) then
  begin
    if (GetComponent(0) is TCustomBitmapItem) then
      Item := TCustomBitmapItem(GetComponent(0))
    else if LBitmap is TBitmapOfItem then
      Item := TBitmapOfItem(LBitmap).BitmapItem;
  end;
  if Assigned(Item) then
  begin
    if not LBitmap.IsEmpty then
    begin
      R.Create(0, 0, LBitmap.Width, LBitmap.Height);
      R.Fit(LRect);
      TmpBitmap := nil;
      CreatePreview(Item,
                    TmpBitmap,
                    TRect.Create(0, 0, Round(R.Width), Round(R.Height)),
                    clWindow,
                    clWindow,
                    8);
      try
        ACanvas.Draw(Round(R.Left), Round(R.Top), TmpBitmap);
      finally
        FreeAndNil(TmpBitmap);
      end;
    end
    else
      DrawEmptyImage(ACanvas, LRect.Round, clGrayText);
  end
  else
    DrawEmptyImage(ACanvas, LRect.Round, clRed);
end;

function TBitmapOfItemProperty.PropDrawValueRect(const ARect: TRect): TRect;
begin
  Result := PropDrawFilmStripRect(ARect);
end;

function TBitmapOfItemProperty.GetEditLimit: Integer;
begin
  Result := MaxIdentLength;
end;

procedure TBitmapOfItemProperty.ShowEditDialog;
var
  BitmapDesigner: TBitmapDesigner;
  LBitmap: FMX.Graphics.TBitmap;
begin
  LBitmap := Bitmap;
  if Assigned(LBitmap) then
  begin
    BitmapDesigner := TBitmapDesigner.Create(nil);
    try
      BitmapDesigner.AssignFromBitmap(LBitmap);
      if BitmapDesigner.ShowModal = mrOk then
      begin
        BitmapDesigner.AssignToBitmap(LBitmap);
        Modified;
      end;
    finally
      BitmapDesigner.Free;
    end;
  end;
end;

{ TColorAnimationVisualizationProperty }

procedure TColorAnimationVisualizationProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  ACanvas.TextRect(ARect, ARect.Left + 2, ARect.Top + 1, GetName);
end;

function TColorAnimationVisualizationProperty.PropDrawNameRect(
  const ARect: TRect): TRect;
begin
  Result := ARect;
end;

procedure TColorAnimationVisualizationProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  ColorAni: TColorAnimation;
  LRect: TRect;
begin
  ColorAni := TColorAnimation(Animation);
  LRect := PaintColorBox(AlphaColorToString(ColorAni.StartValue), ACanvas, ARect, ASelected);
  LRect := PaintTransitionBox(ACanvas, LRect, ColorAni.Loop, ColorAni.AutoReverse);
  LRect := PaintColorBox(AlphaColorToString(ColorAni.StopValue), ACanvas, LRect, ASelected);
end;

function TColorAnimationVisualizationProperty.PropDrawValueRect(
  const ARect: TRect): TRect;
begin
  Result := Rect(ARect.Left, ARect.Top, TransitionMargin * 2 + TransitionWidth +
    (ARect.Bottom - ARect.Top) * 2 + ARect.Left, ARect.Bottom);
end;

{ TFloatAnimationVisualizationProperty }

procedure TFloatAnimationVisualizationProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  ACanvas.TextRect(ARect, ARect.Left + 2, ARect.Top + 1, GetName);
end;

function TFloatAnimationVisualizationProperty.PropDrawNameRect(
  const ARect: TRect): TRect;
begin
   Result:= ARect;
end;

procedure TFloatAnimationVisualizationProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  FloatAni: TFloatAnimation;
  LRect: TRect;
begin
  FloatAni := TFloatAnimation(Animation);
  //calculate text width for start and stop values
  StartValueTextWidth:= ACanvas.TextWidth(Format('%f', [FloatAni.StartValue]));
  StopValueTextWidth:= ACanvas.TextWidth(Format('%f', [FloatAni.StopValue]));

  LRect := PaintFloatValue(Format('%f', [FloatAni.StartValue]), ACanvas, ARect, ASelected);
  LRect := PaintTransitionBox(ACanvas, LRect, FloatAni.Loop, FloatAni.AutoReverse);
  LRect := PaintFloatValue(Format('%f', [FloatAni.StopValue]), ACanvas, LRect, ASelected);
end;

function TFloatAnimationVisualizationProperty.PropDrawValueRect(
  const ARect: TRect): TRect;
begin
  Result := Rect(ARect.Left, ARect.Top, TransitionMargin * 2 + TransitionWidth +
    Round(StartValueTextWidth + StopValueTextWidth) + ARect.Left, ARect.Bottom);
end;

{ TFloatKeyAnimationVisuaLization }

procedure TFloatKeyAnimationVisuaLizationProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  ACanvas.TextRect(ARect, ARect.Left + 2, ARect.Top + 1, GetName);
end;

function TFloatKeyAnimationVisuaLizationProperty.PropDrawNameRect(
  const ARect: TRect): TRect;
begin
  Result:= ARect;
end;

procedure TFloatKeyAnimationVisuaLizationProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  FloatKeyAni: TFloatKeyAnimation;
  LRect: TRect;
begin
  FloatKeyAni := TFloatKeyAnimation(Animation);
  LRect := PaintTransitionBox(ACanvas, ARect, FloatKeyAni.Loop, FloatKeyAni.AutoReverse);
end;

function TFloatKeyAnimationVisuaLizationProperty.PropDrawValueRect(
  const ARect: TRect): TRect;
begin
  Result := Rect(ARect.Left, ARect.Top, TransitionMargin * 2 + TransitionWidth +
     ARect.Left, ARect.Bottom);
end;

initialization

finalization
  FMXBitmap.Free;
  VclBitmap.Free;
end.
