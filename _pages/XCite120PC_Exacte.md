==Lumen Dynamics XCite Adapter ==

<table><tr><td>
'''Summary:'''</td><td>Adapter for the [http://www.ldgi-xcite.com/index.php Lumen Dynamics] X-Cite® Light Sources</td></tr>
<tr><td>'''Author:'''</td><td>[http://www.missionbayimaging.com/mbimaging2010/Welcome.html Mission Bay Imaging] (on contract from Lumen Dynamics Group)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and Linux</td></tr>
<tr><td>'''Devices:'''</td><td>X-Cite® 120PC, 120PC Q and X-Cite® exacte</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>


The Lumen Dynamics X-Cite® 120PC and ''exacte'' are computer controlled, remotely positioned (liquid light guide) light sources for UV/Visible microscopy applications.

The X-Cite® 120PC Q microscope light source provides rich spectral fluorescence excitation with a uniformly illuminated field of view, the convenience of pre-aligned lamps, 2000 hour lamp lifetime along with a computer controlled shutter and adjustable iris.

The X-Cite® ''exacte'' microscope light source employs a DC-powered mercury lamp coupled with Closed-Loop Feedback technology to provide stable fluorescence illumination, for imaging protocols lasting from milliseconds to days. With the [http://www.ldgi-xcite.com/products-radiometer.php X-Cite® Radiometer] or [http://www.ldgi-xcite.com/products-xr2100-xp750.php X-Cite® Optical Power Measurement System], light output can also be calibrated in absolute power units (watts), ensuring truly repeatable fluorescence illumination for imaging experiments.


==Installation==

Add the appropriate X-Cite device via the Hardware Configuration Manager

Set serial port timeout to 2000ms

Serial port settings:

*BaudRate 	9600
*Delay 		0
*Handshaking 	Off
*Parity		None

===Exacte===

When using the Exacte with a Mac download the FTDI drivers for the USB-Serial adapter [https://valelab.ucsf.edu/~nico/MMwiki/images/4/49/FTDIUSBSerialDriver_v2_2_8.zip here] 

On windows, ensure that you have installed both the USB and virtual COM port drivers. To do this, follow these steps:

# Open Control Panel on your computer.
# Double click the “System” icon.  If you do not see the “System” icon, change your view to Classic View
# Select the “Hardware” tab.
# Click the “Device Manager” button.
# With the X-Cite exacte plugged into your USB port and turned on…
# Verify in the “Universal Serial Bus Controllers” section that you see the “X-Cite exacte” listed without a question mark on the icon to its left.
# Verify in the “Ports (COM & LPT)” section that you see the “X-Cite exacte” listed without a question mark on the icon to its left.
# If either device has a question mark on the icon, insert your X-Cite exacte CD.
# Ensure you have administrator privileges, right click on the device and select “Update Driver…”.
# Follow the on-screen prompts.

==Support==

For questions or issues related to Micro-Manager and this adapter please check the Micro-Manager listserv:

[http://sourceforge.net/mailarchive/forum.php?forum_name=micro-manager-general http://sourceforge.net/mailarchive/forum.php?forum_name=micro-manager-general]

For X-Cite® device support please contact Lumen Dynamics:
Email: [mailto:Techsupport@LDGI.com Techsupport@LDGI.com]
Ph: +1 800 668-8752 (USA and Canada)

For bug reports please contact: [http://www.missionbayimaging.com/mbimaging2010/Welcome.html Mission Bay Imaging]

--[[User:Jbutler mb|Jbutler mb]] 22:11, 31 January 2011 (UTC)

{{Devices_Sidebar}}
