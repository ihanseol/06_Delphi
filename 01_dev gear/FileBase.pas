unit AQTBase;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Vcl.Forms, Vcl.StdCtrls,
  System.IOUtils, Winapi.Windows, System.StrUtils, System.Masks, System.DateUtils,
  Vcl.Clipbrd, ShellAPI, System.Types, System.RegularExpressions;

type
  TPathCheckerReturnType = (RetNothing = 0, RetFile = 1, RetDir = 2);

  TAQTBase = class
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
  public
    constructor Create;
    procedure BlockUserInput;
    procedure UnblockUserInput;
    procedure PrintDebug(const message: string);
    
    property AQTESOLV_PATH: string read FAQTESOLV_PATH write FAQTESOLV_PATH;
    property DOCUMENTS: string read FDOCUMENTS write FDOCUMENTS;
    property SEND: string read FSEND write FSEND;
    property SEND2: string read FSEND2 write FSEND2;
    property YANGSOO_EXCEL: string read FYANGSOO_EXCEL write FYANGSOO_EXCEL;
    property YANGSOO_REST: string read FYANGSOO_REST write FYANGSOO_REST;
    property YANSOO_SPEC: string read FYANSOO_SPEC write FYANSOO_SPEC;
    property TC_DIR: string read FTC_DIR write FTC_DIR;
    property STEP_FILE: string read FSTEP_FILE write FSTEP_FILE;
    property LONG_FILE: string read FLONG_FILE write FLONG_FILE;
    property RECOVER_FILE: string read FRECOVER_FILE write FRECOVER_FILE;
    property ISAQTOPEN: Boolean read FISAQTOPEN write FISAQTOPEN;
    property DEBUG_YES: Boolean read FDEBUG_YES write FDEBUG_YES;
    property DELAY: Double read FDELAY write FDELAY;
    property IS_BLOCK: Boolean read FIS_BLOCK write FIS_BLOCK;
  end;

  TPathChecker = class
  private
    class function SeparateFileName(const filename: string): TArray<string>;
  public
    const
      RET_FILE = 1;
      RET_DIR = 2;
      RET_NOTHING = 0;
    
    class function CheckPath(const path: string): Integer;
    function ResolvePath(const path: string): Integer;
    class function SeparatePath(const filePath: string): TArray<string>;
    class function IsHidden(const filePath: string): Boolean;
  end;

  TFileBase = class(TAQTBase)
  private
    FFiles: TStringList;
    FDirectory: string;
    procedure SetDirectory(const Value: string);
    function GetFiles: TStringList;
    procedure InternalSetDirectory(const directory: string);
    function GetFilesByExtension(const extension: string): TStringList;
  public
    constructor Create(directory: string = '');
    destructor Destroy; override;
    
    function GetXlsmFiles: TStringList;
    function GetXlsxFiles: TStringList;
    function GetAqtFiles: TStringList;
    function GetDatFiles: TStringList;
    function GetPrnFiles: TStringList;
    function GetPdfFiles: TStringList;
    function GetJpgFiles: TStringList;
    function GetImageFiles: TStringList;
    function GetListFiles(const fileList: TArray<string>): TStringList;
    function GetXlsmFilter(const path: string = ''; const sfilter: string = '*_ge_OriginalSaveFile.xlsm'): TStringList;
    function GetJpgFilter(const path: string = ''; const sfilter: string = '*page1.jpg'): TStringList;
    
    function HasPath(const fileName: string): Boolean;
    function SeparateFileName(const filename: string): TArray<string>;
    class function SeparatePath(const filePath: string): TArray<string>;
    function IsHidden(const filePath: string): Boolean;
    function ListDirectoryContents(const path: string): TStringList;
    function ListDirectoriesOnly(const path: string): TStringList;
    class function LastOne(const path: string): string;
    function ListHiddenDirectories(const path: string): TStringList;
    function ListNonHiddenDirectories(const path: string): TStringList;
    
    function GetDirname(const filePath: string): string;
    function GetBasename(const filePath: string): string;
    function IsExist(const filePath: string): Boolean;
    function IsValid(const filePath: string): Boolean;
    class function SetPathstringToSlash(const filePath: string): string;
    function JoinPathFromList(const filePathList: TArray<string>): string;
    
    class function CopyFile(const source, destination: string): Boolean;
    class function MoveFile(const source, destination: string): Boolean;
    class function MoveFileCheck(const source, destination: string; removeYes: Boolean = False): Boolean;
    function DeleteFile(const filePath: string): Boolean;
    function DeleteFiles(const folderPath: string; const files: TStringList): Boolean;
    function DeleteFilesInDirectory(const folderPath: string): Boolean;
    
    class procedure EraseAllYangsooTestFiles(const directory: string);
    class function AskYesNoQuestion(const directory: string = ''): Boolean;
    function SelectFolder(const initialDir: string = ''): string;
    function JoinPathToFilename(const folderPath, fileName: string): string;
    function UnfoldPath(const folderPath: string): TArray<string>;
    class function JoinPathReverse(const folderList: TArray<string>; n: Integer = 0): string;
    class function JoinPathForward(const folderList: TArray<string>; n: Integer = 0): string;
    
    property Directory: string read FDirectory write SetDirectory;
    property Files: TStringList read GetFiles;
  end;

  TPrepareYangsooFile = class(TFileBase)
  public
    constructor Create(directory: string = '');
    procedure InitialSetYangsooExcel;
    procedure AqtFileToSend(wellNo: Integer = 1; aqtstepInclude: Boolean = False);
    procedure DuplicateYangsooExcel(cnt: Integer);
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
    FIsDIRSET: Boolean;
    
    procedure _MoveFilesToDir(const sourcePath: string; filteredFiles: TDictionary<string, TStringList>; 
                              const keys: TArray<string>; const targetDirectory, debugMessage: string);
    function _MoveFilesToDirCheck(const sourcePath: string; filteredFiles: TDictionary<string, TStringList>; 
                                 const keys: TArray<string>; const targetDirectory, debugMessage: string): Boolean;
  public
    constructor Create(const directory: string = '');
    destructor Destroy; override;
    
    function IsitYangsooFolder(const folderName: string): string;
    function IsitYangsooInside(const folderName: string): Boolean;
    function DirYangsooTest: string;
    function DirPrn: string;
    function DirAqt: string;
    function DirYangsooIlbo: string;
    procedure SetdirInsideYangsootest;
    function SetBASEDIR(const directory: string = ''): string;
    function MoveOriginToIhanseol(const folderPath: string): Boolean;
    procedure Test;
    
    property BASEDIR: string read FBASEDIR write FBASEDIR;
    property DIR_YANGSOO_TEST: string read FDIR_YANGSOO_TEST write FDIR_YANGSOO_TEST;
    property DIR_PRN: string read FDIR_PRN write FDIR_PRN;
    property DIR_AQT: string read FDIR_AQT write FDIR_AQT;
    property DIR_YANGSOOILBO: string read FDIR_YANGSOOILBO write FDIR_YANGSOOILBO;
    property IsDIRSET: Boolean read FIsDIRSET write FIsDIRSET;
  end;

