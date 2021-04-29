== Thorlabs DCxxxx adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to Thorlabs DCxxxx LED driver series (DC2100, DC2010, DC3100, DC4100, DC2200)</td></tr>
<tr><td>'''Author:'''</td><td>Olaf Wohlmann</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.41</td>

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


The Thorlabs DCxxxx adapter operates the [http://www.thorlabs.de/NewGroupPage9.cfm?ObjectGroup_ID=4003&pn=DC2100&CFID=709850&CFTOKEN=40518309 DC2100 - High Power LED Driver], the DC2010 - Universal LED Driver, the DC3100 - FLIM LED Driver, the [https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=3832 DC4100 - 4 Channel LED Driver] and the [https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=9117 DC2200 - High Power LED Driver].

This adapter makes the LED driver usable as a shutter in Micro-Manager.  On startup, the adapter will switch the LED off.  The adapter has several properties that can be used to control the LED driver.

To operate the DC2200 or DC4100, the [https://www.thorlabs.com/software_pages/ViewSoftwarePage.cfm?Code=DC2200 Thorlabs DC2200 software package] has to be installed. In general, if this adapter is greyed out in the Hardware Configuration Wizard, try installing the DC2200 software.

{{Note|The above mentioned serial port settings are the default, but they are recommended to communicate with the device.}}

{{Devices_Sidebar}}
