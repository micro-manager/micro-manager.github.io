== Vincent shutter controller adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces to Vincent (Uniblitz) shutter controllers</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Vincent controllers VMM-D1/T1, D122, D3/D4, VCM-D1, ASI SC-2000, possibly others</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>


This adapter controls the [http://www.uniblitz.com Vincent] shutter controllers [http://www.uniblitz.com/departments/Shutter%20Control.aspx D1, T1, D3] and [http://www.uniblitz.com/resources_filelibrary/t132_d122_user_manual_1_3.pdf D122] (not available anymore). Connect the controller through a serial port and configure the port as specified in the manual to your controller (the D122 uses a baudrate of 300, others are 9600, for the D122 set 'DelayBetweenCharsMs' to 50-100, for other controllers this can be 0). Multiple controllers can be daisy chained as the adapter can address these daisy-chained controllers (For property "Address", use "x" to address all daisy-chained controllers, or if there is a single controller). 

The Vincent D3 controls up to 3 shutters.  For each shutter, make a separate Vincent-D3 device, and set the "Channel #" pre-initialization property to the desired shutter number.

--[[User:Nico|Nico]] 09:36, 8 September 2007 (PDT)

If using an actual serial cable, ensure that the cable is of the [http://en.wikipedia.org/wiki/Null_modem "null modem"] type.

--[[User:oreopoj|oreopoj]] 14:06, 8 September 2010 (EST)


{{Devices_Sidebar}}
