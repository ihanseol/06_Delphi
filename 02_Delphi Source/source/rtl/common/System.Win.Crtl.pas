{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{          Windows NT C RTL bindings to msvcrt.dll      }
{*******************************************************}

{ *************************************************************************  }
{                                                                            }
{  This unit provides references to the standard C runtime functions which   }
{  are required for supporting C object files that are linked into modules   }
{  in the Delphi Rtl and VclImg packages. Currently this includes            }
{  the following units:                                                      }
{                                                                            }
{     System.Zlib.pas                    (Rtl package)                       }
{     System.RegularExpressionsAPI.pas   (Rtl package)                       }
{     Vcl.Imaging.jpeg.pas               (VclImg package)                    }
{     MidasLib.pas                       (Dsnap code, not packaged)          }
{     FireDAC.Phys.SQLiteCli.pas         (FireDACSQLiteDriver package)       }
{                                                                            }
{  This unit is not intended to provide a comprehensive interface to the     }
{  entire C RTL or the msvcrt.dll to which it links. Use of this unit        }
{  for applications other than those listed above is provided without        }
{  support of any kind.                                                      }
{                                                                            }
{  Embarcadero Technologies reserves the right to make any modifications     }
{  to this unit in future releases which may, or may not, change the         }
{  exposed interface. Use at your own risk.                                  }
{                                                                            }
{  This software is provided 'as-is', without any express or implied         }
{  warranty.  In no event will the authors be held liable for any damages    }
{  arising from the use of this software.                                    }
{                                                                            }
{ *************************************************************************  }
{ **IMPORTANT** Keep emuvcl\d2c in sync with changes to this unit.
}

unit System.Win.Crtl;

interface

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

{$IFNDEF WIN32}
  {$DEFINE UCRT}
{$ENDIF}

uses Winapi.Windows;

const
{$IFDEF UCRT}
  api_ms_win_crt_conio_l1_1_0 = 'api-ms-win-crt-conio-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_conio_l1_1_0}
  api_ms_win_crt_convert_l1_1_0 = 'api-ms-win-crt-convert-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_convert_l1_1_0}
  api_ms_win_crt_environment_l1_1_0 = 'api-ms-win-crt-environment-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_environment_l1_1_0}
  api_ms_win_crt_filesystem_l1_1_0 = 'api-ms-win-crt-filesystem-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_filesystem_l1_1_0}
  api_ms_win_crt_heap_l1_1_0 = 'api-ms-win-crt-heap-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_heap_l1_1_0}
  api_ms_win_crt_locale_l1_1_0 = 'api-ms-win-crt-locale-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_locale_l1_1_0}
  api_ms_win_crt_math_l1_1_0 = 'api-ms-win-crt-math-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_math_l1_1_0}
  api_ms_win_crt_multibyte_l1_1_0 = 'api-ms-win-crt-multibyte-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_multibyte_l1_1_0}
  api_ms_win_crt_process_l1_1_0 = 'api-ms-win-crt-process-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_process_l1_1_0}
  api_ms_win_crt_runtime_l1_1_0 = 'api-ms-win-crt-runtime-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_runtime_l1_1_0}
  api_ms_win_crt_stdio_l1_1_0 = 'api-ms-win-crt-stdio-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_stdio_l1_1_0}
  api_ms_win_crt_string_l1_1_0 = 'api-ms-win-crt-string-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_string_l1_1_0}
  api_ms_win_crt_time_l1_1_0 = 'api-ms-win-crt-time-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_time_l1_1_0}
  api_ms_win_crt_utility_l1_1_0 = 'api-ms-win-crt-utility-l1-1-0.dll';
  {$EXTERNALSYM api_ms_win_crt_utility_l1_1_0}
{$ELSE}
  msvcrt = 'msvcrt.dll';
  {$EXTERNALSYM msvcrt}
{$ENDIF}

type
{$IFDEF NEXTGEN}
  PAnsiChar = MarshaledAString;
  PPAnsiChar = ^PAnsiChar;
{$ENDIF}

  va_list = Pointer;
  {$EXTERNALSYM va_list}

  qsort_compare_func = function(P1, P2: Pointer): Integer; cdecl;
  {$EXTERNALSYM qsort_compare_func}

  time_t = {$IFDEF Win32} Integer {$ENDIF}
           {$IFDEF Win64} Int64 {$ENDIF};
  {$EXTERNALSYM time_t}
  Ptime_t = ^time_t;
  {$EXTERNALSYM Ptime_t}
  _time64_t = Int64;
  {$EXTERNALSYM _time64_t}
  P_time64_t = ^_time64_t;
  {$EXTERNALSYM P_time64_t}
  tm = packed record
    tm_sec: Integer;            { Seconds.      [0-60] (1 leap second) }
    tm_min: Integer;            { Minutes.      [0-59]  }
    tm_hour: Integer;           { Hours.        [0-23]  }
    tm_mday: Integer;           { Day.          [1-31]  }
    tm_mon: Integer;            { Month.        [0-11]  }
    tm_year: Integer;           { Year          - 1900. }
    tm_wday: Integer;           { Day of week.  [0-6]   }
    tm_yday: Integer;           { Days in year. [0-365] }
    tm_isdst: Integer;          { DST.          [-1/0/1]}
  end;
  {$EXTERNALSYM tm}
  Ptm = ^tm;
  {$EXTERNALSYM Ptm}

{ ----------------------------------------------------- }
{       Memory                                          }
{ ----------------------------------------------------- }

function  malloc(size: size_t): Pointer; cdecl;
{$EXTERNALSYM malloc}

function realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
{$EXTERNALSYM realloc}

procedure  free(pBlock: Pointer); cdecl;
{$EXTERNALSYM free}

{ ----------------------------------------------------- }
{       CString                                         }
{ ----------------------------------------------------- }

function  memchr(s: Pointer; c: Integer; n: size_t): Pointer; cdecl;
{$EXTERNALSYM memchr}

function  memcmp(buf1: Pointer; buf2: Pointer; n: size_t): Integer; cdecl;
{$EXTERNALSYM memcmp}

function  memcpy(dest, src: Pointer; count: size_t): Pointer; cdecl;
{$EXTERNALSYM memcpy}

function  memmove(dest, src: Pointer; count: size_t): Pointer; cdecl;
{$EXTERNALSYM memmove}

function  memset(dest: Pointer; val: Integer; count: size_t): Pointer; cdecl;
{$EXTERNALSYM memset}

function  strcat(dest: PAnsiChar; src: PAnsiChar): PAnsiChar; cdecl;
{$EXTERNALSYM strcat}

function  strcpy(dest, src: PAnsiChar): PAnsiChar; cdecl;
{$EXTERNALSYM strcpy}

function  strncpy(dest, src: PAnsiChar; n: size_t): PAnsiChar; cdecl;
{$EXTERNALSYM strncpy}

function  strcmp(s1: PAnsiChar; s2: PAnsiChar): Integer; cdecl;
{$EXTERNALSYM strcmp}

function  strncmp(s1: PAnsiChar; s2: PAnsiChar; n: size_t): Integer; cdecl;
{$EXTERNALSYM strncmp}

function  strlen(s: PAnsiChar): size_t; cdecl;
{$EXTERNALSYM strlen}

function  strnlen(s: PAnsiChar; n: size_t): size_t; cdecl;
{$EXTERNALSYM strnlen}

function  strchr(__s: PAnsiChar; __c: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM strchr}

function  strrchr(__s: PAnsiChar; __c: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM strrchr}

function  strerror(__errnum: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM strerror}

function strcspn(const str1, str2: PAnsiChar): size_t; cdecl;
{$EXTERNALSYM strcspn}

function stricmp(const str1, str2: PAnsiChar): Integer; cdecl;
{$EXTERNALSYM stricmp}

function _stricmp(const str1, str2: PAnsiChar): Integer; cdecl;
{$EXTERNALSYM _stricmp}

function _mbscspn(const str, strCharSet: PWideChar): size_t; cdecl;
{$EXTERNALSYM _mbscspn}

function mbstowcs(pwcs: PWideChar; const s: PWideChar;n: size_t): size_t; cdecl;
{$EXTERNALSYM mbstowcs}

function wcslen(str: PWideChar): size_t; cdecl;
{$EXTERNALSYM wcslen}

function wcsnlen(str: PWideChar; n: size_t): size_t; cdecl;
{$EXTERNALSYM wcsnlen}

function wcstombs(s:Pointer; const pwcs:Pointer; n:Integer):Integer; cdecl;
{$EXTERNALSYM wcstombs}

function strstr(const str1, str2: PAnsiChar): PAnsiChar; cdecl;
{$EXTERNALSYM strstr}

function wcscpy(dest, src: PWideChar): PWideChar; cdecl;
{$EXTERNALSYM wcscpy}

{ ----------------------------------------------------- }
{       Locale                                          }
{ ----------------------------------------------------- }

function  tolower(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM tolower}

function  toupper(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM toupper}

function  towlower(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM towlower}

function  towupper(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM towupper}

function  isalnum(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isalnum}

function  isalpha(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isalpha}

function  iscntrl(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM iscntrl}

function  isdigit(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isdigit}

function  isgraph(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isgraph}

function  islower(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM islower}

function  isprint(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isprint}

function  ispunct(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM ispunct}

function  isspace(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isspace}

function  isupper(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isupper}

function  isxdigit(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM isxdigit}

function _ismbblead(c: Cardinal): Integer; cdecl;
{$EXTERNALSYM _ismbblead}
function __ismbblead(c: Cardinal): Integer; cdecl;
{$EXTERNALSYM __ismbblead}


{ ----------------------------------------------------- }
{       IO                                              }
{ ----------------------------------------------------- }

function _open(const __path: PAnsiChar; __access: Integer; __permission: Integer): Integer; cdecl;
{$EXTERNALSYM _open}

function _wopen(const __path: PChar; __access: Integer; __permission: Integer): Integer; cdecl;
{$EXTERNALSYM _wopen}

function _close(__handle: Integer): Integer; cdecl;
{$EXTERNALSYM _close}

function _lseek(__handle: Integer; __offset: Integer; __fromwhere: Integer): Integer; cdecl;
{$EXTERNALSYM _lseek}

function _read(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl;
{$EXTERNALSYM _read}

function _write(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl;
{$EXTERNALSYM _write}

function open(const __path: PAnsiChar; __access: Integer; __permission: Integer): Integer; cdecl;
{$EXTERNALSYM open}
function close(__handle: Integer): Integer; cdecl;
{$EXTERNALSYM close}
function lseek(__handle: Integer; __offset: Integer; __fromwhere: Integer): Integer; cdecl;
{$EXTERNALSYM lseek}
function read(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl;
{$EXTERNALSYM read}
function write(__handle: Integer; __buf: Pointer; __len: LongWord): Integer; cdecl;
{$EXTERNALSYM write}
function rename(const __oldname, __newname: PAnsiChar): Integer; cdecl;
{$EXTERNALSYM rename}

{ ----------------------------------------------------- }
{       Standard IO                                     }
{ ----------------------------------------------------- }

function  printf(format: PAnsiChar {args}): Integer; cdecl; varargs;
{$EXTERNALSYM printf}

function  fprintf(fHandle: Pointer; format: PAnsiChar {args}): Integer; cdecl; varargs;
{$EXTERNALSYM fprintf}

function  sprintf(buf: Pointer; format: PAnsiChar {args}): Integer; cdecl; varargs;
{$EXTERNALSYM sprintf}

function snprintf(buf: Pointer; nzize: size_t; format: PAnsiChar; param: va_list): Integer; cdecl;
{$EXTERNALSYM snprintf}

function _snprintf(buf: Pointer; nzize: size_t; format: PAnsiChar; param: va_list): Integer; cdecl;
{$EXTERNALSYM _snprintf}

function vsnprintf(buf: Pointer; nzize: size_t; format: PAnsiChar; param: va_list): Integer; cdecl;
{$EXTERNALSYM vsnprintf}

function _vsnprintf(buf: Pointer; nzize: size_t; format: PAnsiChar; param: va_list): Integer; cdecl;
{$EXTERNALSYM _vsnprintf}

{ ----------------------------------------------------- }
{       Conversion                                      }
{ ----------------------------------------------------- }

function _itoa(value: Integer; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM _itoa}

function itoa(value: Integer; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM itoa}

function _i64toa(value: Int64; str: PAnsiChar; radix: Integer): PAnsiChar; cdecl;
{$EXTERNALSYM _i64toa}

function _atoi64(const str: PAnsiChar): Int64; cdecl;
{$EXTERNALSYM _atoi64}

function atoi(const str: PAnsiChar): Integer; cdecl;
{$EXTERNALSYM atoi}

function atof(value: PAnsiChar): Double; cdecl;
{$EXTERNALSYM atof}

function atol(const str: PAnsiChar): LongInt; cdecl;
{$EXTERNALSYM atol}

function strtod(value: PAnsiChar; endPtr: PPAnsiChar): Double; cdecl;
{$EXTERNALSYM strtod}

function gcvt(value: double; digits: Integer; buffer: PAnsiChar): PAnsiChar; cdecl;
{$EXTERNALSYM gcvt}
function _gcvt(value: double; digits: Integer; buffer: PAnsiChar): PAnsiChar; cdecl;
{$EXTERNALSYM _gcvt}

const
  _fltused: Integer = $9875;  // from stubs.c in MS crtl
  {$EXTERNALSYM _fltused}
  _streams: array [0..2] of NativeInt = (0, 1, 2);
  {$EXTERNALSYM _streams}
var
  _errno: Integer;
  {$EXTERNALSYM _errno}
  __errno: Integer;
  {$EXTERNALSYM __errno}
  ___errno: Integer;
  {$EXTERNALSYM ___errno}
  __turboFloat: Integer = 0; // Win32
  {$EXTERNALSYM __turboFloat}


procedure _mbctype; // Not a function, pointer to data
{$EXTERNALSYM _mbctype}

{$IFNDEF UCRT}
  {$IFDEF WIN32}
    procedure _memmove; cdecl;
    {$EXTERNALSYM _memmove}
    procedure _memcpy; cdecl;
    {$EXTERNALSYM _memcpy}
    procedure _memcmp; cdecl;
    {$EXTERNALSYM _memcmp}
    procedure _memchr; cdecl;
    {$EXTERNALSYM _memchr}
    procedure _strchr; cdecl;
    {$EXTERNALSYM _strchr}
    procedure _strrchr; cdecl;
    {$EXTERNALSYM _strrchr}
    procedure _strstr; cdecl;
    {$EXTERNALSYM _strstr}
    procedure _printf; cdecl;
    {$EXTERNALSYM _printf}
    procedure _fprintf; cdecl;
    {$EXTERNALSYM _fprintf}
    procedure _sprintf; cdecl;
    {$EXTERNALSYM _sprintf}
    procedure __vsnprintf; cdecl;
    {$EXTERNALSYM __vsnprintf}
  {$ENDIF}
{$ENDIF}

{$IFDEF WIN64}
procedure _purecall; cdecl;
function _lseeki64(__handle: Integer; __offset: Int64; __fromwhere: Integer): Int64; cdecl;
{$EXTERNALSYM _lseeki64}
{$ENDIF}
{$IFDEF WIN32}
procedure __pure_error_;
{$EXTERNALSYM __pure_error_}
function GetMem2(Size: NativeInt): Pointer;
{$EXTERNALSYM GetMem2}
function SysFreeMem2(p: Pointer): Integer;
{$EXTERNALSYM SysFreeMem2}
function _malloc(size: size_t): Pointer; cdecl;
{$EXTERNALSYM _malloc}
function _realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
{$EXTERNALSYM _realloc}
procedure _free(pBlock: Pointer); cdecl;
{$EXTERNALSYM _free}

function __atold(value: PAnsiChar; endPtr: PPAnsiChar): Extended; cdecl;
{$EXTERNALSYM __atold}
procedure _ftol; cdecl; external {$IFDEF UCRT}api_ms_win_crt_math_l1_1_0 name '_ftol'{$ENDIF};
{$EXTERNALSYM _ftol}
procedure __ftol; cdecl; external {$IFDEF UCRT}api_ms_win_crt_math_l1_1_0 name '_ftol';{$ELSE}; {$L ftol.obj}{$ENDIF}
{$EXTERNALSYM __ftol}
procedure _ftoul; cdecl;
{$EXTERNALSYM _ftoul}
procedure __ftoul; cdecl; external; {$L _ftoul.obj}
{$EXTERNALSYM __ftoul}
{$ENDIF WIN32}

procedure __mbctype; // Not a function, pointer to data
{$EXTERNALSYM __mbctype}
function  _ltolower(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM _ltolower}
function  _ltoupper(__ch: Integer): Integer; cdecl;
{$EXTERNALSYM _ltoupper}
function _ltowlower(c:Integer):Integer; cdecl;
{$EXTERNALSYM _ltowlower}
function _ltowupper(c:Integer):Integer; cdecl;
{$EXTERNALSYM _ltowupper}
procedure __ltolower; cdecl;
{$EXTERNALSYM __ltolower}
procedure __ltoupper; cdecl;
{$EXTERNALSYM __ltoupper}
procedure __ltowlower; cdecl;
{$EXTERNALSYM __ltowlower}
procedure __ltowupper; cdecl;
{$EXTERNALSYM __ltowupper}

{$IFDEF WIN32}
procedure _atof; cdecl;
{$EXTERNALSYM _atof}
procedure _atol; cdecl;
{$EXTERNALSYM _atol}
procedure _strcspn; cdecl;
{$EXTERNALSYM _strcspn}
procedure _strcat; cdecl;
{$EXTERNALSYM _strcat}
procedure _strcmp; cdecl;
{$EXTERNALSYM _strcmp}
procedure _strncmp; cdecl;
{$EXTERNALSYM _strncmp}
procedure _strcpy; cdecl;
{$EXTERNALSYM _strcpy}
procedure _strncpy; cdecl;
{$EXTERNALSYM _strncpy}
procedure _memset; cdecl;
{$EXTERNALSYM _memset}
procedure _strlen; cdecl;
{$EXTERNALSYM _strlen}
procedure _islower; cdecl;
{$EXTERNALSYM _islower}
procedure _isdigit; cdecl;
{$EXTERNALSYM _isdigit}
procedure _isupper; cdecl;
{$EXTERNALSYM _isupper}
procedure _isalnum; cdecl;
{$EXTERNALSYM _isalnum}
procedure _isspace; cdecl;
{$EXTERNALSYM _isspace}
procedure _isxdigit; cdecl;
{$EXTERNALSYM _isxdigit}
procedure _isgraph; cdecl;
{$EXTERNALSYM _isgraph}
procedure _isprint; cdecl;
{$EXTERNALSYM _isprint}
procedure _ispunct; cdecl;
{$EXTERNALSYM _ispunct}
procedure _iscntrl; cdecl;
{$EXTERNALSYM _iscntrl}
procedure _isalpha; cdecl;
{$EXTERNALSYM _isalpha}
procedure _strnlen; cdecl;
{$EXTERNALSYM _strnlen}
procedure _wcslen; cdecl;
{$EXTERNALSYM _wcslen}
procedure _wcsnlen; cdecl;
{$EXTERNALSYM _wcsnlen}
procedure _tolower; cdecl;
{$EXTERNALSYM _tolower}
procedure _toupper; cdecl;
{$EXTERNALSYM _toupper}
procedure __mbscspn; cdecl;
{$EXTERNALSYM __mbscspn}
procedure __i64toa; cdecl;
{$EXTERNALSYM __i64toa}
procedure __atoi64; cdecl;
{$EXTERNALSYM __atoi64}
procedure _mbstowcs; cdecl;
{$EXTERNALSYM _mbstowcs}
procedure _wcstombs; cdecl;
{$EXTERNALSYM _wcstombs}
procedure _strerror; cdecl;
{$EXTERNALSYM _strerror}
procedure _llmod; cdecl;
{$EXTERNALSYM _llmod}
procedure _lldiv; cdecl;
{$EXTERNALSYM _lldiv}
procedure _lludiv; cdecl;
{$EXTERNALSYM _lludiv}
procedure _llmul; cdecl;
{$EXTERNALSYM _llmul}
procedure _llumod; cdecl;
{$EXTERNALSYM _llumod}
procedure _llshl; cdecl;
{$EXTERNALSYM _llshl}
procedure _llshr; cdecl;
{$EXTERNALSYM _llshr}
procedure _llushr; cdecl;
{$EXTERNALSYM _llushr}
{$ENDIF WIN32}

procedure qsort(baseP: PByte; NElem, Width: size_t; comparF: qsort_compare_func); cdecl;
{$EXTERNALSYM qsort}
function localtime(t: Ptime_t): Ptm; cdecl;
{$EXTERNALSYM localtime}

function _beginthreadex(security_attr: Pointer; stksize: LongWord;
  start: Pointer; arg: Pointer; create_flags: LongWord;
  var thread_id: LongWord): LongWord; cdecl;
{$EXTERNALSYM _beginthreadex}
procedure _endthreadex(thread_retval: LongWord);
{$EXTERNALSYM _endthreadex}

function log(__x: Double): Double; cdecl;
{$EXTERNALSYM log}

function _localtime64(t: Pointer): Ptm; cdecl;
{$EXTERNALSYM _localtime64}

implementation

uses System.SysUtils, System.Character, System.AnsiStrings;

{$IFDEF UCRT}

// Extra functions that are part of UCRT but are not available on UCRT dlls (because they are declared inline on .h)

{$IFDEF WIN32}
  {$L 'ucrt_extra.obj'}
  const _PU = '_';
{$ELSE}
  {$L 'ucrt_extra.o'}
  const _PU = '';
{$ENDIF !WIN32}

function _localtime32(t: Pointer): Ptm; cdecl; external api_ms_win_crt_time_l1_1_0;
procedure __stdio_common_vfprintf; cdecl; external api_ms_win_crt_stdio_l1_1_0;
procedure __stdio_common_vsprintf; cdecl; external api_ms_win_crt_stdio_l1_1_0;
procedure __acrt_iob_func; cdecl; external api_ms_win_crt_stdio_l1_1_0;
{$IFDEF WIN32}
procedure __localtime32; cdecl; external api_ms_win_crt_time_l1_1_0 name '_localtime32';
procedure ___stdio_common_vfprintf; cdecl; external api_ms_win_crt_stdio_l1_1_0 name '__stdio_common_vfprintf';
procedure ___stdio_common_vsprintf; cdecl; external api_ms_win_crt_stdio_l1_1_0 name '__stdio_common_vsprintf';
procedure ___acrt_iob_func; cdecl; external api_ms_win_crt_stdio_l1_1_0 name '__acrt_iob_func';
{$ENDIF WIN32}

{$IFOPT Q+}
  {$DEFINE __OVERFLOWCHECKS}
  {$OVERFLOWCHECKS OFF}
{$ENDIF}
{$IFOPT R+}
  {$DEFINE __RANGECHECKS}
  {$RANGECHECKS OFF}
{$ENDIF}
{$IFOPT O-}
  {$DEFINE __OPTIMIZATION}
  {$OPTIMIZATION ON}
{$ENDIF}

function memchr(s: Pointer; c: Integer; n: size_t): Pointer; cdecl;
begin
  while n > 0 do
  begin
    if PByte(s)^ = c then
      Exit(s);
    Dec(n);
    Inc(PByte(s));
  end;
  Result := nil;
end;

function memcmp(buf1: Pointer; buf2: Pointer; n: size_t): Integer; cdecl;
begin
  while n > 0 do
  begin
    Result := PByte(buf1)^ - PByte(buf2)^;
    if Result <> 0 then
      Exit;
    Dec(n);
    Inc(PByte(buf1));
    Inc(PByte(buf2));
  end;
  Result := 0;
end;

function memcpy(dest, src: Pointer; count: size_t): Pointer; cdecl;
begin
  System.Move(PByte(src)^, PByte(dest)^, count);
  Result := dest;
end;

function memmove(dest, src: Pointer; count: size_t): Pointer; cdecl;
begin
  System.Move(PByte(src)^, PByte(dest)^, count);
  Result := dest;
end;

{$IFDEF __OVERFLOWCHECKS}
  {$UNDEF __OVERFLOWCHECKS}
  {$OVERFLOWCHECKS ON}
{$ENDIF}
{$IFDEF __RANGECHECKS}
  {$UNDEF __RANGECHECKS}
  {$RANGECHECKS ON}
{$ENDIF}
{$IFDEF __OPTIMIZATION}
  {$UNDEF __OPTIMIZATION}
  {$OPTIMIZATION OFF}
{$ENDIF}

function strchr(__s: PAnsiChar; __c: Integer): PAnsiChar; cdecl;
begin
  Result := System.AnsiStrings.StrScan(__s, AnsiChar(__c));
end;

function strrchr(__s: PAnsiChar; __c: Integer): PAnsiChar; cdecl;
begin
  Result := System.AnsiStrings.StrRScan(__s, AnsiChar(__c));
end;

function strstr(const str1, str2: PAnsiChar): PAnsiChar; cdecl;
begin
  Result := System.AnsiStrings.StrPos(str1, str2);
end;

function localtime(t: Ptime_t): Ptm; cdecl;
begin
  Result := {$IFDEF WIN32}_localtime32(t);{$ELSE}_localtime64(t);{$ENDIF}
end;

{$ELSE !UCRT}

function memchr; external msvcrt;
function memcmp; external msvcrt;
function memcpy; external msvcrt;
function memmove; external msvcrt;
function strchr; external msvcrt;
function strrchr; external msvcrt;
function strstr; external msvcrt;
function localtime; external msvcrt;
procedure _memmove; external msvcrt name 'memmove';
procedure _memcpy; external msvcrt name 'memcpy';
procedure _memcmp; external msvcrt name 'memcmp';
procedure _memchr; external msvcrt name 'memchr';
procedure _strchr; external msvcrt name 'strchr';
procedure _strrchr; external msvcrt name 'strrchr';
procedure _strstr; external msvcrt name 'strstr';
procedure _printf; external msvcrt name 'printf';
procedure _fprintf; external msvcrt name 'fprintf';
procedure _sprintf; external msvcrt name 'sprintf';
procedure __vsnprintf; external msvcrt name '_vsnprintf';

{$ENDIF !UCRT}

{ ----------------------------------------------------- }
{       Memory                                          }
{ ----------------------------------------------------- }

function  malloc(size: size_t): Pointer; cdecl;
begin
  Result := AllocMem(size);
end;

function realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
begin
  ReallocMem(P, Newsize);
  Result := P;
end;

procedure free(pBlock: Pointer); cdecl;
begin
  FreeMem(pBlock);
end;

{$IFDEF WIN64}
procedure _purecall; cdecl;
asm
  jmp System.@AbstractError
end;

function _lseeki64; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

{$ENDIF}

{$IFDEF WIN32}
procedure _llmod; cdecl;
asm
  jmp System.@_llmod;
end;

procedure _lldiv; cdecl;
asm
  jmp System.@_lldiv
end;

procedure _lludiv; cdecl;
asm
  jmp System.@_lludiv
end;

procedure _llmul; cdecl;
asm
  jmp System.@_llmul
end;

procedure _llumod; cdecl;
asm
  jmp System.@_llumod
end;

procedure _llshl; cdecl;
asm
  jmp System.@_llshl
end;

procedure _llshr; cdecl;
asm
        AND   CL, $3F
        CMP   CL, 32
        JL    @__llshr@below32
        MOV   EAX, EDX
        CDQ
        SAR   EAX,CL
        RET

@__llshr@below32:
        SHRD  EAX, EDX, CL
        SAR   EDX, CL
        RET
end;

procedure _llushr; cdecl;
asm
  jmp System.@_llushr
end;

function _malloc(size: size_t): Pointer; cdecl;
begin
  try
    Result := AllocMem(size);
  except
    Result := nil;
  end;
end;

function _realloc(P: Pointer; NewSize: size_t): Pointer; cdecl;
begin
  try
    ReallocMem(P, Newsize);
    Result := P;
  except
    Result := nil;
  end;
end;

procedure _free(pBlock: Pointer); cdecl;
begin
  FreeMem(pBlock);
end;

procedure __pure_error_;
asm
  JMP  System.@AbstractError
end;

// C++'s alloc allocates 1 byte if size is 0.
function GetMem2(Size: NativeInt): Pointer;
begin
  if Size = 0 then Inc(Size);
  GetMem(Result, Size);
end;

// C++'s free allow NULL pointer.
function SysFreeMem2(p: Pointer): Integer;
begin
  result := 0;
  if (p <> NIL) then result := FreeMemory(p);
end;

function __atold(value: PAnsiChar; endPtr: PPAnsiChar): Extended; cdecl;
var
  s: string;
begin
  s := string(Value);
  if endPtr <> nil then
    endPtr^ := value;
  if not TryStrToFloat(s, Result) then
    Result := 0
  else if endPtr <> nil then
    endPtr^ := PAnsiChar(PByte(Value) + Length(s));
end;

procedure _ftoul; cdecl;
asm
  JMP  System.@Trunc
end;
{$ENDIF WIN32}

{ ----------------------------------------------------- }
{       CString                                         }
{ ----------------------------------------------------- }

function  memset; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strcat; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strcpy; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strncpy; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strcmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strncmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strnlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  strerror; external {$IFDEF UCRT}api_ms_win_crt_runtime_l1_1_0{$ELSE}msvcrt{$ENDIF};

function strcspn; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function stricmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_stricmp';

function _stricmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _mbscspn; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0{$ELSE}msvcrt{$ENDIF};

function mbstowcs; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function wcslen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function wcsnlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function wcstombs; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function wcscpy; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

{ ----------------------------------------------------- }
{       Locale                                          }
{ ----------------------------------------------------- }

function  tolower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  toupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  towlower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  towupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isalnum; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isalpha; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  iscntrl; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isdigit; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isgraph; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  islower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isprint; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  ispunct; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isspace; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function  isxdigit; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _ismbblead; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0{$ELSE}msvcrt{$ENDIF};
function __ismbblead; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_ismbblead';


{ ----------------------------------------------------- }
{       IO                                              }
{ ----------------------------------------------------- }

function _wopen; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _open; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _close; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _lseek; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _read; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _write; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF};

function open; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_open';

function close; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_close';

function lseek; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_lseek';

function read; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_read';

function write; external {$IFDEF UCRT}api_ms_win_crt_stdio_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_write';

function rename; external {$IFDEF UCRT}api_ms_win_crt_filesystem_l1_1_0{$ELSE}msvcrt{$ENDIF};

{ ----------------------------------------------------- }
{       Standard IO                                     }
{ ----------------------------------------------------- }

function  printf; external {$IFDEF UCRT}name _PU + 'ucrt_extra_printf'{$ELSE}msvcrt{$ENDIF};

function  fprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra_fprintf'{$ELSE}msvcrt{$ENDIF};

function  sprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra_sprintf'{$ELSE}msvcrt{$ENDIF};

function snprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra_snprintf'{$ELSE}msvcrt name '_snprintf'{$ENDIF};

function _snprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra__snprintf'{$ELSE}msvcrt{$ENDIF};

function vsnprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra_vsnprintf'{$ELSE}msvcrt name '_vsnprintf'{$ENDIF};

function _vsnprintf; external {$IFDEF UCRT}name _PU + 'ucrt_extra__vsnprintf'{$ELSE}msvcrt{$ENDIF};

{ ----------------------------------------------------- }
{       Conversion                                      }
{ ----------------------------------------------------- }

function _itoa; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function itoa; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_itoa';

function _i64toa; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _atoi64; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function atoi; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function atof; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function atol; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function strtod; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

function gcvt; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_gcvt';

function _gcvt; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF};

procedure _mbctype; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0 name '__p__mbctype'{$ELSE}msvcrt{$ENDIF}; // Not a function, pointer to data

procedure __mbctype; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0 name '__p__mbctype'{$ELSE}msvcrt name '_mbctype'{$ENDIF}; // Not a function, pointer to data

function  _ltolower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'tolower';

function  _ltoupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'toupper';

function _ltowlower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'towlower';

function _ltowupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'towupper';

procedure __ltolower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'tolower';

procedure __ltoupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'toupper';

procedure __ltowlower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'towlower';

procedure __ltowupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'towupper';

procedure _atof; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'atof';

procedure _atol; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'atol';

procedure _strcspn; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strcspn';

procedure _strcat; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strcat';

procedure _strcmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strcmp';

procedure _strncmp; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strncmp';

procedure _strcpy; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strcpy';

procedure _strncpy; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strncpy';

procedure _memset; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'memset';

procedure _strlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strlen';

procedure _islower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'islower';

procedure _isdigit; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isdigit';

procedure _isupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isupper';

procedure _isalnum; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isalnum';

procedure _isspace; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isspace';

procedure _isxdigit; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isxdigit';

procedure _isgraph; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isgraph';

procedure _isprint; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isprint';

procedure _ispunct; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'ispunct';

procedure _iscntrl; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'iscntrl';

procedure _isalpha; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'isalpha';

procedure _strnlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strnlen';

procedure _wcslen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'wcslen';

procedure _wcsnlen; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'wcsnlen';

procedure _tolower; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'tolower';

procedure _toupper; external {$IFDEF UCRT}api_ms_win_crt_string_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'toupper';

procedure __mbscspn; external {$IFDEF UCRT}api_ms_win_crt_multibyte_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_mbscspn';

procedure __i64toa; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_i64toa';

procedure __atoi64; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name '_atoi64';

procedure _mbstowcs; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'mbstowcs';

procedure _wcstombs; external {$IFDEF UCRT}api_ms_win_crt_convert_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'wcstombs';

procedure _strerror; external {$IFDEF UCRT}api_ms_win_crt_runtime_l1_1_0{$ELSE}msvcrt{$ENDIF} name 'strerror';

procedure qsort; external {$IFDEF UCRT}api_ms_win_crt_utility_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _beginthreadex; external {$IFDEF UCRT}api_ms_win_crt_runtime_l1_1_0{$ELSE}msvcrt{$ENDIF};

procedure _endthreadex; external {$IFDEF UCRT}api_ms_win_crt_runtime_l1_1_0{$ELSE}msvcrt{$ENDIF};

function log; external {$IFDEF UCRT}api_ms_win_crt_math_l1_1_0{$ELSE}msvcrt{$ENDIF};

function _localtime64; external {$IFDEF UCRT}api_ms_win_crt_time_l1_1_0{$ELSE}msvcrt{$ENDIF};

end.
