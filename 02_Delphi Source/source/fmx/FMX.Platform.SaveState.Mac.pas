﻿{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.SaveState.Mac;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, FMX.Platform;

type
  /// <summary>Implements <c>IFMXSaveStateService</c> for macOS.</summary>
  TMacSaveStateService = class(TInterfacedObject, IFMXSaveStateService)
  private
    FSaveStateStoragePath: string;
  protected
    function GetSaveStateFileName(const ABlockName: string): string;
  public
    { IFMXSaveStateService }
    function GetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;
    function SetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;
    function GetStoragePath: string;
    procedure SetStoragePath(const ANewPath: string);
    function GetNotifications: Boolean;
  end;

implementation

uses
  System.SysUtils, System.IOUtils;

{ TMacSaveStateService }

function TMacSaveStateService.GetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;

  procedure ReadPersistent(const AFileName: string);
  var
    S: TFileStream;
  begin
    S := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    try
      ABlockData.CopyFrom(S, S.Size);
    finally
      S.Free;
    end;
  end;

var
  LFileName: string;
begin
  if ABlockName.IsEmpty or (ABlockData = nil) then
    Exit(False);
  LFileName := GetSaveStateFileName(ABlockName);
  if not TFile.Exists(LFileName) then
    Exit(False);
  try
    ReadPersistent(LFileName);
  except
    Exit(False);
  end;
  Result := True;
end;

function TMacSaveStateService.GetNotifications: Boolean;
begin
  Result := False;
end;

function TMacSaveStateService.GetSaveStateFileName(const ABlockName: string): string;
const
  Separator = '_';
var
  S: TStringBuilder;
  FilePath: string;
begin
  if FSaveStateStoragePath.IsEmpty then
    FilePath := TPath.GetTempPath
  else
    FilePath := FSaveStateStoragePath;
  S := TStringBuilder.Create(FilePath.Length + Length(Separator) + ABlockName.Length);
  try
    S.Append(FilePath);
    S.Append(ChangeFileExt(ExtractFileName(ParamStr(0)), ''));
    S.Append(Separator);
    S.Append(ABlockName);
    Result := S.ToString(True);
  finally
    S.Free;
  end;
end;

function TMacSaveStateService.GetStoragePath: string;
begin
  Result := FSaveStateStoragePath;
end;

function TMacSaveStateService.SetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;

  procedure WritePersistent(const AFileName: string);
  var
    S: TFileStream;
  begin
    S := TFileStream.Create(AFileName, fmCreate or fmShareExclusive);
    try
      ABlockData.Seek(0, TSeekOrigin.soBeginning);
      S.CopyFrom(ABlockData, ABlockData.Size);
    finally
      S.Free;
    end;
  end;

var
  LFileName: string;
begin
  if ABlockName.IsEmpty then
    Exit(False);
  LFileName := GetSaveStateFileName(ABlockName);
  if (ABlockData = nil) or (ABlockData.Size < 1) then
  begin
    if TFile.Exists(LFileName) then
      TFile.Delete(LFileName);
  end
  else
    try
      WritePersistent(LFileName);
    except
      Exit(False);
    end;
  Result := True;
end;

procedure TMacSaveStateService.SetStoragePath(const ANewPath: string);
begin
  if ANewPath.IsEmpty then
    FSaveStateStoragePath := string.Empty
  else
    FSaveStateStoragePath := IncludeTrailingPathDelimiter(ANewPath);
end;

end.
