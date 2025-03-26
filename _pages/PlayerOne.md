---
title: PlayerOne
layout: page
---

| Summary | Control of PlayerOne cameras |
| Author | PlayerOne
| License | BSD |
| Platforms | Windows (64-bit), the SDK supports Linux and MacOS|
| Devices | PlayerOne cameras supported by PlayerOne Camera SDK|

## PlayerOne Camera Adapter


### Installation

Download and install the [PlayerOne Camera Driver](https://player-one-astronomy.com/service/software/).

Unpack the zip file and execute the .exe inside.

Connect the power adpater to the camera and the USB 3.0 to the computer.

The camera appears under "Imaging Devices" in the Windows Device Manager.

Copy the files [PlayerOneCamera.dll](https://svn.micro-manager.org/3rdpartypublic/PlayerOne/CameraSDK/lib/Win/x64/PlayerOneCamera.dll) and [PlayerOnePW.dll](https://svn.micro-manager.org/3rdpartypublic/PlayerOne/FilterWheelSDK/lib/Win/x64/PlayerOnePW.dll) to the Micro-Manager directory (usually C:\Program Files\Micro-Manager-2.0).  You can either download these files from the Micro-Manager svn repository using the links above, or you can install the Camera SDK and Filter Wheel SDK downloaded from the PlayerOne software site](https://player-one-astronomy.com/service/software/) and locate these files in the SDK installation.

In the Micro-Manager Hardware Configuration Wizard, select `PlayerOne`.  If PlayerOne is listed as unavailable, it is likely that the dll files listed above are missing or that the camera is not connected. 


### Configuration

It will be useful to add the following properties to the System-Startup group: "PixelType" (RAW16 for monochrome cameras), "Gain" (125 enables low read noise on the tested model), "Offset" (depends on gain settings). Check the documentation of your camera to figure out the relation between gain, read-out noise and full well capacity.

You may also want to make a preset group with the property "Cooler".  You only need to cool the camera when you are using longer exposure times and notive "hot" pixels. If you always use long exposure times, switch on the cooler in the System-Startup group.

### Tested Models

[ARES-M Pro](https://player-one-astronomy.com/product/ares-m-pro-usb3-0-mono-camera-imx533/), tested 2025-03-26



