== HamamatsuHam device adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Hamamatsu cameras</td></tr>
<tr><td>'''Author:'''</td><td>Patrick Gregorio (Hamamatsu)</td></tr>
<tr><td>'''License:'''</td><td>Source code cannot be made available</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows (see [[Hamamatsu]] for Mac OS X)</td></tr>
<tr><td>'''Devices:'''</td><td>Hamamatsu DCAM compatible cameras</td></tr>
</table>

{{Note|Formerly (up to Micro-Manager 1.4.16) there was a legacy [[Hamamatsu]] adapter (developed at UCSF) in addition to the "HamamatsuHam". That adapter will be retired in 1.4.17. It is still included in the OS X version, because HamamatsuHam is not supported on OS X. On Windows, if you have a hardware configuration using Hamamatsu, you will need to create a new hardware configuration using HamamatsuHam.}}

Before configuring the camera, you will need to download and install a recent version of [http://www.dcamapi.com/ DCAM-API]. Make sure to read and follow the camera-specific instructions in the DCAM-API Compatibility Note provided on the same page.

{{Note|Make sure you read the DCAM-API Compatibility Notes (available on the website), and in particular follow the instructions for computer power management settings, if it is applicable to your camera.}}

== Property Notes for Flash4v2 ==

SENSOR MODE: Possible values AREA and PROGRESSIVE.  In AREA mode, the camera will readout from the top and bottom sections of the sensor simultaneously starting with the center lines.  In PROGRESSIVE mode, the camera will readout from one direction only.  This is called the "light sheet mode" in the Flash4 manual.  You can choose the direction of the readout as well (READOUT DIRECTION).

The global reset function is not supported yet.  This starts all rows exposing at the same time.

ScanMode handles the readout speed.  1 = slow scan mode.  2 = fast scan mode.

EXPOSURE FULL RANGE: When disabled, you are limited to an exposure of 10 seconds.  When enabled, you are not limited and it will allow you to set the maximum exposure time for the camera.  The reason for this property is because it is currently not possible to abort an exposure in Micro-Manager and also because the scroll bar for the exposure time can change the exposure quite dramatically.


{{Listserv_Search|Hamamatsu}}

{{Devices_Sidebar}}
