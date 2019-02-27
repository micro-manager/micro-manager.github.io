== Zeiss AxioZoom adapter ==

<table><tr><td>
'''Summary:'''</td><td valign="top">AxioZoom microscope</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj</td></tr>
<tr><td>'''Copyright:'''</td><td>Exploratorium</td></tr> 
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and linux (serial port)</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>Microscope stand, MotorFocus, XYStage, OpricsUnit, FluoTube, DL450</td></tr>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-AnswerTimeout||500
|-
|BaudRate||57600
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}


</table>


<p>This adapter is a modification of the more comprehensive ZeissCAN29 adapter, specific to AxioZoom microscope. The same as ZeissCAN29 it uses CAN29 bus interface. The adapter directly communicates to the microscope through the serial port (i.e., it does not use the MTB library provided by Zeiss) and therefore works on all platforms.  No additional software is needed.  USB and ethernet communication is not supported. </p>

<p>Zeiss microscopes require a female-to-female null-modem cable for RS-232 communication.</p>

<p>You will need to define all hardware that is part of your microscope in the Hardware Configuration Wizard (i.e., Micro-Manager does not query the microscope itself for devices present).  In any case, you will need to define the 'ZeissScope' device as this defines the serial port to which the scope is attached.</p>


{{Listserv_Search|Zeiss}}

{{Devices_Sidebar}}
