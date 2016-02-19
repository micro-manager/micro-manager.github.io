== Leica DMI adapter ==

<table><tr><td>
'''Summary:'''</td><td valign="top">Controls Leica DMI and DM microscopes</td></tr>
<tr><td>'''Author:'''</td><td>[http://100ximaging.com 100ximaging]</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and Linux (serial port)</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>DMI4000, DMI5000, DMI6000, DM4000, DM5000, DM6000, and DMi8 microscopes. Some success (and failures) have been reported with microscopes using the CTR MIC control box (DMLA100, DMLALED, DMLFSA, DMRXA2, DMRA2, and DMIRE2).  <br> Scope, Shutter (external and internal), Reflectorturret, SideportTurret, ObjectiveTurret, Excitation Lamp Switcher, Z-drive, XY-stage, DIC-turret, AFC</td></tr>
<tr><td width=20%></td><td></td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.18</td>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeout||5000
|-
|BaudRate||19200
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off or software
|-
|Parity||None
|-
|StopBits||1
|}

</td></tr>
<tr><td><b>Peripheral device discovery:</b></td><td>Supported</td></tr>
</table>

This adapter controls Leica DMI microscopes through a direct serial interface.  It was build for and tested with a DMI600B, but might work with other DMI models as well.  

To use this adapter when your microscope only has a USB connector, install the drivers provided by Leica [[Media:Leica-USBDriver.zip]] (for Windows),  or the drivers from [http://www.ftdichip.com/FTDrivers.htm FTDI] (for Mac OS X and Linux) to drive the USB to serial interface inside the microscope (no other Leica drivers are needed since the adapter communicates directly through the serial interface).  This allows you to connect to the microscope through the USB cable.  In the Hardware configuration Wizard, select the 'Leica' serial port (on Windows) or the FTDI port (Mac and Linux) and configure it to run at 19200 baud and have a delay between chars of 0 (other settings are standard).  You will always need to 'Add' the LeicaDMI Scope device (and have it use the serial port you just configured).

You will need to define all hardware that is part of your microscope in the Hardware Configuration Wizard (i.e., Micro-Manager does not query the microscope itself for devices present).  Most labels (reflectors, objectives, sideport) will be read from the controller, so you do not need to set those in the Hardware Configuration Wizard.

{{Listserv_Search|DMI}}

{{Devices_Sidebar}}
