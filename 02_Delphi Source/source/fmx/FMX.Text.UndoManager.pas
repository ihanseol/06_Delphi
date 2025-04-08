{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Text.UndoManager;

interface

{$SCOPEDENUMS ON}

uses
  System.Generics.Collections, FMX.Text;

type
  /// <summary>Information about fragment of the text that was inserted.</summary>
  TFragmentInserted = record
    /// <summary>Position in text where text was inserted.</summary>
    StartPos: Integer;
    /// <summary>Fragment of text that was inserted.</summary>
    Fragment: string;
    /// <summary>
    ///   Defines that change was made right after the previous and was made in the similar way
    ///   (e.g. text editing (delete and insert) via keyabord).
    /// </summary>
    PairedWithPrev: Boolean;
    /// <summary>Was text inserted via typing from keyboard or not.</summary>
    Typed: Boolean;
  public
    /// <summary>Create new information about inserted text with defined values.</summary>
    constructor Create(const AStartPos: Integer; const AFragment: string; const APairedWithPrev, ATyped: Boolean);
  end;

  /// <summary>Information about fragment of the text that was removed.</summary>
  TFragmentDeleted = record
    /// <summary>Position in text from which text was deleted.</summary>
    StartPos: Integer;
    /// <summary>Fragment of text that was deleted.</summary>
    Fragment: string;
    /// <summary>Was removed text select or not.</summary>
    Selected: Boolean;
    /// <summary>Was caret moved after text was removed or not.</summary>
    CaretMoved: Boolean;
  public
    /// <summary>Create new information about removed text with defined values.</summary>
    constructor Create(const AStartPos: Integer; const AFragment: string; const ASelected, ACaretMoved: Boolean);
  end;

  { TUndoManager }

  TActionType = (Delete, Insert);

  ///<summary>Record that describes text-editing operation.</summary>
  TEditAction = record
    ///<summary>Type of change that was made (text added or removed).</summary>
    ActionType: TActionType;
    ///<summary>Defines that change was made right after the previous and was made in the similar way
    ///(e.g. text editing (delete and insert) via keyabord).</summary>
    PairedWithPrev: Boolean;
    ///<summary>Position in text from which text was deleted or into which text was inserted.</summary>
    StartPosition: Integer;
    ///<summary>Fragmen of text that was inserted/deleted.</summary>
    Fragment: string;
    ///<summary>Was text inserted via typing from keyboard or not.</summary>
    Typed: Boolean;
    ///<summary>Was removed text select or not.</summary>
    WasSelected: Boolean;
    ///<summary>Was caret moved after text was removed or not.</summary>
    CaretMoved: Boolean;
  end;

  TUndoEvent = procedure (Sender: TObject; const AActionType: TActionType; const AEditInfo: TEditAction;
                          const AOptions: TInsertOptions) of object;
                          
  TRedoEvent = procedure (Sender: TObject; const AActionType: TActionType; const AEditInfo: TEditAction;
                          const AOptions: TDeleteOptions) of object;
  
  /// <summary>
  ///   The manager is responsible for tracking and canceling editable operations. The user of this class must notify the manager 
  ///   about the operations being edited through the methods FragmentInserted and FragmentDeleted. The class saves these operations 
  ///   and allows you to cancel them. To undo an action, the user calls the Undo method and the manager notifies the client about 
  ///   the operation parameters via the OnUndo event. The same is for Redo operation.
  /// </summary>
  TUndoManager = class
  private
    FActions: TList<TEditAction>;
    FCurrentActionIndex: Integer;
    FOnUndo: TUndoEvent;
    FOnRedo: TRedoEvent;
    function GetCurrentAction: TEditAction;
  protected
    procedure DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TInsertOptions); virtual;
    procedure DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction; const AOptions: TDeleteOptions); virtual;
    procedure AddAction(const AAction: TEditAction);
    procedure RemoveTailActions;
    property CurrentAction: TEditAction read GetCurrentAction;    
  public
    constructor Create;
    destructor Destroy; override;

    { Notifications about text changes }

    ///<summary>New fragment of text was inserted.</summary>
    procedure FragmentInserted(const AStartPos: Integer; const AFragment: string; const APairedWithPrev, ATyped: Boolean);
    ///<summary>Some text fragment was removed.</summary>
    procedure FragmentDeleted(const AStartPos: Integer; const AFragment: string; const ASelected, ACaretMoved: Boolean);

    { Undo operations }

    ///<summary>Revert last change.</summary>
    function Undo: Boolean;
    /// <summary>Does the manager have undo fragments?</summary>
    function CanUndo: Boolean;

    { Redo operations }
    
    /// <summary>Apply next change.</summary>
    function Redo: Boolean;
    /// <summary>Does the manager have redo fragments?</summary>
    function CanRedo: Boolean;        
  public
    /// <summary>The event is being invoked with undo action parameters, when client initiate undo operation.</summary>
    property OnUndo: TUndoEvent read FOnUndo write FOnUndo;
    /// <summary>The event is being invoked with redo action parameters, when client initiate redo operation.</summary>
    property OnRedo: TRedoEvent read FOnRedo write FOnRedo;
  end;

  TEditActionStack = TUndoManager deprecated 'Use TUndoManager instead';

