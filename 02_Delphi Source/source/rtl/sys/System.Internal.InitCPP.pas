{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Internal.InitCPP;

{$WEAKPACKAGEUNIT}
{$HPPEMIT NOUSINGNAMESPACE}

interface

type
  PUnitDescriptor = ^TUnitDescriptor;
  PPUnitDescriptor = ^PUnitDescriptor;
  PPPUnitDescriptor = ^PPUnitDescriptor;

  /// Type for unit initialization.  Takes a parameter to the
  /// unit description to make it possible to make nice QA test drivers.
  TUnitInitProc = procedure (desc: PUnitDescriptor);
  /// Type for unit finalization.  Takes a parameter to the
  /// unit description to make it possible to make nice QA test drivers.
  TUnitFiniProc = procedure (desc: PUnitDescriptor);

  // Class ctor/dtor proc
  PClassCtorDtorProc = PPointer;

  ///
  /// Descriptor for a unit.  Declares which units are in the interface section
  /// uses list and which units are in the implementation section uses list.
  /// Also defines the initialization and finalization routines to call, and
  /// maintains some bits for the runtime to use in the initialization process.
  /// Includes the class ctor/dtor lists.
  /// Note that any changes made to this structure require that the compiler be
  /// changed to match.
  TUnitDescriptor = record
    /// Name of the unit - for debugging/testing only.
    UnitName: PWideChar;
    /// Initialization procedure for the unit
    InitProc: TUnitInitProc;
    /// Finalization procedure for the unit
    FiniProc: TUnitFiniProc;
    /// Flags to be used by the runtime only.  Should be initialized
    /// to zero by the compiler.
    Flags: Word;
    /// Reference count to be used by the runtime only.  Should be initialized
    /// to zero by the compiler
    RefCount: Integer;
    /// NULL terminated array of pointers to unit descriptors for units used in
    /// the interface section of this unit.
    InterfaceUnits: PPPUnitDescriptor;
    /// NULL terminated array of pointers to unit descriptors for units used in
    /// the implementation section of this unit.
    ImplementationUnits: PPPUnitDescriptor;
    /// NULL terminated array of class constructors
    ClassCtors: PClassCtorDtorProc;
    /// NULL terminated array of class destructors
    ClassDtors: PClassCtorDtorProc;
    /// Utility link to be used by the C++ runtime.
    SiblingLink: PUnitDescriptor;
    /// Degree of vertex for incoming edges.  Used for determining which are
    /// the top level units in an application.  For a pure Delphi application.
    /// there should only be one of these.  For a C++ application, there might
    /// be multiple.
    Degree: Integer;
{$IF not defined(CPU64BITS)}
    /// Queue for zero-degree entries for topological sorting.
    /// These are not currently used, and should be removed, but this will
    /// require a compiler change.
    Head: PUnitDescriptor;
    Tail: PUnitDescriptor;

    /// One of these structures is generated for each Pascal unit's object
    /// file.  The structures are generated to a separate section, so that the
    /// linker will aggregate them in a contiguous space, but the section's
    /// alignment causes some padding to occur.
    Padding1: Integer;
    Padding2: Integer;
    Padding3: Integer;
{$ENDIF}
  end;

  PUnitDescriptorBlock = ^TUnitDescriptorBlock;
  TUnitDescriptorBlock = record
    Indir: PUnitDescriptor;
    Desc: TUnitDescriptor;
  end;

///
/// Does a recursive descent initialization of the given unit.  Cycles via the
/// implementation list are supported.  Exceptions are caught, and initialized units are
/// backed out.
procedure InitializeRootUnit(Root: PUnitDescriptor);

/// Does a recursive descent finalization of the given unit.  Cycles via the
/// implementation list are supported.  Exceptions are caught, and finalization
/// continues as best as possible.
procedure FinalizeRootUnit(Root: PUnitDescriptor);

///
/// Initializes all the units bracketed by the given start/end pair.
procedure InitializeUnits(StartDesc, EndDesc: PUnitDescriptorBlock); overload;
procedure FinalizeUnits(StartDesc, EndDesc: PUnitDescriptorBlock); overload;
///
/// Overloaded signature to keep old compatibility
procedure InitializeUnits(StartDesc, EndDesc: PUnitDescriptor); overload;
procedure FinalizeUnits(StartDesc, EndDesc: PUnitDescriptor); overload;

procedure CalculateDegree(StartDesc, EndDesc: PUnitDescriptorBlock);

const
   /// Used to mark a unit as being in the process of being initialized or
   /// finalized.  This is used to catch cycles.
   F_UNIT_MARKED = $0001;

implementation

// Debugging code
{ DEFINE DEBUG_UNIT_INIT}
{$IFDEF DEBUG_UNIT_INIT}
uses System.SysUtils;

procedure DumpDesc(Desc: PUnitDescriptor);
var pp: PPOINTER;
begin
  write('desc: ');
  writeln(IntToHex(Integer(Desc), 8));
  write('  UnitName: '); writeln(IntToHex(Integer(Desc^.UnitName), 8));
  pp := @Desc^.InitProc;
  write('  InitProc: '); writeln(IntToHex(Integer(pp), 8));
  pp := @Desc^.FiniProc;
  write('  FiniProc: '); writeln(IntToHex(Integer(pp), 8));
  write('  Flags: '); writeln(IntToHex(Integer(Desc^.Flags), 8));
  write('  RefCount: '); writeln(IntToHex(Integer(Desc^.RefCount), 8));
  write('  InterfaceUnits: '); writeln(IntToHex(Integer(Desc^.InterfaceUnits), 8));
  write('  ImplementationUnits: '); writeln(IntToHex(Integer(Desc^.ImplementationUnits), 8));
  write('  SiblingLink: '); writeln(IntToHex(Integer(Desc^.SiblingLink), 8));
  write('  Degree: '); writeln(IntToHex(Integer(Desc^.Degree), 8));
  write('  Head: '); writeln(IntToHex(Integer(Desc^.Head), 8));
  write('  Tail: '); writeln(IntToHex(Integer(Desc^.Tail), 8));
end;

procedure DumpDescRich(Desc: PUnitDescriptor);
var
  U: PPPUnitDescriptor;
begin
////  write('desc: '); writeln(IntToHex(Integer(Desc), 8));
  write('unit: '); writeln(Desc^.UnitName);
  writeln('  interface');
  U := Desc^.InterfaceUnits;
  while U^ <> nil do
  begin
    write('      '); writeln(U^^^.UnitName);
    Inc(U);
  end;
  writeln('  implementation');
  U := Desc^.ImplementationUnits;
  while U^ <> nil do
  begin
    write('      '); writeln(U^^^.UnitName);
    Inc(U);
  end;
end;
{$ENDIF DEBUG_UNIT_INIT}

function SelectForInitialization(StartDesc, EndDesc: PUnitDescriptorBlock): PUnitDescriptor;
begin
  Result := nil;
  while UIntPtr(StartDesc) < UIntPtr(EndDesc) do
  begin
//DumpDesc(StartDesc);
    if StartDesc^.Indir^.Degree = 0 then
    begin
      StartDesc^.Indir^.SiblingLink := Result;
      Result := StartDesc^.Indir;
    end;
    Inc(StartDesc);
  end;
end;

procedure InitializeUnits(StartDesc, EndDesc: PUnitDescriptorBlock);
var
  U: PUnitDescriptor;
begin
//write('sizeof(UnitDesciptor): '); writeln(IntToHex(Sizeof(StartDesc^), 8));
{$IF defined(ANDROID) or defined(LINUX)}
  InitExeCPP;
{$ENDIF}
  CalculateDegree(StartDesc, EndDesc);
  U := SelectForInitialization(StartDesc, EndDesc);
  while U <> nil do
  begin
    InitializeRootUnit(U);
    U := U^.SiblingLink;
  end;
{$IF defined(ANDROID) or defined(LINUX)}
  dbk_RTL_initialized := 1;
{$ENDIF}
end;

procedure FinalizeUnits(StartDesc, EndDesc: PUnitDescriptorBlock);
var
  U: PUnitDescriptor;
  Temp: PUnitDescriptor;
  Prev: PUnitDescriptor;
begin
{$IF defined(ANDROID) or defined(LINUX)}
  dbk_RTL_initialized := 0;
{$ENDIF}
  U := SelectForInitialization(StartDesc, EndDesc);

  // reverse the list
  Prev := nil;
  while U <> nil do
  begin
    Temp := U^.SiblingLink;
    U^.SiblingLink := Prev;
    Prev := U;
    U := Temp;
  end;

  U := Prev;
  while U <> nil do
  begin
    FinalizeRootUnit(U);
    U := U^.SiblingLink;
  end;
end;

procedure InitializeUnits(StartDesc, EndDesc: PUnitDescriptor);
begin
  InitializeUnits(PUnitDescriptorBlock(PByte(StartDesc)), PUnitDescriptorBlock(EndDesc));
end;

procedure FinalizeUnits(StartDesc, EndDesc: PUnitDescriptor);
begin
  FinalizeUnits(PUnitDescriptorBlock(PByte(StartDesc) + $0), PUnitDescriptorBlock(EndDesc));
end;

procedure CalculateDegree(StartDesc, EndDesc: PUnitDescriptorBlock);
var
  U: PPPUnitDescriptor;
begin
  while UIntPtr(StartDesc) < UIntPtr(EndDesc) do
  begin
//    DumpDescRich(StartDesc);
    U := StartDesc^.Indir^.InterfaceUnits;
    while U^ <> nil do
    begin
      Inc(U^^^.Degree);
      Inc(U);
    end;
    Inc(StartDesc);
  end;
end;

///
/// Finalizes a list of units.  The list is a NULL terminated list, as per
/// the interface list or implementation list.  The units are finalized in
/// reverse order of their appearance in the list.  If the <code>EndDesc</code>
/// parmater is NIL, then the entire list is finalized.  If the <code>EndDesc</code>
/// is not NIL, then it is presumed to be a pointer somewhere into the middle of the
/// list representing the stopping point.  The list is finalized up to the point
/// that <code>EndDesc</code> points to, not including the unit that it points to.
///
procedure FinalizeUnitList(StartDesc, EndDesc: PPPUnitDescriptor);
begin
  if not Assigned(EndDesc) then
  begin
    EndDesc := StartDesc;
    while EndDesc^ <> nil do
      Inc(EndDesc);
  end;
  while UIntPtr(EndDesc) > UIntPtr(StartDesc) do
  begin
    Dec(EndDesc);
    try
      FinalizeRootUnit(EndDesc^^);
    except
                                                               
    end;
  end;
end;

type
  TProc = procedure;

procedure InitializeRootUnit(Root: PUnitDescriptor);
var
  Desc: PPPUnitDescriptor;
  Ctors: PClassCtorDtorProc;
begin
//DumpDesc(Root);
  if (Root^.Flags and F_UNIT_MARKED) <> 0 then
    Exit;
//   writeln('I: ' + Root^.UnitName + ' refcount = ' + IntToStr(Root^.RefCount));
  Inc(Root^.RefCount);
  if Root^.RefCount > 1 then
    Exit;
  Root^.Flags := Root^.Flags or F_UNIT_MARKED;

  // Interface units
  Desc := Root^.InterfaceUnits;
  while Desc^ <> nil do
  begin
    try
      InitializeRootUnit(Desc^^);
    except
      FinalizeUnitList(Root^.InterfaceUnits, Desc);
      raise;
    end;
    Inc(Desc);
  end;

  // Implementation units
  Desc := Root^.ImplementationUnits;
  while Desc^ <> nil do
  begin
    try
      InitializeRootUnit(Desc^^);
    except
      FinalizeUnitList(Root^.ImplementationUnits, Desc);
      FinalizeUnitList(Root^.InterfaceUnits, nil);
      raise;
    end;
    Inc(Desc);
  end;

  // Class ctors
  Ctors := Root^.ClassCtors;
  if Ctors <> nil then
  begin
    while Ctors^ <> nil do
    begin
      try
        TProc(Ctors^)();
      except
        // fixme - call class dtors on the ones we've done so far
        FinalizeUnitList(Root^.ImplementationUnits, nil);
        FinalizeUnitList(Root^.InterfaceUnits, nil);
        raise;
      end;
      Inc(Ctors);
    end;
  end;

  try
{$IFDEF DEBUG_UNIT_INIT}
    if (Root^.UnitName <> nil) then
    begin
      write('initializing unit: '); write(Root^.UnitName); write(' ... ');
    end;
{$ENDIF DEBUG_UNIT_INIT}
    Root^.InitProc(Root);
{$IFDEF DEBUG_UNIT_INIT}
    if (Root^.UnitName <> nil) then
      writeln('done');
{$ENDIF DEBUG_UNIT_INIT}
  except
    FinalizeUnitList(Root^.ImplementationUnits, nil);
    FinalizeUnitList(Root^.InterfaceUnits, nil);
    raise;
  end;
  Root^.Flags := Root^.Flags and (not F_UNIT_MARKED);
end;

procedure FinalizeRootUnit(Root: PUnitDescriptor);
var
  Dtors: PClassCtorDtorProc;
begin
  if (Root^.Flags and F_UNIT_MARKED) <> 0 then
    Exit;
//   writeln('F: ' + Root^.UnitName + ' refcount = ' + IntToStr(Root^.RefCount));
  Dec(Root^.RefCount);
  if Root^.RefCount > 0 then
    Exit;

  Root^.Flags := Root^.Flags or F_UNIT_MARKED;
  try
    Root^.FiniProc(Root);
  except
                                                             
  end;

  // Class ctors
  Dtors := Root^.ClassDtors;
  if Dtors <> nil then
  begin
    while Dtors^ <> nil do
    begin
      TProc(Dtors^)();
      Inc(Dtors);
    end;
  end;

  FinalizeUnitList(Root^.ImplementationUnits, nil);
  FinalizeUnitList(Root^.InterfaceUnits, nil);
  Root^.Flags := Root^.Flags and (not F_UNIT_MARKED);
end;

end.
