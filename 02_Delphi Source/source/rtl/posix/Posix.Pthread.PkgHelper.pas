{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Posix.Pthread.PkgHelper;

{$WEAKPACKAGEUNIT OFF}

interface

var
  HPThread : NativeUInt = 0;

implementation

uses
  Posix.Dlfcn;

initialization

finalization
  if HPThread <> 0 then
    dlclose(HPThread);
end.
