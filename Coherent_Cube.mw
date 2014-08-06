<table><tr><td>
'''Summary:'''</td><td>Coherent Cube Laser Controller</td></tr>
<tr><td>'''Author:'''</td><td>Karl Hoover</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.coherent.com/Lasers/index.cfm?fuseaction=show.page&ID=1007 Coherent Cube Laser]</td></tr>
<tr><td>'''Since Version:'''</td><td>1.3.45 20100309</td></tr>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|BaudRate||19200
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}

</td>
</tr>
</table>

The Coherent Cube laser controller controls compact solid-state lasers.

Before adding this device adapter, confirm that you have serial communication with the laser controller by using a terminal, configured as described above. COM port timeout should be set to 5000 milliseconds. 

The laser controller should respond to the following commands: L=1, L=0, (laser on and off)  P=5 (set power to 5 mW) ?P (power readback now) ?SP ( power setpoint now) ?MINLP (minimum laser power setpoint) ?MAXLP (maximum laser power setpoint)  ?T ('TEC' servo mode) ?CDRH (mode for enabling a 5 second safety delay), ?EXT (1 if laser is controlled by external analogue line.) If you do not get a response for each of these values, then the Micro-Manager Coherent device adapter will not work. The following commands are also expected to work: ?WAVE (wavelength) ?HH (head usage hours) ?HID (laser head ID)

The laser prompt must be set to off ('>=0'). This is the default state of the laser, so you should not need to change it.

In the configuration wizard you will need to add one Coherent Cube object for every Coherent Cube you would like to control. 

Inside microManager, the following command 'properties' are available with this device adapter:
<ul>
    <li>Laser Power (Read/Write)
    <li>Laser On/Off (Read/Write)
    <li>Hours (Read only)
    <li>Serial Number (ID) (Read only)
    <li>Wavelength (Read only)
    <li>Min, Max Power (Read only)
    <li>Head ID (Read Only)
    <li>External Power Control (Read/Write)

</ul>

{{Note|Lasers will automatically be shut off when Micro-Manager closes but power remains on.}}


{{Devices_Sidebar}}
