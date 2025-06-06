{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
{$IF NOT DECLARED(_PU)}
  {$IFDEF UNDERSCOREIMPORTNAME}
  _PU = '_';
  {$ELSE}
  _PU = '';
  {$ENDIF}
{$ENDIF}
  dispatchlib = '/usr/lib/libSystem.dylib';


function dispatch_semaphore_create(value: LongInt): dispatch_semaphore_t; cdecl;
  external dispatchlib name _PU + 'dispatch_semaphore_create';

function dispatch_semaphore_wait(dsema: dispatch_semaphore_t; timeout: dispatch_time_t): LongInt; cdecl;
  external dispatchlib name _PU + 'dispatch_semaphore_wait';

function dispatch_semaphore_signal(dsema: dispatch_semaphore_t): LongInt; cdecl;
  external dispatchlib name _PU + 'dispatch_semaphore_signal';

procedure dispatch_release(obj: dispatch_object_t); cdecl;
  external dispatchlib name _PU + 'dispatch_release';

function dispatch_time(when: dispatch_time_t; delta: Int64): dispatch_time_t; cdecl;
  external dispatchlib name _PU + 'dispatch_time';