implementation

uses
  System.Generics.Collections;

{ TAQTBase }

constructor TAQTBase.Create;
begin
  FAQTESOLV_PATH := 'C:\WHPA\AQTEver3.4(170414)\AQTW32.EXE';
  FDOCUMENTS := IncludeTrailingPathDelimiter(TPath.GetDocumentsPath);
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
  {
  self.IS_BLOCK = False :
   because while running the program causes block or wait for user input
   then can't do anything
   so it must be False, user input allowed ...
  }
end;

procedure TAQTBase.BlockUserInput;
begin
  BlockInput(True);
end;

procedure TAQTBase.UnblockUserInput;
begin
  BlockInput(False);
end;

procedure TAQTBase.PrintDebug(const message: string);
begin
  if FDEBUG_YES then
  begin
    if Pos('*-@#$%&', message) > 0 then
      Writeln(StringOfChar(message[1], 180))
    else
      Writeln(message);
  end;
end;

{ TPathChecker }

class function TPathChecker.CheckPath(const path: string): Integer;
begin
  if path = '' then
    Exit(RET_NOTHING);
    
  if TFile.Exists(path) then
    Result := RET_FILE
  else if TDirectory.Exists(path) then
    Result := RET_DIR
  else
    Result := RET_NOTHING;
end;

