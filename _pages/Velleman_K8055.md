<table><tr><td>
'''Summary:'''</td><td>Velleman K8055 digital IO board adapter</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman.  </td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Mac/Linux, Windows</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.velleman.be/ot/en/product/view/?id=351346 Velleman K8055/VM110]</td></tr>
<tr><td>'''Example Config File:'''</td><td>[[Media:MMConfig_K8055.cfg]]</td></tr>
</table>

The Velleman K8055 (VM110 for a pre-assembled board) is a low cost digital IO board.  It provides 8 digital out and 2 analogue out channels (as well as analogue and digital in - which are not used here) that can be used for things like  TTLs or AOTF control.  A drawback of this board is its relatively slow switching time (~10 ms).  

The adapter uses a modified version of libk8055 (by Sven Lindberg and others) and libusb.  The adapter provides a switch, a shutter, and 2 DAC outputs.  Each of the 2 DACs can be set to a voltage between 0 and 5.0 V.  The switch determines which of the 8 output channels will be active. The switch is a single byte, each bit in this byte sets the corresponding channel (for instance, the value '3' will set channels 1 and 2).  The shutter will switch the active channels on and off.

{{Note|To use the digital outs, one needs to provide input voltage (5-30V) to the Clamp and Grnd pins on the K8055 board.}}

On Mac OS X you will need to download and unpack [[Media:k8055-utbm-osx-kext.tar.gz]], open a terminal, cd into the directory k8055-utbm-osx-kext, issue the commands below, and reboot:
<pre>
sudo cp -r k8055.kext /System/Library/Extensions/k8055.kext
sudo touch /System/Library
</pre>


On Windows you will need to 'replace' the HID driver with the driver provided in this [http://valelab.ucsf.edu/~MM/drivers/K8055.zip K8055 Driver] folder.  To find out which device is the K8055, open the Device Manager, open the tab "Human Interface Devices" and plug in the K8055.  Two devices should appear, one named "HID-compliant device", the other called "USB Human Interface Device". 

[[Image:DeviceManager.png]]

Double click on the "USB Human Interface Device", select the "Driver" tab and click on "Update Driver". (On Windows 7 we found that we needed to instead right click on the top node and select "Add legacy hardware" and then proceed as follows.) On the first page of the Hardware Configuration Wizard, do not let Windows connect to Windows Update.  On the next page, select "Install from a list or sepcific location(Advanced)". 

[[Image:HardwareUpdate2.png]]

On the next page, select "Don't search.  I will choose the driver to install".
 
[[Image:HardwareUpdate3.png]]

Click on the "Have Disk" button.

[[Image:HwarderUpdate4.png]]

Click "Browse" and go to the directory which contains the downloaded K8055 Driver (link above) files.  Select the file "K8055_libusb.inf".

[[Image:K8055-instruct1.jpg]] 

This should install the appropriate driver.  After finalizing the wizard, your Device Manager should look as follows:

[[Image:DeviceManagerFinal.png]]


--[[User:Nico|Nico]] 18:21, 15 December 2007 (PST)


{{Devices_Sidebar}}
