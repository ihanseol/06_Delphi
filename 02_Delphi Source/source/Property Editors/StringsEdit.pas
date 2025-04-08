{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{                Strings Editor Dialog                  }
{*******************************************************}

unit StringsEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, StrEdit, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ActnPopup,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, IDEImageResources, Vcl.StdActns,
  System.Actions, Vcl.ActnList;

type
  TStringsEditDlg = class(TStrEditDlg)
    ImageList: TVirtualImageList;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileSave1: TAction;
    EditUndo1: TEditUndo;
    FileOpen1: TAction;
    EditSelectAll1: TEditSelectAll;
    EditDelete1: TEditDelete;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton3: TToolButton;
    Memo: TRichEdit;
    StatusBar: TStatusBar;
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpdateStatus(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure MemoSelectionChange(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
  private
    SingleLine: string;
    MultipleLines: string;
    Column: string;
  protected
    function GetLines: TStrings; override;
    procedure SetLines(const Value: TStrings); override;
    function GetLinesControl: TWinControl; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses DesignConst, BrandingAPI, IDETheme.Utils;

function TStringsEditDlg.GetLinesControl: TWinControl;
begin
  Result := Memo;
end;

procedure TStringsEditDlg.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then CancelButton.Click;
end;

procedure TStringsEditDlg.MemoSelectionChange(Sender: TObject);
begin
  UpdateStatus(Sender);
end;

procedure TStringsEditDlg.UpdateStatus(Sender: TObject);
begin
  if Sender = Memo then FModified := True;
  StatusBar.Invalidate;
end;

procedure TStringsEditDlg.FileOpen1Execute(Sender: TObject);
begin
  FileOpen(Sender);
end;

procedure TStringsEditDlg.FileSave1Execute(Sender: TObject);
begin
  FileSave(Sender);
end;

procedure TStringsEditDlg.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  inherited;
  TIDEThemeMetrics.Font.AdjustDPISize(Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
  TIDEThemeMetrics.Font.AdjustDPISize(Memo.Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
end;

procedure TStringsEditDlg.FormCreate(Sender: TObject);
begin
  inherited;
  TIDETitleBarService.AddTitleBar(Self, nil, True);
  if TIDEThemeMetrics.Font.Enabled then
    Font.Assign(TIDEThemeMetrics.Font.GetFont);
  if ThemeProperties <> nil then
  begin
    IDEThemeManager.RegisterFormClass(TStringsEditDlg);
    ThemeProperties.ApplyTheme(Self);
  end;
  SingleLine := srLine;
  MultipleLines := srLines;
  Column := srColumn;
end;

function TStringsEditDlg.GetLines: TStrings;
begin
  Result := Memo.Lines;
end;

procedure TStringsEditDlg.SetLines(const Value: TStrings);
begin
  Memo.Lines.Assign(Value);
end;

procedure TStringsEditDlg.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  LineCount, CurLine, CurCol: Integer;
  LText: string;
begin
  inherited;
  if TIDEThemeMetrics.Font.Enabled then
  begin
    LineCount := Memo.Lines.Count;
    CurLine := Memo.Perform(EM_LINEFROMCHAR, Memo.SelStart, 0);
    CurCol := Memo.SelStart - Memo.Perform(EM_LINEINDEX, CurLine, 0);

    case Panel.ID of
      0: LText := ' ' + SingleLine + ': ' + IntToStr(CurLine + 1);
      1: LText := Column + ': ' + IntToStr(CurCol + 1);
      2: LText := Format('%s: %d', [MultipleLines, LineCount]);
    end;

    var LCanvas := StatusBar.Canvas;
    var LRect := Rect;
    Inc(LRect.Left, ScaleValue(TIDEThemeMetrics.AlignFactor * 2));
    LCanvas.Font.Assign(TIDEThemeMetrics.Font.GetFont());
    TIDEThemeMetrics.Font.AdjustDPISize(LCanvas.Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
    LCanvas.Font.Color := GetIDEStyleServices.GetSystemColor(clWindowText);
    LCanvas.TextRect(LRect, LText, [tfSingleLine, tfVerticalCenter, tfLeft, tfEndEllipsis]);
  end;
end;

end.