function TPathChecker.ResolvePath(const path: string): Integer;
begin
  if path = '' then
    Exit(RET_NOTHING);
    
  case CheckPath(path) of
    RET_FILE:
      begin
        Writeln('Given Path is File');
        Result := RET_FILE;
      end;
    RET_DIR:
      begin
        Writeln('Given Path is DIR');
        Result := RET_DIR;
      end;
    RET_NOTHING:
      begin
        Writeln('Given Path is NOTHING');
        Result := RET_NOTHING;
      end;
    else
      begin
        Writeln('Given Path is NOTHING');
        Result := RET_NOTHING;
      end;
  end;
end;

class function TPathChecker.SeparateFileName(const filename: string): TArray<string>;
var
  name, ext: string;
begin
  name := TPath.GetFileNameWithoutExtension(filename);
  ext := TPath.GetExtension(filename);
  SetLength(Result, 2);
  Result[0] := name;
  Result[1] := ext;
end;

class function TPathChecker.SeparatePath(const filePath: string): TArray<string>;
begin
  SetLength(Result, 2);
  Result[0] := TPath.GetDirectoryName(filePath);
  Result[1] := TPath.GetFileName(filePath);
end;

class function TPathChecker.IsHidden(const filePath: string): Boolean;
var
  attrs: Cardinal;
begin
  attrs := GetFileAttributes(PChar(filePath));
  if attrs <> INVALID_FILE_ATTRIBUTES then
    Result := (attrs and FILE_ATTRIBUTE_HIDDEN) <> 0
  else
    Result := False;
end;

{ TFileBase }

