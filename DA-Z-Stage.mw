== DA Z Stage ==

<table><tr><td>
'''Summary:'''</td><td>For stages that can be controlled with an analogue voltage.  Needs a DA device</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms</td></tr>
<tr><td>'''Devices:'''</td><td>Stage</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.2.8. In 1.3 and higher, this code can be found in the Utilities adapter</td></tr>
</table>

Some (piezo) stages can be controlled with an analogue voltage. The position of the stage relates linearly to the voltage applied to the stage.  Micro-Manager can control such a stage using this adapter and a DA (digital-analogue) device. Currently, three DA devices are support by Micro-Manager, the [[DTOpenLayer]], the [[Velleman K8055]] and the [[Velleman K8061]].

You will need to physically connect the output of the DA device to your stage controller.  Then make a configuration file (using the hardware configuration wizard) that contains both the DA device and the DAZStage adapters. There are five parameters that need to be set for the DAZStage adapter.  The first four are the voltage range to which the stage responds (minimum and maximum voltage), and the position of the stage (in micrometers) at the minimum and maximum voltage.  These parameters are set before initialization of the adapter (you will set these in the hardware configuration wizard), and the documentation to your stage should tell you what these values are. The fifth parameter is the name of the DA device that you are using.  For technical reasons, this parameter can only be set after all adapters are loaded.  The best way to set this is to define it in your startup configuration.  To this end, make a system configuration group called 'System' and in the group make a preset called 'Startup'.  In this group, set the 'DA device' property to the desired DA device.

--[[User:Nico|Nico]] 13:26, 29 March 2008 (PDT)

{{Devices_Sidebar}}
