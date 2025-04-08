{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.SearchBox.Style;

interface

{$SCOPEDENUMS ON}

uses
  FMX.Edit.Style.New, FMX.Edit, FMX.Controls.Presentation, FMX.Controls;

type

{ TStyledSearchBox }

  TStyledSearchBox = class(TStyledEdit)
  private
    FMagGlass: TEditButton;
    FClearButton: TEditButton;
    procedure RealignButtons;
  protected
    procedure RealignButtonsContainer; override;
    procedure DoTyping; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  end;

implementation

uses
  System.SysUtils, System.UITypes, FMX.SearchBox, FMX.Types, FMX.Presentation.Factory, FMX.Presentation.Style;

{ TStyledSearchBox }

procedure TStyledSearchBox.RealignButtons;
begin
  if (LeftLayout <> nil) and (FMagGlass <> nil) then
    LeftLayout.Width := FMagGlass.Width;
  if (ButtonsLayout <> nil) and (FClearButton <> nil) then
    if Model.Text.IsEmpty then
      ButtonsLayout.Width := 0
    else
      ButtonsLayout.Width := FClearButton.Width;
end;

procedure TStyledSearchBox.RealignButtonsContainer;
begin
  inherited;
  RealignButtons;
end;

procedure TStyledSearchBox.DoTyping;
begin
  inherited;
  RealignButtons;
end;

procedure TStyledSearchBox.ApplyStyle;
begin
  inherited;
  if FindStyleResource<TEditButton>('magglass', FMagGlass) then
    FMagGlass.ApplyStyleLookup;
  if FindStyleResource<TEditButton>('clearbutton', FClearButton) then
  begin
    FClearButton.ApplyStyleLookup;
    FClearButton.Cursor := crArrow;
  end;

  RealignButtonsContainer;
  RealignContent;
end;

procedure TStyledSearchBox.FreeStyle;
begin
  inherited;
  FMagGlass := nil;
  FClearButton := nil;
end;

type
  TFixedStyledSearchBox = class(TStyledSearchBox)
  private
    FIsRealignTextSelectors: Boolean;
  protected
    procedure RecalculateAbsoluteMatrices; override;
  end;

{ TFixedStyledSearchBox }

procedure TFixedStyledSearchBox.RecalculateAbsoluteMatrices;
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
  TPresentationProxyFactory.Current.Register(TSearchBox, TControlType.Styled, TStyledPresentationProxy<TFixedStyledSearchBox>);
finalization
  TPresentationProxyFactory.Current.Unregister(TSearchBox, TControlType.Styled, TStyledPresentationProxy<TFixedStyledSearchBox>);
end.
