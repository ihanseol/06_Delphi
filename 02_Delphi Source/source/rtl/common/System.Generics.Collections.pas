{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Generics.Collections;

{$R-,T-,X+,H+,B-}
{$IFDEF WIN32}
//  {$A4}
{$ENDIF}
{$INLINE ON}

interface

uses
  System.Types, System.SysUtils, System.Generics.Defaults;

type
  TArray = class
  private
    class function DoBinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: NativeInt; const Comparer: IComparer<T>; Index,
      Count: NativeInt): Boolean; static;
    class procedure QuickSort<T>(var Values: array of T; const Comparer: IComparer<T>;
      L, R: NativeInt); static;
    class procedure CheckArrays(Source, Destination: Pointer;
      SourceIndex, SourceLength, DestIndex, DestLength, Count: NativeInt); static;
    class function InternalCompare<T>(ASelf: TObject; const ALeft, ARight): Integer; static;
    class function DoIndexOf<T>(const Values: array of T; const Item: T;
      const Comparer: IComparer<T>; Base, Count: NativeInt; Direction: TDirection): NativeInt; static;
    class procedure DoFreeValues(P: Pointer; len: NativeInt; elTypeInfo: Pointer); static;
{$IF Defined(CPU64BITS)}
    class procedure RangeInt32Error(AIndex: NativeInt); static;
{$ENDIF CPU64BITS}
  public
    class procedure Sort<T>(var Values: array of T); overload; static;
    class procedure Sort<T>(var Values: array of T; const Comparer: IComparer<T>); overload; static;
    class procedure Sort<T>(var Values: array of T;
      const Comparer: IComparer<T>; Index, Count: NativeInt); overload; static;

    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: NativeInt; const Comparer: IComparer<T>;
      Index, Count: NativeInt): Boolean; overload; static;
    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: NativeInt; const Comparer: IComparer<T>): Boolean; overload; static;
    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: NativeInt): Boolean; overload; static;
{$IF Defined(CPU64BITS)}
    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: Integer; const Comparer: IComparer<T>;
      Index, Count: Integer): Boolean; overload; static;
    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: Integer; const Comparer: IComparer<T>): Boolean; overload; static;
    class function BinarySearch<T>(const Values: array of T; const Item: T;
      out FoundIndex: Integer): Boolean; overload; static;
{$ENDIF CPU64BITS}

    class procedure Copy<T>(const Source: array of T; var Destination: array of T;
      SourceIndex, DestIndex, Count: NativeInt); overload; static;
    class procedure Copy<T>(const Source: array of T; var Destination: array of T;
      Count: NativeInt); overload; static;

    class function Concat<T>(const Args: array of TArray<T>): TArray<T>; static;

    class function IndexOf<T>(const Values: array of T; const Item: T): NativeInt; overload; static;
    class function IndexOf<T>(const Values: array of T; const Item: T;
      Index: NativeInt): NativeInt; overload; static;
    class function IndexOf<T>(const Values: array of T; const Item: T;
      const Comparer: IComparer<T>; Index, Count: NativeInt): NativeInt; overload; static;
    class function LastIndexOf<T>(const Values: array of T; const Item: T): NativeInt; overload; static;
    class function LastIndexOf<T>(const Values: array of T; const Item: T;
      Index: NativeInt): NativeInt; overload; static;
    class function LastIndexOf<T>(const Values: array of T; const Item: T;
      const Comparer: IComparer<T>; Index, Count: NativeInt): NativeInt; overload; static;

    class function Contains<T>(const Values: array of T; const Item: T): Boolean; overload; static;
    class function Contains<T>(const Values: array of T; const Item: T;
      const Comparer: IComparer<T>): Boolean; overload; static;

    class procedure FreeValues<T>(const Values: array of T); overload; static;
    class procedure FreeValues<T>(var Values: TArray<T>); overload; static;

    class function ToString<T>(const Values: array of T; const AFormatSettings: TFormatSettings;
      const ASeparator: string = ','; const ADelim1: string = '';
      const ADelim2: string = ''): string; reintroduce; overload; static;
    class function ToString<T>(const Values: array of T;
      const ASeparator: string = ','; const ADelim1: string = '';
      const ADelim2: string = ''): string; reintroduce; overload; static;
  end;

  TCollectionNotification = (cnAdding, cnAdded, cnExtracting, cnExtracted, cnDeleting, cnRemoved);
  TCollectionNotifyEvent<T> = procedure(Sender: TObject; const Item: T;
    Action: TCollectionNotification) of object;

  TEnumerator<T> = class abstract
  protected
    function DoGetCurrent: T; virtual; abstract;
    function DoMoveNext: Boolean; virtual; abstract;
  public
    property Current: T read DoGetCurrent;
    function MoveNext: Boolean; inline;
  end;

  TEnumerable<T> = class abstract
  protected
    function ToArrayImpl(Count: NativeInt): TArray<T>; // used by descendants
    function DoGetEnumerator: TEnumerator<T>; virtual; abstract;
  public
    destructor Destroy; override;
    function GetEnumerator: TEnumerator<T>; inline;
    function ToArray: TArray<T>; virtual;
  end;

  PListHelper = ^TListHelper;
  [HPPGEN(HPPGenAttribute.mkFriend, 'DELPHICLASS TList__1<T>; DELPHICLASS TStack__1<T>; DELPHICLASS TQueue__1<T>')]
  TListHelper = record
  private type
    TInternalNotifyProc = procedure (ASelf: TObject; const AItem; AAction: TCollectionNotification);
    TInternalCompareFunc = function (ASelf: TObject; const ALeft, ARight): Integer;
    TInternalEmptyFunc = reference to function(const Item): Boolean;
    PBytes = ^TBytes;
  private var
    // Keep TListHelper layout in sync with System.Rtti functions:
    // * GetArrayValueFromTListHelperValue
    // * SetTListHelperValueFromArrayValue
    FItems: Pointer;
    FCount: NativeInt;
    FTypeInfo: Pointer;
    [unsafe] FListObj: TObject;
    FNotify: TInternalNotifyProc;
    FCompare: TInternalCompareFunc;
    function GetElType: Pointer; inline;
    function GetElSize: NativeInt; inline;
    function CheckDeleteRange(AIndex, ACount: NativeInt): Boolean; inline;
    procedure CheckItemRange(AIndex: NativeInt); inline;
    procedure CheckInsertRange(AIndex: NativeInt); inline;
    function DoIndexOfFwd1(const Value): NativeInt;
    function DoIndexOfFwd2(const Value): NativeInt;
    function DoIndexOfFwd4(const Value): NativeInt;
    function DoIndexOfFwd8(const Value): NativeInt;
    function DoIndexOfFwdN(const Value): NativeInt;
    function DoIndexOfFwdMRef(const Value): NativeInt;
    function DoIndexOfFwdString(const Value): NativeInt;
    function DoIndexOfFwd1UsingComparer(const Value): NativeInt;
    function DoIndexOfFwd2UsingComparer(const Value): NativeInt;
    function DoIndexOfFwd4UsingComparer(const Value): NativeInt;
    function DoIndexOfFwd8UsingComparer(const Value): NativeInt;
    function DoIndexOfFwdMRefUsingComparer(const Value): NativeInt;
    function DoIndexOfFwdStringUsingComparer(const Value): NativeInt;
    function DoIndexOfRev1(const Value): NativeInt;
    function DoIndexOfRev2(const Value): NativeInt;
    function DoIndexOfRev4(const Value): NativeInt;
    function DoIndexOfRev8(const Value): NativeInt;
    function DoIndexOfRevN(const Value): NativeInt;
    function DoIndexOfRevMRef(const Value): NativeInt;
    function DoIndexOfRevString(const Value): NativeInt;
    function DoIndexOfRev1UsingComparer(const Value): NativeInt;
    function DoIndexOfRev2UsingComparer(const Value): NativeInt;
    function DoIndexOfRev4UsingComparer(const Value): NativeInt;
    function DoIndexOfRev8UsingComparer(const Value): NativeInt;
    function DoIndexOfRevMRefUsingComparer(const Value): NativeInt;
    function DoIndexOfRevStringUsingComparer(const Value): NativeInt;
    procedure DoExtractItemFwd1(const Value; out Item);
    procedure DoExtractItemFwd2(const Value; out Item);
    procedure DoExtractItemFwd4(const Value; out Item);
    procedure DoExtractItemFwd8(const Value; out Item);
    procedure DoExtractItemFwdN(const Value; out Item);
    procedure DoExtractItemFwdString(const Value; out Item);
    procedure DoExtractItemFwdInterface(const Value; out Item);
    procedure DoExtractItemFwdVariant(const Value; out Item);
    procedure DoExtractItemFwdByteString(const Value; out Item);
{$IF not Defined(NEXTGEN)}
    procedure DoExtractItemFwdWideString(const Value; out Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure DoExtractItemFwdObject(const Value; out Item);
{$ENDIF}
    procedure DoExtractItemFwdManaged(const Value; out Item);
{$IF Defined(WEAKREF)}
    procedure DoExtractItemFwdWeak(const Value; out Item);
{$ENDIF}
    procedure DoExtractItemRev1(const Value; out Item);
    procedure DoExtractItemRev2(const Value; out Item);
    procedure DoExtractItemRev4(const Value; out Item);
    procedure DoExtractItemRev8(const Value; out Item);
    procedure DoExtractItemRevN(const Value; out Item);
    procedure DoExtractItemRevString(const Value; out Item);
    procedure DoExtractItemRevInterface(const Value; out Item);
    procedure DoExtractItemRevVariant(const Value; out Item);
    procedure DoExtractItemRevByteString(const Value; out Item);
{$IF not Defined(NEXTGEN)}
    procedure DoExtractItemRevWideString(const Value; out Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure DoExtractItemRevObject(const Value; out Item);
{$ENDIF}
    procedure DoExtractItemRevManaged(const Value; out Item);
{$IF Defined(WEAKREF)}
    procedure DoExtractItemRevWeak(const Value; out Item);
{$ENDIF}
    procedure DoExchangeStringInline(Index1, Index2: NativeInt); inline;
    procedure DoExchangeInterfaceInline(Index1, Index2: NativeInt); inline;
    procedure DoExchangeVariantInline(Index1, Index2: NativeInt); inline;
    procedure DoExchangeDynArrayInline(Index1, Index2: NativeInt); inline;
    procedure DoExchangeByteStringInline(Index1, Index2: NativeInt); inline;
{$IF not Defined(NEXTGEN)}
    procedure DoExchangeWideStringInline(Index1, Index2: NativeInt); inline;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure DoExchangeObjectInline(Index1, Index2: NativeInt); inline;
{$ENDIF}
    procedure DoExchangeString(Index1, Index2: NativeInt);
    procedure DoExchangeInterface(Index1, Index2: NativeInt);
    procedure DoExchangeVariant(Index1, Index2: NativeInt);
    procedure DoExchangeDynArray(Index1, Index2: NativeInt);
    procedure DoExchangeByteString(Index1, Index2: NativeInt);
{$IF not Defined(NEXTGEN)}
    procedure DoExchangeWideString(Index1, Index2: NativeInt);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure DoExchangeObject(Index1, Index2: NativeInt);
{$ENDIF}
    function DoRemoveFwd1(const Value): NativeInt;
    function DoRemoveFwd2(const Value): NativeInt;
    function DoRemoveFwd4(const Value): NativeInt;
    function DoRemoveFwd8(const Value): NativeInt;
    function DoRemoveFwdN(const Value): NativeInt;
    function DoRemoveFwdMRef(const Value): NativeInt;
    function DoRemoveFwdString(const Value): NativeInt;
    function DoRemoveFwdManaged(const Value): NativeInt;
{$IF Defined(WEAKREF)}
    function DoRemoveFwdWeak(const Value): NativeInt;
{$ENDIF}
    function DoRemoveRev1(const Value): NativeInt;
    function DoRemoveRev2(const Value): NativeInt;
    function DoRemoveRev4(const Value): NativeInt;
    function DoRemoveRev8(const Value): NativeInt;
    function DoRemoveRevN(const Value): NativeInt;
    function DoRemoveRevMRef(const Value): NativeInt;
    function DoRemoveRevString(const Value): NativeInt;
    function DoRemoveRevManaged(const Value): NativeInt;
{$IF Defined(WEAKREF)}
    function DoRemoveRevWeak(const Value): NativeInt;
{$ENDIF}
    procedure SetItem1(const Value; AIndex: NativeInt);
    procedure SetItem2(const Value; AIndex: NativeInt);
    procedure SetItem4(const Value; AIndex: NativeInt);
    procedure SetItem8(const Value; AIndex: NativeInt);
    procedure SetItemManaged(const Value; AIndex: NativeInt);
    procedure SetItemN(const Value; AIndex: NativeInt);
{$IF Defined(AUTOREFCOUNT)}
    procedure DoInsertObject(AIndex: NativeInt; const Value);
    procedure DoSetItemObject(const Value; AIndex: NativeInt);
    function DoAddObject(const Value): NativeInt;
{$ENDIF}
    procedure DoInsertByteString(AIndex: NativeInt; const Value);
    procedure DoSetItemByteString(const Value; AIndex: NativeInt);
    function DoAddByteString(const Value): NativeInt;
{$IF not Defined(NEXTGEN)}
    procedure DoInsertWideString(AIndex: NativeInt; const Value);
    procedure DoSetItemWideString(const Value; AIndex: NativeInt);
    function DoAddWideString(const Value): NativeInt;
{$ENDIF}
    procedure DoInsertInterface(AIndex: NativeInt; const Value);
    procedure DoSetItemInterface(const Value; AIndex: NativeInt);
    procedure DoInsertString(AIndex: NativeInt; const Value);
    procedure DoSetItemString(const Value; AIndex: NativeInt);
    procedure DoInsertDynArray(AIndex: NativeInt; const Value);
    procedure DoSetItemDynArray(const Value; AIndex: NativeInt);
    procedure SetItemVariant(const Value; AIndex: NativeInt);
    procedure SetItemMRef(const Value; AIndex: NativeInt; TypeKind: TTypeKind); inline;
    function DoAddInterface(const Value): NativeInt;
    function DoAddString(const Value): NativeInt;
    function DoAddDynArray(const Value): NativeInt;
    procedure DoReverseMRef(Kind: TTypeKind); inline;
    procedure DoReverseString;
    procedure DoReverseInterface;
    procedure DoReverseVariant;
    procedure DoReverseDynArray;
    procedure DoReverseByteString;
{$IF not Defined(NEXTGEN)}
    procedure DoReverseWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure DoReverseObject;
{$ENDIF}
    function InternalAdd1(const Value): NativeInt;
    function InternalAdd2(const Value): NativeInt;
    function InternalAdd4(const Value): NativeInt;
    function InternalAdd8(const Value): NativeInt;
    function InternalAddN(const Value): NativeInt;
    function InternalAddVariant(const Value): NativeInt;
    function InternalAddMRef(const Value; TypeKind: TTypeKind): NativeInt; inline;
    function InternalAddManaged(const Value): NativeInt;
    procedure InternalGrow(ANewCount: NativeInt);
    procedure InternalGrowCheck(ANewCount: NativeInt);
    procedure InternalDeleteRange1(AIndex, ACount: NativeInt);
    procedure InternalDeleteRange2(AIndex, ACount: NativeInt);
    procedure InternalDeleteRange4(AIndex, ACount: NativeInt);
    procedure InternalDeleteRange8(AIndex, ACount: NativeInt);
    procedure InternalDeleteRangeN(AIndex, ACount: NativeInt);
    procedure InternalDeleteRangeMRef(AIndex, ACount: NativeInt);
    procedure InternalDeleteRangeManaged(AIndex, ACount: NativeInt);
{$IF Defined(WEAKREF)}
    procedure InternalDeleteRangeWeak(AIndex, ACount: NativeInt);
{$ENDIF}
    procedure InternalDoDelete1(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDelete2(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDelete4(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDelete8(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDeleteN(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDeleteMRef(AIndex: NativeInt; Action: TCollectionNotification);
    procedure InternalDoDeleteManaged(AIndex: NativeInt; Action: TCollectionNotification);
{$IF Defined(WEAKREF)}
    procedure InternalDoDeleteWeak(AIndex: NativeInt; Action: TCollectionNotification);
{$ENDIF}
    procedure InternalSetCapacity(Value: NativeInt);
    procedure InternalSetCount1(Value: NativeInt);
    procedure InternalSetCount2(Value: NativeInt);
    procedure InternalSetCount4(Value: NativeInt);
    procedure InternalSetCount8(Value: NativeInt);
    procedure InternalSetCountN(Value: NativeInt);
    procedure InternalSetCountMRef(Value: NativeInt);
    procedure InternalSetCountManaged(Value: NativeInt);
{$IF Defined(WEAKREF)}
    procedure InternalSetCountWeak(Value: NativeInt);
{$ENDIF}
    procedure InternalClear1;
    procedure InternalClear2;
    procedure InternalClear4;
    procedure InternalClear8;
    procedure InternalClearN;
    procedure InternalClearMRef;
    procedure InternalClearManaged;
{$IF Defined(WEAKREF)}
    procedure InternalClearWeak;
{$ENDIF}
    procedure InternalInsert1(AIndex: NativeInt; const Value);
    procedure InternalInsert2(AIndex: NativeInt; const Value);
    procedure InternalInsert4(AIndex: NativeInt; const Value);
    procedure InternalInsert8(AIndex: NativeInt; const Value);
    procedure InternalInsertN(AIndex: NativeInt; const Value);
    procedure InternalInsertVariant(AIndex: NativeInt; const Value);
    procedure InternalInsertMRef(AIndex: NativeInt; const Value; TypeKind: TTypeKind); inline;
    procedure InternalInsertManaged(AIndex: NativeInt; const Value);
{$IF Defined(WEAKREF)}
    procedure InternalInsertWeak(AIndex: NativeInt; const Value);
{$ENDIF}
    procedure InternalInsertRange1(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
    procedure InternalInsertRange2(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
    procedure InternalInsertRange4(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
    procedure InternalInsertRange8(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
    procedure InternalInsertRangeN(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
    procedure InternalInsertRangeManaged(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
{$IF Defined(WEAKREF)}
    procedure InternalInsertRangeWeak(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
{$ENDIF}
    function InternalIndexOf1(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOf2(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOf4(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOf8(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOfN(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOfMRef(const Value; Direction: Byte): NativeInt; inline;
    function InternalIndexOfString(const Value; Direction: Byte): NativeInt; inline;
    procedure InternalExtractItem1(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItem2(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItem4(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItem8(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItemN(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItemMRef(const Value; Kind: TTypeKind; out Item; Direction: Byte); inline;
    procedure InternalExtractItemVariant(const Value; out Item; Direction: Byte); inline;
    procedure InternalExtractItemManaged(const Value; out Item; Direction: Byte); inline;
{$IF Defined(WEAKREF)}
    procedure InternalExtractItemWeak(const Value; out Item; Direction: Byte); inline;
{$ENDIF}
    procedure InternalExchange1(Index1, Index2: NativeInt);
    procedure InternalExchange2(Index1, Index2: NativeInt);
    procedure InternalExchange4(Index1, Index2: NativeInt);
    procedure InternalExchange8(Index1, Index2: NativeInt);
    procedure InternalExchangeN(Index1, Index2: NativeInt);
    procedure InternalExchangeMRef(Index1, Index2: NativeInt; Kind: TTypeKind); inline;
    procedure InternalExchangeManaged(Index1, Index2: NativeInt);
    procedure InternalMove1(CurIndex, NewIndex: NativeInt);
    procedure InternalMove2(CurIndex, NewIndex: NativeInt);
    procedure InternalMove4(CurIndex, NewIndex: NativeInt);
    procedure InternalMove8(CurIndex, NewIndex: NativeInt);
    procedure InternalMoveN(CurIndex, NewIndex: NativeInt);
    procedure InternalMoveMRef(CurIndex, NewIndex: NativeInt);
    procedure InternalMoveManaged(CurIndex, NewIndex: NativeInt);
    procedure InternalPackInline(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPack1(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPack2(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPack4(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPack8(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPackN(const IsEmpty: TInternalEmptyFunc);
    procedure InternalPackManaged(const IsEmpty: TInternalEmptyFunc);
    function InternalRemove1(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemove2(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemove4(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemove8(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemoveN(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemoveMRef(const Value; Direction: Byte): NativeInt; inline;
    function InternalRemoveString(const Value; Direction: Byte): NativeInt;
    function InternalRemoveManaged(const Value; Direction: Byte): NativeInt; inline;
{$IF Defined(WEAKREF)}
    function InternalRemoveWeak(const Value; Direction: Byte): NativeInt; inline;
{$ENDIF}
    procedure InternalReverse1;
    procedure InternalReverse2;
    procedure InternalReverse4;
    procedure InternalReverse8;
    procedure InternalReverseN;
    procedure InternalReverseMRef(Kind: TTypeKind); inline;
    procedure InternalReverseManaged;
    procedure InternalToArray(var Dest: Pointer);
    procedure InternalToArrayManaged(var Dest: Pointer);
    property ElType: Pointer read GetElType;
    property ElSize: NativeInt read GetElSize;
  end;

  TList<T> = class(TEnumerable<T>)
  public type
    arrayofT = array of T;
    ParrayofT = ^arrayofT;
  private var
    // keep fields in same layout as in TListHelper
    FItems: TArray<T>;
    FCount: NativeInt;
    FTypeInfo: Pointer;
    [unsafe] FListObj: TObject;
    FNotify: TListHelper.TInternalNotifyProc;
    FCompare: TListHelper.TInternalCompareFunc;
    // FListHelper: TListHelper;
    FComparer: IComparer<T>;
    FOnNotify: TCollectionNotifyEvent<T>;

    function FListHelper: PListHelper; inline;
    function GetList: arrayofT; inline;
    function GetPList: ParrayofT; inline;
    function GetCapacity: NativeInt; inline;
    procedure SetCapacity(Value: NativeInt); overload; inline;
    procedure SetCount(Value: NativeInt); inline;
    function GetIsEmpty: Boolean; inline;
    procedure CheckItemRange(AIndex: NativeInt); inline;
    function GetItem(Index: NativeInt): T; inline;
    procedure SetItem(Index: NativeInt; const Value: T); inline;
    procedure GrowCheck(ACount: NativeInt); inline;
    procedure DoDelete(Index: NativeInt; Notification: TCollectionNotification); inline;
    procedure InternalNotify(const Item; Action: TCollectionNotification);
    procedure UpdateNotify;
    procedure SetOnNotify(const Value: TCollectionNotifyEvent<T>);
    function InternalCompare(const Left, Right): Integer;
    procedure UpdateComparer(const AComparer: IComparer<T>);
  protected
    function ItemValue(const Item: T): NativeInt;
    function DoGetEnumerator: TEnumerator<T>; override;
    procedure Notify(const Item: T; Action: TCollectionNotification); virtual;
  public type
    TDirection = System.Types.TDirection;
    TEmptyFunc = reference to function (const L, R: T): Boolean;

    constructor Create; overload;
    constructor Create(const AComparer: IComparer<T>); overload;
    constructor Create(const Collection: TEnumerable<T>); overload;
    constructor Create(const Collection: IEnumerable<T>); overload;
    constructor Create(const Values: array of T); overload;
    destructor Destroy; override;

    class procedure Error(const Msg: string; Data: NativeInt); overload; virtual;
{$IFNDEF NEXTGEN}
    class procedure Error(Msg: PResStringRec; Data: NativeInt); overload;
{$ENDIF  NEXTGEN}

    function Add(const Value: T): NativeInt; inline;

    procedure AddRange(const Values: array of T); overload;
    procedure AddRange(const Collection: IEnumerable<T>); overload; inline;
    procedure AddRange(const Collection: TEnumerable<T>); overload; inline;

    procedure Insert(Index: NativeInt; const Value: T); inline;

    procedure InsertRange(Index: NativeInt; const Values: array of T; Count: NativeInt); overload;
    procedure InsertRange(Index: NativeInt; const Values: array of T); overload;
    procedure InsertRange(Index: NativeInt; const Collection: IEnumerable<T>); overload;
    procedure InsertRange(Index: NativeInt; const Collection: TEnumerable<T>); overload;

    procedure Pack; overload;
    procedure Pack(const IsEmpty: TEmptyFunc); overload;

    function Remove(const Value: T): NativeInt; inline;
    function RemoveItem(const Value: T; Direction: TDirection): NativeInt; inline;
    procedure Delete(Index: NativeInt); inline;
    procedure DeleteRange(AIndex, ACount: NativeInt); inline;
    function ExtractItem(const Value: T; Direction: TDirection): T; inline;
    function Extract(const Value: T): T; inline;
    function ExtractAt(Index: NativeInt): T;

    procedure Exchange(Index1, Index2: NativeInt); inline;
    procedure Move(CurIndex, NewIndex: NativeInt); inline;

    function First: T; inline;
    function Last: T; inline;

    procedure Clear; inline;

    function Expand: TList<T>; inline;

    function Contains(const Value: T): Boolean; inline;
    function IndexOf(const Value: T): NativeInt; inline;
    function IndexOfItem(const Value: T; Direction: TDirection): NativeInt; inline;
    function LastIndexOf(const Value: T): NativeInt; inline;

    procedure Reverse; inline;

    procedure Sort; overload;
    procedure Sort(const AComparer: IComparer<T>); overload;
    procedure Sort(const AComparer: IComparer<T>; Index, Count: NativeInt); overload;
    function BinarySearch(const Item: T; out FoundIndex: NativeInt): Boolean; overload;
    function BinarySearch(const Item: T; out FoundIndex: NativeInt; const AComparer: IComparer<T>): Boolean; overload;
    function BinarySearch(const Item: T; out FoundIndex: NativeInt; const AComparer: IComparer<T>; Index, Count: NativeInt): Boolean; overload;
{$IF Defined(CPU64BITS)}
    function BinarySearch(const Item: T; out FoundIndex: Integer): Boolean; overload;
    function BinarySearch(const Item: T; out FoundIndex: Integer; const AComparer: IComparer<T>): Boolean; overload;
    function BinarySearch(const Item: T; out FoundIndex: Integer; const AComparer: IComparer<T>; Index, Count: Integer): Boolean; overload;
{$ENDIF CPU64BITS}

    procedure TrimExcess; inline;

    function ToArray: TArray<T>; override; final;

    property Capacity: NativeInt read GetCapacity write SetCapacity;
    property Count: NativeInt read FCount write SetCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property Items[Index: NativeInt]: T read GetItem write SetItem; default;
    property List: arrayofT read GetList;
    property PList: ParrayofT read GetPList;
    property Comparer: IComparer<T> read FComparer;

    property OnNotify: TCollectionNotifyEvent<T> read FOnNotify write SetOnNotify;

    type
      TEnumerator = class(TEnumerator<T>)
      private
        FList: TList<T>;
        FIndex: NativeInt;
        function GetCurrent: T; inline;
      protected
        function DoGetCurrent: T; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const AList: TList<T>);
        function MoveNext: Boolean; inline;
        property Current: T read GetCurrent;
      end;

    function GetEnumerator: TEnumerator; reintroduce; inline;
  end;

  TThreadList<T> = class
  private
    FList: TList<T>;
    FLock: TObject;
    FDuplicates: TDuplicates;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Item: T);
    procedure Clear;
    function LockList: TList<T>;
    procedure Remove(const Item: T); inline;
    procedure RemoveItem(const Item: T; Direction: TDirection);
    procedure UnlockList; inline;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
  end;

  PQueueHelper = ^TQueueHelper;
  TQueueHelper = record
  private
    FHead, FTail: NativeInt;
    FLH: TListHelper;
    procedure DynArraySetLength(Value: NativeInt); inline;
    function GetElType: Pointer; inline;
    function GetElSize: NativeInt; inline;
    function GetNewCap: NativeInt; inline;
    procedure CheckEmpty; inline;
    procedure DequeueAdjust(Notification: TCollectionNotification; const Item); inline;
    procedure InternalDequeueString(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeueInterface(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeueDynArray(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeueByteString(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$IF not Defined(NEXTGEN)}
    procedure InternalDequeueWideString(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalDequeueObject(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$ENDIF}
    procedure InternalDequeue1(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeue2(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeue4(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeue8(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeueN(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDequeueMRef(Notification: TCollectionNotification; Peek: Boolean; out Item; Kind: TTypeKind); inline;
    procedure InternalDequeueManaged(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalClearString;
    procedure InternalClearInterface;
    procedure InternalClearDynArray;
    procedure InternalClearByteString;
{$IF not Defined(NEXTGEN)}
    procedure InternalClearWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalClearObject;
{$ENDIF}
    procedure InternalClear1;
    procedure InternalClear2;
    procedure InternalClear4;
    procedure InternalClear8;
    procedure InternalClearN;
    procedure InternalClearMRef(Kind: TTypeKind); inline;
    procedure InternalClearManaged;
    procedure EnqueueAdjust(const Value); inline;
    procedure InternalEnqueueString(const Value);
    procedure InternalEnqueueInterface(const Value);
    procedure InternalEnqueueByteString(const Value);
    procedure InternalEnqueueDynArray(const Value);
{$IF not Defined(NEXTGEN)}
    procedure InternalEnqueueWideString(const Value);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalEnqueueObject(const Value);
{$ENDIF}
    procedure InternalEnqueue1(const Value);
    procedure InternalEnqueue2(const Value);
    procedure InternalEnqueue4(const Value);
    procedure InternalEnqueue8(const Value);
    procedure InternalEnqueueN(const Value);
    procedure InternalEnqueueMRef(const Value; Kind: TTypeKind); inline;
    procedure InternalEnqueueManaged(const Value);
    procedure InternalGrow1;
    procedure InternalGrow2;
    procedure InternalGrow4;
    procedure InternalGrow8;
    procedure InternalGrowN;
    procedure InternalGrowMRef;
    procedure InternalGrowManaged;
    procedure InternalSetCapacityInline(Value: NativeInt; ElemSize: NativeInt); inline;
    procedure InternalSetCapacity1(Value: NativeInt);
    procedure InternalSetCapacity2(Value: NativeInt);
    procedure InternalSetCapacity4(Value: NativeInt);
    procedure InternalSetCapacity8(Value: NativeInt);
    procedure InternalSetCapacityN(Value: NativeInt);
    procedure InternalSetCapacityMRef(Value: NativeInt);
    procedure InternalSetCapacityManaged(Value: NativeInt);
    property FItems: Pointer read FLH.FItems;
    property ElType: Pointer read GetElType;
    property ElSize: NativeInt read GetElSize;
  end;

  // Queue implemented over array, using wrapping.
  TQueue<T> = class(TEnumerable<T>)
  private type
    arrayOfT = array of T;
  private
    // keep fields in same layout as in TQueueHelper
    FHead, FTail: NativeInt;
    FItems: TArray<T>;
    FCount: NativeInt;
    FTypeInfo: Pointer;
    [unsafe] FListObj: TObject;
    FNotify: TListHelper.TInternalNotifyProc;
    FCompare: TListHelper.TInternalCompareFunc;
    // FQueueHelper: TQueueHelper;
    FOnNotify: TCollectionNotifyEvent<T>;

    function FQueueHelper: PQueueHelper; inline;
    function GetIsEmpty: Boolean; inline;
    function GetList: arrayOfT; inline;
    procedure SetCapacity(Value: NativeInt); inline;
    function DoDequeue(Notification: TCollectionNotification): T; inline;
    procedure DoSetCapacity(Value: NativeInt); inline;
    function GetCapacity: NativeInt; inline;
    procedure InternalNotify(const Item; Action: TCollectionNotification);
    function InternalCompare(const Left, Right): Integer;
  protected
    function DoGetEnumerator: TEnumerator<T>; override;
    procedure Notify(const Item: T; Action: TCollectionNotification); virtual;
  public
    constructor Create; overload;
    constructor Create(const Collection: TEnumerable<T>); overload;
    constructor Create(const Collection: IEnumerable<T>); overload;
    destructor Destroy; override;
    procedure Enqueue(const Value: T); inline;
    function Dequeue: T; inline;
    function Extract: T; inline;
    function Peek: T; inline;
    procedure Clear; inline;
    procedure TrimExcess; inline;
    property Count: NativeInt read FCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property List: arrayOfT read GetList;
    property Capacity: NativeInt read GetCapacity write DoSetCapacity;
    property OnNotify: TCollectionNotifyEvent<T> read FOnNotify write FOnNotify;
    function ToArray: TArray<T>; override; final;

    type
      TEnumerator = class(TEnumerator<T>)
      private
        FQueue: TQueue<T>;
        FIndex: NativeInt;
        function GetCurrent: T;
      protected
        function DoGetCurrent: T; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const AQueue: TQueue<T>);
        property Current: T read GetCurrent;
        function MoveNext: Boolean; inline;
      end;

    function GetEnumerator: TEnumerator; reintroduce; inline;
  end;

  PStackHelper = ^TStackHelper;
  TStackHelper = record
  private
    FLH: TListHelper;
    function GetElType: Pointer; inline;
    function GetElSize: NativeInt; inline;
    procedure CheckEmpty; inline;
    procedure CheckGrow; inline;
    procedure InternalGrow;
    procedure InternalSetCapacity(Value: NativeInt);
    procedure PopAdjust(const Value; Notification: TCollectionNotification); inline;
    procedure InternalDoPopString(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPopInterface(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPopDynArray(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPopByteString(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$IF not Defined(NEXTGEN)}
    procedure InternalDoPopWideString(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalDoPopObject(Notification: TCollectionNotification; Peek: Boolean; out Item);
{$ENDIF}
    procedure InternalDoPop1(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPop2(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPop4(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPop8(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPopN(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalDoPopMRef(Notification: TCollectionNotification; Peek: Boolean; out Item; Kind: TTypeKind); inline;
    procedure InternalDoPopManaged(Notification: TCollectionNotification; Peek: Boolean; out Item);
    procedure InternalClearString;
    procedure InternalClearInterface;
    procedure InternalClearDynArray;
    procedure InternalClearByteString;
{$IF not Defined(NEXTGEN)}
    procedure InternalClearWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalClearObject;
{$ENDIF}
    procedure InternalClear1;
    procedure InternalClear2;
    procedure InternalClear4;
    procedure InternalClear8;
    procedure InternalClearN;
    procedure InternalClearMRef(Kind: TTypeKind); inline;
    procedure InternalClearManaged;
    procedure PushAdjust(const Value); inline;
    procedure InternalPushString(const Value);
    procedure InternalPushInterface(const Value);
    procedure InternalPushDynArray(const Value);
    procedure InternalPushByteString(const Value);
{$IF not Defined(NEXTGEN)}
    procedure InternalPushWideString(const Value);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    procedure InternalPushObject(const Value);
{$ENDIF}
    procedure InternalPush1(const Value);
    procedure InternalPush2(const Value);
    procedure InternalPush4(const Value);
    procedure InternalPush8(const Value);
    procedure InternalPushN(const Value);
    procedure InternalPushMRef(const Value; Kind: TTypeKind); inline;
    procedure InternalPushManaged(const Value);
    property FItems: Pointer read FLH.FItems;
    property ElType: Pointer read GetElType;
    property ElSize: NativeInt read GetElSize;
  end;

  TStack<T> = class(TEnumerable<T>)
  private type
    arrayOfT = array of T;
  private
    // keep fields in same layout as in TStackHelper
    FItems: TArray<T>;
    FCount: NativeInt;
    FTypeInfo: Pointer;
    [unsafe] FListObj: TObject;
    FNotify: TListHelper.TInternalNotifyProc;
{$HINTS OFF}
    FCompare: TListHelper.TInternalCompareFunc;
{$HINTS ON}
    // FStackHelper: TStackHelper;
    FOnNotify: TCollectionNotifyEvent<T>;

    function FStackHelper: PStackHelper; inline;
    function GetIsEmpty: Boolean; inline;
    function GetList: arrayOfT; inline;
    function DoPop(Notification: TCollectionNotification): T; inline;
    procedure DoSetCapacity(Value: NativeInt); inline;
    function GetCapacity: NativeInt; inline;
    procedure InternalNotify(const Item; Action: TCollectionNotification);
  protected
    function DoGetEnumerator: TEnumerator<T>; override;
    procedure Notify(const Item: T; Action: TCollectionNotification); virtual;
  public
    constructor Create; overload;
    constructor Create(const Collection: TEnumerable<T>); overload;
    constructor Create(const Collection: IEnumerable<T>); overload;
    destructor Destroy; override;
    procedure Clear; inline;
    procedure Push(const Value: T); inline;
    function Pop: T; inline;
    function Peek: T; inline;
    function Extract: T; inline;
    procedure TrimExcess; inline;
    function ToArray: TArray<T>; override; final;
    property Count: NativeInt read FCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property List: arrayOfT read GetList;
    property Capacity: NativeInt read GetCapacity write DoSetCapacity;
    property OnNotify: TCollectionNotifyEvent<T> read FOnNotify write FOnNotify;

    type
      TEnumerator = class(TEnumerator<T>)
      private
        FStack: TStack<T>;
        FIndex: NativeInt;
        function GetCurrent: T; inline;
      protected
        function DoGetCurrent: T; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const AStack: TStack<T>);
        property Current: T read GetCurrent;
        function MoveNext: Boolean; inline;
      end;

    function GetEnumerator: TEnumerator; reintroduce;
  end;

  (*$HPPEMIT END OPENNAMESPACE*)
  (*$HPPEMIT END '  template<typename TKey, typename TValue>'*)
  (*$HPPEMIT END '  inline __fastcall TPair__2<TKey, TValue>::TPair__2(const TKey AKey, const TValue AValue) :'*)
  (*$HPPEMIT END '                                            Key(AKey), Value(AValue)'*)
  (*$HPPEMIT END '  {}'*)
  (*$HPPEMIT END CLOSENAMESPACE*)
  [HPPGEN(HPPGenAttribute.mkNonPackage)]
  TPair<K,V> = record
    Key: K;
    Value: V;
    constructor Create(const AKey: K; const AValue: V);
  end;

  // Hash table using linear probing
  TDictionary<K,V> = class(TEnumerable<TPair<K,V>>)
  private type
    TItem = record
      HashCode: Integer;
      Key: K;
      Value: V;
    end {$IF Defined(CPU64BITS)} align 4 {$ENDIF CPU64BITS};
    PItem = ^TItem;
    TItemArray = array of TItem;
  private
    FItems: TItemArray;
    FCount: NativeInt;
    FComparer: IEqualityComparer<K>;
    FGrowThreshold: NativeInt;

    procedure InternalSetCapacity(ACapacity: NativeInt);
    procedure Rehash(NewCapPow2: NativeInt);
    procedure Grow;
    function GetBucketIndex(const Key: K; HashCode: Integer): NativeInt;
    function Hash(const Key: K): Integer;
    function GetIsEmpty: Boolean; inline;
    function GetItem(const Key: K): V;
    procedure SetItem(const Key: K; const Value: V);
    procedure DoAdd(HashCode: Integer; Index: NativeInt; const Key: K; const Value: V);
    procedure DoSetValue(Index: NativeInt; const Value: V);
    function DoRemove(const Key: K; HashCode: Integer; Notification: TCollectionNotification): V;
    function GetCapacity: NativeInt;
    procedure SetCapacity(const Value: NativeInt);
    function GetCollisions: NativeInt;
  protected
    function DoGetEnumerator: TEnumerator<TPair<K,V>>; override;
    procedure KeyNotify(const Key: K; Action: TCollectionNotification); virtual;
    procedure ValueNotify(const Value: V; Action: TCollectionNotification); virtual;
  public
    constructor Create; overload;
    constructor Create(ACapacity: NativeInt); overload;
    constructor Create(const AComparer: IEqualityComparer<K>); overload;
    constructor Create(ACapacity: NativeInt; const AComparer: IEqualityComparer<K>); overload;
    constructor Create(const Collection: TEnumerable<TPair<K,V>>); overload;
    constructor Create(const Collection: TEnumerable<TPair<K,V>>; const AComparer: IEqualityComparer<K>); overload;
    constructor Create(const AItems: array of TPair<K,V>); overload;
    constructor Create(const AItems: array of TPair<K,V>; const AComparer: IEqualityComparer<K>); overload;
    destructor Destroy; override;

    procedure Add(const Key: K; const Value: V);
    procedure Remove(const Key: K);
    function ExtractPair(const Key: K): TPair<K,V>;
    procedure Clear;
    procedure TrimExcess;
    function TryGetValue(const Key: K; var Value: V): Boolean;
    procedure AddOrSetValue(const Key: K; const Value: V);
    function TryAdd(const Key: K; const Value: V): Boolean;
    function ContainsKey(const Key: K): Boolean;
    function ContainsValue(const Value: V): Boolean;
    function ToArray: TArray<TPair<K,V>>; override; final;

    property Capacity: NativeInt read GetCapacity write SetCapacity;
    property Items[const Key: K]: V read GetItem write SetItem; default;
    property Count: NativeInt read FCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property GrowThreshold: NativeInt read FGrowThreshold;
    property Collisions: NativeInt read GetCollisions;

    type
      TPairEnumerator = class(TEnumerator<TPair<K,V>>)
      private
        FDictionary: TDictionary<K,V>;
        FIndex: NativeInt;
        function GetCurrent: TPair<K,V>;
      protected
        function DoGetCurrent: TPair<K,V>; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const ADictionary: TDictionary<K,V>);
        property Current: TPair<K,V> read GetCurrent;
        function MoveNext: Boolean;
      end;

      TKeyEnumerator = class(TEnumerator<K>)
      private
        FDictionary: TDictionary<K,V>;
        FIndex: NativeInt;
        function GetCurrent: K;
      protected
        function DoGetCurrent: K; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const ADictionary: TDictionary<K,V>);
        property Current: K read GetCurrent;
        function MoveNext: Boolean;
      end;

      TValueEnumerator = class(TEnumerator<V>)
      private
        FDictionary: TDictionary<K,V>;
        FIndex: NativeInt;
        function GetCurrent: V;
      protected
        function DoGetCurrent: V; override;
        function DoMoveNext: Boolean; override;
      public
        constructor Create(const ADictionary: TDictionary<K,V>);
        property Current: V read GetCurrent;
        function MoveNext: Boolean;
      end;

      TValueCollection = class(TEnumerable<V>)
      private
        [Weak] FDictionary: TDictionary<K,V>;
        function GetCount: NativeInt;
      protected
        function DoGetEnumerator: TEnumerator<V>; override;
      public
        constructor Create(const ADictionary: TDictionary<K,V>);
        function GetEnumerator: TValueEnumerator; reintroduce;
        function ToArray: TArray<V>; override; final;
        property Count: NativeInt read GetCount;
      end;

      TKeyCollection = class(TEnumerable<K>)
      private
        [Weak] FDictionary: TDictionary<K,V>;
        function GetCount: NativeInt;
      protected
        function DoGetEnumerator: TEnumerator<K>; override;
      public
        constructor Create(const ADictionary: TDictionary<K,V>);
        function GetEnumerator: TKeyEnumerator; reintroduce;
        function ToArray: TArray<K>; override; final;
        property Count: NativeInt read GetCount;
      end;

  private
    FOnKeyNotify: TCollectionNotifyEvent<K>;
    FOnValueNotify: TCollectionNotifyEvent<V>;
    FKeyCollection: TKeyCollection;
    FValueCollection: TValueCollection;
    function GetKeys: TKeyCollection;
    function GetValues: TValueCollection;
  public
    function GetEnumerator: TPairEnumerator; reintroduce;
    property Keys: TKeyCollection read GetKeys;
    property Values: TValueCollection read GetValues;
    property Comparer: IEqualityComparer<K> read FComparer;
    property OnKeyNotify: TCollectionNotifyEvent<K> read FOnKeyNotify write FOnKeyNotify;
    property OnValueNotify: TCollectionNotifyEvent<V> read FOnValueNotify write FOnValueNotify;
  end;

  THashSet<T> = class(TEnumerable<T>)
  private type
    TVoid = record end;
  private
    FDict: TDictionary<T, TVoid>;
    FOnNotify: TCollectionNotifyEvent<T>;
    function GetCapacity: NativeInt; inline;
    procedure SetCapacity(const Value: NativeInt); inline;
    function GetCount: NativeInt; inline;
    function GetGrowThreshold: NativeInt; inline;
    function GetCollisions: NativeInt; inline;
    function GetComparer: IEqualityComparer<T>; inline;
    function GetIsEmpty: Boolean; inline;
    procedure InternalNotify(Sender: TObject; const Item: T;
      Action: TCollectionNotification);
    procedure UpdateNotify;
    procedure SetOnNotify(const Value: TCollectionNotifyEvent<T>);
  protected
    function DoGetEnumerator: TEnumerator<T>; override;
    procedure Notify(const Item: T; Action: TCollectionNotification); virtual;
  public
    constructor Create; overload;
    constructor Create(ACapacity: NativeInt); overload;
    constructor Create(const AComparer: IEqualityComparer<T>); overload;
    constructor Create(ACapacity: NativeInt; const AComparer: IEqualityComparer<T>); overload;
    constructor Create(const Collection: TEnumerable<T>); overload;
    constructor Create(const Collection: TEnumerable<T>; const AComparer: IEqualityComparer<T>); overload;
    constructor Create(const AItems: array of T); overload;
    constructor Create(const AItems: array of T; const AComparer: IEqualityComparer<T>); overload;
    destructor Destroy; override;

    function Add(const Value: T): Boolean; inline;
    function Remove(const Value: T): Boolean;
    function GetOrAdd(const Value: T): T;
    procedure Clear; inline;
    procedure TrimExcess; inline;
    function Contains(const Value: T): Boolean; inline;
    function ToArray: TArray<T>; override; final;

    function AddRange(const Values: array of T): Boolean; overload;
    function AddRange(const Collection: IEnumerable<T>): Boolean; overload;
    function AddRange(const Collection: TEnumerable<T>): Boolean; overload;

    procedure ExceptWith(const AOther: TEnumerable<T>);
    procedure IntersectWith(const AOther: TEnumerable<T>);
    procedure UnionWith(const AOther: TEnumerable<T>);
    function Overlaps(const AOther: TEnumerable<T>): Boolean;
    function SetEquals(const AOther: TEnumerable<T>): Boolean;
    function IsSubsetOf(const AOther: TEnumerable<T>): Boolean;
    function IsSupersetOf(const AOther: TEnumerable<T>): Boolean;

    property Capacity: NativeInt read GetCapacity write SetCapacity;
    property Count: NativeInt read GetCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property GrowThreshold: NativeInt read GetGrowThreshold;
    property Collisions: NativeInt read GetCollisions;
    property Comparer: IEqualityComparer<T> read GetComparer;
    property OnNotify: TCollectionNotifyEvent<T> read FOnNotify write SetOnNotify;
  end;

  TObjectList<T: class> = class(TList<T>)
  private
    FOwnsObjects: Boolean;
  protected
    procedure Notify(const Value: T; Action: TCollectionNotification); override;
  public
    constructor Create; overload;
    constructor Create(AOwnsObjects: Boolean); overload;
    constructor Create(const AComparer: IComparer<T>; AOwnsObjects: Boolean = True); overload;
    constructor Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean = True); overload;
    destructor Destroy; override;
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TObjectQueue<T: class> = class(TQueue<T>)
  private
    FOwnsObjects: Boolean;
  protected
    procedure Notify(const Value: T; Action: TCollectionNotification); override;
  public
    constructor Create; overload;
    constructor Create(AOwnsObjects: Boolean); overload;
    constructor Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean = True); overload;
    procedure Dequeue;
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TObjectStack<T: class> = class(TStack<T>)
  private
    FOwnsObjects: Boolean;
  protected
    procedure Notify(const Value: T; Action: TCollectionNotification); override;
  public
    constructor Create; overload;
    constructor Create(AOwnsObjects: Boolean); overload;
    constructor Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean = True); overload;
    procedure Pop;
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TDictionaryOwnership = (doOwnsKeys, doOwnsValues);
  TDictionaryOwnerships = set of TDictionaryOwnership;

  TObjectDictionary<K,V> = class(TDictionary<K,V>)
  private
    FOwnerships: TDictionaryOwnerships;
  protected
    procedure KeyNotify(const Key: K; Action: TCollectionNotification); override;
    procedure ValueNotify(const Value: V; Action: TCollectionNotification); override;
  public
    constructor Create(Ownerships: TDictionaryOwnerships; ACapacity: NativeInt = 0); overload;
    constructor Create(Ownerships: TDictionaryOwnerships;
      const AComparer: IEqualityComparer<K>); overload;
    constructor Create(Ownerships: TDictionaryOwnerships; ACapacity: NativeInt;
      const AComparer: IEqualityComparer<K>); overload;
  end;

  TObjectHashSet<T: class> = class(THashSet<T>)
  private
    FOwnsObjects: Boolean;
  protected
    procedure Notify(const Value: T; Action: TCollectionNotification); override;
  public
    constructor Create(AOwnsObjects: Boolean; ACapacity: NativeInt = 0); overload;
    constructor Create(AOwnsObjects: Boolean; const AComparer: IEqualityComparer<T>); overload;
    constructor Create(AOwnsObjects: Boolean; ACapacity: NativeInt;
      const AComparer: IEqualityComparer<T>); overload;
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TThreadedQueue<T> = class
  private
    FQueue: array of T;
    FQueueNotEmpty,
    FQueueNotFull: TObject;
    FQueueLock: TObject;
    FTotalItemsPushed, FTotalItemsPopped: UInt64;
    FQueueSize, FQueueOffset: NativeInt;
    FPushTimeout, FPopTimeout: Cardinal;
    FShutDown: Boolean;
{$IF Defined(CPU32BITS)}
    function GetTotalItemsPopped: UInt64;
    function GetTotalItemsPushed: UInt64;
{$ENDIF CPU32BITS}
  public
    constructor Create(AQueueDepth: Integer = 10; PushTimeout: Cardinal = INFINITE; PopTimeout: Cardinal = INFINITE);
    destructor Destroy; override;

    procedure Grow(ADelta: NativeInt);
    function PushItem(const AItem: T): TWaitResult; overload;
    function PushItem(const AItem: T; out AQueueSize: NativeInt): TWaitResult; overload;
{$IF Defined(CPU64BITS)}
    function PushItem(const AItem: T; out AQueueSize: Integer): TWaitResult; overload;
{$ENDIF CPU64BITS}
    function PopItem: T; overload;
    function PopItem(out AQueueSize: NativeInt): T; overload;
    function PopItem(out AQueueSize: NativeInt; var AItem: T): TWaitResult; overload;
{$IF Defined(CPU64BITS)}
    function PopItem(out AQueueSize: Integer): T; overload;
    function PopItem(out AQueueSize: Integer; var AItem: T): TWaitResult; overload;
{$ENDIF CPU64BITS}
    function PopItem(var AItem: T): TWaitResult; overload;
    procedure DoShutDown;

    property QueueSize: NativeInt read FQueueSize;
    property ShutDown: Boolean read FShutDown;
{$IF Defined(CPU32BITS)}
    property TotalItemsPushed: UInt64 read GetTotalItemsPushed;
    property TotalItemsPopped: UInt64 read GetTotalItemsPopped;
{$ELSE}
    property TotalItemsPushed: UInt64 read FTotalItemsPushed;
    property TotalItemsPopped: UInt64 read FTotalItemsPopped;
{$ENDIF CPU32BITS}
  end;

  PObject = ^TObject;

procedure ErrorArgumentOutOfRange; overload;
procedure ErrorArgumentOutOfRange(AIndex, AMaxIndex: NativeInt; AListObj: TObject); overload;
function InCircularRange(Bottom, Item, TopInc: NativeInt): Boolean; inline;

implementation

uses System.Variants, System.TypInfo, System.SysConst, System.RTLConsts;

procedure ErrorArgumentOutOfRange;
begin
  raise EArgumentOutOfRangeException.CreateRes(@SArgumentOutOfRange) at ReturnAddress;
end;

procedure ErrorArgumentOutOfRange(AIndex, AMaxIndex: NativeInt; AListObj: TObject);
begin
  raise EArgumentOutOfRangeException.Create(ListIndexErrorMsg(AIndex, AMaxIndex, AListObj)) at ReturnAddress;
end;

{ TArray }

class function TArray.DoBinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: NativeInt; const Comparer: IComparer<T>; Index, Count: NativeInt): Boolean;
var
  L, H, mid: NativeInt;
  cmp: NativeInt;
begin
  if Count = 0 then
  begin
    FoundIndex := Index;
    Exit(False);
  end;

  Result := False;
  L := Index;
  H := Index + Count - 1;
  while L <= H do
  begin
    mid := L + (H - L) div 2;
    cmp := Comparer.Compare(Values[mid], Item);
    if cmp < 0 then
      L := mid + 1
    else
    begin
      H := mid - 1;
      if cmp = 0 then
        Result := True;
    end;
  end;
  FoundIndex := L;
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: NativeInt; const Comparer: IComparer<T>; Index, Count: NativeInt): Boolean;
begin
  if (Index < Low(Values)) or ((Index > High(Values)) and (Count > 0))
     or (Index + Count - 1 > High(Values)) or (Count < 0)
     or (Index + Count < 0) then
    ErrorArgumentOutOfRange;
  Result := DoBinarySearch<T>(Values, Item, FoundIndex, Comparer, Index, Count);
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: NativeInt; const Comparer: IComparer<T>): Boolean;
begin
  Result := DoBinarySearch<T>(Values, Item, FoundIndex, Comparer, Low(Values), Length(Values));
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: NativeInt): Boolean;
begin
  Result := DoBinarySearch<T>(Values, Item, FoundIndex, TComparer<T>.Default, Low(Values), Length(Values));
end;

{$IF Defined(CPU64BITS)}
class procedure TArray.RangeInt32Error(AIndex: NativeInt);
begin
  raise ERangeError.Create(ListIndexErrorMsg(AIndex, Integer.MaxValue, 'TArray')) at ReturnAddress;
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: Integer; const Comparer: IComparer<T>; Index, Count: Integer): Boolean;
var
  LIndex: NativeInt;
begin
  if (Index < Low(Values)) or ((Index > High(Values)) and (Count > 0))
     or (Index + Count - 1 > High(Values)) or (Count < 0)
     or (Index + Count < 0) then
    ErrorArgumentOutOfRange;
  Result := DoBinarySearch<T>(Values, Item, LIndex, Comparer, Index, Count);
  if LIndex > Integer.MaxValue then
    RangeInt32Error(LIndex);
  FoundIndex := LIndex;
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: Integer; const Comparer: IComparer<T>): Boolean;
var
  LIndex: NativeInt;
begin
  Result := DoBinarySearch<T>(Values, Item, LIndex, Comparer, Low(Values), Length(Values));
  if LIndex > Integer.MaxValue then
    RangeInt32Error(LIndex);
  FoundIndex := LIndex;
end;

class function TArray.BinarySearch<T>(const Values: array of T; const Item: T;
  out FoundIndex: Integer): Boolean;
var
  LIndex: NativeInt;
begin
  Result := DoBinarySearch<T>(Values, Item, LIndex, TComparer<T>.Default, Low(Values), Length(Values));
  if LIndex > Integer.MaxValue then
    RangeInt32Error(LIndex);
  FoundIndex := LIndex;
end;
{$ENDIF CPU64BITS}

class procedure TArray.Copy<T>(const Source: array of T; var Destination: array of T; SourceIndex, DestIndex, Count: NativeInt);
begin
  CheckArrays(Pointer(@Source[0]), Pointer(@Destination[0]), SourceIndex, Length(Source), DestIndex, Length(Destination), Count);
  if IsManagedType(T) then
    System.CopyArray(Pointer(@Destination[DestIndex]), Pointer(@Source[SourceIndex]), TypeInfo(T), Count)
  else
    System.Move(Pointer(@Source[SourceIndex])^, Pointer(@Destination[DestIndex])^, Count * SizeOf(T));
end;

class procedure TArray.CheckArrays(Source, Destination: Pointer; SourceIndex, SourceLength, DestIndex, DestLength, Count: NativeInt);
begin
  if (Count < 0) or
     (NativeUInt(SourceIndex) + NativeUInt(Count) > NativeUInt(SourceLength)) or
     (NativeUInt(DestIndex) + NativeUInt(Count) > NativeUInt(DestLength)) then
    ErrorArgumentOutOfRange;
  if (Source = Destination) and (Source <> nil) then
    raise EArgumentException.CreateRes(@sSameArrays);
end;

class procedure TArray.Copy<T>(const Source: array of T; var Destination: array of T; Count: NativeInt);
begin
  Copy<T>(Source, Destination, 0, 0, Count);
end;

class function TArray.Concat<T>(const Args: array of TArray<T>): TArray<T>;
var
  i, out, len: NativeInt;
begin
  len := 0;
  for i := 0 to High(Args) do
    len := len + Length(Args[i]);
  SetLength(Result, len);
  out := 0;
  for i := 0 to High(Args) do
  begin
    len := Length(Args[i]);
    if len > 0 then
    begin
      Copy<T>(Args[i], Result, 0, out, len);
      Inc(out, len);
    end;
  end;
end;

class procedure TArray.QuickSort<T>(var Values: array of T; const Comparer: IComparer<T>;
  L, R: NativeInt);
var
  I, J: NativeInt;
  pivot, temp: T;
begin
  if L < R then
  begin
    repeat
      if (R - L) = 1 then
      begin
        if Comparer.Compare(Values[L], Values[R]) > 0 then
        begin
          temp := Values[L];
          Values[L] := Values[R];
          Values[R] := temp;
        end;
        break;
      end;
      I := L;
      J := R;
      pivot := Values[L + (R - L) shr 1];
      repeat
        while Comparer.Compare(Values[I], pivot) < 0 do
          Inc(I);
        while Comparer.Compare(Values[J], pivot) > 0 do
          Dec(J);
        if I <= J then
        begin
          if I <> J then
          begin
            temp := Values[I];
            Values[I] := Values[J];
            Values[J] := temp;
          end;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if (J - L) > (R - I) then
      begin
        if I < R then
          QuickSort<T>(Values, Comparer, I, R);
        R := J;
      end
      else
      begin
        if L < J then
          QuickSort<T>(Values, Comparer, L, J);
        L := I;
      end;
    until L >= R;
  end;
end;

class procedure TArray.Sort<T>(var Values: array of T);
begin
  if Length(Values) = 0 then
    Exit;
  QuickSort<T>(Values, TComparer<T>.Default, Low(Values), High(Values));
end;

class procedure TArray.Sort<T>(var Values: array of T; const Comparer: IComparer<T>);
begin
  if Length(Values) = 0 then
    Exit;
  QuickSort<T>(Values, Comparer, Low(Values), High(Values));
end;

class procedure TArray.Sort<T>(var Values: array of T; const Comparer: IComparer<T>;
  Index, Count: NativeInt);
begin
  if (Index < Low(Values)) or ((Index > High(Values)) and (Count > 0))
     or (Index + Count - 1 > High(Values)) or (Count < 0)
     or (Index + Count < 0) then
    ErrorArgumentOutOfRange;
  if Length(Values) = 0 then
    Exit;
  if Count <= 1 then
    Exit;
  QuickSort<T>(Values, Comparer, Index, Index + Count - 1);
end;

class function TArray.InternalCompare<T>(ASelf: TObject; const ALeft, ARight): Integer;
begin
  Result := IComparer<T>(Pointer(ASelf)).Compare(T(ALeft), T(ARight));
end;

class function TArray.DoIndexOf<T>(const Values: array of T; const Item: T;
  const Comparer: IComparer<T>; Base, Count: NativeInt; Direction: TDirection): NativeInt;
var
  LLH: TListHelper;
begin
  // minimum required fields for TListHelper.InternalIndexOfXxx call
  LLH.FItems := Pointer(@Values[Base]);
  LLH.FCount := Count;
  if Assigned(Comparer) then
  begin
    LLH.FCompare := @InternalCompare<T>;
    LLH.FListObj := Pointer(Comparer);
  end
  else
    LLH.FCompare := nil;
  // Mostly copied from TList<T>.IndexOfItem
  if IsManagedType(T) then
    if GetTypeKind(T) = tkUString then
      Result := LLH.InternalIndexOfString(Item, Byte(Direction))
    else if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      Result := LLH.InternalIndexOfMRef(Item, Byte(Direction))
    else
    begin
      // LLH.FCompare, FListObj, FTypeInfo must be assigned
      var Cmp: IComparer<T>;
      if not Assigned(LLH.FCompare) then
      begin
        Cmp := TComparer<T>.Default;
        LLH.FCompare := @InternalCompare<T>;
        LLH.FListObj := Pointer(Cmp);
      end;
      LLH.FTypeInfo := TypeInfo(TArray<T>);
      Result := LLH.InternalIndexOfN(Item, Byte(Direction))
    end
  else
  case SizeOf(T) of
    1: Result := LLH.InternalIndexOf1(Item, Byte(Direction));
    2: Result := LLH.InternalIndexOf2(Item, Byte(Direction));
    4: Result := LLH.InternalIndexOf4(Item, Byte(Direction));
    8: Result := LLH.InternalIndexOf8(Item, Byte(Direction));
  else
    begin
      // LLH.FCompare, FListObj, FTypeInfo must be assigned
      var Cmp: IComparer<T>;
      if not Assigned(LLH.FCompare) then
      begin
        Cmp := TComparer<T>.Default;
        LLH.FCompare := @InternalCompare<T>;
        LLH.FListObj := Pointer(Cmp);
      end;
      LLH.FTypeInfo := TypeInfo(TArray<T>);
      Result := LLH.InternalIndexOfN(Item, Byte(Direction));
    end;
  end;
  if Result >= 0 then
    Inc(Result, Base);
end;

class function TArray.IndexOf<T>(const Values: array of T; const Item: T): NativeInt;
begin
  Result := DoIndexOf<T>(Values, Item, nil, 0, Length(Values), TDirection.FromBeginning);
end;

class function TArray.IndexOf<T>(const Values: array of T; const Item: T;
  Index: NativeInt): NativeInt;
begin
  if (Index < Low(Values)) or (Index > High(Values)) then
    ErrorArgumentOutOfRange;
  Result := DoIndexOf<T>(Values, Item, nil, Index, Length(Values) - Index, TDirection.FromBeginning);
end;

class function TArray.IndexOf<T>(const Values: array of T; const Item: T;
  const Comparer: IComparer<T>; Index, Count: NativeInt): NativeInt;
begin
  if (Index < Low(Values)) or ((Index > High(Values)) and (Count > 0))
     or (Index + Count - 1 > High(Values)) or (Count < 0)
     or (Index + Count < 0) then
    ErrorArgumentOutOfRange;
  Result := DoIndexOf<T>(Values, Item, Comparer, Index, Count, TDirection.FromBeginning);
end;

class function TArray.LastIndexOf<T>(const Values: array of T; const Item: T): NativeInt;
begin
  Result := DoIndexOf<T>(Values, Item, nil, 0, Length(Values), TDirection.FromEnd);
end;

class function TArray.LastIndexOf<T>(const Values: array of T; const Item: T;
  Index: NativeInt): NativeInt;
begin
  if (Index < Low(Values)) or (Index > High(Values)) then
    ErrorArgumentOutOfRange;
  Result := DoIndexOf<T>(Values, Item, nil, 0, Index + 1, TDirection.FromEnd);
end;

class function TArray.LastIndexOf<T>(const Values: array of T; const Item: T;
  const Comparer: IComparer<T>; Index, Count: NativeInt): NativeInt;
begin
  if (Index < Low(Values)) or (Index > High(Values)) or (Count > Index + 1) then
    ErrorArgumentOutOfRange;
  Result := DoIndexOf<T>(Values, Item, Comparer, Index - (Count - 1), Count, TDirection.FromEnd);
end;

class function TArray.Contains<T>(const Values: array of T; const Item: T): Boolean;
begin
  Result := DoIndexOf<T>(Values, Item, nil, 0, Length(Values), TDirection.FromBeginning) >= 0;
end;

class function TArray.Contains<T>(const Values: array of T; const Item: T;
  const Comparer: IComparer<T>): Boolean;
begin
  Result := DoIndexOf<T>(Values, Item, Comparer, 0, Length(Values), TDirection.FromBeginning) >= 0;
end;

class procedure TArray.DoFreeValues(P: Pointer; len: NativeInt; elTypeInfo: Pointer);
var
  ref: PPTypeInfo;
  data: PTypeData;
  size: Integer;
  elCount: Integer;
begin
  if (P = nil) or (elTypeInfo = nil) then
    Exit;
  if PTypeInfo(elTypeInfo)^.Kind = tkClass then
  begin
    while len > 0 do
    begin
      FreeAndNil(PObject(P)^);
      Inc(PByte(P), SizeOf(Pointer));
      Dec(len);
    end;
  end
  else if PTypeInfo(elTypeInfo)^.Kind = tkDynArray then
  begin
    ref := GetTypeData(elTypeInfo).DynArrElType;
    if ref = nil then
      Exit;
    elTypeInfo := ref^;
    if (elTypeInfo = nil) or not (PTypeInfo(elTypeInfo)^.Kind in [tkClass, tkDynArray, tkArray]) then
      Exit;
    while len > 0 do
    begin
      DoFreeValues(PPointer(P)^, DynArraySize(PPointer(P)^), elTypeInfo);
      Inc(PByte(P), SizeOf(Pointer));
      Dec(len);
    end;
  end
  else if PTypeInfo(elTypeInfo)^.Kind = tkArray then
  begin
    data := GetTypeData(elTypeInfo);
    ref := data^.ArrayData.ElType;
    if ref = nil then
      Exit;
    elTypeInfo := ref^;
    if (elTypeInfo = nil) or not (PTypeInfo(elTypeInfo)^.Kind in [tkClass, tkDynArray, tkArray]) then
      Exit;
    size := data^.ArrayData.Size;
    elCount := data^.ArrayData.ElCount;
    while len > 0 do
    begin
      DoFreeValues(P, elCount, elTypeInfo);
      Inc(PByte(P), size);
      Dec(len);
    end;
  end;
end;

class procedure TArray.FreeValues<T>(const Values: array of T);
begin
  if GetTypeKind(T) in [tkClass, tkDynArray, tkArray] then
    DoFreeValues(@Values, Length(Values), TypeInfo(T));
end;

class procedure TArray.FreeValues<T>(var Values: TArray<T>);
begin
  if GetTypeKind(T) in [tkClass, tkDynArray, tkArray] then
    DoFreeValues(Values, Length(Values), TypeInfo(T));
end;

class function TArray.ToString<T>(const Values: array of T; const AFormatSettings: TFormatSettings;
  const ASeparator, ADelim1, ADelim2: string): string;
const
  CNil = 'nil';   // Do not localize
  CUnknown = '?'; // Do not localize
  CHex = '$';     // Do not localize
var
  LBld: TStringBuilder;
  i: NativeInt;
  LData: PTypeData;
  P: Pointer;
begin
  if TypeInfo(T) = nil then
    LData := nil
  else
    LData := GetTypeData(TypeInfo(T));
  if (LData = nil) and (GetTypeKind(T) in [tkInteger, tkEnumeration, tkFloat, tkSet, tkInt64]) then
    raise EArgumentException.CreateRes(@SInsufficientRtti);
  LBld := TStringBuilder.Create;
  try
    for i := 0 to High(Values) do
    begin
      if ADelim1 <> '' then
        LBld.Append(ADelim1);
      P := @Values[i];
      case GetTypeKind(T) of
        tkInteger:
          case LData^.OrdType of
            otSByte: LBld.Append(Int8(P^));
            otSWord: LBld.Append(Int16(P^));
            otSLong: LBld.Append(Int32(P^));
            otUByte: LBld.Append(UInt8(P^));
            otUWord: LBld.Append(UInt16(P^));
            otULong: LBld.Append(UInt32(P^));
          end;
        tkChar: LBld.Append(AnsiChar(P^));
        tkEnumeration:
          case SizeOf(T) of
          1: LBld.Append(GetEnumName(TypeInfo(T), Int8(P^)));
          2: LBld.Append(GetEnumName(TypeInfo(T), Int16(P^)));
          4: LBld.Append(GetEnumName(TypeInfo(T), Int32(P^)));
          else LBld.Append(CUnknown);
          end;
        tkFloat:
          case LData^.FloatType of
            ftSingle: LBld.Append(FloatToStr(Single(P^), AFormatSettings));
            ftDouble:
            begin
              if TypeInfo(T) = System.TypeInfo(TDate) then
                LBld.Append(DateToStr(TDate(P^), AFormatSettings))
              else if TypeInfo(T) = System.TypeInfo(TTime) then
                LBld.Append(TimeToStr(TTime(P^), AFormatSettings))
              else if TypeInfo(T) = System.TypeInfo(TDateTime) then
                LBld.Append(DateTimeToStr(TDateTime(P^), AFormatSettings))
              else
                LBld.Append(FloatToStr(Double(P^), AFormatSettings));
            end;
            ftExtended: LBld.Append(FloatToStr(Extended(P^), AFormatSettings));
            ftComp: LBld.Append(Int64(P^));
            ftCurr: LBld.Append(CurrToStr(Currency(P^), AFormatSettings));
          end;
        tkString: LBld.Append(ShortString(P^));
        tkLString: LBld.Append(RawByteString(P^));
        tkUString: LBld.Append(UnicodeString(P^));
        tkWString: LBld.Append(WideString(P^));
        tkSet: LBld.Append(SetToString(PTypeInfo(TypeInfo(T)), P, True));
        tkClass:
          if TObject(P^) = nil then
            LBld.Append(CNil)
          else
            LBld.Append(TObject(P^).ToString);
        tkWChar: LBld.Append(WideChar(P^));
        tkVariant: LBld.Append(VarToStr(Variant(P^)));
        tkPointer:
          begin
            LBld.Append(CHex);
            LBld.Append(IntToHex(NativeUInt(P^), 2 * SizeOf(Pointer)));
          end;
        tkInt64:
          if LData^.MinInt64Value > LData^.MaxInt64Value then
            LBld.Append(UInt64(P^))
          else
            LBld.Append(Int64(P^));
        tkClassRef:
          if TClass(P^) = nil then
            LBld.Append(CNil)
          else
            LBld.Append(TClass(P^).ClassName);
        else
          LBld.Append(CUnknown);
      end;
      if ADelim2 <> '' then
        LBld.Append(ADelim2);
      if (ASeparator <> '') and (i < High(Values)) then
        LBld.Append(ASeparator);
    end;
    Result := LBld.ToString(True);
  finally
    LBld.Free;
  end;
end;

class function TArray.ToString<T>(const Values: array of T;
  const ASeparator, ADelim1, ADelim2: string): string;
begin
  Result := ToString<T>(Values, FormatSettings, ASeparator, ADelim1, ADelim2);
end;

{ TListHelper }

type
  TLocalDynArray = packed record
  {$IFDEF CPU64BITS}
    _Padding: Integer; // Make 16 byte align for payload..
  {$ENDIF}
    RefCnt: Integer;
    Length: NativeInt;
    Data: array[0..1023] of Byte;
  end;

{$POINTERMATH ON}

procedure CopyArray(Dest, Source, TypeInfo: Pointer; ElemSize: NativeInt; Count: NativeInt);
begin
  if Count > 0 then
    if PByte(Dest) > PByte(Source) then
    begin
      Dest := PByte(Dest) + (Count - 1) * ElemSize;
      Source := PByte(Source) + (Count - 1) * ElemSize;
      while Count > 0 do
      begin
        System.CopyArray(Dest, Source, TypeInfo, 1);
        Dec(PByte(Dest), ElemSize);
        Dec(PByte(Source), ElemSize);
        Dec(Count);
      end;
    end else
      System.CopyArray(Dest, Source, TypeInfo, Count);
end;

function TListHelper.GetElSize: NativeInt;
begin
  Result := PDynArrayTypeInfo(PByte(FTypeInfo) + PDynArrayTypeInfo(FTypeInfo).name).elSize;
end;

function TListHelper.GetElType: Pointer;
begin
  Result := PDynArrayTypeInfo(PByte(FTypeInfo) + PDynArrayTypeInfo(FTypeInfo).name).elType^;
end;

function TListHelper.CheckDeleteRange(AIndex, ACount: NativeInt): Boolean;
begin
  if (AIndex < 0) or (ACount < 0) or (AIndex + ACount > FCount) or (AIndex + ACount < 0) then
    ErrorArgumentOutOfRange;
  Result := ACount > 0;
end;

procedure TListHelper.CheckItemRange(AIndex: NativeInt);
begin
  if NativeUInt(AIndex) >= NativeUInt(FCount) then
    ErrorArgumentOutOfRange(AIndex, FCount - 1, FListObj);
end;

procedure TListHelper.CheckInsertRange(AIndex: NativeInt);
begin
  if NativeUInt(AIndex) > NativeUInt(FCount) then
    ErrorArgumentOutOfRange(AIndex, FCount, FListObj);
end;

procedure TListHelper.InternalGrow(ANewCount: NativeInt);
begin
  InternalSetCapacity(GrowCollection(DynArraySize(FItems), ANewCount));
end;

procedure TListHelper.InternalGrowCheck(ANewCount: NativeInt);
begin
  if ANewCount > DynArraySize(FItems) then
    InternalGrow(ANewCount)
  else if ANewCount < 0 then
    OutOfMemoryError;
end;

procedure TListHelper.SetItem1(const Value; AIndex: NativeInt);
var
  OldItem: Byte;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PByte(FItems)[AIndex] := Byte(Value)
  else
  begin
    OldItem := PByte(FItems)[AIndex];
    PByte(FItems)[AIndex] := Byte(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.SetItem2(const Value; AIndex: NativeInt);
var
  OldItem: Word;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PWord(FItems)[AIndex] := Word(Value)
  else
  begin
    OldItem := PWord(FItems)[AIndex];
    PWord(FItems)[AIndex] := Word(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.SetItem4(const Value; AIndex: NativeInt);
var
  OldItem: Cardinal;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PCardinal(FItems)[AIndex] := Cardinal(Value)
  else
  begin
    OldItem := PCardinal(FItems)[AIndex];
    PCardinal(FItems)[AIndex] := Cardinal(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.SetItem8(const Value; AIndex: NativeInt);
var
  OldItem: UInt64;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PUInt64(FItems)[AIndex] := UInt64(Value)
  else
  begin
    OldItem := PUInt64(FItems)[AIndex];
    PUInt64(FItems)[AIndex] := UInt64(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.DoSetItemDynArray(const Value; AIndex: NativeInt);
var
  OldItem: Pointer;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    DynArrayAssign(Pointer(PBytes(FItems)[AIndex]), Pointer(Value), ElType)
  else
  begin
    OldItem := nil;
    try
      TBytes(OldItem) := PBytes(FItems)[AIndex];
      DynArrayAssign(Pointer(PBytes(FItems)[AIndex]), Pointer(Value), ElType);
      FNotify(FListObj, OldItem, cnRemoved);
      FNotify(FListObj, Value, cnAdded);
    finally
      DynArrayClear(OldItem, ElType);
    end;
  end;
end;

procedure TListHelper.DoSetItemInterface(const Value; AIndex: NativeInt);
var
  OldItem: IInterface;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PInterface(FItems)[AIndex] := IInterface(Value)
  else
  begin
    OldItem := PInterface(FItems)[AIndex];
    PInterface(FItems)[AIndex] := IInterface(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.SetItemManaged(const Value; AIndex: NativeInt);
var
  SOldItem: array[0..63] of Byte;
  DOldItem: PByte;
  POldItem: PByte;
  ElemSize: NativeInt;
begin
  CheckItemRange(AIndex);

  ElemSize := ElSize;
  if not Assigned(FNotify) then
    System.CopyArray(PByte(FItems) + (AIndex * ElemSize), @Value, ElType, 1) // FItems[Index] := Value;
  else
  begin
    DOldItem := nil;
    POldItem := @SOldItem;
    try
      if ElemSize > SizeOf(SOldItem) then
      begin
        DOldItem := AllocMem(ElemSize);
        POldItem := DOldItem;
      end
      else
        FillChar(SOldItem, SizeOf(SOldItem), 0);
      InitializeArray(POldItem, ElType, 1);
      try
        System.CopyArray(POldItem, PByte(FItems) + (AIndex * ElemSize), ElType, 1); // oldItem := FItems[Index];
        System.CopyArray(PByte(FItems) + (AIndex * ElemSize), @Value, ElType, 1); // FItems[Index] := Value;

        FNotify(FListObj, POldItem[0], cnRemoved);
        FNotify(FListObj, Value, cnAdded);
      finally
        FinalizeArray(POldItem, ElType, 1);
      end;
    finally
      FreeMem(DOldItem);
    end;
  end;
end;

procedure TListHelper.SetItemN(const Value; AIndex: NativeInt);
var
  SOldItem: array[0..64] of Byte;
  DOldItem: PByte;
  POldItem: PByte;
  ElemSize: NativeInt;
begin
  CheckItemRange(AIndex);

  ElemSize := ElSize;
  if not Assigned(FNotify) then
    Move(Value, PByte(FItems)[AIndex * ElemSize], ElemSize)
  else
  begin
    DOldItem := nil;
    POldItem := @SOldItem[0];
    try
      if ElemSize > SizeOf(SOldItem) then
      begin
        GetMem(DOldItem, ElemSize);
        POldItem := DOldItem;
      end;
      Move(PByte(FItems)[AIndex * ElemSize], POldItem[0], ElemSize);
      Move(Value, PByte(FItems)[AIndex * ElemSize], ElemSize);

      FNotify(FListObj, POldItem[0], cnRemoved);
      FNotify(FListObj, Value, cnAdded);
    finally
      FreeMem(DOldItem);
    end;
  end;
end;

procedure TListHelper.DoSetItemString(const Value; AIndex: NativeInt);
var
  OldItem: string;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PString(FItems)[AIndex] := string(Value)
  else
  begin
    OldItem := PString(FItems)[AIndex];
    PString(FItems)[AIndex] := string(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.InternalExchange1(Index1, Index2: NativeInt);
var
  Temp: Byte;
begin
  Temp := PByte(FItems)[Index1];
  PByte(FItems)[Index1] := PByte(FItems)[Index2];
  PByte(FItems)[Index2] := Temp;
end;

procedure TListHelper.InternalExchange2(Index1, Index2: NativeInt);
var
  Temp: Word;
begin
  Temp := PWord(FItems)[Index1];
  PWord(FItems)[Index1] := PWord(FItems)[Index2];
  PWord(FItems)[Index2] := Temp;
end;

procedure TListHelper.InternalExchange4(Index1, Index2: NativeInt);
var
  Temp: Cardinal;
begin
  Temp := PCardinal(FItems)[Index1];
  PCardinal(FItems)[Index1] := PCardinal(FItems)[Index2];
  PCardinal(FItems)[Index2] := Temp;
end;

procedure TListHelper.InternalExchange8(Index1, Index2: NativeInt);
var
  Temp: UInt64;
begin
  Temp := PUInt64(FItems)[Index1];
  PUInt64(FItems)[Index1] := PUInt64(FItems)[Index2];
  PUInt64(FItems)[Index2] := Temp;
end;

procedure TListHelper.InternalExchangeManaged(Index1, Index2: NativeInt);
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
  ElemSize: NativeInt;
begin
  DTemp := nil;
  PTemp := @STemp;
  try
    ElemSize := ElSize;
    if ElemSize > SizeOf(STemp) then
    begin
      DTemp := AllocMem(ElemSize);
      PTemp := DTemp;
    end else
      FillChar(STemp, ElemSize, 0);
    InitializeArray(PTemp, ElType, 1);
    try
      System.CopyArray(@PTemp[0], @PByte(FItems)[Index1 * ElemSize], ElType, 1);
      System.CopyArray(@PByte(FItems)[Index1 * ElemSize], @PByte(FItems)[Index2 * ElemSize], ElType, 1);
      System.CopyArray(@PByte(FItems)[Index2 * ElemSize], @PTemp[0], ElType, 1);
    finally
      FinalizeArray(PTemp, ElType, 1);
    end;
  finally
    FreeMem(DTemp);
  end;
end;

procedure TListHelper.InternalExchangeMRef(Index1, Index2: NativeInt; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: DoExchangeString(Index1, Index2);
    TTypeKind.tkInterface: DoExchangeInterface(Index1, Index2);
    TTypeKind.tkVariant: DoExchangeVariant(Index1, Index2);
    TTypeKind.tkDynArray: DoExchangeDynArray(Index1, Index2);
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: DoExchangeObject(Index1, Index2);
{$ENDIF}
    TTypeKind.tkLString: DoExchangeByteString(Index1, Index2);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: DoExchangeWideString(Index1, Index2);
{$ENDIF}
  end;
end;

procedure TListHelper.InternalExchangeN(Index1, Index2: NativeInt);
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
  ElemSize: NativeInt;
begin
  DTemp := nil;
  PTemp := @STemp;
  try
    ElemSize := ElSize;
    if ElemSize > SizeOf(STemp) then
    begin
      GetMem(DTemp, ElemSize);
      PTemp := DTemp;
    end;
    Move(PByte(FItems)[Index1 * ElemSize], PTemp[0], ElemSize);
    Move(PByte(FItems)[Index2 * ElemSize], PByte(FItems)[Index1 * ElemSize], ElemSize);
    Move(PTemp[0], PByte(FItems)[Index2 * ElemSize], ElemSize);
  finally
    FreeMem(DTemp);
  end;
end;

procedure TListHelper.InternalExtractItem1(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwd1(Value, Item)
  else
    DoExtractItemRev1(Value, Item);
end;

procedure TListHelper.InternalExtractItem2(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwd2(Value, Item)
  else
    DoExtractItemRev2(Value, Item);
end;

procedure TListHelper.InternalExtractItem4(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwd4(Value, Item)
  else
    DoExtractItemRev4(Value, Item);
end;

procedure TListHelper.InternalExtractItem8(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwd8(Value, Item)
  else
    DoExtractItemRev8(Value, Item);
end;

procedure TListHelper.InternalExtractItemManaged(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwdManaged(Value, Item)
  else
    DoExtractItemRevManaged(Value, Item);
end;

procedure TListHelper.InternalExtractItemMRef(const Value; Kind: TTypeKind; out Item; Direction: Byte);
begin
  case Kind of
    TTypeKind.tkUString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdString(Value, Item)
      else
        DoExtractItemRevString(Value, Item);
    TTypeKind.tkInterface:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdInterface(Value, Item)
      else
        DoExtractItemRevInterface(Value, Item);
    TTypeKind.tkString,
    TTypeKind.tkLString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdByteString(Value, Item)
      else
        DoExtractItemRevByteString(Value, Item);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdWideString(Value, Item)
      else
        DoExtractItemRevWideString(Value, Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdObject(Value, Item)
      else
        DoExtractItemRevObject(Value, Item);
{$ENDIF}
    TTypeKind.tkDynArray:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdManaged(Value, Item)
      else
        DoExtractItemRevManaged(Value, Item);
  end;
end;

procedure TListHelper.InternalExtractItemN(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwdN(Value, Item)
  else
    DoExtractItemRevN(Value, Item);
end;

procedure TListHelper.InternalExtractItemVariant(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwdVariant(Value, Item)
  else
    DoExtractItemRevVariant(Value, Item);
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalExtractItemWeak(const Value; out Item; Direction: Byte);
begin
  if Direction = Byte(TDirection.FromBeginning) then
    DoExtractItemFwdWeak(Value, Item)
  else
    DoExtractItemRevWeak(Value, Item);
end;
{$ENDIF}

procedure TListHelper.SetItemVariant(const Value; AIndex: NativeInt);
var
  OldItem: Variant;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PVariant(FItems)[AIndex] := Variant(Value)
  else
  begin
    OldItem := PVariant(FItems)[AIndex];
    PVariant(FItems)[AIndex] := Variant(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

{$IF Defined(AUTOREFCOUNT)}
procedure TListHelper.DoSetItemObject(const Value; AIndex: NativeInt);
var
  OldItem: TObject;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PObject(FItems)[AIndex] := TObject(Value)
  else
  begin
    OldItem := PObject(FItems)[AIndex];
    PObject(FItems)[AIndex] := TObject(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.DoInsertObject(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  PObject(FItems)[AIndex] := TObject(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoAddObject(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PObject(FItems)[Result] := TObject(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;
{$ENDIF}

procedure TListHelper.DoSetItemByteString(const Value; AIndex: NativeInt);
var
  OldItem: RawByteString;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PRawByteString(FItems)[AIndex] := RawByteString(Value)
  else
  begin
    OldItem := PRawByteString(FItems)[AIndex];
    PRawByteString(FItems)[AIndex] := RawByteString(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.DoInsertByteString(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  PRawByteString(FItems)[AIndex] := RawByteString(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoAddByteString(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PRawByteString(FItems)[Result] := RawByteString(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

{$IF not Defined(NEXTGEN)}
procedure TListHelper.DoSetItemWideString(const Value; AIndex: NativeInt);
var
  OldItem: WideString;
begin
  CheckItemRange(AIndex);

  if not Assigned(FNotify) then
    PWideString(FItems)[AIndex] := WideString(Value)
  else
  begin
    OldItem := PWideString(FItems)[AIndex];
    PWideString(FItems)[AIndex] := WideString(Value);

    FNotify(FListObj, OldItem, cnRemoved);
    FNotify(FListObj, Value, cnAdded);
  end;
end;

procedure TListHelper.DoInsertWideString(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  PWideString(FItems)[AIndex] := WideString(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoAddWideString(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PWideString(FItems)[Result] := WideString(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;
{$ENDIF}

function TListHelper.DoAddDynArray(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  DynArrayAssign(Pointer(PBytes(FItems)[Result]), Pointer(Value), ElType);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoAddInterface(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PInterface(FItems)[Result] := IInterface(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoAddString(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PString(FItems)[Result] := string(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.DoExchangeInterfaceInline(Index1, Index2: NativeInt);
var
  Temp: IInterface;
begin
  Temp := PInterface(FItems)[Index1];
  PInterface(FItems)[Index1] := PInterface(FItems)[Index2];
  PInterface(FItems)[Index2] := Temp;
end;

procedure TListHelper.DoExchangeStringInline(Index1, Index2: NativeInt);
var
  Temp: string;
begin
  Temp := PString(FItems)[Index1];
  PString(FItems)[Index1] := PString(FItems)[Index2];
  PString(FItems)[Index2] := Temp;
end;

procedure TListHelper.DoExchangeVariantInline(Index1, Index2: NativeInt);
var
  Temp: Variant;
begin
  Temp := PVariant(FItems)[Index1];
  PVariant(FItems)[Index1] := PVariant(FItems)[Index2];
  PVariant(FItems)[Index2] := Temp;
end;

procedure TListHelper.DoExchangeDynArrayInline(Index1, Index2: NativeInt);
var
  Temp: TBytes;
begin
  Temp := PBytes(FItems)[Index1];
  PBytes(FItems)[Index1] := PBytes(FItems)[Index2];
  PBytes(FItems)[Index2] := Temp;
end;

procedure TListHelper.DoExchangeByteStringInline(Index1, Index2: NativeInt);
var
  Temp: RawByteString;
begin
  Temp := PRawByteString(FItems)[Index1];
  PRawByteString(FItems)[Index1] := PRawByteString(FItems)[Index2];
  PRawByteString(FItems)[Index2] := Temp;
end;

{$IF not Defined(NEXTGEN)}
procedure TListHelper.DoExchangeWideStringInline(Index1, Index2: NativeInt);
var
  Temp: WideString;
begin
  Temp := PWideString(FItems)[Index1];
  PWideString(FItems)[Index1] := PWideString(FItems)[Index2];
  PWideString(FItems)[Index2] := Temp;
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TListHelper.DoExchangeObjectInline(Index1, Index2: NativeInt);
var
  Temp: TObject;
begin
  Temp := PObject(FItems)[Index1];
  PObject(FItems)[Index1] := PObject(FItems)[Index2];
  PObject(FItems)[Index2] := Temp;
end;
{$ENDIF}

procedure TListHelper.DoExchangeInterface(Index1, Index2: NativeInt);
begin
  DoExchangeInterfaceInline(Index1, Index2);
end;

procedure TListHelper.DoExchangeString(Index1, Index2: NativeInt);
begin
  DoExchangeStringInline(Index1, Index2);
end;

procedure TListHelper.DoExchangeVariant(Index1, Index2: NativeInt);
begin
  DoExchangeVariantInline(Index1, Index2);
end;

procedure TListHelper.DoExchangeDynArray(Index1, Index2: NativeInt);
begin
  DoExchangeDynArrayInline(Index1, Index2);
end;

procedure TListHelper.DoExchangeByteString(Index1, Index2: NativeInt);
begin
  DoExchangeByteStringInline(Index1, Index2);
end;

{$IF not Defined(NEXTGEN)}
procedure TListHelper.DoExchangeWideString(Index1, Index2: NativeInt);
begin
  DoExchangeWideStringInline(Index1, Index2);
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TListHelper.DoExchangeObject(Index1, Index2: NativeInt);
begin
  DoExchangeObjectInline(Index1, Index2);
end;
{$ENDIF}

procedure TListHelper.DoExtractItemFwd1(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwd1(Value);
  if Index < 0 then
    Byte(Item) := 0
  else
  begin
    Byte(Item) := PByte(FItems)[Index];
    InternalDoDelete1(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRev1(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRev1(Value);
  if Index < 0 then
    Byte(Item) := 0
  else
  begin
    Byte(Item) := PByte(FItems)[Index];
    InternalDoDelete1(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwd2(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwd2(Value);
  if Index < 0 then
    Word(Item) := 0
  else
  begin
    Word(Item) := PWord(FItems)[Index];
    InternalDoDelete2(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRev2(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRev2(Value);
  if Index < 0 then
    Word(Item) := 0
  else
  begin
    Word(Item) := PWord(FItems)[Index];
    InternalDoDelete2(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwd4(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwd4(Value);
  if Index < 0 then
    Cardinal(Item) := 0
  else
  begin
    Cardinal(Item) := PCardinal(FItems)[Index];
    InternalDoDelete4(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRev4(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRev4(Value);
  if Index < 0 then
    Cardinal(Item) := 0
  else
  begin
    Cardinal(Item) := PCardinal(FItems)[Index];
    InternalDoDelete4(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwd8(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwd8(Value);
  if Index < 0 then
    UInt64(Item) := 0
  else
  begin
    UInt64(Item) := PUInt64(FItems)[Index];
    InternalDoDelete8(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRev8(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRev8(Value);
  if Index < 0 then
    UInt64(Item) := 0
  else
  begin
    UInt64(Item) := PUInt64(FItems)[Index];
    InternalDoDelete8(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwdN(const Value; out Item);
var
  Index: NativeInt;
  ElemSize: NativeInt;
begin
  Index := DoIndexOfFwdN(Value);
  ElemSize := ElSize;
  if Index < 0 then
    FillChar(Item, ElemSize, 0)
  else
  begin
    Move(PByte(FItems)[Index * ElemSize], Item, ElemSize);
    InternalDoDeleteN(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevN(const Value; out Item);
var
  Index: NativeInt;
  ElemSize: NativeInt;
begin
  Index := DoIndexOfRevN(Value);
  ElemSize := ElSize;
  if Index < 0 then
    FillChar(Item, ElemSize, 0)
  else
  begin
    Move(PByte(FItems)[Index * ElemSize], Item, ElemSize);
    InternalDoDeleteN(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwdInterface(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdMRef(Value);
  if Index < 0 then
    IInterface(Item) := nil
  else
  begin
    IInterface(Item) := PInterface(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevInterface(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevMRef(Value);
  if Index < 0 then
    IInterface(Item) := nil
  else
  begin
    IInterface(Item) := PInterface(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwdManaged(const Value; out Item);
var
  Index: NativeInt;
begin
  InitializeArray(@Item, ElType, 1);
  Index := DoIndexOfFwdN(Value);
  if Index >= 0 then
  begin
    System.CopyArray(@Item, PByte(FItems) + (Index * ElSize), ElType, 1);
    InternalDoDeleteManaged(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevManaged(const Value; out Item);
var
  Index: NativeInt;
begin
  InitializeArray(@Item, ElType, 1);
  Index := DoIndexOfRevN(Value);
  if Index < 0 then
    FinalizeArray(@Item, ElType, 1)
  else
  begin
    System.CopyArray(@Item, PByte(FItems) + (Index * ElSize), ElType, 1);
    InternalDoDeleteManaged(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwdString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdString(Value);
  if Index < 0 then
    string(Item) := ''
  else
  begin
    string(Item) := PString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevString(Value);
  if Index < 0 then
    string(Item) := ''
  else
  begin
    string(Item) := PString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemFwdVariant(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdN(Value);
  if Index < 0 then
    VarClear(Variant(Item))
  else
  begin
    Variant(Item) := PVariant(FItems)[Index];
    InternalDoDeleteManaged(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevVariant(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevN(Value);
  if Index < 0 then
    VarClear(Variant(Item))
  else
  begin
    Variant(Item) := PVariant(FItems)[Index];
    InternalDoDeleteManaged(Index, cnExtracted);
  end;
end;

{$IF Defined(AUTOREFCOUNT)}
procedure TListHelper.DoExtractItemFwdObject(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdMRef(Value);
  if Index < 0 then
    TObject(Item) := nil
  else
  begin
    TObject(Item) := PObject(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevObject(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevMRef(Value);
  if Index < 0 then
    TObject(Item) := nil
  else
  begin
    TObject(Item) := PObject(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;
{$ENDIF}

procedure TListHelper.DoExtractItemFwdByteString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdMRef(Value);
  if Index < 0 then
    RawByteString(Item) := ''
  else
  begin
    RawByteString(Item) := PRawByteString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevByteString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevMRef(Value);
  if Index < 0 then
    RawByteString(Item) := ''
  else
  begin
    RawByteString(Item) := PRawByteString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

{$IF not Defined(NEXTGEN)}
procedure TListHelper.DoExtractItemFwdWideString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdMRef(Value);
  if Index < 0 then
    WideString(Item) := ''
  else
  begin
    WideString(Item) := PWideString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevWideString(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevMRef(Value);
  if Index < 0 then
    WideString(Item) := ''
  else
  begin
    WideString(Item) := PWideString(FItems)[Index];
    InternalDoDeleteMRef(Index, cnExtracted);
  end;
end;
{$ENDIF}

{$IF Defined(WEAKREF)}
procedure TListHelper.DoExtractItemFwdWeak(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfFwdN(Value);
  if Index < 0 then
    FinalizeArray(@Item, ElType, 1)
  else
  begin
    System.CopyArray(@Item, PByte(FItems) + (Index * ElSize), ElType, 1);
    InternalDoDeleteWeak(Index, cnExtracted);
  end;
end;

procedure TListHelper.DoExtractItemRevWeak(const Value; out Item);
var
  Index: NativeInt;
begin
  Index := DoIndexOfRevN(Value);
  if Index < 0 then
    FinalizeArray(@Item, ElType, 1)
  else
  begin
    System.CopyArray(@Item, PByte(FItems) + (Index * ElSize), ElType, 1);
    InternalDoDeleteWeak(Index, cnExtracted);
  end;
end;
{$ENDIF}

function TListHelper.DoIndexOfFwd1UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Byte;
begin
  v := Byte(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<Byte>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd1(const Value): NativeInt;
var
  items: Pointer;
  v: Byte;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwd1UsingComparer(Value));
  v := Byte(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<Byte>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd2UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Word;
begin
  v := Word(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<Word>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd2(const Value): NativeInt;
var
  items: Pointer;
  v: Word;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwd2UsingComparer(Value));
  v := Word(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<Word>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd4UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Cardinal;
begin
  v := Cardinal(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<Cardinal>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd4(const Value): NativeInt;
var
  items: Pointer;
  v: Cardinal;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwd4UsingComparer(Value));
  v := Cardinal(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<Cardinal>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd8UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: UInt64;
begin
  v := UInt64(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<UInt64>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwd8(const Value): NativeInt;
var
  items: Pointer;
  v: UInt64;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwd8UsingComparer(Value));
  v := UInt64(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<UInt64>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwdMRefUsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Pointer;
begin
  v := Pointer(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<Pointer>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwdMRef(const Value): NativeInt;
var
  items: Pointer;
  v: Pointer;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwdMRefUsingComparer(Value));
  v := Pointer(Value);
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<Pointer>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwdStringUsingComparer(const Value): NativeInt;
var
  items: Pointer;
begin
  items := FItems;
  for Result := 0 to FCount - 1 do
    if FCompare(FListObj, TArray<UnicodeString>(items)[Result], UnicodeString(Value)) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwdString(const Value): NativeInt;
var
  items: Pointer;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfFwdStringUsingComparer(Value));
  items := FItems;
  for Result := 0 to FCount - 1 do
    if TArray<UnicodeString>(items)[Result] = UnicodeString(Value) then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfFwdN(const Value): NativeInt;
var
  I: NativeInt;
begin
  for I := 0 to FCount - 1 do
    if FCompare(FListObj, PByte(FItems)[I * ElSize], Byte(Value)) = 0 then
      Exit(I);
  Result := -1;
end;

function TListHelper.DoIndexOfRev1UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Byte;
begin
  v := Byte(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<Byte>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev1(const Value): NativeInt;
var
  items: Pointer;
  v: Byte;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRev1UsingComparer(Value));
  v := Byte(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<Byte>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev2UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Word;
begin
  v := Word(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<Word>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev2(const Value): NativeInt;
var
  items: Pointer;
  v: Word;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRev2UsingComparer(Value));
  v := Word(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<Word>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev4UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Cardinal;
begin
  v := Cardinal(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<Cardinal>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev4(const Value): NativeInt;
var
  items: Pointer;
  v: Cardinal;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRev4UsingComparer(Value));
  v := Cardinal(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<Cardinal>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev8UsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: UInt64;
begin
  v := UInt64(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<UInt64>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRev8(const Value): NativeInt;
var
  items: Pointer;
  v: UInt64;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRev8UsingComparer(Value));
  v := UInt64(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<UInt64>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRevMRefUsingComparer(const Value): NativeInt;
var
  items: Pointer;
  v: Pointer;
begin
  v := Pointer(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<Pointer>(items)[Result], v) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRevMRef(const Value): NativeInt;
var
  items: Pointer;
  v: Pointer;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRevMRefUsingComparer(Value));
  v := Pointer(Value);
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<Pointer>(items)[Result] = v then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRevStringUsingComparer(const Value): NativeInt;
var
  items: Pointer;
begin
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if FCompare(FListObj, TArray<UnicodeString>(items)[Result], UnicodeString(Value)) = 0 then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRevString(const Value): NativeInt;
var
  items: Pointer;
begin
  if Assigned(FCompare) then
    Exit(DoIndexOfRevStringUsingComparer(Value));
  items := FItems;
  for Result := FCount - 1 downto 0 do
    if TArray<UnicodeString>(items)[Result] = UnicodeString(Value) then
      Exit;
  Result := -1;
end;

function TListHelper.DoIndexOfRevN(const Value): NativeInt;
var
  I: NativeInt;
begin
  for I := FCount - 1 downto 0 do
    if FCompare(FListObj, PByte(FItems)[I * ElSize], Byte(Value)) = 0 then
      Exit(I);
  Result := -1;
end;

procedure TListHelper.DoInsertDynArray(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  DynArrayAssign(Pointer(PBytes(FItems)[AIndex]), Pointer(Value), ElType);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.DoInsertInterface(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  PInterface(FItems)[AIndex] := IInterface(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.DoInsertString(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PPointer(FItems)[AIndex], PPointer(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Pointer));
  PPointer(FItems)[AIndex] := nil;
  PString(FItems)[AIndex] := string(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.DoRemoveFwd1(const Value): NativeInt;
begin
  Result := DoIndexOfFwd1(Value);
  if Result >= 0 then
    InternalDoDelete1(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwd2(const Value): NativeInt;
begin
  Result := DoIndexOfFwd2(Value);
  if Result >= 0 then
    InternalDoDelete2(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwd4(const Value): NativeInt;
begin
  Result := DoIndexOfFwd4(Value);
  if Result >= 0 then
    InternalDoDelete4(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwd8(const Value): NativeInt;
begin
  Result := DoIndexOfFwd8(Value);
  if Result >= 0 then
    InternalDoDelete8(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwdMRef(const Value): NativeInt;
begin
  Result := DoIndexOfFwdMRef(Value);
  if Result >= 0 then
    InternalDoDeleteMRef(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwdString(const Value): NativeInt;
begin
  Result := DoIndexOfFwdString(Value);
  if Result >= 0 then
    InternalDoDeleteMRef(Result, cnRemoved);
end;

function TListHelper.DoRemoveFwdManaged(const Value): NativeInt;
begin
  Result := DoIndexOfFwdN(Value);
  if Result >= 0 then
    InternalDoDeleteManaged(Result, cnRemoved);
end;

{$IF Defined(WEAKREF)}
function TListHelper.DoRemoveFwdWeak(const Value): NativeInt;
begin
  Result := DoIndexOfFwdN(Value);
  if Result >= 0 then
    InternalDoDeleteWeak(Result, cnRemoved);
end;
{$ENDIF}

function TListHelper.DoRemoveFwdN(const Value): NativeInt;
begin
  Result := DoIndexOfFwdN(Value);
  if Result >= 0 then
    InternalDoDeleteN(Result, cnRemoved);
end;

function TListHelper.DoRemoveRev1(const Value): NativeInt;
begin
  Result := DoIndexOfRev1(Value);
  if Result >= 0 then
    InternalDoDelete1(Result, cnRemoved);
end;

function TListHelper.DoRemoveRev2(const Value): NativeInt;
begin
  Result := DoIndexOfRev2(Value);
  if Result >= 0 then
    InternalDoDelete2(Result, cnRemoved);
end;

function TListHelper.DoRemoveRev4(const Value): NativeInt;
begin
  Result := DoIndexOfRev4(Value);
  if Result >= 0 then
    InternalDoDelete4(Result, cnRemoved);
end;

function TListHelper.DoRemoveRev8(const Value): NativeInt;
begin
  Result := DoIndexOfRev8(Value);
  if Result >= 0 then
    InternalDoDelete8(Result, cnRemoved);
end;

function TListHelper.DoRemoveRevMRef(const Value): NativeInt;
begin
  Result := DoIndexOfRevMRef(Value);
  if Result >= 0 then
    InternalDoDeleteMRef(Result, cnRemoved);
end;

function TListHelper.DoRemoveRevString(const Value): NativeInt;
begin
  Result := DoIndexOfRevString(Value);
  if Result >= 0 then
    InternalDoDeleteMRef(Result, cnRemoved);
end;

function TListHelper.DoRemoveRevManaged(const Value): NativeInt;
begin
  Result := DoIndexOfRevN(Value);
  if Result >= 0 then
    InternalDoDeleteManaged(Result, cnRemoved);
end;

{$IF Defined(WEAKREF)}
function TListHelper.DoRemoveRevWeak(const Value): NativeInt;
begin
  Result := DoIndexOfRevN(Value);
  if Result >= 0 then
    InternalDoDeleteWeak(Result, cnRemoved);
end;
{$ENDIF}

function TListHelper.DoRemoveRevN(const Value): NativeInt;
begin
  Result := DoIndexOfRevN(Value);
  if Result >= 0 then
    InternalDoDeleteN(Result, cnRemoved);
end;

procedure TListHelper.DoReverseMRef(Kind: TTypeKind);
var
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    case Kind of
      TTypeKind.tkUString: DoExchangeStringInline(b, e);
      TTypeKind.tkInterface: DoExchangeInterfaceInline(b, e);
      TTypeKind.tkDynArray: DoExchangeDynArrayInline(b, e);
      TTypeKind.tkVariant: DoExchangeVariantInline(b, e);
      TTypeKind.tkLString: DoExchangeByteStringInline(b, e);
{$IF not Defined(NEXTGEN)}
      TTypeKind.tkWString: DoExchangeWideStringInline(b, e);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
      TTypeKind.tkClass: DoExchangeObjectInline(b, e);
{$ENDIF}
    end;
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.DoReverseString;
begin
  DoReverseMRef(TTypeKind.tkUString);
end;

procedure TListHelper.DoReverseVariant;
begin
  DoReverseMRef(TTypeKind.tkVariant);
end;

procedure TListHelper.DoReverseDynArray;
begin
  DoReverseMRef(TTypeKind.tkDynArray);
end;

procedure TListHelper.DoReverseInterface;
begin
  DoReverseMRef(TTypeKind.tkInterface);
end;

procedure TListHelper.DoReverseByteString;
begin
  DoReverseMRef(TTypeKind.tkLString);
end;

{$IF not Defined(NEXTGEN)}
procedure TListHelper.DoReverseWideString;
begin
  DoReverseMRef(TTypeKind.tkWString);
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TListHelper.DoReverseObject;
begin
  DoReverseMRef(TTypeKind.tkClass);
end;
{$ENDIF}

function TListHelper.InternalAdd1(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PByte(FItems)[Result] := Byte(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.InternalAdd2(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PWord(FItems)[Result] := Word(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.InternalAdd4(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PCardinal(FItems)[Result] := Cardinal(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.InternalAdd8(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PUInt64(FItems)[Result] := UInt64(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.InternalAddManaged(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  System.CopyArray(PByte(FItems) + (Result * ElSize), @Value, ElType, 1);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

function TListHelper.InternalAddMRef(const Value; TypeKind: TTypeKind): NativeInt;
begin
  if IsConstValue(TypeKind) then
  begin
    case TypeKind of
      TTypeKind.tkUString: Result := DoAddString(Value);
      TTypeKind.tkDynArray: Result := DoAddDynArray(Value);
{$IF Defined(AUTOREFCOUNT)}
      TTypeKind.tkClass: Result := DoAddObject(Value);
{$ENDIF}
      TTypeKind.tkLString: Result := DoAddByteString(Value);
{$IF not Defined(NEXTGEN)}
      TTypeKind.tkWString: Result := DoAddWideString(Value);
{$ENDIF}
    else
      { TTypeKind.tkInterface: } Result := DoAddInterface(Value);
    end;
  end else
  begin
    Result := -1;
    if Result = -1 then Error(rePlatformNotImplemented);
  end;
end;

procedure TListHelper.SetItemMRef(const Value; AIndex: NativeInt; TypeKind: TTypeKind);
begin
  if IsConstValue(TypeKind) then
  begin
    case TypeKind of
      TTypeKind.tkUString: DoSetItemString(Value, AIndex);
      TTypeKind.tkDynArray: DoSetItemDynArray(Value, AIndex);
      TTypeKind.tkInterface: DoSetItemInterface(Value, AIndex);
{$IF Defined(AUTOREFCOUNT)}
      TTypeKind.tkClass: DoSetItemObject(Value, AIndex);
{$ENDIF}
      TTypeKind.tkLString: DoSetItemByteString(Value, AIndex);
{$IF not Defined(NEXTGEN)}
      TTypeKind.tkWString: DoSetItemWideString(Value, AIndex);
{$ENDIF}
    end;
  end else
    Error(rePlatformNotImplemented);
end;

function TListHelper.InternalAddVariant(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  PVariant(FItems)[Result] := Variant(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalClear1;
begin
  InternalSetCount1(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClear2;
begin
  InternalSetCount2(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClear4;
begin
  InternalSetCount4(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClear8;
begin
  InternalSetCount8(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClearManaged;
begin
  InternalSetCountManaged(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClearMRef;
begin
  InternalSetCountMRef(0);
  InternalSetCapacity(0);
end;

procedure TListHelper.InternalClearN;
begin
  InternalSetCountN(0);
  InternalSetCapacity(0);
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalClearWeak;
begin
  InternalSetCountWeak(0);
  InternalSetCapacity(0);
end;
{$ENDIF}

function TListHelper.InternalAddN(const Value): NativeInt;
begin
  Result := FCount;
  if Result = DynArraySize(FItems) then
    InternalGrow(Result + 1);
  Move(Value, PByte(FItems)[Result * ElSize], ElSize);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalDeleteRange1(AIndex, ACount: NativeInt);
var
  SArray: array[0..1023] of Byte;
  DArray: array of Byte;
  PElem: PByte;
  tailCount, Size: NativeInt;
  I: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    Size := ACount * SizeOf(Byte);
    PElem := nil;
    if Assigned(FNotify) then
    begin
      if ACount > Length(SArray) then
      begin
        SetLength(DArray, ACount);
        PElem := @DArray[0];
      end else
        PElem := @SArray[0];
      Move(PByte(FItems)[AIndex], PElem[0], Size);
    end;

    tailCount := FCount - (AIndex + ACount);
    if tailCount > 0 then
    begin
      Move(PByte(FItems)[AIndex + ACount], PByte(FItems)[AIndex], tailCount * SizeOf(Byte));
      Inc(AIndex, tailCount);
    end;
    FillChar(PByte(FItems)[AIndex], Size, 0);

    Dec(FCount, ACount);

    if Assigned(FNotify) then
      for I := 0 to ACount - 1 do
        FNotify(FListObj, PElem[I], cnRemoved);
  end;
end;

procedure TListHelper.InternalDeleteRange2(AIndex, ACount: NativeInt);
var
  SArray: array[0..511] of Word;
  DArray: array of Word;
  PElem: PWord;
  tailCount, Size: NativeInt;
  I: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    Size := ACount * SizeOf(Word);
    PElem := nil;
    if Assigned(FNotify) then
    begin
      if ACount > Length(SArray) then
      begin
        SetLength(DArray, ACount);
        PElem := @DArray[0];
      end else
        PElem := @SArray[0];
      Move(PWord(FItems)[AIndex], PElem[0], Size);
    end;

    tailCount := FCount - (AIndex + ACount);
    if tailCount > 0 then
    begin
      Move(PWord(FItems)[AIndex + ACount], PWord(FItems)[AIndex], tailCount * SizeOf(Word));
      Inc(AIndex, tailCount);
    end;
    FillChar(PWord(FItems)[AIndex], Size, 0);

    Dec(FCount, ACount);

    if Assigned(FNotify) then
      for I := 0 to ACount - 1 do
        FNotify(FListObj, PElem[I], cnRemoved);
  end;
end;

procedure TListHelper.InternalDeleteRange4(AIndex, ACount: NativeInt);
var
  SArray: array[0..255] of Cardinal;
  DArray: array of Cardinal;
  PElem: PCardinal;
  tailCount, Size: NativeInt;
  I: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    Size := ACount * SizeOf(Cardinal);
    PElem := nil;
    if Assigned(FNotify) then
    begin
      if ACount > Length(SArray) then
      begin
        SetLength(DArray, ACount);
        PElem := @DArray[0];
      end else
        PElem := @SArray[0];
      Move(PCardinal(FItems)[AIndex], PElem[0], Size);
    end;

    tailCount := (FCount - (AIndex + ACount));
    if tailCount > 0 then
    begin
      Move(PCardinal(FItems)[AIndex + ACount], PCardinal(FItems)[AIndex], tailCount * SizeOf(Cardinal));
      Inc(AIndex, tailCount);
    end;
    FillChar(PCardinal(FItems)[AIndex], Size, 0);

    Dec(FCount, ACount);

    if Assigned(FNotify) then
      for I := 0 to ACount - 1 do
        FNotify(FListObj, PElem[I], cnRemoved);
  end;
end;

procedure TListHelper.InternalDeleteRange8(AIndex, ACount: NativeInt);
var
  SArray: array[0..127] of UInt64;
  DArray: array of UInt64;
  PElem: PUInt64;
  tailCount, Size: NativeInt;
  I: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    Size := ACount * SizeOf(UInt64);
    PElem := nil;
    if Assigned(FNotify) then
    begin
      if ACount > Length(SArray) then
      begin
        SetLength(DArray, ACount);
        PElem := @DArray[0];
      end else
        PElem := @SArray[0];
      Move(PUInt64(FItems)[AIndex], PElem[0], Size);
    end;

    tailCount := FCount - (AIndex + ACount);
    if tailCount > 0 then
    begin
      Move(PUInt64(FItems)[AIndex + ACount], PUInt64(FItems)[AIndex], tailCount * SizeOf(UInt64));
      Inc(AIndex, tailCount);
    end;
    FillChar(PUInt64(FItems)[AIndex], Size, 0);

    Dec(FCount, ACount);

    if Assigned(FNotify) then
      for I := 0 to ACount - 1 do
        FNotify(FListObj, PElem[I], cnRemoved);
  end;
end;

procedure TListHelper.InternalDeleteRangeManaged(AIndex, ACount: NativeInt);
var
  SArray: array[0..1023] of Byte;
  DArray: Pointer;
  PElem: PByte;
  tailCount, Size: NativeInt;
  I: NativeInt;
  ElemSize: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    ElemSize := ElSize;
    DArray := nil; // initialize the local dynarray
    PElem := @SArray[0];
    try
      Size := ACount * ElemSize;
      if Assigned(FNotify) then
      begin
        if Size > Length(SArray) then
        begin
          GetMem(DArray, Size);
          PElem := DArray;
        end;
        Move(PByte(FItems)[AIndex * ElemSize], PElem[0], Size);
      end
      else
        FinalizeArray(PByte(FItems) + AIndex * ElemSize, ElType, ACount);

      tailCount := (FCount - (AIndex + ACount)) * ElemSize;
      if tailCount > 0 then
      begin
        Move(PByte(FItems)[(AIndex + ACount) * ElemSize], PByte(FItems)[AIndex * ElemSize], tailCount);
        FillChar(PByte(FItems)[(FCount - ACount) * ElemSize], Size, 0);
        InitializeArray(PByte(FItems) + (FCount - ACount) * ElemSize, ElType, ACount);
      end
      else
      begin
        FillChar(PByte(FItems)[AIndex * ElemSize], Size, 0);
        InitializeArray(PByte(FItems) + AIndex * ElemSize, ElType, ACount);
      end;

      Dec(FCount, ACount);

      if Assigned(FNotify) then
        for I := 0 to ACount - 1 do
          FNotify(FListObj, PElem[I * ElemSize], cnRemoved);
    finally
      if Assigned(FNotify) then
        if DArray <> nil then
        begin
          FinalizeArray(DArray, ElType, ACount);
          FreeMem(DArray);
        end else
          FinalizeArray(PElem, ElType, ACount);
    end;
  end;
end;

procedure TListHelper.InternalDeleteRangeMRef(AIndex, ACount: NativeInt);
var
  SArray: array[0..(1024 div SizeOf(Pointer)) - 1] of NativeInt;
  DArray: Pointer;
  PElem: PPointer;
  tailCount, Size: NativeInt;
  I: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    DArray := nil;
    PElem := @SArray[0];
    try
      Size := ACount;
      if Assigned(FNotify) then
      begin
        if Size > Length(SArray) then
        begin
          DynArraySetLength(DArray, FTypeInfo, 1, @Size);
          PElem := DArray;
        end;
        Move(PPointer(FItems)[AIndex], PElem[0], ACount * SizeOf(Pointer));
      end
      else
        FinalizeArray(@PPointer(FItems)[AIndex], ElType, Size);

      tailCount := FCount - (AIndex + ACount);
      if tailCount > 0 then
      begin
        Move(PPointer(FItems)[AIndex + ACount], PPointer(FItems)[AIndex], tailCount * SizeOf(Pointer));
        FillChar(PPointer(FItems)[FCount - ACount], ACount * SizeOf(Pointer), 0);
      end else
        FillChar(PPointer(FItems)[AIndex], ACount * SizeOf(Pointer), 0);

      Dec(FCount, ACount);

      if Assigned(FNotify) then
        for I := 0 to ACount - 1 do
          FNotify(FListObj, PElem[I], cnRemoved);
    finally
      if Assigned(FNotify) then
        if DArray = nil then
          FinalizeArray(PElem, ElType, Size)
        else
          DynArrayClear(DArray, FTypeInfo);
    end;
  end;
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalDeleteRangeWeak(AIndex, ACount: NativeInt);
var
  SArray: TLocalDynArray;
  DArray: Pointer;
  PElem: PByte;
  tailCount, Size: NativeInt;
  I: NativeInt;
  ElemSize: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    ElemSize := ElSize;
    DArray := nil; // initialize the local dynarray
    PElem := @SArray.Data[0];
    try
      Size := ACount;
      if Assigned(FNotify) then
      begin
        if (Size * ElemSize) > Length(SArray.Data) then
        begin
          DynArraySetLength(DArray, FTypeInfo, 1, @Size);
          PElem := DArray;
        end else
        begin
          FillChar(SArray, SizeOf(SArray), 0);
          SArray.RefCnt := -1;
          SArray.Length := ACount;
        end;
        System.CopyArray(PElem, PByte(FItems) + (AIndex * ElemSize), ElType, ACount);
      end;

      tailCount := FCount - (AIndex + ACount);
      if tailCount > 0 then
      begin
        System.CopyArray(PByte(FItems) + (AIndex * ElemSize), PByte(FItems) + ((AIndex + ACount) * ElemSize), ElType, tailCount);
        FinalizeArray(PByte(FItems) + ((FCount - ACount) * ElemSize), ElType, ACount);
      end else
        FinalizeArray(PByte(FItems) + (AIndex * ElemSize), ElType, ACount);

      Dec(FCount, ACount);

      if Assigned(FNotify) then
        for I := 0 to ACount - 1 do
          FNotify(FListObj, PElem[I * ElemSize], cnRemoved);
    finally
      if Assigned(FNotify) then
        if DArray = nil then
          FinalizeArray(PElem, ElType, ACount)
        else
          DynArrayClear(DArray, FTypeInfo);
    end;
  end;
end;
{$ENDIF}

procedure TListHelper.InternalDeleteRangeN(AIndex, ACount: NativeInt);
var
  SArray: array[0..1023] of Byte;
  DArray: Pointer;
  PElem: PByte;
  tailCount, Size: NativeInt;
  I: NativeInt;
  ElemSize: NativeInt;
begin
  if CheckDeleteRange(AIndex, ACount) then
  begin
    ElemSize := ElSize;
    PElem := nil;
    DArray := nil; // initialize the local dynarray
    try
      Size := ACount * ElemSize;
      if Assigned(FNotify) then
      begin
        if Size > Length(SArray) then
        begin
          GetMem(DArray, Size);
          PElem := DArray;
        end else
          PElem := @SArray[0];
        Move(PByte(FItems)[AIndex * ElemSize], PElem[0], Size);
      end;

      tailCount := FCount - (AIndex + ACount);
      if tailCount > 0 then
      begin
        Move(PByte(FItems)[(AIndex + ACount) * ElemSize], PByte(FItems)[AIndex * ElemSize], tailCount * ElemSize);
        Inc(AIndex, tailCount);
      end;
      FillChar(PByte(FItems)[AIndex * ElemSize], Size, 0);

      Dec(FCount, ACount);

      if Assigned(FNotify) then
        for I := 0 to ACount - 1 do
          FNotify(FListObj, PElem[I * ElemSize], cnRemoved);
    finally
      if Assigned(FNotify) then
        FreeMem(DArray);
    end;
  end;
end;

procedure TListHelper.InternalDoDelete1(AIndex: NativeInt; Action: TCollectionNotification);
var
  oldItem: Byte;
begin
  CheckItemRange(AIndex);
  oldItem := PByte(FItems)[AIndex];
  Dec(FCount);
  if AIndex <> FCount then
    Move(PByte(FItems)[AIndex + 1], PByte(FItems)[AIndex], FCount - AIndex);
  PByte(FItems)[FCount] := 0;
  if Assigned(FNotify) then
    FNotify(FListObj, oldItem, Action);
end;

procedure TListHelper.InternalDoDelete2(AIndex: NativeInt; Action: TCollectionNotification);
var
  oldItem: Word;
begin
  CheckItemRange(AIndex);
  oldItem := PWord(FItems)[AIndex];
  Dec(FCount);
  if AIndex <> FCount then
    Move(PWord(FItems)[AIndex + 1], PWord(FItems)[AIndex], (FCount - AIndex) * SizeOf(Word));
  PWord(FItems)[FCount] := 0;
  if Assigned(FNotify) then
    FNotify(FListObj, oldItem, Action);
end;

procedure TListHelper.InternalDoDelete4(AIndex: NativeInt; Action: TCollectionNotification);
var
  oldItem: Cardinal;
begin
  CheckItemRange(AIndex);
  oldItem := PCardinal(FItems)[AIndex];
  Dec(FCount);
  if AIndex <> FCount then
    Move(PCardinal(FItems)[AIndex + 1], PCardinal(FItems)[AIndex], (FCount - AIndex) * SizeOf(Cardinal));
  PCardinal(FItems)[FCount] := 0;
  if Assigned(FNotify) then
    FNotify(FListObj, oldItem, Action);
end;

procedure TListHelper.InternalDoDelete8(AIndex: NativeInt; Action: TCollectionNotification);
var
  oldItem: UInt64;
begin
  CheckItemRange(AIndex);
  oldItem := PUInt64(FItems)[AIndex];
  Dec(FCount);
  if AIndex <> FCount then
    Move(PUInt64(FItems)[AIndex + 1], PUInt64(FItems)[AIndex], (FCount - AIndex) * SizeOf(UInt64));
  PUInt64(FItems)[FCount] := 0;
  if Assigned(FNotify) then
    FNotify(FListObj, oldItem, Action);
end;

procedure TListHelper.InternalDoDeleteManaged(AIndex: NativeInt; Action: TCollectionNotification);
var
  SOldItem: array[0..63] of Byte;
  DOldItem: PByte;
  OldItemP: PByte;
  ElemSize: NativeInt;
begin
  CheckItemRange(AIndex);
  ElemSize := ElSize;
  DOldItem := nil;
  OldItemP := @SOldItem[0];
  try
    if Assigned(FNotify) then
    begin
      if ElemSize > SizeOf(SOldItem) then
      begin
        GetMem(DOldItem, ElemSize);
        OldItemP := DOldItem;
      end;
      Move(PByte(FItems)[AIndex * ElemSize], OldItemP^, ElemSize);
    end
    else
      FinalizeArray(PByte(FItems) + AIndex * ElemSize, ElType, 1);
    Dec(FCount);
    if AIndex <> FCount then
      Move(PByte(FItems)[(AIndex + 1) * ElemSize], PByte(FItems)[AIndex * ElemSize], (FCount - AIndex) * ElemSize);
    FillChar(PByte(FItems)[FCount * ElemSize], ElemSize, 0);
    InitializeArray(PByte(FItems) + FCount * ElemSize, ElType, 1);
    if Assigned(FNotify) then
      FNotify(FListObj, OldItemP^, Action);
  finally
    if Assigned(FNotify) then
    begin
      FinalizeArray(OldItemP, ElType, 1);
      FreeMem(DOldItem);
    end;
  end;
end;

procedure TListHelper.InternalDoDeleteMRef(AIndex: NativeInt; Action: TCollectionNotification);
var
  oldItem: Pointer;
begin
  CheckItemRange(AIndex);
  oldItem := PPointer(FItems)[AIndex];
  try
    Dec(FCount);
    if AIndex <> FCount then
      Move(PPointer(FItems)[AIndex + 1], PPointer(FItems)[AIndex], (FCount - AIndex) * SizeOf(Pointer));
    PPointer(FItems)[FCount] := nil;
    if Assigned(FNotify) then
      FNotify(FListObj, oldItem, Action);
  finally
    FinalizeArray(@oldItem, ElType, 1);
  end;
end;

procedure TListHelper.InternalDoDeleteN(AIndex: NativeInt; Action: TCollectionNotification);
var
  SOldItem: array[0..63] of Byte;
  DOldItem: PByte;
  OldItemP: PByte;
  ElemSize: NativeInt;
begin
  CheckItemRange(AIndex);
  DOldItem := nil;
  OldItemP := @SOldItem[0];
  try
    ElemSize := ElSize;
    if Assigned(FNotify) then
    begin
      if ElemSize > SizeOf(SOldItem) then
      begin
        GetMem(DOldItem, ElemSize);
        OldItemP := DOldItem;
      end;
      Move(PByte(FItems)[AIndex * ElemSize], OldItemP^, ElemSize);
    end;
    Dec(FCount);
    if AIndex <> FCount then
      Move(PByte(FItems)[(AIndex + 1) * ElemSize], PByte(FItems)[AIndex * ElemSize], (FCount - AIndex) * ElemSize);
    FillChar(PByte(FItems)[FCount * ElemSize], ElemSize, 0);
    if Assigned(FNotify) then
      FNotify(FListObj, OldItemP^, Action);
  finally
    if Assigned(FNotify) then
      FreeMem(DOldItem);
  end;
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalDoDeleteWeak(AIndex: NativeInt; Action: TCollectionNotification);
var
  SOldItem: TLocalDynArray;
  DOldItem: Pointer;
  OldItemP: PByte;
  ElemSize, Size: NativeInt;
begin
  CheckItemRange(AIndex);
  ElemSize := ElSize;
  DOldItem := nil;
  OldItemP := @SOldItem.Data[0];
  Size := 1;
  try
    if Assigned(FNotify) then
    begin
      if ElemSize > Length(SOldItem.Data) then
      begin
        DynArraySetLength(DOldItem, FTypeInfo, 1, @Size);
        OldItemP := DOldItem;
      end else
      begin
        FillChar(SOldItem, SizeOf(SOldItem), 0);
        SOldItem.RefCnt := -1;
        SOldItem.Length := 1;
      end;
      System.CopyArray(OldItemP, PByte(FItems) + AIndex * ElemSize, ElType, 1);
    end;
    Dec(FCount);
    if AIndex <> FCount then
      System.CopyArray(PByte(FItems) + AIndex * ElemSize, PByte(FItems) + (AIndex + 1) * ElemSize, ElType, FCount - AIndex);
    FinalizeArray(PByte(FItems) + FCount * ElemSize, ElType, 1);
    if Assigned(FNotify) then
      FNotify(FListObj, OldItemP^, Action);
  finally
    if Assigned(FNotify) then
      if DOldItem = nil then
        FinalizeArray(OldItemP, ElType, 1)
      else
        DynArrayClear(DOldItem, FTypeInfo);
  end;
end;
{$ENDIF}

function TListHelper.InternalIndexOf1(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwd1(Value)
  else
    Result := DoIndexOfRev1(Value);
end;

function TListHelper.InternalIndexOf2(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwd2(Value)
  else
    Result := DoIndexOfRev2(Value);
end;

function TListHelper.InternalIndexOf4(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwd4(Value)
  else
    Result := DoIndexOfRev4(Value);
end;

function TListHelper.InternalIndexOf8(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwd8(Value)
  else
    Result := DoIndexOfRev8(Value);
end;

function TListHelper.InternalIndexOfMRef(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwdMRef(Value)
  else
    Result := DoIndexOfRevMRef(Value);
end;

function TListHelper.InternalIndexOfString(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwdString(Value)
  else
    Result := DoIndexOfRevString(Value);
end;

function TListHelper.InternalIndexOfN(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(System.Types.TDirection.FromBeginning) then
    Result := DoIndexOfFwdN(Value)
  else
    Result := DoIndexOfRevN(Value);
end;

procedure TListHelper.InternalInsert1(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PByte(FItems)[AIndex], PByte(FItems)[AIndex + 1], FCount - AIndex);
  PByte(FItems)[AIndex] := Byte(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsert2(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PWord(FItems)[AIndex], PWord(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Word));
  PWord(FItems)[AIndex] := Word(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsert4(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PCardinal(FItems)[AIndex], PCardinal(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Cardinal));
  PCardinal(FItems)[AIndex] := Cardinal(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsert8(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
    Move(PUInt64(FItems)[AIndex], PUInt64(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(UInt64));
  PUInt64(FItems)[AIndex] := UInt64(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsertManaged(AIndex: NativeInt; const Value);
var
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  ElemSize := ElSize;
  if AIndex <> FCount then
  begin
    Move(PByte(FItems)[AIndex * ElemSize], PByte(FItems)[(AIndex + 1) * ElemSize], (FCount - AIndex) * ElemSize);
    FillChar(PByte(FItems)[AIndex * ElemSize], ElemSize, 0);
    InitializeArray(PByte(FItems) + AIndex * ElemSize, ElType, 1);
  end;
  System.CopyArray(@PByte(FItems)[AIndex * ElemSize], @Value, ElType, 1);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsertMRef(AIndex: NativeInt; const Value; TypeKind: TTypeKind);
begin
  if IsConstValue(TypeKind) then
  begin
    case TypeKind of
      TTypeKind.tkUString: DoInsertString(AIndex, Value);
      TTypeKind.tkDynArray: DoInsertDynArray(AIndex, Value);
      TTypeKind.tkInterface: DoInsertInterface(AIndex, Value);
{$IF Defined(AUTOREFCOUNT)}
      TTypeKind.tkClass: DoInsertObject(AIndex, Value);
{$ENDIF}
      TTypeKind.tkLString: DoInsertByteString(AIndex, Value);
{$IF not Defined(NEXTGEN)}
      TTypeKind.tkWString: DoInsertWideString(AIndex, Value);
{$ENDIF}
    end;
  end else
    Error(rePlatformNotImplemented);
end;

procedure TListHelper.InternalInsertN(AIndex: NativeInt; const Value);
var
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  ElemSize := ElSize;
  if AIndex <> FCount then
    Move(PByte(FItems)[AIndex * ElemSize], PByte(FItems)[(AIndex + 1) * ElemSize], (FCount - AIndex) * ElemSize);
  Move(Value, PByte(FItems)[AIndex * ElemSize], ElemSize);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalInsertWeak(AIndex: NativeInt; const Value);
var
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  ElemSize := ElSize;
  if AIndex <> FCount then
    CopyArray(PByte(FItems) + (AIndex + 1) * ElemSize, PByte(FItems) + AIndex * ElemSize, ElType, ElemSize, FCount - AIndex);
  System.CopyArray(PByte(FItems) + AIndex * ElemSize, @Value, ElType, 1);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;
{$ENDIF}

procedure TListHelper.InternalInsertVariant(AIndex: NativeInt; const Value);
begin
  CheckInsertRange(AIndex);

  if FCount = DynArraySize(FItems) then
    InternalGrow(FCount + 1);
  if AIndex <> FCount then
  begin
    Move(PVariant(FItems)[AIndex], PVariant(FItems)[AIndex + 1], (FCount - AIndex) * SizeOf(Variant));
    FillChar(PVariant(FItems)[AIndex], SizeOf(Variant), 0);
  end;
  PVariant(FItems)[AIndex] := Variant(Value);
  Inc(FCount);
  if Assigned(FNotify) then
    FNotify(FListObj, Value, cnAdded);
end;

procedure TListHelper.InternalInsertRange1(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  if AIndex <> FCount then
    Move(PByte(FItems)[AIndex], PByte(FItems)[AIndex + ACount], FCount - AIndex);

  Move(PByte(Values)[0], PByte(FItems)[AIndex], ACount);

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PByte(Values)[I], cnAdded);
end;

procedure TListHelper.InternalInsertRange2(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  if AIndex <> FCount then
    Move(PWord(FItems)[AIndex], PWord(FItems)[AIndex + ACount], (FCount - AIndex) * SizeOf(Word));

  Move(PWord(Values)[0], PWord(FItems)[AIndex], ACount * SizeOf(Word));

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PWord(Values)[I], cnAdded);
end;

procedure TListHelper.InternalInsertRange4(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  if AIndex <> FCount then
    Move(PCardinal(FItems)[AIndex], PCardinal(FItems)[AIndex + ACount], (FCount - AIndex) * SizeOf(Cardinal));

  Move(PCardinal(Values)[0], PCardinal(FItems)[AIndex], ACount * SizeOf(Cardinal));

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PCardinal(Values)[I], cnAdded);
end;

procedure TListHelper.InternalInsertRange8(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  if AIndex <> FCount then
    Move(PUInt64(FItems)[AIndex], PUInt64(FItems)[AIndex + ACount], (FCount - AIndex) * SizeOf(UInt64));

  Move(PUInt64(Values)[0], PUInt64(FItems)[AIndex], ACount * SizeOf(UInt64));

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PUInt64(Values)[I], cnAdded);
end;

procedure TListHelper.InternalInsertRangeManaged(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  ElemSize := ElSize;
  if AIndex <> FCount then
  begin
    Move(PByte(FItems)[AIndex * ElemSize], PByte(FItems)[(AIndex + ACount) * ElemSize], ElemSize * (FCount - AIndex));
    FillChar(PByte(FItems)[AIndex * ElemSize], ACount * ElemSize, 0);
    InitializeArray(PByte(FItems) + AIndex * ElemSize, ElType, ACount);
  end;

  CopyArray(@PByte(FItems)[AIndex * ElemSize], @PByte(Values)[0], ElType, ElemSize, ACount);

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PByte(Values)[I * ElemSize], cnAdded);
end;

procedure TListHelper.InternalInsertRangeN(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  ElemSize := ElSize;
  if AIndex <> FCount then
    Move(PByte(FItems)[AIndex * ElemSize], PByte(FItems)[(AIndex + ACount) * ElemSize], (FCount - AIndex) * ElemSize);

  Move(PByte(Values)[0], PByte(FItems)[AIndex * ElemSize], ACount * ElemSize);

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PByte(Values)[I * ElemSize], cnAdded);
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalInsertRangeWeak(AIndex: NativeInt; Values: Pointer; ACount: NativeInt);
var
  I: NativeInt;
  ElemSize: NativeInt;
begin
  CheckInsertRange(AIndex);

  InternalGrowCheck(FCount + ACount);
  ElemSize := ElSize;
  if AIndex <> FCount then
    CopyArray(@PByte(FItems)[(AIndex + ACount) * ElemSize], @PByte(FItems)[AIndex * ElemSize], ElType, ElemSize, FCount - AIndex);

  CopyArray(@PByte(FItems)[AIndex * ElemSize], @PByte(Values)[0], ElType, ElemSize, ACount);

  Inc(FCount, ACount);

  if Assigned(FNotify) then
    for I := 0 to ACount - 1 do
      FNotify(FListObj, PByte(Values)[I * ElemSize], cnAdded);
end;
{$ENDIF}

procedure TListHelper.InternalMove1(CurIndex, NewIndex: NativeInt);
var
  Temp: Byte;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    Temp := PByte(FItems)[CurIndex];
    if CurIndex < NewIndex then
      Move(PByte(FItems)[CurIndex + 1], PByte(FItems)[CurIndex], NewIndex - CurIndex)
    else
      Move(PByte(FItems)[NewIndex], PByte(FItems)[NewIndex + 1], CurIndex - NewIndex);

    PByte(FItems)[NewIndex] := Temp;
  end;
end;

procedure TListHelper.InternalMove2(CurIndex, NewIndex: NativeInt);
var
  Temp: Word;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    Temp := PWord(FItems)[CurIndex];
    if CurIndex < NewIndex then
      Move(PWord(FItems)[CurIndex + 1], PWord(FItems)[CurIndex], (NewIndex - CurIndex) * SizeOf(Word))
    else
      Move(PWord(FItems)[NewIndex], PWord(FItems)[NewIndex + 1], (CurIndex - NewIndex) * SizeOf(Word));

    PWord(FItems)[NewIndex] := Temp;
  end;
end;

procedure TListHelper.InternalMove4(CurIndex, NewIndex: NativeInt);
var
  Temp: Cardinal;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    Temp := PCardinal(FItems)[CurIndex];
    if CurIndex < NewIndex then
      Move(PCardinal(FItems)[CurIndex + 1], PCardinal(FItems)[CurIndex], (NewIndex - CurIndex) * SizeOf(Cardinal))
    else
      Move(PCardinal(FItems)[NewIndex], PCardinal(FItems)[NewIndex + 1], (CurIndex - NewIndex) * SizeOf(Cardinal));

    PCardinal(FItems)[NewIndex] := Temp;
  end;
end;

procedure TListHelper.InternalMove8(CurIndex, NewIndex: NativeInt);
var
  Temp: UInt64;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    Temp := PUInt64(FItems)[CurIndex];
    if CurIndex < NewIndex then
      Move(PUInt64(FItems)[CurIndex + 1], PUInt64(FItems)[CurIndex], (NewIndex - CurIndex) * SizeOf(UInt64))
    else
      Move(PUInt64(FItems)[NewIndex], PUInt64(FItems)[NewIndex + 1], (CurIndex - NewIndex) * SizeOf(UInt64));

    PUInt64(FItems)[NewIndex] := Temp;
  end;
end;

procedure TListHelper.InternalMoveManaged(CurIndex, NewIndex: NativeInt);
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
  ElemSize: NativeInt;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    DTemp := nil;
    PTemp := @STemp;
    try
      ElemSize := ElSize;
      if ElemSize > SizeOf(STemp) then
      begin
        DTemp := AllocMem(ElemSize);
        PTemp := DTemp;
      end else
        FillChar(STemp, SizeOf(STemp), 0);
      InitializeArray(PTemp, ElType, 1);
      try
        System.CopyArray(PTemp, @PByte(FItems)[CurIndex * ElemSize], ElType, 1);
        if CurIndex < NewIndex then
          CopyArray(@PByte(FItems)[CurIndex * ElemSize], @PByte(FItems)[(CurIndex + 1) * ElemSize], ElType, ElemSize, NewIndex - CurIndex)
        else
          CopyArray(@PByte(FItems)[(NewIndex + 1) * ElemSize], @PByte(FItems)[NewIndex * ElemSize], ElType, ElemSize, CurIndex - NewIndex);
        FinalizeArray(@PByte(FItems)[NewIndex * ElemSize], ElType, 1);
        System.CopyArray(@PByte(FItems)[NewIndex * ElemSize], @PTemp[0], ElType, 1);
      finally
        FinalizeArray(PTemp, ElType, 1);
      end;
    finally
      FreeMem(DTemp);
    end;
  end;
end;

procedure TListHelper.InternalMoveMRef(CurIndex, NewIndex: NativeInt);
var
  Temp: Pointer;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    Temp := nil;
    AtomicExchange(Temp, PPointer(FItems)[CurIndex]); // this sequence "transfers" the current reference to Temp
    PPointer(FItems)[CurIndex] := nil;
    if CurIndex < NewIndex then
      Move(PPointer(FItems)[CurIndex + 1], PPointer(FItems)[CurIndex], (NewIndex - CurIndex) * SizeOf(Pointer))
    else
      Move(PPointer(FItems)[NewIndex], PPointer(FItems)[NewIndex + 1], (CurIndex - NewIndex) * SizeOf(Pointer));

    AtomicExchange(PPointer(FItems)[NewIndex], Temp); // "transfer" the reference to the new location
  end;
end;

procedure TListHelper.InternalMoveN(CurIndex, NewIndex: NativeInt);
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
  ElemSize: NativeInt;
begin
  if CurIndex <> NewIndex then
  begin
    CheckItemRange(CurIndex);
    CheckItemRange(NewIndex);

    DTemp := nil;
    PTemp := @STemp;
    try
      ElemSize := ElSize;
      if ElemSize > SizeOf(STemp) then
      begin
        GetMem(DTemp, ElemSize);
        PTemp := DTemp;
      end;
      Move(PByte(FItems)[CurIndex * ElemSize], PTemp[0], ElemSize);
      if CurIndex < NewIndex then
        Move(PByte(FItems)[(CurIndex + 1) * ElemSize], PByte(FItems)[CurIndex * ElemSize], (NewIndex - CurIndex) * ElemSize)
      else
        Move(PByte(FItems)[NewIndex * ElemSize], PByte(FItems)[(NewIndex + 1) * ElemSize], (CurIndex - NewIndex) * ElemSize);

      Move(PTemp[0], PByte(FItems)[NewIndex * ElemSize], ElemSize);
    finally
      FreeMem(DTemp);
    end;
  end;
end;

procedure TListHelper.InternalPackInline(const IsEmpty: TInternalEmptyFunc);
var
  PackedCount: NativeInt;
  StartIndex: NativeInt;
  EndIndex: NativeInt;
  ElemSize: NativeInt;
begin
  if FCount = 0 then
    Exit;

  ElemSize := ElSize;
  PackedCount := 0;
  StartIndex := 0;
  repeat
    // Locate the first/next non-nil element in the list
//    while (StartIndex < FCount) and (FComparer.Compare(FItems[StartIndex], Default(T)) = 0) do
    while (StartIndex < FCount) and IsEmpty(PByte(FItems)[StartIndex * ElemSize]) do
      Inc(StartIndex);

    if StartIndex < FCount then // There is nothing more to do
    begin
      // Locate the next nil pointer
      EndIndex := StartIndex;
//      while (EndIndex < FCount) and (FComparer.Compare(FItems[EndIndex], Default(T)) <> 0) do
      while (EndIndex < FCount) and not IsEmpty(PByte(FItems)[EndIndex * ElemSize]) do
        Inc(EndIndex);
      Dec(EndIndex);

      // Move this block of non-null items to the index recorded in PackedToCount:
      // If this is a contiguous non-nil block at the start of the list then
      // StartIndex and PackedToCount will be equal (and 0) so don't bother with the move.
      if StartIndex > PackedCount then
        Move(PByte(FItems)[StartIndex * ElemSize], PByte(FItems)[PackedCount * ELemSize], (EndIndex - StartIndex + 1) * ElemSize);

      // Set the PackedToCount to reflect the number of items in the list
      // that have now been packed.
      Inc(PackedCount, EndIndex - StartIndex + 1);

      // Reset StartIndex to the element following EndIndex
      StartIndex := EndIndex + 1;
    end;
  until StartIndex >= FCount;

  // Set Count so that the 'free' item
  if FCount > PackedCount then
  begin
    FillChar(PByte(FItems)[PackedCount * ElemSize], (FCount - PackedCount) * ElemSize, 0);
    FCount := PackedCount;
  end;
end;

procedure TListHelper.InternalPack1(const IsEmpty: TInternalEmptyFunc);
begin
  InternalPackInline(IsEmpty);
end;

procedure TListHelper.InternalPack2(const IsEmpty: TInternalEmptyFunc);
begin
  InternalPackInline(IsEmpty);
end;

procedure TListHelper.InternalPack4(const IsEmpty: TInternalEmptyFunc);
begin
  InternalPackInline(IsEmpty);
end;

procedure TListHelper.InternalPack8(const IsEmpty: TInternalEmptyFunc);
begin
  InternalPackInline(IsEmpty);
end;

procedure TListHelper.InternalPackManaged(const IsEmpty: TInternalEmptyFunc);
var
  PackedCount : NativeInt;
  StartIndex : NativeInt;
  EndIndex : NativeInt;
  ElemSize: NativeInt;
begin
  if FCount = 0 then
    Exit;

  ElemSize := ElSize;
  PackedCount := 0;
  StartIndex := 0;
  repeat
    // Locate the first/next non-nil element in the list
//    while (StartIndex < FCount) and (FComparer.Compare(FItems[StartIndex], Default(T)) = 0) do
    while (StartIndex < FCount) and IsEmpty(PByte(FItems)[StartIndex * ElemSize]) do
      Inc(StartIndex);

    if StartIndex < FCount then // There is nothing more to do
    begin
      // Locate the next nil pointer
      EndIndex := StartIndex;
//      while (EndIndex < FCount) and (FComparer.Compare(FItems[EndIndex], Default(T)) <> 0) do
      while (EndIndex < FCount) and not IsEmpty(PByte(FItems)[EndIndex * ElemSize]) do
        Inc(EndIndex);
      Dec(EndIndex);

      // Move this block of non-null items to the index recorded in PackedToCount:
      // If this is a contiguous non-nil block at the start of the list then
      // StartIndex and PackedToCount will be equal (and 0) so don't bother with the move.
      if StartIndex > PackedCount then
        System.CopyArray(@PByte(FItems)[PackedCount * ELemSize], @PByte(FItems)[StartIndex * ElemSize], ElType, EndIndex - StartIndex + 1);

      // Set the PackedToCount to reflect the number of items in the list
      // that have now been packed.
      Inc(PackedCount, EndIndex - StartIndex + 1);

      // Reset StartIndex to the element following EndIndex
      StartIndex := EndIndex + 1;
    end;
  until StartIndex >= FCount;

  // Set Count so that the 'free' item
  if FCount > PackedCount then
  begin
    FinalizeArray(@PByte(FItems)[PackedCount * ElemSize], ElType, FCount - PackedCount);
    InitializeArray(@PByte(FItems)[PackedCount * ElemSize], ElType, FCount - PackedCount);
    FCount := PackedCount;
  end;
end;

procedure TListHelper.InternalPackN(const IsEmpty: TInternalEmptyFunc);
begin
  InternalPackInline(IsEmpty);
end;

function TListHelper.InternalRemove1(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwd1(Value)
  else
    Result := DoRemoveRev1(Value);
end;

function TListHelper.InternalRemove2(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwd2(Value)
  else
    Result := DoRemoveRev2(Value);
end;

function TListHelper.InternalRemove4(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwd4(Value)
  else
    Result := DoRemoveRev4(Value);
end;

function TListHelper.InternalRemove8(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwd8(Value)
  else
    Result := DoRemoveRev8(Value);
end;

function TListHelper.InternalRemoveMRef(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwdMRef(Value)
  else
    Result := DoRemoveRevMRef(Value);
end;

function TListHelper.InternalRemoveString(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwdString(Value)
  else
    Result := DoRemoveRevString(Value);
end;

function TListHelper.InternalRemoveManaged(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwdManaged(Value)
  else
    Result := DoRemoveRevManaged(Value);
end;

{$IF Defined(WEAKREF)}
function TListHelper.InternalRemoveWeak(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwdWeak(Value)
  else
    Result := DoRemoveRevWeak(Value);
end;
{$ENDIF}

function TListHelper.InternalRemoveN(const Value; Direction: Byte): NativeInt;
begin
  if Direction = Byte(TDirection.FromBeginning) then
    Result := DoRemoveFwdN(Value)
  else
    Result := DoRemoveRevN(Value);
end;

procedure TListHelper.InternalReverse1;
var
  tmp: Byte;
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    tmp := PByte(FItems)[b];
    PByte(FItems)[b] := PByte(FItems)[e];
    PByte(FItems)[e] := tmp;
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalReverse2;
var
  tmp: Word;
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    tmp := PWord(FItems)[b];
    PWord(FItems)[b] := PWord(FItems)[e];
    PWord(FItems)[e] := tmp;
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalReverse4;
var
  tmp: Cardinal;
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    tmp := PCardinal(FItems)[b];
    PCardinal(FItems)[b] := PCardinal(FItems)[e];
    PCardinal(FItems)[e] := tmp;
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalReverse8;
var
  tmp: UInt64;
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    tmp := PUInt64(FItems)[b];
    PUInt64(FItems)[b] := PUInt64(FItems)[e];
    PUInt64(FItems)[e] := tmp;
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalReverseManaged;
var
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    InternalExchangeManaged(b, e);
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalReverseMRef(Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: DoReverseString;
    TTypeKind.tkInterface: DoReverseInterface;
    TTypeKind.tkVariant: DoReverseVariant;
    TTypeKind.tkDynArray: DoReverseDynArray;
    TTypeKind.tkLString: DoReverseByteString;
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: DoReverseWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: DoReverseObject;
{$ENDIF}
  end;
end;

procedure TListHelper.InternalReverseN;
var
  b, e: NativeInt;
begin
  b := 0;
  e := FCount - 1;
  while b < e do
  begin
    InternalExchangeN(b, e);
    Inc(b);
    Dec(e);
  end;
end;

procedure TListHelper.InternalSetCapacity(Value: NativeInt);
begin
  DynArraySetLength(FItems, FTypeInfo, 1, @Value);
end;

procedure TListHelper.InternalSetCount1(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRange1(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalSetCount2(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRange2(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalSetCount4(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRange4(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalSetCount8(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRange8(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalSetCountManaged(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRangeManaged(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalSetCountMRef(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRangeMRef(Value, FCount - Value);
  FCount := Value;
end;

{$IF Defined(WEAKREF)}
procedure TListHelper.InternalSetCountWeak(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRangeWeak(Value, FCount - Value);
  FCount := Value;
end;
{$ENDIF}

procedure TListHelper.InternalSetCountN(Value: NativeInt);
begin
  if Value < 0 then
    ErrorArgumentOutOfRange;
  if Value > DynArraySize(FItems) then
    InternalSetCapacity(Value);
  if Value < FCount then
    InternalDeleteRangeN(Value, FCount - Value);
  FCount := Value;
end;

procedure TListHelper.InternalToArray(var Dest: Pointer);
var
  LSize: NativeInt;
begin
  LSize := FCount;
  DynArraySetLength(Dest, FTypeInfo, 1, @LSize);
  Move(PByte(FItems)[0], PByte(Dest)[0], LSize * ElSize);
end;

procedure TListHelper.InternalToArrayManaged(var Dest: Pointer);
var
  LSize: NativeInt;
begin
  LSize := FCount;
  DynArraySetLength(Dest, FTypeInfo, 1, @LSize);
  System.CopyArray(Dest, @PByte(FItems)[0], ElType, LSize);
end;

{$POINTERMATH OFF}

{ TEnumerator<T> }

function TEnumerator<T>.MoveNext: Boolean;
begin
  Result := DoMoveNext;
end;

// The overridden destructor that simply invokes 'inherited' is
// required to instantiate the destructor for C++ code
destructor TEnumerable<T>.Destroy;
begin
  inherited;
end;

function TEnumerable<T>.GetEnumerator: TEnumerator<T>;
begin
  Result := DoGetEnumerator;
end;

function TEnumerable<T>.ToArray: TArray<T>;
var
  I, Capacity: NativeInt;
  Value: T;
begin
  Result := nil;
  Capacity := 0;
  I := 0;
  for Value in Self do
  begin
    if I >= Capacity then
    begin
      Capacity := GrowCollection(Capacity, I + 1);
      SetLength(Result, Capacity);
    end;
    Result[I] := Value;
    Inc(I);
  end;
  SetLength(Result, I);
end;

function TEnumerable<T>.ToArrayImpl(Count: NativeInt): TArray<T>;
var
  I: NativeInt;
  Value: T;
begin
  // We assume our caller has passed correct Count
  SetLength(Result, Count);
  I := 0;
  for Value in Self do
  begin
    Result[I] := Value;
    Inc(I);
  end;
end;

{ TList<T> }

function TList<T>.FListHelper: PListHelper;
begin
  Result := PListHelper(@FItems);
end;

procedure TList<T>.SetCount(Value: NativeInt);
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalSetCountWeak(Value)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalSetCountMRef(Value)
    else
      FListHelper.InternalSetCountManaged(Value);
  end else
  case SizeOf(T) of
    1: FListHelper.InternalSetCount1(Value);
    2: FListHelper.InternalSetCount2(Value);
    4: FListHelper.InternalSetCount4(Value);
    8: FListHelper.InternalSetCount8(Value);
  else
    FListHelper.InternalSetCountN(Value)
  end;
end;

function TList<T>.GetList: arrayofT;
begin
  Result := arrayofT(FItems);
end;

function TList<T>.GetPList: ParrayofT;
begin
  Result := ParrayofT(@FItems);
end;

function TList<T>.GetCapacity: NativeInt;
begin
  Result := Length(List);
end;

procedure TList<T>.SetCapacity(Value: NativeInt);
begin
  if Value < Count then
    Count := Value;
  FListHelper.InternalSetCapacity(Value);
end;

function TList<T>.GetIsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

procedure TList<T>.CheckItemRange(AIndex: NativeInt);
begin
  if NativeUInt(AIndex) >= NativeUInt(FCount) then
    ErrorArgumentOutOfRange(AIndex, FCount - 1, Self);
end;

function TList<T>.GetItem(Index: NativeInt): T;
begin
  CheckItemRange(Index);
  Result := List[Index];
end;

procedure TList<T>.SetItem(Index: NativeInt; const Value: T);
begin
  if IsManagedType(T) then
  begin
    if (SizeOf(T) = SizeOf(Pointer)) and not System.HasWeakRef(T) and
       not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.SetItemMRef(Value, Index, GetTypeKind(T))
    else if GetTypeKind(T) = TTypeKind.tkVariant then
      FListHelper.SetItemVariant(Value, Index)
    else
      FListHelper.SetItemManaged(Value, Index);
  end else
  case SizeOf(T) of
    1: FListHelper.SetItem1(Value, Index);
    2: FListHelper.SetItem2(Value, Index);
    4: FListHelper.SetItem4(Value, Index);
    8: FListHelper.SetItem8(Value, Index);
  else
    FListHelper.SetItemN(Value, Index);
  end;
end;

procedure TList<T>.GrowCheck(ACount: NativeInt);
begin
  FListHelper.InternalGrowCheck(ACount);
end;

procedure TList<T>.Notify(const Item: T; Action: TCollectionNotification);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Item, Action);
end;

procedure TList<T>.Pack;
var
  IsEmpty: TListHelper.TInternalEmptyFunc;
begin
  IsEmpty := function (const Item): Boolean
    begin
      Result := FComparer.Compare(T(Item), Default(T)) = 0;
    end;
  if IsManagedType(T) then
    FListHelper.InternalPackManaged(IsEmpty)
  else
  case SizeOf(T) of
    1: FListHelper.InternalPack1(IsEmpty);
    2: FListHelper.InternalPack2(IsEmpty);
    4: FListHelper.InternalPack4(IsEmpty);
    8: FListHelper.InternalPack8(IsEmpty);
  else
    FListHelper.InternalPackN(IsEmpty);
  end;
end;

procedure TList<T>.Pack(const IsEmpty: TEmptyFunc);
var
  LIsEmpty: TListHelper.TInternalEmptyFunc;
begin
  LIsEmpty := function (const Item): Boolean
    begin
      Result := IsEmpty(T(Item), Default(T));
    end;
  if IsManagedType(T) then
    FListHelper.InternalPackManaged(LIsEmpty)
  else
  case SizeOf(T) of
    1: FListHelper.InternalPack1(LIsEmpty);
    2: FListHelper.InternalPack2(LIsEmpty);
    4: FListHelper.InternalPack4(LIsEmpty);
    8: FListHelper.InternalPack8(LIsEmpty);
  else
    FListHelper.InternalPackN(LIsEmpty);
  end;
end;

constructor TList<T>.Create(const AComparer: IComparer<T>);
begin
  inherited Create;
  FTypeInfo := TypeInfo(arrayOfT);
  FListObj := Self;
  UpdateNotify;
  UpdateComparer(AComparer);
end;

constructor TList<T>.Create;
begin
  Create(IComparer<T>(nil));
end;

constructor TList<T>.Create(const Collection: TEnumerable<T>);
begin
  Create;
  InsertRange(0, Collection);
end;

constructor TList<T>.Create(const Collection: IEnumerable<T>);
begin
  Create;
  InsertRange(0, Collection);
end;

constructor TList<T>.Create(const Values: array of T);
begin
  Create;
  AddRange(Values);
end;

destructor TList<T>.Destroy;
begin
  Capacity := 0;
  inherited Destroy;
end;

class procedure TList<T>.Error(const Msg: string; Data: NativeInt);
begin
  raise EListError.CreateFmt(Msg, [Data]) at ReturnAddress;
end;

{$IFNDEF NEXTGEN}
class procedure TList<T>.Error(Msg: PResStringRec; Data: NativeInt);
begin
  raise EListError.CreateFmt(LoadResString(Msg), [Data]) at ReturnAddress;
end;
{$ENDIF  NEXTGEN}

function TList<T>.DoGetEnumerator: TEnumerator<T>;
begin
  Result := TEnumerator.Create(Self);
end;

function TList<T>.Add(const Value: T): NativeInt;
begin
  if IsManagedType(T) then
  begin
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      Result := FListHelper.InternalAddMRef(Value, GetTypeKind(T))
    else if GetTypeKind(T) = TTypeKind.tkVariant then
      Result := FListHelper.InternalAddVariant(Value)
    else
      Result := FListHelper.InternalAddManaged(Value);
  end else
  case SizeOf(T) of
    1: Result := FListHelper.InternalAdd1(Value);
    2: Result := FListHelper.InternalAdd2(Value);
    4: Result := FListHelper.InternalAdd4(Value);
    8: Result := FListHelper.InternalAdd8(Value);
  else
    Result := FListHelper.InternalAddN(Value);
  end;
end;

procedure TList<T>.AddRange(const Values: array of T);
begin
  InsertRange(Count, Values);
end;

procedure TList<T>.AddRange(const Collection: IEnumerable<T>);
begin
  InsertRange(Count, Collection);
end;

procedure TList<T>.AddRange(const Collection: TEnumerable<T>);
begin
  InsertRange(Count, Collection);
end;

function TList<T>.BinarySearch(const Item: T; out FoundIndex: NativeInt): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, FComparer, 0, Count);
end;

function TList<T>.BinarySearch(const Item: T; out FoundIndex: NativeInt;
  const AComparer: IComparer<T>): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, AComparer, 0, Count);
end;

function TList<T>.BinarySearch(const Item: T; out FoundIndex: NativeInt;
  const AComparer: IComparer<T>; Index, Count: NativeInt): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, AComparer, Index, Count);
end;

{$IF Defined(CPU64BITS)}
function TList<T>.BinarySearch(const Item: T; out FoundIndex: Integer): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, FComparer, 0, Count);
end;

function TList<T>.BinarySearch(const Item: T; out FoundIndex: Integer;
  const AComparer: IComparer<T>): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, AComparer, 0, Count);
end;

function TList<T>.BinarySearch(const Item: T; out FoundIndex: Integer;
  const AComparer: IComparer<T>; Index, Count: Integer): Boolean;
begin
  Result := TArray.BinarySearch<T>(List, Item, FoundIndex, AComparer, Index, Count);
end;
{$ENDIF CPU64BITS}

procedure TList<T>.Insert(Index: NativeInt; const Value: T);
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalInsertWeak(Index, Value)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalInsertMRef(Index, Value, GetTypeKind(T))
    else if GetTypeKind(T) = TTypeKind.tkVariant then
      FListHelper.InternalInsertVariant(Index, Value)
    else
      FListHelper.InternalInsertManaged(Index, Value);
  end else
  case SizeOf(T) of
    1: FListHelper.InternalInsert1(Index, Value);
    2: FListHelper.InternalInsert2(Index, Value);
    4: FListHelper.InternalInsert4(Index, Value);
    8: FListHelper.InternalInsert8(Index, Value);
  else
    FListHelper.InternalInsertN(Index, Value);
  end;
end;

procedure TList<T>.InsertRange(Index: NativeInt; const Values: array of T; Count: NativeInt);
begin
  if IsManagedType(T) then
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalInsertRangeWeak(Index, @Values, Count)
    else
{$ENDIF}
    FListHelper.InternalInsertRangeManaged(Index, @Values, Count)
  else
  case SizeOf(T) of
    1: FListHelper.InternalInsertRange1(Index, @Values, Count);
    2: FListHelper.InternalInsertRange2(Index, @Values, Count);
    4: FListHelper.InternalInsertRange4(Index, @Values, Count);
    8: FListHelper.InternalInsertRange8(Index, @Values, Count);
  else
    FListHelper.InternalInsertRangeN(Index, @Values, Count);
  end;
end;

procedure TList<T>.InsertRange(Index: NativeInt; const Values: array of T);
begin
  InsertRange(Index, Values, Length(Values));
end;

procedure TList<T>.InsertRange(Index: NativeInt; const Collection: IEnumerable<T>);
var
  Item: T;
begin
  for Item in Collection do
  begin
    Insert(Index, Item);
    Inc(Index);
  end;
end;

procedure TList<T>.InsertRange(Index: NativeInt; const Collection: TEnumerable<T>);
var
  Item: T;
  LList: TList<T>;
begin
  if Collection is TList<T> then
  begin
    LList := TList<T>(Collection);
    InsertRange(Index, LList.List, LList.Count);
  end
  else
    for Item in Collection do
    begin
      Insert(Index, Item);
      Inc(Index);
    end;
end;

function TList<T>.InternalCompare(const Left, Right): Integer;
begin
  Result := FComparer.Compare(T(Left), T(Right));
end;

procedure TList<T>.UpdateComparer(const AComparer: IComparer<T>);
begin
  if AComparer = nil then
    FComparer := IComparer<T>(TComparer<T>._Default)
  else
    FComparer := AComparer;

  if not ((AComparer = nil) and
     // Use comparer for tkFloat, tkString, tkLString, tkWString, tkVariant,
     // tkArray, tkRecord, tkDynArray, tkMRecord
     (GetTypeKind(T) in [TTypeKind.tkUnknown, TTypeKind.tkInteger,
        TTypeKind.tkChar, TTypeKind.tkEnumeration, TTypeKind.tkSet, TTypeKind.tkClass,
        TTypeKind.tkMethod, TTypeKind.tkWChar, TTypeKind.tkInterface, TTypeKind.tkInt64,
        TTypeKind.tkUString, TTypeKind.tkClassRef, TTypeKind.tkPointer, TTypeKind.tkProcedure]) and
     (SizeOf(T) in [1, 2, 4, 8])
{$IF Defined(WEAKREF)}
     and not System.HasWeakRef(T)
{$ENDIF}
     ) then
    FCompare := @TList<T>.InternalCompare
  else
    FCompare := nil;
end;

procedure TList<T>.InternalNotify(const Item; Action: TCollectionNotification);
begin
  Notify(T(Item), Action);
end;

procedure TList<T>.UpdateNotify;
type
  TEvent = procedure (const Item: T; Action: TCollectionNotification) of object;
var
  LAssign: Boolean;
  LEvent: TEvent;
begin
  LAssign := Assigned(OnNotify);
  if not LAssign then
  begin
    LEvent := Notify;
    LAssign := TMethod(LEvent).Code <> @TList<T>.Notify;
  end;
  if LAssign then
    FNotify := @TList<T>.InternalNotify
  else
    FNotify := nil;
end;

procedure TList<T>.SetOnNotify(const Value: TCollectionNotifyEvent<T>);
begin
  FOnNotify := Value;
  UpdateNotify;
end;

function TList<T>.ItemValue(const Item: T): NativeInt;
begin
  case SizeOf(T) of
    1: Result := PByte(@Item)[0] shl 0;
    2: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8;
    3: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16;
{$IF SizeOf(Pointer) <= 4}
    else
       Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24;
{$ELSE}
    4: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24;
    5: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32;
    6: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40;
    7: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40 + NativeInt(PByte(@Item)[6]) shl 48;
  else
    Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40 + NativeInt(PByte(@Item)[6]) shl 48 +
       NativeInt(PByte(@Item)[7]) shl 56;
{$ENDIF}
  end;
end;

procedure TList<T>.Exchange(Index1, Index2: NativeInt);
begin
  if IsManagedType(T) then
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalExchangeManaged(Index1, Index2)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalExchangeMRef(Index1, Index2, GetTypeKind(T))
    else
      FListHelper.InternalExchangeN(Index1, Index2)
  else
  case SizeOf(T) of
    1: FListHelper.InternalExchange1(Index1, Index2);
    2: FListHelper.InternalExchange2(Index1, Index2);
    4: FListHelper.InternalExchange4(Index1, Index2);
    8: FListHelper.InternalExchange8(Index1, Index2);
  else
    FListHelper.InternalExchangeN(Index1, Index2)
  end;
end;

procedure TList<T>.DoDelete(Index: NativeInt; Notification: TCollectionNotification);
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalDoDeleteWeak(Index, Notification)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalDoDeleteMRef(Index, Notification)
    else
      FListHelper.InternalDoDeleteManaged(Index, Notification);
  end else
  case SizeOf(T) of
    1: FListHelper.InternalDoDelete1(Index, Notification);
    2: FListHelper.InternalDoDelete2(Index, Notification);
    4: FListHelper.InternalDoDelete4(Index, Notification);
    8: FListHelper.InternalDoDelete8(Index, Notification);
  else
    FListHelper.InternalDoDeleteN(Index, Notification);
  end;
end;

procedure TList<T>.Delete(Index: NativeInt);
begin
  DoDelete(Index, cnRemoved);
end;

function TList<T>.ExtractItem(const Value: T; Direction: TDirection): T;
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalExtractItemWeak(Value, Result, Byte(Direction))
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalExtractItemMRef(Value, GetTypeKind(T), Result, Byte(Direction))
    else if GetTypeKind(T) = TTypeKind.tkVariant then
      FListHelper.InternalExtractItemVariant(Value, Result, Byte(Direction))
    else
      FListHelper.InternalExtractItemManaged(Value, Result, Byte(Direction));
  end else
  case SizeOf(T) of
    1: FListHelper.InternalExtractItem1(Value, Result, Byte(Direction));
    2: FListHelper.InternalExtractItem2(Value, Result, Byte(Direction));
    4: FListHelper.InternalExtractItem4(Value, Result, Byte(Direction));
    8: FListHelper.InternalExtractItem8(Value, Result, Byte(Direction));
  else
    FListHelper.InternalExtractItemN(Value, Result, Byte(Direction))
  end;
end;

function TList<T>.Extract(const Value: T): T;
begin
  Result := ExtractItem(Value, TDirection.FromBeginning);
end;

function TList<T>.ExtractAt(Index: NativeInt): T;
begin
  CheckItemRange(Index);
  Result := List[Index];
  DoDelete(Index, cnExtracted);
end;

function TList<T>.First: T;
begin
  CheckItemRange(0);
  Result := List[0];
end;

function TList<T>.RemoveItem(const Value: T; Direction: TDirection): NativeInt;
begin
  if IsManagedType(T) then
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      Result := FListHelper.InternalRemoveWeak(Value, Byte(Direction))
    else
{$ENDIF}
    if GetTypeKind(T) = tkUString then
      Result := FListHelper.InternalRemoveString(Value, Byte(Direction))
    else if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      Result := FListHelper.InternalRemoveMRef(Value, Byte(Direction))
    else
      Result := FListHelper.InternalRemoveManaged(Value, Byte(Direction))
  else
  case SizeOf(T) of
    1: Result := FListHelper.InternalRemove1(Value, Byte(Direction));
    2: Result := FListHelper.InternalRemove2(Value, Byte(Direction));
    4: Result := FListHelper.InternalRemove4(Value, Byte(Direction));
    8: Result := FListHelper.InternalRemove8(Value, Byte(Direction));
  else
    Result := FListHelper.InternalRemoveN(Value, Byte(Direction))
  end;
end;

function TList<T>.Remove(const Value: T): NativeInt;
begin
  Result := RemoveItem(Value, TDirection.FromBeginning);
end;

procedure TList<T>.DeleteRange(AIndex, ACount: NativeInt);
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalDeleteRangeWeak(AIndex, ACount)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalDeleteRangeMRef(AIndex, ACount)
    else
      FListHelper.InternalDeleteRangeManaged(AIndex, ACount);
  end else
  case SizeOf(T) of
    1: FListHelper.InternalDeleteRange1(AIndex, ACount);
    2: FListHelper.InternalDeleteRange2(AIndex, ACount);
    4: FListHelper.InternalDeleteRange4(AIndex, ACount);
    8: FListHelper.InternalDeleteRange8(AIndex, ACount);
  else
    FListHelper.InternalDeleteRangeN(AIndex, ACount);
  end;
end;

procedure TList<T>.Clear;
begin
  if IsManagedType(T) then
  begin
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalClearWeak
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalClearMRef
    else
      FListHelper.InternalClearManaged;
  end else
  case SizeOf(T) of
    1: FListHelper.InternalClear1;
    2: FListHelper.InternalClear2;
    4: FListHelper.InternalClear4;
    8: FListHelper.InternalClear8;
  else
    FListHelper.InternalClearN;
  end;
end;

function TList<T>.Expand: TList<T>;
begin
  if FCount = Length(List) then
    GrowCheck(FCount + 1);
  Result := Self;
end;

function TList<T>.IndexOfItem(const Value: T; Direction: TDirection): NativeInt;
begin
  if IsManagedType(T) then
    if GetTypeKind(T) = tkUString then
      Result := FListHelper.InternalIndexOfString(Value, Byte(Direction))
    else if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      Result := FListHelper.InternalIndexOfMRef(Value, Byte(Direction))
    else
      Result := FListHelper.InternalIndexOfN(Value, Byte(Direction))
  else
  case SizeOf(T) of
    1: Result := FListHelper.InternalIndexOf1(Value, Byte(Direction));
    2: Result := FListHelper.InternalIndexOf2(Value, Byte(Direction));
    4: Result := FListHelper.InternalIndexOf4(Value, Byte(Direction));
    8: Result := FListHelper.InternalIndexOf8(Value, Byte(Direction));
  else
    Result := FListHelper.InternalIndexOfN(Value, Byte(Direction));
  end;
end;

function TList<T>.IndexOf(const Value: T): NativeInt;
begin
  Result := IndexOfItem(Value, TDirection.FromBeginning);
end;

function TList<T>.Contains(const Value: T): Boolean;
begin
  Result := IndexOf(Value) >= 0;
end;

function TList<T>.Last: T;
var
  I: NativeInt;
begin
  I := Count - 1;
  CheckItemRange(I);
  Result := List[I];
end;

function TList<T>.LastIndexOf(const Value: T): NativeInt;
begin
  Result := IndexOfItem(Value, TDirection.FromEnd);
end;

procedure TList<T>.Move(CurIndex, NewIndex: NativeInt);
begin
  if IsManagedType(T) then
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalMoveManaged(CurIndex, NewIndex)
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalMoveMRef(CurIndex, NewIndex)
    else
      FListHelper.InternalMoveN(CurIndex, NewIndex)
  else
  case SizeOf(T) of
    1: FListHelper.InternalMove1(CurIndex, NewIndex);
    2: FListHelper.InternalMove2(CurIndex, NewIndex);
    4: FListHelper.InternalMove4(CurIndex, NewIndex);
    8: FListHelper.InternalMove8(CurIndex, NewIndex);
  else
    FListHelper.InternalMoveN(CurIndex, NewIndex);
  end;
end;

procedure TList<T>.Reverse;
begin
  if IsManagedType(T) then
{$IF Defined(WEAKREF)}
    if System.HasWeakRef(T) then
      FListHelper.InternalReverseManaged
    else
{$ENDIF}
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FListHelper.InternalReverseMRef(GetTypeKind(T))
    else
      FListHelper.InternalReverseN
  else
  case SizeOf(T) of
    1: FListHelper.InternalReverse1;
    2: FListHelper.InternalReverse2;
    4: FListHelper.InternalReverse4;
    8: FListHelper.InternalReverse8;
  else
    FListHelper.InternalReverseN;
  end;
end;

procedure TList<T>.Sort;
begin
  TArray.Sort<T>(List, FComparer, 0, Count);
end;

procedure TList<T>.Sort(const AComparer: IComparer<T>);
begin
  TArray.Sort<T>(List, AComparer, 0, Count);
end;

procedure TList<T>.Sort(const AComparer: IComparer<T>; Index, Count: NativeInt);
begin
  TArray.Sort<T>(List, AComparer, Index, Count);
end;

function TList<T>.ToArray: TArray<T>;
begin
  if IsManagedType(T) then
    FListHelper.InternalToArrayManaged(Pointer(Result))
  else
    FListHelper.InternalToArray(Pointer(Result));
end;

procedure TList<T>.TrimExcess;
begin
  FListHelper.InternalSetCapacity(Count);
end;

{ TList<T>.TEnumerator }

constructor TList<T>.TEnumerator.Create(const AList: TList<T>);
begin
  inherited Create;
  FList := AList;
  FIndex := -1;
end;

function TList<T>.TEnumerator.GetCurrent: T;
begin
  Result := FList.List[FIndex];
end;

function TList<T>.TEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FList.Count - 1;
  if Result then
    Inc(FIndex);
end;

function TList<T>.TEnumerator.DoGetCurrent: T;
begin
  Result := Current;
end;

function TList<T>.TEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

function TList<T>.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(Self);
end;

{$POINTERMATH ON}

{ TQueueHelper }

function TQueueHelper.GetElSize: NativeInt;
begin
  Result := FLH.ElSize;
end;

function TQueueHelper.GetElType: Pointer;
begin
  Result := FLH.ElType;
end;

procedure TQueueHelper.CheckEmpty;
begin
  if FLH.FCount = 0 then
    raise EListError.CreateRes(@SUnbalancedOperation);
end;

procedure TQueueHelper.DequeueAdjust(Notification: TCollectionNotification; const Item);
begin
  FTail := (FTail + 1) mod DynArraySize(FItems);
  Dec(FLH.FCount);
  FLH.FNotify(FLH.FListObj, Item, Notification);
end;

procedure TQueueHelper.DynArraySetLength(Value: NativeInt);
begin
  FLH.InternalSetCapacity(Value);
end;

procedure TQueueHelper.EnqueueAdjust(const Value);
begin
  FHead := (FHead + 1) mod DynArraySize(FItems);
  Inc(FLH.FCount);
  FLH.FNotify(FLH.FListObj, Value, cnAdded);
end;

function TQueueHelper.GetNewCap: NativeInt;
begin
  Result := DynArraySize(FItems) * 2;
  if Result = 0 then
    Result := 4
  else if Result < 0 then
    OutOfMemoryError;
end;

procedure TQueueHelper.InternalSetCapacityInline(Value: NativeInt; ElemSize: NativeInt);
var
  TailCount, Offset: NativeInt;
begin
  Offset := Value - DynArraySize(FItems);
  if Offset = 0 then
    Exit;

  // If head <= tail, then part of the queue wraps around
  // the end of the array; don't introduce a gap in the queue.
  if (FHead < FTail) or ((FHead = FTail) and (FLH.FCount > 0)) then
    TailCount := DynArraySize(FItems) - FTail
  else
    TailCount := 0;

  if Offset > 0 then
    DynArraySetLength(Value);
  if TailCount > 0 then
  begin
    Move(PByte(FItems)[FTail * ElemSize], PByte(FItems)[(FTail + Offset) * ElemSize], TailCount * ElemSize);
    Inc(FTail, Offset);
  end else if FTail > 0 then
  begin
    Move(PByte(FItems)[FTail * ElemSize], PByte(FItems)[0], FLH.FCount * ElemSize);
    Dec(FHead, FTail);
    FTail := 0;
  end;
  if Offset < 0 then
  begin
    DynArraySetLength(Value);
    if Value = 0 then
      FHead := 0
    else
      FHead := FHead mod DynArraySize(FItems);
  end;
end;

procedure TQueueHelper.InternalEnqueueString(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  PString(FItems)[FHead] := string(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueueInterface(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  PInterface(FItems)[FHead] := IInterface(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueueByteString(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  PRawByteString(FItems)[FHead] := RawByteString(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueueDynArray(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  DynArrayAssign(Pointer(TListHelper.PBytes(FItems)[FHead]), Pointer(Value), ElType);
  EnqueueAdjust(Value);
end;

{$IF not Defined(NEXTGEN)}
procedure TQueueHelper.InternalEnqueueWideString(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  PWideString(FItems)[FHead] := WideString(Value);
  EnqueueAdjust(Value);
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TQueueHelper.InternalEnqueueObject(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowMRef;
  PObject(FItems)[FHead] := TObject(Value);
  EnqueueAdjust(Value);
end;
{$ENDIF}

procedure TQueueHelper.InternalEnqueue1(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrow1;
  PByte(FItems)[FHead] := Byte(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueue2(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrow2;
  PWord(FItems)[FHead] := Word(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueue4(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrow4;
  PCardinal(FItems)[FHead] := Cardinal(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueue8(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrow8;
  PUInt64(FItems)[FHead] := UInt64(Value);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueueManaged(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowManaged;
  System.CopyArray(@PByte(FItems)[FHead * ElSize], @Value, ElType, 1);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalEnqueueMRef(const Value; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalEnqueueString(Value);
    TTypeKind.tkDynArray: InternalEnqueueDynArray(Value);
    TTypeKind.tkInterface: InternalEnqueueInterface(Value);
    TTypeKind.tkLString: InternalEnqueueByteString(Value);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalEnqueueWideString(Value);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalEnqueueObject(Value);
{$ENDIF}
  end;
end;

procedure TQueueHelper.InternalEnqueueN(const Value);
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrowN;
  Move(Value, PByte(FItems)[FHead * ElSize], ElSize);
  EnqueueAdjust(Value);
end;

procedure TQueueHelper.InternalDequeueString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  string(Item) := PString(FItems)[FTail];
  if not Peek then
  begin
    PString(FItems)[FTail] := '';
    DequeueAdjust(Notification, Item);
  end;
end;

procedure TQueueHelper.InternalDequeueInterface(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  IInterface(Item) := PInterface(FItems)[FTail];
  if not Peek then
  begin
    PInterface(FItems)[FTail] := nil;
    DequeueAdjust(Notification, Item);
  end;
end;

procedure TQueueHelper.InternalDequeueByteString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  RawByteString(Item) := PRawByteString(FItems)[FTail];
  if not Peek then
  begin
    PRawByteString(FItems)[FTail] := '';
    DequeueAdjust(Notification, Item);
  end;
end;

procedure TQueueHelper.InternalDequeueDynArray(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  TBytes(Item) := TListHelper.PBytes(FItems)[FTail];
  if not Peek then
  begin
    TListHelper.PBytes(FItems)[FTail] := nil;
    DequeueAdjust(Notification, Item);
  end;
end;

{$IF not Defined(NEXTGEN)}
procedure TQueueHelper.InternalDequeueWideString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  WideString(Item) := PWideString(FItems)[FTail];
  if not Peek then
  begin
    PWideString(FItems)[FTail] := '';
    DequeueAdjust(Notification, Item);
  end;
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TQueueHelper.InternalDequeueObject(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  TObject(Item) := PObject(FItems)[FTail];
  if not Peek then
  begin
    PObject(FItems)[FTail] := nil;
    DequeueAdjust(Notification, Item);
  end;
end;
{$ENDIF}

procedure TQueueHelper.InternalDequeue1(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Byte(Item) := PByte(FItems)[FTail];
  if not Peek then
    DequeueAdjust(Notification, Item);
end;

procedure TQueueHelper.InternalDequeue2(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Word(Item) := PWord(FItems)[FTail];
  if not Peek then
    DequeueAdjust(Notification, Item);
end;

procedure TQueueHelper.InternalDequeue4(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Cardinal(Item) := PCardinal(FItems)[FTail];
  if not Peek then
    DequeueAdjust(Notification, Item);
end;

procedure TQueueHelper.InternalDequeue8(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  UInt64(Item) := PUInt64(FItems)[FTail];
  if not Peek then
    DequeueAdjust(Notification, Item);
end;

procedure TQueueHelper.InternalDequeueManaged(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  InitializeArray(@Item, ElType, 1);
  CheckEmpty;
  System.CopyArray(@Item, @PByte(FItems)[FTail * ElSize], ElType, 1);
  if not Peek then
  begin
    FinalizeArray(@PByte(FItems)[FTail * ElSize], ElType, 1);
    InitializeArray(@PByte(FItems)[FTail * ElSize], ElType, 1);
    DequeueAdjust(Notification, Item);
  end;
end;

procedure TQueueHelper.InternalDequeueMRef(Notification: TCollectionNotification; Peek: Boolean; out Item; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalDequeueString(Notification, Peek, Item);
    TTypeKind.tkDynArray: InternalDequeueDynArray(Notification, Peek, Item);
    TTypeKind.tkInterface: InternalDequeueInterface(Notification, Peek, Item);
    TTypeKind.tkLString: InternalDequeueByteString(Notification, Peek, Item);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalDequeueWideString(Notification, Peek, Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalDequeueObject(Notification, Peek, Item);
{$ENDIF}
  end;
end;

procedure TQueueHelper.InternalDequeueN(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Move(PByte(FItems)[FTail * ElSize], Item, ElSize);
  if not Peek then
    DequeueAdjust(Notification, Item);
end;

procedure TQueueHelper.InternalClearString;
var
  Temp: string;
begin
  while FLH.FCount > 0 do
    InternalDequeueString(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClearInterface;
var
  Temp: IInterface;
begin
  while FLH.FCount > 0 do
    InternalDequeueInterface(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClearByteString;
var
  Temp: RawByteString;
begin
  while FLH.FCount > 0 do
    InternalDequeueByteString(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClearDynArray;
var
  Temp: Pointer;
begin
  Temp := nil;
  while FLH.FCount > 0 do
    try
      InternalDequeueDynArray(cnRemoved, False, Temp);
    finally
      DynArrayClear(Temp, ElType);
    end;
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

{$IF not Defined(NEXTGEN)}
procedure TQueueHelper.InternalClearWideString;
var
  Temp: WideString;
begin
  while FLH.FCount > 0 do
    InternalDequeueWideString(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TQueueHelper.InternalClearObject;
var
  Temp: TObject;
begin
  while FLH.FCount > 0 do
    InternalDequeueObject(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;
{$ENDIF}

procedure TQueueHelper.InternalClear1;
var
  Temp: Byte;
begin
  while FLH.FCount > 0 do
    InternalDequeue1(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClear2;
var
  Temp: Word;
begin
  while FLH.FCount > 0 do
    InternalDequeue2(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClear4;
var
  Temp: Cardinal;
begin
  while FLH.FCount > 0 do
    InternalDequeue4(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClear8;
var
  Temp: UInt64;
begin
  while FLH.FCount > 0 do
    InternalDequeue8(cnRemoved, False, Temp);
  FHead := 0;
  FTail := 0;
  FLH.FCount := 0;
end;

procedure TQueueHelper.InternalClearManaged;
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
begin
  PTemp := @STemp[0];
  DTemp := nil;
  try
    if SizeOf(STemp) < ElSize then
    begin
      DTemp := AllocMem(ElSize);
      PTemp := DTemp;
    end else
      FillChar(STemp, SizeOf(STemp), 0);
    while FLH.FCount > 0 do
    begin
      InitializeArray(@PTemp[0], ElType, 1);
      try
        InternalDequeueManaged(cnRemoved, False, PTemp[0]);
      finally
        FinalizeArray(@PTemp[0], ElType, 1);
      end;
    end;
    FHead := 0;
    FTail := 0;
    FLH.FCount := 0;
  finally
    FreeMem(DTemp);
  end;
end;

procedure TQueueHelper.InternalClearMRef(Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalClearString;
    TTypeKind.tkDynArray: InternalClearDynArray;
    TTypeKind.tkInterface: InternalClearInterface;
    TTypeKind.tkLString: InternalClearByteString;
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalClearWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalClearObject;
{$ENDIF}
  end;
end;

procedure TQueueHelper.InternalClearN;
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
begin
  PTemp := @STemp[0];
  DTemp := nil;
  try
    if SizeOf(STemp) < ElSize then
    begin
      GetMem(DTemp, ElSize);
      PTemp := DTemp;
    end;
    while FLH.FCount > 0 do
      InternalDequeueN(cnRemoved, False, PTemp[0]);
    FHead := 0;
    FTail := 0;
    FLH.FCount := 0;
  finally
    FreeMem(DTemp);
  end;
end;

procedure TQueueHelper.InternalGrow1;
begin
  InternalSetCapacity1(GetNewCap);
end;

procedure TQueueHelper.InternalGrow2;
begin
  InternalSetCapacity2(GetNewCap);
end;

procedure TQueueHelper.InternalGrow4;
begin
  InternalSetCapacity4(GetNewCap);
end;

procedure TQueueHelper.InternalGrow8;
begin
  InternalSetCapacity8(GetNewCap);
end;

procedure TQueueHelper.InternalGrowManaged;
begin
  InternalSetCapacityManaged(GetNewCap);
end;

procedure TQueueHelper.InternalGrowMRef;
begin
  InternalSetCapacityMRef(GetNewCap);
end;

procedure TQueueHelper.InternalGrowN;
begin
  InternalSetCapacityN(GetNewCap);
end;

procedure TQueueHelper.InternalSetCapacity1(Value: NativeInt);
begin
  InternalSetCapacityInline(Value, SizeOf(Byte));
end;

procedure TQueueHelper.InternalSetCapacity2(Value: NativeInt);
begin
  InternalSetCapacityInline(Value, SizeOf(Word));
end;

procedure TQueueHelper.InternalSetCapacity4(Value: NativeInt);
begin
  InternalSetCapacityInline(Value, SizeOf(Cardinal));
end;

procedure TQueueHelper.InternalSetCapacity8(Value: NativeInt);
begin
  InternalSetCapacityInline(Value, SizeOf(UInt64));
end;

procedure TQueueHelper.InternalSetCapacityManaged(Value: NativeInt);
var
  TailCount, Offset: NativeInt;
  Items: PByte;
begin
  Offset := Value - DynArraySize(FItems);
  if Offset = 0 then
    Exit;

  // If head <= tail, then part of the queue wraps around
  // the end of the array; don't introduce a gap in the queue.
  if (FHead < FTail) or ((FHead = FTail) and (FLH.FCount > 0)) then
    TailCount := DynArraySize(FItems) - FTail
  else
    TailCount := 0;

  if Offset > 0 then
    DynArraySetLength(Value);
  Items := PByte(FItems);
  if TailCount > 0 then
  begin
    CopyArray(@Items[(FTail + Offset) * ElSize], @Items[FTail * ElSize], ElType, ElSize, TailCount);
    if Offset > 0 then
    begin
      FinalizeArray(@Items[FTail * ElSize], ElType, Offset);
      InitializeArray(@Items[FTail * ElSize], ElType, Offset);
    end
    else if Offset < 0 then
    begin
      FinalizeArray(@Items[FLH.FCount * ElSize], ElType, (- Offset));
      InitializeArray(@Items[FLH.FCount * ElSize], ElType, (- Offset));
    end;
    Inc(FTail, Offset);
  end
  else if FTail > 0 then
  begin
    if FLH.FCount > 0 then
    begin
      CopyArray(@Items[0], @Items[FTail * ElSize], ElType, ElSize, FLH.FCount);
      FinalizeArray(@Items[FLH.FCount * ElSize], ElType, FTail);
      InitializeArray(@Items[FLH.FCount * ElSize], ElType, FTail);
    end;
    Dec(FHead, FTail);
    FTail := 0;
  end;
  if Offset < 0 then
  begin
    DynArraySetLength(Value);
    if Value = 0 then
      FHead := 0
    else
      FHead := FHead mod DynArraySize(FItems);
  end;
end;

procedure TQueueHelper.InternalSetCapacityMRef(Value: NativeInt);
var
  TailCount, Offset: NativeInt;
begin
  Offset := Value - DynArraySize(FItems);
  if Offset = 0 then
    Exit;

  // If head <= tail, then part of the queue wraps around
  // the end of the array; don't introduce a gap in the queue.
  if (FHead < FTail) or ((FHead = FTail) and (FLH.FCount > 0)) then
    TailCount := DynArraySize(FItems) - FTail
  else
    TailCount := 0;

  if Offset > 0 then
    DynArraySetLength(Value);
  if TailCount > 0 then
  begin
    Move(PByte(FItems)[FTail * SizeOf(Pointer)], PByte(FItems)[(FTail + Offset) * SizeOf(Pointer)], TailCount * SizeOf(Pointer));
    if offset > 0 then
      FillChar(PByte(FItems)[FTail * SizeOf(Pointer)], Offset * SizeOf(Pointer), 0)
    else if offset < 0 then
      FillChar(PByte(FItems)[FLH.FCount * SizeOf(Pointer)], (-Offset) * SizeOf(Pointer), 0);
    Inc(FTail, Offset);
  end else if FTail > 0 then
  begin
    if FLH.FCount > 0 then
    begin
      Move(PByte(FItems)[FTail * SizeOf(Pointer)], PByte(FItems)[0], FLH.FCount * SizeOf(Pointer));
      FillChar(PByte(FItems)[FLH.FCount * SizeOf(Pointer)], FTail * SizeOf(Pointer), 0);
    end;
    Dec(FHead, FTail);
    FTail := 0;
  end;
  if Offset < 0 then
  begin
    DynArraySetLength(Value);
    if Value = 0 then
      FHead := 0
    else
      FHead := FHead mod DynArraySize(FItems);
  end;
end;

procedure TQueueHelper.InternalSetCapacityN(Value: NativeInt);
begin
  InternalSetCapacityInline(Value, ElSize);
end;

{$POINTERMATH OFF}

{ TQueue<T> }

function TQueue<T>.FQueueHelper: PQueueHelper;
begin
  Result := PQueueHelper(@FHead);
end;

procedure TQueue<T>.Notify(const Item: T; Action: TCollectionNotification);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Item, Action);
end;

constructor TQueue<T>.Create;
begin
  inherited Create;
  FListObj := Self;
  FNotify := @TQueue<T>.InternalNotify;
  FCompare := @TQueue<T>.InternalCompare;
  FTypeInfo := TypeInfo(arrayOfT);
end;

constructor TQueue<T>.Create(const Collection: TEnumerable<T>);
var
  Item: T;
begin
  Create;
  for Item in Collection do
    Enqueue(Item);
end;

constructor TQueue<T>.Create(const Collection: IEnumerable<T>);
var
  Item: T;
begin
  Create;
  for Item in Collection do
    Enqueue(Item);
end;

procedure TQueue<T>.Clear;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FQueueHelper.InternalClearMRef(GetTypeKind(T))
    else
      FQueueHelper.InternalClearManaged
  else
  case SizeOf(T) of
    1: FQueueHelper.InternalClear1;
    2: FQueueHelper.InternalClear2;
    4: FQueueHelper.InternalClear4;
    8: FQueueHelper.InternalClear8;
  else
    FQueueHelper.InternalClearN;
  end;
end;

destructor TQueue<T>.Destroy;
begin
  Clear;
  Capacity := 0;
  inherited;
end;

procedure TQueue<T>.SetCapacity(Value: NativeInt);
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FQueueHelper.InternalSetCapacityMRef(Value)
    else
      FQueueHelper.InternalSetCapacityManaged(Value)
  else
  case SizeOf(T) of
    1: FQueueHelper.InternalSetCapacity1(Value);
    2: FQueueHelper.InternalSetCapacity2(Value);
    4: FQueueHelper.InternalSetCapacity4(Value);
    8: FQueueHelper.InternalSetCapacity8(Value);
  else
    FQueueHelper.InternalSetCapacityN(Value);
  end;
end;

function TQueue<T>.DoDequeue(Notification: TCollectionNotification): T;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FQueueHelper.InternalDequeueMRef(Notification, False, Result, GetTypeKind(T))
    else
      FQueueHelper.InternalDequeueManaged(Notification, False, Result)
  else
  case SizeOf(T) of
    1: FQueueHelper.InternalDequeue1(Notification, False, Result);
    2: FQueueHelper.InternalDequeue2(Notification, False, Result);
    4: FQueueHelper.InternalDequeue4(Notification, False, Result);
    8: FQueueHelper.InternalDequeue8(Notification, False, Result);
  else
    FQueueHelper.InternalDequeueN(Notification, False, Result);
  end;
end;

procedure TQueue<T>.DoSetCapacity(Value: NativeInt);
begin
  if Value < Count then
    ErrorArgumentOutOfRange;
  SetCapacity(Value);
end;

function TQueue<T>.Dequeue: T;
begin
  Result := DoDequeue(cnRemoved);
end;

procedure TQueue<T>.Enqueue(const Value: T);
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FQueueHelper.InternalEnqueueMRef(Value, GetTypeKind(T))
    else
      FQueueHelper.InternalEnqueueManaged(Value)
  else
  case SizeOf(T) of
    1: FQueueHelper.InternalEnqueue1(Value);
    2: FQueueHelper.InternalEnqueue2(Value);
    4: FQueueHelper.InternalEnqueue4(Value);
    8: FQueueHelper.InternalEnqueue8(Value);
  else
    FQueueHelper.InternalEnqueueN(Value);
  end;
end;

function TQueue<T>.Extract: T;
begin
  Result := DoDequeue(cnExtracted);
end;

function TQueue<T>.Peek: T;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FQueueHelper.InternalDequeueMRef(cnRemoved, True, Result, GetTypeKind(T))
    else
      FQueueHelper.InternalDequeueManaged(cnRemoved, True, Result)
  else
  case SizeOf(T) of
    1: FQueueHelper.InternalDequeue1(cnRemoved, True, Result);
    2: FQueueHelper.InternalDequeue2(cnRemoved, True, Result);
    4: FQueueHelper.InternalDequeue4(cnRemoved, True, Result);
    8: FQueueHelper.InternalDequeue8(cnRemoved, True, Result);
  else
    FQueueHelper.InternalDequeueN(cnRemoved, True, Result);
  end;
end;

function TQueue<T>.ToArray: TArray<T>;
begin
  Result := ToArrayImpl(Count);
end;

procedure TQueue<T>.TrimExcess;
begin
  SetCapacity(Count);
end;

function TQueue<T>.InternalCompare(const Left, Right): Integer;
begin
  Result := 0;
end;

procedure TQueue<T>.InternalNotify(const Item; Action: TCollectionNotification);
begin
  Notify(T(Item), Action);
end;

function TQueue<T>.GetList: arrayOfT;
begin
  Result := arrayOfT(FItems);
end;

function TQueue<T>.GetCapacity: NativeInt;
begin
  Result := Length(List);
end;

function TQueue<T>.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(Self);
end;

function TQueue<T>.GetIsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TQueue<T>.DoGetEnumerator: TEnumerator<T>;
begin
  Result := GetEnumerator;
end;

{ TQueue<T>.TEnumerator }

constructor TQueue<T>.TEnumerator.Create(const AQueue: TQueue<T>);
begin
  inherited Create;
  FQueue := AQueue;
  FIndex := -1;
end;

function TQueue<T>.TEnumerator.GetCurrent: T;
begin
  Result := FQueue.List[(FQueue.FTail + FIndex) mod Length(FQueue.List)];
end;

function TQueue<T>.TEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FQueue.Count - 1;
  if Result then
    Inc(FIndex);
end;

function TQueue<T>.TEnumerator.DoGetCurrent: T;
begin
  Result := GetCurrent;
end;

function TQueue<T>.TEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

{$POINTERMATH ON}

{ TStackHelper }

function TStackHelper.GetElSize: NativeInt;
begin
  Result := FLH.ElSize;
end;

function TStackHelper.GetElType: Pointer;
begin
  Result := FLH.ElType
end;

procedure TStackHelper.CheckEmpty;
begin
  if FLH.FCount = 0 then
    raise EListError.CreateRes(@SUnbalancedOperation);
end;

procedure TStackHelper.CheckGrow;
begin
  if FLH.FCount = DynArraySize(FItems) then
    InternalGrow;
end;

procedure TStackHelper.PopAdjust(const Value; Notification: TCollectionNotification);
begin
  Dec(FLH.FCount);
  FLH.FNotify(FLH.FListObj, Value, Notification);
end;

procedure TStackHelper.PushAdjust(const Value);
begin
  Inc(FLH.FCount);
  FLH.FNotify(FLH.FListObj, Value, cnAdded);
end;

procedure TStackHelper.InternalDoPopString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  string(Item) := PString(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    PString(FItems)[FLH.FCount - 1] := '';
    PopAdjust(Item, Notification);
  end;
end;

procedure TStackHelper.InternalDoPopInterface(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  IInterface(Item) := PInterface(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    PInterface(FItems)[FLH.FCount - 1] := nil;
    PopAdjust(Item, Notification);
  end;
end;

procedure TStackHelper.InternalDoPopByteString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  RawByteString(Item) := PRawByteString(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    PRawByteString(FItems)[FLH.FCount - 1] := '';
    PopAdjust(Item, Notification);
  end;
end;

procedure TStackHelper.InternalDoPopDynArray(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  TBytes(Item) := TListHelper.PBytes(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    TListHelper.PBytes(FItems)[FLH.FCount - 1] := nil;
    PopAdjust(Item, Notification);
  end;
end;

{$IF not Defined(NEXTGEN)}
procedure TStackHelper.InternalDoPopWideString(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  WideString(Item) := PWideString(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    PWideString(FItems)[FLH.FCount - 1] := '';
    PopAdjust(Item, Notification);
  end;
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TStackHelper.InternalDoPopObject(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  TObject(Item) := PObject(FItems)[FLH.FCount - 1];
  if not Peek then
  begin
    PObject(FItems)[FLH.FCount - 1] := nil;
    PopAdjust(Item, Notification);
  end;
end;
{$ENDIF}

procedure TStackHelper.InternalClearString;
var
  Temp: string;
begin
  while FLH.FCount > 0 do
    InternalDoPopString(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClearInterface;
var
  Temp: IInterface;
begin
  while FLH.FCount > 0 do
    InternalDoPopInterface(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClearByteString;
var
  Temp: RawByteString;
begin
  while FLH.FCount > 0 do
    InternalDoPopByteString(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClearDynArray;
var
  Temp: Pointer;
begin
  Temp := nil;
  while FLH.FCount > 0 do
    try
      InternalDoPopDynArray(cnRemoved, False, Temp);
    finally
      DynArrayClear(Temp, ElType);
    end;
  FLH.InternalSetCapacity(0);
end;

{$IF not Defined(NEXTGEN)}
procedure TStackHelper.InternalClearWideString;
var
  Temp: WideString;
begin
  while FLH.FCount > 0 do
    InternalDoPopWideString(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TStackHelper.InternalClearObject;
var
  Temp: TObject;
begin
  while FLH.FCount > 0 do
    InternalDoPopObject(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;
{$ENDIF}

procedure TStackHelper.InternalClear1;
var
  Temp: Byte;
begin
  while FLH.FCount > 0 do
    InternalDoPop1(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClear2;
var
  Temp: Word;
begin
  while FLH.FCount > 0 do
    InternalDoPop2(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClear4;
var
  Temp: Cardinal;
begin
  while FLH.FCount > 0 do
    InternalDoPop4(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClear8;
var
  Temp: UInt64;
begin
  while FLH.FCount > 0 do
    InternalDoPop8(cnRemoved, False, Temp);
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClearManaged;
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
begin
  PTemp := @STemp[0];
  DTemp := nil;
  try
    if SizeOf(STemp) < ElSize then
    begin
      DTemp := AllocMem(ElSize);
      PTemp := DTemp;
    end else
      FillChar(STemp, SizeOf(STemp), 0);
    while FLH.FCount > 0 do
    begin
      InitializeArray(@PTemp[0], ElType, 1);
      try
        InternalDoPopManaged(cnRemoved, False, PTemp[0]);
      finally
        FinalizeArray(@PTemp[0], ElType, 1);
      end;
    end;
  finally
    FreeMem(DTemp);
  end;
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalClearMRef(Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalClearString;
    TTypeKind.tkDynArray: InternalClearDynArray;
    TTypeKind.tkInterface: InternalClearInterface;
    TTypeKind.tkLString: InternalClearByteString;
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalClearWideString;
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalClearObject;
{$ENDIF}
  end;
end;

procedure TStackHelper.InternalClearN;
var
  STemp: array[0..63] of Byte;
  DTemp: PByte;
  PTemp: PByte;
begin
  PTemp := @STemp[0];
  DTemp := nil;
  try
    if SizeOf(STemp) < ElSize then
    begin
      GetMem(DTemp, ElSize);
      PTemp := DTemp;
    end;
    while FLH.FCount > 0 do
      InternalDoPopN(cnRemoved, False, PTemp[0]);
  finally
    FreeMem(DTemp);
  end;
  FLH.InternalSetCapacity(0);
end;

procedure TStackHelper.InternalDoPop1(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Byte(Item) := PByte(FItems)[FLH.FCount - 1];
  if not Peek then
    PopAdjust(Item, Notification);
end;

procedure TStackHelper.InternalDoPop2(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Word(Item) := PWord(FItems)[FLH.FCount - 1];
  if not Peek then
    PopAdjust(Item, Notification);
end;

procedure TStackHelper.InternalDoPop4(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Cardinal(Item) := PCardinal(FItems)[FLH.FCount - 1];
  if not Peek then
    PopAdjust(Item, Notification);
end;

procedure TStackHelper.InternalDoPop8(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  UInt64(Item) := PUInt64(FItems)[FLH.FCount - 1];
  if not Peek then
    PopAdjust(Item, Notification);
end;

procedure TStackHelper.InternalDoPopManaged(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  InitializeArray(@Item, ElType, 1);
  CheckEmpty;
  System.CopyArray(@Item, @PByte(FItems)[(FLH.FCount - 1) * ElSize], ElType, 1);
  if not Peek then
  begin
    FinalizeArray(@PByte(FItems)[(FLH.FCount - 1) * ElSize], ElType, 1);
    InitializeArray(@PByte(FItems)[(FLH.FCount - 1) * ElSize], ElType, 1);
    PopAdjust(Item, Notification);
  end;
end;

procedure TStackHelper.InternalDoPopMRef(Notification: TCollectionNotification; Peek: Boolean; out Item; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalDoPopString(Notification, Peek, Item);
    TTypeKind.tkDynArray: InternalDoPopDynArray(Notification, Peek, Item);
    TTypeKind.tkInterface: InternalDoPopInterface(Notification, Peek, Item);
    TTypeKind.tkLString: InternalDoPopByteString(Notification, Peek, Item);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalDoPopWideString(Notification, Peek, Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalDoPopObject(Notification, Peek, Item);
{$ENDIF}
  end;
end;

procedure TStackHelper.InternalDoPopN(Notification: TCollectionNotification; Peek: Boolean; out Item);
begin
  CheckEmpty;
  Move(PByte(FItems)[(FLH.FCount - 1) * ElSize], Item, ElSize);
  if not Peek then
    PopAdjust(Item, Notification);
end;

procedure TStackHelper.InternalGrow;
var
  NewCap: NativeInt;
begin
  NewCap := GrowCollection(DynArraySize(FItems), FLH.FCount + 1);
  FLH.InternalSetCapacity(NewCap);
end;

procedure TStackHelper.InternalPushString(const Value);
begin
  CheckGrow;
  PString(FItems)[FLH.FCount] := string(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPushInterface(const Value);
begin
  CheckGrow;
  PInterface(FItems)[FLH.FCount] := IInterface(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPushByteString(const Value);
begin
  CheckGrow;
  PRawByteString(FItems)[FLH.FCount] := RawByteString(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPushDynArray(const Value);
begin
  CheckGrow;
  DynArrayAssign(Pointer(TListHelper.PBytes(FItems)[FLH.FCount]), Pointer(Value), ElType);
  PushAdjust(Value);
end;

{$IF not Defined(NEXTGEN)}
procedure TStackHelper.InternalPushWideString(const Value);
begin
  CheckGrow;
  PWideString(FItems)[FLH.FCount] := WideString(Value);
  PushAdjust(Value);
end;
{$ENDIF}

{$IF Defined(AUTOREFCOUNT)}
procedure TStackHelper.InternalPushObject(const Value);
begin
  CheckGrow;
  PObject(FItems)[FLH.FCount] := TObject(Value);
  PushAdjust(Value);
end;
{$ENDIF}

procedure TStackHelper.InternalPush1(const Value);
begin
  CheckGrow;
  PByte(FItems)[FLH.FCount] := Byte(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPush2(const Value);
begin
  CheckGrow;
  PWord(FItems)[FLH.FCount] := Word(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPush4(const Value);
begin
  CheckGrow;
  PCardinal(FItems)[FLH.FCount] := Cardinal(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPush8(const Value);
begin
  CheckGrow;
  PUInt64(FItems)[FLH.FCount] := UInt64(Value);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPushManaged(const Value);
begin
  CheckGrow;
  System.CopyArray(@PByte(FItems)[FLH.FCount * ElSize], @Value, ElType, 1);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalPushMRef(const Value; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: InternalPushString(Value);
    TTypeKind.tkDynArray: InternalPushDynArray(Value);
    TTypeKind.tkInterface: InternalPushInterface(Value);
    TTypeKind.tkLString: InternalPushByteString(Value);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkWString: InternalPushWideString(Value);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: InternalPushObject(Value);
{$ENDIF}
  end;
end;

procedure TStackHelper.InternalPushN(const Value);
begin
  CheckGrow;
  Move(Value, PByte(FItems)[FLH.FCount * ElSize], ElSize);
  PushAdjust(Value);
end;

procedure TStackHelper.InternalSetCapacity(Value: NativeInt);
begin
  if Value < FLH.FCount then
    ErrorArgumentOutOfRange;
  FLH.InternalSetCapacity(Value);
end;

{$POINTERMATH OFF}

{ TStack<T> }

function TStack<T>.FStackHelper: PStackHelper;
begin
  Result := PStackHelper(@FItems);
end;

procedure TStack<T>.Notify(const Item: T; Action: TCollectionNotification);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Item, Action);
end;

constructor TStack<T>.Create;
begin
  inherited Create;
  FListObj := Self;
  FNotify := @TStack<T>.InternalNotify;
  FTypeInfo := TypeInfo(arrayOfT);
end;

constructor TStack<T>.Create(const Collection: TEnumerable<T>);
var
  Item: T;
begin
  Create;
  for Item in Collection do
    Push(Item);
end;

constructor TStack<T>.Create(const Collection: IEnumerable<T>);
var
  Item: T;
begin
  Create;
  for Item in Collection do
    Push(Item);
end;

procedure TStack<T>.Push(const Value: T);
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FStackHelper.InternalPushMRef(Value, GetTypeKind(T))
    else
      FStackHelper.InternalPushManaged(Value)
  else
  case SizeOf(T) of
    1: FStackHelper.InternalPush1(Value);
    2: FStackHelper.InternalPush2(Value);
    4: FStackHelper.InternalPush4(Value);
    8: FStackHelper.InternalPush8(Value);
  else
    FStackHelper.InternalPushN(Value);
  end;
end;

procedure TStack<T>.Clear;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FStackHelper.InternalClearMRef(GetTypeKind(T))
    else
      FStackHelper.InternalClearManaged
  else
  case SizeOf(T) of
    1: FStackHelper.InternalClear1;
    2: FStackHelper.InternalClear2;
    4: FStackHelper.InternalClear4;
    8: FStackHelper.InternalClear8;
  else
    FStackHelper.InternalClearN;
  end;
end;

destructor TStack<T>.Destroy;
begin
  Clear;
  Capacity := 0;
  inherited;
end;

function TStack<T>.DoGetEnumerator: TEnumerator<T>;
begin
  Result := GetEnumerator;
end;

procedure TStack<T>.InternalNotify(const Item; Action: TCollectionNotification);
begin
  Notify(T(Item), Action);
end;

function TStack<T>.DoPop(Notification: TCollectionNotification): T;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FStackHelper.InternalDoPopMRef(Notification, False, Result, GetTypeKind(T))
    else
      FStackHelper.InternalDoPopManaged(Notification, False, Result)
  else
  case SizeOf(T) of
    1: FStackHelper.InternalDoPop1(Notification, False, Result);
    2: FStackHelper.InternalDoPop2(Notification, False, Result);
    4: FStackHelper.InternalDoPop4(Notification, False, Result);
    8: FStackHelper.InternalDoPop8(Notification, False, Result);
  else
    FStackHelper.InternalDoPopN(Notification, False, Result);
  end;
end;

procedure TStack<T>.DoSetCapacity(Value: NativeInt);
begin
  FStackHelper.InternalSetCapacity(Value);
end;

function TStack<T>.Extract: T;
begin
  Result := DoPop(cnExtracted);
end;

function TStack<T>.Peek: T;
begin
  if IsManagedType(T) then
    if (SizeOf(T) = SizeOf(Pointer)) and not (GetTypeKind(T) in [tkRecord, tkMRecord]) then
      FStackHelper.InternalDoPopMRef(cnRemoved, True, Result, GetTypeKind(T))
    else
      FStackHelper.InternalDoPopManaged(cnRemoved, True, Result)
  else
  case SizeOf(T) of
    1: FStackHelper.InternalDoPop1(cnRemoved, True, Result);
    2: FStackHelper.InternalDoPop2(cnRemoved, True, Result);
    4: FStackHelper.InternalDoPop4(cnRemoved, True, Result);
    8: FStackHelper.InternalDoPop8(cnRemoved, True, Result);
  else
    FStackHelper.InternalDoPopN(cnRemoved, True, Result);
  end;
end;

function TStack<T>.Pop: T;
begin
  Result := DoPop(cnRemoved);
end;

function TStack<T>.ToArray: TArray<T>;
begin
  Result := ToArrayImpl(Count);
end;

procedure TStack<T>.TrimExcess;
begin
  FStackHelper.FLH.InternalSetCapacity(Count);
end;

function TStack<T>.GetList: arrayOfT;
begin
  Result := arrayOfT(FItems);
end;

function TStack<T>.GetCapacity: NativeInt;
begin
  Result := Length(List);
end;

function TStack<T>.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(Self);
end;

function TStack<T>.GetIsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

constructor TStack<T>.TEnumerator.Create(const AStack: TStack<T>);
begin
  inherited Create;
  FStack := AStack;
  FIndex := -1;
end;

function TStack<T>.TEnumerator.GetCurrent: T;
begin
  Result := FStack.List[FIndex];
end;

function TStack<T>.TEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FStack.Count - 1;
  if Result then
    Inc(FIndex);
end;

function TStack<T>.TEnumerator.DoGetCurrent: T;
begin
  Result := Current;
end;

function TStack<T>.TEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

{ TPair<K,V> }

constructor TPair<K,V>.Create(const AKey: K; const AValue: V);
begin
  Key := AKey;
  Value := AValue;
end;

{ TDictionary<K,V> }

const
  EMPTY_HASH = -1;

procedure TDictionary<K,V>.Rehash(NewCapPow2: NativeInt);
var
  oldItems, newItems: TItemArray;
  i, j: NativeInt;
  P: PItem;
begin
  if NewCapPow2 = Length(FItems) then
    Exit
  else if NewCapPow2 < 0 then
    OutOfMemoryError;

  oldItems := FItems;
  SetLength(newItems, NewCapPow2);
  P := PItem(newItems);
  for i := 0 to Length(newItems) - 1 do
  begin
    P^.HashCode := EMPTY_HASH;
    Inc(P);
  end;
  FItems := newItems;
  FGrowThreshold := NewCapPow2 shr 1; // 50%

  P := PItem(oldItems);
  for i := 0 to Length(oldItems) - 1 do
  begin
    if P^.HashCode <> EMPTY_HASH then
    begin
      j := not GetBucketIndex(P^.Key, P^.HashCode);
      FItems[j] := P^;
    end;
    Inc(P);
  end;
end;

procedure TDictionary<K,V>.InternalSetCapacity(ACapacity: NativeInt);
var
  newCap: NativeInt;
begin
  if ACapacity < Count then
    ErrorArgumentOutOfRange;

  if ACapacity = 0 then
    Rehash(0)
  else
  begin
    newCap := 4;
    while newCap shr 1 <= ACapacity do // 50%
      newCap := newCap shl 1;
    Rehash(newCap);
  end
end;

function TDictionary<K, V>.GetCapacity: NativeInt;
begin
  Result := Length(FItems);
end;

procedure TDictionary<K, V>.SetCapacity(const Value: NativeInt);
begin
  // Ensure at least one empty slot for GetBucketIndex to terminate.
  if Capacity <> Value + 1 then
    InternalSetCapacity(Value + 1);
end;

procedure TDictionary<K,V>.Grow;
var
  newCap: NativeInt;
begin
  newCap := Length(FItems) * 2;
  if newCap = 0 then
    newCap := 4;
  Rehash(newCap);
end;

function TDictionary<K,V>.GetBucketIndex(const Key: K; HashCode: Integer): NativeInt;
var
  L: NativeInt;
  hc: Integer;
  P: PItem;
begin
  L := Length(FItems);
  if L = 0 then
    Exit(not High(NativeInt));

  Result := HashCode and (L - 1);
  P := @FItems[Result];
  while True do
  begin
    hc := P^.HashCode;

    // Not found: return complement of insertion point.
    if hc = EMPTY_HASH then
      Exit(not Result);

    // Found: return location.
    if (hc = HashCode) and FComparer.Equals(P^.Key, Key) then
      Exit(Result);

    Inc(Result);
    Inc(P);
    if Result >= L then
    begin
      Result := 0;
      P := @FItems[0];
    end;
  end;
end;

function TDictionary<K,V>.GetCollisions: NativeInt;
var
  L, I: NativeInt;
  P: PItem;
begin
  Result := 0;
  L := Length(FItems) - 1;
  P := PItem(FItems);
  for I := 0 to L do
  begin
    if (P^.HashCode <> EMPTY_HASH) and ((P^.HashCode and L) <> I) then
      Inc(Result);
    Inc(P);
  end;
end;

function TDictionary<K,V>.Hash(const Key: K): Integer;
const
  PositiveMask = Integer.MaxValue;
begin
{$IFOPT Q+}
  {$DEFINE Q_ON}
  {$Q-}
{$ENDIF}
  // Double-Abs to avoid -MaxInt and MinInt problems.
  // Not using compiler-Abs because we *must* get a positive integer;
  // for compiler, Abs(Low(Integer)) is a null op.
  Result := PositiveMask and ((PositiveMask and FComparer.GetHashCode(Key)) + 1);
{$IFDEF Q_ON}
  {$Q+}
  {$UNDEF Q_ON}
{$ENDIF}
end;

function TDictionary<K, V>.GetIsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TDictionary<K,V>.GetItem(const Key: K): V;
var
  index: NativeInt;
begin
  index := GetBucketIndex(Key, Hash(Key));
  if index < 0 then
    raise EListError.CreateRes(@SGenericItemNotFound);
  Result := FItems[index].Value;
end;

procedure TDictionary<K,V>.SetItem(const Key: K; const Value: V);
var
  index: NativeInt;
  oldValue: V;
begin
  index := GetBucketIndex(Key, Hash(Key));
  if index < 0 then
    raise EListError.CreateRes(@SGenericItemNotFound);

  oldValue := FItems[index].Value;
  FItems[index].Value := Value;

  ValueNotify(oldValue, cnRemoved);
  ValueNotify(Value, cnAdded);
end;

procedure TDictionary<K,V>.KeyNotify(const Key: K; Action: TCollectionNotification);
begin
  if Assigned(FOnKeyNotify) then
    FOnKeyNotify(Self, Key, Action);
end;

procedure TDictionary<K,V>.ValueNotify(const Value: V; Action: TCollectionNotification);
begin
  if Assigned(FOnValueNotify) then
    FOnValueNotify(Self, Value, Action);
end;

constructor TDictionary<K, V>.Create;
begin
  Create(0, nil);
end;

constructor TDictionary<K,V>.Create(ACapacity: NativeInt);
begin
  Create(ACapacity, nil);
end;

constructor TDictionary<K,V>.Create(const AComparer: IEqualityComparer<K>);
begin
  Create(0, AComparer);
end;

constructor TDictionary<K,V>.Create(ACapacity: NativeInt; const AComparer: IEqualityComparer<K>);
begin
  inherited Create;
  if ACapacity < 0 then
    ErrorArgumentOutOfRange;
  if AComparer = nil then
    FComparer := IEqualityComparer<K>(TEqualityComparer<K>._Default)
  else
  	FComparer := AComparer;
  InternalSetCapacity(ACapacity);
end;

constructor TDictionary<K, V>.Create(const Collection: TEnumerable<TPair<K, V>>);
var
  item: TPair<K,V>;
begin
  Create(0, nil);
  for item in Collection do
    AddOrSetValue(item.Key, item.Value);
end;

constructor TDictionary<K, V>.Create(const Collection: TEnumerable<TPair<K, V>>;
  const AComparer: IEqualityComparer<K>);
var
  item: TPair<K,V>;
begin
  Create(0, AComparer);
  for item in Collection do
    AddOrSetValue(item.Key, item.Value);
end;

constructor TDictionary<K,V>.Create(const AItems: array of TPair<K,V>);
var
  item: TPair<K,V>;
begin
  Create(Length(AItems), nil);
  for item in AItems do
    AddOrSetValue(item.Key, item.Value);
end;

constructor TDictionary<K,V>.Create(const AItems: array of TPair<K,V>;
  const AComparer: IEqualityComparer<K>);
var
  item: TPair<K,V>;
begin
  Create(Length(AItems), AComparer);
  for item in AItems do
    AddOrSetValue(item.Key, item.Value);
end;

destructor TDictionary<K,V>.Destroy;
begin
  Clear;
  FKeyCollection.Free;
  FValueCollection.Free;
  inherited;
end;

procedure TDictionary<K,V>.Add(const Key: K; const Value: V);
var
  index: NativeInt;
  hc: Integer;
begin
  if Count >= FGrowThreshold then
    Grow;

  hc := Hash(Key);
  index := GetBucketIndex(Key, hc);
  if index >= 0 then
    raise EListError.CreateRes(@SGenericDuplicateItem);

  DoAdd(hc, not index, Key, Value);
end;

function InCircularRange(Bottom, Item, TopInc: NativeInt): Boolean;
begin
  Result := (Bottom < Item) and (Item <= TopInc) // normal
    or (TopInc < Bottom) and (Item > Bottom) // top wrapped
    or (TopInc < Bottom) and (Item <= TopInc) // top and item wrapped
end;

function TDictionary<K,V>.DoRemove(const Key: K; HashCode: Integer;
  Notification: TCollectionNotification): V;
var
  gap, index, bucket: NativeInt;
  hc: Integer;
  LKey: K;
begin
  index := GetBucketIndex(Key, HashCode);
  if index < 0 then
    Exit(Default(V));

  // Removing item from linear probe hash table is moderately
  // tricky. We need to fill in gaps, which will involve moving items
  // which may not even hash to the same location.
  // Knuth covers it well enough in Vol III. 6.4.; but beware, Algorithm R
  // (2nd ed) has a bug: step R4 should go to step R1, not R2 (already errata'd).
  // My version does linear probing forward, not backward, however.

  // gap refers to the hole that needs filling-in by shifting items down.
  // index searches for items that have been probed out of their slot,
  // but being careful not to move items if their bucket is between
  // our gap and our index (so that they'd be moved before their bucket).
  // We move the item at index into the gap, whereupon the new gap is
  // at the index. If the index hits a hole, then we're done.

  // If our load factor was exactly 1, we'll need to hit this hole
  // in order to terminate. Shouldn't normally be necessary, though.
  FItems[index].HashCode := EMPTY_HASH;
  Result := FItems[index].Value;
  LKey := FItems[index].Key;

  gap := index;
  while True do
  begin
    Inc(index);
    if index = Length(FItems) then
      index := 0;

    hc := FItems[index].HashCode;
    if hc = EMPTY_HASH then
      Break;

    bucket := hc and (Length(FItems) - 1);
    if not InCircularRange(gap, bucket, index) then
    begin
      FItems[gap] := FItems[index];
      gap := index;
      // The gap moved, but we still need to find it to terminate.
      FItems[gap].HashCode := EMPTY_HASH;
    end;
  end;

  FItems[gap].HashCode := EMPTY_HASH;
  FItems[gap].Key := Default(K);
  FItems[gap].Value := Default(V);
  Dec(FCount);

  KeyNotify(LKey, Notification);
  ValueNotify(Result, Notification);
end;

procedure TDictionary<K,V>.Remove(const Key: K);
begin
  DoRemove(Key, Hash(Key), cnRemoved);
end;

function TDictionary<K,V>.ExtractPair(const Key: K): TPair<K,V>;
var
  hc: Integer;
  index: NativeInt;
begin
  hc := Hash(Key);
  index := GetBucketIndex(Key, hc);
  if index < 0 then
    Exit(TPair<K,V>.Create(Key, Default(V)));

  Result := TPair<K,V>.Create(Key, DoRemove(Key, hc, cnExtracted));
end;

procedure TDictionary<K,V>.Clear;
var
  i: NativeInt;
  oldItems: TItemArray;
begin
  oldItems := FItems;
  FCount := 0;
  SetLength(FItems, 0);
  InternalSetCapacity(0);
  FGrowThreshold := 0;

  for i := 0 to Length(oldItems) - 1 do
  begin
    if oldItems[i].HashCode = EMPTY_HASH then
      Continue;
    KeyNotify(oldItems[i].Key, cnRemoved);
    ValueNotify(oldItems[i].Value, cnRemoved);
  end;
end;

function TDictionary<K, V>.ToArray: TArray<TPair<K,V>>;
begin
  Result := ToArrayImpl(Count);
end;

procedure TDictionary<K,V>.TrimExcess;
begin
  // Ensure at least one empty slot for GetBucketIndex to terminate.
  InternalSetCapacity(Count + 1);
end;

function TDictionary<K,V>.TryGetValue(const Key: K; var Value: V): Boolean;
var
  index: NativeInt;
begin
  index := GetBucketIndex(Key, Hash(Key));
  Result := index >= 0;
  if Result then
    Value := FItems[index].Value
  else
    Value := Default(V);
end;

procedure TDictionary<K,V>.DoAdd(HashCode: Integer; Index: NativeInt; const Key: K; const Value: V);
var
  P: PItem;
begin
  P := @FItems[Index];
  P^.HashCode := HashCode;
  P^.Key := Key;
  P^.Value := Value;
  Inc(FCount);

  KeyNotify(Key, cnAdded);
  ValueNotify(Value, cnAdded);
end;

function TDictionary<K, V>.DoGetEnumerator: TEnumerator<TPair<K, V>>;
begin
  Result := GetEnumerator;
end;

procedure TDictionary<K,V>.DoSetValue(Index: NativeInt; const Value: V);
var
  oldValue: V;
begin
  oldValue := FItems[Index].Value;
  FItems[Index].Value := Value;

  ValueNotify(oldValue, cnRemoved);
  ValueNotify(Value, cnAdded);
end;

procedure TDictionary<K,V>.AddOrSetValue(const Key: K; const Value: V);
var
  hc: Integer;
  index: NativeInt;
begin
  hc := Hash(Key);
  index := GetBucketIndex(Key, hc);
  if index >= 0 then
    DoSetValue(index, Value)
  else
  begin
    // We only grow if we are inserting a new value.
    if Count >= FGrowThreshold then
    begin
      Grow;
      // We need a new Bucket Index because the array has grown.
      index := GetBucketIndex(Key, hc);
    end;
    DoAdd(hc, not index, Key, Value);
  end;
end;

function TDictionary<K,V>.TryAdd(const Key: K; const Value: V): Boolean;
var
  hc: Integer;
  index: NativeInt;
begin
  hc := Hash(Key);
  index := GetBucketIndex(Key, hc);
  Result := index < 0;
  if Result then
  begin
    // We only grow if we are inserting a new value.
    if Count >= FGrowThreshold then
    begin
      Grow;
      // We need a new Bucket Index because the array has grown.
      index := GetBucketIndex(Key, hc);
    end;
    DoAdd(hc, not index, Key, Value);
  end;
end;

function TDictionary<K,V>.ContainsKey(const Key: K): Boolean;
begin
  Result := GetBucketIndex(Key, Hash(Key)) >= 0;
end;

function TDictionary<K,V>.ContainsValue(const Value: V): Boolean;
var
  i: NativeInt;
  c: IEqualityComparer<V>;
begin
  c := IEqualityComparer<V>(TEqualityComparer<V>._Default);

  for i := 0 to Length(FItems) - 1 do
    if (FItems[i].HashCode <> EMPTY_HASH) and c.Equals(FItems[i].Value, Value) then
      Exit(True);
  Result := False;
end;

function TDictionary<K,V>.GetEnumerator: TPairEnumerator;
begin
  Result := TPairEnumerator.Create(Self);
end;

function TDictionary<K,V>.GetKeys: TKeyCollection;
begin
  if FKeyCollection = nil then
    FKeyCollection := TKeyCollection.Create(Self);
  Result := FKeyCollection;
end;

function TDictionary<K,V>.GetValues: TValueCollection;
begin
  if FValueCollection = nil then
    FValueCollection := TValueCollection.Create(Self);
  Result := FValueCollection;
end;

// Pairs

constructor TDictionary<K,V>.TPairEnumerator.Create(const ADictionary: TDictionary<K,V>);
begin
  inherited Create;
  FIndex := -1;
  FDictionary := ADictionary;
end;

function TDictionary<K, V>.TPairEnumerator.DoGetCurrent: TPair<K, V>;
begin
  Result := GetCurrent;
end;

function TDictionary<K, V>.TPairEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

function TDictionary<K,V>.TPairEnumerator.GetCurrent: TPair<K,V>;
begin
  Result.Key := FDictionary.FItems[FIndex].Key;
  Result.Value := FDictionary.FItems[FIndex].Value;
end;

function TDictionary<K,V>.TPairEnumerator.MoveNext: Boolean;
begin
  while FIndex < Length(FDictionary.FItems) - 1 do
  begin
    Inc(FIndex);
    if FDictionary.FItems[FIndex].HashCode <> EMPTY_HASH then
      Exit(True);
  end;
  Result := False;
end;

// Keys

constructor TDictionary<K,V>.TKeyEnumerator.Create(const ADictionary: TDictionary<K,V>);
begin
  inherited Create;
  FIndex := -1;
  FDictionary := ADictionary;
end;

function TDictionary<K, V>.TKeyEnumerator.DoGetCurrent: K;
begin
  Result := GetCurrent;
end;

function TDictionary<K, V>.TKeyEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

function TDictionary<K,V>.TKeyEnumerator.GetCurrent: K;
begin
  Result := FDictionary.FItems[FIndex].Key;
end;

function TDictionary<K,V>.TKeyEnumerator.MoveNext: Boolean;
begin
  while FIndex < Length(FDictionary.FItems) - 1 do
  begin
    Inc(FIndex);
    if FDictionary.FItems[FIndex].HashCode <> EMPTY_HASH then
      Exit(True);
  end;
  Result := False;
end;

// Values

constructor TDictionary<K,V>.TValueEnumerator.Create(const ADictionary: TDictionary<K,V>);
begin
  inherited Create;
  FIndex := -1;
  FDictionary := ADictionary;
end;

function TDictionary<K, V>.TValueEnumerator.DoGetCurrent: V;
begin
  Result := GetCurrent;
end;

function TDictionary<K, V>.TValueEnumerator.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

function TDictionary<K,V>.TValueEnumerator.GetCurrent: V;
begin
  Result := FDictionary.FItems[FIndex].Value;
end;

function TDictionary<K,V>.TValueEnumerator.MoveNext: Boolean;
begin
  while FIndex < Length(FDictionary.FItems) - 1 do
  begin
    Inc(FIndex);
    if FDictionary.FItems[FIndex].HashCode <> EMPTY_HASH then
      Exit(True);
  end;
  Result := False;
end;

{ THashSet<T> }

function THashSet<T>.GetCapacity: NativeInt;
begin
  Result := FDict.Capacity;
end;

procedure THashSet<T>.SetCapacity(const Value: NativeInt);
begin
  FDict.Capacity := Value;
end;

function THashSet<T>.GetCount: NativeInt;
begin
  Result := FDict.Count;
end;

function THashSet<T>.GetGrowThreshold: NativeInt;
begin
  Result := FDict.GrowThreshold;
end;

function THashSet<T>.GetIsEmpty: Boolean;
begin
  Result := FDict.IsEmpty;
end;

function THashSet<T>.GetCollisions: NativeInt;
begin
  Result := FDict.Collisions;
end;

function THashSet<T>.GetComparer: IEqualityComparer<T>;
begin
  Result := FDict.Comparer;
end;

procedure THashSet<T>.Notify(const Item: T; Action: TCollectionNotification);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Item, Action);
end;

procedure THashSet<T>.InternalNotify(Sender: TObject; const Item: T;
  Action: TCollectionNotification);
begin
  Notify(Item, Action);
end;

procedure THashSet<T>.UpdateNotify;
type
  TEvent = procedure (const Item: T; Action: TCollectionNotification) of object;
var
  LAssign: Boolean;
  LEvent: TEvent;
begin
  LAssign := Assigned(OnNotify);
  if not LAssign then
  begin
    LEvent := Notify;
    LAssign := TMethod(LEvent).Code <> @TList<T>.Notify;
  end;
  if LAssign then
    FDict.OnKeyNotify := InternalNotify
  else
    FDict.OnKeyNotify := nil;
end;

procedure THashSet<T>.SetOnNotify(const Value: TCollectionNotifyEvent<T>);
begin
  FOnNotify := Value;
  UpdateNotify;
end;

constructor THashSet<T>.Create;
begin
  Create(0, nil);
end;

constructor THashSet<T>.Create(ACapacity: NativeInt);
begin
  Create(ACapacity, nil);
end;

constructor THashSet<T>.Create(const AComparer: IEqualityComparer<T>);
begin
  Create(0, AComparer);
end;

constructor THashSet<T>.Create(ACapacity: NativeInt; const AComparer: IEqualityComparer<T>);
begin
  inherited Create;
  FDict := TDictionary<T, TVoid>.Create(ACapacity, AComparer);
  UpdateNotify;
end;

constructor THashSet<T>.Create(const Collection: TEnumerable<T>);
begin
  Create(0, nil);
  AddRange(Collection);
end;

constructor THashSet<T>.Create(const Collection: TEnumerable<T>;
  const AComparer: IEqualityComparer<T>);
begin
  Create(0, AComparer);
  AddRange(Collection);
end;

constructor THashSet<T>.Create(const AItems: array of T);
begin
  Create(Length(AItems), nil);
  AddRange(AItems);
end;

constructor THashSet<T>.Create(const AItems: array of T;
  const AComparer: IEqualityComparer<T>);
begin
  Create(Length(AItems), AComparer);
  AddRange(AItems);
end;

destructor THashSet<T>.Destroy;
begin
  FDict.Free;
  inherited;
end;

function THashSet<T>.Add(const Value: T): Boolean;
var
  Void: TVoid;
begin
  Result := FDict.TryAdd(Value, Void);
end;

function THashSet<T>.GetOrAdd(const Value: T): T;
var
  Void: TVoid;
begin
  if FDict.TryAdd(Value, Void) then
    Result := Value
  else
    Result := FDict.FItems[FDict.GetBucketIndex(Value, FDict.Hash(Value))].Key;
end;

function THashSet<T>.Remove(const Value: T): Boolean;
begin
  Result := FDict.ContainsKey(Value);
  if Result then
    FDict.Remove(Value);
end;

function THashSet<T>.AddRange(const Values: array of T): Boolean;
var
  item: T;
begin
  Result := False;
  for item in Values do
    Result := Add(item) or Result;
end;

function THashSet<T>.AddRange(const Collection: IEnumerable<T>): Boolean;
var
  item: T;
begin
  Result := False;
  for item in Collection do
    Result := Add(item) or Result;
end;

function THashSet<T>.AddRange(const Collection: TEnumerable<T>): Boolean;
var
  item: T;
begin
  Result := False;
  for item in Collection do
    Result := Add(item) or Result;
end;

procedure THashSet<T>.Clear;
begin
  FDict.Clear;
end;

function THashSet<T>.ToArray: TArray<T>;
begin
  Result := FDict.Keys.ToArray;
end;

procedure THashSet<T>.TrimExcess;
begin
  FDict.TrimExcess;
end;

function THashSet<T>.DoGetEnumerator: TEnumerator<T>;
begin
  Result := FDict.Keys.GetEnumerator;
end;

function THashSet<T>.Contains(const Value: T): Boolean;
begin
  Result := FDict.ContainsKey(Value);
end;

procedure THashSet<T>.ExceptWith(const AOther: TEnumerable<T>);
var
  LEnum: TEnumerator<T>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if Count = 0 then
    Exit;
  if Self = AOther then
  begin
    Clear;
    Exit;
  end;
  LEnum := AOther.GetEnumerator;
  try
    while LEnum.MoveNext do
      Remove(LEnum.Current);
    TrimExcess;
  finally
    LEnum.Free;
  end;
end;

procedure THashSet<T>.IntersectWith(const AOther: TEnumerable<T>);
var
  LEnum: TEnumerator<T>;
  LInd: NativeInt;
  I: NativeInt;
  LFlags: TArray<Boolean>;
  LKey: T;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if (Count = 0) or (Self = AOther) then
    Exit;
  LEnum := AOther.GetEnumerator;
  try
    if not LEnum.MoveNext then
    begin
      Clear;
      Exit;
    end;
    SetLength(LFlags, Capacity);
    repeat
      LInd := FDict.GetBucketIndex(LEnum.Current, FDict.Hash(LEnum.Current));
      if LInd >= 0 then
        LFlags[LInd] := True;
    until not LEnum.MoveNext;
    for I := 0 to Capacity - 1 do
      if (FDict.FItems[I].HashCode <> EMPTY_HASH) and not LFlags[I] then
      begin
        LKey := FDict.FItems[I].Key;
        FDict.FItems[I].HashCode := EMPTY_HASH;
        FDict.FItems[I].Key := Default(T);
        Dec(FDict.FCount);
        FDict.KeyNotify(LKey, cnRemoved);
      end;
    TrimExcess;
  finally
    LEnum.Free;
  end;
end;

procedure THashSet<T>.UnionWith(const AOther: TEnumerable<T>);
var
  LEnum: TEnumerator<T>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if (Count = 0) or (Self = AOther) then
    Exit;
  LEnum := AOther.GetEnumerator;
  try
    while LEnum.MoveNext do
      Add(LEnum.Current);
  finally
    LEnum.Free;
  end;
end;

function THashSet<T>.Overlaps(const AOther: TEnumerable<T>): Boolean;
var
  LEnum: TEnumerator<T>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if Count = 0 then
    Exit(False);
  if Self = AOther then
    Exit(True);
  LEnum := AOther.GetEnumerator;
  try
    while LEnum.MoveNext do
      if Contains(LEnum.Current) then
        Exit(True);
  finally
    LEnum.Free;
  end;
  Result := False;
end;

function THashSet<T>.SetEquals(const AOther: TEnumerable<T>): Boolean;
var
  LEnum: TEnumerator<T>;
  LInd: NativeInt;
  I: NativeInt;
  LFlags: TArray<Boolean>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if Self = AOther then
    Exit(True);
  LEnum := AOther.GetEnumerator;
  try
    SetLength(LFlags, Capacity);
    while LEnum.MoveNext do
    begin
      LInd := FDict.GetBucketIndex(LEnum.Current, FDict.Hash(LEnum.Current));
      if LInd >= 0 then
        LFlags[LInd] := True
      else
        Exit(False);
    end;
    for I := 0 to Capacity - 1 do
      if (FDict.FItems[I].HashCode <> EMPTY_HASH) and not LFLags[I] then
        Exit(False);
  finally
    LEnum.Free;
  end;
  Result := True;
end;

function THashSet<T>.IsSubsetOf(const AOther: TEnumerable<T>): Boolean;
var
  LEnum: TEnumerator<T>;
  LInd: NativeInt;
  I: NativeInt;
  LFlags: TArray<Boolean>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if Self = AOther then
    Exit(True);
  LEnum := AOther.GetEnumerator;
  try
    SetLength(LFlags, Capacity);
    while LEnum.MoveNext do
    begin
      LInd := FDict.GetBucketIndex(LEnum.Current, FDict.Hash(LEnum.Current));
      if LInd >= 0 then
        LFlags[LInd] := True;
    end;
    for I := 0 to Capacity - 1 do
      if (FDict.FItems[I].HashCode <> EMPTY_HASH) and not LFlags[I] then
        Exit(False);
  finally
    LEnum.Free;
  end;
  Result := True;
end;

function THashSet<T>.IsSupersetOf(const AOther: TEnumerable<T>): Boolean;
var
  LEnum: TEnumerator<T>;
begin
  if AOther = nil then
    raise EArgumentException.CreateRes(@SArgumentNil);
  if Self = AOther then
    Exit(True);
  LEnum := AOther.GetEnumerator;
  try
    while LEnum.MoveNext do
      if not Contains(LEnum.Current) then
        Exit(False);
  finally
    LEnum.Free;
  end;
  Result := True;
end;

{ TObjectList<T> }

constructor TObjectList<T>.Create;
begin
  Create(True);
end;

constructor TObjectList<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectList<T>.Create(const AComparer: IComparer<T>; AOwnsObjects: Boolean);
begin
  inherited Create(AComparer);
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectList<T>.Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean);
begin
  inherited Create(Collection);
  FOwnsObjects := AOwnsObjects;
end;

destructor TObjectList<T>.Destroy;
begin
  inherited;
end;

procedure TObjectList<T>.Notify(const Value: T; Action: TCollectionNotification);
begin
  inherited;
  if OwnsObjects and (Action = cnRemoved) then
    Value.Free;
end;

{ TObjectQueue<T> }

constructor TObjectQueue<T>.Create;
begin
  Create(True);
end;

constructor TObjectQueue<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectQueue<T>.Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean);
begin
  inherited Create(Collection);
  FOwnsObjects := AOwnsObjects;
end;

procedure TObjectQueue<T>.Dequeue;
begin
  inherited Dequeue;
end;

procedure TObjectQueue<T>.Notify(const Value: T; Action: TCollectionNotification);
begin
  inherited;
  if OwnsObjects and (Action = cnRemoved) then
    Value.Free;
end;

{ TObjectStack<T> }

constructor TObjectStack<T>.Create;
begin
  Create(True);
end;

constructor TObjectStack<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectStack<T>.Create(const Collection: TEnumerable<T>; AOwnsObjects: Boolean);
begin
  inherited Create(Collection);
  FOwnsObjects := AOwnsObjects;
end;

procedure TObjectStack<T>.Notify(const Value: T; Action: TCollectionNotification);
begin
  inherited;
  if OwnsObjects and (Action = cnRemoved) then
    Value.Free;
end;

procedure TObjectStack<T>.Pop;
begin
  inherited Pop;
end;

{ TObjectDictionary<K,V> }

procedure TObjectDictionary<K,V>.KeyNotify(const Key: K; Action: TCollectionNotification);
begin
  inherited;
  if (Action = cnRemoved) and (doOwnsKeys in FOwnerships) then
    PObject(@Key)^.Free;
end;

procedure TObjectDictionary<K,V>.ValueNotify(const Value: V; Action: TCollectionNotification);
begin
  inherited;
  if (Action = cnRemoved) and (doOwnsValues in FOwnerships) then
    PObject(@Value)^.Free;
end;

constructor TObjectDictionary<K,V>.Create(Ownerships: TDictionaryOwnerships;
  ACapacity: NativeInt = 0);
begin
  Create(Ownerships, ACapacity, nil);
end;

constructor TObjectDictionary<K,V>.Create(Ownerships: TDictionaryOwnerships;
  const AComparer: IEqualityComparer<K>);
begin
  Create(Ownerships, 0, AComparer);
end;

constructor TObjectDictionary<K,V>.Create(Ownerships: TDictionaryOwnerships;
  ACapacity: NativeInt; const AComparer: IEqualityComparer<K>);
begin
  inherited Create(ACapacity, AComparer);
  if doOwnsKeys in Ownerships then
  begin
    if (TypeInfo(K) = nil) or (PTypeInfo(TypeInfo(K))^.Kind <> tkClass) then
      raise EInvalidCast.CreateRes(@SInvalidCast);
  end;

  if doOwnsValues in Ownerships then
  begin
    if (TypeInfo(V) = nil) or (PTypeInfo(TypeInfo(V))^.Kind <> tkClass) then
      raise EInvalidCast.CreateRes(@SInvalidCast);
  end;
  FOwnerships := Ownerships;
end;

{ TDictionary<K, V>.TValueCollection }

constructor TDictionary<K, V>.TValueCollection.Create(const ADictionary: TDictionary<K, V>);
begin
  inherited Create;
  FDictionary := ADictionary;
end;

function TDictionary<K, V>.TValueCollection.DoGetEnumerator: TEnumerator<V>;
begin
  Result := GetEnumerator;
end;

function TDictionary<K, V>.TValueCollection.GetCount: NativeInt;
begin
  Result := FDictionary.Count;
end;

function TDictionary<K, V>.TValueCollection.GetEnumerator: TValueEnumerator;
begin
  Result := TValueEnumerator.Create(FDictionary);
end;

function TDictionary<K, V>.TValueCollection.ToArray: TArray<V>;
begin
  Result := ToArrayImpl(FDictionary.Count);
end;

{ TDictionary<K, V>.TKeyCollection }

constructor TDictionary<K, V>.TKeyCollection.Create(
  const ADictionary: TDictionary<K, V>);
begin
  inherited Create;
  FDictionary := ADictionary;
end;

function TDictionary<K, V>.TKeyCollection.DoGetEnumerator: TEnumerator<K>;
begin
  Result := GetEnumerator;
end;

function TDictionary<K, V>.TKeyCollection.GetCount: NativeInt;
begin
  Result := FDictionary.Count;
end;

function TDictionary<K, V>.TKeyCollection.GetEnumerator: TKeyEnumerator;
begin
  Result := TKeyEnumerator.Create(FDictionary);
end;

function TDictionary<K, V>.TKeyCollection.ToArray: TArray<K>;
begin
  Result := ToArrayImpl(FDictionary.Count);
end;

{ TObjectHashSet<T> }

constructor TObjectHashSet<T>.Create(AOwnsObjects: Boolean;
  ACapacity: NativeInt);
begin
  inherited Create(ACapacity);
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectHashSet<T>.Create(AOwnsObjects: Boolean;
  const AComparer: IEqualityComparer<T>);
begin
  inherited Create(AComparer);
  FOwnsObjects := AOwnsObjects;
end;

constructor TObjectHashSet<T>.Create(AOwnsObjects: Boolean;
  ACapacity: NativeInt; const AComparer: IEqualityComparer<T>);
begin
  inherited Create(ACapacity, AComparer);
  FOwnsObjects := AOwnsObjects;
end;

procedure TObjectHashSet<T>.Notify(const Value: T; Action: TCollectionNotification);
begin
  inherited;
  if OwnsObjects and (Action = cnRemoved) then
    Value.Free;
end;

{ TThreadedQueue<T> }

constructor TThreadedQueue<T>.Create(AQueueDepth: Integer = 10; PushTimeout: Cardinal = INFINITE; PopTimeout: Cardinal = INFINITE);
begin
  inherited Create;
  SetLength(FQueue, AQueueDepth);
  FQueueLock := TObject.Create;
  FQueueNotEmpty := TObject.Create;
  FQueueNotFull := TObject.Create;
  FPushTimeout := PushTimeout;
  FPopTimeout := PopTimeout;
end;

destructor TThreadedQueue<T>.Destroy;
begin
  DoShutDown;
  FQueueNotFull.Free;
  FQueueNotEmpty.Free;
  FQueueLock.Free;
  inherited;
end;

{$IF Defined(CPU32BITS)}
function TThreadedQueue<T>.GetTotalItemsPopped: UInt64;
begin
  TMonitor.Enter(FQueueLock);
  try
    Result := FTotalItemsPopped;
  finally
    TMonitor.Exit(FQueueLock);
  end;
end;

function TThreadedQueue<T>.GetTotalItemsPushed: UInt64;
begin
  TMonitor.Enter(FQueueLock);
  try
    Result := FTotalItemsPushed;
  finally
    TMonitor.Exit(FQueueLock);
  end;
end;
{$ENDIF CPU32BITS}

procedure TThreadedQueue<T>.Grow(ADelta: NativeInt);
var
  Ind, PartialLength, OldLength, NewLength: NativeInt;
begin
  TMonitor.Enter(FQueueLock);
  try
    OldLength := Length(FQueue);
    NewLength := OldLength + ADelta;
    if ADelta < 0 then
    begin
      if FQueueSize > NewLength then
        ErrorArgumentOutOfRange
      else if FQueueOffset <> 0 then
      begin
        if (NewLength <= FQueueOffset) then
        begin
          for Ind := FQueueSize - 1 downto 0 do
          begin
            FQueue[Ind] := FQueue[(FQueueOffset + Ind) mod OldLength];
            FQueue[(FQueueOffset + Ind) mod OldLength] := Default(T);
          end;
          FQueueOffset := 0;
        end
        else if (NewLength <= FQueueOffset + FQueueSize - 1) then
        begin
          for Ind := 0 to FQueueSize - 1 do
          begin
            FQueue[Ind] := FQueue[(FQueueOffset + Ind) mod OldLength];
            FQueue[(FQueueOffset + Ind) mod OldLength] := Default(T);
          end;
          FQueueOffset := 0;
        end;
      end;
      SetLength(FQueue, NewLength);
    end
    else if ADelta > 0 then
    begin
      SetLength(FQueue, NewLength);
      PartialLength := OldLength - FQueueOffset;
      if FQueueSize > PartialLength then
      begin
        for Ind := OldLength - 1 downto FQueueOffset do
        begin
          FQueue[Ind + ADelta] := FQueue[Ind];
          FQueue[Ind] := Default(T);
        end;
        FQueueOffset := NewLength - PartialLength;
      end
    end;
  finally
    TMonitor.Exit(FQueueLock);
  end;
  TMonitor.PulseAll(FQueueNotFull);
end;

function TThreadedQueue<T>.PopItem: T;
var
  LQueueSize: NativeInt;
begin
  PopItem(LQueueSize, Result);
end;

function TThreadedQueue<T>.PopItem(out AQueueSize: NativeInt; var AItem: T): TWaitResult;
begin
  AItem := Default(T);
  TMonitor.Enter(FQueueLock);
  try
    Result := wrSignaled;
    while (Result = wrSignaled) and (FQueueSize = 0) and not FShutDown do
      if not TMonitor.Wait(FQueueNotEmpty, FQueueLock, FPopTimeout) then
        Result := wrTimeout;

    if (FShutDown and (FQueueSize = 0)) or (Result <> wrSignaled) then
      Exit;

    AItem := FQueue[FQueueOffset];

    FQueue[FQueueOffset] := Default(T);

    Dec(FQueueSize);
    Inc(FQueueOffset);
    Inc(FTotalItemsPopped);

    if FQueueOffset = Length(FQueue) then
      FQueueOffset := 0;

  finally
    AQueueSize := FQueueSize;
    TMonitor.Exit(FQueueLock);
  end;

  TMonitor.Pulse(FQueueNotFull);
end;

function TThreadedQueue<T>.PopItem(var AItem: T): TWaitResult;
var
  LQueueSize: NativeInt;
begin
  Result := PopItem(LQueueSize, AItem);
end;

function TThreadedQueue<T>.PopItem(out AQueueSize: NativeInt): T;
begin
  PopItem(AQueueSize, Result);
end;

{$IF Defined(CPU64BITS)}
function TThreadedQueue<T>.PopItem(out AQueueSize: Integer): T;
var
  LQueueSize: NativeInt;
begin
  Result := PopItem(LQueueSize);
  if LQueueSize > Integer.MaxValue then
    RangeIndexError(LQueueSize, Integer.MaxValue, Self);
  AQueueSize := LQueueSize;
end;

function TThreadedQueue<T>.PopItem(out AQueueSize: Integer; var AItem: T): TWaitResult;
var
  LQueueSize: NativeInt;
begin
  Result := PopItem(LQueueSize, AItem);
  if LQueueSize > Integer.MaxValue then
    RangeIndexError(LQueueSize, Integer.MaxValue, Self);
  AQueueSize := LQueueSize;
end;
{$ENDIF CPU64BITS}

function TThreadedQueue<T>.PushItem(const AItem: T): TWaitResult;
var
  LQueueSize: NativeInt;
begin
  Result := PushItem(AItem, LQueueSize);
end;

function TThreadedQueue<T>.PushItem(const AItem: T; out AQueueSize: NativeInt): TWaitResult;
begin
  TMonitor.Enter(FQueueLock);
  try
    Result := wrSignaled;
    while (Result = wrSignaled) and (FQueueSize = Length(FQueue)) and not FShutDown do
      if not TMonitor.Wait(FQueueNotFull, FQueueLock, FPushTimeout) then
        Result := wrTimeout;

    if FShutDown or (Result <> wrSignaled) then
      Exit;

    FQueue[(FQueueOffset + FQueueSize) mod Length(FQueue)] := AItem;
    Inc(FQueueSize);
    Inc(FTotalItemsPushed);

  finally
    AQueueSize := FQueueSize;
    TMonitor.Exit(FQueueLock);
  end;

  TMonitor.Pulse(FQueueNotEmpty);
end;

{$IF Defined(CPU64BITS)}
function TThreadedQueue<T>.PushItem(const AItem: T; out AQueueSize: Integer): TWaitResult;
var
  LQueueSize: NativeInt;
begin
  Result := PushItem(AItem, LQueueSize);
  if LQueueSize > Integer.MaxValue then
    RangeIndexError(LQueueSize, Integer.MaxValue, Self);
  AQueueSize := LQueueSize;
end;
{$ENDIF CPU64BITS}

procedure TThreadedQueue<T>.DoShutDown;
begin
  TMonitor.Enter(FQueueLock);
  try
    FShutDown := True;
  finally
    TMonitor.Exit(FQueueLock);
  end;
  TMonitor.PulseAll(FQueueNotFull);
  TMonitor.PulseAll(FQueueNotEmpty);
end;

{ TThreadList<T> }

function TThreadList<T>.LockList: TList<T>;
begin
  TMonitor.Enter(FLock);
  Result := FList;
end;

procedure TThreadList<T>.UnlockList;
begin
  TMonitor.Exit(FLock);
end;

procedure TThreadList<T>.Add(const Item: T);
begin
  LockList;
  try
    if (Duplicates = dupAccept) or
       (FList.IndexOf(Item) = -1) then
      FList.Add(Item)
    else if Duplicates = dupError then
      raise EListError.CreateResFmt(@SDuplicateItem, [FList.ItemValue(Item)]);
  finally
    UnlockList;
  end;
end;

procedure TThreadList<T>.Clear;
begin
  LockList;
  try
    FList.Clear;
  finally
    UnlockList;
  end;
end;

constructor TThreadList<T>.Create;
begin
  inherited Create;
  FLock := TObject.Create;
  FList := TList<T>.Create;
  FDuplicates := dupIgnore;
end;

destructor TThreadList<T>.Destroy;
begin
  LockList;    // Make sure nobody else is inside the list.
  try
    FList.Free;
    inherited Destroy;
  finally
    UnlockList;
    FLock.Free;
  end;
end;

procedure TThreadList<T>.Remove(const Item: T);
begin
  RemoveItem(Item, TDirection.FromBeginning);
end;

procedure TThreadList<T>.RemoveItem(const Item: T; Direction: TDirection);
begin
  LockList;
  try
    FList.RemoveItem(Item, Direction);
  finally
    UnlockList;
  end;
end;

end.
