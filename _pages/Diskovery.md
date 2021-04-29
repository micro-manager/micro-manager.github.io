== Diskovery adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls the Spectral/Andor Diskovery spinning disk confocal/TIRF module</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and Linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Hub, Disk-Position, Illumination-Size, TIRF-Position, Objective-Select, Filter-W, Filter-T</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>1.4.23 and later</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeout||6000
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
<tr><td>'''Other settings:'''</td><td>Core-TimeoutMs should be 25000ms to give the disk enough time to switch</td></tr>
</table>

The [http://www.andor.com/microscopy-systems/andor-diskovery Diskovery]  is connected through a USB cable.  The controller has a build-in USB to serial converter, therefore, it will appear as a serial port to your computer.  

{{MessageBox|Warning|Before starting the Configuration Wizard, disable TIRF on the Diskovery unit. This avoids an error caused by Micro-Manager being unable to read an appropriate label for the enabled state of the TIRF.}}

{{Devices_Sidebar}}
