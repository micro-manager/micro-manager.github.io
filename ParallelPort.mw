<table><tr><td>
'''Summary:'''</td><td>Interface to Parallel port on Windows</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>Windows Parallel Port</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>


This adapter makes the parallel port available as a digital output device, i.e., it provides a way of setting TTLs.  It uses [http://www.logix4u.net/inpout32.htm inpout.dll] to talk to the parallel port. The pins in the parallel port are set using a single binary value, where each position in the number corresponds to a pin in the port.   

For instance: <br>
1023 (1111111111)  will set pins 1 through 10 high<br>
0    (0000000000) will set pins 1 through 10 low<br>
6    (0110000000) will set pins 2 and 3 high and all others low.<br>

{{Note|This adapter does not provide a shutter device.  The [[AOTF]] adapter provides a shutter that can set pins of the parallel port.}}

{{Note|On Windows Vista and later, you may need to run Micro-Manager as administrator (right-click and choose "Run as administrator" from an admin account) the first time you access the parallel port.}}

{{ParallelPort_Warning}}
{{Devices_Sidebar}}
