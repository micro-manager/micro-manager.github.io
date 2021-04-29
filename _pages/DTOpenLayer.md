== Data Translation adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls Data Translation digital IO boards</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj</td></tr>
<tr><td>'''License:'''</td><td>BSD License</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows only</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[Media:MMConfig_DTOL.cfg]]</td></tr>
</table>

This adapter interfaces to Data Translation ([http://www.datx.com/]) digital IO boards.  It controls both TTLs and DAQ output (2-channels max).  The TTLs can also be treated as shutters.  It uses the Data Translation SDK and is therefore limited to the Windows platform only.  

TTLs are set using a single 8-bit word, where 1 opens TTL1, 2 opens TTL2, 4 opens TTL3, 8 opens TTL4, etc.. When you replace these values with things that make sense to you (for instance, ' 488 nm'), make sure to prepend the value with a space, or otherwise it will not appear in the top of the list of choices in the drop-down menu in the MM UI.


--[[User:Nico|Nico]] 11:22, 25 August 2007 (PDT)

{{Devices_Sidebar}}
