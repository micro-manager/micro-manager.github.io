== Adapter for National Instruments DAQ with analog outputs ==

<table><tr><td>
'''Summary:'''</td><td>Controls NI I/O boards through NI-DAQmx interface. Supports simultaneous hardware sequencing using multiple analog output ports.</td></tr>
<tr><td>'''Author:'''</td><td>Mark Tsuchida, Open Imaging, Inc.</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows only</td></tr>
</table>

See also: [[NI100X]].

This device adapter is intended for use with National Instruments DAQ boards/boxes that have multiple analog output ports (e.g. Analog Output series PCI boards such as PCI-6723). It does not (so far) support digital outputs, but does support hardware triggering (with a single trigger input line driving all, or some, or the outputs; each output may have different sequence lengths so long as the least common multiple is not too big).

The hardware triggering support is flexible enough that you can use the same DAQ to control a piezo Z stage, the illumination channel (possibly using analog output ports as TTL outputs, with the DATTLStateDevice available in [[Utilities]]), and illumination intensities simultaneously. In such a configuration, both the Z stage and the illumination channel can be sequenced by hardware triggering at the same time in an MDA.

To set up triggered acquisition with the NIDAQ card, you first load the analog outs you with to control light sources with. You then set up a DA TTL State Device to allow control of these analog outs from a single state setting, and then set up a State Device Shutter to control the DA TTL state device.  

{{Devices_Sidebar}}
