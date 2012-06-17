<table><tr><td>
'''Summary:'''</td><td>Velleman K8061 digital IO board adapter</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman.  </td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Mac/Linux/Windows</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.velleman.be/ot/en/product/view/?id=364910 Velleman K8061]</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[Media:MMConfig_K8061.cfg]]</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>1.2.6</td></tr>
</table>

The Velleman K8061 is a low cost digital IO board (~$120 unassembled, ~$50 more assembled - part nr.: VM140).  It provides 8 digital out and 8 analogue out channels (as well as analogue and digital in) that can be used for things like  TTLs or AOTF control.  The board has a  switching time of ~4 ms.  Since this board has 8 rather than 2 analogue out and is significantly faster than the Velleman K8055, it will often be a better choice than the K8055 (but it needs a whole lot more soldering).   

The Micro-Manager adapter was based on the source code for the Windows DLL posted by Velleman.  The adapter provides a switch, a shutter, and DAC outputs.  You will need to define the 'Hub' device.  The 'Hub' takes one parameter, which is the name of the (USB) port that belongs to the K8061.  Simply select the K8061 port (which you also need to select on page 2 of the hardware config wizard). 

For each DAC that you want to use, add a new one in the Hardware config wizard.  You can set the channel and the voltage (5 or 10 V, set with jumpers on the board) for each of the channels.  The 'switch' determines which of the 8 output channels will be active. The switch is a single byte, each bit in this byte sets the corresponding channel (for instance, the value '3' will set channels 1 and 2).  On my board the logic was somehow inverted, causing the number '1' to switch channel 8.  The shutter will switch the active channels on and off.

{{Note|To use the digital outs, one needs to provide input voltage (5-30V) to the Clamp and Ground pins on the K8061 board.}}

On Windows, you will need to install the driver provided in this [http://valelab.ucsf.edu/~MM/drivers/K8061Driver.zip K8061 Driver] folder.  

Also see Austin Blanco's [http://austinblanco.com/blog/?p=209 blog].


--[[User:Nico|Nico]] 18:21, 2 March 2008 (PST)


{{Devices_Sidebar}}
