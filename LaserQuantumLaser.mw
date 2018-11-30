
<table><tr><td>
'''Summary:'''</td><td>Controls the gem/ventus/opus/axiom laser series from  [https://www.laserquantum.com/ LaserQuantum].</td></tr>
<tr><td>'''Author:'''</td><td>Joran Deschamps, EMBL, 2018
</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Laser</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.4.22 (tested with)</td></tr>
</table>

This simple device adapter request from the user a '''maximum laser power''' in the Hardware Configuration Wizard. Upon initialization it checks if the laser is compatible with '''current control mode'''. If it is the case, the user can choose between '''current control mode''' and '''power control mode''' using the device property browser. In current control mode, only the '''Current (%)''' property will change the output power of the laser. In power control mode, the output power is changed through the '''Power (mW)''' property.

If the laser does not support current control mode, then the only property available is '''Power (mW)''' property. Current control is an option, contact LaserQuantum for more details (current control is compatible with TTL triggering at least for the gem series).

This device adapter has been tested with Micro-manager >1.4.22 (to MM2.0.0-gamma) in Windows 7 with a gem561 laser. The API should be compatible with ventus/opus/axiom lasers.


{{Devices_Sidebar}}
