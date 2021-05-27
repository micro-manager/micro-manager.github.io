{| style="text-align: left"
!Summary:
|Device Adapter for FLIR cameras that use the Spinnaker interface
|- valign="top"
!Available since:
|2019
|}
----

The Spinnaker device adapter was created by [https://www.cairn-research.co.uk CAIRN].   

== Installation ==
For Micro-Manager versions prior to 2021-03-08, download and install the [https://www.cairn-research.co.uk/wp-content/uploads/2019/05/SpinnakerSDK_FULL_1.20.0.15_x64.exe Spinnaker driver from the CAIRN website]. For later Micro-Manager versions (both 1.4 and 2.0-gamma builds), download and install a [https://meta.box.lenovo.com/v/link/view/a1995795ffba47dbbe45771477319cc3 Spinnaker V2 driver] that supports VS2010 (currently, v2.0, 2.1, 2.2, and 2.3; 2.3 is recommended).  

Follow the instructions in this [https://www.cairn-research.co.uk/wp-content/uploads/2019/05/READ-ME-INSTALLATION.pdf pdf on the CAIRN website].  Note that it is not needed to download 2.0-beta3-20181129, newer versions of Micro-Manager (1.4 and 2.0) work as well, and already include the file mmgr_dal_Spinnaker.dll.

RGB8 mode results in RGB images as of build 2021-03-08. BGRa8 mode (preferred for RGB if your camera has it) support as of 2021-03-09.


{{Devices_Sidebar}}
