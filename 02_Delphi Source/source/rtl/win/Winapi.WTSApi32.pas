{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{          File: wtsapi32.h                             }
{          Copyright (c) Microsoft Corporation.         }
{          All Rights Reserved.                         }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{         Windows Terminal Server public APIs           }
{*******************************************************}

unit Winapi.Wtsapi32;

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}
{$WARN SYMBOL_PLATFORM OFF}

interface

{$HPPEMIT '#include "wtsapi32.h"'}
{$HPPEMIT '#pragma comment(lib, "wtsapi32")'}

uses
  Winapi.Windows;

const
  { Specifies the current server }
  WTS_CURRENT_SERVER = 0;
  {$EXTERNALSYM WTS_CURRENT_SERVER}
  WTS_CURRENT_SERVER_HANDLE = 0;
  {$EXTERNALSYM WTS_CURRENT_SERVER_HANDLE}
  WTS_CURRENT_SERVER_NAME = 0;
  {$EXTERNALSYM WTS_CURRENT_SERVER_NAME}

  { Specifies the current session (SessionId) }
  WTS_CURRENT_SESSION = DWORD(-1);
  {$EXTERNALSYM WTS_CURRENT_SESSION}

  { Specifies any-session (SessionId) }
  WTS_ANY_SESSION = DWORD(-2);
  {$EXTERNALSYM WTS_ANY_SESSION}

  { Possible pResponse values from WTSSendMessage() }
  IDTIMEOUT = 32000;
  {$EXTERNALSYM IDTIMEOUT}
  IDASYNC = 32001;
  {$EXTERNALSYM IDASYNC}

  USERNAME_LENGTH = 20;
  {$EXTERNALSYM USERNAME_LENGTH}
  CLIENTNAME_LENGTH = 20;
  {$EXTERNALSYM CLIENTNAME_LENGTH}
  CLIENTADDRESS_LENGTH = 30;
  {$EXTERNALSYM CLIENTADDRESS_LENGTH}

  { Shutdown flags }
  WTS_WSD_LOGOFF = $00000001;       { log off all users except }
  {$EXTERNALSYM WTS_WSD_LOGOFF}     { current user; deletes }
                                    { WinStations (a reboot is }
                                    { required to recreate the }
                                    { WinStations) }

  WTS_WSD_SHUTDOWN = $00000002;     { shutdown system }
  {$EXTERNALSYM WTS_WSD_SHUTDOWN}
  WTS_WSD_REBOOT = $00000004;       { shutdown and reboot }
  {$EXTERNALSYM WTS_WSD_REBOOT}
  WTS_WSD_POWEROFF = $00000008;     { shutdown and power off (on machines that support power off through software) }
  {$EXTERNALSYM WTS_WSD_POWEROFF}

  WTS_WSD_FASTREBOOT = $00000010;   { reboot without logging users }
  {$EXTERNALSYM WTS_WSD_FASTREBOOT} { off or shutting down }

  MAX_ELAPSED_TIME_LENGTH = 15;
  {$EXTERNALSYM MAX_ELAPSED_TIME_LENGTH}
  MAX_DATE_TIME_LENGTH = 56;
  {$EXTERNALSYM MAX_DATE_TIME_LENGTH}
  WINSTATIONNAME_LENGTH = 32;
  {$EXTERNALSYM WINSTATIONNAME_LENGTH}
  DOMAIN_LENGTH = 17;
  {$EXTERNALSYM DOMAIN_LENGTH}

  WTS_DRIVE_LENGTH = 3;
  {$EXTERNALSYM WTS_DRIVE_LENGTH}
  WTS_LISTENER_NAME_LENGTH = 32;
  {$EXTERNALSYM WTS_LISTENER_NAME_LENGTH}
  WTS_COMMENT_LENGTH = 60;
  {$EXTERNALSYM WTS_COMMENT_LENGTH}

  { Flags for WTSCreateListener }
  WTS_LISTENER_CREATE = $00000001;
  {$EXTERNALSYM WTS_LISTENER_CREATE}
  WTS_LISTENER_UPDATE = $00000010;
  {$EXTERNALSYM WTS_LISTENER_UPDATE}

  { Listener access values }
  WTS_SECURITY_QUERY_INFORMATION = $00000001;
  {$EXTERNALSYM WTS_SECURITY_QUERY_INFORMATION}
  WTS_SECURITY_SET_INFORMATION = $00000002;
  {$EXTERNALSYM WTS_SECURITY_SET_INFORMATION}
  WTS_SECURITY_RESET = $00000004;
  {$EXTERNALSYM WTS_SECURITY_RESET}
  WTS_SECURITY_VIRTUAL_CHANNELS = $00000008;
  {$EXTERNALSYM WTS_SECURITY_VIRTUAL_CHANNELS}
  WTS_SECURITY_REMOTE_CONTROL = $00000010;
  {$EXTERNALSYM WTS_SECURITY_REMOTE_CONTROL}
  WTS_SECURITY_LOGON = $00000020;
  {$EXTERNALSYM WTS_SECURITY_LOGON}
  WTS_SECURITY_LOGOFF = $00000040;
  {$EXTERNALSYM WTS_SECURITY_LOGOFF}
  WTS_SECURITY_MESSAGE = $00000080;
  {$EXTERNALSYM WTS_SECURITY_MESSAGE}
  WTS_SECURITY_CONNECT = $00000100;
  {$EXTERNALSYM WTS_SECURITY_CONNECT}
  WTS_SECURITY_DISCONNECT = $00000200;
  {$EXTERNALSYM WTS_SECURITY_DISCONNECT}

  WTS_SECURITY_GUEST_ACCESS = WTS_SECURITY_LOGON;
  {$EXTERNALSYM WTS_SECURITY_GUEST_ACCESS}

  WTS_SECURITY_CURRENT_GUEST_ACCESS = WTS_SECURITY_VIRTUAL_CHANNELS or WTS_SECURITY_LOGOFF;
  {$EXTERNALSYM WTS_SECURITY_CURRENT_GUEST_ACCESS}

  WTS_SECURITY_USER_ACCESS = WTS_SECURITY_CURRENT_GUEST_ACCESS or WTS_SECURITY_QUERY_INFORMATION or WTS_SECURITY_CONNECT ;
  {$EXTERNALSYM WTS_SECURITY_USER_ACCESS}

  WTS_SECURITY_CURRENT_USER_ACCESS = WTS_SECURITY_SET_INFORMATION or WTS_SECURITY_RESET or
                                               WTS_SECURITY_VIRTUAL_CHANNELS or WTS_SECURITY_LOGOFF or
                                               WTS_SECURITY_DISCONNECT;
  {$EXTERNALSYM WTS_SECURITY_CURRENT_USER_ACCESS}

  WTS_SECURITY_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED or WTS_SECURITY_QUERY_INFORMATION or
                                               WTS_SECURITY_SET_INFORMATION or WTS_SECURITY_RESET or
                                               WTS_SECURITY_VIRTUAL_CHANNELS or    WTS_SECURITY_REMOTE_CONTROL or
                                               WTS_SECURITY_LOGON or
                                               WTS_SECURITY_MESSAGE or
                                               WTS_SECURITY_CONNECT or WTS_SECURITY_DISCONNECT;
  {$EXTERNALSYM WTS_SECURITY_ALL_ACCESS}

  { WTS_CONNECTSTATE_CLASS - Session connect state }

type
  WTS_CONNECTSTATE_CLASS = type Integer;
  {$EXTERNALSYM WTS_CONNECTSTATE_CLASS}

const
  WTSActive       = 0;      { User logged on to WinStation }
  {$EXTERNALSYM WTSActive}
  WTSConnected    = 1;      { WinStation connected to client }
  {$EXTERNALSYM WTSConnected}
  WTSConnectQuery = 2;      { In the process of connecting to client }
  {$EXTERNALSYM WTSConnectQuery}
  WTSShadow       = 3;      { Shadowing another WinStation }
  {$EXTERNALSYM WTSShadow}
  WTSDisconnected = 4;      { WinStation logged on without client }
  {$EXTERNALSYM WTSDisconnected}
  WTSIdle         = 5;      { Waiting for client to connect }
  {$EXTERNALSYM WTSIdle}
  WTSListen       = 6;      { WinStation is listening for connection }
  {$EXTERNALSYM WTSListen}
  WTSReset        = 7;      { WinStation is being reset }
  {$EXTERNALSYM WTSReset}
  WTSDown         = 8;      { WinStation is down due to error }
  {$EXTERNALSYM WTSDown}
  WTSInit         = 9;      { WinStation in initialization }
  {$EXTERNALSYM WTSInit}

{ WTS_SERVER_INFO - returned by WTSEnumerateServers (version 1) }

{ WTSEnumerateServers() returns two variables: pServerInfo and Count.
  The latter is the number of WTS_SERVER_INFO structures contained in
  the former. }

type
  _WTS_SERVER_INFOA = record
    pServerName: LPSTR;   { server name }
  end;
  {$EXTERNALSYM _WTS_SERVER_INFOA}
  _WTS_SERVER_INFOW = record
    pServerName: LPWSTR;   { server name }
  end;
  {$EXTERNALSYM _WTS_SERVER_INFOW}
  WTS_SERVER_INFOA = _WTS_SERVER_INFOA;
  {$EXTERNALSYM WTS_SERVER_INFOA}
  WTS_SERVER_INFOW = _WTS_SERVER_INFOW;
  {$EXTERNALSYM WTS_SERVER_INFOW}
  WTS_SERVER_INFO = WTS_SERVER_INFOW;
  PWTS_SERVER_INFOA = ^WTS_SERVER_INFOA;
  {$EXTERNALSYM PWTS_SERVER_INFOA}
  PWTS_SERVER_INFOW = ^WTS_SERVER_INFOW;
  {$EXTERNALSYM PWTS_SERVER_INFOW}
  PWTS_SERVER_INFO = PWTS_SERVER_INFOW;

