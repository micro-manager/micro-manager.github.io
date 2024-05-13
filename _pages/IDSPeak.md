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

[Lars Kool](https://github.com/Lars-Kool)

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

1.1

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
</table>

Requires IDS peak drivers (version 2.0.0 or higher), which can be
downloaded from the [IDS site](https://en.ids-imaging.com/ids-peak.html).

### Supported features

-   Monochrome and color cameras. The available modes/bit depths can be
    selected in the properties browser ("Pixel Type").
-   Gain.
-   Auto white-balance.
-   Binning.
-   ROI.
-   Multi-camera support.

### Notes

-   For color, currently only the modes "BGRA8" is supported.
-   Only 8-bit color depth is supported.
-   Gamma correction is deactivated.
-   For multi-camera setups, one can load multiple cameras cameras from
    the Hardware configuration wizard. The settings of each camera can
    be changed separately. To record simultaneously with IDS cameras,
    one should also load the "Utilities->Multi camera" Device Adapter.
    The "Multi Camera" device adapter should be listed as the default
    camera. After finishing the "Hardware configuration wizard". One
    should go to the "Device Property Browser" and under
    "Multi Camera - Physical Camera X" select the desired cameras.

### Known limitations

-   **The maximum framerate of the 32bit RBGA pixel format is much lower
    than advertized or with IDS Peak Cockpit.**
    -   This is indeed true, the problem is that the camera doesn't support
        recording BGRA8, which is the only accepted color format of
        Micro-Manager. Hence, the image has to be recorded in a different
        pixel format (in this case Bayer RG8) and then converted to BGRA8 on
        the fly. The maximum obtainable framerate then depends heavily on the
        (single core) processing speed of your PC. A potential solution is to
        not do the conversion (just pass the raw bayer data) and perform the
        debayering after all data is collected. However his methods is not yet
        implemented.

-   **The minimum interval during the Multi-Dimensional Acquisition (MDA) is
    approximately 200 ms, even at low exposure times (e.g. 10 ms).**
    -   This is a limitation of how MDA events are processed. When the interval
        is set to less than the exposure time, it will record at the maximum
        framerate possible ~1/exposureTime. Otherwise it will perform something
        like a timelapse, where it will start the process of acquiring an image
        after the interval has passed. Sadly the second process has a lot of
        overhead, which leads to a maximum framerate of ~5 fps. We're currently
        thinking of ways to fix this.
        
-   **When MM is open, I can't open any IDS camera in another software (e.g. IDS Peak Cockpit)**
    -   Currently, when MM is started, it opens all cameras and keeps them open
        untill MM is closed. This allows quicker switching between cameras. But
        this means that none of the other softwares can communicate with any of
        the connected IDS cameras (even when they are seemingly not in use by MM).
