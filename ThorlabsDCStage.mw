== ThorlabsDCStage adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to Thorlabs linear DC stage MTS50/M-Z8E controlled with the TDC001 Controller</td></tr>
<tr><td>'''Author:'''</td><td>Emilio J. Gualda, UIC-Instituto Gulbenkian de Ciencia</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.14</td>

<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-AnswerTimeout||500
|-
|BaudRate||115200
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}
</td></tr>
</table>

{{Note|See also: [[ThorlabsAPTStage]]}}


The ThorlabsDCStage adapter operates the  Motorized Translational Stages (50 mm)
[http://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=3002 MTS50/M-Z8E] from Thorlabs controlled with the [http://www.thorlabs.com/NewGroupPage9.cfm?ObjectGroup_ID=2419 TDC001 Controller]. 

Before using this adapter install the software provided by Thorlabs and follow the configuration process. Moreover the APT.dll file should be copied on the Micro-manager folder. [[File:APT.zip]]

Each time you power-up this stage needs to be "homed" before sending any commands. To do that, create a Group with the "Home" property. Then set the value to 1.

{{Note| The controller TDC001  only works on 32 bits Micro-manager as explained in the Thorlabs webpage.}}

{{Devices_Sidebar}}
