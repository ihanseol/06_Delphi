{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Macapi.Helpers;

interface

uses
  System.Types, Macapi.CoreFoundation,
{$IF defined(IOS)}
  iOSapi.Foundation, iOSapi.CoreGraphics
{$ELSE}
  Macapi.Foundation, Macapi.CocoaTypes
{$ENDIF}
;
 
function NSObjectToID(const AObject: NSObject): Pointer; inline;

{ Date time functions }

function GetGMTDateTime(const ADateTime: TDateTime): TDateTime;
function GetTimeZone: Integer;

function DateTimeToNSDate(const ADateTime: TDateTime; AUseTimeZone: Boolean = False): NSDate;
function NSDateToDateTime(const ADate: NSDate; AUseTimeZone: Boolean = False): TDateTime;
function NSDateToDate(const ADateTime: NSDate): TDate;

{ String conversions }

function StrToNSStr(const AStr: string): NSString;
function NSStrToStr(const ASource: NSString): string;

function StrToNSUrl(const AStr: string): NSUrl;
function NSUrlToStr(const AUrl: NSUrl): string;

function CFStringRefToStr(const ASource: CFStringRef): string;
function NSStringToID(const ASource: NSString): Pointer;
function StringToID(const ASource: string): Pointer;

{ Rect conversions }

function CGRectFromRect(const R: TRectF): CGRect;
function RectToNSRect(const R: TRect): NSRect;

{ Error conversions }

function CFErrorRefToDescription(const AError: CFErrorRef): string;

implementation

uses System.SysUtils, System.DateUtils, Macapi.ObjectiveC
{$IF defined(IOS)}
,  iOSapi.CocoaTypes
{$ENDIF};

function NSObjectToID(const AObject: NSObject): Pointer;
begin
  if AObject <> nil then
    Result := (AObject as ILocalObject).GetObjectID
  else
    Result := nil;
end;

{ Date time functions }

function GetTimeZone: Integer;
begin
  Result := TNSTimeZone.Wrap(TNSTimeZone.OCClass.localTimeZone).secondsFromGMT div SecsPerHour;
end;

function GetGMTDateTime(const ADateTime: TDateTime): TDateTime;
begin
  Result := IncSecond(ADateTime, -TNSTimeZone.Wrap(TNSTimeZone.OCClass.localTimeZone).secondsFromGMT);
end;

function DateTimeToNSDate(const ADateTime: TDateTime; AUseTimeZone: Boolean): NSDate;
var
  TimeInterval: NSTimeInterval;
begin
  TimeInterval := (ADateTime - EncodeDate(2001, 1, 1)) * SecsPerDay;

  if AUseTimeZone then
    TimeInterval := TimeInterval - TNSTimeZone.Wrap(TNSTimeZone.OCClass.localTimeZone).secondsFromGMT;

  Result := TNSDate.Wrap(TNSDate.OCClass.dateWithTimeIntervalSinceReferenceDate(TimeInterval));
end;

function NSDateToDateTime(const ADate: NSDate; AUseTimeZone: Boolean): TDateTime;
var
  TimeInterval: NSTimeInterval;
begin
  if ADate <> nil then
  begin
    TimeInterval := ADate.TimeIntervalSince1970;

    if AUseTimeZone then
      TimeInterval := TimeInterval + TNSTimeZone.Wrap(TNSTimeZone.OCClass.localTimeZone).secondsFromGMT;

    Result := (TimeInterval / SecsPerDay) + EncodeDate(1970, 1, 1);
  end
  else
    Result := 0.0;
end;

function NSDateToDate(const ADateTime: NSDate): TDate;
var
  Calendar: NSCalendar;
  Components: NSDateComponents;
begin
  if ADateTime <> nil then
  begin
    Calendar := TNSCalendar.Wrap(TNSCalendar.OCClass.currentCalendar);
    Components := Calendar.components(NSYearCalendarUnit or NSMonthCalendarUnit or NSDayCalendarUnit, ADateTime);
    Result := EncodeDate(Components.year, Components.month, Components.day);
  end
  else
    Result := 0.0;
end;

{ String conversions }

function StrToNSStr(const AStr: string): NSString;
begin
  Result := TNSString.Wrap(TNSString.OCClass.stringWithCharacters(PChar(AStr),AStr.Length));
end;

function NSStrToStr(const ASource: NSString): string;
var
  R: NSRange;
begin
  if ASource <> nil then
  begin
    SetLength(Result, ASource.length);
    R.location := 0;
    R.length := ASource.length;
    ASource.getCharacters(PChar(Result), R);
  end
  else
    Result := '';
end;

function StrToNSUrl(const AStr: string): NSUrl;
begin
  Result := TNSUrl.Wrap(TNSUrl.OCClass.URLWithString(StrToNSStr(AStr)));
end;

function NSUrlToStr(const AUrl: NSUrl): string;
begin
  Result := UTF8ToString(AUrl.absoluteString.UTF8String);
end;

function CFStringRefToStr(const ASource: CFStringRef): string;
begin
  if ASource <> nil then
    Result := NSStrToStr(TNSString.Wrap(ASource))
  else
    Result := string.Empty;
end;

function NSStringToID(const ASource: NSString): Pointer;
begin
  Result := (ASource as ILocalObject).getObjectID;
end;

function StringToID(const ASource: string): Pointer;
begin
  Result := (StrToNSStr(ASource) as ILocalObject).GetObjectID;
end;

function CGRectFromRect(const R: TRectF): CGRect;
begin
  Result.origin.x := R.Left;
  Result.origin.Y := R.Top;
  Result.size.Width := R.Width;
  Result.size.Height := R.Height;
end;

function RectToNSRect(const R: TRect): NSRect;
begin
  Result.origin.x := R.Left;
  Result.origin.y := R.Top;
  Result.size.width := R.Width;
  Result.size.height := R.Height;
end;

function CFErrorRefToDescription(const AError: CFErrorRef): string;
begin
  Result := NSStrToStr(TNSError.Wrap(AError).localizedDescription);
end;

end.
