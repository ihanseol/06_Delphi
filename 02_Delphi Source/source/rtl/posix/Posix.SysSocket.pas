{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit Posix.SysSocket;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}
{$WARN SYMBOL_PLATFORM OFF}

interface

uses Posix.Base, Posix.SysTypes, Posix.SysUio;

{$HPPEMIT '#include <sys/socket.h>' }

{$IFDEF MACOS}
{$I osx/SysSocketTypes.inc}
{$ELSEIF defined(LINUX)}
{$I linux/SysSocketTypes.inc}
{$ELSEIF defined(ANDROID)}
{$I android/SysSocketTypes.inc}
{$ENDIF}

{$I SysSocketAPI.inc}

{ Ancillary data object manipulation macros.  }
function CMSG_DATA(cmsg: Pointer): PByte; platform;
{$EXTERNALSYM CMSG_DATA}
function CMSG_NXTHDR(mhdr: Pmsghdr; cmsg: Pcmsghdr): Pcmsghdr; platform;
{$EXTERNALSYM CMSG_NXTHDR}
function CMSG_FIRSTHDR(mhdr: Pmsghdr): Pcmsghdr; platform;
{$EXTERNALSYM CMSG_FIRSTHDR}
function CMSG_ALIGN(len: size_t): size_t; platform;
{$EXTERNALSYM CMSG_ALIGN}
function CMSG_SPACE(len: size_t): size_t; platform;                               
{$EXTERNALSYM CMSG_SPACE}
function CMSG_LEN(len: size_t): size_t; platform;
{$EXTERNALSYM CMSG_LEN}

implementation

function CMSG_DATA(cmsg: Pointer): PByte;
begin
{$IFDEF MACOS}
  Result := PByte(Cardinal(cmsg) + SizeOf(Pcmsghdr));
{$ELSE}
  Result := PByte(Cardinal(cmsg) + CMSG_ALIGN(SizeOf(cmsghdr)));
{$ENDIF}
end;

{$IF Defined(ANDROID) or Defined(LINUX)}
function __cmsg_nxthdr(__ctl: Pointer; __size: size_t; __cmsg: Pcmsghdr): Pcmsghdr;
begin
 result := Pcmsghdr(Cardinal(__cmsg) + CMSG_ALIGN(__cmsg.cmsg_len));
 if UInt32(Cardinal(Result) + 1 - Cardinal(__ctl)) > __size then
   Result := nil;
end;

function _cmsg_nxthdr(__msg: Pmsghdr; __cmsg: Pcmsghdr): Pcmsghdr;
begin
 result := __cmsg_nxthdr(__msg.msg_control, __msg.msg_controllen, __cmsg);
end;
{$ENDIF}

function CMSG_NXTHDR(mhdr: Pmsghdr; cmsg: Pcmsghdr): Pcmsghdr;
{$IF Defined(ANDROID) or Defined(LINUX)}
begin
  Result := _cmsg_nxthdr(mhdr,cmsg);
end;
{$ENDIF}
{$IFDEF MACOS}
begin
  if cmsg = nil then
    Result := CMSG_FIRSTHDR(mhdr)
  else
  begin
    if (Cardinal(cmsg) + CMSG_ALIGN(cmsg.cmsg_len) + CMSG_ALIGN(SizeOf(cmsghdr))) > 
      (Cardinal(mhdr.msg_control) + mhdr.msg_controllen) then
      Result := nil
    else
      Result := Pcmsghdr(Cardinal(cmsg) + CMSG_ALIGN(cmsg.cmsg_len));
  end;
  (* MAC:
  ((char * )(cmsg) == (char * )0L ? CMSG_FIRSTHDR(mhdr) :  \
   ((((unsigned char * )(cmsg) +     \
      __DARWIN_ALIGN32((__uint32_t)(cmsg)->cmsg_len) +  \
      __DARWIN_ALIGN32(sizeof(struct cmsghdr))) >   \
      ((unsigned char * )(mhdr)->msg_control +   \
       (mhdr)->msg_controllen)) ?     \
    (struct cmsghdr * )0L /* NULL */ :    \
    (struct cmsghdr * )((unsigned char * )(cmsg) +   \
      __DARWIN_ALIGN32((__uint32_t)(cmsg)->cmsg_len))))
    *)
end;
{$ENDIF MACOS}

function CMSG_FIRSTHDR(mhdr: Pmsghdr): Pcmsghdr;
begin
  if mhdr^.msg_controllen >= SizeOf(cmsghdr) then
    Result := mhdr^.msg_control
  else
    Result := nil;
end;

function CMSG_ALIGN(len: size_t): size_t;
begin
  Result := (len + SizeOf(size_t) - 1) and (not (SizeOf(size_t) - 1));
end;

function CMSG_SPACE(len: size_t): size_t;
begin
  Result := CMSG_ALIGN(len) + CMSG_ALIGN(SizeOf(cmsghdr));
end;

function CMSG_LEN(len: size_t): size_t;
begin
  Result := CMSG_ALIGN(SizeOf(cmsghdr)) + len;
end;

end.