implementation

uses
  System.SysUtils, System.Math;

{ TUndoManager }

procedure TUndoManager.AddAction(const AAction: TEditAction);
begin
  { Remove actions after current }
  RemoveTailActions;

  { Add new action }
  FActions.Add(AAction);     
  FCurrentActionIndex := FActions.Count - 1; 
end;

function TUndoManager.CanRedo: Boolean;
begin
  Result :=  (FActions.Count >= 0) and (FCurrentActionIndex < FActions.Count - 1);
end;

function TUndoManager.CanUndo: Boolean;
begin
  Result := FCurrentActionIndex >= 0;
end;

constructor TUndoManager.Create;
begin
  inherited;
  FActions := TList<TEditAction>.Create;
  FCurrentActionIndex := -1;
end;

destructor TUndoManager.Destroy;
begin
  FreeAndNil(FActions);
  inherited;
end;

procedure TUndoManager.DoRedo(const AActionType: TActionType; const AEditInfo: TEditAction;
  const AOptions: TDeleteOptions);
begin
  if Assigned(FOnRedo) then
    FOnRedo(Self, AActionType, AEditInfo, AOptions);
end;

procedure TUndoManager.DoUndo(const AActionType: TActionType; const AEditInfo: TEditAction;
  const AOptions: TInsertOptions);
begin
  if Assigned(FOnUndo) then
    FOnUndo(Self, AActionType, AEditInfo, AOptions);
end;

procedure TUndoManager.FragmentDeleted(const AStartPos: Integer; const AFragment: string;
  const ASelected, ACaretMoved: Boolean);
var
  TmpItem: TEditAction;
begin
  if AFragment.IsEmpty then
    Exit;

  if (FActions.Count = 0) or (FCurrentActionIndex = -1) or (CurrentAction.ActionType <> TActionType.Delete) or 
     (CurrentAction.StartPosition - AStartPos - AFragment.Length > 1) or 
     (CurrentAction.StartPosition - AStartPos <= 0) or ASelected then
  begin
    TmpItem.ActionType := TActionType.Delete;
    TmpItem.StartPosition := AStartPos;
    TmpItem.Fragment := AFragment;
    TmpItem.PairedWithPrev := False;
    TmpItem.WasSelected := ASelected;
    TmpItem.CaretMoved := ACaretMoved;
    AddAction(TmpItem);
  end
  else if AStartPos >= 0 then
  begin
    TmpItem := CurrentAction;
    if AStartPos < TmpItem.StartPosition then
      TmpItem.Fragment := AFragment + TmpItem.Fragment
    else
      TmpItem.Fragment := TmpItem.Fragment + AFragment;
    TmpItem.StartPosition := AStartPos;
    FActions[FCurrentActionIndex] := TmpItem;
  end;
end;

