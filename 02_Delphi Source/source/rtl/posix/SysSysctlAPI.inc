{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$IF NOT DEFINED(ANDROID) AND NOT DEFINED(LINUX)}
function sysctl(name: PInteger; namelen: cardinal;
  oldp: Pointer; oldlen: Psize_t;
  newp: Pointer; newlen: size_t): Integer; cdecl; overload;
  external libc name _PU + 'sysctl';
function sysctl(name: PInteger; namelen: cardinal;
  oldp: Pointer; var oldlen: size_t;
  newp: Pointer; newlen: size_t): Integer; cdecl; overload;
  external libc name _PU + 'sysctl';
{$EXTERNALSYM sysctl}

function sysctlbyname(Name: MarshaledAString;
  oldp: Pointer; oldlen: Psize_t;
  newp: Pointer; newlen: size_t): Integer; cdecl; overload;
  external libc name _PU + 'sysctlbyname';
function sysctlbyname(Name: MarshaledAString;
  oldp: Pointer; var oldlen: size_t;
  newp: Pointer; newlen: size_t): Integer; cdecl; overload;
  external libc name _PU + 'sysctlbyname';
{$EXTERNALSYM sysctlbyname}

function sysctlnametomib(name: MarshaledAString; mibp: PInteger;
  sizep: Psize_t): Integer; cdecl;
  external libc name _PU + 'sysctlnametomib';
{$EXTERNALSYM sysctlnametomib}
{$ENDIF !ANDROID !LINUX}
