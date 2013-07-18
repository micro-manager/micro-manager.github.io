== Nikon TE2000 motorized microscope ==

<table><tr><td>
'''Summary:'''</td><td>Adapter for Nikon TE2000 motorized microscopes</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj, minor contributions by Nico Stuurman </td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses serial interface)</td></tr>
<tr><td valign='top'>'''Devices:'''</td><td>Hub (TE2000), NosePiece, Shutter, Epi-Shutter, Uniblitz-Shutter, Optical Path, Analyzer, FilterBlock, Lamp, Focus (z-drive), PerfectFocus</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-
|AnswerTimeout||8000
|-
|BaudRate||9600
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}
</tr>

</table>

This adapter communicates to all the devices in the TE2000 through the hub device.  Thus, to use any of these devices, you will need to first define the hub device (and the serial port behind which the hub lives).  

{{Note|This adapter sends commands one by one (i.e., it sends a command and waits for an answer before it will send the next command). Performance can be improved by sending commands without waiting for an answer and the source code has some facilities to do this.  Volunteers to work on this will be highly appreciated by all users of the adapter!}}

 --[[User:Nico|Nico]] 18:20, 25 August 2007 (PDT)

{{Listserv_Search|Nikon}}

{{Devices_Sidebar}}
