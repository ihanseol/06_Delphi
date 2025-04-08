{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Metrics;

interface

uses
  System.Generics.Collections, System.Rtti, FMX.Platform;

type
  /// <summary>
  ///   A service for getting the values of platform properties. It is used by components to adjust their work
  ///   to the current operating system settings.
  /// </summary>
  IFMXPlatformPropertiesService = interface
  ['{7CF49B46-FE43-4675-B386-244158474656}']
    /// <summary>Allows you to specify/override a value for a property by name.</summary>
    /// <remarks>The name of the property is case-insensitive.</remarks>
    procedure SetValue(const AName: string; const AValue: TValue);
    /// <summary>
    ///   Allows you to get property value by name. If there are no value for specified property name, it returns
    ///   <c>ADefaultValue</c>.
    /// </summary>
    /// <remarks>The name of the property is case-insensitive.</remarks>
    function GetValue(const AName: string; const ADefaultValue: TValue): TValue;
  end;

  /// <summary>The default implementation of <c>IFMXPlatformPropertiesService</c> service.</summary>
  TDefaultPlatformPropertiesService = class(TInterfacedObject, IFMXPlatformPropertiesService)
  private
    FValues: TDictionary<string, TValue>;
  public
    constructor Create;
    destructor Destroy; override;
    function ToString: string; override;
    { IFMXPlatformPropertiesService }
    procedure SetValue(const AName: string; const AValue: TValue);
    function GetValue(const AName: string; const ADefaultValue: TValue): TValue;
  end;

implementation

uses
  System.SysUtils;

{ TDefaultPlatformPropertiesService }

constructor TDefaultPlatformPropertiesService.Create;
begin
  FValues := TDictionary<string, TValue>.Create;
end;

destructor TDefaultPlatformPropertiesService.Destroy;
begin
  FreeAndNil(FValues);
  inherited;
end;

function TDefaultPlatformPropertiesService.GetValue(const AName: string; const ADefaultValue: TValue): TValue;
begin
  if not FValues.TryGetValue(AName.ToLower, Result) then
    Result := ADefaultValue;
end;

procedure TDefaultPlatformPropertiesService.SetValue(const AName: string; const AValue: TValue);
begin
  FValues.AddOrSetValue(AName.ToLower, AValue);
end;

function TDefaultPlatformPropertiesService.ToString: string;
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    for var Pair in FValues do
      SB.AppendLine(Format('%s=%s', [Pair.Key, Pair.Value.ToString]));
    Result := SB.ToString;
  finally
    SB.Free;
  end;
end;

end.
