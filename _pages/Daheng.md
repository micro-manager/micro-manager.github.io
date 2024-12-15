---
title: Daheng
layout: page
---

| Summary | Control of Daheng cameras |
| Author | Daheng, Nico Stuurman
| License | Freeware |
| Platforms | Windows (64-bit), Linux (64-bit) |
| Devices | Daheng cameras supported by Daheng SDK|

## Allied Vision Camera Adapter
Download and install the [Daheng SDK](https://va-imaging.com/pages/customerdownloads)

Unpack the zip and execute the .exe inside.

When asked which drivers to install, please select the necessary ones. If you are unsure, select all of them. You can also install or uninstall these drivers later on.

The utility programs Galaxy Viewer or the GigE IP Configurator in the Galaxy Devices folder in the windows start menu. Use the Galaxy Viewer to test that your camera is working correctly.

Note that you do not need to download the Micro-Manager dll from the Daheng website.  The DahengGalaxy device adapter is included in recent Micro-Manager nightly builds. 

In the Micro-Manager Hardware Configuration Wizard, select `DahengGalaxy`.  If your camera is connected and recognized by the Daheng software, it will appear in the list.  The serial number of the Daheng camera is used to recognize the specific camera.

Tested models: MER-160-227U3M, 



