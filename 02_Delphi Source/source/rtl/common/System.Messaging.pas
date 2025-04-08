{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Messaging;

{$WEAKPACKAGEUNIT OFF}

{$MINENUMSIZE 4}
{$H+}

interface

uses
{$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,
{$ENDIF ANDROID}
{$IFDEF IOS}
  iOSapi.UIKit,
{$ENDIF IOS}
  System.SysUtils, System.Generics.Collections;

type

  /// <summary>Base class for all messages</summary>
  TMessageBase = class abstract;
  TMessage = TMessageBase;
  {$NODEFINE TMessage} // Avoid ambiguity with 'Winapi.Messages.TMessage'

  TMessage<T> = class (TMessage)
  protected
    FValue: T;
  public
    constructor Create(const AValue: T);
    destructor Destroy; override;
    property Value: T read FValue;
  end;

  TObjectMessage<T: class> = class(TMessage<T>)
  protected
    FOwnsObject: Boolean;
  public
    constructor Create(const AValue: T; AOwnsObject: Boolean = True);
    destructor Destroy; override;
  end;

{$IFDEF IOS}
  /// <summary>Received Notification type for NotificationCenter.</summary>
  TMessageReceivedNotification = class(TMessage<UILocalNotification>);
{$ENDIF IOS}

{$IFDEF ANDROID}
  /// <summary>Received Notification type for NotificationCenter.</summary>
  TMessageReceivedNotification = class(TMessage<JIntent>);
{$ENDIF ANDROID}

  TMessageListener = reference to procedure(const Sender: TObject; const M: TMessage);
  TMessageListenerMethod = procedure (const Sender: TObject; const M: TMessage) of object;

  TMessageSubscriptionId = Int64;
  TMessageManager = class;
  TMessageManagerClass = class of TMessageManager;

  { TMessageManager can have many independent instances, but it
    maintains one global instance accessible by TMessageManager.DefaultManager }
  TMessageManager = class
  protected
  type
    TListenerData = class
      Id: TMessageSubscriptionId;
      Listener: TMessageListener;
      ListenerMethod: TMessageListenerMethod;
      MarkedAsRemoved: Boolean;
      constructor Create(const AId: TMessageSubscriptionId; const AListenerMethod: TMessageListenerMethod); overload;
      constructor Create(const AId: TMessageSubscriptionId; const AListener: TMessageListener); overload;
      procedure MarkAsRemoved;
    end;

    TListenerList = class
    private
      FListeners: TObjectList<TListenerData>;
      FIndicies1: TDictionary<TMessageSubscriptionId, TListenerData>;
      FIndicies2: TDictionary<TMessageListener, TListenerData>;
      FIndicies3: TDictionary<TMessageListenerMethod, TListenerData>;
      FProcessing: Integer;
      FRemoveCount: Integer;
      FRemoveThreshold: Integer;
      procedure IterateAndSend(const Sender: TObject; const AMessage: TMessage);
      procedure RemoveDelayed;
      procedure MarkAsRemoved(const AListener: TListenerData);
      procedure Unsubscribe(const AListener: TListenerData); overload;
      procedure RecalculateRemoveThreshold;
    public
      constructor Create;
      destructor Destroy; override;
      function Subscribe(const AId: TMessageSubscriptionId; const AListener: TMessageListener): TMessageSubscriptionId; overload;
      function Subscribe(const AId: TMessageSubscriptionId; const AListenerMethod: TMessageListenerMethod): TMessageSubscriptionId; overload;
      procedure SendMessage(const Sender: TObject; const AMessage: TMessage);
      procedure Unsubscribe(const AId: TMessageSubscriptionId); overload;
      procedure Unsubscribe(const AListener: TMessageListener); overload;
      procedure Unsubscribe(const AListenerMethod: TMessageListenerMethod); overload;
    end;
    TListenerRegistry = TObjectDictionary<TClass, TListenerList>;
  private
    FLastId: TMessageSubscriptionId;
    procedure RegisterMessageClass(const AMessageClass: TClass; var AListeners: TListenerList);
    { Global instance }
    class var FDefaultManager: TMessageManager;
    class var FDefaultManagerClass: TMessageManagerClass;
    class function GetDefaultManager: TMessageManager; static;
  protected
    FListeners: TListenerRegistry;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    class destructor UnInitialize;
    function SubscribeToMessage(const AMessageClass: TClass; const AListener: TMessageListener): TMessageSubscriptionId; overload; virtual;
    function SubscribeToMessage(const AMessageClass: TClass; const AListenerMethod: TMessageListenerMethod): TMessageSubscriptionId; overload; virtual;
    procedure Unsubscribe(const AMessageClass: TClass; Id: TMessageSubscriptionId; Immediate: Boolean = False); overload; virtual;
    procedure Unsubscribe(const AMessageClass: TClass; const AListener: TMessageListener; Immediate: Boolean = False); overload; virtual;
    procedure Unsubscribe(const AMessageClass: TClass; const AListenerMethod: TMessageListenerMethod; Immediate: Boolean = False); overload; virtual;
    procedure SendMessage(const Sender: TObject; AMessage: TMessage); overload;
    procedure SendMessage(const Sender: TObject; AMessage: TMessage; ADispose: Boolean); overload; virtual;
    class property DefaultManager: TMessageManager read GetDefaultManager;
    class property DefaultManagerClass: TMessageManagerClass read FDefaultManagerClass write FDefaultManagerClass;
  end;

implementation

uses System.Types, System.RTLConsts;

{ TMessageManager.TListenerList }

constructor TMessageManager.TListenerList.Create;
begin
  FListeners := TObjectList<TListenerData>.Create;
  FIndicies1 := TDictionary<TMessageSubscriptionId, TListenerData>.Create;
  FIndicies2 := TDictionary<TMessageListener, TListenerData>.Create;
  FIndicies3 := TDictionary<TMessageListenerMethod, TListenerData>.Create;
  FRemoveThreshold := 100;
end;

destructor TMessageManager.TListenerList.Destroy;
begin
  FreeAndNil(FListeners);
  FreeAndNil(FIndicies3);
  FreeAndNil(FIndicies2);
  FreeAndNil(FIndicies1);
  inherited;
end;

procedure TMessageManager.TListenerList.IterateAndSend(const Sender: TObject; const AMessage: TMessage);
var
  Listener: TListenerData;
  List: TList<TListenerData>.arrayofT;
begin
  List := FListeners.List; // Saving List to local variable increase performance. It saves ~10%
  for var I := 0 to FListeners.Count - 1 do
  begin
    Listener := List[I];
    // We don't c check MarkedAsRemoved since we reset all references on listener methods and anonymous procedures.
    // Additional check MarkedAsRemoved reduces performance on ~5%.
    if Assigned(Listener.ListenerMethod) then
      Listener.ListenerMethod(Sender, AMessage)
    else if Assigned(Listener.Listener) then
      Listener.Listener(Sender, AMessage);
  end;
end;

procedure TMessageManager.TListenerList.MarkAsRemoved(const AListener: TListenerData);
begin
  AListener.MarkAsRemoved;
  Inc(FRemoveCount);
end;

procedure TMessageManager.TListenerList.SendMessage(const Sender: TObject; const AMessage: TMessage);
begin
  Inc(FProcessing);
  try
    IterateAndSend(Sender, AMessage);
  finally
    Dec(FProcessing);
  end;

  if (FProcessing = 0) and (FRemoveCount >= FRemoveThreshold) then
    RemoveDelayed;
end;

procedure TMessageManager.TListenerList.RecalculateRemoveThreshold;
begin
  FRemoveThreshold := FIndicies1.Count div 100 * 15 + 1; // Minimum value is 1, so +1
end;

function TMessageManager.TListenerList.Subscribe(const AId: TMessageSubscriptionId; const AListenerMethod: TMessageListenerMethod): TMessageSubscriptionId;
var
  L: TListenerData;
begin
  L := TListenerData.Create(AId, AListenerMethod);
  Result := L.Id;

  TMonitor.Enter(FListeners);
  try
    FListeners.Add(L);
    FIndicies1.Add(AId, L);
    FIndicies3.Add(AListenerMethod, L);
    RecalculateRemoveThreshold;
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.TListenerList.Unsubscribe(const AId: TMessageSubscriptionId);
var
  L: TListenerData;
begin
  if FIndicies1.TryGetValue(AId, L) then
    Unsubscribe(L);
end;

procedure TMessageManager.TListenerList.Unsubscribe(const AListenerMethod: TMessageListenerMethod);
var
  L: TListenerData;
begin
  if FIndicies3.TryGetValue(AListenerMethod, L) then
    Unsubscribe(L);
end;

procedure TMessageManager.TListenerList.Unsubscribe(const AListener: TListenerData);
begin
  FIndicies1.Remove(AListener.id);
  FIndicies2.Remove(AListener.Listener);
  FIndicies3.Remove(AListener.ListenerMethod);

  MarkAsRemoved(AListener);

  if (FProcessing = 0) and (FRemoveCount >= FRemoveThreshold) then
    RemoveDelayed;
end;

procedure TMessageManager.TListenerList.Unsubscribe(const AListener: TMessageListener);
var
  L: TListenerData;
begin
  if FIndicies2.TryGetValue(AListener, L) then
    Unsubscribe(L);
end;

function TMessageManager.TListenerList.Subscribe(const AId: TMessageSubscriptionId; const AListener: TMessageListener): TMessageSubscriptionId;
var
  L: TListenerData;
begin
  L := TListenerData.Create(AId, AListener);
  Result := L.Id;

  TMonitor.Enter(FListeners);
  try
    FListeners.Add(L);
    FIndicies1.Add(AId, L);
    FIndicies2.Add(AListener, L);
    RecalculateRemoveThreshold;
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.TListenerList.RemoveDelayed;
begin
  for var I := FListeners.Count - 1 downto 0 do
    if FListeners[I].MarkedAsRemoved then
      FListeners.Delete(I);

  FRemoveCount := 0;
end;

{ TMessageManager.TListenerData }

constructor TMessageManager.TListenerData.Create(const AId: TMessageSubscriptionId; const AListener: TMessageListener);
begin
  Id := AId;
  Listener := AListener;
end;

constructor TMessageManager.TListenerData.Create(const AId: TMessageSubscriptionId; const AListenerMethod: TMessageListenerMethod);
begin
  Id := AId;
  ListenerMethod := AListenerMethod;
end;

procedure TMessageManager.TListenerData.MarkAsRemoved;
begin
  Id := 0;
  Listener := nil;
  ListenerMethod := nil;
  MarkedAsRemoved := True;
end;

{ TMessageManager }

constructor TMessageManager.Create;
begin
  FListeners := TListenerRegistry.Create([doOwnsValues]);
  FLastId := 1;
end;

destructor TMessageManager.Destroy;
begin
  FListeners.Free;
  inherited;
end;

class function TMessageManager.GetDefaultManager: TMessageManager;
var
  Manager: TMessageManager;
  LDefaultManagerClass: TMessageManagerClass;
begin
  if FDefaultManager = nil then
  begin
    LDefaultManagerClass := FDefaultManagerClass;
    if LDefaultManagerClass = nil then
      LDefaultManagerClass := TMessageManager;
    Manager := LDefaultManagerClass.Create;
    if AtomicCmpExchange(Pointer(FDefaultManager), Pointer(Manager), nil) <> nil then
      Manager.Free;
  end;
  Result := FDefaultManager;
end;

class destructor TMessageManager.UnInitialize;
begin
  FreeAndNil(FDefaultManager);
end;

procedure TMessageManager.RegisterMessageClass(const AMessageClass: TClass; var AListeners: TListenerList);
begin
  if not FListeners.TryGetValue(AMessageClass, AListeners) then
  begin
    AListeners := TListenerList.Create;
    FListeners.Add(AMessageClass, AListeners);
  end;
end;

function TMessageManager.SubscribeToMessage(const AMessageClass: TClass; const AListener: TMessageListener) : TMessageSubscriptionId;
var
  Subscribers: TListenerList;
begin
  TMonitor.Enter(Self);
  try
    RegisterMessageClass(AMessageClass, Subscribers);
    Result := Subscribers.Subscribe(AtomicIncrement(FLastId), AListener);
  finally
    TMonitor.Exit(Self);
  end;
end;

function TMessageManager.SubscribeToMessage(const AMessageClass: TClass; const AListenerMethod: TMessageListenerMethod): TMessageSubscriptionId;
var
  Subscribers: TListenerList;
begin
  TMonitor.Enter(Self);
  try
    RegisterMessageClass(AMessageClass, Subscribers);
    Result := Subscribers.Subscribe(AtomicIncrement(FLastId), AListenerMethod);
  finally
    TMonitor.Exit(Self);
  end;
end;

procedure TMessageManager.Unsubscribe(const AMessageClass: TClass; const AListener: TMessageListener; Immediate: Boolean);
var
  Subscribers: TListenerList;
begin
  TMonitor.Enter(FListeners);
  try
    if FListeners.TryGetValue(AMessageClass, Subscribers) then
      Subscribers.Unsubscribe(AListener);
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.Unsubscribe(const AMessageClass: TClass; const AListenerMethod: TMessageListenerMethod; Immediate: Boolean);
var
  Subscribers: TListenerList;
begin
  TMonitor.Enter(FListeners);
  try
    if FListeners.TryGetValue(AMessageClass, Subscribers) then
      Subscribers.Unsubscribe(AListenerMethod);
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.Unsubscribe(const AMessageClass: TClass; Id: TMessageSubscriptionId; Immediate: Boolean);
var
  Subscribers: TListenerList;
begin
  TMonitor.Enter(FListeners);
  try
    if FListeners.TryGetValue(AMessageClass, Subscribers) then
      Subscribers.Unsubscribe(Id);
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.SendMessage(const Sender: TObject; AMessage: TMessage; ADispose: Boolean);
var
  Subscribers: TListenerList;
begin
  if AMessage = nil then
    raise Exception.CreateRes(@SArgumentInvalid);

  TMonitor.Enter(FListeners);
  try
    try
      if FListeners.TryGetValue(AMessage.ClassType, Subscribers) then
        Subscribers.SendMessage(Sender, AMessage);
    finally
      if ADispose then
        AMessage.Free;
    end;
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TMessageManager.SendMessage(const Sender: TObject; AMessage: TMessage);
begin
  SendMessage(Sender, AMessage, True);
end;

{ TMessage<T> }

constructor TMessage<T>.Create(const AValue: T);
begin
  FValue := AValue;
end;

destructor TMessage<T>.Destroy;
begin
  inherited;  {C++: Anchor Generic destructor}
end;

{ TObjectMessage<T> }

constructor TObjectMessage<T>.Create(const AValue: T; AOwnsObject: Boolean);
begin
  inherited Create(AValue);
  FOwnsObject := AOwnsObject;
end;

destructor TObjectMessage<T>.Destroy;
begin
  if FOwnsObject then
    FValue.Free;
  inherited Destroy;
end;

end.

