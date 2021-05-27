== Leica DMR adapter ==

<table><tr><td>
'''Summary:'''</td><td valign="top">Controls Leica DMRxx and DMIRBE microscopes</td></tr>
<tr><td>'''Author:'''</td><td>[http://100ximaging.com 100ximaging]</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and Linux (serial port)</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>Scope, Shutter, Halogen Lamp, Reflected light module, Objective Nosepiece, Z-drive, Aperture diaphragm, Field diaphragm</td></tr>
<tr><td width=20%></td><td></td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.40</td>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeoutMs||5000
|-
|BaudRate||9600
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Hardware
|-
|Parity||None
|-
|StopBits||1
|}
</table>

This adapter controls Leica DMR microscopes through a direct serial interface.  It was build for and tested with a DMRXA, but likely works with other DMR models (DMRXE, DMRME, DMRBE, DMRA and DMIRBE) as well. This adapter does not support DM LA, DM LFSA, DM IRE2, DM RA2, or DM RXA2.

To use this adapter, connect the microscope using a null modem DB9 serial cable to a serial port connected to your computer.  In the Hardware Configuration Wizard you will  need to 'Add' the LeicaDM Microscope device (and have it use the serial port you just configured).

You will need to define all hardware that is part of your microscope in the Hardware Configuration Wizard (i.e., Micro-Manager does not query the microscope itself for devices present).

{{Listserv_Search|DMR}}

{{Devices_Sidebar}}
