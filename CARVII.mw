== BD/CrEST CARV II adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls BD/CrEST CARV II spinning disk</td></tr>
<tr><td>'''Author:'''</td><td>G. Esteban Fernandez</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>CARVII Hub, shutter, excitation filter wheel, emission filter wheel, dichroic filter wheel, FRAP (field) iris, illumination intensity iris, disk slider, disk spin motor, prism (light path) slider, touchscreen</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>1.4.6</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeout||5000
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
</table>

This adapter interfaces to the [http://www.crestopt.com CrEST] [http://www.crestopt.com/html/carv2.htm CARVII] spinning Nipkow disk confocal scanhead.  Connect the CARV II to an available serial port on your computer.   You will need to define the ''Hub'' device, and assign the correct serial port to it. 

Sending a touchscreen command to the CARV II while simultaneously sending a serial (software) command can result in catastrophic crash.  To reduce that risk the device adapter locks the touchscreen at initialization.  If the padlock icon does not appear on the touchscreen after initialization, load the hardware configuration again.  If you wish to reactivate the screen, at the risk of said catastrophic crash, do so in the Device Properties Browser.


{{Devices_Sidebar}}
