<table><tr><td>
'''Summary:'''</td><td>Controls the Elliptec sliders from  [https://www.thorlabs.de/newgrouppage9.cfm?objectgroup_id=9464 Thorlabs].</td></tr>
<tr><td>'''Author:'''</td><td>Joran Deschamps and Anindita Dasgupta, EMBL, 2019
</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Laser</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.4.22</td></tr>
</table>

The device adapter controls the Thorlabs Elliptec sliders ELL6 (two positions) and ELL9 (four positions), as well as the stages ELL17 and ELL20. The ELL6 can also be loaded as a shutter.

In addition to the COMport, the user need to set the communication channel of the device (from 0 to F). The devices have a default to channel 0. The channel can be easily read out from the Elliptec software (see Thorlab's Elliptec page). When chaining multiple Elliptec devices on the same COMport, different channels must be set for the individual devices.


{{Important| The ELL9 can be slow to get to a new position, it will therefore give a '''TimeOut error''' if the time out of the COMport is set too low (e.g. the default 500 ms). We advise using a TimeOut of 2s for the ELL9, and potentially for the ELL17/ELL20 as well.}}
