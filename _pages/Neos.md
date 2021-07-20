== AOTF adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls NEOS AOTF through PCs parallel port</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj</td></tr>
<tr><td>'''License:'''</td><td>BSD License</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows only</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[Media:MMConfig_AOTF.cfg]]</td></tr>
</table>

This adapter lets you use a [http://www.neostech.com/ NEOS AOTF](and other shutter devices that can be controlled with a TTL) as a shutter using just your PCs parallel port.  The pins on the parallel port are addressed using a  binary mask with a maximum value of 1024 (so that you can address the first 10 pins of the parallel port, see the [[ParallelPort]] for examples).  Each pin (or a combination thereof) can be declared to be a shutter.  

In general, it is a better approach to use a DAQ board to control an AOTF (since that will also give you control of intensity).  However, this adapter might still be useful as it provides TTLs in a very cost-effective way.

This adapter uses the [http://www.logix4u.net/inpout32.htm inpout.dll]to talk to the parallel port.

--[[User:Nico|Nico]] 15:34, 15 August 2007 (PDT)

{{ParallelPort_Warning}}
{{Devices_Sidebar}}
