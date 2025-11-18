---
title: IDSPeak
description: Device adapter for IDS Peak cameras
layout: page
---

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Controls [IDS](http://en.ids-imaging.com/) Peak cameras

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

[Lars Kool](https://github.com/Lars-Kool) ([email](lars.kool@espci.fr))

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

BSD

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Windows (compatibility with Linux untested)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

IDS Peak USB cameras (should work with ethernet cameras as well).

</td>
</tr>
<tr>
<td markdown="1">

**Adapter Version:**

</td>
<td markdown="1">

2.0.1

</td>
</tr>
<tr>
<td markdown="1">

**Available Since Version:**

</td>
<td markdown="1">

2.0.3 (Dec 11th 2023)

</td>
</tr>

<tr>
<td markdown="1">

**Latest revision**

</td>
<td markdown="1">

17/11/2025

</td>
</tr>

</table>

Requires IDS peak drivers (version 2.17 or higher), which can be
downloaded from the [IDS site](https://en.ids-imaging.com/ids-peak.html).

### Supported features

-   Monochrome and color cameras. The available modes/bit depths can be
    selected in the properties browser ("Pixel Type"), available aquisition
    modes can be selected in the properties browser ("PixelFormat").
-   Gain.
-   Auto white-balance.
-   Binning.
-   ROI.
-   Multi-camera support.
-   Hardware and Software Trigger.

If something doesn't work as expected, please have a read through this document.
If it doesn't provide a solution (or give a reason why it behaves like this), you can let me know on the [image.sc forum](forum.image.sc).
In case of a bug, I will try my best to resolve the problem as soon as possible.
If there is a feature that you want to use, but is not yet included, you can also let me know on the [image.sc forum](forum.image.sc).
I can make no guarantee that additional features will be included in a timely manner (or at all), but I will most certainly have a look.

### Notes
-   For multi-camera setups, one can load multiple cameras cameras from the Hardware configuration wizard.
The settings of each camera can be changed separately.
To record simultaneously with IDS cameras, one should also load the "Utilities->Multi camera" Device Adapter.
The "Multi Camera" device adapter should be listed as the default camera.
After finishing the "Hardware configuration wizard".
One should go to the "Device Property Browser" and under "Multi Camera - Physical Camera X" select the desired cameras.

## FAQ
- **The maximumm framerate is (much) lower than advertized, and can be achieved with IDS Peak Cockpit.**
  - Make sure you are in the latest nightly build.
  Starting mid November 2025, the IDS device adapter got a major update, which should allow Micro-Manager to reach the advertised full-frame speed.
  We've tested the full-frame captue at 250 fps using a U3-3040CP-C-HQ without problem.
  Upon reducing the ROI height, we managed to go up to 1000 fps without frameloss.
  Try to use PixelFormat Mono8 for 8bit grayscale, Mono10/Mono12 for 16bit grayscale, and BGRA8 for 8bit RGB images.
- **When acquiring 10 or 12bit grayscale images, the images cover the entire 16bit range.**
  - The IDS image processing library seems to stretch 10/12 bit images when converting images to 16bit.
  You can, however, divide the images by 64 or 16 to convert them back to 10 or 12 bit, respectively.
  We're currently looking into a way to fix this that doesn't impact the framerate.
- **I cannot snap images using a trigger.**
  - Indeed, the "Snap Image" function will take an image, whether or not the trigger is set. This is intentional, as the internal workings of Micro-Manager's "Snap Image" is incompatible with triggers. See the "Instructions on trigger usage" section of this page for details on how to use the trigger functionality.
- **When I crop images by selecting a region to crop, the crop doesn't exactly match the region selected.**
  - Depending on the IDS camera model (and sensor model) the granularity of the crop function will differ.
  We've seen cameras that only allow image width increments of 24 pixels, whereas others limit the width to increments of only 1 or 2 pixels.
  Make sure to verify the camera specifications on the IDS website.
- **While using the MDA, if the interval is slightly different from the exposure time (e.g. x2), Micro-Manager limits the framerate to ~10 fps.**
  - Micro-Manager assumes that cameras have two modes of operation: single image acquisition, continuous acquisition.
  Where the continous acquisition acquires images as fast as possible (i.e. the framerate is 1/exposure time).
  Whenever the interval is larger than the exposure time, Micro-Manager performs a series of single image acquisitions.
  However, this comes at a performance cost, as for each acquisition, the camera has to prepare the acquisition buffers, start the image acquisition, stop the acquistion, and free the acquisition buffers.
  While these operations are quite fast, they limit the framerate to ~10 fps.
  Whenever, the exposure time is equal or less than the exposure time, Micro-Manager performs a continuous acquisition.
  This means that if your exposure time is 20 ms, there is a frame rate gap between 10 and 50 fps.
  However, there is a workaround for IDS cameras. See "Instructions on MDA framerate" for more information.
- **Can I use multiple IDS cameras at once?**
  - Most certainly! For multi-camera setups, one can load multiple cameras cameras from the Hardware configuration wizard.
  The settings of each camera can be changed separately.
  To record simultaneously with IDS cameras, one should also load the "Utilities->Multi camera" Device Adapter.
  The "Multi Camera" device adapter should be listed as the default camera.
  After finishing the "Hardware configuration wizard".
  One should go to the "Device Property Browser" and under "Multi Camera - Physical Camera X" select the desired cameras.

## Instructions on using triggers
Currently, Micro-Manager supports triggers in a limited capacity.
The main limitation is that it does not work with the "Snap Image" functionality, as Micro-Manager expects an image to be delivered immediately, and the trigger delay causes Micro-Manager to hang until the camera actually receives the trigger and takes the image.
Instead, the MDA needs to be used to acquire the images.
There are two caveats:
  1. You need to take at least 2 images. If you take only 1 image, Micro-Manager uses the same "Snap Image" functionality, which is incompatible with triggers.
  2. The interval needs to be less than the exposure time.
  If the interval between the images is more than the exposure time, Micro-Manager splits the MDA into multiple "Snap Image" calls, which are incompatible with triggers.
  We recommend you set the interval to something small (e.g. 1ms), as this value is **not** used by the device adapter to set the interval between the images.
  Instead, you need to set MDA framerate property to the desired frame rate (see section "Instructions on MDA framerate").

  Furthermore, not all IDS cameras support all trigger actions.
  Certain cameras only support the readout of a single frame per trigger, whereas others also support the start of an acquisition, and/or a trigger controlled exposure.
  There is no indication which actions are supported on the IDS website or the camera spec-sheet.
  Micro-Manager requests all available modes, so if it is not in the list, it is very likely not supported by the camera.
  If other actions are available in the IDS Peak Cockpit software, please let us know.
  There are several potential trigger sources (depending on the camera model).
  The "Software" trigger source can be used by setting "Trigger activation" to "1".
  As for external triggers, this is highly dependend on the camera model.
  Typically, the external trigger is "Line0", but other modes are available as well.
  Please refer to the IDS spec-sheet of the camera model to find which source corresponds to what.

  ## Instuctions on MDA framerate
  By default, Micro-Manager has no way to control the framerate.
  It either acquires images one-by-one (upto a framerate of ~10 fps), or as fast as possible (at 1/exposure time).
  Depending on whether the MDA interval is more, or less than the exposure time.
  However, there a workaround for IDS cameras.
  You can use the "MDA framerate" property to set the desired framerate.
  Whenever, the MDA interval is equal or less than the exposure time, the IDS device adapter completely ignores the interval and uses the MDA framerate to set the framerate. Allowing you to control the framerate very precisely.