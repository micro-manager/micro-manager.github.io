== DA Shutter ==

<table><tr><td>
'''Summary:'''</td><td>Treats a DA output device as a shutter.  This can be handy for diode lasers (and possibly also other devices)</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms</td></tr>
<tr><td>'''Devices:'''</td><td>Stage</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.2.39.  In 1.3 an higher, this code can be found in the Utilities adapter</td></tr>
</table>

Some diode lasers can be controlled with an analogue voltage, i.e. the lightoutput is equivalent to the applied voltage.  Digital Analogue (DA) devices supported by Micro-manager (currently [[DTOpenLayer]], the [[Velleman K8055]] and the [[Velleman K8061]]) can provide computer control of lightoutput.  However, to make the DA device appear as a shutter in Micro-Manager you will need this adapter.  .

You will need to physically connect the output of the DA device to your device (diode laser, LED...).  Then make a configuration file (using the hardware configuration wizard) that contains both the DA device and the DAShutter adapters. There is one parameter that needs to be set: the DA device that is associated with this DAShutter device.  For technical reasons, this parameter can only be set after all adapters are loaded.  By default, the first DA device found will be loaded.  The best way to change this is to define this parameter ("DA Device") in your startup configuration.  To this end, make a system configuration group called 'System' and in the group make a preset called 'Startup'.  In this group, set the 'DA device' property to the desired DA device.

The interplay with the 'DA Shutter' and the actual DA device is a bit funky.  You will first need to set the desired intensity of the light output by setting the output voltage.  You can then shutter the light with the DA Shutter device.  If you change the voltage while the shutter is closed, the light will come on again (which is counter-intuitive).

--[[User:Nico|Nico]] 16:02, 30 September 2008 (PDT)

{{Devices_Sidebar}}