constructor TFileBase.Create(directory: string = '');
begin
  inherited Create;
  
  FFiles := TStringList.Create;
  
  if directory = '' then
  begin
    Writeln('in File Base, directory is empty');
    directory := FSEND;
  end;
  
  if TPathChecker.CheckPath(directory) <> TPathChecker.RET_NOTHING then
    InternalSetDirectory(directory)
  else
    InternalSetDirectory('d:\05_Send\');
end;

destructor TFileBase.Destroy;
begin
  FFiles.Free;
  inherited;
end;

procedure TFileBase.InternalSetDirectory(const directory: string);
begin
  FDirectory := directory;
  ChDir(FDirectory);
  FFiles.Clear;
  
  if TDirectory.Exists(directory) then
    FFiles.AddStrings(TDirectory.GetFiles(directory, '*.*', TSearchOption.soTopDirectoryOnly));
end;

procedure TFileBase.SetDirectory(const Value: string);
begin
  if FDirectory <> Value then
    InternalSetDirectory(Value);
end;

function TFileBase.GetFiles: TStringList;
begin
  Result := FFiles;
end;

function TFileBase.GetFilesByExtension(const extension: string): TStringList;
var
  i: Integer;
  fileName: string;
  resultList: TStringList;
begin
  resultList := TStringList.Create;
  
  // Update files in the current directory
  FFiles.Clear;
  FFiles.AddStrings(TDirectory.GetFiles(FDirectory, '*.*', TSearchOption.soTopDirectoryOnly));
  
  // Add only files with matching extension
  for i := 0 to FFiles.Count - 1 do
  begin
    fileName := FFiles[i];
    if LowerCase(ExtractFileExt(fileName)) = LowerCase(extension) then
      resultList.Add(ExtractFileName(fileName));
  end;
  
  Result := resultList;
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

function TFileBase.GetListFiles(const fileList: TArray<string>): TStringList;
var
  rlist: TStringList;
  fl: string;
  tempList: TStringList;
  i: Integer;
begin
  rlist := TStringList.Create;
  
  for fl in fileList do
  begin
    tempList := GetFilesByExtension(fl);
    try
      for i := 0 to tempList.Count - 1 do
        rlist.Add(tempList[i]);
    finally
      tempList.Free;
    end;
  end;
  
  Result := rlist;
end;

function TFileBase.GetXlsmFilter(const path: string = ''; const sfilter: string = '*_ge_OriginalSaveFile.xlsm'): TStringList;
var
  xlFiles: TStringList;
  filteredFiles: TStringList;
  i: Integer;
  tempPath: string;
begin
  if path <> '' then
    tempPath := path
  else
    tempPath := FDirectory;
  
  if TDirectory.Exists(tempPath) then
    SetDirectory(tempPath);
  
  xlFiles := GetXlsmFiles;
  filteredFiles := TStringList.Create;
  
  try
    for i := 0 to xlFiles.Count - 1 do
    begin
      if MatchesMask(xlFiles[i], sfilter) then
        filteredFiles.Add(xlFiles[i]);
    end;
    
    // Natural sort - Delphi doesn't have a built-in natural sort, so we'll use a simple sort
    filteredFiles.Sort;
    Result := filteredFiles;
  finally
    xlFiles.Free;
  end;
end;

function TFileBase.GetJpgFilter(const path: string = ''; const sfilter: string = '*page1.jpg'): TStringList;
var
  jpgFiles: TStringList;
  filteredFiles: TStringList;
  i: Integer;
  tempPath: string;
begin
  if path <> '' then
    tempPath := path
  else
    tempPath := FDirectory;
  
  if TDirectory.Exists(tempPath) then
    SetDirectory(tempPath);
  
  jpgFiles := GetJpgFiles;
  filteredFiles := TStringList.Create;
  
  try
    for i := 0 to jpgFiles.Count - 1 do
    begin
      if MatchesMask(jpgFiles[i], sfilter) then
        filteredFiles.Add(jpgFiles[i]);
    end;
    
    // Natural sort
    filteredFiles.Sort;
    Result := filteredFiles;
  finally
    jpgFiles.Free;
  end;
end;

function TFileBase.HasPath(const fileName: string): Boolean;
var
  head, tail: string;
begin
  head := ExtractFilePath(fileName);
  tail := ExtractFileName(fileName);
  Writeln(Format('head: ''%s''  tail: ''%s''  includes a path. Performing action...', [head, tail]));
  Result := head <> '';
end;

function TFileBase.SeparateFileName(const filename: string): TArray<string>;
begin
  SetLength(Result, 2);
  Result[0] := TPath.GetFileNameWithoutExtension(filename);
  Result[1] := TPath.GetExtension(filename);
end;

class function TFileBase.SeparatePath(const filePath: string): TArray<string>;
begin
  SetLength(Result, 2);
  Result[0] := TPath.GetDirectoryName(filePath);
  Result[1] := TPath.GetFileName(filePath);
end;

function TFileBase.IsHidden(const filePath: string): Boolean;
var
  attrs: Cardinal;
begin
  try
    attrs := GetFileAttributes(PChar(filePath));
    if attrs <> INVALID_FILE_ATTRIBUTES then
      Result := (attrs and FILE_ATTRIBUTE_HIDDEN) <> 0
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TFileBase.ListDirectoryContents(const path: string): TStringList;
var
  dirContents: TStringList;
begin
  dirContents := TStringList.Create;
  
  try
    try
      dirContents.AddStrings(TDirectory.GetFileSystemEntries(path));
      Result := dirContents;
    except
      on E: EDirectoryNotFoundException do
      begin
        dirContents.Add(Format('The directory ''%s'' does not exist.', [path]));
        Result := dirContents;
      end;
      on E: EPathTooLongException do
      begin
        dirContents.Add(Format('The path ''%s'' is too long.', [path]));
        Result := dirContents;
      end;
      on E: Exception do
      begin
        dirContents.Add(Format('An error occurred: %s', [E.Message]));
        Result := dirContents;
      end;
    end;
  except
    dirContents.Free;
    raise;
  end;
end;

function TFileBase.ListDirectoriesOnly(const path: string): TStringList;
var
  dirNonHidden, dirHidden: TStringList;
  result_list: TStringList;
  i: Integer;
begin
  dirNonHidden := ListNonHiddenDirectories(path);
  dirHidden := ListHiddenDirectories(path);
  
  // Check if either function returned an error message
  if (dirNonHidden.Count > 0) and (Pos('error', LowerCase(dirNonHidden[0])) > 0) or
     (dirHidden.Count > 0) and (Pos('error', LowerCase(dirHidden[0])) > 0) then
  begin
    result_list := TStringList.Create;
    result_list.Add('An error occurred while fetching directories.');
  end
  else
  begin
    result_list := TStringList.Create;
    
    // Add non-hidden directories that are not in hidden list
    for i := 0 to dirNonHidden.Count - 1 do
    begin
      if dirHidden.IndexOf(dirNonHidden[i]) = -1 then
        result_list.Add(dirNonHidden[i]);
    end;
  end;
  
  dirNonHidden.Free;
  dirHidden.Free;
  
  Result := result_list;
end;

class function TFileBase.LastOne(const path: string): string;
var
  parts: TArray<string>;
begin
  parts := path.Split(['\']);
  if Length(parts) > 0 then
    Result := parts[High(parts)]
  else
    Result := '';
end;

function TFileBase.ListHiddenDirectories(const path: string): TStringList;
var
  entries: TArray<string>;
  hiddenDirectories: TStringList;
  entry, fullPath: string;
begin
  hiddenDirectories := TStringList.Create;
  
  try
    entries := TDirectory.GetDirectories(path);
    
    for entry in entries do
    begin
      fullPath := entry;
      if IsHidden(fullPath) then
        hiddenDirectories.Add(LastOne(fullPath));
    end;
    
    Result := hiddenDirectories;
  except
    on E: EDirectoryNotFoundException do
    begin
      hiddenDirectories.Add(Format('The directory ''%s'' does not exist.', [path]));
      Result := hiddenDirectories;
    end;
    on E: EPathTooLongException do
    begin
      hiddenDirectories.Add(Format('The path ''%s'' is too long.', [path]));
      Result := hiddenDirectories;
    end;
    on E: Exception do
    begin
      hiddenDirectories.Add(Format('An error occurred: %s', [E.Message]));
      Result := hiddenDirectories;
    end;
  end;
end;

function TFileBase.ListNonHiddenDirectories(const path: string): TStringList;
var
  entries: TArray<string>;
  directories: TStringList;
  entry, fullPath: string;
begin
  directories := TStringList.Create;
  
  try
    entries := TDirectory.GetDirectories(path);
    
    for entry in entries do
    begin
      fullPath := entry;
      if (not IsHidden(fullPath)) and (not TPath.GetFileName(entry).StartsWith('.')) then
        directories.Add(TPath.GetFileName(entry));
    end;
    
    Result := directories;
  except
    on E: EDirectoryNotFoundException do
    begin
      directories.Add(Format('The directory ''%s'' does not exist.', [path]));
      Result := directories;
    end;
    on E: EPathTooLongException do
    begin
      directories.Add(Format('The path ''%s'' is too long.', [path]));
      Result := directories;
    end;
    on E: Exception do
    begin
      directories.Add(Format('An error occurred: %s', [E.Message]));
      Result := directories;
    end;
  end;
end;

function TFileBase.GetDirname(const filePath: string): string;
begin
  if TPathChecker.CheckPath(filePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', filePath);
    Result := '';
    Exit;
  end;
  
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(filePath));
end;

function TFileBase.GetBasename(const filePath: string): string;
begin
  if TPathChecker.CheckPath(filePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', filePath);
    Result := '';
    Exit;
  end;
  
  Result := ExtractFileName(filePath);
end;

function TFileBase.IsExist(const filePath: string): Boolean;
begin
  if TPathChecker.CheckPath(filePath) = TPathChecker.RET_NOTHING then
  begin
    Writeln('get_dirname arg is not path ... ', filePath);
    Result := False;
    Exit;
  end;
  
  Result := FileExists(filePath) or DirectoryExists(filePath);
end;

function TFileBase.IsValid(const filePath: string): Boolean;
begin
  Result := IsExist(filePath);
end;

class function TFileBase.SetPathstringToSlash(const filePath: string): string;
begin
  Result := StringReplace(filePath, '\', '/', [rfReplaceAll]);
end;

function TFileBase.JoinPathFromList(const filePathList: TArray<string>): string;
var
  basePath: string;
  extraPath: TArray<string>;
  f: string;
  i: Integer;
begin
  if Length(filePathList) = 0 then
    Exit('');
    
  basePath := filePathList[0];
  
  if Length(filePathList) > 1 then
  begin
    SetLength(extraPath, Length(filePathList) - 1);
    for i := 1 to High(filePathList) do
      extraPath[i-1] := filePathList[i];
      
    for f in extraPath do
    begin
      f := SetPathstringToSlash(f);
      basePath := basePath + f;
    end;
  end;
  
  basePath := SetPathstringToSlash(basePath);
  Writeln('join_path_from_list : ', basePath);
  Result := basePath;
end;

class function TFileBase.CopyFile(const source, destination: string): Boolean;
begin
  try
    System.SysUtils.CopyFile(PChar(source), PChar(destination), False);
    Writeln(Format('File copied successfully from ''%s'' to ''%s''', [source, destination]));
    Result := True;
  except
    on E: Exception do
    begin
      Writeln(Format('Error copying file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

class function TFileBase.MoveFile(const source, destination: string): Boolean;
begin
  try
    if FileExists(destination) then
    begin
      DeleteFile(destination);
      Writeln(Format('Removed existing file: %s', [destination]));
    end;
    
    if System.SysUtils.RenameFile(source, destination) then
    begin
      Writeln(Format('File moved successfully from ''%s'' to ''%s''', [source, destination]));
      Result := True;
    end
    else
    begin
      Writeln(Format('Error moving file from ''%s'' to ''%s''', [source, destination]));
      Result := False;
    end;
  except
    on E: Exception do
    begin
      Writeln(Format('Error moving file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

class function TFileBase.MoveFileCheck(const source, destination: string; removeYes: Boolean = False): Boolean;
begin
  try
    if FileExists(destination) then
    begin
      if removeYes then
      begin
        DeleteFile(destination);
        Writeln(Format('Removed existing file: %s', [destination]));
      end
      else
        Exit(False);
    end;
    
    if System.SysUtils.RenameFile(source, destination) then
    begin
      Writeln(Format('File moved successfully from ''%s'' to ''%s''', [source, destination]));
      Result := True;
    end
    else
    begin
      Writeln(Format('Error moving file from ''%s'' to ''%s''', [source, destination]));
      Result := False;
    end;
  except
    on E: Exception do
    begin
      Writeln(Format('Error moving file: %s', [E.Message]));
      Result := False;
    end;
  end;
end;

function TFileBase.DeleteFile(const filePath: string): Boolean;
begin
  if TPathChecker.CheckPath(filePath) = TPathChecker.RET_FILE then
  begin
    try
      if FileExists(filePath) then
      begin
        try
          if System.SysUtils.DeleteFile(filePath) then
          begin
            Writeln(Format('%s removed successfully from %s.', [GetBasename(filePath), GetDirname(filePath)]));
            Result := True;
          end
          else
          begin
            Writeln(Format('Error deleting %s', [filePath]));
            Result := False;
          end;
        except
          on E: Exception do
          begin
            Writeln(Format('Error deleting %s: %s', [filePath, E.Message]));
            Result := False;
          end;
        end;
      end
      else
      begin
        Writeln(Format('The file %s does not exist ...