{ WTS_SESSION_INFO - returned by WTSEnumerateSessions (version 1) }

{ WTSEnumerateSessions() returns data in a similar format to the above
  WTSEnumerateServers().  It returns two variables: pSessionInfo and
  Count.  The latter is the number of WTS_SESSION_INFO structures
  contained in the former. }

type
  _WTS_SESSION_INFOA = record
    SessionId: DWORD;             { session id }
    pWinStationName: LPSTR;      { name of WinStation this session is connected to }
    State: WTS_CONNECTSTATE_CLASS;{ connection state (see enum) }
  end;
  {$EXTERNALSYM _WTS_SESSION_INFOA}
  _WTS_SESSION_INFOW = record
    SessionId: DWORD;             { session id }
    pWinStationName: LPWSTR;      { name of WinStation this session is connected to }
    State: WTS_CONNECTSTATE_CLASS;{ connection state (see enum) }
  end;
  {$EXTERNALSYM _WTS_SESSION_INFOW}
  WTS_SESSION_INFOA = _WTS_SESSION_INFOA;
  {$EXTERNALSYM WTS_SESSION_INFOA}
  WTS_SESSION_INFOW = _WTS_SESSION_INFOW;
  {$EXTERNALSYM WTS_SESSION_INFOW}
  WTS_SESSION_INFO = WTS_SESSION_INFOW;
  PWTS_SESSION_INFOA = ^WTS_SESSION_INFOA;
  {$EXTERNALSYM PWTS_SESSION_INFOA}
  PWTS_SESSION_INFOW = ^WTS_SESSION_INFOW;
  {$EXTERNALSYM PWTS_SESSION_INFOW}
  PWTS_SESSION_INFO = PWTS_SESSION_INFOW;
  PPWTS_SESSION_INFOA = ^PWTS_SESSION_INFOA;
  PPWTS_SESSION_INFOW = ^PWTS_SESSION_INFOW;
  PPWTS_SESSION_INFO = PPWTS_SESSION_INFOW;

  _WTS_SESSION_INFO_1A = record
    ExecEnvId: DWORD;
    State: WTS_CONNECTSTATE_CLASS;
    SessionId: DWORD;
    pSessionName: LPSTR;
    pHostName: LPSTR;
    pUserName: LPSTR;
    pDomainName: LPSTR;
    pFarmName: LPSTR;
  end;
  {$EXTERNALSYM _WTS_SESSION_INFO_1A}
  _WTS_SESSION_INFO_1W = record
    ExecEnvId: DWORD;
    State: WTS_CONNECTSTATE_CLASS;
    SessionId: DWORD;
    pSessionName: LPWSTR;
    pHostName: LPWSTR;
    pUserName: LPWSTR;
    pDomainName: LPWSTR;
    pFarmName: LPWSTR;
  end;
  {$EXTERNALSYM _WTS_SESSION_INFO_1W}
  WTS_SESSION_INFO_1A = _WTS_SESSION_INFO_1A;
  {$EXTERNALSYM WTS_SESSION_INFO_1A}
  WTS_SESSION_INFO_1W = _WTS_SESSION_INFO_1W;
  {$EXTERNALSYM WTS_SESSION_INFO_1W}
  WTS_SESSION_INFO_1 = WTS_SESSION_INFO_1W;
  PWTS_SESSION_INFO_1A = ^WTS_SESSION_INFO_1A;
  {$EXTERNALSYM PWTS_SESSION_INFO_1A}
  PWTS_SESSION_INFO_1W = ^WTS_SESSION_INFO_1W;
  {$EXTERNALSYM PWTS_SESSION_INFO_1W}
  PWTS_SESSION_INFO_1 = PWTS_SESSION_INFO_1W;

{ WTS_PROCESS_INFO - returned by WTSEnumerateProcesses (version 1) }

{ WTSEnumerateProcesses() also returns data similar to
  WTSEnumerateServers().  It returns two variables: pProcessInfo and
  Count.  The latter is the number of WTS_PROCESS_INFO structures
  contained in the former. }

