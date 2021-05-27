== Pecon Incubation system adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls Pecon Incubation System Devices</td></tr>
<tr><td>'''Author:'''</td><td>Peter Topor</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Devices:'''</td><td>TempControl 37-2, CTI Controller 3700, CO2 Controller</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>

This adapter controls Pecon devices: TempControl, CTI-Controller, CO2 Controller. No additional software is needed and should work on all platforms (so far tested only on Windows). Port commands were generously provided by PeCon GmbH.
Serial port settings are 300 baud, 8 data bits, 2 stop bits, no parity, no handshaking, port timeout about 4 seconds. You will need to define the 'Pecon' device and assign it to the correct port. 
Adapter still needs to be optimized, tuned up and also stability of adapter needs to be improved. Often, when error message pops up, resending of the command solves the problem.
Plugins for ImageJ for recording incubation values to a file are planned for near future.

--[[User:Peto|Peter]] 16:41, 11 June 2008 (CET)


{{Devices_Sidebar}}
