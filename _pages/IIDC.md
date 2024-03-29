---
autogenerated: true
title: IIDC
redirect_from: /wiki/IIDC
layout: page
---

# IIDC Device Adapter

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Interfaces to Firewire (and some USB) cameras that implement the IIDC
1394-based Digital Camera Specification

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Mark Tsuchida

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

BSD (uses LGPL libraries)

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Windows, Mac OS X, Linux

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Firewire cameras (and, on Linux, possibly, some USB cameras) that
implement the [IIDC 1394-based Digital Camera
Specification](http://damien.douxchamps.net/ieee1394/libdc1394/iidc_specifications.php),
version 1.x

</td>
</tr>
<tr>
<td markdown="1">

**Since Version:**

</td>
<td markdown="1">

1.4.17

</td>
</tr>
</table>

This is a new device adapter intended to eventually replace the
[dc1394](dc1394) device adapter.

## How to configure

On Windows, you will first need to install the [CMU 1394Camera
package](http://www.cs.cmu.edu/~iwan/1394/), version 6.4.6. No driver
installation is needed on OS X.

The IIDCCamera device has a number of settings that need to be
configured correctly.

**Camera ID (optional)** - You can leave this blank; the first available
camera will be used. See below for details.

**IEEE 1394 mode** - If both your camera and IEEE 1394 interface card
support 1394B (sometimes informally referred to as Firewire 800), choose
1394B. Otherwise, choose 1394A.

**Transmission Speed** - Usually, just choose 800 Mbps if using 1394B,
400 Mbps otherwise. 800 Mbps does not work on Windows.

**Shutter units (us/unit)** and **Shutter offset (us)** - You can
initially leave these at the default values, but see below.

**Gain units** - "Auto-detect" will work with most cameras, but see
below.

After saving the configuration, see if the camera works. If it doesn't,
you might want to experiment with the **IEEE 1394 mode** (try 1394A) and
**Transmission Speed** (try 400 rather than 800) settings.

Once the camera is working, you can follow the next steps to correctly
set it up.

### Getting the correct exposure time units

Some IIDC cameras know how to set the exposure (integration time) in
physical units (seconds). Others don't. If your camera does not support
physical units (called "absolute units" in the IIDC specification),
there is no way to *automatically* determine the correspondence between
the units used by the camera and the actual time interval.

Open the Device Property Browser, and look for the read-only property
**Camera supports integration time in physical units**. If it says
**Yes**, everything is okay. If it says **No**, read on.

With cameras that do not support physical units, the exposure time is
controlled with an integer *X* ranging from 0 to 4095 (or some subrange
thereof). You will need to know two numbers, *A* and *B*, such that the
actual interval T (in microseconds) can be expressed by this formula:

```
 T = A * X + B
```

The values for A and B depend on the camera model (often even among
cameras from the same vendor). Usually, the camera's manual will tell
you what the values for *A* and *B* are, or how to compute them. In IIDC
1.x terminology, exposure/integration time is called the "Shutter"
feature, so you may want to search for terms like "manual shutter".

{% include notice icon="info" content="With some cameras, the value of ''A'' depends on the image width. This is not yet supported by the IIDC device adapter." %}

Once you know the values for A and B, go back to the Hardware
Configuration Wizard, edit the IIDCCamera device, and set the values for
**Shutter units (us/unit)** (= *A*) and **Shutter offset (us)** (= *B*).

### Getting the Gain property to work

In the Device Property Browser, you will see a **Gain (AU)** or **Gain
(dB)** property, if your camera supports setting the pre-amp gain. Which
units you'll get will depend on whether the camera knows about dB units.

However, there are some cameras that indicate they support dB units but
actually only allow reading out values in dB (the gain needs to be set
using the camera's arbitrary units). If this is the case with your
camera, you may notice that the **Gain (dB)** slider will not work
properly. In that case, go back to the Hardware Configuration Wizard and
set **Gain units** to **AU with dB readout**. This should allow you to
set the gain in arbitrary units but view the value in dB units.

(This was necessary with an AVT F-031B.))

### Specifying camera identity (for multiple cameras)

The default setting will find the first available camera on the system.
If you have multiple cameras, you may want to ensure that the same
individual camera is always tied to the same named Micro-Manager device.
This can be done by setting the **Camera ID (optional)** setting in the
Hardware Configuration Wizard.

To find the correct ID for your camera, first configure with a single
camera connected to your computer with a blank Camera ID. Then, open the
Device Property Browser, and write down the **Camera ID**.

### Getting correct 16-bit samples with depth less than 16 bits

Some cameras provide pixel depth greater than 8 bits but less than 16
bits (e.g. 10, 12, or 14 bits). Let's say your camera has a 12-bit AD
converter (but what follows applies to any actual bit depth). When set
to 16-bit mode (Mono16), your camera will yield 12-bit images in 16-bit
format. However there are two ways in which a camera can do so, and the
behavior is vendor-dependent (and cannot be auto-detected).

Some 12-bit cameras will return pixels with intensity values ranging
from 0 to 4095. These cameras work correctly with Micro-Manager without
further configuration.

Other 12-bit cameras will return pixels scaled to the full 16-bit range
(0 to 65535). You will be able to see this by examining an image snapped
in a Mono16 video mode, with an object in the image bright enough to
saturate (or nearly saturate) the intensity range. The histogram will
show that there are samples that exceed the expected maximum (4095) for
the camera bit depth (12), and mousing over the image will show (in the
ImageJ status bar) that every pixel has an intensity value that is a
multiple of 16 (2 raised to the power of (16 - 12)). (In some cases, the
intensity will be constant modulo 16.)

In this case, you can turn on the **Right-shift 16-bit samples**
property in the Device Property Browser (you may want to put this in
your System - Startup preset). This will convert the image so that the
pixels range from 0 to 4095. The setting has no effect in 8-bit video
modes or (importantly) if the camera either says that it acquires at
full 16-bit depth or fails to report its bit depth.

### Working around issues at high frame rates in Format\_7

See below, under "IIDC video modes", for an explanation of Format\_7.

There are cases where particular Format\_7 video modes yield corrupted
images (e.g. only part of the iamge is visible). This can sometimes be
prevented with the **Limit Format\_7 packet size** property. The default
(0) should be fine in most cases. If you see corrupted images for
specific Format 7 video modes, you can try setting this property to a
different value. Doing so will slightly decrease the maximum attainable
framerate, but can prevent image corruption in certain cases.

You may want to put this setting in a configuration group together with
the **Video mode** so that it can be automatically applied when
necessary.

(The issue was seen on OpenSUSE 12.3, but not on Windows 7 (CMU driver)
with the same computer and camera. It may however depend on the camera
and IEEE 1394 interface card as well.)

### Preventing timeouts

The **Timeout (ms)** property specifies how long to wait for a captured
frame to arrive before giving up. For a sequence acquisition, it only
applies to the first frame.

It might be necessary to increase this value for very long exposures or
externally triggered acquisition (not supported yet).

(Note that Micro-Manager itself gives up after some set time if images
don't arrive; that timeout is distinct from the internal timeout of the
IIDC device adapter.)

## IIDC video modes

The **Video mode** property switches between different frame sizes and
pixel types. The available modes depend on the camera model. Only modes
currently supported by the device adapter are listed. IIDC 1.x has the
concept of "Format" and "Mode", and each Format has a number of Modes.
The bracketed code in front of the value indicates the format and mode
(e.g. `[f0-m5]` is Format 0, Mode 5).

Formats 0-2 are the conventional modes with fixed, standard frame sizes.
Format 7 allows camera-specific frame sizes as well as subregions (ROIs;
not yet supported by this device adapter). Many camera vendors assign
the different Format 7 Modes to different vertical and horizontal
binning factors or subsampling factors. You will need to read the camera
manual to know what each Mode does.

In most microscopy applications, you will probably want to use one of
the Format 7 modes (if available).

Switching the video mode while a sequence acquisition (including Live
view) is running is not recommended (it may hang Micro-Manager; we may
disable this entirely in the future).

## Troubleshooting tips (Windows-specific)

If Micro-Manager cannot find your camera, first make sure that Windows
is recognizing it. Open the Device Manager, and see if your camera is
displayed under Imaging devices. It should say "CMU 1394 Digital Camera
Device". If you see something else, you might have a different driver
(for example from the camera vendor) assigned to it. You will need to
uninstall the existing driver or assign the correct driver.

To change the driver assigned to a device (assuming the necessary driver
is already installed where Windows can find it), right-click the device
and choose "Update Driver Software...", then "Browse my computer", then
"Let me pick from a list".

If you do not see your camera device at all, it might be that the IEEE
1394 bus host controller driver is not compatible with your camera or
interface card. Try assigning a different driver to the device whose
name ends in "1394 OHCI Compliant Host Controller". Among the Microsoft
drivers, the "Legacy" one often works better than the non-legacy one.
Most Firewire interface cards (and even some Firewire devices) also come
with vendor-provided drivers.

If Micro-Manager crashes or you have to force-quit Micro-Manager, you
may have trouble getting the camera to work again until you restart your
computer. *Sometimes*, you can avoid a reboot by instead reloading the
driver. To do so, open the Windows Device Manager, find your camera
(under Imaging devices), right-click, and select Disable. Then
right-click again and select Enable.

{% include Listserv_Search text="IIDC" %}

