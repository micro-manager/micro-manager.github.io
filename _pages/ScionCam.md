== Scion Firewire Cameras ==

<table><tr><td>
'''Summary:'''</td><td>Controls [http://www.scioncorp.com/ Scion Firewire Cameras]</td></tr>
<tr><td>'''Author:'''</td><td>C. Douglas Remsberg (scion corp.)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows (32-bit only), Mac</td></tr>
<tr><td>'''Devices:'''</td><td>Scion Firewire Cameras</td></tr>
</table>

''The company producing the Scion cameras has ceased to exist. Fortunately, the company made the files needed to operate their cameras available to us, and these will be accessible through this page. However, we do not have any of these cameras and therefore cannot test these instructions.  Please update and clarify the following text!''


'''Instructions:'''<br>Install the drivers for your platform: 
<table><tr><td>''Windows 32-bit''</td><td>[http://valelab.ucsf.edu/~nico/Scion/Drivers/SFWDrivers32.exe 1.6MB]</td></tr>
<tr><td>''Windows 64-bit''</td><td>[http://valelab.ucsf.edu/~nico/Scion/Drivers/SFWDrivers64.exe 2MB]</td></tr>
<tr><td>''Mac OS X''</td><td>[http://valelab.ucsf.edu/~nico/Scion/Drivers/sfwdist.pkg.tar.gz 300kB]</td></tr>
</table>

If you are using Windows 7, please read this [http://valelab.ucsf.edu/~nico/Scion/Drivers/technical_note_2.htm technical note].  You may need to download the [http://valelab.ucsf.edu/~nico/Scion/Drivers/FireWireDrivers.exe FireWire Drivers].

After installing the drivers, install the shared library for your platform:

<table>
<tr><td>''Windows 2000 - Windows 7 32-bit''</td><td>[http://valelab.ucsf.edu/~nico/Scion/Micro-Manager/SFW_Library.exe Version 2.3]</td></tr>
<tr><td>''Mac OS X''</td><td>[http://valelab.ucsf.edu/~nico/Scion/Micro-Manager/sfwlibraries.pkg.tar.gz Version 2.4]</td></tr>
</table>

The following files were also provided by Scion:
[http://valelab.ucsf.edu/~nico/Scion/Micro-Manager/SFW_MM_13.exe	SFW_MM_13.exe] Installs Camera support for Micro-Manager 1.3.40 Beta.  Note: Existing Micro-Manager 1.3.40 installation required.
Windows 2000 - Windows 7 32-Bit		Version 1.3.3

[http://valelab.ucsf.edu/~nico/Scion/Micro-Manager/SFWMM_Intel_12.dmg SFWMM_Intel_12.dmg] Installs Version 1.2 Micro-Manager and Scion CFW Camera camera support.
Mac OS 10.4 or higher (Intel only)	Version 1.2

Then make a configuration file using the Micro-Manager hardware configuration wizard.

There is an exposure delay enable option.  If this option is off (value of 0) then there will be no exposure
delay of any kind. If this option is set to on (1 or any other number) - then the optimal computed delay to guarantee synchronization with the shutter is on during exposure is activated. Hope this doesn't confuse - but some people aren't going to want that delay as it will slow down full frame capture.

Martin Wessendorf made available a copy of [http://valelab.ucsf.edu/~nico/Scion/scioninfodrivers.zip the installation CD that came with his camera].

{{Listserv_Search|Scion}}

{{Devices_Sidebar}}
