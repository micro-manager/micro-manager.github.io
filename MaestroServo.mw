== Pololu Maestro Servo controller adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to [http://www.pololu.com/docs/0J40/all Pololu Maestro Servo controllers]</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Linux</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.46</td>
<tr><td>'''Serial Port settings'''</td><td>Irrelevant, but set the controller to "USB dual port" first
</table>


This adapter lets you use servos together with your microscope equipment.  We are using this in the lab to move a half wave plate in and out of the laser beam path under computer control (directing laser output to either of two fibers, due to a polarizing beam splitter in the light path).  The adapter has been tested under Windows, but should also work on Linux. 

To use this adapter, first download and install the [http://www.pololu.com/file/download/maestro_windows_100506.zip?file_id=0J266 drivers and control software from Pololu].  Make sure that your servo works with the Pololu software, using their excellent [http://www.pololu.com/docs/0J40/all documentation] as a guide. in the Pololu software, under the "Serial Settings" tab, select "USB Dual Port".  The Pololu will create two additional virtual COM ports on your computer.  In the Micro-Manager Hardware Configuration Manager, select the first of those two ports.  The serial port settings should not matter (but I like to set the baud rate to 57600 anyways;).  Set the minimum and maximum position to something reasonable (this depends on your servo, some servos do not like extreme settings, see the Pololu documentation for details, I use 900-2000).  

<b>Limitations:</b> This adapter is written to work with only a single Maestro controller.  The code also compiles on the Mac, but there does not seem to be a driver that makes the controller appear as a serial port on Mac OS X.


{{Devices_Sidebar}}
