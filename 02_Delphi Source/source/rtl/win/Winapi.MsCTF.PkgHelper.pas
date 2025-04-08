{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.MsCTF.PkgHelper;

{ TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{ WARN SYMBOL_PLATFORM OFF}
{ WRITEABLECONST ON}
{ VARPROPSETTER ON}
{$IFDEF WIN64}
{$ALIGN 8}
{$ELSE}
{$ALIGN 4}
{$ENDIF}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT OFF}
{$WARN SYMBOL_PLATFORM OFF}

interface

var
  // To disable TSF, you can set 0 to this global control variable.
  MsCTFHandle: THandle = 0;

function InitIsMSCTFAvailable: Boolean; forward;
type
  TIsMSCTFAvailable = function: Boolean;
var
  IsMSCTFAvailableFunc: TIsMSCTFAvailable = InitIsMSCTFAvailable;

procedure InitMSCTF;

implementation

uses
  Winapi.Windows,
  System.SysUtils;

const
  MsCTFModName = 'Msctf.dll';

procedure InitMSCTF;
begin
  if MsCTFHandle = 0 then
    MsCTFHandle := SafeLoadLibrary(MsCTFModName);
end;

procedure DoneMSCTF;
begin
  if MsCTFHandle > 0 then
    FreeLibrary(MsCTFHandle);
end;

function MSCTFIsAvailable: Boolean;
begin
  Result := True;
end;

function MSCTFIsNotAvailable: Boolean;
begin
  Result := False;
end;

function InitIsMSCTFAvailable: Boolean;
begin
  if MsCTFHandle = 0 then InitMSCTF;
  if MsCTFHandle > 0 then IsMSCTFAvailableFunc := MSCTFIsAvailable
  else IsMSCTFAvailableFunc := MSCTFIsNotAvailable;
  Result := IsMSCTFAvailableFunc;
end;

initialization
  InitMSCTF;
finalization
  DoneMSCTF;
end.
