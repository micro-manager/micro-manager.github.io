== AA Optoelectronics AOTF interface ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to [http://opto.braggcell.com/ AA Optoelectronic] AOTF</td></tr>
<tr><td>'''Author:'''</td><td>Erwin Peterman</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows, Mac, Linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>AAAOTF and multiAAAOTF</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.46</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[File:All.cfg]]</td></tr>
</table>


----
(This description describes the device adaptor since Micro-Manager from 1.4.11)

'''AAAOTF:'''
Shutter device to control a single channel of the AA MDS Multi Digital Synthesizer; it allows to open/close this channel, but also to adjust the RF power and thus adjust laser intensity. In the property browser you can select which MDS Channel to operate on (1-8), set the RF intensity at which maximum laser intensity is obtained, set the percentage of this maximum RF intenisty (use this property to change laser intensity), and set the state of the shutter device (open (1) / close (0)). We typically install an AAAOTF device adaptor for each channel / laser used in our setups.

'''multiAAAOTF:'''
Shutter device to control all 8 channels of the MDS at the same time (only open/close, use AAAOTF to set intensity of each channel). This device has two states: all off (0) and a selection of channels on (1). This selection is set by the property Channels, which is an 8-bit word (1..255). In other words 1 means channel 1 open, the rest closed; 2 means channel 2 open, rest closed; 5 channel 1 and 3 open, rest closed; etc.

{{Note|Some, but not all, of these devices may have trouble rapidly switching multiple channels using the multiAOTF device (only the first channel will switch). In such cases, setting the "Delay between channels (ms)" property to greater than 25 ms might help.}}
