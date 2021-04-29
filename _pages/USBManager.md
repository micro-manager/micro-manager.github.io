<table><tr><td>
'''Summary:'''</td><td>Interface to certain USB devices</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman.   Uses libusb (libusb-win32 on Windows)</td></tr>
<tr><td>'''License:'''</td><td>BSD and LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>Velleman K8055, K8061, Nikon AZ100</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>

This adapter provides an interface to certain USB devices.  It makes these devices visible to other device adapters as if they were behind a normal (RS232) serial port.  Currently, this only works with the Velleman K8055, K8061 and Nikon Eclipse 90i or AZ100.  On Windows, the user needs to install the appropriate driver (see [[K8055]], [[K8061]], [[NikonAZ100]], or [[NikonEclipse90i]] ).  On other platforms, this may not be the case.



{{Devices_Sidebar}}
