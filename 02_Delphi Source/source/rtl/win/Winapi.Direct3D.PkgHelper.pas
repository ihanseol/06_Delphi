{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Direct3D.PkgHelper;

{$WEAKPACKAGEUNIT OFF}
{$MINENUMSIZE 4}
{$ALIGN ON}

interface

uses
  Winapi.Windows;

var
  DXFileDLL : HMODULE;
  DirectXFileCreate : function
    (out lplpDirectXFile: IInterface): HResult; stdcall;

implementation

uses
  Winapi.Direct3D;

initialization
begin
  DisableFPUExceptions;
  DXFileDLL := LoadLibrary('D3DXOF.DLL');
  DirectXFileCreate := GetProcAddress(DXFileDLL,'DirectXFileCreate');
end;

finalization
begin
  FreeLibrary(DXFileDLL);
end;

end.