type
  _WTS_PROCESS_INFOA = record
    SessionId: DWORD;     { session id }
    ProcessId: DWORD;     { process id }
    pProcessName: LPSTR; { name of process }
    pUserSid: PSID;       { user's SID }
  end;
  {$EXTERNALSYM _WTS_PROCESS_INFOA}
  _WTS_PROCESS_INFOW = record
    SessionId: DWORD;     { session id }
    ProcessId: DWORD;     { process id }
    pProcessName: LPWSTR; { name of process }
    pUserSid: PSID;       { user's SID }
  end;
  {$EXTERNALSYM _WTS_PROCESS_INFOW}
  WTS_PROCESS_INFOA = _WTS_PROCESS_INFOA;
  {$EXTERNALSYM WTS_PROCESS_INFOA}
  WTS_PROCESS_INFOW = _WTS_PROCESS_INFOW;
  {$EXTERNALSYM WTS_PROCESS_INFOW}
  WTS_PROCESS_INFO = WTS_PROCESS_INFOW;
  PWTS_PROCESS_INFOA = ^WTS_PROCESS_INFOA;
  {$EXTERNALSYM PWTS_PROCESS_INFOA}
  PWTS_PROCESS_INFOW = ^WTS_PROCESS_INFOW;
  {$EXTERNALSYM PWTS_PROCESS_INFOW}
  PWTS_PROCESS_INFO = PWTS_PROCESS_INFOW;
  PPWTS_PROCESS_INFOA = ^PWTS_PROCESS_INFOA;
  PPWTS_PROCESS_INFOW = ^PWTS_PROCESS_INFOW;
  PPWTS_PROCESS_INFO = PPWTS_PROCESS_INFOW;

{ WTS_INFO_CLASS - WTSQuerySessionInformation
  (See additional typedefs for more info on structures) }

const
  WTS_PROTOCOL_TYPE_CONSOLE = 0;           { Console }
  {$EXTERNALSYM WTS_PROTOCOL_TYPE_CONSOLE}
  WTS_PROTOCOL_TYPE_ICA = 1;               { ICA Protocol }
  {$EXTERNALSYM WTS_PROTOCOL_TYPE_ICA}
  WTS_PROTOCOL_TYPE_RDP = 2;               { RDP Protocol }
  {$EXTERNALSYM WTS_PROTOCOL_TYPE_RDP}

type
  WTS_INFO_CLASS = type Integer;
  {$EXTERNALSYM WTS_INFO_CLASS}
const
  WTSInitialProgram     = 0;
  {$EXTERNALSYM WTSInitialProgram}
  WTSApplicationName    = 1;
  {$EXTERNALSYM WTSApplicationName}
  WTSWorkingDirectory   = 2;
  {$EXTERNALSYM WTSWorkingDirectory}
  WTSOEMId              = 3;
  {$EXTERNALSYM WTSOEMId}
  WTSSessionId          = 4;
  {$EXTERNALSYM WTSSessionId}
  WTSUserName           = 5;
  {$EXTERNALSYM WTSUserName}
  WTSWinStationName     = 6;
  {$EXTERNALSYM WTSWinStationName}
  WTSDomainName         = 7;
  {$EXTERNALSYM WTSDomainName}
  WTSConnectState       = 8;
  {$EXTERNALSYM WTSConnectState}
  WTSClientBuildNumber  = 9;
  {$EXTERNALSYM WTSClientBuildNumber}
  WTSClientName         = 10;
  {$EXTERNALSYM WTSClientName}
  WTSClientDirectory    = 11;
  {$EXTERNALSYM WTSClientDirectory}
  WTSClientProductId    = 12;
  {$EXTERNALSYM WTSClientProductId}
  WTSClientHardwareId   = 13;
  {$EXTERNALSYM WTSClientHardwareId}
  WTSClientAddress      = 14;
  {$EXTERNALSYM WTSClientAddress}
  WTSClientDisplay      = 15;
  {$EXTERNALSYM WTSClientDisplay}
  WTSClientProtocolType = 16;
  {$EXTERNALSYM WTSClientProtocolType}
  WTSIdleTime           = 17;
  {$EXTERNALSYM WTSIdleTime}
  WTSLogonTime          = 18;
  {$EXTERNALSYM WTSLogonTime}
  WTSIncomingBytes      = 19;
  {$EXTERNALSYM WTSIncomingBytes}
  WTSOutgoingBytes      = 20;
  {$EXTERNALSYM WTSOutgoingBytes}
  WTSIncomingFrames     = 21;
  {$EXTERNALSYM WTSIncomingFrames}
  WTSOutgoingFrames     = 22;
  {$EXTERNALSYM WTSOutgoingFrames}
  WTSClientInfo         = 23;
  {$EXTERNALSYM WTSClientInfo}
  WTSSessionInfo        = 24;
  {$EXTERNALSYM WTSSessionInfo}
  WTSSessionInfoEx      = 25;
  {$EXTERNALSYM WTSSessionInfoEx}
  WTSConfigInfo_        = 26; { The original name, WTSConfigInfo, clashes with the record type WTSCONFIGINFO }
  {$EXTERNALSYM WTSConfigInfo}
  WTSValidationInfo     = 27; { Info Class value used to fetch Validation Information through the WTSQuerySessionInformation }
  {$EXTERNALSYM WTSValidationInfo}
  WTSSessionAddressV4   = 28;
  {$EXTERNALSYM WTSSessionAddressV4}
  WTSIsRemoteSession    = 29;
  {$EXTERNALSYM WTSIsRemoteSession}

{ WTS Config Information }

type
  _WTSCONFIGINFOA = record
    version: ULONG;
    fConnectClientDrivesAtLogon: ULONG;
    fConnectPrinterAtLogon: ULONG;
    fDisablePrinterRedirection: ULONG;
    fDisableDefaultMainClientPrinter: ULONG;
    ShadowSettings: ULONG;
    LogonUserName: packed array[0..USERNAME_LENGTH] of AnsiChar;
    LogonDomain: packed array[0..DOMAIN_LENGTH] of AnsiChar;
    WorkDirectory: packed array[0..MAX_PATH] of AnsiChar;
    InitialProgram: packed array[0..MAX_PATH] of AnsiChar;
    ApplicationName: packed array[0..MAX_PATH] of AnsiChar;
  end;
  {$EXTERNALSYM _WTSCONFIGINFOA}
  _WTSCONFIGINFOW = record
    version: ULONG;
    fConnectClientDrivesAtLogon: ULONG;
    fConnectPrinterAtLogon: ULONG;
    fDisablePrinterRedirection: ULONG;
    fDisableDefaultMainClientPrinter: ULONG;
    ShadowSettings: ULONG;
    LogonUserName: packed array[0..USERNAME_LENGTH] of WideChar;
    LogonDomain: packed array[0..DOMAIN_LENGTH] of WideChar;
    WorkDirectory: packed array[0..MAX_PATH] of WideChar;
    InitialProgram: packed array[0..MAX_PATH] of WideChar;
    ApplicationName: packed array[0..MAX_PATH] of WideChar;
  end;
  {$EXTERNALSYM _WTSCONFIGINFOW}
  WTSCONFIGINFOA = _WTSCONFIGINFOA;
  {$EXTERNALSYM WTSCONFIGINFOA}
  WTSCONFIGINFOW = _WTSCONFIGINFOW;
  {$EXTERNALSYM WTSCONFIGINFOW}
  WTSCONFIGINFO = WTSCONFIGINFOW;
  PWTSCONFIGINFOA = ^WTSCONFIGINFOA;
  {$EXTERNALSYM PWTSCONFIGINFOA}
  PWTSCONFIGINFOW = ^WTSCONFIGINFOW;
  {$EXTERNALSYM PWTSCONFIGINFOW}
  PWTSCONFIGINFO = PWTSCONFIGINFOW;

{ WTS Session Information }
  _WTSINFOA = record
    State: WTS_CONNECTSTATE_CLASS;{ connection state (see enum) }
    SessionId: DWORD;            { session id }
    IncomingBytes: DWORD;
    OutgoingBytes: DWORD;
    IncomingFrames: DWORD;
    OutgoingFrames: DWORD;
    IncomingCompressedBytes: DWORD;
    OutgoingCompressedBy: DWORD;
    WinStationName: packed array[0..WINSTATIONNAME_LENGTH-1] of AnsiChar;
    Domain: packed array[0..DOMAIN_LENGTH-1] of AnsiChar;
    UserName: packed array[0..USERNAME_LENGTH] of AnsiChar; { name of WinStation this session is connected to }
    ConnectTime: LARGE_INTEGER;
    DisconnectTime: LARGE_INTEGER;
    LastInputTime: LARGE_INTEGER;
    LogonTime: LARGE_INTEGER;
    CurrentTime: LARGE_INTEGER;
  end;
  {$EXTERNALSYM _WTSINFOA}
  _WTSINFOW = record
    State: WTS_CONNECTSTATE_CLASS;{ connection state (see enum) }
    SessionId: DWORD;            { session id }
    IncomingBytes: DWORD;
    OutgoingBytes: DWORD;
    IncomingFrames: DWORD;
    OutgoingFrames: DWORD;
    IncomingCompressedBytes: DWORD;
    OutgoingCompressedBytes: DWORD;
    WinStationName: packed array[0..WINSTATIONNAME_LENGTH-1] of WideChar;
    Domain: packed array[0..DOMAIN_LENGTH-1] of WideChar;
    UserName: packed array[0..USERNAME_LENGTH] of WideChar; { name of WinStation this session is connected to }
    ConnectTime: LARGE_INTEGER;
    DisconnectTime: LARGE_INTEGER;
    LastInputTime: LARGE_INTEGER;
    LogonTime: LARGE_INTEGER;
    CurrentTime: LARGE_INTEGER;
  end;
  {$EXTERNALSYM _WTSINFOW}
  WTSINFOA = _WTSINFOA;
  {$EXTERNALSYM WTSINFOA}
  WTSINFOW = _WTSINFOW;
  {$EXTERNALSYM WTSINFOW}
  WTSINFO = WTSINFOW;
  PWTSINFOA = ^WTSINFOA;
  {$EXTERNALSYM PWTSINFOA}
  PWTSINFOW = ^WTSINFOW;
  {$EXTERNALSYM PWTSINFOW}
  PWTSINFO = PWTSINFOW;

{ WTS Extended Session State Flags }
const
  WTS_SESSIONSTATE_UNKNOWN = $FFFFFFFF;
  {$EXTERNALSYM WTS_SESSIONSTATE_UNKNOWN}
  WTS_SESSIONSTATE_LOCK = $00000000;
  {$EXTERNALSYM WTS_SESSIONSTATE_LOCK}
  WTS_SESSIONSTATE_UNLOCK = $00000001;
  {$EXTERNALSYM WTS_SESSIONSTATE_UNLOCK}

{ WTS Extended Session Information }
type
  _WTSINFOEX_LEVEL1_A = record
    SessionId: ULONG;
    SessionState: WTS_CONNECTSTATE_CLASS;
    SessionFlags: LONG;
    WinStationName: packed array[0..WINSTATIONNAME_LENGTH] of AnsiChar;
    UserName: packed array[0..USERNAME_LENGTH] of AnsiChar;
    DomainName: packed array[0..DOMAIN_LENGTH] of AnsiChar;
    LogonTime: LARGE_INTEGER;
    ConnectTime: LARGE_INTEGER;
    DisconnectTime: LARGE_INTEGER;
    LastInputTime: LARGE_INTEGER;
    CurrentTime: LARGE_INTEGER;
    IncomingBytes: DWORD;
    OutgoingBytes: DWORD;
    IncomingFrames: DWORD;
    OutgoingFrames: DWORD;
    IncomingCompressedBytes: DWORD;
    OutgoingCompressedBytes: DWORD;
  end;
  {$EXTERNALSYM _WTSINFOEX_LEVEL1_A}
  _WTSINFOEX_LEVEL1_W = record
    SessionId: ULONG;
    SessionState: WTS_CONNECTSTATE_CLASS;
    SessionFlags: LONG;
    WinStationName: packed array[0..WINSTATIONNAME_LENGTH] of WideChar;
    UserName: packed array[0..USERNAME_LENGTH] of WideChar;
    DomainName: packed array[0..DOMAIN_LENGTH] of WideChar;
    LogonTime: LARGE_INTEGER;
    ConnectTime: LARGE_INTEGER;
    DisconnectTime: LARGE_INTEGER;
    LastInputTime: LARGE_INTEGER;
    CurrentTime: LARGE_INTEGER;
    IncomingBytes: DWORD;
    OutgoingBytes: DWORD;
    IncomingFrames: DWORD;
    OutgoingFrames: DWORD;
    IncomingCompressedBytes: DWORD;
    OutgoingCompressedBytes: DWORD;
  end;
  {$EXTERNALSYM _WTSINFOEX_LEVEL1_W}
  WTSINFOEX_LEVEL1_A = _WTSINFOEX_LEVEL1_A;
  {$EXTERNALSYM WTSINFOEX_LEVEL1_A}
  WTSINFOEX_LEVEL1_W = _WTSINFOEX_LEVEL1_W;
  {$EXTERNALSYM WTSINFOEX_LEVEL1_W}
  WTSINFOEX_LEVEL1_ = WTSINFOEX_LEVEL1_W;
  PWTSINFOEX_LEVEL1_A = ^WTSINFOEX_LEVEL1_A;
  {$EXTERNALSYM PWTSINFOEX_LEVEL1_A}
  PWTSINFOEX_LEVEL1_W = ^WTSINFOEX_LEVEL1_W;
  {$EXTERNALSYM PWTSINFOEX_LEVEL1_W}
  PWTSINFOEX_LEVEL1_ = PWTSINFOEX_LEVEL1_W;

  _WTSINFOEX_LEVEL_A = record
    case Integer of
     0: (WTSInfoExLevel1: WTSINFOEX_LEVEL1_A);
  end;
  {$EXTERNALSYM _WTSINFOEX_LEVEL_A}
  _WTSINFOEX_LEVEL_W = record
    case Integer of
     0: (WTSInfoExLevel1: WTSINFOEX_LEVEL1_W);
  end;
  {$EXTERNALSYM _WTSINFOEX_LEVEL_W}
  WTSINFOEX_LEVEL_A = _WTSINFOEX_LEVEL_A;
  {$EXTERNALSYM WTSINFOEX_LEVEL_A}
  WTSINFOEX_LEVEL_W = _WTSINFOEX_LEVEL_W;
  {$EXTERNALSYM WTSINFOEX_LEVEL_W}
  WTSINFOEX_LEVEL_ = WTSINFOEX_LEVEL_W;
  PWTSINFOEX_LEVEL_A = ^WTSINFOEX_LEVEL_A;
  {$EXTERNALSYM PWTSINFOEX_LEVEL_A}
  PWTSINFOEX_LEVEL_W = ^WTSINFOEX_LEVEL_W;
  {$EXTERNALSYM PWTSINFOEX_LEVEL_W}
  PWTSINFOEX_LEVEL_ = PWTSINFOEX_LEVEL_W;

  _WTSINFOEXA = record
    Level: DWORD;
    Data: WTSINFOEX_LEVEL_A;
  end;
  {$EXTERNALSYM _WTSINFOEXA}
  _WTSINFOEXW = record
    Level: DWORD;
    Data: WTSINFOEX_LEVEL_W;
  end;
  {$EXTERNALSYM _WTSINFOEXW}
  WTSINFOEXA = _WTSINFOEXA;
  {$EXTERNALSYM WTSINFOEXA}
  WTSINFOEXW = _WTSINFOEXW;
  {$EXTERNALSYM WTSINFOEXW}
  WTSINFOEX = WTSINFOEXW;
  PWTSINFOEXA = ^WTSINFOEXA;
  {$EXTERNALSYM PWTSINFOEXA}
  PWTSINFOEXW = ^WTSINFOEXW;
  {$EXTERNALSYM PWTSINFOEXW}
  PWTSINFOEX = PWTSINFOEXW;

  { WTS Client Information }
  _WTSCLIENTA = record
    ClientName: packed array[0..CLIENTNAME_LENGTH] of AnsiChar;
    Domain: packed array[0..DOMAIN_LENGTH] of AnsiChar;
    UserName: packed array[0..USERNAME_LENGTH] of AnsiChar;
    WorkDirectory: packed array[0..MAX_PATH] of AnsiChar;
    InitialProgram: packed array[0..MAX_PATH] of AnsiChar;
    EncryptionLevel: BYTE;      { security level of encryption pd }
    ClientAddressFamily: ULONG;
    ClientAddress: packed array[0..CLIENTADDRESS_LENGTH] of USHORT;
    HRes: USHORT;
    VRes: USHORT;
    ColorDepth: USHORT;
    ClientDirectory: packed array[0..MAX_PATH] of AnsiChar;
    ClientBuildNumber: ULONG;
    ClientHardwareId: ULONG;    { client software serial number }
    ClientProductId: USHORT;    { client software product id }
    OutBufCountHost: USHORT;    { number of outbufs on host }
    OutBufCountClient: USHORT;  { number of outbufs on client }
    OutBufLength: USHORT;       { length of outbufs in bytes }
    DeviceId: packed array[0..MAX_PATH] of AnsiChar;
  end;
  {$EXTERNALSYM _WTSCLIENTA}
  _WTSCLIENTW = record
    ClientName: packed array[0..CLIENTNAME_LENGTH] of WideChar;
    Domain: packed array[0..DOMAIN_LENGTH] of WideChar;
    UserName: packed array[0..USERNAME_LENGTH] of WideChar;
    WorkDirectory: packed array[0..MAX_PATH] of WideChar;
    InitialProgram: packed array[0..MAX_PATH] of WideChar;
    EncryptionLevel: BYTE;      { security level of encryption pd }
    ClientAddressFamily: ULONG;
    ClientAddress: packed array[0..CLIENTADDRESS_LENGTH] of USHORT;
    HRes: USHORT;
    VRes: USHORT;
    ColorDepth: USHORT;
    ClientDirectory: packed array[0..MAX_PATH] of WideChar;
    ClientBuildNumber: ULONG;
    ClientHardwareId: ULONG;    { client software serial number }
    ClientProductId: USHORT;    { client software product id }
    OutBufCountHost: USHORT;    { number of outbufs on host }
    OutBufCountClient: USHORT;  { number of outbufs on client }
    OutBufLength: USHORT;       { length of outbufs in bytes }
    DeviceId: packed array[0..MAX_PATH] of WideChar;
  end;
  {$EXTERNALSYM _WTSCLIENTW}
  WTSCLIENTA = _WTSCLIENTA;
  {$EXTERNALSYM WTSCLIENTA}
  WTSCLIENTW = _WTSCLIENTW;
  {$EXTERNALSYM WTSCLIENTW}
  WTSCLIENT = WTSCLIENTW;
  PWTSCLIENTA = ^WTSCLIENTA;
  {$EXTERNALSYM PWTSCLIENTA}
  PWTSCLIENTW = ^WTSCLIENTW;
  {$EXTERNALSYM PWTSCLIENTW}
  PWTSCLIENT = PWTSCLIENTW;

const
{ WTS License Validation Information - Product Information }
  PRODUCTINFO_COMPANYNAME_LENGTH = 256;
  {$EXTERNALSYM PRODUCTINFO_COMPANYNAME_LENGTH}
  PRODUCTINFO_PRODUCTID_LENGTH = 4;
  {$EXTERNALSYM PRODUCTINFO_PRODUCTID_LENGTH}

type
  _WTS_PRODUCT_INFOA = record
    CompanyName: packed array[0..PRODUCTINFO_COMPANYNAME_LENGTH-1] of AnsiChar;
    ProductID: packed array[0..PRODUCTINFO_PRODUCTID_LENGTH-1] of AnsiChar;
  end;
  {$EXTERNALSYM _WTS_PRODUCT_INFOA}
  _WTS_PRODUCT_INFOW = record
    CompanyName: packed array[0..PRODUCTINFO_COMPANYNAME_LENGTH-1] of WideChar;
    ProductID: packed array[0..PRODUCTINFO_PRODUCTID_LENGTH-1] of WideChar;
  end;
  {$EXTERNALSYM _WTS_PRODUCT_INFOW}
  PRODUCT_INFOA = _WTS_PRODUCT_INFOA;
  {$EXTERNALSYM PRODUCT_INFOA}
  PRODUCT_INFOW = _WTS_PRODUCT_INFOW;
  {$EXTERNALSYM PRODUCT_INFOW}
  PRODUCT_INFO = PRODUCT_INFOW;

{ WTS License Validation Information
   This structure will be returned from WTSQuerySessionInformation when the user
   queries for license validation information. }

const
  VALIDATIONINFORMATION_LICENSE_LENGTH = 16384; { 16 Kb }
  {$EXTERNALSYM VALIDATIONINFORMATION_LICENSE_LENGTH}
  VALIDATIONINFORMATION_HARDWAREID_LENGTH = 20;
  {$EXTERNALSYM VALIDATIONINFORMATION_HARDWAREID_LENGTH}

type
  _WTS_VALIDATION_INFORMATIONA = record
    ProductInfo: PRODUCT_INFOA;
    License: packed array[0..VALIDATIONINFORMATION_LICENSE_LENGTH-1] of BYTE;
    LicenseLength: DWORD;
    HardwareID: packed array[0..VALIDATIONINFORMATION_HARDWAREID_LENGTH-1] of BYTE;
    HardwareIDLength: DWORD;
  end;
  {$EXTERNALSYM _WTS_VALIDATION_INFORMATIONA}
  _WTS_VALIDATION_INFORMATIONW = record
    ProductInfo: PRODUCT_INFOW;
    License: packed array[0..VALIDATIONINFORMATION_LICENSE_LENGTH-1] of BYTE;
    LicenseLength: DWORD;
    HardwareID: packed array[0..VALIDATIONINFORMATION_HARDWAREID_LENGTH-1] of BYTE;
    HardwareIDLength: DWORD;
  end;
  {$EXTERNALSYM _WTS_VALIDATION_INFORMATIONW}
  WTS_VALIDATION_INFORMATIONA = _WTS_VALIDATION_INFORMATIONA;
  {$EXTERNALSYM WTS_VALIDATION_INFORMATIONA}
  WTS_VALIDATION_INFORMATIONW = _WTS_VALIDATION_INFORMATIONW;
  {$EXTERNALSYM WTS_VALIDATION_INFORMATIONW}
  WTS_VALIDATION_INFORMATION = WTS_VALIDATION_INFORMATIONW;
  PWTS_VALIDATION_INFORMATIONA = ^WTS_VALIDATION_INFORMATIONA;
  {$EXTERNALSYM PWTS_VALIDATION_INFORMATIONA}
  PWTS_VALIDATION_INFORMATIONW = ^WTS_VALIDATION_INFORMATIONW;
  {$EXTERNALSYM PWTS_VALIDATION_INFORMATIONW}
  PWTS_VALIDATION_INFORMATION = PWTS_VALIDATION_INFORMATIONW;

{ WTSQuerySessionInformation - (WTSClientAddress) }

type
  PWTS_CLIENT_ADDRESS = ^WTS_CLIENT_ADDRESS;
  WTS_CLIENT_ADDRESS = record
    AddressFamily: DWORD; { AF_INET, AF_INET6, AF_IPX, AF_NETBIOS, AF_UNSPEC }
    Address: packed array[0..19] of BYTE;{ client network address }
  end;
  _WTS_CLIENT_ADDRESS = WTS_CLIENT_ADDRESS;
  {$EXTERNALSYM WTS_CLIENT_ADDRESS}
  {$EXTERNALSYM _WTS_CLIENT_ADDRESS}
  {$EXTERNALSYM PWTS_CLIENT_ADDRESS}

{ WTSQuerySessionInformation - (WTSClientDisplay) }

  PWTS_CLIENT_DISPLAY = ^WTS_CLIENT_DISPLAY;
  WTS_CLIENT_DISPLAY = record
    HorizontalResolution: DWORD;{ horizontal dimensions, in pixels }
    VerticalResolution: DWORD;  { vertical dimensions, in pixels }
    ColorDepth: DWORD;          { 1=16, 2=256, 4=64K, 8=16M }
  end;
  _WTS_CLIENT_DISPLAY = WTS_CLIENT_DISPLAY;
  {$EXTERNALSYM WTS_CLIENT_DISPLAY}
  {$EXTERNALSYM _WTS_CLIENT_DISPLAY}
  {$EXTERNALSYM PWTS_CLIENT_DISPLAY}

{ WTS_CONFIG_CLASS - WTSQueryUserConfig/WTSSetUserConfig }

  WTS_CONFIG_CLASS = type Integer;
  {$EXTERNALSYM WTS_CONFIG_CLASS}
const
  WTSUserConfigInitialProgram                = 0; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigInitialProgram}
  WTSUserConfigWorkingDirectory              = 1; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigWorkingDirectory}
  WTSUserConfigfInheritInitialProgram        = 2; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigfInheritInitialProgram}
  WTSUserConfigfAllowLogonTerminalServer     = 3; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigfAllowLogonTerminalServer}

  { Timeout settings }
  WTSUserConfigTimeoutSettingsConnections    = 4; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigTimeoutSettingsConnections}
  WTSUserConfigTimeoutSettingsDisconnections = 5; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigTimeoutSettingsDisconnections}
  WTSUserConfigTimeoutSettingsIdle           = 6; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigTimeoutSettingsIdle}

  { Client device settings }
  WTSUserConfigfDeviceClientDrives           = 7; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigfDeviceClientDrives}
  WTSUserConfigfDeviceClientPrinters         = 8; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigfDeviceClientPrinters}
  WTSUserConfigfDeviceClientDefaultPrinter   = 9; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigfDeviceClientDefaultPrinter}

  { Connection settings }
  WTSUserConfigBrokenTimeoutSettings         = 10; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigBrokenTimeoutSettings}
  WTSUserConfigReconnectSettings             = 11; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigReconnectSettings}

  { Modem settings }
  WTSUserConfigModemCallbackSettings         = 12; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigModemCallbackSettings}
  WTSUserConfigModemCallbackPhoneNumber      = 13; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigModemCallbackPhoneNumber}

  { Shadow settings }
  WTSUserConfigShadowingSettings             = 14; { DWORD returned/expected }
  {$EXTERNALSYM WTSUserConfigShadowingSettings}

  { User Profile settings }
  WTSUserConfigTerminalServerProfilePath     = 15; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigTerminalServerProfilePath}

  { Terminal Server home directory }
  WTSUserConfigTerminalServerHomeDir         = 16; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigTerminalServerHomeDir}
  WTSUserConfigTerminalServerHomeDirDrive    = 17; { string returned/expected }
  {$EXTERNALSYM WTSUserConfigTerminalServerHomeDirDrive}
  WTSUserConfigfTerminalServerRemoteHomeDir  = 18; { DWORD 0:LOCAL 1:REMOTE }
  {$EXTERNALSYM WTSUserConfigfTerminalServerRemoteHomeDir}

  WTSUserConfigUser                          = 19; { returns WTSUSERCONFIG struct }
  {$EXTERNALSYM WTSUserConfigUser}

