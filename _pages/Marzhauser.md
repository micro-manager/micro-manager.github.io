== Marzhauser TANGO controller ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with [http://www.marzhauser.com M&auml;rzh&auml;user] TANGO controllers and associated hardware</td></tr>
<tr><td>'''Author:'''</td><td>Interface instructions: Falk Dettmar</td></tr>
<tr><td>'''License:'''</td><td>GNU lesser</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, Shutter, Lamps, XY Stage, Z Axis, and ADC</td></tr>
</table>

The M&auml;rzh&auml;user TANGO family of controllers can be controlled now using the native Marzhauser adapter.
It is tested using the Tango-DT with USB interface on Windows 7.
The Tango with PCI and PCIe connector were also tested successfully on Windows 7.
To configure Micro-Manager to work with the M&auml;rzh&auml;user Tango you need to do the following:
<table><tr><td>
<tr><td>1.</td><td>Please refer the CD shipped with the Tango and follow the usual installation procedure.</td></tr>
<tr><td>2.</td><td>Use the MM hardware configuration wizard for selection of required M&auml;rzh&auml;user components.</td></tr>
</table>

'''See also:''' M&auml;rzh&auml;user [[Corvus]] device adapter.

--[[User:Dettmar|Dettmar]] 24:24, 19 February 2010 (PDT)

{{Devices_Sidebar}}
