{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

Unit Winapi.Windows.PkgHelper;

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT OFF}
{$WARN SYMBOL_PLATFORM OFF}

interface

var
  HtmlHelpModule: NativeUInt = 0;

implementation

const
  kernel32  = 'kernel32.dll';

function FreeLibrary(hLibModule: NativeUInt): Int32; stdcall; external kernel32 name 'FreeLibrary';

initialization
finalization
  if HtmlHelpModule <> 0 then
  begin
    FreeLibrary(HtmlHelpModule);
    HtmlHelpModule := 0;
  end;
end.
