{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$IFNDEF ANDROID} { LangInfo functions not implement in Android }
{ Return the numeric/monetary information for the current locale.  }
function localeconv: Plconv; cdecl;
  external libc name _PU + 'localeconv';
{$EXTERNALSYM localeconv}

// Missing in libc...
{$IFNDEF LINUX}
function localeconv_l(Locale: locale_t): Plconv; cdecl;
  external libc name _PU + 'localeconv_l';
{$EXTERNALSYM localeconv_l}
{$ENDIF}

function setlocale(Category: Integer; const Locale: MarshaledAString): MarshaledAString; cdecl;
  external libc name _PU + 'setlocale';
{$EXTERNALSYM setlocale}

function newlocale(Category: Integer; const Locale: MarshaledAString; Base: locale_t): locale_t; cdecl;
  external libc name _PU + 'newlocale';
{$EXTERNALSYM newlocale}

procedure freelocale(Locale: locale_t); cdecl;
  external libc name _PU + 'freelocale';
{$EXTERNALSYM freelocale}

function duplocale(Locale: locale_t): locale_t; cdecl;
  external libc name _PU + 'duplocale';
{$EXTERNALSYM duplocale}

function uselocale(Locale: locale_t): locale_t; cdecl;
  external libc name _PU + 'uselocale';
{$EXTERNALSYM uselocale}
{$ENDIF !ANDROID}
