{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.Foundation;

{$WEAKPACKAGEUNIT ON}

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses
  Winapi.Windows,
  Winapi.WinRT,
  System.Types,
  System.Win.WinRT,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type

  // Microsoft.Foundation Records

  // Microsoft.Foundation.WindowsAppSDKContract
  WindowsAppSDKContract = record
  end;
  PWindowsAppSDKContract = ^WindowsAppSDKContract;

implementation

end.
