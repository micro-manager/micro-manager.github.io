
<table><tr><td>
'''Summary:'''</td><td>Controls the iBeamSmart laser series from  [https://www.toptica.com/products/single-mode-diode-lasers/ibeam-smart/ Toptica].</td></tr>
<tr><td>'''Author:'''</td><td>Joran Deschamps, EMBL, 2018
</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Laser</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.4.22</td></tr>
</table>

The Toptica iBeamSmart lasers are usually controlled using two channels (see Toptica's software Topas). The FINE settings affecting only the first channel, while the digital modulation (optional) acts only on the second channel.

This device adapter (module '''iBeamSmartCW''') makes use of a hidden control mode (called CW) that simplifies the interface. In the '''CW mode''', the laser is controlled using a single channel while allowing FINE and digital modulation (if the option is present).

Upon quitting Micro-manager, the device adapter switches back the laser to '''normal control mode'''.

{{Important| If the laser is in '''CW mode''', it will no longer be controllable by the Topas software from Toptica. '''This can happen when Micro-Manager crashes unexpectedly and the device adapter is not properly unloaded'''. Before using Topas, load the device adapter in Micro-manager and quit the software. The laser will then be usable with Toptica's software.}}

In order to switch faster to normal mode, another device is available in the device adapter: '''iBeamSmartNormal'''. This device '''does not''' allow controlling the laser as it sole purpose is to switch back the laser to normal control mode.

This device adapter has been tested with Micro-manager 1.4.22 and 2.0.0-beta on Windows 7.

{{Devices_Sidebar}}
