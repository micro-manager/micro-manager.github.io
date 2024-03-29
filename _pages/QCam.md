---
autogenerated: true
title: QCam
redirect_from: /wiki/QCam
layout: page
---

## QImaging camera adapter

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Controls [http://www.qimaging.com/
QImaging](http://www.qimaging.com/_QImaging) camera

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Matt Austin (QImaging), Jeff Kuhn (Virginia Tech)

</td>
</tr>
<tr>
<td markdown="1">

**Maintainers:**

</td>
<td markdown="1">

Pat Webster (QImaging), Jeff Kuhn, Arthur Edelstein

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

Windows and Mac OS X

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

All monochrome QImaging cameras

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">

[MMConfig_QCam.cfg](/media/files/MMConfig_QCam.cfg)

</td>
</tr>
</table>

This adapter was contributed by Matt Austin from QImaging. It should
work with all monochrome QImaging cameras. We tested it with a Retiga
4000R on both Windows and Mac and a Retiga EXi on a Mac.

To use this adapter, you must first install the QCam driver for
([Windows](http://www.qimaging.com/support/downloads/index.php) or [Mac
OSX](http://www.qimaging.com/support/downloads/legacy_qcamdriver.php)).
As of Micro-Manager version 1.3.47, you should use the QCam driver
version 2.0.9 or higher (older Micro-Manager version work with QCam
driver 2.0.4 or higher). Use the example config file (or use the
hardware config wizard to make one yourself) to get the camera to work.
{% include notice icon="info" content="QImaging cameras have a default value of 0 for the gray-scale value offset.  This will result in many pixels with a value of zero (indicating clipping of negative values).  It is best to set this value to something like 100." %}
{% include notice icon="info" content="The camera will start up in 8-bit, if your camera is capable, you will want to set this to 12-bit.  You can do so by making a Configuration Preset Group called 'System' and making a Configuration Preset called 'Startup' in which you set these camera parameters." %}

The Rolera MGi-Plus is an EM CCD camera that does not use the QImaging
driver but interfaces with PVCAM instead. Use the
[PVCAM](PVCAM) adapter for that camera.

--[Nico](/users/Nico) 21:29, 1 September 2007 (PDT)

Note: As of 11/25/08 the link provided above does not give the right
driver version. You need to download the
[http://www.qimaging.com/support/downloads/legacy\_qcamdriver.php legacy
drivers](http://www.qimaging.com/support/downloads/legacy_qcamdriver.php_legacy_drivers).

--Hernan Garcia

Note: The 2.0.4 version of the driver does not appear to be linked to
from the site but can still be obtained by pointing your browser
[http://www.qimaging.com/support/downloads/software/windows/QCamDriver2004.exe
here](http://www.qimaging.com/support/downloads/software/windows/QCamDriver2004.exe_here)
(Tested on 25th Feb 2009).

--Prashanth

Note: QCam 2.0.8 and above require the firewire card's driver to be
upgraded from the generic microsoft driver to the newer thesycon driver.
There will be some cards that are not supported. After installation, the
FW card should be recognized as a 'T1394bus OHCI' device.

--Fred at PMQI 10/4/2010

Basic support for multiple cameras was added in the 20130718 nightly
build (expected to be in release 1.4.15). You can select each camera
when adding the QCam device in the Hardware Configuration Wizard.
--[Mark Tsuchida](/users/Mark_Tsuchida) 18:28, 18 July 2013
(PDT)

The Qcam driver works with OS X up to Yosemite as long as you use the 32
bit version. The 64 bit version does not work. Tested running a Mac Mini
with Thunderbolt to Firewire 800 adapter and a firewire 400 to 800 cable
to a QiClick camera. --David Knecht 1-12-16

{% include Listserv_Search text="QImaging" %}


[Discussion page](/talk/QCam) for QCam imported from old wiki
