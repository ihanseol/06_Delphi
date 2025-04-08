{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Skia.Printer;

interface

uses
  { Delphi }
  FMX.Printer;

{$SCOPEDENUMS ON}

procedure SetSkiaPrinterClass;

implementation

{$IFDEF MSWINDOWS}
  {$DEFINE SKIA_DEVICE}
  {$DEFINE SKIA_XPS}
{$ENDIF}

uses
  { Delphi }
  FMX.Graphics,
  FMX.Types,
  {$IFDEF MSWINDOWS}
  FMX.Printer.Win,
  Winapi.Windows,
  {$ENDIF}
  System.Math.Vectors,
  System.SysUtils,
  System.Types,
  System.UITypes,

  { Skia }
  FMX.Skia.Canvas,
  System.Skia;

type
{$IFDEF SKIA_DEVICE}

  { TSkPrinter }

  TSkPrinter = class({$IFDEF MSWINDOWS}TPrinterWin{$ENDIF}, ISkCanvasWrapper)
  private
    {$IFDEF MSWINDOWS}
    FBitmap: HBITMAP;
    {$ENDIF}
    FSurface: ISkSurface;
    function CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
    procedure CanvasEnd;
    procedure DrawPage; inline;
    function GetCanvasScale: Single;
    function ISkCanvasWrapper.GetCanvasHeight = GetPageHeight;
    function ISkCanvasWrapper.GetCanvasWidth = GetPageWidth;
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    procedure DoBeginDoc; override;
    procedure DoEndDoc; override;
    procedure DoNewPage; override;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
  public
  end;

{$ENDIF}

  { TSkPrinterDeviceDocument }

  TSkPrinterDeviceDocument = class(TPrinterDeviceDocument)
  strict protected
    procedure RefreshDPIList; override;
    procedure SetDefaultDPI; override;
  end;

  { TSkPrinterDocument }

  TSkPrinterDocument = class(TPrinterDocument, ISkCanvasWrapper)
  private
    FDocument: ISkDocument;
    FDocumentCanvas: ISkCanvas;
    function CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
    procedure CanvasEnd;
    function GetCanvasScale: Single;
    function ISkCanvasWrapper.GetCanvasHeight = GetPageHeight;
    function ISkCanvasWrapper.GetCanvasWidth = GetPageWidth;
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    procedure DoAbortDoc; override;
    procedure DoBeginDocFile; override;
    procedure DoEndDocFile; override;
    procedure DoNewPage; override;
    function GetCanvas: TCanvas; override;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    procedure RefreshPrinterDevices; override;
  end;

{$IFDEF SKIA_DEVICE}

{ TSkPrinter }

function TSkPrinter.CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
begin
  if FSurface = nil then
    Exit(nil);
  Result := FSurface.Canvas;
end;

procedure TSkPrinter.CanvasEnd;
begin
end;

procedure TSkPrinter.DoBeginDoc;
begin
  inherited;
  {$IFDEF MSWINDOWS}
  if FBitmap = 0 then
  begin
    var LBitmapInfo: TBitmapInfo;
    var LBits: Pointer;
    FillChar(LBitmapInfo, SizeOf(TBitmapInfo), 0);
    LBitmapInfo.bmiHeader.biSize := SizeOf(TBitmapInfoHeader);
    LBitmapInfo.bmiHeader.biWidth := PageWidth;
    LBitmapInfo.bmiHeader.biHeight := -PageHeight;
    LBitmapInfo.bmiHeader.biPlanes := 1;
    LBitmapInfo.bmiHeader.biBitCount := 32;
    LBitmapInfo.bmiHeader.biCompression := BI_RGB;
    LBitmapInfo.bmiHeader.biSizeImage := PageWidth * PageHeight * SkBytesPerPixel[TSkColorType.BGRA8888];
    FBitmap := CreateDIBSection(0, LBitmapInfo, DIB_RGB_COLORS, LBits, 0, 0);
    if FBitmap = 0 then
      RaiseLastOSError;
  end;
  var LDIBSection: TDIBSection;
  if GetObject(FBitmap, SizeOf(TDIBSection), @LDIBSection) = 0 then
    RaiseLastOSError;
  FSurface := TSkSurface.MakeRasterDirect(TSkImageInfo.Create(LDIBSection.dsBm.bmWidth, LDIBSection.dsBm.bmHeight, TSkColorType.BGRA8888), LDIBSection.dsBm.bmBits, LDIBSection.dsBm.bmWidthBytes);
  {$ENDIF}
  FSurface.Canvas.Clear(TAlphaColors.Null);
end;

procedure TSkPrinter.DoEndDoc;
begin
  DrawPage;
  inherited;
  FSurface := nil;
  {$IFDEF MSWINDOWS}
  if FBitmap <> 0 then
  begin
    DeleteObject(FBitmap);
    FBitmap := 0;
  end;
  {$ENDIF}
end;

procedure TSkPrinter.DoNewPage;
begin
  DrawPage;
  inherited;
  FSurface.Canvas.Clear(TAlphaColors.Null);
end;

procedure TSkPrinter.DrawPage;
begin
  {$IFDEF MSWINDOWS}
  var LDC := CreateCompatibleDC(Handle);
  if LDC <> 0 then
  begin
    try
      var LOldObj := SelectObject(LDC, FBitmap);
      try
        var LBlendFunction: TBlendFunction;
        LBlendFunction.BlendOp := AC_SRC_OVER;
        LBlendFunction.BlendFlags := 0;
        LBlendFunction.SourceConstantAlpha := 255;
        LBlendFunction.AlphaFormat := AC_SRC_ALPHA;
        AlphaBlend(Handle, 0, 0, PageWidth, PageHeight, LDC, 0, 0, PageWidth, PageHeight, LBlendFunction);
      finally
        if LOldObj <> 0 then
          SelectObject(LDC, LOldObj);
      end;
    finally
      DeleteDC(LDC);
    end;
  end;
  {$ENDIF}
end;

function TSkPrinter.GetCanvasScale: Single;
begin
  Result := 1;
end;

function TSkPrinter.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TSkPrinter._AddRef: Integer;
begin
  Result := -1;
end;

function TSkPrinter._Release: Integer;
begin
  Result := -1;
end;

{$ENDIF}

{ TSkPrinterDeviceDocument }

procedure TSkPrinterDeviceDocument.RefreshDPIList;
begin
  FDPIList.Clear;
  FDPIList.Add(Point(72, 72));
  FDPIList.Add(Point(150, 150));
  FDPIList.Add(Point(300, 300));
  FDPIList.Add(Point(600, 600));
end;

procedure TSkPrinterDeviceDocument.SetDefaultDPI;
begin
  FActiveDPIIndex := 3;
end;

{ TSkPrinterDocument }

function TSkPrinterDocument.CanvasBegin(const ACanvas: TCanvas): ISkCanvas;
begin
  Result := FDocumentCanvas;
end;

procedure TSkPrinterDocument.CanvasEnd;
begin
end;

procedure TSkPrinterDocument.DoAbortDoc;
begin
  FDocument.Terminate;
end;

procedure TSkPrinterDocument.DoBeginDocFile;
begin
  {$IFDEF SKIA_XPS}
  if ActivePrinter.Device = '.xps' then
    FDocument := TSkDocument.MakeXPS(FStream)
  else
  {$ENDIF}
  if ActivePrinter.Device = '.pdf' then
    FDocument := TSkDocument.MakePDF(FStream, TSkPDFMetadata.Create('', '', '', '', '', 'RAD/PDF', ActivePrinter.ActiveDPI.X, False, 80));
  FDocumentCanvas := FDocument.BeginPage(PageWidth, PageHeight);
end;

procedure TSkPrinterDocument.DoEndDocFile;
begin
  FreeAndNil(FCanvas);
  FDocumentCanvas := nil;
  FDocument.EndPage;
  FDocument := nil;
end;

procedure TSkPrinterDocument.DoNewPage;
begin
  FDocumentCanvas := nil;
  FDocument.EndPage;
  FDocumentCanvas := FDocument.BeginPage(PageWidth, PageHeight);
end;

function TSkPrinterDocument.GetCanvas: TCanvas;
begin
  if FCanvas = nil then
  begin
    FCanvas := TCanvasManager.CreateFromPrinter(Self);
    FCanvas.Fill.Color := TAlphaColors.Black;
  end;
  Result := FCanvas;
end;

function TSkPrinterDocument.GetCanvasScale: Single;
begin
  Result := 1;
end;

function TSkPrinterDocument.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

procedure TSkPrinterDocument.RefreshPrinterDevices;
begin
  FPrinters.Clear;
  FPrinters.Add(TSkPrinterDeviceDocument.Create('PDF', '.pdf'));
  {$IFDEF SKIA_XPS}
  FPrinters.Add(TSkPrinterDeviceDocument.Create('XPS', '.xps'));
  {$ENDIF}
end;

function TSkPrinterDocument._AddRef: Integer;
begin
  Result := -1;
end;

function TSkPrinterDocument._Release: Integer;
begin
  Result := -1;
end;

procedure SetSkiaPrinterClass;
begin
  {$IFDEF SKIA_DEVICE}
  SetPrinterClass(TSkPrinter);
  {$ENDIF}
  SetPrinterDocumentClass(TSkPrinterDocument);
end;

{$HPPEMIT NOUSINGNAMESPACE}
{$HPPEMIT END '#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FMX_SKIA_PRINTER)'}
{$HPPEMIT END '    typedef void (__fastcall *TSetSkiaPrinterClassProc)(void);'}
{$HPPEMIT END '    static const TSetSkiaPrinterClassProc SetSkiaPrinterClass = ::Fmx::Skia::Printer::SetSkiaPrinterClass;'}
{$HPPEMIT END '#endif'}
end.
