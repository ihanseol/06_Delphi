unit FileManager;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, Vcl.Dialogs;

type
  TFileOperation = (foRead, foWrite, foCopy, foMove, foDelete);

  TFileOperationEvent = procedure(Sender: TObject; FileName: string;
    Operation: TFileOperation; Success: Boolean) of object;

  TFileManager = class
  private
    FLastError: string;
    FOnFileOperation: TFileOperationEvent;

    procedure SetLastError(const Value: string);
    procedure TriggerFileOperation(const FileName: string;
      Operation: TFileOperation; Success: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    // File operations
    function ReadTextFile(const FileName: string): string;
    function WriteTextFile(const FileName, Content: string): Boolean;
    function CopyFile(const SourceFile, DestFile: string; Overwrite: Boolean = False): Boolean;
    function MoveFile(const SourceFile, DestFile: string; Overwrite: Boolean = False): Boolean;
    function DeleteFile(const FileName: string): Boolean;

    // Directory operations
    function CreateDirectory(const DirName: string): Boolean;
    function DeleteDirectory(const DirName: string; Recursive: Boolean = False): Boolean;
    function GetDirectoryFiles(const DirName: string; const Mask: string = '*.*'): TStringList;

    // Utility methods
    function FileExists(const FileName: string): Boolean;
    function DirectoryExists(const DirName: string): Boolean;
    function GetFileSize(const FileName: string): Int64;
    function GetFileDate(const FileName: string): TDateTime;

    // Dialog methods
    function ShowOpenFileDialog(const Title: string; const Filter: string = 'All files (*.*)|*.*'): string;
    function ShowSaveFileDialog(const Title: string; const DefaultExt: string = '';
      const Filter: string = 'All files (*.*)|*.*'): string;
    function ShowBrowseFolderDialog(const Title: string): string;

    property LastError: string read FLastError write SetLastError;
    property OnFileOperation: TFileOperationEvent read FOnFileOperation write FOnFileOperation;
  end;

implementation

uses
  Winapi.Windows, Vcl.FileCtrl;

{ TFileManager }

constructor TFileManager.Create;
begin
  inherited;
  FLastError := '';
end;

destructor TFileManager.Destroy;
begin
  // Clean up code if needed
  inherited;
end;

procedure TFileManager.SetLastError(const Value: string);
begin
  FLastError := Value;
end;

procedure TFileManager.TriggerFileOperation(const FileName: string;
  Operation: TFileOperation; Success: Boolean);
begin
  if Assigned(FOnFileOperation) then
    FOnFileOperation(Self, FileName, Operation, Success);
end;

function TFileManager.ReadTextFile(const FileName: string): string;
var
  FileStream: TFileStream;
  StringList: TStringList;
begin
  Result := '';
  if not System.SysUtils.FileExists(FileName) then
  begin
    LastError := 'File does not exist: ' + FileName;
    TriggerFileOperation(FileName, foRead, False);
    Exit;
  end;

  try
    StringList := TStringList.Create;
    try
      StringList.LoadFromFile(FileName);
      Result := StringList.Text;
      LastError := '';
      TriggerFileOperation(FileName, foRead, True);
    finally
      StringList.Free;
    end;
  except
    on E: Exception do
    begin
      LastError := 'Error reading file: ' + E.Message;
      TriggerFileOperation(FileName, foRead, False);
    end;
  end;
end;

function TFileManager.WriteTextFile(const FileName, Content: string): Boolean;
var
  StringList: TStringList;
begin
  Result := False;

  try
    StringList := TStringList.Create;
    try
      StringList.Text := Content;
      StringList.SaveToFile(FileName);
      Result := True;
      LastError := '';
      TriggerFileOperation(FileName, foWrite, True);
    finally
      StringList.Free;
    end;
  except
    on E: Exception do
    begin
      LastError := 'Error writing to file: ' + E.Message;
      TriggerFileOperation(FileName, foWrite, False);
    end;
  end;
end;

function TFileManager.CopyFile(const SourceFile, DestFile: string; Overwrite: Boolean = False): Boolean;
begin
  Result := False;

  if not System.SysUtils.FileExists(SourceFile) then
  begin
    LastError := 'Source file does not exist: ' + SourceFile;
    TriggerFileOperation(SourceFile, foCopy, False);
    Exit;
  end;

  if System.SysUtils.FileExists(DestFile) and not Overwrite then
  begin
    LastError := 'Destination file already exists: ' + DestFile;
    TriggerFileOperation(DestFile, foCopy, False);
    Exit;
  end;

  try
    TFile.Copy(SourceFile, DestFile, Overwrite);
    Result := True;
    LastError := '';
    TriggerFileOperation(SourceFile, foCopy, True);
  except
    on E: Exception do
    begin
      LastError := 'Error copying file: ' + E.Message;
      TriggerFileOperation(SourceFile, foCopy, False);
    end;
  end;
end;

function TFileManager.MoveFile(const SourceFile, DestFile: string; Overwrite: Boolean = False): Boolean;
begin
  Result := False;

  if not System.SysUtils.FileExists(SourceFile) then
  begin
    LastError := 'Source file does not exist: ' + SourceFile;
    TriggerFileOperation(SourceFile, foMove, False);
    Exit;
  end;

  if System.SysUtils.FileExists(DestFile) and not Overwrite then
  begin
    LastError := 'Destination file already exists: ' + DestFile;
    TriggerFileOperation(DestFile, foMove, False);
    Exit;
  end;

  try
    TFile.Move(SourceFile, DestFile);
    Result := True;
    LastError := '';
    TriggerFileOperation(SourceFile, foMove, True);
  except
    on E: Exception do
    begin
      LastError := 'Error moving file: ' + E.Message;
      TriggerFileOperation(SourceFile, foMove, False);
    end;
  end;
end;

function TFileManager.DeleteFile(const FileName: string): Boolean;
begin
  Result := False;

  if not System.SysUtils.FileExists(FileName) then
  begin
    LastError := 'File does not exist: ' + FileName;
    TriggerFileOperation(FileName, foDelete, False);
    Exit;
  end;

  try
    System.SysUtils.DeleteFile(FileName);
    Result := True;
    LastError := '';
    TriggerFileOperation(FileName, foDelete, True);
  except
    on E: Exception do
    begin
      LastError := 'Error deleting file: ' + E.Message;
      TriggerFileOperation(FileName, foDelete, False);
    end;
  end;
end;

function TFileManager.CreateDirectory(const DirName: string): Boolean;
begin
  Result := False;

  if DirectoryExists(DirName) then
  begin
    Result := True;
    LastError := '';
    Exit;
  end;

  try
    Result := ForceDirectories(DirName);
    if Result then
      LastError := ''
    else
      LastError := 'Failed to create directory: ' + DirName;
  except
    on E: Exception do
    begin
      LastError := 'Error creating directory: ' + E.Message;
    end;
  end;
end;

function TFileManager.DeleteDirectory(const DirName: string; Recursive: Boolean): Boolean;
begin
  Result := False;

  if not DirectoryExists(DirName) then
  begin
    LastError := 'Directory does not exist: ' + DirName;
    Exit;
  end;

  try
    if Recursive then
      TDirectory.Delete(DirName, True)
    else
      RemoveDir(DirName);

    Result := True;
    LastError := '';
  except
    on E: Exception do
    begin
      LastError := 'Error deleting directory: ' + E.Message;
    end;
  end;
end;

function TFileManager.GetDirectoryFiles(const DirName: string; const Mask: string): TStringList;
var
  SearchRec: TSearchRec;
  FindResult: Integer;
  DirWithSep: string;
begin
  Result := TStringList.Create;

  if not DirectoryExists(DirName) then
  begin
    LastError := 'Directory does not exist: ' + DirName;
    Exit;
  end;

  DirWithSep := IncludeTrailingPathDelimiter(DirName);

  try
    FindResult := FindFirst(DirWithSep + Mask, faAnyFile, SearchRec);
    try
      while FindResult = 0 do
      begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
           ((SearchRec.Attr and faDirectory) = 0) then
          Result.Add(DirWithSep + SearchRec.Name);

        FindResult := FindNext(SearchRec);
      end;
      LastError := '';
    finally
      FindClose(SearchRec);
    end;
  except
    on E: Exception do
    begin
      LastError := 'Error getting directory files: ' + E.Message;
      Result.Free;
      Result := nil;
    end;
  end;
end;

function TFileManager.FileExists(const FileName: string): Boolean;
begin
  Result := System.SysUtils.FileExists(FileName);
end;

function TFileManager.DirectoryExists(const DirName: string): Boolean;
begin
  Result := System.SysUtils.DirectoryExists(DirName);
end;

function TFileManager.GetFileSize(const FileName: string): Int64;
var
  FileInfo: TFileInfo;
begin
  Result := -1;

  if not FileExists(FileName) then
  begin
    LastError := 'File does not exist: ' + FileName;
    Exit;
  end;

  try
    FileInfo := TFile.GetFileInfo(FileName);
    Result := FileInfo.Size;
    LastError := '';
  except
    on E: Exception do
    begin
      LastError := 'Error getting file size: ' + E.Message;
    end;
  end;
end;

function TFileManager.GetFileDate(const FileName: string): TDateTime;
begin
  Result := 0;

  if not FileExists(FileName) then
  begin
    LastError := 'File does not exist: ' + FileName;
    Exit;
  end;

  try
    Result := TFile.GetLastWriteTime(FileName);
    LastError := '';
  except
    on E: Exception do
    begin
      LastError := 'Error getting file date: ' + E.Message;
    end;
  end;
end;

function TFileManager.ShowOpenFileDialog(const Title, Filter: string): string;
var
  OpenDialog: TOpenDialog;
begin
  Result := '';

  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Title := Title;
    OpenDialog.Filter := Filter;
    OpenDialog.Options := [ofFileMustExist, ofHideReadOnly, ofEnableSizing];

    if OpenDialog.Execute then
      Result := OpenDialog.FileName;
  finally
    OpenDialog.Free;
  end;
end;

function TFileManager.ShowSaveFileDialog(const Title, DefaultExt, Filter: string): string;
var
  SaveDialog: TSaveDialog;
begin
  Result := '';

  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := Title;
    SaveDialog.DefaultExt := DefaultExt;
    SaveDialog.Filter := Filter;
    SaveDialog.Options := [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing];

    if SaveDialog.Execute then
      Result := SaveDialog.FileName;
  finally
    SaveDialog.Free;
  end;
end;

function TFileManager.ShowBrowseFolderDialog(const Title: string): string;
var
  Dir: string;
begin
  Result := '';
  Dir := '';

  if SelectDirectory(Title, '', Dir, [sdNewFolder, sdShowShares, sdNewUI, sdValidateDir]) then
    Result := Dir;
end;

end.

