== Leica Camera adapter using Baumer Optronics Libraries ==
<table>
<tr><td>'''Summary:'''</td><td>Adapter for DFC Firewire (IEEE 1394) cameras from http://www.leica-microsystems.com [http://www.leica-microsystems.com]</td></tr>
<tr><td>'''Author:'''</td><td>Karl Hoover, UCSF</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows-only</td></tr>
<tr><td>'''Devices:'''</td><td>Leica DFC, and other Baumer-compatible cameras</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.45 20100218</td>
<tr><td>'''64-bit support since'''</td><td>1.4.8 20120224</td>
</table>

This device adapter was written by Karl Hoover and will provide higher performance than the TWAIN interface and supports fast continuous acquisition.

=== Getting started ===
You need installed camera driver from Leica (available on your [http://www.leica-microsystems.com/products/microscope-cameras/ camera page] on Leica site) or Baumer (ships with SDK, see below). If you have ''Leica Application Suite'' (LAS) program on your system, likely you already got one. Note, that only one application can use camera at same time.

=== Compatibility ===
This device adapter uses same API (through FxLib.dll) as proprietary ''Leica Application Suite'', so it's suitable using them both without an inconsistencies. Note that not all Leica DFC cameras are supported by this adapter (for instance, the DFC500 and DFC550 will not work). For full camera list see ''Cameras Types'' page in Fxlib.chm documentation from SDK.

The adapter tested with:

* Leica DFC345 FX and
* Leica DFC425 on Windows XP 32 bit and Windows 7 64 bit (2012-02-24)
* Leica DFC295 on Windows XP 32 bit (2014-07-30)

=== Troubleshooting ===
Windows have own firewire OHCI compliant driver with couple of bugs (thereby Baumer produce own one). Make sure that proper driver is installed and selected. You can inspect it with Windows Device Manager. Also it's possible check camera work with Baumer GAPI viewer that ships with SDK.

=== Developer information ===
Since version 1.4.8 (20120224), this adapter become open source and build using the freely available [http://www.baumer.com/int-en/products/identification-image-processing/software-and-starter-kits/baumer-gapi-sdk/ Baumer GAPI SDK v1.7.1 Windows FireWire] (BSTD Fxlib). Newer versions not support Firewire interface. The adapter uses Windows API and not cross-platform.

Besides SDK documentation, checkout a [https://github.com/radioxoma/baumer sample code] (binaries included) performing simple camera capabilities discovery.

=== Changelog ===
* Made to work again by [[user:Nico|Nico Stuurman]], Feb. 2012
* Fixed CPU overload, ROI and binning in continuous acquisition mode by [[user:radioxoma|Eugene Dvoretsky]] (VSMU, BY), Jul. 2014

{{Listserv_Search|Leica}}
{{Devices_Sidebar}}
