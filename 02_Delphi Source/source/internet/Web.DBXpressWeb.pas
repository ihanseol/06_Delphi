{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ *************************************************************************** }
{                                                                             }
{ Licensees holding a valid Borland No-Nonsense License for this Software may }
{ use this file in accordance with such license, which appears in the file    }
{ license.txt that came with this Software.                                   }
{                                                                             }
{ *************************************************************************** }

unit Web.DBXpressWeb;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp, Web.HTTPProd, Data.DB, Web.DBWeb, Data.SqlExpr;

type

{ TSQLQueryTableProducer }

  TSQLQueryTableProducer = class(TDSTableProducer)
  private
    FQuery: TSQLQuery;
    procedure SetQuery(AQuery: TSQLQuery);
  protected
    function GetDataSet: TDataSet; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetDataSet(ADataSet: TDataSet); override;
  public
    function Content: string; override;
  published
    property Caption;
    property CaptionAlignment;
    property Columns;
    property Footer;
    property Header;
    property MaxRows;
    property Query: TSQLQuery read FQuery write SetQuery;
    property RowAttributes;
    property TableAttributes;
    property OnCreateContent;
    property OnFormatCell;
    property OnGetTableCaption;
  end;

implementation

{ TSQLQueryTableProducer }

function TSQLQueryTableProducer.Content: string;
var
  Params: TStrings;
  I: Integer;
  Name: string;
  Param: TParam;
begin
  Result := '';
  if FQuery <> nil then
  begin
    FQuery.Close;
    Params := nil;
    if Dispatcher <> nil then
      if Dispatcher.Request.MethodType = mtPost then
        Params := Dispatcher.Request.ContentFields
      else if Dispatcher.Request.MethodType = mtGet then
        Params := Dispatcher.Request.QueryFields;
    if Params <> nil then
      for I := 0 to Params.Count - 1 do
      begin
        Name := Params.Names[I];
        Param := FQuery.Params.ParamByName(Name);
        if Param <> nil then
          Param.Text := Params.Values[Name];
      end;
    FQuery.Open;
    if DoCreateContent then
      Result := Header.Text + HTMLTable(FQuery, Self, MaxRows) + Footer.Text;
  end;
end;

function TSQLQueryTableProducer.GetDataSet: TDataSet;
begin
  Result := FQuery;
end;

procedure TSQLQueryTableProducer.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FQuery) then
    FQuery := nil;
end;

procedure TSQLQueryTableProducer.SetDataSet(ADataSet: TDataSet);
begin
  SetQuery(ADataSet as TSQLQuery);
end;

procedure TSQLQueryTableProducer.SetQuery(AQuery: TSQLQuery);
begin
  if FQuery <> AQuery then
  begin
    if AQuery <> nil then AQuery.FreeNotification(Self);
    FQuery := AQuery;
    InternalDataSource.DataSet := FQuery;
  end;
end;

end.

