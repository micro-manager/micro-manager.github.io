'''Summary:'''  An adapter for GigE cameras

'''Author:'''  David Marshburn

'''License:'''

'''Platforms:'''  Windows only.

'''Requirements:'''   [http://www.jai.com/EN/CameraSolutions/Download/Pages/JAI_SDK_and_control_tool.aspx JAI SDK and Control Tool]

'''Devices:'''  Many GigE Vision- and GenICam-compliant cameras

'''Example Config File:''' [[Media:GigE-test-config.cfg]]


== About ==
This adapter should work with any GigE Vision- and GenICam-compliant cameras.  The adapter is based on an SDK from [http://www.jai.com/ JAI, Inc.].


== Installation ==

Download and install the [http://www.jai.com/en/support/jai_sdk_and_control_tool JAI SDK and Control Tool]. Get the 32-bit version for 32-bit micro-manager and the 64-bit version for 64-bit micro-manager.

Verify that your camera will work with the adapter by opening your camera first in the JAI Control Tool. You may need to turn off auto exposure and auto gain in order to change the exposure and gain in Micro-Manager (otherwise those properties will appear as read-only).

{{Note|Version mismatch between Micro-Manager and the JAI SDK can lead to subtle/intermittent/camera-dependent issues. If you are using MM 1.4.15 or earlier (or nightly build 20131002 or earlier), use JAI SDK 1.3.0; if you are using nightly build 20131003 or later, use JAI SDK 1.4.1.}}

== Notes ==
When loaded and initialized, the adapter will search for available GigE cameras on the system.  It will select a camera and then query the camera for available properties from among those implemented for micro-manager.

The JAI SDK will find two "cameras" for each physical GigE camera on the system -- the difference is in a virtual network interface.  The cameras will have extremely long names like, "TL=>GevTL , INT=>FD::MAC->00-10-18-61-73-40::Broadcom NetXtreme Gigabit Ethernet , DEV=>::MAC->00-0C-DF-03-02-A1::JAI Ltd., Japan::CM-030GE".  The difference in the two cameras found will be in the "INT=>" part; one will contain, "INT=>FD" and the other will contain, "INT=>SD".  The FD ("filter driver") interface will be chosen by default; that interface seems to avoid conflicts with Windows Firewall.

In the GenICam specification, binning is split into horizontal and vertical binning properties, but there is no unified binning.  To be consistent with the rest of micro-manager, this adapter attempts to present a single binning property in addition to horizontal and vertical binnings.  Be aware that this illusion may break down at times.

== Troubleshooting ==

If micro-manager exits abnormally, the camera may be left in an open state over the GigE network.  If this happens, either subsequent attempts to open the camera will fail or all the parameters/properties will be read-only.  Unplug the camera briefly then wait for the system to find the camera again.


== Unimplemented features ==
* Only monochrome image/pixel formats are implemented.  Packed, Planar, Bayer and various color image formats are not yet implemented.
* Any ROI features requiring action on the part of the device adapter are unimplmemted.
* When switching between cameras, no attempt is made to re-create the properties for the adapter, although existing properties should update correctly.

{{Listserv_Search|GigE}}

{{Devices_Sidebar}}
