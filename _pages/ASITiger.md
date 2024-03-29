---
autogenerated: true
title: ASITiger
redirect_from: /wiki/ASITiger
layout: page
---

## ASI Tiger

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

For TG-1000 "Tiger" controller hub, providing access to various
supported cards

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Jon Daniels (jon at asiimaging.com)

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

All platforms (uses serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

XYStage, ZStage (motorized linear stage), Piezo, FWheel (FW-1000
filterwheel), FSlider (filter slider), Turret, Scanner (MEMS
micro-mirror), Port Switch, PLogic (digital I/O), LED, PMT, tunable lens
(Optotune)

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">

None

</td>
</tr>
</table>

For "Tiger" or TG-1000 controller from ASI [(manufacturer
page](http://www.asiimaging.com/index.php/products/controllers/tiger-controller/)).
Controller has various cards that can be added as needed for any
particular configuration, so the device adapter is a hub with peripheral
devices.

NB: there is a separate device adapter, [ASIStage](ASIStage),
for stand-alone MS-2000 controllers or older rack-mount controllers.

Serial port settings are 115200 baud, no parity, 1 stop bit, no
handshaking (for both RS-232 and USB).

If you run into problems please contact the author at the address above.
This device adapter is actively supported by the manufacturer.

For TG-1000 systems the build-in USB connection is actually a USB to
serial converter. You can find drivers for Windows, Mac OS X, and Linux
at the [Silicon labs
website](http://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx).
This is the same as used for recent ASI 'WK' or 'Whizkid' controllers.

## TigerCommHub

Property Notes

-   SerialCommand: By default the command is sent only sent when a
    change is made; to resend same command you can add a space; change
    the property "OnlySendSerialCommandOnChange" property to "No" to
    change this behavior. This is due to the behavior of Micro-manager
    often refreshing the property values which can cause the command to
    be sent multiple times.

## Z Stages (piezo or motorized)

The Z stage can be set up to receive trigger signals from many cameras
(see documentation on Micro-Manager's
[Hardware-based\_synchronization](Hardware-based_Synchronization_in_Micro-Manager)
feature). A BNC cable is connected from the camera's TTL output to the
controller's trigger input on the corresponding card's front panel of
the Tiger controller. By synchronizing Z slices with camera exposures,
you can acquire very fast Z stacks. Most ASI firmware includes the
required ring buffer module with 50 positions; if you want to acquire Z
stacks with more slices or do not have ring buffer support, please
[contact ASI directly](http://www.asiimaging.com/contact-us/) for a
firmware update. To use this feature, set the property "UseSequence" to
value "Yes" under device "ZStage" in the Property Browser.

There is a further feature designed for collecting sequential Z-stacks
with minimal delay by eliminating serial communication between Z-stacks
and relying completely on TTL. This is the "UseFastSequence" property.
To use, first set the property value set to "No" (but "UseSequence" must
be set to "Yes") and run a Z-stack, or if you are scripting you need to
invoke SendStageSequence(). This forces Micro-Manager to compute the
ring buffer positions and send them to the controller. Then set the
property value to "Armed" and perform desired acquisitions. Afterwards
be sure to set the value back to "No" because the controller will not
interact with Micro-Manager normally when set to "Armed" (sequence
operations are short-circuited as is the widely-used API function
Busy()).

## Known limitations

-   CRISP supported was added 25-Sep-2013. Use requires both a
    Micro-manager build and card firmware after that date.
-   LED illuminator support was added 20-May-2014. Use requires both a
    Micro-manager build and card firmware after that date.
-   TTL-triggered piezo (and Z stage) sequences are supported as of
    2020-May-20 nightly build of Micro-Manager.

## Support

Contact the author at <jon_remove@asiimaging.com> (remove the last part
of the email address).

