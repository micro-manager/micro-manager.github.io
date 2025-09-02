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

1. Download and install the [PlayerOne Camera
   Driver](https://player-one-astronomy.com/service/software/).

   Unpack the zip file and execute the .exe inside.

   Connect the power adpater to the camera and the USB 3.0 to the computer.

   The camera appears under "Imaging Devices" in the Windows Device Manager.

2. Download the PlayerOne Camera SDK and Filter Wheel SDK, also from the
   [PlayerOne Software](https://player-one-astronomy.com/service/software/)
   page.

   Unpack each, and copy the files `PlayerOneCamera.dll` and `PlayerOnePW.dll`
   to the Micro-Manager directory (usually `C:\Program
   Files\Micro-Manager-2.0`). The files are in the `lib\x64` folders within
   each of the packages.

   Note that you need both DLLs even if you are only going to use one or the
   other device.

3. In the Micro-Manager Hardware Configuration Wizard, select `PlayerOne`. If
   PlayerOne is listed as unavailable, it is likely that the dll files listed
   above are missing or that the camera is not connected.

{% include notice icon="info" content="Since the Micro-Manager nightly build of
**2025-09-02**, the camera's serial number will be displayed in the Hardware
Configuration Wizard. **If you have an older configuration file, you will need
to redo the configuration.**" %}


### Configuration

It will be useful to add the following properties to the System-Startup group: "PixelType" (RAW16 for monochrome cameras), "Gain" (125 enables low read noise on the tested model), "Offset" (depends on gain settings). Check the documentation of your camera to figure out the relation between gain, read-out noise and full well capacity.

You may also want to make a preset group with the property "Cooler".  You only need to cool the camera when you are using longer exposure times and notive "hot" pixels. If you always use long exposure times, switch on the cooler in the System-Startup group.

### Tested Models

- [Ares-M Pro](https://player-one-astronomy.com/product/ares-m-pro-usb3-0-mono-camera-imx533/), tested 2025-03-26
- [Uranus-M Pro](https://player-one-astronomy.com/product/uranus-m-pro-usb3-0-mono-cooled-camera-imx585/)
- [Uranus-C Pro](https://player-one-astronomy.com/product/uranus-c-pro-usb3-0-color-camera-imx585/)

### Speed data

PlayerOne ARES-M Pro speeds (RAW16, 0 ms exposure), ran live mode in MM and recorded fps shown in display

| Full frame | 25fps |
| 3008 x 1502 | 44fps |
| 3008 x 1000 | 64 fps |
| 3008 x 500 | 117fps |
| 3008 x 250 | 214 fps |
| 3008 x 250, 5 ms exposures |  206 fps |
