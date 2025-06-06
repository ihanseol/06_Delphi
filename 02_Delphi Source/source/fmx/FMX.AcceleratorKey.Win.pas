{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.AcceleratorKey.Win;

interface

{$SCOPEDENUMS ON}

uses System.Generics.Collections, FMX.Types, FMX.Forms, FMX.Controls, FMX.Platform, FMX.AcceleratorKey;

type
  TWinAcceleratorKeyRegistry = class(TInterfacedObject, IFMXAcceleratorKeyRegistryService)
  private type
    TAcceleratorKeyReceivers = class
      strict private
        FReceiversDictionary: TObjectDictionary<Char, TList<IAcceleratorKeyReceiver>>;
        function GetCount: Integer;
        procedure RemoveReceiver(const AReceiver: IAcceleratorKeyReceiver; var AList: TList<IAcceleratorKeyReceiver>;
          const AKey: Char);
      public
        constructor Create;
        /// <summary>Destructor.</summary>
        destructor Destroy; override;
        /// <summary>Registers a receiver inside this object.</summary>
        procedure RegisterReceiver(const AReceiver: IAcceleratorKeyReceiver);
        /// <summary>Unregisters the receiver from this object.</summary>
        procedure UnregisterReceiver(const AReceiver: IAcceleratorKeyReceiver);
        /// <summary>This function looks for the accelerator key receiver that responses to the input key, and
        /// triggers the found receiver. This function returns true if it finds a receiver that responses to the
        /// input key, and False otherwise.</summary>
        function EmitAcceleratorKey(const AChar: Char): Boolean;
        // <summary>Returns the number of distinct keys registered</summary>
        property Count: Integer read GetCount;
      end;
  strict private
    FFormRegistry: TObjectDictionary<IRoot, TAcceleratorKeyReceivers>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterReceiver(const ARoot: IRoot; const AReceiver: IAcceleratorKeyReceiver);
    procedure UnregisterReceiver(const ARoot: IRoot; const AReceiver: IAcceleratorKeyReceiver);
    procedure RemoveRegistry(const ARoot: IRoot);
    function EmitAcceleratorKey(const ARoot: IRoot; const AChar: Char): Boolean;
    procedure ChangeReceiverRoot(const AReceiver: IAcceleratorKeyReceiver; const AOldRoot, ANewRoot: IRoot);
    procedure ExtractAcceleratorKey(const AText: string; out Key: Char; out KeyIndex: Integer);
  end;

implementation

uses System.SysUtils, System.Character, FMX.Consts;

{ TWinAcceleratorKeyRegistry }

procedure TWinAcceleratorKeyRegistry.ChangeReceiverRoot(const AReceiver: IAcceleratorKeyReceiver;
  const AOldRoot, ANewRoot: IRoot);
begin
  if AOldRoot <> nil then
  begin
    UnregisterReceiver(AOldRoot, AReceiver);
    if ANewRoot <> nil then
      RegisterReceiver(ANewRoot, AReceiver);
  end;
end;

constructor TWinAcceleratorKeyRegistry.Create;
begin
  inherited;
  TPlatformServices.Current.AddPlatformService(IFMXAcceleratorKeyRegistryService, Self);
end;

destructor TWinAcceleratorKeyRegistry.Destroy;
begin
  FreeAndNil(FFormRegistry);
  inherited;
end;

function TWinAcceleratorKeyRegistry.EmitAcceleratorKey(const ARoot: IRoot; const AChar: Char): Boolean;
var
  Receivers: TAcceleratorKeyReceivers;
begin
  if (FFormRegistry <> nil) and FFormRegistry.TryGetValue(ARoot, Receivers) then
    Result := Receivers.EmitAcceleratorKey(AChar)
  else
    Result := False;
end;

procedure TWinAcceleratorKeyRegistry.ExtractAcceleratorKey(const AText: string; out Key: Char; out KeyIndex: Integer);
const
  AcceleratorChar = '&';
var
  I: Integer;
  LIndexOfAcceleratorChar: Integer;
  LCorrection: Integer;
begin
  LIndexOfAcceleratorChar := -1;
  LCorrection := 0;
  I := Low(AText);
  while I < High(AText) do
  begin
    if (AText[I] = AcceleratorChar) and not (AText[I + 1].IsWhiteSpace) then
      if AText[I + 1] <> AcceleratorChar then
      begin
        LIndexOfAcceleratorChar := I;
        Break;
      end
      else
      begin
        Inc(LCorrection);
        Inc(I);
      end;
    Inc(I);
  end;

  if LIndexOfAcceleratorChar >= 0 then
  begin
    Key := AText[LIndexOfAcceleratorChar + Low(string)].ToLower;
    KeyIndex := LIndexOfAcceleratorChar - LCorrection - Low(string);
  end
  else
  begin
    Key := #0;;
    KeyIndex := -1;
  end;
end;

procedure TWinAcceleratorKeyRegistry.RegisterReceiver(const ARoot: IRoot; const AReceiver: IAcceleratorKeyReceiver);
begin
  if ARoot = nil then
    Exit;

  if FFormRegistry = nil then
    FFormRegistry := TObjectDictionary<IRoot, TAcceleratorKeyReceivers>.Create([doOwnsValues]);
  if not FFormRegistry.ContainsKey(ARoot) then
    FFormRegistry.Add(ARoot, TAcceleratorKeyReceivers.Create);
  FFormRegistry[ARoot].RegisterReceiver(AReceiver);
end;

procedure TWinAcceleratorKeyRegistry.RemoveRegistry(const ARoot: IRoot);
begin
  if FFormRegistry <> nil then
    FFormRegistry.Remove(ARoot);
end;

procedure TWinAcceleratorKeyRegistry.UnregisterReceiver(const ARoot: IRoot; const AReceiver: IAcceleratorKeyReceiver);
var
  Receivers: TAcceleratorKeyReceivers;
begin
  if (FFormRegistry <> nil) and FFormRegistry.TryGetValue(ARoot, Receivers) then
  begin
    Receivers.UnregisterReceiver(AReceiver);
    if Receivers.Count = 0 then
      FFormRegistry.Remove(ARoot);
  end;
end;

{ TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers }

procedure TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.RegisterReceiver(const AReceiver: IAcceleratorKeyReceiver);
var
  LList: TList<IAcceleratorKeyReceiver>;
  Key: Char;
begin
  if AReceiver = nil then
    Exit;

  Key := AReceiver.GetAcceleratorChar;
  if Key <> #0 then
  begin
    if not FReceiversDictionary.TryGetValue(Key, LList) then
    begin
      LList := TList<IAcceleratorKeyReceiver>.Create;
      FReceiversDictionary.Add(Key, LList);
    end;

    if not LList.Contains(AReceiver) then
      LList.Add(AReceiver);
  end;
end;

procedure TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.UnregisterReceiver(const AReceiver: IAcceleratorKeyReceiver);
var
  LKey: Char;
  LIterator: TPair<Char, TList<IAcceleratorKeyReceiver>>;
  LList: TList<IAcceleratorKeyReceiver>;
begin
  if AReceiver = nil then
    Exit;

  LKey := #0;
  LList := nil;

  for LIterator in FReceiversDictionary do
    if LIterator.Value.Contains(AReceiver) then
    begin
      LKey := LIterator.Key;
      LList := LIterator.Value;
      Break;
    end;

  if (LList <> nil) and (LKey <> Char(0)) then
    RemoveReceiver(AReceiver, LList, LKey);
end;

procedure TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.RemoveReceiver(const AReceiver: IAcceleratorKeyReceiver;
  var AList: TList<IAcceleratorKeyReceiver>; const AKey: Char);
var
  LIndex: Integer;
begin
  while True do
  begin
    LIndex := AList.IndexOf(AReceiver);
    if LIndex < 0 then
      Break;
    AList.Delete(LIndex);
  end;
  if AList.Count = 0 then
    FReceiversDictionary.Remove(AKey);
end;

constructor TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.Create;
begin
  FReceiversDictionary := TObjectDictionary<Char, TList<IAcceleratorKeyReceiver>>.Create([doOwnsValues]);
end;

destructor TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.Destroy;
begin
  FreeAndNil(FReceiversDictionary);
  inherited;
end;

function TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.EmitAcceleratorKey(const AChar: Char): Boolean;
var
  I: Integer;
  LKey: Char;
  LReceivers: TList<IAcceleratorKeyReceiver>;
  LReceiver: IAcceleratorKeyReceiver;
begin
  Result := False;
  if AChar = #0 then
    Exit;

  LKey := AChar.ToLower;

  if FReceiversDictionary.TryGetValue(LKey, LReceivers) then
    for I := 0 to LReceivers.Count - 1 do
    begin
      LReceiver := LReceivers[I];
      if (LReceiver <> nil) and LReceiver.CanTriggerAcceleratorKey then
      begin
        Assert(Result = False, SKeyAcceleratorConflict);
        Result := True;
        LReceiver.TriggerAcceleratorKey;
      end;
    end;
end;

function TWinAcceleratorKeyRegistry.TAcceleratorKeyReceivers.GetCount: Integer;
begin
  Result := FReceiversDictionary.Count;
end;

end.
