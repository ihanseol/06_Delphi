{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.OpenGL.PkgHelper;

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT OFF}

interface

implementation

uses
  System.Math;

begin
  SetExceptionMask([exInvalidOp..exPrecision]);
end.
