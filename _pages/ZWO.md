---
title: ZWO
layout: page
---

| Summary | Control [ZWO](https://www.zwoastro.com/) cameras and filter wheels |
| License | BSD |
| Platforms | Windows |
| Devices | ZWO ASI cameras and EFW filter wheels |

---

## Installation

1. From the [For Developers](https://www.zwoastro.com/downloads/developers)
   download page of the ZWO website, download the "ASI Camera SDK" and "EFW
   SDK". You need both even if you only have one of the devices.
2. Find the file `ASICamera2.dll` in the ASI Camera SDK. It is located at `ASI
   SDK/lib/x64` within the nested Zip file
   `ASI_Camera_SDK/ASI_Windows_SDK_Vx.xx.zip`. Copy this DLL to the
   Micro-Manager folder.
3. Find the file `EFW_filter.dll` in the EFW SDK. It is located at `EFW
   SDK/lib/Win64` within the nested Zip file
   `EFW_SDK/EFW_Windows_SDK_Vx.xx.zip`. Copy this DLL to the Micro-Manager
   folder.
4. From the [Windows](https://www.zwoastro.com/downloads/windows) downloads
   page of the ZWO website, download "Camera Driver" and install.

