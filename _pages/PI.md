== PI Z Stage ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with [http://ww.pi.ws Physik Instrumente (PI)] controllers and associated hardware using the SCPI command set</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman (based on code by Steffen Rau and Nenad Amodaj)
</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Stage</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>>=1.2.10</td></tr>
</table>

This adapter controls stages connected to PI SCPI Controllers. The SCPI command set was discontinued about 5 years ago and has been replaced by the GCS command set, so this adapter will only work with older controllers.  It has been tested with the E-662 controller but should work with all PI controllers that support SCPI and can be connected via a serial interface.  For current PI controller use the [[PI_GCS]] adapter instead. 

The PI adapter is available since version 1.2.10.

The controller can be set in 'Local' mode (it will listen to the frontpanel, not to the computer), or in 'Remote' mode (it will listen to the computer, not to the front panel).  The 'Interface' property lets you switch between these two modes.  You might want to set this in the 'System' 'Startup' and 'Shutdown' property groups.

All communications to devices take place through serial ports. Check the manual to your controller for the required port settings.

Serial port settings for E-662: 9600 baud, 1 stop bit, no parity, hardware handshake. Use a null-modem cable.

This driver does not work with the E-750. The E-750 uses a special binary protocol over the serial line.

--[[User:Kdb|Karl Bellve, Biomedical Imaging Group, University of Massachusetts]] 16:49, 1 July 2009 (UTC)

{{Devices_Sidebar}}