procedure TUndoManager.FragmentInserted(const AStartPos: Integer; const AFragment: string; const APairedWithPrev, ATyped: Boolean);
var
  TmpItem: TEditAction;
begin
  if AFragment.Length = 0 then
    Exit;

  if (FActions.Count = 0) or (FCurrentActionIndex = -1) or (CurrentAction.ActionType <> TActionType.Insert) or 
     (CurrentAction.StartPosition + CurrentAction.Fragment.Length <> AStartPos) or 
     not ATyped or 
     (CurrentAction.Typed <> ATyped) then
  begin
    TmpItem.ActionType := TActionType.Insert;
    TmpItem.StartPosition := AStartPos;
    TmpItem.Fragment := AFragment;
    TmpItem.PairedWithPrev := APairedWithPrev;
    TmpItem.Typed := ATyped;
    AddAction(TmpItem);
  end
  else
  begin
    TmpItem := CurrentAction;
    TmpItem.Fragment := TmpItem.Fragment + AFragment;
    FActions[FCurrentActionIndex] := TmpItem;
  end;
end;

function TUndoManager.GetCurrentAction: TEditAction;
begin
  if (FActions.Count = 0) or not InRange(FCurrentActionIndex, 0, FActions.Count - 1) then
    raise EInvalidOpException.Create('Cannot return action, there are no any actions');

  Result := FActions[FCurrentActionIndex];
end;

function TUndoManager.Redo: Boolean;
var
  TmpItem: TEditAction;
  WasPaired: Boolean;
  LTmpOptions: TDeleteOptions;
begin
  Result := CanRedo;
  if not Result then
    Exit;

  repeat
    Inc(FCurrentActionIndex);
    TmpItem := CurrentAction;
      
    if TmpItem.WasSelected then
      LTmpOptions := [TDeleteOption.Selected]
    else
      LTmpOptions := [];
    if TmpItem.CaretMoved then
      LTmpOptions := LTmpOptions + [TDeleteOption.MoveCaret];

    DoRedo(TmpItem.ActionType, TmpItem, LTmpOptions);
    WasPaired := TmpItem.PairedWithPrev;
  until not CanRedo or not WasPaired;
end;

procedure TUndoManager.RemoveTailActions;
var
  StartIndex: Integer;
  RemoveCount: Integer;
begin
  StartIndex := Max(0, FCurrentActionIndex + 1);
  RemoveCount :=  FActions.Count - StartIndex;
  if RemoveCount > 0 then  
    FActions.DeleteRange(StartIndex, RemoveCount);
end;

function TUndoManager.Undo: Boolean;
var
  TmpItem: TEditAction;
  WasPaired: Boolean;
  LTmpOptions: TInsertOptions;
begin
  Result := CanUndo;
  if not Result then
    Exit;

  repeat
    TmpItem := CurrentAction;
    Dec(FCurrentActionIndex);
      
    if TmpItem.WasSelected then
      LTmpOptions := [TInsertOption.Selected]
    else
      LTmpOptions := [];
    if TmpItem.CaretMoved then
      LTmpOptions := LTmpOptions + [TInsertOption.MoveCaret];

    DoUndo(TmpItem.ActionType, TmpItem, LTmpOptions);
    WasPaired := TmpItem.PairedWithPrev;
  until not CanUndo or not WasPaired;
end;

{ TFragmentDeleted }

constructor TFragmentDeleted.Create(const AStartPos: Integer; const AFragment: string; const ASelected,
  ACaretMoved: Boolean);
begin
  Self.StartPos := AStartPos;
  Self.Fragment := AFragment;
  Self.Selected := ASelected;
  Self.CaretMoved := ACaretMoved;
end;

{ TFragmentInserted }

constructor TFragmentInserted.Create(const AStartPos: Integer; const AFragment: string; const APairedWithPrev,
  ATyped: Boolean);
begin
  Self.StartPos := AStartPos;
  Self.Fragment:= AFragment;
  Self.PairedWithPrev := APairedWithPrev;
  Self.Typed := ATyped;
end;

end.
