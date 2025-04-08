{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Vulkan;

{$ALIGN ON}
{$WEAKPACKAGEUNIT}

interface

{$IF not DECLARED(UTF8Char)}
type
  UTF8Char = AnsiChar;
{$ENDIF}

type
  PFN_vkVoidFunction = procedure (); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  VkFlags = type Cardinal;

const
  VK_CHROMA_LOCATION_COSITED_EVEN = 0;

  VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = $00000001;
  VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = $00000008;

  VK_FILTER_NEAREST = 0;
  
  VK_FORMAT_UNDEFINED = 0;
  VK_FORMAT_R8G8B8A8_UNORM = 37;
  VK_FORMAT_R8G8B8A8_SRGB = 43;
  VK_FORMAT_B8G8R8A8_UNORM = 44;
  
  VK_IMAGE_LAYOUT_UNDEFINED = 0;
  VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002;
  VK_IMAGE_TILING_OPTIMAL = 0;
  VK_IMAGE_USAGE_TRANSFER_SRC_BIT = $00000001;
  VK_IMAGE_USAGE_TRANSFER_DST_BIT = $00000002;
  VK_IMAGE_USAGE_SAMPLED_BIT = $00000004;
  VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT = $00000010;
  VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT = $00000080;
  
  VK_PRESENT_MODE_IMMEDIATE_KHR = 0;
  VK_PRESENT_MODE_MAILBOX_KHR = 1;
  VK_PRESENT_MODE_FIFO_KHR = 2;
  
  VK_QUEUE_GRAPHICS_BIT = $00000001;
  
  VK_SUCCESS = 0;
  VK_NOT_READY = 1;
  VK_TIMEOUT = 2;
  VK_EVENT_SET = 3;
  VK_EVENT_RESET = 4;
  VK_INCOMPLETE = 5;
  VK_ERROR_OUT_OF_HOST_MEMORY = -1;
  VK_ERROR_OUT_OF_DEVICE_MEMORY = -2;
  VK_ERROR_INITIALIZATION_FAILED = -3;
  VK_ERROR_DEVICE_LOST = -4;
  VK_ERROR_MEMORY_MAP_FAILED = -5;
  VK_ERROR_LAYER_NOT_PRESENT = -6;
  VK_ERROR_EXTENSION_NOT_PRESENT = -7;
  VK_ERROR_FEATURE_NOT_PRESENT = -8;
  VK_ERROR_INCOMPATIBLE_DRIVER = -9;
  VK_ERROR_TOO_MANY_OBJECTS = -10;
  VK_ERROR_FORMAT_NOT_SUPPORTED = -11;
  VK_ERROR_FRAGMENTED_POOL = -12;
  VK_ERROR_UNKNOWN = -13;
  VK_ERROR_OUT_OF_POOL_MEMORY = -1000069000;
  VK_ERROR_INVALID_EXTERNAL_HANDLE = -1000072003;
  VK_ERROR_SURFACE_LOST_KHR = -1000000000;
  VK_ERROR_NATIVE_WINDOW_IN_USE_KHR = -1000000001;
  VK_SUBOPTIMAL_KHR = 1000001003;
  VK_ERROR_OUT_OF_DATE_KHR = -1000001004;
  
  VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY = 0;
  
  VK_SAMPLER_YCBCR_RANGE_ITU_FULL = 0;
  
  VK_SHARING_MODE_EXCLUSIVE = 0;
  VK_SHARING_MODE_CONCURRENT = 1;
  
  VK_STRUCTURE_TYPE_APPLICATION_INFO = 0;
  VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO = 1;
  VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO = 2;
  VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO = 3;
  VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO = 9;
  VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = 1000001000;
  VK_STRUCTURE_TYPE_PRESENT_INFO_KHR = 1000001001;
  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2 = 1000059000;
  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = 1000148000;
  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES = 1000156004;

  VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR = $00000001;
  
  VK_FALSE = 0;
  VK_TRUE = 1;
  
  VK_MAX_EXTENSION_NAME_SIZE = 256;
  VK_MAX_PHYSICAL_DEVICE_NAME_SIZE = 256;
  
  VK_NULL_HANDLE = 0;
  
  VK_UUID_SIZE = 16;

  VK_EXT_BLEND_OPERATION_ADVANCED_EXTENSION_NAME = 'VK_EXT_blend_operation_advanced'; 
  VK_KHR_SURFACE_EXTENSION_NAME = 'VK_KHR_surface';
  VK_KHR_SWAPCHAIN_EXTENSION_NAME = 'VK_KHR_swapchain';
  VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME = 'VK_KHR_get_physical_device_properties2';
  VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME = 'VK_KHR_sampler_ycbcr_conversion';

type
  PVkBool32 = ^VkBool32;
  VkBool32 = Cardinal;

  VkColorSpaceKHR = Integer;

  VkCompositeAlphaFlagBitsKHR = Integer;

  VkCompositeAlphaFlagsKHR = VkFlags;

  PVkDevice = ^VkDevice;
  VkDevice = NativeInt;

  VkDeviceCreateFlags = VkFlags;

  VkDeviceQueueCreateFlags = VkFlags;

  VkDeviceSize = UInt64;

  VkFormat = Integer;

  PVkImage = ^VkImage;
  VkImage = UInt64;

  VkImageLayout = Integer;

  VkImageUsageFlags = VkFlags;

  PVkInstance = ^VkInstance;
  VkInstance = NativeInt;

  VkInstanceCreateFlags = VkFlags;

  PVkPhysicalDevice = ^VkPhysicalDevice;
  VkPhysicalDevice = NativeInt;

  VkPhysicalDeviceType = Integer;

  PVkPresentModeKHR = ^VkPresentModeKHR;
  VkPresentModeKHR = Integer;

  PVkQueue = ^VkQueue;
  VkQueue = NativeInt;

  VkQueueFlags = VkFlags;

  PVkResult = ^VkResult;
  VkResult = Integer;

  VkSampleCountFlags = VkFlags;

  PVkSemaphore = ^VkSemaphore;
  VkSemaphore = UInt64;

  VkSemaphoreCreateFlags = VkFlags;

  VkSharingMode = Integer;

  VkStructureType = Integer;

  PVkSurfaceKHR = ^VkSurfaceKHR;
  VkSurfaceKHR = UInt64;

  VkSurfaceTransformFlagBitsKHR = Integer;

  VkSurfaceTransformFlagsKHR = VkFlags;

  PVkSwapchainKHR = ^VkSwapchainKHR;
  VkSwapchainKHR = UInt64;

  VkSwapchainCreateFlagsKHR = VkFlags;

  VkFence = UInt64;

  PVkAllocationCallbacks = Pointer;

  PVkApplicationInfo = ^VkApplicationInfo;
  VkApplicationInfo = record
    sType: VkStructureType;
    pNext: Pointer;
    pApplicationName: MarshaledAString;
    applicationVersion: Cardinal;
    pEngineName: MarshaledAString;
    engineVersion: Cardinal;
    apiVersion: Cardinal;
  end;

  PVkDeviceQueueCreateInfo = ^VkDeviceQueueCreateInfo;
  VkDeviceQueueCreateInfo = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkDeviceQueueCreateFlags;
    queueFamilyIndex: Cardinal;
    queueCount: Cardinal;
    pQueuePriorities: PSingle;
  end;

  PVkExtensionProperties = ^VkExtensionProperties;
  VkExtensionProperties = record
    extensionName: array[0..VK_MAX_EXTENSION_NAME_SIZE-1] of UTF8Char;
    specVersion: Cardinal;
  end;

  VkExtent2D = record
    width: Cardinal;
    height: Cardinal;
  end;

  VkExtent3D = record
    width: Cardinal;
    height: Cardinal;
    depth: Cardinal;
  end;

  PVkInstanceCreateInfo = ^VkInstanceCreateInfo;
  VkInstanceCreateInfo = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkInstanceCreateFlags;
    pApplicationInfo: PVkApplicationInfo;
    enabledLayerCount: Cardinal;
    ppEnabledLayerNames: PMarshaledAString;
    enabledExtensionCount: Cardinal;
    ppEnabledExtensionNames: PMarshaledAString;
  end;

  PVkPhysicalDeviceBlendOperationAdvancedFeaturesEXT = ^VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT;
  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT = record
    sType: VkStructureType;
    pNext: Pointer;
    advancedBlendCoherentOperations: VkBool32;
  end;

  PVkPhysicalDeviceFeatures = ^VkPhysicalDeviceFeatures;
  VkPhysicalDeviceFeatures = record
    robustBufferAccess: VkBool32;
    fullDrawIndexUint32: VkBool32;
    imageCubeArray: VkBool32;
    independentBlend: VkBool32;
    geometryShader: VkBool32;
    tessellationShader: VkBool32;
    sampleRateShading: VkBool32;
    dualSrcBlend: VkBool32;
    logicOp: VkBool32;
    multiDrawIndirect: VkBool32;
    drawIndirectFirstInstance: VkBool32;
    depthClamp: VkBool32;
    depthBiasClamp: VkBool32;
    fillModeNonSolid: VkBool32;
    depthBounds: VkBool32;
    wideLines: VkBool32;
    largePoints: VkBool32;
    alphaToOne: VkBool32;
    multiViewport: VkBool32;
    samplerAnisotropy: VkBool32;
    textureCompressionETC2: VkBool32;
    textureCompressionASTC_LDR: VkBool32;
    textureCompressionBC: VkBool32;
    occlusionQueryPrecise: VkBool32;
    pipelineStatisticsQuery: VkBool32;
    vertexPipelineStoresAndAtomics: VkBool32;
    fragmentStoresAndAtomics: VkBool32;
    shaderTessellationAndGeometryPointSize: VkBool32;
    shaderImageGatherExtended: VkBool32;
    shaderStorageImageExtendedFormats: VkBool32;
    shaderStorageImageMultisample: VkBool32;
    shaderStorageImageReadWithoutFormat: VkBool32;
    shaderStorageImageWriteWithoutFormat: VkBool32;
    shaderUniformBufferArrayDynamicIndexing: VkBool32;
    shaderSampledImageArrayDynamicIndexing: VkBool32;
    shaderStorageBufferArrayDynamicIndexing: VkBool32;
    shaderStorageImageArrayDynamicIndexing: VkBool32;
    shaderClipDistance: VkBool32;
    shaderCullDistance: VkBool32;
    shaderFloat64: VkBool32;
    shaderInt64: VkBool32;
    shaderInt16: VkBool32;
    shaderResourceResidency: VkBool32;
    shaderResourceMinLod: VkBool32;
    sparseBinding: VkBool32;
    sparseResidencyBuffer: VkBool32;
    sparseResidencyImage2D: VkBool32;
    sparseResidencyImage3D: VkBool32;
    sparseResidency2Samples: VkBool32;
    sparseResidency4Samples: VkBool32;
    sparseResidency8Samples: VkBool32;
    sparseResidency16Samples: VkBool32;
    sparseResidencyAliased: VkBool32;
    variableMultisampleRate: VkBool32;
    inheritedQueries: VkBool32;
  end;

  PVkDeviceCreateInfo = ^VkDeviceCreateInfo;
  VkDeviceCreateInfo = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkDeviceCreateFlags;
    queueCreateInfoCount: Cardinal;
    pQueueCreateInfos: PVkDeviceQueueCreateInfo;
    enabledLayerCount: Cardinal;
    ppEnabledLayerNames: PMarshaledAString;
    enabledExtensionCount: Cardinal;
    ppEnabledExtensionNames: PMarshaledAString;
    pEnabledFeatures: PVkPhysicalDeviceFeatures;
  end;

  PVkPhysicalDeviceFeatures2 = ^VkPhysicalDeviceFeatures2;
  VkPhysicalDeviceFeatures2 = record
    sType: VkStructureType;
    pNext: Pointer;
    features: VkPhysicalDeviceFeatures;
  end;

  VkPhysicalDeviceLimits = record
    maxImageDimension1D: Cardinal;
    maxImageDimension2D: Cardinal;
    maxImageDimension3D: Cardinal;
    maxImageDimensionCube: Cardinal;
    maxImageArrayLayers: Cardinal;
    maxTexelBufferElements: Cardinal;
    maxUniformBufferRange: Cardinal;
    maxStorageBufferRange: Cardinal;
    maxPushConstantsSize: Cardinal;
    maxMemoryAllocationCount: Cardinal;
    maxSamplerAllocationCount: Cardinal;
    bufferImageGranularity: VkDeviceSize;
    sparseAddressSpaceSize: VkDeviceSize;
    maxBoundDescriptorSets: Cardinal;
    maxPerStageDescriptorSamplers: Cardinal;
    maxPerStageDescriptorUniformBuffers: Cardinal;
    maxPerStageDescriptorStorageBuffers: Cardinal;
    maxPerStageDescriptorSampledImages: Cardinal;
    maxPerStageDescriptorStorageImages: Cardinal;
    maxPerStageDescriptorInputAttachments: Cardinal;
    maxPerStageResources: Cardinal;
    maxDescriptorSetSamplers: Cardinal;
    maxDescriptorSetUniformBuffers: Cardinal;
    maxDescriptorSetUniformBuffersDynamic: Cardinal;
    maxDescriptorSetStorageBuffers: Cardinal;
    maxDescriptorSetStorageBuffersDynamic: Cardinal;
    maxDescriptorSetSampledImages: Cardinal;
    maxDescriptorSetStorageImages: Cardinal;
    maxDescriptorSetInputAttachments: Cardinal;
    maxVertexInputAttributes: Cardinal;
    maxVertexInputBindings: Cardinal;
    maxVertexInputAttributeOffset: Cardinal;
    maxVertexInputBindingStride: Cardinal;
    maxVertexOutputComponents: Cardinal;
    maxTessellationGenerationLevel: Cardinal;
    maxTessellationPatchSize: Cardinal;
    maxTessellationControlPerVertexInputComponents: Cardinal;
    maxTessellationControlPerVertexOutputComponents: Cardinal;
    maxTessellationControlPerPatchOutputComponents: Cardinal;
    maxTessellationControlTotalOutputComponents: Cardinal;
    maxTessellationEvaluationInputComponents: Cardinal;
    maxTessellationEvaluationOutputComponents: Cardinal;
    maxGeometryShaderInvocations: Cardinal;
    maxGeometryInputComponents: Cardinal;
    maxGeometryOutputComponents: Cardinal;
    maxGeometryOutputVertices: Cardinal;
    maxGeometryTotalOutputComponents: Cardinal;
    maxFragmentInputComponents: Cardinal;
    maxFragmentOutputAttachments: Cardinal;
    maxFragmentDualSrcAttachments: Cardinal;
    maxFragmentCombinedOutputResources: Cardinal;
    maxComputeSharedMemorySize: Cardinal;
    maxComputeWorkGroupCount:array[0..2] of Cardinal;
    maxComputeWorkGroupInvocations: Cardinal;
    maxComputeWorkGroupSize:array[0..2] of Cardinal;
    subPixelPrecisionBits: Cardinal;
    subTexelPrecisionBits: Cardinal;
    mipmapPrecisionBits: Cardinal;
    maxDrawIndexedIndexValue: Cardinal;
    maxDrawIndirectCount: Cardinal;
    maxSamplerLodBias: Single;
    maxSamplerAnisotropy: Single;
    maxViewports: Cardinal;
    maxViewportDimensions:array[0..1] of Cardinal;
    viewportBoundsRange:array[0..1] of Single;
    viewportSubPixelBits: Cardinal;
    minMemoryMapAlignment: NativeUInt;
    minTexelBufferOffsetAlignment: VkDeviceSize;
    minUniformBufferOffsetAlignment: VkDeviceSize;
    minStorageBufferOffsetAlignment: VkDeviceSize;
    minTexelOffset: Integer;
    maxTexelOffset: Cardinal;
    minTexelGatherOffset: Integer;
    maxTexelGatherOffset: Cardinal;
    minInterpolationOffset: Single;
    maxInterpolationOffset: Single;
    subPixelInterpolationOffsetBits: Cardinal;
    maxFramebufferWidth: Cardinal;
    maxFramebufferHeight: Cardinal;
    maxFramebufferLayers: Cardinal;
    framebufferColorSampleCounts: VkSampleCountFlags;
    framebufferDepthSampleCounts: VkSampleCountFlags;
    framebufferStencilSampleCounts: VkSampleCountFlags;
    framebufferNoAttachmentsSampleCounts: VkSampleCountFlags;
    maxColorAttachments: Cardinal;
    sampledImageColorSampleCounts: VkSampleCountFlags;
    sampledImageIntegerSampleCounts: VkSampleCountFlags;
    sampledImageDepthSampleCounts: VkSampleCountFlags;
    sampledImageStencilSampleCounts: VkSampleCountFlags;
    storageImageSampleCounts: VkSampleCountFlags;
    maxSampleMaskWords: Cardinal;
    timestampComputeAndGraphics: VkBool32;
    timestampPeriod: Single;
    maxClipDistances: Cardinal;
    maxCullDistances: Cardinal;
    maxCombinedClipAndCullDistances: Cardinal;
    discreteQueuePriorities: Cardinal;
    pointSizeRange:array[0..1] of Single;
    lineWidthRange:array[0..1] of Single;
    pointSizeGranularity: Single;
    lineWidthGranularity: Single;
    strictLines: VkBool32;
    standardSampleLocations: VkBool32;
    optimalBufferCopyOffsetAlignment: VkDeviceSize;
    optimalBufferCopyRowPitchAlignment: VkDeviceSize;
    nonCoherentAtomSize: VkDeviceSize;
  end;

  PVkPhysicalDeviceSamplerYcbcrConversionFeatures = ^VkPhysicalDeviceSamplerYcbcrConversionFeatures;
  VkPhysicalDeviceSamplerYcbcrConversionFeatures = record
    sType: VkStructureType;
    pNext: Pointer;
    samplerYcbcrConversion: VkBool32;
  end;

  VkPhysicalDeviceSparseProperties = record
    residencyStandard2DBlockShape: VkBool32;
    residencyStandard2DMultisampleBlockShape: VkBool32;
    residencyStandard3DBlockShape: VkBool32;
    residencyAlignedMipSize: VkBool32;
    residencyNonResidentStrict: VkBool32;
  end;

  PVkPhysicalDeviceProperties = ^VkPhysicalDeviceProperties;
  VkPhysicalDeviceProperties = record
    apiVersion: Cardinal;
    driverVersion: Cardinal;
    vendorID: Cardinal;
    deviceID: Cardinal;
    deviceType: VkPhysicalDeviceType;
    deviceName:array[0..VK_MAX_PHYSICAL_DEVICE_NAME_SIZE-1] of UTF8Char;
    pipelineCacheUUID:array[0..VK_UUID_SIZE-1] of Byte;
    limits: VkPhysicalDeviceLimits;
    sparseProperties: VkPhysicalDeviceSparseProperties;
  end;

  PVkPresentInfoKHR = ^VkPresentInfoKHR;
  VkPresentInfoKHR = record
    sType: VkStructureType;
    pNext: Pointer;
    waitSemaphoreCount: Cardinal;
    pWaitSemaphores: PVkSemaphore;
    swapchainCount: Cardinal;
    pSwapchains: PVkSwapchainKHR;
    pImageIndices: PCardinal;
    pResults: PVkResult;
  end;

  PVkQueueFamilyProperties = ^VkQueueFamilyProperties;
  VkQueueFamilyProperties = record
    queueFlags: VkQueueFlags;
    queueCount: Cardinal;
    timestampValidBits: Cardinal;
    minImageTransferGranularity: VkExtent3D;
  end;

  PVkSemaphoreCreateInfo = ^VkSemaphoreCreateInfo;
  VkSemaphoreCreateInfo = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkSemaphoreCreateFlags;
  end;

  PVkSurfaceCapabilitiesKHR = ^VkSurfaceCapabilitiesKHR;
  VkSurfaceCapabilitiesKHR = record
    minImageCount: Cardinal;
    maxImageCount: Cardinal;
    currentExtent: VkExtent2D;
    minImageExtent: VkExtent2D;
    maxImageExtent: VkExtent2D;
    maxImageArrayLayers: Cardinal;
    supportedTransforms: VkSurfaceTransformFlagsKHR;
    currentTransform: VkSurfaceTransformFlagBitsKHR;
    supportedCompositeAlpha: VkCompositeAlphaFlagsKHR;
    supportedUsageFlags: VkImageUsageFlags;
  end;

  PVkSurfaceFormatKHR = ^VkSurfaceFormatKHR;
  VkSurfaceFormatKHR = record
    format: VkFormat;
    colorSpace: VkColorSpaceKHR;
  end;

  PVkSwapchainCreateInfoKHR = ^VkSwapchainCreateInfoKHR;
  VkSwapchainCreateInfoKHR = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkSwapchainCreateFlagsKHR;
    surface: VkSurfaceKHR;
    minImageCount: Cardinal;
    imageFormat: VkFormat;
    imageColorSpace: VkColorSpaceKHR;
    imageExtent: VkExtent2D;
    imageArrayLayers: Cardinal;
    imageUsage: VkImageUsageFlags;
    imageSharingMode: VkSharingMode;
    queueFamilyIndexCount: Cardinal;
    pQueueFamilyIndices: PCardinal;
    preTransform: VkSurfaceTransformFlagBitsKHR;
    compositeAlpha: VkCompositeAlphaFlagBitsKHR;
    presentMode: VkPresentModeKHR;
    clipped: VkBool32;
    oldSwapchain: VkSwapchainKHR;
  end;

  PFN_vkAcquireNextImageKHR = function (device: VkDevice; swapchain: VkSwapchainKHR; timeout:  UInt64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: PCardinal): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkCreateDevice = function (physicalDevice: VkPhysicalDevice; const pCreateInfo: PVkDeviceCreateInfo; const pAllocator: PVkAllocationCallbacks; pDevice: PVkDevice): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkCreateInstance = function (const pCreateInfo: PVkInstanceCreateInfo; const pAllocator: PVkAllocationCallbacks; pInstance: PVkInstance): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkCreateSemaphore = function (device: VkDevice; const pCreateInfo: PVkSemaphoreCreateInfo; const pAllocator: PVkAllocationCallbacks; pSemaphore: PVkSemaphore): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkCreateSwapchainKHR = function (device: VkDevice; const pCreateInfo: PVkSwapchainCreateInfoKHR; const pAllocator: PVkAllocationCallbacks; pSwapchain: PVkSwapchainKHR): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDestroyDevice = procedure (device: VkDevice; const pAllocator: PVkAllocationCallbacks); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDestroyInstance = procedure (instance: VkInstance; const pAllocator: PVkAllocationCallbacks); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDestroySemaphore = procedure (device: VkDevice; semaphore: VkSemaphore; const pAllocator: PVkAllocationCallbacks); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDestroySurfaceKHR = procedure (instance: VkInstance; surface: VkSurfaceKHR; const pAllocator: PVkAllocationCallbacks); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDestroySwapchainKHR = procedure (device: VkDevice; swapchain: VkSwapchainKHR; const pAllocator: PVkAllocationCallbacks); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkDeviceWaitIdle = function (device: VkDevice): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkEnumerateDeviceExtensionProperties = function (physicalDevice: VkPhysicalDevice; const pLayerName: MarshaledAString; pPropertyCount: PCardinal; pProperties: PVkExtensionProperties): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkEnumerateInstanceExtensionProperties = function (const pLayerName: MarshaledAString; pPropertyCount: PCardinal; pProperties: PVkExtensionProperties): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkEnumerateInstanceVersion = function(pApiVersion: PCardinal): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkEnumeratePhysicalDevices = function (instance: VkInstance; pPhysicalDeviceCount: PCardinal; pPhysicalDevices: PVkPhysicalDevice): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetDeviceProcAddr = function (device: VkDevice; const pName: MarshaledAString): PFN_vkVoidFunction; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetDeviceQueue = procedure(device: VkDevice; queueFamilyIndex: Cardinal; queueIndex: Cardinal; pQueue: PVkQueue); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetInstanceProcAddr = function (instance: VkInstance; const pName: MarshaledAString): PFN_vkVoidFunction; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceFeatures = procedure (physicalDevice: VkPhysicalDevice; pFeatures: PVkPhysicalDeviceFeatures); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceFeatures2 = procedure (physicalDevice: VkPhysicalDevice; pFeatures: PVkPhysicalDeviceFeatures2); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceFeatures2KHR = procedure (physicalDevice: VkPhysicalDevice; pFeatures: PVkPhysicalDeviceFeatures2); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceProperties = procedure (physicalDevice: VkPhysicalDevice; pProperties: PVkPhysicalDeviceProperties); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceQueueFamilyProperties = procedure (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: PCardinal; pQueueFamilyProperties: PVkQueueFamilyProperties); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = function (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: PVkSurfaceCapabilitiesKHR): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = function (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: PCardinal; pSurfaceFormats: PVkSurfaceFormatKHR): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = function (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: PCardinal; pPresentModes: PVkPresentModeKHR): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkGetSwapchainImagesKHR = function (device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: PCardinal; pSwapchainImages: PVkImage): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkQueuePresentKHR = function (queue: VkQueue; const pPresentInfo: PVkPresentInfoKHR): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  PFN_vkQueueWaitIdle = function (queue: VkQueue): VkResult; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

function VK_MAKE_VERSION(const major, minor, patch: Cardinal): Cardinal; inline;

implementation

function VK_MAKE_VERSION(const major, minor, patch: Cardinal): Cardinal;
begin
  Result:= (major shl 22) or (minor shl 12) or (patch shl 0);
end;

end.
