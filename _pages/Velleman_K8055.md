---
autogenerated: true
title: Velleman K8055
redirect_from:
  - /wiki/Velleman_K8055
  - /wiki/K8055
layout: page
---

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Velleman K8055 digital IO board adapter

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Nico Stuurman.

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

LGPL

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Mac/Linux, Windows

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

[Velleman
K8055/VM110](http://www.velleman.be/ot/en/product/view/?id=351346)

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">

[MMConfig_K8055.cfg](/media/files/MMConfig_K8055.cfg)

</td>
</tr>
</table>

The Velleman K8055 (VM110 for a pre-assembled board) is a low cost
digital IO board. It provides 8 digital out and 2 analogue out channels
(as well as analogue and digital in - which are not used here) that can
be used for things like TTLs or AOTF control. A drawback of this board
is its relatively slow switching time (\~10 ms).

The adapter uses a modified version of libk8055 (by Sven Lindberg and
others) and libusb. The adapter provides a switch, a shutter, and 2 DAC
outputs. Each of the 2 DACs can be set to a voltage between 0 and 5.0 V.
The switch determines which of the 8 output channels will be active. The
switch is a single byte, each bit in this byte sets the corresponding
channel (for instance, the value '3' will set channels 1 and 2). The
shutter will switch the active channels on and off.

{% include notice icon="info" content="To use the digital outs, one needs to provide input voltage (5-30V) to the Clamp and Grnd pins on the K8055 board." %}

On Mac OS X you will need to download and unpack
[K8055-utbm-osx-kext.tar.gz](/media/files/K8055-utbm-osx-kext.tar.gz),
open a terminal, cd into the directory k8055-utbm-osx-kext, issue the
commands below, and reboot:

    sudo cp -r k8055.kext /System/Library/Extensions/k8055.kext
    sudo touch /System/Library

On Windows you will need to 'replace' the HID driver with the driver
provided in this [K8055
Driver](http://valelab.ucsf.edu/~MM/drivers/K8055.zip) folder. To find
out which device is the K8055, open the Device Manager, open the tab
"Human Interface Devices" and plug in the K8055. Two devices should
appear, one named "HID-compliant device", the other called "USB Human
Interface Device".

![](/media/DeviceManager.png)

Double click on the "USB Human Interface Device", select the "Driver"
tab and click on "Update Driver". (On Windows 7 we found that we needed
to instead right click on the top node and select "Add legacy hardware"
and then proceed as follows.) On the first page of the Hardware
Configuration Wizard, do not let Windows connect to Windows Update. On
the next page, select "Install from a list or sepcific
location(Advanced)".

![](/media/HardwareUpdate2.png)

On the next page, select "Don't search. I will choose the driver to
install".

![](/media/HardwareUpdate3.png)

Click on the "Have Disk" button.

![](/media/HwarderUpdate4.png)

Click "Browse" and go to the directory which contains the downloaded
K8055 Driver (link above) files. Select the file "K8055\_libusb.inf".

![](/media/K8055-instruct1.jpg)

This should install the appropriate driver. After finalizing the wizard,
your Device Manager should look as follows:

![](/media/DeviceManagerFinal.png)

--[Nico](/users/Nico) 18:21, 15 December 2007 (PST)