type
  WTS_CONFIG_SOURCE = type Integer;
  {$EXTERNALSYM WTS_CONFIG_SOURCE}
const
  WTSUserConfigSourceSAM = 0;
  {$EXTERNALSYM WTSUserConfigSourceSAM}

type
  _WTSUSERCONFIGA = record
    Source: DWORD;
    InheritInitialProgram: DWORD;
    AllowLogonTerminalServer: DWORD;
    TimeoutSettingsConnections: DWORD;
    TimeoutSettingsDisconnections: DWORD;
    TimeoutSettingsIdle: DWORD;
    DeviceClientDrives: DWORD;
    DeviceClientPrinters: DWORD;
    ClientDefaultPrinter: DWORD;
    BrokenTimeoutSettings: DWORD;
    ReconnectSettings: DWORD;
    ShadowingSettings: DWORD;
    TerminalServerRemoteHomeDir: DWORD;
    InitialProgram: packed array[0..MAX_PATH] of AnsiChar;
    WorkDirectory: packed array[0..MAX_PATH] of AnsiChar;
    TerminalServerProfilePath: packed array[0..MAX_PATH] of AnsiChar;
    TerminalServerHomeDir: packed array[0..MAX_PATH] of AnsiChar;
    TerminalServerHomeDirDrive: packed array[0..WTS_DRIVE_LENGTH] of AnsiChar;
  end;
  {$EXTERNALSYM _WTSUSERCONFIGA}
  _WTSUSERCONFIGW = record
    Source: DWORD;
    InheritInitialProgram: DWORD;
    AllowLogonTerminalServer: DWORD;
    TimeoutSettingsConnections: DWORD;
    TimeoutSettingsDisconnections: DWORD;
    TimeoutSettingsIdle: DWORD;
    DeviceClientDrives: DWORD;
    DeviceClientPrinters: DWORD;
    ClientDefaultPrinter: DWORD;
    BrokenTimeoutSettings: DWORD;
    ReconnectSettings: DWORD;
    ShadowingSettings: DWORD;
    TerminalServerRemoteHomeDir: DWORD;
    InitialProgram: packed array[0..MAX_PATH] of WideChar;
    WorkDirectory: packed array[0..MAX_PATH] of WideChar;
    TerminalServerProfilePath: packed array[0..MAX_PATH] of WideChar;
    TerminalServerHomeDir: packed array[0..MAX_PATH] of WideChar;
    TerminalServerHomeDirDrive: packed array[0..WTS_DRIVE_LENGTH] of WideChar;
  end;
  {$EXTERNALSYM _WTSUSERCONFIGW}
  WTSUSERCONFIGA = _WTSUSERCONFIGA;
  {$EXTERNALSYM WTSUSERCONFIGA}
  WTSUSERCONFIGW = _WTSUSERCONFIGW;
  {$EXTERNALSYM WTSUSERCONFIGW}
  WTSUSERCONFIG = WTSUSERCONFIGW;
  PWTSUSERCONFIGA = ^WTSUSERCONFIGA;
  {$EXTERNALSYM PWTSUSERCONFIGA}
  PWTSUSERCONFIGW = ^WTSUSERCONFIGW;
  {$EXTERNALSYM PWTSUSERCONFIGW}
  PWTSUSERCONFIG = PWTSUSERCONFIGW;

