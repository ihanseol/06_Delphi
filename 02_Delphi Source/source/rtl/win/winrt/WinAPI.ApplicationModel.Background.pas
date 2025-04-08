{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2020-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ApplicationModel.Background;

{$WEAKPACKAGEUNIT OFF}

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses
  Winapi.Windows,
  Winapi.WinRT,
  System.Types,
  System.Win.WinRT,
  Winapi.CommonTypes,
  Winapi.CommonNames;

{$SCOPEDENUMS ON}

type
  // Alias type definitions for types moved from this unit

  BackgroundTaskCanceledEventHandler = Winapi.CommonTypes.BackgroundTaskCanceledEventHandler;
  PBackgroundTaskCanceledEventHandler = Winapi.CommonTypes.PBackgroundTaskCanceledEventHandler;
  BackgroundTaskCancellationReason = Winapi.CommonTypes.BackgroundTaskCancellationReason;
  PBackgroundTaskCancellationReason = Winapi.CommonTypes.PBackgroundTaskCancellationReason;
  BackgroundTaskCompletedEventHandler = Winapi.CommonTypes.BackgroundTaskCompletedEventHandler;
  PBackgroundTaskCompletedEventHandler = Winapi.CommonTypes.PBackgroundTaskCompletedEventHandler;
  BackgroundTaskProgressEventHandler = Winapi.CommonTypes.BackgroundTaskProgressEventHandler;
  PBackgroundTaskProgressEventHandler = Winapi.CommonTypes.PBackgroundTaskProgressEventHandler;
  IBackgroundTaskCompletedEventArgs = Winapi.CommonTypes.IBackgroundTaskCompletedEventArgs;
  PIBackgroundTaskCompletedEventArgs = Winapi.CommonTypes.PIBackgroundTaskCompletedEventArgs;
  IBackgroundTaskDeferral = Winapi.CommonTypes.IBackgroundTaskDeferral;
  PIBackgroundTaskDeferral = Winapi.CommonTypes.PIBackgroundTaskDeferral;
  IBackgroundTaskInstance = Winapi.CommonTypes.IBackgroundTaskInstance;
  PIBackgroundTaskInstance = Winapi.CommonTypes.PIBackgroundTaskInstance;
  IBackgroundTaskProgressEventArgs = Winapi.CommonTypes.IBackgroundTaskProgressEventArgs;
  PIBackgroundTaskProgressEventArgs = Winapi.CommonTypes.PIBackgroundTaskProgressEventArgs;
  IBackgroundTaskRegistration = Winapi.CommonTypes.IBackgroundTaskRegistration;
  PIBackgroundTaskRegistration = Winapi.CommonTypes.PIBackgroundTaskRegistration;
  IBackgroundTaskRegistrationGroup = Winapi.CommonTypes.IBackgroundTaskRegistrationGroup;
  PIBackgroundTaskRegistrationGroup = Winapi.CommonTypes.PIBackgroundTaskRegistrationGroup;
  IMapView_2__TGuid__IBackgroundTaskRegistration_Base = Winapi.CommonTypes.IMapView_2__TGuid__IBackgroundTaskRegistration_Base;
  IMapView_2__TGuid__IBackgroundTaskRegistration = Winapi.CommonTypes.IMapView_2__TGuid__IBackgroundTaskRegistration;
  PIMapView_2__TGuid__IBackgroundTaskRegistration = Winapi.CommonTypes.PIMapView_2__TGuid__IBackgroundTaskRegistration;

  // Forward declarations for interfaces

  // Windows.ApplicationModel.Background.IBackgroundTrigger
  IBackgroundTrigger = interface;
  PIBackgroundTrigger = ^IBackgroundTrigger;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.AlarmAccessStatus>
  AsyncOperationCompletedHandler_1__AlarmAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__AlarmAccessStatus = ^AsyncOperationCompletedHandler_1__AlarmAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.AlarmAccessStatus>
  IAsyncOperation_1__AlarmAccessStatus = interface;
  PIAsyncOperation_1__AlarmAccessStatus = ^IAsyncOperation_1__AlarmAccessStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.ApplicationTriggerResult>
  AsyncOperationCompletedHandler_1__ApplicationTriggerResult = interface;
  PAsyncOperationCompletedHandler_1__ApplicationTriggerResult = ^AsyncOperationCompletedHandler_1__ApplicationTriggerResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.ApplicationTriggerResult>
  IAsyncOperation_1__ApplicationTriggerResult = interface;
  PIAsyncOperation_1__ApplicationTriggerResult = ^IAsyncOperation_1__ApplicationTriggerResult;

  // Windows.ApplicationModel.Background.IBackgroundCondition
  IBackgroundCondition = interface;
  PIBackgroundCondition = ^IBackgroundCondition;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.BackgroundAccessStatus>
  AsyncOperationCompletedHandler_1__BackgroundAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__BackgroundAccessStatus = ^AsyncOperationCompletedHandler_1__BackgroundAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.BackgroundAccessStatus>
  IAsyncOperation_1__BackgroundAccessStatus = interface;
  PIAsyncOperation_1__BackgroundAccessStatus = ^IAsyncOperation_1__BackgroundAccessStatus;

  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder
  IBackgroundTaskBuilder = interface;
  PIBackgroundTaskBuilder = ^IBackgroundTaskBuilder;

  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder2
  IBackgroundTaskBuilder2 = interface;
  PIBackgroundTaskBuilder2 = ^IBackgroundTaskBuilder2;

  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder3
  IBackgroundTaskBuilder3 = interface;
  PIBackgroundTaskBuilder3 = ^IBackgroundTaskBuilder3;

  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>
  IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface;
  PIKeyValuePair_2__TGuid__IBackgroundTaskRegistration = ^IKeyValuePair_2__TGuid__IBackgroundTaskRegistration;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface;
  PIIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = ^IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface;
  PIIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = ^IIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration;

  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder4
  IBackgroundTaskBuilder4 = interface;
  PIBackgroundTaskBuilder4 = ^IBackgroundTaskBuilder4;

  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder5
  IBackgroundTaskBuilder5 = interface;
  PIBackgroundTaskBuilder5 = ^IBackgroundTaskBuilder5;

  // Windows.ApplicationModel.Background.IBackgroundTaskInstance2
  IBackgroundTaskInstance2 = interface;
  PIBackgroundTaskInstance2 = ^IBackgroundTaskInstance2;

  // Windows.ApplicationModel.Background.IBackgroundTaskInstance4
  IBackgroundTaskInstance4 = interface;
  PIBackgroundTaskInstance4 = ^IBackgroundTaskInstance4;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>
  IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface;
  PIKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = ^IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = ^IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = ^IIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>
  IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup = interface;
  PIMapView_2__HSTRING__IBackgroundTaskRegistrationGroup = ^IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup;

  // Windows.ApplicationModel.Background.IBackgroundWorkCostStatics
  IBackgroundWorkCostStatics = interface;
  PIBackgroundWorkCostStatics = ^IBackgroundWorkCostStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.DeviceTriggerResult>
  AsyncOperationCompletedHandler_1__DeviceTriggerResult = interface;
  PAsyncOperationCompletedHandler_1__DeviceTriggerResult = ^AsyncOperationCompletedHandler_1__DeviceTriggerResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.DeviceTriggerResult>
  IAsyncOperation_1__DeviceTriggerResult = interface;
  PIAsyncOperation_1__DeviceTriggerResult = ^IAsyncOperation_1__DeviceTriggerResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.MediaProcessingTriggerResult>
  AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult = interface;
  PAsyncOperationCompletedHandler_1__MediaProcessingTriggerResult = ^AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.MediaProcessingTriggerResult>
  IAsyncOperation_1__MediaProcessingTriggerResult = interface;
  PIAsyncOperation_1__MediaProcessingTriggerResult = ^IAsyncOperation_1__MediaProcessingTriggerResult;

  // Windows.ApplicationModel.Background Enums

  // Windows.ApplicationModel.Background.AlarmAccessStatus
  AlarmAccessStatus = (
    Unspecified = 0,
    AllowedWithWakeupCapability = 1,
    AllowedWithoutWakeupCapability = 2,
    Denied = 3
  );
  PAlarmAccessStatus = ^AlarmAccessStatus;

  // Windows.ApplicationModel.Background.ApplicationTriggerResult
  ApplicationTriggerResult = (
    Allowed = 0,
    CurrentlyRunning = 1,
    DisabledByPolicy = 2,
    UnknownError = 3
  );
  PApplicationTriggerResult = ^ApplicationTriggerResult;

  // Windows.ApplicationModel.Background.BackgroundAccessRequestKind
  BackgroundAccessRequestKind = (
    AlwaysAllowed = 0,
    AllowedSubjectToSystemPolicy = 1
  );
  PBackgroundAccessRequestKind = ^BackgroundAccessRequestKind;

  // Windows.ApplicationModel.Background.BackgroundAccessStatus
  BackgroundAccessStatus = (
    Unspecified = 0,
    AllowedWithAlwaysOnRealTimeConnectivity = 1,
    AllowedMayUseActiveRealTimeConnectivity = 2,
    Denied = 3,
    AlwaysAllowed = 4,
    AllowedSubjectToSystemPolicy = 5,
    DeniedBySystemPolicy = 6,
    DeniedByUser = 7
  );
  PBackgroundAccessStatus = ^BackgroundAccessStatus;

  // Windows.ApplicationModel.Background.BackgroundTaskThrottleCounter
  BackgroundTaskThrottleCounter = (
    All = 0,
    Cpu = 1,
    Network = 2
  );
  PBackgroundTaskThrottleCounter = ^BackgroundTaskThrottleCounter;

  // Windows.ApplicationModel.Background.BackgroundWorkCostValue
  BackgroundWorkCostValue = (
    Low = 0,
    Medium = 1,
    High = 2
  );
  PBackgroundWorkCostValue = ^BackgroundWorkCostValue;

  // Windows.ApplicationModel.Background.CustomSystemEventTriggerRecurrence
  CustomSystemEventTriggerRecurrence = (
    Once = 0,
    Always = 1
  );
  PCustomSystemEventTriggerRecurrence = ^CustomSystemEventTriggerRecurrence;

  // Windows.ApplicationModel.Background.DeviceTriggerResult
  DeviceTriggerResult = (
    Allowed = 0,
    DeniedByUser = 1,
    DeniedBySystem = 2,
    LowBattery = 3
  );
  PDeviceTriggerResult = ^DeviceTriggerResult;

  // Windows.ApplicationModel.Background.LocationTriggerType
  LocationTriggerType = (
    Geofence = 0
  );
  PLocationTriggerType = ^LocationTriggerType;

  // Windows.ApplicationModel.Background.MediaProcessingTriggerResult
  MediaProcessingTriggerResult = (
    Allowed = 0,
    CurrentlyRunning = 1,
    DisabledByPolicy = 2,
    UnknownError = 3
  );
  PMediaProcessingTriggerResult = ^MediaProcessingTriggerResult;

  // Windows.ApplicationModel.Background.SystemConditionType
  SystemConditionType = (
    Invalid = 0,
    UserPresent = 1,
    UserNotPresent = 2,
    InternetAvailable = 3,
    InternetNotAvailable = 4,
    SessionConnected = 5,
    SessionDisconnected = 6,
    FreeNetworkAvailable = 7,
    BackgroundWorkCostNotHigh = 8
  );
  PSystemConditionType = ^SystemConditionType;

  // Windows.ApplicationModel.Background.SystemTriggerType
  SystemTriggerType = (
    Invalid = 0,
    SmsReceived = 1,
    UserPresent = 2,
    UserAway = 3,
    NetworkStateChange = 4,
    ControlChannelReset = 5,
    InternetAvailable = 6,
    SessionConnected = 7,
    ServicingComplete = 8,
    LockScreenApplicationAdded = 9,
    LockScreenApplicationRemoved = 10,
    TimeZoneChange = 11,
    OnlineIdConnectedStateChange = 12,
    BackgroundWorkCostChange = 13,
    PowerStateChange = 14,
    DefaultSignInAccountChange = 15
  );
  PSystemTriggerType = ^SystemTriggerType;

  // Windows.ApplicationModel.Background Records

  // Windows.ApplicationModel.Background.BackgroundAlarmApplicationContract
  BackgroundAlarmApplicationContract = record
  end;
  PBackgroundAlarmApplicationContract = ^BackgroundAlarmApplicationContract;

  // Windows.ApplicationModel.Background Interfaces

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTrigger
  [WinRTClassNameAttribute(SWindows_ApplicationModel_Background_ConversationalAgentTrigger)]
  IBackgroundTrigger = interface(IInspectable)
  ['{84B3A058-6027-4B87-9790-BDF3F757DBD7}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.AlarmAccessStatus>
  AsyncOperationCompletedHandler_1__AlarmAccessStatus = interface(IUnknown)
  ['{84108017-A8E7-5449-B713-DF48503A953E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__AlarmAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.AlarmAccessStatus>
  IAsyncOperation_1__AlarmAccessStatus = interface(IInspectable)
  ['{A55A747D-59F6-5CB6-B439-C8AAD670905C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__AlarmAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__AlarmAccessStatus; safecall;
    function GetResults: AlarmAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__AlarmAccessStatus read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.ApplicationTriggerResult>
  AsyncOperationCompletedHandler_1__ApplicationTriggerResult = interface(IUnknown)
  ['{D0065EF6-EE9D-55F8-AC2B-53A91FF96D2E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ApplicationTriggerResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.ApplicationTriggerResult>
  IAsyncOperation_1__ApplicationTriggerResult = interface(IInspectable)
  ['{47CBD985-0F08-5A3D-92CF-B27960506ED6}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ApplicationTriggerResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ApplicationTriggerResult; safecall;
    function GetResults: ApplicationTriggerResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ApplicationTriggerResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundCondition
  IBackgroundCondition = interface(IInspectable)
  ['{AE48A1EE-8951-400A-8302-9C9C9A2A3A3B}']
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.BackgroundAccessStatus>
  AsyncOperationCompletedHandler_1__BackgroundAccessStatus = interface(IUnknown)
  ['{26DD26E3-3F47-5709-B2F2-D6D0AD3288F0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__BackgroundAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.BackgroundAccessStatus>
  IAsyncOperation_1__BackgroundAccessStatus = interface(IInspectable)
  ['{7B44E581-CFA9-5763-BED7-6A65739F0DBF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__BackgroundAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__BackgroundAccessStatus; safecall;
    function GetResults: BackgroundAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__BackgroundAccessStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder
  [WinRTClassNameAttribute(SWindows_ApplicationModel_Background_BackgroundTaskBuilder)]
  IBackgroundTaskBuilder = interface(IInspectable)
  ['{0351550E-3E64-4572-A93A-84075A37C917}']
    procedure put_TaskEntryPoint(value: HSTRING); safecall;
    function get_TaskEntryPoint: HSTRING; safecall;
    procedure SetTrigger(trigger: IBackgroundTrigger); safecall;
    procedure AddCondition(condition: IBackgroundCondition); safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Name: HSTRING; safecall;
    function Register: IBackgroundTaskRegistration; safecall;
    property Name: HSTRING read get_Name write put_Name;
    property TaskEntryPoint: HSTRING read get_TaskEntryPoint write put_TaskEntryPoint;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder2
  IBackgroundTaskBuilder2 = interface(IInspectable)
  ['{6AE7CFB1-104F-406D-8DB6-844A570F42BB}']
    procedure put_CancelOnConditionLoss(value: Boolean); safecall;
    function get_CancelOnConditionLoss: Boolean; safecall;
    property CancelOnConditionLoss: Boolean read get_CancelOnConditionLoss write put_CancelOnConditionLoss;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder3
  IBackgroundTaskBuilder3 = interface(IInspectable)
  ['{28C74F4A-8BA9-4C09-A24F-19683E2C924C}']
    procedure put_IsNetworkRequested(value: Boolean); safecall;
    function get_IsNetworkRequested: Boolean; safecall;
    property IsNetworkRequested: Boolean read get_IsNetworkRequested write put_IsNetworkRequested;
  end;

  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>
  IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface(IInspectable)
  ['{5A1F6D75-8678-547C-8FD7-FBCEB6EBF968}']
    function get_Key: TGuid; safecall;
    function get_Value: IBackgroundTaskRegistration; safecall;
    property Key: TGuid read get_Key;
    property Value: IBackgroundTaskRegistration read get_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration_Base = interface(IInspectable)
  ['{8445D2AE-DD03-5B98-95E4-82B43A3F0D64}']
    function get_Current: IKeyValuePair_2__TGuid__IBackgroundTaskRegistration; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__TGuid__IBackgroundTaskRegistration): Cardinal; safecall;
    property Current: IKeyValuePair_2__TGuid__IBackgroundTaskRegistration read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface(IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration_Base)
  ['{2001AEA5-1A86-517E-8BE5-11D7FB5935B2}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration_Base = interface(IInspectable)
  ['{62AE0FDA-B238-554F-A275-1DC16D6CA03A}']
    function First: IIterator_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Windows.ApplicationModel.Background.IBackgroundTaskRegistration>>
  IIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration = interface(IIterable_1__IKeyValuePair_2__TGuid__IBackgroundTaskRegistration_Base)
  ['{80FB0327-5A00-55CC-85DB-A852719981B9}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder4
  IBackgroundTaskBuilder4 = interface(IInspectable)
  ['{4755E522-CBA2-4E35-BD16-A6DA7F1C19AA}']
    function get_TaskGroup: IBackgroundTaskRegistrationGroup; safecall;
    procedure put_TaskGroup(value: IBackgroundTaskRegistrationGroup); safecall;
    property TaskGroup: IBackgroundTaskRegistrationGroup read get_TaskGroup write put_TaskGroup;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundTaskBuilder5
  IBackgroundTaskBuilder5 = interface(IInspectable)
  ['{077103F6-99F5-4AF4-BCAD-4731D0330D43}']
    procedure SetTaskEntryPointClsid(TaskEntryPoint: TGuid); safecall;
  end;

  // Windows.ApplicationModel.Background.IBackgroundTaskInstance2
  IBackgroundTaskInstance2 = interface(IInspectable)
  ['{4F7D0176-0C76-4FB4-896D-5DE1864122F6}']
    function GetThrottleCount(counter: BackgroundTaskThrottleCounter): Cardinal; safecall;
  end;

  // Windows.ApplicationModel.Background.IBackgroundTaskInstance4
  IBackgroundTaskInstance4 = interface(IInspectable)
  ['{7F29F23C-AA04-4B08-97B0-06D874CDABF5}']
    function get_User: IUser; safecall;
    property User: IUser read get_User;
  end;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>
  IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface(IInspectable)
  ['{794B22D2-8D1B-5D8B-A5B4-E723CF91F5C7}']
    function get_Key: HSTRING; safecall;
    function get_Value: IBackgroundTaskRegistrationGroup; safecall;
    property Key: HSTRING read get_Key;
    property Value: IBackgroundTaskRegistrationGroup read get_Value;
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup_Base = interface(IInspectable)
  ['{4C21744B-B583-559D-89F7-D4138CFFFFBC}']
    function get_Current: IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface(IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup_Base)
  ['{DA3B4B23-DEAC-5C27-97AB-55BC2F59DD59}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup_Base = interface(IInspectable)
  ['{04428524-7D54-59B4-BF17-AC57C4CE6B40}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup; safecall;
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>>
  IIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup = interface(IIterable_1__IKeyValuePair_2__HSTRING__IBackgroundTaskRegistrationGroup_Base)
  ['{AE0E8081-C363-5C20-A78F-9F78B301D961}']
  end;

  // Generic Ancestor for:
  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>
  IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup_Base = interface(IInspectable)
  ['{F6A9DC12-01F7-54F0-A257-C404815B9C1C}']
    function Lookup(key: HSTRING): IBackgroundTaskRegistrationGroup; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup; out second: IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup); safecall;
    property Size: Cardinal read get_Size;
  end;
  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup>
  IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup = interface(IMapView_2__HSTRING__IBackgroundTaskRegistrationGroup_Base)
  ['{5B379794-901A-5D3C-95E7-ABFF048C7D02}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  // Windows.ApplicationModel.Background.IBackgroundWorkCostStatics
  [WinRTClassNameAttribute(SWindows_ApplicationModel_Background_BackgroundWorkCost)]
  IBackgroundWorkCostStatics = interface(IInspectable)
  ['{C740A662-C310-4B82-B3E3-3BCFB9E4C77D}']
    function get_CurrentBackgroundWorkCost: BackgroundWorkCostValue; safecall;
    property CurrentBackgroundWorkCost: BackgroundWorkCostValue read get_CurrentBackgroundWorkCost;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.DeviceTriggerResult>
  AsyncOperationCompletedHandler_1__DeviceTriggerResult = interface(IUnknown)
  ['{D5AA9506-1464-57D4-859D-7EE9B26CB1F9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DeviceTriggerResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.DeviceTriggerResult>
  IAsyncOperation_1__DeviceTriggerResult = interface(IInspectable)
  ['{B5136C46-2F2E-511D-9E8E-5EF4DECB1DA7}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DeviceTriggerResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DeviceTriggerResult; safecall;
    function GetResults: DeviceTriggerResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DeviceTriggerResult read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Background.MediaProcessingTriggerResult>
  AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult = interface(IUnknown)
  ['{3814C6A5-2AD1-5875-BED5-5031CD1F50A2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__MediaProcessingTriggerResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Background.MediaProcessingTriggerResult>
  IAsyncOperation_1__MediaProcessingTriggerResult = interface(IInspectable)
  ['{2595482C-1CBF-5691-A30D-2164909C6712}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult; safecall;
    function GetResults: MediaProcessingTriggerResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__MediaProcessingTriggerResult read get_Completed write put_Completed;
  end;

  // Windows.ApplicationModel.Background.BackgroundTaskBuilder
  // DualAPI
  // Implements: Windows.ApplicationModel.Background.IBackgroundTaskBuilder
  // Implements: Windows.ApplicationModel.Background.IBackgroundTaskBuilder2
  // Implements: Windows.ApplicationModel.Background.IBackgroundTaskBuilder3
  // Implements: Windows.ApplicationModel.Background.IBackgroundTaskBuilder4
  // Implements: Windows.ApplicationModel.Background.IBackgroundTaskBuilder5
  // Instantiable: "IBackgroundTaskBuilder"
  TBackgroundTaskBuilder = class(TWinRTGenericImportI<IBackgroundTaskBuilder>) end;

  // Windows.ApplicationModel.Background.BackgroundWorkCost
  // DualAPI
  // Statics: "Windows.ApplicationModel.Background.IBackgroundWorkCostStatics"
  TBackgroundWorkCost = class(TWinRTGenericImportS<IBackgroundWorkCostStatics>)
  public
    // -> IBackgroundWorkCostStatics
    class function get_CurrentBackgroundWorkCost: BackgroundWorkCostValue; static; inline;
    class property CurrentBackgroundWorkCost: BackgroundWorkCostValue read get_CurrentBackgroundWorkCost;
  end;

  // Windows.ApplicationModel.Background.ConversationalAgentTrigger
  // DualAPI
  // Implements: Windows.ApplicationModel.Background.IBackgroundTrigger
  // Instantiable: "IBackgroundTrigger"
  TConversationalAgentTrigger = class(TWinRTGenericImportI<IBackgroundTrigger>) end;

implementation

{ TBackgroundTaskBuilder }

{ TBackgroundWorkCost }

class function TBackgroundWorkCost.get_CurrentBackgroundWorkCost: BackgroundWorkCostValue;
begin
  Result := Statics.get_CurrentBackgroundWorkCost;
end;


{ TConversationalAgentTrigger }

end.
