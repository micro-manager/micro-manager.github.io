== Lumencor LED light sources ==

<table><tr><td>
'''Summary:'''</td><td>For Lumencor light sources, such as SpectraX and Sola</td></tr>
<tr><td>'''Author:'''</td><td>Louis Ashford</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Aura, Sola, Spetrca. SpectraX</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Serial cable'''</td><td>Straight through</td></tr>
<tr><td>'''Serial port settings'''</td><td>Baudrate: 9600</td></tr>
</table>

To include the Lumencor in a channels group, include the different colors in the Group and set at least one color to "enable" in each Preset. Be sure to select the Lumencor as the Core-Shutter. (Do not include "White" in a channels group that also includes the other colors. If you do, it will interfere with the other colors. For instance, if you enable one color but disable white, no colors will shutter.)

If you need hardware triggering for your SpectraX (e.g. to minimise sample exposure, or for fast acquisition), read this [https://github.com/vanNimwegenLab/MiM_NikonTi/blob/master/Docs/NikonTi_hardware_triggering.md step-by-step tutorial] on controlling multiple light sources with an Arduino for sequenceable MDA (by Guillaume Witz & Thomas Julou).