const
{ WTS_EVENT - Event flags for WTSWaitSystemEvent }

  WTS_EVENT_NONE = $00000000;         { return no event }
  {$EXTERNALSYM WTS_EVENT_NONE}
  WTS_EVENT_CREATE = $00000001;       { new WinStation created }
  {$EXTERNALSYM WTS_EVENT_CREATE}
  WTS_EVENT_DELETE = $00000002;       { existing WinStation deleted }
  {$EXTERNALSYM WTS_EVENT_DELETE}
  WTS_EVENT_RENAME = $00000004;       { existing WinStation renamed }
  {$EXTERNALSYM WTS_EVENT_RENAME}
  WTS_EVENT_CONNECT = $00000008;      { WinStation connect to client }
  {$EXTERNALSYM WTS_EVENT_CONNECT}
  WTS_EVENT_DISCONNECT = $00000010;   { WinStation logged on without client }
  {$EXTERNALSYM WTS_EVENT_DISCONNECT}
  WTS_EVENT_LOGON = $00000020;        { user logged on to existing WinStation }
  {$EXTERNALSYM WTS_EVENT_LOGON}
  WTS_EVENT_LOGOFF = $00000040;       { user logged off from existing WinStation }
  {$EXTERNALSYM WTS_EVENT_LOGOFF}
  WTS_EVENT_STATECHANGE = $00000080;  { WinStation state change }
  {$EXTERNALSYM WTS_EVENT_STATECHANGE}
  WTS_EVENT_LICENSE = $00000100;      { license state change }
  {$EXTERNALSYM WTS_EVENT_LICENSE}
  WTS_EVENT_ALL = $7fffffff;          { wait for all event types }
  {$EXTERNALSYM WTS_EVENT_ALL}
  WTS_EVENT_FLUSH = $80000000;        { unblock all waiters }
  {$EXTERNALSYM WTS_EVENT_FLUSH}

{ Flags for HotkeyModifiers in WTSStartRemoteControlSession }

  REMOTECONTROL_KBDSHIFT_HOTKEY = $1;                 { Shift key }
  {$EXTERNALSYM REMOTECONTROL_KBDSHIFT_HOTKEY}
  REMOTECONTROL_KBDCTRL_HOTKEY = $2;                  { Ctrl key }
  {$EXTERNALSYM REMOTECONTROL_KBDCTRL_HOTKEY}
  REMOTECONTROL_KBDALT_HOTKEY = $4;                   { Alt key }
  {$EXTERNALSYM REMOTECONTROL_KBDALT_HOTKEY}

{ WTS_VIRTUAL_CLASS - WTSVirtualChannelQuery }
type
  WTS_VIRTUAL_CLASS = type Integer;
  {$EXTERNALSYM WTS_VIRTUAL_CLASS}
const
  WTSVirtualClientData = 0; { Virtual channel client module data (C2H data) }
  {$EXTERNALSYM WTSVirtualClientData}
  WTSVirtualFileHandle = 1;
  {$EXTERNALSYM WTSVirtualFileHandle}

{ WTSQuerySessionInformation - (WTSSessionAddress) }

type
  PWTS_SESSION_ADDRESS = ^WTS_SESSION_ADDRESS;
  WTS_SESSION_ADDRESS = record
    AddressFamily: DWORD; { AF_INET only. }
    Address: packed array[0..19] of BYTE;{ client network address }
  end;
  _WTS_SESSION_ADDRESS = WTS_SESSION_ADDRESS;
  {$EXTERNALSYM WTS_SESSION_ADDRESS}
  {$EXTERNALSYM PWTS_SESSION_ADDRESS}

{ Windows Terminal Server public APIs }

function WTSStopRemoteControlSession(LogonId: ULONG): BOOL; stdcall;
{$EXTERNALSYM WTSStopRemoteControlSession}

function WTSStartRemoteControlSession(pTargetServerName: LPWSTR;
  TargetLogonId: ULONG; HotkeyVk: BYTE; HotkeyModifiers: USHORT): BOOL; stdcall;
{$EXTERNALSYM WTSStartRemoteControlSession}
function WTSStartRemoteControlSessionA(pTargetServerName: LPSTR;
  TargetLogonId: ULONG; HotkeyVk: BYTE; HotkeyModifiers: USHORT): BOOL; stdcall;
{$EXTERNALSYM WTSStartRemoteControlSessionA}
function WTSStartRemoteControlSessionW(pTargetServerName: LPWSTR;
  TargetLogonId: ULONG; HotkeyVk: BYTE; HotkeyModifiers: USHORT): BOOL; stdcall;
{$EXTERNALSYM WTSStartRemoteControlSessionW}

