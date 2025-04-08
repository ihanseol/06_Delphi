{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.Vulkan;

interface

uses System.Vulkan, Androidapi.NativeWindow;

const
  VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR = 1000008000;

type
  VkAndroidSurfaceCreateFlagsKHR = VkFlags;

  PVkAndroidSurfaceCreateInfoKHR = ^VkAndroidSurfaceCreateInfoKHR;
  VkAndroidSurfaceCreateInfoKHR = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkAndroidSurfaceCreateFlagsKHR;
    window: PANativeWindow;
  end;

  PFN_vkCreateAndroidSurfaceKHR = function (instance: VkInstance; const pCreateInfo: PVkAndroidSurfaceCreateInfoKHR; const pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): VkResult; cdecl;

implementation

end.
