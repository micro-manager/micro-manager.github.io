== Standa Microstep Controller adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to Standa: 8SMC1-USBhF Microstep Driver</td></tr>
<tr><td>'''Author:'''</td><td>[mailto:clarence.leung@mail.mcgill.ca Clarence Leung], Leslie Lab, McGill University</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.15</td>
</table>

=== Installation ===

The device adapter requires the "Development Kit (C, C++ and other)" available from [http://www.standa.lt/products/catalog/motorised_positioners?item=175&prod=microstep_driver_usb_interface the official Standa page for the controller].  

Make sure to install the 32-bit or 64-bit version that matches your Micro-Manager installation.

=== Configuration ===

To configure the device adapter for use in Micro-Manager, make sure the SMCView drivers are currently not in use, and that the MicroSMC drivers are active instead.  To do so, open up the Device Manager and make sure "8SMC1-USB" or "8SMC1-USB MicroSMC" is the name of a device under "Universal Serial Bus controllers".

If you have a device under "NI-VISA USB Devices" named "8SMC1-USB(h)", then you are currently using the SMCView drivers, and must switch to the drivers found in the development kit.  Follow the instructions in the [http://www.standa.lt/files/usb/8SMC1-USBhF%20User%20Manual.pdf Standa user manual (PDF)] to switch between the NI-VISA and MicroSMC drivers.

The device currently has three main settings, which is the '''device number''', '''stage limit in um''', and '''step size in um'''.

The '''device number''' of your attached device is based on the index of the device in the "USMC_Devices" data structure.  If you're unfamiliar with this, the device number is simply the order of your device from top to bottom in SMCView, starting from zero.

Note that the '''step size in um''' is based on ''microsteps'', and not full steps.  Specifically, a microstep in the controller is exactly 1/8 of a full step, so divide accordingly when using this driver.

=== Additional help ===

If you have any further questions about this device adapter, or you have found a bug to report, please contact the author directly by e-mail.