function WTSConnectSession(LogonId: ULONG; TargetLogonId: ULONG; pPassword: LPWSTR; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSConnectSession}
function WTSConnectSessionA(LogonId: ULONG; TargetLogonId: ULONG; pPassword: LPSTR; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSConnectSessionA}
function WTSConnectSessionW(LogonId: ULONG; TargetLogonId: ULONG; pPassword: LPWSTR; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSConnectSessionW}

function WTSEnumerateServers(pDomainName: LPWSTR;
  Reserved: DWORD; Version: DWORD; out pServerInfo: PWTS_SERVER_INFO; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateServers}
function WTSEnumerateServersA(pDomainName: LPSTR;
  Reserved: DWORD; Version: DWORD; out pServerInfo: PWTS_SERVER_INFOA; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateServersA}
function WTSEnumerateServersW(pDomainName: LPWSTR;
  Reserved: DWORD; Version: DWORD; out pServerInfo: PWTS_SERVER_INFOW; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateServersW}

{ ------------------------------------------------ }

function WTSOpenServer(pServerName: LPWSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServer}
function WTSOpenServerA(pServerName: LPSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServerA}
function WTSOpenServerW(pServerName: LPWSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServerW}

function WTSOpenServerEx(pServerName: LPWSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServerEx}
function WTSOpenServerExA(pServerName: LPSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServerExA}
function WTSOpenServerExW(pServerName: LPWSTR): THandle; stdcall;
{$EXTERNALSYM WTSOpenServerExW}

{ ------------------------------------------------ }

procedure WTSCloseServer(hServer: THandle); stdcall;
{$EXTERNALSYM WTSCloseServer}

{ ------------------------------------------------ }

function WTSEnumerateSessions(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pSessionInfo: PWTS_SESSION_INFO; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessions}
function WTSEnumerateSessionsA(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pSessionInfo: PWTS_SESSION_INFOA; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessionsA}
function WTSEnumerateSessionsW(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pSessionInfo: PWTS_SESSION_INFOW; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessionsW}

function WTSEnumerateSessionsEx(hServer: THandle; var pLevel: DWORD; Filter: DWORD;
  out pSessionInfo: PWTS_SESSION_INFO_1; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessionsEx}
function WTSEnumerateSessionsExA(hServer: THandle; var pLevel: DWORD; Filter: DWORD;
  out pSessionInfo: PWTS_SESSION_INFO_1A; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessionsExA}
function WTSEnumerateSessionsExW(hServer: THandle; var pLevel: DWORD; Filter: DWORD;
  out pSessionInfo: PWTS_SESSION_INFO_1W; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateSessionsExW}

{ ------------------------------------------------ }

function WTSEnumerateProcesses(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pProcessInfo: PWTS_PROCESS_INFO; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcesses}
function WTSEnumerateProcessesA(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pProcessInfo: PWTS_PROCESS_INFOA; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcessesA}
function WTSEnumerateProcessesW(hServer: THandle; Reserved: DWORD;
  Version: DWORD; out pProcessInfo: PWTS_PROCESS_INFOW; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcessesW}

{ ------------------------------------------------ }

function WTSTerminateProcess(hServer: THandle; ProcessId: DWORD; ExitCode: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSTerminateProcess}

{ ------------------------------------------------ }

function WTSQuerySessionInformation(hServer: THandle; SessionId: DWORD; WTSInfoClass: WTS_INFO_CLASS;
  out pBuffer: LPWSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQuerySessionInformation}
function WTSQuerySessionInformationA(hServer: THandle; SessionId: DWORD; WTSInfoClass: WTS_INFO_CLASS;
  out pBuffer: LPSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQuerySessionInformationA}
function WTSQuerySessionInformationW(hServer: THandle; SessionId: DWORD; WTSInfoClass: WTS_INFO_CLASS;
  out pBuffer: LPWSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQuerySessionInformationW}

{ ------------------------------------------------ }

function WTSQueryUserConfig(pServerName: LPWSTR; pUserName: LPWSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  out pBuffer: LPWSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQueryUserConfig}
function WTSQueryUserConfigA(pServerName: LPWSTR; pUserName: LPSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  out pBuffer: LPSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQueryUserConfigA}
function WTSQueryUserConfigW(pServerName: LPWSTR; pUserName: LPWSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  out pBuffer: LPWSTR; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSQueryUserConfigW}

{ ------------------------------------------------ }

function WTSSetUserConfig(pServerName: LPWSTR; pUserName: LPWSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  pBuffer: LPWSTR; DataLength: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSSetUserConfig}
function WTSSetUserConfigA(pServerName: LPSTR; pUserName: LPSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  pBuffer: LPSTR; DataLength: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSSetUserConfigA}
function WTSSetUserConfigW(pServerName: LPWSTR; pUserName: LPWSTR; WTSConfigClass: WTS_CONFIG_CLASS;
  pBuffer: LPWSTR; DataLength: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSSetUserConfigW}

{ ------------------------------------------------ }

function WTSSendMessage(hServer: THandle; SessionId: DWORD; pTitle: LPWSTR; TitleLength: DWORD; pMessage: LPWSTR;
  MessageLength: DWORD; Style: DWORD; Timeout: DWORD; out Response: DWORD; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSSendMessage}
function WTSSendMessageA(hServer: THandle; SessionId: DWORD; pTitle: LPSTR; TitleLength: DWORD; pMessage: LPSTR;
  MessageLength: DWORD; Style: DWORD; Timeout: DWORD; out Response: DWORD; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSSendMessageA}
function WTSSendMessageW(hServer: THandle; SessionId: DWORD; pTitle: LPWSTR; TitleLength: DWORD; pMessage: LPWSTR;
  MessageLength: DWORD; Style: DWORD; Timeout: DWORD; out Response: DWORD; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSSendMessageW}

{ ------------------------------------------------ }

function WTSDisconnectSession(hServer: THandle; SessionId: DWORD; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSDisconnectSession}

{ ------------------------------------------------ }

function WTSLogoffSession(hServer: THandle; SessionId: DWORD; bWait: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSLogoffSession}

{ ------------------------------------------------ }

function WTSShutdownSystem(hServer: THandle; ShutdownFlag: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSShutdownSystem}

{ ------------------------------------------------ }

function WTSWaitSystemEvent(hServer: THandle; EventMask: DWORD; out pEventFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSWaitSystemEvent}

{ ------------------------------------------------ }

function WTSVirtualChannelOpen(hServer: THandle; SessionId: DWORD; pVirtualName: LPSTR): THandle; stdcall;
{$EXTERNALSYM WTSVirtualChannelOpen}

const
  WTS_CHANNEL_OPTION_DYNAMIC = $00000001;            { dynamic channel }
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC}
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW = $00000000;    { priorities }
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW}
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED = $00000002;
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED}
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH = $00000004;
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH}
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL = $00000006;
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL}
  WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS = $00000008;
  {$EXTERNALSYM WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS}

function WTSVirtualChannelOpenEx(SessionId: DWORD; pVirtualName: LPSTR; flags: DWORD): THandle; stdcall;
{$EXTERNALSYM WTSVirtualChannelOpenEx}

function WTSVirtualChannelClose(hChannelHandle: THandle): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelClose}

function WTSVirtualChannelRead(hChannelHandle : THandle; TimeOut: ULONG; Buffer: LPSTR;
  BufferSize: ULONG; out BytesRead: DWord): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelRead}

function WTSVirtualChannelWrite(hChannelHandle : THandle; Buffer: LPSTR;
  Length: ULONG; out BytesWritten: DWord): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelWrite}

function WTSVirtualChannelPurgeInput(hChannelHandle: THandle): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelPurgeInput}

function WTSVirtualChannelPurgeOutput(hChannelHandle: THandle): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelPurgeOutput}

function WTSVirtualChannelQuery(hChannelHandle: THandle;
  p2: WTS_VIRTUAL_CLASS; out pBuffer: PVOID; out BytesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSVirtualChannelQuery}

{ ------------------------------------------------ }

procedure WTSFreeMemory(pMemory: PVOID); stdcall;
{$EXTERNALSYM WTSFreeMemory}

{ Flags for Console Notification }

const
  NOTIFY_FOR_ALL_SESSIONS = 1;
  {$EXTERNALSYM NOTIFY_FOR_ALL_SESSIONS}
  NOTIFY_FOR_THIS_SESSION = 0;
  {$EXTERNALSYM NOTIFY_FOR_THIS_SESSION}

function WTSRegisterSessionNotification(hWnd: HWND; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSRegisterSessionNotification}

function WTSUnRegisterSessionNotification(hWnd: HWND): BOOL; stdcall;
{$EXTERNALSYM WTSUnRegisterSessionNotification}

function WTSRegisterSessionNotificationEx(hServer: THandle; hWnd: HWND; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSRegisterSessionNotificationEx}

function WTSUnRegisterSessionNotificationEx(hServer: THandle; hWnd: HWND): BOOL; stdcall;
{$EXTERNALSYM WTSUnRegisterSessionNotificationEx}

function WTSQueryUserToken(SessionId: ULONG; out hToken: THandle): BOOL; stdcall;
{$EXTERNALSYM WTSQueryUserToken}

const
  WTS_PROCESS_INFO_LEVEL_0 = 0;
  {$EXTERNALSYM WTS_PROCESS_INFO_LEVEL_0}
  WTS_PROCESS_INFO_LEVEL_1 = 1;
  {$EXTERNALSYM WTS_PROCESS_INFO_LEVEL_1}

