{| style="text-align: left"
!Summary:
|Device Adapter for Point Grey Research cameras
|- valign="top"
!Author:
| Nico Stuurman
|- valign="top"
|-
!License:
|BSD
|-
!Platforms:
|Windows and (possibly) Linux
|- valign="top"
!Devices:
|Point Grey Research cameras supported by the Flycap2 interface
|-valign="top"
!Available since:
|November 2, 2016
|}
----

== Installation ==
Install the [https://www.ptgrey.com/support/downloads FlyCap2 viewer software] for your OS.  Make sure that the FlyCapture2 software works with your camera.  Copy libiomp5md.dll and FlyCapture2_v100.dll (from the bin or bin64 directory in the FlyCap2 directory) to the Micro-Manager directory (default: C:\Program Files\Micro-Manager).  Make sure that your are using version 2.10.3.266 of the FlyCapture software (older versions like 2.9.3.43 do not work).  Since we are not allowed to re-distribute FlyCapture2_v100.dll, it may well be that 2.10.3.266 is no longer available (in which case you should ask Point Grey for a copy of 2.10.3.266 or re-build the Micro-Manager Point Grey Device adapter against the then available SDK).

You will need an account with PT Grey before you can access the downloads:

[https://flir.app.boxcn.net/v/Flycapture2SDK/folder/80977586241 2.10.3.266 32/64 bit]

== Device Configuration ==
# Open Micromanager.
# You will be prompted to load a configuration file.  To create a new configuration file use "Tools" > "Hardware Configuration Wizard..." to add the camera.  If "Point Grey" is unavailable, there either is no camera attached to the computer, or some software components are missing. Cameras will be listed by their name and serial number.


== Advanced mode (Format 7)  ==
The Point Grey interface and nomenclature build on the IIDC (Firewire) cameras interface.  This dc1394 protocol specifies a "Format 7" that enables advanced features like regions of interest.  For use in Micro-Manager, you almost invariably will want to use Format 7.  This is specified by setting the property "Advanced Mode" in the Hardware Configuration Wizard to "Yes".   

== Binning ==
Even though some Point Grey cameras support binning, there is no generalized interface to binning.  Often, you can change binning by changing the "Mode" of the camera.  Check the documentation of your camera to find out what it does in the various modes that it has available.  Make sure to include the "Mode" property in your pixel size groups.

== Tested with ==
 Chameleon3 CM3-U3-31S4M
 Flea3 FL3-U3-13S2M-CS
 Scorpion CCD SCOR-14SO
 Blackfly BFLY-U3-23S6M-C

== Various ==
* If you do not find the Point Grey adapter in the list in the Hardware Configuration Wizard, please download and install the latest nightly build of Micro-Manager.
* This adapter supports the use of multiple Point Grey cameras.  It has not been tested on Linux (but likely can be made to work on that platform).  
* This adapter only works with the FlyCapture2 interface, i.e. it does not work with the Spinnaker interface).
* In multiple cases, USB3 cameras do not work through a USB3 port.  If you have unexpected behavior, try connecting your camera to a USB2 slot (which will have reduced throughput).  If throughput is important, consult the Point Grey documentation (e.g. [https://www.ptgrey.com/tan/10359 this document recomending USB3 components) and if all fails open a support ticket with Point Grey.

== Camera Characterization ==
Histograms of the per pixel variance of a Hamamatsu ORCA-Flash4.0 v2 camera and 4 different Point Grey GS3-U3-51S5M-C cameras.[[File:gs3_u3_51s5m_c_variance_hist.png]]
The data was acquired at 50Hz in a 512x512 pixel ROI centered on the camera chip. Median values are 0.84e-^2 for the ORCA-Flash4.0 and 2.6e-^2 for the GS3-U3-51S5M-C cameras.
{{Devices_Sidebar}}
