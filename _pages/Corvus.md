== Marzhauser CORVUS controller ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with [http://www.marzhauser.com Marzhauser] ITK Corvus Controllers and associated hardware</td></tr>
<tr><td>'''Author:'''</td><td>Johan Henriksson</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, XY Stage and Z Axis</td></tr>
</table>

'''Serial settings:'''

{| cellspacing="10"
|AnswerTimeout||500.0000
|-
|DataBits||8
|-
|DelayBetweenCharsMs||0.0000
|-
|Handshaking||Off
|-
|StopBits||1
|-
|}


'''BaudRate depends on the DIP switches:'''
{| border="0" width="250" 
!DIP1!!DIP2!!BaudRate
|- align="center"
|down||down||9600||
|- align="center"
|down||up||19200
|- align="center"
|up||down||57600
|- align="center"
|up||up||115200
|- align="center"
|}

It has been reported that an XY stage error ("Is the device is connected to the port") can be prevented by setting the controller (and Micro-Manager) to 115200 baud and setting DelayBetweenChars to 25 ms. --[[User:Mark Tsuchida|Mark Tsuchida]] ([[User talk:Mark Tsuchida|talk]]) 15:35, 9 January 2015 (PST)

'''See also:''' [[Marzhauser]] (TANGO) device adapter

{{Devices_Sidebar}}