{ WTS_PROCESS_INFO_EX - returned by WTSEnumerateProcessesEX }

type
  _WTS_PROCESS_INFO_EXA = record
    SessionId: DWORD;
    ProcessId: DWORD;
    pProcessName: LPSTR;
    pUserSid: PSID;
    NumberOfThreads: DWORD;
    HandleCount: DWORD;
    PagefileUsage: DWORD;
    PeakPagefileUsage: DWORD;
    WorkingSetSize: DWORD;
    PeakWorkingSetSize: DWORD;
    UserTime: LARGE_INTEGER;
    KernelTime: LARGE_INTEGER;
  end;
  {$EXTERNALSYM _WTS_PROCESS_INFO_EXA}
  _WTS_PROCESS_INFO_EXW = record
    SessionId: DWORD;
    ProcessId: DWORD;
    pProcessName: LPWSTR;
    pUserSid: PSID;
    NumberOfThreads: DWORD;
    HandleCount: DWORD;
    PagefileUsage: DWORD;
    PeakPagefileUsage: DWORD;
    WorkingSetSize: DWORD;
    PeakWorkingSetSize: DWORD;
    UserTime: LARGE_INTEGER;
    KernelTime: LARGE_INTEGER;
  end;
  {$EXTERNALSYM _WTS_PROCESS_INFO_EXW}
  WTS_PROCESS_INFO_EXA = _WTS_PROCESS_INFO_EXA;
  {$EXTERNALSYM WTS_PROCESS_INFO_EXA}
  WTS_PROCESS_INFO_EXW = _WTS_PROCESS_INFO_EXW;
  {$EXTERNALSYM WTS_PROCESS_INFO_EXW}
  WTS_PROCESS_INFO_EX = WTS_PROCESS_INFO_EXW;
  PWTS_PROCESS_INFO_EXA = ^WTS_PROCESS_INFO_EXA;
  {$EXTERNALSYM PWTS_PROCESS_INFO_EXA}
  PWTS_PROCESS_INFO_EXW = ^WTS_PROCESS_INFO_EXW;
  {$EXTERNALSYM PWTS_PROCESS_INFO_EXW}
  PWTS_PROCESS_INFO_EX = PWTS_PROCESS_INFO_EXW;

{ ------------------------------------------------ }

type
  WTS_TYPE_CLASS = type Integer;
  {$EXTERNALSYM WTS_TYPE_CLASS}
const
  WTSTypeProcessInfoLevel0 = 0;
  {$EXTERNALSYM WTSTypeProcessInfoLevel0}
  WTSTypeProcessInfoLevel1 = 1;
  {$EXTERNALSYM WTSTypeProcessInfoLevel1}
  WTSTypeSessionInfoLevel1 = 2;
  {$EXTERNALSYM WTSTypeSessionInfoLevel1}

function WTSFreeMemoryEx(WTSTypeClass: WTS_TYPE_CLASS; pMemory: PVOID; NumberOfEntries: ULONG): BOOL; stdcall;
{$EXTERNALSYM WTSFreeMemoryEx}
function WTSFreeMemoryExA(WTSTypeClass: WTS_TYPE_CLASS; pMemory: PVOID; NumberOfEntries: ULONG): BOOL; stdcall;
{$EXTERNALSYM WTSFreeMemoryExA}
function WTSFreeMemoryExW(WTSTypeClass: WTS_TYPE_CLASS; pMemory: PVOID; NumberOfEntries: ULONG): BOOL; stdcall;
{$EXTERNALSYM WTSFreeMemoryExW}

{ ------------------------------------------------ }

function WTSEnumerateProcessesEx(hServer: THandle; var Level: DWORD;
  SessionId: DWORD; out pProcessInfo: LPWSTR; out Count: DWord): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcessesEx}
function WTSEnumerateProcessesExA(hServer: THandle; var Level: DWORD;
  SessionId: DWORD; out pProcessInfo: LPSTR; out Count: DWord): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcessesExA}
function WTSEnumerateProcessesExW(hServer: THandle; var Level: DWORD;
  SessionId: DWORD; out pProcessInfo: LPWSTR; out Count: DWord): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateProcessesExW}

{ ------------------------------------------------ }
{ Listener management APIs }

type
  WTSLISTENERNAMEA = packed array[0..WTS_LISTENER_NAME_LENGTH-1] of AnsiChar;
  {$EXTERNALSYM WTSLISTENERNAMEA}
  WTSLISTENERNAMEW = packed array[0..WTS_LISTENER_NAME_LENGTH-1] of WideChar;
  {$EXTERNALSYM WTSLISTENERNAMEW}
  WTSLISTENERNAME = WTSLISTENERNAMEW;
  PWTSLISTENERNAMEA = ^WTSLISTENERNAMEA;
  {$EXTERNALSYM PWTSLISTENERNAMEA}
  PWTSLISTENERNAMEW = ^WTSLISTENERNAMEW;
  {$EXTERNALSYM PWTSLISTENERNAMEW}
  PWTSLISTENERNAME = PWTSLISTENERNAMEW;

function WTSEnumerateListeners(hServer: THandle;
  pReserved: PVOID; Reserved: DWORD; pListeners: PWTSLISTENERNAME; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateListeners}
function WTSEnumerateListenersA(hServer: THandle;
  pReserved: PVOID; Reserved: DWORD; pListeners: PWTSLISTENERNAMEA; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateListenersA}
function WTSEnumerateListenersW(hServer: THandle;
  pReserved: PVOID; Reserved: DWORD; pListeners: PWTSLISTENERNAMEW; out Count: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSEnumerateListenersW}

{ ------------------------------------------------ }
{ Listener Config, used by WTSQueryListenerConfig and WTSCreateListener }

type
  _WTSLISTENERCONFIGA = record
    version: ULONG;
    fEnableListener: ULONG;
    MaxConnectionCount: ULONG;
    fPromptForPassword: ULONG;
    fInheritColorDepth: ULONG;
    ColorDepth: ULONG;
    fInheritBrokenTimeoutSettings: ULONG;
    BrokenTimeoutSettings: ULONG;

    fDisablePrinterRedirection: ULONG;
    fDisableDriveRedirection: ULONG;
    fDisableComPortRedirection: ULONG;
    fDisableLPTPortRedirection: ULONG;
    fDisableClipboardRedirection: ULONG;
    fDisableAudioRedirection: ULONG;
    fDisablePNPRedirection: ULONG;
    fDisableDefaultMainClientPrinter: ULONG;

    LanAdapter: ULONG;
    PortNumber: ULONG;

    fInheritShadowSettings: ULONG;
    ShadowSettings: ULONG;

    TimeoutSettingsConnection: ULONG;
    TimeoutSettingsDisconnection: ULONG;
    TimeoutSettingsIdle: ULONG;

    SecurityLayer: ULONG;
    MinEncryptionLevel: ULONG;
    UserAuthentication: ULONG;

    Comment: packed array[0..WTS_COMMENT_LENGTH] of AnsiChar;
    LogonUserName: packed array[0..USERNAME_LENGTH] of AnsiChar;
    LogonDomain: packed array[0..DOMAIN_LENGTH] of AnsiChar;

    WorkDirectory: packed array[0..MAX_PATH] of AnsiChar;
    InitialProgram: packed array[0..MAX_PATH] of AnsiChar;
  end;
  {$EXTERNALSYM _WTSLISTENERCONFIGA}
  _WTSLISTENERCONFIGW = record
    version: ULONG;
    fEnableListener: ULONG;
    MaxConnectionCount: ULONG;
    fPromptForPassword: ULONG;
    fInheritColorDepth: ULONG;
    ColorDepth: ULONG;
    fInheritBrokenTimeoutSettings: ULONG;
    BrokenTimeoutSettings: ULONG;

    fDisablePrinterRedirection: ULONG;
    fDisableDriveRedirection: ULONG;
    fDisableComPortRedirection: ULONG;
    fDisableLPTPortRedirection: ULONG;
    fDisableClipboardRedirection: ULONG;
    fDisableAudioRedirection: ULONG;
    fDisablePNPRedirection: ULONG;
    fDisableDefaultMainClientPrinter: ULONG;

    LanAdapter: ULONG;
    PortNumber: ULONG;

    fInheritShadowSettings: ULONG;
    ShadowSettings: ULONG;

    TimeoutSettingsConnection: ULONG;
    TimeoutSettingsDisconnection: ULONG;
    TimeoutSettingsIdle: ULONG;

    SecurityLayer: ULONG;
    MinEncryptionLevel: ULONG;
    UserAuthentication: ULONG;

    Comment: packed array[0..WTS_COMMENT_LENGTH] of WideChar;
    LogonUserName: packed array[0..USERNAME_LENGTH] of WideChar;
    LogonDomain: packed array[0..DOMAIN_LENGTH] of WideChar;

    WorkDirectory: packed array[0..MAX_PATH] of WideChar;
    InitialProgram: packed array[0..MAX_PATH] of WideChar;
  end;
  {$EXTERNALSYM _WTSLISTENERCONFIGW}
  WTSLISTENERCONFIGA = _WTSLISTENERCONFIGA;
  {$EXTERNALSYM WTSLISTENERCONFIGA}
  WTSLISTENERCONFIGW = _WTSLISTENERCONFIGW;
  {$EXTERNALSYM WTSLISTENERCONFIGW}
  WTSLISTENERCONFIG = WTSLISTENERCONFIGW;
  PWTSLISTENERCONFIGA = ^WTSLISTENERCONFIGA;
  {$EXTERNALSYM PWTSLISTENERCONFIGA}
  PWTSLISTENERCONFIGW = ^WTSLISTENERCONFIGW;
  {$EXTERNALSYM PWTSLISTENERCONFIGW}
  PWTSLISTENERCONFIG = PWTSLISTENERCONFIGW;

