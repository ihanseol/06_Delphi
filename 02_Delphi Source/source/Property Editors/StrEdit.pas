{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{*******************************************************}
{       TStrings property editor dialog                 }
{*******************************************************}

unit StrEdit;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.Buttons, Vcl.Dialogs, DesignEditors,
  DesignIntf, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.ActnPopup, System.WideStrings,
  Vcl.PlatformDefaultStyleActnCtrls, ToolsAPI;

type
  TStrEditDlg = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    StringEditorMenu: TPopupActionBar;
    LoadItem: TMenuItem;
    SaveItem: TMenuItem;
    CodeEditorItem: TMenuItem;
    CodeWndBtn: TButton;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    PanelBottom: TPanel;
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure CodeWndBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
  private
    FUpdatingPos: Boolean;
  protected
    FModified: Boolean;
    function GetLines: TStrings; virtual; abstract;
    procedure SetLines(const Value: TStrings); virtual; abstract;
    function GetLinesControl: TWinControl; virtual; abstract;
  public
    property Lines: TStrings read GetLines write SetLines;
  end;

  TStringListProperty = class(TClassProperty)
  protected
    function EditDialog: TStrEditDlg; virtual;
    function GetStrings: TStrings; virtual;
    procedure SetStrings(const Value: TStrings); virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TValueListProperty = class(TStringListProperty)
  protected
    function EditDialog: TStrEditDlg; override;
  end;

  TWideStringListProperty = class(TStringListProperty)
  private
    FStrings: TStrings;
  protected
    function GetStrings: TStrings; override;
    procedure SetStrings(const Value: TStrings); override;
  public
    destructor Destroy; override;
  end;

  TLongStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TLongWideStringProperty = class(TWideStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TEditStringsFunc = reference to function (AInStrings: TStrings; ACodeEditorSupported: Boolean;
    out AOutStrings: TStrings; out AModified: Boolean; out AReleaseObject: TObject): TModalResult;
  TOkStringsProc = reference to procedure (AOutStrings: TStrings);
  function EditStringsWithCodeEditor(AComponent: TComponent; const APropName: string;
    AStrings: TStrings; const ADesigner: IDesigner; const AEditStringsFunc: TEditStringsFunc;
    const AOkStringsProc: TOkStringsProc; ASyntax: TOTASyntaxHighlighter): TModalResult;

implementation

{$R *.dfm}

uses Winapi.ActiveX, System.SysUtils, DesignConst, IStreams,
  StFilSys, System.TypInfo, StringsEdit, ValueEdit, BrandingAPI,
  Vcl.Themes, IDETheme.Utils;

type
  TStringsModuleCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
  private
    FFileName: string;
    FStream: TStringStream;
    FAge: TDateTime;
  public
    constructor Create(const FileName: string; Stream: TStringStream; Age: TDateTime);
    destructor Destroy; override;
    { IOTACreator }
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    { IOTAModuleCreator }
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

  TOTAFile = class(TInterfacedObject, IOTAFile)
  private
    FSource: string;
    FAge: TDateTime;
  public
    constructor Create(const ASource: string; AAge: TDateTime);
    { IOTAFile }
    function GetSource: string;
    function GetAge: TDateTime;
  end;

{ TOTAFile }

constructor TOTAFile.Create(const ASource: string; AAge: TDateTime);
begin
  inherited Create;
  FSource := ASource;
  FAge := AAge;
end;

function TOTAFile.GetAge: TDateTime;
begin
  Result := FAge;
end;

function TOTAFile.GetSource: string;
begin
  Result := FSource;
end;

{ TStringsModuleCreator }

constructor TStringsModuleCreator.Create(const FileName: string; Stream: TStringStream;
  Age: TDateTime);
begin
  inherited Create;
  FFileName := FileName;
  FStream := Stream;
  FAge := Age;
end;

destructor TStringsModuleCreator.Destroy;
begin
  FStream.Free;
  inherited;
end;

procedure TStringsModuleCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
  { Nothing to do }
end;

function TStringsModuleCreator.GetAncestorName: string;
begin
  Result := '';
end;

function TStringsModuleCreator.GetCreatorType: string;
begin
  Result := sText;
end;

function TStringsModuleCreator.GetExisting: Boolean;
begin
  Result := True;
end;

function TStringsModuleCreator.GetFileSystem: string;
begin
  Result := sTStringsFileSystem;
end;

function TStringsModuleCreator.GetFormName: string;
begin
  Result := '';
end;

function TStringsModuleCreator.GetImplFileName: string;
begin
  Result := FFileName;
end;

function TStringsModuleCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TStringsModuleCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TStringsModuleCreator.GetOwner: IOTAModule;
begin
  Result := nil;
end;

function TStringsModuleCreator.GetShowForm: Boolean;
begin
  Result := False;
end;

function TStringsModuleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TStringsModuleCreator.GetUnnamed: Boolean;
begin
  Result := False;
end;

function TStringsModuleCreator.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TStringsModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := TOTAFile.Create(FStream.DataString, FAge);
end;

function TStringsModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

{ TStrEditDlg }

procedure TStrEditDlg.FileOpen(Sender: TObject);
begin
  with OpenDialog do
    if Execute then Lines.LoadFromFile(FileName);
end;

procedure TStrEditDlg.FileSave(Sender: TObject);
begin
  SaveDialog.FileName := OpenDialog.FileName;
  with SaveDialog do
    if Execute then Lines.SaveToFile(FileName);
end;

//Temp fix for opening the strings in the editor.
const
  DotSep = '.';

function EditStringsWithCodeEditor(AComponent: TComponent; const APropName: string;
  AStrings: TStrings; const ADesigner: IDesigner; const AEditStringsFunc: TEditStringsFunc;
  const AOkStringsProc: TOkStringsProc; ASyntax: TOTASyntaxHighlighter): TModalResult;
var
  Ident: string;
  Module: IOTAModule;
  Editor: IOTAEditor;
  Source: IOTASourceEditor;
  ModuleServices: IOTAModuleServices;
  Stream: TStringStream;
  Age: TDateTime;
  Obj: TObject;
  OutStrs: TStrings;
  Modified: Boolean;
  PropInfo: PPropInfo;
begin
  Result := mrCancel;
  ModuleServices := BorlandIDEServices as IOTAModuleServices;
  Module := nil;
  if (AComponent is TComponent) and
    (AComponent.Owner = ADesigner.GetRoot) and
    (ADesigner.GetRoot.Name <> '') then
  begin
    PropInfo := GetPropInfo(AComponent.ClassInfo, APropName);
    if (PropInfo <> nil) and (PropInfo.PropType^.Kind = tkClass) then
    begin
      Ident := ADesigner.GetDesignerExtension + DotSep + ADesigner.GetRoot.Name + DotSep +
        AComponent.Name + DotSep + APropName;
      Module := ModuleServices.FindModule(Ident);
    end;
  end;
  if (Module <> nil) and (Module.GetModuleFileCount > 0) then
    Module.GetModuleFileEditor(0).Show
  else
  try
    Obj := nil;
    OutStrs := nil;
    Modified := False;
    Result := AEditStringsFunc(AStrings, Ident <> '', OutStrs, Modified, Obj);
    case Result of
      mrOk: AOkStringsProc(OutStrs);
      mrYes:
        begin
          // this used to be done in LibMain's TLibrary.Create but now its done here
          //  the unregister is done over in ComponentDesigner's finalization
          //StFilSys.Register;
          Stream := TStringStream.Create(AnsiToUTF8(OutStrs.Text));
          Stream.Position := 0;
          Age := Now;
          Module := ModuleServices.CreateModule(
            TStringsModuleCreator.Create(Ident, Stream, Age));
          if Module <> nil then
          begin
            with StringsFileSystem.GetTStringsProperty(Ident, AComponent, APropName) do
              DiskAge := DateTimeToFileDate(Age);
            Editor := Module.GetModuleFileEditor(0);
            if (ASyntax <> shNone) and Supports(Editor, IOTASourceEditor, Source) then
              Source.SetSyntaxHighlighter(ASyntax);
            if Modified then
              Editor.MarkModified;
            Editor.Show;
          end;
        end;
    end;
  finally
    Obj.Free;
  end;
end;

{ TStringListProperty }

function TStringListProperty.EditDialog: TStrEditDlg;
begin
  Result := TStringsEditDlg.Create(Application);
end;

function TStringListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog] - [paSubProperties];
end;

function TStringListProperty.GetStrings: TStrings;
begin
  Result := TStrings(GetOrdValue);
end;

procedure TStringListProperty.SetStrings(const Value: TStrings);
begin
  SetOrdValue(IntPtr(Value));
end;

procedure TStringListProperty.Edit;
begin
  EditStringsWithCodeEditor(
    TComponent(GetComponent(0)), GetName, GetStrings, Self.Designer,
    function (AInStrings: TStrings; ACodeEditorSupported: Boolean;
      out AOutStrings: TStrings; out AModified: Boolean; out AReleaseObject: TObject): TModalResult
    begin
      AReleaseObject := EditDialog;
      with TStrEditDlg(AReleaseObject) do
      begin
        Lines := AInStrings;
    //    UpdateStatus(nil);
        FModified := False;
        ActiveControl := GetLinesControl;
        CodeEditorItem.Enabled := ACodeEditorSupported;
        CodeWndBtn.Enabled := ACodeEditorSupported;
        TIDEThemeMetrics.Font.AdjustDPISize(Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
        Result := ShowModal;
        AOutStrings := Lines;
        AModified := FModified;
      end;
    end,
    procedure (AOutStrings: TStrings)
    begin
      SetStrings(AOutStrings);
    end,
    shNone)
end;

procedure TStrEditDlg.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TStrEditDlg.CodeWndBtnClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

{ TValueListProperty }

function TValueListProperty.EditDialog: TStrEditDlg;
begin
  Result := TValueEditDlg.Create(Application);
end;

var
  StoredWidth, StoredHeight, StoredLeft, StoredTop: Integer;

procedure TStrEditDlg.FormDestroy(Sender: TObject);
begin
  StoredWidth := TIDEHighDPIService.ConvertToDefaultPPI(Self, Width);
  StoredHeight := TIDEHighDPIService.ConvertToDefaultPPI(Self, Height);
  StoredLeft := TIDEHighDPIService.ConvertToDefaultPPI(Self, Left);
  StoredTop := TIDEHighDPIService.ConvertToDefaultPPI(Self, Top);
end;

procedure TStrEditDlg.FormCreate;
var
  LStyle: TCustomStyleServices;
begin
  if TIDEThemeMetrics.Font.Enabled then
    Font.Assign(TIDEThemeMetrics.Font.GetFont);

  if ThemeProperties <> nil then
  begin
    LStyle := ThemeProperties.StyleServices;
    StyleElements := StyleElements - [seClient];
    Color := LStyle.GetSystemColor(clWindow);
    PanelBottom.StyleElements := PanelBottom.StyleElements - [seClient];
    PanelBottom.ParentBackground := False;
    PanelBottom.Color := LStyle.GetSystemColor(clBtnFace);
    IDEThemeManager.RegisterFormClass(TStrEditDlg);
    ThemeProperties.ApplyTheme(Self);
  end;
end;

procedure TStrEditDlg.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  if (StoredLeft <> 0) and FUpdatingPos then
    Left := ScaleValue(StoredLeft);
end;

procedure TStrEditDlg.FormShow(Sender: TObject);
var
  Monitor: TMonitor;
begin
  FUpdatingPos := True;
  if StoredWidth <> 0 then
    Width := ScaleValue(StoredWidth);
  if StoredHeight <> 0 then
    Height := ScaleValue(StoredHeight);

  Monitor := Screen.MonitorFromWindow(Application.MainFormHandle);
  if StoredLeft <> 0 then
    Left := ScaleValue(StoredLeft)
  else if Monitor <> nil then
    Left := Monitor.Left + ((Monitor.Width - Width) div 2)
  else
    Left := (Screen.Width - Width) div 2;

  if StoredTop <> 0 then
    Top := ScaleValue(StoredTop)
  else if Monitor <> nil then
    Top := Monitor.Top + ((Monitor.Height - Height) div 2)
  else
    Top := (Screen.Height - Height) div 2;
  FUpdatingPos := False;
end;

{ TWideStringListProperty }

destructor TWideStringListProperty.Destroy;
begin
  FreeAndNil(FStrings);
  inherited;
end;

function TWideStringListProperty.GetStrings: TStrings;
var
  WideStrings: TWideStrings;
begin
  WideStrings := TWideStrings(GetOrdValue);
  if FStrings = nil then
    FStrings := TStringList.Create;
  FStrings.Text := WideStrings.Text;
  Result := FStrings;
end;

procedure TWideStringListProperty.SetStrings(const Value: TStrings);
var
  WideStrings: TWideStrings;
begin
  WideStrings := TWideStrings(GetOrdValue);
  WideStrings.Text := Value.Text;
  SetOrdValue(IntPtr(WideStrings));
end;

{ TLongStringProperty }

function TLongStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;
    
procedure TLongStringProperty.Edit;
var
  Strs: TStringList;
begin
  Strs := nil;
  with TStringsEditDlg.Create(Application) do
  try
    Strs := TStringList.Create;
    Strs.TrailingLineBreak := False;
    Strs.Text := GetValue;
    Lines := Strs;
    ActiveControl := GetLinesControl;
    CodeEditorItem.Enabled := False;
    CodeWndBtn.Enabled := False;
    TIDEThemeMetrics.Font.AdjustDPISize(Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
    if ShowModal = mrOk then
    begin
      Strs.Clear;
      Strs.AddStrings(Lines);
      SetValue(Strs.Text);
    end;
  finally
    Strs.Free;
    Free;
  end;
end;

{ TLongWideStringProperty }

function TLongWideStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;
    
procedure TLongWideStringProperty.Edit;
var
  Strs: TStringList;
begin
  Strs := nil;
  with TStringsEditDlg.Create(Application) do
  try
    Strs := TStringList.Create;
    Strs.TrailingLineBreak := False;
    Strs.Text := GetValue;
    Lines := Strs;
    ActiveControl := GetLinesControl;
    CodeEditorItem.Enabled := False;
    CodeWndBtn.Enabled := False;
    TIDEThemeMetrics.Font.AdjustDPISize(Font, TIDEThemeMetrics.Font.Size, CurrentPPI);
    if ShowModal = mrOk then
    begin
      Strs.Clear;
      Strs.AddStrings(Lines);
      SetValue(WideString(Strs.Text));
    end;
  finally
    Strs.Free;
    Free;
  end;
end;

end.
