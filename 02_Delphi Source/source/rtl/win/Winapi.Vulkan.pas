{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2023-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Vulkan;

{$ALIGN ON}
{$WEAKPACKAGEUNIT}

interface

uses System.Vulkan, Winapi.Windows;

const
  VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = 1000009000;

type
  VkWin32SurfaceCreateFlagsKHR = VkFlags;

  PVkWin32SurfaceCreateInfoKHR = ^VkWin32SurfaceCreateInfoKHR;
  VkWin32SurfaceCreateInfoKHR = record
    sType: VkStructureType;
    pNext: Pointer;
    flags: VkWin32SurfaceCreateFlagsKHR;
    hinstance: HINST;
    hwnd: HWND;
  end;

  PFN_vkCreateWin32SurfaceKHR = function (instance: VkInstance; const pCreateInfo: PVkWin32SurfaceCreateInfoKHR;const pAllocator: PVkAllocationCallbacks;pSurface: PVkSurfaceKHR): VkResult; stdcall;

  PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR = function (physicalDevice: VkPhysicalDevice; queueFamilyIndex: Cardinal): VkBool32; stdcall;

implementation

end.