function WTSQueryListenerConfig(hServer: THandle; pReserved: PVOID; Reserved: DWORD;
  pListenerName: LPWSTR; out Buffer: WTSLISTENERCONFIG): BOOL; stdcall;
{$EXTERNALSYM WTSQueryListenerConfig}
function WTSQueryListenerConfigA(hServer: THandle; pReserved: PVOID; Reserved: DWORD;
  pListenerName: LPSTR; out Buffer: WTSLISTENERCONFIGA): BOOL; stdcall;
{$EXTERNALSYM WTSQueryListenerConfigA}
function WTSQueryListenerConfigW(hServer: THandle; pReserved: PVOID; Reserved: DWORD;
  pListenerName: LPWSTR; out Buffer: WTSLISTENERCONFIGW): BOOL; stdcall;
{$EXTERNALSYM WTSQueryListenerConfigW}

function WTSCreateListener(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  pBuffer: PWTSLISTENERCONFIG; flag: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSCreateListener}
function WTSCreateListenerA(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPSTR;
  pBuffer: PWTSLISTENERCONFIGA; flag: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSCreateListenerA}
function WTSCreateListenerW(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  pBuffer: PWTSLISTENERCONFIGW; flag: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSCreateListenerW}

function WTSSetListenerSecurity(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR): BOOL; stdcall;
{$EXTERNALSYM WTSSetListenerSecurity}
function WTSSetListenerSecurityA(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR): BOOL; stdcall;
{$EXTERNALSYM WTSSetListenerSecurityA}
function WTSSetListenerSecurityW(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR): BOOL; stdcall;
{$EXTERNALSYM WTSSetListenerSecurityW}

function WTSGetListenerSecurity(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR;
  nLength: DWORD; out LengthNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSGetListenerSecurity}
function WTSGetListenerSecurityA(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR;
  nLength: DWORD; out LengthNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSGetListenerSecurityA}
function WTSGetListenerSecurityW(hServer: THandle; pReserved: PVOID; Reserved: DWORD; pListenerName: LPWSTR;
  SecurityInformation: SECURITY_INFORMATION; pSecurityDescriptor: PSECURITY_DESCRIPTOR;
  nLength: DWORD; out LengthNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM WTSGetListenerSecurityW}

function WTSEnableChildSessions(bEnable: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSEnableChildSessions}

function WTSIsChildSessionsEnabled(var pbEnabled: BOOL): BOOL; stdcall;
{$EXTERNALSYM WTSIsChildSessionsEnabled}

function WTSGetChildSessionId(var pSessionId: ULONG): BOOL; stdcall;
{$EXTERNALSYM WTSGetChildSessionId}

implementation

const
  ModName = 'WTSAPI32.DLL';

procedure WTSCloseServer; external ModName name 'WTSCloseServer';
function WTSConnectSession; external ModName name 'WTSConnectSessionW';
function WTSConnectSessionA; external ModName name 'WTSConnectSessionA';
function WTSConnectSessionW; external ModName name 'WTSConnectSessionW';
function WTSCreateListener; external ModName name 'WTSCreateListenerW';
function WTSCreateListenerA; external ModName name 'WTSCreateListenerA';
function WTSCreateListenerW; external ModName name 'WTSCreateListenerW';
function WTSDisconnectSession; external ModName name 'WTSDisconnectSession';
function WTSEnableChildSessions; external ModName name 'WTSEnableChildSessions';
function WTSEnumerateListeners; external ModName name 'WTSEnumerateListenersW';
function WTSEnumerateListenersA; external ModName name 'WTSEnumerateListenersA';
function WTSEnumerateListenersW; external ModName name 'WTSEnumerateListenersW';
function WTSEnumerateProcesses; external ModName name 'WTSEnumerateProcessesW';
function WTSEnumerateProcessesA; external ModName name 'WTSEnumerateProcessesA';
function WTSEnumerateProcessesW; external ModName name 'WTSEnumerateProcessesW';
function WTSEnumerateServers; external ModName name 'WTSEnumerateServersW';
function WTSEnumerateServersA; external ModName name 'WTSEnumerateServersA';
function WTSEnumerateServersW; external ModName name 'WTSEnumerateServersW';
function WTSEnumerateSessions; external ModName name 'WTSEnumerateSessionsW';
function WTSEnumerateSessionsA; external ModName name 'WTSEnumerateSessionsA';
function WTSEnumerateSessionsW; external ModName name 'WTSEnumerateSessionsW';
function WTSEnumerateSessionsEx; external ModName name 'WTSEnumerateSessionsExW';
function WTSEnumerateSessionsExA; external ModName name 'WTSEnumerateSessionsExA';
function WTSEnumerateSessionsExW; external ModName name 'WTSEnumerateSessionsExW';
procedure WTSFreeMemory; external ModName name 'WTSFreeMemory';
function WTSFreeMemoryEx; external ModName name 'WTSFreeMemoryExW';
function WTSFreeMemoryExA; external ModName name 'WTSFreeMemoryExA';
function WTSFreeMemoryExW; external ModName name 'WTSFreeMemoryExW';
function WTSEnumerateProcessesEx; external ModName name 'WTSEnumerateProcessesExW';
function WTSEnumerateProcessesExA; external ModName name 'WTSEnumerateProcessesExA';
function WTSEnumerateProcessesExW; external ModName name 'WTSEnumerateProcessesExW';
function WTSGetChildSessionId; external ModName name 'WTSGetChildSessionId';
function WTSGetListenerSecurity; external ModName name 'WTSGetListenerSecurityW';
function WTSGetListenerSecurityA; external ModName name 'WTSGetListenerSecurityA';
function WTSGetListenerSecurityW; external ModName name 'WTSGetListenerSecurityW';
function WTSIsChildSessionsEnabled; external ModName name 'WTSIsChildSessionsEnabled';
function WTSLogoffSession; external ModName name 'WTSLogoffSession';
function WTSOpenServer; external ModName name 'WTSOpenServerW';
function WTSOpenServerA; external ModName name 'WTSOpenServerA';
function WTSOpenServerW; external ModName name 'WTSOpenServerW';
function WTSOpenServerEx; external ModName name 'WTSOpenServerExW';
function WTSOpenServerExA; external ModName name 'WTSOpenServerExA';
function WTSOpenServerExW; external ModName name 'WTSOpenServerExW';
function WTSQueryListenerConfig; external ModName name 'WTSQueryListenerConfigW';
function WTSQueryListenerConfigA; external ModName name 'WTSQueryListenerConfigA';
function WTSQueryListenerConfigW; external ModName name 'WTSQueryListenerConfigW';
function WTSQuerySessionInformation; external ModName name 'WTSQuerySessionInformationW';
function WTSQuerySessionInformationA; external ModName name 'WTSQuerySessionInformationA';
function WTSQuerySessionInformationW; external ModName name 'WTSQuerySessionInformationW';
function WTSQueryUserConfig; external ModName name 'WTSQueryUserConfigW';
function WTSQueryUserConfigA; external ModName name 'WTSQueryUserConfigA';
function WTSQueryUserConfigW; external ModName name 'WTSQueryUserConfigW';
function WTSQueryUserToken; external ModName name 'WTSQueryUserToken';
function WTSRegisterSessionNotification; external ModName name 'WTSRegisterSessionNotification';
function WTSRegisterSessionNotificationEx; external ModName name 'WTSRegisterSessionNotificationEx';
function WTSSendMessage; external ModName name 'WTSSendMessageW';
function WTSSendMessageA; external ModName name 'WTSSendMessageA';
function WTSSendMessageW; external ModName name 'WTSSendMessageW';
function WTSSetListenerSecurity; external ModName name 'WTSSetListenerSecurityW';
function WTSSetListenerSecurityA; external ModName name 'WTSSetListenerSecurityA';
function WTSSetListenerSecurityW; external ModName name 'WTSSetListenerSecurityW';
function WTSSetUserConfig; external ModName name 'WTSSetUserConfigW';
function WTSSetUserConfigA; external ModName name 'WTSSetUserConfigA';
function WTSSetUserConfigW; external ModName name 'WTSSetUserConfigW';
function WTSShutdownSystem; external ModName name 'WTSShutdownSystem';
function WTSStartRemoteControlSession; external ModName name 'WTSStartRemoteControlSessionW';
function WTSStartRemoteControlSessionA; external ModName name 'WTSStartRemoteControlSessionA';
function WTSStartRemoteControlSessionW; external ModName name 'WTSStartRemoteControlSessionW';
function WTSStopRemoteControlSession; external ModName name 'WTSStopRemoteControlSession';
function WTSTerminateProcess; external ModName name 'WTSTerminateProcess';
function WTSUnRegisterSessionNotification; external ModName name 'WTSUnRegisterSessionNotification';
function WTSUnRegisterSessionNotificationEx; external ModName name 'WTSUnRegisterSessionNotificationEx';
function WTSVirtualChannelClose; external ModName name 'WTSVirtualChannelClose';
function WTSVirtualChannelOpen; external ModName name 'WTSVirtualChannelOpen';
function WTSVirtualChannelOpenEx; external ModName name 'WTSVirtualChannelOpenEx';
function WTSVirtualChannelPurgeInput; external ModName name 'WTSVirtualChannelPurgeInput';
function WTSVirtualChannelPurgeOutput; external ModName name 'WTSVirtualChannelPurgeOutput';
function WTSVirtualChannelQuery; external ModName name 'WTSVirtualChannelQuery';
function WTSVirtualChannelRead; external ModName name 'WTSVirtualChannelRead';
function WTSVirtualChannelWrite; external ModName name 'WTSVirtualChannelWrite';
function WTSWaitSystemEvent; external ModName name 'WTSWaitSystemEvent';

end.
