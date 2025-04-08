{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Media;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAsyncPlayer = interface;//android.media.AsyncPlayer
  JAudioAttributes = interface;//android.media.AudioAttributes
  JAudioAttributes_Builder = interface;//android.media.AudioAttributes$Builder
  JAudioDescriptor = interface;//android.media.AudioDescriptor
  JAudioDeviceCallback = interface;//android.media.AudioDeviceCallback
  JAudioDeviceInfo = interface;//android.media.AudioDeviceInfo
  JAudioFocusRequest = interface;//android.media.AudioFocusRequest
  JAudioFocusRequest_Builder = interface;//android.media.AudioFocusRequest$Builder
  JAudioFormat = interface;//android.media.AudioFormat
  JAudioFormat_Builder = interface;//android.media.AudioFormat$Builder
  JAudioManager = interface;//android.media.AudioManager
  JAudioManager_AudioPlaybackCallback = interface;//android.media.AudioManager$AudioPlaybackCallback
  JAudioManager_AudioRecordingCallback = interface;//android.media.AudioManager$AudioRecordingCallback
  JAudioManager_OnAudioFocusChangeListener = interface;//android.media.AudioManager$OnAudioFocusChangeListener
  JAudioManager_OnCommunicationDeviceChangedListener = interface;//android.media.AudioManager$OnCommunicationDeviceChangedListener
  JAudioManager_OnModeChangedListener = interface;//android.media.AudioManager$OnModeChangedListener
  JAudioMetadata = interface;//android.media.AudioMetadata
  JAudioMetadata_Format = interface;//android.media.AudioMetadata$Format
  JAudioMetadata_Key = interface;//android.media.AudioMetadata$Key
  JAudioMetadataReadMap = interface;//android.media.AudioMetadataReadMap
  JAudioMetadataMap = interface;//android.media.AudioMetadataMap
  JAudioPlaybackCaptureConfiguration = interface;//android.media.AudioPlaybackCaptureConfiguration
  JAudioPlaybackCaptureConfiguration_Builder = interface;//android.media.AudioPlaybackCaptureConfiguration$Builder
  JAudioPlaybackConfiguration = interface;//android.media.AudioPlaybackConfiguration
  JAudioPresentation = interface;//android.media.AudioPresentation
  JAudioPresentation_Builder = interface;//android.media.AudioPresentation$Builder
  JAudioProfile = interface;//android.media.AudioProfile
  JAudioRecord = interface;//android.media.AudioRecord
  JAudioRecord_Builder = interface;//android.media.AudioRecord$Builder
  JAudioRecord_MetricsConstants = interface;//android.media.AudioRecord$MetricsConstants
  JAudioRecord_OnRecordPositionUpdateListener = interface;//android.media.AudioRecord$OnRecordPositionUpdateListener
  JAudioRouting_OnRoutingChangedListener = interface;//android.media.AudioRouting$OnRoutingChangedListener
  JAudioRecord_OnRoutingChangedListener = interface;//android.media.AudioRecord$OnRoutingChangedListener
  JAudioRecordingConfiguration = interface;//android.media.AudioRecordingConfiguration
  JAudioRecordingMonitor = interface;//android.media.AudioRecordingMonitor
  JAudioRouting = interface;//android.media.AudioRouting
  JAudioTimestamp = interface;//android.media.AudioTimestamp
  JAudioTrack = interface;//android.media.AudioTrack
  JAudioTrack_Builder = interface;//android.media.AudioTrack$Builder
  JAudioTrack_MetricsConstants = interface;//android.media.AudioTrack$MetricsConstants
  JAudioTrack_OnCodecFormatChangedListener = interface;//android.media.AudioTrack$OnCodecFormatChangedListener
  JAudioTrack_OnPlaybackPositionUpdateListener = interface;//android.media.AudioTrack$OnPlaybackPositionUpdateListener
  JAudioTrack_OnRoutingChangedListener = interface;//android.media.AudioTrack$OnRoutingChangedListener
  JAudioTrack_StreamEventCallback = interface;//android.media.AudioTrack$StreamEventCallback
  JCamcorderProfile = interface;//android.media.CamcorderProfile
  JCameraProfile = interface;//android.media.CameraProfile
  JMediaDrmException = interface;//android.media.MediaDrmException
  JDeniedByServerException = interface;//android.media.DeniedByServerException
  JDrmInitData = interface;//android.media.DrmInitData
  JDrmInitData_SchemeInitData = interface;//android.media.DrmInitData$SchemeInitData
  JEncoderProfiles = interface;//android.media.EncoderProfiles
  JEncoderProfiles_AudioProfile = interface;//android.media.EncoderProfiles$AudioProfile
  JEncoderProfiles_VideoProfile = interface;//android.media.EncoderProfiles$VideoProfile
  JExifInterface = interface;//android.media.ExifInterface
  JFaceDetector = interface;//android.media.FaceDetector
  JFaceDetector_Face = interface;//android.media.FaceDetector$Face
  JImage = interface;//android.media.Image
  JImage_Plane = interface;//android.media.Image$Plane
  JImageReader = interface;//android.media.ImageReader
  JImageReader_Builder = interface;//android.media.ImageReader$Builder
  JImageReader_OnImageAvailableListener = interface;//android.media.ImageReader$OnImageAvailableListener
  JImageWriter = interface;//android.media.ImageWriter
  JImageWriter_Builder = interface;//android.media.ImageWriter$Builder
  JImageWriter_OnImageReleasedListener = interface;//android.media.ImageWriter$OnImageReleasedListener
  JJetPlayer = interface;//android.media.JetPlayer
  JJetPlayer_OnJetEventListener = interface;//android.media.JetPlayer$OnJetEventListener
  JMediaActionSound = interface;//android.media.MediaActionSound
  JMediaCas = interface;//android.media.MediaCas
  JMediaCas_EventListener = interface;//android.media.MediaCas$EventListener
  JMediaCas_PluginDescriptor = interface;//android.media.MediaCas$PluginDescriptor
  JMediaCas_Session = interface;//android.media.MediaCas$Session
  JMediaCasException = interface;//android.media.MediaCasException
  JMediaCasException_DeniedByServerException = interface;//android.media.MediaCasException$DeniedByServerException
  JMediaCasException_InsufficientResourceException = interface;//android.media.MediaCasException$InsufficientResourceException
  JMediaCasException_NotProvisionedException = interface;//android.media.MediaCasException$NotProvisionedException
  JMediaCasException_ResourceBusyException = interface;//android.media.MediaCasException$ResourceBusyException
  JMediaCasException_UnsupportedCasException = interface;//android.media.MediaCasException$UnsupportedCasException
  JMediaCasStateException = interface;//android.media.MediaCasStateException
  JMediaCodec = interface;//android.media.MediaCodec
  JMediaCodec_BufferInfo = interface;//android.media.MediaCodec$BufferInfo
  JMediaCodec_Callback = interface;//android.media.MediaCodec$Callback
  JMediaCodec_CodecException = interface;//android.media.MediaCodec$CodecException
  JMediaCodec_CryptoException = interface;//android.media.MediaCodec$CryptoException
  JMediaCodec_CryptoInfo = interface;//android.media.MediaCodec$CryptoInfo
  JCryptoInfo_Pattern = interface;//android.media.MediaCodec$CryptoInfo$Pattern
  JMediaCodec_IncompatibleWithBlockModelException = interface;//android.media.MediaCodec$IncompatibleWithBlockModelException
  JMediaCodec_LinearBlock = interface;//android.media.MediaCodec$LinearBlock
  JMediaCodec_MetricsConstants = interface;//android.media.MediaCodec$MetricsConstants
  JMediaCodec_OnFirstTunnelFrameReadyListener = interface;//android.media.MediaCodec$OnFirstTunnelFrameReadyListener
  JMediaCodec_OnFrameRenderedListener = interface;//android.media.MediaCodec$OnFrameRenderedListener
  JMediaCodec_OutputFrame = interface;//android.media.MediaCodec$OutputFrame
  JMediaCodec_ParameterDescriptor = interface;//android.media.MediaCodec$ParameterDescriptor
  JMediaCodec_QueueRequest = interface;//android.media.MediaCodec$QueueRequest
  JMediaCodecInfo = interface;//android.media.MediaCodecInfo
  JMediaCodecInfo_AudioCapabilities = interface;//android.media.MediaCodecInfo$AudioCapabilities
  JMediaCodecInfo_CodecCapabilities = interface;//android.media.MediaCodecInfo$CodecCapabilities
  JMediaCodecInfo_CodecProfileLevel = interface;//android.media.MediaCodecInfo$CodecProfileLevel
  JMediaCodecInfo_EncoderCapabilities = interface;//android.media.MediaCodecInfo$EncoderCapabilities
  JMediaCodecInfo_VideoCapabilities = interface;//android.media.MediaCodecInfo$VideoCapabilities
  JVideoCapabilities_PerformancePoint = interface;//android.media.MediaCodecInfo$VideoCapabilities$PerformancePoint
  JMediaCodecList = interface;//android.media.MediaCodecList
  JMediaCrypto = interface;//android.media.MediaCrypto
  JMediaCryptoException = interface;//android.media.MediaCryptoException
  JMediaDataSource = interface;//android.media.MediaDataSource
  JMediaDescrambler = interface;//android.media.MediaDescrambler
  JMediaDescription = interface;//android.media.MediaDescription
  JMediaDescription_Builder = interface;//android.media.MediaDescription$Builder
  JMediaDrm = interface;//android.media.MediaDrm
  JMediaDrm_CryptoSession = interface;//android.media.MediaDrm$CryptoSession
  JMediaDrm_ErrorCodes = interface;//android.media.MediaDrm$ErrorCodes
  JMediaDrm_HdcpLevel = interface;//android.media.MediaDrm$HdcpLevel
  JMediaDrm_KeyRequest = interface;//android.media.MediaDrm$KeyRequest
  JMediaDrm_KeyStatus = interface;//android.media.MediaDrm$KeyStatus
  JMediaDrm_LogMessage = interface;//android.media.MediaDrm$LogMessage
  JMediaDrm_MediaDrmStateException = interface;//android.media.MediaDrm$MediaDrmStateException
  JMediaDrm_MetricsConstants = interface;//android.media.MediaDrm$MetricsConstants
  JMediaDrm_OnEventListener = interface;//android.media.MediaDrm$OnEventListener
  JMediaDrm_OnExpirationUpdateListener = interface;//android.media.MediaDrm$OnExpirationUpdateListener
  JMediaDrm_OnKeyStatusChangeListener = interface;//android.media.MediaDrm$OnKeyStatusChangeListener
  JMediaDrm_OnSessionLostStateListener = interface;//android.media.MediaDrm$OnSessionLostStateListener
  JMediaDrm_PlaybackComponent = interface;//android.media.MediaDrm$PlaybackComponent
  JMediaDrm_ProvisionRequest = interface;//android.media.MediaDrm$ProvisionRequest
  JMediaDrm_SecurityLevel = interface;//android.media.MediaDrm$SecurityLevel
  JMediaDrm_SessionException = interface;//android.media.MediaDrm$SessionException
  JMediaDrmResetException = interface;//android.media.MediaDrmResetException
  JMediaExtractor = interface;//android.media.MediaExtractor
  JMediaExtractor_CasInfo = interface;//android.media.MediaExtractor$CasInfo
  JMediaExtractor_MetricsConstants = interface;//android.media.MediaExtractor$MetricsConstants
  JMediaFormat = interface;//android.media.MediaFormat
  Jmedia_MediaMetadata = interface;//android.media.MediaMetadata
  JMediaMetadata_Builder = interface;//android.media.MediaMetadata$Builder
  JMediaMetadataEditor = interface;//android.media.MediaMetadataEditor
  JMediaMetadataRetriever = interface;//android.media.MediaMetadataRetriever
  JMediaMetadataRetriever_BitmapParams = interface;//android.media.MediaMetadataRetriever$BitmapParams
  JMediaMuxer = interface;//android.media.MediaMuxer
  JMediaMuxer_OutputFormat = interface;//android.media.MediaMuxer$OutputFormat
  JMediaPlayer = interface;//android.media.MediaPlayer
  JMediaPlayer_DrmInfo = interface;//android.media.MediaPlayer$DrmInfo
  JMediaPlayer_MetricsConstants = interface;//android.media.MediaPlayer$MetricsConstants
  JMediaPlayer_NoDrmSchemeException = interface;//android.media.MediaPlayer$NoDrmSchemeException
  JMediaPlayer_OnBufferingUpdateListener = interface;//android.media.MediaPlayer$OnBufferingUpdateListener
  JMediaPlayer_OnCompletionListener = interface;//android.media.MediaPlayer$OnCompletionListener
  JMediaPlayer_OnDrmConfigHelper = interface;//android.media.MediaPlayer$OnDrmConfigHelper
  JMediaPlayer_OnDrmInfoListener = interface;//android.media.MediaPlayer$OnDrmInfoListener
  JMediaPlayer_OnDrmPreparedListener = interface;//android.media.MediaPlayer$OnDrmPreparedListener
  JMediaPlayer_OnErrorListener = interface;//android.media.MediaPlayer$OnErrorListener
  JMediaPlayer_OnInfoListener = interface;//android.media.MediaPlayer$OnInfoListener
  JMediaPlayer_OnMediaTimeDiscontinuityListener = interface;//android.media.MediaPlayer$OnMediaTimeDiscontinuityListener
  JMediaPlayer_OnPreparedListener = interface;//android.media.MediaPlayer$OnPreparedListener
  JMediaPlayer_OnSeekCompleteListener = interface;//android.media.MediaPlayer$OnSeekCompleteListener
  JMediaPlayer_OnSubtitleDataListener = interface;//android.media.MediaPlayer$OnSubtitleDataListener
  JMediaPlayer_OnTimedMetaDataAvailableListener = interface;//android.media.MediaPlayer$OnTimedMetaDataAvailableListener
  JMediaPlayer_OnTimedTextListener = interface;//android.media.MediaPlayer$OnTimedTextListener
  JMediaPlayer_OnVideoSizeChangedListener = interface;//android.media.MediaPlayer$OnVideoSizeChangedListener
  JMediaPlayer_ProvisioningNetworkErrorException = interface;//android.media.MediaPlayer$ProvisioningNetworkErrorException
  JMediaPlayer_ProvisioningServerErrorException = interface;//android.media.MediaPlayer$ProvisioningServerErrorException
  JMediaPlayer_TrackInfo = interface;//android.media.MediaPlayer$TrackInfo
  JMediaRecorder = interface;//android.media.MediaRecorder
  JMediaRecorder_AudioEncoder = interface;//android.media.MediaRecorder$AudioEncoder
  JMediaRecorder_AudioSource = interface;//android.media.MediaRecorder$AudioSource
  JMediaRecorder_MetricsConstants = interface;//android.media.MediaRecorder$MetricsConstants
  JMediaRecorder_OnErrorListener = interface;//android.media.MediaRecorder$OnErrorListener
  JMediaRecorder_OnInfoListener = interface;//android.media.MediaRecorder$OnInfoListener
  JMediaRecorder_OutputFormat = interface;//android.media.MediaRecorder$OutputFormat
  JMediaRecorder_VideoEncoder = interface;//android.media.MediaRecorder$VideoEncoder
  JMediaRecorder_VideoSource = interface;//android.media.MediaRecorder$VideoSource
  JMediaRoute2Info = interface;//android.media.MediaRoute2Info
  JMediaRoute2Info_Builder = interface;//android.media.MediaRoute2Info$Builder
  JMediaRoute2ProviderService = interface;//android.media.MediaRoute2ProviderService
  JMediaRouter = interface;//android.media.MediaRouter
  JMediaRouter_Callback = interface;//android.media.MediaRouter$Callback
  JMediaRouter_RouteCategory = interface;//android.media.MediaRouter$RouteCategory
  JMediaRouter_RouteInfo = interface;//android.media.MediaRouter$RouteInfo
  JMediaRouter_RouteGroup = interface;//android.media.MediaRouter$RouteGroup
  JMediaRouter_SimpleCallback = interface;//android.media.MediaRouter$SimpleCallback
  JMediaRouter_UserRouteInfo = interface;//android.media.MediaRouter$UserRouteInfo
  JMediaRouter_VolumeCallback = interface;//android.media.MediaRouter$VolumeCallback
  JMediaRouter2 = interface;//android.media.MediaRouter2
  JMediaRouter2_ControllerCallback = interface;//android.media.MediaRouter2$ControllerCallback
  JMediaRouter2_OnGetControllerHintsListener = interface;//android.media.MediaRouter2$OnGetControllerHintsListener
  JMediaRouter2_RouteCallback = interface;//android.media.MediaRouter2$RouteCallback
  JMediaRouter2_RoutingController = interface;//android.media.MediaRouter2$RoutingController
  JMediaRouter2_TransferCallback = interface;//android.media.MediaRouter2$TransferCallback
  JMediaScannerConnection = interface;//android.media.MediaScannerConnection
  JMediaScannerConnection_OnScanCompletedListener = interface;//android.media.MediaScannerConnection$OnScanCompletedListener
  JMediaScannerConnection_MediaScannerConnectionClient = interface;//android.media.MediaScannerConnection$MediaScannerConnectionClient
  JMediaSync = interface;//android.media.MediaSync
  JMediaSync_Callback = interface;//android.media.MediaSync$Callback
  JMediaSync_OnErrorListener = interface;//android.media.MediaSync$OnErrorListener
  JMediaSyncEvent = interface;//android.media.MediaSyncEvent
  JMediaTimestamp = interface;//android.media.MediaTimestamp
  JMicrophoneDirection = interface;//android.media.MicrophoneDirection
  JMicrophoneInfo = interface;//android.media.MicrophoneInfo
  JMicrophoneInfo_Coordinate3F = interface;//android.media.MicrophoneInfo$Coordinate3F
  JNotProvisionedException = interface;//android.media.NotProvisionedException
  JPlaybackParams = interface;//android.media.PlaybackParams
  JRating = interface;//android.media.Rating
  JRemoteControlClient = interface;//android.media.RemoteControlClient
  JRemoteControlClient_MetadataEditor = interface;//android.media.RemoteControlClient$MetadataEditor
  JRemoteControlClient_OnGetPlaybackPositionListener = interface;//android.media.RemoteControlClient$OnGetPlaybackPositionListener
  JRemoteControlClient_OnMetadataUpdateListener = interface;//android.media.RemoteControlClient$OnMetadataUpdateListener
  JRemoteControlClient_OnPlaybackPositionUpdateListener = interface;//android.media.RemoteControlClient$OnPlaybackPositionUpdateListener
  JRemoteController = interface;//android.media.RemoteController
  JRemoteController_MetadataEditor = interface;//android.media.RemoteController$MetadataEditor
  JRemoteController_OnClientUpdateListener = interface;//android.media.RemoteController$OnClientUpdateListener
  JResourceBusyException = interface;//android.media.ResourceBusyException
  JRingtone = interface;//android.media.Ringtone
  JRingtoneManager = interface;//android.media.RingtoneManager
  JRouteDiscoveryPreference = interface;//android.media.RouteDiscoveryPreference
  JRouteDiscoveryPreference_Builder = interface;//android.media.RouteDiscoveryPreference$Builder
  JRoutingSessionInfo = interface;//android.media.RoutingSessionInfo
  JRoutingSessionInfo_Builder = interface;//android.media.RoutingSessionInfo$Builder
  JSoundPool = interface;//android.media.SoundPool
  JSoundPool_Builder = interface;//android.media.SoundPool$Builder
  JSoundPool_OnLoadCompleteListener = interface;//android.media.SoundPool$OnLoadCompleteListener
  JSpatializer = interface;//android.media.Spatializer
  JSpatializer_OnHeadTrackerAvailableListener = interface;//android.media.Spatializer$OnHeadTrackerAvailableListener
  JSpatializer_OnSpatializerStateChangedListener = interface;//android.media.Spatializer$OnSpatializerStateChangedListener
  JSubtitleData = interface;//android.media.SubtitleData
  JSyncParams = interface;//android.media.SyncParams
  JThumbnailUtils = interface;//android.media.ThumbnailUtils
  JTimedMetaData = interface;//android.media.TimedMetaData
  JTimedText = interface;//android.media.TimedText
  JToneGenerator = interface;//android.media.ToneGenerator
  JUnsupportedSchemeException = interface;//android.media.UnsupportedSchemeException
  JVolumeAutomation = interface;//android.media.VolumeAutomation
  JVolumeProvider = interface;//android.media.VolumeProvider
  JVolumeShaper = interface;//android.media.VolumeShaper
  JVolumeShaper_Configuration = interface;//android.media.VolumeShaper$Configuration
  JConfiguration_Builder = interface;//android.media.VolumeShaper$Configuration$Builder
  JVolumeShaper_Operation = interface;//android.media.VolumeShaper$Operation
  JAudioEffect = interface;//android.media.audiofx.AudioEffect
  JAcousticEchoCanceler = interface;//android.media.audiofx.AcousticEchoCanceler
  JAudioEffect_Descriptor = interface;//android.media.audiofx.AudioEffect$Descriptor
  JAudioEffect_OnControlStatusChangeListener = interface;//android.media.audiofx.AudioEffect$OnControlStatusChangeListener
  JAudioEffect_OnEnableStatusChangeListener = interface;//android.media.audiofx.AudioEffect$OnEnableStatusChangeListener
  JAutomaticGainControl = interface;//android.media.audiofx.AutomaticGainControl
  JBassBoost = interface;//android.media.audiofx.BassBoost
  JBassBoost_OnParameterChangeListener = interface;//android.media.audiofx.BassBoost$OnParameterChangeListener
  JBassBoost_Settings = interface;//android.media.audiofx.BassBoost$Settings
  JDynamicsProcessing = interface;//android.media.audiofx.DynamicsProcessing
  JDynamicsProcessing_BandBase = interface;//android.media.audiofx.DynamicsProcessing$BandBase
  JDynamicsProcessing_Stage = interface;//android.media.audiofx.DynamicsProcessing$Stage
  JDynamicsProcessing_BandStage = interface;//android.media.audiofx.DynamicsProcessing$BandStage
  JDynamicsProcessing_Channel = interface;//android.media.audiofx.DynamicsProcessing$Channel
  JDynamicsProcessing_Config = interface;//android.media.audiofx.DynamicsProcessing$Config
  JConfig_Builder = interface;//android.media.audiofx.DynamicsProcessing$Config$Builder
  JDynamicsProcessing_Eq = interface;//android.media.audiofx.DynamicsProcessing$Eq
  JDynamicsProcessing_EqBand = interface;//android.media.audiofx.DynamicsProcessing$EqBand
  JDynamicsProcessing_Limiter = interface;//android.media.audiofx.DynamicsProcessing$Limiter
  JDynamicsProcessing_Mbc = interface;//android.media.audiofx.DynamicsProcessing$Mbc
  JDynamicsProcessing_MbcBand = interface;//android.media.audiofx.DynamicsProcessing$MbcBand
  JEnvironmentalReverb = interface;//android.media.audiofx.EnvironmentalReverb
  JEnvironmentalReverb_OnParameterChangeListener = interface;//android.media.audiofx.EnvironmentalReverb$OnParameterChangeListener
  JEnvironmentalReverb_Settings = interface;//android.media.audiofx.EnvironmentalReverb$Settings
  JEqualizer = interface;//android.media.audiofx.Equalizer
  JEqualizer_OnParameterChangeListener = interface;//android.media.audiofx.Equalizer$OnParameterChangeListener
  JEqualizer_Settings = interface;//android.media.audiofx.Equalizer$Settings
  JHapticGenerator = interface;//android.media.audiofx.HapticGenerator
  JLoudnessEnhancer = interface;//android.media.audiofx.LoudnessEnhancer
  JNoiseSuppressor = interface;//android.media.audiofx.NoiseSuppressor
  JPresetReverb = interface;//android.media.audiofx.PresetReverb
  JPresetReverb_OnParameterChangeListener = interface;//android.media.audiofx.PresetReverb$OnParameterChangeListener
  JPresetReverb_Settings = interface;//android.media.audiofx.PresetReverb$Settings
  JVirtualizer = interface;//android.media.audiofx.Virtualizer
  JVirtualizer_OnParameterChangeListener = interface;//android.media.audiofx.Virtualizer$OnParameterChangeListener
  JVirtualizer_Settings = interface;//android.media.audiofx.Virtualizer$Settings
  JVisualizer = interface;//android.media.audiofx.Visualizer
  JVisualizer_MeasurementPeakRms = interface;//android.media.audiofx.Visualizer$MeasurementPeakRms
  JVisualizer_OnDataCaptureListener = interface;//android.media.audiofx.Visualizer$OnDataCaptureListener
  JMediaBrowser = interface;//android.media.browse.MediaBrowser
  JMediaBrowser_ConnectionCallback = interface;//android.media.browse.MediaBrowser$ConnectionCallback
  JMediaBrowser_ItemCallback = interface;//android.media.browse.MediaBrowser$ItemCallback
  JMediaBrowser_MediaItem = interface;//android.media.browse.MediaBrowser$MediaItem
  JMediaBrowser_SubscriptionCallback = interface;//android.media.browse.MediaBrowser$SubscriptionCallback
  JEffect = interface;//android.media.effect.Effect
  JEffectContext = interface;//android.media.effect.EffectContext
  JEffectFactory = interface;//android.media.effect.EffectFactory
  JEffectUpdateListener = interface;//android.media.effect.EffectUpdateListener
  JBundleSession = interface;//android.media.metrics.BundleSession
  JEditingSession = interface;//android.media.metrics.EditingSession
  Jmetrics_Event = interface;//android.media.metrics.Event
  JLogSessionId = interface;//android.media.metrics.LogSessionId
  JMediaMetricsManager = interface;//android.media.metrics.MediaMetricsManager
  Jmetrics_NetworkEvent = interface;//android.media.metrics.NetworkEvent
  JNetworkEvent_Builder = interface;//android.media.metrics.NetworkEvent$Builder
  JPlaybackErrorEvent = interface;//android.media.metrics.PlaybackErrorEvent
  JPlaybackErrorEvent_Builder = interface;//android.media.metrics.PlaybackErrorEvent$Builder
  JPlaybackMetrics = interface;//android.media.metrics.PlaybackMetrics
  JPlaybackMetrics_Builder = interface;//android.media.metrics.PlaybackMetrics$Builder
  JPlaybackSession = interface;//android.media.metrics.PlaybackSession
  JPlaybackStateEvent = interface;//android.media.metrics.PlaybackStateEvent
  JPlaybackStateEvent_Builder = interface;//android.media.metrics.PlaybackStateEvent$Builder
  JRecordingSession = interface;//android.media.metrics.RecordingSession
  JTrackChangeEvent = interface;//android.media.metrics.TrackChangeEvent
  JTrackChangeEvent_Builder = interface;//android.media.metrics.TrackChangeEvent$Builder
  JTranscodingSession = interface;//android.media.metrics.TranscodingSession
  JMidiDevice = interface;//android.media.midi.MidiDevice
  JMidiDevice_MidiConnection = interface;//android.media.midi.MidiDevice$MidiConnection
  JMidiDeviceInfo = interface;//android.media.midi.MidiDeviceInfo
  JMidiDeviceInfo_PortInfo = interface;//android.media.midi.MidiDeviceInfo$PortInfo
  JMidiDeviceService = interface;//android.media.midi.MidiDeviceService
  JMidiDeviceStatus = interface;//android.media.midi.MidiDeviceStatus
  JMidiReceiver = interface;//android.media.midi.MidiReceiver
  JMidiInputPort = interface;//android.media.midi.MidiInputPort
  JMidiManager = interface;//android.media.midi.MidiManager
  JMidiManager_DeviceCallback = interface;//android.media.midi.MidiManager$DeviceCallback
  JMidiManager_OnDeviceOpenedListener = interface;//android.media.midi.MidiManager$OnDeviceOpenedListener
  JMidiSender = interface;//android.media.midi.MidiSender
  JMidiOutputPort = interface;//android.media.midi.MidiOutputPort
  JMediaProjection = interface;//android.media.projection.MediaProjection
  JMediaProjection_Callback = interface;//android.media.projection.MediaProjection$Callback
  JMediaProjectionManager = interface;//android.media.projection.MediaProjectionManager
  Jsession_MediaController = interface;//android.media.session.MediaController
  JMediaController_Callback = interface;//android.media.session.MediaController$Callback
  JMediaController_PlaybackInfo = interface;//android.media.session.MediaController$PlaybackInfo
  JMediaController_TransportControls = interface;//android.media.session.MediaController$TransportControls
  JMediaSession = interface;//android.media.session.MediaSession
  JMediaSession_Callback = interface;//android.media.session.MediaSession$Callback
  JMediaSession_QueueItem = interface;//android.media.session.MediaSession$QueueItem
  JMediaSession_Token = interface;//android.media.session.MediaSession$Token
  JMediaSessionManager = interface;//android.media.session.MediaSessionManager
  JMediaSessionManager_OnActiveSessionsChangedListener = interface;//android.media.session.MediaSessionManager$OnActiveSessionsChangedListener
  JMediaSessionManager_OnMediaKeyEventSessionChangedListener = interface;//android.media.session.MediaSessionManager$OnMediaKeyEventSessionChangedListener
  JMediaSessionManager_OnSession2TokensChangedListener = interface;//android.media.session.MediaSessionManager$OnSession2TokensChangedListener
  JMediaSessionManager_RemoteUserInfo = interface;//android.media.session.MediaSessionManager$RemoteUserInfo
  JPlaybackState = interface;//android.media.session.PlaybackState
  JPlaybackState_Builder = interface;//android.media.session.PlaybackState$Builder
  JPlaybackState_CustomAction = interface;//android.media.session.PlaybackState$CustomAction
  JCustomAction_Builder = interface;//android.media.session.PlaybackState$CustomAction$Builder
  Jtv_AdRequest = interface;//android.media.tv.AdRequest
  JAdResponse = interface;//android.media.tv.AdResponse
  JAitInfo = interface;//android.media.tv.AitInfo
  JBroadcastInfoRequest = interface;//android.media.tv.BroadcastInfoRequest
  JBroadcastInfoResponse = interface;//android.media.tv.BroadcastInfoResponse
  JCommandRequest = interface;//android.media.tv.CommandRequest
  JCommandResponse = interface;//android.media.tv.CommandResponse
  JDsmccRequest = interface;//android.media.tv.DsmccRequest
  JDsmccResponse = interface;//android.media.tv.DsmccResponse
  JPesRequest = interface;//android.media.tv.PesRequest
  JPesResponse = interface;//android.media.tv.PesResponse
  JSectionRequest = interface;//android.media.tv.SectionRequest
  JSectionResponse = interface;//android.media.tv.SectionResponse
  JStreamEventRequest = interface;//android.media.tv.StreamEventRequest
  JStreamEventResponse = interface;//android.media.tv.StreamEventResponse
  JTableRequest = interface;//android.media.tv.TableRequest
  JTableResponse = interface;//android.media.tv.TableResponse
  JTimelineRequest = interface;//android.media.tv.TimelineRequest
  JTimelineResponse = interface;//android.media.tv.TimelineResponse
  JTsRequest = interface;//android.media.tv.TsRequest
  JTsResponse = interface;//android.media.tv.TsResponse
  JTvContentRating = interface;//android.media.tv.TvContentRating
  JTvContract = interface;//android.media.tv.TvContract
  JTvContract_BaseTvColumns = interface;//android.media.tv.TvContract$BaseTvColumns
  JTvContract_Channels = interface;//android.media.tv.TvContract$Channels
  JChannels_Logo = interface;//android.media.tv.TvContract$Channels$Logo
  JTvContract_PreviewPrograms = interface;//android.media.tv.TvContract$PreviewPrograms
  JTvContract_Programs = interface;//android.media.tv.TvContract$Programs
  JPrograms_Genres = interface;//android.media.tv.TvContract$Programs$Genres
  JTvContract_RecordedPrograms = interface;//android.media.tv.TvContract$RecordedPrograms
  JTvContract_WatchNextPrograms = interface;//android.media.tv.TvContract$WatchNextPrograms
  JTvInputInfo = interface;//android.media.tv.TvInputInfo
  JTvInputInfo_Builder = interface;//android.media.tv.TvInputInfo$Builder
  JTvInputManager = interface;//android.media.tv.TvInputManager
  JTvInputManager_TvInputCallback = interface;//android.media.tv.TvInputManager$TvInputCallback
  JTvInputService = interface;//android.media.tv.TvInputService
  JTvInputService_Session = interface;//android.media.tv.TvInputService$Session
  JTvInputService_HardwareSession = interface;//android.media.tv.TvInputService$HardwareSession
  JTvInputService_RecordingSession = interface;//android.media.tv.TvInputService$RecordingSession
  JTvRecordingClient = interface;//android.media.tv.TvRecordingClient
  JTvRecordingClient_RecordingCallback = interface;//android.media.tv.TvRecordingClient$RecordingCallback
  JTvTrackInfo = interface;//android.media.tv.TvTrackInfo
  JTvTrackInfo_Builder = interface;//android.media.tv.TvTrackInfo$Builder
  JTvView = interface;//android.media.tv.TvView
  JTvView_OnUnhandledInputEventListener = interface;//android.media.tv.TvView$OnUnhandledInputEventListener
  JTvView_TimeShiftPositionCallback = interface;//android.media.tv.TvView$TimeShiftPositionCallback
  JTvView_TvInputCallback = interface;//android.media.tv.TvView$TvInputCallback
  JAppLinkInfo = interface;//android.media.tv.interactive.AppLinkInfo
  JTvInteractiveAppManager = interface;//android.media.tv.interactive.TvInteractiveAppManager
  JTvInteractiveAppManager_TvInteractiveAppCallback = interface;//android.media.tv.interactive.TvInteractiveAppManager$TvInteractiveAppCallback
  JTvInteractiveAppService = interface;//android.media.tv.interactive.TvInteractiveAppService
  JTvInteractiveAppService_Session = interface;//android.media.tv.interactive.TvInteractiveAppService$Session
  JTvInteractiveAppServiceInfo = interface;//android.media.tv.interactive.TvInteractiveAppServiceInfo
  JTvInteractiveAppView = interface;//android.media.tv.interactive.TvInteractiveAppView
  JTvInteractiveAppView_OnUnhandledInputEventListener = interface;//android.media.tv.interactive.TvInteractiveAppView$OnUnhandledInputEventListener
  JTvInteractiveAppView_TvInteractiveAppCallback = interface;//android.media.tv.interactive.TvInteractiveAppView$TvInteractiveAppCallback

// ===== Interface declarations =====

  JAsyncPlayerClass = interface(JObjectClass)
    ['{BF7F601F-6678-4903-B30E-7A73E4EE059C}']
    {class} function init(tag: JString): JAsyncPlayer; cdecl;
  end;

  [JavaSignature('android/media/AsyncPlayer')]
  JAsyncPlayer = interface(JObject)
    ['{8415DF11-11ED-4FA6-8864-F4420519D2C3}']
    procedure play(context: JContext; uri: Jnet_Uri; looping: Boolean; stream: Integer); cdecl; overload;//Deprecated
    procedure play(context: JContext; uri: Jnet_Uri; looping: Boolean; attributes: JAudioAttributes); cdecl; overload;
    procedure stop; cdecl;
  end;
  TJAsyncPlayer = class(TJavaGenericImport<JAsyncPlayerClass, JAsyncPlayer>) end;

  JAudioAttributesClass = interface(JObjectClass)
    ['{1EB61050-2F9F-4FC2-93C7-98AE576B5DD2}']
    {class} function _GetALLOW_CAPTURE_BY_ALL: Integer; cdecl;
    {class} function _GetALLOW_CAPTURE_BY_NONE: Integer; cdecl;
    {class} function _GetALLOW_CAPTURE_BY_SYSTEM: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MOVIE: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MUSIC: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_SONIFICATION: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_SPEECH: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFLAG_AUDIBILITY_ENFORCED: Integer; cdecl;
    {class} function _GetFLAG_HW_AV_SYNC: Integer; cdecl;
    {class} function _GetFLAG_LOW_LATENCY: Integer; cdecl;
    {class} function _GetSPATIALIZATION_BEHAVIOR_AUTO: Integer; cdecl;
    {class} function _GetSPATIALIZATION_BEHAVIOR_NEVER: Integer; cdecl;
    {class} function _GetUSAGE_ALARM: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_ACCESSIBILITY: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_NAVIGATION_GUIDANCE: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_SONIFICATION: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANT: Integer; cdecl;
    {class} function _GetUSAGE_GAME: Integer; cdecl;
    {class} function _GetUSAGE_MEDIA: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_DELAYED: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_INSTANT: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_REQUEST: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_EVENT: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_RINGTONE: Integer; cdecl;
    {class} function _GetUSAGE_UNKNOWN: Integer; cdecl;
    {class} function _GetUSAGE_VOICE_COMMUNICATION: Integer; cdecl;
    {class} function _GetUSAGE_VOICE_COMMUNICATION_SIGNALLING: Integer; cdecl;
    {class} property ALLOW_CAPTURE_BY_ALL: Integer read _GetALLOW_CAPTURE_BY_ALL;
    {class} property ALLOW_CAPTURE_BY_NONE: Integer read _GetALLOW_CAPTURE_BY_NONE;
    {class} property ALLOW_CAPTURE_BY_SYSTEM: Integer read _GetALLOW_CAPTURE_BY_SYSTEM;
    {class} property CONTENT_TYPE_MOVIE: Integer read _GetCONTENT_TYPE_MOVIE;
    {class} property CONTENT_TYPE_MUSIC: Integer read _GetCONTENT_TYPE_MUSIC;
    {class} property CONTENT_TYPE_SONIFICATION: Integer read _GetCONTENT_TYPE_SONIFICATION;
    {class} property CONTENT_TYPE_SPEECH: Integer read _GetCONTENT_TYPE_SPEECH;
    {class} property CONTENT_TYPE_UNKNOWN: Integer read _GetCONTENT_TYPE_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FLAG_AUDIBILITY_ENFORCED: Integer read _GetFLAG_AUDIBILITY_ENFORCED;
    {class} property FLAG_HW_AV_SYNC: Integer read _GetFLAG_HW_AV_SYNC;
    {class} property FLAG_LOW_LATENCY: Integer read _GetFLAG_LOW_LATENCY;
    {class} property SPATIALIZATION_BEHAVIOR_AUTO: Integer read _GetSPATIALIZATION_BEHAVIOR_AUTO;
    {class} property SPATIALIZATION_BEHAVIOR_NEVER: Integer read _GetSPATIALIZATION_BEHAVIOR_NEVER;
    {class} property USAGE_ALARM: Integer read _GetUSAGE_ALARM;
    {class} property USAGE_ASSISTANCE_ACCESSIBILITY: Integer read _GetUSAGE_ASSISTANCE_ACCESSIBILITY;
    {class} property USAGE_ASSISTANCE_NAVIGATION_GUIDANCE: Integer read _GetUSAGE_ASSISTANCE_NAVIGATION_GUIDANCE;
    {class} property USAGE_ASSISTANCE_SONIFICATION: Integer read _GetUSAGE_ASSISTANCE_SONIFICATION;
    {class} property USAGE_ASSISTANT: Integer read _GetUSAGE_ASSISTANT;
    {class} property USAGE_GAME: Integer read _GetUSAGE_GAME;
    {class} property USAGE_MEDIA: Integer read _GetUSAGE_MEDIA;
    {class} property USAGE_NOTIFICATION: Integer read _GetUSAGE_NOTIFICATION;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_DELAYED: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_DELAYED;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_INSTANT: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_INSTANT;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_REQUEST: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_REQUEST;
    {class} property USAGE_NOTIFICATION_EVENT: Integer read _GetUSAGE_NOTIFICATION_EVENT;
    {class} property USAGE_NOTIFICATION_RINGTONE: Integer read _GetUSAGE_NOTIFICATION_RINGTONE;
    {class} property USAGE_UNKNOWN: Integer read _GetUSAGE_UNKNOWN;
    {class} property USAGE_VOICE_COMMUNICATION: Integer read _GetUSAGE_VOICE_COMMUNICATION;
    {class} property USAGE_VOICE_COMMUNICATION_SIGNALLING: Integer read _GetUSAGE_VOICE_COMMUNICATION_SIGNALLING;
  end;

  [JavaSignature('android/media/AudioAttributes')]
  JAudioAttributes = interface(JObject)
    ['{880D30F3-3AE2-43F2-979B-9D0E182C20AC}']
    function areHapticChannelsMuted: Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAllowedCapturePolicy: Integer; cdecl;
    function getContentType: Integer; cdecl;
    function getFlags: Integer; cdecl;
    function getSpatializationBehavior: Integer; cdecl;
    function getUsage: Integer; cdecl;
    function getVolumeControlStream: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isContentSpatialized: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioAttributes = class(TJavaGenericImport<JAudioAttributesClass, JAudioAttributes>) end;

  JAudioAttributes_BuilderClass = interface(JObjectClass)
    ['{A6B7A372-3DD3-4E59-8C9B-301154CD330D}']
    {class} function init: JAudioAttributes_Builder; cdecl; overload;
    {class} function init(aa: JAudioAttributes): JAudioAttributes_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/AudioAttributes$Builder')]
  JAudioAttributes_Builder = interface(JObject)
    ['{D73EC2B2-C044-4DF8-9190-64F781958EA9}']
    function build: JAudioAttributes; cdecl;
    function setAllowedCapturePolicy(capturePolicy: Integer): JAudioAttributes_Builder; cdecl;
    function setContentType(contentType: Integer): JAudioAttributes_Builder; cdecl;
    function setFlags(flags: Integer): JAudioAttributes_Builder; cdecl;
    function setHapticChannelsMuted(muted: Boolean): JAudioAttributes_Builder; cdecl;
    function setIsContentSpatialized(isSpatialized: Boolean): JAudioAttributes_Builder; cdecl;
    function setLegacyStreamType(streamType: Integer): JAudioAttributes_Builder; cdecl;
    function setSpatializationBehavior(sb: Integer): JAudioAttributes_Builder; cdecl;
    function setUsage(usage: Integer): JAudioAttributes_Builder; cdecl;
  end;
  TJAudioAttributes_Builder = class(TJavaGenericImport<JAudioAttributes_BuilderClass, JAudioAttributes_Builder>) end;

  JAudioDescriptorClass = interface(JObjectClass)
    ['{4D7EB789-6F8E-4E89-A91F-277FE0CF83F9}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSTANDARD_EDID: Integer; cdecl;
    {class} function _GetSTANDARD_NONE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property STANDARD_EDID: Integer read _GetSTANDARD_EDID;
    {class} property STANDARD_NONE: Integer read _GetSTANDARD_NONE;
  end;

  [JavaSignature('android/media/AudioDescriptor')]
  JAudioDescriptor = interface(JObject)
    ['{FFB0BF4E-DD71-4BC9-90CF-88EB34B22CF3}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDescriptor: TJavaArray<Byte>; cdecl;
    function getEncapsulationType: Integer; cdecl;
    function getStandard: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioDescriptor = class(TJavaGenericImport<JAudioDescriptorClass, JAudioDescriptor>) end;

  JAudioDeviceCallbackClass = interface(JObjectClass)
    ['{FC684049-9A6C-43C6-9B21-E906EED4BD3C}']
    {class} function init: JAudioDeviceCallback; cdecl;
  end;

  [JavaSignature('android/media/AudioDeviceCallback')]
  JAudioDeviceCallback = interface(JObject)
    ['{9118880E-E444-46F1-9B46-89C30E87E51B}']
    procedure onAudioDevicesAdded(addedDevices: TJavaObjectArray<JAudioDeviceInfo>); cdecl;
    procedure onAudioDevicesRemoved(removedDevices: TJavaObjectArray<JAudioDeviceInfo>); cdecl;
  end;
  TJAudioDeviceCallback = class(TJavaGenericImport<JAudioDeviceCallbackClass, JAudioDeviceCallback>) end;

  JAudioDeviceInfoClass = interface(JObjectClass)
    ['{68C9A2CC-486D-4E1B-B35A-9CCC72AE4CAE}']
    {class} function _GetTYPE_AUX_LINE: Integer; cdecl;
    {class} function _GetTYPE_BLE_BROADCAST: Integer; cdecl;
    {class} function _GetTYPE_BLE_HEADSET: Integer; cdecl;
    {class} function _GetTYPE_BLE_SPEAKER: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH_A2DP: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH_SCO: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_EARPIECE: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_MIC: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_SPEAKER: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_SPEAKER_SAFE: Integer; cdecl;
    {class} function _GetTYPE_BUS: Integer; cdecl;
    {class} function _GetTYPE_DOCK: Integer; cdecl;
    {class} function _GetTYPE_FM: Integer; cdecl;
    {class} function _GetTYPE_FM_TUNER: Integer; cdecl;
    {class} function _GetTYPE_HDMI: Integer; cdecl;
    {class} function _GetTYPE_HDMI_ARC: Integer; cdecl;
    {class} function _GetTYPE_HDMI_EARC: Integer; cdecl;
    {class} function _GetTYPE_HEARING_AID: Integer; cdecl;
    {class} function _GetTYPE_IP: Integer; cdecl;
    {class} function _GetTYPE_LINE_ANALOG: Integer; cdecl;
    {class} function _GetTYPE_LINE_DIGITAL: Integer; cdecl;
    {class} function _GetTYPE_REMOTE_SUBMIX: Integer; cdecl;
    {class} function _GetTYPE_TELEPHONY: Integer; cdecl;
    {class} function _GetTYPE_TV_TUNER: Integer; cdecl;
    {class} function _GetTYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetTYPE_USB_ACCESSORY: Integer; cdecl;
    {class} function _GetTYPE_USB_DEVICE: Integer; cdecl;
    {class} function _GetTYPE_USB_HEADSET: Integer; cdecl;
    {class} function _GetTYPE_WIRED_HEADPHONES: Integer; cdecl;
    {class} function _GetTYPE_WIRED_HEADSET: Integer; cdecl;
    {class} property TYPE_AUX_LINE: Integer read _GetTYPE_AUX_LINE;
    {class} property TYPE_BLE_BROADCAST: Integer read _GetTYPE_BLE_BROADCAST;
    {class} property TYPE_BLE_HEADSET: Integer read _GetTYPE_BLE_HEADSET;
    {class} property TYPE_BLE_SPEAKER: Integer read _GetTYPE_BLE_SPEAKER;
    {class} property TYPE_BLUETOOTH_A2DP: Integer read _GetTYPE_BLUETOOTH_A2DP;
    {class} property TYPE_BLUETOOTH_SCO: Integer read _GetTYPE_BLUETOOTH_SCO;
    {class} property TYPE_BUILTIN_EARPIECE: Integer read _GetTYPE_BUILTIN_EARPIECE;
    {class} property TYPE_BUILTIN_MIC: Integer read _GetTYPE_BUILTIN_MIC;
    {class} property TYPE_BUILTIN_SPEAKER: Integer read _GetTYPE_BUILTIN_SPEAKER;
    {class} property TYPE_BUILTIN_SPEAKER_SAFE: Integer read _GetTYPE_BUILTIN_SPEAKER_SAFE;
    {class} property TYPE_BUS: Integer read _GetTYPE_BUS;
    {class} property TYPE_DOCK: Integer read _GetTYPE_DOCK;
    {class} property TYPE_FM: Integer read _GetTYPE_FM;
    {class} property TYPE_FM_TUNER: Integer read _GetTYPE_FM_TUNER;
    {class} property TYPE_HDMI: Integer read _GetTYPE_HDMI;
    {class} property TYPE_HDMI_ARC: Integer read _GetTYPE_HDMI_ARC;
    {class} property TYPE_HDMI_EARC: Integer read _GetTYPE_HDMI_EARC;
    {class} property TYPE_HEARING_AID: Integer read _GetTYPE_HEARING_AID;
    {class} property TYPE_IP: Integer read _GetTYPE_IP;
    {class} property TYPE_LINE_ANALOG: Integer read _GetTYPE_LINE_ANALOG;
    {class} property TYPE_LINE_DIGITAL: Integer read _GetTYPE_LINE_DIGITAL;
    {class} property TYPE_REMOTE_SUBMIX: Integer read _GetTYPE_REMOTE_SUBMIX;
    {class} property TYPE_TELEPHONY: Integer read _GetTYPE_TELEPHONY;
    {class} property TYPE_TV_TUNER: Integer read _GetTYPE_TV_TUNER;
    {class} property TYPE_UNKNOWN: Integer read _GetTYPE_UNKNOWN;
    {class} property TYPE_USB_ACCESSORY: Integer read _GetTYPE_USB_ACCESSORY;
    {class} property TYPE_USB_DEVICE: Integer read _GetTYPE_USB_DEVICE;
    {class} property TYPE_USB_HEADSET: Integer read _GetTYPE_USB_HEADSET;
    {class} property TYPE_WIRED_HEADPHONES: Integer read _GetTYPE_WIRED_HEADPHONES;
    {class} property TYPE_WIRED_HEADSET: Integer read _GetTYPE_WIRED_HEADSET;
  end;

  [JavaSignature('android/media/AudioDeviceInfo')]
  JAudioDeviceInfo = interface(JObject)
    ['{F90AC375-3BA3-4AEE-8154-DCCDF7114348}']
    function equals(o: JObject): Boolean; cdecl;
    function getAddress: JString; cdecl;
    function getAudioDescriptors: JList; cdecl;
    function getAudioProfiles: JList; cdecl;
    function getChannelCounts: TJavaArray<Integer>; cdecl;
    function getChannelIndexMasks: TJavaArray<Integer>; cdecl;
    function getChannelMasks: TJavaArray<Integer>; cdecl;
    function getEncapsulationMetadataTypes: TJavaArray<Integer>; cdecl;
    function getEncapsulationModes: TJavaArray<Integer>; cdecl;
    function getEncodings: TJavaArray<Integer>; cdecl;
    function getId: Integer; cdecl;
    function getProductName: JCharSequence; cdecl;
    function getSampleRates: TJavaArray<Integer>; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isSink: Boolean; cdecl;
    function isSource: Boolean; cdecl;
  end;
  TJAudioDeviceInfo = class(TJavaGenericImport<JAudioDeviceInfoClass, JAudioDeviceInfo>) end;

  JAudioFocusRequestClass = interface(JObjectClass)
    ['{5F6C909B-7643-4F93-8269-B9232901B3EF}']
  end;

  [JavaSignature('android/media/AudioFocusRequest')]
  JAudioFocusRequest = interface(JObject)
    ['{AC5FF5DE-25FF-44FA-860A-B5364EF53CC4}']
    function acceptsDelayedFocusGain: Boolean; cdecl;
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getFocusGain: Integer; cdecl;
    function willPauseWhenDucked: Boolean; cdecl;
  end;
  TJAudioFocusRequest = class(TJavaGenericImport<JAudioFocusRequestClass, JAudioFocusRequest>) end;

  JAudioFocusRequest_BuilderClass = interface(JObjectClass)
    ['{6F328AFF-6F6E-471A-BE18-4246125A4C6D}']
    {class} function init(focusGain: Integer): JAudioFocusRequest_Builder; cdecl; overload;
    {class} function init(requestToCopy: JAudioFocusRequest): JAudioFocusRequest_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/AudioFocusRequest$Builder')]
  JAudioFocusRequest_Builder = interface(JObject)
    ['{F73C9EE0-49EF-4544-8372-3EDAD5D07F00}']
    function build: JAudioFocusRequest; cdecl;
    function setAcceptsDelayedFocusGain(acceptsDelayedFocusGain: Boolean): JAudioFocusRequest_Builder; cdecl;
    function setAudioAttributes(attributes: JAudioAttributes): JAudioFocusRequest_Builder; cdecl;
    function setFocusGain(focusGain: Integer): JAudioFocusRequest_Builder; cdecl;
    function setForceDucking(forceDucking: Boolean): JAudioFocusRequest_Builder; cdecl;
    function setOnAudioFocusChangeListener(listener: JAudioManager_OnAudioFocusChangeListener): JAudioFocusRequest_Builder; cdecl; overload;
    function setOnAudioFocusChangeListener(listener: JAudioManager_OnAudioFocusChangeListener; handler: JHandler): JAudioFocusRequest_Builder; cdecl; overload;
    function setWillPauseWhenDucked(pauseOnDuck: Boolean): JAudioFocusRequest_Builder; cdecl;
  end;
  TJAudioFocusRequest_Builder = class(TJavaGenericImport<JAudioFocusRequest_BuilderClass, JAudioFocusRequest_Builder>) end;

  JAudioFormatClass = interface(JObjectClass)
    ['{C173E007-9835-486C-AA1A-700127383914}']
    {class} function _GetCHANNEL_CONFIGURATION_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_INVALID: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_INVALID: Integer; cdecl;
    {class} function _GetCHANNEL_IN_BACK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_BACK_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_FRONT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_FRONT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_LEFT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_IN_PRESSURE: Integer; cdecl;
    {class} function _GetCHANNEL_IN_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_RIGHT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_IN_VOICE_DNLINK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_VOICE_UPLINK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_X_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_IN_Y_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_IN_Z_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_5POINT1: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_5POINT1POINT2: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_5POINT1POINT4: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1POINT2: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1POINT4: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1_SURROUND: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_9POINT1POINT4: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_9POINT1POINT6: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BOTTOM_FRONT_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BOTTOM_FRONT_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BOTTOM_FRONT_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_LEFT_OF_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_RIGHT_OF_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_WIDE_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_WIDE_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_LOW_FREQUENCY: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_LOW_FREQUENCY_2: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_QUAD: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SIDE_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SIDE_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SURROUND: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_BACK_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_BACK_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_BACK_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_FRONT_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_FRONT_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_FRONT_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_SIDE_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_TOP_SIDE_RIGHT: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetENCODING_AAC_ELD: Integer; cdecl;
    {class} function _GetENCODING_AAC_HE_V1: Integer; cdecl;
    {class} function _GetENCODING_AAC_HE_V2: Integer; cdecl;
    {class} function _GetENCODING_AAC_LC: Integer; cdecl;
    {class} function _GetENCODING_AAC_XHE: Integer; cdecl;
    {class} function _GetENCODING_AC3: Integer; cdecl;
    {class} function _GetENCODING_AC4: Integer; cdecl;
    {class} function _GetENCODING_DEFAULT: Integer; cdecl;
    {class} function _GetENCODING_DOLBY_MAT: Integer; cdecl;
    {class} function _GetENCODING_DOLBY_TRUEHD: Integer; cdecl;
    {class} function _GetENCODING_DRA: Integer; cdecl;
    {class} function _GetENCODING_DTS: Integer; cdecl;
    {class} function _GetENCODING_DTS_HD: Integer; cdecl;
    {class} function _GetENCODING_DTS_UHD: Integer; cdecl;
    {class} function _GetENCODING_E_AC3: Integer; cdecl;
    {class} function _GetENCODING_E_AC3_JOC: Integer; cdecl;
    {class} function _GetENCODING_IEC61937: Integer; cdecl;
    {class} function _GetENCODING_INVALID: Integer; cdecl;
    {class} function _GetENCODING_MP3: Integer; cdecl;
    {class} function _GetENCODING_MPEGH_BL_L3: Integer; cdecl;
    {class} function _GetENCODING_MPEGH_BL_L4: Integer; cdecl;
    {class} function _GetENCODING_MPEGH_LC_L3: Integer; cdecl;
    {class} function _GetENCODING_MPEGH_LC_L4: Integer; cdecl;
    {class} function _GetENCODING_OPUS: Integer; cdecl;
    {class} function _GetENCODING_PCM_16BIT: Integer; cdecl;
    {class} function _GetENCODING_PCM_24BIT_PACKED: Integer; cdecl;
    {class} function _GetENCODING_PCM_32BIT: Integer; cdecl;
    {class} function _GetENCODING_PCM_8BIT: Integer; cdecl;
    {class} function _GetENCODING_PCM_FLOAT: Integer; cdecl;
    {class} function _GetSAMPLE_RATE_UNSPECIFIED: Integer; cdecl;
    {class} function init: JAudioFormat; cdecl;
    {class} property CHANNEL_CONFIGURATION_DEFAULT: Integer read _GetCHANNEL_CONFIGURATION_DEFAULT;
    {class} property CHANNEL_CONFIGURATION_INVALID: Integer read _GetCHANNEL_CONFIGURATION_INVALID;
    {class} property CHANNEL_CONFIGURATION_MONO: Integer read _GetCHANNEL_CONFIGURATION_MONO;
    {class} property CHANNEL_CONFIGURATION_STEREO: Integer read _GetCHANNEL_CONFIGURATION_STEREO;
    {class} property CHANNEL_INVALID: Integer read _GetCHANNEL_INVALID;
    {class} property CHANNEL_IN_BACK: Integer read _GetCHANNEL_IN_BACK;
    {class} property CHANNEL_IN_BACK_PROCESSED: Integer read _GetCHANNEL_IN_BACK_PROCESSED;
    {class} property CHANNEL_IN_DEFAULT: Integer read _GetCHANNEL_IN_DEFAULT;
    {class} property CHANNEL_IN_FRONT: Integer read _GetCHANNEL_IN_FRONT;
    {class} property CHANNEL_IN_FRONT_PROCESSED: Integer read _GetCHANNEL_IN_FRONT_PROCESSED;
    {class} property CHANNEL_IN_LEFT: Integer read _GetCHANNEL_IN_LEFT;
    {class} property CHANNEL_IN_LEFT_PROCESSED: Integer read _GetCHANNEL_IN_LEFT_PROCESSED;
    {class} property CHANNEL_IN_MONO: Integer read _GetCHANNEL_IN_MONO;
    {class} property CHANNEL_IN_PRESSURE: Integer read _GetCHANNEL_IN_PRESSURE;
    {class} property CHANNEL_IN_RIGHT: Integer read _GetCHANNEL_IN_RIGHT;
    {class} property CHANNEL_IN_RIGHT_PROCESSED: Integer read _GetCHANNEL_IN_RIGHT_PROCESSED;
    {class} property CHANNEL_IN_STEREO: Integer read _GetCHANNEL_IN_STEREO;
    {class} property CHANNEL_IN_VOICE_DNLINK: Integer read _GetCHANNEL_IN_VOICE_DNLINK;
    {class} property CHANNEL_IN_VOICE_UPLINK: Integer read _GetCHANNEL_IN_VOICE_UPLINK;
    {class} property CHANNEL_IN_X_AXIS: Integer read _GetCHANNEL_IN_X_AXIS;
    {class} property CHANNEL_IN_Y_AXIS: Integer read _GetCHANNEL_IN_Y_AXIS;
    {class} property CHANNEL_IN_Z_AXIS: Integer read _GetCHANNEL_IN_Z_AXIS;
    {class} property CHANNEL_OUT_5POINT1: Integer read _GetCHANNEL_OUT_5POINT1;
    {class} property CHANNEL_OUT_5POINT1POINT2: Integer read _GetCHANNEL_OUT_5POINT1POINT2;
    {class} property CHANNEL_OUT_5POINT1POINT4: Integer read _GetCHANNEL_OUT_5POINT1POINT4;
    {class} property CHANNEL_OUT_7POINT1: Integer read _GetCHANNEL_OUT_7POINT1;
    {class} property CHANNEL_OUT_7POINT1POINT2: Integer read _GetCHANNEL_OUT_7POINT1POINT2;
    {class} property CHANNEL_OUT_7POINT1POINT4: Integer read _GetCHANNEL_OUT_7POINT1POINT4;
    {class} property CHANNEL_OUT_7POINT1_SURROUND: Integer read _GetCHANNEL_OUT_7POINT1_SURROUND;
    {class} property CHANNEL_OUT_9POINT1POINT4: Integer read _GetCHANNEL_OUT_9POINT1POINT4;
    {class} property CHANNEL_OUT_9POINT1POINT6: Integer read _GetCHANNEL_OUT_9POINT1POINT6;
    {class} property CHANNEL_OUT_BACK_CENTER: Integer read _GetCHANNEL_OUT_BACK_CENTER;
    {class} property CHANNEL_OUT_BACK_LEFT: Integer read _GetCHANNEL_OUT_BACK_LEFT;
    {class} property CHANNEL_OUT_BACK_RIGHT: Integer read _GetCHANNEL_OUT_BACK_RIGHT;
    {class} property CHANNEL_OUT_BOTTOM_FRONT_CENTER: Integer read _GetCHANNEL_OUT_BOTTOM_FRONT_CENTER;
    {class} property CHANNEL_OUT_BOTTOM_FRONT_LEFT: Integer read _GetCHANNEL_OUT_BOTTOM_FRONT_LEFT;
    {class} property CHANNEL_OUT_BOTTOM_FRONT_RIGHT: Integer read _GetCHANNEL_OUT_BOTTOM_FRONT_RIGHT;
    {class} property CHANNEL_OUT_DEFAULT: Integer read _GetCHANNEL_OUT_DEFAULT;
    {class} property CHANNEL_OUT_FRONT_CENTER: Integer read _GetCHANNEL_OUT_FRONT_CENTER;
    {class} property CHANNEL_OUT_FRONT_LEFT: Integer read _GetCHANNEL_OUT_FRONT_LEFT;
    {class} property CHANNEL_OUT_FRONT_LEFT_OF_CENTER: Integer read _GetCHANNEL_OUT_FRONT_LEFT_OF_CENTER;
    {class} property CHANNEL_OUT_FRONT_RIGHT: Integer read _GetCHANNEL_OUT_FRONT_RIGHT;
    {class} property CHANNEL_OUT_FRONT_RIGHT_OF_CENTER: Integer read _GetCHANNEL_OUT_FRONT_RIGHT_OF_CENTER;
    {class} property CHANNEL_OUT_FRONT_WIDE_LEFT: Integer read _GetCHANNEL_OUT_FRONT_WIDE_LEFT;
    {class} property CHANNEL_OUT_FRONT_WIDE_RIGHT: Integer read _GetCHANNEL_OUT_FRONT_WIDE_RIGHT;
    {class} property CHANNEL_OUT_LOW_FREQUENCY: Integer read _GetCHANNEL_OUT_LOW_FREQUENCY;
    {class} property CHANNEL_OUT_LOW_FREQUENCY_2: Integer read _GetCHANNEL_OUT_LOW_FREQUENCY_2;
    {class} property CHANNEL_OUT_MONO: Integer read _GetCHANNEL_OUT_MONO;
    {class} property CHANNEL_OUT_QUAD: Integer read _GetCHANNEL_OUT_QUAD;
    {class} property CHANNEL_OUT_SIDE_LEFT: Integer read _GetCHANNEL_OUT_SIDE_LEFT;
    {class} property CHANNEL_OUT_SIDE_RIGHT: Integer read _GetCHANNEL_OUT_SIDE_RIGHT;
    {class} property CHANNEL_OUT_STEREO: Integer read _GetCHANNEL_OUT_STEREO;
    {class} property CHANNEL_OUT_SURROUND: Integer read _GetCHANNEL_OUT_SURROUND;
    {class} property CHANNEL_OUT_TOP_BACK_CENTER: Integer read _GetCHANNEL_OUT_TOP_BACK_CENTER;
    {class} property CHANNEL_OUT_TOP_BACK_LEFT: Integer read _GetCHANNEL_OUT_TOP_BACK_LEFT;
    {class} property CHANNEL_OUT_TOP_BACK_RIGHT: Integer read _GetCHANNEL_OUT_TOP_BACK_RIGHT;
    {class} property CHANNEL_OUT_TOP_CENTER: Integer read _GetCHANNEL_OUT_TOP_CENTER;
    {class} property CHANNEL_OUT_TOP_FRONT_CENTER: Integer read _GetCHANNEL_OUT_TOP_FRONT_CENTER;
    {class} property CHANNEL_OUT_TOP_FRONT_LEFT: Integer read _GetCHANNEL_OUT_TOP_FRONT_LEFT;
    {class} property CHANNEL_OUT_TOP_FRONT_RIGHT: Integer read _GetCHANNEL_OUT_TOP_FRONT_RIGHT;
    {class} property CHANNEL_OUT_TOP_SIDE_LEFT: Integer read _GetCHANNEL_OUT_TOP_SIDE_LEFT;
    {class} property CHANNEL_OUT_TOP_SIDE_RIGHT: Integer read _GetCHANNEL_OUT_TOP_SIDE_RIGHT;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property ENCODING_AAC_ELD: Integer read _GetENCODING_AAC_ELD;
    {class} property ENCODING_AAC_HE_V1: Integer read _GetENCODING_AAC_HE_V1;
    {class} property ENCODING_AAC_HE_V2: Integer read _GetENCODING_AAC_HE_V2;
    {class} property ENCODING_AAC_LC: Integer read _GetENCODING_AAC_LC;
    {class} property ENCODING_AAC_XHE: Integer read _GetENCODING_AAC_XHE;
    {class} property ENCODING_AC3: Integer read _GetENCODING_AC3;
    {class} property ENCODING_AC4: Integer read _GetENCODING_AC4;
    {class} property ENCODING_Default: Integer read _GetENCODING_DEFAULT;
    {class} property ENCODING_DOLBY_MAT: Integer read _GetENCODING_DOLBY_MAT;
    {class} property ENCODING_DOLBY_TRUEHD: Integer read _GetENCODING_DOLBY_TRUEHD;
    {class} property ENCODING_DRA: Integer read _GetENCODING_DRA;
    {class} property ENCODING_DTS: Integer read _GetENCODING_DTS;
    {class} property ENCODING_DTS_HD: Integer read _GetENCODING_DTS_HD;
    {class} property ENCODING_DTS_UHD: Integer read _GetENCODING_DTS_UHD;
    {class} property ENCODING_E_AC3: Integer read _GetENCODING_E_AC3;
    {class} property ENCODING_E_AC3_JOC: Integer read _GetENCODING_E_AC3_JOC;
    {class} property ENCODING_IEC61937: Integer read _GetENCODING_IEC61937;
    {class} property ENCODING_INVALID: Integer read _GetENCODING_INVALID;
    {class} property ENCODING_MP3: Integer read _GetENCODING_MP3;
    {class} property ENCODING_MPEGH_BL_L3: Integer read _GetENCODING_MPEGH_BL_L3;
    {class} property ENCODING_MPEGH_BL_L4: Integer read _GetENCODING_MPEGH_BL_L4;
    {class} property ENCODING_MPEGH_LC_L3: Integer read _GetENCODING_MPEGH_LC_L3;
    {class} property ENCODING_MPEGH_LC_L4: Integer read _GetENCODING_MPEGH_LC_L4;
    {class} property ENCODING_OPUS: Integer read _GetENCODING_OPUS;
    {class} property ENCODING_PCM_16BIT: Integer read _GetENCODING_PCM_16BIT;
    {class} property ENCODING_PCM_24BIT_PACKED: Integer read _GetENCODING_PCM_24BIT_PACKED;
    {class} property ENCODING_PCM_32BIT: Integer read _GetENCODING_PCM_32BIT;
    {class} property ENCODING_PCM_8BIT: Integer read _GetENCODING_PCM_8BIT;
    {class} property ENCODING_PCM_FLOAT: Integer read _GetENCODING_PCM_FLOAT;
    {class} property SAMPLE_RATE_UNSPECIFIED: Integer read _GetSAMPLE_RATE_UNSPECIFIED;
  end;

  [JavaSignature('android/media/AudioFormat')]
  JAudioFormat = interface(JObject)
    ['{54729F91-CB43-4106-8A44-08A8FFF26397}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getChannelCount: Integer; cdecl;
    function getChannelIndexMask: Integer; cdecl;
    function getChannelMask: Integer; cdecl;
    function getEncoding: Integer; cdecl;
    function getFrameSizeInBytes: Integer; cdecl;
    function getSampleRate: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioFormat = class(TJavaGenericImport<JAudioFormatClass, JAudioFormat>) end;

  JAudioFormat_BuilderClass = interface(JObjectClass)
    ['{BAEECE3B-32C1-4F49-B6E8-2BA548854362}']
    {class} function init: JAudioFormat_Builder; cdecl; overload;
    {class} function init(af: JAudioFormat): JAudioFormat_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/AudioFormat$Builder')]
  JAudioFormat_Builder = interface(JObject)
    ['{136DA67F-AE5A-488C-8B36-0F6876B261ED}']
    function build: JAudioFormat; cdecl;
    function setChannelIndexMask(channelIndexMask: Integer): JAudioFormat_Builder; cdecl;
    function setChannelMask(channelMask: Integer): JAudioFormat_Builder; cdecl;
    function setEncoding(encoding: Integer): JAudioFormat_Builder; cdecl;
    function setSampleRate(sampleRate: Integer): JAudioFormat_Builder; cdecl;
  end;
  TJAudioFormat_Builder = class(TJavaGenericImport<JAudioFormat_BuilderClass, JAudioFormat_Builder>) end;

  JAudioManagerClass = interface(JObjectClass)
    ['{9CE5F205-F003-485F-AF71-8F0DAB8346B8}']
    {class} function _GetACTION_AUDIO_BECOMING_NOISY: JString; cdecl;
    {class} function _GetACTION_HDMI_AUDIO_PLUG: JString; cdecl;
    {class} function _GetACTION_HEADSET_PLUG: JString; cdecl;
    {class} function _GetACTION_MICROPHONE_MUTE_CHANGED: JString; cdecl;
    {class} function _GetACTION_SCO_AUDIO_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_SCO_AUDIO_STATE_UPDATED: JString; cdecl;
    {class} function _GetACTION_SPEAKERPHONE_STATE_CHANGED: JString; cdecl;
    {class} function _GetADJUST_LOWER: Integer; cdecl;
    {class} function _GetADJUST_MUTE: Integer; cdecl;
    {class} function _GetADJUST_RAISE: Integer; cdecl;
    {class} function _GetADJUST_SAME: Integer; cdecl;
    {class} function _GetADJUST_TOGGLE_MUTE: Integer; cdecl;
    {class} function _GetADJUST_UNMUTE: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS_TRANSIENT: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_NONE: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_REQUEST_DELAYED: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_REQUEST_FAILED: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_REQUEST_GRANTED: Integer; cdecl;
    {class} function _GetAUDIO_SESSION_ID_GENERATE: Integer; cdecl;
    {class} function _GetDIRECT_PLAYBACK_BITSTREAM_SUPPORTED: Integer; cdecl;
    {class} function _GetDIRECT_PLAYBACK_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetDIRECT_PLAYBACK_OFFLOAD_GAPLESS_SUPPORTED: Integer; cdecl;
    {class} function _GetDIRECT_PLAYBACK_OFFLOAD_SUPPORTED: Integer; cdecl;
    {class} function _GetENCODED_SURROUND_OUTPUT_ALWAYS: Integer; cdecl;
    {class} function _GetENCODED_SURROUND_OUTPUT_AUTO: Integer; cdecl;
    {class} function _GetENCODED_SURROUND_OUTPUT_MANUAL: Integer; cdecl;
    {class} function _GetENCODED_SURROUND_OUTPUT_NEVER: Integer; cdecl;
    {class} function _GetENCODED_SURROUND_OUTPUT_UNKNOWN: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetEXTRA_AUDIO_PLUG_STATE: JString; cdecl;
    {class} function _GetEXTRA_ENCODINGS: JString; cdecl;
    {class} function _GetEXTRA_MAX_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetEXTRA_RINGER_MODE: JString; cdecl;
    {class} function _GetEXTRA_SCO_AUDIO_PREVIOUS_STATE: JString; cdecl;
    {class} function _GetEXTRA_SCO_AUDIO_STATE: JString; cdecl;
    {class} function _GetEXTRA_VIBRATE_SETTING: JString; cdecl;
    {class} function _GetEXTRA_VIBRATE_TYPE: JString; cdecl;
    {class} function _GetFLAG_ALLOW_RINGER_MODES: Integer; cdecl;
    {class} function _GetFLAG_PLAY_SOUND: Integer; cdecl;
    {class} function _GetFLAG_REMOVE_SOUND_AND_VIBRATE: Integer; cdecl;
    {class} function _GetFLAG_SHOW_UI: Integer; cdecl;
    {class} function _GetFLAG_VIBRATE: Integer; cdecl;
    {class} function _GetFX_BACK: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_DOWN: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_LEFT: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_RIGHT: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_UP: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_DELETE: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_INVALID: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_RETURN: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_SPACEBAR: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_STANDARD: Integer; cdecl;
    {class} function _GetFX_KEY_CLICK: Integer; cdecl;
    {class} function _GetGET_DEVICES_ALL: Integer; cdecl;
    {class} function _GetGET_DEVICES_INPUTS: Integer; cdecl;
    {class} function _GetGET_DEVICES_OUTPUTS: Integer; cdecl;
    {class} function _GetMODE_CALL_REDIRECT: Integer; cdecl;
    {class} function _GetMODE_CALL_SCREENING: Integer; cdecl;
    {class} function _GetMODE_COMMUNICATION_REDIRECT: Integer; cdecl;
    {class} function _GetMODE_CURRENT: Integer; cdecl;
    {class} function _GetMODE_INVALID: Integer; cdecl;
    {class} function _GetMODE_IN_CALL: Integer; cdecl;
    {class} function _GetMODE_IN_COMMUNICATION: Integer; cdecl;
    {class} function _GetMODE_NORMAL: Integer; cdecl;
    {class} function _GetMODE_RINGTONE: Integer; cdecl;
    {class} function _GetNUM_STREAMS: Integer; cdecl;
    {class} function _GetPLAYBACK_OFFLOAD_GAPLESS_SUPPORTED: Integer; cdecl;
    {class} function _GetPLAYBACK_OFFLOAD_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetPLAYBACK_OFFLOAD_SUPPORTED: Integer; cdecl;
    {class} function _GetPROPERTY_OUTPUT_FRAMES_PER_BUFFER: JString; cdecl;
    {class} function _GetPROPERTY_OUTPUT_SAMPLE_RATE: JString; cdecl;
    {class} function _GetPROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED: JString; cdecl;
    {class} function _GetPROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND: JString; cdecl;
    {class} function _GetPROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND: JString; cdecl;
    {class} function _GetRINGER_MODE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetRINGER_MODE_NORMAL: Integer; cdecl;
    {class} function _GetRINGER_MODE_SILENT: Integer; cdecl;
    {class} function _GetRINGER_MODE_VIBRATE: Integer; cdecl;
    {class} function _GetROUTE_ALL: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH_A2DP: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH_SCO: Integer; cdecl;
    {class} function _GetROUTE_EARPIECE: Integer; cdecl;
    {class} function _GetROUTE_HEADSET: Integer; cdecl;
    {class} function _GetROUTE_SPEAKER: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_CONNECTING: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_ERROR: Integer; cdecl;
    {class} function _GetSTREAM_ACCESSIBILITY: Integer; cdecl;
    {class} function _GetSTREAM_ALARM: Integer; cdecl;
    {class} function _GetSTREAM_DTMF: Integer; cdecl;
    {class} function _GetSTREAM_MUSIC: Integer; cdecl;
    {class} function _GetSTREAM_NOTIFICATION: Integer; cdecl;
    {class} function _GetSTREAM_RING: Integer; cdecl;
    {class} function _GetSTREAM_SYSTEM: Integer; cdecl;
    {class} function _GetSTREAM_VOICE_CALL: Integer; cdecl;
    {class} function _GetUSE_DEFAULT_STREAM_TYPE: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_CHANGED_ACTION: JString; cdecl;
    {class} function _GetVIBRATE_SETTING_OFF: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_ON: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_ONLY_SILENT: Integer; cdecl;
    {class} function _GetVIBRATE_TYPE_NOTIFICATION: Integer; cdecl;
    {class} function _GetVIBRATE_TYPE_RINGER: Integer; cdecl;
    {class} function getDirectPlaybackSupport(format: JAudioFormat; attributes: JAudioAttributes): Integer; cdecl;
    {class} function getPlaybackOffloadSupport(format: JAudioFormat; attributes: JAudioAttributes): Integer; cdecl;//Deprecated
    {class} function isHapticPlaybackSupported: Boolean; cdecl;
    {class} function isOffloadedPlaybackSupported(format: JAudioFormat; attributes: JAudioAttributes): Boolean; cdecl;
    {class} property ACTION_AUDIO_BECOMING_NOISY: JString read _GetACTION_AUDIO_BECOMING_NOISY;
    {class} property ACTION_HDMI_AUDIO_PLUG: JString read _GetACTION_HDMI_AUDIO_PLUG;
    {class} property ACTION_HEADSET_PLUG: JString read _GetACTION_HEADSET_PLUG;
    {class} property ACTION_MICROPHONE_MUTE_CHANGED: JString read _GetACTION_MICROPHONE_MUTE_CHANGED;
    {class} property ACTION_SCO_AUDIO_STATE_CHANGED: JString read _GetACTION_SCO_AUDIO_STATE_CHANGED;
    {class} property ACTION_SCO_AUDIO_STATE_UPDATED: JString read _GetACTION_SCO_AUDIO_STATE_UPDATED;
    {class} property ACTION_SPEAKERPHONE_STATE_CHANGED: JString read _GetACTION_SPEAKERPHONE_STATE_CHANGED;
    {class} property ADJUST_LOWER: Integer read _GetADJUST_LOWER;
    {class} property ADJUST_MUTE: Integer read _GetADJUST_MUTE;
    {class} property ADJUST_RAISE: Integer read _GetADJUST_RAISE;
    {class} property ADJUST_SAME: Integer read _GetADJUST_SAME;
    {class} property ADJUST_TOGGLE_MUTE: Integer read _GetADJUST_TOGGLE_MUTE;
    {class} property ADJUST_UNMUTE: Integer read _GetADJUST_UNMUTE;
    {class} property AUDIOFOCUS_GAIN: Integer read _GetAUDIOFOCUS_GAIN;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK;
    {class} property AUDIOFOCUS_LOSS: Integer read _GetAUDIOFOCUS_LOSS;
    {class} property AUDIOFOCUS_LOSS_TRANSIENT: Integer read _GetAUDIOFOCUS_LOSS_TRANSIENT;
    {class} property AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK: Integer read _GetAUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
    {class} property AUDIOFOCUS_NONE: Integer read _GetAUDIOFOCUS_NONE;
    {class} property AUDIOFOCUS_REQUEST_DELAYED: Integer read _GetAUDIOFOCUS_REQUEST_DELAYED;
    {class} property AUDIOFOCUS_REQUEST_FAILED: Integer read _GetAUDIOFOCUS_REQUEST_FAILED;
    {class} property AUDIOFOCUS_REQUEST_GRANTED: Integer read _GetAUDIOFOCUS_REQUEST_GRANTED;
    {class} property AUDIO_SESSION_ID_GENERATE: Integer read _GetAUDIO_SESSION_ID_GENERATE;
    {class} property DIRECT_PLAYBACK_BITSTREAM_SUPPORTED: Integer read _GetDIRECT_PLAYBACK_BITSTREAM_SUPPORTED;
    {class} property DIRECT_PLAYBACK_NOT_SUPPORTED: Integer read _GetDIRECT_PLAYBACK_NOT_SUPPORTED;
    {class} property DIRECT_PLAYBACK_OFFLOAD_GAPLESS_SUPPORTED: Integer read _GetDIRECT_PLAYBACK_OFFLOAD_GAPLESS_SUPPORTED;
    {class} property DIRECT_PLAYBACK_OFFLOAD_SUPPORTED: Integer read _GetDIRECT_PLAYBACK_OFFLOAD_SUPPORTED;
    {class} property ENCODED_SURROUND_OUTPUT_ALWAYS: Integer read _GetENCODED_SURROUND_OUTPUT_ALWAYS;
    {class} property ENCODED_SURROUND_OUTPUT_AUTO: Integer read _GetENCODED_SURROUND_OUTPUT_AUTO;
    {class} property ENCODED_SURROUND_OUTPUT_MANUAL: Integer read _GetENCODED_SURROUND_OUTPUT_MANUAL;
    {class} property ENCODED_SURROUND_OUTPUT_NEVER: Integer read _GetENCODED_SURROUND_OUTPUT_NEVER;
    {class} property ENCODED_SURROUND_OUTPUT_UNKNOWN: Integer read _GetENCODED_SURROUND_OUTPUT_UNKNOWN;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property EXTRA_AUDIO_PLUG_STATE: JString read _GetEXTRA_AUDIO_PLUG_STATE;
    {class} property EXTRA_ENCODINGS: JString read _GetEXTRA_ENCODINGS;
    {class} property EXTRA_MAX_CHANNEL_COUNT: JString read _GetEXTRA_MAX_CHANNEL_COUNT;
    {class} property EXTRA_RINGER_MODE: JString read _GetEXTRA_RINGER_MODE;
    {class} property EXTRA_SCO_AUDIO_PREVIOUS_STATE: JString read _GetEXTRA_SCO_AUDIO_PREVIOUS_STATE;
    {class} property EXTRA_SCO_AUDIO_STATE: JString read _GetEXTRA_SCO_AUDIO_STATE;
    {class} property EXTRA_VIBRATE_SETTING: JString read _GetEXTRA_VIBRATE_SETTING;
    {class} property EXTRA_VIBRATE_TYPE: JString read _GetEXTRA_VIBRATE_TYPE;
    {class} property FLAG_ALLOW_RINGER_MODES: Integer read _GetFLAG_ALLOW_RINGER_MODES;
    {class} property FLAG_PLAY_SOUND: Integer read _GetFLAG_PLAY_SOUND;
    {class} property FLAG_REMOVE_SOUND_AND_VIBRATE: Integer read _GetFLAG_REMOVE_SOUND_AND_VIBRATE;
    {class} property FLAG_SHOW_UI: Integer read _GetFLAG_SHOW_UI;
    {class} property FLAG_VIBRATE: Integer read _GetFLAG_VIBRATE;
    {class} property FX_BACK: Integer read _GetFX_BACK;
    {class} property FX_FOCUS_NAVIGATION_DOWN: Integer read _GetFX_FOCUS_NAVIGATION_DOWN;
    {class} property FX_FOCUS_NAVIGATION_LEFT: Integer read _GetFX_FOCUS_NAVIGATION_LEFT;
    {class} property FX_FOCUS_NAVIGATION_RIGHT: Integer read _GetFX_FOCUS_NAVIGATION_RIGHT;
    {class} property FX_FOCUS_NAVIGATION_UP: Integer read _GetFX_FOCUS_NAVIGATION_UP;
    {class} property FX_KEYPRESS_DELETE: Integer read _GetFX_KEYPRESS_DELETE;
    {class} property FX_KEYPRESS_INVALID: Integer read _GetFX_KEYPRESS_INVALID;
    {class} property FX_KEYPRESS_RETURN: Integer read _GetFX_KEYPRESS_RETURN;
    {class} property FX_KEYPRESS_SPACEBAR: Integer read _GetFX_KEYPRESS_SPACEBAR;
    {class} property FX_KEYPRESS_STANDARD: Integer read _GetFX_KEYPRESS_STANDARD;
    {class} property FX_KEY_CLICK: Integer read _GetFX_KEY_CLICK;
    {class} property GET_DEVICES_ALL: Integer read _GetGET_DEVICES_ALL;
    {class} property GET_DEVICES_INPUTS: Integer read _GetGET_DEVICES_INPUTS;
    {class} property GET_DEVICES_OUTPUTS: Integer read _GetGET_DEVICES_OUTPUTS;
    {class} property MODE_CALL_REDIRECT: Integer read _GetMODE_CALL_REDIRECT;
    {class} property MODE_CALL_SCREENING: Integer read _GetMODE_CALL_SCREENING;
    {class} property MODE_COMMUNICATION_REDIRECT: Integer read _GetMODE_COMMUNICATION_REDIRECT;
    {class} property MODE_CURRENT: Integer read _GetMODE_CURRENT;
    {class} property MODE_INVALID: Integer read _GetMODE_INVALID;
    {class} property MODE_IN_CALL: Integer read _GetMODE_IN_CALL;
    {class} property MODE_IN_COMMUNICATION: Integer read _GetMODE_IN_COMMUNICATION;
    {class} property MODE_NORMAL: Integer read _GetMODE_NORMAL;
    {class} property MODE_RINGTONE: Integer read _GetMODE_RINGTONE;
    {class} property NUM_STREAMS: Integer read _GetNUM_STREAMS;
    {class} property PLAYBACK_OFFLOAD_GAPLESS_SUPPORTED: Integer read _GetPLAYBACK_OFFLOAD_GAPLESS_SUPPORTED;
    {class} property PLAYBACK_OFFLOAD_NOT_SUPPORTED: Integer read _GetPLAYBACK_OFFLOAD_NOT_SUPPORTED;
    {class} property PLAYBACK_OFFLOAD_SUPPORTED: Integer read _GetPLAYBACK_OFFLOAD_SUPPORTED;
    {class} property PROPERTY_OUTPUT_FRAMES_PER_BUFFER: JString read _GetPROPERTY_OUTPUT_FRAMES_PER_BUFFER;
    {class} property PROPERTY_OUTPUT_SAMPLE_RATE: JString read _GetPROPERTY_OUTPUT_SAMPLE_RATE;
    {class} property PROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED: JString read _GetPROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED;
    {class} property PROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND: JString read _GetPROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND;
    {class} property PROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND: JString read _GetPROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND;
    {class} property RINGER_MODE_CHANGED_ACTION: JString read _GetRINGER_MODE_CHANGED_ACTION;
    {class} property RINGER_MODE_NORMAL: Integer read _GetRINGER_MODE_NORMAL;
    {class} property RINGER_MODE_SILENT: Integer read _GetRINGER_MODE_SILENT;
    {class} property RINGER_MODE_VIBRATE: Integer read _GetRINGER_MODE_VIBRATE;
    {class} property ROUTE_ALL: Integer read _GetROUTE_ALL;
    {class} property ROUTE_BLUETOOTH: Integer read _GetROUTE_BLUETOOTH;
    {class} property ROUTE_BLUETOOTH_A2DP: Integer read _GetROUTE_BLUETOOTH_A2DP;
    {class} property ROUTE_BLUETOOTH_SCO: Integer read _GetROUTE_BLUETOOTH_SCO;
    {class} property ROUTE_EARPIECE: Integer read _GetROUTE_EARPIECE;
    {class} property ROUTE_HEADSET: Integer read _GetROUTE_HEADSET;
    {class} property ROUTE_SPEAKER: Integer read _GetROUTE_SPEAKER;
    {class} property SCO_AUDIO_STATE_CONNECTED: Integer read _GetSCO_AUDIO_STATE_CONNECTED;
    {class} property SCO_AUDIO_STATE_CONNECTING: Integer read _GetSCO_AUDIO_STATE_CONNECTING;
    {class} property SCO_AUDIO_STATE_DISCONNECTED: Integer read _GetSCO_AUDIO_STATE_DISCONNECTED;
    {class} property SCO_AUDIO_STATE_ERROR: Integer read _GetSCO_AUDIO_STATE_ERROR;
    {class} property STREAM_ACCESSIBILITY: Integer read _GetSTREAM_ACCESSIBILITY;
    {class} property STREAM_ALARM: Integer read _GetSTREAM_ALARM;
    {class} property STREAM_DTMF: Integer read _GetSTREAM_DTMF;
    {class} property STREAM_MUSIC: Integer read _GetSTREAM_MUSIC;
    {class} property STREAM_NOTIFICATION: Integer read _GetSTREAM_NOTIFICATION;
    {class} property STREAM_RING: Integer read _GetSTREAM_RING;
    {class} property STREAM_SYSTEM: Integer read _GetSTREAM_SYSTEM;
    {class} property STREAM_VOICE_CALL: Integer read _GetSTREAM_VOICE_CALL;
    {class} property USE_DEFAULT_STREAM_TYPE: Integer read _GetUSE_DEFAULT_STREAM_TYPE;
    {class} property VIBRATE_SETTING_CHANGED_ACTION: JString read _GetVIBRATE_SETTING_CHANGED_ACTION;
    {class} property VIBRATE_SETTING_OFF: Integer read _GetVIBRATE_SETTING_OFF;
    {class} property VIBRATE_SETTING_ON: Integer read _GetVIBRATE_SETTING_ON;
    {class} property VIBRATE_SETTING_ONLY_SILENT: Integer read _GetVIBRATE_SETTING_ONLY_SILENT;
    {class} property VIBRATE_TYPE_NOTIFICATION: Integer read _GetVIBRATE_TYPE_NOTIFICATION;
    {class} property VIBRATE_TYPE_RINGER: Integer read _GetVIBRATE_TYPE_RINGER;
  end;

  [JavaSignature('android/media/AudioManager')]
  JAudioManager = interface(JObject)
    ['{C02E6757-33D6-4A65-99F4-F658813EF426}']
    function abandonAudioFocus(l: JAudioManager_OnAudioFocusChangeListener): Integer; cdecl;//Deprecated
    function abandonAudioFocusRequest(focusRequest: JAudioFocusRequest): Integer; cdecl;
    procedure addOnCommunicationDeviceChangedListener(executor: JExecutor; listener: JAudioManager_OnCommunicationDeviceChangedListener); cdecl;
    procedure addOnModeChangedListener(executor: JExecutor; listener: JAudioManager_OnModeChangedListener); cdecl;
    procedure adjustStreamVolume(streamType: Integer; direction: Integer; flags: Integer); cdecl;
    procedure adjustSuggestedStreamVolume(direction: Integer; suggestedStreamType: Integer; flags: Integer); cdecl;
    procedure adjustVolume(direction: Integer; flags: Integer); cdecl;
    procedure clearCommunicationDevice; cdecl;
    procedure dispatchMediaKeyEvent(keyEvent: JKeyEvent); cdecl;
    function generateAudioSessionId: Integer; cdecl;
    function getActivePlaybackConfigurations: JList; cdecl;
    function getActiveRecordingConfigurations: JList; cdecl;
    function getAllowedCapturePolicy: Integer; cdecl;
    function getAudioDevicesForAttributes(attributes: JAudioAttributes): JList; cdecl;
    function getAudioHwSyncForSession(sessionId: Integer): Integer; cdecl;
    function getAvailableCommunicationDevices: JList; cdecl;
    function getCommunicationDevice: JAudioDeviceInfo; cdecl;
    function getDevices(flags: Integer): TJavaObjectArray<JAudioDeviceInfo>; cdecl;
    function getDirectProfilesForAttributes(attributes: JAudioAttributes): JList; cdecl;
    function getEncodedSurroundMode: Integer; cdecl;
    function getMicrophones: JList; cdecl;
    function getMode: Integer; cdecl;
    function getParameters(keys: JString): JString; cdecl;
    function getProperty(key: JString): JString; cdecl;
    function getRingerMode: Integer; cdecl;
    function getRouting(mode: Integer): Integer; cdecl;//Deprecated
    function getSpatializer: JSpatializer; cdecl;
    function getStreamMaxVolume(streamType: Integer): Integer; cdecl;
    function getStreamMinVolume(streamType: Integer): Integer; cdecl;
    function getStreamVolume(streamType: Integer): Integer; cdecl;
    function getStreamVolumeDb(streamType: Integer; index: Integer; deviceType: Integer): Single; cdecl;
    function getVibrateSetting(vibrateType: Integer): Integer; cdecl;//Deprecated
    function isBluetoothA2dpOn: Boolean; cdecl;//Deprecated
    function isBluetoothScoAvailableOffCall: Boolean; cdecl;
    function isBluetoothScoOn: Boolean; cdecl;
    function isCallScreeningModeSupported: Boolean; cdecl;
    function isMicrophoneMute: Boolean; cdecl;
    function isMusicActive: Boolean; cdecl;
    function isRampingRingerEnabled: Boolean; cdecl;
    function isSpeakerphoneOn: Boolean; cdecl;
    function isStreamMute(streamType: Integer): Boolean; cdecl;
    function isSurroundFormatEnabled(audioFormat: Integer): Boolean; cdecl;
    function isVolumeFixed: Boolean; cdecl;
    function isWiredHeadsetOn: Boolean; cdecl;//Deprecated
    procedure loadSoundEffects; cdecl;
    procedure playSoundEffect(effectType: Integer); cdecl; overload;
    procedure playSoundEffect(effectType: Integer; volume: Single); cdecl; overload;
    procedure registerAudioDeviceCallback(callback: JAudioDeviceCallback; handler: JHandler); cdecl;
    procedure registerAudioPlaybackCallback(cb: JAudioManager_AudioPlaybackCallback; handler: JHandler); cdecl;
    procedure registerAudioRecordingCallback(cb: JAudioManager_AudioRecordingCallback; handler: JHandler); cdecl;
    procedure registerMediaButtonEventReceiver(eventReceiver: JComponentName); cdecl; overload;//Deprecated
    procedure registerMediaButtonEventReceiver(eventReceiver: JPendingIntent); cdecl; overload;//Deprecated
    procedure registerRemoteControlClient(rcClient: JRemoteControlClient); cdecl;//Deprecated
    function registerRemoteController(rctlr: JRemoteController): Boolean; cdecl;//Deprecated
    procedure removeOnCommunicationDeviceChangedListener(listener: JAudioManager_OnCommunicationDeviceChangedListener); cdecl;
    procedure removeOnModeChangedListener(listener: JAudioManager_OnModeChangedListener); cdecl;
    function requestAudioFocus(l: JAudioManager_OnAudioFocusChangeListener; streamType: Integer; durationHint: Integer): Integer; cdecl; overload;//Deprecated
    function requestAudioFocus(focusRequest: JAudioFocusRequest): Integer; cdecl; overload;
    procedure setAllowedCapturePolicy(capturePolicy: Integer); cdecl;
    procedure setBluetoothA2dpOn(on: Boolean); cdecl;//Deprecated
    procedure setBluetoothScoOn(on: Boolean); cdecl;
    function setCommunicationDevice(device: JAudioDeviceInfo): Boolean; cdecl;
    function setEncodedSurroundMode(mode: Integer): Boolean; cdecl;
    procedure setMicrophoneMute(on: Boolean); cdecl;
    procedure setMode(mode: Integer); cdecl;
    procedure setParameters(keyValuePairs: JString); cdecl;
    procedure setRingerMode(ringerMode: Integer); cdecl;
    procedure setRouting(mode: Integer; routes: Integer; mask: Integer); cdecl;//Deprecated
    procedure setSpeakerphoneOn(on: Boolean); cdecl;
    procedure setStreamMute(streamType: Integer; state: Boolean); cdecl;//Deprecated
    procedure setStreamSolo(streamType: Integer; state: Boolean); cdecl;//Deprecated
    procedure setStreamVolume(streamType: Integer; index: Integer; flags: Integer); cdecl;
    function setSurroundFormatEnabled(audioFormat: Integer; enabled: Boolean): Boolean; cdecl;
    procedure setVibrateSetting(vibrateType: Integer; vibrateSetting: Integer); cdecl;//Deprecated
    procedure setWiredHeadsetOn(on: Boolean); cdecl;//Deprecated
    function shouldVibrate(vibrateType: Integer): Boolean; cdecl;//Deprecated
    procedure startBluetoothSco; cdecl;
    procedure stopBluetoothSco; cdecl;
    procedure unloadSoundEffects; cdecl;
    procedure unregisterAudioDeviceCallback(callback: JAudioDeviceCallback); cdecl;
    procedure unregisterAudioPlaybackCallback(cb: JAudioManager_AudioPlaybackCallback); cdecl;
    procedure unregisterAudioRecordingCallback(cb: JAudioManager_AudioRecordingCallback); cdecl;
    procedure unregisterMediaButtonEventReceiver(eventReceiver: JComponentName); cdecl; overload;//Deprecated
    procedure unregisterMediaButtonEventReceiver(eventReceiver: JPendingIntent); cdecl; overload;//Deprecated
    procedure unregisterRemoteControlClient(rcClient: JRemoteControlClient); cdecl;//Deprecated
    procedure unregisterRemoteController(rctlr: JRemoteController); cdecl;//Deprecated
  end;
  TJAudioManager = class(TJavaGenericImport<JAudioManagerClass, JAudioManager>) end;

  JAudioManager_AudioPlaybackCallbackClass = interface(JObjectClass)
    ['{5A64A3D6-5F8E-47B7-B216-9E5B8352DA97}']
    {class} function init: JAudioManager_AudioPlaybackCallback; cdecl;
  end;

  [JavaSignature('android/media/AudioManager$AudioPlaybackCallback')]
  JAudioManager_AudioPlaybackCallback = interface(JObject)
    ['{BD9F9573-D5E2-4450-8DB4-12F223FCD84E}']
    procedure onPlaybackConfigChanged(configs: JList); cdecl;
  end;
  TJAudioManager_AudioPlaybackCallback = class(TJavaGenericImport<JAudioManager_AudioPlaybackCallbackClass, JAudioManager_AudioPlaybackCallback>) end;

  JAudioManager_AudioRecordingCallbackClass = interface(JObjectClass)
    ['{206FAF8C-49FB-4254-93C3-E34D5E945687}']
    {class} function init: JAudioManager_AudioRecordingCallback; cdecl;
  end;

  [JavaSignature('android/media/AudioManager$AudioRecordingCallback')]
  JAudioManager_AudioRecordingCallback = interface(JObject)
    ['{0FD134DC-A1C6-4B88-AEA2-ACD25079FD97}']
    procedure onRecordingConfigChanged(configs: JList); cdecl;
  end;
  TJAudioManager_AudioRecordingCallback = class(TJavaGenericImport<JAudioManager_AudioRecordingCallbackClass, JAudioManager_AudioRecordingCallback>) end;

  JAudioManager_OnAudioFocusChangeListenerClass = interface(IJavaClass)
    ['{D79C0846-0031-48D5-9EB0-A995A3D034A2}']
  end;

  [JavaSignature('android/media/AudioManager$OnAudioFocusChangeListener')]
  JAudioManager_OnAudioFocusChangeListener = interface(IJavaInstance)
    ['{F6FE80F4-5596-4E41-B718-BFEEEDBFAE47}']
    procedure onAudioFocusChange(focusChange: Integer); cdecl;
  end;
  TJAudioManager_OnAudioFocusChangeListener = class(TJavaGenericImport<JAudioManager_OnAudioFocusChangeListenerClass, JAudioManager_OnAudioFocusChangeListener>) end;

  JAudioManager_OnCommunicationDeviceChangedListenerClass = interface(IJavaClass)
    ['{FAD9B32A-7F24-4061-A951-0B30ED3F5BF9}']
  end;

  [JavaSignature('android/media/AudioManager$OnCommunicationDeviceChangedListener')]
  JAudioManager_OnCommunicationDeviceChangedListener = interface(IJavaInstance)
    ['{C82D2D4D-D93B-4D48-824C-29C491E330F7}']
    procedure onCommunicationDeviceChanged(device: JAudioDeviceInfo); cdecl;
  end;
  TJAudioManager_OnCommunicationDeviceChangedListener = class(TJavaGenericImport<JAudioManager_OnCommunicationDeviceChangedListenerClass, JAudioManager_OnCommunicationDeviceChangedListener>) end;

  JAudioManager_OnModeChangedListenerClass = interface(IJavaClass)
    ['{3B92AD17-B5C9-42DA-9C6B-B448197FD99C}']
  end;

  [JavaSignature('android/media/AudioManager$OnModeChangedListener')]
  JAudioManager_OnModeChangedListener = interface(IJavaInstance)
    ['{B3759263-B176-4F0A-899A-89F99AF77C35}']
    procedure onModeChanged(mode: Integer); cdecl;
  end;
  TJAudioManager_OnModeChangedListener = class(TJavaGenericImport<JAudioManager_OnModeChangedListenerClass, JAudioManager_OnModeChangedListener>) end;

  JAudioMetadataClass = interface(JObjectClass)
    ['{1B379F82-E5C6-497E-8E0B-E438BCCE6B57}']
    {class} function createMap: JAudioMetadataMap; cdecl;
  end;

  [JavaSignature('android/media/AudioMetadata')]
  JAudioMetadata = interface(JObject)
    ['{17E1BF1F-8A50-45E0-8E10-26CD0E8D2F97}']
  end;
  TJAudioMetadata = class(TJavaGenericImport<JAudioMetadataClass, JAudioMetadata>) end;

  JAudioMetadata_FormatClass = interface(JObjectClass)
    ['{961D0437-0C7B-4417-89AA-A556803BB0EB}']
    {class} function _GetKEY_ATMOS_PRESENT: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_AUDIO_ENCODING: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_BIT_RATE: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_BIT_WIDTH: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_CHANNEL_MASK: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_MIME: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_PRESENTATION_CONTENT_CLASSIFIER: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_PRESENTATION_ID: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_PRESENTATION_LANGUAGE: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_PROGRAM_ID: JAudioMetadata_Key; cdecl;
    {class} function _GetKEY_SAMPLE_RATE: JAudioMetadata_Key; cdecl;
    {class} property KEY_ATMOS_PRESENT: JAudioMetadata_Key read _GetKEY_ATMOS_PRESENT;
    {class} property KEY_AUDIO_ENCODING: JAudioMetadata_Key read _GetKEY_AUDIO_ENCODING;
    {class} property KEY_BIT_RATE: JAudioMetadata_Key read _GetKEY_BIT_RATE;
    {class} property KEY_BIT_WIDTH: JAudioMetadata_Key read _GetKEY_BIT_WIDTH;
    {class} property KEY_CHANNEL_MASK: JAudioMetadata_Key read _GetKEY_CHANNEL_MASK;
    {class} property KEY_MIME: JAudioMetadata_Key read _GetKEY_MIME;
    {class} property KEY_PRESENTATION_CONTENT_CLASSIFIER: JAudioMetadata_Key read _GetKEY_PRESENTATION_CONTENT_CLASSIFIER;
    {class} property KEY_PRESENTATION_ID: JAudioMetadata_Key read _GetKEY_PRESENTATION_ID;
    {class} property KEY_PRESENTATION_LANGUAGE: JAudioMetadata_Key read _GetKEY_PRESENTATION_LANGUAGE;
    {class} property KEY_PROGRAM_ID: JAudioMetadata_Key read _GetKEY_PROGRAM_ID;
    {class} property KEY_SAMPLE_RATE: JAudioMetadata_Key read _GetKEY_SAMPLE_RATE;
  end;

  [JavaSignature('android/media/AudioMetadata$Format')]
  JAudioMetadata_Format = interface(JObject)
    ['{C1C95447-3B79-4631-BF71-87B0D6F4ADCC}']
  end;
  TJAudioMetadata_Format = class(TJavaGenericImport<JAudioMetadata_FormatClass, JAudioMetadata_Format>) end;

  JAudioMetadata_KeyClass = interface(IJavaClass)
    ['{145942D7-0566-4DFE-B60D-0DCEB07EDC4E}']
  end;

  [JavaSignature('android/media/AudioMetadata$Key')]
  JAudioMetadata_Key = interface(IJavaInstance)
    ['{6F48D93C-0C34-479F-B6EF-128F7DA20A0C}']
    function getName: JString; cdecl;
    function getValueClass: Jlang_Class; cdecl;
  end;
  TJAudioMetadata_Key = class(TJavaGenericImport<JAudioMetadata_KeyClass, JAudioMetadata_Key>) end;

  JAudioMetadataReadMapClass = interface(IJavaClass)
    ['{6A23881C-CE20-42E1-B806-4911E2D78B57}']
  end;

  [JavaSignature('android/media/AudioMetadataReadMap')]
  JAudioMetadataReadMap = interface(IJavaInstance)
    ['{CB4C5E85-F795-4441-892E-5065D723ED11}']
    function containsKey(key: JAudioMetadata_Key): Boolean; cdecl;
    function dup: JAudioMetadataMap; cdecl;
    function &get(key: JAudioMetadata_Key): JObject; cdecl;
    function size: Integer; cdecl;
  end;
  TJAudioMetadataReadMap = class(TJavaGenericImport<JAudioMetadataReadMapClass, JAudioMetadataReadMap>) end;

  JAudioMetadataMapClass = interface(JAudioMetadataReadMapClass)
    ['{B53B4890-65BC-40BE-BE53-457197C62FB6}']
  end;

  [JavaSignature('android/media/AudioMetadataMap')]
  JAudioMetadataMap = interface(JAudioMetadataReadMap)
    ['{423B75A2-4ED2-4D61-8C14-DA331F4D0893}']
    function remove(key: JAudioMetadata_Key): JObject; cdecl;
    function &set(key: JAudioMetadata_Key; value: JObject): JObject; cdecl;
  end;
  TJAudioMetadataMap = class(TJavaGenericImport<JAudioMetadataMapClass, JAudioMetadataMap>) end;

  JAudioPlaybackCaptureConfigurationClass = interface(JObjectClass)
    ['{6C00A7C1-A3A5-4876-9ECA-FE6B45E0773A}']
  end;

  [JavaSignature('android/media/AudioPlaybackCaptureConfiguration')]
  JAudioPlaybackCaptureConfiguration = interface(JObject)
    ['{89BAAA05-A4CA-41CE-8602-807F0E6FF136}']
    function getExcludeUids: TJavaArray<Integer>; cdecl;
    function getExcludeUsages: TJavaArray<Integer>; cdecl;
    function getMatchingUids: TJavaArray<Integer>; cdecl;
    function getMatchingUsages: TJavaArray<Integer>; cdecl;
    function getMediaProjection: JMediaProjection; cdecl;
  end;
  TJAudioPlaybackCaptureConfiguration = class(TJavaGenericImport<JAudioPlaybackCaptureConfigurationClass, JAudioPlaybackCaptureConfiguration>) end;

  JAudioPlaybackCaptureConfiguration_BuilderClass = interface(JObjectClass)
    ['{85A29A63-6E9B-4678-BE88-0766894C32E7}']
    {class} function init(projection: JMediaProjection): JAudioPlaybackCaptureConfiguration_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioPlaybackCaptureConfiguration$Builder')]
  JAudioPlaybackCaptureConfiguration_Builder = interface(JObject)
    ['{0104D697-EB2B-45C4-9D42-D90A99A3FDDA}']
    function addMatchingUid(uid: Integer): JAudioPlaybackCaptureConfiguration_Builder; cdecl;
    function addMatchingUsage(usage: Integer): JAudioPlaybackCaptureConfiguration_Builder; cdecl;
    function build: JAudioPlaybackCaptureConfiguration; cdecl;
    function excludeUid(uid: Integer): JAudioPlaybackCaptureConfiguration_Builder; cdecl;
    function excludeUsage(usage: Integer): JAudioPlaybackCaptureConfiguration_Builder; cdecl;
  end;
  TJAudioPlaybackCaptureConfiguration_Builder = class(TJavaGenericImport<JAudioPlaybackCaptureConfiguration_BuilderClass, JAudioPlaybackCaptureConfiguration_Builder>) end;

  JAudioPlaybackConfigurationClass = interface(JObjectClass)
    ['{1FB952DC-2123-4060-8382-C0A8777521F4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/AudioPlaybackConfiguration')]
  JAudioPlaybackConfiguration = interface(JObject)
    ['{2106A800-04E0-486D-9985-28AF39BCC686}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getAudioDeviceInfo: JAudioDeviceInfo; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioPlaybackConfiguration = class(TJavaGenericImport<JAudioPlaybackConfigurationClass, JAudioPlaybackConfiguration>) end;

  JAudioPresentationClass = interface(JObjectClass)
    ['{CB56C04A-2CD6-4E31-B20B-0E4880D9D911}']
    {class} function _GetCONTENT_COMMENTARY: Integer; cdecl;
    {class} function _GetCONTENT_DIALOG: Integer; cdecl;
    {class} function _GetCONTENT_EMERGENCY: Integer; cdecl;
    {class} function _GetCONTENT_HEARING_IMPAIRED: Integer; cdecl;
    {class} function _GetCONTENT_MAIN: Integer; cdecl;
    {class} function _GetCONTENT_MUSIC_AND_EFFECTS: Integer; cdecl;
    {class} function _GetCONTENT_UNKNOWN: Integer; cdecl;
    {class} function _GetCONTENT_VISUALLY_IMPAIRED: Integer; cdecl;
    {class} function _GetCONTENT_VOICEOVER: Integer; cdecl;
    {class} function _GetMASTERED_FOR_3D: Integer; cdecl;
    {class} function _GetMASTERED_FOR_HEADPHONE: Integer; cdecl;
    {class} function _GetMASTERED_FOR_STEREO: Integer; cdecl;
    {class} function _GetMASTERED_FOR_SURROUND: Integer; cdecl;
    {class} function _GetMASTERING_NOT_INDICATED: Integer; cdecl;
    {class} property CONTENT_COMMENTARY: Integer read _GetCONTENT_COMMENTARY;
    {class} property CONTENT_DIALOG: Integer read _GetCONTENT_DIALOG;
    {class} property CONTENT_EMERGENCY: Integer read _GetCONTENT_EMERGENCY;
    {class} property CONTENT_HEARING_IMPAIRED: Integer read _GetCONTENT_HEARING_IMPAIRED;
    {class} property CONTENT_MAIN: Integer read _GetCONTENT_MAIN;
    {class} property CONTENT_MUSIC_AND_EFFECTS: Integer read _GetCONTENT_MUSIC_AND_EFFECTS;
    {class} property CONTENT_UNKNOWN: Integer read _GetCONTENT_UNKNOWN;
    {class} property CONTENT_VISUALLY_IMPAIRED: Integer read _GetCONTENT_VISUALLY_IMPAIRED;
    {class} property CONTENT_VOICEOVER: Integer read _GetCONTENT_VOICEOVER;
    {class} property MASTERED_FOR_3D: Integer read _GetMASTERED_FOR_3D;
    {class} property MASTERED_FOR_HEADPHONE: Integer read _GetMASTERED_FOR_HEADPHONE;
    {class} property MASTERED_FOR_STEREO: Integer read _GetMASTERED_FOR_STEREO;
    {class} property MASTERED_FOR_SURROUND: Integer read _GetMASTERED_FOR_SURROUND;
    {class} property MASTERING_NOT_INDICATED: Integer read _GetMASTERING_NOT_INDICATED;
  end;

  [JavaSignature('android/media/AudioPresentation')]
  JAudioPresentation = interface(JObject)
    ['{55E8F101-C1C6-4BFB-84A7-0A974482411F}']
    function equals(o: JObject): Boolean; cdecl;
    function getLabels: JMap; cdecl;
    function getLocale: JLocale; cdecl;
    function getMasteringIndication: Integer; cdecl;
    function getPresentationId: Integer; cdecl;
    function getProgramId: Integer; cdecl;
    function hasAudioDescription: Boolean; cdecl;
    function hasDialogueEnhancement: Boolean; cdecl;
    function hasSpokenSubtitles: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAudioPresentation = class(TJavaGenericImport<JAudioPresentationClass, JAudioPresentation>) end;

  JAudioPresentation_BuilderClass = interface(JObjectClass)
    ['{310D75F9-8D3A-43CE-A3E1-14964C722DA1}']
    {class} function init(presentationId: Integer): JAudioPresentation_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioPresentation$Builder')]
  JAudioPresentation_Builder = interface(JObject)
    ['{14FE7CEE-9E24-4300-BF80-66AB3627C95A}']
    function build: JAudioPresentation; cdecl;
    function setHasAudioDescription(audioDescriptionAvailable: Boolean): JAudioPresentation_Builder; cdecl;
    function setHasDialogueEnhancement(dialogueEnhancementAvailable: Boolean): JAudioPresentation_Builder; cdecl;
    function setHasSpokenSubtitles(spokenSubtitlesAvailable: Boolean): JAudioPresentation_Builder; cdecl;
    function setLabels(labels: JMap): JAudioPresentation_Builder; cdecl;
    //function setLocale(language: JULocale): JAudioPresentation_Builder; cdecl;
    function setMasteringIndication(masteringIndication: Integer): JAudioPresentation_Builder; cdecl;
    function setProgramId(programId: Integer): JAudioPresentation_Builder; cdecl;
  end;
  TJAudioPresentation_Builder = class(TJavaGenericImport<JAudioPresentation_BuilderClass, JAudioPresentation_Builder>) end;

  JAudioProfileClass = interface(JObjectClass)
    ['{6CAFE9D5-5ABD-4243-9245-7E33B38985A0}']
    {class} function _GetAUDIO_ENCAPSULATION_TYPE_IEC61937: Integer; cdecl;
    {class} function _GetAUDIO_ENCAPSULATION_TYPE_NONE: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property AUDIO_ENCAPSULATION_TYPE_IEC61937: Integer read _GetAUDIO_ENCAPSULATION_TYPE_IEC61937;
    {class} property AUDIO_ENCAPSULATION_TYPE_NONE: Integer read _GetAUDIO_ENCAPSULATION_TYPE_NONE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/AudioProfile')]
  JAudioProfile = interface(JObject)
    ['{E5059D42-5B4F-40AF-A0FC-D4DFB130F0DD}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getChannelIndexMasks: TJavaArray<Integer>; cdecl;
    function getChannelMasks: TJavaArray<Integer>; cdecl;
    function getEncapsulationType: Integer; cdecl;
    function getFormat: Integer; cdecl;
    function getSampleRates: TJavaArray<Integer>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioProfile = class(TJavaGenericImport<JAudioProfileClass, JAudioProfile>) end;

  JAudioRecordClass = interface(JObjectClass)
    ['{52854509-E981-4598-90BD-591E322B9E11}']
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetREAD_BLOCKING: Integer; cdecl;
    {class} function _GetREAD_NON_BLOCKING: Integer; cdecl;
    {class} function _GetRECORDSTATE_RECORDING: Integer; cdecl;
    {class} function _GetRECORDSTATE_STOPPED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function init(audioSource: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer): JAudioRecord; cdecl;
    {class} function getMinBufferSize(sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer): Integer; cdecl;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property READ_BLOCKING: Integer read _GetREAD_BLOCKING;
    {class} property READ_NON_BLOCKING: Integer read _GetREAD_NON_BLOCKING;
    {class} property RECORDSTATE_RECORDING: Integer read _GetRECORDSTATE_RECORDING;
    {class} property RECORDSTATE_STOPPED: Integer read _GetRECORDSTATE_STOPPED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/AudioRecord')]
  JAudioRecord = interface(JObject)
    ['{512F5ADB-2452-441B-8FA6-C45F9A4449C0}']
    procedure addOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener; handler: JHandler); cdecl; overload;
    procedure addOnRoutingChangedListener(listener: JAudioRecord_OnRoutingChangedListener; handler: JHandler); cdecl; overload;//Deprecated
    function getActiveMicrophones: JList; cdecl;
    function getActiveRecordingConfiguration: JAudioRecordingConfiguration; cdecl;
    function getAudioFormat: Integer; cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getAudioSource: Integer; cdecl;
    function getBufferSizeInFrames: Integer; cdecl;
    function getChannelConfiguration: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getFormat: JAudioFormat; cdecl;
    function getLogSessionId: JLogSessionId; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getNotificationMarkerPosition: Integer; cdecl;
    function getPositionNotificationPeriod: Integer; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRecordingState: Integer; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSampleRate: Integer; cdecl;
    function getState: Integer; cdecl;
    function getTimestamp(outTimestamp: JAudioTimestamp; timebase: Integer): Integer; cdecl;
    function isPrivacySensitive: Boolean; cdecl;
    function read(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<Single>; offsetInFloats: Integer; sizeInFloats: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioBuffer: JByteBuffer; sizeInBytes: Integer): Integer; cdecl; overload;
    function read(audioBuffer: JByteBuffer; sizeInBytes: Integer; readMode: Integer): Integer; cdecl; overload;
    procedure registerAudioRecordingCallback(executor: JExecutor; cb: JAudioManager_AudioRecordingCallback); cdecl;
    procedure release; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener); cdecl; overload;
    procedure removeOnRoutingChangedListener(listener: JAudioRecord_OnRoutingChangedListener); cdecl; overload;//Deprecated
    procedure setLogSessionId(logSessionId: JLogSessionId); cdecl;
    function setNotificationMarkerPosition(markerInFrames: Integer): Integer; cdecl;
    function setPositionNotificationPeriod(periodInFrames: Integer): Integer; cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    function setPreferredMicrophoneDirection(direction: Integer): Boolean; cdecl;
    function setPreferredMicrophoneFieldDimension(zoom: Single): Boolean; cdecl;
    procedure setRecordPositionUpdateListener(listener: JAudioRecord_OnRecordPositionUpdateListener); cdecl; overload;
    procedure setRecordPositionUpdateListener(listener: JAudioRecord_OnRecordPositionUpdateListener; handler: JHandler); cdecl; overload;
    procedure startRecording; cdecl; overload;
    procedure startRecording(syncEvent: JMediaSyncEvent); cdecl; overload;
    procedure stop; cdecl;
    procedure unregisterAudioRecordingCallback(cb: JAudioManager_AudioRecordingCallback); cdecl;
  end;
  TJAudioRecord = class(TJavaGenericImport<JAudioRecordClass, JAudioRecord>) end;

  JAudioRecord_BuilderClass = interface(JObjectClass)
    ['{76A6E9D4-566B-49BD-BF4E-2CAA4C17525B}']
    {class} function init: JAudioRecord_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioRecord$Builder')]
  JAudioRecord_Builder = interface(JObject)
    ['{BF486BE7-BE8A-48E5-A9FC-B7F22D0B6115}']
    function build: JAudioRecord; cdecl;
    function setAudioFormat(format: JAudioFormat): JAudioRecord_Builder; cdecl;
    function setAudioPlaybackCaptureConfig(config: JAudioPlaybackCaptureConfiguration): JAudioRecord_Builder; cdecl;
    function setAudioSource(source: Integer): JAudioRecord_Builder; cdecl;
    function setBufferSizeInBytes(bufferSizeInBytes: Integer): JAudioRecord_Builder; cdecl;
    function setContext(context: JContext): JAudioRecord_Builder; cdecl;
    function setPrivacySensitive(privacySensitive: Boolean): JAudioRecord_Builder; cdecl;
  end;
  TJAudioRecord_Builder = class(TJavaGenericImport<JAudioRecord_BuilderClass, JAudioRecord_Builder>) end;

  JAudioRecord_MetricsConstantsClass = interface(JObjectClass)
    ['{18B35B6B-9868-4ACA-B8D2-52F10235D28F}']
    {class} function _GetCHANNELS: JString; cdecl;
    {class} function _GetENCODING: JString; cdecl;
    {class} function _GetLATENCY: JString; cdecl;
    {class} function _GetSAMPLERATE: JString; cdecl;
    {class} function _GetSOURCE: JString; cdecl;
    {class} property CHANNELS: JString read _GetCHANNELS;
    {class} property ENCODING: JString read _GetENCODING;
    {class} property LATENCY: JString read _GetLATENCY;
    {class} property SAMPLERATE: JString read _GetSAMPLERATE;
    {class} property SOURCE: JString read _GetSOURCE;
  end;

  [JavaSignature('android/media/AudioRecord$MetricsConstants')]
  JAudioRecord_MetricsConstants = interface(JObject)
    ['{CDD581C3-648A-47A6-BB98-A9CB0E6F914C}']
  end;
  TJAudioRecord_MetricsConstants = class(TJavaGenericImport<JAudioRecord_MetricsConstantsClass, JAudioRecord_MetricsConstants>) end;

  JAudioRecord_OnRecordPositionUpdateListenerClass = interface(IJavaClass)
    ['{61883778-37ED-4EE0-9039-ED97AA45C8FD}']
  end;

  [JavaSignature('android/media/AudioRecord$OnRecordPositionUpdateListener')]
  JAudioRecord_OnRecordPositionUpdateListener = interface(IJavaInstance)
    ['{C465EEDB-9E94-4687-B81D-9A0194874655}']
    procedure onMarkerReached(recorder: JAudioRecord); cdecl;
    procedure onPeriodicNotification(recorder: JAudioRecord); cdecl;
  end;
  TJAudioRecord_OnRecordPositionUpdateListener = class(TJavaGenericImport<JAudioRecord_OnRecordPositionUpdateListenerClass, JAudioRecord_OnRecordPositionUpdateListener>) end;

  JAudioRouting_OnRoutingChangedListenerClass = interface(IJavaClass)
    ['{E40E402A-F26B-4DA6-9451-AB2BE37A8F5D}']
  end;

  [JavaSignature('android/media/AudioRouting$OnRoutingChangedListener')]
  JAudioRouting_OnRoutingChangedListener = interface(IJavaInstance)
    ['{D284ACD0-E9B4-4C5E-837B-C3F76A216650}']
    procedure onRoutingChanged(router: JAudioRouting); cdecl;
  end;
  TJAudioRouting_OnRoutingChangedListener = class(TJavaGenericImport<JAudioRouting_OnRoutingChangedListenerClass, JAudioRouting_OnRoutingChangedListener>) end;

  JAudioRecord_OnRoutingChangedListenerClass = interface(JAudioRouting_OnRoutingChangedListenerClass)
    ['{468513AE-D4D7-4C5A-9C98-C2F3D2A37608}']
  end;

  [JavaSignature('android/media/AudioRecord$OnRoutingChangedListener')]
  JAudioRecord_OnRoutingChangedListener = interface(JAudioRouting_OnRoutingChangedListener)
    ['{67AB498B-237C-4BB1-9451-420F0990C8B5}']
    procedure onRoutingChanged(audioRecord: JAudioRecord); cdecl; overload;
    procedure onRoutingChanged(router: JAudioRouting); cdecl; overload;
  end;
  TJAudioRecord_OnRoutingChangedListener = class(TJavaGenericImport<JAudioRecord_OnRoutingChangedListenerClass, JAudioRecord_OnRoutingChangedListener>) end;

  JAudioRecordingConfigurationClass = interface(JObjectClass)
    ['{BC5AB5CC-1BE2-47FE-B00B-C4CB6854D712}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/AudioRecordingConfiguration')]
  JAudioRecordingConfiguration = interface(JObject)
    ['{C74E707D-D815-4243-A27D-930A6EAFBC79}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioDevice: JAudioDeviceInfo; cdecl;
    function getAudioSource: Integer; cdecl;
    function getClientAudioSessionId: Integer; cdecl;
    function getClientAudioSource: Integer; cdecl;
    function getClientEffects: JList; cdecl;
    function getClientFormat: JAudioFormat; cdecl;
    function getEffects: JList; cdecl;
    function getFormat: JAudioFormat; cdecl;
    function hashCode: Integer; cdecl;
    function isClientSilenced: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioRecordingConfiguration = class(TJavaGenericImport<JAudioRecordingConfigurationClass, JAudioRecordingConfiguration>) end;

  JAudioRecordingMonitorClass = interface(IJavaClass)
    ['{79F54812-7DA8-4EFC-81D1-F183F2D9D380}']
  end;

  [JavaSignature('android/media/AudioRecordingMonitor')]
  JAudioRecordingMonitor = interface(IJavaInstance)
    ['{CC2343C8-7D57-411C-8A76-97574D323C4C}']
    function getActiveRecordingConfiguration: JAudioRecordingConfiguration; cdecl;
    procedure registerAudioRecordingCallback(executor: JExecutor; cb: JAudioManager_AudioRecordingCallback); cdecl;
    procedure unregisterAudioRecordingCallback(cb: JAudioManager_AudioRecordingCallback); cdecl;
  end;
  TJAudioRecordingMonitor = class(TJavaGenericImport<JAudioRecordingMonitorClass, JAudioRecordingMonitor>) end;

  JAudioRoutingClass = interface(IJavaClass)
    ['{712FE214-4132-4FB2-8885-C4218B8D6B9E}']
  end;

  [JavaSignature('android/media/AudioRouting')]
  JAudioRouting = interface(IJavaInstance)
    ['{680ADCDC-4E6F-4713-82BF-0CB120CAC118}']
    procedure addOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener; handler: JHandler); cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener); cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
  end;
  TJAudioRouting = class(TJavaGenericImport<JAudioRoutingClass, JAudioRouting>) end;

  JAudioTimestampClass = interface(JObjectClass)
    ['{3E8076C1-696E-4380-8944-188F9A35A1D1}']
    {class} function _GetTIMEBASE_BOOTTIME: Integer; cdecl;
    {class} function _GetTIMEBASE_MONOTONIC: Integer; cdecl;
    {class} function init: JAudioTimestamp; cdecl;
    {class} property TIMEBASE_BOOTTIME: Integer read _GetTIMEBASE_BOOTTIME;
    {class} property TIMEBASE_MONOTONIC: Integer read _GetTIMEBASE_MONOTONIC;
  end;

  [JavaSignature('android/media/AudioTimestamp')]
  JAudioTimestamp = interface(JObject)
    ['{AB157175-DD33-422D-80A3-EBF292D59A04}']
    function _GetframePosition: Int64; cdecl;
    procedure _SetframePosition(Value: Int64); cdecl;
    function _GetnanoTime: Int64; cdecl;
    procedure _SetnanoTime(Value: Int64); cdecl;
    property framePosition: Int64 read _GetframePosition write _SetframePosition;
    property nanoTime: Int64 read _GetnanoTime write _SetnanoTime;
  end;
  TJAudioTimestamp = class(TJavaGenericImport<JAudioTimestampClass, JAudioTimestamp>) end;

  JAudioTrackClass = interface(JObjectClass)
    ['{F1B69999-E4BF-4586-B05F-708A2172FC51}']
    {class} function _GetDUAL_MONO_MODE_LL: Integer; cdecl;
    {class} function _GetDUAL_MONO_MODE_LR: Integer; cdecl;
    {class} function _GetDUAL_MONO_MODE_OFF: Integer; cdecl;
    {class} function _GetDUAL_MONO_MODE_RR: Integer; cdecl;
    {class} function _GetENCAPSULATION_METADATA_TYPE_DVB_AD_DESCRIPTOR: Integer; cdecl;
    {class} function _GetENCAPSULATION_METADATA_TYPE_FRAMEWORK_TUNER: Integer; cdecl;
    {class} function _GetENCAPSULATION_MODE_ELEMENTARY_STREAM: Integer; cdecl;
    {class} function _GetENCAPSULATION_MODE_NONE: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetMODE_STATIC: Integer; cdecl;
    {class} function _GetMODE_STREAM: Integer; cdecl;
    {class} function _GetPERFORMANCE_MODE_LOW_LATENCY: Integer; cdecl;
    {class} function _GetPERFORMANCE_MODE_NONE: Integer; cdecl;
    {class} function _GetPERFORMANCE_MODE_POWER_SAVING: Integer; cdecl;
    {class} function _GetPLAYSTATE_PAUSED: Integer; cdecl;
    {class} function _GetPLAYSTATE_PLAYING: Integer; cdecl;
    {class} function _GetPLAYSTATE_STOPPED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_NO_STATIC_DATA: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function _GetWRITE_BLOCKING: Integer; cdecl;
    {class} function _GetWRITE_NON_BLOCKING: Integer; cdecl;
    {class} function init(streamType: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer; mode: Integer): JAudioTrack; cdecl; overload;//Deprecated
    {class} function init(streamType: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer; mode: Integer; sessionId: Integer): JAudioTrack; cdecl; overload;//Deprecated
    {class} function init(attributes: JAudioAttributes; format: JAudioFormat; bufferSizeInBytes: Integer; mode: Integer; sessionId: Integer): JAudioTrack; cdecl; overload;
    {class} function getMaxVolume: Single; cdecl;
    {class} function getMinBufferSize(sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer): Integer; cdecl;
    {class} function getMinVolume: Single; cdecl;
    {class} function getNativeOutputSampleRate(streamType: Integer): Integer; cdecl;
    {class} function isDirectPlaybackSupported(format: JAudioFormat; attributes: JAudioAttributes): Boolean; cdecl;//Deprecated
    {class} property DUAL_MONO_MODE_LL: Integer read _GetDUAL_MONO_MODE_LL;
    {class} property DUAL_MONO_MODE_LR: Integer read _GetDUAL_MONO_MODE_LR;
    {class} property DUAL_MONO_MODE_OFF: Integer read _GetDUAL_MONO_MODE_OFF;
    {class} property DUAL_MONO_MODE_RR: Integer read _GetDUAL_MONO_MODE_RR;
    {class} property ENCAPSULATION_METADATA_TYPE_DVB_AD_DESCRIPTOR: Integer read _GetENCAPSULATION_METADATA_TYPE_DVB_AD_DESCRIPTOR;
    {class} property ENCAPSULATION_METADATA_TYPE_FRAMEWORK_TUNER: Integer read _GetENCAPSULATION_METADATA_TYPE_FRAMEWORK_TUNER;
    {class} property ENCAPSULATION_MODE_ELEMENTARY_STREAM: Integer read _GetENCAPSULATION_MODE_ELEMENTARY_STREAM;
    {class} property ENCAPSULATION_MODE_NONE: Integer read _GetENCAPSULATION_MODE_NONE;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property MODE_STATIC: Integer read _GetMODE_STATIC;
    {class} property MODE_STREAM: Integer read _GetMODE_STREAM;
    {class} property PERFORMANCE_MODE_LOW_LATENCY: Integer read _GetPERFORMANCE_MODE_LOW_LATENCY;
    {class} property PERFORMANCE_MODE_NONE: Integer read _GetPERFORMANCE_MODE_NONE;
    {class} property PERFORMANCE_MODE_POWER_SAVING: Integer read _GetPERFORMANCE_MODE_POWER_SAVING;
    {class} property PLAYSTATE_PAUSED: Integer read _GetPLAYSTATE_PAUSED;
    {class} property PLAYSTATE_PLAYING: Integer read _GetPLAYSTATE_PLAYING;
    {class} property PLAYSTATE_STOPPED: Integer read _GetPLAYSTATE_STOPPED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_NO_STATIC_DATA: Integer read _GetSTATE_NO_STATIC_DATA;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property WRITE_BLOCKING: Integer read _GetWRITE_BLOCKING;
    {class} property WRITE_NON_BLOCKING: Integer read _GetWRITE_NON_BLOCKING;
  end;

  [JavaSignature('android/media/AudioTrack')]
  JAudioTrack = interface(JObject)
    ['{84D3E8CB-9DDC-4DCB-902C-43C9AECE0830}']
    procedure addOnCodecFormatChangedListener(executor: JExecutor; listener: JAudioTrack_OnCodecFormatChangedListener); cdecl;
    procedure addOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener; handler: JHandler); cdecl; overload;
    procedure addOnRoutingChangedListener(listener: JAudioTrack_OnRoutingChangedListener; handler: JHandler); cdecl; overload;//Deprecated
    function attachAuxEffect(effectId: Integer): Integer; cdecl;
    function createVolumeShaper(configuration: JVolumeShaper_Configuration): JVolumeShaper; cdecl;
    procedure flush; cdecl;
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getAudioDescriptionMixLeveldB: Single; cdecl;
    function getAudioFormat: Integer; cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getBufferCapacityInFrames: Integer; cdecl;
    function getBufferSizeInFrames: Integer; cdecl;
    function getChannelConfiguration: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getDualMonoMode: Integer; cdecl;
    function getFormat: JAudioFormat; cdecl;
    function getLogSessionId: JLogSessionId; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getNotificationMarkerPosition: Integer; cdecl;
    function getOffloadDelay: Integer; cdecl;
    function getOffloadPadding: Integer; cdecl;
    function getPerformanceMode: Integer; cdecl;
    function getPlayState: Integer; cdecl;
    function getPlaybackHeadPosition: Integer; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getPlaybackRate: Integer; cdecl;
    function getPositionNotificationPeriod: Integer; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSampleRate: Integer; cdecl;
    function getStartThresholdInFrames: Integer; cdecl;
    function getState: Integer; cdecl;
    function getStreamType: Integer; cdecl;
    function getTimestamp(timestamp: JAudioTimestamp): Boolean; cdecl;
    function getUnderrunCount: Integer; cdecl;
    function isOffloadedPlayback: Boolean; cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure registerStreamEventCallback(executor: JExecutor; eventCallback: JAudioTrack_StreamEventCallback); cdecl;
    procedure release; cdecl;
    function reloadStaticData: Integer; cdecl;
    procedure removeOnCodecFormatChangedListener(listener: JAudioTrack_OnCodecFormatChangedListener); cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener); cdecl; overload;
    procedure removeOnRoutingChangedListener(listener: JAudioTrack_OnRoutingChangedListener); cdecl; overload;//Deprecated
    function setAudioDescriptionMixLeveldB(level: Single): Boolean; cdecl;
    function setAuxEffectSendLevel(level: Single): Integer; cdecl;
    function setBufferSizeInFrames(bufferSizeInFrames: Integer): Integer; cdecl;
    function setDualMonoMode(dualMonoMode: Integer): Boolean; cdecl;
    procedure setLogSessionId(logSessionId: JLogSessionId); cdecl;
    function setLoopPoints(startInFrames: Integer; endInFrames: Integer; loopCount: Integer): Integer; cdecl;
    function setNotificationMarkerPosition(markerInFrames: Integer): Integer; cdecl;
    procedure setOffloadDelayPadding(delayInFrames: Integer; paddingInFrames: Integer); cdecl;
    procedure setOffloadEndOfStream; cdecl;
    function setPlaybackHeadPosition(positionInFrames: Integer): Integer; cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    procedure setPlaybackPositionUpdateListener(listener: JAudioTrack_OnPlaybackPositionUpdateListener); cdecl; overload;
    procedure setPlaybackPositionUpdateListener(listener: JAudioTrack_OnPlaybackPositionUpdateListener; handler: JHandler); cdecl; overload;
    function setPlaybackRate(sampleRateInHz: Integer): Integer; cdecl;
    function setPositionNotificationPeriod(periodInFrames: Integer): Integer; cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    function setPresentation(presentation: JAudioPresentation): Integer; cdecl;
    function setStartThresholdInFrames(startThresholdInFrames: Integer): Integer; cdecl;
    function setStereoVolume(leftGain: Single; rightGain: Single): Integer; cdecl;//Deprecated
    function setVolume(gain: Single): Integer; cdecl;
    procedure stop; cdecl;
    procedure unregisterStreamEventCallback(eventCallback: JAudioTrack_StreamEventCallback); cdecl;
    function write(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<Single>; offsetInFloats: Integer; sizeInFloats: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: JByteBuffer; sizeInBytes: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: JByteBuffer; sizeInBytes: Integer; writeMode: Integer; timestamp: Int64): Integer; cdecl; overload;
  end;
  TJAudioTrack = class(TJavaGenericImport<JAudioTrackClass, JAudioTrack>) end;

  JAudioTrack_BuilderClass = interface(JObjectClass)
    ['{0F1ED02C-DB93-4597-B733-1A0398EBBBEF}']
    {class} function init: JAudioTrack_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioTrack$Builder')]
  JAudioTrack_Builder = interface(JObject)
    ['{6D4E424C-4AC6-4F46-89CF-A08F472B5B10}']
    function build: JAudioTrack; cdecl;
    function setAudioAttributes(attributes: JAudioAttributes): JAudioTrack_Builder; cdecl;
    function setAudioFormat(format: JAudioFormat): JAudioTrack_Builder; cdecl;
    function setBufferSizeInBytes(bufferSizeInBytes: Integer): JAudioTrack_Builder; cdecl;
    function setEncapsulationMode(encapsulationMode: Integer): JAudioTrack_Builder; cdecl;
    function setOffloadedPlayback(offload: Boolean): JAudioTrack_Builder; cdecl;
    function setPerformanceMode(performanceMode: Integer): JAudioTrack_Builder; cdecl;
    function setSessionId(sessionId: Integer): JAudioTrack_Builder; cdecl;
    function setTransferMode(mode: Integer): JAudioTrack_Builder; cdecl;
  end;
  TJAudioTrack_Builder = class(TJavaGenericImport<JAudioTrack_BuilderClass, JAudioTrack_Builder>) end;

  JAudioTrack_MetricsConstantsClass = interface(JObjectClass)
    ['{F41B9D28-755C-4400-B5CB-24D6DDAD7276}']
    {class} function _GetCHANNELMASK: JString; cdecl;
    {class} function _GetCONTENTTYPE: JString; cdecl;
    {class} function _GetSAMPLERATE: JString; cdecl;
    {class} function _GetSTREAMTYPE: JString; cdecl;
    {class} function _GetUSAGE: JString; cdecl;
    {class} property CHANNELMASK: JString read _GetCHANNELMASK;
    {class} property CONTENTTYPE: JString read _GetCONTENTTYPE;
    {class} property SAMPLERATE: JString read _GetSAMPLERATE;
    {class} property STREAMTYPE: JString read _GetSTREAMTYPE;
    {class} property USAGE: JString read _GetUSAGE;
  end;

  [JavaSignature('android/media/AudioTrack$MetricsConstants')]
  JAudioTrack_MetricsConstants = interface(JObject)
    ['{48D1332A-4317-439E-B574-E1FADE649972}']
  end;
  TJAudioTrack_MetricsConstants = class(TJavaGenericImport<JAudioTrack_MetricsConstantsClass, JAudioTrack_MetricsConstants>) end;

  JAudioTrack_OnCodecFormatChangedListenerClass = interface(IJavaClass)
    ['{C3D38BC8-1226-4FB3-81D8-BA9AAADDEDBF}']
  end;

  [JavaSignature('android/media/AudioTrack$OnCodecFormatChangedListener')]
  JAudioTrack_OnCodecFormatChangedListener = interface(IJavaInstance)
    ['{32A78E5A-8309-4859-ADEF-EE1D6C081681}']
    procedure onCodecFormatChanged(audioTrack: JAudioTrack; info: JAudioMetadataReadMap); cdecl;
  end;
  TJAudioTrack_OnCodecFormatChangedListener = class(TJavaGenericImport<JAudioTrack_OnCodecFormatChangedListenerClass, JAudioTrack_OnCodecFormatChangedListener>) end;

  JAudioTrack_OnPlaybackPositionUpdateListenerClass = interface(IJavaClass)
    ['{8D53A876-1D82-45AE-87A9-26C1E7CF5736}']
  end;

  [JavaSignature('android/media/AudioTrack$OnPlaybackPositionUpdateListener')]
  JAudioTrack_OnPlaybackPositionUpdateListener = interface(IJavaInstance)
    ['{71399D16-1559-485C-900C-D25CFD06E25B}']
    procedure onMarkerReached(track: JAudioTrack); cdecl;
    procedure onPeriodicNotification(track: JAudioTrack); cdecl;
  end;
  TJAudioTrack_OnPlaybackPositionUpdateListener = class(TJavaGenericImport<JAudioTrack_OnPlaybackPositionUpdateListenerClass, JAudioTrack_OnPlaybackPositionUpdateListener>) end;

  JAudioTrack_OnRoutingChangedListenerClass = interface(JAudioRouting_OnRoutingChangedListenerClass)
    ['{829B450B-0CC6-4FD8-A7DE-776EC46D97BE}']
  end;

  [JavaSignature('android/media/AudioTrack$OnRoutingChangedListener')]
  JAudioTrack_OnRoutingChangedListener = interface(JAudioRouting_OnRoutingChangedListener)
    ['{C5DE60E1-8A6B-4607-AA9B-EFBF0ACB5C35}']
    procedure onRoutingChanged(audioTrack: JAudioTrack); cdecl; overload;
    procedure onRoutingChanged(router: JAudioRouting); cdecl; overload;
  end;
  TJAudioTrack_OnRoutingChangedListener = class(TJavaGenericImport<JAudioTrack_OnRoutingChangedListenerClass, JAudioTrack_OnRoutingChangedListener>) end;

  JAudioTrack_StreamEventCallbackClass = interface(JObjectClass)
    ['{33677630-3F2C-4BF9-97B6-64C97D4B970D}']
    {class} function init: JAudioTrack_StreamEventCallback; cdecl;
  end;

  [JavaSignature('android/media/AudioTrack$StreamEventCallback')]
  JAudioTrack_StreamEventCallback = interface(JObject)
    ['{6E148599-7A9A-4B3A-AE7A-EE03BB406C9F}']
    procedure onDataRequest(track: JAudioTrack; sizeInFrames: Integer); cdecl;
    procedure onPresentationEnded(track: JAudioTrack); cdecl;
    procedure onTearDown(track: JAudioTrack); cdecl;
  end;
  TJAudioTrack_StreamEventCallback = class(TJavaGenericImport<JAudioTrack_StreamEventCallbackClass, JAudioTrack_StreamEventCallback>) end;

  JCamcorderProfileClass = interface(JObjectClass)
    ['{74CB0E77-4E93-4724-A3AA-EEE1C29C90AD}']
    {class} function _GetQUALITY_1080P: Integer; cdecl;
    {class} function _GetQUALITY_2160P: Integer; cdecl;
    {class} function _GetQUALITY_2K: Integer; cdecl;
    {class} function _GetQUALITY_480P: Integer; cdecl;
    {class} function _GetQUALITY_4KDCI: Integer; cdecl;
    {class} function _GetQUALITY_720P: Integer; cdecl;
    {class} function _GetQUALITY_8KUHD: Integer; cdecl;
    {class} function _GetQUALITY_CIF: Integer; cdecl;
    {class} function _GetQUALITY_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_1080P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_2160P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_480P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_4KDCI: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_720P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_CIF: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_LOW: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_VGA: Integer; cdecl;
    {class} function _GetQUALITY_LOW: Integer; cdecl;
    {class} function _GetQUALITY_QCIF: Integer; cdecl;
    {class} function _GetQUALITY_QHD: Integer; cdecl;
    {class} function _GetQUALITY_QVGA: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_1080P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_2160P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_2K: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_480P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_4KDCI: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_720P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_8KUHD: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_CIF: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_LOW: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_QCIF: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_QHD: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_QVGA: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_VGA: Integer; cdecl;
    {class} function _GetQUALITY_VGA: Integer; cdecl;
    {class} function &get(quality: Integer): JCamcorderProfile; cdecl; overload;//Deprecated
    {class} function &get(cameraId: Integer; quality: Integer): JCamcorderProfile; cdecl; overload;//Deprecated
    {class} function getAll(cameraId: JString; quality: Integer): JEncoderProfiles; cdecl;
    {class} function hasProfile(quality: Integer): Boolean; cdecl; overload;
    {class} function hasProfile(cameraId: Integer; quality: Integer): Boolean; cdecl; overload;
    {class} property QUALITY_1080P: Integer read _GetQUALITY_1080P;
    {class} property QUALITY_2160P: Integer read _GetQUALITY_2160P;
    {class} property QUALITY_2K: Integer read _GetQUALITY_2K;
    {class} property QUALITY_480P: Integer read _GetQUALITY_480P;
    {class} property QUALITY_4KDCI: Integer read _GetQUALITY_4KDCI;
    {class} property QUALITY_720P: Integer read _GetQUALITY_720P;
    {class} property QUALITY_8KUHD: Integer read _GetQUALITY_8KUHD;
    {class} property QUALITY_CIF: Integer read _GetQUALITY_CIF;
    {class} property QUALITY_HIGH: Integer read _GetQUALITY_HIGH;
    {class} property QUALITY_HIGH_SPEED_1080P: Integer read _GetQUALITY_HIGH_SPEED_1080P;
    {class} property QUALITY_HIGH_SPEED_2160P: Integer read _GetQUALITY_HIGH_SPEED_2160P;
    {class} property QUALITY_HIGH_SPEED_480P: Integer read _GetQUALITY_HIGH_SPEED_480P;
    {class} property QUALITY_HIGH_SPEED_4KDCI: Integer read _GetQUALITY_HIGH_SPEED_4KDCI;
    {class} property QUALITY_HIGH_SPEED_720P: Integer read _GetQUALITY_HIGH_SPEED_720P;
    {class} property QUALITY_HIGH_SPEED_CIF: Integer read _GetQUALITY_HIGH_SPEED_CIF;
    {class} property QUALITY_HIGH_SPEED_HIGH: Integer read _GetQUALITY_HIGH_SPEED_HIGH;
    {class} property QUALITY_HIGH_SPEED_LOW: Integer read _GetQUALITY_HIGH_SPEED_LOW;
    {class} property QUALITY_HIGH_SPEED_VGA: Integer read _GetQUALITY_HIGH_SPEED_VGA;
    {class} property QUALITY_LOW: Integer read _GetQUALITY_LOW;
    {class} property QUALITY_QCIF: Integer read _GetQUALITY_QCIF;
    {class} property QUALITY_QHD: Integer read _GetQUALITY_QHD;
    {class} property QUALITY_QVGA: Integer read _GetQUALITY_QVGA;
    {class} property QUALITY_TIME_LAPSE_1080P: Integer read _GetQUALITY_TIME_LAPSE_1080P;
    {class} property QUALITY_TIME_LAPSE_2160P: Integer read _GetQUALITY_TIME_LAPSE_2160P;
    {class} property QUALITY_TIME_LAPSE_2K: Integer read _GetQUALITY_TIME_LAPSE_2K;
    {class} property QUALITY_TIME_LAPSE_480P: Integer read _GetQUALITY_TIME_LAPSE_480P;
    {class} property QUALITY_TIME_LAPSE_4KDCI: Integer read _GetQUALITY_TIME_LAPSE_4KDCI;
    {class} property QUALITY_TIME_LAPSE_720P: Integer read _GetQUALITY_TIME_LAPSE_720P;
    {class} property QUALITY_TIME_LAPSE_8KUHD: Integer read _GetQUALITY_TIME_LAPSE_8KUHD;
    {class} property QUALITY_TIME_LAPSE_CIF: Integer read _GetQUALITY_TIME_LAPSE_CIF;
    {class} property QUALITY_TIME_LAPSE_HIGH: Integer read _GetQUALITY_TIME_LAPSE_HIGH;
    {class} property QUALITY_TIME_LAPSE_LOW: Integer read _GetQUALITY_TIME_LAPSE_LOW;
    {class} property QUALITY_TIME_LAPSE_QCIF: Integer read _GetQUALITY_TIME_LAPSE_QCIF;
    {class} property QUALITY_TIME_LAPSE_QHD: Integer read _GetQUALITY_TIME_LAPSE_QHD;
    {class} property QUALITY_TIME_LAPSE_QVGA: Integer read _GetQUALITY_TIME_LAPSE_QVGA;
    {class} property QUALITY_TIME_LAPSE_VGA: Integer read _GetQUALITY_TIME_LAPSE_VGA;
    {class} property QUALITY_VGA: Integer read _GetQUALITY_VGA;
  end;

  [JavaSignature('android/media/CamcorderProfile')]
  JCamcorderProfile = interface(JObject)
    ['{2957E3CA-A488-4829-84DE-F15DEA6F7FFB}']
    function _GetaudioBitRate: Integer; cdecl;
    procedure _SetaudioBitRate(Value: Integer); cdecl;
    function _GetaudioChannels: Integer; cdecl;
    procedure _SetaudioChannels(Value: Integer); cdecl;
    function _GetaudioCodec: Integer; cdecl;
    procedure _SetaudioCodec(Value: Integer); cdecl;
    function _GetaudioSampleRate: Integer; cdecl;
    procedure _SetaudioSampleRate(Value: Integer); cdecl;
    function _Getduration: Integer; cdecl;
    procedure _Setduration(Value: Integer); cdecl;
    function _GetfileFormat: Integer; cdecl;
    procedure _SetfileFormat(Value: Integer); cdecl;
    function _Getquality: Integer; cdecl;
    procedure _Setquality(Value: Integer); cdecl;
    function _GetvideoBitRate: Integer; cdecl;
    procedure _SetvideoBitRate(Value: Integer); cdecl;
    function _GetvideoCodec: Integer; cdecl;
    procedure _SetvideoCodec(Value: Integer); cdecl;
    function _GetvideoFrameHeight: Integer; cdecl;
    procedure _SetvideoFrameHeight(Value: Integer); cdecl;
    function _GetvideoFrameRate: Integer; cdecl;
    procedure _SetvideoFrameRate(Value: Integer); cdecl;
    function _GetvideoFrameWidth: Integer; cdecl;
    procedure _SetvideoFrameWidth(Value: Integer); cdecl;
    property audioBitRate: Integer read _GetaudioBitRate write _SetaudioBitRate;
    property audioChannels: Integer read _GetaudioChannels write _SetaudioChannels;
    property audioCodec: Integer read _GetaudioCodec write _SetaudioCodec;
    property audioSampleRate: Integer read _GetaudioSampleRate write _SetaudioSampleRate;
    property duration: Integer read _Getduration write _Setduration;
    property fileFormat: Integer read _GetfileFormat write _SetfileFormat;
    property quality: Integer read _Getquality write _Setquality;
    property videoBitRate: Integer read _GetvideoBitRate write _SetvideoBitRate;
    property videoCodec: Integer read _GetvideoCodec write _SetvideoCodec;
    property videoFrameHeight: Integer read _GetvideoFrameHeight write _SetvideoFrameHeight;
    property videoFrameRate: Integer read _GetvideoFrameRate write _SetvideoFrameRate;
    property videoFrameWidth: Integer read _GetvideoFrameWidth write _SetvideoFrameWidth;
  end;
  TJCamcorderProfile = class(TJavaGenericImport<JCamcorderProfileClass, JCamcorderProfile>) end;

  JCameraProfileClass = interface(JObjectClass)
    ['{60E4B807-EC20-448E-86E5-DC8FE661FCEF}']
    {class} function _GetQUALITY_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_LOW: Integer; cdecl;
    {class} function _GetQUALITY_MEDIUM: Integer; cdecl;
    {class} function init: JCameraProfile; cdecl;
    {class} function getJpegEncodingQualityParameter(quality: Integer): Integer; cdecl; overload;
    {class} function getJpegEncodingQualityParameter(cameraId: Integer; quality: Integer): Integer; cdecl; overload;
    {class} property QUALITY_HIGH: Integer read _GetQUALITY_HIGH;
    {class} property QUALITY_LOW: Integer read _GetQUALITY_LOW;
    {class} property QUALITY_MEDIUM: Integer read _GetQUALITY_MEDIUM;
  end;

  [JavaSignature('android/media/CameraProfile')]
  JCameraProfile = interface(JObject)
    ['{D149134A-7FEF-4216-B46B-F7E2E2F3C919}']
  end;
  TJCameraProfile = class(TJavaGenericImport<JCameraProfileClass, JCameraProfile>) end;

  JMediaDrmExceptionClass = interface(JExceptionClass)
    ['{2E43AF16-EDE3-44E4-B99F-46BC9B38C242}']
    {class} function init(detailMessage: JString): JMediaDrmException; cdecl;
  end;

  [JavaSignature('android/media/MediaDrmException')]
  JMediaDrmException = interface(JException)
    ['{3E068C5A-026A-4E02-BCA4-C37659511F93}']
  end;
  TJMediaDrmException = class(TJavaGenericImport<JMediaDrmExceptionClass, JMediaDrmException>) end;

  JDeniedByServerExceptionClass = interface(JMediaDrmExceptionClass)
    ['{A810E72B-E334-42EC-BAC0-715B71FE2412}']
    {class} function init(detailMessage: JString): JDeniedByServerException; cdecl;
  end;

  [JavaSignature('android/media/DeniedByServerException')]
  JDeniedByServerException = interface(JMediaDrmException)
    ['{14535695-BF59-4A81-BC49-E8F5FD94F3BF}']
  end;
  TJDeniedByServerException = class(TJavaGenericImport<JDeniedByServerExceptionClass, JDeniedByServerException>) end;

  JDrmInitDataClass = interface(JObjectClass)
    ['{92C9D930-9381-4A30-8D6B-4E1F77FE4607}']
  end;

  [JavaSignature('android/media/DrmInitData')]
  JDrmInitData = interface(JObject)
    ['{BF72C262-0872-4C51-A07D-07687A0C0574}']
    function &get(schemeUuid: JUUID): JDrmInitData_SchemeInitData; cdecl;//Deprecated
    function getSchemeInitDataAt(index: Integer): JDrmInitData_SchemeInitData; cdecl;
    function getSchemeInitDataCount: Integer; cdecl;
  end;
  TJDrmInitData = class(TJavaGenericImport<JDrmInitDataClass, JDrmInitData>) end;

  JDrmInitData_SchemeInitDataClass = interface(JObjectClass)
    ['{C585F665-4418-4953-9725-713F3D31E8EB}']
    {class} function _GetUUID_NIL: JUUID; cdecl;
    {class} function init(uuid: JUUID; mimeType: JString; data: TJavaArray<Byte>): JDrmInitData_SchemeInitData; cdecl;
    {class} property UUID_NIL: JUUID read _GetUUID_NIL;
  end;

  [JavaSignature('android/media/DrmInitData$SchemeInitData')]
  JDrmInitData_SchemeInitData = interface(JObject)
    ['{AB97D8C5-87E7-42F0-80E8-5CB0F196A8F4}']
    function _Getdata: TJavaArray<Byte>; cdecl;
    function _GetmimeType: JString; cdecl;
    function _Getuuid: JUUID; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property data: TJavaArray<Byte> read _Getdata;
    property mimeType: JString read _GetmimeType;
    property uuid: JUUID read _Getuuid;
  end;
  TJDrmInitData_SchemeInitData = class(TJavaGenericImport<JDrmInitData_SchemeInitDataClass, JDrmInitData_SchemeInitData>) end;

  JEncoderProfilesClass = interface(JObjectClass)
    ['{49FABEE7-54E7-4C69-8822-4E2173D7661B}']
  end;

  [JavaSignature('android/media/EncoderProfiles')]
  JEncoderProfiles = interface(JObject)
    ['{F5B432D3-94A3-4DD0-9568-F29551F00A71}']
    function getAudioProfiles: JList; cdecl;
    function getDefaultDurationSeconds: Integer; cdecl;
    function getRecommendedFileFormat: Integer; cdecl;
    function getVideoProfiles: JList; cdecl;
  end;
  TJEncoderProfiles = class(TJavaGenericImport<JEncoderProfilesClass, JEncoderProfiles>) end;

  JEncoderProfiles_AudioProfileClass = interface(JObjectClass)
    ['{7706868D-586D-4C54-9A93-8B8B62F763E9}']
  end;

  [JavaSignature('android/media/EncoderProfiles$AudioProfile')]
  JEncoderProfiles_AudioProfile = interface(JObject)
    ['{EFC7DA5C-ED27-474D-9F49-911AC617407B}']
    function getBitrate: Integer; cdecl;
    function getChannels: Integer; cdecl;
    function getCodec: Integer; cdecl;
    function getMediaType: JString; cdecl;
    function getProfile: Integer; cdecl;
    function getSampleRate: Integer; cdecl;
  end;
  TJEncoderProfiles_AudioProfile = class(TJavaGenericImport<JEncoderProfiles_AudioProfileClass, JEncoderProfiles_AudioProfile>) end;

  JEncoderProfiles_VideoProfileClass = interface(JObjectClass)
    ['{476C9F34-0F88-4E21-88DB-431375E1690D}']
    {class} function _GetHDR_DOLBY_VISION: Integer; cdecl;
    {class} function _GetHDR_HDR10: Integer; cdecl;
    {class} function _GetHDR_HDR10PLUS: Integer; cdecl;
    {class} function _GetHDR_HLG: Integer; cdecl;
    {class} function _GetHDR_NONE: Integer; cdecl;
    {class} function _GetYUV_420: Integer; cdecl;
    {class} function _GetYUV_422: Integer; cdecl;
    {class} function _GetYUV_444: Integer; cdecl;
    {class} property HDR_DOLBY_VISION: Integer read _GetHDR_DOLBY_VISION;
    {class} property HDR_HDR10: Integer read _GetHDR_HDR10;
    {class} property HDR_HDR10PLUS: Integer read _GetHDR_HDR10PLUS;
    {class} property HDR_HLG: Integer read _GetHDR_HLG;
    {class} property HDR_NONE: Integer read _GetHDR_NONE;
    {class} property YUV_420: Integer read _GetYUV_420;
    {class} property YUV_422: Integer read _GetYUV_422;
    {class} property YUV_444: Integer read _GetYUV_444;
  end;

  [JavaSignature('android/media/EncoderProfiles$VideoProfile')]
  JEncoderProfiles_VideoProfile = interface(JObject)
    ['{7FE31A24-ACA4-4F08-92E5-D491C990BED0}']
    function getBitDepth: Integer; cdecl;
    function getBitrate: Integer; cdecl;
    function getChromaSubsampling: Integer; cdecl;
    function getCodec: Integer; cdecl;
    function getFrameRate: Integer; cdecl;
    function getHdrFormat: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getMediaType: JString; cdecl;
    function getProfile: Integer; cdecl;
    function getWidth: Integer; cdecl;
  end;
  TJEncoderProfiles_VideoProfile = class(TJavaGenericImport<JEncoderProfiles_VideoProfileClass, JEncoderProfiles_VideoProfile>) end;

  JExifInterfaceClass = interface(JObjectClass)
    ['{023B6C11-488A-4106-9562-9DE6A3B3305C}']
    {class} function _GetORIENTATION_FLIP_HORIZONTAL: Integer; cdecl;
    {class} function _GetORIENTATION_FLIP_VERTICAL: Integer; cdecl;
    {class} function _GetORIENTATION_NORMAL: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_180: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_270: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_90: Integer; cdecl;
    {class} function _GetORIENTATION_TRANSPOSE: Integer; cdecl;
    {class} function _GetORIENTATION_TRANSVERSE: Integer; cdecl;
    {class} function _GetORIENTATION_UNDEFINED: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_EXIF_DATA_ONLY: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_FULL_IMAGE_DATA: Integer; cdecl;
    {class} function _GetTAG_APERTURE: JString; cdecl;
    {class} function _GetTAG_APERTURE_VALUE: JString; cdecl;
    {class} function _GetTAG_ARTIST: JString; cdecl;
    {class} function _GetTAG_BITS_PER_SAMPLE: JString; cdecl;
    {class} function _GetTAG_BRIGHTNESS_VALUE: JString; cdecl;
    {class} function _GetTAG_CFA_PATTERN: JString; cdecl;
    {class} function _GetTAG_COLOR_SPACE: JString; cdecl;
    {class} function _GetTAG_COMPONENTS_CONFIGURATION: JString; cdecl;
    {class} function _GetTAG_COMPRESSED_BITS_PER_PIXEL: JString; cdecl;
    {class} function _GetTAG_COMPRESSION: JString; cdecl;
    {class} function _GetTAG_CONTRAST: JString; cdecl;
    {class} function _GetTAG_COPYRIGHT: JString; cdecl;
    {class} function _GetTAG_CUSTOM_RENDERED: JString; cdecl;
    {class} function _GetTAG_DATETIME: JString; cdecl;
    {class} function _GetTAG_DATETIME_DIGITIZED: JString; cdecl;
    {class} function _GetTAG_DATETIME_ORIGINAL: JString; cdecl;
    {class} function _GetTAG_DEFAULT_CROP_SIZE: JString; cdecl;
    {class} function _GetTAG_DEVICE_SETTING_DESCRIPTION: JString; cdecl;
    {class} function _GetTAG_DIGITAL_ZOOM_RATIO: JString; cdecl;
    {class} function _GetTAG_DNG_VERSION: JString; cdecl;
    {class} function _GetTAG_EXIF_VERSION: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_BIAS_VALUE: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_INDEX: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_MODE: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_PROGRAM: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_TIME: JString; cdecl;
    {class} function _GetTAG_FILE_SOURCE: JString; cdecl;
    {class} function _GetTAG_FLASH: JString; cdecl;
    {class} function _GetTAG_FLASHPIX_VERSION: JString; cdecl;
    {class} function _GetTAG_FLASH_ENERGY: JString; cdecl;
    {class} function _GetTAG_FOCAL_LENGTH: JString; cdecl;
    {class} function _GetTAG_FOCAL_LENGTH_IN_35MM_FILM: JString; cdecl;
    {class} function _GetTAG_FOCAL_PLANE_RESOLUTION_UNIT: JString; cdecl;
    {class} function _GetTAG_FOCAL_PLANE_X_RESOLUTION: JString; cdecl;
    {class} function _GetTAG_FOCAL_PLANE_Y_RESOLUTION: JString; cdecl;
    {class} function _GetTAG_F_NUMBER: JString; cdecl;
    {class} function _GetTAG_GAIN_CONTROL: JString; cdecl;
    {class} function _GetTAG_GPS_ALTITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_ALTITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_AREA_INFORMATION: JString; cdecl;
    {class} function _GetTAG_GPS_DATESTAMP: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_BEARING: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_BEARING_REF: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_DISTANCE: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_DISTANCE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_LATITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_LATITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_LONGITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_DEST_LONGITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_DIFFERENTIAL: JString; cdecl;
    {class} function _GetTAG_GPS_DOP: JString; cdecl;
    {class} function _GetTAG_GPS_IMG_DIRECTION: JString; cdecl;
    {class} function _GetTAG_GPS_IMG_DIRECTION_REF: JString; cdecl;
    {class} function _GetTAG_GPS_LATITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_LATITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_LONGITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_LONGITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_MAP_DATUM: JString; cdecl;
    {class} function _GetTAG_GPS_MEASURE_MODE: JString; cdecl;
    {class} function _GetTAG_GPS_PROCESSING_METHOD: JString; cdecl;
    {class} function _GetTAG_GPS_SATELLITES: JString; cdecl;
    {class} function _GetTAG_GPS_SPEED: JString; cdecl;
    {class} function _GetTAG_GPS_SPEED_REF: JString; cdecl;
    {class} function _GetTAG_GPS_STATUS: JString; cdecl;
    {class} function _GetTAG_GPS_TIMESTAMP: JString; cdecl;
    {class} function _GetTAG_GPS_TRACK: JString; cdecl;
    {class} function _GetTAG_GPS_TRACK_REF: JString; cdecl;
    {class} function _GetTAG_GPS_VERSION_ID: JString; cdecl;
    {class} function _GetTAG_IMAGE_DESCRIPTION: JString; cdecl;
    {class} function _GetTAG_IMAGE_LENGTH: JString; cdecl;
    {class} function _GetTAG_IMAGE_UNIQUE_ID: JString; cdecl;
    {class} function _GetTAG_IMAGE_WIDTH: JString; cdecl;
    {class} function _GetTAG_INTEROPERABILITY_INDEX: JString; cdecl;
    {class} function _GetTAG_ISO: JString; cdecl;
    {class} function _GetTAG_ISO_SPEED_RATINGS: JString; cdecl;
    {class} function _GetTAG_JPEG_INTERCHANGE_FORMAT: JString; cdecl;
    {class} function _GetTAG_JPEG_INTERCHANGE_FORMAT_LENGTH: JString; cdecl;
    {class} function _GetTAG_LIGHT_SOURCE: JString; cdecl;
    {class} function _GetTAG_MAKE: JString; cdecl;
    {class} function _GetTAG_MAKER_NOTE: JString; cdecl;
    {class} function _GetTAG_MAX_APERTURE_VALUE: JString; cdecl;
    {class} function _GetTAG_METERING_MODE: JString; cdecl;
    {class} function _GetTAG_MODEL: JString; cdecl;
    {class} function _GetTAG_NEW_SUBFILE_TYPE: JString; cdecl;
    {class} function _GetTAG_OECF: JString; cdecl;
    {class} function _GetTAG_OFFSET_TIME: JString; cdecl;
    {class} function _GetTAG_OFFSET_TIME_DIGITIZED: JString; cdecl;
    {class} function _GetTAG_OFFSET_TIME_ORIGINAL: JString; cdecl;
    {class} function _GetTAG_ORF_ASPECT_FRAME: JString; cdecl;
    {class} function _GetTAG_ORF_PREVIEW_IMAGE_LENGTH: JString; cdecl;
    {class} function _GetTAG_ORF_PREVIEW_IMAGE_START: JString; cdecl;
    {class} function _GetTAG_ORF_THUMBNAIL_IMAGE: JString; cdecl;
    {class} function _GetTAG_ORIENTATION: JString; cdecl;
    {class} function _GetTAG_PHOTOMETRIC_INTERPRETATION: JString; cdecl;
    {class} function _GetTAG_PIXEL_X_DIMENSION: JString; cdecl;
    {class} function _GetTAG_PIXEL_Y_DIMENSION: JString; cdecl;
    {class} function _GetTAG_PLANAR_CONFIGURATION: JString; cdecl;
    {class} function _GetTAG_PRIMARY_CHROMATICITIES: JString; cdecl;
    {class} function _GetTAG_REFERENCE_BLACK_WHITE: JString; cdecl;
    {class} function _GetTAG_RELATED_SOUND_FILE: JString; cdecl;
    {class} function _GetTAG_RESOLUTION_UNIT: JString; cdecl;
    {class} function _GetTAG_ROWS_PER_STRIP: JString; cdecl;
    {class} function _GetTAG_RW2_ISO: JString; cdecl;
    {class} function _GetTAG_RW2_JPG_FROM_RAW: JString; cdecl;
    {class} function _GetTAG_RW2_SENSOR_BOTTOM_BORDER: JString; cdecl;
    {class} function _GetTAG_RW2_SENSOR_LEFT_BORDER: JString; cdecl;
    {class} function _GetTAG_RW2_SENSOR_RIGHT_BORDER: JString; cdecl;
    {class} function _GetTAG_RW2_SENSOR_TOP_BORDER: JString; cdecl;
    {class} function _GetTAG_SAMPLES_PER_PIXEL: JString; cdecl;
    {class} function _GetTAG_SATURATION: JString; cdecl;
    {class} function _GetTAG_SCENE_CAPTURE_TYPE: JString; cdecl;
    {class} function _GetTAG_SCENE_TYPE: JString; cdecl;
    {class} function _GetTAG_SENSING_METHOD: JString; cdecl;
    {class} function _GetTAG_SHARPNESS: JString; cdecl;
    {class} function _GetTAG_SHUTTER_SPEED_VALUE: JString; cdecl;
    {class} function _GetTAG_SOFTWARE: JString; cdecl;
    {class} function _GetTAG_SPATIAL_FREQUENCY_RESPONSE: JString; cdecl;
    {class} function _GetTAG_SPECTRAL_SENSITIVITY: JString; cdecl;
    {class} function _GetTAG_STRIP_BYTE_COUNTS: JString; cdecl;
    {class} function _GetTAG_STRIP_OFFSETS: JString; cdecl;
    {class} function _GetTAG_SUBFILE_TYPE: JString; cdecl;
    {class} function _GetTAG_SUBJECT_AREA: JString; cdecl;
    {class} function _GetTAG_SUBJECT_DISTANCE: JString; cdecl;
    {class} function _GetTAG_SUBJECT_DISTANCE_RANGE: JString; cdecl;
    {class} function _GetTAG_SUBJECT_LOCATION: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_DIG: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_DIGITIZED: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_ORIG: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_ORIGINAL: JString; cdecl;
    {class} function _GetTAG_THUMBNAIL_IMAGE_LENGTH: JString; cdecl;
    {class} function _GetTAG_THUMBNAIL_IMAGE_WIDTH: JString; cdecl;
    {class} function _GetTAG_THUMBNAIL_ORIENTATION: JString; cdecl;
    {class} function _GetTAG_TRANSFER_FUNCTION: JString; cdecl;
    {class} function _GetTAG_USER_COMMENT: JString; cdecl;
    {class} function _GetTAG_WHITE_BALANCE: JString; cdecl;
    {class} function _GetTAG_WHITE_POINT: JString; cdecl;
    {class} function _GetTAG_XMP: JString; cdecl;
    {class} function _GetTAG_X_RESOLUTION: JString; cdecl;
    {class} function _GetTAG_Y_CB_CR_COEFFICIENTS: JString; cdecl;
    {class} function _GetTAG_Y_CB_CR_POSITIONING: JString; cdecl;
    {class} function _GetTAG_Y_CB_CR_SUB_SAMPLING: JString; cdecl;
    {class} function _GetTAG_Y_RESOLUTION: JString; cdecl;
    {class} function _GetWHITEBALANCE_AUTO: Integer; cdecl;
    {class} function _GetWHITEBALANCE_MANUAL: Integer; cdecl;
    {class} function init(file_: JFile): JExifInterface; cdecl; overload;
    {class} function init(filename: JString): JExifInterface; cdecl; overload;
    {class} function init(fileDescriptor: JFileDescriptor): JExifInterface; cdecl; overload;
    {class} function init(inputStream: JInputStream): JExifInterface; cdecl; overload;
    {class} function init(inputStream: JInputStream; streamType: Integer): JExifInterface; cdecl; overload;
    {class} function isSupportedMimeType(mimeType: JString): Boolean; cdecl;
    {class} property ORIENTATION_FLIP_HORIZONTAL: Integer read _GetORIENTATION_FLIP_HORIZONTAL;
    {class} property ORIENTATION_FLIP_VERTICAL: Integer read _GetORIENTATION_FLIP_VERTICAL;
    {class} property ORIENTATION_NORMAL: Integer read _GetORIENTATION_NORMAL;
    {class} property ORIENTATION_ROTATE_180: Integer read _GetORIENTATION_ROTATE_180;
    {class} property ORIENTATION_ROTATE_270: Integer read _GetORIENTATION_ROTATE_270;
    {class} property ORIENTATION_ROTATE_90: Integer read _GetORIENTATION_ROTATE_90;
    {class} property ORIENTATION_TRANSPOSE: Integer read _GetORIENTATION_TRANSPOSE;
    {class} property ORIENTATION_TRANSVERSE: Integer read _GetORIENTATION_TRANSVERSE;
    {class} property ORIENTATION_UNDEFINED: Integer read _GetORIENTATION_UNDEFINED;
    {class} property STREAM_TYPE_EXIF_DATA_ONLY: Integer read _GetSTREAM_TYPE_EXIF_DATA_ONLY;
    {class} property STREAM_TYPE_FULL_IMAGE_DATA: Integer read _GetSTREAM_TYPE_FULL_IMAGE_DATA;
    {class} property TAG_APERTURE: JString read _GetTAG_APERTURE;
    {class} property TAG_APERTURE_VALUE: JString read _GetTAG_APERTURE_VALUE;
    {class} property TAG_ARTIST: JString read _GetTAG_ARTIST;
    {class} property TAG_BITS_PER_SAMPLE: JString read _GetTAG_BITS_PER_SAMPLE;
    {class} property TAG_BRIGHTNESS_VALUE: JString read _GetTAG_BRIGHTNESS_VALUE;
    {class} property TAG_CFA_PATTERN: JString read _GetTAG_CFA_PATTERN;
    {class} property TAG_COLOR_SPACE: JString read _GetTAG_COLOR_SPACE;
    {class} property TAG_COMPONENTS_CONFIGURATION: JString read _GetTAG_COMPONENTS_CONFIGURATION;
    {class} property TAG_COMPRESSED_BITS_PER_PIXEL: JString read _GetTAG_COMPRESSED_BITS_PER_PIXEL;
    {class} property TAG_COMPRESSION: JString read _GetTAG_COMPRESSION;
    {class} property TAG_CONTRAST: JString read _GetTAG_CONTRAST;
    {class} property TAG_COPYRIGHT: JString read _GetTAG_COPYRIGHT;
    {class} property TAG_CUSTOM_RENDERED: JString read _GetTAG_CUSTOM_RENDERED;
    {class} property TAG_DATETIME: JString read _GetTAG_DATETIME;
    {class} property TAG_DATETIME_DIGITIZED: JString read _GetTAG_DATETIME_DIGITIZED;
    {class} property TAG_DATETIME_ORIGINAL: JString read _GetTAG_DATETIME_ORIGINAL;
    {class} property TAG_DEFAULT_CROP_SIZE: JString read _GetTAG_DEFAULT_CROP_SIZE;
    {class} property TAG_DEVICE_SETTING_DESCRIPTION: JString read _GetTAG_DEVICE_SETTING_DESCRIPTION;
    {class} property TAG_DIGITAL_ZOOM_RATIO: JString read _GetTAG_DIGITAL_ZOOM_RATIO;
    {class} property TAG_DNG_VERSION: JString read _GetTAG_DNG_VERSION;
    {class} property TAG_EXIF_VERSION: JString read _GetTAG_EXIF_VERSION;
    {class} property TAG_EXPOSURE_BIAS_VALUE: JString read _GetTAG_EXPOSURE_BIAS_VALUE;
    {class} property TAG_EXPOSURE_INDEX: JString read _GetTAG_EXPOSURE_INDEX;
    {class} property TAG_EXPOSURE_MODE: JString read _GetTAG_EXPOSURE_MODE;
    {class} property TAG_EXPOSURE_PROGRAM: JString read _GetTAG_EXPOSURE_PROGRAM;
    {class} property TAG_EXPOSURE_TIME: JString read _GetTAG_EXPOSURE_TIME;
    {class} property TAG_FILE_SOURCE: JString read _GetTAG_FILE_SOURCE;
    {class} property TAG_FLASH: JString read _GetTAG_FLASH;
    {class} property TAG_FLASHPIX_VERSION: JString read _GetTAG_FLASHPIX_VERSION;
    {class} property TAG_FLASH_ENERGY: JString read _GetTAG_FLASH_ENERGY;
    {class} property TAG_FOCAL_LENGTH: JString read _GetTAG_FOCAL_LENGTH;
    {class} property TAG_FOCAL_LENGTH_IN_35MM_FILM: JString read _GetTAG_FOCAL_LENGTH_IN_35MM_FILM;
    {class} property TAG_FOCAL_PLANE_RESOLUTION_UNIT: JString read _GetTAG_FOCAL_PLANE_RESOLUTION_UNIT;
    {class} property TAG_FOCAL_PLANE_X_RESOLUTION: JString read _GetTAG_FOCAL_PLANE_X_RESOLUTION;
    {class} property TAG_FOCAL_PLANE_Y_RESOLUTION: JString read _GetTAG_FOCAL_PLANE_Y_RESOLUTION;
    {class} property TAG_F_NUMBER: JString read _GetTAG_F_NUMBER;
    {class} property TAG_GAIN_CONTROL: JString read _GetTAG_GAIN_CONTROL;
    {class} property TAG_GPS_ALTITUDE: JString read _GetTAG_GPS_ALTITUDE;
    {class} property TAG_GPS_ALTITUDE_REF: JString read _GetTAG_GPS_ALTITUDE_REF;
    {class} property TAG_GPS_AREA_INFORMATION: JString read _GetTAG_GPS_AREA_INFORMATION;
    {class} property TAG_GPS_DATESTAMP: JString read _GetTAG_GPS_DATESTAMP;
    {class} property TAG_GPS_DEST_BEARING: JString read _GetTAG_GPS_DEST_BEARING;
    {class} property TAG_GPS_DEST_BEARING_REF: JString read _GetTAG_GPS_DEST_BEARING_REF;
    {class} property TAG_GPS_DEST_DISTANCE: JString read _GetTAG_GPS_DEST_DISTANCE;
    {class} property TAG_GPS_DEST_DISTANCE_REF: JString read _GetTAG_GPS_DEST_DISTANCE_REF;
    {class} property TAG_GPS_DEST_LATITUDE: JString read _GetTAG_GPS_DEST_LATITUDE;
    {class} property TAG_GPS_DEST_LATITUDE_REF: JString read _GetTAG_GPS_DEST_LATITUDE_REF;
    {class} property TAG_GPS_DEST_LONGITUDE: JString read _GetTAG_GPS_DEST_LONGITUDE;
    {class} property TAG_GPS_DEST_LONGITUDE_REF: JString read _GetTAG_GPS_DEST_LONGITUDE_REF;
    {class} property TAG_GPS_DIFFERENTIAL: JString read _GetTAG_GPS_DIFFERENTIAL;
    {class} property TAG_GPS_DOP: JString read _GetTAG_GPS_DOP;
    {class} property TAG_GPS_IMG_DIRECTION: JString read _GetTAG_GPS_IMG_DIRECTION;
    {class} property TAG_GPS_IMG_DIRECTION_REF: JString read _GetTAG_GPS_IMG_DIRECTION_REF;
    {class} property TAG_GPS_LATITUDE: JString read _GetTAG_GPS_LATITUDE;
    {class} property TAG_GPS_LATITUDE_REF: JString read _GetTAG_GPS_LATITUDE_REF;
    {class} property TAG_GPS_LONGITUDE: JString read _GetTAG_GPS_LONGITUDE;
    {class} property TAG_GPS_LONGITUDE_REF: JString read _GetTAG_GPS_LONGITUDE_REF;
    {class} property TAG_GPS_MAP_DATUM: JString read _GetTAG_GPS_MAP_DATUM;
    {class} property TAG_GPS_MEASURE_MODE: JString read _GetTAG_GPS_MEASURE_MODE;
    {class} property TAG_GPS_PROCESSING_METHOD: JString read _GetTAG_GPS_PROCESSING_METHOD;
    {class} property TAG_GPS_SATELLITES: JString read _GetTAG_GPS_SATELLITES;
    {class} property TAG_GPS_SPEED: JString read _GetTAG_GPS_SPEED;
    {class} property TAG_GPS_SPEED_REF: JString read _GetTAG_GPS_SPEED_REF;
    {class} property TAG_GPS_STATUS: JString read _GetTAG_GPS_STATUS;
    {class} property TAG_GPS_TIMESTAMP: JString read _GetTAG_GPS_TIMESTAMP;
    {class} property TAG_GPS_TRACK: JString read _GetTAG_GPS_TRACK;
    {class} property TAG_GPS_TRACK_REF: JString read _GetTAG_GPS_TRACK_REF;
    {class} property TAG_GPS_VERSION_ID: JString read _GetTAG_GPS_VERSION_ID;
    {class} property TAG_IMAGE_DESCRIPTION: JString read _GetTAG_IMAGE_DESCRIPTION;
    {class} property TAG_IMAGE_LENGTH: JString read _GetTAG_IMAGE_LENGTH;
    {class} property TAG_IMAGE_UNIQUE_ID: JString read _GetTAG_IMAGE_UNIQUE_ID;
    {class} property TAG_IMAGE_WIDTH: JString read _GetTAG_IMAGE_WIDTH;
    {class} property TAG_INTEROPERABILITY_INDEX: JString read _GetTAG_INTEROPERABILITY_INDEX;
    {class} property TAG_ISO: JString read _GetTAG_ISO;
    {class} property TAG_ISO_SPEED_RATINGS: JString read _GetTAG_ISO_SPEED_RATINGS;
    {class} property TAG_JPEG_INTERCHANGE_FORMAT: JString read _GetTAG_JPEG_INTERCHANGE_FORMAT;
    {class} property TAG_JPEG_INTERCHANGE_FORMAT_LENGTH: JString read _GetTAG_JPEG_INTERCHANGE_FORMAT_LENGTH;
    {class} property TAG_LIGHT_SOURCE: JString read _GetTAG_LIGHT_SOURCE;
    {class} property TAG_MAKE: JString read _GetTAG_MAKE;
    {class} property TAG_MAKER_NOTE: JString read _GetTAG_MAKER_NOTE;
    {class} property TAG_MAX_APERTURE_VALUE: JString read _GetTAG_MAX_APERTURE_VALUE;
    {class} property TAG_METERING_MODE: JString read _GetTAG_METERING_MODE;
    {class} property TAG_MODEL: JString read _GetTAG_MODEL;
    {class} property TAG_NEW_SUBFILE_TYPE: JString read _GetTAG_NEW_SUBFILE_TYPE;
    {class} property TAG_OECF: JString read _GetTAG_OECF;
    {class} property TAG_OFFSET_TIME: JString read _GetTAG_OFFSET_TIME;
    {class} property TAG_OFFSET_TIME_DIGITIZED: JString read _GetTAG_OFFSET_TIME_DIGITIZED;
    {class} property TAG_OFFSET_TIME_ORIGINAL: JString read _GetTAG_OFFSET_TIME_ORIGINAL;
    {class} property TAG_ORF_ASPECT_FRAME: JString read _GetTAG_ORF_ASPECT_FRAME;
    {class} property TAG_ORF_PREVIEW_IMAGE_LENGTH: JString read _GetTAG_ORF_PREVIEW_IMAGE_LENGTH;
    {class} property TAG_ORF_PREVIEW_IMAGE_START: JString read _GetTAG_ORF_PREVIEW_IMAGE_START;
    {class} property TAG_ORF_THUMBNAIL_IMAGE: JString read _GetTAG_ORF_THUMBNAIL_IMAGE;
    {class} property TAG_ORIENTATION: JString read _GetTAG_ORIENTATION;
    {class} property TAG_PHOTOMETRIC_INTERPRETATION: JString read _GetTAG_PHOTOMETRIC_INTERPRETATION;
    {class} property TAG_PIXEL_X_DIMENSION: JString read _GetTAG_PIXEL_X_DIMENSION;
    {class} property TAG_PIXEL_Y_DIMENSION: JString read _GetTAG_PIXEL_Y_DIMENSION;
    {class} property TAG_PLANAR_CONFIGURATION: JString read _GetTAG_PLANAR_CONFIGURATION;
    {class} property TAG_PRIMARY_CHROMATICITIES: JString read _GetTAG_PRIMARY_CHROMATICITIES;
    {class} property TAG_REFERENCE_BLACK_WHITE: JString read _GetTAG_REFERENCE_BLACK_WHITE;
    {class} property TAG_RELATED_SOUND_FILE: JString read _GetTAG_RELATED_SOUND_FILE;
    {class} property TAG_RESOLUTION_UNIT: JString read _GetTAG_RESOLUTION_UNIT;
    {class} property TAG_ROWS_PER_STRIP: JString read _GetTAG_ROWS_PER_STRIP;
    {class} property TAG_RW2_ISO: JString read _GetTAG_RW2_ISO;
    {class} property TAG_RW2_JPG_FROM_RAW: JString read _GetTAG_RW2_JPG_FROM_RAW;
    {class} property TAG_RW2_SENSOR_BOTTOM_BORDER: JString read _GetTAG_RW2_SENSOR_BOTTOM_BORDER;
    {class} property TAG_RW2_SENSOR_LEFT_BORDER: JString read _GetTAG_RW2_SENSOR_LEFT_BORDER;
    {class} property TAG_RW2_SENSOR_RIGHT_BORDER: JString read _GetTAG_RW2_SENSOR_RIGHT_BORDER;
    {class} property TAG_RW2_SENSOR_TOP_BORDER: JString read _GetTAG_RW2_SENSOR_TOP_BORDER;
    {class} property TAG_SAMPLES_PER_PIXEL: JString read _GetTAG_SAMPLES_PER_PIXEL;
    {class} property TAG_SATURATION: JString read _GetTAG_SATURATION;
    {class} property TAG_SCENE_CAPTURE_TYPE: JString read _GetTAG_SCENE_CAPTURE_TYPE;
    {class} property TAG_SCENE_TYPE: JString read _GetTAG_SCENE_TYPE;
    {class} property TAG_SENSING_METHOD: JString read _GetTAG_SENSING_METHOD;
    {class} property TAG_SHARPNESS: JString read _GetTAG_SHARPNESS;
    {class} property TAG_SHUTTER_SPEED_VALUE: JString read _GetTAG_SHUTTER_SPEED_VALUE;
    {class} property TAG_SOFTWARE: JString read _GetTAG_SOFTWARE;
    {class} property TAG_SPATIAL_FREQUENCY_RESPONSE: JString read _GetTAG_SPATIAL_FREQUENCY_RESPONSE;
    {class} property TAG_SPECTRAL_SENSITIVITY: JString read _GetTAG_SPECTRAL_SENSITIVITY;
    {class} property TAG_STRIP_BYTE_COUNTS: JString read _GetTAG_STRIP_BYTE_COUNTS;
    {class} property TAG_STRIP_OFFSETS: JString read _GetTAG_STRIP_OFFSETS;
    {class} property TAG_SUBFILE_TYPE: JString read _GetTAG_SUBFILE_TYPE;
    {class} property TAG_SUBJECT_AREA: JString read _GetTAG_SUBJECT_AREA;
    {class} property TAG_SUBJECT_DISTANCE: JString read _GetTAG_SUBJECT_DISTANCE;
    {class} property TAG_SUBJECT_DISTANCE_RANGE: JString read _GetTAG_SUBJECT_DISTANCE_RANGE;
    {class} property TAG_SUBJECT_LOCATION: JString read _GetTAG_SUBJECT_LOCATION;
    {class} property TAG_SUBSEC_TIME: JString read _GetTAG_SUBSEC_TIME;
    {class} property TAG_SUBSEC_TIME_DIG: JString read _GetTAG_SUBSEC_TIME_DIG;
    {class} property TAG_SUBSEC_TIME_DIGITIZED: JString read _GetTAG_SUBSEC_TIME_DIGITIZED;
    {class} property TAG_SUBSEC_TIME_ORIG: JString read _GetTAG_SUBSEC_TIME_ORIG;
    {class} property TAG_SUBSEC_TIME_ORIGINAL: JString read _GetTAG_SUBSEC_TIME_ORIGINAL;
    {class} property TAG_THUMBNAIL_IMAGE_LENGTH: JString read _GetTAG_THUMBNAIL_IMAGE_LENGTH;
    {class} property TAG_THUMBNAIL_IMAGE_WIDTH: JString read _GetTAG_THUMBNAIL_IMAGE_WIDTH;
    {class} property TAG_THUMBNAIL_ORIENTATION: JString read _GetTAG_THUMBNAIL_ORIENTATION;
    {class} property TAG_TRANSFER_FUNCTION: JString read _GetTAG_TRANSFER_FUNCTION;
    {class} property TAG_USER_COMMENT: JString read _GetTAG_USER_COMMENT;
    {class} property TAG_WHITE_BALANCE: JString read _GetTAG_WHITE_BALANCE;
    {class} property TAG_WHITE_POINT: JString read _GetTAG_WHITE_POINT;
    {class} property TAG_XMP: JString read _GetTAG_XMP;
    {class} property TAG_X_RESOLUTION: JString read _GetTAG_X_RESOLUTION;
    {class} property TAG_Y_CB_CR_COEFFICIENTS: JString read _GetTAG_Y_CB_CR_COEFFICIENTS;
    {class} property TAG_Y_CB_CR_POSITIONING: JString read _GetTAG_Y_CB_CR_POSITIONING;
    {class} property TAG_Y_CB_CR_SUB_SAMPLING: JString read _GetTAG_Y_CB_CR_SUB_SAMPLING;
    {class} property TAG_Y_RESOLUTION: JString read _GetTAG_Y_RESOLUTION;
    {class} property WHITEBALANCE_AUTO: Integer read _GetWHITEBALANCE_AUTO;
    {class} property WHITEBALANCE_MANUAL: Integer read _GetWHITEBALANCE_MANUAL;
  end;

  [JavaSignature('android/media/ExifInterface')]
  JExifInterface = interface(JObject)
    ['{A1FEA8A4-6E88-46E7-BB89-BC24ACA69331}']
    function getAltitude(defaultValue: Double): Double; cdecl;
    function getAttribute(tag: JString): JString; cdecl;
    function getAttributeBytes(tag: JString): TJavaArray<Byte>; cdecl;
    function getAttributeDouble(tag: JString; defaultValue: Double): Double; cdecl;
    function getAttributeInt(tag: JString; defaultValue: Integer): Integer; cdecl;
    function getAttributeRange(tag: JString): TJavaArray<Int64>; cdecl;
    function getDateTime: Int64; cdecl;
    function getDateTimeDigitized: Int64; cdecl;
    function getDateTimeOriginal: Int64; cdecl;
    function getGpsDateTime: Int64; cdecl;
    function getLatLong(output: TJavaArray<Single>): Boolean; cdecl;
    function getThumbnail: TJavaArray<Byte>; cdecl;
    function getThumbnailBitmap: JBitmap; cdecl;
    function getThumbnailBytes: TJavaArray<Byte>; cdecl;
    function getThumbnailRange: TJavaArray<Int64>; cdecl;
    function hasAttribute(tag: JString): Boolean; cdecl;
    function hasThumbnail: Boolean; cdecl;
    function isThumbnailCompressed: Boolean; cdecl;
    procedure saveAttributes; cdecl;
    procedure setAttribute(tag: JString; value: JString); cdecl;
  end;
  TJExifInterface = class(TJavaGenericImport<JExifInterfaceClass, JExifInterface>) end;

  JFaceDetectorClass = interface(JObjectClass)
    ['{1EFF1585-F9D1-473B-8157-809AF8522E6C}']
    {class} function init(width: Integer; height: Integer; maxFaces: Integer): JFaceDetector; cdecl;
  end;

  [JavaSignature('android/media/FaceDetector')]
  JFaceDetector = interface(JObject)
    ['{51F75D8F-DFA7-4368-B73F-DE24C7C060E4}']
    function findFaces(bitmap: JBitmap; faces: TJavaObjectArray<JFaceDetector_Face>): Integer; cdecl;
  end;
  TJFaceDetector = class(TJavaGenericImport<JFaceDetectorClass, JFaceDetector>) end;

  JFaceDetector_FaceClass = interface(JObjectClass)
    ['{17134C3D-57CA-4AF8-8AF5-042B9891843E}']
    {class} function _GetCONFIDENCE_THRESHOLD: Single; cdecl;
    {class} function _GetEULER_X: Integer; cdecl;
    {class} function _GetEULER_Y: Integer; cdecl;
    {class} function _GetEULER_Z: Integer; cdecl;
    {class} property CONFIDENCE_THRESHOLD: Single read _GetCONFIDENCE_THRESHOLD;
    {class} property EULER_X: Integer read _GetEULER_X;
    {class} property EULER_Y: Integer read _GetEULER_Y;
    {class} property EULER_Z: Integer read _GetEULER_Z;
  end;

  [JavaSignature('android/media/FaceDetector$Face')]
  JFaceDetector_Face = interface(JObject)
    ['{45D33BFD-93F8-4603-BA45-E24ED10ABE1E}']
    function confidence: Single; cdecl;
    function eyesDistance: Single; cdecl;
    procedure getMidPoint(point: JPointF); cdecl;
    function pose(euler: Integer): Single; cdecl;
  end;
  TJFaceDetector_Face = class(TJavaGenericImport<JFaceDetector_FaceClass, JFaceDetector_Face>) end;

  JImageClass = interface(JObjectClass)
    ['{222370FD-2F78-455E-8287-D8E3BCEBF8DA}']
  end;

  [JavaSignature('android/media/Image')]
  JImage = interface(JObject)
    ['{1433F1F5-7A0D-4F00-8551-D25DA9CE6B4D}']
    procedure close; cdecl;
    function getCropRect: JRect; cdecl;
    function getDataSpace: Integer; cdecl;
    function getFence: JSyncFence; cdecl;
    function getFormat: Integer; cdecl;
    function getHardwareBuffer: JHardwareBuffer; cdecl;
    function getHeight: Integer; cdecl;
    function getPlanes: TJavaObjectArray<JImage_Plane>; cdecl;
    function getTimestamp: Int64; cdecl;
    function getWidth: Integer; cdecl;
    procedure setCropRect(cropRect: JRect); cdecl;
    procedure setDataSpace(dataSpace: Integer); cdecl;
    procedure setFence(fence: JSyncFence); cdecl;
    procedure setTimestamp(timestamp: Int64); cdecl;
  end;
  TJImage = class(TJavaGenericImport<JImageClass, JImage>) end;

  JImage_PlaneClass = interface(JObjectClass)
    ['{9FC1C95F-4623-461D-A1F9-64209E469FE6}']
  end;

  [JavaSignature('android/media/Image$Plane')]
  JImage_Plane = interface(JObject)
    ['{CC2F324B-70D7-4ACD-A0C6-516372E18651}']
    function getBuffer: JByteBuffer; cdecl;
    function getPixelStride: Integer; cdecl;
    function getRowStride: Integer; cdecl;
  end;
  TJImage_Plane = class(TJavaGenericImport<JImage_PlaneClass, JImage_Plane>) end;

  JImageReaderClass = interface(JObjectClass)
    ['{D8EA1DC9-1A2D-42B8-BCA9-BDD6BACF2B5D}']
    {class} function newInstance(width: Integer; height: Integer; format: Integer; maxImages: Integer): JImageReader; cdecl; overload;
    {class} function newInstance(width: Integer; height: Integer; format: Integer; maxImages: Integer; usage: Int64): JImageReader; cdecl; overload;
  end;

  [JavaSignature('android/media/ImageReader')]
  JImageReader = interface(JObject)
    ['{9C4D5031-D450-4FFC-B555-67A8E8AEF4A4}']
    function acquireLatestImage: JImage; cdecl;
    function acquireNextImage: JImage; cdecl;
    procedure close; cdecl;
    procedure discardFreeBuffers; cdecl;
    function getDataSpace: Integer; cdecl;
    function getHardwareBufferFormat: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getImageFormat: Integer; cdecl;
    function getMaxImages: Integer; cdecl;
    function getSurface: JSurface; cdecl;
    function getUsage: Int64; cdecl;
    function getWidth: Integer; cdecl;
    procedure setOnImageAvailableListener(listener: JImageReader_OnImageAvailableListener; handler: JHandler); cdecl;
  end;
  TJImageReader = class(TJavaGenericImport<JImageReaderClass, JImageReader>) end;

  JImageReader_BuilderClass = interface(JObjectClass)
    ['{8DFF064D-665D-42F1-8F1B-7A5EECBA89B1}']
    {class} function init(width: Integer; height: Integer): JImageReader_Builder; cdecl;
  end;

  [JavaSignature('android/media/ImageReader$Builder')]
  JImageReader_Builder = interface(JObject)
    ['{874C5C3A-CB13-403E-B89F-E8B4D67FF858}']
    function build: JImageReader; cdecl;
    function setDefaultDataSpace(dataSpace: Integer): JImageReader_Builder; cdecl;
    function setDefaultHardwareBufferFormat(hardwareBufferFormat: Integer): JImageReader_Builder; cdecl;
    function setImageFormat(imageFormat: Integer): JImageReader_Builder; cdecl;
    function setMaxImages(maxImages: Integer): JImageReader_Builder; cdecl;
    function setUsage(usage: Int64): JImageReader_Builder; cdecl;
  end;
  TJImageReader_Builder = class(TJavaGenericImport<JImageReader_BuilderClass, JImageReader_Builder>) end;

  JImageReader_OnImageAvailableListenerClass = interface(IJavaClass)
    ['{33317279-C3D3-40D2-9A41-F34FC98572A7}']
  end;

  [JavaSignature('android/media/ImageReader$OnImageAvailableListener')]
  JImageReader_OnImageAvailableListener = interface(IJavaInstance)
    ['{9FD886E2-54F8-4503-BF77-F112A0645C31}']
    procedure onImageAvailable(reader: JImageReader); cdecl;
  end;
  TJImageReader_OnImageAvailableListener = class(TJavaGenericImport<JImageReader_OnImageAvailableListenerClass, JImageReader_OnImageAvailableListener>) end;

  JImageWriterClass = interface(JObjectClass)
    ['{7BDA487C-CABD-4F23-AA24-AB6EEE8453EC}']
    {class} function newInstance(surface: JSurface; maxImages: Integer): JImageWriter; cdecl; overload;
    {class} function newInstance(surface: JSurface; maxImages: Integer; format: Integer): JImageWriter; cdecl; overload;
  end;

  [JavaSignature('android/media/ImageWriter')]
  JImageWriter = interface(JObject)
    ['{439AF5FD-217C-4772-828E-6C8614556D67}']
    procedure close; cdecl;
    function dequeueInputImage: JImage; cdecl;
    function getDataSpace: Integer; cdecl;
    function getFormat: Integer; cdecl;
    function getHardwareBufferFormat: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getMaxImages: Integer; cdecl;
    function getUsage: Int64; cdecl;
    function getWidth: Integer; cdecl;
    procedure queueInputImage(image: JImage); cdecl;
    procedure setOnImageReleasedListener(listener: JImageWriter_OnImageReleasedListener; handler: JHandler); cdecl;
  end;
  TJImageWriter = class(TJavaGenericImport<JImageWriterClass, JImageWriter>) end;

  JImageWriter_BuilderClass = interface(JObjectClass)
    ['{8971E2BA-D2CF-429D-ADCB-369213A818CC}']
    {class} function init(surface: JSurface): JImageWriter_Builder; cdecl;
  end;

  [JavaSignature('android/media/ImageWriter$Builder')]
  JImageWriter_Builder = interface(JObject)
    ['{58CFEE03-86FC-42AE-B8CA-CA4A4804145E}']
    function build: JImageWriter; cdecl;
    function setDataSpace(dataSpace: Integer): JImageWriter_Builder; cdecl;
    function setHardwareBufferFormat(hardwareBufferFormat: Integer): JImageWriter_Builder; cdecl;
    function setImageFormat(imageFormat: Integer): JImageWriter_Builder; cdecl;
    function setMaxImages(maxImages: Integer): JImageWriter_Builder; cdecl;
    function setUsage(usage: Int64): JImageWriter_Builder; cdecl;
    function setWidthAndHeight(width: Integer; height: Integer): JImageWriter_Builder; cdecl;
  end;
  TJImageWriter_Builder = class(TJavaGenericImport<JImageWriter_BuilderClass, JImageWriter_Builder>) end;

  JImageWriter_OnImageReleasedListenerClass = interface(IJavaClass)
    ['{1503EC3F-E332-4673-AEE2-233E46C74A66}']
  end;

  [JavaSignature('android/media/ImageWriter$OnImageReleasedListener')]
  JImageWriter_OnImageReleasedListener = interface(IJavaInstance)
    ['{468D8616-1AAE-4485-95A8-3805CB1DB12A}']
    procedure onImageReleased(writer: JImageWriter); cdecl;
  end;
  TJImageWriter_OnImageReleasedListener = class(TJavaGenericImport<JImageWriter_OnImageReleasedListenerClass, JImageWriter_OnImageReleasedListener>) end;

  JJetPlayerClass = interface(JObjectClass)
    ['{2CA09255-297D-4CAE-A504-4B4D00375EC3}']
    {class} function getJetPlayer: JJetPlayer; cdecl;
    {class} function getMaxTracks: Integer; cdecl;
  end;

  [JavaSignature('android/media/JetPlayer')]
  JJetPlayer = interface(JObject)
    ['{3E8DCD57-E0F8-4526-BFA1-62121FB1B4C2}']
    function clearQueue: Boolean; cdecl;
    function clone: JObject; cdecl;
    function closeJetFile: Boolean; cdecl;
    function loadJetFile(path: JString): Boolean; cdecl; overload;
    function loadJetFile(afd: JAssetFileDescriptor): Boolean; cdecl; overload;
    function pause: Boolean; cdecl;
    function play: Boolean; cdecl;
    function queueJetSegment(segmentNum: Integer; libNum: Integer; repeatCount: Integer; transpose: Integer; muteFlags: Integer; userID: Byte): Boolean; cdecl;
    function queueJetSegmentMuteArray(segmentNum: Integer; libNum: Integer; repeatCount: Integer; transpose: Integer; muteArray: TJavaArray<Boolean>; userID: Byte): Boolean; cdecl;
    procedure release; cdecl;
    procedure setEventListener(listener: JJetPlayer_OnJetEventListener); cdecl; overload;
    procedure setEventListener(listener: JJetPlayer_OnJetEventListener; handler: JHandler); cdecl; overload;
    function setMuteArray(muteArray: TJavaArray<Boolean>; sync: Boolean): Boolean; cdecl;
    function setMuteFlag(trackId: Integer; muteFlag: Boolean; sync: Boolean): Boolean; cdecl;
    function setMuteFlags(muteFlags: Integer; sync: Boolean): Boolean; cdecl;
    function triggerClip(clipId: Integer): Boolean; cdecl;
  end;
  TJJetPlayer = class(TJavaGenericImport<JJetPlayerClass, JJetPlayer>) end;

  JJetPlayer_OnJetEventListenerClass = interface(IJavaClass)
    ['{1B13E4B7-FC2B-4396-9E99-04D8FDE142F7}']
  end;

  [JavaSignature('android/media/JetPlayer$OnJetEventListener')]
  JJetPlayer_OnJetEventListener = interface(IJavaInstance)
    ['{3F6F1880-0533-4008-91A0-EDA0C4C2EC62}']
    procedure onJetEvent(player: JJetPlayer; segment: SmallInt; track: Byte; channel: Byte; controller: Byte; value: Byte); cdecl;
    procedure onJetNumQueuedSegmentUpdate(player: JJetPlayer; nbSegments: Integer); cdecl;
    procedure onJetPauseUpdate(player: JJetPlayer; paused: Integer); cdecl;
    procedure onJetUserIdUpdate(player: JJetPlayer; userId: Integer; repeatCount: Integer); cdecl;
  end;
  TJJetPlayer_OnJetEventListener = class(TJavaGenericImport<JJetPlayer_OnJetEventListenerClass, JJetPlayer_OnJetEventListener>) end;

  JMediaActionSoundClass = interface(JObjectClass)
    ['{2B4CEE61-D673-4EDE-9154-6C7D30F15988}']
    {class} function _GetFOCUS_COMPLETE: Integer; cdecl;
    {class} function _GetSHUTTER_CLICK: Integer; cdecl;
    {class} function _GetSTART_VIDEO_RECORDING: Integer; cdecl;
    {class} function _GetSTOP_VIDEO_RECORDING: Integer; cdecl;
    {class} function init: JMediaActionSound; cdecl;
    {class} function mustPlayShutterSound: Boolean; cdecl;
    {class} property FOCUS_COMPLETE: Integer read _GetFOCUS_COMPLETE;
    {class} property SHUTTER_CLICK: Integer read _GetSHUTTER_CLICK;
    {class} property START_VIDEO_RECORDING: Integer read _GetSTART_VIDEO_RECORDING;
    {class} property STOP_VIDEO_RECORDING: Integer read _GetSTOP_VIDEO_RECORDING;
  end;

  [JavaSignature('android/media/MediaActionSound')]
  JMediaActionSound = interface(JObject)
    ['{F9314010-8F95-4079-A513-EA752C916635}']
    procedure load(soundName: Integer); cdecl;
    procedure play(soundName: Integer); cdecl;
    procedure release; cdecl;
  end;
  TJMediaActionSound = class(TJavaGenericImport<JMediaActionSoundClass, JMediaActionSound>) end;

  JMediaCasClass = interface(JObjectClass)
    ['{70AE0C2A-C7BD-4927-BAF4-1B7D5DE24B0D}']
    {class} function _GetPLUGIN_STATUS_PHYSICAL_MODULE_CHANGED: Integer; cdecl;
    {class} function _GetPLUGIN_STATUS_SESSION_NUMBER_CHANGED: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_AES128: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_AES_ECB: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_AES_SCTE52: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CISSA_V1: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CSA1: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CSA2: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CSA3_ENHANCE: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CSA3_MINIMAL: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_CSA3_STANDARD: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_DVB_IDSA: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_MULTI2: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_RESERVED: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_TDES_ECB: Integer; cdecl;
    {class} function _GetSCRAMBLING_MODE_TDES_SCTE52: Integer; cdecl;
    {class} function _GetSESSION_USAGE_LIVE: Integer; cdecl;
    {class} function _GetSESSION_USAGE_PLAYBACK: Integer; cdecl;
    {class} function _GetSESSION_USAGE_RECORD: Integer; cdecl;
    {class} function _GetSESSION_USAGE_TIMESHIFT: Integer; cdecl;
    {class} function init(casSystemId: Integer): JMediaCas; cdecl; overload;
    {class} function init(context: JContext; casSystemId: Integer; tvInputServiceSessionId: JString; priorityHint: Integer): JMediaCas; cdecl; overload;
    {class} function init(context: JContext; casSystemId: Integer; tvInputServiceSessionId: JString; priorityHint: Integer; handler: JHandler; listener: JMediaCas_EventListener): JMediaCas; cdecl; overload;
    {class} function enumeratePlugins: TJavaObjectArray<JMediaCas_PluginDescriptor>; cdecl;
    {class} function isSystemIdSupported(CA_system_id: Integer): Boolean; cdecl;
    {class} property PLUGIN_STATUS_PHYSICAL_MODULE_CHANGED: Integer read _GetPLUGIN_STATUS_PHYSICAL_MODULE_CHANGED;
    {class} property PLUGIN_STATUS_SESSION_NUMBER_CHANGED: Integer read _GetPLUGIN_STATUS_SESSION_NUMBER_CHANGED;
    {class} property SCRAMBLING_MODE_AES128: Integer read _GetSCRAMBLING_MODE_AES128;
    {class} property SCRAMBLING_MODE_AES_ECB: Integer read _GetSCRAMBLING_MODE_AES_ECB;
    {class} property SCRAMBLING_MODE_AES_SCTE52: Integer read _GetSCRAMBLING_MODE_AES_SCTE52;
    {class} property SCRAMBLING_MODE_DVB_CISSA_V1: Integer read _GetSCRAMBLING_MODE_DVB_CISSA_V1;
    {class} property SCRAMBLING_MODE_DVB_CSA1: Integer read _GetSCRAMBLING_MODE_DVB_CSA1;
    {class} property SCRAMBLING_MODE_DVB_CSA2: Integer read _GetSCRAMBLING_MODE_DVB_CSA2;
    {class} property SCRAMBLING_MODE_DVB_CSA3_ENHANCE: Integer read _GetSCRAMBLING_MODE_DVB_CSA3_ENHANCE;
    {class} property SCRAMBLING_MODE_DVB_CSA3_MINIMAL: Integer read _GetSCRAMBLING_MODE_DVB_CSA3_MINIMAL;
    {class} property SCRAMBLING_MODE_DVB_CSA3_STANDARD: Integer read _GetSCRAMBLING_MODE_DVB_CSA3_STANDARD;
    {class} property SCRAMBLING_MODE_DVB_IDSA: Integer read _GetSCRAMBLING_MODE_DVB_IDSA;
    {class} property SCRAMBLING_MODE_MULTI2: Integer read _GetSCRAMBLING_MODE_MULTI2;
    {class} property SCRAMBLING_MODE_RESERVED: Integer read _GetSCRAMBLING_MODE_RESERVED;
    {class} property SCRAMBLING_MODE_TDES_ECB: Integer read _GetSCRAMBLING_MODE_TDES_ECB;
    {class} property SCRAMBLING_MODE_TDES_SCTE52: Integer read _GetSCRAMBLING_MODE_TDES_SCTE52;
    {class} property SESSION_USAGE_LIVE: Integer read _GetSESSION_USAGE_LIVE;
    {class} property SESSION_USAGE_PLAYBACK: Integer read _GetSESSION_USAGE_PLAYBACK;
    {class} property SESSION_USAGE_RECORD: Integer read _GetSESSION_USAGE_RECORD;
    {class} property SESSION_USAGE_TIMESHIFT: Integer read _GetSESSION_USAGE_TIMESHIFT;
  end;

  [JavaSignature('android/media/MediaCas')]
  JMediaCas = interface(JObject)
    ['{E2A6B7A7-4CDB-4D8B-9E55-4BD7EFA4A9F4}']
    procedure close; cdecl;
    function openSession: JMediaCas_Session; cdecl; overload;
    function openSession(sessionUsage: Integer; scramblingMode: Integer): JMediaCas_Session; cdecl; overload;
    procedure processEmm(data: TJavaArray<Byte>; offset: Integer; length: Integer); cdecl; overload;
    procedure processEmm(data: TJavaArray<Byte>); cdecl; overload;
    procedure provision(provisionString: JString); cdecl;
    procedure refreshEntitlements(refreshType: Integer; refreshData: TJavaArray<Byte>); cdecl;
    procedure sendEvent(event: Integer; arg: Integer; data: TJavaArray<Byte>); cdecl;
    procedure setEventListener(listener: JMediaCas_EventListener; handler: JHandler); cdecl;
    procedure setPrivateData(data: TJavaArray<Byte>); cdecl;
  end;
  TJMediaCas = class(TJavaGenericImport<JMediaCasClass, JMediaCas>) end;

  JMediaCas_EventListenerClass = interface(IJavaClass)
    ['{55AD74AC-C6E0-412A-A910-4574CC07691F}']
  end;

  [JavaSignature('android/media/MediaCas$EventListener')]
  JMediaCas_EventListener = interface(IJavaInstance)
    ['{19074E1C-BC68-4BFA-990C-C48FD148BA07}']
    procedure onEvent(mediaCas: JMediaCas; event: Integer; arg: Integer; data: TJavaArray<Byte>); cdecl;
    procedure onPluginStatusUpdate(mediaCas: JMediaCas; status: Integer; arg: Integer); cdecl;
    procedure onResourceLost(mediaCas: JMediaCas); cdecl;
    procedure onSessionEvent(mediaCas: JMediaCas; session: JMediaCas_Session; event: Integer; arg: Integer; data: TJavaArray<Byte>); cdecl;
  end;
  TJMediaCas_EventListener = class(TJavaGenericImport<JMediaCas_EventListenerClass, JMediaCas_EventListener>) end;

  JMediaCas_PluginDescriptorClass = interface(JObjectClass)
    ['{614839C1-D5AD-484A-B338-65CE993B535F}']
  end;

  [JavaSignature('android/media/MediaCas$PluginDescriptor')]
  JMediaCas_PluginDescriptor = interface(JObject)
    ['{42EAFBAF-C7C3-4DA9-83B3-5012BE4312C3}']
    function getName: JString; cdecl;
    function getSystemId: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaCas_PluginDescriptor = class(TJavaGenericImport<JMediaCas_PluginDescriptorClass, JMediaCas_PluginDescriptor>) end;

  JMediaCas_SessionClass = interface(JObjectClass)
    ['{BE116F45-D242-40CA-85A5-3D6545BDFDD7}']
  end;

  [JavaSignature('android/media/MediaCas$Session')]
  JMediaCas_Session = interface(JObject)
    ['{1A9CBA80-841A-4845-8E08-5092869F1474}']
    procedure close; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getSessionId: TJavaArray<Byte>; cdecl;
    procedure processEcm(data: TJavaArray<Byte>; offset: Integer; length: Integer); cdecl; overload;
    procedure processEcm(data: TJavaArray<Byte>); cdecl; overload;
    procedure sendSessionEvent(event: Integer; arg: Integer; data: TJavaArray<Byte>); cdecl;
    procedure setPrivateData(data: TJavaArray<Byte>); cdecl;
  end;
  TJMediaCas_Session = class(TJavaGenericImport<JMediaCas_SessionClass, JMediaCas_Session>) end;

  JMediaCasExceptionClass = interface(JExceptionClass)
    ['{D39C6017-4DDD-446C-8435-7BD98B2D6DDB}']
  end;

  [JavaSignature('android/media/MediaCasException')]
  JMediaCasException = interface(JException)
    ['{CEA703AF-E9AB-4419-9FD2-20ECC7E9849E}']
  end;
  TJMediaCasException = class(TJavaGenericImport<JMediaCasExceptionClass, JMediaCasException>) end;

  JMediaCasException_DeniedByServerExceptionClass = interface(JMediaCasExceptionClass)
    ['{EF7B235F-F127-4A88-8FFD-F68FA304E7BD}']
  end;

  [JavaSignature('android/media/MediaCasException$DeniedByServerException')]
  JMediaCasException_DeniedByServerException = interface(JMediaCasException)
    ['{B1C7BAA5-4F20-41E9-91B8-0B8C54EAE598}']
  end;
  TJMediaCasException_DeniedByServerException = class(TJavaGenericImport<JMediaCasException_DeniedByServerExceptionClass, JMediaCasException_DeniedByServerException>) end;

  JMediaCasException_InsufficientResourceExceptionClass = interface(JMediaCasExceptionClass)
    ['{7EABADE6-4245-4AAE-B82B-3D95F52FB1C5}']
  end;

  [JavaSignature('android/media/MediaCasException$InsufficientResourceException')]
  JMediaCasException_InsufficientResourceException = interface(JMediaCasException)
    ['{6C827CA4-7D19-4EE2-89BE-C19E0FB96790}']
  end;
  TJMediaCasException_InsufficientResourceException = class(TJavaGenericImport<JMediaCasException_InsufficientResourceExceptionClass, JMediaCasException_InsufficientResourceException>) end;

  JMediaCasException_NotProvisionedExceptionClass = interface(JMediaCasExceptionClass)
    ['{95840713-13C9-4340-A9B9-3D73B0FD2F0D}']
  end;

  [JavaSignature('android/media/MediaCasException$NotProvisionedException')]
  JMediaCasException_NotProvisionedException = interface(JMediaCasException)
    ['{B115657D-E6EF-4761-85A4-0D0651850C99}']
  end;
  TJMediaCasException_NotProvisionedException = class(TJavaGenericImport<JMediaCasException_NotProvisionedExceptionClass, JMediaCasException_NotProvisionedException>) end;

  JMediaCasException_ResourceBusyExceptionClass = interface(JMediaCasExceptionClass)
    ['{8A5FB67A-1581-4A6D-88D6-A434115D383C}']
  end;

  [JavaSignature('android/media/MediaCasException$ResourceBusyException')]
  JMediaCasException_ResourceBusyException = interface(JMediaCasException)
    ['{D916F741-B304-413D-BB14-0009E41CFE2E}']
  end;
  TJMediaCasException_ResourceBusyException = class(TJavaGenericImport<JMediaCasException_ResourceBusyExceptionClass, JMediaCasException_ResourceBusyException>) end;

  JMediaCasException_UnsupportedCasExceptionClass = interface(JMediaCasExceptionClass)
    ['{EC5ACD49-6760-49DF-9C81-3E90ABB7479A}']
  end;

  [JavaSignature('android/media/MediaCasException$UnsupportedCasException')]
  JMediaCasException_UnsupportedCasException = interface(JMediaCasException)
    ['{2DD8DD0A-CBCC-4FE5-93BC-A00C7473FF53}']
  end;
  TJMediaCasException_UnsupportedCasException = class(TJavaGenericImport<JMediaCasException_UnsupportedCasExceptionClass, JMediaCasException_UnsupportedCasException>) end;

  JMediaCasStateExceptionClass = interface(JIllegalStateExceptionClass)
    ['{E420C364-7CF4-4651-97F8-57FCDD181703}']
  end;

  [JavaSignature('android/media/MediaCasStateException')]
  JMediaCasStateException = interface(JIllegalStateException)
    ['{88EAB25F-F413-45D7-A23F-A9D47633C1A2}']
    function getDiagnosticInfo: JString; cdecl;
  end;
  TJMediaCasStateException = class(TJavaGenericImport<JMediaCasStateExceptionClass, JMediaCasStateException>) end;

  JMediaCodecClass = interface(JObjectClass)
    ['{CE3DED9B-E9AD-4A29-9755-ECFFFC1831BA}']
    {class} function _GetBUFFER_FLAG_CODEC_CONFIG: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_END_OF_STREAM: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_KEY_FRAME: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_PARTIAL_FRAME: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_SYNC_FRAME: Integer; cdecl;
    {class} function _GetCONFIGURE_FLAG_ENCODE: Integer; cdecl;
    {class} function _GetCONFIGURE_FLAG_USE_BLOCK_MODEL: Integer; cdecl;
    {class} function _GetCRYPTO_MODE_AES_CBC: Integer; cdecl;
    {class} function _GetCRYPTO_MODE_AES_CTR: Integer; cdecl;
    {class} function _GetCRYPTO_MODE_UNENCRYPTED: Integer; cdecl;
    {class} function _GetINFO_OUTPUT_BUFFERS_CHANGED: Integer; cdecl;
    {class} function _GetINFO_OUTPUT_FORMAT_CHANGED: Integer; cdecl;
    {class} function _GetINFO_TRY_AGAIN_LATER: Integer; cdecl;
    {class} function _GetPARAMETER_KEY_HDR10_PLUS_INFO: JString; cdecl;
    {class} function _GetPARAMETER_KEY_LOW_LATENCY: JString; cdecl;
    {class} function _GetPARAMETER_KEY_OFFSET_TIME: JString; cdecl;
    {class} function _GetPARAMETER_KEY_REQUEST_SYNC_FRAME: JString; cdecl;
    {class} function _GetPARAMETER_KEY_SUSPEND: JString; cdecl;
    {class} function _GetPARAMETER_KEY_SUSPEND_TIME: JString; cdecl;
    {class} function _GetPARAMETER_KEY_TUNNEL_PEEK: JString; cdecl;
    {class} function _GetPARAMETER_KEY_VIDEO_BITRATE: JString; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT: Integer; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer; cdecl;
    {class} function createByCodecName(name: JString): JMediaCodec; cdecl;
    {class} function createDecoderByType(type_: JString): JMediaCodec; cdecl;
    {class} function createEncoderByType(type_: JString): JMediaCodec; cdecl;
    {class} function createPersistentInputSurface: JSurface; cdecl;
    {class} function mapHardwareBuffer(hardwareBuffer: JHardwareBuffer): JImage; cdecl;
    {class} property BUFFER_FLAG_CODEC_CONFIG: Integer read _GetBUFFER_FLAG_CODEC_CONFIG;
    {class} property BUFFER_FLAG_END_OF_STREAM: Integer read _GetBUFFER_FLAG_END_OF_STREAM;
    {class} property BUFFER_FLAG_KEY_FRAME: Integer read _GetBUFFER_FLAG_KEY_FRAME;
    {class} property BUFFER_FLAG_PARTIAL_FRAME: Integer read _GetBUFFER_FLAG_PARTIAL_FRAME;
    {class} property BUFFER_FLAG_SYNC_FRAME: Integer read _GetBUFFER_FLAG_SYNC_FRAME;
    {class} property CONFIGURE_FLAG_ENCODE: Integer read _GetCONFIGURE_FLAG_ENCODE;
    {class} property CONFIGURE_FLAG_USE_BLOCK_MODEL: Integer read _GetCONFIGURE_FLAG_USE_BLOCK_MODEL;
    {class} property CRYPTO_MODE_AES_CBC: Integer read _GetCRYPTO_MODE_AES_CBC;
    {class} property CRYPTO_MODE_AES_CTR: Integer read _GetCRYPTO_MODE_AES_CTR;
    {class} property CRYPTO_MODE_UNENCRYPTED: Integer read _GetCRYPTO_MODE_UNENCRYPTED;
    {class} property INFO_OUTPUT_BUFFERS_CHANGED: Integer read _GetINFO_OUTPUT_BUFFERS_CHANGED;
    {class} property INFO_OUTPUT_FORMAT_CHANGED: Integer read _GetINFO_OUTPUT_FORMAT_CHANGED;
    {class} property INFO_TRY_AGAIN_LATER: Integer read _GetINFO_TRY_AGAIN_LATER;
    {class} property PARAMETER_KEY_HDR10_PLUS_INFO: JString read _GetPARAMETER_KEY_HDR10_PLUS_INFO;
    {class} property PARAMETER_KEY_LOW_LATENCY: JString read _GetPARAMETER_KEY_LOW_LATENCY;
    {class} property PARAMETER_KEY_OFFSET_TIME: JString read _GetPARAMETER_KEY_OFFSET_TIME;
    {class} property PARAMETER_KEY_REQUEST_SYNC_FRAME: JString read _GetPARAMETER_KEY_REQUEST_SYNC_FRAME;
    {class} property PARAMETER_KEY_SUSPEND: JString read _GetPARAMETER_KEY_SUSPEND;
    {class} property PARAMETER_KEY_SUSPEND_TIME: JString read _GetPARAMETER_KEY_SUSPEND_TIME;
    {class} property PARAMETER_KEY_TUNNEL_PEEK: JString read _GetPARAMETER_KEY_TUNNEL_PEEK;
    {class} property PARAMETER_KEY_VIDEO_BITRATE: JString read _GetPARAMETER_KEY_VIDEO_BITRATE;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING;
  end;

  [JavaSignature('android/media/MediaCodec')]
  JMediaCodec = interface(JObject)
    ['{A535089E-5F3D-464D-9BB5-2A3553A461F1}']
    procedure configure(format: JMediaFormat; surface: JSurface; crypto: JMediaCrypto; flags: Integer); cdecl; overload;
    procedure configure(format: JMediaFormat; surface: JSurface; flags: Integer; descrambler: JMediaDescrambler); cdecl; overload;
    function createInputSurface: JSurface; cdecl;
    function dequeueInputBuffer(timeoutUs: Int64): Integer; cdecl;
    function dequeueOutputBuffer(info: JMediaCodec_BufferInfo; timeoutUs: Int64): Integer; cdecl;
    procedure flush; cdecl;
    function getCanonicalName: JString; cdecl;
    function getCodecInfo: JMediaCodecInfo; cdecl;
    function getInputBuffer(index: Integer): JByteBuffer; cdecl;
    function getInputBuffers: TJavaObjectArray<JByteBuffer>; cdecl;//Deprecated
    function getInputFormat: JMediaFormat; cdecl;
    function getInputImage(index: Integer): JImage; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getName: JString; cdecl;
    function getOutputBuffer(index: Integer): JByteBuffer; cdecl;
    function getOutputBuffers: TJavaObjectArray<JByteBuffer>; cdecl;//Deprecated
    function getOutputFormat: JMediaFormat; cdecl; overload;
    function getOutputFormat(index: Integer): JMediaFormat; cdecl; overload;
    function getOutputFrame(index: Integer): JMediaCodec_OutputFrame; cdecl;
    function getOutputImage(index: Integer): JImage; cdecl;
    function getParameterDescriptor(name: JString): JMediaCodec_ParameterDescriptor; cdecl;
    function getQueueRequest(index: Integer): JMediaCodec_QueueRequest; cdecl;
    function getSupportedVendorParameters: JList; cdecl;
    procedure queueInputBuffer(index: Integer; offset: Integer; size: Integer; presentationTimeUs: Int64; flags: Integer); cdecl;
    procedure queueSecureInputBuffer(index: Integer; offset: Integer; info: JMediaCodec_CryptoInfo; presentationTimeUs: Int64; flags: Integer); cdecl;
    procedure release; cdecl;
    procedure releaseOutputBuffer(index: Integer; render: Boolean); cdecl; overload;
    procedure releaseOutputBuffer(index: Integer; renderTimestampNs: Int64); cdecl; overload;
    procedure reset; cdecl;
    procedure setAudioPresentation(presentation: JAudioPresentation); cdecl;
    procedure setCallback(cb: JMediaCodec_Callback; handler: JHandler); cdecl; overload;
    procedure setCallback(cb: JMediaCodec_Callback); cdecl; overload;
    procedure setInputSurface(surface: JSurface); cdecl;
    procedure setOnFirstTunnelFrameReadyListener(handler: JHandler; listener: JMediaCodec_OnFirstTunnelFrameReadyListener); cdecl;
    procedure setOnFrameRenderedListener(listener: JMediaCodec_OnFrameRenderedListener; handler: JHandler); cdecl;
    procedure setOutputSurface(surface: JSurface); cdecl;
    procedure setParameters(params: JBundle); cdecl;
    procedure setVideoScalingMode(mode: Integer); cdecl;
    procedure signalEndOfInputStream; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure subscribeToVendorParameters(names: JList); cdecl;
    procedure unsubscribeFromVendorParameters(names: JList); cdecl;
  end;
  TJMediaCodec = class(TJavaGenericImport<JMediaCodecClass, JMediaCodec>) end;

  JMediaCodec_BufferInfoClass = interface(JObjectClass)
    ['{F2CE3B97-9D62-442D-A689-ED511D19C5F2}']
    {class} function init: JMediaCodec_BufferInfo; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$BufferInfo')]
  JMediaCodec_BufferInfo = interface(JObject)
    ['{EB7BFC1B-B1F0-4602-9173-69B036DE28E1}']
    function _Getflags: Integer; cdecl;
    procedure _Setflags(Value: Integer); cdecl;
    function _Getoffset: Integer; cdecl;
    procedure _Setoffset(Value: Integer); cdecl;
    function _GetpresentationTimeUs: Int64; cdecl;
    procedure _SetpresentationTimeUs(Value: Int64); cdecl;
    function _Getsize: Integer; cdecl;
    procedure _Setsize(Value: Integer); cdecl;
    procedure &set(newOffset: Integer; newSize: Integer; newTimeUs: Int64; newFlags: Integer); cdecl;
    property flags: Integer read _Getflags write _Setflags;
    property offset: Integer read _Getoffset write _Setoffset;
    property presentationTimeUs: Int64 read _GetpresentationTimeUs write _SetpresentationTimeUs;
    property size: Integer read _Getsize write _Setsize;
  end;
  TJMediaCodec_BufferInfo = class(TJavaGenericImport<JMediaCodec_BufferInfoClass, JMediaCodec_BufferInfo>) end;

  JMediaCodec_CallbackClass = interface(JObjectClass)
    ['{603A4EB4-F4D1-41EB-BB3E-CA8FD9125BB6}']
    {class} function init: JMediaCodec_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$Callback')]
  JMediaCodec_Callback = interface(JObject)
    ['{63456BCE-790E-4EE8-8607-6E19D3D4370E}']
    procedure onError(codec: JMediaCodec; e: JMediaCodec_CodecException); cdecl;
    procedure onInputBufferAvailable(codec: JMediaCodec; index: Integer); cdecl;
    procedure onOutputBufferAvailable(codec: JMediaCodec; index: Integer; info: JMediaCodec_BufferInfo); cdecl;
    procedure onOutputFormatChanged(codec: JMediaCodec; format: JMediaFormat); cdecl;
  end;
  TJMediaCodec_Callback = class(TJavaGenericImport<JMediaCodec_CallbackClass, JMediaCodec_Callback>) end;

  JMediaCodec_CodecExceptionClass = interface(JIllegalStateExceptionClass)
    ['{52958DD7-6125-4029-ABC5-B25990346AB9}']
    {class} function _GetERROR_INSUFFICIENT_RESOURCE: Integer; cdecl;
    {class} function _GetERROR_RECLAIMED: Integer; cdecl;
    {class} property ERROR_INSUFFICIENT_RESOURCE: Integer read _GetERROR_INSUFFICIENT_RESOURCE;
    {class} property ERROR_RECLAIMED: Integer read _GetERROR_RECLAIMED;
  end;

  [JavaSignature('android/media/MediaCodec$CodecException')]
  JMediaCodec_CodecException = interface(JIllegalStateException)
    ['{0582C58D-F00C-467F-A211-847AE1AEA50E}']
    function getDiagnosticInfo: JString; cdecl;
    function getErrorCode: Integer; cdecl;
    function isRecoverable: Boolean; cdecl;
    function isTransient: Boolean; cdecl;
  end;
  TJMediaCodec_CodecException = class(TJavaGenericImport<JMediaCodec_CodecExceptionClass, JMediaCodec_CodecException>) end;

  JMediaCodec_CryptoExceptionClass = interface(JRuntimeExceptionClass)
    ['{CE90A025-BE54-4F7A-95ED-4FEA792EA200}']
    {class} function _GetERROR_FRAME_TOO_LARGE: Integer; cdecl;
    {class} function _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer; cdecl;
    {class} function _GetERROR_INSUFFICIENT_SECURITY: Integer; cdecl;
    {class} function _GetERROR_KEY_EXPIRED: Integer; cdecl;
    {class} function _GetERROR_LOST_STATE: Integer; cdecl;
    {class} function _GetERROR_NO_KEY: Integer; cdecl;
    {class} function _GetERROR_RESOURCE_BUSY: Integer; cdecl;
    {class} function _GetERROR_SESSION_NOT_OPENED: Integer; cdecl;
    {class} function _GetERROR_UNSUPPORTED_OPERATION: Integer; cdecl;
    {class} function init(errorCode: Integer; detailMessage: JString): JMediaCodec_CryptoException; cdecl;
    {class} property ERROR_FRAME_TOO_LARGE: Integer read _GetERROR_FRAME_TOO_LARGE;
    {class} property ERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer read _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION;
    {class} property ERROR_INSUFFICIENT_SECURITY: Integer read _GetERROR_INSUFFICIENT_SECURITY;
    {class} property ERROR_KEY_EXPIRED: Integer read _GetERROR_KEY_EXPIRED;
    {class} property ERROR_LOST_STATE: Integer read _GetERROR_LOST_STATE;
    {class} property ERROR_NO_KEY: Integer read _GetERROR_NO_KEY;
    {class} property ERROR_RESOURCE_BUSY: Integer read _GetERROR_RESOURCE_BUSY;
    {class} property ERROR_SESSION_NOT_OPENED: Integer read _GetERROR_SESSION_NOT_OPENED;
    {class} property ERROR_UNSUPPORTED_OPERATION: Integer read _GetERROR_UNSUPPORTED_OPERATION;
  end;

  [JavaSignature('android/media/MediaCodec$CryptoException')]
  JMediaCodec_CryptoException = interface(JRuntimeException)
    ['{D0A8F499-E687-4578-9E2D-A86E14881DB5}']
    function getErrorCode: Integer; cdecl;
  end;
  TJMediaCodec_CryptoException = class(TJavaGenericImport<JMediaCodec_CryptoExceptionClass, JMediaCodec_CryptoException>) end;

  JMediaCodec_CryptoInfoClass = interface(JObjectClass)
    ['{DDA3A4C6-56FD-4C37-8812-5269A274E6DD}']
    {class} function init: JMediaCodec_CryptoInfo; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$CryptoInfo')]
  JMediaCodec_CryptoInfo = interface(JObject)
    ['{5281B1AC-4C52-4BF3-A45F-75B3778E3774}']
    function _Getiv: TJavaArray<Byte>; cdecl;
    procedure _Setiv(Value: TJavaArray<Byte>); cdecl;
    function _Getkey: TJavaArray<Byte>; cdecl;
    procedure _Setkey(Value: TJavaArray<Byte>); cdecl;
    function _Getmode: Integer; cdecl;
    procedure _Setmode(Value: Integer); cdecl;
    function _GetnumBytesOfClearData: TJavaArray<Integer>; cdecl;
    procedure _SetnumBytesOfClearData(Value: TJavaArray<Integer>); cdecl;
    function _GetnumBytesOfEncryptedData: TJavaArray<Integer>; cdecl;
    procedure _SetnumBytesOfEncryptedData(Value: TJavaArray<Integer>); cdecl;
    function _GetnumSubSamples: Integer; cdecl;
    procedure _SetnumSubSamples(Value: Integer); cdecl;
    function getPattern: JCryptoInfo_Pattern; cdecl;
    procedure &set(newNumSubSamples: Integer; newNumBytesOfClearData: TJavaArray<Integer>; newNumBytesOfEncryptedData: TJavaArray<Integer>; newKey: TJavaArray<Byte>; newIV: TJavaArray<Byte>; newMode: Integer); cdecl;
    procedure setPattern(newPattern: JCryptoInfo_Pattern); cdecl;
    function toString: JString; cdecl;
    property iv: TJavaArray<Byte> read _Getiv write _Setiv;
    property key: TJavaArray<Byte> read _Getkey write _Setkey;
    property mode: Integer read _Getmode write _Setmode;
    property numBytesOfClearData: TJavaArray<Integer> read _GetnumBytesOfClearData write _SetnumBytesOfClearData;
    property numBytesOfEncryptedData: TJavaArray<Integer> read _GetnumBytesOfEncryptedData write _SetnumBytesOfEncryptedData;
    property numSubSamples: Integer read _GetnumSubSamples write _SetnumSubSamples;
  end;
  TJMediaCodec_CryptoInfo = class(TJavaGenericImport<JMediaCodec_CryptoInfoClass, JMediaCodec_CryptoInfo>) end;

  JCryptoInfo_PatternClass = interface(JObjectClass)
    ['{05D6B0DB-3979-4DD3-B7E4-A00FC099C52B}']
    {class} function init(blocksToEncrypt: Integer; blocksToSkip: Integer): JCryptoInfo_Pattern; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$CryptoInfo$Pattern')]
  JCryptoInfo_Pattern = interface(JObject)
    ['{F939CECD-DD90-4AE6-BB59-E1A07175DBC6}']
    function getEncryptBlocks: Integer; cdecl;
    function getSkipBlocks: Integer; cdecl;
    procedure &set(blocksToEncrypt: Integer; blocksToSkip: Integer); cdecl;
  end;
  TJCryptoInfo_Pattern = class(TJavaGenericImport<JCryptoInfo_PatternClass, JCryptoInfo_Pattern>) end;

  JMediaCodec_IncompatibleWithBlockModelExceptionClass = interface(JRuntimeExceptionClass)
    ['{303C0A7A-2B98-4982-9EA7-5E6292DF7CFD}']
  end;

  [JavaSignature('android/media/MediaCodec$IncompatibleWithBlockModelException')]
  JMediaCodec_IncompatibleWithBlockModelException = interface(JRuntimeException)
    ['{CF6B6984-32DA-474D-A735-D2D0328DD08A}']
  end;
  TJMediaCodec_IncompatibleWithBlockModelException = class(TJavaGenericImport<JMediaCodec_IncompatibleWithBlockModelExceptionClass, JMediaCodec_IncompatibleWithBlockModelException>) end;

  JMediaCodec_LinearBlockClass = interface(JObjectClass)
    ['{474680CA-31E8-4719-A6B2-CDAF4766DF53}']
    {class} function isCodecCopyFreeCompatible(codecNames: TJavaObjectArray<JString>): Boolean; cdecl;
    {class} function obtain(capacity: Integer; codecNames: TJavaObjectArray<JString>): JMediaCodec_LinearBlock; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$LinearBlock')]
  JMediaCodec_LinearBlock = interface(JObject)
    ['{0CDC147A-2D63-4192-8748-E1C3F314730A}']
    function isMappable: Boolean; cdecl;
    function map: JByteBuffer; cdecl;
    procedure recycle; cdecl;
  end;
  TJMediaCodec_LinearBlock = class(TJavaGenericImport<JMediaCodec_LinearBlockClass, JMediaCodec_LinearBlock>) end;

  JMediaCodec_MetricsConstantsClass = interface(JObjectClass)
    ['{DDFA48B2-F264-4F43-B0F5-99AD8861D9E6}']
    {class} function _GetCODEC: JString; cdecl;
    {class} function _GetENCODER: JString; cdecl;
    {class} function _GetHEIGHT: JString; cdecl;
    {class} function _GetMIME_TYPE: JString; cdecl;
    {class} function _GetMODE: JString; cdecl;
    {class} function _GetMODE_AUDIO: JString; cdecl;
    {class} function _GetMODE_VIDEO: JString; cdecl;
    {class} function _GetROTATION: JString; cdecl;
    {class} function _GetSECURE: JString; cdecl;
    {class} function _GetWIDTH: JString; cdecl;
    {class} property CODEC: JString read _GetCODEC;
    {class} property ENCODER: JString read _GetENCODER;
    {class} property HEIGHT: JString read _GetHEIGHT;
    {class} property MIME_TYPE: JString read _GetMIME_TYPE;
    {class} property MODE: JString read _GetMODE;
    {class} property MODE_AUDIO: JString read _GetMODE_AUDIO;
    {class} property MODE_VIDEO: JString read _GetMODE_VIDEO;
    {class} property ROTATION: JString read _GetROTATION;
    {class} property SECURE: JString read _GetSECURE;
    {class} property WIDTH: JString read _GetWIDTH;
  end;

  [JavaSignature('android/media/MediaCodec$MetricsConstants')]
  JMediaCodec_MetricsConstants = interface(JObject)
    ['{75F6E590-2E6B-42E7-8F61-7F5DB6B4A6F5}']
  end;
  TJMediaCodec_MetricsConstants = class(TJavaGenericImport<JMediaCodec_MetricsConstantsClass, JMediaCodec_MetricsConstants>) end;

  JMediaCodec_OnFirstTunnelFrameReadyListenerClass = interface(IJavaClass)
    ['{ECBF063B-68D8-4E3F-924D-1DE63CA65BBD}']
  end;

  [JavaSignature('android/media/MediaCodec$OnFirstTunnelFrameReadyListener')]
  JMediaCodec_OnFirstTunnelFrameReadyListener = interface(IJavaInstance)
    ['{BB3A6934-91A2-40DB-B9F6-65AF6D23DD94}']
    procedure onFirstTunnelFrameReady(codec: JMediaCodec); cdecl;
  end;
  TJMediaCodec_OnFirstTunnelFrameReadyListener = class(TJavaGenericImport<JMediaCodec_OnFirstTunnelFrameReadyListenerClass, JMediaCodec_OnFirstTunnelFrameReadyListener>) end;

  JMediaCodec_OnFrameRenderedListenerClass = interface(IJavaClass)
    ['{84F9D7D7-89EB-487E-B4E1-530587A82704}']
  end;

  [JavaSignature('android/media/MediaCodec$OnFrameRenderedListener')]
  JMediaCodec_OnFrameRenderedListener = interface(IJavaInstance)
    ['{D8D0DD67-71AF-4052-B101-6EAA19ABCF6D}']
    procedure onFrameRendered(codec: JMediaCodec; presentationTimeUs: Int64; nanoTime: Int64); cdecl;
  end;
  TJMediaCodec_OnFrameRenderedListener = class(TJavaGenericImport<JMediaCodec_OnFrameRenderedListenerClass, JMediaCodec_OnFrameRenderedListener>) end;

  JMediaCodec_OutputFrameClass = interface(JObjectClass)
    ['{308E4518-2C96-4CCE-84D7-B41584B70FC8}']
  end;

  [JavaSignature('android/media/MediaCodec$OutputFrame')]
  JMediaCodec_OutputFrame = interface(JObject)
    ['{4AA8E374-0DBE-4454-9162-423E213BD1D5}']
    function getChangedKeys: JSet; cdecl;
    function getFlags: Integer; cdecl;
    function getFormat: JMediaFormat; cdecl;
    function getHardwareBuffer: JHardwareBuffer; cdecl;
    function getLinearBlock: JMediaCodec_LinearBlock; cdecl;
    function getPresentationTimeUs: Int64; cdecl;
  end;
  TJMediaCodec_OutputFrame = class(TJavaGenericImport<JMediaCodec_OutputFrameClass, JMediaCodec_OutputFrame>) end;

  JMediaCodec_ParameterDescriptorClass = interface(JObjectClass)
    ['{59D844E0-9AAA-4CA0-A80E-F9EB874635EF}']
  end;

  [JavaSignature('android/media/MediaCodec$ParameterDescriptor')]
  JMediaCodec_ParameterDescriptor = interface(JObject)
    ['{1FF42A0D-EE32-439F-9183-8EE0756D7A6E}']
    function equals(o: JObject): Boolean; cdecl;
    function getName: JString; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJMediaCodec_ParameterDescriptor = class(TJavaGenericImport<JMediaCodec_ParameterDescriptorClass, JMediaCodec_ParameterDescriptor>) end;

  JMediaCodec_QueueRequestClass = interface(JObjectClass)
    ['{CFACE56A-E7FE-4C75-8EC7-0123EF0429EB}']
  end;

  [JavaSignature('android/media/MediaCodec$QueueRequest')]
  JMediaCodec_QueueRequest = interface(JObject)
    ['{1B02CF35-D96E-4B6B-BC8D-22321913F034}']
    procedure queue; cdecl;
    function setByteBufferParameter(key: JString; value: JByteBuffer): JMediaCodec_QueueRequest; cdecl;
    function setEncryptedLinearBlock(block: JMediaCodec_LinearBlock; offset: Integer; size: Integer; cryptoInfo: JMediaCodec_CryptoInfo): JMediaCodec_QueueRequest; cdecl;
    function setFlags(flags: Integer): JMediaCodec_QueueRequest; cdecl;
    function setFloatParameter(key: JString; value: Single): JMediaCodec_QueueRequest; cdecl;
    function setHardwareBuffer(buffer: JHardwareBuffer): JMediaCodec_QueueRequest; cdecl;
    function setIntegerParameter(key: JString; value: Integer): JMediaCodec_QueueRequest; cdecl;
    function setLinearBlock(block: JMediaCodec_LinearBlock; offset: Integer; size: Integer): JMediaCodec_QueueRequest; cdecl;
    function setLongParameter(key: JString; value: Int64): JMediaCodec_QueueRequest; cdecl;
    function setPresentationTimeUs(presentationTimeUs: Int64): JMediaCodec_QueueRequest; cdecl;
    function setStringParameter(key: JString; value: JString): JMediaCodec_QueueRequest; cdecl;
  end;
  TJMediaCodec_QueueRequest = class(TJavaGenericImport<JMediaCodec_QueueRequestClass, JMediaCodec_QueueRequest>) end;

  JMediaCodecInfoClass = interface(JObjectClass)
    ['{65843676-C663-48B7-B957-36E0FAA8C6DE}']
  end;

  [JavaSignature('android/media/MediaCodecInfo')]
  JMediaCodecInfo = interface(JObject)
    ['{DEB2A66A-5E90-4568-8DD2-5D17A9008896}']
    function getCanonicalName: JString; cdecl;
    function getCapabilitiesForType(type_: JString): JMediaCodecInfo_CodecCapabilities; cdecl;
    function getName: JString; cdecl;
    function getSupportedTypes: TJavaObjectArray<JString>; cdecl;
    function isAlias: Boolean; cdecl;
    function isEncoder: Boolean; cdecl;
    function isHardwareAccelerated: Boolean; cdecl;
    function isSoftwareOnly: Boolean; cdecl;
    function isVendor: Boolean; cdecl;
  end;
  TJMediaCodecInfo = class(TJavaGenericImport<JMediaCodecInfoClass, JMediaCodecInfo>) end;

  JMediaCodecInfo_AudioCapabilitiesClass = interface(JObjectClass)
    ['{75906A2D-B46A-4CC9-945B-DDEA07BE543C}']
  end;

  [JavaSignature('android/media/MediaCodecInfo$AudioCapabilities')]
  JMediaCodecInfo_AudioCapabilities = interface(JObject)
    ['{9D0C7E86-4355-4231-9666-C4266685A95D}']
    function getBitrateRange: JRange; cdecl;
    function getInputChannelCountRanges: TJavaObjectArray<JRange>; cdecl;
    function getMaxInputChannelCount: Integer; cdecl;
    function getMinInputChannelCount: Integer; cdecl;
    function getSupportedSampleRateRanges: TJavaObjectArray<JRange>; cdecl;
    function getSupportedSampleRates: TJavaArray<Integer>; cdecl;
    function isSampleRateSupported(sampleRate: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_AudioCapabilities = class(TJavaGenericImport<JMediaCodecInfo_AudioCapabilitiesClass, JMediaCodecInfo_AudioCapabilities>) end;

  JMediaCodecInfo_CodecCapabilitiesClass = interface(JObjectClass)
    ['{007827D3-EC90-41C8-BA89-794265D12834}']
    {class} function _GetCOLOR_Format12bitRGB444: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitARGB1555: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitARGB4444: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitBGR565: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitRGB565: Integer; cdecl;
    {class} function _GetCOLOR_Format18BitBGR666: Integer; cdecl;
    {class} function _GetCOLOR_Format18bitARGB1665: Integer; cdecl;
    {class} function _GetCOLOR_Format18bitRGB666: Integer; cdecl;
    {class} function _GetCOLOR_Format19bitARGB1666: Integer; cdecl;
    {class} function _GetCOLOR_Format24BitABGR6666: Integer; cdecl;
    {class} function _GetCOLOR_Format24BitARGB6666: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitARGB1887: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitBGR888: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitRGB888: Integer; cdecl;
    {class} function _GetCOLOR_Format25bitARGB1888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitABGR2101010: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitABGR8888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitARGB8888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitBGRA8888: Integer; cdecl;
    {class} function _GetCOLOR_Format64bitABGRFloat: Integer; cdecl;
    {class} function _GetCOLOR_Format8bitRGB332: Integer; cdecl;
    {class} function _GetCOLOR_FormatCbYCrY: Integer; cdecl;
    {class} function _GetCOLOR_FormatCrYCbY: Integer; cdecl;
    {class} function _GetCOLOR_FormatL16: Integer; cdecl;
    {class} function _GetCOLOR_FormatL2: Integer; cdecl;
    {class} function _GetCOLOR_FormatL24: Integer; cdecl;
    {class} function _GetCOLOR_FormatL32: Integer; cdecl;
    {class} function _GetCOLOR_FormatL4: Integer; cdecl;
    {class} function _GetCOLOR_FormatL8: Integer; cdecl;
    {class} function _GetCOLOR_FormatMonochrome: Integer; cdecl;
    {class} function _GetCOLOR_FormatRGBAFlexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatRGBFlexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer10bit: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer8bit: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer8bitcompressed: Integer; cdecl;
    {class} function _GetCOLOR_FormatSurface: Integer; cdecl;
    {class} function _GetCOLOR_FormatYCbYCr: Integer; cdecl;
    {class} function _GetCOLOR_FormatYCrYCb: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV411PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV411Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420PackedSemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422PackedSemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV444Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV444Interleaved: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUVP010: Integer; cdecl;
    {class} function _GetCOLOR_QCOM_FormatYUV420SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_TI_FormatYUV420PackedSemiPlanar: Integer; cdecl;
    {class} function _GetFEATURE_AdaptivePlayback: JString; cdecl;
    {class} function _GetFEATURE_DynamicTimestamp: JString; cdecl;
    {class} function _GetFEATURE_EncodingStatistics: JString; cdecl;
    {class} function _GetFEATURE_FrameParsing: JString; cdecl;
    {class} function _GetFEATURE_HdrEditing: JString; cdecl;
    {class} function _GetFEATURE_IntraRefresh: JString; cdecl;
    {class} function _GetFEATURE_LowLatency: JString; cdecl;
    {class} function _GetFEATURE_MultipleFrames: JString; cdecl;
    {class} function _GetFEATURE_PartialFrame: JString; cdecl;
    {class} function _GetFEATURE_QpBounds: JString; cdecl;
    {class} function _GetFEATURE_SecurePlayback: JString; cdecl;
    {class} function _GetFEATURE_TunneledPlayback: JString; cdecl;
    {class} function init: JMediaCodecInfo_CodecCapabilities; cdecl;
    {class} function createFromProfileLevel(mime: JString; profile: Integer; level: Integer): JMediaCodecInfo_CodecCapabilities; cdecl;
    {class} property COLOR_Format12bitRGB444: Integer read _GetCOLOR_Format12bitRGB444;
    {class} property COLOR_Format16bitARGB1555: Integer read _GetCOLOR_Format16bitARGB1555;
    {class} property COLOR_Format16bitARGB4444: Integer read _GetCOLOR_Format16bitARGB4444;
    {class} property COLOR_Format16bitBGR565: Integer read _GetCOLOR_Format16bitBGR565;
    {class} property COLOR_Format16bitRGB565: Integer read _GetCOLOR_Format16bitRGB565;
    {class} property COLOR_Format18BitBGR666: Integer read _GetCOLOR_Format18BitBGR666;
    {class} property COLOR_Format18bitARGB1665: Integer read _GetCOLOR_Format18bitARGB1665;
    {class} property COLOR_Format18bitRGB666: Integer read _GetCOLOR_Format18bitRGB666;
    {class} property COLOR_Format19bitARGB1666: Integer read _GetCOLOR_Format19bitARGB1666;
    {class} property COLOR_Format24BitABGR6666: Integer read _GetCOLOR_Format24BitABGR6666;
    {class} property COLOR_Format24BitARGB6666: Integer read _GetCOLOR_Format24BitARGB6666;
    {class} property COLOR_Format24bitARGB1887: Integer read _GetCOLOR_Format24bitARGB1887;
    {class} property COLOR_Format24bitBGR888: Integer read _GetCOLOR_Format24bitBGR888;
    {class} property COLOR_Format24bitRGB888: Integer read _GetCOLOR_Format24bitRGB888;
    {class} property COLOR_Format25bitARGB1888: Integer read _GetCOLOR_Format25bitARGB1888;
    {class} property COLOR_Format32bitABGR2101010: Integer read _GetCOLOR_Format32bitABGR2101010;
    {class} property COLOR_Format32bitABGR8888: Integer read _GetCOLOR_Format32bitABGR8888;
    {class} property COLOR_Format32bitARGB8888: Integer read _GetCOLOR_Format32bitARGB8888;
    {class} property COLOR_Format32bitBGRA8888: Integer read _GetCOLOR_Format32bitBGRA8888;
    {class} property COLOR_Format64bitABGRFloat: Integer read _GetCOLOR_Format64bitABGRFloat;
    {class} property COLOR_Format8bitRGB332: Integer read _GetCOLOR_Format8bitRGB332;
    {class} property COLOR_FormatCbYCrY: Integer read _GetCOLOR_FormatCbYCrY;
    {class} property COLOR_FormatCrYCbY: Integer read _GetCOLOR_FormatCrYCbY;
    {class} property COLOR_FormatL16: Integer read _GetCOLOR_FormatL16;
    {class} property COLOR_FormatL2: Integer read _GetCOLOR_FormatL2;
    {class} property COLOR_FormatL24: Integer read _GetCOLOR_FormatL24;
    {class} property COLOR_FormatL32: Integer read _GetCOLOR_FormatL32;
    {class} property COLOR_FormatL4: Integer read _GetCOLOR_FormatL4;
    {class} property COLOR_FormatL8: Integer read _GetCOLOR_FormatL8;
    {class} property COLOR_FormatMonochrome: Integer read _GetCOLOR_FormatMonochrome;
    {class} property COLOR_FormatRGBAFlexible: Integer read _GetCOLOR_FormatRGBAFlexible;
    {class} property COLOR_FormatRGBFlexible: Integer read _GetCOLOR_FormatRGBFlexible;
    {class} property COLOR_FormatRawBayer10bit: Integer read _GetCOLOR_FormatRawBayer10bit;
    {class} property COLOR_FormatRawBayer8bit: Integer read _GetCOLOR_FormatRawBayer8bit;
    {class} property COLOR_FormatRawBayer8bitcompressed: Integer read _GetCOLOR_FormatRawBayer8bitcompressed;
    {class} property COLOR_FormatSurface: Integer read _GetCOLOR_FormatSurface;
    {class} property COLOR_FormatYCbYCr: Integer read _GetCOLOR_FormatYCbYCr;
    {class} property COLOR_FormatYCrYCb: Integer read _GetCOLOR_FormatYCrYCb;
    {class} property COLOR_FormatYUV411PackedPlanar: Integer read _GetCOLOR_FormatYUV411PackedPlanar;
    {class} property COLOR_FormatYUV411Planar: Integer read _GetCOLOR_FormatYUV411Planar;
    {class} property COLOR_FormatYUV420Flexible: Integer read _GetCOLOR_FormatYUV420Flexible;
    {class} property COLOR_FormatYUV420PackedPlanar: Integer read _GetCOLOR_FormatYUV420PackedPlanar;
    {class} property COLOR_FormatYUV420PackedSemiPlanar: Integer read _GetCOLOR_FormatYUV420PackedSemiPlanar;
    {class} property COLOR_FormatYUV420Planar: Integer read _GetCOLOR_FormatYUV420Planar;
    {class} property COLOR_FormatYUV420SemiPlanar: Integer read _GetCOLOR_FormatYUV420SemiPlanar;
    {class} property COLOR_FormatYUV422Flexible: Integer read _GetCOLOR_FormatYUV422Flexible;
    {class} property COLOR_FormatYUV422PackedPlanar: Integer read _GetCOLOR_FormatYUV422PackedPlanar;
    {class} property COLOR_FormatYUV422PackedSemiPlanar: Integer read _GetCOLOR_FormatYUV422PackedSemiPlanar;
    {class} property COLOR_FormatYUV422Planar: Integer read _GetCOLOR_FormatYUV422Planar;
    {class} property COLOR_FormatYUV422SemiPlanar: Integer read _GetCOLOR_FormatYUV422SemiPlanar;
    {class} property COLOR_FormatYUV444Flexible: Integer read _GetCOLOR_FormatYUV444Flexible;
    {class} property COLOR_FormatYUV444Interleaved: Integer read _GetCOLOR_FormatYUV444Interleaved;
    {class} property COLOR_FormatYUVP010: Integer read _GetCOLOR_FormatYUVP010;
    {class} property COLOR_QCOM_FormatYUV420SemiPlanar: Integer read _GetCOLOR_QCOM_FormatYUV420SemiPlanar;
    {class} property COLOR_TI_FormatYUV420PackedSemiPlanar: Integer read _GetCOLOR_TI_FormatYUV420PackedSemiPlanar;
    {class} property FEATURE_AdaptivePlayback: JString read _GetFEATURE_AdaptivePlayback;
    {class} property FEATURE_DynamicTimestamp: JString read _GetFEATURE_DynamicTimestamp;
    {class} property FEATURE_EncodingStatistics: JString read _GetFEATURE_EncodingStatistics;
    {class} property FEATURE_FrameParsing: JString read _GetFEATURE_FrameParsing;
    {class} property FEATURE_HdrEditing: JString read _GetFEATURE_HdrEditing;
    {class} property FEATURE_IntraRefresh: JString read _GetFEATURE_IntraRefresh;
    {class} property FEATURE_LowLatency: JString read _GetFEATURE_LowLatency;
    {class} property FEATURE_MultipleFrames: JString read _GetFEATURE_MultipleFrames;
    {class} property FEATURE_PartialFrame: JString read _GetFEATURE_PartialFrame;
    {class} property FEATURE_QpBounds: JString read _GetFEATURE_QpBounds;
    {class} property FEATURE_SecurePlayback: JString read _GetFEATURE_SecurePlayback;
    {class} property FEATURE_TunneledPlayback: JString read _GetFEATURE_TunneledPlayback;
  end;

  [JavaSignature('android/media/MediaCodecInfo$CodecCapabilities')]
  JMediaCodecInfo_CodecCapabilities = interface(JObject)
    ['{A04BF209-41B0-4DA2-B376-447B7BBC6237}']
    function _GetcolorFormats: TJavaArray<Integer>; cdecl;
    procedure _SetcolorFormats(Value: TJavaArray<Integer>); cdecl;
    function _GetprofileLevels: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel>; cdecl;
    procedure _SetprofileLevels(Value: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel>); cdecl;
    function getAudioCapabilities: JMediaCodecInfo_AudioCapabilities; cdecl;
    function getDefaultFormat: JMediaFormat; cdecl;
    function getEncoderCapabilities: JMediaCodecInfo_EncoderCapabilities; cdecl;
    function getMaxSupportedInstances: Integer; cdecl;
    function getMimeType: JString; cdecl;
    function getVideoCapabilities: JMediaCodecInfo_VideoCapabilities; cdecl;
    function isFeatureRequired(name: JString): Boolean; cdecl;
    function isFeatureSupported(name: JString): Boolean; cdecl;
    function isFormatSupported(format: JMediaFormat): Boolean; cdecl;
    property colorFormats: TJavaArray<Integer> read _GetcolorFormats write _SetcolorFormats;
    property profileLevels: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel> read _GetprofileLevels write _SetprofileLevels;
  end;
  TJMediaCodecInfo_CodecCapabilities = class(TJavaGenericImport<JMediaCodecInfo_CodecCapabilitiesClass, JMediaCodecInfo_CodecCapabilities>) end;

  JMediaCodecInfo_CodecProfileLevelClass = interface(JObjectClass)
    ['{E162DC0D-F8D3-4572-8029-474D4691B5E0}']
    {class} function _GetAACObjectELD: Integer; cdecl;
    {class} function _GetAACObjectERLC: Integer; cdecl;
    {class} function _GetAACObjectERScalable: Integer; cdecl;
    {class} function _GetAACObjectHE: Integer; cdecl;
    {class} function _GetAACObjectHE_PS: Integer; cdecl;
    {class} function _GetAACObjectLC: Integer; cdecl;
    {class} function _GetAACObjectLD: Integer; cdecl;
    {class} function _GetAACObjectLTP: Integer; cdecl;
    {class} function _GetAACObjectMain: Integer; cdecl;
    {class} function _GetAACObjectSSR: Integer; cdecl;
    {class} function _GetAACObjectScalable: Integer; cdecl;
    {class} function _GetAACObjectXHE: Integer; cdecl;
    {class} function _GetAV1Level2: Integer; cdecl;
    {class} function _GetAV1Level21: Integer; cdecl;
    {class} function _GetAV1Level22: Integer; cdecl;
    {class} function _GetAV1Level23: Integer; cdecl;
    {class} function _GetAV1Level3: Integer; cdecl;
    {class} function _GetAV1Level31: Integer; cdecl;
    {class} function _GetAV1Level32: Integer; cdecl;
    {class} function _GetAV1Level33: Integer; cdecl;
    {class} function _GetAV1Level4: Integer; cdecl;
    {class} function _GetAV1Level41: Integer; cdecl;
    {class} function _GetAV1Level42: Integer; cdecl;
    {class} function _GetAV1Level43: Integer; cdecl;
    {class} function _GetAV1Level5: Integer; cdecl;
    {class} function _GetAV1Level51: Integer; cdecl;
    {class} function _GetAV1Level52: Integer; cdecl;
    {class} function _GetAV1Level53: Integer; cdecl;
    {class} function _GetAV1Level6: Integer; cdecl;
    {class} function _GetAV1Level61: Integer; cdecl;
    {class} function _GetAV1Level62: Integer; cdecl;
    {class} function _GetAV1Level63: Integer; cdecl;
    {class} function _GetAV1Level7: Integer; cdecl;
    {class} function _GetAV1Level71: Integer; cdecl;
    {class} function _GetAV1Level72: Integer; cdecl;
    {class} function _GetAV1Level73: Integer; cdecl;
    {class} function _GetAV1ProfileMain10: Integer; cdecl;
    {class} function _GetAV1ProfileMain10HDR10: Integer; cdecl;
    {class} function _GetAV1ProfileMain10HDR10Plus: Integer; cdecl;
    {class} function _GetAV1ProfileMain8: Integer; cdecl;
    {class} function _GetAVCLevel1: Integer; cdecl;
    {class} function _GetAVCLevel11: Integer; cdecl;
    {class} function _GetAVCLevel12: Integer; cdecl;
    {class} function _GetAVCLevel13: Integer; cdecl;
    {class} function _GetAVCLevel1b: Integer; cdecl;
    {class} function _GetAVCLevel2: Integer; cdecl;
    {class} function _GetAVCLevel21: Integer; cdecl;
    {class} function _GetAVCLevel22: Integer; cdecl;
    {class} function _GetAVCLevel3: Integer; cdecl;
    {class} function _GetAVCLevel31: Integer; cdecl;
    {class} function _GetAVCLevel32: Integer; cdecl;
    {class} function _GetAVCLevel4: Integer; cdecl;
    {class} function _GetAVCLevel41: Integer; cdecl;
    {class} function _GetAVCLevel42: Integer; cdecl;
    {class} function _GetAVCLevel5: Integer; cdecl;
    {class} function _GetAVCLevel51: Integer; cdecl;
    {class} function _GetAVCLevel52: Integer; cdecl;
    {class} function _GetAVCLevel6: Integer; cdecl;
    {class} function _GetAVCLevel61: Integer; cdecl;
    {class} function _GetAVCLevel62: Integer; cdecl;
    {class} function _GetAVCProfileBaseline: Integer; cdecl;
    {class} function _GetAVCProfileConstrainedBaseline: Integer; cdecl;
    {class} function _GetAVCProfileConstrainedHigh: Integer; cdecl;
    {class} function _GetAVCProfileExtended: Integer; cdecl;
    {class} function _GetAVCProfileHigh: Integer; cdecl;
    {class} function _GetAVCProfileHigh10: Integer; cdecl;
    {class} function _GetAVCProfileHigh422: Integer; cdecl;
    {class} function _GetAVCProfileHigh444: Integer; cdecl;
    {class} function _GetAVCProfileMain: Integer; cdecl;
    {class} function _GetDolbyVisionLevel8k30: Integer; cdecl;
    {class} function _GetDolbyVisionLevel8k60: Integer; cdecl;
    {class} function _GetDolbyVisionLevelFhd24: Integer; cdecl;
    {class} function _GetDolbyVisionLevelFhd30: Integer; cdecl;
    {class} function _GetDolbyVisionLevelFhd60: Integer; cdecl;
    {class} function _GetDolbyVisionLevelHd24: Integer; cdecl;
    {class} function _GetDolbyVisionLevelHd30: Integer; cdecl;
    {class} function _GetDolbyVisionLevelUhd120: Integer; cdecl;
    {class} function _GetDolbyVisionLevelUhd24: Integer; cdecl;
    {class} function _GetDolbyVisionLevelUhd30: Integer; cdecl;
    {class} function _GetDolbyVisionLevelUhd48: Integer; cdecl;
    {class} function _GetDolbyVisionLevelUhd60: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvav110: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvavPen: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvavPer: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvavSe: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheDen: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheDer: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheDtb: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheDth: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheDtr: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheSt: Integer; cdecl;
    {class} function _GetDolbyVisionProfileDvheStn: Integer; cdecl;
    {class} function _GetH263Level10: Integer; cdecl;
    {class} function _GetH263Level20: Integer; cdecl;
    {class} function _GetH263Level30: Integer; cdecl;
    {class} function _GetH263Level40: Integer; cdecl;
    {class} function _GetH263Level45: Integer; cdecl;
    {class} function _GetH263Level50: Integer; cdecl;
    {class} function _GetH263Level60: Integer; cdecl;
    {class} function _GetH263Level70: Integer; cdecl;
    {class} function _GetH263ProfileBackwardCompatible: Integer; cdecl;
    {class} function _GetH263ProfileBaseline: Integer; cdecl;
    {class} function _GetH263ProfileH320Coding: Integer; cdecl;
    {class} function _GetH263ProfileHighCompression: Integer; cdecl;
    {class} function _GetH263ProfileHighLatency: Integer; cdecl;
    {class} function _GetH263ProfileISWV2: Integer; cdecl;
    {class} function _GetH263ProfileISWV3: Integer; cdecl;
    {class} function _GetH263ProfileInterlace: Integer; cdecl;
    {class} function _GetH263ProfileInternet: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel1: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel2: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel21: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel3: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel31: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel4: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel41: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel5: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel51: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel52: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel6: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel61: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel62: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel1: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel2: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel21: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel3: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel31: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel4: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel41: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel5: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel51: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel52: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel6: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel61: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel62: Integer; cdecl;
    {class} function _GetHEVCProfileMain: Integer; cdecl;
    {class} function _GetHEVCProfileMain10: Integer; cdecl;
    {class} function _GetHEVCProfileMain10HDR10: Integer; cdecl;
    {class} function _GetHEVCProfileMain10HDR10Plus: Integer; cdecl;
    {class} function _GetHEVCProfileMainStill: Integer; cdecl;
    {class} function _GetMPEG2LevelH14: Integer; cdecl;
    {class} function _GetMPEG2LevelHL: Integer; cdecl;
    {class} function _GetMPEG2LevelHP: Integer; cdecl;
    {class} function _GetMPEG2LevelLL: Integer; cdecl;
    {class} function _GetMPEG2LevelML: Integer; cdecl;
    {class} function _GetMPEG2Profile422: Integer; cdecl;
    {class} function _GetMPEG2ProfileHigh: Integer; cdecl;
    {class} function _GetMPEG2ProfileMain: Integer; cdecl;
    {class} function _GetMPEG2ProfileSNR: Integer; cdecl;
    {class} function _GetMPEG2ProfileSimple: Integer; cdecl;
    {class} function _GetMPEG2ProfileSpatial: Integer; cdecl;
    {class} function _GetMPEG4Level0: Integer; cdecl;
    {class} function _GetMPEG4Level0b: Integer; cdecl;
    {class} function _GetMPEG4Level1: Integer; cdecl;
    {class} function _GetMPEG4Level2: Integer; cdecl;
    {class} function _GetMPEG4Level3: Integer; cdecl;
    {class} function _GetMPEG4Level3b: Integer; cdecl;
    {class} function _GetMPEG4Level4: Integer; cdecl;
    {class} function _GetMPEG4Level4a: Integer; cdecl;
    {class} function _GetMPEG4Level5: Integer; cdecl;
    {class} function _GetMPEG4Level6: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedCoding: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedCore: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedRealTime: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedScalable: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedSimple: Integer; cdecl;
    {class} function _GetMPEG4ProfileBasicAnimated: Integer; cdecl;
    {class} function _GetMPEG4ProfileCore: Integer; cdecl;
    {class} function _GetMPEG4ProfileCoreScalable: Integer; cdecl;
    {class} function _GetMPEG4ProfileHybrid: Integer; cdecl;
    {class} function _GetMPEG4ProfileMain: Integer; cdecl;
    {class} function _GetMPEG4ProfileNbit: Integer; cdecl;
    {class} function _GetMPEG4ProfileScalableTexture: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimple: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleFBA: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleFace: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleScalable: Integer; cdecl;
    {class} function _GetVP8Level_Version0: Integer; cdecl;
    {class} function _GetVP8Level_Version1: Integer; cdecl;
    {class} function _GetVP8Level_Version2: Integer; cdecl;
    {class} function _GetVP8Level_Version3: Integer; cdecl;
    {class} function _GetVP8ProfileMain: Integer; cdecl;
    {class} function _GetVP9Level1: Integer; cdecl;
    {class} function _GetVP9Level11: Integer; cdecl;
    {class} function _GetVP9Level2: Integer; cdecl;
    {class} function _GetVP9Level21: Integer; cdecl;
    {class} function _GetVP9Level3: Integer; cdecl;
    {class} function _GetVP9Level31: Integer; cdecl;
    {class} function _GetVP9Level4: Integer; cdecl;
    {class} function _GetVP9Level41: Integer; cdecl;
    {class} function _GetVP9Level5: Integer; cdecl;
    {class} function _GetVP9Level51: Integer; cdecl;
    {class} function _GetVP9Level52: Integer; cdecl;
    {class} function _GetVP9Level6: Integer; cdecl;
    {class} function _GetVP9Level61: Integer; cdecl;
    {class} function _GetVP9Level62: Integer; cdecl;
    {class} function _GetVP9Profile0: Integer; cdecl;
    {class} function _GetVP9Profile1: Integer; cdecl;
    {class} function _GetVP9Profile2: Integer; cdecl;
    {class} function _GetVP9Profile2HDR: Integer; cdecl;
    {class} function _GetVP9Profile2HDR10Plus: Integer; cdecl;
    {class} function _GetVP9Profile3: Integer; cdecl;
    {class} function _GetVP9Profile3HDR: Integer; cdecl;
    {class} function _GetVP9Profile3HDR10Plus: Integer; cdecl;
    {class} function init: JMediaCodecInfo_CodecProfileLevel; cdecl;
    {class} property AACObjectELD: Integer read _GetAACObjectELD;
    {class} property AACObjectERLC: Integer read _GetAACObjectERLC;
    {class} property AACObjectERScalable: Integer read _GetAACObjectERScalable;
    {class} property AACObjectHE: Integer read _GetAACObjectHE;
    {class} property AACObjectHE_PS: Integer read _GetAACObjectHE_PS;
    {class} property AACObjectLC: Integer read _GetAACObjectLC;
    {class} property AACObjectLD: Integer read _GetAACObjectLD;
    {class} property AACObjectLTP: Integer read _GetAACObjectLTP;
    {class} property AACObjectMain: Integer read _GetAACObjectMain;
    {class} property AACObjectSSR: Integer read _GetAACObjectSSR;
    {class} property AACObjectScalable: Integer read _GetAACObjectScalable;
    {class} property AACObjectXHE: Integer read _GetAACObjectXHE;
    {class} property AV1Level2: Integer read _GetAV1Level2;
    {class} property AV1Level21: Integer read _GetAV1Level21;
    {class} property AV1Level22: Integer read _GetAV1Level22;
    {class} property AV1Level23: Integer read _GetAV1Level23;
    {class} property AV1Level3: Integer read _GetAV1Level3;
    {class} property AV1Level31: Integer read _GetAV1Level31;
    {class} property AV1Level32: Integer read _GetAV1Level32;
    {class} property AV1Level33: Integer read _GetAV1Level33;
    {class} property AV1Level4: Integer read _GetAV1Level4;
    {class} property AV1Level41: Integer read _GetAV1Level41;
    {class} property AV1Level42: Integer read _GetAV1Level42;
    {class} property AV1Level43: Integer read _GetAV1Level43;
    {class} property AV1Level5: Integer read _GetAV1Level5;
    {class} property AV1Level51: Integer read _GetAV1Level51;
    {class} property AV1Level52: Integer read _GetAV1Level52;
    {class} property AV1Level53: Integer read _GetAV1Level53;
    {class} property AV1Level6: Integer read _GetAV1Level6;
    {class} property AV1Level61: Integer read _GetAV1Level61;
    {class} property AV1Level62: Integer read _GetAV1Level62;
    {class} property AV1Level63: Integer read _GetAV1Level63;
    {class} property AV1Level7: Integer read _GetAV1Level7;
    {class} property AV1Level71: Integer read _GetAV1Level71;
    {class} property AV1Level72: Integer read _GetAV1Level72;
    {class} property AV1Level73: Integer read _GetAV1Level73;
    {class} property AV1ProfileMain10: Integer read _GetAV1ProfileMain10;
    {class} property AV1ProfileMain10HDR10: Integer read _GetAV1ProfileMain10HDR10;
    {class} property AV1ProfileMain10HDR10Plus: Integer read _GetAV1ProfileMain10HDR10Plus;
    {class} property AV1ProfileMain8: Integer read _GetAV1ProfileMain8;
    {class} property AVCLevel1: Integer read _GetAVCLevel1;
    {class} property AVCLevel11: Integer read _GetAVCLevel11;
    {class} property AVCLevel12: Integer read _GetAVCLevel12;
    {class} property AVCLevel13: Integer read _GetAVCLevel13;
    {class} property AVCLevel1b: Integer read _GetAVCLevel1b;
    {class} property AVCLevel2: Integer read _GetAVCLevel2;
    {class} property AVCLevel21: Integer read _GetAVCLevel21;
    {class} property AVCLevel22: Integer read _GetAVCLevel22;
    {class} property AVCLevel3: Integer read _GetAVCLevel3;
    {class} property AVCLevel31: Integer read _GetAVCLevel31;
    {class} property AVCLevel32: Integer read _GetAVCLevel32;
    {class} property AVCLevel4: Integer read _GetAVCLevel4;
    {class} property AVCLevel41: Integer read _GetAVCLevel41;
    {class} property AVCLevel42: Integer read _GetAVCLevel42;
    {class} property AVCLevel5: Integer read _GetAVCLevel5;
    {class} property AVCLevel51: Integer read _GetAVCLevel51;
    {class} property AVCLevel52: Integer read _GetAVCLevel52;
    {class} property AVCLevel6: Integer read _GetAVCLevel6;
    {class} property AVCLevel61: Integer read _GetAVCLevel61;
    {class} property AVCLevel62: Integer read _GetAVCLevel62;
    {class} property AVCProfileBaseline: Integer read _GetAVCProfileBaseline;
    {class} property AVCProfileConstrainedBaseline: Integer read _GetAVCProfileConstrainedBaseline;
    {class} property AVCProfileConstrainedHigh: Integer read _GetAVCProfileConstrainedHigh;
    {class} property AVCProfileExtended: Integer read _GetAVCProfileExtended;
    {class} property AVCProfileHigh: Integer read _GetAVCProfileHigh;
    {class} property AVCProfileHigh10: Integer read _GetAVCProfileHigh10;
    {class} property AVCProfileHigh422: Integer read _GetAVCProfileHigh422;
    {class} property AVCProfileHigh444: Integer read _GetAVCProfileHigh444;
    {class} property AVCProfileMain: Integer read _GetAVCProfileMain;
    {class} property DolbyVisionLevel8k30: Integer read _GetDolbyVisionLevel8k30;
    {class} property DolbyVisionLevel8k60: Integer read _GetDolbyVisionLevel8k60;
    {class} property DolbyVisionLevelFhd24: Integer read _GetDolbyVisionLevelFhd24;
    {class} property DolbyVisionLevelFhd30: Integer read _GetDolbyVisionLevelFhd30;
    {class} property DolbyVisionLevelFhd60: Integer read _GetDolbyVisionLevelFhd60;
    {class} property DolbyVisionLevelHd24: Integer read _GetDolbyVisionLevelHd24;
    {class} property DolbyVisionLevelHd30: Integer read _GetDolbyVisionLevelHd30;
    {class} property DolbyVisionLevelUhd120: Integer read _GetDolbyVisionLevelUhd120;
    {class} property DolbyVisionLevelUhd24: Integer read _GetDolbyVisionLevelUhd24;
    {class} property DolbyVisionLevelUhd30: Integer read _GetDolbyVisionLevelUhd30;
    {class} property DolbyVisionLevelUhd48: Integer read _GetDolbyVisionLevelUhd48;
    {class} property DolbyVisionLevelUhd60: Integer read _GetDolbyVisionLevelUhd60;
    {class} property DolbyVisionProfileDvav110: Integer read _GetDolbyVisionProfileDvav110;
    {class} property DolbyVisionProfileDvavPen: Integer read _GetDolbyVisionProfileDvavPen;
    {class} property DolbyVisionProfileDvavPer: Integer read _GetDolbyVisionProfileDvavPer;
    {class} property DolbyVisionProfileDvavSe: Integer read _GetDolbyVisionProfileDvavSe;
    {class} property DolbyVisionProfileDvheDen: Integer read _GetDolbyVisionProfileDvheDen;
    {class} property DolbyVisionProfileDvheDer: Integer read _GetDolbyVisionProfileDvheDer;
    {class} property DolbyVisionProfileDvheDtb: Integer read _GetDolbyVisionProfileDvheDtb;
    {class} property DolbyVisionProfileDvheDth: Integer read _GetDolbyVisionProfileDvheDth;
    {class} property DolbyVisionProfileDvheDtr: Integer read _GetDolbyVisionProfileDvheDtr;
    {class} property DolbyVisionProfileDvheSt: Integer read _GetDolbyVisionProfileDvheSt;
    {class} property DolbyVisionProfileDvheStn: Integer read _GetDolbyVisionProfileDvheStn;
    {class} property H263Level10: Integer read _GetH263Level10;
    {class} property H263Level20: Integer read _GetH263Level20;
    {class} property H263Level30: Integer read _GetH263Level30;
    {class} property H263Level40: Integer read _GetH263Level40;
    {class} property H263Level45: Integer read _GetH263Level45;
    {class} property H263Level50: Integer read _GetH263Level50;
    {class} property H263Level60: Integer read _GetH263Level60;
    {class} property H263Level70: Integer read _GetH263Level70;
    {class} property H263ProfileBackwardCompatible: Integer read _GetH263ProfileBackwardCompatible;
    {class} property H263ProfileBaseline: Integer read _GetH263ProfileBaseline;
    {class} property H263ProfileH320Coding: Integer read _GetH263ProfileH320Coding;
    {class} property H263ProfileHighCompression: Integer read _GetH263ProfileHighCompression;
    {class} property H263ProfileHighLatency: Integer read _GetH263ProfileHighLatency;
    {class} property H263ProfileISWV2: Integer read _GetH263ProfileISWV2;
    {class} property H263ProfileISWV3: Integer read _GetH263ProfileISWV3;
    {class} property H263ProfileInterlace: Integer read _GetH263ProfileInterlace;
    {class} property H263ProfileInternet: Integer read _GetH263ProfileInternet;
    {class} property HEVCHighTierLevel1: Integer read _GetHEVCHighTierLevel1;
    {class} property HEVCHighTierLevel2: Integer read _GetHEVCHighTierLevel2;
    {class} property HEVCHighTierLevel21: Integer read _GetHEVCHighTierLevel21;
    {class} property HEVCHighTierLevel3: Integer read _GetHEVCHighTierLevel3;
    {class} property HEVCHighTierLevel31: Integer read _GetHEVCHighTierLevel31;
    {class} property HEVCHighTierLevel4: Integer read _GetHEVCHighTierLevel4;
    {class} property HEVCHighTierLevel41: Integer read _GetHEVCHighTierLevel41;
    {class} property HEVCHighTierLevel5: Integer read _GetHEVCHighTierLevel5;
    {class} property HEVCHighTierLevel51: Integer read _GetHEVCHighTierLevel51;
    {class} property HEVCHighTierLevel52: Integer read _GetHEVCHighTierLevel52;
    {class} property HEVCHighTierLevel6: Integer read _GetHEVCHighTierLevel6;
    {class} property HEVCHighTierLevel61: Integer read _GetHEVCHighTierLevel61;
    {class} property HEVCHighTierLevel62: Integer read _GetHEVCHighTierLevel62;
    {class} property HEVCMainTierLevel1: Integer read _GetHEVCMainTierLevel1;
    {class} property HEVCMainTierLevel2: Integer read _GetHEVCMainTierLevel2;
    {class} property HEVCMainTierLevel21: Integer read _GetHEVCMainTierLevel21;
    {class} property HEVCMainTierLevel3: Integer read _GetHEVCMainTierLevel3;
    {class} property HEVCMainTierLevel31: Integer read _GetHEVCMainTierLevel31;
    {class} property HEVCMainTierLevel4: Integer read _GetHEVCMainTierLevel4;
    {class} property HEVCMainTierLevel41: Integer read _GetHEVCMainTierLevel41;
    {class} property HEVCMainTierLevel5: Integer read _GetHEVCMainTierLevel5;
    {class} property HEVCMainTierLevel51: Integer read _GetHEVCMainTierLevel51;
    {class} property HEVCMainTierLevel52: Integer read _GetHEVCMainTierLevel52;
    {class} property HEVCMainTierLevel6: Integer read _GetHEVCMainTierLevel6;
    {class} property HEVCMainTierLevel61: Integer read _GetHEVCMainTierLevel61;
    {class} property HEVCMainTierLevel62: Integer read _GetHEVCMainTierLevel62;
    {class} property HEVCProfileMain: Integer read _GetHEVCProfileMain;
    {class} property HEVCProfileMain10: Integer read _GetHEVCProfileMain10;
    {class} property HEVCProfileMain10HDR10: Integer read _GetHEVCProfileMain10HDR10;
    {class} property HEVCProfileMain10HDR10Plus: Integer read _GetHEVCProfileMain10HDR10Plus;
    {class} property HEVCProfileMainStill: Integer read _GetHEVCProfileMainStill;
    {class} property MPEG2LevelH14: Integer read _GetMPEG2LevelH14;
    {class} property MPEG2LevelHL: Integer read _GetMPEG2LevelHL;
    {class} property MPEG2LevelHP: Integer read _GetMPEG2LevelHP;
    {class} property MPEG2LevelLL: Integer read _GetMPEG2LevelLL;
    {class} property MPEG2LevelML: Integer read _GetMPEG2LevelML;
    {class} property MPEG2Profile422: Integer read _GetMPEG2Profile422;
    {class} property MPEG2ProfileHigh: Integer read _GetMPEG2ProfileHigh;
    {class} property MPEG2ProfileMain: Integer read _GetMPEG2ProfileMain;
    {class} property MPEG2ProfileSNR: Integer read _GetMPEG2ProfileSNR;
    {class} property MPEG2ProfileSimple: Integer read _GetMPEG2ProfileSimple;
    {class} property MPEG2ProfileSpatial: Integer read _GetMPEG2ProfileSpatial;
    {class} property MPEG4Level0: Integer read _GetMPEG4Level0;
    {class} property MPEG4Level0b: Integer read _GetMPEG4Level0b;
    {class} property MPEG4Level1: Integer read _GetMPEG4Level1;
    {class} property MPEG4Level2: Integer read _GetMPEG4Level2;
    {class} property MPEG4Level3: Integer read _GetMPEG4Level3;
    {class} property MPEG4Level3b: Integer read _GetMPEG4Level3b;
    {class} property MPEG4Level4: Integer read _GetMPEG4Level4;
    {class} property MPEG4Level4a: Integer read _GetMPEG4Level4a;
    {class} property MPEG4Level5: Integer read _GetMPEG4Level5;
    {class} property MPEG4Level6: Integer read _GetMPEG4Level6;
    {class} property MPEG4ProfileAdvancedCoding: Integer read _GetMPEG4ProfileAdvancedCoding;
    {class} property MPEG4ProfileAdvancedCore: Integer read _GetMPEG4ProfileAdvancedCore;
    {class} property MPEG4ProfileAdvancedRealTime: Integer read _GetMPEG4ProfileAdvancedRealTime;
    {class} property MPEG4ProfileAdvancedScalable: Integer read _GetMPEG4ProfileAdvancedScalable;
    {class} property MPEG4ProfileAdvancedSimple: Integer read _GetMPEG4ProfileAdvancedSimple;
    {class} property MPEG4ProfileBasicAnimated: Integer read _GetMPEG4ProfileBasicAnimated;
    {class} property MPEG4ProfileCore: Integer read _GetMPEG4ProfileCore;
    {class} property MPEG4ProfileCoreScalable: Integer read _GetMPEG4ProfileCoreScalable;
    {class} property MPEG4ProfileHybrid: Integer read _GetMPEG4ProfileHybrid;
    {class} property MPEG4ProfileMain: Integer read _GetMPEG4ProfileMain;
    {class} property MPEG4ProfileNbit: Integer read _GetMPEG4ProfileNbit;
    {class} property MPEG4ProfileScalableTexture: Integer read _GetMPEG4ProfileScalableTexture;
    {class} property MPEG4ProfileSimple: Integer read _GetMPEG4ProfileSimple;
    {class} property MPEG4ProfileSimpleFBA: Integer read _GetMPEG4ProfileSimpleFBA;
    {class} property MPEG4ProfileSimpleFace: Integer read _GetMPEG4ProfileSimpleFace;
    {class} property MPEG4ProfileSimpleScalable: Integer read _GetMPEG4ProfileSimpleScalable;
    {class} property VP8Level_Version0: Integer read _GetVP8Level_Version0;
    {class} property VP8Level_Version1: Integer read _GetVP8Level_Version1;
    {class} property VP8Level_Version2: Integer read _GetVP8Level_Version2;
    {class} property VP8Level_Version3: Integer read _GetVP8Level_Version3;
    {class} property VP8ProfileMain: Integer read _GetVP8ProfileMain;
    {class} property VP9Level1: Integer read _GetVP9Level1;
    {class} property VP9Level11: Integer read _GetVP9Level11;
    {class} property VP9Level2: Integer read _GetVP9Level2;
    {class} property VP9Level21: Integer read _GetVP9Level21;
    {class} property VP9Level3: Integer read _GetVP9Level3;
    {class} property VP9Level31: Integer read _GetVP9Level31;
    {class} property VP9Level4: Integer read _GetVP9Level4;
    {class} property VP9Level41: Integer read _GetVP9Level41;
    {class} property VP9Level5: Integer read _GetVP9Level5;
    {class} property VP9Level51: Integer read _GetVP9Level51;
    {class} property VP9Level52: Integer read _GetVP9Level52;
    {class} property VP9Level6: Integer read _GetVP9Level6;
    {class} property VP9Level61: Integer read _GetVP9Level61;
    {class} property VP9Level62: Integer read _GetVP9Level62;
    {class} property VP9Profile0: Integer read _GetVP9Profile0;
    {class} property VP9Profile1: Integer read _GetVP9Profile1;
    {class} property VP9Profile2: Integer read _GetVP9Profile2;
    {class} property VP9Profile2HDR: Integer read _GetVP9Profile2HDR;
    {class} property VP9Profile2HDR10Plus: Integer read _GetVP9Profile2HDR10Plus;
    {class} property VP9Profile3: Integer read _GetVP9Profile3;
    {class} property VP9Profile3HDR: Integer read _GetVP9Profile3HDR;
    {class} property VP9Profile3HDR10Plus: Integer read _GetVP9Profile3HDR10Plus;
  end;

  [JavaSignature('android/media/MediaCodecInfo$CodecProfileLevel')]
  JMediaCodecInfo_CodecProfileLevel = interface(JObject)
    ['{73647127-6989-4ABF-B521-186C8899A5AC}']
    function _Getlevel: Integer; cdecl;
    procedure _Setlevel(Value: Integer); cdecl;
    function _Getprofile: Integer; cdecl;
    procedure _Setprofile(Value: Integer); cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property level: Integer read _Getlevel write _Setlevel;
    property profile: Integer read _Getprofile write _Setprofile;
  end;
  TJMediaCodecInfo_CodecProfileLevel = class(TJavaGenericImport<JMediaCodecInfo_CodecProfileLevelClass, JMediaCodecInfo_CodecProfileLevel>) end;

  JMediaCodecInfo_EncoderCapabilitiesClass = interface(JObjectClass)
    ['{7E63CBC5-39D5-4BD2-BA7D-546C75E7E8E7}']
    {class} function _GetBITRATE_MODE_CBR: Integer; cdecl;
    {class} function _GetBITRATE_MODE_CBR_FD: Integer; cdecl;
    {class} function _GetBITRATE_MODE_CQ: Integer; cdecl;
    {class} function _GetBITRATE_MODE_VBR: Integer; cdecl;
    {class} property BITRATE_MODE_CBR: Integer read _GetBITRATE_MODE_CBR;
    {class} property BITRATE_MODE_CBR_FD: Integer read _GetBITRATE_MODE_CBR_FD;
    {class} property BITRATE_MODE_CQ: Integer read _GetBITRATE_MODE_CQ;
    {class} property BITRATE_MODE_VBR: Integer read _GetBITRATE_MODE_VBR;
  end;

  [JavaSignature('android/media/MediaCodecInfo$EncoderCapabilities')]
  JMediaCodecInfo_EncoderCapabilities = interface(JObject)
    ['{CF329E17-B67E-43AA-B25C-1CBF285012FE}']
    function getComplexityRange: JRange; cdecl;
    function getQualityRange: JRange; cdecl;
    function isBitrateModeSupported(mode: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_EncoderCapabilities = class(TJavaGenericImport<JMediaCodecInfo_EncoderCapabilitiesClass, JMediaCodecInfo_EncoderCapabilities>) end;

  JMediaCodecInfo_VideoCapabilitiesClass = interface(JObjectClass)
    ['{0316BD5A-7F27-454B-BB1D-8A56AB696162}']
  end;

  [JavaSignature('android/media/MediaCodecInfo$VideoCapabilities')]
  JMediaCodecInfo_VideoCapabilities = interface(JObject)
    ['{CAAA6FFF-B464-486E-8455-A484667C9BDA}']
    function areSizeAndRateSupported(width: Integer; height: Integer; frameRate: Double): Boolean; cdecl;
    function getAchievableFrameRatesFor(width: Integer; height: Integer): JRange; cdecl;
    function getBitrateRange: JRange; cdecl;
    function getHeightAlignment: Integer; cdecl;
    function getSupportedFrameRates: JRange; cdecl;
    function getSupportedFrameRatesFor(width: Integer; height: Integer): JRange; cdecl;
    function getSupportedHeights: JRange; cdecl;
    function getSupportedHeightsFor(width: Integer): JRange; cdecl;
    function getSupportedPerformancePoints: JList; cdecl;
    function getSupportedWidths: JRange; cdecl;
    function getSupportedWidthsFor(height: Integer): JRange; cdecl;
    function getWidthAlignment: Integer; cdecl;
    function isSizeSupported(width: Integer; height: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_VideoCapabilities = class(TJavaGenericImport<JMediaCodecInfo_VideoCapabilitiesClass, JMediaCodecInfo_VideoCapabilities>) end;

  JVideoCapabilities_PerformancePointClass = interface(JObjectClass)
    ['{3BBC4870-37E3-43F7-A539-AB589102F709}']
    {class} function _GetFHD_100: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_120: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_200: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_24: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_240: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_25: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_30: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_50: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetFHD_60: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_100: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_120: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_200: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_24: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_240: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_25: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_30: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_50: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetHD_60: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_24: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_25: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_30: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_48: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_50: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetSD_60: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_100: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_120: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_200: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_24: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_240: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_25: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_30: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_50: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function _GetUHD_60: JVideoCapabilities_PerformancePoint; cdecl;
    {class} function init(width: Integer; height: Integer; frameRate: Integer): JVideoCapabilities_PerformancePoint; cdecl;
    {class} property FHD_100: JVideoCapabilities_PerformancePoint read _GetFHD_100;
    {class} property FHD_120: JVideoCapabilities_PerformancePoint read _GetFHD_120;
    {class} property FHD_200: JVideoCapabilities_PerformancePoint read _GetFHD_200;
    {class} property FHD_24: JVideoCapabilities_PerformancePoint read _GetFHD_24;
    {class} property FHD_240: JVideoCapabilities_PerformancePoint read _GetFHD_240;
    {class} property FHD_25: JVideoCapabilities_PerformancePoint read _GetFHD_25;
    {class} property FHD_30: JVideoCapabilities_PerformancePoint read _GetFHD_30;
    {class} property FHD_50: JVideoCapabilities_PerformancePoint read _GetFHD_50;
    {class} property FHD_60: JVideoCapabilities_PerformancePoint read _GetFHD_60;
    {class} property HD_100: JVideoCapabilities_PerformancePoint read _GetHD_100;
    {class} property HD_120: JVideoCapabilities_PerformancePoint read _GetHD_120;
    {class} property HD_200: JVideoCapabilities_PerformancePoint read _GetHD_200;
    {class} property HD_24: JVideoCapabilities_PerformancePoint read _GetHD_24;
    {class} property HD_240: JVideoCapabilities_PerformancePoint read _GetHD_240;
    {class} property HD_25: JVideoCapabilities_PerformancePoint read _GetHD_25;
    {class} property HD_30: JVideoCapabilities_PerformancePoint read _GetHD_30;
    {class} property HD_50: JVideoCapabilities_PerformancePoint read _GetHD_50;
    {class} property HD_60: JVideoCapabilities_PerformancePoint read _GetHD_60;
    {class} property SD_24: JVideoCapabilities_PerformancePoint read _GetSD_24;
    {class} property SD_25: JVideoCapabilities_PerformancePoint read _GetSD_25;
    {class} property SD_30: JVideoCapabilities_PerformancePoint read _GetSD_30;
    {class} property SD_48: JVideoCapabilities_PerformancePoint read _GetSD_48;
    {class} property SD_50: JVideoCapabilities_PerformancePoint read _GetSD_50;
    {class} property SD_60: JVideoCapabilities_PerformancePoint read _GetSD_60;
    {class} property UHD_100: JVideoCapabilities_PerformancePoint read _GetUHD_100;
    {class} property UHD_120: JVideoCapabilities_PerformancePoint read _GetUHD_120;
    {class} property UHD_200: JVideoCapabilities_PerformancePoint read _GetUHD_200;
    {class} property UHD_24: JVideoCapabilities_PerformancePoint read _GetUHD_24;
    {class} property UHD_240: JVideoCapabilities_PerformancePoint read _GetUHD_240;
    {class} property UHD_25: JVideoCapabilities_PerformancePoint read _GetUHD_25;
    {class} property UHD_30: JVideoCapabilities_PerformancePoint read _GetUHD_30;
    {class} property UHD_50: JVideoCapabilities_PerformancePoint read _GetUHD_50;
    {class} property UHD_60: JVideoCapabilities_PerformancePoint read _GetUHD_60;
  end;

  [JavaSignature('android/media/MediaCodecInfo$VideoCapabilities$PerformancePoint')]
  JVideoCapabilities_PerformancePoint = interface(JObject)
    ['{6D5341D6-E0DC-4C11-A21E-5106A126711E}']
    function covers(format: JMediaFormat): Boolean; cdecl; overload;
    function covers(other: JVideoCapabilities_PerformancePoint): Boolean; cdecl; overload;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJVideoCapabilities_PerformancePoint = class(TJavaGenericImport<JVideoCapabilities_PerformancePointClass, JVideoCapabilities_PerformancePoint>) end;

  JMediaCodecListClass = interface(JObjectClass)
    ['{F1400E68-3BDF-4B8B-9B45-F679CD2B2BF3}']
    {class} function _GetALL_CODECS: Integer; cdecl;
    {class} function _GetREGULAR_CODECS: Integer; cdecl;
    {class} function init(kind: Integer): JMediaCodecList; cdecl;
    {class} function getCodecCount: Integer; cdecl;//Deprecated
    {class} function getCodecInfoAt(index: Integer): JMediaCodecInfo; cdecl;//Deprecated
    {class} property ALL_CODECS: Integer read _GetALL_CODECS;
    {class} property REGULAR_CODECS: Integer read _GetREGULAR_CODECS;
  end;

  [JavaSignature('android/media/MediaCodecList')]
  JMediaCodecList = interface(JObject)
    ['{26F449D6-A979-4BE9-BCE4-C67841504DA3}']
    function findDecoderForFormat(format: JMediaFormat): JString; cdecl;
    function findEncoderForFormat(format: JMediaFormat): JString; cdecl;
    function getCodecInfos: TJavaObjectArray<JMediaCodecInfo>; cdecl;
  end;
  TJMediaCodecList = class(TJavaGenericImport<JMediaCodecListClass, JMediaCodecList>) end;

  JMediaCryptoClass = interface(JObjectClass)
    ['{31B7D145-1DBA-4D5C-860B-338AA3F6780B}']
    {class} function init(uuid: JUUID; sessionId: TJavaArray<Byte>): JMediaCrypto; cdecl;
    {class} function isCryptoSchemeSupported(uuid: JUUID): Boolean; cdecl;
  end;

  [JavaSignature('android/media/MediaCrypto')]
  JMediaCrypto = interface(JObject)
    ['{B1E505C9-9F43-4C70-AB68-C0DEC0999882}']
    procedure release; cdecl;
    function requiresSecureDecoderComponent(mime: JString): Boolean; cdecl;
    procedure setMediaDrmSession(sessionId: TJavaArray<Byte>); cdecl;
  end;
  TJMediaCrypto = class(TJavaGenericImport<JMediaCryptoClass, JMediaCrypto>) end;

  JMediaCryptoExceptionClass = interface(JExceptionClass)
    ['{36A5DB4A-6D5E-49B1-B7A0-5C25892D9C7E}']
    {class} function init(detailMessage: JString): JMediaCryptoException; cdecl;
  end;

  [JavaSignature('android/media/MediaCryptoException')]
  JMediaCryptoException = interface(JException)
    ['{1039BDE3-1DD7-440A-A6B8-B55FE0B3658E}']
  end;
  TJMediaCryptoException = class(TJavaGenericImport<JMediaCryptoExceptionClass, JMediaCryptoException>) end;

  JMediaDataSourceClass = interface(JObjectClass)
    ['{F151577B-1760-4D30-B10E-76366C98EFBC}']
    {class} function init: JMediaDataSource; cdecl;
  end;

  [JavaSignature('android/media/MediaDataSource')]
  JMediaDataSource = interface(JObject)
    ['{5FCFC5A1-995B-4989-878C-B361BC93D355}']
    function getSize: Int64; cdecl;
    function readAt(position: Int64; buffer: TJavaArray<Byte>; offset: Integer; size: Integer): Integer; cdecl;
  end;
  TJMediaDataSource = class(TJavaGenericImport<JMediaDataSourceClass, JMediaDataSource>) end;

  JMediaDescramblerClass = interface(JObjectClass)
    ['{72B0BD67-1373-4A16-A65D-FD1C21707281}']
    {class} function _GetSCRAMBLE_CONTROL_EVEN_KEY: Byte; cdecl;
    {class} function _GetSCRAMBLE_CONTROL_ODD_KEY: Byte; cdecl;
    {class} function _GetSCRAMBLE_CONTROL_RESERVED: Byte; cdecl;
    {class} function _GetSCRAMBLE_CONTROL_UNSCRAMBLED: Byte; cdecl;
    {class} function _GetSCRAMBLE_FLAG_PES_HEADER: Byte; cdecl;
    {class} function init(CA_system_id: Integer): JMediaDescrambler; cdecl;
    {class} property SCRAMBLE_CONTROL_EVEN_KEY: Byte read _GetSCRAMBLE_CONTROL_EVEN_KEY;
    {class} property SCRAMBLE_CONTROL_ODD_KEY: Byte read _GetSCRAMBLE_CONTROL_ODD_KEY;
    {class} property SCRAMBLE_CONTROL_RESERVED: Byte read _GetSCRAMBLE_CONTROL_RESERVED;
    {class} property SCRAMBLE_CONTROL_UNSCRAMBLED: Byte read _GetSCRAMBLE_CONTROL_UNSCRAMBLED;
    {class} property SCRAMBLE_FLAG_PES_HEADER: Byte read _GetSCRAMBLE_FLAG_PES_HEADER;
  end;

  [JavaSignature('android/media/MediaDescrambler')]
  JMediaDescrambler = interface(JObject)
    ['{370B7364-FBA8-4CB6-A30E-DFA5E3E1A580}']
    procedure close; cdecl;
    function descramble(srcBuf: JByteBuffer; dstBuf: JByteBuffer; cryptoInfo: JMediaCodec_CryptoInfo): Integer; cdecl;
    function requiresSecureDecoderComponent(mime: JString): Boolean; cdecl;
    procedure setMediaCasSession(session: JMediaCas_Session); cdecl;
  end;
  TJMediaDescrambler = class(TJavaGenericImport<JMediaDescramblerClass, JMediaDescrambler>) end;

  JMediaDescriptionClass = interface(JObjectClass)
    ['{48EF965A-BA6D-4E0D-9E96-295D7FC4A8A7}']
    {class} function _GetBT_FOLDER_TYPE_ALBUMS: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_ARTISTS: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_GENRES: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_MIXED: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_PLAYLISTS: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_TITLES: Int64; cdecl;
    {class} function _GetBT_FOLDER_TYPE_YEARS: Int64; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_BT_FOLDER_TYPE: JString; cdecl;
    {class} property BT_FOLDER_TYPE_ALBUMS: Int64 read _GetBT_FOLDER_TYPE_ALBUMS;
    {class} property BT_FOLDER_TYPE_ARTISTS: Int64 read _GetBT_FOLDER_TYPE_ARTISTS;
    {class} property BT_FOLDER_TYPE_GENRES: Int64 read _GetBT_FOLDER_TYPE_GENRES;
    {class} property BT_FOLDER_TYPE_MIXED: Int64 read _GetBT_FOLDER_TYPE_MIXED;
    {class} property BT_FOLDER_TYPE_PLAYLISTS: Int64 read _GetBT_FOLDER_TYPE_PLAYLISTS;
    {class} property BT_FOLDER_TYPE_TITLES: Int64 read _GetBT_FOLDER_TYPE_TITLES;
    {class} property BT_FOLDER_TYPE_YEARS: Int64 read _GetBT_FOLDER_TYPE_YEARS;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_BT_FOLDER_TYPE: JString read _GetEXTRA_BT_FOLDER_TYPE;
  end;

  [JavaSignature('android/media/MediaDescription')]
  JMediaDescription = interface(JObject)
    ['{7990BBD4-299A-42B2-9A86-DAB2B978009D}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getExtras: JBundle; cdecl;
    function getIconBitmap: JBitmap; cdecl;
    function getIconUri: Jnet_Uri; cdecl;
    function getMediaId: JString; cdecl;
    function getMediaUri: Jnet_Uri; cdecl;
    function getSubtitle: JCharSequence; cdecl;
    function getTitle: JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaDescription = class(TJavaGenericImport<JMediaDescriptionClass, JMediaDescription>) end;

  JMediaDescription_BuilderClass = interface(JObjectClass)
    ['{AD916B94-C370-4AB8-8521-CC3665D973EA}']
    {class} function init: JMediaDescription_Builder; cdecl;
  end;

  [JavaSignature('android/media/MediaDescription$Builder')]
  JMediaDescription_Builder = interface(JObject)
    ['{0E5F1828-0ED0-494B-A738-274DC25F2FBF}']
    function build: JMediaDescription; cdecl;
    function setDescription(description: JCharSequence): JMediaDescription_Builder; cdecl;
    function setExtras(extras: JBundle): JMediaDescription_Builder; cdecl;
    function setIconBitmap(icon: JBitmap): JMediaDescription_Builder; cdecl;
    function setIconUri(iconUri: Jnet_Uri): JMediaDescription_Builder; cdecl;
    function setMediaId(mediaId: JString): JMediaDescription_Builder; cdecl;
    function setMediaUri(mediaUri: Jnet_Uri): JMediaDescription_Builder; cdecl;
    function setSubtitle(subtitle: JCharSequence): JMediaDescription_Builder; cdecl;
    function setTitle(title: JCharSequence): JMediaDescription_Builder; cdecl;
  end;
  TJMediaDescription_Builder = class(TJavaGenericImport<JMediaDescription_BuilderClass, JMediaDescription_Builder>) end;

  JMediaDrmClass = interface(JObjectClass)
    ['{C651B2A8-FB61-4FB8-A78A-AC978A0301B6}']
    {class} function _GetEVENT_KEY_EXPIRED: Integer; cdecl;
    {class} function _GetEVENT_KEY_REQUIRED: Integer; cdecl;
    {class} function _GetEVENT_PROVISION_REQUIRED: Integer; cdecl;
    {class} function _GetEVENT_SESSION_RECLAIMED: Integer; cdecl;
    {class} function _GetEVENT_VENDOR_DEFINED: Integer; cdecl;
    {class} function _GetHDCP_LEVEL_UNKNOWN: Integer; cdecl;
    {class} function _GetHDCP_NONE: Integer; cdecl;
    {class} function _GetHDCP_NO_DIGITAL_OUTPUT: Integer; cdecl;
    {class} function _GetHDCP_V1: Integer; cdecl;
    {class} function _GetHDCP_V2: Integer; cdecl;
    {class} function _GetHDCP_V2_1: Integer; cdecl;
    {class} function _GetHDCP_V2_2: Integer; cdecl;
    {class} function _GetHDCP_V2_3: Integer; cdecl;
    {class} function _GetKEY_TYPE_OFFLINE: Integer; cdecl;
    {class} function _GetKEY_TYPE_RELEASE: Integer; cdecl;
    {class} function _GetKEY_TYPE_STREAMING: Integer; cdecl;
    {class} function _GetOFFLINE_LICENSE_STATE_RELEASED: Integer; cdecl;
    {class} function _GetOFFLINE_LICENSE_STATE_UNKNOWN: Integer; cdecl;
    {class} function _GetOFFLINE_LICENSE_STATE_USABLE: Integer; cdecl;
    {class} function _GetPROPERTY_ALGORITHMS: JString; cdecl;
    {class} function _GetPROPERTY_DESCRIPTION: JString; cdecl;
    {class} function _GetPROPERTY_DEVICE_UNIQUE_ID: JString; cdecl;
    {class} function _GetPROPERTY_VENDOR: JString; cdecl;
    {class} function _GetPROPERTY_VERSION: JString; cdecl;
    {class} function _GetSECURITY_LEVEL_HW_SECURE_ALL: Integer; cdecl;
    {class} function _GetSECURITY_LEVEL_HW_SECURE_CRYPTO: Integer; cdecl;
    {class} function _GetSECURITY_LEVEL_HW_SECURE_DECODE: Integer; cdecl;
    {class} function _GetSECURITY_LEVEL_SW_SECURE_CRYPTO: Integer; cdecl;
    {class} function _GetSECURITY_LEVEL_SW_SECURE_DECODE: Integer; cdecl;
    {class} function _GetSECURITY_LEVEL_UNKNOWN: Integer; cdecl;
    {class} function init(uuid: JUUID): JMediaDrm; cdecl;
    {class} function getMaxSecurityLevel: Integer; cdecl;
    {class} function getSupportedCryptoSchemes: JList; cdecl;
    {class} function isCryptoSchemeSupported(uuid: JUUID): Boolean; cdecl; overload;
    {class} function isCryptoSchemeSupported(uuid: JUUID; mimeType: JString): Boolean; cdecl; overload;
    {class} function isCryptoSchemeSupported(uuid: JUUID; mimeType: JString; securityLevel: Integer): Boolean; cdecl; overload;
    {class} property EVENT_KEY_EXPIRED: Integer read _GetEVENT_KEY_EXPIRED;
    {class} property EVENT_KEY_REQUIRED: Integer read _GetEVENT_KEY_REQUIRED;
    {class} property EVENT_PROVISION_REQUIRED: Integer read _GetEVENT_PROVISION_REQUIRED;
    {class} property EVENT_SESSION_RECLAIMED: Integer read _GetEVENT_SESSION_RECLAIMED;
    {class} property EVENT_VENDOR_DEFINED: Integer read _GetEVENT_VENDOR_DEFINED;
    {class} property HDCP_LEVEL_UNKNOWN: Integer read _GetHDCP_LEVEL_UNKNOWN;
    {class} property HDCP_NONE: Integer read _GetHDCP_NONE;
    {class} property HDCP_NO_DIGITAL_OUTPUT: Integer read _GetHDCP_NO_DIGITAL_OUTPUT;
    {class} property HDCP_V1: Integer read _GetHDCP_V1;
    {class} property HDCP_V2: Integer read _GetHDCP_V2;
    {class} property HDCP_V2_1: Integer read _GetHDCP_V2_1;
    {class} property HDCP_V2_2: Integer read _GetHDCP_V2_2;
    {class} property HDCP_V2_3: Integer read _GetHDCP_V2_3;
    {class} property KEY_TYPE_OFFLINE: Integer read _GetKEY_TYPE_OFFLINE;
    {class} property KEY_TYPE_RELEASE: Integer read _GetKEY_TYPE_RELEASE;
    {class} property KEY_TYPE_STREAMING: Integer read _GetKEY_TYPE_STREAMING;
    {class} property OFFLINE_LICENSE_STATE_RELEASED: Integer read _GetOFFLINE_LICENSE_STATE_RELEASED;
    {class} property OFFLINE_LICENSE_STATE_UNKNOWN: Integer read _GetOFFLINE_LICENSE_STATE_UNKNOWN;
    {class} property OFFLINE_LICENSE_STATE_USABLE: Integer read _GetOFFLINE_LICENSE_STATE_USABLE;
    {class} property PROPERTY_ALGORITHMS: JString read _GetPROPERTY_ALGORITHMS;
    {class} property PROPERTY_DESCRIPTION: JString read _GetPROPERTY_DESCRIPTION;
    {class} property PROPERTY_DEVICE_UNIQUE_ID: JString read _GetPROPERTY_DEVICE_UNIQUE_ID;
    {class} property PROPERTY_VENDOR: JString read _GetPROPERTY_VENDOR;
    {class} property PROPERTY_VERSION: JString read _GetPROPERTY_VERSION;
    {class} property SECURITY_LEVEL_HW_SECURE_ALL: Integer read _GetSECURITY_LEVEL_HW_SECURE_ALL;
    {class} property SECURITY_LEVEL_HW_SECURE_CRYPTO: Integer read _GetSECURITY_LEVEL_HW_SECURE_CRYPTO;
    {class} property SECURITY_LEVEL_HW_SECURE_DECODE: Integer read _GetSECURITY_LEVEL_HW_SECURE_DECODE;
    {class} property SECURITY_LEVEL_SW_SECURE_CRYPTO: Integer read _GetSECURITY_LEVEL_SW_SECURE_CRYPTO;
    {class} property SECURITY_LEVEL_SW_SECURE_DECODE: Integer read _GetSECURITY_LEVEL_SW_SECURE_DECODE;
    {class} property SECURITY_LEVEL_UNKNOWN: Integer read _GetSECURITY_LEVEL_UNKNOWN;
  end;

  [JavaSignature('android/media/MediaDrm')]
  JMediaDrm = interface(JObject)
    ['{5F04A6A3-8E24-418B-B9DF-17F7D05A7679}']
    procedure clearOnEventListener; cdecl;
    procedure clearOnExpirationUpdateListener; cdecl;
    procedure clearOnKeyStatusChangeListener; cdecl;
    procedure clearOnSessionLostStateListener; cdecl;
    procedure close; cdecl;
    procedure closeSession(sessionId: TJavaArray<Byte>); cdecl;
    function getConnectedHdcpLevel: Integer; cdecl;
    function getCryptoSession(sessionId: TJavaArray<Byte>; cipherAlgorithm: JString; macAlgorithm: JString): JMediaDrm_CryptoSession; cdecl;
    function getKeyRequest(scope: TJavaArray<Byte>; init: TJavaArray<Byte>; mimeType: JString; keyType: Integer; optionalParameters: JHashMap): JMediaDrm_KeyRequest; cdecl;
    function getLogMessages: JList; cdecl;
    function getMaxHdcpLevel: Integer; cdecl;
    function getMaxSessionCount: Integer; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getOfflineLicenseKeySetIds: JList; cdecl;
    function getOfflineLicenseState(keySetId: TJavaArray<Byte>): Integer; cdecl;
    function getOpenSessionCount: Integer; cdecl;
    function getPlaybackComponent(sessionId: TJavaArray<Byte>): JMediaDrm_PlaybackComponent; cdecl;
    function getPropertyByteArray(propertyName: JString): TJavaArray<Byte>; cdecl;
    function getPropertyString(propertyName: JString): JString; cdecl;
    function getProvisionRequest: JMediaDrm_ProvisionRequest; cdecl;
    function getSecureStop(ssid: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    function getSecureStopIds: JList; cdecl;//Deprecated
    function getSecureStops: JList; cdecl;//Deprecated
    function getSecurityLevel(sessionId: TJavaArray<Byte>): Integer; cdecl;
    function openSession: TJavaArray<Byte>; cdecl; overload;
    function openSession(level: Integer): TJavaArray<Byte>; cdecl; overload;
    function provideKeyResponse(scope: TJavaArray<Byte>; response: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    procedure provideProvisionResponse(response: TJavaArray<Byte>); cdecl;
    function queryKeyStatus(sessionId: TJavaArray<Byte>): JHashMap; cdecl;
    procedure release; cdecl;//Deprecated
    procedure releaseAllSecureStops; cdecl;//Deprecated
    procedure releaseSecureStops(ssRelease: TJavaArray<Byte>); cdecl;//Deprecated
    procedure removeAllSecureStops; cdecl;//Deprecated
    procedure removeKeys(sessionId: TJavaArray<Byte>); cdecl;
    procedure removeOfflineLicense(keySetId: TJavaArray<Byte>); cdecl;
    procedure removeSecureStop(ssid: TJavaArray<Byte>); cdecl;//Deprecated
    function requiresSecureDecoder(mime: JString): Boolean; cdecl; overload;
    function requiresSecureDecoder(mime: JString; level: Integer): Boolean; cdecl; overload;
    procedure restoreKeys(sessionId: TJavaArray<Byte>; keySetId: TJavaArray<Byte>); cdecl;
    procedure setOnEventListener(listener: JMediaDrm_OnEventListener); cdecl; overload;
    procedure setOnEventListener(listener: JMediaDrm_OnEventListener; handler: JHandler); cdecl; overload;
    procedure setOnEventListener(executor: JExecutor; listener: JMediaDrm_OnEventListener); cdecl; overload;
    procedure setOnExpirationUpdateListener(listener: JMediaDrm_OnExpirationUpdateListener; handler: JHandler); cdecl; overload;
    procedure setOnExpirationUpdateListener(executor: JExecutor; listener: JMediaDrm_OnExpirationUpdateListener); cdecl; overload;
    procedure setOnKeyStatusChangeListener(listener: JMediaDrm_OnKeyStatusChangeListener; handler: JHandler); cdecl; overload;
    procedure setOnKeyStatusChangeListener(executor: JExecutor; listener: JMediaDrm_OnKeyStatusChangeListener); cdecl; overload;
    procedure setOnSessionLostStateListener(listener: JMediaDrm_OnSessionLostStateListener; handler: JHandler); cdecl; overload;
    procedure setOnSessionLostStateListener(executor: JExecutor; listener: JMediaDrm_OnSessionLostStateListener); cdecl; overload;
    procedure setPropertyByteArray(propertyName: JString; value: TJavaArray<Byte>); cdecl;
    procedure setPropertyString(propertyName: JString; value: JString); cdecl;
  end;
  TJMediaDrm = class(TJavaGenericImport<JMediaDrmClass, JMediaDrm>) end;

  JMediaDrm_CryptoSessionClass = interface(JObjectClass)
    ['{2DC02445-1225-4C69-81FE-1753BE2C6FB2}']
  end;

  [JavaSignature('android/media/MediaDrm$CryptoSession')]
  JMediaDrm_CryptoSession = interface(JObject)
    ['{F42109AE-2871-43EE-B6EA-2D781395C054}']
    function decrypt(keyid: TJavaArray<Byte>; input: TJavaArray<Byte>; iv: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function encrypt(keyid: TJavaArray<Byte>; input: TJavaArray<Byte>; iv: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function sign(keyid: TJavaArray<Byte>; message: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function verify(keyid: TJavaArray<Byte>; message: TJavaArray<Byte>; signature: TJavaArray<Byte>): Boolean; cdecl;
  end;
  TJMediaDrm_CryptoSession = class(TJavaGenericImport<JMediaDrm_CryptoSessionClass, JMediaDrm_CryptoSession>) end;

  JMediaDrm_ErrorCodesClass = interface(JObjectClass)
    ['{1DF42035-D8E6-4472-8A8D-C266728F8EE0}']
    {class} function _GetERROR_CERTIFICATE_MALFORMED: Integer; cdecl;
    {class} function _GetERROR_CERTIFICATE_MISSING: Integer; cdecl;
    {class} function _GetERROR_CRYPTO_LIBRARY: Integer; cdecl;
    {class} function _GetERROR_FRAME_TOO_LARGE: Integer; cdecl;
    {class} function _GetERROR_GENERIC_OEM: Integer; cdecl;
    {class} function _GetERROR_GENERIC_PLUGIN: Integer; cdecl;
    {class} function _GetERROR_INIT_DATA: Integer; cdecl;
    {class} function _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer; cdecl;
    {class} function _GetERROR_INSUFFICIENT_SECURITY: Integer; cdecl;
    {class} function _GetERROR_KEY_EXPIRED: Integer; cdecl;
    {class} function _GetERROR_KEY_NOT_LOADED: Integer; cdecl;
    {class} function _GetERROR_LICENSE_PARSE: Integer; cdecl;
    {class} function _GetERROR_LICENSE_POLICY: Integer; cdecl;
    {class} function _GetERROR_LICENSE_RELEASE: Integer; cdecl;
    {class} function _GetERROR_LICENSE_REQUEST_REJECTED: Integer; cdecl;
    {class} function _GetERROR_LICENSE_RESTORE: Integer; cdecl;
    {class} function _GetERROR_LICENSE_STATE: Integer; cdecl;
    {class} function _GetERROR_LOST_STATE: Integer; cdecl;
    {class} function _GetERROR_MEDIA_FRAMEWORK: Integer; cdecl;
    {class} function _GetERROR_NO_KEY: Integer; cdecl;
    {class} function _GetERROR_PROVISIONING_CERTIFICATE: Integer; cdecl;
    {class} function _GetERROR_PROVISIONING_CONFIG: Integer; cdecl;
    {class} function _GetERROR_PROVISIONING_PARSE: Integer; cdecl;
    {class} function _GetERROR_PROVISIONING_REQUEST_REJECTED: Integer; cdecl;
    {class} function _GetERROR_PROVISIONING_RETRY: Integer; cdecl;
    {class} function _GetERROR_RESOURCE_BUSY: Integer; cdecl;
    {class} function _GetERROR_RESOURCE_CONTENTION: Integer; cdecl;
    {class} function _GetERROR_SECURE_STOP_RELEASE: Integer; cdecl;
    {class} function _GetERROR_SESSION_NOT_OPENED: Integer; cdecl;
    {class} function _GetERROR_STORAGE_READ: Integer; cdecl;
    {class} function _GetERROR_STORAGE_WRITE: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetERROR_UNSUPPORTED_OPERATION: Integer; cdecl;
    {class} function _GetERROR_ZERO_SUBSAMPLES: Integer; cdecl;
    {class} property ERROR_CERTIFICATE_MALFORMED: Integer read _GetERROR_CERTIFICATE_MALFORMED;
    {class} property ERROR_CERTIFICATE_MISSING: Integer read _GetERROR_CERTIFICATE_MISSING;
    {class} property ERROR_CRYPTO_LIBRARY: Integer read _GetERROR_CRYPTO_LIBRARY;
    {class} property ERROR_FRAME_TOO_LARGE: Integer read _GetERROR_FRAME_TOO_LARGE;
    {class} property ERROR_GENERIC_OEM: Integer read _GetERROR_GENERIC_OEM;
    {class} property ERROR_GENERIC_PLUGIN: Integer read _GetERROR_GENERIC_PLUGIN;
    {class} property ERROR_INIT_DATA: Integer read _GetERROR_INIT_DATA;
    {class} property ERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer read _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION;
    {class} property ERROR_INSUFFICIENT_SECURITY: Integer read _GetERROR_INSUFFICIENT_SECURITY;
    {class} property ERROR_KEY_EXPIRED: Integer read _GetERROR_KEY_EXPIRED;
    {class} property ERROR_KEY_NOT_LOADED: Integer read _GetERROR_KEY_NOT_LOADED;
    {class} property ERROR_LICENSE_PARSE: Integer read _GetERROR_LICENSE_PARSE;
    {class} property ERROR_LICENSE_POLICY: Integer read _GetERROR_LICENSE_POLICY;
    {class} property ERROR_LICENSE_RELEASE: Integer read _GetERROR_LICENSE_RELEASE;
    {class} property ERROR_LICENSE_REQUEST_REJECTED: Integer read _GetERROR_LICENSE_REQUEST_REJECTED;
    {class} property ERROR_LICENSE_RESTORE: Integer read _GetERROR_LICENSE_RESTORE;
    {class} property ERROR_LICENSE_STATE: Integer read _GetERROR_LICENSE_STATE;
    {class} property ERROR_LOST_STATE: Integer read _GetERROR_LOST_STATE;
    {class} property ERROR_MEDIA_FRAMEWORK: Integer read _GetERROR_MEDIA_FRAMEWORK;
    {class} property ERROR_NO_KEY: Integer read _GetERROR_NO_KEY;
    {class} property ERROR_PROVISIONING_CERTIFICATE: Integer read _GetERROR_PROVISIONING_CERTIFICATE;
    {class} property ERROR_PROVISIONING_CONFIG: Integer read _GetERROR_PROVISIONING_CONFIG;
    {class} property ERROR_PROVISIONING_PARSE: Integer read _GetERROR_PROVISIONING_PARSE;
    {class} property ERROR_PROVISIONING_REQUEST_REJECTED: Integer read _GetERROR_PROVISIONING_REQUEST_REJECTED;
    {class} property ERROR_PROVISIONING_RETRY: Integer read _GetERROR_PROVISIONING_RETRY;
    {class} property ERROR_RESOURCE_BUSY: Integer read _GetERROR_RESOURCE_BUSY;
    {class} property ERROR_RESOURCE_CONTENTION: Integer read _GetERROR_RESOURCE_CONTENTION;
    {class} property ERROR_SECURE_STOP_RELEASE: Integer read _GetERROR_SECURE_STOP_RELEASE;
    {class} property ERROR_SESSION_NOT_OPENED: Integer read _GetERROR_SESSION_NOT_OPENED;
    {class} property ERROR_STORAGE_READ: Integer read _GetERROR_STORAGE_READ;
    {class} property ERROR_STORAGE_WRITE: Integer read _GetERROR_STORAGE_WRITE;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
    {class} property ERROR_UNSUPPORTED_OPERATION: Integer read _GetERROR_UNSUPPORTED_OPERATION;
    {class} property ERROR_ZERO_SUBSAMPLES: Integer read _GetERROR_ZERO_SUBSAMPLES;
  end;

  [JavaSignature('android/media/MediaDrm$ErrorCodes')]
  JMediaDrm_ErrorCodes = interface(JObject)
    ['{4970C1E3-2931-40DE-BA46-FD5D5E94E0DE}']
  end;
  TJMediaDrm_ErrorCodes = class(TJavaGenericImport<JMediaDrm_ErrorCodesClass, JMediaDrm_ErrorCodes>) end;

  JMediaDrm_HdcpLevelClass = interface(JObjectClass)
    ['{9EBE7A50-6AF0-4E67-B1BC-DD9D0FB62B90}']
  end;

  [JavaSignature('android/media/MediaDrm$HdcpLevel')]
  JMediaDrm_HdcpLevel = interface(JObject)
    ['{3B708568-7357-4E4D-AD5D-81775838E289}']
  end;
  TJMediaDrm_HdcpLevel = class(TJavaGenericImport<JMediaDrm_HdcpLevelClass, JMediaDrm_HdcpLevel>) end;

  JMediaDrm_KeyRequestClass = interface(JObjectClass)
    ['{964AE14A-4E26-41DA-A810-ABD922956875}']
    {class} function _GetREQUEST_TYPE_INITIAL: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_NONE: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_RELEASE: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_RENEWAL: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_UPDATE: Integer; cdecl;
    {class} property REQUEST_TYPE_INITIAL: Integer read _GetREQUEST_TYPE_INITIAL;
    {class} property REQUEST_TYPE_NONE: Integer read _GetREQUEST_TYPE_NONE;
    {class} property REQUEST_TYPE_RELEASE: Integer read _GetREQUEST_TYPE_RELEASE;
    {class} property REQUEST_TYPE_RENEWAL: Integer read _GetREQUEST_TYPE_RENEWAL;
    {class} property REQUEST_TYPE_UPDATE: Integer read _GetREQUEST_TYPE_UPDATE;
  end;

  [JavaSignature('android/media/MediaDrm$KeyRequest')]
  JMediaDrm_KeyRequest = interface(JObject)
    ['{D00A9BA0-FA23-413F-A5EB-D8CF720DBFB5}']
    function getData: TJavaArray<Byte>; cdecl;
    function getDefaultUrl: JString; cdecl;
    function getRequestType: Integer; cdecl;
  end;
  TJMediaDrm_KeyRequest = class(TJavaGenericImport<JMediaDrm_KeyRequestClass, JMediaDrm_KeyRequest>) end;

  JMediaDrm_KeyStatusClass = interface(JObjectClass)
    ['{3FF8AC02-0C3A-4628-A9FD-BE28D043700A}']
    {class} function _GetSTATUS_EXPIRED: Integer; cdecl;
    {class} function _GetSTATUS_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetSTATUS_OUTPUT_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetSTATUS_PENDING: Integer; cdecl;
    {class} function _GetSTATUS_USABLE: Integer; cdecl;
    {class} function _GetSTATUS_USABLE_IN_FUTURE: Integer; cdecl;
    {class} property STATUS_EXPIRED: Integer read _GetSTATUS_EXPIRED;
    {class} property STATUS_INTERNAL_ERROR: Integer read _GetSTATUS_INTERNAL_ERROR;
    {class} property STATUS_OUTPUT_NOT_ALLOWED: Integer read _GetSTATUS_OUTPUT_NOT_ALLOWED;
    {class} property STATUS_PENDING: Integer read _GetSTATUS_PENDING;
    {class} property STATUS_USABLE: Integer read _GetSTATUS_USABLE;
    {class} property STATUS_USABLE_IN_FUTURE: Integer read _GetSTATUS_USABLE_IN_FUTURE;
  end;

  [JavaSignature('android/media/MediaDrm$KeyStatus')]
  JMediaDrm_KeyStatus = interface(JObject)
    ['{A2D99787-145F-4464-8F6E-2DEFA69F0DED}']
    function getKeyId: TJavaArray<Byte>; cdecl;
    function getStatusCode: Integer; cdecl;
  end;
  TJMediaDrm_KeyStatus = class(TJavaGenericImport<JMediaDrm_KeyStatusClass, JMediaDrm_KeyStatus>) end;

  JMediaDrm_LogMessageClass = interface(JObjectClass)
    ['{D9C5CFD0-1F3C-4A1A-867C-7DDBB5660FA0}']
  end;

  [JavaSignature('android/media/MediaDrm$LogMessage')]
  JMediaDrm_LogMessage = interface(JObject)
    ['{E57C2253-D158-4984-8F0F-05E068CB5FB4}']
    function getMessage: JString; cdecl;
    function getPriority: Integer; cdecl;
    function getTimestampMillis: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaDrm_LogMessage = class(TJavaGenericImport<JMediaDrm_LogMessageClass, JMediaDrm_LogMessage>) end;

  JMediaDrm_MediaDrmStateExceptionClass = interface(JIllegalStateExceptionClass)
    ['{CD3FEF9C-60BC-4475-B926-D396045CC1A5}']
  end;

  [JavaSignature('android/media/MediaDrm$MediaDrmStateException')]
  JMediaDrm_MediaDrmStateException = interface(JIllegalStateException)
    ['{3664C8EF-AA87-4AED-802E-21D9F86220F4}']
    function getDiagnosticInfo: JString; cdecl;
    function getErrorCode: Integer; cdecl;
    function isTransient: Boolean; cdecl;
  end;
  TJMediaDrm_MediaDrmStateException = class(TJavaGenericImport<JMediaDrm_MediaDrmStateExceptionClass, JMediaDrm_MediaDrmStateException>) end;

  JMediaDrm_MetricsConstantsClass = interface(JObjectClass)
    ['{11E5157A-20D6-4DF3-9C87-D98C3C32EEC5}']
    {class} function _GetCLOSE_SESSION_ERROR_COUNT: JString; cdecl;
    {class} function _GetCLOSE_SESSION_ERROR_LIST: JString; cdecl;
    {class} function _GetCLOSE_SESSION_OK_COUNT: JString; cdecl;
    {class} function _GetEVENT_KEY_EXPIRED_COUNT: JString; cdecl;
    {class} function _GetEVENT_KEY_NEEDED_COUNT: JString; cdecl;
    {class} function _GetEVENT_PROVISION_REQUIRED_COUNT: JString; cdecl;
    {class} function _GetEVENT_SESSION_RECLAIMED_COUNT: JString; cdecl;
    {class} function _GetEVENT_VENDOR_DEFINED_COUNT: JString; cdecl;
    {class} function _GetGET_DEVICE_UNIQUE_ID_ERROR_COUNT: JString; cdecl;
    {class} function _GetGET_DEVICE_UNIQUE_ID_ERROR_LIST: JString; cdecl;
    {class} function _GetGET_DEVICE_UNIQUE_ID_OK_COUNT: JString; cdecl;
    {class} function _GetGET_KEY_REQUEST_ERROR_COUNT: JString; cdecl;
    {class} function _GetGET_KEY_REQUEST_ERROR_LIST: JString; cdecl;
    {class} function _GetGET_KEY_REQUEST_OK_COUNT: JString; cdecl;
    {class} function _GetGET_KEY_REQUEST_OK_TIME_MICROS: JString; cdecl;
    {class} function _GetGET_PROVISION_REQUEST_ERROR_COUNT: JString; cdecl;
    {class} function _GetGET_PROVISION_REQUEST_ERROR_LIST: JString; cdecl;
    {class} function _GetGET_PROVISION_REQUEST_OK_COUNT: JString; cdecl;
    {class} function _GetKEY_STATUS_EXPIRED_COUNT: JString; cdecl;
    {class} function _GetKEY_STATUS_INTERNAL_ERROR_COUNT: JString; cdecl;
    {class} function _GetKEY_STATUS_OUTPUT_NOT_ALLOWED_COUNT: JString; cdecl;
    {class} function _GetKEY_STATUS_PENDING_COUNT: JString; cdecl;
    {class} function _GetKEY_STATUS_USABLE_COUNT: JString; cdecl;
    {class} function _GetOPEN_SESSION_ERROR_COUNT: JString; cdecl;
    {class} function _GetOPEN_SESSION_ERROR_LIST: JString; cdecl;
    {class} function _GetOPEN_SESSION_OK_COUNT: JString; cdecl;
    {class} function _GetPROVIDE_KEY_RESPONSE_ERROR_COUNT: JString; cdecl;
    {class} function _GetPROVIDE_KEY_RESPONSE_ERROR_LIST: JString; cdecl;
    {class} function _GetPROVIDE_KEY_RESPONSE_OK_COUNT: JString; cdecl;
    {class} function _GetPROVIDE_KEY_RESPONSE_OK_TIME_MICROS: JString; cdecl;
    {class} function _GetPROVIDE_PROVISION_RESPONSE_ERROR_COUNT: JString; cdecl;
    {class} function _GetPROVIDE_PROVISION_RESPONSE_ERROR_LIST: JString; cdecl;
    {class} function _GetPROVIDE_PROVISION_RESPONSE_OK_COUNT: JString; cdecl;
    {class} function _GetSESSION_END_TIMES_MS: JString; cdecl;
    {class} function _GetSESSION_START_TIMES_MS: JString; cdecl;
    {class} property CLOSE_SESSION_ERROR_COUNT: JString read _GetCLOSE_SESSION_ERROR_COUNT;
    {class} property CLOSE_SESSION_ERROR_LIST: JString read _GetCLOSE_SESSION_ERROR_LIST;
    {class} property CLOSE_SESSION_OK_COUNT: JString read _GetCLOSE_SESSION_OK_COUNT;
    {class} property EVENT_KEY_EXPIRED_COUNT: JString read _GetEVENT_KEY_EXPIRED_COUNT;
    {class} property EVENT_KEY_NEEDED_COUNT: JString read _GetEVENT_KEY_NEEDED_COUNT;
    {class} property EVENT_PROVISION_REQUIRED_COUNT: JString read _GetEVENT_PROVISION_REQUIRED_COUNT;
    {class} property EVENT_SESSION_RECLAIMED_COUNT: JString read _GetEVENT_SESSION_RECLAIMED_COUNT;
    {class} property EVENT_VENDOR_DEFINED_COUNT: JString read _GetEVENT_VENDOR_DEFINED_COUNT;
    {class} property GET_DEVICE_UNIQUE_ID_ERROR_COUNT: JString read _GetGET_DEVICE_UNIQUE_ID_ERROR_COUNT;
    {class} property GET_DEVICE_UNIQUE_ID_ERROR_LIST: JString read _GetGET_DEVICE_UNIQUE_ID_ERROR_LIST;
    {class} property GET_DEVICE_UNIQUE_ID_OK_COUNT: JString read _GetGET_DEVICE_UNIQUE_ID_OK_COUNT;
    {class} property GET_KEY_REQUEST_ERROR_COUNT: JString read _GetGET_KEY_REQUEST_ERROR_COUNT;
    {class} property GET_KEY_REQUEST_ERROR_LIST: JString read _GetGET_KEY_REQUEST_ERROR_LIST;
    {class} property GET_KEY_REQUEST_OK_COUNT: JString read _GetGET_KEY_REQUEST_OK_COUNT;
    {class} property GET_KEY_REQUEST_OK_TIME_MICROS: JString read _GetGET_KEY_REQUEST_OK_TIME_MICROS;
    {class} property GET_PROVISION_REQUEST_ERROR_COUNT: JString read _GetGET_PROVISION_REQUEST_ERROR_COUNT;
    {class} property GET_PROVISION_REQUEST_ERROR_LIST: JString read _GetGET_PROVISION_REQUEST_ERROR_LIST;
    {class} property GET_PROVISION_REQUEST_OK_COUNT: JString read _GetGET_PROVISION_REQUEST_OK_COUNT;
    {class} property KEY_STATUS_EXPIRED_COUNT: JString read _GetKEY_STATUS_EXPIRED_COUNT;
    {class} property KEY_STATUS_INTERNAL_ERROR_COUNT: JString read _GetKEY_STATUS_INTERNAL_ERROR_COUNT;
    {class} property KEY_STATUS_OUTPUT_NOT_ALLOWED_COUNT: JString read _GetKEY_STATUS_OUTPUT_NOT_ALLOWED_COUNT;
    {class} property KEY_STATUS_PENDING_COUNT: JString read _GetKEY_STATUS_PENDING_COUNT;
    {class} property KEY_STATUS_USABLE_COUNT: JString read _GetKEY_STATUS_USABLE_COUNT;
    {class} property OPEN_SESSION_ERROR_COUNT: JString read _GetOPEN_SESSION_ERROR_COUNT;
    {class} property OPEN_SESSION_ERROR_LIST: JString read _GetOPEN_SESSION_ERROR_LIST;
    {class} property OPEN_SESSION_OK_COUNT: JString read _GetOPEN_SESSION_OK_COUNT;
    {class} property PROVIDE_KEY_RESPONSE_ERROR_COUNT: JString read _GetPROVIDE_KEY_RESPONSE_ERROR_COUNT;
    {class} property PROVIDE_KEY_RESPONSE_ERROR_LIST: JString read _GetPROVIDE_KEY_RESPONSE_ERROR_LIST;
    {class} property PROVIDE_KEY_RESPONSE_OK_COUNT: JString read _GetPROVIDE_KEY_RESPONSE_OK_COUNT;
    {class} property PROVIDE_KEY_RESPONSE_OK_TIME_MICROS: JString read _GetPROVIDE_KEY_RESPONSE_OK_TIME_MICROS;
    {class} property PROVIDE_PROVISION_RESPONSE_ERROR_COUNT: JString read _GetPROVIDE_PROVISION_RESPONSE_ERROR_COUNT;
    {class} property PROVIDE_PROVISION_RESPONSE_ERROR_LIST: JString read _GetPROVIDE_PROVISION_RESPONSE_ERROR_LIST;
    {class} property PROVIDE_PROVISION_RESPONSE_OK_COUNT: JString read _GetPROVIDE_PROVISION_RESPONSE_OK_COUNT;
    {class} property SESSION_END_TIMES_MS: JString read _GetSESSION_END_TIMES_MS;
    {class} property SESSION_START_TIMES_MS: JString read _GetSESSION_START_TIMES_MS;
  end;

  [JavaSignature('android/media/MediaDrm$MetricsConstants')]
  JMediaDrm_MetricsConstants = interface(JObject)
    ['{C91BDAAC-006E-4848-B606-6CB6C963F513}']
  end;
  TJMediaDrm_MetricsConstants = class(TJavaGenericImport<JMediaDrm_MetricsConstantsClass, JMediaDrm_MetricsConstants>) end;

  JMediaDrm_OnEventListenerClass = interface(IJavaClass)
    ['{CF6EE834-C432-4B0D-8ECB-EE4718331C51}']
  end;

  [JavaSignature('android/media/MediaDrm$OnEventListener')]
  JMediaDrm_OnEventListener = interface(IJavaInstance)
    ['{4DB6D7F5-F0FC-418A-AB37-43AA7721ADFF}']
    procedure onEvent(md: JMediaDrm; sessionId: TJavaArray<Byte>; event: Integer; extra: Integer; data: TJavaArray<Byte>); cdecl;
  end;
  TJMediaDrm_OnEventListener = class(TJavaGenericImport<JMediaDrm_OnEventListenerClass, JMediaDrm_OnEventListener>) end;

  JMediaDrm_OnExpirationUpdateListenerClass = interface(IJavaClass)
    ['{D38B58CC-A6CF-4A6C-B5C2-F29285B3C67F}']
  end;

  [JavaSignature('android/media/MediaDrm$OnExpirationUpdateListener')]
  JMediaDrm_OnExpirationUpdateListener = interface(IJavaInstance)
    ['{759CF711-9B4E-4965-8EFF-AF9FB3101231}']
    procedure onExpirationUpdate(md: JMediaDrm; sessionId: TJavaArray<Byte>; expirationTime: Int64); cdecl;
  end;
  TJMediaDrm_OnExpirationUpdateListener = class(TJavaGenericImport<JMediaDrm_OnExpirationUpdateListenerClass, JMediaDrm_OnExpirationUpdateListener>) end;

  JMediaDrm_OnKeyStatusChangeListenerClass = interface(IJavaClass)
    ['{95ED86EB-B775-47E6-8AD2-86796BFF69D2}']
  end;

  [JavaSignature('android/media/MediaDrm$OnKeyStatusChangeListener')]
  JMediaDrm_OnKeyStatusChangeListener = interface(IJavaInstance)
    ['{CA1EB58D-4CCD-4325-976B-242CDFC71ECA}']
    procedure onKeyStatusChange(md: JMediaDrm; sessionId: TJavaArray<Byte>; keyInformation: JList; hasNewUsableKey: Boolean); cdecl;
  end;
  TJMediaDrm_OnKeyStatusChangeListener = class(TJavaGenericImport<JMediaDrm_OnKeyStatusChangeListenerClass, JMediaDrm_OnKeyStatusChangeListener>) end;

  JMediaDrm_OnSessionLostStateListenerClass = interface(IJavaClass)
    ['{44C6F314-4E2F-4FF0-9791-03B50FF9D0AD}']
  end;

  [JavaSignature('android/media/MediaDrm$OnSessionLostStateListener')]
  JMediaDrm_OnSessionLostStateListener = interface(IJavaInstance)
    ['{39E752B7-D344-4C51-843B-8B2216B2DAAF}']
    procedure onSessionLostState(md: JMediaDrm; sessionId: TJavaArray<Byte>); cdecl;
  end;
  TJMediaDrm_OnSessionLostStateListener = class(TJavaGenericImport<JMediaDrm_OnSessionLostStateListenerClass, JMediaDrm_OnSessionLostStateListener>) end;

  JMediaDrm_PlaybackComponentClass = interface(JObjectClass)
    ['{105A76C9-5719-4D5F-8768-754E29D69476}']
  end;

  [JavaSignature('android/media/MediaDrm$PlaybackComponent')]
  JMediaDrm_PlaybackComponent = interface(JObject)
    ['{B51158E8-9C89-477F-AEC0-0F218BD58588}']
    function getLogSessionId: JLogSessionId; cdecl;
    procedure setLogSessionId(logSessionId: JLogSessionId); cdecl;
  end;
  TJMediaDrm_PlaybackComponent = class(TJavaGenericImport<JMediaDrm_PlaybackComponentClass, JMediaDrm_PlaybackComponent>) end;

  JMediaDrm_ProvisionRequestClass = interface(JObjectClass)
    ['{7DC946DD-6DB8-48EC-8EE7-2D000D7A7FA1}']
  end;

  [JavaSignature('android/media/MediaDrm$ProvisionRequest')]
  JMediaDrm_ProvisionRequest = interface(JObject)
    ['{91EB8A7F-9E53-4FDC-8D0C-1C0A62A8B16C}']
    function getData: TJavaArray<Byte>; cdecl;
    function getDefaultUrl: JString; cdecl;
  end;
  TJMediaDrm_ProvisionRequest = class(TJavaGenericImport<JMediaDrm_ProvisionRequestClass, JMediaDrm_ProvisionRequest>) end;

  JMediaDrm_SecurityLevelClass = interface(JObjectClass)
    ['{75B0EA24-423C-4CFA-9574-1304DBEBFD42}']
  end;

  [JavaSignature('android/media/MediaDrm$SecurityLevel')]
  JMediaDrm_SecurityLevel = interface(JObject)
    ['{EBB7A9BC-5E45-442A-9999-3C89B0CE617C}']
  end;
  TJMediaDrm_SecurityLevel = class(TJavaGenericImport<JMediaDrm_SecurityLevelClass, JMediaDrm_SecurityLevel>) end;

  JMediaDrm_SessionExceptionClass = interface(JRuntimeExceptionClass)
    ['{2006EB4D-419E-4116-B713-C7874C461DCB}']
    {class} function _GetERROR_RESOURCE_CONTENTION: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} function init(errorCode: Integer; detailMessage: JString): JMediaDrm_SessionException; cdecl;
    {class} property ERROR_RESOURCE_CONTENTION: Integer read _GetERROR_RESOURCE_CONTENTION;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
  end;

  [JavaSignature('android/media/MediaDrm$SessionException')]
  JMediaDrm_SessionException = interface(JRuntimeException)
    ['{09BDF6F1-7CD5-4CCD-8635-674690EC2344}']
    function getErrorCode: Integer; cdecl;//Deprecated
    function isTransient: Boolean; cdecl;
  end;
  TJMediaDrm_SessionException = class(TJavaGenericImport<JMediaDrm_SessionExceptionClass, JMediaDrm_SessionException>) end;

  JMediaDrmResetExceptionClass = interface(JIllegalStateExceptionClass)
    ['{1C4CB370-BACA-4292-BECE-FA86BE23E196}']
    {class} function init(detailMessage: JString): JMediaDrmResetException; cdecl;
  end;

  [JavaSignature('android/media/MediaDrmResetException')]
  JMediaDrmResetException = interface(JIllegalStateException)
    ['{D65151B3-A20A-4BD6-BD11-AC70FA453291}']
  end;
  TJMediaDrmResetException = class(TJavaGenericImport<JMediaDrmResetExceptionClass, JMediaDrmResetException>) end;

  JMediaExtractorClass = interface(JObjectClass)
    ['{CAAD040F-C796-427A-91E6-29BD622C8972}']
    {class} function _GetSAMPLE_FLAG_ENCRYPTED: Integer; cdecl;
    {class} function _GetSAMPLE_FLAG_PARTIAL_FRAME: Integer; cdecl;
    {class} function _GetSAMPLE_FLAG_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_CLOSEST_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_NEXT_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_PREVIOUS_SYNC: Integer; cdecl;
    {class} function init: JMediaExtractor; cdecl;
    {class} property SAMPLE_FLAG_ENCRYPTED: Integer read _GetSAMPLE_FLAG_ENCRYPTED;
    {class} property SAMPLE_FLAG_PARTIAL_FRAME: Integer read _GetSAMPLE_FLAG_PARTIAL_FRAME;
    {class} property SAMPLE_FLAG_SYNC: Integer read _GetSAMPLE_FLAG_SYNC;
    {class} property SEEK_TO_CLOSEST_SYNC: Integer read _GetSEEK_TO_CLOSEST_SYNC;
    {class} property SEEK_TO_NEXT_SYNC: Integer read _GetSEEK_TO_NEXT_SYNC;
    {class} property SEEK_TO_PREVIOUS_SYNC: Integer read _GetSEEK_TO_PREVIOUS_SYNC;
  end;

  [JavaSignature('android/media/MediaExtractor')]
  JMediaExtractor = interface(JObject)
    ['{0B544D30-92E2-4592-86C8-80CB330796C9}']
    function advance: Boolean; cdecl;
    function getAudioPresentations(trackIndex: Integer): JList; cdecl;
    function getCachedDuration: Int64; cdecl;
    function getCasInfo(index: Integer): JMediaExtractor_CasInfo; cdecl;
    function getDrmInitData: JDrmInitData; cdecl;
    function getLogSessionId: JLogSessionId; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getPsshInfo: JMap; cdecl;
    function getSampleCryptoInfo(info: JMediaCodec_CryptoInfo): Boolean; cdecl;
    function getSampleFlags: Integer; cdecl;
    function getSampleSize: Int64; cdecl;
    function getSampleTime: Int64; cdecl;
    function getSampleTrackIndex: Integer; cdecl;
    function getTrackCount: Integer; cdecl;
    function getTrackFormat(index: Integer): JMediaFormat; cdecl;
    function hasCacheReachedEndOfStream: Boolean; cdecl;
    function readSampleData(byteBuf: JByteBuffer; offset: Integer): Integer; cdecl;
    procedure release; cdecl;
    procedure seekTo(timeUs: Int64; mode: Integer); cdecl;
    procedure selectTrack(index: Integer); cdecl;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(afd: JAssetFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure setLogSessionId(logSessionId: JLogSessionId); cdecl;
    procedure setMediaCas(mediaCas: JMediaCas); cdecl;//Deprecated
    procedure unselectTrack(index: Integer); cdecl;
  end;
  TJMediaExtractor = class(TJavaGenericImport<JMediaExtractorClass, JMediaExtractor>) end;

  JMediaExtractor_CasInfoClass = interface(JObjectClass)
    ['{A8388B8A-3BE6-4E14-8C8C-7983EA4565F9}']
  end;

  [JavaSignature('android/media/MediaExtractor$CasInfo')]
  JMediaExtractor_CasInfo = interface(JObject)
    ['{1B8D57A9-8B8A-4877-91FB-752D364C3267}']
    function getPrivateData: TJavaArray<Byte>; cdecl;
    function getSession: JMediaCas_Session; cdecl;
    function getSystemId: Integer; cdecl;
  end;
  TJMediaExtractor_CasInfo = class(TJavaGenericImport<JMediaExtractor_CasInfoClass, JMediaExtractor_CasInfo>) end;

  JMediaExtractor_MetricsConstantsClass = interface(JObjectClass)
    ['{FFF9470D-24EB-4F24-A306-F82B76FDE98B}']
    {class} function _GetFORMAT: JString; cdecl;
    {class} function _GetMIME_TYPE: JString; cdecl;
    {class} function _GetTRACKS: JString; cdecl;
    {class} property FORMAT: JString read _GetFORMAT;
    {class} property MIME_TYPE: JString read _GetMIME_TYPE;
    {class} property TRACKS: JString read _GetTRACKS;
  end;

  [JavaSignature('android/media/MediaExtractor$MetricsConstants')]
  JMediaExtractor_MetricsConstants = interface(JObject)
    ['{07A7F62B-CB09-438B-9E0B-EEDE568D0201}']
  end;
  TJMediaExtractor_MetricsConstants = class(TJavaGenericImport<JMediaExtractor_MetricsConstantsClass, JMediaExtractor_MetricsConstants>) end;

  JMediaFormatClass = interface(JObjectClass)
    ['{60105A0D-2764-4533-8EF5-DCE2759F23CC}']
    {class} function _GetCOLOR_RANGE_FULL: Integer; cdecl;
    {class} function _GetCOLOR_RANGE_LIMITED: Integer; cdecl;
    {class} function _GetCOLOR_STANDARD_BT2020: Integer; cdecl;
    {class} function _GetCOLOR_STANDARD_BT601_NTSC: Integer; cdecl;
    {class} function _GetCOLOR_STANDARD_BT601_PAL: Integer; cdecl;
    {class} function _GetCOLOR_STANDARD_BT709: Integer; cdecl;
    {class} function _GetCOLOR_TRANSFER_HLG: Integer; cdecl;
    {class} function _GetCOLOR_TRANSFER_LINEAR: Integer; cdecl;
    {class} function _GetCOLOR_TRANSFER_SDR_VIDEO: Integer; cdecl;
    {class} function _GetCOLOR_TRANSFER_ST2084: Integer; cdecl;
    {class} function _GetKEY_AAC_DRC_ALBUM_MODE: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_ATTENUATION_FACTOR: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_BOOST_FACTOR: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_EFFECT_TYPE: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_HEAVY_COMPRESSION: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_OUTPUT_LOUDNESS: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_TARGET_REFERENCE_LEVEL: JString; cdecl;
    {class} function _GetKEY_AAC_ENCODED_TARGET_LEVEL: JString; cdecl;
    {class} function _GetKEY_AAC_MAX_OUTPUT_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_AAC_PROFILE: JString; cdecl;
    {class} function _GetKEY_AAC_SBR_MODE: JString; cdecl;
    {class} function _GetKEY_ALLOW_FRAME_DROP: JString; cdecl;
    {class} function _GetKEY_AUDIO_SESSION_ID: JString; cdecl;
    {class} function _GetKEY_BITRATE_MODE: JString; cdecl;
    {class} function _GetKEY_BIT_RATE: JString; cdecl;
    {class} function _GetKEY_CAPTION_SERVICE_NUMBER: JString; cdecl;
    {class} function _GetKEY_CAPTURE_RATE: JString; cdecl;
    {class} function _GetKEY_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_CHANNEL_MASK: JString; cdecl;
    {class} function _GetKEY_CODECS_STRING: JString; cdecl;
    {class} function _GetKEY_COLOR_FORMAT: JString; cdecl;
    {class} function _GetKEY_COLOR_RANGE: JString; cdecl;
    {class} function _GetKEY_COLOR_STANDARD: JString; cdecl;
    {class} function _GetKEY_COLOR_TRANSFER: JString; cdecl;
    {class} function _GetKEY_COLOR_TRANSFER_REQUEST: JString; cdecl;
    {class} function _GetKEY_COMPLEXITY: JString; cdecl;
    {class} function _GetKEY_CREATE_INPUT_SURFACE_SUSPENDED: JString; cdecl;
    {class} function _GetKEY_CROP_BOTTOM: JString; cdecl;
    {class} function _GetKEY_CROP_LEFT: JString; cdecl;
    {class} function _GetKEY_CROP_RIGHT: JString; cdecl;
    {class} function _GetKEY_CROP_TOP: JString; cdecl;
    {class} function _GetKEY_DURATION: JString; cdecl;
    {class} function _GetKEY_ENCODER_DELAY: JString; cdecl;
    {class} function _GetKEY_ENCODER_PADDING: JString; cdecl;
    {class} function _GetKEY_FLAC_COMPRESSION_LEVEL: JString; cdecl;
    {class} function _GetKEY_FRAME_RATE: JString; cdecl;
    {class} function _GetKEY_GRID_COLUMNS: JString; cdecl;
    {class} function _GetKEY_GRID_ROWS: JString; cdecl;
    {class} function _GetKEY_HAPTIC_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_HARDWARE_AV_SYNC_ID: JString; cdecl;
    {class} function _GetKEY_HDR10_PLUS_INFO: JString; cdecl;
    {class} function _GetKEY_HDR_STATIC_INFO: JString; cdecl;
    {class} function _GetKEY_HEIGHT: JString; cdecl;
    {class} function _GetKEY_INTRA_REFRESH_PERIOD: JString; cdecl;
    {class} function _GetKEY_IS_ADTS: JString; cdecl;
    {class} function _GetKEY_IS_AUTOSELECT: JString; cdecl;
    {class} function _GetKEY_IS_DEFAULT: JString; cdecl;
    {class} function _GetKEY_IS_FORCED_SUBTITLE: JString; cdecl;
    {class} function _GetKEY_I_FRAME_INTERVAL: JString; cdecl;
    {class} function _GetKEY_LANGUAGE: JString; cdecl;
    {class} function _GetKEY_LATENCY: JString; cdecl;
    {class} function _GetKEY_LEVEL: JString; cdecl;
    {class} function _GetKEY_LOW_LATENCY: JString; cdecl;
    {class} function _GetKEY_MAX_B_FRAMES: JString; cdecl;
    {class} function _GetKEY_MAX_FPS_TO_ENCODER: JString; cdecl;
    {class} function _GetKEY_MAX_HEIGHT: JString; cdecl;
    {class} function _GetKEY_MAX_INPUT_SIZE: JString; cdecl;
    {class} function _GetKEY_MAX_OUTPUT_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_MAX_PTS_GAP_TO_ENCODER: JString; cdecl;
    {class} function _GetKEY_MAX_WIDTH: JString; cdecl;
    {class} function _GetKEY_MIME: JString; cdecl;
    {class} function _GetKEY_MPEGH_COMPATIBLE_SETS: JString; cdecl;
    {class} function _GetKEY_MPEGH_PROFILE_LEVEL_INDICATION: JString; cdecl;
    {class} function _GetKEY_MPEGH_REFERENCE_CHANNEL_LAYOUT: JString; cdecl;
    {class} function _GetKEY_OPERATING_RATE: JString; cdecl;
    {class} function _GetKEY_OUTPUT_REORDER_DEPTH: JString; cdecl;
    {class} function _GetKEY_PCM_ENCODING: JString; cdecl;
    {class} function _GetKEY_PICTURE_TYPE: JString; cdecl;
    {class} function _GetKEY_PIXEL_ASPECT_RATIO_HEIGHT: JString; cdecl;
    {class} function _GetKEY_PIXEL_ASPECT_RATIO_WIDTH: JString; cdecl;
    {class} function _GetKEY_PREPEND_HEADER_TO_SYNC_FRAMES: JString; cdecl;
    {class} function _GetKEY_PRIORITY: JString; cdecl;
    {class} function _GetKEY_PROFILE: JString; cdecl;
    {class} function _GetKEY_PUSH_BLANK_BUFFERS_ON_STOP: JString; cdecl;
    {class} function _GetKEY_QUALITY: JString; cdecl;
    {class} function _GetKEY_REPEAT_PREVIOUS_FRAME_AFTER: JString; cdecl;
    {class} function _GetKEY_ROTATION: JString; cdecl;
    {class} function _GetKEY_SAMPLE_RATE: JString; cdecl;
    {class} function _GetKEY_SLICE_HEIGHT: JString; cdecl;
    {class} function _GetKEY_SLOW_MOTION_MARKERS: JString; cdecl;
    {class} function _GetKEY_STRIDE: JString; cdecl;
    {class} function _GetKEY_TEMPORAL_LAYERING: JString; cdecl;
    {class} function _GetKEY_TILE_HEIGHT: JString; cdecl;
    {class} function _GetKEY_TILE_WIDTH: JString; cdecl;
    {class} function _GetKEY_TRACK_ID: JString; cdecl;
    {class} function _GetKEY_VIDEO_ENCODING_STATISTICS_LEVEL: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_AVERAGE: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_B_MAX: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_B_MIN: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_I_MAX: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_I_MIN: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_MAX: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_MIN: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_P_MAX: JString; cdecl;
    {class} function _GetKEY_VIDEO_QP_P_MIN: JString; cdecl;
    {class} function _GetKEY_WIDTH: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC_ELD: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC_HE_V1: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC_HE_V2: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC_LC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC_XHE: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AC3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AC4: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AMR_NB: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AMR_WB: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DOLBY_MAT: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DOLBY_TRUEHD: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DRA: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DTS: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DTS_HD: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_DTS_UHD: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_EAC3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_EAC3_JOC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_FLAC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_G711_ALAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_G711_MLAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_IEC61937: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEG: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_BL_L3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_BL_L4: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_LC_L3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_LC_L4: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_MHA1: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEGH_MHM1: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MSGSM: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_OPUS: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_QCELP: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_RAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_SCRAMBLED: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_VORBIS: JString; cdecl;
    {class} function _GetMIMETYPE_IMAGE_ANDROID_HEIC: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_CEA_608: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_CEA_708: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_SUBRIP: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_VTT: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_AV1: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_AVC: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_DOLBY_VISION: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_H263: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_HEVC: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_MPEG2: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_MPEG4: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_RAW: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_SCRAMBLED: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_VP8: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_VP9: JString; cdecl;
    {class} function _GetPICTURE_TYPE_B: Integer; cdecl;
    {class} function _GetPICTURE_TYPE_I: Integer; cdecl;
    {class} function _GetPICTURE_TYPE_P: Integer; cdecl;
    {class} function _GetPICTURE_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetTYPE_BYTE_BUFFER: Integer; cdecl;
    {class} function _GetTYPE_FLOAT: Integer; cdecl;
    {class} function _GetTYPE_INTEGER: Integer; cdecl;
    {class} function _GetTYPE_LONG: Integer; cdecl;
    {class} function _GetTYPE_NULL: Integer; cdecl;
    {class} function _GetTYPE_STRING: Integer; cdecl;
    {class} function _GetVIDEO_ENCODING_STATISTICS_LEVEL_1: Integer; cdecl;
    {class} function _GetVIDEO_ENCODING_STATISTICS_LEVEL_NONE: Integer; cdecl;
    {class} function init: JMediaFormat; cdecl; overload;
    {class} function init(other: JMediaFormat): JMediaFormat; cdecl; overload;
    {class} function createAudioFormat(mime: JString; sampleRate: Integer; channelCount: Integer): JMediaFormat; cdecl;
    {class} function createSubtitleFormat(mime: JString; language: JString): JMediaFormat; cdecl;
    {class} function createVideoFormat(mime: JString; width: Integer; height: Integer): JMediaFormat; cdecl;
    {class} property COLOR_RANGE_FULL: Integer read _GetCOLOR_RANGE_FULL;
    {class} property COLOR_RANGE_LIMITED: Integer read _GetCOLOR_RANGE_LIMITED;
    {class} property COLOR_STANDARD_BT2020: Integer read _GetCOLOR_STANDARD_BT2020;
    {class} property COLOR_STANDARD_BT601_NTSC: Integer read _GetCOLOR_STANDARD_BT601_NTSC;
    {class} property COLOR_STANDARD_BT601_PAL: Integer read _GetCOLOR_STANDARD_BT601_PAL;
    {class} property COLOR_STANDARD_BT709: Integer read _GetCOLOR_STANDARD_BT709;
    {class} property COLOR_TRANSFER_HLG: Integer read _GetCOLOR_TRANSFER_HLG;
    {class} property COLOR_TRANSFER_LINEAR: Integer read _GetCOLOR_TRANSFER_LINEAR;
    {class} property COLOR_TRANSFER_SDR_VIDEO: Integer read _GetCOLOR_TRANSFER_SDR_VIDEO;
    {class} property COLOR_TRANSFER_ST2084: Integer read _GetCOLOR_TRANSFER_ST2084;
    {class} property KEY_AAC_DRC_ALBUM_MODE: JString read _GetKEY_AAC_DRC_ALBUM_MODE;
    {class} property KEY_AAC_DRC_ATTENUATION_FACTOR: JString read _GetKEY_AAC_DRC_ATTENUATION_FACTOR;
    {class} property KEY_AAC_DRC_BOOST_FACTOR: JString read _GetKEY_AAC_DRC_BOOST_FACTOR;
    {class} property KEY_AAC_DRC_EFFECT_TYPE: JString read _GetKEY_AAC_DRC_EFFECT_TYPE;
    {class} property KEY_AAC_DRC_HEAVY_COMPRESSION: JString read _GetKEY_AAC_DRC_HEAVY_COMPRESSION;
    {class} property KEY_AAC_DRC_OUTPUT_LOUDNESS: JString read _GetKEY_AAC_DRC_OUTPUT_LOUDNESS;
    {class} property KEY_AAC_DRC_TARGET_REFERENCE_LEVEL: JString read _GetKEY_AAC_DRC_TARGET_REFERENCE_LEVEL;
    {class} property KEY_AAC_ENCODED_TARGET_LEVEL: JString read _GetKEY_AAC_ENCODED_TARGET_LEVEL;
    {class} property KEY_AAC_MAX_OUTPUT_CHANNEL_COUNT: JString read _GetKEY_AAC_MAX_OUTPUT_CHANNEL_COUNT;
    {class} property KEY_AAC_PROFILE: JString read _GetKEY_AAC_PROFILE;
    {class} property KEY_AAC_SBR_MODE: JString read _GetKEY_AAC_SBR_MODE;
    {class} property KEY_ALLOW_FRAME_DROP: JString read _GetKEY_ALLOW_FRAME_DROP;
    {class} property KEY_AUDIO_SESSION_ID: JString read _GetKEY_AUDIO_SESSION_ID;
    {class} property KEY_BITRATE_MODE: JString read _GetKEY_BITRATE_MODE;
    {class} property KEY_BIT_RATE: JString read _GetKEY_BIT_RATE;
    {class} property KEY_CAPTION_SERVICE_NUMBER: JString read _GetKEY_CAPTION_SERVICE_NUMBER;
    {class} property KEY_CAPTURE_RATE: JString read _GetKEY_CAPTURE_RATE;
    {class} property KEY_CHANNEL_COUNT: JString read _GetKEY_CHANNEL_COUNT;
    {class} property KEY_CHANNEL_MASK: JString read _GetKEY_CHANNEL_MASK;
    {class} property KEY_CODECS_STRING: JString read _GetKEY_CODECS_STRING;
    {class} property KEY_COLOR_FORMAT: JString read _GetKEY_COLOR_FORMAT;
    {class} property KEY_COLOR_RANGE: JString read _GetKEY_COLOR_RANGE;
    {class} property KEY_COLOR_STANDARD: JString read _GetKEY_COLOR_STANDARD;
    {class} property KEY_COLOR_TRANSFER: JString read _GetKEY_COLOR_TRANSFER;
    {class} property KEY_COLOR_TRANSFER_REQUEST: JString read _GetKEY_COLOR_TRANSFER_REQUEST;
    {class} property KEY_COMPLEXITY: JString read _GetKEY_COMPLEXITY;
    {class} property KEY_CREATE_INPUT_SURFACE_SUSPENDED: JString read _GetKEY_CREATE_INPUT_SURFACE_SUSPENDED;
    {class} property KEY_CROP_BOTTOM: JString read _GetKEY_CROP_BOTTOM;
    {class} property KEY_CROP_LEFT: JString read _GetKEY_CROP_LEFT;
    {class} property KEY_CROP_RIGHT: JString read _GetKEY_CROP_RIGHT;
    {class} property KEY_CROP_TOP: JString read _GetKEY_CROP_TOP;
    {class} property KEY_DURATION: JString read _GetKEY_DURATION;
    {class} property KEY_ENCODER_DELAY: JString read _GetKEY_ENCODER_DELAY;
    {class} property KEY_ENCODER_PADDING: JString read _GetKEY_ENCODER_PADDING;
    {class} property KEY_FLAC_COMPRESSION_LEVEL: JString read _GetKEY_FLAC_COMPRESSION_LEVEL;
    {class} property KEY_FRAME_RATE: JString read _GetKEY_FRAME_RATE;
    {class} property KEY_GRID_COLUMNS: JString read _GetKEY_GRID_COLUMNS;
    {class} property KEY_GRID_ROWS: JString read _GetKEY_GRID_ROWS;
    {class} property KEY_HAPTIC_CHANNEL_COUNT: JString read _GetKEY_HAPTIC_CHANNEL_COUNT;
    {class} property KEY_HARDWARE_AV_SYNC_ID: JString read _GetKEY_HARDWARE_AV_SYNC_ID;
    {class} property KEY_HDR10_PLUS_INFO: JString read _GetKEY_HDR10_PLUS_INFO;
    {class} property KEY_HDR_STATIC_INFO: JString read _GetKEY_HDR_STATIC_INFO;
    {class} property KEY_HEIGHT: JString read _GetKEY_HEIGHT;
    {class} property KEY_INTRA_REFRESH_PERIOD: JString read _GetKEY_INTRA_REFRESH_PERIOD;
    {class} property KEY_IS_ADTS: JString read _GetKEY_IS_ADTS;
    {class} property KEY_IS_AUTOSELECT: JString read _GetKEY_IS_AUTOSELECT;
    {class} property KEY_IS_DEFAULT: JString read _GetKEY_IS_DEFAULT;
    {class} property KEY_IS_FORCED_SUBTITLE: JString read _GetKEY_IS_FORCED_SUBTITLE;
    {class} property KEY_I_FRAME_INTERVAL: JString read _GetKEY_I_FRAME_INTERVAL;
    {class} property KEY_LANGUAGE: JString read _GetKEY_LANGUAGE;
    {class} property KEY_LATENCY: JString read _GetKEY_LATENCY;
    {class} property KEY_LEVEL: JString read _GetKEY_LEVEL;
    {class} property KEY_LOW_LATENCY: JString read _GetKEY_LOW_LATENCY;
    {class} property KEY_MAX_B_FRAMES: JString read _GetKEY_MAX_B_FRAMES;
    {class} property KEY_MAX_FPS_TO_ENCODER: JString read _GetKEY_MAX_FPS_TO_ENCODER;
    {class} property KEY_MAX_HEIGHT: JString read _GetKEY_MAX_HEIGHT;
    {class} property KEY_MAX_INPUT_SIZE: JString read _GetKEY_MAX_INPUT_SIZE;
    {class} property KEY_MAX_OUTPUT_CHANNEL_COUNT: JString read _GetKEY_MAX_OUTPUT_CHANNEL_COUNT;
    {class} property KEY_MAX_PTS_GAP_TO_ENCODER: JString read _GetKEY_MAX_PTS_GAP_TO_ENCODER;
    {class} property KEY_MAX_WIDTH: JString read _GetKEY_MAX_WIDTH;
    {class} property KEY_MIME: JString read _GetKEY_MIME;
    {class} property KEY_MPEGH_COMPATIBLE_SETS: JString read _GetKEY_MPEGH_COMPATIBLE_SETS;
    {class} property KEY_MPEGH_PROFILE_LEVEL_INDICATION: JString read _GetKEY_MPEGH_PROFILE_LEVEL_INDICATION;
    {class} property KEY_MPEGH_REFERENCE_CHANNEL_LAYOUT: JString read _GetKEY_MPEGH_REFERENCE_CHANNEL_LAYOUT;
    {class} property KEY_OPERATING_RATE: JString read _GetKEY_OPERATING_RATE;
    {class} property KEY_OUTPUT_REORDER_DEPTH: JString read _GetKEY_OUTPUT_REORDER_DEPTH;
    {class} property KEY_PCM_ENCODING: JString read _GetKEY_PCM_ENCODING;
    {class} property KEY_PICTURE_TYPE: JString read _GetKEY_PICTURE_TYPE;
    {class} property KEY_PIXEL_ASPECT_RATIO_HEIGHT: JString read _GetKEY_PIXEL_ASPECT_RATIO_HEIGHT;
    {class} property KEY_PIXEL_ASPECT_RATIO_WIDTH: JString read _GetKEY_PIXEL_ASPECT_RATIO_WIDTH;
    {class} property KEY_PREPEND_HEADER_TO_SYNC_FRAMES: JString read _GetKEY_PREPEND_HEADER_TO_SYNC_FRAMES;
    {class} property KEY_PRIORITY: JString read _GetKEY_PRIORITY;
    {class} property KEY_PROFILE: JString read _GetKEY_PROFILE;
    {class} property KEY_PUSH_BLANK_BUFFERS_ON_STOP: JString read _GetKEY_PUSH_BLANK_BUFFERS_ON_STOP;
    {class} property KEY_QUALITY: JString read _GetKEY_QUALITY;
    {class} property KEY_REPEAT_PREVIOUS_FRAME_AFTER: JString read _GetKEY_REPEAT_PREVIOUS_FRAME_AFTER;
    {class} property KEY_ROTATION: JString read _GetKEY_ROTATION;
    {class} property KEY_SAMPLE_RATE: JString read _GetKEY_SAMPLE_RATE;
    {class} property KEY_SLICE_HEIGHT: JString read _GetKEY_SLICE_HEIGHT;
    {class} property KEY_SLOW_MOTION_MARKERS: JString read _GetKEY_SLOW_MOTION_MARKERS;
    {class} property KEY_STRIDE: JString read _GetKEY_STRIDE;
    {class} property KEY_TEMPORAL_LAYERING: JString read _GetKEY_TEMPORAL_LAYERING;
    {class} property KEY_TILE_HEIGHT: JString read _GetKEY_TILE_HEIGHT;
    {class} property KEY_TILE_WIDTH: JString read _GetKEY_TILE_WIDTH;
    {class} property KEY_TRACK_ID: JString read _GetKEY_TRACK_ID;
    {class} property KEY_VIDEO_ENCODING_STATISTICS_LEVEL: JString read _GetKEY_VIDEO_ENCODING_STATISTICS_LEVEL;
    {class} property KEY_VIDEO_QP_AVERAGE: JString read _GetKEY_VIDEO_QP_AVERAGE;
    {class} property KEY_VIDEO_QP_B_MAX: JString read _GetKEY_VIDEO_QP_B_MAX;
    {class} property KEY_VIDEO_QP_B_MIN: JString read _GetKEY_VIDEO_QP_B_MIN;
    {class} property KEY_VIDEO_QP_I_MAX: JString read _GetKEY_VIDEO_QP_I_MAX;
    {class} property KEY_VIDEO_QP_I_MIN: JString read _GetKEY_VIDEO_QP_I_MIN;
    {class} property KEY_VIDEO_QP_MAX: JString read _GetKEY_VIDEO_QP_MAX;
    {class} property KEY_VIDEO_QP_MIN: JString read _GetKEY_VIDEO_QP_MIN;
    {class} property KEY_VIDEO_QP_P_MAX: JString read _GetKEY_VIDEO_QP_P_MAX;
    {class} property KEY_VIDEO_QP_P_MIN: JString read _GetKEY_VIDEO_QP_P_MIN;
    {class} property KEY_WIDTH: JString read _GetKEY_WIDTH;
    {class} property MIMETYPE_AUDIO_AAC: JString read _GetMIMETYPE_AUDIO_AAC;
    {class} property MIMETYPE_AUDIO_AAC_ELD: JString read _GetMIMETYPE_AUDIO_AAC_ELD;
    {class} property MIMETYPE_AUDIO_AAC_HE_V1: JString read _GetMIMETYPE_AUDIO_AAC_HE_V1;
    {class} property MIMETYPE_AUDIO_AAC_HE_V2: JString read _GetMIMETYPE_AUDIO_AAC_HE_V2;
    {class} property MIMETYPE_AUDIO_AAC_LC: JString read _GetMIMETYPE_AUDIO_AAC_LC;
    {class} property MIMETYPE_AUDIO_AAC_XHE: JString read _GetMIMETYPE_AUDIO_AAC_XHE;
    {class} property MIMETYPE_AUDIO_AC3: JString read _GetMIMETYPE_AUDIO_AC3;
    {class} property MIMETYPE_AUDIO_AC4: JString read _GetMIMETYPE_AUDIO_AC4;
    {class} property MIMETYPE_AUDIO_AMR_NB: JString read _GetMIMETYPE_AUDIO_AMR_NB;
    {class} property MIMETYPE_AUDIO_AMR_WB: JString read _GetMIMETYPE_AUDIO_AMR_WB;
    {class} property MIMETYPE_AUDIO_DOLBY_MAT: JString read _GetMIMETYPE_AUDIO_DOLBY_MAT;
    {class} property MIMETYPE_AUDIO_DOLBY_TRUEHD: JString read _GetMIMETYPE_AUDIO_DOLBY_TRUEHD;
    {class} property MIMETYPE_AUDIO_DRA: JString read _GetMIMETYPE_AUDIO_DRA;
    {class} property MIMETYPE_AUDIO_DTS: JString read _GetMIMETYPE_AUDIO_DTS;
    {class} property MIMETYPE_AUDIO_DTS_HD: JString read _GetMIMETYPE_AUDIO_DTS_HD;
    {class} property MIMETYPE_AUDIO_DTS_UHD: JString read _GetMIMETYPE_AUDIO_DTS_UHD;
    {class} property MIMETYPE_AUDIO_EAC3: JString read _GetMIMETYPE_AUDIO_EAC3;
    {class} property MIMETYPE_AUDIO_EAC3_JOC: JString read _GetMIMETYPE_AUDIO_EAC3_JOC;
    {class} property MIMETYPE_AUDIO_FLAC: JString read _GetMIMETYPE_AUDIO_FLAC;
    {class} property MIMETYPE_AUDIO_G711_ALAW: JString read _GetMIMETYPE_AUDIO_G711_ALAW;
    {class} property MIMETYPE_AUDIO_G711_MLAW: JString read _GetMIMETYPE_AUDIO_G711_MLAW;
    {class} property MIMETYPE_AUDIO_IEC61937: JString read _GetMIMETYPE_AUDIO_IEC61937;
    {class} property MIMETYPE_AUDIO_MPEG: JString read _GetMIMETYPE_AUDIO_MPEG;
    {class} property MIMETYPE_AUDIO_MPEGH_BL_L3: JString read _GetMIMETYPE_AUDIO_MPEGH_BL_L3;
    {class} property MIMETYPE_AUDIO_MPEGH_BL_L4: JString read _GetMIMETYPE_AUDIO_MPEGH_BL_L4;
    {class} property MIMETYPE_AUDIO_MPEGH_LC_L3: JString read _GetMIMETYPE_AUDIO_MPEGH_LC_L3;
    {class} property MIMETYPE_AUDIO_MPEGH_LC_L4: JString read _GetMIMETYPE_AUDIO_MPEGH_LC_L4;
    {class} property MIMETYPE_AUDIO_MPEGH_MHA1: JString read _GetMIMETYPE_AUDIO_MPEGH_MHA1;
    {class} property MIMETYPE_AUDIO_MPEGH_MHM1: JString read _GetMIMETYPE_AUDIO_MPEGH_MHM1;
    {class} property MIMETYPE_AUDIO_MSGSM: JString read _GetMIMETYPE_AUDIO_MSGSM;
    {class} property MIMETYPE_AUDIO_OPUS: JString read _GetMIMETYPE_AUDIO_OPUS;
    {class} property MIMETYPE_AUDIO_QCELP: JString read _GetMIMETYPE_AUDIO_QCELP;
    {class} property MIMETYPE_AUDIO_RAW: JString read _GetMIMETYPE_AUDIO_RAW;
    {class} property MIMETYPE_AUDIO_SCRAMBLED: JString read _GetMIMETYPE_AUDIO_SCRAMBLED;
    {class} property MIMETYPE_AUDIO_VORBIS: JString read _GetMIMETYPE_AUDIO_VORBIS;
    {class} property MIMETYPE_IMAGE_ANDROID_HEIC: JString read _GetMIMETYPE_IMAGE_ANDROID_HEIC;
    {class} property MIMETYPE_TEXT_CEA_608: JString read _GetMIMETYPE_TEXT_CEA_608;
    {class} property MIMETYPE_TEXT_CEA_708: JString read _GetMIMETYPE_TEXT_CEA_708;
    {class} property MIMETYPE_TEXT_SUBRIP: JString read _GetMIMETYPE_TEXT_SUBRIP;
    {class} property MIMETYPE_TEXT_VTT: JString read _GetMIMETYPE_TEXT_VTT;
    {class} property MIMETYPE_VIDEO_AV1: JString read _GetMIMETYPE_VIDEO_AV1;
    {class} property MIMETYPE_VIDEO_AVC: JString read _GetMIMETYPE_VIDEO_AVC;
    {class} property MIMETYPE_VIDEO_DOLBY_VISION: JString read _GetMIMETYPE_VIDEO_DOLBY_VISION;
    {class} property MIMETYPE_VIDEO_H263: JString read _GetMIMETYPE_VIDEO_H263;
    {class} property MIMETYPE_VIDEO_HEVC: JString read _GetMIMETYPE_VIDEO_HEVC;
    {class} property MIMETYPE_VIDEO_MPEG2: JString read _GetMIMETYPE_VIDEO_MPEG2;
    {class} property MIMETYPE_VIDEO_MPEG4: JString read _GetMIMETYPE_VIDEO_MPEG4;
    {class} property MIMETYPE_VIDEO_RAW: JString read _GetMIMETYPE_VIDEO_RAW;
    {class} property MIMETYPE_VIDEO_SCRAMBLED: JString read _GetMIMETYPE_VIDEO_SCRAMBLED;
    {class} property MIMETYPE_VIDEO_VP8: JString read _GetMIMETYPE_VIDEO_VP8;
    {class} property MIMETYPE_VIDEO_VP9: JString read _GetMIMETYPE_VIDEO_VP9;
    {class} property PICTURE_TYPE_B: Integer read _GetPICTURE_TYPE_B;
    {class} property PICTURE_TYPE_I: Integer read _GetPICTURE_TYPE_I;
    {class} property PICTURE_TYPE_P: Integer read _GetPICTURE_TYPE_P;
    {class} property PICTURE_TYPE_UNKNOWN: Integer read _GetPICTURE_TYPE_UNKNOWN;
    {class} property TYPE_BYTE_BUFFER: Integer read _GetTYPE_BYTE_BUFFER;
    {class} property TYPE_FLOAT: Integer read _GetTYPE_FLOAT;
    {class} property TYPE_INTEGER: Integer read _GetTYPE_INTEGER;
    {class} property TYPE_LONG: Integer read _GetTYPE_LONG;
    {class} property TYPE_NULL: Integer read _GetTYPE_NULL;
    {class} property TYPE_STRING: Integer read _GetTYPE_STRING;
    {class} property VIDEO_ENCODING_STATISTICS_LEVEL_1: Integer read _GetVIDEO_ENCODING_STATISTICS_LEVEL_1;
    {class} property VIDEO_ENCODING_STATISTICS_LEVEL_NONE: Integer read _GetVIDEO_ENCODING_STATISTICS_LEVEL_NONE;
  end;

  [JavaSignature('android/media/MediaFormat')]
  JMediaFormat = interface(JObject)
    ['{93B4C18E-4FE8-4AA6-9E32-469B5CC4E6DC}']
    function containsFeature(name: JString): Boolean; cdecl;
    function containsKey(name: JString): Boolean; cdecl;
    function getByteBuffer(name: JString): JByteBuffer; cdecl; overload;
    function getByteBuffer(name: JString; defaultValue: JByteBuffer): JByteBuffer; cdecl; overload;
    function getFeatureEnabled(feature: JString): Boolean; cdecl;
    function getFeatures: JSet; cdecl;
    function getFloat(name: JString): Single; cdecl; overload;
    function getFloat(name: JString; defaultValue: Single): Single; cdecl; overload;
    function getInteger(name: JString): Integer; cdecl; overload;
    function getInteger(name: JString; defaultValue: Integer): Integer; cdecl; overload;
    function getKeys: JSet; cdecl;
    function getLong(name: JString): Int64; cdecl; overload;
    function getLong(name: JString; defaultValue: Int64): Int64; cdecl; overload;
    function getNumber(name: JString): JNumber; cdecl; overload;
    function getNumber(name: JString; defaultValue: JNumber): JNumber; cdecl; overload;
    function getString(name: JString): JString; cdecl; overload;
    function getString(name: JString; defaultValue: JString): JString; cdecl; overload;
    function getValueTypeForKey(name: JString): Integer; cdecl;
    procedure removeFeature(name: JString); cdecl;
    procedure removeKey(name: JString); cdecl;
    procedure setByteBuffer(name: JString; bytes: JByteBuffer); cdecl;
    procedure setFeatureEnabled(feature: JString; enabled: Boolean); cdecl;
    procedure setFloat(name: JString; value: Single); cdecl;
    procedure setInteger(name: JString; value: Integer); cdecl;
    procedure setLong(name: JString; value: Int64); cdecl;
    procedure setString(name: JString; value: JString); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaFormat = class(TJavaGenericImport<JMediaFormatClass, JMediaFormat>) end;

  Jmedia_MediaMetadataClass = interface(JObjectClass)
    ['{2204D633-3F5A-49E0-9B8B-877BED88ECE8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ART: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ARTIST: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ART_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_ART: JString; cdecl;
    {class} function _GetMETADATA_KEY_ARTIST: JString; cdecl;
    {class} function _GetMETADATA_KEY_ART_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_AUTHOR: JString; cdecl;
    {class} function _GetMETADATA_KEY_BT_FOLDER_TYPE: JString; cdecl;
    {class} function _GetMETADATA_KEY_COMPILATION: JString; cdecl;
    {class} function _GetMETADATA_KEY_COMPOSER: JString; cdecl;
    {class} function _GetMETADATA_KEY_DATE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISC_NUMBER: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_DESCRIPTION: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_ICON: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_ICON_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_SUBTITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_TITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DURATION: JString; cdecl;
    {class} function _GetMETADATA_KEY_GENRE: JString; cdecl;
    {class} function _GetMETADATA_KEY_MEDIA_ID: JString; cdecl;
    {class} function _GetMETADATA_KEY_MEDIA_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_NUM_TRACKS: JString; cdecl;
    {class} function _GetMETADATA_KEY_RATING: JString; cdecl;
    {class} function _GetMETADATA_KEY_TITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_TRACK_NUMBER: JString; cdecl;
    {class} function _GetMETADATA_KEY_USER_RATING: JString; cdecl;
    {class} function _GetMETADATA_KEY_WRITER: JString; cdecl;
    {class} function _GetMETADATA_KEY_YEAR: JString; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property METADATA_KEY_ALBUM: JString read _GetMETADATA_KEY_ALBUM;
    {class} property METADATA_KEY_ALBUM_ART: JString read _GetMETADATA_KEY_ALBUM_ART;
    {class} property METADATA_KEY_ALBUM_ARTIST: JString read _GetMETADATA_KEY_ALBUM_ARTIST;
    {class} property METADATA_KEY_ALBUM_ART_URI: JString read _GetMETADATA_KEY_ALBUM_ART_URI;
    {class} property METADATA_KEY_ART: JString read _GetMETADATA_KEY_ART;
    {class} property METADATA_KEY_ARTIST: JString read _GetMETADATA_KEY_ARTIST;
    {class} property METADATA_KEY_ART_URI: JString read _GetMETADATA_KEY_ART_URI;
    {class} property METADATA_KEY_AUTHOR: JString read _GetMETADATA_KEY_AUTHOR;
    {class} property METADATA_KEY_BT_FOLDER_TYPE: JString read _GetMETADATA_KEY_BT_FOLDER_TYPE;
    {class} property METADATA_KEY_COMPILATION: JString read _GetMETADATA_KEY_COMPILATION;
    {class} property METADATA_KEY_COMPOSER: JString read _GetMETADATA_KEY_COMPOSER;
    {class} property METADATA_KEY_DATE: JString read _GetMETADATA_KEY_DATE;
    {class} property METADATA_KEY_DISC_NUMBER: JString read _GetMETADATA_KEY_DISC_NUMBER;
    {class} property METADATA_KEY_DISPLAY_DESCRIPTION: JString read _GetMETADATA_KEY_DISPLAY_DESCRIPTION;
    {class} property METADATA_KEY_DISPLAY_ICON: JString read _GetMETADATA_KEY_DISPLAY_ICON;
    {class} property METADATA_KEY_DISPLAY_ICON_URI: JString read _GetMETADATA_KEY_DISPLAY_ICON_URI;
    {class} property METADATA_KEY_DISPLAY_SUBTITLE: JString read _GetMETADATA_KEY_DISPLAY_SUBTITLE;
    {class} property METADATA_KEY_DISPLAY_TITLE: JString read _GetMETADATA_KEY_DISPLAY_TITLE;
    {class} property METADATA_KEY_DURATION: JString read _GetMETADATA_KEY_DURATION;
    {class} property METADATA_KEY_GENRE: JString read _GetMETADATA_KEY_GENRE;
    {class} property METADATA_KEY_MEDIA_ID: JString read _GetMETADATA_KEY_MEDIA_ID;
    {class} property METADATA_KEY_MEDIA_URI: JString read _GetMETADATA_KEY_MEDIA_URI;
    {class} property METADATA_KEY_NUM_TRACKS: JString read _GetMETADATA_KEY_NUM_TRACKS;
    {class} property METADATA_KEY_RATING: JString read _GetMETADATA_KEY_RATING;
    {class} property METADATA_KEY_TITLE: JString read _GetMETADATA_KEY_TITLE;
    {class} property METADATA_KEY_TRACK_NUMBER: JString read _GetMETADATA_KEY_TRACK_NUMBER;
    {class} property METADATA_KEY_USER_RATING: JString read _GetMETADATA_KEY_USER_RATING;
    {class} property METADATA_KEY_WRITER: JString read _GetMETADATA_KEY_WRITER;
    {class} property METADATA_KEY_YEAR: JString read _GetMETADATA_KEY_YEAR;
  end;

  [JavaSignature('android/media/MediaMetadata')]
  Jmedia_MediaMetadata = interface(JObject)
    ['{7FAEFB8D-C99D-459F-8A3C-4476B15DF5DB}']
    function containsKey(key: JString): Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getBitmap(key: JString): JBitmap; cdecl;
    function getBitmapDimensionLimit: Integer; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getLong(key: JString): Int64; cdecl;
    function getRating(key: JString): JRating; cdecl;
    function getString(key: JString): JString; cdecl;
    function getText(key: JString): JCharSequence; cdecl;
    function hashCode: Integer; cdecl;
    function keySet: JSet; cdecl;
    function size: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJmedia_MediaMetadata = class(TJavaGenericImport<Jmedia_MediaMetadataClass, Jmedia_MediaMetadata>) end;

  JMediaMetadata_BuilderClass = interface(JObjectClass)
    ['{B01B3502-75B4-4728-8517-51DBE5BF3877}']
    {class} function init: JMediaMetadata_Builder; cdecl; overload;
    {class} function init(source: Jmedia_MediaMetadata): JMediaMetadata_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/MediaMetadata$Builder')]
  JMediaMetadata_Builder = interface(JObject)
    ['{AED3AB63-592B-4E66-947F-86532D4FAC74}']
    function build: Jmedia_MediaMetadata; cdecl;
    function putBitmap(key: JString; value: JBitmap): JMediaMetadata_Builder; cdecl;
    function putLong(key: JString; value: Int64): JMediaMetadata_Builder; cdecl;
    function putRating(key: JString; value: JRating): JMediaMetadata_Builder; cdecl;
    function putString(key: JString; value: JString): JMediaMetadata_Builder; cdecl;
    function putText(key: JString; value: JCharSequence): JMediaMetadata_Builder; cdecl;
    function setBitmapDimensionLimit(bitmapDimensionLimit: Integer): JMediaMetadata_Builder; cdecl;
  end;
  TJMediaMetadata_Builder = class(TJavaGenericImport<JMediaMetadata_BuilderClass, JMediaMetadata_Builder>) end;

  JMediaMetadataEditorClass = interface(JObjectClass)
    ['{9DAEB2EA-4239-4CD5-94D0-B399E8D41B54}']
    {class} function _GetBITMAP_KEY_ARTWORK: Integer; cdecl;
    {class} function _GetRATING_KEY_BY_OTHERS: Integer; cdecl;
    {class} function _GetRATING_KEY_BY_USER: Integer; cdecl;
    {class} property BITMAP_KEY_ARTWORK: Integer read _GetBITMAP_KEY_ARTWORK;
    {class} property RATING_KEY_BY_OTHERS: Integer read _GetRATING_KEY_BY_OTHERS;
    {class} property RATING_KEY_BY_USER: Integer read _GetRATING_KEY_BY_USER;
  end;

  [JavaSignature('android/media/MediaMetadataEditor')]
  JMediaMetadataEditor = interface(JObject)
    ['{C0B1B71F-FC48-4E17-8B68-19B83612F2B1}']
    procedure addEditableKey(key: Integer); cdecl;
    procedure apply; cdecl;
    procedure clear; cdecl;
    function getBitmap(key: Integer; defaultValue: JBitmap): JBitmap; cdecl;
    function getEditableKeys: TJavaArray<Integer>; cdecl;
    function getLong(key: Integer; defaultValue: Int64): Int64; cdecl;
    function getObject(key: Integer; defaultValue: JObject): JObject; cdecl;
    function getString(key: Integer; defaultValue: JString): JString; cdecl;
    function putBitmap(key: Integer; bitmap: JBitmap): JMediaMetadataEditor; cdecl;
    function putLong(key: Integer; value: Int64): JMediaMetadataEditor; cdecl;
    function putObject(key: Integer; value: JObject): JMediaMetadataEditor; cdecl;
    function putString(key: Integer; value: JString): JMediaMetadataEditor; cdecl;
    procedure removeEditableKeys; cdecl;
  end;
  TJMediaMetadataEditor = class(TJavaGenericImport<JMediaMetadataEditorClass, JMediaMetadataEditor>) end;

  JMediaMetadataRetrieverClass = interface(JObjectClass)
    ['{A5C39E03-F4F3-4A10-B43C-0A01C64CB8A9}']
    {class} function _GetMETADATA_KEY_ALBUM: Integer; cdecl;
    {class} function _GetMETADATA_KEY_ALBUMARTIST: Integer; cdecl;
    {class} function _GetMETADATA_KEY_ARTIST: Integer; cdecl;
    {class} function _GetMETADATA_KEY_AUTHOR: Integer; cdecl;
    {class} function _GetMETADATA_KEY_BITRATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_BITS_PER_SAMPLE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_CAPTURE_FRAMERATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_CD_TRACK_NUMBER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COLOR_RANGE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COLOR_STANDARD: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COLOR_TRANSFER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COMPILATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COMPOSER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DISC_NUMBER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DURATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_EXIF_LENGTH: Integer; cdecl;
    {class} function _GetMETADATA_KEY_EXIF_OFFSET: Integer; cdecl;
    {class} function _GetMETADATA_KEY_GENRE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_HAS_AUDIO: Integer; cdecl;
    {class} function _GetMETADATA_KEY_HAS_IMAGE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_HAS_VIDEO: Integer; cdecl;
    {class} function _GetMETADATA_KEY_IMAGE_COUNT: Integer; cdecl;
    {class} function _GetMETADATA_KEY_IMAGE_HEIGHT: Integer; cdecl;
    {class} function _GetMETADATA_KEY_IMAGE_PRIMARY: Integer; cdecl;
    {class} function _GetMETADATA_KEY_IMAGE_ROTATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_IMAGE_WIDTH: Integer; cdecl;
    {class} function _GetMETADATA_KEY_LOCATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_MIMETYPE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_NUM_TRACKS: Integer; cdecl;
    {class} function _GetMETADATA_KEY_SAMPLERATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_TITLE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_FRAME_COUNT: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_HEIGHT: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_ROTATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_WIDTH: Integer; cdecl;
    {class} function _GetMETADATA_KEY_WRITER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_XMP_LENGTH: Integer; cdecl;
    {class} function _GetMETADATA_KEY_XMP_OFFSET: Integer; cdecl;
    {class} function _GetMETADATA_KEY_YEAR: Integer; cdecl;
    {class} function _GetOPTION_CLOSEST: Integer; cdecl;
    {class} function _GetOPTION_CLOSEST_SYNC: Integer; cdecl;
    {class} function _GetOPTION_NEXT_SYNC: Integer; cdecl;
    {class} function _GetOPTION_PREVIOUS_SYNC: Integer; cdecl;
    {class} function init: JMediaMetadataRetriever; cdecl;
    {class} property METADATA_KEY_ALBUM: Integer read _GetMETADATA_KEY_ALBUM;
    {class} property METADATA_KEY_ALBUMARTIST: Integer read _GetMETADATA_KEY_ALBUMARTIST;
    {class} property METADATA_KEY_ARTIST: Integer read _GetMETADATA_KEY_ARTIST;
    {class} property METADATA_KEY_AUTHOR: Integer read _GetMETADATA_KEY_AUTHOR;
    {class} property METADATA_KEY_BITRATE: Integer read _GetMETADATA_KEY_BITRATE;
    {class} property METADATA_KEY_BITS_PER_SAMPLE: Integer read _GetMETADATA_KEY_BITS_PER_SAMPLE;
    {class} property METADATA_KEY_CAPTURE_FRAMERATE: Integer read _GetMETADATA_KEY_CAPTURE_FRAMERATE;
    {class} property METADATA_KEY_CD_TRACK_NUMBER: Integer read _GetMETADATA_KEY_CD_TRACK_NUMBER;
    {class} property METADATA_KEY_COLOR_RANGE: Integer read _GetMETADATA_KEY_COLOR_RANGE;
    {class} property METADATA_KEY_COLOR_STANDARD: Integer read _GetMETADATA_KEY_COLOR_STANDARD;
    {class} property METADATA_KEY_COLOR_TRANSFER: Integer read _GetMETADATA_KEY_COLOR_TRANSFER;
    {class} property METADATA_KEY_COMPILATION: Integer read _GetMETADATA_KEY_COMPILATION;
    {class} property METADATA_KEY_COMPOSER: Integer read _GetMETADATA_KEY_COMPOSER;
    {class} property METADATA_KEY_DATE: Integer read _GetMETADATA_KEY_DATE;
    {class} property METADATA_KEY_DISC_NUMBER: Integer read _GetMETADATA_KEY_DISC_NUMBER;
    {class} property METADATA_KEY_DURATION: Integer read _GetMETADATA_KEY_DURATION;
    {class} property METADATA_KEY_EXIF_LENGTH: Integer read _GetMETADATA_KEY_EXIF_LENGTH;
    {class} property METADATA_KEY_EXIF_OFFSET: Integer read _GetMETADATA_KEY_EXIF_OFFSET;
    {class} property METADATA_KEY_GENRE: Integer read _GetMETADATA_KEY_GENRE;
    {class} property METADATA_KEY_HAS_AUDIO: Integer read _GetMETADATA_KEY_HAS_AUDIO;
    {class} property METADATA_KEY_HAS_IMAGE: Integer read _GetMETADATA_KEY_HAS_IMAGE;
    {class} property METADATA_KEY_HAS_VIDEO: Integer read _GetMETADATA_KEY_HAS_VIDEO;
    {class} property METADATA_KEY_IMAGE_COUNT: Integer read _GetMETADATA_KEY_IMAGE_COUNT;
    {class} property METADATA_KEY_IMAGE_HEIGHT: Integer read _GetMETADATA_KEY_IMAGE_HEIGHT;
    {class} property METADATA_KEY_IMAGE_PRIMARY: Integer read _GetMETADATA_KEY_IMAGE_PRIMARY;
    {class} property METADATA_KEY_IMAGE_ROTATION: Integer read _GetMETADATA_KEY_IMAGE_ROTATION;
    {class} property METADATA_KEY_IMAGE_WIDTH: Integer read _GetMETADATA_KEY_IMAGE_WIDTH;
    {class} property METADATA_KEY_LOCATION: Integer read _GetMETADATA_KEY_LOCATION;
    {class} property METADATA_KEY_MIMETYPE: Integer read _GetMETADATA_KEY_MIMETYPE;
    {class} property METADATA_KEY_NUM_TRACKS: Integer read _GetMETADATA_KEY_NUM_TRACKS;
    {class} property METADATA_KEY_SAMPLERATE: Integer read _GetMETADATA_KEY_SAMPLERATE;
    {class} property METADATA_KEY_TITLE: Integer read _GetMETADATA_KEY_TITLE;
    {class} property METADATA_KEY_VIDEO_FRAME_COUNT: Integer read _GetMETADATA_KEY_VIDEO_FRAME_COUNT;
    {class} property METADATA_KEY_VIDEO_HEIGHT: Integer read _GetMETADATA_KEY_VIDEO_HEIGHT;
    {class} property METADATA_KEY_VIDEO_ROTATION: Integer read _GetMETADATA_KEY_VIDEO_ROTATION;
    {class} property METADATA_KEY_VIDEO_WIDTH: Integer read _GetMETADATA_KEY_VIDEO_WIDTH;
    {class} property METADATA_KEY_WRITER: Integer read _GetMETADATA_KEY_WRITER;
    {class} property METADATA_KEY_XMP_LENGTH: Integer read _GetMETADATA_KEY_XMP_LENGTH;
    {class} property METADATA_KEY_XMP_OFFSET: Integer read _GetMETADATA_KEY_XMP_OFFSET;
    {class} property METADATA_KEY_YEAR: Integer read _GetMETADATA_KEY_YEAR;
    {class} property OPTION_CLOSEST: Integer read _GetOPTION_CLOSEST;
    {class} property OPTION_CLOSEST_SYNC: Integer read _GetOPTION_CLOSEST_SYNC;
    {class} property OPTION_NEXT_SYNC: Integer read _GetOPTION_NEXT_SYNC;
    {class} property OPTION_PREVIOUS_SYNC: Integer read _GetOPTION_PREVIOUS_SYNC;
  end;

  [JavaSignature('android/media/MediaMetadataRetriever')]
  JMediaMetadataRetriever = interface(JObject)
    ['{FE494ED1-BDE3-4DC1-BB24-35F061DE55DC}']
    procedure close; cdecl;
    function extractMetadata(keyCode: Integer): JString; cdecl;
    function getEmbeddedPicture: TJavaArray<Byte>; cdecl;
    function getFrameAtIndex(frameIndex: Integer; params: JMediaMetadataRetriever_BitmapParams): JBitmap; cdecl; overload;
    function getFrameAtIndex(frameIndex: Integer): JBitmap; cdecl; overload;
    function getFrameAtTime(timeUs: Int64; option: Integer): JBitmap; cdecl; overload;
    function getFrameAtTime(timeUs: Int64; option: Integer; params: JMediaMetadataRetriever_BitmapParams): JBitmap; cdecl; overload;
    function getFrameAtTime(timeUs: Int64): JBitmap; cdecl; overload;
    function getFrameAtTime: JBitmap; cdecl; overload;
    function getFramesAtIndex(frameIndex: Integer; numFrames: Integer; params: JMediaMetadataRetriever_BitmapParams): JList; cdecl; overload;
    function getFramesAtIndex(frameIndex: Integer; numFrames: Integer): JList; cdecl; overload;
    function getImageAtIndex(imageIndex: Integer; params: JMediaMetadataRetriever_BitmapParams): JBitmap; cdecl; overload;
    function getImageAtIndex(imageIndex: Integer): JBitmap; cdecl; overload;
    function getPrimaryImage(params: JMediaMetadataRetriever_BitmapParams): JBitmap; cdecl; overload;
    function getPrimaryImage: JBitmap; cdecl; overload;
    function getScaledFrameAtTime(timeUs: Int64; option: Integer; dstWidth: Integer; dstHeight: Integer): JBitmap; cdecl; overload;
    function getScaledFrameAtTime(timeUs: Int64; option: Integer; dstWidth: Integer; dstHeight: Integer; params: JMediaMetadataRetriever_BitmapParams): JBitmap; cdecl; overload;
    procedure release; cdecl;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(uri: JString; headers: JMap); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri); cdecl; overload;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
  end;
  TJMediaMetadataRetriever = class(TJavaGenericImport<JMediaMetadataRetrieverClass, JMediaMetadataRetriever>) end;

  JMediaMetadataRetriever_BitmapParamsClass = interface(JObjectClass)
    ['{19B67F3D-6F39-4AB0-A2CE-452EB5235B6E}']
    {class} function init: JMediaMetadataRetriever_BitmapParams; cdecl;
  end;

  [JavaSignature('android/media/MediaMetadataRetriever$BitmapParams')]
  JMediaMetadataRetriever_BitmapParams = interface(JObject)
    ['{E4025750-3372-4E92-AD39-13DEFE6DDD2F}']
    function getActualConfig: JBitmap_Config; cdecl;
    function getPreferredConfig: JBitmap_Config; cdecl;
    procedure setPreferredConfig(config: JBitmap_Config); cdecl;
  end;
  TJMediaMetadataRetriever_BitmapParams = class(TJavaGenericImport<JMediaMetadataRetriever_BitmapParamsClass, JMediaMetadataRetriever_BitmapParams>) end;

  JMediaMuxerClass = interface(JObjectClass)
    ['{2D17D70B-C9D2-4B57-87FA-0D726CEC9078}']
    {class} function init(path: JString; format: Integer): JMediaMuxer; cdecl; overload;
    {class} function init(fd: JFileDescriptor; format: Integer): JMediaMuxer; cdecl; overload;
  end;

  [JavaSignature('android/media/MediaMuxer')]
  JMediaMuxer = interface(JObject)
    ['{CD2A8ED6-F79C-46C9-AF4C-5FCACFE8CB9E}']
    function addTrack(format: JMediaFormat): Integer; cdecl;
    procedure release; cdecl;
    procedure setLocation(latitude: Single; longitude: Single); cdecl;
    procedure setOrientationHint(degrees: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure writeSampleData(trackIndex: Integer; byteBuf: JByteBuffer; bufferInfo: JMediaCodec_BufferInfo); cdecl;
  end;
  TJMediaMuxer = class(TJavaGenericImport<JMediaMuxerClass, JMediaMuxer>) end;

  JMediaMuxer_OutputFormatClass = interface(JObjectClass)
    ['{F6EB670C-37E3-4066-9F7A-290A3D6AD905}']
    {class} function _GetMUXER_OUTPUT_3GPP: Integer; cdecl;
    {class} function _GetMUXER_OUTPUT_HEIF: Integer; cdecl;
    {class} function _GetMUXER_OUTPUT_MPEG_4: Integer; cdecl;
    {class} function _GetMUXER_OUTPUT_OGG: Integer; cdecl;
    {class} function _GetMUXER_OUTPUT_WEBM: Integer; cdecl;
    {class} property MUXER_OUTPUT_3GPP: Integer read _GetMUXER_OUTPUT_3GPP;
    {class} property MUXER_OUTPUT_HEIF: Integer read _GetMUXER_OUTPUT_HEIF;
    {class} property MUXER_OUTPUT_MPEG_4: Integer read _GetMUXER_OUTPUT_MPEG_4;
    {class} property MUXER_OUTPUT_OGG: Integer read _GetMUXER_OUTPUT_OGG;
    {class} property MUXER_OUTPUT_WEBM: Integer read _GetMUXER_OUTPUT_WEBM;
  end;

  [JavaSignature('android/media/MediaMuxer$OutputFormat')]
  JMediaMuxer_OutputFormat = interface(JObject)
    ['{40A3AF3E-CAA5-4779-B297-9EB9F25EF337}']
  end;
  TJMediaMuxer_OutputFormat = class(TJavaGenericImport<JMediaMuxer_OutputFormatClass, JMediaMuxer_OutputFormat>) end;

  JMediaPlayerClass = interface(JObjectClass)
    ['{5C9CABE2-E9F5-4990-8E18-6D0BB6C469FB}']
    {class} function _GetMEDIA_ERROR_IO: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_MALFORMED: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_SERVER_DIED: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_TIMED_OUT: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_UNSUPPORTED: Integer; cdecl;
    {class} function _GetMEDIA_INFO_AUDIO_NOT_PLAYING: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BAD_INTERLEAVING: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BUFFERING_END: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BUFFERING_START: Integer; cdecl;
    {class} function _GetMEDIA_INFO_METADATA_UPDATE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_NOT_SEEKABLE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_STARTED_AS_NEXT: Integer; cdecl;
    {class} function _GetMEDIA_INFO_SUBTITLE_TIMED_OUT: Integer; cdecl;
    {class} function _GetMEDIA_INFO_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_INFO_UNSUPPORTED_SUBTITLE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_VIDEO_NOT_PLAYING: Integer; cdecl;
    {class} function _GetMEDIA_INFO_VIDEO_RENDERING_START: Integer; cdecl;
    {class} function _GetMEDIA_INFO_VIDEO_TRACK_LAGGING: Integer; cdecl;
    {class} function _GetMEDIA_MIMETYPE_TEXT_SUBRIP: JString; cdecl;
    {class} function _GetPREPARE_DRM_STATUS_PREPARATION_ERROR: Integer; cdecl;
    {class} function _GetPREPARE_DRM_STATUS_PROVISIONING_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetPREPARE_DRM_STATUS_PROVISIONING_SERVER_ERROR: Integer; cdecl;
    {class} function _GetPREPARE_DRM_STATUS_SUCCESS: Integer; cdecl;
    {class} function _GetSEEK_CLOSEST: Integer; cdecl;
    {class} function _GetSEEK_CLOSEST_SYNC: Integer; cdecl;
    {class} function _GetSEEK_NEXT_SYNC: Integer; cdecl;
    {class} function _GetSEEK_PREVIOUS_SYNC: Integer; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT: Integer; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer; cdecl;
    {class} function init: JMediaPlayer; cdecl;
    {class} function create(context: JContext; uri: Jnet_Uri): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; uri: Jnet_Uri; holder: JSurfaceHolder): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; uri: Jnet_Uri; holder: JSurfaceHolder; audioAttributes: JAudioAttributes; audioSessionId: Integer): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; resid: Integer): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; resid: Integer; audioAttributes: JAudioAttributes; audioSessionId: Integer): JMediaPlayer; cdecl; overload;
    {class} property MEDIA_ERROR_IO: Integer read _GetMEDIA_ERROR_IO;
    {class} property MEDIA_ERROR_MALFORMED: Integer read _GetMEDIA_ERROR_MALFORMED;
    {class} property MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK: Integer read _GetMEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK;
    {class} property MEDIA_ERROR_SERVER_DIED: Integer read _GetMEDIA_ERROR_SERVER_DIED;
    {class} property MEDIA_ERROR_TIMED_OUT: Integer read _GetMEDIA_ERROR_TIMED_OUT;
    {class} property MEDIA_ERROR_UNKNOWN: Integer read _GetMEDIA_ERROR_UNKNOWN;
    {class} property MEDIA_ERROR_UNSUPPORTED: Integer read _GetMEDIA_ERROR_UNSUPPORTED;
    {class} property MEDIA_INFO_AUDIO_NOT_PLAYING: Integer read _GetMEDIA_INFO_AUDIO_NOT_PLAYING;
    {class} property MEDIA_INFO_BAD_INTERLEAVING: Integer read _GetMEDIA_INFO_BAD_INTERLEAVING;
    {class} property MEDIA_INFO_BUFFERING_END: Integer read _GetMEDIA_INFO_BUFFERING_END;
    {class} property MEDIA_INFO_BUFFERING_START: Integer read _GetMEDIA_INFO_BUFFERING_START;
    {class} property MEDIA_INFO_METADATA_UPDATE: Integer read _GetMEDIA_INFO_METADATA_UPDATE;
    {class} property MEDIA_INFO_NOT_SEEKABLE: Integer read _GetMEDIA_INFO_NOT_SEEKABLE;
    {class} property MEDIA_INFO_STARTED_AS_NEXT: Integer read _GetMEDIA_INFO_STARTED_AS_NEXT;
    {class} property MEDIA_INFO_SUBTITLE_TIMED_OUT: Integer read _GetMEDIA_INFO_SUBTITLE_TIMED_OUT;
    {class} property MEDIA_INFO_UNKNOWN: Integer read _GetMEDIA_INFO_UNKNOWN;
    {class} property MEDIA_INFO_UNSUPPORTED_SUBTITLE: Integer read _GetMEDIA_INFO_UNSUPPORTED_SUBTITLE;
    {class} property MEDIA_INFO_VIDEO_NOT_PLAYING: Integer read _GetMEDIA_INFO_VIDEO_NOT_PLAYING;
    {class} property MEDIA_INFO_VIDEO_RENDERING_START: Integer read _GetMEDIA_INFO_VIDEO_RENDERING_START;
    {class} property MEDIA_INFO_VIDEO_TRACK_LAGGING: Integer read _GetMEDIA_INFO_VIDEO_TRACK_LAGGING;
    {class} property MEDIA_MIMETYPE_TEXT_SUBRIP: JString read _GetMEDIA_MIMETYPE_TEXT_SUBRIP;
    {class} property PREPARE_DRM_STATUS_PREPARATION_ERROR: Integer read _GetPREPARE_DRM_STATUS_PREPARATION_ERROR;
    {class} property PREPARE_DRM_STATUS_PROVISIONING_NETWORK_ERROR: Integer read _GetPREPARE_DRM_STATUS_PROVISIONING_NETWORK_ERROR;
    {class} property PREPARE_DRM_STATUS_PROVISIONING_SERVER_ERROR: Integer read _GetPREPARE_DRM_STATUS_PROVISIONING_SERVER_ERROR;
    {class} property PREPARE_DRM_STATUS_SUCCESS: Integer read _GetPREPARE_DRM_STATUS_SUCCESS;
    {class} property SEEK_CLOSEST: Integer read _GetSEEK_CLOSEST;
    {class} property SEEK_CLOSEST_SYNC: Integer read _GetSEEK_CLOSEST_SYNC;
    {class} property SEEK_NEXT_SYNC: Integer read _GetSEEK_NEXT_SYNC;
    {class} property SEEK_PREVIOUS_SYNC: Integer read _GetSEEK_PREVIOUS_SYNC;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING;
  end;

  [JavaSignature('android/media/MediaPlayer')]
  JMediaPlayer = interface(JObject)
    ['{BC844B6F-92C1-4D1D-93C5-E9B18351F502}']
    procedure addOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener; handler: JHandler); cdecl;
    procedure addTimedTextSource(path: JString; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(context: JContext; uri: Jnet_Uri; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(fd: JFileDescriptor; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(fd: JFileDescriptor; offset: Int64; length: Int64; mime: JString); cdecl; overload;
    procedure attachAuxEffect(effectId: Integer); cdecl;
    procedure clearOnMediaTimeDiscontinuityListener; cdecl;
    procedure clearOnSubtitleDataListener; cdecl;
    function createVolumeShaper(configuration: JVolumeShaper_Configuration): JVolumeShaper; cdecl;
    procedure deselectTrack(index: Integer); cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getCurrentPosition: Integer; cdecl;
    function getDrmInfo: JMediaPlayer_DrmInfo; cdecl;
    function getDrmPropertyString(propertyName: JString): JString; cdecl;
    function getDuration: Integer; cdecl;
    function getKeyRequest(keySetId: TJavaArray<Byte>; initData: TJavaArray<Byte>; mimeType: JString; keyType: Integer; optionalParameters: JMap): JMediaDrm_KeyRequest; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSelectedTrack(trackType: Integer): Integer; cdecl;
    function getSyncParams: JSyncParams; cdecl;
    function getTimestamp: JMediaTimestamp; cdecl;
    function getTrackInfo: TJavaObjectArray<JMediaPlayer_TrackInfo>; cdecl;
    function getVideoHeight: Integer; cdecl;
    function getVideoWidth: Integer; cdecl;
    function isLooping: Boolean; cdecl;
    function isPlaying: Boolean; cdecl;
    procedure pause; cdecl;
    procedure prepare; cdecl;
    procedure prepareAsync; cdecl;
    procedure prepareDrm(uuid: JUUID); cdecl;
    function provideKeyResponse(keySetId: TJavaArray<Byte>; response: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    procedure release; cdecl;
    procedure releaseDrm; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener); cdecl;
    procedure reset; cdecl;
    procedure restoreKeys(keySetId: TJavaArray<Byte>); cdecl;
    procedure seekTo(msec: Int64; mode: Integer); cdecl; overload;
    procedure seekTo(msec: Integer); cdecl; overload;
    procedure selectTrack(index: Integer); cdecl;
    procedure setAudioAttributes(attributes: JAudioAttributes); cdecl;
    procedure setAudioSessionId(sessionId: Integer); cdecl;
    procedure setAudioStreamType(streamtype: Integer); cdecl;//Deprecated
    procedure setAuxEffectSendLevel(level: Single); cdecl;
    procedure setDataSource(context: JContext; uri: Jnet_Uri); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri; headers: JMap; cookies: JList); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(afd: JAssetFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
    procedure setDisplay(sh: JSurfaceHolder); cdecl;
    procedure setDrmPropertyString(propertyName: JString; value: JString); cdecl;
    procedure setLooping(looping: Boolean); cdecl;
    procedure setNextMediaPlayer(next: JMediaPlayer); cdecl;
    procedure setOnBufferingUpdateListener(listener: JMediaPlayer_OnBufferingUpdateListener); cdecl;
    procedure setOnCompletionListener(listener: JMediaPlayer_OnCompletionListener); cdecl;
    procedure setOnDrmConfigHelper(listener: JMediaPlayer_OnDrmConfigHelper); cdecl;
    procedure setOnDrmInfoListener(listener: JMediaPlayer_OnDrmInfoListener); cdecl; overload;
    procedure setOnDrmInfoListener(listener: JMediaPlayer_OnDrmInfoListener; handler: JHandler); cdecl; overload;
    procedure setOnDrmPreparedListener(listener: JMediaPlayer_OnDrmPreparedListener); cdecl; overload;
    procedure setOnDrmPreparedListener(listener: JMediaPlayer_OnDrmPreparedListener; handler: JHandler); cdecl; overload;
    procedure setOnErrorListener(listener: JMediaPlayer_OnErrorListener); cdecl;
    procedure setOnInfoListener(listener: JMediaPlayer_OnInfoListener); cdecl;
    procedure setOnMediaTimeDiscontinuityListener(listener: JMediaPlayer_OnMediaTimeDiscontinuityListener; handler: JHandler); cdecl; overload;
    procedure setOnMediaTimeDiscontinuityListener(listener: JMediaPlayer_OnMediaTimeDiscontinuityListener); cdecl; overload;
    procedure setOnPreparedListener(listener: JMediaPlayer_OnPreparedListener); cdecl;
    procedure setOnSeekCompleteListener(listener: JMediaPlayer_OnSeekCompleteListener); cdecl;
    procedure setOnSubtitleDataListener(listener: JMediaPlayer_OnSubtitleDataListener; handler: JHandler); cdecl; overload;
    procedure setOnSubtitleDataListener(listener: JMediaPlayer_OnSubtitleDataListener); cdecl; overload;
    procedure setOnTimedMetaDataAvailableListener(listener: JMediaPlayer_OnTimedMetaDataAvailableListener); cdecl;
    procedure setOnTimedTextListener(listener: JMediaPlayer_OnTimedTextListener); cdecl;
    procedure setOnVideoSizeChangedListener(listener: JMediaPlayer_OnVideoSizeChangedListener); cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    procedure setScreenOnWhilePlaying(screenOn: Boolean); cdecl;
    procedure setSurface(surface: JSurface); cdecl;
    procedure setSyncParams(params: JSyncParams); cdecl;
    procedure setVideoScalingMode(mode: Integer); cdecl;
    procedure setVolume(leftVolume: Single; rightVolume: Single); cdecl;
    procedure setWakeMode(context: JContext; mode: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
  end;
  TJMediaPlayer = class(TJavaGenericImport<JMediaPlayerClass, JMediaPlayer>) end;

  JMediaPlayer_DrmInfoClass = interface(JObjectClass)
    ['{066DE5C7-D87A-417A-A918-B6B5F3C9C033}']
  end;

  [JavaSignature('android/media/MediaPlayer$DrmInfo')]
  JMediaPlayer_DrmInfo = interface(JObject)
    ['{AEF285BB-BD83-479D-BD0F-F017ADF72B87}']
    function getPssh: JMap; cdecl;
    function getSupportedSchemes: TJavaObjectArray<JUUID>; cdecl;
  end;
  TJMediaPlayer_DrmInfo = class(TJavaGenericImport<JMediaPlayer_DrmInfoClass, JMediaPlayer_DrmInfo>) end;

  JMediaPlayer_MetricsConstantsClass = interface(JObjectClass)
    ['{BA584A13-24D1-459A-AA5A-6F56D4D97A01}']
    {class} function _GetCODEC_AUDIO: JString; cdecl;
    {class} function _GetCODEC_VIDEO: JString; cdecl;
    {class} function _GetDURATION: JString; cdecl;
    {class} function _GetERRORS: JString; cdecl;
    {class} function _GetERROR_CODE: JString; cdecl;
    {class} function _GetFRAMES: JString; cdecl;
    {class} function _GetFRAMES_DROPPED: JString; cdecl;
    {class} function _GetHEIGHT: JString; cdecl;
    {class} function _GetMIME_TYPE_AUDIO: JString; cdecl;
    {class} function _GetMIME_TYPE_VIDEO: JString; cdecl;
    {class} function _GetPLAYING: JString; cdecl;
    {class} function _GetWIDTH: JString; cdecl;
    {class} property CODEC_AUDIO: JString read _GetCODEC_AUDIO;
    {class} property CODEC_VIDEO: JString read _GetCODEC_VIDEO;
    {class} property DURATION: JString read _GetDURATION;
    {class} property ERRORS: JString read _GetERRORS;
    {class} property ERROR_CODE: JString read _GetERROR_CODE;
    {class} property FRAMES: JString read _GetFRAMES;
    {class} property FRAMES_DROPPED: JString read _GetFRAMES_DROPPED;
    {class} property HEIGHT: JString read _GetHEIGHT;
    {class} property MIME_TYPE_AUDIO: JString read _GetMIME_TYPE_AUDIO;
    {class} property MIME_TYPE_VIDEO: JString read _GetMIME_TYPE_VIDEO;
    {class} property PLAYING: JString read _GetPLAYING;
    {class} property WIDTH: JString read _GetWIDTH;
  end;

  [JavaSignature('android/media/MediaPlayer$MetricsConstants')]
  JMediaPlayer_MetricsConstants = interface(JObject)
    ['{62B9AF4E-B2A4-4DF3-9F75-BB9F0306D7A5}']
  end;
  TJMediaPlayer_MetricsConstants = class(TJavaGenericImport<JMediaPlayer_MetricsConstantsClass, JMediaPlayer_MetricsConstants>) end;

  JMediaPlayer_NoDrmSchemeExceptionClass = interface(JMediaDrmExceptionClass)
    ['{E87BE218-8495-4734-AE26-944277FB24D8}']
    {class} function init(detailMessage: JString): JMediaPlayer_NoDrmSchemeException; cdecl;
  end;

  [JavaSignature('android/media/MediaPlayer$NoDrmSchemeException')]
  JMediaPlayer_NoDrmSchemeException = interface(JMediaDrmException)
    ['{A06C1A4A-1276-4F7B-9F73-92A92DC2CD40}']
  end;
  TJMediaPlayer_NoDrmSchemeException = class(TJavaGenericImport<JMediaPlayer_NoDrmSchemeExceptionClass, JMediaPlayer_NoDrmSchemeException>) end;

  JMediaPlayer_OnBufferingUpdateListenerClass = interface(IJavaClass)
    ['{9690972A-5827-477B-A01D-4285196FB577}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnBufferingUpdateListener')]
  JMediaPlayer_OnBufferingUpdateListener = interface(IJavaInstance)
    ['{BA8BF9D7-325E-4A93-B58F-81B180199D14}']
    procedure onBufferingUpdate(mp: JMediaPlayer; percent: Integer); cdecl;
  end;
  TJMediaPlayer_OnBufferingUpdateListener = class(TJavaGenericImport<JMediaPlayer_OnBufferingUpdateListenerClass, JMediaPlayer_OnBufferingUpdateListener>) end;

  JMediaPlayer_OnCompletionListenerClass = interface(IJavaClass)
    ['{B52C8D4D-90D6-4A31-A123-590582DCA314}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnCompletionListener')]
  JMediaPlayer_OnCompletionListener = interface(IJavaInstance)
    ['{855040E1-8E41-40EE-B36F-06C212B8AC81}']
    procedure onCompletion(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnCompletionListener = class(TJavaGenericImport<JMediaPlayer_OnCompletionListenerClass, JMediaPlayer_OnCompletionListener>) end;

  JMediaPlayer_OnDrmConfigHelperClass = interface(IJavaClass)
    ['{47013626-617D-47C6-B736-3F9EC53077B6}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnDrmConfigHelper')]
  JMediaPlayer_OnDrmConfigHelper = interface(IJavaInstance)
    ['{C6547DF0-A024-44F9-9762-67315EA095D2}']
    procedure onDrmConfig(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnDrmConfigHelper = class(TJavaGenericImport<JMediaPlayer_OnDrmConfigHelperClass, JMediaPlayer_OnDrmConfigHelper>) end;

  JMediaPlayer_OnDrmInfoListenerClass = interface(IJavaClass)
    ['{C0405905-F0CD-4C0C-909C-F12A903F8717}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnDrmInfoListener')]
  JMediaPlayer_OnDrmInfoListener = interface(IJavaInstance)
    ['{A52CAD0D-77CC-41E7-B55F-854342C155DB}']
    procedure onDrmInfo(mp: JMediaPlayer; drmInfo: JMediaPlayer_DrmInfo); cdecl;
  end;
  TJMediaPlayer_OnDrmInfoListener = class(TJavaGenericImport<JMediaPlayer_OnDrmInfoListenerClass, JMediaPlayer_OnDrmInfoListener>) end;

  JMediaPlayer_OnDrmPreparedListenerClass = interface(IJavaClass)
    ['{626D4CF5-0478-488A-A0E1-8FD5E23100AD}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnDrmPreparedListener')]
  JMediaPlayer_OnDrmPreparedListener = interface(IJavaInstance)
    ['{82617256-8AD1-4977-8D0F-700CCCCF3545}']
    procedure onDrmPrepared(mp: JMediaPlayer; status: Integer); cdecl;
  end;
  TJMediaPlayer_OnDrmPreparedListener = class(TJavaGenericImport<JMediaPlayer_OnDrmPreparedListenerClass, JMediaPlayer_OnDrmPreparedListener>) end;

  JMediaPlayer_OnErrorListenerClass = interface(IJavaClass)
    ['{35FC0354-8C2B-4B4B-ABEC-DEBD6B40E6F7}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnErrorListener')]
  JMediaPlayer_OnErrorListener = interface(IJavaInstance)
    ['{164290D2-CB7D-41A2-94DC-20306173FB5E}']
    function onError(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl;
  end;
  TJMediaPlayer_OnErrorListener = class(TJavaGenericImport<JMediaPlayer_OnErrorListenerClass, JMediaPlayer_OnErrorListener>) end;

  JMediaPlayer_OnInfoListenerClass = interface(IJavaClass)
    ['{7141FE3D-8201-49F6-919F-FF71788DFFED}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnInfoListener')]
  JMediaPlayer_OnInfoListener = interface(IJavaInstance)
    ['{84CB6D98-5AC9-4787-8411-E5F7A7CAFA84}']
    function onInfo(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl;
  end;
  TJMediaPlayer_OnInfoListener = class(TJavaGenericImport<JMediaPlayer_OnInfoListenerClass, JMediaPlayer_OnInfoListener>) end;

  JMediaPlayer_OnMediaTimeDiscontinuityListenerClass = interface(IJavaClass)
    ['{3FB99DEB-0C42-40C0-BC58-BEFC01B9955C}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnMediaTimeDiscontinuityListener')]
  JMediaPlayer_OnMediaTimeDiscontinuityListener = interface(IJavaInstance)
    ['{82A72414-D357-4F7C-BC5E-F115B09C55D8}']
    procedure onMediaTimeDiscontinuity(mp: JMediaPlayer; mts: JMediaTimestamp); cdecl;
  end;
  TJMediaPlayer_OnMediaTimeDiscontinuityListener = class(TJavaGenericImport<JMediaPlayer_OnMediaTimeDiscontinuityListenerClass, JMediaPlayer_OnMediaTimeDiscontinuityListener>) end;

  JMediaPlayer_OnPreparedListenerClass = interface(IJavaClass)
    ['{FF67A260-7174-40EF-B53B-DA2BE4CDD72B}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnPreparedListener')]
  JMediaPlayer_OnPreparedListener = interface(IJavaInstance)
    ['{4082D9D4-82AE-4A31-9C58-D8CA78DC1A2B}']
    procedure onPrepared(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnPreparedListener = class(TJavaGenericImport<JMediaPlayer_OnPreparedListenerClass, JMediaPlayer_OnPreparedListener>) end;

  JMediaPlayer_OnSeekCompleteListenerClass = interface(IJavaClass)
    ['{ED9A90D0-F45E-4F82-A31F-A8C9735E2CBE}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnSeekCompleteListener')]
  JMediaPlayer_OnSeekCompleteListener = interface(IJavaInstance)
    ['{2F3ABA30-AB96-4030-9621-3C3A6FEC13AD}']
    procedure onSeekComplete(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnSeekCompleteListener = class(TJavaGenericImport<JMediaPlayer_OnSeekCompleteListenerClass, JMediaPlayer_OnSeekCompleteListener>) end;

  JMediaPlayer_OnSubtitleDataListenerClass = interface(IJavaClass)
    ['{69B5AAD1-BD55-475D-83DE-C182F3FD6E1A}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnSubtitleDataListener')]
  JMediaPlayer_OnSubtitleDataListener = interface(IJavaInstance)
    ['{684A958B-68E6-4A61-9FCD-14330FE840A3}']
    procedure onSubtitleData(mp: JMediaPlayer; data: JSubtitleData); cdecl;
  end;
  TJMediaPlayer_OnSubtitleDataListener = class(TJavaGenericImport<JMediaPlayer_OnSubtitleDataListenerClass, JMediaPlayer_OnSubtitleDataListener>) end;

  JMediaPlayer_OnTimedMetaDataAvailableListenerClass = interface(IJavaClass)
    ['{95A5650E-B0EB-4277-8DDF-3D24F435B260}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnTimedMetaDataAvailableListener')]
  JMediaPlayer_OnTimedMetaDataAvailableListener = interface(IJavaInstance)
    ['{DD4BD518-610B-4DE8-8950-6DD1090F9905}']
    procedure onTimedMetaDataAvailable(mp: JMediaPlayer; data: JTimedMetaData); cdecl;
  end;
  TJMediaPlayer_OnTimedMetaDataAvailableListener = class(TJavaGenericImport<JMediaPlayer_OnTimedMetaDataAvailableListenerClass, JMediaPlayer_OnTimedMetaDataAvailableListener>) end;

  JMediaPlayer_OnTimedTextListenerClass = interface(IJavaClass)
    ['{B1D8CCB6-43D0-4238-85F7-E9A91DA43744}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnTimedTextListener')]
  JMediaPlayer_OnTimedTextListener = interface(IJavaInstance)
    ['{0884B998-F061-44F4-BAB4-A31DAF22F162}']
    procedure onTimedText(mp: JMediaPlayer; text: JTimedText); cdecl;
  end;
  TJMediaPlayer_OnTimedTextListener = class(TJavaGenericImport<JMediaPlayer_OnTimedTextListenerClass, JMediaPlayer_OnTimedTextListener>) end;

  JMediaPlayer_OnVideoSizeChangedListenerClass = interface(IJavaClass)
    ['{3693771D-E38F-4C43-9FC2-AAB16CBF4DA3}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnVideoSizeChangedListener')]
  JMediaPlayer_OnVideoSizeChangedListener = interface(IJavaInstance)
    ['{37F96835-D256-4DAF-B0F0-17B653F8ECB9}']
    procedure onVideoSizeChanged(mp: JMediaPlayer; width: Integer; height: Integer); cdecl;
  end;
  TJMediaPlayer_OnVideoSizeChangedListener = class(TJavaGenericImport<JMediaPlayer_OnVideoSizeChangedListenerClass, JMediaPlayer_OnVideoSizeChangedListener>) end;

  JMediaPlayer_ProvisioningNetworkErrorExceptionClass = interface(JMediaDrmExceptionClass)
    ['{60685296-2ADB-452D-A03A-1EB0AAAEA880}']
    {class} function init(detailMessage: JString): JMediaPlayer_ProvisioningNetworkErrorException; cdecl;
  end;

  [JavaSignature('android/media/MediaPlayer$ProvisioningNetworkErrorException')]
  JMediaPlayer_ProvisioningNetworkErrorException = interface(JMediaDrmException)
    ['{C0102DEC-8D69-463D-B61F-26448A816FE8}']
  end;
  TJMediaPlayer_ProvisioningNetworkErrorException = class(TJavaGenericImport<JMediaPlayer_ProvisioningNetworkErrorExceptionClass, JMediaPlayer_ProvisioningNetworkErrorException>) end;

  JMediaPlayer_ProvisioningServerErrorExceptionClass = interface(JMediaDrmExceptionClass)
    ['{2F23C344-2AB6-4533-ABF5-A40C3DF6C7D9}']
    {class} function init(detailMessage: JString): JMediaPlayer_ProvisioningServerErrorException; cdecl;
  end;

  [JavaSignature('android/media/MediaPlayer$ProvisioningServerErrorException')]
  JMediaPlayer_ProvisioningServerErrorException = interface(JMediaDrmException)
    ['{092A1106-D577-4EF0-B348-126B4E3EEB3B}']
  end;
  TJMediaPlayer_ProvisioningServerErrorException = class(TJavaGenericImport<JMediaPlayer_ProvisioningServerErrorExceptionClass, JMediaPlayer_ProvisioningServerErrorException>) end;

  JMediaPlayer_TrackInfoClass = interface(JObjectClass)
    ['{D7B4E7F5-E306-471E-8F77-ADBDB9B94282}']
    {class} function _GetMEDIA_TRACK_TYPE_AUDIO: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_METADATA: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_SUBTITLE: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_TIMEDTEXT: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_VIDEO: Integer; cdecl;
    {class} property MEDIA_TRACK_TYPE_AUDIO: Integer read _GetMEDIA_TRACK_TYPE_AUDIO;
    {class} property MEDIA_TRACK_TYPE_METADATA: Integer read _GetMEDIA_TRACK_TYPE_METADATA;
    {class} property MEDIA_TRACK_TYPE_SUBTITLE: Integer read _GetMEDIA_TRACK_TYPE_SUBTITLE;
    {class} property MEDIA_TRACK_TYPE_TIMEDTEXT: Integer read _GetMEDIA_TRACK_TYPE_TIMEDTEXT;
    {class} property MEDIA_TRACK_TYPE_UNKNOWN: Integer read _GetMEDIA_TRACK_TYPE_UNKNOWN;
    {class} property MEDIA_TRACK_TYPE_VIDEO: Integer read _GetMEDIA_TRACK_TYPE_VIDEO;
  end;

  [JavaSignature('android/media/MediaPlayer$TrackInfo')]
  JMediaPlayer_TrackInfo = interface(JObject)
    ['{488EB87A-19D3-4231-BEE0-01414518C163}']
    function describeContents: Integer; cdecl;
    function getFormat: JMediaFormat; cdecl;
    function getLanguage: JString; cdecl;
    function getTrackType: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaPlayer_TrackInfo = class(TJavaGenericImport<JMediaPlayer_TrackInfoClass, JMediaPlayer_TrackInfo>) end;

  JMediaRecorderClass = interface(JObjectClass)
    ['{C70673D1-3BC5-4951-8C84-3023833CD3CE}']
    {class} function _GetMEDIA_ERROR_SERVER_DIED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_ERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_MAX_DURATION_REACHED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_UNKNOWN: Integer; cdecl;
    {class} function init: JMediaRecorder; cdecl; overload;//Deprecated
    {class} function init(context: JContext): JMediaRecorder; cdecl; overload;
    {class} function getAudioSourceMax: Integer; cdecl;
    {class} property MEDIA_ERROR_SERVER_DIED: Integer read _GetMEDIA_ERROR_SERVER_DIED;
    {class} property MEDIA_RECORDER_ERROR_UNKNOWN: Integer read _GetMEDIA_RECORDER_ERROR_UNKNOWN;
    {class} property MEDIA_RECORDER_INFO_MAX_DURATION_REACHED: Integer read _GetMEDIA_RECORDER_INFO_MAX_DURATION_REACHED;
    {class} property MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING: Integer read _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING;
    {class} property MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED: Integer read _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED;
    {class} property MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED: Integer read _GetMEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED;
    {class} property MEDIA_RECORDER_INFO_UNKNOWN: Integer read _GetMEDIA_RECORDER_INFO_UNKNOWN;
  end;

  [JavaSignature('android/media/MediaRecorder')]
  JMediaRecorder = interface(JObject)
    ['{39D29E60-05D8-4B2C-A0F5-EF03FD1E0E20}']
    procedure addOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener; handler: JHandler); cdecl;
    function getActiveMicrophones: JList; cdecl;
    function getActiveRecordingConfiguration: JAudioRecordingConfiguration; cdecl;
    function getLogSessionId: JLogSessionId; cdecl;
    function getMaxAmplitude: Integer; cdecl;
    function getMetrics: JPersistableBundle; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSurface: JSurface; cdecl;
    function isPrivacySensitive: Boolean; cdecl;
    procedure pause; cdecl;
    procedure prepare; cdecl;
    procedure registerAudioRecordingCallback(executor: JExecutor; cb: JAudioManager_AudioRecordingCallback); cdecl;
    procedure release; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRouting_OnRoutingChangedListener); cdecl;
    procedure reset; cdecl;
    procedure resume; cdecl;
    procedure setAudioChannels(numChannels: Integer); cdecl;
    procedure setAudioEncoder(audio_encoder: Integer); cdecl;
    procedure setAudioEncodingBitRate(bitRate: Integer); cdecl;
    procedure setAudioProfile(profile: JEncoderProfiles_AudioProfile); cdecl;
    procedure setAudioSamplingRate(samplingRate: Integer); cdecl;
    procedure setAudioSource(audioSource: Integer); cdecl;
    procedure setCamera(c: JCamera); cdecl;//Deprecated
    procedure setCaptureRate(fps: Double); cdecl;
    procedure setInputSurface(surface: JSurface); cdecl;
    procedure setLocation(latitude: Single; longitude: Single); cdecl;
    procedure setLogSessionId(id: JLogSessionId); cdecl;
    procedure setMaxDuration(max_duration_ms: Integer); cdecl;
    procedure setMaxFileSize(max_filesize_bytes: Int64); cdecl;
    procedure setNextOutputFile(fd: JFileDescriptor); cdecl; overload;
    procedure setNextOutputFile(file_: JFile); cdecl; overload;
    procedure setOnErrorListener(l: JMediaRecorder_OnErrorListener); cdecl;
    procedure setOnInfoListener(listener: JMediaRecorder_OnInfoListener); cdecl;
    procedure setOrientationHint(degrees: Integer); cdecl;
    procedure setOutputFile(fd: JFileDescriptor); cdecl; overload;
    procedure setOutputFile(file_: JFile); cdecl; overload;
    procedure setOutputFile(path: JString); cdecl; overload;
    procedure setOutputFormat(output_format: Integer); cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    function setPreferredMicrophoneDirection(direction: Integer): Boolean; cdecl;
    function setPreferredMicrophoneFieldDimension(zoom: Single): Boolean; cdecl;
    procedure setPreviewDisplay(sv: JSurface); cdecl;
    procedure setPrivacySensitive(privacySensitive: Boolean); cdecl;
    procedure setProfile(profile: JCamcorderProfile); cdecl;
    procedure setVideoEncoder(video_encoder: Integer); cdecl;
    procedure setVideoEncodingBitRate(bitRate: Integer); cdecl;
    procedure setVideoEncodingProfileLevel(profile: Integer; level: Integer); cdecl;
    procedure setVideoFrameRate(rate: Integer); cdecl;
    procedure setVideoProfile(profile: JEncoderProfiles_VideoProfile); cdecl;
    procedure setVideoSize(width: Integer; height: Integer); cdecl;
    procedure setVideoSource(video_source: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure unregisterAudioRecordingCallback(cb: JAudioManager_AudioRecordingCallback); cdecl;
  end;
  TJMediaRecorder = class(TJavaGenericImport<JMediaRecorderClass, JMediaRecorder>) end;

  JMediaRecorder_AudioEncoderClass = interface(JObjectClass)
    ['{60BE0488-31F9-4C18-8DF8-ED6D05525906}']
    {class} function _GetAAC: Integer; cdecl;
    {class} function _GetAAC_ELD: Integer; cdecl;
    {class} function _GetAMR_NB: Integer; cdecl;
    {class} function _GetAMR_WB: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetHE_AAC: Integer; cdecl;
    {class} function _GetOPUS: Integer; cdecl;
    {class} function _GetVORBIS: Integer; cdecl;
    {class} property AAC: Integer read _GetAAC;
    {class} property AAC_ELD: Integer read _GetAAC_ELD;
    {class} property AMR_NB: Integer read _GetAMR_NB;
    {class} property AMR_WB: Integer read _GetAMR_WB;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property HE_AAC: Integer read _GetHE_AAC;
    {class} property OPUS: Integer read _GetOPUS;
    {class} property VORBIS: Integer read _GetVORBIS;
  end;

  [JavaSignature('android/media/MediaRecorder$AudioEncoder')]
  JMediaRecorder_AudioEncoder = interface(JObject)
    ['{A827A239-F905-460F-850D-633F3C370A44}']
  end;
  TJMediaRecorder_AudioEncoder = class(TJavaGenericImport<JMediaRecorder_AudioEncoderClass, JMediaRecorder_AudioEncoder>) end;

  JMediaRecorder_AudioSourceClass = interface(JObjectClass)
    ['{A2ACA9E4-86BA-483F-B173-9AC32C457B5B}']
    {class} function _GetCAMCORDER: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetMIC: Integer; cdecl;
    {class} function _GetREMOTE_SUBMIX: Integer; cdecl;
    {class} function _GetUNPROCESSED: Integer; cdecl;
    {class} function _GetVOICE_CALL: Integer; cdecl;
    {class} function _GetVOICE_COMMUNICATION: Integer; cdecl;
    {class} function _GetVOICE_DOWNLINK: Integer; cdecl;
    {class} function _GetVOICE_PERFORMANCE: Integer; cdecl;
    {class} function _GetVOICE_RECOGNITION: Integer; cdecl;
    {class} function _GetVOICE_UPLINK: Integer; cdecl;
    {class} property CAMCORDER: Integer read _GetCAMCORDER;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property MIC: Integer read _GetMIC;
    {class} property REMOTE_SUBMIX: Integer read _GetREMOTE_SUBMIX;
    {class} property UNPROCESSED: Integer read _GetUNPROCESSED;
    {class} property VOICE_CALL: Integer read _GetVOICE_CALL;
    {class} property VOICE_COMMUNICATION: Integer read _GetVOICE_COMMUNICATION;
    {class} property VOICE_DOWNLINK: Integer read _GetVOICE_DOWNLINK;
    {class} property VOICE_PERFORMANCE: Integer read _GetVOICE_PERFORMANCE;
    {class} property VOICE_RECOGNITION: Integer read _GetVOICE_RECOGNITION;
    {class} property VOICE_UPLINK: Integer read _GetVOICE_UPLINK;
  end;

  [JavaSignature('android/media/MediaRecorder$AudioSource')]
  JMediaRecorder_AudioSource = interface(JObject)
    ['{32A3494D-269C-4635-83D3-8C8E42C03557}']
  end;
  TJMediaRecorder_AudioSource = class(TJavaGenericImport<JMediaRecorder_AudioSourceClass, JMediaRecorder_AudioSource>) end;

  JMediaRecorder_MetricsConstantsClass = interface(JObjectClass)
    ['{BA1DDE9D-F3FD-4FB3-8684-DF3507840EB9}']
    {class} function _GetAUDIO_BITRATE: JString; cdecl;
    {class} function _GetAUDIO_CHANNELS: JString; cdecl;
    {class} function _GetAUDIO_SAMPLERATE: JString; cdecl;
    {class} function _GetAUDIO_TIMESCALE: JString; cdecl;
    {class} function _GetCAPTURE_FPS: JString; cdecl;
    {class} function _GetCAPTURE_FPS_ENABLE: JString; cdecl;
    {class} function _GetFRAMERATE: JString; cdecl;
    {class} function _GetHEIGHT: JString; cdecl;
    {class} function _GetMOVIE_TIMESCALE: JString; cdecl;
    {class} function _GetROTATION: JString; cdecl;
    {class} function _GetVIDEO_BITRATE: JString; cdecl;
    {class} function _GetVIDEO_IFRAME_INTERVAL: JString; cdecl;
    {class} function _GetVIDEO_LEVEL: JString; cdecl;
    {class} function _GetVIDEO_PROFILE: JString; cdecl;
    {class} function _GetVIDEO_TIMESCALE: JString; cdecl;
    {class} function _GetWIDTH: JString; cdecl;
    {class} property AUDIO_BITRATE: JString read _GetAUDIO_BITRATE;
    {class} property AUDIO_CHANNELS: JString read _GetAUDIO_CHANNELS;
    {class} property AUDIO_SAMPLERATE: JString read _GetAUDIO_SAMPLERATE;
    {class} property AUDIO_TIMESCALE: JString read _GetAUDIO_TIMESCALE;
    {class} property CAPTURE_FPS: JString read _GetCAPTURE_FPS;
    {class} property CAPTURE_FPS_ENABLE: JString read _GetCAPTURE_FPS_ENABLE;
    {class} property FRAMERATE: JString read _GetFRAMERATE;
    {class} property HEIGHT: JString read _GetHEIGHT;
    {class} property MOVIE_TIMESCALE: JString read _GetMOVIE_TIMESCALE;
    {class} property ROTATION: JString read _GetROTATION;
    {class} property VIDEO_BITRATE: JString read _GetVIDEO_BITRATE;
    {class} property VIDEO_IFRAME_INTERVAL: JString read _GetVIDEO_IFRAME_INTERVAL;
    {class} property VIDEO_LEVEL: JString read _GetVIDEO_LEVEL;
    {class} property VIDEO_PROFILE: JString read _GetVIDEO_PROFILE;
    {class} property VIDEO_TIMESCALE: JString read _GetVIDEO_TIMESCALE;
    {class} property WIDTH: JString read _GetWIDTH;
  end;

  [JavaSignature('android/media/MediaRecorder$MetricsConstants')]
  JMediaRecorder_MetricsConstants = interface(JObject)
    ['{1682FBB8-0F50-4C73-B287-82C7CCC459C6}']
  end;
  TJMediaRecorder_MetricsConstants = class(TJavaGenericImport<JMediaRecorder_MetricsConstantsClass, JMediaRecorder_MetricsConstants>) end;

  JMediaRecorder_OnErrorListenerClass = interface(IJavaClass)
    ['{61C1AC3C-6F4E-4513-B98A-7CFDD07FE71B}']
  end;

  [JavaSignature('android/media/MediaRecorder$OnErrorListener')]
  JMediaRecorder_OnErrorListener = interface(IJavaInstance)
    ['{E36B1187-DCC1-48EF-994A-4AB4C6FBE5AF}']
    procedure onError(mr: JMediaRecorder; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaRecorder_OnErrorListener = class(TJavaGenericImport<JMediaRecorder_OnErrorListenerClass, JMediaRecorder_OnErrorListener>) end;

  JMediaRecorder_OnInfoListenerClass = interface(IJavaClass)
    ['{2243D66B-0BD1-49F1-8031-1432CC3EBBD6}']
  end;

  [JavaSignature('android/media/MediaRecorder$OnInfoListener')]
  JMediaRecorder_OnInfoListener = interface(IJavaInstance)
    ['{49627774-9F01-4122-B7F3-62ED95C7DD6B}']
    procedure onInfo(mr: JMediaRecorder; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaRecorder_OnInfoListener = class(TJavaGenericImport<JMediaRecorder_OnInfoListenerClass, JMediaRecorder_OnInfoListener>) end;

  JMediaRecorder_OutputFormatClass = interface(JObjectClass)
    ['{E5FB95FA-4387-4454-9464-8F93A2FB550A}']
    {class} function _GetAAC_ADTS: Integer; cdecl;
    {class} function _GetAMR_NB: Integer; cdecl;
    {class} function _GetAMR_WB: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetMPEG_2_TS: Integer; cdecl;
    {class} function _GetMPEG_4: Integer; cdecl;
    {class} function _GetOGG: Integer; cdecl;
    {class} function _GetRAW_AMR: Integer; cdecl;
    {class} function _GetTHREE_GPP: Integer; cdecl;
    {class} function _GetWEBM: Integer; cdecl;
    {class} property AAC_ADTS: Integer read _GetAAC_ADTS;
    {class} property AMR_NB: Integer read _GetAMR_NB;
    {class} property AMR_WB: Integer read _GetAMR_WB;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property MPEG_2_TS: Integer read _GetMPEG_2_TS;
    {class} property MPEG_4: Integer read _GetMPEG_4;
    {class} property OGG: Integer read _GetOGG;
    {class} property RAW_AMR: Integer read _GetRAW_AMR;
    {class} property THREE_GPP: Integer read _GetTHREE_GPP;
    {class} property WEBM: Integer read _GetWEBM;
  end;

  [JavaSignature('android/media/MediaRecorder$OutputFormat')]
  JMediaRecorder_OutputFormat = interface(JObject)
    ['{3988D375-2062-46A4-8DA6-145374E051D9}']
  end;
  TJMediaRecorder_OutputFormat = class(TJavaGenericImport<JMediaRecorder_OutputFormatClass, JMediaRecorder_OutputFormat>) end;

  JMediaRecorder_VideoEncoderClass = interface(JObjectClass)
    ['{CAC0CF12-4686-461C-AB83-FF52102278BF}']
    {class} function _GetAV1: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetDOLBY_VISION: Integer; cdecl;
    {class} function _GetH263: Integer; cdecl;
    {class} function _GetH264: Integer; cdecl;
    {class} function _GetHEVC: Integer; cdecl;
    {class} function _GetMPEG_4_SP: Integer; cdecl;
    {class} function _GetVP8: Integer; cdecl;
    {class} function _GetVP9: Integer; cdecl;
    {class} property AV1: Integer read _GetAV1;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property DOLBY_VISION: Integer read _GetDOLBY_VISION;
    {class} property H263: Integer read _GetH263;
    {class} property H264: Integer read _GetH264;
    {class} property HEVC: Integer read _GetHEVC;
    {class} property MPEG_4_SP: Integer read _GetMPEG_4_SP;
    {class} property VP8: Integer read _GetVP8;
    {class} property VP9: Integer read _GetVP9;
  end;

  [JavaSignature('android/media/MediaRecorder$VideoEncoder')]
  JMediaRecorder_VideoEncoder = interface(JObject)
    ['{7790955C-286A-4B61-B266-A95E1774953A}']
  end;
  TJMediaRecorder_VideoEncoder = class(TJavaGenericImport<JMediaRecorder_VideoEncoderClass, JMediaRecorder_VideoEncoder>) end;

  JMediaRecorder_VideoSourceClass = interface(JObjectClass)
    ['{007242EA-B501-4179-BE6F-3D7641C9A412}']
    {class} function _GetCAMERA: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetSURFACE: Integer; cdecl;
    {class} property CAMERA: Integer read _GetCAMERA;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property SURFACE: Integer read _GetSURFACE;
  end;

  [JavaSignature('android/media/MediaRecorder$VideoSource')]
  JMediaRecorder_VideoSource = interface(JObject)
    ['{E14FEC4B-01A8-4E23-B9F2-63464382FE92}']
  end;
  TJMediaRecorder_VideoSource = class(TJavaGenericImport<JMediaRecorder_VideoSourceClass, JMediaRecorder_VideoSource>) end;

  JMediaRoute2InfoClass = interface(JObjectClass)
    ['{1A5EBF98-75E4-4695-A483-22B2C2EDA78D}']
    {class} function _GetCONNECTION_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetCONNECTION_STATE_CONNECTING: Integer; cdecl;
    {class} function _GetCONNECTION_STATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFEATURE_LIVE_AUDIO: JString; cdecl;
    {class} function _GetFEATURE_LIVE_VIDEO: JString; cdecl;
    {class} function _GetFEATURE_REMOTE_AUDIO_PLAYBACK: JString; cdecl;
    {class} function _GetFEATURE_REMOTE_PLAYBACK: JString; cdecl;
    {class} function _GetFEATURE_REMOTE_VIDEO_PLAYBACK: JString; cdecl;
    {class} function _GetPLAYBACK_VOLUME_FIXED: Integer; cdecl;
    {class} function _GetPLAYBACK_VOLUME_VARIABLE: Integer; cdecl;
    {class} property CONNECTION_STATE_CONNECTED: Integer read _GetCONNECTION_STATE_CONNECTED;
    {class} property CONNECTION_STATE_CONNECTING: Integer read _GetCONNECTION_STATE_CONNECTING;
    {class} property CONNECTION_STATE_DISCONNECTED: Integer read _GetCONNECTION_STATE_DISCONNECTED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FEATURE_LIVE_AUDIO: JString read _GetFEATURE_LIVE_AUDIO;
    {class} property FEATURE_LIVE_VIDEO: JString read _GetFEATURE_LIVE_VIDEO;
    {class} property FEATURE_REMOTE_AUDIO_PLAYBACK: JString read _GetFEATURE_REMOTE_AUDIO_PLAYBACK;
    {class} property FEATURE_REMOTE_PLAYBACK: JString read _GetFEATURE_REMOTE_PLAYBACK;
    {class} property FEATURE_REMOTE_VIDEO_PLAYBACK: JString read _GetFEATURE_REMOTE_VIDEO_PLAYBACK;
    {class} property PLAYBACK_VOLUME_FIXED: Integer read _GetPLAYBACK_VOLUME_FIXED;
    {class} property PLAYBACK_VOLUME_VARIABLE: Integer read _GetPLAYBACK_VOLUME_VARIABLE;
  end;

  [JavaSignature('android/media/MediaRoute2Info')]
  JMediaRoute2Info = interface(JObject)
    ['{E247F5A3-1651-415E-AE7E-328D7A120A69}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getClientPackageName: JString; cdecl;
    function getConnectionState: Integer; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getExtras: JBundle; cdecl;
    function getFeatures: JList; cdecl;
    function getIconUri: Jnet_Uri; cdecl;
    function getId: JString; cdecl;
    function getName: JCharSequence; cdecl;
    function getVolume: Integer; cdecl;
    function getVolumeHandling: Integer; cdecl;
    function getVolumeMax: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isSystemRoute: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaRoute2Info = class(TJavaGenericImport<JMediaRoute2InfoClass, JMediaRoute2Info>) end;

  JMediaRoute2Info_BuilderClass = interface(JObjectClass)
    ['{0051FF26-7B75-45B8-8757-FE6B7944A3DB}']
    {class} function init(id: JString; name: JCharSequence): JMediaRoute2Info_Builder; cdecl; overload;
    {class} function init(routeInfo: JMediaRoute2Info): JMediaRoute2Info_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/MediaRoute2Info$Builder')]
  JMediaRoute2Info_Builder = interface(JObject)
    ['{E48B3C2C-F184-486D-8AFC-A71AB2A4EAB6}']
    function addFeature(feature: JString): JMediaRoute2Info_Builder; cdecl;
    function addFeatures(features: JCollection): JMediaRoute2Info_Builder; cdecl;
    function build: JMediaRoute2Info; cdecl;
    function clearFeatures: JMediaRoute2Info_Builder; cdecl;
    function setClientPackageName(packageName: JString): JMediaRoute2Info_Builder; cdecl;
    function setConnectionState(connectionState: Integer): JMediaRoute2Info_Builder; cdecl;
    function setDescription(description: JCharSequence): JMediaRoute2Info_Builder; cdecl;
    function setExtras(extras: JBundle): JMediaRoute2Info_Builder; cdecl;
    function setIconUri(iconUri: Jnet_Uri): JMediaRoute2Info_Builder; cdecl;
    function setVolume(volume: Integer): JMediaRoute2Info_Builder; cdecl;
    function setVolumeHandling(volumeHandling: Integer): JMediaRoute2Info_Builder; cdecl;
    function setVolumeMax(volumeMax: Integer): JMediaRoute2Info_Builder; cdecl;
  end;
  TJMediaRoute2Info_Builder = class(TJavaGenericImport<JMediaRoute2Info_BuilderClass, JMediaRoute2Info_Builder>) end;

  JMediaRoute2ProviderServiceClass = interface(JServiceClass)
    ['{DCD1349A-BE4C-4C12-BB8C-0D19A78B9C01}']
    {class} function _GetREASON_INVALID_COMMAND: Integer; cdecl;
    {class} function _GetREASON_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetREASON_REJECTED: Integer; cdecl;
    {class} function _GetREASON_ROUTE_NOT_AVAILABLE: Integer; cdecl;
    {class} function _GetREASON_UNKNOWN_ERROR: Integer; cdecl;
    {class} function _GetREQUEST_ID_NONE: Int64; cdecl;
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function init: JMediaRoute2ProviderService; cdecl;
    {class} property REASON_INVALID_COMMAND: Integer read _GetREASON_INVALID_COMMAND;
    {class} property REASON_NETWORK_ERROR: Integer read _GetREASON_NETWORK_ERROR;
    {class} property REASON_REJECTED: Integer read _GetREASON_REJECTED;
    {class} property REASON_ROUTE_NOT_AVAILABLE: Integer read _GetREASON_ROUTE_NOT_AVAILABLE;
    {class} property REASON_UNKNOWN_ERROR: Integer read _GetREASON_UNKNOWN_ERROR;
    {class} property REQUEST_ID_NONE: Int64 read _GetREQUEST_ID_NONE;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
  end;

  [JavaSignature('android/media/MediaRoute2ProviderService')]
  JMediaRoute2ProviderService = interface(JService)
    ['{2C9529F0-0B5C-4B7A-95F8-404B4EC26C6C}']
    function getAllSessionInfo: JList; cdecl;
    function getSessionInfo(sessionId: JString): JRoutingSessionInfo; cdecl;
    procedure notifyRequestFailed(requestId: Int64; reason: Integer); cdecl;
    procedure notifyRoutes(routes: JCollection); cdecl;
    procedure notifySessionCreated(requestId: Int64; sessionInfo: JRoutingSessionInfo); cdecl;
    procedure notifySessionReleased(sessionId: JString); cdecl;
    procedure notifySessionUpdated(sessionInfo: JRoutingSessionInfo); cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreateSession(requestId: Int64; packageName: JString; routeId: JString; sessionHints: JBundle); cdecl;
    procedure onDeselectRoute(requestId: Int64; sessionId: JString; routeId: JString); cdecl;
    procedure onDiscoveryPreferenceChanged(preference: JRouteDiscoveryPreference); cdecl;
    procedure onReleaseSession(requestId: Int64; sessionId: JString); cdecl;
    procedure onSelectRoute(requestId: Int64; sessionId: JString; routeId: JString); cdecl;
    procedure onSetRouteVolume(requestId: Int64; routeId: JString; volume: Integer); cdecl;
    procedure onSetSessionVolume(requestId: Int64; sessionId: JString; volume: Integer); cdecl;
    procedure onTransferToRoute(requestId: Int64; sessionId: JString; routeId: JString); cdecl;
  end;
  TJMediaRoute2ProviderService = class(TJavaGenericImport<JMediaRoute2ProviderServiceClass, JMediaRoute2ProviderService>) end;

  JMediaRouterClass = interface(JObjectClass)
    ['{BE499891-CFC7-47BB-946C-E633641DEA6F}']
    {class} function _GetCALLBACK_FLAG_PERFORM_ACTIVE_SCAN: Integer; cdecl;
    {class} function _GetCALLBACK_FLAG_UNFILTERED_EVENTS: Integer; cdecl;
    {class} function _GetROUTE_TYPE_LIVE_AUDIO: Integer; cdecl;
    {class} function _GetROUTE_TYPE_LIVE_VIDEO: Integer; cdecl;
    {class} function _GetROUTE_TYPE_USER: Integer; cdecl;
    {class} property CALLBACK_FLAG_PERFORM_ACTIVE_SCAN: Integer read _GetCALLBACK_FLAG_PERFORM_ACTIVE_SCAN;
    {class} property CALLBACK_FLAG_UNFILTERED_EVENTS: Integer read _GetCALLBACK_FLAG_UNFILTERED_EVENTS;
    {class} property ROUTE_TYPE_LIVE_AUDIO: Integer read _GetROUTE_TYPE_LIVE_AUDIO;
    {class} property ROUTE_TYPE_LIVE_VIDEO: Integer read _GetROUTE_TYPE_LIVE_VIDEO;
    {class} property ROUTE_TYPE_USER: Integer read _GetROUTE_TYPE_USER;
  end;

  [JavaSignature('android/media/MediaRouter')]
  JMediaRouter = interface(JObject)
    ['{461EECED-4158-4A87-87AD-568D08569170}']
    procedure addCallback(types: Integer; cb: JMediaRouter_Callback); cdecl; overload;
    procedure addCallback(types: Integer; cb: JMediaRouter_Callback; flags: Integer); cdecl; overload;
    procedure addUserRoute(info: JMediaRouter_UserRouteInfo); cdecl;
    procedure clearUserRoutes; cdecl;
    function createRouteCategory(name: JCharSequence; isGroupable: Boolean): JMediaRouter_RouteCategory; cdecl; overload;
    function createRouteCategory(nameResId: Integer; isGroupable: Boolean): JMediaRouter_RouteCategory; cdecl; overload;
    function createUserRoute(category: JMediaRouter_RouteCategory): JMediaRouter_UserRouteInfo; cdecl;
    function getCategoryAt(index: Integer): JMediaRouter_RouteCategory; cdecl;
    function getCategoryCount: Integer; cdecl;
    function getDefaultRoute: JMediaRouter_RouteInfo; cdecl;
    function getRouteAt(index: Integer): JMediaRouter_RouteInfo; cdecl;
    function getRouteCount: Integer; cdecl;
    function getSelectedRoute(type_: Integer): JMediaRouter_RouteInfo; cdecl;
    procedure removeCallback(cb: JMediaRouter_Callback); cdecl;
    procedure removeUserRoute(info: JMediaRouter_UserRouteInfo); cdecl;
    procedure selectRoute(types: Integer; route: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter = class(TJavaGenericImport<JMediaRouterClass, JMediaRouter>) end;

  JMediaRouter_CallbackClass = interface(JObjectClass)
    ['{CE16DA8F-E295-40D7-BDB9-90B613FEF489}']
    {class} function init: JMediaRouter_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$Callback')]
  JMediaRouter_Callback = interface(JObject)
    ['{4B9C5746-9823-437E-8109-AE475A504BA9}']
    procedure onRouteAdded(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteGrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup; index: Integer); cdecl;
    procedure onRoutePresentationDisplayChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteRemoved(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteSelected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteUngrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup); cdecl;
    procedure onRouteUnselected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteVolumeChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter_Callback = class(TJavaGenericImport<JMediaRouter_CallbackClass, JMediaRouter_Callback>) end;

  JMediaRouter_RouteCategoryClass = interface(JObjectClass)
    ['{CB0B2500-99F0-4F30-AC54-0BED238E7560}']
  end;

  [JavaSignature('android/media/MediaRouter$RouteCategory')]
  JMediaRouter_RouteCategory = interface(JObject)
    ['{C2544513-A0C0-4452-8046-95530994926B}']
    function getName: JCharSequence; cdecl; overload;
    function getName(context: JContext): JCharSequence; cdecl; overload;
    function getRoutes(out_: JList): JList; cdecl;
    function getSupportedTypes: Integer; cdecl;
    function isGroupable: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteCategory = class(TJavaGenericImport<JMediaRouter_RouteCategoryClass, JMediaRouter_RouteCategory>) end;

  JMediaRouter_RouteInfoClass = interface(JObjectClass)
    ['{AEC0CEF3-E779-45E4-A633-3453115EDCE5}']
    {class} function _GetDEVICE_TYPE_BLUETOOTH: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_SPEAKER: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_TV: Integer; cdecl;
    {class} function _GetDEVICE_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_LOCAL: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_REMOTE: Integer; cdecl;
    {class} function _GetPLAYBACK_VOLUME_FIXED: Integer; cdecl;
    {class} function _GetPLAYBACK_VOLUME_VARIABLE: Integer; cdecl;
    {class} property DEVICE_TYPE_BLUETOOTH: Integer read _GetDEVICE_TYPE_BLUETOOTH;
    {class} property DEVICE_TYPE_SPEAKER: Integer read _GetDEVICE_TYPE_SPEAKER;
    {class} property DEVICE_TYPE_TV: Integer read _GetDEVICE_TYPE_TV;
    {class} property DEVICE_TYPE_UNKNOWN: Integer read _GetDEVICE_TYPE_UNKNOWN;
    {class} property PLAYBACK_TYPE_LOCAL: Integer read _GetPLAYBACK_TYPE_LOCAL;
    {class} property PLAYBACK_TYPE_REMOTE: Integer read _GetPLAYBACK_TYPE_REMOTE;
    {class} property PLAYBACK_VOLUME_FIXED: Integer read _GetPLAYBACK_VOLUME_FIXED;
    {class} property PLAYBACK_VOLUME_VARIABLE: Integer read _GetPLAYBACK_VOLUME_VARIABLE;
  end;

  [JavaSignature('android/media/MediaRouter$RouteInfo')]
  JMediaRouter_RouteInfo = interface(JObject)
    ['{D009A403-61AD-4006-AB7A-292CDB8562E2}']
    function getCategory: JMediaRouter_RouteCategory; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getDeviceType: Integer; cdecl;
    function getGroup: JMediaRouter_RouteGroup; cdecl;
    function getIconDrawable: JDrawable; cdecl;
    function getName: JCharSequence; cdecl; overload;
    function getName(context: JContext): JCharSequence; cdecl; overload;
    function getPlaybackStream: Integer; cdecl;
    function getPlaybackType: Integer; cdecl;
    function getPresentationDisplay: JDisplay; cdecl;
    function getStatus: JCharSequence; cdecl;
    function getSupportedTypes: Integer; cdecl;
    function getTag: JObject; cdecl;
    function getVolume: Integer; cdecl;
    function getVolumeHandling: Integer; cdecl;
    function getVolumeMax: Integer; cdecl;
    function isConnecting: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setTag(tag: JObject); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteInfo = class(TJavaGenericImport<JMediaRouter_RouteInfoClass, JMediaRouter_RouteInfo>) end;

  JMediaRouter_RouteGroupClass = interface(JMediaRouter_RouteInfoClass)
    ['{6B4C631F-9D54-4FC0-9B20-A52A75CB5ACC}']
  end;

  [JavaSignature('android/media/MediaRouter$RouteGroup')]
  JMediaRouter_RouteGroup = interface(JMediaRouter_RouteInfo)
    ['{D55DC4A2-A487-467A-A3C0-873B2BF10409}']
    procedure addRoute(route: JMediaRouter_RouteInfo); cdecl; overload;
    procedure addRoute(route: JMediaRouter_RouteInfo; insertAt: Integer); cdecl; overload;
    function getRouteAt(index: Integer): JMediaRouter_RouteInfo; cdecl;
    function getRouteCount: Integer; cdecl;
    procedure removeRoute(route: JMediaRouter_RouteInfo); cdecl; overload;
    procedure removeRoute(index: Integer); cdecl; overload;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setIconDrawable(icon: JDrawable); cdecl;
    procedure setIconResource(resId: Integer); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteGroup = class(TJavaGenericImport<JMediaRouter_RouteGroupClass, JMediaRouter_RouteGroup>) end;

  JMediaRouter_SimpleCallbackClass = interface(JMediaRouter_CallbackClass)
    ['{FE51271A-3E43-46CC-B7C7-1642F6906114}']
    {class} function init: JMediaRouter_SimpleCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$SimpleCallback')]
  JMediaRouter_SimpleCallback = interface(JMediaRouter_Callback)
    ['{7CA629D1-D9D7-4F6A-85BA-4C3F81C87BD8}']
    procedure onRouteAdded(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteGrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup; index: Integer); cdecl;
    procedure onRouteRemoved(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteSelected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteUngrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup); cdecl;
    procedure onRouteUnselected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteVolumeChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter_SimpleCallback = class(TJavaGenericImport<JMediaRouter_SimpleCallbackClass, JMediaRouter_SimpleCallback>) end;

  JMediaRouter_UserRouteInfoClass = interface(JMediaRouter_RouteInfoClass)
    ['{E9430B96-BDA5-4EEA-BC9B-AB818A32EF7A}']
  end;

  [JavaSignature('android/media/MediaRouter$UserRouteInfo')]
  JMediaRouter_UserRouteInfo = interface(JMediaRouter_RouteInfo)
    ['{A7AD5F99-15D8-439D-9A45-2E6E013F6FA0}']
    function getRemoteControlClient: JRemoteControlClient; cdecl;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setDescription(description: JCharSequence); cdecl;
    procedure setIconDrawable(icon: JDrawable); cdecl;
    procedure setIconResource(resId: Integer); cdecl;
    procedure setName(name: JCharSequence); cdecl; overload;
    procedure setName(resId: Integer); cdecl; overload;
    procedure setPlaybackStream(stream: Integer); cdecl;
    procedure setPlaybackType(type_: Integer); cdecl;
    procedure setRemoteControlClient(rcc: JRemoteControlClient); cdecl;
    procedure setStatus(status: JCharSequence); cdecl;
    procedure setVolume(volume: Integer); cdecl;
    procedure setVolumeCallback(vcb: JMediaRouter_VolumeCallback); cdecl;
    procedure setVolumeHandling(volumeHandling: Integer); cdecl;
    procedure setVolumeMax(volumeMax: Integer); cdecl;
  end;
  TJMediaRouter_UserRouteInfo = class(TJavaGenericImport<JMediaRouter_UserRouteInfoClass, JMediaRouter_UserRouteInfo>) end;

  JMediaRouter_VolumeCallbackClass = interface(JObjectClass)
    ['{F2ABA613-70F4-47B1-B5F4-D1CD8AB94202}']
    {class} function init: JMediaRouter_VolumeCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$VolumeCallback')]
  JMediaRouter_VolumeCallback = interface(JObject)
    ['{9D096802-5425-4970-BCBE-B112A7E4C19E}']
    procedure onVolumeSetRequest(info: JMediaRouter_RouteInfo; volume: Integer); cdecl;
    procedure onVolumeUpdateRequest(info: JMediaRouter_RouteInfo; direction: Integer); cdecl;
  end;
  TJMediaRouter_VolumeCallback = class(TJavaGenericImport<JMediaRouter_VolumeCallbackClass, JMediaRouter_VolumeCallback>) end;

  JMediaRouter2Class = interface(JObjectClass)
    ['{B0C97CDC-DB74-4674-B215-6AF89A8B679A}']
    {class} function getInstance(context: JContext): JMediaRouter2; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter2')]
  JMediaRouter2 = interface(JObject)
    ['{16A6D7A7-0AF3-437B-A0B3-DEE00214EC07}']
    function getController(id: JString): JMediaRouter2_RoutingController; cdecl;
    function getControllers: JList; cdecl;
    function getRoutes: JList; cdecl;
    function getSystemController: JMediaRouter2_RoutingController; cdecl;
    procedure registerControllerCallback(executor: JExecutor; callback: JMediaRouter2_ControllerCallback); cdecl;
    procedure registerRouteCallback(executor: JExecutor; routeCallback: JMediaRouter2_RouteCallback; preference: JRouteDiscoveryPreference); cdecl;
    procedure registerTransferCallback(executor: JExecutor; callback: JMediaRouter2_TransferCallback); cdecl;
    procedure setOnGetControllerHintsListener(listener: JMediaRouter2_OnGetControllerHintsListener); cdecl;
    procedure stop; cdecl;
    procedure transferTo(route: JMediaRoute2Info); cdecl;
    procedure unregisterControllerCallback(callback: JMediaRouter2_ControllerCallback); cdecl;
    procedure unregisterRouteCallback(routeCallback: JMediaRouter2_RouteCallback); cdecl;
    procedure unregisterTransferCallback(callback: JMediaRouter2_TransferCallback); cdecl;
  end;
  TJMediaRouter2 = class(TJavaGenericImport<JMediaRouter2Class, JMediaRouter2>) end;

  JMediaRouter2_ControllerCallbackClass = interface(JObjectClass)
    ['{32378625-F92D-4E0A-9095-040638CA3908}']
    {class} function init: JMediaRouter2_ControllerCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter2$ControllerCallback')]
  JMediaRouter2_ControllerCallback = interface(JObject)
    ['{D7D17DC3-A17F-4C99-9010-2E339F08D37A}']
    procedure onControllerUpdated(controller: JMediaRouter2_RoutingController); cdecl;
  end;
  TJMediaRouter2_ControllerCallback = class(TJavaGenericImport<JMediaRouter2_ControllerCallbackClass, JMediaRouter2_ControllerCallback>) end;

  JMediaRouter2_OnGetControllerHintsListenerClass = interface(IJavaClass)
    ['{328A5976-9968-4F98-8531-A9B09F22D14A}']
  end;

  [JavaSignature('android/media/MediaRouter2$OnGetControllerHintsListener')]
  JMediaRouter2_OnGetControllerHintsListener = interface(IJavaInstance)
    ['{C8EB6B4D-8E29-4701-BC6A-1530EB7A221F}']
    function onGetControllerHints(route: JMediaRoute2Info): JBundle; cdecl;
  end;
  TJMediaRouter2_OnGetControllerHintsListener = class(TJavaGenericImport<JMediaRouter2_OnGetControllerHintsListenerClass, JMediaRouter2_OnGetControllerHintsListener>) end;

  JMediaRouter2_RouteCallbackClass = interface(JObjectClass)
    ['{BD557E25-2175-4A76-9E57-12C8756A80D1}']
    {class} function init: JMediaRouter2_RouteCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter2$RouteCallback')]
  JMediaRouter2_RouteCallback = interface(JObject)
    ['{E564D927-867C-440B-BC6B-C2613D954860}']
    procedure onRoutesAdded(routes: JList); cdecl;
    procedure onRoutesChanged(routes: JList); cdecl;
    procedure onRoutesRemoved(routes: JList); cdecl;
  end;
  TJMediaRouter2_RouteCallback = class(TJavaGenericImport<JMediaRouter2_RouteCallbackClass, JMediaRouter2_RouteCallback>) end;

  JMediaRouter2_RoutingControllerClass = interface(JObjectClass)
    ['{5509D1C9-143B-47AF-A47D-3F795112DDE1}']
  end;

  [JavaSignature('android/media/MediaRouter2$RoutingController')]
  JMediaRouter2_RoutingController = interface(JObject)
    ['{D8068631-AC02-46FA-98BD-B140524D328C}']
    procedure deselectRoute(route: JMediaRoute2Info); cdecl;
    function getControlHints: JBundle; cdecl;
    function getDeselectableRoutes: JList; cdecl;
    function getId: JString; cdecl;
    function getSelectableRoutes: JList; cdecl;
    function getSelectedRoutes: JList; cdecl;
    function getVolume: Integer; cdecl;
    function getVolumeHandling: Integer; cdecl;
    function getVolumeMax: Integer; cdecl;
    function isReleased: Boolean; cdecl;
    procedure release; cdecl;
    procedure selectRoute(route: JMediaRoute2Info); cdecl;
    procedure setVolume(volume: Integer); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter2_RoutingController = class(TJavaGenericImport<JMediaRouter2_RoutingControllerClass, JMediaRouter2_RoutingController>) end;

  JMediaRouter2_TransferCallbackClass = interface(JObjectClass)
    ['{7A5C87EA-A78D-42AB-986D-3326B95B3780}']
    {class} function init: JMediaRouter2_TransferCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter2$TransferCallback')]
  JMediaRouter2_TransferCallback = interface(JObject)
    ['{12EF185A-48F3-433A-BD1E-383F42253D03}']
    procedure onStop(controller: JMediaRouter2_RoutingController); cdecl;
    procedure onTransfer(oldController: JMediaRouter2_RoutingController; newController: JMediaRouter2_RoutingController); cdecl;
    procedure onTransferFailure(requestedRoute: JMediaRoute2Info); cdecl;
  end;
  TJMediaRouter2_TransferCallback = class(TJavaGenericImport<JMediaRouter2_TransferCallbackClass, JMediaRouter2_TransferCallback>) end;

  JMediaScannerConnectionClass = interface(JObjectClass)
    ['{B3D9C29E-B436-469D-B694-181060E571DC}']
    {class} function init(context: JContext; client: JMediaScannerConnection_MediaScannerConnectionClient): JMediaScannerConnection; cdecl;
    {class} procedure scanFile(context: JContext; paths: TJavaObjectArray<JString>; mimeTypes: TJavaObjectArray<JString>; callback: JMediaScannerConnection_OnScanCompletedListener); cdecl; overload;
  end;

  [JavaSignature('android/media/MediaScannerConnection')]
  JMediaScannerConnection = interface(JObject)
    ['{CB9CBD70-C6AD-4FB5-8359-07F04747FB02}']
    procedure connect; cdecl;
    procedure disconnect; cdecl;
    function isConnected: Boolean; cdecl;
    procedure onServiceConnected(className: JComponentName; service: JIBinder); cdecl;
    procedure onServiceDisconnected(className: JComponentName); cdecl;
    procedure scanFile(path: JString; mimeType: JString); cdecl; overload;
  end;
  TJMediaScannerConnection = class(TJavaGenericImport<JMediaScannerConnectionClass, JMediaScannerConnection>) end;

  JMediaScannerConnection_OnScanCompletedListenerClass = interface(IJavaClass)
    ['{743ED55A-4735-41E1-AE1A-E0D4023F8AA5}']
  end;

  [JavaSignature('android/media/MediaScannerConnection$OnScanCompletedListener')]
  JMediaScannerConnection_OnScanCompletedListener = interface(IJavaInstance)
    ['{67909CB7-D7EA-4870-9461-7394752675F3}']
    procedure onScanCompleted(path: JString; uri: Jnet_Uri); cdecl;
  end;
  TJMediaScannerConnection_OnScanCompletedListener = class(TJavaGenericImport<JMediaScannerConnection_OnScanCompletedListenerClass, JMediaScannerConnection_OnScanCompletedListener>) end;

  JMediaScannerConnection_MediaScannerConnectionClientClass = interface(JMediaScannerConnection_OnScanCompletedListenerClass)
    ['{BA6A6FBB-C272-4BFF-986D-6DD9ABB7EE36}']
  end;

  [JavaSignature('android/media/MediaScannerConnection$MediaScannerConnectionClient')]
  JMediaScannerConnection_MediaScannerConnectionClient = interface(JMediaScannerConnection_OnScanCompletedListener)
    ['{02CB4035-E2C0-4C2D-9250-5805C45E789D}']
    procedure onMediaScannerConnected; cdecl;
  end;
  TJMediaScannerConnection_MediaScannerConnectionClient = class(TJavaGenericImport<JMediaScannerConnection_MediaScannerConnectionClientClass, JMediaScannerConnection_MediaScannerConnectionClient>) end;

  JMediaSyncClass = interface(JObjectClass)
    ['{3EF721E1-8B59-4388-8A0F-9132A386A927}']
    {class} function _GetMEDIASYNC_ERROR_AUDIOTRACK_FAIL: Integer; cdecl;
    {class} function _GetMEDIASYNC_ERROR_SURFACE_FAIL: Integer; cdecl;
    {class} function init: JMediaSync; cdecl;
    {class} property MEDIASYNC_ERROR_AUDIOTRACK_FAIL: Integer read _GetMEDIASYNC_ERROR_AUDIOTRACK_FAIL;
    {class} property MEDIASYNC_ERROR_SURFACE_FAIL: Integer read _GetMEDIASYNC_ERROR_SURFACE_FAIL;
  end;

  [JavaSignature('android/media/MediaSync')]
  JMediaSync = interface(JObject)
    ['{47A10A95-2462-4977-8F99-16FCC4BC603C}']
    function createInputSurface: JSurface; cdecl;
    procedure flush; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getSyncParams: JSyncParams; cdecl;
    function getTimestamp: JMediaTimestamp; cdecl;
    procedure queueAudio(audioData: JByteBuffer; bufferId: Integer; presentationTimeUs: Int64); cdecl;
    procedure release; cdecl;
    procedure setAudioTrack(audioTrack: JAudioTrack); cdecl;
    procedure setCallback(cb: JMediaSync_Callback; handler: JHandler); cdecl;
    procedure setOnErrorListener(listener: JMediaSync_OnErrorListener; handler: JHandler); cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    procedure setSurface(surface: JSurface); cdecl;
    procedure setSyncParams(params: JSyncParams); cdecl;
  end;
  TJMediaSync = class(TJavaGenericImport<JMediaSyncClass, JMediaSync>) end;

  JMediaSync_CallbackClass = interface(JObjectClass)
    ['{DA4E8F9E-2A48-4B1D-A8BC-625A70FFCBC4}']
    {class} function init: JMediaSync_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaSync$Callback')]
  JMediaSync_Callback = interface(JObject)
    ['{CB27A785-4A0F-4947-9E43-E661FF9201EB}']
    procedure onAudioBufferConsumed(sync: JMediaSync; audioBuffer: JByteBuffer; bufferId: Integer); cdecl;
  end;
  TJMediaSync_Callback = class(TJavaGenericImport<JMediaSync_CallbackClass, JMediaSync_Callback>) end;

  JMediaSync_OnErrorListenerClass = interface(IJavaClass)
    ['{D69A54A3-1797-4EF4-A6C8-F7BAD055EBF0}']
  end;

  [JavaSignature('android/media/MediaSync$OnErrorListener')]
  JMediaSync_OnErrorListener = interface(IJavaInstance)
    ['{437602CE-BF44-4A64-8735-F76FD6A39839}']
    procedure onError(sync: JMediaSync; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaSync_OnErrorListener = class(TJavaGenericImport<JMediaSync_OnErrorListenerClass, JMediaSync_OnErrorListener>) end;

  JMediaSyncEventClass = interface(JObjectClass)
    ['{79525AAA-24FE-4FE9-BBA4-E887C710A091}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSYNC_EVENT_NONE: Integer; cdecl;
    {class} function _GetSYNC_EVENT_PRESENTATION_COMPLETE: Integer; cdecl;
    {class} function createEvent(eventType: Integer): JMediaSyncEvent; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property SYNC_EVENT_NONE: Integer read _GetSYNC_EVENT_NONE;
    {class} property SYNC_EVENT_PRESENTATION_COMPLETE: Integer read _GetSYNC_EVENT_PRESENTATION_COMPLETE;
  end;

  [JavaSignature('android/media/MediaSyncEvent')]
  JMediaSyncEvent = interface(JObject)
    ['{13BEE748-33EE-423F-9C9B-9C570F9C3A9A}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function setAudioSessionId(audioSessionId: Integer): JMediaSyncEvent; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaSyncEvent = class(TJavaGenericImport<JMediaSyncEventClass, JMediaSyncEvent>) end;

  JMediaTimestampClass = interface(JObjectClass)
    ['{D0C42509-9397-490A-9F63-C9E08B213D74}']
    {class} function _GetTIMESTAMP_UNKNOWN: JMediaTimestamp; cdecl;
    {class} function init(mediaTimeUs: Int64; nanoTimeNs: Int64; clockRate: Single): JMediaTimestamp; cdecl;
    {class} property TIMESTAMP_UNKNOWN: JMediaTimestamp read _GetTIMESTAMP_UNKNOWN;
  end;

  [JavaSignature('android/media/MediaTimestamp')]
  JMediaTimestamp = interface(JObject)
    ['{DFDC1617-2E31-4D19-9BBC-2DFF1DF2AB89}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAnchorMediaTimeUs: Int64; cdecl;
    function getAnchorSystemNanoTime: Int64; cdecl;
    function getAnchorSytemNanoTime: Int64; cdecl;//Deprecated
    function getMediaClockRate: Single; cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaTimestamp = class(TJavaGenericImport<JMediaTimestampClass, JMediaTimestamp>) end;

  JMicrophoneDirectionClass = interface(IJavaClass)
    ['{88C87390-9938-447B-AC90-B6989023D167}']
    {class} function _GetMIC_DIRECTION_AWAY_FROM_USER: Integer; cdecl;
    {class} function _GetMIC_DIRECTION_EXTERNAL: Integer; cdecl;
    {class} function _GetMIC_DIRECTION_TOWARDS_USER: Integer; cdecl;
    {class} function _GetMIC_DIRECTION_UNSPECIFIED: Integer; cdecl;
    {class} property MIC_DIRECTION_AWAY_FROM_USER: Integer read _GetMIC_DIRECTION_AWAY_FROM_USER;
    {class} property MIC_DIRECTION_EXTERNAL: Integer read _GetMIC_DIRECTION_EXTERNAL;
    {class} property MIC_DIRECTION_TOWARDS_USER: Integer read _GetMIC_DIRECTION_TOWARDS_USER;
    {class} property MIC_DIRECTION_UNSPECIFIED: Integer read _GetMIC_DIRECTION_UNSPECIFIED;
  end;

  [JavaSignature('android/media/MicrophoneDirection')]
  JMicrophoneDirection = interface(IJavaInstance)
    ['{6DB99109-BD48-448D-BEEE-FCC3A28CDF1E}']
    function setPreferredMicrophoneDirection(direction: Integer): Boolean; cdecl;
    function setPreferredMicrophoneFieldDimension(zoom: Single): Boolean; cdecl;
  end;
  TJMicrophoneDirection = class(TJavaGenericImport<JMicrophoneDirectionClass, JMicrophoneDirection>) end;

  JMicrophoneInfoClass = interface(JObjectClass)
    ['{EB3AAEE8-AC6D-41C9-94B9-BBF9D7A76711}']
    {class} function _GetCHANNEL_MAPPING_DIRECT: Integer; cdecl;
    {class} function _GetCHANNEL_MAPPING_PROCESSED: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_BI_DIRECTIONAL: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_CARDIOID: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_HYPER_CARDIOID: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_OMNI: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_SUPER_CARDIOID: Integer; cdecl;
    {class} function _GetDIRECTIONALITY_UNKNOWN: Integer; cdecl;
    {class} function _GetGROUP_UNKNOWN: Integer; cdecl;
    {class} function _GetINDEX_IN_THE_GROUP_UNKNOWN: Integer; cdecl;
    {class} function _GetLOCATION_MAINBODY: Integer; cdecl;
    {class} function _GetLOCATION_MAINBODY_MOVABLE: Integer; cdecl;
    {class} function _GetLOCATION_PERIPHERAL: Integer; cdecl;
    {class} function _GetLOCATION_UNKNOWN: Integer; cdecl;
    {class} function _GetORIENTATION_UNKNOWN: JMicrophoneInfo_Coordinate3F; cdecl;
    {class} function _GetPOSITION_UNKNOWN: JMicrophoneInfo_Coordinate3F; cdecl;
    {class} function _GetSENSITIVITY_UNKNOWN: Single; cdecl;
    {class} function _GetSPL_UNKNOWN: Single; cdecl;
    {class} property CHANNEL_MAPPING_DIRECT: Integer read _GetCHANNEL_MAPPING_DIRECT;
    {class} property CHANNEL_MAPPING_PROCESSED: Integer read _GetCHANNEL_MAPPING_PROCESSED;
    {class} property DIRECTIONALITY_BI_DIRECTIONAL: Integer read _GetDIRECTIONALITY_BI_DIRECTIONAL;
    {class} property DIRECTIONALITY_CARDIOID: Integer read _GetDIRECTIONALITY_CARDIOID;
    {class} property DIRECTIONALITY_HYPER_CARDIOID: Integer read _GetDIRECTIONALITY_HYPER_CARDIOID;
    {class} property DIRECTIONALITY_OMNI: Integer read _GetDIRECTIONALITY_OMNI;
    {class} property DIRECTIONALITY_SUPER_CARDIOID: Integer read _GetDIRECTIONALITY_SUPER_CARDIOID;
    {class} property DIRECTIONALITY_UNKNOWN: Integer read _GetDIRECTIONALITY_UNKNOWN;
    {class} property GROUP_UNKNOWN: Integer read _GetGROUP_UNKNOWN;
    {class} property INDEX_IN_THE_GROUP_UNKNOWN: Integer read _GetINDEX_IN_THE_GROUP_UNKNOWN;
    {class} property LOCATION_MAINBODY: Integer read _GetLOCATION_MAINBODY;
    {class} property LOCATION_MAINBODY_MOVABLE: Integer read _GetLOCATION_MAINBODY_MOVABLE;
    {class} property LOCATION_PERIPHERAL: Integer read _GetLOCATION_PERIPHERAL;
    {class} property LOCATION_UNKNOWN: Integer read _GetLOCATION_UNKNOWN;
    {class} property ORIENTATION_UNKNOWN: JMicrophoneInfo_Coordinate3F read _GetORIENTATION_UNKNOWN;
    {class} property POSITION_UNKNOWN: JMicrophoneInfo_Coordinate3F read _GetPOSITION_UNKNOWN;
    {class} property SENSITIVITY_UNKNOWN: Single read _GetSENSITIVITY_UNKNOWN;
    {class} property SPL_UNKNOWN: Single read _GetSPL_UNKNOWN;
  end;

  [JavaSignature('android/media/MicrophoneInfo')]
  JMicrophoneInfo = interface(JObject)
    ['{2507DBE4-8ADB-4741-9ECE-79BAAF695065}']
    function getAddress: JString; cdecl;
    function getChannelMapping: JList; cdecl;
    function getDescription: JString; cdecl;
    function getDirectionality: Integer; cdecl;
    function getFrequencyResponse: JList; cdecl;
    function getGroup: Integer; cdecl;
    function getId: Integer; cdecl;
    function getIndexInTheGroup: Integer; cdecl;
    function getLocation: Integer; cdecl;
    function getMaxSpl: Single; cdecl;
    function getMinSpl: Single; cdecl;
    function getOrientation: JMicrophoneInfo_Coordinate3F; cdecl;
    function getPosition: JMicrophoneInfo_Coordinate3F; cdecl;
    function getSensitivity: Single; cdecl;
    function getType: Integer; cdecl;
  end;
  TJMicrophoneInfo = class(TJavaGenericImport<JMicrophoneInfoClass, JMicrophoneInfo>) end;

  JMicrophoneInfo_Coordinate3FClass = interface(JObjectClass)
    ['{EEA9EEB7-E398-4097-8306-DC608E9F2566}']
  end;

  [JavaSignature('android/media/MicrophoneInfo$Coordinate3F')]
  JMicrophoneInfo_Coordinate3F = interface(JObject)
    ['{29BA7950-182B-4773-BA5A-29AAB36E9750}']
    function _Getx: Single; cdecl;
    function _Gety: Single; cdecl;
    function _Getz: Single; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    property x: Single read _Getx;
    property y: Single read _Gety;
    property z: Single read _Getz;
  end;
  TJMicrophoneInfo_Coordinate3F = class(TJavaGenericImport<JMicrophoneInfo_Coordinate3FClass, JMicrophoneInfo_Coordinate3F>) end;

  JNotProvisionedExceptionClass = interface(JMediaDrmExceptionClass)
    ['{1B9BB475-6595-4C0D-99B9-5038AF25E58F}']
    {class} function init(detailMessage: JString): JNotProvisionedException; cdecl;
  end;

  [JavaSignature('android/media/NotProvisionedException')]
  JNotProvisionedException = interface(JMediaDrmException)
    ['{09338289-B2A4-4772-BE68-5B0670C840E5}']
  end;
  TJNotProvisionedException = class(TJavaGenericImport<JNotProvisionedExceptionClass, JNotProvisionedException>) end;

  JPlaybackParamsClass = interface(JObjectClass)
    ['{493A1111-6306-4CAC-B53E-D51784B0C3FA}']
    {class} function _GetAUDIO_FALLBACK_MODE_DEFAULT: Integer; cdecl;
    {class} function _GetAUDIO_FALLBACK_MODE_FAIL: Integer; cdecl;
    {class} function _GetAUDIO_FALLBACK_MODE_MUTE: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JPlaybackParams; cdecl;
    {class} property AUDIO_FALLBACK_MODE_DEFAULT: Integer read _GetAUDIO_FALLBACK_MODE_DEFAULT;
    {class} property AUDIO_FALLBACK_MODE_FAIL: Integer read _GetAUDIO_FALLBACK_MODE_FAIL;
    {class} property AUDIO_FALLBACK_MODE_MUTE: Integer read _GetAUDIO_FALLBACK_MODE_MUTE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/PlaybackParams')]
  JPlaybackParams = interface(JObject)
    ['{C941D1D6-2452-4A43-9D8E-52F7ACA064B3}']
    function allowDefaults: JPlaybackParams; cdecl;
    function describeContents: Integer; cdecl;
    function getAudioFallbackMode: Integer; cdecl;
    function getPitch: Single; cdecl;
    function getSpeed: Single; cdecl;
    function setAudioFallbackMode(audioFallbackMode: Integer): JPlaybackParams; cdecl;
    function setPitch(pitch: Single): JPlaybackParams; cdecl;
    function setSpeed(speed: Single): JPlaybackParams; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackParams = class(TJavaGenericImport<JPlaybackParamsClass, JPlaybackParams>) end;

  JRatingClass = interface(JObjectClass)
    ['{2609B2B6-9F21-4FB9-994F-98CDABAB861A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRATING_3_STARS: Integer; cdecl;
    {class} function _GetRATING_4_STARS: Integer; cdecl;
    {class} function _GetRATING_5_STARS: Integer; cdecl;
    {class} function _GetRATING_HEART: Integer; cdecl;
    {class} function _GetRATING_NONE: Integer; cdecl;
    {class} function _GetRATING_PERCENTAGE: Integer; cdecl;
    {class} function _GetRATING_THUMB_UP_DOWN: Integer; cdecl;
    {class} function newHeartRating(hasHeart: Boolean): JRating; cdecl;
    {class} function newPercentageRating(percent: Single): JRating; cdecl;
    {class} function newStarRating(starRatingStyle: Integer; starRating: Single): JRating; cdecl;
    {class} function newThumbRating(thumbIsUp: Boolean): JRating; cdecl;
    {class} function newUnratedRating(ratingStyle: Integer): JRating; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RATING_3_STARS: Integer read _GetRATING_3_STARS;
    {class} property RATING_4_STARS: Integer read _GetRATING_4_STARS;
    {class} property RATING_5_STARS: Integer read _GetRATING_5_STARS;
    {class} property RATING_HEART: Integer read _GetRATING_HEART;
    {class} property RATING_NONE: Integer read _GetRATING_NONE;
    {class} property RATING_PERCENTAGE: Integer read _GetRATING_PERCENTAGE;
    {class} property RATING_THUMB_UP_DOWN: Integer read _GetRATING_THUMB_UP_DOWN;
  end;

  [JavaSignature('android/media/Rating')]
  JRating = interface(JObject)
    ['{D4D1A891-BFB2-4643-97CE-C19A57AA921F}']
    function describeContents: Integer; cdecl;
    function getPercentRating: Single; cdecl;
    function getRatingStyle: Integer; cdecl;
    function getStarRating: Single; cdecl;
    function hasHeart: Boolean; cdecl;
    function isRated: Boolean; cdecl;
    function isThumbUp: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRating = class(TJavaGenericImport<JRatingClass, JRating>) end;

  JRemoteControlClientClass = interface(JObjectClass)
    ['{3BCB8D6B-7F9E-4559-97A5-FD7A0B386EBA}']
    {class} function _GetFLAG_KEY_MEDIA_FAST_FORWARD: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_NEXT: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PAUSE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PLAY: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PLAY_PAUSE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_POSITION_UPDATE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PREVIOUS: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_RATING: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_REWIND: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_STOP: Integer; cdecl;
    {class} function _GetPLAYSTATE_BUFFERING: Integer; cdecl;
    {class} function _GetPLAYSTATE_ERROR: Integer; cdecl;
    {class} function _GetPLAYSTATE_FAST_FORWARDING: Integer; cdecl;
    {class} function _GetPLAYSTATE_PAUSED: Integer; cdecl;
    {class} function _GetPLAYSTATE_PLAYING: Integer; cdecl;
    {class} function _GetPLAYSTATE_REWINDING: Integer; cdecl;
    {class} function _GetPLAYSTATE_SKIPPING_BACKWARDS: Integer; cdecl;
    {class} function _GetPLAYSTATE_SKIPPING_FORWARDS: Integer; cdecl;
    {class} function _GetPLAYSTATE_STOPPED: Integer; cdecl;
    {class} function init(mediaButtonIntent: JPendingIntent): JRemoteControlClient; cdecl; overload;
    {class} function init(mediaButtonIntent: JPendingIntent; looper: JLooper): JRemoteControlClient; cdecl; overload;
    {class} property FLAG_KEY_MEDIA_FAST_FORWARD: Integer read _GetFLAG_KEY_MEDIA_FAST_FORWARD;
    {class} property FLAG_KEY_MEDIA_NEXT: Integer read _GetFLAG_KEY_MEDIA_NEXT;
    {class} property FLAG_KEY_MEDIA_PAUSE: Integer read _GetFLAG_KEY_MEDIA_PAUSE;
    {class} property FLAG_KEY_MEDIA_PLAY: Integer read _GetFLAG_KEY_MEDIA_PLAY;
    {class} property FLAG_KEY_MEDIA_PLAY_PAUSE: Integer read _GetFLAG_KEY_MEDIA_PLAY_PAUSE;
    {class} property FLAG_KEY_MEDIA_POSITION_UPDATE: Integer read _GetFLAG_KEY_MEDIA_POSITION_UPDATE;
    {class} property FLAG_KEY_MEDIA_PREVIOUS: Integer read _GetFLAG_KEY_MEDIA_PREVIOUS;
    {class} property FLAG_KEY_MEDIA_RATING: Integer read _GetFLAG_KEY_MEDIA_RATING;
    {class} property FLAG_KEY_MEDIA_REWIND: Integer read _GetFLAG_KEY_MEDIA_REWIND;
    {class} property FLAG_KEY_MEDIA_STOP: Integer read _GetFLAG_KEY_MEDIA_STOP;
    {class} property PLAYSTATE_BUFFERING: Integer read _GetPLAYSTATE_BUFFERING;
    {class} property PLAYSTATE_ERROR: Integer read _GetPLAYSTATE_ERROR;
    {class} property PLAYSTATE_FAST_FORWARDING: Integer read _GetPLAYSTATE_FAST_FORWARDING;
    {class} property PLAYSTATE_PAUSED: Integer read _GetPLAYSTATE_PAUSED;
    {class} property PLAYSTATE_PLAYING: Integer read _GetPLAYSTATE_PLAYING;
    {class} property PLAYSTATE_REWINDING: Integer read _GetPLAYSTATE_REWINDING;
    {class} property PLAYSTATE_SKIPPING_BACKWARDS: Integer read _GetPLAYSTATE_SKIPPING_BACKWARDS;
    {class} property PLAYSTATE_SKIPPING_FORWARDS: Integer read _GetPLAYSTATE_SKIPPING_FORWARDS;
    {class} property PLAYSTATE_STOPPED: Integer read _GetPLAYSTATE_STOPPED;
  end;

  [JavaSignature('android/media/RemoteControlClient')]
  JRemoteControlClient = interface(JObject)
    ['{63280B1B-0F55-4FE3-B931-E5E8DE0591E3}']
    function editMetadata(startEmpty: Boolean): JRemoteControlClient_MetadataEditor; cdecl;
    function getMediaSession: JMediaSession; cdecl;
    procedure setMetadataUpdateListener(l: JRemoteControlClient_OnMetadataUpdateListener); cdecl;
    procedure setOnGetPlaybackPositionListener(l: JRemoteControlClient_OnGetPlaybackPositionListener); cdecl;
    procedure setPlaybackPositionUpdateListener(l: JRemoteControlClient_OnPlaybackPositionUpdateListener); cdecl;
    procedure setPlaybackState(state: Integer); cdecl; overload;
    procedure setPlaybackState(state: Integer; timeInMs: Int64; playbackSpeed: Single); cdecl; overload;
    procedure setTransportControlFlags(transportControlFlags: Integer); cdecl;
  end;
  TJRemoteControlClient = class(TJavaGenericImport<JRemoteControlClientClass, JRemoteControlClient>) end;

  JRemoteControlClient_MetadataEditorClass = interface(JMediaMetadataEditorClass)
    ['{C27FF739-A30D-4355-82E4-E29C5068899F}']
    {class} function _GetBITMAP_KEY_ARTWORK: Integer; cdecl;
    {class} //BITMAP_KEY_ARTWORK is defined in parent interface
  end;

  [JavaSignature('android/media/RemoteControlClient$MetadataEditor')]
  JRemoteControlClient_MetadataEditor = interface(JMediaMetadataEditor)
    ['{C73C0E46-3442-440C-8A3D-E583A926B37B}']
    procedure apply; cdecl;
    procedure clear; cdecl;
    function putBitmap(key: Integer; bitmap: JBitmap): JRemoteControlClient_MetadataEditor; cdecl;
    function putLong(key: Integer; value: Int64): JRemoteControlClient_MetadataEditor; cdecl;
    function putObject(key: Integer; object_: JObject): JRemoteControlClient_MetadataEditor; cdecl;
    function putString(key: Integer; value: JString): JRemoteControlClient_MetadataEditor; cdecl;
  end;
  TJRemoteControlClient_MetadataEditor = class(TJavaGenericImport<JRemoteControlClient_MetadataEditorClass, JRemoteControlClient_MetadataEditor>) end;

  JRemoteControlClient_OnGetPlaybackPositionListenerClass = interface(IJavaClass)
    ['{3DD2FCE3-BD30-4B1A-95BA-9A4494C1ADED}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnGetPlaybackPositionListener')]
  JRemoteControlClient_OnGetPlaybackPositionListener = interface(IJavaInstance)
    ['{210D9E54-4FAE-4441-AD6C-F9DE9014C4CE}']
    function onGetPlaybackPosition: Int64; cdecl;
  end;
  TJRemoteControlClient_OnGetPlaybackPositionListener = class(TJavaGenericImport<JRemoteControlClient_OnGetPlaybackPositionListenerClass, JRemoteControlClient_OnGetPlaybackPositionListener>) end;

  JRemoteControlClient_OnMetadataUpdateListenerClass = interface(IJavaClass)
    ['{EDBAED8D-4EC5-44C9-8CA7-38ECF1F1B55D}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnMetadataUpdateListener')]
  JRemoteControlClient_OnMetadataUpdateListener = interface(IJavaInstance)
    ['{F8C8778D-2E0B-4D30-930F-FE967265EBBA}']
    procedure onMetadataUpdate(key: Integer; newValue: JObject); cdecl;
  end;
  TJRemoteControlClient_OnMetadataUpdateListener = class(TJavaGenericImport<JRemoteControlClient_OnMetadataUpdateListenerClass, JRemoteControlClient_OnMetadataUpdateListener>) end;

  JRemoteControlClient_OnPlaybackPositionUpdateListenerClass = interface(IJavaClass)
    ['{B6AB2D0B-3338-4567-9F36-13EB4B72FEAA}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnPlaybackPositionUpdateListener')]
  JRemoteControlClient_OnPlaybackPositionUpdateListener = interface(IJavaInstance)
    ['{6107D444-F76C-419B-9D19-46FAFB46F6A2}']
    procedure onPlaybackPositionUpdate(newPositionMs: Int64); cdecl;
  end;
  TJRemoteControlClient_OnPlaybackPositionUpdateListener = class(TJavaGenericImport<JRemoteControlClient_OnPlaybackPositionUpdateListenerClass, JRemoteControlClient_OnPlaybackPositionUpdateListener>) end;

  JRemoteControllerClass = interface(JObjectClass)
    ['{BB8681BE-C85D-4997-8406-D09160330A6B}']
    {class} function _GetPOSITION_SYNCHRONIZATION_CHECK: Integer; cdecl;
    {class} function _GetPOSITION_SYNCHRONIZATION_NONE: Integer; cdecl;
    {class} function init(context: JContext; updateListener: JRemoteController_OnClientUpdateListener): JRemoteController; cdecl; overload;
    {class} function init(context: JContext; updateListener: JRemoteController_OnClientUpdateListener; looper: JLooper): JRemoteController; cdecl; overload;
    {class} property POSITION_SYNCHRONIZATION_CHECK: Integer read _GetPOSITION_SYNCHRONIZATION_CHECK;
    {class} property POSITION_SYNCHRONIZATION_NONE: Integer read _GetPOSITION_SYNCHRONIZATION_NONE;
  end;

  [JavaSignature('android/media/RemoteController')]
  JRemoteController = interface(JObject)
    ['{7360A8B9-F9E1-42E3-A6DA-6EAE3DF805E8}']
    function clearArtworkConfiguration: Boolean; cdecl;
    function editMetadata: JRemoteController_MetadataEditor; cdecl;
    function getEstimatedMediaPosition: Int64; cdecl;
    function seekTo(timeMs: Int64): Boolean; cdecl;
    function sendMediaKeyEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function setArtworkConfiguration(width: Integer; height: Integer): Boolean; cdecl;
    function setSynchronizationMode(sync: Integer): Boolean; cdecl;
  end;
  TJRemoteController = class(TJavaGenericImport<JRemoteControllerClass, JRemoteController>) end;

  JRemoteController_MetadataEditorClass = interface(JMediaMetadataEditorClass)
    ['{17EB3909-923B-4004-BA1D-6A8D3AC0FC99}']
  end;

  [JavaSignature('android/media/RemoteController$MetadataEditor')]
  JRemoteController_MetadataEditor = interface(JMediaMetadataEditor)
    ['{CFE1A6CE-B7CF-407A-8ED2-02AEA5BB398B}']
    procedure apply; cdecl;
  end;
  TJRemoteController_MetadataEditor = class(TJavaGenericImport<JRemoteController_MetadataEditorClass, JRemoteController_MetadataEditor>) end;

  JRemoteController_OnClientUpdateListenerClass = interface(IJavaClass)
    ['{F3FA280A-BF61-42DE-BF2C-1BA2A9648A8B}']
  end;

  [JavaSignature('android/media/RemoteController$OnClientUpdateListener')]
  JRemoteController_OnClientUpdateListener = interface(IJavaInstance)
    ['{8322F220-C3E9-4663-9726-6DC6DBD7B939}']
    procedure onClientChange(clearing: Boolean); cdecl;
    procedure onClientMetadataUpdate(metadataEditor: JRemoteController_MetadataEditor); cdecl;
    procedure onClientPlaybackStateUpdate(state: Integer); cdecl; overload;
    procedure onClientPlaybackStateUpdate(state: Integer; stateChangeTimeMs: Int64; currentPosMs: Int64; speed: Single); cdecl; overload;
    procedure onClientTransportControlUpdate(transportControlFlags: Integer); cdecl;
  end;
  TJRemoteController_OnClientUpdateListener = class(TJavaGenericImport<JRemoteController_OnClientUpdateListenerClass, JRemoteController_OnClientUpdateListener>) end;

  JResourceBusyExceptionClass = interface(JMediaDrmExceptionClass)
    ['{F93F9FE6-C578-4379-BC55-06E8CFAE9A8D}']
    {class} function init(detailMessage: JString): JResourceBusyException; cdecl;
  end;

  [JavaSignature('android/media/ResourceBusyException')]
  JResourceBusyException = interface(JMediaDrmException)
    ['{2C491FA7-0602-4D59-9C98-D83FF4AE1EA3}']
  end;
  TJResourceBusyException = class(TJavaGenericImport<JResourceBusyExceptionClass, JResourceBusyException>) end;

  JRingtoneClass = interface(JObjectClass)
    ['{C62E030E-5189-47DF-963A-BCA873D1865B}']
  end;

  [JavaSignature('android/media/Ringtone')]
  JRingtone = interface(JObject)
    ['{D08C2112-5F37-4665-BA84-4DC9848539CC}']
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getStreamType: Integer; cdecl;//Deprecated
    function getTitle(context: JContext): JString; cdecl;
    function getVolume: Single; cdecl;
    function isHapticGeneratorEnabled: Boolean; cdecl;
    function isLooping: Boolean; cdecl;
    function isPlaying: Boolean; cdecl;
    procedure play; cdecl;
    procedure setAudioAttributes(attributes: JAudioAttributes); cdecl;
    function setHapticGeneratorEnabled(enabled: Boolean): Boolean; cdecl;
    procedure setLooping(looping: Boolean); cdecl;
    procedure setStreamType(streamType: Integer); cdecl;//Deprecated
    procedure setVolume(volume: Single); cdecl;
    procedure stop; cdecl;
  end;
  TJRingtone = class(TJavaGenericImport<JRingtoneClass, JRingtone>) end;

  JRingtoneManagerClass = interface(JObjectClass)
    ['{8AFA6E70-C245-4694-8B7E-72C5D436FD94}']
    {class} function _GetACTION_RINGTONE_PICKER: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_DEFAULT_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_EXISTING_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_INCLUDE_DRM: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_PICKED_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_SHOW_DEFAULT: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_SHOW_SILENT: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_TITLE: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_TYPE: JString; cdecl;
    {class} function _GetID_COLUMN_INDEX: Integer; cdecl;
    {class} function _GetTITLE_COLUMN_INDEX: Integer; cdecl;
    {class} function _GetTYPE_ALARM: Integer; cdecl;
    {class} function _GetTYPE_ALL: Integer; cdecl;
    {class} function _GetTYPE_NOTIFICATION: Integer; cdecl;
    {class} function _GetTYPE_RINGTONE: Integer; cdecl;
    {class} function _GetURI_COLUMN_INDEX: Integer; cdecl;
    {class} function init(activity: JActivity): JRingtoneManager; cdecl; overload;
    {class} function init(context: JContext): JRingtoneManager; cdecl; overload;
    {class} function getActualDefaultRingtoneUri(context: JContext; type_: Integer): Jnet_Uri; cdecl;
    {class} function getDefaultType(defaultRingtoneUri: Jnet_Uri): Integer; cdecl;
    {class} function getDefaultUri(type_: Integer): Jnet_Uri; cdecl;
    {class} function getRingtone(context: JContext; ringtoneUri: Jnet_Uri): JRingtone; cdecl; overload;
    {class} function getValidRingtoneUri(context: JContext): Jnet_Uri; cdecl;
    {class} function hasHapticChannels(ringtoneUri: Jnet_Uri): Boolean; cdecl; overload;
    {class} function hasHapticChannels(context: JContext; ringtoneUri: Jnet_Uri): Boolean; cdecl; overload;
    {class} function isDefault(ringtoneUri: Jnet_Uri): Boolean; cdecl;
    {class} function openDefaultRingtoneUri(context: JContext; uri: Jnet_Uri): JAssetFileDescriptor; cdecl;
    {class} procedure setActualDefaultRingtoneUri(context: JContext; type_: Integer; ringtoneUri: Jnet_Uri); cdecl;
    {class} property ACTION_RINGTONE_PICKER: JString read _GetACTION_RINGTONE_PICKER;
    {class} property EXTRA_RINGTONE_DEFAULT_URI: JString read _GetEXTRA_RINGTONE_DEFAULT_URI;
    {class} property EXTRA_RINGTONE_EXISTING_URI: JString read _GetEXTRA_RINGTONE_EXISTING_URI;
    {class} property EXTRA_RINGTONE_INCLUDE_DRM: JString read _GetEXTRA_RINGTONE_INCLUDE_DRM;
    {class} property EXTRA_RINGTONE_PICKED_URI: JString read _GetEXTRA_RINGTONE_PICKED_URI;
    {class} property EXTRA_RINGTONE_SHOW_DEFAULT: JString read _GetEXTRA_RINGTONE_SHOW_DEFAULT;
    {class} property EXTRA_RINGTONE_SHOW_SILENT: JString read _GetEXTRA_RINGTONE_SHOW_SILENT;
    {class} property EXTRA_RINGTONE_TITLE: JString read _GetEXTRA_RINGTONE_TITLE;
    {class} property EXTRA_RINGTONE_TYPE: JString read _GetEXTRA_RINGTONE_TYPE;
    {class} property ID_COLUMN_INDEX: Integer read _GetID_COLUMN_INDEX;
    {class} property TITLE_COLUMN_INDEX: Integer read _GetTITLE_COLUMN_INDEX;
    {class} property TYPE_ALARM: Integer read _GetTYPE_ALARM;
    {class} property TYPE_ALL: Integer read _GetTYPE_ALL;
    {class} property TYPE_NOTIFICATION: Integer read _GetTYPE_NOTIFICATION;
    {class} property TYPE_RINGTONE: Integer read _GetTYPE_RINGTONE;
    {class} property URI_COLUMN_INDEX: Integer read _GetURI_COLUMN_INDEX;
  end;

  [JavaSignature('android/media/RingtoneManager')]
  JRingtoneManager = interface(JObject)
    ['{1BD04E09-7368-4024-9231-7C23D839447C}']
    function getCursor: JCursor; cdecl;
    function getIncludeDrm: Boolean; cdecl;//Deprecated
    function getRingtone(position: Integer): JRingtone; cdecl; overload;
    function getRingtonePosition(ringtoneUri: Jnet_Uri): Integer; cdecl;
    function getRingtoneUri(position: Integer): Jnet_Uri; cdecl;
    function getStopPreviousRingtone: Boolean; cdecl;
    function hasHapticChannels(position: Integer): Boolean; cdecl; overload;
    function inferStreamType: Integer; cdecl;
    procedure setIncludeDrm(includeDrm: Boolean); cdecl;//Deprecated
    procedure setStopPreviousRingtone(stopPreviousRingtone: Boolean); cdecl;
    procedure setType(type_: Integer); cdecl;
    procedure stopPreviousRingtone; cdecl;
  end;
  TJRingtoneManager = class(TJavaGenericImport<JRingtoneManagerClass, JRingtoneManager>) end;

  JRouteDiscoveryPreferenceClass = interface(JObjectClass)
    ['{C59EDA45-42D0-4A76-8424-2BF075D4995A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/RouteDiscoveryPreference')]
  JRouteDiscoveryPreference = interface(JObject)
    ['{2363C0CA-5B46-4725-A46C-4E4EC3458A6F}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getPreferredFeatures: JList; cdecl;
    function hashCode: Integer; cdecl;
    function shouldPerformActiveScan: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRouteDiscoveryPreference = class(TJavaGenericImport<JRouteDiscoveryPreferenceClass, JRouteDiscoveryPreference>) end;

  JRouteDiscoveryPreference_BuilderClass = interface(JObjectClass)
    ['{2E177B7B-DC18-4963-A717-879551F23BC4}']
    {class} function init(preferredFeatures: JList; activeScan: Boolean): JRouteDiscoveryPreference_Builder; cdecl; overload;
    {class} function init(preference: JRouteDiscoveryPreference): JRouteDiscoveryPreference_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/RouteDiscoveryPreference$Builder')]
  JRouteDiscoveryPreference_Builder = interface(JObject)
    ['{AD47F077-5701-47DD-911C-24A7BDCB1708}']
    function build: JRouteDiscoveryPreference; cdecl;
    function setPreferredFeatures(preferredFeatures: JList): JRouteDiscoveryPreference_Builder; cdecl;
    function setShouldPerformActiveScan(activeScan: Boolean): JRouteDiscoveryPreference_Builder; cdecl;
  end;
  TJRouteDiscoveryPreference_Builder = class(TJavaGenericImport<JRouteDiscoveryPreference_BuilderClass, JRouteDiscoveryPreference_Builder>) end;

  JRoutingSessionInfoClass = interface(JObjectClass)
    ['{4AF45E59-C046-4DDD-B72A-EADF27C9EAA0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/RoutingSessionInfo')]
  JRoutingSessionInfo = interface(JObject)
    ['{0F8EAC41-C339-4C3A-A244-D7BB02A92946}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getClientPackageName: JString; cdecl;
    function getControlHints: JBundle; cdecl;
    function getDeselectableRoutes: JList; cdecl;
    function getId: JString; cdecl;
    function getName: JCharSequence; cdecl;
    function getSelectableRoutes: JList; cdecl;
    function getSelectedRoutes: JList; cdecl;
    function getTransferableRoutes: JList; cdecl;
    function getVolume: Integer; cdecl;
    function getVolumeHandling: Integer; cdecl;
    function getVolumeMax: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRoutingSessionInfo = class(TJavaGenericImport<JRoutingSessionInfoClass, JRoutingSessionInfo>) end;

  JRoutingSessionInfo_BuilderClass = interface(JObjectClass)
    ['{BC6345F6-ED6B-45BA-89C4-1B079A42A45D}']
    {class} function init(id: JString; clientPackageName: JString): JRoutingSessionInfo_Builder; cdecl; overload;
    {class} function init(sessionInfo: JRoutingSessionInfo): JRoutingSessionInfo_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/RoutingSessionInfo$Builder')]
  JRoutingSessionInfo_Builder = interface(JObject)
    ['{4F885C42-C029-4E89-A5D3-00EBD2EDDA81}']
    function addDeselectableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function addSelectableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function addSelectedRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function addTransferableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function build: JRoutingSessionInfo; cdecl;
    function clearDeselectableRoutes: JRoutingSessionInfo_Builder; cdecl;
    function clearSelectableRoutes: JRoutingSessionInfo_Builder; cdecl;
    function clearSelectedRoutes: JRoutingSessionInfo_Builder; cdecl;
    function clearTransferableRoutes: JRoutingSessionInfo_Builder; cdecl;
    function removeDeselectableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function removeSelectableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function removeSelectedRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function removeTransferableRoute(routeId: JString): JRoutingSessionInfo_Builder; cdecl;
    function setControlHints(controlHints: JBundle): JRoutingSessionInfo_Builder; cdecl;
    function setName(name: JCharSequence): JRoutingSessionInfo_Builder; cdecl;
    function setVolume(volume: Integer): JRoutingSessionInfo_Builder; cdecl;
    function setVolumeHandling(volumeHandling: Integer): JRoutingSessionInfo_Builder; cdecl;
    function setVolumeMax(volumeMax: Integer): JRoutingSessionInfo_Builder; cdecl;
  end;
  TJRoutingSessionInfo_Builder = class(TJavaGenericImport<JRoutingSessionInfo_BuilderClass, JRoutingSessionInfo_Builder>) end;

  JSoundPoolClass = interface(JObjectClass)
    ['{DFFA6151-B321-4111-A703-864E406FDA28}']
    {class} function init(maxStreams: Integer; streamType: Integer; srcQuality: Integer): JSoundPool; cdecl;//Deprecated
  end;

  [JavaSignature('android/media/SoundPool')]
  JSoundPool = interface(JObject)
    ['{923ACDC6-1C0D-437A-9A44-D43B0BA82522}']
    procedure autoPause; cdecl;
    procedure autoResume; cdecl;
    function load(path: JString; priority: Integer): Integer; cdecl; overload;
    function load(context: JContext; resId: Integer; priority: Integer): Integer; cdecl; overload;
    function load(afd: JAssetFileDescriptor; priority: Integer): Integer; cdecl; overload;
    function load(fd: JFileDescriptor; offset: Int64; length: Int64; priority: Integer): Integer; cdecl; overload;
    procedure pause(streamID: Integer); cdecl;
    function play(soundID: Integer; leftVolume: Single; rightVolume: Single; priority: Integer; loop: Integer; rate: Single): Integer; cdecl;
    procedure release; cdecl;
    procedure resume(streamID: Integer); cdecl;
    procedure setLoop(streamID: Integer; loop: Integer); cdecl;
    procedure setOnLoadCompleteListener(listener: JSoundPool_OnLoadCompleteListener); cdecl;
    procedure setPriority(streamID: Integer; priority: Integer); cdecl;
    procedure setRate(streamID: Integer; rate: Single); cdecl;
    procedure setVolume(streamID: Integer; leftVolume: Single; rightVolume: Single); cdecl;
    procedure stop(streamID: Integer); cdecl;
    function unload(soundID: Integer): Boolean; cdecl;
  end;
  TJSoundPool = class(TJavaGenericImport<JSoundPoolClass, JSoundPool>) end;

  JSoundPool_BuilderClass = interface(JObjectClass)
    ['{88397C0D-2A54-48B3-B39F-7035F19C8670}']
    {class} function init: JSoundPool_Builder; cdecl;
  end;

  [JavaSignature('android/media/SoundPool$Builder')]
  JSoundPool_Builder = interface(JObject)
    ['{8571A1CE-EBF2-4461-953E-23F5B5F1CC4A}']
    function build: JSoundPool; cdecl;
    function setAudioAttributes(attributes: JAudioAttributes): JSoundPool_Builder; cdecl;
    function setMaxStreams(maxStreams: Integer): JSoundPool_Builder; cdecl;
  end;
  TJSoundPool_Builder = class(TJavaGenericImport<JSoundPool_BuilderClass, JSoundPool_Builder>) end;

  JSoundPool_OnLoadCompleteListenerClass = interface(IJavaClass)
    ['{3BB55DBE-8614-4445-BA79-3EB818241E8C}']
  end;

  [JavaSignature('android/media/SoundPool$OnLoadCompleteListener')]
  JSoundPool_OnLoadCompleteListener = interface(IJavaInstance)
    ['{E0F6A95C-27EF-4865-9C1C-DDD2664D58BD}']
    procedure onLoadComplete(soundPool: JSoundPool; sampleId: Integer; status: Integer); cdecl;
  end;
  TJSoundPool_OnLoadCompleteListener = class(TJavaGenericImport<JSoundPool_OnLoadCompleteListenerClass, JSoundPool_OnLoadCompleteListener>) end;

  JSpatializerClass = interface(JObjectClass)
    ['{5781B94B-1122-4EC0-8C6F-6FFE10C91C57}']
    {class} function _GetSPATIALIZER_IMMERSIVE_LEVEL_MULTICHANNEL: Integer; cdecl;
    {class} function _GetSPATIALIZER_IMMERSIVE_LEVEL_NONE: Integer; cdecl;
    {class} function _GetSPATIALIZER_IMMERSIVE_LEVEL_OTHER: Integer; cdecl;
    {class} property SPATIALIZER_IMMERSIVE_LEVEL_MULTICHANNEL: Integer read _GetSPATIALIZER_IMMERSIVE_LEVEL_MULTICHANNEL;
    {class} property SPATIALIZER_IMMERSIVE_LEVEL_NONE: Integer read _GetSPATIALIZER_IMMERSIVE_LEVEL_NONE;
    {class} property SPATIALIZER_IMMERSIVE_LEVEL_OTHER: Integer read _GetSPATIALIZER_IMMERSIVE_LEVEL_OTHER;
  end;

  [JavaSignature('android/media/Spatializer')]
  JSpatializer = interface(JObject)
    ['{F614B4B9-D90E-4E7C-895B-DEC2FD7BF3A2}']
    procedure addOnHeadTrackerAvailableListener(executor: JExecutor; listener: JSpatializer_OnHeadTrackerAvailableListener); cdecl;
    procedure addOnSpatializerStateChangedListener(executor: JExecutor; listener: JSpatializer_OnSpatializerStateChangedListener); cdecl;
    function canBeSpatialized(attributes: JAudioAttributes; format: JAudioFormat): Boolean; cdecl;
    function getImmersiveAudioLevel: Integer; cdecl;
    function isAvailable: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isHeadTrackerAvailable: Boolean; cdecl;
    procedure removeOnHeadTrackerAvailableListener(listener: JSpatializer_OnHeadTrackerAvailableListener); cdecl;
    procedure removeOnSpatializerStateChangedListener(listener: JSpatializer_OnSpatializerStateChangedListener); cdecl;
  end;
  TJSpatializer = class(TJavaGenericImport<JSpatializerClass, JSpatializer>) end;

  JSpatializer_OnHeadTrackerAvailableListenerClass = interface(IJavaClass)
    ['{FDBEEB6B-FFBC-4CCF-9798-3DC50B3BBCD0}']
  end;

  [JavaSignature('android/media/Spatializer$OnHeadTrackerAvailableListener')]
  JSpatializer_OnHeadTrackerAvailableListener = interface(IJavaInstance)
    ['{BAB1C7AD-FB00-489E-8169-6BA9502A9920}']
    procedure onHeadTrackerAvailableChanged(spatializer: JSpatializer; available: Boolean); cdecl;
  end;
  TJSpatializer_OnHeadTrackerAvailableListener = class(TJavaGenericImport<JSpatializer_OnHeadTrackerAvailableListenerClass, JSpatializer_OnHeadTrackerAvailableListener>) end;

  JSpatializer_OnSpatializerStateChangedListenerClass = interface(IJavaClass)
    ['{2AB70570-8EFE-439D-B834-2BDEC7031379}']
  end;

  [JavaSignature('android/media/Spatializer$OnSpatializerStateChangedListener')]
  JSpatializer_OnSpatializerStateChangedListener = interface(IJavaInstance)
    ['{2E473B5A-375E-433F-BF3A-3B1398F1C6CE}']
    procedure onSpatializerAvailableChanged(spat: JSpatializer; available: Boolean); cdecl;
    procedure onSpatializerEnabledChanged(spat: JSpatializer; enabled: Boolean); cdecl;
  end;
  TJSpatializer_OnSpatializerStateChangedListener = class(TJavaGenericImport<JSpatializer_OnSpatializerStateChangedListenerClass, JSpatializer_OnSpatializerStateChangedListener>) end;

  JSubtitleDataClass = interface(JObjectClass)
    ['{A1784C27-8EE1-46D6-8FA5-7AF7D59BF3C4}']
    {class} function init(trackIndex: Integer; startTimeUs: Int64; durationUs: Int64; data: TJavaArray<Byte>): JSubtitleData; cdecl;
  end;

  [JavaSignature('android/media/SubtitleData')]
  JSubtitleData = interface(JObject)
    ['{792454C8-B0E7-457A-B045-D3517EDDEC6D}']
    function getData: TJavaArray<Byte>; cdecl;
    function getDurationUs: Int64; cdecl;
    function getStartTimeUs: Int64; cdecl;
    function getTrackIndex: Integer; cdecl;
  end;
  TJSubtitleData = class(TJavaGenericImport<JSubtitleDataClass, JSubtitleData>) end;

  JSyncParamsClass = interface(JObjectClass)
    ['{602D3104-4D7E-4424-A005-D365AA8B5A1D}']
    {class} function _GetAUDIO_ADJUST_MODE_DEFAULT: Integer; cdecl;
    {class} function _GetAUDIO_ADJUST_MODE_RESAMPLE: Integer; cdecl;
    {class} function _GetAUDIO_ADJUST_MODE_STRETCH: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_AUDIO: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_DEFAULT: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_SYSTEM_CLOCK: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_VSYNC: Integer; cdecl;
    {class} function init: JSyncParams; cdecl;
    {class} property AUDIO_ADJUST_MODE_DEFAULT: Integer read _GetAUDIO_ADJUST_MODE_DEFAULT;
    {class} property AUDIO_ADJUST_MODE_RESAMPLE: Integer read _GetAUDIO_ADJUST_MODE_RESAMPLE;
    {class} property AUDIO_ADJUST_MODE_STRETCH: Integer read _GetAUDIO_ADJUST_MODE_STRETCH;
    {class} property SYNC_SOURCE_AUDIO: Integer read _GetSYNC_SOURCE_AUDIO;
    {class} property SYNC_SOURCE_DEFAULT: Integer read _GetSYNC_SOURCE_DEFAULT;
    {class} property SYNC_SOURCE_SYSTEM_CLOCK: Integer read _GetSYNC_SOURCE_SYSTEM_CLOCK;
    {class} property SYNC_SOURCE_VSYNC: Integer read _GetSYNC_SOURCE_VSYNC;
  end;

  [JavaSignature('android/media/SyncParams')]
  JSyncParams = interface(JObject)
    ['{2F176C77-E881-4CDB-95CC-1A233A604C45}']
    function allowDefaults: JSyncParams; cdecl;
    function getAudioAdjustMode: Integer; cdecl;
    function getFrameRate: Single; cdecl;
    function getSyncSource: Integer; cdecl;
    function getTolerance: Single; cdecl;
    function setAudioAdjustMode(audioAdjustMode: Integer): JSyncParams; cdecl;
    function setFrameRate(frameRate: Single): JSyncParams; cdecl;
    function setSyncSource(syncSource: Integer): JSyncParams; cdecl;
    function setTolerance(tolerance: Single): JSyncParams; cdecl;
  end;
  TJSyncParams = class(TJavaGenericImport<JSyncParamsClass, JSyncParams>) end;

  JThumbnailUtilsClass = interface(JObjectClass)
    ['{5D772E54-5912-4CF0-A97D-0A4B171E7EF7}']
    {class} function _GetOPTIONS_RECYCLE_INPUT: Integer; cdecl;
    {class} function init: JThumbnailUtils; cdecl;
    {class} function createAudioThumbnail(filePath: JString; kind: Integer): JBitmap; cdecl; overload;//Deprecated
    {class} function createAudioThumbnail(file_: JFile; size: Jutil_Size; signal: JCancellationSignal): JBitmap; cdecl; overload;
    {class} function createImageThumbnail(filePath: JString; kind: Integer): JBitmap; cdecl; overload;//Deprecated
    {class} function createImageThumbnail(file_: JFile; size: Jutil_Size; signal: JCancellationSignal): JBitmap; cdecl; overload;
    {class} function createVideoThumbnail(filePath: JString; kind: Integer): JBitmap; cdecl; overload;//Deprecated
    {class} function createVideoThumbnail(file_: JFile; size: Jutil_Size; signal: JCancellationSignal): JBitmap; cdecl; overload;
    {class} function extractThumbnail(source: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; overload;
    {class} function extractThumbnail(source: JBitmap; width: Integer; height: Integer; options: Integer): JBitmap; cdecl; overload;
    {class} property OPTIONS_RECYCLE_INPUT: Integer read _GetOPTIONS_RECYCLE_INPUT;
  end;

  [JavaSignature('android/media/ThumbnailUtils')]
  JThumbnailUtils = interface(JObject)
    ['{EF230179-DF54-4876-A9BC-5D982DF95E21}']
  end;
  TJThumbnailUtils = class(TJavaGenericImport<JThumbnailUtilsClass, JThumbnailUtils>) end;

  JTimedMetaDataClass = interface(JObjectClass)
    ['{3D32D7E0-820D-41F7-9203-171A2563A6E4}']
    {class} function init(timestampUs: Int64; metaData: TJavaArray<Byte>): JTimedMetaData; cdecl;
  end;

  [JavaSignature('android/media/TimedMetaData')]
  JTimedMetaData = interface(JObject)
    ['{F0277382-AC54-4B77-A115-1AC93D5308ED}']
    function getMetaData: TJavaArray<Byte>; cdecl;
    function getTimestamp: Int64; cdecl;
  end;
  TJTimedMetaData = class(TJavaGenericImport<JTimedMetaDataClass, JTimedMetaData>) end;

  JTimedTextClass = interface(JObjectClass)
    ['{1C368248-EC42-4D7E-9CBF-4C9910FD9C67}']
  end;

  [JavaSignature('android/media/TimedText')]
  JTimedText = interface(JObject)
    ['{9240B2F5-1767-4D67-9C9D-780021A81BAE}']
    function getBounds: JRect; cdecl;
    function getText: JString; cdecl;
  end;
  TJTimedText = class(TJavaGenericImport<JTimedTextClass, JTimedText>) end;

  JToneGeneratorClass = interface(JObjectClass)
    ['{2E43AD5A-F8CC-439A-B70E-78EAC7415740}']
    {class} function _GetMAX_VOLUME: Integer; cdecl;
    {class} function _GetMIN_VOLUME: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_ALERT: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_REORDER: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_AUTOREDIAL_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_CALL_GUARD: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_INCALL_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_NETWORK_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ANSWER: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALLDROP_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_NORMAL: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT3: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT5: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT6: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT7: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PING_RING: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI: Integer; cdecl;
    {class} function _GetTONE_CDMA_CONFIRM: Integer; cdecl;
    {class} function _GetTONE_CDMA_DIAL_TONE_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_EMERGENCY_RINGBACK: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_CDMA_KEYPAD_VOLUME_KEY_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_BUSY: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_BUSY_ONE_SHOT: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_CALLWAITING: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_USA_RINGBACK: Integer; cdecl;
    {class} function _GetTONE_CDMA_ONE_MIN_BEEP: Integer; cdecl;
    {class} function _GetTONE_CDMA_PIP: Integer; cdecl;
    {class} function _GetTONE_CDMA_PRESSHOLDKEY_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_REORDER: Integer; cdecl;
    {class} function _GetTONE_CDMA_SIGNAL_OFF: Integer; cdecl;
    {class} function _GetTONE_CDMA_SOFT_ERROR_LITE: Integer; cdecl;
    {class} function _GetTONE_DTMF_0: Integer; cdecl;
    {class} function _GetTONE_DTMF_1: Integer; cdecl;
    {class} function _GetTONE_DTMF_2: Integer; cdecl;
    {class} function _GetTONE_DTMF_3: Integer; cdecl;
    {class} function _GetTONE_DTMF_4: Integer; cdecl;
    {class} function _GetTONE_DTMF_5: Integer; cdecl;
    {class} function _GetTONE_DTMF_6: Integer; cdecl;
    {class} function _GetTONE_DTMF_7: Integer; cdecl;
    {class} function _GetTONE_DTMF_8: Integer; cdecl;
    {class} function _GetTONE_DTMF_9: Integer; cdecl;
    {class} function _GetTONE_DTMF_A: Integer; cdecl;
    {class} function _GetTONE_DTMF_B: Integer; cdecl;
    {class} function _GetTONE_DTMF_C: Integer; cdecl;
    {class} function _GetTONE_DTMF_D: Integer; cdecl;
    {class} function _GetTONE_DTMF_P: Integer; cdecl;
    {class} function _GetTONE_DTMF_S: Integer; cdecl;
    {class} function _GetTONE_PROP_ACK: Integer; cdecl;
    {class} function _GetTONE_PROP_BEEP: Integer; cdecl;
    {class} function _GetTONE_PROP_BEEP2: Integer; cdecl;
    {class} function _GetTONE_PROP_NACK: Integer; cdecl;
    {class} function _GetTONE_PROP_PROMPT: Integer; cdecl;
    {class} function _GetTONE_SUP_BUSY: Integer; cdecl;
    {class} function _GetTONE_SUP_CALL_WAITING: Integer; cdecl;
    {class} function _GetTONE_SUP_CONFIRM: Integer; cdecl;
    {class} function _GetTONE_SUP_CONGESTION: Integer; cdecl;
    {class} function _GetTONE_SUP_CONGESTION_ABBREV: Integer; cdecl;
    {class} function _GetTONE_SUP_DIAL: Integer; cdecl;
    {class} function _GetTONE_SUP_ERROR: Integer; cdecl;
    {class} function _GetTONE_SUP_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_SUP_INTERCEPT_ABBREV: Integer; cdecl;
    {class} function _GetTONE_SUP_PIP: Integer; cdecl;
    {class} function _GetTONE_SUP_RADIO_ACK: Integer; cdecl;
    {class} function _GetTONE_SUP_RADIO_NOTAVAIL: Integer; cdecl;
    {class} function _GetTONE_SUP_RINGTONE: Integer; cdecl;
    {class} function init(streamType: Integer; volume: Integer): JToneGenerator; cdecl;
    {class} property MAX_VOLUME: Integer read _GetMAX_VOLUME;
    {class} property MIN_VOLUME: Integer read _GetMIN_VOLUME;
    {class} property TONE_CDMA_ABBR_ALERT: Integer read _GetTONE_CDMA_ABBR_ALERT;
    {class} property TONE_CDMA_ABBR_INTERCEPT: Integer read _GetTONE_CDMA_ABBR_INTERCEPT;
    {class} property TONE_CDMA_ABBR_REORDER: Integer read _GetTONE_CDMA_ABBR_REORDER;
    {class} property TONE_CDMA_ALERT_AUTOREDIAL_LITE: Integer read _GetTONE_CDMA_ALERT_AUTOREDIAL_LITE;
    {class} property TONE_CDMA_ALERT_CALL_GUARD: Integer read _GetTONE_CDMA_ALERT_CALL_GUARD;
    {class} property TONE_CDMA_ALERT_INCALL_LITE: Integer read _GetTONE_CDMA_ALERT_INCALL_LITE;
    {class} property TONE_CDMA_ALERT_NETWORK_LITE: Integer read _GetTONE_CDMA_ALERT_NETWORK_LITE;
    {class} property TONE_CDMA_ANSWER: Integer read _GetTONE_CDMA_ANSWER;
    {class} property TONE_CDMA_CALLDROP_LITE: Integer read _GetTONE_CDMA_CALLDROP_LITE;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_NORMAL: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_NORMAL;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT3: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT3;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT5: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT5;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT6: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT6;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT7: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT7;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PING_RING: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PING_RING;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI;
    {class} property TONE_CDMA_CONFIRM: Integer read _GetTONE_CDMA_CONFIRM;
    {class} property TONE_CDMA_DIAL_TONE_LITE: Integer read _GetTONE_CDMA_DIAL_TONE_LITE;
    {class} property TONE_CDMA_EMERGENCY_RINGBACK: Integer read _GetTONE_CDMA_EMERGENCY_RINGBACK;
    {class} property TONE_CDMA_HIGH_L: Integer read _GetTONE_CDMA_HIGH_L;
    {class} property TONE_CDMA_HIGH_PBX_L: Integer read _GetTONE_CDMA_HIGH_PBX_L;
    {class} property TONE_CDMA_HIGH_PBX_SLS: Integer read _GetTONE_CDMA_HIGH_PBX_SLS;
    {class} property TONE_CDMA_HIGH_PBX_SS: Integer read _GetTONE_CDMA_HIGH_PBX_SS;
    {class} property TONE_CDMA_HIGH_PBX_SSL: Integer read _GetTONE_CDMA_HIGH_PBX_SSL;
    {class} property TONE_CDMA_HIGH_PBX_S_X4: Integer read _GetTONE_CDMA_HIGH_PBX_S_X4;
    {class} property TONE_CDMA_HIGH_SLS: Integer read _GetTONE_CDMA_HIGH_SLS;
    {class} property TONE_CDMA_HIGH_SS: Integer read _GetTONE_CDMA_HIGH_SS;
    {class} property TONE_CDMA_HIGH_SSL: Integer read _GetTONE_CDMA_HIGH_SSL;
    {class} property TONE_CDMA_HIGH_SS_2: Integer read _GetTONE_CDMA_HIGH_SS_2;
    {class} property TONE_CDMA_HIGH_S_X4: Integer read _GetTONE_CDMA_HIGH_S_X4;
    {class} property TONE_CDMA_INTERCEPT: Integer read _GetTONE_CDMA_INTERCEPT;
    {class} property TONE_CDMA_KEYPAD_VOLUME_KEY_LITE: Integer read _GetTONE_CDMA_KEYPAD_VOLUME_KEY_LITE;
    {class} property TONE_CDMA_LOW_L: Integer read _GetTONE_CDMA_LOW_L;
    {class} property TONE_CDMA_LOW_PBX_L: Integer read _GetTONE_CDMA_LOW_PBX_L;
    {class} property TONE_CDMA_LOW_PBX_SLS: Integer read _GetTONE_CDMA_LOW_PBX_SLS;
    {class} property TONE_CDMA_LOW_PBX_SS: Integer read _GetTONE_CDMA_LOW_PBX_SS;
    {class} property TONE_CDMA_LOW_PBX_SSL: Integer read _GetTONE_CDMA_LOW_PBX_SSL;
    {class} property TONE_CDMA_LOW_PBX_S_X4: Integer read _GetTONE_CDMA_LOW_PBX_S_X4;
    {class} property TONE_CDMA_LOW_SLS: Integer read _GetTONE_CDMA_LOW_SLS;
    {class} property TONE_CDMA_LOW_SS: Integer read _GetTONE_CDMA_LOW_SS;
    {class} property TONE_CDMA_LOW_SSL: Integer read _GetTONE_CDMA_LOW_SSL;
    {class} property TONE_CDMA_LOW_SS_2: Integer read _GetTONE_CDMA_LOW_SS_2;
    {class} property TONE_CDMA_LOW_S_X4: Integer read _GetTONE_CDMA_LOW_S_X4;
    {class} property TONE_CDMA_MED_L: Integer read _GetTONE_CDMA_MED_L;
    {class} property TONE_CDMA_MED_PBX_L: Integer read _GetTONE_CDMA_MED_PBX_L;
    {class} property TONE_CDMA_MED_PBX_SLS: Integer read _GetTONE_CDMA_MED_PBX_SLS;
    {class} property TONE_CDMA_MED_PBX_SS: Integer read _GetTONE_CDMA_MED_PBX_SS;
    {class} property TONE_CDMA_MED_PBX_SSL: Integer read _GetTONE_CDMA_MED_PBX_SSL;
    {class} property TONE_CDMA_MED_PBX_S_X4: Integer read _GetTONE_CDMA_MED_PBX_S_X4;
    {class} property TONE_CDMA_MED_SLS: Integer read _GetTONE_CDMA_MED_SLS;
    {class} property TONE_CDMA_MED_SS: Integer read _GetTONE_CDMA_MED_SS;
    {class} property TONE_CDMA_MED_SSL: Integer read _GetTONE_CDMA_MED_SSL;
    {class} property TONE_CDMA_MED_SS_2: Integer read _GetTONE_CDMA_MED_SS_2;
    {class} property TONE_CDMA_MED_S_X4: Integer read _GetTONE_CDMA_MED_S_X4;
    {class} property TONE_CDMA_NETWORK_BUSY: Integer read _GetTONE_CDMA_NETWORK_BUSY;
    {class} property TONE_CDMA_NETWORK_BUSY_ONE_SHOT: Integer read _GetTONE_CDMA_NETWORK_BUSY_ONE_SHOT;
    {class} property TONE_CDMA_NETWORK_CALLWAITING: Integer read _GetTONE_CDMA_NETWORK_CALLWAITING;
    {class} property TONE_CDMA_NETWORK_USA_RINGBACK: Integer read _GetTONE_CDMA_NETWORK_USA_RINGBACK;
    {class} property TONE_CDMA_ONE_MIN_BEEP: Integer read _GetTONE_CDMA_ONE_MIN_BEEP;
    {class} property TONE_CDMA_PIP: Integer read _GetTONE_CDMA_PIP;
    {class} property TONE_CDMA_PRESSHOLDKEY_LITE: Integer read _GetTONE_CDMA_PRESSHOLDKEY_LITE;
    {class} property TONE_CDMA_REORDER: Integer read _GetTONE_CDMA_REORDER;
    {class} property TONE_CDMA_SIGNAL_OFF: Integer read _GetTONE_CDMA_SIGNAL_OFF;
    {class} property TONE_CDMA_SOFT_ERROR_LITE: Integer read _GetTONE_CDMA_SOFT_ERROR_LITE;
    {class} property TONE_DTMF_0: Integer read _GetTONE_DTMF_0;
    {class} property TONE_DTMF_1: Integer read _GetTONE_DTMF_1;
    {class} property TONE_DTMF_2: Integer read _GetTONE_DTMF_2;
    {class} property TONE_DTMF_3: Integer read _GetTONE_DTMF_3;
    {class} property TONE_DTMF_4: Integer read _GetTONE_DTMF_4;
    {class} property TONE_DTMF_5: Integer read _GetTONE_DTMF_5;
    {class} property TONE_DTMF_6: Integer read _GetTONE_DTMF_6;
    {class} property TONE_DTMF_7: Integer read _GetTONE_DTMF_7;
    {class} property TONE_DTMF_8: Integer read _GetTONE_DTMF_8;
    {class} property TONE_DTMF_9: Integer read _GetTONE_DTMF_9;
    {class} property TONE_DTMF_A: Integer read _GetTONE_DTMF_A;
    {class} property TONE_DTMF_B: Integer read _GetTONE_DTMF_B;
    {class} property TONE_DTMF_C: Integer read _GetTONE_DTMF_C;
    {class} property TONE_DTMF_D: Integer read _GetTONE_DTMF_D;
    {class} property TONE_DTMF_P: Integer read _GetTONE_DTMF_P;
    {class} property TONE_DTMF_S: Integer read _GetTONE_DTMF_S;
    {class} property TONE_PROP_ACK: Integer read _GetTONE_PROP_ACK;
    {class} property TONE_PROP_BEEP: Integer read _GetTONE_PROP_BEEP;
    {class} property TONE_PROP_BEEP2: Integer read _GetTONE_PROP_BEEP2;
    {class} property TONE_PROP_NACK: Integer read _GetTONE_PROP_NACK;
    {class} property TONE_PROP_PROMPT: Integer read _GetTONE_PROP_PROMPT;
    {class} property TONE_SUP_BUSY: Integer read _GetTONE_SUP_BUSY;
    {class} property TONE_SUP_CALL_WAITING: Integer read _GetTONE_SUP_CALL_WAITING;
    {class} property TONE_SUP_CONFIRM: Integer read _GetTONE_SUP_CONFIRM;
    {class} property TONE_SUP_CONGESTION: Integer read _GetTONE_SUP_CONGESTION;
    {class} property TONE_SUP_CONGESTION_ABBREV: Integer read _GetTONE_SUP_CONGESTION_ABBREV;
    {class} property TONE_SUP_DIAL: Integer read _GetTONE_SUP_DIAL;
    {class} property TONE_SUP_ERROR: Integer read _GetTONE_SUP_ERROR;
    {class} property TONE_SUP_INTERCEPT: Integer read _GetTONE_SUP_INTERCEPT;
    {class} property TONE_SUP_INTERCEPT_ABBREV: Integer read _GetTONE_SUP_INTERCEPT_ABBREV;
    {class} property TONE_SUP_PIP: Integer read _GetTONE_SUP_PIP;
    {class} property TONE_SUP_RADIO_ACK: Integer read _GetTONE_SUP_RADIO_ACK;
    {class} property TONE_SUP_RADIO_NOTAVAIL: Integer read _GetTONE_SUP_RADIO_NOTAVAIL;
    {class} property TONE_SUP_RINGTONE: Integer read _GetTONE_SUP_RINGTONE;
  end;

  [JavaSignature('android/media/ToneGenerator')]
  JToneGenerator = interface(JObject)
    ['{F31E2BEF-7899-4B50-8ED2-13547C7AA405}']
    function getAudioSessionId: Integer; cdecl;
    procedure release; cdecl;
    function startTone(toneType: Integer): Boolean; cdecl; overload;
    function startTone(toneType: Integer; durationMs: Integer): Boolean; cdecl; overload;
    procedure stopTone; cdecl;
  end;
  TJToneGenerator = class(TJavaGenericImport<JToneGeneratorClass, JToneGenerator>) end;

  JUnsupportedSchemeExceptionClass = interface(JMediaDrmExceptionClass)
    ['{D5DA0D0E-66A6-4CF4-A98D-A01F66C3E877}']
    {class} function init(detailMessage: JString): JUnsupportedSchemeException; cdecl;
  end;

  [JavaSignature('android/media/UnsupportedSchemeException')]
  JUnsupportedSchemeException = interface(JMediaDrmException)
    ['{B6A003FA-B91A-46B9-83E4-9654A849903C}']
  end;
  TJUnsupportedSchemeException = class(TJavaGenericImport<JUnsupportedSchemeExceptionClass, JUnsupportedSchemeException>) end;

  JVolumeAutomationClass = interface(IJavaClass)
    ['{920B8AE0-9E4E-43DD-A7C1-FF6D170C7E23}']
  end;

  [JavaSignature('android/media/VolumeAutomation')]
  JVolumeAutomation = interface(IJavaInstance)
    ['{51234154-AF39-4C14-B992-3A05FAE0CC77}']
    function createVolumeShaper(configuration: JVolumeShaper_Configuration): JVolumeShaper; cdecl;
  end;
  TJVolumeAutomation = class(TJavaGenericImport<JVolumeAutomationClass, JVolumeAutomation>) end;

  JVolumeProviderClass = interface(JObjectClass)
    ['{178BD28B-46A3-452D-B274-B226800793E4}']
    {class} function _GetVOLUME_CONTROL_ABSOLUTE: Integer; cdecl;
    {class} function _GetVOLUME_CONTROL_FIXED: Integer; cdecl;
    {class} function _GetVOLUME_CONTROL_RELATIVE: Integer; cdecl;
    {class} function init(volumeControl: Integer; maxVolume: Integer; currentVolume: Integer): JVolumeProvider; cdecl; overload;
    {class} function init(volumeControl: Integer; maxVolume: Integer; currentVolume: Integer; volumeControlId: JString): JVolumeProvider; cdecl; overload;
    {class} property VOLUME_CONTROL_ABSOLUTE: Integer read _GetVOLUME_CONTROL_ABSOLUTE;
    {class} property VOLUME_CONTROL_FIXED: Integer read _GetVOLUME_CONTROL_FIXED;
    {class} property VOLUME_CONTROL_RELATIVE: Integer read _GetVOLUME_CONTROL_RELATIVE;
  end;

  [JavaSignature('android/media/VolumeProvider')]
  JVolumeProvider = interface(JObject)
    ['{528B083C-AD72-4845-9AED-186F0347D369}']
    function getCurrentVolume: Integer; cdecl;
    function getMaxVolume: Integer; cdecl;
    function getVolumeControl: Integer; cdecl;
    function getVolumeControlId: JString; cdecl;
    procedure onAdjustVolume(direction: Integer); cdecl;
    procedure onSetVolumeTo(volume: Integer); cdecl;
    procedure setCurrentVolume(currentVolume: Integer); cdecl;
  end;
  TJVolumeProvider = class(TJavaGenericImport<JVolumeProviderClass, JVolumeProvider>) end;

  JVolumeShaperClass = interface(JObjectClass)
    ['{EBBFA8BC-6B9D-4A06-968F-AEDFB268EFD0}']
  end;

  [JavaSignature('android/media/VolumeShaper')]
  JVolumeShaper = interface(JObject)
    ['{17FEB9A6-ECCB-45E5-ABEF-67B582F9F243}']
    procedure apply(operation: JVolumeShaper_Operation); cdecl;
    procedure close; cdecl;
    function getVolume: Single; cdecl;
    procedure replace(configuration: JVolumeShaper_Configuration; operation: JVolumeShaper_Operation; join: Boolean); cdecl;
  end;
  TJVolumeShaper = class(TJavaGenericImport<JVolumeShaperClass, JVolumeShaper>) end;

  JVolumeShaper_ConfigurationClass = interface(JObjectClass)
    ['{72C94BBC-D387-4C62-91F9-4E0D380C6EA5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCUBIC_RAMP: JVolumeShaper_Configuration; cdecl;
    {class} function _GetINTERPOLATOR_TYPE_CUBIC: Integer; cdecl;
    {class} function _GetINTERPOLATOR_TYPE_CUBIC_MONOTONIC: Integer; cdecl;
    {class} function _GetINTERPOLATOR_TYPE_LINEAR: Integer; cdecl;
    {class} function _GetINTERPOLATOR_TYPE_STEP: Integer; cdecl;
    {class} function _GetLINEAR_RAMP: JVolumeShaper_Configuration; cdecl;
    {class} function _GetSCURVE_RAMP: JVolumeShaper_Configuration; cdecl;
    {class} function _GetSINE_RAMP: JVolumeShaper_Configuration; cdecl;
    {class} function getMaximumCurvePoints: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property CUBIC_RAMP: JVolumeShaper_Configuration read _GetCUBIC_RAMP;
    {class} property INTERPOLATOR_TYPE_CUBIC: Integer read _GetINTERPOLATOR_TYPE_CUBIC;
    {class} property INTERPOLATOR_TYPE_CUBIC_MONOTONIC: Integer read _GetINTERPOLATOR_TYPE_CUBIC_MONOTONIC;
    {class} property INTERPOLATOR_TYPE_LINEAR: Integer read _GetINTERPOLATOR_TYPE_LINEAR;
    {class} property INTERPOLATOR_TYPE_STEP: Integer read _GetINTERPOLATOR_TYPE_STEP;
    {class} property LINEAR_RAMP: JVolumeShaper_Configuration read _GetLINEAR_RAMP;
    {class} property SCURVE_RAMP: JVolumeShaper_Configuration read _GetSCURVE_RAMP;
    {class} property SINE_RAMP: JVolumeShaper_Configuration read _GetSINE_RAMP;
  end;

  [JavaSignature('android/media/VolumeShaper$Configuration')]
  JVolumeShaper_Configuration = interface(JObject)
    ['{52AA2ABF-F3D3-4264-ABDD-7DD7624071E9}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDuration: Int64; cdecl;
    function getInterpolatorType: Integer; cdecl;
    function getTimes: TJavaArray<Single>; cdecl;
    function getVolumes: TJavaArray<Single>; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJVolumeShaper_Configuration = class(TJavaGenericImport<JVolumeShaper_ConfigurationClass, JVolumeShaper_Configuration>) end;

  JConfiguration_BuilderClass = interface(JObjectClass)
    ['{A69C3563-6702-4DEC-94DD-395B2650C6F7}']
    {class} function init: JConfiguration_Builder; cdecl; overload;
    {class} function init(configuration: JVolumeShaper_Configuration): JConfiguration_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/VolumeShaper$Configuration$Builder')]
  JConfiguration_Builder = interface(JObject)
    ['{2B398F44-4296-49C1-8A5F-499762F8FE9B}']
    function build: JVolumeShaper_Configuration; cdecl;
    function invertVolumes: JConfiguration_Builder; cdecl;
    function reflectTimes: JConfiguration_Builder; cdecl;
    function scaleToEndVolume(volume: Single): JConfiguration_Builder; cdecl;
    function scaleToStartVolume(volume: Single): JConfiguration_Builder; cdecl;
    function setCurve(times: TJavaArray<Single>; volumes: TJavaArray<Single>): JConfiguration_Builder; cdecl;
    function setDuration(durationMillis: Int64): JConfiguration_Builder; cdecl;
    function setInterpolatorType(interpolatorType: Integer): JConfiguration_Builder; cdecl;
  end;
  TJConfiguration_Builder = class(TJavaGenericImport<JConfiguration_BuilderClass, JConfiguration_Builder>) end;

  JVolumeShaper_OperationClass = interface(JObjectClass)
    ['{32982ADE-AFD9-4175-929C-178A4E566B2C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPLAY: JVolumeShaper_Operation; cdecl;
    {class} function _GetREVERSE: JVolumeShaper_Operation; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PLAY: JVolumeShaper_Operation read _GetPLAY;
    {class} property REVERSE: JVolumeShaper_Operation read _GetREVERSE;
  end;

  [JavaSignature('android/media/VolumeShaper$Operation')]
  JVolumeShaper_Operation = interface(JObject)
    ['{38745E27-771D-4724-AD22-8BF683DBE668}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJVolumeShaper_Operation = class(TJavaGenericImport<JVolumeShaper_OperationClass, JVolumeShaper_Operation>) end;

  JAudioEffectClass = interface(JObjectClass)
    ['{13CBADC9-1D73-46D0-9D39-50F50F8E5EE5}']
    {class} function _GetACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION: JString; cdecl;
    {class} function _GetACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL: JString; cdecl;
    {class} function _GetACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION: JString; cdecl;
    {class} function _GetALREADY_EXISTS: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_GAME: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MOVIE: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MUSIC: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_VOICE: Integer; cdecl;
    {class} function _GetEFFECT_AUXILIARY: JString; cdecl;
    {class} function _GetEFFECT_INSERT: JString; cdecl;
    {class} function _GetEFFECT_POST_PROCESSING: JString; cdecl;
    {class} function _GetEFFECT_PRE_PROCESSING: JString; cdecl;
    {class} function _GetEFFECT_TYPE_AEC: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_AGC: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_BASS_BOOST: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_DYNAMICS_PROCESSING: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_ENV_REVERB: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_EQUALIZER: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_HAPTIC_GENERATOR: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_LOUDNESS_ENHANCER: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_NS: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_PRESET_REVERB: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_VIRTUALIZER: JUUID; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetERROR_NO_INIT: Integer; cdecl;
    {class} function _GetERROR_NO_MEMORY: Integer; cdecl;
    {class} function _GetEXTRA_AUDIO_SESSION: JString; cdecl;
    {class} function _GetEXTRA_CONTENT_TYPE: JString; cdecl;
    {class} function _GetEXTRA_PACKAGE_NAME: JString; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function queryEffects: TJavaObjectArray<JAudioEffect_Descriptor>; cdecl;
    {class} property ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION: JString read _GetACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION;
    {class} property ACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL: JString read _GetACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL;
    {class} property ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION: JString read _GetACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION;
    {class} property ALREADY_EXISTS: Integer read _GetALREADY_EXISTS;
    {class} property CONTENT_TYPE_GAME: Integer read _GetCONTENT_TYPE_GAME;
    {class} property CONTENT_TYPE_MOVIE: Integer read _GetCONTENT_TYPE_MOVIE;
    {class} property CONTENT_TYPE_MUSIC: Integer read _GetCONTENT_TYPE_MUSIC;
    {class} property CONTENT_TYPE_VOICE: Integer read _GetCONTENT_TYPE_VOICE;
    {class} property EFFECT_AUXILIARY: JString read _GetEFFECT_AUXILIARY;
    {class} property EFFECT_INSERT: JString read _GetEFFECT_INSERT;
    {class} property EFFECT_POST_PROCESSING: JString read _GetEFFECT_POST_PROCESSING;
    {class} property EFFECT_PRE_PROCESSING: JString read _GetEFFECT_PRE_PROCESSING;
    {class} property EFFECT_TYPE_AEC: JUUID read _GetEFFECT_TYPE_AEC;
    {class} property EFFECT_TYPE_AGC: JUUID read _GetEFFECT_TYPE_AGC;
    {class} property EFFECT_TYPE_BASS_BOOST: JUUID read _GetEFFECT_TYPE_BASS_BOOST;
    {class} property EFFECT_TYPE_DYNAMICS_PROCESSING: JUUID read _GetEFFECT_TYPE_DYNAMICS_PROCESSING;
    {class} property EFFECT_TYPE_ENV_REVERB: JUUID read _GetEFFECT_TYPE_ENV_REVERB;
    {class} property EFFECT_TYPE_EQUALIZER: JUUID read _GetEFFECT_TYPE_EQUALIZER;
    {class} property EFFECT_TYPE_HAPTIC_GENERATOR: JUUID read _GetEFFECT_TYPE_HAPTIC_GENERATOR;
    {class} property EFFECT_TYPE_LOUDNESS_ENHANCER: JUUID read _GetEFFECT_TYPE_LOUDNESS_ENHANCER;
    {class} property EFFECT_TYPE_NS: JUUID read _GetEFFECT_TYPE_NS;
    {class} property EFFECT_TYPE_PRESET_REVERB: JUUID read _GetEFFECT_TYPE_PRESET_REVERB;
    {class} property EFFECT_TYPE_VIRTUALIZER: JUUID read _GetEFFECT_TYPE_VIRTUALIZER;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property ERROR_NO_INIT: Integer read _GetERROR_NO_INIT;
    {class} property ERROR_NO_MEMORY: Integer read _GetERROR_NO_MEMORY;
    {class} property EXTRA_AUDIO_SESSION: JString read _GetEXTRA_AUDIO_SESSION;
    {class} property EXTRA_CONTENT_TYPE: JString read _GetEXTRA_CONTENT_TYPE;
    {class} property EXTRA_PACKAGE_NAME: JString read _GetEXTRA_PACKAGE_NAME;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/audiofx/AudioEffect')]
  JAudioEffect = interface(JObject)
    ['{B494B3B3-1965-4831-9006-E22DC339A6C9}']
    function getDescriptor: JAudioEffect_Descriptor; cdecl;
    function getEnabled: Boolean; cdecl;
    function getId: Integer; cdecl;
    function hasControl: Boolean; cdecl;
    procedure release; cdecl;
    procedure setControlStatusListener(listener: JAudioEffect_OnControlStatusChangeListener); cdecl;
    procedure setEnableStatusListener(listener: JAudioEffect_OnEnableStatusChangeListener); cdecl;
    function setEnabled(enabled: Boolean): Integer; cdecl;
  end;
  TJAudioEffect = class(TJavaGenericImport<JAudioEffectClass, JAudioEffect>) end;

  JAcousticEchoCancelerClass = interface(JAudioEffectClass)
    ['{460A7A72-477C-497E-8D78-1BC0E9A71276}']
    {class} function create(audioSession: Integer): JAcousticEchoCanceler; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/AcousticEchoCanceler')]
  JAcousticEchoCanceler = interface(JAudioEffect)
    ['{DD17BEFF-C337-4979-A5DA-7A5B51C8BED5}']
  end;
  TJAcousticEchoCanceler = class(TJavaGenericImport<JAcousticEchoCancelerClass, JAcousticEchoCanceler>) end;

  JAudioEffect_DescriptorClass = interface(JObjectClass)
    ['{9A3069D0-C184-480C-B71E-20295F8F478D}']
    {class} function init: JAudioEffect_Descriptor; cdecl; overload;
    {class} function init(type_: JString; uuid: JString; connectMode: JString; name: JString; implementor: JString): JAudioEffect_Descriptor; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$Descriptor')]
  JAudioEffect_Descriptor = interface(JObject)
    ['{51401F65-35F1-4271-88E5-9991F790D845}']
    function _GetconnectMode: JString; cdecl;
    procedure _SetconnectMode(Value: JString); cdecl;
    function _Getimplementor: JString; cdecl;
    procedure _Setimplementor(Value: JString); cdecl;
    function _Getname: JString; cdecl;
    procedure _Setname(Value: JString); cdecl;
    function _Gettype: JUUID; cdecl;
    procedure _Settype(Value: JUUID); cdecl;
    function _Getuuid: JUUID; cdecl;
    procedure _Setuuid(Value: JUUID); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property connectMode: JString read _GetconnectMode write _SetconnectMode;
    property implementor: JString read _Getimplementor write _Setimplementor;
    property name: JString read _Getname write _Setname;
    property &type: JUUID read _Gettype write _Settype;
    property uuid: JUUID read _Getuuid write _Setuuid;
  end;
  TJAudioEffect_Descriptor = class(TJavaGenericImport<JAudioEffect_DescriptorClass, JAudioEffect_Descriptor>) end;

  JAudioEffect_OnControlStatusChangeListenerClass = interface(IJavaClass)
    ['{77DA1E79-25E0-48F3-B55B-9D716AE5D500}']
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$OnControlStatusChangeListener')]
  JAudioEffect_OnControlStatusChangeListener = interface(IJavaInstance)
    ['{C3C4A416-A600-46BB-8710-0FCFEFA42076}']
    procedure onControlStatusChange(effect: JAudioEffect; controlGranted: Boolean); cdecl;
  end;
  TJAudioEffect_OnControlStatusChangeListener = class(TJavaGenericImport<JAudioEffect_OnControlStatusChangeListenerClass, JAudioEffect_OnControlStatusChangeListener>) end;

  JAudioEffect_OnEnableStatusChangeListenerClass = interface(IJavaClass)
    ['{98D458F7-D2B6-412A-BE43-6825ACA42EA8}']
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$OnEnableStatusChangeListener')]
  JAudioEffect_OnEnableStatusChangeListener = interface(IJavaInstance)
    ['{F2A3F549-058B-4354-A8B2-508B65EC88AF}']
    procedure onEnableStatusChange(effect: JAudioEffect; enabled: Boolean); cdecl;
  end;
  TJAudioEffect_OnEnableStatusChangeListener = class(TJavaGenericImport<JAudioEffect_OnEnableStatusChangeListenerClass, JAudioEffect_OnEnableStatusChangeListener>) end;

  JAutomaticGainControlClass = interface(JAudioEffectClass)
    ['{D3C90786-5E89-4FF8-8D7E-9E79A05CBB6A}']
    {class} function create(audioSession: Integer): JAutomaticGainControl; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/AutomaticGainControl')]
  JAutomaticGainControl = interface(JAudioEffect)
    ['{36F93C00-2A45-4AD0-B880-F79B56FE4096}']
  end;
  TJAutomaticGainControl = class(TJavaGenericImport<JAutomaticGainControlClass, JAutomaticGainControl>) end;

  JBassBoostClass = interface(JAudioEffectClass)
    ['{A209500F-399B-4AD4-B8BB-7D8E574B745E}']
    {class} function _GetPARAM_STRENGTH: Integer; cdecl;
    {class} function _GetPARAM_STRENGTH_SUPPORTED: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JBassBoost; cdecl;
    {class} property PARAM_STRENGTH: Integer read _GetPARAM_STRENGTH;
    {class} property PARAM_STRENGTH_SUPPORTED: Integer read _GetPARAM_STRENGTH_SUPPORTED;
  end;

  [JavaSignature('android/media/audiofx/BassBoost')]
  JBassBoost = interface(JAudioEffect)
    ['{38228576-3D9D-42B1-82AD-30EA32654FDD}']
    function getProperties: JBassBoost_Settings; cdecl;
    function getRoundedStrength: SmallInt; cdecl;
    function getStrengthSupported: Boolean; cdecl;
    procedure setParameterListener(listener: JBassBoost_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JBassBoost_Settings); cdecl;
    procedure setStrength(strength: SmallInt); cdecl;
  end;
  TJBassBoost = class(TJavaGenericImport<JBassBoostClass, JBassBoost>) end;

  JBassBoost_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{BFF4F1F8-5F21-47A9-BBB5-3EEE6066B689}']
  end;

  [JavaSignature('android/media/audiofx/BassBoost$OnParameterChangeListener')]
  JBassBoost_OnParameterChangeListener = interface(IJavaInstance)
    ['{CF34C515-408C-4ED9-8D9A-C1F73EA0CDAB}']
    procedure onParameterChange(effect: JBassBoost; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJBassBoost_OnParameterChangeListener = class(TJavaGenericImport<JBassBoost_OnParameterChangeListenerClass, JBassBoost_OnParameterChangeListener>) end;

  JBassBoost_SettingsClass = interface(JObjectClass)
    ['{16961C98-3B24-451A-A990-83E334394621}']
    {class} function init: JBassBoost_Settings; cdecl; overload;
    {class} function init(settings: JString): JBassBoost_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/BassBoost$Settings')]
  JBassBoost_Settings = interface(JObject)
    ['{126672AC-6E3E-4118-85C0-52A19083384F}']
    function _Getstrength: SmallInt; cdecl;
    procedure _Setstrength(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property strength: SmallInt read _Getstrength write _Setstrength;
  end;
  TJBassBoost_Settings = class(TJavaGenericImport<JBassBoost_SettingsClass, JBassBoost_Settings>) end;

  JDynamicsProcessingClass = interface(JAudioEffectClass)
    ['{57A7C172-DD4E-4E14-BAC1-154E9C5D7158}']
    {class} function _GetVARIANT_FAVOR_FREQUENCY_RESOLUTION: Integer; cdecl;
    {class} function _GetVARIANT_FAVOR_TIME_RESOLUTION: Integer; cdecl;
    {class} function init(audioSession: Integer): JDynamicsProcessing; cdecl; overload;
    {class} function init(priority: Integer; audioSession: Integer; cfg: JDynamicsProcessing_Config): JDynamicsProcessing; cdecl; overload;
    {class} property VARIANT_FAVOR_FREQUENCY_RESOLUTION: Integer read _GetVARIANT_FAVOR_FREQUENCY_RESOLUTION;
    {class} property VARIANT_FAVOR_TIME_RESOLUTION: Integer read _GetVARIANT_FAVOR_TIME_RESOLUTION;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing')]
  JDynamicsProcessing = interface(JAudioEffect)
    ['{57E279FF-4AAE-4C9A-9548-A5BDF30E1D00}']
    function getChannelByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Channel; cdecl;
    function getChannelCount: Integer; cdecl;
    function getConfig: JDynamicsProcessing_Config; cdecl;
    function getInputGainByChannelIndex(channelIndex: Integer): Single; cdecl;
    function getLimiterByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Limiter; cdecl;
    function getMbcBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_MbcBand; cdecl;
    function getMbcByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Mbc; cdecl;
    function getPostEqBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_EqBand; cdecl;
    function getPostEqByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Eq; cdecl;
    function getPreEqBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_EqBand; cdecl;
    function getPreEqByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Eq; cdecl;
    procedure setAllChannelsTo(channel: JDynamicsProcessing_Channel); cdecl;
    procedure setChannelTo(channelIndex: Integer; channel: JDynamicsProcessing_Channel); cdecl;
    procedure setInputGainAllChannelsTo(inputGain: Single); cdecl;
    procedure setInputGainbyChannel(channelIndex: Integer; inputGain: Single); cdecl;
    procedure setLimiterAllChannelsTo(limiter: JDynamicsProcessing_Limiter); cdecl;
    procedure setLimiterByChannelIndex(channelIndex: Integer; limiter: JDynamicsProcessing_Limiter); cdecl;
    procedure setMbcAllChannelsTo(mbc: JDynamicsProcessing_Mbc); cdecl;
    procedure setMbcBandAllChannelsTo(band: Integer; mbcBand: JDynamicsProcessing_MbcBand); cdecl;
    procedure setMbcBandByChannelIndex(channelIndex: Integer; band: Integer; mbcBand: JDynamicsProcessing_MbcBand); cdecl;
    procedure setMbcByChannelIndex(channelIndex: Integer; mbc: JDynamicsProcessing_Mbc); cdecl;
    procedure setPostEqAllChannelsTo(postEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPostEqBandAllChannelsTo(band: Integer; postEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPostEqBandByChannelIndex(channelIndex: Integer; band: Integer; postEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPostEqByChannelIndex(channelIndex: Integer; postEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPreEqAllChannelsTo(preEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPreEqBandAllChannelsTo(band: Integer; preEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPreEqBandByChannelIndex(channelIndex: Integer; band: Integer; preEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPreEqByChannelIndex(channelIndex: Integer; preEq: JDynamicsProcessing_Eq); cdecl;
  end;
  TJDynamicsProcessing = class(TJavaGenericImport<JDynamicsProcessingClass, JDynamicsProcessing>) end;

  JDynamicsProcessing_BandBaseClass = interface(JObjectClass)
    ['{865ADB30-A86E-4846-B358-0E6BBF22ED2F}']
    {class} function init(enabled: Boolean; cutoffFrequency: Single): JDynamicsProcessing_BandBase; cdecl;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$BandBase')]
  JDynamicsProcessing_BandBase = interface(JObject)
    ['{495744CB-C579-498F-8C65-A7D18D4CF7D9}']
    function getCutoffFrequency: Single; cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setCutoffFrequency(frequency: Single); cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_BandBase = class(TJavaGenericImport<JDynamicsProcessing_BandBaseClass, JDynamicsProcessing_BandBase>) end;

  JDynamicsProcessing_StageClass = interface(JObjectClass)
    ['{C3C33EE8-3C67-4D21-B412-5A58CD29AAA7}']
    {class} function init(inUse: Boolean; enabled: Boolean): JDynamicsProcessing_Stage; cdecl;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Stage')]
  JDynamicsProcessing_Stage = interface(JObject)
    ['{4B495E86-5631-4F7D-BF9B-DA371EDD7367}']
    function isEnabled: Boolean; cdecl;
    function isInUse: Boolean; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Stage = class(TJavaGenericImport<JDynamicsProcessing_StageClass, JDynamicsProcessing_Stage>) end;

  JDynamicsProcessing_BandStageClass = interface(JDynamicsProcessing_StageClass)
    ['{409A3536-3EA4-4A49-A7AE-144390A403E0}']
    {class} function init(inUse: Boolean; enabled: Boolean; bandCount: Integer): JDynamicsProcessing_BandStage; cdecl;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$BandStage')]
  JDynamicsProcessing_BandStage = interface(JDynamicsProcessing_Stage)
    ['{972C6001-5B9A-4921-BE98-862A1D67C280}']
    function getBandCount: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_BandStage = class(TJavaGenericImport<JDynamicsProcessing_BandStageClass, JDynamicsProcessing_BandStage>) end;

  JDynamicsProcessing_ChannelClass = interface(JObjectClass)
    ['{7A9C91DF-738B-4BB8-A461-B1B6946F6309}']
    {class} function init(inputGain: Single; preEqInUse: Boolean; preEqBandCount: Integer; mbcInUse: Boolean; mbcBandCount: Integer; postEqInUse: Boolean; postEqBandCount: Integer; limiterInUse: Boolean): JDynamicsProcessing_Channel; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_Channel): JDynamicsProcessing_Channel; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Channel')]
  JDynamicsProcessing_Channel = interface(JObject)
    ['{4A783C3C-FE28-46A4-91D3-19285ADC4D46}']
    function getInputGain: Single; cdecl;
    function getLimiter: JDynamicsProcessing_Limiter; cdecl;
    function getMbc: JDynamicsProcessing_Mbc; cdecl;
    function getMbcBand(band: Integer): JDynamicsProcessing_MbcBand; cdecl;
    function getPostEq: JDynamicsProcessing_Eq; cdecl;
    function getPostEqBand(band: Integer): JDynamicsProcessing_EqBand; cdecl;
    function getPreEq: JDynamicsProcessing_Eq; cdecl;
    function getPreEqBand(band: Integer): JDynamicsProcessing_EqBand; cdecl;
    procedure setInputGain(inputGain: Single); cdecl;
    procedure setLimiter(limiter: JDynamicsProcessing_Limiter); cdecl;
    procedure setMbc(mbc: JDynamicsProcessing_Mbc); cdecl;
    procedure setMbcBand(band: Integer; mbcBand: JDynamicsProcessing_MbcBand); cdecl;
    procedure setPostEq(postEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPostEqBand(band: Integer; postEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPreEq(preEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPreEqBand(band: Integer; preEqBand: JDynamicsProcessing_EqBand); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Channel = class(TJavaGenericImport<JDynamicsProcessing_ChannelClass, JDynamicsProcessing_Channel>) end;

  JDynamicsProcessing_ConfigClass = interface(JObjectClass)
    ['{867BCF27-075F-41B5-A038-232186A284A9}']
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Config')]
  JDynamicsProcessing_Config = interface(JObject)
    ['{F8F50CE4-F8AD-427C-8BF4-03431D1341FB}']
    function getChannelByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Channel; cdecl;
    function getInputGainByChannelIndex(channelIndex: Integer): Single; cdecl;
    function getLimiterByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Limiter; cdecl;
    function getMbcBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_MbcBand; cdecl;
    function getMbcBandCount: Integer; cdecl;
    function getMbcByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Mbc; cdecl;
    function getPostEqBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_EqBand; cdecl;
    function getPostEqBandCount: Integer; cdecl;
    function getPostEqByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Eq; cdecl;
    function getPreEqBandByChannelIndex(channelIndex: Integer; band: Integer): JDynamicsProcessing_EqBand; cdecl;
    function getPreEqBandCount: Integer; cdecl;
    function getPreEqByChannelIndex(channelIndex: Integer): JDynamicsProcessing_Eq; cdecl;
    function getPreferredFrameDuration: Single; cdecl;
    function getVariant: Integer; cdecl;
    function isLimiterInUse: Boolean; cdecl;
    function isMbcInUse: Boolean; cdecl;
    function isPostEqInUse: Boolean; cdecl;
    function isPreEqInUse: Boolean; cdecl;
    procedure setAllChannelsTo(channel: JDynamicsProcessing_Channel); cdecl;
    procedure setChannelTo(channelIndex: Integer; channel: JDynamicsProcessing_Channel); cdecl;
    procedure setInputGainAllChannelsTo(inputGain: Single); cdecl;
    procedure setInputGainByChannelIndex(channelIndex: Integer; inputGain: Single); cdecl;
    procedure setLimiterAllChannelsTo(limiter: JDynamicsProcessing_Limiter); cdecl;
    procedure setLimiterByChannelIndex(channelIndex: Integer; limiter: JDynamicsProcessing_Limiter); cdecl;
    procedure setMbcAllChannelsTo(mbc: JDynamicsProcessing_Mbc); cdecl;
    procedure setMbcBandAllChannelsTo(band: Integer; mbcBand: JDynamicsProcessing_MbcBand); cdecl;
    procedure setMbcBandByChannelIndex(channelIndex: Integer; band: Integer; mbcBand: JDynamicsProcessing_MbcBand); cdecl;
    procedure setMbcByChannelIndex(channelIndex: Integer; mbc: JDynamicsProcessing_Mbc); cdecl;
    procedure setPostEqAllChannelsTo(postEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPostEqBandAllChannelsTo(band: Integer; postEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPostEqBandByChannelIndex(channelIndex: Integer; band: Integer; postEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPostEqByChannelIndex(channelIndex: Integer; postEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPreEqAllChannelsTo(preEq: JDynamicsProcessing_Eq); cdecl;
    procedure setPreEqBandAllChannelsTo(band: Integer; preEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPreEqBandByChannelIndex(channelIndex: Integer; band: Integer; preEqBand: JDynamicsProcessing_EqBand); cdecl;
    procedure setPreEqByChannelIndex(channelIndex: Integer; preEq: JDynamicsProcessing_Eq); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Config = class(TJavaGenericImport<JDynamicsProcessing_ConfigClass, JDynamicsProcessing_Config>) end;

  JConfig_BuilderClass = interface(JObjectClass)
    ['{F003DBF1-6A92-4650-9414-E59039C1D96F}']
    {class} function init(variant: Integer; channelCount: Integer; preEqInUse: Boolean; preEqBandCount: Integer; mbcInUse: Boolean; mbcBandCount: Integer; postEqInUse: Boolean; postEqBandCount: Integer; limiterInUse: Boolean): JConfig_Builder; cdecl;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Config$Builder')]
  JConfig_Builder = interface(JObject)
    ['{79D5F2A6-B321-4166-8721-5624C75B3068}']
    function build: JDynamicsProcessing_Config; cdecl;
    function setAllChannelsTo(channel: JDynamicsProcessing_Channel): JConfig_Builder; cdecl;
    function setChannelTo(channelIndex: Integer; channel: JDynamicsProcessing_Channel): JConfig_Builder; cdecl;
    function setInputGainAllChannelsTo(inputGain: Single): JConfig_Builder; cdecl;
    function setInputGainByChannelIndex(channelIndex: Integer; inputGain: Single): JConfig_Builder; cdecl;
    function setLimiterAllChannelsTo(limiter: JDynamicsProcessing_Limiter): JConfig_Builder; cdecl;
    function setLimiterByChannelIndex(channelIndex: Integer; limiter: JDynamicsProcessing_Limiter): JConfig_Builder; cdecl;
    function setMbcAllChannelsTo(mbc: JDynamicsProcessing_Mbc): JConfig_Builder; cdecl;
    function setMbcByChannelIndex(channelIndex: Integer; mbc: JDynamicsProcessing_Mbc): JConfig_Builder; cdecl;
    function setPostEqAllChannelsTo(postEq: JDynamicsProcessing_Eq): JConfig_Builder; cdecl;
    function setPostEqByChannelIndex(channelIndex: Integer; postEq: JDynamicsProcessing_Eq): JConfig_Builder; cdecl;
    function setPreEqAllChannelsTo(preEq: JDynamicsProcessing_Eq): JConfig_Builder; cdecl;
    function setPreEqByChannelIndex(channelIndex: Integer; preEq: JDynamicsProcessing_Eq): JConfig_Builder; cdecl;
    function setPreferredFrameDuration(frameDuration: Single): JConfig_Builder; cdecl;
  end;
  TJConfig_Builder = class(TJavaGenericImport<JConfig_BuilderClass, JConfig_Builder>) end;

  JDynamicsProcessing_EqClass = interface(JDynamicsProcessing_BandStageClass)
    ['{0D97A3AB-AD55-4E65-94F7-D549B64FB1A7}']
    {class} function init(inUse: Boolean; enabled: Boolean; bandCount: Integer): JDynamicsProcessing_Eq; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_Eq): JDynamicsProcessing_Eq; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Eq')]
  JDynamicsProcessing_Eq = interface(JDynamicsProcessing_BandStage)
    ['{1FDD2086-844B-4A85-A348-23BA05BC54E6}']
    function getBand(band: Integer): JDynamicsProcessing_EqBand; cdecl;
    procedure setBand(band: Integer; bandCfg: JDynamicsProcessing_EqBand); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Eq = class(TJavaGenericImport<JDynamicsProcessing_EqClass, JDynamicsProcessing_Eq>) end;

  JDynamicsProcessing_EqBandClass = interface(JDynamicsProcessing_BandBaseClass)
    ['{18F7E340-535A-4A3A-810E-0F448F9B23CF}']
    {class} function init(enabled: Boolean; cutoffFrequency: Single; gain: Single): JDynamicsProcessing_EqBand; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_EqBand): JDynamicsProcessing_EqBand; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$EqBand')]
  JDynamicsProcessing_EqBand = interface(JDynamicsProcessing_BandBase)
    ['{C94C3B7A-842F-4C48-9892-F2D25026C236}']
    function getGain: Single; cdecl;
    procedure setGain(gain: Single); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_EqBand = class(TJavaGenericImport<JDynamicsProcessing_EqBandClass, JDynamicsProcessing_EqBand>) end;

  JDynamicsProcessing_LimiterClass = interface(JDynamicsProcessing_StageClass)
    ['{EDCDF22F-BE8D-4062-B091-44CEC761DDD1}']
    {class} function init(inUse: Boolean; enabled: Boolean; linkGroup: Integer; attackTime: Single; releaseTime: Single; ratio: Single; threshold: Single; postGain: Single): JDynamicsProcessing_Limiter; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_Limiter): JDynamicsProcessing_Limiter; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Limiter')]
  JDynamicsProcessing_Limiter = interface(JDynamicsProcessing_Stage)
    ['{8E42136A-51B0-446C-918C-0CF890B58455}']
    function getAttackTime: Single; cdecl;
    function getLinkGroup: Integer; cdecl;
    function getPostGain: Single; cdecl;
    function getRatio: Single; cdecl;
    function getReleaseTime: Single; cdecl;
    function getThreshold: Single; cdecl;
    procedure setAttackTime(attackTime: Single); cdecl;
    procedure setLinkGroup(linkGroup: Integer); cdecl;
    procedure setPostGain(postGain: Single); cdecl;
    procedure setRatio(ratio: Single); cdecl;
    procedure setReleaseTime(releaseTime: Single); cdecl;
    procedure setThreshold(threshold: Single); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Limiter = class(TJavaGenericImport<JDynamicsProcessing_LimiterClass, JDynamicsProcessing_Limiter>) end;

  JDynamicsProcessing_MbcClass = interface(JDynamicsProcessing_BandStageClass)
    ['{50610D4D-ACA5-4585-892A-B629128D2313}']
    {class} function init(inUse: Boolean; enabled: Boolean; bandCount: Integer): JDynamicsProcessing_Mbc; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_Mbc): JDynamicsProcessing_Mbc; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$Mbc')]
  JDynamicsProcessing_Mbc = interface(JDynamicsProcessing_BandStage)
    ['{9052893A-740E-4E65-9A0A-09C997D5AE03}']
    function getBand(band: Integer): JDynamicsProcessing_MbcBand; cdecl;
    procedure setBand(band: Integer; bandCfg: JDynamicsProcessing_MbcBand); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_Mbc = class(TJavaGenericImport<JDynamicsProcessing_MbcClass, JDynamicsProcessing_Mbc>) end;

  JDynamicsProcessing_MbcBandClass = interface(JDynamicsProcessing_BandBaseClass)
    ['{678B2EF8-55A2-44BD-A0F4-4743046E7110}']
    {class} function init(enabled: Boolean; cutoffFrequency: Single; attackTime: Single; releaseTime: Single; ratio: Single; threshold: Single; kneeWidth: Single; noiseGateThreshold: Single; expanderRatio: Single; preGain: Single; postGain: Single): JDynamicsProcessing_MbcBand; cdecl; overload;
    {class} function init(cfg: JDynamicsProcessing_MbcBand): JDynamicsProcessing_MbcBand; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/DynamicsProcessing$MbcBand')]
  JDynamicsProcessing_MbcBand = interface(JDynamicsProcessing_BandBase)
    ['{E8394C2B-B31E-4927-BFAA-D6D3D3A274C1}']
    function getAttackTime: Single; cdecl;
    function getExpanderRatio: Single; cdecl;
    function getKneeWidth: Single; cdecl;
    function getNoiseGateThreshold: Single; cdecl;
    function getPostGain: Single; cdecl;
    function getPreGain: Single; cdecl;
    function getRatio: Single; cdecl;
    function getReleaseTime: Single; cdecl;
    function getThreshold: Single; cdecl;
    procedure setAttackTime(attackTime: Single); cdecl;
    procedure setExpanderRatio(expanderRatio: Single); cdecl;
    procedure setKneeWidth(kneeWidth: Single); cdecl;
    procedure setNoiseGateThreshold(noiseGateThreshold: Single); cdecl;
    procedure setPostGain(postGain: Single); cdecl;
    procedure setPreGain(preGain: Single); cdecl;
    procedure setRatio(ratio: Single); cdecl;
    procedure setReleaseTime(releaseTime: Single); cdecl;
    procedure setThreshold(threshold: Single); cdecl;
    function toString: JString; cdecl;
  end;
  TJDynamicsProcessing_MbcBand = class(TJavaGenericImport<JDynamicsProcessing_MbcBandClass, JDynamicsProcessing_MbcBand>) end;

  JEnvironmentalReverbClass = interface(JAudioEffectClass)
    ['{6BDA0E80-3384-4B98-8145-F15D5728C3A6}']
    {class} function _GetPARAM_DECAY_HF_RATIO: Integer; cdecl;
    {class} function _GetPARAM_DECAY_TIME: Integer; cdecl;
    {class} function _GetPARAM_DENSITY: Integer; cdecl;
    {class} function _GetPARAM_DIFFUSION: Integer; cdecl;
    {class} function _GetPARAM_REFLECTIONS_DELAY: Integer; cdecl;
    {class} function _GetPARAM_REFLECTIONS_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_REVERB_DELAY: Integer; cdecl;
    {class} function _GetPARAM_REVERB_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_ROOM_HF_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_ROOM_LEVEL: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JEnvironmentalReverb; cdecl;
    {class} property PARAM_DECAY_HF_RATIO: Integer read _GetPARAM_DECAY_HF_RATIO;
    {class} property PARAM_DECAY_TIME: Integer read _GetPARAM_DECAY_TIME;
    {class} property PARAM_DENSITY: Integer read _GetPARAM_DENSITY;
    {class} property PARAM_DIFFUSION: Integer read _GetPARAM_DIFFUSION;
    {class} property PARAM_REFLECTIONS_DELAY: Integer read _GetPARAM_REFLECTIONS_DELAY;
    {class} property PARAM_REFLECTIONS_LEVEL: Integer read _GetPARAM_REFLECTIONS_LEVEL;
    {class} property PARAM_REVERB_DELAY: Integer read _GetPARAM_REVERB_DELAY;
    {class} property PARAM_REVERB_LEVEL: Integer read _GetPARAM_REVERB_LEVEL;
    {class} property PARAM_ROOM_HF_LEVEL: Integer read _GetPARAM_ROOM_HF_LEVEL;
    {class} property PARAM_ROOM_LEVEL: Integer read _GetPARAM_ROOM_LEVEL;
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb')]
  JEnvironmentalReverb = interface(JAudioEffect)
    ['{94A98733-66B8-4C17-B49C-5AD18808F3DB}']
    function getDecayHFRatio: SmallInt; cdecl;
    function getDecayTime: Integer; cdecl;
    function getDensity: SmallInt; cdecl;
    function getDiffusion: SmallInt; cdecl;
    function getProperties: JEnvironmentalReverb_Settings; cdecl;
    function getReflectionsDelay: Integer; cdecl;
    function getReflectionsLevel: SmallInt; cdecl;
    function getReverbDelay: Integer; cdecl;
    function getReverbLevel: SmallInt; cdecl;
    function getRoomHFLevel: SmallInt; cdecl;
    function getRoomLevel: SmallInt; cdecl;
    procedure setDecayHFRatio(decayHFRatio: SmallInt); cdecl;
    procedure setDecayTime(decayTime: Integer); cdecl;
    procedure setDensity(density: SmallInt); cdecl;
    procedure setDiffusion(diffusion: SmallInt); cdecl;
    procedure setParameterListener(listener: JEnvironmentalReverb_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JEnvironmentalReverb_Settings); cdecl;
    procedure setReflectionsDelay(reflectionsDelay: Integer); cdecl;
    procedure setReflectionsLevel(reflectionsLevel: SmallInt); cdecl;
    procedure setReverbDelay(reverbDelay: Integer); cdecl;
    procedure setReverbLevel(reverbLevel: SmallInt); cdecl;
    procedure setRoomHFLevel(roomHF: SmallInt); cdecl;
    procedure setRoomLevel(room: SmallInt); cdecl;
  end;
  TJEnvironmentalReverb = class(TJavaGenericImport<JEnvironmentalReverbClass, JEnvironmentalReverb>) end;

  JEnvironmentalReverb_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{51B7A404-EFBC-402C-AEA7-59B0E9ADABEE}']
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb$OnParameterChangeListener')]
  JEnvironmentalReverb_OnParameterChangeListener = interface(IJavaInstance)
    ['{2D4E8354-BD92-4AC9-8907-0B63369AA1CF}']
    procedure onParameterChange(effect: JEnvironmentalReverb; status: Integer; param: Integer; value: Integer); cdecl;
  end;
  TJEnvironmentalReverb_OnParameterChangeListener = class(TJavaGenericImport<JEnvironmentalReverb_OnParameterChangeListenerClass, JEnvironmentalReverb_OnParameterChangeListener>) end;

  JEnvironmentalReverb_SettingsClass = interface(JObjectClass)
    ['{552A5CB8-6E2A-4F05-ABCB-0C4947BADB69}']
    {class} function init: JEnvironmentalReverb_Settings; cdecl; overload;
    {class} function init(settings: JString): JEnvironmentalReverb_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb$Settings')]
  JEnvironmentalReverb_Settings = interface(JObject)
    ['{8456E091-3040-4D39-A819-68433D6B5C08}']
    function _GetdecayHFRatio: SmallInt; cdecl;
    procedure _SetdecayHFRatio(Value: SmallInt); cdecl;
    function _GetdecayTime: Integer; cdecl;
    procedure _SetdecayTime(Value: Integer); cdecl;
    function _Getdensity: SmallInt; cdecl;
    procedure _Setdensity(Value: SmallInt); cdecl;
    function _Getdiffusion: SmallInt; cdecl;
    procedure _Setdiffusion(Value: SmallInt); cdecl;
    function _GetreflectionsDelay: Integer; cdecl;
    procedure _SetreflectionsDelay(Value: Integer); cdecl;
    function _GetreflectionsLevel: SmallInt; cdecl;
    procedure _SetreflectionsLevel(Value: SmallInt); cdecl;
    function _GetreverbDelay: Integer; cdecl;
    procedure _SetreverbDelay(Value: Integer); cdecl;
    function _GetreverbLevel: SmallInt; cdecl;
    procedure _SetreverbLevel(Value: SmallInt); cdecl;
    function _GetroomHFLevel: SmallInt; cdecl;
    procedure _SetroomHFLevel(Value: SmallInt); cdecl;
    function _GetroomLevel: SmallInt; cdecl;
    procedure _SetroomLevel(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property decayHFRatio: SmallInt read _GetdecayHFRatio write _SetdecayHFRatio;
    property decayTime: Integer read _GetdecayTime write _SetdecayTime;
    property density: SmallInt read _Getdensity write _Setdensity;
    property diffusion: SmallInt read _Getdiffusion write _Setdiffusion;
    property reflectionsDelay: Integer read _GetreflectionsDelay write _SetreflectionsDelay;
    property reflectionsLevel: SmallInt read _GetreflectionsLevel write _SetreflectionsLevel;
    property reverbDelay: Integer read _GetreverbDelay write _SetreverbDelay;
    property reverbLevel: SmallInt read _GetreverbLevel write _SetreverbLevel;
    property roomHFLevel: SmallInt read _GetroomHFLevel write _SetroomHFLevel;
    property roomLevel: SmallInt read _GetroomLevel write _SetroomLevel;
  end;
  TJEnvironmentalReverb_Settings = class(TJavaGenericImport<JEnvironmentalReverb_SettingsClass, JEnvironmentalReverb_Settings>) end;

  JEqualizerClass = interface(JAudioEffectClass)
    ['{C4A093C1-0B55-4362-850E-FD34701A91F6}']
    {class} function _GetPARAM_BAND_FREQ_RANGE: Integer; cdecl;
    {class} function _GetPARAM_BAND_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_CENTER_FREQ: Integer; cdecl;
    {class} function _GetPARAM_CURRENT_PRESET: Integer; cdecl;
    {class} function _GetPARAM_GET_BAND: Integer; cdecl;
    {class} function _GetPARAM_GET_NUM_OF_PRESETS: Integer; cdecl;
    {class} function _GetPARAM_GET_PRESET_NAME: Integer; cdecl;
    {class} function _GetPARAM_LEVEL_RANGE: Integer; cdecl;
    {class} function _GetPARAM_NUM_BANDS: Integer; cdecl;
    {class} function _GetPARAM_STRING_SIZE_MAX: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JEqualizer; cdecl;
    {class} property PARAM_BAND_FREQ_RANGE: Integer read _GetPARAM_BAND_FREQ_RANGE;
    {class} property PARAM_BAND_LEVEL: Integer read _GetPARAM_BAND_LEVEL;
    {class} property PARAM_CENTER_FREQ: Integer read _GetPARAM_CENTER_FREQ;
    {class} property PARAM_CURRENT_PRESET: Integer read _GetPARAM_CURRENT_PRESET;
    {class} property PARAM_GET_BAND: Integer read _GetPARAM_GET_BAND;
    {class} property PARAM_GET_NUM_OF_PRESETS: Integer read _GetPARAM_GET_NUM_OF_PRESETS;
    {class} property PARAM_GET_PRESET_NAME: Integer read _GetPARAM_GET_PRESET_NAME;
    {class} property PARAM_LEVEL_RANGE: Integer read _GetPARAM_LEVEL_RANGE;
    {class} property PARAM_NUM_BANDS: Integer read _GetPARAM_NUM_BANDS;
    {class} property PARAM_STRING_SIZE_MAX: Integer read _GetPARAM_STRING_SIZE_MAX;
  end;

  [JavaSignature('android/media/audiofx/Equalizer')]
  JEqualizer = interface(JAudioEffect)
    ['{AFA7DCA7-C3EA-4D50-811D-1788E9648023}']
    function getBand(frequency: Integer): SmallInt; cdecl;
    function getBandFreqRange(band: SmallInt): TJavaArray<Integer>; cdecl;
    function getBandLevel(band: SmallInt): SmallInt; cdecl;
    function getBandLevelRange: TJavaArray<SmallInt>; cdecl;
    function getCenterFreq(band: SmallInt): Integer; cdecl;
    function getCurrentPreset: SmallInt; cdecl;
    function getNumberOfBands: SmallInt; cdecl;
    function getNumberOfPresets: SmallInt; cdecl;
    function getPresetName(preset: SmallInt): JString; cdecl;
    function getProperties: JEqualizer_Settings; cdecl;
    procedure setBandLevel(band: SmallInt; level: SmallInt); cdecl;
    procedure setParameterListener(listener: JEqualizer_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JEqualizer_Settings); cdecl;
    procedure usePreset(preset: SmallInt); cdecl;
  end;
  TJEqualizer = class(TJavaGenericImport<JEqualizerClass, JEqualizer>) end;

  JEqualizer_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{E9CD9590-C15D-4BF5-8EC8-0459C90DF626}']
  end;

  [JavaSignature('android/media/audiofx/Equalizer$OnParameterChangeListener')]
  JEqualizer_OnParameterChangeListener = interface(IJavaInstance)
    ['{9C53A56E-58B3-477F-8B7A-40972ADDBC15}']
    procedure onParameterChange(effect: JEqualizer; status: Integer; param1: Integer; param2: Integer; value: Integer); cdecl;
  end;
  TJEqualizer_OnParameterChangeListener = class(TJavaGenericImport<JEqualizer_OnParameterChangeListenerClass, JEqualizer_OnParameterChangeListener>) end;

  JEqualizer_SettingsClass = interface(JObjectClass)
    ['{23304420-D186-451A-B6DC-5846218AA62D}']
    {class} function init: JEqualizer_Settings; cdecl; overload;
    {class} function init(settings: JString): JEqualizer_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/Equalizer$Settings')]
  JEqualizer_Settings = interface(JObject)
    ['{F4F67A0D-3F81-4AE7-80BE-21154E40D5A1}']
    function _GetbandLevels: TJavaArray<SmallInt>; cdecl;
    procedure _SetbandLevels(Value: TJavaArray<SmallInt>); cdecl;
    function _GetcurPreset: SmallInt; cdecl;
    procedure _SetcurPreset(Value: SmallInt); cdecl;
    function _GetnumBands: SmallInt; cdecl;
    procedure _SetnumBands(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property bandLevels: TJavaArray<SmallInt> read _GetbandLevels write _SetbandLevels;
    property curPreset: SmallInt read _GetcurPreset write _SetcurPreset;
    property numBands: SmallInt read _GetnumBands write _SetnumBands;
  end;
  TJEqualizer_Settings = class(TJavaGenericImport<JEqualizer_SettingsClass, JEqualizer_Settings>) end;

  JHapticGeneratorClass = interface(JAudioEffectClass)
    ['{DBD36904-E8D6-4A89-A1E1-52BA49CCF977}']
    {class} function create(audioSession: Integer): JHapticGenerator; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/HapticGenerator')]
  JHapticGenerator = interface(JAudioEffect)
    ['{400FC83D-5E82-478C-B8DF-DA5BBE5E60C6}']
    procedure close; cdecl;
    procedure release; cdecl;
    function setEnabled(enabled: Boolean): Integer; cdecl;
  end;
  TJHapticGenerator = class(TJavaGenericImport<JHapticGeneratorClass, JHapticGenerator>) end;

  JLoudnessEnhancerClass = interface(JAudioEffectClass)
    ['{0E17F2B9-AEFE-48A2-B880-85E8DF6022B1}']
    {class} function _GetPARAM_TARGET_GAIN_MB: Integer; cdecl;
    {class} function init(audioSession: Integer): JLoudnessEnhancer; cdecl;
    {class} property PARAM_TARGET_GAIN_MB: Integer read _GetPARAM_TARGET_GAIN_MB;
  end;

  [JavaSignature('android/media/audiofx/LoudnessEnhancer')]
  JLoudnessEnhancer = interface(JAudioEffect)
    ['{F3CFDC54-299C-4774-B4F1-BD348CA08827}']
    function getTargetGain: Single; cdecl;
    procedure setTargetGain(gainmB: Integer); cdecl;
  end;
  TJLoudnessEnhancer = class(TJavaGenericImport<JLoudnessEnhancerClass, JLoudnessEnhancer>) end;

  JNoiseSuppressorClass = interface(JAudioEffectClass)
    ['{F7824EA5-778F-46DC-8D0C-FB914FE0B3AA}']
    {class} function create(audioSession: Integer): JNoiseSuppressor; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/NoiseSuppressor')]
  JNoiseSuppressor = interface(JAudioEffect)
    ['{2B24295A-1361-400E-9ECF-75B5A696A150}']
  end;
  TJNoiseSuppressor = class(TJavaGenericImport<JNoiseSuppressorClass, JNoiseSuppressor>) end;

  JPresetReverbClass = interface(JAudioEffectClass)
    ['{E6BDD7E1-087C-4BEF-BBCC-001619236297}']
    {class} function _GetPARAM_PRESET: Integer; cdecl;
    {class} function _GetPRESET_LARGEHALL: SmallInt; cdecl;
    {class} function _GetPRESET_LARGEROOM: SmallInt; cdecl;
    {class} function _GetPRESET_MEDIUMHALL: SmallInt; cdecl;
    {class} function _GetPRESET_MEDIUMROOM: SmallInt; cdecl;
    {class} function _GetPRESET_NONE: SmallInt; cdecl;
    {class} function _GetPRESET_PLATE: SmallInt; cdecl;
    {class} function _GetPRESET_SMALLROOM: SmallInt; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JPresetReverb; cdecl;
    {class} property PARAM_PRESET: Integer read _GetPARAM_PRESET;
    {class} property PRESET_LARGEHALL: SmallInt read _GetPRESET_LARGEHALL;
    {class} property PRESET_LARGEROOM: SmallInt read _GetPRESET_LARGEROOM;
    {class} property PRESET_MEDIUMHALL: SmallInt read _GetPRESET_MEDIUMHALL;
    {class} property PRESET_MEDIUMROOM: SmallInt read _GetPRESET_MEDIUMROOM;
    {class} property PRESET_NONE: SmallInt read _GetPRESET_NONE;
    {class} property PRESET_PLATE: SmallInt read _GetPRESET_PLATE;
    {class} property PRESET_SMALLROOM: SmallInt read _GetPRESET_SMALLROOM;
  end;

  [JavaSignature('android/media/audiofx/PresetReverb')]
  JPresetReverb = interface(JAudioEffect)
    ['{86BA2002-A4F4-4B7F-8EB0-9DE5F08D9893}']
    function getPreset: SmallInt; cdecl;
    function getProperties: JPresetReverb_Settings; cdecl;
    procedure setParameterListener(listener: JPresetReverb_OnParameterChangeListener); cdecl;
    procedure setPreset(preset: SmallInt); cdecl;
    procedure setProperties(settings: JPresetReverb_Settings); cdecl;
  end;
  TJPresetReverb = class(TJavaGenericImport<JPresetReverbClass, JPresetReverb>) end;

  JPresetReverb_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{CF4131D1-77D9-444D-B8B5-FD871FF14C33}']
  end;

  [JavaSignature('android/media/audiofx/PresetReverb$OnParameterChangeListener')]
  JPresetReverb_OnParameterChangeListener = interface(IJavaInstance)
    ['{737B2E06-FD75-46B4-938E-E8DD6530E263}']
    procedure onParameterChange(effect: JPresetReverb; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJPresetReverb_OnParameterChangeListener = class(TJavaGenericImport<JPresetReverb_OnParameterChangeListenerClass, JPresetReverb_OnParameterChangeListener>) end;

  JPresetReverb_SettingsClass = interface(JObjectClass)
    ['{DF5566DC-55CD-4C26-9AB8-520F698491CC}']
    {class} function init: JPresetReverb_Settings; cdecl; overload;
    {class} function init(settings: JString): JPresetReverb_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/PresetReverb$Settings')]
  JPresetReverb_Settings = interface(JObject)
    ['{F57B0B89-4CDE-451E-BF10-43518B99BB08}']
    function _Getpreset: SmallInt; cdecl;
    procedure _Setpreset(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property preset: SmallInt read _Getpreset write _Setpreset;
  end;
  TJPresetReverb_Settings = class(TJavaGenericImport<JPresetReverb_SettingsClass, JPresetReverb_Settings>) end;

  JVirtualizerClass = interface(JAudioEffectClass)
    ['{FD870DEA-E35B-48C4-B8D9-FFFEC73F5AEC}']
    {class} function _GetPARAM_STRENGTH: Integer; cdecl;
    {class} function _GetPARAM_STRENGTH_SUPPORTED: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_AUTO: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_BINAURAL: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_OFF: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_TRANSAURAL: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JVirtualizer; cdecl;
    {class} property PARAM_STRENGTH: Integer read _GetPARAM_STRENGTH;
    {class} property PARAM_STRENGTH_SUPPORTED: Integer read _GetPARAM_STRENGTH_SUPPORTED;
    {class} property VIRTUALIZATION_MODE_AUTO: Integer read _GetVIRTUALIZATION_MODE_AUTO;
    {class} property VIRTUALIZATION_MODE_BINAURAL: Integer read _GetVIRTUALIZATION_MODE_BINAURAL;
    {class} property VIRTUALIZATION_MODE_OFF: Integer read _GetVIRTUALIZATION_MODE_OFF;
    {class} property VIRTUALIZATION_MODE_TRANSAURAL: Integer read _GetVIRTUALIZATION_MODE_TRANSAURAL;
  end;

  [JavaSignature('android/media/audiofx/Virtualizer')]
  JVirtualizer = interface(JAudioEffect)
    ['{29728474-34B6-43F2-8D30-D42C4D3C1B9D}']
    function canVirtualize(inputChannelMask: Integer; virtualizationMode: Integer): Boolean; cdecl;
    function forceVirtualizationMode(virtualizationMode: Integer): Boolean; cdecl;
    function getProperties: JVirtualizer_Settings; cdecl;
    function getRoundedStrength: SmallInt; cdecl;
    function getSpeakerAngles(inputChannelMask: Integer; virtualizationMode: Integer; angles: TJavaArray<Integer>): Boolean; cdecl;
    function getStrengthSupported: Boolean; cdecl;
    function getVirtualizationMode: Integer; cdecl;
    procedure setParameterListener(listener: JVirtualizer_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JVirtualizer_Settings); cdecl;
    procedure setStrength(strength: SmallInt); cdecl;
  end;
  TJVirtualizer = class(TJavaGenericImport<JVirtualizerClass, JVirtualizer>) end;

  JVirtualizer_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{0B91AE60-FB61-4425-BC9E-E025BB1AB698}']
  end;

  [JavaSignature('android/media/audiofx/Virtualizer$OnParameterChangeListener')]
  JVirtualizer_OnParameterChangeListener = interface(IJavaInstance)
    ['{B1BC6069-30E3-40E7-937C-AE8A51C12405}']
    procedure onParameterChange(effect: JVirtualizer; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJVirtualizer_OnParameterChangeListener = class(TJavaGenericImport<JVirtualizer_OnParameterChangeListenerClass, JVirtualizer_OnParameterChangeListener>) end;

  JVirtualizer_SettingsClass = interface(JObjectClass)
    ['{B9BC83BF-D598-46EB-985D-C2155AF80A53}']
    {class} function init: JVirtualizer_Settings; cdecl; overload;
    {class} function init(settings: JString): JVirtualizer_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/Virtualizer$Settings')]
  JVirtualizer_Settings = interface(JObject)
    ['{664E4688-59A7-42AC-B5D0-A63571A56A5A}']
    function _Getstrength: SmallInt; cdecl;
    procedure _Setstrength(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property strength: SmallInt read _Getstrength write _Setstrength;
  end;
  TJVirtualizer_Settings = class(TJavaGenericImport<JVirtualizer_SettingsClass, JVirtualizer_Settings>) end;

  JVisualizerClass = interface(JObjectClass)
    ['{8DBB66F3-CE56-4034-8FCA-1D4D88599192}']
    {class} function _GetALREADY_EXISTS: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetERROR_NO_INIT: Integer; cdecl;
    {class} function _GetERROR_NO_MEMORY: Integer; cdecl;
    {class} function _GetMEASUREMENT_MODE_NONE: Integer; cdecl;
    {class} function _GetMEASUREMENT_MODE_PEAK_RMS: Integer; cdecl;
    {class} function _GetSCALING_MODE_AS_PLAYED: Integer; cdecl;
    {class} function _GetSCALING_MODE_NORMALIZED: Integer; cdecl;
    {class} function _GetSTATE_ENABLED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function init(audioSession: Integer): JVisualizer; cdecl;
    {class} function getCaptureSizeRange: TJavaArray<Integer>; cdecl;
    {class} function getMaxCaptureRate: Integer; cdecl;
    {class} property ALREADY_EXISTS: Integer read _GetALREADY_EXISTS;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property ERROR_NO_INIT: Integer read _GetERROR_NO_INIT;
    {class} property ERROR_NO_MEMORY: Integer read _GetERROR_NO_MEMORY;
    {class} property MEASUREMENT_MODE_NONE: Integer read _GetMEASUREMENT_MODE_NONE;
    {class} property MEASUREMENT_MODE_PEAK_RMS: Integer read _GetMEASUREMENT_MODE_PEAK_RMS;
    {class} property SCALING_MODE_AS_PLAYED: Integer read _GetSCALING_MODE_AS_PLAYED;
    {class} property SCALING_MODE_NORMALIZED: Integer read _GetSCALING_MODE_NORMALIZED;
    {class} property STATE_ENABLED: Integer read _GetSTATE_ENABLED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/audiofx/Visualizer')]
  JVisualizer = interface(JObject)
    ['{6796AEB3-D2B1-4840-9182-92C09375E8E6}']
    function getCaptureSize: Integer; cdecl;
    function getEnabled: Boolean; cdecl;
    function getFft(fft: TJavaArray<Byte>): Integer; cdecl;
    function getMeasurementMode: Integer; cdecl;
    function getMeasurementPeakRms(measurement: JVisualizer_MeasurementPeakRms): Integer; cdecl;
    function getSamplingRate: Integer; cdecl;
    function getScalingMode: Integer; cdecl;
    function getWaveForm(waveform: TJavaArray<Byte>): Integer; cdecl;
    procedure release; cdecl;
    function setCaptureSize(size: Integer): Integer; cdecl;
    function setDataCaptureListener(listener: JVisualizer_OnDataCaptureListener; rate: Integer; waveform: Boolean; fft: Boolean): Integer; cdecl;
    function setEnabled(enabled: Boolean): Integer; cdecl;
    function setMeasurementMode(mode: Integer): Integer; cdecl;
    function setScalingMode(mode: Integer): Integer; cdecl;
  end;
  TJVisualizer = class(TJavaGenericImport<JVisualizerClass, JVisualizer>) end;

  JVisualizer_MeasurementPeakRmsClass = interface(JObjectClass)
    ['{341FCA1D-109E-4A2D-8D12-3EC49D2BAD41}']
    {class} function init: JVisualizer_MeasurementPeakRms; cdecl;
  end;

  [JavaSignature('android/media/audiofx/Visualizer$MeasurementPeakRms')]
  JVisualizer_MeasurementPeakRms = interface(JObject)
    ['{D76E370A-7352-414D-B880-5E4F6BF28DE4}']
    function _GetmPeak: Integer; cdecl;
    procedure _SetmPeak(Value: Integer); cdecl;
    function _GetmRms: Integer; cdecl;
    procedure _SetmRms(Value: Integer); cdecl;
    property mPeak: Integer read _GetmPeak write _SetmPeak;
    property mRms: Integer read _GetmRms write _SetmRms;
  end;
  TJVisualizer_MeasurementPeakRms = class(TJavaGenericImport<JVisualizer_MeasurementPeakRmsClass, JVisualizer_MeasurementPeakRms>) end;

  JVisualizer_OnDataCaptureListenerClass = interface(IJavaClass)
    ['{3CCB3AC2-5737-486B-987E-88C328277426}']
  end;

  [JavaSignature('android/media/audiofx/Visualizer$OnDataCaptureListener')]
  JVisualizer_OnDataCaptureListener = interface(IJavaInstance)
    ['{092C4DEF-238A-4053-A59B-04136A5C3820}']
    procedure onFftDataCapture(visualizer: JVisualizer; fft: TJavaArray<Byte>; samplingRate: Integer); cdecl;
    procedure onWaveFormDataCapture(visualizer: JVisualizer; waveform: TJavaArray<Byte>; samplingRate: Integer); cdecl;
  end;
  TJVisualizer_OnDataCaptureListener = class(TJavaGenericImport<JVisualizer_OnDataCaptureListenerClass, JVisualizer_OnDataCaptureListener>) end;

  JMediaBrowserClass = interface(JObjectClass)
    ['{6552C201-45F9-47D4-85B2-39C16DAD58D3}']
    {class} function _GetEXTRA_PAGE: JString; cdecl;
    {class} function _GetEXTRA_PAGE_SIZE: JString; cdecl;
    {class} function init(context: JContext; serviceComponent: JComponentName; callback: JMediaBrowser_ConnectionCallback; rootHints: JBundle): JMediaBrowser; cdecl;
    {class} property EXTRA_PAGE: JString read _GetEXTRA_PAGE;
    {class} property EXTRA_PAGE_SIZE: JString read _GetEXTRA_PAGE_SIZE;
  end;

  [JavaSignature('android/media/browse/MediaBrowser')]
  JMediaBrowser = interface(JObject)
    ['{40A5A57D-F070-4DB9-B804-13CC7DC1B533}']
    procedure connect; cdecl;
    procedure disconnect; cdecl;
    function getExtras: JBundle; cdecl;
    procedure getItem(mediaId: JString; cb: JMediaBrowser_ItemCallback); cdecl;
    function getRoot: JString; cdecl;
    function getServiceComponent: JComponentName; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function isConnected: Boolean; cdecl;
    procedure subscribe(parentId: JString; callback: JMediaBrowser_SubscriptionCallback); cdecl; overload;
    procedure subscribe(parentId: JString; options: JBundle; callback: JMediaBrowser_SubscriptionCallback); cdecl; overload;
    procedure unsubscribe(parentId: JString); cdecl; overload;
    procedure unsubscribe(parentId: JString; callback: JMediaBrowser_SubscriptionCallback); cdecl; overload;
  end;
  TJMediaBrowser = class(TJavaGenericImport<JMediaBrowserClass, JMediaBrowser>) end;

  JMediaBrowser_ConnectionCallbackClass = interface(JObjectClass)
    ['{F1BB4681-70EB-4DD9-9121-ED461DE8B22D}']
    {class} function init: JMediaBrowser_ConnectionCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$ConnectionCallback')]
  JMediaBrowser_ConnectionCallback = interface(JObject)
    ['{15C3E8C9-C306-4A51-A741-7D920D45FFC2}']
    procedure onConnected; cdecl;
    procedure onConnectionFailed; cdecl;
    procedure onConnectionSuspended; cdecl;
  end;
  TJMediaBrowser_ConnectionCallback = class(TJavaGenericImport<JMediaBrowser_ConnectionCallbackClass, JMediaBrowser_ConnectionCallback>) end;

  JMediaBrowser_ItemCallbackClass = interface(JObjectClass)
    ['{4166CDF8-B35A-4977-A0FB-46484BC62B67}']
    {class} function init: JMediaBrowser_ItemCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$ItemCallback')]
  JMediaBrowser_ItemCallback = interface(JObject)
    ['{14AF3FEC-0A8C-474B-AA81-00409CEFA6A7}']
    procedure onError(mediaId: JString); cdecl;
    procedure onItemLoaded(item: JMediaBrowser_MediaItem); cdecl;
  end;
  TJMediaBrowser_ItemCallback = class(TJavaGenericImport<JMediaBrowser_ItemCallbackClass, JMediaBrowser_ItemCallback>) end;

  JMediaBrowser_MediaItemClass = interface(JObjectClass)
    ['{B2A448F7-2C51-451E-AA53-8C4AA885A103}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFLAG_BROWSABLE: Integer; cdecl;
    {class} function _GetFLAG_PLAYABLE: Integer; cdecl;
    {class} function init(description: JMediaDescription; flags: Integer): JMediaBrowser_MediaItem; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FLAG_BROWSABLE: Integer read _GetFLAG_BROWSABLE;
    {class} property FLAG_PLAYABLE: Integer read _GetFLAG_PLAYABLE;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$MediaItem')]
  JMediaBrowser_MediaItem = interface(JObject)
    ['{40213ADA-1585-41A5-9D7D-1AAB4F1218BC}']
    function describeContents: Integer; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getFlags: Integer; cdecl;
    function getMediaId: JString; cdecl;
    function isBrowsable: Boolean; cdecl;
    function isPlayable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJMediaBrowser_MediaItem = class(TJavaGenericImport<JMediaBrowser_MediaItemClass, JMediaBrowser_MediaItem>) end;

  JMediaBrowser_SubscriptionCallbackClass = interface(JObjectClass)
    ['{FE60B928-3734-4E3C-B2F2-BD99DF0AEF3D}']
    {class} function init: JMediaBrowser_SubscriptionCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$SubscriptionCallback')]
  JMediaBrowser_SubscriptionCallback = interface(JObject)
    ['{400905BB-C3DA-4475-A8FA-FD22EF4A9383}']
    procedure onChildrenLoaded(parentId: JString; children: JList); cdecl; overload;
    procedure onChildrenLoaded(parentId: JString; children: JList; options: JBundle); cdecl; overload;
    procedure onError(parentId: JString); cdecl; overload;
    procedure onError(parentId: JString; options: JBundle); cdecl; overload;
  end;
  TJMediaBrowser_SubscriptionCallback = class(TJavaGenericImport<JMediaBrowser_SubscriptionCallbackClass, JMediaBrowser_SubscriptionCallback>) end;

  JEffectClass = interface(JObjectClass)
    ['{DC62EAE5-6D58-4DEC-B60B-CE5890CC3CDF}']
    {class} function init: JEffect; cdecl;
  end;

  [JavaSignature('android/media/effect/Effect')]
  JEffect = interface(JObject)
    ['{B0029DD4-ED95-41AD-9F14-3E81375B7DC6}']
    procedure apply(inputTexId: Integer; width: Integer; height: Integer; outputTexId: Integer); cdecl;
    function getName: JString; cdecl;
    procedure release; cdecl;
    procedure setParameter(parameterKey: JString; value: JObject); cdecl;
    procedure setUpdateListener(listener: JEffectUpdateListener); cdecl;
  end;
  TJEffect = class(TJavaGenericImport<JEffectClass, JEffect>) end;

  JEffectContextClass = interface(JObjectClass)
    ['{D74230AA-9EF6-439C-A03C-B6D0B03D9821}']
    {class} function createWithCurrentGlContext: JEffectContext; cdecl;
  end;

  [JavaSignature('android/media/effect/EffectContext')]
  JEffectContext = interface(JObject)
    ['{C963ECA3-2F09-44E5-948B-A564A49BBB5E}']
    function getFactory: JEffectFactory; cdecl;
    procedure release; cdecl;
  end;
  TJEffectContext = class(TJavaGenericImport<JEffectContextClass, JEffectContext>) end;

  JEffectFactoryClass = interface(JObjectClass)
    ['{14E2D166-0AC1-4491-BF2B-962F24BAB38A}']
    {class} function _GetEFFECT_AUTOFIX: JString; cdecl;
    {class} function _GetEFFECT_BACKDROPPER: JString; cdecl;
    {class} function _GetEFFECT_BITMAPOVERLAY: JString; cdecl;
    {class} function _GetEFFECT_BLACKWHITE: JString; cdecl;
    {class} function _GetEFFECT_BRIGHTNESS: JString; cdecl;
    {class} function _GetEFFECT_CONTRAST: JString; cdecl;
    {class} function _GetEFFECT_CROP: JString; cdecl;
    {class} function _GetEFFECT_CROSSPROCESS: JString; cdecl;
    {class} function _GetEFFECT_DOCUMENTARY: JString; cdecl;
    {class} function _GetEFFECT_DUOTONE: JString; cdecl;
    {class} function _GetEFFECT_FILLLIGHT: JString; cdecl;
    {class} function _GetEFFECT_FISHEYE: JString; cdecl;
    {class} function _GetEFFECT_FLIP: JString; cdecl;
    {class} function _GetEFFECT_GRAIN: JString; cdecl;
    {class} function _GetEFFECT_GRAYSCALE: JString; cdecl;
    {class} function _GetEFFECT_LOMOISH: JString; cdecl;
    {class} function _GetEFFECT_NEGATIVE: JString; cdecl;
    {class} function _GetEFFECT_POSTERIZE: JString; cdecl;
    {class} function _GetEFFECT_REDEYE: JString; cdecl;
    {class} function _GetEFFECT_ROTATE: JString; cdecl;
    {class} function _GetEFFECT_SATURATE: JString; cdecl;
    {class} function _GetEFFECT_SEPIA: JString; cdecl;
    {class} function _GetEFFECT_SHARPEN: JString; cdecl;
    {class} function _GetEFFECT_STRAIGHTEN: JString; cdecl;
    {class} function _GetEFFECT_TEMPERATURE: JString; cdecl;
    {class} function _GetEFFECT_TINT: JString; cdecl;
    {class} function _GetEFFECT_VIGNETTE: JString; cdecl;
    {class} function isEffectSupported(effectName: JString): Boolean; cdecl;
    {class} property EFFECT_AUTOFIX: JString read _GetEFFECT_AUTOFIX;
    {class} property EFFECT_BACKDROPPER: JString read _GetEFFECT_BACKDROPPER;
    {class} property EFFECT_BITMAPOVERLAY: JString read _GetEFFECT_BITMAPOVERLAY;
    {class} property EFFECT_BLACKWHITE: JString read _GetEFFECT_BLACKWHITE;
    {class} property EFFECT_BRIGHTNESS: JString read _GetEFFECT_BRIGHTNESS;
    {class} property EFFECT_CONTRAST: JString read _GetEFFECT_CONTRAST;
    {class} property EFFECT_CROP: JString read _GetEFFECT_CROP;
    {class} property EFFECT_CROSSPROCESS: JString read _GetEFFECT_CROSSPROCESS;
    {class} property EFFECT_DOCUMENTARY: JString read _GetEFFECT_DOCUMENTARY;
    {class} property EFFECT_DUOTONE: JString read _GetEFFECT_DUOTONE;
    {class} property EFFECT_FILLLIGHT: JString read _GetEFFECT_FILLLIGHT;
    {class} property EFFECT_FISHEYE: JString read _GetEFFECT_FISHEYE;
    {class} property EFFECT_FLIP: JString read _GetEFFECT_FLIP;
    {class} property EFFECT_GRAIN: JString read _GetEFFECT_GRAIN;
    {class} property EFFECT_GRAYSCALE: JString read _GetEFFECT_GRAYSCALE;
    {class} property EFFECT_LOMOISH: JString read _GetEFFECT_LOMOISH;
    {class} property EFFECT_NEGATIVE: JString read _GetEFFECT_NEGATIVE;
    {class} property EFFECT_POSTERIZE: JString read _GetEFFECT_POSTERIZE;
    {class} property EFFECT_REDEYE: JString read _GetEFFECT_REDEYE;
    {class} property EFFECT_ROTATE: JString read _GetEFFECT_ROTATE;
    {class} property EFFECT_SATURATE: JString read _GetEFFECT_SATURATE;
    {class} property EFFECT_SEPIA: JString read _GetEFFECT_SEPIA;
    {class} property EFFECT_SHARPEN: JString read _GetEFFECT_SHARPEN;
    {class} property EFFECT_STRAIGHTEN: JString read _GetEFFECT_STRAIGHTEN;
    {class} property EFFECT_TEMPERATURE: JString read _GetEFFECT_TEMPERATURE;
    {class} property EFFECT_TINT: JString read _GetEFFECT_TINT;
    {class} property EFFECT_VIGNETTE: JString read _GetEFFECT_VIGNETTE;
  end;

  [JavaSignature('android/media/effect/EffectFactory')]
  JEffectFactory = interface(JObject)
    ['{BABFFFB3-AB4C-4626-86FE-BAD146F6C251}']
    function createEffect(effectName: JString): JEffect; cdecl;
  end;
  TJEffectFactory = class(TJavaGenericImport<JEffectFactoryClass, JEffectFactory>) end;

  JEffectUpdateListenerClass = interface(IJavaClass)
    ['{B38D8A57-D3AB-4F58-AE3A-A9A7D8EE612B}']
  end;

  [JavaSignature('android/media/effect/EffectUpdateListener')]
  JEffectUpdateListener = interface(IJavaInstance)
    ['{FF287CF5-5208-4CF5-A0EF-8F76D144AF71}']
    procedure onEffectUpdated(effect: JEffect; info: JObject); cdecl;
  end;
  TJEffectUpdateListener = class(TJavaGenericImport<JEffectUpdateListenerClass, JEffectUpdateListener>) end;

  JBundleSessionClass = interface(JObjectClass)
    ['{8F939AD2-C5DA-412B-9CC0-C9764C7E4338}']
    {class} function _GetKEY_STATSD_ATOM: JString; cdecl;
    {class} property KEY_STATSD_ATOM: JString read _GetKEY_STATSD_ATOM;
  end;

  [JavaSignature('android/media/metrics/BundleSession')]
  JBundleSession = interface(JObject)
    ['{9C66EF5E-902C-4B2B-BECB-66D2DC3C38B4}']
    procedure close; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSessionId: JLogSessionId; cdecl;
    function hashCode: Integer; cdecl;
    procedure reportBundleMetrics(metrics: JPersistableBundle); cdecl;
  end;
  TJBundleSession = class(TJavaGenericImport<JBundleSessionClass, JBundleSession>) end;

  JEditingSessionClass = interface(JObjectClass)
    ['{EFB669C6-0B73-4E4B-8027-B7B454F80DA7}']
  end;

  [JavaSignature('android/media/metrics/EditingSession')]
  JEditingSession = interface(JObject)
    ['{8579113E-9BFA-4ED7-A776-4DFFAF7A0B04}']
    procedure close; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSessionId: JLogSessionId; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJEditingSession = class(TJavaGenericImport<JEditingSessionClass, JEditingSession>) end;

  Jmetrics_EventClass = interface(JObjectClass)
    ['{43A59909-8421-484F-A29C-1920A0E11020}']
  end;

  [JavaSignature('android/media/metrics/Event')]
  Jmetrics_Event = interface(JObject)
    ['{AEFD60C7-323D-4778-BEEF-1408A87F3137}']
    function getMetricsBundle: JBundle; cdecl;
    function getTimeSinceCreatedMillis: Int64; cdecl;
  end;
  TJmetrics_Event = class(TJavaGenericImport<Jmetrics_EventClass, Jmetrics_Event>) end;

  JLogSessionIdClass = interface(JObjectClass)
    ['{D8C1D067-1565-4FFA-8AE8-E98DC75D0564}']
    {class} function _GetLOG_SESSION_ID_NONE: JLogSessionId; cdecl;
    {class} property LOG_SESSION_ID_NONE: JLogSessionId read _GetLOG_SESSION_ID_NONE;
  end;

  [JavaSignature('android/media/metrics/LogSessionId')]
  JLogSessionId = interface(JObject)
    ['{F33CC65A-A4BE-4AFC-8A0A-720B72959395}']
    function equals(o: JObject): Boolean; cdecl;
    function getStringId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJLogSessionId = class(TJavaGenericImport<JLogSessionIdClass, JLogSessionId>) end;

  JMediaMetricsManagerClass = interface(JObjectClass)
    ['{619E58D4-E8BE-44D3-AD10-154E0D3EB3FF}']
    {class} function _GetINVALID_TIMESTAMP: Int64; cdecl;
    {class} property INVALID_TIMESTAMP: Int64 read _GetINVALID_TIMESTAMP;
  end;

  [JavaSignature('android/media/metrics/MediaMetricsManager')]
  JMediaMetricsManager = interface(JObject)
    ['{BBBDF6B0-6CEF-4010-97F7-E47AA8CCA347}']
    function createBundleSession: JBundleSession; cdecl;
    function createEditingSession: JEditingSession; cdecl;
    function createPlaybackSession: JPlaybackSession; cdecl;
    function createRecordingSession: JRecordingSession; cdecl;
    function createTranscodingSession: JTranscodingSession; cdecl;
    procedure releaseSessionId(sessionId: JString); cdecl;
  end;
  TJMediaMetricsManager = class(TJavaGenericImport<JMediaMetricsManagerClass, JMediaMetricsManager>) end;

  Jmetrics_NetworkEventClass = interface(Jmetrics_EventClass)
    ['{CE108E66-86E1-475D-89B6-761E00474CCB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetNETWORK_TYPE_2G: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_3G: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_4G: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_5G_NSA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_5G_SA: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_ETHERNET: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_OFFLINE: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_OTHER: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetNETWORK_TYPE_WIFI: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property NETWORK_TYPE_2G: Integer read _GetNETWORK_TYPE_2G;
    {class} property NETWORK_TYPE_3G: Integer read _GetNETWORK_TYPE_3G;
    {class} property NETWORK_TYPE_4G: Integer read _GetNETWORK_TYPE_4G;
    {class} property NETWORK_TYPE_5G_NSA: Integer read _GetNETWORK_TYPE_5G_NSA;
    {class} property NETWORK_TYPE_5G_SA: Integer read _GetNETWORK_TYPE_5G_SA;
    {class} property NETWORK_TYPE_ETHERNET: Integer read _GetNETWORK_TYPE_ETHERNET;
    {class} property NETWORK_TYPE_OFFLINE: Integer read _GetNETWORK_TYPE_OFFLINE;
    {class} property NETWORK_TYPE_OTHER: Integer read _GetNETWORK_TYPE_OTHER;
    {class} property NETWORK_TYPE_UNKNOWN: Integer read _GetNETWORK_TYPE_UNKNOWN;
    {class} property NETWORK_TYPE_WIFI: Integer read _GetNETWORK_TYPE_WIFI;
  end;

  [JavaSignature('android/media/metrics/NetworkEvent')]
  Jmetrics_NetworkEvent = interface(Jmetrics_Event)
    ['{56C2E55E-F7DA-45EB-86BB-47C5AB16C78B}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getMetricsBundle: JBundle; cdecl;
    function getNetworkType: Integer; cdecl;
    function getTimeSinceCreatedMillis: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJmetrics_NetworkEvent = class(TJavaGenericImport<Jmetrics_NetworkEventClass, Jmetrics_NetworkEvent>) end;

  JNetworkEvent_BuilderClass = interface(JObjectClass)
    ['{886BA4E9-CE2E-4CED-B6DF-5DA8BAEDE7A4}']
    {class} function init: JNetworkEvent_Builder; cdecl;
  end;

  [JavaSignature('android/media/metrics/NetworkEvent$Builder')]
  JNetworkEvent_Builder = interface(JObject)
    ['{7BE9EAF9-3F0F-43A4-9F84-3393A48EE2A6}']
    function build: Jmetrics_NetworkEvent; cdecl;
    function setMetricsBundle(metricsBundle: JBundle): JNetworkEvent_Builder; cdecl;
    function setNetworkType(value: Integer): JNetworkEvent_Builder; cdecl;
    function setTimeSinceCreatedMillis(value: Int64): JNetworkEvent_Builder; cdecl;
  end;
  TJNetworkEvent_Builder = class(TJavaGenericImport<JNetworkEvent_BuilderClass, JNetworkEvent_Builder>) end;

  JPlaybackErrorEventClass = interface(Jmetrics_EventClass)
    ['{B4F5CF91-3FBD-430B-A5CD-B85AFEEA9C6A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetERROR_AUDIO_TRACK_INIT_FAILED: Integer; cdecl;
    {class} function _GetERROR_AUDIO_TRACK_OTHER: Integer; cdecl;
    {class} function _GetERROR_AUDIO_TRACK_WRITE_FAILED: Integer; cdecl;
    {class} function _GetERROR_DECODER_INIT_FAILED: Integer; cdecl;
    {class} function _GetERROR_DECODING_FAILED: Integer; cdecl;
    {class} function _GetERROR_DECODING_FORMAT_EXCEEDS_CAPABILITIES: Integer; cdecl;
    {class} function _GetERROR_DECODING_FORMAT_UNSUPPORTED: Integer; cdecl;
    {class} function _GetERROR_DECODING_OTHER: Integer; cdecl;
    {class} function _GetERROR_DRM_CONTENT_ERROR: Integer; cdecl;
    {class} function _GetERROR_DRM_DEVICE_REVOKED: Integer; cdecl;
    {class} function _GetERROR_DRM_DISALLOWED_OPERATION: Integer; cdecl;
    {class} function _GetERROR_DRM_LICENSE_ACQUISITION_FAILED: Integer; cdecl;
    {class} function _GetERROR_DRM_OTHER: Integer; cdecl;
    {class} function _GetERROR_DRM_PROVISIONING_FAILED: Integer; cdecl;
    {class} function _GetERROR_DRM_SCHEME_UNSUPPORTED: Integer; cdecl;
    {class} function _GetERROR_DRM_SYSTEM_ERROR: Integer; cdecl;
    {class} function _GetERROR_IO_BAD_HTTP_STATUS: Integer; cdecl;
    {class} function _GetERROR_IO_CONNECTION_CLOSED: Integer; cdecl;
    {class} function _GetERROR_IO_CONNECTION_TIMEOUT: Integer; cdecl;
    {class} function _GetERROR_IO_DNS_FAILED: Integer; cdecl;
    {class} function _GetERROR_IO_FILE_NOT_FOUND: Integer; cdecl;
    {class} function _GetERROR_IO_NETWORK_CONNECTION_FAILED: Integer; cdecl;
    {class} function _GetERROR_IO_NETWORK_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_IO_NO_PERMISSION: Integer; cdecl;
    {class} function _GetERROR_IO_OTHER: Integer; cdecl;
    {class} function _GetERROR_OTHER: Integer; cdecl;
    {class} function _GetERROR_PARSING_CONTAINER_MALFORMED: Integer; cdecl;
    {class} function _GetERROR_PARSING_CONTAINER_UNSUPPORTED: Integer; cdecl;
    {class} function _GetERROR_PARSING_MANIFEST_MALFORMED: Integer; cdecl;
    {class} function _GetERROR_PARSING_MANIFEST_UNSUPPORTED: Integer; cdecl;
    {class} function _GetERROR_PARSING_OTHER: Integer; cdecl;
    {class} function _GetERROR_PLAYER_BEHIND_LIVE_WINDOW: Integer; cdecl;
    {class} function _GetERROR_PLAYER_OTHER: Integer; cdecl;
    {class} function _GetERROR_PLAYER_REMOTE: Integer; cdecl;
    {class} function _GetERROR_RUNTIME: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property ERROR_AUDIO_TRACK_INIT_FAILED: Integer read _GetERROR_AUDIO_TRACK_INIT_FAILED;
    {class} property ERROR_AUDIO_TRACK_OTHER: Integer read _GetERROR_AUDIO_TRACK_OTHER;
    {class} property ERROR_AUDIO_TRACK_WRITE_FAILED: Integer read _GetERROR_AUDIO_TRACK_WRITE_FAILED;
    {class} property ERROR_DECODER_INIT_FAILED: Integer read _GetERROR_DECODER_INIT_FAILED;
    {class} property ERROR_DECODING_FAILED: Integer read _GetERROR_DECODING_FAILED;
    {class} property ERROR_DECODING_FORMAT_EXCEEDS_CAPABILITIES: Integer read _GetERROR_DECODING_FORMAT_EXCEEDS_CAPABILITIES;
    {class} property ERROR_DECODING_FORMAT_UNSUPPORTED: Integer read _GetERROR_DECODING_FORMAT_UNSUPPORTED;
    {class} property ERROR_DECODING_OTHER: Integer read _GetERROR_DECODING_OTHER;
    {class} property ERROR_DRM_CONTENT_ERROR: Integer read _GetERROR_DRM_CONTENT_ERROR;
    {class} property ERROR_DRM_DEVICE_REVOKED: Integer read _GetERROR_DRM_DEVICE_REVOKED;
    {class} property ERROR_DRM_DISALLOWED_OPERATION: Integer read _GetERROR_DRM_DISALLOWED_OPERATION;
    {class} property ERROR_DRM_LICENSE_ACQUISITION_FAILED: Integer read _GetERROR_DRM_LICENSE_ACQUISITION_FAILED;
    {class} property ERROR_DRM_OTHER: Integer read _GetERROR_DRM_OTHER;
    {class} property ERROR_DRM_PROVISIONING_FAILED: Integer read _GetERROR_DRM_PROVISIONING_FAILED;
    {class} property ERROR_DRM_SCHEME_UNSUPPORTED: Integer read _GetERROR_DRM_SCHEME_UNSUPPORTED;
    {class} property ERROR_DRM_SYSTEM_ERROR: Integer read _GetERROR_DRM_SYSTEM_ERROR;
    {class} property ERROR_IO_BAD_HTTP_STATUS: Integer read _GetERROR_IO_BAD_HTTP_STATUS;
    {class} property ERROR_IO_CONNECTION_CLOSED: Integer read _GetERROR_IO_CONNECTION_CLOSED;
    {class} property ERROR_IO_CONNECTION_TIMEOUT: Integer read _GetERROR_IO_CONNECTION_TIMEOUT;
    {class} property ERROR_IO_DNS_FAILED: Integer read _GetERROR_IO_DNS_FAILED;
    {class} property ERROR_IO_FILE_NOT_FOUND: Integer read _GetERROR_IO_FILE_NOT_FOUND;
    {class} property ERROR_IO_NETWORK_CONNECTION_FAILED: Integer read _GetERROR_IO_NETWORK_CONNECTION_FAILED;
    {class} property ERROR_IO_NETWORK_UNAVAILABLE: Integer read _GetERROR_IO_NETWORK_UNAVAILABLE;
    {class} property ERROR_IO_NO_PERMISSION: Integer read _GetERROR_IO_NO_PERMISSION;
    {class} property ERROR_IO_OTHER: Integer read _GetERROR_IO_OTHER;
    {class} property ERROR_OTHER: Integer read _GetERROR_OTHER;
    {class} property ERROR_PARSING_CONTAINER_MALFORMED: Integer read _GetERROR_PARSING_CONTAINER_MALFORMED;
    {class} property ERROR_PARSING_CONTAINER_UNSUPPORTED: Integer read _GetERROR_PARSING_CONTAINER_UNSUPPORTED;
    {class} property ERROR_PARSING_MANIFEST_MALFORMED: Integer read _GetERROR_PARSING_MANIFEST_MALFORMED;
    {class} property ERROR_PARSING_MANIFEST_UNSUPPORTED: Integer read _GetERROR_PARSING_MANIFEST_UNSUPPORTED;
    {class} property ERROR_PARSING_OTHER: Integer read _GetERROR_PARSING_OTHER;
    {class} property ERROR_PLAYER_BEHIND_LIVE_WINDOW: Integer read _GetERROR_PLAYER_BEHIND_LIVE_WINDOW;
    {class} property ERROR_PLAYER_OTHER: Integer read _GetERROR_PLAYER_OTHER;
    {class} property ERROR_PLAYER_REMOTE: Integer read _GetERROR_PLAYER_REMOTE;
    {class} property ERROR_RUNTIME: Integer read _GetERROR_RUNTIME;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
  end;

  [JavaSignature('android/media/metrics/PlaybackErrorEvent')]
  JPlaybackErrorEvent = interface(Jmetrics_Event)
    ['{6F398003-7EC8-4140-B25B-0D194409D838}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getErrorCode: Integer; cdecl;
    function getMetricsBundle: JBundle; cdecl;
    function getSubErrorCode: Integer; cdecl;
    function getTimeSinceCreatedMillis: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackErrorEvent = class(TJavaGenericImport<JPlaybackErrorEventClass, JPlaybackErrorEvent>) end;

  JPlaybackErrorEvent_BuilderClass = interface(JObjectClass)
    ['{EEC12535-87BA-46AC-8BF6-F2BDF064EA19}']
    {class} function init: JPlaybackErrorEvent_Builder; cdecl;
  end;

  [JavaSignature('android/media/metrics/PlaybackErrorEvent$Builder')]
  JPlaybackErrorEvent_Builder = interface(JObject)
    ['{374634C8-5A08-42A3-BDBB-F49937645924}']
    function build: JPlaybackErrorEvent; cdecl;
    function setErrorCode(value: Integer): JPlaybackErrorEvent_Builder; cdecl;
    function setException(value: JException): JPlaybackErrorEvent_Builder; cdecl;
    function setMetricsBundle(metricsBundle: JBundle): JPlaybackErrorEvent_Builder; cdecl;
    function setSubErrorCode(value: Integer): JPlaybackErrorEvent_Builder; cdecl;
    function setTimeSinceCreatedMillis(value: Int64): JPlaybackErrorEvent_Builder; cdecl;
  end;
  TJPlaybackErrorEvent_Builder = class(TJavaGenericImport<JPlaybackErrorEvent_BuilderClass, JPlaybackErrorEvent_Builder>) end;

  JPlaybackMetricsClass = interface(JObjectClass)
    ['{70EAD49F-FA8D-415C-BB77-EF65EE03B74C}']
    {class} function _GetCONTENT_TYPE_AD: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MAIN: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_OTHER: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDRM_TYPE_CLEARKEY: Integer; cdecl;
    {class} function _GetDRM_TYPE_NONE: Integer; cdecl;
    {class} function _GetDRM_TYPE_OTHER: Integer; cdecl;
    {class} function _GetDRM_TYPE_PLAY_READY: Integer; cdecl;
    {class} function _GetDRM_TYPE_WIDEVINE_L1: Integer; cdecl;
    {class} function _GetDRM_TYPE_WIDEVINE_L3: Integer; cdecl;
    {class} function _GetDRM_TYPE_WV_L3_FALLBACK: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_LIVE: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_OTHER: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_VOD: Integer; cdecl;
    {class} function _GetSTREAM_SOURCE_DEVICE: Integer; cdecl;
    {class} function _GetSTREAM_SOURCE_MIXED: Integer; cdecl;
    {class} function _GetSTREAM_SOURCE_NETWORK: Integer; cdecl;
    {class} function _GetSTREAM_SOURCE_UNKNOWN: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_DASH: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_HLS: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_OTHER: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_PROGRESSIVE: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_SS: Integer; cdecl;
    {class} function _GetSTREAM_TYPE_UNKNOWN: Integer; cdecl;
    {class} property CONTENT_TYPE_AD: Integer read _GetCONTENT_TYPE_AD;
    {class} property CONTENT_TYPE_MAIN: Integer read _GetCONTENT_TYPE_MAIN;
    {class} property CONTENT_TYPE_OTHER: Integer read _GetCONTENT_TYPE_OTHER;
    {class} property CONTENT_TYPE_UNKNOWN: Integer read _GetCONTENT_TYPE_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DRM_TYPE_CLEARKEY: Integer read _GetDRM_TYPE_CLEARKEY;
    {class} property DRM_TYPE_NONE: Integer read _GetDRM_TYPE_NONE;
    {class} property DRM_TYPE_OTHER: Integer read _GetDRM_TYPE_OTHER;
    {class} property DRM_TYPE_PLAY_READY: Integer read _GetDRM_TYPE_PLAY_READY;
    {class} property DRM_TYPE_WIDEVINE_L1: Integer read _GetDRM_TYPE_WIDEVINE_L1;
    {class} property DRM_TYPE_WIDEVINE_L3: Integer read _GetDRM_TYPE_WIDEVINE_L3;
    {class} property DRM_TYPE_WV_L3_FALLBACK: Integer read _GetDRM_TYPE_WV_L3_FALLBACK;
    {class} property PLAYBACK_TYPE_LIVE: Integer read _GetPLAYBACK_TYPE_LIVE;
    {class} property PLAYBACK_TYPE_OTHER: Integer read _GetPLAYBACK_TYPE_OTHER;
    {class} property PLAYBACK_TYPE_UNKNOWN: Integer read _GetPLAYBACK_TYPE_UNKNOWN;
    {class} property PLAYBACK_TYPE_VOD: Integer read _GetPLAYBACK_TYPE_VOD;
    {class} property STREAM_SOURCE_DEVICE: Integer read _GetSTREAM_SOURCE_DEVICE;
    {class} property STREAM_SOURCE_MIXED: Integer read _GetSTREAM_SOURCE_MIXED;
    {class} property STREAM_SOURCE_NETWORK: Integer read _GetSTREAM_SOURCE_NETWORK;
    {class} property STREAM_SOURCE_UNKNOWN: Integer read _GetSTREAM_SOURCE_UNKNOWN;
    {class} property STREAM_TYPE_DASH: Integer read _GetSTREAM_TYPE_DASH;
    {class} property STREAM_TYPE_HLS: Integer read _GetSTREAM_TYPE_HLS;
    {class} property STREAM_TYPE_OTHER: Integer read _GetSTREAM_TYPE_OTHER;
    {class} property STREAM_TYPE_PROGRESSIVE: Integer read _GetSTREAM_TYPE_PROGRESSIVE;
    {class} property STREAM_TYPE_SS: Integer read _GetSTREAM_TYPE_SS;
    {class} property STREAM_TYPE_UNKNOWN: Integer read _GetSTREAM_TYPE_UNKNOWN;
  end;

  [JavaSignature('android/media/metrics/PlaybackMetrics')]
  JPlaybackMetrics = interface(JObject)
    ['{5B6C509D-B924-43CF-BBF5-281E936BC5D4}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioUnderrunCount: Integer; cdecl;
    function getContentType: Integer; cdecl;
    function getDrmSessionId: TJavaArray<Byte>; cdecl;
    function getDrmType: Integer; cdecl;
    function getExperimentIds: TJavaArray<Int64>; cdecl;
    function getLocalBytesRead: Int64; cdecl;
    function getMediaDurationMillis: Int64; cdecl;
    function getMetricsBundle: JBundle; cdecl;
    function getNetworkBytesRead: Int64; cdecl;
    function getNetworkTransferDurationMillis: Int64; cdecl;
    function getPlaybackType: Integer; cdecl;
    function getPlayerName: JString; cdecl;
    function getPlayerVersion: JString; cdecl;
    function getStreamSource: Integer; cdecl;
    function getStreamType: Integer; cdecl;
    function getVideoFramesDropped: Integer; cdecl;
    function getVideoFramesPlayed: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackMetrics = class(TJavaGenericImport<JPlaybackMetricsClass, JPlaybackMetrics>) end;

  JPlaybackMetrics_BuilderClass = interface(JObjectClass)
    ['{7B125450-779B-4A0E-9BA6-10FBEDC0874F}']
    {class} function init: JPlaybackMetrics_Builder; cdecl;
  end;

  [JavaSignature('android/media/metrics/PlaybackMetrics$Builder')]
  JPlaybackMetrics_Builder = interface(JObject)
    ['{BF6D3711-A10D-4C0C-9839-587EF15973A2}']
    function addExperimentId(value: Int64): JPlaybackMetrics_Builder; cdecl;
    function build: JPlaybackMetrics; cdecl;
    function setAudioUnderrunCount(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setContentType(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setDrmSessionId(drmSessionId: TJavaArray<Byte>): JPlaybackMetrics_Builder; cdecl;
    function setDrmType(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setLocalBytesRead(value: Int64): JPlaybackMetrics_Builder; cdecl;
    function setMediaDurationMillis(value: Int64): JPlaybackMetrics_Builder; cdecl;
    function setMetricsBundle(metricsBundle: JBundle): JPlaybackMetrics_Builder; cdecl;
    function setNetworkBytesRead(value: Int64): JPlaybackMetrics_Builder; cdecl;
    function setNetworkTransferDurationMillis(value: Int64): JPlaybackMetrics_Builder; cdecl;
    function setPlaybackType(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setPlayerName(value: JString): JPlaybackMetrics_Builder; cdecl;
    function setPlayerVersion(value: JString): JPlaybackMetrics_Builder; cdecl;
    function setStreamSource(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setStreamType(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setVideoFramesDropped(value: Integer): JPlaybackMetrics_Builder; cdecl;
    function setVideoFramesPlayed(value: Integer): JPlaybackMetrics_Builder; cdecl;
  end;
  TJPlaybackMetrics_Builder = class(TJavaGenericImport<JPlaybackMetrics_BuilderClass, JPlaybackMetrics_Builder>) end;

  JPlaybackSessionClass = interface(JObjectClass)
    ['{AF0725DD-8A57-47BD-B462-5B68C1D6027C}']
  end;

  [JavaSignature('android/media/metrics/PlaybackSession')]
  JPlaybackSession = interface(JObject)
    ['{10886625-37FC-4D3E-9437-0412F179ADFB}']
    procedure close; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSessionId: JLogSessionId; cdecl;
    function hashCode: Integer; cdecl;
    procedure reportNetworkEvent(event: Jmetrics_NetworkEvent); cdecl;
    procedure reportPlaybackErrorEvent(event: JPlaybackErrorEvent); cdecl;
    procedure reportPlaybackMetrics(metrics: JPlaybackMetrics); cdecl;
    procedure reportPlaybackStateEvent(event: JPlaybackStateEvent); cdecl;
    procedure reportTrackChangeEvent(event: JTrackChangeEvent); cdecl;
  end;
  TJPlaybackSession = class(TJavaGenericImport<JPlaybackSessionClass, JPlaybackSession>) end;

  JPlaybackStateEventClass = interface(Jmetrics_EventClass)
    ['{E3B6591D-EAB2-4A7F-BFE9-5E30F6EB8CA1}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetSTATE_ABANDONED: Integer; cdecl;
    {class} function _GetSTATE_BUFFERING: Integer; cdecl;
    {class} function _GetSTATE_ENDED: Integer; cdecl;
    {class} function _GetSTATE_FAILED: Integer; cdecl;
    {class} function _GetSTATE_INTERRUPTED_BY_AD: Integer; cdecl;
    {class} function _GetSTATE_JOINING_BACKGROUND: Integer; cdecl;
    {class} function _GetSTATE_JOINING_FOREGROUND: Integer; cdecl;
    {class} function _GetSTATE_NOT_STARTED: Integer; cdecl;
    {class} function _GetSTATE_PAUSED: Integer; cdecl;
    {class} function _GetSTATE_PAUSED_BUFFERING: Integer; cdecl;
    {class} function _GetSTATE_PLAYING: Integer; cdecl;
    {class} function _GetSTATE_SEEKING: Integer; cdecl;
    {class} function _GetSTATE_STOPPED: Integer; cdecl;
    {class} function _GetSTATE_SUPPRESSED: Integer; cdecl;
    {class} function _GetSTATE_SUPPRESSED_BUFFERING: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property STATE_ABANDONED: Integer read _GetSTATE_ABANDONED;
    {class} property STATE_BUFFERING: Integer read _GetSTATE_BUFFERING;
    {class} property STATE_ENDED: Integer read _GetSTATE_ENDED;
    {class} property STATE_FAILED: Integer read _GetSTATE_FAILED;
    {class} property STATE_INTERRUPTED_BY_AD: Integer read _GetSTATE_INTERRUPTED_BY_AD;
    {class} property STATE_JOINING_BACKGROUND: Integer read _GetSTATE_JOINING_BACKGROUND;
    {class} property STATE_JOINING_FOREGROUND: Integer read _GetSTATE_JOINING_FOREGROUND;
    {class} property STATE_NOT_STARTED: Integer read _GetSTATE_NOT_STARTED;
    {class} property STATE_PAUSED: Integer read _GetSTATE_PAUSED;
    {class} property STATE_PAUSED_BUFFERING: Integer read _GetSTATE_PAUSED_BUFFERING;
    {class} property STATE_PLAYING: Integer read _GetSTATE_PLAYING;
    {class} property STATE_SEEKING: Integer read _GetSTATE_SEEKING;
    {class} property STATE_STOPPED: Integer read _GetSTATE_STOPPED;
    {class} property STATE_SUPPRESSED: Integer read _GetSTATE_SUPPRESSED;
    {class} property STATE_SUPPRESSED_BUFFERING: Integer read _GetSTATE_SUPPRESSED_BUFFERING;
  end;

  [JavaSignature('android/media/metrics/PlaybackStateEvent')]
  JPlaybackStateEvent = interface(Jmetrics_Event)
    ['{98AB963F-98B6-4208-963F-D3411D71CE27}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getMetricsBundle: JBundle; cdecl;
    function getState: Integer; cdecl;
    function getTimeSinceCreatedMillis: Int64; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackStateEvent = class(TJavaGenericImport<JPlaybackStateEventClass, JPlaybackStateEvent>) end;

  JPlaybackStateEvent_BuilderClass = interface(JObjectClass)
    ['{4A9CA99C-77C2-4EB3-A030-0201FF12020E}']
    {class} function init: JPlaybackStateEvent_Builder; cdecl;
  end;

  [JavaSignature('android/media/metrics/PlaybackStateEvent$Builder')]
  JPlaybackStateEvent_Builder = interface(JObject)
    ['{8161377E-1E13-4B7C-AC79-2E3BE3177ED7}']
    function build: JPlaybackStateEvent; cdecl;
    function setMetricsBundle(metricsBundle: JBundle): JPlaybackStateEvent_Builder; cdecl;
    function setState(value: Integer): JPlaybackStateEvent_Builder; cdecl;
    function setTimeSinceCreatedMillis(value: Int64): JPlaybackStateEvent_Builder; cdecl;
  end;
  TJPlaybackStateEvent_Builder = class(TJavaGenericImport<JPlaybackStateEvent_BuilderClass, JPlaybackStateEvent_Builder>) end;

  JRecordingSessionClass = interface(JObjectClass)
    ['{98096AAC-037E-4862-9A45-6058D6B3F591}']
  end;

  [JavaSignature('android/media/metrics/RecordingSession')]
  JRecordingSession = interface(JObject)
    ['{82EC11C5-62E1-4204-8502-E803EE1A6BD6}']
    procedure close; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSessionId: JLogSessionId; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJRecordingSession = class(TJavaGenericImport<JRecordingSessionClass, JRecordingSession>) end;

  JTrackChangeEventClass = interface(Jmetrics_EventClass)
    ['{F686B985-A3F3-4D19-BE00-F606321348D5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetTRACK_CHANGE_REASON_ADAPTIVE: Integer; cdecl;
    {class} function _GetTRACK_CHANGE_REASON_INITIAL: Integer; cdecl;
    {class} function _GetTRACK_CHANGE_REASON_MANUAL: Integer; cdecl;
    {class} function _GetTRACK_CHANGE_REASON_OTHER: Integer; cdecl;
    {class} function _GetTRACK_CHANGE_REASON_UNKNOWN: Integer; cdecl;
    {class} function _GetTRACK_STATE_OFF: Integer; cdecl;
    {class} function _GetTRACK_STATE_ON: Integer; cdecl;
    {class} function _GetTRACK_TYPE_AUDIO: Integer; cdecl;
    {class} function _GetTRACK_TYPE_TEXT: Integer; cdecl;
    {class} function _GetTRACK_TYPE_VIDEO: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property TRACK_CHANGE_REASON_ADAPTIVE: Integer read _GetTRACK_CHANGE_REASON_ADAPTIVE;
    {class} property TRACK_CHANGE_REASON_INITIAL: Integer read _GetTRACK_CHANGE_REASON_INITIAL;
    {class} property TRACK_CHANGE_REASON_MANUAL: Integer read _GetTRACK_CHANGE_REASON_MANUAL;
    {class} property TRACK_CHANGE_REASON_OTHER: Integer read _GetTRACK_CHANGE_REASON_OTHER;
    {class} property TRACK_CHANGE_REASON_UNKNOWN: Integer read _GetTRACK_CHANGE_REASON_UNKNOWN;
    {class} property TRACK_STATE_OFF: Integer read _GetTRACK_STATE_OFF;
    {class} property TRACK_STATE_ON: Integer read _GetTRACK_STATE_ON;
    {class} property TRACK_TYPE_AUDIO: Integer read _GetTRACK_TYPE_AUDIO;
    {class} property TRACK_TYPE_TEXT: Integer read _GetTRACK_TYPE_TEXT;
    {class} property TRACK_TYPE_VIDEO: Integer read _GetTRACK_TYPE_VIDEO;
  end;

  [JavaSignature('android/media/metrics/TrackChangeEvent')]
  JTrackChangeEvent = interface(Jmetrics_Event)
    ['{1F05FDA1-1679-46AE-88E9-6E6E4E9FA31E}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioSampleRate: Integer; cdecl;
    function getBitrate: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getCodecName: JString; cdecl;
    function getContainerMimeType: JString; cdecl;
    function getHeight: Integer; cdecl;
    function getLanguage: JString; cdecl;
    function getLanguageRegion: JString; cdecl;
    function getMetricsBundle: JBundle; cdecl;
    function getSampleMimeType: JString; cdecl;
    function getTimeSinceCreatedMillis: Int64; cdecl;
    function getTrackChangeReason: Integer; cdecl;
    function getTrackState: Integer; cdecl;
    function getTrackType: Integer; cdecl;
    function getVideoFrameRate: Single; cdecl;
    function getWidth: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTrackChangeEvent = class(TJavaGenericImport<JTrackChangeEventClass, JTrackChangeEvent>) end;

  JTrackChangeEvent_BuilderClass = interface(JObjectClass)
    ['{77652472-4E7B-43A6-B459-B5B22E67B692}']
    {class} function init(type_: Integer): JTrackChangeEvent_Builder; cdecl;
  end;

  [JavaSignature('android/media/metrics/TrackChangeEvent$Builder')]
  JTrackChangeEvent_Builder = interface(JObject)
    ['{1E81C485-A739-4A61-BEC0-832F6E16D30A}']
    function build: JTrackChangeEvent; cdecl;
    function setAudioSampleRate(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setBitrate(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setChannelCount(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setCodecName(value: JString): JTrackChangeEvent_Builder; cdecl;
    function setContainerMimeType(value: JString): JTrackChangeEvent_Builder; cdecl;
    function setHeight(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setLanguage(value: JString): JTrackChangeEvent_Builder; cdecl;
    function setLanguageRegion(value: JString): JTrackChangeEvent_Builder; cdecl;
    function setMetricsBundle(metricsBundle: JBundle): JTrackChangeEvent_Builder; cdecl;
    function setSampleMimeType(value: JString): JTrackChangeEvent_Builder; cdecl;
    function setTimeSinceCreatedMillis(value: Int64): JTrackChangeEvent_Builder; cdecl;
    function setTrackChangeReason(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setTrackState(value: Integer): JTrackChangeEvent_Builder; cdecl;
    function setVideoFrameRate(value: Single): JTrackChangeEvent_Builder; cdecl;
    function setWidth(value: Integer): JTrackChangeEvent_Builder; cdecl;
  end;
  TJTrackChangeEvent_Builder = class(TJavaGenericImport<JTrackChangeEvent_BuilderClass, JTrackChangeEvent_Builder>) end;

  JTranscodingSessionClass = interface(JObjectClass)
    ['{DCFA947E-F681-4276-848B-250AFCCD82B6}']
  end;

  [JavaSignature('android/media/metrics/TranscodingSession')]
  JTranscodingSession = interface(JObject)
    ['{3CFB4D1C-7B34-4C0F-851D-765D8CFBCCBD}']
    procedure close; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getSessionId: JLogSessionId; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJTranscodingSession = class(TJavaGenericImport<JTranscodingSessionClass, JTranscodingSession>) end;

  JMidiDeviceClass = interface(JObjectClass)
    ['{395FA5A0-52C7-4532-8A6F-C2B4F031EE7D}']
  end;

  [JavaSignature('android/media/midi/MidiDevice')]
  JMidiDevice = interface(JObject)
    ['{1F5DB79E-580C-4FD3-A0C4-7F4237B6CF4B}']
    procedure close; cdecl;
    function connectPorts(inputPort: JMidiInputPort; outputPortNumber: Integer): JMidiDevice_MidiConnection; cdecl;
    function getInfo: JMidiDeviceInfo; cdecl;
    function openInputPort(portNumber: Integer): JMidiInputPort; cdecl;
    function openOutputPort(portNumber: Integer): JMidiOutputPort; cdecl;
    function toString: JString; cdecl;
  end;
  TJMidiDevice = class(TJavaGenericImport<JMidiDeviceClass, JMidiDevice>) end;

  JMidiDevice_MidiConnectionClass = interface(JObjectClass)
    ['{672B6D66-8E49-4400-9BF5-8F43850FB5D2}']
  end;

  [JavaSignature('android/media/midi/MidiDevice$MidiConnection')]
  JMidiDevice_MidiConnection = interface(JObject)
    ['{961BABB4-CCF5-482C-AAC7-61EA15822464}']
    procedure close; cdecl;
  end;
  TJMidiDevice_MidiConnection = class(TJavaGenericImport<JMidiDevice_MidiConnectionClass, JMidiDevice_MidiConnection>) end;

  JMidiDeviceInfoClass = interface(JObjectClass)
    ['{A465A5A3-B299-469D-A4BC-F3EEBC8084E0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPROPERTY_BLUETOOTH_DEVICE: JString; cdecl;
    {class} function _GetPROPERTY_MANUFACTURER: JString; cdecl;
    {class} function _GetPROPERTY_NAME: JString; cdecl;
    {class} function _GetPROPERTY_PRODUCT: JString; cdecl;
    {class} function _GetPROPERTY_SERIAL_NUMBER: JString; cdecl;
    {class} function _GetPROPERTY_USB_DEVICE: JString; cdecl;
    {class} function _GetPROPERTY_VERSION: JString; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS_AND_JRTS: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS_AND_JRTS: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_2_0: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_MIDI_2_0_AND_JRTS: Integer; cdecl;
    {class} function _GetPROTOCOL_UMP_USE_MIDI_CI: Integer; cdecl;
    {class} function _GetPROTOCOL_UNKNOWN: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH: Integer; cdecl;
    {class} function _GetTYPE_USB: Integer; cdecl;
    {class} function _GetTYPE_VIRTUAL: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PROPERTY_BLUETOOTH_DEVICE: JString read _GetPROPERTY_BLUETOOTH_DEVICE;
    {class} property PROPERTY_MANUFACTURER: JString read _GetPROPERTY_MANUFACTURER;
    {class} property PROPERTY_NAME: JString read _GetPROPERTY_NAME;
    {class} property PROPERTY_PRODUCT: JString read _GetPROPERTY_PRODUCT;
    {class} property PROPERTY_SERIAL_NUMBER: JString read _GetPROPERTY_SERIAL_NUMBER;
    {class} property PROPERTY_USB_DEVICE: JString read _GetPROPERTY_USB_DEVICE;
    {class} property PROPERTY_VERSION: JString read _GetPROPERTY_VERSION;
    {class} property PROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS: Integer read _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS;
    {class} property PROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS_AND_JRTS: Integer read _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_128_BITS_AND_JRTS;
    {class} property PROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS: Integer read _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS;
    {class} property PROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS_AND_JRTS: Integer read _GetPROTOCOL_UMP_MIDI_1_0_UP_TO_64_BITS_AND_JRTS;
    {class} property PROTOCOL_UMP_MIDI_2_0: Integer read _GetPROTOCOL_UMP_MIDI_2_0;
    {class} property PROTOCOL_UMP_MIDI_2_0_AND_JRTS: Integer read _GetPROTOCOL_UMP_MIDI_2_0_AND_JRTS;
    {class} property PROTOCOL_UMP_USE_MIDI_CI: Integer read _GetPROTOCOL_UMP_USE_MIDI_CI;
    {class} property PROTOCOL_UNKNOWN: Integer read _GetPROTOCOL_UNKNOWN;
    {class} property TYPE_BLUETOOTH: Integer read _GetTYPE_BLUETOOTH;
    {class} property TYPE_USB: Integer read _GetTYPE_USB;
    {class} property TYPE_VIRTUAL: Integer read _GetTYPE_VIRTUAL;
  end;

  [JavaSignature('android/media/midi/MidiDeviceInfo')]
  JMidiDeviceInfo = interface(JObject)
    ['{E9950E7C-BCA4-424A-90A7-23BAA66CDBE1}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDefaultProtocol: Integer; cdecl;
    function getId: Integer; cdecl;
    function getInputPortCount: Integer; cdecl;
    function getOutputPortCount: Integer; cdecl;
    function getPorts: TJavaObjectArray<JMidiDeviceInfo_PortInfo>; cdecl;
    function getProperties: JBundle; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isPrivate: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJMidiDeviceInfo = class(TJavaGenericImport<JMidiDeviceInfoClass, JMidiDeviceInfo>) end;

  JMidiDeviceInfo_PortInfoClass = interface(JObjectClass)
    ['{FE15B908-45EF-47EC-89C9-66CE40E67449}']
    {class} function _GetTYPE_INPUT: Integer; cdecl;
    {class} function _GetTYPE_OUTPUT: Integer; cdecl;
    {class} property TYPE_INPUT: Integer read _GetTYPE_INPUT;
    {class} property TYPE_OUTPUT: Integer read _GetTYPE_OUTPUT;
  end;

  [JavaSignature('android/media/midi/MidiDeviceInfo$PortInfo')]
  JMidiDeviceInfo_PortInfo = interface(JObject)
    ['{6B280CEB-8BC6-4C87-BFAF-55F37D385E52}']
    function getName: JString; cdecl;
    function getPortNumber: Integer; cdecl;
    function getType: Integer; cdecl;
  end;
  TJMidiDeviceInfo_PortInfo = class(TJavaGenericImport<JMidiDeviceInfo_PortInfoClass, JMidiDeviceInfo_PortInfo>) end;

  JMidiDeviceServiceClass = interface(JServiceClass)
    ['{4DC0AA9B-13CB-4098-830D-11670B16E6C7}']
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function init: JMidiDeviceService; cdecl;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
  end;

  [JavaSignature('android/media/midi/MidiDeviceService')]
  JMidiDeviceService = interface(JService)
    ['{8C34974B-A4F0-44DC-B96B-17775C4A4990}']
    function getDeviceInfo: JMidiDeviceInfo; cdecl;
    function getOutputPortReceivers: TJavaObjectArray<JMidiReceiver>; cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onClose; cdecl;
    procedure onCreate; cdecl;
    procedure onDeviceStatusChanged(status: JMidiDeviceStatus); cdecl;
    function onGetInputPortReceivers: TJavaObjectArray<JMidiReceiver>; cdecl;
  end;
  TJMidiDeviceService = class(TJavaGenericImport<JMidiDeviceServiceClass, JMidiDeviceService>) end;

  JMidiDeviceStatusClass = interface(JObjectClass)
    ['{FDC237D2-56BB-4B92-9013-B8B9995CB04A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/midi/MidiDeviceStatus')]
  JMidiDeviceStatus = interface(JObject)
    ['{7E4A9DAE-9C77-429F-B52D-FB2C55459A56}']
    function describeContents: Integer; cdecl;
    function getDeviceInfo: JMidiDeviceInfo; cdecl;
    function getOutputPortOpenCount(portNumber: Integer): Integer; cdecl;
    function isInputPortOpen(portNumber: Integer): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJMidiDeviceStatus = class(TJavaGenericImport<JMidiDeviceStatusClass, JMidiDeviceStatus>) end;

  JMidiReceiverClass = interface(JObjectClass)
    ['{0CCECD67-D5F2-45C0-A49A-443CE99311DC}']
    {class} function init: JMidiReceiver; cdecl; overload;
    {class} function init(maxMessageSize: Integer): JMidiReceiver; cdecl; overload;
  end;

  [JavaSignature('android/media/midi/MidiReceiver')]
  JMidiReceiver = interface(JObject)
    ['{1685B7DB-BD4A-4C6B-AB17-E234E834B69C}']
    procedure flush; cdecl;
    function getMaxMessageSize: Integer; cdecl;
    procedure onFlush; cdecl;
    procedure onSend(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl;
    procedure send(msg: TJavaArray<Byte>; offset: Integer; count: Integer); cdecl; overload;
    procedure send(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl; overload;
  end;
  TJMidiReceiver = class(TJavaGenericImport<JMidiReceiverClass, JMidiReceiver>) end;

  JMidiInputPortClass = interface(JMidiReceiverClass)
    ['{0E3E4890-4690-48CA-97E6-77F1B750612D}']
  end;

  [JavaSignature('android/media/midi/MidiInputPort')]
  JMidiInputPort = interface(JMidiReceiver)
    ['{D27C6ACE-6CF0-41BD-BE63-F829B56793C0}']
    procedure close; cdecl;
    function getPortNumber: Integer; cdecl;
    procedure onFlush; cdecl;
    procedure onSend(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl;
  end;
  TJMidiInputPort = class(TJavaGenericImport<JMidiInputPortClass, JMidiInputPort>) end;

  JMidiManagerClass = interface(JObjectClass)
    ['{49DB445C-C786-4316-B589-8411C19B2355}']
    {class} function _GetTRANSPORT_MIDI_BYTE_STREAM: Integer; cdecl;
    {class} function _GetTRANSPORT_UNIVERSAL_MIDI_PACKETS: Integer; cdecl;
    {class} property TRANSPORT_MIDI_BYTE_STREAM: Integer read _GetTRANSPORT_MIDI_BYTE_STREAM;
    {class} property TRANSPORT_UNIVERSAL_MIDI_PACKETS: Integer read _GetTRANSPORT_UNIVERSAL_MIDI_PACKETS;
  end;

  [JavaSignature('android/media/midi/MidiManager')]
  JMidiManager = interface(JObject)
    ['{AB859D24-0EFE-4B95-AAE3-82CB8AC52ED1}']
    function getDevices: TJavaObjectArray<JMidiDeviceInfo>; cdecl;//Deprecated
    function getDevicesForTransport(transport: Integer): JSet; cdecl;
    procedure openBluetoothDevice(bluetoothDevice: JBluetoothDevice; listener: JMidiManager_OnDeviceOpenedListener; handler: JHandler); cdecl;
    procedure openDevice(deviceInfo: JMidiDeviceInfo; listener: JMidiManager_OnDeviceOpenedListener; handler: JHandler); cdecl;
    procedure registerDeviceCallback(callback: JMidiManager_DeviceCallback; handler: JHandler); cdecl; overload;//Deprecated
    procedure registerDeviceCallback(transport: Integer; executor: JExecutor; callback: JMidiManager_DeviceCallback); cdecl; overload;
    procedure unregisterDeviceCallback(callback: JMidiManager_DeviceCallback); cdecl;
  end;
  TJMidiManager = class(TJavaGenericImport<JMidiManagerClass, JMidiManager>) end;

  JMidiManager_DeviceCallbackClass = interface(JObjectClass)
    ['{4FAAAC9C-7841-4CDD-86EF-0BFF98A8B580}']
    {class} function init: JMidiManager_DeviceCallback; cdecl;
  end;

  [JavaSignature('android/media/midi/MidiManager$DeviceCallback')]
  JMidiManager_DeviceCallback = interface(JObject)
    ['{654B6030-ECA2-4BF6-B923-83EFDDC26C45}']
    procedure onDeviceAdded(device: JMidiDeviceInfo); cdecl;
    procedure onDeviceRemoved(device: JMidiDeviceInfo); cdecl;
    procedure onDeviceStatusChanged(status: JMidiDeviceStatus); cdecl;
  end;
  TJMidiManager_DeviceCallback = class(TJavaGenericImport<JMidiManager_DeviceCallbackClass, JMidiManager_DeviceCallback>) end;

  JMidiManager_OnDeviceOpenedListenerClass = interface(IJavaClass)
    ['{11DABDDC-283F-4AC7-B440-9A60A0798191}']
  end;

  [JavaSignature('android/media/midi/MidiManager$OnDeviceOpenedListener')]
  JMidiManager_OnDeviceOpenedListener = interface(IJavaInstance)
    ['{9FF14636-1673-454D-B7A3-B5D3E47DF991}']
    procedure onDeviceOpened(device: JMidiDevice); cdecl;
  end;
  TJMidiManager_OnDeviceOpenedListener = class(TJavaGenericImport<JMidiManager_OnDeviceOpenedListenerClass, JMidiManager_OnDeviceOpenedListener>) end;

  JMidiSenderClass = interface(JObjectClass)
    ['{6F9809BD-BCB7-44A7-9C71-DB3A8F9CFE9A}']
    {class} function init: JMidiSender; cdecl;
  end;

  [JavaSignature('android/media/midi/MidiSender')]
  JMidiSender = interface(JObject)
    ['{09B5168E-98B6-4814-A172-6507C1E2F60E}']
    procedure connect(receiver: JMidiReceiver); cdecl;
    procedure disconnect(receiver: JMidiReceiver); cdecl;
    procedure onConnect(receiver: JMidiReceiver); cdecl;
    procedure onDisconnect(receiver: JMidiReceiver); cdecl;
  end;
  TJMidiSender = class(TJavaGenericImport<JMidiSenderClass, JMidiSender>) end;

  JMidiOutputPortClass = interface(JMidiSenderClass)
    ['{54BEF4BB-E2DC-45BA-8877-0DB9A03566CB}']
  end;

  [JavaSignature('android/media/midi/MidiOutputPort')]
  JMidiOutputPort = interface(JMidiSender)
    ['{27269721-B1EE-4372-959B-58584ED3B1DC}']
    procedure close; cdecl;
    function getPortNumber: Integer; cdecl;
    procedure onConnect(receiver: JMidiReceiver); cdecl;
    procedure onDisconnect(receiver: JMidiReceiver); cdecl;
  end;
  TJMidiOutputPort = class(TJavaGenericImport<JMidiOutputPortClass, JMidiOutputPort>) end;

  JMediaProjectionClass = interface(JObjectClass)
    ['{671A8337-74A8-47BB-9752-5F6AC9CB340B}']
  end;

  [JavaSignature('android/media/projection/MediaProjection')]
  JMediaProjection = interface(JObject)
    ['{7C231C86-6D5D-4179-A8D4-A6577D7BE0D0}']
    function createVirtualDisplay(name: JString; width: Integer; height: Integer; dpi: Integer; flags: Integer; surface: JSurface; callback: JVirtualDisplay_Callback; handler: JHandler): JVirtualDisplay; cdecl;
    procedure registerCallback(callback: JMediaProjection_Callback; handler: JHandler); cdecl;
    procedure stop; cdecl;
    procedure unregisterCallback(callback: JMediaProjection_Callback); cdecl;
  end;
  TJMediaProjection = class(TJavaGenericImport<JMediaProjectionClass, JMediaProjection>) end;

  JMediaProjection_CallbackClass = interface(JObjectClass)
    ['{F10259FF-6EB2-422C-8CCD-D729A406206D}']
    {class} function init: JMediaProjection_Callback; cdecl;
  end;

  [JavaSignature('android/media/projection/MediaProjection$Callback')]
  JMediaProjection_Callback = interface(JObject)
    ['{75A3C800-92FC-4E1E-B0A9-52D1144EC066}']
    procedure onStop; cdecl;
  end;
  TJMediaProjection_Callback = class(TJavaGenericImport<JMediaProjection_CallbackClass, JMediaProjection_Callback>) end;

  JMediaProjectionManagerClass = interface(JObjectClass)
    ['{311A788C-E5D4-40F1-ABE2-32B15EAD8B35}']
  end;

  [JavaSignature('android/media/projection/MediaProjectionManager')]
  JMediaProjectionManager = interface(JObject)
    ['{8EF00E7E-ECE6-48D7-A512-52CE3704B0FF}']
    function createScreenCaptureIntent: JIntent; cdecl;
    function getMediaProjection(resultCode: Integer; resultData: JIntent): JMediaProjection; cdecl;
  end;
  TJMediaProjectionManager = class(TJavaGenericImport<JMediaProjectionManagerClass, JMediaProjectionManager>) end;

  Jsession_MediaControllerClass = interface(JObjectClass)
    ['{CDC93E33-2AE5-406F-B30A-6024E04CF5B1}']
    {class} function init(context: JContext; token: JMediaSession_Token): Jsession_MediaController; cdecl;
  end;

  [JavaSignature('android/media/session/MediaController')]
  Jsession_MediaController = interface(JObject)
    ['{91D95F61-AC6D-4A3F-BB23-61C5FFC68662}']
    procedure adjustVolume(direction: Integer; flags: Integer); cdecl;
    function dispatchMediaButtonEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function getExtras: JBundle; cdecl;
    function getFlags: Int64; cdecl;
    function getMetadata: Jmedia_MediaMetadata; cdecl;
    function getPackageName: JString; cdecl;
    function getPlaybackInfo: JMediaController_PlaybackInfo; cdecl;
    function getPlaybackState: JPlaybackState; cdecl;
    function getQueue: JList; cdecl;
    function getQueueTitle: JCharSequence; cdecl;
    function getRatingType: Integer; cdecl;
    function getSessionActivity: JPendingIntent; cdecl;
    function getSessionInfo: JBundle; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function getTag: JString; cdecl;
    function getTransportControls: JMediaController_TransportControls; cdecl;
    procedure registerCallback(callback: JMediaController_Callback); cdecl; overload;
    procedure registerCallback(callback: JMediaController_Callback; handler: JHandler); cdecl; overload;
    procedure sendCommand(command: JString; args: JBundle; cb: JResultReceiver); cdecl;
    procedure setVolumeTo(value: Integer; flags: Integer); cdecl;
    procedure unregisterCallback(callback: JMediaController_Callback); cdecl;
  end;
  TJsession_MediaController = class(TJavaGenericImport<Jsession_MediaControllerClass, Jsession_MediaController>) end;

  JMediaController_CallbackClass = interface(JObjectClass)
    ['{686A7C71-CE1C-4A03-AA1A-A9E8B5BB561C}']
    {class} function init: JMediaController_Callback; cdecl;
  end;

  [JavaSignature('android/media/session/MediaController$Callback')]
  JMediaController_Callback = interface(JObject)
    ['{173EA302-3941-4BB0-B5EC-AF19CCD30021}']
    procedure onAudioInfoChanged(info: JMediaController_PlaybackInfo); cdecl;
    procedure onExtrasChanged(extras: JBundle); cdecl;
    procedure onMetadataChanged(metadata: Jmedia_MediaMetadata); cdecl;
    procedure onPlaybackStateChanged(state: JPlaybackState); cdecl;
    procedure onQueueChanged(queue: JList); cdecl;
    procedure onQueueTitleChanged(title: JCharSequence); cdecl;
    procedure onSessionDestroyed; cdecl;
    procedure onSessionEvent(event: JString; extras: JBundle); cdecl;
  end;
  TJMediaController_Callback = class(TJavaGenericImport<JMediaController_CallbackClass, JMediaController_Callback>) end;

  JMediaController_PlaybackInfoClass = interface(JObjectClass)
    ['{196168F7-B750-484F-AC9C-F8D93E782B78}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPLAYBACK_TYPE_LOCAL: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_REMOTE: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PLAYBACK_TYPE_LOCAL: Integer read _GetPLAYBACK_TYPE_LOCAL;
    {class} property PLAYBACK_TYPE_REMOTE: Integer read _GetPLAYBACK_TYPE_REMOTE;
  end;

  [JavaSignature('android/media/session/MediaController$PlaybackInfo')]
  JMediaController_PlaybackInfo = interface(JObject)
    ['{B536C5C0-26C8-4487-AB17-98886C9C53B4}']
    function describeContents: Integer; cdecl;
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getCurrentVolume: Integer; cdecl;
    function getMaxVolume: Integer; cdecl;
    function getPlaybackType: Integer; cdecl;
    function getVolumeControl: Integer; cdecl;
    function getVolumeControlId: JString; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaController_PlaybackInfo = class(TJavaGenericImport<JMediaController_PlaybackInfoClass, JMediaController_PlaybackInfo>) end;

  JMediaController_TransportControlsClass = interface(JObjectClass)
    ['{9C224A90-7858-46AE-A728-7DB7AB3F5867}']
  end;

  [JavaSignature('android/media/session/MediaController$TransportControls')]
  JMediaController_TransportControls = interface(JObject)
    ['{1EDA0FD8-309C-4CA0-81D1-D71C546688D5}']
    procedure fastForward; cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure playFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure playFromSearch(query: JString; extras: JBundle); cdecl;
    procedure playFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure prepare; cdecl;
    procedure prepareFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure prepareFromSearch(query: JString; extras: JBundle); cdecl;
    procedure prepareFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure rewind; cdecl;
    procedure seekTo(pos: Int64); cdecl;
    procedure sendCustomAction(customAction: JPlaybackState_CustomAction; args: JBundle); cdecl; overload;
    procedure sendCustomAction(action: JString; args: JBundle); cdecl; overload;
    procedure setPlaybackSpeed(speed: Single); cdecl;
    procedure setRating(rating: JRating); cdecl;
    procedure skipToNext; cdecl;
    procedure skipToPrevious; cdecl;
    procedure skipToQueueItem(id: Int64); cdecl;
    procedure stop; cdecl;
  end;
  TJMediaController_TransportControls = class(TJavaGenericImport<JMediaController_TransportControlsClass, JMediaController_TransportControls>) end;

  JMediaSessionClass = interface(JObjectClass)
    ['{DD2E1A91-EAE6-43F0-996D-C35A3405ED42}']
    {class} function _GetFLAG_HANDLES_MEDIA_BUTTONS: Integer; cdecl;
    {class} function _GetFLAG_HANDLES_TRANSPORT_CONTROLS: Integer; cdecl;
    {class} function init(context: JContext; tag: JString): JMediaSession; cdecl; overload;
    {class} function init(context: JContext; tag: JString; sessionInfo: JBundle): JMediaSession; cdecl; overload;
    {class} property FLAG_HANDLES_MEDIA_BUTTONS: Integer read _GetFLAG_HANDLES_MEDIA_BUTTONS;
    {class} property FLAG_HANDLES_TRANSPORT_CONTROLS: Integer read _GetFLAG_HANDLES_TRANSPORT_CONTROLS;
  end;

  [JavaSignature('android/media/session/MediaSession')]
  JMediaSession = interface(JObject)
    ['{3A86CFAB-1B2A-44A4-9C12-39AF616344FE}']
    function getController: Jsession_MediaController; cdecl;
    function getCurrentControllerInfo: JMediaSessionManager_RemoteUserInfo; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function isActive: Boolean; cdecl;
    procedure release; cdecl;
    procedure sendSessionEvent(event: JString; extras: JBundle); cdecl;
    procedure setActive(active: Boolean); cdecl;
    procedure setCallback(callback: JMediaSession_Callback); cdecl; overload;
    procedure setCallback(callback: JMediaSession_Callback; handler: JHandler); cdecl; overload;
    procedure setExtras(extras: JBundle); cdecl;
    procedure setFlags(flags: Integer); cdecl;
    procedure setMediaButtonBroadcastReceiver(broadcastReceiver: JComponentName); cdecl;
    procedure setMediaButtonReceiver(mbr: JPendingIntent); cdecl;//Deprecated
    procedure setMetadata(metadata: Jmedia_MediaMetadata); cdecl;
    procedure setPlaybackState(state: JPlaybackState); cdecl;
    procedure setPlaybackToLocal(attributes: JAudioAttributes); cdecl;
    procedure setPlaybackToRemote(volumeProvider: JVolumeProvider); cdecl;
    procedure setQueue(queue: JList); cdecl;
    procedure setQueueTitle(title: JCharSequence); cdecl;
    procedure setRatingType(type_: Integer); cdecl;
    procedure setSessionActivity(pi: JPendingIntent); cdecl;
  end;
  TJMediaSession = class(TJavaGenericImport<JMediaSessionClass, JMediaSession>) end;

  JMediaSession_CallbackClass = interface(JObjectClass)
    ['{CDDCA65C-DD26-4BF7-A564-F86D96EA0B61}']
    {class} function init: JMediaSession_Callback; cdecl;
  end;

  [JavaSignature('android/media/session/MediaSession$Callback')]
  JMediaSession_Callback = interface(JObject)
    ['{B67D467F-4EB4-4B43-84FC-4FDC8EDFFBD9}']
    procedure onCommand(command: JString; args: JBundle; cb: JResultReceiver); cdecl;
    procedure onCustomAction(action: JString; extras: JBundle); cdecl;
    procedure onFastForward; cdecl;
    function onMediaButtonEvent(mediaButtonIntent: JIntent): Boolean; cdecl;
    procedure onPause; cdecl;
    procedure onPlay; cdecl;
    procedure onPlayFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure onPlayFromSearch(query: JString; extras: JBundle); cdecl;
    procedure onPlayFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure onPrepare; cdecl;
    procedure onPrepareFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure onPrepareFromSearch(query: JString; extras: JBundle); cdecl;
    procedure onPrepareFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure onRewind; cdecl;
    procedure onSeekTo(pos: Int64); cdecl;
    procedure onSetPlaybackSpeed(speed: Single); cdecl;
    procedure onSetRating(rating: JRating); cdecl;
    procedure onSkipToNext; cdecl;
    procedure onSkipToPrevious; cdecl;
    procedure onSkipToQueueItem(id: Int64); cdecl;
    procedure onStop; cdecl;
  end;
  TJMediaSession_Callback = class(TJavaGenericImport<JMediaSession_CallbackClass, JMediaSession_Callback>) end;

  JMediaSession_QueueItemClass = interface(JObjectClass)
    ['{304E802E-0D8D-4697-8F1E-66D714C5A54B}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetUNKNOWN_ID: Integer; cdecl;
    {class} function init(description: JMediaDescription; id: Int64): JMediaSession_QueueItem; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property UNKNOWN_ID: Integer read _GetUNKNOWN_ID;
  end;

  [JavaSignature('android/media/session/MediaSession$QueueItem')]
  JMediaSession_QueueItem = interface(JObject)
    ['{A8131EBF-3607-4920-956C-2D45F3157333}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getQueueId: Int64; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaSession_QueueItem = class(TJavaGenericImport<JMediaSession_QueueItemClass, JMediaSession_QueueItem>) end;

  JMediaSession_TokenClass = interface(JObjectClass)
    ['{BFA0DAE9-C1CB-4828-AD44-1FA0BA0E383F}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/session/MediaSession$Token')]
  JMediaSession_Token = interface(JObject)
    ['{9C7698F8-8021-4746-9E3A-B2BBE336167E}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaSession_Token = class(TJavaGenericImport<JMediaSession_TokenClass, JMediaSession_Token>) end;

  JMediaSessionManagerClass = interface(JObjectClass)
    ['{7A9C7CBC-ABA5-4BF3-BF59-C4F5A807102D}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager')]
  JMediaSessionManager = interface(JObject)
    ['{0BB154FE-A0E4-46DE-8702-A37590C31A4F}']
    procedure addOnActiveSessionsChangedListener(sessionListener: JMediaSessionManager_OnActiveSessionsChangedListener; notificationListener: JComponentName); cdecl; overload;
    procedure addOnActiveSessionsChangedListener(sessionListener: JMediaSessionManager_OnActiveSessionsChangedListener; notificationListener: JComponentName; handler: JHandler); cdecl; overload;
    procedure addOnMediaKeyEventSessionChangedListener(executor: JExecutor; listener: JMediaSessionManager_OnMediaKeyEventSessionChangedListener); cdecl;
    procedure addOnSession2TokensChangedListener(listener: JMediaSessionManager_OnSession2TokensChangedListener); cdecl; overload;
    procedure addOnSession2TokensChangedListener(listener: JMediaSessionManager_OnSession2TokensChangedListener; handler: JHandler); cdecl; overload;
    function getActiveSessions(notificationListener: JComponentName): JList; cdecl;
    function getMediaKeyEventSession: JMediaSession_Token; cdecl;
    function getMediaKeyEventSessionPackageName: JString; cdecl;
    function getSession2Tokens: JList; cdecl;
    function isTrustedForMediaControl(userInfo: JMediaSessionManager_RemoteUserInfo): Boolean; cdecl;
    procedure notifySession2Created(token: JObject); cdecl;//Deprecated
    procedure removeOnActiveSessionsChangedListener(sessionListener: JMediaSessionManager_OnActiveSessionsChangedListener); cdecl;
    procedure removeOnMediaKeyEventSessionChangedListener(listener: JMediaSessionManager_OnMediaKeyEventSessionChangedListener); cdecl;
    procedure removeOnSession2TokensChangedListener(listener: JMediaSessionManager_OnSession2TokensChangedListener); cdecl;
  end;
  TJMediaSessionManager = class(TJavaGenericImport<JMediaSessionManagerClass, JMediaSessionManager>) end;

  JMediaSessionManager_OnActiveSessionsChangedListenerClass = interface(IJavaClass)
    ['{AEA2EEF3-9628-4332-B2D5-F4D55D4429FA}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager$OnActiveSessionsChangedListener')]
  JMediaSessionManager_OnActiveSessionsChangedListener = interface(IJavaInstance)
    ['{12307A91-67D5-4491-BDC3-8CCBF4134D68}']
    procedure onActiveSessionsChanged(controllers: JList); cdecl;
  end;
  TJMediaSessionManager_OnActiveSessionsChangedListener = class(TJavaGenericImport<JMediaSessionManager_OnActiveSessionsChangedListenerClass, JMediaSessionManager_OnActiveSessionsChangedListener>) end;

  JMediaSessionManager_OnMediaKeyEventSessionChangedListenerClass = interface(IJavaClass)
    ['{BB1EEF21-4CB6-4C95-846B-07A41B6F1B3C}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager$OnMediaKeyEventSessionChangedListener')]
  JMediaSessionManager_OnMediaKeyEventSessionChangedListener = interface(IJavaInstance)
    ['{44CA7F06-EE19-4D0C-8E48-546C8177947C}']
    procedure onMediaKeyEventSessionChanged(packageName: JString; sessionToken: JMediaSession_Token); cdecl;
  end;
  TJMediaSessionManager_OnMediaKeyEventSessionChangedListener = class(TJavaGenericImport<JMediaSessionManager_OnMediaKeyEventSessionChangedListenerClass, JMediaSessionManager_OnMediaKeyEventSessionChangedListener>) end;

  JMediaSessionManager_OnSession2TokensChangedListenerClass = interface(IJavaClass)
    ['{1491849A-D3AD-4EEC-9EE7-2BEFF86007D0}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager$OnSession2TokensChangedListener')]
  JMediaSessionManager_OnSession2TokensChangedListener = interface(IJavaInstance)
    ['{FBF88CD9-0712-403B-93DC-297322C8EF24}']
    procedure onSession2TokensChanged(tokens: JList); cdecl;
  end;
  TJMediaSessionManager_OnSession2TokensChangedListener = class(TJavaGenericImport<JMediaSessionManager_OnSession2TokensChangedListenerClass, JMediaSessionManager_OnSession2TokensChangedListener>) end;

  JMediaSessionManager_RemoteUserInfoClass = interface(JObjectClass)
    ['{F1E81811-88C9-451F-8D1C-3CDBCEE2F38C}']
    {class} function init(packageName: JString; pid: Integer; uid: Integer): JMediaSessionManager_RemoteUserInfo; cdecl;
  end;

  [JavaSignature('android/media/session/MediaSessionManager$RemoteUserInfo')]
  JMediaSessionManager_RemoteUserInfo = interface(JObject)
    ['{244CE08B-7959-4A2F-8B94-C56BCBAA8AE8}']
    function equals(obj: JObject): Boolean; cdecl;
    function getPackageName: JString; cdecl;
    function getPid: Integer; cdecl;
    function getUid: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJMediaSessionManager_RemoteUserInfo = class(TJavaGenericImport<JMediaSessionManager_RemoteUserInfoClass, JMediaSessionManager_RemoteUserInfo>) end;

  JPlaybackStateClass = interface(JObjectClass)
    ['{1FCAA0BE-7E3C-4F33-8F8F-C15B994F0B44}']
    {class} function _GetACTION_FAST_FORWARD: Int64; cdecl;
    {class} function _GetACTION_PAUSE: Int64; cdecl;
    {class} function _GetACTION_PLAY: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_MEDIA_ID: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_SEARCH: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_URI: Int64; cdecl;
    {class} function _GetACTION_PLAY_PAUSE: Int64; cdecl;
    {class} function _GetACTION_PREPARE: Int64; cdecl;
    {class} function _GetACTION_PREPARE_FROM_MEDIA_ID: Int64; cdecl;
    {class} function _GetACTION_PREPARE_FROM_SEARCH: Int64; cdecl;
    {class} function _GetACTION_PREPARE_FROM_URI: Int64; cdecl;
    {class} function _GetACTION_REWIND: Int64; cdecl;
    {class} function _GetACTION_SEEK_TO: Int64; cdecl;
    {class} function _GetACTION_SET_PLAYBACK_SPEED: Int64; cdecl;
    {class} function _GetACTION_SET_RATING: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_NEXT: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_PREVIOUS: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_QUEUE_ITEM: Int64; cdecl;
    {class} function _GetACTION_STOP: Int64; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPLAYBACK_POSITION_UNKNOWN: Int64; cdecl;
    {class} function _GetSTATE_BUFFERING: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_ERROR: Integer; cdecl;
    {class} function _GetSTATE_FAST_FORWARDING: Integer; cdecl;
    {class} function _GetSTATE_NONE: Integer; cdecl;
    {class} function _GetSTATE_PAUSED: Integer; cdecl;
    {class} function _GetSTATE_PLAYING: Integer; cdecl;
    {class} function _GetSTATE_REWINDING: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_NEXT: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_PREVIOUS: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_QUEUE_ITEM: Integer; cdecl;
    {class} function _GetSTATE_STOPPED: Integer; cdecl;
    {class} property ACTION_FAST_FORWARD: Int64 read _GetACTION_FAST_FORWARD;
    {class} property ACTION_PAUSE: Int64 read _GetACTION_PAUSE;
    {class} property ACTION_PLAY: Int64 read _GetACTION_PLAY;
    {class} property ACTION_PLAY_FROM_MEDIA_ID: Int64 read _GetACTION_PLAY_FROM_MEDIA_ID;
    {class} property ACTION_PLAY_FROM_SEARCH: Int64 read _GetACTION_PLAY_FROM_SEARCH;
    {class} property ACTION_PLAY_FROM_URI: Int64 read _GetACTION_PLAY_FROM_URI;
    {class} property ACTION_PLAY_PAUSE: Int64 read _GetACTION_PLAY_PAUSE;
    {class} property ACTION_PREPARE: Int64 read _GetACTION_PREPARE;
    {class} property ACTION_PREPARE_FROM_MEDIA_ID: Int64 read _GetACTION_PREPARE_FROM_MEDIA_ID;
    {class} property ACTION_PREPARE_FROM_SEARCH: Int64 read _GetACTION_PREPARE_FROM_SEARCH;
    {class} property ACTION_PREPARE_FROM_URI: Int64 read _GetACTION_PREPARE_FROM_URI;
    {class} property ACTION_REWIND: Int64 read _GetACTION_REWIND;
    {class} property ACTION_SEEK_TO: Int64 read _GetACTION_SEEK_TO;
    {class} property ACTION_SET_PLAYBACK_SPEED: Int64 read _GetACTION_SET_PLAYBACK_SPEED;
    {class} property ACTION_SET_RATING: Int64 read _GetACTION_SET_RATING;
    {class} property ACTION_SKIP_TO_NEXT: Int64 read _GetACTION_SKIP_TO_NEXT;
    {class} property ACTION_SKIP_TO_PREVIOUS: Int64 read _GetACTION_SKIP_TO_PREVIOUS;
    {class} property ACTION_SKIP_TO_QUEUE_ITEM: Int64 read _GetACTION_SKIP_TO_QUEUE_ITEM;
    {class} property ACTION_STOP: Int64 read _GetACTION_STOP;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PLAYBACK_POSITION_UNKNOWN: Int64 read _GetPLAYBACK_POSITION_UNKNOWN;
    {class} property STATE_BUFFERING: Integer read _GetSTATE_BUFFERING;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_ERROR: Integer read _GetSTATE_ERROR;
    {class} property STATE_FAST_FORWARDING: Integer read _GetSTATE_FAST_FORWARDING;
    {class} property STATE_NONE: Integer read _GetSTATE_NONE;
    {class} property STATE_PAUSED: Integer read _GetSTATE_PAUSED;
    {class} property STATE_PLAYING: Integer read _GetSTATE_PLAYING;
    {class} property STATE_REWINDING: Integer read _GetSTATE_REWINDING;
    {class} property STATE_SKIPPING_TO_NEXT: Integer read _GetSTATE_SKIPPING_TO_NEXT;
    {class} property STATE_SKIPPING_TO_PREVIOUS: Integer read _GetSTATE_SKIPPING_TO_PREVIOUS;
    {class} property STATE_SKIPPING_TO_QUEUE_ITEM: Integer read _GetSTATE_SKIPPING_TO_QUEUE_ITEM;
    {class} property STATE_STOPPED: Integer read _GetSTATE_STOPPED;
  end;

  [JavaSignature('android/media/session/PlaybackState')]
  JPlaybackState = interface(JObject)
    ['{430F777C-C978-47EC-BA10-DFB49F2339C7}']
    function describeContents: Integer; cdecl;
    function getActions: Int64; cdecl;
    function getActiveQueueItemId: Int64; cdecl;
    function getBufferedPosition: Int64; cdecl;
    function getCustomActions: JList; cdecl;
    function getErrorMessage: JCharSequence; cdecl;
    function getExtras: JBundle; cdecl;
    function getLastPositionUpdateTime: Int64; cdecl;
    function getPlaybackSpeed: Single; cdecl;
    function getPosition: Int64; cdecl;
    function getState: Integer; cdecl;
    function isActive: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackState = class(TJavaGenericImport<JPlaybackStateClass, JPlaybackState>) end;

  JPlaybackState_BuilderClass = interface(JObjectClass)
    ['{14CEB35A-9DEA-487E-8205-E6A9D52F5FA7}']
    {class} function init: JPlaybackState_Builder; cdecl; overload;
    {class} function init(from: JPlaybackState): JPlaybackState_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/session/PlaybackState$Builder')]
  JPlaybackState_Builder = interface(JObject)
    ['{C2583FAC-5C63-4A81-827F-25B6471F9C97}']
    function addCustomAction(action: JString; name: JString; icon: Integer): JPlaybackState_Builder; cdecl; overload;
    function addCustomAction(customAction: JPlaybackState_CustomAction): JPlaybackState_Builder; cdecl; overload;
    function build: JPlaybackState; cdecl;
    function setActions(actions: Int64): JPlaybackState_Builder; cdecl;
    function setActiveQueueItemId(id: Int64): JPlaybackState_Builder; cdecl;
    function setBufferedPosition(bufferedPosition: Int64): JPlaybackState_Builder; cdecl;
    function setErrorMessage(error: JCharSequence): JPlaybackState_Builder; cdecl;
    function setExtras(extras: JBundle): JPlaybackState_Builder; cdecl;
    function setState(state: Integer; position: Int64; playbackSpeed: Single; updateTime: Int64): JPlaybackState_Builder; cdecl; overload;
    function setState(state: Integer; position: Int64; playbackSpeed: Single): JPlaybackState_Builder; cdecl; overload;
  end;
  TJPlaybackState_Builder = class(TJavaGenericImport<JPlaybackState_BuilderClass, JPlaybackState_Builder>) end;

  JPlaybackState_CustomActionClass = interface(JObjectClass)
    ['{FD5442D6-8F41-4A9E-8702-74E630E56EEB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/session/PlaybackState$CustomAction')]
  JPlaybackState_CustomAction = interface(JObject)
    ['{ACAD5494-DA7A-41AE-9935-0A6C476501CD}']
    function describeContents: Integer; cdecl;
    function getAction: JString; cdecl;
    function getExtras: JBundle; cdecl;
    function getIcon: Integer; cdecl;
    function getName: JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackState_CustomAction = class(TJavaGenericImport<JPlaybackState_CustomActionClass, JPlaybackState_CustomAction>) end;

  JCustomAction_BuilderClass = interface(JObjectClass)
    ['{D9170974-7483-47AF-AC08-72555BEFF1E3}']
    {class} function init(action: JString; name: JCharSequence; icon: Integer): JCustomAction_Builder; cdecl;
  end;

  [JavaSignature('android/media/session/PlaybackState$CustomAction$Builder')]
  JCustomAction_Builder = interface(JObject)
    ['{27EAB325-4358-4187-A188-60DDBD0B0388}']
    function build: JPlaybackState_CustomAction; cdecl;
    function setExtras(extras: JBundle): JCustomAction_Builder; cdecl;
  end;
  TJCustomAction_Builder = class(TJavaGenericImport<JCustomAction_BuilderClass, JCustomAction_Builder>) end;

  Jtv_AdRequestClass = interface(JObjectClass)
    ['{4823CC9E-8811-45F1-AF64-229F87B927FA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetREQUEST_TYPE_START: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_STOP: Integer; cdecl;
    {class} function init(id: Integer; requestType: Integer; fileDescriptor: JParcelFileDescriptor; startTime: Int64; stopTime: Int64; echoInterval: Int64; mediaFileType: JString; metadata: JBundle): Jtv_AdRequest; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property REQUEST_TYPE_START: Integer read _GetREQUEST_TYPE_START;
    {class} property REQUEST_TYPE_STOP: Integer read _GetREQUEST_TYPE_STOP;
  end;

  [JavaSignature('android/media/tv/AdRequest')]
  Jtv_AdRequest = interface(JObject)
    ['{105498F0-BE92-4D69-85ED-686A55325DE4}']
    function describeContents: Integer; cdecl;
    function getEchoIntervalMillis: Int64; cdecl;
    function getFileDescriptor: JParcelFileDescriptor; cdecl;
    function getId: Integer; cdecl;
    function getMediaFileType: JString; cdecl;
    function getMetadata: JBundle; cdecl;
    function getRequestType: Integer; cdecl;
    function getStartTimeMillis: Int64; cdecl;
    function getStopTimeMillis: Int64; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJtv_AdRequest = class(TJavaGenericImport<Jtv_AdRequestClass, Jtv_AdRequest>) end;

  JAdResponseClass = interface(JObjectClass)
    ['{F4818E28-4EDF-4D1A-9C2F-2611886FA5B9}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRESPONSE_TYPE_ERROR: Integer; cdecl;
    {class} function _GetRESPONSE_TYPE_FINISHED: Integer; cdecl;
    {class} function _GetRESPONSE_TYPE_PLAYING: Integer; cdecl;
    {class} function _GetRESPONSE_TYPE_STOPPED: Integer; cdecl;
    {class} function init(id: Integer; responseType: Integer; elapsedTime: Int64): JAdResponse; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RESPONSE_TYPE_ERROR: Integer read _GetRESPONSE_TYPE_ERROR;
    {class} property RESPONSE_TYPE_FINISHED: Integer read _GetRESPONSE_TYPE_FINISHED;
    {class} property RESPONSE_TYPE_PLAYING: Integer read _GetRESPONSE_TYPE_PLAYING;
    {class} property RESPONSE_TYPE_STOPPED: Integer read _GetRESPONSE_TYPE_STOPPED;
  end;

  [JavaSignature('android/media/tv/AdResponse')]
  JAdResponse = interface(JObject)
    ['{B9045E70-4AC9-4B73-BE97-75541906250F}']
    function describeContents: Integer; cdecl;
    function getElapsedTimeMillis: Int64; cdecl;
    function getId: Integer; cdecl;
    function getResponseType: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAdResponse = class(TJavaGenericImport<JAdResponseClass, JAdResponse>) end;

  JAitInfoClass = interface(JObjectClass)
    ['{50248BE1-9354-4384-9928-8A09BC4B9EB0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(type_: Integer; version: Integer): JAitInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/tv/AitInfo')]
  JAitInfo = interface(JObject)
    ['{4B802A80-6A42-439B-A267-1473497B6965}']
    function describeContents: Integer; cdecl;
    function getType: Integer; cdecl;
    function getVersion: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAitInfo = class(TJavaGenericImport<JAitInfoClass, JAitInfo>) end;

  JBroadcastInfoRequestClass = interface(JObjectClass)
    ['{AF5BD307-BCBB-476E-ADCF-68705E6B0028}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetREQUEST_OPTION_AUTO_UPDATE: Integer; cdecl;
    {class} function _GetREQUEST_OPTION_REPEAT: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property REQUEST_OPTION_AUTO_UPDATE: Integer read _GetREQUEST_OPTION_AUTO_UPDATE;
    {class} property REQUEST_OPTION_REPEAT: Integer read _GetREQUEST_OPTION_REPEAT;
  end;

  [JavaSignature('android/media/tv/BroadcastInfoRequest')]
  JBroadcastInfoRequest = interface(JObject)
    ['{BCC0EBAB-1A55-4D8D-85C9-CB4E728BE78F}']
    function describeContents: Integer; cdecl;
    function getOption: Integer; cdecl;
    function getRequestId: Integer; cdecl;
    function getType: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJBroadcastInfoRequest = class(TJavaGenericImport<JBroadcastInfoRequestClass, JBroadcastInfoRequest>) end;

  JBroadcastInfoResponseClass = interface(JObjectClass)
    ['{85E6CF0C-95AA-4A9F-8752-95BB4F04AA3C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRESPONSE_RESULT_CANCEL: Integer; cdecl;
    {class} function _GetRESPONSE_RESULT_ERROR: Integer; cdecl;
    {class} function _GetRESPONSE_RESULT_OK: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RESPONSE_RESULT_CANCEL: Integer read _GetRESPONSE_RESULT_CANCEL;
    {class} property RESPONSE_RESULT_ERROR: Integer read _GetRESPONSE_RESULT_ERROR;
    {class} property RESPONSE_RESULT_OK: Integer read _GetRESPONSE_RESULT_OK;
  end;

  [JavaSignature('android/media/tv/BroadcastInfoResponse')]
  JBroadcastInfoResponse = interface(JObject)
    ['{E1ABA366-4F65-4690-B0B9-B412017966EF}']
    function describeContents: Integer; cdecl;
    function getRequestId: Integer; cdecl;
    function getResponseResult: Integer; cdecl;
    function getSequence: Integer; cdecl;
    function getType: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJBroadcastInfoResponse = class(TJavaGenericImport<JBroadcastInfoResponseClass, JBroadcastInfoResponse>) end;

  JCommandRequestClass = interface(JBroadcastInfoRequestClass)
    ['{9BE96E9A-B1E5-4189-886C-56844C39290F}']
    {class} function _GetARGUMENT_TYPE_JSON: JString; cdecl;
    {class} function _GetARGUMENT_TYPE_XML: JString; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; namespace: JString; name: JString; arguments: JString; argumentType: JString): JCommandRequest; cdecl;
    {class} property ARGUMENT_TYPE_JSON: JString read _GetARGUMENT_TYPE_JSON;
    {class} property ARGUMENT_TYPE_XML: JString read _GetARGUMENT_TYPE_XML;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/CommandRequest')]
  JCommandRequest = interface(JBroadcastInfoRequest)
    ['{FC63474D-3D25-4842-AD0E-9795FE4B7015}']
    function describeContents: Integer; cdecl;
    function getArgumentType: JString; cdecl;
    function getArguments: JString; cdecl;
    function getName: JString; cdecl;
    function getNamespace: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCommandRequest = class(TJavaGenericImport<JCommandRequestClass, JCommandRequest>) end;

  JCommandResponseClass = interface(JBroadcastInfoResponseClass)
    ['{3A2E1F21-129A-484C-8B1A-3DE4FEF5473E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRESPONSE_TYPE_JSON: JString; cdecl;
    {class} function _GetRESPONSE_TYPE_XML: JString; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; response: JString; responseType: JString): JCommandResponse; cdecl;
    {class} //CREATOR is defined in parent interface
    {class} property RESPONSE_TYPE_JSON: JString read _GetRESPONSE_TYPE_JSON;
    {class} property RESPONSE_TYPE_XML: JString read _GetRESPONSE_TYPE_XML;
  end;

  [JavaSignature('android/media/tv/CommandResponse')]
  JCommandResponse = interface(JBroadcastInfoResponse)
    ['{11D1F8F9-B32F-40A8-9D30-BA4AA0DA50CD}']
    function describeContents: Integer; cdecl;
    function getResponse: JString; cdecl;
    function getResponseType: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJCommandResponse = class(TJavaGenericImport<JCommandResponseClass, JCommandResponse>) end;

  JDsmccRequestClass = interface(JBroadcastInfoRequestClass)
    ['{1168C666-ADB9-4396-9E09-31A3233E8AD5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; uri: Jnet_Uri): JDsmccRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/DsmccRequest')]
  JDsmccRequest = interface(JBroadcastInfoRequest)
    ['{30C6F74A-9095-4A4E-9667-1331218FEBDE}']
    function describeContents: Integer; cdecl;
    function getUri: Jnet_Uri; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJDsmccRequest = class(TJavaGenericImport<JDsmccRequestClass, JDsmccRequest>) end;

  JDsmccResponseClass = interface(JBroadcastInfoResponseClass)
    ['{2F9A2422-68E5-4BEC-B3AF-5D5FCF1A77DB}']
    {class} function _GetBIOP_MESSAGE_TYPE_DIRECTORY: JString; cdecl;
    {class} function _GetBIOP_MESSAGE_TYPE_FILE: JString; cdecl;
    {class} function _GetBIOP_MESSAGE_TYPE_SERVICE_GATEWAY: JString; cdecl;
    {class} function _GetBIOP_MESSAGE_TYPE_STREAM: JString; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; file_: JParcelFileDescriptor): JDsmccResponse; cdecl; overload;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; isServiceGateway: Boolean; childList: JList): JDsmccResponse; cdecl; overload;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; eventIds: TJavaArray<Integer>; eventNames: TJavaObjectArray<JString>): JDsmccResponse; cdecl; overload;
    {class} property BIOP_MESSAGE_TYPE_DIRECTORY: JString read _GetBIOP_MESSAGE_TYPE_DIRECTORY;
    {class} property BIOP_MESSAGE_TYPE_FILE: JString read _GetBIOP_MESSAGE_TYPE_FILE;
    {class} property BIOP_MESSAGE_TYPE_SERVICE_GATEWAY: JString read _GetBIOP_MESSAGE_TYPE_SERVICE_GATEWAY;
    {class} property BIOP_MESSAGE_TYPE_STREAM: JString read _GetBIOP_MESSAGE_TYPE_STREAM;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/DsmccResponse')]
  JDsmccResponse = interface(JBroadcastInfoResponse)
    ['{817C81C6-5C23-437E-8AC3-DF1E6B1AC1E3}']
    function describeContents: Integer; cdecl;
    function getBiopMessageType: JString; cdecl;
    function getChildList: JList; cdecl;
    function getFile: JParcelFileDescriptor; cdecl;
    function getStreamEventIds: TJavaArray<Integer>; cdecl;
    function getStreamEventNames: TJavaObjectArray<JString>; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJDsmccResponse = class(TJavaGenericImport<JDsmccResponseClass, JDsmccResponse>) end;

  JPesRequestClass = interface(JBroadcastInfoRequestClass)
    ['{33CFB2AD-2CC0-42F7-AE1A-29AEB2DD74FA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; tsPid: Integer; streamId: Integer): JPesRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/PesRequest')]
  JPesRequest = interface(JBroadcastInfoRequest)
    ['{723E1C07-0DC8-43EF-AB7B-FB4DC3869415}']
    function describeContents: Integer; cdecl;
    function getStreamId: Integer; cdecl;
    function getTsPid: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPesRequest = class(TJavaGenericImport<JPesRequestClass, JPesRequest>) end;

  JPesResponseClass = interface(JBroadcastInfoResponseClass)
    ['{06C8B5F0-6829-48B1-BCE3-FD7CCEA82FD6}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; sharedFilterToken: JString): JPesResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/PesResponse')]
  JPesResponse = interface(JBroadcastInfoResponse)
    ['{BBD49293-4C5C-4EA2-A0C8-52EA6EA0A275}']
    function describeContents: Integer; cdecl;
    function getSharedFilterToken: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPesResponse = class(TJavaGenericImport<JPesResponseClass, JPesResponse>) end;

  JSectionRequestClass = interface(JBroadcastInfoRequestClass)
    ['{CA2A612D-70BD-4CC1-B94B-3222AC9D8286}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; tsPid: Integer; tableId: Integer; version: Integer): JSectionRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/SectionRequest')]
  JSectionRequest = interface(JBroadcastInfoRequest)
    ['{365EC8FE-23D2-4DB3-A3AB-CDE25D8D89D7}']
    function describeContents: Integer; cdecl;
    function getTableId: Integer; cdecl;
    function getTsPid: Integer; cdecl;
    function getVersion: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSectionRequest = class(TJavaGenericImport<JSectionRequestClass, JSectionRequest>) end;

  JSectionResponseClass = interface(JBroadcastInfoResponseClass)
    ['{841E5298-BE71-450E-AAAD-FB95C905C60D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; sessionId: Integer; version: Integer; sessionData: JBundle): JSectionResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/SectionResponse')]
  JSectionResponse = interface(JBroadcastInfoResponse)
    ['{4F319104-8869-401C-8907-7994694A22DB}']
    function describeContents: Integer; cdecl;
    function getSessionData: JBundle; cdecl;
    function getSessionId: Integer; cdecl;
    function getVersion: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJSectionResponse = class(TJavaGenericImport<JSectionResponseClass, JSectionResponse>) end;

  JStreamEventRequestClass = interface(JBroadcastInfoRequestClass)
    ['{C8CAE7ED-98F3-449D-B432-297D5F92E2FB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; targetUri: Jnet_Uri; eventName: JString): JStreamEventRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/StreamEventRequest')]
  JStreamEventRequest = interface(JBroadcastInfoRequest)
    ['{CD53D76C-0F93-4030-B549-522E1E57A15C}']
    function describeContents: Integer; cdecl;
    function getEventName: JString; cdecl;
    function getTargetUri: Jnet_Uri; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJStreamEventRequest = class(TJavaGenericImport<JStreamEventRequestClass, JStreamEventRequest>) end;

  JStreamEventResponseClass = interface(JBroadcastInfoResponseClass)
    ['{37838947-BE9C-433F-87C9-4037FB97A214}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; eventId: Integer; nptMillis: Int64; data: TJavaArray<Byte>): JStreamEventResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/StreamEventResponse')]
  JStreamEventResponse = interface(JBroadcastInfoResponse)
    ['{B5D9CF6E-EB28-4A61-BD6C-BB804EF2A907}']
    function describeContents: Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getEventId: Integer; cdecl;
    function getNptMillis: Int64; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJStreamEventResponse = class(TJavaGenericImport<JStreamEventResponseClass, JStreamEventResponse>) end;

  JTableRequestClass = interface(JBroadcastInfoRequestClass)
    ['{BC0739A6-6CD7-4BDB-8823-6F123F45A0DA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetTABLE_NAME_PAT: Integer; cdecl;
    {class} function _GetTABLE_NAME_PMT: Integer; cdecl;
    {class} function init(requestId: Integer; option: Integer; tableId: Integer; tableName: Integer; version: Integer): JTableRequest; cdecl;
    {class} //CREATOR is defined in parent interface
    {class} property TABLE_NAME_PAT: Integer read _GetTABLE_NAME_PAT;
    {class} property TABLE_NAME_PMT: Integer read _GetTABLE_NAME_PMT;
  end;

  [JavaSignature('android/media/tv/TableRequest')]
  JTableRequest = interface(JBroadcastInfoRequest)
    ['{DF162B68-5E94-4ACE-BDC3-5F629C32478A}']
    function describeContents: Integer; cdecl;
    function getTableId: Integer; cdecl;
    function getTableName: Integer; cdecl;
    function getVersion: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTableRequest = class(TJavaGenericImport<JTableRequestClass, JTableRequest>) end;

  JTableResponseClass = interface(JBroadcastInfoResponseClass)
    ['{9A9B2DCF-EF0B-425A-8137-DDC268BCBCC1}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; tableUri: Jnet_Uri; version: Integer; size: Integer): JTableResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/TableResponse')]
  JTableResponse = interface(JBroadcastInfoResponse)
    ['{8DFD217E-B150-45E4-9A18-73CABF9B0DEA}']
    function describeContents: Integer; cdecl;
    function getSize: Integer; cdecl;
    function getTableUri: Jnet_Uri; cdecl;
    function getVersion: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTableResponse = class(TJavaGenericImport<JTableResponseClass, JTableResponse>) end;

  JTimelineRequestClass = interface(JBroadcastInfoRequestClass)
    ['{521B764A-F493-4BE7-BED3-D3955C90274F}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; intervalMillis: Integer): JTimelineRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/TimelineRequest')]
  JTimelineRequest = interface(JBroadcastInfoRequest)
    ['{64AF50B5-6620-4897-8F7E-23D5C38A7F33}']
    function describeContents: Integer; cdecl;
    function getIntervalMillis: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTimelineRequest = class(TJavaGenericImport<JTimelineRequestClass, JTimelineRequest>) end;

  JTimelineResponseClass = interface(JBroadcastInfoResponseClass)
    ['{D9F89AB6-DEAE-4631-A306-0F6E5838A257}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; selector: JString; unitsPerTick: Integer; unitsPerSecond: Integer; wallClock: Int64; ticks: Int64): JTimelineResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/TimelineResponse')]
  JTimelineResponse = interface(JBroadcastInfoResponse)
    ['{A524213A-C240-45C3-80A8-CF2D39E5DD01}']
    function describeContents: Integer; cdecl;
    function getSelector: Jnet_Uri; cdecl;
    function getTicks: Int64; cdecl;
    function getUnitsPerSecond: Integer; cdecl;
    function getUnitsPerTick: Integer; cdecl;
    function getWallClock: Int64; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTimelineResponse = class(TJavaGenericImport<JTimelineResponseClass, JTimelineResponse>) end;

  JTsRequestClass = interface(JBroadcastInfoRequestClass)
    ['{C5B41E6B-ED9C-436B-AFDB-485477C94EEF}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; option: Integer; tsPid: Integer): JTsRequest; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/TsRequest')]
  JTsRequest = interface(JBroadcastInfoRequest)
    ['{10190964-44F8-4FB2-818A-D17D64BB6BC4}']
    function describeContents: Integer; cdecl;
    function getTsPid: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTsRequest = class(TJavaGenericImport<JTsRequestClass, JTsRequest>) end;

  JTsResponseClass = interface(JBroadcastInfoResponseClass)
    ['{F1D9E6BD-9536-4DFE-8A2D-3A98946133F6}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(requestId: Integer; sequence: Integer; responseResult: Integer; sharedFilterToken: JString): JTsResponse; cdecl;
    {class} //CREATOR is defined in parent interface
  end;

  [JavaSignature('android/media/tv/TsResponse')]
  JTsResponse = interface(JBroadcastInfoResponse)
    ['{907488C9-F628-4BA3-BFA8-9D0D13290E53}']
    function describeContents: Integer; cdecl;
    function getSharedFilterToken: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTsResponse = class(TJavaGenericImport<JTsResponseClass, JTsResponse>) end;

  JTvContentRatingClass = interface(JObjectClass)
    ['{322A526D-0620-49C6-A73B-16724301A4DC}']
    {class} function _GetUNRATED: JTvContentRating; cdecl;
    {class} function unflattenFromString(ratingString: JString): JTvContentRating; cdecl;
    {class} property UNRATED: JTvContentRating read _GetUNRATED;
  end;

  [JavaSignature('android/media/tv/TvContentRating')]
  JTvContentRating = interface(JObject)
    ['{85AA8AA2-F223-4815-A478-8D37FC54A1BC}']
    function &contains(rating: JTvContentRating): Boolean; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function flattenToString: JString; cdecl;
    function getDomain: JString; cdecl;
    function getMainRating: JString; cdecl;
    function getRatingSystem: JString; cdecl;
    function getSubRatings: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJTvContentRating = class(TJavaGenericImport<JTvContentRatingClass, JTvContentRating>) end;

  JTvContractClass = interface(JObjectClass)
    ['{617DCE60-1641-4F75-8B1B-F9459334F3B3}']
    {class} function _GetACTION_INITIALIZE_PROGRAMS: JString; cdecl;
    {class} function _GetACTION_PREVIEW_PROGRAM_ADDED_TO_WATCH_NEXT: JString; cdecl;
    {class} function _GetACTION_PREVIEW_PROGRAM_BROWSABLE_DISABLED: JString; cdecl;
    {class} function _GetACTION_REQUEST_CHANNEL_BROWSABLE: JString; cdecl;
    {class} function _GetACTION_WATCH_NEXT_PROGRAM_BROWSABLE_DISABLED: JString; cdecl;
    {class} function _GetAUTHORITY: JString; cdecl;
    {class} function _GetEXTRA_CHANNEL_ID: JString; cdecl;
    {class} function _GetEXTRA_PREVIEW_PROGRAM_ID: JString; cdecl;
    {class} function _GetEXTRA_WATCH_NEXT_PROGRAM_ID: JString; cdecl;
    {class} function buildChannelLogoUri(channelId: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildChannelLogoUri(channelUri: Jnet_Uri): Jnet_Uri; cdecl; overload;
    {class} function buildChannelUri(channelId: Int64): Jnet_Uri; cdecl;
    {class} function buildChannelUriForPassthroughInput(inputId: JString): Jnet_Uri; cdecl;
    {class} function buildChannelsUriForInput(inputId: JString): Jnet_Uri; cdecl;
    {class} function buildInputId(name: JComponentName): JString; cdecl;
    {class} function buildPreviewProgramUri(previewProgramId: Int64): Jnet_Uri; cdecl;
    {class} function buildPreviewProgramsUriForChannel(channelId: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildPreviewProgramsUriForChannel(channelUri: Jnet_Uri): Jnet_Uri; cdecl; overload;
    {class} function buildProgramUri(programId: Int64): Jnet_Uri; cdecl;
    {class} function buildProgramsUriForChannel(channelId: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelUri: Jnet_Uri): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelId: Int64; startTime: Int64; endTime: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelUri: Jnet_Uri; startTime: Int64; endTime: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildRecordedProgramUri(recordedProgramId: Int64): Jnet_Uri; cdecl;
    {class} function buildWatchNextProgramUri(watchNextProgramId: Int64): Jnet_Uri; cdecl;
    {class} function isChannelUri(uri: Jnet_Uri): Boolean; cdecl;
    {class} function isChannelUriForPassthroughInput(uri: Jnet_Uri): Boolean; cdecl;
    {class} function isChannelUriForTunerInput(uri: Jnet_Uri): Boolean; cdecl;
    {class} function isProgramUri(uri: Jnet_Uri): Boolean; cdecl;
    {class} function isRecordedProgramUri(uri: Jnet_Uri): Boolean; cdecl;
    {class} procedure requestChannelBrowsable(context: JContext; channelId: Int64); cdecl;
    {class} property ACTION_INITIALIZE_PROGRAMS: JString read _GetACTION_INITIALIZE_PROGRAMS;
    {class} property ACTION_PREVIEW_PROGRAM_ADDED_TO_WATCH_NEXT: JString read _GetACTION_PREVIEW_PROGRAM_ADDED_TO_WATCH_NEXT;
    {class} property ACTION_PREVIEW_PROGRAM_BROWSABLE_DISABLED: JString read _GetACTION_PREVIEW_PROGRAM_BROWSABLE_DISABLED;
    {class} property ACTION_REQUEST_CHANNEL_BROWSABLE: JString read _GetACTION_REQUEST_CHANNEL_BROWSABLE;
    {class} property ACTION_WATCH_NEXT_PROGRAM_BROWSABLE_DISABLED: JString read _GetACTION_WATCH_NEXT_PROGRAM_BROWSABLE_DISABLED;
    {class} property AUTHORITY: JString read _GetAUTHORITY;
    {class} property EXTRA_CHANNEL_ID: JString read _GetEXTRA_CHANNEL_ID;
    {class} property EXTRA_PREVIEW_PROGRAM_ID: JString read _GetEXTRA_PREVIEW_PROGRAM_ID;
    {class} property EXTRA_WATCH_NEXT_PROGRAM_ID: JString read _GetEXTRA_WATCH_NEXT_PROGRAM_ID;
  end;

  [JavaSignature('android/media/tv/TvContract')]
  JTvContract = interface(JObject)
    ['{4ACA1AE4-AA5E-4A88-9E7A-7D7438F979C3}']
  end;
  TJTvContract = class(TJavaGenericImport<JTvContractClass, JTvContract>) end;

  JTvContract_BaseTvColumnsClass = interface(JBaseColumnsClass)
    ['{773D31D0-ECF5-480E-B000-9930CA1749AD}']
    {class} function _GetCOLUMN_PACKAGE_NAME: JString; cdecl;
    {class} property COLUMN_PACKAGE_NAME: JString read _GetCOLUMN_PACKAGE_NAME;
  end;

  [JavaSignature('android/media/tv/TvContract$BaseTvColumns')]
  JTvContract_BaseTvColumns = interface(JBaseColumns)
    ['{9AD43EBD-F58F-4A5C-B381-862778904287}']
  end;
  TJTvContract_BaseTvColumns = class(TJavaGenericImport<JTvContract_BaseTvColumnsClass, JTvContract_BaseTvColumns>) end;

  JTvContract_ChannelsClass = interface(JObjectClass)
    ['{76C4883A-633D-4254-B8EB-E52557B19D4C}']
    {class} function _GetCOLUMN_APP_LINK_COLOR: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_ICON_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_INTENT_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_POSTER_ART_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_TEXT: JString; cdecl;
    {class} function _GetCOLUMN_BROADCAST_GENRE: JString; cdecl;
    {class} function _GetCOLUMN_BROWSABLE: JString; cdecl;
    {class} function _GetCOLUMN_CHANNEL_LIST_ID: JString; cdecl;
    {class} function _GetCOLUMN_DESCRIPTION: JString; cdecl;
    {class} function _GetCOLUMN_DISPLAY_NAME: JString; cdecl;
    {class} function _GetCOLUMN_DISPLAY_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_GLOBAL_CONTENT_ID: JString; cdecl;
    {class} function _GetCOLUMN_INPUT_ID: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_DATA: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG1: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG2: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG3: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG4: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_ID: JString; cdecl;
    {class} function _GetCOLUMN_LOCKED: JString; cdecl;
    {class} function _GetCOLUMN_NETWORK_AFFILIATION: JString; cdecl;
    {class} function _GetCOLUMN_ORIGINAL_NETWORK_ID: JString; cdecl;
    {class} function _GetCOLUMN_REMOTE_CONTROL_KEY_PRESET_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_SCRAMBLED: JString; cdecl;
    {class} function _GetCOLUMN_SEARCHABLE: JString; cdecl;
    {class} function _GetCOLUMN_SERVICE_ID: JString; cdecl;
    {class} function _GetCOLUMN_SERVICE_TYPE: JString; cdecl;
    {class} function _GetCOLUMN_TRANSIENT: JString; cdecl;
    {class} function _GetCOLUMN_TRANSPORT_STREAM_ID: JString; cdecl;
    {class} function _GetCOLUMN_TYPE: JString; cdecl;
    {class} function _GetCOLUMN_VERSION_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_VIDEO_FORMAT: JString; cdecl;
    {class} function _GetCOLUMN_VIDEO_RESOLUTION: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} function _GetSERVICE_TYPE_AUDIO: JString; cdecl;
    {class} function _GetSERVICE_TYPE_AUDIO_VIDEO: JString; cdecl;
    {class} function _GetSERVICE_TYPE_OTHER: JString; cdecl;
    {class} function _GetTYPE_1SEG: JString; cdecl;
    {class} function _GetTYPE_ATSC3_T: JString; cdecl;
    {class} function _GetTYPE_ATSC_C: JString; cdecl;
    {class} function _GetTYPE_ATSC_M_H: JString; cdecl;
    {class} function _GetTYPE_ATSC_T: JString; cdecl;
    {class} function _GetTYPE_CMMB: JString; cdecl;
    {class} function _GetTYPE_DTMB: JString; cdecl;
    {class} function _GetTYPE_DVB_C: JString; cdecl;
    {class} function _GetTYPE_DVB_C2: JString; cdecl;
    {class} function _GetTYPE_DVB_H: JString; cdecl;
    {class} function _GetTYPE_DVB_S: JString; cdecl;
    {class} function _GetTYPE_DVB_S2: JString; cdecl;
    {class} function _GetTYPE_DVB_SH: JString; cdecl;
    {class} function _GetTYPE_DVB_T: JString; cdecl;
    {class} function _GetTYPE_DVB_T2: JString; cdecl;
    {class} function _GetTYPE_ISDB_C: JString; cdecl;
    {class} function _GetTYPE_ISDB_S: JString; cdecl;
    {class} function _GetTYPE_ISDB_S3: JString; cdecl;
    {class} function _GetTYPE_ISDB_T: JString; cdecl;
    {class} function _GetTYPE_ISDB_TB: JString; cdecl;
    {class} function _GetTYPE_NTSC: JString; cdecl;
    {class} function _GetTYPE_OTHER: JString; cdecl;
    {class} function _GetTYPE_PAL: JString; cdecl;
    {class} function _GetTYPE_PREVIEW: JString; cdecl;
    {class} function _GetTYPE_SECAM: JString; cdecl;
    {class} function _GetTYPE_S_DMB: JString; cdecl;
    {class} function _GetTYPE_T_DMB: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_1080I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_1080P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_2160P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_240P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_360P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_4320P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_480I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_480P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_576I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_576P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_720P: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_ED: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_FHD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_HD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_SD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_UHD: JString; cdecl;
    {class} function getVideoResolution(videoFormat: JString): JString; cdecl;
    {class} property COLUMN_APP_LINK_COLOR: JString read _GetCOLUMN_APP_LINK_COLOR;
    {class} property COLUMN_APP_LINK_ICON_URI: JString read _GetCOLUMN_APP_LINK_ICON_URI;
    {class} property COLUMN_APP_LINK_INTENT_URI: JString read _GetCOLUMN_APP_LINK_INTENT_URI;
    {class} property COLUMN_APP_LINK_POSTER_ART_URI: JString read _GetCOLUMN_APP_LINK_POSTER_ART_URI;
    {class} property COLUMN_APP_LINK_TEXT: JString read _GetCOLUMN_APP_LINK_TEXT;
    {class} property COLUMN_BROADCAST_GENRE: JString read _GetCOLUMN_BROADCAST_GENRE;
    {class} property COLUMN_BROWSABLE: JString read _GetCOLUMN_BROWSABLE;
    {class} property COLUMN_CHANNEL_LIST_ID: JString read _GetCOLUMN_CHANNEL_LIST_ID;
    {class} property COLUMN_DESCRIPTION: JString read _GetCOLUMN_DESCRIPTION;
    {class} property COLUMN_DISPLAY_NAME: JString read _GetCOLUMN_DISPLAY_NAME;
    {class} property COLUMN_DISPLAY_NUMBER: JString read _GetCOLUMN_DISPLAY_NUMBER;
    {class} property COLUMN_GLOBAL_CONTENT_ID: JString read _GetCOLUMN_GLOBAL_CONTENT_ID;
    {class} property COLUMN_INPUT_ID: JString read _GetCOLUMN_INPUT_ID;
    {class} property COLUMN_INTERNAL_PROVIDER_DATA: JString read _GetCOLUMN_INTERNAL_PROVIDER_DATA;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG1: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG1;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG2: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG2;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG3: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG3;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG4: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG4;
    {class} property COLUMN_INTERNAL_PROVIDER_ID: JString read _GetCOLUMN_INTERNAL_PROVIDER_ID;
    {class} property COLUMN_LOCKED: JString read _GetCOLUMN_LOCKED;
    {class} property COLUMN_NETWORK_AFFILIATION: JString read _GetCOLUMN_NETWORK_AFFILIATION;
    {class} property COLUMN_ORIGINAL_NETWORK_ID: JString read _GetCOLUMN_ORIGINAL_NETWORK_ID;
    {class} property COLUMN_REMOTE_CONTROL_KEY_PRESET_NUMBER: JString read _GetCOLUMN_REMOTE_CONTROL_KEY_PRESET_NUMBER;
    {class} property COLUMN_SCRAMBLED: JString read _GetCOLUMN_SCRAMBLED;
    {class} property COLUMN_SEARCHABLE: JString read _GetCOLUMN_SEARCHABLE;
    {class} property COLUMN_SERVICE_ID: JString read _GetCOLUMN_SERVICE_ID;
    {class} property COLUMN_SERVICE_TYPE: JString read _GetCOLUMN_SERVICE_TYPE;
    {class} property COLUMN_TRANSIENT: JString read _GetCOLUMN_TRANSIENT;
    {class} property COLUMN_TRANSPORT_STREAM_ID: JString read _GetCOLUMN_TRANSPORT_STREAM_ID;
    {class} property COLUMN_TYPE: JString read _GetCOLUMN_TYPE;
    {class} property COLUMN_VERSION_NUMBER: JString read _GetCOLUMN_VERSION_NUMBER;
    {class} property COLUMN_VIDEO_FORMAT: JString read _GetCOLUMN_VIDEO_FORMAT;
    {class} property COLUMN_VIDEO_RESOLUTION: JString read _GetCOLUMN_VIDEO_RESOLUTION;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
    {class} property SERVICE_TYPE_AUDIO: JString read _GetSERVICE_TYPE_AUDIO;
    {class} property SERVICE_TYPE_AUDIO_VIDEO: JString read _GetSERVICE_TYPE_AUDIO_VIDEO;
    {class} property SERVICE_TYPE_OTHER: JString read _GetSERVICE_TYPE_OTHER;
    {class} property TYPE_1SEG: JString read _GetTYPE_1SEG;
    {class} property TYPE_ATSC3_T: JString read _GetTYPE_ATSC3_T;
    {class} property TYPE_ATSC_C: JString read _GetTYPE_ATSC_C;
    {class} property TYPE_ATSC_M_H: JString read _GetTYPE_ATSC_M_H;
    {class} property TYPE_ATSC_T: JString read _GetTYPE_ATSC_T;
    {class} property TYPE_CMMB: JString read _GetTYPE_CMMB;
    {class} property TYPE_DTMB: JString read _GetTYPE_DTMB;
    {class} property TYPE_DVB_C: JString read _GetTYPE_DVB_C;
    {class} property TYPE_DVB_C2: JString read _GetTYPE_DVB_C2;
    {class} property TYPE_DVB_H: JString read _GetTYPE_DVB_H;
    {class} property TYPE_DVB_S: JString read _GetTYPE_DVB_S;
    {class} property TYPE_DVB_S2: JString read _GetTYPE_DVB_S2;
    {class} property TYPE_DVB_SH: JString read _GetTYPE_DVB_SH;
    {class} property TYPE_DVB_T: JString read _GetTYPE_DVB_T;
    {class} property TYPE_DVB_T2: JString read _GetTYPE_DVB_T2;
    {class} property TYPE_ISDB_C: JString read _GetTYPE_ISDB_C;
    {class} property TYPE_ISDB_S: JString read _GetTYPE_ISDB_S;
    {class} property TYPE_ISDB_S3: JString read _GetTYPE_ISDB_S3;
    {class} property TYPE_ISDB_T: JString read _GetTYPE_ISDB_T;
    {class} property TYPE_ISDB_TB: JString read _GetTYPE_ISDB_TB;
    {class} property TYPE_NTSC: JString read _GetTYPE_NTSC;
    {class} property TYPE_OTHER: JString read _GetTYPE_OTHER;
    {class} property TYPE_PAL: JString read _GetTYPE_PAL;
    {class} property TYPE_PREVIEW: JString read _GetTYPE_PREVIEW;
    {class} property TYPE_SECAM: JString read _GetTYPE_SECAM;
    {class} property TYPE_S_DMB: JString read _GetTYPE_S_DMB;
    {class} property TYPE_T_DMB: JString read _GetTYPE_T_DMB;
    {class} property VIDEO_FORMAT_1080I: JString read _GetVIDEO_FORMAT_1080I;
    {class} property VIDEO_FORMAT_1080P: JString read _GetVIDEO_FORMAT_1080P;
    {class} property VIDEO_FORMAT_2160P: JString read _GetVIDEO_FORMAT_2160P;
    {class} property VIDEO_FORMAT_240P: JString read _GetVIDEO_FORMAT_240P;
    {class} property VIDEO_FORMAT_360P: JString read _GetVIDEO_FORMAT_360P;
    {class} property VIDEO_FORMAT_4320P: JString read _GetVIDEO_FORMAT_4320P;
    {class} property VIDEO_FORMAT_480I: JString read _GetVIDEO_FORMAT_480I;
    {class} property VIDEO_FORMAT_480P: JString read _GetVIDEO_FORMAT_480P;
    {class} property VIDEO_FORMAT_576I: JString read _GetVIDEO_FORMAT_576I;
    {class} property VIDEO_FORMAT_576P: JString read _GetVIDEO_FORMAT_576P;
    {class} property VIDEO_FORMAT_720P: JString read _GetVIDEO_FORMAT_720P;
    {class} property VIDEO_RESOLUTION_ED: JString read _GetVIDEO_RESOLUTION_ED;
    {class} property VIDEO_RESOLUTION_FHD: JString read _GetVIDEO_RESOLUTION_FHD;
    {class} property VIDEO_RESOLUTION_HD: JString read _GetVIDEO_RESOLUTION_HD;
    {class} property VIDEO_RESOLUTION_SD: JString read _GetVIDEO_RESOLUTION_SD;
    {class} property VIDEO_RESOLUTION_UHD: JString read _GetVIDEO_RESOLUTION_UHD;
  end;

  [JavaSignature('android/media/tv/TvContract$Channels')]
  JTvContract_Channels = interface(JObject)
    ['{8F0208EC-F865-465C-BF58-4968AB36CBB3}']
  end;
  TJTvContract_Channels = class(TJavaGenericImport<JTvContract_ChannelsClass, JTvContract_Channels>) end;

  JChannels_LogoClass = interface(JObjectClass)
    ['{A6F017D2-0D15-400D-9540-660ACD5ACCE1}']
    {class} function _GetCONTENT_DIRECTORY: JString; cdecl;
    {class} property CONTENT_DIRECTORY: JString read _GetCONTENT_DIRECTORY;
  end;

  [JavaSignature('android/media/tv/TvContract$Channels$Logo')]
  JChannels_Logo = interface(JObject)
    ['{03642B44-015D-4ED5-B535-147A886E2855}']
  end;
  TJChannels_Logo = class(TJavaGenericImport<JChannels_LogoClass, JChannels_Logo>) end;

  JTvContract_PreviewProgramsClass = interface(JObjectClass)
    ['{8B175386-CD3B-497A-9516-BC275B02CAA6}']
    {class} function _GetCOLUMN_CHANNEL_ID: JString; cdecl;
    {class} function _GetCOLUMN_WEIGHT: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} property COLUMN_CHANNEL_ID: JString read _GetCOLUMN_CHANNEL_ID;
    {class} property COLUMN_WEIGHT: JString read _GetCOLUMN_WEIGHT;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
  end;

  [JavaSignature('android/media/tv/TvContract$PreviewPrograms')]
  JTvContract_PreviewPrograms = interface(JObject)
    ['{D5FDD761-0E4A-49DC-98B0-2E9EDD971622}']
  end;
  TJTvContract_PreviewPrograms = class(TJavaGenericImport<JTvContract_PreviewProgramsClass, JTvContract_PreviewPrograms>) end;

  JTvContract_ProgramsClass = interface(JObjectClass)
    ['{3EB71005-2470-41FB-9ACD-6E7A895BB5AF}']
    {class} function _GetCOLUMN_BROADCAST_GENRE: JString; cdecl;
    {class} function _GetCOLUMN_CHANNEL_ID: JString; cdecl;
    {class} function _GetCOLUMN_END_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_EPISODE_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_EVENT_ID: JString; cdecl;
    {class} function _GetCOLUMN_GLOBAL_CONTENT_ID: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_ID: JString; cdecl;
    {class} function _GetCOLUMN_MULTI_SERIES_ID: JString; cdecl;
    {class} function _GetCOLUMN_RECORDING_PROHIBITED: JString; cdecl;
    {class} function _GetCOLUMN_SCRAMBLED: JString; cdecl;
    {class} function _GetCOLUMN_SEASON_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_START_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} property COLUMN_BROADCAST_GENRE: JString read _GetCOLUMN_BROADCAST_GENRE;
    {class} property COLUMN_CHANNEL_ID: JString read _GetCOLUMN_CHANNEL_ID;
    {class} property COLUMN_END_TIME_UTC_MILLIS: JString read _GetCOLUMN_END_TIME_UTC_MILLIS;
    {class} property COLUMN_EPISODE_NUMBER: JString read _GetCOLUMN_EPISODE_NUMBER;
    {class} property COLUMN_EVENT_ID: JString read _GetCOLUMN_EVENT_ID;
    {class} property COLUMN_GLOBAL_CONTENT_ID: JString read _GetCOLUMN_GLOBAL_CONTENT_ID;
    {class} property COLUMN_INTERNAL_PROVIDER_ID: JString read _GetCOLUMN_INTERNAL_PROVIDER_ID;
    {class} property COLUMN_MULTI_SERIES_ID: JString read _GetCOLUMN_MULTI_SERIES_ID;
    {class} property COLUMN_RECORDING_PROHIBITED: JString read _GetCOLUMN_RECORDING_PROHIBITED;
    {class} property COLUMN_SCRAMBLED: JString read _GetCOLUMN_SCRAMBLED;
    {class} property COLUMN_SEASON_NUMBER: JString read _GetCOLUMN_SEASON_NUMBER;
    {class} property COLUMN_START_TIME_UTC_MILLIS: JString read _GetCOLUMN_START_TIME_UTC_MILLIS;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
  end;

  [JavaSignature('android/media/tv/TvContract$Programs')]
  JTvContract_Programs = interface(JObject)
    ['{B064AE97-B755-45D2-9B2F-265D7E8AEC97}']
  end;
  TJTvContract_Programs = class(TJavaGenericImport<JTvContract_ProgramsClass, JTvContract_Programs>) end;

  JPrograms_GenresClass = interface(JObjectClass)
    ['{9D7EC7A4-1F0D-4D52-8C2A-AA2828C7BE3F}']
    {class} function _GetANIMAL_WILDLIFE: JString; cdecl;
    {class} function _GetARTS: JString; cdecl;
    {class} function _GetCOMEDY: JString; cdecl;
    {class} function _GetDRAMA: JString; cdecl;
    {class} function _GetEDUCATION: JString; cdecl;
    {class} function _GetENTERTAINMENT: JString; cdecl;
    {class} function _GetFAMILY_KIDS: JString; cdecl;
    {class} function _GetGAMING: JString; cdecl;
    {class} function _GetLIFE_STYLE: JString; cdecl;
    {class} function _GetMOVIES: JString; cdecl;
    {class} function _GetMUSIC: JString; cdecl;
    {class} function _GetNEWS: JString; cdecl;
    {class} function _GetPREMIER: JString; cdecl;
    {class} function _GetSHOPPING: JString; cdecl;
    {class} function _GetSPORTS: JString; cdecl;
    {class} function _GetTECH_SCIENCE: JString; cdecl;
    {class} function _GetTRAVEL: JString; cdecl;
    {class} function decode(genres: JString): TJavaObjectArray<JString>; cdecl;
    {class} function isCanonical(genre: JString): Boolean; cdecl;
    {class} property ANIMAL_WILDLIFE: JString read _GetANIMAL_WILDLIFE;
    {class} property ARTS: JString read _GetARTS;
    {class} property COMEDY: JString read _GetCOMEDY;
    {class} property DRAMA: JString read _GetDRAMA;
    {class} property EDUCATION: JString read _GetEDUCATION;
    {class} property ENTERTAINMENT: JString read _GetENTERTAINMENT;
    {class} property FAMILY_KIDS: JString read _GetFAMILY_KIDS;
    {class} property GAMING: JString read _GetGAMING;
    {class} property LIFE_STYLE: JString read _GetLIFE_STYLE;
    {class} property MOVIES: JString read _GetMOVIES;
    {class} property MUSIC: JString read _GetMUSIC;
    {class} property NEWS: JString read _GetNEWS;
    {class} property PREMIER: JString read _GetPREMIER;
    {class} property SHOPPING: JString read _GetSHOPPING;
    {class} property SPORTS: JString read _GetSPORTS;
    {class} property TECH_SCIENCE: JString read _GetTECH_SCIENCE;
    {class} property TRAVEL: JString read _GetTRAVEL;
  end;

  [JavaSignature('android/media/tv/TvContract$Programs$Genres')]
  JPrograms_Genres = interface(JObject)
    ['{AC4CFBA3-F369-40A6-A2E6-0C5C7C525692}']
  end;
  TJPrograms_Genres = class(TJavaGenericImport<JPrograms_GenresClass, JPrograms_Genres>) end;

  JTvContract_RecordedProgramsClass = interface(JObjectClass)
    ['{0C587FB9-4A1E-4767-8E40-2C13FCE50E78}']
    {class} function _GetCOLUMN_BROADCAST_GENRE: JString; cdecl;
    {class} function _GetCOLUMN_CHANNEL_ID: JString; cdecl;
    {class} function _GetCOLUMN_END_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_INPUT_ID: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_ID: JString; cdecl;
    {class} function _GetCOLUMN_MULTI_SERIES_ID: JString; cdecl;
    {class} function _GetCOLUMN_RECORDING_DATA_BYTES: JString; cdecl;
    {class} function _GetCOLUMN_RECORDING_DATA_URI: JString; cdecl;
    {class} function _GetCOLUMN_RECORDING_DURATION_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_RECORDING_EXPIRE_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_START_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} property COLUMN_BROADCAST_GENRE: JString read _GetCOLUMN_BROADCAST_GENRE;
    {class} property COLUMN_CHANNEL_ID: JString read _GetCOLUMN_CHANNEL_ID;
    {class} property COLUMN_END_TIME_UTC_MILLIS: JString read _GetCOLUMN_END_TIME_UTC_MILLIS;
    {class} property COLUMN_INPUT_ID: JString read _GetCOLUMN_INPUT_ID;
    {class} property COLUMN_INTERNAL_PROVIDER_ID: JString read _GetCOLUMN_INTERNAL_PROVIDER_ID;
    {class} property COLUMN_MULTI_SERIES_ID: JString read _GetCOLUMN_MULTI_SERIES_ID;
    {class} property COLUMN_RECORDING_DATA_BYTES: JString read _GetCOLUMN_RECORDING_DATA_BYTES;
    {class} property COLUMN_RECORDING_DATA_URI: JString read _GetCOLUMN_RECORDING_DATA_URI;
    {class} property COLUMN_RECORDING_DURATION_MILLIS: JString read _GetCOLUMN_RECORDING_DURATION_MILLIS;
    {class} property COLUMN_RECORDING_EXPIRE_TIME_UTC_MILLIS: JString read _GetCOLUMN_RECORDING_EXPIRE_TIME_UTC_MILLIS;
    {class} property COLUMN_START_TIME_UTC_MILLIS: JString read _GetCOLUMN_START_TIME_UTC_MILLIS;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
  end;

  [JavaSignature('android/media/tv/TvContract$RecordedPrograms')]
  JTvContract_RecordedPrograms = interface(JObject)
    ['{310012F2-3ADE-4C79-99B2-D7A38B1820FA}']
  end;
  TJTvContract_RecordedPrograms = class(TJavaGenericImport<JTvContract_RecordedProgramsClass, JTvContract_RecordedPrograms>) end;

  JTvContract_WatchNextProgramsClass = interface(JObjectClass)
    ['{1C9BED9E-BD16-458B-BD48-8572E4052D50}']
    {class} function _GetCOLUMN_LAST_ENGAGEMENT_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_WATCH_NEXT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} function _GetWATCH_NEXT_TYPE_CONTINUE: Integer; cdecl;
    {class} function _GetWATCH_NEXT_TYPE_NEW: Integer; cdecl;
    {class} function _GetWATCH_NEXT_TYPE_NEXT: Integer; cdecl;
    {class} function _GetWATCH_NEXT_TYPE_WATCHLIST: Integer; cdecl;
    {class} property COLUMN_LAST_ENGAGEMENT_TIME_UTC_MILLIS: JString read _GetCOLUMN_LAST_ENGAGEMENT_TIME_UTC_MILLIS;
    {class} property COLUMN_WATCH_NEXT_TYPE: JString read _GetCOLUMN_WATCH_NEXT_TYPE;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
    {class} property WATCH_NEXT_TYPE_CONTINUE: Integer read _GetWATCH_NEXT_TYPE_CONTINUE;
    {class} property WATCH_NEXT_TYPE_NEW: Integer read _GetWATCH_NEXT_TYPE_NEW;
    {class} property WATCH_NEXT_TYPE_NEXT: Integer read _GetWATCH_NEXT_TYPE_NEXT;
    {class} property WATCH_NEXT_TYPE_WATCHLIST: Integer read _GetWATCH_NEXT_TYPE_WATCHLIST;
  end;

  [JavaSignature('android/media/tv/TvContract$WatchNextPrograms')]
  JTvContract_WatchNextPrograms = interface(JObject)
    ['{D3CD3AEA-1768-4668-A3F0-05911384A88D}']
  end;
  TJTvContract_WatchNextPrograms = class(TJavaGenericImport<JTvContract_WatchNextProgramsClass, JTvContract_WatchNextPrograms>) end;

  JTvInputInfoClass = interface(JObjectClass)
    ['{81E0FF25-09BF-46FE-A01F-5072D8601912}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_INPUT_ID: JString; cdecl;
    {class} function _GetTYPE_COMPONENT: Integer; cdecl;
    {class} function _GetTYPE_COMPOSITE: Integer; cdecl;
    {class} function _GetTYPE_DISPLAY_PORT: Integer; cdecl;
    {class} function _GetTYPE_DVI: Integer; cdecl;
    {class} function _GetTYPE_HDMI: Integer; cdecl;
    {class} function _GetTYPE_OTHER: Integer; cdecl;
    {class} function _GetTYPE_SCART: Integer; cdecl;
    {class} function _GetTYPE_SVIDEO: Integer; cdecl;
    {class} function _GetTYPE_TUNER: Integer; cdecl;
    {class} function _GetTYPE_VGA: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_INPUT_ID: JString read _GetEXTRA_INPUT_ID;
    {class} property TYPE_COMPONENT: Integer read _GetTYPE_COMPONENT;
    {class} property TYPE_COMPOSITE: Integer read _GetTYPE_COMPOSITE;
    {class} property TYPE_DISPLAY_PORT: Integer read _GetTYPE_DISPLAY_PORT;
    {class} property TYPE_DVI: Integer read _GetTYPE_DVI;
    {class} property TYPE_HDMI: Integer read _GetTYPE_HDMI;
    {class} property TYPE_OTHER: Integer read _GetTYPE_OTHER;
    {class} property TYPE_SCART: Integer read _GetTYPE_SCART;
    {class} property TYPE_SVIDEO: Integer read _GetTYPE_SVIDEO;
    {class} property TYPE_TUNER: Integer read _GetTYPE_TUNER;
    {class} property TYPE_VGA: Integer read _GetTYPE_VGA;
  end;

  [JavaSignature('android/media/tv/TvInputInfo')]
  JTvInputInfo = interface(JObject)
    ['{206FA923-F42B-4278-9959-163CBFABCC99}']
    function canPauseRecording: Boolean; cdecl;
    function canRecord: Boolean; cdecl;
    function createSettingsIntent: JIntent; cdecl;//Deprecated
    function createSetupIntent: JIntent; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getExtras: JBundle; cdecl;
    function getId: JString; cdecl;
    function getParentId: JString; cdecl;
    function getServiceInfo: JServiceInfo; cdecl;
    function getTunerCount: Integer; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isHidden(context: JContext): Boolean; cdecl;
    function isPassthroughInput: Boolean; cdecl;
    function loadCustomLabel(context: JContext): JCharSequence; cdecl;
    function loadIcon(context: JContext): JDrawable; cdecl;
    function loadLabel(context: JContext): JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTvInputInfo = class(TJavaGenericImport<JTvInputInfoClass, JTvInputInfo>) end;

  JTvInputInfo_BuilderClass = interface(JObjectClass)
    ['{8317F876-A695-4E46-8FE6-98415E615D2E}']
    {class} function init(context: JContext; component: JComponentName): JTvInputInfo_Builder; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputInfo$Builder')]
  JTvInputInfo_Builder = interface(JObject)
    ['{4F28AA75-8FCB-45A7-B109-D86C4373887C}']
    function build: JTvInputInfo; cdecl;
    function setCanPauseRecording(canPauseRecording: Boolean): JTvInputInfo_Builder; cdecl;
    function setCanRecord(canRecord: Boolean): JTvInputInfo_Builder; cdecl;
    function setExtras(extras: JBundle): JTvInputInfo_Builder; cdecl;
    function setTunerCount(tunerCount: Integer): JTvInputInfo_Builder; cdecl;
  end;
  TJTvInputInfo_Builder = class(TJavaGenericImport<JTvInputInfo_BuilderClass, JTvInputInfo_Builder>) end;

  JTvInputManagerClass = interface(JObjectClass)
    ['{0408BC0B-DD35-43AE-A248-8CAEAA39BE8A}']
    {class} function _GetACTION_BLOCKED_RATINGS_CHANGED: JString; cdecl;
    {class} function _GetACTION_PARENTAL_CONTROLS_ENABLED_CHANGED: JString; cdecl;
    {class} function _GetACTION_QUERY_CONTENT_RATING_SYSTEMS: JString; cdecl;
    {class} function _GetACTION_SETUP_INPUTS: JString; cdecl;
    {class} function _GetACTION_VIEW_RECORDING_SCHEDULES: JString; cdecl;
    {class} function _GetBROADCAST_INFO_STREAM_EVENT: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_COMMAND: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_DSMCC: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_PES: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_SECTION: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_TABLE: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_TIMELINE: Integer; cdecl;
    {class} function _GetBROADCAST_INFO_TYPE_TS: Integer; cdecl;
    {class} function _GetINPUT_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetINPUT_STATE_CONNECTED_STANDBY: Integer; cdecl;
    {class} function _GetINPUT_STATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetMETA_DATA_CONTENT_RATING_SYSTEMS: JString; cdecl;
    {class} function _GetRECORDING_ERROR_INSUFFICIENT_SPACE: Integer; cdecl;
    {class} function _GetRECORDING_ERROR_RESOURCE_BUSY: Integer; cdecl;
    {class} function _GetRECORDING_ERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_LOST: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_STRONG: Integer; cdecl;
    {class} function _GetSIGNAL_STRENGTH_WEAK: Integer; cdecl;
    {class} function _GetTIME_SHIFT_INVALID_TIME: Int64; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_AVAILABLE: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNAVAILABLE: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNKNOWN: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNSUPPORTED: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_AUDIO_ONLY: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_BUFFERING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_BLACKOUT: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_CARD_INVALID: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_CARD_MUTE: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_INSUFFICIENT_OUTPUT_PROTECTION: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_LICENSE_EXPIRED: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_NEED_ACTIVATION: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_NEED_PAIRING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_NO_CARD: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_PVR_RECORDING_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_REBOOTING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_CAS_UNKNOWN: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_INSUFFICIENT_RESOURCE: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_NOT_CONNECTED: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_TUNING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_UNKNOWN: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL: Integer; cdecl;
    {class} property ACTION_BLOCKED_RATINGS_CHANGED: JString read _GetACTION_BLOCKED_RATINGS_CHANGED;
    {class} property ACTION_PARENTAL_CONTROLS_ENABLED_CHANGED: JString read _GetACTION_PARENTAL_CONTROLS_ENABLED_CHANGED;
    {class} property ACTION_QUERY_CONTENT_RATING_SYSTEMS: JString read _GetACTION_QUERY_CONTENT_RATING_SYSTEMS;
    {class} property ACTION_SETUP_INPUTS: JString read _GetACTION_SETUP_INPUTS;
    {class} property ACTION_VIEW_RECORDING_SCHEDULES: JString read _GetACTION_VIEW_RECORDING_SCHEDULES;
    {class} property BROADCAST_INFO_STREAM_EVENT: Integer read _GetBROADCAST_INFO_STREAM_EVENT;
    {class} property BROADCAST_INFO_TYPE_COMMAND: Integer read _GetBROADCAST_INFO_TYPE_COMMAND;
    {class} property BROADCAST_INFO_TYPE_DSMCC: Integer read _GetBROADCAST_INFO_TYPE_DSMCC;
    {class} property BROADCAST_INFO_TYPE_PES: Integer read _GetBROADCAST_INFO_TYPE_PES;
    {class} property BROADCAST_INFO_TYPE_SECTION: Integer read _GetBROADCAST_INFO_TYPE_SECTION;
    {class} property BROADCAST_INFO_TYPE_TABLE: Integer read _GetBROADCAST_INFO_TYPE_TABLE;
    {class} property BROADCAST_INFO_TYPE_TIMELINE: Integer read _GetBROADCAST_INFO_TYPE_TIMELINE;
    {class} property BROADCAST_INFO_TYPE_TS: Integer read _GetBROADCAST_INFO_TYPE_TS;
    {class} property INPUT_STATE_CONNECTED: Integer read _GetINPUT_STATE_CONNECTED;
    {class} property INPUT_STATE_CONNECTED_STANDBY: Integer read _GetINPUT_STATE_CONNECTED_STANDBY;
    {class} property INPUT_STATE_DISCONNECTED: Integer read _GetINPUT_STATE_DISCONNECTED;
    {class} property META_DATA_CONTENT_RATING_SYSTEMS: JString read _GetMETA_DATA_CONTENT_RATING_SYSTEMS;
    {class} property RECORDING_ERROR_INSUFFICIENT_SPACE: Integer read _GetRECORDING_ERROR_INSUFFICIENT_SPACE;
    {class} property RECORDING_ERROR_RESOURCE_BUSY: Integer read _GetRECORDING_ERROR_RESOURCE_BUSY;
    {class} property RECORDING_ERROR_UNKNOWN: Integer read _GetRECORDING_ERROR_UNKNOWN;
    {class} property SIGNAL_STRENGTH_LOST: Integer read _GetSIGNAL_STRENGTH_LOST;
    {class} property SIGNAL_STRENGTH_STRONG: Integer read _GetSIGNAL_STRENGTH_STRONG;
    {class} property SIGNAL_STRENGTH_WEAK: Integer read _GetSIGNAL_STRENGTH_WEAK;
    {class} property TIME_SHIFT_INVALID_TIME: Int64 read _GetTIME_SHIFT_INVALID_TIME;
    {class} property TIME_SHIFT_STATUS_AVAILABLE: Integer read _GetTIME_SHIFT_STATUS_AVAILABLE;
    {class} property TIME_SHIFT_STATUS_UNAVAILABLE: Integer read _GetTIME_SHIFT_STATUS_UNAVAILABLE;
    {class} property TIME_SHIFT_STATUS_UNKNOWN: Integer read _GetTIME_SHIFT_STATUS_UNKNOWN;
    {class} property TIME_SHIFT_STATUS_UNSUPPORTED: Integer read _GetTIME_SHIFT_STATUS_UNSUPPORTED;
    {class} property VIDEO_UNAVAILABLE_REASON_AUDIO_ONLY: Integer read _GetVIDEO_UNAVAILABLE_REASON_AUDIO_ONLY;
    {class} property VIDEO_UNAVAILABLE_REASON_BUFFERING: Integer read _GetVIDEO_UNAVAILABLE_REASON_BUFFERING;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_BLACKOUT: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_BLACKOUT;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_CARD_INVALID: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_CARD_INVALID;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_CARD_MUTE: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_CARD_MUTE;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_INSUFFICIENT_OUTPUT_PROTECTION: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_INSUFFICIENT_OUTPUT_PROTECTION;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_LICENSE_EXPIRED: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_LICENSE_EXPIRED;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_NEED_ACTIVATION: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_NEED_ACTIVATION;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_NEED_PAIRING: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_NEED_PAIRING;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_NO_CARD: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_NO_CARD;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_PVR_RECORDING_NOT_ALLOWED: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_PVR_RECORDING_NOT_ALLOWED;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_REBOOTING: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_REBOOTING;
    {class} property VIDEO_UNAVAILABLE_REASON_CAS_UNKNOWN: Integer read _GetVIDEO_UNAVAILABLE_REASON_CAS_UNKNOWN;
    {class} property VIDEO_UNAVAILABLE_REASON_INSUFFICIENT_RESOURCE: Integer read _GetVIDEO_UNAVAILABLE_REASON_INSUFFICIENT_RESOURCE;
    {class} property VIDEO_UNAVAILABLE_REASON_NOT_CONNECTED: Integer read _GetVIDEO_UNAVAILABLE_REASON_NOT_CONNECTED;
    {class} property VIDEO_UNAVAILABLE_REASON_TUNING: Integer read _GetVIDEO_UNAVAILABLE_REASON_TUNING;
    {class} property VIDEO_UNAVAILABLE_REASON_UNKNOWN: Integer read _GetVIDEO_UNAVAILABLE_REASON_UNKNOWN;
    {class} property VIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL: Integer read _GetVIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL;
  end;

  [JavaSignature('android/media/tv/TvInputManager')]
  JTvInputManager = interface(JObject)
    ['{2F97DA50-5475-45F3-870F-0F88E3F1F901}']
    function getBlockedRatings: JList; cdecl;
    function getInputState(inputId: JString): Integer; cdecl;
    function getTvInputInfo(inputId: JString): JTvInputInfo; cdecl;
    function getTvInputList: JList; cdecl;
    function isParentalControlsEnabled: Boolean; cdecl;
    function isRatingBlocked(rating: JTvContentRating): Boolean; cdecl;
    procedure registerCallback(callback: JTvInputManager_TvInputCallback; handler: JHandler); cdecl;
    procedure unregisterCallback(callback: JTvInputManager_TvInputCallback); cdecl;
    procedure updateTvInputInfo(inputInfo: JTvInputInfo); cdecl;
  end;
  TJTvInputManager = class(TJavaGenericImport<JTvInputManagerClass, JTvInputManager>) end;

  JTvInputManager_TvInputCallbackClass = interface(JObjectClass)
    ['{73BCF37E-F9C0-46D5-924E-2A6FD6CEE78A}']
    {class} function init: JTvInputManager_TvInputCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputManager$TvInputCallback')]
  JTvInputManager_TvInputCallback = interface(JObject)
    ['{415CBDB9-7B2D-42AD-BB14-425C8126E960}']
    procedure onInputAdded(inputId: JString); cdecl;
    procedure onInputRemoved(inputId: JString); cdecl;
    procedure onInputStateChanged(inputId: JString; state: Integer); cdecl;
    procedure onInputUpdated(inputId: JString); cdecl;
    procedure onTvInputInfoUpdated(inputInfo: JTvInputInfo); cdecl;
  end;
  TJTvInputManager_TvInputCallback = class(TJavaGenericImport<JTvInputManager_TvInputCallbackClass, JTvInputManager_TvInputCallback>) end;

  JTvInputServiceClass = interface(JServiceClass)
    ['{002C4996-4C27-470F-BEF9-203BC0268E40}']
    {class} function _GetPRIORITY_HINT_USE_CASE_TYPE_BACKGROUND: Integer; cdecl;
    {class} function _GetPRIORITY_HINT_USE_CASE_TYPE_LIVE: Integer; cdecl;
    {class} function _GetPRIORITY_HINT_USE_CASE_TYPE_PLAYBACK: Integer; cdecl;
    {class} function _GetPRIORITY_HINT_USE_CASE_TYPE_RECORD: Integer; cdecl;
    {class} function _GetPRIORITY_HINT_USE_CASE_TYPE_SCAN: Integer; cdecl;
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function _GetSERVICE_META_DATA: JString; cdecl;
    {class} function init: JTvInputService; cdecl;
    {class} property PRIORITY_HINT_USE_CASE_TYPE_BACKGROUND: Integer read _GetPRIORITY_HINT_USE_CASE_TYPE_BACKGROUND;
    {class} property PRIORITY_HINT_USE_CASE_TYPE_LIVE: Integer read _GetPRIORITY_HINT_USE_CASE_TYPE_LIVE;
    {class} property PRIORITY_HINT_USE_CASE_TYPE_PLAYBACK: Integer read _GetPRIORITY_HINT_USE_CASE_TYPE_PLAYBACK;
    {class} property PRIORITY_HINT_USE_CASE_TYPE_RECORD: Integer read _GetPRIORITY_HINT_USE_CASE_TYPE_RECORD;
    {class} property PRIORITY_HINT_USE_CASE_TYPE_SCAN: Integer read _GetPRIORITY_HINT_USE_CASE_TYPE_SCAN;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
    {class} property SERVICE_META_DATA: JString read _GetSERVICE_META_DATA;
  end;

  [JavaSignature('android/media/tv/TvInputService')]
  JTvInputService = interface(JService)
    ['{A2933D84-5B2E-46DE-8304-1B58E41D802F}']
    function onBind(intent: JIntent): JIBinder; cdecl;
    function onCreateRecordingSession(inputId: JString): JTvInputService_RecordingSession; cdecl; overload;
    function onCreateRecordingSession(inputId: JString; sessionId: JString): JTvInputService_RecordingSession; cdecl; overload;
    function onCreateSession(inputId: JString): JTvInputService_Session; cdecl; overload;
    function onCreateSession(inputId: JString; sessionId: JString): JTvInputService_Session; cdecl; overload;
  end;
  TJTvInputService = class(TJavaGenericImport<JTvInputServiceClass, JTvInputService>) end;

  JTvInputService_SessionClass = interface(JObjectClass)
    ['{C859B4C2-FADD-414D-BA6B-BFA3FC36FEBB}']
    {class} function init(context: JContext): JTvInputService_Session; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputService$Session')]
  JTvInputService_Session = interface(JObject)
    ['{8CE3F272-32C1-4046-A7CF-4A22D119B39C}']
    procedure layoutSurface(left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl;
    procedure notifyAdResponse(response: JAdResponse); cdecl;
    procedure notifyAitInfoUpdated(aitInfo: JAitInfo); cdecl;
    procedure notifyBroadcastInfoResponse(response: JBroadcastInfoResponse); cdecl;
    procedure notifyChannelRetuned(channelUri: Jnet_Uri); cdecl;
    procedure notifyContentAllowed; cdecl;
    procedure notifyContentBlocked(rating: JTvContentRating); cdecl;
    procedure notifySignalStrength(strength: Integer); cdecl;
    procedure notifyTimeShiftStatusChanged(status: Integer); cdecl;
    procedure notifyTrackSelected(type_: Integer; trackId: JString); cdecl;
    procedure notifyTracksChanged(tracks: JList); cdecl;
    procedure notifyTuned(channelUri: Jnet_Uri); cdecl;
    procedure notifyVideoAvailable; cdecl;
    procedure notifyVideoUnavailable(reason: Integer); cdecl;
    procedure onAppPrivateCommand(action: JString; data: JBundle); cdecl;
    function onCreateOverlayView: JView; cdecl;
    function onGenericMotionEvent(event: JMotionEvent): Boolean; cdecl;
    function onKeyDown(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyLongPress(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyMultiple(keyCode: Integer; count: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyUp(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    procedure onOverlayViewSizeChanged(width: Integer; height: Integer); cdecl;
    procedure onRelease; cdecl;
    procedure onRemoveBroadcastInfo(requestId: Integer); cdecl;
    procedure onRequestAd(request: Jtv_AdRequest); cdecl;
    procedure onRequestBroadcastInfo(request: JBroadcastInfoRequest); cdecl;
    function onSelectTrack(type_: Integer; trackId: JString): Boolean; cdecl;
    procedure onSetCaptionEnabled(enabled: Boolean); cdecl;
    procedure onSetInteractiveAppNotificationEnabled(enabled: Boolean); cdecl;
    procedure onSetStreamVolume(volume: Single); cdecl;
    function onSetSurface(surface: JSurface): Boolean; cdecl;
    procedure onSurfaceChanged(format: Integer; width: Integer; height: Integer); cdecl;
    function onTimeShiftGetCurrentPosition: Int64; cdecl;
    function onTimeShiftGetStartPosition: Int64; cdecl;
    procedure onTimeShiftPause; cdecl;
    procedure onTimeShiftPlay(recordedProgramUri: Jnet_Uri); cdecl;
    procedure onTimeShiftResume; cdecl;
    procedure onTimeShiftSeekTo(timeMs: Int64); cdecl;
    procedure onTimeShiftSetPlaybackParams(params: JPlaybackParams); cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    function onTrackballEvent(event: JMotionEvent): Boolean; cdecl;
    function onTune(channelUri: Jnet_Uri): Boolean; cdecl; overload;
    function onTune(channelUri: Jnet_Uri; params: JBundle): Boolean; cdecl; overload;
    procedure onUnblockContent(unblockedRating: JTvContentRating); cdecl;
    procedure setOverlayViewEnabled(enable: Boolean); cdecl;
  end;
  TJTvInputService_Session = class(TJavaGenericImport<JTvInputService_SessionClass, JTvInputService_Session>) end;

  JTvInputService_HardwareSessionClass = interface(JTvInputService_SessionClass)
    ['{32192DCC-DBC8-4AB8-8F2B-26202F542994}']
    {class} function init(context: JContext): JTvInputService_HardwareSession; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputService$HardwareSession')]
  JTvInputService_HardwareSession = interface(JTvInputService_Session)
    ['{FF431494-707A-4084-8945-D32CAFFF2B21}']
    function getHardwareInputId: JString; cdecl;
    procedure onHardwareVideoAvailable; cdecl;
    procedure onHardwareVideoUnavailable(reason: Integer); cdecl;
    function onSetSurface(surface: JSurface): Boolean; cdecl;
  end;
  TJTvInputService_HardwareSession = class(TJavaGenericImport<JTvInputService_HardwareSessionClass, JTvInputService_HardwareSession>) end;

  JTvInputService_RecordingSessionClass = interface(JObjectClass)
    ['{A11A921A-2290-4E77-B3FB-E5CD7BA830EA}']
    {class} function init(context: JContext): JTvInputService_RecordingSession; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputService$RecordingSession')]
  JTvInputService_RecordingSession = interface(JObject)
    ['{0516994F-8A30-4F23-8B07-94DEC938B495}']
    procedure notifyError(error: Integer); cdecl;
    procedure notifyRecordingStopped(recordedProgramUri: Jnet_Uri); cdecl;
    procedure notifyTuned(channelUri: Jnet_Uri); cdecl;
    procedure onAppPrivateCommand(action: JString; data: JBundle); cdecl;
    procedure onPauseRecording(params: JBundle); cdecl;
    procedure onRelease; cdecl;
    procedure onResumeRecording(params: JBundle); cdecl;
    procedure onStartRecording(programUri: Jnet_Uri); cdecl; overload;
    procedure onStartRecording(programUri: Jnet_Uri; params: JBundle); cdecl; overload;
    procedure onStopRecording; cdecl;
    procedure onTune(channelUri: Jnet_Uri); cdecl; overload;
    procedure onTune(channelUri: Jnet_Uri; params: JBundle); cdecl; overload;
  end;
  TJTvInputService_RecordingSession = class(TJavaGenericImport<JTvInputService_RecordingSessionClass, JTvInputService_RecordingSession>) end;

  JTvRecordingClientClass = interface(JObjectClass)
    ['{98B43F32-2FE9-4F5A-AFB8-2423ACA60844}']
    {class} function init(context: JContext; tag: JString; callback: JTvRecordingClient_RecordingCallback; handler: JHandler): JTvRecordingClient; cdecl;
  end;

  [JavaSignature('android/media/tv/TvRecordingClient')]
  JTvRecordingClient = interface(JObject)
    ['{4A5A06B6-8697-4EC9-A769-EA36AD5F9458}']
    procedure pauseRecording; cdecl; overload;
    procedure pauseRecording(params: JBundle); cdecl; overload;
    procedure release; cdecl;
    procedure resumeRecording; cdecl; overload;
    procedure resumeRecording(params: JBundle); cdecl; overload;
    procedure sendAppPrivateCommand(action: JString; data: JBundle); cdecl;
    procedure startRecording(programUri: Jnet_Uri); cdecl; overload;
    procedure startRecording(programUri: Jnet_Uri; params: JBundle); cdecl; overload;
    procedure stopRecording; cdecl;
    procedure tune(inputId: JString; channelUri: Jnet_Uri); cdecl; overload;
    procedure tune(inputId: JString; channelUri: Jnet_Uri; params: JBundle); cdecl; overload;
  end;
  TJTvRecordingClient = class(TJavaGenericImport<JTvRecordingClientClass, JTvRecordingClient>) end;

  JTvRecordingClient_RecordingCallbackClass = interface(JObjectClass)
    ['{0C92867E-2F37-4812-868E-012EDB26608E}']
    {class} function init: JTvRecordingClient_RecordingCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvRecordingClient$RecordingCallback')]
  JTvRecordingClient_RecordingCallback = interface(JObject)
    ['{00BF0B28-B785-49C4-B8D4-1E723C7B0B70}']
    procedure onConnectionFailed(inputId: JString); cdecl;
    procedure onDisconnected(inputId: JString); cdecl;
    procedure onError(error: Integer); cdecl;
    procedure onRecordingStopped(recordedProgramUri: Jnet_Uri); cdecl;
    procedure onTuned(channelUri: Jnet_Uri); cdecl;
  end;
  TJTvRecordingClient_RecordingCallback = class(TJavaGenericImport<JTvRecordingClient_RecordingCallbackClass, JTvRecordingClient_RecordingCallback>) end;

  JTvTrackInfoClass = interface(JObjectClass)
    ['{B3355E4A-BA42-4397-97C6-357204A82C02}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetTYPE_AUDIO: Integer; cdecl;
    {class} function _GetTYPE_SUBTITLE: Integer; cdecl;
    {class} function _GetTYPE_VIDEO: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property TYPE_AUDIO: Integer read _GetTYPE_AUDIO;
    {class} property TYPE_SUBTITLE: Integer read _GetTYPE_SUBTITLE;
    {class} property TYPE_VIDEO: Integer read _GetTYPE_VIDEO;
  end;

  [JavaSignature('android/media/tv/TvTrackInfo')]
  JTvTrackInfo = interface(JObject)
    ['{31CD4871-2999-46C0-BBB9-C4B0CC905984}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getAudioChannelCount: Integer; cdecl;
    function getAudioSampleRate: Integer; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getEncoding: JString; cdecl;
    function getExtra: JBundle; cdecl;
    function getId: JString; cdecl;
    function getLanguage: JString; cdecl;
    function getType: Integer; cdecl;
    function getVideoActiveFormatDescription: Byte; cdecl;
    function getVideoFrameRate: Single; cdecl;
    function getVideoHeight: Integer; cdecl;
    function getVideoPixelAspectRatio: Single; cdecl;
    function getVideoWidth: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAudioDescription: Boolean; cdecl;
    function isEncrypted: Boolean; cdecl;
    function isHardOfHearing: Boolean; cdecl;
    function isSpokenSubtitle: Boolean; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTvTrackInfo = class(TJavaGenericImport<JTvTrackInfoClass, JTvTrackInfo>) end;

  JTvTrackInfo_BuilderClass = interface(JObjectClass)
    ['{7891AE9E-B5FD-4C99-A0C9-EADF7B6EC469}']
    {class} function init(type_: Integer; id: JString): JTvTrackInfo_Builder; cdecl;
  end;

  [JavaSignature('android/media/tv/TvTrackInfo$Builder')]
  JTvTrackInfo_Builder = interface(JObject)
    ['{9A0A4558-407E-44ED-BCC4-1FFD78D5F176}']
    function build: JTvTrackInfo; cdecl;
    function setAudioChannelCount(audioChannelCount: Integer): JTvTrackInfo_Builder; cdecl;
    function setAudioDescription(audioDescription: Boolean): JTvTrackInfo_Builder; cdecl;
    function setAudioSampleRate(audioSampleRate: Integer): JTvTrackInfo_Builder; cdecl;
    function setDescription(description: JCharSequence): JTvTrackInfo_Builder; cdecl;
    function setEncoding(encoding: JString): JTvTrackInfo_Builder; cdecl;
    function setEncrypted(encrypted: Boolean): JTvTrackInfo_Builder; cdecl;
    function setExtra(extra: JBundle): JTvTrackInfo_Builder; cdecl;
    function setHardOfHearing(hardOfHearing: Boolean): JTvTrackInfo_Builder; cdecl;
    function setLanguage(language: JString): JTvTrackInfo_Builder; cdecl;
    function setSpokenSubtitle(spokenSubtitle: Boolean): JTvTrackInfo_Builder; cdecl;
    function setVideoActiveFormatDescription(videoActiveFormatDescription: Byte): JTvTrackInfo_Builder; cdecl;
    function setVideoFrameRate(videoFrameRate: Single): JTvTrackInfo_Builder; cdecl;
    function setVideoHeight(videoHeight: Integer): JTvTrackInfo_Builder; cdecl;
    function setVideoPixelAspectRatio(videoPixelAspectRatio: Single): JTvTrackInfo_Builder; cdecl;
    function setVideoWidth(videoWidth: Integer): JTvTrackInfo_Builder; cdecl;
  end;
  TJTvTrackInfo_Builder = class(TJavaGenericImport<JTvTrackInfo_BuilderClass, JTvTrackInfo_Builder>) end;

  JTvViewClass = interface(JViewGroupClass)
    ['{2B409DB0-46DC-4873-A9D3-FE5856C49C2D}']
    {class} function init(context: JContext): JTvView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTvView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JTvView; cdecl; overload;
  end;

  [JavaSignature('android/media/tv/TvView')]
  JTvView = interface(JViewGroup)
    ['{9EBA8B84-51BF-44F3-B454-FF6662C2E6E7}']
    function dispatchGenericMotionEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchKeyEvent(event: JKeyEvent): Boolean; cdecl;
    function dispatchTouchEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchTrackballEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    procedure dispatchWindowFocusChanged(hasFocus: Boolean); cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    function gatherTransparentRegion(region: JRegion): Boolean; cdecl;
    function getSelectedTrack(type_: Integer): JString; cdecl;
    function getTracks(type_: Integer): JList; cdecl;
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    procedure requestUnblockContent(unblockedRating: JTvContentRating); cdecl;
    procedure reset; cdecl;
    procedure selectTrack(type_: Integer; trackId: JString); cdecl;
    procedure sendAppPrivateCommand(action: JString; data: JBundle); cdecl;
    procedure setCallback(callback: JTvView_TvInputCallback); cdecl;
    procedure setCaptionEnabled(enabled: Boolean); cdecl;
    procedure setInteractiveAppNotificationEnabled(enabled: Boolean); cdecl;
    procedure setOnUnhandledInputEventListener(listener: JTvView_OnUnhandledInputEventListener); cdecl;
    procedure setStreamVolume(volume: Single); cdecl;
    procedure setTimeShiftPositionCallback(callback: JTvView_TimeShiftPositionCallback); cdecl;
    procedure setZOrderMediaOverlay(isMediaOverlay: Boolean); cdecl;
    procedure setZOrderOnTop(onTop: Boolean); cdecl;
    procedure timeShiftPause; cdecl;
    procedure timeShiftPlay(inputId: JString; recordedProgramUri: Jnet_Uri); cdecl;
    procedure timeShiftResume; cdecl;
    procedure timeShiftSeekTo(timeMs: Int64); cdecl;
    procedure timeShiftSetPlaybackParams(params: JPlaybackParams); cdecl;
    procedure tune(inputId: JString; channelUri: Jnet_Uri); cdecl; overload;
    procedure tune(inputId: JString; channelUri: Jnet_Uri; params: JBundle); cdecl; overload;
  end;
  TJTvView = class(TJavaGenericImport<JTvViewClass, JTvView>) end;

  JTvView_OnUnhandledInputEventListenerClass = interface(IJavaClass)
    ['{21A432E7-1563-455A-93E1-A750F30AE95A}']
  end;

  [JavaSignature('android/media/tv/TvView$OnUnhandledInputEventListener')]
  JTvView_OnUnhandledInputEventListener = interface(IJavaInstance)
    ['{A8A53C52-4272-49B2-9655-66E388EFDED7}']
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
  end;
  TJTvView_OnUnhandledInputEventListener = class(TJavaGenericImport<JTvView_OnUnhandledInputEventListenerClass, JTvView_OnUnhandledInputEventListener>) end;

  JTvView_TimeShiftPositionCallbackClass = interface(JObjectClass)
    ['{630A26E4-D26E-4A25-A4B0-6D4EB45C6640}']
    {class} function init: JTvView_TimeShiftPositionCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvView$TimeShiftPositionCallback')]
  JTvView_TimeShiftPositionCallback = interface(JObject)
    ['{016695D7-41AF-4EF2-8A9C-7F326F9B14A0}']
    procedure onTimeShiftCurrentPositionChanged(inputId: JString; timeMs: Int64); cdecl;
    procedure onTimeShiftStartPositionChanged(inputId: JString; timeMs: Int64); cdecl;
  end;
  TJTvView_TimeShiftPositionCallback = class(TJavaGenericImport<JTvView_TimeShiftPositionCallbackClass, JTvView_TimeShiftPositionCallback>) end;

  JTvView_TvInputCallbackClass = interface(JObjectClass)
    ['{7EA53B6D-A4B0-4022-8198-C2E6262246DA}']
    {class} function init: JTvView_TvInputCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvView$TvInputCallback')]
  JTvView_TvInputCallback = interface(JObject)
    ['{40DF20F4-D8BE-4E16-AF7E-F780D5E7C701}']
    procedure onAitInfoUpdated(inputId: JString; aitInfo: JAitInfo); cdecl;
    procedure onChannelRetuned(inputId: JString; channelUri: Jnet_Uri); cdecl;
    procedure onConnectionFailed(inputId: JString); cdecl;
    procedure onContentAllowed(inputId: JString); cdecl;
    procedure onContentBlocked(inputId: JString; rating: JTvContentRating); cdecl;
    procedure onDisconnected(inputId: JString); cdecl;
    procedure onSignalStrengthUpdated(inputId: JString; strength: Integer); cdecl;
    procedure onTimeShiftStatusChanged(inputId: JString; status: Integer); cdecl;
    procedure onTrackSelected(inputId: JString; type_: Integer; trackId: JString); cdecl;
    procedure onTracksChanged(inputId: JString; tracks: JList); cdecl;
    procedure onTuned(inputId: JString; channelUri: Jnet_Uri); cdecl;
    procedure onVideoAvailable(inputId: JString); cdecl;
    procedure onVideoSizeChanged(inputId: JString; width: Integer; height: Integer); cdecl;
    procedure onVideoUnavailable(inputId: JString; reason: Integer); cdecl;
  end;
  TJTvView_TvInputCallback = class(TJavaGenericImport<JTvView_TvInputCallbackClass, JTvView_TvInputCallback>) end;

  JAppLinkInfoClass = interface(JObjectClass)
    ['{CB1E8BCD-8AC0-4E27-A7C1-F17409DEB76D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(packageName: JString; className: JString; uriString: JString): JAppLinkInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/tv/interactive/AppLinkInfo')]
  JAppLinkInfo = interface(JObject)
    ['{FE15CF84-E51A-438E-9B35-F2880918915E}']
    function describeContents: Integer; cdecl;
    function getComponentName: JComponentName; cdecl;
    function getUri: Jnet_Uri; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAppLinkInfo = class(TJavaGenericImport<JAppLinkInfoClass, JAppLinkInfo>) end;

  JTvInteractiveAppManagerClass = interface(JObjectClass)
    ['{8AEE7487-4464-4271-937D-2A40E1C4D4B8}']
    {class} function _GetACTION_APP_LINK_COMMAND: JString; cdecl;
    {class} function _GetAPP_LINK_KEY_BACK_URI: JString; cdecl;
    {class} function _GetAPP_LINK_KEY_CLASS_NAME: JString; cdecl;
    {class} function _GetAPP_LINK_KEY_COMMAND_TYPE: JString; cdecl;
    {class} function _GetAPP_LINK_KEY_PACKAGE_NAME: JString; cdecl;
    {class} function _GetAPP_LINK_KEY_SERVICE_ID: JString; cdecl;
    {class} function _GetERROR_BLOCKED: Integer; cdecl;
    {class} function _GetERROR_ENCRYPTED: Integer; cdecl;
    {class} function _GetERROR_NONE: Integer; cdecl;
    {class} function _GetERROR_NOT_SUPPORTED: Integer; cdecl;
    {class} function _GetERROR_RESOURCE_UNAVAILABLE: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetERROR_UNKNOWN_CHANNEL: Integer; cdecl;
    {class} function _GetERROR_WEAK_SIGNAL: Integer; cdecl;
    {class} function _GetINTENT_KEY_BI_INTERACTIVE_APP_TYPE: JString; cdecl;
    {class} function _GetINTENT_KEY_BI_INTERACTIVE_APP_URI: JString; cdecl;
    {class} function _GetINTENT_KEY_CHANNEL_URI: JString; cdecl;
    {class} function _GetINTENT_KEY_COMMAND_TYPE: JString; cdecl;
    {class} function _GetINTENT_KEY_INTERACTIVE_APP_SERVICE_ID: JString; cdecl;
    {class} function _GetINTENT_KEY_TV_INPUT_ID: JString; cdecl;
    {class} function _GetINTERACTIVE_APP_STATE_ERROR: Integer; cdecl;
    {class} function _GetINTERACTIVE_APP_STATE_RUNNING: Integer; cdecl;
    {class} function _GetINTERACTIVE_APP_STATE_STOPPED: Integer; cdecl;
    {class} function _GetSERVICE_STATE_ERROR: Integer; cdecl;
    {class} function _GetSERVICE_STATE_PREPARING: Integer; cdecl;
    {class} function _GetSERVICE_STATE_READY: Integer; cdecl;
    {class} function _GetSERVICE_STATE_UNREALIZED: Integer; cdecl;
    {class} function _GetTELETEXT_APP_STATE_ERROR: Integer; cdecl;
    {class} function _GetTELETEXT_APP_STATE_HIDE: Integer; cdecl;
    {class} function _GetTELETEXT_APP_STATE_SHOW: Integer; cdecl;
    {class} property ACTION_APP_LINK_COMMAND: JString read _GetACTION_APP_LINK_COMMAND;
    {class} property APP_LINK_KEY_BACK_URI: JString read _GetAPP_LINK_KEY_BACK_URI;
    {class} property APP_LINK_KEY_CLASS_NAME: JString read _GetAPP_LINK_KEY_CLASS_NAME;
    {class} property APP_LINK_KEY_COMMAND_TYPE: JString read _GetAPP_LINK_KEY_COMMAND_TYPE;
    {class} property APP_LINK_KEY_PACKAGE_NAME: JString read _GetAPP_LINK_KEY_PACKAGE_NAME;
    {class} property APP_LINK_KEY_SERVICE_ID: JString read _GetAPP_LINK_KEY_SERVICE_ID;
    {class} property ERROR_BLOCKED: Integer read _GetERROR_BLOCKED;
    {class} property ERROR_ENCRYPTED: Integer read _GetERROR_ENCRYPTED;
    {class} property ERROR_NONE: Integer read _GetERROR_NONE;
    {class} property ERROR_NOT_SUPPORTED: Integer read _GetERROR_NOT_SUPPORTED;
    {class} property ERROR_RESOURCE_UNAVAILABLE: Integer read _GetERROR_RESOURCE_UNAVAILABLE;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
    {class} property ERROR_UNKNOWN_CHANNEL: Integer read _GetERROR_UNKNOWN_CHANNEL;
    {class} property ERROR_WEAK_SIGNAL: Integer read _GetERROR_WEAK_SIGNAL;
    {class} property INTENT_KEY_BI_INTERACTIVE_APP_TYPE: JString read _GetINTENT_KEY_BI_INTERACTIVE_APP_TYPE;
    {class} property INTENT_KEY_BI_INTERACTIVE_APP_URI: JString read _GetINTENT_KEY_BI_INTERACTIVE_APP_URI;
    {class} property INTENT_KEY_CHANNEL_URI: JString read _GetINTENT_KEY_CHANNEL_URI;
    {class} property INTENT_KEY_COMMAND_TYPE: JString read _GetINTENT_KEY_COMMAND_TYPE;
    {class} property INTENT_KEY_INTERACTIVE_APP_SERVICE_ID: JString read _GetINTENT_KEY_INTERACTIVE_APP_SERVICE_ID;
    {class} property INTENT_KEY_TV_INPUT_ID: JString read _GetINTENT_KEY_TV_INPUT_ID;
    {class} property INTERACTIVE_APP_STATE_ERROR: Integer read _GetINTERACTIVE_APP_STATE_ERROR;
    {class} property INTERACTIVE_APP_STATE_RUNNING: Integer read _GetINTERACTIVE_APP_STATE_RUNNING;
    {class} property INTERACTIVE_APP_STATE_STOPPED: Integer read _GetINTERACTIVE_APP_STATE_STOPPED;
    {class} property SERVICE_STATE_ERROR: Integer read _GetSERVICE_STATE_ERROR;
    {class} property SERVICE_STATE_PREPARING: Integer read _GetSERVICE_STATE_PREPARING;
    {class} property SERVICE_STATE_READY: Integer read _GetSERVICE_STATE_READY;
    {class} property SERVICE_STATE_UNREALIZED: Integer read _GetSERVICE_STATE_UNREALIZED;
    {class} property TELETEXT_APP_STATE_ERROR: Integer read _GetTELETEXT_APP_STATE_ERROR;
    {class} property TELETEXT_APP_STATE_HIDE: Integer read _GetTELETEXT_APP_STATE_HIDE;
    {class} property TELETEXT_APP_STATE_SHOW: Integer read _GetTELETEXT_APP_STATE_SHOW;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppManager')]
  JTvInteractiveAppManager = interface(JObject)
    ['{20F1276A-E89B-4A51-8040-1410C1D12C3D}']
    function getTvInteractiveAppServiceList: JList; cdecl;
    procedure registerAppLinkInfo(tvIAppServiceId: JString; appLinkInfo: JAppLinkInfo); cdecl;
    procedure registerCallback(executor: JExecutor; callback: JTvInteractiveAppManager_TvInteractiveAppCallback); cdecl;
    procedure sendAppLinkCommand(tvIAppServiceId: JString; command: JBundle); cdecl;
    procedure unregisterAppLinkInfo(tvIAppServiceId: JString; appLinkInfo: JAppLinkInfo); cdecl;
    procedure unregisterCallback(callback: JTvInteractiveAppManager_TvInteractiveAppCallback); cdecl;
  end;
  TJTvInteractiveAppManager = class(TJavaGenericImport<JTvInteractiveAppManagerClass, JTvInteractiveAppManager>) end;

  JTvInteractiveAppManager_TvInteractiveAppCallbackClass = interface(JObjectClass)
    ['{24C030B3-90A8-4F05-AD1F-E17A99744440}']
    {class} function init: JTvInteractiveAppManager_TvInteractiveAppCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppManager$TvInteractiveAppCallback')]
  JTvInteractiveAppManager_TvInteractiveAppCallback = interface(JObject)
    ['{A2D550DC-8F02-4EF2-9B0D-7B54DCE1E417}']
    procedure onInteractiveAppServiceAdded(iAppServiceId: JString); cdecl;
    procedure onInteractiveAppServiceRemoved(iAppServiceId: JString); cdecl;
    procedure onInteractiveAppServiceUpdated(iAppServiceId: JString); cdecl;
    procedure onTvInteractiveAppServiceStateChanged(iAppServiceId: JString; type_: Integer; state: Integer; err: Integer); cdecl;
  end;
  TJTvInteractiveAppManager_TvInteractiveAppCallback = class(TJavaGenericImport<JTvInteractiveAppManager_TvInteractiveAppCallbackClass, JTvInteractiveAppManager_TvInteractiveAppCallback>) end;

  JTvInteractiveAppServiceClass = interface(JServiceClass)
    ['{89770E05-8C4D-46DB-9C2E-F9C2F15F22E6}']
    {class} function _GetCOMMAND_PARAMETER_KEY_CHANGE_CHANNEL_QUIETLY: JString; cdecl;
    {class} function _GetCOMMAND_PARAMETER_KEY_CHANNEL_URI: JString; cdecl;
    {class} function _GetCOMMAND_PARAMETER_KEY_INPUT_ID: JString; cdecl;
    {class} function _GetCOMMAND_PARAMETER_KEY_TRACK_ID: JString; cdecl;
    {class} function _GetCOMMAND_PARAMETER_KEY_TRACK_TYPE: JString; cdecl;
    {class} function _GetCOMMAND_PARAMETER_KEY_VOLUME: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_SELECT_TRACK: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_SET_STREAM_VOLUME: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_STOP: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_TUNE: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_TUNE_NEXT: JString; cdecl;
    {class} function _GetPLAYBACK_COMMAND_TYPE_TUNE_PREV: JString; cdecl;
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function _GetSERVICE_META_DATA: JString; cdecl;
    {class} function init: JTvInteractiveAppService; cdecl;
    {class} property COMMAND_PARAMETER_KEY_CHANGE_CHANNEL_QUIETLY: JString read _GetCOMMAND_PARAMETER_KEY_CHANGE_CHANNEL_QUIETLY;
    {class} property COMMAND_PARAMETER_KEY_CHANNEL_URI: JString read _GetCOMMAND_PARAMETER_KEY_CHANNEL_URI;
    {class} property COMMAND_PARAMETER_KEY_INPUT_ID: JString read _GetCOMMAND_PARAMETER_KEY_INPUT_ID;
    {class} property COMMAND_PARAMETER_KEY_TRACK_ID: JString read _GetCOMMAND_PARAMETER_KEY_TRACK_ID;
    {class} property COMMAND_PARAMETER_KEY_TRACK_TYPE: JString read _GetCOMMAND_PARAMETER_KEY_TRACK_TYPE;
    {class} property COMMAND_PARAMETER_KEY_VOLUME: JString read _GetCOMMAND_PARAMETER_KEY_VOLUME;
    {class} property PLAYBACK_COMMAND_TYPE_SELECT_TRACK: JString read _GetPLAYBACK_COMMAND_TYPE_SELECT_TRACK;
    {class} property PLAYBACK_COMMAND_TYPE_SET_STREAM_VOLUME: JString read _GetPLAYBACK_COMMAND_TYPE_SET_STREAM_VOLUME;
    {class} property PLAYBACK_COMMAND_TYPE_STOP: JString read _GetPLAYBACK_COMMAND_TYPE_STOP;
    {class} property PLAYBACK_COMMAND_TYPE_TUNE: JString read _GetPLAYBACK_COMMAND_TYPE_TUNE;
    {class} property PLAYBACK_COMMAND_TYPE_TUNE_NEXT: JString read _GetPLAYBACK_COMMAND_TYPE_TUNE_NEXT;
    {class} property PLAYBACK_COMMAND_TYPE_TUNE_PREV: JString read _GetPLAYBACK_COMMAND_TYPE_TUNE_PREV;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
    {class} property SERVICE_META_DATA: JString read _GetSERVICE_META_DATA;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppService')]
  JTvInteractiveAppService = interface(JService)
    ['{AE7AD940-AB05-4CAF-816E-B3C9D713A410}']
    procedure notifyStateChanged(type_: Integer; state: Integer; error: Integer); cdecl;
    procedure onAppLinkCommand(command: JBundle); cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    function onCreateSession(iAppServiceId: JString; type_: Integer): JTvInteractiveAppService_Session; cdecl;
    procedure onRegisterAppLinkInfo(appLinkInfo: JAppLinkInfo); cdecl;
    procedure onUnregisterAppLinkInfo(appLinkInfo: JAppLinkInfo); cdecl;
  end;
  TJTvInteractiveAppService = class(TJavaGenericImport<JTvInteractiveAppServiceClass, JTvInteractiveAppService>) end;

  JTvInteractiveAppService_SessionClass = interface(JObjectClass)
    ['{FC5D0296-DC1E-4CA5-85B8-3E5D1BAC8DEE}']
    {class} function init(context: JContext): JTvInteractiveAppService_Session; cdecl;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppService$Session')]
  JTvInteractiveAppService_Session = interface(JObject)
    ['{13AF2BDA-BEF7-498F-9AA4-5F9A420AEF30}']
    function isMediaViewEnabled: Boolean; cdecl;
    procedure layoutSurface(left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl;
    procedure notifyBiInteractiveAppCreated(biIAppUri: Jnet_Uri; biIAppId: JString); cdecl;
    procedure notifySessionStateChanged(state: Integer; err: Integer); cdecl;
    procedure notifyTeletextAppStateChanged(state: Integer); cdecl;
    procedure onAdResponse(response: JAdResponse); cdecl;
    procedure onBroadcastInfoResponse(response: JBroadcastInfoResponse); cdecl;
    procedure onContentAllowed; cdecl;
    procedure onContentBlocked(rating: JTvContentRating); cdecl;
    procedure onCreateBiInteractiveAppRequest(biIAppUri: Jnet_Uri; params: JBundle); cdecl;
    function onCreateMediaView: JView; cdecl;
    procedure onCurrentChannelLcn(lcn: Integer); cdecl;
    procedure onCurrentChannelUri(channelUri: Jnet_Uri); cdecl;
    procedure onCurrentTvInputId(inputId: JString); cdecl;
    procedure onDestroyBiInteractiveAppRequest(biIAppId: JString); cdecl;
    procedure onError(errMsg: JString; params: JBundle); cdecl;
    function onGenericMotionEvent(event: JMotionEvent): Boolean; cdecl;
    function onKeyDown(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyLongPress(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyMultiple(keyCode: Integer; count: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyUp(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    procedure onMediaViewSizeChanged(width: Integer; height: Integer); cdecl;
    procedure onRelease; cdecl;
    procedure onResetInteractiveApp; cdecl;
    function onSetSurface(surface: JSurface): Boolean; cdecl;
    procedure onSetTeletextAppEnabled(enable: Boolean); cdecl;
    procedure onSignalStrength(strength: Integer); cdecl;
    procedure onSigningResult(signingId: JString; result: TJavaArray<Byte>); cdecl;
    procedure onStartInteractiveApp; cdecl;
    procedure onStopInteractiveApp; cdecl;
    procedure onStreamVolume(volume: Single); cdecl;
    procedure onSurfaceChanged(format: Integer; width: Integer; height: Integer); cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    procedure onTrackInfoList(tracks: JList); cdecl;
    procedure onTrackSelected(type_: Integer; trackId: JString); cdecl;
    function onTrackballEvent(event: JMotionEvent): Boolean; cdecl;
    procedure onTracksChanged(tracks: JList); cdecl;
    procedure onTuned(channelUri: Jnet_Uri); cdecl;
    procedure onVideoAvailable; cdecl;
    procedure onVideoUnavailable(reason: Integer); cdecl;
    procedure removeBroadcastInfo(requestId: Integer); cdecl;
    procedure requestAd(request: Jtv_AdRequest); cdecl;
    procedure requestBroadcastInfo(request: JBroadcastInfoRequest); cdecl;
    procedure requestCurrentChannelLcn; cdecl;
    procedure requestCurrentChannelUri; cdecl;
    procedure requestCurrentTvInputId; cdecl;
    procedure requestSigning(signingId: JString; algorithm: JString; alias: JString; data: TJavaArray<Byte>); cdecl;
    procedure requestStreamVolume; cdecl;
    procedure requestTrackInfoList; cdecl;
    procedure sendPlaybackCommandRequest(cmdType: JString; parameters: JBundle); cdecl;
    procedure setMediaViewEnabled(enable: Boolean); cdecl;
    procedure setVideoBounds(rect: JRect); cdecl;
  end;
  TJTvInteractiveAppService_Session = class(TJavaGenericImport<JTvInteractiveAppService_SessionClass, JTvInteractiveAppService_Session>) end;

  JTvInteractiveAppServiceInfoClass = interface(JObjectClass)
    ['{B1316AC9-8AF4-4BF6-A7B9-68F0CF12FFDA}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetINTERACTIVE_APP_TYPE_ATSC: Integer; cdecl;
    {class} function _GetINTERACTIVE_APP_TYPE_GINGA: Integer; cdecl;
    {class} function _GetINTERACTIVE_APP_TYPE_HBBTV: Integer; cdecl;
    {class} function init(context: JContext; component: JComponentName): JTvInteractiveAppServiceInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property INTERACTIVE_APP_TYPE_ATSC: Integer read _GetINTERACTIVE_APP_TYPE_ATSC;
    {class} property INTERACTIVE_APP_TYPE_GINGA: Integer read _GetINTERACTIVE_APP_TYPE_GINGA;
    {class} property INTERACTIVE_APP_TYPE_HBBTV: Integer read _GetINTERACTIVE_APP_TYPE_HBBTV;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppServiceInfo')]
  JTvInteractiveAppServiceInfo = interface(JObject)
    ['{34AA6264-5870-436B-BF21-D64EA3E1C8F1}']
    function describeContents: Integer; cdecl;
    function getId: JString; cdecl;
    function getServiceInfo: JServiceInfo; cdecl;
    function getSupportedTypes: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTvInteractiveAppServiceInfo = class(TJavaGenericImport<JTvInteractiveAppServiceInfoClass, JTvInteractiveAppServiceInfo>) end;

  JTvInteractiveAppViewClass = interface(JViewGroupClass)
    ['{6C196E8C-FB5C-4BD5-9527-2DEC29B30F82}']
    {class} function _GetBI_INTERACTIVE_APP_KEY_ALIAS: JString; cdecl;
    {class} function _GetBI_INTERACTIVE_APP_KEY_CERTIFICATE: JString; cdecl;
    {class} function _GetBI_INTERACTIVE_APP_KEY_HTTP_ADDITIONAL_HEADERS: JString; cdecl;
    {class} function _GetBI_INTERACTIVE_APP_KEY_HTTP_USER_AGENT: JString; cdecl;
    {class} function _GetBI_INTERACTIVE_APP_KEY_PRIVATE_KEY: JString; cdecl;
    {class} function _GetERROR_KEY_METHOD_NAME: JString; cdecl;
    {class} function init(context: JContext): JTvInteractiveAppView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTvInteractiveAppView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JTvInteractiveAppView; cdecl; overload;
    {class} property BI_INTERACTIVE_APP_KEY_ALIAS: JString read _GetBI_INTERACTIVE_APP_KEY_ALIAS;
    {class} property BI_INTERACTIVE_APP_KEY_CERTIFICATE: JString read _GetBI_INTERACTIVE_APP_KEY_CERTIFICATE;
    {class} property BI_INTERACTIVE_APP_KEY_HTTP_ADDITIONAL_HEADERS: JString read _GetBI_INTERACTIVE_APP_KEY_HTTP_ADDITIONAL_HEADERS;
    {class} property BI_INTERACTIVE_APP_KEY_HTTP_USER_AGENT: JString read _GetBI_INTERACTIVE_APP_KEY_HTTP_USER_AGENT;
    {class} property BI_INTERACTIVE_APP_KEY_PRIVATE_KEY: JString read _GetBI_INTERACTIVE_APP_KEY_PRIVATE_KEY;
    {class} property ERROR_KEY_METHOD_NAME: JString read _GetERROR_KEY_METHOD_NAME;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppView')]
  JTvInteractiveAppView = interface(JViewGroup)
    ['{36D21942-235B-475C-A575-1CCCB2936CD2}']
    procedure clearCallback; cdecl;
    procedure clearOnUnhandledInputEventListener; cdecl;
    procedure createBiInteractiveApp(biIAppUri: Jnet_Uri; params: JBundle); cdecl;
    procedure destroyBiInteractiveApp(biIAppId: JString); cdecl;
    function dispatchKeyEvent(event: JKeyEvent): Boolean; cdecl;
    function dispatchUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    function getOnUnhandledInputEventListener: JTvInteractiveAppView_OnUnhandledInputEventListener; cdecl;
    procedure notifyError(errMsg: JString; params: JBundle); cdecl;
    procedure onAttachedToWindow; cdecl;
    procedure onDetachedFromWindow; cdecl;
    procedure onLayout(changed: Boolean; left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl;
    procedure onMeasure(widthMeasureSpec: Integer; heightMeasureSpec: Integer); cdecl;
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    procedure onVisibilityChanged(changedView: JView; visibility: Integer); cdecl;
    procedure prepareInteractiveApp(iAppServiceId: JString; type_: Integer); cdecl;
    procedure reset; cdecl;
    procedure resetInteractiveApp; cdecl;
    procedure sendCurrentChannelLcn(lcn: Integer); cdecl;
    procedure sendCurrentChannelUri(channelUri: Jnet_Uri); cdecl;
    procedure sendCurrentTvInputId(inputId: JString); cdecl;
    procedure sendSigningResult(signingId: JString; result: TJavaArray<Byte>); cdecl;
    procedure sendStreamVolume(volume: Single); cdecl;
    procedure sendTrackInfoList(tracks: JList); cdecl;
    procedure setCallback(executor: JExecutor; callback: JTvInteractiveAppView_TvInteractiveAppCallback); cdecl;
    procedure setOnUnhandledInputEventListener(executor: JExecutor; listener: JTvInteractiveAppView_OnUnhandledInputEventListener); cdecl;
    procedure setTeletextAppEnabled(enable: Boolean); cdecl;
    function setTvView(tvView: JTvView): Integer; cdecl;
    procedure startInteractiveApp; cdecl;
    procedure stopInteractiveApp; cdecl;
  end;
  TJTvInteractiveAppView = class(TJavaGenericImport<JTvInteractiveAppViewClass, JTvInteractiveAppView>) end;

  JTvInteractiveAppView_OnUnhandledInputEventListenerClass = interface(IJavaClass)
    ['{CC300955-E500-4F48-892F-B18D24DFE171}']
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppView$OnUnhandledInputEventListener')]
  JTvInteractiveAppView_OnUnhandledInputEventListener = interface(IJavaInstance)
    ['{2A652ED3-6939-4934-B06C-442B709CA2CC}']
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
  end;
  TJTvInteractiveAppView_OnUnhandledInputEventListener = class(TJavaGenericImport<JTvInteractiveAppView_OnUnhandledInputEventListenerClass, JTvInteractiveAppView_OnUnhandledInputEventListener>) end;

  JTvInteractiveAppView_TvInteractiveAppCallbackClass = interface(JObjectClass)
    ['{EB975936-2AF2-47DF-9C64-573ACF63C8AF}']
    {class} function init: JTvInteractiveAppView_TvInteractiveAppCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/interactive/TvInteractiveAppView$TvInteractiveAppCallback')]
  JTvInteractiveAppView_TvInteractiveAppCallback = interface(JObject)
    ['{38FD3C1D-82D6-4FE3-A5E4-915487B8B5AF}']
    procedure onBiInteractiveAppCreated(iAppServiceId: JString; biIAppUri: Jnet_Uri; biIAppId: JString); cdecl;
    procedure onPlaybackCommandRequest(iAppServiceId: JString; cmdType: JString; parameters: JBundle); cdecl;
    procedure onRequestCurrentChannelLcn(iAppServiceId: JString); cdecl;
    procedure onRequestCurrentChannelUri(iAppServiceId: JString); cdecl;
    procedure onRequestCurrentTvInputId(iAppServiceId: JString); cdecl;
    procedure onRequestSigning(iAppServiceId: JString; signingId: JString; algorithm: JString; alias: JString; data: TJavaArray<Byte>); cdecl;
    procedure onRequestStreamVolume(iAppServiceId: JString); cdecl;
    procedure onRequestTrackInfoList(iAppServiceId: JString); cdecl;
    procedure onSetVideoBounds(iAppServiceId: JString; rect: JRect); cdecl;
    procedure onStateChanged(iAppServiceId: JString; state: Integer; err: Integer); cdecl;
    procedure onTeletextAppStateChanged(iAppServiceId: JString; state: Integer); cdecl;
  end;
  TJTvInteractiveAppView_TvInteractiveAppCallback = class(TJavaGenericImport<JTvInteractiveAppView_TvInteractiveAppCallbackClass, JTvInteractiveAppView_TvInteractiveAppCallback>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAsyncPlayer', TypeInfo(Androidapi.JNI.Media.JAsyncPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioAttributes', TypeInfo(Androidapi.JNI.Media.JAudioAttributes));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioAttributes_Builder', TypeInfo(Androidapi.JNI.Media.JAudioAttributes_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioDescriptor', TypeInfo(Androidapi.JNI.Media.JAudioDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioDeviceCallback', TypeInfo(Androidapi.JNI.Media.JAudioDeviceCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioDeviceInfo', TypeInfo(Androidapi.JNI.Media.JAudioDeviceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFocusRequest', TypeInfo(Androidapi.JNI.Media.JAudioFocusRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFocusRequest_Builder', TypeInfo(Androidapi.JNI.Media.JAudioFocusRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFormat', TypeInfo(Androidapi.JNI.Media.JAudioFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFormat_Builder', TypeInfo(Androidapi.JNI.Media.JAudioFormat_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager', TypeInfo(Androidapi.JNI.Media.JAudioManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_AudioPlaybackCallback', TypeInfo(Androidapi.JNI.Media.JAudioManager_AudioPlaybackCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_AudioRecordingCallback', TypeInfo(Androidapi.JNI.Media.JAudioManager_AudioRecordingCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_OnAudioFocusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioManager_OnAudioFocusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_OnCommunicationDeviceChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioManager_OnCommunicationDeviceChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_OnModeChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioManager_OnModeChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioMetadata', TypeInfo(Androidapi.JNI.Media.JAudioMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioMetadata_Format', TypeInfo(Androidapi.JNI.Media.JAudioMetadata_Format));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioMetadata_Key', TypeInfo(Androidapi.JNI.Media.JAudioMetadata_Key));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioMetadataReadMap', TypeInfo(Androidapi.JNI.Media.JAudioMetadataReadMap));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioMetadataMap', TypeInfo(Androidapi.JNI.Media.JAudioMetadataMap));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioPlaybackCaptureConfiguration', TypeInfo(Androidapi.JNI.Media.JAudioPlaybackCaptureConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioPlaybackCaptureConfiguration_Builder', TypeInfo(Androidapi.JNI.Media.JAudioPlaybackCaptureConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioPlaybackConfiguration', TypeInfo(Androidapi.JNI.Media.JAudioPlaybackConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioPresentation', TypeInfo(Androidapi.JNI.Media.JAudioPresentation));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioPresentation_Builder', TypeInfo(Androidapi.JNI.Media.JAudioPresentation_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioProfile', TypeInfo(Androidapi.JNI.Media.JAudioProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord', TypeInfo(Androidapi.JNI.Media.JAudioRecord));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_Builder', TypeInfo(Androidapi.JNI.Media.JAudioRecord_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JAudioRecord_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_OnRecordPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JAudioRecord_OnRecordPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRouting_OnRoutingChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioRouting_OnRoutingChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_OnRoutingChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioRecord_OnRoutingChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecordingConfiguration', TypeInfo(Androidapi.JNI.Media.JAudioRecordingConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecordingMonitor', TypeInfo(Androidapi.JNI.Media.JAudioRecordingMonitor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRouting', TypeInfo(Androidapi.JNI.Media.JAudioRouting));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTimestamp', TypeInfo(Androidapi.JNI.Media.JAudioTimestamp));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack', TypeInfo(Androidapi.JNI.Media.JAudioTrack));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_Builder', TypeInfo(Androidapi.JNI.Media.JAudioTrack_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JAudioTrack_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_OnCodecFormatChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioTrack_OnCodecFormatChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_OnPlaybackPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JAudioTrack_OnPlaybackPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_OnRoutingChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioTrack_OnRoutingChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_StreamEventCallback', TypeInfo(Androidapi.JNI.Media.JAudioTrack_StreamEventCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCamcorderProfile', TypeInfo(Androidapi.JNI.Media.JCamcorderProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCameraProfile', TypeInfo(Androidapi.JNI.Media.JCameraProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrmException', TypeInfo(Androidapi.JNI.Media.JMediaDrmException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDeniedByServerException', TypeInfo(Androidapi.JNI.Media.JDeniedByServerException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDrmInitData', TypeInfo(Androidapi.JNI.Media.JDrmInitData));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDrmInitData_SchemeInitData', TypeInfo(Androidapi.JNI.Media.JDrmInitData_SchemeInitData));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEncoderProfiles', TypeInfo(Androidapi.JNI.Media.JEncoderProfiles));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEncoderProfiles_AudioProfile', TypeInfo(Androidapi.JNI.Media.JEncoderProfiles_AudioProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEncoderProfiles_VideoProfile', TypeInfo(Androidapi.JNI.Media.JEncoderProfiles_VideoProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JExifInterface', TypeInfo(Androidapi.JNI.Media.JExifInterface));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JFaceDetector', TypeInfo(Androidapi.JNI.Media.JFaceDetector));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JFaceDetector_Face', TypeInfo(Androidapi.JNI.Media.JFaceDetector_Face));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImage', TypeInfo(Androidapi.JNI.Media.JImage));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImage_Plane', TypeInfo(Androidapi.JNI.Media.JImage_Plane));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageReader', TypeInfo(Androidapi.JNI.Media.JImageReader));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageReader_Builder', TypeInfo(Androidapi.JNI.Media.JImageReader_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageReader_OnImageAvailableListener', TypeInfo(Androidapi.JNI.Media.JImageReader_OnImageAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageWriter', TypeInfo(Androidapi.JNI.Media.JImageWriter));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageWriter_Builder', TypeInfo(Androidapi.JNI.Media.JImageWriter_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageWriter_OnImageReleasedListener', TypeInfo(Androidapi.JNI.Media.JImageWriter_OnImageReleasedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JJetPlayer', TypeInfo(Androidapi.JNI.Media.JJetPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JJetPlayer_OnJetEventListener', TypeInfo(Androidapi.JNI.Media.JJetPlayer_OnJetEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaActionSound', TypeInfo(Androidapi.JNI.Media.JMediaActionSound));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCas', TypeInfo(Androidapi.JNI.Media.JMediaCas));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCas_EventListener', TypeInfo(Androidapi.JNI.Media.JMediaCas_EventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCas_PluginDescriptor', TypeInfo(Androidapi.JNI.Media.JMediaCas_PluginDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCas_Session', TypeInfo(Androidapi.JNI.Media.JMediaCas_Session));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException', TypeInfo(Androidapi.JNI.Media.JMediaCasException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException_DeniedByServerException', TypeInfo(Androidapi.JNI.Media.JMediaCasException_DeniedByServerException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException_InsufficientResourceException', TypeInfo(Androidapi.JNI.Media.JMediaCasException_InsufficientResourceException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException_NotProvisionedException', TypeInfo(Androidapi.JNI.Media.JMediaCasException_NotProvisionedException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException_ResourceBusyException', TypeInfo(Androidapi.JNI.Media.JMediaCasException_ResourceBusyException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasException_UnsupportedCasException', TypeInfo(Androidapi.JNI.Media.JMediaCasException_UnsupportedCasException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCasStateException', TypeInfo(Androidapi.JNI.Media.JMediaCasStateException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec', TypeInfo(Androidapi.JNI.Media.JMediaCodec));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_BufferInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodec_BufferInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_Callback', TypeInfo(Androidapi.JNI.Media.JMediaCodec_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CodecException', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CodecException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CryptoException', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CryptoException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CryptoInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CryptoInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCryptoInfo_Pattern', TypeInfo(Androidapi.JNI.Media.JCryptoInfo_Pattern));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_IncompatibleWithBlockModelException', TypeInfo(Androidapi.JNI.Media.JMediaCodec_IncompatibleWithBlockModelException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_LinearBlock', TypeInfo(Androidapi.JNI.Media.JMediaCodec_LinearBlock));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JMediaCodec_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_OnFirstTunnelFrameReadyListener', TypeInfo(Androidapi.JNI.Media.JMediaCodec_OnFirstTunnelFrameReadyListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_OnFrameRenderedListener', TypeInfo(Androidapi.JNI.Media.JMediaCodec_OnFrameRenderedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_OutputFrame', TypeInfo(Androidapi.JNI.Media.JMediaCodec_OutputFrame));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_ParameterDescriptor', TypeInfo(Androidapi.JNI.Media.JMediaCodec_ParameterDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_QueueRequest', TypeInfo(Androidapi.JNI.Media.JMediaCodec_QueueRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_AudioCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_AudioCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_CodecCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_CodecCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_CodecProfileLevel', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_CodecProfileLevel));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_EncoderCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_EncoderCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_VideoCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_VideoCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVideoCapabilities_PerformancePoint', TypeInfo(Androidapi.JNI.Media.JVideoCapabilities_PerformancePoint));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecList', TypeInfo(Androidapi.JNI.Media.JMediaCodecList));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCrypto', TypeInfo(Androidapi.JNI.Media.JMediaCrypto));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCryptoException', TypeInfo(Androidapi.JNI.Media.JMediaCryptoException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDataSource', TypeInfo(Androidapi.JNI.Media.JMediaDataSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDescrambler', TypeInfo(Androidapi.JNI.Media.JMediaDescrambler));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDescription', TypeInfo(Androidapi.JNI.Media.JMediaDescription));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDescription_Builder', TypeInfo(Androidapi.JNI.Media.JMediaDescription_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm', TypeInfo(Androidapi.JNI.Media.JMediaDrm));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_CryptoSession', TypeInfo(Androidapi.JNI.Media.JMediaDrm_CryptoSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_ErrorCodes', TypeInfo(Androidapi.JNI.Media.JMediaDrm_ErrorCodes));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_HdcpLevel', TypeInfo(Androidapi.JNI.Media.JMediaDrm_HdcpLevel));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_KeyRequest', TypeInfo(Androidapi.JNI.Media.JMediaDrm_KeyRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_KeyStatus', TypeInfo(Androidapi.JNI.Media.JMediaDrm_KeyStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_LogMessage', TypeInfo(Androidapi.JNI.Media.JMediaDrm_LogMessage));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_MediaDrmStateException', TypeInfo(Androidapi.JNI.Media.JMediaDrm_MediaDrmStateException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JMediaDrm_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnEventListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnExpirationUpdateListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnExpirationUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnKeyStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnKeyStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnSessionLostStateListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnSessionLostStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_PlaybackComponent', TypeInfo(Androidapi.JNI.Media.JMediaDrm_PlaybackComponent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_ProvisionRequest', TypeInfo(Androidapi.JNI.Media.JMediaDrm_ProvisionRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_SecurityLevel', TypeInfo(Androidapi.JNI.Media.JMediaDrm_SecurityLevel));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_SessionException', TypeInfo(Androidapi.JNI.Media.JMediaDrm_SessionException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrmResetException', TypeInfo(Androidapi.JNI.Media.JMediaDrmResetException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaExtractor', TypeInfo(Androidapi.JNI.Media.JMediaExtractor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaExtractor_CasInfo', TypeInfo(Androidapi.JNI.Media.JMediaExtractor_CasInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaExtractor_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JMediaExtractor_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaFormat', TypeInfo(Androidapi.JNI.Media.JMediaFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jmedia_MediaMetadata', TypeInfo(Androidapi.JNI.Media.Jmedia_MediaMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadata_Builder', TypeInfo(Androidapi.JNI.Media.JMediaMetadata_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadataEditor', TypeInfo(Androidapi.JNI.Media.JMediaMetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadataRetriever', TypeInfo(Androidapi.JNI.Media.JMediaMetadataRetriever));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadataRetriever_BitmapParams', TypeInfo(Androidapi.JNI.Media.JMediaMetadataRetriever_BitmapParams));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMuxer', TypeInfo(Androidapi.JNI.Media.JMediaMuxer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMuxer_OutputFormat', TypeInfo(Androidapi.JNI.Media.JMediaMuxer_OutputFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer', TypeInfo(Androidapi.JNI.Media.JMediaPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_DrmInfo', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_DrmInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_NoDrmSchemeException', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_NoDrmSchemeException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnBufferingUpdateListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnBufferingUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnCompletionListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnCompletionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnDrmConfigHelper', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnDrmConfigHelper));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnDrmInfoListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnDrmInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnDrmPreparedListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnDrmPreparedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnInfoListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnMediaTimeDiscontinuityListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnMediaTimeDiscontinuityListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnPreparedListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnPreparedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnSeekCompleteListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnSeekCompleteListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnSubtitleDataListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnSubtitleDataListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnTimedMetaDataAvailableListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnTimedMetaDataAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnTimedTextListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnTimedTextListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnVideoSizeChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnVideoSizeChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_ProvisioningNetworkErrorException', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_ProvisioningNetworkErrorException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_ProvisioningServerErrorException', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_ProvisioningServerErrorException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_TrackInfo', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_TrackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_AudioEncoder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_AudioEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_AudioSource', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_AudioSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_MetricsConstants', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_MetricsConstants));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OnInfoListener', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OnInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OutputFormat', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OutputFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_VideoEncoder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_VideoEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_VideoSource', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_VideoSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRoute2Info', TypeInfo(Androidapi.JNI.Media.JMediaRoute2Info));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRoute2Info_Builder', TypeInfo(Androidapi.JNI.Media.JMediaRoute2Info_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRoute2ProviderService', TypeInfo(Androidapi.JNI.Media.JMediaRoute2ProviderService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter', TypeInfo(Androidapi.JNI.Media.JMediaRouter));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_Callback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteCategory', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteCategory));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteInfo', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteGroup', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteGroup));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_SimpleCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_SimpleCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_UserRouteInfo', TypeInfo(Androidapi.JNI.Media.JMediaRouter_UserRouteInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_VolumeCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_VolumeCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2', TypeInfo(Androidapi.JNI.Media.JMediaRouter2));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2_ControllerCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter2_ControllerCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2_OnGetControllerHintsListener', TypeInfo(Androidapi.JNI.Media.JMediaRouter2_OnGetControllerHintsListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2_RouteCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter2_RouteCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2_RoutingController', TypeInfo(Androidapi.JNI.Media.JMediaRouter2_RoutingController));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter2_TransferCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter2_TransferCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection_OnScanCompletedListener', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection_OnScanCompletedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection_MediaScannerConnectionClient', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection_MediaScannerConnectionClient));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync', TypeInfo(Androidapi.JNI.Media.JMediaSync));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync_Callback', TypeInfo(Androidapi.JNI.Media.JMediaSync_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaSync_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSyncEvent', TypeInfo(Androidapi.JNI.Media.JMediaSyncEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaTimestamp', TypeInfo(Androidapi.JNI.Media.JMediaTimestamp));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMicrophoneDirection', TypeInfo(Androidapi.JNI.Media.JMicrophoneDirection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMicrophoneInfo', TypeInfo(Androidapi.JNI.Media.JMicrophoneInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMicrophoneInfo_Coordinate3F', TypeInfo(Androidapi.JNI.Media.JMicrophoneInfo_Coordinate3F));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JNotProvisionedException', TypeInfo(Androidapi.JNI.Media.JNotProvisionedException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackParams', TypeInfo(Androidapi.JNI.Media.JPlaybackParams));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRating', TypeInfo(Androidapi.JNI.Media.JRating));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_MetadataEditor', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_MetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnGetPlaybackPositionListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnGetPlaybackPositionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnMetadataUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnMetadataUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnPlaybackPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnPlaybackPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController', TypeInfo(Androidapi.JNI.Media.JRemoteController));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController_MetadataEditor', TypeInfo(Androidapi.JNI.Media.JRemoteController_MetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController_OnClientUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteController_OnClientUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JResourceBusyException', TypeInfo(Androidapi.JNI.Media.JResourceBusyException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRingtone', TypeInfo(Androidapi.JNI.Media.JRingtone));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRingtoneManager', TypeInfo(Androidapi.JNI.Media.JRingtoneManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRouteDiscoveryPreference', TypeInfo(Androidapi.JNI.Media.JRouteDiscoveryPreference));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRouteDiscoveryPreference_Builder', TypeInfo(Androidapi.JNI.Media.JRouteDiscoveryPreference_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRoutingSessionInfo', TypeInfo(Androidapi.JNI.Media.JRoutingSessionInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRoutingSessionInfo_Builder', TypeInfo(Androidapi.JNI.Media.JRoutingSessionInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool', TypeInfo(Androidapi.JNI.Media.JSoundPool));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool_Builder', TypeInfo(Androidapi.JNI.Media.JSoundPool_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool_OnLoadCompleteListener', TypeInfo(Androidapi.JNI.Media.JSoundPool_OnLoadCompleteListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSpatializer', TypeInfo(Androidapi.JNI.Media.JSpatializer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSpatializer_OnHeadTrackerAvailableListener', TypeInfo(Androidapi.JNI.Media.JSpatializer_OnHeadTrackerAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSpatializer_OnSpatializerStateChangedListener', TypeInfo(Androidapi.JNI.Media.JSpatializer_OnSpatializerStateChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSubtitleData', TypeInfo(Androidapi.JNI.Media.JSubtitleData));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSyncParams', TypeInfo(Androidapi.JNI.Media.JSyncParams));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JThumbnailUtils', TypeInfo(Androidapi.JNI.Media.JThumbnailUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimedMetaData', TypeInfo(Androidapi.JNI.Media.JTimedMetaData));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimedText', TypeInfo(Androidapi.JNI.Media.JTimedText));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JToneGenerator', TypeInfo(Androidapi.JNI.Media.JToneGenerator));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JUnsupportedSchemeException', TypeInfo(Androidapi.JNI.Media.JUnsupportedSchemeException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeAutomation', TypeInfo(Androidapi.JNI.Media.JVolumeAutomation));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeProvider', TypeInfo(Androidapi.JNI.Media.JVolumeProvider));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeShaper', TypeInfo(Androidapi.JNI.Media.JVolumeShaper));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeShaper_Configuration', TypeInfo(Androidapi.JNI.Media.JVolumeShaper_Configuration));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JConfiguration_Builder', TypeInfo(Androidapi.JNI.Media.JConfiguration_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeShaper_Operation', TypeInfo(Androidapi.JNI.Media.JVolumeShaper_Operation));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect', TypeInfo(Androidapi.JNI.Media.JAudioEffect));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAcousticEchoCanceler', TypeInfo(Androidapi.JNI.Media.JAcousticEchoCanceler));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_Descriptor', TypeInfo(Androidapi.JNI.Media.JAudioEffect_Descriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_OnControlStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioEffect_OnControlStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_OnEnableStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioEffect_OnEnableStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAutomaticGainControl', TypeInfo(Androidapi.JNI.Media.JAutomaticGainControl));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost', TypeInfo(Androidapi.JNI.Media.JBassBoost));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JBassBoost_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost_Settings', TypeInfo(Androidapi.JNI.Media.JBassBoost_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_BandBase', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_BandBase));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Stage', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Stage));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_BandStage', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_BandStage));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Channel', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Channel));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Config', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Config));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JConfig_Builder', TypeInfo(Androidapi.JNI.Media.JConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Eq', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Eq));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_EqBand', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_EqBand));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Limiter', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Limiter));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_Mbc', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_Mbc));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDynamicsProcessing_MbcBand', TypeInfo(Androidapi.JNI.Media.JDynamicsProcessing_MbcBand));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb_Settings', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer', TypeInfo(Androidapi.JNI.Media.JEqualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JEqualizer_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer_Settings', TypeInfo(Androidapi.JNI.Media.JEqualizer_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JHapticGenerator', TypeInfo(Androidapi.JNI.Media.JHapticGenerator));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JLoudnessEnhancer', TypeInfo(Androidapi.JNI.Media.JLoudnessEnhancer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JNoiseSuppressor', TypeInfo(Androidapi.JNI.Media.JNoiseSuppressor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb', TypeInfo(Androidapi.JNI.Media.JPresetReverb));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JPresetReverb_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb_Settings', TypeInfo(Androidapi.JNI.Media.JPresetReverb_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer', TypeInfo(Androidapi.JNI.Media.JVirtualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JVirtualizer_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer_Settings', TypeInfo(Androidapi.JNI.Media.JVirtualizer_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer', TypeInfo(Androidapi.JNI.Media.JVisualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer_MeasurementPeakRms', TypeInfo(Androidapi.JNI.Media.JVisualizer_MeasurementPeakRms));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer_OnDataCaptureListener', TypeInfo(Androidapi.JNI.Media.JVisualizer_OnDataCaptureListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser', TypeInfo(Androidapi.JNI.Media.JMediaBrowser));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_ConnectionCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_ConnectionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_ItemCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_ItemCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_MediaItem', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_MediaItem));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_SubscriptionCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_SubscriptionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffect', TypeInfo(Androidapi.JNI.Media.JEffect));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectContext', TypeInfo(Androidapi.JNI.Media.JEffectContext));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectFactory', TypeInfo(Androidapi.JNI.Media.JEffectFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectUpdateListener', TypeInfo(Androidapi.JNI.Media.JEffectUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBundleSession', TypeInfo(Androidapi.JNI.Media.JBundleSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEditingSession', TypeInfo(Androidapi.JNI.Media.JEditingSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jmetrics_Event', TypeInfo(Androidapi.JNI.Media.Jmetrics_Event));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JLogSessionId', TypeInfo(Androidapi.JNI.Media.JLogSessionId));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetricsManager', TypeInfo(Androidapi.JNI.Media.JMediaMetricsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jmetrics_NetworkEvent', TypeInfo(Androidapi.JNI.Media.Jmetrics_NetworkEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JNetworkEvent_Builder', TypeInfo(Androidapi.JNI.Media.JNetworkEvent_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackErrorEvent', TypeInfo(Androidapi.JNI.Media.JPlaybackErrorEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackErrorEvent_Builder', TypeInfo(Androidapi.JNI.Media.JPlaybackErrorEvent_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackMetrics', TypeInfo(Androidapi.JNI.Media.JPlaybackMetrics));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackMetrics_Builder', TypeInfo(Androidapi.JNI.Media.JPlaybackMetrics_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackSession', TypeInfo(Androidapi.JNI.Media.JPlaybackSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackStateEvent', TypeInfo(Androidapi.JNI.Media.JPlaybackStateEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackStateEvent_Builder', TypeInfo(Androidapi.JNI.Media.JPlaybackStateEvent_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRecordingSession', TypeInfo(Androidapi.JNI.Media.JRecordingSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTrackChangeEvent', TypeInfo(Androidapi.JNI.Media.JTrackChangeEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTrackChangeEvent_Builder', TypeInfo(Androidapi.JNI.Media.JTrackChangeEvent_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTranscodingSession', TypeInfo(Androidapi.JNI.Media.JTranscodingSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDevice', TypeInfo(Androidapi.JNI.Media.JMidiDevice));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDevice_MidiConnection', TypeInfo(Androidapi.JNI.Media.JMidiDevice_MidiConnection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceInfo', TypeInfo(Androidapi.JNI.Media.JMidiDeviceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceInfo_PortInfo', TypeInfo(Androidapi.JNI.Media.JMidiDeviceInfo_PortInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceService', TypeInfo(Androidapi.JNI.Media.JMidiDeviceService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceStatus', TypeInfo(Androidapi.JNI.Media.JMidiDeviceStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiReceiver', TypeInfo(Androidapi.JNI.Media.JMidiReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiInputPort', TypeInfo(Androidapi.JNI.Media.JMidiInputPort));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager', TypeInfo(Androidapi.JNI.Media.JMidiManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager_DeviceCallback', TypeInfo(Androidapi.JNI.Media.JMidiManager_DeviceCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager_OnDeviceOpenedListener', TypeInfo(Androidapi.JNI.Media.JMidiManager_OnDeviceOpenedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiSender', TypeInfo(Androidapi.JNI.Media.JMidiSender));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiOutputPort', TypeInfo(Androidapi.JNI.Media.JMidiOutputPort));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjection', TypeInfo(Androidapi.JNI.Media.JMediaProjection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjection_Callback', TypeInfo(Androidapi.JNI.Media.JMediaProjection_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjectionManager', TypeInfo(Androidapi.JNI.Media.JMediaProjectionManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jsession_MediaController', TypeInfo(Androidapi.JNI.Media.Jsession_MediaController));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_Callback', TypeInfo(Androidapi.JNI.Media.JMediaController_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_PlaybackInfo', TypeInfo(Androidapi.JNI.Media.JMediaController_PlaybackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_TransportControls', TypeInfo(Androidapi.JNI.Media.JMediaController_TransportControls));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession', TypeInfo(Androidapi.JNI.Media.JMediaSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_Callback', TypeInfo(Androidapi.JNI.Media.JMediaSession_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_QueueItem', TypeInfo(Androidapi.JNI.Media.JMediaSession_QueueItem));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_Token', TypeInfo(Androidapi.JNI.Media.JMediaSession_Token));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager_OnActiveSessionsChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager_OnActiveSessionsChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager_OnMediaKeyEventSessionChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager_OnMediaKeyEventSessionChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager_OnSession2TokensChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager_OnSession2TokensChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager_RemoteUserInfo', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager_RemoteUserInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState', TypeInfo(Androidapi.JNI.Media.JPlaybackState));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState_Builder', TypeInfo(Androidapi.JNI.Media.JPlaybackState_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState_CustomAction', TypeInfo(Androidapi.JNI.Media.JPlaybackState_CustomAction));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCustomAction_Builder', TypeInfo(Androidapi.JNI.Media.JCustomAction_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jtv_AdRequest', TypeInfo(Androidapi.JNI.Media.Jtv_AdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAdResponse', TypeInfo(Androidapi.JNI.Media.JAdResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAitInfo', TypeInfo(Androidapi.JNI.Media.JAitInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBroadcastInfoRequest', TypeInfo(Androidapi.JNI.Media.JBroadcastInfoRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBroadcastInfoResponse', TypeInfo(Androidapi.JNI.Media.JBroadcastInfoResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCommandRequest', TypeInfo(Androidapi.JNI.Media.JCommandRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCommandResponse', TypeInfo(Androidapi.JNI.Media.JCommandResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDsmccRequest', TypeInfo(Androidapi.JNI.Media.JDsmccRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDsmccResponse', TypeInfo(Androidapi.JNI.Media.JDsmccResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPesRequest', TypeInfo(Androidapi.JNI.Media.JPesRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPesResponse', TypeInfo(Androidapi.JNI.Media.JPesResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSectionRequest', TypeInfo(Androidapi.JNI.Media.JSectionRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSectionResponse', TypeInfo(Androidapi.JNI.Media.JSectionResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JStreamEventRequest', TypeInfo(Androidapi.JNI.Media.JStreamEventRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JStreamEventResponse', TypeInfo(Androidapi.JNI.Media.JStreamEventResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTableRequest', TypeInfo(Androidapi.JNI.Media.JTableRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTableResponse', TypeInfo(Androidapi.JNI.Media.JTableResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimelineRequest', TypeInfo(Androidapi.JNI.Media.JTimelineRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimelineResponse', TypeInfo(Androidapi.JNI.Media.JTimelineResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTsRequest', TypeInfo(Androidapi.JNI.Media.JTsRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTsResponse', TypeInfo(Androidapi.JNI.Media.JTsResponse));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContentRating', TypeInfo(Androidapi.JNI.Media.JTvContentRating));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract', TypeInfo(Androidapi.JNI.Media.JTvContract));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_BaseTvColumns', TypeInfo(Androidapi.JNI.Media.JTvContract_BaseTvColumns));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_Channels', TypeInfo(Androidapi.JNI.Media.JTvContract_Channels));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JChannels_Logo', TypeInfo(Androidapi.JNI.Media.JChannels_Logo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_PreviewPrograms', TypeInfo(Androidapi.JNI.Media.JTvContract_PreviewPrograms));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_Programs', TypeInfo(Androidapi.JNI.Media.JTvContract_Programs));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPrograms_Genres', TypeInfo(Androidapi.JNI.Media.JPrograms_Genres));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_RecordedPrograms', TypeInfo(Androidapi.JNI.Media.JTvContract_RecordedPrograms));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_WatchNextPrograms', TypeInfo(Androidapi.JNI.Media.JTvContract_WatchNextPrograms));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputInfo', TypeInfo(Androidapi.JNI.Media.JTvInputInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputInfo_Builder', TypeInfo(Androidapi.JNI.Media.JTvInputInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputManager', TypeInfo(Androidapi.JNI.Media.JTvInputManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputManager_TvInputCallback', TypeInfo(Androidapi.JNI.Media.JTvInputManager_TvInputCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService', TypeInfo(Androidapi.JNI.Media.JTvInputService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService_Session', TypeInfo(Androidapi.JNI.Media.JTvInputService_Session));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService_HardwareSession', TypeInfo(Androidapi.JNI.Media.JTvInputService_HardwareSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService_RecordingSession', TypeInfo(Androidapi.JNI.Media.JTvInputService_RecordingSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvRecordingClient', TypeInfo(Androidapi.JNI.Media.JTvRecordingClient));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvRecordingClient_RecordingCallback', TypeInfo(Androidapi.JNI.Media.JTvRecordingClient_RecordingCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvTrackInfo', TypeInfo(Androidapi.JNI.Media.JTvTrackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvTrackInfo_Builder', TypeInfo(Androidapi.JNI.Media.JTvTrackInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView', TypeInfo(Androidapi.JNI.Media.JTvView));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_OnUnhandledInputEventListener', TypeInfo(Androidapi.JNI.Media.JTvView_OnUnhandledInputEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_TimeShiftPositionCallback', TypeInfo(Androidapi.JNI.Media.JTvView_TimeShiftPositionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_TvInputCallback', TypeInfo(Androidapi.JNI.Media.JTvView_TvInputCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAppLinkInfo', TypeInfo(Androidapi.JNI.Media.JAppLinkInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppManager', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppManager_TvInteractiveAppCallback', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppManager_TvInteractiveAppCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppService', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppService_Session', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppService_Session));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppServiceInfo', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppServiceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppView', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppView));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppView_OnUnhandledInputEventListener', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppView_OnUnhandledInputEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInteractiveAppView_TvInteractiveAppCallback', TypeInfo(Androidapi.JNI.Media.JTvInteractiveAppView_TvInteractiveAppCallback));
end;

initialization
  RegisterTypes;
end.


