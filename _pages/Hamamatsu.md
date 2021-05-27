== Hamamatsu DCAM adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Hamamatsu cameras</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj, with contributions from Nico Stuurman (Mac adaptation).</td></tr>
<tr><td>'''License:'''</td><td>LGPL (UCSF version, however, we have been asked not to distribute the source)</td></tr> 
<tr><td>'''Platforms:'''</td><td>Mac OS X, 32-bit only (see [[HamamatsuHam]] for Windows)</td></tr>
<tr><td>'''Devices:'''</td><td>Hamamatsu DCAM compatible cameras (only tested with Firewire cameras)</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[Media:MMConfig_ham.cfg]]</td></tr>
</table>

{{Note|Windows users should use [[HamamatsuHam]]}}

This adapter makes Micro-Manager work with DCAM-compatible Hamamatsu cameras.  You will need to download and install a recent version of the [http://www.dcamapi.com/ DCAM driver]. Make sure to read and follow the camera-specific instructions in the DCAM-API Compatibility Note provided on the same page.
{{Note|DCAM version dated March 2011 does not work with Micro-Manager.  The August 2011 release works fine.}}

In the case of ORCA Flash 4.0, please read the page on [[High Speed Acquisition in Micro-Manager]]. For the ORCA Flash 4.0, trying Hamamatsu adapter first will not only get the error message but also prevent the correct communication for trying HamamatsuHam afterwards. Rebooting the computer reset such a case. Also, if the computer has gone through a cycle of sleep, rebooting the computer and the camera is needed.

If Micro-Manager reports: "No camera found" while configuring Micro-Manager with a Hamamatsu camera, make sure that it works with the software provided by Hamamatsu.  On Windows, you can launch it by starting the Hamamatsu installer, click the "Others" button, and select "ExCap".  Make sure that Excap finds your camera and that you can "Snap" an image in ExCap.  If ExCap does not find the camera, it is likely that the wrong driver is installed for your Firewire Hamamatsu camera.  Open the Windows Device Manager (Start->Control Panel->System->Hardware->Device Manager). Find the Hamamatsu camera (it can be under "Imaging Devices").  Right click and select "Properties".  Make sure that the driver is from Hamamatsu.  If it is not (most likely alternative is that the driver is from Microsoft), uninstall the driver, and re-install, making sure that the Hamamatsu driver is installed this time.

This adapter does not work with all cameras that are DCAM compatible.  All firewire cameras that we tested ('''AG''', '''ERG2''', and '''R2''') work alright under Windows, some models had problems on some Intel Apple Macs (share your successes!).  The EM cameras ('''C9100-12''' and '''C9100-13''') work both on Windows and Mac (tested with MM version 1.2.31).  Other cameras with the Phoenix card may also work. In general, try before you buy, and please provide feedback here about successes and failures.  

The '''ORCA-D2''' was tested by us December 2011.  It works well with the HamamatsuHam adapter and the August 2011 DCAM driver. Images from both CCDs appear as a single image in Micro-Manager.  Use the [[SplitView]] plugin to display the two CCD images as an overlay.  In the future, it will be possible to automatically apply the SplitView transformation to images acquired using [[Micro-Manager_User's_Guide#Multi-dimensional_acquisition|Multi-Dimensional Acquisition]].  If you do not want the images to be acquired simultaneously, use property "ACTIVE VIEW INDEX" of the adapter.  A setting of "0" will give you both images, setting "1" will give you only the image from one CCD, and setting "2" will give you the image from the other CCD. 

--[[User:Nico|Nico]] 12:38, 15 July 2008 (PDT), last updated --[[User:Nico|Nico]] 17:09, 26 August 2009 (UTC)

{{Note|Make sure you read the DCAM-API Compatibility Notes (available on the website), and in particular follow the instructions for computer power management settings, if it is applicable to your camera.}}

{{Listserv_Search|Hamamatsu}}

{{Devices_Sidebar}}
