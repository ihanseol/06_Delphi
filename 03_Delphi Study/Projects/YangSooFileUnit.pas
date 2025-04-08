unit YangSooFileUnit;

interface

uses
  Windows, SysUtils, Classes, Vcl.Forms, Vcl.Dialogs, Vcl.Controls, System.Generics.Collections;

type
  TAQTBASE = class
  private
    FAQTESOLV_PATH: string;
    FDOCUMENTS: string;
    FSEND: string;
    FSEND2: string;
    FYANGSOO_EXCEL: string;
    FYANGSOO_REST: string;
    FYANSOO_SPEC: string;
    FTC_DIR: string;
    FSTEP_FILE: string;
    FLONG_FILE: string;
    FRECOVER_FILE: string;
    FISAQTOPEN: Boolean;
    FDEBUG_YES: Boolean;
    FDELAY: Double;
    FIS_BLOCK: Boolean;
    procedure PrintDebug(const Message: string);
  public
    constructor Create; virtual;
    procedure BlockUserInput;
    procedure UnblockUserInput;
    property AQTESOLV_PATH: string read FAQTESOLV_PATH;
    property DOCUMENTS: string read FDOCUMENTS;
    property SEND: string read FSEND;
    property SEND2: string read FSEND2;
    property DEBUG_YES: Boolean read FDEBUG_YES write FDEBUG_YES;
  end;

  TPathChecker = class
  private
    const
      RET_FILE = 1;
      RET_DIR = 2;
      RET_NOTHING = 0;
  public
    function CheckPath(const Path: string): Integer;
    function ResolvePath(const Path: string): Integer;
  end;

  TFileBase = class(TAQTBASE)
  private
    FDirectory: string;
    FFiles: TStringList;
    procedure SetDirectory(const Value: string);
    function GetFilesByExtension(const Extension: string): TStringList;
  public
    constructor Create(const Directory: string = 'D:\05_Send\'); override;
    destructor Destroy; override;
    procedure RefreshFiles;
    function GetXlsmFiles: TStringList;
    function GetXlsxFiles: TStringList;
    function GetAqtFiles: TStringList;
    function GetDatFiles: TStringList;
    function GetPrnFiles: TStringList;
    function GetPdfFiles: TStringList;
    function GetJpgFiles: TStringList;
    function GetImageFiles: TStringList;
    function GetListFiles(const FileList: array of string): TStringList;
    function GetXlsmFilter(const Path: string = ''; const SFilter: string = '*_ge_OriginalSaveFile.xlsm'): TStringList;
    function GetJpgFilter(const Path: string = ''; const SFilter: string = '*page1.jpg'): TStringList;
    function HasPath(const FileName: string): Boolean;
    function SeparateFileName(const FileName: string; out Name, Ext: string): Boolean;
    function SeparatePath(const FilePath: string; out Dir, BaseName: string): Boolean;
    function IsHidden(const FilePath: string): Boolean;
    function ListDirectoryContents(const Path: string): TStringList;
    function ListDirectoriesOnly(const Path: string): TStringList;
    function ListNonHiddenDirectories(const Path: string): TStringList;
    function ListHiddenDirectories(const Path: string): TStringList;
    function LastOne(const Path: string): string;
    function GetDirName(const FilePath: string): string;
    function GetBaseName(const FilePath: string): string;
    function IsExist(const FilePath: string): Boolean;
    function SetPathStringToSlash(const FilePath: string): string;
    function JoinPathFromList(const FilePathList: TStringList): string;
    function CopyFile(const Source, Destination: string): Boolean;
    function MoveFile(const Source, Destination: string): Boolean;
    function MoveFileCheck(const Source, Destination: string; RemoveYes: Boolean = False): Boolean;
    function DeleteFile(const FilePath: string): Boolean;
    function DeleteFiles(const FolderPath: string; const Files: TStringList): Boolean;
    function DeleteFilesInDirectory(const FolderPath: string): Boolean;
    function SelectFolder(const InitialDir: string = ''): string;
    function JoinPathToFileName(const FolderPath, FileName: string): string;
    property Directory: string read FDirectory write SetDirectory;
  end;

  TPrepareYangsoofile = class(TFileBase)
  public
    constructor Create(const Directory: string = 'D:\05_Send\'); override;
    procedure InitialSetYangsooExcel;
    procedure AqtFileToSend(WellNo: Integer = 1; AqtStepInclude: Boolean = False);
    procedure DuplicateYangsooExcel(Cnt: Integer);
  end;

  TTransferYangSooFile = class(TFileBase)
  private
    FBASEDIR: string;
    FYANGSOO_BASE: string;
    FPRN_BASE: string;
    FAQT_BASE: string;
    FYANGSOOILBO_BASE: string;
    FDIR_YANGSOO_TEST: string;
    FDIR_PRN: string;
    FDIR_AQT: string;
    FDIR_YANGSOOILBO: string;
    FISDIRSET: Boolean;
    function DirYangsooTest: string;
    function DirPrn: string;
    function DirAqt: string;
    function DirYangsooIlbo: string;
    procedure MoveFilesToDir(const SourcePath: string; const FilteredFiles: TDictionary<string, TStringList>;
      const Keys: array of string; const TargetDirectory, DebugMessage: string);
    function MoveFilesToDirCheck(const SourcePath: string; const FilteredFiles: TDictionary<string, TStringList>;
      const Keys: array of string; const TargetDirectory, DebugMessage: string): Boolean;
  public
    constructor Create(const Directory: string = ''); override;
    function IsItYangsooFolder(const FolderName: string): string;
    function IsItYangsooInside(const FolderName: string): Boolean;
    procedure SetDirInsideYangsooTest;
    function SetBASEDIR(const Directory: string = ''): string;  override;
    function MoveOriginToIhanseol(const FolderPath: string): Boolean;
    procedure Test;
  end;

implementation

uses
  IOUtils, Generics.Collections;

{ TAQTBASE }

constructor TAQTBASE.Create;
begin
  FAQTESOLV_PATH := 'C:\WHPA\AQTEver3.4(170414)\AQTW32.EXE';
  FDOCUMENTS := ExpandUNCFileName('~\Documents');
  FSEND := 'D:\05_Send\';
  FSEND2 := 'D:\06_Send2\';
  FYANGSOO_EXCEL := 'A1_ge_OriginalSaveFile.xlsm';
  FYANGSOO_REST := '_ge_OriginalSaveFile.xlsm';
  FYANSOO_SPEC := 'd:\05_Send\YanSoo_Spec.xlsx';
  FTC_DIR := 'C:\Program Files\totalcmd\AqtSolv\';
  FSTEP_FILE := '_01_step.aqt';
  FLONG_FILE := '_02_long.aqt';
  FRECOVER_FILE := '_03_recover.aqt';
  FISAQTOPEN := False;
  FDEBUG_YES := True;
  FDELAY := 0.2;
  FIS_BLOCK := False;
end;

procedure TAQTBASE.BlockUserInput;
begin
  BlockInput(True);
end;

procedure TAQTBASE.UnblockUserInput;
begin
  BlockInput(False);
end;

procedure TAQTBASE.PrintDebug(const Message: string);
begin
  if FDEBUG_YES then
    if Pos('*-@#$%&', Message) > 0 then
      Writeln(StringOfChar(Message[1], 180))
    else
      Writeln(Message);
end;

{ TPathChecker }

function TPathChecker.CheckPath(const Path: string): Integer;
begin
  if Path = '' then
    Exit(RET_NOTHING);
  if FileExists(Path) then
    Exit(RET_FILE);
  if DirectoryExists(Path) then
    Exit(RET_DIR);
  Exit(RET_NOTHING);
end;

function TPathChecker.ResolvePath(const Path: string): Integer;
begin
  Result := CheckPath(Path);
  case Result of
    RET_FILE: Writeln('Given Path is File');
    RET_DIR: Writeln('Given Path is DIR');
    RET_NOTHING: Writeln('Given Path is NOTHING');
  end;
end;

{ TFileBase }

constructor TFileBase.Create(const Directory: string);
begin
  inherited Create;
  FFiles := TStringList.Create;
  if CheckPath(Directory) = TPathChecker.RET_DIR then
    SetDirectory(Directory)
  else
    SetDirectory('D:\05_Send\');
end;

destructor TFileBase.Destroy;
begin
  FFiles.Free;
  inherited;
end;

procedure TFileBase.SetDirectory(const Value: string);
begin
  FDirectory := IncludeTrailingPathDelimiter(Value);
  RefreshFiles;
end;

procedure TFileBase.RefreshFiles;
begin
  FFiles.Clear;
  if DirectoryExists(FDirectory) then
    FFiles.AddStrings(TDirectory.GetFiles(FDirectory));
end;

function TFileBase.GetFilesByExtension(const Extension: string): TStringList;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to FFiles.Count - 1 do
    if SameText(ExtractFileExt(FFiles[I]), Extension) then
      Result.Add(FFiles[I]);
end;

function TFileBase.GetXlsmFiles: TStringList;
begin
  Result := GetFilesByExtension('.xlsm');
end;

function TFileBase.GetXlsxFiles: TStringList;
begin
  Result := GetFilesByExtension('.xlsx');
end;

function TFileBase.GetAqtFiles: TStringList;
begin
  Result := GetFilesByExtension('.aqt');
end;

function TFileBase.GetDatFiles: TStringList;
begin
  Result := GetFilesByExtension('.dat');
end;

function TFileBase.GetPrnFiles: TStringList;
begin
  Result := GetFilesByExtension('.prn');
end;

function TFileBase.GetPdfFiles: TStringList;
begin
  Result := GetFilesByExtension('.pdf');
end;

function TFileBase.GetJpgFiles: TStringList;
begin
  Result := GetFilesByExtension('.jpg');
end;

function TFileBase.GetImageFiles: TStringList;
begin
  Result := GetListFiles(['.jpg', '.jpeg', '.png']);
end;

function TFileBase.GetListFiles(const FileList: array of string): TStringList;
var
  Ext: string;
  I: Integer;
begin
  Result := TStringList.Create;
  for Ext in FileList do
    Result.AddStrings(GetFilesByExtension(Ext));
end;

function TFileBase.GetXlsmFilter(const Path, SFilter: string): TStringList;
begin
  if Path <> '' then
    SetDirectory(Path);
  Result := TStringList.Create;
  Result.AddStrings(TDirectory.GetFiles(FDirectory, SFilter, TSearchOption.soTopDirectoryOnly));
end;

function TFileBase.GetJpgFilter(const Path, SFilter: string): TStringList;
begin
  if Path <> '' then
    SetDirectory(Path);
  Result := TStringList.Create;
  Result.AddStrings(TDirectory.GetFiles(FDirectory, SFilter, TSearchOption.soTopDirectoryOnly));
end;

function TFileBase.HasPath(const FileName: string): Boolean;
var
  Head, Tail: string;
begin
  Head := ExtractFilePath(FileName);
  Tail := ExtractFileName(FileName);
  Writeln(Format('head: ''%s''  tail: ''%s''  includes a path.', [Head, Tail]));
  Result := Head <> '';
end;

function TFileBase.SeparateFileName(const FileName: string; out Name, Ext: string): Boolean;
begin
  Name := ChangeFileExt(FileName, '');
  Ext := ExtractFileExt(FileName);
  Result := True;
end;

function TFileBase.SeparatePath(const FilePath: string; out Dir, BaseName: string): Boolean;
begin
  Dir := ExtractFilePath(FilePath);
  BaseName := ExtractFileName(FilePath);
  Result := True;
end;

function TFileBase.IsHidden(const FilePath: string): Boolean;
var
  Attrs: DWORD;
begin
  Attrs := GetFileAttributes(PChar(FilePath));
  Result := (Attrs <> INVALID_FILE_ATTRIBUTES) and (Attrs and FILE_ATTRIBUTE_HIDDEN <> 0);
end;

function TFileBase.ListDirectoryContents(const Path: string): TStringList;
begin
  Result := TStringList.Create;
  try
    Result.AddStrings(TDirectory.GetFileSystemEntries(Path));
  except
    on E: EDirectoryNotFoundException do
      Result.Add(Format('The directory ''%s'' does not exist.', [Path]));
    on E: EAccessDenied do
      Result.Add(Format('Permission denied to access the directory ''%s''.', [Path]));
    on E: Exception do
      Result.Add(Format('An error occurred: %s', [E.Message]));
  end;
end;

function TFileBase.ListDirectoriesOnly(const Path: string): TStringList;
var
  NonHidden, Hidden: TStringList;
  I: Integer;
begin
  Result := TStringList.Create;
  NonHidden := ListNonHiddenDirectories(Path);
  Hidden := ListHiddenDirectories(Path);
  try
    for I := 0 to NonHidden.Count - 1 do
      if Hidden.IndexOf(NonHidden[I]) = -1 then
        Result.Add(NonHidden[I]);
  finally
    NonHidden.Free;
    Hidden.Free;
  end;
end;

function TFileBase.ListNonHiddenDirectories(const Path: string): TStringList;
begin
  Result := TStringList.Create;
  try
    Result.AddStrings(TDirectory.GetDirectories(Path, function(const Dir: string): Boolean
    begin
      Result := not Dir.StartsWith('.');
    end));
  except
    on E: EDirectoryNotFoundException do
      Result.Add(Format('The directory ''%s'' does not exist.', [Path]));
    on E: EAccessDenied do
      Result.Add(Format('Permission denied to access the directory ''%s''.', [Path]));
    on E: Exception do
      Result.Add(Format('An error occurred: %s', [E.Message]));
  end;
end;

function TFileBase.ListHiddenDirectories(const Path: string): TStringList;
var
  Dirs: TArray<string>;
  I: Integer;
begin
  Result := TStringList.Create;
  try
    Dirs := TDirectory.GetDirectories(Path);
    for I := 0 to High(Dirs) do
      if IsHidden(Dirs[I]) then
        Result.Add(LastOne(Dirs[I]));
  except
    on E: EDirectoryNotFoundException do
      Result.Add(Format('The directory ''%s'' does not exist.', [Path]));
    on E: EAccessDenied do
      Result.Add(Format('Permission denied to access the directory ''%s''.', [Path]));
    on E: Exception do
      Result.Add(Format('An error occurred: %s', [E.Message]));
  end;
end;

function TFileBase.LastOne(const Path: string): string;
var
  Parts: TArray<string>;
begin
  Parts := Path.Split(['\']);
  Result := Parts[High(Parts)];
end;

function TFileBase.GetDirName(const FilePath: string): string;
begin
  if CheckPath(FilePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', FilePath);
    Exit('');
  end;
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(FilePath));
end;

function TFileBase.GetBaseName(const FilePath: string): string;
begin
  if CheckPath(FilePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', FilePath);
    Exit('');
  end;
  Result := ExtractFileName(FilePath);
end;

function TFileBase.IsExist(const FilePath: string): Boolean;
begin
  if CheckPath(FilePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', FilePath);
    Exit(False);
  end;
  Result := FileExists(FilePath) or DirectoryExists(FilePath);
end;

function TFileBase.SetPathStringToSlash(const FilePath: string): string;
begin
  Result := StringReplace(FilePath, '\', '/', [rfReplaceAll]);
end;

function TFileBase.JoinPathFromList(const FilePathList: TStringList): string;
var
  I: Integer;
begin
  Result := FilePathList[0];
  for I := 1 to FilePathList.Count - 1 do
    Result := Result + SetPathStringToSlash(FilePathList[I]);
  Result := SetPathStringToSlash(Result);
  Writeln('join_path_from_list: ', Result);
end;

function TFileBase.CopyFile(const Source, Destination: string): Boolean;
begin
  try
    TFile.Copy(Source, Destination, True);
    Writeln(Format('File copied successfully from ''%s'' to ''%s''', [Source, Destination]));
    Result := True;
  except
    on E: Exception do
    begin
      Writeln(Format('Error copying file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

function TFileBase.MoveFile(const Source, Destination: string): Boolean;
begin
  try
    if FileExists(Destination) then
    begin
      TFile.Delete(Destination);
      Writeln(Format('Removed existing file: %s', [Destination]));
    end;
    TFile.Move(Source, Destination);
    Writeln(Format('File moved successfully from ''%s'' to ''%s''', [Source, Destination]));
    Result := True;
  except
    on E: Exception do
    begin
      Writeln(Format('Error moving file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

function TFileBase.MoveFileCheck(const Source, Destination: string; RemoveYes: Boolean): Boolean;
begin
  try
    if FileExists(Destination) then
    begin
      if RemoveYes then
      begin
        TFile.Delete(Destination);
        Writeln(Format('Removed existing file: %s', [Destination]));
      end
      else
        Exit(False);
    end;
    TFile.Move(Source, Destination);
    Writeln(Format('File moved successfully from ''%s'' to ''%s''', [Source, Destination]));
    Result := True;
  except
    on E: Exception do
    begin
      Writeln(Format('Error moving file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

function TFileBase.DeleteFile(const FilePath: string): Boolean;
begin
  if CheckPath(FilePath) = TPathChecker.RET_FILE then
  begin
    try
      if FileExists(FilePath) then
      begin
        TFile.Delete(FilePath);
        Writeln(Format('%s removed successfully from %s.', [GetBaseName(FilePath), GetDirName(FilePath)]));
        Result := True;
      end
      else
      begin
        Writeln(Format('The file %s does not exist ...', [FilePath]));
        Result := True;
      end;
    except
      on E: Exception do
      begin
        Writeln(Format('Error deleting %s: %s', [FilePath, E.Message]));
        Result := False;
      end;
    end;
  end
  else
    Result := False;
end;

function TFileBase.DeleteFiles(const FolderPath: string; const Files: TStringList): Boolean;
var
  FilePath: string;
  I: Integer;
begin
  Result := True;
  try
    for I := 0 to Files.Count - 1 do
    begin
      FilePath := IncludeTrailingPathDelimiter(FolderPath) + Files[I];
      if CheckPath(FilePath) = TPathChecker.RET_FILE then
      begin
        try
          TFile.Delete(FilePath);
          Writeln(Format('%s removed successfully from %s', [Files[I], FolderPath]));
        except
          on E: Exception do
          begin
            Writeln(Format('Error deleting %s: %s', [Files[I], E.Message]));
            Result := False;
            Exit;
          end;
        end;
      end
      else
        Writeln(Format('The file %s does not exist in the folder %s or its a directory', [Files[I], FolderPath]));
    end;
  except
    on E: Exception do
    begin
      Writeln(Format('An error occurred while deleting files: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

function TFileBase.DeleteFilesInDirectory(const FolderPath: string): Boolean;
var
  Files: TStringList;
begin
  if CheckPath(FolderPath) = TPathChecker.RET_DIR then
  begin
    Files := TStringList.Create;
    try
      Files.AddStrings(TDirectory.GetFiles(FolderPath));
      Writeln(Format('delete_files_in_directory - %s', [Files.Text]));
      Result := DeleteFiles(FolderPath, Files);
    finally
      Files.Free;
    end;
  end
  else
  begin
    Writeln(Format('delete_files_in_directory: %s its not a directory', [FolderPath]));
    Result := False;
  end;
end;

function TFileBase.SelectFolder(const InitialDir: string): string;
var
  Dialog: TFileOpenDialog;
begin
  Dialog := TFileOpenDialog.Create(nil);
  try
    Dialog.Options := [fdoPickFolders];
    if InitialDir <> '' then
      Dialog.DefaultFolder := InitialDir
    else
      Dialog.DefaultFolder := SEND;
    if Dialog.Execute then
    begin
      Result := Dialog.FileName;
      Writeln('Selected folder: ', Result);
    end
    else
    begin
      Result := '';
      Writeln('No folder selected.');
    end;
  finally
    Dialog.Free;
  end;
end;

function TFileBase.JoinPathToFileName(const FolderPath, FileName: string): string;
begin
  if CheckPath(FolderPath) = TPathChecker.RET_DIR then
    Result := IncludeTrailingPathDelimiter(FolderPath) + FileName
  else
    Result := FolderPath;
  Result := StringReplace(Result, '/', '\', [rfReplaceAll]);
  Writeln('join_path: ', Result);
end;

{ TPrepareYangsoofile }

constructor TPrepareYangsoofile.Create(const Directory: string);
begin
  inherited Create(Directory);
  Writeln('init FileProcessing ', Directory);
end;

procedure TPrepareYangsoofile.InitialSetYangsooExcel;
begin
  CopyFile(TC_DIR + YANGSOO_EXCEL, SEND + YANGSOO_EXCEL);
end;

procedure TPrepareYangsoofile.AqtFileToSend(WellNo: Integer; AqtStepInclude: Boolean);
begin
  if AqtStepInclude then
    CopyFile(TC_DIR + STEP_FILE, SEND + Format('w%d%s', [WellNo, STEP_FILE]));
  CopyFile(TC_DIR + LONG_FILE, SEND + Format('w%d%s', [WellNo, LONG_FILE]));
  CopyFile(TC_DIR + RECOVER_FILE, SEND + Format('w%d%s', [WellNo, RECOVER_FILE]));
end;

procedure TPrepareYangsoofile.DuplicateYangsooExcel(Cnt: Integer);
var
  I: Integer;
begin
  DeleteFilesInDirectory(SEND);
  InitialSetYangsooExcel;
  for I := 2 to Cnt do
    CopyFile(SEND + YANGSOO_EXCEL, SEND + Format('A%d%s', [I, YANGSOO_REST]));
end;

{ TTransferYangSooFile }

constructor TTransferYangSooFile.Create(const Directory: string);
begin
  inherited Create;
  FBASEDIR := Directory;
  FYANGSOO_BASE := '\04_양수시험';
  FPRN_BASE := '\01_Prn Save File\';
  FAQT_BASE := '\02_AQTEver3.4(170414)\';
  FYANGSOOILBO_BASE := '\03_양수일보\';
  FISDIRSET := False;
end;

function TTransferYangSooFile.IsItYangsooFolder(const FolderName: string): string;
var
  DirList: TStringList;
  CurrentYear: Integer;
begin
  CurrentYear := YearOf(Now);
  DirList := TStringList.Create;
  try
    DirList.Delimiter := '\';
    DirList.DelimitedText := StringReplace(FolderName, '/', '\', [rfReplaceAll]);
    if (DirList.Count < 4) or (Pos('개소', DirList[3]) > 0) then
      Exit('MORE');
    if (DirList[1] = '09_hardRain') and DirList[2].EndsWith(IntToStr(CurrentYear)) then
      Result := DirList[0] + '\' + DirList[1] + '\' + DirList[2] + '\' + DirList[3]
    else
      Result := 'FALSE';
  finally
    DirList.Free;
  end;
end;

function TTransferYangSooFile.IsItYangsooInside(const FolderName: string): Boolean;
var
  DirList: TStringList;
  I: Integer;
begin
  DirList := ListDirectoriesOnly(FolderName);
  try
    for I := 0 to DirList.Count - 1 do
      if DirList[I] = '04_양수시험' then
        Exit(True);
    Result := False;
  finally
    DirList.Free;
  end;
end;

function TTransferYangSooFile.DirYangsooTest: string;
begin
  FDIR_YANGSOO_TEST := JoinPathFromList(TStringList.Create.Text := FBASEDIR + FYANGSOO_BASE);
  if not DirectoryExists(FDIR_YANGSOO_TEST) then
    ForceDirectories(FDIR_YANGSOO_TEST);
  Result := FDIR_YANGSOO_TEST;
end;

function TTransferYangSooFile.DirPrn: string;
begin
  FDIR_PRN := JoinPathFromList(TStringList.Create.Text := FBASEDIR + FYANGSOO_BASE + FPRN_BASE);
  if not DirectoryExists(FDIR_PRN) then
    ForceDirectories(FDIR_PRN);
  Result := FDIR_PRN;
end;

function TTransferYangSooFile.DirAqt: string;
begin
  FDIR_AQT := JoinPathFromList(TStringList.Create.Text := FBASEDIR + FYANGSOO_BASE + FAQT_BASE);
  if not DirectoryExists(FDIR_AQT) then
    ForceDirectories(FDIR_AQT);
  Result := FDIR_AQT;
end;

function TTransferYangSooFile.DirYangsooIlbo: string;
begin
  FDIR_YANGSOOILBO := JoinPathFromList(TStringList.Create.Text := FBASEDIR + FYANGSOO_BASE + FYANGSOOILBO_BASE);
  if not DirectoryExists(FDIR_YANGSOOILBO) then
    ForceDirectories(FDIR_YANGSOOILBO);
  Result := FDIR_YANGSOOILBO;
end;

procedure TTransferYangSooFile.SetDirInsideYangsooTest;
var
  InsideYangsooTest: TStringList;
  Arg01, Arg02, Arg03: string;
begin
  if CheckPath(DirYangsooTest) <> TPathChecker.RET_DIR then
  begin
    ForceDirectories(FDIR_YANGSOO_TEST);
    ChDir(FDIR_YANGSOO_TEST);
    PrintDebug(DirPrn);
    PrintDebug(DirAqt);
    PrintDebug(DirYangsooIlbo);
  end
  else
  begin
    InsideYangsooTest := ListDirectoriesOnly(FDIR_YANGSOO_TEST);
    try
      Writeln(FDIR_YANGSOO_TEST);
      if InsideYangsooTest.Count > 0 then
      begin
        Writeln(InsideYangsooTest.Text);
        ChDir(FDIR_YANGSOO_TEST);
        Arg01 := '';
        Arg02 := '';
        Arg03 := '';
        for var I := 0 to InsideYangsooTest.Count - 1 do
        begin
          if InsideYangsooTest[I].StartsWith('01') then Arg01 := InsideYangsooTest[I];
          if InsideYangsooTest[I].StartsWith('02') then Arg02 := InsideYangsooTest[I];
          if InsideYangsooTest[I].StartsWith('03') then Arg03 := InsideYangsooTest[I];
        end;
        Writeln(Arg01);
        Writeln(Arg02);
        Writeln(Arg03);
        FDIR_PRN := JoinPathFromList(TStringList.Create.Text := FDIR_YANGSOO_TEST + '\' + Arg01);
        FDIR_AQT := JoinPathFromList(TStringList.Create.Text := FDIR_YANGSOO_TEST + '\' + Arg02);
        FDIR_YANGSOOILBO := JoinPathFromList(TStringList.Create.Text := FDIR_YANGSOO_TEST + '\' + Arg03);
      end
      else
      begin
        ChDir(FDIR_YANGSOO_TEST);
        PrintDebug(DirPrn);
        PrintDebug(DirAqt);
        PrintDebug(DirYangsooIlbo);
      end;
    finally
      InsideYangsooTest.Free;
    end;
  end;
end;

function TTransferYangSooFile.SetBASEDIR(const Directory: string): string;
var
  SelFolder: string;
  CurrentYear: Integer;
begin
  CurrentYear := YearOf(Now);
  Writeln(StringOfChar('*', 50));
  Writeln(Directory);
  Writeln(StringOfChar('*', 50));

  if (Directory <> '') and (CheckPath(Directory) = TPathChecker.RET_DIR) then
    FBASEDIR := Directory
  else
  begin
    SelFolder := SelectFolder(Format('d:\09_hardRain\09_ihanseol - %d\', [CurrentYear]));
    FBASEDIR := IsItYangsooFolder(SelFolder);
  end;

  if FBASEDIR = 'FALSE' then
  begin
    PrintDebug('it''s not yangsoo folder');
    FISDIRSET := False;
    Exit('FALSE');
  end;
  if FBASEDIR = 'MORE' then
  begin
    PrintDebug('it''s not yangsoo folder, need one more deep');
    FISDIRSET := False;
    Exit('FALSE');
  end;

  SetDirInsideYangsooTest;
  FISDIRSET := True;
  Result := FBASEDIR;
end;

function TTransferYangSooFile.MoveOriginToIhanseol(const FolderPath: string): Boolean;
var
  fb: TFileBase;
  FileMappings: TDictionary<string, TStringList>;
  FilteredFiles: TDictionary<string, TStringList>;
  Files: TStringList;
  F: string;
begin
  fb := TFileBase.Create;
  try
    fb.SetDirectory(FolderPath);

    FileMappings := TDictionary<string, TStringList>.Create;
    FilteredFiles := TDictionary<string, TStringList>.Create;
    try
      FileMappings.Add('aqt', fb.GetAqtFiles);
      FileMappings.Add('pdf', fb.GetPdfFiles);
      FileMappings.Add('xlsx', fb.GetXlsxFiles);
      FileMappings.Add('xlsm', fb.GetXlsmFiles);
      FileMappings.Add('prn', fb.GetPrnFiles);
      FileMappings.Add('jpg_a', fb.GetJpgFilter('', 'a*page*'));
      FileMappings.Add('jpg_p', fb.GetJpgFilter('', 'p*page*'));
      FileMappings.Add('jpg_w', fb.GetJpgFilter('', 'w*page*'));

      FilteredFiles.Add('w_aqt', TStringList.Create);
      FilteredFiles.Add('a_pdf', TStringList.Create);
      FilteredFiles.Add('w_pdf', TStringList.Create);
      FilteredFiles.Add('p_pdf', TStringList.Create);
      FilteredFiles.Add('jpg_a', FileMappings['jpg_a']);
      FilteredFiles.Add('jpg_p', FileMappings['jpg_p']);
      FilteredFiles.Add('jpg_w', FileMappings['jpg_w']);
      FilteredFiles.Add('xlsx', FileMappings['xlsx']);
      FilteredFiles.Add('xlsm', FileMappings['xlsm']);
      FilteredFiles.Add('prn', FileMappings['prn']);

      for F in FileMappings['aqt'] do
        if F.StartsWith('w') then FilteredFiles['w_aqt'].Add(F);
      for F in FileMappings['pdf'] do
      begin
        if F.StartsWith('a') then FilteredFiles['a_pdf'].Add(F);
        if F.StartsWith('w') then FilteredFiles['w_pdf'].Add(F);
        if F.StartsWith('p') then FilteredFiles['p_pdf'].Add(F);
      end;

      PrintDebug('-');
      for var Pair in FilteredFiles do
        Writeln(Format('%s: %s', [Pair.Key, Pair.Value.Text]));
      PrintDebug('-');

      if FilteredFiles['prn'].Count > 0 then
        if MoveFilesToDirCheck(FolderPath, FilteredFiles, ['prn'], FDIR_PRN, 'Prn Files') then
        begin
          PrintDebug('File Already Exists .... ');
          Exit(False);
        end;

      if (FilteredFiles['xlsx'].Count > 0) or (FilteredFiles['xlsm'].Count > 0) then
        MoveFilesToDir(FolderPath, FilteredFiles, ['xlsx', 'xlsm'], FDIR_YANGSOO_TEST, 'YangSoo Test');

      if (FilteredFiles['a_pdf'].Count > 0) or (FilteredFiles['jpg_a'].Count > 0) or
         (FilteredFiles['w_aqt'].Count > 0) or (FilteredFiles['jpg_w'].Count > 0) or
         (FilteredFiles['w_pdf'].Count > 0) then
        MoveFilesToDir(FolderPath, FilteredFiles, ['a_pdf', 'p_pdf', 'jpg_a', 'jpg_p', 'w_aqt'],
          FDIR_AQT, '02_AQTEver3.4(170414)');

      if (FilteredFiles['jpg_w'].Count > 0) or (FilteredFiles['w_pdf'].Count > 0) then
        MoveFilesToDir(FolderPath, FilteredFiles, ['jpg_w', 'w_pdf'], FDIR_YANGSOOILBO, 'yangsoo ilbo');

      Result := True;
    finally
      for var Pair in FilteredFiles do
        Pair.Value.Free;
      FileMappings.Free;
      FilteredFiles.Free;
    end;
  finally
    fb.Free;
  end;
end;

procedure TTransferYangSooFile.MoveFilesToDir(const SourcePath: string; const FilteredFiles: TDictionary<string, TStringList>;
  const Keys: array of string; const TargetDirectory, DebugMessage: string);
var
  fb: TFileBase;
  Key: string;
  F: string;
begin
  fb := TFileBase.Create;
  try
    Writeln(Format('this is goto %s', [DebugMessage]));
    for Key in Keys do
      for F in FilteredFiles[Key] do
      begin
        fb.MoveFile(JoinPathToFileName(SourcePath, F), JoinPathToFileName(TargetDirectory, F));
      end;
  finally
    fb.Free;
  end;
end;

function TTransferYangSooFile.MoveFilesToDirCheck(const SourcePath: string; const FilteredFiles: TDictionary<string, TStringList>;
  const Keys: array of string; const TargetDirectory, DebugMessage: string): Boolean;
var
  fb: TFileBase;
  Key: string;
  F: string;
begin
  fb := TFileBase.Create;
  try
    Writeln(Format('this is goto %s', [DebugMessage]));
    for Key in Keys do
      for F in FilteredFiles[Key] do
        if not fb.MoveFileCheck(JoinPathToFileName(SourcePath, F), JoinPathToFileName(TargetDirectory, F), False) then
          Exit(True);
    Result := False;
  finally
    fb.Free;
  end;
end;

procedure TTransferYangSooFile.Test;
var
  fb: TFileBase;
begin
  fb := TFileBase.Create;
  try
    fb.SetDirectory(DOCUMENTS);
    Writeln(fb.GetListFiles(['.dat', '.xlsm']).Text);
  finally
    fb.Free;
  end;
end;

end.