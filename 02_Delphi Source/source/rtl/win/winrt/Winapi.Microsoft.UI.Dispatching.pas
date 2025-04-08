{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Microsoft.UI.Dispatching;

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
  Winapi.Microsoft.CommonTypes,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  DispatcherQueueHandler = Winapi.Microsoft.CommonTypes.DispatcherQueueHandler;
  PDispatcherQueueHandler = Winapi.Microsoft.CommonTypes.PDispatcherQueueHandler;
  DispatcherQueuePriority = Winapi.Microsoft.CommonTypes.DispatcherQueuePriority;
  PDispatcherQueuePriority = Winapi.Microsoft.CommonTypes.PDispatcherQueuePriority;
  IDispatcherQueue = Winapi.Microsoft.CommonTypes.IDispatcherQueue;
  PIDispatcherQueue = Winapi.Microsoft.CommonTypes.PIDispatcherQueue;
  IDispatcherQueueShutdownStartingEventArgs = Winapi.Microsoft.CommonTypes.IDispatcherQueueShutdownStartingEventArgs;
  PIDispatcherQueueShutdownStartingEventArgs = Winapi.Microsoft.CommonTypes.PIDispatcherQueueShutdownStartingEventArgs;
  IDispatcherQueueTimer = Winapi.Microsoft.CommonTypes.IDispatcherQueueTimer;
  PIDispatcherQueueTimer = Winapi.Microsoft.CommonTypes.PIDispatcherQueueTimer;
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base;
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = Winapi.Microsoft.CommonTypes.TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs;
  PTypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = Winapi.Microsoft.CommonTypes.PTypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs;

  // Forward declarations for interfaces

  // Microsoft.UI.Dispatching Interfaces

implementation

end.
